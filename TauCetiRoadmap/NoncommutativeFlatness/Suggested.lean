module

import Mathlib
import TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic
import TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree
import TauCeti.Algebra.Category.ModuleCat.Projective.TensorHom
import TauCeti.Algebra.Module.AuslanderReiten.TensorCokernel
import TauCeti.RingTheory.GlobalDimension
import TauCeti.RingTheory.Jacobson.Semiperfect
import TauCeti.Algebra.Module.ProjectiveCover.Basic
import TauCeti.Algebra.Module.Projective.FinitePresentation
import TauCeti.Algebra.Module.MinimalProjectivePresentation.Basic
import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul
import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Opposite
import TauCeti.CategoryTheory.Preadditive.Radical.Nilpotent
import TauCeti.CategoryTheory.Projective.Cover
import TauCeti.RingTheory.Jacobson.MulOpposite

/-!
# Flatness and homological dimensions of noncommutative rings: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap library -- these
are goals, not proofs.

Layers as in `README.md`: 0 modules over a preadditive category and their tensor product; 1 `Tor`;
2 flat modules and flat functors; 3 flat dimension, global and weak global dimension, and
Auslander's theorem; 4 semiperfect and perfect categories and rings, and Bass's Theorem P.

One module convention (README, "Conventions"). `C : Type u` is preadditive with `Category.{v} C`.
A `C`-module is a contravariant additive functor: `ModCat C` (`Mod C`) is the full subcategory of
additive functors `Cᵒᵖ ⥤ AddCommGrpCat.{w}`. Covariant additive functors are the modules of the
other side, `ModCat Cᵒᵖ`; the covariant representable `Hom(X, -)` is
`(ModCat.yoneda Cᵒᵖ).obj (op X)`.
A ring `A` enters as `SingleObj Aᵐᵒᵖ`, as in Mathlib's `Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)`: `Mod` of
it is `ModuleCat A` (left modules), and `Mod` of `(SingleObj Aᵐᵒᵖ)ᵒᵖ` is `ModuleCat Aᵐᵒᵖ` (right
modules).

Finite presentation (0.1, 0.8). A functor is finitely generated (finitely presented) when it is a
quotient (a cokernel of a map) of finite sums of representables: the refactored form of Tau Ceti's
`TauCeti.IsFinitelyGeneratedFunctor` and `TauCeti.IsFinitelyPresentedFunctor`, which use one
representable. 0.8 compares this with `proj C`, with Mathlib's `IsFinitelyPresentable` and, for
rings, with `Module.FinitePresentation`.

Base ring (0.3, 1.1). `G ⊗_C F` and `Tor^C_n(G, F)` take values in `AddCommGrpCat`. For an
`R`-linear `C` they carry `Module R` instances, `r` acting through `r • 𝟙` in either variable: the
pattern of Mathlib's `Abelian.Ext` with `Abelian.Ext.smul_eq_comp_mk₀`. `R` enters a definition
only where it changes the result: `Hom_R(G(-), X)` and the duals of 0.7. For a covariant `G` and
`F` in `Mod C`, `G ⊗_C F` is a coend in the order of `M ⊗_A N` (the right module first); it exists
when `C` is `EssentiallySmall.{w}`. Ring-level objects are native: `M ⊗_A N` is
`TauCeti.BalancedTensorProduct R A M N`, compared with the categorical tensor product through
`R = ℤ` (0.6). `Tor^C_n(G, F)` is the left derived functor of `F ↦ G ⊗_C F` (Mathlib's classical
`Functor.leftDerived`); ring `Tor` is `BalancedTor R A n`, compared with `Tor` over
`SingleObj Aᵐᵒᵖ` through `R = ℤ`.

Layer 2. A module `F` in `Mod C` is flat (`ModCat.Flat`) when it satisfies the equational
criterion: every relation `∑_j F(β_j)(y_j) = 0` is trivial. This uses no tensor product, no
smallness and no fixed universe; the tensor, ideal and `Tor` forms need the coend over `C` and are
the tests of 2.2. Ring flatness is the native class `Module.BalancedFlat`.

Layer 3. Flat dimension is defined by the vanishing of `Tor` on the finitely presented cyclic
covariant functors `Hom(X, -) ⧸ I`; the global dimension is defined for any abelian category
(`Abelian.globalDimension`), with Tau Ceti's ring `TauCeti.globalDimension` the case
`ModuleCat A`; the weak global dimension is `ModCat.weakGlobalDimension C`; Auslander's theorem
assumes that every representable `Hom(-, X)` is a Noetherian object.

One-sided ideals (0.3). A left ideal of `C` (`LeftMorphismIdeal C`) is closed under precomposition,
a right ideal (`RightMorphismIdeal C`) under postcomposition; Tau Ceti's two-sided
`TauCeti.MorphismIdeal` is both. For `SingleObj Aᵐᵒᵖ` they are the left and the right ideals of `A`.
`I · M` is a subobject of `M`, and superfluous subobjects use the lattice predicate
`IsSuperfluous`, a refactor of Tau Ceti's `TauCeti.IsSuperfluous` for submodules.

Layer 4. T-nilpotence is defined for a left ideal of `C` on sequences `c₀ → c₁ → ⋯`, the direction
of Nakayama's lemma for `Mod C` through `I · M`; `C` is
semilocal, semiperfect or perfect through its endomorphism rings and its radical
`TauCeti.jacobsonRadicalIdeal C`; projective covers are Tau Ceti's essential epimorphisms
`TauCeti.IsEssentialEpi` from projective objects; Bass's Theorem P is `isPerfectCategory_tfae`,
with the ring version `isLeftPerfectRing_tfae` derived through `SingleObj Aᵐᵒᵖ`. The ring Nakayama
lemma for a left ideal `J` of `A` is the categorical one for the left ideal
`idealOrderIsoLeftMorphismIdeal A J` of `SingleObj Aᵐᵒᵖ`. Rings keep native
classes (`IsSemilocalRing`, `IsLeftPerfectRing`) with bridges. 0.8 adds the finitely generated
projective modules `proj C` and the duality `Hom(-, C) : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`. A right
`A`-module is a left `Aᵐᵒᵖ`-module and a right ideal is a `Submodule Aᵐᵒᵖ A`.
Declarations that Tau Ceti already has are referred to by their full `TauCeti.` names.

Universes. Statements that use the tensor product, `Tor`, the Lazard block or Bass's modules are
made for `EssentiallySmall.{v} C` and modules in `ModCat.{v} C`, where the representables live.
Flatness, finite presentation, T-nilpotence and the items of 2.4 need no smallness.

Other roadmaps. Krull–Schmidt categories are the class of the ArtinAlgebras roadmap (§0.2),
restated here as `IsKrullSchmidt` with the same statement, for the items of 4.2 that use it.

Not stated here, and specified in prose in `README.md`: the transfer lemmas of 0.2, the naturality
of the isomorphisms in the variables not visible in the statements (for example of the `Tor`–`Ext`
duality), and the acceptance checks other than those in the last section.
-/

open CategoryTheory CategoryTheory.Limits

universe w v u t

namespace TauCetiRoadmap.NoncommutativeFlatness

open CategoryTheory CategoryTheory.Limits MulOpposite Opposite

open scoped CharacterModule DirectSum TensorProduct

/-! ## Layer 0: modules over a preadditive category and their tensor product -/

/-! ### 0.1 `Mod C` -/

section FinitelyPresentedFunctor

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **0.1** The map `⊕_j Hom(-, Y j) ⟶ ⊕_i Hom(-, Z i)` of a matrix `α j i : Y j ⟶ Z i` of
morphisms of `C`. By Yoneda every map between finite sums of representables is of this form
(`exists_eq_matrixMap`). -/
noncomputable def matrixMap {p q : ℕ} {Y : Fin q → C} {Z : Fin p → C} (α : ∀ j i, Y j ⟶ Z i) :
    (∐ fun j ↦ preadditiveYoneda.obj (Y j)) ⟶ ∐ fun i ↦ preadditiveYoneda.obj (Z i) :=
  Limits.Sigma.desc fun j ↦
    ∑ i, preadditiveYoneda.map (α j i) ≫ Limits.Sigma.ι (fun i ↦ preadditiveYoneda.obj (Z i)) i

/-- **0.1** Every map between finite sums of representables is a `matrixMap`. -/
theorem exists_eq_matrixMap {p q : ℕ} {Y : Fin q → C} {Z : Fin p → C}
    (f : (∐ fun j ↦ preadditiveYoneda.obj (Y j)) ⟶ ∐ fun i ↦ preadditiveYoneda.obj (Z i)) :
    ∃ α : ∀ j i, Y j ⟶ Z i, f = matrixMap α :=
  sorry

/-- **0.1** `F` is **finitely generated**: a quotient of a finite sum of representables. With finite
biproducts one representable suffices (`isFinitelyGeneratedFunctor_iff_exists_epi`); without them
it does not: for the ring `ℤ` (`C = SingleObj ℤᵐᵒᵖ`) the module `ℤ²` is a quotient of no single
representable. -/
def IsFinitelyGeneratedFunctor (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) : Prop :=
  ∃ (n : ℕ) (Y : Fin n → C) (p : (∐ fun i ↦ preadditiveYoneda.obj (Y i)) ⟶ F), Epi p

/-- **0.1** `F` is **finitely presented**: the cokernel of a map between finite sums of
representables, written as an exact sequence. With finite biproducts one morphism of `C`
suffices (`isFinitelyPresentedFunctor_iff_exists_hom`). -/
def IsFinitelyPresentedFunctor (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) : Prop :=
  ∃ (m n : ℕ) (X : Fin m → C) (Y : Fin n → C)
    (f : (∐ fun j ↦ preadditiveYoneda.obj (X j)) ⟶ ∐ fun i ↦ preadditiveYoneda.obj (Y i))
    (p : (∐ fun i ↦ preadditiveYoneda.obj (Y i)) ⟶ F) (h : f ≫ p = 0),
    Epi p ∧ (ShortComplex.mk _ _ h).Exact

variable (C) in
/-- **0.1** `mod C`, the finitely presented functors, as a property of objects. -/
abbrev isFinitelyPresentedFunctor : ObjectProperty (Cᵒᵖ ⥤ AddCommGrpCat.{v}) :=
  IsFinitelyPresentedFunctor

/-- **0.1** Finitely presented functors are additive. -/
theorem IsFinitelyPresentedFunctor.additive {F : Cᵒᵖ ⥤ AddCommGrpCat.{v}}
    (hF : IsFinitelyPresentedFunctor F) : F.Additive :=
  sorry

/-- **0.1** The zero functor is finitely presented, as the cokernel of the empty sums; no object
of `C` is needed. -/
instance : (isFinitelyPresentedFunctor C).ContainsZero := sorry

/-- **0.1** Finitely presented functors are closed under cokernels: a map `F ⟶ G` lifts to the
finite sums presenting them, and `coker` adds the relations of `F` to those of `G`. No biproducts
in `C` are needed. -/
instance : (isFinitelyPresentedFunctor C).IsClosedUnderCokernels := sorry

/-- **0.1** Finitely presented functors are closed under finite coproducts, presented by the sums
over the disjoint unions of the index sets, with block matrices (`matrixMap`). -/
instance : (isFinitelyPresentedFunctor C).IsClosedUnderFiniteCoproducts := sorry

/-- **0.1** A retract of a finitely presented functor is finitely presented: for `X` a retract of
`F` with idempotent `e` on `F`, `X ≅ coker (𝟙 F - e)`, a cokernel of a map between finitely
presented functors. 0.8 uses this for the bridge to Mathlib's finite presentability. -/
instance : (isFinitelyPresentedFunctor C).IsStableUnderRetracts := sorry

/-- **0.1** With finite biproducts, one representable suffices. -/
theorem isFinitelyGeneratedFunctor_iff_exists_epi [HasFiniteBiproducts C]
    (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) :
    IsFinitelyGeneratedFunctor F ↔ ∃ (Y : C) (p : preadditiveYoneda.obj Y ⟶ F), Epi p :=
  sorry

/-- **0.1** With finite biproducts, one morphism of `C` suffices. -/
theorem isFinitelyPresentedFunctor_iff_exists_hom [HasFiniteBiproducts C]
    (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) :
    IsFinitelyPresentedFunctor F ↔ ∃ (X Y : C) (f : X ⟶ Y) (p : preadditiveYoneda.obj Y ⟶ F)
      (h : preadditiveYoneda.map f ≫ p = 0), Epi p ∧ (ShortComplex.mk _ _ h).Exact :=
  sorry

