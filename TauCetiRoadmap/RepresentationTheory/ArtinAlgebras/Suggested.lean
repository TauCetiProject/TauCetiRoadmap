import Mathlib
import TauCeti.CategoryTheory.AlmostSplit.Sequence
import TauCeti.Algebra.Module.Injective.Envelope.Basic

/-!
# Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Layers as in `README.md`: 0 Krull-Schmidt categories; 1 finitely presented functors; 2 Matlis
duality over a commutative Artinian ring; 3 `Ext¹` and almost-split conflations in exact
categories; 4 Auslander-Reiten theory of Artin algebras; 5 the valued Auslander-Reiten quiver;
6 finiteness theorems; 7 Morita theory, global and dominant dimension, and the correspondences.
-/

namespace TauCetiRoadmap.RepresentationTheory.ArtinAlgebras

open CategoryTheory CategoryTheory.Limits

universe w v u

/-! ## Layer 0: Krull-Schmidt categories -/

section KrullSchmidt

variable (C : Type u) [Category.{v} C] [Preadditive C] [HasFiniteBiproducts C]

/-- **A Krull-Schmidt category**: every object is isomorphic to a finite biproduct of objects
with local endomorphism rings. -/
class IsKrullSchmidt : Prop where
  exists_iso_biproduct (X : C) :
    ∃ (n : ℕ) (P : Fin n → C), (∀ i, IsLocalRing (End (P i))) ∧ Nonempty (X ≅ ⨁ P)

attribute [local instance] hasBinaryBiproducts_of_finite_biproducts

variable {C}

/-- In a Krull-Schmidt category, an object is indecomposable exactly when its endomorphism
ring is local. -/
theorem indecomposable_iff_isLocalRing_end [IsKrullSchmidt C] (X : C) :
    Indecomposable X ↔ IsLocalRing (End X) :=
  sorry

/-- A Krull-Schmidt category is idempotent complete. -/
theorem isIdempotentComplete_of_isKrullSchmidt [IsKrullSchmidt C] : IsIdempotentComplete C :=
  sorry

/-- **Uniqueness of the Krull-Schmidt decomposition**: two decompositions of the same object
into objects with local endomorphism rings match up to a bijection of the summands. -/
theorem exists_equiv_iso_of_iso_biproduct {ι κ : Type*} [Finite ι] [Finite κ] (X : ι → C)
    (Y : κ → C) (hX : ∀ i, IsLocalRing (End (X i))) (hY : ∀ j, IsLocalRing (End (Y j)))
    (e : ⨁ X ≅ ⨁ Y) : ∃ σ : ι ≃ κ, ∀ i, Nonempty (X i ≅ Y (σ i)) :=
  sorry

/-- **Recognition**: an idempotent-complete category that is Hom-finite over a commutative
Artinian ring is Krull-Schmidt. -/
theorem isKrullSchmidt_of_module_finite (R : Type w) [CommRing R] [IsArtinianRing R]
    [Linear R C] [IsIdempotentComplete C] [∀ X : C, Module.Finite R (X ⟶ X)] :
    IsKrullSchmidt C :=
  sorry

end KrullSchmidt

/-! ## Layer 1: finitely presented functors -/

section FinitelyPresented

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasFiniteBiproducts C]

/-- **A finitely presented functor** on `C`: an additive functor `Cᵒᵖ ⥤ AddCommGrpCat` that is the
cokernel of a morphism between representable functors. -/
def IsFinitelyPresentedFunctor (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) : Prop :=
  ∃ (X Y : C) (f : X ⟶ Y) (p : preadditiveYoneda.obj Y ⟶ F)
    (h : preadditiveYoneda.map f ≫ p = 0), Epi p ∧ (ShortComplex.mk _ _ h).Exact

