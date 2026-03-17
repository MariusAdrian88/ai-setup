## v1.22.0 (2026-03-17)

### Features

- **cursor**: two-tier model system and ask mode for faster responses
- **scoring**: auto-fix grounding, density, duplicates, and skills during init

### Bug Fixes

- **cursor**: skip duplicate final event in stream-json output
- **cursor**: sandbox workspace to /tmp and remove injection-triggering markers
- **cursor**: remove system/user markers that trigger injection detection
- **cursor**: add --trust flag required for headless print mode
- **cursor**: use temp dir as cwd to prevent agent from browsing repo
- **cursor**: add direct-LLM preamble to prevent agent behavior
- **cursor**: remove --mode ask that caused conversational responses
- increase skills search timeout and reduce fetch overhead
- **init**: widen task name column to prevent text overlap
- **cursor**: persistent ACP connection to eliminate per-call process overhead
- **cursor**: fix terminal corruption and scan model leak in cursor provider

### Refactoring

- **cursor**: switch from ACP to headless --print mode

## v1.21.3 (2026-03-17)

## v1.21.2 (2026-03-17)

## v1.21.1 (2026-03-16)

# Changelog

## v1.21.0 (2026-03-16)

### Features

- **ci**: auto-generate CHANGELOG.md on release (#24)
