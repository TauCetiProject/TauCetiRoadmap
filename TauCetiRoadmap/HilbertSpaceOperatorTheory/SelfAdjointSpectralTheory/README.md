# Closed operators on `LinearPMap`

Mathlib has the static stack — `ContinuousLinearMap` with adjoints and operator norms, and
unbounded operators as `LinearPMap` with `adjoint`, `IsSelfAdjoint` and closedness — but no
vocabulary layer over it: no domain-aware perturbation, no graph-norm API, and no
quadratic-form bounds with their spectral bridges.

Suggested homes:

```text
TauCeti/Analysis/InnerProductSpace/LinearPMap/
TauCeti/Analysis/CStarAlgebra/SelfAdjointGapInverse.lean
```

## Standing conventions

### An unbounded operator *is* a `LinearPMap`

Mathlib's `LinearPMap` (`H →ₗ.[ℂ] H`) is the foundational object; there is no parallel
`ClosedOperator` type. Closedness, dense domain, symmetry (`LinearPMap.IsFormalAdjoint`) and
self-adjointness (`IsSelfAdjoint A`, i.e. `A.adjoint = A`) are **hypotheses on a raw partial
map, not structure fields**. A theorem needing three properties carries three hypotheses; in
exchange no consumer unwraps a bundle, and Mathlib's `LinearPMap` API applies directly. A
derived convenience bundle may carry a `LinearPMap` and proofs, but not its own domain/action
representation. Bounded operators enter through `T.toLinearMap.toPMap ⊤`.

### Statements live at their natural generality

C⋆-algebra facts — the norm/spectrum interval characterization, the gap inverse — are stated
for C⋆-algebras, not for Hilbert-space operators.

## What Mathlib already has (consume)

- **`LinearPMap`** with `domain`, `graph`, `adjoint`, `IsFormalAdjoint`, `IsSelfAdjoint`,
  `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`, and closure/core material — the
  canonical carrier of both Parts.
- **Topology and analysis**: `Submodule.topologicalClosure`, orthogonal projections and
  `HasOrthogonalProjection`, Neumann series, `Tendsto` filters.

**Tau Ceti already ships the semigroup layer.** `TauCeti/Analysis/Semigroups/` contains
roughly 130 declarations: `StronglyContinuousSemigroup` and `ContractionSemigroup`,
`.generator` with its domain, `.resolvent` with the growth-bound API, `expShift`,
`ofBounded`, and the abstract Cauchy problem as `IsClassicalSolution` / `IsMildSolution`.
This implements Part A of the
[one-parameter semigroups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md).

The rest below is absent upstream.

---

## What is missing (build here)

* The closed-operator layer on `LinearPMap`: domain-aware perturbation and the
  quadratic-form bounds with their spectral bridges.

## The build, in layers

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

Needs the spectral-subspace layer of
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md), and
nothing else.

The vocabulary layer of the unbounded theory. This is where the representation decision
becomes code.

**Objects and API to develop.**

- Domain relations as predicates: `SameDomain`, `MapsDomainTo`, `Extends`; domain-subtype
  simp lemmas, so consumers never unfold.
- Reducing subspaces: `InvariantSubspace`, `ReducesSubspace`, the reduced restriction of a
  partial map to a reducing subspace with its density, closed-graph, symmetry and
  self-adjointness inheritance.
- Transport constructions, each with density and closed-graph transport: pullback along a
  continuous linear equivalence, unitary conjugation preserving self-adjointness, and the
  direct sum of two partial maps.
- **The graph norm** `graphNorm A x = √(‖x‖² + ‖A x‖²)` on the domain subtype, with its
  elementary estimates — deliberately *not* a second topology on the domain. **Graph cores**
  are stated sequentially, recording exactly the two convergences a closed-graph argument
  consumes, and closedness in sequential form is what carries an identity from a core to the
  whole domain.
- **Relative boundedness** `RelativelyBounded A V a b` (`‖V x‖ ≤ a‖x‖ + b‖A x‖`) with its
  closure laws.
- **Perturbations**: `perturb A V` for a domain-defined `V` — the same domain by
  construction, which is where Kato–Rellich arguments start — and `boundedPerturbation` for
  a bounded operator.
- **Quadratic-form bounds**: `LowerFormBoundOn` and `UpperFormBoundOn` for a bounded operator
  on a subspace, and the bridge from a spectral inclusion of a restriction to those bounds
  over `ℂ` — where the foundations' spectral-subspace layer is consumed.

**Milestone C1 — bounded Kato–Rellich.** A bounded self-adjoint perturbation of a
self-adjoint partial map is self-adjoint on the same domain, directly and with no
relative-bound machinery, because a bounded perturbation does not move the adjoint domain.

**Milestone C2 — the closed-graph characterization, and Kato–Rellich proper.** The single
iff — `A` is closed iff its graph is closed iff every graph-convergent sequence has its
limit in the domain with the expected image — and the Kato–Rellich theorem: a symmetric
relatively bounded perturbation with bound `b < 1` of a self-adjoint operator is
self-adjoint, for which `perturb` and `RelativelyBounded` are two of the ingredients.

## Worked examples (acceptance criteria)

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

**Acceptance examples.** A bounded self-adjoint operator as a total partial map is
self-adjoint in the `LinearPMap` sense; the graph norm of a bounded map is equivalent to the
ambient norm; `⊤` is a graph core.

## Ordering

**Internal.** Part C consumes the foundations roadmap and nothing else.

**External.** `HilbertSpaceOperatorFoundations`, for Part C's spectral-order bridge only.

The [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
roadmap is the canonical one for the dynamical layer, and it predates this one. Strongly
continuous semigroups, their generators, Hille–Yosida and Lumer–Phillips belong there, not
here. Nothing in this roadmap overlaps with it.

## Definitions

**D1** `(A + V) ψ = A ψ + V ψ` on `dom A` — perturbation by a map defined on the domain.

## References

- K. Schmüdgen, *Unbounded Self-adjoint Operators on Hilbert Space* (GTM 265, 2012) — graph
  norms and cores.
- T. Kato, *Perturbation Theory for Linear Operators* (2nd ed. 1976) — relative boundedness,
  Kato–Rellich, resolvent perturbation.
- J. Weidmann, *Linear Operators in Hilbert Spaces* (GTM 68, 1980) — closed operators, form
  bounds, spectral representation.

## Acknowledgements

An Apache-2.0 implementation of this Part exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.), in namespaces `TauCeti.*` and `LinearPMap.*`. The public API and proof
structure may change during integration.
