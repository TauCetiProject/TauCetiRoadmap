module

import Mathlib
import TauCeti.CategoryTheory.AlmostSplit.Sequence
import TauCeti.Algebra.Module.Injective.Envelope.Basic

/-!
# Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras: suggested forms

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file records the target signatures of the roadmap's headlines that can be stated
against the pinned Mathlib and Tau Ceti; it is the acceptance test for those headlines, and
discharging it finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned
roadmap library -- these are goals, not proofs.

Layers as in `README.md`: 0 Krull-Schmidt categories; 1 finitely presented functors; 2 Matlis
duality over a commutative Artinian ring; 3 `Ext¹` and almost-split conflations in exact
categories; 4 Auslander-Reiten theory of Artin algebras; 5 the valued Auslander-Reiten quiver;
6 finiteness theorems; 7 Morita theory, global and dominant dimension, and the correspondences.

## The acceptance-test contract

The headlines of the README and their Lean forms here:

* Krull-Schmidt categories (Layer 0): `IsKrullSchmidt`, with
  `indecomposable_iff_isLocalRing_end`, `isIdempotentComplete_of_isKrullSchmidt`, the
  uniqueness theorem `exists_equiv_iso_of_iso_biproduct` and the recognition theorem
  `isKrullSchmidt_of_module_finite`.
* The Freyd-Auslander criterion (Layer 1): `IsFinitelyPresentedFunctor` and
  `hasWeakKernels_iff_isFinitelyPresentedFunctor_kernel`.
* Matlis duality (Layer 2): `exists_isInjectiveEnvelope_quotient_jacobson` and
  `bijective_applyₗ_of_isInjectiveEnvelope`.
* Existence of almost-split sequences for Artin algebras (Layer 4): `exists_isAlmostSplit`.
* The Harada-Sai lemma and the first Brauer-Thrall conjecture (Layer 6): `chainComp`,
  `chainComp_eq_zero_of_length_le` and `finite_skeleton_of_length_le`.
* Global dimension of an arbitrary ring (Layer 7): `leftGlobalDimension` and Auslander's theorems
  `leftGlobalDimension_eq_iSup_cyclic`, `leftGlobalDimension_eq_iSup_finite`,
  `leftGlobalDimension_mulOpposite` and `leftGlobalDimension_eq_projectiveDimension_quotient`. On a
  commutative ring `leftGlobalDimension` is the same supremum as the global dimension owned by
  PurityOfBranchLocus §0.3.
* The Morita-Tachikawa correspondence (Layer 7), on the predicates `IsGeneratorCogenerator` and
  `HasProjectiveInjectiveCopresentation`: the forward direction
  `hasProjectiveInjectiveCopresentation_end`, the converse
  `exists_algEquiv_end_of_hasProjectiveInjectiveCopresentation`, and injectivity on marked pairs
  `exists_linear_equivalence_of_algEquiv_end`. All isomorphisms of endomorphism rings are
  `R`-algebra isomorphisms, for the scoped `ModuleCat.Algebra` instances.
* The Auslander correspondence (Layer 7), on `IsAdditiveGenerator`: the forward direction
  `hasProjectiveDimensionLE_two`, and the converse `exists_isAdditiveGenerator_algEquiv_end`.

The following headlines need carriers that are themselves targets of the README and do not exist at
the pins, so the README specifies them in prose and they are not stated here: the `Ext¹` of an
exact category, and with it Auslander-Reiten duality and the existence theorem for almost-split
conflations in exact categories (Layer 3); the category `mod C` as an abelian category (Layer 1);
the translate of an Artin algebra and its Auslander-Reiten formulas (Layer 4); the valued
Auslander-Reiten quiver with its mesh and multiplicities (Layer 5), and hence Auslander's theorem on
components of bounded length (Layer 6); the criterion that an Artin algebra is
representation-finite exactly when the infinite radical `⋂ₙ radⁿ` of `mod A` vanishes (Layer 6),
which needs the radical as a morphism ideal with its powers; and dominant dimension as a number
(Layer 7), of which only the bound `≥ 2` is stated here, as `HasProjectiveInjectiveCopresentation`.
-/

namespace TauCetiRoadmap.RepresentationTheory.ArtinAlgebras

open CategoryTheory CategoryTheory.Limits

