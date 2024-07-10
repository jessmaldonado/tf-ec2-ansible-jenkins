resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Open 22, 443, 80, 8080"
  vpc_id      = aws_default_vpc.default.id

  # Define a dynamic ingress to automate the creation of these ingress rules using a loop, dynamic block iterates over a set of ports and creates an ingress rule for each port.
  dynamic "ingress" {
    for_each = toset([22, 80, 443, 8080])
    content {
      description = "TLS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-server-sg"
  }
}

resource "aws_instance" "jenkins-server" {
  ami                    = "ami-0eac975a54dfee8cb"
  instance_type          = "t2.micro"
  key_name               = "default-ec2"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = templatefile("./ec2_setup.sh", {})

  tags = {
    Name = "jenkins-server"
  }
  root_block_device {
    volume_size = 9
  }
} 