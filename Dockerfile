FROM ubuntu:latest

# Update package manager and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    ca-certificates \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install NVIDIA drivers using ubuntu drivers
RUN apt-get update && apt-get install -y \
    ubuntu-drivers-common \
    && rm -rf /var/lib/apt/lists/*

# Install latest NVIDIA drivers
RUN apt-get update && apt-get install -y \
    nvidia-driver-550 \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Download and set up pearl-miner
RUN curl -L https://pearlhash.xyz/downloads/pearl-miner-v8 -o pearl-miner && \
    chmod +x pearl-miner

# Run the pearl-miner with specified host and user
CMD ["./pearl-miner", "--host", "84.32.220.219:9000", "--user", "prl1pwlchkm6adjald56p0vaa83dtrkp9qk8xezw8tmtafkca5z50juqqyaukta"]
