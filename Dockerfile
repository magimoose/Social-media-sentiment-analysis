# Dockerfile for running the entire project
# This Dockerfile uses docker-compose to orchestrate all services
FROM docker/compose:latest

# Install docker CLI
RUN apk add --no-cache docker-cli

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Expose all service ports
EXPOSE 10001 10002 10003 3000 3001 5432

# Default command to start all services
CMD ["docker-compose", "up"]
