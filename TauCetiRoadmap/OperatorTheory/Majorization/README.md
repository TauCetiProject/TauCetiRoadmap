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
consumers — square norms in Part A, rectangular norms in Part B — through one interface.

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
  the polar decomposition and its unitary, Courant–Fischer min–max, and the rectangular
  singular-value facts `σ(A⋆) = σ(A)` and `σᵢ(A)² = λᵢ(A⋆A)`. Every Part below consumes
  these; nothing here re-proves them.

## What is missing (build here)

* Weak majorization on `Fin n → ℝ`, the transfer operation, and descent into a symmetric
  convex set — the vector layer, with no operator imports.
* Schur–Horn in Karamata form, and the Ky Fan triangle inequality that makes every Ky Fan
  norm subadditive at once.
* Unitarily invariant seminorms, square and rectangular, with Fan dominance: one
  majorization estimate yielding the operator, Frobenius, Ky Fan and nuclear norms together.
* The orthogonal block sum and its sharp two-sided comparison.

## The build, in layers

The labels in Parts A and B form the complete mathematical obligation set for this roadmap.
Each label names one obligation. Milestones and acceptance examples cite these labels, and
`Suggested.lean` cites the labels represented by its sample declarations.

### Part A — majorization, Schur–Horn, and unitarily invariant norms

#### Convex majorization objects

- **MAJ-A01 — Prefix sums.** For `x : Fin n → ℝ` and `k ≤ n`, define the prefix sum
  `Pₖ(x) = ∑_{i<k} xᵢ`.
- **MAJ-A02 — Weak majorization.** For antitone nonnegative tuples `x,y : Fin n → ℝ`,
  define `x ≺w y` by `Pₖ(x) ≤ Pₖ(y)` for every prefix length `k`.
- **MAJ-A03 — Robin Hood transfer.** Define the elementary transfer that moves a
  nonnegative amount from a larger coordinate to a smaller coordinate while preserving the
  total sum.
- **MAJ-A04 — T-transform relation.** Define the relation recording that one tuple is
  obtained from another by one Robin Hood transfer, together with a coordinate permutation.
- **MAJ-A05 — Symmetric-convex sets.** Define a class of subsets of `Fin n → ℝ` that are
  convex, invariant under coordinate permutations, and invariant under changing the sign of
  one coordinate.
- **MAJ-A06 — Finite symmetric gauges.** Define real-valued gauges on `Fin n → ℝ` that are
  subadditive, absolutely homogeneous, permutation-invariant, and invariant under coordinate
  sign changes.

#### Weak-majorization calculus

- **MAJ-A07 — Prefix sums of sums.** For tuples `x,y`, `Pₖ(x+y) = Pₖ(x) + Pₖ(y)`.
- **MAJ-A08 — Prefix sums under nonnegative scaling.** For `c ≥ 0`,
  `Pₖ(cx) = c Pₖ(x)`.
- **MAJ-A09 — Reflexivity.** Every antitone nonnegative tuple weakly majorizes itself.
- **MAJ-A10 — Transitivity.** If `x ≺w y` and `y ≺w z`, then `x ≺w z`.
- **MAJ-A11 — Additivity.** If `x₁ ≺w y₁` and `x₂ ≺w y₂`, then
  `x₁+x₂ ≺w y₁+y₂` whenever the displayed tuples satisfy the standing antitone and
  nonnegativity conditions.
- **MAJ-A12 — Nonnegative scaling.** If `x ≺w y` and `c ≥ 0`, then `cx ≺w cy`.
- **MAJ-A13 — Zero padding.** Appending zero coordinates to two weakly-majorized tuples
  preserves weak majorization.
- **MAJ-A14 — Progress by one transfer.** If an antitone nonnegative tuple has a prefix sum
  strictly above a target prefix while the preceding prefixes satisfy the target bounds, one
  Robin Hood transfer decreases the excess and preserves the required preceding bounds.
- **MAJ-A15 — Transfer descent.** A symmetric-convex set containing an antitone nonnegative
  tuple `y` contains every antitone nonnegative tuple `z` satisfying `z ≺w y`.
- **MAJ-A16 — Gauge sublevel symmetry and convexity.** Every sublevel set of a finite
  symmetric gauge is symmetric-convex.
