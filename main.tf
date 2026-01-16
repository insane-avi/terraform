module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id     = module.vpc.subnet_id
  ami_id        = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "terraform-avi-demo-bucket-123456"
}
