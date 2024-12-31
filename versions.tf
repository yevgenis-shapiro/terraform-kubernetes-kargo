
terraform {
  required_providers {

    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.9.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.11.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }

    external = {
      source = "hashicorp/external"
      version = "2.1.0"
   }
 }

  required_version = ">= 0.14.3"
}
