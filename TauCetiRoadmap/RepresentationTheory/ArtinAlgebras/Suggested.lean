module

import Mathlib
import TauCeti.CategoryTheory.AlmostSplit.Sequence
import TauCeti.CategoryTheory.IrreducibleMorphism
import TauCeti.Algebra.Module.Injective.Envelope.Basic
import TauCeti.Algebra.Category.ModuleCat.RepresentationFinite
import TauCeti.Algebra.Category.FGModuleCat.RepresentationFinite
import TauCeti.RingTheory.GlobalDimension

/-!
# Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras: target signatures

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
  `isKrullSchmidt_of_module_finite`; additive generators `IsAdditiveGenerator` (`add G = C`),
  with `isAdditiveGenerator_iff_forall_indecomposable` in a Krull-Schmidt category.
* The Freyd-Auslander criterion (Layer 1): `IsFinitelyPresentedFunctor` and
  `hasWeakKernels_iff_isFinitelyPresentedFunctor_kernel`.
* Matlis duality (Layer 2): `exists_isInjectiveEnvelope_quotient_jacobson` and
  `bijective_applyₗ_of_isInjectiveEnvelope`.
* Existence of almost-split sequences for Artin algebras (Layer 4): `exists_isAlmostSplit`, and
  its dual `exists_isAlmostSplit_of_not_injective`.
* The Harada-Sai lemma, Auslander's theorem, the first Brauer-Thrall conjecture and the infinite
  radical (Layer 6): `chainComp`, `chainComp_eq_zero_of_length_le`,
  `forall_mem_and_isRepresentationFinite_of_length_le`, `isRepresentationFinite_of_length_le` and
  `isRepresentationFinite_iff_forall_mem_jacobsonRadicalIdeal_pow`, on Tau Ceti's
  `TauCeti.IsRepresentationFinite`, `TauCeti.jacobsonRadicalIdeal` and
  `TauCeti.IsIrreducibleMorphism`.
* Auslander's theorems on Tau Ceti's global dimension `TauCeti.globalDimension` of an arbitrary
  ring (Layer 7): `globalDimension_mulOpposite` and
  `globalDimension_eq_projectiveDimension_quotient`.
* Dominant dimension (Layer 7): `HasProjectiveInjectiveCoresolution`, the number
  `dominantDimension` in `ℕ∞`, and the left-right symmetry `dominantDimension_mulOpposite`.
* The Morita-Tachikawa correspondence (Layer 7), on the predicate `IsGeneratorCogenerator` (a
  separator and coseparator of `mod A = FGModuleCat A`, with `isSeparator_iff_exists_retract` and
  `isGeneratorCogenerator_iff_forall_indecomposable`) and on `dominantDimension`: the forward
  direction `two_le_dominantDimension_end`, the converse
  `exists_algEquiv_end_of_two_le_dominantDimension`, and injectivity on marked pairs
  `exists_linear_equivalence_of_algEquiv_end`. All isomorphisms of endomorphism rings are
  `R`-algebra isomorphisms, for the scoped `ModuleCat.Algebra` instances.
* The Auslander correspondence (Layer 7), on `IsAdditiveGenerator` of Layer 0 in
  `mod A = FGModuleCat A` and on Auslander algebras `IsAuslanderAlgebra`
  (`gl.dim Γ ≤ 2 ≤ dom.dim Γ`): the forward direction `isAuslanderAlgebra_end`, the converse
  `exists_isAdditiveGenerator_algEquiv_end`, compatibility with Morita equivalence
  `isMoritaEquivalent_end_iff`, and the bijection of Morita classes
  `exists_equiv_quotient_moritaSetoid`, on the setoid `moritaSetoid`.

The following headlines need carriers that are themselves targets of the README and do not exist at
the pins, so the README specifies them in prose and they are not stated here: the `Ext¹` of an
exact category, and with it Auslander-Reiten duality and the existence theorem for almost-split
conflations in exact categories (Layer 3); the category `mod C` as an abelian category (Layer 1);
the translate of an Artin algebra and its Auslander-Reiten formulas (Layer 4); and the valued
Auslander-Reiten quiver with its mesh and multiplicities (Layer 5).
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

