FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, git, and other dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && ln -s /usr/bin/python3.9 /usr/local/bin/python

RUN apt-get install ffmpeg libsm6 libxext6 -y

# Update pip
RUN pip3 install --upgrade pip

# Copy requirements.txt into the container
COPY requirements.txt /app/requirements.txt

# Install other dependencies from requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt

# Install local package
# RUN pip3 install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
# Clone the taming-transformers repository
RUN git clone --depth 1 https://github.com/CompVis/taming-transformers.git
# Change to the directory and install the package
WORKDIR taming-transformers
RUN pip install -e .
# Change back to a standard working directory
WORKDIR /app

RUN pip3 install -e git+https://github.com/openai/CLIP.git@main#egg=clip

# Copy your local package into the container
# COPY ./setup.py /app/setup.py
# RUN pip3 install -e .

# Bash
CMD ["/bin/bash"]
