/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti Atlas contributors, Codex
-/
import Mathlib
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Probabilistic and metric number theory: target signatures

The roadmap is README.md; this file states its headline theorems against the
pinned Mathlib and Tau Ceti APIs. The weighted GCD-graph compression theorem
is not statable on a native pinned carrier: weighted GCD graphs with prime
valuation metadata and their quality are absent. Its construction and theorem
are README targets. The signatures below cover the additive limit laws,
polynomial Haar-mixture limits, discrepancy, normality, metric and Hausdorff
approximation, pointwise and Gauss dynamics, and multiplicative correlations.
Simple definitions specify only the objects occurring in these signatures.
Finite exact-period corollaries, native probability transports and continued-
fraction recurrence comparisons are targets in README.md, not acceptance declarations.
Arithmetic samples contain 1 through m+1; digit indices start at zero.
The basic one-dimensional approximation intervals are closed; the power-law
and simultaneous approximation predicates use strict inequalities.
Short means include both endpoints.
Continued-fraction words compose from left to right as ordered inverse branches.
-/

noncomputable section
open MeasureTheory Filter Set
open scoped BigOperators Topology NNReal ENNReal Classical

namespace TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

namespace Arithmetic

local notation "uLaw" =>
  (fun m : ℕ => (TauCeti.Probability.empiricalMeasure (fun k : ℕ => k + 1) m : Measure ℕ))

/-! ## Layer 0: Arithmetic probability -/
/-- The finite weighted divisibility sum, extended by zero at input zero. -/
def primeDivisibilitySum (P : Finset ℕ) (a : ℕ → ℝ) : ArithmeticFunction ℝ where
  toFun n := if n = 0 then 0 else ∑ p ∈ P, if p ∣ n then a p else 0
  map_zero' := by simp

/-- The centered empirical second moment differs from the Bernoulli variance by at most 2L²/N. -/
theorem primeDivisibilitySum_secondMoment_error (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) :
    let A : ℝ := ∑ p ∈ P, a p / (p : ℝ)
    let L : ℝ := ∑ p ∈ P, |a p|
    let V : ℝ := ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2)
    |(∫ n, (primeDivisibilitySum P a n - A) ^ 2 ∂(uLaw m)) - V| ≤
      2 * L ^ 2 / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- Summed absolute atom errors are at most 3 to the number of primes divided by sample size. -/
theorem divisibility_pattern_summed_error (m : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    (∑ S ∈ P.powerset,
      |((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ P \ S, ¬ q ∣ n)}).toReal -
        (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ P \ S, (1 - 1 / (q : ℝ)))|) ≤
      (3 : ℝ) ^ P.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- The sharp residue event error bounds any bounded real statistic by its oscillation. -/
theorem crt_statistic_error {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (F : (∀ i, ZMod (q i)) → ℝ) (L U : ℝ) (hLU : L ≤ U)
    (hF : ∀ a, L ≤ F a ∧ F a ≤ U) :
    |(∫ n : ℕ, F (fun i => (n : ZMod (q i))) ∂uLaw m) -
      (∏ i, 1 / (q i : ℝ)) * ∑ a, F a| ≤
      (U - L) * ((m + 1) % (∏ i, q i) : ℕ) *
        (((∏ i, q i : ℕ) : ℝ) - ((m + 1) % (∏ i, q i) : ℕ)) /
        ((m + 1 : ℕ) * ((∏ i, q i : ℕ) : ℝ)) := by sorry

local notation "factorExcess" => (fun n : ℕ =>
  (ArithmeticFunction.cardFactors n : ℝ) - ArithmeticFunction.cardDistinctFactors n)

/-- The repeated-prime-factor excess has a uniform exponential moment. -/
theorem excess_exponential_mean (m : ℕ) :
    (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw m) ≤
      Real.exp 2 := by sorry

/-- A scale tending to infinity transfers every probability limit between ω and Ω. -/
theorem excess_distribution_transfer (b s : ℕ → ℝ) (hs : Tendsto s atTop atTop)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν ↔
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν := by sorry

end Arithmetic

namespace MetricNumberTheory

/-! ## Layer 0: Arithmetic probability (continued) -/

-- Coprime additivity and strict-interval concentration.
/-- Coprime positive products become sums; input one has value zero. -/
def IsAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  f 1 = 0 ∧ ∀ m n : ℕ, 0 < m → 0 < n → m.Coprime n → f (m*n) = f m + f n

/-- The supremal mass of strict intervals of radius δ; nonpositive radii give zero. -/
def concentration (ν : ProbabilityMeasure ℝ) (δ : ℝ) : ℝ :=
  sSup {v : ℝ | ∃ u : ℝ, v = (ν : Measure ℝ).real (Set.Ioo (u-δ) (u+δ))}

/-- Independent real summands satisfy the equal-radius concentration bound when the denominator is positive. -/
theorem kolmogorov_rogozin : ∃ C : ℝ, 0 < C ∧
    ∀ (Ω : Type*) [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω) (k : ℕ) (X : Fin k → Ω → ℝ)
      (hX : ∀ j, AEMeasurable (X j) (μ : Measure Ω))
      (hi : ProbabilityTheory.iIndepFun X (μ : Measure Ω)) (δ : ℝ) (hδ : 0 < δ),
      let D := ∑ j, (1 - concentration (μ.map (X j)) δ)
      0 < D → concentration (μ.map (fun ω => ∑ j, X j ω)) δ ≤ C / Real.sqrt D := by sorry

/-- Weak convergence of real probability laws is tested at continuity points of the limiting CDF. -/
theorem cdf_weak_criterion (νs : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ) :
    Tendsto νs atTop (𝓝 ν) ↔
      ∀ x : ℝ, ContinuousAt (ProbabilityTheory.cdf (ν : Measure ℝ)) x →
        Tendsto (fun m => ProbabilityTheory.cdf (νs m : Measure ℝ) x) atTop
          (𝓝 (ProbabilityTheory.cdf (ν : Measure ℝ) x)) := by sorry

/-- Growing-prime valuation vectors approach the specified independent geometric model in total variation. -/
theorem kubilius_small_prime_model (β : ℕ → ℝ)
    (hβ : ∀ N, 0 < β N) (hβinf : Tendsto β atTop atTop)
    (ν : (N : ℕ) → ProbabilityMeasure
      ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ))
    (hν : ∀ (N : ℕ) (v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)), (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v} =
      ∏ p : {p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊},
        (1-1/(p:ℝ)) / (p:ℝ)^(v p)) :
    ∃ C δ : ℝ, 0 < C ∧ 0 < δ ∧ ∀ᶠ N : ℕ in atTop,
      (1/2:ℝ) * ∑' v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ),
        |(((Finset.Icc 1 N).filter (fun n => ∀ p, n.factorization p = v p)).card : ℝ)/(N:ℝ) -
          (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v}| ≤ C*Real.exp (-δ*β N) := by sorry

