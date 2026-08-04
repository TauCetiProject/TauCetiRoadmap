# The geometry of principal angles and eigenvalue perturbation

How far does an eigenvector rotate when its operator is perturbed? The classical answers —
Davis–Kahan, Hoffman–Wielandt — measure the rotation in **principal angles** between
subspaces.

Mathlib has the static layer — the spectral theorem, singular values, adjoints, orthogonal
projections, Birkhoff's theorem — but no principal angles and no **Hoffman–Wielandt**.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`.

## Standing conventions

- **Setting.** Finite-dimensional inner product spaces over `[RCLike 𝕜]`, so `ℝ` and `ℂ`
  uniformly; operators as `E →ₗ[𝕜] F`, with `toContinuousLinearMap` appearing only where
  the operator norm itself is quoted. Sorted spectral data are finitely supported sequences
  `ℕ →₀ ℝ`, decreasing and zero-padded, matching Mathlib's `LinearMap.singularValues`.
- **Principal-angle cosines are singular values of the overlap operator** `⟪uᵢ, vⱼ⟫`, not
  the textbook variational recursion. Nonnegativity, `≤ 1`, decreasing order, and symmetry
  in `u, v` are then inherited from the singular-value API — the last because the overlap
  operators of the swapped pair are adjoint. The recursion should be *absent*, not hidden.
- **Families first, subspaces later, and the bridge is a Part D target.**
  - Part B's `cosPrincipalAngles hu hv` is indexed by orthonormal families, so as stated it
    is an invariant of the chosen families.
  - Part D defines `principalCosines U V` for submodules as the singular values of `P_V P_U`,
    and proves the two agree on spans — that the family invariant depends only on the spans.
  - The bridge lives in Part D because it needs the projector dictionary built there.
- **Directed sines are not symmetric.** `principalSines U V` are the singular values of
  `P_{Vᗮ} P_U`; symmetry of the sines and of the angles holds under an equal-rank
  hypothesis, which matches the multiplicities of the quarter-turn defect directions, and
  is a theorem rather than a convention. Angles are `arcsin` of the sines, keeping the
  support finite.
- **Two proof routes into eigenvalue perturbation, chosen deliberately.** Davis's
  eigenvalue-change bound goes through **Birkhoff's theorem** (already in Mathlib) and a
  permutation-orbit convex hull. Hoffman–Wielandt factors through the **von Neumann trace inequality**, whose
  sorted rearrangement core is proved here from Mathlib's rearrangement inequality rather
  than cited.
- **The trial-map factorization carries no spectral gap.** The isometric range
  factorization of an injective map (Part D) is stated free of any gap or perturbation
  hypothesis, so anything needing a trial map factored can reuse it.

## What Mathlib already has (consume)

- **Spectral theory:** `LinearMap.IsSymmetric.eigenvalues` / `eigenvectorBasis` and
  `LinearMap.singularValues : ℕ →₀ ℝ`, with `LinearMap.adjoint` and
  `Submodule.starProjection`. All sorted data here are stated against these, never against
  a private ordering.
- **Convexity:** **Birkhoff** (`doublyStochastic_eq_convexHull_permMatrix`) for the
  eigenvalue-change bound; the **rearrangement inequality**
  (`MonovaryOn.sum_comp_perm_smul_le_sum_smul`) as the core of von Neumann.
- **Geometry:** `EuclideanSpace`, `OrthonormalBasis`, `Orthonormal`, `LinearIsometry` /
  `LinearIsometryEquiv`, `Submodule.orthogonal`; `Real.arcsin` and `Real.tan` for the angle
  sequences.
