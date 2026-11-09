# Roadmap: theta invariants of euclidean lattices

**Summary.** Build the theta invariants of a Euclidean lattice, a discrete subgroup `L` of a
finite-dimensional real inner product space `E` (Mathlib's `Submodule ℤ E` with
`DiscreteTopology L`, full when `IsZLattice ℝ L`), and of an Arakelov divisor of a number field. The
invariant is `h⁰_θ(L) = log ∑_(v ∈ L) exp(−π‖v‖²)`, with `h¹_θ(L) = h⁰_θ(L^∨)` for the dual lattice
`L^∨ = ZLattice.dual L` (Bost 2020). The end theorems are: for a full lattice, the
Poisson–Riemann–Roch formula `h⁰_θ(L) − h¹_θ(L) = −log covol(L)` (1.2); `h⁰_θ(L) ≥ 0`, with equality
exactly for `L = 0` (1.3); monotonicity under injective linear contractions, with equality exactly
for an isometric bijection (1.4), and under passage to a subgroup of finite index (1.5); additivity
on orthogonal sums (1.6); Jacobi's relation `K(√(1 − θ₄(0|it)⁴/θ₃(0|it)⁴)) = ½π θ₃(0|it)²` for every
`t > 0` (1.7) and `h⁰_θ(ℤ) = log(π^(1/4)/Γ(3/4))` (1.8); for a full lattice and `x ∈ E`, the
Gaussian mass of `x + L` equals that of `L` exactly when `x ∈ L` (2.1); for a full lattice `L` and a
subspace `K` spanned by `L ∩ K`, the fibre bound over the projected lattice (2.2) and the
subadditivity `h^i_θ(L) ≤ h^i_θ(L ∩ K) + h^i_θ(π_(K^⊥)(L))` for `i = 0, 1`, with equality for
`i = 0` exactly when `π_(K^⊥)(L) ⊆ L` (2.3, 2.4); for a full lattice of positive rank `n` whose
nonzero vectors have norm at least `r`, the upper bound
`exp h⁰_θ(L) − 1 ≤ 3ⁿ(1 − n/(2πr²))⁻¹ exp(−πr²)` when `r > 0` and `n < 2πr²` (3.1) and its
Banaszczyk form (3.2), and the bound on the mass of a coset outside a ball (3.3); for a number field
`K` and an Arakelov divisor `D = (I, x)` (ArakelovGeometryAndAbelianHeights §1.7), `I` a nonzero
fractional ideal and `x` real numbers at the infinite places, with `h⁰(D)` the logarithm of the
theta sum of `I` for the metric of `D`, LFunctions' `latticeTheta` at the parameter of `x` (4.1),
the invariance of `h⁰(D)` under principal divisors (4.2), the Riemann–Roch formula
`h⁰(D) − h⁰(κ − D) = deg D − ½ log|Δ_K|` (4.3), the decay `h⁰(D) ≤ β exp(−πn exp(−2 deg D/n))` in
degree at most `½ log|Δ_K|` (4.4), and the bound `h⁰(D) ≤ deg D + h⁰(𝓞_K)` in nonnegative degree
under the hypothesis that `h⁰` on divisors of degree zero is largest at `𝓞_K` (4.5).

Suggested home: `TauCeti/NumberTheory/ThetaInvariants/`, beside Tau Ceti's
`TauCeti/Algebra/Module/ZLattice/`.

## Scope and ownership

**Owned here.** The invariants `h⁰_θ` and `h¹_θ` of a discrete subgroup of a Euclidean space and
their theory as functions of the lattice: the Poisson–Riemann–Roch formula, positivity, monotonicity
and the finite-index comparison, orthogonal sums, Jacobi's relation on the imaginary axis and the
value at `ℤ` (Layer 1); the equality case of the coset bound, the fibre bound and the subadditivity
of `h⁰_θ` and `h¹_θ` in admissible extensions with the equality case (Layer 2); the bounds of `h⁰_θ`
by the first minimum and the shifted Gaussian tail at every radius (Layer 3); the invariant `h⁰` of
van der Geer and Schoof for Arakelov divisors of a number field, read as the logarithm of
LFunctions' theta series of an ideal lattice, its invariance under principal divisors, its
Riemann–Roch formula and its two bounds by the degree (Layer 4).

**Left to other roadmaps.**

- *Poisson summation over a full lattice, the dual lattice, the Gaussian and the theta series on the
  upper half-plane* are ThetaSeries' (Layers 1–3) and are landed in Tau Ceti; they are consumed
  under their Tau Ceti names. The theta series of a lattice as a modular form is not used.
- *The Gaussian sums `ρ_s(L + u)`, their Poisson identity, the coset inequality
  `ρ_s(L + u) ≤ ρ_s(L)`, the scale bound, the shifted tail bound at radius `√n`, the unshifted tail
  bound `gaussian_variable_tail` at every radius `c√n` and the transference theorems* are
  GeometryOfNumbersAndQuadraticArithmetic's (§§4.4.4–4.4.14, `gaussian_variable_tail` with
  §4.4.13), and so are the discreteness and fullness of a projected lattice (§0.2.2) and its
  covolume (§0.3.1). The Gaussian sum `ρ_1(L)` of §4.4.4 is the sum whose logarithm 1.1 takes, the
  route of 3.2 is `gaussian_variable_tail`, and the route of 3.3 is the scale bound of §4.4.8. This
  roadmap adds the equality case of the coset inequality (2.1) and the shifted tail bound at every
  radius (3.3), which differs from `gaussian_variable_tail` only by the shift `x ∈ E`, with coset
  factor one; it works at `s = 1`, where `ρ_1(L) = exp h⁰_θ(L)`.
- *Lattice-point counts in convex bodies by the successive minima* are SieveMethodsAndPrimePatterns'
  (§0.11a); the route of 3.1 uses its first-minimum bound for a closed ball.
- *Hermitian vector bundles over `Spec 𝓞_K` and their Arakelov degree* are
  ArakelovGeometryAndAbelianHeights' (§§1.1–1.6), and *Arakelov divisors, their degree, principal
  divisors, the bundle `O(D)` and the compactified Picard group* are its §1.7. Layer 4 uses only the
  data of an Arakelov divisor, a nonzero fractional ideal and a real number at each infinite place,
  and the theta invariants of hermitian vector bundles of higher rank over `𝓞_K` are not stated
  here.
- *The ideal lattice of a fractional ideal, its Euclidean dual, the theta series `latticeTheta`
  with one parameter per infinite place and its transformation law* are LFunctions' (Layer 1).
  Layer 4 reads `h⁰` as the logarithm of `latticeTheta` at the parameter of a divisor, in the
  normalisation of van der Geer and Schoof, and owns only that parameter.

The boundary in one sentence: the logarithmic theta invariants, their inequalities and their
equality cases are here; Poisson summation, theta series, Gaussian transference and Arakelov
degrees of bundles are with their owners.

## Conventions

- **Carriers.** `E` is a real inner product space, finite-dimensional wherever a sum must converge;
  a lattice is `L : Submodule ℤ E` with `[DiscreteTopology L]`, full when `[IsZLattice ℝ L]`. The
  rank of a full lattice is `n = finrank ℝ E`. The dual is Tau Ceti's
  `ZLattice.dual L = LinearMap.BilinForm.dualSubmodule (innerₗ E) L`, the vectors with integral
  inner product against `L`. Witness: `ZLattice.dual (2ℤ) = ½ℤ` in `ℝ`.
- **Normalisation of the Gaussian.** The weight is `exp(−π‖v‖²)`, whose Fourier transform for
  Mathlib's `𝓕` is itself; `h⁰_θ` is the logarithm of a `tsum`. Witness: with the weight
  `exp(−‖v‖²)`, `log ∑_(2ℤ) − log ∑_(½ℤ) = −1.22954`, whereas 1.2 gives `−log 2 = −0.69315` for
  `exp(−π‖v‖²)`. The value `h⁰_θ(L)` is the logarithm of Tau Ceti's `ZLattice.thetaSeries L` at
  `UpperHalfPlane.I`, a positive real number, since its exponent is `π i ‖v‖² τ`.