/-- **The Freyd-Auslander criterion**: `C` has weak kernels exactly when the finitely presented
functors are closed under kernels in the functor category, so that `mod C` is abelian. -/
theorem hasWeakKernels_iff_isFinitelyPresentedFunctor_kernel :
    HasWeakKernels C ↔ ∀ {F G : Cᵒᵖ ⥤ AddCommGrpCat.{v}} (φ : F ⟶ G),
      IsFinitelyPresentedFunctor F → IsFinitelyPresentedFunctor G →
        IsFinitelyPresentedFunctor (kernel φ) :=
  sorry

end FinitelyPresented

/-! ## Layer 2: Matlis duality over a commutative Artinian ring -/

section Matlis

variable (R : Type u) [CommRing R] [IsArtinianRing R]

/-- **The injective cogenerator `E_R`**: `R ⧸ J(R)` has an injective hull of finite length. -/
theorem exists_isInjectiveEnvelope_quotient_jacobson :
    ∃ (E : Type u) (_ : AddCommGroup E) (_ : Module R E)
      (f : (R ⧸ Ring.jacobson R) →ₗ[R] E), TauCeti.IsInjectiveEnvelope f ∧ IsFiniteLength R E :=
  sorry

/-- **Matlis duality**: for an injective hull `E` of `R ⧸ J(R)`, every module of finite length
is reflexive for `D_R = Hom_R(-, E)`. -/
theorem bijective_applyₗ_of_isInjectiveEnvelope {E : Type u} [AddCommGroup E] [Module R E]
    {f : (R ⧸ Ring.jacobson R) →ₗ[R] E} (hf : TauCeti.IsInjectiveEnvelope f)
    (M : Type u) [AddCommGroup M] [Module R M] (hM : IsFiniteLength R M) :
    Function.Bijective (LinearMap.applyₗ : M →ₗ[R] (M →ₗ[R] E) →ₗ[R] E) :=
  sorry

end Matlis

/-! ## Layer 4: almost-split sequences for Artin algebras -/

section ArtinAlgebra

variable (R : Type u) [CommRing R] [IsArtinianRing R] (A : Type u) [Ring A] [Algebra R A]
  [Module.Finite R A]

include R in
/-- **The Auslander-Reiten theorem for Artin algebras**: every indecomposable non-projective
object of `mod A` ends an almost-split sequence in `mod A`. -/
theorem exists_isAlmostSplit (M : FGModuleCat.{u} A) (hM : Indecomposable M.obj)
    (hP : ¬ Projective M) :
    ∃ S : ShortComplex (FGModuleCat.{u} A), S.IsAlmostSplit ∧ Nonempty (S.X₃ ≅ M) :=
  sorry

end ArtinAlgebra

/-! ## Layer 6: finiteness theorems -/

section Finiteness

/-- The composite `M 0 ⟶ M n` of a chain of morphisms `f i : M i ⟶ M (i + 1)`. -/
def chainComp {C : Type u} [Category.{v} C] (M : ℕ → C) (f : ∀ i, M i ⟶ M (i + 1)) :
    ∀ n, M 0 ⟶ M n
  | 0 => 𝟙 _
  | n + 1 => chainComp M f n ≫ f n

/-- **The Harada-Sai lemma**: a composite of `2 ^ b - 1` non-isomorphisms between indecomposable
modules of length at most `b` vanishes. -/
theorem chainComp_eq_zero_of_length_le (A : Type u) [Ring A] (b : ℕ) (M : ℕ → ModuleCat.{u} A)
    (hM : ∀ i, Indecomposable (M i)) (hlen : ∀ i, Module.length A (M i) ≤ b)
    (f : ∀ i, M i ⟶ M (i + 1)) (hf : ∀ i, ¬ IsIso (f i)) {n : ℕ} (hn : 2 ^ b - 1 ≤ n) :
    chainComp M f n = 0 :=
  sorry

variable (R : Type u) [CommRing R] [IsArtinianRing R] (A : Type u) [Ring A] [Algebra R A]
  [Module.Finite R A]

