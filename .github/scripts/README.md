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

The sync workflow pushes to `main`, which is protected, so it authenticates as a
dedicated GitHub App that sits in the bypass list of main's protection ruleset.
A ruleset (not classic branch protection) is required here: classic protection
has no way to let an app bypass a required status check, so its direct push is
rejected with "Required status check 'build' is expected"; a ruleset's bypass
list waives every rule for the listed actor. One-time setup by an org admin:

1. **Create the app** (org Settings -> Developer settings -> GitHub Apps -> New).
   - Webhook: uncheck *Active* (it needs none).
   - Repository permissions: **Contents: Read and write**, nothing else
     (Metadata: Read-only is added automatically).
   - "Where can this app be installed": *Only on this account*.
2. **Generate a private key** (app page -> bottom -> Generate a private key)
   and note the numeric **App ID** near the top.
3. **Install it** on the `TauCetiProject` org, scoped to this repo.
4. **Store the credentials** on the repo:
   - `gh variable set SYNC_BOT_APP_ID --body <app-id>`
   - `gh secret set SYNC_BOT_APP_PRIVATE_KEY < path/to/key.pem`
5. **Add the app to the ruleset's bypass list.** `main` is governed by a
   repository ruleset (Settings -> Rules -> Rulesets -> "main"), which requires a
   pull request with code-owner review and the `build` check, and blocks
   force-pushes and deletion. Add the app to that ruleset's **Bypass list**
   (Bypass mode: *Always*). Those rules still apply to everyone else, so humans
   are protected exactly as before; only the app may push directly.

If setup is incomplete the workflow still runs and computes the fix, but the
final `git push` fails, which is a visible signal rather than a silent miss.

## `check_roadmap_topics.py`

Every roadmap directory (under `TauCetiRoadmap/` or `Completed/`) holds a
`metadata.toml` whose one key, `topic`, is an arXiv `math.*` subject class; see
"Filing a roadmap" in the root README. The script checks that each roadmap has
one, that it names a class from the arXiv taxonomy (the list is in the script),
and that no sub-roadmap carries a `metadata.toml` of its own, since a
sub-roadmap is filed under its parent's topic.

- `python3 .github/scripts/check_roadmap_topics.py` exits non-zero, listing
  every problem and the valid classes, if any roadmap lacks a valid topic.
  It needs Python 3.11 or later, for `tomllib`.

It runs early in the `build` job of [`ci.yml`](../workflows/ci.yml), so a valid
topic is a merge requirement. The step before it runs
`test_check_roadmap_topics.py`, which runs the script on throwaway trees with
missing, malformed, misspelled and misplaced metadata in both `TauCetiRoadmap/`
and `Completed/`, so the checker cannot quietly stop rejecting them while this
repository's own metadata stays valid.

The topic lives in its own file rather than in the roadmap's `README.md`
because the progress tooling identifies the specification a coverage assessment
was made against by a hash of the README (`readme_sha`); a README edit that only
changed the topic would mark that assessment as out of date.

## `gen_umbrella.py`

An umbrella `umbrellas/NAME.toml` names the roadmap areas that one goal needs; the
library worker reads it for `tauceti work --roadmap-only NAME`. Its target list
`umbrellas/NAME-targets.md` breaks the goal into items, each naming the items it
needs, for the worker's `--roadmap-targets`. The worker's documentation
(`docs/umbrellas.md`, `docs/target-lists.md`) defines both formats. Both files
are generated from the roadmaps' READMEs:

- The goal is every section of the roadmaps under `TauCetiRoadmap/<root>/`,
  where `root` is set in the umbrella file, and, transitively, everything they
  need. A section needs what its `*Needs:*` and
  `*Prerequisites:*` lines name: bare ids and `Layer k` of its own roadmap, and
  citations of other roadmaps (`Name §1.2`, `Name §§1.1–1.3 and 2.4`,
  `Name Layers 3 and 5`, `Name A5.3`; a name may also be written
  `` `Name` `` or `TauCetiRoadmap.Name`). A section without such a line needs
  what the `### Dependencies` subsection of its layer cites. Nothing else in a
  README (statements, checks, examples, remarks) creates a dependency.
- A layer that has sections is not an item, since no pull request completes it
  as such: a need of it is a need of each of its sections. A layer without
  sections is an item, the unit of work; it needs what the `*Needs:*` and
  `*Prerequisites:*` lines in it name and what its own `### Dependencies`
  subsection names.
- A member of the umbrella is an area, a top-level directory of
  `TauCetiRoadmap/`, that contains a unit the goal needs; its `sections` list
  the units needed there. An item of the target list is one needed section or
  layer, with the slug
  `<Roadmap>.<id>` or `<Roadmap>.Layer<k>` (an id may go on with `:word` parts,
  `AI.0:integral.1`, whose colon the slug writes `-`), its `needs:`, and the roadmaps of
  the goal that need it directly (`serves:`). `needs:` lists every stated
  dependency that survives cycle breaking. The slug comes from the item's own
  README alone: the id its heading starts with (other ids of the heading, such
  as `(A1.1)`, are aliases that citations resolve through, shown in brackets in
  the item's text), so a citation added or removed elsewhere never renames it.
- Roadmaps under `Completed/` are never members or items, and citing one needs
  nothing.
- The worker rejects a target list with a cycle. Inside each cycle the
  generator keeps only the dependencies that point to an earlier unit (by area,
  roadmap and position in the README) and records each dropped one in a line
  starting with `>`.

Only `description`, `goal` and `root` in an umbrella file are written by hand;
the generator keeps them and writes everything else. In a target list, an
item's mark (`[x]` done, `[~]` in flight) and the clauses of its trailing group
that the generator does not write (`partial: #N`, `in flight: #M`) are kept by
slug when it is regenerated, so an operator may tick items in the file and a
check of that change passes. A slug that is no longer an item loses what was
recorded for it, and `--fix` and `--stats` name it.

- `python3 .github/scripts/gen_umbrella.py` checks that the committed files equal
  the generator's output and exits non-zero on drift.
- `--fix` writes them.
- `--stats` writes nothing and prints counts and problems: ids that resolve in
  no README, dependencies stated and written, dependencies dropped to break
  cycles, the size of each file.

The [`sync-umbrellas`](../workflows/sync-umbrellas.yml) workflow runs `--fix` on
`main` once a day, and at once when `umbrellas/` or the generator changes there,
and commits the result as the same app as the dropdown sync (the setup above
applies). It does not run after every roadmap merge: a push to `main` outside the
merge queue makes the queue rebuild every candidate, and roadmaps merge many times
a day, so the umbrellas may lag the roadmaps by up to a day. The
[`umbrellas`](../workflows/umbrellas.yml) workflow checks pull requests that touch
`umbrellas/` or the generator, at the pull request's head commit: it runs
`test_gen_umbrella.py`, which runs the generator on throwaway trees, and then the
check, against the roadmaps of that same commit. A pull request that only changes
roadmaps is not checked; the daily sync picks the change up. If the check fails,
run `--fix` on the branch and commit the result.

To add an umbrella, write `umbrellas/NAME.toml` with a one-line `description`
and the `root` directory (optionally a `goal`, the statement the target list
opens with), run `--fix`, and commit both files. An umbrella file without `root`
is left as it is.
