module

import Mathlib

/-!
# Linear forms in logarithms, over `ℂ` and `ℂ_p`: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here are its acceptance test: suggested Lean forms for the headline
theorems of each layer and the definitions they need, so that contributors and reviewers converge
on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

The narrative roadmap (the layers, the conventions, the worked examples, the references and the
provenance of these statements) is in `README.md`. Mathlib has power series in the sense of
`FormalMultilinearSeries`, the one-variable Cauchy and Schwarz estimates, the house of an algebraic
number and Siegel's lemma; it has no multi-index Taylor coefficients, no estimates on polydiscs, and
no transcendence theorem for the exponential function. We build those here in `TauCeti/`.

`FormalMultilinearSeries.mvCoeff` is the multi-index coefficient of a formal series on `ι → 𝕜`,
named so as not to collide with Mathlib's one-variable `FormalMultilinearSeries.coeff`, and
`mvTaylorCoeff` is the Taylor coefficient of a function at a point, `0` where the function is not
analytic. Series in one variable over an ultrametric field (Layer 8) are Mathlib's `PowerSeries`,
evaluated with `FormalMultilinearSeries.ofScalarsSum`. The steps of the proofs of 5.7 and 8.10
(5.1–5.6 and 8.6–8.9) are specified in `README.md` and have no Lean form here. Every
target name that `README.md` uses is declared here, and the Mathlib declarations it cites in these
namespaces are pinned by `#check` below. The targets elaborate against the pinned Mathlib and are
stated with `sorry` (allowed in this human-owned roadmap library).
-/

open scoped NNReal

-- Mathlib declarations that `README.md` cites.

#check @NumberField.of_module_finite
#check @Complex.cpow
#check @PadicComplex.isAlgClosed
#check @IsUltrametricDist.of_normedAlgebra
#check @IsUltrametricDist.norm_natCast_le_one
#check @FormalMultilinearSeries.ofScalars_sum_eq
#check @HasFPowerSeriesAt.apply_eq_zero
#check @HasFPowerSeriesOnBall.compContinuousLinearMap
#check @HasFPowerSeriesOnBall.factorial_smul
#check @HasFPowerSeriesOnBall.iteratedFDeriv_eq_sum_of_completeSpace
#check @Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le
#check @Complex.norm_le_of_forall_mem_frontier_norm_le
#check @Complex.differentiableOn_dslope
#check @HasFPowerSeriesAt.has_fpower_series_iterate_dslope_fslope
#check @Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO
#check @Complex.exp_eq_exp_ℂ
#check @Polynomial.taylor
#check @Polynomial.le_rootMultiplicity_iff
#check @Polynomial.rootMultiplicity_eq_natTrailingDegree
#check @NumberField.norm_norm_le_norm_mul_house_pow
#check @NumberField.house.exists_ne_zero_int_vec_house_le
#check @Padic.norm_eq_zpow_neg_valuation
#check @Padic.valuation_natCast
#check @IsUltrametricDist.norm_tsum_le_of_forall_le_of_nonneg
#check @PowerSeries.coeff_derivative
#check @PowerSeries.gaussNorm
#check @Polynomial.gaussNorm_mul
#check @Polynomial.factorial_smul_hasseDeriv
#check @Polynomial.degreeLTEquiv

namespace TauCetiRoadmap.LinearFormsInLogarithms

/-! ## Layer 0: multi-index power series -/

section Layer0

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜] {ι : Type*} [Fintype ι]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]

open Classical in
/-- **Layer 0.3, the multi-index coefficient** of a formal series on `ι → 𝕜`: the sum of
`p (∑ i, α i)` over the tuples of basis vectors in which each basis vector `Pi.single i 1`
occurs `α i` times. -/
noncomputable def FormalMultilinearSeries.mvCoeff (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F)
    (α : ι → ℕ) : F :=
  ∑ g ∈ Finset.univ.filter (fun g : Fin (∑ i, α i) → ι =>
      ∀ i, (Finset.univ.filter fun j => g j = i).card = α i),
    p (∑ i, α i) fun j => Pi.single (g j) (1 : 𝕜)

/-- **Layer 0.3, the degree-`k` term in multi-index form.** -/
theorem FormalMultilinearSeries.apply_eq_sum_mvCoeff [DecidableEq ι]
    (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F) (k : ℕ) (z : ι → 𝕜) :
    p k (fun _ => z) = ∑ α ∈ Finset.univ.piAntidiag k,
      (∏ i, z i ^ α i) • FormalMultilinearSeries.mvCoeff p α :=
  sorry

