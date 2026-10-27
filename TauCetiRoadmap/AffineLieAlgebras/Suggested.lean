import Mathlib
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Finite
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Embedding

/-!
# Affine Lie algebras, smooth modules and completed centers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, the targets whose carriers exist at the pins: the
smooth/continuous module adapter for a ring with a left-ideal neighbourhood
basis, the polynomial and formal current carriers with their order filtration,
the formal vertex-algebra axioms with the Borcherds identity and the Lie algebra
on the weight-one space, the abelian Heisenberg algebra, and the lattice inputs
(positive even lattice, central cover, twisted group algebra, Fock space and its
weight grading).

Headline theorems that are not statable at the pins:
* the continuous `H²` classification of A1 lacks the t-adic topology on `g((t))`
  and the formal residue cocycle on `g((t))`;
* the smooth/continuous module equivalence of A5, the scalar center away from
  critical level (A7), the Feigin–Frenkel isomorphism and the loop-group action
  on the critical center (A8) lack the completed enveloping algebra at a level,
  an inverse-limit completion whose ring structure is itself a theorem;
* the lattice vertex algebra `V_L` and the comparison of its weight-one Lie
  algebra with the ADE Lie algebra (C7) lack the Heisenberg modes and charge
  fields on the lattice Fock space, and the signed-ADE carrier, which is not in
  the pinned libraries.
-/

noncomputable section
open scoped TensorProduct DirectSum
namespace TauCetiRoadmap.AffineLieAlgebras
open CategoryTheory

universe u v

/-- Generic A5 smooth-module property: an actual left-ideal annihilator condition. -/
def genericSmoothProperty (A : Type u) [Ring A]
    (J : ℕ+ → Submodule A A) : ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M, ∃ N : ℕ+, ∀ a ∈ J N, a • m = 0

/-- Generic A5 discrete continuous action, independently of affine generators. -/
def genericContinuousProperty (A : Type u) [Ring A] [TopologicalSpace A] :
    ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M,
    letI : TopologicalSpace M := ⊥
    Continuous (fun a : A => a • m)

/-- The generic adapter requires the actual zero-neighborhood filter basis. -/
theorem genericSmooth_iff_continuous (A : Type u) [Ring A]
    [TopologicalSpace A] [IsTopologicalAddGroup A]
    (J : ℕ+ → Submodule A A)
    (hJ : (nhds (0 : A)).HasBasis (fun _ : ℕ+ => True)
      (fun N => (J N : Set A))) (M : ModuleCat.{v} A) :
    genericSmoothProperty A J M ↔ genericContinuousProperty A M := by
  sorry

variable (g : Type u) [LieRing g] [LieAlgebra ℂ g]

abbrev PolynomialCurrent := LieAlgebra.loopAlgebra ℂ ℤ g
local instance : Algebra ℂ (LaurentSeries ℂ) := HahnSeries.instAlgebra

abbrev FormalCurrent := LaurentSeries ℂ ⊗[ℂ] g

/-- The native Laurent coefficient order filtration. -/
def scalarOrderSubspace (N : ℤ) : Submodule ℂ (LaurentSeries ℂ) where
  carrier := {f | ∀ n : ℤ, n < N → f.coeff n = 0}
  zero_mem' := by simp
  add_mem' := by
    intro f h hf hh n hn
    simp [hf n hn, hh n hn]
  smul_mem' := by
    intro c f hf n hn
    simp [hf n hn]

/-- The actual base-change order subspace t^N O⊗g, using native tensor maps. -/
def orderSubspace (N : ℤ) : Submodule ℂ (FormalCurrent g) :=
  LinearMap.range (LinearMap.rTensor g (scalarOrderSubspace N).subtype)

/-- Formal monomial current. -/
def mode (x : g) (n : ℤ) : FormalCurrent g :=
  HahnSeries.single n (1 : ℂ) ⊗ₜ[ℂ] x

/-- Current base-change bracket estimates. -/
theorem bracket_order (M N : ℤ) (a b : FormalCurrent g)
    (ha : a ∈ orderSubspace g M) (hb : b ∈ orderSubspace g N) :
    ⁅a, b⁆ ∈ orderSubspace g (M + N) := by
  sorry

/-- The distinguished critical sign uses the existing trace/Killing form. -/
def criticalForm : LinearMap.BilinForm ℂ g :=
  (-(1 / 2 : ℂ)) • killingForm ℂ g

/-- Independent PBW foundation is consumed directly, not restated as a private map. -/
example : Function.Injective (UniversalEnvelopingAlgebra.ι ℂ : g →
    UniversalEnvelopingAlgebra ℂ g) :=
  TauCeti.UniversalEnvelopingAlgebra.ι_injective ℂ g

namespace RankOne

abbrev Sl2 := LieAlgebra.SpecialLinear.sl (Fin 2) ℂ
abbrev OriginalSL2Loops := Matrix.SpecialLinearGroup (Fin 2) (LaurentSeries ℂ)

abbrev OriginalSL2HopfLoops := TauCeti.HopfAlgebra.points
  (H := TauCeti.SpecialLinear.coordinateHopfAlgebra ℂ 2)
  (CommAlgCat.of ℂ (LaurentSeries ℂ))

theorem criticalInvariant : (criticalForm Sl2).lieInvariant Sl2 := by sorry
theorem criticalSymm : (criticalForm Sl2).IsSymm := by sorry

