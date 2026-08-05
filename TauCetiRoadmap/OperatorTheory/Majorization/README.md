# Majorization and unitarily invariant norms

The classical perturbation theorems size a perturbation in a **unitarily invariant norm**,
and that theory stands on **majorization**: the partial order on real tuples under which
every symmetric gauge is monotone.

Mathlib has the static layer — the spectral theorem, singular values, adjoints, orthogonal
projections, Birkhoff's theorem — but none of the order-theoretic layer: no majorization
predicate, no **Schur–Horn** theorem (its absence is noted in a comment in
`Mathlib/Analysis/InnerProductSpace/Spectrum.lean`), no Ky Fan sums, and no unitarily
invariant norms.

**The majorization engine is convex analysis: it belongs under `Analysis/Convex` and imports
no operator theory.** Weak majorization is a statement about real tuples, and it serves two
consumers — square norms in Part A, rectangular norms in Part C — through one interface.

Suggested home: `TauCeti/Analysis/Convex/Majorization.lean` for the engine;
`TauCeti/Analysis/InnerProductSpace/` for everything else.

## Standing conventions

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
  sublevel sets.
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
  permutation-orbit convex hull, not through Part A's majorization engine — the
  permutation-orbit hull is exactly what Birkhoff gives, and no vector-majorization API is
  needed. Hoffman–Wielandt factors through the **von Neumann trace inequality**, whose
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
- **Convexity:** `ConvexOn` and Jensen (`ConvexOn.map_sum_le`) for Schur–Horn; `convexHull`
  and `mem_convexHull_iff_exists_fintype`; **Birkhoff**
  (`doublyStochastic_eq_convexHull_permMatrix`) for the eigenvalue-change bound; the
  **rearrangement inequality** (`MonovaryOn.sum_comp_perm_smul_le_sum_smul`) as the core of
  von Neumann.
- **Geometry:** `EuclideanSpace`, `OrthonormalBasis`, `Orthonormal`, `LinearIsometry` /
  `LinearIsometryEquiv`, `Submodule.orthogonal`; `Real.arcsin` and `Real.tan` for the angle
  sequences.
- **From [`PolarDecomposition`](../PolarDecomposition/README.md)**,
  an explicit dependency and not Mathlib: the positive square root and operator modulus,
  the polar decomposition and its unitary, Courant–Fischer min–max, the rectangular
  singular-value facts `σ(A⋆) = σ(A)` and `σᵢ(A)² = λᵢ(A⋆A)`, and the projection and
  spectral-subspace API. Every Part below consumes these; nothing here re-proves them.

## What is missing (build here)

* Weak majorization on `Fin n → ℝ`, the transfer operation, and descent into a symmetric
  convex set — the vector layer, with no operator imports.
* Schur–Horn in Karamata form, and the Ky Fan triangle inequality that makes every Ky Fan
  norm subadditive at once.
* Unitarily invariant seminorms, square and rectangular, with Fan dominance: one
  majorization estimate yielding the operator, Frobenius, Ky Fan and nuclear norms together.
* The orthogonal block sum and its sharp two-sided comparison.

## The build, in layers

### Part A — majorization, Schur–Horn, and unitarily invariant norms

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
- **Gram-perturbation groundwork.**
  - `‖A⋆y‖ ≤ c‖y‖` from an elementwise bound on `A`.
  - The splitting `Â⋆Â − A⋆A = Â⋆(Â−A) + (Â−A)⋆A`, giving `‖(Â⋆Â − A⋆A)x‖ ≤ (a+â)ε‖x‖` and
    the squared singular-value perturbation `|σₖ(Â)² − σₖ(A)²| ≤ (a+â)ε`.
  - Here for one consumer — the Yu–Wang–Samworth singular-vector bound of
    [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) applies the
    symmetric perturbation theory to `A⋆A` — and not a step in the majorization pipeline.
  - Deliberately **not** called "Weyl's inequality": it bounds squares, carries the factor
    `a + â`, and is implied by but does not imply the sharp `|σₙ(T) − σₙ(S)| ≤ ‖T − S‖`,
    which belongs to [`OperatorIdeals`](../OperatorIdeals/README.md).

