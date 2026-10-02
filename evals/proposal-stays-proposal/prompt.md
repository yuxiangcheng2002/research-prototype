---
tags: [phase2]
runs: 1
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, WebSearch, WebFetch, Write, Edit, Bash]
---

My goal: log room temperature at 1 Hz to an SD card using a TMP117. Maybe
later I'd add a BLE dashboard, not sure yet. Research the TMP117 for this and
capture it as a repo at ./tmp117-logger — init it and commit, docs only.
