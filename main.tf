module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id     = module.vpc.subnet_id
  ami_id        = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "terraform-avi-demo-bucket-123456"
}
module "cost_alert" {
  source = "./modules/budget-alert"

  budget_name  = "Budget-warning"
  limit_amount = 5

  threshold = 80

  email_address = "ranisatyabhama05@gmail.com"
}
