terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.0"
    }
  }

  # backend "s3" {
  #   encrypt = true
  # }
}
