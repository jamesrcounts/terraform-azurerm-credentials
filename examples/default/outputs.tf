output "credentials" {
  sensitive = true
  value     = module.test_credentials.credentials
}