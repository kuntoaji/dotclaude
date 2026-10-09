---
paths:
  - "**/*.tf"
  - "**/*.tfvars"
  - "**/*.hcl"
  - "**/cdk/**"
  - "**/cdk.json"
  - "**/cloudformation/**"
  - "**/template.{yaml,yml,json}"
  - "**/*.template.{yaml,yml,json}"
  - "**/serverless.{yaml,yml}"
  - "**/samconfig.toml"
  - "**/*policy*.json"
---

# AWS Preferences

- IAM: suggest least-privilege IAM whenever you write or review AWS configs (IAM, S3, MSK, KMS). Prefer roles over users. Suggest SCPs for org-level guardrails.
- KMS: prefer KMS-managed encryption over self-managed keys.
- S3: always suggest versioning and Object Lock for audit and compliance buckets.
- MSK: use least-privilege per-topic ACLs. Flag overly broad wildcard permissions.
