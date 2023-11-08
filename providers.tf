terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74"
    }
  }
}

#######################################
###### Configure the AWS Provider #####
#######################################

provider "aws" {
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