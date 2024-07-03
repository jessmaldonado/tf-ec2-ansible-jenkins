resource "aws_security_group" "jenkins-sg" {
    name    = "jenkins-sg"
    description =   "Open 22, 443, 80, 8080"
    vpc_id = aws_default_vpc.default.id

    # Define a single ingress rule to allow traffic on all specified ports
    ingress =[
        for port in [22, 80, 443, 80, 8080] : {
            description      = "TLS from VPC"
            from_port        = port
            to_port          = port
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"] 
        }
    ]

    egress = {
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
    ami = "ami-0eac975a54dfee8cb"
    instance_type = "t2.micro"
    key_name = "default-ec2"
    vpc_security_group_ids ] [aws_security_group.jenkins-sg.id]
    user_data = templatefile("./ec2_setup.sh", {})
    
    tags = {
        Name = "jenkins-server"
    }
    root_block_device {
    volume_size = 9
  }
} 