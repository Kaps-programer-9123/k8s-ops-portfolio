#!/bin/bash

# App and image settings
APP_NAME=fastapi-k8s
IMAGE_NAME=$APP_NAME:local
HELM_RELEASE_NAME=my-release  # Existing Helm release name
HELM_CHART_PATH=./mychart-0.2.0.tgz

# Step 1: Build Docker image locally
echo "🛠️  Building Docker image locally..."
docker build -t $IMAGE_NAME .

# Step 2: Load Docker image into Minikube
echo "📦 Saving image to tar..."
docker save $IMAGE_NAME > $APP_NAME.tar

echo "📥 Importing image into Minikube..."
minikube image load $APP_NAME.tar

# Step 3: Setup Helm (if it's not already configured)
# Ensure it's initialized with the Minikube context
echo "🔧 Ensuring Helm is configured with Minikube context..."
kubectl config use-context minikube

# Step 4: Upgrade or Install the Helm release with your new image
echo "🚢 Deploying FastAPI app using Helm..."

# Upgrade the release using the new Docker image
helm upgrade $HELM_RELEASE_NAME $HELM_CHART_PATH \
  --set image.repository=$IMAGE_NAME \
  --set image.tag=local \
  --set resources.memory.request="512Mi" \
  --set resources.memory.limit="1Gi" \
  --set resources.cpu.request="500m" \
  --set resources.cpu.limit="1"

# Step 5: Check the status of the deployment
echo "📊 Checking the status of the deployment..."
helm status $HELM_RELEASE_NAME

# Step 6: Expose the service (if you haven't already done so in the Helm chart)
echo "🌐 Creating Ingress and exposing the service..."
minikube service $APP_NAME --url

# Step 7: Done!
echo "✅ Done! Visit your app at:"
echo "   http://$(minikube ip):$(kubectl get svc $APP_NAME -o=jsonpath='{.spec.ports[0].nodePort}')"