- **MAJ-A17 — Gauge monotonicity.** If `x ≺w y`, then every finite symmetric gauge satisfies
  `g(x) ≤ g(y)`.

#### Schur–Horn

- **MAJ-A18 — Schur weight.** For a symmetric endomorphism with orthonormal eigenbasis
  `(vᵢ)` and an arbitrary orthonormal basis `(eₖ)`, define
  `wᵢₖ = |⟪vᵢ,eₖ⟫|²`.
- **MAJ-A19 — Nonnegativity of Schur weights.** Every coefficient `wᵢₖ` is nonnegative.
- **MAJ-A20 — Row sums of Schur weights.** For every `i`, `∑ₖ wᵢₖ = 1`.
- **MAJ-A21 — Column sums of Schur weights.** For every `k`, `∑ᵢ wᵢₖ = 1`.
- **MAJ-A22 — Diagonal as a doubly stochastic image.** If `(λᵢ)` is the eigenvalue tuple
  and `dₖ = Re⟪Teₖ,eₖ⟫`, then `dₖ = ∑ᵢ wᵢₖ λᵢ`.
- **MAJ-A23 — Forward Schur–Horn.** For every convex function `φ` on a set containing the
  spectrum and the diagonal entries, `∑ₖ φ(dₖ) ≤ ∑ᵢ φ(λᵢ)`.
- **MAJ-A24 — Basis independence of the trace.** For every orthonormal basis `(eₖ)`,
  `∑ₖ Re⟪Teₖ,eₖ⟫ = ∑ᵢ λᵢ`.
- **MAJ-A25 — Euclidean contraction of the diagonal.** For every orthonormal basis,
  `∑ₖ (Re⟪Teₖ,eₖ⟫)² ≤ ∑ᵢ λᵢ²`.

#### Ky Fan sums

- **MAJ-A26 — Ky Fan sums.** For a finite-dimensional endomorphism `A`, define
  `Kₖ(A) = ∑_{i<k} σᵢ(A)` from its decreasing zero-padded singular-value sequence.
- **MAJ-A27 — Ky Fan trace inequality.** If `S` is symmetric and `(wᵢ)_{i<k}` is an
  orthonormal family, then `∑_{i<k} Re⟪Swᵢ,wᵢ⟫` is at most the sum of the `k` largest
  eigenvalues of `S`.
- **MAJ-A28 — Ky Fan variational upper bound.** For orthonormal families `(uᵢ)_{i<k}` and
  `(vᵢ)_{i<k}`, `Re(∑_{i<k} ⟪uᵢ,Avᵢ⟫) ≤ Kₖ(A)`.
- **MAJ-A29 — Ky Fan variational achievability.** The first `k` singular pairs attain the
  upper bound in `MAJ-A28`.
- **MAJ-A30 — Singular-value triangle majorization.** The singular-value tuple of `A+B` is
  weakly majorized by the coordinatewise sum of the singular-value tuples of `A` and `B`.
- **MAJ-A31 — Ky Fan triangle inequality.** For every `k`,
  `Kₖ(A+B) ≤ Kₖ(A)+Kₖ(B)`.
- **MAJ-A32 — Unitary invariance of Ky Fan sums.** Two-sided unitary multiplication leaves
  every `Kₖ(A)` unchanged.
- **MAJ-A33 — Adjoint invariance of Ky Fan sums.** For every `k`, `Kₖ(A†)=Kₖ(A)`.
- **MAJ-A34 — Nonnegative-real scaling of Ky Fan sums.** For `c ≥ 0`,
  `Kₖ(cA)=cKₖ(A)`.
- **MAJ-A35 — Bounded-factor singular-value domination.** If `C` has operator norm at most
  `c`, then `σᵢ(CA) ≤ c σᵢ(A)` for every `i`.

#### Diagonal models and square unitarily invariant seminorms

- **MAJ-A36 — Diagonal operator.** For a real tuple `b` and an orthonormal basis `(eᵢ)`,
  define the endomorphism with `eᵢ` as eigenvectors and diagonal entries `bᵢ`.
- **MAJ-A37 — Additivity of diagonal operators.** `diag(b+c) = diag(b)+diag(c)`.
- **MAJ-A38 — Symmetry of real diagonal operators.** For real `b`, `diag(b)` is symmetric.
- **MAJ-A39 — Singular values of a diagonal operator.** The singular-value sequence of
  `diag(b)` is the decreasing zero-padded rearrangement of `(|bᵢ|)`.
