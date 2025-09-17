# 🚀 Automated Web Infrastructure on AWS with Prometheus & Grafana Monitoring

This repository contains Terraform code to automatically provision a web infrastructure on Amazon Web Services (AWS). This project creates an EC2 instance running an NGINX web server inside a custom VPC.

Additionally, this project includes a monitoring solution using Docker, Prometheus, and Grafana to monitor the EC2 instance.

The goal of this project is to demonstrate how to use Terraform to manage infrastructure as code (IaC) and how to set up a monitoring stack for the provisioned infrastructure.

## 📂 File Structure

- `main.tf`: The main file that defines all the AWS resources to be created.
- `variables.tf`: Defines the variables used in the Terraform configuration, such as the AWS region and project name.
- `outputs.tf`: Defines the outputs of the Terraform configuration, such as the public IP address of the EC2 instance.
- `docker-compose.yml`: Defines the services for the monitoring stack: Prometheus, Grafana, Node Exporter, and Alertmanager.
- `prometheus.yml`: Configuration file for Prometheus, defining the scrape targets.
- `alert.rules.yml`: Defines the alerting rules for Prometheus.
- `alertmanager.yml`: Configuration file for Alertmanager.

## Monitoring Solution

The monitoring solution consists of the following components:

- **Prometheus:** A time-series database and monitoring system that scrapes metrics from the EC2 instance.
- **Grafana:** A visualization tool that allows you to create dashboards to display the metrics collected by Prometheus.
- **Node Exporter:** An exporter for hardware and OS metrics exposed by *NIX kernels.
- **Alertmanager:** Handles alerts sent by client applications such as the Prometheus server.

These components are deployed as Docker containers using Docker Compose.

## 🛠️ Usage

### Prerequisites

- Terraform installed on your local machine.
- AWS CLI installed and configured with your AWS credentials.
- Docker and Docker Compose installed on the EC2 instance.

### 1. Provision the Infrastructure

Navigate to the `task4/` directory and run the following command to initialize the Terraform working directory:
```sh
terraform init
```

Run the following command to see the changes that Terraform will apply:
```sh
terraform plan
```

Apply the changes by running:
```sh
terraform apply
```
Enter `yes` when prompted to confirm. After the deployment is complete, the public IP address of the EC2 instance will be displayed as an output.

### 2. Deploy the Monitoring Stack

SSH into the created EC2 instance:
```sh
ssh -i /path/to/your/key.pem ec2-user@<your_ec2_public_ip>
```

Install Docker and Docker Compose on the EC2 instance:
```sh
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Copy the monitoring configuration files (`docker-compose.yml`, `prometheus.yml`, `alert.rules.yml`, `alertmanager.yml`) to the EC2 instance, or clone this repository.

Navigate to the directory containing the `docker-compose.yml` file and run:
```sh
docker-compose up -d
```

## Accessing Dashboards

- **Prometheus:** Open your web browser and navigate to `http://<your_ec2_public_ip>:9090`
- **Grafana:** Open your web browser and navigate to `http://<your_ec2_public_ip>:3000`

## Destroy

To clean up all the resources created by Terraform, run:
```sh
terraform destroy
```
