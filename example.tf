terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

variable "tags" {
  type = map
  default = { Name = "testing-terraform-cloud" }
}

variable "instance_type" {
  type = string
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "gov.lbl.go.my-log-bucket"
  acl    = "log-delivery-write"
  tags = var.tags
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "gov.lbl.go.my-test-bucket"
  acl    = "private"
  tags = var.tags

  versioning {
    enabled = false 
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
}

resource "aws_instance" "test_instance_1" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_type
  tags          = var.tags
}

resource "aws_instance" "test_instance_2" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_type
  tags          = var.tags
}