/-- **Layer 0.3, an analytic function is the sum of its multi-index series** where the
homogeneous terms, weighted by `(card ι) ^ k`, converge normally. -/
theorem HasFPowerSeriesOnBall.hasSum_mvCoeff {f : (ι → 𝕜) → F}
    {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {r : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 r)
    {z : ι → 𝕜} (hz : ‖z‖ < r)
    (h : Summable fun k => (Fintype.card ι : ℝ) ^ k * ‖p k‖ * ‖z‖ ^ k) :
    HasSum (fun α : ι → ℕ => (∏ i, z i ^ α i) • FormalMultilinearSeries.mvCoeff p α) (f z) :=
  sorry

/-- **Layer 0.3, a normally convergent multi-index series has a power series** on the polydisc,
whose multi-index coefficients are the given ones. -/
theorem exists_hasFPowerSeriesOnBall_tsum [CompleteSpace F] (c : (ι → ℕ) → F) {r : ℝ≥0}
    (hr : 0 < r) (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (r : ℝ) ^ (∑ i, α i)) :
    ∃ p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F,
      HasFPowerSeriesOnBall (fun z : ι → 𝕜 => ∑' α : ι → ℕ, (∏ i, z i ^ α i) • c α) p 0 r ∧
        ∀ α, FormalMultilinearSeries.mvCoeff p α = c α :=
  sorry

/-- **Layer 0.3, the identity theorem in coefficient form.** -/
theorem HasFPowerSeriesAt.mvCoeff_eq_zero_of_eventuallyEq_zero {f : (ι → 𝕜) → F}
    {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {x : ι → 𝕜} (hf : HasFPowerSeriesAt f p x)
    (h0 : f =ᶠ[nhds x] 0) (α : ι → ℕ) : FormalMultilinearSeries.mvCoeff p α = 0 :=
  sorry

open Classical in
/-- **Layer 0.4, the Taylor coefficient** of `f` at `x`: the coefficient of `(z - x) ^ α` in the
expansion of `f` about `x`, and `0` where `f` is not analytic at `x`. -/
noncomputable def mvTaylorCoeff (f : (ι → 𝕜) → F) (x : ι → 𝕜) (α : ι → ℕ) : F :=
  if h : AnalyticAt 𝕜 f x then FormalMultilinearSeries.mvCoeff h.choose α else 0

/-- **Layer 0.4, independence of the chosen series.** -/
theorem HasFPowerSeriesAt.mvTaylorCoeff_eq {f : (ι → 𝕜) → F}
    {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {x : ι → 𝕜} (hp : HasFPowerSeriesAt f p x)
    (α : ι → ℕ) : mvTaylorCoeff f x α = FormalMultilinearSeries.mvCoeff p α :=
  sorry

/-- **Layer 0.4, additivity.** -/
theorem AnalyticAt.mvTaylorCoeff_add {f g : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x)
    (hg : AnalyticAt 𝕜 g x) (α : ι → ℕ) :
    mvTaylorCoeff (f + g) x α = mvTaylorCoeff f x α + mvTaylorCoeff g x α :=
  sorry

/-- **Layer 0.4, constant multiples.** -/
theorem mvTaylorCoeff_const_smul (c : 𝕜) (f : (ι → 𝕜) → F) (x : ι → 𝕜) (α : ι → ℕ) :
    mvTaylorCoeff (fun z => c • f z) x α = c • mvTaylorCoeff f x α :=
  sorry

/-- **Layer 0.4, locality**: functions equal near `x` have the same Taylor coefficients at `x`. -/
theorem Filter.EventuallyEq.mvTaylorCoeff_eq {f g : (ι → 𝕜) → F} {x : ι → 𝕜}
    (h : f =ᶠ[nhds x] g) (α : ι → ℕ) : mvTaylorCoeff f x α = mvTaylorCoeff g x α :=
  sorry

/-- **Layer 0.4, translation.** -/
theorem mvTaylorCoeff_comp_add_right (f : (ι → 𝕜) → F) (x y : ι → 𝕜) (α : ι → ℕ) :
    mvTaylorCoeff (fun z => f (z + y)) x α = mvTaylorCoeff f (x + y) α :=
  sorry

/-- **Layer 0.4, agreement with iterated derivatives**: `D^α f (x) = α! • mvTaylorCoeff f x α`,
for any tuple of basis vectors with counts `α`. -/
theorem AnalyticAt.prod_factorial_smul_mvTaylorCoeff [DecidableEq ι] [CompleteSpace F]
    {f : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) (α : ι → ℕ) (v : Fin (∑ i, α i) → ι)
    (hv : ∀ i, (Finset.univ.filter fun j => v j = i).card = α i) :
    (∏ i, (α i).factorial) • mvTaylorCoeff f x α =
      iteratedFDeriv 𝕜 (∑ i, α i) f x (fun j => Pi.single (v j) 1) :=
  sorry

/-- **Layer 0.4, one variable**: for a singleton index type, `k! • mvTaylorCoeff` is the
`k`-th derivative. No factorial is inverted, so this holds in every characteristic. -/
theorem AnalyticAt.factorial_smul_mvTaylorCoeff_of_unique [Unique ι] [CompleteSpace F]
    {f : 𝕜 → F} {x : 𝕜} (hf : AnalyticAt 𝕜 f x) (α : ι → ℕ) :
    (α default).factorial • mvTaylorCoeff (fun z : ι → 𝕜 => f (z default)) (fun _ => x) α =
      iteratedDeriv (α default) f x :=
  sorry

/-- **Layer 0.4, the product rule** for a scalar function times a vector-valued one. -/
theorem AnalyticAt.mvTaylorCoeff_smul [DecidableEq ι] [CompleteSpace F] {f : (ι → 𝕜) → 𝕜}
    {g : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) (hg : AnalyticAt 𝕜 g x) (α : ι → ℕ) :
    mvTaylorCoeff (fun z => f z • g z) x α =
      ∑ β ∈ Finset.Iic α, mvTaylorCoeff f x β • mvTaylorCoeff g x (α - β) :=
  sorry

/-- **Layer 0.4, the local expansion** of an analytic function, normally convergent on a
polydisc. -/
theorem AnalyticAt.exists_hasSum_mvTaylorCoeff {f : (ι → 𝕜) → F} {x : ι → 𝕜}
    (hf : AnalyticAt 𝕜 f x) :
    ∃ ρ : ℝ≥0, 0 < ρ ∧
      Summable (fun α : ι → ℕ => ‖mvTaylorCoeff f x α‖ * (ρ : ℝ) ^ (∑ i, α i)) ∧
      ∀ y : ι → 𝕜, ‖y‖ < ρ →
        HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • mvTaylorCoeff f x α) (f (x + y)) :=
  sorry

/-- **Layer 0.4, coefficients from an expansion.** -/
theorem mvTaylorCoeff_eq_of_hasSum {f : (ι → 𝕜) → F} {x : ι → 𝕜}
    {c : (ι → ℕ) → F} {ρ : ℝ≥0} (hρ : 0 < ρ)
    (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (ρ : ℝ) ^ (∑ i, α i))
    (h : ∀ y : ι → 𝕜, ‖y‖ < ρ →
      HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • c α) (f (x + y)))
    (α : ι → ℕ) : mvTaylorCoeff f x α = c α :=
  sorry

/-- **Layer 0.4, a linear change of variables preserves vanishing in each total degree.** -/
theorem ContinuousLinearMap.mvTaylorCoeff_comp_eq_zero {κ : Type*} [Fintype κ] {G : (ι → 𝕜) → F}
    (A : (κ → 𝕜) →L[𝕜] (ι → 𝕜)) {x : κ → 𝕜} (hG : AnalyticAt 𝕜 G (A x)) {k : ℕ}
    (h : ∀ α : ι → ℕ, ∑ i, α i = k → mvTaylorCoeff G (A x) α = 0) :
    ∀ β : κ → ℕ, ∑ j, β j = k → mvTaylorCoeff (G ∘ A) x β = 0 :=
  sorry

/-- **Layer 0.5, the divided difference in one coordinate is analytic**, across the hyperplane
`z i = ζ` as well as off it. -/
theorem analyticAt_dslope_update [DecidableEq ι] [CompleteSpace F] {f : (ι → 𝕜) → F} (i : ι)
    (ζ : 𝕜) {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) (hres : AnalyticAt 𝕜 f (Function.update x i ζ)) :
    AnalyticAt 𝕜 (fun z : ι → 𝕜 => dslope (fun w => f (Function.update z i w)) ζ (z i)) x :=
  sorry

end Layer0

/-! ## Layer 1: estimates on polydiscs -/

section Layer1

/-- **Layer 1.3, a zero of order `T` is `o (‖w - z₀‖ ^ (T - 1))`**, over any nontrivially normed
field. -/
theorem isLittleO_sub_pow_sub_one_of_le_analyticOrderAt {𝕜 : Type*} [NontriviallyNormedField 𝕜]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E] {g : 𝕜 → E} {z₀ : 𝕜} {T : ℕ}
    (hT : 1 ≤ T) (h : (T : ℕ∞) ≤ analyticOrderAt g z₀) :
    Asymptotics.IsLittleO (nhds z₀) (fun w => g w - g z₀) (fun w => ‖w - z₀‖ ^ (T - 1)) :=
  sorry

/-- **Layer 1.3, Schwarz's lemma for a zero of order `T`.** -/
theorem Complex.norm_le_mul_div_pow_of_le_analyticOrderAt {V : Type*} [NormedAddCommGroup V]
    [NormedSpace ℂ V] {g : ℂ → V} {c : ℂ} {ρ M : ℝ}
    (hd : DifferentiableOn ℂ g (Metric.ball c ρ)) (hM : ∀ w ∈ Metric.ball c ρ, ‖g w‖ ≤ M)
    {T : ℕ} (hT : (T : ℕ∞) ≤ analyticOrderAt g c) {w : ℂ} (hw : w ∈ Metric.ball c ρ) :
    ‖g w‖ ≤ M * (‖w - c‖ / ρ) ^ T :=
  sorry

variable {ι : Type*} [Fintype ι]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]

