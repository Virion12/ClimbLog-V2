from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse, StreamingResponse
from ultralytics import YOLO
import numpy as np
import torch
import logging
from io import BytesIO
import cv2
from pydantic import BaseModel, Field
from app.services.ai_service import get_ai_service

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="YOLO11 Segmentation + Training Plan API")

model = None
device = None
TRAIN_IMG_SIZE = None
CONF_THRESHOLD = 0.7

@app.on_event("startup")
async def load_model():
    global model, device, TRAIN_IMG_SIZE
    try:
        device = 'cuda' if torch.cuda.is_available() else 'cpu'
        logger.info(f"Używane urządzenie: {device}")
        
        if torch.cuda.is_available():
            logger.info(f"GPU: {torch.cuda.get_device_name(0)}")
            logger.info(f"CUDA Version: {torch.version.cuda}")
            logger.info(f"Pamięć GPU: {torch.cuda.get_device_properties(0).total_memory / 1024**3:.2f} GB")
        else:
            logger.warning("CUDA nie jest dostępne! Używam CPU.")
        
        model = YOLO("Model/best.pt")
        model.to(device)
        
        if hasattr(model, 'yaml'):
            TRAIN_IMG_SIZE = model.yaml.get('img_size') or model.yaml.get('imgsz') or 640
        else:
            TRAIN_IMG_SIZE = 640
        
        logger.info(f"Rozmiar obrazu treningowego: {TRAIN_IMG_SIZE}")
        
        dummy_img = np.zeros((TRAIN_IMG_SIZE, TRAIN_IMG_SIZE, 3), dtype=np.uint8)
        _ = model(dummy_img, verbose=False)
        logger.info("✅ Model YOLO gotowy!")
        
        # Ładuj DeepSeek
        logger.info("🔄 Ładuję DeepSeek...")
        get_ai_service()
        logger.info("✅ Wszystkie modele gotowe!")
        
    except Exception as e:
        logger.error(f"Błąd podczas ładowania modelu: {e}")
        raise

@app.get("/")
async def root():
    return {
        "message": "YOLO11 Segmentation + Training Plan API",
        "status": "running",
        "device": device,
        "cuda_available": torch.cuda.is_available()
    }

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    if model is None:
        raise HTTPException(status_code=503, detail="Model nie jest załadowany")
    
    try:
        contents = await file.read()
        nparr = np.frombuffer(contents, np.uint8)
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        if img is None:
            raise HTTPException(status_code=400, detail="Nie można wczytać obrazu")

        results = model.predict(
            img,
            imgsz=TRAIN_IMG_SIZE,
            conf=CONF_THRESHOLD,
            device=device,
            verbose=False
        )

        predictions = []
        for result in results:
            if result.masks is not None and result.masks.xy is not None:
                for i, mask_xy in enumerate(result.masks.xy):
                    box = result.boxes.xyxy[i]
                    cls = int(result.boxes.cls[i].item())
                    confidence = float(result.boxes.conf[i].item())
                    predictions.append({
                        "class_id": cls,
                        "class_name": result.names[cls],
                        "confidence": confidence,
                        "bbox": {
                            "x1": float(box[0]),
                            "y1": float(box[1]),
                            "x2": float(box[2]),
                            "y2": float(box[3])
                        },
                        "mask_xy": mask_xy.tolist()
                    })

        return JSONResponse(content={
            "success": True,
            "device_used": device,
            "predictions_count": len(predictions),
            "predictions": predictions,
            "image_shape": {
                "height": img.shape[0],
                "width": img.shape[1],
                "channels": img.shape[2]
            }
        })

    except Exception as e:
        logger.error(f"Błąd podczas przetwarzania: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Błąd podczas przetwarzania: {str(e)}")

@app.post("/test_masks")
async def test_masks(file: UploadFile = File(...)):
    if model is None:
        raise HTTPException(status_code=503, detail="Model nie jest załadowany")

    try:
        contents = await file.read()
        nparr = np.frombuffer(contents, np.uint8)
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        if img is None:
            raise HTTPException(status_code=400, detail="Nie można wczytać obrazu")

        results = model.predict(
            img,
            imgsz=TRAIN_IMG_SIZE,
            conf=CONF_THRESHOLD, 
            device=device,
            verbose=False
        )
        overlay = img.copy()

        for result in results:
            if result.masks is not None and result.masks.xy is not None:
                for i, mask_xy in enumerate(result.masks.xy):
                    if mask_xy is None or len(mask_xy) == 0:
                        continue
                    pts = np.array(mask_xy, np.int32).reshape((-1, 1, 2))
                    cv2.polylines(overlay, [pts], isClosed=True, color=(0, 255, 0), thickness=2)

                    cls_id = int(result.boxes.cls[i].item())
                    cls_name = result.names[cls_id]
                    confidence = float(result.boxes.conf[i].item())
                    x, y = int(pts[0][0][0]), int(pts[0][0][1])
                    cv2.putText(overlay, f"{cls_name} {confidence:.2f}", (x, y-10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0,0,255), 2)

        _, buffer = cv2.imencode(".png", overlay)
        return StreamingResponse(BytesIO(buffer.tobytes()), media_type="image/png")

    except Exception as e:
        logger.error(f"Błąd podczas przetwarzania obrazu w /test_masks: {e}")
        raise HTTPException(status_code=500, detail=f"Błąd podczas przetwarzania: {str(e)}")


# --- NOWE: Training Plan Endpoints ---

class TrainingPlanRequest(BaseModel):
    prompt: str = Field(..., description="Opis potrzeb treningowych")

class TrainingPlanResponse(BaseModel):
    plan: str

@app.post("/generate-training-plan", response_model=TrainingPlanResponse)
async def generate_training_plan(request: TrainingPlanRequest):
    """
    Generuje spersonalizowany plan treningowy używając DeepSeek 7B
    
    Przykład:
    {
        "prompt": "Chcę zbudować masę. 2 lata doświadczenia, pełna siłownia, 4x tydzień po 90min. Waga 75kg, wzrost 178cm. Cel: +8kg w 4 miesiące."
    }
    """
    try:
        ai_service = get_ai_service()
        plan = ai_service.generate_training_plan(request.prompt)
        return TrainingPlanResponse(plan=plan)
    except Exception as e:
        logger.error(f"❌ Błąd: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))