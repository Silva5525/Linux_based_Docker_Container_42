#!/bin/bash

# Replace with your actual GitHub token
GITHUB_TOKEN="your actual GitHub token"

# Export the token to the environment
export GITHUB_TOKEN

# Build and run the Docker container
docker-compose up --build
