# Use Python base image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency file and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application code
COPY . .

# Command to run the application when the container starts
CMD ["python", "app.py"]