# Simple Flask Web Application with an Automated CI/CD Pipeline

This project demonstrates a simple "Hello, World!" style web application using Flask. The key feature of this project is the fully automated CI/CD pipeline that tests, builds, and deploys the application whenever changes are pushed to the `main` branch.

## CI/CD Pipeline

The CI/CD pipeline is defined in `.github/workflows/cicd-pipeline.yml` and is orchestrated using GitHub Actions. It is triggered automatically on every push to the `main` branch.

The pipeline consists of three main jobs:

### 1. Run Unit Tests

*   **Job Name:** `test`
*   **Description:** This job checks out the code, sets up a Python environment, and installs the necessary dependencies from `task1/requirements.txt`. It then runs the unit tests defined in `task1/test_app.py` using `pytest` to ensure the application is working as expected.

### 2. Build and Push Docker Image

*   **Job Name:** `build_and_push`
*   **Description:** This job depends on the successful completion of the `test` job. It builds a Docker image of the application using the `task1/Dockerfile`. After a successful build, it pushes the image to the GitHub Container Registry (ghcr.io). The image is tagged with the commit SHA to ensure a unique and traceable build.

### 3. Deploy to Staging Server

*   **Job Name:** `deploy`
*   **Description:** This final job also depends on the successful completion of the `build_and_push` job. It connects to a staging server via SSH and deploys the newly built Docker image. It stops and removes any existing container of the application and then runs the new version.

## Application Components

*   **`task1/app.py`**: The main Flask application file.
*   **`task1/requirements.txt`**: Python dependencies.
*   **`task1/Dockerfile`**: Instructions for building the Docker image.
*   **`task1/test_app.py`**: Unit tests for the application.

*Note: The Kubernetes files (`configmap.yaml`, `deployment.yaml`, `service.yaml`) are included in the repository but are not used in the current CI/CD pipeline, which deploys directly to a server using Docker.*
