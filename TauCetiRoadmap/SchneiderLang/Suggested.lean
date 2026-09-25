import Mathlib

/-!
# The Schneider–Lang criterion and Baker's theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the layers, the conventions, the worked examples and the references) is
in `README.md`. Mathlib has power series in the sense of `FormalMultilinearSeries`, the one-variable
Cauchy and Schwarz estimates, the house of an algebraic number and Siegel's lemma; it has no
multi-index Taylor coefficients, no estimates on polydiscs, and no transcendence theorem for the
exponential function. We build those here in `TauCeti/`.

The definitions fix the conventions. `mvCoeff` is the multi-index coefficient of a formal series
on `ι → 𝕜`, named so as not to collide with Mathlib's one-variable `FormalMultilinearSeries.coeff`;
`mvTaylorCoeff` is the Taylor coefficient of a function at a point, `0` where the function is not
analytic. `auxFun` is the auxiliary function of Layer 5, and `denomExp`, `houseBound`,
`liouvilleFactor` and `growthBound` are the quantities in which its size and the parameter
conditions of Layer 5 are stated. Every declaration name that `README.md` uses is declared here.
The targets elaborate against the pinned Mathlib and are stated with `sorry` (allowed in this
human-owned roadmap library); the checks `mvTaylorCoeff_of_not_analyticAt`,
`two_mul_log_two_sub_log_four` and `log_four_div_log_two` are proved.
-/

open scoped NNReal

namespace TauCetiRoadmap.SchneiderLang

/-! ## Layer 0: multi-index power series -/

section Layer0

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜] {ι : Type*} [Fintype ι] [DecidableEq ι]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]

/-- **Layer 0.3, the multi-index coefficient** of a formal series on `ι → 𝕜`: the sum of
`p (∑ i, α i)` over the tuples of basis vectors in which each basis vector `Pi.single i 1`
occurs `α i` times. -/
noncomputable def mvCoeff (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F) (α : ι → ℕ) : F :=
  ∑ g ∈ Finset.univ.filter (fun g : Fin (∑ i, α i) → ι =>
      ∀ i, (Finset.univ.filter fun j => g j = i).card = α i),
    p (∑ i, α i) fun j => Pi.single (g j) (1 : 𝕜)

/-- **Layer 0.3, the degree-`k` term in multi-index form.** -/
theorem apply_eq_sum_mvCoeff (p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F) (k : ℕ) (z : ι → 𝕜) :
    p k (fun _ => z) = ∑ α ∈ Finset.univ.piAntidiag k, (∏ i, z i ^ α i) • mvCoeff p α :=
  sorry

