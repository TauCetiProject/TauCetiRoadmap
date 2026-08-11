# Majorization and unitarily invariant norms

## Introduction

Majorization connects convex geometry with spectral inequalities. Weak majorization compares
nonnegative decreasing tuples by their prefix sums. Elementary transfers generate the associated
convex order, and symmetric gauges are monotone for that order. Schur–Horn connects eigenvalues to
diagonal data, while Ky Fan sums connect singular-value prefix inequalities to operator seminorms.
Together these statements give a common route from spectral inequalities to unitarily invariant
norm inequalities.

The roadmap separates the convex engine from its operator-theoretic consumers. Part A develops
weak majorization, Schur–Horn, Ky Fan variational theory, and square unitarily invariant seminorms.
Part B extends the same singular-value and gauge language to rectangular maps, including the
Frobenius seminorm. The convex majorization layer is formulated for real tuples and supplies both
operator layers through one interface.

Suggested home: `TauCeti/Analysis/Convex/Majorization.lean` for the convex engine and
`TauCeti/Analysis/InnerProductSpace/` for the operator theory.

## Notation and terminology

- **Scalars and operator spaces.** `𝕜` denotes `ℝ` or `ℂ`. The operator layers use
  finite-dimensional inner-product spaces over `𝕜`; rectangular maps `A : E → F` allow distinct
  source and target spaces.
- **Ordered spectral data.** Eigenvalues and singular values are listed in nonincreasing order with
  multiplicity and are zero-padded when represented as finitely supported sequences.
- **Prefix sums.** For `x : Fin n → ℝ`, `Pₖ(x) := ∑_{i<k} xᵢ` denotes the prefix sum of length
  `k`.
- **Weak majorization.** For antitone nonnegative tuples, `x ≺w y` means
  `Pₖ(x) ≤ Pₖ(y)` for every prefix length `k`. Equality of the total sums is the additional
  condition associated with ordinary majorization.
- **Elementary majorization transfer.** A *Robin Hood transfer* moves mass from a larger coordinate
  to a smaller coordinate while preserving the total sum. A *T-transform* denotes the corresponding
  one-step transfer together with coordinate permutation.
- **Symmetric-convex sets and symmetric gauges.** Symmetry means invariance under coordinate
  permutations and coordinate sign changes. A finite symmetric gauge is subadditive, absolutely
  homogeneous, and symmetric in this sense.
- **Schur–Horn notation.** For an eigenvalue tuple `(λᵢ)` and an orthonormal basis `(eₖ)`,
  `dₖ := Re⟪Teₖ,eₖ⟫` denotes the diagonal data and
  `wᵢₖ := |⟪vᵢ,eₖ⟫|²` denotes the Schur weight matrix relative to an eigenbasis `(vᵢ)`.
- **Ky Fan sums.** `Kₖ(A) := ∑_{i<k} σᵢ(A)` denotes the sum of the first `k` singular values.
- **Unitarily invariant seminorms.** A square unitarily invariant seminorm is invariant under
  two-sided unitary multiplication. In the rectangular setting the left and right unitaries act on
  the target and source independently.
- **Frobenius seminorm.** `‖A‖_F` denotes the square root of the sum of squared singular values,
  equivalently the Hilbert–Schmidt norm in finite dimension.

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

Part A builds the convex majorization engine and connects it to operator spectra through
Schur–Horn and Ky Fan variational theory. Diagonal models then identify unitarily invariant
seminorms with symmetric gauges of singular values.

#### Convex majorization objects

Prefix sums encode weak majorization, while Robin Hood transfers give its elementary geometric
moves. Symmetric-convex sets and symmetric gauges turn these moves into convex containment and
numerical monotonicity.

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

The closure laws make weak majorization compositional under sums, scaling, and padding.
Transfer descent is the convex engine that later converts Ky Fan prefix inequalities into gauge
inequalities.

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

Squared overlaps between an eigenbasis and an arbitrary orthonormal basis form a doubly
stochastic weight matrix. This expresses diagonal data as a majorized image of the spectrum and
yields the convex Schur–Horn inequalities.

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

Ky Fan sums package the leading singular values into variational quantities. Their variational
principle yields singular-value triangle majorization and bounded-factor domination.

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

Diagonal models connect symmetric gauges on coordinate tuples with seminorms on operators.
The singular-value factorization makes this connection intrinsic, and Fan dominance transfers
weak majorization to every square unitarily invariant seminorm.

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

Part B turns Ky Fan domination into domination for every rectangular unitarily invariant
seminorm through the convex hull of the two-sided unitary orbit. Downstream perturbation proofs
can establish a Ky Fan estimate once and obtain operator, Frobenius, Ky Fan, and nuclear
consequences through this interface.

#### Rectangular seminorms and transport

The rectangular interface allows independent unitary changes of coordinates in the domain and
codomain. Isometric transport, zero extension, and adjoint transport connect rectangular maps
to the square singular-value theory.

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

Two-sided unitary orbits encode the geometry of operators with fixed singular data. Finite orbit
certificates convert convex orbit membership into seminorm bounds, and majorization supplies
the orbit-hull criterion.

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

Orthogonal block sums assemble directed estimates at the level of singular values and orbit
hulls. This assembly preserves the sharp constants used by spectral-subspace perturbation
estimates.

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

The operator, Frobenius, Ky Fan, and nuclear seminorms instantiate the common rectangular
interface. Their basis and singular-value formulas identify the standard concrete norms with
the abstract three-law structure.

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

Two-dimensional diagonal, off-diagonal, and triangular operators provide explicit singular-value
models for sharpness arguments. Trace and determinant recover the complete squared singular
spectrum in the planar case.

- **MAJ-B40 — Diagonal planar model.** If `s₀ ≥ s₁ ≥ 0`, the singular-value sequence of
  the planar diagonal operator `diag(s₀,s₁)` is `(s₀,s₁,0,0,…)`.
- **MAJ-B41 — Symmetric off-diagonal planar model.** The singular-value sequence of
  `[[0,r],[r,0]]` is `(|r|,|r|,0,0,…)`.
- **MAJ-B42 — One-sided triangular planar model.** The singular-value sequence of
  `[[0,0],[r,0]]` is `(|r|,0,0,…)`.
- **MAJ-B43 — Trace-determinant recovery in dimension two.** For `A : 𝕜² → F`, the two
  squared singular values have sum `tr(A†A)` and product `det(A†A)`; a nonnegative ordered
  pair is determined by these two values.

**Milestone B1 — rectangular seminorms and transport.** `MAJ-B01`–`MAJ-B13`.

**Milestone B2 — rectangular orbit-hull majorization.** `MAJ-B14`–`MAJ-B20`.

**Milestone B3 — rectangular Fan dominance.** `MAJ-B21`.

**Milestone B4 — orthogonal block sums.** `MAJ-B22`–`MAJ-B29`.

**Milestone B5 — concrete rectangular seminorms.** `MAJ-B30`–`MAJ-B39`.

**Milestone B6 — planar sharpness models.** `MAJ-B40`–`MAJ-B43`.

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

The convex engine in Part A depends only on Mathlib. The operator half of Part A consumes
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
(Kitware, Inc.).

The Schur–Horn proof strategy was read from and is credited to
[`rjwalters/lean-genius`](https://github.com/rjwalters/lean-genius),
`proofs/Proofs/SchurHornMajorization.lean` (commit `3e09c97`, retrieved 2026-07-04; no
licence declared upstream), and was re-derived on this development's own foundations.
