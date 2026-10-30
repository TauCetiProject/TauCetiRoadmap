import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.LinearAlgebra.Matrix.Notation

/-
Illustrative, nonexhaustive target signatures. The README is definitive.
Every polynomial, operator, grading and kernel below is defined using native
MvPolynomial/LinearMap/Submodule APIs. The theorem bodies are future proofs.
-/
noncomputable section

namespace TauCetiRoadmap.SchubertGeometry.SimpleGenerator

universe u v
variable (K : Type u) [Field K] [CharZero K]

abbrev Variables := Fin 3 ⊕ Fin 3
abbrev Polynomial := MvPolynomial Variables K

def x (i : Fin 3) : Polynomial K := MvPolynomial.X (Sum.inl i)
def y (i : Fin 3) : Polynomial K := MvPolynomial.X (Sum.inr i)

def bidegree : Variables → ℕ × ℕ
  | Sum.inl _ => (1, 0)
  | Sum.inr _ => (0, 1)

def tensorPiece : Submodule K (Polynomial K) :=
  MvPolynomial.weightedHomogeneousSubmodule K bidegree (2, 1)

/-- E_ab acts on the standard variables and contragredient dual variables. -/
def rootOperator (a b : Fin 3) : Module.End K (Polynomial K) :=
  (LinearMap.mulLeft K (x K a)).comp
      (MvPolynomial.pderiv (R := K) (Sum.inl b)).toLinearMap -
    (LinearMap.mulLeft K (y K b)).comp
      (MvPolynomial.pderiv (R := K) (Sum.inr a)).toLinearMap

def contraction : Module.End K (Polynomial K) :=
  ∑ i : Fin 3, (MvPolynomial.pderiv (R := K) (Sum.inl i)).toLinearMap.comp
    (MvPolynomial.pderiv (R := K) (Sum.inr i)).toLinearMap

def traceKernel : Submodule K (Polynomial K) :=
  tensorPiece K ⊓ LinearMap.ker (contraction K)

/-- Actual GL3 diagonal weights, including the central direction. -/
def variableWeight : Variables → (Fin 3 → ℤ)
  | Sum.inl i => Pi.single i 1
  | Sum.inr i => Pi.single i (-1)

def weightPiece (μ : Fin 3 → ℤ) : Submodule K (Polynomial K) :=
  MvPolynomial.weightedHomogeneousSubmodule K variableWeight μ

def targetWeight : Fin 3 → ℤ := ![0, 0, 1]
def highestWeight : Fin 3 → ℤ := ![2, 0, -1]

def targetWeightSpace : Submodule K (Polynomial K) :=
  traceKernel K ⊓ weightPiece K targetWeight

def highestVector : Polynomial K := (x K 0) ^ 2 * y K 2

def lowering (i : Fin 2) : Module.End K (Polynomial K) :=
  rootOperator K i.succ i.castSucc

def raising (i : Fin 2) : Module.End K (Polynomial K) :=
  rootOperator K i.castSucc i.succ

/-- List order is chronological: [0,0,1,1] means F2(F2(F1(F1 p))). -/
def wordAction (w : List (Fin 2)) (p : Polynomial K) : Polynomial K :=
  w.foldl (fun q i => lowering K i q) p

def A : Polynomial K := x K 0 * x K 2 * y K 0
def B : Polynomial K := x K 1 * x K 2 * y K 1
def C : Polynomial K := (x K 2) ^ 2 * y K 2

def IsWeightBasis {ι : Type v} (b : Module.Basis ι K (traceKernel K)) : Prop :=
  ∀ j, ∃ μ : Fin 3 → ℤ, ∀ i,
    rootOperator K i i (b j : Polynomial K) = (μ i : K) • (b j : Polynomial K)

/-- The source's sl3 weight condition uses only the two diagonal differences.
No arbitrary integral GL3 weight label is assumed as input. -/
def IsSl3WeightBasis {ι : Type v} (b : Module.Basis ι K (traceKernel K)) : Prop :=
  ∀ j, ∃ μ : Fin 2 → K, ∀ i,
    (rootOperator K i.castSucc i.castSucc - rootOperator K i.succ i.succ)
      (b j : Polynomial K) = μ i • (b j : Polynomial K)

