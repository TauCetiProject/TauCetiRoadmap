# Roadmap: spectral-subspace perturbation: Sylvester equations, Rosenblum's theorem and the Davis–Kahan `sin Θ` theorems

**Summary.** When a self-adjoint operator `A` on a Hilbert space is perturbed to `B`, a spectral
subspace `U` of `A` moves to a spectral subspace `V` of `B`, by principal angles whose sines are
the singular values of `P_{V⊥} P_U`. Davis and Kahan bound this sine operator by `B − A` divided by
a spectral gap, through the Sylvester equation `AX − XB = C`, which has one solution when the
spectra of `A` and `B` are separated. The separation decides the constant: one spectrum in an
interval and the other outside its `δ`-neighbourhood gives `δ N(X) ≤ N(C)` in every unitarily
invariant norm `N`; spectra only `δ` apart pairwise give the sharp `δ N(X) ≤ (π/2) N(C)`.
Bhatia, Davis and McIntosh proved the pairwise bound with a universal constant, the best one
lying between `√(3/2)` and `2`; the sharp constant `π/2` is the least `L¹` norm of a function whose
Fourier integral is `1/x` for `|x| ≥ 1`, and Part A builds an explicit kernel attaining it, which
Tau Ceti calls the Haagerup–Zsidó kernel. Yu, Wang and Samworth give a variant for statistics
with a gap in the unperturbed (population) operator alone.

The headline theorems:

- *Rosenblum's theorem.* Let `A` and `B` be self-adjoint operators, bounded or not, on complex
  Hilbert spaces, with disjoint spectra. A bounded `X` that maps the domain of `B` into that of
  `A` and satisfies `AXy = XBy` for every `y` in the domain of `B` is zero.
- *The unbounded `π/2` theorem.* If `|a − b| ≥ δ > 0` for every `a` in the spectrum of `A` and
  `b` in that of `B`, every bounded solution of `AX − XB = C` in the same sense satisfies
  `δ‖X‖ ≤ (π/2)‖C‖`.
- *The Davis–Kahan `tan Θ` theorem.* Let `A` be symmetric on a finite-dimensional inner product
  space, `U` an invariant subspace and `Z` a subspace with `dim Z = dim U`, with `R` the residual
  of the compression of `A` to `Z`. If the eigenvalues of the compression lie in `[β, α]` and
  those of `A` on `U⊥` in `[α + δ, ∞)`, with `δ > 0`, every principal angle from `Z` to `U` is
  below `π/2` and `δ N(tan Θ) ≤ N(R)` in every unitarily invariant norm.
- *Yu–Wang–Samworth.* If `U` and `V` are spanned by eigenvectors of symmetric `A` and `B` at the
  same `d` sorted indices, and the eigenvalues of `A` at those indices are at distance at least
  `Δ > 0` from its other eigenvalues, `U` and `V` have orthonormal bases `u`, `v` with
  `(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2} ≤ 2√2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ`.

Beneath these the roadmap builds the finite-dimensional and bounded theory: the kernel's Fourier
identity and mass, the Sylvester bounds with constants one and `π/2`, the residual, perturbation,
`sin 2Θ` and `tan 2θ` theorems of Davis and Kahan, and the Yu–Wang–Samworth `sin Θ` theorem.
[SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) supplies the domain-aware
Sylvester equation and the spectral measure that the first two theorems need. The `sin Θ`
theorems are used by
[MathematicalStatisticsNonparametric](../../MathematicalStatisticsNonparametric/README.md) and
[MathematicalStatisticsHighDimensional](../../MathematicalStatisticsHighDimensional/README.md), the
Hermitian dilation by [RandomMatrices](../../RandomMatrices/README.md).

The build follows the theory: first the internal gap of one operator across a subspace, which the
later Parts share; then Part A, the Haagerup–Zsidó kernel; Part B, Sylvester equations, the `π/2`
bounds and Rosenblum's theorem; Part C, the Davis–Kahan theorems; Part D, the Yu–Wang–Samworth
variant.

## How to read the build

Section numbers are fixed. §S.1 is the shared internal gap, and §X.n is item n of Part X. Other
roadmaps cite the items by their labels: `SSP-S01` is §S.1, and `SSP-An`, `SSP-Bn`, `SSP-Cn` and
`SSP-Dn` are §A.n, §B.n, §C.n and §D.n, for `SSP-A01`–`SSP-A26`, `SSP-B01`–`SSP-B17`, `SSP-B19`,
`SSP-C01`–`SSP-C31` and `SSP-D01`–`SSP-D19`; there is no label `SSP-B18` and no §B.18. The
milestones of each Part, runs of consecutive items, are listed under its heading.

Where the pinned Tau Ceti proves an item, the item ends with an *In Tau Ceti:* line naming the
declarations that realise it, and its proof route is at most a sentence; the statement above that
line is the specification. An item the pinned Tau Ceti proves in part says on that line which part
its declarations cover. A realising declaration may be more general than its item: it drops
symmetry or `δ > 0` where the proof needs neither, and holds for every unitarily invariant
seminorm where the item names one. Each *Needs:* line lists the inputs of a statement and of its
route, so that a target proved by another route is not blocked behind an unrelated one.

## Conventions

1. **Scalars and spaces.** `𝕜` is `ℝ` or `ℂ` (Mathlib's `RCLike 𝕜`). The finite-dimensional
   statements are over `𝕜`, on finite-dimensional inner product spaces. The statements about
   unbounded operators, and §B.12, are over `ℂ`, on complete inner product spaces. Rectangular
   statements allow different source and target spaces.
2. **Operators.** A bounded operator `A` is *symmetric* when `(A : E →ₗ[𝕜] E).IsSymmetric`; for
   bounded operators on a complete space this is self-adjointness. A partial operator is Mathlib's
   `E →ₗ.[ℂ] E` (`LinearPMap`), self-adjoint in Mathlib's sense `IsSelfAdjoint A`, which needs a
   complete space. Its spectrum is Tau Ceti's `LinearPMap.spectrum`, the complement of the
   scalars `z` at which `z − A` has a bounded two-sided inverse on the domain; for a bounded
   operator viewed as a total partial operator it is Mathlib's `spectrum` (Tau Ceti
   `ContinuousLinearMap.spectrum_toPMap_top`), and for a self-adjoint operator it is real (Tau
   Ceti `IsSelfAdjoint.spectrum_subset_im_eq_zero`).
3. **The Sylvester equation.** For `A` on `E`, `B` on `F` and `X, C : F → E`, the equation is
   `AX − XB = C`: `A` acts on the target of `X` and `B` on its source. For bounded operators the
   map `X ↦ AX − XB` is §B.1, Tau Ceti's `ContinuousLinearMap.sylvester`, written `A.sylvester B X`.
   For partial operators the *domain-aware* equation is Tau Ceti's
   `LinearPMap.SylvesterEquation A B X C`: `X` maps the domain of `B` into that of `A`, and
   `AXy − XBy = Cy` for every `y` in the domain of `B`. `X` solves it with `C = 0` exactly when
   `XB ⊆ AX`, which is Tau Ceti's `LinearPMap.Intertwines B A X`: the operator on the source of
   `X` comes first.
4. **Subspaces, projections and angles.** Subspaces carry orthogonal projections
   (`Submodule.HasOrthogonalProjection`; on a complete space, closed subspaces), written `P_U`
   (Mathlib `U.starProjection`); `U⊥` is the orthogonal complement. The *directed sine map* from
   `U` to `V` is `P_{V⊥} P_U` (Tau Ceti `Submodule.sinThetaMap U V`); in finite dimension its
   singular values are the *principal sines from `U` to `V`*, and their arcsines the principal
   angles, in `[0, π/2]` (Tau Ceti `Submodule.principalSines`, `Submodule.principalAngles`). The
   *projection gap* is `‖P_U − P_V‖` and the *directed gap* `‖P_{V⊥} P_U‖` (Tau Ceti
   `Submodule.projectionGap`, `Submodule.directedProjectionGap`). For a map `X : F → E` and a
   subspace `V` of `E`, the *sine embedding* of `X` is `P_{V⊥} X` and its *cosine embedding*
   `P_V X` (§C.5, §C.6). The *point-spectral subspace* of `A` selected by `Ω ⊆ ℝ` is the span of
   the eigenvectors of `A` with eigenvalues in `Ω` (Tau Ceti `Module.End.pointSpectralSubspace`).
5. **Separation.** In finite dimension spectra are point spectra. The *restricted point spectrum*
   of `A` on `U` is the set of real `λ` with an eigenvector of `A` in `U` (Tau Ceti
   `Module.End.restrictedPointSpectrum`). With it, *pairwise separation* by `δ` asks
   `δ ≤ |λ − μ|` for every `λ` of `A` on `U` and `μ` of `B` on `V`
   (`Module.End.PointSpectraSeparated A U B V δ`); *ordered separation* asks `λ + δ ≤ μ`
   (`Module.End.PointOrderedGap`); *interval/exterior separation* asks the first set to lie in
   `[a, b]` and the second outside `(a − δ, b + δ)` (`Module.End.PointIntervalExteriorGap`). The
   *internal gap* §S.1 is pairwise separation of one operator from itself across `U` and `U⊥`,
   with `U` invariant. For partial operators, separation of real spectra is Tau Ceti's
   `LinearPMap.SpectralSetsSeparated A B s t δ`, over the real points `LinearPMap.realSpectrum` of
   the two spectra.
6. **Unitarily invariant norms.** `N` is a unitarily invariant seminorm on the linear maps
   `E → F` (Tau Ceti `TauCeti.UnitarilyInvariantSeminorm 𝕜 E F`): `N(UAV) = N(A)` for unitaries
   `U` of `F` and `V` of `E`, acting independently. The operator, Frobenius, Ky Fan and Schatten
   norms are Tau Ceti's `TauCeti.UnitarilyInvariantSeminorm.opNorm`, `.frobenius`, `.kyFan` and
   `.schatten`; `‖·‖` is the operator norm, `‖·‖_F` the Frobenius norm and `K_k` the Ky Fan
   `k`-norm, the sum of the `k` largest singular values.
7. **The Haagerup–Zsidó kernel.** The weight is `w(y) = tanh(πy/2)`, its Laplace transform
   `L(t) = ∫_{y>0} w(y) e^{−|t|y} dy`, the real kernel `r(t) = (sin t / 2) L(t)` and the kernel
   `k(t) = −i r(t)` (§A.1–§A.4). The integral defining `L` converges for `t ≠ 0`; at `t = 0` it
   diverges and the library's value is `0`, the Bochner integral of a non-integrable function,
   which affects no statement since `{0}` is a null set. Fourier identities are written as the
   bare integral `∫_ℝ k(t) e^{itx} dt`; Mathlib's transform `𝓕 f (ξ) = ∫ e^{−2πitξ} f(t) dt`
   differs by the substitution `x = −2πξ`.
8. **Trial maps.** For bounded `A` on `E` and `X : F → E`, the *compression* is `X†AX` (§C.1), the
   *residual* for a model operator `M` on `F` is `R = AX − XM = A.sylvester M X` (§C.2), and the
   *Ritz residual* of an isometric `X` takes `M = X†AX` (§C.3).
9. **The statistical layer.** `A` (the population operator) and `B` (the perturbed or sample
   operator) are symmetric on a finite-dimensional space of dimension `n`; their eigenvalues are
   listed in decreasing order with orthonormal eigenvector bases (Mathlib
   `LinearMap.IsSymmetric.eigenvalues` and `.eigenvectorBasis`). *Corresponding eigenblocks*
   (§D.1) are spans of eigenvectors of `A` and `B` at the same sorted indices, with the
   eigenvectors chosen freely inside repeated eigenspaces. The *residual columns* (§D.3) of a
   selected index set `s` are `R_j = λ_j(A) v_j − A v_j` for `j ∈ s`, with `λ_j(A)` the `j`-th
   eigenvalue of `A` and `v_j` the `j`-th eigenvector of `B`. The Frobenius sine distance (§D.2)
   is `‖sin Θ(U, V)‖_F = ‖P_{V⊥} P_U‖_F`, symmetric in `U` and `V` when their dimensions agree.
10. **Names.** The acceptance file `Suggested.lean` states, in the namespace
    `TauCetiRoadmap.SpectralSubspacePerturbation`, the headline theorems that the pinned Tau Ceti
    does not prove. Other targets are named in prose.

## The shared separation object

The internal gap measures the separation between a selected spectral block and its complement
inside one operator. It is the spectral hypothesis of the population-gap theorems of Part D, and
the separation behind the double-angle and tangent estimates of Part C: for symmetric `A`, the
two-block form bounds `b‖y‖² ≤ Re⟪Ay, y⟫` on `U` and `Re⟪Az, z⟫ ≤ a‖z‖²` on `U⊥` of §C.25,
§C.27, §C.30 and §C.31 give an internal gap `b − a` at an `A`-invariant `U`.

### S.1 The internal point-spectrum gap

For an endomorphism `A` of an inner product space `E`, a subspace `U` and `δ : ℝ`, the *internal
gap* of `A` at `U` of width `δ` holds when `U` is `A`-invariant and every eigenvalue of `A` with an
eigenvector in `U` is at distance at least `δ` from every eigenvalue of `A` with an eigenvector in
`U⊥`: the restricted point spectra of `A` on `U` and on `U⊥` are pairwise separated by `δ`
(Convention 5). For symmetric `A` the complement `U⊥` is invariant as well, so in finite dimension
these are the point spectra of the two restrictions. The perturbation estimates use it with
`δ > 0`.

- An internal gap of width `δ` is one of every width `δ′ ≤ δ`.
- An `A`-invariant `U` whose eigenvalues all lie at least `δ` below those of `A` on `U⊥` (ordered
  separation), or whose eigenvalues lie in a set `s` while those on `U⊥` lie in a set `t` with
  `δ ≤ |a − b|` for `a ∈ s` and `b ∈ t`, has an internal gap `δ`.
