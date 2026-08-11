# Principal angles, the projection gap, and spectral subspaces

How far does a subspace rotate when its operator is perturbed? The classical answers —
Davis–Kahan, Hoffman–Wielandt, Yu–Wang–Samworth — measure the rotation in **principal
angles**, which are the singular values of an overlap operator, so their ordering and
bounds are inherited rather than re-proved.

This roadmap also owns the vocabulary those theorems are hypothesized in: the projector
gap, spectral subspaces, the restricted point spectrum, and the spectral-separation predicates.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`.

## Standing conventions

- **Setting.** Finite-dimensional inner product spaces over `[RCLike 𝕜]` where the
  eigenbasis is used; the projector-gap material is stated without finite-dimensional or
  completeness hypotheses.
- **`SpectrumIn` and `SpectraSeparated` are finite-dimensional point-spectrum vocabulary.**
  They are stated over `restrictedPointSpectrum`, a set of eigenvalues of an endomorphism. The
  Banach-algebra spectrum of a restriction is a different object and belongs to
  [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md).
- **Exact projector-gap identity.** The projector-difference identity
  `‖P − Q‖ = max (‖(1−Q)P‖, ‖(1−P)Q‖)` is an equality, with factor one and no equal-rank
  hypothesis. The roadmap carries this result in equality form.

## What Mathlib already has (consume)

- **Projections:** `Submodule.starProjection` with `HasOrthogonalProjection`,
  `IsStarProjection`, `Submodule.reflection`.
- **Orthogonal families:** `OrthogonalFamily`; the non-normalized vector-to-line bridge,
  coordinate isometry `familyIsometry`, and symmetric restriction theorem
  `ContinuousLinearMap.IsSymmetric.restrict_of_invariant` are consumed from
  [`OrthogonalGeometry`](../OrthogonalGeometry/README.md).
- **Singular values:** `LinearMap.singularValues`, which the principal cosines are defined
  as.

## What is missing (build here)

* Principal angles as singular values of the overlap operator, so ordering and bounds are
  inherited, with the aligned-basis layer over them.
* Angle geometry and the eigenvalue-perturbation results: the von Neumann trace core,
  Hoffman–Wielandt against an arbitrary orthonormal basis, and Davis's eigenvalue-change
  lower bound.
* The sharp projector-gap identity, spectral subspaces, the restricted point spectrum, and the
  separation predicates the perturbation roadmap consumes.
* `sinThetaMap`, the directed sine cross-projection the Davis–Kahan estimates are stated
  in, and `spectrumIn_spectralSubspace`, which is why no consumer supplies a
  spectral-containment hypothesis for the selected subspace.

## The build, in layers

The labels in Parts A–C form the complete mathematical obligation set for this roadmap.
Each label names one definition or theorem. Milestones and acceptance examples cite these
labels. `Suggested.lean` cites the labels represented by its sample declarations.

### Part A — principal angles, aligned bases, and finite frames

The frame layer supplies the analysis/synthesis pair. The aligned-basis layer consumes the
coordinate isometry `OG-09`–`OG-11`; `PA-A13`–`PA-A14` record the coordinate formulas used by
this roadmap. The overlap operator is the composite of two coordinate isometries, and its
singular values use the singular-value theory `PD-C01`–`PD-C08`.

**Objects.** For a finite family `v : ι → E`: the analysis map `x ↦ (⟪vᵢ, x⟫)ᵢ`, the
synthesis map, the frame operator on `E`, and the Gram operator on coefficient space. For two
orthonormal families: the overlap operator with matrix `⟪uᵢ, vⱼ⟫`, its principal-angle
cosines, and the squared Frobenius sine.

#### Finite frames

Analysis and synthesis place a finite family between the ambient Hilbert space and its coefficient
space. The frame and Gram operators record the same quadratic data on opposite carriers, linking
lower frame bounds to Gram-spectrum bounds.

- **PA-A01 — Analysis map.** For a finite family `(vᵢ)`, define the linear map
  `x ↦ (⟪vᵢ,x⟫)ᵢ` from the ambient Hilbert space to coefficient space.
- **PA-A02 — Synthesis map.** For a finite family `(vᵢ)`, define the linear map
  `(aᵢ) ↦ ∑ᵢ aᵢvᵢ` from coefficient space to the ambient Hilbert space.
- **PA-A03 — Analysis/synthesis adjointness.** The synthesis map is the adjoint of the
  analysis map.
- **PA-A04 — Frame operator.** Define the frame operator as synthesis after analysis.
- **PA-A05 — Gram operator.** Define the Gram operator as analysis after synthesis.
- **PA-A06 — Positivity of the frame operator.** The frame operator is positive.
- **PA-A07 — Symmetry of the frame operator.** The frame operator is symmetric.
- **PA-A08 — Positivity of the Gram operator.** The Gram operator is positive.
- **PA-A09 — Symmetry of the Gram operator.** The Gram operator is symmetric.
- **PA-A10 — Analysis norm identity.** For every `x`,
  `‖analysis x‖² = ∑ᵢ ‖⟪vᵢ,x⟫‖²`.
- **PA-A11 — Gram spectrum from a lower frame bound.** If
  `a‖x‖² ≤ ∑ᵢ ‖⟪vᵢ,x⟫‖²` for every `x`, then every sorted Gram eigenvalue whose index is
  below `finrank 𝕜 E` is at least `a`.
- **PA-A12 — Lower frame bound from Gram spectrum.** If coefficient space has dimension at
  least `finrank 𝕜 E` and the first `finrank 𝕜 E` sorted Gram eigenvalues are at least `a`,
  then `a‖x‖² ≤ ∑ᵢ ‖⟪vᵢ,x⟫‖²` for every `x`.
- **PA-A13 — Adjoint coordinate formula.** For an orthonormal family `(vᵢ)` and ambient
  vector `x`, the `i`-th coordinate of the adjoint of its coordinate isometry is
  `⟪vᵢ,x⟫`.
- **PA-A14 — Coordinate image lies in the family span.** Every vector in the image of an
  orthonormal family's coordinate isometry belongs to `span{vᵢ}`.

#### Overlap operator and family-level angles

For orthonormal families, coordinate isometries turn relative geometry into a square overlap
operator. Its singular values are the family-level principal cosines, and polar alignment gives
the Procrustes comparison between the two families.

- **PA-A15 — Overlap operator.** For orthonormal families `(uᵢ)` and `(vᵢ)` of the same
  finite cardinality, define the overlap operator as the adjoint of the coordinate isometry
  for `(uᵢ)` composed with the coordinate isometry for `(vᵢ)`.
- **PA-A16 — Matrix of the overlap operator.** In the standard coordinate bases, the
  `(i,j)` entry of the overlap operator is `⟪uᵢ,vⱼ⟫`.
- **PA-A17 — Contraction property.** The overlap operator has operator norm at most `1`.
- **PA-A18 — Adjoint symmetry of overlap.** Swapping the two families gives the adjoint
  overlap operator.
- **PA-A19 — Frobenius singular-value identity for overlap.** The overlap operator satisfies
  `∑ᵢ σᵢ² = ∑ⱼ∑ᵢ ‖⟪uᵢ,vⱼ⟫‖²`.
- **PA-A20 — Principal-angle cosines of families.** Define the principal-angle cosine
  sequence of two orthonormal families as the singular-value sequence of their overlap
  operator.
- **PA-A21 — Nonnegativity of family cosines.** Every principal-angle cosine is
  nonnegative.
- **PA-A22 — Unit upper bound for family cosines.** Every principal-angle cosine is at most
  `1`.
- **PA-A23 — Monotonicity of family cosines.** The principal-angle cosine sequence is
  antitone.
- **PA-A24 — Symmetry of family cosines.** Swapping the two orthonormal families leaves the
  principal-angle cosine sequence unchanged.
- **PA-A25 — Squared Frobenius sine.** Define
  `sin²_F Θ = ∑ₖ (1 - cos² θₖ)` for two orthonormal families of the same finite cardinality.
- **PA-A26 — Frobenius sine identity.** For families of cardinality `d`,
  `sin²_F Θ = d - ∑ₖ cos² θₖ`.
- **PA-A27 — Aligned orthonormal family.** The unitary factor in the finite-dimensional
  polar decomposition `PD-B21` of the overlap operator produces an orthonormal family
  `(wⱼ)` spanning the same subspace as `(vⱼ)`.
- **PA-A28 — Procrustes bound.** The aligned family in `PA-A27` satisfies
  `∑ⱼ ‖wⱼ-uⱼ‖² ≤ 2 sin²_F Θ`.
- **PA-A29 — Coordinate-block orthonormality.** Restricting an orthonormal basis to a finite
  coordinate block gives an orthonormal family whose span is the selected coordinate
  subspace.
- **PA-A30 — Eigenblock sine formula.** For two eigenblock families, the squared Frobenius
  sine equals the corresponding cross-block sum of squared overlaps.

**Milestone — finite-frame and overlap theory.** `PA-A01`–`PA-A26`.

**Milestone — aligned bases.** `PA-A27`–`PA-A30`.

### Part B — angle geometry and eigenvalue perturbation

Part B packages subspace angles, develops the Gram perturbation estimates, and proves the
finite-dimensional eigenvalue perturbation statements. Rectangular unitarily invariant
seminorms use `MAJ-B01`–`MAJ-B43`; the complete-space angle operators use the modulus
`PD-A36`–`PD-A45`.

**Objects.** The right and left Gram operators; the cross-projection cosine and sine maps;
the double-angle map; the complete-space cosine and sine angle operators; the finite
principal cosine, sine, angle, and tangent sequences; the acute and quarter-turn predicates;
and the frame factorization of an injective trial map.

#### Gram operators and angle objects

Right and left Gram operators convert a rectangular map into positive operators on its source
and target. Cross projections and their moduli encode relative subspace geometry as cosine,
sine, and double-angle operator data.

- **PA-B01 — Right Gram operator.** For `A : E → F`, define the source-space operator
  `A†A`.
- **PA-B02 — Left Gram operator.** For `A : E → F`, define the target-space operator
  `AA†`.
- **PA-B03 — Right-Gram perturbation identity.** For `Â,A : E → F`,
  `Â†Â - A†A = Â†(Â-A) + (Â-A)†A`.
- **PA-B04 — Right-Gram perturbation bound.** For bounded `Â,A`,
  `‖Â†Â-A†A‖ ≤ (‖A‖+‖Â‖)‖Â-A‖`.
- **PA-B05 — Left-Gram perturbation identity.** For `Â,A : E → F`,
  `ÂÂ† - AA† = Â(Â-A)† + (Â-A)A†`.
- **PA-B06 — Left-Gram perturbation bound.** For bounded `Â,A`,
  `‖ÂÂ†-AA†‖ ≤ (‖A‖+‖Â‖)‖Â-A‖`.
- **PA-B07 — Cosine cross-projection.** For projected subspaces `U,V`, define the bounded
  operator `P_V P_U`.
- **PA-B08 — Directed sine cross-projection.** For projected subspaces `U,V`, define the
  bounded operator `P_{V⊥}P_U`.
- **PA-B09 — Double-angle operator.** Define the bounded operator `2P_{U⊥}P_VP_U`.
- **PA-B10 — Cosine angle operator.** On a complete Hilbert space, define the cosine angle
  operator as `|P_VP_U|`.
- **PA-B11 — Sine angle operator.** On a complete Hilbert space, define the sine angle
  operator as `|P_U-P_V|`.
- **PA-B12 — Principal cosines of subspaces.** In finite dimension, define the principal
  cosine sequence as the singular values of `P_VP_U`.
- **PA-B13 — Principal sines of subspaces.** In finite dimension, define the principal sine
  sequence as the singular values of `P_{V⊥}P_U`.
- **PA-B14 — Principal angles.** Define the principal-angle sequence by applying `arcsin` to
  the principal sines.
- **PA-B15 — Principal tangents.** Define the principal-tangent sequence by applying `tan` to
  the principal angles.
- **PA-B16 — Acuteness.** Define a pair `(U,V)` to be acute when `P_V` is injective on `U`
  and `P_U` is injective on `V`.
- **PA-B17 — Quarter-turn avoidance.** Define quarter-turn avoidance by
  `θᵢ(U,V) ≠ π/4` for every principal angle.
- **PA-B18 — Trial-map frame factorization.** For an injective map `X : F → E`, package an
  isometric embedding and an invertible coordinate factor whose composite is `X` and whose
  isometric factor has range `range X`.

#### Principal-angle dictionary

The singular values of cross projections give the principal cosines and sines. Scalar
relations among cosine, sine, angle, and tangent connect these sequences to projector and
unitarily invariant norm identities.

- **PA-B19 — Cosines as singular values of the cross projection.** The singular-value
  sequence of `P_VP_U` is the principal-cosine sequence.
- **PA-B20 — Sines from the projector difference.** The projector difference `P_U-P_V` and
  the sine angle operator `|P_U-P_V|` have the same singular-value sequence.
- **PA-B21 — Unitarily invariant norm bridge.** Every rectangular unitarily invariant
  seminorm satisfies `N(P_U-P_V) = N(|P_U-P_V|)`.
- **PA-B22 — Equal-rank symmetry of principal sines.** If `U` and `V` have equal finite
  dimension, swapping them leaves the principal-sine sequence unchanged.
- **PA-B23 — Equal-rank symmetry of principal angles.** Under the hypotheses of `PA-B22`,
  swapping `U` and `V` leaves the principal-angle sequence unchanged.
- **PA-B24 — Angles of a subspace with itself.** For every projected finite-dimensional
  subspace `U`, `θᵢ(U,U)=0` for every `i`.
- **PA-B25 — Acuteness from the projection gap.** If `‖P_U-P_V‖ < 1`, then `(U,V)` is
  acute.
- **PA-B26 — Quarter-turn avoidance on the diagonal.** Every projected subspace avoids the
  quarter turn with itself.
- **PA-B27 — Family/subspace cosine bridge.** The principal cosines of the spans of two
  orthonormal families equal their family-level principal cosines from `PA-A20`.
- **PA-B28 — One-dimensional cosine formula.** For unit vectors `u,v`, the unique nonzero
  principal cosine of `span{u}` and `span{v}` is `|⟪u,v⟫|`.
- **PA-B29 — Equal-rank operator-norm sine identity.** For equal-dimensional projected
  subspaces, `‖P_U-P_V‖ = ‖P_{V⊥}P_U‖`.

#### Rearrangement and eigenvalue perturbation

Sorted rearrangement and doubly stochastic orbit geometry convert basis overlaps into ordered
eigenvalue comparisons. Gram perturbation and frame factorization then connect rectangular
operator perturbations with eigenvalue displacement.

- **PA-B30 — Sorted rearrangement inequality.** Pairing two real finite tuples in the same
  sorted order maximizes their bilinear pairing over coordinate permutations.
- **PA-B31 — Birkhoff bilinear bound.** A doubly stochastic mixture of permutations has
  bilinear pairing at most the sorted pairing.
- **PA-B32 — von Neumann trace inequality.** For symmetric finite-dimensional operators
  `T,S`, `tr(TS) ≤ ∑ᵢ λᵢ(T)λᵢ(S)` for decreasing eigenvalue lists.
- **PA-B33 — Basis independence of symmetric Frobenius energy.** For symmetric `T`, the
  quantity `∑ₖ ‖Teₖ‖²` is independent of the orthonormal basis `(eₖ)`.
- **PA-B34 — Permutation-orbit hull for diagonals.** The diagonal of a symmetric operator
  `S` in an eigenbasis of a symmetric operator `T` lies in the convex hull of the
  permutation orbit of the spectrum of `S`.
- **PA-B35 — Separated-tuple displacement estimate.** If `γ≥0`, the coordinates of `w`
  are pairwise `γ`-separated, and `c` lies in the convex hull of the coordinate-permutation
  orbit of `w`, then `(γ/√2)‖w-c‖ ≤ ⟪w-c,w⟫`.
- **PA-B36 — Gram frame factorization.** In the factorization `PA-B18`, the coordinate
  factor is the positive square root of the trial Gram operator and the isometric factor is
  the corresponding orthonormalized embedding.
- **PA-B37 — Range preservation of the trial factorization.** The isometric factor in
  `PA-B18` has range `range X`.
- **PA-B38 — Inverse-coordinate bound.** A positive lower frame bound `ε` gives
  `‖coordinate⁻¹‖ ≤ ε⁻¹`.
- **PA-B39 — Composition cost in unitarily invariant seminorms.** Under the hypotheses of
  `PA-B38`, every rectangular unitarily invariant seminorm satisfies
  `N(A ∘ coordinate⁻¹) ≤ N(A) ε⁻¹`.
- **PA-B40 — Hoffman–Wielandt inequality.** For symmetric `T,S` with decreasing eigenvalue
  lists and every orthonormal basis `(eₖ)`,
  `∑ᵢ (λᵢ(T)-λᵢ(S))² ≤ ∑ₖ ‖(S-T)eₖ‖²`.
- **PA-B41 — Davis eigenvalue-change lower bound.** Let `H=S-T`. If the spectrum of `S` is
  `γ`-separated and the diagonal part of `H` in an eigenbasis of `T` has Frobenius norm at
  most `γ/√2`, then
  `∑ᵢ (λᵢ(S)-λᵢ(T))² ≥ ‖𝒞H‖²_F - ‖𝒞⊥H‖²_F`.

**Milestone — angle dictionary.** `PA-B01`–`PA-B29`.

**Milestone — eigenvalue perturbation.** `PA-B30`–`PA-B41`.

### Part C — the projection gap and spectral subspaces

Part C supplies the finite-dimensional point-spectral vocabulary used by perturbation
statements and the dimension-free projection-gap identity. The restriction of a symmetric
operator to an invariant subspace uses `OG-16`–`OG-17`.

**Objects.** Reflections; diagonal and off-diagonal operator blocks relative to `U ⊕ U⊥`;
symmetric and directed projection gaps; the restricted point spectrum; canonical spectral
subspaces and projectors; spectral containment; and the pairwise, ordered, and
interval/exterior separation predicates.

#### Projection blocks and gaps

The decomposition `U ⊕ U⊥` separates an operator into diagonal and off-diagonal blocks.
Reflection formulas and directed sine blocks combine into the sharp symmetric projection-gap
identity.

- **PA-C01 — Diagonal operator block.** Relative to `U ⊕ U⊥`, define the diagonal part of
  an operator by its `U→U` and `U⊥→U⊥` blocks.
- **PA-C02 — Off-diagonal operator block.** Relative to `U ⊕ U⊥`, define the off-diagonal
  part by its `U→U⊥` and `U⊥→U` blocks.
- **PA-C03 — Involutivity of reflection.** The reflection across a projected subspace
  satisfies `R_U² = 1`.
- **PA-C04 — Isometry of reflection.** The reflection across a projected subspace preserves
  norms.
- **PA-C05 — Reflection commutes with reducing operators.** If `U` reduces `A`, then
  `R_U A = A R_U`.
- **PA-C06 — Reflection formula for the diagonal block.** For every operator `A`,
  `2 diag_U(A) = A + R_U A R_U`.
- **PA-C07 — Reflection formula for the off-diagonal block.** For every operator `A`,
  `2 offdiag_U(A) = A - R_U A R_U`.
- **PA-C08 — Symmetric projection gap.** Define the gap between projected subspaces by
  `‖P_U-P_V‖`.
- **PA-C09 — Directed projection gap.** Define the directed gap from `U` to `V` by
  `‖P_{V⊥}P_U‖`.
- **PA-C10 — Symmetry of the projection gap.** The symmetric projection gap is unchanged by
  swapping `U` and `V`.
- **PA-C11 — Directed-gap comparison.** Each directed gap is bounded above by the symmetric
  projection gap.
- **PA-C12 — Sharp projector-gap identity.** For projected subspaces `U,V`,
  `‖P_U-P_V‖ = max(‖P_{V⊥}P_U‖, ‖P_{U⊥}P_V‖)`.

#### Restricted point spectrum and spectral subspaces

Restricted point spectrum gives a basis-independent description of spectral data inside a
subspace. Canonical spectral subspaces and quadratic-form bounds connect selected eigenvalues to
the order hypotheses used by perturbation theory.

- **PA-C13 — Restricted point spectrum.** For an endomorphism `A` and subspace `U`, define
  the real restricted point spectrum as the set of real `λ` admitting a nonzero eigenvector
  in `U` with eigenvalue `λ`.
- **PA-C14 — Membership characterization.** A real number `λ` belongs to the restricted
  point spectrum on `U` exactly when there is `x ∈ U`, `x ≠ 0`, with `Ax = λx`.
- **PA-C15 — Membership introduction.** A nonzero vector `x ∈ U` satisfying `Ax = λx`
  places `λ` in the restricted point spectrum on `U`.
- **PA-C16 — Spectral containment predicate.** Define spectral containment on `U` by
  inclusion of the restricted point spectrum in a specified real set `Ω`.
- **PA-C17 — Spectral subspace.** For a real set `Ω`, define the spectral subspace as the
  span of eigenvectors with eigenvalues in `Ω`.
- **PA-C18 — Spectral projector.** Define the orthogonal projector onto the spectral
  subspace `PA-C17`.
- **PA-C19 — Spectral-subspace containment.** The spectral subspace selected by `Ω` has
  restricted point spectrum contained in `Ω`.
- **PA-C20 — Upper form bound from point spectrum.** If a symmetric operator restricted to
  `U` has restricted point spectrum in `(-∞,a]`, then
  `Re⟪Ax,x⟫ ≤ a‖x‖²` for every `x ∈ U`.
- **PA-C21 — Point spectrum from an upper form bound.** For symmetric `A`, the upper
  quadratic-form bound `Re⟪Ax,x⟫ ≤ a‖x‖²` on `U` implies that the restricted point spectrum
  on `U` lies in `(-∞,a]`.
- **PA-C22 — Lower form bound from point spectrum.** If a symmetric operator restricted to
  `U` has restricted point spectrum in `[a,∞)`, then
  `a‖x‖² ≤ Re⟪Ax,x⟫` for every `x ∈ U`.
- **PA-C23 — Point spectrum from a lower form bound.** For symmetric `A`, the lower
  quadratic-form bound `a‖x‖² ≤ Re⟪Ax,x⟫` on `U` implies that the restricted point spectrum
  on `U` lies in `[a,∞)`.

### Spectral-separation predicates

The named predicates give theorem families a shared point-spectral vocabulary.

- **PA-C24 — Pairwise spectral separation.** Define pairwise separation by requiring
  `δ ≤ |λ-μ|` for every `λ` in the first restricted point spectrum and `μ` in the second.
- **PA-C25 — Ordered spectral gap.** Define ordered separation by requiring
  `λ+δ ≤ μ` for every `λ` in the first restricted point spectrum and `μ` in the second.
- **PA-C26 — Interval/exterior gap.** Define the interval/exterior condition by requiring
  the selected spectrum of `A` to lie in `[a,b]` and the selected spectrum of `B` to lie
  outside `(a-δ,b+δ)`.
- **PA-C27 — Ordered gap implies pairwise separation.** If `δ ≥ 0`, ordered separation by
  `δ` implies pairwise separation by `δ`.
- **PA-C28 — Opposite-side inclusions imply an ordered gap.** If the first restricted point
  spectrum lies in `(-∞,a]` and the second lies in `[a+δ,∞)`, then the two are ordered by
  gap `δ`.
- **PA-C29 — Form bounds imply an ordered spectral gap.** If `A` has upper quadratic-form
  bound `a` on the first subspace and `B` has lower quadratic-form bound `a+δ` on the
  second, then their restricted point spectra have ordered gap `δ`.

**Milestone — projection blocks and the sharp gap identity.** `PA-C01`–`PA-C12`.

**Milestone — spectral subspaces and form bounds.** `PA-C13`–`PA-C23`.

**Milestone — spectral-separation vocabulary.** `PA-C24`–`PA-C29`.

## Worked examples (acceptance criteria)

### Part A — principal angles, aligned bases, and finite frames

**Acceptance examples.** Coordinate-block families are `PA-A29`; eigenblock cross-overlap is
`PA-A30`; the coordinate-isometry basis action is supplied by `OG-10`–`OG-11`.

### Part B — angle geometry and eigenvalue perturbation

**Acceptance examples.** The one-dimensional cosine formula is `PA-B28`; self-angles are
`PA-B24`; the equal-rank operator-norm sine identity is `PA-B29`.

### Part C — the projection gap and spectral subspaces

**Acceptance criteria.** The sharp gap equality is `PA-C12`; the canonical separation
vocabulary is `PA-C24`–`PA-C29`.

## Ordering

Part A comes first and consumes singular values from
[`PolarDecomposition`](../PolarDecomposition/README.md) and the coordinate-isometry and
orthogonal-family API from [`OrthogonalGeometry`](../OrthogonalGeometry/README.md). Part B
states its estimates in Part A's angles and needs the permutation-orbit hull of
[`Majorization`](../Majorization/README.md) for Davis's lower bound. Part C is independent
of Parts A and B, but consumes `OrthogonalGeometry` for invariant-subspace restriction.

**Downstream.** [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md)
consumes the angles, `sinThetaMap`, the separation predicates and `spectralSubspace`.

## Definitions

**D1 (`PA-A20`).** `cos Θ(u,v) = σ(overlap(u,v))` — the principal-angle cosines of two
orthonormal families, sorted decreasingly and zero-padded.

## References

- Å. Björck, G. Golub, *Numerical methods for computing angles between linear subspaces*,
  Math. Comp. **27** (1973) — principal angles via singular values.
- A. J. Hoffman, H. W. Wielandt, *The variation of the spectrum of a normal matrix*, Duke
  Math. J. **20** (1953); C. Davis, *The rotation of eigenvectors by a perturbation*,
  J. Math. Anal. Appl. **6** (1963), Theorem 4.1 — the eigenvalue-change bound and the
  projection gap.

## Acknowledgements

An Apache-2.0 implementation of all three Parts exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.). The public API and proof structure may change during integration.
