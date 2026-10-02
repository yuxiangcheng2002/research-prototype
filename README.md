# research-prototype

An agent skill for Claude Code (and other hosts that read `SKILL.md` skills)
that handles the first hour of a new idea: is it feasible, what already
exists, what the mechanism and its limits are, and what the cheapest first
experiment is. When asked, it captures the result as a small repo that
starts from that first experiment rather than from notes.

## Quickstart

```bash
git clone https://github.com/yuxiangcheng2002/research-prototype.git ~/.claude/skills/research-prototype
```

Then, in a new Claude Code session, bring up an idea or a thing you want to
understand:

```
what if a plant pot could tell you when it needs water by changing colour
```

The skill also triggers on new hardware ("got a new dev board"), on
"how does X work", on a pasted product link, repo, paper, or datasheet, and
on "prototype X". Optionally add a line like
`Prototypes directory: ~/code/prototypes` to your global `CLAUDE.md` so
captured repos land there; otherwise the skill asks once.

---

## What it does

- **Idea brief.** A verdict first, then: the assumed goal and scale, the
  closest existing work you could reuse and the gap it leaves, the mechanism
  and its limits with numbers, candidate parts (yours first), a first
  experiment phrased as something to run or buy, and at most three numbered
  next steps.
- **Routing by request.** A terse "prototype X" goes straight to building;
  hardware already on the bench gets a short read and an offer to run the
  vendor example; "how does X work" gets an answer-first explanation.
- **Three domains.** Hardware (including firmware), software, and
  fabrication research each have their own capture path. Software captures
  start with a runnable spike; fabrication-research captures follow an
  existing `fabresearch.json` project map when one is present.
- **Consent before writing.** It never creates files until you say so, name
  the repo, or accept its offer. Repos stay local and private unless you ask
  otherwise.
- **Checked specs.** Specifications are looked up against the specific part
  or datasheet and cited, not recalled.

`SKILL.md` names companion skills that hand off specific work: `circuit`
(bench and firmware), `hard-cad` / `hard-eda` (mechanical and PCB design),
`hard-bom` (procurement), `fabresearch` (fabrication-research workflows),
`theorize` (theory questions), `taobao` (marketplace listings), and
`research-handoff` (packaging a finished conversation). They are the
author's own skills and are not published. All are optional: without them,
this skill does the work itself or answers directly.

## Layout

| Path | Contents |
|---|---|
| `SKILL.md` | the skill: routing, idea brief, research rules, capture rules |
| `references/templates.md` | CLAUDE.md / README templates for captured repos |
| `references/maintenance.md` | dead ends and eval-harness pitfalls, for maintainers |
| `evals/` | behaviour tests for `claude plugin eval`; see [evals/README.md](evals/README.md) |
| `.gitignore` | keeps local eval results (`evals/results/`) out of commits |

## Status

Alpha. The rules come from one person's working sessions and are tuned for
hardware/software prototyping in a research setting. Issues and pull
requests are welcome; expect slow responses.

## License

MIT — see [LICENSE](LICENSE).