open scoped ModuleCat.Algebra

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
Artinian ring is Krull-Schmidt. The category is arbitrary, not a category of modules. -/
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
of all left modules. The right global dimension is `leftGlobalDimension Aᵐᵒᵖ`. The zero ring has
global dimension `⊥`, since a zero object has projective dimension `⊥`. -/
noncomputable def leftGlobalDimension (A : Type u) [Ring A] : WithBot ℕ∞ :=
  ⨆ X : ModuleCat.{u} A, projectiveDimension X

/-- **Auslander**: the left global dimension is the supremum of the projective dimensions of the
cyclic modules `A ⧸ I`. -/
theorem leftGlobalDimension_eq_iSup_cyclic (A : Type u) [Ring A] :
    leftGlobalDimension A = ⨆ I : Submodule A A, projectiveDimension (ModuleCat.of A (A ⧸ I)) :=
  sorry

/-- **Auslander**: the left global dimension is the supremum of the projective dimensions of the
finitely generated modules; it lies between the cyclic supremum and the full one. -/
theorem leftGlobalDimension_eq_iSup_finite (A : Type u) [Ring A] :
    leftGlobalDimension A =
      ⨆ (X : ModuleCat.{u} A) (_ : Module.Finite A X), projectiveDimension X :=
  sorry

/-- **Auslander**: over a ring that is left and right Noetherian, the left and right global
dimensions agree. -/
theorem leftGlobalDimension_mulOpposite (A : Type u) [Ring A] [IsNoetherianRing A]
    [IsNoetherianRing Aᵐᵒᵖ] : leftGlobalDimension Aᵐᵒᵖ = leftGlobalDimension A :=
  sorry

/-- **Auslander**: over a semiprimary ring, in particular an Artin algebra, the left global
dimension is the projective dimension of `A ⧸ J(A)`. For the zero ring both sides are `⊥`. -/
theorem leftGlobalDimension_eq_projectiveDimension_quotient (A : Type u) [Ring A]
    [IsSemiprimaryRing A] :
    leftGlobalDimension A = projectiveDimension (ModuleCat.of A (A ⧸ Ring.jacobson A)) :=
  sorry

end GlobalDimension

section Correspondences

variable (R : Type u) [CommRing R] [IsArtinianRing R]

/-- `M` is a **generator-cogenerator** of `mod A`: every finitely generated indecomposable
projective module and every finitely generated indecomposable injective module is a direct
summand of `M`. -/
def IsGeneratorCogenerator {A : Type u} [Ring A] (M : ModuleCat.{u} A) : Prop :=
  (∀ P : ModuleCat.{u} A, Module.Finite A P → Projective P → Indecomposable P →
    Nonempty (Retract P M)) ∧
  ∀ I : ModuleCat.{u} A, Module.Finite A I → Injective I → Indecomposable I →
    Nonempty (Retract I M)

/-- `M` is an **additive generator** of `mod A`: every finitely generated indecomposable module is
a direct summand of `M`. -/
def IsAdditiveGenerator {A : Type u} [Ring A] (M : ModuleCat.{u} A) : Prop :=
  ∀ X : ModuleCat.{u} A, Module.Finite A X → Indecomposable X → Nonempty (Retract X M)

/-- `dom.dim Γ ≥ 2`, in the explicit form: the regular module has an injective copresentation
`0 → Γ → I⁰ → I¹` by finitely generated projective-injective modules. -/
def HasProjectiveInjectiveCopresentation (Γ : Type u) [Ring Γ] : Prop :=
  ∃ (I₀ I₁ : ModuleCat.{u} Γ) (f : ModuleCat.of Γ Γ ⟶ I₀) (g : I₀ ⟶ I₁) (hfg : f ≫ g = 0),
    Mono f ∧ (ShortComplex.mk f g hfg).Exact ∧ Module.Finite Γ I₀ ∧ Module.Finite Γ I₁ ∧
      Projective I₀ ∧ Injective I₀ ∧ Projective I₁ ∧ Injective I₁

