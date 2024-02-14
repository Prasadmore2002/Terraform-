
provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "abcd-bucket" {
  bucket = "my-bucket"

  tags = {
    Name = "file-bucket"
    env = "dev"
  }
}