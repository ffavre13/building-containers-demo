#!/bin/bash

echo "Build docker images the first time"
echo "==============================="

# -q is to avoid printing the build output
echo "Build unoptimized image"
docker build -q -f Dockerfile.unoptimized -t slow-app:latest .

echo "Build optimized image"
docker build -q -f Dockerfile.optimized -t fast-app:latest .

echo ""
echo "Modify the source code to trigger rebuild"
echo "==============================="

echo "" >> src/index.ts
echo "File index.ts has been modified"
echo ""

echo "Rebuild docker images after source code modification and compute rebuild time"
echo "==============================="

echo "Rebuild unoptimized image:"
SECONDS=0
docker build -f Dockerfile.unoptimized -t slow-app:latest .
SLOW_TIME=$SECONDS
echo ""

echo "Rebuild optimized image:"
SECONDS=0
docker build -f Dockerfile.optimized -t fast-app:latest .
FAST_TIME=$SECONDS
echo ""

echo "Results:"
echo "==============================="

echo "Unoptimized image: "
echo "Rebuild time: $SLOW_TIME seconds"
echo "image size: $(docker images slow-app:latest --format "{{.Size}}")"
echo ""

echo "Optimized image: "
echo "Rebuild time: $FAST_TIME seconds"
echo "image size: $(docker images fast-app:latest --format "{{.Size}}")"