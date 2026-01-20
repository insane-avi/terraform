terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-aviral-2026"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