/-! ## Layer 1: Additive limit laws -/


/-- The full prime-power center and quadratic size give the Turán–Kubilius bound with constant 30. -/
theorem turan_kubilius (f : ArithmeticFunction ℝ) (hf : IsAdditive f) (N : ℕ) (hN : 2 ≤ N) :
    let A := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then f (p^k)/(p^k : ℕ) else 0
    let B := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then (f (p^k))^2/(p^k : ℕ) else 0
    ∑ n ∈ Finset.Icc 1 N, (f n-A)^2 ≤ 30*(N:ℝ)*B := by sorry

/-- Both prime-factor counting functions have normal order log log N. -/
theorem hardy_ramanujan (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardDistinctFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) := by sorry

/-- The Gaussian specialization of moment convergence follows from characteristic-function
Taylor remainders, without a uniform tail hypothesis. -/
theorem gaussian_weak_convergence_of_moments (μ : ℕ → ProbabilityMeasure ℝ)
    (hfinite : ∀ n k : ℕ, Integrable (fun x : ℝ => |x|^k) (μ n : Measure ℝ))
    (hmom : ∀ k : ℕ, Tendsto (fun n => ∫ x : ℝ, x^k ∂(μ n : Measure ℝ))
      atTop (𝓝 (∫ x : ℝ, x^k ∂ProbabilityTheory.gaussianReal 0 1))) :
    Tendsto μ atTop (𝓝 (⟨ProbabilityTheory.gaussianReal 0 1, inferInstance⟩ :
      ProbabilityMeasure ℝ)) := by sorry

/-- The conditional second moment in the specified thin squarefree family has the half-log-log center. -/
theorem restricted_squarefree_second_moment : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    (∑ n ∈ D, ((ArithmeticFunction.cardDistinctFactors n : ℝ) -
      (1/2)*Real.log (Real.log N))^2) ≤ C * D.card * Real.log (Real.log N) := by sorry

/-- The normalized ω and Ω laws converge to the standard Gaussian CDF. -/
theorem erdos_kac (x : ℝ) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardDistinctFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) := by sorry

/-- The specified thin squarefree family has its separate half-log-log center and relative window estimate. -/
theorem restricted_squarefree_window : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    ((D.filter (fun n => Real.rpow (Real.log (Real.log N)) (2/3) ≤
      |(ArithmeticFunction.cardDistinctFactors n : ℝ) - (1/2)*Real.log (Real.log N)|)).card : ℝ) ≤
      C * D.card / Real.rpow (Real.log (Real.log N)) (1/100) := by sorry

end MetricNumberTheory

namespace Equidistribution

/-! ## Layer 2: Uniform distribution, discrepancy and normal digits -/
/-- Equidistribution is weak convergence of the native successor-indexed empirical probabilities. -/
def AsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)

/-- Total equidistribution tests all positive-step arithmetic progressions. -/
def TotallyAsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ

/-- The existing circle Haar measure bundled as a probability measure. -/
def circleHaar : ProbabilityMeasure UnitAddCircle :=
  ⟨AddCircle.haarAddCircle, inferInstance⟩

