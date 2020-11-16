# Conftest Examples

## HCL Example

This example is based on analyzing the Terraform config directly.

Run conftest to analyze your Terraform config:
```
conftest test main.tf
```

Observe that only *1 violation* is reported,
even though the both buckets should be flagged.

This is because conftest's HCL analysis works off a "simplistic" analysis of the Terraform config.
In particular, it doesn't do any flattening or conversion of modules
before they are passed to your policies.

## Plan Example (Preferred)

This example is based on analyzing the Terraform plan JSON output.
**This approach is superior and should be preferred.**

Generate a plan to analyze:
```
terraform init
terraform plan -out=terraform.tfplan
terraform show -json terraform.tfplan > terraform.tfplan.json
```

Analyze the plan:
```
conftest test terraform.tfplan.json
```

This approach successfully detects violations because it is based on the analysis of the full Terraform plan output.
