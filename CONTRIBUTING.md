# Contributing

This repository holds the human-curated roadmaps for
[Tau Ceti](https://github.com/TauCetiProject/TauCeti). A roadmap is the definitive
specification of an area: it says what we want built, in enough detail that an AI contributor
and its reviewers can act on it without guessing. Writing and reviewing roadmaps is where human
judgement is worth the most, so that is what this repository asks of you.

There are three ways to contribute, in rough order of how much they ask of you:

- **Register an intention** to work on part of an existing roadmap, and claim it. See
  [Coordinating work](README.md#coordinating-work-intentions-and-claims).
- **Report a problem** with a roadmap's content, using the **Roadmap issue** template, or with
  how this repository operates, using the **Meta** template.
- **Open a pull request** adding a new roadmap or revising an existing one. The rest of this
  document is mostly about that.

Reviewing someone else's roadmap PR is welcome at any time and does not require permissions.
Substantive review, especially from a subject-area expert, is the thing we are shortest of.

## Advice on writing a roadmap

Read these before you start, in this order:

1. **[Writing a roadmap](README.md#writing-a-roadmap)** in the README. This is the standing
   checklist, written after several rounds of review, and it is what reviewers will hold your
   PR against. Build the library rather than racing to a headline theorem; ground every
   milestone in material that exists or is itself a target; use Mathlib's vocabulary; pin
   conventions; nothing is "optional".
2. **The [Getting started: roadmaps][zulip-topic] topic on the Lean Zulip.** This is the
   running discussion of what roadmaps are for and what makes a good one, including the
   questions that produced most of the README checklist. It is also the right place to ask
   about a roadmap you are planning, and to ask for review once you have opened a PR.
3. **Two or three merged roadmaps** from the [list in the README](README.md#roadmaps), in an
   area close to yours. The review discussion on their pull requests is often more instructive
   than the merged result.

[zulip-topic]: https://leanprover.zulipchat.com/#narrow/channel/610393-Tau-Ceti/topic/Getting.20started.3A.20roadmaps/with/614905192

A few points from the Zulip topic that the README checklist does not yet spell out:

- **Roadmaps are not scoped to Mathlib.** Anything that would be good to have in a central,
  coordinated library is in scope. But a roadmap must make contact with material that already
  exists in Mathlib or Tau Ceti. A roadmap whose lowest rung is still far above what has been
  formalized just makes agents thrash and produce bad code.
- **A roadmap for work you have already formalized is welcome**, and is a good way to bring
  existing material up to Tau Ceti quality. Write it so someone could implement it fresh, and
  treat your existing repository as a cited source rather than as the specification. The point
  of the review process is to improve the material, not to ratify it.
- **Do not tail off into an under-specified ambitious extension.** If the last section of your
  roadmap gestures at something much larger, label it explicitly as a roadmap-for-a-roadmap and
  tell contributors not to follow it, so that it reads as motivation for a future roadmap
  rather than as work to attempt now.
- **Attribute AI assistance.** Most roadmaps here are written with AI help and that is fine,
  but unlike the code repository this one is human-curated, so say which models you used, in
  the PR description. The same goes for review comments written with AI assistance: mark them,
  conventionally with a :robot: prefix. Nobody should post a roadmap or a review comment they
  have not read carefully themselves.
- **Help find a subject-area expert.** Reviewers are frequently working outside their
  mathematical expertise. If you can name or recruit someone who knows your area, whether or
  not they know Lean, say so on the PR or in the Zulip topic. That is often the difference
  between a roadmap merging and sitting.

## Opening a pull request

Open the PR against `main`. Anyone can open one; no permissions are needed.

It merges automatically once a member of the `@TauCetiProject/roadmap-reviewers` team approves
it and the `build` check passes. Roadmap content is owned by that team; infrastructure files
(the workflows, the Lake config, the toolchain pin) stay with `@TauCetiProject/humans`, so a PR
touching those needs their approval too.

Apply the **`awaiting-review`** label when you open it. If you cannot apply labels yet, see
[Permissions](#permissions) below, and in the meantime say so in the PR description or the
[Zulip topic][zulip-topic] and someone will apply it.

**A roadmap pull request touches only its own directory under `TauCetiRoadmap/`.** Four files
list the roadmaps, and all four are derived from the set of directories that contain a
`README.md`: the "Roadmaps" list in `README.md`, the `area` dropdown in each of the two issue
templates, and the root `TauCetiRoadmap.lean`. The first three are regenerated and committed by
the sync bot after your PR merges, and `TauCetiRoadmap.lean` carries no import list at all
because `lakefile.toml` globs every module under `TauCetiRoadmap/`. Adding your roadmap to any
of them by hand does nothing except conflict with every other open roadmap PR, so leave them
alone; if you want to check what the generated list will look like, run
`python3 .github/scripts/check_roadmap_areas.py --fix` locally and then discard the result.

## The review workflow: labels

Two labels track whose turn it is. Keeping them accurate is the single most useful thing you
can do for the people reviewing, because it is how they find work.

| Label | Meaning |
| --- | --- |
| `awaiting-review` | The ball is with a reviewer. Nothing is expected of the author right now. |
| `awaiting-author` | A review has landed. The ball is with the author. |

Nothing applies these automatically. The convention is:

- **The author** applies `awaiting-review` when opening the PR, and again each time they have
  finished responding to a round of review.
- **A reviewer** replaces `awaiting-review` with `awaiting-author` when they leave a review that
  asks for changes.
- **The author** replaces `awaiting-author` with `awaiting-review` once they believe they have
  dealt with the comments. Do this when you are done with the round, not after each individual
  fix.

Pushing a commit does not move the label, and reviewers should not have to infer from the
commit log that you are ready. If you have pushed a partial response and are still working,
leave `awaiting-author` in place.

## Resolving review conversations

When you respond to a round of review:

- **Reply to every review thread**, even the ones you agree with. A thread with no reply reads
  as one you have not seen. "Done in abc1234" is a complete reply.
- **Resolve the threads you are confident you have dealt with correctly.** As the PR author you
  can resolve conversations on your own PR without any special permissions.
- **Leave a thread open** if you disagree, if you are unsure the change is what was asked for,
  or if you want the reviewer to look again. Say which of those it is.

The reviewer's next pass then reduces to the open threads, which is much faster than rereading
everything. If a thread was resolved but the underlying problem survives, a reviewer will
reopen it; that is not a reprimand, just the mechanism working.

## Permissions

Rights accrue as you contribute, and the reviewer pool grows out of people who have
demonstrably moved a roadmap forward.

- **Opening your first pull request** gets you invited to `@TauCetiProject/roadmap-triage`,
  which carries triage on this repository: enough to label, assign, and manage issues and pull
  requests. GitHub cannot add you to an organization without your say-so, so watch for the
  invitation and accept it. Triage starts when you accept, not when the PR opens.
- **Two merged roadmap PRs** adds you to `@TauCetiProject/roadmap-reviewers`, and you can start
  approving others' roadmap work.

## Building

The Lean files in this repository are checked by the `build` check.

```bash
lake exe cache get
lake build
```
