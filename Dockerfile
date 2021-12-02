FROM python:3-slim AS builder
# use the minimal packages needed to run Python

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# ADD . /app
# # Copy new files, directories from <src> and adds them to the
# # filesystem of the image at the past <dest>

# WORKDIR /app
# # Set the working directory for any subsequent RUN, CMD, ENTRYPOINT,
# # COPY and ADD instructions

# COPY requirements.txt requirements.txt
# Copy the requirements.txt into our working directory /app

RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:${PATH}" 
# Add this new directory to PATH
COPY requirements.txt requirements.txt
RUN pip --disable-pip-version-check install -r requirements.txt
# Install required dependencies listed in requirements.txt
# into the app source dir.

FROM gcr.io/distroless/python3-debian10
# Initialize a new build stage and set distroless container image
# as base for subsequent instructions.

# COPY --from=builder /app /app
# copy newfiles and directories from <src> and add them to the
## filesystem of the **container** at the path <dest>

# WORKDIR /app

# ENV PYTHONPATH /app
COPY . .

# CMD ["/app/main.py"]
CMD ["main.py"]
# Provide defaults for an executing container.