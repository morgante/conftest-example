# Conftest Example

Run conftest to analyze your Terraform config:
```
conftest test main.tf
```

Observe that only *1 violation* is reported,
even though the both buckets should be flagged.

This is because conftest works off a "simplistic" analysis of the Terraform config.
In particular, it doesn't do any flattening or conversion of modules
before they are passed to your policies.
