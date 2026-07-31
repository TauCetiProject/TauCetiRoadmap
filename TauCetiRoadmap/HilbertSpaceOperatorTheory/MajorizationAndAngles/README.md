# Majorization, unitarily invariant norms, and the geometry of principal angles

How far does an eigenvector rotate when its operator is perturbed? The classical answers —
Davis–Kahan, Hoffman–Wielandt, Yu–Wang–Samworth — measure the rotation in **principal
angles** between subspaces and size the perturbation in a **unitarily invariant norm**, and
both of those theories stand on **majorization**: the partial order on real tuples under
which every symmetric gauge is monotone.

Mathlib has the static layer — the spectral theorem, singular values, adjoints, orthogonal
projections, Birkhoff's theorem — but none of the order-theoretic or geometric layer: no
majorization predicate, no **Schur–Horn** theorem (its absence is noted in a comment in
`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`), no Ky Fan sums, no unitarily invariant
norms, no principal angles, no **Hoffman–Wielandt**.

This roadmap builds that layer as one body of mathematics, because it is one: the norm
theory and the subspace geometry interleave rather than stack. The four Parts below are
strictly layered, with the geometry of Part B sitting *between* the square norm theory of
Part A and the rectangular norm theory of Part C, and Part D consuming all three. Splitting
the norms from the angles would sever the dependencies in both directions.

One boundary is absolute, and it is this roadmap's central architectural claim: **the
majorization engine is convex analysis and imports no operator theory at all.** Weak
majorization is a statement about real tuples; it belongs under `Analysis/Convex`, and
everything operator-theoretic here consumes it through exactly one interface. A
majorization file that quietly depends on a Hilbert space cannot serve the two consumers it
has — square norms in Part A, rectangular norms in Part C — and loses its independent value
to convex analysis.

The goal is to build the reusable theory of these objects, not to race to the named
inequalities. The bar for done: a researcher in matrix analysis or statistics finds weak
majorization, symmetric gauges, Ky Fan sums, unitarily invariant norms square and
rectangular, principal angles (family-level and subspace-level, with the bridge between
them proved), and the eigenvalue-perturbation inequalities, each with its basic API —
closure properties, invariances, the variational characterizations — so that Fan dominance,
Schur–Horn, Hoffman–Wielandt and Davis's eigenvalue-change bound are consequences of a
developed theory.

Suggested home: `TauCeti/Analysis/Convex/Majorization.lean` for the engine;
`TauCeti/Analysis/InnerProductSpace/` for everything else.

## Generality bar

Decide these up front; do not silently specialize.

- **Setting.** Finite-dimensional inner product spaces over `[RCLike 𝕜]`, so `ℝ` and `ℂ`
  uniformly; operators as `E →ₗ[𝕜] F`, with `toContinuousLinearMap` appearing only where
  the operator norm itself is quoted. Sorted spectral data are finitely supported sequences
  `ℕ →₀ ℝ`, decreasing and zero-padded, matching Mathlib's `LinearMap.singularValues`.
- **The engine is convex analysis.** Weak majorization, T-transforms, and the
  Hardy–Littlewood–Pólya transfer descent are stated for `Fin n → ℝ` and live under
  `Analysis/Convex`. That file must not import inner-product theory.
- **Weak majorization is for presented data.** `WeaklyMajorized x y` assumes both tuples
  antitone and nonnegative and compares prefix sums; no total-sum equality is ever assumed,
  and the descent uses no separation theorem, no Birkhoff decomposition, and no
  majorization completion — one convexity application and one closure property per step.
  The descent is stated for a **symmetric-convex set** (convex, transposition-closed,
  closed under single-coordinate sign flips), and the gauge form is read off through
  sublevel sets rather than re-proved.
- **Schur–Horn is stated for an arbitrary orthonormal basis**, in convex (Karamata) form
  `∑ₖ φ(dₖ) ≤ ∑ᵢ φ(λᵢ)` for every convex `φ`. In the eigenbasis the theorem is vacuous,
  since there the diagonal *is* the spectrum. The mechanism is the doubly stochastic weight
  matrix `schurWeight i k = ‖⟪vᵢ, eₖ⟫‖²`, whose row and column sums are each proved to be
  one.
