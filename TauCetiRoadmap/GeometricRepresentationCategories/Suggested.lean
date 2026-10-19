import Mathlib.Topology.Algebra.Algebra.Equiv
import TauCeti.Algebra.Lie.Derivation.Basic
import Mathlib.Algebra.Lie.Ideal
import Mathlib.Algebra.Lie.Quotient
import Mathlib.Algebra.Lie.Classical
import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Algebra
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Algebra.Homology.DerivedCategory.Ext.ExtClass
import Mathlib.Basic.Complex.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Monoidal.Action.End
import Mathlib.CategoryTheory.Monoidal.Discrete
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Products.Basic
import Mathlib.CategoryTheory.Bicategory.Functor.LocallyDiscrete
import Mathlib.CategoryTheory.Bicategory.NaturalTransformation.Pseudo
import Mathlib.CategoryTheory.Linear.LinearFunctor

/-!
These signatures are suggested interfaces, not an exhaustive checklist.
The README is definitive. Concrete affine module and oper suppliers have their
own owners; the generic interfaces below consume actual native categories.
No theorem asserts the conjectural existence of a categorical lift.
-/

noncomputable section

open CategoryTheory
open CategoryTheory.MonoidalCategory

attribute [local instance] endofunctorMonoidalCategory

universe u v w u' v' u''

namespace TauCetiRoadmap.GeometricRepresentationCategories

section CategoricalActions

variable (H : Type u) [Group H] (C : Type w) [Category.{v} C]

/-- Consume the native left-action carrier. -/
abbrev CategoricalLeftAction := MonoidalLeftAction (Discrete H) C

variable [CategoricalLeftAction H C]

/-- The monoidal opposite is forced by the native endofunctor tensor order. -/
def curriedLeftAction : Discrete H ⥤ (C ⥤ C)ᴹᵒᵖ :=
  MonoidalLeftAction.curriedActionMop (Discrete H) C

instance : (curriedLeftAction H C).Monoidal :=
  MonoidalLeftAction.curriedActionMopMonoidal (Discrete H) C

end CategoricalActions

section CoherentLift

