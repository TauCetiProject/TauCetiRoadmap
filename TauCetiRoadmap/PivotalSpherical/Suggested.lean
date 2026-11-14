import Mathlib
import TauCeti.CategoryTheory.Monoidal.Pivotal.Trace
import TauCeti.CategoryTheory.Monoidal.Pivotal.Spherical
import TauCeti.CategoryTheory.Monoidal.Pivotal.Balanced
import TauCeti.CategoryTheory.Monoidal.Pivotal.GlobalDim
import TauCeti.CategoryTheory.Monoidal.Braided.Ribbon
import TauCeti.CategoryTheory.Monoidal.Center.Abelian
import TauCeti.CategoryTheory.Monoidal.Center.Pivotal
import TauCeti.CategoryTheory.Monoidal.Center.Rigid
import TauCeti.CategoryTheory.Semisimple.Basic
import TauCeti.CategoryTheory.Semisimple.Rigid
import TauCeti.CategoryTheory.Simple.Classes

/-!
# Pivotal and spherical categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Everything below is stated against the pinned Tau Ceti carriers (`TauCeti.PivotalCategory`,
`TauCeti.leftTrace`, `TauCeti.SphericalCategory`, `TauCeti.IsFiniteSemisimpleCategory`,
`TauCeti.BalancedCategory`, `TauCeti.RibbonCategory`, the canonical structures on
`CategoryTheory.Center C`, …). Only small definitions with real bodies are introduced.

Not stated here, because the carrier is a construction that does not exist at the pin:

* Layer 8: the category `Vec^ω_G` over a commutative ring, its rigid and pivotal structures, the
  classification of pivotal structures by `G →* Rˣ`, the spherical criterion and the
  Frobenius–Schur indicators of the `δ_g`; and the Layer 9 statement `U(Vec^ω_G) = G`.
* Layer 11: the induction functor `Center C ⥤ …` and its two adjunctions, and the averaging
  identity, which are stated about that functor.
* Layer 7: the comparison of the categorical `ν₂` on `FDRep` with the character-theoretic one,
  whose carrier belongs to `RepresentationTheory/CharacterTheory`.
-/

namespace TauCetiRoadmap.PivotalSpherical

open CategoryTheory MonoidalCategory Limits TauCeti

universe w v u

/-! ## Layer 2: traces on objects with scalar endomorphisms, over a commutative ring -/

section ScalarTrace

variable (R : Type w) [CommRing R] {C : Type u} [Category.{v} C] [MonoidalCategory C]
  [RigidCategory C] [Preadditive C] [Linear R C] [MonoidalPreadditive C] [MonoidalLinear R C]

/-- **The left trace on an object with scalar endomorphisms** is the scalar times the left
dimension. The pinned field form, for a simple object over an algebraically closed field, is a
corollary by Schur's lemma. -/
theorem leftTrace_eq_smul_leftDim_of_bijective [PivotalCategory C] {X : C}
    (hX : Function.Bijective (algebraMap R (End X))) (f : End X) :
    leftTrace f.asHom = (RingEquiv.ofBijective _ hX).symm f • leftDim X := sorry

/-- **The right trace on an object with scalar endomorphisms.** -/
theorem rightTrace_eq_smul_rightDim_of_bijective [PivotalCategory C] {X : C}
    (hX : Function.Bijective (algebraMap R (End X))) (f : End X) :
    rightTrace f.asHom = (RingEquiv.ofBijective _ hX).symm f • rightDim X := sorry

/-- **`dim_L X ≫ dim_R X` does not depend on the pivotal structure** when `X` has scalar
endomorphisms: two pivotal structures differ on `X` by a unit scalar and its inverse. -/
theorem leftDim_comp_rightDim_eq_of_bijective (P Q : PivotalCategory C) {X : C}
    (hX : Function.Bijective (algebraMap R (End X))) :
    @leftDim C _ _ _ P X ≫ @rightDim C _ _ _ P X = @leftDim C _ _ _ Q X ≫ @rightDim C _ _ _ Q X :=
  sorry

end ScalarTrace

/-! ## Layer 3: dual bases of morphisms, over a commutative ring -/

/-- **A split simple family** `S : ι → C` in an `R`-linear category with finite biproducts: each
`S i` has endomorphisms `R`, the family is hom-orthogonal, and every object is a finite biproduct
of members of the family. No finiteness of `ι` is assumed. -/
structure IsSplitSimpleFamily (R : Type w) [CommRing R] {C : Type u} [Category.{v} C]
    [Preadditive C] [Linear R C] [HasFiniteBiproducts C] {ι : Type*} (S : ι → C) : Prop where
  bijective_algebraMap : ∀ i, Function.Bijective (algebraMap R (End (S i)))
  homOrthogonal : HomOrthogonal S
  exists_iso_biproduct : ∀ X : C, ∃ (κ : Type) (_ : Fintype κ) (f : κ → ι),
    Nonempty (X ≅ ⨁ (S ∘ f))