- **Degree.** The Arakelov degree of a full lattice is `deg L = −log covol(L)`, with Mathlib's
  `ZLattice.covolume` for the volume of `E` normalised by orthonormal bases (Bost, §2.1.1).
  Witness: `deg ℤⁿ = 0`, `deg(2ℤ) = −log 2`.
- **Admissible extensions.** For a full `L` and a subspace `K ⊆ E`, the sublattice is
  `L ∩ K = L.comap (K.subtype.restrictScalars ℤ) : Submodule ℤ K` and the quotient lattice is the
  image `π_(K^⊥)(L) : Submodule ℤ K^⊥` under `K^⊥.orthogonalProjectionOnto`. The extension is
  admissible when `L ∩ K` spans `K` over `ℝ`, which is the hypothesis `hK` of Layer 2; the quotient
  lattice is then discrete and full in `K^⊥` (GeometryOfNumbersAndQuadraticArithmetic §0.2.2
  `projected_adapted_basis`, on the adapted basis of its §0.2.1). Witness: for `ℤ²` and
  `K = ℝ(1, 1)`, `L ∩ K = ℤ(1, 1)` and `π_(K^⊥)(ℤ²) = ℤ(½, −½)`; for `K = ℝ(1, √2)`,
  `L ∩ K = 0` does not span `K`.
- **Arakelov divisors** are ArakelovGeometryAndAbelianHeights §1.7's pairs `(𝔞, λ)`, with their
  degree `deg^(𝔞, λ) = log N(𝔞) + ∑_v λ_v`, their principal divisors
  `(f) = (f𝓞_K, v ↦ −mult v · log|f|_v)` and the bundle
  `O(D) = (𝔞⁻¹, ‖·‖_v = e^(−λ_v/mult v)|·|_v)`.
  Following van der Geer and Schoof (§2), this roadmap writes `D = (I, x)` by the module of `O(D)`,
  `I = 𝔞⁻¹ : FractionalIdeal (𝓞 K)⁰ K`, and `x = λ : InfinitePlace K → ℝ`; so
  `deg D = ∑_v x_v − log N(I)` with `N = FractionalIdeal.absNorm`, adding `(f)` replaces `I` by
  `f⁻¹I`, and the metric of `O(D)` gives `‖f‖²_D = ∑_σ exp(−2x_v/mult v)|σ f|²` over the embeddings
  `σ : K →+* ℂ`, `v` the place of `σ`, so a complex place carries `2 exp(−x_v)|z|²`. The canonical
  divisor `κ` has ideal the inverse different and `x = 0`, so `κ − D = (I^*, −x)` with `I^*` the
  trace dual `FractionalIdeal.dual ℤ ℚ I`, and `deg κ = log|Δ_K|`. Witness: over `ℚ`, `(2)` sends
  `(ℤ, x)` to `(½ℤ, x − log 2)`, of the same degree `x`.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `Mathlib/Algebra/Module/ZLattice/Basic.lean` and `…/Covolume.lean`: `IsZLattice`,
  `ZLattice.covolume`; `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`:
  `LinearMap.BilinForm.dualSubmodule`; `innerₗ`.
- `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`: `Submodule.orthogonalProjectionOnto`,
  `Submodule.starProjection`, `Submodule.HasOrthogonalProjection`;
  `Mathlib/Analysis/InnerProductSpace/ProdL2.lean`: the inner product of `WithLp 2 (E × F)`,
  `WithLp.linearEquiv`.
- `Mathlib/GroupTheory/Index.lean`: `AddSubgroup.relIndex`;
  `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`: `Real.Gamma`;
  `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean`: `Real.Gamma_mul_Gamma_one_sub`;
  `Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean`:
  `Real.tsum_exp_neg_mul_int_sq`;
  `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`: `jacobiTheta`;
  `Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`: `NNReal.agm`,
  `NNReal.agm_mul_distrib`, `NNReal.agm_eq_agm_gm_am`, `NNReal.min_le_agm`, `NNReal.agm_le_max`.
- `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: `NumberField.InfinitePlace`,
  `InfinitePlace.mk`, `InfinitePlace.mult`;
  `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`:
  `NumberField.discr`; `Mathlib/RingTheory/DedekindDomain/Different.lean`: `FractionalIdeal.dual`;
  `Mathlib/RingTheory/FractionalIdeal/Norm.lean`: `FractionalIdeal.absNorm`;
  `FractionalIdeal.spanSingleton`; `Mathlib/NumberTheory/NumberField/ClassNumber.lean`:
  `NumberField.RingOfIntegers.instFintypeClassGroup`;
  `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`:
  `NumberField.Units.unitLattice_rank`.

**From Tau Ceti** (at the pinned revision).

- `TauCeti/Algebra/Module/ZLattice/Dual.lean`: `ZLattice.dual`, its `DiscreteTopology` and
  `IsZLattice` instances, `ZLattice.dual_dual`, `ZLattice.mem_dual`.
- `TauCeti/Algebra/Module/ZLattice/Covolume.lean`: `ZLattice.covolume_dual`.
- `TauCeti/Analysis/Fourier/PoissonSummation.lean`: `SchwartzMap.tsum_eq_tsum_dual_fourier`;
  `TauCeti/Analysis/Distribution/SchwartzSpace/ZLattice.lean`: `ZLattice.summable_poisson_left`,
  `ZLattice.summable_poisson_right`; `TauCeti/Analysis/Distribution/SchwartzSpace/Gaussian.lean`:
  `SchwartzMap.gaussian`; `TauCeti/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean`:
  `TauCeti.fourier_gaussian_of_im_pos`.
- `TauCeti/Algebra/Module/ZLattice/Summable.lean`: `ZLattice.summable_exp_neg_mul_norm_add_sq`;
  `TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean`: `ZLattice.thetaSeries` (Checks).
- `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Legendre.lean`: `TauCeti.Real.legendreK`;
  `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Lemniscate.lean`:
  `TauCeti.Real.legendreK_one_div_sqrt_two`;
  `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Gauss.lean`:
  `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`.

**From GeometryOfNumbersAndQuadraticArithmetic.**

- §4.4.4 `latticeGaussianSum`: `ρ_s(L + u) = ∑_(x ∈ L) exp(−π‖x + u‖²/s²)`, read at `s = 1`,
  `u = 0` by 1.1.
- §4.4.6: the Poisson identity `ρ_s(L + u) = covol(L)⁻¹ sⁿ ∑_(y ∈ L^∨) ρ_(1/s)(y) e(⟨y, u⟩)`.
- §4.4.7 `gaussian_shift_le`: `ρ_s(L + u) ≤ ρ_s(L)`.
- §4.4.8 `gaussian_scale_le`: `ρ_s(L + u) ≤ sⁿ ρ_1(L)` for `s ≥ 1`.
- §4.4, with §4.4.13, `gaussian_variable_tail`: for `n ≥ 1` and `c ≥ (2π)^(−1/2)`, the mass of
  `ρ_1` on the `v ∈ L` with `‖v‖ ≥ c√n` is at most `b(c)ⁿ ρ_1(L)`, `b(c) = c(2πe)^(1/2) exp(−πc²)`.
- §0.2.2 `projected_adapted_basis`: the projection `π_(K^⊥)(L)` of a full lattice along an
  admissible `K` is discrete and full in `K^⊥`.
- §0.3.1 `covolume_projection`: `covol(π_(K^⊥)(L)) = covol(L)/covol(L ∩ K)` for an admissible `K`.

**From SieveMethodsAndPrimePatterns.**

- §0.11a, the first-minimum bound: `|L ∩ K| ≤ (⌊2/λ₀⌋ + 1)^d` for a full lattice `L` of a real
  normed space of dimension `d ≥ 1`, a symmetric convex body `K` and the first minimum `λ₀` of `L`
  with respect to `K`.

**From ArakelovGeometryAndAbelianHeights.**

- §1.7: Arakelov divisors `(𝔞, λ)` of `Spec 𝓞_K`, their degree, principal divisors and the bundle
  `O(D)`, and the exact sequence `0 → ℝ^(r₁+r₂)/log|𝓞_Kˣ| → Pic^(𝓞_K) → Cl(K) → 0`.

**From LFunctions.**

- Layer 1: the ideal lattice of a fractional ideal in the Euclidean model of the mixed space, the
  comparison `coe_dualIdealLattice` of its Euclidean dual with the trace dual, the theta series
  `latticeTheta` with one parameter per infinite place and its transformation law
  `latticeTheta_inv`.

## How to read the build

Layer 1 defines `h⁰_θ` and `h¹_θ` and proves the Poisson–Riemann–Roch formula from Tau Ceti's
Poisson summation (1.2); positivity (1.3), monotonicity (1.4), the finite-index comparison (1.5) and
orthogonal sums (1.6) follow from the definition and 1.2; 1.7 is Jacobi's relation between
`jacobiTheta` on the imaginary axis and `K`, from Tau Ceti's AGM formula for `K`; at `t = 1` its
modulus is `1/√2`, and with Tau Ceti's value of `K(1/√2)` it gives the value at `ℤ` (1.8). Layer 2
proves the equality case of the coset bound (2.1) from the same Poisson expansion, the fibre bound
(2.2) from 2.1's inequality, and subadditivity with its equality case (2.3) from 2.2 and 2.1; 2.4 is
2.3 read through 1.2 and the covolume of a projection. Layer 3 bounds `h⁰_θ` by the first minimum,
by SieveMethodsAndPrimePatterns' count of lattice points in balls (3.1) and by
GeometryOfNumbersAndQuadraticArithmetic's unshifted tail bound (3.2), and proves the shifted tail
bound (3.3) from that roadmap's scale bound. Layer 4 passes to number fields: `h⁰` of an Arakelov
divisor is the logarithm of LFunctions' `latticeTheta` of its ideal lattice at the parameter of the
divisor, which is `h⁰_θ` of the Euclidean lattice `O(D)`, 4.2 is a change of variable, 4.3 is
LFunctions' transformation law, 4.4 uses the compactness of the classes of degree `½ log|Δ_K|`, and
4.5 combines 4.3 with a comparison of terms. The hardest targets are 2.3's equality case, 3.1 and
4.4.

## Layer 1: theta invariants and the Poisson–Riemann–Roch formula

### 1.1 The theta invariants

Define `h0θ L = log ρ_1(L)`, the logarithm of GeometryOfNumbersAndQuadraticArithmetic §4.4.4's
Gaussian sum `latticeGaussianSum` at `s = 1` and `u = 0`, that is `log ∑' v : L, exp(−π‖v‖²)`, and
`h1θ L = h0θ (ZLattice.dual L)` (Bost, (2.2.1) and (2.2.2), p. 13). The same countable sum is
read on every `L : Submodule ℤ E`, full or not, since 1.3–1.6 and Layer 2 apply `h0θ` to discrete
subgroups that do not span `E`. For a discrete `L` in a finite-dimensional `E` the series is
summable (Tau Ceti `ZLattice.summable_exp_neg_mul_norm_add_sq` at `x = 0`) and at least `1`. Bost
writes these for a Hermitian vector bundle over `Spec ℤ`, which is a Euclidean lattice. *Needs:*
GeometryOfNumbersAndQuadraticArithmetic §4.4.4; Tau Ceti `ZLattice.dual`,
`ZLattice.summable_exp_neg_mul_norm_add_sq`; Mathlib `tsum`, `Real.log`.