- **MAJ-A40 — Singular-value diagonal factorization.** Every finite-dimensional endomorphism
  admits a two-sided unitary factorization through a diagonal operator whose entries are its
  singular values.
- **MAJ-A41 — Square unitarily invariant seminorm.** Define a seminorm on square operators
  by subadditivity, absolute homogeneity, and invariance under independent unitary
  multiplication on the left and right.
- **MAJ-A42 — Gauge representation.** Every square unitarily invariant seminorm is the
  symmetric gauge of the singular-value sequence of its argument.
- **MAJ-A43 — Determination by singular values.** If two square operators have the same
  singular-value sequence, every square unitarily invariant seminorm takes the same value on
  them.
- **MAJ-A44 — Nonnegativity.** Every square unitarily invariant seminorm takes nonnegative
  values.
- **MAJ-A45 — Value at zero.** Every square unitarily invariant seminorm vanishes at the
  zero operator.
- **MAJ-A46 — Adjoint invariance.** Every square unitarily invariant seminorm satisfies
  `N(A†)=N(A)`.
- **MAJ-A47 — Ideal inequality.** If `‖C‖ ≤ c`, then every square unitarily invariant
  seminorm satisfies `N(CA) ≤ c N(A)`.
- **MAJ-A48 — Fan dominance.** If `Kₖ(A) ≤ Kₖ(B)` for every `k`, then every square
  unitarily invariant seminorm satisfies `N(A) ≤ N(B)`.
- **MAJ-A49 — Square Frobenius instance.** The Frobenius functional on square operators is a
  unitarily invariant seminorm in the sense of `MAJ-A41`.

**Milestone — transfer descent.** `MAJ-A01`–`MAJ-A17`.

**Milestone — forward Schur–Horn.** `MAJ-A18`–`MAJ-A25`.

**Milestone — Ky Fan variational theory.** `MAJ-A26`–`MAJ-A35`.

**Milestone — Fan dominance.** `MAJ-A36`–`MAJ-A49`.

### Part B — rectangular unitarily invariant norms

#### Rectangular seminorms and transport

- **MAJ-B01 — Rectangular unitarily invariant seminorm.** Define a seminorm on maps
  `A : E → F` by subadditivity, absolute homogeneity, and invariance under independent
  unitary multiplication on `F` and `E`.
- **MAJ-B02 — Rectangular Ky Fan sums.** For `A : E → F`, define
  `Kₖ(A)=∑_{i<k} σᵢ(A)`.
- **MAJ-B03 — Two-sided unitary orbit.** For `C : E → F`, define the set of operators
  `UCV` as `U` and `V` range over the unitary groups of `F` and `E`.
- **MAJ-B04 — Finite orbit certificate.** Record a finite representation
  `X = ∑ᵢ aᵢ Uᵢ C Vᵢ` together with its coefficient mass `∑ᵢ |aᵢ|`.
- **MAJ-B05 — Nonnegativity.** Every rectangular unitarily invariant seminorm takes
  nonnegative values.
- **MAJ-B06 — Value at zero.** Every rectangular unitarily invariant seminorm vanishes at
  the zero operator.
- **MAJ-B07 — Finite-sum triangle inequality.** For a finite family `(Aᵢ)`,
  `N(∑ᵢ Aᵢ) ≤ ∑ᵢ N(Aᵢ)`.
- **MAJ-B08 — Domain-isometry transport.** Transporting the domain through a linear
  isometric equivalence preserves every rectangular unitarily invariant seminorm.
- **MAJ-B09 — Codomain-isometry transport.** Transporting the codomain through a linear
  isometric equivalence preserves every rectangular unitarily invariant seminorm.
- **MAJ-B10 — Zero-extension singular values.** Extending a rectangular operator by zero
  to the canonical square `L²` product preserves its complete singular-value sequence.
- **MAJ-B11 — Adjoint transport.** Passing to the adjoint preserves the singular-value
  sequence and transports rectangular unitarily invariant seminorms between the reversed
  domain and codomain.
