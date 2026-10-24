terraform {
  backend "s3" {
    bucket       = "terraform-statefile-afrid-001"
    key          = "vpc-webserver/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

