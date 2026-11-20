import Mathlib

/-!
# Logarithmic Sobolev inequalities for finite Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

The definitions `dirichletForm` and `spectralGap` are verbatim copies of the definitions of
MarkovChainMixing 2.4, made in this namespace because a roadmap's file
cannot import another roadmap's module.

Suppliers used by the statements: Mathlib `Kernel.IsReversible`, `Kernel.const`,
`Kernel.ofFunOfCountable`, `Measure.pi`, `Measure.map`, `Function.update`, `variance`,
`NormedSpace.exp` and `Real.log`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset
open scoped NNReal ENNReal Matrix

namespace TauCetiRoadmap.LogSobolevForMarkovChains

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-! ## Layer 1: entropy, the logarithmic Sobolev constant and the spectral gap -/

/-- 1.1 (copied verbatim from MarkovChainMixing 2.4): the Dirichlet form
`E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, {y})`. -/
def dirichletForm [Fintype S] (κ : Kernel S S) (π : Measure S) (f : S → ℝ) : ℝ :=
  2⁻¹ * ∑ x, ∑ y, (f x - f y) ^ 2 * π.real {x} * (κ x).real {y}

/-- 1.1 (copied verbatim from MarkovChainMixing 2.4): the spectral gap `γ`, the infimum of
`E(f) / Var_π(f)` over the functions of nonzero variance, and `0` if there is none. -/
def spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // Var[f; π] ≠ 0}, dirichletForm κ π f / Var[f; π]

/-- 1.1: the entropy `Ent_π(g) = Σ_x π(x) g(x) log g(x) − m log m` of a function `g`, where
`m = Σ_x π(x) g(x)`; it is applied to `g = f²`. -/
def funEntropy [Fintype S] (π : Measure S) (g : S → ℝ) : ℝ :=
  ∑ x, π.real {x} * (g x * Real.log (g x)) -
    (∑ x, π.real {x} * g x) * Real.log (∑ x, π.real {x} * g x)

