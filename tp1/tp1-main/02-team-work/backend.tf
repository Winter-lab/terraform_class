terraform {
  backend "s3" {
    bucket         = "fr-ippon-formation-terraform-tp1-unencrypted-bucket"
    key            = "tp1/team-work" # Check this
    region         = "eu-west-3"
    dynamodb_table = "fr-ippon-formation-terraform-tps-common-remote-backend-dynamo"
  }
}
