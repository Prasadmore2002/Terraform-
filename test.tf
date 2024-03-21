provider "aws" {
    region = "us-east-1"
  
}
resource "aws instance" "terraform1" {
     ami = "ami-03c5a38d438cf3d3e"
     instance_type = "t2-micro"
     key_name = "n.verginia" 
       }  
