# Principal angles, the projection gap, and spectral subspaces

How far does a subspace rotate when its operator is perturbed? The classical answers —
Davis–Kahan, Hoffman–Wielandt, Yu–Wang–Samworth — measure the rotation in **principal
angles**, which are the singular values of an overlap operator, so their ordering and
bounds are inherited rather than re-proved.

This roadmap also owns the vocabulary those theorems are hypothesized in: the projector
gap, spectral subspaces, the restricted spectrum, and the spectral-separation predicates.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`.

## Standing conventions

- **Setting.** Finite-dimensional inner product spaces over `[RCLike 𝕜]` where the
  eigenbasis is used; the projector-gap material needs neither finite dimension nor
  completeness and must not assume them.
- **`SpectrumIn` and `SpectraSeparated` are finite-dimensional point-spectrum vocabulary.**
  They are stated over `restrictedSpectrum`, a set of eigenvalues of an endomorphism. The
  Banach-algebra spectrum of a restriction is a different object and belongs to
  [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md).
- **Equalities where equalities hold.** The projector-difference identity
  `‖P − Q‖ = max (‖(1−Q)P‖, ‖(1−P)Q‖)` is an equality, with factor one and no equal-rank
  hypothesis. It must not be weakened to a two-sided estimate.

## What Mathlib already has (consume)

- **Projections:** `Submodule.starProjection` with `HasOrthogonalProjection`,
  `IsStarProjection`, `Submodule.reflection`.
- **Orthogonal families:** `OrthogonalFamily`, whose only vector-level constructor
  `Orthonormal.orthogonalFamily` requires *unit* vectors — the gap Part C fills for the
  non-normalized families a singular expansion produces.
- **Singular values:** `LinearMap.singularValues`, which the principal cosines are defined
  as.

## What is missing (build here)

* Principal angles as singular values of the overlap operator, so ordering and bounds are
  inherited, with the aligned-basis layer over them.
* Angle geometry and the eigenvalue-perturbation results: the von Neumann trace core,
  Hoffman–Wielandt against an arbitrary orthonormal basis, and Davis's eigenvalue-change
  lower bound.
* The sharp projector-gap identity, spectral subspaces, the restricted spectrum, and the
  separation predicates the perturbation roadmap consumes.
* `sinThetaMap`, the directed sine cross-projection the Davis–Kahan estimates are stated
  in, and `spectrumIn_spectralSubspace`, which is why no consumer supplies a
  spectral-containment hypothesis for the selected subspace.

## The build, in layers

### Part A — principal angles, aligned bases, and finite frames

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

### Part B — angle geometry and eigenvalue perturbation

Part B combines the angle dictionary with eigenvalue perturbation; the spectral-subspace
perturbation theorems use both.

**Objects.** The Gram operators `rightGram A = A⋆A` and `leftGram A = AA⋆`; the
cross-projections `cosThetaMap U V = P_V ∘ P_U` and `sinThetaMap U V = P_{Vᗮ} ∘ P_U`; their
moduli (`cosAngleOperator`, `sinAngleOperator = |P_U − P_V|`) and the one-sided double-angle
map `sinTwoAngleOperator = 2 P_{Uᗮ} P_V P_U`; the sequences `principalCosines`,
`principalSines`, `principalAngles`, `principalTangents : ℕ →₀ ℝ`; the predicates `IsAcute`
and `AvoidsQuarterTurn`; the gap-free
`TrialMapFrameFactorization` of an injective map.

**API to develop.**

- Gram perturbation identities `Â⋆Â − A⋆A = Â⋆(Â−A) + (Â−A)⋆A` and the operator-norm bounds
  `‖Â⋆Â − A⋆A‖ ≤ (‖A‖+‖Â‖)·‖Â−A‖`, both sides.
- The dictionary: `σ(cosThetaMap) = principalCosines`; `σ(P_U − P_V) = σ(sinAngleOperator)`,
  hence the norm bridge `N (P_U − P_V) = N (sinAngleOperator U V)` for every unitarily
  invariant `N`, via determination by singular values; equal-rank symmetry of sines
  and angles; angles of a pair with itself vanish; acuteness from a projection gap `< 1`.
- **The Part A bridge**, the theorem that makes `cosPrincipalAngles` well-named: the
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
with membership discharged from Birkhoff and not from the
[`Majorization`](../Majorization/README.md) engine.

### Part C — the projection gap and spectral subspaces

The vocabulary the perturbation theory is stated in, and the one sharp identity that
vocabulary exists for:

```text
‖P − Q‖ = max (‖(1−Q) P‖, ‖(1−P) Q‖)        for orthogonal projections P, Q
```

Perturbation arguments naturally produce two one-sided estimates; this equality upgrades
the pair to a bound on `‖P − Q‖` itself with factor one and no equal-rank hypothesis.
Without it a development loses a factor of two or carries a rank condition through every
statement. The proof is the block decomposition `(P−Q)² = P(1−Q)P + (1−P)Q(1−P)` with the
C⋆-norm identities, scalar-generic over `RCLike`.

**Objects.** Reflections, diagonal and off-diagonal parts of an operator relative to
`U ⊕ Uᗮ`; the symmetric and directed projection gaps; restricted spectra with the canonical
spectral subspace `spectralSubspace A Ω` and projector `spectralProjection A Ω`; the
spectral-separation predicates.

**API to develop.**

- Projection blocks: reflections with involutivity, isometry, and
  commutation-when-reducing; the diagonal/off-diagonal calculus
  (`2·diag = A + R A R`, `2·offdiag = A − R A R`).
- The gap: symmetry, the directed-gap comparison, the max identity above; `sinThetaMap`,
  the directed sine cross-projection `P_{Vᗮ} ∘ P_U` the Davis–Kahan estimates are stated in.
- `spectrumIn_spectralSubspace`: the spectral subspace selected by `Ω` carries only
  spectrum in `Ω`. It is a theorem for every operator and every set, so no consumer of the
  perturbation theorems supplies it as a hypothesis.
- Restricted spectra: the restriction of a symmetric operator to an invariant subspace and
  its restricted spectrum; the quadratic-form bridges
  `SpectrumIn A U (Iic a) → re ⟪A x, x⟫ ≤ a‖x‖²` on `U`, with their converses.

### The spectral-separation predicates

Several theorem families across this roadmap family — sine, tangent, double-angle,
Sylvester — hypothesize that two pieces of spectrum are separated, and they do not all
hypothesize the same thing. Naming the separations rather than writing each as an explicit
inequality is what makes "these two theorems have the same gap hypothesis" a checkable
claim; it is also what lets a caller discharge the hypothesis once and feed it to several
theorems.

Two notions are primitive and belong here:

- **`SpectraSeparated A U B V δ`** — every eigenvalue of `A` carried by `U` and every
  eigenvalue of `B` carried by `V` are at distance at least `δ`. This is the weakest and
  most symmetric form; it is what the `π/2` theorems assume, and no ordering of the two
  spectra is implied.
- **`OrderedGap`** — one spectrum lies below the other with a margin: `λ + δ ≤ μ` for every
  `λ` in the first and `μ` in the second. Strictly stronger, and the hypothesis under which
  the constants improve to one.

Everything else is a specialization and belongs where it is consumed. The interval/exterior
form — one spectrum in `[a,b]`, the other outside `(a−δ, b+δ)` — the two-block form, and
`InternalGap`, in which both spectra come from one operator, are specified in
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md).

The roadmap therefore asks for:

- the two primitive predicates, each stated for restricted spectra of a symmetric operator
  on a named subspace;
- the conversions between them: ordered separation implies `SpectraSeparated` at the same
  `δ`; spectral inclusion on opposite sides of a cut gives ordered separation; and the
  bridges to the quadratic-form bounds above, which is how a spectral hypothesis becomes
  usable in an operator estimate;
- for each named form, a statement of which theorem families consume it, so that a
  predicate with no consumer is visible as such.

Parallel definitions encoding the same condition under different names are the failure mode
to avoid. If two forms turn out to be equivalent, one of them is a theorem and not a
definition.

**Milestone — the sharp gap identity**, as an equality with no equal-rank hypothesis.

## Worked examples (acceptance criteria)

### Part A — principal angles, aligned bases, and finite frames

**Acceptance examples.** The selected-block family of an orthonormal basis is orthonormal
with span the selected coordinate block, and the `sinThetaSq` of two eigenblock families is
the cross-block overlap sum; `familyIsometry` sends the `k`-th coordinate vector to `v k`.

### Part B — angle geometry and eigenvalue perturbation

**Acceptance examples.** Two unit-generated lines have a single principal cosine `‖⟪u, v⟫‖`;
`principalAngles U U = 0`; the equal-rank operator-norm identity
`‖P_U − P_V‖ = ‖sinThetaMap U V‖`.

### Part C — the projection gap and spectral subspaces

**Acceptance criteria.** That the gap identity is an equality with no equal-rank
hypothesis; that the separation predicates are shared, not parallel definitions with one
name.

## Ordering

Part A comes first and needs only singular values from
[`PolarDecomposition`](../PolarDecomposition/README.md). Part B states its estimates in
Part A's angles and needs the permutation-orbit hull of
[`Majorization`](../Majorization/README.md) for Davis's lower bound. Part C is independent
of both and can proceed in parallel.

**Downstream.** [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md)
consumes the angles, `sinThetaMap`, the separation predicates and `spectralSubspace`.

## Definitions

**D1** `cos Θ(u, v) = σ(overlap operator)` — the principal-angle cosines, sorted decreasingly
and zero-padded.

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
