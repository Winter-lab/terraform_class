resource "random_string" "name_suffix" {
  length  = 5
  special = false
}

resource "random_string" "secret" {
  length  = 16
  special = true
}

resource "random_password" "secret" {
  length  = 16
  special = true
}
