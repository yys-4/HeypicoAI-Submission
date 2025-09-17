# Mengkonfigurasi provider AWS
provider "aws" {
  region = var.aws_region
}

# 1. Membuat Virtual Private Cloud (VPC) sebagai jaringan terisolasi
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# 2. Membuat Subnet di dalam VPC
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "${var.project_name}-subnet"
  }
}

# 3. Membuat Security Group (Firewall)
resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  # Aturan untuk mengizinkan traffic HTTP (port 80) dari mana saja
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Aturan untuk mengizinkan traffic SSH (port 22) dari mana saja
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Aturan untuk mengizinkan semua traffic keluar (outbound)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# 4. Membuat server virtual (EC2 Instance)
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI for ap-southeast-1. Ganti jika region Anda beda.
  instance_type = "t2.micro"             # Tipe yang termasuk dalam Free Tier
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Script yang akan dijalankan saat instance pertama kali booting
  # untuk menginstal web server NGINX
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Deployed via Terraform</h1>" | sudo tee /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-server"
  }
}

# Diperlukan agar EC2 instance mendapatkan IP publik
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.project_name}-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rt.id
}