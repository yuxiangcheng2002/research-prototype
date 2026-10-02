# Eval suite

Behavior tests for the skill, run with Claude Code's built-in harness,
`claude plugin eval`. Each case is a directory with `prompt.md` (the prompt,
plus frontmatter for tools, turn limit, and timeout) and `graders/*.md`.
Cases with a fixture also have `case.yaml` and `seed.sh`.

## Running

From the skill directory:

```bash
claude plugin eval . --no-publish --trust-plugin --scaffold \
  --allow-tools WebSearch WebFetch Write Edit "Bash(git *)" "Bash(mkdir *)" \
    "Bash(ls *)" "Bash(cat *)" "Bash(python3 *)" "Bash(node *)" "Bash(chmod *)" \
  --judge-model sonnet --threshold 0.8
```

- `--no-publish` keeps the HTML report local (the CLI publishes by default).
- `--scaffold` and `--trust-plugin` run the cases' `seed.sh` scripts and the
  skill as you, on your machine. The bundled `seed.sh` files only create
  files in the run's temporary workspace, but read them before running, as
  you would any downloaded script; the harness sandbox limits what they can
  reach but is not a guarantee.
- By default the harness also runs every case without the skill, so the
  report shows the skill's effect. Add `--ablation none` to skip that arm and
  roughly halve the cost.
- Filter with `--case <glob>` (one glob) or `--tag <tag>`; repeat runs with
  `--runs 3` before trusting a change, since single runs are noisy.

Each run starts in an empty temporary workspace with no user instructions,
memory, or other skills loaded, so results measure the skill in isolation.
The research cases use live web search, so results drift as web content
changes; check a failing case's trace before blaming the skill.

## Cases

| Case | Tags | Rule under test |
|---|---|---|
| how-it-works-no-scaffold | phase1, trigger | "how does X work": answer first, confidence marks, sources, no files |
| what-is-this-link-short | phase1, depth, trigger | a bare link gets a short answer with sources |
| idea-named-tech | idea, trigger | verdict first; named tech compared with alternatives; reuse and gap; actionable first experiment; at most three one-token options; no premature design |
| idea-half-formed | idea, trigger | a vague "what if" still gets an idea brief |
| hardware-on-hand | trigger, hardware | new board: limits with numbers, offer to run the example now, no purpose gate |
| terse-build-software | trigger, software, build | "prototype X" builds code instead of writing a brief |
| fab-idea-plan-form | trigger, fabrication, idea | first experiment as a controlled plan; no assumed printer settings |
| fab-capture-uses-map | phase2, fabrication | capture files into the repo's `fabresearch.json` paths |
| critique-own-idea | trigger, idea | verdict, strongest objection, strongest defence |
| named-repo-is-consent | phase2, trigger | naming the repo counts as consent; first experiment recorded; committed; no remote |
| build-request-no-skill | trigger-negative | a direct code change does not fire the skill |
| quick-fact-no-skill | trigger-negative | a one-line fact does not fire the skill |
| conceptual-routes-away | trigger-negative | a theory question does not fire the skill |
| code-explain-no-skill | trigger-negative | explaining given code does not fire the skill |
| conflicting-sources | phase1 | disagreeing sources are reconciled, not averaged |
| explicit-scaffold | phase2 | with consent: CLAUDE.md, README, docs, first experiment, skeleton-only code, committed, no remote |
| proposal-stays-proposal | phase2 | an unconfirmed idea lands in Proposals, not Goals |
| scaffold-checks-existing | phase2 | a related repo in the target directory is found before creating a sibling |

`skill-fired` graders are indicators: they cannot pass without the skill and
are excluded from the no-skill arm's score. `skill-not-fired` graders count
in both arms.
