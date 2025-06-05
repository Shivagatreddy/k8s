#!/bin/bash

# Set your ACR name
ACR_NAME="myacr9382"
ACR_LOGIN_SERVER="${ACR_NAME}.azurecr.io"

echo "📦 Tagging Docker images..."
docker tag resume:dev ${ACR_LOGIN_SERVER}/resume:dev
docker tag resume:prod ${ACR_LOGIN_SERVER}/resume:prod

echo "🔐 Logging in to Azure Container Registry..."
az acr login --name $ACR_NAME

echo "🚀 Pushing images to ACR..."
docker push ${ACR_LOGIN_SERVER}/resume:dev
docker push ${ACR_LOGIN_SERVER}/resume:prod

echo "✅ All images pushed successfully to $ACR_LOGIN_SERVER"

az aks update --name aksClusterDemo --resource-group aks-lab-rg --attach-acr aksPythonACR

