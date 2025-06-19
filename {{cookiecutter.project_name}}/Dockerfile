# Use the image from the NVIDIA container registry
FROM nvcr.io/nvidia/cuda:12.8.1-cudnn-devel-ubuntu20.04

# Add all necessary paths to PATH
ENV PATH=/opt/venv/bin:/root/.local/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/nvidia/lib64 \
    VIRTUAL_ENV=/opt/venv

# Download the git and curl, and verify uv installer, then install uv
RUN apt-get update && apt-get install -y git curl jq && \
    curl -LsSf https://github.com/astral-sh/uv/releases/download/0.7.11/uv-installer.sh > install.sh && \
    echo "01b1e200d158a482a40819729ac910fd5de7334f4fd5a511cdde7967d8cd090a install.sh" | sha256sum --check && \
    bash install.sh && \
    rm install.sh && \
    uv venv /opt/venv --python 3.10.14

# Copy the `pyproject.toml` into the image
COPY pyproject.toml .

# Install dependencies only
RUN uv sync --torch-backend=auto --no-install-project
