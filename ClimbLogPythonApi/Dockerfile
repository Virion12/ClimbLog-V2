FROM continuumio/miniconda3:latest

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive

# --- System dependencies ---
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libgl1-mesa-glx \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


COPY requirements.txt .


RUN conda create -n yolo python=3.10 -y && \
    conda run -n yolo pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128 && \
    conda run -n yolo pip install --no-cache-dir -r requirements.txt

# --- Copy application code ---
COPY ./app ./app
COPY ./Model ./Model

EXPOSE 8000

# --- Start FastAPI ---
CMD ["conda", "run", "-n", "yolo", "--no-capture-output", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
