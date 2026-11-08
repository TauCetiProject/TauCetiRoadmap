module

import Mathlib
import TauCeti.Analysis.Contour.Residue.Basic
import TauCeti.NumberTheory.LFunctions.Hecke.Basic

/-!
# Analytic number theory, Part III: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need: the delta spike `deltaSpike` and the smoothed cutoff `smoothCutoff`
(Layer 9), the Ingham exponent `inghamExponent` of a zero-free width (Layer 10), the divisor
functions `sigmaC` and `generalizedDivisor` with complex parameter (Layer 11), the least number
`factorialFactorCount` of bounded factors of `n!` and the Goldbach-range propositions
`EvenGoldbachUpTo` and `OddGoldbachUpTo` (Layer 13).

Stated here:

* Layer 7: Fourier decay `‖𝓕 f ξ‖ ≤ V / (2π|ξ|)` for integrable functions of bounded variation;
  principal-value Mellin inversion at a point of local bounded variation; the windowed error of
  the Dirichlet-kernel integral;
* Layer 8: the rectangle residue theorem in Mathlib's edge form, with Tau Ceti's residue; the
  derivative form of the Borel–Carathéodory inequality; Landau's local logarithmic-derivative
  lemma;
* Layer 9: the Mellin transform of the smoothed cutoff and its decay, uniform in the smoothing
  parameter;
* Layer 10: the smoothed sum as an inverse Mellin integral; the transfer theorem from a zero-free
  region of width `η` to the error `x exp(−c ω_η(x))`; the logarithmic-derivative bound
  `L′/L ≪ log(|t| + 3)` in a de la Vallée Poussin region for the presented Hecke `L`-function of
  every ray class character of every number field (the `K = ℚ`, trivial-character instance is
  AnalyticNumberTheoryPartI §0.33a and is not stated again);
* Layer 11: the Dirichlet series and abscissas of `σ_ν` and `d_z`; Ramanujan's four-shift
  identity; the series of `2^ω`, `μ²`, `λ` and `φ` with their abscissas;
* Layer 12: the Hardy–Landau Tauberian theorem for Cesàro means, one-sided for real sequences and
  two-sided in a real normed space;
* Layer 13: the asymptotics of the least number of factors of `n!` bounded by `n²` (Erdős problem
  392) and by `n`; the transfer of Goldbach ranges along a short-interval prime hypothesis.

Every headline theorem of the roadmap is statable at the pins. The remaining targets of the
README (the Dirichlet-integral bounds of 7.2, the Mellin convolution of 9.1 and the bump
transforms of 9.2, the comparison of smoothed and sharp sums in 10.1, complete multiplicativity in
11.1, the `τ(n²)` series of 11.3, the elementary Goldbach transfers of 13.2) are lemmas on the way
to these statements and stay in the README.
-/

namespace TauCetiRoadmap.AnalyticNumberTheoryPartIII

open Complex Filter Set Topology Asymptotics MeasureTheory intervalIntegral
open scoped Real FourierTransform ArithmeticFunction.vonMangoldt

/-! ## Layer 7: Fourier and Laplace tools -/

/-- **7.1, Fourier decay for bounded variation.** If `f : ℝ → E` is integrable and of bounded
variation on `ℝ`, with total variation `V`, then `‖𝓕 f ξ‖ ≤ V / (2π|ξ|)` for every real `ξ ≠ 0`
(Kontorovich–Tao, PNT+ blueprint, Lemma 3.1.4). The constant is attained by `1_[0,1]` at
`ξ = 1/2`. -/
theorem norm_fourier_le_eVariationOn_div {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] {f : ℝ → E} (hf : Integrable f) (hbv : BoundedVariationOn f univ)
    {ξ : ℝ} (hξ : ξ ≠ 0) :
    ‖𝓕 f ξ‖ ≤ (eVariationOn f univ).toReal / (2 * π * |ξ|) :=
  sorry

