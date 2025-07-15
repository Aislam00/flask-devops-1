provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_flask" {
  name        = "allow_flask"
  description = "Allow Flask App on port 5000 and SSH"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask_server" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  key_name               = "alamin-devops-key" # Your manually created AWS key pair name
  vpc_security_group_ids = [aws_security_group.allow_flask.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              docker run -d -p 5000:5000 aislam00/my-flask-app:latest
              EOF

  tags = {
    Name = "FlaskAppServer"
  }
}
