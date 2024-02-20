terraform {
  backend "s3" {
    bucket         = "fr-ippon-formation-terraform-tps-common-remote-backend-bucket"
    key            = "tp1/team-work" # Check this
    region         = "eu-west-1"
    dynamodb_table = "fr-ippon-formation-terraform-tps-common-remote-backend-dynamo"
  }
}
