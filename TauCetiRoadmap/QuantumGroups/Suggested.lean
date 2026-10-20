/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.FromMatrix
import Mathlib.LinearAlgebra.Matrix.ConjTranspose
import Mathlib.Algebra.Star.Unitary
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Analysis.Complex.Order
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.Analysis.InnerProductSpace.PiL2
import TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive
import Mathlib.Algebra.FreeAlgebra
import Mathlib.Algebra.RingQuot
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.RepresentationTheory.Rep.Iso

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
These prototypes use native Hopf algebras and existing comodule coefficient
matrices. The analytic tensor/coaction constructions belong to the README;
they are not replaced here by empty proposition fields.
-/

open scoped TensorProduct ComplexOrder
open Module CategoryTheory
namespace QuantumGroups

universe u v w

/-- Q8.5: finite dimension is over the base field, not over the Hopf algebra.
The synonym separates tensor-over-k from ModuleCat H's possible tensor-over-H. -/
def FiniteHopfModuleCat (k : Type u) (H : Type v)
    [Field k] [Ring H] [Algebra k H] :=
  CategoryTheory.ObjectProperty.FullSubcategory (fun V : ModuleCat.{u} H =>
    FiniteDimensional k ((ModuleCat.restrictScalars (algebraMap k H)).obj V))

section Carrier
variable (k : Type u) (H : Type v) [Field k] [Ring H] [Algebra k H]

def finiteProperty : CategoryTheory.ObjectProperty (ModuleCat.{u} H) :=
  fun V => FiniteDimensional k ((ModuleCat.restrictScalars (algebraMap k H)).obj V)

instance : CategoryTheory.Category (FiniteHopfModuleCat k H) :=
  inferInstanceAs (CategoryTheory.Category ((finiteProperty k H).FullSubcategory))

noncomputable def toBaseModules : FiniteHopfModuleCat k H ⥤ ModuleCat.{u} k :=
  (finiteProperty k H).ι ⋙ ModuleCat.restrictScalars (algebraMap k H)

noncomputable def toFiniteBaseModules : FiniteHopfModuleCat k H ⥤ FGModuleCat.{u} k :=
  (ModuleCat.isFG k).lift (toBaseModules k H) (fun V => V.property)

instance toBaseModulesFaithful : (toBaseModules k H).Faithful where
  map_injective {X Y} {f g} h := by
    apply CategoryTheory.ObjectProperty.hom_ext
    apply ModuleCat.hom_ext
    ext x
    exact congrArg (fun t => t.hom x) h

instance toFiniteBaseModulesFaithful : (toFiniteBaseModules k H).Faithful where
  map_injective {X Y} {f g} h := by
    apply (toBaseModules k H).map_injective
    exact congrArg (fun t => t.hom) h
end Carrier

section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

/-- Star compatibility supplements the native Hopf algebra, without another carrier. -/
class StarCompatibleHopf : Prop where
  comul_star : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) =
    star (Coalgebra.comul (R := ℂ) a)

/-- Counit star compatibility is a consequence, not an extra defining axiom. -/
theorem counit_star [StarCompatibleHopf (A := A)] (a : A) :
    Coalgebra.counit (R := ℂ) (star a) = star (Coalgebra.counit (R := ℂ) a) := by
  sorry

/-- Antipode-star compatibility follows from uniqueness of convolution inverse. -/
theorem antipode_star_antipode_star [StarCompatibleHopf (A := A)] (a : A) :
    HopfAlgebra.antipode ℂ (star (HopfAlgebra.antipode ℂ (star a))) = a := by
  sorry

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

omit [StarModule ℂ A] in
/-- The antipode inverse already supplied by the comodule API becomes the matrix adjoint. -/
theorem coefficientMatrix_map_antipode_eq_star (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis).map
      (HopfAlgebra.antipode ℂ) =
    star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis) := by
  let U := TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis
  have hright : U * star U = 1 := Unitary.mul_star_self_of_mem hu
  have hleft : U.map (HopfAlgebra.antipode ℂ) * U = 1 :=
    TauCeti.Comodule.map_antipode_mul_coefficientMatrix b.toBasis
  change U.map (HopfAlgebra.antipode ℂ) = star U
  calc
    U.map (HopfAlgebra.antipode ℂ) = U.map (HopfAlgebra.antipode ℂ) * (U * star U) :=
      by rw [hright, mul_one]
    _ = (U.map (HopfAlgebra.antipode ℂ) * U) * star U := (mul_assoc _ _ _).symm
    _ = star U := by rw [hleft, one_mul]

