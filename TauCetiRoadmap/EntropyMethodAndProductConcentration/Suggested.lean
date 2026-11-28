module

public import Mathlib
public import TauCeti.MeasureTheory.OptimalTransport.Coupling
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.KantorovichRubinstein
public import TauCeti.InformationTheory.KullbackLeibler.Variational
public import TauCeti.InformationTheory.KullbackLeibler.Pinsker
public import TauCeti.InformationTheory.KullbackLeibler.ChainRule
public import TauCeti.Probability.McDiarmid
public import TauCeti.Probability.Moments.Bernstein

/-!
# The entropy method and concentration on product spaces: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README has one other headline,
the corollary of 5.2 that `T₁(C)` tensorizes to the weighted metric `∑ cᵢ dᵢ` with `∑ cᵢ² = 1`;
it is a target of the same standing, stated there in prose, and is not stated here because
Mathlib has no metric structure for the weighted `ℓ¹` distance on a product.

The conventions of the README are used throughout. A random variable is a real function on a
measure space `(Ω, μ)`; on a product space it is a function `f` on `∀ i, α i` under the product
measure `Measure.pi P` of probability measures `P i`, indexed by a finite type `ι`. `mgf X μ t` is
Mathlib's `∫ exp (t X) dμ`; since it is `0` when `exp (t X)` is not integrable, every statement
bounding it also states the integrability. The entropy `entropy μ g` is the verbatim copy of the
definition owned by RandomMatrices §2.2. Quantities that can be infinite (relative entropies,
transport costs, lower integrals) are stated in `ℝ≥0∞`; the measure of a set that need not be
measurable is its outer measure, and where that matters the coordinate spaces are standard Borel,
so that the sets in question are universally measurable. Bennett's function is
`bennettH u = (1 + u) log (1 + u) - u`. The implementation namespace of the README is `TauCeti`;
the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Finset InformationTheory
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.EntropyMethodAndProductConcentration

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: sub-gamma variables, Bennett, Bernstein and Paley–Zygmund -/

section SubGamma

variable {Ω : Type*} {mΩ : MeasurableSpace Ω} {μ : Measure Ω}

/-- 1.1: `X` is sub-gamma on the right with variance factor `v` and scale parameter `c`: for every
`t ≥ 0` with `c t < 1`, `exp (t X)` is integrable and `E exp (t X) ≤ exp (v t² / (2 (1 - c t)))`.
The variable is not centred by the definition; the theorems apply it to `X - E X`. For `c = 0`
it is the one-sided sub-Gaussian condition with variance proxy `v`. -/
def HasSubgammaMGF (X : Ω → ℝ) (v c : ℝ≥0) (μ : Measure Ω) : Prop :=
  ∀ t : ℝ, 0 ≤ t → (c : ℝ) * t < 1 →
    Integrable (fun ω ↦ Real.exp (t * X ω)) μ ∧
      mgf X μ t ≤ Real.exp (v * t ^ 2 / (2 * (1 - c * t)))

/-- 1.1: the two tail bounds of a sub-gamma variable. The first exceedance is strict: for
`v = c = 0` and `X = 0` the non-strict event has probability `1`. -/
theorem HasSubgammaMGF.measureReal_gt_le [IsProbabilityMeasure μ] {X : Ω → ℝ} {v c : ℝ≥0}
    (h : HasSubgammaMGF X v c μ) {t ε : ℝ} (ht : 0 ≤ t) (hε : 0 ≤ ε) :
    μ.real {ω | Real.sqrt (2 * v * t) + c * t < X ω} ≤ Real.exp (-t) ∧
      μ.real {ω | ε ≤ X ω} ≤ Real.exp (-(ε ^ 2 / (2 * (v + c * ε)))) := by
  sorry

/-- 1.1: a finite sum of independent sub-gamma variables is sub-gamma, with the sum of the
variance factors and any common bound of the scale parameters. -/
theorem HasSubgammaMGF.sum_of_iIndepFun {ι : Type*} {X : ι → Ω → ℝ} (h_indep : iIndepFun X μ)
    {s : Finset ι} {v c : ι → ℝ≥0} {c₀ : ℝ≥0} (h : ∀ i ∈ s, HasSubgammaMGF (X i) (v i) (c i) μ)
    (hc : ∀ i ∈ s, c i ≤ c₀) :
    HasSubgammaMGF (fun ω ↦ ∑ i ∈ s, X i ω) (∑ i ∈ s, v i) c₀ μ := by
  sorry

/-- 1.1: the expected maximum of finitely many sub-gamma variables, with no independence
assumed. -/
theorem HasSubgammaMGF.integral_sup'_le [IsProbabilityMeasure μ] {ι : Type*} [Fintype ι]
    [Nonempty ι] {Z : ι → Ω → ℝ} {v c : ℝ≥0} (h : ∀ i, HasSubgammaMGF (Z i) v c μ) :
    ∫ ω, Finset.univ.sup' Finset.univ_nonempty (fun i ↦ Z i ω) ∂μ ≤
      Real.sqrt (2 * v * Real.log (Fintype.card ι)) + c * Real.log (Fintype.card ι) := by
  sorry