/-- The native finite product of circle Haar probabilities, including the zero-dimensional torus. -/
def torusHaar (d : Type*) [Fintype d] : ProbabilityMeasure (UnitAddTorus d) :=
  ⟨Measure.pi (fun _ : d => AddCircle.haarAddCircle), by infer_instance⟩

variable {d : Type*} [Fintype d]

/-- Every nonzero integral frequency has nonzero pairing with the torus point. -/
def TorusIrrational (α : UnitAddTorus d) : Prop :=
  ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0

/-- Haar equidistribution is equivalent to vanishing of all nonzero Fourier averages. -/
theorem weyl_criterion (x : ℕ → UnitAddTorus d) :
    AsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 →
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), UnitAddTorus.mFourier k (x i)) atTop (𝓝 0) := by
  sorry

/-- A linear torus orbit is equidistributed, totally equidistributed, or irrational in exactly the same cases. -/
theorem linear_equidistribution_tfae (α β : UnitAddTorus d) :
    List.TFAE [AsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TotallyAsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TorusIrrational α] := by
  sorry

/-- An irrational leading vector gives polynomial torus equidistribution. -/
theorem weyl_polynomial (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d)
    (hα : TorusIrrational (α s)) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
      (torusHaar d) := by
  sorry

/-- Every nonzero integer frequency detects a nonconstant coefficient, equivalently Haar equidistribution. -/
theorem polynomial_equidistribution_iff (s : ℕ) (hs : 1 ≤ s)
    (α : ℕ → UnitAddTorus d) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s+1), (n^j) • α j)
      (torusHaar d) ↔
    ∀ k : d → ℤ, k ≠ 0 → ∃ j ∈ Finset.Icc 1 s, ∑ i, k i • α j i ≠ 0 := by sorry

/-- The same coefficient criterion characterizes equidistribution on every positive-step progression. -/
theorem polynomial_total_equidistribution_iff (s : ℕ) (hs : 1 ≤ s)
    (α : ℕ → UnitAddTorus d) :
    TotallyAsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s+1), (n^j) • α j)
      (torusHaar d) ↔
    ∀ k : d → ℤ, k ≠ 0 → ∃ j ∈ Finset.Icc 1 s, ∑ i, k i • α j i ≠ 0 := by sorry

/-- A finite torus polynomial evaluated at an integer, including its constant coefficient. -/
def torusPolynomial (s : ℕ) (α : ℕ → UnitAddTorus d) (n : ℤ) : UnitAddTorus d :=
  ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j

/-- Every torus polynomial has a totally equidistributed connected-subgroup part and a
periodic torsion part; its limit is the equally weighted mixture over one period. -/
theorem polynomial_haar_mixture (s : ℕ) (α : ℕ → UnitAddTorus d) :
    ∃ (S : AddSubgroup (UnitAddTorus d)) (μ ν : ProbabilityMeasure (UnitAddTorus d))
      (β γ : ℕ → UnitAddTorus d) (Q : ℕ),
      IsClosed (S : Set (UnitAddTorus d)) ∧ IsConnected (S : Set (UnitAddTorus d)) ∧
      (μ : Measure (UnitAddTorus d)) S = 1 ∧
      (∀ y ∈ S, MeasurePreserving (fun z => y + z)
        (μ : Measure (UnitAddTorus d)) (μ : Measure (UnitAddTorus d))) ∧
      β 0 = 0 ∧ γ 0 = α 0 ∧
      (∀ j ∈ Finset.range (s + 1), α j = β j + γ j) ∧
      (∀ j ∈ Finset.Icc 1 s, β j ∈ S ∧ IsOfFinAddOrder (γ j)) ∧
      0 < Q ∧ Function.Periodic (torusPolynomial s γ) (Q : ℤ) ∧
      (∀ q : ℤ, q ≠ 0 → ∀ r : ℤ,
        AsympEquidistributed (fun n => torusPolynomial s β (q * (n : ℤ) + r)) μ) ∧
      (ν : Measure (UnitAddTorus d)) = (Q : ℝ≥0∞)⁻¹ •
        ∑ r ∈ Finset.range Q, Measure.map (fun z => torusPolynomial s γ r + z)
          (μ : Measure (UnitAddTorus d)) ∧
      AsympEquidistributed (fun n => torusPolynomial s α n) ν := by sorry

/-- Circle equidistribution agrees with half-open interval frequencies and the scalar Fourier criterion. -/
theorem uniformDistribution_mod_one_tfae (u : ℕ → ℝ) :
    List.TFAE [AsympEquidistributed (fun n => (u n : UnitAddCircle)) circleHaar,
      ∀ a b : ℝ, 0 ≤ a → a ≤ b → b ≤ 1 →
        Tendsto (fun n : ℕ => (((Finset.range (n + 1)).filter
          (fun i => Int.fract (u i) ∈ Set.Ico a b)).card : ℝ) / (n + 1)) atTop (𝓝 (b - a)),
      ∀ k : ℤ, k ≠ 0 → Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), fourier k (u i : UnitAddCircle)) atTop (𝓝 0)] := by
  sorry

