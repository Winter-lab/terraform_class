provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      "owner"    = "formation-terraform"
      "practice" = "cloud-and-devops"
    }
  }
}