- For `Ω ⊆ ℝ`, the point-spectral subspace of `A` selected by `Ω` has an internal gap `δ` as soon
  as every eigenvalue of `A` in `Ω` is at distance at least `δ` from every eigenvalue of `A`
  outside `Ω`.

**Checks.**
- On `ℝ³` let `A = diag(0, 1, 3)` and `U = span e₃`. The eigenvalue on `U` is `3`, those on `U⊥`
  are `0` and `1`, so the internal gap is `2`. A definition comparing the eigenvalues on `U` with
  the whole spectrum of `A` would see `3` on both sides and give `0`.

*Needs:* PrincipalAngles' restricted point spectrum and pairwise separation (Convention 5).
*In Tau Ceti:* `Module.End.PointInternalGap`, `Module.End.PointInternalGap.mono_gap`, `Module.End.PointInternalGap.of_pointOrderedGap`, `Module.End.PointInternalGap.of_pointSpectrumIn`, `Module.End.pointInternalGap_pointSpectralSubspace`.

**Milestone S1 — shared internal-gap vocabulary.** §S.1.

## Part A: the Haagerup–Zsidó kernel and its Fourier transform

Part A constructs an integrable kernel `k : ℝ → ℂ` whose Fourier integral is `1/x` on `1 ≤ |x|`
and whose `L¹` mass is exactly `π/2` (Convention 7). The construction uses the hyperbolic weight,
its one-sided Laplace transform, a real kernel and its rotation by `−i`; the Fourier, Laplace and
integrability identities then evaluate the kernel's Fourier integral and its mass.

**Milestone A1 — kernel construction and elementary calculus.** §A.1–§A.13.

**Milestone A2 — Fourier, Laplace, and integrability identities.** §A.14–§A.22.

**Milestone A3 — exterior identity, exact mass, and normalization.** §A.23–§A.25.

**Milestone A4 — kernel-mass integral bound.** §A.26.

### A.1 The hyperbolic weight

Define the weight `w : ℝ → ℝ`, `w(y) = tanh(πy/2)`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.weight`, `TauCeti.HaagerupZsido.weight_def`.

### A.2 The Laplace transform of the weight

Define `L : ℝ → ℝ`, `L(t) = ∫_{y>0} w(y) e^{−|t|y} dy`. For `t ≠ 0` the integrand is integrable
on `(0, ∞)`, being dominated by `e^{−|t|y}`; the value at `t = 0` is as in Convention 7.
*In Tau Ceti:* `TauCeti.HaagerupZsido.weightLaplaceTransform`, `TauCeti.HaagerupZsido.integrableOn_weight_mul_exp`.

### A.3 The real kernel

Define `r : ℝ → ℝ`, `r(t) = (sin t / 2) L(t)`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.realKernel`.

### A.4 The reciprocal kernel

Define `k : ℝ → ℂ`, `k(t) = −i r(t)`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.reciprocalKernel`.

### A.5 The weight is nonnegative

For `y ≥ 0`, `0 ≤ w(y)`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.weight_nonneg`.

### A.6 The weight is continuous

The function `w` is continuous on `ℝ`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.continuous_weight`.

### A.7 The Laplace transform is nonnegative

`0 ≤ L(t)` for every real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.weightLaplaceTransform_nonneg`.

### A.8 The Laplace transform is even

`L(−t) = L(t)` for every real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.weightLaplaceTransform_neg`.

### A.9 The real kernel is measurable

The function `r` is Borel measurable.
*In Tau Ceti:* `TauCeti.HaagerupZsido.measurable_realKernel`.

### A.10 The reciprocal kernel is measurable

The function `k` is Borel measurable.
*In Tau Ceti:* `TauCeti.HaagerupZsido.measurable_reciprocalKernel`.

### A.11 The real kernel is odd

`r(−t) = −r(t)` for every real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.realKernel_neg`.

### A.12 The reciprocal kernel is odd

`k(−t) = −k(t)` for every real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.reciprocalKernel_neg`.

### A.13 The norm of the kernel

`‖k(t)‖ = |r(t)|` for every real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.norm_reciprocalKernel`.

### A.14 The oscillatory two-sided Laplace integral

For `y > 0` and real `x`, `∫_ℝ e^{−y|t|} e^{itx} dt = 2y/(y² + x²)`.
*In Tau Ceti:* `TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs`.

### A.15 The Fourier transform of a two-sided exponential

In Mathlib's normalisation, for `y > 0` the Fourier transform of `t ↦ e^{−2πy|t|}` is
`ξ ↦ y/(π(y² + ξ²))`, the Cauchy density of scale `y`; for a general rate `a > 0`, the transform
of `t ↦ e^{−a|t|}` is `ξ ↦ 2a/(a² + (2πξ)²)`.
*In Tau Ceti:* `TauCeti.fourier_exp_neg_mul_abs`, `TauCeti.Probability.fourier_exp_neg_mul_abs_eq_cauchyPDFReal_zero_loc`.

### A.16 Two-sided exponential decay

Prove that for `a > 0` and every real `s`, `e^{−a|x|} = o(|x|^s)` as `|x| → ∞`, that is, along
Mathlib's `Filter.cocompact ℝ`: `(fun x ↦ Real.exp (-(a * |x|))) =o[cocompact ℝ] (fun x ↦ |x| ^ s)`.
This is the decay hypothesis of Mathlib's Poisson summation formula
`Real.tsum_eq_tsum_fourier_of_rpow_decay`, in the form the Cauchy-kernel lattice identity §A.18
uses. Mathlib states only the one-sided limit `x → +∞` of `e^{−ax}`.
Route: both functions are even, and on `[0, ∞)` the statement is Mathlib's
`isLittleO_exp_neg_mul_rpow_atTop`.
*Needs:* Mathlib `isLittleO_exp_neg_mul_rpow_atTop`, `Filter.cocompact`.

### A.17 The Laplace transform of `|sin|`

For `y > 0`, `∫_ℝ |sin t| e^{−y|t|} dt = 2(1 + e^{−πy})/((1 − e^{−πy})(1 + y²))`.
*In Tau Ceti:* `TauCeti.integral_abs_sin_mul_exp_neg_mul_abs`.

### A.18 Poisson summation for the Cauchy kernel

For `y > 0`, the Cauchy kernel satisfies the Poisson summation identity
`∑_{n∈ℤ} e^{−2πy|n|} = ∑_{n∈ℤ} y/(π(y² + n²))`, and summing the geometric series on the left,
`∑_{n∈ℤ} (y² + n²)⁻¹ = (π/y)(1 + e^{−2πy})/(1 − e^{−2πy})`. Route: Poisson summation for
`t ↦ e^{−2πy|t|}`, whose transform is §A.15, with the decay of §A.16.
*In Tau Ceti:* `TauCeti.tsum_exp_neg_mul_abs_int_eq_tsum_div`, `TauCeti.tsum_int_inv_sq_add_sq`.

### A.19 The odd-pole expansion of the weight

For every real `y`, `∑_{n≥0} 2y/(y² + (2n + 1)²) = (π/2) tanh(πy/2)`; for `y > 0` this is
`w(y)/y = (4/π) ∑_{n≥0} (y² + (2n + 1)²)⁻¹`.
*In Tau Ceti:* `TauCeti.hasSum_pi_div_two_mul_tanh`.

### A.20 The rational telescoping integral

For `a ≥ 0`, the function `y ↦ w(y) y ((y² + a²)⁻¹ − (y² + (a + 2)²)⁻¹)` is integrable on
`(0, ∞)` and `∫_{y>0} w(y) y ((y² + a²)⁻¹ − (y² + (a + 2)²)⁻¹) dy = 2/(a + 1)`: integrated against
the difference of the adjacent Cauchy resolvents, the odd-pole expansion §A.19 telescopes.
*In Tau Ceti:* `TauCeti.HaagerupZsido.integral_weight_mul_mul_inv_sub_inv`, `TauCeti.HaagerupZsido.integrableOn_weight_mul_mul_inv_sub_inv`.

### A.21 Integrability of the kernel integrand

The function `(y, t) ↦ (sin t / 2) w(y) e^{−|t|y}` on `(0, ∞) × ℝ`, whose integral in `y` is
`r(t)`, is integrable for the product of Lebesgue measures. It carries the exchanges of integrals in
the mass and Fourier calculations.
*In Tau Ceti:* `TauCeti.HaagerupZsido.kernelIntegrand`, `TauCeti.HaagerupZsido.integral_kernelIntegrand`, `TauCeti.HaagerupZsido.integrable_kernelIntegrand`.

### A.22 The kernel is integrable

The kernels `k` and `r` are Bochner integrable on `ℝ`; indeed `|r(t)| ≤ π/(2(1 + t²))` for every
real `t`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.integrable_reciprocalKernel`, `TauCeti.HaagerupZsido.integrable_realKernel`, `TauCeti.HaagerupZsido.abs_realKernel_le`.

### A.23 The exterior Fourier identity

If `1 ≤ |x|`, then `∫_ℝ k(t) e^{itx} dt = 1/x`; in real form, `∫_ℝ r(t) sin(xt) dt = 1/x`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.integral_exp_mul_I_mul_reciprocalKernel`, `TauCeti.HaagerupZsido.integral_realKernel_mul_sin`.

### A.24 The exact mass

`∫_ℝ ‖k(t)‖ dt = ∫_ℝ |r(t)| dt = π/2`. Route: Tonelli, with §A.17 and the definition of the
weight, as in the Examples below.
*In Tau Ceti:* `TauCeti.HaagerupZsido.integral_norm_reciprocalKernel`, `TauCeti.HaagerupZsido.integral_abs_realKernel`.

### A.25 The identity in Mathlib's normalisation

If `1 ≤ 2π|ξ|`, then `𝓕 k (ξ) = −1/(2πξ)`: this is §A.23 at `x = −2πξ`, in Mathlib's
normalisation of the Fourier transform.
*In Tau Ceti:* `TauCeti.HaagerupZsido.fourier_reciprocalKernel`.

### A.26 The kernel-mass integral bound

Let `G` be a complex normed space, `C` real, and `F : ℝ → G` with `‖F(t)‖ ≤ C` for almost every
`t`. Then `‖∫_ℝ k(t) • F(t) dt‖ ≤ (π/2) C`, and if `F` is almost everywhere strongly measurable,
`t ↦ k(t) • F(t)` is integrable. In particular, for `G` complete and `F` Bochner integrable with
`‖F(t)‖ ≤ 1` almost everywhere, `t ↦ k(t) • F(t)` is integrable and
`‖∫_ℝ k(t) • F(t) dt‖ ≤ π/2`.
*In Tau Ceti:* `TauCeti.HaagerupZsido.norm_integral_reciprocalKernel_smul_le`, `TauCeti.HaagerupZsido.integrable_reciprocalKernel_smul`.

### Examples

- The Fourier identity cannot reach far into `(−1, 1)`: `|∫ k(t) e^{itx} dt| ≤ ∫ |k| = π/2`, while
  `|1/x| > π/2` for `0 < |x| < 2/π`; at `x = 0` the integral is `0`, because `k` is odd and
  integrable (§A.12, §A.22). A kernel with this identity on all of `ℝ ∖ {0}` would not be
  integrable.
- The mass `∫ |k(t)| dt = π/2` comes from Tonelli: integrating `|sin t| e^{−y|t|}` in `t` gives
  `2(1 + e^{−πy})/((1 − e^{−πy})(1 + y²))`, and multiplied by `tanh(πy/2)/2` this is
  `1/(1 + y²)`, whose integral over `(0, ∞)` is `π/2`. Dropping the factor `1/2` in `r` would
  give the mass `π`.

### Dependencies

Mathlib: the Fourier transform and Poisson summation, the Bochner integral and Tonelli's theorem,
asymptotics along the cocompact filter, hyperbolic and trigonometric functions. No other roadmap.

## Part B: Sylvester equations and the Rosenblum theorem

Rosenblum's theorem gives uniqueness for disjoint spectra; the quantitative Sylvester estimates
strengthen positive spectral separation into norm bounds for solutions. Coordinate division gives
the finite-dimensional model (§B.1–§B.4) and coercivity the dimension-free operator-norm bounds
(§B.5–§B.8). Interval/exterior separation gives constant-one bounds in every unitarily invariant
norm (§B.9–§B.10); pairwise separation gives the constant `π/2` through the Part A kernel, Ky Fan
prefixes and Fan dominance (§B.11–§B.14), and the coordinate equation gives the Frobenius bound
with constant one (§B.15). The domain-aware statements §B.16, §B.17 and §B.19 carry the pairwise
bound and uniqueness to self-adjoint operators, bounded or not. Finite-dimensional separation uses
the predicates of PrincipalAngles (Convention 5); the unbounded statements consume the domain-aware
Sylvester equation and the self-adjoint partial-operator spectrum of SelfAdjointSpectralTheory.

**Milestone B1 — finite Sylvester core.** §B.1–§B.5.

**Milestone B2 — dimension-free and unitarily invariant bounds.** §B.6–§B.16.

**Milestone B3 — Rosenblum theorem.** §B.17.

**Milestone B4 — bounded/partial uniqueness bridge.** §B.19.

### B.1 The Sylvester map

For bounded operators `A` on `E` and `B` on `F`, define the continuous linear map `X ↦ AX − XB`
on the bounded operators `F → E` (Convention 3). Its kernel consists of the intertwiners
`AX = XB`.
*In Tau Ceti:* `ContinuousLinearMap.sylvester`, `ContinuousLinearMap.sylvester_apply`.

### B.2 Injectivity under spectral separation

In finite dimension, let `A` on `E` and `B` on `F` be symmetric with disjoint spectra (equivalently,
spectra at positive distance). Then `X ↦ AX − XB` is injective, and bijective: for every `C` the
Sylvester equation `AX − XB = C` has exactly one solution.
*In Tau Ceti:* `ContinuousLinearMap.sylvester_injective`, `ContinuousLinearMap.sylvester_bijective`.

