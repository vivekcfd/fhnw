
FROM python:3.10

WORKDIR /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    libffi-dev \
    libatlas-base-dev \
    liblapack-dev \
    libblas-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip --root-user-action=ignore

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Render's default port
EXPOSE 10000

# Start Voila on Render's PORT
CMD ["sh", "-c", "voila --port=$PORT --no-browser --Voila.ip=0.0.0.0 exp01_htc.ipynb"]
