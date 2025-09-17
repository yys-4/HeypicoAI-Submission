<<<<<<< HEAD
# 🚀 Infrastructure as Code with Terraform and AWS

This repository contains Terraform code to automatically provision a basic web infrastructure on Amazon Web Services (AWS). This project creates an EC2 instance running an NGINX web server inside a custom VPC.

The goal of this project is to demonstrate how to use Terraform to manage infrastructure as code (IaC). By defining the infrastructure in configuration files, we can create, modify, and destroy environments in a consistent and reproducible way.

## 📂 File Structure

- `main.tf`: The main file that defines all the AWS resources to be created.
- `variables.tf`: Defines the variables used in the Terraform configuration, such as the AWS region and project name.
- `outputs.tf`: Defines the outputs of the Terraform configuration, such as the public IP address of the EC2 instance.

## 🚀 Resources Created

- **Virtual Private Cloud (VPC):** An isolated network for your AWS resources.
- **Subnet:** A sub-network within the VPC where the EC2 instance will reside.
- **Security Group:** Acts as a virtual firewall for the EC2 instance, allowing inbound traffic on port 22 (SSH) and 80 (HTTP).
- **Internet Gateway:** Enables communication between the VPC and the internet.
- **Route Table:** Defines rules, called routes, to direct network traffic from the subnet.
- **EC2 Instance:** A virtual server running Amazon Linux 2 with an NGINX web server installed and configured.

## 🛠️ Usage

### Prerequisites

- Terraform installed on your local machine.
- AWS CLI installed and configured with your AWS credentials.

### Initialization

Navigate to the `task2/` directory and run the following command to initialize the Terraform working directory:
```sh
terraform init
```

### Plan

Run the following command to see the changes that Terraform will apply:
```sh
terraform plan
```

### Apply

Apply the changes by running:
```sh
terraform apply
```
Enter `yes` when prompted to confirm. After the deployment is complete, the public IP address of the EC2 instance will be displayed as an output.

### Destroy

To clean up all the resources created by Terraform, run:
```sh
terraform destroy
```
=======
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
>>>>>>> Heypico-Task3
