resource "aws_s3_bucket" "teste" {
  bucket = "drf-terraform-blocks-1"
}

resource "aws_s3_bucket" "bucket_2" {
  bucket = "drf-terraform-blocks-2"
}

resource "aws_s3_bucket" "bucket_3" {
  bucket = "drf-terraform-blocks-3"
}