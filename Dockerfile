# Use a minimal base image with Python
FROM python:3.11-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Download the installer script
RUN curl -O https://raw.githubusercontent.com/Radiicall/jellyfin-rpc/main/installer.py

# Run the installer script
RUN python3 installer.py

# Create a directory for the config file
RUN mkdir -p /config

# Expose the port your app runs on (default for Jellyfin-RPC)
EXPOSE 3000

# Command to run the application
CMD ["jellyfin-rpc", "--config", "/config/main.json"]
