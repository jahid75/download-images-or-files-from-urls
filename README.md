# Download all files/images from a list of URLs in a text file.
If you have a list of file or image URLs in a text file, you can download all of them to your PC with just one command. 

You have to list all URLs in a text file like below, every url in new line.

```
https://example.com/path/file.jpg
https://example.com/path/file.jpg
https://example.com/path/file.jpg
https://example.com/path/file.jpg
...
```

# Using wget: 
If you don't have `wget` installed on your PC. You can install it using a package manager like apt on Ubuntu/Debian:
```
sudo apt-get update
sudo apt-get install wget
```
Then, create a file called `download_files.sh`. You can name it anything, but the extension should be `.sh`, then put the code below into that file and save.

```
#!/bin/bash

# File containing list of URLs
URL_FILE="urls.txt"

# Directory to save downloaded images
DOWNLOAD_DIR="downloaded_images"

# Create directory if it does not exist
mkdir -p $DOWNLOAD_DIR

# Read URLs from file and download each one
while IFS= read -r url; do
    wget -P $DOWNLOAD_DIR "$url"
done < "$URL_FILE"
```

# Using curl: 
If you don't have `curl` installed on your PC. You can install it using a package manager like apt on Ubuntu/Debian:
```
sudo apt-get update
sudo apt-get install curl
```
Then, create a file called `download_files.sh`. You can name it anything, but the extension should be `.sh`, then put the code below into that file and save.

```
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
```

## In both cases (wget or curl)
Where you have created the file `download_files.sh`, keep the URLs in `urls.txt` file in the same directory. 

## Run the script to start downloading
Run this command in your terminal from the same directory.
```
chmod +x download_images.sh
./download_images.sh
```
