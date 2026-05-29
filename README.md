# Pearl Miner Docker Container

This repository contains a Docker container setup for running the Pearl Miner with NVIDIA GPU support.

## Features

- **Ubuntu Base Image**: Latest Ubuntu as the base operating system
- **NVIDIA Driver Support**: Latest NVIDIA drivers pre-installed for GPU acceleration
- **Automated Build**: GitHub Actions automatically builds and publishes the container on every commit to `main`
- **Container Registry**: Published to GitHub Container Registry (GHCR)

## Building Locally

To build the Docker image locally:

```bash
docker build -t pearl-miner .
```

## Running the Container

To run the container:

```bash
docker run --gpus all pearl-miner
```

For GPU support, ensure you have the NVIDIA Container Runtime installed on your host.

## GitHub Actions Workflow

The repository includes an automated GitHub Actions workflow that:

1. Triggers on every push to the `main` branch
2. Builds the Docker image
3. Publishes it to GitHub Container Registry (GHCR) with the following tags:
   - `latest` - Always points to the latest build
   - `main` - Current branch tag
   - `main-<short-sha>` - Commit-specific tag
   - Semantic version tags (if using git tags)

## Pulling from Container Registry

To pull the published image:

```bash
docker pull ghcr.io/tjcheyne/pearl:latest
```

## Configuration

The container automatically downloads and runs Pearl Miner with the following configuration:
- **Host**: `84.32.220.219:9000`
- **User**: `prl1pwlchkm6adjald56p0vaa83dtrkp9qk8xezw8tmtafkca5z50juqqyaukta`

To use different parameters, you can override the command:

```bash
docker run --gpus all ghcr.io/tjcheyne/pearl:latest ./pearl-miner --host your-host:port --user your-address
```

## Requirements

- Docker
- NVIDIA Docker Runtime (for GPU support)
- NVIDIA GPU (recommended for mining)

## License

See LICENSE file for details.
