# Closed operators and resolvents on `LinearPMap`

Mathlib has the static stack — `ContinuousLinearMap` with adjoints and operator norms,
`spectrum` and `resolvent` for
Banach-algebra elements, and unbounded operators as
`LinearPMap` with `adjoint`, `IsSelfAdjoint` and closedness — but
no resolvent theory for a
partially defined operator.

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

### A `LinearPMap` needs its own resolvent set

This decision belongs to the
[one-parameter semigroups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md):
an unbounded generator needs its own resolvent notion, with a bridge lemma to Mathlib's
`resolvent` in the bounded case.

What is specific here is the range. That roadmap works over a real Banach space and takes
`λ` real, complexifying for the complex resolvent set; the spectral theorem needs `z` ranging
over `𝕜` from the outset, so `resolventSet A : Set 𝕜` is a specialization of theirs rather
than a second notion, and the two should be related rather than developed twice.

### Semibounds are hypotheses the consumer supplies

`SemiboundedBelow A c` and `SemiboundedAbove A c` are predicates on a partial map and a
constant, never a subtype. Off the real axis a lower bound is free from `|Im z|` and the
theorem proves it; at a real point there is none, so the real-point resolvent lemma takes the
bound as a hypothesis and reruns the same closed-range argument. A caller holding a spectral
gap or a semibound should not have to reprove closed range.

### Statements live at their natural generality

C⋆-algebra facts — the norm/spectrum interval characterization, the gap inverse — are stated
for C⋆-algebras, not for Hilbert-space operators.

## What Mathlib already has (consume)

- **`LinearPMap`** with `domain`, `graph`, `adjoint`, `IsFormalAdjoint`, `IsSelfAdjoint`,
  `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`, and closure/core material — the
  canonical carrier of both Parts.
- **`spectrum` and `resolvent` for algebra elements**, including
  `spectrum.isOpen_resolventSet` — the bounded theory Part D's notions must bridge to, never
  duplicate.
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
* A resolvent set and spectrum for a `LinearPMap` — Mathlib's `spectrum` is defined for an
  algebra element, which a partial map is not — with the Cayley transform and the bridge to
  Mathlib's notion in the bounded case.

## The build, in layers

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

Needs the spectral-subspace layer of
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md), and
nothing else.

The vocabulary layer of the unbounded theory: everything Part D states about a partial
map is phrased in the notions defined here. This is where the representation decision
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
- Shifted-inverse data and the elementary real resolvent predicates `realResolventSet`,
  `realSpectrum`, `SpectralSetsSeparated` — the hypothesis shapes Part D's quantitative
  statements consume.
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

### Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

Independently submittable.

**Objects.** `resolventSet A` and `spectrum A` for `A : E →ₗ.[𝕜] E`, per the generality bar;
the named `resolvent A hz : E →L[𝕜] E`; the **Cayley transform** of a self-adjoint operator.

**API to develop.**

- The resolvent is named, not merely asserted: uniqueness (which lets any construction of an
  inverse identify itself as *the* resolvent), the left- and right-inverse laws, membership
  of values in the domain, the **first resolvent identity**
  `R w − R z = (w − z) (R w ∘ R z)`, commutation of resolvents, and resolvent spectral
  mapping in the consuming direction.
- **Openness of the resolvent set** by Neumann-series perturbation through uniqueness;
  closedness and hence **measurability of the real spectrum**.
- **Real spectrum with the quantitative bound**: for self-adjoint `A` and `Im z ≠ 0`, the
  lower bound `‖(A − z)x‖ ≥ |Im z|·‖x‖` — the cross term in the expanded square is purely
  imaginary — then closed range, then dense range; so `z ∈ resolventSet A`,
  `spectrum A ⊆ ℝ`, and `‖R(z)‖ ≤ |Im z|⁻¹`. Adjoints: `R(z)⋆ = R(z̄)`, and `R(z)`
  self-adjoint at real resolvent points.
- **The real-point case as a hypothesis**: at real `z` there is no free lower bound, so the
  same three steps run from an assumed `c‖x‖ ≤ ‖A x − z x‖` — the factored form semibounded
  operators and spectral gaps plug into. A two-sided shifted inverse with norm `≤ (r − s)⁻¹`
  exists across a spectral gap of width `r` around shift `s`.
- **The Cayley transform** `cayley hA = 1 − 2i·R(−i)`, the manifestly bounded form of
  `(A − i)(A + i)⁻¹`: norm-preserving, surjective, unitary, hence `IsStarNormal`.
- **The C⋆-algebra gap inverse**, at C⋆ generality: a self-adjoint element has `‖a‖ ≤ r` iff
  its spectrum lies in `[−r, r]`; spectrum avoiding `(−r, r)` makes `a` a unit with
  `‖a⁻¹‖ ≤ r⁻¹`.
- **The intertwining chain**: a bounded `X` with `X ∘ A ⊆ B ∘ X`, stated domain-aware,
  intertwines the resolvents, the Cayley transforms, and the continuous functional calculus
  of the two operators.

**Milestone D1 — real spectrum, quantitatively**, in the form above.

**Milestone D2 — the textbook characterization, and analyticity.** The single iff
identifying `z ∈ resolventSet A` with *`A − z` injective with closed dense range and bounded
inverse*, and analyticity of `z ↦ resolvent A hz` on the resolvent set — the natural next
statement after the first resolvent identity.

## Worked examples (acceptance criteria)

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

**Acceptance examples.** A bounded self-adjoint operator as a total partial map is
self-adjoint in the `LinearPMap` sense; the graph norm of a bounded map is equivalent to the
ambient norm; `⊤` is a graph core.

### Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

**Acceptance examples.** For bounded self-adjoint `T` as a total partial map, `resolventSet`
agrees with the complement of Mathlib's `spectrum ℂ T` and the resolvent matches the Neumann
series; a multiplication operator's spectrum is the essential range of its symbol.

---

## Ordering

**Internal.** Part D is independently submittable. Part C is independent of it and consumes
the foundations roadmap. The shared carrier of both is `LinearPMap` itself.

**External.** `HilbertSpaceOperatorFoundations`, for Part C's spectral-order bridge only.

The [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
roadmap is the canonical one for the dynamical layer, and it predates this one. Strongly
continuous semigroups, their generators, Hille–Yosida and Lumer–Phillips belong there, not
here. One thing overlaps and should be built once: the unbounded resolvent set and its bridge
to Mathlib, theirs the general statement and ours the `𝕜`-valued specialization.

## Definitions

**D1** `(A + V) ψ = A ψ + V ψ` on `dom A` — perturbation by a map defined on the domain.

**D2** the bounded two-sided inverse of `A − z` — the resolvent at a point of the resolvent set.

## References

- M. Reed, B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*
  (rev. ed. 1980) — VIII.3–4 (the Cayley transform, von Neumann's criterion).
- K. Schmüdgen, *Unbounded Self-adjoint Operators on Hilbert Space* (GTM 265, 2012) — graph
  norms, cores, resolvents, semibounded operators.
- T. Kato, *Perturbation Theory for Linear Operators* (2nd ed. 1976) — relative boundedness,
  Kato–Rellich, resolvent perturbation.
- J. Weidmann, *Linear Operators in Hilbert Spaces* (GTM 68, 1980) — closed operators, form
  bounds, spectral representation.

## Acknowledgements

An Apache-2.0 implementation of both Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.), in namespaces `TauCeti.*` and `LinearPMap.*`. The public API and proof
structure may change during integration.
