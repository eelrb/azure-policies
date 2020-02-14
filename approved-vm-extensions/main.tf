{
  "properties": {
    "displayName": "Only approved VM extensions should be installed",
    "policyType": "BuiltIn",
    "mode": "Indexed",
    "description": "This policy governs the virtual machine extensions that are not approved.",
    "metadata": {
      "version": "1.0.0",
      "category": "Compute"
    },
    "parameters": {
      "effect": {
        "type": "string",
        "defaultValue": "Audit",
        "allowedValues": [
          "Audit",
          "Deny",
          "Disabled"
        ],
        "metadata": {
          "displayName": "Effect",
          "description": "The effect determines what happens when the policy rule is evaluated to match"
        }
      },
      "approvedExtensions": {
        "type": "Array",
        "metadata": {
          "description": "The list of approved extension types that can be installed. Example: AzureDiskEncryption",
          "displayName": "Approved extensions"
        }
      }
    },
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Compute/virtualMachines/extensions"
          },
          {
            "field": "Microsoft.Compute/virtualMachines/extensions/type",
            "notIn": "[parameters('approvedExtensions')]"
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]"
      }
    }
  },
  "id": "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432",
  "name": "c0e996f8-39cf-4af9-9f45-83fbde810432"
}
