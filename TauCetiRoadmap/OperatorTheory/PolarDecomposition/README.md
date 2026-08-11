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

- **PD-A01 — Inner products of finite linear combinations.** For a finitely supported pair of
  coefficient families, expand the inner product of their linear combinations as the double sum
  over the pairwise inner products of the underlying vector family.
- **PD-A02 — Spans of orthonormal subfamilies.** For an orthonormal basis `b` and an index set `s`,
  define the submodule `b.spanIndices s` generated by the selected basis vectors.
- **PD-A03 — Monotonicity of selected spans.** If `s ⊆ t`, then
  `b.spanIndices s ≤ b.spanIndices t`.
- **PD-A04 — Membership in a selected span.** Characterize `x ∈ b.spanIndices s` by vanishing of
  the coordinates of `x` outside `s`.
- **PD-A05 — Dimension of a selected span.** For a finite selected index set, the finrank of
  `b.spanIndices s` is the number of selected indices.
- **PD-A06 — Orthogonal complement of a selected span.** The orthogonal complement of
  `b.spanIndices s` is `b.spanIndices sᶜ`.
- **PD-A07 — Eigenvector cross-term identity.** For symmetric `T` and `S`, eigenvectors `eᵢ` of
  `T` and `fⱼ` of `S` satisfy
  `⟪eᵢ, (S - T) fⱼ⟫ = (μⱼ - λᵢ) ⟪eᵢ, fⱼ⟫`.
- **PD-A08 — Square-root displacement estimate.** For `0 ≤ μ`,
  `|Real.sqrt μ - 1| ≤ |μ - 1|`.
- **PD-A09 — Inverse-square-root displacement estimate.** If
  `|μ - 1| ≤ δ ≤ 1 / 2`, then `|1 - (Real.sqrt μ)⁻¹| ≤ δ`.

**Continuous and finite functional calculus.**

- **PD-A10 — Real bounded continuous functional calculus.** Every complete real Hilbert space
  `E` carries `ContinuousFunctionalCalculus ℝ (E →L[ℝ] E) IsSelfAdjoint`.
- **PD-A11 — Finite self-adjoint functional calculus.** For a symmetric finite-dimensional
  `RCLike` endomorphism `T` and `f : ℝ → ℝ`, define
  `selfAdjointFunctionalCalculus hT f` by the spectral sum
  `∑ᵢ f(λᵢ) • rankOne eᵢ eᵢ`.
- **PD-A12 — Diagonal action of the finite calculus.** The finite calculus sends each eigenbasis
  vector `eᵢ` to `f(λᵢ) • eᵢ`.
- **PD-A13 — Symmetry of the finite calculus.** `selfAdjointFunctionalCalculus hT f` is symmetric.
- **PD-A14 — Identity symbol.** The finite calculus at `id` is `T`.
- **PD-A15 — Spectral extensionality.** Functions agreeing on the eigenvalues of `T` give equal
  finite-calculus operators.
- **PD-A16 — Product law.** Composition of finite-calculus operators corresponds to pointwise
  multiplication of the scalar functions.
- **PD-A17 — Arbitrary-eigenvector action.** If `T x = λ • x`, then the finite calculus sends
  `x` to `f λ • x`.
- **PD-A18 — Commutant preservation.** Every endomorphism commuting with `T` commutes with every
  finite-calculus operator of `T`.
- **PD-A19 — Uniqueness of the finite calculus.** The finite calculus is the unique symmetric
  endomorphism acting by `f λ` on every eigenspace of `T`.

**Positive square root.**

- **PD-A20 — Positive square-root definition.** For positive `T`, define `sqrt hT` as the finite
  functional calculus at `Real.sqrt`.
- **PD-A21 — Positivity of the square root.** `sqrt hT` is positive.
- **PD-A22 — Symmetry of the square root.** `sqrt hT` is symmetric.
- **PD-A23 — Square-root equation.** `sqrt hT ∘ₗ sqrt hT = T`.
- **PD-A24 — Square-root kernel.** `ker (sqrt hT) = ker T`.
- **PD-A25 — Square-root range.** `range (sqrt hT) = range T`.
- **PD-A26 — Square-root norm identity.** For every `x`,
  `‖sqrt hT x‖² = re ⟪T x, x⟫`.
