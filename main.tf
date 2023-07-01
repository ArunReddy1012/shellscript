
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  access_key = "AKIASNTKHSJH5INU72MC"
  secret_key = "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"
}

resource "aws_instance" "kubernetes-servers" {
    count=length(var.name)
    ami=var.ami
    instance_type=var.instance_type
    tags={
        name=var.name(each.value)
        }
}