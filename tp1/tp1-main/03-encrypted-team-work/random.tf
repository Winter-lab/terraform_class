resource "random_password" "secret" {
  length  = 16
  special = true
}
