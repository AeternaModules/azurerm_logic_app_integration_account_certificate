output "logic_app_integration_account_certificates" {
  description = "All logic_app_integration_account_certificate resources"
  value       = azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates
}
output "logic_app_integration_account_certificates_integration_account_name" {
  description = "List of integration_account_name values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.integration_account_name]
}
output "logic_app_integration_account_certificates_key_vault_key" {
  description = "List of key_vault_key values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.key_vault_key]
}
output "logic_app_integration_account_certificates_metadata" {
  description = "List of metadata values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.metadata]
}
output "logic_app_integration_account_certificates_name" {
  description = "List of name values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.name]
}
output "logic_app_integration_account_certificates_public_certificate" {
  description = "List of public_certificate values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.public_certificate]
}
output "logic_app_integration_account_certificates_resource_group_name" {
  description = "List of resource_group_name values across all logic_app_integration_account_certificates"
  value       = [for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : v.resource_group_name]
}

