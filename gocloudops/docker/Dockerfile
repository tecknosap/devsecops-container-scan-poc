# Use an official Python runtime as a parent image
FROM python:3.9

# Create a non-root user
RUN adduser --disabled-password --gecos "" appuser

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy dependencies first for better layer caching
COPY app/requirements.txt .

# Install dependencies as root before switching users
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Change to non-root user
USER appuser

# Expose the port the app runs on
EXPOSE 3000

# Run the application
CMD ["python", "app/app.py"]