---
name: research-prototype
description: >-
  Default entry point for any new project idea and any concrete thing worth
  understanding, across hardware (including firmware), software, and
  fabrication research. Use whenever the user brings up something they might
  build or make ("I want to build...", "what if...", "idea:", "prototype
  X"), even half-formed, mid-session, or with a technology already named;
  asks for critique of their own idea; shows off new gear ("new toy", "X is
  a fantastic dev board"); or wants to understand a specific part, library,
  algorithm, protocol, or mechanism ("investigate X", "how does X work",
  "what is this?") or drops a product link, repo, paper, or datasheet.
  Researches feasibility, reuse, and mechanisms, then gets to a first
  experiment fast. Lean toward triggering. Not for one-line facts, explaining
  code already in the workspace, fixing an existing project, or theory
  questions (theorize).
---

# Research Prototype — from idea or curiosity to a first experiment

## Capability boundary — read first

Two phases.

- **Phase 1 (Research & Explain)** — always permitted. Search, fetch,
  cross-verify, explain, cite. In-conversation only.
- **Phase 2 (Capture)** — creates a repo or files the work into an existing
  one, with a first experiment. Needs consent (below).

**Never auto-scaffold.** Consent is any of: the user says so ("init repo",
"save this", "note it", "make a repo", or the same in any language); the
user names the repo or its location; the user hands over a spec, handoff, or
CLAUDE.md-style constitution for the project; or the user accepts an offer
you made. Make the offer early and one-click: a numbered option such as
"make repo `<slug>` in the prototypes directory" or "add to existing repo `<x>`".
When the user says "note it" / "mark it" inside an existing repo, write it
without asking again.

**Unconfirmed ideas are proposals, not decisions** — including your own
suggestions and the user's asides. They go under `## Proposals` or
`## Open questions`, never `## Current goals` or `## Key decisions`.

**Repos are private by default.** Never create a public remote unasked.

## Routing

### By opener shape

| Opener | Mode |
|---|---|
| Blank-page idea ("what if…", "I'm thinking of making…", "idea:") | **Idea brief** (below) |
| "Prototype X" / "build X" — a terse build command | Short feasibility check inline, then build. Software: see Phase 2 software. Hardware on the bench: circuit |
| Hardware already on hand ("new toy", "got this board", photo of a part) | Short capability + limits read, then offer to run the vendor example now (or hand to circuit) |
| "How does X work" / "what is this" + link | Mechanism explanation (Phase 1) |
| Critique of the user's own idea | Verdict + strongest objection + strongest defence; no rewrite of the idea |
| Pasted claude.ai thread, handoff memo, or spec | Carry its decisions forward; do not redo the brief; research only its weakest point; continue in one repo and session |
| Buy-or-make, sourcing, one specific spec | Answer that question directly; brief only if asked |

### By domain

| Domain | Includes | Owner after Phase 1 |
|---|---|---|
| Hardware | boards, sensors, actuators, mechanisms, **firmware** (firmware is hardware: it is bound to its board) | circuit (bench), hard-cad / hard-eda (design), hard-bom (procurement) |
| Software | code on general-purpose computers: web, desktop, CLI, services, pipelines, host-side apps | this skill's Phase 2 software path, then normal implementation |
| Fabrication research | process/material/printer research: models, recipes, fabrication runs, measurements | fabresearch (workspace map, plan / design / fabricate / log / review) |

A project can belong to two domains (firmware on the board is hardware; the
desktop app talking to it is software). Name both.

Other routes: theory and conceptual questions → theorize; Taobao/Tmall
listings → taobao; packaging a finished conversation → research-handoff; a
one-line fact → answer directly; "explain this function in my repo" →
answer from the code.

When unsure whether a message is a project idea, treat it as one. Depth
scaling keeps a false trigger cheap; a missed idea loses the feasibility
pass entirely.

Skills named in these tables are optional companions. If one is not
installed, do that work directly under the same rules.

## Before answering an idea

1. **Read the exact source the idea came from** — the video, product page,
   photo, or paper the user points at — before generalizing about the
   category.
2. **Look up what the user already has**: hardware they own, related repos,
   prior decisions. Sources, at run time: the host's memory/index files,
   the current project's CLAUDE.md, and READMEs under the user's projects
   directory. Never
   hardcode project names in this skill. Owned parts and existing repos are
   **constraints**, not candidates to swap out; a part the user named and
   you later forget is a real failure.
3. **Check specs against the specific board revision, datasheet, or repo**
   before stating them, and cite. Photos of the user's actual hardware beat
   generic diagrams. Unchecked recall is the most common cause of wasted
   bench time.

## Phase 1: Research & Explain

### Scale depth to the question

| Question shape | Reply shape |
|---|---|
| New project idea | idea brief, ≈20–40 lines; then incremental |
| Hardware on hand | ≈10–25 lines + "run the example now?" |
| "What is this?" + link | 1 paragraph + key specs table + sources (≈15–30 lines) |
| "How does X work?" | answer-first paragraph, then layered explanation (≈40–80 lines) |
| "Investigate X thoroughly" | full layered treatment with conflicts and verification steps |

Length follows what was asked, not how much was found. Later turns answer
only the new thing asked; do not re-send the whole brief. Findings left out
of the chat go into docs/ if Phase 2 happens.

### Project ideas

The research target is the idea itself. Idea brief, in this order:

1. **Verdict** — one or two lines: doable or not, and the main reason
   ("doable; the gap is X", "possible but marginal because Y", "already
   exists as Z — shelve unless W").
2. **Register, goal, scale** — one line stating your reading, not a
   question: research thread / tool or instrument / playful build; the goal
   you are optimizing for; the scale (size, load, users, budget, deadline).
   The user corrects it if wrong. Never optimize away what makes the idea
   interesting to them (the research core, the fun).
3. **Reuse and gap** — the closest existing things the user could copy or
   build on, each with what it lacks. Order by register: maker builds,
   open-source projects, and products first for tools and playful builds;
   papers first for research threads. State open-source/licence status. Also
   search skeptically for anything that already fills the gap or forbids it
   (licence clauses, patents). "Nothing close found" is a finding — say what
   was searched.
4. **Mechanism and limits** — the one or two technical problems the idea
   stands or falls on, with numbers (physics, throughput, power, torque,
   range, cost). This is the core of the brief.
5. **Candidate parts or tools** — owned items first, checked against the
   need. A technology the user named in an exploratory way ("maybe with X")
   is a candidate: compare it with one or two alternatives on the one
   deciding spec, with availability. A terse instruction ("use X") is a
   decision. Two or three specific parts is fine; a full system BOM is not.
6. **First experiment** — the cheapest test of the riskiest assumption,
   phrased as an action: "flash the vendor example on the board you have and
   measure range", "buy the eval kit (≈$N) and check Y", "run tool Z on two
   of your files". Offer to do it now. No separate validation gates before
   building.
7. **Next steps** — at most three numbered options, each answerable with one
   token. Include the Phase 2 option ("make repo `<slug>`" or "add to `<repo>`")
   and, when useful, "draft an architecture as a proposal". Ask only
   constraint questions that change the answer, as options.

For **research threads**, add positioning after the reuse section: the
closest prior work in the field, the claim that would be new, whether that
claim survives a careful search ("verified unclaimed" vs "unclear"), and
candidate venues. Go deep here — it is the substance for this register. For
tools and playful builds, skip novelty entirely.

Domain additions:

- **Hardware** — before first power or high voltage, a pin-by-pin and
  hazard check without being asked; otherwise keep test sequences minimal.
- **Software** — existing tools with licence and maintenance status; the
  fastest path to a usable v1; what would make it worth building instead of
  adopting.
- **Fabrication research** — phrase the first experiment as a controlled
  plan: primary variable, fixed conditions, controls, measurements, stop
  criteria, safety limits. Treat printers, materials, and CAD engines
  as capabilities to discover, never assumptions.

**Leave idea mode the moment the user asks for something concrete** — code,
a part number, an architecture, a BOM, "flash it", "full recipe now". Do it
(or hand off per Routing) and research further inline as needed.
Architecture and BOM stay out of the *first* reply to a blank-page idea
only; afterwards they are normal work.

### Search strategy

1. **Start from the most specific identifier** (part number, library name
   and version, paper title). Run facets in parallel when there are several.
2. **Prefer primary sources** — datasheet, official docs, the paper, the
   repo's README and source. Fetch them; snippets lose detail.
3. **Pages that block fetching** (retail listings, JS-rendered docs) — open
   them in the built-in browser and read the page text.
4. **Papers** — if a Zotero or literature tool is connected, check the user's
   library first.
5. **Record disagreement instead of averaging it**; say which source says
   what.

### Confidence marking

- **Fact** — primary documentation, or several independent reports.
- **"Per <source>"** — one source; keep the attribution.
- **"Plan around, verify by <step>"** — usable, with the measurement or
  experiment that would confirm it.

### Explanation structure

**Lead with the answer**, then explain in layers. Layer bottom-up when lower
layers constrain upper ones (hardware: physics → interface → system;
algorithm: data structures → invariants → API; library: data model →
mechanism → API and pitfalls). Skip layers that add nothing. Use ASCII
diagrams for geometry or signal flow and tables for multi-axis comparisons.

### Final pass before sending

- Remove drafting residue: self-corrections ("MSB? actually LSB"), "?"
  placeholders in diagrams, TODO/TBD, half-filled table cells.
- Check that numbers in diagrams match the prose.
- Everything the user needs is in the chat reply in plain words — never only
  in a file, and never by internal IDs the user has not seen.
- End substantial replies with `Sources:` as `[Title](URL)`.

## Phase 2: Capture (with consent)

### Before writing anything

1. **Look for existing work.** List the target parent directory (the
   user-named one, else the prototypes directory) and grep READMEs for the
   topic's key terms. Prefer filing into a related repo or its research-log
   location (e.g. `docs/research-log/`) over a new sibling; propose it and
   wait if unclear.
2. **Concurrent sessions.** In an existing repo, check `git status` first
   and leave other sessions' uncommitted work untouched. Follow that repo's
   AGENTS.md / CLAUDE.md conventions so there is one decision record.
3. **Name.** A descriptive kebab-case slug describing the subject, not an
   unconfirmed goal (`ir-protocol-research`, not `ir-remote-spoofer`). Use
   the user's name verbatim when given. Treat your slug as provisional —
   expect a rename; check for collisions when the user picks a name.

### Path

**Prototypes directory**: the one named in the user's global instructions or
memory (e.g. a line `Prototypes directory: ~/code/prototypes`); the new repo
goes to `<prototypes directory>/<slug>/`. If none is recorded, ask once and
offer to record the answer there. Honor any path the user names for a
specific capture. If the directory exists with content, ask before
proceeding; never overwrite CLAUDE.md or README.md.

### What every capture contains

- `CLAUDE.md`, `README.md`, `.gitignore`, `docs/<topic>.md` — templates in
  `references/templates.md`.
- **The first experiment, on top of README Status**: what it tests, the
  parts or tools (owned vs to buy), the command or procedure, and where
  results go (`tests/results/<case>/`, raw data kept).
- **Owned hardware / related repos** section in CLAUDE.md when relevant.
- A **minimal first-experiment skeleton** is allowed: the smallest example,
  test sketch, or script that runs the first experiment. No system
  implementation — that starts when the user asks for it.
- If the idea came from a claude.ai conversation: the transcript verbatim in
  `chat-transcripts/`, designs filed as proposals, surveys as reference.
- One line on what has not been tested yet — not paragraphs of hedging.

Then `git init` and a descriptive initial commit. No remote unless asked;
private when asked.

### Domain paths

- **Hardware** — layout above, plus `firmware/` or `hardware/` only when the
  first experiment needs them. Bench bring-up, wiring, and firmware beyond
  the first-experiment skeleton go to circuit; mechanical / PCB
  design to hard-cad / hard-eda.
- **Software** — the first experiment is a runnable spike (one command, one
  file where possible) proving the riskiest technical piece. When the user
  then says to build it, follow scaffold-then-iterate: scaffold a complete,
  generally usable v1 with all decided features; keep only technical checks
  that catch breakage (build, tests, a smoke run); take sensible defaults and
  list them; do not polish visuals or interaction beyond usable — the user
  drives those incrementally.
- **Fabrication research** — fabresearch is an optional companion workflow
  for fabrication-research repos; its project map `fabresearch.json` lists
  the repo's folders by role (`paths`, e.g. `{"experiments":
  "01_experiments", "research": "03_research", "project_docs": "06_docs"}`).
  If the target repo has such a map, file into its mapped paths and invent
  no other layout. For a new repo, initialize through fabresearch when it is
  installed (only the modules needed); without it, use the standard capture
  layout plus `experiments/<case-id>/plan.md` holding the first experiment
  in plan form. Never assume equipment or authorize fabrication runs.

## Anti-patterns

- Creating a repo without consent, or a public one unasked.
- Restating the idea back instead of giving a verdict.
- Asking what the idea is for instead of stating the assumed goal.
- Specs from memory, or a generic diagram applied to the user's board.
- Replacing a part the user owns with a market alternative unasked.
- Validation gates before building; tests the user has to run separately
  when the real hardware can answer.
- Holding a research stance after the user asks for code, parts, or a build.
- Docs-only repos with no first experiment.
- Promoting a proposal to a goal or decision; dead ends without reasons.
- Picking one of two conflicting sources and dropping the other.
- A long essay for a short question; drafting residue in the reply.

Maintainer notes and the eval suite: `references/maintenance.md` and
`evals/README.md` — read only when editing this skill.