### B.3 The canonical eigenbasis solution

Under the hypotheses of §B.2, let `(uᵢ)`, `(vⱼ)` be orthonormal eigenbases of `A` and `B` with
eigenvalues `(αᵢ)`, `(βⱼ)`. The operator `X = ∑ᵢⱼ (αᵢ − βⱼ)⁻¹ ⟪uᵢ, C vⱼ⟫ uᵢ ⊗ vⱼ`, with
`uᵢ ⊗ vⱼ` the rank-one map `x ↦ ⟪vⱼ, x⟫ uᵢ`, which divides each matrix coefficient of `C` by the
corresponding eigenvalue difference, solves `AX − XB = C`, and it is the only solution.
*In Tau Ceti:* `ContinuousLinearMap.sylvester_sum_eigenvectorBasis`, `ContinuousLinearMap.sylvester_apply_eq_iff`.

### B.4 The coordinate Sylvester equation

Let `A` on `E` and `B` on `F` be symmetric on finite-dimensional spaces with orthonormal
eigenbases `(uᵢ)`, `(vⱼ)` and eigenvalues `(αᵢ)`, `(βⱼ)`. For every `X : F → E`,
`⟪uᵢ, (AX − XB) vⱼ⟫ = (αᵢ − βⱼ) ⟪uᵢ, X vⱼ⟫`; so every solution of `AX − XB = C` satisfies
`(αᵢ − βⱼ) Xᵢⱼ = Cᵢⱼ`. The identity holds in any dimension for an eigenvector `u` of a symmetric
`A` with real eigenvalue `α` and an eigenvector `v` of `B` with eigenvalue `β`.
*In Tau Ceti:* `ContinuousLinearMap.inner_sylvester_apply_eigenvectorBasis`, `ContinuousLinearMap.inner_sylvester_apply_of_apply_eq_smul`.

### B.5 Coercive invertibility with the inverse bound

Let `E` be a complete inner product space over `𝕜`, `T : E →L[𝕜] E`, and `c > 0` with
`c‖x‖² ≤ Re⟪Tx, x⟫` for every `x`: the real bilinear form `(x, y) ↦ Re⟪Tx, y⟫` is coercive in the
sense of Mathlib's `IsCoercive`, with the witness `c` named. Prove that `T` is invertible in the
algebra of bounded operators (equivalently, a continuous linear equivalence of `E`) and that its
inverse has norm at most `c⁻¹`. Route: Tau Ceti's `ContinuousLinearMap.isUnit_of_coercive` gives
invertibility and `ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive` the lower bound
`c‖x‖ ≤ ‖Tx‖`, which `ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le` turns into
`‖T⁻¹‖ ≤ c⁻¹`. For real scalars Mathlib's Lax–Milgram theorem `IsCoercive.continuousLinearEquivOfBilin`
gives the equivalence, and `IsCoercive.antilipschitz` an unnamed constant; Tau Ceti's variational
form of Lax–Milgram is in `TauCeti/Analysis/InnerProductSpace/LaxMilgram.lean`.
*Needs:* Tau Ceti `ContinuousLinearMap.isUnit_of_coercive`,
`ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive`,
`ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le`; Mathlib `Ring.inverse`, `IsCoercive`.

**Checks.**
- On `ℝ²`, `T = [[1, 1], [−1, 1]]` is not symmetric, but `⟪Tx, x⟫ = ‖x‖²`, so `c = 1`; its inverse
  `(1/2)[[1, −1], [1, 1]]` has norm `1/√2 ≤ 1`. The hypothesis is on the real part of the form,
  not on symmetry.
- The unilateral shift `S` on `ℓ²(ℕ)` satisfies `‖Sx‖ = ‖x‖` and is not surjective; its form is
  not coercive, since `⟪Se₀, e₀⟫ = ⟪e₁, e₀⟫ = 0`. A version assuming only the lower bound
  `‖Tx‖ ≥ c‖x‖` would make `S` invertible.

### B.6 The Lyapunov bound

Let `A` on `E` and `B` on `F` be bounded operators on inner product spaces and `δ > 0` with
`δ‖x‖² ≤ Re⟪Ax, x⟫` and `δ‖y‖² ≤ Re⟪By, y⟫` for all `x` and `y`. Every solution of `AX + XB = Y`
satisfies `‖X‖ ≤ ‖Y‖/(2δ)`. More generally, lower bounds `α` and `β` of the two forms give
`(α + β)‖X‖ ≤ ‖AX + XB‖` for every bounded `X`, with no symmetry, completeness or sign condition.
*In Tau Ceti:* `ContinuousLinearMap.add_mul_norm_le_norm_comp_add_comp`.

### B.7 The separated Sylvester bound

Let `A` and `B` be bounded symmetric operators, `g > 0`, and `c` real with
`(c + g)‖x‖² ≤ Re⟪Ax, x⟫` and `Re⟪By, y⟫ ≤ c‖y‖²` for all `x` and `y`. Every solution of
`AX − XB = Y` satisfies `‖X‖ ≤ ‖Y‖/g` (the half-line case of Bhatia, *Matrix Analysis*,
Theorem VII.2.3). Route: §B.6 for `A − c` and `c − B`.
*In Tau Ceti:* `ContinuousLinearMap.mul_norm_le_norm_sylvester_apply_of_le_re_inner_of_re_inner_le`.

### B.8 The reverse separated bound

If instead `Re⟪Ax, x⟫ ≤ c‖x‖²` and `(c + g)‖y‖² ≤ Re⟪By, y⟫` for all `x` and `y`, every solution
of `AX − XB = Y` satisfies `‖X‖ ≤ ‖Y‖/g`.
*In Tau Ceti:* `ContinuousLinearMap.mul_norm_le_norm_sylvester_apply_of_re_inner_le_of_le_re_inner`.

### B.9 The interval/exterior Sylvester bound

Let `A` on `E` and `B` on `F` be symmetric on finite-dimensional inner product spaces and `δ > 0`,
with the eigenvalues of `A` in `[a, b]` and those of `B` outside `(a − δ, b + δ)`. Every
unitarily invariant seminorm `N` on the maps `F → E` satisfies `δ N(X) ≤ N(C)` whenever
`AX − XB = C`. The same holds on invariant subspaces: for `S` `A`-invariant and `T` `B`-invariant,
with the eigenvalues of `A` on `S` in `[a, b]` and those of `B` on `T` outside `(a − δ, b + δ)`,
every `X` with values in `S` and vanishing on `T⊥` satisfies `δ N(X) ≤ N(AX − XB)`.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_of_mem`.

### B.10 The reverse interval/exterior bound

In the reversed orientation of §B.9, with the eigenvalues of `B` in `[a, b]` and those of `A`
outside `(a − δ, b + δ)`, every unitarily invariant seminorm `N` satisfies `δ N(X) ≤ N(C)` for
`AX − XB = C`, and the same holds on invariant subspaces.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_swap`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_map_sylvester_apply_of_pointIntervalExteriorGap_swap_of_mem`.

### B.11 The simultaneous Ky Fan estimate

Let `A` on `E` and `B` on `F` be symmetric on finite-dimensional inner product spaces and `δ > 0`
with `δ ≤ |αᵢ − βⱼ|` for every eigenvalue `αᵢ` of `A` and `βⱼ` of `B` (pairwise separation). Every
solution of `AX − XB = C` satisfies `δ K_k(X) ≤ (π/2) K_k(C)` for all `k` simultaneously. Route:
the Part A kernel, through the exterior identity §A.23 and the mass §A.24.
*In Tau Ceti:* `ContinuousLinearMap.mul_kyFanSum_le_pi_div_two_mul_kyFanSum_sylvester_apply`.

### B.12 The reciprocal multiplier as a combination of unitary actions

Let `E` and `F` be finite-dimensional complex inner product spaces, `A` on `E` and `B` on `F`
symmetric with orthonormal eigenvectors `uᵢ`, `vⱼ` and eigenvalues `αᵢ`, `βⱼ`, and `δ > 0` with
`|αᵢ − βⱼ| ≥ δ` for all `i, j` (`Module.End.PointSpectraSeparated A ⊤ B ⊤ δ`). The
*`δ`-normalised reciprocal multiplier* is the linear map `m_δ` on the maps `F → E` with
`⟪uᵢ, m_δ(C) vⱼ⟫ = δ ⟪uᵢ, C vⱼ⟫ / (αᵢ − βⱼ)`; it sends `C` to `δ` times the unique solution of
`AX − XB = C` (§B.3). Prove that there are finitely many unitaries `Uₖ` of `E` and `Vₖ` of `F` and
complex numbers `aₖ` with `∑ₖ |aₖ| ≤ π/2` such that `m_δ(C) = ∑ₖ aₖ Uₖ C Vₖ` for every `C`; the
unitaries and the coefficients do not depend on `C`. Route: by the exterior Fourier identity,
`m_δ(C) = ∫ δ k(δt) e^{itA} C e^{−itB} dt` (the integral representation of Albeverio, Makarov and
Motovilov 2003, Theorem 2.7, formula (2.12)), an integral of unitary actions with total mass
`∫ |k| = π/2`; the maps `C ↦ λ U C V` with `|λ| = 1` form a compact set in finite dimension, so
the normalised integral lies in its convex hull, and Carathéodory's theorem makes the combination
finite. The statement is over `ℂ`; for real scalars the bound it implies, `δ N(X) ≤ (π/2) N(C)`,
is §B.13, proved through the orbit hull of §B.14.
*Needs:* §A.23, §A.24, §B.3; Tau Ceti `TauCeti.UnitaryOrbitCertificate`; Mathlib `convexHull`,
`NormedSpace.exp`, Carathéodory's theorem `convexHull_eq_union`.

**Checks.**
- For `A = ¼·1` and `B = 0` on `ℂ`, `δ = ¼` and `m_δ` is the identity, a combination of mass
  `1 ≤ π/2`. The unnormalised multiplier, with entries `1/(αᵢ − βⱼ)`, is multiplication by `4`,
  of operator norm `4`; a combination of unitary actions of mass at most `π/2` has norm at most
  `π/2`, so the normalisation by `δ` is needed.
- Mass `1` does not suffice. For `A = diag(0, 2)` and `B = diag(1, −1)`, every `|αᵢ − βⱼ|` is at
  least `δ = 1`, and the unitary `C = (1/√2)[[1, 1], [1, −1]]` has `m_δ(C) = (1/√2)[[−1, 1], [1, −1/3]]`,
  of operator norm `(2 + √10)/(3√2) ≈ 1.2168 > 1 = ‖C‖`.

### B.13 The pairwise unitarily invariant Sylvester bound

Under pairwise separation by `δ > 0` as in §B.11, every unitarily invariant seminorm `N` on the
maps `F → E` satisfies `δ N(X) ≤ (π/2) N(C)` for `AX − XB = C`; the same holds on invariant
subspaces, as in §B.9. Route: §B.11 and Fan dominance, through §B.14.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_le_pi_div_two_mul_map_sylvester_apply_of_mem`.

### B.14 The unitary-orbit form

Under pairwise separation by `δ ≥ 0` as in §B.11, `(2δ/π) X` lies in the convex hull of the
two-sided unitary orbit `{U C V : U, V unitary}` of `C = AX − XB`: the scaled solution `δX` is a
combination of the `U C V` with nonnegative coefficients of total mass `π/2`.
*In Tau Ceti:* `ContinuousLinearMap.smul_mem_twoSidedUnitaryOrbitHull_sylvester_apply`.

### B.15 The Frobenius bound with constant one

Under pairwise separation by `δ > 0` as in §B.11, `δ‖X‖_F ≤ ‖C‖_F` for `AX − XB = C`. Route:
the coordinate equation §B.4.
*In Tau Ceti:* `ContinuousLinearMap.mul_frobenius_le_frobenius_sylvester_apply`.

### B.16 The domain-aware pairwise bound

