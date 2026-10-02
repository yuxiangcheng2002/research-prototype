---
tags: [trigger-negative]
runs: 1
max_turns: 6
timeout_seconds: 200
allowed_tools: [Read, Glob, Grep, Skill]
---

Add exponential backoff with jitter to this function, max 5 retries:

```python
import requests

def fetch(url):
    r = requests.get(url, timeout=10)
    r.raise_for_status()
    return r.json()
```
