provider "aws" {
    region = var.aws-region
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "s3-terraform-bucket"
    acl = "private"
    versioning {
        enabled = true
    }

    tags = {
        Name = "s3-terraform-bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_object" "images" {
    bucket = aws_s3_bucket.s3_bucket.id
    acl    = "private"
    key    = "images/"
    source = "/dev/null"
}


