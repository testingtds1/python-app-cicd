# Use a lightweight and stable Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only requirements first (optimizes Docker layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .
COPY test_app.py .

# Expose the application port (optional, for app running on port 5000)
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]

