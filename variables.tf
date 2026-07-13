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
  # --- Unconfirmed validation candidates, derived from azurerm_logic_app_integration_account_certificate's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.IntegrationAccountCertificateName] !ok
  # path: name
  #   condition: length(value) <= 80
  #   message:   [from validate.IntegrationAccountCertificateName: invalid when len(value) > 80]
  #   source:    [from validate.IntegrationAccountCertificateName: invalid when len(value) > 80]
  # path: name
  #   source:    [from validate.IntegrationAccountCertificateName] !regexp.MustCompile(`^[A-Za-z0-9-()._]+$`).MatchString(v)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: integration_account_name
  #   source:    validate.IntegrationAccountName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: key_vault_key.key_name
  #   source:    [from keyvault.ValidateNestedItemName] !ok
  # path: key_vault_key.key_name
  #   condition: length(value) <= 127
  #   message:   [from keyvault.ValidateNestedItemName: invalid when len(value) > 127]
  #   source:    [from keyvault.ValidateNestedItemName: invalid when len(value) > 127]
  # path: key_vault_key.key_name
  #   source:    [from keyvault.ValidateNestedItemName] !regexp.MustCompile(`^[0-9a-zA-Z-]+$`).MatchString(v.(string))
  # path: key_vault_key.key_vault_id
  #   source:    [from validationFunctionForResourceID] !ok
  # path: key_vault_key.key_vault_id
  #   source:    [from validationFunctionForResourceID] err != nil
  # path: key_vault_key.key_version
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: metadata
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: public_certificate
  #   condition: length(value) > 0
  #   message:   must not be empty
}

