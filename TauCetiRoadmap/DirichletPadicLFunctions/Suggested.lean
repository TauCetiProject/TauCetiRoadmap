import Mathlib
import TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic
import TauCeti.NumberTheory.DirichletCharacter.Basic

/-!
# DirichletPadicLFunctions: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. README.md is the definitive
roadmap. This file records light definitions and representative end theorems statable against
the pinned APIs. Generic logarithm-series convergence, continuity and addition are supplied by
PadicFunctionalAnalysis §4.5 on the imported `NormedSpace.logOneAdd` carrier.
It fixes the Bernoulli sign, integral
smoothing quotient, the Iwasawa normalization of the p-adic logarithm, normalized analytic
denominator, signed Gamma, full division fibers and ordered arithmetic divisor coefficients.
Arithmetic analytic expressions are evaluated only with the convergence and nonvanishing
hypotheses stated in the roadmap.
-/

noncomputable section

open scoped BigOperators Topology AbstractMeasure PowerSeries
open Filter

namespace TauCetiRoadmap.DirichletPadicLFunctions

/-! ## Layer 0: complex special values -/

/-- The removable Bernoulli kernel, with value one at the origin. -/
def bernoulliKernel (t : ℝ) : ℝ :=
  if t = 0 then 1 else t / (Real.exp t - 1)

/-- The smoothing kernel includes the parameter zero through the divided difference. -/
def smoothedMellinKernel (a t : ℝ) : ℝ :=
  if t = 0 then (a - 1) / 2 else (bernoulliKernel t - bernoulliKernel (a * t)) / t

/-- The kernel is analytic also at its removable point. -/
theorem analyticAt_bernoulliKernel (t : ℝ) : AnalyticAt ℝ bernoulliKernel t := by
  sorry

/-- Its derivatives use the Bernoulli convention with first value `-1/2`. -/
theorem iteratedDeriv_bernoulliKernel (n : ℕ) :
    iteratedDeriv n bernoulliKernel 0 = (bernoulli n : ℝ) := by
  sorry

/-- The coherent normalized Mellin continuation has its negative-integer derivative values. -/
theorem exists_normalizedMellinContinuation (f : ℝ → ℂ)
    (hsmooth : ContDiffOn ℝ ⊤ f (Set.Ici 0))
    (hdecay : ∀ n : ℕ, ∃ C c : ℝ, 0 ≤ C ∧ 0 < c ∧
      ∀ᶠ t : ℝ in atTop,
        ‖iteratedDerivWithin n f (Set.Ici 0) t‖ ≤ C * Real.exp (-c * t)) :
    ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
      (∀ s : ℂ, 0 < s.re → F s = mellin f s / Complex.Gamma s) ∧
      (∀ n : ℕ, F (-(n : ℂ)) =
        (-1 : ℂ) ^ n * iteratedDerivWithin n f (Set.Ici 0) 0) := by
  sorry

example : iteratedDeriv 1 bernoulliKernel 0 = -1 / 2 := by
  sorry
example : iteratedDeriv 2 bernoulliKernel 0 = 1 / 6 := by
  sorry
example : smoothedMellinKernel 2 (Real.log 2) = 1 / 3 := by
  sorry
example : bernoulliKernel 0 = 1 := by simp [bernoulliKernel]
example : bernoulliKernel (Real.log 2) = Real.log 2 := by
  sorry
example : bernoulliKernel (-Real.log 2) = 2 * Real.log 2 := by
  sorry
example : smoothedMellinKernel 2 0 = 1 / 2 := by norm_num [smoothedMellinKernel]
example : smoothedMellinKernel 0 0 = -1 / 2 := by norm_num [smoothedMellinKernel]
example (t : ℝ) : smoothedMellinKernel 1 t = 0 := by
  simp [smoothedMellinKernel]
example : iteratedDeriv 3 (smoothedMellinKernel 2) 0 = 1 / 8 := by
  sorry
example : iteratedDeriv 3 (smoothedMellinKernel 6) 0 =
    iteratedDeriv 3 (smoothedMellinKernel 2) 0 +
      16 * iteratedDeriv 3 (smoothedMellinKernel 3) 0 := by
  sorry

/-- A quartic finite-unit character detects the inverse in the GL₁ Euler convention. -/
example : (Complex.I)⁻¹ = -Complex.I := by simp

/-! ### The Iwasawa logarithm -/

/-- Every nonzero element has a power that is a power of `p` times a principal unit. -/
def HasIwasawaDecomposition (p : ℕ) (K : Type*) [NormedField K] : Prop :=
  ∀ x : K, x ≠ 0 → ∃ n : ℕ, 0 < n ∧ ∃ m : ℤ, ‖x ^ n * (p : K) ^ (-m) - 1‖ < 1

/-- The Iwasawa normalization: zero at `0` and at `p`, additive on nonzero products, and the
logarithm series on the open unit disc around `1`. -/
def IsIwasawaLog (p : ℕ) {K : Type*} [NormedField K] [CharZero K] (L : K → K) : Prop :=
  L 0 = 0 ∧ L p = 0 ∧ (∀ x y : K, x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y) ∧
    ∀ z : K, ‖z‖ < 1 → L (1 + z) = NormedSpace.logOneAdd K K z

/-- Finite extensions of `ℚ_[p]` have the decomposition. -/
theorem hasIwasawaDecomposition_of_finiteDimensional (p : ℕ) [Fact p.Prime] (K : Type*)
    [NormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] :
    HasIwasawaDecomposition p K := by
  sorry

/-- The `p`-adic complex numbers have the decomposition. -/
theorem hasIwasawaDecomposition_padicComplex (p : ℕ) [Fact p.Prime] :
    HasIwasawaDecomposition p ℂ_[p] := by
  sorry

/-- The Iwasawa logarithm exists and is unique under the decomposition hypothesis. -/
theorem existsUnique_isIwasawaLog (p : ℕ) [Fact p.Prime] (K : Type*) [NormedField K]
    [NormedAlgebra ℚ_[p] K] [CompleteSpace K] [CharZero K] (hK : HasIwasawaDecomposition p K) :
    ∃! L : K → K, IsIwasawaLog p L := by
  sorry

/-- The Iwasawa logarithm of `ℂ_[p]`. -/
theorem existsUnique_isIwasawaLog_padicComplex (p : ℕ) [Fact p.Prime] :
    ∃! L : ℂ_[p] → ℂ_[p], IsIwasawaLog p L := by
  sorry

