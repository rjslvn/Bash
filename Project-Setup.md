
```markdown
# Project Setup Script

This script is designed to automate the setup of project directories and handle relative paths in a consistent manner. When run, it checks for the existence of necessary directories and creates them if they don't exist. It also demonstrates how to use relative paths to run scripts or download files into the correct directories, regardless of where the script is executed from.

## Usage

Save this script as `setup.sh` in your project root. Run the script using the command:

```bash
bash setup.sh
```

This will ensure your project directories are correctly set up and can serve as a starting point for more complex setup operations.

---

```bash
#!/bin/bash

# Get the directory of the current script
# This allows the script to be run from any location and
# keeps relative paths consistent.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Function to create a directory if it doesn't exist
# Accepts one argument: the directory path
function create_dir() {
    local dir=$1  # Local variable to hold the directory path argument
    if [[ ! -e $dir ]]; then  # Check if directory does not exist
        mkdir -p $dir  # Create directory and any necessary parent directories
        echo "Directory $dir created."  # Notify user of directory creation
    else
        echo "Directory $dir already exists."  # Notify user if directory already exists
    fi
}

# Create directories relative to the script's location
# This ensures consistency regardless of where the script is run from.
create_dir "$DIR/data"  # Create a 'data' directory
create_dir "$DIR/models"  # Create a 'models' directory
create_dir "$DIR/output"  # Create an 'output' directory

# Demonstration of how to use the script's directory for relative paths
# Navigate to a 'src' directory at the same level as this script:
cd "$DIR/../src"

# Run a Python script in the 'src' directory:
python "$DIR/../src/your_script.py"

# Download files to the 'data' directory:
curl -o "$DIR/data/your_file.txt" "http://example.com/your_file.txt"

# ... and any other operations you need to perform.
```

In this script:

- The `DIR` variable is crucial as it holds the directory where the script is located, serving as a base for all relative paths.
- The `create_dir` function checks for the existence of a directory and creates it if necessary, notifying the user of either outcome.
- Examples of how to use the `DIR` variable for relative path operations, such as changing directories, running scripts, or downloading files are provided.
