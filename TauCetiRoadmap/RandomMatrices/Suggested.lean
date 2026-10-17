import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.CStarAlgebra.Matrix
import Mathlib.MeasureTheory.Measure.ResolventTransform
import Mathlib.Combinatorics.Enumerative.Catalan.Basic
import Mathlib.Probability.HasLawExists
import Mathlib.Probability.IdentDistribIndep
import Mathlib.Probability.Moments.SubGaussian
import TauCeti.Probability.Moments.Determinacy

/-!
# Random matrices: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

These prototypes cover extension, spectral measures, resolvents, spectral perturbations,
the semicircle distribution, and one representative real Wigner statement. The README
also requires complex and triangular-array versions, sample covariances, and the other
milestones. Prototype names live here only to avoid occupying implementation namespaces.
Use existing Tau Ceti moment determinacy directly through the import above.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Matrix Filter
open scoped BigOperators ENNReal NNReal Topology Matrix.Norms.L2Operator

namespace TauCetiRoadmap.RandomMatrices

section Extensions

variable {Ω E F : Type*} [MeasurableSpace Ω] [MeasurableSpace E] [MeasurableSpace F]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure E) [IsProbabilityMeasure ν]

/-- Adding randomness preserves the whole old random object, not only its marginals. -/
theorem independent_extension (X : Ω → F) (hX : Measurable X) :
    MeasurePreserving (Prod.fst : Ω × E → Ω) (P.prod ν) P ∧
    HasLaw (Prod.snd : Ω × E → E) ν (P.prod ν) ∧
    IndepFun (fun q : Ω × E ↦ X q.1) Prod.snd (P.prod ν) := by
  sorry

/-- Every almost-sure property of the old joint object transports in both directions. -/
theorem ae_extension_iff (X : Ω → F) (s : Set F) (hs : MeasurableSet s)
    (hX : Measurable X) :
    (∀ᵐ q : Ω × E ∂P.prod ν, X q.1 ∈ s) ↔ ∀ᵐ ω ∂P, X ω ∈ s := by
  sorry

end Extensions

/-- The empty family gives the zero finite measure; positive dimension gives mass one. -/
def empiricalMeasure {E : Type*} [MeasurableSpace E] {n : ℕ} (x : Fin n → E) : Measure E :=
  (n : ℝ≥0∞)⁻¹ • ∑ i, Measure.dirac (x i)

theorem empiricalMeasure_isProbabilityMeasure {E : Type*} [MeasurableSpace E]
    {n : ℕ} (hn : 0 < n) (x : Fin n → E) :
    IsProbabilityMeasure (empiricalMeasure x) := by
  sorry