omit [StarModule ℂ A] in
/-- This entrywise convention is forced by the existing column-coaction orientation. -/
theorem antipode_coefficient (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A))
    (i j : ι) :
    HopfAlgebra.antipode ℂ (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) =
      star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis j i) := by
  have h := congrFun (congrFun (coefficientMatrix_map_antipode_eq_star (A := A) b hu) i) j
  simpa only [Matrix.map_apply, Matrix.star_apply] using h

/-- Haar invariance on the core is stated by actual slice equations. -/
structure AlgebraicHaar where
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- The matrix Ft is the pre-antipode F̃ in the README, rather than its transpose F. -/
theorem schur_orthogonality [StarCompatibleHopf (A := A)]
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

section StarPresentations

variable {A : Type u} [Ring A] [Algebra ℂ A] [StarRing A] [StarModule ℂ A]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- Q5's coefficient relation uses the entrywise bar, not the matrix adjoint. -/
def freeOrthogonalRelation (F : Matrix ι ι ℂ) [Invertible F] (U : Matrix ι ι A) : Prop :=
  U ∈ unitary (Matrix ι ι A) ∧
    U = F.map (algebraMap ℂ A) * U.map star * (⅟ F).map (algebraMap ℂ A)

/-- The F indices fix the signed cup and tensor-product orientation. -/
noncomputable def freeOrthogonalCupVector (F : Matrix ι ι ℂ) :
    (ι → ℂ) ⊗[ℂ] (ι → ℂ) :=
  ∑ i, ∑ j, F j i • ((Pi.basisFun ℂ ι) i ⊗ₜ[ℂ] (Pi.basisFun ℂ ι) j)

/-- The cup intertwiner equation for the native U₁₃U₂₃ tensor convention. -/
theorem freeOrthogonalCup_invariant (F : Matrix ι ι ℂ) [Invertible F]
    (U : Matrix ι ι A) (hU : freeOrthogonalRelation F U) (i k : ι) :
    ∑ j, ∑ l, U i j * algebraMap ℂ A (F l j) * U k l =
      algebraMap ℂ A (F k i) := by
  sorry

/-- In orthonormal coordinates this is the signed cup-cap zigzag equation. -/
theorem freeOrthogonalCup_zigzag (F : Matrix ι ι ℂ) (c : ℝ)
    (hF : F * F.map star = (c : ℂ) • (1 : Matrix ι ι ℂ)) (j k : ι) :
    ∑ i, F j i * star (F i k) = (c : ℂ) * (if j = k then 1 else 0) := by
  have h := congrFun (congrFun hF j) k
  simpa only [Matrix.mul_apply, Matrix.map_apply, Matrix.smul_apply,
    Matrix.one_apply, smul_eq_mul] using h

/-- The SUq(2) fundamental matrix has the specified off-diagonal coefficient. -/
def suqMatrix (q : ℝ) (a c : A) : Matrix (Fin 2) (Fin 2) A :=
  !![a, -(q : ℂ) • star c; c, star a]

/-- These algebraic relations make sense for every real q; the CQG family has q≠0. -/
structure SUqRelations (q : ℝ) (a c : A) : Prop where
  initial : star a * a + star c * c = 1
  final : a * star a + (q ^ 2 : ℂ) • (star c * c) = 1
  c_normal : star c * c = c * star c
  ac : a * c = (q : ℂ) • (c * a)
  ac_star : a * star c = (q : ℂ) • (star c * a)

