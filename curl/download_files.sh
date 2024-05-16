#!/bin/bash

# File containing list of URLs
URL_FILE="urls.txt"

# Directory to save downloaded images
DOWNLOAD_DIR="downloaded_images"

# Create directory if it does not exist
mkdir -p $DOWNLOAD_DIR

# Read URLs from file and download each one
while IFS= read -r url; do
    curl -o $DOWNLOAD_DIR/$(basename "$url") "$url"
done < "$URL_FILE"