/-- `G` is an **additive generator** of `C`: every object is a direct summand of a finite
biproduct of copies of `G`, that is, `add G = C`. -/
def IsAdditiveGenerator (G : C) : Prop :=
  ∀ X : C, ∃ n : ℕ, Nonempty (Retract X (⨁ fun _ : Fin n ↦ G))

/-- In a Krull-Schmidt category, `G` is an additive generator exactly when every indecomposable
object is a direct summand of `G`. -/
theorem isAdditiveGenerator_iff_forall_indecomposable [IsKrullSchmidt C] (G : C) :
    IsAdditiveGenerator G ↔ ∀ X : C, Indecomposable X → Nonempty (Retract X G) :=
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

/-! ## Layer 4: Auslander-Reiten theory of Artin algebras -/

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

include R in
/-- **The Auslander-Reiten theorem, dual form**: every indecomposable non-injective object of
`mod A` starts an almost-split sequence in `mod A`. -/
theorem exists_isAlmostSplit_of_not_injective (M : FGModuleCat.{u} A) (hM : Indecomposable M.obj)
    (hI : ¬ Injective M) :
    ∃ S : ShortComplex (FGModuleCat.{u} A), S.IsAlmostSplit ∧ Nonempty (S.X₁ ≅ M) :=
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
theorem isRepresentationFinite_of_length_le (b : ℕ)
    (h : ∀ X : FGModuleCat.{u} A, Indecomposable X.obj → Module.length A X.obj ≤ b) :
    TauCeti.IsRepresentationFinite.{u} A :=
  sorry

include R in
/-- **The infinite radical**: an Artin algebra is representation-finite exactly when the
intersection `rad^∞` of the powers of the radical of `mod A` vanishes. -/
theorem isRepresentationFinite_iff_forall_mem_jacobsonRadicalIdeal_pow :
    TauCeti.IsRepresentationFinite.{u} A ↔
      ∀ (X Y : FGModuleCat.{u} A) (f : X ⟶ Y),
        (∀ n : ℕ, f ∈ (TauCeti.jacobsonRadicalIdeal (FGModuleCat.{u} A) ^ n).hom X Y) → f = 0 :=
  sorry

include R in
/-- **Auslander's theorem**: over a connected Artin algebra, a nonempty class of finitely
generated indecomposable modules that is closed under isomorphism and under irreducible maps in
both directions, and whose lengths are bounded, contains every indecomposable module, and the
algebra is representation-finite. -/
theorem forall_mem_and_isRepresentationFinite_of_length_le
    (hA : ∀ e : A, IsIdempotentElem e → (∀ a : A, e * a = a * e) → e = 0 ∨ e = 1)
    (S : FGModuleCat.{u} A → Prop) (hS : ∀ X, S X → Indecomposable X.obj)
    (hiso : ∀ {X Y : FGModuleCat.{u} A}, Nonempty (X ≅ Y) → S X → S Y)
    (hirr : ∀ {X Y : FGModuleCat.{u} A} (f : X ⟶ Y), TauCeti.IsIrreducibleMorphism f →
      Indecomposable X.obj → Indecomposable Y.obj → (S X ↔ S Y))
    (hne : ∃ X, S X) (b : ℕ) (hb : ∀ X, S X → Module.length A X.obj ≤ b) :
    (∀ X : FGModuleCat.{u} A, Indecomposable X.obj → S X) ∧
      TauCeti.IsRepresentationFinite.{u} A :=
  sorry

end Finiteness

/-! ## Layer 7: Morita theory, global and dominant dimension, and the correspondences -/

section GlobalDimension

