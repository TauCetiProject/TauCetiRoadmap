# Tau Ceti Roadmap

The human-controlled roadmaps for [Tau Ceti](https://github.com/TauCetiProject/TauCeti), an
AIs-welcome Lean 4 library downstream of Mathlib. Humans steer the project from here: each
roadmap is a markdown `README.md`, the definitive specification of its area, usually with
suggested Lean target signatures in `Suggested.lean`. The AI-authored mathematics lives
in the code repo; review machinery lives in
[TauCetiReview](https://github.com/TauCetiProject/TauCetiReview).

Tau Ceti is being incubated by the [Lean FRO](https://lean-lang.org/fro/) and the [Mathlib Initiative](https://mathlib-initiative.org/) in partnership with academic and industry groups.

## Roadmaps

1. [Universal covers](TauCetiRoadmap/UniversalCovers/README.md)
2. [The Jacobian challenge](TauCetiRoadmap/JacobianChallenge/README.md)
3. [Reductive algebraic groups](TauCetiRoadmap/ReductiveGroups/README.md)
4. [Partial differential equations](TauCetiRoadmap/PDE/README.md)
5. [Combinatorial Heegaard Floer and grid homology](TauCetiRoadmap/CombinatorialHeegaardFloer/README.md)
6. [Heegaard Floer homology, analytically](TauCetiRoadmap/HeegaardFloer/README.md)
7. [Multiquadratic fields and genus theory](TauCetiRoadmap/Multiquadratic/README.md)
8. [Geometric topology and the Kirby-list problems](TauCetiRoadmap/GeometricTopology/README.md)
9. [One-parameter semigroups, completely monotone functions, and BCR Bochner](TauCetiRoadmap/OneParameterSemigroups/README.md)
10. [Exchangeability and de Finetti](TauCetiRoadmap/Exchangeability/README.md)
11. [Conformal mapping and the geometric theory of holomorphic functions](TauCetiRoadmap/ConformalMapping/README.md)
12. [Weighted orthogonal L² bases: completeness, Hilbert bases, and products of orthogonal systems](TauCetiRoadmap/OrthogonalL2Bases/README.md)
13. [Contour integration and the Hungerbühler–Wasem generalized residue theorem](TauCetiRoadmap/ContourIntegration/README.md)
14. [Dense graph limits and graphons](TauCetiRoadmap/DenseGraphLimits/README.md)

## Completed roadmaps

Roadmaps the maintainers have declared complete (a judgment against the roadmap's
`README.md`, the definitive document) are archived under
[`Completed/`](Completed/README.md), outside the active list above.

- [Effective arithmetic bounds and geometry of numbers](Completed/EffectiveBounds/README.md)

## Writing a roadmap

A roadmap is a specification for material we want added to Tau Ceti, written so an AI contributor, and its
reviewers, can act on it without guessing.

- **Build the library, don't race to the theorem.** For each object you introduce, ask for its
  complete basic theory, not just the lemma the headline needs.
  Named theorems are milestones inside a fuller development, not the whole of it.

- **Everything is grounded, with no leaps.** Every milestone must rest on existing Mathlib or
  Tau Ceti material, on earlier material in the same roadmap, or on an explicitly cited
  dependency in another roadmap. Anything else is a leap: a forward reference to a later layer, a
  connection between two developments that nobody builds, an object named but never made a
  target. If the roadmap needs something that doesn't exist, building it must itself be a target,
  here or in a roadmap you cite. The bigger the gap, the worse AIs do with it.

- **Check what's already in motion.** Before specifying an object, search Zulip and the open Mathlib
  PRs for it — someone may already be building the API, settling the design, or have formalized it.
  Cite what you find, follow the direction it's taking, and flag milestones that will refactor onto
  in-flight Mathlib work once it lands. Reinventing an API Mathlib is already building, or picking a
  convention the community is deciding against, wastes the work.

- **Use Mathlib's vocabulary.** Where Mathlib already has a way to say something, use it rather
  than a private version, both in the roadmap and in the code. A standard notion said in our own
  dialect drifts from the library it builds on and grows a redundant theory of lemmas Mathlib
  already proves. As an example: Mathlib has no "bounded on a set" predicate, so a
  result that needs an explicit bound carries `∀ x ∈ s, ‖f x‖ ≤ C` directly in its hypotheses (as
  in `norm_cfc_le`), and uses `Bornology.IsBounded` when no constant is needed
  (`isBounded_iff_forall_norm_le'` relates the two). We do the same, and never wrap a one-line
  bound in a new predicate. When Mathlib's name for something is itself a Mathlib-ism that a
  mathematician would not recognize (`ModularFormClass`, say), link the Mathlib declaration the
  first time you use it, so a reader can see what the term denotes rather than guess.

- **Specify the mathematics, not your existing code.** Say what each milestone should prove,
  intrinsically, so a reviewer can judge it on its own terms.
  A Tau Ceti roadmap may direct either a greenfield development, where the checks above have
  identified no existing formalization, or the integration of existing work into Tau Ceti.

- **Coordinate before integrating existing work.** Work with the authors of the existing material
  and obtain their agreement before integrating it. If coordination is not possible, do not assume
  that mathematical overlap permits reuse of their code: verify that its licence permits the
  intended copying or adaptation, and discuss the plan on the Lean Zulip before proceeding so the
  community can provide input. A roadmap that independently develops the same mathematics should
  still cite the existing work and coordinate where possible to avoid needless duplication or
  incompatible design choices.

- **Improve existing work rather than canonizing it.** When porting material, do not write the
  roadmap merely to follow the existing formalization. Apply all the principles above and use the
  review process to make the result more general, reusable, and maintainable. Put any file-by-file
  map in a clearly secondary provenance section so reviewers do not treat the source code as
  prescriptive or exemplary.

- **Nothing is "optional".** Don't use the word, and don't imply it. Everything on a roadmap is
  work we want. Sequencing is good, so split into milestones and put the harder material later,
  but every item lives in *some* milestone, or a contributor may misread "later" as "never".

- **Do things right the first time.** Decide the generality up front and write it down. Don't
  recommend intermediate implementations that will be replaced later.

- **Write Lean code.** It's really helpful to prototype signatures, particularly for structures,
  classes, and definitions, by writing Lean code, either embedded in markdown or in associated
  Lean files using `sorry`. The prototypes are aids, not the specification: the markdown stays
  definitive, and `Suggested.lean` is read as suggested forms, never as an exhaustive checklist —
  open each `Suggested.lean` with the standard note saying so. Use `sorry` honestly: a condition you
  cannot yet even *state* (its Mathlib API doesn't exist) is still a `sorry`, never a `Prop`-typed
  field or a `def _ : Prop := sorry`. Both assert nothing (a `Prop` field is satisfiable by `True`;
  a `sorry` body is `sorryAx Prop`), so omit a condition you cannot state rather than name an empty one.

- **Pin conventions.** It's essential that you decide conventions ahead of time, or implementors
  will make bad decisions.

## How changes are made

Anyone can open a pull request against a roadmap. It merges automatically once it has an
approving review from a member of the `@TauCetiProject/roadmap-reviewers` team (the code owners
for roadmap content) and the `build` check passes. Infrastructure files (the workflows, the
Lake config, the toolchain pin) stay with the core `@TauCetiProject/humans` team.

The reviewer pool grows itself: a contributor who lands two merged roadmap PRs is added to
`roadmap-reviewers` automatically, so people who have demonstrably moved a roadmap forward can
start approving others' roadmap work.

## Coordinating work: intentions and claims

To avoid two contributors (human or AI) building the same thing, register what you intend to
work on and claim it. This is powered by the
[intentions bot](https://github.com/leanprover-community/intentions) and the project board.

1. **Register an intention.** Open an issue with the **Intention** template: pick the roadmap
   area and list the specific targets you mean to take (keep the scope as narrow as you can, so
   the rest stays open for others).
2. **Claim it.** Comment `claim` on the issue. The bot assigns it to you and moves it to
   *Claimed* on the board. For a custom window, comment `claim 3 weeks` or `claim 2026-08-01`;
   bare `claim` uses the project default.
3. **It expires.** Claims carry a time-to-live (30 days by default, 90 days max) and are
   released automatically if they go stale, so nothing stays blocked forever. Comment `claim`
   again to extend, or `disclaim` to release early. Opening a PR that says `Closes #<issue>`
   advances the card and refreshes the claim; merging it completes the task.

Automated roadmap workers **respect these claims**: within an area they will not author a
target that someone else has claimed. So before a substantial push, register and claim it. A
claim is cooperative, not a hard lock; it signals intent so others (people and workers) can
steer around you.

Use the **Roadmap issue** template to report a problem with a roadmap's content, and the
**Meta** template for problems with how this repository operates.

## Building

```bash
lake exe cache get
lake build
```
