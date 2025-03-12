# Use an official Python runtime as a base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY fun_fact_generator.py .

# Install required dependencies
RUN pip install --no-cache-dir pywebio requests

# Expose the port PyWebIO will run on
EXPOSE 8080

# Command to run the application
CMD ["python", "fun_fact_generator.py"]