- **The Ky Fan trace inequality is stated for orthonormal families** `w : Fin k → E`, not
  for subspaces or projections: the perturbation arguments build the family from singular
  vectors, and the family form is what they can apply.
- **Seminorm structures carry exactly three laws**: subadditivity, absolute homogeneity,
  two-sided unitary invariance. Positivity, vanishing at zero, adjoint invariance and the
  ideal property are derived, never assumed; definiteness is deliberately not required, so
  everything holds at the seminorm level and a consumer supplying a norm has three
  obligations rather than six.
- **Ky Fan domination is the single mechanism.** Every "for every unitarily invariant norm"
  statement is proved once, as a Ky Fan-sum domination, and converted by Fan dominance; the
  rectangular form factors through convex-hull membership in the two-sided unitary orbit.
  No inequality is proved per-norm.
- **"Rectangular" means two independent isometry groups.** A rectangular unitarily
  invariant norm on `E →ₗ[𝕜] F` is invariant under `U ∘ A ∘ V` for independent unitaries on
  `F` and `E`; the square theory is the diagonal case, with explicit bridges rather than a
  subsumption.
- **Principal-angle cosines are singular values of the overlap operator** `⟪uᵢ, vⱼ⟫`, not
  the textbook variational recursion. Nonnegativity, `≤ 1`, decreasing order, and symmetry
  in `u, v` are then inherited from the singular-value API — the last because the overlap
  operators of the swapped pair are adjoint. The recursion should be *absent*, not hidden,
  or the definitional choice is not paying.
- **Families first, subspaces later, and the bridge is a Part D target.** Part B's
  `cosPrincipalAngles hu hv` is indexed by orthonormal families, so as stated it is an
  invariant of the chosen families. Part D defines `principalCosines U V` for submodules as
  the singular values of `P_V P_U` and proves the two agree on spans — the statement that
  the family invariant depends only on the spans. The bridge lives in Part D because it
  needs the projector dictionary built there, and a reviewer of Part B alone should know
  that its name is justified one Part later.
- **Directed sines are not symmetric.** `principalSines U V` are the singular values of
  `P_{Vᗮ} P_U`; symmetry of the sines and of the angles holds under an equal-rank
  hypothesis, which matches the multiplicities of the quarter-turn defect directions, and
  is a theorem rather than a convention. Angles are `arcsin` of the sines, keeping the
  support finite.
- **Two proof routes into eigenvalue perturbation, chosen deliberately.** Davis's
  eigenvalue-change bound goes through **Birkhoff's theorem** (already in Mathlib) and a
  permutation-orbit convex hull, not through Part A's majorization engine — the
  permutation-orbit hull is exactly what Birkhoff gives, and no vector-majorization API is
  needed. Hoffman–Wielandt factors through the **von Neumann trace inequality**, whose
  sorted rearrangement core is proved here from Mathlib's rearrangement inequality rather
  than cited.
- **The trial-map factorization carries no spectral gap.** The isometric range
  factorization of an injective map (Part D) is stated free of any gap or perturbation
  hypothesis, so anything needing a trial map factored can reuse it.

## What Mathlib already has

- **Spectral theory:** `LinearMap.IsSymmetric.eigenvalues` / `eigenvectorBasis` and
  `LinearMap.singularValues : ℕ →₀ ℝ`, with `LinearMap.adjoint` and
  `Submodule.starProjection`. All sorted data here are stated against these, never against
  a private ordering.
- **Convexity:** `ConvexOn` and Jensen (`ConvexOn.map_sum_le`) for Schur–Horn; `convexHull`
  and `mem_convexHull_iff_exists_fintype`; **Birkhoff**
  (`doublyStochastic_eq_convexHull_permMatrix`) for the eigenvalue-change bound; the
  **rearrangement inequality** (`MonovaryOn.sum_comp_perm_smul_le_sum_smul`) as the core of
  von Neumann.
