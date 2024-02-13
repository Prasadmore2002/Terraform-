
provider "aws" {
 region = "us-east-1"
}

#  Create Security group

resource "aws_security_group" "my_sg" {
   name = "my-sg-group"
   description = "allow-ssh and http"
   vpc_id = "vpc-0b91c6bdd351646a1"
   ingress {
    protocol = "TCP"
    from_port = "22"
    to_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
   }
}
   ingress {
    procitotocol = "TCP"
    from_port = "80"
    to_port = "80"
    cidr_block = "0.0.0.0/0"
   }

   egress {
    protocol "-1"
    from_port = "0"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
   }
 }  


resource "aws_instance" "my-instance" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "univesal_key"
    vpc_security_group_ids = ["sg-0f7ef2c962792ccbb"]
    tags = {
      Name = "my_instance"
      env = "dev"
    }  
}