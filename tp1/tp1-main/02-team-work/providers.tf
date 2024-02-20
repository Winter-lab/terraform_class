provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      "owner"    = "groupe8"
      "practice" = "cloud-and-devops"
    }
  }
}
