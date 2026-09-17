# building-containers-demo
## Description
This repository contains a demo for building containers using Docker. The goal is to demonstrate the difference between optimized and unoptimized Dockerfiles. The unoptimized Dockerfile copies all files to the container before installing dependencies which can lead to larger image sizes and longer build times and use a base image with unnecessary packages and files. The optimized Dockerfile uses a multi-stage build to reduce the final image size and build time by only copying the necessary files and installing only production dependencies.

## File structure
```text
building-containers-demo/
├── src/            # Source code for the application
│   └── index.ts
├── .dockerignore   # Files and directories to ignore when building the Docker image
├── .gitattributes  # Git attributes file
├── .gitignore 
├── Dockerfile.optimized    # Optimized Dockerfile for building the application
├── Dockerfile.unoptimized  # Unoptimized Dockerfile for building the application
├── README.md
├── package-lock.json   # Lock file for npm dependencies
├── package.json        # npm configuration file
├── run.sh              # Shell script to run the application
└── tsconfig.json       # TypeScript configuration file
```

## Prerequisites
- Docker (Docker Desktop on Mac/Windows) running
- A bash shell (Terminal on Mac/Linux, WSL on Windows)
- Node.js 18+ (For running the project locally without Docker)

## Setup

1. Clone the repository:
```bash
git clone https://github.com/ffavre13/building-containers-demo.git && cd building-containers-demo
```

2. Run the demo using 'run.sh' script:
```bash
# On windows, run the script inside WSL
chmod +x run.sh && ./run.sh
```

(optional) Build and run the project locally without docker:
```bash
npm ci
npm run build
npm start
```

(optional) Run the project in a docker container:
```bash
# Build the optimized image
docker build -f Dockerfile.optimized -t fast-app:latest .
# Run the optimized image
docker run -p 3000:3000 fast-app:latest

# Build the unoptimized image
docker build -f Dockerfile.unoptimized -t slow-app:latest .
# Run the unoptimized image
docker run -p 3000:3000 slow-app:latest
```

## Results

This is an example of the results you can expect when running the demo:

```text
Results:
===============================
Unoptimized image: 
Rebuild time: 11 seconds
image size: 1.86GB

Optimized image: 
Rebuild time: 4 seconds
image size: 262MB
```