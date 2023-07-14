# Apply the Deployment manifest
kubectl apply -f registry-deployment.yaml

# Apply the Service manifest
kubectl apply -f registry-service.yaml

# Get the Deployments
kubectl get deployments

# Get the Services
kubectl get services
