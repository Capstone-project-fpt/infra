variable "aws_access_key" {
  description = "The IAM public access key"
}

variable "aws_secret_key" {
  description = "value of the IAM secret key"
}

variable "aws_region" {
  description = "value of the AWS region"
  default     = "ap-southeast-1"
}
