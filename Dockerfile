FROM python:3.10

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir notebook

# Download and extract ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz

# Set ngrok authtoken
RUN ./ngrok authtoken 2ep0210cJIyyFj5U0A4nCrGayCF_5cPgMxFrSE2BNNE32LnsE

# Set command to run on container start
CMD ./ngrok http 8888 & python3 -m notebook --ip=0.0.0.0 --allow-root


# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    libnss3 \
    libgconf-2-4 \
    libfontconfig1 \
    libxrender1 \
    libxss1

# Download and install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN gdebi --n google-chrome-stable_current_amd64.deb
