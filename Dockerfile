# Use an official Python runtime as the base image
FROM python:3.11.2

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the container and install the Python dependencies
COPY requirements.txt ./flask

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY ./flask .

# Expose the port that your Flask application will be running on (change 5000 to the appropriate port if needed)
EXPOSE 5000

# Set the environment variable to run the Flask application
ENV FLASK_APP=app.py

# Command to run your Flask application
ENTRYPOINT python app.py


