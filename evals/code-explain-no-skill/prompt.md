---
tags: [trigger-negative]
runs: 1
max_turns: 6
timeout_seconds: 200
allowed_tools: [Read, Glob, Grep, Skill]
---

Explain what this function from my repo does:

```python
def debounce(samples, n=3):
    out, run, last = [], 0, None
    for s in samples:
        run = run + 1 if s == last else 1
        last = s
        if run == n:
            out.append(s)
    return out
```
