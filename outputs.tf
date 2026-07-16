output "logic_app_integration_account_certificates_id" {
  description = "Map of id values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "logic_app_integration_account_certificates_integration_account_name" {
  description = "Map of integration_account_name values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.integration_account_name if v.integration_account_name != null && length(v.integration_account_name) > 0 }
}
output "logic_app_integration_account_certificates_key_vault_key" {
  description = "Map of key_vault_key values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.key_vault_key if v.key_vault_key != null && length(v.key_vault_key) > 0 }
}
output "logic_app_integration_account_certificates_metadata" {
  description = "Map of metadata values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "logic_app_integration_account_certificates_name" {
  description = "Map of name values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "logic_app_integration_account_certificates_public_certificate" {
  description = "Map of public_certificate values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.public_certificate if v.public_certificate != null && length(v.public_certificate) > 0 }
}
output "logic_app_integration_account_certificates_resource_group_name" {
  description = "Map of resource_group_name values across all logic_app_integration_account_certificates, keyed the same as var.logic_app_integration_account_certificates"
  value       = { for k, v in azurerm_logic_app_integration_account_certificate.logic_app_integration_account_certificates : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

