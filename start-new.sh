#!/bin/bash

# ======================== Script Metadata ========================
# Script for setting up a project environment with dynamic folder 
# creation and relative path mapping. It also checks for necessary 
# dependencies, initializes a virtual environment, and prompts 
# for project information.
# =================================================================

# Helper function to check for command existence
check_command() {
    command -v "$1" >/dev/null 2>&1 || { echo >&2 "$1 is required but it's not installed. Aborting."; exit 1; }
}

# Check for necessary commands
check_command python3
check_command pip3
check_command virtualenv
check_command curl
check_command lynx

# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create project folders
mkdir -p "$DIR/src"
mkdir -p "$DIR/docs"

# Check and create virtual environment
if [[ ! -d "$DIR/venv" ]]; then
    virtualenv -p python3 "$DIR/venv"
fi

# Activate virtual environment
source "$DIR/venv/bin/activate"

# Install dependencies if requirements.txt exists
if [[ -f "$DIR/requirements.txt" ]]; then
    pip install -r "$DIR/requirements.txt"
fi

# Initialize .env file if not exists
if [[ ! -f "$DIR/.env" ]]; then
    touch "$DIR/.env"
fi

# Prompt for project name
echo -n "Enter project name: "
read PROJECT_NAME

# Prompt for GitHub repo link
echo -n "Enter GitHub repo link (leave blank if none): "
read GH_REPO_LINK

# Prompt for web documentation link
echo -n "Enter web documentation link (leave blank if none): "
read DOC_LINK

# Save project name and GitHub repo link to .env file
echo "PROJECT_NAME=$PROJECT_NAME" > "$DIR/.env"
if [[ ! -z $GH_REPO_LINK ]]; then
    echo "GH_REPO_LINK=$GH_REPO_LINK" >> "$DIR/.env"
fi

# Fetch web documentation and save as text if link is provided
if [[ ! -z $DOC_LINK ]]; then
    # Use curl to fetch the webpage
    curl -s $DOC_LINK -o "$DIR/docs/web_documentation.html"
    
    # Convert HTML to plain text (requires lynx)
    lynx -dump "$DIR/docs/web_documentation.html" > "$DIR/docs/web_documentation.txt"
    echo "Web documentation saved as text."
fi

# Simple GPT-3 integration to generate a greeting message for the project
GPT3_RESPONSE=$(curl -s -X POST -H "Authorization: Bearer Your-OpenAI-API-key" -H "Content-Type: application/json" \
    -d '{"prompt": "Create a greeting message for a project named '$PROJECT_NAME'", "max_tokens": 50}' \
    https://api.openai.com/v1/engines/davinci/completions | jq -r '.choices[0].text')

# Save GPT-3 generated greeting to a file
echo "$GPT3_RESPONSE" > "$DIR/docs/greeting.txt"
echo "GPT-3 generated greeting saved as text."

# Ensure data directory exists
mkdir -p "$DIR/data"

# Prompt for OpenAI API key if not in .env
if ! grep -q "OPENAI_API_KEY" "$DIR/.env"; then
    echo -n "Enter OpenAI API key: "
    read OPENAI_API_KEY
    echo "OPENAI_API_KEY=$OPENAI_API_KEY" >> "$DIR/.env"
fi

# Execute Langchain script
echo "Executing Langchain script..."
python "$DIR/src/langchain_script.py"
