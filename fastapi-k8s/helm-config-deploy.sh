#!/bin/bash

# Configurable variables
CHART_DIR="./mychart"  # Full path to your Helm chart
RELEASE_NAME="my-release"  # Name of your Helm release
APP_NAME="fastapi-app"  # Your app name for deployment
IMAGE_FILE="fastapi-k8s.tar"  # Path to the tar file containing the image

# Ensure kubectl is talking to the Minikube cluster
eval $(minikube -p minikube docker-env)

# Import the Docker image into Minikube (Use minikube, not microk8s)
echo "📥 Importing Docker image into Minikube: $IMAGE_FILE"
minikube image load $IMAGE_FILE

# Get the image name and tag from the tar (you might need to manually know the image name/tag or extract it)
IMAGE_TAG="latest"  # If you want to use 'latest' as the default tag
IMAGE_REPO="fastapi-k8s"  # Assuming the tar contains the fastapi-k8s image
IMAGE="${IMAGE_REPO}:${IMAGE_TAG}"  # Full image name

# Check if the chart directory exists
if [ ! -d "$CHART_DIR" ]; then
  echo "Error: Chart directory $CHART_DIR does not exist!"
  exit 1
fi

# Deploy the image using Helm (local chart)
echo "🚀 Deploying FastAPI app using Helm chart"
helm upgrade --install $RELEASE_NAME $CHART_DIR \
  --set image.repository="$IMAGE_REPO" \
  --set image.tag="$IMAGE_TAG" \
  --set image.pullPolicy="IfNotPresent"  # Customize based on your needs

# Provide info on successful deployment
echo "✅ Deployment complete! Your app is live with image: $IMAGE"