- **From [`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md)**,
  an explicit dependency and not Mathlib: the positive square root and operator modulus,
  the polar decomposition and its unitary, Courant–Fischer min–max, the rectangular
  singular-value facts `σ(A⋆) = σ(A)` and `σᵢ(A)² = λᵢ(A⋆A)`, and the projection and
  spectral-subspace API. Every Part below consumes these; nothing here re-proves them.

## What is missing (build here)

* Principal angles as singular values of the overlap operator, so ordering and bounds are
  inherited, with the aligned-basis layer over them.
* Angle geometry and the eigenvalue-perturbation results: the von Neumann trace core,
  Hoffman–Wielandt against an arbitrary orthonormal basis, and Davis's eigenvalue-change
  lower bound.

## The build, in layers

### Part B — principal angles, aligned bases, and finite frames

The order of construction is the mathematics: the frame layer gives the analysis/synthesis
pair, the aligned-basis layer packages an orthonormal family as an isometry from coordinate
space, and the overlap operator is then literally a composite of two of those — which is
why its adjoint is the swapped pair, and why the symmetry of the cosines is immediate.

**Objects.** For a finite family `v : ι → E`: the analysis map `x ↦ (⟪vᵢ, x⟫)ᵢ`, the
synthesis map, the **frame operator** on `E` and the **Gram operator** on coefficient space.
For an orthonormal family: the coordinate isometry
`familyIsometry hv : EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E`. For two orthonormal families: the
**overlap operator** `overlapOp hu hv = (familyIsometry hu)⋆ ∘ (familyIsometry hv)`, with
matrix `⟪uᵢ, vⱼ⟫`; its singular values `cosPrincipalAngles hu hv : ℕ →₀ ℝ`; and the squared
Frobenius sine `sinThetaSq hu hv = ∑ₖ (1 − cos²θₖ)`.

**API to develop.**

- Analysis/synthesis adjointness; frame and Gram operators positive and symmetric;
  `‖analysis x‖² = ∑ᵢ ‖⟪vᵢ, x⟫‖²`; the frame-bound dictionary — a lower frame bound is
  exactly a floor on the first `finrank 𝕜 E` sorted Gram eigenvalues, in both directions.
- `familyIsometry` on basis vectors and its adjoint as the coordinate map; membership of its
  image in the span.
- `overlapOp` is a contraction; `(overlapOp hu hv)⋆ = overlapOp hv hu`; its entrywise matrix
  description; `∑ σᵢ(overlapOp)² = ∑ⱼ∑ᵢ ‖⟪uᵢ, vⱼ⟫‖²`.
- The four basic facts about `cosPrincipalAngles` — nonnegative, `≤ 1`, antitone, symmetric
  — inherited from the singular-value API, with no inductive proofs.

**Milestone — the Frobenius sine identity** `‖sin Θ‖²_F = d − overlap`, which converts an
angle statement into an inner-product statement: the form in which perturbation estimates
are proved.

**Milestone — the aligned-basis (Procrustes) bound.** The polar unitary of the overlap
operator rotates `v` into a basis `w` of its span with `∑ⱼ ‖wⱼ − uⱼ‖² ≤ 2 · sinThetaSq hu hv`
— the form the statistical perturbation theory consumes.

### Part D — angle geometry and eigenvalue perturbation

Part D combines the angle dictionary with eigenvalue perturbation; the spectral-subspace
perturbation theorems use both.

**Objects.** The Gram operators `rightGram A = A⋆A` and `leftGram A = AA⋆`; the
cross-projections `cosThetaMap U V = P_V ∘ P_U` and `sinThetaMap U V = P_{Vᗮ} ∘ P_U`; their
moduli (`cosAngleOperator`, `sinAngleOperator = |P_U − P_V|`) and the one-sided double-angle
map `sinTwoAngleOperator = 2 P_{Uᗮ} P_V P_U`; the sequences `principalCosines`,
`principalSines`, `principalAngles`, `principalTangents : ℕ →₀ ℝ`; the transversality
predicates (`IsTransverse`, `IsAcute`, `AvoidsQuarterTurn`); the gap-free
`TrialMapFrameFactorization` of an injective map.

**API to develop.**

- Gram perturbation identities `Â⋆Â − A⋆A = Â⋆(Â−A) + (Â−A)⋆A` and the operator-norm bounds
  `‖Â⋆Â − A⋆A‖ ≤ (‖A‖+‖Â‖)·‖Â−A‖`, both sides.
- The dictionary: `σ(cosThetaMap) = principalCosines`; `σ(P_U − P_V) = σ(sinAngleOperator)`;
  equal-rank symmetry of sines and angles; angles of a pair with itself vanish; acuteness
  from a projection gap `< 1`.
- **The Part B bridge**, the theorem that makes `cosPrincipalAngles` well-named: the
  subspace-level cosines of the spans equal the family-level cosines. It does double duty —
  the subspace/family dictionary entry for this Part, and the independence-of-presentation
  statement for the Part upstream.
- The sorted rearrangement inequality and the Birkhoff bilinear bound; the von Neumann trace
  inequality `tr(TS) ≤ ∑ λᵢ(T)λᵢ(S)`; basis independence of the squared Frobenius norm of a
  symmetric operator.
- The Birkhoff bridge: the diagonal of `S` in `T`'s eigenbasis lies in the convex hull of
  the permutation orbit of `S`'s spectrum; the vector-level displacement estimate around a
  `γ`-separated tuple.
- The trial-map factorization `X = (isometry) ∘ (Gram square root)` with range preservation,
  inverse-factor bounds from a lower frame bound, and the composition cost
  `N (A ∘ coordinate⁻¹) ≤ N A · ε⁻¹` in every rectangular unitarily invariant norm.

**Milestone — the family/subspace bridge**, as above.

**Milestone — Hoffman–Wielandt.** `∑ᵢ (λᵢ(T) − λᵢ(S))² ≤ ∑ₖ ‖(S−T) eₖ‖²` for symmetric
`T, S` with sorted spectra and an **arbitrary** orthonormal basis `e`. The arbitrary basis
is the point: the eigenbasis-specialized form is enough to prove the theorem but is not the
invariant Frobenius statement a consumer wants, so the clean name belongs to the general
one.

**Milestone — Davis's eigenvalue-change lower bound.** For symmetric `T, S` with `H = S − T`,
a `γ`-separated spectrum of `S`, and diagonal part (in `T`'s eigenbasis) of Frobenius norm
at most `γ/√2`: `∑ᵢ (λ'ᵢ − λᵢ)² ≥ ‖𝒞H‖²_F − ‖𝒞⊥H‖²_F`. The separation hypothesis and the
smallness threshold are both part of the statement; without them it reads as an
unconditional bound, which is false. Proved around a point of the permutation-orbit hull,
with membership discharged from Birkhoff.

## Worked examples (acceptance criteria)

### Part B — principal angles, aligned bases, and finite frames

**Acceptance examples.** The selected-block family of an orthonormal basis is orthonormal
with span the selected coordinate block, and the `sinThetaSq` of two eigenblock families is
the cross-block overlap sum; `familyIsometry` sends the `k`-th coordinate vector to `v k`.

### Part D — angle geometry and eigenvalue perturbation

**Acceptance examples.** Two unit-generated lines have a single principal cosine `‖⟪u, v⟫‖`;
`principalAngles U U = 0`; the equal-rank operator-norm identity
`‖P_U − P_V‖ = ‖sinThetaMap U V‖`.

## Ordering

Part B needs [`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md).
Part D needs Part B for the angles, and the foundations for the projection and polar
machinery. Within Part D, the frame factorization is independent of the perturbation results
and portable early.

## Definitions

**D1** `x ↦ ∑ⱼ xⱼ vⱼ`, so `eⱼ ↦ vⱼ` — the coordinate isometry of an orthonormal family.

**D2** `cos Θ(u, v) = σ(overlap operator)` — the principal-angle cosines, sorted decreasingly
and zero-padded.

## References

- Å. Björck, G. Golub, *Numerical methods for computing angles between linear subspaces*,
  Math. Comp. **27** (1973) — principal angles via singular values.
- A. J. Hoffman, H. W. Wielandt, *The variation of the spectrum of a normal matrix*, Duke
  Math. J. **20** (1953); C. Davis, *The rotation of eigenvectors by a perturbation*,
  J. Math. Anal. Appl. **6** (1963), Theorem 4.1.
- Y. Yu, T. Wang, R. J. Samworth, *A useful variant of the Davis–Kahan theorem for
  statisticians*, Biometrika **102** (2015) — the aligned-basis bound.

## Acknowledgements

An Apache-2.0 implementation of both Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.). The public API and proof structure may change during integration.

