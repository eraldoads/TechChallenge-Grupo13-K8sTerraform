terraform {
  backend "s3" {
    bucket = "piklesfastfood"
    key    = "K8sTerraform/terraform.tfstate"
    region = "us-east-1" # Escolha sua região
  }
}

provider "aws" {
  profile = "default"
  region  = var.regionDefault

  default_tags {
    tags = var.tags
  }
}