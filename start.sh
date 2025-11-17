#!/bin/bash

# Start script for Data Science Project 2025 Group 1
# This script helps you start the social media sentiment analysis application

set -e  # Exit on error

echo "======================================"
echo "Starting Data Science Project..."
echo "======================================"
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed."
    echo "Please install Docker from: https://docs.docker.com/engine/install/"
    exit 1
fi

# Check if Docker Compose is available
if ! docker compose version &> /dev/null; then
    echo "❌ Error: Docker Compose is not available."
    echo "Please install Docker Compose."
    exit 1
fi

# Check for required .env files
echo "Checking for required configuration files..."
ENV_MISSING=0

if [ ! -f "./reddit-backend/.env" ]; then
    echo "⚠️  Warning: ./reddit-backend/.env not found"
    echo "   Please create it with: REDDIT_APP_SECRET, REDDIT_APP_NAME, REDDIT_APP_ID, ML_URL"
    ENV_MISSING=1
fi

if [ ! -f "./yt-backend/.env" ]; then
    echo "⚠️  Warning: ./yt-backend/.env not found"
    echo "   Please create it with: YOUTUBE_KEY, ML_URL"
    ENV_MISSING=1
fi

if [ $ENV_MISSING -eq 1 ]; then
    echo ""
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 1
    fi
fi

echo ""
echo "✅ Starting services with Docker Compose..."
echo ""

# Build and start the containers
docker compose up --build

# Note: The script will keep running until you press Ctrl+C
# When you stop it, the containers will be stopped