end FinitelyPresentedFunctor
section ModCat

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **0.1** `Mod C`: the `C`-modules, the contravariant additive functors `Cᵒᵖ ⥤ AddCommGrpCat`, as
a full subcategory of the functor category (Mathlib's `C ⥤+ D`). For `C = SingleObj Aᵐᵒᵖ` these
are the left `A`-modules (0.2). This is the only notion of module: covariant additive functors are
the modules over the other side, `ModCat Cᵒᵖ`. -/
abbrev ModCat := Cᵒᵖ ⥤+ AddCommGrpCat.{w}

section Closure

variable {D : Type u} [Category.{v} D] [Preadditive D]

/-- **0.1** The zero functor is additive. -/
instance : (additiveFunctor D AddCommGrpCat.{w}).ContainsZero := sorry

/-- **0.1** Additive functors are closed under kernels. -/
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderKernels := sorry

/-- **0.1** Additive functors are closed under cokernels. -/
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderCokernels := sorry

/-- **0.1** Additive functors are closed under finite products. -/
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderFiniteProducts := sorry

/-- **0.1** Additive functors are closed under colimits, computed objectwise (colimits commute with
finite biproducts). So `Mod C` has the colimits of `AddCommGrpCat`. -/
instance {J : Type*} [Category J] [HasColimitsOfShape J AddCommGrpCat.{w}] :
    (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderColimitsOfShape J := sorry

end Closure

/-- **0.1** `Mod C` is abelian, by the closure properties and Mathlib's instance for full
subcategories (`Mathlib/CategoryTheory/Abelian/Subcategory.lean`); stated as an instance to cache
it. -/
noncomputable instance : Abelian (ModCat.{w} C) := inferInstance

/-- **0.1** `Mod C` has the colimits of `AddCommGrpCat`, from the closure under colimits. -/
instance (priority := high) {J : Type*} [Category J] [HasColimitsOfShape J AddCommGrpCat.{w}] :
    HasColimitsOfShape J (ModCat.{w} C) :=
  hasColimitsOfShape_of_closedUnderColimits _ _

/-- **0.1** `Mod C` has enough projectives when `C` is `w`-small. -/
instance [EssentiallySmall.{w} C] : EnoughProjectives (ModCat.{w} C) := sorry

/-- **0.1** `Mod C` is a Grothendieck abelian category when `C` is `w`-small: objectwise filtered
colimits and AB5 (Mathlib's functor-category instances, with the closure under colimits), local
smallness, and the sum of the representables as a separator (compare
`Mathlib/CategoryTheory/Generator/Presheaf.lean`). Mathlib then gives enough injectives
(`IsGrothendieckAbelian.enoughInjectives`), `HasExt` (`IsGrothendieckAbelian.hasExt`) and the
lifting criterion `IsGrothendieckAbelian.generatingMonomorphisms_rlp` against the subobjects of a
separator. -/
instance [EssentiallySmall.{w} C] : IsGrothendieckAbelian.{w} (ModCat.{w} C) := sorry

/-- **0.1** Enough injectives, from the Grothendieck structure (Mathlib's
`IsGrothendieckAbelian.enoughInjectives`). -/
example [EssentiallySmall.{w} C] : EnoughInjectives (ModCat.{w} C) := inferInstance

/-- **0.1** `Mod C` is well-powered when `C` is `w`-small, so that `Subobject M` is a complete
lattice (Mathlib's instance for well-powered categories with limits). This comes from the
Grothendieck structure (Mathlib's `IsGrothendieckAbelian.wellPowered`); no separate instance. -/
example [EssentiallySmall.{w} C] : WellPowered.{w} (ModCat.{w} C) := inferInstance

/-- **0.1** The subobjects of a module form a modular lattice (computed objectwise). -/
instance (M : ModCat.{w} C) : IsModularLattice (Subobject M) := sorry

/-- **0.1** The subobject lattice of a module is compactly generated: the compact subobjects are
the finitely generated ones (quotients of finite sums of representables). -/
instance [EssentiallySmall.{w} C] (M : ModCat.{w} C) : IsCompactlyGenerated (Subobject M) :=
  sorry

/-- **0.1** The Yoneda embedding into `Mod C`, `X ↦ Hom(-, X)` (Mathlib's `preadditiveYoneda`). Over
`Cᵒᵖ` it gives the covariant representables: `(ModCat.yoneda Cᵒᵖ).obj (op X)` is `Hom(X, -)`, so
no separate `preadditiveCoyoneda` embedding is needed. -/
def ModCat.yoneda : C ⥤ ModCat.{v} C :=
  ObjectProperty.lift _ preadditiveYoneda fun X ↦
    (inferInstance : (preadditiveYoneda.obj X).Additive)

/-- **0.1** Representable modules are projective. -/
instance (X : C) : Projective ((ModCat.yoneda C).obj X) := sorry

/-- **0.1** `mod C ⊆ Mod C`: finitely presented functors are additive. -/
theorem isFinitelyPresentedFunctor_le_additiveFunctor :
    isFinitelyPresentedFunctor C ≤ additiveFunctor Cᵒᵖ AddCommGrpCat.{v} :=
  fun _ hF ↦ hF.additive

/-- **0.1** The inclusion `mod C ⥤ Mod C`. -/
abbrev ModCat.ιFinitelyPresented :
    (isFinitelyPresentedFunctor C).FullSubcategory ⥤ ModCat.{v} C :=
  ObjectProperty.ιOfLE (isFinitelyPresentedFunctor_le_additiveFunctor C)

end ModCat

section Linear

variable (R : Type*) [CommRing R] {D : Type u} [Category.{v} D] [Preadditive D] [Linear R D]

/-- **0.1** The derived `R`-action on `F(d)` for an additive `F` on an `R`-linear category:
`r` acts by `F(r • 𝟙 d)`. -/
@[implicit_reducible]
def Functor.objModule (F : D ⥤ AddCommGrpCat.{w}) [F.Additive] (d : D) : Module R (F.obj d) where
  smul r x := (F.map (r • 𝟙 d)).hom x
  one_smul x := by
    change (F.map ((1 : R) • 𝟙 d)).hom x = x
    rw [one_smul, F.map_id]; rfl
  mul_smul r s x := by
    change (F.map ((r * s) • 𝟙 d)).hom x = (F.map (r • 𝟙 d)).hom ((F.map (s • 𝟙 d)).hom x)
    rw [← AddCommGrpCat.comp_apply, ← F.map_comp, Linear.smul_comp, Category.id_comp, mul_comm,
      mul_smul]
  smul_zero r := map_zero _
  smul_add r x y := map_add _ x y
  add_smul r s x := by
    change (F.map ((r + s) • 𝟙 d)).hom x = (F.map (r • 𝟙 d)).hom x + (F.map (s • 𝟙 d)).hom x
    rw [add_smul, F.map_add]; rfl
  zero_smul x := by
    change (F.map ((0 : R) • 𝟙 d)).hom x = 0
    rw [zero_smul, F.map_zero]; rfl

/-- **0.1** An additive functor to abelian groups on an `R`-linear category, with its derived
`R`-structure, as a functor to `ModuleCat R`. -/
def Functor.toModuleCat (F : D ⥤ AddCommGrpCat.{w}) [F.Additive] : D ⥤ ModuleCat.{w} R where
  obj d := letI := Functor.objModule R F d; ModuleCat.of R (F.obj d)
  map {d d'} f := letI := Functor.objModule R F d; letI := Functor.objModule R F d'
    ModuleCat.ofHom
      { toFun := (F.map f).hom
        map_add' := map_add _
        map_smul' r x := by
          change (F.map f).hom ((F.map (r • 𝟙 d)).hom x) =
            (F.map (r • 𝟙 d')).hom ((F.map f).hom x)
          rw [← AddCommGrpCat.comp_apply, ← AddCommGrpCat.comp_apply, ← F.map_comp,
            ← F.map_comp, Linear.smul_comp, Linear.comp_smul, Category.id_comp,
            Category.comp_id] }

/-- **0.1** For an `R`-linear `C`, `Mod C` is `R`-linear through the derived actions. -/
instance : Linear R (ModCat.{w} D) := sorry

end Linear

/-! ### 0.2 Rings as one-object categories -/

/-- **0.2** `Small.{v} Aᵐᵒᵖ` from `Small.{v} A`, so that `SingleObj Aᵐᵒᵖ` is `v`-small and right
modules have projective resolutions in `ModuleCat.{v} Aᵐᵒᵖ`. -/
instance small_mulOpposite (A : Type u) [Small.{v} A] : Small.{v} Aᵐᵒᵖ :=
  small_of_injective MulOpposite.unop_injective

section OneObject

variable (A : Type u) [Ring A]

/-- **0.2** Left `A`-modules are the modules over `SingleObj Aᵐᵒᵖ`. With Mathlib's `f ≫ g = g * f`,
a composite `f ≫ g` in `SingleObj Aᵐᵒᵖ` is `op (unop f * unop g)`, so a contravariant `F` has
`F(a b) = F(a) ∘ F(b)`. The ring enters as `Aᵐᵒᵖ` as in Mathlib's
`CategoryTheory.Mat.equivalenceSingleObj : Mat R ≌ Mat_ (SingleObj Rᵐᵒᵖ)`; the equivalence follows
the pattern of Mathlib's `Action.functorCategoryEquivalence`. -/
noncomputable def moduleCatEquivModCat : ModuleCat.{v} A ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ) :=
  sorry

/-- **0.2** Right `A`-modules are the modules over `(SingleObj Aᵐᵒᵖ)ᵒᵖ`, that is, the covariant
additive functors on `SingleObj Aᵐᵒᵖ`. -/
noncomputable def moduleCatMulOppositeEquivModCatOp :
    ModuleCat.{v} Aᵐᵒᵖ ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)ᵒᵖ :=
  sorry

/-- **0.2** The regular left module goes to the representable `Hom(-, ∗)`. -/
noncomputable def moduleCatEquivModCatRegularIso :
    (moduleCatEquivModCat.{u} A).functor.obj (ModuleCat.of A A) ≅
      (ModCat.yoneda (SingleObj Aᵐᵒᵖ)).obj (SingleObj.star Aᵐᵒᵖ) :=
  sorry

/-- **0.2** The regular right module goes to the covariant representable `Hom(∗, -)`. -/
noncomputable def moduleCatMulOppositeEquivModCatOpRegularIso :
    (moduleCatMulOppositeEquivModCatOp.{u} A).functor.obj (ModuleCat.of Aᵐᵒᵖ A) ≅
      (ModCat.yoneda (SingleObj Aᵐᵒᵖ)ᵒᵖ).obj (op (SingleObj.star Aᵐᵒᵖ)) :=
  sorry

/-- **0.2** `SingleObj Aᵐᵒᵖ` is the opposite of `SingleObj A`. At `Aᵐᵒᵖ` it identifies
`SingleObj Aᵐᵒᵖᵐᵒᵖ` with `(SingleObj Aᵐᵒᵖ)ᵒᵖ`, which the ring swap uses (1.3). -/
noncomputable def singleObjMulOppositeEquiv : SingleObj Aᵐᵒᵖ ≌ (SingleObj A)ᵒᵖ :=
  sorry

instance : (singleObjMulOppositeEquiv A).functor.Additive := sorry

/-- **0.2** `SingleObj A` is `w`-small when `A` is. -/
instance [Small.{v} A] : EssentiallySmall.{v} (SingleObj A) := sorry

/-- **0.2** For an `R`-algebra `A`, `SingleObj A` is `R`-linear; `SingleObj Aᵐᵒᵖ` through Mathlib's
`R`-algebra `Aᵐᵒᵖ`. -/
instance (R : Type*) [CommRing R] [Algebra R A] : Linear R (SingleObj A) where
  homModule _ _ := inferInstanceAs (Module R A)
  smul_comp _ _ _ r f g := mul_smul_comm r g f
  comp_smul _ _ _ f r g := smul_mul_assoc r g f

/-- **0.2** The derived `R`-structure at `∗` is the `R`-structure through `algebraMap R A`. -/
noncomputable def moduleCatEquivModCatToModuleCatIso (R : Type*) [CommRing R]
    [Algebra R A] (M : ModuleCat.{v} A) :
    (Functor.toModuleCat R ((moduleCatEquivModCat.{v} A).functor.obj M).obj).obj
        (op (SingleObj.star Aᵐᵒᵖ)) ≅
      (ModuleCat.restrictScalars (algebraMap R A)).obj M :=
  sorry

end OneObject

/-! ### 0.3 The tensor product over `C` -/

section OneSidedIdeal

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **0.3, one-sided ideals** A **left ideal** of `C`: additive subgroups `I(X, Y) ⊆ (X ⟶ Y)`
closed under precomposition, `h ≫ f ∈ I` for `f ∈ I`. Equivalently, for every `Y` a subfunctor
`I(-, Y)` of the representable `Hom(-, Y)` in `Mod C` (`LeftMorphismIdeal.orderIsoSubobject`). For
`SingleObj Aᵐᵒᵖ` these are the left ideals of `A` (`idealOrderIsoLeftMorphismIdeal`). Tau Ceti's
two-sided `TauCeti.MorphismIdeal` is a left ideal (`MorphismIdeal.toLeftMorphismIdeal`, a
coercion); the field name follows its `comp_mem_left`. Mathlib's `Sieve` has this closure but is
not additive. -/
structure LeftMorphismIdeal where
  /-- The morphisms `X ⟶ Y` in the ideal. -/
  hom (X Y : C) : AddSubgroup (X ⟶ Y)
  /-- Precomposing a member of the ideal with any morphism stays in the ideal. -/
  comp_mem_left {X Y Z : C} (f : X ⟶ Y) {g : Y ⟶ Z} : g ∈ hom Y Z → f ≫ g ∈ hom X Z

/-- **0.3, one-sided ideals** A **right ideal** of `C`: additive subgroups `I(X, Y) ⊆ (X ⟶ Y)`
closed under postcomposition, `f ≫ h ∈ I` for `f ∈ I`. Equivalently, for every `X` a subfunctor
`I(X, -)` of the covariant representable `Hom(X, -)` (`RightMorphismIdeal.orderIsoSubobject`); a
right ideal of `C` is a left ideal of `Cᵒᵖ` (`RightMorphismIdeal.op`). For `SingleObj Aᵐᵒᵖ` these
are the right ideals of `A` (`submoduleOrderIsoRightMorphismIdeal`). -/
structure RightMorphismIdeal where
  /-- The morphisms `X ⟶ Y` in the ideal. -/
  hom (X Y : C) : AddSubgroup (X ⟶ Y)
  /-- Postcomposing a member of the ideal with any morphism stays in the ideal. -/
  comp_mem_right {X Y Z : C} {f : X ⟶ Y} (g : Y ⟶ Z) : f ∈ hom X Y → f ≫ g ∈ hom X Z

variable {C}

instance : PartialOrder (LeftMorphismIdeal C) :=
  PartialOrder.lift LeftMorphismIdeal.hom fun | ⟨_, _⟩, ⟨_, _⟩, rfl => rfl

instance : PartialOrder (RightMorphismIdeal C) :=
  PartialOrder.lift RightMorphismIdeal.hom fun | ⟨_, _⟩, ⟨_, _⟩, rfl => rfl

theorem LeftMorphismIdeal.le_def {I J : LeftMorphismIdeal C} :
    I ≤ J ↔ ∀ ⦃X Y : C⦄ (f : X ⟶ Y), f ∈ I.hom X Y → f ∈ J.hom X Y :=
  Iff.rfl

theorem RightMorphismIdeal.le_def {I J : RightMorphismIdeal C} :
    I ≤ J ↔ ∀ ⦃X Y : C⦄ (f : X ⟶ Y), f ∈ I.hom X Y → f ∈ J.hom X Y :=
  Iff.rfl

/-- **0.3** A two-sided ideal is a left ideal. -/
@[coe]
def MorphismIdeal.toLeftMorphismIdeal (I : TauCeti.MorphismIdeal C) : LeftMorphismIdeal C where
  hom := I.hom
  comp_mem_left := I.comp_mem_left

/-- **0.3** A two-sided ideal is a right ideal. -/
@[coe]
def MorphismIdeal.toRightMorphismIdeal (I : TauCeti.MorphismIdeal C) : RightMorphismIdeal C where
  hom := I.hom
  comp_mem_right := I.comp_mem_right

instance : Coe (TauCeti.MorphismIdeal C) (LeftMorphismIdeal C) :=
  ⟨MorphismIdeal.toLeftMorphismIdeal⟩

instance : Coe (TauCeti.MorphismIdeal C) (RightMorphismIdeal C) :=
  ⟨MorphismIdeal.toRightMorphismIdeal⟩

/-- **0.3** A right ideal of `C` is a left ideal of `Cᵒᵖ`, as Tau Ceti's
`TauCeti.MorphismIdeal.op`. For a two-sided `I`, `(I : RightMorphismIdeal C).op` is `I.op` as a
left ideal. -/
def RightMorphismIdeal.op (I : RightMorphismIdeal C) : LeftMorphismIdeal Cᵒᵖ where
  hom X Y := (I.hom Y.unop X.unop).comap (CategoryTheory.unopHom X Y)
  comp_mem_left f _ hg := I.comp_mem_right f.unop hg

/-- **0.3** Left ideals are the families of subfunctors `I(-, Y) ⊆ Hom(-, Y)` in `Mod C`. -/
noncomputable def LeftMorphismIdeal.orderIsoSubobject :
    LeftMorphismIdeal C ≃o ∀ Y : C, Subobject ((ModCat.yoneda C).obj Y) :=
  sorry

/-- **0.3** Right ideals are the families of subfunctors `I(X, -) ⊆ Hom(X, -)` of the covariant
representables. -/
noncomputable def RightMorphismIdeal.orderIsoSubobject :
    RightMorphismIdeal C ≃o ∀ X : C, Subobject ((ModCat.yoneda Cᵒᵖ).obj (Opposite.op X)) :=
  sorry

/-- **0.3, ideals at one object** A subfunctor `S ⊆ Hom(-, Y)` as the left ideal that is `S` at the
target `Y` and `0` at the other targets. Mitchell's one-sided ideals are such subfunctors of one
representable ([Mitchell, §3, p. 18]; [OR, pp. 93–96] for ideals of `X(z, -)` and `X(-, x)`); a
left ideal is the family of its parts at the targets (`LeftMorphismIdeal.orderIsoSubobject`), so a
statement about one representable uses `Subobject (Hom(-, Y))` directly. -/
noncomputable def LeftMorphismIdeal.ofSubobject {Y : C} (S : Subobject ((ModCat.yoneda C).obj Y)) :
    LeftMorphismIdeal C :=
  sorry

/-- **0.3, ideals at one object** A subfunctor `S ⊆ Hom(X, -)` as the right ideal that is `S` at
the source `X` and `0` at the other sources. -/
noncomputable def RightMorphismIdeal.ofSubobject {X : C}
    (S : Subobject ((ModCat.yoneda Cᵒᵖ).obj (Opposite.op X))) : RightMorphismIdeal C :=
  sorry

theorem LeftMorphismIdeal.orderIsoSubobject_ofSubobject {Y : C}
    (S : Subobject ((ModCat.yoneda C).obj Y)) :
    LeftMorphismIdeal.orderIsoSubobject (LeftMorphismIdeal.ofSubobject S) Y = S :=
  sorry

theorem RightMorphismIdeal.orderIsoSubobject_ofSubobject {X : C}
    (S : Subobject ((ModCat.yoneda Cᵒᵖ).obj (Opposite.op X))) :
    RightMorphismIdeal.orderIsoSubobject (RightMorphismIdeal.ofSubobject S) X = S :=
  sorry

/-- **0.3** The principal right ideal `g C`, generated by `g : X ⟶ Y`: the right ideal at `X` given
by the cyclic subfunctor `{g ≫ h}` of `Hom(X, -)`, the image of `Hom(Y, -) → Hom(X, -)`. For
`SingleObj Aᵐᵒᵖ` and `g = op a` it is the principal right ideal `aA`, since `g ≫ op b = op (a b)`.
-/
noncomputable def RightMorphismIdeal.principal {X Y : C} (g : X ⟶ Y) : RightMorphismIdeal C :=
  RightMorphismIdeal.ofSubobject (imageSubobject ((ModCat.yoneda Cᵒᵖ).map g.op))

variable (A : Type u) [Ring A]

/-- **0.3, rings** The left ideals of `A` are the left ideals of `SingleObj Aᵐᵒᵖ`, by
`J ↦ {f | unop f ∈ J}`. With Mathlib's `SingleObj.comp_as_mul` (`f ≫ g = g * f` in `Aᵐᵒᵖ`),
`h ≫ f = op (unop h * unop f)`: closure under precomposition is closure under left multiplication,
as the proof of `comp_mem_left` below checks. -/
noncomputable def idealOrderIsoLeftMorphismIdeal :
    Ideal A ≃o LeftMorphismIdeal (SingleObj Aᵐᵒᵖ) where
  toFun J :=
    { hom _ _ :=
        { carrier := {f | MulOpposite.unop f ∈ J}
          add_mem' := fun ha hb ↦ J.add_mem ha hb
          zero_mem' := J.zero_mem
          neg_mem' := fun ha ↦ J.neg_mem ha }
      comp_mem_left h _ hf := J.mul_mem_left (MulOpposite.unop h) hf }
  invFun := sorry
  left_inv := sorry
  right_inv := sorry
  map_rel_iff' := sorry

/-- **0.3, rings** The right ideals of `A` (`Submodule Aᵐᵒᵖ A`, Convention 4) are the right ideals
of `SingleObj Aᵐᵒᵖ`, by `I ↦ {f | unop f ∈ I}`: `f ≫ g = op (unop f * unop g)`, so closure under
postcomposition is closure under right multiplication, as the proof of `comp_mem_right` checks. -/
noncomputable def submoduleOrderIsoRightMorphismIdeal :
    Submodule Aᵐᵒᵖ A ≃o RightMorphismIdeal (SingleObj Aᵐᵒᵖ) where
  toFun I :=
    { hom _ _ :=
        { carrier := {f | MulOpposite.unop f ∈ I}
          add_mem' := fun ha hb ↦ I.add_mem ha hb
          zero_mem' := I.zero_mem
          neg_mem' := fun ha ↦ I.neg_mem ha }
      comp_mem_right g hf := I.smul_mem (op (MulOpposite.unop g)) hf }
  invFun := sorry
  left_inv := sorry
  right_inv := sorry
  map_rel_iff' := sorry

end OneSidedIdeal

section Tensor

section Bifunctor

variable {D : Type u} [Category.{v} D]

/-- **0.3** The bifunctor `(x, y) ↦ G(x) ⊗_ℤ F(y)` of abelian groups on `Dᵒᵖ × D`, whose coend is
the tensor product. `ModCat.tensorObj` uses it at `D = Cᵒᵖ`, where `G` is a covariant functor on
`C` and `F` a `C`-module. -/
def tensorBifunctor (G : Dᵒᵖ ⥤ AddCommGrpCat.{w}) (F : D ⥤ AddCommGrpCat.{w}) :
    Dᵒᵖ ⥤ D ⥤ AddCommGrpCat.{w} where
  obj x :=
    { obj y := AddCommGrpCat.of (G.obj x ⊗[ℤ] F.obj y)
      map g := AddCommGrpCat.ofHom ((F.map g).hom.toIntLinearMap.lTensor _).toAddMonoidHom
      map_id := sorry
      map_comp := sorry }
  map f :=
    { app y := AddCommGrpCat.ofHom ((G.map f).hom.toIntLinearMap.rTensor _).toAddMonoidHom
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- **0.3** The coend exists when `D` is `w`-small. -/
instance [EssentiallySmall.{w} D] (G : Dᵒᵖ ⥤ AddCommGrpCat.{w}) (F : D ⥤ AddCommGrpCat.{w}) :
    HasCoend (tensorBifunctor G F) :=
  sorry

end Bifunctor

section Superfluous

/-- **0.3, superfluous elements of a lattice**: `a ⊔ b = ⊤` forces `b = ⊤`. A refactor of Tau
Ceti's `TauCeti.IsSuperfluous`, which is stated for `Submodule R M` with this body; the submodule
results become the special case. Used for `Subobject M` in an abelian category. -/
def IsSuperfluous {α : Type*} [Lattice α] [OrderTop α] (a : α) : Prop :=
  ∀ b : α, a ⊔ b = ⊤ → b = ⊤

variable {α : Type*} [Lattice α] [OrderTop α]

theorem IsSuperfluous.mono {a b : α} (hb : IsSuperfluous b) (h : a ≤ b) : IsSuperfluous a :=
  sorry

/-- **0.3** Finite suprema of superfluous elements are superfluous. -/
theorem IsSuperfluous.sup {a b : α} (ha : IsSuperfluous a) (hb : IsSuperfluous b) :
    IsSuperfluous (a ⊔ b) :=
  sorry

/-- **0.3** A complemented superfluous element is `⊥`. -/
theorem IsSuperfluous.eq_bot_of_isCompl {β : Type*} [Lattice β] [BoundedOrder β] {a b : β}
    (ha : IsSuperfluous a) (h : IsCompl a b) : a = ⊥ :=
  sorry

/-- **0.3** In an abelian category, an epimorphism is essential (Tau Ceti's
`TauCeti.IsEssentialEpi`) exactly when its kernel is a superfluous subobject. -/
theorem isEssentialEpi_iff_isSuperfluous_kernelSubobject {𝒜 : Type*} [Category 𝒜] [Abelian 𝒜]
    {P M : 𝒜} (p : P ⟶ M) [Epi p] :
    TauCeti.IsEssentialEpi p ↔ IsSuperfluous (kernelSubobject p) :=
  sorry

end Superfluous

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **0.3, ideals** For a left ideal `I` of `C` and a module `M`, the submodule `I · M` of `M`,
generated by the `M(f)(x)` with `f ∈ I(c, d)` and `x ∈ M(d)` (objectwise:
`LeftMorphismIdeal.range_smul_arrow_app`). It is a submodule because `M(h)(M(f) x) = M(h ≫ f) x`
with `h ≫ f ∈ I`: only precomposition is used. For `C = SingleObj Aᵐᵒᵖ` and the left ideal
`idealOrderIsoLeftMorphismIdeal A J` it is `J • ⊤`. A two-sided ideal enters through the
coercion. -/
noncomputable def LeftMorphismIdeal.smul (I : LeftMorphismIdeal C) (M : ModCat.{w} C) :
    Subobject M :=
  sorry

/-- **0.3** `I · M` objectwise: at `c` it is the subgroup of `M(c)` generated by the `M(f)(x)`
with `f ∈ I(c, d)`. -/
theorem LeftMorphismIdeal.range_smul_arrow_app (I : LeftMorphismIdeal C) (M : ModCat.{w} C)
    (c : C) :
    ((I.smul M).arrow.hom.app (op c)).hom.range =
      AddSubgroup.closure
        {y | ∃ (d : C) (f : c ⟶ d) (_ : f ∈ I.hom c d) (x : M.obj.obj (op d)),
          (M.obj.map f.op).hom x = y} :=
  sorry

theorem LeftMorphismIdeal.smul_mono {I I' : LeftMorphismIdeal C} (h : I ≤ I')
    (M : ModCat.{w} C) : I.smul M ≤ I'.smul M :=
  sorry

/-- **0.3** `I · (⊕ Pᵢ) = ⊕ I · Pᵢ`: objectwise, `M(f)` of an element of a sum is the sum of the
`M(f)` of its components. 4.4 uses it for the kernel of a sum of covers. -/
theorem LeftMorphismIdeal.smul_sigma (I : LeftMorphismIdeal C) {ι : Type w}
    (P : ι → ModCat.{w} C) :
    I.smul (∐ P) = imageSubobject (Limits.Sigma.map fun i ↦ (I.smul (P i)).arrow) :=
  sorry

/-- **0.3** `M ⧸ I · M`, the cokernel of `I · M ⟶ M`. -/
noncomputable abbrev LeftMorphismIdeal.quotientSmul (I : LeftMorphismIdeal C) (M : ModCat.{w} C) :
    ModCat.{w} C :=
  cokernel (I.smul M).arrow

/-- **0.3, restriction along `C ⥤ C ⧸ I`** for a two-sided ideal `I`: a module over `C ⧸ I` is a
`C`-module through Tau Ceti's quotient functor `TauCeti.MorphismIdeal.quotientFunctor`. Fully
faithful, with essential image the modules with `I · M = 0`
(`MorphismIdeal.restrictModCat_essImage_iff`). -/
noncomputable def MorphismIdeal.restrictModCat (I : TauCeti.MorphismIdeal C) :
    ModCat.{w} I.Quotient ⥤ ModCat.{w} C :=
  sorry

instance (I : TauCeti.MorphismIdeal C) :
    (MorphismIdeal.restrictModCat I : ModCat.{w} I.Quotient ⥤ ModCat.{w} C).Full := sorry

instance (I : TauCeti.MorphismIdeal C) :
    (MorphismIdeal.restrictModCat I : ModCat.{w} I.Quotient ⥤ ModCat.{w} C).Faithful := sorry

theorem MorphismIdeal.restrictModCat_essImage_iff (I : TauCeti.MorphismIdeal C)
    (M : ModCat.{w} C) :
    (MorphismIdeal.restrictModCat I : ModCat.{w} I.Quotient ⥤ ModCat.{w} C).essImage M ↔ (I :
    LeftMorphismIdeal C).smul M = ⊥ :=
  sorry

/-- **0.3, reduction modulo `I`**: `M ↦ M ⧸ I · M` as a functor to modules over `C ⧸ I`; for
`I = J(C)` it gives the modules over the semisimple `C ⧸ J(C)` of 4.4 and 4.5. -/
noncomputable def MorphismIdeal.quotientSmulFunctor (I : TauCeti.MorphismIdeal C) :
    ModCat.{w} C ⥤ ModCat.{w} I.Quotient :=
  sorry

/-- **0.3** Reduction modulo `I` is left adjoint to restriction along `C ⥤ C ⧸ I`; the unit at `M`
is the quotient map `M ⟶ M ⧸ I · M` (`restrictModCatQuotientSmulFunctorIso`), and the counit is an
isomorphism because restriction is fully faithful. So reduction preserves colimits, in particular
sums and epimorphisms. -/
noncomputable def MorphismIdeal.quotientSmulAdjunction (I : TauCeti.MorphismIdeal C) :
    MorphismIdeal.quotientSmulFunctor I ⊣ (MorphismIdeal.restrictModCat I :
      ModCat.{w} I.Quotient ⥤ ModCat.{w} C) :=
  sorry

/-- **0.3** Restricting `M ⧸ I · M` back to `C` gives the cokernel of `I · M ⟶ M`. -/
noncomputable def MorphismIdeal.restrictModCatQuotientSmulFunctorIso (I : TauCeti.MorphismIdeal C)
    (M : ModCat.{w} C) :
    (MorphismIdeal.restrictModCat I).obj ((MorphismIdeal.quotientSmulFunctor I).obj M) ≅
      (I : LeftMorphismIdeal C).quotientSmul M :=
  sorry

/-- **0.3, ideals** The module `(C ⧸ I)(-, X) = Hom_{C ⧸ I}(-, X)` in `Mod C`, through Tau Ceti's
quotient functor. The covariant `(C ⧸ I)(X, -)` is `quotientYoneda I.op (op X)`, with Tau Ceti's
`TauCeti.MorphismIdeal.op`; for `I = J(C)` it is the covariant module `C ⧸ J` at `X` of 4.6. -/
noncomputable def MorphismIdeal.quotientYoneda (I : TauCeti.MorphismIdeal C) (X : C) :
    ModCat.{v} C :=
  ⟨I.quotientFunctor.op ⋙ preadditiveYoneda.obj (I.quotientFunctor.obj X),
    (inferInstance : (I.quotientFunctor.op ⋙ preadditiveYoneda.obj _).Additive)⟩

namespace ModCat

/-- **0.3** `Hom_ℤ(G(-), X)` as a `C`-module, for a covariant `G` (a module over `Cᵒᵖ`), functorial
in `G` and `X`: the right adjoint of `G ⊗_C -`. -/
noncomputable def homBifunctor : (ModCat.{w} Cᵒᵖ)ᵒᵖ ⥤ AddCommGrpCat.{w} ⥤ ModCat.{w} C :=
  sorry

/-- **0.3** `Hom_ℤ(F(-), X)` as a covariant functor (a module over `Cᵒᵖ`), for `F` in `Mod C`. -/
noncomputable def homOpBifunctor : (ModCat.{w} C)ᵒᵖ ⥤ AddCommGrpCat.{w} ⥤ ModCat.{w} Cᵒᵖ :=
  sorry

/-- **0.3** `X ↦ Hom_ℤ(G(-), X)`, the right adjoint of `G ⊗_C -`. -/
noncomputable abbrev homFunctor (G : ModCat.{w} Cᵒᵖ) : AddCommGrpCat.{w} ⥤ ModCat.{w} C :=
  (homBifunctor (C := C)).obj (op G)

/-- **0.3** `X ↦ Hom_ℤ(F(-), X)`, the right adjoint of `- ⊗_C F`. -/
noncomputable abbrev homOpFunctor (F : ModCat.{w} C) : AddCommGrpCat.{w} ⥤ ModCat.{w} Cᵒᵖ :=
  (homOpBifunctor (C := C)).obj (op F)

section LinearHom

variable (R : Type*) [CommRing R] [Linear R C]

/-- **0.3** `Hom_R(G(-), X)` for an `R`-module `X`, with the derived `R`-structure of `G` (0.1),
functorial in `G` and `X`: `R` changes the result here, so it is part of the definition (the
pattern of Mathlib's `linearYoneda`). The duals of 0.7 are its values at `E`. -/
noncomputable def linearHomBifunctor : (ModCat.{w} Cᵒᵖ)ᵒᵖ ⥤ ModuleCat.{w} R ⥤ ModCat.{w} C :=
  sorry

/-- **0.3** `Hom_R(F(-), X)` as a covariant functor, for `F` in `Mod C`. -/
noncomputable def linearHomOpBifunctor : (ModCat.{w} C)ᵒᵖ ⥤ ModuleCat.{w} R ⥤ ModCat.{w} Cᵒᵖ :=
  sorry

end LinearHom

variable [EssentiallySmall.{w} C]

/-- **0.3** `G ⊗_C F`, for a covariant `G` (a module over `Cᵒᵖ`) and `F` in `Mod C`: the coend of
abelian groups of `G(c) ⊗_ℤ F(c)`. The order is that of `M ⊗_A N`: the right module first. For an
`R`-linear `C` it is an `R`-module by instance (below). -/
noncomputable def tensorObj (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) : AddCommGrpCat.{w} :=
  coend (tensorBifunctor G.obj F.obj)

/-- **0.3** The element `x ⊗ y` of `G ⊗_C F` for `x ∈ G(c)` and `y ∈ F(c)`. -/
noncomputable def tmul {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (c : C)
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) : tensorObj G F :=
  (coend.ι (tensorBifunctor G.obj F.obj) (op c)).hom (x ⊗ₜ[ℤ] y)

/-- **0.3, balancing**: for `f : c ⟶ c'`, `x ⊗ F(f) y = G(f) x ⊗ y`. -/
theorem tmul_balance {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} {c c' : C} (f : c ⟶ c')
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c')) :
    tmul c x ((F.obj.map f.op).hom y) = tmul c' ((G.obj.map f.op.op).hom x) y :=
  sorry

/-- **0.3, induction** on `G ⊗_C F` by pure tensors and sums. -/
theorem tensorObj_induction_on {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C}
    {P : tensorObj G F → Prop} (z : tensorObj G F) (h₀ : P 0)
    (ht : ∀ (c : C) (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)), P (tmul c x y))
    (ha : ∀ a b, P a → P b → P (a + b)) : P z :=
  sorry

/-- **0.3** Maps out of `G ⊗_C F` agree when they agree on pure tensors. -/
theorem tensorObj_hom_ext {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} {X : AddCommGrpCat.{w}}
    {φ ψ : tensorObj G F ⟶ X}
    (h : ∀ (c : C) (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)),
      φ.hom (tmul c x y) = ψ.hom (tmul c x y)) : φ = ψ :=
  sorry

/-- **0.3** A balanced family of biadditive maps lifts to `G ⊗_C F`. -/
noncomputable def tensorLift {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} {X : AddCommGrpCat.{w}}
    (φ : ∀ c : C, G.obj.obj (op (op c)) →+ F.obj.obj (op c) →+ X)
    (hφ : ∀ ⦃c c' : C⦄ (f : c ⟶ c') (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c')),
      φ c x ((F.obj.map f.op).hom y) = φ c' ((G.obj.map f.op.op).hom x) y) :
    tensorObj G F ⟶ X :=
  sorry

theorem tensorLift_tmul {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} {X : AddCommGrpCat.{w}}
    (φ : ∀ c : C, G.obj.obj (op (op c)) →+ F.obj.obj (op c) →+ X)
    (hφ : ∀ ⦃c c' : C⦄ (f : c ⟶ c') (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c')),
      φ c x ((F.obj.map f.op).hom y) = φ c' ((G.obj.map f.op.op).hom x) y)
    (c : C) (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) :
    (tensorLift φ hφ).hom (tmul c x y) = φ c x y :=
  sorry

/-- **0.3** The tensor product as a bifunctor to abelian groups, covariant functors first. -/
noncomputable def tensor : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w} where
  obj G :=
    { obj F := tensorObj G F
      map _ := sorry
      map_id := sorry
      map_comp := sorry }
  map _ := { app _ := sorry, naturality := sorry }
  map_id := sorry
  map_comp := sorry

theorem tensor_map_app_tmul {G G' : ModCat.{w} Cᵒᵖ} (g : G ⟶ G') (F : ModCat.{w} C) (c : C)
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) :
    ((tensor.map g).app F).hom (tmul c x y) = tmul c ((g.hom.app (op (op c))).hom x) y :=
  sorry

theorem tensor_obj_map_tmul (G : ModCat.{w} Cᵒᵖ) {F F' : ModCat.{w} C} (f : F ⟶ F') (c : C)
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) :
    ((tensor.obj G).map f).hom (tmul c x y) = tmul c x ((f.hom.app (op c)).hom y) :=
  sorry

instance (G : ModCat.{w} Cᵒᵖ) : (tensor.obj G).Additive := sorry

instance (F : ModCat.{w} C) : (tensor.flip.obj F).Additive := sorry

/-- **0.3, adjunction** in the `Mod C` variable:
`Hom(G ⊗_C F, X) ≅ Hom_{Mod C}(F, Hom_ℤ(G(-), X))`. -/
noncomputable def tensorAdjunction (G : ModCat.{w} Cᵒᵖ) : tensor.obj G ⊣ homFunctor G :=
  sorry

/-- **0.3, adjunction** in the covariant variable: `Hom(G ⊗_C F, X) ≅ Hom(G, Hom_ℤ(F(-), X))`. -/
noncomputable def tensorAdjunction' (F : ModCat.{w} C) : tensor.flip.obj F ⊣ homOpFunctor F :=
  sorry

/-- **0.3, right exactness**: `G ⊗_C -` preserves colimits, from the adjunction. -/
theorem preservesColimits_tensor_obj (G : ModCat.{w} Cᵒᵖ) :
    PreservesColimitsOfSize.{w, w} (tensor.obj G) :=
  (tensorAdjunction G).leftAdjoint_preservesColimits

/-- **0.3, right exactness** in the covariant variable. -/
theorem preservesColimits_tensor_flip_obj (F : ModCat.{w} C) :
    PreservesColimitsOfSize.{w, w} (tensor.flip.obj F) :=
  (tensorAdjunction' F).leftAdjoint_preservesColimits

section Linear

variable (R : Type*) [CommRing R] [Linear R C]

/-- **0.3, the derived `R`-structure**: for an `R`-linear `C`, `G ⊗_C F` is an `R`-module, `r`
acting by `G ⊗_C (r • 𝟙 F)`, equivalently by `(r • 𝟙 G) ⊗_C F`. The pattern of Mathlib's
`Module R (Ext X Y n)` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean`), where `R`
is not part of the definition either. -/
noncomputable instance (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) : Module R (tensorObj G F) :=
  sorry

/-- **0.3** The action of `r` is the image of `r • 𝟙 F`, as Mathlib's
`Abelian.Ext.smul_eq_comp_mk₀`. -/
theorem smul_eq_tensor_obj_map {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R)
    (z : tensorObj G F) : r • z = ((tensor.obj G).map (r • 𝟙 F)).hom z :=
  sorry

/-- **0.3** The action of `r` is also the image of `r • 𝟙 G`. -/
theorem smul_eq_tensor_map_app {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R)
    (z : tensorObj G F) : r • z = ((tensor.map (r • 𝟙 G)).app F).hom z :=
  sorry

/-- **0.3** `r • (x ⊗ y) = (r x) ⊗ y`, with `r x = G(r • 𝟙 c) x`. -/
theorem smul_tmul {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R) (c : C)
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) :
    r • tmul c x y = tmul c ((G.obj.map (r • 𝟙 c).op.op).hom x) y :=
  sorry

/-- **0.3** `x ⊗ (r y) = r • (x ⊗ y)`, with `r y = F(r • 𝟙 c) y`. -/
theorem tmul_smul {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R) (c : C)
    (x : G.obj.obj (op (op c))) (y : F.obj.obj (op c)) :
    tmul c x ((F.obj.map (r • 𝟙 c).op).hom y) = r • tmul c x y :=
  sorry

/-- **0.3, adjunction over `R`**: `Hom_R(G ⊗_C F, X) ≃ Hom_{Mod C}(F, Hom_R(G(-), X))`,
`R`-linearly ([Mitchell, §6, p. 26, (2)], over a commutative base ring in [OR, (1.1), p. 93]). -/
noncomputable def tensorLinearHomEquiv (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C)
    (X : ModuleCat.{w} R) :
    (tensorObj G F →ₗ[R] X) ≃ₗ[R] (F ⟶ ((linearHomBifunctor R).obj (op G)).obj X) :=
  sorry

/-- **0.3, adjunction over `R`** in the covariant variable:
`Hom_R(G ⊗_C F, X) ≃ Hom(G, Hom_R(F(-), X))`. -/
noncomputable def tensorLinearHomEquiv' (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C)
    (X : ModuleCat.{w} R) :
    (tensorObj G F →ₗ[R] X) ≃ₗ[R] (G ⟶ ((linearHomOpBifunctor R).obj (op F)).obj X) :=
  sorry

end Linear

/-- **0.3, Yoneda**: `G ⊗_C Hom(-, X) ≅ G(X)` ([Mitchell, §6, p. 26, (1)]); `R`-linear for an
`R`-linear `C`. -/
noncomputable def tensorObjYonedaIso {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] (G : ModCat.{v} Cᵒᵖ) (X : C) :
    tensorObj G ((ModCat.yoneda C).obj X) ≅ G.obj.obj (op (op X)) :=
  sorry

/-- **0.3, Yoneda**: `Hom(X, -) ⊗_C F ≅ F(X)`. -/
noncomputable def yonedaTensorObjIso {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] (X : C) (F : ModCat.{v} C) :
    tensorObj ((ModCat.yoneda Cᵒᵖ).obj (op X)) F ≅ F.obj.obj (op X) :=
  sorry

/-- **0.3** `tensorObjYonedaIso` on pure tensors: `x ⊗ f ↦ G(f) x` for `f : c ⟶ X`. -/
@[simp]
theorem tensorObjYonedaIso_hom_tmul {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] (G : ModCat.{v} Cᵒᵖ) (X c : C) (x : G.obj.obj (op (op c)))
    (f : c ⟶ X) :
    (tensorObjYonedaIso G X).hom.hom (tmul (F := (ModCat.yoneda C).obj X) c x f) =
      (G.obj.map f.op.op).hom x :=
  sorry

/-- **0.3** `yonedaTensorObjIso` on pure tensors: `f ⊗ y ↦ F(f) y` for `f : X ⟶ c`. -/
@[simp]
theorem yonedaTensorObjIso_hom_tmul {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] (X : C) (F : ModCat.{v} C) (c : C) (f : X ⟶ c)
    (y : F.obj.obj (op c)) :
    (yonedaTensorObjIso X F).hom.hom (tmul (G := (ModCat.yoneda Cᵒᵖ).obj (op X)) c f.op y) =
      (F.obj.map f.op).hom y :=
  sorry

/-- **0.3, quotients by a right ideal at one object** ([OR, Lemma 1.2, p. 94], stated for a
covariant module and an ideal of `Hom(-, X)`, applied to `Cᵒᵖ`): for a subfunctor
`S ⊆ Hom(X, -)`, `(Hom(X, -) ⧸ S) ⊗_C M ≅ M(X) ⧸ (S · M)(X)`, where `(S · M)(X)` is generated by
the `M(f)(x)` with `f ∈ S`; right exactness and Yoneda. The Lazard block (2.3) uses it for the
right ideal generated by finitely many `β_j`. -/
noncomputable def tensorObjCokernelIso {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] {X : C} (S : Subobject ((ModCat.yoneda Cᵒᵖ).obj (op X)))
    (M : ModCat.{v} C) :
    tensorObj (cokernel S.arrow) M ≅
      AddCommGrpCat.of (M.obj.obj (op X) ⧸ AddSubgroup.closure
        {y | ∃ (d : C) (f : X ⟶ d) (_ : f ∈ (RightMorphismIdeal.ofSubobject S).hom X d)
          (x : M.obj.obj (op d)), (M.obj.map f.op).hom x = y}) :=
  sorry

/-- **0.3, quotients by a two-sided ideal**: `(C ⧸ I)(X, -) ⊗_C M ≅ (M ⧸ I · M)(X)`, the case of the
previous item for the part of `I` at `X`. Used by 4.6. -/
noncomputable def tensorObjQuotientYonedaIso {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] (I : TauCeti.MorphismIdeal C) (X : C) (M : ModCat.{v} C) :
    tensorObj (MorphismIdeal.quotientYoneda I.op (op X)) M ≅
      ((I : LeftMorphismIdeal C).quotientSmul M).obj.obj (op X) :=
  sorry

/-! ### 0.4 Projective factors -/

/-- **0.4** Tensoring with a projective covariant functor preserves monomorphisms. -/
theorem mono_tensor_obj_map_of_projective (G : ModCat.{w} Cᵒᵖ) [Projective G]
    {F F' : ModCat.{w} C} (f : F ⟶ F') [Mono f] : Mono ((tensor.obj G).map f) :=
  sorry

/-- **0.4** Tensoring with a projective module of `Mod C` preserves monomorphisms. -/
theorem mono_tensor_map_app_of_projective (F : ModCat.{w} C) [Projective F]
    {G G' : ModCat.{w} Cᵒᵖ} (g : G ⟶ G') [Mono g] : Mono ((tensor.map g).app F) :=
  sorry

end ModCat

/-! ### 0.5 The swap -/

/-- **0.5** `Mod C ≌ Mod Cᵒᵖᵒᵖ`, induced by Mathlib's `opOpEquivalence`: a `C`-module is a covariant
functor on `Cᵒᵖ`. An equivalence, so that it preserves and reflects exactness, projectivity and
the dimensions, and suprema over `Mod Cᵒᵖᵒᵖ` are suprema over `Mod C`. -/
noncomputable def ModCat.opOpEquiv (C : Type u) [Category.{v} C] [Preadditive C] :
    ModCat.{w} C ≌ ModCat.{w} Cᵒᵖᵒᵖ :=
  sorry

/-- **0.5, swap**: `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`, with `G` a module over `Cᵒᵖ` as it stands and `F` a
covariant functor on `Cᵒᵖ` through `ModCat.opOpEquiv`; `R`-linear for an `R`-linear `C`. -/
noncomputable def ModCat.tensorObjSwapIso [EssentiallySmall.{w} C]
    (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) :
    ModCat.tensorObj G F ≅ ModCat.tensorObj ((ModCat.opOpEquiv C).functor.obj F) G :=
  sorry

end Tensor

/-! ### 0.6 Rings: the balanced tensor product -/

section MatlisDual

variable (R : Type u) [CommRing R] (E : Type v) [AddCommGroup E] [Module R E]
  (N : Type w) [AddCommGroup N] [Module R N]

/-- **0.6, duals** The Matlis dual `Hom_R(N, E)` of an `R`-module `N`, a type synonym of
`N →ₗ[R] E`, so that the action of `A` on `N` by precomposition is kept apart from the action on
the values. For a left `A`-module `N` it is a right `A`-module. With `R = ℤ` and
`E = AddCircle (1 : ℚ)` (that is, `ℚ ⧸ ℤ`) it is the character module `N⁺`, with its right
`A`-module structure. -/
def MatlisDual : Type _ := N →ₗ[R] E

instance : AddCommGroup (MatlisDual R E N) := inferInstanceAs (AddCommGroup (N →ₗ[R] E))

instance : Module R (MatlisDual R E N) := inferInstanceAs (Module R (N →ₗ[R] E))

/-- **0.6** The dual of a left `A`-module is a right `A`-module, `(φ a)(n) = φ (a n)`; of low
priority, so that the action of `R` on the values is preferred when `A = R`. -/
instance (priority := low) {A : Type t} [Ring A] [Algebra R A] [Module A N] [IsScalarTower R A N] :
    Module Aᵐᵒᵖ (MatlisDual R E N) :=
  sorry

instance {A : Type t} [Ring A] [Algebra R A] [Module A N] [IsScalarTower R A N] :
    IsScalarTower R Aᵐᵒᵖ (MatlisDual R E N) :=
  sorry

end MatlisDual

namespace BalancedTensorProduct

section Maps

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A]
  {M M' M'' : Type*} [AddCommGroup M] [Module Aᵐᵒᵖ M] [Module R M] [IsScalarTower R Aᵐᵒᵖ M]
  [AddCommGroup M'] [Module Aᵐᵒᵖ M'] [Module R M'] [IsScalarTower R Aᵐᵒᵖ M']
  [AddCommGroup M''] [Module Aᵐᵒᵖ M''] [Module R M''] [IsScalarTower R Aᵐᵒᵖ M'']
  {N N' N'' : Type*} [AddCommGroup N] [Module A N] [Module R N] [IsScalarTower R A N]
  [AddCommGroup N'] [Module A N'] [Module R N'] [IsScalarTower R A N']
  [AddCommGroup N''] [Module A N''] [Module R N''] [IsScalarTower R A N'']

variable (N) in
/-- **0.6** `f ⊗ N : M ⊗_A N → M' ⊗_A N`, `R`-linear, named after Mathlib's
`LinearMap.rTensor`. -/
def rTensor (f : M →ₗ[Aᵐᵒᵖ] M') :
    TauCeti.BalancedTensorProduct R A M N →ₗ[R] TauCeti.BalancedTensorProduct R A M' N :=
  TauCeti.BalancedTensorProduct.map (f.restrictScalars R) LinearMap.id
    (fun a m ↦ f.map_smul (op a) m) (fun _ _ ↦ rfl)

variable (M) in
/-- **0.6** `M ⊗ g : M ⊗_A N → M ⊗_A N'`, `R`-linear, named after Mathlib's
`LinearMap.lTensor`. -/
def lTensor (g : N →ₗ[A] N') :
    TauCeti.BalancedTensorProduct R A M N →ₗ[R] TauCeti.BalancedTensorProduct R A M N' :=
  TauCeti.BalancedTensorProduct.map LinearMap.id (g.restrictScalars R)
    (fun _ _ ↦ rfl) (fun a n ↦ g.map_smul a n)

omit [IsScalarTower R A N] in
@[simp]
theorem rTensor_tmul (f : M →ₗ[Aᵐᵒᵖ] M') (m : M) (n : N) :
    rTensor R N f (TauCeti.BalancedTensorProduct.tmul R A m n) =
      TauCeti.BalancedTensorProduct.tmul R A (f m) n :=
  TauCeti.BalancedTensorProduct.map_tmul _ _ _ _ m n

omit [IsScalarTower R Aᵐᵒᵖ M] in
@[simp]
theorem lTensor_tmul (g : N →ₗ[A] N') (m : M) (n : N) :
    lTensor R M g (TauCeti.BalancedTensorProduct.tmul R A m n) =
      TauCeti.BalancedTensorProduct.tmul R A m (g n) :=
  TauCeti.BalancedTensorProduct.map_tmul _ _ _ _ m n

omit [IsScalarTower R A N] in
theorem rTensor_id : rTensor R N (LinearMap.id : M →ₗ[Aᵐᵒᵖ] M) = LinearMap.id :=
  TauCeti.BalancedTensorProduct.hom_ext fun _ _ ↦ by simp

omit [IsScalarTower R A N] in
theorem rTensor_comp (f : M →ₗ[Aᵐᵒᵖ] M') (f' : M' →ₗ[Aᵐᵒᵖ] M'') :
    rTensor R N (f' ∘ₗ f) = rTensor R N f' ∘ₗ rTensor R N f :=
  TauCeti.BalancedTensorProduct.hom_ext fun _ _ ↦ by simp

omit [IsScalarTower R Aᵐᵒᵖ M] in
theorem lTensor_id : lTensor R M (LinearMap.id : N →ₗ[A] N) = LinearMap.id :=
  TauCeti.BalancedTensorProduct.hom_ext fun _ _ ↦ by simp

omit [IsScalarTower R Aᵐᵒᵖ M] in
theorem lTensor_comp (g : N →ₗ[A] N') (g' : N' →ₗ[A] N'') :
    lTensor R M (g' ∘ₗ g) = lTensor R M g' ∘ₗ lTensor R M g :=
  TauCeti.BalancedTensorProduct.hom_ext fun _ _ ↦ by simp

theorem rTensor_comp_lTensor (f : M →ₗ[Aᵐᵒᵖ] M') (g : N →ₗ[A] N') :
    rTensor R N' f ∘ₗ lTensor R M g = lTensor R M' g ∘ₗ rTensor R N f :=
  TauCeti.BalancedTensorProduct.hom_ext fun _ _ ↦ by simp

/-- **0.6, right exactness** in the right-module variable. -/
theorem rTensor_exact {f : M →ₗ[Aᵐᵒᵖ] M'} {g : M' →ₗ[Aᵐᵒᵖ] M''} (hfg : Function.Exact f g)
    (hg : Function.Surjective g) : Function.Exact (rTensor R N f) (rTensor R N g) :=
  sorry

/-- **0.6** Tensoring preserves surjections in the right-module variable. -/
theorem rTensor_surjective {g : M' →ₗ[Aᵐᵒᵖ] M''} (hg : Function.Surjective g) :
    Function.Surjective (rTensor R N g) :=
  sorry

/-- **0.6, right exactness** in the left-module variable. -/
theorem lTensor_exact {f : N →ₗ[A] N'} {g : N' →ₗ[A] N''} (hfg : Function.Exact f g)
    (hg : Function.Surjective g) : Function.Exact (lTensor R M f) (lTensor R M g) :=
  sorry

/-- **0.6** Tensoring preserves surjections in the left-module variable. -/
theorem lTensor_surjective {g : N' →ₗ[A] N''} (hg : Function.Surjective g) :
    Function.Surjective (lTensor R M g) :=
  sorry

/-- **0.6** Tensoring with a projective right module preserves injections (0.4). -/
theorem lTensor_injective_of_projective [Module.Projective Aᵐᵒᵖ M] {g : N →ₗ[A] N'}
    (hg : Function.Injective g) : Function.Injective (lTensor R M g) :=
  sorry

/-- **0.6** Tensoring with a projective left module preserves injections (0.4). -/
theorem rTensor_injective_of_projective [Module.Projective A N] {f : M →ₗ[Aᵐᵒᵖ] M'}
    (hf : Function.Injective f) : Function.Injective (rTensor R N f) :=
  sorry

variable (M N) in
/-- **0.6, independence of `R`**: the `ℤ`- and `R`-balanced tensor products have the same
underlying group, `m ⊗ n ↦ m ⊗ n`. -/
noncomputable def intAddEquiv :
    TauCeti.BalancedTensorProduct ℤ A M N ≃+ TauCeti.BalancedTensorProduct R A M N :=
  sorry

variable (M N) in
/-- **0.6, change of base** along `R → R'` for `R'`-modules: `m ⊗ n ↦ m ⊗ n`, `R`-linear (stated
here on underlying groups). -/
noncomputable def changeBaseAddEquiv (R' : Type*) [CommRing R'] [Algebra R R'] [Algebra R' A]
    [IsScalarTower R R' A] [Module R' M] [IsScalarTower R' Aᵐᵒᵖ M] [IsScalarTower R R' M]
    [Module R' N] [IsScalarTower R' A N] [IsScalarTower R R' N] :
    TauCeti.BalancedTensorProduct R A M N ≃+ TauCeti.BalancedTensorProduct R' A M N :=
  sorry

variable (M N) in
/-- **0.6, swap**: `M ⊗_A N ≃ N ⊗_{Aᵐᵒᵖ} M`, `m ⊗ n ↦ n ⊗ m`, with `N` a right
`Aᵐᵒᵖ`-module through `RingEquiv.opOp A`. -/
noncomputable def comm :
    letI : Module Aᵐᵒᵖᵐᵒᵖ N := Module.compHom N (RingEquiv.opOp A).symm.toRingHom
    TauCeti.BalancedTensorProduct R A M N ≃ₗ[R] TauCeti.BalancedTensorProduct R Aᵐᵒᵖ N M :=
  sorry

variable (M N) in
/-- **0.6, duals** (0.7 for rings): `Hom_R(M ⊗_A N, E) ≃ Hom_{Aᵐᵒᵖ}(M, Hom_R(N, E))`, with
`MatlisDual R E N` as the right module `Hom_R(N, E)`. -/
noncomputable def homEquiv (E : Type*) [AddCommGroup E] [Module R E] :
    (TauCeti.BalancedTensorProduct R A M N →ₗ[R] E) ≃ₗ[R]
      (M →ₗ[Aᵐᵒᵖ] MatlisDual R E N) :=
  sorry

end Maps

section CharacterModule

variable {A : Type u} [Ring A]
  {M M' : Type*} [AddCommGroup M] [Module Aᵐᵒᵖ M] [AddCommGroup M'] [Module Aᵐᵒᵖ M']
  {N : Type*} [AddCommGroup N] [Module A N]

/-- **0.7 for rings, Lambek's criterion for one map** (`R = ℤ`, `E = ℚ ⧸ ℤ`): `f ⊗ N` is
injective exactly when composition with `f` is onto on maps into the right module
`N⁺ = MatlisDual ℤ (AddCircle (1 : ℚ)) N`. -/
theorem rTensor_injective_iff_surjective_comp (f : M →ₗ[Aᵐᵒᵖ] M') :
    Function.Injective (rTensor ℤ N f) ↔
      Function.Surjective fun φ : M' →ₗ[Aᵐᵒᵖ] MatlisDual ℤ (AddCircle (1 : ℚ)) N ↦ φ ∘ₗ f :=
  sorry

end CharacterModule

/-- **0.6, commutative rings**: for a commutative ring, with `M` a right module through the same
action (`IsCentralScalar`), the balanced tensor product is Mathlib's tensor product. -/
noncomputable def equivTensorProduct {R : Type u} [CommRing R] (M N : Type*) [AddCommGroup M]
    [Module R M] [Module Rᵐᵒᵖ M] [IsCentralScalar R M] [AddCommGroup N] [Module R N] :
    TauCeti.BalancedTensorProduct R R M N ≃ₗ[R] M ⊗[R] N :=
  sorry

@[simp]
theorem equivTensorProduct_tmul {R : Type u} [CommRing R] {M N : Type*} [AddCommGroup M]
    [Module R M] [Module Rᵐᵒᵖ M] [IsCentralScalar R M] [AddCommGroup N] [Module R N] (m : M)
    (n : N) :
    equivTensorProduct M N (TauCeti.BalancedTensorProduct.tmul R R m n) = m ⊗ₜ[R] n :=
  sorry

/-- **0.6** The `R`-module structure of a bundled module over an `R`-algebra `B`, through
`algebraMap R B`: a local instance for the bifunctor below. -/
abbrev moduleOfAlgebra (R : Type u) [CommRing R] {B : Type v} [Ring B] [Algebra R B]
    (M : ModuleCat.{w} B) : Module R M :=
  Module.compHom M (algebraMap R B)

attribute [local instance] moduleOfAlgebra in
theorem isScalarTower_moduleOfAlgebra (R : Type u) [CommRing R] {B : Type v} [Ring B]
    [Algebra R B] (M : ModuleCat.{w} B) : IsScalarTower R B M :=
  IsScalarTower.of_algebraMap_smul fun _ _ ↦ rfl

section Functor

attribute [local instance] moduleOfAlgebra isScalarTower_moduleOfAlgebra

variable (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A]

/-- **0.6** The balanced tensor product as a bifunctor
`ModuleCat Aᵐᵒᵖ ⥤ ModuleCat A ⥤ ModuleCat R`; the `R`-actions on bundled modules are the actions
through `algebraMap` (`moduleOfAlgebra`). -/
noncomputable def functor : ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R where
  obj M :=
    { obj N := ModuleCat.of R (TauCeti.BalancedTensorProduct R A M N)
      map g := ModuleCat.ofHom (lTensor R M g.hom)
      map_id _ := ModuleCat.hom_ext (lTensor_id R)
      map_comp f g := ModuleCat.hom_ext (lTensor_comp R f.hom g.hom) }
  map f :=
    { app N := ModuleCat.ofHom (rTensor R N f.hom)
      naturality _ _ g := ModuleCat.hom_ext (rTensor_comp_lTensor R f.hom g.hom) }
  map_id _ := NatTrans.ext (funext fun _ ↦ ModuleCat.hom_ext (rTensor_id R))
  map_comp f g := NatTrans.ext (funext fun _ ↦ ModuleCat.hom_ext (rTensor_comp R f.hom g.hom))

/-- **0.6** The bifunctor is additive in the left-module variable. -/
instance (M : ModuleCat.{v} Aᵐᵒᵖ) : ((functor R A).obj M).Additive :=
  sorry

/-- **0.6** The bifunctor is additive in the right-module variable. -/
instance (N : ModuleCat.{v} A) : ((functor R A).flip.obj N).Additive :=
  sorry

/-- **0.6** `X ↦ Hom_R(N, X)` as a right `A`-module (`MatlisDual R X N`). -/
noncomputable def homRight (N : ModuleCat.{v} A) : ModuleCat.{v} R ⥤ ModuleCat.{v} Aᵐᵒᵖ where
  obj X := ModuleCat.of Aᵐᵒᵖ (MatlisDual R X N)
  map _ := sorry
  map_id := sorry
  map_comp := sorry

/-- **0.6, adjunction**: `- ⊗_A N ⊣ Hom_R(N, -)`; right exactness follows. -/
noncomputable def adjunction (N : ModuleCat.{v} A) : (functor R A).flip.obj N ⊣ homRight R A N :=
  sorry

end Functor

/-- **0.6, comparison**: the categorical tensor product over `SingleObj Aᵐᵒᵖ` (0.3) of the modules
of 0.2 is the balanced tensor product over `ℤ`, in the same order; for an `R`-algebra `A` it is
`R`-linear, with `intAddEquiv` and the agreement of the derived `R`-structures (0.2). -/
noncomputable def tensorObjSingleObjIso {A : Type u} [Ring A] [Small.{v} A]
    (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    ModCat.tensorObj ((moduleCatMulOppositeEquivModCatOp.{v} A).functor.obj M)
        ((moduleCatEquivModCat.{v} A).functor.obj N) ≅
      AddCommGrpCat.of (TauCeti.BalancedTensorProduct ℤ A M N) :=
  sorry

end BalancedTensorProduct

/-! ### 0.7 Duals with respect to an `R`-module `E` -/

section Dual

variable (R : Type*) [CommRing R] {C : Type u} [Category.{v} C] [Preadditive C] [Linear R C]
  (E : ModuleCat.{w} R)

/-- **0.7** `F ↦ F^E = Hom_R(F(-), E)`, from `Mod C` to covariant functors (modules over `Cᵒᵖ`). -/
noncomputable abbrev ModCat.dual : (ModCat.{w} C)ᵒᵖ ⥤ ModCat.{w} Cᵒᵖ :=
  (ModCat.linearHomOpBifunctor R).flip.obj E

/-- **0.7** `G ↦ G^E = Hom_R(G(-), E)`, from covariant functors to `Mod C`. -/
noncomputable abbrev ModCat.dualOp : (ModCat.{w} Cᵒᵖ)ᵒᵖ ⥤ ModCat.{w} C :=
  (ModCat.linearHomBifunctor R).flip.obj E

instance : (ModCat.dual R E (C := C)).Additive := sorry

/-- **0.7** For an injective `E`, the dual is exact. -/
theorem ModCat.dual_shortExact [Injective E] {S : ShortComplex (ModCat.{w} C)}
    (hS : S.ShortExact) : (S.op.map (ModCat.dual R E)).ShortExact :=
  sorry

/-- **0.7** For a cogenerator `E`, the dual detects zero objects. -/
theorem ModCat.isZero_of_isZero_dual (hE : IsCoseparator E) (F : ModCat.{w} C)
    (h : IsZero ((ModCat.dual R E).obj (op F))) : IsZero F :=
  sorry

/-- **0.7, one-map form of Lambek's criterion**: for an injective cogenerator `E`, `i ⊗_C F` is a
monomorphism exactly when every map `G ⟶ F^E` extends along `i`. Through `tensorLinearHomEquiv'`
the right side is surjectivity of `Hom_R(i ⊗_C F, E)`: injectivity of `E` gives the forward
implication and the cogenerator property the converse. With a cogenerator alone the statement is
false: over `ℤ`, `E = ℚ ⧸ ℤ ⊕ ℤ`, `F = ℤ` and `i` multiplication by `2` on `ℤ`. -/
theorem ModCat.mono_tensor_map_app_iff [EssentiallySmall.{w} C] [Injective E]
    (hE : IsCoseparator E) {G G' : ModCat.{w} Cᵒᵖ} (i : G ⟶ G') (F : ModCat.{w} C) :
    Mono ((ModCat.tensor.map i).app F) ↔
      Function.Surjective fun φ : G' ⟶ (ModCat.dual R E).obj (op F) ↦ i ≫ φ :=
  sorry

end Dual

/-! ### 0.8 Finitely generated projective modules, duality and finite presentation -/

/-- `ℵ₁` is regular (Mathlib's `Cardinal.isRegular_aleph_one`): the local instance that
`IsCardinalPresentable` needs for the countably presented modules of 0.8, 2.5, 3.5 and 4.5, so that
their statements carry no `Fact` binder. -/
local instance fact_isRegular_aleph_one : Fact (Cardinal.aleph.{t} 1).IsRegular :=
  ⟨Cardinal.isRegular_aleph_one⟩

attribute [local instance] Cardinal.fact_isRegular_aleph0

section Proj

variable {C : Type u} [Category.{v} C] [Preadditive C]

variable (C) in
/-- **0.8** `proj C`: the finitely generated (0.1) projective modules of `Mod C`, so that
`C ⊆ proj C` covariantly by Yoneda. For `C = SingleObj Aᵐᵒᵖ` these are Tau Ceti's
`TauCeti.finiteProjectiveModules A` (`finiteProjectiveModulesEquivProj`). The finitely generated
projective covariant functors are `proj Cᵒᵖ`. -/
def ModCat.proj : ObjectProperty (ModCat.{v} C) :=
  fun F ↦ Projective F ∧ IsFinitelyGeneratedFunctor F.obj

/-- **0.8** Finitely generated projective modules are closed under finite biproducts. -/
instance : HasFiniteBiproducts (ModCat.proj C).FullSubcategory := sorry

/-- **0.8** Idempotents split in `proj C`: a retract of a finitely generated projective module is
finitely generated projective. -/
instance : IsIdempotentComplete (ModCat.proj C).FullSubcategory := sorry

/-- **0.8** Representable modules are finitely generated projective. -/
theorem ModCat.proj_yoneda_obj (X : C) : ModCat.proj C ((ModCat.yoneda C).obj X) :=
  sorry

/-- **0.8** Finite sums of representables are finitely generated projective. -/
theorem ModCat.proj_sigma_yoneda {q : ℕ} (Y : Fin q → C) :
    ModCat.proj C (∐ fun j ↦ (ModCat.yoneda C).obj (Y j)) :=
  sorry

/-- **0.8** `proj C` consists of the retracts of finite sums of representables. -/
theorem ModCat.proj_iff_exists_retract (P : ModCat.{v} C) :
    ModCat.proj C P ↔ ∃ (n : ℕ) (Y : Fin n → C),
      Nonempty (Retract P (∐ fun i ↦ (ModCat.yoneda C).obj (Y i))) :=
  sorry

variable (C) in
/-- **0.8, Yoneda** `C ⥤ proj C`, `X ↦ Hom(-, X)`; fully faithful, so `End Hom(-, X) = End X`. Over
`Cᵒᵖ` it gives `X ↦ Hom(X, -)` in `proj Cᵒᵖ`. -/
def ModCat.projYoneda : C ⥤ (ModCat.proj C).FullSubcategory :=
  ObjectProperty.lift _ (ModCat.yoneda C) ModCat.proj_yoneda_obj

instance : (ModCat.projYoneda C).Full := sorry

instance : (ModCat.projYoneda C).Faithful := sorry

variable (C) in
/-- **0.8** `proj C ≌ Karoubi (Mat_ C)`: every finitely generated projective module is a summand of
a finite sum of representables, and Yoneda is fully faithful. Tau Ceti's
the one-object case is the comparison of `add M` with the finitely generated projective
`End M`-modules. -/
noncomputable def ModCat.projEquivKaroubiMat :
    (ModCat.proj C).FullSubcategory ≌ CategoryTheory.Idempotents.Karoubi (Mat_ C) :=
  sorry

/-- **0.8** For an additive, idempotent-complete `C`, Yoneda `C ⥤ proj C` is an equivalence. -/
instance [HasFiniteBiproducts C] [IsIdempotentComplete C] : (ModCat.projYoneda C).IsEquivalence :=
  sorry

variable (C) in
/-- **0.8, duality** `(-)^∨ = Hom(-, C) : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`, `Hom(-, X) ↦ Hom(X, -)`. Built
from the two Karoubi equivalences and `(Mat_ C)ᵒᵖ ≌ Mat_ Cᵒᵖ` (transposed matrices). -/
noncomputable def ModCat.projDual :
    (ModCat.proj C).FullSubcategoryᵒᵖ ≌ (ModCat.proj Cᵒᵖ).FullSubcategory :=
  sorry

/-- **0.8** The dual of `Hom(-, X)` is `Hom(X, -)`. -/
noncomputable def ModCat.projDualYonedaIso (X : C) :
    (ModCat.projDual C).functor.obj (op ((ModCat.projYoneda C).obj X)) ≅
      (ModCat.projYoneda Cᵒᵖ).obj (op X) :=
  sorry

/-- **0.8, the property that pins the dual down**: `Hom(P, F) ≅ P^∨ ⊗_C F`, natural in `P ∈ proj C`
and in `F`; at `P = Hom(-, X)` it is Yoneda on both sides (0.3). The route of 1.4 uses it. -/
noncomputable def ModCat.homAddEquivTensorObjProjDual [EssentiallySmall.{v} C]
    (P : (ModCat.proj C).FullSubcategory) (F : ModCat.{v} C) :
    (P.obj ⟶ F) ≃+ ModCat.tensorObj ((ModCat.projDual C).functor.obj (op P)).obj F :=
  sorry

/-- **0.8, finite presentation: the bridge**. For `F` in `Mod C`, with `C` essentially `v`-small
and values in the universe `v`, the following are equivalent: (1) `F` is the cokernel of a map in
`proj C`; (2) `F` is finitely presented in the sense of 0.1 (finite sums of representables); (3)
`F` is finitely presentable in Mathlib's sense (`IsFinitelyPresentable`, commutation of `Hom(F, -)`
with filtered colimits). (3) ⇒ (2): by `isCardinalFilteredGenerator_isFinitelyPresentedFunctor`
and Mathlib's `IsCardinalFilteredGenerator.isPresentable_eq_retractClosure`, a finitely
presentable module is a retract of a finitely presented one, and `retractClosure_eq_self` with the
instance `IsStableUnderRetracts` of 0.1 concludes. For rings,
`isFinitelyPresentedFunctor_iff_finitePresentation` adds `Module.FinitePresentation`. -/
theorem ModCat.isFinitelyPresentedFunctor_tfae [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    List.TFAE
      [∃ (P₁ P₀ : (ModCat.proj C).FullSubcategory) (f : P₁ ⟶ P₀), Nonempty (cokernel f.hom ≅ F),
        IsFinitelyPresentedFunctor F.obj,
        IsFinitelyPresentable.{v} F] :=
  sorry

/-- **0.8, finite generation**: a quotient of a finite sum of representables is a quotient of a
finitely generated projective, and conversely. -/
theorem ModCat.isFinitelyGeneratedFunctor_iff_exists_epi_proj (F : ModCat.{v} C) :
    IsFinitelyGeneratedFunctor F.obj ↔
      ∃ (P : (ModCat.proj C).FullSubcategory) (p : P.obj ⟶ F), Epi p :=
  sorry

/-- **0.8** Every module is a filtered colimit of finitely presented modules, and these are
finitely presentable ([CB, §1.2, Theorem, p. 1645], for additive `C`): the finitely presented
modules form an `ℵ₀`-filtered generator of `Mod C`, in Mathlib's sense. Route: the representables
are finitely presentable (Yoneda, colimits computed objectwise) and form a strong generator, since
every epimorphism of `Mod C` is extremal (Mathlib's `isStrongGenerator_iff_exists_extremalEpi`);
Mathlib's `IsStrongGenerator.isDense_colimitsCardinalClosure_ι` then writes every module as a
filtered colimit of finite colimits of representables, and these are finitely presented (0.1). -/
theorem ModCat.isCardinalFilteredGenerator_isFinitelyPresentedFunctor [EssentiallySmall.{v} C] :
    ((isFinitelyPresentedFunctor C).inverseImage (AdditiveFunctor.forget Cᵒᵖ AddCommGrpCat.{v})
      ).IsCardinalFilteredGenerator Cardinal.aleph0.{v} :=
  sorry

/-- **0.8** `Mod C` is locally finitely presentable, a corollary of
`isCardinalFilteredGenerator_isFinitelyPresentedFunctor` (the generator is essentially small, and
`Mod C` is cocomplete). -/
instance [EssentiallySmall.{v} C] : IsLocallyFinitelyPresentable.{v} (ModCat.{v} C) :=
  sorry

/-- **0.8, countable presentations**: `F` is `ℵ₁`-presentable exactly when it is the cokernel of a
map between countable sums of representables. Bass's modules (2.5) are of this form; Theorem P
(3′) and Jensen's theorem (3.5) use it. -/
theorem ModCat.isCardinalPresentable_aleph_one_iff [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    IsCardinalPresentable F (Cardinal.aleph.{v} 1) ↔
      ∃ (ι κ : Type) (_ : Countable ι) (_ : Countable κ) (Y : κ → C) (Z : ι → C)
        (f : (∐ fun j ↦ (ModCat.yoneda C).obj (Y j)) ⟶ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i)),
        Nonempty (cokernel f ≅ F) :=
  sorry

end Proj

/-- **0.8, rings** Finitely generated projective modules have finite biproducts. -/
instance (A : Type u) [Ring A] :
    HasFiniteBiproducts (TauCeti.finiteProjectiveModules A).FullSubcategory :=
  sorry

/-- **0.8, rings** Tau Ceti's finitely generated projective left modules are `proj` of
`SingleObj Aᵐᵒᵖ`, through 0.2: the ring case of `proj C`, used by the ring items of 4.2. -/
noncomputable def finiteProjectiveModulesEquivProj (A : Type u) [Ring A] :
    (TauCeti.finiteProjectiveModules A).FullSubcategory ≌
      (ModCat.proj (SingleObj Aᵐᵒᵖ)).FullSubcategory :=
  sorry

/-- **0.8, rings** `Hom_A(-, A)` from finitely generated projective left modules to finitely
generated projective right modules (Tau Ceti's `TauCeti.finiteProjectiveModules`); the ring case of
`ModCat.projDual`. Mathlib's `Module.Dual A P` is defined over any semiring, but its API is
commutative; Tau Ceti's `TauCeti.AuslanderReitenTranspose` already uses it as a right module. -/
noncomputable def finiteProjectiveModulesDual (A : Type u) [Ring A] :
    (TauCeti.finiteProjectiveModules A).FullSubcategoryᵒᵖ ≌
      (TauCeti.finiteProjectiveModules Aᵐᵒᵖ).FullSubcategory :=
  sorry

/-- **0.8, rings: the bridge, item (4)**: over `SingleObj Aᵐᵒᵖ`, finite presentation in the sense
of 0.1 is `Module.FinitePresentation`. -/
theorem isFinitelyPresentedFunctor_iff_finitePresentation (A : Type u) [Ring A]
    (M : ModuleCat.{u} A) :
    IsFinitelyPresentedFunctor ((moduleCatEquivModCat.{u} A).functor.obj M).obj ↔
      Module.FinitePresentation A M :=
  sorry

/-- **0.8, rings** Finite generation in the sense of 0.1 is `Module.Finite`. -/
theorem isFinitelyGeneratedFunctor_iff_finite (A : Type u) [Ring A] (M : ModuleCat.{u} A) :
    IsFinitelyGeneratedFunctor ((moduleCatEquivModCat.{u} A).functor.obj M).obj ↔
      Module.Finite A M :=
  sorry

/-- **0.8, rings** Every module is a filtered colimit of finitely presented modules: the
finitely presented modules form an `ℵ₀`-filtered generator of `ModuleCat A`
(`isCardinalFilteredGenerator_isFinitelyPresentedFunctor` at `SingleObj Aᵐᵒᵖ`, through 0.2). -/
theorem ModuleCat.isCardinalFilteredGenerator_finitePresentation (A : Type u) [Ring A]
    [Small.{v} A] :
    ObjectProperty.IsCardinalFilteredGenerator
      (fun M : ModuleCat.{v} A ↦ Module.FinitePresentation A M) Cardinal.aleph0.{v} :=
  sorry

/-- **0.8, rings** Mathlib's categorical finite presentability in `ModuleCat A` is
`Module.FinitePresentation`. -/
theorem ModuleCat.isFinitelyPresentable_iff_finitePresentation (A : Type u) [Ring A]
    [Small.{v} A] (M : ModuleCat.{v} A) :
    IsFinitelyPresentable.{v} M ↔ Module.FinitePresentation A M :=
  sorry

/-! ## Layer 1: `Tor`

`Tor` is category-primary. `Tor^C_n(G, -)` is Mathlib's classical `Functor.leftDerived` of
`F ↦ G ⊗_C F`, derived in the `Mod C` variable, as Mathlib's `CategoryTheory.Tor`; it takes values
in abelian groups, with `Module R` instances for an `R`-linear `C`. There is one `Tor`: the version
that resolves the covariant functor `G` is `Tor` over `Cᵒᵖ` through the swap of 0.5. For rings,
`BalancedTor R A n` is the left derived functor of the ring bifunctor of 0.6, compared with `Tor`
over `SingleObj Aᵐᵒᵖ` at `R = ℤ`. For finitely presented `X`, the stable `Hom(X, N)` is
`Tor_1(Tr X, N)` (1.4). -/

/-! ### 1.1 Definition -/

namespace ModCat

section Tor

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{w} C]

/-- **1.1** `Tor^C_n(G, F)`: the `n`-th left derived functor of `F ↦ G ⊗_C F` (Mathlib's
classical `Functor.leftDerived`, as in `CategoryTheory.Tor`), a bifunctor to abelian groups, with
the covariant functor first. -/
noncomputable def tor (n : ℕ) : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w} where
  obj G := (tensor.obj G).leftDerived n
  map g := NatTrans.leftDerived (tensor.map g) n

/-- **1.1** `Tor₀` is the tensor product: `Functor.leftDerivedZeroIsoSelf` and right exactness
(0.3). -/
noncomputable def torZeroIso :
    (tor (C := C) 0 : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w}) ≅ tensor :=
  sorry

/-- **1.1** `Tor_{n+1}(G, F) = 0` for a projective `F` in `Mod C`. -/
theorem isZero_tor_succ_of_projective (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) [Projective F]
    (n : ℕ) : IsZero (((tor (n + 1)).obj G).obj F) :=
  Functor.isZero_leftDerived_obj_projective_succ _ _ _

/-- **1.1** `Tor` from any projective resolution `P` of `F` in `Mod C`: the homology of
`G ⊗_C P`. -/
noncomputable def torObjIsoHomology (G : ModCat.{w} Cᵒᵖ) {F : ModCat.{w} C}
    (P : ProjectiveResolution F) (n : ℕ) :
    ((tor n).obj G).obj F ≅
      (HomologicalComplex.homologyFunctor _ _ n).obj
        (((tensor.obj G).mapHomologicalComplex _).obj P.complex) :=
  P.isoLeftDerivedObj _ n

/-- **1.1** `Tor` is additive in the covariant variable (`NatTrans.leftDerived_add`). -/
instance (F : ModCat.{w} C) (n : ℕ) : ((tor n).flip.obj F).Additive :=
  sorry

section Linear

variable (R : Type*) [CommRing R] [Linear R C]

/-- **1.1, the derived `R`-structure**: for an `R`-linear `C`, `Tor_n(G, F)` is an `R`-module, `r`
acting by `Tor_n(G, r • 𝟙 F)`, equivalently by `Tor_n(r • 𝟙 G, F)`; the pattern of Mathlib's
`Module R (Ext X Y n)`. -/
noncomputable instance (n : ℕ) (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) :
    Module R (((tor n).obj G).obj F) :=
  sorry

/-- **1.1** The action of `r` is the image of `r • 𝟙 F`. -/
theorem smul_eq_tor_obj_map {n : ℕ} {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R)
    (z : ((tor n).obj G).obj F) : r • z = (((tor n).obj G).map (r • 𝟙 F)).hom z :=
  sorry

/-- **1.1** The action of `r` is also the image of `r • 𝟙 G`. -/
theorem smul_eq_tor_map_app {n : ℕ} {G : ModCat.{w} Cᵒᵖ} {F : ModCat.{w} C} (r : R)
    (z : ((tor n).obj G).obj F) : r • z = (((tor n).map (r • 𝟙 G)).app F).hom z :=
  sorry

end Linear

end Tor

end ModCat

section BalancedTor

variable (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.1, rings** `Tor_n^A(M, N)`: the left derived functor of the ring bifunctor of 0.6 in the
left-module variable `N`, the shape of Mathlib's `CategoryTheory.Tor`. -/
noncomputable def BalancedTor (n : ℕ) :
    ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R where
  obj M := ((BalancedTensorProduct.functor R A).obj M).leftDerived n
  map f := NatTrans.leftDerived ((BalancedTensorProduct.functor R A).map f) n

/-- **1.1, rings** `Tor_0` is the tensor product. -/
noncomputable def balancedTorZeroIso :
    BalancedTor.{v} R A 0 ≅ BalancedTensorProduct.functor.{v} R A :=
  sorry

/-- **1.1, rings** Ring `Tor` over `ℤ` is `Tor` over the one-object category `SingleObj Aᵐᵒᵖ`,
through the equivalences of 0.2 (for an `R`-algebra, `R`-linearly with `balancedTorIntIso`). -/
noncomputable def balancedTorIsoTorSingleObj (n : ℕ) :
    BalancedTor.{v} ℤ A n ⋙
        (Functor.whiskeringRight _ _ _).obj (forget₂ (ModuleCat.{v} ℤ) AddCommGrpCat.{v}) ≅
      (moduleCatMulOppositeEquivModCatOp.{v} A).functor ⋙
        ModCat.tor (C := SingleObj Aᵐᵒᵖ) n ⋙
          (Functor.whiskeringLeft _ _ _).obj (moduleCatEquivModCat.{v} A).functor :=
  sorry

variable {R A}

/-- **1.1, rings** Higher `Tor` vanishes at a projective left module. -/
theorem isZero_balancedTor_succ_of_projective (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A)
    [Projective N] (n : ℕ) : IsZero (((BalancedTor R A (n + 1)).obj M).obj N) :=
  Functor.isZero_leftDerived_obj_projective_succ _ _ _

end BalancedTor

/-! ### 1.2 Long exact sequences in the underived variable -/

namespace ModCat

section LongExact

variable {C : Type u} [Category.{v} C] [Preadditive C]
  [EssentiallySmall.{w} C] {S : ShortComplex (ModCat.{w} Cᵒᵖ)}

/-- **1.2** The connecting map `Tor_{n+1}(G₃, F) → Tor_n(G₁, F)` of a short exact sequence
`0 → G₁ → G₂ → G₃ → 0` of covariant functors: the homology connecting map of the short exact
sequence of complexes `Gᵢ ⊗_C Q`, `Q` a projective resolution of `F` (exact termwise by 0.3 and
0.4). -/
noncomputable def _root_.CategoryTheory.ShortComplex.ShortExact.torδ (hS : S.ShortExact)
    (F : ModCat.{w} C) (n : ℕ) : ((tor (n + 1)).obj S.X₃).obj F ⟶ ((tor n).obj S.X₁).obj F :=
  sorry

/-- **1.2** Exactness at `Tor_n(G₁, F)`. -/
theorem tor_exact₁ (hS : S.ShortExact) (F : ModCat.{w} C) (n : ℕ) :
    Function.Exact (ShortComplex.ShortExact.torδ hS F n).hom
      (((tor n).map S.f).app F).hom :=
  sorry

/-- **1.2** Exactness at `Tor_n(G₂, F)`. -/
theorem tor_exact₂ (hS : S.ShortExact) (F : ModCat.{w} C) (n : ℕ) :
    Function.Exact (((tor n).map S.f).app F).hom (((tor n).map S.g).app F).hom :=
  sorry

/-- **1.2** Exactness at `Tor_{n+1}(G₃, F)`. -/
theorem tor_exact₃ (hS : S.ShortExact) (F : ModCat.{w} C) (n : ℕ) :
    Function.Exact (((tor (n + 1)).map S.g).app F).hom
      (ShortComplex.ShortExact.torδ hS F n).hom :=
  sorry

end LongExact

end ModCat

section BalancedTorLongExact

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A] [Small.{v} A]
  {S : ShortComplex (ModuleCat.{v} Aᵐᵒᵖ)}

/-- **1.2, rings** The connecting map `Tor_{n+1}(M₃, N) → Tor_n(M₁, N)` of a short exact sequence
of right modules. -/
noncomputable def _root_.CategoryTheory.ShortComplex.ShortExact.balancedTorδ (hS : S.ShortExact)
    (N : ModuleCat.{v} A) (n : ℕ) :
    ((BalancedTor R A (n + 1)).obj S.X₃).obj N ⟶ ((BalancedTor R A n).obj S.X₁).obj N :=
  sorry

/-- **1.2, rings** Exactness at `Tor_n(M₁, N)`. -/
theorem balancedTor_exact₁ (hS : S.ShortExact) (N : ModuleCat.{v} A) (n : ℕ) :
    Function.Exact (ShortComplex.ShortExact.balancedTorδ R hS N n).hom
      (((BalancedTor R A n).map S.f).app N).hom :=
  sorry

/-- **1.2, rings** Exactness at `Tor_n(M₂, N)`. -/
theorem balancedTor_exact₂ (hS : S.ShortExact) (N : ModuleCat.{v} A) (n : ℕ) :
    Function.Exact (((BalancedTor R A n).map S.f).app N).hom
      (((BalancedTor R A n).map S.g).app N).hom :=
  sorry

/-- **1.2, rings** Exactness at `Tor_{n+1}(M₃, N)`. -/
theorem balancedTor_exact₃ (hS : S.ShortExact) (N : ModuleCat.{v} A) (n : ℕ) :
    Function.Exact (((BalancedTor R A (n + 1)).map S.g).app N).hom
      (ShortComplex.ShortExact.balancedTorδ R hS N n).hom :=
  sorry

end BalancedTorLongExact

/-! ### 1.3 Balance -/

namespace ModCat

section Balance

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{w} C]

/-- **1.3, balance**: `Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)`, with `F` a covariant functor on `Cᵒᵖ`
through `ModCat.opOpEquiv` and `G` a module over `Cᵒᵖ`, as in 0.5. Route: the bicomplex `P ⊗_C Q`
of projective resolutions and Tau Ceti's `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
for it and its flip. -/
noncomputable def torBalanceIso (n : ℕ) :
    (tor (C := C) n : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w}) ≅
      ((ModCat.opOpEquiv C).functor ⋙ tor (C := Cᵒᵖ) n).flip :=
  sorry

/-- **1.3** Higher `Tor` vanishes at a projective covariant functor (balance and 1.1 over
`Cᵒᵖ`). -/
theorem isZero_tor_succ_of_projective_left (G : ModCat.{w} Cᵒᵖ) [Projective G]
    (F : ModCat.{w} C) (n : ℕ) : IsZero (((tor (n + 1)).obj G).obj F) :=
  sorry

end Balance

end ModCat

namespace ModCat

section BalanceLongExact

variable {C : Type u} [Category.{v} C] [Preadditive C]
  [EssentiallySmall.{w} C] {S : ShortComplex (ModCat.{w} C)}

/-- **1.3** The connecting map `Tor_{n+1}(G, F₃) → Tor_n(G, F₁)` of a short exact sequence in
`Mod C`: 1.2 over `Cᵒᵖ`, transported by the balance. -/
noncomputable def _root_.CategoryTheory.ShortComplex.ShortExact.torδ' (G : ModCat.{w} Cᵒᵖ)
    (hS : S.ShortExact) (n : ℕ) : ((tor (n + 1)).obj G).obj S.X₃ ⟶ ((tor n).obj G).obj S.X₁ :=
  sorry

/-- **1.3** Exactness at `Tor_n(G, F₁)`. -/
theorem tor_exact₁' (G : ModCat.{w} Cᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (ShortComplex.ShortExact.torδ' G hS n).hom
      (((tor n).obj G).map S.f).hom :=
  sorry

/-- **1.3** Exactness at `Tor_n(G, F₂)`. -/
theorem tor_exact₂' (G : ModCat.{w} Cᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (((tor n).obj G).map S.f).hom (((tor n).obj G).map S.g).hom :=
  sorry

/-- **1.3** Exactness at `Tor_{n+1}(G, F₃)`. -/
theorem tor_exact₃' (G : ModCat.{w} Cᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (((tor (n + 1)).obj G).map S.g).hom
      (ShortComplex.ShortExact.torδ' G hS n).hom :=
  sorry

end BalanceLongExact

end ModCat

section BalancedTorBalance

variable (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.3, rings: swap** `Tor_n^A(M, N) ≅ Tor_n^{Aᵐᵒᵖ}(N, M)`, with `N` a right `Aᵐᵒᵖ`-module
through `RingEquiv.opOp A`: 1.1's comparison, the balance at `SingleObj Aᵐᵒᵖ` and
`singleObjMulOppositeEquiv Aᵐᵒᵖ`. -/
noncomputable def balancedTorSwapIso (n : ℕ) :
    BalancedTor.{v} R A n ≅
      (ModuleCat.restrictScalars.{v} (RingEquiv.opOp A).symm.toRingHom ⋙
        BalancedTor.{v} R Aᵐᵒᵖ n).flip :=
  sorry

variable {R A}

/-- **1.3, rings** Higher `Tor` vanishes at a projective right module. -/
theorem isZero_balancedTor_succ_of_projective_left (M : ModuleCat.{v} Aᵐᵒᵖ) [Projective M]
    (N : ModuleCat.{v} A) (n : ℕ) : IsZero (((BalancedTor R A (n + 1)).obj M).obj N) :=
  sorry

variable (R) {S : ShortComplex (ModuleCat.{v} A)}

/-- **1.3, rings** The connecting map `Tor_{n+1}(M, N₃) → Tor_n(M, N₁)` of a short exact sequence
of left modules. -/
noncomputable def _root_.CategoryTheory.ShortComplex.ShortExact.balancedTorδ'
    (M : ModuleCat.{v} Aᵐᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    ((BalancedTor R A (n + 1)).obj M).obj S.X₃ ⟶ ((BalancedTor R A n).obj M).obj S.X₁ :=
  sorry

/-- **1.3, rings** Exactness at `Tor_n(M, N₁)`. -/
theorem balancedTor_exact₁' (M : ModuleCat.{v} Aᵐᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (ShortComplex.ShortExact.balancedTorδ' R M hS n).hom
      (((BalancedTor R A n).obj M).map S.f).hom :=
  sorry

/-- **1.3, rings** Exactness at `Tor_n(M, N₂)`. -/
theorem balancedTor_exact₂' (M : ModuleCat.{v} Aᵐᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (((BalancedTor R A n).obj M).map S.f).hom
      (((BalancedTor R A n).obj M).map S.g).hom :=
  sorry

/-- **1.3, rings** Exactness at `Tor_{n+1}(M, N₃)`. -/
theorem balancedTor_exact₃' (M : ModuleCat.{v} Aᵐᵒᵖ) (hS : S.ShortExact) (n : ℕ) :
    Function.Exact (((BalancedTor R A (n + 1)).obj M).map S.g).hom
      (ShortComplex.ShortExact.balancedTorδ' R M hS n).hom :=
  sorry

end BalancedTorBalance

/-! ### 1.4 `Tor` of the transpose -/

section Transpose

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **1.4** The map `⊕_j Hom(-, Y j) → ⊕_i Hom(-, Z i)` of a matrix `α j i : Y j ⟶ Z i`, as a map
of `Mod C`: the map `matrixMap α` of 0.1, between the finite sums formed in `Mod C`. -/
noncomputable def ModCat.matrixMap {p q : ℕ} {Y : Fin q → C} {Z : Fin p → C}
    (α : ∀ j i, Y j ⟶ Z i) :
    (∐ fun j ↦ (ModCat.yoneda C).obj (Y j)) ⟶ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i) :=
  Limits.Sigma.desc fun j ↦
    ∑ i, (ModCat.yoneda C).map (α j i) ≫ Limits.Sigma.ι (fun i ↦ (ModCat.yoneda C).obj (Z i)) i

/-- **1.4** The Auslander–Bridger transpose of a map `f : P₁ ⟶ P₀` in `proj C`:
`Tr = coker (P₀^∨ → P₁^∨)`, with the duality `(-)^∨ = Hom(-, C)` of 0.8; a covariant functor (a
module over `Cᵒᵖ`), as `Tr X` is a right module for a left module `X` over a ring. -/
noncomputable def ModCat.transpose {P₁ P₀ : (ModCat.proj C).FullSubcategory} (f : P₁ ⟶ P₀) :
    ModCat.{v} Cᵒᵖ :=
  cokernel ((ModCat.projDual C).functor.map f.op).hom

/-- **1.4** A finite sum of representables `⊕_j Hom(-, Y j)` as an object of `proj C`. -/
noncomputable def ModCat.projSigma {q : ℕ} (Y : Fin q → C) : (ModCat.proj C).FullSubcategory :=
  ⟨∐ fun j ↦ (ModCat.yoneda C).obj (Y j), ModCat.proj_sigma_yoneda Y⟩

/-- **1.4** The cokernel of the transposed matrix `⊕_i Hom(Z i, -) → ⊕_j Hom(Y j, -)`, a covariant
functor. -/
noncomputable def ModCat.matrixTranspose {p q : ℕ} {Y : Fin q → C} {Z : Fin p → C}
    (α : ∀ j i, Y j ⟶ Z i) : ModCat.{v} Cᵒᵖ :=
  cokernel (Limits.Sigma.desc fun i ↦
    ∑ j, (ModCat.yoneda Cᵒᵖ).map (α j i).op ≫
      Limits.Sigma.ι (fun j ↦ (ModCat.yoneda Cᵒᵖ).obj (op (Y j))) j)

/-- **1.4, the matrix description**: the transpose of `matrixMap α` is the cokernel of the
transposed matrix, since the dual of `Hom(-, X)` is `Hom(X, -)` (0.8). -/
noncomputable def ModCat.transposeMatrixIso {p q : ℕ} {Y : Fin q → C} {Z : Fin p → C}
    (α : ∀ j i, Y j ⟶ Z i) :
    ModCat.transpose
        (ObjectProperty.homMk (ModCat.matrixMap α) : ModCat.projSigma Y ⟶ ModCat.projSigma Z) ≅
      ModCat.matrixTranspose α :=
  sorry

variable [EssentiallySmall.{v} C]

/-- **1.4, `Tor` of the transpose** ([Auslander78, I, Prop. 3.2]; [AB, (2.8) (b), p. 54], for
two-sided Noetherian rings): for the finitely presented module `X = coker f` of `Mod C` and any `N`
in `Mod C`, the stable `Hom(X, N)` (Tau Ceti's projective stable category of `Mod C`) is
`Tor_1(Tr X, N)`, in the order of the ring form. Route ([Krause-Defect, pp. 268–269], for the
snake-lemma step): for `0 → ΩN → P → N → 0` with `P` projective, the snake lemma identifies the
cokernel of `Hom(X, P) → Hom(X, N)` with the kernel of `H(ΩN) → H(P)`, where
`H(M) = coker (Hom(P₀, M) → Hom(P₁, M)) ≅ Tr X ⊗_C M` (0.8); then the long exact sequence of
1.3. -/
noncomputable def ModCat.stableHomEquivTorTranspose {P₁ P₀ : (ModCat.proj C).FullSubcategory}
    (f : P₁ ⟶ P₀) (N : ModCat.{v} C) :
    ((TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj (cokernel f.hom) ⟶
      (TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj N) ≃+
      ((ModCat.tor 1).obj (ModCat.transpose f)).obj N :=
  sorry

/-- **1.4, a `Tor` criterion for projectivity**: if `X = coker f` is finitely presented and
`Tor_1(Tr X, X) = 0`, then `X` is projective: the stable `End(X)` is `0`, so `𝟙 X` factors through
a projective. With 2.2 this proves that finitely presented flat modules are projective without
Lazard's characterization of flatness ([CB, §1.3, proof of (1) ⇒ (2), p. 1646], which uses
`stable Hom(X, Y) ≅ Tor_1(Tr X, Y)` for maps from a finitely presented `X` to a flat `Y`). -/
theorem ModCat.projective_of_isZero_tor_transpose {P₁ P₀ : (ModCat.proj C).FullSubcategory}
    (f : P₁ ⟶ P₀) (h : IsZero (((ModCat.tor 1).obj (ModCat.transpose f)).obj (cokernel f.hom))) :
    Projective (cokernel f.hom) :=
  sorry

end Transpose

section BalancedTorTranspose

open scoped ModuleCat.Algebra

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A]
  {P₀ P₁ : Type u} [AddCommGroup P₀] [Module A P₀] [Module.Finite A P₀] [Module.Projective A P₀]
  [AddCommGroup P₁] [Module A P₁] [Module.Finite A P₁] [Module.Projective A P₁]

/-- **1.4, rings: `Tor` of the transpose** ([Auslander78, I, Prop. 3.2]): for a presentation
`P₁ → P₀ → X → 0` by finite projectives, the stable `Hom_A(X, N)` (Tau Ceti's projective stable
category) is `Tor_1^A(Tr X, N)`, with Tau Ceti's `AuslanderReitenTranspose`. It follows from the
categorical form `ModCat.stableHomEquivTorTranspose` at `SingleObj Aᵐᵒᵖ` through 0.2, 0.8 and 1.1;
directly, the snake-lemma step ([Krause-Defect, pp. 268–269]) with Tau Ceti's
`LinearMap.auslanderReitenTransposeTensorEquivCokernel`, applied to `0 → ΩN → P → N → 0`, and the
long exact sequence of 1.3. -/
noncomputable def stableHomEquivBalancedTorTranspose {X : ModuleCat.{u} A} {f : P₁ →ₗ[A] P₀}
    {π : P₀ →ₗ[A] X} (hfπ : Function.Exact f π) (hπ : Function.Surjective π)
    (N : ModuleCat.{u} A) :
    ((TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModuleCat.{u} A))).obj X ⟶
      (TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModuleCat.{u} A))).obj N) ≃ₗ[R]
      ((BalancedTor R A 1).obj (ModuleCat.of Aᵐᵒᵖ (TauCeti.AuslanderReitenTranspose f))).obj N :=
  sorry

end BalancedTorTranspose

/-! ### 1.5 `Tor`–`Ext` duality -/

namespace ModCat

section Duality

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{w} C]

/-- **1.5** `Ext` groups of `Mod C` live in `Type w`: Mathlib's instance
`IsGrothendieckAbelian.hasExt`, from the Grothendieck structure of 0.1; no separate instance. -/
example : HasExt.{w} (ModCat.{w} C) := inferInstance

/-- **1.5, `Tor`–`Ext` duality**: for an `R`-linear `C` and an injective `R`-module `E`,
`Hom_R(Tor_n^C(G, F), E) ≅ Ext^n(G, F^E)`, `R`-linearly, with the derived `R`-structure of `Tor`
(1.1) and Mathlib's `Abelian.Ext` over `Cᵒᵖ`. Route: resolve `G` (by the balance), the adjunction
`tensorLinearHomEquiv'` of 0.3 termwise, and Mathlib's
`ProjectiveResolution.extEquivCohomologyClass` ([CE, VI, Prop. 5.1, p. 120]). -/
noncomputable def torExtDualityEquiv (R : Type*) [CommRing R] [Linear R C]
    (E : ModuleCat.{w} R) [Injective E] (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) (n : ℕ) :
    ((((tor n).obj G).obj F) →ₗ[R] E) ≃ₗ[R]
      Abelian.Ext.{w} G ((ModCat.dual R E).obj (op F)) n :=
  sorry

end Duality

end ModCat

section BalancedTorDuality

open scoped ModuleCat.Algebra

variable {R : Type t} [CommRing R] {A : Type u} [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.5, rings**: `Hom_R(Tor_n^A(M, N), E) ≅ Ext^n_{Aᵐᵒᵖ}(M, Hom_R(N, E))` for an injective
`R`-module `E` (`R = ℤ`, `E = ℚ ⧸ ℤ`: [Lambek, p. 241]). -/
noncomputable def balancedTorExtDualityEquiv (E : ModuleCat.{v} R) [Injective E]
    (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) (n : ℕ) :
    ((((BalancedTor R A n).obj M).obj N) ⟶ E) ≃ₗ[R]
      Abelian.Ext.{v} M ((BalancedTensorProduct.homRight R A N).obj E) n :=
  sorry

end BalancedTorDuality

/-! ### 1.6 Comparisons and first computations -/

/-- **1.6, commutative rings**: over a commutative ring, `BalancedTor R R` is Mathlib's
`CategoryTheory.Tor`. -/
noncomputable def balancedTorIsoTor (R : Type u) [CommRing R] (n : ℕ) :
    ModuleCat.restrictScalars.{u} (RingEquiv.toOpposite R).symm.toRingHom ⋙ BalancedTor.{u} R R n ≅
      Tor (ModuleCat.{u} R) n :=
  sorry

/-- **1.6** With the balance, Mathlib's two `Tor`s on `ModuleCat R` agree, the comparison that
`Mathlib/CategoryTheory/Monoidal/Tor.lean` leaves open. -/
noncomputable def torIsoTor' (R : Type u) [CommRing R] (n : ℕ) :
    Tor (ModuleCat.{u} R) n ≅ Tor' (ModuleCat.{u} R) n :=
  sorry


section BalancedTorBase

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.6, rings: change of base** along `R → R' → A`. -/
noncomputable def balancedTorRestrictScalarsIso (R' : Type t) [CommRing R'] [Algebra R R']
    [Algebra R' A] [IsScalarTower R R' A] (n : ℕ) (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    (ModuleCat.restrictScalars (algebraMap R R')).obj (((BalancedTor R' A n).obj M).obj N) ≅
      ((BalancedTor R A n).obj M).obj N :=
  sorry

/-- **1.6, rings: independence of `R`.** -/
noncomputable def balancedTorIntIso (n : ℕ) (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    (ModuleCat.restrictScalars (algebraMap ℤ R)).obj (((BalancedTor R A n).obj M).obj N) ≅
      ((BalancedTor ℤ A n).obj M).obj N :=
  sorry

end BalancedTorBase

/-- **1.6, cyclic modules**: for a right ideal `I` and a left ideal `K`,
`Tor_1^A(A ⧸ I, A ⧸ K) ≃+ (I ∩ K) ⧸ IK`, with `IK` the additive subgroup generated by products
([Weibel, Exer. 3.1.3, p. 68]). -/
noncomputable def balancedTorOneQuotientEquiv (A : Type u) [Ring A] (I : Submodule Aᵐᵒᵖ A)
    (K : Ideal A) :
    (((BalancedTor.{u} ℤ A 1).obj (ModuleCat.of Aᵐᵒᵖ (A ⧸ I))).obj (ModuleCat.of A (A ⧸ K))) ≃+
      ↥(I.toAddSubgroup ⊓ K.toAddSubgroup) ⧸
        (AddSubgroup.closure (Set.image2 (· * ·) (I : Set A) (K : Set A))).addSubgroupOf
          (I.toAddSubgroup ⊓ K.toAddSubgroup) :=
  sorry

/-! ### 1.7 Categories with finitely many objects -/

/-- **1.7** The category algebra `⊕_{x,y} Hom(x, y)` ([Mitchell, §7, p. 33], where it is `[C]`): the
finitely supported families `a (x, y) : x ⟶ y` (Mathlib's `DFinsupp`), with
`(a * b)(x, z) = ∑_y a (x, y) ≫ b (y, z)`. The product is composition in diagrammatic order, so
that `CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≅ A` (there `f ≫ g = op (unop f * unop g)`) and `Mod C` is
the category of left modules (`modCatEquivCategoryAlgebra`). For any preadditive `C` it is a ring
without unit with enough idempotents ([Harada, Remark 1, pp. 339–340]); for finitely many objects
the identities on the diagonal sum to the unit. -/
def CategoryAlgebra (C : Type u) [Category.{v} C] [Preadditive C] : Type (max u v) :=
  Π₀ p : C × C, (p.1 ⟶ p.2)

section CategoryAlgebra

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **1.7** The multiplication of the category algebra, for any preadditive `C`. -/
noncomputable instance : NonUnitalRing (CategoryAlgebra C) :=
  sorry

variable [Finite C]

/-- **1.7** For finitely many objects the category algebra is unital, with `1 = ∑_x single (x, x)
(𝟙 x)`; the ring structure extends the multiplication of the `NonUnitalRing` instance. The
hypothesis is `Finite C`, not `Fintype C` with `DecidableEq C`, so that no second decidability
instance enters the multiplication. -/
noncomputable instance : Ring (CategoryAlgebra C) :=
  sorry

/-- **1.7** For an `R`-linear `C`, the category algebra is an `R`-algebra. -/
noncomputable instance (R : Type*) [CommRing R] [Linear R C] : Algebra R (CategoryAlgebra C) :=
  sorry

/-- **1.7** `C`-modules are left modules over the category algebra, `F ↦ ⊕_x F(x)`, with `a`
acting through the maps `F(a (x, y)) : F(y) → F(x)` ([Mitchell, Thm. 7.1, pp. 33–35, for covariant
functors, with the contravariant case on p. 37]; the pattern of Tau Ceti's `quiverRepEquivalence`).
-/
noncomputable def modCatEquivCategoryAlgebra :
    ModCat.{w} C ≌ ModuleCat.{w} (CategoryAlgebra C) :=
  sorry

/-- **1.7** Covariant functors (modules over `Cᵒᵖ`) are right modules over the category
algebra. -/
noncomputable def modCatOpEquivCategoryAlgebra :
    ModCat.{w} Cᵒᵖ ≌ ModuleCat.{w} (CategoryAlgebra C)ᵐᵒᵖ :=
  sorry

/-- **1.7** The equivalences carry the tensor product over `C` to the balanced tensor product over
the category algebra ([Mitchell, §7, p. 37]); through `ℤ`, `R`-linearly for an `R`-linear `C`. -/
noncomputable def tensorObjCategoryAlgebraIso [EssentiallySmall.{w} C] (G : ModCat.{w} Cᵒᵖ)
    (F : ModCat.{w} C) :
    ModCat.tensorObj G F ≅
      AddCommGrpCat.of (TauCeti.BalancedTensorProduct ℤ (CategoryAlgebra C)
        ((modCatOpEquivCategoryAlgebra C).functor.obj G)
        ((modCatEquivCategoryAlgebra C).functor.obj F)) :=
  sorry

/-- **1.7** The equivalences carry `Tor` over `C` to `Tor` over the category algebra
([Mitchell, §7, p. 37, (1)]). -/
noncomputable def torCategoryAlgebraIso [EssentiallySmall.{w} C]
    [Small.{w} (CategoryAlgebra C)] (n : ℕ) :
    (ModCat.tor (C := C) n : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w}) ≅
      (modCatOpEquivCategoryAlgebra.{w} C).functor ⋙
        (BalancedTor ℤ (CategoryAlgebra C) n ⋙
          (Functor.whiskeringRight _ _ _).obj (forget₂ (ModuleCat.{w} ℤ) AddCommGrpCat.{w})) ⋙
        (Functor.whiskeringLeft _ _ _).obj (modCatEquivCategoryAlgebra.{w} C).functor :=
  sorry

end CategoryAlgebra

/-! ## Layer 2: flat modules and flat functors

Flatness is category-primary. A module `F` of `Mod C` is flat when it satisfies the equational
criterion ([OR, Thm. 3.2 (4)]): every relation `∑_j F(β_j)(y_j) = 0` in `F(X)` is trivial.
The familiar forms (the ideal test, exactness of `- ⊗_C F`, vanishing of `Tor_1`) need the coend
over `C`, hence `EssentiallySmall` and modules in the universe of the morphisms; the equational
form needs neither and makes sense for every `C` and every universe, which 2.4 uses. Under
smallness the familiar forms are the tests of 2.2. A covariant functor is flat when it is flat as a
module over `Cᵒᵖ`. Rings keep a native class `Module.BalancedFlat`, compared with flatness over
`SingleObj Aᵐᵒᵖ`. -/

/-! ### 2.1 Definition -/

section FlatDef

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.1** The subfunctor of `Hom(-, X)` generated by finitely many morphisms `β j : Y j ⟶ X`: the
image of `⊕_j Hom(-, Y j) → Hom(-, X)`. These are the finitely generated subfunctors of
`Hom(-, X)`. -/
noncomputable def ModCat.yonedaSpan {X : C} {n : ℕ} {Y : Fin n → C} (β : ∀ j, Y j ⟶ X) :
    Subobject ((ModCat.yoneda C).obj X) :=
  imageSubobject (Limits.Sigma.desc fun j ↦ (ModCat.yoneda C).map (β j))

/-- **2.1** The subfunctor of the covariant representable `Hom(X, -)` generated by finitely many
morphisms `β j : X ⟶ Y j`, the image of `⊕_j Hom(Y j, -) → Hom(X, -)`: `yonedaSpan` over `Cᵒᵖ`.
These are the finitely generated subfunctors of `Hom(X, -)`, the finitely generated right ideals
of `C` at `X` (0.3); for `C = SingleObj Aᵐᵒᵖ`, the finitely generated right ideals of `A`. -/
noncomputable abbrev ModCat.coyonedaSpan {X : C} {n : ℕ} {Y : Fin n → C} (β : ∀ j, X ⟶ Y j) :
    Subobject ((ModCat.yoneda Cᵒᵖ).obj (op X)) :=
  ModCat.yonedaSpan (C := Cᵒᵖ) (X := op X) (Y := fun j ↦ op (Y j)) fun j ↦ (β j).op

/-- **2.1** A relation `∑_j F(β_j)(y_j) = 0` in `F(X)`, for `β_j : X ⟶ Y_j`, is **trivial** if
there are finitely many `z_i ∈ F(Z_i)` and maps `α_ij : Y_j ⟶ Z_i` with `y_j = ∑_i F(α_ij)(z_i)`
and `∑_j β_j ≫ α_ij = 0` for all `i` ([OR, Thm. 3.2 (4)]); the shape of Mathlib's
`Module.Flat.IsTrivialRelation`. -/
def ModCat.IsTrivialRelation (F : ModCat.{w} C) {X : C} {n : ℕ} {Y : Fin n → C}
    (β : ∀ j, X ⟶ Y j) (y : ∀ j, F.obj.obj (op (Y j))) : Prop :=
  ∃ (m : ℕ) (Z : Fin m → C) (z : ∀ i, F.obj.obj (op (Z i))) (α : ∀ i j, Y j ⟶ Z i),
    (∀ j, y j = ∑ i, (F.obj.map (α i j).op).hom (z i)) ∧ ∀ i, ∑ j, β j ≫ α i j = 0

/-- **2.1** A module `F` of `Mod C` is **flat** if it satisfies the **equational criterion**: every
relation `∑_j F(β_j)(y_j) = 0` is trivial ([OR, Thm. 3.2 (4), pp. 96–97, proof to p. 99];
Mathlib's commutative `Module.Flat.iff_forall_isTrivialRelation`; [Lazard, Lemme 1.1, p. 84] has
the equivalent factorization form, derived there from flatness). The definition quantifies over
objects, finite families of morphisms and elements, so it needs no smallness and no universe
condition. Under `EssentiallySmall.{v} C` it is equivalent to the ideal test and the other forms
of 2.2. A covariant functor is flat when it is flat as a module over `Cᵒᵖ`.

This is flatness as a module (ambient flatness). It is not flatness as an object of the full
subcategory of flat modules, which asks every epimorphism there to be pure ([CI]). -/
class ModCat.Flat (F : ModCat.{w} C) : Prop where
  isTrivialRelation ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j)
    (y : ∀ j, F.obj.obj (op (Y j))) :
    ∑ j, (F.obj.map (β j).op).hom (y j) = 0 → F.IsTrivialRelation β y

end FlatDef

/-- **2.1, rings** A left module `M` is flat if `I ⊗_A M → A ⊗_A M` is injective for every finitely
generated right ideal `I` ([Lam-LMR, (4.12)], stated for right modules in Lam; applied to `Aᵐᵒᵖ`).
A right module `M` is flat when
`Module.BalancedFlat Aᵐᵒᵖ M`. Mathlib's `Module.Flat` is stated for commutative rings; over them
the two agree (`Module.balancedFlat_iff_flat`). -/
class Module.BalancedFlat (A : Type u) (M : Type v) [Ring A] [AddCommGroup M] [Module A M] :
    Prop where
  out ⦃I : Submodule Aᵐᵒᵖ A⦄ : I.FG →
    Function.Injective (BalancedTensorProduct.rTensor ℤ M I.subtype)

/-- **2.1, rings** Ring flatness is flatness over `SingleObj Aᵐᵒᵖ` (0.2), for modules in any
universe: both sides are the equational criterion ([Lam-LMR, (4.24)]). -/
theorem Module.balancedFlat_iff_flat_singleObj (A : Type u) [Ring A] (M : Type w) [AddCommGroup M]
    [Module A M] :
    Module.BalancedFlat A M ↔
      ModCat.Flat ((moduleCatEquivModCat.{w} A).functor.obj (ModuleCat.of A M)) :=
  sorry

/-- **2.1, commutative rings**: over a commutative ring, `BalancedFlat` is Mathlib's
`Module.Flat`. -/
theorem Module.balancedFlat_iff_flat {R : Type u} [CommRing R] (M : Type v) [AddCommGroup M]
    [Module R M] : Module.BalancedFlat R M ↔ Module.Flat R M :=
  sorry

/-! ### 2.2 Tests -/

section Baer

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.2** Baer's condition in `Mod C`: every map from a subfunctor of a representable extends to
the representable. -/
def ModCat.Baer (E : ModCat.{v} C) : Prop :=
  ∀ (X : C) (I : Subobject ((ModCat.yoneda C).obj X)) (φ : (I : ModCat.{v} C) ⟶ E),
    ∃ ψ : (ModCat.yoneda C).obj X ⟶ E, I.arrow ≫ ψ = φ

/-- **2.2, Baer's criterion** in `Mod C`: Zorn's lemma over partial extensions, with the
representables as generators (the argument of Mathlib's `Module.Baer.injective`). -/
theorem ModCat.baer_iff_injective (E : ModCat.{v} C) : ModCat.Baer E ↔ Injective E :=
  sorry

end Baer

section FlatTests

open ModCat

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **2.2, tests for flatness** of a module `F` of `Mod C`: (1) the equational criterion
(definition); (2) the ideal test: `I ⊗_C F → F(X)` is injective for every finitely generated
right ideal `I` of `C` at `X`; (3) the same for all right ideals at `X`; (4) `- ⊗_C F` preserves
monomorphisms ([OR, Thm. 3.2 (1)]); (5) `Tor_1(-, F) = 0`; (6) `Tor_1(Hom(X, -) ⧸ I, F) = 0` for
finitely generated `I` ([OR, Thm. 3.2 (3)], for every ideal); (7) Lambek: the dual `F^E` is
injective for every injective cogenerator `E` ([St, Thm. 3 (d), p. 357]; [Lambek]). -/
theorem ModCat.flat_tfae (F : ModCat.{v} C) :
    List.TFAE
      [F.Flat,
        ∀ ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j),
          Mono ((tensor.map (ModCat.coyonedaSpan β).arrow).app F),
        ∀ (X : C) (I : Subobject ((ModCat.yoneda Cᵒᵖ).obj (op X))),
          Mono ((tensor.map I.arrow).app F),
        ∀ ⦃G G' : ModCat.{v} Cᵒᵖ⦄ (i : G ⟶ G'), Mono i → Mono ((tensor.map i).app F),
        ∀ G : ModCat.{v} Cᵒᵖ, IsZero (((tor 1).obj G).obj F),
        ∀ ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j),
          IsZero (((tor 1).obj (cokernel (ModCat.coyonedaSpan β).arrow)).obj F),
        ∀ E : ModuleCat.{v} ℤ, Injective E → IsCoseparator E →
          Injective ((ModCat.dual ℤ E).obj (op F))] :=
  sorry

/-- **2.2, the relations of `β` as a kernel**, for finitely many `β j : X ⟶ Y j`. Let
`b : ⊕_j Hom(Y j, -) ⟶ Hom(X, -)` be the map of covariant functors given by the `β j`, with kernel
`K` and image `coyonedaSpan β`. Then the following are equivalent: every relation
`∑_j F(β_j)(y_j) = 0` is trivial; `K ⊗_C F → (⊕_j Hom(Y j, -)) ⊗_C F → Hom(X, -) ⊗_C F` is exact;
`coyonedaSpan β ⊗_C F → Hom(X, -) ⊗_C F` is a monomorphism. The image of `K ⊗_C F` consists of the
trivial relations, since `K(Z)` is the set of families `(α_j : Y j ⟶ Z)` with `∑_j β_j ≫ α_j = 0`;
no finiteness of `K` is used. The last two items agree by Mathlib's
`ShortComplex.exact_iff_mono_cokernel_desc` and right exactness. -/
theorem ModCat.isTrivialRelation_tfae (F : ModCat.{v} C) {X : C} {n : ℕ} {Y : Fin n → C}
    (β : ∀ j, X ⟶ Y j) :
    List.TFAE
      [∀ y : ∀ j, F.obj.obj (op (Y j)), ∑ j, (F.obj.map (β j).op).hom (y j) = 0 →
          F.IsTrivialRelation β y,
        (ShortComplex.mk
          ((tensor.flip.obj F).map (kernel.ι (Limits.Sigma.desc fun j ↦
            (ModCat.yoneda Cᵒᵖ).map (β j).op)))
          ((tensor.flip.obj F).map (Limits.Sigma.desc fun j ↦ (ModCat.yoneda Cᵒᵖ).map (β j).op))
          (by rw [← Functor.map_comp, kernel.condition, Functor.map_zero])).Exact,
        Mono ((tensor.flip.obj F).map (ModCat.coyonedaSpan β).arrow)] :=
  sorry

/-- **2.2, Lambek's criterion** for an `R`-linear `C` and any injective cogenerator `E` of
`R`-modules: the adjunction of 0.3 and 0.7's one-map criterion. -/
theorem ModCat.flat_iff_injective_dual (R : Type*) [CommRing R] [Linear R C]
    (E : ModuleCat.{v} R) [Injective E] (hE : IsCoseparator E) (F : ModCat.{v} C) :
    F.Flat ↔ Injective ((ModCat.dual R E).obj (op F)) :=
  sorry

/-- **2.2** Tensoring with a flat module of `Mod C` preserves monomorphisms of covariant
functors. -/
theorem ModCat.Flat.mono_tensor_map_app (F : ModCat.{v} C) [F.Flat] {G G' : ModCat.{v} Cᵒᵖ}
    (i : G ⟶ G') [Mono i] : Mono ((tensor.map i).app F) :=
  sorry

/-- **2.2** Tensoring with a flat covariant functor (flat as a module over `Cᵒᵖ`) preserves
monomorphisms of `Mod C` (the swap, 0.5). -/
theorem ModCat.Flat.mono_tensor_obj_map (G : ModCat.{v} Cᵒᵖ) [ModCat.Flat G]
    {F F' : ModCat.{v} C} (f : F ⟶ F') [Mono f] : Mono ((tensor.obj G).map f) :=
  sorry

/-- **2.2** A flat module has no higher `Tor`: `Tor_1(-, F) = 0` gives `Tor_{n+1}(-, F) = 0` by
dimension shifting along `0 → K → P → G → 0` (1.2, 1.3). -/
theorem ModCat.Flat.isZero_tor_succ (F : ModCat.{v} C) [F.Flat] (G : ModCat.{v} Cᵒᵖ) (n : ℕ) :
    IsZero (((tor (n + 1)).obj G).obj F) :=
  sorry

/-- **2.2** A finitely presented flat module is projective ([Lazard, Cor. 1.4, p. 85];
[Chase 1960, Corollary, p. 459], for rings): flatness gives `Tor_1(-, F) = 0`, and 1.4's
`projective_of_isZero_tor_transpose` applies (`stable End(F) ≅ Tor_1(Tr F, F) = 0`; the argument of
[CB, §1.3, proof of (1) ⇒ (2), p. 1646]). Lazard instead factors the identity through a finite sum
of representables (2.3). -/
theorem ModCat.Flat.projective_of_isFinitelyPresentedFunctor (F : ModCat.{v} C) [F.Flat]
    (hF : IsFinitelyPresentedFunctor F.obj) : Projective F :=
  sorry

/-- **2.2, `Tor` commutes with filtered colimits** in the `Mod C` variable. Route: compute `Tor`
from a projective resolution `P` of `G` (1.3); `P_p ⊗_C -` preserves colimits (0.3), and filtered
colimits are exact in `AddCommGrpCat`. -/
instance ModCat.preservesFilteredColimits_tor_obj (G : ModCat.{v} Cᵒᵖ) (n : ℕ) :
    PreservesFilteredColimitsOfSize.{v, v} ((tor n).obj G) :=
  sorry

end FlatTests

section BalancedFlatTests

variable {A : Type u} [Ring A]

/-- **2.2, rings: tests for flatness**: the definition; all right ideals; all injections of right
modules; vanishing of `Tor_1`; vanishing of `Tor_1` on cyclic right modules with finitely generated
relations; Lambek's character-module test ([Lam-LMR, (4.9), (4.12)], stated for right modules in
Lam; applied to `Aᵐᵒᵖ`; [Lambek, Theorem, p. 239]). -/
theorem Module.balancedFlat_tfae [Small.{v} A] (M : Type v) [AddCommGroup M] [Module A M] :
    List.TFAE
      [Module.BalancedFlat A M,
        ∀ I : Submodule Aᵐᵒᵖ A, Function.Injective (BalancedTensorProduct.rTensor ℤ M I.subtype),
        ∀ ⦃P Q : Type v⦄ [AddCommGroup P] [Module Aᵐᵒᵖ P] [AddCommGroup Q] [Module Aᵐᵒᵖ Q]
          (i : P →ₗ[Aᵐᵒᵖ] Q), Function.Injective i →
            Function.Injective (BalancedTensorProduct.rTensor ℤ M i),
        ∀ N : ModuleCat.{v} Aᵐᵒᵖ,
          IsZero (((BalancedTor.{v} ℤ A 1).obj N).obj (ModuleCat.of A M)),
        ∀ I : Submodule Aᵐᵒᵖ A, I.FG →
          IsZero (((BalancedTor.{v} ℤ A 1).obj (ModuleCat.of Aᵐᵒᵖ (Shrink.{v} (A ⧸ I)))).obj
            (ModuleCat.of A M)),
        Module.Injective Aᵐᵒᵖ (MatlisDual ℤ (AddCircle (1 : ℚ)) M)] :=
  sorry

/-- **2.2, rings** Flat modules have no higher `Tor`. -/
theorem isZero_balancedTor_succ_of_balancedFlat [Small.{v} A] (N : ModuleCat.{v} Aᵐᵒᵖ)
    (M : ModuleCat.{v} A) [Module.BalancedFlat A M] (n : ℕ) :
    IsZero (((BalancedTor ℤ A (n + 1)).obj N).obj M) :=
  sorry

/-- **2.2, rings** Ring `Tor` commutes with filtered colimits in the left-module variable. -/
instance preservesFilteredColimits_balancedTor_obj (R : Type t) [CommRing R] [Algebra R A]
    [Small.{v} A] (M : ModuleCat.{v} Aᵐᵒᵖ) (n : ℕ) :
    PreservesFilteredColimitsOfSize.{v, v} ((BalancedTor R A n).obj M) :=
  sorry

end BalancedFlatTests

/-! ### 2.3 The Lazard block -/

section Lazard

attribute [local instance] Cardinal.fact_isRegular_aleph0

variable {C : Type u} [Category.{v} C] [Preadditive C]

variable (C) in
/-- **2.3** Finite sums of representables `Hom(-, Z₁) ⊕ ⋯ ⊕ Hom(-, Zₘ)`, the finitely generated free
modules. -/
def ModCat.isFiniteFree : ObjectProperty (ModCat.{v} C) := fun P ↦
  ∃ (m : ℕ) (Z : Fin m → C), Nonempty (P ≅ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i))

/-- **2.3** The category of maps to `F` from finite sums of representables; the shape of Tau
Ceti's `TauCeti.FiniteFreeOver`. -/
abbrev ModCat.FiniteFreeOver (F : ModCat.{v} C) :=
  CostructuredArrow (ModCat.isFiniteFree C).ι F

/-- **2.3** An epimorphism `p : L ⟶ M` is **pure** if every map from a finitely presented module
(0.1) to `M` lifts along `p` ([St, §2]). -/
def ModCat.IsPureEpi {L M : ModCat.{v} C} (p : L ⟶ M) : Prop :=
  Epi p ∧ ∀ ⦃P : ModCat.{v} C⦄, IsFinitelyPresentedFunctor P.obj → ∀ φ : P ⟶ M,
    ∃ ψ : P ⟶ L, ψ ≫ p = φ

/-- **2.3** A module is **pure-projective** if it is projective with respect to pure
epimorphisms. -/
def ModCat.IsPureProjective (M : ModCat.{v} C) : Prop :=
  ∀ ⦃L L' : ModCat.{v} C⦄ (p : L ⟶ L'), ModCat.IsPureEpi p →
    ∀ φ : M ⟶ L', ∃ ψ : M ⟶ L, ψ ≫ p = φ

/-- **2.3, killing finitely many relations**, for any `C` and any flat `F`, with no smallness: for
finite sums of representables `U` and `V` and maps `d : U ⟶ V`, `f : V ⟶ F` with `d ≫ f = 0`, `f`
factors as `a ≫ g` through a finite sum `W` with `d ≫ a = 0`. Route: kill the summands of `U` one at
a time with the definition (one summand is one relation, by Yoneda); each step factors the current
map to `F` further, so the relations already killed stay killed ([Stacks, Tag 058D]; [Lazard,
Lemme 1.1, p. 84]; the pattern of Mathlib's commutative
`Module.Flat.exists_factorization_of_comp_eq_zero_of_free`). -/
theorem ModCat.Flat.exists_factorization_of_comp_eq_zero (F : ModCat.{v} C) [F.Flat] {p q : ℕ}
    {Y : Fin q → C} {Z : Fin p → C}
    (d : (∐ fun j ↦ (ModCat.yoneda C).obj (Y j)) ⟶ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i))
    (f : (∐ fun i ↦ (ModCat.yoneda C).obj (Z i)) ⟶ F) (h : d ≫ f = 0) :
    ∃ (m : ℕ) (W : Fin m → C)
      (a : (∐ fun i ↦ (ModCat.yoneda C).obj (Z i)) ⟶ ∐ fun k ↦ (ModCat.yoneda C).obj (W k))
      (g : (∐ fun k ↦ (ModCat.yoneda C).obj (W k)) ⟶ F), a ≫ g = f ∧ d ≫ a = 0 :=
  sorry

variable [EssentiallySmall.{v} C]

/-- **2.3** The category `FiniteFreeOver F` is essentially `v`-small: its objects are determined up
to isomorphism by finite families of objects of a small model of `C` and elements of `F`, the
pattern of Tau Ceti's `TauCeti.FiniteFreeModuleCat`. The Lazard–Govorov colimit is indexed by a
`SmallModel` of it. -/
instance ModCat.essentiallySmall_finiteFreeOver (F : ModCat.{v} C) :
    EssentiallySmall.{v} F.FiniteFreeOver :=
  sorry

/-- **2.3, purity in Mathlib's sense**: for a short exact sequence, `IsPureEpi` of the second map
is Mathlib's `IsCardinalPure` at `ℵ₀` of the first. This brings Mathlib's stability results and
`exists_colimitsOfShape_splitMonomorphisms_of_isCardinalPure` (a pure monomorphism is a filtered
colimit of split monomorphisms). -/
theorem ModCat.isPureEpi_iff_isCardinalPure {S : ShortComplex (ModCat.{v} C)}
    (hS : S.ShortExact) : ModCat.IsPureEpi S.g ↔ IsCardinalPure Cardinal.aleph0.{v} S.f :=
  sorry

/-- **2.3, factorization**: `F` is flat exactly when every map from a finitely presented module to
`F` factors through a finite sum of representables ([Lazard, Lemme 1.1, Thm. 1.2]; [St, Lemma 8
(c), p. 354], through a projective; [CB, §1.3]). -/
theorem ModCat.flat_iff_forall_exists_factorization (F : ModCat.{v} C) :
    F.Flat ↔ ∀ ⦃P : ModCat.{v} C⦄, IsFinitelyPresentedFunctor P.obj → ∀ φ : P ⟶ F,
      ∃ (Q : ModCat.{v} C) (a : P ⟶ Q) (b : Q ⟶ F), ModCat.isFiniteFree C Q ∧ a ≫ b = φ :=
  sorry

/-- **2.3, filtered category of elements**: `F` is flat exactly when the maps to `F` from finite
sums of representables form a filtered category ([OR, Thm. 3.2 (6)]; [CB, §1.3]). -/
theorem ModCat.flat_iff_isFiltered_finiteFreeOver (F : ModCat.{v} C) :
    F.Flat ↔ IsFiltered F.FiniteFreeOver :=
  sorry

/-- **2.3, Lazard–Govorov**: `F` is flat exactly when it is a filtered colimit of finite sums of
representables ([OR, Thm. 3.2 (5)]; [Mitchell, Thm. 10.1b, p. 48]; [CB, §1.3]; [Lazard, Thm. 1.2];
[Govorov]). The converse direction: filtered colimits of flat modules are flat (2.6). -/
theorem ModCat.flat_iff_exists_isColimit (F : ModCat.{v} C) :
    F.Flat ↔ ∃ (J : Type v) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ ModCat.{v} C)
      (c : Cocone D), Nonempty (IsColimit c) ∧ (∀ j, ModCat.isFiniteFree C (D.obj j)) ∧
        Nonempty (c.pt ≅ F) :=
  sorry

/-- **2.3, purity**: `F` is flat exactly when every epimorphism onto `F` is pure ([St, Thm. 3];
[Lazard, Cor. 1.3]). -/
theorem ModCat.flat_iff_forall_isPureEpi (F : ModCat.{v} C) :
    F.Flat ↔ ∀ ⦃L : ModCat.{v} C⦄ (p : L ⟶ F), Epi p → ModCat.IsPureEpi p :=
  sorry

/-- **2.3** A flat pure-projective module is projective: an epimorphism from a projective onto it
is pure, hence splits. -/
theorem ModCat.Flat.projective_of_isPureProjective (F : ModCat.{v} C) [F.Flat]
    (hF : F.IsPureProjective) : Projective F :=
  sorry

/-- **2.3, additive categories**: with finite biproducts, single representables suffice
([CB, §1.3]; [OR, Cor. 3.3]). -/
theorem ModCat.flat_iff_isFiltered_costructuredArrow_yoneda [HasFiniteBiproducts C]
    (F : ModCat.{v} C) : F.Flat ↔ IsFiltered (CostructuredArrow (ModCat.yoneda C) F) :=
  sorry

/-- **2.3, bridge to Mathlib's ind-objects**: over an additive `C`, a module is flat exactly when
its underlying presheaf of sets is an ind-object ([Krause-Smashing, §2.3, p. 115]). -/
theorem ModCat.flat_iff_isIndObject [HasFiniteBiproducts C] (F : ModCat.{v} C) :
    F.Flat ↔ IsIndObject (F.obj ⋙ forget AddCommGrpCat.{v}) :=
  sorry

/-- **2.3, bridge to Mathlib's type-valued flat functors**: over an additive `C`, a module is flat
exactly when the category of elements of `F : Cᵒᵖ ⥤ Ab` is cofiltered (Mathlib's
`Functor.isCofiltered_elements` is stated for covariant functors; here it is applied on `Cᵒᵖ`). -/
theorem ModCat.flat_iff_isCofiltered_elements [HasFiniteBiproducts C] (F : ModCat.{v} C) :
    F.Flat ↔ IsCofiltered (F.obj ⋙ forget AddCommGrpCat.{v}).Elements :=
  sorry

end Lazard

section BalancedFlatLazard

variable {A : Type u} [Ring A]

/-- **2.3, rings: Lazard** `M` is flat exactly when the finite free modules over `M` (Tau Ceti's
`FiniteFreeOver`) form a filtered category. -/
theorem Module.balancedFlat_iff_isFiltered_finiteFreeOver (M : Type u) [AddCommGroup M]
    [Module A M] : Module.BalancedFlat A M ↔ IsFiltered (TauCeti.FiniteFreeOver A M) :=
  sorry

/-- **2.3, rings** A flat module is the filtered colimit of the finite free modules over it. For a
commutative ring this is Tau Ceti's `TauCeti.flatModuleFilteredFree`, which becomes a
corollary. -/
noncomputable def Module.BalancedFlat.denseAt (M : Type u) [AddCommGroup M] [Module A M]
    [Module.BalancedFlat A M] :
    (TauCeti.finiteFreeModuleInclusion A).DenseAt (ModuleCat.of A M) :=
  sorry

/-- **2.3, rings** Every map from a finitely presented module to a flat module factors through a
finite free module (Mathlib's `Module.Flat.exists_factorization_of_finitePresentation` for
commutative rings). -/
theorem Module.BalancedFlat.exists_factorization_of_finitePresentation {M : Type v}
    [AddCommGroup M] [Module A M] [Module.BalancedFlat A M] {P : Type*} [AddCommGroup P]
    [Module A P] [Module.FinitePresentation A P] (h₁ : P →ₗ[A] M) :
    ∃ (k : ℕ) (h₂ : P →ₗ[A] (Fin k →₀ A)) (h₃ : (Fin k →₀ A) →ₗ[A] M), h₁ = h₃ ∘ₗ h₂ :=
  sorry

/-- **2.3, rings** A finitely presented flat module is projective: by 1.4,
`stable End(M) ≅ Tor_1^A(Tr M, M) = 0` (2.2). -/
theorem Module.BalancedFlat.projective_of_finitePresentation {M : Type v} [AddCommGroup M]
    [Module A M] [Module.FinitePresentation A M] [Module.BalancedFlat A M] :
    Module.Projective A M :=
  sorry

end BalancedFlatLazard

/-! ### 2.4 Left exact functors, triangulated categories and the representation theorem -/

section LeftExact

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.4** `g` is a **weak cokernel** of `f`: `g.op` is a weak kernel of `f.op` in `Cᵒᵖ`, through
Mathlib's weak-limit API (`IsWeakLimit` of the kernel fork `KernelFork.ofι g.op`); Mathlib has weak
kernels and lists weak cokernels as future work. Elementwise (`isWeakCokernel_iff`): `f ≫ g = 0`,
and every `h` with `f ≫ h = 0` factors through `g`, not necessarily uniquely. [CB] calls these
pseudo-cokernels. -/
def IsWeakCokernel {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) : Prop :=
  ∃ w : g.op ≫ f.op = 0, Nonempty (IsWeakLimit (KernelFork.ofι g.op w))

theorem isWeakCokernel_iff {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) :
    IsWeakCokernel f g ↔
      f ≫ g = 0 ∧ ∀ ⦃W : C⦄ (h : Y ⟶ W), f ≫ h = 0 → ∃ k : Z ⟶ W, g ≫ k = h :=
  sorry

/-- **2.4, weak cokernels**: over an additive `C` with weak cokernels, a module of `Mod C` is flat
exactly when it turns weak cokernels into exact sequences ([CB, §1.2, Lemma 2, and §1.3,
pp. 1644–1646]). No smallness and any value universe: with finite biproducts a relation is one
`y ∈ F(Y)` with `F(β) y = 0`, and the `α` with `β ≫ α = 0` are the maps through a weak cokernel of
`β`, so this is the equational criterion. -/
theorem ModCat.flat_iff_exact_of_isWeakCokernel [HasFiniteBiproducts C]
    (hC : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), ∃ (Z : C) (g : Y ⟶ Z), IsWeakCokernel f g)
    (F : ModCat.{w} C) :
    ModCat.Flat F ↔ ∀ ⦃X Y Z : C⦄ (f : X ⟶ Y) (g : Y ⟶ Z), IsWeakCokernel f g →
      Function.Exact (F.obj.map g.op).hom (F.obj.map f.op).hom :=
  sorry

/-- **2.4, flat = left exact**: over an additive `C` with cokernels, a module of `Mod C` is flat
exactly when it is left exact ([Fisher, Prop. 1.3 and Thm. 1.4, pp. 279–280, with Thm. 2.4, p. 284],
for left exact ⇒ flat over abelian `C`; [Fisher, Cor. 2.9, p. 285], covariant, applied to `Cᵒᵖ`;
[OR, Cor. 3.4]; [CB, §2.2]; [Simson, Thm. 2.1 (b), p. 95]). A cokernel is a weak cokernel. -/
theorem ModCat.flat_iff_preservesFiniteLimits [HasFiniteBiproducts C] [HasCokernels C]
    (F : ModCat.{w} C) : ModCat.Flat F ↔ PreservesFiniteLimits F.obj :=
  sorry

end LeftExact

section Triangulated

open Pretriangulated.Opposite

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C] [HasShift C ℤ]
  [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]

/-- **2.4, triangulated categories**: over a triangulated `C`, a module of `Mod C` is flat exactly
when it is cohomological, that is, homological on `Cᵒᵖ` ([Krause-Smashing, Lemma 2.7], for
skeletally small `C`; [Beligiannis, Rem. 8.12]). No smallness: distinguished triangles give weak
cokernels (Mathlib's `Pretriangulated.isWeakLimitKernelForkOfDistTriangle` on `Cᵒᵖ`), then the
previous items. -/
theorem ModCat.flat_iff_isHomological (F : ModCat.{w} C) : ModCat.Flat F ↔ F.obj.IsHomological :=
  sorry

end Triangulated

section Representation

/-- **2.4** The flat modules, as a property of objects of `Mod C`, in any universe. -/
abbrev ModCat.flat (C : Type u) [Category.{v} C] [Preadditive C] :
    ObjectProperty (ModCat.{w} C) :=
  fun F ↦ ModCat.Flat F

variable (C : Type u) [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **2.4** For a small additive `C`, the flat modules of `Mod C` form a finitely accessible
category ([CB, §1.4]). -/
instance [HasFiniteBiproducts C] :
    IsFinitelyAccessibleCategory.{v} (ModCat.flat.{v} C).FullSubcategory :=
  sorry

variable {C} in
/-- **2.4** For a small additive `C`, the finitely presented flat modules are the retracts of
representables ([CB, §1.4 (1)]). -/
theorem ModCat.isFinitelyPresentable_flat_iff [HasFiniteBiproducts C]
    (F : (ModCat.flat.{v} C).FullSubcategory) :
    IsFinitelyPresentable.{v} F ↔ ∃ X : C, Nonempty (Retract F.obj ((ModCat.yoneda C).obj X)) :=
  sorry

end Representation

section RepresentationTheorem

universe u₁ v₁

variable (𝒜 : Type u₁) [Category.{v₁} 𝒜] [Preadditive 𝒜] [HasFiniteBiproducts 𝒜]
  [IsFinitelyAccessibleCategory.{w} 𝒜]

/-- **2.4** The finitely presented objects `fp(𝒜)` of `𝒜`, for presentability in the universe
`w`. -/
abbrev FinitelyPresented : Type _ := (ObjectProperty.isFinitelyPresentable.{w} 𝒜).FullSubcategory

/-- **2.4, Crawley-Boevey's representation theorem**: a finitely accessible additive category
`𝒜` is equivalent, through the restricted Yoneda functor `X ↦ Hom(-, X)` on `fp(𝒜)`, to the flat
modules of `Mod fp(𝒜)` ([CB, §1.4]). Mathlib's `IsFinitelyAccessibleCategory`, not
`IsLocallyFinitelyPresentable`: no cocompleteness is assumed. The universe `w` of accessibility,
in which the modules take values, is independent of the universes of `𝒜`; Hom groups are moved to
`w` by local smallness (Mathlib's `IsAccessibleCategory` gives `LocallySmall.{w} 𝒜`). So the
theorem applies to the flat modules over a small additive category, with `w = v`. -/
noncomputable def restrictedYonedaEquivFlat :
    𝒜 ≌ (ModCat.flat.{w} (FinitelyPresented.{w} 𝒜)).FullSubcategory :=
  sorry

end RepresentationTheorem

/-! ### 2.5 Bass's flat module -/

section Bass

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.5** A sequence `F : ℕ ⥤ C` is **factorizable** if for every `i` there is `j ≥ i` such that
the map `F i ⟶ F j` factors through every later map `F i ⟶ F k`, `k ≥ j`: Simson's factorizable
inverse systems ([Simson, Def. 3.1, p. 99], stated for his covariant modules) read in `Cᵒᵖ`. For a
chain `c₀ → c₁ → ⋯` in `SingleObj Aᵐᵒᵖ`, at `i = 0` this says that the chain
`a₀A ⊇ a₀a₁A ⊇ ⋯` of principal right ideals stabilizes. -/
def IsFactorizable (F : ℕ ⥤ C) : Prop :=
  ∀ i : ℕ, ∃ (j : ℕ) (hij : i ≤ j), ∀ (k : ℕ) (hjk : j ≤ k),
    ∃ t : F.obj k ⟶ F.obj j, F.map (homOfLE (hij.trans hjk)) ≫ t = F.map (homOfLE hij)

variable (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1))

/-- **2.5** The sequence `Hom(-, c₀) → Hom(-, c₁) → ⋯` of a chain `c₀ → c₁ → ⋯`, with maps
`Hom(-, f_i)`. -/
noncomputable def ModCat.bassDiagram : ℕ ⥤ ModCat.{v} C :=
  Functor.ofSequence fun i ↦ (ModCat.yoneda C).map (f i)

/-- **2.5, Bass's flat module** of a chain: `B = colim Hom(-, c_i)`. For `C = SingleObj Aᵐᵒᵖ` this
is Bass's module ([Bass, Lemma 1.1]; [Harada, Remark 1]). -/
noncomputable def ModCat.bassModule : ModCat.{v} C :=
  colimit (ModCat.bassDiagram c f)

/-- **2.5** Bass's module is zero exactly when every tail of the chain has a zero composite: for
every `i` some `c_i ⟶ c_j`, `j ≥ i`, vanishes. Used for T-nilpotence (4.1). -/
theorem ModCat.isZero_bassModule_iff :
    IsZero (ModCat.bassModule c f) ↔
      ∀ i : ℕ, ∃ (j : ℕ) (hij : i ≤ j), (Functor.ofSequence f).map (homOfLE hij) = 0 :=
  sorry

/-- **2.5** The telescope map on `⊕_i Hom(-, c_i)`: the `i`-th summand maps by
`ι_i - Hom(-, f_i) ≫ ι_{i+1}`. -/
noncomputable def ModCat.bassTelescope :
    (∐ fun i ↦ (ModCat.yoneda C).obj (c i)) ⟶ ∐ fun i ↦ (ModCat.yoneda C).obj (c i) :=
  Limits.Sigma.desc fun i ↦ Limits.Sigma.ι (fun i ↦ (ModCat.yoneda C).obj (c i)) i -
    (ModCat.yoneda C).map (f i) ≫ Limits.Sigma.ι (fun i ↦ (ModCat.yoneda C).obj (c i)) (i + 1)

/-- **2.5** The map `⊕_i Hom(-, c_i) → B`. -/
noncomputable def ModCat.bassπ :
    (∐ fun i ↦ (ModCat.yoneda C).obj (c i)) ⟶ ModCat.bassModule c f :=
  Limits.Sigma.desc fun i ↦ colimit.ι (ModCat.bassDiagram c f) i

theorem ModCat.bassTelescope_comp_bassπ :
    ModCat.bassTelescope c f ≫ ModCat.bassπ c f = 0 :=
  sorry

/-- **2.5, telescope presentation** `0 → ⊕ Hom(-, c_i) → ⊕ Hom(-, c_i) → B → 0`; so `B` has
projective dimension at most one. -/
theorem ModCat.bassTelescope_shortExact :
    (ShortComplex.mk _ _ (ModCat.bassTelescope_comp_bassπ c f)).ShortExact :=
  sorry

/-- **2.5** Bass's module is flat: a filtered colimit of representables (2.6). -/
instance : (ModCat.bassModule c f).Flat :=
  sorry

/-- **2.5** Bass's module is countably presented, by the telescope (0.8): the `ℵ₁`-presentability
that Theorem P (3′) uses. -/
instance [EssentiallySmall.{v} C] :
    IsCardinalPresentable (ModCat.bassModule c f) (Cardinal.aleph.{v} 1) :=
  sorry

/-- **2.5** If Bass's module is projective, the chain is factorizable: an adaptation of
[Bass, Lemma 1.3], with [Harada, Remark 1] for rings with enough idempotents. -/
theorem ModCat.isFactorizable_of_projective_bassModule
    [Projective (ModCat.bassModule c f)] : IsFactorizable (Functor.ofSequence f) :=
  sorry

end Bass

section BalancedBass

variable {A : Type u} [Ring A]

variable (A) in
/-- **2.5, rings** The relations of Bass's flat module: the span of the `eᵢ - aᵢ • eᵢ₊₁` in
`ℕ →₀ A`. -/
noncomputable def bassRelations (a : ℕ → A) : Submodule A (ℕ →₀ A) :=
  Submodule.span A (Set.range fun i ↦ Finsupp.single i 1 - Finsupp.single (i + 1) (a i))

/-- **2.5, rings** Bass's flat module is flat. -/
theorem balancedFlat_bassRelations (a : ℕ → A) :
    Module.BalancedFlat A ((ℕ →₀ A) ⧸ bassRelations A a) :=
  sorry

/-- **2.5, rings** If Bass's module is projective, the chain of principal right ideals
`a₀A ⊇ a₀a₁A ⊇ a₀a₁a₂A ⊇ ⋯` is eventually constant ([Bass, Lemmas 1.1–1.3]). -/
theorem exists_span_prod_eq_of_projective_bassRelations (a : ℕ → A)
    [Module.Projective A ((ℕ →₀ A) ⧸ bassRelations A a)] :
    ∃ n, ∀ m ≥ n, Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin m ↦ a i).prod} =
      Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin n ↦ a i).prod} :=
  sorry

end BalancedBass

/-! ### 2.6 Closure properties -/

section FlatClosure

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.6** Flatness passes to retracts. -/
theorem ModCat.Flat.of_retract {F F' : ModCat.{w} C} (r : Retract F' F) [F.Flat] :
    F'.Flat :=
  sorry

/-- **2.6** A direct sum is flat exactly when every summand is. -/
theorem ModCat.flat_sigma_iff {ι : Type w} (F : ι → ModCat.{w} C) :
    (∐ F).Flat ↔ ∀ i, (F i).Flat :=
  sorry

/-- **2.6** A filtered colimit of flat modules is flat: elements and relations come from a finite
stage (equational criterion; with smallness also 2.2, `Tor` and filtered colimits). -/
theorem ModCat.Flat.of_isColimit {J : Type w} [SmallCategory J] [IsFiltered J]
    {D : J ⥤ ModCat.{w} C} {c : Cocone D} (hc : IsColimit c) (h : ∀ j, (D.obj j).Flat) :
    c.pt.Flat :=
  sorry

variable [EssentiallySmall.{v} C]

/-- **2.6** Projective modules are flat (0.4). -/
instance ModCat.Flat.of_projective (F : ModCat.{v} C) [Projective F] : F.Flat :=
  sorry

/-- **2.6** In a short exact sequence with flat third term, the middle term is flat exactly when
the first is ([Mitchell, Cor. 10.4b, p. 49]). -/
theorem ModCat.flat_iff_of_shortExact {S : ShortComplex (ModCat.{v} C)}
    (hS : S.ShortExact) [S.X₃.Flat] : S.X₂.Flat ↔ S.X₁.Flat :=
  sorry

/-- **2.6, flat quotients**: for `0 → K → F → M → 0` with `F` flat, `M` is flat exactly when
`N ⊗_C K → N ⊗_C F` is a monomorphism for every covariant `N` ([Lam-FC, (24.23)]). -/
theorem ModCat.flat_iff_mono_tensor_of_shortExact {S : ShortComplex (ModCat.{v} C)}
    (hS : S.ShortExact) [S.X₂.Flat] :
    S.X₃.Flat ↔ ∀ N : ModCat.{v} Cᵒᵖ, Mono ((ModCat.tensor.obj N).map S.f) :=
  sorry

end FlatClosure

section BalancedFlatClosure

variable {A : Type u} [Ring A]
  {M M₁ M₂ M₃ : Type v} [AddCommGroup M] [Module A M] [AddCommGroup M₁] [Module A M₁]
  [AddCommGroup M₂] [Module A M₂] [AddCommGroup M₃] [Module A M₃]

/-- **2.6, rings** Projective modules are flat (an instance in Tau Ceti). -/
theorem Module.BalancedFlat.of_projective [Module.Projective A M] : Module.BalancedFlat A M :=
  sorry

/-- **2.6, rings** Flatness is invariant under linear equivalence. -/
theorem Module.BalancedFlat.of_linearEquiv (e : M₁ ≃ₗ[A] M₂) [Module.BalancedFlat A M₁] :
    Module.BalancedFlat A M₂ :=
  sorry

/-- **2.6, rings** A direct sum is flat exactly when every summand is. -/
theorem Module.balancedFlat_directSum_iff {ι : Type v} (N : ι → Type v)
    [∀ i, AddCommGroup (N i)] [∀ i, Module A (N i)] :
    Module.BalancedFlat A (⨁ i, N i) ↔ ∀ i, Module.BalancedFlat A (N i) :=
  sorry

/-- **2.6, rings** In a short exact sequence with flat third term, the middle term is flat exactly
when the first is ([Lam-LMR, (4.13), p. 126], for "the first and third flat ⇒ the middle flat"). -/
theorem Module.balancedFlat_iff_of_exact {f : M₁ →ₗ[A] M₂} {g : M₂ →ₗ[A] M₃}
    (hf : Function.Injective f) (hfg : Function.Exact f g) (hg : Function.Surjective g)
    [Module.BalancedFlat A M₃] : Module.BalancedFlat A M₂ ↔ Module.BalancedFlat A M₁ :=
  sorry

/-- **2.6, rings: flat quotients**: if `F` and `F ⧸ K` are flat, then `K ∩ IF = IK` for every
two-sided ideal `I` ([Lam-LMR, (4.14)]). -/
theorem Submodule.inf_smul_eq_smul_of_balancedFlat {F : Type v} [AddCommGroup F] [Module A F]
    [Module.BalancedFlat A F] (K : Submodule A F) [Module.BalancedFlat A (F ⧸ K)] (I : Ideal A)
    [I.IsTwoSided] : K ⊓ I • (⊤ : Submodule A F) = I • K :=
  sorry

end BalancedFlatClosure

/-- **Layer 2 check** `ℤ ⧸ n` is not flat for `n ≥ 2`. -/
theorem not_balancedFlat_zmod (n : ℕ) (hn : 2 ≤ n) : ¬ Module.BalancedFlat ℤ (ZMod n) :=
  sorry

/-! ## Layer 3: flat dimension, global and weak global dimension, and Auslander's theorem

Dimensions are category-primary. The flat dimension of a module `F` of `Mod C` is defined by the
vanishing of `Tor_i(Hom(X, -) ⧸ I, F)` for the finitely presented cyclic covariant functors, the
shape of Mathlib's `projectiveDimension`; flat dimension `≤ 0` is Layer 2's flatness. The global
dimension is defined for any abelian category, and Tau Ceti's ring `TauCeti.globalDimension` is the
case `ModuleCat A`. The weak global dimension of `C` is the supremum of the flat dimensions of the
modules of `Mod C`; it is left-right symmetric. Auslander's theorem says that it equals the global
dimension of `Mod C` when every representable `Hom(-, X)` is a Noetherian object. Rings keep native
definitions with bridges to `SingleObj Aᵐᵒᵖ`. `Tor` takes values in abelian groups, so no base
ring enters the dimensions. -/

/-! ### 3.1 Flat dimension -/

section FlatDimension

open ModCat

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **3.1** `F` has flat dimension `< n`: `Tor_i(Hom(X, -) ⧸ I, F) = 0` for every `i ≥ n`, every
object `X` and every finitely generated subfunctor `I ⊆ Hom(X, -)`. Universe-free: it quantifies
over objects and finite families of morphisms of `C`. The shape of Mathlib's
`HasProjectiveDimensionLT`; flat dimension `< 1` is flatness (2.2 (5)). A covariant functor has the
flat dimension of a module over `Cᵒᵖ`. -/
class ModCat.HasFlatDimensionLT (F : ModCat.{v} C) (n : ℕ) : Prop where
  isZero_tor ⦃i : ℕ⦄ (hi : n ≤ i) ⦃X : C⦄ ⦃m : ℕ⦄ ⦃Y : Fin m → C⦄ (β : ∀ j, X ⟶ Y j) :
    IsZero (((tor i).obj (cokernel (ModCat.coyonedaSpan β).arrow)).obj F)

/-- **3.1** `F` has flat dimension `≤ n`. -/
abbrev ModCat.HasFlatDimensionLE (F : ModCat.{v} C) (n : ℕ) : Prop :=
  F.HasFlatDimensionLT (n + 1)

theorem ModCat.HasFlatDimensionLT.of_le {F : ModCat.{v} C} {n m : ℕ}
    (h : F.HasFlatDimensionLT n) (hnm : n ≤ m) : F.HasFlatDimensionLT m :=
  ⟨fun _ hi _ _ _ β ↦ h.isZero_tor (hnm.trans hi) β⟩

/-- **3.1** The flat dimension, in `WithBot ℕ∞`, `⊥` exactly for the zero module. The shape of
Mathlib's `projectiveDimension`. -/
noncomputable def ModCat.flatDimension (F : ModCat.{v} C) : WithBot ℕ∞ :=
  sInf {d : WithBot ℕ∞ | ∀ i : ℕ, d < i → F.HasFlatDimensionLT i}

theorem ModCat.flatDimension_le_iff (F : ModCat.{v} C) (n : ℕ) :
    F.flatDimension ≤ n ↔ F.HasFlatDimensionLE n :=
  sorry

theorem ModCat.flatDimension_eq_bot_iff (F : ModCat.{v} C) :
    F.flatDimension = ⊥ ↔ IsZero F :=
  sorry

/-- **3.1** Flat dimension `≤ 0` is flatness: the definition at `n = 0` is 2.2 (5). -/
theorem ModCat.hasFlatDimensionLE_zero_iff (F : ModCat.{v} C) :
    F.HasFlatDimensionLE 0 ↔ F.Flat :=
  sorry

/-- **3.1, the classical definition**: for `n : ℕ`, the following are equivalent: (1) flat
dimension `≤ n`; (2) `Tor_i(-, F) = 0` for all `i > n`; (3) `Tor_{n+1}(-, F) = 0`; (4) `F` has a
flat resolution of length `≤ n`; (5) the `n`-th syzygy of every projective resolution is flat;
(6) the `n`-th syzygy of some projective resolution is flat. The `n`-th syzygy of a projective
resolution `P` is `P.complex.opcycles n = coker (P_{n+1} → P_n)`; for `n = 0` it is `F`. Route:
dimension shifting in either variable (1.2, 1.3); (1) ⇒ (5) is 2.2 (5) applied to the `n`-th
syzygy `K`, since `Tor_1(-, K) ≅ Tor_{n+1}(-, F)`. (2) holds for covariant functors in every
universe; in Lean it is stated in the universe `v`. -/
theorem ModCat.hasFlatDimensionLE_tfae (F : ModCat.{v} C) (n : ℕ) :
    List.TFAE
      [F.HasFlatDimensionLE n,
        ∀ (G : ModCat.{v} Cᵒᵖ) (i : ℕ), n < i → IsZero (((tor i).obj G).obj F),
        ∀ G : ModCat.{v} Cᵒᵖ, IsZero (((tor (n + 1)).obj G).obj F),
        ∃ (K : ChainComplex (ModCat.{v} C) ℕ) (π : K ⟶ (ChainComplex.single₀ _).obj F),
          QuasiIso π ∧ (∀ i, ModCat.Flat (K.X i)) ∧ ∀ i, n < i → IsZero (K.X i),
        ∀ P : ProjectiveResolution F, ModCat.Flat (P.complex.opcycles n),
        ∃ P : ProjectiveResolution F, ModCat.Flat (P.complex.opcycles n)] :=
  sorry

/-- **3.1** Flat dimension is at most projective dimension (2.6: projective modules are flat). -/
theorem ModCat.flatDimension_le_projectiveDimension (F : ModCat.{v} C) :
    F.flatDimension ≤ projectiveDimension F :=
  sorry

/-- **3.1, dimension shifting** along `0 → K → P → M → 0` with `P` flat. -/
theorem ModCat.hasFlatDimensionLE_succ_iff {S : ShortComplex (ModCat.{v} C)}
    (hS : S.ShortExact) [S.X₂.Flat] (n : ℕ) :
    S.X₃.HasFlatDimensionLE (n + 1) ↔ S.X₁.HasFlatDimensionLE n :=
  sorry

/-- **3.1** `Tor` is computed by flat resolutions: for a flat resolution `K → F`,
`Tor_n(G, F) ≅ H_n(G ⊗_C K)`. Route: the balance (1.3) computes both sides from a projective
resolution of `G`, and `- ⊗_C K_q` is exact (2.2). -/
noncomputable def ModCat.torObjIsoHomologyOfFlat (G : ModCat.{v} Cᵒᵖ) {F : ModCat.{v} C}
    (K : ChainComplex (ModCat.{v} C) ℕ) (π : K ⟶ (ChainComplex.single₀ _).obj F)
    [QuasiIso π] (hK : ∀ i, ModCat.Flat (K.X i)) (n : ℕ) :
    ((tor n).obj G).obj F ≅
      (HomologicalComplex.homologyFunctor _ _ n).obj
        (((tensor.obj G).mapHomologicalComplex _).obj K) :=
  sorry

/-- **3.1, duality**: for an injective cogenerator `E` of `R`-modules, the flat dimension of `F` is
the injective dimension of its dual `F^E`, a covariant functor (Layer 1's `Tor`–`Ext` duality;
[Lam-LMR, (5.57)] for rings and `E = ℚ ⧸ ℤ`, stated for right modules in Lam; applied to
`Aᵐᵒᵖ`). -/
theorem ModCat.flatDimension_eq_injectiveDimension_dual (R : Type*) [CommRing R]
    [Linear R C] (E : ModuleCat.{v} R) [Injective E] (hE : IsCoseparator E)
    (F : ModCat.{v} C) :
    F.flatDimension = injectiveDimension ((ModCat.dual R E).obj (op F)) :=
  sorry

end FlatDimension

section RingFlatDimension

variable {A : Type u} [Ring A] [Small.{v} A]

/-- **3.1, rings** `M` has flat dimension `< n`: `Tor_i^A(A ⧸ I, M) = 0` for every `i ≥ n` and
every finitely generated right ideal `I`. Native (Convention 5); the shape of Mathlib's
`HasProjectiveDimensionLT`. -/
class HasFlatDimensionLT (M : ModuleCat.{v} A) (n : ℕ) : Prop where
  isZero ⦃i : ℕ⦄ (hi : n ≤ i) ⦃I : Submodule Aᵐᵒᵖ A⦄ (hI : I.FG) :
    IsZero (((BalancedTor.{v} ℤ A i).obj (ModuleCat.of Aᵐᵒᵖ (Shrink.{v} (A ⧸ I)))).obj M)

/-- **3.1, rings** `M` has flat dimension `≤ n`. -/
abbrev HasFlatDimensionLE (M : ModuleCat.{v} A) (n : ℕ) : Prop :=
  HasFlatDimensionLT M (n + 1)

/-- **3.1, rings** The flat dimension, in `WithBot ℕ∞`, `⊥` exactly for the zero module. -/
noncomputable def flatDimension (M : ModuleCat.{v} A) : WithBot ℕ∞ :=
  sInf {d : WithBot ℕ∞ | ∀ i : ℕ, d < i → HasFlatDimensionLT M i}

theorem flatDimension_eq_bot_iff (M : ModuleCat.{v} A) : flatDimension M = ⊥ ↔ IsZero M :=
  sorry

/-- **3.1, rings** Flat dimension `≤ 0` is flatness. -/
theorem hasFlatDimensionLE_zero_iff (M : ModuleCat.{v} A) :
    HasFlatDimensionLE M 0 ↔ Module.BalancedFlat A M :=
  sorry

/-- **3.1, rings: the classical definition**: flat dimension `≤ n`; `Tor_i^A(-, M) = 0` for
`i > n`; `Tor_{n+1}^A(-, M) = 0`; the `n`-th syzygy of every, or of some, projective resolution
is flat. -/
theorem hasFlatDimensionLE_tfae (M : ModuleCat.{v} A) (n : ℕ) :
    List.TFAE
      [HasFlatDimensionLE M n,
        ∀ (N : ModuleCat.{v} Aᵐᵒᵖ) (i : ℕ), n < i →
          IsZero (((BalancedTor.{v} ℤ A i).obj N).obj M),
        ∀ N : ModuleCat.{v} Aᵐᵒᵖ, IsZero (((BalancedTor.{v} ℤ A (n + 1)).obj N).obj M),
        ∀ P : ProjectiveResolution M, Module.BalancedFlat A (P.complex.opcycles n),
        ∃ P : ProjectiveResolution M, Module.BalancedFlat A (P.complex.opcycles n)] :=
  sorry

theorem flatDimension_le_projectiveDimension (M : ModuleCat.{v} A) :
    flatDimension M ≤ projectiveDimension M :=
  sorry

/-- **3.1, rings: dimension shifting** along `0 → K → F → M → 0` with `F` flat. -/
theorem hasFlatDimensionLE_succ_iff {S : ShortComplex (ModuleCat.{v} A)} (hS : S.ShortExact)
    [Module.BalancedFlat A S.X₂] (n : ℕ) :
    HasFlatDimensionLE S.X₃ (n + 1) ↔ HasFlatDimensionLE S.X₁ n :=
  sorry

/-- **3.1, rings: character modules** The flat dimension of `M` is the injective dimension of its
character module ([Lam-LMR, (5.57)], stated for right modules in Lam; applied to `Aᵐᵒᵖ`): the
case `R = ℤ`, `E = ℚ ⧸ ℤ` of the categorical duality. -/
theorem flatDimension_eq_injectiveDimension_characterModule (M : ModuleCat.{v} A) :
    flatDimension M =
      injectiveDimension (ModuleCat.of Aᵐᵒᵖ (MatlisDual ℤ (AddCircle (1 : ℚ)) M)) :=
  sorry

/-- **3.1, rings** Ring flat dimension is flat dimension over `SingleObj Aᵐᵒᵖ` (0.2). -/
theorem hasFlatDimensionLT_iff_singleObj {A : Type u} [Ring A] (M : ModuleCat.{u} A) (n : ℕ) :
    HasFlatDimensionLT M n ↔
      ModCat.HasFlatDimensionLT ((moduleCatEquivModCat.{u} A).functor.obj M) n :=
  sorry

end RingFlatDimension

/-! ### 3.2 Global dimension of an abelian category -/

section GlobalDimension

variable (𝒜 : Type u) [Category.{v} 𝒜] [Abelian 𝒜]

/-- **3.2** The global dimension of an abelian category: the supremum of the projective dimensions
of its objects ([Mitchell, §9, p. 42]). Tau Ceti's ring `TauCeti.globalDimension` is the case
`ModuleCat A`, and becomes this special case. -/
noncomputable def Abelian.globalDimension : WithBot ℕ∞ :=
  ⨆ X : 𝒜, projectiveDimension X

variable {𝒜} in
theorem Abelian.projectiveDimension_le_globalDimension (X : 𝒜) :
    projectiveDimension X ≤ Abelian.globalDimension 𝒜 :=
  le_iSup (fun X : 𝒜 ↦ projectiveDimension X) X

theorem Abelian.globalDimension_le_iff (n : ℕ) :
    Abelian.globalDimension 𝒜 ≤ n ↔ ∀ X : 𝒜, HasProjectiveDimensionLE X n := by
  simp [Abelian.globalDimension, projectiveDimension_le_iff]

theorem Abelian.globalDimension_eq_bot_iff :
    Abelian.globalDimension 𝒜 = ⊥ ↔ ∀ X : 𝒜, IsZero X := by
  simp [Abelian.globalDimension, projectiveDimension_eq_bot_iff]

/-- **3.2** The global dimension is also the supremum of the injective dimensions: both say that
`Ext^i` vanishes for `i` above the bound. -/
theorem Abelian.globalDimension_eq_iSup_injectiveDimension :
    Abelian.globalDimension 𝒜 = ⨆ X : 𝒜, injectiveDimension X :=
  sorry

/-- **3.2** `gldim 𝒜ᵒᵖ = gldim 𝒜` ([Mitchell, §9, p. 42]). -/
theorem Abelian.globalDimension_opposite :
    Abelian.globalDimension 𝒜ᵒᵖ = Abelian.globalDimension 𝒜 :=
  sorry

/-- **3.2** Equivalent abelian categories have the same global dimension. -/
theorem Abelian.globalDimension_eq_of_equivalence {ℬ : Type*} [Category ℬ] [Abelian ℬ]
    (e : 𝒜 ≌ ℬ) : Abelian.globalDimension 𝒜 = Abelian.globalDimension ℬ :=
  sorry

/-- **3.2, rings**: Tau Ceti's `TauCeti.globalDimension A` is the global dimension of
`ModuleCat A`; the refactor of 3.2 makes this the definition. -/
theorem globalDimension_eq_abelianGlobalDimension (A : Type u) [Ring A] :
    TauCeti.globalDimension.{v} A = Abelian.globalDimension (ModuleCat.{v} A) := by
  rw [TauCeti.globalDimension_def]; rfl

end GlobalDimension

section ModCatGlobalDimension

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **3.2, Auslander's lemma for `Mod C`**: the global dimension of `Mod C` is at most `n` exactly
when every cyclic module `Hom(-, X) ⧸ I` has projective dimension at most `n` ([Au, Thm. 1, p. 68]
for rings). Route: an injective dimension bound (3.2) checked by the Baer criterion of 2.2 on a
cosyzygy. Tau Ceti's `TauCeti.globalDimension_le_tfae` follows. The other side, with the cyclic
covariant functors `Hom(X, -) ⧸ I`, is the statement over `Cᵒᵖ`. -/
theorem ModCat.globalDimension_le_iff_cyclic [EssentiallySmall.{v} C] (n : ℕ) :
    Abelian.globalDimension (ModCat.{v} C) ≤ n ↔
      ∀ (X : C) (I : Subobject ((ModCat.yoneda C).obj X)),
        HasProjectiveDimensionLE (cokernel I.arrow) n :=
  sorry

/-- **3.2, universe independence**: both global dimensions are computed by the cyclic modules
of a small model, which live in one universe. -/
theorem ModCat.globalDimension_eq_globalDimension [EssentiallySmall.{w} C]
    [EssentiallySmall.{t} C] :
    Abelian.globalDimension (ModCat.{w} C) = Abelian.globalDimension (ModCat.{t} C) :=
  sorry

/-- **3.2, rings**: the (left) global dimension of `A` is that of `Mod` over `SingleObj Aᵐᵒᵖ`
(0.2). -/
theorem globalDimension_eq_globalDimension_singleObj (A : Type u) [Ring A] :
    TauCeti.globalDimension.{u} A = Abelian.globalDimension (ModCat.{u} (SingleObj Aᵐᵒᵖ)) :=
  sorry

end ModCatGlobalDimension

/-! ### 3.3 Weak global dimension -/

section WeakGlobalDimension

open ModCat

variable (C : Type u) [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **3.3** The weak global dimension of `C`: the supremum of the flat dimensions of the modules of
`Mod C`. It is left-right symmetric (`ModCat.weakGlobalDimension_op`), so it is also the supremum
over the covariant functors. -/
noncomputable def ModCat.weakGlobalDimension : WithBot ℕ∞ :=
  ⨆ F : ModCat.{v} C, F.flatDimension

theorem ModCat.weakGlobalDimension_le_iff (n : ℕ) :
    ModCat.weakGlobalDimension C ≤ n ↔
      ∀ (G : ModCat.{v} Cᵒᵖ) (F : ModCat.{v} C), IsZero (((tor (n + 1)).obj G).obj F) :=
  sorry

/-- **3.3, symmetry** ([Au, p. 70]; [Lam-LMR, (5.63)] for rings): from the balance (1.3). -/
theorem ModCat.weakGlobalDimension_op :
    ModCat.weakGlobalDimension Cᵒᵖ = ModCat.weakGlobalDimension C :=
  sorry

/-- **3.3, universe-free tests**: `wgldim C ≤ n`; every cyclic covariant functor `Hom(X, -) ⧸ I`
with `I` finitely generated has flat dimension `≤ n`; every finitely presented covariant functor
has flat dimension `≤ n` ([Lam-LMR, (5.69)] for rings). By the definition of flat dimension, the
second item tests only `Tor` between finitely presented cyclic modules on both sides. -/
theorem ModCat.weakGlobalDimension_le_tfae (n : ℕ) :
    List.TFAE
      [ModCat.weakGlobalDimension C ≤ n,
        ∀ ⦃X : C⦄ ⦃m : ℕ⦄ ⦃Y : Fin m → C⦄ (β : ∀ j, X ⟶ Y j),
          ModCat.HasFlatDimensionLE (cokernel (ModCat.coyonedaSpan β).arrow) n,
        ∀ G : ModCat.{v} Cᵒᵖ, IsFinitelyPresentedFunctor G.obj → ModCat.HasFlatDimensionLE G n] :=
  sorry

/-- **3.3, bounds** by the global dimension of `Mod C` ([Lam-LMR, (5.58)] for rings). -/
theorem ModCat.weakGlobalDimension_le_globalDimension :
    ModCat.weakGlobalDimension C ≤ Abelian.globalDimension (ModCat.{v} C) :=
  sorry

/-- **3.3, bounds** by the global dimension of the other side. -/
theorem ModCat.weakGlobalDimension_le_globalDimension_op :
    ModCat.weakGlobalDimension C ≤ Abelian.globalDimension (ModCat.{v} Cᵒᵖ) :=
  sorry

/-- **3.3, from projective dimension**: if every finitely presented covariant functor has
projective dimension `≤ n`, then `wgldim C ≤ n`. Consumer: ArtinAlgebras §7.5 (right modules). -/
theorem ModCat.weakGlobalDimension_le_of_forall_isFinitelyPresentedFunctor (n : ℕ)
    (h : ∀ G : ModCat.{v} Cᵒᵖ, IsFinitelyPresentedFunctor G.obj → HasProjectiveDimensionLE G n) :
    ModCat.weakGlobalDimension C ≤ n :=
  sorry

theorem ModCat.weakGlobalDimension_eq_bot_iff :
    ModCat.weakGlobalDimension C = ⊥ ↔ ∀ X : C, IsZero X :=
  sorry

/-- **3.3** Every module is flat exactly when the weak global dimension is at most `0`; by
[St, Thm. 4, p. 359] (finitely presented generators `Hom(-, X)`, condition (f′)) this holds exactly
when `C` is von Neumann regular: every `α` has a `φ` with `α = α φ α`. -/
theorem ModCat.weakGlobalDimension_le_zero_iff :
    ModCat.weakGlobalDimension C ≤ 0 ↔ ∀ F : ModCat.{v} C, F.Flat :=
  sorry

end WeakGlobalDimension

section RingWeakGlobalDimension

variable {A : Type u} [Ring A] [Small.{v} A]

variable (A) in
/-- **3.3, rings** The weak global dimension, native. -/
noncomputable def weakGlobalDimension : WithBot ℕ∞ :=
  ⨆ M : ModuleCat.{v} A, flatDimension M

theorem weakGlobalDimension_le_iff (n : ℕ) :
    weakGlobalDimension.{v} A ≤ n ↔
      ∀ (N : ModuleCat.{v} Aᵐᵒᵖ) (M : ModuleCat.{v} A),
        IsZero (((BalancedTor.{v} ℤ A (n + 1)).obj N).obj M) :=
  sorry

variable (A) in
/-- **3.3, rings: symmetry** ([Au, p. 70]; [Lam-LMR, (5.63)]). -/
theorem weakGlobalDimension_mulOpposite :
    weakGlobalDimension.{v} Aᵐᵒᵖ = weakGlobalDimension.{v} A :=
  sorry

variable (A) in
/-- **3.3, rings: bounds** by the left global dimension ([Lam-LMR, (5.58)]). -/
theorem weakGlobalDimension_le_globalDimension :
    weakGlobalDimension.{v} A ≤ TauCeti.globalDimension.{v} A :=
  sorry

variable (A) in
/-- **3.3, rings: bounds** by the right global dimension. -/
theorem weakGlobalDimension_le_globalDimension_mulOpposite :
    weakGlobalDimension.{v} A ≤ TauCeti.globalDimension.{v} Aᵐᵒᵖ :=
  sorry

/-- **3.3, rings: tests**: finitely presented right modules, and cyclic right modules with
finitely generated relations ([Lam-LMR, (5.69)]). -/
theorem weakGlobalDimension_le_tfae (n : ℕ) :
    List.TFAE
      [weakGlobalDimension.{v} A ≤ n,
        ∀ N : ModuleCat.{v} Aᵐᵒᵖ, Module.FinitePresentation Aᵐᵒᵖ N → flatDimension N ≤ n,
        ∀ I : Submodule Aᵐᵒᵖ A, I.FG →
          flatDimension (ModuleCat.of Aᵐᵒᵖ (Shrink.{v} (A ⧸ I))) ≤ n] :=
  sorry

/-- **3.3, rings: from projective dimension**. -/
theorem weakGlobalDimension_le_of_forall_finitePresentation (n : ℕ)
    (h : ∀ N : ModuleCat.{v} Aᵐᵒᵖ, Module.FinitePresentation Aᵐᵒᵖ N →
      HasProjectiveDimensionLE N n) :
    weakGlobalDimension.{v} A ≤ n :=
  sorry

variable (A) in
theorem weakGlobalDimension_eq_bot_iff : weakGlobalDimension.{v} A = ⊥ ↔ Subsingleton A :=
  sorry

variable (A) in
theorem weakGlobalDimension_eq_zero_of_isSemisimpleRing [IsSemisimpleRing A] [Nontrivial A] :
    weakGlobalDimension.{v} A = 0 :=
  sorry

/-- **3.3, rings**: the ring weak global dimension is that of `SingleObj Aᵐᵒᵖ`. -/
theorem weakGlobalDimension_eq_weakGlobalDimension_singleObj (A : Type u) [Ring A] :
    weakGlobalDimension.{u} A = ModCat.weakGlobalDimension (SingleObj Aᵐᵒᵖ) :=
  sorry

end RingWeakGlobalDimension

/-! ### 3.4 Auslander's theorem -/

section Auslander

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **3.4, the `FP_∞` lemma**: a module with a projective resolution by finitely generated
projectives has equal flat and projective dimension. No Noetherian hypothesis. Route: if the flat
dimension is `n`, the `n`-th syzygy `coker (P_{n+1} → P_n)` is finitely presented and flat (3.1),
hence projective (2.2). -/
theorem ModCat.flatDimension_eq_projectiveDimension_of_projectiveResolution
    (F : ModCat.{v} C) (P : ProjectiveResolution F)
    (hP : ∀ i, ModCat.proj C (P.complex.X i)) :
    F.flatDimension = projectiveDimension F :=
  sorry

variable (C)

/-- **3.4, Auslander's theorem** ([Au, Thm. 4, p. 70]; [Lam-LMR, (5.59)] for rings, stated for
right modules over a right Noetherian ring in Lam; applied to `Aᵐᵒᵖ`; [OR, Thm. 4.3, p. 103],
categorical: the global dimension of the coherent functors equals the weak global dimension when
`[X°, Mod K]` is locally coherent): if every representable `Hom(-, X)` is a Noetherian object of
`Mod C` (for `SingleObj Aᵐᵒᵖ`: `A` is left Noetherian), the global dimension of `Mod C` equals the
weak global dimension. Route: the cyclic modules of 3.2 have resolutions by finitely generated
projectives, then the `FP_∞` lemma; the other side is the theorem over `Cᵒᵖ` with 3.3's
symmetry. -/
theorem ModCat.globalDimension_eq_weakGlobalDimension
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda C).obj X)] :
    Abelian.globalDimension (ModCat.{v} C) = ModCat.weakGlobalDimension C :=
  sorry

/-- **3.4, the bound**: if every `Hom(-, X)` is Noetherian, a bound on the projective dimension of
the finitely presented covariant functors bounds the global dimension of `Mod C` (3.3 and the
theorem). No Noetherian hypothesis on the other side. -/
theorem ModCat.globalDimension_le_of_forall_isFinitelyPresentedFunctor
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda C).obj X)] (n : ℕ)
    (h : ∀ G : ModCat.{v} Cᵒᵖ, IsFinitelyPresentedFunctor G.obj → HasProjectiveDimensionLE G n) :
    Abelian.globalDimension (ModCat.{v} C) ≤ n :=
  sorry

/-- **3.4, symmetry**: if the representables of both sides are Noetherian objects, the global
dimensions of `Mod C` and `Mod Cᵒᵖ` agree ([Au, Cor. 5, p. 70] for rings). -/
theorem ModCat.globalDimension_op_eq_of_isNoetherianObject
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda C).obj X)]
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda Cᵒᵖ).obj (op X))] :
    Abelian.globalDimension (ModCat.{v} Cᵒᵖ) = Abelian.globalDimension (ModCat.{v} C) :=
  sorry

end Auslander

section RingAuslander

variable {A : Type u} [Ring A] [Small.{v} A]

/-- **3.4, rings: the `FP_∞` lemma** for a projective resolution by finite projectives. -/
theorem flatDimension_eq_projectiveDimension_of_projectiveResolution (M : ModuleCat.{v} A)
    (P : ProjectiveResolution M) (hP : ∀ i, Module.Finite A (P.complex.X i)) :
    flatDimension M = projectiveDimension M :=
  sorry

/-- **3.4, rings** Over a left Noetherian ring, a finite module has equal flat and projective
dimension. -/
theorem flatDimension_eq_projectiveDimension_of_finite [IsNoetherianRing A] (M : ModuleCat.{v} A)
    [Module.Finite A M] : flatDimension M = projectiveDimension M :=
  sorry

variable (A) in
/-- **3.4, rings: Auslander's theorem**: a left Noetherian ring has equal left global and weak
global dimension. -/
theorem globalDimension_eq_weakGlobalDimension [IsNoetherianRing A] :
    TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A :=
  sorry

/-- **3.4, rings: left bound**: over a left Noetherian ring, a bound on the projective dimension
of the finitely presented right modules bounds the left global dimension. Consumer:
ArtinAlgebras §7.5. -/
theorem globalDimension_le_of_forall_finitePresentation_mulOpposite [IsNoetherianRing A] (n : ℕ)
    (h : ∀ N : ModuleCat.{v} Aᵐᵒᵖ, Module.FinitePresentation Aᵐᵒᵖ N →
      HasProjectiveDimensionLE N n) :
    TauCeti.globalDimension.{v} A ≤ n :=
  sorry

end RingAuslander

/-! ### 3.5 Kernels of flat modules and countably presented flat modules -/

section Extras

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

variable (C) in
/-- **3.5** The flat modules are closed under kernels exactly when the weak global dimension is at
most two ([CB, Thm. 2.3, p. 1651], for contravariant functors, as here). Route: dimension shifting
along `0 → ker f → F → F' → coker f → 0`. -/
theorem ModCat.forall_flat_kernel_iff :
    (∀ ⦃F F' : ModCat.{v} C⦄ (f : F ⟶ F'), ModCat.Flat F → ModCat.Flat F' →
      ModCat.Flat (kernel f)) ↔ ModCat.weakGlobalDimension C ≤ 2 :=
  sorry

/-- **3.5** The colimit of a sequence of projective modules has projective dimension at most one:
the telescope `0 → ⊕ D_i → ⊕ D_i → colim D → 0`, as for Bass's module (2.5). -/
theorem ModCat.hasProjectiveDimensionLE_one_colimit (D : ℕ ⥤ ModCat.{v} C)
    [∀ i, Projective (D.obj i)] : HasProjectiveDimensionLE (colimit D) 1 :=
  sorry

/-- **3.5, Jensen**: a countably presented (`ℵ₁`-presentable) flat module has projective dimension
at most one ([Jensen, Lemma 2, pp. 98–100], for rings whose left ideals are countably generated;
[Osofsky-Nagoya, Lemma 1.2, p. 316]; [Mitchell, p. 49]).
Route: write `F` as a filtered colimit of finite sums of representables (2.3) and, with a countable
presentation (0.8), build a sequence `D_0 → D_1 → ⋯` of stages by recursion: at step `n`, lift the
`n`-th generator and the not yet lifted generators in the `n`-th relation to a common stage that
receives all earlier lifts (each lift is chosen once and then moved by the transition maps), and
pass to a later stage where the `n`-th relation vanishes at the chosen lifts. Then `F` is a retract
of the colimit, which has projective dimension `≤ 1` by the previous item. No isomorphism between
`F` and the colimit is needed. -/
theorem ModCat.Flat.hasProjectiveDimensionLE_one (F : ModCat.{v} C) [F.Flat]
    [IsCardinalPresentable F (Cardinal.aleph.{v} 1)] :
    HasProjectiveDimensionLE F 1 :=
  sorry

end Extras

/-! ## Layer 4: semiperfect and perfect categories, and Bass's Theorem P

Category-primary. `J(C)` is Tau Ceti's radical `TauCeti.jacobsonRadicalIdeal C`, and `C ⧸ J(C)` is
the quotient category `(TauCeti.jacobsonRadicalIdeal C).Quotient`. Modules are the modules of
`Mod C` (contravariant functors); [Simson] and [Harada] use covariant modules, so their statements
are applied to `Cᵒᵖ`. T-nilpotence is defined for left ideals of `C` (0.3), on sequences
`c₀ → c₁ → ⋯` with composites `c₀ → c_n`, the direction of Nakayama's lemma for `Mod C`; a
two-sided ideal such as `J(C)` enters through the coercion. For `SingleObj Aᵐᵒᵖ` the composite of
`op a₀, …, op aₙ₋₁` is `op (a₀ ⋯ aₙ₋₁)`, Bass's left T-nilpotence. A projective cover is an
essential epimorphism (`TauCeti.IsEssentialEpi`) from a projective object. The statements are in
the universe `v` of the morphisms, where the representables and Bass's modules (2.5) live; the
README states them for `EssentiallySmall.{w} C`. Rings keep native classes with `SingleObj Aᵐᵒᵖ`
bridges, and the ring theorems are derived from the categorical ones. -/

/-! ### 4.1 T-nilpotence and Nakayama's lemma for all modules -/

section TNilpotentCategory

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **4.1** A left ideal `I` of `C` is **T-nilpotent** if for every sequence `c₀ → c₁ → ⋯` with
every `f i ∈ I` some composite `f 0 ≫ ⋯ ≫ f (n - 1) : c 0 ⟶ c n` vanishes. This is the direction
of Nakayama's lemma for `Mod C`; the other side is `I.op.IsTNilpotent` for a right ideal `I`
(`RightMorphismIdeal.op`). For `C = SingleObj Aᵐᵒᵖ` and `f i = op aᵢ` the composite is
`op (a₀ a₁ ⋯ aₙ₋₁)` (Mathlib's `f ≫ g = g * f` in `Aᵐᵒᵖ`), so this is Bass's left T-nilpotence;
[Simson, p. 108] states it for chains `c₀ ← c₁ ← ⋯`, that is, on `Cᵒᵖ`. -/
def LeftMorphismIdeal.IsTNilpotent (I : LeftMorphismIdeal C) : Prop :=
  ∀ (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)), (∀ i, f i ∈ I.hom (c i) (c (i + 1))) →
    ∃ n : ℕ, (Functor.ofSequence f).map (homOfLE (Nat.zero_le n)) = 0

theorem LeftMorphismIdeal.IsTNilpotent.mono {I I' : LeftMorphismIdeal C}
    (h : I'.IsTNilpotent) (hI : I ≤ I') : I.IsTNilpotent :=
  fun c f hf ↦ h c f fun i ↦ LeftMorphismIdeal.le_def.mp hI _ (hf i)

/-- **4.1** A nilpotent two-sided ideal is T-nilpotent. -/
theorem MorphismIdeal.isTNilpotent_of_pow_eq_bot {I : TauCeti.MorphismIdeal C} {n : ℕ}
    (h : I ^ n = ⊥) : (I : LeftMorphismIdeal C).IsTNilpotent :=
  sorry

/-- **4.1** A nilpotent two-sided ideal is T-nilpotent on the other side. -/
theorem MorphismIdeal.isTNilpotent_op_of_pow_eq_bot {I : TauCeti.MorphismIdeal C} {n : ℕ}
    (h : I ^ n = ⊥) : (I.op : LeftMorphismIdeal Cᵒᵖ).IsTNilpotent :=
  sorry

/-- **4.1, Bass's Nakayama lemma** in every universe ([Simson, Lemma 5.3, p. 108], for `J(C)`, on
`Cᵒᵖ`, with the remark that Bass's arguments generalize; the dependent-choice proof below and the
general left ideal are this roadmap's adaptation): for a T-nilpotent left ideal `I`, `I · M = M`
implies `M = 0`. Route: keep `M(q_n)(x_n) ≠ 0` by dependent choice, for
`q_n = f 0 ≫ ⋯ ≫ f (n - 1)`; a summand `M(f)(y)` of `x_n` with `f ∈ I(c_n, d)` keeps
`M(q_n ≫ f)(y) ≠ 0`. [Bass, pp. 473–474] uses König's graph theorem instead. -/
theorem LeftMorphismIdeal.IsTNilpotent.isZero_of_smul_eq_top {I : LeftMorphismIdeal C}
    (hI : I.IsTNilpotent) (M : ModCat.{w} C) (h : I.smul M = ⊤) : IsZero M :=
  sorry

/-- **4.1** For a T-nilpotent left ideal `I`, `I · M` is superfluous in every module, in every
universe. -/
theorem LeftMorphismIdeal.IsTNilpotent.isSuperfluous_smul {I : LeftMorphismIdeal C}
    (hI : I.IsTNilpotent) (M : ModCat.{w} C) : IsSuperfluous (I.smul M) :=
  sorry

/-- **4.1, Nakayama's lemma for all modules**, for a left ideal `I`: (1) `I` is T-nilpotent; (2)
`I · M = M` implies `M = 0`; (3) `I · M` is superfluous in every `M`. (1) ⇒ (2) by dependent
choice, (2) ⇔ (3) as usual, (2) ⇒ (1) through Bass's module `B` of an `I`-sequence (2.5):
`[𝟙 c₀] ≠ 0` while no `q_n` vanishes, and `B = I · B`, since the class of `g : d ⟶ c i` is that of
`g ≫ f i`, the image of `[𝟙 (c (i + 1))]` under `B(g ≫ f i)` with `g ≫ f i ∈ I`. The proofs use
only closure under precomposition. Stated in the universe `v`, where Bass's module lives; (1) ⇒
(2), (3) hold in every universe. For a two-sided ideal, such as `J(C)`, apply it to the coercion. -/
theorem LeftMorphismIdeal.isTNilpotent_tfae (I : LeftMorphismIdeal C) :
    List.TFAE
      [I.IsTNilpotent,
        ∀ M : ModCat.{v} C, I.smul M = ⊤ → IsZero M,
        ∀ M : ModCat.{v} C, IsSuperfluous (I.smul M)] :=
  sorry

/-- **4.1, Nakayama's lemma for finitely generated modules**, for any `C`: `J(C) · M` is
superfluous in every finitely generated module `M`. Route: if `J(C) · M ⊔ N = ⊤` with `N ≠ ⊤`,
then `M ⧸ N` is a nonzero finitely generated module, so it has a maximal subobject (`⊤` is compact
in `Subobject (M ⧸ N)`, 0.1); the simple quotient `S` has `J(C) · S = 0`, because for
`f ∈ J(C)(c, d)` and `x ∈ S(d)` the subobject generated by `S(f)(x)` is `0` or `S`, and in the
second case `x = S(g ≫ f)(x)` for some `g : d ⟶ c`, so `x = 0` since `𝟙 - g ≫ f` is invertible. So
`J(C) · M` lies in the maximal subobject, a contradiction. Consequence (rigidity): an endomorphism
of a finite sum `Q` of representables that is the identity modulo `J(C) · Q` is an isomorphism; it
is onto by the lemma, it splits since `Q` is projective, and its kernel `K` is a finitely generated
summand with `K ⊆ J(C) · Q`, so `K = J(C) · K` and `K = 0`. 4.2 uses this for the radical of a
projective module. -/
theorem ModCat.isSuperfluous_jacobson_smul_of_isFinitelyGeneratedFunctor (M : ModCat.{v} C)
    (hM : IsFinitelyGeneratedFunctor M.obj) :
    IsSuperfluous ((TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).smul M) :=
  sorry

/-- **4.1** T-nilpotence through Bass's modules (2.5): a left ideal `I` is T-nilpotent exactly when
the Bass module of every sequence in `I` is zero (tails of `I`-sequences are `I`-sequences). -/
theorem LeftMorphismIdeal.isTNilpotent_iff_forall_isZero_bassModule (I : LeftMorphismIdeal C) :
    I.IsTNilpotent ↔
      ∀ (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)), (∀ i, f i ∈ I.hom (c i) (c (i + 1))) →
        IsZero (ModCat.bassModule c f) :=
  sorry

end TNilpotentCategory

section TNilpotent

variable {A : Type u} [Ring A]

/-- **4.1, rings** A subset `S` is **left T-nilpotent** if for every sequence `a₀, a₁, …` in `S`
some product `a₀ a₁ ⋯ aₙ₋₁` vanishes. -/
def IsLeftTNilpotent (S : Set A) : Prop :=
  ∀ a : ℕ → A, (∀ i, a i ∈ S) → ∃ n, (List.ofFn fun i : Fin n ↦ a i).prod = 0

theorem IsLeftTNilpotent.mono {S T : Set A} (hT : IsLeftTNilpotent T) (h : S ⊆ T) :
    IsLeftTNilpotent S :=
  sorry

theorem isLeftTNilpotent_of_isNilpotent {I : Ideal A} (hI : IsNilpotent I) :
    IsLeftTNilpotent (I : Set A) :=
  sorry

theorem IsLeftTNilpotent.isNilpotent {S : Set A} (hS : IsLeftTNilpotent S) {x : A} (hx : x ∈ S) :
    IsNilpotent x :=
  sorry

theorem IsLeftTNilpotent.image {B : Type*} [Ring B] {S : Set A} (hS : IsLeftTNilpotent S)
    (f : A →+* B) : IsLeftTNilpotent (f '' S) :=
  sorry

/-- **4.1, rings** For a left ideal `J` of `A`, left T-nilpotence is T-nilpotence of the left ideal
`idealOrderIsoLeftMorphismIdeal A J` of `SingleObj Aᵐᵒᵖ` (0.3): the composite of
`op a₀, …, op aₙ₋₁` is `op (a₀ ⋯ aₙ₋₁)`. -/
theorem isLeftTNilpotent_iff_isTNilpotent_singleObj (J : Ideal A) :
    IsLeftTNilpotent (J : Set A) ↔ (idealOrderIsoLeftMorphismIdeal A J).IsTNilpotent :=
  sorry

variable (A) in
/-- **4.1, rings** The radical of `SingleObj Aᵐᵒᵖ`, as a left ideal, is the Jacobson radical of `A`:
`End ∗ = Aᵐᵒᵖ` as rings, and `Ring.jacobson Aᵐᵒᵖ` is the `op`-image of `Ring.jacobson A` (Tau
Ceti's `TauCeti.Ring.mem_jacobson_mulOpposite_iff`). With the previous item, left T-nilpotence of
`J` is T-nilpotence of `J(SingleObj Aᵐᵒᵖ)`. -/
theorem toLeftMorphismIdeal_jacobsonRadicalIdeal_singleObj :
    MorphismIdeal.toLeftMorphismIdeal (TauCeti.jacobsonRadicalIdeal (SingleObj Aᵐᵒᵖ)) =
      idealOrderIsoLeftMorphismIdeal A (Ring.jacobson A) :=
  sorry

/-- **4.1, rings: Nakayama's lemma for all modules** ([AF, 28.3]), for any left ideal `J`: the
case of `LeftMorphismIdeal.isTNilpotent_tfae` for the left ideal
`idealOrderIsoLeftMorphismIdeal A J` of `SingleObj Aᵐᵒᵖ` (0.2, 0.3), where `I · M` is `J • ⊤`. -/
theorem isLeftTNilpotent_tfae (J : Ideal A) :
    List.TFAE
      [IsLeftTNilpotent (J : Set A),
        ∀ (M : Type u) [AddCommGroup M] [Module A M], J • (⊤ : Submodule A M) = ⊤ → Subsingleton M,
        ∀ (M : Type u) [AddCommGroup M] [Module A M],
          TauCeti.IsSuperfluous (J • (⊤ : Submodule A M)),
        TauCeti.IsSuperfluous (J • (⊤ : Submodule A (ℕ →₀ A)))] :=
  sorry

/-- **4.1, rings** For a left T-nilpotent left ideal, `J • M` is superfluous in every module, in
every universe. -/
theorem IsLeftTNilpotent.isSuperfluous_smul_top {J : Ideal A} (hJ : IsLeftTNilpotent (J : Set A))
    (M : Type w) [AddCommGroup M] [Module A M] : TauCeti.IsSuperfluous (J • (⊤ : Submodule A M)) :=
  sorry

end TNilpotent

/-! ### 4.2 Semilocal and semiperfect rings and categories -/

section Semilocal

/-- **4.2** A ring is **semilocal** if `R ⧸ J` is a semisimple ring. The ladder:
`IsSemiprimaryRing` ⇒ `IsLeftPerfectRing` ⇒ `TauCeti.IsSemiperfectRing` ⇒ `IsSemilocalRing`. -/
class IsSemilocalRing (R : Type u) [Ring R] : Prop where
  isSemisimpleRing : IsSemisimpleRing (R ⧸ Ring.jacobson R)

attribute [instance] IsSemilocalRing.isSemisimpleRing

variable {R : Type u} [Ring R]

/-- **4.2** Semilocality is left-right symmetric. -/
instance [IsSemilocalRing R] : IsSemilocalRing Rᵐᵒᵖ :=
  ⟨(TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff R).mpr inferInstance⟩

/-- **4.2** A semiperfect ring is semilocal. After the refactor of Tau Ceti's
`TauCeti.IsSemiperfectRing` to `extends IsSemilocalRing`, this is the `extends` projection. -/
instance [TauCeti.IsSemiperfectRing R] : IsSemilocalRing R :=
  ⟨inferInstance⟩

/-- **4.2** Surjective images of semilocal rings are semilocal. -/
theorem IsSemilocalRing.of_surjective {S : Type*} [Ring S] [IsSemilocalRing R] (f : R →+* S)
    (hf : Function.Surjective f) : IsSemilocalRing S :=
  sorry

/-- **4.2** A commutative ring is semilocal exactly when it has finitely many maximal ideals. -/
theorem isSemilocalRing_iff_finite_isMaximal {R : Type u} [CommRing R] :
    IsSemilocalRing R ↔ {I : Ideal R | I.IsMaximal}.Finite :=
  sorry

/-- **4.2** Semiperfectness is left-right symmetric. -/
instance IsSemiperfectRing.mulOpposite [TauCeti.IsSemiperfectRing R] :
    TauCeti.IsSemiperfectRing Rᵐᵒᵖ :=
  sorry

/-- **4.2** A corner `eRe` of a semiperfect ring is semiperfect. -/
theorem IsSemiperfectRing.corner [TauCeti.IsSemiperfectRing R] {e : R} (he : IsIdempotentElem e) :
    TauCeti.IsSemiperfectRing he.Corner :=
  sorry

end Semilocal

section SemilocalCategory

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **4.2** A preadditive category is **semilocal** if every endomorphism ring is semilocal. -/
class IsSemilocalCategory : Prop where
  isSemilocalRing_end (X : C) : IsSemilocalRing (End X)

attribute [instance] IsSemilocalCategory.isSemilocalRing_end

variable {C} in
/-- **4.2** A module is **semisimple** if its subobjects are complemented. -/
abbrev ModCat.IsSemisimple (M : ModCat.{w} C) : Prop :=
  ComplementedLattice (Subobject M)

/-- **4.2** `C` is **semisimple** in Simson's sense ([Simson, p. 93], for his covariant modules,
applied to `Cᵒᵖ`): every representable `Hom(-, X)` is a semisimple module. By [Simson, Prop. 1.2]
(von Neumann regular with semisimple endomorphism rings) the notion is self-dual. -/
def IsSemisimpleCategory : Prop :=
  ∀ X : C, ModCat.IsSemisimple ((ModCat.yoneda C).obj X)

/-- **4.2, regularity of `C ⧸ J(C)`**. For `f : X ⟶ Y` in
`D = C ⧸ J(C)`, the left ideal `{g ∘ f}` of the semisimple ring `End X` is `End(X) e` with
`e = g₀ ∘ f` idempotent; `u = f ∘ (1 - e)` has `g ∘ u = 0` for every `g`, so it is radical, hence
zero in `D`; so `f = f ∘ g₀ ∘ f`. -/
theorem IsSemilocalCategory.exists_comp_comp_eq_self [IsSemilocalCategory C]
    {X Y : (TauCeti.jacobsonRadicalIdeal C).Quotient} (f : X ⟶ Y) : ∃ g : Y ⟶ X, f ≫ g ≫ f = f :=
  sorry

/-- **4.2** `C` is semilocal exactly when `C ⧸ J(C)` is semisimple in Simson's sense. Route:
[Simson, Prop. 1.2, p. 93] (semisimple ⇔ von Neumann regular with semisimple endomorphism rings),
`endQuotientJacobsonRadicalIdealRingEquiv`, and the regularity above. -/
theorem isSemilocalCategory_iff_isSemisimpleCategory :
    IsSemilocalCategory C ↔ IsSemisimpleCategory (TauCeti.jacobsonRadicalIdeal C).Quotient :=
  sorry

/-- **4.2** The radical of `C ⧸ J(C)` is zero: for `f` in the radical of the quotient, `1 - g ≫ f`
is invertible for every `g`, and invertibility lifts along the full quotient functor. -/
theorem jacobsonRadicalIdeal_quotient_jacobsonRadicalIdeal :
    TauCeti.jacobsonRadicalIdeal (TauCeti.jacobsonRadicalIdeal C).Quotient = ⊥ :=
  sorry

/-- **4.2** `End_{C ⧸ J}(X) ≅ End X ⧸ Ring.jacobson (End X)`, from Tau Ceti's
`TauCeti.jacobsonRadical_self_eq_jacobson`. -/
noncomputable def endQuotientJacobsonRadicalIdealRingEquiv (X : C) :
    End ((TauCeti.jacobsonRadicalIdeal C).quotientFunctor.obj X) ≃+*
      End X ⧸ Ring.jacobson (End X) :=
  sorry

variable {C} in
/-- **4.2, semisimple modules**: a module with complemented subobjects is a direct sum of simple
modules. The subobject lattice is modular and compactly generated (0.1), so Mathlib's
`IsAtomistic` and `exists_sSupIndep_of_sSup_atoms` give independent atoms with supremum `⊤`; atoms
are simple subobjects (Mathlib's `subobject_simple_iff_isAtom`), and the sum map is a monomorphism
(AB4). -/
theorem ModCat.isSemisimple_iff_exists_iso_sigma [EssentiallySmall.{w} C] (M : ModCat.{w} C) :
    M.IsSemisimple ↔
      ∃ (ι : Type w) (S : ι → ModCat.{w} C), (∀ i, Simple (S i)) ∧ Nonempty (M ≅ ∐ S) :=
  sorry

/-- **4.2** `C` is semisimple exactly when every module of `Mod C` is semisimple (4.4 and 4.5 use
it for `C ⧸ J(C)`). -/
theorem isSemisimpleCategory_iff_forall_isSemisimple [EssentiallySmall.{v} C] :
    IsSemisimpleCategory C ↔ ∀ M : ModCat.{v} C, M.IsSemisimple :=
  sorry

/-- **4.2** `Cᵒᵖ` is semilocal with `C`: `End (op X) = (End X)ᵐᵒᵖ`. -/
instance [IsSemilocalCategory C] : IsSemilocalCategory Cᵒᵖ :=
  sorry

/-- **4.2** A preadditive category is **semiperfect** if every endomorphism ring is semiperfect. -/
class IsSemiperfectCategory : Prop extends IsSemilocalCategory C where
  isSemiperfectRing_end (X : C) : TauCeti.IsSemiperfectRing (End X)

attribute [instance] IsSemiperfectCategory.isSemiperfectRing_end

/-- **4.2** `Cᵒᵖ` is semiperfect with `C`: `End (op X) = (End X)ᵐᵒᵖ` and
`IsSemiperfectRing.mulOpposite`. -/
instance [IsSemiperfectCategory C] : IsSemiperfectCategory Cᵒᵖ :=
  sorry

/-- **4.2** A **Krull–Schmidt category**: every object is isomorphic to a finite biproduct of
objects with local endomorphism rings. This is the class of the ArtinAlgebras roadmap (§0.2), with
the same statement; 4.2 needs it for Krause's criterion and for `proj C`. -/
class IsKrullSchmidt [HasFiniteBiproducts C] : Prop where
  exists_iso_biproduct (X : C) :
    ∃ (n : ℕ) (P : Fin n → C), (∀ i, IsLocalRing (End (P i))) ∧ Nonempty (X ≅ ⨁ P)

/-- **4.2, Krause's criterion with the class** ([Krause, Cor. 4.4, p. 546]; ArtinAlgebras §0.2,
with semiperfect endomorphism rings): a category with finite biproducts is Krull–Schmidt exactly
when idempotents split and it is semiperfect. -/
theorem isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory [HasFiniteBiproducts C] :
    IsKrullSchmidt C ↔ IsIdempotentComplete C ∧ IsSemiperfectCategory C :=
  sorry

/-- **4.2** A Krull–Schmidt category is semiperfect: Krause's criterion. -/
instance IsKrullSchmidt.isSemiperfectCategory [HasFiniteBiproducts C] [IsKrullSchmidt C] :
    IsSemiperfectCategory C :=
  ((isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory C).mp ‹_›).2

/-- **4.2** Finite biproducts pass to `Cᵒᵖ` (finite coproducts of `C` are finite products of
`Cᵒᵖ`); not an instance in Mathlib. -/
instance [HasFiniteBiproducts C] : HasFiniteBiproducts Cᵒᵖ :=
  HasFiniteBiproducts.of_hasFiniteProducts

/-- **4.2** The opposite of a Krull–Schmidt category is Krull–Schmidt: Krause's criterion, with
`End (op X) = (End X)ᵐᵒᵖ` and `IsSemiperfectRing.mulOpposite`. -/
instance [HasFiniteBiproducts C] [IsKrullSchmidt C] : IsKrullSchmidt Cᵒᵖ :=
  sorry

end SemilocalCategory

/-- **4.2** `M` has a **projective cover**: an essential epimorphism (Tau Ceti's
`TauCeti.IsEssentialEpi`) from a projective object. Over `ModuleCat A` this is Tau Ceti's
`TauCeti.IsProjectiveCover` (`TauCeti.isProjectiveCover_iff_forall_surjective`). -/
def HasProjectiveCover {𝒜 : Type*} [Category 𝒜] (M : 𝒜) : Prop :=
  ∃ (P : 𝒜) (p : P ⟶ M), Projective P ∧ TauCeti.IsEssentialEpi p

section SemiperfectCategory

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **4.2, semiperfect categories by projective covers** ([Simson, Thm. 5.6, p. 110], for
covariant modules, applied to `Cᵒᵖ`; [Krause, Prop. 4.1]): (1) `C` is semiperfect; (2) every
`Hom(-, X)` is a finite sum of projective modules with local endomorphism rings; (3) every finitely
generated module has a projective cover; (4) every simple module has one; (5) `proj C` is
Krull–Schmidt. For (5): `proj C` has finite biproducts and split idempotents (0.8), so Krause's
criterion applies, with `End Hom(-, X) = End X`, finite sums and corners. -/
theorem isSemiperfectCategory_tfae :
    List.TFAE
      [IsSemiperfectCategory C,
        ∀ X : C, ∃ (n : ℕ) (P : Fin n → ModCat.{v} C), (∀ i, Projective (P i)) ∧
          (∀ i, IsLocalRing (End (P i))) ∧ Nonempty ((ModCat.yoneda C).obj X ≅ ∐ P),
        ∀ M : ModCat.{v} C, IsFinitelyGeneratedFunctor M.obj → HasProjectiveCover M,
        ∀ S : ModCat.{v} C, Simple S → HasProjectiveCover S,
        IsKrullSchmidt (ModCat.proj C).FullSubcategory] :=
  sorry

variable {C}

/-- **4.2** Over a semiperfect `C` a simple module `S` has a projective cover, by a summand of
`Hom(-, X)`: `S(X) ≠ 0` for some `X`; `1 = e₁ + ⋯ + eₙ` in `End X` with local corners; some `eᵢ`
does not kill a nonzero `x ∈ S(X)`, and the summand `{g ≫ eᵢ}` of `Hom(-, X)` (for rings `A eᵢ`),
projective with local endomorphism ring, maps onto `S`. Theorem P uses only this and (1) of the
TFAE. -/
theorem ModCat.hasProjectiveCover_of_simple [IsSemiperfectCategory C] (S : ModCat.{v} C)
    [Simple S] : HasProjectiveCover S :=
  sorry

/-- **4.2, representable covers**: an epimorphism `p : Hom(-, P) ⟶ F` is essential exactly when it
is right minimal, every endomorphism `φ` with `φ ≫ p = p` being invertible. If `ker p` is not
superfluous, a proper `K` with `K ⊔ ker p = ⊤` maps onto `F`, and lifting `p` through it gives a
non-invertible `φ`; conversely `φ ≫ p = p` makes `φ` onto, split, with kernel a summand inside the
superfluous `ker p`. -/
theorem ModCat.isEssentialEpi_iff_forall_isIso {P : C} {F : ModCat.{v} C}
    (p : (ModCat.yoneda C).obj P ⟶ F) [Epi p] :
    TauCeti.IsEssentialEpi p ↔
      ∀ φ : (ModCat.yoneda C).obj P ⟶ (ModCat.yoneda C).obj P, φ ≫ p = p → IsIso φ :=
  sorry

/-- **4.2, the radical of a projective module**, for essentially small `C` and with no condition on
the radical: a nonzero projective `P` has `J(C) · P ≠ P` ([Bass, Prop. 2.7, p. 474]; [Lam-FC,
(24.7)]; [Sandomierski, Prop. 1 (d), p. 205], for rings). Route, Bass's finite-matrix argument:
take `s : P ⟶ F`, `r : F ⟶ P` with `s ≫ r = 𝟙`, `F` a sum of representables, and suppose
`J(C) · P = P`. A map `f` from a representable `Hom(-, c)` to `P` (an element of `P(c)`) has
`f ≫ s = g ≫ j` for a finite subsum `j : Q ⟶ F` (finite support) and `π : F ⟶ Q` the projection.
The endomorphism `a = j ≫ r ≫ s ≫ π` of `Q` factors through `P`, and `P ⧸ J(C) · P = 0`, so `a` is
`0` modulo `J(C) · Q`; hence `𝟙 - a` is the identity modulo `J(C) · Q` and is invertible by the
rigidity of 4.1 (finite Nakayama). From `g ≫ a = g` follows `g = 0`, so `f = 0`, and `P = 0`.
Theorem P (2′ ⇒ 1) uses it. -/
theorem ModCat.jacobson_smul_ne_top_of_projective [EssentiallySmall.{v} C] {P : ModCat.{v} C}
    [Projective P] (hP : ¬ IsZero P) :
    (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).smul P ≠ ⊤ :=
  sorry

/-- **4.2** A superfluous subobject of a projective module lies in `J(C) · P` (the kernel of a
projective cover in particular): it lies in every maximal subobject, and their intersection is
`J(C) · P` for projective `P` (`J(C)(-, X)` is the intersection of the maximal subobjects of
`Hom(-, X)`, and this passes to sums and summands). -/
theorem ModCat.le_jacobson_smul_of_isSuperfluous [EssentiallySmall.{v} C] {P : ModCat.{v} C}
    [Projective P] {K : Subobject P} (hK : IsSuperfluous K) :
    K ≤ (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).smul P :=
  sorry

end SemiperfectCategory

section Semiperfect

/-! #### 4.2, rings -/

variable {R : Type u} [Ring R]

/-- **4.2** A projective cover of a projective module is an isomorphism. -/
theorem IsProjectiveCover.bijective_of_projective {M P : Type*} [AddCommGroup M] [Module R M]
    [AddCommGroup P] [Module R P] [Module.Projective R M] {f : P →ₗ[R] M}
    (hf : TauCeti.IsProjectiveCover f) : Function.Bijective f :=
  sorry

/-- **4.2** A surjection from a projective module with local endomorphism ring onto a nonzero
module is a projective cover. -/
theorem isProjectiveCover_of_isLocalRing_end {P S : Type*} [AddCommGroup P] [Module R P]
    [Module.Projective R P] [IsLocalRing (Module.End R P)] [AddCommGroup S] [Module R S]
    [Nontrivial S] {f : P →ₗ[R] S} (hf : Function.Surjective f) : TauCeti.IsProjectiveCover f :=
  sorry

/-- **4.2** The cover of a simple module has a local endomorphism ring. -/
theorem IsProjectiveCover.isLocalRing_end {P S : Type*} [AddCommGroup P] [Module R P]
    [AddCommGroup S] [Module R S] [IsSimpleModule R S] {p : P →ₗ[R] S}
    (hp : TauCeti.IsProjectiveCover p) : IsLocalRing (Module.End R P) :=
  sorry

/-- **4.2** If `M` has a projective cover, every surjection onto `M` from a projective module
restricts to a projective cover on a submodule of its source. This moves covers between
universes. -/
theorem IsProjectiveCover.exists_isProjectiveCover_comp_subtype {M P Q : Type*} [AddCommGroup M]
    [Module R M] [AddCommGroup P] [Module R P] [AddCommGroup Q] [Module R Q]
    [Module.Projective R Q] {f : P →ₗ[R] M} (hf : TauCeti.IsProjectiveCover f) {g : Q →ₗ[R] M}
    (hg : Function.Surjective g) :
    ∃ Q₀ : Submodule R Q, TauCeti.IsProjectiveCover (g ∘ₗ Q₀.subtype) :=
  sorry

/-- **4.2** For a projective module `P`, `rad P = J • P`. -/
theorem jacobson_eq_jacobson_smul_top_of_projective (P : Type v) [AddCommGroup P] [Module R P]
    [Module.Projective R P] : Module.jacobson R P = Ring.jacobson R • (⊤ : Submodule R P) :=
  sorry

/-- **4.2** A nonzero projective module has a proper radical. -/
theorem jacobson_ne_top_of_projective (P : Type v) [AddCommGroup P] [Module R P]
    [Module.Projective R P] [Nontrivial P] : Module.jacobson R P ≠ ⊤ :=
  sorry

/-- **4.2, covers from covers of simple quotients**: if every simple quotient of a finitely
generated module `M` has a projective cover, then `M` has one whose source is a finite product of
covers `pᵢ : Pᵢ → M ⧸ Nᵢ` of simple quotients, the `i`-th component lifting `pᵢ`. -/
theorem exists_isProjectiveCover_pi_of_forall_isCoatom_exists_isProjectiveCover {M : Type v}
    [AddCommGroup M] [Module R M] [Module.Finite R M]
    (h : ∀ N : Submodule R M, IsCoatom N → ∃ (P : Type w) (_ : AddCommGroup P) (_ : Module R P)
      (p : P →ₗ[R] M ⧸ N), TauCeti.IsProjectiveCover p) :
    ∃ (n : ℕ) (P : Fin n → Type w) (_ : ∀ i, AddCommGroup (P i)) (_ : ∀ i, Module R (P i))
      (N : Fin n → Submodule R M) (p : ∀ i, P i →ₗ[R] M ⧸ N i) (f : (∀ i, P i) →ₗ[R] M),
      (∀ i, IsCoatom (N i)) ∧ (∀ i, TauCeti.IsProjectiveCover (p i)) ∧
        (∀ i, (N i).mkQ ∘ₗ f ∘ₗ LinearMap.single R P i = p i) ∧ TauCeti.IsProjectiveCover f :=
  sorry

/-- **4.2, covers over a semiperfect ring**: every finitely generated module has a projective
cover. -/
theorem exists_isProjectiveCover_of_isSemiperfectRing [TauCeti.IsSemiperfectRing R] (M : Type v)
    [AddCommGroup M] [Module R M] [Module.Finite R M] :
    ∃ (P : Type u) (_ : AddCommGroup P) (_ : Module R P) (p : P →ₗ[R] M),
      TauCeti.IsProjectiveCover p :=
  sorry

/-- **4.2** A ring that is, as a left module over itself, a finite product of modules with local
endomorphism rings is semiperfect. -/
theorem IsSemiperfectRing.of_linearEquiv_pi {n : ℕ} {P : Fin n → Type*}
    [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)] [∀ i, IsLocalRing (Module.End R (P i))]
    (φ : R ≃ₗ[R] ∀ i, P i) : TauCeti.IsSemiperfectRing R :=
  sorry

