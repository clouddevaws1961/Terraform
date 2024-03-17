provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA2KX6GJUY4ZYZQX42"
  secret_key = "mPVBomgRmqR37LCtLhSfq8o/41Mek0OOSRnWsb7a"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}