// We need to create 6 subnets

# Create a VPC
resource "aws_vpc" "vpc_paris" {
  cidr_block = "10.0.0.0/16"
}


// Public subnets
resource "aws_subnet" "sn0" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    Name = "subnet_0"
  }
}

resource "aws_subnet" "sn1" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet_1"
  }
}

resource "aws_subnet" "sn2" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-3c"

  tags = {
    Name = "subnet_2"
  }
}


// Private subnets

resource "aws_subnet" "sn3" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "subnet_3"
  }
}

resource "aws_subnet" "sn4" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet_4"
  }
}

resource "aws_subnet" "sn5" {
  vpc_id            = aws_vpc.vpc_paris.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-3c"

  tags = {
    Name = "subnet_5"
  }
}
