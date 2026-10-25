import Mathlib

/-!
# Homotopy theory of small categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository:
these are targets, not implementations.

Classes of functors are `MorphismProperty Cat.{u, u}`, and a functor `F : A ⥤ B` between small
categories enters such a class as `F.toCatHom`. The minimal localizer `Winfty` is defined
intrinsically as an intersection; its identification with the Thomason equivalences (functors
whose nerve is a simplicial weak equivalence) is Layer 3 of the README and is not prototyped
here, because the simplicial weak equivalences are supplied by the GeneralizedCohomology roadmap.
-/

namespace TauCetiRoadmap.HomotopyTheoryOfCategories

open CategoryTheory CategoryTheory.Limits HomotopicalAlgebra Opposite MonoidalCategory

noncomputable section

universe w v₁ u₁ v u

/-! ## Layer 0: the 1-truncated layer -/

section OneTruncated

variable {A B : Type u} [SmallCategory A] [SmallCategory B]

/-- The fundamental groupoid `Π₁ A` of a category: its localization at all morphisms. -/
abbrev PiOne (A : Type u) [Category.{v} A] : Type u :=
  (⊤ : MorphismProperty A).Localization

theorem isGroupoid_piOne (A : Type u) [Category.{v} A] : IsGroupoid (PiOne A) := sorry

theorem top_isInvertedBy (F : A ⥤ B) :
    (⊤ : MorphismProperty A).IsInvertedBy (F ⋙ (⊤ : MorphismProperty B).Q) := sorry

/-- The functor `Π₁ F : Π₁ A ⥤ Π₁ B`. -/
def piOneMap (F : A ⥤ B) : PiOne A ⥤ PiOne B :=
  Localization.Construction.lift _ (top_isInvertedBy F)

/-- `W₀`: functors inducing a bijection on connected components. -/
def W₀ : MorphismProperty Cat.{u, u} :=
  fun _ _ F => Function.Bijective F.toFunctor.mapConnectedComponents

/-- `W₁`: functors inducing an equivalence of fundamental groupoids. -/
def W₁ : MorphismProperty Cat.{u, u} :=
  fun _ _ F => (piOneMap F.toFunctor).IsEquivalence

/-- `W₋₁`: functors `F : A ⥤ B` with `A` nonempty iff `B` is. -/
def WNeg₁ : MorphismProperty Cat.{u, u} :=
  fun X Y _ => (Nonempty X ↔ Nonempty Y)

/-- A fibration of groupoids: a star-surjective functor (Brown–Heath–Kamps 1983, §2). -/
def IsGroupoidFibration {E D : Type u} [Groupoid.{v} E] [Groupoid.{v} D] (p : E ⥤ D) : Prop :=
  ∀ (x : E) (d : D) (g : p.obj x ⟶ d),
    ∃ (y : E) (f : x ⟶ y) (h : p.obj y = d), p.map f = g ≫ eqToHom h.symm

end OneTruncated

/-! ## Layer 1: basic localizers -/

section Localizer

/-- `A` is `W`-aspherical when `A ⥤ e` lies in `W`. -/
def IsAspherical (W : MorphismProperty Cat.{u, u}) (A : Type u) [SmallCategory A] : Prop :=
  W (Functor.star A : A ⥤ Discrete PUnit.{u + 1}).toCatHom

