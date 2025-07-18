#!/bin/bash

APP_NAME=fastapi-k8s
IMAGE_NAME=$APP_NAME:local

echo "🛠️  Building Docker image locally..."
docker build -t $IMAGE_NAME .

echo "📦 Saving image to tar..."
docker save $IMAGE_NAME > $APP_NAME.tar

echo "📥 Importing image into MicroK8s..."
microk8s ctr image import $APP_NAME.tar

echo "📦 Applying ConfigMap and Secret..."
microk8s kubectl apply -f k8s/configmap.yaml
microk8s kubectl apply -f k8s/secret.yaml

echo "🚢 Deploying FastAPI app..."
microk8s kubectl apply -f k8s/deployment.yaml
microk8s kubectl apply -f k8s/service.yaml

echo "🌐 Creating Ingress..."
microk8s kubectl apply -f k8s/ingress.yaml

echo "✅ Done! Visit your app at:"
echo "   http://<your-ip>/test"