/-- 1.1: a centred gamma variable with shape `a` and rate `r` is sub-gamma on the right with
variance factor `a / r²` and scale parameter `1 / r`. -/
theorem hasSubgammaMGF_gammaMeasure {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    HasSubgammaMGF (fun x ↦ x - a / r) (a / r ^ 2).toNNReal r⁻¹.toNNReal (gammaMeasure a r) := by
  sorry

/-- Sanity check of the definition: the scale parameter of a gamma law cannot be lowered below
`1 / r`, whatever the variance factor, because `exp (r X)` is not integrable. -/
theorem not_hasSubgammaMGF_gammaMeasure_of_lt {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (v : ℝ≥0)
    {c : ℝ≥0} (hc : (c : ℝ) < r⁻¹) :
    ¬ HasSubgammaMGF (fun x ↦ x - a / r) v c (gammaMeasure a r) := by
  sorry

/-- 1.2: Bennett's function `h (u) = (1 + u) log (1 + u) - u`, the Legendre transform of
`φ (λ) = exp λ - λ - 1`. -/
def bennettH (u : ℝ) : ℝ := (1 + u) * Real.log (1 + u) - u

/-- 1.2: Bennett's inequality at the level of the moment generating function. -/
theorem mgf_sum_sub_le_bennett {ι : Type*} {X : ι → Ω → ℝ} (h_indep : iIndepFun X μ)
    {s : Finset ι} {b v : ℝ} (hb : 0 < b) (hX : ∀ i ∈ s, MemLp (X i) 2 μ)
    (hle : ∀ i ∈ s, ∀ᵐ ω ∂μ, X i ω ≤ b) (hv : ∑ i ∈ s, ∫ ω, X i ω ^ 2 ∂μ ≤ v) {t : ℝ}
    (ht : 0 ≤ t) :
    mgf (fun ω ↦ ∑ i ∈ s, (X i ω - ∫ ω', X i ω' ∂μ)) μ t ≤
      Real.exp (v / b ^ 2 * (Real.exp (b * t) - b * t - 1)) := by
  sorry

/-- 1.2: Bennett's tail inequality. -/
theorem measureReal_sum_sub_ge_le_bennett {ι : Type*} {X : ι → Ω → ℝ} (h_indep : iIndepFun X μ)
    {s : Finset ι} {b v : ℝ} (hb : 0 < b) (hX : ∀ i ∈ s, MemLp (X i) 2 μ)
    (hle : ∀ i ∈ s, ∀ᵐ ω ∂μ, X i ω ≤ b) (hv : ∑ i ∈ s, ∫ ω, X i ω ^ 2 ∂μ ≤ v) {ε : ℝ}
    (hε : 0 ≤ ε) :
    μ.real {ω | ε ≤ ∑ i ∈ s, (X i ω - ∫ ω', X i ω' ∂μ)} ≤
      Real.exp (-(v / b ^ 2 * bennettH (b * ε / v))) := by
  sorry

/-- 1.3: Bernstein's inequality under moment conditions on the positive parts: the centred sum is
sub-gamma with variance factor `v` and scale parameter `c`. -/
theorem hasSubgammaMGF_sum_sub_of_moment_le {ι : Type*} {X : ι → Ω → ℝ}
    (h_indep : iIndepFun X μ) {s : Finset ι} {v c : ℝ≥0} (hX : ∀ i ∈ s, Integrable (X i) μ)
    (h2 : ∑ i ∈ s, ∫⁻ ω, ENNReal.ofReal (X i ω ^ 2) ∂μ ≤ v)
    (hq : ∀ q : ℕ, 3 ≤ q →
      ∑ i ∈ s, ∫⁻ ω, ENNReal.ofReal (max (X i ω) 0 ^ q) ∂μ ≤
        ((q.factorial : ℝ≥0) * v * c ^ (q - 2) / 2 : ℝ≥0)) :
    HasSubgammaMGF (fun ω ↦ ∑ i ∈ s, (X i ω - ∫ ω', X i ω' ∂μ)) v c μ := by
  sorry

/-- 1.4: the Paley–Zygmund inequality. -/
theorem paleyZygmund [IsProbabilityMeasure μ] {Y : Ω → ℝ} (hY : 0 ≤ᵐ[μ] Y) (hY2 : MemLp Y 2 μ)
    {θ : ℝ} (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) :
    (1 - θ) ^ 2 * (∫ ω, Y ω ∂μ) ^ 2 ≤
      μ.real {ω | θ * ∫ ω', Y ω' ∂μ < Y ω} * ∫ ω, Y ω ^ 2 ∂μ := by
  sorry

/-- 1.4: the Paley–Zygmund inequality with the variance, for a variable of nonnegative mean. -/
theorem paleyZygmund_variance [IsProbabilityMeasure μ] {Y : Ω → ℝ} (hY2 : MemLp Y 2 μ)
    (hm : 0 ≤ ∫ ω, Y ω ∂μ) {θ : ℝ} (hθ1 : θ ≤ 1) :
    (1 - θ) ^ 2 * (∫ ω, Y ω ∂μ) ^ 2 ≤
      μ.real {ω | θ * ∫ ω', Y ω' ∂μ < Y ω} *
        (variance Y μ + (1 - θ) ^ 2 * (∫ ω, Y ω ∂μ) ^ 2) := by
  sorry

end SubGamma

/-! ## Layer 2: the entropy functional -/

section Entropy

/-- 2.1: the entropy `Ent_μ(g) = ∫ g log g dμ - (∫ g dμ) log (∫ g dμ)`. Verbatim local copy of the
definition owned by RandomMatrices §2.2. -/
def entropy {α : Type*} {_ : MeasurableSpace α} (μ : Measure α) (g : α → ℝ) : ℝ :=
  ∫ x, g x * Real.log (g x) ∂μ - (∫ x, g x ∂μ) * Real.log (∫ x, g x ∂μ)

variable {α : Type*} {mα : MeasurableSpace α} {μ : Measure α}

/-- 2.1: entropy is nonnegative. -/
theorem entropy_nonneg [IsProbabilityMeasure μ] {g : α → ℝ} (hg : 0 ≤ᵐ[μ] g)
    (hgi : Integrable g μ) (hgl : Integrable (fun x ↦ g x * Real.log (g x)) μ) :
    0 ≤ entropy μ g := by
  sorry

/-- 2.1: entropy vanishes exactly at the almost surely constant functions. -/
theorem entropy_eq_zero_iff [IsProbabilityMeasure μ] {g : α → ℝ} (hg : 0 ≤ᵐ[μ] g)
    (hgi : Integrable g μ) (hgl : Integrable (fun x ↦ g x * Real.log (g x)) μ) :
    entropy μ g = 0 ↔ g =ᵐ[μ] fun _ ↦ ∫ x, g x ∂μ := by
  sorry

/-- 2.1: entropy is the mass times the relative entropy of the normalised density. -/
theorem entropy_eq_mul_toReal_klDiv [IsProbabilityMeasure μ] {g : α → ℝ} (hg : 0 ≤ᵐ[μ] g)
    (hgi : Integrable g μ) (hgl : Integrable (fun x ↦ g x * Real.log (g x)) μ) :
    entropy μ g = (∫ x, g x ∂μ) *
      (klDiv (μ.withDensity fun x ↦ ENNReal.ofReal (g x / ∫ y, g y ∂μ)) μ).toReal := by
  sorry

/-- 2.2: the duality formula: `Ent_μ(g)` is the least upper bound of `∫ U g dμ` over the `U` with
`∫ exp U dμ = 1`. -/
theorem isLUB_entropy [IsProbabilityMeasure μ] {g : α → ℝ} (hg : 0 ≤ᵐ[μ] g)
    (hgi : Integrable g μ) (hgl : Integrable (fun x ↦ g x * Real.log (g x)) μ) :
    IsLUB {r | ∃ U : α → ℝ, Integrable (fun x ↦ Real.exp (U x)) μ ∧
        ∫ x, Real.exp (U x) ∂μ = 1 ∧ Integrable (fun x ↦ U x * g x) μ ∧
          r = ∫ x, U x * g x ∂μ}
      (entropy μ g) := by
  sorry

/-- 2.2: the variational formula: entropy is at most the expected Bregman divergence of
`x log x` from any `u > 0`. -/
theorem entropy_le_integral_mul_log_sub [IsProbabilityMeasure μ] {g : α → ℝ} (hg : 0 ≤ᵐ[μ] g)
    (hgi : Integrable g μ) (hgl : Integrable (fun x ↦ g x * Real.log (g x)) μ) {u : ℝ}
    (hu : 0 < u) :
    entropy μ g ≤ ∫ x, (g x * (Real.log (g x) - Real.log u) - (g x - u)) ∂μ := by
  sorry

/-- 2.3: the comparison lemma for the differential inequalities of the entropy method.
Auxiliary: the step shared by the Herbst arguments of 2.3, 4.2–4.5 and 6.3. -/
theorem le_mul_integral_of_differential_ineq {b : ℝ} {f G g : ℝ → ℝ}
    (hf : DifferentiableOn ℝ f (Ioo 0 b)) (hfpos : ∀ x ∈ Ioo 0 b, 0 < f x)
    (hG : DifferentiableOn ℝ G (Ioo 0 b)) (hg : ContinuousOn g (Ico 0 b))
    (hlim : Tendsto (fun x ↦ G x / f x) (𝓝[>] 0) (𝓝 0))
    (hineq : ∀ x ∈ Ioo 0 b, f x * deriv G x - deriv f x * G x ≤ f x ^ 2 * g x) :
    ∀ x ∈ Ioo 0 b, G x ≤ f x * ∫ y in (0 : ℝ)..x, g y := by
  sorry

/-- 2.3: Herbst's argument for a single random variable: an entropy bound for `exp (t Z)` at every
`t > 0` makes `Z - E Z` sub-Gaussian on the right. -/
theorem hasSubgammaMGF_zero_of_entropy_le [IsProbabilityMeasure μ] {Z : α → ℝ}
    (hZ : Integrable Z μ) {v : ℝ≥0}
    (hint : ∀ t : ℝ, 0 < t → Integrable (fun x ↦ Real.exp (t * Z x)) μ ∧
      Integrable (fun x ↦ Z x * Real.exp (t * Z x)) μ)
    (hent : ∀ t : ℝ, 0 < t →
      entropy μ (fun x ↦ Real.exp (t * Z x)) ≤ t ^ 2 * v / 2 * ∫ x, Real.exp (t * Z x) ∂μ) :
    HasSubgammaMGF (fun x ↦ Z x - ∫ y, Z y ∂μ) v 0 μ := by
  sorry

/-- 2.4: the transportation lemma: `Z - E Z` is sub-Gaussian on the right with variance proxy `v`
exactly when the mean of `Z` moves by at most `√(2 v D(ν ‖ μ))` under every change of law `ν`
of finite relative entropy. -/
theorem hasSubgammaMGF_zero_iff_forall_klDiv [IsProbabilityMeasure μ] {Z : α → ℝ}
    (hZ : Integrable Z μ) (v : ℝ≥0) :
    HasSubgammaMGF (fun x ↦ Z x - ∫ y, Z y ∂μ) v 0 μ ↔
      ∀ ν : Measure α, IsProbabilityMeasure ν → ν ≪ μ → klDiv ν μ ≠ ∞ → Integrable Z ν →
        ∫ x, Z x ∂ν - ∫ x, Z x ∂μ ≤ Real.sqrt (2 * v * (klDiv ν μ).toReal) := by
  sorry

end Entropy

/-! ## Layers 3 and 4: entropy on product spaces and the entropy method -/

section Product

variable {ι : Type*} [Fintype ι] {α : ι → Type*} [∀ i, MeasurableSpace (α i)]
  {P : ∀ i, Measure (α i)} [∀ i, IsProbabilityMeasure (P i)]

/-- 3.1: subadditivity (tensorization) of entropy on a product of probability spaces. -/
theorem entropy_pi_le {g : (∀ i, α i) → ℝ} (hg : ∀ x, 0 ≤ g x) (hgm : Measurable g)
    (hgi : Integrable g (Measure.pi P))
    (hgl : Integrable (fun x ↦ g x * Real.log (g x)) (Measure.pi P)) :
    ENNReal.ofReal (entropy (Measure.pi P) g) ≤
      ∑ i, ∫⁻ x, ENNReal.ofReal (entropy (P i) (fun y ↦ g (Function.update x i y)))
        ∂(Measure.pi P) := by
  sorry

/-- 3.2: Han's inequality for relative entropies, in multiplied form. -/
theorem sum_klDiv_map_restrict_le (Q : Measure (∀ i, α i)) [IsProbabilityMeasure Q] :
    ∑ i, klDiv (Q.map (fun x j ↦ x j : (∀ i, α i) → ∀ j : {j // j ≠ i}, α j))
        (Measure.pi (fun j : {j // j ≠ i} ↦ P j.1) : Measure (∀ j : {j // j ≠ i}, α j.1)) ≤
      ((Fintype.card ι : ℝ≥0∞) - 1) * klDiv Q (Measure.pi P) := by
  sorry

/-- 4.1: the modified logarithmic Sobolev inequality. Each `g i` does not depend on the `i`-th
coordinate; the integrand on the right is `exp (t f) φ (-t (f - g i))` with
`φ (u) = exp u - u - 1`. -/
theorem entropy_exp_le_sum_lintegral {f : (∀ i, α i) → ℝ} (hf : Measurable f)
    {g : ι → (∀ i, α i) → ℝ} (hg : ∀ i, Measurable (g i))
    (hgi : ∀ i x y, g i (Function.update x i y) = g i x) {t : ℝ}
    (hexp : Integrable (fun x ↦ Real.exp (t * f x)) (Measure.pi P))
    (hfexp : Integrable (fun x ↦ f x * Real.exp (t * f x)) (Measure.pi P)) :
    ENNReal.ofReal (entropy (Measure.pi P) (fun x ↦ Real.exp (t * f x))) ≤
      ∑ i, ∫⁻ x, ENNReal.ofReal (Real.exp (t * f x) *
        (Real.exp (-(t * (f x - g i x))) + t * (f x - g i x) - 1)) ∂(Measure.pi P) := by
  sorry

/-- 4.2: one-sided bounded differences in quadratic mean: if `g i ≤ f`, `g i` does not depend on
the `i`-th coordinate and `∑ (f - g i)² ≤ v` almost surely, then `f - E f` is sub-Gaussian on the
right with variance proxy `v`. -/
theorem hasSubgammaMGF_of_sum_sq_le {f : (∀ i, α i) → ℝ} (hf : Measurable f)
    (hfi : Integrable f (Measure.pi P)) {g : ι → (∀ i, α i) → ℝ} (hg : ∀ i, Measurable (g i))
    (hgi : ∀ i x y, g i (Function.update x i y) = g i x) (hgf : ∀ i x, g i x ≤ f x) {v : ℝ≥0}
    (hv : ∀ᵐ x ∂(Measure.pi P), ∑ i, (f x - g i x) ^ 2 ≤ v) :
    HasSubgammaMGF (fun x ↦ f x - ∫ y, f y ∂(Measure.pi P)) v 0 (Measure.pi P) := by
  sorry

/-- 4.3: `f` is self-bounding with witnesses `g`: each `g i` does not depend on the `i`-th
coordinate, `0 ≤ f - g i ≤ 1`, and `∑ (f - g i) ≤ f`. -/
def IsSelfBounding (f : (∀ i, α i) → ℝ) (g : ι → (∀ i, α i) → ℝ) : Prop :=
  (∀ i x y, g i (Function.update x i y) = g i x) ∧
    (∀ i x, 0 ≤ f x - g i x ∧ f x - g i x ≤ 1) ∧ ∀ x, ∑ i, (f x - g i x) ≤ f x

/-- 4.3: the moment generating function of a self-bounding function is sub-Poisson with
parameter its mean, on both sides. -/
theorem IsSelfBounding.mgf_le {f : (∀ i, α i) → ℝ} {g : ι → (∀ i, α i) → ℝ}
    (hfg : IsSelfBounding f g) (hfm : Measurable f) (hg : ∀ i, Measurable (g i))
    (hfi : Integrable f (Measure.pi P)) (t : ℝ) :
    Integrable (fun x ↦ Real.exp (t * (f x - ∫ y, f y ∂(Measure.pi P)))) (Measure.pi P) ∧
      mgf (fun x ↦ f x - ∫ y, f y ∂(Measure.pi P)) (Measure.pi P) t ≤
        Real.exp ((Real.exp t - t - 1) * ∫ y, f y ∂(Measure.pi P)) := by
  sorry

/-- 4.3: the upper tail of a self-bounding function. -/
theorem IsSelfBounding.measureReal_ge_le {f : (∀ i, α i) → ℝ} {g : ι → (∀ i, α i) → ℝ}
    (hfg : IsSelfBounding f g) (hfm : Measurable f) (hg : ∀ i, Measurable (g i))
    (hfi : Integrable f (Measure.pi P)) {t : ℝ} (ht : 0 < t) :
    (Measure.pi P).real {x | ∫ y, f y ∂(Measure.pi P) + t ≤ f x} ≤
      Real.exp (-((∫ y, f y ∂(Measure.pi P)) *
        bennettH (t / ∫ y, f y ∂(Measure.pi P)))) := by
  sorry

/-- 4.3: the lower tail of a self-bounding function. -/
theorem IsSelfBounding.measureReal_le_le {f : (∀ i, α i) → ℝ} {g : ι → (∀ i, α i) → ℝ}
    (hfg : IsSelfBounding f g) (hfm : Measurable f) (hg : ∀ i, Measurable (g i))
    (hfi : Integrable f (Measure.pi P)) {t : ℝ} (ht : 0 < t)
    (htm : t ≤ ∫ y, f y ∂(Measure.pi P)) :
    (Measure.pi P).real {x | f x ≤ ∫ y, f y ∂(Measure.pi P) - t} ≤
      Real.exp (-((∫ y, f y ∂(Measure.pi P)) *
        bennettH (-(t / ∫ y, f y ∂(Measure.pi P))))) := by
  sorry

/-- 4.4: `f` is weakly `(a, b)`-self-bounding with witnesses `g`: `f ≥ 0`, each `g i ≥ 0` does not
depend on the `i`-th coordinate, and `∑ (f - g i)² ≤ a f + b`. -/
def IsWeaklySelfBounding (a b : ℝ≥0) (f : (∀ i, α i) → ℝ) (g : ι → (∀ i, α i) → ℝ) : Prop :=
  (∀ x, 0 ≤ f x) ∧ (∀ i x y, g i (Function.update x i y) = g i x) ∧ (∀ i x, 0 ≤ g i x) ∧
    ∀ x, ∑ i, (f x - g i x) ^ 2 ≤ a * f x + b

/-- 4.4: the upper tail of a weakly `(a, b)`-self-bounding function with `g i ≤ f`: sub-gamma with
variance factor `a E f + b` and scale parameter `a / 2`. -/
theorem IsWeaklySelfBounding.hasSubgammaMGF {a b : ℝ≥0} {f : (∀ i, α i) → ℝ}
    {g : ι → (∀ i, α i) → ℝ} (hfg : IsWeaklySelfBounding a b f g) (hfm : Measurable f)
    (hg : ∀ i, Measurable (g i)) (hfi : Integrable f (Measure.pi P))
    (hle : ∀ i x, g i x ≤ f x) :
    HasSubgammaMGF (fun x ↦ f x - ∫ y, f y ∂(Measure.pi P))
      (a * (∫ y, f y ∂(Measure.pi P)).toNNReal + b) (a / 2) (Measure.pi P) := by
  sorry

/-- 4.5: the symmetrized modified logarithmic Sobolev inequality, with `τ (u) = u (e ^ u - 1)`
evaluated at `u = -t (f x - f (update x i y))₊`; each summand is nonnegative. -/
theorem entropy_exp_le_sum_lintegral_tau {f : (∀ i, α i) → ℝ} (hf : Measurable f) {t : ℝ}
    (hexp : Integrable (fun x ↦ Real.exp (t * f x)) (Measure.pi P))
    (hfexp : Integrable (fun x ↦ f x * Real.exp (t * f x)) (Measure.pi P)) :
    ENNReal.ofReal (entropy (Measure.pi P) (fun x ↦ Real.exp (t * f x))) ≤
      ∑ i, ∫⁻ x, ∫⁻ y, ENNReal.ofReal (Real.exp (t * f x) *
        ((-(t * max (f x - f (Function.update x i y)) 0)) *
          (Real.exp (-(t * max (f x - f (Function.update x i y)) 0)) - 1))) ∂(P i)
        ∂(Measure.pi P) := by
  sorry

/-- 4.5: the exponential Efron–Stein inequality for the upper tail, with
`V⁺ (x) = ∑ i, ∫ (f x - f (update x i y))₊² dP i (y)`. -/
theorem log_mgf_le_of_efronStein {f : (∀ i, α i) → ℝ} (hfm : Measurable f)
    (hfi : Integrable f (Measure.pi P)) {t θ : ℝ} (ht : 0 < t) (hθ : 0 < θ) (htθ : t * θ < 1)
    (hV : ∀ᵐ x ∂(Measure.pi P),
      ∑ i, ∫⁻ y, ENNReal.ofReal (max (f x - f (Function.update x i y)) 0 ^ 2) ∂(P i) ≠ ∞)
    (hVi : Integrable (fun x ↦ Real.exp (t / θ * (∑ i, ∫⁻ y,
      ENNReal.ofReal (max (f x - f (Function.update x i y)) 0 ^ 2) ∂(P i)).toReal))
      (Measure.pi P)) :
    Integrable (fun x ↦ Real.exp (t * f x)) (Measure.pi P) ∧
      Real.log (mgf (fun x ↦ f x - ∫ y, f y ∂(Measure.pi P)) (Measure.pi P) t) ≤
        t * θ / (1 - t * θ) * Real.log (∫ x, Real.exp (t / θ * (∑ i, ∫⁻ y,
          ENNReal.ofReal (max (f x - f (Function.update x i y)) 0 ^ 2) ∂(P i)).toReal)
            ∂(Measure.pi P)) := by
  sorry

end Product

/-! ## Layer 5: transport inequalities and the convex distance -/

section Transport

/-- 5.1: `μ` satisfies the transportation inequality `T₁(C)`: `W₁(ν, μ)² ≤ 2 C D(ν ‖ μ)` for every
probability measure `ν`. -/
def SatisfiesT1 {X : Type*} [PseudoEMetricSpace X] [MeasurableSpace X] (μ : Measure X)
    (C : ℝ≥0) : Prop :=
  ∀ ν : Measure X, IsProbabilityMeasure ν →
    TauCeti.wassersteinEDist 1 ν μ ^ 2 ≤ 2 * (C : ℝ≥0∞) * klDiv ν μ

/-- 5.1: the Bobkov–Götze theorem: `T₁(C)` holds exactly when every `1`-Lipschitz function is
sub-Gaussian about its mean with variance proxy `C`. -/
theorem satisfiesT1_iff {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] [SecondCountableTopology X] [StandardBorelSpace X] {μ : Measure X}
    [IsProbabilityMeasure μ] (hμ : TauCeti.HasFiniteMoment 1 μ) (C : ℝ≥0) :
    SatisfiesT1 μ C ↔
      ∀ f : X → ℝ, LipschitzWith 1 f → HasSubgaussianMGF (fun x ↦ f x - ∫ y, f y ∂μ) C μ := by
  sorry

/-- 5.2: the maximal coupling: the least probability of disagreement over the couplings of two
laws is their total variation distance (half of Mathlib's `etvDist`), and it is attained. -/
theorem exists_isCoupling_measure_ne_eq {X : Type*} [MeasurableSpace X] [StandardBorelSpace X]
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    (∃ π : Measure (X × X), TauCeti.IsCoupling π μ ν ∧ π {z | z.1 ≠ z.2} = etvDist μ ν / 2) ∧
      ∀ π : Measure (X × X), TauCeti.IsCoupling π μ ν → etvDist μ ν / 2 ≤ π {z | z.1 ≠ z.2} := by
  sorry

variable {ι : Type*} [Fintype ι] {α : ι → Type*} [∀ i, MeasurableSpace (α i)]
  {P : ∀ i, Measure (α i)} [∀ i, IsProbabilityMeasure (P i)]

/-- 5.2: tensorization of quadratic transport-entropy inequalities with coordinatewise costs. -/
theorem sum_sq_transport_pi_le [∀ i, StandardBorelSpace (α i)] {w : ∀ i, α i → α i → ℝ≥0∞}
    (hw : ∀ i, Measurable (Function.uncurry (w i))) {C : ℝ≥0∞}
    (h : ∀ i (ν : Measure (α i)), IsProbabilityMeasure ν →
      ⨅ (π : Measure (α i × α i)) (_ : TauCeti.IsCoupling π (P i) ν),
        C * (∫⁻ z, w i z.1 z.2 ∂π) ^ 2 ≤ klDiv ν (P i))
    (Q : Measure (∀ i, α i)) [IsProbabilityMeasure Q] :
    ⨅ (π : Measure ((∀ i, α i) × (∀ i, α i))) (_ : TauCeti.IsCoupling π (Measure.pi P) Q),
      C * ∑ i, (∫⁻ z, w i (z.1 i) (z.2 i) ∂π) ^ 2 ≤ klDiv Q (Measure.pi P) := by
  sorry

/-- 5.2: Marton's transportation inequality. -/
theorem marton [∀ i, StandardBorelSpace (α i)] (Q : Measure (∀ i, α i)) [IsProbabilityMeasure Q] :
    ⨅ (π : Measure ((∀ i, α i) × (∀ i, α i))) (_ : TauCeti.IsCoupling π (Measure.pi P) Q),
      ∑ i, π {z | z.1 i ≠ z.2 i} ^ 2 ≤ klDiv Q (Measure.pi P) / 2 := by
  sorry

/-- 5.3: Talagrand's convex distance from `x` to `A`: the supremum, over nonnegative weights `a`
with `∑ a i² ≤ 1`, of the weighted Hamming distance from `x` to `A`. It is `∞` for `A = ∅`. -/
def convexDistance {ι : Type*} [Fintype ι] {α : ι → Type*} (A : Set (∀ i, α i))
    (x : ∀ i, α i) : ℝ≥0∞ :=
  ⨆ (a : ι → ℝ≥0) (_ : ∑ i, a i ^ 2 ≤ 1), ⨅ y ∈ A, ∑ i, if x i = y i then 0 else (a i : ℝ≥0∞)

/-- 5.3: the convex distance is the Euclidean distance from `0` to the convex hull of the
disagreement patterns `(1{x i ≠ y i})ᵢ`, `y ∈ A`. -/
theorem convexDistance_eq_infDist_convexHull {ι : Type*} [Fintype ι] {α : ι → Type*}
    {A : Set (∀ i, α i)} (hA : A.Nonempty) (x : ∀ i, α i) :
    convexDistance A x = ENNReal.ofReal (Metric.infDist (0 : EuclideanSpace ℝ ι)
      (convexHull ℝ
        ((fun y ↦ WithLp.toLp 2 (fun i ↦ if x i = y i then (0 : ℝ) else 1)) '' A))) := by
  sorry

/-- 5.3: the one-variable inequality behind Talagrand's induction. Auxiliary: a step of the
route of 5.3, stated because it is a theorem of its own. -/
theorem exists_exp_mul_rpow_le {u : ℝ} (hu0 : 0 < u) (hu1 : u ≤ 1) :
    ∃ θ ∈ Icc (0 : ℝ) 1, Real.exp ((1 - θ) ^ 2 / 4) * u ^ (-θ) ≤ 2 - u := by
  sorry

/-- 5.3: Talagrand's convex distance inequality, exponential-integral form. -/
theorem measure_mul_lintegral_exp_convexDistance_sq_le [∀ i, StandardBorelSpace (α i)]
    {A : Set (∀ i, α i)} (hA : MeasurableSet A) :
    Measure.pi P A * ∫⁻ x, ENNReal.ofReal (Real.exp ((convexDistance A x).toReal ^ 2 / 4))
      ∂(Measure.pi P) ≤ 1 := by
  sorry

/-- 5.3: Talagrand's convex distance inequality, tail form. -/
theorem measure_mul_measure_le_convexDistance_le [∀ i, StandardBorelSpace (α i)]
    {A : Set (∀ i, α i)} (hA : MeasurableSet A) {t : ℝ} (ht : 0 ≤ t) :
    Measure.pi P A * Measure.pi P {x | ENNReal.ofReal t ≤ convexDistance A x} ≤
      ENNReal.ofReal (Real.exp (-(t ^ 2 / 4))) := by
  sorry

end Transport

/-! ## Layer 6: suprema of empirical processes -/

section Suprema

variable {T : Type*} [Fintype T] [Nonempty T]

/-- 6.1: Bousquet's elementary inequality, in cross-multiplied form: for `β ≥ 0`, `t ≥ 0` and
`x ≤ 1`, `φ (-t x) / φ (-t) ≤ (x + (β x² - x) e^{-t x}) / (1 + (β - 1) e^{-t})` with
`φ (u) = exp u - u - 1`. Auxiliary: a step of the route of 6.3, stated because it is a theorem
of its own. -/
theorem phi_neg_mul_le {β t x : ℝ} (hβ : 0 ≤ β) (ht : 0 ≤ t) (hx : x ≤ 1) :
    (Real.exp (-(t * x)) + t * x - 1) * (1 + (β - 1) * Real.exp (-t)) ≤
      (x + (β * x ^ 2 - x) * Real.exp (-(t * x))) * (Real.exp (-t) + t - 1) := by
  sorry

/-- 6.2: a Bernstein-type inequality for the supremum `Z = max_s ∑ᵢ xᵢ(s)` of a bounded centred
empirical process over a finite index set: `Z - E Z` is sub-gamma with variance factor
`2 (Σ² + σ²)` and scale parameter `2`, where `Σ² = E max_s ∑ᵢ xᵢ(s)²` and
`σ² = max_s ∑ᵢ E xᵢ(s)²`. -/
theorem hasSubgammaMGF_sup_sum {n : ℕ} {Q : Fin n → Measure (T → ℝ)}
    [∀ i, IsProbabilityMeasure (Q i)] (hmean : ∀ i s, ∫ y, y s ∂(Q i) = 0)
    (hbdd : ∀ i, ∀ᵐ y ∂(Q i), ∀ s, |y s| ≤ 1) :
    HasSubgammaMGF
      (fun x ↦ Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i, x i s) -
        ∫ x', Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i, x' i s) ∂(Measure.pi Q))
      (2 * ((∫ x, Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i, x i s ^ 2)
          ∂(Measure.pi Q)) +
        Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i, ∫ y, y s ^ 2 ∂(Q i)))).toNNReal
      2 (Measure.pi Q) := by
  sorry

/-- 6.3: Bousquet's inequality, moment generating function: for i.i.d. centred coordinates bounded
above by `1`, `log E exp (t (Z - E Z)) ≤ v φ (t)` with `v = 2 E Z + σ²`, `σ² = n max_s E y(s)²`. -/
theorem bousquet_mgf_le {n : ℕ} {Q : Measure (T → ℝ)} [IsProbabilityMeasure Q]
    (hmean : ∀ s, ∫ y, y s ∂Q = 0) (hle : ∀ᵐ y ∂Q, ∀ s, y s ≤ 1)
    (hL2 : ∀ s, MemLp (fun y ↦ y s) 2 Q) {t : ℝ} (ht : 0 ≤ t) :
    mgf (fun x ↦ Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i : Fin n, x i s) -
        ∫ x', Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i : Fin n, x' i s)
          ∂(Measure.pi fun _ : Fin n ↦ Q)) (Measure.pi fun _ : Fin n ↦ Q) t ≤
      Real.exp ((2 * ∫ x', Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i : Fin n, x' i s)
          ∂(Measure.pi fun _ : Fin n ↦ Q) +
        n * Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∫ y, y s ^ 2 ∂Q)) *
        (Real.exp t - t - 1)) := by
  sorry

/-- 6.3: Bousquet's inequality, tail form `P(Z ≥ E Z + ε) ≤ exp (-v h (ε / v))`. -/
theorem bousquet_measureReal_ge_le {n : ℕ} {Q : Measure (T → ℝ)} [IsProbabilityMeasure Q]
    (hmean : ∀ s, ∫ y, y s ∂Q = 0) (hle : ∀ᵐ y ∂Q, ∀ s, y s ≤ 1)
    (hL2 : ∀ s, MemLp (fun y ↦ y s) 2 Q) {ε : ℝ} (hε : 0 ≤ ε) :
    (Measure.pi fun _ : Fin n ↦ Q).real
        {x | ∫ x', Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i : Fin n, x' i s)
            ∂(Measure.pi fun _ : Fin n ↦ Q) + ε ≤
          Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∑ i : Fin n, x i s)} ≤
      Real.exp (-((2 * ∫ x', Finset.univ.sup' Finset.univ_nonempty
            (fun s ↦ ∑ i : Fin n, x' i s) ∂(Measure.pi fun _ : Fin n ↦ Q) +
          n * Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∫ y, y s ^ 2 ∂Q)) *
        bennettH (ε / (2 * ∫ x', Finset.univ.sup' Finset.univ_nonempty
            (fun s ↦ ∑ i : Fin n, x' i s) ∂(Measure.pi fun _ : Fin n ↦ Q) +
          n * Finset.univ.sup' Finset.univ_nonempty (fun s ↦ ∫ y, y s ^ 2 ∂Q))))) := by
  sorry

end Suprema

/-! ## Layer 7: martingales and independent sums in normed spaces -/

section Sums

variable {Ω : Type*} {mΩ : MeasurableSpace Ω} {μ : Measure Ω}

/-- 7.1: Freedman's inequality in the form of Bercu–Delyon–Rio, Theorem 3.10, (3.31), with
`b x / 3`: for martingale differences
`Y (k + 1)` bounded above by `b`, the sum `M_n` and the predictable quadratic variation
`⟨M⟩_n = ∑ E[Y (k + 1)² | ℱ k]` satisfy
`P(M_n ≥ x, ⟨M⟩_n ≤ y) ≤ exp (-x² / (2 (y + b x / 3)))`. -/
theorem freedman [IsProbabilityMeasure μ] {ℱ : Filtration ℕ mΩ} {Y : ℕ → Ω → ℝ}
    (hY : StronglyAdapted ℱ Y) (hL2 : ∀ k, MemLp (Y (k + 1)) 2 μ)
    (hmean : ∀ k, μ[Y (k + 1) | ℱ k] =ᵐ[μ] 0) {b : ℝ}
    (hle : ∀ k, ∀ᵐ ω ∂μ, Y (k + 1) ω ≤ b) (n : ℕ) {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) :
    μ.real {ω | x ≤ ∑ k ∈ Finset.range n, Y (k + 1) ω ∧
        ∑ k ∈ Finset.range n, μ[fun ω' ↦ Y (k + 1) ω' ^ 2 | ℱ k] ω ≤ y} ≤
      Real.exp (-(x ^ 2 / (2 * (y + b * x / 3)))) := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [MeasurableSpace E] [BorelSpace E]
  [SecondCountableTopology E]

/-- 7.2: Lévy's inequalities for independent symmetric summands:
`P(max_{k ≤ N} ‖S_k‖ > t) ≤ 2 P(‖S_N‖ > t)` and `P(max_{i < N} ‖X_i‖ > t) ≤ 2 P(‖S_N‖ > t)`. -/
theorem levy {X : ℕ → Ω → E} (hX : ∀ i, Measurable (X i)) (h_indep : iIndepFun X μ)
    (hsymm : ∀ i, μ.map (fun ω ↦ -X i ω) = μ.map (X i)) (N : ℕ) (t : ℝ≥0) :
    μ {ω | t < (Finset.range (N + 1)).sup fun k ↦ ‖∑ i ∈ Finset.range k, X i ω‖₊} ≤
        2 * μ {ω | t < ‖∑ i ∈ Finset.range N, X i ω‖₊} ∧
      μ {ω | t < (Finset.range N).sup fun i ↦ ‖X i ω‖₊} ≤
        2 * μ {ω | t < ‖∑ i ∈ Finset.range N, X i ω‖₊} := by
  sorry

/-- 7.3: the Hoffmann-Jørgensen inequality for independent summands. -/
theorem hoffmannJorgensen {X : ℕ → Ω → E} (hX : ∀ i, Measurable (X i))
    (h_indep : iIndepFun X μ) (N : ℕ) (s t : ℝ≥0) :
    μ {ω | 3 * t + s < (Finset.range (N + 1)).sup fun k ↦ ‖∑ i ∈ Finset.range k, X i ω‖₊} ≤
      μ {ω | t < (Finset.range (N + 1)).sup fun k ↦ ‖∑ i ∈ Finset.range k, X i ω‖₊} ^ 2 +
        μ {ω | s < (Finset.range N).sup fun i ↦ ‖X i ω‖₊} := by
  sorry

/-- 7.3: the Hoffmann-Jørgensen inequality for independent symmetric summands. -/
theorem hoffmannJorgensen_symmetric {X : ℕ → Ω → E} (hX : ∀ i, Measurable (X i))
    (h_indep : iIndepFun X μ) (hsymm : ∀ i, μ.map (fun ω ↦ -X i ω) = μ.map (X i)) (N : ℕ)
    (s t : ℝ≥0) :
    μ {ω | 2 * t + s < ‖∑ i ∈ Finset.range N, X i ω‖₊} ≤
      4 * μ {ω | t < ‖∑ i ∈ Finset.range N, X i ω‖₊} ^ 2 +
        μ {ω | s < (Finset.range N).sup fun i ↦ ‖X i ω‖₊} := by
  sorry

/-- 7.3: the Hoffmann-Jørgensen moment inequality: with
`t₀ = inf {t > 0 | P(max_k ‖S_k‖ > t) ≤ (2 · 4^p)⁻¹}`,
`E max_k ‖S_k‖^p ≤ 2 · 4^p E max_i ‖X_i‖^p + 2 (4 t₀)^p`. -/
theorem hoffmannJorgensen_lintegral_rpow_le {X : ℕ → Ω → E} (hX : ∀ i, Measurable (X i))
    (h_indep : iIndepFun X μ) (N : ℕ) {p : ℝ} (hp : 0 < p) :
    ∫⁻ ω, (((Finset.range (N + 1)).sup fun k ↦ ‖∑ i ∈ Finset.range k, X i ω‖₊ : ℝ≥0) : ℝ≥0∞) ^ p
        ∂μ ≤
      2 * 4 ^ p * ∫⁻ ω, (((Finset.range N).sup fun i ↦ ‖X i ω‖₊ : ℝ≥0) : ℝ≥0∞) ^ p ∂μ +
        2 * (4 * sInf {t : ℝ≥0∞ | 0 < t ∧ μ {ω | t <
          (((Finset.range (N + 1)).sup fun k ↦ ‖∑ i ∈ Finset.range k, X i ω‖₊ : ℝ≥0) : ℝ≥0∞)} ≤
            (2 * 4 ^ p)⁻¹}) ^ p := by
  sorry

end Sums

/-! ## Library declarations consumed -/

#check @ProbabilityTheory.HasSubgaussianMGF
#check @ProbabilityTheory.HasSubgaussianMGF.measure_ge_le
#check @ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun
#check @ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
#check @ProbabilityTheory.mgf
#check @ProbabilityTheory.iIndepFun.mgf_sum
#check @ProbabilityTheory.gammaMeasure
#check @ProbabilityTheory.variance
#check @ProbabilityTheory.evariance
#check @MeasureTheory.Measure.pi
#check @MeasureTheory.Measure.withDensity
#check @MeasureTheory.etvDist
#check @InformationTheory.klDiv
#check @InformationTheory.klDiv_eq_zero_iff
#check @StrictConvexOn.ae_eq_const_or_map_average_lt
#check @ConvexOn.map_integral_le
#check @Real.strictConvexOn_mul_log
#check @image_le_of_deriv_right_le_deriv_boundary
#check @MeasureTheory.Filtration
#check @MeasureTheory.StronglyAdapted
#check @MeasureTheory.condExp
#check @convexHull
#check @Metric.infDist
#check @ENNReal.lintegral_mul_le_Lp_mul_Lq
#check @ProbabilityTheory.hasDerivAt_mgf
#check @MeasureTheory.Measure.measurePreserving_swap
#check @MeasureTheory.condExp_mul_of_stronglyMeasurable_left
#check @MeasureTheory.integral_condExp
#check @MeasureTheory.condExp_mono
#check @TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences
#check @ProbabilityTheory.iIndepFun.mgf_sum_le_exp_of_ae_le
#check @ProbabilityTheory.iIndepFun.measureReal_sum_ge_le_of_ae_le
#check @TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv
#check @TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp
#check @MeasureTheory.Measure.tilted
#check @TauCeti.etvDist_sq_le_two_mul_klDiv
#check @TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel
#check @TauCeti.IsCoupling
#check @TauCeti.wassersteinEDist
#check @TauCeti.HasFiniteMoment
#check @TauCeti.HasFiniteMoment.integrable_of_lipschitzWith
#check @TauCeti.ofReal_integral_sub_integral_le_wassersteinEDist_one
#check @TauCeti.wassersteinEDist_one_eq_iSup

end TauCetiRoadmap.EntropyMethodAndProductConcentration
