variable "AWS_ACCES_KEY" {}
variable "AWS_SECRET_ACCESS" {}

provider "aws" {
  region = var.aws_region
  access_key = var.AWS_ACCES_KEY
  secret_key = var.AWS_SECRET_ACCESS
}

