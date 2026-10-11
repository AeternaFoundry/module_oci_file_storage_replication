resource "oci_file_storage_replication" "file_storage_replications" {
  for_each = var.file_storage_replications

  compartment_id       = each.value.compartment_id
  source_id            = each.value.source_id
  target_id            = each.value.target_id
  defined_tags         = each.value.defined_tags
  display_name         = each.value.display_name
  freeform_tags        = each.value.freeform_tags
  is_lock_override     = each.value.is_lock_override
  replication_interval = each.value.replication_interval

  dynamic "locks" {
    for_each = each.value.locks != null ? each.value.locks : []
    content {
      message             = locks.value.message
      related_resource_id = locks.value.related_resource_id
      time_created        = locks.value.time_created
      type                = locks.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