/-- **Auslander**: over a ring that is left and right Noetherian, the left and right global
dimensions agree; the right global dimension is `TauCeti.globalDimension Aᵐᵒᵖ`. -/
theorem globalDimension_mulOpposite (A : Type u) [Ring A] [IsNoetherianRing A]
    [IsNoetherianRing Aᵐᵒᵖ] : TauCeti.globalDimension.{u} Aᵐᵒᵖ = TauCeti.globalDimension.{u} A :=
  sorry

/-- **Auslander**: over a semiprimary ring, in particular an Artin algebra, the left global
dimension is the projective dimension of `A ⧸ J(A)`. For the zero ring both sides are `⊥`. -/
theorem globalDimension_eq_projectiveDimension_quotient (A : Type u) [Ring A]
    [IsSemiprimaryRing A] :
    TauCeti.globalDimension.{u} A = projectiveDimension (ModuleCat.of A (A ⧸ Ring.jacobson A)) :=
  sorry

end GlobalDimension

section Correspondences

variable (R : Type u) [CommRing R] [IsArtinianRing R]

attribute [local instance] HasFiniteBiproducts.of_hasFiniteCoproducts

/-- `M` is a **generator-cogenerator** of `mod A`: a separator and a coseparator of
`FGModuleCat A`. -/
def IsGeneratorCogenerator {A : Type u} [Ring A] (M : FGModuleCat.{u} A) : Prop :=
  IsSeparator M ∧ IsCoseparator M

/-- Over any ring, `M` is a separator of `mod A` exactly when the regular module is a direct
summand of a finite biproduct of copies of `M`, that is, `A ∈ add M`. -/
theorem isSeparator_iff_exists_retract {A : Type u} [Ring A] (M : FGModuleCat.{u} A) :
    IsSeparator M ↔ ∃ n : ℕ, Nonempty (Retract (FGModuleCat.of A A) (⨁ fun _ : Fin n ↦ M)) :=
  sorry

/-- Over an Artin algebra, `M` is a generator-cogenerator of `mod A` exactly when every
indecomposable projective and every indecomposable injective object of `mod A` is a direct summand
of `M`. -/
theorem isGeneratorCogenerator_iff_forall_indecomposable {A : Type u} [Ring A] [Algebra R A]
    [Module.Finite R A] (M : FGModuleCat.{u} A) :
    IsGeneratorCogenerator M ↔
      (∀ P : FGModuleCat.{u} A, Projective P → Indecomposable P.obj → Nonempty (Retract P M)) ∧
        ∀ I : FGModuleCat.{u} A, Injective I → Indecomposable I.obj → Nonempty (Retract I M) :=
  sorry

/-- `Γ` has a **projective-injective coresolution with `n` terms**: an exact sequence
`0 → Γ → I⁰ → ⋯ → Iⁿ⁻¹` of left `Γ`-modules whose terms `Iⁱ` are finitely generated, projective
and injective. In `S`, the object `S.obj 0` is zero, `S.obj 1` is the regular module and
`S.obj (i + 2)` is `Iⁱ`; exactness at `S.obj 1` says that `Γ → I⁰` is a monomorphism. For `n = 0`
the sequence is `0 → Γ`, and the condition always holds. -/
def HasProjectiveInjectiveCoresolution (Γ : Type u) [Ring Γ] (n : ℕ) : Prop :=
  ∃ S : ComposableArrows (ModuleCat.{u} Γ) (n + 1), S.Exact ∧ IsZero (S.obj 0) ∧
    Nonempty (S.obj 1 ≅ ModuleCat.of Γ Γ) ∧
      ∀ i : Fin n, Module.Finite Γ (S.obj i.succ.succ) ∧ Projective (S.obj i.succ.succ) ∧
        Injective (S.obj i.succ.succ)

/-- The **dominant dimension** `dom.dim Γ` of a ring, of left modules: the supremum in `ℕ∞` of the
`n` for which `Γ` has a projective-injective coresolution with `n` terms. It is `⊤` for a left
self-injective ring, through `0 → Γ → Γ → 0 → 0 → ⋯`.