/-- `F` is `W`-aspherical when every slice `A/b` is `W`-aspherical. -/
def IsAsphericalFunctor (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ b : B, IsAspherical W (CostructuredArrow F b)

/-- A basic localizer (Cisinski 2004, 1.1.1 and Definition 1.1.3). -/
structure IsBasicLocalizer (W : MorphismProperty Cat.{u, u}) : Prop where
  containsIdentities : W.ContainsIdentities
  twoOutOfThree : W.HasTwoOutOfThreeProperty
  /-- FS3. -/
  retract : ∀ {X Y : Cat.{u, u}} (i : X ⟶ Y) (r : Y ⟶ X), i ≫ r = 𝟙 X → W (r ≫ i) → W r
  /-- LF2. -/
  aspherical_of_hasTerminal : ∀ (A : Type u) [SmallCategory A] [HasTerminal A],
    IsAspherical W A
  /-- LF3, the relative Theorem A. -/
  of_slices : ∀ {A B C : Type u} [SmallCategory A] [SmallCategory B] [SmallCategory C]
    (F : A ⥤ B) (G : B ⥤ C), (∀ c : C, W (CostructuredArrow.pre F G c).toCatHom) →
      W F.toCatHom

/-- The minimal basic localizer, as the intersection of all of them. -/
def Winfty : MorphismProperty Cat.{u, u} :=
  fun _ _ F => ∀ W : MorphismProperty Cat.{u, u}, IsBasicLocalizer W → W F

theorem isBasicLocalizer_Winfty : IsBasicLocalizer Winfty.{u} := sorry

theorem Winfty_le {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W) : Winfty ≤ W :=
  sorry

theorem isBasicLocalizer_W₀ : IsBasicLocalizer W₀.{u} := sorry

theorem isBasicLocalizer_W₁ : IsBasicLocalizer W₁.{u} := sorry

theorem isBasicLocalizer_WNeg₁ : IsBasicLocalizer WNeg₁.{u} := sorry

theorem W₁_le_W₀ : W₁.{u} ≤ W₀ := sorry

/-- Quillen's Theorem A for an arbitrary basic localizer. -/
theorem mem_of_isAsphericalFunctor {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B)
    (hF : IsAsphericalFunctor W F) : W F.toCatHom := sorry

/-- Functors with a left or right adjoint are in every basic localizer
(Cisinski 2004, Corollary 1.1.10). -/
theorem mem_of_isRightAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsRightAdjoint] :
    W F.toCatHom := sorry

theorem mem_of_isLeftAdjoint {W : MorphismProperty Cat.{u, u}} (hW : IsBasicLocalizer W)
    {A B : Type u} [SmallCategory A] [SmallCategory B] (F : A ⥤ B) [F.IsLeftAdjoint] :
    W F.toCatHom := sorry

/-- `W`-locally constant functors (Cisinski 2004, 2.3.1). -/
def IsLocallyConstant (W : MorphismProperty Cat.{u, u}) {A B : Type u} [SmallCategory A]
    [SmallCategory B] (F : A ⥤ B) : Prop :=
  ∀ ⦃b b' : B⦄ (g : b ⟶ b'), W (CostructuredArrow.map (S := F) g).toCatHom

end Localizer

/-! ## Layer 2: presheaves -/

section Presheaf

variable (A : Type u) [SmallCategory A]

/-- `i_A X = A/X`. -/
abbrev iA (X : Aᵒᵖ ⥤ Type u) : Type u := CostructuredArrow yoneda X

/-- `i_A` as a functor to `Cat`. -/
def iAFunctor : (Aᵒᵖ ⥤ Type u) ⥤ Cat.{u, u} := sorry

/-- `i_A^* C = (a ↦ (A/a ⥤ C))`. -/
def iAStarFunctor : Cat.{u, u} ⥤ (Aᵒᵖ ⥤ Type u) := sorry

def iAAdjunction : iAFunctor A ⊣ iAStarFunctor A := sorry

/-- The weak equivalences `W_Â = i_A⁻¹ W` of presheaves. -/
abbrev presheafWeq (W : MorphismProperty Cat.{u, u}) : MorphismProperty (Aᵒᵖ ⥤ Type u) :=
  W.inverseImage (iAFunctor A)

theorem presheafWeq_isInvertedBy (W : MorphismProperty Cat.{u, u}) :
    (presheafWeq A W).IsInvertedBy (iAFunctor A ⋙ W.Q) := sorry

/-- The functor `Â[W_Â⁻¹] ⥤ Cat[W⁻¹]` induced by `i_A`. -/
def iALocalized (W : MorphismProperty Cat.{u, u}) :
    (presheafWeq A W).Localization ⥤ W.Localization :=
  Localization.Construction.lift _ (presheafWeq_isInvertedBy A W)