/-- **7.3, principal-value Mellin inversion.** Let `f : ℝ → ℂ` be Mellin convergent on the line
`Re s = σ`, and of bounded variation on `[x₀ − δ, x₀ + δ]` with `0 < δ < x₀`. Then the inverse
Mellin integral truncated at height `T` tends to the mean of the one-sided limits of `f` at `x₀`:
`(2π)⁻¹ ∫_{−T}^{T} x₀^{−(σ+iy)} mellin f (σ + iy) dy → (f(x₀⁻) + f(x₀⁺))/2` as `T → ∞`
(Montgomery–Vaughan, Chapter 5, §5.1). -/
theorem tendsto_truncated_mellinInv {f : ℝ → ℂ} {σ : ℝ} (hf : MellinConvergent f σ)
    {x₀ δ : ℝ} (hδ : 0 < δ) (hδx₀ : δ < x₀)
    (hbv : BoundedVariationOn f (Icc (x₀ - δ) (x₀ + δ))) :
    Tendsto (fun T : ℝ ↦ (1 / (2 * π) : ℂ) *
        ∫ y in -T..T, (x₀ : ℂ) ^ (-((σ : ℂ) + y * I)) * mellin f ((σ : ℂ) + y * I))
      atTop (𝓝 ((Function.leftLim f x₀ + Function.rightLim f x₀) / 2)) :=
  sorry

/-- **7.3, the windowed error.** There is an absolute constant `C` such that for every integrable
`h : ℝ → ℂ` of bounded variation on `ℝ`, of total variation `V`, every `u₀`, `δ > 0` and `T > 0`,
the Dirichlet-kernel integral `∫ h(u₀ − v) sin(Tv)/(πv) dv` differs from the mean of the one-sided
limits of `h` at `u₀` by at most `C (V⁺_δ + V⁻_δ + V/(Tδ))`, where `V⁺_δ` and `V⁻_δ` are the
variations of `h` on `(u₀, u₀ + δ]` and `[u₀ − δ, u₀)`. -/
theorem norm_dirichletKernel_integral_sub_mean_le :
    ∃ C : ℝ, ∀ h : ℝ → ℂ, Integrable h → BoundedVariationOn h univ →
      ∀ u₀ δ T : ℝ, 0 < δ → 0 < T →
        ‖(∫ v, h (u₀ - v) * (Real.sin (T * v) / (π * v) : ℝ)) -
            (Function.leftLim h u₀ + Function.rightLim h u₀) / 2‖ ≤
          C * ((eVariationOn h (Ioc u₀ (u₀ + δ))).toReal +
            (eVariationOn h (Ico (u₀ - δ) u₀)).toReal + (eVariationOn h univ).toReal / (T * δ)) :=
  sorry

/-! ## Layer 8: contours and discs -/

/-- **8.1, the rectangle residue theorem in edge form.** Let `σ₁ < σ₂`, `t₁ < t₂`, `U` open
containing the closed rectangle `[σ₁, σ₂] ×ℂ [t₁, t₂]`, `P` a finite subset of the open rectangle,
and `f` complex differentiable on `U ∖ P` and meromorphic at each point of `P`. Then Mathlib's
boundary expression (bottom edge minus top edge plus `i` times right edge minus `i` times left
edge, the counterclockwise boundary integral) equals `2πi Σ_{p ∈ P} Res_p f`. -/
theorem rectangle_boundary_integral_eq_residues {σ₁ σ₂ t₁ t₂ : ℝ} (hσ : σ₁ < σ₂)
    (ht : t₁ < t₂) {U : Set ℂ} (hU : IsOpen U) (hRU : Icc σ₁ σ₂ ×ℂ Icc t₁ t₂ ⊆ U)
    {P : Finset ℂ} (hP : ∀ p ∈ P, p ∈ Ioo σ₁ σ₂ ×ℂ Ioo t₁ t₂) {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f (U \ P)) (hmer : ∀ p ∈ P, MeromorphicAt f p) :
    (∫ x : ℝ in σ₁..σ₂, f (x + t₁ * I)) - (∫ x : ℝ in σ₁..σ₂, f (x + t₂ * I)) +
        I * (∫ y : ℝ in t₁..t₂, f (σ₂ + y * I)) - I * (∫ y : ℝ in t₁..t₂, f (σ₁ + y * I)) =
      2 * π * I * ∑ p ∈ P, TauCeti.Contour.residue f p :=
  sorry

