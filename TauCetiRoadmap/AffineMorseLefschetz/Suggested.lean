import TauCeti.Analysis.Calculus.Morse.Index
import Mathlib.Analysis.InnerProductSpace.Spectrum
import Mathlib.LinearAlgebra.Dimension.Finite

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification. These interfaces pin the real-Hessian/Levi and
negative-subspace conventions on native complex vector spaces. The manifold,
CW, triangulation and singular-pair statements are explicit README targets.
-/

noncomputable section
namespace TauCetiRoadmap.AffineMorseLefschetz

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]
  [FiniteDimensional ℂ V]

/-- Real Hessian without a factor 1/2; the Levi diagonal below has factor 1/4. -/
def realHessian (f : V → ℝ) (x : V) : V →L[ℝ] V →L[ℝ] ℝ :=
  fderiv ℝ (fderiv ℝ f) x

def leviDiagonal (B : V →L[ℝ] V →L[ℝ] ℝ) (v : V) : ℝ :=
  (B v v + B (Complex.I • v) (Complex.I • v)) / 4

omit [FiniteDimensional ℂ V] in
/-- A real negative space has no intersection with its J-rotate under strict Levi positivity. -/
theorem negative_subspace_disjoint_J
    (B : V →L[ℝ] V →L[ℝ] ℝ)
    (hlevi : ∀ v : V, v ≠ 0 → 0 < leviDiagonal B v)
    (W : Submodule ℝ V) (hneg : ∀ v ∈ W, v ≠ 0 → B v v < 0)
    (v : V) (hv : v ∈ W) (hJv : Complex.I • v ∈ W) : v = 0 := by
  by_contra hne
  have hJn : Complex.I • v ≠ 0 := smul_ne_zero Complex.I_ne_zero hne
  have hpos := hlevi v hne
  have hn := hneg v hv hne
  have hJnneg := hneg (Complex.I • v) hJv hJn
  unfold leviDiagonal at hpos
  linarith

theorem finrank_negative_subspace_le_complex
    (B : V →L[ℝ] V →L[ℝ] ℝ)
    (hlevi : ∀ v : V, v ≠ 0 → 0 < leviDiagonal B v)
    (W : Submodule ℝ V) (hneg : ∀ v ∈ W, v ≠ 0 → B v v < 0) :
    Module.finrank ℝ W ≤ Module.finrank ℂ V := by
  sorry

/-- The pointwise bound uses native negative inertia wherever the Levi diagonal is positive. -/
theorem morseIndex_le_complex_finrank (f : V → ℝ) (x : V)
    (hlevi : ∀ v : V, v ≠ 0 → 0 < leviDiagonal (realHessian f x) v) :
    TauCeti.morseIndex f x ≤ Module.finrank ℂ V := by
  sorry

/-- The n−q positive-direction convention gives the real index bound n+q. -/
theorem morseIndex_le_complex_finrank_add (f : V → ℝ) (x : V)
    (q : ℕ) (hq : q ≤ Module.finrank ℂ V) (P : Submodule ℂ V)
    (hdim : Module.finrank ℂ V - q ≤ Module.finrank ℂ P)
    (hlevi : ∀ v ∈ P, v ≠ 0 → 0 < leviDiagonal (realHessian f x) v) :
    TauCeti.morseIndex f x ≤ Module.finrank ℂ V + q := by
  sorry

omit [FiniteDimensional ℂ V] in
/-- J sends a λ-eigenvector of a real operator anti-commuting with J to a −λ-eigenvector. -/
theorem J_mem_neg_eigenspace (A : V →ₗ[ℝ] V)
    (hAJ : ∀ v, A (Complex.I • v) = -(Complex.I • A v))
    (a : ℝ) (v : V) (hv : v ∈ Module.End.eigenspace A a) :
    Complex.I • v ∈ Module.End.eigenspace A (-a) := by
  rw [Module.End.mem_eigenspace_iff] at hv ⊢
  calc
    A (Complex.I • v) = -(Complex.I • (a • v)) := by rw [hAJ, hv]
    _ = (-a) • (Complex.I • v) := by rw [smul_comm, neg_smul]

end TauCetiRoadmap.AffineMorseLefschetz
