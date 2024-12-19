variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = "monika-voda-assignment"
}

variable "file_path" {
  description = "The path to the file to upload"
  type        = "/d/index.html"
}

variable "allowed_ip" {
  description = "The IP address allowed to access the S3 bucket"
  type        = "103.189.98.196"
}
