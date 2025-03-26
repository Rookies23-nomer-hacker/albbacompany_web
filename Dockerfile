FROM python:3.7-slim-buster

WORKDIR /app

COPY app.py /app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gnupg2 curl \
    && curl -fsSL https://ftp-master.debian.org/keys/archive-key-10.asc | gpg --dearmor -o /usr/share/keyrings/debian-archive-keyring.gpg \
    && curl -fsSL https://ftp-master.debian.org/keys/archive-key-10-security.asc | gpg --dearmor -o /usr/share/keyrings/debian-security-archive-keyring.gpg \
    && apt-get update \
    && pip install flask \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["python", "app.py"]
