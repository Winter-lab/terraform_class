// We need to create 6 subnets

# Create a VPC
resource "aws_vpc" "vpc_paris" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_groupe8"
  }
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

// EC2 pool
resource "aws_launch_template" "lt" {
  name_prefix   = "groupe8"
  image_id      = "ami-05cf39cd05d80be83"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "ec2_pool" {
  availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}

// Internet Gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc_paris.id
  tags = {
    Name = "vpc_paris_igw"
  }
}

// Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
}
// NAT
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = [aws_subnet.sn0.id, aws_subnet.sn1.id, aws_subnet.sn2.id]
#   depends_on    = [aws_internet_gateway.ig]
#   tags = {
#     Name = "nat"
#   }
# }