**Milestone — the transfer descent.** A symmetric-convex set containing `y` contains every
antitone nonnegative `z` whose prefix sums it dominates. This is the engine, and it must
land in `Analysis/Convex` with no operator imports.

**Milestone — forward Schur–Horn, in Karamata form**, for a symmetric operator, an
arbitrary orthonormal basis, and any convex `φ` on a set containing the spectrum.

**Milestone — Fan dominance.** Ky Fan domination implies domination in every unitarily
invariant norm.

### Part B — rectangular unitarily invariant norms

This Part exists for one composite theorem: Ky Fan domination implies membership in the
convex hull of the two-sided unitary orbit, which implies domination in *every* rectangular
unitarily invariant norm. The Davis–Kahan estimates of
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) are proved once, as Ky Fan
dominations, and this Part turns each such proof into a statement about the operator norm,
the Frobenius norm, every Ky Fan norm, and the nuclear norm.

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
  preserves the sharp constants in [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md).
- The concrete instances — operator, Frobenius, Ky Fan `k`, nuclear — with their identities
  `frobenius A = √(∑ σᵢ²)`, `nuclear A = ∑ σᵢ`, `nuclear ≤ √(finrank) · frobenius`.
- The rectangular `frobenius` is the owner of the Frobenius seminorm for the whole family.
  The square Frobenius seminorm is its restriction along `toSquare`, not a second
  construction; [`OperatorIdeals`](../OperatorIdeals/README.md) identifies the Schatten `S₂`
  norm and the finite-dimensional Hilbert–Schmidt energy against it.
- Two-dimensional sharpness models: the singular values of `2 × 2` diagonal, off-diagonal
  and triangular models, and the trace/determinant characterization — the witnesses for the
  sharpness claims of [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md).

**Milestone — orbit-hull majorization and rectangular Fan dominance**, the pair whose
composite is quoted throughout [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) and
[`OperatorIdeals`](../OperatorIdeals/README.md). The majorization half pulls back along a diagonal
lift to a symmetric-convex set of coordinate vectors — coordinate swaps and single sign
changes *are* two-sided unitary actions — so Part A's transfer descent applies directly;
what remains here is the operator-theoretic half: the lift, the extension of coordinate
unitaries, and the SVD transport.

## Worked examples (acceptance criteria)

### Part A — majorization, Schur–Horn, and unitarily invariant norms

**Acceptance examples.** Basis independence of the trace (the equality case of Schur
majorization, no convexity needed); the `φ = (·)²` instance, that the diagonal is
Euclidean-shorter than the spectrum; the Frobenius norm satisfies the three laws and
`frobenius A = √(∑ σᵢ(A)²)` in every orthonormal basis.

### Part B — rectangular unitarily invariant norms

**Acceptance examples.** The four instances satisfy the three laws with everything else
derived; `σ(zeroExtension A) = σ(A)`; a square norm read through the rectangular bridge
agrees with itself on square operators.

## Ordering

Part A's convex engine has no prerequisites at all and could be submitted before, or
independently of, everything else here. The operator half of Part A needs
`PolarDecomposition`; Part B needs A, both the engine and the square structure it bridges
to.

**Downstream.** [`PrincipalAngles`](../PrincipalAngles/README.md) states its estimates in
this vocabulary and consumes the permutation-orbit hull for Davis's bound.
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) consumes the
seminorm structures with Fan dominance, and is where the estimates lifted by Part B are
stated. [`OperatorIdeals`](../OperatorIdeals/README.md) consumes Part A for the Ky Fan
triangle inequality that seeds its symmetric-gauge layer, and identifies its `S₂` norm with
the Frobenius seminorm owned here.

## Definitions

**D1** `frobenius A = √(∑ᵢ ‖A bᵢ‖²)` over an orthonormal basis of the domain — the
rectangular Frobenius seminorm, independent of the basis.

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

## Acknowledgements

An Apache-2.0 implementation of both Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.). The public API and proof structure may change during integration.

The Schur–Horn proof strategy was read from and is credited to
[`rjwalters/lean-genius`](https://github.com/rjwalters/lean-genius),
`proofs/Proofs/SchurHornMajorization.lean` (commit `3e09c97`, retrieved 2026-07-04; no
licence declared upstream), and was re-derived on this development's own foundations.
