terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

resource "aws_s3_bucket" "etag_bucket" {
  tags = {
    Name        = "behlole-cool-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "etag_bucket" {
  bucket = aws_s3_bucket.etag_bucket.id
  key    = "myfile.txt"
  source = "myfile.txt"
  etag = filemd5("myfile.txt")

}