variable (Γ : Type u) [Category.{v} Γ] (H : Type u') [Group H]

set_option linter.checkUnivs false in
/-- Families allow independent object and morphism universes in Cat. -/
abbrev GroupActionFamily (Γ : Type u) (H : Type u') [Group H] :=
  Γ → Pseudofunctor (LocallyDiscrete (SingleObj H)) Cat.{v', u''}

def fiberInclusion (p : Γ) : SingleObj H ⥤ Γ × SingleObj H :=
  Prod.sectR p (SingleObj H)

/-- Restrict a joint pseudofunctor to the representation-side group at p. -/
def restrictToFiber
    (F : Pseudofunctor (LocallyDiscrete (Γ × SingleObj H)) Cat.{v', u''})
    (p : Γ) : Pseudofunctor (LocallyDiscrete (SingleObj H)) Cat.{v', u''} :=
  (fiberInclusion Γ H p).toPseudofunctor.comp F

/-- Full coherent lift data. The comparison is an actual strong transformation
and the condition is equivalence of its actual component functors. -/
structure EquivariantGroupoidLift (actions : GroupActionFamily Γ H) where
  joint : Pseudofunctor (LocallyDiscrete (Γ × SingleObj H)) Cat.{v', u''}
  comparison (p : Γ) :
    Pseudofunctor.StrongTrans (restrictToFiber Γ H joint p) (actions p)
  comparison_equivalence (p : Γ) (b : LocallyDiscrete (SingleObj H)) :
    (((comparison p).app b).toFunctor).IsEquivalence

abbrev fiberCategory (actions : GroupActionFamily Γ H) (p : Γ) : Cat.{v', u''} :=
  (actions p).obj (.mk (SingleObj.star H))

/-- Transport expressed on the prescribed fiber categories. -/
noncomputable def transportFunctor (actions : GroupActionFamily Γ H)
    (L : EquivariantGroupoidLift Γ H actions) {p q : Γ} (g : p ⟶ q) :
    fiberCategory Γ H actions p ⥤ fiberCategory Γ H actions q := by
  let b : LocallyDiscrete (SingleObj H) := .mk (SingleObj.star H)
  let e := ((L.comparison p).app b).toFunctor
  letI : e.IsEquivalence := L.comparison_equivalence p b
  exact e.asEquivalence.inverse ⋙
    (L.joint.map (Prod.mkHom g (𝟙 (SingleObj.star H))).toLoc).toFunctor ⋙
      ((L.comparison q).app b).toFunctor

variable (actions : GroupActionFamily Γ H)
  [∀ p, Preadditive (fiberCategory Γ H actions p)]
  [∀ p, Linear ℂ (fiberCategory Γ H actions p)]

/-- The strict-character conjecture uses linear transport on its native fibers. -/
structure LinearEquivariantGroupoidLift extends EquivariantGroupoidLift Γ H actions where
  transport_linear {p q : Γ} (g : p ⟶ q) :
    (transportFunctor Γ H actions toEquivariantGroupoidLift g).Linear ℂ

/-- The type of complex-linear equivariant lifts of the prescribed action family. -/
abbrev CategoricalLiftQuestion := LinearEquivariantGroupoidLift Γ H actions

end CoherentLift

section ObjectwiseInvariance

variable (H : Type u) [Group H] (C : Type w) [Category.{v} C]

/-- Source objectwise congruence invariance, separate from rational integration. -/
def ObjectwiseCongruenceInvariant [MonoidalLeftAction (Discrete H) C]
    (K : ℕ+ → Subgroup H) (_hK : Antitone K) : Prop :=
  ∀ M : C, ∃ N : ℕ+, ∀ h ∈ K N,
    Nonempty (M ≅ (MonoidalLeftAction.actionLeft C (Discrete.mk h)).obj M)

end ObjectwiseInvariance

section InfinitesimalExtensions

variable (A : Type u) [Ring A] [Algebra ℂ A] [TopologicalSpace A]


attribute [local instance 100] LieRing.ofAssociativeRing
attribute [local instance 100] LieAlgebra.ofAssociativeAlgebra

/-- Associative derivations use Tau Ceti's native noncommutative carrier. -/
def continuousDerivations [IsTopologicalRing A] [ContinuousConstSMul ℂ A] :
    LieSubalgebra ℂ (TauCeti.derivationLieAlgebra ℂ A) where
  carrier := {D | Continuous (D : A → A)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
  lie_mem' := by sorry

variable [IsTopologicalRing A] [ContinuousConstSMul ℂ A]

/-- Inner derivations land in the continuous subalgebra. -/
def continuousInnerDerivation : A →ₗ⁅ℂ⁆ continuousDerivations A where
  toFun b := ⟨TauCeti.innerDerivation ℂ b, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
  map_lie' := by sorry

/-- Quotient by the actual inner image, without a closure substitution. -/
def innerDerivationIdeal : LieIdeal ℂ (continuousDerivations A) :=
  { (continuousInnerDerivation A).toLinearMap.range with
    lie_mem := by sorry }

abbrev ContinuousOuterDerivations :=
  (continuousDerivations A) ⧸ (innerDerivationIdeal A)

/-- A distinct carrier for the triangular action. -/
def DerivationExtensionCarrier (M : ModuleCat.{v} A) := M × M

instance (M : ModuleCat.{v} A) : AddCommGroup (DerivationExtensionCarrier A M) :=
  inferInstanceAs (AddCommGroup (M × M))

/-- The triangular action on the separate extension carrier. -/
@[instance_reducible]
def derivationExtensionModule (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : Module A (DerivationExtensionCarrier A M) where
  smul a m := (a • m.1 + (δ : A → A) a • m.2, a • m.2)
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry
  add_smul := by sorry
  zero_smul := by sorry

/-- Middle term of the ambient self-extension. -/
def derivationExtension (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : ModuleCat.{v} A := by
  letI := derivationExtensionModule A δ M
  exact ModuleCat.of A (DerivationExtensionCarrier A M)

def derivationExtensionInclusion (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : M →ₗ[A] derivationExtension A δ M where
  toFun u := (u, 0)
  map_add' := by sorry
  map_smul' := by sorry

def derivationExtensionProjection (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : derivationExtension A δ M →ₗ[A] M where
  toFun m := m.2
  map_add' := by sorry
  map_smul' := by sorry

def derivationExtensionSequence (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : ShortComplex (ModuleCat.{v} A) where
  X₁ := M
  X₂ := derivationExtension A δ M
  X₃ := M
  f := ConcreteCategory.ofHom (C := ModuleCat A) (X := M)
    (Y := derivationExtension A δ M) (derivationExtensionInclusion A δ M)
  g := ConcreteCategory.ofHom (C := ModuleCat A) (X := derivationExtension A δ M)
    (Y := M) (derivationExtensionProjection A δ M)
  zero := by sorry

theorem derivationExtension_shortExact (δ : TauCeti.derivationLieAlgebra ℂ A)
    (M : ModuleCat.{v} A) : (derivationExtensionSequence A δ M).ShortExact := by sorry

/-- The middle module satisfies A5's actual discrete continuity predicate. -/
theorem derivationExtension_continuous (δ : continuousDerivations A)
    (M : ModuleCat.{v} A)
    (hM : ∀ m : M,
      letI : TopologicalSpace M := ⊥
      Continuous (fun a : A => a • m)) :
    ∀ m : derivationExtension A δ.val M,
      letI : TopologicalSpace (derivationExtension A δ.val M) := ⊥
      Continuous (fun a : A => a • m) := by sorry

/-- A5's actual continuous full subcategory, in the injective-compatible universe. -/
abbrev SmoothCompletedCategory :=
  (show ObjectProperty (ModuleCat.{max u v} A) from fun M =>
    ∀ m : M,
      letI : TopologicalSpace M := ⊥
      Continuous (fun a : A => a • m)).FullSubcategory

/-- The proved-continuous middle term is bundled in the smooth category. -/
def smoothDerivationExtension (δ : continuousDerivations A)
    (M : SmoothCompletedCategory.{u, v} A) : SmoothCompletedCategory.{u, v} A :=
  ⟨derivationExtension A δ.val M.obj, derivationExtension_continuous A δ M.obj M.property⟩

variable [Abelian (SmoothCompletedCategory.{u, v} A)]

-- Use the zero morphisms carried by the supplied Abelian structure, as extClass does.
attribute [local instance 2000] CategoryTheory.Abelian.toPreadditive
attribute [local instance 2000] CategoryTheory.Preadditive.preadditiveHasZeroMorphisms

def smoothDerivationExtensionSequence (δ : continuousDerivations A)
    (M : SmoothCompletedCategory.{u, v} A) : ShortComplex (SmoothCompletedCategory.{u, v} A) where
  X₁ := M
  X₂ := smoothDerivationExtension A δ M
  X₃ := M
  f := ObjectProperty.homMk (derivationExtensionSequence A δ.val M.obj).f
  g := ObjectProperty.homMk (derivationExtensionSequence A δ.val M.obj).g
  zero := by sorry

theorem smoothDerivationExtension_shortExact (δ : continuousDerivations A)
    (M : SmoothCompletedCategory.{u, v} A) :
    (smoothDerivationExtensionSequence A δ M).ShortExact := by sorry

/-- Native Ext class of the actual smooth-category sequence; A5 supplies these instances. -/
def smoothDerivationExtensionClass
    [HasExt.{max u v} (SmoothCompletedCategory.{u, v} A)]
    (δ : continuousDerivations A) (M : SmoothCompletedCategory.{u, v} A) :
    CategoryTheory.Abelian.Ext.{max u v} M M 1 :=
  ShortComplex.ShortExact.extClass
    (C := SmoothCompletedCategory.{u, v} A)
    (S := smoothDerivationExtensionSequence A δ M)
    (smoothDerivationExtension_shortExact A δ M)

end InfinitesimalExtensions


end TauCetiRoadmap.GeometricRepresentationCategories
