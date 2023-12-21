# Use an official TensorFlow runtime as a parent image
FROM tensorflow/tensorflow:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt -I

# Make port 80 available to the world outside this container
EXPOSE 3000

# Define environment variable
ENV TF_MODEL tf-model/model.h5
ENV PRODUCTION true

# Run app.py when the container launches
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:3000", "app:app"]
