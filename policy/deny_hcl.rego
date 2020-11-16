package main

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    location := input.resource.google_storage_bucket[bucket].location
    location == "US"
    msg = sprintf("Bucket `%v` is located in the US.", [bucket])
}
