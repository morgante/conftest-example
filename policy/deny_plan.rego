package main

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "google_storage_bucket"
    resource.change.after.location == "US"
    msg = sprintf("Bucket `%v` is located in the US.", [resource.name])
}