/-- **Layer 1.4, Cauchy's inequality on a polydisc.** -/
theorem HasFPowerSeriesOnBall.norm_mvCoeff_mul_pow_le {f : (ι → ℂ) → V}
    {p : FormalMultilinearSeries ℂ (ι → ℂ) V} {R : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 R)
    {M : ℝ} (hM : ∀ y ∈ Metric.ball (0 : ι → ℂ) R, ‖f y‖ ≤ M) (α : ι → ℕ) {ρ : ℝ} (hρ0 : 0 ≤ ρ)
    (hρ : ρ < R) : ‖FormalMultilinearSeries.mvCoeff p α‖ * ρ ^ (∑ i, α i) ≤ M :=
  sorry

/-- **Layer 1.5, the Taylor remainder**, with the constant `1 + T`. -/
theorem HasFPowerSeriesOnBall.norm_sub_partialSum_le {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] {f : E → V} {p : FormalMultilinearSeries ℂ E V} {R : ℝ≥0}
    (hf : HasFPowerSeriesOnBall f p 0 R) {M : ℝ} (hM : ∀ y ∈ Metric.ball (0 : E) R, ‖f y‖ ≤ M)
    (T : ℕ) {z : E} (hz : ‖z‖ < R) :
    ‖f z - p.partialSum T z‖ ≤ (1 + T) * M * (‖z‖ / R) ^ T :=
  sorry

/-- **Layer 1.6, Schwarz's lemma for Cartesian products**, in the form `5 r ≤ R`: a function
vanishing to order `m` in each coordinate at the points of `∏ i, E i` is small on the polydisc
of radius `r`. -/
theorem norm_le_of_mvTaylorCoeff_eq_zero [Nonempty ι] {f : (ι → ℂ) → V} {E : ι → Finset ℂ}
    {S m : ℕ} (hE : ∀ i, (E i).card = S) {r R M : ℝ} (hr : 0 ≤ r) (hR : 0 < R) (h5 : 5 * r ≤ R)
    (hEr : ∀ i, ∀ ζ ∈ E i, ‖ζ‖ ≤ r) (hf : AnalyticOnNhd ℂ f (Metric.closedBall 0 R))
    (hM : ∀ y ∈ Metric.closedBall (0 : ι → ℂ) R, ‖f y‖ ≤ M)
    (hvan : ∀ ξ : ι → ℂ, (∀ i, ξ i ∈ E i) → ∀ κ : ι → ℕ, (∀ i, κ i < m) →
      mvTaylorCoeff f ξ κ = 0)
    {z : ι → ℂ} (hz : z ∈ Metric.closedBall 0 r) :
    ‖f z‖ ≤ Fintype.card ι * (5 * 3 ^ Fintype.card ι * r / R) ^ (m * S) * M :=
  sorry

end Layer1

/-! ## Layer 2: exponential polynomials -/

section Layer2

variable {ι : Type*} [Fintype ι]