- **PD-A27 — Square-root invertibility.** Invertibility of positive `T` implies invertibility of
  `sqrt hT`.
- **PD-A28 — Uniqueness of the positive square root.** A positive endomorphism whose square is
  `T` equals `sqrt hT`.

**Finite-dimensional modulus.**

- **PD-A29 — Finite rectangular modulus.** For `A : E →ₗ[𝕜] F`, define
  `LinearMap.operatorAbs A = sqrt (A† ∘ₗ A)` on the source space.
- **PD-A30 — Positivity of the finite modulus.** `operatorAbs A` is positive.
- **PD-A31 — Finite modulus square.** `operatorAbs A ∘ₗ operatorAbs A = A† ∘ₗ A`.
- **PD-A32 — Finite modulus pointwise norm.** `‖operatorAbs A x‖ = ‖A x‖`.
- **PD-A33 — Finite modulus kernel.** `ker (operatorAbs A) = ker A`.
- **PD-A34 — Finite modulus range.** `range (operatorAbs A) = (ker A)ᗮ`.
- **PD-A35 — Normal commutation.** For a normal finite-dimensional endomorphism `A`,
  `A` commutes with `operatorAbs A`.

**Complete-space modulus.**

- **PD-A36 — Complete rectangular modulus.** For a bounded `T : E →L[𝕜] F` on complete
  `RCLike` Hilbert spaces, define `ContinuousLinearMap.modulus T` as the positive square root of
  `T† ∘L T`.
- **PD-A37 — Positivity of the complete modulus.** `modulus T` is positive.
- **PD-A38 — Self-adjointness of the complete modulus.** `modulus T` is self-adjoint.
- **PD-A39 — Complete modulus square.** `modulus T ∘L modulus T = T† ∘L T`.
- **PD-A40 — Uniqueness of the complete modulus.** A positive symmetric square root of
  `T† ∘L T` equals `modulus T`.
- **PD-A41 — Complete modulus pointwise norm.** `‖modulus T x‖ = ‖T x‖`.
- **PD-A42 — Complete modulus kernel.** `ker (modulus T) = ker T`.
- **PD-A43 — Complete modulus operator norm.** `‖modulus T‖ = ‖T‖`.
- **PD-A44 — Precomposition norm law.** For `D : G →L[𝕜] E`,
  `‖modulus T ∘L D‖ = ‖T ∘L D‖`.
- **PD-A45 — Postcomposition norm law.** For `D : E →L[𝕜] G`,
  `‖D ∘L modulus T‖ = ‖D ∘L T†‖`.

**Agreement of constructions.**

- **PD-A46 — Finite calculus agrees with complex CFC.** Over `ℂ` in finite dimension, the
  finite self-adjoint functional calculus, transported to bounded operators, agrees with
  Mathlib's continuous functional calculus for continuous `f : ℝ → ℝ`.
- **PD-A47 — Finite and complete moduli agree.** In finite dimension over `RCLike`, transporting
  `LinearMap.operatorAbs A` to a bounded operator gives
  `ContinuousLinearMap.modulus A.toContinuousLinearMap`.
- **PD-A48 — Complex complete modulus agrees with `CFC.sqrt`.** Over `ℂ`,
  `modulus T = CFC.sqrt (T† ∘L T)`.
- **PD-A49 — Complex finite modulus agrees with `CFC.abs`.** For a finite-dimensional complex
  endomorphism `A`, transporting `operatorAbs A` to a bounded operator gives
  `CFC.abs A.toContinuousLinearMap`.

**Courant–Fischer and Weyl.**

- **PD-A50 — Eigenbasis quadratic form.** Express `re ⟪T x, x⟫` as the eigenvalue-weighted sum
  of squared eigenbasis coordinates.
- **PD-A51 — Courant–Fischer min–max formula.** The `k`-th sorted eigenvalue is the sup–inf of
  the Rayleigh quotient over `(k+1)`-dimensional subspaces.
- **PD-A52 — Eigenvalue monotonicity.** Loewner order between symmetric endomorphisms gives the
  corresponding pointwise order on their sorted eigenvalues.
