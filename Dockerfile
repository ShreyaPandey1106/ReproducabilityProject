FROM python:3.9-slim

WORKDIR /workspace
COPY . .


RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

RUN bash -c "for i in {1..5}; do pip install --no-cache-dir -r requirements.txt && break || sleep 5; done"

EXPOSE 80

ENV NAME=MLOpsLab

CMD ["python", "train.py"]

