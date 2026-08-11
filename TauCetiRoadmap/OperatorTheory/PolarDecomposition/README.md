# Polar decomposition: functional calculus, the operator modulus, and singular systems

Spectral perturbation theory is written in a small, stable vocabulary: apply a real
function to a self-adjoint operator; factor an operator through its modulus; expand a
rectangular map in its singular system. This roadmap builds the functional-calculus,
modulus, polar-decomposition and singular-system layers.

Mathlib has the static ingredients — the spectral theorem
([`LinearMap.IsSymmetric.eigenvalues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Spectrum.html)
and `eigenvectorBasis`), positivity (`LinearMap.IsPositive`), adjoints, the continuous
functional calculus over `ℂ`, and singular *values*
([`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html))
— but not the operator-theoretic layer over `RCLike`: no functional calculus for a
symmetric `LinearMap` covering `ℝ` and `ℂ` together, no positive square root with its
uniqueness theory at that generality, no partial-isometry API, no polar decomposition, no
singular *vectors*, and no Moore–Penrose inverse.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`, with the two scalar square-root
estimates in `TauCeti/Analysis/SpecialFunctions/`.

**Hilbert-space generality.** The eigenbasis functional calculus is finite-dimensional.
The continuous functional calculus for bounded self-adjoint operators on complete real Hilbert
spaces supplies the dimension-free real calculus. The rectangular operator modulus, the polar
factorization through a partial isometry, and the Gram-contraction factorization are complete-space
statements over `RCLike`. [`OperatorIdeals`](../OperatorIdeals/README.md) uses the
Gram-contraction rung directly;
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) uses the bounded
polar factorization in its interval/exterior estimates.

## Standing conventions

- **Scalars are `𝕜 : RCLike`; finite dimension exactly where the eigenbasis is used.** The
  finite functional calculus is a sum over `LinearMap.IsSymmetric.eigenvectorBasis` and carries
  `[FiniteDimensional 𝕜 E]`. The partial-isometry API, modulus, polar factorization, and
  Gram-contraction factorization are stated on complete Hilbert spaces over `RCLike`.
- **The bounded real continuous functional calculus is dimension-free.** Every complete real
  Hilbert space carries `ContinuousFunctionalCalculus ℝ (E →L[ℝ] E) IsSelfAdjoint`, giving
  bounded self-adjoint operators the standard `cfcHom` and `cfc` interface over `ℝ`.
- **One square root, defined once.** The positive square root *is* the functional calculus
  at `Real.sqrt`, by definition. There must not be two constructions of one object; the
  square-root-specific theory (uniqueness, kernel, range, the isometry-defect identity)
  attaches to that single definition.
- **One modulus semantics, with carrier-appropriate constructions.** For a rectangular map
  `T : E → F`, the modulus is the positive square root of `T†T` and therefore acts on `E`.
  `LinearMap.operatorAbs` states this over finite-dimensional `RCLike` spaces;
  `ContinuousLinearMap.modulus` states the dimension-free bounded-operator API over `RCLike`.
  The bounded real and complex continuous functional calculi supply complete-space square-root
  constructions; finite-dimensional bridge theorems identify the carrier-level constructions.
- **One equation, with carrier-appropriate predicates.** In a star monoid,
  `IsPartialIsometry u` means `u * star u * u = u`; this covers endomorphisms and abstract
  C⋆-algebra elements. A rectangular map `u : E → F` is not an element of one monoid, so
  `LinearMap.IsPartialIsometry` and `ContinuousLinearMap.IsPartialIsometry` state the typed
  equation `u ∘ u† ∘ u = u`. The endomorphism predicates are proved equivalent, and the
  geometric characterization — isometric on `(ker u)ᗮ`, zero on `ker u` — is a theorem,
  never the definition.
- **Construct the square root where available; factor it at `RCLike` generality.** If
  `A : E →L[𝕜] E` is self-adjoint and `A ∘L A = T† ∘L T`, then on arbitrary complete
  `RCLike` Hilbert spaces there is a contraction `W : E →L[𝕜] F` with contractive adjoint
  such that `W ∘L A = T` and `W† ∘L T = A`. Taking `A = modulus T` supplies the canonical
  Gram square root and sharpens this to the rectangular polar partial isometry.
  Finite-dimensional endomorphisms over `RCLike` further admit a unitary factor.
- **Intrinsic, basis-free statements.** The singular system is built for a linear map
  between spaces, never for a matrix in a chosen pair of bases: the consumers (principal
  angles, unitarily invariant norms, spectral-subspace perturbation) are basis-free, and a
  matrix-mediated development would force each to carry a basis choice and prove
  independence of it.
- **Total operations at zero singular values.** The left singular vector is `σᵢ⁻¹ • A vᵢ`
  through total field inversion, so it is defined (and zero) at `σᵢ = 0`; orthonormality is
  asserted on the subtype of indices with nonzero singular value, and the singular relation
  `A vᵢ = σᵢ • uᵢ` holds *including* the zero case.

## What Mathlib already has (consume)

- **The spectral theorem:** `LinearMap.IsSymmetric` with `eigenvalues` / `eigenvectorBasis`,
  `LinearMap.IsPositive` with `nonneg_eigenvalues`, adjoints, and the rank-one operators
  `InnerProductSpace.rankOne`. Part A is a finite sum of these.
- **The continuous functional calculus over `ℂ`:** `CFC.sqrt` and `CFC.abs` on `E →L[ℂ] E`.
  This supplies the complex implementation of the dimension-free modulus and the comparison
  theorem with the finite `RCLike` construction.
- **Singular values:** `LinearMap.singularValues : ℕ →₀ ℝ` between finite-dimensional inner
  product spaces — zero-indexed, antitone, zero past the rank. Mathlib has the values;
  Part C adds the vectors, the two-sided spectrum bridge, and the pseudoinverse.

---

## What is missing (build here)

* The finite self-adjoint functional calculus over `RCLike`, together with comparison to the
  complex continuous-functional-calculus implementation where both apply.
* The continuous functional calculus for bounded self-adjoint operators on complete real Hilbert
  spaces, presented through Mathlib's `ContinuousFunctionalCalculus` interface.
* The positive square root and its uniqueness; the rectangular modulus over `RCLike` in both
  finite and complete settings, with comparison to the complex CFC implementation.
* Partial isometries for maps between *different* spaces, and their geometric
  characterization; Mathlib has no `IsPartialIsometry` at all.
* The dimension-free `RCLike` Gram-contraction factorization from a self-adjoint square root
  of `T†T`, together with the continuous-functional-calculus construction of the canonical
  modulus.
* The polar decomposition with a unitary factor in finite dimension, and its
  rectangular bounded counterpart.
* The singular system: right singular basis, left singular vectors, the rank-one expansion,
  and the Moore–Penrose inverse characterized by Penrose's four conditions rather than
  constructed and named.

## The build, in layers

The labels in Parts A–C form the complete mathematical obligation set for this roadmap. Each
label names one obligation. Milestones group labels into submission units, and `Suggested.lean`
cites the labels represented by its sample declarations.

### Part A — the functional calculus, the positive square root, and the modulus

**Supporting Hilbert-space and scalar API.**

- **PD-A01 — Inner products of finite linear combinations.** For finitely supported coefficient
  families `(aᵢ)` and `(bⱼ)` on vectors `(vᵢ)`, the inner product of `∑ᵢ aᵢvᵢ` and `∑ⱼ bⱼvⱼ` is the double
  sum of `conjugate(aᵢ)bⱼ ⟪vᵢ, vⱼ⟫`.
- **PD-A02 — Spans of orthonormal subfamilies.** For an orthonormal basis `(eᵢ)` indexed by `I`
  and a set `s ⊆ I`, define `Vₛ` as the span of the vectors `eᵢ` with `i ∈ s`.
- **PD-A03 — Monotonicity of selected spans.** For index sets `s ⊆ t`, the span of the basis
  vectors indexed by `s` is contained in the span of those indexed by `t`.
- **PD-A04 — Membership in a selected span.** A vector belongs to the span of the basis vectors
  indexed by `s` exactly when all of its basis coordinates outside `s` vanish.
- **PD-A05 — Dimension of a selected span.** For a finite index set `s`, the dimension of the span
  of the corresponding basis vectors is the cardinality of `s`.
- **PD-A06 — Orthogonal complement of a selected span.** The orthogonal complement of the span
  indexed by `s` is the span indexed by the complement of `s`.
- **PD-A07 — Eigenvector cross-term identity.** If `T` and `S` are symmetric,
  `Teᵢ = λᵢeᵢ`, and `Sfⱼ = μⱼfⱼ`, then
  `⟪eᵢ, (S − T)fⱼ⟫ = (μⱼ − λᵢ)⟪eᵢ, fⱼ⟫`.
- **PD-A08 — Square-root displacement estimate.** For `μ ≥ 0`, `|√μ − 1| ≤ |μ − 1|`.
- **PD-A09 — Inverse-square-root displacement estimate.** If `|μ − 1| ≤ δ ≤ 1/2`, then `|1 − (√μ)⁻¹| ≤ δ`.

**Continuous and finite functional calculus.**

- **PD-A10 — Real bounded continuous functional calculus.** Every complete real Hilbert space
  admits the continuous functional calculus for bounded self-adjoint operators with continuous
  real-valued functions.
- **PD-A11 — Finite self-adjoint functional calculus.** For a symmetric endomorphism `T` of a
  finite-dimensional real or complex Hilbert space and a function `f : ℝ → ℝ`, define `f(T)` by the
  spectral sum `∑ᵢ f(λᵢ) Pᵢ` over an orthonormal eigenbasis.
- **PD-A12 — Diagonal action of the finite calculus.** For every eigenbasis vector `eᵢ` of `T`
  with eigenvalue `λᵢ`, `f(T)eᵢ = f(λᵢ)eᵢ`.
- **PD-A13 — Symmetry of the finite calculus.** For symmetric `T`, the operator `f(T)` is symmetric.
- **PD-A14 — Identity function.** Applying the finite functional calculus to the identity function recovers `T`.
- **PD-A15 — Spectral extensionality.** If `f` and `g` agree on every eigenvalue of `T`, then `f(T) = g(T)`.
- **PD-A16 — Product law.** For scalar functions `f` and `g`, `f(T)g(T) = (fg)(T)`.
- **PD-A17 — Action on arbitrary eigenvectors.** If `Tx = λx`, then `f(T)x = f(λ)x`.
- **PD-A18 — Commutant preservation.** Every endomorphism commuting with `T` also commutes with `f(T)`.
- **PD-A19 — Uniqueness of the finite calculus.** The operator `f(T)` is the unique symmetric
  endomorphism acting as multiplication by `f(λ)` on each eigenspace of `T`.

**Positive square root.**

- **PD-A20 — Positive square root.** For a positive endomorphism `T`, define `√T` by applying the
  finite self-adjoint functional calculus to the scalar square-root function.
- **PD-A21 — Positivity of the square root.** For positive `T`, `√T` is positive.
- **PD-A22 — Symmetry of the square root.** For positive `T`, `√T` is symmetric.
- **PD-A23 — Square-root equation.** For positive `T`, `(√T)² = T`.
- **PD-A24 — Square-root kernel.** For positive `T`, `ker(√T) = ker(T)`.
- **PD-A25 — Square-root range.** For positive `T` in finite dimension, `range(√T) = range(T)`.
- **PD-A26 — Square-root norm identity.** For positive `T` and every `x`, `‖√T x‖² = Re⟪Tx, x⟫`.
- **PD-A27 — Square-root invertibility.** If positive `T` is invertible, then `√T` is invertible.
- **PD-A28 — Uniqueness of the positive square root.** If `S` is positive and `S² = T`, then `S = √T`.

**Finite-dimensional modulus.**

- **PD-A29 — Finite rectangular modulus.** For a linear map `A : E → F` between finite-dimensional
  real or complex Hilbert spaces, define its modulus on `E` by `|A| = √(A†A)`.
- **PD-A30 — Positivity of the finite modulus.** The modulus `|A|` is positive.
- **PD-A31 — Finite modulus square.** The modulus satisfies `|A|² = A†A`.
- **PD-A32 — Finite modulus pointwise norm.** For every `x`, `‖|A|x‖ = ‖Ax‖`.
- **PD-A33 — Finite modulus kernel.** The modulus and the original map have the same kernel:
  `ker |A| = ker A`.
- **PD-A34 — Finite modulus range.** In finite dimension, `range |A| = (ker A)⊥`.
- **PD-A35 — Normal commutation.** For a normal finite-dimensional endomorphism `A`, `A|A| = |A|A`.

**Complete-space modulus.**

- **PD-A36 — Complete-space rectangular modulus.** For a bounded operator `T : E → F` between
  complete real or complex Hilbert spaces, define its modulus on `E` by `|T| = √(T†T)`.
- **PD-A37 — Positivity of the complete-space modulus.** The bounded-operator modulus `|T|` is
  positive.
- **PD-A38 — Self-adjointness of the complete-space modulus.** The bounded-operator modulus `|T|`
  is self-adjoint.
- **PD-A39 — Complete-space modulus square.** The bounded-operator modulus satisfies `|T|² = T†T`.
- **PD-A40 — Uniqueness of the complete-space modulus.** The modulus `|T|` is the unique positive
  self-adjoint square root of `T†T`.
- **PD-A41 — Complete-space modulus pointwise norm.** For every `x`, `‖|T|x‖ = ‖Tx‖`.
- **PD-A42 — Complete-space modulus kernel.** The bounded-operator modulus and `T` have the same
  kernel: `ker |T| = ker T`.
- **PD-A43 — Complete-space modulus operator norm.** The bounded-operator modulus has the same
  operator norm as `T`: `‖|T|‖ = ‖T‖`.
- **PD-A44 — Precomposition norm law.** For every bounded `D : G → E`, `‖|T|D‖ = ‖TD‖`.
- **PD-A45 — Postcomposition norm law.** For every bounded `D : E → G`, `‖D|T|‖ = ‖DT†‖`.

**Agreement of constructions.**

- **PD-A46 — Agreement with the complex continuous functional calculus.** For a
  finite-dimensional complex Hilbert space, symmetric `T`, and continuous `f : ℝ → ℝ`, the finite
  spectral construction of `f(T)` agrees with the bounded continuous functional calculus.
- **PD-A47 — Agreement of finite and complete moduli.** In finite dimension over ℝ or ℂ, the
  linear-map modulus and bounded-operator modulus determine the same operator.
- **PD-A48 — Complex modulus as a continuous-functional-calculus square root.** For a bounded
  complex operator `T`, `|T|` is the continuous-functional-calculus positive square root of
  `T†T`.
- **PD-A49 — Complex finite modulus as operator absolute value.** For a finite-dimensional
  complex endomorphism `A`, its finite-dimensional modulus agrees with the
  continuous-functional-calculus absolute value of the corresponding bounded operator.

**Courant–Fischer and Weyl.**

- **PD-A50 — Eigenbasis quadratic form.** If `T` is symmetric with orthonormal eigenbasis `(eᵢ)` and
  eigenvalues `(λᵢ)`, then `Re⟪Tx, x⟫ = ∑ᵢ λᵢ |⟪eᵢ, x⟫|²`.
- **PD-A51 — Courant–Fischer min–max formula.** The `k`-th sorted eigenvalue of a symmetric
  endomorphism is the supremum, over `(k+1)`-dimensional subspaces `V`, of the infimum of its
  Rayleigh quotient on unit vectors in `V`.
- **PD-A52 — Eigenvalue monotonicity.** If symmetric endomorphisms `S` and `T` satisfy `S ≤ T` in
  Loewner order, then every sorted eigenvalue of `S` is at most the corresponding sorted
  eigenvalue of `T`.
- **PD-A53 — Weyl perturbation bound.** For symmetric endomorphisms `S` and `T`, every corresponding
  pair of sorted eigenvalues satisfies `|λₖ(S) − λₖ(T)| ≤ ‖S − T‖`.

### Naming the modulus

The two carrier-level constructions are

```lean
LinearMap.operatorAbs       (A : E →ₗ[𝕜] F) : E →ₗ[𝕜] E   -- RCLike, finite-dimensional
ContinuousLinearMap.modulus (T : E →L[𝕜] F) : E →L[𝕜] E   -- RCLike, rectangular, complete
```

each in the namespace of its carrier, so both support dot notation.

The finite-dimensional construction and its lemmas use `operatorAbs` —
`norm_operatorAbs_apply`, `ker_operatorAbs`. A bare `abs` collides with the lattice absolute
value that `|·|` denotes in Lean, while `modulus` is the bounded-operator spelling.

**Milestone — continuous functional calculus on real Hilbert spaces.** `PD-A10`.

**Milestone — uniqueness, at both layers.** `PD-A19`, `PD-A28`, and `PD-A40`.

**Milestone — Courant–Fischer and Weyl.** `PD-A50`–`PD-A53`.

**Milestone — agreement of calculus and modulus constructions.** `PD-A46`–`PD-A49`.

### Part B — polar decomposition and partial isometries

Every bounded rectangular operator on a real or complex Hilbert space factors as a partial
isometry times its modulus. Finite-dimensional endomorphisms have a unitary-factor form. A
supplied self-adjoint Gram square root `A² = T†T` determines a two-sided contractive factor, and
the modulus supplies the canonical square root.

**Partial-isometry API.**

- **PD-B01 — Partial isometries in star monoids.** An element `u` of a star monoid is a partial
  isometry exactly when `uu†u = u`.
- **PD-B02 — Rectangular linear partial isometries.** A linear map `u : E → F` between
  finite-dimensional real or complex Hilbert spaces is a partial isometry exactly when `uu†u = u`.
- **PD-B03 — Agreement of endomorphism partial-isometry predicates.** For finite-dimensional
  endomorphisms, the star-monoid and rectangular linear-map formulations of partial isometry are
  equivalent.
- **PD-B04 — Rectangular bounded partial isometries.** A bounded operator `u : E → F` between
  complete real or complex Hilbert spaces is a partial isometry exactly when `uu†u = u`.
- **PD-B05 — Agreement for bounded endomorphisms.** For bounded endomorphisms, the star-monoid
  and rectangular bounded-operator formulations of partial isometry are equivalent.
- **PD-B06 — Initial projection of a partial isometry.** If `u` is a partial isometry, then `u†u` is
  an orthogonal projection.
- **PD-B07 — Adjoints of partial isometries.** The adjoint of a partial isometry is a partial
  isometry.
- **PD-B08 — Isometries as partial isometries.** Every linear isometry is a partial isometry.
- **PD-B09 — Geometric characterization in finite dimension.** A linear map `u : E → F` is a
  partial isometry exactly when it preserves norms on `(ker u)⊥`.
- **PD-B10 — Geometric characterization for bounded operators.** A bounded operator `u : E → F` is
  a partial isometry exactly when it preserves norms on `(ker u)⊥`.

**Finite-dimensional square polar decomposition.**

- **PD-B11 — Finite-dimensional polar factor.** For a finite-dimensional map `A`, the rule
  `|A|x ↦ Ax` defines an isometry on `(ker A)⊥`; extending it by zero on `ker A` gives the
  canonical polar partial isometry `U`.
- **PD-B12 — Kernel of the finite polar factor.** For the canonical finite-dimensional polar
  partial isometry `U`, `ker U = ker A`.
- **PD-B13 — Range of the finite polar factor.** For the canonical finite-dimensional polar
  partial isometry `U`, `range U = range A`.
- **PD-B14 — Partial-isometry property of the finite polar factor.** The canonical
  finite-dimensional polar factor `U` is a partial isometry.
- **PD-B15 — Action on the modulus range.** For every `x`, `U|A|x = Ax`.
- **PD-B16 — Finite-dimensional polar decomposition.** Every finite-dimensional linear map
  satisfies `A = U|A|` for its canonical polar partial isometry `U`.

`PD-A35` supplies normal commutation of `A` with `|A|`.
- **PD-B17 — Invertible polar unitary.** If a finite-dimensional endomorphism `A` is invertible,
  its canonical polar factor `U` is unitary.
- **PD-B18 — Uniqueness of the invertible unitary factor.** If invertible `A = UP` with `U`
  unitary and `P` positive, then `P = |A|` and `U` is the canonical polar unitary.
- **PD-B19 — Adjoint of the finite polar factor.** The canonical polar factor of `A†` is the
  adjoint of the canonical polar factor of `A`.
- **PD-B20 — Unitary extension of the finite polar factor.** For every finite-dimensional
  endomorphism `A`, the canonical polar partial isometry extends to a unitary operator on the
  ambient space.
- **PD-B21 — Finite-dimensional unitary polar decomposition.** Every finite-dimensional
  endomorphism admits a factorization `A = U|A|` with `U` unitary.

**Gram-contraction factorization.**

- **PD-B22 — Contractive factor from a Gram square root.** Let `T : E → F` be bounded and let
  `A : E → E` be self-adjoint with `A² = T†T`. Then there is a contraction `W : E → F` whose
  adjoint is also contractive and which satisfies `WA = T` and `W†T = A`.

**Complete-space rectangular polar decomposition.**

- **PD-B23 — Initial space of the bounded polar factor.** For bounded `M : E → F`, the initial
  space of its polar factor is the closure of `range |M|`.
- **PD-B24 — Complete-space rectangular polar factor.** The rule `|M|x ↦ Mx` extends isometrically
  from `range |M|` to its closure and, by zero on the orthogonal complement, defines the canonical
  bounded polar partial isometry `U : E → F`.
- **PD-B25 — Partial-isometry property of the bounded polar factor.** The canonical bounded
  polar factor `U` is a partial isometry.
- **PD-B26 — Complete-space rectangular polar decomposition.** The canonical bounded polar
  factor satisfies `U|M| = M`.
- **PD-B27 — Isometry on the initial space.** The canonical bounded polar factor preserves norms
  on its initial space.
- **PD-B28 — Vanishing on the initial complement.** The canonical bounded polar factor vanishes
  on the orthogonal complement of its initial space.
- **PD-B29 — Initial-space identity.** The initial space of the bounded polar factor is `(ker M)⊥`.
- **PD-B30 — Kernel of the bounded polar factor.** The kernel of the canonical bounded polar
  factor is the orthogonal complement of its initial space.
- **PD-B31 — Initial projection formula.** For the canonical bounded polar factor `U`, `U†U` is the
  orthogonal projection onto the initial space.
- **PD-B32 — Final space of the bounded polar factor.** The final space of the bounded polar
  factor is the closure of `range M`.
- **PD-B33 — Range of the bounded polar factor.** The range of the canonical bounded polar
  factor is its final space.
- **PD-B34 — Final projection formula.** For the canonical bounded polar factor `U`, `UU†` is the
  orthogonal projection onto the final space.
- **PD-B35 — Adjoint of the bounded polar factor.** The canonical bounded polar factor of `M†` is
  the adjoint of the canonical bounded polar factor of `M`.
- **PD-B36 — Uniqueness of the bounded polar factor.** If `V|M| = M` and `V` vanishes on the
  orthogonal complement of the initial space, then `V` is the canonical bounded polar factor.

**Bounded-below and near-isometry rungs.**

- **PD-B37 — Polar isometry for bounded-below operators.** If `|M|` is invertible, then `U = M|M|⁻¹`
  defines an isometry on the whole source space.
- **PD-B38 — Bounded-below polar identity.** If `|M|` is invertible and `U = M|M|⁻¹`, then `U|M| = M`.
- **PD-B39 — Norm preservation in the bounded-below case.** If `|M|` is invertible and `U = M|M|⁻¹`,
  then `‖Ux‖ = ‖x‖` for every `x`.
- **PD-B40 — Bounded-below comparison estimate.** If `|M|` is invertible and `U = M|M|⁻¹`,
  then `‖M − U‖ ≤ ‖|M| − I‖`.
- **PD-B41 — Near-isometry square-root estimate.** Let `M` be a real finite-dimensional
  endomorphism whose quadratic form differs from the identity by at most `δ` with `δ < 1`.
  If `S = √(M†M)`, then `‖Sx − x‖ ≤ δ‖x‖` for every `x`.
- **PD-B42 — Near-isometry factorization.** Let `M` be a real finite-dimensional endomorphism
  whose quadratic form differs from the identity by at most `δ` with `δ < 1`, and let
  `S = √(M†M)`. Then there is a unitary operator `W` such that `M = WS`.
- **PD-B43 — Near-isometry operator bound.** Let `M` be a real finite-dimensional endomorphism
  whose quadratic form differs from the identity by at most `δ` with `δ ≤ 1/2`, let
  `S = √(M†M)`, and let `M = WS` be the unitary factorization. Then `‖M − W‖ ≤ 2δ`.

**Davis intertwining unitary.**

- **PD-B44 — Complete orthogonal projection families.** A finite family `(Pⱼ)` is complete and
  orthogonal when every `Pⱼ` is an orthogonal projection, distinct ranges are orthogonal, and `∑ⱼ Pⱼ = I`.
- **PD-B45 — Davis non-degeneracy condition.** For complete orthogonal projection families
  `(Pⱼ)` and `(P′ⱼ)`, require `P′ⱼ` to be injective on `range Pⱼ` for every `j`.
- **PD-B46 — Davis intertwining unitary.** For complete orthogonal projection families `(Pⱼ)`
  and `(P′ⱼ)` such that `P′ⱼ` is injective on `range Pⱼ` for every `j`, the block polar factors
  of `P′ⱼPⱼ` assemble to a unitary operator `U`.
- **PD-B47 — Davis intertwining equation.** For the unitary assembled from the block polar
  factors of `P′ⱼPⱼ` under the Davis non-degeneracy condition, `UPⱼ = P′ⱼU` for every `j`.

**Milestone — the Gram-contraction and polar decompositions.** `PD-B01`–`PD-B40`.

**Milestone — the near-isometry factorization.** `PD-B41`–`PD-B43`.

**Milestone — Davis's intertwining unitary.** `PD-B44`–`PD-B47`.

### Part C — singular values and the singular system

Mathlib has `LinearMap.singularValues`. This Part supplies the bounded-operator accessor, the
rectangular Gram-spectrum bridge, the singular vectors, and the Moore–Penrose inverse.

**Singular-value accessor and spectrum bridge.**

- **PD-C01 — Singular values of bounded operators.** For a finite-dimensional bounded operator,
  its singular-value sequence is the singular-value sequence of the underlying linear map.
- **PD-C02 — Compatibility with the underlying linear map.** Passing a finite-dimensional
  bounded operator to its underlying linear map leaves every singular value unchanged.
- **PD-C03 — Symmetry of the source Gram operator.** For every finite-dimensional linear map
  `A : E → F`, `A†A` is symmetric.
- **PD-C04 — Positivity of the source Gram operator.** For every finite-dimensional linear map
  `A : E → F`, `A†A` is positive.
- **PD-C05 — Symmetry of the target Gram operator.** For every finite-dimensional linear map
  `A : E → F`, `AA†` is symmetric.
- **PD-C06 — Positivity of the target Gram operator.** For every finite-dimensional linear map
  `A : E → F`, `AA†` is positive.
- **PD-C07 — Rectangular Gram-spectrum bridge.** The nonzero eigenvalues of `A†A` and `AA†` agree
  with multiplicity; equivalently, their sorted eigenvalue lists agree through the common rank
  and are zero beyond it.
- **PD-C08 — Adjoint invariance of singular values.** `A` and `A†` have the same singular values.

**Singular system.**

- **PD-C09 — Right singular basis.** Choose an orthonormal basis `(vᵢ)` of the source consisting
  of eigenvectors of `A†A`, ordered compatibly with the singular values.
- **PD-C10 — Left singular vectors.** For each right singular vector `vᵢ` with singular value `σᵢ`,
  set `uᵢ = σᵢ⁻¹Avᵢ` using total field inversion.
- **PD-C11 — Right singular eigenvalue equation.** For every `i`, `A†A vᵢ = σᵢ²vᵢ`.
- **PD-C12 — Singular relation.** For every `i`, `Avᵢ = σᵢuᵢ`, including `σᵢ = 0`.
- **PD-C13 — Orthonormality of nonzero left singular vectors.** The vectors `uᵢ` with `σᵢ ≠ 0` form
  an orthonormal family.
- **PD-C14 — Left singular eigenvalue equation.** For every `i` with `σᵢ ≠ 0`, `AA†uᵢ = σᵢ²uᵢ`.
- **PD-C15 — Adjoint singular relation.** For every `i` with `σᵢ ≠ 0`, `A†uᵢ = σᵢvᵢ`.
- **PD-C16 — Singular expansion on vectors.** For every source vector `x`, `Ax = ∑ᵢ σᵢ⟪vᵢ, x⟫uᵢ`,
  with the scalar convention induced by the Hilbert-space inner product.
- **PD-C17 — Rank-one singular reconstruction.** The operator `A` is the finite sum of the
  rank-one operators `σᵢ uᵢ ⊗ vᵢ`.
- **PD-C18 — Completion of the left singular family.** The nonzero left singular vectors extend
  to an orthonormal basis of the codomain.

### The Moore–Penrose interface

The Moore–Penrose relation consists of the four equations

```text
A B A = A     B A B = B     (A B)† = A B     (B A)† = B A
```

- **PD-C19 — Moore–Penrose equations.** For maps `A : E → F` and `B : F → E`, the Moore–Penrose
  relation consists of `ABA = A`, `BAB = B`, `(AB)† = AB`, and `(BA)† = BA`.
- **PD-C20 — Moore–Penrose inverse.** Every linear map between finite-dimensional real or
  complex Hilbert spaces has a Moore–Penrose inverse obtained from its singular system by
  replacing each nonzero singular value `σᵢ` with `σᵢ⁻¹`.
- **PD-C21 — Penrose equations for the construction.** The singular-system construction of the
  Moore–Penrose inverse satisfies all four Moore–Penrose equations.
- **PD-C22 — Uniqueness of Moore–Penrose inverses.** For fixed `A`, two maps satisfying the four
  Moore–Penrose equations are equal.
- **PD-C23 — Characterization of the Moore–Penrose inverse.** A map `B` satisfies the four
  Moore–Penrose equations for `A` exactly when `B` equals the Moore–Penrose inverse `A⁺`.
- **PD-C24 — Adjoint compatibility.** `B` is a Moore–Penrose inverse of `A` exactly when `B†`
  is a Moore–Penrose inverse of `A†`.
- **PD-C25 — Injective case.** If `A` is injective, then `A⁺A = I`.
- **PD-C26 — Surjective case.** If `A` is surjective, then `AA⁺ = I`.
- **PD-C27 — Invertible case.** If `A` is invertible, then `A⁺ = A⁻¹`.

**Milestone — the singular expansion.** `PD-C09`–`PD-C18`.

**Milestone — existence and uniqueness of the Moore–Penrose inverse.** `PD-C19`–`PD-C27`.

## Worked examples (acceptance criteria)

### Part A — the functional calculus, the positive square root, and the modulus

**Acceptance examples.** Exercise `PD-A10` on an infinite-dimensional real Hilbert space;
exercise `PD-A12`, `PD-A14`, `PD-A20`, and `PD-A29` on diagonal finite-dimensional operators;
exercise `PD-A53` on a rank-one perturbation of the identity.

### Part B — polar decomposition and partial isometries

**Acceptance criteria.** Exercise `PD-B22` and `PD-B23`–`PD-B40` on rectangular complete
`RCLike` Hilbert spaces; exercise `PD-A48` over `ℂ`; exercise the predicate agreements
`PD-B03` and `PD-B05`; exercise the initial-space identity `PD-B29`.

### Part C — singular values and the singular system

**Acceptance criteria.** Exercise the accessor `PD-C01`–`PD-C02`, the intrinsic singular
system `PD-C09`–`PD-C18`, the Moore–Penrose characterization `PD-C19`–`PD-C24`, and the zero
singular-value case in `PD-C12`.

## Ordering

Part A comes first: Parts B and C each consume it and nothing else — B needs both moduli,
C needs the Gram operator's eigenbasis and the eigenvalue-counting lemmas. B and C are
mutually independent and can proceed in parallel once A lands.

This roadmap is independent: it rests only on Mathlib, and it is the foundation the rest of
the [operator theory](../README.md) family cites.

## Definition reference

**PD-B24** is the map |M|x ↦ Mx, extended by continuity to the closure of range|M| and
by zero on its orthogonal complement.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge (2013) — Thm 7.2.6
  (unique positive square root), 7.2.7(b), 7.3.1 (polar decomposition), 4.2.6
  (Courant–Fischer), Weyl's perturbation inequality.
- J. B. Conway, *A Course in Functional Analysis*, 2nd ed. — §VI.3 (partial isometries,
  VI.3.2, VI.3.9); M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*, §VI — the
  polar decomposition on Hilbert space.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6**
  (1963) — the intertwining unitary.
- R. Penrose, *A generalized inverse for matrices*, Proc. Cambridge Philos. Soc. **51**
  (1955) — the four conditions and the uniqueness characterization.
## Acknowledgements

An Apache-2.0 implementation of all three Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.), in namespaces `TauCeti.*`, `LinearMap.*` and `ContinuousLinearMap.*`. The
public API and proof structure may change during integration.

One difference should be expected at integration: the Moore–Penrose conditions are
currently passed as four anonymous hypotheses rather than through a predicate, which is a
target of Part C.
