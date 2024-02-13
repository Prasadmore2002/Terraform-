
provider "aws" {
 region = "us-east-1"
}

#  Create Security group

resource "aws_security_group" "my_sg" {
   name = "my-sg-group"
   description = "allow-ssh and http"
   vpc_id =  var.vpc_id
   ingress {
    protocol = "TCP"
    from_port = "22"
    to_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
    protocol = "TCP"
    from_port = "80"
    to_port = "80"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
   }
 }  


resource "aws_instance" "my-instance" {
    ami = var.image_id 
    instance_type = var.machine_type
    key_name = "univesal_key"
    vpc_security_group_ids = ["vpc-0b91c6bdd351646a1", aws_security_group.my_sg.id]
    tags = {
      Name = "my_instance"
      env = "dev"
    }  
}

resource "aws_instance" "another_instance" {
    ami = var.image_id
    instance_type = var.machine_type
    key_name = ""univesal_key"
    vpc_security_group_ids = ["vpc-0b91c6bdd351646a1"]
    tags = {
        Name = "abcd-instance"
        env = "dev"
    }
}

# Variables

variable "image_id" {
    default = "ami-0c7217cdde317cfec"
}

variable "machine_type" {
    default = "t2.micro"
}

variable "vpc_id" {
    default = "vpc-0b91c6bdd351646a1"
}

