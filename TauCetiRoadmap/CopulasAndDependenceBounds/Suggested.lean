import Mathlib
import TauCeti.Probability.Quantile

/-!
# Copulas and dependence bounds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib and Tau Ceti, with the few definitions they need: every
statement is a `sorry`-bodied theorem and every definition has a real body.

A random vector is a probability measure `ν` on `ι → ℝ` for a finite index type `ι`, with the
product σ-algebra and the coordinatewise order, so that `Set.Iic x` is the lower orthant
`{y | ∀ i, y i ≤ x i}` and `ν.real (Set.Iic x)` is the joint distribution function. The `i`-th
margin is the image law `ν.map (fun y ↦ y i)` and its distribution function is Mathlib's
`ProbabilityTheory.cdf`. A copula is a law on `ι → ℝ` whose margins are all the uniform law on
`[0, 1]`; its distribution function is `C.real (Set.Iic u)`. Quantile functions are Tau Ceti's
`MeasureTheory.Measure.quantile`.
-/

open MeasureTheory ProbabilityTheory Set

noncomputable section

namespace TauCetiRoadmap.CopulasAndDependenceBounds

variable {ι : Type*} [Fintype ι]

/-! ## Conventions -/

/-- Conventions. A copula: a law on `ι → ℝ` every margin of which is the uniform law on
`[0, 1]`. For nonempty `ι` such a measure is automatically a probability measure; for empty `ι`
the condition is empty. -/
def IsCopula (C : Measure (ι → ℝ)) : Prop :=
  ∀ i, C.map (fun u ↦ u i) = volume.restrict (Icc (0 : ℝ) 1)