- **PD-A53 — Weyl perturbation bound.** A symmetric perturbation moves every sorted eigenvalue by
  at most the operator norm of the perturbation.

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

- **PD-B01 — Star-monoid partial isometry.** Define `IsPartialIsometry u` by
  `u * star u * u = u` in a star monoid.
- **PD-B02 — Rectangular `LinearMap` partial isometry.** Define `LinearMap.IsPartialIsometry u`
  for `u : E →ₗ[𝕜] F` by `u ∘ₗ u† ∘ₗ u = u`.
- **PD-B03 — Endomorphism predicate agreement for `LinearMap`.** For `u : E →ₗ[𝕜] E`, the
  carrier predicate agrees with the star-monoid predicate.
- **PD-B04 — Rectangular bounded partial isometry.** Define
  `ContinuousLinearMap.IsPartialIsometry u` for `u : E →L[𝕜] F` by
  `u ∘L u† ∘L u = u`.
- **PD-B05 — Endomorphism predicate agreement for bounded operators.** For
  `u : E →L[𝕜] E`, the carrier predicate agrees with the star-monoid predicate.
- **PD-B06 — Initial projection of a partial isometry.** For a partial isometry `u`,
  `star u * u` is a star projection.
- **PD-B07 — Adjoint closure.** The adjoint of a partial isometry is a partial isometry.
- **PD-B08 — Isometries are partial isometries.** A linear isometry satisfies the corresponding
  partial-isometry predicate.
- **PD-B09 — Geometric characterization for `LinearMap`.** A rectangular finite-dimensional
  linear map is a partial isometry iff it preserves norms on `(ker u)ᗮ`.
- **PD-B10 — Geometric characterization for bounded operators.** A rectangular bounded operator
  is a partial isometry iff it preserves norms on `(ker u)ᗮ`.

**Finite-dimensional square polar decomposition.**

- **PD-B11 — Square polar factor.** Define `polarFactor A` by the map
  `operatorAbs A x ↦ A x` on `(ker A)ᗮ`, extended by zero on `ker A`.
- **PD-B12 — Polar-factor kernel.** `ker (polarFactor A) = ker A`.
- **PD-B13 — Polar-factor range.** `range (polarFactor A) = range A`.
- **PD-B14 — Polar factor is a partial isometry.** `polarFactor A` satisfies the rectangular
  partial-isometry predicate.
- **PD-B15 — Polar factor on the modulus range.** For every `x`,
  `polarFactor A (operatorAbs A x) = A x`.
- **PD-B16 — Square polar decomposition.** `A = polarFactor A ∘ₗ operatorAbs A`.

`PD-A35` supplies normal commutation of `A` with `operatorAbs A`.
- **PD-B17 — Canonical invertible polar unitary.** For invertible `A`, package the polar factor as
  a linear isometry equivalence `polarUnitaryEquiv`.
- **PD-B18 — Uniqueness in the invertible unitary-positive factorization.** For invertible `A`,
  its unitary factor in a unitary-times-positive polar factorization is the canonical polar unitary.
- **PD-B19 — Adjoint of the square polar factor.** `polarFactor A† = (polarFactor A)†`.
- **PD-B20 — Chosen finite-dimensional polar unitary.** For every finite-dimensional
  endomorphism, define a unitary extension `choosePolarUnitary A` of the polar factor.
- **PD-B21 — Finite-dimensional unitary polar decomposition.** Every finite-dimensional
  endomorphism satisfies `A = U ∘ₗ operatorAbs A` for some linear isometry equivalence `U`.

**Gram-contraction factorization.**

- **PD-B22 — Contractive factor from a Gram square root.** If self-adjoint `A` satisfies
  `A ∘L A = T† ∘L T`, then there is `W : E →L[𝕜] F` with
  `‖W‖ ≤ 1`, `‖W†‖ ≤ 1`, `W ∘L A = T`, and `W† ∘L T = A`.

**Complete-space rectangular polar decomposition.**

- **PD-B23 — Polar initial space.** Define `polarInitial M` as the closure of
  `range (modulus M)`.
