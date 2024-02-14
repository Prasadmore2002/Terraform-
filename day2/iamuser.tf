provider "aws" {
  region = "us-east-1" 
}

resource "aws_iam_user" "cloud_user" {
  name = "prasad-user"
}