This is the dominant dimension only for Artin algebras. For other rings the established notion asks
the terms of the minimal injective coresolution to be flat (Hoshino), and the two differ already for
`ℤ`: here `dominantDimension ℤ = 0`, while the flat version gives `1`. Following Xi, the flat
version is the *flat-dominant dimension*. -/
noncomputable def dominantDimension (Γ : Type u) [Ring Γ] : ℕ∞ :=
  ⨆ (n : ℕ) (_ : HasProjectiveInjectiveCoresolution Γ n), (n : ℕ∞)

/-- **Tachikawa**: for an Artin algebra the left and right dominant dimensions agree; the right
dominant dimension is `dominantDimension Γᵐᵒᵖ`. -/
theorem dominantDimension_mulOpposite (Γ : Type u) [Ring Γ] [Algebra R Γ] [Module.Finite R Γ] :
    dominantDimension Γᵐᵒᵖ = dominantDimension Γ :=
  sorry

/-- **Morita-Tachikawa, forward**: for a generator-cogenerator `M` of `mod A`, the endomorphism
ring `Γ = Module.End A M` has dominant dimension at least two. -/
theorem two_le_dominantDimension_end {A : Type u} [Ring A] [Algebra R A] [Module.Finite R A]
    (M : FGModuleCat.{u} A) (hM : IsGeneratorCogenerator M) :
    2 ≤ dominantDimension (Module.End A M.obj) :=
  sorry

/-- **Morita-Tachikawa, converse**: an Artin algebra `Γ` of dominant dimension at least two is the
endomorphism ring of a generator-cogenerator `M` over an Artin algebra `B`. One choice is
`B = Module.End Γ Q`, for `Q` the sum of the indecomposable projective-injective `Γ`-modules, and
`M = Q`. -/
theorem exists_algEquiv_end_of_two_le_dominantDimension (Γ : Type u) [Ring Γ]
    [Algebra R Γ] [Module.Finite R Γ] (hΓ : 2 ≤ dominantDimension Γ) :
    ∃ (B : Type u) (_ : Ring B) (_ : Algebra R B) (_ : Module.Finite R B) (M : FGModuleCat.{u} B),
      IsGeneratorCogenerator M ∧ Nonempty (Γ ≃ₐ[R] Module.End B M.obj) :=
  sorry

