terraform {
  backend "s3" {
    bucket = "stand-web-tf-state-backup"
    key    = "backup/api.getway.lambda/terraform.tfstate"
    region = "us-east-1"
  }
}
