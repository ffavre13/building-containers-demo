# building-containers-demo
## Description
This repository contains a demo for building containers using Docker. The goal is to demonstrate the difference between optimized and unoptimized Dockerfiles. The unoptimized Dockerfile copies all files to the container before installing dependencies which can lead to larger image sizes and longer build times and use a base image with unnecessary packages and files. The optimized Dockerfile uses a multi-stage build to reduce the final image size and build time by only copying the necessary files and installing only production dependencies.

## File structure
```text
building-containers-demo/
├── src/            # Source code for the application
│   └── index.ts
├── .dockerignore   # Files and directories to ignore when building the Docker image
├── .gitignore 
├── Dockerfile.optimized    # Optimized Dockerfile for building the application
├── Dockerfile.unoptimized  # Unoptimized Dockerfile for building the application
├── README.md
├── package-lock.json   # Lock file for npm dependencies
├── package.json        # npm configuration file
├── run.sh              # Shell script to run the application
└── tsconfig.json       # TypeScript configuration file
```

# Setup

1. Clone the repository:
```bash
git clone https://github.com/ffavre13/building-containers-demo.git && cd building-containers-demo
```

3. Run the demo using 'run.sh' script:
```bash
# On windows, use WSL to run the script
chmod +x run.sh && ./run.sh
```