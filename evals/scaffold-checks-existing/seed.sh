#!/bin/bash
set -e
mkdir -p Prototypes/raft-notes/docs
printf '# raft-notes\n\nNotes on the Raft consensus algorithm: leader election so far.\n' > Prototypes/raft-notes/README.md
printf '# Leader election\n\nTerms, votes, randomized timeouts.\n' > Prototypes/raft-notes/docs/leader-election.md
