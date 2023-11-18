data "aws_availability_zones" "available" {}

############# Instance Profile Lookup ##############

data "aws_iam_instance_profile" "base_role" {
  name = "ec2-base-role"
}

################ Ubuntu 20.04 LTS Default Image Lookup ######################

data "aws_ami" "ubuntu_20" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

################ Ubuntu 20.04 LTS Packer Image Lookup ######################

data "aws_ami" "packer_ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["packer-web-prod*"]
  }
}

################ Route53 Data Source Lookup ###############

data "aws_route53_zone" "johnyfoster_zone" {
  name = "johnyfoster.com."
}

################### Certificate Data Source Lookup ###############

# Find a certificate issued by (not imported into) ACM

# data "aws_acm_certificate" "johnyfoster_ssl_cert" {
#   domain      = "*.johnyfoster.com"
#   types       = ["AMAZON_ISSUED"]
#   most_recent = true
# }

data "aws_acm_certificate" "johnyfoster_ssl_cert" {
  domain      = "www.johnyfoster.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}