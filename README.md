# Simple Flask Web Application with Kubernetes Deployment 👋

This project is a simple "Hello, World!" style web application using Flask, containerized with Docker, and deployed on Kubernetes.

## Application Code 🐍

*   **`task1/app.py`**: This is the main application file. It's a simple Flask web server that displays a greeting message. The message is retrieved from the `GREETING` environment variable. If the variable is not set, it defaults to "Hello, World!".

*   **`task1/requirements.txt`**: This file lists the Python dependencies for the project. In this case, the only dependency is `Flask`.

## Containerization 🐳

*   **`task1/Dockerfile`**: This file contains the instructions to build a Docker image for the application. It uses a Python base image, installs the dependencies, copies the application code, and sets the command to run the application.

To build the Docker image, run the following command in the `task1` directory:

```bash
docker build -t your-dockerhub-username/heypico-task-1:1.0 .
```

## Kubernetes Deployment 🚀

The application is deployed to Kubernetes using the following configuration files:

*   **`task1/configmap.yaml`**: This file defines a ConfigMap that holds the configuration data for the application. In this case, it sets the `GREETING_MESSAGE` that will be used by the Flask application.

*   **`task1/deployment.yaml`**: This file defines a Deployment that manages the application pods. It specifies that two replicas of the application should be running. It also maps the `GREETING` environment variable in the container to the `GREETING_MESSAGE` from the ConfigMap.

*   **`task1/service.yaml`**: This file defines a Service that exposes the application to the network. It uses a `NodePort` to make the application accessible from outside the Kubernetes cluster.

To deploy the application to Kubernetes, apply the configuration files in the following order:

```bash
kubectl apply -f task1/configmap.yaml
kubectl apply -f task1/deployment.yaml
kubectl apply -f task1/service.yaml
```