/-- **8.2, the derivative form of Borel–Carathéodory.** If `f` is holomorphic on the open disc
`|z − z₀| < R` with `Re f ≤ M` there, then for `k ≥ 1`, `0 ≤ r < R` and `|z − z₀| ≤ r`,
`|f^{(k)}(z)| ≤ 2 · k! · R · (M − Re f(z₀)) / (R − r)^{k+1}`. At `z = z₀`, `r = 0` this is
Carathéodory's coefficient inequality `|a_k| R^k ≤ 2(M − Re a₀)`; the bound is attained by
`z ↦ −2M(z − z₀)/(R − (z − z₀))` (Kontorovich–Tao, Theorem 5.3.2, in the weaker form
`16MR²/(R − r)³` at `k = 1`; Montgomery–Vaughan, Chapter 6, §6.1). -/
theorem norm_iteratedDeriv_le_borelCaratheodory {f : ℂ → ℂ} {z₀ : ℂ} {R M : ℝ}
    (hf : DifferentiableOn ℂ f (Metric.ball z₀ R)) (hM : ∀ z ∈ Metric.ball z₀ R, (f z).re ≤ M)
    {k : ℕ} (hk : 1 ≤ k) {r : ℝ} (hr : 0 ≤ r) (hrR : r < R) {z : ℂ} (hz : ‖z - z₀‖ ≤ r) :
    ‖iteratedDeriv k f z‖ ≤ 2 * k.factorial * R * (M - (f z₀).re) / (R - r) ^ (k + 1) :=
  sorry

/-- **8.3, Landau's local logarithmic-derivative lemma.** For `0 < r₁ < r₂ < 1` there is `C` such
that: if `f` is holomorphic on a neighbourhood of `|z − z₀| ≤ R`, `R > 0`, `f(z₀) ≠ 0` and
`|f| ≤ e^M |f(z₀)|` on that disc, then at every `z` with `|z − z₀| ≤ r₁R` and `f(z) ≠ 0`,
`|f′(z)/f(z) − Σ_ρ m_ρ/(z − ρ)| ≤ C M / R`, the sum over the zeros `ρ` of `f` with
`|ρ − z₀| ≤ r₂R`, `m_ρ` their orders (Kontorovich–Tao, Theorem 5.3.7, with explicit constants;
Titchmarsh, Chapter III; Montgomery–Vaughan, Chapter 6, §6.1). -/
theorem norm_logDeriv_sub_sum_zeros_le {r₁ r₂ : ℝ} (h₁ : 0 < r₁) (h₁₂ : r₁ < r₂) (h₂ : r₂ < 1) :
    ∃ C : ℝ, ∀ (f : ℂ → ℂ) (z₀ : ℂ) (R M : ℝ), 0 < R →
      AnalyticOnNhd ℂ f (Metric.closedBall z₀ R) → f z₀ ≠ 0 →
      (∀ z ∈ Metric.closedBall z₀ R, ‖f z‖ ≤ Real.exp M * ‖f z₀‖) →
      ∀ z : ℂ, ‖z - z₀‖ ≤ r₁ * R → f z ≠ 0 →
        ‖logDeriv f z - ∑ᶠ ρ ∈ Metric.closedBall z₀ (r₂ * R),
            (analyticOrderNatAt f ρ : ℂ) / (z - ρ)‖ ≤ C * M / R :=
  sorry

/-! ## Layer 9: Mellin smoothing -/

/-- **9.3, the delta spike.** For a bump `ν` and `ε > 0`, `ν_ε(x) = ε⁻¹ ν(x^{1/ε})` for `x > 0`
and `0` for `x ≤ 0` (Kontorovich–Tao, Definition 4.3.2). The explicit `0` on `x ≤ 0` avoids the
junk values of real powers of negative numbers. -/
noncomputable def deltaSpike (ν : ℝ → ℝ) (ε x : ℝ) : ℝ :=
  if 0 < x then ε⁻¹ * ν (x ^ ε⁻¹) else 0

/-- **9.4, the smoothed cutoff.** `1̃_ε(x) = ∫_{(x,∞)} ν_ε(z) dz/z` for `x > 0` and `0` for
`x ≤ 0`; for `x > 0` it is the Mellin convolution of `1_(0,1]` with the delta spike
(Kontorovich–Tao, Definition 4.3.3). -/
noncomputable def smoothCutoff (ν : ℝ → ℝ) (ε x : ℝ) : ℝ :=
  if 0 < x then ∫ z in Ioi x, deltaSpike ν ε z / z else 0

