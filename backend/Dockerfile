# Use the official Python base image with the desired version
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Set the environment variables, if needed
# ENV ENV_VAR_NAME=value

# Expose the desired port(s)
EXPOSE 8000

# Set the command to run the application
CMD ["python", "app.py"]