variable (R) in
/-- **4.2, semiperfect rings by projective covers** (Sandomierski; Krause, Proposition 4.1), with
the item "finitely generated projective modules form a Krull–Schmidt category" (Krause's criterion,
as in the categorical form). -/
theorem isSemiperfectRing_tfae :
    List.TFAE
      [TauCeti.IsSemiperfectRing R,
        ∃ (n : ℕ) (P : Fin n → Type u) (_ : ∀ i, AddCommGroup (P i)) (_ : ∀ i, Module R (P i)),
          (∀ i, Module.Projective R (P i)) ∧ (∀ i, IsLocalRing (Module.End R (P i))) ∧
            Nonempty (R ≃ₗ[R] ∀ i, P i),
        ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M], ∃ (P : Type u)
          (_ : AddCommGroup P) (_ : Module R P) (p : P →ₗ[R] M), TauCeti.IsProjectiveCover p,
        ∀ (S : Type u) [AddCommGroup S] [Module R S] [IsSimpleModule R S], ∃ (P : Type u)
          (_ : AddCommGroup P) (_ : Module R P) (p : P →ₗ[R] S), TauCeti.IsProjectiveCover p,
        IsKrullSchmidt (TauCeti.finiteProjectiveModules R).FullSubcategory] :=
  sorry

