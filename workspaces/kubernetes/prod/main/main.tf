provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  
  tags = {
    Name = "infracost-test-instance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket        = "infracost-test-bucket-${random_id.bucket_id.hex}"
  force_destroy = true
  
  tags = {
    Name = "infracost-test-bucket"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}