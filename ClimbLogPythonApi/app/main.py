from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from ultralytics import YOLO
import cv2
import numpy as np
import torch
from PIL import Image
import io
from typing import List, Dict
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="YOLO11 Segmentation API with CUDA")

model = None
device = None

@app.on_event("startup")
async def load_model():
    global model, device
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
        
        logger.info("Model YOLO11 załadowany pomyślnie!")
        
        dummy_img = np.zeros((640, 640, 3), dtype=np.uint8)
        _ = model(dummy_img, verbose=False)
        logger.info("Model rozgrzany i gotowy do użycia!")
        
    except Exception as e:
        logger.error(f"Błąd podczas ładowania modelu: {e}")
        raise

@app.get("/")
async def root():
    return {
        "message": "YOLO11 Segmentation API with CUDA",
        "status": "running",
        "device": device,
        "cuda_available": torch.cuda.is_available()
    }

@app.get("/health")
async def health_check():
    gpu_info = {}
    if torch.cuda.is_available():
        gpu_info = {
            "gpu_name": torch.cuda.get_device_name(0),
            "gpu_memory_allocated": f"{torch.cuda.memory_allocated(0) / 1024**3:.2f} GB",
            "gpu_memory_reserved": f"{torch.cuda.memory_reserved(0) / 1024**3:.2f} GB",
            "gpu_memory_total": f"{torch.cuda.get_device_properties(0).total_memory / 1024**3:.2f} GB"
        }
    
    return {
        "status": "healthy",
        "model_loaded": model is not None,
        "device": device,
        "cuda_available": torch.cuda.is_available(),
        "pytorch_version": torch.__version__,
        "cuda_version": torch.version.cuda if torch.cuda.is_available() else None,
        **gpu_info
    }

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    """
    Endpoint do predykcji segmentacji na przesłanym obrazie (używa GPU)
    """
    if model is None:
        raise HTTPException(status_code=503, detail="Model nie jest załadowany")
    
    try:
        contents = await file.read()
        nparr = np.frombuffer(contents, np.uint8)
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        
        if img is None:
            raise HTTPException(status_code=400, detail="Nie można wczytać obrazu")
        
        with torch.cuda.amp.autocast():  
            results = model(img, verbose=False)
        
        predictions = []
        for result in results:
            if result.masks is not None:
                for i, (mask, box, conf, cls) in enumerate(zip(
                    result.masks.data,
                    result.boxes.xyxy,
                    result.boxes.conf,
                    result.boxes.cls
                )):
                    predictions.append({
                        "class_id": int(cls),
                        "class_name": result.names[int(cls)],
                        "confidence": float(conf),
                        "bbox": {
                            "x1": float(box[0]),
                            "y1": float(box[1]),
                            "x2": float(box[2]),
                            "y2": float(box[3])
                        },
                        "mask_shape": list(mask.cpu().numpy().shape)
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

@app.post("/predict/detailed")
async def predict_detailed(
    file: UploadFile = File(...),
    conf_threshold: float = 0.25,
    iou_threshold: float = 0.7,
    img_size: int = 640
):
    """
    Endpoint z bardziej szczegółowymi opcjami predykcji (GPU accelerated)
    """
    if model is None:
        raise HTTPException(status_code=503, detail="Model nie jest załadowany")
    
    try:
        contents = await file.read()
        nparr = np.frombuffer(contents, np.uint8)
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        
        if img is None:
            raise HTTPException(status_code=400, detail="Nie można wczytać obrazu")
        
        with torch.cuda.amp.autocast():
            results = model.predict(
                img,
                conf=conf_threshold,
                iou=iou_threshold,
                imgsz=img_size,
                verbose=False,
                device=device
            )
        
        predictions = []
        for result in results:
            if result.masks is not None:
                masks_array = result.masks.data.cpu().numpy()
                
                for i, (box, conf, cls) in enumerate(zip(
                    result.boxes.xyxy,
                    result.boxes.conf,
                    result.boxes.cls
                )):
                    mask = masks_array[i]
                    
                    predictions.append({
                        "id": i,
                        "class_id": int(cls),
                        "class_name": result.names[int(cls)],
                        "confidence": float(conf),
                        "bbox": {
                            "x1": float(box[0]),
                            "y1": float(box[1]),
                            "x2": float(box[2]),
                            "y2": float(box[3]),
                            "width": float(box[2] - box[0]),
                            "height": float(box[3] - box[1])
                        },
                        "mask_shape": list(mask.shape),
                        "mask_area_pixels": int(np.sum(mask > 0.5))
                    })
        
        gpu_stats = {}
        if torch.cuda.is_available():
            gpu_stats = {
                "memory_allocated_mb": f"{torch.cuda.memory_allocated(0) / 1024**2:.2f}",
                "memory_reserved_mb": f"{torch.cuda.memory_reserved(0) / 1024**2:.2f}"
            }
        
        return JSONResponse(content={
            "success": True,
            "device_used": device,
            "parameters": {
                "confidence_threshold": conf_threshold,
                "iou_threshold": iou_threshold,
                "image_size": img_size
            },
            "predictions_count": len(predictions),
            "predictions": predictions,
            "image_info": {
                "height": img.shape[0],
                "width": img.shape[1],
                "channels": img.shape[2]
            },
            "gpu_stats": gpu_stats
        })
        
    except Exception as e:
        logger.error(f"Błąd podczas przetwarzania: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Błąd podczas przetwarzania: {str(e)}")

@app.post("/predict/batch")
async def predict_batch(files: List[UploadFile] = File(...)):
    """
    Endpoint do przetwarzania wielu obrazów jednocześnie (batch processing)
    """
    if model is None:
        raise HTTPException(status_code=503, detail="Model nie jest załadowany")
    
    if len(files) > 10:
        raise HTTPException(status_code=400, detail="Maksymalnie 10 obrazów na raz")
    
    try:
        all_results = []
        
        for idx, file in enumerate(files):
            contents = await file.read()
            nparr = np.frombuffer(contents, np.uint8)
            img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
            
            if img is None:
                all_results.append({
                    "file_name": file.filename,
                    "success": False,
                    "error": "Nie można wczytać obrazu"
                })
                continue
            
            with torch.cuda.amp.autocast():
                results = model(img, verbose=False)
            
            predictions = []
            for result in results:
                if result.masks is not None:
                    for i, (box, conf, cls) in enumerate(zip(
                        result.boxes.xyxy,
                        result.boxes.conf,
                        result.boxes.cls
                    )):
                        predictions.append({
                            "class_id": int(cls),
                            "class_name": result.names[int(cls)],
                            "confidence": float(conf)
                        })
            
            all_results.append({
                "file_name": file.filename,
                "success": True,
                "predictions_count": len(predictions),
                "predictions": predictions
            })
        
        return JSONResponse(content={
            "success": True,
            "device_used": device,
            "total_images": len(files),
            "results": all_results
        })
        
    except Exception as e:
        logger.error(f"Błąd podczas przetwarzania batch: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Błąd: {str(e)}")