Prove `mul_norm_le_pi_div_two_mul_norm_of_sylvesterEquation`: let `A` on `E` and `B` on `F` be
self-adjoint partial operators on complex Hilbert spaces and `δ > 0` with `δ ≤ |a − b|` for every
real point `a` of the spectrum of `A` and `b` of the spectrum of `B`
(`LinearPMap.SpectralSetsSeparated A B univ univ δ`; the spectra are real). If bounded
`X, C : F → E` satisfy the domain-aware equation `AX − XB = C`, then `δ‖X‖ ≤ (π/2)‖C‖`
(Seelmann 2014, Theorem 3.1; for weak solutions, Albeverio, Makarov and Motovilov 2003,
Theorem 2.7). Bhatia, Davis and McIntosh proved the bound with a universal constant
(Bhatia–Davis–McIntosh 1983, Theorem 4.1); by Albeverio, Makarov and Motovilov 2003, Remark 2.8,
they placed the best constant between `√(3/2)` and `2`, the value `π/2` goes back to Sz.-Nagy, and
its sharpness is McEachin's. For bounded `A` and `B`, viewed as total partial operators, it is the
operator-norm `π/2` bound on every Hilbert space. Route: `X` is
the weak integral `∫ k(δt) e^{itA} C e^{−itB} dt` of the unitary groups of `A` and `B` against the
Haagerup–Zsidó kernel, whose norm is at most `(π/2)‖C‖/δ` by the kernel-mass bound. To identify it
with `X`, cut `A` and `B` down by the spectral projections of bounded intervals: on their ranges
they act as bounded self-adjoint operators with `δ`-separated spectra, the cut-down `X` solves the
cut-down equation, and there the exterior Fourier identity, integrated against the spectral
measures, gives `(λ − μ)⁻¹` where `AX − XB = C` gives `(λ − μ)` times `X`; the cutoffs converge
strongly to the identity. Uniqueness of the solution is §B.17.
*Needs:* §A.23, §A.26; Tau Ceti `LinearPMap.SylvesterEquation`, `LinearPMap.SpectralSetsSeparated`,
`LinearPMap.spectrum`, `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (Stone's
theorem); SelfAdjointSpectralTheory SA-E01 (the spectral measure), SA-E06 and SA-E07 (spectral
projections commute with resolvents and preserve the domain), SA-E31 (strong convergence of
interval cutoffs) and SA-E37 (spectral ranges of bounded sets lie in the domain).

**Checks.**
- Constant one fails under pairwise separation. For `A = diag(0, 2)` and `B = diag(1, −1)` on
  `ℂ²`, every distance between the spectra is at least `δ = 1`, but neither spectrum lies in an
  interval whose `δ`-neighbourhood misses the other. The unitary `C = (1/√2)[[1, 1], [1, −1]]`
  gives the solution `Xᵢⱼ = Cᵢⱼ/(αᵢ − βⱼ)`, that is `X = (1/√2)[[−1, 1], [1, −1/3]]`, with
  `‖X‖ = (2 + √10)/(3√2) ≈ 1.2168`, more than `‖C‖ = 1` and less than `π/2 ≈ 1.5708`.
- The gap cannot be dropped to disjointness. On `ℓ²(ℕ)` let `A` and `B` be the diagonal operators
  with entries `aₙ = n` and `bₙ = n + 1/(n + 2)` on their maximal domains. Their spectra `ℕ` and
  `{n + 1/(n + 2)}` are closed and disjoint at distance `0`. For `C_k = e_k ⊗ e_k`, of norm one,
  the solution is `X_k = −(k + 2) e_k ⊗ e_k`, of norm `k + 2`: no bound `‖X‖ ≤ K‖C‖` holds.

### B.17 Rosenblum's theorem

Prove `eq_zero_of_intertwines_of_disjoint_spectrum`: let `A` on `E` and `B` on `F` be
self-adjoint partial operators on complex Hilbert spaces with disjoint spectra. A bounded
`X : F → E` that maps the domain of `B` into that of `A` and satisfies `AXy = XBy` for every `y`
in the domain of `B` (Tau Ceti's `LinearPMap.Intertwines B A X`) is zero. For bounded `A` this is
part of a theorem of Krein, found independently by Daleckii and by Rosenblum (Albeverio, Makarov
and Motovilov 2003, Lemma 2.5 and the paragraph before it; Rosenblum 1956); for spectra at positive
distance it is the uniqueness in Seelmann 2014, Theorem 3.1. So the domain-aware Sylvester
equation has at most one bounded solution. Route: the intertwining passes to resolvents (Tau Ceti
`LinearPMap.intertwines_iff_comp_resolvent_eq`), hence to the spectral measures,
`X P_B(J) = P_A(J) X` for Borel `J`; the spectral measure of `A` vanishes on Borel sets of
resolvent points, so `X = X P_B(σ(B)) = P_A(σ(B)) X = 0`. A route without the Borel calculus uses
the Cayley transforms: `X` intertwines their continuous functional calculi (Tau Ceti
`LinearPMap.Intertwines.comp_cfc_cayley_eq`), and continuous symbols equal to `1` on the Cayley
image of `σ(B)` and `0` on that of `σ(A)` away from shrinking neighbourhoods of the point `1`
converge strongly to the identity and to `0`, because `1` carries no mass of any diagonal spectral
measure of a Cayley transform.
*Needs:* Tau Ceti `LinearPMap.spectrum`, `LinearPMap.Intertwines`,
`LinearPMap.intertwines_iff_comp_resolvent_eq`, `LinearPMap.cayley`,
`LinearPMap.Intertwines.comp_cfc_cayley_eq`; SelfAdjointSpectralTheory SA-E01, SA-E05 (the
resolvent formula) and SA-E08 (spectral support), or SA-E02 (zero mass at the Cayley singular
point) for the second route.

**Checks.**
- Disjoint point spectra do not suffice. Multiplication by `x` on `L²(0, 1)` is bounded and
  self-adjoint with spectrum `[0, 1]` and no eigenvalue; with `A = B` equal to it, the point
  spectra are empty and disjoint, and `X = 1` intertwines them. A statement with eigenvalues in
  place of spectra, which suffices in finite dimension, is false.
- For `A` and `B` the diagonal operators `n` and `n + 1/(n + 2)` of §B.16, the spectra are disjoint
  at distance `0`, and the theorem still applies: the only bounded intertwiner is `0`, since
  `(aₘ − bₙ) Xₘₙ = 0` with `aₘ ≠ bₙ` for every matrix entry.

### B.19 The bounded Rosenblum theorem

Let `A` on `E` and `B` on `F` be bounded self-adjoint operators on complex Hilbert spaces whose
spectra (Mathlib `spectrum ℂ`) are disjoint. Prove that every bounded `X : F → E` with `AX = XB`
is zero (Rosenblum 1956; Albeverio, Makarov and Motovilov 2003, Lemma 2.5, which credits Krein
first): the bounded/partial uniqueness bridge, which specialises §B.17 to bounded operators.
Route: viewed as total partial operators, `A` and `B` are
self-adjoint with the same spectra and `X` solves the domain-aware equation with `C = 0` (Tau Ceti
`LinearPMap.isSelfAdjoint_toPMap_top`, `ContinuousLinearMap.spectrum_toPMap_top`,
`LinearPMap.SylvesterEquation.ofBounded_iff`), so §B.17 applies. Directly, without §B.17: a
continuous function equal to `1` on the spectrum of `B` and `0` on that of `A`, which are disjoint
compact sets, gives `X = X f(B) = f(A) X = 0` (Tau Ceti `ContinuousLinearMap.comp_cfc_eq_cfc_comp`).
*Needs:* Tau Ceti `LinearPMap.isSelfAdjoint_toPMap_top`, `ContinuousLinearMap.spectrum_toPMap_top`,
`LinearPMap.SylvesterEquation.ofBounded_iff`, and §B.17; or `ContinuousLinearMap.comp_cfc_eq_cfc_comp`
alone.

### Examples

- In finite dimension the Sylvester equation is solved coordinatewise: in eigenbases,
  `(αᵢ − βⱼ) Xᵢⱼ = Cᵢⱼ` (§B.4), so the solution is unique exactly when no `αᵢ` equals a `βⱼ`, which
  is §B.2, and the bounded/partial uniqueness bridge §B.19 for matrices.
- The bounded instance of §B.16 for `A = diag(0, 2)` and `B = diag(1, −1)` is worked out in its
  Checks; it illustrates the finite-dimensional pairwise bound §B.13, and the same example shows
  in §B.12 that a representation by unitary actions needs mass above `1`.

### Dependencies

Part A (the kernel, for §B.11–§B.14 and §B.16). PrincipalAngles (the separation predicates) and
Majorization (unitarily invariant seminorms, Ky Fan sums, Fan dominance and orbit hulls).
SelfAdjointSpectralTheory Part E (the spectral measure of an unbounded self-adjoint operator,
§B.16 and §B.17). Tau Ceti: the `LinearPMap` resolvent, spectrum, separation, intertwining and
Sylvester-equation API, the Cayley transform and its continuous functional calculus, Stone's
theorem, coercive operators. Mathlib: `LinearPMap`, continuous functional calculus, convex hulls,
eigenvector bases of symmetric operators.

## Part C: the Davis–Kahan `sin Θ` theorems

The residual form controls the angle from an approximate invariant subspace through `R = AX − XM`;
the perturbation form controls invariant subspaces of `A` and `B` through `B − A`. Trial
compression and residuals turn approximate invariance into operator equations, and reduced
extensions and graph subspaces give the geometric models that turn those equations into
subspace-angle statements (§C.1–§C.14). The Sylvester bounds of Part B become directed sine bounds
after projection onto complementary subspaces, and finite spectral and equal-rank bridges give the
projector and unitarily invariant forms (§C.15–§C.24). Ordered two-block form separation gives the
`sin 2Θ` estimate; Ritz compression with exterior separation gives the tangent estimate together
with the transversality that keeps the principal tangents finite; and an off-diagonal perturbation
sharpens the eigenvector product inequality to the `tan 2θ` form and the quarter-acute bound
(§C.25–§C.31). The angle maps, spectral subspaces, separation predicates and equal-rank projector
identities come from PrincipalAngles (Conventions 4 and 5).

**Milestone C1 — trial maps, residuals, and graph subspaces.** §C.1–§C.14.

**Milestone C2 — dimension-free and finite spectral `sin Θ` theory.** §C.15–§C.24.

**Milestone C3 — double-angle and tangent theory.** §C.25–§C.31.

### C.1 The compression

For a bounded operator `A` on `E` and a trial map `X : F → E`, define the compression `X†AX` on
`F`. For an isometry `X` it is `A` cut down to `range X`, in the coordinates of `F`.
*In Tau Ceti:* `ContinuousLinearMap.compression`.

### C.2 The residual

For a trial map `X : F → E` and a model operator `M` on `F`, define the residual `R = AX − XM`,
the Sylvester map §B.1 of `A` and `M` applied to `X`.
*In Tau Ceti:* `ContinuousLinearMap.sylvester` (as `A.sylvester M X`).

### C.3 The Ritz residual

For an isometric trial map `X`, the Ritz residual is the residual §C.2 with `M = X†AX`. It is
orthogonal to the trial range, `X†(AX − X X†AX) = 0`, and when `range X` has an orthogonal
projection it equals `P_{(range X)⊥} A X`.
*In Tau Ceti:* `ContinuousLinearMap.sylvester_compression`, `ContinuousLinearMap.adjoint_comp_sylvester_compression`.

### C.4 Minimality of the Ritz residual

Let `X : F → E` be an isometry between finite-dimensional inner product spaces. For every model
`M` on `F`, `‖AX − XM‖_F² = ‖AX − X X†AX‖_F² + ‖X†AX − M‖_F²`, so among model operators on the
trial space the Ritz choice `M = X†AX` minimises the Frobenius norm of the residual. It minimises
`N(AX − XM)` for every unitarily invariant seminorm `N` on the maps `F → E` as well.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.sq_frobenius_sylvester_eq_sq_frobenius_sylvester_compression_add`, `TauCeti.UnitarilyInvariantSeminorm.map_sylvester_compression_le_map_sylvester`.

### C.5 The sine embedding

For a trial map `X : F → E` and a subspace `V` of `E` with an orthogonal projection, define the
sine embedding `P_{V⊥} X`, the cross-complement map that measures the sine of the angle from the
trial range to `V`. For the inclusion of a subspace `Z` it is the map `Z → E`, `z ↦ P_{V⊥} z`;
for square maps it is the directed sine map `P_{V⊥} P_U` of Convention 4.
*In Tau Ceti:* `Submodule.sinThetaEmbedding` (for the inclusion of a subspace), `Submodule.sinThetaMap` (the square form).

### C.6 The cosine embedding

For `X` and `V` as in §C.5, define the cosine embedding `P_V X`, the cross-projection map that
measures the cosine of the same angle; for square maps it is `P_V P_U`.
*In Tau Ceti:* `Submodule.cosThetaMap` (the square form).

### C.7 The singular values of the sine embedding

For an isometry `X : F → E` between finite-dimensional inner product spaces and a subspace `V` of
`E`, the singular values of `P_{V⊥} X` are the principal sines from `range X` to `V`. For the
inclusion of a subspace `Z`, the singular values of the sine embedding are the principal sines
from `Z` to `V`, the zero tail included, with no equality of dimensions required.
*In Tau Ceti:* `Submodule.principalSines_range_eq_singularValues`, `Submodule.singularValues_sinThetaEmbedding`.

### C.8 The singular values of the cosine embedding

For an isometry `X : F → E` between finite-dimensional inner product spaces and a subspace `V` of
`E`, the singular values of `P_V X` are the principal cosines from `range X` to `V`.
*In Tau Ceti:* `Submodule.principalCosines_range_eq_singularValues`.

### C.9 The reduced extension

For a bounded operator `A` on `E`, a subspace `U` with an orthogonal projection and a real scalar
`κ`, define the reduced extension `A P_U + κ P_{U⊥}`, which agrees with `A` on `U` and is `κ` on
`U⊥`. If `A` is symmetric and `U` is `A`-invariant, the reduced extension is symmetric.
*In Tau Ceti:* `ContinuousLinearMap.reducedExtension`, `ContinuousLinearMap.isSymmetric_reducedExtension`.

### C.10 The form bound of the reduced extension

Let `A` be symmetric, `U` a finite-dimensional `A`-invariant subspace, `c` real and `A_κ` the
reduced extension §C.9. If the eigenvalues of `A` on `U` lie in `(−∞, c]` and `κ ≤ c`, then
`Re⟪A_κ x, x⟫ ≤ c‖x‖²` for every `x ∈ E`; if they lie in `[c, ∞)` and `κ ≥ c`, then
`c‖x‖² ≤ Re⟪A_κ x, x⟫` for every `x ∈ E`.
*In Tau Ceti:* `ContinuousLinearMap.re_inner_reducedExtension_self_le_of_pointSpectrumIn`, `ContinuousLinearMap.le_re_inner_reducedExtension_self_of_pointSpectrumIn`.

### C.11 Angular operators

For a subspace `U` with an orthogonal projection, an angular operator from `U` to `U⊥` is a
bounded operator `X` on `E` with `X P_U = X` and `P_U X = 0`: it vanishes on `U⊥` and takes values
in `U⊥`.
*In Tau Ceti:* `Submodule.IsAngularOperator`.

### C.12 The graph subspace

For an angular operator `X`, define `graph(U, X) = {u + Xu : u ∈ U}`, the image of `U` under
`1 + X`.
*In Tau Ceti:* `Submodule.graphSubspace`.

### C.13 The graph projection formula

On a complete space, let `X` be an angular operator from `U` to `U⊥` whose graph has an orthogonal
projection, and put `T = P_U + X`. Then `1 + X†X` is invertible and the orthogonal projection onto
the graph is `P_graph = T(1 + X†X)⁻¹T†`.
*In Tau Ceti:* `Submodule.IsAngularOperator.starProjection_graphSubspace`.