namespace IsSplitSimpleFamily

variable {R : Type w} [CommRing R] {C : Type u} [Category.{v} C] [Preadditive C] [Linear R C]
  [HasFiniteBiproducts C] {ι : Type*} {S : ι → C} (hS : IsSplitSimpleFamily R S)
include hS

/-- **The Hom modules out of a member are free of finite rank.** -/
theorem free_finite_hom (i : ι) (X : C) :
    Module.Free R (S i ⟶ X) ∧ Module.Finite R (S i ⟶ X) := sorry

/-- **Dual bases.** Every basis of `S i ⟶ X` has a dual family in `X ⟶ S i` under composition;
this is the perfectness of the composition pairing. -/
theorem exists_homDual (i : ι) (X : C) {κ : Type*} [Fintype κ] [DecidableEq κ]
    (b : Module.Basis κ R (S i ⟶ X)) :
    ∃ c : κ → (X ⟶ S i), ∀ j k, b j ≫ c k = if j = k then 𝟙 (S i) else 0 := sorry

/-- **The completeness relation**, summed over any finite set of indices outside of which there
are no morphisms into `X`. -/
theorem sum_sum_comp_eq_id (X : C) (s : Finset ι) (hs : ∀ j ∉ s, ∀ g : S j ⟶ X, g = 0)
    {κ : ι → Type*} [∀ i, Fintype (κ i)] [∀ i, DecidableEq (κ i)]
    (b : ∀ i, Module.Basis (κ i) R (S i ⟶ X)) (c : ∀ i, κ i → (X ⟶ S i))
    (hc : ∀ i j k, b i j ≫ c i k = if j = k then 𝟙 (S i) else 0) :
    ∑ i ∈ s, ∑ j, c i j ≫ b i j = 𝟙 X := sorry

end IsSplitSimpleFamily

/-- **The field case.** In a finite semisimple abelian category over an algebraically closed
field with finite-dimensional endomorphisms of simples, the representatives of the simple
classes form a split simple family; no finiteness of `SimpleClasses C` is needed. -/
theorem isSplitSimpleFamily_simpleClasses (k : Type w) [Field k] [IsAlgClosed k] {C : Type u}
    [Category.{v} C] [Abelian C] [HasFiniteBiproducts C] [Linear k C] [IsFiniteSemisimpleCategory C]
    [∀ S : SimpleClasses C, FiniteDimensional k (S.repr ⟶ S.repr)] :
    IsSplitSimpleFamily k (fun S : SimpleClasses C ↦ S.repr) := sorry

/-! ## Layer 5: Perron–Frobenius for primitive matrices -/

