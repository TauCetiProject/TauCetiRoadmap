# `.github/scripts`

## `check_roadmap_areas.py`

The roadmap directories under `TauCetiRoadmap/` are the source of truth for the
list of roadmaps. That list is also copied into the `area` dropdowns of the
issue templates (`1-intention.yml`, `2-roadmap-issue.yml`) and, with prose
titles, into the README's "Roadmaps" list. GitHub issue forms have no
templating, so the dropdown copies cannot be removed.

- `python3 .github/scripts/check_roadmap_areas.py` checks all three against the
  directories and exits non-zero on drift (handy locally).
- `--fix` regenerates the two dropdowns from the directory list and heals the
  README list. The README heal fills gaps only: a missing roadmap is appended
  with the title taken from its own `# ` heading, an orphaned line is dropped,
  and the list is renumbered, but existing entries are left exactly as they
  are, so a curated order or a hand-shortened title is preserved.

The [`sync-roadmap-dropdowns`](../workflows/sync-roadmap-dropdowns.yml) workflow
runs `--fix` after every merge to `main` that changes the roadmap set and
commits the result, so contributors never update the dropdowns or remember to
list a new roadmap themselves. If they did already write a README line (with a
nicer title than the heading), the heal sees no gap and leaves it untouched.

### One-time setup for the auto-commit

The sync workflow pushes to `main`, which is protected (PR + code-owner review),
so it authenticates as a dedicated GitHub App that is allowed to bypass that
requirement. One-time setup by an org admin:

1. **Create the app** (org Settings -> Developer settings -> GitHub Apps -> New).
   - Webhook: uncheck *Active* (it needs none).
   - Repository permissions: **Contents: Read and write**, nothing else
     (Metadata: Read-only is added automatically).
   - "Where can this app be installed": *Only on this account*.
2. **Generate a private key** (app page -> bottom -> Generate a private key)
   and note the numeric **App ID** near the top.
3. **Install it** on the `FormalFrontier` org, scoped to this repo.
4. **Store the credentials** on the repo:
   - `gh variable set SYNC_BOT_APP_ID --body <app-id>`
   - `gh secret set SYNC_BOT_APP_PRIVATE_KEY < path/to/key.pem`
5. **Let it bypass the PR requirement on `main`.** Settings -> Branches ->
   `main` -> "Require a pull request before merging" -> add the app under
   "Allow specified actors to bypass required pull requests". Nothing else
   changes: there is no push-actor restriction, and required status checks gate
   PR merges, not the app's direct push.

If setup is incomplete the workflow still runs and computes the fix, but the
final `git push` fails, which is a visible signal rather than a silent miss.