### C.14 The exact graph gap

For an angular operator `X` from `U` to `U⊥` whose graph has an orthogonal projection,
`‖P_U − P_graph‖ = ‖X‖/√(1 + ‖X‖²)`; in particular the gap is less than `1`.
*In Tau Ceti:* `Submodule.IsAngularOperator.projectionGap_graphSubspace`, `Submodule.IsAngularOperator.projectionGap_graphSubspace_lt_one`.

### C.15 The dimension-free directed `sin Θ` bound

Let `A` and `B` be bounded symmetric operators on an inner product space `E`, `U` an `A`-invariant
and `W` a `B`-invariant subspace with orthogonal projections, `g > 0` and `c` real, with
`(c + g)‖u‖² ≤ Re⟪Au, u⟫` for `u ∈ U` and `Re⟪Bw, w⟫ ≤ c‖w‖²` for `w ∈ W`. Then
`‖P_W P_U‖ ≤ ‖B − A‖/g`, on arbitrary inner product spaces, with no completeness or finite
dimension. Route: the reduced extensions §C.9–§C.10 and the separated bound §B.8.
*In Tau Ceti:* `Submodule.mul_norm_starProjection_comp_starProjection_le_norm_sub`, `Submodule.norm_starProjection_comp_starProjection_le_norm_sub_div`.

### C.16 The dimension-free projector-gap bounds

Let `A` and `B` be bounded symmetric, `U` `A`-invariant and `V` `B`-invariant with orthogonal
projections, and `g > 0`. If `(c + g)‖u‖² ≤ Re⟪Au, u⟫` on `U` and `Re⟪Bw, w⟫ ≤ c‖w‖²` on `V⊥`,
the directed gap satisfies `‖P_{V⊥} P_U‖ ≤ ‖B − A‖/g` (§C.15 with `W = V⊥`). If moreover
`(c′ + g)‖v‖² ≤ Re⟪Bv, v⟫` on `V` and `Re⟪Az, z⟫ ≤ c′‖z‖²` on `U⊥`, the reversed estimate holds
too, both directed sine bounds hold, and `‖P_U − P_V‖ ≤ ‖B − A‖/g`.
*In Tau Ceti:* `Submodule.mul_directedProjectionGap_le_norm_sub`, `Submodule.directedProjectionGap_le_norm_sub_div`, `Submodule.mul_projectionGap_le_norm_sub`, `Submodule.projectionGap_le_norm_sub_div`.

### C.17 The residual `sin Θ` theorem

Let `A` on `E` and `M` on `F` be symmetric operators on finite-dimensional inner product spaces
over `𝕜`, `U` an `A`-invariant target subspace, `X : F → E` a linear isometry, and `R = AX − XM`.
Suppose `a ≤ b`, `δ > 0`, the eigenvalues of `M` lie in `[a, b]`, and the eigenvalues of `A` on
`U⊥` lie outside `(a − δ, b + δ)`. Every unitarily invariant seminorm `N` on the maps `F → E`
then satisfies `δ N(P_{U⊥} X) ≤ N(R)`, and the singular values of `P_{U⊥} X` are the directed
principal sines from `range X` to `U` (§C.7) (Davis and Kahan 1970, the `sin Θ` theorem). The
inequality holds for every linear `X : F → E`; the isometry makes it a bound on angles.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`.

### C.18 The perturbation `sin Θ` theorem

Let `A` and `B` be symmetric on a finite-dimensional inner product space `E`, `U` `A`-invariant,
`V` `B`-invariant and `δ > 0`. If the eigenvalues of `A` on `U` lie in `[a, b]` and those of `B` on
`V⊥` outside `(a − δ, b + δ)`, or the eigenvalues of `B` on `V⊥` lie in `[a, b]` and those of `A`
on `U` outside `(a − δ, b + δ)`, then every unitarily invariant seminorm `N` on the operators of
`E` satisfies `δ N(P_{V⊥} P_U) ≤ N(B − A)` (Davis and Kahan 1970, the `sin Θ` theorem).
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_map_sub_swap`, `Submodule.mul_norm_sinThetaMap_le_norm_sub_of_pointIntervalExteriorGap` (the operator norm).

### C.19 The canonical spectral-subspace residual form

For `Ω ⊆ ℝ`, let `U` be the point-spectral subspace of `A` selected by `Ω` (Convention 4). With `A`,
`M` and `δ` as in §C.17, if the eigenvalues of `M` lie in `[a, b]` and those of `A` on the
point-spectral subspace selected by `ℝ ∖ Ω` lie outside `(a − δ, b + δ)`, then
`δ N(P_{U⊥} X) ≤ N(AX − XM)` for every linear `X : F → E` and every unitarily invariant seminorm
`N`. For `Ω = (a − δ, b + δ)` the exterior hypothesis holds automatically.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_orthogonal_pointSpectralSubspace_comp_le_map_sylvester_apply`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_orthogonal_pointSpectralSubspace_Ioo_comp_le_map_sylvester_apply`.

### C.20 The canonical eigenspace-projector bound

Let `A` and `B` be symmetric on a finite-dimensional inner product space, `s, t ⊆ ℝ`, and `U` and
`V` the point-spectral subspaces of `A` selected by `s` and of `B` selected by `t`, with
`dim U = dim V`. If the eigenvalues of `A` on `U` lie in `[a, b]` and those of `B` on `V⊥` outside
`(a − δ, b + δ)`, then `δ‖P_U − P_V‖ ≤ ‖B − A‖`. The same holds for any `A`-invariant `U` and
`B`-invariant `V` of equal dimension. Route: §C.18 in the operator norm, with the equal-rank
identity `‖P_U − P_V‖ = ‖P_{V⊥} P_U‖` of PrincipalAngles.
*In Tau Ceti:* `Module.End.mul_norm_sub_starProjection_pointSpectralSubspace_le`, `Submodule.mul_projectionGap_le_norm_sub_of_pointIntervalExteriorGap`.

### C.21 The Frobenius `sin Θ` corollary

Under the hypotheses of §C.17, `δ‖P_{U⊥} X‖_F ≤ ‖AX − XM‖_F`; under those of §C.18,
`δ‖P_{V⊥} P_U‖_F ≤ ‖B − A‖_F`.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_frobenius_starProjection_comp_le_frobenius_sylvester_apply`, `TauCeti.UnitarilyInvariantSeminorm.mul_frobenius_starProjection_comp_starProjection_le_frobenius_sub`.

### C.22 The Ky Fan `sin Θ` corollary

Under the hypotheses of §C.17, `δ K_k(P_{U⊥} X) ≤ K_k(AX − XM)` for every `k`; under those of
§C.18, `δ K_k(P_{V⊥} P_U) ≤ K_k(B − A)` for every `k`.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_kyFan_starProjection_comp_le_kyFan_sylvester_apply`, `TauCeti.UnitarilyInvariantSeminorm.mul_kyFan_starProjection_comp_starProjection_le_kyFan_sub`.

### C.23 The pairwise `π/2` perturbation theorem

Let `A` and `B` be symmetric on a finite-dimensional inner product space `E`, `U` `A`-invariant,
`V` `B`-invariant, and `δ > 0` with every eigenvalue of `A` on `U` at distance at least `δ` from
every eigenvalue of `B` on `V⊥`. Then `δ N(P_{V⊥} P_U) ≤ (π/2) N(B − A)` for every unitarily
invariant seminorm `N` on the operators of `E`. Route: §B.13 on invariant subspaces.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_starProjection_le_pi_div_two_mul_map_sub`.

### C.24 The symmetric two-orientation theorem with constant one

Let `A` and `B` be symmetric on a finite-dimensional inner product space `E`, `U` `A`-invariant,
`V` `B`-invariant and `δ > 0`. Suppose the interval/exterior gap holds in both orientations: the
eigenvalues of `A` on `U` lie in `[a, b]` and those of `B` on `V⊥` outside `(a − δ, b + δ)`, and
the eigenvalues of `B` on `V` lie in `[c, d]` and those of `A` on `U⊥` outside `(c − δ, d + δ)`.
Then `δ N(P_U − P_V) ≤ N(B − A)` for every unitarily invariant seminorm `N`, and the same bound
holds for the symmetric sine angle operator `|P_U − P_V|`. Unlike §C.18, both orientations are
needed.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_sub_starProjection_le_map_sub`, `TauCeti.UnitarilyInvariantSeminorm.mul_map_sinAngleOperator_le_map_sub`.

### C.25 The per-eigenvector `sin 2θ` product bound

Let bounded symmetric `A` and `H` act on an inner product space over `𝕜`, let `U` be `A`-invariant
with an orthogonal projection, let `a < b`, and assume `Re⟪Az, z⟫ ≤ a‖z‖²` on `U⊥` and
`b‖y‖² ≤ Re⟪Ay, y⟫` on `U`. If `‖Hv‖ ≤ ε‖v‖` for every `v` and a unit vector `x` satisfies
`(A + H)x = λx` with `λ` real, then `(b − a)‖P_U x‖‖P_{U⊥} x‖ ≤ ε` (Davis 1963, the `sin 2θ`
theorem).
*In Tau Ceti:* `LinearMap.IsSymmetric.sin_two_theta_le`.

### C.26 The per-eigenvector angle form

Under §C.25, put `θ = arccos ‖P_U x‖`, the angle between `x` and `U`. Then
`(b − a) sin(2θ) ≤ 2ε`.
*In Tau Ceti:* `LinearMap.IsSymmetric.sin_two_arccos_le`.

### C.27 The finite-dimensional `sin 2Θ` perturbation theorem

