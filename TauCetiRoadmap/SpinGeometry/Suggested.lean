import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Covering
import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Connected
import TauCeti.RepresentationTheory.Spin.Structure
import TauCeti.RepresentationTheory.QuaternionicStructure
import TauCeti.RepresentationTheory.Spin.OddStructure
import TauCeti.RepresentationTheory.Spin.HalfSpin.Basic
import TauCeti.LinearAlgebra.CliffordAlgebra.VolumeElement
import TauCeti.LinearAlgebra.CliffordAlgebra.EightPeriodicity
import Mathlib.Analysis.InnerProductSpace.LinearMap
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Geometry.Manifold.VectorBundle.CovariantDerivative.Basic
import TauCeti.Geometry.Manifold.Riemannian.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation
import Mathlib.Tactic.Linarith
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
These selected pointwise/chirality and connection-contraction interfaces use
actual Clifford actions and Mathlib covariant derivatives. The smooth algebra
bundle, principal spin lift and cohomological obstruction are explicit README
targets; absent carriers are not represented by empty proposition fields here.
-/

noncomputable section

namespace TauCetiRoadmap.SpinGeometry

open scoped Manifold ContDiff TensorProduct

-- G4.1a/G4.4a use these native compact-real topology suppliers.
#check CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom
#check CliffordAlgebra.pathConnectedSpace_realCliffordSpinGroupZero_add_two

section RealRegularClifford

variable {V : Type*} [AddCommGroup V] [Module ℝ V]
    (Q : QuadraticForm ℝ V)

/-- G5.0: right negative multiplication after parity acts with opposite square. -/
def realCliffordPositiveRightVector (w : V) :
    Module.End ℝ (CliffordAlgebra Q) where
  toFun s := CliffordAlgebra.involute s * CliffordAlgebra.ι Q w
  map_add' s t := by simp [add_mul]
  map_smul' r s := by simp

/-- For Q=-g this is the positive external Clifford square. -/
theorem realCliffordPositiveRightVector_square (w : V) (s : CliffordAlgebra Q) :
    realCliffordPositiveRightVector Q w (realCliffordPositiveRightVector Q w s) =
      (-Q w) • s := by
  simp [realCliffordPositiveRightVector, map_mul, CliffordAlgebra.involute_ι,
    CliffordAlgebra.involute_involute, mul_assoc,
    CliffordAlgebra.ι_sq_scalar]
  rw [← Algebra.commutes (Q w) s, ← Algebra.smul_def]

/-- The fixed external action is graded-linear with the tangent action. -/
theorem realCliffordPositiveRightVector_anticommute (v w : V)
    (s : CliffordAlgebra Q) :
    realCliffordPositiveRightVector Q w (CliffordAlgebra.ι Q v * s) =
      -(CliffordAlgebra.ι Q v * realCliffordPositiveRightVector Q w s) := by
  simp [realCliffordPositiveRightVector, map_mul, CliffordAlgebra.involute_ι,
    mul_assoc]

end RealRegularClifford

section MetricAction

