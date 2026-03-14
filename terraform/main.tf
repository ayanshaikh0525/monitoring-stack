provider "aws" {
  region = "us-east-1"
}


# securitty group

resource "aws_security_group" "monitoring_sg" {
  name = "monitoring-sg"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9090
    to_port   = 9090
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9093
    to_port   = 9093
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9100
    to_port   = 9100
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "monitoring_server" {

  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.medium"

  security_groups = [aws_security_group.monitoring_sg.name]

  key_name = "devops-key"

  tags = {
    Name = "monitoring-stack"
  }
}
