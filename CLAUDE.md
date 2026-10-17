# User-Level Instructions

## General Guidelines
- Never use the em dash "—". Use a plain dash or hyphen "-" instead. This applies to all output: prose, code comments, commit messages, and drafted communications
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- Reconcile with the "Simplicity first" section of `~/.claude/rules/engineering-discipline.md`: favor the simplest solution that solves the problem, but never trade long-term maintainability for short-term dev speed. Simple does not mean speculative; scalable does not mean over-engineered.

## Identity and Role
- Security Engineer (AppSec focus)
- Stack exposure: Ruby, C#, Python, Go, JavaScript, AWS, Cloudflare

## Security Defaults (Always Apply)
- Flag hardcoded secrets, tokens, API keys, or credentials in production code - no exceptions. In test/mock/fixture code, flag only values that look like real credentials; an active review plugin's false-positive rules govern its own reports. For reporting order and format, see the security-findings exception in `~/.claude/rules/engineering-discipline.md`
- Flag credentials stored in plaintext config files or environment variables without a secrets manager (for example `.env`, `.env.rb`). Prefer AWS Secrets Manager or SSM Parameter Store. Never commit .env files
- Prefer parameterized queries; never construct SQL/queries via string interpolation
- Highlight missing input validation, missing output encoding, and missing auth checks
- Call out PII handling risks (logging, storage, transmission, retention) - flag GDPR Article 32 relevance. PII includes IP addresses, geolocation, device IDs, and chat/user IDs, not only names and emails. Check for a retention limit on stored PII
- When reviewing session management: check token lifetime, rotation, revocation, and storage (no localStorage for sensitive tokens)
- Use STRIDE framing when designing or reviewing a new feature or integration. Do not apply it to small changes in existing code
- AWS preferences live in `~/.claude/rules/aws.md` and load automatically only for infrastructure files. Read that file before you answer any other AWS question

## Communication Style
- Write all prose per `~/.claude/rules/writing-quality.md`: ASD-STE100 mechanics and Zinsser's four principles
- Output should be copy-paste ready by default
- When correcting writing: return only the corrected text, no commentary
- Use plain language, and open with the substance
- Prefer bullet points for lists, prose for explanations
- For every message I send, check my English and help me improve it. After answering my request, add a short "English check" section with a corrected, more natural version of my message, followed by the key changes and a one-line reason for each. Focus on grammar, word choice, and natural phrasing. If my message is already natural, just say so briefly. Keep the feedback concise. This is the only exception to the "no commentary" rule above

## Tooling Preferences
- macOS / MacBook Pro; Linux; AWS CLI
- Git: conventional commits preferred. Name branches per Conventional Branch (https://conventionalbranch.org/): `<type>/<description>`, where type is `feat/`, `fix/`, `hotfix/`, `release/` or `chore/`. Use lowercase letters, numbers and hyphens only. No leading, trailing or repeated hyphens or dots; use dots only for versions in `release/` (`release/v1.2.0`). Add the ticket number when one exists (`fix/issue-123-invoice-xss`). Security fixes use `fix/`, or `hotfix/` when urgent. Always use a purpose prefix, never an agent prefix such as `claude/`
