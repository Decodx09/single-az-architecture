resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AppServerSG"
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash -ex
              
              sudo yum update -y
              sudo yum install -y git

              curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
              sudo yum install -y nodejs

              cd /home/ec2-user
              sudo git clone ${var.github_repo_url}

              sudo chown -R ec2-user:ec2-user /home/ec2-user/${var.folder_name}
              
              cd ${var.before_npm}

              npm install
              node index.js
              EOT
              EOF

  tags = {
    Name = "AppServer"
  }
}
