# Orthogonal geometry: Gram rigidity, coordinate isometries, and orthogonal series

## Introduction

Orthogonal geometry turns inner-product data into canonical identifications of subspaces and
coordinates. Equal Gram data determine an isometry between the spans of finite families; an
orthonormal family identifies coordinate space isometrically with its span; and orthogonal
projections organize the relation between a subspace and its orthogonal complement. For operators,
invariant and reducing subspaces express compatibility with this orthogonal decomposition.

The same geometry controls orthogonal series. Pairwise orthogonality gives Pythagoras for finite
sums, a square-summability criterion for infinite sums, and Parseval identities for vectors of
arbitrary norm, including zero. These constructions supply the coordinate and subspace
infrastructure used by
[`Majorization`](../Majorization/README.md), [`PrincipalAngles`](../PrincipalAngles/README.md), and
[`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md).

Suggested home: `TauCeti/Analysis/InnerProductSpace/`.

## Notation and terminology

- **Scalars and spaces.** `𝕜` denotes `ℝ` or `ℂ`, and `E`, `F`, and `G` denote inner-product
  spaces over `𝕜`. Finite-dimensional hypotheses are stated where an ambient isometry is obtained
  from finite Gram data.
- **Gram data.** The Gram data of a family `(vᵢ)` are the pairwise inner products `⟪vᵢ,vⱼ⟫`.
  *Gram rigidity* refers to reconstruction of the family, its span, or the ambient space up to a
  linear isometry from these data.
- **Range and span.** `range S` denotes the range of a linear map `S`. The span of a family is its
  linear span over `𝕜`.
- **Orthonormal coordinates.** For an orthonormal family `(vⱼ)`, the *coordinate isometry* is the
  map `x ↦ ∑ⱼ xⱼvⱼ`; `eⱼ` denotes the corresponding standard coordinate vector.
- **Orthogonal complements and projections.** `U⊥` denotes the orthogonal complement of a subspace
  `U`. `P_U` denotes the orthogonal projection onto `U` when that projection is available.
- **Invariant and reducing subspaces.** A subspace `U` is *invariant* for `A` when `A(U) ⊆ U`; it
  is *reducing* when both `U` and `U⊥` are invariant.
- **Orthogonal families and series.** Pairwise orthogonality permits zero vectors. An orthogonal
  series is a sum of a pairwise-orthogonal family, with summability measured by the squared norms.

## What Mathlib already has (consume)

- **Projection and equality transport.** A finite-dimensional submodule is complete, so
  `HasOrthogonalProjection.ofCompleteSpace` supplies its projection.
  `LinearIsometryEquiv.ofEq` transports between equal inner-product subspaces.
- **Invariant subspaces and restrictions.** `Module.End.invtSubmodule` records invariant
  subspaces. `LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule` gives invariance
  of the orthogonal complement for a symmetric operator, and
  `LinearMap.IsSymmetric.restrict_invariant` gives symmetry of its restriction.
- **Orthogonal sums.** After `OG-19` packages the cyclic spans as an orthogonal family,
  `OrthogonalFamily.norm_sum` gives finite Pythagoras and
  `OrthogonalFamily.summable_iff_norm_sq_summable` gives the complete-space summability
  criterion. Taking limits in the finite identity gives Parseval for a specified sum.

## What is missing (build here)

* Gram rigidity — equal pairwise inner products force a linear isometry equivalence — and
  the isometric first isomorphism theorem it rests on.
* The coordinate isometry `eⱼ ↦ vⱼ` of an orthonormal family.
* The orthogonal-series constructor for pairwise-orthogonal, not necessarily unit, vectors.
* Reducing subspaces expressed using Mathlib's invariant-subspace predicate, and completeness
  of subspaces admitting an orthogonal projection.

## The build, in layers

The labels below form the complete mathematical obligation set for this roadmap.
Each label names one obligation. Milestones and acceptance criteria cite these labels, and
`Suggested.lean` cites the labels represented by its sample declarations.

### Gram rigidity

Equal pullback inner products determine a canonical isometry between ranges. For finite families,
equality of pairwise inner products promotes this range geometry to span and ambient isometries.

- **OG-01 — Equality of kernels from equal pullback inner products.** If linear maps `S` and
  `T` out of a common module satisfy `⟪Sx, Sy⟫ = ⟪Tx, Ty⟫` for all `x,y`, then
  `ker S = ker T`.
- **OG-02 — Isometry of ranges.** Under the hypotheses of `OG-01`, the rule `Sx ↦ Tx`
  induces a linear isometric equivalence between `range S` and `range T`.
- **OG-03 — Action of the range isometry.** The equivalence in `OG-02` sends the class of
  `Sx` to `Tx` for every `x`.
- **OG-04 — Inner product of linear combinations.** For finite coefficient families
  `(aᵢ)` and `(bⱼ)` on vector families `(φᵢ)` and `(ψⱼ)`, the inner product
  `⟪∑ᵢ aᵢφᵢ, ∑ⱼ bⱼψⱼ⟫` is the corresponding double sum of coefficient products and
  pairwise inner products.
- **OG-05 — Gram rigidity on spans.** Two families indexed by the same type with equal
  pairwise inner products admit a linear isometric equivalence between their spans.
- **OG-06 — Action of the span equivalence.** The equivalence in `OG-05` sends each vector
  of the first family to the corresponding vector of the second family.
- **OG-07 — Ambient Gram rigidity.** In a finite-dimensional Hilbert space, the span
  equivalence of `OG-05` extends to a linear isometric equivalence of the ambient space
  carrying each vector of the first family to the corresponding vector of the second family.
- **OG-08 — Gram-matrix characterization.** For finite families in a finite-dimensional
  Hilbert space, equality of Gram matrices is equivalent to the existence of an ambient
  linear isometric equivalence carrying one family to the other.

### Coordinate isometries and projection geometry

An orthonormal family determines a concrete isometric copy of coordinate space inside the
ambient Hilbert space. Orthogonal projections and canonical equal-subspace isometries provide
the geometric interface consumed by majorization and principal-angle constructions.

- **OG-09 — Coordinate isometry of an orthonormal family.** For an orthonormal family
  `(vⱼ)_{j<d}`, the linear combination map from `𝕜^d` to the ambient Hilbert space is a
  linear isometry.
- **OG-10 — Coordinate formula.** The coordinate isometry of `OG-09` sends a coordinate
  vector `x` to `∑ⱼ xⱼ vⱼ`.
- **OG-11 — Standard-basis action.** The coordinate isometry of `OG-09` sends the standard
  basis vector `eⱼ` to `vⱼ`.

### Invariant and reducing subspaces

Invariant subspaces record stability under an operator, while reducing subspaces record
stability of the full orthogonal decomposition. Symmetric operators identify these notions and
admit symmetric restrictions to invariant subspaces.

- **OG-15 — Reducing subspace.** For an endomorphism `A`, define reduction of `U`
  by requiring both `U` and `U⊥` to belong to `Module.End.invtSubmodule A`.
- **OG-18 — Completeness of projected subspaces.** In a complete Hilbert space, every
  subspace admitting an orthogonal projection is complete in its induced norm.

### Orthogonal series

Pairwise-orthogonal vectors support Pythagoras, summability, and Parseval directly at their
natural norms. This includes families with zero vectors, as occur in singular expansions with
vanishing coefficients.

- **OG-19 — Orthogonal family of cyclic spans.** A pairwise-orthogonal family of vectors
  determines an orthogonal family of their spans; a zero vector contributes the zero subspace.

**Milestone — Gram rigidity.** `OG-01`–`OG-08`.

**Milestone — coordinate isometries.** `OG-09`–`OG-11`.

**Milestone — reducing and projected subspaces.** `OG-15`, `OG-18`.

**Milestone — orthogonal-family constructor.** `OG-19`.

## Worked examples (acceptance criteria)

**Acceptance criteria.** Ambient Gram rigidity is `OG-07`; the reducing-subspace layer is
`OG-15`, `OG-18`; the orthogonal-series constructor for arbitrary pairwise-orthogonal vectors
is `OG-19`.

## Ordering

This roadmap is independent and rests only on Mathlib.

**Downstream.** [`Majorization`](../Majorization/README.md) states its rectangular
constructions against the coordinate isometry and Gram rigidity;
[`PrincipalAngles`](../PrincipalAngles/README.md) defines the overlap operator from the
coordinate isometry; [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md)
uses the reducing-subspace definition and the completeness of projected subspaces;
symmetric restriction itself is supplied by Mathlib.

## Definitions

**D1 (`OG-09`–`OG-11`).** `x ↦ ∑ⱼ xⱼ vⱼ`, so `eⱼ ↦ vⱼ` — the coordinate isometry of an orthonormal family.

**D2 (`OG-02`–`OG-03`).** `S x ↦ T x` — the isometry of ranges induced by two maps out of a common module with
equal pullback inner products.

## References

- T.-Y. Chien, S. Waldron, *A characterization of projective unitary equivalence of finite
  frames and applications*, SIAM J. Discrete Math. **30** (2016), arXiv:1312.5393 — Gram
  rigidity in its frame-theoretic form.

## Acknowledgements

An Apache-2.0 implementation exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.).

The Gram-matrix material also appeared in mathlib4 pull request
[#40567](https://github.com/leanprover-community/mathlib4/pull/40567). Its Tau Ceti API
exposes the range isometry as `rangeEquivOfInnerEq`.