/-- **4.2, minimal presentations**: a finitely presented module over a semiperfect ring has a
finite minimal projective presentation. This generalizes and replaces the semiprimary Noetherian
`TauCeti.FiniteProjectivePresentation.exists_isMinimal`. -/
theorem FiniteProjectivePresentation.exists_isMinimal [TauCeti.IsSemiperfectRing R]
    [Small.{v} R] {M : ModuleCat.{v} R} [Module.FinitePresentation R M] :
    ∃ P : TauCeti.FiniteProjectivePresentation M,
      TauCeti.IsMinimalProjectivePresentation P.p P.π :=
  sorry

/-- **4.2, commutative semiperfect rings** ([Lam-FC, (23.11), p. 350]): a commutative ring is
semiperfect exactly when it is a finite product of local rings. Route: `1` is a sum of orthogonal
idempotents with local corners ([Lam-FC, (23.6), p. 347]); in a commutative ring they are central,
and each corner is a local ring. -/
theorem isSemiperfectRing_iff_exists_ringEquiv_pi {R : Type u} [CommRing R] :
    TauCeti.IsSemiperfectRing R ↔
      ∃ (n : ℕ) (L : Fin n → Type u) (_ : ∀ i, CommRing (L i)) (_ : ∀ i, IsLocalRing (L i)),
        Nonempty (R ≃+* ∀ i, L i) :=
  sorry

