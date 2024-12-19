output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "file_url" {
  value = aws_s3_bucket_object.my_file.bucket + "/" + aws_s3_bucket_object.my_file.key
}