/-- 1.2: the logarithmic Sobolev constant `α`, the infimum of `E(f) / Ent_π(f²)` over the
functions with `Ent_π(f²) ≠ 0`, and `0` if there is none. -/
def logSobolevConstant [Fintype S] (κ : Kernel S S) (π : Measure S) : ℝ :=
  ⨅ f : {f : S → ℝ // funEntropy π (f ^ 2) ≠ 0}, dirichletForm κ π f / funEntropy π (f ^ 2)

/-- 1.2: the logarithmic Sobolev constant is at most half the spectral gap, for every kernel and
every probability measure. -/
theorem two_mul_logSobolevConstant_le_spectralGap [Fintype S] (κ : Kernel S S) (π : Measure S)
    [IsProbabilityMeasure π] :
    2 * logSobolevConstant κ π ≤ spectralGap κ π :=
  sorry

/-! ## Layer 2: the two-point constant and tensorization -/

/-- 2.1: the two-point constant `(1 − 2p) / log ((1 − p) / p)`, with its limit `1/2` at
`p = 1/2`. -/
def twoPointConstant (p : ℝ) : ℝ :=
  if p = 1 / 2 then 1 / 2 else (1 - 2 * p) / Real.log ((1 - p) / p)

/-- 2.1: the two-point space. For every kernel `κ` and every probability measure `π` on `Bool`,
the logarithmic Sobolev constant is `(π₀ κ(0, 1) + π₁ κ(1, 0)) / (2 π₀ π₁)` times the two-point
constant of `π₀`, where `π₀ = π {false}` and `π₁ = π {true}`; for a point mass both sides are
`0`. -/
theorem logSobolevConstant_bool (κ : Kernel Bool Bool) (π : Measure Bool) [IsProbabilityMeasure π] :
    logSobolevConstant κ π =
      (π.real {false} * (κ false).real {true} + π.real {true} * (κ true).real {false}) /
        (2 * π.real {false} * π.real {true}) * twoPointConstant (π.real {false}) :=
  sorry

/-- 2.2: the chain that redraws from `π` at every step has logarithmic Sobolev constant equal to
the two-point constant of the least mass of `π`, for a positive law `π`. -/
theorem logSobolevConstant_const [Fintype S] [Nonempty S] (π : Measure S) [IsProbabilityMeasure π]
    (hpos : ∀ x, 0 < π {x}) :
    logSobolevConstant (Kernel.const S π) π =
      twoPointConstant (univ.inf' univ_nonempty fun x ↦ π.real {x}) :=
  sorry

/-- 2.2: `α ≥ c(π_min) γ`, with `c` the two-point constant, for every kernel and every
probability measure. -/
theorem twoPointConstant_mul_spectralGap_le [Fintype S] [Nonempty S] (κ : Kernel S S)
    (π : Measure S) [IsProbabilityMeasure π] :
    twoPointConstant (univ.inf' univ_nonempty fun x ↦ π.real {x}) * spectralGap κ π ≤
      logSobolevConstant κ π :=
  sorry

section Product

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {T : ι → Type*} [∀ i, Fintype (T i)]
  [∀ i, MeasurableSpace (T i)] [∀ i, MeasurableSingletonClass (T i)]

/-- 2.3: the product chain with weights `w`: coordinate `i` is chosen with probability `w i` and
moved by `κ i`, the other coordinates staying put (a Markov kernel when the weights sum to `1`). -/
def coordinateKernel (w : ι → ℝ≥0) (κ : ∀ i, Kernel (T i) (T i)) :
    Kernel (∀ i, T i) (∀ i, T i) :=
  Kernel.ofFunOfCountable fun x ↦ ∑ i, (w i : ℝ≥0∞) • (κ i (x i)).map (Function.update x i)

/-- 2.3: tensorization. If no factor law is a point mass, the logarithmic Sobolev constant of the
product chain for the product law is the least of the numbers `w i · α(κ i, π i)`; the weights
need not sum to `1`. -/
theorem logSobolevConstant_coordinateKernel (w : ι → ℝ≥0)
    (κ : ∀ i, Kernel (T i) (T i)) [∀ i, IsMarkovKernel (κ i)] (π : ∀ i, Measure (T i))
    [∀ i, IsProbabilityMeasure (π i)] (hπ : ∀ i x, (π i).real {x} < 1) :
    logSobolevConstant (coordinateKernel w κ) (Measure.pi π) =
      ⨅ i, (w i : ℝ) * logSobolevConstant (κ i) (π i) :=
  sorry

end Product

/-! ## Layer 3: hypercontractivity and mixing in continuous time -/

/-- 3.1: the continuous-time semigroup `H_t = exp(t (P − I))` of the chain, where
`P x y = κ x {y}` is the transition matrix. -/
def heatSemigroup [Fintype S] [DecidableEq S] (κ : Kernel S S) (t : ℝ) : Matrix S S ℝ :=
  NormedSpace.exp (t • (Matrix.of (fun x y ↦ (κ x).real {y}) - 1))

/-- 3.1: the norm `‖f‖_q = (Σ_x π(x) |f x|^q)^(1/q)` of `L^q(π)`. -/
def weightedLpNorm [Fintype S] (π : Measure S) (q : ℝ) (f : S → ℝ) : ℝ :=
  (∑ x, π.real {x} * |f x| ^ q) ^ (1 / q)

/-- 3.2: Gross's theorem. For a reversible chain with a positive stationary law on at least two
states and a real `c`, `‖H_t f‖_q ≤ ‖f‖_2` for all `t ≥ 0`, all `q ≥ 2` with
`q − 1 ≤ exp (4 c t)` and all `f`, exactly when `c ≤ α`. -/
theorem forall_weightedLpNorm_heatSemigroup_le_iff [Fintype S] [DecidableEq S] [Nontrivial S]
    (κ : Kernel S S) [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π]
    (hrev : κ.IsReversible π) (hpos : ∀ x, 0 < π {x}) (c : ℝ) :
    (∀ t : ℝ, 0 ≤ t → ∀ q : ℝ, 2 ≤ q → q - 1 ≤ Real.exp (4 * c * t) → ∀ f : S → ℝ,
        weightedLpNorm π q (heatSemigroup κ t *ᵥ f) ≤ weightedLpNorm π 2 f) ↔
      c ≤ logSobolevConstant κ π :=
  sorry

/-- 3.3: the mixing bound. For a reversible chain with a positive stationary law and `α > 0`, a
state `x` with `π(x) ≤ e⁻¹`, `c ≥ 0` and
`t ≥ log (log (1 / π(x))) / (4 α) + c / γ`, the `L²` distance satisfies
`Σ_y π(y) (H_t(x, y) / π(y) − 1)² ≤ e^(2 (1 − c))` and the total variation distance
`½ Σ_y |H_t(x, y) − π(y)|` is at most `e^(1 − c) / 2`. -/
theorem sum_abs_heatSemigroup_sub_le [Fintype S] [DecidableEq S] (κ : Kernel S S)
    [IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π] (hrev : κ.IsReversible π)
    (hpos : ∀ x, 0 < π {x}) (hα : 0 < logSobolevConstant κ π) (x : S)
    (hx : π.real {x} ≤ Real.exp (-1)) {c : ℝ} (hc : 0 ≤ c) {t : ℝ}
    (ht : Real.log (Real.log (1 / π.real {x})) / (4 * logSobolevConstant κ π) +
      c / spectralGap κ π ≤ t) :
    (∑ y, π.real {y} * (heatSemigroup κ t x y / π.real {y} - 1) ^ 2 ≤
        Real.exp (2 * (1 - c))) ∧
      (∑ y, |heatSemigroup κ t x y - π.real {y}|) / 2 ≤ Real.exp (1 - c) / 2 :=
  sorry

end TauCetiRoadmap.LogSobolevForMarkovChains