def e : Sl2 := LieAlgebra.SpecialLinear.single (0 : Fin 2) 1 (by decide) 1
def f : Sl2 := LieAlgebra.SpecialLinear.single (1 : Fin 2) 0 (by decide) 1
def h : Sl2 := LieAlgebra.SpecialLinear.singleSubSingle (0 : Fin 2) 1 1

end RankOne

/-! ## C7. Formal vertex algebras and lattice inputs -/

namespace VertexFoundations

/-- Operator covariance is an equation on the actual coefficient endomorphisms.
It is independent of the state-derivative equation Y(Ta)=∂Y(a). -/
def FieldTranslationCovariant {V : Type u} [AddCommGroup V] [Module ℂ V]
    (T : Module.End ℂ V) (A : HVertexOperator ℤ ℂ V V) : Prop :=
  ∀ n : ℤ,
    T * HVertexOperator.coeff A (-n - 1) - HVertexOperator.coeff A (-n - 1) * T =
      -(n : ℂ) • HVertexOperator.coeff A (-(n - 1) - 1)

/-- Covariant fields form a linear subspace; a spanning family of covariant
states therefore suffices. This lemma assumes no vertex-algebra axioms. -/
theorem fieldTranslationCovariant_of_span_top {V : Type u}
    [AddCommGroup V] [Module ℂ V] (T : Module.End ℂ V)
    (Y : V →ₗ[ℂ] HVertexOperator ℤ ℂ V V) (S : Set V)
    (hspan : Submodule.span ℂ S = ⊤)
    (hS : ∀ a ∈ S, FieldTranslationCovariant T (Y a)) :
    ∀ a, FieldTranslationCovariant T (Y a) := by
  sorry

/-- Generic formal vertex-algebra data on the native heterogeneous Hahn
field carrier. This foundation has no ADE or affine-vacuum input. -/
structure FormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V] where
  field : V →ₗ[ℂ] HVertexOperator ℤ ℂ V V
  vacuum : V
  translation : V →ₗ[ℂ] V
  translation_vacuum : translation vacuum = 0
  vacuum_coeff : ∀ a n,
    HVertexOperator.coeff (field vacuum) (-n - 1) a =
      (if n = -1 then a else 0)
  creation : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (n : ℤ) vacuum =
      (Nat.factorial n : ℂ)⁻¹ • ((translation ^ n) a)
  creation_no_poles : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (-(n : ℤ) - 1) vacuum = 0
  translation_coeff : ∀ a n,
    HVertexOperator.coeff (field (translation a)) (-n - 1) =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-n)
  /-- The operator law is a separate axiom, not inferred from state derivative. -/
  operator_translation_coeff : ∀ a n,
    translation * HVertexOperator.coeff (field a) (-n - 1) -
        HVertexOperator.coeff (field a) (-n - 1) * translation =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-(n - 1) - 1)
  truncation : ∀ a b, ∃ N : ℤ, ∀ n, N ≤ n →
    HVertexOperator.coeff (field a) (-n - 1) b = 0
  locality : ∀ a b, ∃ N : ℕ, ∀ m n c,
    ∑ i ∈ Finset.range (N + 1),
      (((-1 : ℂ) ^ i) * (Nat.choose N i : ℂ)) •
        (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1)
          (HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1) c) -
         HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1)
          (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1) c)) = 0

def formalMode {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a : V) (n : ℤ) : Module.End ℂ V :=
  HVertexOperator.coeff (A.field a) (-n - 1)

/-- Operator covariance projects the genuine independent axiom.
Multiplication is native composition; no implication from weaker laws is asserted. -/
theorem formalVertex_translation_covariance {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : FormalVertexAxioms V) (a : V) (n : ℤ) :
    A.translation * formalMode A a n - formalMode A a n * A.translation =
      -(n : ℂ) • formalMode A a (n - 1) := by
  exact A.operator_translation_coeff a n

/-- The generic coefficient form of Borcherds' identity, with all states and
integer mode indices retained. -/
theorem formalVertex_borcherds {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a b c : V) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i → formalMode A (formalMode A a (n + i) b) (m + r - i) c = 0) ∧
      (∀ i, N ≤ i →
        formalMode A a (m + n - i) (formalMode A b (r + i) c) = 0 ∧
        formalMode A b (n + r - i) (formalMode A a (m + i) c) = 0) ∧
      (∑ i ∈ Finset.range N,
        ((Ring.choose m i : ℤ) : ℂ) •
          formalMode A (formalMode A a (n + i) b) (m + r - i) c) =
      ∑ i ∈ Finset.range N,
        (((-1 : ℂ) ^ i) * (((Ring.choose n i : ℤ) : ℂ)) ) •
          (formalMode A a (m + n - i) (formalMode A b (r + i) c) -
            (-1 : ℂ) ^ n •
              formalMode A b (n + r - i) (formalMode A a (m + i) c)) := by
  sorry

/-- A grading records the actual degree-zero vacuum and the mode-degree rule.
The integer coefficient index is normalized by Y(a,z)=Σ a_(n)z^(-n-1). -/
structure GradedFormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V]
    extends FormalVertexAxioms V where
  weightSpace : ℕ → Submodule ℂ V
  /-- The grading is an actual algebraic direct sum, not just a collection of
  subspaces with negative-degree vanishing. -/
  isInternal : DirectSum.IsInternal weightSpace
  vacuum_weight_zero : weightSpace 0 = ℂ ∙ vacuum
  mode_degree : ∀ (p q : ℕ) (n : ℤ),
    n + 1 ≤ (p + q : ℤ) →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b ∈
          weightSpace (Int.toNat ((p + q : ℤ) - (n + 1)))
  negative_weight_mode_vanishes : ∀ (p q : ℕ) (n : ℤ),
    (p + q : ℤ) < n + 1 →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b = 0