/-- Zero outputs are allowed by taking coefficient zero; no nonzero-edge claim. -/
def IsSimpleLoweringSingleTarget {ι : Type v}
    (b : Module.Basis ι K (traceKernel K)) : Prop :=
  ∀ i : Fin 2, ∀ j, ∃ c : K, ∃ j',
    lowering K i (b j : Polynomial K) = c • (b j' : Polynomial K)

omit [CharZero K] in
theorem rootOperator_apply (a b : Fin 3) (p : Polynomial K) :
    rootOperator K a b p = x K a * MvPolynomial.pderiv (Sum.inl b) p -
      y K b * MvPolynomial.pderiv (Sum.inr a) p := rfl

theorem root_preserves_traceKernel (a b : Fin 3) (p : Polynomial K)
    (hp : p ∈ traceKernel K) : rootOperator K a b p ∈ traceKernel K := by
  sorry

theorem contraction_surjective_on_piece :
    ∀ q ∈ MvPolynomial.weightedHomogeneousSubmodule K bidegree (1, 0),
      ∃ p ∈ tensorPiece K, contraction K p = q := by
  sorry

theorem traceKernel_finite : Module.Finite K (traceKernel K) := by
  sorry

theorem traceKernel_finrank : Module.finrank K (traceKernel K) = 15 := by
  sorry

theorem highest_mem : highestVector K ∈ traceKernel K ⊓ weightPiece K highestWeight := by
  sorry

theorem highest_raising_zero (i : Fin 2) : raising K i (highestVector K) = 0 := by
  sorry

theorem highest_weight_line :
    traceKernel K ⊓ weightPiece K highestWeight =
      Submodule.span K {highestVector K} := by
  sorry

def planeConstraint : (Fin 3 → K) →ₗ[K] K :=
  LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 0 + LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 1 + (2 : K) • LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 2

def planeMap : (Fin 3 → K) →ₗ[K] Polynomial K :=
  (LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 0).smulRight (A K) +
    (LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 1).smulRight (B K) +
    (LinearMap.proj (R := K) (φ := fun _ : Fin 3 => K) 2).smulRight (C K)

def planeModel : Submodule K (Polynomial K) :=
  (LinearMap.ker (planeConstraint K)).map (planeMap K)

theorem target_weight_plane : targetWeightSpace K = planeModel K := by
  sorry

theorem targetWeightSpace_finrank : Module.finrank K (targetWeightSpace K) = 2 := by
  sorry

theorem word_1122 : wordAction K [0,0,1,1] (highestVector K) =
    (-8 : K) • B K + (4 : K) • C K := by
  sorry

theorem word_1212 : wordAction K [0,1,0,1] (highestVector K) =
    (2 : K) • A K + (-6 : K) • B K + (2 : K) • C K := by
  sorry

theorem word_1221 : wordAction K [0,1,1,0] (highestVector K) =
    (4 : K) • A K + (-4 : K) • B K := by
  sorry

theorem kernel_joint_raising_line :
    traceKernel K ⊓ LinearMap.ker (raising K 0) ⊓ LinearMap.ker (raising K 1) =
      Submodule.span K {highestVector K} := by
  sorry

theorem kernel_lowering_cyclic :
    Submodule.span K {p | ∃ w : List (Fin 2), p = wordAction K w (highestVector K)} =
      traceKernel K := by
  sorry

/-- Concrete invariant-submodule criterion, with all determining maps retained. -/
theorem kernel_irreducible (N : Submodule K (Polynomial K))
    (hN : N ≤ traceKernel K) (hne : N ≠ ⊥)
    (hstable : ∀ a b p, p ∈ N → rootOperator K a b p ∈ N) :
    N = traceKernel K := by
  sorry

theorem sl3_weightBasis_iff_GL3 {ι : Type v}
    (b : Module.Basis ι K (traceKernel K)) :
    IsSl3WeightBasis K b ↔ IsWeightBasis K b := by
  sorry

/-- Pairwise line distinction, rather than a dimension-only identification. -/
theorem three_lines_distinct :
    let p := wordAction K [0,0,1,1] (highestVector K)
    let q := wordAction K [0,1,0,1] (highestVector K)
    let r := wordAction K [0,1,1,0] (highestVector K)
    LinearIndependent K ![p,q] ∧ LinearIndependent K ![p,r] ∧
      LinearIndependent K ![q,r] := by
  sorry

/-- Even just the simple lowering operators cannot be single-target on a weight basis. -/
theorem no_simple_lowering_weight_basis {ι : Type v}
    (b : Module.Basis ι K (traceKernel K)) (hb : IsSl3WeightBasis K b) :
    ¬ IsSimpleLoweringSingleTarget K b := by
  sorry

end TauCetiRoadmap.SchubertGeometry.SimpleGenerator
