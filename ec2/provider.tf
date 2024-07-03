terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}

# Create VPC # --> This ain't create a new vpc, just use the default one
resource "aws_default_vpc" "default" {

