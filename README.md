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