/-- **9.4, the Mellin transform of the smoothed cutoff.** For a bump `ν` (`ν ≥ 0`, supported in
`[1/2, 2]`, of `dx/x`-mass `1`), `ε > 0` and `Re s > 0`,
`mellin 1̃_ε s = mellin ν (εs) / s` (Kontorovich–Tao, Lemma 4.3.9). -/
theorem mellin_smoothCutoff {ν : ℝ → ℝ} (hν0 : ∀ x, 0 ≤ ν x)
    (hνs : Function.support ν ⊆ Icc (1 / 2) 2) (hνm : ∫ x in Ioi 0, ν x / x = 1)
    {ε : ℝ} (hε : 0 < ε) {s : ℂ} (hs : 0 < s.re) :
    mellin (fun x ↦ (smoothCutoff ν ε x : ℂ)) s = mellin (fun x ↦ (ν x : ℂ)) (ε * s) / s :=
  sorry

/-- **9.4, decay of the transform, uniform in `ε`.** For a `C^k` bump `ν`, `k ≥ 1`, and
`0 < σ₁ ≤ σ₂`, there is `C` with `‖mellin 1̃_ε s‖ ≤ C / (|s| (1 + ε|s|)^k)` for all
`0 < ε ≤ 1` and `σ₁ ≤ Re s ≤ σ₂` (Kontorovich–Tao, Lemma 4.3.10, the case `k = 1`). -/
theorem norm_mellin_smoothCutoff_le {ν : ℝ → ℝ} {k : ℕ} (hk : 1 ≤ k) (hν : ContDiff ℝ k ν)
    (hν0 : ∀ x, 0 ≤ ν x) (hνs : Function.support ν ⊆ Icc (1 / 2) 2)
    (hνm : ∫ x in Ioi 0, ν x / x = 1) {σ₁ σ₂ : ℝ} (hσ₁ : 0 < σ₁) :
    ∃ C : ℝ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 → ∀ s : ℂ, σ₁ ≤ s.re → s.re ≤ σ₂ →
      ‖mellin (fun x ↦ (smoothCutoff ν ε x : ℂ)) s‖ ≤ C / (‖s‖ * (1 + ε * ‖s‖) ^ k) :=
  sorry

/-! ## Layer 10: from a zero-free region to an error term -/

