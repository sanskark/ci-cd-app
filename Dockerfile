FROM python:3.13-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

ENV APP_VERSION=1.0

EXPOSE 500

CMD ["python", "app.py"]
