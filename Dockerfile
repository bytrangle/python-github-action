FROM python:3-slim AS builder
# use the minimal packages needed to run Python

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# ADD . /app
# Copy new files, directories from <src> and adds them to the
# filesystem of the image at the past <dest>

# WORKDIR /app
# Set the working directory for any subsequent RUN, CMD, ENTRYPOINT,
# COPY and ADD instructions

COPY requirements.txt .
# Copy the requirements.txt into our working directory /app

# RUN useradd --create-home appuser
# WORKDIR /home/appuser
# USER appuser
# ENV PATH="/home/appuser/.local/bin:${PATH}" 
# # Add this new directory to PATH
# COPY requirements.txt .
RUN pip --disable-pip-version-check install -r requirements.txt
# Install required dependencies listed in requirements.txt
# into the app source dir.

# Run the application
COPY main.py .
CMD ["python", "main.py"]
# Provide defaults for an executing container.