/-- A concrete measure, rather than an unspecified spectral-distribution predicate. -/
def spectralMeasure {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (hA : A.IsHermitian) :
    Measure ℝ :=
  empiricalMeasure hA.eigenvalues

/-- The scalar Stieltjes transform uses Mathlib's resolvent transform, with positive
imaginary part on the upper half-plane. -/
abbrev stieltjes (μ : Measure ℝ) (z : ℂ) : ℂ :=
  resolventTransform μ z

theorem stieltjes_eq_integral (μ : Measure ℝ) (z : ℂ) :
    stieltjes μ z = ∫ x : ℝ, ((x : ℂ) - z)⁻¹ ∂μ := by
  sorry

def frobeniusNorm {p n : ℕ} (A : Matrix (Fin p) (Fin n) ℂ) : ℝ :=
  Real.sqrt (∑ i, ∑ j, ‖A i j‖ ^ 2)

theorem hoffmanWielandt {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ)
    (hA : A.IsHermitian) (hB : B.IsHermitian) :
    ∑ i, |hA.eigenvalues₀ i - hB.eigenvalues₀ i| ^ 2 ≤ frobeniusNorm (A - B) ^ 2 := by
  sorry

theorem spectralMeasure_integral_pow {n : ℕ} (hn : 0 < n)
    (A : Matrix (Fin n) (Fin n) ℂ) (hA : A.IsHermitian) (k : ℕ) :
    ∫ x : ℝ, x ^ k ∂spectralMeasure A hA = (n : ℝ)⁻¹ * (Matrix.trace (A ^ k)).re := by
  sorry

theorem spectralMeasure_stieltjes {n : ℕ} (hn : 0 < n)
    (A : Matrix (Fin n) (Fin n) ℂ) (hA : A.IsHermitian) (z : ℂ) (hz : 0 < z.im) :
    stieltjes (spectralMeasure A hA) z =
      (n : ℂ)⁻¹ * Matrix.trace ((A - z • (1 : Matrix (Fin n) (Fin n) ℂ))⁻¹) := by
  sorry

theorem resolvent_norm_le {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (hA : A.IsHermitian) (z : ℂ) (hz : 0 < z.im) :
    ‖(A - z • (1 : Matrix (Fin n) (Fin n) ℂ))⁻¹‖ ≤ z.im⁻¹ := by
  sorry

/-- This follows the external semicircle project's location/variance convention;
there is no such declaration in the dependencies inspected for this prototype. -/
def semicircleReal (a : ℝ) (v : ℝ≥0) : Measure ℝ :=
  if v = 0 then Measure.dirac a else
    volume.withDensity (fun x ↦ ENNReal.ofReal
      ((2 * Real.pi * (v : ℝ))⁻¹ * Real.sqrt (4 * (v : ℝ) - (x - a) ^ 2)))

theorem semicircleReal_isProbabilityMeasure (a : ℝ) (v : ℝ≥0) :
    IsProbabilityMeasure (semicircleReal a v) := by
  sorry

theorem semicircleReal_even_moment (k : ℕ) :
    ∫ x : ℝ, x ^ (2 * k) ∂semicircleReal 0 1 = (catalan k : ℝ) := by
  sorry

theorem semicircleReal_stieltjes_equation (z : ℂ) (hz : 0 < z.im) :
    stieltjes (semicircleReal 0 1) z ^ 2 + z * stieltjes (semicircleReal 0 1) z + 1 = 0 := by
  sorry

section Wigner

variable {Ω : Type*} [MeasurableSpace Ω]

/-- An infinite upper-triangular array, including its diagonal. -/
abbrev UpperPair := {ij : ℕ × ℕ // ij.1 ≤ ij.2}

/-- One representative model: real i.i.d. upper entries, copied across the diagonal,
then divided by the square root of dimension. The README also allows a separate diagonal law. -/
def wignerFromArray (ξ : UpperPair → Ω → ℝ) (n : ℕ) (ω : Ω) :
    Matrix (Fin n) (Fin n) ℂ :=
  fun i j ↦ ((Real.sqrt n)⁻¹ *
    ξ ⟨(min i.val j.val, max i.val j.val), min_le_max⟩ ω : ℝ)

theorem wignerFromArray_isHermitian (ξ : UpperPair → Ω → ℝ) (n : ℕ) (ω : Ω) :
    (wignerFromArray ξ n ω).IsHermitian := by
  sorry

/-- A genuine almost-sure weak-convergence statement: on one full-measure set all
bounded-continuous test integrals converge. Second moments suffice for the empirical law. -/
theorem wigner_semicircle_ae (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure ℝ) [IsProbabilityMeasure ν]
    (ξ : UpperPair → Ω → ℝ)
    (hξ : ∀ ij, HasLaw (ξ ij) ν P) (hindep : iIndepFun ξ P)
    (hmean : ∫ x : ℝ, x ∂ν = 0)
    (hsecond : Integrable (fun x : ℝ ↦ x ^ 2) ν)
    (hvar : ∫ x : ℝ, x ^ 2 ∂ν = 1) :
    ∀ᵐ ω ∂P, ∀ f : BoundedContinuousFunction ℝ ℝ,
      Tendsto (fun n : ℕ ↦ ∫ x : ℝ, f x ∂spectralMeasure
        (wignerFromArray ξ (n + 1) ω) (wignerFromArray_isHermitian ξ (n + 1) ω))
        atTop (𝓝 (∫ x : ℝ, f x ∂semicircleReal 0 1)) := by
  sorry

end Wigner

end TauCetiRoadmap.RandomMatrices
