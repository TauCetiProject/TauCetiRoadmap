import Mathlib
import TauCeti.Combinatorics.Enumerative.PerfectMatching
import TauCeti.MeasureTheory.Measure.SymmetricMatrix.Correlation
import TauCeti.Probability.Distributions.LKJ.Normalizer
import TauCeti.Probability.Distributions.Stable.Basic
import TauCeti.Probability.Distributions.Stable.Exponent
import TauCeti.Probability.Distributions.Stable.Tails
import TauCeti.Probability.Distributions.Wishart.Basic

/-!
# Standard probability distributions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib and
Tau Ceti, the headline theorems of the roadmap that the pinned libraries do not prove, each with
`sorry`, and the one definition they need, the LKJ law.

The headline theorems of the roadmap are the following. Those the pinned libraries already prove are
named in the README's supplier contracts and are not restated here: Gaussian conditioning for every
positive semidefinite covariance (§5.4), the Wishart density, its identification with the
Gaussian-Gram law and the Bartlett decomposition (§6.4–§6.5), the existence of the stable laws with
their characteristic function and density (§15.2–§15.4), and the elementary theory of the scalar,
discrete, multivariate and circular families of Layers 0–13. The others are stated below:

* the Wick–Isserlis formula for Gaussian mixed moments of every even degree (§5.3);
* the exact almost-sure rank of the Gaussian-Gram Wishart law (§6.4);
* the LKJ normalization, the LKJ law, its normalization, its Beta entry marginals, the independence
  of its partial correlations and its determinant moments (§14.2–§14.3);
* the exact support, the moment threshold, the tail constants and the exponential-integrability
  domain of the scalar stable laws (§15.4–§15.6).

Every headline theorem of the roadmap is statable at the pins.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.StandardDistributions

/-! ## Layer 5: multivariate distributions -/

/-- **Wick–Isserlis formula** (§5.3). Let `Z` have the Gaussian law `N(m, S)` on
`EuclideanSpace ℝ ι` with `S` positive semidefinite, and let the positions `κ` be a finite linearly
ordered type with an index map `j : κ → ι`. The centred mixed moment
`E[∏ₖ (Z_(j k) − m_(j k))]` is the sum, over the perfect matchings `π` of the positions, of the
products of the covariances `S_(j k, j (π k))` over the pairs `{k, π k}` (each pair counted once,
at its smaller position). For an odd number of positions there is no perfect matching and the
moment vanishes; for no positions it is `1`. -/
theorem integral_prod_sub_multivariateGaussian_eq_sum_perfectMatching
    {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [LinearOrder κ]
    (m : EuclideanSpace ℝ ι) {S : Matrix ι ι ℝ} (hS : S.PosSemidef) (j : κ → ι) :
    ∫ x, ∏ k, (x (j k) - m (j k)) ∂multivariateGaussian m S =
      ∑ π : TauCeti.PerfectMatching κ,
        ∏ k ∈ Finset.univ.filter (fun k => k < π.val k), S (j k) (j (π.val k)) := by
  sorry

/-! ## Layer 6: symmetric matrices and Wishart distributions -/

/-- **Rank of the Gaussian-Gram Wishart law** (§6.4). For `S` positive semidefinite and every
natural `ν`, the sum of `ν` outer products of independent `N(0, S)` vectors has rank exactly
`min ν (rank S)` almost surely. -/
theorem ae_rank_wishartGramMeasure {p ν : ℕ} {S : Matrix (Fin p) (Fin p) ℝ}
    (hS : S.PosSemidef) :
    ∀ᵐ A : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))
        ∂TauCeti.Probability.wishartGramMeasure ν S,
      (A : Matrix (Fin p) (Fin p) ℝ).rank = min ν S.rank := by
  sorry

/-! ## Layer 14: LKJ correlation-matrix laws -/

/-- **LKJ normalization** (§14.2). For `η > 0`, the integral of `(det R)^(η − 1)` over the
positive-definite `p × p` correlation matrices, against the correlation-coordinate reference
measure `TauCeti.correlationLebesgue p`, is the LKJ normalizer
`Z_p(η) = ∏_(k=1)^(p−1) B(1/2, η + (k − 1)/2)^k`. -/
theorem setIntegral_rpow_det_correlationLebesgue (p : ℕ) {η : ℝ} (hη : 0 < η) :
    ∫ R in {R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) |
        (R : Matrix (Fin p) (Fin p) ℝ).PosDef},
      (R : Matrix (Fin p) (Fin p) ℝ).det ^ (η - 1) ∂TauCeti.correlationLebesgue p =
      TauCeti.Probability.lkjNormalizer p η := by
  sorry

