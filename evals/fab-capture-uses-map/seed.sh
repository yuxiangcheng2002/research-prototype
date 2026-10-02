#!/bin/bash
set -e
mkdir -p hinge-lab/01_experiments hinge-lab/03_research hinge-lab/06_docs
cat > hinge-lab/06_docs/fabresearch.json <<'J'
{"schema_version": 1, "project": "hinge-lab",
 "paths": {"experiments": "01_experiments", "research": "03_research", "project_docs": "06_docs"}}
J
printf '# hinge-lab\n\nFabrication research on printed compliant mechanisms.\nProject map: 06_docs/fabresearch.json\n' > hinge-lab/AGENTS.md
printf '# hinge-lab\n\nPrinted compliant mechanisms.\n' > hinge-lab/README.md
