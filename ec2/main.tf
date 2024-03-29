#provider and region declaration
provider "aws" {
    version = "< 2"
    region = "us-west-2"
}


#vpc
#cidr_block is only required argument for an aws vpc resource
resource "aws_vpc" "web_vpc" {
    cidr_block = "192.168.0.1/24"
    enable_dns_hostnames = true

    tags {
        Name = "Web VPC"
    }
}

#subnet
resource "aws_subnet" "web_subnet_1" {
    vpc_id = "${aws_vpc.web_vpc.id}"
    cidr_block = "192.168.0.1/25"
    availability_zone = "us-west-2a"

    tags {
        Name = "Web Subnet 1"
    }
}

#adding ec2 to subnet
resource "aws_instance" "web" {
    ami = "ami-0fb83677"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.web_subnet_1.id}"

    tags {
        Name = "Web Server 1"
    }
}

