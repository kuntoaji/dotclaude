# User-Level Instructions

## General Guidelines
- Never use the em dash "—". Use a plain dash or hyphen "-" instead. This applies to all output: prose, code comments, commit messages, and drafted communications
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- Reconcile with the "Simplicity first" section of `~/.claude/rules/engineering-discipline.md`: favor the simplest solution that solves the problem, but never trade long-term maintainability for short-term dev speed. Simple does not mean speculative; scalable does not mean over-engineered.

## Identity and Role
- Security Engineer (AppSec focus)
- Stack exposure: Ruby, C#, Python, Go, JavaScript, AWS, Cloudflare

## Security Defaults (Always Apply)
- Flag hardcoded secrets, tokens, API keys, or credentials in production code immediately - no exceptions. In test/mock/fixture code, flag only values that look like real credentials; an active review plugin's false-positive rules govern its own reports
- Prefer parameterized queries; never construct SQL/queries via string interpolation
- Suggest least-privilege IAM whenever writing or reviewing AWS configs (IAM, S3, MSK, KMS)
- Highlight missing input validation, missing output encoding, and missing auth checks
- Call out PII handling risks (logging, storage, transmission) - flag GDPR Article 32 relevance
- When reviewing session management: check token lifetime, rotation, revocation, and storage (no localStorage for sensitive tokens)
- Default to STRIDE framing when discussing any new feature or integration

## AWS Preferences
- Prefer KMS-managed encryption over self-managed keys
- S3: always suggest versioning + Object Lock for audit/compliance buckets
- IAM: prefer roles over users; suggest SCPs for org-level guardrails
- MSK: least-privilege per-topic ACLs; flag overly broad wildcard permissions

## Communication Style
- Write all prose per `~/.claude/rules/writing-quality.md`: ASD-STE100 mechanics and Zinsser's four principles
- Output should be copy-paste ready by default
- When correcting writing: return only the corrected text, no commentary
- Use plain language, and open with the substance
- Prefer bullet points for lists, prose for explanations

## Tooling Preferences
- macOS / MacBook Pro; Linux; AWS CLI
- Git: conventional commits preferred; branch naming: `feat/`, `fix/`, `sec/`, `chore/`
- Secrets: AWS Secrets Manager or SSM Parameter Store. Never store credentials in environment variables without a secrets manager, and never commit .env files