- **Geometry:** `EuclideanSpace`, `OrthonormalBasis`, `Orthonormal`, `LinearIsometry` /
  `LinearIsometryEquiv`, `Submodule.orthogonal`; `Real.arcsin` and `Real.tan` for the angle
  sequences.
- **From [`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md)**,
  an explicit dependency and not Mathlib: the positive square root and operator modulus,
  the polar decomposition and its unitary, Courant–Fischer min–max, the rectangular
  singular-value facts `σ(A⋆) = σ(A)` and `σᵢ(A)² = λᵢ(A⋆A)`, and the projection and
  spectral-subspace API. Every Part below consumes these; nothing here re-proves them.

Before implementing, search the Lean Zulip and the open Mathlib pull requests: majorization
and doubly stochastic matrices are an area with recurring activity, and a landing
majorization API should be followed rather than duplicated.

## Part A — majorization, Schur–Horn, and unitarily invariant norms

**Objects.** `prefixSum` and `WeaklyMajorized` on `Fin n → ℝ`; the elementary `transfer`
(Robin Hood move) and `IsTTransform`; `IsSymmetricConvex` sets and `FiniteSymmetricGauge`
(subadditive, absolutely homogeneous, permutation- and sign-flip-invariant functions). Then,
on operators: the Schur weight matrix `schurWeight`; the Ky Fan sums
`kyFanSum k A = ∑_{i<k} σᵢ(A)`; the diagonal operator `diagOp b x` of a real tuple in an
orthonormal basis; and the three-law structure `UnitarilyInvariantSeminorm 𝕜 E`.

**API to develop.**

- Prefix-sum algebra; `WeaklyMajorized` reflexive, transitive, additive, closed under
  nonnegative scaling and zero-padding; the transfer lemma (a single T-transform makes
  progress) and the **transfer descent** into any symmetric-convex set; every gauge sublevel
  set is symmetric-convex, giving gauge monotonicity under weak majorization.
- `schurWeight` nonnegative with row and column sums one; the diagonal of a symmetric
  operator as the doubly stochastic image of its spectrum.
- The Ky Fan trace inequality (family form) and the **Ky Fan variational principle** — upper
  bound and achievability at the singular pairs — hence `σ(A+B) ≺w σ(A)+σ(B)`, the triangle
  inequality for all Ky Fan norms simultaneously; unitary and adjoint invariance;
  nonnegative-real scaling; the bounded-factor domination `σᵢ(C∘A) ≤ c·σᵢ(A)`.
- `diagOp` algebra (additive, symmetric, its singular values); the SVD factorization of an
  operator through a diagonal one; the **gauge representation** `N A = gauge(σ(A))`, so a
  unitarily invariant seminorm is determined by the singular-value sequence; derived `nonneg`,
  `apply_zero`, `apply_adjoint`, and the ideal property `N (C ∘ₗ X) ≤ c · N X`; the
  Frobenius norm as the first instance.
- Gram-perturbation groundwork: `‖A⋆y‖ ≤ c‖y‖` from an elementwise bound on `A`; the
  splitting `Â⋆Â − A⋆A = Â⋆(Â−A) + (Â−A)⋆A` giving `‖(Â⋆Â − A⋆A)x‖ ≤ (a+â)ε‖x‖` and the
  squared singular-value perturbation `|σₖ(Â)² − σₖ(A)²| ≤ (a+â)ε`. This block is here for
  one downstream consumer — the Yu–Wang–Samworth singular-vector bound applies the symmetric
  perturbation theory to `A⋆A` — and it is not a step in the majorization pipeline. It is
  deliberately not called "Weyl's inequality": it bounds squares, carries the factor
  `a + â`, and is implied by but does not imply the sharp `|σₙ(T) − σₙ(S)| ≤ ‖T − S‖`, which
  belongs to [`OperatorIdeals`](../OperatorIdeals/README.md).

**Milestone — the transfer descent.** A symmetric-convex set containing `y` contains every
antitone nonnegative `z` whose prefix sums it dominates. This is the engine, and it must
land in `Analysis/Convex` with no operator imports.

**Milestone — forward Schur–Horn, in Karamata form**, for a symmetric operator, an
arbitrary orthonormal basis, and any convex `φ` on a set containing the spectrum.

**Milestone — Fan dominance.** Ky Fan domination implies domination in every unitarily
invariant norm.

**Acceptance examples.** Basis independence of the trace (the equality case of Schur
majorization, no convexity needed); the `φ = (·)²` instance, that the diagonal is
Euclidean-shorter than the spectrum; the Frobenius norm satisfies the three laws and
`frobenius A = √(∑ σᵢ(A)²)` in every orthonormal basis.

## Part B — principal angles, aligned bases, and finite frames

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
are actually proved.

**Milestone — the aligned-basis (Procrustes) bound.** The polar unitary of the overlap
operator rotates `v` into a basis `w` of its span with `∑ⱼ ‖wⱼ − uⱼ‖² ≤ 2 · sinThetaSq hu hv`
— the form the statistical perturbation theory consumes.

**Acceptance examples.** The selected-block family of an orthonormal basis is orthonormal
with span the selected coordinate block, and the `sinThetaSq` of two eigenblock families is
the cross-block overlap sum; `familyIsometry` sends the `k`-th coordinate vector to `v k`.

## Part C — rectangular unitarily invariant norms

This Part exists for one composite theorem: Ky Fan domination implies membership in the
convex hull of the two-sided unitary orbit, which implies domination in *every* rectangular
unitarily invariant norm. The perturbation estimates downstream are proved once, as Ky Fan
dominations, and this Part turns each such proof into a statement about the operator norm,
the Frobenius norm, every Ky Fan norm, the nuclear norm, and any norm a reader supplies.

**Objects.** The three-law structure `RectangularUnitarilyInvariantSeminorm 𝕜 E F`; the
rectangular Ky Fan sums; the **two-sided unitary orbit** and finite orbit certificates (a
finite combination `X = ∑ aᵢ • Uᵢ ∘ C ∘ Vᵢ` with coefficient mass tracked); the orthogonal
**block sum** on Hilbert `L²` products; the planar sharpness models of two-dimensional
singular-value theory.

**API to develop.**

- Derived seminorm facts (`nonneg`, `apply_zero`, finite `sum_le`); transport along
  isometries of domain and codomain; zero extension and adjoint transport; the bridges to
  and from Part A's square structure.
- Orbit machinery: certificates from finite convex combinations, reindexing, the certificate
  norm bound `N X ≤ mass · N C`; the rectangular SVD factorization through a coordinate
  diagonal, so that equal singular values give a two-sided unitary factorization and a
  rectangular norm is determined by the singular-value sequence.
- Block sums: componentwise action, adjoint, composition; doubling a map interleaves its
  singular values; Ky Fan sums and orbit-hull membership for block sums. This is how the
  two directed sine blocks are assembled *without* a triangle inequality, which is what
  preserves the sharp constants downstream.
- The concrete instances — operator, Frobenius, Ky Fan `k`, nuclear — with their identities
  `frobenius A = √(∑ σᵢ²)`, `nuclear A = ∑ σᵢ`, `nuclear ≤ √(finrank) · frobenius`.
- Two-dimensional sharpness models: the singular values of `2 × 2` diagonal, off-diagonal
  and triangular models, and the trace/determinant characterization — the witnesses for the
  sharpness claims downstream.

**Milestone — orbit-hull majorization and rectangular Fan dominance**, the pair whose
composite is quoted everywhere downstream. The majorization half pulls back along a diagonal
lift to a symmetric-convex set of coordinate vectors — coordinate swaps and single sign
changes *are* two-sided unitary actions — so Part A's transfer descent applies directly;
what remains here is the operator-theoretic half: the lift, the extension of coordinate
unitaries, and the SVD transport.

**Acceptance examples.** The four instances satisfy the three laws with everything else
derived; `σ(zeroExtension A) = σ(A)`; a square norm read through the rectangular bridge
agrees with itself on square operators.

## Part D — angle geometry and eigenvalue perturbation

Two things a reader might expect to be separate, kept together because they are the same
step of the Davis–Kahan argument: the **angle dictionary** — cosine, sine, angle and tangent
objects for a pair of subspaces, each with a singular-value and a projector description —
and **eigenvalue perturbation**, how far the spectrum moves when the operator does. The
subspace-perturbation theorems consume both in the same breath.

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
- The dictionary: `σ(cosThetaMap) = principalCosines`; `σ(P_U − P_V) = σ(sinAngleOperator)`,
  hence the norm bridge `N (P_U − P_V) = N (sinAngleOperator U V)` for every unitarily
  invariant `N`, via Part A's determination by singular values; equal-rank symmetry of sines
  and angles; angles of a pair with itself vanish; acuteness from a projection gap `< 1`.
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
with membership discharged from Birkhoff and not from Part A's engine.

**Acceptance examples.** Two unit-generated lines have a single principal cosine `‖⟪u, v⟫‖`;
`principalAngles U U = 0`; the equal-rank operator-norm identity
`‖P_U − P_V‖ = ‖sinThetaMap U V‖`.

## Dependency ordering

Part A's convex engine has no prerequisites at all and could be submitted before, or
independently of, everything else here. The operator half of Part A needs
`HilbertSpaceOperatorFoundations`; Part B needs the same, and states its norms in Part A's
vocabulary; Part C needs A (the engine and the square structure it bridges to) and B (the
geometry its estimates are stated in); Part D needs everything — the angles from B, the
norms they are measured in from A and C, and the projection and polar machinery from the
foundations. Within Part D, the frame factorization is independent of the perturbation
results and portable early.

One duplication to resolve at implementation time: determination of a unitarily invariant
norm by the singular-value sequence is specified once, in Part A. Part D consumes it and
must not restate it.

## References

- R. Bhatia, *Matrix Analysis* (GTM 169, 1997), Chapters II–IV — majorization, symmetric
  gauge functions, Ky Fan dominance (Theorem IV.2.2), unitarily invariant norms.
- A. W. Marshall, I. Olkin, B. C. Arnold, *Inequalities: Theory of Majorization and Its
  Applications* (2nd ed., 2011), Theorem 9.B.1 — Schur–Horn.
- I. Schur, *Über eine Klasse von Mittelbildungen…*, Sitzungsber. Berl. Math. Ges. **22**
  (1923); K. Fan, *On a theorem of Weyl concerning eigenvalues of linear transformations I*,
  Proc. Nat. Acad. Sci. USA **35** (1949); L. Mirsky, *Symmetric gauge functions and
  unitarily invariant norms*, Quart. J. Math. Oxford **11** (1960).
- Å. Björck, G. Golub, *Numerical methods for computing angles between linear subspaces*,
  Math. Comp. **27** (1973) — principal angles via singular values.
- A. J. Hoffman, H. W. Wielandt, *The variation of the spectrum of a normal matrix*, Duke
  Math. J. **20** (1953); C. Davis, *The rotation of eigenvectors by a perturbation*,
  J. Math. Anal. Appl. **6** (1963), Theorem 4.1.
- Y. Yu, T. Wang, R. J. Samworth, *A useful variant of the Davis–Kahan theorem for
  statisticians*, Biometrika **102** (2015) — the aligned-basis bound.

## Provenance

A substantial implementation of all four Parts exists in the AIQ DKPS formalization
(Kitware, Inc., Apache-2.0). It establishes feasibility and provides source provenance for
integration, but this roadmap specifies the desired mathematics intrinsically and does not
prescribe the donor API or proof architecture.

The Schur–Horn proof strategy was read from and is credited to
[`rjwalters/lean-genius`](https://github.com/rjwalters/lean-genius),
`proofs/Proofs/SchurHornMajorization.lean` (commit `3e09c97`, retrieved 2026-07-04; no
licence declared upstream), and was re-derived on this development's own foundations.
Coordinate with that author before reusing any of it.
