#!/bin/bash

# Get the directory of the current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Function to create directory if it doesn't exist
function create_dir() {
    local dir=$1
    if [[ ! -e $dir ]]; then
        mkdir -p $dir
        echo "Directory $dir created."
    else
        echo "Directory $dir already exists."
    fi
}

# Create directories
create_dir "$DIR/data"
create_dir "$DIR/models"
create_dir "$DIR/output"

# Now you can use relative paths based on the script's directory
# For instance, to navigate to a 'src' directory at the same level as this script:
cd "$DIR/../src"

# To run a Python script in the 'src' directory:
python "$DIR/../src/your_script.py"

# To download files to the 'data' directory:
curl -o "$DIR/data/your_file.txt" "http://example.com/your_file.txt"

# ... and so on
