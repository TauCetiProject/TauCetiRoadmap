import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.MvPolynomial.EulerIdentity
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

/-- Fixed-degree coefficient parameters use the native graded polynomial pieces. -/
def projectiveCoefficientSpace {N : ℕ} {ι : Type*} (d : ι → ℕ) :=
  ∀ i, MvPolynomial.homogeneousSubmodule (Fin N) ℂ (d i)

/-- The incidence carrier retains the coefficient vector and native projective point. -/
def complexProjectiveIncidence {N : ℕ} {ι : Type*} (d : ι → ℕ) :=
  {q : projectiveCoefficientSpace (N := N) d × Projectivization ℂ (Fin N → ℂ) //
    ∀ i, ∀ v ∈ (Projectivization.equivSubmodule ℂ (Fin N → ℂ) q.2).val,
      MvPolynomial.eval v (q.1 i : MvPolynomial (Fin N) ℂ) = 0}

/-- The punctured-cone Jacobian is the evaluated native partial-derivative matrix. -/
def projectiveConeJacobian {N : ℕ} {ι : Type*}
    (p : ι → MvPolynomial (Fin N) ℂ) (v : Fin N → ℂ) : Matrix ι (Fin N) ℂ :=
  fun i j => MvPolynomial.eval v (MvPolynomial.pderiv j (p i))


/-- A finite polynomial-family zero locus in the native space of complex lines.
The README equips this subtype with K7.1's induced projective topology. -/
def complexProjectiveZeroLocus {N : ℕ} {ι : Type*}
    (p : ι → MvPolynomial (Fin N) ℂ) :=
  {L : Projectivization ℂ (Fin N → ℂ) //
    ∀ i, ∀ v ∈ (Projectivization.equivSubmodule ℂ (Fin N → ℂ) L).val,
      MvPolynomial.eval v (p i) = 0}

/-- Homogeneity makes testing one nonzero representative equivalent to testing
its whole line, including degree-zero constant equations. -/
theorem complexProjectiveZeroLocus_mk_iff {N : ℕ} {ι : Type*}
    (p : ι → MvPolynomial (Fin N) ℂ) (d : ι → ℕ)
    (hp : ∀ i, (p i).IsHomogeneous (d i)) (v : Fin N → ℂ) (hv : v ≠ 0) :
    (∀ i, ∀ w ∈ (Projectivization.equivSubmodule ℂ (Fin N → ℂ)
      (Projectivization.mk ℂ v hv)).val, MvPolynomial.eval w (p i) = 0) ↔
      ∀ i, MvPolynomial.eval v (p i) = 0 := by
  sorry

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
