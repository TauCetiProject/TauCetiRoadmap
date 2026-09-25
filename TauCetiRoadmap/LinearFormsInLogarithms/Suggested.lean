import Mathlib

/-!
# Linear forms in logarithms, over `ℂ` and `ℂ_p`: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the layers, the conventions, the worked examples and the references) is
in `README.md`. Mathlib has power series in the sense of `FormalMultilinearSeries`, the one-variable
Cauchy and Schwarz estimates, the house of an algebraic number and Siegel's lemma; it has no
multi-index Taylor coefficients, no estimates on polydiscs, and no transcendence theorem for the
exponential function. We build those here in `TauCeti/`.

`FormalMultilinearSeries.mvCoeff` is the multi-index coefficient of a formal series on `ι → 𝕜`,
named so as not to collide with Mathlib's one-variable `FormalMultilinearSeries.coeff`, and
`mvTaylorCoeff` is the Taylor coefficient of a function at a point, `0` where the function is not
analytic. Series in one variable over an ultrametric field (Layer 8) are Mathlib's `PowerSeries`,
evaluated with `FormalMultilinearSeries.ofScalarsSum`. The declarations in the namespaces
`SchneiderLangProof` and `BrumerProof` are one decomposition of the proofs of 5.7 and 8.10 and are
internal to them; every other declaration is a target in its own right. Every target name that
`README.md` uses is declared here. Many signatures follow the author's formalization cited in the
Provenance section of `README.md`. The targets elaborate against the pinned Mathlib and are
stated with `sorry` (allowed in this human-owned roadmap library); the checks marked as proved
below are proved.
-/

open scoped NNReal

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

/-- **Layer 0.3**, the multi-index coefficient is additive in the series. -/
theorem FormalMultilinearSeries.mvCoeff_add (p q : FormalMultilinearSeries 𝕜 (ι → 𝕜) F)
    (α : ι → ℕ) :
    FormalMultilinearSeries.mvCoeff (p + q) α =
      FormalMultilinearSeries.mvCoeff p α + FormalMultilinearSeries.mvCoeff q α :=
  sorry

/-- **Layer 0.3**, the multi-index coefficient commutes with scalars. -/
theorem FormalMultilinearSeries.mvCoeff_smul (c : 𝕜) (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F)
    (α : ι → ℕ) :
    FormalMultilinearSeries.mvCoeff (c • p) α = c • FormalMultilinearSeries.mvCoeff p α :=
  sorry

/-- **Layer 0.3, an analytic function is the sum of its multi-index series** where the
homogeneous terms, weighted by `(card ι) ^ k`, converge normally. -/
theorem HasFPowerSeriesOnBall.hasSum_mvCoeff [CompleteSpace F] {f : (ι → 𝕜) → F}
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

/-- **Layer 0.4**, the value off the domain of analyticity is `0` (proved). -/
theorem mvTaylorCoeff_of_not_analyticAt {f : (ι → 𝕜) → F} {x : ι → 𝕜} (h : ¬ AnalyticAt 𝕜 f x)
    (α : ι → ℕ) : mvTaylorCoeff f x α = 0 := by
  simp [mvTaylorCoeff, h]

/-- **Layer 0.4, the coefficient of order `0`** is the value. -/
theorem AnalyticAt.mvTaylorCoeff_zero {f : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) :
    mvTaylorCoeff f x 0 = f x :=
  sorry

/-- **Layer 0.4, additivity.** -/
theorem AnalyticAt.mvTaylorCoeff_add {f g : (ι → 𝕜) → F} {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x)
    (hg : AnalyticAt 𝕜 g x) (α : ι → ℕ) :
    mvTaylorCoeff (f + g) x α = mvTaylorCoeff f x α + mvTaylorCoeff g x α :=
  sorry

/-- **Layer 0.4, translation.** -/
theorem mvTaylorCoeff_comp_add_right (f : (ι → 𝕜) → F) (x y : ι → 𝕜) (α : ι → ℕ) :
    mvTaylorCoeff f (x + y) α = mvTaylorCoeff (fun z => f (z + y)) x α :=
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
theorem AnalyticAt.exists_hasSum_mvTaylorCoeff [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜}
    (hf : AnalyticAt 𝕜 f x) :
    ∃ ρ : ℝ≥0, 0 < ρ ∧
      Summable (fun α : ι → ℕ => ‖mvTaylorCoeff f x α‖ * (ρ : ℝ) ^ (∑ i, α i)) ∧
      ∀ y : ι → 𝕜, ‖y‖ < ρ →
        HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • mvTaylorCoeff f x α) (f (x + y)) :=
  sorry

/-- **Layer 0.4, coefficients from an expansion.** -/
theorem mvTaylorCoeff_eq_of_hasSum [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜}
    {c : (ι → ℕ) → F} {ρ : ℝ≥0} (hρ : 0 < ρ)
    (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (ρ : ℝ) ^ (∑ i, α i))
    (h : ∀ y : ι → 𝕜, ‖y‖ < ρ →
      HasSum (fun α : ι → ℕ => (∏ i, y i ^ α i) • c α) (f (x + y)))
    (α : ι → ℕ) : mvTaylorCoeff f x α = c α :=
  sorry

/-- **Layer 0.4, a linear change of variables preserves vanishing in each total degree.** -/
theorem mvTaylorCoeff_comp_eq_zero {κ : Type*} [Fintype κ] {G : (ι → 𝕜) → F}
    (A : (κ → 𝕜) →L[𝕜] (ι → 𝕜)) {x : κ → 𝕜} (hG : AnalyticAt 𝕜 G (A x)) {k : ℕ}
    (h : ∀ α : ι → ℕ, ∑ i, α i = k → mvTaylorCoeff G (A x) α = 0) :
    ∀ β : κ → ℕ, ∑ j, β j = k → mvTaylorCoeff (G ∘ A) x β = 0 :=
  sorry

