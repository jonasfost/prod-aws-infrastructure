terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#######################################
###### Configure the AWS Provider #####
#######################################

provider "registry.terraform.io/hashicorp/aws" {
  region = "us-east-2"
}

####################################################
##### Terraform Cloud For Remote State #############
####################################################

terraform {
  cloud {
    organization = "jonasfost"

    workspaces {
      name = "prod-us-east-2-infrastructure"
    }
  }
}