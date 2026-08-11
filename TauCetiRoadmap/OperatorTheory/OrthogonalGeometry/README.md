# Orthogonal geometry: Gram rigidity, coordinate isometries, and orthogonal series

The geometry of orthonormal families and of the subspaces they span: when two families are
carried onto one another by an isometry of the ambient space, how a family is presented as a
coordinate isometry, when a pairwise-orthogonal family spans an orthogonal family of lines,
and what it means for a subspace to reduce an operator.

Mathlib has `Matrix.gram` and the matrix-side spectral theory, `Submodule.starProjection`
with `HasOrthogonalProjection`, and `OrthogonalFamily`, whose only vector-level constructor
`Orthonormal.orthogonalFamily` requires *unit* vectors. It has no Gram-rigidity theorem, no
bundled coordinate isometry of an orthonormal family, and no reducing-subspace API.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`, with the subspace-equality isometry
lemma in `TauCeti/Analysis/Normed/Operator/`.

## Standing conventions

- **Gram rigidity produces a `LinearIsometryEquiv`.** Equal pairwise inner products give an
  isometry equivalence of the ambient space in finite dimension, and that is the carrier
  every consumer is stated against.
- **Invariant and reducing are distinct named notions.** They coincide for symmetric
  operators, and that coincidence is a theorem. Reducing subspaces form a geometry-only
  layer consumed by perturbation theory.

## What is missing (build here)

* Gram rigidity — equal pairwise inner products force a linear isometry equivalence — and
  the isometric first isomorphism theorem it rests on.
* The coordinate isometry `eⱼ ↦ vⱼ` of an orthonormal family.
* The orthogonal-series constructor for pairwise-orthogonal, not necessarily unit, vectors.
* Reducing subspaces, and the restriction of a symmetric operator to an invariant subspace.

## The build, in layers

The labels `OG-01`–`OG-22` form the complete mathematical obligation set for this roadmap.
Each label names one obligation. Milestones and acceptance criteria cite these labels, and
`Suggested.lean` cites the labels represented by its sample declarations.

### Gram rigidity

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
- **OG-05 — Gram rigidity on spans.** Two finite families with equal pairwise inner products
  admit a linear isometric equivalence between their spans.
- **OG-06 — Action of the span equivalence.** The equivalence in `OG-05` sends each vector
  of the first family to the corresponding vector of the second family.
- **OG-07 — Ambient Gram rigidity.** In finite dimension, the span equivalence of `OG-05`
  extends to a linear isometric equivalence of the ambient Hilbert space carrying each
  vector of the first family to the corresponding vector of the second family.
- **OG-08 — Gram-matrix characterization.** For finite families in a finite-dimensional
  Hilbert space, equality of Gram matrices is equivalent to the existence of an ambient
  linear isometric equivalence carrying one family to the other.

### Coordinate isometries and projection geometry

- **OG-09 — Coordinate isometry of an orthonormal family.** For an orthonormal family
  `(vⱼ)_{j<d}`, the linear combination map from `𝕜^d` to the ambient Hilbert space is a
  linear isometry.
- **OG-10 — Coordinate formula.** The coordinate isometry of `OG-09` sends a coordinate
  vector `x` to `∑ⱼ xⱼ vⱼ`.
- **OG-11 — Standard-basis action.** The coordinate isometry of `OG-09` sends the standard
  basis vector `eⱼ` to `vⱼ`.
- **OG-12 — Projection onto an orthonormal span.** The span of a finite orthonormal family
  admits its orthogonal projection in the ambient Hilbert space.
- **OG-13 — Isometry between equal subspaces.** An equality `U = V` of inner-product
  subspaces induces the canonical linear isometric equivalence `U ≃ V`.

### Invariant and reducing subspaces

- **OG-14 — Invariant subspace.** For an endomorphism `A`, define invariance of a subspace
  `U` by the condition `A(U) ⊆ U`.
- **OG-15 — Reducing subspace.** For an endomorphism `A`, define reduction by requiring
  both `U` and `U⊥` to be invariant under `A`.
- **OG-16 — Invariance and reduction for symmetric operators.** For a symmetric
  endomorphism, a subspace is invariant exactly when it is reducing.
- **OG-17 — Symmetry of the restriction.** The restriction of a symmetric endomorphism to
  an invariant subspace is symmetric on that subspace.
- **OG-18 — Completeness of projected subspaces.** In a complete Hilbert space, every
  subspace admitting an orthogonal projection is complete in its induced norm.

### Orthogonal series

- **OG-19 — Orthogonal family of lines.** A pairwise-orthogonal family of vectors determines
  an orthogonal family of the one-dimensional subspaces that they span, including vectors
  equal to zero.
- **OG-20 — Finite Pythagoras identity.** For every finite subfamily of pairwise-orthogonal
  vectors, `‖∑ᵢ vᵢ‖² = ∑ᵢ ‖vᵢ‖²`.
- **OG-21 — Orthogonal-series summability criterion.** A pairwise-orthogonal family is
  summable exactly when the family of squared norms has finite sum.
- **OG-22 — Parseval identity for a specified sum.** If a pairwise-orthogonal family sums to
  `x`, then `‖x‖² = ∑ᵢ ‖vᵢ‖²`.

**Milestone — Gram rigidity.** `OG-01`–`OG-08`.

**Milestone — coordinate and projection geometry.** `OG-09`–`OG-13`.

**Milestone — reducing subspaces.** `OG-14`–`OG-18`.

**Milestone — orthogonal series.** `OG-19`–`OG-22`.

## Worked examples (acceptance criteria)

**Acceptance criteria.** Ambient Gram rigidity is `OG-07`; the reducing-subspace layer is
`OG-14`–`OG-18`; the orthogonal-series constructor for arbitrary pairwise-orthogonal vectors
is `OG-19`.

## Ordering

This roadmap is independent and rests only on Mathlib.

**Downstream.** [`Majorization`](../Majorization/README.md) states its rectangular
constructions against the coordinate isometry and Gram rigidity;
[`PrincipalAngles`](../PrincipalAngles/README.md) defines the overlap operator from the
coordinate isometry; [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md)
restricts symmetric operators to reducing subspaces.

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
(Kitware, Inc.). The public API and proof structure may change during integration.

The Gram-matrix material also appeared in mathlib4 pull request
[#40567](https://github.com/leanprover-community/mathlib4/pull/40567). Its Tau Ceti API
exposes the range isometry as `rangeEquivOfInnerEq`.