/-- The **LKJ law** of dimension `p` and shape `η` on symmetric `p × p` matrices (§14.3). For
`η > 0` it has density `(det R)^(η − 1) / Z_p(η)` on the positive-definite matrices, and zero
elsewhere, with respect to `TauCeti.correlationLebesgue p`; for `η ≤ 0` it is the zero measure. -/
def lkjMeasure (p : ℕ) (η : ℝ) : Measure (selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) :=
  if 0 < η then
    (TauCeti.correlationLebesgue p).withDensity
      ({R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) |
          (R : Matrix (Fin p) (Fin p) ℝ).PosDef}.indicator
        fun R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) =>
        ENNReal.ofReal ((R : Matrix (Fin p) (Fin p) ℝ).det ^ (η - 1) /
          TauCeti.Probability.lkjNormalizer p η))
  else 0

/-- For `η > 0` the LKJ law is a probability measure (§14.3). -/
theorem isProbabilityMeasure_lkjMeasure (p : ℕ) {η : ℝ} (hη : 0 < η) :
    IsProbabilityMeasure (lkjMeasure p η) := by
  sorry

/-- **Entry marginals of the LKJ law** (§14.3). For `η > 0` and `i ≠ j`, the rescaled entry
`(R_ij + 1)/2` has the Beta law `Beta(α, α)` with `α = η + (p − 2)/2`. -/
theorem lkjMeasure_entry_beta {p : ℕ} {η : ℝ} (hη : 0 < η) (i j : Fin p) (hij : i ≠ j) :
    (lkjMeasure p η).map
        (fun R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) =>
          ((R : Matrix (Fin p) (Fin p) ℝ) i j + 1) / 2) =
      betaMeasure (η + ((p : ℝ) - 2) / 2) (η + ((p : ℝ) - 2) / 2) := by
  sorry

/-- **Independence of the LKJ partial correlations** (§14.3). For `η > 0`, the partial
correlations `z_ij` of an LKJ matrix, read off its Cholesky factor, are independent, and
`(z_ij + 1)/2` has the Beta law `Beta(β, β)` with `β = η + (p − j − 1)/2` for the one-based column
`j`, that is `β = η + (p − c − 2)/2` for the zero-based column `c`. -/
theorem map_partialCorrelation_lkjMeasure {p : ℕ} {η : ℝ} (hη : 0 < η) :
    (lkjMeasure p η).map (fun (R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ))) ij =>
        (TauCeti.partialCorrelationOfCorrelationCoordinates
          (TauCeti.correlationCoordinates p R) ij + 1) / 2) =
      Measure.pi fun ij : TauCeti.strictLowerTriangle p =>
        betaMeasure (η + ((p : ℝ) - ((ij.1.2 : ℕ) : ℝ) - 2) / 2)
          (η + ((p : ℝ) - ((ij.1.2 : ℕ) : ℝ) - 2) / 2) := by
  sorry

/-- **Determinant moments of the LKJ law: threshold** (§14.3). For `p ≥ 2` and `η > 0`,
`(det R)^q` is integrable exactly when `q > −η`. -/
theorem integrable_rpow_det_lkjMeasure_iff {p : ℕ} (hp : 2 ≤ p) {η : ℝ} (hη : 0 < η) (q : ℝ) :
    Integrable (fun R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)) =>
      (R : Matrix (Fin p) (Fin p) ℝ).det ^ q) (lkjMeasure p η) ↔ -η < q := by
  sorry

/-- **Determinant moments of the LKJ law: value** (§14.3). For `η > 0` and `q > −η`,
`E[(det R)^q] = Z_p(η + q) / Z_p(η)`; at `p = 0, 1` both sides are `1`. -/
theorem integral_rpow_det_lkjMeasure {p : ℕ} {η q : ℝ} (hη : 0 < η) (hq : -η < q) :
    ∫ R : ↥(selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)),
        (R : Matrix (Fin p) (Fin p) ℝ).det ^ q ∂lkjMeasure p η =
      TauCeti.Probability.lkjNormalizer p (η + q) / TauCeti.Probability.lkjNormalizer p η := by
  sorry