/-- **Layer 0.3, an analytic function is the sum of its multi-index series** wherever the
homogeneous terms converge normally. -/
theorem hasSum_mvCoeff [CompleteSpace F] {f : (ι → 𝕜) → F}
    {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {r : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 r)
    {z : ι → 𝕜} (hz : ‖z‖ < r)
    (h : Summable fun k => (Fintype.card ι : ℝ) ^ k * ‖p k‖ * ‖z‖ ^ k) :
    HasSum (fun α : ι → ℕ => (∏ i, z i ^ α i) • mvCoeff p α) (f z) :=
  sorry

/-- **Layer 0.3, a normally convergent multi-index series has a power series** on the polydisc,
whose multi-index coefficients are the given ones. -/
theorem exists_hasFPowerSeriesOnBall_tsum [CompleteSpace F] (c : (ι → ℕ) → F) {r : ℝ≥0}
    (hr : 0 < r) (hsum : Summable fun α : ι → ℕ => ‖c α‖ * (r : ℝ) ^ (∑ i, α i)) :
    ∃ p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F,
      HasFPowerSeriesOnBall (fun z : ι → 𝕜 => ∑' α : ι → ℕ, (∏ i, z i ^ α i) • c α) p 0 r ∧
        ∀ α, mvCoeff p α = c α :=
  sorry

/-- **Layer 0.3, the identity theorem in coefficient form.** -/
theorem mvCoeff_eq_zero_of_eventuallyEq_zero {f : (ι → 𝕜) → F}
    {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F} {x : ι → 𝕜} (hf : HasFPowerSeriesAt f p x)
    (h0 : f =ᶠ[nhds x] 0) (α : ι → ℕ) : mvCoeff p α = 0 :=
  sorry

/-- **Layer 0.4, the Taylor coefficient** of `f` at `x`: the coefficient of `(z - x) ^ α` in the
expansion of `f` about `x`, and `0` where `f` is not analytic at `x`. -/
noncomputable def mvTaylorCoeff (f : (ι → 𝕜) → F) (x : ι → 𝕜) (α : ι → ℕ) : F :=
  open Classical in if h : AnalyticAt 𝕜 f x then mvCoeff h.choose α else 0

/-- **Layer 0.4, independence of the chosen series.** -/
theorem mvTaylorCoeff_eq {f : (ι → 𝕜) → F} {p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F}
    {x : ι → 𝕜} (hp : HasFPowerSeriesAt f p x) (α : ι → ℕ) : mvTaylorCoeff f x α = mvCoeff p α :=
  sorry

/-- **Layer 0.4, agreement with iterated derivatives**: `D^α f (x) = α! • mvTaylorCoeff f x α`,
for any tuple of basis vectors with counts `α`. -/
theorem prod_factorial_smul_mvTaylorCoeff [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜}
    (hf : AnalyticAt 𝕜 f x) (α : ι → ℕ) (v : Fin (∑ i, α i) → ι)
    (hv : ∀ i, (Finset.univ.filter fun j => v j = i).card = α i) :
    (∏ i, (α i).factorial) • mvTaylorCoeff f x α =
      iteratedFDeriv 𝕜 (∑ i, α i) f x (fun j => Pi.single (v j) 1) :=
  sorry

/-- **Layer 0.4, one variable**: for a singleton index type, `k! • mvTaylorCoeff` is the
`k`-th derivative. No factorial is inverted, so this holds in every characteristic. -/
theorem factorial_smul_mvTaylorCoeff_of_unique [Unique ι] [CompleteSpace F] {f : 𝕜 → F}
    {x : 𝕜} (hf : AnalyticAt 𝕜 f x) (α : ι → ℕ) :
    (α default).factorial • mvTaylorCoeff (fun z : ι → 𝕜 => f (z default)) (fun _ => x) α =
      iteratedDeriv (α default) f x :=
  sorry

/-- **Layer 0.4, the product rule** for a scalar function times a vector-valued one. -/
theorem mvTaylorCoeff_smul [CompleteSpace F] {f : (ι → 𝕜) → 𝕜} {g : (ι → 𝕜) → F} {x : ι → 𝕜}
    (hf : AnalyticAt 𝕜 f x) (hg : AnalyticAt 𝕜 g x) (α : ι → ℕ) :
    mvTaylorCoeff (fun z => f z • g z) x α =
      ∑ β ∈ Finset.Iic α, mvTaylorCoeff f x β • mvTaylorCoeff g x (α - β) :=
  sorry

/-- **Layer 0.4, the local expansion** of an analytic function, normally convergent on a
polydisc. -/
theorem exists_hasSum_mvTaylorCoeff [CompleteSpace F] {f : (ι → 𝕜) → F} {x : ι → 𝕜}
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
theorem mvTaylorCoeff_comp_eq_zero {κ : Type*} [Fintype κ] [DecidableEq κ] {G : (ι → 𝕜) → F}
    (A : (κ → 𝕜) →L[𝕜] (ι → 𝕜)) {x : κ → 𝕜} (hG : AnalyticAt 𝕜 G (A x)) {k : ℕ}
    (h : ∀ α : ι → ℕ, ∑ i, α i = k → mvTaylorCoeff G (A x) α = 0) :
    ∀ β : κ → ℕ, ∑ j, β j = k → mvTaylorCoeff (G ∘ A) x β = 0 :=
  sorry

/-- **Layer 0.5, the divided difference in one coordinate is analytic**, across the hyperplane
`z i = ζ` as well as off it. -/
theorem analyticAt_dslope_update [CompleteSpace F] {f : (ι → 𝕜) → F} (i : ι) (ζ : 𝕜)
    {x : ι → 𝕜} (hf : AnalyticAt 𝕜 f x) (hres : AnalyticAt 𝕜 f (Function.update x i ζ)) :
    AnalyticAt 𝕜 (fun z : ι → 𝕜 => dslope (fun w => f (Function.update z i w)) ζ (z i)) x :=
  sorry

end Layer0

/-! ## Layer 1: estimates on polydiscs -/

section Layer1

variable {ι : Type*} [Fintype ι] [DecidableEq ι]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]

/-- **Layer 1.4, Cauchy's inequality on a polydisc.** -/
theorem norm_mvCoeff_mul_pow_le {f : (ι → ℂ) → V} {p : FormalMultilinearSeries ℂ (ι → ℂ) V}
    {R : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 R) {M : ℝ}
    (hM : ∀ y ∈ Metric.ball (0 : ι → ℂ) R, ‖f y‖ ≤ M) (α : ι → ℕ) {ρ : ℝ} (hρ0 : 0 ≤ ρ)
    (hρ : ρ < R) : ‖mvCoeff p α‖ * ρ ^ (∑ i, α i) ≤ M :=
  sorry

/-- **Layer 1.5, the Taylor remainder**, with the constant `1 + T` (Waldschmidt's Lemma 4.13 has
`1 + √T`, from Parseval's formula, which needs values in a Hilbert space). -/
theorem norm_sub_partialSum_le {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] {f : E → V}
    {p : FormalMultilinearSeries ℂ E V} {R : ℝ≥0} (hf : HasFPowerSeriesOnBall f p 0 R) {M : ℝ}
    (hM : ∀ y ∈ Metric.ball (0 : E) R, ‖f y‖ ≤ M) (T : ℕ) {z : E} (hz : ‖z‖ < R) :
    ‖f z - p.partialSum T z‖ ≤ (1 + T) * M * (‖z‖ / R) ^ T :=
  sorry

/-- **Layer 1.6, Schwarz's lemma for Cartesian products** (Waldschmidt, Proposition 4.7), in the
form `5 r ≤ R` used by the criterion. The proof divides in Newton form one coordinate at a time
instead of using Waldschmidt's Lemma 4.8. -/
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

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

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

open NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.1, Liouville's inequality** for an algebraic integer. -/
theorem one_le_norm_embedding_mul_house_pow {α : 𝓞 K} (hα : α ≠ 0) (σ : K →+* ℂ) :
    1 ≤ ‖σ (α : K)‖ * house (α : K) ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.2, Liouville's inequality for a number of known size**: `δ ^ a * α` is a nonzero
algebraic integer of house at most `H`. -/
theorem one_le_pow_mul_norm_embedding_mul_pow {δ a : ℕ} (hδ : δ ≠ 0) {α : K} (hα : α ≠ 0)
    {H : ℝ} (hint : IsIntegral ℤ ((δ : K) ^ a * α)) (hH : house ((δ : K) ^ a * α) ≤ H)
    (σ : K →+* ℂ) : 1 ≤ (δ : ℝ) ^ a * ‖σ α‖ * H ^ (Module.finrank ℚ K - 1) :=
  sorry

/-- **Layer 3.4, Thue–Siegel's lemma for complex linear forms** (Waldschmidt, Lemma 4.12). -/
theorem exists_int_vec_norm_le_of_pow_le {ι κ : Type*} [Fintype ι] [Fintype κ] (u : ι → κ → ℂ)
    {U V : ℝ} (hU : ∀ j, ∑ i, ‖u i j‖ ≤ Real.exp U) {X : ℕ} (hX : 0 < X)
    (hι : 0 < Fintype.card ι)
    (hcard : (Real.sqrt 2 * X * Real.exp (U + V) + 1) ^ (2 * Fintype.card κ) ≤
      ((X : ℝ) + 1) ^ Fintype.card ι) :
    ∃ ξ : ι → ℤ, ξ ≠ 0 ∧ (∀ i, |ξ i| ≤ (X : ℤ)) ∧
      ∀ j, ‖∑ i, u i j * (ξ i : ℂ)‖ ≤ Real.exp (-V) :=
  sorry

end Layer3

/-! ## Layer 4: the auxiliary function -/

/-- **Layer 4.1, the auxiliary function** (Waldschmidt, Proposition 4.10). -/
theorem exists_auxiliary_function {ι Λ : Type*} [Fintype ι] [Fintype Λ]
    (hι : 0 < Fintype.card ι) {φ : Λ → (ι → ℂ) → ℂ}
    {P : Λ → FormalMultilinearSeries ℂ (ι → ℂ) ℂ} {R : ℝ≥0}
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

section Layer5

open NumberField

variable {n d₀ d₁ : ℕ}

/-- The exponent vector `τ` placed in the first `d₀` coordinates of `Fin n`, and `0` in the
others. -/
def tauVec (τ : Fin d₀ → ℕ) : Fin n → ℕ := fun v => if h : (v : ℕ) < d₀ then τ ⟨v, h⟩ else 0

/-- **Layer 5.1, the auxiliary function** `F_p (z) = ∑ p (τ, t) z ^ τ exp ((∑ᵢ tᵢ xᵢ) · z)`,
with `τ` supported on the first `d₀` coordinates and `τ, t` bounded by `T`. -/
noncomputable def auxFun (x : Fin d₁ → Fin n → ℂ) (T : ℕ)
    (p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ) : (Fin n → ℂ) → ℂ :=
  fun z => ∑ l, p l * ((∏ v, z v ^ tauVec (fun h => (l.1 h : ℕ)) v) *
    Complex.exp (∑ v, (∑ i, ((l.2 i : ℕ) : ℂ) * x i v) * z v))

/-- The bound `(T + 1) ^ (d₀ + d₁) e ^ N (1 + ρ) ^ (d₀ T) e ^ (T A ρ)` for `auxFun` on the
polydisc of radius `ρ`, when `|p| ≤ e ^ N` and `A = ∑ᵢ ∑ᵥ ‖xᵢ v‖`. -/
noncomputable def growthBound (d₀ d₁ T : ℕ) (N A ρ : ℝ) : ℝ :=
  ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * (Real.exp N * (1 + ρ) ^ (d₀ * T) * Real.exp (T * A * ρ))

/-- The exponent of the denominator in 5.2, for Taylor coefficients of total order `M`. -/
def denomExp (d₀ d₁ n T S₁ M : ℕ) : ℕ := d₀ * T + M + d₁ * n * T * S₁

/-- The bound for the house in 5.2, for Taylor coefficients of total order `M`. -/
noncomputable def houseBound (d₀ d₁ n T S₁ δ M : ℕ) (N G : ℝ) : ℝ :=
  ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * ((δ : ℝ) ^ denomExp d₀ d₁ n T S₁ M * Real.exp N *
    ((δ : ℝ) ^ 2 * M + n * S₁ * G + 1) ^ (d₀ * T) * (d₁ * T * G + 1) ^ M *
    G ^ (d₁ * n * T * S₁))

/-- The Liouville factor of 5.3: `M ^ M δ ^ A H ^ (D - 1)` with `A = denomExp` and
`H = houseBound`. -/
noncomputable def liouvilleFactor (d₀ d₁ n T S₁ δ D : ℕ) (N G : ℝ) (M : ℕ) : ℝ :=
  (M : ℝ) ^ M * (δ : ℝ) ^ denomExp d₀ d₁ n T S₁ M * houseBound d₀ d₁ n T S₁ δ M N G ^ (D - 1)

/-- **Layer 5.1, the growth of the auxiliary function.** -/
theorem norm_auxFun_le (x : Fin d₁ → Fin n → ℂ) (T : ℕ)
    {p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ} {N : ℝ}
    (hp : ∀ l, ‖p l‖ ≤ Real.exp N) (z : Fin n → ℂ) :
    ‖auxFun x T p z‖ ≤ growthBound d₀ d₁ T N (∑ i, ∑ v, ‖x i v‖) ‖z‖ :=
  sorry

/-- **Layer 5.2, the Taylor coefficients at `s · y` are algebraic, of explicit size.** The
generators `X`, `Yg`, `Eg` of the number field `K` map to the coordinates of the `xᵢ`, the first
`d₀` coordinates of the `yⱼ`, and the `exp (xᵢ · yⱼ)`, and `δ` times each of them is an algebraic
integer of house at most `G`. -/
theorem exists_eq_mvTaylorCoeff_auxFun {K : Type*} [Field K] [NumberField K] (ι₀ : K →+* ℂ)
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
    (σ : Fin n → ℕ) :
    ∃ θ : K, ι₀ θ = (∏ v, ((σ v).factorial : ℂ)) *
        mvTaylorCoeff (auxFun x T fun l => (p l : ℂ)) (fun v => ∑ j, (s j : ℂ) * y j v) σ ∧
      IsIntegral ℤ ((δ : K) ^ denomExp d₀ d₁ n T S₁ (∑ v, σ v) * θ) ∧
      house ((δ : K) ^ denomExp d₀ d₁ n T S₁ (∑ v, σ v) * θ) ≤
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
    (hne : mvTaylorCoeff (auxFun x T fun l => (p l : ℂ)) (fun v => ∑ j, (s j : ℂ) * y j v) σ ≠
      0) :
    1 ≤ liouvilleFactor d₀ d₁ n T S₁ δ (Module.finrank ℚ K) N G (∑ v, σ v) *
      ‖mvTaylorCoeff (auxFun x T fun l => (p l : ℂ)) (fun v => ∑ j, (s j : ℂ) * y j v) σ‖ :=
  sorry

/-- **Layer 5.4, the auxiliary function of a nonzero coefficient vector is not zero.** -/
theorem exists_mvTaylorCoeff_auxFun_ne_zero (hd₀ : d₀ ≤ n) {x : Fin d₁ → Fin n → ℂ}
    (hxli : LinearIndependent ℚ x) (T : ℕ)
    {p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ} (hp : p ≠ 0) :
    ∃ σ, mvTaylorCoeff (auxFun x T p) 0 σ ≠ 0 :=
  sorry

/-- **Layer 5.5, the transcendence argument** (Waldschmidt §4.6, steps 3 to 6), with the
parameters as hypotheses: the conditions of 4.1 for the monomials of `auxFun` with `V = U`
(`hW`, `hRr`, `hRr'`, `hL`, `hMU`), the vanishing inequality `hvan` and the extrapolation
inequality `hbig`. The first nonvanishing order at the points `s · y` is measured by total
degree, which the change of variables `Yl` preserves (0.4). -/
theorem false_of_parameters (hn1 : 1 ≤ n) (hd₀ : d₀ ≤ n)
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
    (T S₁ S₀ : ℕ) (hS₁ : 1 ≤ S₁) {U N r : ℝ} {R : ℝ≥0} (hN : 0 < N) (hr0 : 0 < r)
    (hr : S₁ * (∑ j, ∑ v, ‖y j v‖) + 2 ≤ r)
    (hW : 12 * (n : ℝ) ^ 2 ≤ N + U + U) (hRr : Real.exp 1 ≤ R / r)
    (hRr' : R / r ≤ Real.exp ((N + U + U) / 6))
    (hL : (2 * (N + U + U)) ^ (n + 1) ≤
      ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * N * Real.log (R / r) ^ n)
    (hMU : ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * ((1 + (R : ℝ)) ^ (d₀ * T) *
      Real.exp (T * (∑ i, ∑ v, ‖x i v‖) * R)) ≤ Real.exp U)
    (hvan : ∀ M : ℕ, M ≤ n * S₀ →
      liouvilleFactor d₀ d₁ n T S₁ δ (Module.finrank ℚ K) N G M * Real.exp (-U) < 1)
    (E : ℕ → ℝ) (hE : ∀ M, 1 ≤ E M)
    (hbig : ∀ M : ℕ, S₀ ≤ M → liouvilleFactor d₀ d₁ n T S₁ δ (Module.finrank ℚ K) N G M *
      (n * (1 / E M) ^ (M / n * S₁) * growthBound d₀ d₁ T N (∑ i, ∑ v, ‖x i v‖)
        ((∑ j, ∑ v, ‖y j v‖) *
          (5 * 3 ^ n * E M * (S₁ + 2 * ‖(Yl.symm : (Fin n → ℂ) →L[ℂ] (Fin n → ℂ))‖)))) < 1) :
    False :=
  sorry

/-- **Layer 5.6, the choice of parameters** (Waldschmidt §4.6, step 6): for fixed data there are
parameters satisfying every condition of 5.5. Here `D = [K : ℚ]`, `G` bounds the houses,
`A = ∑ᵢ ∑ᵥ ‖xᵢ v‖`, `Ay = ∑ⱼ ∑ᵥ ‖yⱼ v‖` and `B = ‖Yl⁻¹‖`. -/
theorem exists_parameters (hn1 : 1 ≤ n) (hd : n < d₀ + d₁) {D δ : ℕ} (hD : 1 ≤ D)
    (hδ : 1 ≤ δ) {G A Ay B : ℝ} (hG : 1 ≤ G) (hA : 0 ≤ A) (hAy : 0 ≤ Ay) (hB : 0 ≤ B) :
    ∃ (T S₁ S₀ : ℕ) (U N r : ℝ) (R : ℝ≥0) (E : ℕ → ℝ),
      1 ≤ S₁ ∧ 0 < N ∧ 0 < r ∧ S₁ * Ay + 2 ≤ r ∧ 12 * (n : ℝ) ^ 2 ≤ N + U + U ∧
      Real.exp 1 ≤ R / r ∧ R / r ≤ Real.exp ((N + U + U) / 6) ∧
      (2 * (N + U + U)) ^ (n + 1) ≤
        ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * N * Real.log (R / r) ^ n ∧
      ((T + 1) ^ d₀ * (T + 1) ^ d₁ : ℕ) * ((1 + (R : ℝ)) ^ (d₀ * T) *
        Real.exp (T * A * R)) ≤ Real.exp U ∧
      (∀ M : ℕ, M ≤ n * S₀ → liouvilleFactor d₀ d₁ n T S₁ δ D N G M * Real.exp (-U) < 1) ∧
      (∀ M, 1 ≤ E M) ∧
      (∀ M : ℕ, S₀ ≤ M → liouvilleFactor d₀ d₁ n T S₁ δ D N G M *
        (n * (1 / E M) ^ (M / n * S₁) * growthBound d₀ d₁ T N A
          (Ay * (5 * 3 ^ n * E M * (S₁ + 2 * B)))) < 1) :=
  sorry

/-- **Layer 5.7, the criterion** (Waldschmidt, Corollary 4.2). -/
theorem schneiderLang (hd₀ : d₀ ≤ n) (hn : n < d₀ + d₁)
    (x : Fin d₁ → Fin n → ℂ) (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin n → Fin n → ℂ) (hyli : LinearIndependent ℂ y) :
    (∃ (h : Fin d₀) (j : Fin n), Transcendental ℚ (y j (Fin.castLE hd₀ h))) ∨
      ∃ (i : Fin d₁) (j : Fin n), Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

end Layer5

/-! ## Layer 6: consequences of the criterion -/

section Layer6

variable {n : ℕ}

/-- **Layer 6.1, the case `d₀ = 0`** (Waldschmidt, Corollary 4.3, with `ℚ`-linearly independent
`xᵢ`): the `yⱼ` need only span `ℂⁿ`. -/
theorem schneiderLang_zero {d l : ℕ} (hd : n + 1 ≤ d) (x : Fin d → Fin n → ℂ)
    (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin l → Fin n → ℂ) (hy : Submodule.span ℂ (Set.range y) = ⊤) :
    ∃ (i : Fin d) (j : Fin l), Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-- **Layer 6.2, the case `d₀ = 1`, `d₁ = n`** (Waldschmidt, Corollary 4.4). -/
theorem schneiderLang_one {d : ℕ} [NeZero d] (x : Fin d → Fin d → ℂ)
    (hx : ∀ i v, IsAlgebraic ℚ (x i v)) (hxli : LinearIndependent ℚ x)
    (y : Fin d → Fin d → ℂ) (hyli : LinearIndependent ℂ y)
    (hy₁ : ∀ j, IsAlgebraic ℚ (y j 0)) :
    ∃ i j : Fin d, Transcendental ℚ (Complex.exp (∑ v, x i v * y j v)) :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann**, branch-free. -/
theorem transcendental_of_isAlgebraic_exp {x : ℂ} (hx : x ≠ 0)
    (h : IsAlgebraic ℚ (Complex.exp x)) : Transcendental ℚ x :=
  sorry

/-- **Layer 6.3, Hermite–Lindemann**, for the exponential of an algebraic number. -/
theorem transcendental_exp_of_isAlgebraic {β : ℂ} (hβ : IsAlgebraic ℚ β) (hβ0 : β ≠ 0) :
    Transcendental ℚ (Complex.exp β) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, branch-free. -/
theorem transcendental_exp_mul {x b : ℂ} (hx : x ≠ 0) (h : IsAlgebraic ℚ (Complex.exp x))
    (hb : IsAlgebraic ℚ b) (hb' : ∀ q : ℚ, b ≠ q) : Transcendental ℚ (Complex.exp (b * x)) :=
  sorry

/-- **Layer 6.4, Gelfond–Schneider**, in Mathlib's principal branch, with the name and statement
of Mathlib PR #42911. -/
theorem GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational (α β : ℂ)
    (hα : IsAlgebraic ℚ α) (hβ : IsAlgebraic ℚ β) (htriv : α ≠ 0 ∧ α ≠ 1)
    (hirr : ∀ i j : ℤ, β ≠ i / j) : Transcendental ℚ (α ^ β) :=
  sorry

/-- **Layer 6.4, quotients of logarithms** are rational or transcendental. -/
theorem exists_rat_eq_div_or_transcendental {x y : ℂ} (hx : IsAlgebraic ℚ (Complex.exp x))
    (hy : IsAlgebraic ℚ (Complex.exp y)) (hx0 : x ≠ 0) :
    (∃ q : ℚ, y / x = q) ∨ Transcendental ℚ (y / x) :=
  sorry

end Layer6

/-! ## Layer 7: Baker's theorem -/

section Layer7

/-- **Layer 7.1** (Waldschmidt, Theorem 4.5). -/
theorem eq_zero_of_isAlgebraic_sum_mul (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    {d : ℕ} (hd : Module.finrank ℚ K = d) (β : Fin d → K) (hβ : LinearIndependent ℚ β)
    (l : Fin d → ℂ) (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (hsum : IsAlgebraic ℚ (∑ i, (β i : ℂ) * l i)) : ∀ i, l i = 0 :=
  sorry

/-- **Layer 7.2, Baker's theorem** (Waldschmidt, Theorem 1.6). -/
theorem eq_zero_of_add_sum_mul_eq_zero {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) (hli : LinearIndependent ℚ l) {β₀ : ℂ}
    {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hrel : β₀ + ∑ i, β i * l i = 0) : β₀ = 0 ∧ ∀ i, β i = 0 :=
  sorry

/-- **Layer 7.2, Baker's theorem** for a family indexed by a finite set. -/
theorem eq_zero_of_add_sum_mul_eq_zero_of_linearIndepOn {ι : Type*} {s : Finset ι}
    {l : ι → ℂ} (hl : ∀ i ∈ s, IsAlgebraic ℚ (Complex.exp (l i))) (hli : LinearIndepOn ℚ l s)
    {β₀ : ℂ} {β : ι → ℂ} (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i ∈ s, IsAlgebraic ℚ (β i))
    (hrel : β₀ + ∑ i ∈ s, β i * l i = 0) : β₀ = 0 ∧ ∀ i ∈ s, β i = 0 :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.1): no independence hypothesis is needed when `β₀ ≠ 0`. -/
theorem add_sum_mul_ne_zero {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β₀ : ℂ} {β : ι → ℂ}
    (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ₀0 : β₀ ≠ 0) :
    β₀ + ∑ i, β i * l i ≠ 0 :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.2): a nonzero linear form in logarithms is transcendental. -/
theorem transcendental_sum_mul {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β : ι → ℂ} (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hΛ : ∑ i, β i * l i ≠ 0) : Transcendental ℚ (∑ i, β i * l i) :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.3). -/
theorem transcendental_exp_add_sum_mul {ι : Type*} [Fintype ι] {l : ι → ℂ}
    (hl : ∀ i, IsAlgebraic ℚ (Complex.exp (l i))) {β₀ : ℂ} {β : ι → ℂ}
    (hβ₀ : IsAlgebraic ℚ β₀) (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ₀0 : β₀ ≠ 0) :
    Transcendental ℚ (Complex.exp (β₀ + ∑ i, β i * l i)) :=
  sorry

/-- **Layer 7.3** (Baker, Theorem 2.4), in Mathlib's principal branch. -/
theorem transcendental_prod_cpow {ι : Type*} [Fintype ι] [Nonempty ι] {α β : ι → ℂ}
    (hα : ∀ i, IsAlgebraic ℚ (α i)) (hα0 : ∀ i, α i ≠ 0) (hα1 : ∀ i, α i ≠ 1)
    (hβ : ∀ i, IsAlgebraic ℚ (β i))
    (hβli : LinearIndependent ℚ (fun o : Option ι => o.elim 1 β)) :
    Transcendental ℚ (∏ i, α i ^ β i) :=
  sorry

end Layer7

/-! ## Worked examples -/

theorem transcendental_exp_one : Transcendental ℚ (Real.exp 1) := sorry

theorem transcendental_pi : Transcendental ℚ Real.pi := sorry

theorem transcendental_exp_pi : Transcendental ℚ (Real.exp Real.pi) := sorry

theorem transcendental_two_cpow_sqrt_two : Transcendental ℚ ((2 : ℂ) ^ (Real.sqrt 2 : ℂ)) := sorry

theorem transcendental_log_two : Transcendental ℚ (Real.log 2) := sorry

theorem transcendental_log_two_div_log_three :
    Transcendental ℚ (Real.log 2 / Real.log 3) := sorry

theorem transcendental_pi_add_log_two : Transcendental ℚ (Real.pi + Real.log 2) := sorry

/-! ## Normalisation checks and rejection tests -/

/-- The factor `α!` of 0.4: the Taylor coefficient of `z ^ 2` at `0` is `1`, while its second
derivative is `2` (`iteratedFDeriv_sq`). -/
theorem mvTaylorCoeff_sq : mvTaylorCoeff (fun z : Fin 1 → ℂ => z 0 ^ 2) 0 (fun _ => 2) = 1 :=
  sorry

theorem iteratedFDeriv_sq :
    iteratedFDeriv ℂ 2 (fun z : Fin 1 → ℂ => z 0 ^ 2) 0 (fun _ => Pi.single 0 1) = 2 :=
  sorry

/-- A monomial has coefficient `1` at its own multi-index and `0` at every other. -/
theorem mvTaylorCoeff_prod_pow {ι : Type*} [Fintype ι] [DecidableEq ι] (τ σ : ι → ℕ) :
    mvTaylorCoeff (fun z : ι → ℂ => ∏ i, z i ^ τ i) 0 σ = if σ = τ then 1 else 0 :=
  sorry

/-- The value off the domain of analyticity is `0`; every target above assumes analyticity, so
no statement holds only through this value. -/
theorem mvTaylorCoeff_of_not_analyticAt {𝕜 : Type*} [NontriviallyNormedField 𝕜] {ι : Type*}
    [Fintype ι] [DecidableEq ι] {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
    {f : (ι → 𝕜) → F} {x : ι → 𝕜} (h : ¬ AnalyticAt 𝕜 f x) (α : ι → ℕ) :
    mvTaylorCoeff f x α = 0 := by
  simp [mvTaylorCoeff, h]

/-- Gelfond–Schneider (6.4) fails for a rational exponent. -/
theorem four_cpow_half : (4 : ℂ) ^ ((1 : ℂ) / 2) = 2 := sorry

/-- Baker's theorem (7.2) fails without the `ℚ`-linear independence of the logarithms. -/
theorem two_mul_log_two_sub_log_four : 2 * Complex.log 2 - Complex.log 4 = 0 := by
  have h2 := Complex.ofReal_log (x := 2) (by norm_num)
  have h4 := Complex.ofReal_log (x := 4) (by norm_num)
  push_cast at h2 h4
  rw [← h2, ← h4, show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow]
  push_cast
  ring

/-- A quotient of logarithms of algebraic numbers (6.4) can be rational. -/
theorem log_four_div_log_two : Real.log 4 / Real.log 2 = 2 := by
  rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.log_pow,
    mul_div_assoc, div_self (Real.log_pos one_lt_two).ne']
  norm_num

end TauCetiRoadmap.SchneiderLang
