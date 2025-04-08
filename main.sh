#!/bin/bash


# Check if HTTrack is installed
if ! command -v httrack &> /dev/null
then
    echo "httrack could not be found. Please install httrack to use this script."
    exit
fi


# Didn't provide the URL
if [ -z "$1" ]
then
    echo "Usage: $0 <URL>"
    exit 1
fi


# Use HTTrack to clone the website
httrack "$1" -O "$(basename "$1")" -%v
echo "Website cloned to $(basename "$1").. Removing Framer badge..."


# Remove Framer branding
find "$(basename "$1")" -type f -name "*.html" -exec sed -i '/<div class="framer-badge-container"><\/div>/d' {} \;
echo "Framer badge removed from all files. Enjoy!"

