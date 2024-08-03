#!/bin/bash

# Default values
PROJECT_NAME="dev-environment-wizard"
NODE_VERSION="latest"
NPM_VERSION="latest"

# Help function
show_help() {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  --name NAME        Set the project name (default: dev-environment-wizard)"
    echo "  --node VERSION     Set Node.js version (default: latest)"
    echo "  --npm VERSION      Set npm version (default: latest)"
    echo "  --help             Show this help message"
    echo
    echo "Example:"
    echo "  $0 --name my-project --node 16.13.0 --npm 8.1.0"
}

# Validate project name
validate_project_name() {
    if ! [[ $1 =~ ^[a-z0-9-]+$ ]]; then
        echo "Error: Project name must contain only lowercase letters, numbers, and hyphens."
        exit 1
    fi
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --name) 
            PROJECT_NAME="$2"
            validate_project_name "$PROJECT_NAME"
            shift ;;
        --node) NODE_VERSION="$2"; shift ;;
        --npm) NPM_VERSION="$2"; shift ;;
        --help) show_help; exit 0 ;;
        *) echo "Unknown parameter: $1"; show_help; exit 1 ;;
    esac
    shift
done

# Create project directory if it doesn't exist
if [ ! -d "$PROJECT_NAME" ]; then
    mkdir -p "$PROJECT_NAME"
fi
cd "$PROJECT_NAME" || exit

# Create Dockerfile if it doesn't exist
if [ ! -f Dockerfile ]; then
cat << EOF > Dockerfile
FROM node:${NODE_VERSION}

# Set up npm
RUN if [ "${NPM_VERSION}" = "latest" ]; then \
      npm install -g npm; \
    else \
      npm install -g npm@${NPM_VERSION}; \
    fi

# Set working directory
WORKDIR /app

# Install live-server
RUN npm install -g live-server

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy project files
COPY . .

# Command to run when container starts
CMD ["live-server", "--host=0.0.0.0", "--port=3000", "--entry-file=index.html"]
EOF
fi

# Add debugging output to show Dockerfile contents
echo "Dockerfile contents:"
cat Dockerfile
echo "End of Dockerfile"

# Create .dockerignore if it doesn't exist
if [ ! -f .dockerignore ]; then
cat << EOF > .dockerignore
node_modules
npm-debug.log
EOF
fi

# Create a basic package.json if it doesn't exist
if [ ! -f package.json ]; then
cat << EOF > package.json
{
  "name": "${PROJECT_NAME}",
  "version": "1.0.0",
  "description": "A simple vanilla JavaScript project",
  "main": "index.js",
  "scripts": {
    "start": "live-server --host=0.0.0.0 --port=3000 --entry-file=index.html"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "live-server": "^1.2.1"
  }
}
EOF
fi

# Create index.js if it doesn't exist
if [ ! -f index.js ]; then
cat << EOF > index.js
document.addEventListener("DOMContentLoaded", function() {
  const appDiv = document.getElementById('app');
  appDiv.innerHTML = '<h1>Happy Hacking!</h1>';
});
EOF
fi

# Create index.html if it doesn't exist
if [ ! -f index.html ]; then
cat << EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vanilla JS Project</title>
  <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
  <div id="app"></div>
  <script src="index.js"></script>
</body>
</html>
EOF
fi

# Create directory structure for CSS if it doesn't exist
if [ ! -d styles ]; then
    mkdir -p styles
fi

# Create a basic CSS file if it doesn't exist
if [ ! -f styles/styles.css ]; then
cat << EOF > styles/styles.css
/* CSS styles go here */
body {
  font-family: Arial, sans-serif;
  background-color: #333;
  color: white;
}

#app {
  text-align: center;
  margin-top: 50px;
}

#app h1 {
  font-size: 2em;
  color: #ffcc00;
}
EOF
fi

# Build Docker image
docker build -t ${PROJECT_NAME} .

echo "Setup complete. Now running the container to verify the environment:"

# Run the container and serve the project on port 3000
docker run --rm -p 3000:3000 -v "$(pwd)":/app ${PROJECT_NAME}