**API.**

- Summability: for `[FiniteDimensional ℝ E]` and `[DiscreteTopology L]`, the series
  `v ↦ exp(−π‖v‖²)` over `L` is summable (Tau Ceti `ZLattice.summable_exp_neg_mul_norm_add_sq` at
  `x = 0`), and its sum is at least `1`, the term at `0`.
- Under the same hypotheses `exp(h0θ L) = ∑' v : L, exp(−π‖v‖²)`; 3.1, 3.2 and 3.3 are stated with
  this sum.
- Invariance: for a linear isometric equivalence `φ : E ≃ₗᵢ[ℝ] F`, `h0θ (L.map φ) = h0θ L`, for
  every `L`, since `φ` restricts to a bijection `L → φ(L)` preserving the terms. Layer 2 reads
  `h0θ` of `L ∩ K ⊆ K` and of `π_(K^⊥)(L) ⊆ K^⊥` through it, and 4.1 reads `h⁰(D)` as `h0θ` of the
  Euclidean lattice `O(D)`.

**Checks.**

- `h0θ ⊥ = 0`: the only term is `exp 0 = 1`. A definition summing over `L ∖ {0}` would give
  `log 0 = 0` at `⊥` and `log 0.0864348 = −2.44836` at `ℤ`, negative, against 1.3.
- `h0θ (ℤ ⊂ ℝ) = log 1.0864348… = 0.0829015`, the logarithm of Tau Ceti's
  `ZLattice.thetaSeries ℤ UpperHalfPlane.I`; an exponent `2π` in place of `π` would give
  `log ∑ exp(−2πn²) = 0.0037279` instead, the value at `√2 ℤ`.
- `h1θ (2ℤ) = h0θ (½ℤ) = 0.6931542` while `h0θ (2ℤ) = 0.0000070`: `h¹_θ` is not `h⁰_θ` of the
  lattice itself; `h1θ ℤ = h0θ ℤ` since `ℤ` is its own dual.

### 1.2 The Poisson–Riemann–Roch formula

Prove `h0θ_sub_h1θ`: for a full lattice `L`, `h0θ L − h1θ L = −log (ZLattice.covolume L)` (Bost,
(2.1.6) and (2.2.3), p. 13; Groenewegen, Theorem 3.2, p. 146). Route: Tau Ceti
`SchwartzMap.tsum_eq_tsum_dual_fourier` at `v = 0` for `SchwartzMap.gaussian` with `b = π`, whose
transform is itself by `TauCeti.fourier_gaussian_of_im_pos` at `τ = i`; this is
GeometryOfNumbersAndQuadraticArithmetic §4.4.6 at `s = 1`, `u = 0`. Take logarithms; both sums are
at least `1`. *Needs:* GeometryOfNumbersAndQuadraticArithmetic §4.4.6; Tau Ceti
`SchwartzMap.tsum_eq_tsum_dual_fourier`, `SchwartzMap.gaussian`,
`TauCeti.fourier_gaussian_of_im_pos`; Mathlib `ZLattice.covolume`; 1.1.

**Checks.**

- `ℤ`: both sides are `0`, since `ℤ^∨ = ℤ` and `covol ℤ = 1`.
- `2ℤ`: `0.0000070 − 0.6931542 = −0.6931472 = −log 2`, Mathlib's `Real.tsum_exp_neg_mul_int_sq` at
  `a = 4`. The sign is load-bearing: `+log covol` would give `+0.69315`.
- Rank zero: `E = 0`, `L = ⊥ = L^∨`, covolume `1`, both sides `0`.

### 1.3 Positivity

Prove `h0θ_nonneg`: `0 ≤ h0θ L` for every `L : Submodule ℤ E`, and `h0θ_eq_zero_iff`:
`h0θ L = 0 ↔ L = ⊥` for a discrete `L` in a finite-dimensional `E` (Bost, Proposition 2.3.1,
p. 14). For `h0θ_nonneg`: when the series is summable its sum is at least the term `1` at `0`, and
otherwise the `tsum` is `0` and `log 0 = 0`. For `h0θ_eq_zero_iff`: the term at `0` is `1` and
every other term is positive. With 1.2 and the dual's instances this gives `h1θ L ≥ 0` and the
Riemann inequality `h0θ L ≥ −log covol L` for a full `L` (Bost, (2.3.2)), strict in positive rank.
*Needs:* 1.1; Tau Ceti `ZLattice.summable_exp_neg_mul_norm_add_sq`.

**Checks.**

- `h0θ (2ℤ) = 0.0000070 > 0` although `2ℤ` has no vector of norm below `2`.
- Riemann inequality at `ℤ²`: `0.1658030 ≥ 0`; at `½ℤ`: `0.6931542 ≥ log 2 = 0.6931472`, with
  difference `h1θ(½ℤ) = h0θ(2ℤ)`.
