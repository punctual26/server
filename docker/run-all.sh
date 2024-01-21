#!/bin/bash

# Specify the directory where your Docker services are located
DOCKER_SERVICES_DIR="/path/to/your/docker/services"

# Change to the Docker services directory
cd "$DOCKER_SERVICES_DIR" || exit

# Find all directories (each containing a Docker service) and run docker-compose
for service_dir in */; do
    if [ -f "${service_dir}compose.yml" ]; then
        echo "Running Docker service in ${service_dir}..."
        docker-compose -f "${service_dir}compose.yml" up -d
    else
        echo "Skipping ${service_dir} - no compose.yml found."
    fi
done

echo "All Docker services started successfully."
