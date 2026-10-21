import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.MeasureTheory.Integral.DivergenceTheorem

/-!
# Stokes reciprocity: suggested interfaces

This file is not the roadmap and is not exhaustive. The definitive document is
README.md. These prototypes suggest forms for S1–S3; discharging them does
not finish a layer or the roadmap. Admitted targets are not proved results.
-/

noncomputable section
open scoped BigOperators
open MeasureTheory

namespace StokesReciprocityRoadmap

variable {d : ℕ}

def contraction (A B : Matrix (Fin d) (Fin d) ℝ) : ℝ :=
  Matrix.trace (A.transpose * B)

/-- Component bridge for the canonical trace/multiplication expression. -/
theorem contraction_eq_sum (A B : Matrix (Fin d) (Fin d) ℝ) :
    contraction A B = ∑ i, ∑ j, A i j * B i j := by
  sorry

def symGradientMatrix (A : Matrix (Fin d) (Fin d) ℝ) :
    Matrix (Fin d) (Fin d) ℝ := fun i j => (A i j + A j i) / 2

def stressMatrix (μ p : ℝ) (A : Matrix (Fin d) (Fin d) ℝ) :
    Matrix (Fin d) (Fin d) ℝ :=
  fun i j => -(p * (if i = j then 1 else 0)) + μ * (A i j + A j i)

theorem reciprocal_contraction (μ p q : ℝ) (A B : Matrix (Fin d) (Fin d) ℝ) :
    contraction (stressMatrix μ p A) B - contraction (stressMatrix μ q B) A =
      -p * Matrix.trace B + q * Matrix.trace A := by
  sorry

theorem dissipation_contraction (μ p : ℝ) (A : Matrix (Fin d) (Fin d) ℝ)
    (hA : Matrix.trace A = 0) :
    contraction (stressMatrix μ p A) A =
      2 * μ * contraction (symGradientMatrix A) (symGradientMatrix A) := by
  sorry

def velocityGradient (u : (Fin d → ℝ) → (Fin d → ℝ)) (x : Fin d → ℝ) :
    Matrix (Fin d) (Fin d) ℝ :=
  fun i j => fderiv ℝ u x (Pi.single j 1) i

def velocityDivergence (u : (Fin d → ℝ) → (Fin d → ℝ)) (x : Fin d → ℝ) : ℝ :=
  Matrix.trace (velocityGradient u x)

def stress (μ : ℝ) (u : (Fin d → ℝ) → (Fin d → ℝ))
    (p : (Fin d → ℝ) → ℝ) (x : Fin d → ℝ) : Matrix (Fin d) (Fin d) ℝ :=
  stressMatrix μ (p x) (velocityGradient u x)

def traction (μ : ℝ) (u : (Fin d → ℝ) → (Fin d → ℝ))
    (p : (Fin d → ℝ) → ℝ) (x n : Fin d → ℝ) : Fin d → ℝ :=
  (stress μ u p x).mulVec n

def stressDivergence (σ : (Fin d → ℝ) → Matrix (Fin d) (Fin d) ℝ)
    (x : Fin d → ℝ) : Fin d → ℝ :=
  fun i => ∑ j, fderiv ℝ (fun y => σ y i j) x (Pi.single j 1)

def reciprocalFlux (μ : ℝ) (u v : (Fin d → ℝ) → (Fin d → ℝ))
    (p q : (Fin d → ℝ) → ℝ) (x : Fin d → ℝ) : Fin d → ℝ :=
  fun j => ∑ i, (stress μ u p x i j * v x i - stress μ v q x i j * u x i)

/-- Local form: forces are volume densities and satisfy Div σ + f = 0. -/
theorem local_reciprocity (μ : ℝ)
    (u v f g : (Fin d → ℝ) → (Fin d → ℝ)) (p q : (Fin d → ℝ) → ℝ)
    (x : Fin d → ℝ) (hu : ContDiffAt ℝ 2 u x) (hv : ContDiffAt ℝ 2 v x)
    (hp : ContDiffAt ℝ 1 p x) (hq : ContDiffAt ℝ 1 q x)
    (hu0 : velocityDivergence u x = 0) (hv0 : velocityDivergence v x = 0)
    (huf : stressDivergence (stress μ u p) x + f x = 0)
    (hvg : stressDivergence (stress μ v q) x + g x = 0) :
    velocityDivergence (reciprocalFlux μ u v p q) x =
      (∑ i, u x i * g x i) - ∑ i, v x i * f x i := by
  sorry

/-! The face parametrizations match Mathlib's box divergence theorem. -/

def boxBoundaryWork {n : ℕ} (a b : Fin (n + 1) → ℝ) (μ : ℝ)
    (v u : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p : (Fin (n + 1) → ℝ) → ℝ) : ℝ :=
  ∑ i : Fin (n + 1),
    ((∫ y in Set.Icc (a ∘ i.succAbove) (b ∘ i.succAbove),
        ∑ j, v (i.insertNth (b i) y) j *
          stress μ u p (i.insertNth (b i) y) j i) -
      ∫ y in Set.Icc (a ∘ i.succAbove) (b ∘ i.succAbove),
        ∑ j, v (i.insertNth (a i) y) j *
          stress μ u p (i.insertNth (a i) y) j i)

/-- Reciprocity on a genuine box, without an assumed integration-by-parts law.
Regularity is expressed at every point of the closed box. The PDE hypotheses
are needed only in its coordinatewise interior. This includes dimension one
and arbitrary constant real viscosity. -/
theorem box_reciprocity {n : ℕ}
    (a b : Fin (n + 1) → ℝ) (hab : ∀ i, a i < b i)
    (μ : ℝ)
    (u v f g : (Fin (n + 1) → ℝ) → (Fin (n + 1) → ℝ))
    (p q : (Fin (n + 1) → ℝ) → ℝ)
    (hu : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 u x)
    (hv : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 2 v x)
    (hp : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 p x)
    (hq : ∀ x ∈ Set.Icc a b, ContDiffAt ℝ 1 q x)
    (hf : ContinuousOn f (Set.Icc a b)) (hg : ContinuousOn g (Set.Icc a b))
    (hu0 : ∀ x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence u x = 0)
    (hv0 : ∀ x, (∀ i, a i < x i ∧ x i < b i) → velocityDivergence v x = 0)
    (huf : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ u p) x + f x = 0)
    (hvg : ∀ x, (∀ i, a i < x i ∧ x i < b i) →
      stressDivergence (stress μ v q) x + g x = 0) :
    boxBoundaryWork a b μ v u p + (∫ x in Set.Icc a b, ∑ i, v x i * f x i) =
      boxBoundaryWork a b μ u v q + (∫ x in Set.Icc a b, ∑ i, u x i * g x i) := by
  sorry

end StokesReciprocityRoadmap
