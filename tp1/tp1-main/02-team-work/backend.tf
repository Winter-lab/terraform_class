terraform {
  backend "s3" {
    bucket         = "tp-terraform-states-eu-west-3"
    key            = "tp1/groupe8" # Check this
    region         = "eu-west-3"
    dynamodb_table = "tp-terraform-states-eu-west-3"
  }
}
