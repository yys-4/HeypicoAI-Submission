# 🚀 DevOps Projects Repository 🚀

Welcome to the DevOps Projects Repository! This repository is a collection of projects demonstrating various DevOps practices and tools. Each project is contained in its own directory and includes all the necessary files and instructions to run it.

## 📂 Projects

Here's a brief overview of the projects included in this repository:

1.  [Kubernetes Deployment](./01-kubernetes-deployment)
2.  [Terraform IaC](./02-terraform-iac)
3.  [CI/CD with GitHub Actions](./03-cicd-github-actions)
4.  [Monitoring Stack](./04-monitoring-stack)
5.  [NGINX Reverse Proxy](./05-nginx-reverse-proxy)

---

## 📖 Project Details

In this section, you will find detailed information about each project.

### 1. 📦 Kubernetes Deployment

This project demonstrates how to deploy a simple Python Flask web application on a Kubernetes cluster. The application displays a message that can be configured using a ConfigMap.

**Components:**
- `app.py`: A simple Flask web application.
- `requirements.txt`: Python dependencies for the application.
- `Dockerfile`: To containerize the Flask application.
- `deployment.yaml`: Kubernetes deployment configuration.
- `service.yaml`: Kubernetes service to expose the application.
- `configmap.yaml`: Kubernetes ConfigMap to manage application configuration.

**Usage:**
1. Build and push the Docker image to a registry.
2. Update the `deployment.yaml` with your Docker image.
3. Apply the Kubernetes manifests:
   ```sh
   kubectl apply -f 01-kubernetes-deployment/
   ```

### 2. 🏗️ Terraform IaC

This project demonstrates how to use Terraform to provision a simple web server infrastructure on AWS. It creates a VPC, a subnet, a security group, and an EC2 instance running an NGINX web server.

**Components:**
- `main.tf`: The main Terraform file that defines the AWS resources.
- `variables.tf`: Defines the variables used in the Terraform configuration.
- `outputs.tf`: Defines the outputs of the Terraform configuration, such as the public IP of the EC2 instance.

**Usage:**
1. Configure your AWS credentials.
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Apply the Terraform configuration:
   ```sh
   terraform apply
   ```
4. To destroy the infrastructure, run:
   ```sh
   terraform destroy
   ```

### 3. 🔄 CI/CD with GitHub Actions

This project demonstrates how to set up a CI/CD pipeline using GitHub Actions to automatically test, build, and deploy a Flask web application.

**Components:**
- `app.py`: The Flask web application.
- `test_app.py`: Unit tests for the application.
- `Dockerfile`: To containerize the application.
- `.github/workflows/cicd-pipeline.yml`: The GitHub Actions workflow file.

**Pipeline:**
1.  **Test:** Runs unit tests on every push to the `main` branch.
2.  **Build and Push:** Builds a Docker image and pushes it to the GitHub Container Registry.
3.  **Deploy:** Deploys the new Docker image to a staging server.

**Usage:**
- The pipeline is automatically triggered on every push to the `main` branch.
- You need to configure the following secrets in your repository settings:
  - `STAGING_SERVER_IP`: The IP address of your staging server.
  - `STAGING_USERNAME`: The username for SSH access to the staging server.
  - `STAGING_SSH_KEY`: The private SSH key for the staging server.

### 4. 📊 Monitoring Stack

This project sets up a monitoring stack using Docker Compose. The stack includes Prometheus, Grafana, Node Exporter, and Alertmanager. The infrastructure for the monitoring stack is provisioned using Terraform.

**Components:**
- `docker-compose.yml`: Defines the monitoring services.
- `prometheus.yml`: Prometheus configuration file.
- `alert.rules.yml`: Alerting rules for Prometheus.
- `alertmanager.yml`: Alertmanager configuration file.
- `main.tf`, `variables.tf`, `outputs.tf`: Terraform files to provision the infrastructure.

**Usage:**
1.  Provision the infrastructure using Terraform as described in the **Terraform IaC** section.
2.  SSH into the EC2 instance.
3.  Install Docker and Docker Compose.
4.  Run the monitoring stack:
    ```sh
    docker-compose up -d
    ```
5.  Access the services:
    - **Prometheus:** `http://<your_ec2_public_ip>:9090`
    - **Grafana:** `http://<your_ec2_public_ip>:3000`
    - **Alertmanager:** `http://<your_ec2_public_ip>:9093`

### 5. 🌐 NGINX Reverse Proxy

This project demonstrates how to use NGINX as a reverse proxy and load balancer for a Flask web application running in multiple containers.

**Components:**
- `app.py`: The Flask web application.
- `Dockerfile`: To containerize the application.
- `docker-compose.yml`: Defines the application services and the NGINX proxy.
- `nginx.conf`: NGINX configuration for reverse proxy and load balancing.

**Usage:**
1.  Run the services using Docker Compose:
    ```sh
    docker-compose up
    ```
2.  Open your web browser and navigate to `http://localhost`. You will see a message from one of the servers. Refresh the page to see the message from the other server.