- `h0θ_eq_zero_iff` needs discreteness: for the non-discrete `ℤ + √2 ℤ ⊂ ℝ` the series diverges, its
  `tsum` is `0` and `h0θ = log 0 = 0 ≥ 0` although the subgroup is not `⊥`; `h0θ_nonneg` holds
  there.

Not a target: the minimisers of `h⁰_θ` among full lattices of rank `n` and covolume `1`. By 1.2
such a lattice has `h⁰_θ(L) = h¹_θ(L) = h⁰_θ(L^∨)`, so the dual of a minimiser is a minimiser. For
`n = 1` only `ℤ` has covolume `1`. For `n = 2` the hexagonal lattice is the unique minimiser
(Montgomery 1988, at `α = 1` for the forms of discriminant `−1`): `h⁰_θ = 0.1480710` against
`0.1658030` for `ℤ²`. For `n = 8` and `n = 24`, `E₈` and the Leech lattice are the unique
minimisers, since they are universally optimal (Cohn–Kumar–Miller–Radchenko–Viazovska 2022,
Theorem 1.4) and `exp(−πr²)` is a completely monotone function of `r²`. For `n = 3` the
covolume-`1` face-centred and body-centred cubic lattices are dual to each other, so they have the
same `h⁰_θ`, `0.2082624`, against `0.2487046` for `ℤ³` (own computation): a proof that the
face-centred lattice minimises would make the body-centred one a minimiser too.

### 1.4 Monotonicity under contractions

Prove `h0θ_le_of_contraction`: for `φ : E →ₗ[ℝ] F` with `‖φ x‖ ≤ ‖x‖`, `L : Submodule ℤ E`, a
discrete `M : Submodule ℤ F` in a finite-dimensional `F`, `φ` injective on `L` and `φ(L) ⊆ M`,
`h0θ L ≤ h0θ M`; and `h0θ_eq_of_contraction_iff`: equality holds exactly when `‖φ v‖ = ‖v‖` for
`v ∈ L` and `φ(L) = M` (Bost, Proposition 2.3.2 (1) and its equality case, p. 14). Route:
`exp(−π‖v‖²) ≤ exp(−π‖φ v‖²)` term by term, then injectivity and positivity of the terms of `M`;
`L` is discrete because `φ` is continuous and injective on `L` with discrete image. *Needs:* 1.1.

**Checks.**

- `φ = ½·id` on `ℝ` maps `ℤ` into `½ℤ`: `0.0829015 ≤ 0.6931542`; `φ = 2·id` maps `½ℤ` into `ℤ` and
  `0.6931542 > 0.0829015`, so the norm bound is needed.
- The projection `ℝ² → ℝ` to the first coordinate maps `ℤ²` onto `ℤ` and is a contraction, but
  `h0θ ℤ² = 0.1658030 > 0.0829015`: injectivity on `L` is needed.
- The inclusion `2ℤ ⊆ ℤ` is isometric and not onto: `0.0000070 < 0.0829015`, strict, as the
  equality case requires.

### 1.5 Subgroups of finite index

Prove `h0θ_sub_log_relIndex_le`: for `M ≤ L`, `L` discrete and `[L : M] = M.relIndex L ≠ 0`,
`h0θ L − log [L : M] ≤ h0θ M` (Bost, Corollary 2.3.4, p. 16). With 1.4 for the inclusion and 1.2 for
full lattices this gives `h1θ L ≤ h1θ M ≤ h1θ L + log [L : M]`. Route: split `L` into the
`[L : M]` cosets of `M` and bound each coset mass by that of `M`
(GeometryOfNumbersAndQuadraticArithmetic §4.4.7, in the real span of `L`). *Needs:*
GeometryOfNumbersAndQuadraticArithmetic §4.4.7; Mathlib `AddSubgroup.relIndex`; 1.1, 1.2, 1.4.

**Checks.**

- `2ℤ ⊆ ℤ`, index `2`: `0.0829015 − 0.6931472 = −0.6102457 ≤ 0.0000070 ≤ 0.0829015`.
- `h¹`: `h1θ ℤ = 0.0829015 ≤ h1θ (2ℤ) = 0.6931542 ≤ 0.0829015 + 0.6931472 = 0.7760487`.
- The hypothesis `[L : M] ≠ 0` is needed: for `M = ⊥ ≤ ℤ` the index is infinite, `relIndex` is
  `0`, `log 0 = 0`, and the inequality would read `0.0829015 ≤ 0`.

### 1.6 Orthogonal sums

Prove `h0θ_prod`: for discrete `L ⊆ E` and `M ⊆ F`, the lattice `L × M` in `WithLp 2 (E × F)` (the
comap of `L.prod M` along `WithLp.linearEquiv 2 ℤ (E × F)`) has `h0θ = h0θ L + h0θ M` (Bost,
Proposition 2.5.1, p. 18). Route: `‖(v, w)‖² = ‖v‖² + ‖w‖²` in `WithLp 2` and the product of two
summable series. *Needs:* Mathlib `WithLp.linearEquiv` and the inner product of `WithLp 2 (E × F)`;
1.1.

**Checks.**

- `h0θ ℤ² = 2 · 0.0829015 = 0.1658030`.
- The `ℓ²` norm is load-bearing: the Gaussian sum of `ℤ²` for the sup norm `max(|a|, |b|)` of
  `E × F` is `1.3457671`, of logarithm `0.2969642 ≠ 0.1658030`, because the four vectors
  `(±1, ±1)` get the weight `e^(−π)` instead of `e^(−2π)`.
- `L = ⊥`: `h0θ (⊥ × M) = h0θ M`.

### 1.7 Jacobi's relation on the imaginary axis