end Semiperfect

/-! ### 4.3 Perfect categories and left perfect rings -/

section PerfectCategory

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **4.3** A preadditive category is **perfect** (for `Mod C`) if it is semilocal and `J(C)` is
T-nilpotent on sequences `c₀ → c₁ → ⋯`; by 4.2 this is Simson's condition ([Simson, Thm. 5.4 (7)],
for `Cᵒᵖ`): `J(C)` T-nilpotent and `C ⧸ J(C)` semisimple. By Theorem P (4.5) it holds exactly when
every module of `Mod C` has a projective cover. The other side is `IsPerfectCategory Cᵒᵖ`; for
`C = SingleObj Aᵐᵒᵖ` this is `IsLeftPerfectRing A`. -/
class IsPerfectCategory : Prop extends IsSemilocalCategory C where
  isTNilpotent : (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).IsTNilpotent

variable {C}

/-- **4.3** A perfect category is semiperfect: `J(End X)` is T-nilpotent, hence nil, so
idempotents lift. -/
instance [IsPerfectCategory C] : IsSemiperfectCategory C :=
  sorry

/-- **4.3** A semilocal category with nilpotent radical is perfect (4.1). -/
theorem IsPerfectCategory.of_pow_eq_bot [IsSemilocalCategory C] {n : ℕ}
    (h : TauCeti.jacobsonRadicalIdeal C ^ n = ⊥) : IsPerfectCategory C :=
  sorry

