#!/bin/bash

# Set the directory containing your images
input_dir="./fulls/"

# Set the output directory for thumbnails
output_dir="./thumbs/"

# Set the thumbnail size as 1/10th of the original size
thumbnail_size="10%"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Loop through each image file in the input directory
for image in "$input_dir"*.*; do
    # Check if the file is an image
    if [ -f "$image" ]; then
        # Get the filename without the path
        filename=$(basename "$image")
        
        # Generate the thumbnail using GraphicsMagick
        gm convert "$image" -resize "$thumbnail_size" "$output_dir$filename"
        
        echo "Created thumbnail for $filename"
    fi
done
