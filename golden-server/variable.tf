variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "github_repo_url" {
  description = "The URL of the GitHub repository to clone."
  type        = string
  default     = "https://github.com/Decodx09/S-Commerce.git"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance. This is an Amazon Linux 2 AMI."
  type        = string
  default     = "ami-0c803b171269e2d72"
}

variable "key_name" {
  description = "The name of the EC2 Key Pair to use for SSH access."
  type        = string
  default     = "shivanshsukhijakey"
}

variable "folder_name" {
  description = "The name of the folder to clone from the GitHub repository."
  type        = string
  default     = "S-Commerce"
}

variable "before_npm" {
  description = "The path to the folder where npm install should be run."
  type        = string
  default     = "/home/ec2-user/S-commerce/backend"
}
