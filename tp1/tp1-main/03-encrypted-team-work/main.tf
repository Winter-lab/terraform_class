resource "aws_kms_key" "secret" {
  description         = "tp1-terraform-formation-key-for-the-team-2"
  enable_key_rotation = true
}

resource "aws_secretsmanager_secret" "secret" {
  name       = "tp1-terraform-formation-secret-for-the-team-2"
  kms_key_id = aws_kms_key.secret.arn
}

# This is for the sake of the example, now terraform has improved its state
# management and using random_password, the value is not displayed in the state
resource "aws_secretsmanager_secret_version" "secret" {
  secret_string = random_password.secret.result
  secret_id     = aws_secretsmanager_secret.secret.id
}
