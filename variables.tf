variable "logic_app_integration_account_certificates" {
  description = <<EOT
Map of logic_app_integration_account_certificates, attributes below
Required:
    - integration_account_name
    - name
    - resource_group_name
Optional:
    - metadata
    - public_certificate
    - key_vault_key (block):
        - key_name (required)
        - key_vault_id (required)
        - key_version (optional)
EOT

  type = map(object({
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(string)
    public_certificate       = optional(string)
    key_vault_key = optional(object({
      key_name     = string
      key_vault_id = string
      key_version  = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        v.key_vault_key == null || (length(v.key_vault_key.key_name) <= 127)
      )
    ])
    error_message = "[from keyvault.ValidateNestedItemName: invalid when len(value) > 127]"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        v.key_vault_key == null || (v.key_vault_key.key_version == null || (length(v.key_vault_key.key_version) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        v.metadata == null || (can(jsondecode(v.metadata)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_integration_account_certificates : (
        v.public_certificate == null || (length(v.public_certificate) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