end Equidistribution

namespace MetricNumberTheory

-- Strict initial intervals and canonical base digits.
/-- Star discrepancy uses strict initial intervals and has value zero for an empty sample. -/
def starDiscrepancy {N : ℕ} (x : Fin N → ℝ) : ℝ :=
  if N = 0 then 0 else sSup {v : ℝ | ∃ t ∈ Set.Icc (0:ℝ) 1,
    v = |((Finset.univ.filter (fun j => x j < t)).card : ℝ)/(N:ℝ)-t|}


/-- The one-dimensional Fourier discrepancy estimate with an explicit sufficient constant. -/
theorem erdos_turan {N H : ℕ} (hN : 0 < N) (hH : 0 < H) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) :
    starDiscrepancy x ≤ 3 / ((H:ℝ)+1) +
      3 * ∑ h ∈ Finset.Icc 1 H,
        ‖(∑ j : Fin N, Complex.exp (2*Real.pi*Complex.I*(h:ℂ)*(x j:ℂ))) / (N:ℂ)‖ / (h:ℝ) := by sorry

/-- Bounded variation controls the quadrature error by star discrepancy. -/
theorem koksma {N : ℕ} (hN : 0 < N) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (f : ℝ → ℝ) (hf : BoundedVariationOn f (Set.Icc 0 1)) :
    |(∑ j, f (x j))/(N:ℝ) - ∫ t in Set.Icc (0:ℝ) 1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal * starDiscrepancy x := by sorry

/-- Canonical overlapping digit blocks have the uniform limiting frequency, for bases at least two. -/
def IsNormalBase (b : ℕ) [NeZero b] (x : ℝ) : Prop :=
  2 ≤ b ∧ x ∈ Set.Ico (0:ℝ) 1 ∧ ∀ k : ℕ, ∀ w : Fin k → Fin b,
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹)


/-- Almost every point of the unit interval is normal in a fixed admissible base. -/
theorem borel_normal {b : ℕ} [NeZero b] (hb : 2 ≤ b) :
    ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)), IsNormalBase b x := by sorry

/-- Countable intersection gives simultaneous normality in every base at least two. -/
theorem borel_normal_all_bases : ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)),
    ∀ b : ℕ, ∀ hb : 2 ≤ b, @IsNormalBase b ⟨by omega⟩ x := by sorry

end MetricNumberTheory

namespace DuffinSchaeffer

/-! ## Layer 3: Metric approximation and Hausdorff transference -/
/-- Closed reduced-rational intervals with numerators from one through q, intersected with the unit interval. -/
def dsSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- Reduced approximation at unbounded denominators, using closed intervals. -/
def dsLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (dsSet ψ) atTop

/-- Unrestricted approximation permits every numerator from zero through q. -/
def khinchinSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ Finset.range (q + 1),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- Unrestricted approximation at unbounded denominators. -/
def khinchinLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (khinchinSet ψ) atTop

