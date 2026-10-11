variable "s3_bucket_lifecycle_configurations" {
  description = <<EOT
Map of s3_bucket_lifecycle_configurations, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - region
    - transition_default_minimum_object_size
    - rule (block):
        - abort_incomplete_multipart_upload (optional, block):
            - days_after_initiation (optional)
        - expiration (optional, block):
            - date (optional)
            - days (optional)
            - expired_object_delete_marker (optional)
        - filter (optional, block):
            - and (optional, block):
                - object_size_greater_than (optional)
                - object_size_less_than (optional)
                - prefix (optional)
                - tags (optional)
            - object_size_greater_than (optional)
            - object_size_less_than (optional)
            - prefix (optional)
            - tag (optional, block):
                - key (required)
                - value (required)
        - id (required)
        - noncurrent_version_expiration (optional, block):
            - newer_noncurrent_versions (optional)
            - noncurrent_days (required)
        - noncurrent_version_transition (optional, block):
            - newer_noncurrent_versions (optional)
            - noncurrent_days (required)
            - storage_class (required)
        - prefix (optional)
        - status (required)
        - transition (optional, block):
            - date (optional)
            - days (optional)
            - storage_class (required)
EOT

  type = map(object({
    bucket                                 = string
    expected_bucket_owner                  = optional(string)
    region                                 = optional(string)
    transition_default_minimum_object_size = optional(string)
    rule = optional(list(object({
      abort_incomplete_multipart_upload = optional(list(object({
        days_after_initiation = optional(number)
      })))
      expiration = optional(list(object({
        date                         = optional(string)
        days                         = optional(number)
        expired_object_delete_marker = optional(bool)
      })))
      filter = optional(list(object({
        and = optional(list(object({
          object_size_greater_than = optional(number)
          object_size_less_than    = optional(number)
          prefix                   = optional(string)
          tags                     = optional(map(string))
        })))
        object_size_greater_than = optional(number)
        object_size_less_than    = optional(number)
        prefix                   = optional(string)
        tag = optional(list(object({
          key   = string
          value = string
        })))
      })))
      id = string
      noncurrent_version_expiration = optional(list(object({
        newer_noncurrent_versions = optional(number)
        noncurrent_days           = number
      })))
      noncurrent_version_transition = optional(list(object({
        newer_noncurrent_versions = optional(number)
        noncurrent_days           = number
        storage_class             = string
      })))
      prefix = optional(string)
      status = string
      transition = optional(list(object({
        date          = optional(string)
        days          = optional(number)
        storage_class = string
      })))
    })))
  }))
}

