#! /usr/bin/env bash

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Dependencies
uv sync --torch-backend=auto

# Install pre-commit hooks
uv run pre-commit install --install-hooks
