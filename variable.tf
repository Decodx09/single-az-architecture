variable "environment" {
  description = "Environment name"
  type        = string
  default     = "test"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "general-purpose-web-app"
}

variable "availability_zone_one" {
  description = "Availability Zone"
  type        = string
  default     = "us-east-2a"
}

variable "availability_zone_two" {
  description = "Availability Zone"
  type        = string
  default     = "us-east-2b"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "ecr_image_url" {
    description = "URoL of the ECR image to deploy"
    type        = string
    default     = "123456789012.dkr.ecr.us-east-2.amazonaws.com/my-web-app:latest"
}