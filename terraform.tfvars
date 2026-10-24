#vpc-details
vpc_cidr = "192.168.0.0/16"
vpc_name = "webserver-vpc"


#public_subnet-1
public_subnet1_cidr = "192.168.1.0/24"
availability_zone1 = "ap-south-1a"
name1 = "public-subnet1"


#public_subent-2
public_subnet2_cidr = "192.168.2.0/24"
availability_zone2 = "ap-south-1b"
name2 = "public_subnet2"


#route_table 
public_rt_cidr_igw = "0.0.0.0/0"

#security_group
name = "websg"
#sg_ingress_http
http_from_port = 80
http_to_port = 80
http_protocol = "tcp"
http_cidr_blocks = ["0.0.0.0/0"]
#sg_ingress_ssh
ssh_from_port = 22
ssh_to_port = 22
ssh_protocol = "tcp"
ssh_cidr_blocks = ["0.0.0.0/0"]
#sg_egress_outbound
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
Name = "websg"


#1st-ec2_instance
ami1 = "ami-0d5beb611c244cba5"
instance_type1 = "t3.micro"
#2nd-ec2_instance
ami2 = "ami-0d5beb611c244cba5"
instance_type2 = "t3.micro"



#alb
alb-name = "my-alb"
alb-internal = false
load-balancer-type = "application"
alb-Name = "web"
#tg
tg-name = "myTG"
tg-port = 80
tg-protocol = "HTTP"
tg-path = "/"
health-check-port = "traffic-port"

#attaching alb to ec2
attach-port1 = 80
attach-port2 = 80

listener-port = 80
listener-protocol = "HTTP"

tg-type = "forward"