/-! ## Layer 15: scalar stable laws -/

/-- **Exact support of the stable laws** (§15.4). For valid shapes `0 < α ≤ 2`, `|β| ≤ 1` and scale
`s > 0`, the topological support of `S₀(α, β, s, m)` is `[d, ∞)` when `α < 1` and `β = 1`,
`(−∞, d]` when `α < 1` and `β = −1`, and `ℝ` otherwise, where `d` is the `S₁` location. -/
theorem support_stableMeasure {α β : ℝ} (hα : α ∈ Ioc 0 2) (hβ : |β| ≤ 1) {s : ℝ≥0}
    (hs : 0 < s) (m : ℝ) :
    (TauCeti.Probability.stableMeasure α β s m).support =
      if α < 1 ∧ β = 1 then Ici (TauCeti.Probability.stableS1Location α β s m)
      else if α < 1 ∧ β = -1 then Iic (TauCeti.Probability.stableS1Location α β s m)
      else univ := by
  sorry

/-- **Moment threshold of the stable laws** (§15.5). For `0 < α < 2`, `|β| ≤ 1`, `s > 0` and
`q > 0`, `|x|^q` is integrable exactly when `q < α`. -/
theorem integrable_rpow_abs_stableMeasure_iff {α β q : ℝ} (hα : α ∈ Ioo 0 2) (hβ : |β| ≤ 1)
    {s : ℝ≥0} (hs : 0 < s) (m : ℝ) (hq : 0 < q) :
    Integrable (fun x => |x| ^ q) (TauCeti.Probability.stableMeasure α β s m) ↔ q < α := by
  sorry

/-- **Right tail of the stable laws** (§15.5). For `0 < α < 2`, `|β| ≤ 1` and `s > 0`,
`x^α μ((x, ∞)) → C_α s^α (1 + β)` as `x → ∞`, with `C_α = Γ(α) sin(πα/2)/π`. -/
theorem tendsto_rpow_mul_stableMeasure_Ioi {α β : ℝ} (hα : α ∈ Ioo 0 2) (hβ : |β| ≤ 1)
    {s : ℝ≥0} (hs : 0 < s) (m : ℝ) :
    Tendsto (fun x : ℝ => x ^ α * (TauCeti.Probability.stableMeasure α β s m).real (Ioi x))
      atTop (𝓝 (TauCeti.Probability.stableTailConstant α * (s : ℝ) ^ α * (1 + β))) := by
  sorry

/-- **Left tail of the stable laws** (§15.5). For `0 < α < 2`, `|β| ≤ 1` and `s > 0`,
`x^α μ((−∞, −x)) → C_α s^α (1 − β)` as `x → ∞`. -/
theorem tendsto_rpow_mul_stableMeasure_Iio {α β : ℝ} (hα : α ∈ Ioo 0 2) (hβ : |β| ≤ 1)
    {s : ℝ≥0} (hs : 0 < s) (m : ℝ) :
    Tendsto (fun x : ℝ => x ^ α * (TauCeti.Probability.stableMeasure α β s m).real (Iio (-x)))
      atTop (𝓝 (TauCeti.Probability.stableTailConstant α * (s : ℝ) ^ α * (1 - β))) := by
  sorry

/-- **Exponential integrability of the stable laws** (§15.6). For valid shapes, the exact set of
`t` with `exp (t x)` integrable is `ℝ` when `s = 0` or `α = 2`, `(−∞, 0]` when `β = 1`, `[0, ∞)`
when `β = −1`, and `{0}` otherwise. -/
theorem integrableExpSet_stableMeasure {α β : ℝ} (hα : α ∈ Ioc 0 2) (hβ : |β| ≤ 1)
    (s : ℝ≥0) (m : ℝ) :
    integrableExpSet id (TauCeti.Probability.stableMeasure α β s m) =
      if s = 0 ∨ α = 2 then univ
      else if β = 1 then Iic 0
      else if β = -1 then Ici 0
      else {0} := by
  sorry

end TauCetiRoadmap.StandardDistributions