/-- **Layer 0.4**, a monomial has coefficient `1` at its own multi-index and `0` at every
other. -/
theorem mvTaylorCoeff_prod_pow [DecidableEq ι] (τ σ : ι → ℕ) :
    mvTaylorCoeff (fun z : ι → 𝕜 => ∏ i, z i ^ τ i) 0 σ = if σ = τ then 1 else 0 :=
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

variable {ι : Type*} [Fintype ι]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]

/-- **Layer 1.3, a zero of order `T` is `o (‖w‖ ^ (T - 1))`**, the hypothesis of Mathlib's
`Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`. -/
theorem isLittleO_pow_sub_one_of_le_analyticOrderAt {g : ℂ → V} {T : ℕ} (hT : 1 ≤ T)
    (h : (T : ℕ∞) ≤ analyticOrderAt g 0) :
    Asymptotics.IsLittleO (nhds 0) (fun w => g w - g 0) (fun w => ‖w - 0‖ ^ (T - 1)) :=
  sorry

/-- **Layer 1.3, Schwarz's lemma for a zero of order `T`**, from Mathlib's
`Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`. -/
theorem norm_le_mul_div_pow_of_le_analyticOrderAt {g : ℂ → V} {ρ M : ℝ}
    (hd : DifferentiableOn ℂ g (Metric.ball 0 ρ)) (hM : ∀ w ∈ Metric.ball (0 : ℂ) ρ, ‖g w‖ ≤ M)
    {T : ℕ} (hT : (T : ℕ∞) ≤ analyticOrderAt g 0) {w : ℂ} (hw : w ∈ Metric.ball (0 : ℂ) ρ) :
    ‖g w‖ ≤ M * (‖w‖ / ρ) ^ T :=
  sorry

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
theorem ThueSiegel.exists_int_vec_abs_le_of_pow_lt {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u : ι → κ → ℝ) {U : ℝ} (hU : ∀ j, ∑ i, |u i j| ≤ U) {X ℓ : ℕ} (hX : 0 < X) (hℓ : 0 < ℓ)
    (hcard : ℓ ^ Fintype.card κ < (X + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧ ∀ j, |∑ i, u i j * ξ i| ≤ U * X / ℓ :=
  sorry

/-- **Layer 3.4, Thue–Siegel's lemma for complex linear forms** (Waldschmidt, Lemma 4.12). -/
theorem ThueSiegel.exists_int_vec_norm_le_of_pow_le {ι κ : Type*} [Fintype ι] [Nonempty ι]
    [Fintype κ] (u : ι → κ → ℂ) {U V : ℝ} (hU : ∀ j, ∑ i, ‖u i j‖ ≤ Real.exp U) {X : ℕ}
    (hX : 0 < X)
    (hcard : (Real.sqrt 2 * X * Real.exp (U + V) + 1) ^ (2 * Fintype.card κ) ≤
      ((X : ℝ) + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧
      ∀ j, ‖∑ i, u i j * (ξ i : ℂ)‖ ≤ Real.exp (-V) :=
  sorry

/-- **Layer 3.5, Siegel's lemma over `K` with a constant depending only on `K`**, from Mathlib's
`NumberField.house.exists_ne_zero_int_vec_house_le`: when there are at least twice as many
unknowns as equations, the exponent in Mathlib's bound is at most `1`. -/
theorem NumberField.exists_siegel_const (K : Type*) [Field K] [NumberField K] :
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

namespace SchneiderLangProof

open _root_.NumberField

variable {n d₀ d₁ : ℕ}

/-- The exponent vector `τ` placed in the first `d₀` coordinates of `Fin n`, and `0` in the
others. -/
def extendExponent (τ : Fin d₀ → ℕ) : Fin n → ℕ :=
  fun v => if h : (v : ℕ) < d₀ then τ ⟨v, h⟩ else 0

/-- **Layer 5.1, the auxiliary function** `F_p (z) = ∑ p (τ, t) z ^ τ exp ((∑ᵢ tᵢ xᵢ) · z)`,
with `τ` supported on the first `d₀` coordinates and `τ, t` bounded by `T`. -/
noncomputable def auxiliaryFunction (x : Fin d₁ → Fin n → ℂ) (T : ℕ)
    (p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ) : (Fin n → ℂ) → ℂ :=
  fun z => ∑ l, p l * ((∏ v, z v ^ extendExponent (fun h => (l.1 h : ℕ)) v) *
    Complex.exp (∑ v, (∑ i, ((l.2 i : ℕ) : ℂ) * x i v) * z v))

/-- The bound `(T + 1) ^ (d₀ + d₁) e ^ N (1 + ρ) ^ (d₀ T) e ^ (T A ρ)` for `auxiliaryFunction`
on the polydisc of radius `ρ`, when `|p| ≤ e ^ N` and `A = ∑ᵢ ∑ᵥ ‖xᵢ v‖`. -/
noncomputable def growthBound (d₀ d₁ T : ℕ) (N A ρ : ℝ) : ℝ :=
  ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * (Real.exp N * (1 + ρ) ^ (d₀ * T) * Real.exp (T * A * ρ))

/-- The exponent of the denominator in 5.2, for Taylor coefficients of total order `M`. -/
def denominatorExponent (d₀ d₁ n T S₁ M : ℕ) : ℕ := d₀ * T + M + d₁ * n * T * S₁

/-- The bound for the house in 5.2, for Taylor coefficients of total order `M`. -/
noncomputable def houseBound (d₀ d₁ n T S₁ δ M : ℕ) (N G : ℝ) : ℝ :=
  ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * ((δ : ℝ) ^ denominatorExponent d₀ d₁ n T S₁ M *
    Real.exp N * ((δ : ℝ) ^ 2 * M + n * S₁ * G + 1) ^ (d₀ * T) * (d₁ * T * G + 1) ^ M *
    G ^ (d₁ * n * T * S₁))

/-- The Liouville factor of 5.3: `M ^ M δ ^ a H ^ (D - 1)` with `a = denominatorExponent` and
`H = houseBound`. -/
noncomputable def liouvilleFactor (d₀ d₁ n T S₁ δ D : ℕ) (N G : ℝ) (M : ℕ) : ℝ :=
  (M : ℝ) ^ M * (δ : ℝ) ^ denominatorExponent d₀ d₁ n T S₁ M *
    houseBound d₀ d₁ n T S₁ δ M N G ^ (D - 1)

/-- **Layer 5.5, the admissible parameters**: the conditions (1)–(4) of 5.5 on `T, S₁, S₀, U, N,
r, R, E`, for data of degree `D`, denominator `δ`, house bound `G`, `A = ∑ᵢ ∑ᵥ ‖xᵢ v‖`,
`Ay = ∑ⱼ ∑ᵥ ‖yⱼ v‖` and `B = ‖Yl⁻¹‖`. -/
structure Admissible (n d₀ d₁ D δ : ℕ) (G A Ay B : ℝ) (T S₁ S₀ : ℕ) (U N r : ℝ) (R : ℝ≥0)
    (E : ℕ → ℝ) : Prop where
  one_le_S₁ : 1 ≤ S₁
  N_pos : 0 < N
  le_r : S₁ * Ay + 2 ≤ r
  le_W : 12 * (n : ℝ) ^ 2 ≤ N + U + U
  exp_one_le : Real.exp 1 ≤ R / r
  le_exp : R / r ≤ Real.exp ((N + U + U) / 6)
  count : (2 * (N + U + U)) ^ (n + 1) ≤
    ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * N * Real.log (R / r) ^ n
  growth : ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * ((1 + (R : ℝ)) ^ (d₀ * T) *
    Real.exp (T * A * R)) ≤ Real.exp U
  vanishing : ∀ M : ℕ, M ≤ n * S₀ → liouvilleFactor d₀ d₁ n T S₁ δ D N G M * Real.exp (-U) < 1
  one_le_E : ∀ M, 1 ≤ E M
  extrapolation : ∀ M : ℕ, S₀ ≤ M → liouvilleFactor d₀ d₁ n T S₁ δ D N G M *
    (n * (1 / E M) ^ (M / n * S₁) * growthBound d₀ d₁ T N A
      (Ay * (5 * 3 ^ n * E M * (S₁ + 2 * B)))) < 1

/-- **Layer 5.1, the auxiliary function is entire.** -/
theorem analyticOnNhd_auxiliaryFunction (x : Fin d₁ → Fin n → ℂ) (T : ℕ)
    (p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ) :
    AnalyticOnNhd ℂ (auxiliaryFunction x T p) Set.univ :=
  sorry

/-- **Layer 5.1, the growth of the auxiliary function.** -/
theorem norm_auxiliaryFunction_le (x : Fin d₁ → Fin n → ℂ) (T : ℕ)
    {p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ} {N : ℝ}
    (hp : ∀ l, ‖p l‖ ≤ Real.exp N) (z : Fin n → ℂ) :
    ‖auxiliaryFunction x T p z‖ ≤ growthBound d₀ d₁ T N (∑ i, ∑ v, ‖x i v‖) ‖z‖ :=
  sorry

/-- **Layer 5.2, the Taylor coefficients at `s · y` are algebraic, of explicit size.** The
generators `X`, `Yg`, `Eg` of the number field `K` map to the coordinates of the `xᵢ`, the first
`d₀` coordinates of the `yⱼ`, and the `exp (xᵢ · yⱼ)`, and `δ` times each of them is an algebraic
integer of house at most `G`. -/
theorem exists_eq_mvTaylorCoeff_auxiliaryFunction {K : Type*} [Field K] [NumberField K]
    (ι₀ : K →+* ℂ) {x : Fin d₁ → Fin n → ℂ} {y : Fin n → Fin n → ℂ}
    {X : Fin d₁ → Fin n → K} {Yg : Fin n → Fin d₀ → K} {Eg : Fin d₁ → Fin n → K}
    (hX : ∀ i v, ι₀ (X i v) = x i v)
    (hY : ∀ j (v : Fin n) (h : (v : ℕ) < d₀), ι₀ (Yg j ⟨v, h⟩) = y j v)
    (hEg : ∀ i j, ι₀ (Eg i j) = Complex.exp (∑ v, x i v * y j v))
    {δ : ℕ} {G : ℝ} (hδ : 1 ≤ δ) (hG : 1 ≤ G)
    (hXs : ∀ i v, IsIntegral ℤ ((δ : K) * X i v) ∧ house ((δ : K) * X i v) ≤ G)
    (hYs : ∀ j h, IsIntegral ℤ ((δ : K) * Yg j h) ∧ house ((δ : K) * Yg j h) ≤ G)
    (hEs : ∀ i j, IsIntegral ℤ ((δ : K) * Eg i j) ∧ house ((δ : K) * Eg i j) ≤ G)
    (T S₁ : ℕ) (p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℤ) {N : ℝ}
    (hp : ∀ l, |(p l : ℝ)| ≤ Real.exp N) (s : Fin n → ℕ) (hs : ∀ j, s j ≤ S₁)
    (σ : Fin n → ℕ) :
    ∃ θ : K, ι₀ θ = (∏ v, ((σ v).factorial : ℂ)) *
        mvTaylorCoeff (auxiliaryFunction x T fun l => (p l : ℂ))
          (fun v => ∑ j, (s j : ℂ) * y j v) σ ∧
      IsIntegral ℤ ((δ : K) ^ denominatorExponent d₀ d₁ n T S₁ (∑ v, σ v) * θ) ∧
      house ((δ : K) ^ denominatorExponent d₀ d₁ n T S₁ (∑ v, σ v) * θ) ≤
        houseBound d₀ d₁ n T S₁ δ (∑ v, σ v) N G :=
  sorry

/-- **Layer 5.3, Liouville's inequality for the Taylor coefficients at `s · y`.** -/
theorem one_le_liouvilleFactor_mul_norm {K : Type*} [Field K] [NumberField K] (ι₀ : K →+* ℂ)
    {x : Fin d₁ → Fin n → ℂ} {y : Fin n → Fin n → ℂ}
    {X : Fin d₁ → Fin n → K} {Yg : Fin n → Fin d₀ → K} {Eg : Fin d₁ → Fin n → K}
    (hX : ∀ i v, ι₀ (X i v) = x i v)
    (hY : ∀ j (v : Fin n) (h : (v : ℕ) < d₀), ι₀ (Yg j ⟨v, h⟩) = y j v)
    (hEg : ∀ i j, ι₀ (Eg i j) = Complex.exp (∑ v, x i v * y j v))
    {δ : ℕ} {G : ℝ} (hδ : 1 ≤ δ) (hG : 1 ≤ G)
    (hXs : ∀ i v, IsIntegral ℤ ((δ : K) * X i v) ∧ house ((δ : K) * X i v) ≤ G)
    (hYs : ∀ j h, IsIntegral ℤ ((δ : K) * Yg j h) ∧ house ((δ : K) * Yg j h) ≤ G)
    (hEs : ∀ i j, IsIntegral ℤ ((δ : K) * Eg i j) ∧ house ((δ : K) * Eg i j) ≤ G)
    (T S₁ : ℕ) (p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℤ) {N : ℝ}
    (hp : ∀ l, |(p l : ℝ)| ≤ Real.exp N) (s : Fin n → ℕ) (hs : ∀ j, s j ≤ S₁)
    (σ : Fin n → ℕ)
    (hne : mvTaylorCoeff (auxiliaryFunction x T fun l => (p l : ℂ))
      (fun v => ∑ j, (s j : ℂ) * y j v) σ ≠ 0) :
    1 ≤ liouvilleFactor d₀ d₁ n T S₁ δ (Module.finrank ℚ K) N G (∑ v, σ v) *
      ‖mvTaylorCoeff (auxiliaryFunction x T fun l => (p l : ℂ))
        (fun v => ∑ j, (s j : ℂ) * y j v) σ‖ :=
  sorry

/-- **Layer 5.4, the auxiliary function of a nonzero coefficient vector is not zero.** -/
theorem exists_mvTaylorCoeff_auxiliaryFunction_ne_zero (hd₀ : d₀ ≤ n) {x : Fin d₁ → Fin n → ℂ}
    (hxli : LinearIndependent ℚ x) (T : ℕ)
    {p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ} (hp : p ≠ 0) :
    ∃ σ, mvTaylorCoeff (auxiliaryFunction x T p) 0 σ ≠ 0 :=
  sorry

/-- **Layer 5.5, the argument**: algebraic data and admissible parameters are incompatible. -/
theorem false_of_admissible (hn1 : 1 ≤ n) (hd₀ : d₀ ≤ n)
    {x : Fin d₁ → Fin n → ℂ} (hxli : LinearIndependent ℚ x) {y : Fin n → Fin n → ℂ}
    (Yl : (Fin n → ℂ) ≃L[ℂ] (Fin n → ℂ)) (hYl : ∀ z, Yl z = fun v => ∑ j, z j * y j v)
    {K : Type*} [Field K] [NumberField K] (ι₀ : K →+* ℂ)
    {X : Fin d₁ → Fin n → K} {Yg : Fin n → Fin d₀ → K} {Eg : Fin d₁ → Fin n → K}
    (hX : ∀ i v, ι₀ (X i v) = x i v)
    (hY : ∀ j (v : Fin n) (h : (v : ℕ) < d₀), ι₀ (Yg j ⟨v, h⟩) = y j v)
    (hEg : ∀ i j, ι₀ (Eg i j) = Complex.exp (∑ v, x i v * y j v))
    {δ : ℕ} {G : ℝ} (hδ : 1 ≤ δ) (hG : 1 ≤ G)
    (hXs : ∀ i v, IsIntegral ℤ ((δ : K) * X i v) ∧ house ((δ : K) * X i v) ≤ G)
    (hYs : ∀ j h, IsIntegral ℤ ((δ : K) * Yg j h) ∧ house ((δ : K) * Yg j h) ≤ G)
    (hEs : ∀ i j, IsIntegral ℤ ((δ : K) * Eg i j) ∧ house ((δ : K) * Eg i j) ≤ G)
    {T S₁ S₀ : ℕ} {U N r : ℝ} {R : ℝ≥0} {E : ℕ → ℝ}
    (hadm : Admissible n d₀ d₁ (Module.finrank ℚ K) δ G (∑ i, ∑ v, ‖x i v‖)
      (∑ j, ∑ v, ‖y j v‖) ‖(Yl.symm : (Fin n → ℂ) →L[ℂ] (Fin n → ℂ))‖ T S₁ S₀ U N r R E) :
    False :=
  sorry

/-- **Layer 5.6, admissible parameters exist** for fixed data. -/
theorem exists_admissible (hn1 : 1 ≤ n) (hd : n < d₀ + d₁) {D δ : ℕ} (hD : 1 ≤ D)
    (hδ : 1 ≤ δ) {G A Ay B : ℝ} (hG : 1 ≤ G) (hA : 0 ≤ A) (hAy : 0 ≤ Ay) (hB : 0 ≤ B) :
    ∃ (T S₁ S₀ : ℕ) (U N r : ℝ) (R : ℝ≥0) (E : ℕ → ℝ),
      Admissible n d₀ d₁ D δ G A Ay B T S₁ S₀ U N r R E :=
  sorry

end SchneiderLangProof

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
and statement of Mathlib PR #28013. -/
theorem transcendental_exp {a : ℂ} (a0 : a ≠ 0) (ha : IsAlgebraic ℤ a) :
    Transcendental ℤ (Complex.exp a) :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann** for the principal logarithm of an algebraic number, with
the name and statement of Mathlib PR #28013. -/
theorem transcendental_log {u : ℂ} (hu0 : Complex.log u ≠ 0) (hu : IsAlgebraic ℤ u) :
    Transcendental ℤ (Complex.log u) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, branch-free: `exp (b x)` is transcendental for a nonzero
logarithm `x` of an algebraic number and an algebraic irrational `b`. -/
theorem transcendental_exp_mul {x b : ℂ} (hx : x ≠ 0) (h : IsAlgebraic ℚ (Complex.exp x))
    (hb : IsAlgebraic ℚ b) (hb' : ∀ q : ℚ, b ≠ q) : Transcendental ℚ (Complex.exp (b * x)) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, in Mathlib's principal branch, with the name and statement
of Mathlib PR #42911. -/
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
theorem Baker.eq_zero_of_isAlgebraic_sum_mul (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    {d : ℕ} (hd : Module.finrank ℚ K = d) (β : Fin d → K) (hβ : LinearIndependent ℚ β)
    (l : Fin d → ℂ) (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
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

/-- **Layer 7.3** (Baker, Theorem 2.4), in Mathlib's principal branch: `∏ αᵢ ^ βᵢ` is
transcendental when `1, β₁, …, βₙ` are `ℚ`-linearly independent. -/
theorem Baker.transcendental_prod_cpow {ι : Type*} [Fintype ι] [Nonempty ι] {α β : ι → ℂ}
    (hα : ∀ i, IsAlgebraic ℚ (α i)) (hα0 : ∀ i, α i ≠ 0) (hα1 : ∀ i, α i ≠ 1)
    (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (∏ i, α i ^ β i) :=
  sorry

end Layer7

/-! ## Layer 8: Baker's theorem over `ℂ_[p]` (Brumer) -/

namespace BrumerProof

/-- The bound for the entries of Baker's linear system in 8.7, after clearing denominators. -/
noncomputable def entryBound (k L h : ℕ) (G : ℝ) : ℝ :=
  G ^ ((k + 1) * h ^ 2 + (k + 1) * L * h) *
    ((L + 1) * (h : ℝ) ^ L * (2 * L * G) ^ ((k + 1) * h ^ 2) * G ^ ((k + 1) * L * h))

/-- **Layer 8.8, the admissible parameters** for `k + 1` logarithms, degree `D` and prime `p`:
the count of unknowns and equations, the shrinking orders `S J` and growing ranges `R J`, the
extrapolation inequality and the final inequality. -/
structure Admissible (k D p : ℕ) (r₀ B G C lmin : ℝ) (L h Kmax : ℕ) (S R : ℕ → ℕ) : Prop where
  one_le_L : 1 ≤ L
  one_le_h : 1 ≤ h
  count : 2 * ((h ^ 2 + 1) ^ (k + 1) * h) ≤ (L + 1) ^ (k + 2)
  S_zero : S 0 ≤ h ^ 2
  R_zero : R 0 ≤ h
  S_step : ∀ J < Kmax, 2 * S (J + 1) ≤ S J
  extrapolation : ∀ J < Kmax, B ^ S (J + 1) * r₀ ^ L *
      ((L + 1) ^ (k + 2) * (C * ((L + 1) ^ (k + 2) * entryBound k L h G) *
        ((L + 1) * (R (J + 1) : ℝ) ^ L * (2 * L * G) ^ S (J + 1) *
          G ^ ((k + 1) * L * R (J + 1))))) ^ D <
    lmin ^ S (J + 1) * r₀ ^ (R J * S (J + 1))
  final : (C * ((L + 1) ^ (k + 2) * entryBound k L h G)) ^ D * (p : ℝ) ^ L *
      ((2 * G ^ ((k + 1) * L)) ^ D) ^ ((L + 1) ^ (k + 1) * (L + 1)) * r₀ ^ L <
    r₀ ^ (R Kmax * S Kmax)

/-- **Layer 8.9, admissible parameters exist**: powers of `X = 2 ^ t` for large `t`. -/
theorem exists_admissible (k D p : ℕ) {r₀ B G C lmin : ℝ} (hr₀ : 1 < r₀) (hB : 0 ≤ B)
    (hG : 0 ≤ G) (hC : 0 ≤ C) (hlmin0 : 0 < lmin) :
    ∃ (L h Kmax : ℕ) (S R : ℕ → ℕ), Admissible k D p r₀ B G C lmin L h Kmax S R :=
  sorry

end BrumerProof

section Layer8

open _root_.Polynomial _root_.NumberField

variable {p : ℕ} [hp : Fact p.Prime]

section General

variable {L : Type*} [NontriviallyNormedField L] [NormedAlgebra ℚ_[p] L] [CompleteSpace L]

/-- **Layer 8.1, the norm of `n!`** in a normed field over `ℚ_[p]`. -/
theorem PadicExp.norm_natCast_factorial (n : ℕ) :
    ‖((n.factorial : ℕ) : L)‖ = (p : ℝ) ^ (-(padicValNat p n.factorial : ℤ)) :=
  sorry

/-- **Layer 8.1, the radius of the exponential series** is at least `p ^ (-1 / (p - 1))`. -/
theorem PadicExp.le_radius_expSeries :
    ENNReal.ofReal ((p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) ≤ (NormedSpace.expSeries L L).radius :=
  sorry

/-- **Layer 8.1, the functional equation** on the disc of convergence, from Mathlib's
`NormedSpace.exp_add_of_mem_ball`. -/
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

/-- **Layer 8.2**: a nonzero integer `n` has norm at least `1 / |n|`. -/
theorem PadicExp.one_le_abs_mul_norm_intCast {n : ℤ} (hn : n ≠ 0) :
    1 ≤ |(n : ℝ)| * ‖(n : L)‖ :=
  sorry

/-- **Layer 8.4, the value of an exponential polynomial** inside the disc of convergence. -/
theorem Polynomial.hasSum_coeff_mul_rescale_exp [CharZero L] (Q : L[X]) {ψ x : L}
    (h : ‖ψ * x‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) :
    HasSum (fun k => PowerSeries.coeff k ((Q : PowerSeries L) *
        PowerSeries.rescale ψ (PowerSeries.exp L)) * x ^ k)
      (Q.eval x * NormedSpace.exp (ψ * x)) :=
  sorry

end General

/-- **Layer 8.2, integral elements have norm at most `1`** in an ultrametric normed field. -/
theorem IsUltrametricDist.norm_le_one_of_isIntegral {L : Type*} [NormedField L]
    [IsUltrametricDist L] {x : L} (hx : IsIntegral ℤ x) : ‖x‖ ≤ 1 :=
  sorry

/-- **Layer 8.2, Liouville's inequality at an ultrametric place**, for a number of known size. -/
theorem NumberField.one_le_pow_mul_norm_embedding_of_isUltrametricDist {L : Type*}
    [NormedField L] [IsUltrametricDist L] [IsAlgClosed L] {K : Type*} [Field K] [NumberField K]
    (hL : ∀ n : ℤ, n ≠ 0 → 1 ≤ |(n : ℝ)| * ‖(n : L)‖) {δ a : ℕ} {x : K} {H : ℝ}
    (hint : IsIntegral ℤ ((δ : K) ^ a * x)) (hH : house ((δ : K) ^ a * x) ≤ H)
    (hδ : δ ≠ 0) (hx0 : x ≠ 0) (σ : K →+* L) : 1 ≤ H ^ Module.finrank ℚ K * ‖σ x‖ :=
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
`‖coeff k f‖ r ^ k ≤ M` with `r > 1` and `f` vanishes to order `S` (its formal derivatives of
order `< S` vanish) at each point of a finite set `A` in the closed unit disc, then every
coefficient is at most `M r ^ (-(card A · S))`. -/
theorem PowerSeries.norm_coeff_le_of_iterate_derivative_eq_zero {f : PowerSeries K} {r M : ℝ}
    (hr : 1 < r) (hM : ∀ k, ‖PowerSeries.coeff k f‖ * r ^ k ≤ M) (A : Finset K)
    (hA : ∀ a ∈ A, ‖a‖ ≤ 1) (S : ℕ)
    (hvan : ∀ a ∈ A, ∀ j < S, FormalMultilinearSeries.ofScalarsSum (E := K)
      (fun k => PowerSeries.coeff k ((⇑(PowerSeries.derivative K))^[j] f)) a = 0) (k : ℕ) :
    ‖PowerSeries.coeff k f‖ ≤ M * (r ^ (A.card * S))⁻¹ :=
  sorry

/-- **Layer 8.3**, the same bound for the values in the closed unit disc. -/
theorem PowerSeries.norm_ofScalarsSum_le_of_iterate_derivative_eq_zero {f : PowerSeries K}
    {r M : ℝ} (hr : 1 < r) (hM : ∀ k, ‖PowerSeries.coeff k f‖ * r ^ k ≤ M) (A : Finset K)
    (hA : ∀ a ∈ A, ‖a‖ ≤ 1) (S : ℕ)
    (hvan : ∀ a ∈ A, ∀ j < S, FormalMultilinearSeries.ofScalarsSum (E := K)
      (fun k => PowerSeries.coeff k ((⇑(PowerSeries.derivative K))^[j] f)) a = 0)
    {x : K} (hx : ‖x‖ ≤ 1) :
    ‖FormalMultilinearSeries.ofScalarsSum (E := K) (fun k => PowerSeries.coeff k f) x‖ ≤
      M * (r ^ (A.card * S))⁻¹ :=
  sorry

/-- **Layer 8.5, Hermite interpolation with ultrametric bounds** (Baker, Chapter 2, Lemma 7). -/
theorem Polynomial.exists_hermite_of_isUltrametricDist {ι : Type*} [Fintype ι] [DecidableEq ι]
    (σ : ι → K) (hσ : ∀ i, ‖σ i‖ ≤ 1) {ϱ : ℝ} (hϱ0 : 0 < ϱ) (hϱ1 : ϱ ≤ 1)
    (hsep : ∀ i j, i ≠ j → ϱ ≤ ‖σ i - σ j‖) (S : ℕ) (r : ι) {s : ℕ} (hs : s < S) :
    ∃ W : K[X], (∀ i, ∀ j < S, (derivative^[j] W).eval (σ i) = if i = r ∧ j = s then 1 else 0) ∧
      ∀ n, ‖W.coeff n‖ ≤ ‖((s.factorial : ℕ) : K)⁻¹‖ * (ϱ ^ (Fintype.card ι * S))⁻¹ :=
  sorry

end Ultrametric

/-- **Layer 8.4**, the polynomial `(Q ↦ Q' + c Q)^[m] P`: the `m`-th derivative of
`P (z) exp (c z)` is `expDerivFactor c m P (z) exp (c z)`. -/
noncomputable def Polynomial.expDerivFactor {R : Type*} [CommRing R] (c : R) (m : ℕ)
    (P : R[X]) : R[X] :=
  (fun Q => derivative Q + C c * Q)^[m] P

/-- **Layer 8.4, the derivatives of an exponential polynomial.** -/
theorem PowerSeries.iterate_derivative_mul_rescale_exp {K : Type*} [Field K] [CharZero K]
    (Q : K[X]) (ψ : K) (m : ℕ) :
    (⇑(PowerSeries.derivative K))^[m]
        ((Q : PowerSeries K) * PowerSeries.rescale ψ (PowerSeries.exp K)) =
      (Polynomial.expDerivFactor ψ m Q : PowerSeries K) *
        PowerSeries.rescale ψ (PowerSeries.exp K) :=
  sorry

/-- A rejection test: off the disc the exponential series diverges and `NormedSpace.exp` takes
the value `0`, which is algebraic; so every target of Layer 8 assumes `‖ℓ‖ < p ^ (-1 / (p - 1))`
(with `ℓ = 1`, 8.10 without it would give `-1 + 1 · 1 = 0` with nonzero coefficients). -/
theorem PadicComplex.exp_one_eq_zero : NormedSpace.exp (1 : ℂ_[p]) = 0 :=
  sorry

namespace BrumerProof

variable {k : ℕ}

/-- **Layer 8.6**, the frequency `ψ_e = ∑_o e_o ℓ_o`. -/
noncomputable def frequency (ℓ : Option (Fin k) → ℂ_[p]) (e : Option (Fin k) → ℕ) : ℂ_[p] :=
  ∑ o, (e o : ℂ_[p]) * ℓ o

/-- **Layer 8.6**, the coefficient `γ_r = e_r + e_none β_r` of `ℓ_r` after eliminating
`ℓ none`. -/
noncomputable def gammaCoeff (β : Fin k → ℂ_[p]) (e : Option (Fin k) → ℕ) (r : Fin k) : ℂ_[p] :=
  (e (some r) : ℂ_[p]) + (e none : ℂ_[p]) * β r

/-- **Layer 8.6**, the frequency `e_none β₀` in the variable `z₀`. -/
noncomputable def zeroFrequency (β₀ : ℂ_[p]) (e : Option (Fin k) → ℕ) : ℂ_[p] :=
  (e none : ℂ_[p]) * β₀

/-- **Layer 8.6**, Baker's polynomial `(∏_r (γ_r ℓ_r) ^ {m_r}) • (D + c) ^ {m₀} X ^ d`. -/
noncomputable def derivativePoly (ℓ : Option (Fin k) → ℂ_[p]) (β₀ : ℂ_[p]) (β : Fin k → ℂ_[p])
    (m : Option (Fin k) → ℕ) (d : ℕ) (e : Option (Fin k) → ℕ) : ℂ_[p][X] :=
  (∏ r, (gammaCoeff β e r * ℓ (some r)) ^ m (some r)) •
    Polynomial.expDerivFactor (zeroFrequency β₀ e) (m none) (X ^ d)

/-- **Layer 8.6**, the derivative `f_m` of Baker's auxiliary function on the diagonal, as a power
series; the index `(d, e)` runs over `d ≤ L` and `e o ≤ L`. -/
noncomputable def derivativeSeries (ℓ : Option (Fin k) → ℂ_[p]) (β₀ : ℂ_[p]) (β : Fin k → ℂ_[p])
    (L : ℕ) (P : Fin (L + 1) × (Option (Fin k) → Fin (L + 1)) → ℂ_[p])
    (m : Option (Fin k) → ℕ) : PowerSeries ℂ_[p] :=
  ∑ x, P x • ((derivativePoly ℓ β₀ β m x.1 fun o => x.2 o : PowerSeries ℂ_[p]) *
    PowerSeries.rescale (frequency ℓ fun o => x.2 o) (PowerSeries.exp ℂ_[p]))

/-- **Layer 8.6, `D f_m = ∑_o f_{m + e_o}`**, under the relation to be refuted. -/
theorem derivative_derivativeSeries {ℓ : Option (Fin k) → ℂ_[p]} {β₀ : ℂ_[p]}
    {β : Fin k → ℂ_[p]} (hrel : ℓ none = β₀ + ∑ r, β r * ℓ (some r)) (L : ℕ)
    (P : Fin (L + 1) × (Option (Fin k) → Fin (L + 1)) → ℂ_[p]) (m : Option (Fin k) → ℕ) :
    PowerSeries.derivative ℂ_[p] (derivativeSeries ℓ β₀ β L P m) =
      ∑ o, derivativeSeries ℓ β₀ β L P (m + (Pi.single o 1 : Option (Fin k) → ℕ)) :=
  sorry

/-- **Layer 8.6, the value of `f_m` at a natural number.** -/
theorem ofScalarsSum_derivativeSeries_natCast {ℓ : Option (Fin k) → ℂ_[p]} {β₀ : ℂ_[p]}
    {β : Fin k → ℂ_[p]} (hsmall : ∀ o, ‖ℓ o‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) (L : ℕ)
    (P : Fin (L + 1) × (Option (Fin k) → Fin (L + 1)) → ℂ_[p]) (m : Option (Fin k) → ℕ)
    (l : ℕ) :
    FormalMultilinearSeries.ofScalarsSum (E := ℂ_[p])
        (fun n => PowerSeries.coeff n (derivativeSeries ℓ β₀ β L P m)) (l : ℂ_[p]) =
      (∏ r, ℓ (some r) ^ m (some r)) *
        ∑ x : Fin (L + 1) × (Option (Fin k) → Fin (L + 1)), P x *
          ((∏ r, gammaCoeff β (fun o => x.2 o) r ^ m (some r)) *
            (Polynomial.expDerivFactor (zeroFrequency β₀ fun o => x.2 o) (m none)
              (X ^ (x.1 : ℕ))).eval (l : ℂ_[p])) *
          ∏ o, NormedSpace.exp (ℓ o) ^ ((x.2 o : ℕ) * l) :=
  sorry

/-- **Layer 8.7, Baker's Lemma 6**: distinct frequencies are far apart. -/
theorem inv_pow_le_norm_frequency_sub {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ_[p])
    {ℓ : Option (Fin k) → ℂ_[p]} (hli : LinearIndependent ℚ ℓ)
    (hsmall : ∀ o, ‖ℓ o‖ < (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)) {αK : Option (Fin k) → K}
    (hα : ∀ o, ι (αK o) = NormedSpace.exp (ℓ o)) {δ : ℕ} {G : ℝ} (hδ : 1 ≤ δ)
    (hG : (δ : ℝ) ≤ G) (hαs : ∀ o, IsIntegral ℤ ((δ : K) * αK o) ∧ house ((δ : K) * αK o) ≤ G)
    {L : ℕ} {e e' : Option (Fin k) → ℕ} (he : ∀ o, e o ≤ L) (he' : ∀ o, e' o ≤ L)
    (hne : e ≠ e') :
    ((2 * G ^ ((k + 1) * L)) ^ Module.finrank ℚ K)⁻¹ ≤ ‖frequency ℓ e - frequency ℓ e'‖ :=
  sorry

/-- **Layer 8.8, the argument**: a relation `ℓ none = β₀ + ∑ β r ℓ (some r)` between
`ℚ`-linearly independent `p`-adic logarithms of algebraic numbers is incompatible with admissible
parameters. `hsiegel` is Siegel's lemma over `K` with its constant `C` (3.5). -/
theorem false_of_admissible {ℓ : Option (Fin k) → ℂ_[p]} {β₀ : ℂ_[p]} {β : Fin k → ℂ_[p]}
    (hrel : ℓ none = β₀ + ∑ r, β r * ℓ (some r)) (hli : LinearIndependent ℚ ℓ)
    {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ_[p])
    {αK : Option (Fin k) → K} {βK₀ : K} {βK : Fin k → K}
    (hα : ∀ o, ι (αK o) = NormedSpace.exp (ℓ o)) (hβ : ∀ r, ι (βK r) = β r) (hβ₀ : ι βK₀ = β₀)
    {δ : ℕ} {G : ℝ} (hδ : 1 ≤ δ) (hG : (δ : ℝ) ≤ G)
    (hαs : ∀ o, IsIntegral ℤ ((δ : K) * αK o) ∧ house ((δ : K) * αK o) ≤ G)
    (hβs : ∀ r, IsIntegral ℤ ((δ : K) * βK r) ∧ house ((δ : K) * βK r) ≤ G)
    (hβ₀s : IsIntegral ℤ ((δ : K) * βK₀) ∧ house ((δ : K) * βK₀) ≤ G) {C : ℝ} (hC : 1 ≤ C)
    (hsiegel : ∀ (α β : Type) [Fintype α] [Fintype β] (a : Matrix α β (𝓞 K)) (A : ℝ),
      1 ≤ A → 0 < Fintype.card α → 2 * Fintype.card α ≤ Fintype.card β →
      (∀ i j, house (a i j : K) ≤ A) →
      ∃ ξ : β → 𝓞 K, ξ ≠ 0 ∧ a.mulVec ξ = 0 ∧ ∀ l, house (ξ l : K) ≤ C * (Fintype.card β * A))
    {r₀ B lmin : ℝ} (hr₀ : 1 < r₀) (hℓr : ∀ o, ‖ℓ o‖ * r₀ ≤ (p : ℝ) ^ (-((p : ℝ) - 1)⁻¹))
    (hB : 1 ≤ B) (hβB : ∀ r, ‖β r‖ ≤ B) (hβ₀B : ‖β₀‖ ≤ B)
    (hlmin0 : 0 < lmin) (hlmin : ∀ o, lmin ≤ ‖ℓ o‖)
    {L h Kmax : ℕ} {S R : ℕ → ℕ}
    (hadm : Admissible k (Module.finrank ℚ K) p r₀ B G C lmin L h Kmax S R) :
    False :=
  sorry

end BrumerProof

/-- **Layer 8.10, Brumer's theorem**, the `p`-adic Baker theorem: `1` and `ℚ`-linearly
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

/-- `e` is transcendental, with the name and statement of Mathlib PR #28013 (6.3). -/
theorem transcendental_e : Transcendental ℤ (Complex.exp 1) := sorry

/-- `π` is transcendental, with the name and statement of Mathlib PR #28013 (6.3). -/
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

/-! ## Normalisation checks and rejection tests -/

namespace Examples

/-- The factor `α!` of 0.4: the Taylor coefficient of `z ^ 2` at `0` is `1`. -/
theorem mvTaylorCoeff_sq : mvTaylorCoeff (fun z : Fin 1 → ℂ => z 0 ^ 2) 0 (fun _ => 2) = 1 :=
  sorry

/-- The factor `α!` of 0.4: the second derivative of `z ^ 2` at `0` is `2`. -/
theorem iteratedFDeriv_sq :
    iteratedFDeriv ℂ 2 (fun z : Fin 1 → ℂ => z 0 ^ 2) 0 (fun _ => Pi.single 0 1) = 2 :=
  sorry

/-- Gelfond–Schneider (6.4) fails for a rational exponent (proved). -/
theorem four_cpow_half : (4 : ℂ) ^ ((1 : ℂ) / 2) = 2 := by
  have h : ((4 : ℝ) : ℂ) ^ (((1 / 2 : ℝ)) : ℂ) = (((4 : ℝ) ^ (1 / 2 : ℝ) : ℝ) : ℂ) :=
    (Complex.ofReal_cpow (by norm_num) _).symm
  have h2 : (4 : ℝ) ^ (1 / 2 : ℝ) = 2 := by
    rw [show (4 : ℝ) = 2 ^ (2 : ℝ) by norm_num, ← Real.rpow_mul (by norm_num)]
    norm_num
  push_cast at h
  rw [h, h2]
  norm_num

/-- Baker's theorem (7.2) fails without the `ℚ`-linear independence of the logarithms
(proved). -/
theorem two_mul_log_two_sub_log_four : 2 * Complex.log 2 - Complex.log 4 = 0 := by
  have h2 := Complex.ofReal_log (x := 2) (by norm_num)
  have h4 := Complex.ofReal_log (x := 4) (by norm_num)
  push_cast at h2 h4
  rw [← h2, ← h4, show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]
  push_cast
  ring

/-- A quotient of logarithms of algebraic numbers (6.4) can be rational (proved). -/
theorem log_four_div_log_two : Real.log 4 / Real.log 2 = 2 := by
  rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow,
    mul_div_assoc, div_self (Real.log_pos one_lt_two).ne']
  norm_num

end Examples

end TauCetiRoadmap.LinearFormsInLogarithms