/-- A zero-parameter branch with the same value at zero equals the normalized logarithm. -/
example (p : ℕ) [Fact p.Prime] {L ℓ : ℂ_[p] → ℂ_[p]} (hL : IsIwasawaLog p L)
    (hzero : ℓ 0 = 0) (hp : ℓ p = 0)
    (hmul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → ℓ (x * y) = ℓ x + ℓ y)
    (hseries : ∀ z : ℂ_[p], ‖z‖ < 1 → ℓ (1 + z) = NormedSpace.logOneAdd ℂ_[p] ℂ_[p] z) :
    ℓ = L := by
  obtain ⟨_, _, hM⟩ := existsUnique_isIwasawaLog_padicComplex p
  exact (hM ℓ ⟨hzero, hp, hmul, hseries⟩).trans (hM L hL).symm

/-- The intrinsic Iwasawa logarithm of a finite extension of `ℚ_[p]`. -/
theorem existsUnique_isIwasawaLog_of_finiteDimensional (p : ℕ) [Fact p.Prime] (K : Type*)
    [NormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [CharZero K] :
    ∃! L : K → K, IsIwasawaLog p L := by
  sorry

namespace IsIwasawaLog

variable {p : ℕ} {K : Type*} [NormedField K] [CharZero K] {L : K → K}

/-- A multiplicative function with the same series differs by its value at `p` times `m / n`. -/
theorem natCast_mul_eq_of_map_mul [Fact p.Prime] (hL : IsIwasawaLog p L) {ℓ : K → K}
    (hmul : ∀ x y : K, x ≠ 0 → y ≠ 0 → ℓ (x * y) = ℓ x + ℓ y)
    (hser : ∀ z : K, ‖z‖ < 1 → ℓ (1 + z) = NormedSpace.logOneAdd K K z)
    {x : K} (hx : x ≠ 0) (n : ℕ) (m : ℤ) (hu : ‖x ^ n * (p : K) ^ (-m) - 1‖ < 1) :
    (n : K) * ℓ x = n * L x + m * ℓ p := by
  sorry

/-- Isometric `ℚ_[p]`-algebra maps out of a complete field with the decomposition commute with
the Iwasawa logarithms. -/
theorem map_algHom [Fact p.Prime] [NormedAlgebra ℚ_[p] K] [CompleteSpace K]
    (hK : HasIwasawaDecomposition p K)
    (hL : IsIwasawaLog p L) {K' : Type*} [NormedField K'] [CharZero K'] [NormedAlgebra ℚ_[p] K']
    {L' : K' → K'} (hL' : IsIwasawaLog p L') (σ : K →ₐ[ℚ_[p]] K') (hσ : ∀ x, ‖σ x‖ = ‖x‖)
    (x : K) : L' (σ x) = σ (L x) := by
  sorry

end IsIwasawaLog

/-- Continuous field automorphisms of `ℂ_[p]` commute with its Iwasawa logarithm. -/
theorem IsIwasawaLog.map_padicComplex_ringEquiv {p : ℕ} [Fact p.Prime] {L : ℂ_[p] → ℂ_[p]}
    (hL : IsIwasawaLog p L) (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (x : ℂ_[p]) :
    L (σ x) = σ (L x) := by
  sorry

/-- The Iwasawa logarithm of `ℂ_[p]` preserves every finite extension of `ℚ_[p]` inside it. -/
theorem IsIwasawaLog.mem_intermediateField {p : ℕ} [Fact p.Prime] {L : ℂ_[p] → ℂ_[p]}
    (hL : IsIwasawaLog p L) (F : IntermediateField ℚ_[p] ℂ_[p]) [FiniteDimensional ℚ_[p] F]
    {x : ℂ_[p]} (hx : x ∈ F) : L x ∈ F := by
  sorry

/-- Powers of `p` have logarithm zero. -/
example {p : ℕ} [Fact p.Prime] {K : Type*} [NormedField K] [CharZero K] {L : K → K}
    (hL : IsIwasawaLog p L) (k : ℕ) : L ((p : K) ^ k) = 0 := by
  sorry

/-- The normalization at `p` detects the factor `3²` of `63`. -/
example {L : ℚ_[3] → ℚ_[3]} (hL : IsIwasawaLog 3 L) : L 63 = L 7 := by
  have h3 : L 3 = 0 := by simpa using hL.2.1
  have h63 : (63 : ℚ_[3]) = 3 * 3 * 7 := by norm_num
  rw [h63, hL.2.2.1 _ _ (by norm_num) (by norm_num), hL.2.2.1 _ _ (by norm_num) (by norm_num),
    h3]
  ring

example {L : ℚ_[2] → ℚ_[2]} (hL : IsIwasawaLog 2 L) : L (-1) = 0 := by
  sorry

/-- At `p = 2` the series itself vanishes at the root of unity `-1`. -/
example : NormedSpace.logOneAdd ℚ_[2] ℚ_[2] (-2) = 0 := by
  sorry

/-- The product of the conjugates `1 ± 3i` is `10`. -/
example {K : Type*} [NormedField K] [CharZero K] {L : K → K} (hL : IsIwasawaLog 3 L) (i : K)
    (hi : i ^ 2 = -1) : L (1 + 3 * i) + L (1 - 3 * i) = L 10 := by
  have hprod : (1 + 3 * i) * (1 - 3 * i) = 10 := by linear_combination (-9) * hi
  have h10 : (10 : K) ≠ 0 := by norm_num
  have h1 : 1 + 3 * i ≠ 0 := fun h => h10 (by rw [← hprod, h, zero_mul])
  have h2 : 1 - 3 * i ≠ 0 := fun h => h10 (by rw [← hprod, h, mul_zero])
  rw [← hprod, hL.2.2.1 _ _ h1 h2]

/-- The logarithm of `4` in `ℚ_[3]` has the norm of `3`. -/
example : ‖NormedSpace.logOneAdd ℚ_[3] ℚ_[3] 3‖ = 1 / 3 := by
  sorry

/-- The first two terms of the dyadic series for `log 3` cancel. -/
example : ‖NormedSpace.logOneAdd ℚ_[2] ℚ_[2] 2‖ = 1 / 4 := by
  sorry

/-- A branch with value one at `p` is not the Iwasawa logarithm. -/
example {p : ℕ} {K : Type*} [NormedField K] [CharZero K] {L : K → K} (h : L p = 1) :
    ¬ IsIwasawaLog p L := fun hL => one_ne_zero (h.symm.trans hL.2.1)

/-- The pair `N = 2, m = 0` is admissible for `2` in `ℚ_[3]`. -/
example : ‖(2 : ℚ_[3]) ^ 2 * (3 : ℚ_[3]) ^ (-(0 : ℤ)) - 1‖ < 1 := by
  sorry

/-- Positive ordinary moments separate unit measures over characteristic-zero coefficient
 domains, including a finite extension of `ℚ_[p]` and its integer ring. -/
theorem unitMeasure_eq_zero_of_positive_moments (p : ℕ) [Fact p.Prime]
    {R : Type*} [NormedCommRing R] [IsDomain R] [CharZero R] [Algebra ℤ_[p] R]
    [IsUltrametricDist R] [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
    [ContinuousSMul ℤ_[p] R] (μ : AbstractMeasure (ℤ_[p])ˣ R R)
    (hμ : ∀ k : ℕ, 0 < k →
      μ ⟨fun u => (algebraMap ℤ_[p] R (u : ℤ_[p])) ^ k, by fun_prop⟩ = 0) :
    μ = 0 := by
  sorry

/-! ## Layer 1: integral smoothing -/

/-- Dividing the binomial polynomial by its zero at the origin shifts coefficients once. -/
def smoothingDenominator (R : Type*) [CommRing R] (a : ℕ) : PowerSeries R :=
  PowerSeries.mk fun n => (a.choose (n + 1) : R)

/-- The second coefficient shift is the integral numerator of the smoothing series. -/
def smoothingTail (R : Type*) [CommRing R] (a : ℕ) : PowerSeries R :=
  PowerSeries.mk fun n => (a.choose (n + 2) : R)

/-- Only the scalar `a` must be a unit; no inverse of the variable is used. -/
def smoothedSeries (R : Type*) [CommRing R] (a : ℕ) (ha : IsUnit (a : R)) :
    PowerSeries R :=
  smoothingTail R a * (smoothingDenominator R a).invOfUnit ha.unit

/-- The arithmetic measure is a specialization of the existing inverse Amice transform. -/
def smoothedMeasure (p : ℕ) [Fact p.Prime] (a : ℕ) (ha : IsUnit (a : ℤ_[p])) :
    AbstractMeasure ℤ_[p] ℤ_[p] ℤ_[p] :=
  AbstractMeasure.invTransform (smoothedSeries ℤ_[p] a ha)

/-- The ordinary moment of the original smoothing measure. -/
def smoothingMoment (a k : ℕ) : ℚ :=
  (1 - (a : ℚ) ^ (k + 1)) * bernoulli (k + 1) / (k + 1)

/-- The rational abbreviation for positive moments of the inverse-weighted unit numerator. -/
def clearingMoment (p a k : ℕ) : ℚ :=
  (1 - (p : ℚ) ^ (k - 1)) * (1 - (a : ℚ) ^ k) * bernoulli k / k

/-- Finite residue masses, with division in a characteristic-zero field. -/
def smoothingResidueCandidate (a q r v : ℕ) : ℚ :=
  ((a : ℚ) - 1) / 2 + ((r : ℚ) - (a : ℚ) * v) / q

/-- The defining unit denominator determines the entire integral series. -/
theorem smoothedSeries_spec {R : Type*} [CommRing R] (a : ℕ) (ha : IsUnit (a : R)) :
    smoothingDenominator R a * smoothedSeries R a ha = smoothingTail R a := by
  sorry

/-- This arithmetic identity uses the existing Amice equivalence. -/
theorem smoothedMeasure_transform (p : ℕ) [Fact p.Prime]
    (a : ℕ) (ha : IsUnit (a : ℤ_[p])) :
    (smoothedMeasure p a ha).amiceTransform = smoothedSeries ℤ_[p] a ha := by
  sorry

/-- Ordinary moments are obtained by iterated Mahler differentiation, not coefficient extraction. -/
theorem smoothedMeasure_moment (p : ℕ) [Fact p.Prime]
    (a : ℕ) (ha : IsUnit (a : ℤ_[p])) (k : ℕ) :
    algebraMap ℤ_[p] ℚ_[p]
        ((smoothedMeasure p a ha) ⟨fun x => x ^ k, by fun_prop⟩) =
      (smoothingMoment a k : ℚ_[p]) := by
  sorry

example : smoothedSeries ℚ 1 (by norm_num) = 0 := by
  sorry
example : smoothingDenominator (ZMod 2) 2 = PowerSeries.X := by
  sorry
example (ha : IsUnit (3 : ℤ_[2])) :
    algebraMap ℤ_[2] ℚ_[2] ((smoothedMeasure 2 3 ha) 1) = 1 := by
  sorry
example (ha : IsUnit (3 : ℤ_[2])) :
    algebraMap ℤ_[2] ℚ_[2]
      ((smoothedMeasure 2 3 ha) ⟨fun x => x, continuous_id⟩) = -2 / 3 := by
  sorry
example : smoothingDenominator ℤ 0 = 0 := by
  sorry
example : smoothingDenominator ℤ 1 = 1 := by
  sorry
example : smoothingDenominator ℤ 2 = 2 + PowerSeries.X := by
  sorry
example : smoothingTail ℤ 0 = 0 := by
  sorry
example : smoothingTail ℤ 1 = 0 := by
  sorry
example : smoothingTail ℤ 2 = 1 := by
  sorry
example : (smoothedSeries ℚ 2 (by norm_num)).coeff 0 = 1 / 2 := by
  sorry
example : (smoothedSeries ℚ 2 (by norm_num)).coeff 1 = -1 / 4 := by
  sorry
example : (smoothedSeries ℚ 2 (by norm_num)).coeff 2 = 1 / 8 := by
  sorry
example : (smoothedSeries ℚ 2 (by norm_num)).coeff 3 = -1 / 16 := by
  sorry
example (p : ℕ) [Fact p.Prime] (ha : IsUnit (1 : ℤ_[p])) :
    smoothedMeasure p 1 ha = 0 := by
  sorry
example (p : ℕ) [Fact p.Prime] (ha : IsUnit (2 : ℤ_[p])) :
    algebraMap ℤ_[p] ℚ_[p] ((smoothedMeasure p 2 ha) 1) = 1 / 2 := by
  sorry
example (p : ℕ) [Fact p.Prime] (ha : IsUnit (2 : ℤ_[p])) :
    algebraMap ℤ_[p] ℚ_[p]
      ((smoothedMeasure p 2 ha) ⟨fun x => x ^ 3, by fun_prop⟩) = 1 / 8 := by
  sorry
example : smoothingMoment 2 0 = 1 / 2 := by
  norm_num [smoothingMoment, bernoulli_one]
example : smoothingMoment 2 1 = -1 / 4 := by
  norm_num [smoothingMoment, bernoulli_two]
example : smoothingMoment 2 3 = 1 / 8 := by
  sorry
example : clearingMoment 3 2 1 = 0 := by norm_num [clearingMoment]
example : clearingMoment 3 2 2 = 1 / 2 := by norm_num [clearingMoment, bernoulli_two]
example : clearingMoment 2 3 2 = 2 / 3 := by norm_num [clearingMoment, bernoulli_two]
example : smoothingResidueCandidate 2 3 0 0 = 1 / 2 := by
  norm_num [smoothingResidueCandidate]
example : smoothingResidueCandidate 2 3 1 2 = -1 / 2 := by
  norm_num [smoothingResidueCandidate]
example : smoothingResidueCandidate 3 2 1 1 = 0 := by
  norm_num [smoothingResidueCandidate]
example : smoothingResidueCandidate 2 1 0 0 = 1 / 2 := by
  norm_num [smoothingResidueCandidate]
example (h₂ : IsUnit (2 : ℤ_[3])) (h₄ : IsUnit (4 : ℤ_[3]))
    (h₈ : IsUnit (8 : ℤ_[3])) :
    (smoothedMeasure 3 8 h₈) ⟨fun x => x, continuous_id⟩ =
      (smoothedMeasure 3 2 h₂) ⟨fun x => x, continuous_id⟩ +
        4 * (smoothedMeasure 3 4 h₄) ⟨fun x => x, continuous_id⟩ := by
  sorry
example (F : PowerSeries ℚ) :
    (((fun G : PowerSeries ℚ => (1 + PowerSeries.X) * PowerSeries.derivative G)^[3]) F).coeff 0 =
      F.coeff 1 + 6 * F.coeff 2 + 6 * F.coeff 3 := by
  sorry
example :
    (((fun G : PowerSeries ℚ => (1 + PowerSeries.X) * PowerSeries.derivative G)^[3])
      (smoothedSeries ℚ 2 (by norm_num))).coeff 0 = 1 / 8 := by
  sorry
example : ¬ IsUnit (2 : ℤ_[2]) := by
  sorry

/-! ## Layer 2: finite character kernels -/

/-- Finite character cancellation produces an integral polynomial numerator. -/
def tameNumerator {R : Type*} [CommRing R] {D : ℕ} [NeZero D]
    (η : DirichletCharacter R D) : PowerSeries R :=
  -∑ a : ZMod D, PowerSeries.C (η a) * smoothingDenominator R a.val

/-- The tame quotient is defined over any commutative ring in which its level is a unit. -/
def tameSeries {R : Type*} [CommRing R] {D : ℕ} [NeZero D]
    (η : DirichletCharacter R D) (hD : IsUnit (D : R)) : PowerSeries R :=
  tameNumerator η * (smoothingDenominator R D).invOfUnit hD.unit

/-- The finite tame denominator identity does not assume nonprincipality. -/
theorem tameSeries_spec {R : Type*} [CommRing R] {D : ℕ} [NeZero D]
    (η : DirichletCharacter R D) (hD : IsUnit (D : R)) :
    smoothingDenominator R D * tameSeries η hD = tameNumerator η := by
  sorry

example : tameNumerator (1 : DirichletCharacter ℚ 1) = 0 := by
  sorry
example : tameNumerator (1 : DirichletCharacter ℚ 3) = -3 - PowerSeries.X := by
  sorry
example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    tameNumerator η = 1 + PowerSeries.X := by
  sorry
example : tameSeries (1 : DirichletCharacter ℚ 1) (by norm_num) = 0 := by
  sorry
example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    (tameSeries η (by norm_num)).coeff 0 = 1 / 3 := by
  sorry
example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    (tameSeries η (by norm_num)).coeff 1 = 0 := by
  sorry
example (η : DirichletCharacter ℚ_[3] 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    ‖(tameSeries η (by norm_num)).coeff 0‖ = 3 := by
  sorry
example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    (tameSeries η (by norm_num)).coeff 2 = -1 / 9 := by
  sorry
example {R : Type*} [CommMonoidWithZero R] {N d : ℕ} [NeZero N]
    (χ : DirichletCharacter R N) (hd : d ∣ N) (hχ : ¬ χ.FactorsThrough d)
    (u : (ZMod N)ˣ) :
    ∃ v : (ZMod N)ˣ, ZMod.unitsMap hd v = ZMod.unitsMap hd u ∧
      χ.toUnitHom v ≠ χ.toUnitHom u :=
  DirichletCharacter.exists_alt_unit_in_coset_with_char_separation hd hχ u
example (i A₁ A₂ A₃ A₄ : ℂ) :
    A₁ + i * A₂ - i * A₃ - A₄ = A₁ - A₄ + i * (A₂ - A₃) := by ring
example : (1 - (2 : ℚ) ^ (2 - 1)) * (-2 / 3) = 2 / 3 := by norm_num
example : (1 - (3 : ℚ) ^ (2 - 1)) * (-1 / 12) = 1 / 6 := by norm_num

/-! ## Layer 3: analytic branches and the residue -/

/-- The smoothing logarithm is a separate parameter from the numerator chart logarithm. -/
def analyticDenominator {K : Type*} [NormedField K] (c A s : K) : K :=
  c * NormedSpace.exp ((1 - s) * A) - 1

/-- A coefficient series is evaluated by its actual scalar sum; convergence is a theorem input. -/
def analyticNumerator {K : Type*} [NormedField K]
    (F : PowerSeries K) (L s : K) : K :=
  ∑' n : ℕ, F.coeff n * (NormedSpace.exp ((1 - s) * L) - 1) ^ n

/-- This scalar quotient represents the branch only where its denominator is nonzero. -/
def analyticBranch {K : Type*} [NormedField K]
    (F : PowerSeries K) (L c A s : K) : K :=
  analyticNumerator F L s / analyticDenominator c A s

/-- The central denominator and its derivative carry the negative sign of `1-s`. -/
theorem analyticDenominator_hasDerivAt {K : Type*} [NontriviallyNormedField K]
    [CharZero K] [CompleteSpace K] (c A : K)
    (hexp : HasDerivAt (NormedSpace.exp : K → K) 1 0) :
    HasDerivAt (analyticDenominator c A) (-c * A) 1 := by
  sorry

/-- A continuous central numerator and a simple zero denominator give the normalized residue. -/
theorem cleared_branch_residue {K : Type*} [NontriviallyNormedField K]
    (N d : K → K) (A : K) (hA : A ≠ 0)
    (hN : ContinuousAt N 1) (hd : d 1 = 0) (hd' : HasDerivAt d (-A) 1) :
    Tendsto (fun s => (s - 1) * (N s / d s)) (𝓝[≠] 1) (𝓝 (-N 1 / A)) := by
  sorry

example {K : Type*} [NormedField K] (A : K) :
    analyticDenominator (1 : K) A 1 = 0 := by simp [analyticDenominator]
example : analyticDenominator (-1 : ℚ_[2]) 0 1 = -2 := by
  norm_num [analyticDenominator]
example {K : Type*} [NormedField K] (s : K) :
    analyticDenominator (1 : K) 0 s = 0 := by simp [analyticDenominator]
example {K : Type*} [NormedField K] (b L s : K) :
    analyticNumerator (PowerSeries.C b) L s = b := by
  sorry
example {K : Type*} [NormedField K] (F : PowerSeries K) (L : K) :
    analyticNumerator F L 1 = F.coeff 0 := by
  sorry
example {K : Type*} [NormedField K] (L s : K) :
    analyticNumerator (PowerSeries.X : PowerSeries K) L s =
      NormedSpace.exp ((1 - s) * L) - 1 := by
  sorry
example : analyticBranch (PowerSeries.C (1 : ℚ_[3])) 0 2 0 1 = 1 := by
  sorry
example : analyticBranch (PowerSeries.C (1 : ℚ_[3])) 0 1 0 1 = 0 := by
  simp [analyticBranch, analyticDenominator]
example {K : Type*} [NormedField K] (L s : K) :
    analyticBranch (PowerSeries.X : PowerSeries K) L 0 0 s =
      1 - NormedSpace.exp ((1 - s) * L) := by
  sorry
example : -(1 - (3 : ℚ)⁻¹) * (-1) = 2 / 3 := by norm_num
example : (-(-(Complex.I * Real.pi / 3)) : ℂ) / (Complex.I * Real.sqrt 3) =
    Real.pi / (3 * Real.sqrt 3) := by
  have h : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (show Real.sqrt 3 ≠ 0 by positivity)
  field_simp [Complex.I_ne_zero, h]
example (p : ℕ) [Fact p.Prime] : ‖((1 : (ℤ_[p])ˣ) : ℤ_[p])‖ = 1 := by
  simp

/-- The powered cyclotomic logarithm sum on its nonzero-argument domain, normalized by
 the inverse-character Gauss sum. -/
def cyclotomicPoweredLogConstant {K : Type*} [Field K] {D : ℕ} [NeZero D]
    (η : DirichletCharacter K D) (ε : K) (L : K → K) (m : ℕ)
    (_hdom : ∀ a : (ZMod D)ˣ, ε ^ (m * (a : ZMod D).val) ≠ 1) : K :=
  -(∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D) * ε ^ (a : ZMod D).val)⁻¹ *
    ∑ a : (ZMod D)ˣ, η⁻¹ (a : ZMod D) * L (ε ^ (m * (a : ZMod D).val) - 1)

/-- The cyclotomic integration constant uses the original root, without powering it. -/
def cyclotomicLogConstant {K : Type*} [Field K] {D : ℕ} [NeZero D]
    (η : DirichletCharacter K D) (ε : K) (L : K → K)
    (hdom : ∀ a : (ZMod D)ˣ, ε ^ (a : ZMod D).val ≠ 1) : K :=
  cyclotomicPoweredLogConstant η ε L 1 (by simpa using hdom)

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicPoweredLogConstant η 2 (fun x => x) 1 (by decide) = -1 := by
  sorry

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicPoweredLogConstant η 2 (fun x => x) 2 (by decide) = -6 := by
  sorry

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicPoweredLogConstant η 2 (fun x => x) 3 (by decide) = -28 := by
  sorry

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicLogConstant η 2 (fun x => x) (by decide) = -1 := by
  sorry

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicLogConstant η 2 (fun x => x ^ 2) (by decide) = -4 := by
  sorry

example (η : DirichletCharacter ℚ 3) (h₁ : η 1 = 1) (h₂ : η 2 = -1) :
    cyclotomicLogConstant η 2 (fun x => x ^ 3) (by decide) = -13 := by
  sorry

example {K : Type*} [NormedField K] [NormedAlgebra ℚ_[3] K] [CharZero K]
    (η : DirichletCharacter K 5) (ε : K) (L : K → K)
    (hdom : ∀ a : (ZMod 5)ˣ, ε ^ (a : ZMod 5).val ≠ 1) :
    cyclotomicPoweredLogConstant η ε L 1 (by simpa using hdom) =
      cyclotomicLogConstant η ε L hdom := rfl

example {K : Type*} [NormedField K] [NormedAlgebra ℚ_[3] K] [CharZero K]
    (η : DirichletCharacter K 5) (ε : K) (hε : IsPrimitiveRoot ε 5)
    (h₁ : η 1 = 1) (h₂ : η 2 = -1) (h₃ : η 3 = -1) (h₄ : η 4 = 1)
    (L : K → K) (hL : IsIwasawaLog 3 L)
    (hdom₁ : ∀ a : (ZMod 5)ˣ, ε ^ (a : ZMod 5).val ≠ 1)
    (hdom₂ : ∀ a : (ZMod 5)ˣ, ε ^ (2 * (a : ZMod 5).val) ≠ 1) :
    cyclotomicPoweredLogConstant η ε L 2 hdom₂ =
      -cyclotomicLogConstant η ε L hdom₁ := by
  sorry

example {K : Type*} [Field K] (ε : K) (hε : IsPrimitiveRoot ε 5) :
    ¬ (∀ a : (ZMod 5)ˣ, ε ^ (5 * (a : ZMod 5).val) ≠ 1) := by
  sorry

example : ‖-(2 / 3 : ℚ_[3]) * NormedSpace.logOneAdd ℚ_[3] ℚ_[3] 3‖ = 1 := by
  sorry
example : ‖-(1 / 2 : ℚ_[2]) * NormedSpace.logOneAdd ℚ_[2] ℚ_[2] 2‖ = 1 / 2 := by
  sorry

/-! ## Layer 4: signed Gamma and universal division -/

/-- Natural signed Gamma values omit every multiple of the chosen prime. -/
def moritaNaturalValue (p n : ℕ) : ℤ :=
  (-1) ^ n * ∏ j ∈ (Finset.range n).filter (fun j => ¬p ∣ j), (j : ℤ)

/-- Morita's averaging modulus differs from the safe exponential-disc modulus. -/
def moritaModulus (p : ℕ) : ℕ := if p = 2 then 4 else p

/-- All finite character means use the same character-compatible tower. -/
def moritaMeanLevel (p f n : ℕ) : ℕ :=
  Nat.lcm f (moritaModulus p) * moritaModulus p ^ n

/-- The mean uses its actual inverse denominator, and never asserts integrality of that inverse. -/
def moritaFiniteMean {K : Type*} [Field K] (p : ℕ) {f : ℕ}
    (χ : DirichletCharacter K f) (n : ℕ) (F : ℕ → K) : K :=
  (moritaMeanLevel p f n : K)⁻¹ *
    ∑ a ∈ (Finset.range (moritaMeanLevel p f n)).filter (fun a => ¬p ∣ a), χ a * F a

/-- Rescaling a continuous signed Gamma interpolation gives its disc restriction. -/
def gammaDisc (p : ℕ) [Fact p.Prime] (Γ : C(ℤ_[p], (ℤ_[p])ˣ)) (r : ℕ) :
    C(ℤ_[p], (ℤ_[p])ˣ) :=
  Γ.comp ⟨fun x => (p : ℤ_[p]) ^ r * x, by fun_prop⟩

/-- The finite-mean bound retains the inverse common level and the squared inverse modulus. -/
def moritaMeanBound (K : Type*) [NormedField K] (p f : ℕ) : ℝ :=
  max ‖(Nat.lcm f (moritaModulus p) : K)⁻¹‖ (‖(moritaModulus p : K)⁻¹‖ ^ 2)

/-- The truncated digit sum uses exactly `f` digits. -/
def grossKoblitzDigitSum (p a f : ℕ) : ℕ :=
  ∑ i ∈ Finset.range f, (a / p ^ i) % p

/-- This finite count has the open upper endpoint of the Gamma product. -/
def gammaUnitCount (p n : ℕ) : ℕ :=
  ((Finset.range n).filter (fun j => 0 < j ∧ ¬p ∣ j)).card

/-- The explicit residue permutation formula uses the positive residue representative. -/
def ferreroGreenbergPermutationValue (N B m : ℕ) : ℕ :=
  let a := if m % N = 0 then N else m % N
  (m - a) / N + 1 + (N - a) * ((B - 1) / N)

/-- The full finite multiplication fiber gives the native free-abelian-group relator. -/
def divisionRelator {X : Type*} [AddCommGroup X] (m w : ℕ) (a : X)
    [Finite {b : X // m • b = a}] : FreeAbelianGroup X := by
  classical
  letI := Fintype.ofFinite {b : X // m • b = a}
  exact m ^ w • (∑ b : {b : X // m • b = a}, FreeAbelianGroup.of b.val) -
    FreeAbelianGroup.of a

/-- Signed Gamma exists uniquely as a continuous unit-valued interpolation. -/
theorem existsUnique_moritaGamma (p : ℕ) [Fact p.Prime] :
    ∃! Γ : C(ℤ_[p], (ℤ_[p])ˣ),
      ∀ n : ℕ, ((Γ (n : ℤ_[p]) : (ℤ_[p])ˣ) : ℤ_[p]) =
        (moritaNaturalValue p n : ℤ_[p]) := by
  sorry

/-- The integer congruence excludes precisely the exceptional binary exponent two. -/
theorem moritaNaturalValue_congruence (p : ℕ) (hp : p.Prime) (r m n : ℕ)
    (hr : 0 < r) (hbinary : p = 2 → r ≠ 2) (hmn : m % p ^ r = n % p ^ r) :
    Int.ModEq (p ^ r : ℕ) (moritaNaturalValue p m) (moritaNaturalValue p n) := by
  sorry

/-- The sum of the cyclic rational orbit equals the base-p digit sum divided by p-1. -/
theorem grossKoblitz_fraction_sum (p f a : ℕ) (hp : p.Prime) (hf : 0 < f)
    (ha : a < p ^ f - 1) :
    (∑ j ∈ Finset.range f, ((p ^ j * a % (p ^ f - 1) : ℕ) : ℚ) / (p ^ f - 1)) =
      (grossKoblitzDigitSum p a f : ℚ) / (p - 1) := by
  sorry

/-- The residue permutation has the multiplicative direction `N*iota=m mod B`. -/
theorem ferreroGreenbergPermutationValue_congruence (p N B m : ℕ)
    (hp : p.Prime) (hN : 0 < N) (hB : 1 < B) (hpB : p ∣ B)
    (hcop : N.Coprime p) (hBN : B % N = 1 % N)
    (hm : 0 < m ∧ m < B ∧ ¬p ∣ m) :
    Nat.ModEq B (N * ferreroGreenbergPermutationValue N B m) m := by
  sorry

example (Γ : C(ℤ_[3], (ℤ_[3])ˣ))
    (hΓ : ∀ n : ℕ, (Γ (n : ℤ_[3]) : ℤ_[3]) = (moritaNaturalValue 3 n : ℤ_[3])) :
    (gammaDisc 3 Γ 0 1 : ℤ_[3]) = -1 := by
  sorry
example (Γ : C(ℤ_[3], (ℤ_[3])ˣ))
    (hΓ : ∀ n : ℕ, (Γ (n : ℤ_[3]) : ℤ_[3]) = (moritaNaturalValue 3 n : ℤ_[3])) :
    (gammaDisc 3 Γ 1 1 : ℤ_[3]) = -2 := by
  sorry
example (Γ : C(ℤ_[3], (ℤ_[3])ˣ))
    (hΓ : ∀ n : ℕ, (Γ (n : ℤ_[3]) : ℤ_[3]) = (moritaNaturalValue 3 n : ℤ_[3])) :
    (gammaDisc 3 Γ 2 1 : ℤ_[3]) = -2240 := by
  sorry
example : moritaMeanBound ℚ_[2] 2 1 = 16 := by
  sorry
example : moritaMeanBound ℚ_[3] 3 1 = 9 := by
  sorry
example : moritaMeanBound ℚ_[3] 3 27 = 27 := by
  sorry
example : moritaNaturalValue 2 0 = 1 := by decide
example : moritaNaturalValue 2 1 = -1 := by decide
example : moritaNaturalValue 3 4 = 2 := by decide
example : moritaNaturalValue 2 5 = -3 := by decide
example : ¬ Int.ModEq 4 (moritaNaturalValue 2 1) (moritaNaturalValue 2 5) := by decide
example : moritaModulus 2 = 4 := by norm_num [moritaModulus]
example : moritaModulus 3 = 3 := by norm_num [moritaModulus]
example : moritaModulus 5 = 5 := by norm_num [moritaModulus]
example : moritaMeanLevel 2 3 0 = 12 := by norm_num [moritaMeanLevel, moritaModulus]
example : moritaMeanLevel 2 3 1 = 48 := by norm_num [moritaMeanLevel, moritaModulus]
example : moritaMeanLevel 3 1 1 = 9 := by norm_num [moritaMeanLevel, moritaModulus]
example : moritaFiniteMean 2 (1 : DirichletCharacter ℚ 3) 0 (fun _ => 1) = 1 / 3 := by
  sorry
example (χ : DirichletCharacter ℚ 3) (h₁ : χ 1 = 1) (h₂ : χ 2 = -1) :
    moritaFiniteMean 2 χ 0 (fun _ => 1) = 0 := by
  sorry
example : moritaFiniteMean 3 (1 : DirichletCharacter ℚ 1) 0 (fun _ => 1) = 2 / 3 := by
  sorry
example : moritaFiniteMean 2 (1 : DirichletCharacter ℚ 1) 0 (fun _ => 1) = 1 / 2 := by
  sorry
example {K : Type*} [Field K] (p : ℕ) {f : ℕ} (χ : DirichletCharacter K f) (n : ℕ) :
    moritaFiniteMean p χ n (fun _ => 0) = 0 := by simp [moritaFiniteMean]
example : grossKoblitzDigitSum 3 5 2 = 3 := by norm_num [grossKoblitzDigitSum, Finset.sum_range_succ]
example : grossKoblitzDigitSum 2 13 4 = 3 := by norm_num [grossKoblitzDigitSum, Finset.sum_range_succ]
example : grossKoblitzDigitSum 2 0 1 = 0 := by norm_num [grossKoblitzDigitSum]
example : gammaUnitCount 3 1 = 0 := by decide
example : gammaUnitCount 3 4 = 2 := by decide
example : gammaUnitCount 5 3 = 2 := by decide
example : ferreroGreenbergPermutationValue 3 25 1 = 17 := by
  norm_num [ferreroGreenbergPermutationValue]
example : ferreroGreenbergPermutationValue 3 25 3 = 1 := by
  norm_num [ferreroGreenbergPermutationValue]
example : ferreroGreenbergPermutationValue 3 25 24 = 8 := by
  norm_num [ferreroGreenbergPermutationValue]
example : divisionRelator 1 0 (0 : ZMod 1) = 0 := by
  sorry
example : divisionRelator 2 0 (0 : ZMod 2) = FreeAbelianGroup.of (1 : ZMod 2) := by
  sorry
example : divisionRelator 2 2 (0 : ZMod 1) = 3 • FreeAbelianGroup.of (0 : ZMod 1) := by
  sorry
example : divisionRelator 2 1 (0 : ZMod 1) = FreeAbelianGroup.of (0 : ZMod 1) := by
  sorry
example : divisionRelator 3 2 (0 : ZMod 1) = 8 • FreeAbelianGroup.of (0 : ZMod 1) := by
  sorry
example : (3 : ℤ) * 3 - 8 = 1 := by norm_num
example : ((1 : ℤ) + 1) = 2 ∧ ((-1 : ℤ) + 1) = 0 := by norm_num
example : (1 : ℚ) / 2 + (-1 / 2) = 0 := by norm_num
example : (-1 : ℤ) ^ (1 + 1) = 1 ∧ (-1 : ℤ) ^ (1 + 0) = -1 := by norm_num
example : -( (-1 : ℚ)) = 1 := by norm_num
example : ((1 : ℚ) + 27) = 28 := by norm_num
example : (1 : ℚ) - ((1 / 3 : ℚ) + 1 / 3 + 1 / 3) = 0 := by norm_num
example : (1 / 6 : ℚ) = 2 * (1 / 6 + (-1 / 12)) := by norm_num

/-! ## Layer 5: positive Eisenstein coefficients and shifted clearing -/

/-- The light integer moment of the positive divisor measure, with natural divisor conventions. -/
def eisensteinPositiveMoment (p n e : ℕ) : ℤ :=
  ∑ d ∈ n.divisors.filter (fun d => ¬p ∣ d), (d : ℤ) ^ e

/-- The actual continuous power test on the compact native unit group. -/
def unitPowerTest (p : ℕ) [Fact p.Prime] (e : ℕ) : C((ℤ_[p])ˣ, ℚ_[p]) where
  toFun u := (u.val : ℚ_[p]) ^ e
  continuous_toFun := by fun_prop

/-- Finite unit exponents give uniform convergence in a fixed weight component, also at two. -/
theorem unitPowerSequence_uniform (p : ℕ) [Fact p.Prime] (k r : ℕ) :
    ‖unitPowerTest p (k + (p - 1) * p ^ r) - unitPowerTest p k‖ ≤
      (p : ℝ) ^ (-(r + 1 : ℤ)) := by
  sorry

/-- Continuity rules out the undeleted prime-power moments on the unit group. -/
theorem not_exists_primePower_moments (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : AbstractMeasure (ℤ_[p])ˣ ℚ_[p] ℚ_[p],
      ∀ e : ℕ, μ (unitPowerTest p e) = (p : ℚ_[p]) ^ e := by
  sorry

/-- The doubled shifted denominator evaluated at an arithmetic moment. -/
def shiftedClearingValue {K : Type*} [CommRing K] (u : K) (e : ℕ) : K :=
  2 * (u ^ (e + 1) - 1)

/-- The ordinary difference and shifted denominator have different inverse-character values. -/
theorem shiftedClearingValue_inverse {K : Type*} [Field K] (u : K) (hu : u ≠ 0) :
    2 * (u * u⁻¹ - 1) = 0 := by
  simp [hu]

/-- The surviving divisor sum is unchanged on multiplying the index by p. -/
theorem eisensteinPositiveMoment_mul_p (p : ℕ) (hp : p.Prime) (n e : ℕ) (hn : 0 < n) :
    eisensteinPositiveMoment p (p * n) e = eisensteinPositiveMoment p n e := by
  sorry

/-- The positive coefficient is the arithmetic p-stabilized divisor coefficient. -/
theorem eisensteinPositiveMoment_euler (p : ℕ) (hp : p.Prime) (n e : ℕ)
    (hn : 0 < n) (hpn : p ∣ n) :
    eisensteinPositiveMoment p n e =
      (∑ d ∈ n.divisors, (d : ℤ) ^ e) -
        (p : ℤ) ^ e * ∑ d ∈ (n / p).divisors, (d : ℤ) ^ e := by
  sorry

/-- Odd weight five cannot have the asserted normalized positive Eisenstein coefficient. -/
example : bernoulli 5 = 0 ∧ eisensteinPositiveMoment 2 1 4 = 1 := by
  constructor
  · exact bernoulli_eq_zero_of_odd (by decide) (by decide)
  · decide

example : unitPowerTest 2 0 (-1) = 1 := by simp [unitPowerTest]
example : unitPowerTest 2 1 (-1) = -1 := by simp [unitPowerTest]
example : unitPowerTest 2 2 (-1) = 1 := by simp [unitPowerTest]
example (u : (ℤ_[3])ˣ) : unitPowerTest 3 0 u = 1 := by
  simp [unitPowerTest]
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) : unitPowerTest 3 1 u = 2 := by
  have hcast : ((2 : ℤ_[3]) : ℚ_[3]) = 2 := rfl
  simp [unitPowerTest, hu, hcast]
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) : unitPowerTest 3 2 u = 4 := by
  have hcast : ((2 : ℤ_[3]) : ℚ_[3]) = 2 := rfl
  norm_num [unitPowerTest, hu, hcast]
example (u : (ℤ_[3])ˣ) (hu : (u : ℤ_[3]) = 2) :
    ‖(unitPowerTest 3 2 - unitPowerTest 3 0) u‖ = 1 / 3 := by
  have hcast : ((2 : ℤ_[3]) : ℚ_[3]) = 2 := rfl
  have h : (unitPowerTest 3 2 - unitPowerTest 3 0) u = (3 : ℚ_[3]) := by
    norm_num [unitPowerTest, hu, hcast]
  have hp : ‖(3 : ℚ_[3])‖ = (3 : ℝ)⁻¹ := Padic.norm_p
  rw [h, hp]
  norm_num
example : ‖(1 / 6 : ℚ_[2])‖ = 2 := by
  sorry
example : (-1 / 3 : ℚ) - 2 / 3 = -1 := by norm_num
example : ((1 : ℚ) / 2) * (1 / 3) = 1 / 6 := by norm_num
example : eisensteinPositiveMoment 5 2 7 - eisensteinPositiveMoment 5 2 3 = 120 := by
  decide
/-- The angular weight-four adapter retains the normalized constant and divisor coefficient. -/
example : eisensteinPositiveMoment 5 2 3 = 9 ∧
    (1 - (5 : ℚ) ^ 3) * ((1 / 120) / 2) = -31 / 60 := by
  constructor
  · decide
  · norm_num
example : eisensteinPositiveMoment 2 6 0 = 2 := by decide
example : eisensteinPositiveMoment 2 6 3 = 28 := by decide
example : eisensteinPositiveMoment 3 6 1 = 3 := by decide
example : eisensteinPositiveMoment 2 4 3 = 1 := by decide
example : eisensteinPositiveMoment 2 0 3 = 0 := by simp [eisensteinPositiveMoment]
example : shiftedClearingValue (3 : ℚ) 3 = 160 := by norm_num [shiftedClearingValue]
example : shiftedClearingValue (1 : ℤ) 0 = 0 := by norm_num [shiftedClearingValue]
example : shiftedClearingValue (4 : ℤ) 0 = 6 := by norm_num [shiftedClearingValue]
example : clearingMoment 2 3 4 = -14 / 3 := by
  sorry
example : ((-14 / 3 : ℚ) / 160) = -7 / 240 := by norm_num
example : (1 - (2 : ℚ) ^ 3) * (1 / 240) = -7 / 240 := by norm_num
example : (1 : ℤ) + 3 = 4 ∧ (-1 : ℤ) + 3 = 2 := by norm_num
example : (-1 : ℤ) + 5 = 4 ∧ (1 : ℤ) - 5 = -4 := by norm_num
example : (1 : ℚ) - (4 : ℚ)⁻¹ = 3 / 4 := by norm_num

/-
The following README constructions use supplier interfaces or substantial arithmetic and
remain there with their specifications and Checks:
normalizedMellinContinuation, algebraicDirichletValue, tateTrivial_dedekind_comparison;
iwasawaLog, localIwasawaLog, localIwasawaLog_norm_eq_trace, localIwasawaLog_exp,
arithmeticAngularCoordinate;
unitSmoothedMeasure, smoothedNumerator, intrinsicNumerator, padicSmoothingDenominator,
padicSmoothedSeries, padicSmoothedMeasure, padicSmoothedNumerator, padicIntrinsicNumerator,
kubotaLeopoldtPseudomeasure; primePowerCharacter, primePowerArithmeticCharacter,
twistedSmoothedMeasure and additive twists; tameCoefficientSequence, tameMeasure,
integralTameSeries, integralTameMeasure, tameComplexKernel, smoothedCharacterKernel,
tameZetaMeasure, intrinsicTameZetaMeasure, their integral counterparts, twistedTameMeasure,
integralTameCharacterMeasure, tameCharacterField, tameCharacterInField;
arithmeticBranchTest, arithmeticBranchNumerator, intrinsic analytic branches,
inverseArithmeticCharacter, complexGaussLogValue, normalizedTameLogPrimitive,
tameLogPrimitive,
cyclotomicLogDiscTrace, cyclotomicLogDiscComplement, wildSmoothedLogPrimitive,
mixedCyclotomicLogConstant, principal pole-cleared germs;
GammaValue, moritaGamma, moritaAngularSample, moritaShiftedSample,
moritaDerivativeTwist, moritaBlockPowerSum, convergent angular means,
Gamma analytic models and their reciprocal coefficients; Dwork splitting coefficients,
Robert factorial functions and scaled factorial series; normalized finite-field Gauss sums;
moritaMultiplicationProduct, gammaOrbitLogSum, gammaOrbitPhi, gammaOrbitMean;
universalWeightedDistribution and its normalized, parity and orbit quotients,
distributionPrimitivePoints, distributionDistinguishedPoint, distributionAdmissibleDivisors,
ordinaryDistributionBasisSet, primitiveTransfer, finiteCartanGroup, globalCartanGroup,
cartanFullNorm, cartanNormLimit, finiteCartanValue, globalCartanValue,
periodicBernoulliDistribution, positiveFourierDistribution (k > 1), regularizedLogDistribution,
rationalCartanValue,
its primitive sums, cosets, correction factors and integral lattices;
distributionNegation, distributionParityOperator, distributionSignRepresentation,
distributionTateZeroParityEmbedding, distributionTateNegOneParityEmbedding,
distributionHOneParityTorsionEquiv,
distributionParityTorsionEquiv, gammaContinuousUnitCount, unitLogAntidifference,
ferreroGreenbergGammaSum; eisensteinPositiveMeasure and finite coordinates,
positiveEisensteinSeriesMeasure, arithmeticEisensteinForm, stabilizedArithmeticEisensteinForm,
shifted denominators and numerators, shiftedConstant, eisensteinMomentHom,
eisensteinAwayEvaluation, fullEisensteinSeries, fullEisensteinAwaySeries,
clearedEisensteinSeries, clearedEisensteinEvaluation, twistedPositiveEisensteinMeasure,
integralTwistedPositiveEisensteinMeasure, twistedPositiveEisensteinFinite,
twistedPositiveEisensteinSeriesMeasure, doubledTameEisensteinSeriesMeasure,
normalizedTameEisensteinSeriesMeasure, dyadicTameQuadraticReference,
principalTameEisensteinSeries and the full classical comparisons.

Further API targets specified in the README:
§0.2: bernoulliKernel_zero, bernoulliKernel_of_ne_zero.
§0.6: IsIwasawaLog.map_one, IsIwasawaLog.map_pow, IsIwasawaLog.map_inv,
IsIwasawaLog.eq_zero_of_pow_eq_one, IsIwasawaLog.map_neg, IsIwasawaLog.map_prod.
§1.1: smoothingDenominator_coeff, smoothingTail_coeff, smoothedSeries_map,
smoothedSeries_unique.
§1.2: smoothedMeasure_integral, smoothedMeasure_eq_of_transform.
§1.5: smoothingResidueCandidate_eq_mass, smoothingResidue_unique.
§1.7: clearingMoment_kummer.
§2.3: tameNumerator_coeff, tameNumerator_map, tameSeries_map, tameSeries_unique.
§2.7: tameSeries_descend.
§4.2: moritaFiniteMean_add, moritaFiniteMean_smul, moritaFiniteMean_map,
moritaFiniteMean_raiseLevel, moritaFiniteMean_block, moritaFiniteMean_tendsto.
§4.4: grossKoblitzDigitSum_zero, grossKoblitzDigitSum_step, grossKoblitzDigitSum_rotate.
§4.7: divisionRelator_map.
§4.13: gammaUnitCount_eq, gammaUnitCount_step, normalizedMahlerAntidifference,
ferreroGreenberg_weighted_carry.
§5.7: tameSeries_character_variation.
-/

end TauCetiRoadmap.DirichletPadicLFunctions