- **PD-B24 — Rectangular polar factor.** Define `polarPartial M` as the isometry from
  `polarInitial M` determined by `modulus M x ↦ M x`, extended by zero on
  `(polarInitial M)ᗮ`.
- **PD-B25 — Rectangular polar factor is a partial isometry.** `polarPartial M` satisfies the
  bounded rectangular partial-isometry predicate.
- **PD-B26 — Rectangular polar decomposition.** `polarPartial M ∘L modulus M = M`.
- **PD-B27 — Isometry on the initial space.** For `x ∈ polarInitial M`,
  `‖polarPartial M x‖ = ‖x‖`.
- **PD-B28 — Vanishing on the initial complement.** For `x ∈ (polarInitial M)ᗮ`,
  `polarPartial M x = 0`.
- **PD-B29 — Initial-space kernel formula.** `(polarInitial M)ᗮ = ker M`.
- **PD-B30 — Polar-factor kernel.** `ker (polarPartial M) = (polarInitial M)ᗮ`.
- **PD-B31 — Initial projection formula.** `(polarPartial M)† ∘L polarPartial M` is the
  orthogonal projection onto `polarInitial M`.
- **PD-B32 — Polar final space.** Define `polarFinal M` as the closure of `range M`.
- **PD-B33 — Range of the polar factor.** `range (polarPartial M) = polarFinal M`.
- **PD-B34 — Final projection formula.** `polarPartial M ∘L (polarPartial M)†` is the
  orthogonal projection onto `polarFinal M`.
- **PD-B35 — Adjoint polar factor.** `polarPartial M† = (polarPartial M)†`.
- **PD-B36 — Uniqueness of the rectangular polar factor.** If
  `V ∘L modulus M = M` and `V` vanishes on `(polarInitial M)ᗮ`, then
  `V = polarPartial M`.

**Bounded-below and near-isometry rungs.**

- **PD-B37 — Bounded-below polar isometry.** When `modulus M` is a unit, define
  `polarIsometryOfIsUnitModulus M = M ∘L (modulus M)⁻¹`.
- **PD-B38 — Bounded-below polar identity.** Under the same hypothesis,
  `polarIsometryOfIsUnitModulus M ∘L modulus M = M`.
- **PD-B39 — Bounded-below isometry.** Under the same hypothesis,
  `polarIsometryOfIsUnitModulus M` preserves norms on the whole source space.
- **PD-B40 — Bounded-below comparison.** Under the same hypothesis,
  `‖M - polarIsometryOfIsUnitModulus M‖ ≤ ‖modulus M - 1‖`.
- **PD-B41 — Near-isometry square-root estimate.** For a real finite-dimensional `M` whose
  quadratic form is uniformly `δ`-close to the identity with `δ < 1`, the positive square root
  `S` of `M†M` satisfies `‖S x - x‖ ≤ δ ‖x‖`.
- **PD-B42 — Near-isometry factorization.** Under the same hypothesis,
  `M = W ∘ₗ S` for a linear isometry equivalence `W`.
- **PD-B43 — Near-isometry operator bound.** If additionally `δ ≤ 1 / 2`, then
  `‖M - W‖ ≤ 2δ` for the factor `W` in `PD-B42`.

**Davis intertwining unitary.**

- **PD-B44 — Complete orthogonal projection family.** Define a finite family of star projections
  with pairwise-orthogonal ranges and sum equal to the identity.
- **PD-B45 — Davis non-degeneracy.** Define the condition that `P'ⱼ` is injective on
  `range Pⱼ` for every block `j`.
- **PD-B46 — Intertwining unitary.** Under `PD-B45`, construct the unitary assembled from the
  block polar factors of `P'ⱼ Pⱼ`.
- **PD-B47 — Intertwining equation.** The unitary in `PD-B46` satisfies
  `U ∘ₗ Pⱼ = P'ⱼ ∘ₗ U` for every `j`.

**Milestone — the Gram-contraction and polar decompositions.** `PD-B01`–`PD-B40`.

**Milestone — the near-isometry factorization.** `PD-B41`–`PD-B43`.

**Milestone — Davis's intertwining unitary.** `PD-B44`–`PD-B47`.

### Part C — singular values and the singular system