include R in
/-- **The first Brauer-Thrall conjecture** (Roiter's theorem): if the finitely generated
indecomposable modules over an Artin algebra have bounded length, there are only finitely many
of them up to isomorphism. -/
theorem finite_skeleton_of_length_le (b : ℕ)
    (h : ∀ M : ModuleCat.{u} A, Module.Finite A M → Indecomposable M → Module.length A M ≤ b) :
    Finite (Skeleton (ObjectProperty.FullSubcategory
      fun M : ModuleCat.{u} A ↦ Module.Finite A M ∧ Indecomposable M)) :=
  sorry

end Finiteness

/-! ## Layer 7: Morita theory, global and dominant dimension, and the correspondences -/

section GlobalDimension

/-- **The left global dimension** of an arbitrary ring: the supremum of the projective dimensions
of all left modules. The right global dimension is `leftGlobalDimension Aᵐᵒᵖ`. -/
noncomputable def leftGlobalDimension (A : Type u) [Ring A] : WithBot ℕ∞ :=
  ⨆ X : ModuleCat.{u} A, projectiveDimension X

/-- **Auslander**: over a ring that is left and right Noetherian, the left and right global
dimensions agree. -/
theorem leftGlobalDimension_mulOpposite (A : Type u) [Ring A] [IsNoetherianRing A]
    [IsNoetherianRing Aᵐᵒᵖ] : leftGlobalDimension Aᵐᵒᵖ = leftGlobalDimension A :=
  sorry

end GlobalDimension

section Auslander

variable (R : Type u) [CommRing R] [IsArtinianRing R] (A : Type u) [Ring A] [Algebra R A]
  [Module.Finite R A]

include R in
/-- **Morita-Tachikawa, dominant dimension**: for a generator-cogenerator `M` of `mod A`, the
regular module of `Γ = Module.End A M` has an injective copresentation `0 → Γ → I⁰ → I¹` by
finitely generated projective-injective modules, that is, `dom.dim Γ ≥ 2`. -/
theorem exists_projective_injective_copresentation (M : ModuleCat.{u} A) [Module.Finite A M]
    (hproj : ∀ P : ModuleCat.{u} A, Module.Finite A P → Projective P → Indecomposable P →
      ∃ (i : P ⟶ M) (q : M ⟶ P), i ≫ q = 𝟙 P)
    (hinj : ∀ I : ModuleCat.{u} A, Module.Finite A I → Injective I → Indecomposable I →
      ∃ (i : I ⟶ M) (q : M ⟶ I), i ≫ q = 𝟙 I) :
    ∃ (I₀ I₁ : ModuleCat.{u} (Module.End A M)) (f : ModuleCat.of _ (Module.End A M) ⟶ I₀)
      (g : I₀ ⟶ I₁) (hfg : f ≫ g = 0),
      Mono f ∧ (ShortComplex.mk f g hfg).Exact ∧ Module.Finite (Module.End A M) I₀ ∧
        Module.Finite (Module.End A M) I₁ ∧ Projective I₀ ∧ Injective I₀ ∧ Projective I₁ ∧
          Injective I₁ :=
  sorry

include R in
/-- **The Auslander correspondence, global dimension**: for an additive generator `M` of `mod A`,
every finitely generated module over `Γ = Module.End A M` has projective dimension at most two. -/
theorem hasProjectiveDimensionLE_two (M : ModuleCat.{u} A) [Module.Finite A M]
    (hM : ∀ X : ModuleCat.{u} A, Module.Finite A X → Indecomposable X →
      ∃ (i : X ⟶ M) (q : M ⟶ X), i ≫ q = 𝟙 X)
    (X : ModuleCat.{u} (Module.End A M)) [Module.Finite (Module.End A M) X] :
    HasProjectiveDimensionLE X 2 :=
  sorry

end Auslander

end TauCetiRoadmap.RepresentationTheory.ArtinAlgebras