/-- A weak test category (Maltsiniotis 2009, 2.3). Since `i_A ⊣ i_A^*`, asking that `i_A^*`
reflect and preserve weak equivalences and that the functor induced by `i_A` be an equivalence
makes the two induced functors quasi-inverse. -/
structure IsWeakTestCategory (W : MorphismProperty Cat.{u, u}) : Prop where
  iAStar_mem_iff : ∀ ⦃C D : Cat.{u, u}⦄ (F : C ⟶ D),
    W F ↔ presheafWeq A W ((iAStarFunctor A).map F)
  isEquivalence : (iALocalized A W).IsEquivalence

/-- A local test category: every `A/a` is a weak test category. -/
def IsLocalTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  ∀ a : A, IsWeakTestCategory (Over a) W

def IsTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsWeakTestCategory A W ∧ IsLocalTestCategory A W

/-- A strict test category: a test category whose localization functor preserves binary
products. -/
def IsStrictTestCategory (W : MorphismProperty Cat.{u, u}) : Prop :=
  IsTestCategory A W ∧
    ∀ X Y : Aᵒᵖ ⥤ Type u, PreservesLimit (pair X Y) (presheafWeq A W).Q

/-- `Δ` is a strict test category (Maltsiniotis 2005, Proposition 1.6.13). -/
theorem isStrictTestCategory_simplexCategory :
    IsStrictTestCategory (AsSmall.{u} SimplexCategory) Winfty.{u} := sorry

end Presheaf

/-! ## Layer 6: derivators -/

section Derivator

-- The type necessarily lives in `Type (max (w+1) (v₁+1) (u₁+1))`.
set_option linter.checkUnivs false in
/-- A prederivator: a pseudofunctor from `Catᵒᵖ` (1-cells reversed) to `Cat`. -/
abbrev Prederivator := Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁}

variable (D : Pseudofunctor (Cat.{w, w})ᵒᵖ Cat.{v₁, u₁})

/-- The value `D(J)`. -/
abbrev value (J : Type w) [SmallCategory J] : Cat.{v₁, u₁} := D.obj (op (Cat.of J))

/-- Restriction `F^* : D(K) ⥤ D(J)` along `F : J ⥤ K`. -/
abbrev restrict {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K) :
    value D K ⟶ value D J :=
  D.map F.toCatHom.op

/-- Der2: isomorphisms are detected pointwise (Groth 2013, Definition 1.10). -/
def SatisfiesDer2 : Prop :=
  ∀ (J : Type w) [SmallCategory J] {X Y : value D J} (f : X ⟶ Y),
    (∀ j : J, IsIso ((restrict D (Functor.fromPUnit j : Discrete PUnit.{w + 1} ⥤ J)).toFunctor.map f)) → IsIso f

/-- Der3: every restriction has both adjoints (Groth 2013, Definition 1.10). -/
def SatisfiesDer3 : Prop :=
  ∀ {J K : Type w} [SmallCategory J] [SmallCategory K] (F : J ⥤ K),
    (restrict D F).toFunctor.IsLeftAdjoint ∧ (restrict D F).toFunctor.IsRightAdjoint

end Derivator

/-! ## Layer 7: cofibration categories -/

section CofibrationCategory

variable (C : Type u) [Category.{v} C] [CategoryWithCofibrations C]
  [CategoryWithWeakEquivalences C] [HasInitial C]