/-- Convergence of the reduced totient series gives a null limsup. -/
theorem volume_dsLimsup_eq_zero (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hsum : Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 0 := by
  sorry

/-- Divergence of the reduced totient series gives full measure without monotonicity. -/
theorem volume_dsLimsup_eq_one (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 1 := by
  sorry

/-- The ENNReal multiple-envelope series decides unrestricted approximation, including an infinite envelope. -/
theorem catlin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) :
    let ψstar : ℕ → ℝ≥0∞ := fun q =>
      (q.totient : ℝ≥0∞) * ⨆ n : ℕ, ⨆ (_ : 0 < n ∧ q ∣ n), ENNReal.ofReal (ψ n / n)
    ((∑' q, ψstar q) < ∞ → volume (khinchinLimsup ψ) = 0) ∧
      ((∑' q, ψstar q) = ∞ → volume (khinchinLimsup ψ) = 1) := by
  sorry

/-- The stated qψ(q)-monotone version of Khinchin follows the unrestricted series test. -/
theorem khinchin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hmono : ∀ q r : ℕ, 1 ≤ q → q ≤ r → (r : ℝ) * ψ r ≤ q * ψ q) :
    (Summable ψ → volume (khinchinLimsup ψ) = 0) ∧
      (¬ Summable ψ → volume (khinchinLimsup ψ) = 1) := by
  sorry

end DuffinSchaeffer

namespace MetricNumberTheory

-- Native Hausdorff measure uses diameter gauges.
/-- A gauge is continuous, monotone, zero at zero and strictly positive at positive radius. -/
def IsDimensionGauge (f : ℝ≥0 → ℝ≥0) : Prop :=
  f 0 = 0 ∧ (∀ r, 0 < r → 0 < f r) ∧ Monotone f ∧ Continuous f

/-- The diameter gauge agrees with the given gauge at finite arguments and takes infinity at infinity. -/
def extendedGauge (f : ℝ≥0 → ℝ≥0) (r : ℝ≥0∞) : ℝ≥0∞ :=
  if r = ∞ then ∞ else (f r.toNNReal : ℝ≥0∞)

/-- Near zero, the gauge divided by the ambient volume power is monotone in either direction. -/
def GaugeRatioMonotone (k : ℕ) (f : ℝ≥0 → ℝ≥0) : Prop :=
  ∃ R : ℝ≥0, 0 < R ∧
    (MonotoneOn (fun r => f r / r ^ k) (Set.Ioc 0 R) ∨
      AntitoneOn (fun r => f r / r ^ k) (Set.Ioc 0 R))

/-- Euclidean mass transference holds in every positive dimension for admissible gauges. -/
theorem mass_transference (k : ℕ) (hk : 1 ≤ k) (f : ℝ≥0 → ℝ≥0)
    (hf : IsDimensionGauge f) (hmono : GaugeRatioMonotone k f)
    (c : ℕ → EuclideanSpace ℝ (Fin k)) (r : ℕ → ℝ≥0)
    (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))
    (hfull : ∀ x : EuclideanSpace ℝ (Fin k), ∀ R : ℝ, 0 < R →
      volume (Metric.ball x R \ limsup
        (fun i => Metric.closedBall (c i) (Real.rpow (f (r i) : ℝ) (k : ℝ)⁻¹)) atTop) = 0) :
    ∀ x : EuclideanSpace ℝ (Fin k), ∀ R : ℝ, 0 < R →
      Measure.mkMetric (extendedGauge f)
        (Metric.ball x R ∩ limsup (fun i => Metric.closedBall (c i) (r i : ℝ)) atTop) =
      Measure.mkMetric (extendedGauge f) (Metric.ball x R) := by sorry


/-- Expanded-ball local full measure implies infinite power Hausdorff measure for the original limsup. -/
theorem mass_transference_power (s : ℝ) (hs : 0 < s) (hs1 : s < 1)
    (c r : ℕ → ℝ) (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))
    (hfull : ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      volume (Metric.ball x R \ (limsup (fun i => Metric.closedBall (c i) (Real.rpow (r i) s)) atTop)) = 0) :
    ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      Measure.hausdorffMeasure s (Metric.ball x R ∩ limsup (fun i => Metric.closedBall (c i) (r i)) atTop) = ∞ := by sorry

/-- Strict reduced approximation with radius q to the power minus v at unbounded denominators. -/
def powerApproximationSet (v : ℝ) : Set ℝ :=
  {x | x ∈ Set.Icc 0 1 ∧ ∃ᶠ q : ℕ in atTop, 0 < q ∧
    ∃ a : ℤ, Nat.Coprime a.natAbs q ∧ |x - (a : ℝ) / q| < Real.rpow (q : ℝ) (-v)}

/-- Jarník–Besicovitch gives dimension two over v and infinite critical measure for v greater than two. -/
theorem jarnik_besicovitch (v : ℝ) (hv : 2 < v) :
    dimH (powerApproximationSet v) = ENNReal.ofReal (2 / v) ∧
      Measure.hausdorffMeasure (2 / v) (powerApproximationSet v) = ∞ := by sorry

/-- The gauge totient series decides zero or full Hausdorff measure of the reduced limsup. -/
theorem hausdorff_duffin_schaeffer (ψ : ℕ → ℝ≥0) (f : ℝ≥0 → ℝ≥0)
    (hf : IsDimensionGauge f) (hmono : GaugeRatioMonotone 1 f) :
    let H : Measure ℝ := Measure.mkMetric (extendedGauge f)
    let E := DuffinSchaeffer.dsLimsup (fun q => (ψ q : ℝ))
    let a := fun q : ℕ => (q.totient : ℝ) * (f (ψ q / (q : ℝ≥0)) : ℝ)
    (Summable a → H E = 0) ∧
      (¬ Summable a → H E = H (Set.Icc (0 : ℝ) 1)) := by sorry

/-- The reduced limsup dimension is its series convergence exponent capped at one. -/
theorem duffin_schaeffer_dimension (ψ : ℕ → ℝ)
    (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1/2) :
    dimH (limsup (fun q : ℕ => Set.Icc (0:ℝ) 1 ∩
      ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
        Set.Icc ((a:ℝ)/q-ψ q/q) ((a:ℝ)/q+ψ q/q)) atTop) =
      min (sInf {b : ℝ≥0∞ | ∃ t : ℝ, 0 ≤ t ∧ b = ENNReal.ofReal t ∧
        Summable (fun q : ℕ => (q.totient:ℝ)*Real.rpow (ψ q/q) t)}) 1 := by sorry

/-- Simultaneous strict approximation requires each numerator to be coprime to the common denominator. -/
def coordinatewiseReducedLimsup (k : ℕ) (ψ : ℕ → ℝ) : Set (Fin k → ℝ) :=
  {x | (∀ i, x i ∈ Set.Icc 0 1) ∧ ∃ᶠ q : ℕ in atTop, 0 < q ∧
    ∃ a : Fin k → ℤ, ∀ i, Nat.Coprime (a i).natAbs q ∧
      |x i - (a i : ℝ) / q| < ψ q / q}

/-- For at least two coordinates the reduced totient-power series decides zero or full volume. -/
theorem simultaneous_duffin_schaeffer (k : ℕ) (hk : 2 ≤ k)
    (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) :
    let a := fun q : ℕ => ((q.totient : ℝ) * ψ q / q) ^ k
    (Summable a → volume (coordinatewiseReducedLimsup k ψ) = 0) ∧
      (¬ Summable a → volume (coordinatewiseReducedLimsup k ψ) = 1) := by sorry

end MetricNumberTheory

namespace MetricNumberTheory

/-! ## Layer 4: Pointwise ergodic theory and continued fractions -/
/-- Every integrable real observable converges almost everywhere to native invariant conditional expectation. -/
theorem birkhoff_pointwise {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω))
    (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop
      (𝓝 (MeasureTheory.condExp (MeasurableSpace.invariants T) (μ : Measure Ω) f x)) := by sorry

/-- Ergodicity makes the almost-everywhere pointwise limit the space integral. -/
theorem birkhoff_pointwise_ergodic {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : Ergodic T (μ : Measure Ω)) (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop (𝓝 (∫ y, f y ∂(μ : Measure Ω))) := by sorry

/-- The total Gauss map uses the fractional part of the reciprocal, including at zero. -/
def gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- The logarithmic invariant density on the unit interval, expressed as a native measure. -/
def gaussMeasure : Measure ℝ :=
  (volume.restrict (Set.Ioc (0:ℝ) 1)).withDensity (fun x => ENNReal.ofReal (1 / ((1+x)*Real.log 2)))

/-- The Gauss density has total mass one. -/
theorem gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry


/-- Digit n is the natural floor of the reciprocal after n Gauss iterates. -/
def gaussDigit (x : ℝ) (n : ℕ) : ℕ := ⌊((gaussMap^[n]) x)⁻¹⌋₊

/-- Strong mixing includes measure preservation and convergence of measurable correlations. -/
def IsStrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
        (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B))


/-- Exactness includes measure preservation and zero–one for the decreasing preimage sigma-algebra. -/
def IsExact {Ω : Type*} [m : MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m] A →
      (μ : Measure Ω) A = 0 ∨ (μ : Measure Ω) Aᶜ = 0

/-- The geometric-digit constant with the a(a+2) digit-law denominator. -/
def khinchinConstant : ℝ := Real.exp (∑' k : ℕ,
  Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) / Real.log 2)


/-- The logarithmic series defining the digit constant really converges. -/
theorem khinchin_series_summable : Summable (fun k : ℕ =>
    Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) /
      Real.log 2) := by sorry

