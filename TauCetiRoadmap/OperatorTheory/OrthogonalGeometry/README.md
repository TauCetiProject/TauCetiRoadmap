# Orthogonal geometry: Gram rigidity, coordinate isometries, and orthogonal series

The geometry of orthonormal families and of the subspaces they span: when two families are
carried onto one another by an isometry of the ambient space, how a family is presented as a
coordinate isometry, when a pairwise-orthogonal family spans an orthogonal family of lines,
and what it means for a subspace to reduce an operator.

Mathlib has `Matrix.gram` and the matrix-side spectral theory, `Submodule.starProjection`
with `HasOrthogonalProjection`, and `OrthogonalFamily`, whose only vector-level constructor
`Orthonormal.orthogonalFamily` requires *unit* vectors. It has no Gram-rigidity theorem, no
bundled coordinate isometry of an orthonormal family, and no reducing-subspace API.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`.

## Standing conventions

- **Gram rigidity produces a `LinearIsometryEquiv`.** Equal pairwise inner products give an
  isometry equivalence of the ambient space in finite dimension, and that is the carrier
  every consumer is stated against.
- **Invariant and reducing are distinct named notions.** They coincide for symmetric
  operators, and that coincidence is a theorem. Reducing subspaces stay independent of all
  perturbation theory.

## What is missing (build here)

* Gram rigidity — equal pairwise inner products force a linear isometry equivalence — and
  the isometric first isomorphism theorem it rests on.
* The coordinate isometry `eⱼ ↦ vⱼ` of an orthonormal family.
* The orthogonal-series constructor for pairwise-orthogonal, not necessarily unit, vectors.
* Reducing subspaces, and the restriction of a symmetric operator to an invariant subspace.

## The build, in layers

**Objects.** The isometric first isomorphism theorem `rangeEquivOfInnerEq` — two maps out
of a common module with equal pullback inner products have canonically isometric ranges —
and the Gram-rigidity theorems it yields; the coordinate isometry `familyIsometry` of an
orthonormal family; projections onto spans of orthonormal families; invariant and reducing
subspaces; the orthogonal-series constructor for pairwise orthogonal, not necessarily unit,
vectors.

**API to develop.**

- Gram rigidity: equal pullback inner products give equal kernels and the range isometry;
  for families, equal pairwise inner products give a span-to-span isometry sending
  `φ i ↦ ψ i`, extended in finite dimension to a `LinearIsometryEquiv` of the ambient
  space, which is the carrier consumers are stated against; the `Matrix.gram`
  characterization as an iff.
- Projection geometry: projections onto spans of orthonormal families, and the coordinate
  isometry `eⱼ ↦ vⱼ` of an orthonormal family that
  [`Majorization`](../Majorization/README.md) and
  [`PrincipalAngles`](../PrincipalAngles/README.md) both state their constructions against.
- Invariance: invariant and reducing kept as distinct named notions — they coincide for
  symmetric operators, and that coincidence is a theorem; restriction of a symmetric
  operator to an invariant subspace.
- Orthogonal series: a pairwise-orthogonal family of vectors spans an orthogonal family of
  lines — the constructor Mathlib's unit-vector hypothesis blocks; Pythagoras for finite
  sums; summability iff square-norm summability; Parseval for a family with a specified
  sum. The families this produces are `σᵢ • uᵢ`, orthogonal but not normalizable when some
  `σᵢ` vanish, which is why the unit-vector constructor does not suffice.

## Worked examples (acceptance criteria)

**Acceptance criteria.** That Gram rigidity lands in `LinearIsometryEquiv`; that reducing
subspaces import no perturbation theory; that the orthogonal-series constructor fills the
non-unit-vector gap rather than duplicating `OrthogonalFamily`.

## Ordering

This roadmap rests on [`PolarDecomposition`](../PolarDecomposition/README.md) for the
inner-product linear-combination identity and the subspace-equality isometry lemma, and on
nothing else in the family.

**Downstream.** [`Majorization`](../Majorization/README.md) states its rectangular
constructions against the coordinate isometry and Gram rigidity;
[`PrincipalAngles`](../PrincipalAngles/README.md) defines the overlap operator from the
coordinate isometry; [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md)
restricts symmetric operators to reducing subspaces.

## Definitions

**D1** `x ↦ ∑ⱼ xⱼ vⱼ`, so `eⱼ ↦ vⱼ` — the coordinate isometry of an orthonormal family.

**D2** `S x ↦ T x` — the isometry of ranges induced by two maps out of a common module with
equal pullback inner products.

## References

- T.-Y. Chien, S. Waldron, *A characterization of projective unitary equivalence of finite
  frames and applications*, SIAM J. Discrete Math. **30** (2016), arXiv:1312.5393 — Gram
  rigidity in its frame-theoretic form.

## Acknowledgements

An Apache-2.0 implementation exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.). The public API and proof structure may change during integration.

The Gram-matrix material was submitted as mathlib4 pull request
[#40567](https://github.com/leanprover-community/mathlib4/pull/40567) and reshaped on
review: the linear-combination identity moved to its natural home, and the quotient
plumbing became the standalone `rangeEquivOfInnerEq`. That pull request is closed —
Mathlib is not the destination — and the module was generalized further afterwards.