variable {V S : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [NormedAddCommGroup S] [InnerProductSpace ℂ S]
  (Q : QuadraticForm ℝ V) (ρ : CliffordAlgebra Q →ₐ[ℝ] Module.End ℂ S)

/-- The real Clifford algebra acts by complex-linear endomorphisms. -/
def cliffordMultiplication (v : V) : Module.End ℂ S := ρ (CliffordAlgebra.ι Q v)

/-- Concrete negative-metric and skew-Hermitian requirements. -/
def IsGeometricAction : Prop :=
  (∀ v, Q v = -inner ℝ v v) ∧
    ∀ v s t, inner ℂ (cliffordMultiplication Q ρ v s) t =
      -inner ℂ s (cliffordMultiplication Q ρ v t)

/-- G1: the native Clifford relation, with no new algebra carrier. -/
theorem cliffordMultiplication_sq (h : IsGeometricAction Q ρ) (v : V) :
    cliffordMultiplication Q ρ v * cliffordMultiplication Q ρ v =
      (-inner ℝ v v) • (1 : Module.End ℂ S) := by
  simp only [cliffordMultiplication, ← map_mul, CliffordAlgebra.ι_sq_scalar,
    Algebra.algebraMap_eq_smul_one, h.1 v, map_smul, map_one]

/-- G1: the mixed negative-metric Clifford relation. -/
theorem cliffordMultiplication_anticommutator (h : IsGeometricAction Q ρ) (v w : V) :
    cliffordMultiplication Q ρ v * cliffordMultiplication Q ρ w +
      cliffordMultiplication Q ρ w * cliffordMultiplication Q ρ v =
      (-2 * inner ℝ v w) • (1 : Module.End ℂ S) := by
  sorry

/-- G2: an ordered orthonormal frame, with orientation fixed in the README. -/
def chirality {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Module.End ℂ S :=
  Complex.I ^ ℓ • ((List.ofFn fun i => cliffordMultiplication Q ρ (b i)).prod)

theorem chirality_sq {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) : chirality Q ρ b * chirality Q ρ b = 1 := by
  sorry

theorem chirality_anticommutes {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) (v : V) :
    chirality Q ρ b * cliffordMultiplication Q ρ v =
      -(cliffordMultiplication Q ρ v * chirality Q ρ b) := by
  sorry

/-- The eigenspace is an actual submodule; Γ is not a freely chosen grading. -/
def positiveSpinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Submodule ℂ S :=
  LinearMap.ker (chirality Q ρ b - LinearMap.id)

def negativeSpinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Submodule ℂ S :=
  LinearMap.ker (chirality Q ρ b + LinearMap.id)

theorem isCompl_spinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) :
    IsCompl (positiveSpinors Q ρ b) (negativeSpinors Q ρ b) := by
  sorry

end MetricAction

section Multiplicity

variable {V S E : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup S] [Module ℂ S] [FiniteDimensional ℂ S]
  [AddCommGroup E] [Module ℂ E] [FiniteDimensional ℂ E]
  (Q : QuadraticForm ℂ V) (ρ : CliffordAlgebra Q ≃ₐ[ℂ] Module.End ℂ S)
  (σ : CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ E)

/-- Native linear maps satisfying the intertwining equation. -/
def multiplicitySpace : Submodule ℂ (S →ₗ[ℂ] E) where
  carrier := {T | ∀ a s, T (ρ a s) = σ a (T s)}
  zero_mem' := by simp
  add_mem' := by
    intro T U hT hU a s
    simp only [LinearMap.add_apply, map_add, hT a s, hU a s]
  smul_mem' := by
    intro z T hT a s
    simp only [LinearMap.smul_apply, map_smul, hT a s]

/-- G1: finite-module Morita evaluation, rather than an unexplained tensor decomposition. -/
def multiplicityEvaluation [Nontrivial S] :
    S ⊗[ℂ] multiplicitySpace Q ρ σ ≃ₗ[ℂ] E := by
  sorry

theorem multiplicityEvaluation_tmul [Nontrivial S]
    (s : S) (T : multiplicitySpace Q ρ σ) :
    multiplicityEvaluation Q ρ σ (s ⊗ₜ[ℂ] T) = T.val s := by
  sorry

end Multiplicity

section ConnectionContraction

open Bundle

variable {E H M F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  {W : M → Type*} [∀ x, NormedAddCommGroup (W x)]
  [∀ x, InnerProductSpace ℂ (W x)]
  [TopologicalSpace (TotalSpace F W)] [FiberBundle F W] [VectorBundle ℝ F W]
  [RiemannianBundle (fun x : M => TangentSpace I x)]

/-- G6 pointwise contraction, using the supplier's actual covariant derivative.
Smooth Clifford compatibility and a smooth bundle frame are README hypotheses.
The frame-independence theorem below is algebraic and needs no smoothness. -/
def diracInFrame {n : ℕ}
    (c : ∀ x, TangentSpace I x →ₗ[ℝ] Module.End ℂ (W x))
    (conn : CovariantDerivative I F W) (s : ∀ x, W x) (x : M)
    (b : OrthonormalBasis (Fin n) ℝ (TangentSpace I x)) : W x :=
  ∑ j, c x (b j) (conn s x (b j))

theorem diracInFrame_eq {n : ℕ}
    (c : ∀ x, TangentSpace I x →ₗ[ℝ] Module.End ℂ (W x))
    (conn : CovariantDerivative I F W) (s : ∀ x, W x) (x : M)
    (b b' : OrthonormalBasis (Fin n) ℝ (TangentSpace I x)) :
    diracInFrame c conn s x b = diracInFrame c conn s x b' := by
  sorry

end ConnectionContraction

section QuaternionicKernelParity

variable {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
  [FiniteDimensional ℂ V]

/-- Finite-dimensional conjugate-linear square law forces even complex dimension.
This algebraic lemma does not require a group action. -/
theorem even_finrank_of_conjLinear_square_neg
    (J : V →ₛₗ[starRingEnd ℂ] V) (hsq : ∀ v, J (J v) = -v) :
    Even (Module.finrank ℂ V) := by
  classical
  let b := Module.finBasis ℂ V
  let A : Matrix (Fin (Module.finrank ℂ V)) (Fin (Module.finrank ℂ V)) ℂ :=
    fun i j => b.repr (J (b j)) i
  have hmatrix : A * A.map (starRingEnd ℂ) = -1 := by
    ext i j
    have h := congrArg (fun v => b.repr v i) (hsq (b j))
    have hsum : J (J (b j)) = ∑ k, star (b.repr (J (b j)) k) • J (b k) := by
      calc
        J (J (b j)) = J (∑ k, b.repr (J (b j)) k • b k) :=
          congrArg J (b.sum_repr (J (b j))).symm
        _ = _ := by simp only [map_sum, map_smulₛₗ, starRingEnd_apply]
    rw [hsum] at h
    change (∑ k, A i k * (starRingEnd ℂ) (A k j)) =
      -(1 : Matrix _ _ ℂ) i j
    simpa [A, map_sum, mul_comm, Matrix.one_apply,
      Finsupp.single_apply, eq_comm] using h
  have hd := congrArg Matrix.det hmatrix
  have heq : A.det * star A.det = (-1 : ℂ) ^ Module.finrank ℂ V := by
    have hmap : (A.map (starRingEnd ℂ)).det = star A.det := by
      simpa only [RingHom.mapMatrix_apply, starRingEnd_apply] using
        ((starRingEnd ℂ).map_det A).symm
    rw [Matrix.det_mul, hmap, Matrix.det_neg,
      Matrix.det_one, mul_one] at hd
    simpa only [Fintype.card_fin, starRingEnd_apply] using hd
  by_contra hnot
  have hodd : Odd (Module.finrank ℂ V) := Nat.not_even_iff_odd.mp hnot
  rw [hodd.neg_one_pow] at heq
  have hr := congrArg Complex.re heq
  simp only [Complex.star_def, Complex.mul_conj, Complex.ofReal_re,
    Complex.neg_re, Complex.one_re] at hr
  have hp := Complex.normSq_nonneg A.det
  linarith

/-- Native quaternionic equivariance supplies the square law; equivariance is
not otherwise needed for finite-dimensional parity. -/
theorem even_finrank_of_quaternionicStructure
    (ρ : Representation ℂ G V) (J : V →ₛₗ[starRingEnd ℂ] V)
    (hJ : Representation.IsQuaternionicStructure ρ J) :
    Even (Module.finrank ℂ V) :=
  even_finrank_of_conjLinear_square_neg J hJ.sq_eq_neg

end QuaternionicKernelParity

end TauCetiRoadmap.SpinGeometry