- **MAJ-B12 — Restriction to square operators.** A rectangular unitarily invariant seminorm
  with equal domain and codomain restricts to a square unitarily invariant seminorm.
- **MAJ-B13 — Square seminorm viewed through the rectangular interface.** Every square
  unitarily invariant seminorm on `E → E` defines a rectangular unitarily invariant
  seminorm on the same carrier, with identical values.

#### Orbit-hull machinery

- **MAJ-B14 — Certificates from convex combinations.** Every finite convex combination of
  the two-sided unitary orbit of `C` yields an orbit certificate of coefficient mass one.
- **MAJ-B15 — Reindexing certificates.** Finite orbit certificates are preserved under
  finite reindexing of their summands.
- **MAJ-B16 — Certificate norm bound.** If `X` has an orbit certificate over `C` of mass
  `m`, then every rectangular unitarily invariant seminorm satisfies `N(X) ≤ mN(C)`.
- **MAJ-B17 — Rectangular singular-value factorization.** Every finite-dimensional
  rectangular operator admits a factorization through a coordinate diagonal whose entries
  are its singular values, with linear isometric equivalences on the domain and codomain.
- **MAJ-B18 — Two-sided factorization from equal singular values.** If two maps
  `A,B : E → F` have the same singular-value sequence, then there are unitary equivalences
  `U : F ≃ F` and `V : E ≃ E` such that `A = UBV`.
- **MAJ-B19 — Determination by singular values.** Every rectangular unitarily invariant
  seminorm is determined by the singular-value sequence.
- **MAJ-B20 — Orbit-hull characterization of Ky Fan domination.** If
  `Kₖ(A) ≤ Kₖ(C)` for every `k`, then `A` belongs to the convex hull of the two-sided unitary
  orbit of `C`.
- **MAJ-B21 — Rectangular Fan dominance.** If `Kₖ(A) ≤ Kₖ(C)` for every `k`, then every
  rectangular unitarily invariant seminorm satisfies `N(A) ≤ N(C)`.

#### Orthogonal block sums

- **MAJ-B22 — Orthogonal block sum.** For `A : E₁ → F₁` and `B : E₂ → F₂`, define the
  block-diagonal operator `A ⊕ B` on the Hilbert `L²` products.
- **MAJ-B23 — Componentwise action.** `(A ⊕ B)(x,y) = (Ax,By)`.
- **MAJ-B24 — Adjoint of a block sum.** `(A ⊕ B)† = A† ⊕ B†`.
- **MAJ-B25 — Composition of block sums.** Whenever the compositions are typed,
  `(A₁ ⊕ B₁)(A₂ ⊕ B₂) = A₁A₂ ⊕ B₁B₂`.
- **MAJ-B26 — Singular values of a doubled block.** The singular values of `A ⊕ A` are the
  singular values of `A`, each repeated twice in decreasing order.
- **MAJ-B27 — Ky Fan sums of a doubled block.** For every `k`,
  `K_{2k}(A ⊕ A) = 2Kₖ(A)`.
- **MAJ-B28 — Block-sum orbit-hull stability.** If `A` lies in the two-sided unitary orbit
  hull of `C` and `B` lies in the two-sided unitary orbit hull of `D`, then `A ⊕ B` lies in
  the two-sided unitary orbit hull of `C ⊕ D`.
- **MAJ-B29 — Sharp block-sum norm comparison.** If `Kₖ(A) ≤ Kₖ(C)` and
  `Kₖ(B) ≤ Kₖ(D)` for every `k`, then every rectangular unitarily invariant seminorm
  satisfies `N(A ⊕ B) ≤ N(C ⊕ D)`.

#### Concrete rectangular seminorms

- **MAJ-B30 — Operator-norm instance.** The operator norm defines a rectangular unitarily
  invariant seminorm.
- **MAJ-B31 — Frobenius instance.** The Frobenius functional defines a rectangular
  unitarily invariant seminorm.
- **MAJ-B32 — Ky Fan instances.** For every `k`, the Ky Fan `k`-sum defines a rectangular
  unitarily invariant seminorm.
- **MAJ-B33 — Nuclear-norm instance.** The sum of all singular values defines a rectangular
  unitarily invariant seminorm.
- **MAJ-B34 — Frobenius basis formula.** For every orthonormal basis `(bᵢ)` of the domain,
  `F(A) = √(∑ᵢ ‖Abᵢ‖²)`.
