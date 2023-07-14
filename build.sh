#!/bin/bash

# Building images and deploying to Kubernetes
echo "Building images and deploying to Kubernetes"

# Starting Minikube
echo "Starting Minikube"
minikube start

# Building the frontend and backend images
echo "Building images"
echo "Building frontend image"
docker build -t frontend_image:latest frontend
echo "Building backend image"
docker build -t backend_image:latest backend

# Pushing images to the local registry
echo "Pushing images to the local registry"
docker tag frontend_image:latest 10.105.19.125:5001/frontend_image:latest
docker push 10.105.19.125:5000/frontend_image:latest
echo "Pushing images to the local registry"
docker tag backend_image:latest 10.105.19.125:5001/backend_image:latest
docker push 10.105.19.125:5001/backend_image:latest

# Checking the images
echo "Checking images"
docker images

# Deploying to Kubernetes
echo "Deploying to Kubernetes"
echo "Deployments"
kubectl apply -f deployment.yaml

# Starting services
echo "Starting services"
kubectl apply -f service.yaml

# Checking deployments and services
echo "Checking deployments and services"
kubectl get deployments
kubectl get services