namespace GradedFormalVertexAxioms

/-- The inverse is the actual sum of the component inclusions. -/
noncomputable def gradedDecomposition {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : V ≃ₗ[ℂ] (⨁ n : ℕ, A.weightSpace n) :=
  (LinearEquiv.ofBijective (DirectSum.coeLinearMap A.weightSpace) A.isInternal).symm

@[simp] theorem gradedDecomposition_symm_of {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (n : ℕ)
    (x : A.weightSpace n) :
    A.gradedDecomposition.symm (DirectSum.of _ n x) = (x : V) := by
  change DirectSum.coeLinearMap A.weightSpace (DirectSum.of _ n x) = (x : V)
  simp

@[simp] theorem gradedDecomposition_apply_mem {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) {n : ℕ} {x : V}
    (hx : x ∈ A.weightSpace n) :
    A.gradedDecomposition x = DirectSum.of _ n ⟨x, hx⟩ := by
  let e := LinearEquiv.ofBijective (DirectSum.coeLinearMap A.weightSpace) A.isInternal
  apply e.injective
  change e (e.symm x) = e (DirectSum.of _ n ⟨x, hx⟩)
  rw [LinearEquiv.apply_symm_apply]
  change x = DirectSum.coeLinearMap A.weightSpace (DirectSum.of _ n ⟨x, hx⟩)
  simp

theorem gradedDecomposition_symm_eq_inclusion {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    A.gradedDecomposition.symm.toLinearMap = DirectSum.coeLinearMap A.weightSpace := rfl

theorem weightSpace_spans {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : iSup A.weightSpace = ⊤ :=
  DirectSum.IsInternal.submodule_iSup_eq_top A.isInternal

theorem weightSpace_independent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : iSupIndep A.weightSpace :=
  DirectSum.IsInternal.submodule_iSupIndep A.isInternal

end GradedFormalVertexAxioms

/-- Closure uses the actual degree rule on the actual field coefficient. -/
theorem weightOneZeroProduct_mem {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) (x y : A.weightSpace 1) :
    HVertexOperator.coeff (A.field (x : V)) (-1) (y : V) ∈ A.weightSpace 1 := by
  have h := A.mode_degree 1 1 (0 : ℤ) (by norm_num)
    (x : V) x.property (y : V) y.property
  simpa using h

/-- This bilinear operation is defined from A.field, not an admitted fixed value. -/
noncomputable def weightOneZeroProduct {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 where
  toFun x :=
    { toFun := fun y => ⟨HVertexOperator.coeff (A.field (x : V)) (-1) (y : V),
        weightOneZeroProduct_mem A x y⟩
      map_add' := by intro y z; apply Subtype.ext; simp
      map_smul' := by intro c y; apply Subtype.ext; simp }
  map_add' := by
    intro x y
    apply LinearMap.ext
    intro z
    apply Subtype.ext
    simp
  map_smul' := by
    intro c x
    apply LinearMap.ext
    intro y
    apply Subtype.ext
    simp

theorem weightOneZeroProduct_apply {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V)
    (x y : A.weightSpace 1) :
    (weightOneZeroProduct A x y : V) =
      HVertexOperator.coeff (A.field (x : V)) (-1) (y : V) := rfl

theorem weightOneZeroProduct_is_actual_zero_mode {V : Type u}
    [AddCommGroup V] [Module ℂ V] (A : GradedFormalVertexAxioms V)
    (x y : A.weightSpace 1) :
    (weightOneZeroProduct A x y : V) = formalMode A.toFormalVertexAxioms x 0 y := rfl

/-- Genuine vertex-theoretic obligations in the original submodule addition. -/
theorem weightOneZeroProduct_alternating {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x : A.weightSpace 1) :
    weightOneZeroProduct A x x = 0 := by
  sorry

theorem weightOneZeroProduct_skew {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y : A.weightSpace 1) :
    weightOneZeroProduct A x y + weightOneZeroProduct A y x = 0 := by
  have h := weightOneZeroProduct_alternating A (x + y)
  simpa only [map_add, LinearMap.add_apply, weightOneZeroProduct_alternating,
    zero_add, add_zero, add_comm] using h

theorem weightOneZeroProduct_leibniz {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) =
      weightOneZeroProduct A (weightOneZeroProduct A x y) z +
        weightOneZeroProduct A y (weightOneZeroProduct A x z) := by
  sorry

/-- The literal record extends the OLD submodule additive group. -/
@[instance_reducible]
noncomputable def weightOneLieRing {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) : LieRing (A.weightSpace 1) :=
  { (inferInstance : AddCommGroup (A.weightSpace 1)) with
    bracket := fun x y => weightOneZeroProduct A x y
    add_lie := by
      intro x y z
      exact congrArg (fun f : A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 => f z)
        ((weightOneZeroProduct A).map_add x y)
    lie_add := fun x y z => (weightOneZeroProduct A x).map_add y z
    lie_self := weightOneZeroProduct_alternating A
    leibniz_lie := weightOneZeroProduct_leibniz A }

theorem weightOneLieRing_parent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    (weightOneLieRing A).toAddCommGroup =
      (inferInstance : AddCommGroup (A.weightSpace 1)) := rfl

/-- Capture the old module before installing the compatible Lie ring. -/
@[instance_reducible]
noncomputable def weightOneLieAlgebra {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    @LieAlgebra ℂ (A.weightSpace 1) _ (weightOneLieRing A) := by
  let oldModule : Module ℂ (A.weightSpace 1) := inferInstance
  letI : LieRing (A.weightSpace 1) := weightOneLieRing A
  exact { oldModule with
    lie_smul := fun c x y => (weightOneZeroProduct A x).map_smul c y }

theorem weightOneLieAlgebra_parent {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : GradedFormalVertexAxioms V) :
    (weightOneLieAlgebra A).toModule =
      (inferInstance : Module ℂ (A.weightSpace 1)) := rfl

/-- The old existence endpoint now has the specified coherent witness. -/
theorem weightOneZeroProduct_isLie {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    ∃ inst : LieRing (A.weightSpace 1),
      (letI : LieRing (A.weightSpace 1) := inst
       ∀ x y, ⁅x, y⁆ = weightOneZeroProduct A x y) := by
  refine ⟨weightOneLieRing A, ?_⟩
  intro x y
  rfl

theorem weightOneZeroProduct_jacobi {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) +
      weightOneZeroProduct A y (weightOneZeroProduct A z x) +
        weightOneZeroProduct A z (weightOneZeroProduct A x y) = 0 := by
  let _ := weightOneLieRing A
  exact lie_jacobi x y z

/-- The loop-mode carrier is the actual finitely supported abelian loop space
plus its one-dimensional central coordinate. -/
abbrev AbelianHeisenbergCarrier (H : Type u) [Zero H] := (ℤ →₀ H) × ℂ

def abelianHeisenbergLoopMode {H : Type u} [AddCommGroup H]
    (n : ℤ) (h : H) : AbelianHeisenbergCarrier H := (Finsupp.single n h, 0)

def abelianHeisenbergCentral {H : Type u} [Zero H] (c : ℂ) :
    AbelianHeisenbergCarrier H := (0, c)

/-- The standard finite-sum cocycle on loop modes. The coefficient at mode `m`
is `m B(x_m,y_{-m})`; finite support makes the sum finite. -/
def abelianHeisenbergBracket {H : Type u} [AddCommGroup H] [Module ℂ H]
    (B : LinearMap.BilinForm ℂ H) (x y : AbelianHeisenbergCarrier H) :
    AbelianHeisenbergCarrier H :=
  (0, x.1.sum fun m h => (m : ℂ) * B h (y.1 (-m)))

theorem abelianHeisenbergBracket_skew {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H) (hB : B.IsSymm)
    (x y : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B x y + abelianHeisenbergBracket B y x = 0 := by
  sorry

theorem abelianHeisenbergBracket_jacobi {H : Type u} [AddCommGroup H]
    [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (x y z : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B x (abelianHeisenbergBracket B y z) +
      abelianHeisenbergBracket B y (abelianHeisenbergBracket B z x) +
      abelianHeisenbergBracket B z (abelianHeisenbergBracket B x y) = 0 := by
  sorry

theorem abelianHeisenbergBracket_single_modes {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (m n : ℤ) (h k : H) :
    abelianHeisenbergBracket B
      (abelianHeisenbergLoopMode m h) (abelianHeisenbergLoopMode n k) =
      (0, if m + n = 0 then (m : ℂ) * B h k else 0) := by
  sorry

theorem abelianHeisenbergBracket_central_left {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (c : ℂ) (x : AbelianHeisenbergCarrier H) :
    abelianHeisenbergBracket B (abelianHeisenbergCentral c) x = 0 := by
  sorry

theorem abelianHeisenbergBracket_central_right {H : Type u}
    [AddCommGroup H] [Module ℂ H] (B : LinearMap.BilinForm ℂ H)
    (x : AbelianHeisenbergCarrier H) (c : ℂ) :
    abelianHeisenbergBracket B x (abelianHeisenbergCentral c) = 0 := by
  sorry

abbrev AbelianOscillatorFock (H : Type u) [AddCommGroup H] [Module ℂ H] :=
  SymmetricAlgebra ℂ (ℕ+ →₀ H)

end VertexFoundations

namespace LatticeVOA

universe w

/-- An input uses the existing embedded lattice and carries finite-free, even,
positive-definite hypotheses explicitly. Unimodularity is not assumed. -/
structure PositiveEvenLattice (V : Type u) [AddCommGroup V] [Module ℚ V] where
  lattice : TauCeti.IntegralLattice V
  finiteDimensional : Module.Finite ℤ lattice.carrier
  ambientFiniteDimensional : FiniteDimensional ℚ V
  free : Module.Free ℤ lattice.carrier
  even : lattice.IsEven
  positive : lattice.IsPosDef

instance carrierModuleFinite {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : Module.Finite ℤ D.lattice.carrier := D.finiteDimensional

instance carrierModuleFree {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : Module.Free ℤ D.lattice.carrier := D.free

/-- Bounded charge sets use the existing native positive-definite lattice
finiteness theorem; the lattice roadmap supplies its mathematical contract. -/
theorem positiveEvenLattice_bounded_vectors_finite {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) (C : ℚ) :
    {x : D.lattice.carrier | D.lattice.norm x ≤ C}.Finite :=
  D.positive.finite_setOf_norm_le C

theorem positiveEvenLattice_ambientFiniteDimensional
    {V : Type u} [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) :
    FiniteDimensional ℚ V := D.ambientFiniteDimensional

local instance instDecidableEqLatticeCarrier {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) : DecidableEq D.lattice.carrier :=
  Classical.decEq _

abbrev ComplexAmbient (V : Type u) [AddCommGroup V] [Module ℚ V]
    (_D : PositiveEvenLattice V) := ℂ ⊗[ℚ] V

/-- The bilinear form transported to the actual complexified ambient space. -/
noncomputable def complexLatticeForm {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :
    LinearMap.BilinForm ℂ (ComplexAmbient V D) :=
  LinearMap.BilinForm.baseChange ℂ D.lattice.form

theorem complexLatticeForm_tmul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (c d : ℂ) (x y : V) :
    complexLatticeForm D (c ⊗ₜ[ℚ] x) (d ⊗ₜ[ℚ] y) =
      c * d * (D.lattice.form x y : ℚ) := by
  change (D.lattice.form x y) • (c * d) =
    (c * d) * algebraMap ℚ ℂ (D.lattice.form x y)
  rw [Algebra.smul_def, mul_comm]

abbrev OscillatorGenerators (V : Type u) [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := ℕ+ →₀ ComplexAmbient V D

/-- A sign cocycle on the actual lattice carrier, with the commutator fixed by
its integral form. The cocycle remains an explicit input to all subsequent data. -/
structure NormalizedSignCocycle {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  epsilon : D.lattice.carrier → D.lattice.carrier → ℤˣ
  signValued : ∀ a b, epsilon a b = 1 ∨ epsilon a b = -1
  epsilon_zero_left : ∀ b, epsilon 0 b = 1
  epsilon_zero_right : ∀ a, epsilon a 0 = 1
  cocycle : ∀ a b c,
    epsilon a b * epsilon (a + b) c = epsilon b c * epsilon a (b + c)
  commutator : ∀ a b,
    epsilon a b * (epsilon b a)⁻¹ =
      (-1 : ℤˣ) ^ D.lattice.integralForm a b

/-- The actual central-extension carrier, with sign restricted to `{±1}`. -/
structure LatticeCoverElement {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  charge : D.lattice.carrier
  sign : {s : ℤˣ // s = 1 ∨ s = -1}

noncomputable def latticeCoverMul {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y : LatticeCoverElement D) : LatticeCoverElement D := by
  refine ⟨x.charge + y.charge, ⟨x.sign.1 * y.sign.1 * C.epsilon x.charge y.charge, ?_⟩⟩
  rcases x.sign.2 with hx | hx <;> rcases y.sign.2 with hy | hy <;>
    rcases C.signValued x.charge y.charge with he | he <;> simp [hx, hy, he]

def latticeCoverOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : LatticeCoverElement D :=
  ⟨0, ⟨1, Or.inl rfl⟩⟩

def latticeCoverProjection {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (x : LatticeCoverElement D) : D.lattice.carrier :=
  x.charge

def latticeCoverSection {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) : LatticeCoverElement D :=
  ⟨a, ⟨1, Or.inl rfl⟩⟩

def latticeCoverCentralInvolution {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : LatticeCoverElement D :=
  ⟨0, ⟨-1, Or.inr rfl⟩⟩

theorem latticeCoverProjection_mul {V : Type u} [AddCommGroup V]
    [Module ℚ V] {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y : LatticeCoverElement D) :
    latticeCoverProjection (latticeCoverMul C x y) =
      latticeCoverProjection x + latticeCoverProjection y := rfl

theorem latticeCoverSection_projection {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (a : D.lattice.carrier) :
    latticeCoverProjection (latticeCoverSection D a) = a := rfl

theorem latticeCover_centralInvolution_commutes {V : Type u}
    [AddCommGroup V] [Module ℚ V] {D : PositiveEvenLattice V}
    (C : NormalizedSignCocycle D) (x : LatticeCoverElement D) :
    latticeCoverMul C (latticeCoverCentralInvolution D) x =
      latticeCoverMul C x (latticeCoverCentralInvolution D) := by
  sorry

theorem latticeCoverMul_assoc {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x y z : LatticeCoverElement D) :
    latticeCoverMul C (latticeCoverMul C x y) z =
      latticeCoverMul C x (latticeCoverMul C y z) := by
  sorry

theorem latticeCover_one_mul {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : latticeCoverMul C (latticeCoverOne D) x = x := by
  sorry

theorem latticeCover_mul_one {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : latticeCoverMul C x (latticeCoverOne D) = x := by
  sorry

theorem latticeCover_inv_exists {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C : NormalizedSignCocycle D)
    (x : LatticeCoverElement D) : ∃ y,
      latticeCoverMul C x y = latticeCoverOne D ∧
      latticeCoverMul C y x = latticeCoverOne D := by
  sorry

/-- The exponent of the selected ordered-basis sign cocycle. The finite sum
uses the actual `LinearOrder` instance. -/
def orderedSignExponent {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) {I : Type v} [Fintype I] [LinearOrder I]
    (b : Module.Basis I ℤ D.lattice.carrier)
    (a c : D.lattice.carrier) : ℤ :=
  ∑ i : I, ∑ j : I,
    if j < i then
      D.lattice.integralForm (b i) (b j) * b.repr a i * b.repr c j
    else 0

/-- The carrier of the twisted lattice group algebra. Its product is defined
from the cocycle below, not the untwisted pointwise product. -/
abbrev TwistedGroupAlgebraCarrier {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := D.lattice.carrier →₀ ℂ

noncomputable def twistedGroupAlgebraMul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f g : TwistedGroupAlgebraCarrier D) : TwistedGroupAlgebraCarrier D := by
  classical
  exact f.sum fun a r => g.sum fun b s =>
    Finsupp.single (a + b) (r * s * ((C.epsilon a b : ℤ) : ℂ))

def twistedGroupAlgebraOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) : TwistedGroupAlgebraCarrier D :=
  Finsupp.single 0 1

theorem twistedGroupAlgebraMul_assoc {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f g h : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C (twistedGroupAlgebraMul D C f g) h =
      twistedGroupAlgebraMul D C f (twistedGroupAlgebraMul D C g h) := by
  sorry

theorem twistedGroupAlgebraOne_mul {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C (twistedGroupAlgebraOne D) f = f := by
  sorry

theorem twistedGroupAlgebraMul_one {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (f : TwistedGroupAlgebraCarrier D) :
    twistedGroupAlgebraMul D C f (twistedGroupAlgebraOne D) = f := by
  sorry

/-- The oscillator part is the symmetric algebra on the finite-support sum of
all negative modes. -/
abbrev FockSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (_C : NormalizedSignCocycle D) :=
  SymmetricAlgebra ℂ (OscillatorGenerators V D) ⊗[ℂ]
    TwistedGroupAlgebraCarrier D

def vacuumState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) : FockSpace D C :=
  1 ⊗ₜ[ℂ] twistedGroupAlgebraOne D

/-- A charge basis vector, declared before any action law that evaluates it. -/
def chargeState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a : D.lattice.carrier) : FockSpace D C :=
  1 ⊗ₜ[ℂ] Finsupp.single a 1

def oscillatorGenerator {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (n : ℕ+)
    (h : ComplexAmbient V D) : OscillatorGenerators V D :=
  Finsupp.single n h

/-- Embed the uncharged symmetric oscillator sector into the lattice Fock
space using its actual charge-zero basis vector. -/
noncomputable def latticeOscillatorEmbedding {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    VertexFoundations.AbelianOscillatorFock (ComplexAmbient V D) →ₗ[ℂ]
      FockSpace D C :=
  (TensorProduct.mk ℂ
    (VertexFoundations.AbelianOscillatorFock (ComplexAmbient V D))
    (TwistedGroupAlgebraCarrier D)).flip (Finsupp.single 0 1)

/-- The one-oscillator state whose field is the Heisenberg current. -/
def latticeHeisenbergState {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (h : ComplexAmbient V D) : FockSpace D C :=
  (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
    (oscillatorGenerator D 1 h)) ⊗ₜ[ℂ] Finsupp.single 0 1

/-- Finite orthonormal basis data for the conformal-vector construction. -/
structure OrthonormalComplexBasis {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) where
  Index : Type v
  finite : Fintype Index
  basis : Module.Basis Index ℂ (ComplexAmbient V D)
  orthonormal : ∀ i j,
    complexLatticeForm D (basis i) (basis j) =
      (by classical exact if i = j then (1 : ℂ) else 0)

/-- The actual homogeneous component indexed by oscillator degree plus the
lattice energy q(alpha)=B(alpha,alpha)/2. -/
def oscillatorWordMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :
    List (ℕ+ × ComplexAmbient V D) → SymmetricAlgebra ℂ (OscillatorGenerators V D)
  | [] => 1
  | (n, h) :: tail =>
      SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) (oscillatorGenerator D n h) *
        oscillatorWordMonomial D tail

def latticeFockMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) :
    FockSpace D C :=
  oscillatorWordMonomial D word ⊗ₜ[ℂ] Finsupp.single a 1

/-- Spanning is a symmetric-algebra/tensor fact, independent of vertex axioms. -/
theorem latticeFockMonomials_span {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Submodule.span ℂ {x | ∃ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier), x = latticeFockMonomial D C word a} = ⊤ := by
  sorry

def dividedDerivativeFactor (m : ℕ+) (k : ℤ) : ℂ :=
  let P : ℤ := Finset.prod (Finset.range (m.1 - 1))
    (fun j : ℕ => k + (j : ℤ) + 1)
  (P : ℂ) / (Nat.factorial (m.1 - 1) : ℂ)

/-- Negative modes of the first field go left; its nonnegative modes go right. -/
def normalOrderedPairModeTerm {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (n i : ℤ) : Module.End ℂ (FockSpace D C) :=
  if i < 0 then
    (HVertexOperator.coeff current (-i - 1)).comp
      (HVertexOperator.coeff charge (-(n - 1 - i) - 1))
  else
    (HVertexOperator.coeff charge (-(n - 1 - i) - 1)).comp
      (HVertexOperator.coeff current (-i - 1))

theorem normalOrderedPairModeTerm_support {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D)
    (current charge : HVertexOperator ℤ ℂ (FockSpace D C) (FockSpace D C))
    (n : ℤ) (v : FockSpace D C) :
    ∃ N : ℕ, ∀ i : ℤ, (i < -(N : ℤ) ∨ (N : ℤ) < i) →
      normalOrderedPairModeTerm D C current charge n i v = 0 := by
  sorry

/-- Finite multiplicity data for the coefficient of
`exp(Σ α(-n)z^n/n)` at degree `q`. Only modes `1,…,q` can occur, and every
multiplicity is at most `q`. -/
def EminusPartitionIndex (q : ℕ) :=
  {k : Fin q → Fin (q + 1) // ∑ i : Fin q, (i.val + 1) * (k i).val = q}

noncomputable instance instFintypeEminusPartitionIndex (q : ℕ) :
    Fintype (EminusPartitionIndex q) := by
  classical
  unfold EminusPartitionIndex
  infer_instance

/-- Symmetric-algebra monomial for one finite exponential partition. -/
def EminusPartitionMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) (q : ℕ)
    (k : EminusPartitionIndex q) : SymmetricAlgebra ℂ (OscillatorGenerators V D) :=
  ∏ i : Fin q,
    (SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
      (oscillatorGenerator D ⟨i.val + 1, Nat.succ_pos i.val⟩
        ((1 : ℂ) ⊗ₜ[ℚ] (a : V)))) ^ (k.1 i).val

/-- Explicit finite coefficient of the negative-mode exponential. -/
noncomputable def EminusCoefficient {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier) (q : ℕ) :
    SymmetricAlgebra ℂ (OscillatorGenerators V D) := by
  classical
  exact ∑ k : EminusPartitionIndex q,
    (∏ i : Fin q,
      ((((i.val + 1 : ℕ) : ℂ) ^ (k.1 i).val) *
        (Nat.factorial (k.1 i).val : ℂ))⁻¹) •
      EminusPartitionMonomial D a q k

/-- Sum of mode labels at selected positions in an oscillator word. -/
def chargeWordModeSum {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (J : Finset (Fin word.length)) : ℤ :=
  ∑ i ∈ J, ((word[i]).1.1 : ℤ)

/-- Product of contractions at the selected word positions. -/
def chargeWordContraction {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (a : D.lattice.carrier)
    (word : List (ℕ+ × ComplexAmbient V D)) (J : Finset (Fin word.length)) : ℂ :=
  ∏ i ∈ J, -complexLatticeForm D ((1 : ℂ) ⊗ₜ[ℚ] (a : V)) (word[i]).2

/-- Product of the oscillator factors left uncontracted. -/
def chargeWordUncontracted {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (J : Finset (Fin word.length)) : SymmetricAlgebra ℂ (OscillatorGenerators V D) :=
  ∏ i : Fin word.length,
    if i ∈ J then 1 else
      SymmetricAlgebra.ι ℂ (OscillatorGenerators V D)
        (oscillatorGenerator D (word[i]).1 (word[i]).2)

/-- Finite normal-ordered charge-field coefficient on a Fock monomial. The
subset chooses oscillator contractions, and the remaining exponential degree
is a finite partition sum. -/
noncomputable def chargeModeMonomialFormula {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (word : List (ℕ+ × ComplexAmbient V D))
    (a b : D.lattice.carrier) (r : ℤ) : FockSpace D C := by
  classical
  exact Finset.univ.powerset.sum fun J =>
    let q : ℤ := -r - 1 - D.lattice.integralForm a b +
      chargeWordModeSum D word J
    if hq : 0 ≤ q then
      ((((C.epsilon a b : ℤ) : ℂ) * chargeWordContraction D a word J) •
        ((chargeWordUncontracted D word J *
          EminusCoefficient D a q.toNat) ⊗ₜ[ℂ] Finsupp.single (a + b) 1))
    else 0

/-- Charge-on-charge coefficient, defined by the empty-word exponential
formula rather than by aliasing the same admitted field coefficient. -/
def chargeFieldCoefficient {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (a b : D.lattice.carrier) (r : ℤ) : FockSpace D C :=
  chargeModeMonomialFormula D C [] a b r

/-- The oscillator degree plus even lattice energy is the actual monomial
weight. -/
def latticeFockMonomialWeight {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) : ℕ :=
  word.foldr (fun p n => p.1.1 + n) 0 +
    Int.toNat (D.lattice.integralNorm a / 2)

/-- The homogeneous submodule is the span of exactly the Fock monomials with
the displayed oscillator-plus-lattice energy. -/
def latticeWeightSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D)
    (r : ℕ) : Submodule ℂ (FockSpace D C) :=
  Submodule.span ℂ {x | ∃ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier),
      x = latticeFockMonomial D C word a ∧
      latticeFockMonomialWeight D word a = r}

theorem latticeWeightSpace_contains_monomial {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) :
    latticeFockMonomial D C word a ∈
      latticeWeightSpace D C (latticeFockMonomialWeight D word a) := by
  apply Submodule.subset_span
  exact ⟨word, a, rfl, rfl⟩

theorem latticeWeightSpace_zero {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    latticeWeightSpace D C 0 = ℂ ∙ vacuumState D C := by
  sorry

theorem latticeWeightSpace_finiteDimensional {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (r : ℕ) :
    Module.Finite ℂ (latticeWeightSpace D C r) := by
  sorry

/-- Native internality is about these actual monomial-span submodules. -/
theorem latticeWeightSpace_isInternal {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    DirectSum.IsInternal (latticeWeightSpace D C) := by
  sorry

noncomputable def latticeGradedDecomposition {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    FockSpace D C ≃ₗ[ℂ] (⨁ n : ℕ, latticeWeightSpace D C n) :=
  (LinearEquiv.ofBijective (DirectSum.coeLinearMap (latticeWeightSpace D C))
    (latticeWeightSpace_isInternal D C)).symm

@[simp] theorem latticeGradedDecomposition_symm_of {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (n : ℕ) (x : latticeWeightSpace D C n) :
    (latticeGradedDecomposition D C).symm (DirectSum.of _ n x) =
      (x : FockSpace D C) := by
  change DirectSum.coeLinearMap (latticeWeightSpace D C) (DirectSum.of _ n x) = _
  simp

@[simp] theorem latticeGradedDecomposition_apply_mem {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) {n : ℕ} {x : FockSpace D C}
    (hx : x ∈ latticeWeightSpace D C n) :
    latticeGradedDecomposition D C x = DirectSum.of _ n ⟨x, hx⟩ := by
  let e := LinearEquiv.ofBijective (DirectSum.coeLinearMap (latticeWeightSpace D C))
    (latticeWeightSpace_isInternal D C)
  apply e.injective
  change e (e.symm x) = e (DirectSum.of _ n ⟨x, hx⟩)
  rw [LinearEquiv.apply_symm_apply]
  change x = DirectSum.coeLinearMap (latticeWeightSpace D C) (DirectSum.of _ n ⟨x, hx⟩)
  simp

theorem latticeGradedDecomposition_symm_eq_inclusion {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) :
    (latticeGradedDecomposition D C).symm.toLinearMap =
      DirectSum.coeLinearMap (latticeWeightSpace D C) := rfl

theorem latticeGradedDecomposition_fockMonomial {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V)
    (C : NormalizedSignCocycle D) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) :
    latticeGradedDecomposition D C (latticeFockMonomial D C word a) =
      DirectSum.of _ (latticeFockMonomialWeight D word a)
        ⟨latticeFockMonomial D C word a,
          latticeWeightSpace_contains_monomial D C word a⟩ :=
  latticeGradedDecomposition_apply_mem D C (latticeWeightSpace_contains_monomial D C word a)

theorem latticeWeightSpace_spans {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    iSup (latticeWeightSpace D C) = ⊤ :=
  DirectSum.IsInternal.submodule_iSup_eq_top (latticeWeightSpace_isInternal D C)

theorem latticeWeightSpace_independent {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    iSupIndep (latticeWeightSpace D C) :=
  DirectSum.IsInternal.submodule_iSupIndep (latticeWeightSpace_isInternal D C)

/-- Weight one is the actual degree-one homogeneous component. -/
def latticeWeightOne {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Submodule ℂ (FockSpace D C) := latticeWeightSpace D C 1

theorem latticeWeightOne_decomposition {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (C : NormalizedSignCocycle D) :
    Nonempty (latticeWeightOne D C ≃ₗ[ℂ]
      ComplexAmbient V D ×
        ({a : D.lattice.carrier // D.lattice.integralNorm a = 2} → ℂ)) := by
  sorry

/-- A change of normalized cocycle by a specified cochain gives the actual
basis-rescaling equivalence; the cochain equation is retained as data. -/
structure CocycleChange {V : Type u} [AddCommGroup V] [Module ℚ V]
    {D : PositiveEvenLattice V} (C C' : NormalizedSignCocycle D) where
  cochain : D.lattice.carrier → ℤˣ
  cochain_zero : cochain 0 = 1
  comparison : ∀ a b,
    C'.epsilon a b = C.epsilon a b *
      cochain (a + b) * (cochain a)⁻¹ * (cochain b)⁻¹

/-- Isometries act only after a chosen compatible lift of cocycle data. -/
structure LiftedLatticeIsometry {V W : Type u} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E) where
  linear : V ≃ₗ[ℚ] W
  mapsCarrier : ∀ x, x ∈ D.lattice.carrier → linear x ∈ E.lattice.carrier
  inverseMapsCarrier : ∀ y, y ∈ E.lattice.carrier → linear.symm y ∈ D.lattice.carrier
  preservesForm : ∀ x y, D.lattice.form x y = E.lattice.form (linear x) (linear y)
  chargeMap : D.lattice.carrier → E.lattice.carrier
  chargeMap_agrees : ∀ x hx, chargeMap x = ⟨linear x, mapsCarrier x hx⟩
  liftFactor : D.lattice.carrier → ℤˣ
  liftFactor_zero : liftFactor 0 = 1
  cocycle_lift : ∀ x y,
    C'.epsilon (chargeMap x) (chargeMap y) =
      C.epsilon x y * liftFactor (x + y) *
        (liftFactor x)⁻¹ * (liftFactor y)⁻¹

/-- All product carriers and cocycle data for an orthogonal sum are explicit. -/
structure OrthogonalSumData {V W : Type u} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup W] [Module ℚ W]
    (D : PositiveEvenLattice V) (E : PositiveEvenLattice W)
    (C : NormalizedSignCocycle D) (C' : NormalizedSignCocycle E) where
  sumLattice : PositiveEvenLattice (V × W)
  sumCocycle : NormalizedSignCocycle sumLattice
  carrierEquiv : sumLattice.lattice.carrier ≃ₗ[ℤ]
    D.lattice.carrier × E.lattice.carrier
  carrierEquiv_val : ∀ x : sumLattice.lattice.carrier,
    (((carrierEquiv x).1 : V), ((carrierEquiv x).2 : W)) = (x : V × W)
  form_split : ∀ x y : V × W,
    sumLattice.lattice.form x y =
      D.lattice.form x.1 y.1 + E.lattice.form x.2 y.2
  cocycle_split : ∀ x y : sumLattice.lattice.carrier,
    sumCocycle.epsilon x y =
      C.epsilon (carrierEquiv x).1 (carrierEquiv y).1 *
        C'.epsilon (carrierEquiv x).2 (carrierEquiv y).2

/-- The product cocycle gives the canonical oscillator and charge-algebra maps. -/
theorem fock_orthogonal_directSum {V W : Type u}
    [AddCommGroup V] [Module ℚ V] [AddCommGroup W] [Module ℚ W]
    {D : PositiveEvenLattice V} {E : PositiveEvenLattice W}
    {C : NormalizedSignCocycle D} {C' : NormalizedSignCocycle E}
    (S : OrthogonalSumData D E C C') :
    Nonempty (FockSpace S.sumLattice S.sumCocycle ≃ₗ[ℂ]
      FockSpace D C ⊗[ℂ] FockSpace E C') := by
  sorry

end LatticeVOA

end TauCetiRoadmap.AffineLieAlgebras