Prove `legendreK_eq_pi_div_two_mul_jacobiTheta_sq`: for `t > 0`, with `a(t) = jacobiTheta (t·i)`
and `b(t) = jacobiTheta (t·i + 1)`, which is `θ₄(0|it)` because `exp(πi n²) = (−1)ⁿ`, both real,
`K(√(1 − (b/a)⁴)) = ½π a²`, where `K = TauCeti.Real.legendreK` is the complete elliptic integral of
the first kind in the modulus (DLMF, 20.9.1 and 20.9.2 at `τ = it`, where `k² = 1 − (b/a)⁴` by
Jacobi's identity 20.7.5). In Lean `a` and `b` are the real parts of the two values. Route: Tau
Ceti `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`, `K(k) = π/(2 agm(1, √(1 − k²)))` for
`k² < 1`, with `√(1 − k²) = (b/a)²` and Mathlib `NNReal.agm_mul_distrib`, turns the claim into
`agm(a², b²) = 1`. The two duplication identities of the API below and Mathlib
`NNReal.agm_eq_agm_gm_am` make `agm(a(t)², b(t)²)` invariant under `t ↦ 2t`; as `t → ∞`, `a` and
`b` tend to `1`, and Mathlib `NNReal.min_le_agm` and `NNReal.agm_le_max` give `agm(a², b²) = 1`.
*Needs:* Mathlib `jacobiTheta`, `NNReal.agm`, `NNReal.agm_mul_distrib`, `NNReal.agm_eq_agm_gm_am`,
`NNReal.min_le_agm`, `NNReal.agm_le_max`; Tau Ceti `TauCeti.Real.legendreK`,
`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`.

**API.**

- Duplication: `a(t)² + b(t)² = 2a(2t)²` and `a(t)·b(t) = b(2t)²` for `t > 0`, both by the
  substitution `m = u + v`, `n = u − v` in the double series, which is a bijection of `ℤ²` onto the
  pairs with `m ≡ n mod 2` (the second is DLMF 20.7.11 at `z = 0`, with `q = e^(−πt)`).
- Positivity: `0 < b ≤ a`. The difference `a − b` is twice the sum of `exp(−πtn²)` over odd `n`;
  by the second identity `b(t) = b(2t)²/a(t) ≥ 0`, and `b(t) = 0` would give `b(2ᵏt) = 0` for every
  `k`, against `b(2ᵏt) → 1`. So `k² = 1 − (b/a)⁴` lies in `[0, 1)`.
- Limits: `a(t) → 1` and `b(t) → 1` as `t → ∞`, since `|a − 1|` and `|b − 1|` are at most
  `2∑_(n ≥ 1) exp(−πtn)`.

**Checks.**

- `t = ½`, `1`, `2`: `a² + b² = 2a(2t)²` reads `2.3606812`, `2.0149674`, `2.0000279` on both
  sides; `a·b = b(2t)²` reads `0.8346268`, `0.9925442`, `0.9999861` on both sides; and
  `K(√(1 − (b/a)⁴)) = ½π a²` reads `3.1651035`, `1.8540747`, `1.5825517` on both sides, with
  moduli `0.9851714`, `0.7071068`, `0.1715729`, each equal to `θ₂(0|it)²/θ₃(0|it)²`.
- The modulus is `√(1 − (b/a)⁴)`, not `√(1 − (b/a)²)`: at `t = 1` the latter gives
  `K = 1.7097562 ≠ 1.8540747`.
- The factor is `½π`: `π a(1)² = 3.7081494 ≠ 1.8540747`, and at `t = ½`,
  `π a(½)² = 6.3302069 ≠ 3.1651035`.

### 1.8 The value at `ℤ`

Prove `h0θ_span_one`: `h0θ (ℤ ∙ 1) = log(π^(1/4)/Γ(3/4))`, that is `∑_(n ∈ ℤ) exp(−πn²) =
π^(1/4)/Γ(3/4)` (van der Geer–Schoof, Proposition 4, the invariant `η(ℚ) = ω`). Route: the sum is
the real value `a(1) = jacobiTheta i` of 1.7. The duplication identities of 1.7 at `t = ½` and
`t = 1`, with `a(½)² = 2a(2)²` (Mathlib `Real.tsum_exp_neg_mul_int_sq` at `½`), give
`b(½)² = a(1)² − b(1)²` and then `b(1)⁴ = a(½)²b(½)² = a(1)⁴ − b(1)⁴`, so `a(1)⁴ = 2b(1)⁴` and the
modulus of 1.7 at `t = 1` is `√(1 − ½) = 1/√2`. Then 1.7 at `t = 1` and Tau Ceti
`TauCeti.Real.legendreK_one_div_sqrt_two`, `K(1/√2) = Γ(1/4)²/(4√π)`, give
`a(1)² = Γ(1/4)²/(2π^(3/2))`; Euler's reflection formula `Γ(1/4)Γ(3/4) = π√2` (Mathlib
`Real.Gamma_mul_Gamma_one_sub` at `1/4`) turns this into `π^(1/2)/Γ(3/4)²`; take the positive
square root. *Needs:* Mathlib `jacobiTheta`, `Real.tsum_exp_neg_mul_int_sq`, `Real.Gamma`,
`Real.Gamma_mul_Gamma_one_sub`; Tau Ceti `TauCeti.Real.legendreK_one_div_sqrt_two`; 1.1, 1.7 and
its API.

**Checks.**

- Numerically `π^(1/4)/Γ(3/4) = 1.0864348112133` and `1 + 2∑_(n ≥ 1) exp(−πn²) = 1.0864348112133`.
- By 1.2 the same constant gives `h0θ (cℤ)` and `h0θ (c⁻¹ℤ)` differing by `−log c` for every
  `c > 0`; at `c = 1` they agree, consistent with `ℤ = ℤ^∨`.
- `Γ(1/4)` in place of `Γ(3/4)` gives `π^(1/4)/Γ(1/4) = 0.3672031`, below `1`, impossible for a sum
  containing the term `1`.

### Examples

- `h0θ (aℤ)` decreases from `+∞` to `0` as `a` runs over `(0, ∞)`, with `h0θ (aℤ) − h0θ (a⁻¹ℤ) =
  −log a` by 1.2, as van der Geer and Schoof draw for `ℚ` (§3, Fig. 2).
- For `A₂` and `D₄`, `h0θ` is the logarithm of the theta series of ThetaSeries' Layer 8 at
  `τ = i`.

### Dependencies

Mathlib: `ZLattice.covolume`, `IsZLattice`, `WithLp`, `AddSubgroup.relIndex`, `jacobiTheta`,
`Real.tsum_exp_neg_mul_int_sq`, `NNReal.agm` and its lemmas, `Real.Gamma`,
`Real.Gamma_mul_Gamma_one_sub`. Tau Ceti: `ZLattice.dual`, Poisson summation and the Gaussian
(`TauCeti/Analysis`), `TauCeti.Real.legendreK`, `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`
and `TauCeti.Real.legendreK_one_div_sqrt_two`. GeometryOfNumbersAndQuadraticArithmetic §§4.4.4,
4.4.6 and 4.4.7.

## Layer 2: cosets and admissible extensions

### 2.1 The coset bound and its equality case

Prove `tsum_exp_add_eq_tsum_exp_iff`: for a full lattice `L` and `x ∈ E`,
`∑_(v ∈ L) exp(−π‖x + v‖²) = ∑_(v ∈ L) exp(−π‖v‖²)` if and only if `x ∈ L` (Bost, (2.1.7), p. 13;
Groenewegen, Lemma 5.2, p. 148). The inequality `≤` for every `x` is
GeometryOfNumbersAndQuadraticArithmetic §4.4.7 at `s = 1`. Route: by Poisson summation the left
side is `covol(L)⁻¹ ∑_(y ∈ L^∨) exp(−π‖y‖²) cos(2π⟨x, y⟩)`; equality forces `⟨x, y⟩ ∈ ℤ` for every
`y ∈ L^∨`, so `x ∈ (L^∨)^∨ = L` (Tau Ceti `ZLattice.dual_dual`). *Needs:*
GeometryOfNumbersAndQuadraticArithmetic §4.4.6 and §4.4.7; Tau Ceti `ZLattice.dual_dual`,
`ZLattice.mem_dual`.

**Checks.**

- `L = ℤ`, `x = ½`: `0.9135791 < 1.0864348`, strict; `x = 1`: equal, as the coset is `ℤ`.
- `L = ℤ²`, `x = (½, 0)`: `0.9135791 · 1.0864348 = 0.9925442 < 1.1803406`.
- Rank zero: `x = 0 ∈ ⊥` and both sides are `1`.

### 2.2 The fibre bound

Prove `tsum_fibre_le`: for a full `L`, a subspace `K` with `L ∩ K` spanning `K`, and `g ∈ K^⊥`, the
Gaussian mass of `{v ∈ L | π_(K^⊥)(v) = g}` is at most `exp(−π‖g‖²) · ∑_(e ∈ L ∩ K) exp(−π‖e‖²)`
(Bost, Lemma 2.8.2, p. 25). Route: the fibre is `f₀ + (L ∩ K)` for any `f₀` in it, and
`‖f₀ + e‖² = ‖g‖² + ‖δ + e‖²` with `δ = π_K(f₀)`; apply 2.1's inequality to `L ∩ K` in `K` at `δ`.
An empty fibre gives `0`. *Needs:* 2.1; GeometryOfNumbersAndQuadraticArithmetic §4.4.7; Mathlib
`Submodule.orthogonalProjectionOnto`.

**Checks.**

- `ℤ²`, `K = ℝe₁`, `g = e₂`: the fibre is `ℤ × {1}`, of mass `e^(−π) · 1.0864348`, equality.
- `ℤ²`, `K = ℝ(1, 1)`, `g = (½, −½)`: the fibre is `{(a, b) | a − b = 1}`, of mass
  `e^(−π/2) · 0.4157606`, below `e^(−π/2) · 1.0037349`, where `1.0037349` is the mass of `ℤ(1, 1)`:
  strict.
- `K = ⊤`: `K^⊥ = 0`, `g = 0`, the fibre is `L` and both sides are its mass.

### 2.3 Subadditivity of `h⁰_θ`

