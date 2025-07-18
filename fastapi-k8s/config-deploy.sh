#!/bin/bash

echo "🗑️ Deleting old Deployment and HPA..."
microk8s kubectl delete deployment fastapi-deployment --ignore-not-found --wait=true
microk8s kubectl delete hpa fastapi-hpa --ignore-not-found --wait=true

echo "📦 Applying ConfigMap and Secret..."
microk8s kubectl apply -f k8s/configmap.yaml
microk8s kubectl apply -f k8s/secret.yaml

echo "🚢 Deploying FastAPI app..."
microk8s kubectl apply -f k8s/deployment.yaml
microk8s kubectl apply -f k8s/service.yaml

echo "📈 Applying HorizontalPodAutoscaler..."
microk8s kubectl apply -f k8s/hpa.yaml

echo "🌐 Creating Ingress..."
microk8s kubectl apply -f k8s/ingress.yaml

echo "✅ Done! Visit your app at:"
echo "   http://<your-ip>/test"

