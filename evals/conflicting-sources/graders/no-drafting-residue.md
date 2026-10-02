---
type: llm
---
FAIL only if the reply shows a visible self-correction left in place (e.g.
"MSB? actually LSB", "wait,", "correction:"), a "?" used as a placeholder
inside a diagram or table, or a literal TODO/TBD. Otherwise PASS. Honest
uncertainty statements ("I couldn't confirm X"), empty header cells in a
two-column key/value table, and attributions are not residue and should PASS.