Prove `h0θ_le_h0θ_add_h0θ`: for a full `L` and a subspace `K` with `L ∩ K` spanning `K`,
`h0θ L ≤ h0θ (L ∩ K) + h0θ (π_(K^⊥)(L))`, and `h0θ_eq_h0θ_add_h0θ_iff`: equality holds exactly when
`K^⊥.starProjection v ∈ L` for every `v ∈ L`, that is when `L = (L ∩ K) ⊕ (L ∩ K^⊥)` orthogonally
(Bost, Proposition 2.8.1, p. 25; Groenewegen, Lemma 5.3, p. 149). Route: sum 2.2 over
`g ∈ π_(K^⊥)(L)`; equality forces equality in every fibre, hence by 2.1 `π_K(f₀) ∈ L ∩ K` for every
`f₀ ∈ L`. *Needs:* 2.1; 2.2; GeometryOfNumbersAndQuadraticArithmetic §0.2.2
`projected_adapted_basis` (`π_(K^⊥)(L)` discrete); Mathlib `Submodule.starProjection`.

**Checks.**

- `ℤ²`, `K = ℝ(1, 1)`: `0.1658030 < h0θ ℤ(1, 1) + h0θ ℤ(½, −½) = 0.0037279 + 0.3503015 = 0.3540294`,
  strict, and `π_(K^⊥)(1, 0) = (½, −½) ∉ ℤ²`.
- `ℤ²`, `K = ℝe₁`: `0.1658030 = 0.0829015 + 0.0829015`, the split case.
- The span hypothesis is needed: for `K = ℝ(1, √2)`, `L ∩ K = 0` and `π_(K^⊥)(ℤ²)` is dense in the
  line `K^⊥`, its series diverges, `h0θ = log 0 = 0`, and the inequality would read `0.1658 ≤ 0`.

### 2.4 Subadditivity of `h¹_θ`

Prove `h1θ_le_h1θ_add_h1θ`: under the hypotheses of 2.3,
`h1θ L ≤ h1θ (L ∩ K) + h1θ (π_(K^⊥)(L))`, the duals taken in `K` and in `K^⊥` (Bost, (2.8.3),
p. 25). Route: `deg L = deg (L ∩ K) + deg π_(K^⊥)(L)` by
GeometryOfNumbersAndQuadraticArithmetic §0.3.1, and 1.2 in `E`, `K` and `K^⊥` turn 2.3 into the
same inequality for `h¹_θ`, with the same defect; 1.2 in `K^⊥` applies because `π_(K^⊥)(L)` is
discrete and full there. *Needs:* 1.2; 2.3; GeometryOfNumbersAndQuadraticArithmetic §0.2.2
`projected_adapted_basis` and §0.3.1.

**Checks.**

- `ℤ²`, `K = ℝ(1, 1)`: the duals are `ℤ(½, ½)` in `K` and `ℤ(1, −1)` in `K^⊥`, so
  `0.1658030 < 0.3503015 + 0.0037279`: the defect `0.1882264` is that of 2.3.
- Duals taken in `E` would be wrong: the ambient dual of `ℤ(1, 1)` contains the line `K^⊥` and is
  not discrete.
- `K = 0`: `L ∩ K = 0`, `π_(K^⊥)(L) = L`, equality.

### Examples

- For `L = ℤ(1, 0) + ℤ(c, 1)` and `K = ℝe₁`, the defect of 2.3 is positive exactly when `c ∉ ℤ`, and
  equals `−log` of Bost's ratio `Gext(T)/Gext(0)` of his Proposition 2.8.3 at `T = c`.

### Dependencies

Layer 1. GeometryOfNumbersAndQuadraticArithmetic §0.2.2, §0.3.1, §4.4.6 and §4.4.7. Mathlib:
`Submodule.orthogonalProjectionOnto`, `Submodule.starProjection`.

## Layer 3: theta invariants and the first minimum

### 3.1 The bound by the first minimum

Prove `exp_h0θ_sub_one_le_of_le_norm`: for a full lattice `L` of rank `n ≥ 1` and `r > 0` with
`r ≤ ‖v‖` for every nonzero `v ∈ L` and `n < 2πr²`,
`exp(h0θ L) − 1 ≤ 3ⁿ (1 − n/(2πr²))⁻¹ exp(−πr²)` (Bost, Proposition 2.6.2, (2.6.4) and (2.6.6),
p. 21; cf. Groenewegen, Proposition 4.4, p. 148, the weaker bound
`1 + 3ⁿπ(π − log 3)⁻¹ exp(−πλ²)` for `λ₁ ≥ √n`). Route: `θ_L(1) = π ∫_0^∞ N_L(√u) e^(−πu) du`
(Bost, Proposition 2.6.1) with `N_L(ρ) = #{v ∈ L | ‖v‖ ≤ ρ} ≤ (⌊2ρ/λ₁⌋ + 1)ⁿ ≤ (2ρ/r + 1)ⁿ`, the
first-minimum bound of SieveMethodsAndPrimePatterns §0.11a for `K` the closed `ρ`-ball, whose first
minimum is `λ₁/ρ`; then the incomplete Gamma integral (Bost, Lemma 2.6.4); the right side
decreases in `r`. *Needs:* 1.1; SieveMethodsAndPrimePatterns §0.11a; Mathlib `Real.Gamma`.

**Checks.**

- `L = 2ℤ`, `r = 2`: `exp(h0θ) − 1 = 0.0000070 ≤ 3 · (1 − 1/(8π))⁻¹ e^(−4π) = 0.0000109`; the
  count at `ρ = 5` is `#{0, ±2, ±4} = 5 ≤ ⌊10/2⌋ + 1 = 6`.
- `r > 0` is needed: `r = −10` satisfies `r ≤ ‖v‖` and `n < 2πr²` for `ℤ`, and the right side is
  `3(1 − 1/(200π))⁻¹ e^(−100π)`, far below `0.0864348`.
- `n < 2πr²` is needed: for `ℤ` and `r = 0.3`, `1 − 1/(2π · 0.09) < 0` and the right side is
  negative.

### 3.2 The Banaszczyk form

Prove `exp_h0θ_sub_one_le_div_of_le_norm`: for a full lattice of rank `n ≥ 1` and `t > 1` with
`(n/2π)^(1/2) t ≤ ‖v‖` for every nonzero `v ∈ L`, `exp(h0θ L) − 1 ≤ q/(1 − q)` with
`q = (t exp(−(t² − 1)/2))ⁿ` (Bost, Corollary 3.2.3, (3.2.6), p. 34). Route:
GeometryOfNumbersAndQuadraticArithmetic's `gaussian_variable_tail` (§4.4, with §4.4.13) at
`c = t/(2π)^(1/2)`, where `b(c) = t exp(−(t² − 1)/2)` and the radius `c√n` is at most `λ₁(L)`, so
that the tail is the mass of `L ∖ 0`; then `exp h0θ − 1 ≤ q exp h0θ`. *Needs:*
GeometryOfNumbersAndQuadraticArithmetic §4.4 `gaussian_variable_tail`; 1.1.

**Checks.**

- `L = 2ℤ`, `t = 2(2π)^(1/2) = 5.0132566`: `q = 0.0000288`, `q/(1 − q) = 0.0000288 ≥ 0.0000070`.
- `t > 1` is needed: at `t = 1`, `q = 1` and `q/(1 − q) = 1/0 = 0` in Lean, while `exp h0θ − 1 > 0`.
- Compared with 3.1 at `n = 1`, `r = 2`: `0.0000288` against `0.0000109`, Groenewegen's bound is
  the better one here, as Bost observes for large `λ₁` (p. 34).

### 3.3 The shifted Gaussian tail

Prove `tsum_tail_le`: for a full lattice of rank `n ≥ 1`, `x ∈ E` and `t ≥ 1`, the mass
`∑ exp(−π‖v − x‖²)` over the `v ∈ L` with `‖v − x‖ ≥ (n/2π)^(1/2) t` is at most
`(t exp(−(t² − 1)/2))ⁿ ∑_(v ∈ L) exp(−π‖v‖²)` (Bost, Proposition 3.2.2, (3.2.4), p. 33, from Lemma
3.2.1). Route: with `R = (n/2π)^(1/2) t`, bound each term of the tail by
`e^(−π(1 − t⁻²)R²) e^(−π‖v − x‖²/t²)`, then the sum of the second factors over all of `L` is
`ρ_t(L − x) ≤ tⁿ ρ_1(L)` by the scale bound GeometryOfNumbersAndQuadraticArithmetic §4.4.8 at
`s = t`; and `e^(−π(1 − t⁻²)R²) = exp(−(t² − 1)n/2)`. At `x = 0` this is
GeometryOfNumbersAndQuadraticArithmetic's `gaussian_variable_tail` at `c = t/(2π)^(1/2)`; the
shift `x ∈ E` is what this target adds. *Needs:* 1.1; GeometryOfNumbersAndQuadraticArithmetic
§4.4.8.

