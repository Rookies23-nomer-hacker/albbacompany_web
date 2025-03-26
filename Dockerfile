FROM python:3.7-slim

WORKDIR /app
COPY app.py /app/

RUN apt-get update && apt-get install -y \
    && pip install flask \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["python", "app.py"]
