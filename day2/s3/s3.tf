
provider "aws" {
    region = us-east-1"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "file-bucket"

  tags = {
    Name = "My bucket"
    env = "dev"
  }
}