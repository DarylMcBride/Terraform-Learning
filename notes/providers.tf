#https://www.terraform.io/docs/providers/index.html
#basic examples
provider "google" {
    version = "~> 1.7"
    project = "cl-terraform"
    region = "us-central1"
}

provider "aws" {
    version = ">= 1.2, < 1.12"
    region = "us-west-2"
}

provider "google" {
    alias = "west"
    project = "cl-terraform"
    region= "us-west1"
}