/-- **Layer 2.1, Taylor coefficients of an exponential monomial** (Waldschmidt, Lemma 4.9). -/
theorem mvTaylorCoeff_prod_pow_mul_cexp (τ σ : ι → ℕ) (w ξ : ι → ℂ) :
    mvTaylorCoeff (fun z : ι → ℂ => (∏ v, z v ^ τ v) * Complex.exp (∑ v, w v * z v)) ξ σ =
      Complex.exp (∑ v, w v * ξ v) * ∏ v, ∑ j ∈ Finset.range (σ v + 1),
        ((τ v).choose j : ℂ) * ξ v ^ (τ v - j) * (w v ^ (σ v - j) / (σ v - j).factorial) :=
  sorry

/-- **Layer 2.3, linear independence of exponential polynomials** with distinct frequencies. -/
theorem eq_zero_of_sum_eval_mul_cexp (T : Finset (ι → ℂ)) (P : (ι → ℂ) → MvPolynomial ι ℂ)
    (hP : ∀ z : ι → ℂ, ∑ w ∈ T, MvPolynomial.eval z (P w) * Complex.exp (∑ v, w v * z v) = 0) :
    ∀ w ∈ T, P w = 0 :=
  sorry

end Layer2

/-! ## Layer 3: arithmetic -/

section Layer3

open _root_.NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.1, Liouville's inequality** for a nonzero algebraic integer. -/
theorem NumberField.one_le_norm_embedding_mul_house_pow {α : K} (hint : IsIntegral ℤ α)
    (hα : α ≠ 0) (σ : K →+* ℂ) :
    1 ≤ ‖σ α‖ * house α ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.2, Liouville's inequality for a number of known size**: `δ ^ a * α` is a nonzero
algebraic integer of house at most `H`. -/
theorem NumberField.one_le_pow_mul_norm_embedding_mul_pow {δ a : ℕ} (hδ : δ ≠ 0) {α : K}
    (hα : α ≠ 0) {H : ℝ} (hint : IsIntegral ℤ ((δ : K) ^ a * α))
    (hH : house ((δ : K) ^ a * α) ≤ H) (σ : K →+* ℂ) :
    1 ≤ (δ : ℝ) ^ a * ‖σ α‖ * H ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.4, Thue–Siegel's lemma for real linear forms** (Waldschmidt, Lemma 4.11). -/
