provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

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

resource "aws_s3_object" "my_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = basename(var.file_path)
  source = var.file_path
}

output "file_url" {
  value = "s3://${aws_s3_bucket.my_bucket.arn}/${aws_s3_object.my_file.key}"
}