- **MAJ-B35 — Basis independence of Frobenius.** The value in `MAJ-B34` is independent of
  the chosen orthonormal basis.
- **MAJ-B36 — Frobenius singular-value formula.** `F(A) = √(∑ᵢ σᵢ(A)²)`.
- **MAJ-B37 — Nuclear singular-value formula.** `N₁(A) = ∑ᵢ σᵢ(A)`.
- **MAJ-B38 — Nuclear-to-Frobenius bound.** For `A : E → F`,
  `N₁(A) ≤ √(dim E) F(A)`.
- **MAJ-B39 — Square Frobenius bridge.** Restricting the rectangular Frobenius seminorm to
  square operators gives the square Frobenius seminorm of Part A.

#### Two-dimensional sharpness models

- **MAJ-B40 — Diagonal planar model.** If `s₀ ≥ s₁ ≥ 0`, the singular-value sequence of
  the planar diagonal operator `diag(s₀,s₁)` is `(s₀,s₁,0,0,…)`.
- **MAJ-B41 — Symmetric off-diagonal planar model.** The singular-value sequence of
  `[[0,r],[r,0]]` is `(|r|,|r|,0,0,…)`.
- **MAJ-B42 — One-sided triangular planar model.** The singular-value sequence of
  `[[0,0],[r,0]]` is `(|r|,0,0,…)`.
- **MAJ-B43 — Trace-determinant recovery in dimension two.** For `A : 𝕜² → F`, the two
  squared singular values have sum `tr(A†A)` and product `det(A†A)`; a nonnegative ordered
  pair is determined by these two values.

**Milestone — rectangular orbit-hull majorization.** `MAJ-B14`–`MAJ-B20`.

**Milestone — rectangular Fan dominance.** `MAJ-B21`.

**Milestone — orthogonal block sums.** `MAJ-B22`–`MAJ-B29`.

**Milestone — concrete rectangular seminorms.** `MAJ-B30`–`MAJ-B39`.

**Milestone — planar sharpness models.** `MAJ-B40`–`MAJ-B43`.

## Worked examples (acceptance criteria)

### Part A — majorization, Schur–Horn, and unitarily invariant norms

**Acceptance examples.** Trace basis independence is `MAJ-A24`; the quadratic Schur–Horn
instance is `MAJ-A25`; the square Frobenius instance is `MAJ-A49`, with its singular-value
formula supplied by `MAJ-B36`.

### Part B — rectangular unitarily invariant norms

**Acceptance examples.** The four concrete seminorms are `MAJ-B30`–`MAJ-B33`; zero-extension
transport is `MAJ-B10`; the square/rectangular bridges are `MAJ-B12`, `MAJ-B13`, and
`MAJ-B39`.

## Ordering

Part A's convex engine has no prerequisites at all and could be submitted before, or
independently of, everything else here. The operator half of Part A consumes
`PolarDecomposition` for singular-value/polar structure and `OrthogonalGeometry` for the
Gram/isometry rigidity used by the rectangular orbit arguments. Part B consumes Part A.

**Downstream.** [`PrincipalAngles`](../PrincipalAngles/README.md) states its estimates in
this vocabulary and consumes the permutation-orbit hull for Davis's bound.
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) consumes the
seminorm structures with Fan dominance, and is where the estimates lifted by Part B are
stated. [`OperatorIdeals`](../OperatorIdeals/README.md) consumes Part A for the Ky Fan
triangle inequality that seeds its symmetric-gauge layer, and identifies its `S₂` norm with
the Frobenius seminorm owned here.

## Definitions

**D1 (`MAJ-B34`–`MAJ-B35`).** `F(A) = √(∑ᵢ ‖A bᵢ‖²)` over an orthonormal basis `(bᵢ)` of the domain — the
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

## Acknowledgements

An Apache-2.0 implementation of both Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.). The public API and proof structure may change during integration.

The Schur–Horn proof strategy was read from and is credited to
[`rjwalters/lean-genius`](https://github.com/rjwalters/lean-genius),
`proofs/Proofs/SchurHornMajorization.lean` (commit `3e09c97`, retrieved 2026-07-04; no
licence declared upstream), and was re-derived on this development's own foundations.
