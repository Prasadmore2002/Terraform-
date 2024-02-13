provider "aws" {
 region = "eu-east-1"
}

resource "aws_instance" "my-instance" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "univasal-key"
    vpc_security_group_ids = ["sg-0f7ef2c962792ccbb"]
}