**Checks.**

- `t = 1`: the factor is `1` and the statement is a weakening of the coset inequality.
- `L = ℤ`, `x = ½`, `t = 1`: the radius `0.3989423` is below `½`, so the left side is the whole
  coset
  mass `0.9135791 ≤ 1.0864348`.
- At `x = 0` the vector `0` is excluded once the radius is positive: `ℤ`, `t = 2.6`, radius
  `1.0372499`, left side `2∑_(n ≥ 2) e^(−πn²) = 0.0000070`, right side
  `2.6 e^(−2.88) · 1.0864348 = 0.1585656`.

### Examples

- For `ℤⁿ`, `λ₁ = 1 < (n/2π)^(1/2)` once `n ≥ 7`, and neither 3.1 nor 3.2 applies; for `√m ℤⁿ` with
  `2πm > n` both do.

### Dependencies

Layer 1. GeometryOfNumbersAndQuadraticArithmetic §4.4.8 and §4.4 `gaussian_variable_tail`.
SieveMethodsAndPrimePatterns §0.11a. Mathlib: `Real.Gamma`.

## Layer 4: Arakelov divisors of a number field

### 4.1 The invariant `h⁰` of an Arakelov divisor

Define `h0Div K I x`, for `I : FractionalIdeal (𝓞 K)⁰ K` and `x : InfinitePlace K → ℝ`, the
invariant `h⁰(D) = log ∑'_(f ∈ I) exp(−π‖f‖²_D)` of `D = (I, x)`, with
`‖f‖²_D = ∑_σ exp(−2x_v/mult v)|σ f|²` over the embeddings `σ : K →+* ℂ`, `v` the place of `σ`
(van der Geer–Schoof, §2 for the metric and §3 for `h⁰`). It is `log θ_(σ(I))(y)`, where
`θ_(σ(I))` is LFunctions' `latticeTheta` (Layer 1) of the ideal lattice `σ(I)` and
`y_v = mult v · exp(−2x_v/mult v)`, which is `exp(−2x_v)` at a real place and `2 exp(−x_v)` at a
complex place, since `latticeTheta` weighs a complex coordinate `z` by `y_v|z|²`. Only the
parameter is new here; the theta series is LFunctions'. *Needs:* LFunctions Layer 1
(`latticeTheta`); ArakelovGeometryAndAbelianHeights §1.7; Mathlib `InfinitePlace.mult`,
`FractionalIdeal`; 1.1.

**API.**

- Summability: the series over `I` is summable, since `σ(I)` is a discrete subgroup of the
  finite-dimensional Euclidean space of the metric `‖·‖_D` (Tau Ceti
  `ZLattice.summable_exp_neg_mul_norm_add_sq`); `exp(h0Div K I x)` is its sum, at least `1`.
- `h0Div K I x = h0θ` (1.1) of the Euclidean lattice `O(D)` of ArakelovGeometryAndAbelianHeights
  §1.7, Bost's `h⁰_θ(π_* O(D))` (Bost, (2.2.4), p. 13), by the invariance of 1.1 under linear
  isometric equivalences.
- `h0Div K 0 x = 0`: the zero ideal has the single term `1`.

**Checks.**

- `K = ℚ`, `I = ℤ`: `y = e^(−2x)` and `h⁰(D) = log ∑ exp(−πn² e^(−2x))`, which is `0.0829015` at
  `x = 0` and `1.0000000` at `x = 1` (van der Geer–Schoof, §3, Example 1).
- `K = ℚ(i)`, `I = ℤ[i]`, `x = 0`: `y = 2`, `‖a + bi‖²_D = 2(a² + b²)`,
  `h⁰(D) = 2 · 0.0037279`; the parameter `y = 1`, which counts the complex place once, would give
  `2 · 0.0829015`.
- The parameter is `mult v · exp(−2x_v/mult v)`: with `mult v · exp(−2x_v)` instead, `ℚ(i)`,
  `I = ℤ[i]` and `x_v = 1` give `h⁰(D) − h⁰(κ − D) = 2 − log 2 = 1.3068528` against
  `deg D − ½ log 4 = 0.3068528` in 4.3; over `ℚ` the two agree.

### 4.2 Invariance under principal divisors

Prove `h0Div_add_principal`: `h⁰(D + (f)) = h⁰(D)` for `f ∈ Kˣ` and the principal divisor `(f)` of
ArakelovGeometryAndAbelianHeights §1.7, that is `h⁰(f⁻¹I, v ↦ x_v − mult v · log|f|_v) = h⁰(I, x)`
(van der Geer–Schoof, §3: `h⁰` depends only on the class in the Arakelov–Picard group). Route:
`g ↦ fg` is a bijection `f⁻¹I → I` with `‖g‖²_(D + (f)) = ‖fg‖²_D`. *Needs:* 4.1;
ArakelovGeometryAndAbelianHeights §1.7; Mathlib `FractionalIdeal.spanSingleton`.

**Checks.**

- `K = ℚ`, `I = ℤ`, `f = 2`, `x = 0`: `(½ℤ, −log 2)` has `h⁰ = 0.0829015`, that of `ℤ`.
- The sign of the infinite part is load-bearing: `(½ℤ, +log 2)` gives `log θ(1/16) = 1.3862944`.
- `f = −1`: the divisor is unchanged and so is `h⁰`.

### 4.3 The Riemann–Roch formula

Prove `h0Div_sub_h0Div_dual`: for `I ≠ 0`,
`h⁰(I, x) − h⁰(I^*, −x) = (∑_v x_v − log N(I)) − ½ log|Δ_K|` with
`I^* = FractionalIdeal.dual ℤ ℚ I`, that is `h⁰(D) − h⁰(κ − D) = deg D − ½ log|Δ_K|`
(van der Geer–Schoof, Proposition 1; Bost, (2.2.6), p. 14; Groenewegen, Proposition 6.4, p. 154).
Route: the lattices of `D` and `κ − D` are dual for the inner product of `‖·‖_D`, and
`covol(I, ‖·‖_D) = |Δ_K|^(1/2) N(I) exp(−∑_v x_v)`; LFunctions' `latticeTheta_inv` at the
parameters of 4.1. *Needs:* LFunctions Layer 1 (`latticeTheta_inv`, `coe_dualIdealLattice`);
ArakelovGeometryAndAbelianHeights §1.7 (the degree); Mathlib `FractionalIdeal.dual`,
`FractionalIdeal.absNorm`, `NumberField.discr`; 4.1.

**Checks.**

- `K = ℚ`, `I = ℤ`, `x = 1`: `1.0000000 − 0.0000000 = 1 = deg D`.
- `K = ℚ(i)`, `I = ℤ[i]`, `x = 0`: `I^* = ½ℤ[i]`,
  `2(0.0037279 − 0.3503015) = −0.6931472 = −½ log 4`;
  the metric counting the complex place once gives `−1.2205053`.
- `D = κ`, `x = 0`, `I = 𝔡⁻¹`: `deg κ = log|Δ_K|`, and the formula is symmetric under
  `D ↦ κ − D`.

### 4.4 Divisors of small degree