/-- The Gauss measure is invariant under the total Gauss map. -/
theorem gauss_invariant : MeasurePreserving gaussMap gaussMeasure gaussMeasure := by sorry

/-- The Gauss system has trivial tail sigma-algebra modulo null sets. -/
theorem gauss_exact : IsExact gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

/-- Exactness yields strong mixing for the Gauss probability. -/
theorem gauss_mixing : IsStrongMixing gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

/-- The invariant Gauss probability is ergodic. -/
theorem gauss_ergodic : Ergodic gaussMap gaussMeasure := by sorry

/-- Almost every real has the logarithmic Gauss frequency for each positive digit. -/
theorem gauss_digit_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ a : ℕ, 0 < a → Tendsto (fun N : ℕ =>
      ((Finset.range N).filter (fun j => gaussDigit x j = a)).card / (N:ℝ)) atTop
      (𝓝 (Real.log (((a:ℝ)+1)^2 / ((a:ℝ)*((a:ℝ)+2))) / Real.log 2)) := by sorry

/-- All finite positive words have their Gauss cylinder frequency on one conull set. -/
theorem gauss_word_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ k : ℕ, 0 < k → ∀ w : Fin k → ℕ, (∀ i, 0 < w i) →
      Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
        ∀ i : Fin k, gaussDigit x (j+i) = w i)).card / (N:ℝ)) atTop
        (𝓝 (gaussMeasure.real {y | y ∈ Set.Ioo (0:ℝ) 1 ∧ ∀ i : Fin k, gaussDigit y i = w i})) := by sorry

/-- Almost every geometric mean of Gauss digits tends to Khinchin’s constant. -/
theorem khinchin_geometric_mean : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.rpow (∏ j ∈ Finset.range N, (gaussDigit x j : ℝ)) ((N:ℝ)⁻¹))
      atTop (𝓝 khinchinConstant) := by sorry

/-- Native continued-fraction denominators have the almost-everywhere Lévy logarithmic growth rate. -/
theorem levy_denominator : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.log ((GenContFract.of x).dens N)/(N:ℝ)) atTop
      (𝓝 (Real.pi^2/(12*Real.log 2))) := by sorry