Let finite-dimensional symmetric `A` and `B` leave `U` and `V` invariant. If `a < b` and `A`
satisfies the two-block form bounds `Re⟪Az, z⟫ ≤ a‖z‖²` on `U⊥` and `b‖y‖² ≤ Re⟪Ay, y⟫` on `U`,
then every unitarily invariant seminorm `N` on the operators of the space satisfies
`(b − a) N(2P_{U⊥} P_V P_U) ≤ 2N(B − A)` (Davis and Kahan 1970, the `sin 2Θ` theorem). No spectral
hypothesis is placed on `B`.
*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.mul_map_sinTwoAngleOperator_le_two_mul_map_sub`, `Submodule.sinTwoAngleOperator`.

### C.28 The Ritz-residual `tan Θ` theorem, equal ranks

Prove `directedProjectionGap_lt_one_and_mul_map_tanThetaMap_le`: let `A` be symmetric on a
finite-dimensional inner product space `E` over `𝕜`, `U` an `A`-invariant subspace, and `Z` a
subspace with `dim Z = dim U`. Let `M` be the compression of `A` to `Z` and `R : Z → E` its Ritz
residual, `R = Aι − ιM` with `ι` the inclusion of `Z`. Suppose `β ≤ α`, `δ > 0`, the eigenvalues
of `M` lie in `[β, α]`, and the eigenvalues of `A` on `U⊥` lie in `[α + δ, ∞)`. Then the directed
gap `‖P_{U⊥} P_Z‖` from `Z` to `U` is less than `1`, so every principal angle `θⱼ` from `Z` to `U`
is below `π/2`; and the tangent map `T_{Z,U} : Z → E`, defined in a right singular basis of the
sine embedding of `Z` by the diagonal values `tan θⱼ` followed by the inclusion (Tau Ceti
`Submodule.tanThetaMap Z U`), whose singular values are the principal tangents, satisfies
`δ N(T_{Z,U}) ≤ N(R)` for every unitarily invariant seminorm `N` on the maps `Z → E` (Davis and
Kahan 1970, the `tan Θ` theorem). The hypotheses force `Z ∩ U⊥ = 0`: a unit `z` there would have
`α + δ ≤ ⟪Az, z⟫ = ⟪Mz, z⟫ ≤ α`. Hence `dim Z ≤ dim U` always, and §C.28 and §C.29 together cover
every case. Route: the proof of Davis and Kahan, in which the transversality makes `Z` the graph
of the tangent operator from `U` to `U⊥`, the Ritz residual is orthogonal to `Z` (§C.3), and the
one-sided position of the two spectra, the eigenvalues of `M` below those of `A` on `U⊥`, gives
the constant one.
*Needs:* §C.1–§C.3, §C.5, §C.7, the separated Sylvester bounds §B.7–§B.10; Tau Ceti
`Submodule.tanThetaMap`, `Submodule.singularValues_tanThetaMap`,
`Submodule.directedProjectionGap_lt_one_iff`,
`Submodule.forall_principalAngles_lt_pi_div_two_iff_directedProjectionGap_lt_one`,
`TauCeti.UnitarilyInvariantSeminorm`.

**Checks.**
- The constant is sharp. On `ℝ²` let `A = diag(0, 1)`, `U = span e₁` and `Z` the span of
  `z = (cos φ, sin φ)` with `0 < φ < π/2`. Then `M = sin²φ = α = β`, `A` is `1` on `U⊥`, so
  `δ = cos²φ`, and `R = Az − zM = sin φ cos φ (−sin φ, cos φ)` has norm `sin φ cos φ`. The angle
  from `Z` to `U` is `φ`, and `δ tan φ = sin φ cos φ = ‖R‖`: equality. At `φ = π/4` both sides
  are `1/2`, while `δ sin φ = √2/4`; a bound with a smaller constant than one is false.

### C.29 The Ritz-residual `tan Θ` theorem, lower rank

Under the hypotheses of §C.28 with `dim Z < dim U` in place of `dim Z = dim U`, prove the same
two conclusions: the directed gap from `Z` to `U` is less than `1`, and the tangent map
`T_{Z,U} : Z → E` of Tau Ceti's `Submodule.tanThetaMap Z U`, whose singular values are the
principal tangents, satisfies `δ N(T_{Z,U}) ≤ N(R)` for every unitarily invariant seminorm `N` on
the maps `Z → E` (Davis and Kahan 1970, the generalized `tan Θ` theorem). Route: a compression
reduces it to §C.28. Put `U′ = P_U Z` and `E′ = U′ ⊕ U⊥`, and let `A′` be the compression of `A`
to `E′`, which is `P_{U′}A` on `U′` and `A` on `U⊥`: `U′` is `A′`-invariant with complement `U⊥`
in `E′`, and `dim U′ = dim Z` because `Z ∩ U⊥ = 0`. Then `Z ⊆ E′`, the compression of `A′` to `Z`
is `M`, its Ritz residual is `P_{E′}R`, and the sine embedding `P_{U⊥}` on `Z`, hence the directed
gap and the tangent map, is unchanged. §C.28 for `A′`, `U′` and `Z`, with `N` restricted to the
maps into `E′` (still unitarily invariant, since unitaries of `E′` extend to `E`), gives
`δ N(T_{Z,U}) ≤ N(P_{E′}R) ≤ N(R)`, the last step because `P_{E′} = (1 + S)/2` with the unitary
`S = 2P_{E′} − 1`.
*Needs:* §C.28, §C.1; Tau Ceti `Submodule.tanThetaMap`.

### C.30 The off-diagonal `tan 2θ` product bound

Under the hypotheses of §C.25, with `x` an eigenvector of `A + H` that need not be a unit vector,
assume further that both diagonal blocks of `H` relative to `U ⊕ U⊥` vanish: `⟪u, Hu′⟫ = 0` for
`u, u′ ∈ U` and `⟪w, Hw′⟫ = 0` for `w, w′ ∈ U⊥`. Then
`(b − a)‖P_U x‖‖P_{U⊥} x‖ ≤ |‖P_U x‖² − ‖P_{U⊥} x‖²| ε`. For a unit `x` at angle `θ` from `U`,
away from `cos 2θ = 0`, this is `(b − a)|tan 2θ| ≤ 2ε`.
*In Tau Ceti:* `LinearMap.IsSymmetric.tan_two_theta_le`.

### C.31 The quarter-acute bound for off-diagonal perturbations

Let `A` and `H` be bounded self-adjoint operators on a Hilbert space over `𝕜`, `U` a closed
`A`-invariant subspace and `V` a closed `(A + H)`-invariant subspace, and `a < b`. Suppose `A`
satisfies `b‖u‖² ≤ Re⟪Au, u⟫` for `u ∈ U` and `Re⟪Az, z⟫ ≤ a‖z‖²` for `z ∈ U⊥`, that `A + H`
satisfies the same two bounds relative to `V` and `V⊥`, and that `H` is off-diagonal relative to
`U ⊕ U⊥`: `H(U) ⊆ U⊥` and `H(U⊥) ⊆ U`. Prove `‖P_U − P_V‖ < √2/2`. In finite dimension
`dim U = dim V`, and the conclusion is equivalent to every principal angle from `U` to `V` being
less than `π/4` (Davis and Kahan 1970, the `tan 2Θ` theorem, in the form of Kostrykin, Makarov
and Motovilov 2004, (1.2) and (1.4)). Route: the bounds and the off-diagonal shape of `H` give
`V ∩ U⊥ = 0` and `V⊥ ∩ U = 0` (a unit vector in either would have its form value both at most `a`
and at least `b`, since `⟪Hz, z⟫ = 0` for `z` in `U` or in `U⊥`). The same computation bounds the
graph: for `z = u + w` in `V` with `u ∈ U` and `w ∈ U⊥`,
`b‖z‖² ≤ Re⟪(A + H)z, z⟫ ≤ ‖A‖‖u‖² + a‖w‖² + 2‖H‖‖u‖‖w‖`, so
`(b − a)‖w‖² ≤ (‖A‖ − b)‖u‖² + 2‖H‖‖u‖‖w‖` and `‖w‖ ≤ c‖u‖` for a constant `c`. Hence `P_U` is
bounded below on `V`, its image is closed, and `V⊥ ∩ U = 0` makes it all of `U`: `V` is the graph
of a bounded angular operator `K` from `U` to `U⊥` (§C.11, §C.12); the Davis–Kahan `tan 2Θ`
argument, of which §C.30 is the eigenvector case, gives
`‖K‖ ≤ tan(½ arctan(2‖H‖/(b − a))) < 1`, and the exact graph gap §C.14, `‖K‖/√(1 + ‖K‖²)`,
concludes. In finite dimension the two trivial intersections give `dim U = dim V`, so the
projection gap equals the directed gap and Tau Ceti's
`Submodule.forall_principalAngles_lt_pi_div_four_iff` converts it.
*Needs:* §C.11, §C.12, §C.14, §C.30; Tau Ceti
`Submodule.projectionGap_eq_directedProjectionGap_of_finrank_eq`,
`Submodule.forall_principalAngles_lt_pi_div_four_iff`.

**Checks.**
- On `ℝ²` let `A = diag(1, 0)`, `U = span e₁`, `a = 0`, `b = 1`, and `H = [[0, h], [h, 0]]`. The
  eigenvalues `(1 ± √(1 + 4h²))/2` of `A + H` are at least `1` and at most `0`, so `V`, its top
  eigenline, satisfies the hypotheses for every `h`. The angle from `U` to `V` is
  `θ = ½ arctan(2h) < π/4`, with `‖P_U − P_V‖ = sin θ`: `0.6154` at `h = 2` and `0.7053` at
  `h = 100`, below and tending to `√2/2 ≈ 0.7071`. The bound `√2/2` cannot be lowered.
- The off-diagonal hypothesis is needed. For `H = diag(−1, 1)`, `A + H = diag(0, 1)` satisfies the
  two bounds relative to `V = span e₂`, which is orthogonal to `U`: `‖P_U − P_V‖ = 1`.

### Examples

- The residual form §C.17, in the example of §C.28's Check, gives `δ sin φ ≤ ‖R‖`, the weaker
  `cos²φ sin φ ≤ sin φ cos φ`.
- For `A = diag(1, 0)` and `B = [[1, ε], [ε, 0]]` with `ε = 2/3`, the perturbed top eigenline is
  at angle `θ` with `sin²θ = 1/5`, the gap from the top eigenvalue `1` of `A` to the lowest
  eigenvalue `(1 − 5/3)/2 = −1/3` of `B` is `δ = 4/3`, and the perturbation form §C.18 reads
  `(4/3)/√5 ≈ 0.596 ≤ ‖B − A‖ = 2/3`.
- In the same example the double-angle and tangent bounds apply to `x = (2, 1)/√5`, the top unit
  eigenvector of `B = A + H` with `H = B − A` off-diagonal, `a = 0`, `b = 1` and `ε = 2/3`: §C.25
  reads `‖P_U x‖‖P_{U⊥} x‖ = 2/5 ≤ 2/3`, and §C.30 holds with equality,
  `2/5 = |4/5 − 1/5| · (2/3)`, that is `tan 2θ = 4/3 = 2ε/(b − a)`.

### Dependencies

Part B (the separated, interval/exterior and pairwise Sylvester bounds). PrincipalAngles:
principal angles, sines, cosines and tangents, the projection gap and the directed gap,
point-spectral subspaces, the separation predicates. Majorization: unitarily invariant seminorms
and Ky Fan sums. Mathlib: orthogonal projections, singular values, eigenvector bases of symmetric
operators, `Ring.inverse`.

## Part D: the Yu–Wang–Samworth statistical variant

The population-gap formulation uses a deterministic gap in the population spectrum and produces
the subspace error bound used by statistical applications. This Part selects corresponding
eigenblocks by common ordered eigenvalue indices, measures their Frobenius sine distance, bounds it
through the residual sandwich, and transfers the symmetric perturbation theorems to left and right
singular subspaces through Gram operators and the Hermitian dilation. The aligned-family
construction (the Procrustes alignment) and the Gram perturbation bounds are consumed from
PrincipalAngles. Throughout, `A` is the population operator and `B` the perturbed or sample one
(Convention 9).

**Milestone D1 — statistical subspace objects and transfer lemmas.** §D.1–§D.15.

**Milestone D2 — population-gap theorems.** §D.16–§D.19.

### D.1 Corresponding eigenblocks

Let `A` and `B` be symmetric on a finite-dimensional inner product space of dimension `n`, with
eigenvalues `λ_0 ≥ … ≥ λ_{n−1}` listed in decreasing order. For an injective selection `e` of `d`
indices, subspaces `U` and `V` are corresponding eigenblocks when `U` is spanned by orthonormal
vectors `wᵢ` with `A wᵢ = λ_{e(i)}(A) wᵢ` and `V` by orthonormal vectors `uᵢ` with
`B uᵢ = λ_{e(i)}(B) uᵢ`: two ordered eigenframes at the same sorted indices. The eigenvectors may
be chosen freely inside repeated eigenspaces; the spans of the canonical eigenbases at an index set
`s` are an instance.
*In Tau Ceti:* `LinearMap.IsSymmetric.CorrespondingEigenblocks`, `LinearMap.IsSymmetric.IsOrderedEigenframe`, `LinearMap.IsSymmetric.eigenvectorSpan`, `LinearMap.IsSymmetric.isOrderedEigenframe_eigenvectorBasis`.

### D.2 The Frobenius sine distance

For subspaces `U` and `V` of a finite-dimensional inner product space, define
`‖sin Θ(U, V)‖_F` as the Frobenius norm of the directed sine map `P_{V⊥} P_U`. Its square is the
sum of the squared principal sines from `U` to `V`, and it is symmetric in `U` and `V` when
`dim U = dim V`.
*In Tau Ceti:* `Submodule.sinThetaFrobenius`, `Submodule.sq_sinThetaFrobenius`, `Submodule.sinThetaFrobenius_comm`.

### D.3 The population residual columns

For a selected index set `s`, the residual columns are `R_j = λ_j(A) v_j − A v_j`, `j ∈ s`, with
`λ_j(A)` the `j`-th eigenvalue of `A` and `v_j` the `j`-th vector of the eigenvector basis of `B`
(Convention 9): the population eigenvalue applied to the sample eigenvector. `R_j = 0` exactly
when `v_j` is an eigenvector of `A` for `λ_j(A)`. The residual columns of an arbitrary ordered
eigenframe of `B` at the indices `e(i)` are defined in the same way, with `λ_{e(i)}(A)`.

### D.4 The left singular subspace

For a linear map `A : E → F` between finite-dimensional inner product spaces and a set `Ω ⊆ ℝ` of
squared singular values, the left singular subspace of `A` selected by `Ω` is the point-spectral
subspace of `AA†` selected by `Ω`, a subspace of `F`.
*In Tau Ceti:* `LinearMap.leftSingularSubspace`.

### D.5 The right singular subspace

The right singular subspace of `A` selected by `Ω` is the point-spectral subspace of `A†A`
selected by `Ω`, a subspace of `E`.
*In Tau Ceti:* `LinearMap.rightSingularSubspace`.

### D.6 The Hermitian dilation

For `A : E → F` between finite-dimensional inner product spaces, the Hermitian dilation is the
operator `D(A) = [[0, A†], [A, 0]]`, `(x, y) ↦ (A†y, Ax)`, on the Hilbert sum `E ⊕ F`; it is
symmetric.
*In Tau Ceti:* `LinearMap.hermitianDilation`, `LinearMap.isSymmetric_hermitianDilation`.

### D.7 The complement identity

For orthonormal bases `(a_k)` and `(b_j)` of a finite-dimensional inner product space and index
sets `s` and `t`, `‖sin Θ(span b_t, span a_s)‖_F² = ∑_{j∈t} ∑_{k∉s} |⟪a_k, b_j⟫|²`. In
particular, for equally indexed eigenblocks (`t = s`, `a` and `b` eigenbases of `A` and `B`), the
squared Frobenius sine equals the cross-block sum of squared overlaps, and by §D.2 the order of
the two blocks does not matter.
*In Tau Ceti:* `OrthonormalBasis.sq_sinThetaFrobenius_spanIndices`, `Submodule.sinThetaFrobenius_comm`.

### D.8 The residual lower sandwich

Let `A` be symmetric on a finite-dimensional inner product space of dimension `n`, with eigenvector
basis `(u_k)` and eigenvalues `λ_k(A)`, let `s` be an arbitrary index set, and `Δ ≥ 0` with
`Δ ≤ |λ_j(A) − λ_k(A)|` for `j ∈ s` and `k ∉ s` (the population internal gap at the span of the
`u_j`, `j ∈ s`). For every family `(w_j)`,
`Δ² ∑_{j∈s} ∑_{k∉s} |⟪u_k, w_j⟫|² ≤ ∑_{j∈s} ‖λ_j(A) w_j − A w_j‖²`; with `w_j = v_j` this is
`Δ² · overlap ≤ ∑_{j∈s} ‖R_j‖²`.
*In Tau Ceti:* `LinearMap.IsSymmetric.sq_mul_sum_sum_norm_inner_sq_le_sum_norm_smul_sub_apply_sq`.

### D.9 The residual Frobenius upper sandwich

For an arbitrary index set `s`, `∑_{j∈s} ‖R_j‖² ≤ 4‖B − A‖_F²`; the same bound holds for the
residual columns of an arbitrary ordered eigenframe of `B`.
*In Tau Ceti:* `LinearMap.IsSymmetric.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_frobenius_sq`, `LinearMap.IsSymmetric.sum_sq_norm_frameResidual_le`.

### D.10 The residual operator-norm upper sandwich

If `‖(B − A)x‖ ≤ ε‖x‖` for every `x` (for instance `ε = ‖B − A‖`) and the selected index set `s`
has cardinality `d`, then `∑_{j∈s} ‖R_j‖² ≤ 4dε²`; the same bound holds for an arbitrary ordered
eigenframe of `B`.
*In Tau Ceti:* `LinearMap.IsSymmetric.sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_card_mul_sq`, `LinearMap.IsSymmetric.sum_sq_norm_frameResidual_le_of_opNorm`.

### D.11 The residual column decomposition

For an eigenvector `v_j` of `B` with eigenvalue `λ_j(B)` and any real `c`,
`c v_j − A v_j = (c − λ_j(B)) v_j + (B − A) v_j`: an eigenvalue-displacement term plus the direct
perturbation term, so `‖c v_j − A v_j‖ ≤ |c − λ_j(B)| + ‖(B − A) v_j‖`. For `c = λ_j(A)` the
displacement is controlled by Weyl's inequality `|λ_j(A) − λ_j(B)| ≤ ε` when
`‖(B − A)x‖ ≤ ε‖x‖`, so `‖R_j‖ ≤ ε + ‖(B − A) v_j‖`.
*In Tau Ceti:* `LinearMap.IsSymmetric.smul_sub_apply_eigenvectorBasis`, `LinearMap.IsSymmetric.norm_smul_sub_apply_eigenvectorBasis_le`.

### D.12 The singular-subspace Gram transfer

Let `A, Â : E → F` be linear maps between finite-dimensional inner product spaces, `s, t ⊆ ℝ`,
`U_R` the right singular subspace of `A` selected by `s` and `Û_R` that of `Â` selected by `t`.
If the eigenvalues of `A†A` on `U_R` lie in `[a, b]` and those of `Â†Â` on `Û_R⊥` outside
`(a − δ, b + δ)`, then `δ‖P_{Û_R⊥} P_{U_R}‖ ≤ (‖Â‖ + ‖A‖)‖Â − A‖`. The analogous gap for `AA†` and
`ÂÂ†` gives the same bound for the selected left singular subspaces. Route: §C.18 in the operator
norm for the Gram operators, with `‖Â†Â − A†A‖ ≤ (‖Â‖ + ‖A‖)‖Â − A‖`.
*In Tau Ceti:* `LinearMap.mul_norm_sinThetaMap_rightSingularSubspace_le`, `LinearMap.mul_norm_sinThetaMap_leftSingularSubspace_le`.

### D.13 The Hermitian-dilation perturbation identity

For `A, Â : E → F`, the operator norm of the difference of the Hermitian dilations equals that of
the difference of the maps: `‖D(Â) − D(A)‖ = ‖Â − A‖`.
*In Tau Ceti:* `LinearMap.norm_toContinuousLinearMap_hermitianDilation_sub`.

### D.14 The Hermitian-dilation spectral transfer

The singular values and the left and right singular subspaces of `A : E → F` are recovered from
the positive and negative spectral blocks of `D(A)`. A real `μ ≠ 0` is an eigenvalue of `D(A)`
exactly when `μ²` is an eigenvalue of `A†A`, that is when `|μ|` is a nonzero singular value of
`A`, and the two eigenspaces have the same dimension. Every singular value `σᵢ` of `A` and its
negative `−σᵢ` are eigenvalues of `D(A)`, with eigenvectors `(vᵢ, uᵢ)` and `(vᵢ, −uᵢ)` built from
the right singular vector `vᵢ` and the left singular vector `uᵢ`. For `Ω ⊆ ℝ`, the projections onto
`E` and onto `F` of the point-spectral subspace of `D(A)` selected by `Ω` are the right and the
left singular subspaces of `A` selected by `{μ² : μ ∈ Ω}`.
*In Tau Ceti:* `LinearMap.hasEigenvalue_hermitianDilation_iff`, `LinearMap.finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self`, `LinearMap.hasEigenvalue_hermitianDilation_singularValues`, `LinearMap.hasEigenvalue_hermitianDilation_neg_singularValues`, `LinearMap.map_fstₗ_pointSpectralSubspace_hermitianDilation`, `LinearMap.map_sndₗ_pointSpectralSubspace_hermitianDilation`.

### D.15 The dilation pairwise-gap bound

Let `E` and `F` be finite-dimensional inner product spaces, `A, Â : E → F`, and `D(A)`, `D(Â)` their
Hermitian dilations §D.6 on `E ⊕ F`. Let `Ω ⊆ ℝ`, write `E_D(Ω)` for the point-spectral subspace
of `D` selected by `Ω` (Convention 4), and let `δ > 0`. If every eigenvalue of `D(A)` on
`E_{D(A)}(Ω)` is at distance at least `δ` from every eigenvalue of `D(Â)` on `E_{D(Â)}(Ω)⊥`, prove
`δ ‖P_{E_{D(Â)}(Ω)⊥} P_{E_{D(A)}(Ω)}‖ ≤ (π/2)‖D(Â) − D(A)‖`, and the right side equals
`(π/2)‖Â − A‖` (the pairwise `π/2` `sin Θ` bound, Seelmann 2014, Proposition 2.4, applied to
Hermitian dilations). Route: the pairwise `sin Θ` theorem §C.23 on `E ⊕ F`, with the dilations
symmetric and the point-spectral subspaces invariant, in the operator norm, and the dilation
identity §D.13.
*Needs:* §C.23, §D.6, §D.13; Tau Ceti `TauCeti.UnitarilyInvariantSeminorm.opNorm`,
`Module.End.map_pointSpectralSubspace_le`.

**Checks.**
- For `A = 1` and `Â = −1` on `ℂ` and `Ω = (0, ∞)`, `E_{D(A)}(Ω)` is the line of `(1, 1)` and
  `E_{D(Â)}(Ω)` that of `(1, −1)`; `D(A)` is `1` on the first and `D(Â)` is `−1` on the
  complement of the second, so `δ = 2`. The sine map is the projection onto the line of `(1, 1)`,
  of norm `1`, and the bound reads `2 ≤ (π/2)·2`. A version selecting the same eigenvalue sign on
  both sides of the gap, `D(Â)` on `E_{D(Â)}(Ω)` in place of its complement, would compare `1`
  with `1` and have no gap at all.

### D.16 The population-gap `sin Θ` theorem

Let `A` (the population operator) and `B` be symmetric on a finite-dimensional inner product space
of dimension `n`, and `U` and `V` corresponding eigenblocks of rank `d` (§D.1) at the indices
`e(0), …, e(d − 1)`. Let `Δ > 0` with `Δ ≤ |λ_{e(i)}(A) − λ_k(A)|` for every `i` and every index
`k` not selected, which is the internal gap §S.1 of `A` at `U`. Then
`‖sin Θ(U, V)‖_F ≤ 2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ`. No gap is assumed in the spectrum of `B`
(Yu, Wang and Samworth 2015, Theorem 1, proved there for real matrices and a run of consecutive
indices). Route: the complement identity §D.7 and the residual sandwich §D.8–§D.10.
*In Tau Ceti:* `LinearMap.IsSymmetric.sinThetaFrobenius_orderedEigenframe_le`, `LinearMap.IsSymmetric.sinThetaFrobenius_eigenvectorSpan_le`.

### D.17 Aligned bases

Prove `yuWangSamworth_alignedBasis_le`: let `A` and `B` be symmetric on a finite-dimensional inner
product space of dimension `n`, `U` and `V` corresponding eigenblocks of rank `d` (§D.1), and
`Δ > 0` the internal gap of `A` at `U` (§S.1). Then `U` and `V` have orthonormal bases `(uᵢ)` and
`(vᵢ)`, `i < d`, with `(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2} ≤ 2√2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ` (Yu, Wang and
Samworth 2015, Theorem 2, inequality (3), proved there for real matrices and a run of consecutive
indices), `√2` times the bound of §D.16. The discrepancy is the Frobenius norm
`(∑ᵢ ‖vᵢ − uᵢ‖²)^{1/2}`, with `v` rotated inside `V`. Route: for eigenvectors spanning `U` the
internal gap is the index gap of §D.16; the Procrustes alignment gives a basis `v` of `V` with
`∑ᵢ ‖vᵢ − uᵢ‖² ≤ 2 ‖sin Θ(U, V)‖_F²`.
*Needs:* §S.1, §D.1, §D.16; Tau Ceti `TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le`,
`Submodule.sq_sinThetaFrobenius_eq_sinThetaSq_of_orthonormal`.

**Checks.**
- The bases must be chosen. For `B = A` and `U = V` of dimension `2` with orthonormal basis
  `(e₁, e₂)`, the right side is `0`, attained by `v = u`; the bases `u = (e₁, e₂)` and
  `v = (e₂, e₁)` of the same subspace have discrepancy `2`. A statement for arbitrary bases is
  false.

### D.18 A single eigenvector

Prove `yuWangSamworth_eigenvector_le`: let `A` and `B` be symmetric on a finite-dimensional inner
product space, `u` and `v` unit eigenvectors of `A` and `B` at the same sorted index (their lines
are corresponding eigenblocks), `λ` the eigenvalue of `u`, and `Δ > 0` with `Δ ≤ |λ − ν|` for
every eigenvalue `ν` of `A` on `u⊥`. Then some scalar `c` with `|c| = 1` gives
`‖cv − u‖ ≤ 2√2 ‖B − A‖/Δ`. Over `ℝ`, `c = ±1`, and this is Yu, Wang and Samworth 2015,
Corollary 3, with `c` the sign that makes `⟪cv, u⟫ ≥ 0`. Route: §D.17 with `d = 1`, where
`min(‖B − A‖, ‖B − A‖_F) = ‖B − A‖` and a unit vector of the line of `v` is `cv`.
*Needs:* §D.17.

**Checks.**
- The phase is needed. For `A = diag(1, 0)`, `B = [[1, ε], [ε, 0]]` with `ε = 2/3`, `u = e₁`,
  `λ = 1` and `Δ = 1`, `‖B − A‖ = 2/3` and the bound is `4√2/3 ≈ 1.8856`. The top unit eigenvector
  `v = (2/√5, 1/√5)` gives `‖v − u‖ = (2 − 4/√5)^{1/2} ≈ 0.4595`, while `−v`, also a unit
  eigenvector, gives `(2 + 4/√5)^{1/2} ≈ 1.9465`, above the bound.

### D.19 Rectangular singular vectors

Let `E` and `F` be finite-dimensional inner product spaces, `A, Â : E → F`, and `a, â, ε` with
`â, ε ≥ 0`, `‖Ax‖ ≤ a‖x‖`, `‖Âx‖ ≤ â‖x‖` and `‖(Â − A)x‖ ≤ ε‖x‖` for every `x`.

- *Right singular vectors.* Let `(v_k)` and `(v̂_k)`, `k < dim E`, be the orthonormal eigenvector
  bases of `A†A` and `Â†Â` in decreasing eigenvalue order (the right singular bases), and let `s`
  be a set of indices with a squared-singular-value gap `Γ ≥ 0`: `Γ ≤ |σ_j(A)² − σ_k(A)²|` for
  `j ∈ s`, `k ∉ s`. Then `Γ² ∑_{j∈s} ∑_{k∉s} |⟪v_k, v̂_j⟫|² ≤ 4|s|((a + â)ε)²`.
- *Left singular vectors.* Let `(u_k)` and `(û_k)`, `k < dim F`, be the orthonormal eigenvector
  bases of `AA†` and `ÂÂ†` in decreasing eigenvalue order (Mathlib's
  `LinearMap.IsSymmetric.eigenvectorBasis`), the *left singular vectors*, and let `s` be a set of
  indices with `Γ ≥ 0` and `Γ ≤ |λ_j(AA†) − λ_k(AA†)|` for `j ∈ s`, `k ∉ s`. Prove
  `Γ² ∑_{j∈s} ∑_{k∉s} |⟪u_k, û_j⟫|² ≤ 4|s|((a + â)ε)²`.

Both are Yu, Wang and Samworth 2015, Theorem 4, the remark after it, and steps (10)–(11) of its
proof, proved there for real matrices and a run of consecutive indices; the right form needs no
sign condition on `a`. Route for the left form: the right form for `A†` and `Â†`, whose right Gram
operators are `AA†` and `ÂÂ†`, with `‖A†‖ = ‖A‖` and the singular values of the adjoint.
*Needs:* the right form; Tau Ceti `LinearMap.rightSingularBasis`, `LinearMap.singularValues_adjoint`,
`LinearMap.norm_adjoint_apply_le`; Mathlib `LinearMap.isSymmetric_adjoint_comp_self`.

**Checks.**
- The left vectors are an eigenbasis of `AA†` indexed by `dim F`. For `A : ℂ → ℂ²`, `x ↦ (x, 0)`,
  `AA† = diag(1, 0)` has eigenbasis `(e₁, e₂)`, with `e₂` in the kernel of `A†`; the vectors
  `σᵢ⁻¹ A vᵢ`, `i < dim E = 1`, give only `e₁`, so a definition through them would not span `F`.

*In Tau Ceti:* `LinearMap.sq_mul_sum_sum_norm_inner_rightSingularBasis_sq_le_four_mul_card_mul_sq` (the right singular vectors).

### Examples

- The worked population-gap example is §D.18's Check: there the `sin Θ` theorem §D.16 gives
  `sin θ ≤ 2‖B − A‖/Δ = 4/3`, and the true value is `sin θ = 1/√5 ≈ 0.447`.
- The two-sided-gap comparison: when interval/exterior gaps `δ` hold in both orientations, between
  `A` on `U` and `B` on `V⊥` and between `B` on `V` and `A` on `U⊥`, the symmetric constant-one
  theorem §C.24 gives `δ N(P_U − P_V) ≤ N(B − A)`, without the factor `2` of the population-gap
  theorem and at the price of a hypothesis on `B`. In the example above, with `U` and `V` the top
  eigenlines, both gaps are `4/3` and the projector difference has operator norm
  `sin θ = 1/√5 ≤ (2/3)/(4/3)`.

### Dependencies

§S.1 and Part C (§C.18, §C.23 and §C.24). PrincipalAngles: the Procrustes alignment, the Gram
perturbation bounds, Frobenius sines of orthonormal families. Tau Ceti: singular values and singular
bases, Weyl's inequality. Mathlib: eigenvector bases of symmetric operators, singular values.

## Downstream consumers

- [MathematicalStatisticsNonparametric](../../MathematicalStatisticsNonparametric/README.md) §8.6
  uses `SSP-C16` (§C.16), the dimension-free projector bound, for functional principal components,
  resting on `SSP-C15` (§C.15).
- [MathematicalStatisticsHighDimensional](../../MathematicalStatisticsHighDimensional/README.md)
  §8.1 uses `SSP-C17` (§C.17), the residual `sin Θ` theorem, for the leading eigenvector.
- [RandomMatrices](../../RandomMatrices/README.md) §1.3 and §2.6 use `SSP-D06` and `SSP-D13`
  (§D.6, §D.13), the Hermitian dilation and its operator-norm perturbation identity.
- [ProbabilisticAndMetricNumberTheoryPartII](../../ProbabilisticAndMetricNumberTheoryPartII/README.md)
  draws its boundary with this roadmap: its Layer 4 perturbation theory assumes neither an inner
  product nor an adjoint.

## Provenance

This section is secondary and prescribes nothing. An Apache-2.0 implementation of the material of
all four Parts exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.).
That implementation adapted its Sylvester and `sin Θ` material from the Spectra Formalization
Project (upstream revision `8dbaaf6728d1342ae16acf79fd7eef7c59b37e63`); its kernel material is
not adapted from it.

## Scope and ownership

**This roadmap owns** the perturbation theory of spectral subspaces of self-adjoint operators:
the internal gap §S.1, the Haagerup–Zsidó kernel (Part A), Sylvester equations with their bounds
and Rosenblum's theorem (Part B), the Davis–Kahan `sin Θ`, `tan Θ`, `sin 2Θ` and `tan 2Θ` theorems
(Part C), and the Yu–Wang–Samworth variant (Part D): every item above. The internal gap §S.1 is the
member of the separation family with both spectra from one operator; it belongs here, and the
other separation predicates belong to PrincipalAngles.

**Owned elsewhere and consumed here.**

- *The domain-aware Sylvester equation*, the `LinearPMap` resolvent and spectrum, the Cayley
  transform and the spectral measure of an unbounded self-adjoint operator:
  [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) (SA-C66, SA-D01–SA-D02,
  SA-D24–SA-D34, Part E). Its solvability and its a priori estimates (§B.16, §B.17) belong here.
- *Unitarily invariant norms*, Ky Fan sums and Fan dominance:
  [Majorization](../Majorization/README.md), stated by Tau Ceti.
- *Principal angles, the projection gap, point-spectral subspaces, the separation predicates, the
  directed sine map, the Procrustes alignment and the Gram perturbation bounds*:
  [PrincipalAngles](../PrincipalAngles/README.md), stated by Tau Ceti.
- *Singular values, the operator modulus and polar decomposition*:
  [PolarDecomposition](../PolarDecomposition/README.md).
- Mathlib's `fuglede_putnam_rosenblum` is a different theorem of Rosenblum's (an intertwiner of
  normal elements intertwines their adjoints) and is not §B.17.

## Exact supplier contracts

### From Mathlib

- `LinearPMap` (`E →ₗ.[𝕜] E`), its adjoint and `IsSelfAdjoint` for partial operators on a complete
  space; `spectrum`; the continuous functional calculus `cfc`; `Ring.inverse`.
- `Submodule.starProjection` and `Submodule.HasOrthogonalProjection`; `LinearMap.IsSymmetric`,
  `LinearMap.IsSymmetric.eigenvalues` (decreasing) and `LinearMap.IsSymmetric.eigenvectorBasis`;
  `LinearMap.isSymmetric_adjoint_comp_self`; `LinearMap.singularValues`.
- `IsCoercive`, `IsCoercive.continuousLinearEquivOfBilin` and `IsCoercive.antilipschitz` (real Lax–Milgram).
- `isLittleO_exp_neg_mul_rpow_atTop` (`e^{−ax} = o(x^b)` as `x → +∞`, for `a > 0`),
  `Filter.cocompact`, `Real.tsum_eq_tsum_fourier_of_rpow_decay` (Poisson summation under decay
  `O(|x|^{−b})`, `b > 1`, of the function and its transform), the Fourier transform `𝓕`.
- `convexHull`, `convexHull_eq_union` (Carathéodory), `NormedSpace.exp`.

### From Tau Ceti

All declarations below are proved at the pin. Paths are under `TauCeti/Analysis/` unless they begin with `TauCeti/`. `𝕜` is
`RCLike`; finite-dimensional statements carry `[FiniteDimensional 𝕜 E]` (and `F`). The
declarations that realise this roadmap's own items are named on the *In Tau Ceti:* lines of the
items above and are not repeated here.

*Separation and point spectra* (`InnerProductSpace/PointSpectrum.lean`):
`Module.End.restrictedPointSpectrum A U` (the real `λ` with an eigenvector of `A` in `U`),
`Module.End.PointSpectrumIn A U Ω`, `Module.End.pointSpectralSubspace A Ω` (the span of the
eigenspaces for `λ ∈ Ω`), `Module.End.PointSpectraSeparated A U B V δ`,
`Module.End.PointOrderedGap`, `Module.End.PointIntervalExteriorGap A U B V a b δ` (fields: `A` on
`U` in `[a, b]`, `B` on `V` outside `(a − δ, b + δ)`), with
`Module.End.pointSpectrumIn_pointSpectralSubspace`, `Module.End.map_pointSpectralSubspace_le`,
`Module.End.PointSpectraSeparated.disjoint`.

*Unitarily invariant seminorms* (`InnerProductSpace/UnitarilyInvariantSeminorm/`, `KyFan.lean`,
`FanDominance.lean`): `TauCeti.UnitarilyInvariantSeminorm 𝕜 E F` (a seminorm on `E →ₗ[𝕜] F` with
`N (U ∘ A ∘ V) = N A` for linear isometric equivalences `U` of `F` and `V` of `E`), its instances
`TauCeti.UnitarilyInvariantSeminorm.opNorm` (`‖A‖`), `.frobenius` (`(∑ᵢ ‖A bᵢ‖²)^{1/2}` for any
orthonormal basis), `.kyFan k` (the sum of the `k` largest singular values,
`LinearMap.kyFanSum`), `TauCeti.UnitarilyInvariantSeminorm.nuclear` and
`TauCeti.UnitarilyInvariantSeminorm.schatten`; `LinearMap.twoSidedUnitaryOrbitHull`,
`TauCeti.UnitaryOrbitCertificate` and `TauCeti.UnitarilyInvariantSeminorm.map_le_of_mem_twoSidedUnitaryOrbitHull`
(`N X ≤ N C` on the hull); Fan dominance `TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`.

*Coercive operators* (`InnerProductSpace/Coercive.lean`, `Normed/Operator/Basic.lean`):
`ContinuousLinearMap.mul_norm_le_norm_apply_of_coercive` (if `c‖z‖² ≤ Re⟪Nz, z⟫` for all `z`, then
`c‖z‖ ≤ ‖Nz‖`), `ContinuousLinearMap.isUnit_of_coercive` (on a complete space with `c > 0`, `N` is
a unit), `ContinuousLinearMap.norm_ringInverse_le_of_forall_norm_le` (a unit `A` with
`‖x‖ ≤ M‖Ax‖`, `M ≥ 0`, has `‖Ring.inverse A‖ ≤ M`); the Lax–Milgram API in
`InnerProductSpace/LaxMilgram.lean`.

*Partial operators* (`TauCeti/Topology/Algebra/Module/LinearPMap/`, `InnerProductSpace/LinearPMap/`,
`Normed/Operator/LinearPMap/`): `LinearPMap.resolventSet` and `LinearPMap.spectrum` (Convention 2),
`ContinuousLinearMap.spectrum_toPMap_top`; `LinearPMap.realSpectrum` and
`LinearPMap.SpectralSetsSeparated A B s t d` (`d ≤ |a − b|` for real spectral points `a ∈ s` of
`A` and `b ∈ t` of `B`); `IsSelfAdjoint.spectrum_subset_im_eq_zero`;
`LinearPMap.SylvesterEquation A B X C` (fields: `X` maps the domain of `B` into that of `A`, and
`A(Xy) − X(By) = Cy` there) with `LinearPMap.SylvesterEquation.ofBounded_iff` (for bounded `A`, `B`
as total partial operators it is `AX − XB = C`); `LinearPMap.isSelfAdjoint_toPMap_top`;
`LinearPMap.Intertwines A B X` (for `X : E → F`, `XA ⊆ BX`),
`ContinuousLinearMap.intertwines_toPMap_top_iff`, `LinearPMap.intertwines_iff_comp_resolvent_eq`
(at common resolvent points, intertwining is `X R_A(z) = R_B(z) X`); over `ℂ`, `LinearPMap.cayley`
and `LinearPMap.Intertwines.comp_cfc_cayley_eq` (for self-adjoint `A`, `B`, an intertwiner
intertwines `f` of the Cayley transforms for every `f` continuous on their spectra);
`ContinuousLinearMap.comp_cfc_eq_cfc_comp` (the same for bounded operators). Stone's theorem
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Semigroups/Group/Stone/Unbounded.lean`:
a self-adjoint `A` on a complex Hilbert space has exactly one unitary group with complex generator
`iA`).

