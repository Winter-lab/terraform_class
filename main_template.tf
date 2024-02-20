# Specify the Terraform version and provider requirements
terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3" # The region for Paris AWS Datacenter
}

# Create a new EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one for your region
  instance_type = "t2.micro" # Change this based on your needs

  tags = {
    Name = "TerraformExample"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