theorem ThueSiegel.exists_ne_zero_int_vec_abs_le_of_pow_lt {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u : ι → κ → ℝ) {U : ℝ} (hU : ∀ j, ∑ i, |u i j| ≤ U) {X ℓ : ℕ} (hℓ : 0 < ℓ)
    (hcard : ℓ ^ Fintype.card κ < (X + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧ ∀ j, |∑ i, u i j * ξ i| ≤ U * X / ℓ :=
  sorry

/-- **Layer 3.4, Thue–Siegel's lemma for complex linear forms** (Waldschmidt, Lemma 4.12). -/
theorem ThueSiegel.exists_ne_zero_int_vec_norm_le_of_pow_le {ι κ : Type*} [Fintype ι] [Nonempty ι]
    [Fintype κ] (u : ι → κ → ℂ) {U V : ℝ} (hU : ∀ j, ∑ i, ‖u i j‖ ≤ Real.exp U) {X : ℕ}
    (hX : 0 < X)
    (hcard : (Real.sqrt 2 * X * Real.exp (U + V) + 1) ^ (2 * Fintype.card κ) ≤
      ((X : ℝ) + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧
      ∀ j, ‖∑ i, u i j * (ξ i : ℂ)‖ ≤ Real.exp (-V) :=
  sorry

/-- **Layer 3.5, Siegel's lemma over `K` with a constant depending only on `K`**, for systems with
at least one equation and at least twice as many unknowns as equations. -/
theorem NumberField.house.exists_const_ne_zero_int_vec_house_le (K : Type*) [Field K]
    [NumberField K] :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (α β : Type) [Fintype α] [Fintype β] (a : Matrix α β (𝓞 K)) (A : ℝ),
      1 ≤ A → 0 < Fintype.card α → 2 * Fintype.card α ≤ Fintype.card β →
      (∀ i j, house (a i j : K) ≤ A) →
      ∃ ξ : β → 𝓞 K, ξ ≠ 0 ∧ a.mulVec ξ = 0 ∧ ∀ l, house (ξ l : K) ≤ C * (Fintype.card β * A) :=
  sorry

end Layer3

/-! ## Layer 4: the auxiliary function -/

/-- **Layer 4.1, the auxiliary function** (Waldschmidt, Proposition 4.10): integers, not all
zero and at most `e ^ N`, for which `∑ p_λ φ_λ` is at most `e ^ (-V)` on the polydisc of
radius `r`. -/
theorem exists_ne_zero_int_norm_sum_le {ι Λ : Type*} [Fintype ι] [Nonempty ι] [Fintype Λ]
    {φ : Λ → (ι → ℂ) → ℂ} {P : Λ → FormalMultilinearSeries ℂ (ι → ℂ) ℂ} {R : ℝ≥0}
    (hφ : ∀ l, HasFPowerSeriesOnBall (φ l) (P l) 0 R)
    {M : Λ → ℝ} (hM : ∀ l, ∀ y ∈ Metric.ball (0 : ι → ℂ) R, ‖φ l y‖ ≤ M l)
    {N U V r : ℝ} (hN : 0 < N) (hr : 0 < r) (hMU : ∑ l, M l ≤ Real.exp U)
    (hW : 12 * (Fintype.card ι : ℝ) ^ 2 ≤ N + U + V)
    (hRr : Real.exp 1 ≤ R / r) (hRr' : R / r ≤ Real.exp ((N + U + V) / 6))
    (hL : (2 * (N + U + V)) ^ (Fintype.card ι + 1) ≤
      Fintype.card Λ * N * Real.log (R / r) ^ Fintype.card ι) :
    ∃ p : Λ → ℤ, p ≠ 0 ∧ (∀ l, |(p l : ℝ)| ≤ Real.exp N) ∧
      ∀ z ∈ Metric.closedBall (0 : ι → ℂ) r, ‖∑ l, (p l : ℂ) * φ l z‖ ≤ Real.exp (-V) :=
  sorry

/-! ## Layer 5: the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂˣ)^{d₁}` -/

/-- **Layer 5.7, the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂˣ)^{d₁}`** (Waldschmidt,
Corollary 4.2): one of the first `d₀` coordinates of the `yⱼ` or one of the `exp (xᵢ · yⱼ)` is
transcendental. -/
theorem SchneiderLang.exists_transcendental_of_linearIndependent {d₀ d₁ n : ℕ} (hd₀ : d₀ ≤ n)
    (hn : n < d₀ + d₁) (x : Fin d₁ → Fin n → ℂ) (hx : ∀ i v, IsAlgebraic ℚ (x i v))
    (hxli : LinearIndependent ℚ x) (y : Fin n → Fin n → ℂ) (hyli : LinearIndependent ℂ y) :
    (∃ (h : Fin d₀) (j : Fin n), Transcendental ℚ (y j (Fin.castLE hd₀ h))) ∨
      ∃ (i : Fin d₁) (j : Fin n), Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-! ## Layer 6: consequences of the criterion -/

section Layer6

variable {n : ℕ}

/-- **Layer 6.1, the case `d₀ = 0`** (Waldschmidt, Corollary 4.3, with `ℚ`-linearly independent
`xᵢ`): some `exp (xᵢ · yⱼ)` is transcendental when the `yⱼ` span `ℂⁿ`. -/
theorem SchneiderLang.exists_transcendental_exp_of_span_eq_top {d l : ℕ} (hd : n + 1 ≤ d)
    (x : Fin d → Fin n → ℂ) (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin l → Fin n → ℂ) (hy : Submodule.span ℂ (Set.range y) = ⊤) :
    ∃ (i : Fin d) (j : Fin l), Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-- **Layer 6.2, the case `d₀ = 1`, `d₁ = n`** (Waldschmidt, Corollary 4.4): some
`exp (xᵢ · yⱼ)` is transcendental when the first coordinates of the `yⱼ` are algebraic. -/
theorem SchneiderLang.exists_transcendental_exp_of_isAlgebraic_coord {d : ℕ} [NeZero d]
    (x : Fin d → Fin d → ℂ) (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin d → Fin d → ℂ) (hyli : LinearIndependent ℂ y)
    (hy₁ : ∀ j, IsAlgebraic ℚ (y j 0)) :
    ∃ i j : Fin d, Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann**, branch-free: a nonzero logarithm of an algebraic number is
transcendental. -/
theorem transcendental_of_isAlgebraic_exp {x : ℂ} (hx : x ≠ 0)
    (h : IsAlgebraic ℚ (Complex.exp x)) : Transcendental ℚ x :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann** for the exponential of an algebraic number, with the name
and statement of Yuyang Zhao's Mathlib formalisation of Lindemann–Weierstrass. -/
theorem transcendental_exp {a : ℂ} (a0 : a ≠ 0) (ha : IsAlgebraic ℤ a) :
    Transcendental ℤ (Complex.exp a) :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann** for the principal logarithm of an algebraic number, with
the name and statement of Yuyang Zhao's Mathlib formalisation of Lindemann–Weierstrass. -/
theorem transcendental_log {u : ℂ} (hu0 : Complex.log u ≠ 0) (hu : IsAlgebraic ℤ u) :
    Transcendental ℤ (Complex.log u) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, branch-free: `exp (b x)` is transcendental for a nonzero
logarithm `x` of an algebraic number and an algebraic irrational `b`. -/
theorem transcendental_exp_mul {x b : ℂ} (hx : x ≠ 0) (h : IsAlgebraic ℚ (Complex.exp x))
    (hb : IsAlgebraic ℚ b) (hb' : ∀ q : ℚ, b ≠ q) : Transcendental ℚ (Complex.exp (b * x)) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, in Mathlib's principal branch, with the name and statement
of the Mathlib formalisation of Gelfond–Schneider. -/
theorem GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational (α β : ℂ)
    (hα : IsAlgebraic ℚ α) (hβ : IsAlgebraic ℚ β) (htriv : α ≠ 0 ∧ α ≠ 1)
    (hirr : ∀ i j : ℤ, β ≠ i / j) : Transcendental ℚ (α ^ β) :=
  sorry

/-- **Layer 6.4, quotients of logarithms** of algebraic numbers are rational or
transcendental. -/
theorem exists_rat_eq_div_or_transcendental {x y : ℂ} (hx : IsAlgebraic ℚ (Complex.exp x))
    (hy : IsAlgebraic ℚ (Complex.exp y)) (hx0 : x ≠ 0) :
    (∃ q : ℚ, y / x = q) ∨ Transcendental ℚ (y / x) :=
  sorry

end Layer6

/-! ## Layer 7: Baker's theorem -/

section Layer7

/-- **Layer 7.1** (Waldschmidt, Theorem 4.5): logarithms `lᵢ` of algebraic numbers with
`∑ βᵢ lᵢ` algebraic, for a basis `β` of a number field, all vanish. -/
theorem Baker.eq_zero_of_isAlgebraic_sum_mul (K : IntermediateField ℚ ℂ) {ι : Type*} [Fintype ι]
    (β : Module.Basis ι ℚ K) (l : ι → ℂ) (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hsum : IsAlgebraic ℚ (∑ i, (β i : ℂ) * l i)) : ∀ i, l i = 0 :=
  sorry

/-- **Layer 7.2, Baker's theorem** (Waldschmidt, Theorem 1.6; Baker, Theorem 2.1): `1` and
`ℚ`-linearly independent logarithms of algebraic numbers are linearly independent over the
algebraic numbers. -/
theorem Baker.eq_zero_of_add_sum_mul_eq_zero {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) (hli : LinearIndependent ℚ l) {β₀ : ℂ}
    {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hrel : β₀ + ∑ i, β i * l i = 0) : β₀ = 0 ∧ ∀ i, β i = 0 :=
  sorry

/-- **Layer 7.2, Baker's theorem** for a family indexed by a finite set. -/
theorem Baker.eq_zero_of_add_sum_mul_eq_zero_of_linearIndepOn {ι : Type*} {s : Finset ι}
    {l : ι → ℂ} (hl : ∀ i ∈ s, IsAlgebraic ℚ (Complex.exp (l i))) (hli : LinearIndepOn ℚ l s)
    {β₀ : ℂ} {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i ∈ s, IsAlgebraic ℚ (β i))
    (hrel : β₀ + ∑ i ∈ s, β i * l i = 0) : β₀ = 0 ∧ ∀ i ∈ s, β i = 0 :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.2): `β₀ + ∑ βᵢ lᵢ ≠ 0` for algebraic `β₀ ≠ 0`, with no
independence hypothesis. -/
theorem Baker.add_sum_mul_ne_zero {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β₀ : ℂ} {β : ι → ℂ}
    (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ₀0 : β₀ ≠ 0) :
    β₀ + ∑ i, β i * l i ≠ 0 :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.2): a nonzero linear form in logarithms of algebraic numbers
with algebraic coefficients is transcendental. -/
theorem Baker.transcendental_sum_mul {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β : ι → ℂ} (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hΛ : ∑ i, β i * l i ≠ 0) : Transcendental ℚ (∑ i, β i * l i) :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.3): `exp (β₀ + ∑ βᵢ lᵢ)` is transcendental for algebraic
`β₀ ≠ 0`. -/
theorem Baker.transcendental_exp_add_sum_mul {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β₀ : ℂ} {β : ι → ℂ}
    (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ₀0 : β₀ ≠ 0) :
    Transcendental ℚ (Complex.exp (β₀ + ∑ i, β i * l i)) :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.4), branch-free: `exp (∑ βᵢ lᵢ)` is transcendental for
logarithms `lᵢ` of algebraic numbers, not all zero, when `1, β₁, …, βₙ` are `ℚ`-linearly
independent. -/
theorem Baker.transcendental_exp_sum_mul {ι : Type*} [Fintype ι] {l β : ι → ℂ}
    (hl0 : ∃ i, l i ≠ 0) (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (Complex.exp (∑ i, β i * l i)) :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.4), in Mathlib's principal branch: `∏ αᵢ ^ βᵢ` is
transcendental for nonzero algebraic `αᵢ`, not all `1`, when `1, β₁, …, βₙ` are `ℚ`-linearly
independent. -/
theorem Baker.transcendental_prod_cpow {ι : Type*} [Fintype ι] {α β : ι → ℂ}
    (hα : ∀ i, IsAlgebraic ℚ (α i)) (hα0 : ∀ i, α i ≠ 0) (hα1 : ∃ i, α i ≠ 1)
    (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (∏ i, α i ^ β i) :=
  sorry

end Layer7

/-! ## Layer 8: Baker's theorem over `ℂ_[p]` -/

section Layer8

open _root_.Polynomial _root_.NumberField

variable {p : ℕ} [hp : Fact p.Prime]

/-- **Layer 8.2**: a nonzero integer `n` has `p`-adic norm at least `1 / |n|`. -/
theorem Padic.one_le_abs_mul_norm_intCast {n : ℤ} (hn : n ≠ 0) :
    1 ≤ |(n : ℝ)| * ‖(n : ℚ_[p])‖ :=
  sorry

section General

variable {L : Type*} [NontriviallyNormedField L] [NormedAlgebra ℚ_[p] L] [CompleteSpace L]

omit [CompleteSpace L] in
/-- **Layer 8.1, the radius of the exponential series** is at least `p ^ (-1 / (p - 1))`. -/
theorem PadicExp.le_radius_expSeries :
    ENNReal.ofReal ((p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) ≤ (NormedSpace.expSeries L L).radius :=
  sorry

/-- **Layer 8.1, the functional equation** on the disc of convergence. -/
theorem PadicExp.exp_add {x y : L} (hx : ‖x‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹))
    (hy : ‖y‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) :
    NormedSpace.exp (x + y) = NormedSpace.exp x * NormedSpace.exp y :=
  sorry

/-- **Layer 8.1**: `‖exp x - 1‖ = ‖x‖` on the disc of convergence. -/
theorem PadicExp.norm_exp_sub_one {x : L} (hx : ‖x‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) :
    ‖NormedSpace.exp x - 1‖ = ‖x‖ :=
  sorry

/-- **Layer 8.1, the exponential is injective** on the disc of convergence. -/
theorem PadicExp.injOn_exp :
    Set.InjOn (NormedSpace.exp : L → L) {x | ‖x‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)} :=
  sorry

/-- **Layer 8.4, the value of an exponential polynomial** inside the disc of convergence. -/
theorem PowerSeries.hasSum_coeff_coe_mul_rescale_exp [CharZero L] (Q : L[X]) {ψ x : L}
    (h : ‖ψ * x‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) :
    HasSum (fun k => PowerSeries.coeff k ((Q : PowerSeries L) *
        PowerSeries.rescale ψ (PowerSeries.exp L)) * x ^ k)
      (Q.eval x * NormedSpace.exp (ψ * x)) :=
  sorry

omit [CompleteSpace L] in
/-- **Layer 8.4, the coefficients of an exponential polynomial** on the disc: if
`‖Q.coeff j‖ r ^ j ≤ M` and `‖ψ‖ r ≤ p ^ (-1 / (p - 1))`, then the coefficients of
`Q (X) exp (ψ X)` satisfy the same bound. -/
theorem PowerSeries.norm_coeff_coe_mul_rescale_exp_mul_pow_le [CharZero L] (Q : L[X]) {ψ : L}
    {r M : ℝ} (hr : 0 ≤ r) (hψ : ‖ψ‖ * r ≤ (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹))
    (hQ : ∀ j, ‖Q.coeff j‖ * r ^ j ≤ M) (k : ℕ) :
    ‖PowerSeries.coeff k ((Q : PowerSeries L) * PowerSeries.rescale ψ (PowerSeries.exp L))‖ *
      r ^ k ≤ M :=
  sorry

end General

/-- **Layer 8.2, integral elements have norm at most `1`** in an ultrametric normed field. -/
theorem IsUltrametricDist.norm_le_one_of_isIntegral {L : Type*} [NormedField L]
    [IsUltrametricDist L] {x : L} (hx : IsIntegral ℤ x) : ‖x‖ ≤ 1 :=
  sorry

/-- **Layer 8.2, Liouville's inequality at an ultrametric place**, for a number of known size. -/
theorem NumberField.one_le_pow_mul_norm_embedding_of_isUltrametricDist {L : Type*}
    [NormedField L] [IsUltrametricDist L] [IsAlgClosed L] {K : Type*} [Field K] [NumberField K]
    (hL : ∀ n : ℤ, n ≠ 0 → 1 ≤ |(n : ℝ)| * ‖(n : L)‖) {δ a : ℕ} (hδ : δ ≠ 0) {x : K}
    (hx0 : x ≠ 0) {H : ℝ} (hint : IsIntegral ℤ ((δ : K) ^ a * x))
    (hH : house ((δ : K) ^ a * x) ≤ H) (σ : K →+* L) : 1 ≤ H ^ Module.finrank ℚ K * ‖σ x‖ :=
  sorry

/-- **Layer 8.2, Schwarz's lemma in an ultrametric space**: vanishing of the terms of degree
`< T` gives the factor `(‖z‖ / r) ^ T`. -/
theorem HasFPowerSeriesOnBall.norm_le_mul_div_pow_of_isUltrametricDist {𝕜 : Type*}
    [NontriviallyNormedField 𝕜] {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]
    {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F] [IsUltrametricDist F] {f : E → F}
    {q : FormalMultilinearSeries 𝕜 E F} {R : ENNReal} (hf : HasFPowerSeriesOnBall f q 0 R)
    {T : ℕ} (hT : ∀ n < T, q n = 0) {r M : ℝ} (hr : 0 < r) (hM : ∀ n, ‖q n‖ * r ^ n ≤ M)
    {z : E} (hzr : ‖z‖ ≤ r) (hzR : z ∈ Metric.eball (0 : E) R) :
    ‖f z‖ ≤ M * (‖z‖ / r) ^ T :=
  sorry

section Ultrametric

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [CompleteSpace K]

/-- **Layer 8.3, many zeros in the unit disc force small coefficients.** If
`‖coeff k f‖ r ^ k ≤ M` with `r > 1`, and at each point `a` of a finite set `A` in the closed unit
disc the values of the formal derivatives of `f` of order `< S` vanish, then every coefficient is
at most `M r ^ (-(card A · S))`. -/
theorem PowerSeries.norm_coeff_le_of_ofScalarsSum_iterate_derivative_eq_zero {f : PowerSeries K}
    {r M : ℝ}
    (hr : 1 < r) (hM : ∀ k, ‖PowerSeries.coeff k f‖ * r ^ k ≤ M) (A : Finset K)
    (hA : ∀ a ∈ A, ‖a‖ ≤ 1) (S : ℕ)
    (hvan : ∀ a ∈ A, ∀ j < S, FormalMultilinearSeries.ofScalarsSum (E := K)
      (fun k => PowerSeries.coeff k ((⇑(PowerSeries.derivative (R := K)))^[j] f)) a = 0) (k : ℕ) :
    ‖PowerSeries.coeff k f‖ ≤ M * (r ^ (A.card * S))⁻¹ :=
  sorry

/-- **Layer 8.3**, the same bound for the values in the closed unit disc. -/
theorem PowerSeries.norm_ofScalarsSum_le_of_ofScalarsSum_iterate_derivative_eq_zero
    {f : PowerSeries K} {r M : ℝ} (hr : 1 < r) (hM : ∀ k, ‖PowerSeries.coeff k f‖ * r ^ k ≤ M)
    (A : Finset K) (hA : ∀ a ∈ A, ‖a‖ ≤ 1) (S : ℕ)
    (hvan : ∀ a ∈ A, ∀ j < S, FormalMultilinearSeries.ofScalarsSum (E := K)
      (fun k => PowerSeries.coeff k ((⇑(PowerSeries.derivative (R := K)))^[j] f)) a = 0)
    {x : K} (hx : ‖x‖ ≤ 1) :
    ‖FormalMultilinearSeries.ofScalarsSum (E := K) (fun k => PowerSeries.coeff k f) x‖ ≤
      M * (r ^ (A.card * S))⁻¹ :=
  sorry

end Ultrametric

/-- **Layer 8.5, Hermite interpolation with ultrametric bounds** (Baker, Chapter 2, Lemma 7). -/
theorem Polynomial.exists_iterate_derivative_eval_eq_ite_of_isUltrametricDist {K : Type*}
    [NormedField K] [IsUltrametricDist K] [CharZero K] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (σ : ι → K)
    (hσ : ∀ i, ‖σ i‖ ≤ 1) {ϱ : ℝ} (hϱ0 : 0 < ϱ) (hϱ1 : ϱ ≤ 1)
    (hsep : ∀ i j, i ≠ j → ϱ ≤ ‖σ i - σ j‖) (S : ℕ) (r : ι) {s : ℕ} (hs : s < S) :
    ∃ W : K[X], (∀ i, ∀ j < S, (derivative^[j] W).eval (σ i) = if i = r ∧ j = s then 1 else 0) ∧
      ∀ n, ‖W.coeff n‖ ≤ ‖((s.factorial : ℕ) : K)⁻¹‖ * (ϱ ^ (Fintype.card ι * S))⁻¹ :=
  sorry

/-- **Layer 8.4**, the linear map `(D + c) ^ m` on polynomials: the `m`-th derivative of
`P (z) exp (c z)` is `expDerivFactor c m P (z) exp (c z)`. -/
noncomputable def Polynomial.expDerivFactor {R : Type*} [CommRing R] (c : R) (m : ℕ) :
    R[X] →ₗ[R] R[X] :=
  (derivative + c • LinearMap.id) ^ m

/-- **Layer 8.4, the binomial form** `∑ j ≤ m, (m choose j) c ^ (m - j) P⁽ʲ⁾`. -/
theorem Polynomial.expDerivFactor_eq_sum {R : Type*} [CommRing R] (c : R) (m : ℕ) (P : R[X]) :
    Polynomial.expDerivFactor c m P =
      ∑ j ∈ Finset.range (m + 1), C ((m.choose j : R) * c ^ (m - j)) * derivative^[j] P :=
  sorry

/-- **Layer 8.4**, the degree does not grow. -/
theorem Polynomial.natDegree_expDerivFactor_le {R : Type*} [CommRing R] (c : R) (m : ℕ)
    (P : R[X]) : (Polynomial.expDerivFactor c m P).natDegree ≤ P.natDegree :=
  sorry

/-- **Layer 8.4, the coefficients in an ultrametric field** grow by a factor of at most
`max 1 ‖c‖` for each derivative. -/
theorem Polynomial.norm_coeff_expDerivFactor_le {K : Type*} [NormedField K] [IsUltrametricDist K]
    (c : K) {P : K[X]} {B : ℝ} (hP : ∀ i, ‖P.coeff i‖ ≤ B) (m i : ℕ) :
    ‖(Polynomial.expDerivFactor c m P).coeff i‖ ≤ max 1 ‖c‖ ^ m * B :=
  sorry

/-- **Layer 8.4, the derivatives of an exponential polynomial.** -/
theorem PowerSeries.iterate_derivative_coe_mul_rescale_exp {A : Type*} [CommRing A] [Algebra ℚ A]
    (Q : A[X]) (ψ : A) (m : ℕ) :
    (⇑(PowerSeries.derivative (R := A)))^[m]
        ((Q : PowerSeries A) * PowerSeries.rescale ψ (PowerSeries.exp A)) =
      (Polynomial.expDerivFactor ψ m Q : PowerSeries A) *
        PowerSeries.rescale ψ (PowerSeries.exp A) :=
  sorry

/-- **Layer 8.10, Baker's theorem over `ℂ_[p]`** (after Brumer): `1` and `ℚ`-linearly
independent `p`-adic logarithms of algebraic numbers are linearly independent over the algebraic
numbers. -/
theorem PadicBaker.eq_zero_of_add_sum_mul_eq_zero {ι : Type*} [Fintype ι] {ℓ : ι → ℂ_[p]}
    (hsmall : ∀ i, ‖ℓ i‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹))
    (halg : ∀ i, IsAlgebraic ℚ (NormedSpace.exp (ℓ i))) (hli : LinearIndependent ℚ ℓ)
    {β₀ : ℂ_[p]} {β : ι → ℂ_[p]} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hrel : β₀ + ∑ i, β i * ℓ i = 0) : β₀ = 0 ∧ ∀ i, β i = 0 :=
  sorry

/-- **Layer 8.10**: a linear form in `ℚ`-linearly independent `p`-adic logarithms of algebraic
numbers, with algebraic coefficients and some `β i ≠ 0`, is transcendental. -/
theorem PadicBaker.transcendental_add_sum_mul {ι : Type*} [Fintype ι] {ℓ : ι → ℂ_[p]}
    (hsmall : ∀ i, ‖ℓ i‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹))
    (halg : ∀ i, IsAlgebraic ℚ (NormedSpace.exp (ℓ i))) (hli : LinearIndependent ℚ ℓ)
    {β₀ : ℂ_[p]} {β : ι → ℂ_[p]} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hne : ∃ i, β i ≠ 0) : Transcendental ℚ (β₀ + ∑ i, β i * ℓ i) :=
  sorry

/-- A worked example: `exp p` is transcendental in `ℂ_[p]` for an odd prime `p` (8.10 with
`ℓ = p`). -/
theorem PadicBaker.transcendental_exp_prime (hp2 : p ≠ 2) :
    Transcendental ℚ (NormedSpace.exp (p : ℂ_[p])) :=
  sorry

end Layer8

/-! ## Worked examples -/

/-- `e` is transcendental, with the name and statement of Yuyang Zhao's Mathlib formalisation of
Lindemann–Weierstrass (6.3). -/
theorem transcendental_e : Transcendental ℤ (Complex.exp 1) := sorry

/-- `π` is transcendental, with the name and statement of Yuyang Zhao's Mathlib formalisation of
Lindemann–Weierstrass (6.3). -/
theorem transcendental_pi : Transcendental ℤ Real.pi := sorry

/-- `e ^ π = (-1) ^ (-i)` is transcendental (6.4). -/
theorem transcendental_exp_pi : Transcendental ℚ (Real.exp Real.pi) := sorry

/-- `2 ^ √2` is transcendental (6.4). -/
theorem transcendental_two_cpow_sqrt_two : Transcendental ℚ ((2 : ℂ) ^ (Real.sqrt 2 : ℂ)) := sorry

/-- `log 2` is transcendental (6.3). -/
theorem transcendental_log_two : Transcendental ℚ (Real.log 2) := sorry

/-- `log 2 / log 3` is transcendental (6.4). -/
theorem transcendental_log_two_div_log_three :
    Transcendental ℚ (Real.log 2 / Real.log 3) := sorry

/-- `π + log 2` is transcendental (7.3). -/
theorem transcendental_pi_add_log_two : Transcendental ℚ (Real.pi + Real.log 2) := sorry

end TauCetiRoadmap.LinearFormsInLogarithms