/-- **Morita-Tachikawa, forward**: for a generator-cogenerator `M` of `mod A`, the endomorphism
ring `Γ = Module.End A M` has dominant dimension at least two. -/
theorem hasProjectiveInjectiveCopresentation_end {A : Type u} [Ring A] [Algebra R A]
    [Module.Finite R A] (M : ModuleCat.{u} A) [Module.Finite A M]
    (hM : IsGeneratorCogenerator M) :
    HasProjectiveInjectiveCopresentation (Module.End A M) :=
  sorry

/-- **Morita-Tachikawa, converse**: an Artin algebra `Γ` of dominant dimension at least two is the
endomorphism ring of a generator-cogenerator `M` over an Artin algebra `B`. One choice is
`B = Module.End Γ Q`, for `Q` the sum of the indecomposable projective-injective `Γ`-modules, and
`M = Q`. -/
theorem exists_algEquiv_end_of_hasProjectiveInjectiveCopresentation (Γ : Type u) [Ring Γ]
    [Algebra R Γ] [Module.Finite R Γ] (hΓ : HasProjectiveInjectiveCopresentation Γ) :
    ∃ (B : Type u) (_ : Ring B) (_ : Algebra R B) (_ : Module.Finite R B) (M : ModuleCat.{u} B),
      Module.Finite B M ∧ IsGeneratorCogenerator M ∧ Nonempty (Γ ≃ₐ[R] Module.End B M) :=
  sorry

/-- **Morita-Tachikawa, injectivity on marked pairs**: if two generator-cogenerators have
`R`-algebra isomorphic endomorphism rings, an `R`-linear equivalence of the module categories
carries one to the other. A ring isomorphism does not suffice: for `R = k × k` acting on `k` through
the two projections, the endomorphism rings are both `k`, but no `R`-linear equivalence exists.
With the converse `exists_algEquiv_end_of_hasProjectiveInjectiveCopresentation`, this makes
`(A, M) ↦ Module.End A M` a bijection from pairs up to `R`-linear equivalences carrying `M` to `M'`
onto `R`-algebra isomorphism classes of Artin algebras of dominant dimension at least two. -/
theorem exists_linear_equivalence_of_algEquiv_end {A A' : Type u} [Ring A] [Algebra R A]
    [Module.Finite R A] [Ring A'] [Algebra R A'] [Module.Finite R A'] (M : ModuleCat.{u} A)
    (M' : ModuleCat.{u} A') [Module.Finite A M] [Module.Finite A' M']
    (hM : IsGeneratorCogenerator M) (hM' : IsGeneratorCogenerator M')
    (e : Module.End A M ≃ₐ[R] Module.End A' M') :
    ∃ F : ModuleCat.{u} A ≌ ModuleCat.{u} A', F.functor.Linear R ∧
      Nonempty (F.functor.obj M ≅ M') :=
  sorry

/-- **The Auslander correspondence, global dimension**: for an additive generator `M` of `mod A`,
every finitely generated module over `Γ = Module.End A M` has projective dimension at most two. -/
theorem hasProjectiveDimensionLE_two {A : Type u} [Ring A] [Algebra R A] [Module.Finite R A]
    (M : ModuleCat.{u} A) [Module.Finite A M] (hM : IsAdditiveGenerator M)
    (X : ModuleCat.{u} (Module.End A M)) [Module.Finite (Module.End A M) X] :
    HasProjectiveDimensionLE X 2 :=
  sorry

/-- **The Auslander correspondence, converse**: an Artin algebra `Γ` with `gl.dim Γ ≤ 2` and
dominant dimension at least two is the endomorphism ring of an additive generator of `mod B` for an
Artin algebra `B`, which is then representation-finite. Dominant dimension alone does not suffice:
`k[ε]/(ε²)` has infinite dominant dimension and infinite global dimension. -/
theorem exists_isAdditiveGenerator_algEquiv_end (Γ : Type u) [Ring Γ] [Algebra R Γ]
    [Module.Finite R Γ] (hgl : leftGlobalDimension Γ ≤ 2)
    (hΓ : HasProjectiveInjectiveCopresentation Γ) :
    ∃ (B : Type u) (_ : Ring B) (_ : Algebra R B) (_ : Module.Finite R B) (M : ModuleCat.{u} B),
      Module.Finite B M ∧ IsAdditiveGenerator M ∧ Nonempty (Γ ≃ₐ[R] Module.End B M) :=
  sorry

end Correspondences

end TauCetiRoadmap.RepresentationTheory.ArtinAlgebras
