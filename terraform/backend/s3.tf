resource "aws_s3_bucket" "project-bkt" {
  bucket = var.s3bkt

  tags = {
    Name = "Project TF CircleCI State Bucket"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.project-bkt.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.project-bkt.id
  versioning_configuration {
    status = "Enabled"
  }
}

