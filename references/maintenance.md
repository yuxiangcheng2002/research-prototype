# Maintenance notes

Maintainer-facing notes for editing this skill — not runtime instructions.

## Dead ends

- *Auto-scaffolding after the first research turn.* Writing to disk without
  consent; the research itself is the offer.
- *Single-source claims stated as facts.* Produces an overconfident
  CLAUDE.md that misleads later sessions. Attribution stays until verified.
- *One fixed project structure for every topic.* Hardware work, software,
  paper research, and fabrication research want different layouts.
- *A mandatory multi-section essay for every question.* Replies ran far
  longer than the questions needed. Depth now scales with the question, and
  the answer comes first.
- *A fixed idea brief with restatement, purpose questions, and validation
  gates.* In practice users wanted a verdict, reuse and gap, mechanism with
  numbers, and a first experiment they can run with what they own; purpose
  questions and pre-build gates were ignored or refused.
- *Docs-only capture repos.* Repos that held only research notes tended to
  stall; captures now carry a first experiment.
- *Real user projects as worked examples.* A project-specific example biases
  every invocation toward that project. Use canonical examples.

## Eval harness pitfalls (`claude plugin eval`)

- `file_exists` globs do not support `{a,b}` or `[abc]`; such a grader never
  matches, so `exists: false` passes vacuously. Use a regex grader with
  `target: files`.
- A `{ source: file }` target takes one literal path, not a glob.
- Writes outside the case's working directory are denied in the sandbox, so
  capture cases must name a path under it.
- LLM judges misread nuanced criteria; keep each to one checkable PASS/FAIL
  condition and use a capable judge model.
- The CLI publishes the HTML report by default; pass `--no-publish` to keep
  it local.

## Evaluation

See `evals/README.md`.
