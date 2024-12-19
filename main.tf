provider "aws" {
  region = "ap-southeast-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "file_path" {
  description = "The path to the file to upload"
  type        = string
}

variable "allowed_ip" {
  description = "The IP address allowed to access the S3 bucket"
  type        = string
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp" = var.allowed_ip
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_object" "my_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = basename(var.file_path)
  source = var.file_path
}
