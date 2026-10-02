# Phase 2 templates

Templates for a new capture repo. A fabrication-research capture into a repo
with a `fabresearch.json` map follows the map's paths instead; the CLAUDE.md
sections below still apply at its project_docs location.

## Language

Reply in the conversation language. Committed artifacts (CLAUDE.md,
README.md, docs/) are written in English unless the user or the target
repo's conventions say otherwise.

## CLAUDE.md

```markdown
# <project-name>

<one sentence: what this is and why it exists>

## Current goals
- <only goals the user stated or confirmed>

## First experiment
- Tests: <riskiest assumption>
- Uses: <owned parts/tools> ; to buy: <items, or "none">
- Procedure: <command or steps>
- Results: `tests/results/<case>/` (raw data kept)

## Open questions
- **<topic>** [needs: ruling | measurement | lookup] — <what is unknown and why it matters>

## Proposals (not yet approved)
- <ideas raised during research — yours or the user's asides — not accepted yet>

## Key decisions (and why)
- **<decision>** — <reasoning; pointer to docs/ if applicable>

## Known constraints
- <hard constraint, with the reason>

## Owned hardware / related repos
- <part or repo> — <role here; verified state>

## Dead ends / things ruled out
- *<approach>* — ruled out <YYYY-MM-DD>: <why it does not work>

## Not yet tested
- <one line>

## Internal docs
- `docs/<file>.md` — <contents>

## References
- <Title>: <URL>
```

Filling rules:
- Resolve `[needs: lookup]` questions yourself before writing the file; only
  rulings and measurements should remain.
- Dead ends include approaches the user rejected and approaches the research
  showed cannot work, each with its reason (e.g. "polling the sensor faster
  than its conversion time — returns the previous sample, per datasheet §7").
  Record your own corrected mistakes too.
- Key decisions hold only what the user confirmed or physics/specs force.
- Omit sections that would be empty, except Current goals, First experiment,
  and Proposals.

## README.md

````markdown
# <project-name>

<one paragraph: what and why>

## Status
- [ ] First experiment: <one line> — see CLAUDE.md
- [ ] <next step>

See `CLAUDE.md` for decisions, open questions, and dead ends.
See `docs/<file>.md` for <topic>.

## Layout
```
<project-name>/
├── CLAUDE.md
├── README.md
├── docs/
└── tests/results/
```
````

## .gitignore

Start from `.DS_Store`, `.vscode/`, `.idea/`, `*.swp`; add domain patterns
(build artifacts, bytecode, large captures) when relevant. Do not ignore
`tests/results/` — raw results are kept.

## Initial commit message

```
init: <project-name> from Phase 1 research

- CLAUDE.md: <first experiment; decisions and open questions in one line>
- docs/<file>.md: <captured technical content in one line>
- <first-experiment skeleton, if any>
- README.md, .gitignore
```
