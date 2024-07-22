#Public Subnet Creation
resource "aws_subnet" "public" {
  count                   = local.num_of_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr,8,count.index)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1 }"
  }
}

#Private Subnet Creation
resource "aws_subnet" "private" {
  count                   = local.num_of_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr,8,count.index+local.num_of_subnets)

  tags = {
    Name = "private-subnet-${count.index + 1 }"
  }
}

# Create internet gateway in public subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "javahome-ig-${local.ws}"
  }
}

#Create route table for public subnets
resource "aws_route_table" "pr" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt-${local.ws}"
  }
}

#Public route table association to the Public Subnet
resource "aws_route_table_association" "pub_rt_asso" {
  count             = local.num_of_subnets
  subnet_id         = aws_subnet.public.*.id[count.index]
  route_table_id    = aws_route_table.pr.id
}

# Allocate EIP for NAT Gateway

resource "aws_eip" "nat" {
domain = "vpc"
}

#Assign nat gateway for private subnets
resource "aws_nat_gateway" "ngw" {
 allocation_id = aws_eip.nat.id
 subnet_id = aws_subnet.public.*.id[0]
}

#Create route table for private subnets
resource "aws_route_table" "pri" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }


  tags = {
    Name = "private-rt-${local.ws}"
  }
}

#Associate private subntes with private route tables 
resource "aws_route_table_association" "priv_rt_asso" {
  count             = local.num_of_subnets
  subnet_id         = aws_subnet.private.*.id[count.index]
  route_table_id    = aws_route_table.pri.id
}