/-- **Morita-Tachikawa, injectivity on marked pairs**: if two generator-cogenerators have
`R`-algebra isomorphic endomorphism rings, an `R`-linear equivalence of the categories `mod A` and
`mod A'` carries one to the other. A ring isomorphism does not suffice: for `R = k × k` acting on
`k` through the two projections, the endomorphism rings are both `k`, but no `R`-linear equivalence
exists. With the converse `exists_algEquiv_end_of_two_le_dominantDimension`, this makes
`(A, M) ↦ Module.End A M` a bijection from pairs up to `R`-linear equivalences carrying `M` to `M'`
onto `R`-algebra isomorphism classes of Artin algebras of dominant dimension at least two. -/
theorem exists_linear_equivalence_of_algEquiv_end {A A' : Type u} [Ring A] [Algebra R A]
    [Module.Finite R A] [Ring A'] [Algebra R A'] [Module.Finite R A'] (M : FGModuleCat.{u} A)
    (M' : FGModuleCat.{u} A') (hM : IsGeneratorCogenerator M) (hM' : IsGeneratorCogenerator M')
    (e : Module.End A M.obj ≃ₐ[R] Module.End A' M'.obj) :
    ∃ F : FGModuleCat.{u} A ≌ FGModuleCat.{u} A', F.functor.Linear R ∧
      Nonempty (F.functor.obj M ≅ M') :=
  sorry

/-- An **Auslander algebra**: a ring with `gl.dim Γ ≤ 2 ≤ dom.dim Γ`. Like `dominantDimension`, it
is stated for any ring but is the notion of the literature only for Artin algebras. -/
def IsAuslanderAlgebra (Γ : Type u) [Ring Γ] : Prop :=
  TauCeti.globalDimension.{u} Γ ≤ 2 ∧ 2 ≤ dominantDimension Γ

/-- **The Auslander correspondence, forward**: for an additive generator `M` of `mod A`, the
endomorphism ring `Module.End A M` is an Auslander algebra. -/
theorem isAuslanderAlgebra_end {A : Type u} [Ring A] [Algebra R A] [Module.Finite R A]
    (M : FGModuleCat.{u} A) (hM : IsAdditiveGenerator M) :
    IsAuslanderAlgebra (Module.End A M.obj) :=
  sorry

/-- **The Auslander correspondence, converse**: an Auslander algebra `Γ` that is an Artin algebra is
the endomorphism ring of an additive generator of `mod B` for an Artin algebra `B`, which is then
representation-finite. Dominant dimension alone does not suffice: `k[ε]/(ε²)` has infinite dominant
dimension and infinite global dimension. -/
theorem exists_isAdditiveGenerator_algEquiv_end (Γ : Type u) [Ring Γ] [Algebra R Γ]
    [Module.Finite R Γ] (hΓ : IsAuslanderAlgebra Γ) :
    ∃ (B : Type u) (_ : Ring B) (_ : Algebra R B) (_ : Module.Finite R B) (M : FGModuleCat.{u} B),
      IsAdditiveGenerator M ∧ Nonempty (Γ ≃ₐ[R] Module.End B M.obj) :=
  sorry

/-- **The Auslander correspondence on Morita classes**: for additive generators `M` of `mod A` and
`M'` of `mod A'`, the endomorphism rings are Morita equivalent exactly when `A` and `A'` are. The
direction `←` makes `A ↦ Module.End A M` well defined on Morita classes, also for two additive
generators of the same `mod A`; the direction `→` makes it injective. -/
theorem isMoritaEquivalent_end_iff {A A' : Type u} [Ring A] [Algebra R A] [Module.Finite R A]
    [Ring A'] [Algebra R A'] [Module.Finite R A'] (M : FGModuleCat.{u} A)
    (M' : FGModuleCat.{u} A') (hM : IsAdditiveGenerator M) (hM' : IsAdditiveGenerator M') :
    IsMoritaEquivalent R (Module.End A M.obj) (Module.End A' M'.obj) ↔
      IsMoritaEquivalent R A A' :=
  sorry

/-- Morita equivalence over `R`, as a setoid on the `R`-algebras in `Type u` satisfying `P`. -/
def moritaSetoid (P : AlgCat.{u} R → Prop) : Setoid {A : AlgCat.{u} R // P A} where
  r A B := IsMoritaEquivalent R A.1 B.1
  iseqv := ⟨fun A ↦ .refl R A.1, .symm R, .trans R⟩

/-- **The Auslander correspondence, as a bijection**: `A ↦ Module.End A M`, for an additive
generator `M` of `mod A`, induces a bijection from the Morita classes of representation-finite
Artin `R`-algebras onto the Morita classes of Auslander algebras that are Artin `R`-algebras. Every
representation-finite Artin algebra has an additive generator, so the condition on `e` determines
it. -/
theorem exists_equiv_quotient_moritaSetoid :
    ∃ e : Quotient (moritaSetoid R fun A ↦ Module.Finite R A ∧ TauCeti.IsRepresentationFinite.{u} A)
        ≃ Quotient (moritaSetoid R fun Γ ↦ Module.Finite R Γ ∧ IsAuslanderAlgebra Γ),
      ∀ A Γ (M : FGModuleCat.{u} A.1), IsAdditiveGenerator M →
        Nonempty (Γ.1 ≃ₐ[R] Module.End A.1 M.obj) → e (Quotient.mk _ A) = Quotient.mk _ Γ :=
  sorry

end Correspondences

end TauCetiRoadmap.RepresentationTheory.ArtinAlgebras