/-- **4.3** A semilocal category with nilpotent radical is perfect on the other side (4.1). -/
theorem IsPerfectCategory.op_of_pow_eq_bot [IsSemilocalCategory C] {n : ℕ}
    (h : TauCeti.jacobsonRadicalIdeal C ^ n = ⊥) : IsPerfectCategory Cᵒᵖ :=
  sorry

end PerfectCategory

section Perfect

/-- **4.3** A ring is **left perfect** if it is semilocal and `J` is left T-nilpotent. Right
perfect is `IsLeftPerfectRing Aᵐᵒᵖ`. -/
class IsLeftPerfectRing (A : Type u) [Ring A] : Prop extends IsSemilocalRing A where
  isLeftTNilpotent : IsLeftTNilpotent (Ring.jacobson A : Set A)

variable {A : Type u} [Ring A]

/-- **4.3** A semiprimary ring is left perfect ([Lam-FC, (23.19), p. 353]); with Tau Ceti's
instance `TauCeti.IsSemiprimaryRing.mulOpposite` also right perfect. With Mathlib's instance
`IsArtinianRing → IsSemiprimaryRing`, a left Artinian ring is perfect on both sides. -/
instance IsLeftPerfectRing.of_isSemiprimaryRing [IsSemiprimaryRing A] : IsLeftPerfectRing A :=
  sorry