/-- **The Perron root of a primitive matrix strictly dominates** every other eigenvalue. The
index type is nonempty, as for the pinned `Matrix.exists_mulVec_eq_smul_of_nonneg`. -/
theorem Matrix.IsPrimitive.norm_lt_of_hasEigenvalue {n : Type*} [Fintype n] [DecidableEq n]
    [Nonempty n] {A : Matrix n n ℝ} (hA : A.IsPrimitive) :
    ∃ r : ℝ, 0 < r ∧ spectralRadius ℂ (A.map ((↑) : ℝ → ℂ)) = ENNReal.ofReal r ∧
      ∀ μ : ℂ, Module.End.HasEigenvalue (Matrix.toLin' (A.map ((↑) : ℝ → ℂ))) μ →
        μ ≠ (r : ℂ) → ‖μ‖ < r := sorry

/-! ## Layer 6: squared norms, without a pivotal structure -/

section SquaredNorm

variable {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]

/-- The trace of a morphism `X ⟶ Xᘁᘁ`, closed with the evaluation of `Xᘁ`. -/
noncomputable def doubleDualTrace {X : C} (a : X ⟶ (Xᘁ : C)ᘁ) : 𝟙_ C ⟶ 𝟙_ C :=
  η_ X (Xᘁ : C) ≫ a ▷ (Xᘁ : C) ≫ ε_ (Xᘁ : C) ((Xᘁ : C)ᘁ : C)

/-- **The squared norm** of `X` with respect to an isomorphism `a : X ≅ Xᘁᘁ`
(Etingof–Nikshych–Ostrik, *On fusion categories*, §2.1): `Tr(a) · Tr((a⁻¹)ᘁ)`. -/
noncomputable def squaredNorm {X : C} (a : X ≅ (Xᘁ : C)ᘁ) : 𝟙_ C ⟶ 𝟙_ C :=
  doubleDualTrace a.hom ≫ doubleDualTrace (rightAdjointMate a.inv)

/-- **Independence of the isomorphism**, for an object with scalar endomorphisms. -/
theorem squaredNorm_congr (R : Type w) [CommRing R] [Preadditive C] [Linear R C]
    [MonoidalPreadditive C] [MonoidalLinear R C] {X : C}
    (hX : Function.Bijective (algebraMap R (End X))) (a b : X ≅ (Xᘁ : C)ᘁ) :
    squaredNorm a = squaredNorm b := sorry

/-- **Comparison with a pivotal structure**: the squared norm is `dim_L X ≫ dim_R X`, the
summand of the pinned `TauCeti.globalDim`. -/
theorem squaredNorm_pivotalIsoApp [PivotalCategory C] (X : C) :
    squaredNorm (pivotalIsoApp X) = leftDim X ≫ rightDim X := sorry

end SquaredNorm

/-! ## Layer 6: global dimension, the Radford isomorphism and nonvanishing -/

section Radford

variable (k : Type w) [Field k] [IsAlgClosed k] (C : Type u) [Category.{v} C]
  [MonoidalCategory C] [RigidCategory C] [Abelian C] [MonoidalPreadditive C] [Linear k C]
  [MonoidalLinear k C] [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
  [Simple (𝟙_ C)] [Fintype (SimpleClasses C)]

/-- **The global dimension without a pivotal structure** (6.2): the sum of the squared norms of
the simple representatives, each for some isomorphism to its double dual. -/
noncomputable def normGlobalDim : 𝟙_ C ⟶ 𝟙_ C :=
  ∑ S : SimpleClasses C,
    squaredNorm (Classical.choice (nonempty_iso_rightDual_rightDual S.repr))

include k in
/-- **The Radford isomorphism** (6.7; EGNO, Theorem 7.19.1 and Corollary 7.19.3): in a fusion
category the quadruple dual is monoidally isomorphic to the identity. -/
theorem exists_radfordIso :
    ∃ e : 𝟭 C ≅ doubleRightDualFunctor C ⋙ doubleRightDualFunctor C, NatTrans.IsMonoidal e.hom :=
  sorry

/-- **Nonvanishing in characteristic zero** (6.9; Etingof–Nikshych–Ostrik, Theorem 2.3), with no
pivotal structure. -/
theorem normGlobalDim_ne_zero [CharZero k] : normGlobalDim C ≠ 0 := sorry

end Radford

/-! ## Layer 10: ribbon structures -/

section Ribbon

variable (k : Type w) [Field k] {C : Type u} [Category.{v} C] [MonoidalCategory C]
  [BraidedCategory C] [RigidCategory C] [PivotalCategory C] [Abelian C] [MonoidalPreadditive C]
  [Linear k C] [MonoidalLinear k C]

/-- **The spherical-to-ribbon converse for split semisimple categories** (Henriques–Penneys–Tener,
Proposition A.4): if every object is a finite biproduct of simple objects whose endomorphisms are
`k`, and Hom spaces are finite-dimensional, then a spherical structure makes the induced twist
ribbon. No finiteness of the simple classes and no characteristic hypothesis is needed; the
characteristic-three `FDRep k C₃` example shows that semisimplicity cannot be dropped. -/
theorem ribbonCategory_balancedOfBraidedPivotal_of_spherical [SphericalCategory C]
    [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    (hsplit : ∀ X : C, Simple X → Function.Bijective (algebraMap k (End X))) :
    @RibbonCategory C _ _ _ _ (balancedOfBraidedPivotal C) := sorry

end Ribbon

/-! ## Layer 11: the centre of a fusion category is a fusion category -/

section CenterFusion

variable (k : Type w) [Field k] [IsAlgClosed k] [CharZero k] (C : Type u) [Category.{v} C]
  [MonoidalCategory C] [RigidCategory C] [Abelian C] [MonoidalPreadditive C] [Linear k C]
  [MonoidalLinear k C] [IsFiniteSemisimpleCategory C] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
  [Simple (𝟙_ C)] [EssentiallySmall.{w} C] [Fintype (SimpleClasses C)]
  [∀ U : C, PreservesFiniteLimits (tensorLeft U)] [∀ U : C, PreservesFiniteLimits (tensorRight U)]
  [∀ U : C, PreservesFiniteColimits (tensorLeft U)]
  [∀ U : C, PreservesFiniteColimits (tensorRight U)]

/-- **The centre of a fusion category is finite semisimple**, for its canonical abelian
structure, with no pivotal structure assumed (Etingof–Nikshych–Ostrik, Theorem 2.15). -/
theorem isFiniteSemisimpleCategory_center : IsFiniteSemisimpleCategory (Center C) := sorry

/-- **The dimension of the centre** is the square of the global dimension, for the canonical
structures on the centre and the pivotal structure it inherits from `C`. -/
theorem globalDim_center [PivotalCategory C] [Fintype (SimpleClasses (Center C))]
    [EssentiallySmall.{w} (Center C)] :
    (Center.forget C).map (globalDim (Center C)) = globalDim C ≫ globalDim C := sorry

/-- **The centre of a spherical fusion category is ribbon**, for the twist induced by its
braiding and pivotal structure. -/
theorem ribbonCategory_center [PivotalCategory C] [SphericalCategory C] :
    @RibbonCategory (Center C) _ _ _ _ (balancedOfBraidedPivotal (Center C)) := sorry

end CenterFusion

end TauCetiRoadmap.PivotalSpherical
