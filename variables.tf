#VPC-VARIABLE
variable "vpc_cidr" {
  description = "my webserver vpc"
}


#Public_Subnet1
variable "public_subnet1_cidr" {
  description = "subnet cidr"
}
variable "availability_zone1" {
  description = "choosing the availability xone"
}
variable "name1" {
  description = "name of the subnet"
}

#Public_Subnet2
variable "public_subnet2_cidr" {
  description = "subnet cidr"
}
variable "availability_zone2" {
  description = "choosing the availability xone"
}
variable "name2" {
  description = "name of the subnet"
}

#Route table
variable "public_rt_cidr_igw" {
  description = "routing the server traffic to the internet gateway"
}

#Security group
variable "name" {
  description = "name of the sg"
}
#http_ingress
variable "http_from_port" {
  description = "from port traffic"
}
variable "http_to_port" {
  description = "to port traffic"
}
variable "http_protocol" {
  description = "tcp protocol "
}
variable "http_cidr_blocks" {
  description = "traffic from anywhere"
}
#ssh_ingress
variable "ssh_from_port" {
  description = "from ssh port traffic"
}
variable "ssh_to_port" {
  description = "to ssh port traffic "
}
variable "ssh_protocol" {
  description = "ssh protocol"
}
variable "ssh_cidr_blocks" {
  description = "traffic from anywhere"
}
#outbound_egress
variable "from_port" {
  description = "outbound"
}
variable "to_port" {
  description = "outbound"
}
variable "protocol" {
  description = "protocol"
}
variable "cidr_blocks" {
  description = "traffic from anywhere"
}
variable "Name" {
  description = "tag of the sg"
}


#ec2_instance
#1st-instance
variable "ami1" {
  description = "ami of the first instance "
}
variable "instance_type1" {
  description = "instancetype "
}
#2nd-instance
variable "ami2" {
  description = "ami of th second instance"
}
variable "instance_type2" {
  description = "instancetype"
}



#alb for ec2
variable "alb-name" { description = "name of alb" }
variable "alb-internal" {description = "makg sure alb takes the external trafic" }
variable "load-balancer-type" {}
variable "alb-Name" { description = "tag of the alb" }
#tg
variable "tg-name" { description = "target group name" }
variable "tg-port" { description = "port where traffic is taken" }
variable "tg-protocol" { description = "type of protocol we are using to allow traffic" }
variable "tg-path" { description = "defines hwre the traffic should be headed" }
variable "health-check-port" {description = "health checks port" }

#attaching tg to alb
variable "attach-port1" { description = "attaching 1st tg to alb" }
variable "attach-port2" { description = "attaching 2nd tg to alb" }
variable "listener-port" { }
variable "listener-protocol" { }
variable "tg-type" { }









