/-- **4.3** A left perfect ring is semiperfect: the radical is nil, so idempotents lift. -/
instance IsLeftPerfectRing.isSemiperfectRing [IsLeftPerfectRing A] : TauCeti.IsSemiperfectRing A :=
  sorry

/-- **4.3** A right Artinian ring is left perfect, through Tau Ceti's
`TauCeti.isSemiprimaryRing_mulOpposite_iff`. -/
theorem IsLeftPerfectRing.of_isArtinianRing_mulOpposite [IsArtinianRing Aᵐᵒᵖ] :
    IsLeftPerfectRing A :=
  sorry

/-- **4.3** Quotients, and more generally surjective images, of left perfect rings are left
perfect. -/
theorem IsLeftPerfectRing.of_surjective {B : Type*} [Ring B] [IsLeftPerfectRing A] (f : A →+* B)
    (hf : Function.Surjective f) : IsLeftPerfectRing B :=
  sorry

variable (A) in
/-- **4.3, bridge**: the composite of `op a₀, …, op aₙ₋₁` in `SingleObj Aᵐᵒᵖ` is
`op (a₀ ⋯ aₙ₋₁)` (4.1: `isLeftTNilpotent_iff_isTNilpotent_singleObj` with
`toLeftMorphismIdeal_jacobsonRadicalIdeal_singleObj`). -/
theorem isLeftPerfectRing_iff_singleObj :
    IsLeftPerfectRing A ↔ IsPerfectCategory (SingleObj Aᵐᵒᵖ) :=
  sorry

