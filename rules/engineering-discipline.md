# Engineering Discipline

Guidelines to reduce common LLM coding mistakes. Adapted from Andrej Karpathy's observations
on LLM coding pitfalls (via multica-ai/andrej-karpathy-skills, MIT). These bias toward caution
over speed; for trivial tasks, use judgment.

## Think before coding

Do not assume. Do not hide confusion. Surface tradeoffs.

- State assumptions explicitly before implementing. If uncertain, ask.
- If multiple interpretations of the request exist, present them. Do not pick one silently.
- If a simpler approach exists than the one requested, say so. Push back when warranted.
- If something is unclear, stop, name what is confusing, and ask. Do not code around confusion.

## Simplicity first

Write the minimum code that solves the stated problem. Nothing speculative.

- No features, flexibility, or configurability beyond what was asked.
- No abstractions for single-use code.
- No error handling for scenarios that cannot occur.
- If the solution is 200 lines and could be 50, rewrite it before presenting it.
- Test: would a senior engineer call this overcomplicated? If yes, simplify.

Simplicity is not corner-cutting. Input validation, authz checks, and safe defaults for the
code being written are part of the minimum, not speculative extras.

## Surgical changes

Touch only what the request requires. Clean up only your own mess.

- Do not "improve" adjacent code, comments, or formatting.
- Do not refactor code that is not broken.
- Match the existing style of the file, even when you would choose differently.
- Remove imports, variables, and functions that YOUR change made unused.
- Do not delete pre-existing dead code unless asked.
- Test: every changed line traces directly to the user's request.

Exception for security findings: if you notice a security problem in code you were not asked
to touch (hardcoded secret, injection risk, missing authz, unsafe deserialization), do not fix
it silently and do not ignore it.

- Scope: check every file you read for the task against the Security Defaults in
  `~/.claude/CLAUDE.md`. Do not open extra files only to audit them unless asked.
- Order: report a live credential (a real secret in tracked code or git history) before you
  continue the task. Finish the requested change first for all other findings.
- Format: report findings in a separate section, ranked by severity. Give each one:
  severity (High/Medium/Low), `file:line`, impact in one sentence, and the fix.

## Goal-driven execution

Define success criteria before starting. Loop until verified, not until it "looks done".

- Transform vague tasks into verifiable goals:
  - "Add validation" becomes "write tests for invalid inputs, then make them pass".
  - "Fix the bug" becomes "write a test that reproduces it, then make it pass".
  - "Refactor X" becomes "ensure tests pass before and after, with no behavior change".
- For multi-step tasks, state a brief plan with a verification step per item:
  1. [Step], verify: [check]
  2. [Step], verify: [check]
- Verification means running the check (tests, build, lint), not asserting that it would pass.
- If success criteria cannot be made verifiable, say so and ask what "done" means before
  writing code.
