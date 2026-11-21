import Mathlib
import TauCeti.NumberTheory.DiophantineApproximation.BadlyApproximable

/-!
# Dimension of measures and digit sets: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need: the half-open `b`-adic intervals of the real line, the lower `b`-adic local
dimension of a measure, the upper and lower Hausdorff dimension of a measure, and the set of
numbers with prescribed base-`b` digit frequencies. The predicate `IsNormalBase` is copied
verbatim from ProbabilisticAndMetricNumberTheory §2.8, because a roadmap's file cannot import
another roadmap's module. Every headline theorem of the README's summary is statable at the pins
and is stated here.
-/

open MeasureTheory Filter Set
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.DimensionOfMeasuresAndDigitSets

/-! ## Layer 1: Local dimension and Billingsley's lemma -/

/-- 1.1: the half-open `b`-adic interval of level `n` containing `x`,
`[⌊bⁿ x⌋ / bⁿ, (⌊bⁿ x⌋ + 1) / bⁿ)`. -/
noncomputable def badicCell (b n : ℕ) (x : ℝ) : Set ℝ :=
  Ico ((⌊x * (b : ℝ) ^ n⌋ : ℝ) / (b : ℝ) ^ n) (((⌊x * (b : ℝ) ^ n⌋ : ℝ) + 1) / (b : ℝ) ^ n)

/-- 1.2: the lower `b`-adic local dimension of `μ` at `x`: the lower limit of
`log μ(Iₙ(x)) / log |Iₙ(x)|`, where `Iₙ(x)` is the `b`-adic interval of level `n` containing `x`
and `|Iₙ(x)| = b⁻ⁿ`; the logarithm of a mass is taken in `EReal`, with `log 0 = ⊥`. -/
noncomputable def badicLowerLocalDim (b : ℕ) (μ : Measure ℝ) (x : ℝ) : EReal :=
  liminf (fun n : ℕ => ENNReal.log (μ (badicCell b n x)) /
    ((Real.log ((b : ℝ) ^ n)⁻¹ : ℝ) : EReal)) atTop

/-- 1.3: Billingsley's lemma, lower bound: if `μ A ≠ 0` and the lower `b`-adic local dimension
of `μ` is at least `α` at every point of `A`, then `dimH A ≥ α` (Bishop and Peres, Lemma 1.4.1;
Hochman, Proposition 4.7). -/
theorem le_dimH_of_le_badicLowerLocalDim (b : ℕ) (μ : Measure ℝ) {A : Set ℝ} (hA : μ A ≠ 0)
    {α : ℝ} (h : ∀ x ∈ A, (α : EReal) ≤ badicLowerLocalDim b μ x) :
    ENNReal.ofReal α ≤ dimH A := by
  sorry

/-- 1.4: Billingsley's lemma, upper bound: for a finite measure `μ` and a base `b ≥ 2`, if the
lower `b`-adic local dimension of `μ` is at most `β` at every point of `A`, then `dimH A ≤ β`
(Bishop and Peres, Lemma 1.4.1; Hochman, Proposition 4.7). -/
theorem dimH_le_of_badicLowerLocalDim_le {b : ℕ} (hb : 2 ≤ b) (μ : Measure ℝ) [IsFiniteMeasure μ]
    {A : Set ℝ} {β : ℝ} (h : ∀ x ∈ A, badicLowerLocalDim b μ x ≤ β) :
    dimH A ≤ ENNReal.ofReal β := by
  sorry

/-! ## Layer 2: Hausdorff dimension of a measure -/

/-- 2.1: the upper Hausdorff dimension of a measure: the infimum of the Hausdorff dimensions of
the sets whose complement is null (Bishop and Peres, Definition 1.4.3). -/
noncomputable def upperDimH {X : Type*} [EMetricSpace X] [MeasurableSpace X] (μ : Measure X) :
    ℝ≥0∞ :=
  ⨅ (A : Set X) (_ : μ Aᶜ = 0), dimH A

/-- 2.1: the lower Hausdorff dimension of a measure: the infimum of the Hausdorff dimensions of
the sets of positive measure (Hochman, Proposition 6.24). -/
noncomputable def lowerDimH {X : Type*} [EMetricSpace X] [MeasurableSpace X] (μ : Measure X) :
    ℝ≥0∞ :=
  ⨅ (A : Set X) (_ : μ A ≠ 0), dimH A

/-- 2.2: for a nonzero finite measure on `ℝ` and a base `b ≥ 2`, the upper Hausdorff dimension
is the essential supremum and the lower Hausdorff dimension the essential infimum of the lower
`b`-adic local dimension (Bishop and Peres, Lemma 1.4.4; Hochman, Proposition 6.24). -/
theorem upperDimH_eq_essSup_and_lowerDimH_eq_essInf {b : ℕ} (hb : 2 ≤ b) (μ : Measure ℝ)
    [IsFiniteMeasure μ] (hμ : μ ≠ 0) :
    (upperDimH μ : EReal) = essSup (badicLowerLocalDim b μ) μ ∧
      (lowerDimH μ : EReal) = essInf (badicLowerLocalDim b μ) μ := by
  sorry

