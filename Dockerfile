FROM ubuntu:latest

# Update package manager and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add NVIDIA GPG key and repository
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/3bf863cc.pub

RUN echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64 /" > /etc/apt/sources.list.d/cuda.list

# Install NVIDIA drivers and CUDA toolkit
RUN apt-get update && apt-get install -y \
    cuda-drivers \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Download and set up pearl-miner
RUN curl https://pearlhash.xyz/downloads/pearl-miner-v8 -o pearl-miner && \
    chmod +x pearl-miner

# Run the pearl-miner with specified host and user
CMD ["./pearl-miner", "--host", "84.32.220.219:9000", "--user", "prl1pwlchkm6adjald56p0vaa83dtrkp9qk8xezw8tmtafkca5z50juqqyaukta"]