*Angles and tangents* (`InnerProductSpace/Projection/`): `Submodule.sinThetaMap`,
`Submodule.cosThetaMap`, `Submodule.principalSines`, `Submodule.principalCosines`,
`Submodule.principalAngles`, `Submodule.principalTangents`, `Submodule.projectionGap`,
`Submodule.directedProjectionGap`, `Submodule.projectionGap_eq_max`,
`Submodule.projectionGap_eq_directedProjectionGap_of_finrank_eq`;
`Submodule.directedProjectionGap_lt_one_iff` (gap `< 1` iff `U ∩ V⊥ = 0`),
`Submodule.forall_principalAngles_lt_pi_div_two_iff_directedProjectionGap_lt_one`,
`Submodule.forall_principalAngles_lt_pi_div_four_iff` (all angles `< π/4` iff directed gap
`< √2/2`); `Submodule.tanThetaMap Z U` (the tangent map of §C.28, a linear map `Z → E`) with
`Submodule.singularValues_tanThetaMap` (when the directed gap from `Z` to `U` is below `1`, its
singular values are the principal tangents).

*Eigenvalues, singular values and orthonormal families* (`InnerProductSpace/CourantFischer.lean`,
`…/SingularValues.lean`, `…/Adjoint.lean`, `…/Gram/Perturbation.lean`, `…/Orthonormal/`): Weyl's
inequality `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le` (for symmetric `A`, `B` with
`‖(B − A)x‖ ≤ ε‖x‖`, `|λ_j(B) − λ_j(A)| ≤ ε`);
`LinearMap.rightSingularBasis` (the eigenvector basis of `A†A`), `LinearMap.singularValues_adjoint`,
`LinearMap.norm_adjoint_apply_le`; `ContinuousLinearMap.norm_adjoint_comp_self_sub_adjoint_comp_self_le`
(`‖B†B − A†A‖ ≤ (‖B‖ + ‖A‖)‖B − A‖`); `Submodule.sq_sinThetaFrobenius_eq_sinThetaSq_of_orthonormal`
and the Procrustes alignment `TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le` (orthonormal
`u`, `v` admit an orthonormal `w` spanning the span of `v` with `∑ⱼ ‖wⱼ − uⱼ‖² ≤ 2 sin²_F Θ`,
`TauCeti.sinThetaSq`).