/-- **4.3, nil implies T-nilpotent, Artinian case**: for an Artinian module `M`, a nil one-sided
ideal `I` of `Module.End R M` is left T-nilpotent: in every sequence `a₀, a₁, …` in `I` some
`a₀ * a₁ * ⋯ * aₙ₋₁ = a₀ ∘ ⋯ ∘ aₙ₋₁` vanishes. Route: [AF, Thm. 29.2, proof, pp. 323–324], whose
endomorphisms act on the right, so that their right T-nilpotence is this one: among the sequences
with no vanishing product, choose the terms one by one with minimal image. -/
theorem Module.End.isLeftTNilpotent_of_isArtinian {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] [IsArtinian R M] (I : Set (Module.End R M))
    (hI : (∀ a ∈ I, ∀ s, s * a ∈ I) ∨ ∀ a ∈ I, ∀ s, a * s ∈ I) (hnil : ∀ a ∈ I, IsNilpotent a) :
    IsLeftTNilpotent I :=
  sorry

/-- **4.3, nil implies T-nilpotent, Noetherian case**: for a Noetherian module `M`, a nil one-sided
ideal `I` of `Module.End R M` is right T-nilpotent (left T-nilpotence of its image in the opposite
ring): in every sequence some `aₙ₋₁ ∘ ⋯ ∘ a₀` vanishes. Route: the lattice dual of the Artinian
case, with maximal kernels in place of minimal images and the ascending chain condition on sums of
images ([AF, Thm. 29.2], where this case is omitted as dual). -/
theorem Module.End.isLeftTNilpotent_op_of_isNoetherian {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] [IsNoetherian R M] (I : Set (Module.End R M))
    (hI : (∀ a ∈ I, ∀ s, s * a ∈ I) ∨ ∀ a ∈ I, ∀ s, a * s ∈ I) (hnil : ∀ a ∈ I, IsNilpotent a) :
    IsLeftTNilpotent (MulOpposite.op '' I) :=
  sorry

/-- **4.3, T-nilpotent implies nilpotent, Artinian case**: for an Artinian `M`, a left T-nilpotent
subset `I` of `Module.End R M` is nilpotent: the submodules `Iʳ M` spanned by the images of
products of `r` elements of `I` stabilize at some `N` with `I N = N`, and left T-nilpotence makes
`N = 0` (the argument of 4.1, (1) ⇒ (2)). Compare [AF, Prop. 29.1, p. 323], through right
annihilators. -/
theorem Module.End.exists_prod_eq_zero_of_isLeftTNilpotent {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] [IsArtinian R M] {I : Set (Module.End R M)}
    (hI : IsLeftTNilpotent I) :
    ∃ n : ℕ, ∀ a : Fin n → Module.End R M, (∀ i, a i ∈ I) → (List.ofFn a).prod = 0 :=
  sorry

/-- **4.3, T-nilpotent implies nilpotent, Noetherian case**: for a Noetherian `M`, a right
T-nilpotent subset `I` of `Module.End R M` is nilpotent: the annihilators `ann_M(Iʳ)` stabilize at
some `L`; if `L ≠ M`, every `x ∉ L` has some `a ∈ I` with `a x ∉ L`, which gives a sequence with no
vanishing product `aₙ₋₁ ∘ ⋯ ∘ a₀`. -/
theorem Module.End.exists_prod_eq_zero_of_isLeftTNilpotent_op {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] [IsNoetherian R M] {I : Set (Module.End R M)}
    (hI : IsLeftTNilpotent (MulOpposite.op '' I)) :
    ∃ n : ℕ, ∀ a : Fin n → Module.End R M, (∀ i, a i ∈ I) → (List.ofFn a).prod = 0 :=
  sorry

/-- **4.3, the theorem of Small and Fisher** ([AF, Thm. 29.2, p. 323]): for an Artinian or a
Noetherian module `M`, every nil one-sided ideal of `Module.End R M` is nilpotent. The previous four
items. -/
theorem Module.End.exists_prod_eq_zero_of_isNilpotent {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] (hM : IsArtinian R M ∨ IsNoetherian R M)
    (I : Set (Module.End R M)) (hI : (∀ a ∈ I, ∀ s, s * a ∈ I) ∨ ∀ a ∈ I, ∀ s, a * s ∈ I)
    (hnil : ∀ a ∈ I, IsNilpotent a) :
    ∃ n : ℕ, ∀ a : Fin n → Module.End R M, (∀ i, a i ∈ I) → (List.ofFn a).prod = 0 :=
  sorry

/-- **4.3** The endomorphism ring of a module of finite length is semiprimary ([AF, Cor. 29.3,
p. 324]). Route, as there: `Module.End R M` is semiperfect, since `M` is a finite direct sum of
modules with local endomorphism rings ([Lam-FC, (23.8), p. 348]); its radical is nil by Fitting's
lemma (for `a` in the radical, `M = Im aⁿ ⊕ Ker aⁿ` for large `n`, and `a` restricted to `Im aⁿ`
is an automorphism, so `Im aⁿ = 0`); so the radical is nilpotent by the theorem of Small and
Fisher. -/
instance Module.End.isSemiprimaryRing {R : Type u} [Ring R] {M : Type v} [AddCommGroup M]
    [Module R M] [IsNoetherian R M] [IsArtinian R M] : IsSemiprimaryRing (Module.End R M) :=
  sorry

/-- **4.3, commutative perfect rings** ([Lam-FC, (23.24), p. 357]): a commutative ring is perfect
exactly when it is a finite product of local rings with T-nilpotent maximal ideals. -/
theorem isLeftPerfectRing_iff_exists_ringEquiv_pi {R : Type u} [CommRing R] :
    IsLeftPerfectRing R ↔
      ∃ (n : ℕ) (L : Fin n → Type u) (_ : ∀ i, CommRing (L i)) (_ : ∀ i, IsLocalRing (L i)),
        (∀ i, IsLeftTNilpotent (IsLocalRing.maximalIdeal (L i) : Set (L i))) ∧
          Nonempty (R ≃+* ∀ i, L i) :=
  sorry

/-- **4.3** A commutative Noetherian ring is perfect exactly when it is Artinian: a finitely
generated nil ideal is nilpotent, so the ring is semiprimary, and Mathlib's
`IsSemiprimaryRing.isNoetherian_iff_isArtinian` applies. -/
theorem isLeftPerfectRing_iff_isArtinianRing {R : Type u} [CommRing R] [IsNoetherianRing R] :
    IsLeftPerfectRing R ↔ IsArtinianRing R :=
  sorry

end Perfect

/-! ### 4.4 Projective covers over perfect categories -/

/-- **4.4** Over a perfect `C` every module of `Mod C` has a projective cover ([Simson, Thm. 5.4,
(7) ⇒ (8), p. 109], on `Cᵒᵖ`; [Bass, Lemma 2.6, p. 473]). Route: `M ⧸ J · M` is a semisimple
module over `C ⧸ J(C)` (4.2); its simple summands have covers `qᵢ : Pᵢ ⟶ Sᵢ` by summands of
representables (4.2); the sum `q = ⊕ qᵢ : P ⟶ M ⧸ J · M` lifts to `f : P ⟶ M`, onto because
`J · M` is superfluous (4.1). Its kernel lies in `ker q = ⊕ ker qᵢ`, and `ker qᵢ ≤ J · Pᵢ` since
cover kernels are superfluous (4.2), so `ker f ≤ ⊕ J · Pᵢ = J · P` (`LeftMorphismIdeal.smul_sigma`),
which is superfluous in `P` (4.1). -/
theorem IsPerfectCategory.hasProjectiveCover {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] [IsPerfectCategory C] (M : ModCat.{v} C) :
    HasProjectiveCover M :=
  sorry

/-- **4.4, rings** Over a left perfect ring every module, in every universe, has a projective
cover, in the form of Tau Ceti's `TauCeti.exists_isProjectiveCover`, which it generalizes from
semiprimary rings. -/
theorem IsLeftPerfectRing.exists_isProjectiveCover {A : Type u} [Ring A] [IsLeftPerfectRing A]
    (M : Type v) [AddCommGroup M] [Module A M] :
    ∃ P : Submodule A (M →₀ A),
      TauCeti.IsProjectiveCover (Finsupp.linearCombination A id ∘ₗ P.subtype) :=
  sorry

/-! ### 4.5 Bass's Theorem P -/

section TheoremP

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **4.5, pure superfluous subobjects of projectives** ([Wisbauer, 36.3, p. 306], for a projective
in `σ[M]` generated by finitely presented modules; here for any `C`): a subobject `K` of a
projective `P` that is superfluous and pure (the quotient map `P ⟶ P ⧸ K` is a pure epimorphism)
is zero. Route: for `x ∈ K(c)`, purity gives `θ : P ⟶ K` with `θ (x) = x`. Take
`s : P ⟶ F`, `r : F ⟶ P` with `s ≫ r = 𝟙`, `F` a sum of representables, a finite subsum
`j : L ⟶ F` containing `s(x)` as `x_L`, and the projection `π_L : F ⟶ L` (`j ≫ π_L = 𝟙`). The map
`L ⟶ P ⧸ K` factors through the finitely presented `L ⧸ (x_L)` and lifts along `P ⟶ P ⧸ K` by
purity to `g : L ⟶ P`. Then `δ = j - g ≫ s : L ⟶ F` sends `x_L` to `s(x)`, and `δ ≫ r` maps to
zero in `P ⧸ K`, so `θ = s ≫ π_L ≫ δ ≫ r : P ⟶ P` factors through `K`, with `θ (x) = x`. Then
`θ` has image in the superfluous `K`, so `𝟙 - θ` is onto, splits, and its kernel is a summand
inside `K`, hence zero, while it kills `x` ([Mares, Thm. 2.4, proof step (i), p. 349]). -/
theorem ModCat.eq_bot_of_isSuperfluous_of_isPureEpi {P : ModCat.{v} C} [Projective P]
    {K : Subobject P} (hK : IsSuperfluous K) (hpure : ModCat.IsPureEpi (cokernel.π K.arrow)) :
    K = ⊥ :=
  sorry

/-- **4.5, flat modules with a projective cover** ([Wisbauer, 36.4 (1), p. 306]; [Simson, Thm. 5.4,
(9′) ⇒ (1′), pp. 109–110], on `Cᵒᵖ`): a flat module with a projective cover is projective, for any
`C` and with no hypothesis on the radical. Route: an epimorphism onto a flat module is pure (2.3),
so the kernel of the cover is pure and superfluous, hence zero. -/
theorem ModCat.Flat.projective_of_isEssentialEpi {P M : ModCat.{v} C} [Projective P]
    [ModCat.Flat M] (p : P ⟶ M) (hp : TauCeti.IsEssentialEpi p) : Projective M :=
  sorry

variable (C) in
/-- **4.5, Bass's Theorem P for categories** ([Simson, Thm. 5.4, p. 108] and [Harada, Thm. 5,
p. 339], for covariant modules, applied to `Cᵒᵖ`): (1) `C` is perfect; (2) every module of `Mod C`
has a projective cover; (2′) every semisimple module has one ([Sandomierski, Thm. 5, p. 206],
rings); (3) every flat module is projective; (3′) every countably presented flat module is
projective; (4) for every `c`, the principal right ideals `g C = {g ≫ h}` of `C` with source `c`
(`RightMorphismIdeal.principal`; at `c` the cyclic subfunctors of `Hom(c, -)`, the images of
`Hom(d, -) → Hom(c, -)` for `g : c ⟶ d`) satisfy the descending chain condition (for rings, the
principal right ideals `aA`, `submoduleOrderIsoRightMorphismIdeal`); (4′) in every sequence
`c₀ → c₁ → ⋯` some `q_n = f 0 ≫ ⋯ ≫ f (n - 1)` factors as `q_m ≫ t` through every later `q_m`; (5)
flat and projective dimension agree; (6) filtered colimits of projective modules are projective.
Route: 1 ⇒ 2 (4.4) ⇒ 3 (Wisbauer's lemma) ⇒ 3′
⇒ 4′ (Bass's module, 2.5) ⇒ 1 (T-nilpotence from `q_n ≫ (1 - f n ≫ t) = 0`; DCC on the principal
left ideals of each `End X` and of `End X ⧸ J`, for Mathlib's `f * g = g ≫ f`, then
[Lam-FC, (4.14)]); 4 ⇔ 4′; 3 ⇔ 5 (3.1); 3 ⇔ 6 (2.6, 2.3); 2 ⇒ 2′ ⇒ 1. -/
theorem isPerfectCategory_tfae :
    List.TFAE
      [IsPerfectCategory C,
        ∀ M : ModCat.{v} C, HasProjectiveCover M,
        ∀ M : ModCat.{v} C, M.IsSemisimple → HasProjectiveCover M,
        ∀ M : ModCat.{v} C, M.Flat → Projective M,
        ∀ M : ModCat.{v} C, M.Flat → IsCardinalPresentable M (Cardinal.aleph.{v} 1) →
          Projective M,
        ∀ c : C, WellFoundedLT {I : RightMorphismIdeal C //
          ∃ (d : C) (g : c ⟶ d), I = RightMorphismIdeal.principal g},
        ∀ (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)), ∃ n : ℕ, ∀ m : ℕ, n ≤ m →
          ∃ t : (Functor.ofSequence f).obj m ⟶ (Functor.ofSequence f).obj n,
            (Functor.ofSequence f).map (homOfLE (Nat.zero_le m)) ≫ t =
              (Functor.ofSequence f).map (homOfLE (Nat.zero_le n)),
        ∀ M : ModCat.{v} C, M.flatDimension = projectiveDimension M,
        ∀ (J : Type v) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModCat.{v} C),
          (∀ j, Projective (D.obj j)) → Projective (colimit D)] :=
  sorry

end TheoremP

section RingTheoremP

variable {A : Type u} [Ring A]

/-- **4.5, rings: flat modules with a projective cover** ([Wisbauer, 36.4 (1), p. 306]). -/
theorem Module.BalancedFlat.projective_of_isProjectiveCover {M P : Type*} [AddCommGroup M]
    [Module A M] [AddCommGroup P] [Module A P] [Module.Projective A P]
    (hM : Module.BalancedFlat A M) {p : P →ₗ[A] M} (hp : TauCeti.IsProjectiveCover p) :
    Module.Projective A M :=
  sorry

/-- **4.5, auxiliary**: a ring with zero Jacobson radical and the descending chain condition on
principal left ideals is semisimple ([Lam-FC, (4.14), pp. 57–58], (3) ⇒ (1): a minimal left ideal
`B` is not in `rad A = 0`, so some maximal left ideal `m` misses it and `A = B ⊕ m`; the chain
condition stops the splitting). The categorical 4′ ⇒ 1 applies it to `End X ⧸ J`. -/
theorem isSemisimpleRing_of_wellFoundedLT_isPrincipal (hJ : Ring.jacobson A = ⊥)
    [WellFoundedLT {I : Ideal A // I.IsPrincipal}] : IsSemisimpleRing A :=
  sorry

variable (A) in
/-- **4.5, Bass's Theorem P** ([Bass, Theorem P, pp. 467–468]), derived from
`isPerfectCategory_tfae` at `SingleObj Aᵐᵒᵖ` through 0.2: the same items, with 4 the descending
chain condition on principal right ideals and 4′ Bass's chain `a₀A ⊇ a₀a₁A ⊇ ⋯`. -/
theorem isLeftPerfectRing_tfae :
    List.TFAE
      [IsLeftPerfectRing A,
        ∀ (M : Type u) [AddCommGroup M] [Module A M], ∃ (P : Type u) (_ : AddCommGroup P)
          (_ : Module A P) (p : P →ₗ[A] M), TauCeti.IsProjectiveCover p,
        ∀ (M : Type u) [AddCommGroup M] [Module A M] [IsSemisimpleModule A M], ∃ (P : Type u)
          (_ : AddCommGroup P) (_ : Module A P) (p : P →ₗ[A] M), TauCeti.IsProjectiveCover p,
        ∀ (M : Type u) [AddCommGroup M] [Module A M], Module.BalancedFlat A M →
          Module.Projective A M,
        ∀ M : ModuleCat.{u} A, Module.BalancedFlat A M →
          IsCardinalPresentable M (Cardinal.aleph.{u} 1) → Module.Projective A M,
        WellFoundedLT {I : Submodule Aᵐᵒᵖ A // I.IsPrincipal},
        ∀ a : ℕ → A, ∃ n, ∀ m ≥ n, Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin m ↦ a i).prod} =
          Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin n ↦ a i).prod},
        ∀ M : ModuleCat.{u} A, flatDimension M = projectiveDimension M,
        ∀ (J : Type u) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModuleCat.{u} A),
          (∀ j, Projective (D.obj j)) → Projective (colimit D)] :=
  sorry

end RingTheoremP

/-! ### 4.6 Global dimension of perfect categories -/

section PerfectGlobalDimension

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **4.6** A perfect `C` has equal global and weak global dimension (the supremum of Theorem P
(5)). -/
theorem ModCat.globalDimension_eq_weakGlobalDimension_of_isPerfectCategory
    [IsPerfectCategory C] :
    Abelian.globalDimension (ModCat.{v} C) = ModCat.weakGlobalDimension C :=
  sorry

/-- **4.6** If `C` and `Cᵒᵖ` are perfect, the global dimensions of `Mod C` and `Mod Cᵒᵖ` agree
(3.3's symmetry); for instance a semilocal `C` with nilpotent radical (4.3). -/
theorem ModCat.globalDimension_op_eq_of_isPerfectCategory
    [IsPerfectCategory C] [IsPerfectCategory Cᵒᵖ] :
    Abelian.globalDimension (ModCat.{v} Cᵒᵖ) = Abelian.globalDimension (ModCat.{v} C) :=
  sorry

/-- **4.6, the Bass–Eilenberg criterion** ([Bass, p. 475], credited there to Eilenberg): over a
perfect `C`, `pd M ≤ n` exactly when `Tor_{n+1}((C ⧸ J)(X, -), M) = 0` for every `X`; so
`pd M = sup {n : Tor_n(C ⧸ J, M) ≠ 0}`. Route: a minimal resolution by covers (4.4) has
differentials into `J · P` (the kernel of a cover lies in `J · P`, 4.2), so
`Tor_n((C ⧸ J)(X, -), M) = P_n(X) ⧸ (J · P_n)(X)` (0.3), and `J · P ≠ P` for `P ≠ 0`, since
`J(C)` is T-nilpotent (4.1). -/
theorem ModCat.hasProjectiveDimensionLE_iff_isZero_tor [IsPerfectCategory C]
    (M : ModCat.{v} C) (n : ℕ) :
    HasProjectiveDimensionLE M n ↔ ∀ X : C, IsZero (((ModCat.tor (n + 1)).obj
      (MorphismIdeal.quotientYoneda (TauCeti.jacobsonRadicalIdeal C).op (op X))).obj M) :=
  sorry

/-- **4.6** The global dimension of `Mod C` for a perfect `C` is the flat dimension of the
covariant module `C ⧸ J`: by the criterion, `pd M ≤ n` for every `M` exactly when
`Tor_{n+1}((C ⧸ J)(X, -), -) = 0` for every `X`, and by 3.1 this says that every
`(C ⧸ J)(X, -)` has flat dimension `≤ n`. -/
theorem ModCat.globalDimension_eq_iSup_flatDimension_quotientYoneda
    [IsPerfectCategory C] :
    Abelian.globalDimension (ModCat.{v} C) =
      ⨆ X : C, ModCat.flatDimension
        (MorphismIdeal.quotientYoneda (TauCeti.jacobsonRadicalIdeal C).op (op X)) :=
  sorry

end PerfectGlobalDimension

section RingPerfectGlobalDimension

variable (A : Type u) [Ring A]

/-- **4.6, rings** A left perfect ring has equal left global and weak global dimension. -/
theorem globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing [Small.{v} A]
    [IsLeftPerfectRing A] : TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A :=
  sorry

/-- **4.6, rings** A ring that is left and right perfect has equal left, weak and right global
dimension (the categorical items for both sides, and 3.3's symmetry). Semiprimary rings are the
main example, through the instances of 4.3; for them this is [Au, Cor. 9, p. 73] and [Lam-LMR,
(5.71), p. 188], a second route to ArtinAlgebras §7.2's statement. -/
theorem globalDimension_mulOpposite_of_isLeftPerfectRing [Small.{v} A] [IsLeftPerfectRing A]
    [IsLeftPerfectRing Aᵐᵒᵖ] :
    TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A ∧
      weakGlobalDimension.{v} A = TauCeti.globalDimension.{v} Aᵐᵒᵖ :=
  sorry

end RingPerfectGlobalDimension

/-! ## Acceptance checks -/

/-- `ℚ` is a flat, not projective, `ℤ`-module. -/
theorem balancedFlat_rat_and_not_projective :
    Module.BalancedFlat ℤ ℚ ∧ ¬ Module.Projective ℤ ℚ :=
  sorry

/-- `ℤ` is not semiperfect: `ℤ ⧸ 2` has no projective cover. -/
theorem not_isSemiperfectRing_int : ¬ TauCeti.IsSemiperfectRing ℤ :=
  sorry

/-- The ideal `(X)` of a power series ring is not left T-nilpotent, so `PowerSeries k` is local,
hence semiperfect, and not left perfect. -/
theorem not_isLeftTNilpotent_span_X (k : Type u) [Field k] :
    ¬ IsLeftTNilpotent
      ((Ideal.span {PowerSeries.X} : Ideal (PowerSeries k)) : Set (PowerSeries k)) :=
  sorry

/-- **Layer 3 check** A field has weak global dimension `0`. -/
theorem weakGlobalDimension_field (k : Type u) [Field k] : weakGlobalDimension.{u} k = 0 :=
  sorry

/-- **Layer 3 check** The zero ring has weak global dimension `⊥`. -/
theorem weakGlobalDimension_punit : weakGlobalDimension.{u} PUnit.{u + 1} = ⊥ :=
  sorry

/-- **Layer 3 check** `ℤ` has weak and global dimension `1`: `Tor_1^ℤ(ℤ ⧸ 2, ℤ ⧸ 2) ≠ 0`, and
ideals are free. -/
theorem weakGlobalDimension_int :
    weakGlobalDimension.{0} ℤ = 1 ∧ TauCeti.globalDimension.{0} ℤ = 1 :=
  sorry

/-- **Layer 3 check** The dual numbers `k[ε] ⧸ (ε²)` have weak and global dimension `⊤`:
`Tor_n(k, k) ≅ k` for every `n` (Layer 1 checks). -/
theorem weakGlobalDimension_dualNumber (k : Type u) [Field k] :
    weakGlobalDimension.{u} (DualNumber k) = ⊤ ∧ TauCeti.globalDimension.{u} (DualNumber k) = ⊤ :=
  sorry

/-- **Layer 3 check** The upper triangular algebra `T₂(k)` has weak and global dimension `1`. -/
theorem weakGlobalDimension_upperTriangular (k : Type u) [Field k] :
    weakGlobalDimension.{u} (Matrix.blockTriangularSubalgebra k k (id : Fin 2 → Fin 2)) = 1 ∧
      TauCeti.globalDimension.{u} (Matrix.blockTriangularSubalgebra k k (id : Fin 2 → Fin 2)) =
        1 :=
  sorry

/-- **Layer 3 check** The `k`-linear category of the quiver `0 → 1` (Mathlib's `Free k (Fin 2)`)
has global dimension `1`: its category algebra is `T₂(k)` (1.7). -/
theorem globalDimension_free_fin_two (k : Type) [Field k] :
    Abelian.globalDimension (ModCat.{0} (CategoryTheory.Free k (Fin 2))) = 1 :=
  sorry

/-- **Layer 4 check** `PowerSeries k` is local, hence semiperfect, and not left perfect. -/
theorem isSemiperfectRing_powerSeries_and_not_isLeftPerfectRing (k : Type u) [Field k] :
    TauCeti.IsSemiperfectRing (PowerSeries k) ∧ ¬ IsLeftPerfectRing (PowerSeries k) :=
  sorry

/-- **Layer 4 check** Bass's module for the constant sequence `X` over `PowerSeries k` is the
Laurent series field: flat (2.5) and not projective. -/
theorem bassRelations_X_linearEquiv_laurentSeries (k : Type u) [Field k] :
    Nonempty (((ℕ →₀ PowerSeries k) ⧸ bassRelations (PowerSeries k) fun _ ↦ PowerSeries.X)
      ≃ₗ[PowerSeries k] LaurentSeries k) ∧
      ¬ Module.Projective (PowerSeries k)
        ((ℕ →₀ PowerSeries k) ⧸ bassRelations (PowerSeries k) fun _ ↦ PowerSeries.X) :=
  sorry

/-- **Layer 4 check** `T₂(k)` is semiprimary, hence left and right perfect. -/
theorem isLeftPerfectRing_upperTriangular (k : Type u) [Field k] :
    IsSemiprimaryRing (Matrix.blockTriangularSubalgebra k k (id : Fin 2 → Fin 2)) ∧
      IsLeftPerfectRing (Matrix.blockTriangularSubalgebra k k (id : Fin 2 → Fin 2)) ∧
      IsLeftPerfectRing (Matrix.blockTriangularSubalgebra k k (id : Fin 2 → Fin 2))ᵐᵒᵖ :=
  sorry

/-- **Layer 4 check** The dual numbers `k[ε] ⧸ (ε²)` are perfect, so flat and projective dimension
agree (Theorem P); both global dimensions are `⊤` (Layer 3 check). -/
theorem isLeftPerfectRing_dualNumber (k : Type u) [Field k] :
    IsLeftPerfectRing (DualNumber k) ∧
      ∀ M : ModuleCat.{u} (DualNumber k), flatDimension M = projectiveDimension M :=
  sorry

/-- The ring `k[x₀, x₁, …] ⧸ (xᵢ xⱼ)`. -/
abbrev squareZeroPolynomialRing (k : Type u) [Field k] : Type u :=
  MvPolynomial ℕ k ⧸
    Ideal.span (Set.range fun p : ℕ × ℕ ↦ (MvPolynomial.X p.1 * MvPolynomial.X p.2 :
      MvPolynomial ℕ k))

/-- **Layer 4 check** `k[x₀, x₁, …] ⧸ (xᵢ xⱼ)` is semiprimary (`J² = 0`, `A ⧸ J = k`), hence
perfect, and not Noetherian. -/
theorem isSemiprimaryRing_squareZeroPolynomialRing (k : Type u) [Field k] :
    IsSemiprimaryRing (squareZeroPolynomialRing k) ∧
      ¬ IsNoetherianRing (squareZeroPolynomialRing k) :=
  sorry

/-- The ring `k[x₀, x₁, …] ⧸ (xᵢ^(i+2), xᵢ xⱼ for i ≠ j)` ([Bass, §3, Example (2), p. 475], with the
variables shifted by one). -/
abbrev bassPolynomialRing (k : Type u) [Field k] : Type u :=
  MvPolynomial ℕ k ⧸
    Ideal.span (Set.range (fun i : ℕ ↦ (MvPolynomial.X i ^ (i + 2) : MvPolynomial ℕ k)) ∪
      {f | ∃ i j : ℕ, i ≠ j ∧ f = MvPolynomial.X i * MvPolynomial.X j})

/-- **Layer 4 check** `bassPolynomialRing k` is perfect and not semiprimary (`xᵢ^(i+1) ≠ 0`), and by
Theorem P its principal ideals satisfy the descending chain condition, although it is not
Noetherian. -/
theorem isLeftPerfectRing_bassPolynomialRing (k : Type u) [Field k] :
    IsLeftPerfectRing (bassPolynomialRing k) ∧ ¬ IsSemiprimaryRing (bassPolynomialRing k) ∧
      WellFoundedLT {I : Ideal (bassPolynomialRing k) // I.IsPrincipal} :=
  sorry

/-- The arrows `i → i + 1` of the linear `A_∞` category `0 → 1 → 2 → ⋯`, the `k`-linearization
`CategoryTheory.Free k ℕ` of `(ℕ, ≤)`. -/
noncomputable def aInftyArrow (k : Type) [Field k] (i : ℕ) :
    (CategoryTheory.Free.embedding k ℕ).obj i ⟶ (CategoryTheory.Free.embedding k ℕ).obj (i + 1) :=
  (CategoryTheory.Free.embedding k ℕ).map (homOfLE (Nat.le_succ i))

/-- **Layer 4 check** The linear `A_∞` category `0 → 1 → 2 → ⋯` is semilocal (every endomorphism
ring is `k`) and not perfect (the arrows out of `0` compose to nonzero paths `0 → n`); its opposite
is perfect (a radical path of `Cᵒᵖ` strictly lowers the index). -/
theorem isSemilocalCategory_free_nat (k : Type) [Field k] :
    IsSemilocalCategory (CategoryTheory.Free k ℕ) ∧
      ¬ IsPerfectCategory (CategoryTheory.Free k ℕ) ∧
      IsPerfectCategory (CategoryTheory.Free k ℕ)ᵒᵖ :=
  sorry

/-- **Layer 4 check** In the linear `A_∞` category, Bass's module of the sequence of arrows out of
`0` is nonzero and equals `J · B` (4.1). -/
theorem bassModule_free_nat (k : Type) [Field k] :
    ¬ IsZero (ModCat.bassModule
        (fun i ↦ (CategoryTheory.Free.embedding k ℕ).obj i) (aInftyArrow k)) ∧
      (TauCeti.jacobsonRadicalIdeal (CategoryTheory.Free k ℕ) : LeftMorphismIdeal _).smul
        (ModCat.bassModule (fun i ↦ (CategoryTheory.Free.embedding k ℕ).obj i) (aInftyArrow k)) =
          ⊤ :=
  sorry

/-- **Layer 4 check** The `k`-linear category of the quiver `0 → 1` has `J² = 0`, is perfect on
both sides, and `proj C` is Krull–Schmidt; its category algebra is `T₂(k)` (1.7). -/
theorem isPerfectCategory_free_fin_two (k : Type) [Field k] :
    TauCeti.jacobsonRadicalIdeal (CategoryTheory.Free k (Fin 2)) ^ 2 = ⊥ ∧
      IsPerfectCategory (CategoryTheory.Free k (Fin 2)) ∧
      IsPerfectCategory (CategoryTheory.Free k (Fin 2))ᵒᵖ ∧
      IsKrullSchmidt (ModCat.proj (CategoryTheory.Free k (Fin 2))).FullSubcategory :=
  sorry

end TauCetiRoadmap.NoncommutativeFlatness
