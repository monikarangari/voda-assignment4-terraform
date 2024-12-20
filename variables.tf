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
