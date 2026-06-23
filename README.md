# Tau Ceti Roadmap

The human-controlled roadmaps for [Tau Ceti](https://github.com/FormalFrontier/TauCeti), an
AIs-welcome Lean 4 library downstream of Mathlib. Humans steer the project from here: each
roadmap is markdown plus Lean target signatures (with `sorry`, which is allowed in this repo
because these are goals, not proofs). The AI-authored mathematics that discharges them lives
in the code repo; review machinery lives in
[TauCetiReview](https://github.com/FormalFrontier/TauCetiReview).

Tau Ceti is being incubated jointly by the [Lean FRO](https://lean-lang.org/fro/) and the
[Mathlib Initiative](https://mathlib-initiative.org/), in partnership with academic and
industry groups.

## Roadmaps

1. [Universal covers](TauCetiRoadmap/UniversalCovers/README.md)
2. [The Jacobian challenge](TauCetiRoadmap/JacobianChallenge/README.md)
3. [Reductive algebraic groups](TauCetiRoadmap/ReductiveGroups/README.md)
4. [Partial differential equations](TauCetiRoadmap/PDE/README.md)
5. [Combinatorial Heegaard Floer and grid homology](TauCetiRoadmap/CombinatorialHeegaardFloer/README.md)
6. [Heegaard Floer homology, analytically](TauCetiRoadmap/HeegaardFloer/README.md)
7. [Multiquadratic fields and genus theory](TauCetiRoadmap/Multiquadratic/README.md)
8. [Effective arithmetic bounds and geometry of numbers](TauCetiRoadmap/EffectiveBounds/README.md)
9. [Geometric topology and the Kirby-list problems](TauCetiRoadmap/GeometricTopology/README.md)
10. [One-parameter semigroups, completely monotone functions, and BCR Bochner](TauCetiRoadmap/OneParameterSemigroups/README.md)

## Writing a roadmap

A roadmap is a specification for work we want done, written so an AI contributor, and its
reviewers, can act on it without guessing.

- **Build the library, don't race to the theorem.** For each object you introduce, ask for its
  complete basic theory, not just the lemma the headline needs.
  Named theorems are milestones inside a fuller development, not the whole of it.

- **Everything is grounded.** Every part of the plan must be connected to existing material in
  Mathlib and/or Tau Ceti. If we mention anything in the roadmap that doesn't already exist,
  fully building the library for that object must become part of the roadmap. We know from
  experience that the bigger the gap in the roadmap, the worse results AIs will produce.

- **Specify the mathematics, not your existing code.** Say what each milestone should prove,
  intrinsically, so a reviewer can judge it on its own terms. If you're porting existing work,
  keep the file-by-file map in a clearly secondary provenance section, so reviewers don't treat
  your code as the standard.

- **Nothing is "optional".** Don't use the word, and don't imply it. Everything on a roadmap is
  work we want. Sequencing is good, so split into milestones and put the harder material later,
  but every item lives in *some* milestone, or a contributor reads "later" as "never".

- **Do things right the first time.** Decide the generality up front and write it down. Don't
  recommend intermediate implementations that will be replaced later.

- **Write Lean code.** It's really helpful to prototype signatures, particularly for structures,
  classes, and definitions, by writing Lean code, either embedded in markdown or in associated
  Lean files using `sorry`.

- **Pin conventions.** It's essential that you decide conventions ahead of time, or implementors
  will make bad decisions.

## How changes are made

Anyone can open a pull request against a roadmap. It merges automatically once it has an
approving review from a member of the `@FormalFrontier/roadmap-reviewers` team (the code owners
for roadmap content) and the `build` check passes. Infrastructure files (the workflows, the
Lake config, the toolchain pin) stay with the core `@FormalFrontier/humans` team.

The reviewer pool grows itself: a contributor who lands two merged roadmap PRs is added to
`roadmap-reviewers` automatically, so people who have demonstrably moved a roadmap forward can
start approving others' roadmap work.

## Building

```bash
lake exe cache get
lake build
```
