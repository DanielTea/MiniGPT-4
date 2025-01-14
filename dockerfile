# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
# WORKDIR /

# Install git, wget, and Conda
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git wget build-essential libjpeg-dev zlib1g-dev python3-dev
    

# Clone the MiniGPT-4 repository
RUN git clone https://github.com/DanielTea/MiniGPT-4.git && \
    ls && \
    cd MiniGPT-4 && \
    ls

WORKDIR /MiniGPT-4

# Download the pretrained model file (replace with the correct URL)
RUN wget https://huggingface.co/wangrongsheng/MiniGPT4-7B/resolve/main/prerained_minigpt4_7b.pth && \ 
    ls

# Copy the requirements file into the container at /app
# COPY requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 80 available to the world outside this container
# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV PORT 8080

# Define environment variable
ENV NAME World

# Run the application when the container launches
CMD ["python", "demo.py"]