/-! ## Layer 3: Digit frequencies -/

/-- 3.1: the numbers of `[0, 1)` whose canonical base-`b` digits have the frequencies `p`: each
digit `u` occurs among the first `N` digits about `p u · N` times. -/
noncomputable def digitFrequencySet (b : ℕ) [NeZero b] (p : PMF (Fin b)) : Set ℝ :=
  {x | x ∈ Ico (0 : ℝ) 1 ∧ ∀ u : Fin b,
    Tendsto (fun N : ℕ => (((Finset.range N).filter (fun j => Real.digits x b j = u)).card : ℝ)
      / (N : ℝ)) atTop (𝓝 (p u).toReal)}

/-- 3.2: the self-similar measure of the maps `x ↦ (x + d) / b` with weights `p` (the law of a
number whose base-`b` digits are independent with law `p`) has upper and lower Hausdorff
dimension `H(p) / log b`, where `H(p) = -∑ p_d log p_d` (Bishop and Peres, Lemma 1.5.4 and
Example 1.5.6). -/
theorem dimH_digitMeasure {b : ℕ} (hb : 2 ≤ b) (p : PMF (Fin b)) (μ : Measure ℝ)
    [IsProbabilityMeasure μ]
    (hμ : ∑ d : Fin b, p d • μ.map (fun x => (x + ((d : ℕ) : ℝ)) / b) = μ) :
    upperDimH μ = ENNReal.ofReal ((∑ d, Real.negMulLog (p d).toReal) / Real.log b) ∧
      lowerDimH μ = ENNReal.ofReal ((∑ d, Real.negMulLog (p d).toReal) / Real.log b) := by
  sorry

/-- 3.3: the theorem of Besicovitch and Eggleston: the set of numbers of `[0, 1)` with base-`b`
digit frequencies `p` has Hausdorff dimension `H(p) / log b`, for every probability vector `p`,
zero entries allowed (Hochman, Proposition 4.9; Bishop and Peres, Lemma 1.5.4). -/
theorem dimH_digitFrequencySet {b : ℕ} [NeZero b] (hb : 2 ≤ b) (p : PMF (Fin b)) :
    dimH (digitFrequencySet b p) =
      ENNReal.ofReal ((∑ u, Real.negMulLog (p u).toReal) / Real.log b) := by
  sorry

section CopiedFromProbabilisticAndMetricNumberTheory

/-- 3.4 (copied verbatim from ProbabilisticAndMetricNumberTheory §2.8, `IsNormalBase`):
Canonical overlapping digit blocks have the uniform limiting frequency, for bases at least two. -/
def IsNormalBase (b : ℕ) [NeZero b] (x : ℝ) : Prop :=
  2 ≤ b ∧ x ∈ Set.Ico (0:ℝ) 1 ∧ ∀ k : ℕ, ∀ w : Fin k → Fin b,
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹)

end CopiedFromProbabilisticAndMetricNumberTheory

/-- 3.4: the numbers of `[0, 1)` that are not normal in base `b` form a set of Hausdorff
dimension one (Hochman, Corollary 4.10, for simple normality in base ten). -/
theorem dimH_setOf_not_isNormalBase (b : ℕ) [NeZero b] :
    dimH {x : ℝ | x ∈ Ico (0 : ℝ) 1 ∧ ¬ IsNormalBase b x} = 1 := by
  sorry

/-! ## Layer 4: Cantor constructions and badly approximable numbers -/

/-- 4.1: a Cantor construction in base `R` that keeps exactly `k` of the `R` subintervals of every
interval, the kept digits depending on the interval (on the word of digits before), has
Hausdorff dimension `log k / log R` (Beresnevich, Ramírez and Velani, Lemma 7.1). -/
theorem dimH_ofDigits_prefixRestricted (R k : ℕ) (D : List (Fin R) → Finset (Fin R))
    (hD : ∀ w, (D w).card = k) :
    dimH (Real.ofDigits '' {ω : ℕ → Fin R | ∀ n, ω n ∈ D (List.ofFn fun i : Fin n => ω i)}) =
      ENNReal.ofReal (Real.log k / Real.log R) := by
  sorry

/-- 4.2: Jarník's theorem: the badly approximable numbers form a set of Hausdorff dimension one
(Beresnevich, Ramírez and Velani, Theorem 7.1). -/
theorem dimH_setOf_badlyApproximable : dimH {x : ℝ | TauCeti.BadlyApproximable x} = 1 := by
  sorry

end TauCetiRoadmap.DimensionOfMeasuresAndDigitSets