Mathlib has `LinearMap.singularValues`. This Part supplies the bounded-operator accessor, the
rectangular Gram-spectrum bridge, the singular vectors, and the Moore–Penrose inverse.

**Singular-value accessor and spectrum bridge.**

- **PD-C01 — Bounded-operator singular-value accessor.** For a finite-dimensional bounded
  operator `T`, define `ContinuousLinearMap.singularValues T` by
  `T.toLinearMap.singularValues`.
- **PD-C02 — Accessor agreement.** The bounded-operator accessor agrees definitionally with
  `T.toLinearMap.singularValues`.
- **PD-C03 — Source Gram symmetry.** `A†A` is symmetric.
- **PD-C04 — Source Gram positivity.** `A†A` is positive.
- **PD-C05 — Target Gram symmetry.** `AA†` is symmetric.
- **PD-C06 — Target Gram positivity.** `AA†` is positive.
- **PD-C07 — Rectangular Gram-spectrum bridge.** The sorted eigenvalue lists of `A†A` and
  `AA†` agree at every index below both dimensions, with zero extension beyond the common rank.
- **PD-C08 — Adjoint invariance of singular values.** `singularValues A† = singularValues A`.

**Singular system.**

- **PD-C09 — Right singular basis.** Define `rightSingularBasis A` as the sorted orthonormal
  eigenbasis of `A†A`.
- **PD-C10 — Left singular vectors.** Define
  `leftSingularVector A i = σᵢ⁻¹ • A (rightSingularBasis A i)` using total field inversion.
- **PD-C11 — Right singular eigenvalue equation.** `A†A` acts on the `i`-th right singular vector
  by `σᵢ²`.
- **PD-C12 — Singular relation.** `A vᵢ = σᵢ • uᵢ`, including indices with `σᵢ = 0`.
- **PD-C13 — Orthonormality of nonzero left singular vectors.** The family `uᵢ` over
  `σᵢ ≠ 0` is orthonormal.
- **PD-C14 — Left singular eigenvalue equation.** For `σᵢ ≠ 0`, `AA†` acts on `uᵢ` by `σᵢ²`.
- **PD-C15 — Adjoint singular relation.** For `σᵢ ≠ 0`, `A† uᵢ = σᵢ • vᵢ`.
- **PD-C16 — Singular expansion on vectors.** Express `A x` as the sum of its singular
  components relative to the constructed singular system.
- **PD-C17 — Rank-one reconstruction.** `A = ∑ᵢ σᵢ • rankOne uᵢ vᵢ`.
- **PD-C18 — Completion of the left singular family.** The nonzero left singular vectors extend
  to an orthonormal basis of the codomain.

### The Moore–Penrose interface

The four Penrose conditions are packaged in one `Prop`-valued structure with named fields:

```text
A B A = A     B A B = B     (A B)⋆ = A B     (B A)⋆ = B A
```

- **PD-C19 — Moore–Penrose predicate.** Define `IsMoorePenroseInverse A B` with the four Penrose
  conditions as named fields.
- **PD-C20 — Moore–Penrose construction.** Define `moorePenroseInverse A` from the singular system
  for every map between finite-dimensional `RCLike` inner-product spaces.
- **PD-C21 — Penrose conditions for the construction.** `moorePenroseInverse A` satisfies
  `IsMoorePenroseInverse A`.
- **PD-C22 — Uniqueness of Moore–Penrose inverses.** Two operators satisfying
  `IsMoorePenroseInverse A` are equal.
- **PD-C23 — Characterization by the construction.** Every `B` satisfying
  `IsMoorePenroseInverse A B` equals `moorePenroseInverse A`.
- **PD-C24 — Adjoint compatibility.** `IsMoorePenroseInverse A B` is equivalent to
  `IsMoorePenroseInverse A† B†`.
- **PD-C25 — Injective case.** If `A` is injective, then `A⁺ A = 1`.
- **PD-C26 — Surjective case.** If `A` is surjective, then `A A⁺ = 1`.
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
`PD-B03` and `PD-B05`; exercise the initial-space identity `PD-B18`.

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

**PD-B18** is the map `|M| x ↦ M x`, extended by continuity to the closure of `range |M|` and
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