/-- Lebesgue digit marginals approach their Gauss law at a uniform exponential rate. -/
theorem gauss_kuzmin : ∃ C ρ : ℝ, 0 < C ∧ 0 < ρ ∧ ρ < 1 ∧
    ∀ a : ℕ, 0 < a → ∀ n : ℕ,
      |(volume.restrict (Set.Ioc (0:ℝ) 1)).real {x | gaussDigit x n = a} -
        Real.log (((a:ℝ)+1)^2/((a:ℝ)*((a:ℝ)+2)))/Real.log 2| ≤ C*ρ^n := by sorry

-- Ordered inverse branches and quantitative transfer estimates.
local notation "I" => Icc (0 : ℝ) 1
local notation "D" => (Set.ofPred (fun x : ℝ => x ∈ Ioo (0 : ℝ) 1 ∧ Irrational x))
local notation "m" => volume.restrict (Ioo (0 : ℝ) 1)

/-- The unnormalized Lebesgue density transfer operator, using the native real infinite sum. -/
def gaussDensityTransfer (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, f (1 / ((k : ℝ) + 1 + x)) / ((k : ℝ) + 1 + x)^2

/-- Conjugating by the Gauss density gives positive weights summing to one. -/
def normalizedGaussTransfer (g : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, (1+x) / (((k : ℝ)+1+x)*((k : ℝ)+2+x)) *
    g (1 / ((k : ℝ)+1+x))


/-- Closed-interval C¹ derivatives contract by the sufficient factor 9/10. -/
theorem transfer_derivative_contraction {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M) :
    ∀ x ∈ I, |derivWithin (normalizedGaussTransfer g) I x| ≤ (9 / 10 : ℝ) * M := sorry

/-- Iterating the Lebesgue density gives the explicit uniform Gauss–Kuzmin error. -/
theorem density_uniform_error (n : ℕ) {x : ℝ} (hx : x ∈ I) :
    |(gaussDensityTransfer^[n]) (fun _ => 1) x - 1 / ((1 + x) * Real.log 2)| ≤
      (9 / 10 : ℝ) ^ n := sorry

section HomogeneousConsumers
local notation "G" => Matrix.SpecialLinearGroup (Fin 2) ℝ
local notation "Γ" => MonoidHom.range (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) :
  Matrix.SpecialLinearGroup (Fin 2) ℤ →* G)
/-- The special linear group carries the existing determinant-one subtype topology. -/
local instance homogeneousGroupTopology : TopologicalSpace G :=
  inferInstanceAs (TopologicalSpace {A : Matrix (Fin 2) (Fin 2) ℝ // A.det = 1})
local notation "X" => G ⧸ Γ
/-- The homogeneous quotient uses its Borel measurable structure. -/
local instance homogeneousQuotientMeasurableSpace : MeasurableSpace X := borel X

variable (a u : ℝ → G)
variable (ha : ∀ t : ℝ, (a t : Matrix (Fin 2) (Fin 2) ℝ) =
  !![Real.exp t, 0; 0, Real.exp (-t)])
variable (hu : ∀ x : ℝ, (u x : Matrix (Fin 2) (Fin 2) ℝ) = !![1, x; 0, 1])

include ha

/-- Diagonal time-one averages on the Haar modular quotient converge almost everywhere to the space integral. -/
theorem homogeneous_birkhoff (μ : Measure X) [IsProbabilityMeasure μ]
    (hHaar : ∀ g : G, MeasurePreserving (fun z : X => g • z) μ μ)
    {f : X → ℝ} (hf : Integrable f μ) :
    ∀ᵐ z ∂μ, Tendsto (fun N : ℕ => birkhoffAverage ℝ (fun w : X => a 1 • w) f N z)
      atTop (𝓝 (∫ w, f w ∂μ)) := sorry

-- One-sided orbit and compact closure, with all matrix conventions visible.
include ha hu
/-- Bounded Gauss digits are equivalent to precompactness of the positive column-lattice orbit. -/
theorem bounded_digits_compact_orbit {x : ℝ} (hx : x ∈ D) :
    (∃ B : ℕ, ∀ n : ℕ, gaussDigit x n ≤ B) ↔
      IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry
/-- Lebesgue-almost every unit-interval point has a nonprecompact positive semiorbit. -/
theorem typical_unbounded_semiorbit : ∀ᵐ x ∂m,
    ¬ IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry

end HomogeneousConsumers

/-! ## Layer 5: Short intervals, logarithmic correlations and random models -/
/-- Inclusive short intervals contain h+1 terms but are normalized by h. -/
def shortMean (f : ArithmeticFunction ℝ) (x h : ℕ) : ℝ :=
  (∑ n ∈ Finset.Icc x (x+h), f n)/(h:ℝ)

/-- The harmonic two-point window uses no conjugation and the exact floor-based lower endpoint. -/
def logCorrelation (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) : ℂ :=
  (∑ n ∈ Finset.Ioc ⌊x/w⌋₊ ⌊x⌋₊,
    f (((a₁:ℤ)*(n:ℤ)+b₁).toNat) * g (((a₂:ℤ)*(n:ℤ)+b₂).toNat) / (n:ℂ)) / (Real.log w : ℂ)

/-- The real bounded multiplicative short-interval estimate with its exceptional-integer count. -/
theorem matomaki_radziwill : ∃ C C' : ℝ, 1 < C ∧ 1 < C' ∧
    ∀ (f : ArithmeticFunction ℝ) (hf : f.IsMultiplicative)
      (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1) (h X : ℕ) (hh : 2 ≤ h) (hX : h ≤ X)
      (δ : ℝ) (hδ : 0 < δ),
      (((Finset.Icc X (2*X)).filter (fun x =>
        δ+C'*Real.log (Real.log h)/Real.log h < |shortMean f x h-shortMean f X X|)).card : ℝ) ≤
      C*(X:ℝ)*(Real.rpow (Real.log h) (1/3)/(δ^2*Real.rpow h (δ/25)) +
        1/(δ^2*Real.rpow (Real.log X) (1/50))) := by sorry

/-- Uniform finite character and height separation bounds the normalized harmonic correlation. -/
theorem logarithmic_elliott_finite (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂)
    (b₁ b₂ : ℤ) (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (ε : ℝ) (hε : 0 < ε) :
    ∃ A₀ : ℝ, 1 < A₀ ∧ ∀ A : ℝ, A₀ ≤ A → ∀ x w : ℝ, A ≤ w → w ≤ x →
    ∀ f g : ArithmeticFunction ℂ, f.IsMultiplicative → g.IsMultiplicative →
    (∀ n : ℕ, 0 < n → ‖f n‖ ≤ 1 ∧ ‖g n‖ ≤ 1) →
    (∀ q : ℕ, 1 ≤ q → (q:ℝ) ≤ A → ∀ χ : DirichletCharacter ℂ q,
      ∀ t : ℝ, |t| ≤ A*x →
      A ≤ ∑ p ∈ Nat.primesLE ⌊x⌋₊,
        (1 - (f p * star (χ (p : ZMod q)) *
          Complex.exp (-(t:ℂ)*Complex.I*(Real.log (p:ℝ) : ℂ))).re)/(p:ℝ)) →
    ‖logCorrelation f g a₁ a₂ b₁ b₂ x w‖ ≤ ε := by sorry

/-- Uniform character separation over the whole linear height range gives the limiting Elliott theorem. -/
theorem logarithmic_elliott (f g : ArithmeticFunction ℂ)
    (hf : f.IsMultiplicative) (hg : g.IsMultiplicative)
    (hb : ∀ n : ℕ, 0 < n → ‖f n‖ ≤ 1 ∧ ‖g n‖ ≤ 1)
    (hnonpretentious : ∀ q : ℕ, 1 ≤ q → ∀ χ : DirichletCharacter ℂ q,
      ∀ A : ℝ, 1 ≤ A → ∀ M : ℝ, ∀ᶠ x : ℝ in atTop, ∀ t : ℝ, |t| ≤ A * x →
        M ≤ ∑ p ∈ Nat.primesLE ⌊x⌋₊,
          (1 - (f p * star (χ (p : ZMod q)) *
            Complex.exp (-(t : ℂ) * Complex.I * (Real.log (p : ℝ) : ℂ))).re) / (p : ℝ))
    (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)
    (hd : (a₁ : ℤ) * b₂ - (a₂ : ℤ) * b₁ ≠ 0) (w : ℝ → ℝ)
    (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x)
    (hw : Tendsto w atTop atTop) :
    Tendsto (fun x : ℝ => logCorrelation f g a₁ a₂ b₁ b₂ x (w x)) atTop (𝓝 0) := by sorry

/-- Distinct positive-slope Liouville forms have vanishing normalized logarithmic correlation. -/
theorem logarithmic_chowla (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)
    (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (w : ℝ → ℝ)
    (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x) (hw : Tendsto w atTop atTop) :
    Tendsto (fun x : ℝ => logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) a₁ a₂ b₁ b₂ x (w x)) atTop (𝓝 0) := by sorry

/-- Every real bounded completely multiplicative function with a negative value has a nontrivial correlation bound. -/
theorem real_multiplicative_two_point_nontrivial (f : ArithmeticFunction ℝ)
    (hf1 : f 1 = 1) (hf : ∀ r s : ℕ, 0 < r → 0 < s → f (r*s) = f r * f s)
    (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1)
    (hneg : ∃ n : ℕ, 0 < n ∧ f n < 0) (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, f n * f (n+h)| ≤ (1-δ)*(X:ℝ) := by sorry

/-- At each fixed positive shift an ordinary Liouville correlation stays strictly below its trivial bound. -/
theorem liouville_two_point_nontrivial (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, (ArithmeticFunction.liouville n : ℝ) * (ArithmeticFunction.liouville (n+h) : ℝ)| ≤
        (1-δ)*(X:ℝ) := by sorry

end MetricNumberTheory

end TauCetiRoadmap.ProbabilisticAndMetricNumberTheory