Prove `exists_h0Div_le`: there is `β` such that for every `D = (I, x)` with `I ≠ 0` and
`deg D ≤ ½ log|Δ_K|`, `h⁰(D) ≤ β exp(−πn exp(−2 deg D/n))`, `n = [K : ℚ]`
(van der Geer–Schoof, Corollary 1 of Proposition 2). Route: raise `D` to degree `½ log|Δ_K|` by
replacing `x_v` with `x_v + mult v · u`, `u = (½ log|Δ_K| − deg D)/n`, which scales `‖·‖_D` by
`e^(−u)`; bound `h⁰` and the first minimum on the classes of
that degree, which form a compact set (the exact sequence of ArakelovGeometryAndAbelianHeights
§1.7, with Mathlib's finite class group and the unit lattice of full rank), and bound
`‖f‖²_D ≥ n exp(−2 deg D/n)` for `f ∈ I ∖ 0` by the arithmetic–geometric mean inequality and
`|N(f)| ≥ N(I)`. *Needs:* 4.1; 4.2; ArakelovGeometryAndAbelianHeights §1.7; Mathlib
`NumberField.RingOfIntegers.instFintypeClassGroup`, `NumberField.Units.unitLattice_rank`.

**Checks.**

- `K = ℚ`, `I = ℤ`, `θ(c) = ∑ exp(−πcn²)`: `h⁰ = log θ(e^(−2x))` is `0.0003910` at `x = −½` and
  `1.658·10⁻¹⁰` at `x = −1`, against `e^(−πe) = 0.0001955` and `e^(−πe²) = 8.290·10⁻¹¹`: the
  ratio tends to `2`, the two vectors `±1`, so no `β < 2` works for `ℚ`.
- The bound is not uniform in `K`: `β` depends on the field, as in the source.
- `deg D = ½ log|Δ_K|`: the right side is `β exp(−πn|Δ_K|^(−1/n))`, a fixed positive number.

### 4.5 The bound in nonnegative degree

Prove `h0Div_le_deg_add`: if `h⁰(D) ≤ h⁰(𝓞_K)` for every `D` with `I ≠ 0` of degree `0`,
then `h⁰(D) ≤ deg D + h⁰(𝓞_K)` for every `D` with `I ≠ 0` of degree `≥ 0` (van der Geer–Schoof,
Proposition 3). Route: lower `D` to `D′` of degree `0` by replacing `x_v` with
`x_v − mult v · u`, `u = deg D/n`, which scales `‖·‖_D` by `e^(u)`; compare `h⁰(κ − D) ≤
h⁰(κ − D′)` term by term, and apply 4.3 twice. *Needs:* 4.3; 4.1.

**Checks.**

- `K = ℚ`: the hypothesis holds, since `ℤ` is the only divisor class of degree `0`, and the
  conclusion is `log θ(e^(−2x)) ≤ x + 0.0829015` for `x ≥ 0`; at `x = 1`, `1.0000000 ≤ 1.0829015`.
- `deg D = 0`: the conclusion is the hypothesis.
- Without the hypothesis the conclusion is not claimed: the hypothesis is van der Geer and Schoof's
  conjecture for fields Galois over `ℚ` or over an imaginary quadratic field, and the theorem is
  conditional on it.

### Examples

- `K = ℚ(√41)`: `h⁰` on the classes of degree `0` is periodic modulo the regulator `4.1591271…` with
  its largest value at `𝓞_K` (van der Geer–Schoof, §3, Example 2).

### Dependencies

Layer 1. LFunctions Layer 1. ArakelovGeometryAndAbelianHeights §1.7. Mathlib:
`NumberField.InfinitePlace`, `FractionalIdeal.dual`,
`FractionalIdeal.absNorm`, `NumberField.discr`, the class group and the unit lattice.

## Downstream consumers

None.

## Research context

Bost develops these invariants for infinite-dimensional Hermitian vector bundles over arithmetic
curves, where subadditivity in admissible extensions (Layer 2) is the basis of the summability and
finiteness theorems of his Chapters 7 and 8, and applies them to algebraicity criteria for formal
curves. Van der Geer and Schoof conjecture that for a number field Galois over `ℚ` or over an
imaginary quadratic field, `h⁰` on the classes of degree zero is largest at `𝓞_K`; they report it
proved for quadratic fields by Francini (§5), and 4.5 is its consequence. It is also known for
quadratic extensions of imaginary quadratic fields (Tran 2017), cyclic cubic fields (Tran–Tian 2018)
and totally imaginary cyclic sextic fields (Tran–Tian–Feaver 2023); Francini (2004) treats a class
of pure cubic fields, which are not Galois. It is open as far as we know for the Galois fields of
unit rank at least `2` outside these families, for instance the real cyclic quartic and real
biquadratic fields (unit rank `3`), so 4.5 applies unconditionally only to these families. Which
lattices of rank `3` and covolume `1` minimise `h⁰_θ` is also open as far as we know; the non-target
after 1.3 records the known ranks and the tie between the face-centred and body-centred cubic
lattices. Banaszczyk's transference theorems rest on the same Gaussian masses, and Bost (§3.2)
recovers them from Layers 1–3. Groenewegen proves an arithmetic analogue of Clifford's theorem with
these invariants (Theorem 7.4). Quillen's notebook 1973-3 (Clay Mathematics Institute) works on
these inequalities; Bost attributes 2.3 over `ℤ` to its entry of 26 April 1973 (§2.8.2).

## References

- J.-B. Bost, *Theta invariants of Euclidean lattices and infinite-dimensional Hermitian vector
  bundles over arithmetic curves*, Progr. Math. 334, Birkhäuser, Cham, 2020.
  doi:10.1007/978-3-030-44329-0; Zbl 1471.11002; arXiv:1512.08946 (numbering and pages of arXiv
  version 2).
- W. P. Reinhardt, P. L. Walker, « Theta functions », Chapter 20 of F. W. J. Olver et al. (eds.),
  *NIST Digital Library of Mathematical Functions*, Release 1.2.8 (2026-09-15), §20.7 and
  §20.9(i). https://dlmf.nist.gov/20.7, https://dlmf.nist.gov/20.9
- G. van der Geer, R. Schoof, « Effectivity of Arakelov divisors and the theta divisor of a number
  field », *Selecta Math. (N.S.)* 6 (2000), no. 4, 377–398. doi:10.1007/PL00001393;
  Zbl 1030.11063; arXiv:math/9802121 (numbering of arXiv version 3).
- R. P. Groenewegen, « An arithmetic analogue of Clifford's theorem », *J. Théor. Nombres Bordeaux*
  13 (2001), no. 1, 143–156. doi:10.5802/jtnb.311; Zbl 1069.11044; Numdam: JTNB_2001__13_1_143_0.
- W. Banaszczyk, « New bounds in some transference theorems in the geometry of numbers », *Math.
  Ann.* 296 (1993), no. 4, 625–635. doi:10.1007/BF01445125; Zbl 0786.11035.
- P. Francini, « The size function h⁰ for quadratic number fields », *J. Théor. Nombres Bordeaux*
  13 (2001), no. 1, 125–135. Zbl 1060.11076.
- P. Francini, « The size function h⁰ for a pure cubic field », *Acta Arith.* 111 (2004), no. 3,
  225–237. doi:10.4064/aa111-3-2. Zbl 1059.11063.
- H. T. N. Tran, « The size function for quadratic extensions of complex quadratic fields »,
  *J. Théor. Nombres Bordeaux* 29 (2017), no. 1, 243–259. doi:10.5802/jtnb.978.
  Zbl 1429.11194. arXiv:1504.01045.
- H. T. N. Tran, P. Tian, « The size function for cyclic cubic fields », *Int. J. Number Theory*
  14 (2018), no. 2, 399–415. doi:10.1142/S1793042118500276. Zbl 1398.11135. arXiv:1609.02858.
- H. T. N. Tran, P. Tian, A. Feaver, « The size function for imaginary cyclic sextic fields »,
  *J. Théor. Nombres Bordeaux* 35 (2023), no. 3, 841–866. doi:10.5802/jtnb.1266.
  Zbl 1561.11090. arXiv:2302.05987.
- H. L. Montgomery, « Minimal theta functions », *Glasgow Math. J.* 30 (1988), no. 1, 75–85.
  doi:10.1017/S0017089500007047. Zbl 0639.10017.
- H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, M. Viazovska, « Universal optimality of the E₈
  and Leech lattices and interpolation formulas », *Ann. of Math.* (2) 196 (2022), no. 3,
  983–1082. doi:10.4007/annals.2022.196.3.3. Zbl 1509.11061. arXiv:1902.05438.