/-- Baues' axioms C1–C3 (Baues 1989, Chapter I, (1.1)). -/
class IsCofibrationCategory : Prop where
  iso_cofibration : ∀ {X Y : C} (e : X ≅ Y), cofibrations C e.hom
  iso_weakEquivalence : ∀ {X Y : C} (e : X ≅ Y), weakEquivalences C e.hom
  twoOutOfThree : (weakEquivalences C).HasTwoOutOfThreeProperty
  comp_cofibration : ∀ {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z),
    cofibrations C f → cofibrations C g → cofibrations C (f ≫ g)
  hasPushout : ∀ {X Y Z : C} (i : X ⟶ Y) (f : X ⟶ Z), cofibrations C i → HasPushout i f
  cofibration_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → cofibrations C i'
  weakEquivalence_cobaseChange : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C i →
      weakEquivalences C i'
  weakEquivalence_parallel : ∀ {X Y Z P : C} {i : X ⟶ Y} {f : X ⟶ Z} {f' : Y ⟶ P}
    {i' : Z ⟶ P}, IsPushout i f f' i' → cofibrations C i → weakEquivalences C f →
      weakEquivalences C f'
  factorization : ∀ {X Y : C} (f : X ⟶ Y),
    ∃ (Z : C) (i : X ⟶ Z) (p : Z ⟶ Y), cofibrations C i ∧ weakEquivalences C p ∧ i ≫ p = f

/-- Brown's factorization lemma between cofibrant objects. -/
theorem brown_factorization [IsCofibrationCategory C] {X Y : C}
    (hX : cofibrations C (initial.to X)) (hY : cofibrations C (initial.to Y)) (f : X ⟶ Y) :
    ∃ (Z : C) (i : X ⟶ Z) (r : Z ⟶ Y) (j : Y ⟶ Z),
      cofibrations C i ∧ cofibrations C j ∧ weakEquivalences C j ∧ j ≫ r = 𝟙 Y ∧
        i ≫ r = f := sorry

end CofibrationCategory

/-! ## Layer 8: gr-categories, crossed modules, Picard categories -/

section GrCategory

/-- A gr-category: a monoidal groupoid whose objects are all tensor-invertible. -/
class IsGrCategory (C : Type u) [Groupoid.{v} C] [MonoidalCategory C] : Prop where
  exists_inverse : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)

variable (C : Type u) [Groupoid.{v} C] [MonoidalCategory C]

/-- `π₀`: isomorphism classes of objects. -/
abbrev PiZero : Type u := Quotient (isIsomorphicSetoid C)

instance [IsGrCategory C] : Group (PiZero C) := sorry

theorem aut_unit_mul_comm (a b : Aut (𝟙_ C)) : a * b = b * a := sorry

/-- `π₁ = Aut(𝟙)` as a representation of `π₀` over `ℤ`. -/
def piOneRep [IsGrCategory C] : Rep (ULift.{u} ℤ) (PiZero C) := sorry

/-- The `k`-invariant in `H³(π₀, π₁)`. -/
def kInvariant [IsGrCategory C] : groupCohomology (piOneRep C) 3 := sorry

/-- Strict commutativity of a symmetric monoidal category (Deligne, SGA 4 XVIII, §1.4). -/
def IsStrictlyCommutative [SymmetricCategory C] : Prop :=
  ∀ X : C, (β_ X X).hom = 𝟙 (X ⊗ X)

/-- A crossed module of groups. -/
structure CrossedModule (G : Type u) [Group G] where
  H : Type u
  [group : Group H]
  act : G →* MulAut H
  bdry : H →* G
  bdry_act : ∀ (g : G) (h : H), bdry (act g h) = g * bdry h * g⁻¹
  peiffer : ∀ h h' : H, act (bdry h) h' = h * h' * h⁻¹

attribute [instance] CrossedModule.group

/-- `ch(d)`: objects `K⁰`, morphisms `x ⟶ y` the `k : K⁻¹` with `x + d k = y`. -/
def TwoTerm {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (_d : K₁ →+ K₀) : Type u :=
  K₀

variable {K₁ K₀ : Type u} [AddCommGroup K₁] [AddCommGroup K₀] (d : K₁ →+ K₀)

instance : Groupoid.{u} (TwoTerm d) := sorry

instance : MonoidalCategory (TwoTerm d) := sorry

instance : SymmetricCategory (TwoTerm d) := sorry

theorem isGrCategory_twoTerm : IsGrCategory (TwoTerm d) := sorry

theorem isStrictlyCommutative_twoTerm : IsStrictlyCommutative (TwoTerm d) := sorry

end GrCategory

end

end TauCetiRoadmap.HomotopyTheoryOfCategories
