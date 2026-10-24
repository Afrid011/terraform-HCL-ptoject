#Creating VPC
resource "aws_vpc" "webservervpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "var.vpc_name"
  }
}

#Creating Subnets!!
resource "aws_subnet" "publicsubnet1" {
  vpc_id                  = aws_vpc.webservervpc.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.availability_zone1
  map_public_ip_on_launch = true
  tags = {
    Name = "var.name1"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id                  = aws_vpc.webservervpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.availability_zone2
  map_public_ip_on_launch = true
  tags = {
    Name = "var.name2"
  }
}

#Creating Internet_Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.webservervpc.id
}

#Creating Route_table
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.webservervpc.id


  route {
    cidr_block = var.public_rt_cidr_igw
    gateway_id = aws_internet_gateway.igw.id
  }
}

#Creating Subnet Association
resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.publicsubnet2.id
  route_table_id = aws_route_table.publicRT.id
}


#Creating Security groups
resource "aws_security_group" "websg" {
  name = var.name
  vpc_id = aws_vpc.webservervpc.id

  ingress {
    description = "HTTP from vpc"
    from_port = var.http_from_port
    to_port = var.http_to_port
    protocol = var.http_protocol
    cidr_blocks = var.http_cidr_blocks
  }

  ingress {
    description = "SSH from vpc"
    from_port = var.ssh_from_port
    to_port = var.ssh_to_port
    protocol = var.ssh_protocol
    cidr_blocks  = var.ssh_cidr_blocks
  }
  tags = {
    Name  = var.Name
  }
}


#creating EC2_instances
resource "aws_instance" "myfirstinstance" {
  ami = var.ami1
  instance_type = var.instance_type1
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id = aws_subnet.publicsubnet1.id
  user_data = base64encode(file("userdata.sh"))

}

resource "aws_instance" "mysecondinstance" {
  ami = var.ami2
  instance_type = var.instance_type2
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id = aws_subnet.publicsubnet2.id
  user_data = base64encode(file("userdata.sh"))

}


#creating alb and attaching tg to alb
resource "aws_lb" "myalb" {
  name = var.alb-name
  internal = var.alb-internal
  load_balancer_type = var.load-balancer-type
  security_groups = [aws_security_group.websg.id]
  subnets = [aws_subnet.publicsubnet1.id, aws_subnet.publicsubnet2.id]
  tags = {
    Name = var.alb-Name
  }
}

resource "aws_lb_target_group" "tg" {
  name = var.tg-name
  port = var.tg-port
  protocol = var.tg-protocol
  vpc_id = aws_vpc.webservervpc.id
  health_check {
    path = var.tg-path
    port = var.health-check-port
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.myfirstinstance.id
  port = var.attach-port1
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.mysecondinstance.id
  port = var.attach-port2
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port = var.listener-port
  protocol = var.listener-protocol

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type = var.tg-type
  }
}




















