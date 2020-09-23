#  Trasport Layer Security
resource "tls_private_key" "cloudtest" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "cloudtest" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.cloudtest.private_key_pem

  subject {
    common_name  = "cloudtechtest.com"
    organization = "cloudtechtest"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "cert" {
  private_key = tls_private_key.cloudtest.private_key_pem
  certificate_body = tls_self_signed_cert.cloudtest.cert_pem
}