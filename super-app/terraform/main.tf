provider "aws" {
  region = "us-west-2" # Specify your desired AWS region here
  
  # If you're using environment variables for credentials:
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  
  # If you're using a shared credentials file:
  # shared_credentials_file = "/path/to/your/aws/credentials/file"
  
  # If you're running Terraform on an EC2 instance with an IAM role:
  # assume_role {
  #   role_arn = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
  # }
}