/-- Unitarity of this matrix is equivalent to the stated generator relations. -/
theorem suqMatrix_unitary_iff (q : ℝ) (a c : A) :
    suqMatrix q a c ∈ unitary (Matrix (Fin 2) (Fin 2) A) ↔ SUqRelations q a c := by
  sorry

end StarPresentations

noncomputable section GenericRankOne

inductive SL2Generator
  | E | F | K | Kinv
  deriving DecidableEq

/-- Q8: actual equations in the free complex algebra. -/
inductive QuantumSL2Relation (q : ℂ) :
    FreeAlgebra ℂ SL2Generator → FreeAlgebra ℂ SL2Generator → Prop
  | kkInv : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .Kinv) 1
  | kInvK : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .Kinv * FreeAlgebra.ι ℂ .K) 1
  | ke : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .E)
      (q ^ 2 • (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .K))
  | kf : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .F)
      ((q⁻¹) ^ 2 • (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .K))
  | ef : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .F)
      (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .E +
        (q - q⁻¹)⁻¹ • (FreeAlgebra.ι ℂ .K - FreeAlgebra.ι ℂ .Kinv))

/-- The quotient is defined for all q. At zero the E,F generators vanish;
at q=±1 the totalized inverse yields a commutative quotient. The generic
PBW/Hopf/representation targets in the README state their parameter hypotheses. -/
abbrev QuantumSL2 (q : ℂ) := RingQuot (QuantumSL2Relation q)

def quantumSL2Generator (q : ℂ) (g : SL2Generator) : QuantumSL2 q :=
  RingQuot.mkAlgHom ℂ (QuantumSL2Relation q) (FreeAlgebra.ι ℂ g)

/-- The Laurent generator is an actual unit of the quotient. -/
def quantumSL2KUnit (q : ℂ) : (QuantumSL2 q)ˣ where
  val := quantumSL2Generator q .K
  inv := quantumSL2Generator q .Kinv
  val_inv := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kkInv (q := q)))
  inv_val := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kInvK (q := q)))

def quantumSL2Casimir (q : ℂ) : QuantumSL2 q :=
  quantumSL2Generator q .F * quantumSL2Generator q .E +
    ((q - q⁻¹) ^ 2)⁻¹ •
      (q • quantumSL2Generator q .K + q⁻¹ • quantumSL2Generator q .Kinv)

/-- Q8.1: the coproduct on the actual quotient, with complex scalars central. -/
def quantumSL2Comul (q : ℂ) [Fact (q ≠ 0)] :
    QuantumSL2 q →ₐ[ℂ] (QuantumSL2 q) ⊗[ℂ] QuantumSL2 q := by
  sorry

/-- The three generator equations pin the Hopf convention of Q8. -/
theorem quantumSL2Comul_generators (q : ℂ) [Fact (q ≠ 0)] :
    quantumSL2Comul q (quantumSL2Generator q .K) =
      quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .K ∧
    quantumSL2Comul q (quantumSL2Generator q .E) =
      quantumSL2Generator q .E ⊗ₜ[ℂ] 1 +
        quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .E ∧
    quantumSL2Comul q (quantumSL2Generator q .F) =
      quantumSL2Generator q .F ⊗ₜ[ℂ] quantumSL2Generator q .Kinv +
        1 ⊗ₜ[ℂ] quantumSL2Generator q .F := by
  sorry

/-- Q8.1 PBW basis on the presentation, not a privately assumed algebra. -/
def quantumSL2PBWBasis (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    Module.Basis (ℕ × ℤ × ℕ) ℂ (QuantumSL2 q) := by
  sorry

theorem quantumSL2PBWBasis_apply (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (a : ℕ) (b : ℤ) (c : ℕ) :
    quantumSL2PBWBasis q hq hgeneric (a, b, c) =
      quantumSL2Generator q .F ^ a *
        ((quantumSL2KUnit q) ^ b : (QuantumSL2 q)ˣ) *
        quantumSL2Generator q .E ^ c := by
  sorry

theorem quantumSL2Casimir_commute (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (x : QuantumSL2 q) :
    Commute (quantumSL2Casimir q) x := by
  sorry

end GenericRankOne

end QuantumGroups
