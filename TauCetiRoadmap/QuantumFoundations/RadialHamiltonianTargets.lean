import Mathlib.Analysis.Fourier.LpSpace

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. These suggested statements use the native Lp carrier,
Plancherel equivalence and almost-everywhere quotient. The full closed-operator
and SO(n) comparison are specified in QF6a.RadialHamiltonians.
-/

noncomputable section

namespace QuantumFoundations.RadialHamiltonian

open MeasureTheory

abbrev Space (n : ℕ) := EuclideanSpace ℝ (Fin n)
abbrev Hilbert (n : ℕ) := Lp ℂ 2 (volume : Measure (Space n))

def energy (n : ℕ) (ξ : Space n) : ℝ := 4 * Real.pi ^ 2 * ‖ξ‖ ^ 2

def radialMeasure (n : ℕ) : Measure ℝ :=
  Measure.map (energy n) volume

def fourier (n : ℕ) : Hilbert n ≃ₗᵢ[ℂ] Hilbert n :=
  Lp.fourierTransformₗᵢ (Space n) ℂ

/-- This maximal domain is defined without assigning arbitrary L² point values. -/
def domain (n : ℕ) (g : ℝ → ℝ) : Set (Hilbert n) :=
  {f | MemLp (fun ξ ↦ (g (energy n ξ) : ℂ) * (fourier n f) ξ) 2 volume}

/-- Orthogonal invariance gives the radial representative, also in dimension one. -/
theorem exists_radial_symbol (n : ℕ) (hn : 1 ≤ n) (m : Space n → ℂ)
    (hm : Measurable m) (hbound : ∃ C : ℝ, ∀ᵐ ξ ∂volume, ‖m ξ‖ ≤ C)
    (hinv : ∀ R : Space n ≃ₗᵢ[ℝ] Space n,
      (fun ξ ↦ m (R ξ)) =ᵐ[volume] m) :
    ∃ g : ℝ → ℂ, Measurable g ∧
      m =ᵐ[volume] (fun ξ ↦ g (energy n ξ)) := by
  sorry

/-- Every finite real Borel symbol has a dense maximal operator domain. -/
theorem dense_domain (n : ℕ) (g : ℝ → ℝ) (hg : Measurable g) :
    Dense (domain n g) := by
  sorry

/-- The radial pushforward measure records precisely the irrelevant null sets. -/
theorem domain_congr (n : ℕ) (g h : ℝ → ℝ)
    (hg : Measurable g) (hh : Measurable h)
    (heq : g =ᵐ[radialMeasure n] h) : domain n g = domain n h := by
  sorry

end QuantumFoundations.RadialHamiltonian