/-- **10.1, the smoothed sum as an inverse Mellin integral.** Let `a : ℕ → ℂ` have absolutely
convergent `L`-series on every line `Re s = σ′ > 1`, `ν` a `C^k` bump with `k ≥ 1`, `0 < ε ≤ 1`,
`X > 0` and `σ > 1`. Then `Σ_n a(n) 1̃_ε(n/X)` is the inverse Mellin transform on `Re s = σ` of
`L(a, s) · mellin 1̃_ε s`, evaluated at `X⁻¹` (Kontorovich–Tao, Theorem 4.5.2). -/
theorem smoothedSum_eq_mellinInv {a : ℕ → ℂ} (ha : ∀ σ' : ℝ, 1 < σ' → LSeriesSummable a σ')
    {ν : ℝ → ℝ} {k : ℕ} (hk : 1 ≤ k) (hν : ContDiff ℝ k ν) (hν0 : ∀ x, 0 ≤ ν x)
    (hνs : Function.support ν ⊆ Icc (1 / 2) 2) (hνm : ∫ x in Ioi 0, ν x / x = 1)
    {ε X σ : ℝ} (hε : 0 < ε) (hε₁ : ε ≤ 1) (hX : 0 < X) (hσ : 1 < σ) :
    ∑' n : ℕ, a n * smoothCutoff ν ε (n / X) =
      mellinInv σ (fun s ↦ LSeries a s * mellin (fun x ↦ (smoothCutoff ν ε x : ℂ)) s) X⁻¹ :=
  sorry

/-- **10.2, the Ingham exponent** of a zero-free width `η`:
`ω_η(x) = inf_{t ≥ 3} (η(t) log x + log t)`. It is used for `x ≥ 3` and `η` positive on
`[3, ∞)`, where the infimum is bounded below by `log 3` and attained when `η` is continuous. -/
noncomputable def inghamExponent (η : ℝ → ℝ) (x : ℝ) : ℝ :=
  ⨅ t : Ici (3 : ℝ), (η t * Real.log x + Real.log t)

/-- **10.2, the transfer theorem in Ingham's form.** Let `η` be continuous and nonincreasing on
`[3, ∞)` with `0 < η ≤ 1/2` and `η(t) ≥ a₀ (log t)^{−A}` there; `a : ℕ → ℂ` with
`|a(n)| ≤ B log(n + 1)`; `U` open containing `R_η = {s : 1 − η(|Im s| + 3) ≤ Re s}`; and `G`
holomorphic on `U` with `L(a, s) = G(s) + r/(s − 1)` on `Re s > 1` and
`|G(s)| ≤ C₀ log(|Im s| + 3)^{B′}` on `R_η`. Then there are `c > 0` and `C′` with
`|Σ_{n ≤ x} a(n) − r x| ≤ C′ x exp(−c ω_η(x))` for every `x ≥ 3` (Ingham; Platt–Trudgian §1;
Kontorovich–Tao, Theorem 4.6.1 for `η = A₀/log^{n₁} t`). -/
theorem norm_sum_sub_mul_le_of_zeroFreeRegion {η : ℝ → ℝ} (hηc : ContinuousOn η (Ici 3))
    (hηa : AntitoneOn η (Ici 3)) (hηpos : ∀ t, 3 ≤ t → 0 < η t)
    (hηhalf : ∀ t, 3 ≤ t → η t ≤ 1 / 2) {a₀ A : ℝ} (ha₀ : 0 < a₀) (hA : 0 ≤ A)
    (hηlow : ∀ t, 3 ≤ t → a₀ * Real.log t ^ (-A) ≤ η t) {a : ℕ → ℂ} {B : ℝ}
    (ha : ∀ n : ℕ, 1 ≤ n → ‖a n‖ ≤ B * Real.log (n + 1)) {r : ℂ} {U : Set ℂ} (hU : IsOpen U)
    (hRU : {s : ℂ | 1 - η (|s.im| + 3) ≤ s.re} ⊆ U) {G : ℂ → ℂ} (hG : DifferentiableOn ℂ G U)
    (hLG : ∀ s : ℂ, 1 < s.re → LSeries a s = G s + r / (s - 1)) {C₀ B' : ℝ}
    (hGb : ∀ s : ℂ, 1 - η (|s.im| + 3) ≤ s.re → ‖G s‖ ≤ C₀ * Real.log (|s.im| + 3) ^ B') :
    ∃ c > 0, ∃ C' : ℝ, ∀ x : ℝ, 3 ≤ x →
      ‖∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n - r * x‖ ≤ C' * x * Real.exp (-c * inghamExponent η x) :=
  sorry

open Classical in
/-- **10.3, the classical logarithmic-derivative bound for Hecke `L`-functions.** Let `K` be a
number field, `𝔪` a modulus, `χ` a ray class character of `𝔪` and `L` its presented Hecke
`L`-function (for the trivial character of modulus `1` the Dedekind zeta function). Put
`δ_χ = 1` if `χ = 1` and `0` otherwise. There are `c > 0`, `C`, an open set `U` containing
`R_c = {s : 1 − c/log(|Im s| + 3) ≤ Re s}` and `G` holomorphic on `U` such that `L(s) ≠ 0` and
`−L′(s)/L(s) = G(s) + δ_χ/(s − 1)` for `s ∈ R_c ∖ {1}`, and `|G(s)| ≤ C log(|Im s| + 3)` on `R_c`
(Montgomery–Vaughan, Chapter 6, §6.1; Titchmarsh, Chapter III). Every ray class character has
finite order, the ray class group being finite (`TauCeti.GlobalNumberFields.finite_rayClassGroup`). -/
theorem logDeriv_heckeLFunctionC_bound {K : Type*} [Field K] [NumberField K]
    {𝔪 : TauCeti.GlobalNumberFields.Modulus K}
    (χ : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪) :
    ∃ c > 0, ∃ C : ℝ, ∃ U : Set ℂ, IsOpen U ∧
      {s : ℂ | 1 - c / Real.log (|s.im| + 3) ≤ s.re} ⊆ U ∧
      ∃ G : ℂ → ℂ, DifferentiableOn ℂ G U ∧
        (∀ s : ℂ, 1 - c / Real.log (|s.im| + 3) ≤ s.re → s ≠ 1 →
          TauCeti.LFunctions.heckeLFunctionC χ s ≠ 0 ∧
            -logDeriv (TauCeti.LFunctions.heckeLFunctionC χ) s =
              G s + (if χ = 1 then 1 else 0) / (s - 1)) ∧
        ∀ s : ℂ, 1 - c / Real.log (|s.im| + 3) ≤ s.re → ‖G s‖ ≤ C * Real.log (|s.im| + 3) :=
  sorry

/-! ## Layer 11: Dirichlet series of the classical arithmetic functions -/

/-- **11.2, the divisor function with complex exponent**, `σ_ν(n) = Σ_{d ∣ n} d^ν`, with value
`0` at `0`. At `ν = k : ℕ` it is Mathlib's `ArithmeticFunction.sigma k`. -/
noncomputable def sigmaC (ν : ℂ) : ArithmeticFunction ℂ :=
  ⟨fun n ↦ ∑ d ∈ n.divisors, (d : ℂ) ^ ν, by simp⟩

/-- **11.2, the generalized divisor function** `d_z` for `z ∈ ℂ`: the multiplicative function with
`d_z(p^a) = Ring.multichoose z a = z(z + 1)⋯(z + a − 1)/a!`, and value `0` at `0`. At `z = k : ℕ`
it counts ordered factorizations into `k` factors; `d_{−1} = μ`. -/
noncomputable def generalizedDivisor (z : ℂ) : ArithmeticFunction ℂ :=
  ⟨fun n ↦ if n = 0 then 0 else n.factorization.prod fun _ a ↦ Ring.multichoose z a, by simp⟩

/-- **11.2, the series of `σ_ν`.** For `Re s > max(1, 1 + Re ν)`,
`L(σ_ν, s) = ζ(s) ζ(s − ν)` (Kontorovich–Tao, Theorem 9.1.32). -/
theorem LSeries_sigmaC {ν s : ℂ} (hs : 1 < s.re) (hsν : 1 + ν.re < s.re) :
    LSeries (sigmaC ν) s = riemannZeta s * riemannZeta (s - ν) :=
  sorry

/-- **11.2, the abscissa of `σ_ν`.** The abscissa of absolute convergence of `L(σ_ν, s)` is
`max(1, 1 + Re ν)`; at `Re ν = 0`, `ν ≠ 0`, its lower bound uses `ζ(1 + i Im ν) ≠ 0`. -/
theorem abscissaOfAbsConv_sigmaC (ν : ℂ) :
    LSeries.abscissaOfAbsConv (sigmaC ν) = ((max 1 (1 + ν.re) : ℝ) : EReal) :=
  sorry

/-- **11.2, the series of `d_z`.** For `z ∈ ℂ` and `Re s > 1` the series of `d_z` converges
absolutely and equals `exp(z · log ζ(s))`, where `log ζ(s) = Σ Λ(n)/log n · n^{−s}` is the
Euler-product logarithm, whose exponential is `ζ(s)` (`riemannZeta_eq_exp_LSeries`). Its instance
`z = k : ℕ`, the series `ζ(s)^k` of `d_k = ζ^k`, is ArithmeticDirichletSeriesPartII §5.1; the
statement here is the complex-exponent form. -/
theorem LSeries_generalizedDivisor (z : ℂ) {s : ℂ} (hs : 1 < s.re) :
    LSeriesSummable (generalizedDivisor z) s ∧
      LSeries (generalizedDivisor z) s = cexp (z * LSeries (fun n : ℕ ↦ Λ n / Real.log n) s) :=
  sorry

/-- **11.2, the abscissa of `d_z`.** For `z ≠ 0` the abscissa of absolute convergence of
`L(d_z, s)` is `1`. (At `z = 0`, `d_0` is the unit of Dirichlet convolution and the abscissa is
`⊥`.) -/
theorem abscissaOfAbsConv_generalizedDivisor {z : ℂ} (hz : z ≠ 0) :
    LSeries.abscissaOfAbsConv (generalizedDivisor z) = 1 :=
  sorry

/-- **11.3, Ramanujan's four-shift identity.** For `α, β ∈ ℂ` and
`Re s > max(1, 1 + Re α, 1 + Re β, 1 + Re(α + β))`, the series `Σ σ_α(n) σ_β(n) n^{−s}` converges
absolutely and equals `ζ(s) ζ(s − α) ζ(s − β) ζ(s − α − β) / ζ(2s − α − β)` (Kontorovich–Tao,
Theorem 9.1.33; Titchmarsh, Chapter I). At `α = β = 0` it is AnalyticNumberTheoryPartI §3.24a. -/
theorem LSeries_sigmaC_mul_sigmaC {α β s : ℂ} (hs : 1 < s.re) (hα : 1 + α.re < s.re)
    (hβ : 1 + β.re < s.re) (hαβ : 1 + (α + β).re < s.re) :
    LSeriesSummable (fun n ↦ sigmaC α n * sigmaC β n) s ∧
      LSeries (fun n ↦ sigmaC α n * sigmaC β n) s =
        riemannZeta s * riemannZeta (s - α) * riemannZeta (s - β) * riemannZeta (s - α - β) /
          riemannZeta (2 * s - α - β) :=
  sorry

/-- **11.4, the series of `2^ω`, `μ²` and `λ`.** For `Re s > 1`:
`Σ 2^{ω(n)} n^{−s} = ζ(s)²/ζ(2s)`, `Σ μ(n)² n^{−s} = ζ(s)/ζ(2s)` and
`Σ λ(n) n^{−s} = ζ(2s)/ζ(s)` (Kontorovich–Tao, Theorems 9.1.49, 9.1.57, 9.1.68). -/
theorem LSeries_two_pow_omega_moebius_sq_liouville {s : ℂ} (hs : 1 < s.re) :
    LSeries (fun n ↦ (2 : ℂ) ^ ArithmeticFunction.cardDistinctFactors n) s =
        riemannZeta s ^ 2 / riemannZeta (2 * s) ∧
      LSeries (fun n ↦ ((ArithmeticFunction.moebius n : ℤ) : ℂ) ^ 2) s =
        riemannZeta s / riemannZeta (2 * s) ∧
      LSeries (fun n ↦ ((ArithmeticFunction.liouville n : ℤ) : ℂ)) s =
        riemannZeta (2 * s) / riemannZeta s :=
  sorry

/-- **11.4, the series of `φ`.** For `Re s > 2`, `Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)`
(Kontorovich–Tao, Theorem 9.1.70, whose half-plane is `Re s > 2`). -/
theorem LSeries_totient {s : ℂ} (hs : 2 < s.re) :
    LSeries (fun n ↦ (n.totient : ℂ)) s = riemannZeta (s - 1) / riemannZeta s :=
  sorry

/-- **11.4, the abscissas.** The abscissas of absolute convergence of the series of `2^ω`, `μ²`,
`λ` and `φ` are `1`, `1`, `1` and `2`. -/
theorem abscissaOfAbsConv_two_pow_omega_moebius_sq_liouville_totient :
    LSeries.abscissaOfAbsConv (fun n ↦ (2 : ℂ) ^ ArithmeticFunction.cardDistinctFactors n) = 1 ∧
      LSeries.abscissaOfAbsConv (fun n ↦ ((ArithmeticFunction.moebius n : ℤ) : ℂ) ^ 2) = 1 ∧
      LSeries.abscissaOfAbsConv (fun n ↦ ((ArithmeticFunction.liouville n : ℤ) : ℂ)) = 1 ∧
      LSeries.abscissaOfAbsConv (fun n ↦ (n.totient : ℂ)) = 2 :=
  sorry

/-! ## Layer 12: Cesàro summability -/

/-- **12.1, the Hardy–Landau Tauberian theorem, one-sided form.** Let `a : ℕ → ℝ` with partial
sums `S_N = Σ_{n<N} a_n` whose Cesàro means `N⁻¹ Σ_{i<N} S_i` tend to `S`. If `n a_n ≥ −K` for
every `n`, then `S_N → S` (Hardy, *Divergent Series*, the Tauberian theorems for Cesàro means). -/
theorem tendsto_of_cesaro_of_mul_ge {a : ℕ → ℝ} {S K : ℝ}
    (hc : Tendsto (fun N : ℕ ↦ (N : ℝ)⁻¹ * ∑ i ∈ Finset.range N, ∑ n ∈ Finset.range i, a n)
      atTop (𝓝 S))
    (ha : ∀ n : ℕ, -K ≤ n * a n) :
    Tendsto (fun N : ℕ ↦ ∑ n ∈ Finset.range N, a n) atTop (𝓝 S) :=
  sorry

/-- **12.1, the Hardy–Landau Tauberian theorem in a real normed space.** If the Cesàro means of the
partial sums of `a : ℕ → E` tend to `S` and `n ‖a_n‖ ≤ K` for every `n`, then the partial sums
tend to `S`. No completeness of `E` is needed: the limit `S` is given. -/
theorem tendsto_of_cesaro_of_norm_mul_le {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {a : ℕ → E} {S : E} {K : ℝ}
    (hc : Tendsto (fun N : ℕ ↦ (N : ℝ)⁻¹ • ∑ i ∈ Finset.range N, ∑ n ∈ Finset.range i, a n)
      atTop (𝓝 S))
    (ha : ∀ n : ℕ, n * ‖a n‖ ≤ K) :
    Tendsto (fun N : ℕ ↦ ∑ n ∈ Finset.range N, a n) atTop (𝓝 S) :=
  sorry

/-! ## Layer 13: arithmetic applications -/

/-- **13.1, the least number of bounded factors of `n!`**: the least `t` such that
`n! = a₁ ⋯ a_t` with integers `1 ≤ a_i ≤ B`. Such a factorization exists for `B ≥ n` (the factors
`1, 2, …, n`); the value is the junk `0` when none exists. -/
noncomputable def factorialFactorCount (B n : ℕ) : ℕ :=
  sInf {t | ∃ a : Fin t → ℕ, (∀ i, 1 ≤ a i ∧ a i ≤ B) ∧ ∏ i, a i = n.factorial}

/-- **13.1, Erdős problem 392.** The least number of factors at most `n²` whose product is `n!`
is `n/2 − n/(2 log n) + o(n/log n)` (Kontorovich–Tao, Theorem 8.1.2). -/
theorem factorialFactorCount_sq_sub_isLittleO :
    (fun n : ℕ ↦ (factorialFactorCount (n ^ 2) n : ℝ) - (n / 2 - n / (2 * Real.log n)))
      =o[atTop] fun n : ℕ ↦ (n : ℝ) / Real.log n :=
  sorry

/-- **13.1, factors at most `n`.** The least number of factors at most `n` whose product is `n!`
is `n − n/log n + o(n/log n)` (Kontorovich–Tao, Theorem 8.1.1). -/
theorem factorialFactorCount_self_sub_isLittleO :
    (fun n : ℕ ↦ (factorialFactorCount n n : ℝ) - (n - n / Real.log n))
      =o[atTop] fun n : ℕ ↦ (n : ℝ) / Real.log n :=
  sorry

/-- **13.2, the even Goldbach range**: every even `n` with `4 ≤ n ≤ H` is a sum of two primes. -/
def EvenGoldbachUpTo (H : ℝ) : Prop :=
  ∀ n : ℕ, Even n → 4 ≤ n → (n : ℝ) ≤ H → ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ n = p + q

/-- **13.2, the odd Goldbach range**: every odd `n` with `7 ≤ n ≤ H` is a sum of three primes,
primes being allowed to repeat. -/
def OddGoldbachUpTo (H : ℝ) : Prop :=
  ∀ n : ℕ, Odd n → 7 ≤ n → (n : ℝ) ≤ H → ∃ p q r : ℕ, p.Prime ∧ q.Prime ∧ r.Prime ∧ n = p + q + r

/-- **13.2, the interval transfer.** Let `Δ > 1` and `x₀` with `x₀(1 − 1/Δ) ≥ 2`, and suppose
every interval `(x(1 − 1/Δ), x]` with `x ≥ x₀` contains a prime. Then the even range up to `H`
and the odd range up to `x₀ + 4` give the odd range up to `(H − 4)Δ + 4` (the prime-ladder
argument recalled by Helfgott–Platt, §1). -/
theorem oddGoldbachUpTo_of_primeGaps {Δ x₀ H : ℝ} (hΔ : 1 < Δ) (hx₀ : 2 ≤ x₀ * (1 - 1 / Δ))
    (hgap : ∀ x : ℝ, x₀ ≤ x → ∃ p : ℕ, p.Prime ∧ x * (1 - 1 / Δ) < p ∧ (p : ℝ) ≤ x)
    (hE : EvenGoldbachUpTo H) (hO : OddGoldbachUpTo (x₀ + 4)) :
    OddGoldbachUpTo ((H - 4) * Δ + 4) :=
  sorry

end TauCetiRoadmap.AnalyticNumberTheoryPartIII