/-- Conventions. `C` is a copula of the law `ν` (Sklar's identity): `C` is a copula and the joint
distribution function of `ν` at `x` is the distribution function of `C` at the vector of
marginal distribution function values `cdf (ν.map (fun y ↦ y i)) (x i)`. -/
def IsCopulaOf (C ν : Measure (ι → ℝ)) : Prop :=
  IsCopula C ∧ ∀ x : ι → ℝ,
    ν.real (Iic x) = C.real (Iic fun i ↦ cdf (ν.map fun y ↦ y i) (x i))

/-- Conventions. The comonotone law with margins `μ i`: the joint law of the quantile functions
`(μ i).quantile` read off one uniform variable on the open unit interval. -/
def comonotoneLaw (μ : ι → Measure ℝ) : Measure (ι → ℝ) :=
  (volume.restrict (Ioo (0 : ℝ) 1)).map fun t i ↦ (μ i).quantile t

/-- Conventions. The Fréchet–Hoeffding lower bound `W(u) = max (∑ i, u i - (d - 1)) 0` with
`d = Fintype.card ι`, computed in `ℝ`. -/
def frechetLower (u : ι → ℝ) : ℝ :=
  max (∑ i, u i - ((Fintype.card ι : ℝ) - 1)) 0

/-! ## Layer 1: The Fréchet–Hoeffding bounds -/

/-- 1.1 The Fréchet–Hoeffding bounds for a joint law: for every law `ν` on `ι → ℝ` with
margins `F i` and every `x`, `W(F(x)) ≤ H(x) ≤ F i (x i)` for each `i`. -/
theorem frechetHoeffding_bounds (ν : Measure (ι → ℝ)) [IsProbabilityMeasure ν] (x : ι → ℝ) :
    frechetLower (fun i ↦ cdf (ν.map fun y ↦ y i) (x i)) ≤ ν.real (Iic x) ∧
      ∀ i, ν.real (Iic x) ≤ cdf (ν.map fun y ↦ y i) (x i) := by
  sorry

/-- 1.1 Attainment of the Fréchet–Hoeffding bounds. The comonotone law with margins `μ i` has
margins `μ i` and joint distribution function `min_i cdf (μ i) (x i)`; for two coordinates the
countermonotone law, the joint law of the quantiles of `U` and `1 - U`, has joint distribution
function `max (cdf μ₁ x₀ + cdf μ₂ x₁ - 1) 0`. -/
theorem frechetHoeffding_attained [Nonempty ι] (μ : ι → Measure ℝ)
    [∀ i, IsProbabilityMeasure (μ i)] (μ₁ μ₂ : Measure ℝ) [IsProbabilityMeasure μ₁]
    [IsProbabilityMeasure μ₂] :
    ((∀ i, (comonotoneLaw μ).map (fun y ↦ y i) = μ i) ∧
      ∀ x : ι → ℝ, (comonotoneLaw μ).real (Iic x) =
        Finset.univ.inf' Finset.univ_nonempty fun i ↦ cdf (μ i) (x i)) ∧
    ∀ x : Fin 2 → ℝ,
      ((volume.restrict (Ioo (0 : ℝ) 1)).map fun t ↦ ![μ₁.quantile t, μ₂.quantile (1 - t)]).real
        (Iic x) = max (cdf μ₁ (x 0) + cdf μ₂ (x 1) - 1) 0 := by
  sorry

/-- 1.2 The lower bound is a copula exactly in dimension at most two: some copula has
distribution function `W` on the whole cube `[0, 1]^ι` if and only if `Fintype.card ι ≤ 2`. -/
theorem exists_isCopula_eq_frechetLower_iff :
    (∃ C : Measure (ι → ℝ), IsCopula C ∧
        ∀ u ∈ Icc (0 : ι → ℝ) 1, C.real (Iic u) = frechetLower u) ↔
      Fintype.card ι ≤ 2 := by
  sorry

/-- 1.3 The lower bound is pointwise best possible in every dimension: for every `u` in the cube
some copula takes the value `W(u)` at `u`. -/
theorem exists_isCopula_real_Iic_eq_frechetLower (u : ι → ℝ) (hu : u ∈ Icc (0 : ι → ℝ) 1) :
    ∃ C : Measure (ι → ℝ), IsCopula C ∧ C.real (Iic u) = frechetLower u := by
  sorry

/-! ## Layer 2: Sklar's theorem -/

/-- 2.1 Sklar's theorem, existence: every law on `ι → ℝ`, with arbitrary margins, has a
copula. -/
theorem exists_isCopulaOf (ν : Measure (ι → ℝ)) [IsProbabilityMeasure ν] :
    ∃ C : Measure (ι → ℝ), IsCopulaOf C ν := by
  sorry

/-- 2.2 Sklar's theorem, converse: a copula `C` and laws `μ i` on `ℝ` give the law of the vector
of quantiles `((μ i).quantile (u i))ᵢ` under `C`; its margins are `μ i` and `C` is a copula
of it. -/
theorem isCopulaOf_map_quantile {C : Measure (ι → ℝ)} (hC : IsCopula C) (μ : ι → Measure ℝ)
    [∀ i, IsProbabilityMeasure (μ i)] :
    (∀ i, (C.map fun u i ↦ (μ i).quantile (u i)).map (fun y ↦ y i) = μ i) ∧
      IsCopulaOf C (C.map fun u i ↦ (μ i).quantile (u i)) := by
  sorry

/-- 2.3 Sklar's theorem, uniqueness: when every margin has a continuous distribution function,
`C` is a copula of `ν` exactly when it is the law of the probability integral transforms
`(F i (y i))ᵢ`. -/
theorem isCopulaOf_iff_eq_map_cdf (ν : Measure (ι → ℝ)) [IsProbabilityMeasure ν]
    (hF : ∀ i, Continuous (cdf (ν.map fun y ↦ y i))) (C : Measure (ι → ℝ)) :
    IsCopulaOf C ν ↔ C = ν.map fun y i ↦ cdf (ν.map fun z ↦ z i) (y i) := by
  sorry

/-- 2.4 Invariance under monotone maps: a copula of `ν` is a copula of the image of `ν` under
coordinatewise nondecreasing maps, for arbitrary margins. -/
theorem IsCopulaOf.map_monotone {C ν : Measure (ι → ℝ)} [IsProbabilityMeasure ν]
    (h : IsCopulaOf C ν) {T : ι → ℝ → ℝ} (hT : ∀ i, Monotone (T i)) :
    IsCopulaOf C (ν.map fun y i ↦ T i (y i)) := by
  sorry

/-- 2.5 Comonotonicity: for a law `ν` with margins `F i`, the following are equivalent:
the joint distribution function is `min_i F i (x i)` everywhere; `ν` is the comonotone law of
its own margins; `ν` is carried by a chain of the coordinatewise order. -/
theorem comonotone_tfae [Nonempty ι] (ν : Measure (ι → ℝ)) [IsProbabilityMeasure ν] :
    List.TFAE
      [∀ x : ι → ℝ, ν.real (Iic x) =
          Finset.univ.inf' Finset.univ_nonempty fun i ↦ cdf (ν.map fun y ↦ y i) (x i),
        ν = comonotoneLaw fun i ↦ ν.map fun y ↦ y i,
        ∃ S : Set (ι → ℝ), IsChain (· ≤ ·) S ∧ ν Sᶜ = 0] := by
  sorry

/-! ## Layer 3: Hoeffding's covariance identity -/

/-- 3.1 Hoeffding's covariance identity: if `X`, `Y` and `X * Y` are integrable, the function
`H(x, y) - F(x) G(y)` is Lebesgue integrable on the plane and its integral is the covariance. -/
theorem hoeffding_covariance {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X Y : Ω → ℝ} (hX : Integrable X P) (hY : Integrable Y P)
    (hXY : Integrable (X * Y) P) :
    Integrable (fun p : ℝ × ℝ ↦ P.real {ω | X ω ≤ p.1 ∧ Y ω ≤ p.2} -
        P.real {ω | X ω ≤ p.1} * P.real {ω | Y ω ≤ p.2}) ∧
      cov[X, Y; P] = ∫ p : ℝ × ℝ, (P.real {ω | X ω ≤ p.1 ∧ Y ω ≤ p.2} -
        P.real {ω | X ω ≤ p.1} * P.real {ω | Y ω ≤ p.2}) := by
  sorry

/-- 3.2 Positive quadrant dependence and zero covariance give independence: if `X`, `Y` and
`X * Y` are integrable, `F(x) G(y) ≤ H(x, y)` for all `x, y`, and the covariance vanishes, then
`X` and `Y` are independent. -/
theorem indepFun_of_pqd_of_covariance_eq_zero {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X Y : Ω → ℝ} (hX : Integrable X P) (hY : Integrable Y P)
    (hXY : Integrable (X * Y) P)
    (hpqd : ∀ x y : ℝ,
      P.real {ω | X ω ≤ x} * P.real {ω | Y ω ≤ y} ≤ P.real {ω | X ω ≤ x ∧ Y ω ≤ y})
    (hcov : cov[X, Y; P] = 0) :
    IndepFun X Y P := by
  sorry

end TauCetiRoadmap.CopulasAndDependenceBounds