### From TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory

From [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md), for a self-adjoint
`A : H →ₗ.[ℂ] H`: SA-E01 (the spectral projection-valued measure on `ℝ`), SA-E02 (no diagonal
measure of the Cayley spectral measure charges the point `1`), SA-E05 (the resolvent formula
`⟪ξ, R(z)ξ⟫ = ∫ (z − s)⁻¹ dμ_ξ(s)`), SA-E06 and SA-E07 (spectral projections commute with
resolvents and preserve the domain), SA-E08 (the spectral measure vanishes on Borel sets of
resolvent points), SA-E31 (spectral projections of bounded intervals exhausting `ℝ` converge
strongly to the identity) and SA-E37 (the range of the spectral projection of a bounded set lies
in the domain, where `A` acts boundedly). §B.16 and §B.17 consume them.

## References

- C. Davis, W. M. Kahan, *The rotation of eigenvectors by a perturbation. III*, SIAM J. Numer.
  Anal. **7** (1970), 1–46 — the principal worked source.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6** (1963),
  159–173 — the `sin 2θ` theorem.
- M. Rosenblum, *On the operator equation BX − XA = Q*, Duke Math. J. **23** (1956), 263–269.
- R. Bhatia, C. Davis, A. McIntosh, *Perturbation of spectral subspaces and solution of linear
  operator equations*, Linear Algebra Appl. **52/53** (1983), 45–67.
- S. Albeverio, K. A. Makarov, A. K. Motovilov, *Graph subspaces and the spectral shift function*,
  Canad. J. Math. **55** (2003), 449–503; arXiv:math/0105142, whose version 3 fixes the numbering
  cited.
- A. Seelmann, *Notes on the sin 2Θ theorem*, Integral Equations Operator Theory **79** (2014),
  579–597; arXiv:1310.2036, whose version 1 fixes the numbering cited.
- V. Kostrykin, K. A. Makarov, A. K. Motovilov, *A generalization of the tan 2Θ theorem*, Oper.
  Theory Adv. Appl. **149** (2004), 349–372; arXiv:math/0302020, whose version 1 fixes the
  numbering cited.
- R. Bhatia, *Matrix Analysis*, GTM 169, Ch. VII.2 — the separated bound §B.7 is the half-line
  case of Theorem VII.2.3, by an integral-free proof.
- Y. Yu, T. Wang, R. J. Samworth, *A useful variant of the Davis–Kahan theorem for
  statisticians*, Biometrika **102** (2015), 315–323; arXiv:1405.0680, whose version 1 fixes the
  numbering cited.
