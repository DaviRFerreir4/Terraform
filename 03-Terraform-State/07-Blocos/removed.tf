removed {
  from = aws_s3_bucket.bucket_2

  lifecycle {
    destroy = false
  }
}