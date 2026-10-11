variable "file_storage_replications" {
  description = <<EOT
Map of file_storage_replications, attributes below
Required:
    - compartment_id
    - source_id
    - target_id
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - is_lock_override
    - replication_interval
    - locks (block):
        - message (optional)
        - related_resource_id (optional)
        - time_created (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id       = string
    source_id            = string
    target_id            = string
    defined_tags         = optional(map(string))
    display_name         = optional(string)
    freeform_tags        = optional(map(string))
    is_lock_override     = optional(bool)
    replication_interval = optional(string)
    locks = optional(list(object({
      message             = optional(string)
      related_resource_id = optional(string)
      time_created        = optional(string)
      type                = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

