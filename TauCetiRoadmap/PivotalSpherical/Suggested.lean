import Mathlib

/-!
# Pivotal and spherical categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Mathlib has rigid monoidal categories and their duals (`Mathlib/CategoryTheory/Monoidal/Rigid/*`:
`ExactPairing` with `η_`/`ε_`, `HasRightDual`/`HasLeftDual`, the dual-object notation `Xᘁ`/`ᘁX`, the
adjoint mate `rightAdjointMate`, `RightRigidCategory`/`RigidCategory`, and
`rightDualFunctor`/`leftDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ`), braided/symmetric categories
(`Monoidal/Braided/*`), the Drinfel'd centre (`Monoidal/Center.lean`, braided), the rigid symmetric
example `FDRep k G` (`RepresentationTheory/FDRep.lean`), a monoidal structure on graded objects
(`CategoryTheory/GradedObject/Monoidal.lean`, untwisted associator), and the general group-cohomology
cochain complex (`RepresentationTheory/Homological/GroupCohomology/*`). It has **no pivotal
categories, no spherical categories, no categorical trace or quantum dimension**, no cocycle-twisted
graded category, and no universal grading group. `Rigid/Basic.lean` carries the standing TODO
*"Define pivotal categories (rigid categories equipped with a natural isomorphism `ᘁᘁ ≅ 𝟙 C`)"*, which
this roadmap discharges.

The core definitions are stated over a **right rigid** category: the double dual `Xᘁᘁ` and both of
HPT's trace formulas use only right duals, and Mathlib registers `FDRep k G` as a
`RightRigidCategory` (via `FGModuleCat`), so this is the natural common generality. The mathematics is
the usual rigid setting (see `README.md`).

This file pins the load-bearing objects (`doubleDualFunctor`, `Pivotal`, `pivotalIso`, `Spherical`,
`leftTrace`/`rightTrace`, `quantumDim`, `frobeniusPerronDim`, `VecTwisted`, `IsThreeCocycle`,
`universalGradingGroup`, `Balanced`, `Ribbon`) and the named milestones as `sorry`-targets. The
narrative roadmap — the conventions, the layer-by-layer plan (Layers 0–6), the worked examples, and
the references — is in `README.md`, which is definitive; the precise coherence axioms (that a pivotal
structure is a *monoidal* natural iso, and the balancing axiom) are stated there and carried here in
docstrings, since the monoidal structure of `doubleDualFunctor` is itself Layer-0 build work.
-/

namespace TauCetiRoadmap.PivotalSpherical

open CategoryTheory MonoidalCategory

universe v u

/-! ## Layer 0: the dual and double-dual functors

Mathlib's `rightDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ` sends `X ↦ Xᘁ`. The **double dual** is obtained by
applying the dual functor twice and transporting along the canonical monoidal equivalences
`(Dᵒᵖ)ᵒᵖ ≃ D` and `(Dᴹᵒᵖ)ᴹᵒᵖ ≃ D` to land back in `C`. On objects `Xᘁᘁ = (Xᘁ)ᘁ` is `rfl`, but the
endofunctor and its monoidal structure are the actual content. -/

/-- **The double-dual endofunctor** `(-)ᘁᘁ : C ⥤ C`, `X ↦ Xᘁᘁ`. Built by composing `rightDualFunctor`
with itself through the `ᵒᵖ`/`ᴹᵒᵖ` identifications; it is a covariant strong monoidal endofunctor, and
a monoidal equivalence on a `RigidCategory` (the `Future work` note in `Rigid/Functor.lean`). -/
noncomputable def doubleDualFunctor (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] : C ⥤ C := sorry

/-- On objects the double-dual functor is the iterated right dual `Xᘁᘁ`. -/
theorem doubleDualFunctor_obj {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] (X : C) : (doubleDualFunctor C).obj X = ((Xᘁ : C)ᘁ : C) := sorry

/-! ## Layer 1: pivotal structures

A **pivotal structure** is a *monoidal* natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ` (a trivialization of
the double dual). The monoidal compatibility of `φ` is part of the definition (see `README.md`);
it is carried here in the docstring because the monoidal structure of `doubleDualFunctor` is Layer-0
build work. -/

/-- **Pivotal category** (discharging the `Rigid/Basic.lean` TODO): a right rigid category with a
monoidal natural isomorphism `𝟭 C ≅ (-)ᘁᘁ`. -/
class Pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C] where
  /-- The monoidal natural isomorphism from the identity to the double-dual functor. -/
  doubleDualIso : 𝟭 C ≅ doubleDualFunctor C

/-- The component `φ_X : X ≅ Xᘁᘁ` of a pivotal structure, retyped through `doubleDualFunctor_obj`. -/
noncomputable def pivotalIso {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] (X : C) : X ≅ ((Xᘁ : C)ᘁ : C) := sorry

/-- **The Freyd–Yetter redundancy** (Selinger, Lem 4.11): the historical fourth axiom
`φ_{Xᘁ} = (φ_X⁻¹)ᘁ` is a theorem, not an axiom. -/
theorem pivotalIso_rightDual {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] (X : C) :
    (pivotalIso (Xᘁ : C)).hom = rightAdjointMate (pivotalIso X).inv := sorry

/-- **The torsor of pivotal structures.** Any two pivotal structures differ by a monoidal natural
automorphism of the identity, so pivotal structures form a torsor over `Aut_⊗(𝟭 C)` (see
`monoidalAutId`) when nonempty. -/
theorem pivotal_torsor {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    (P Q : Pivotal C) : ∃ u : 𝟭 C ≅ 𝟭 C, P.doubleDualIso = u ≪≫ Q.doubleDualIso := sorry

/-! ## Layer 2: traces, dimensions, and spherical categories

The left and right traces of `f : X ⟶ X` live in `End 𝟙_C`. In HPT's formulas
`tr_L f = ε_{Xᘁ} ∘ (𝟙 ⊗ f) ∘ (𝟙 ⊗ φ_X⁻¹) ∘ η_{Xᘁ}` and the mirror `tr_R`; the bodies are the
Layer-2 build. -/

/-- **Left trace** of an endomorphism, valued in `End 𝟙_C` (HPT §2.1). -/
noncomputable def leftTrace {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] {X : C} (f : X ⟶ X) : End (𝟙_ C) := sorry

/-- **Right trace** of an endomorphism, valued in `End 𝟙_C` (HPT §2.1). -/
noncomputable def rightTrace {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] {X : C} (f : X ⟶ X) : End (𝟙_ C) := sorry

/-- **Left dimension** `dim_L X = tr_L (𝟙 X)`. -/
noncomputable def leftDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] (X : C) : End (𝟙_ C) := leftTrace (𝟙 X)

/-- **Right dimension** `dim_R X = tr_R (𝟙 X)`. -/
noncomputable def rightDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] (X : C) : End (𝟙_ C) := rightTrace (𝟙 X)

/-- **Cyclicity of the left trace**: `tr_L (f ∘ g) = tr_L (g ∘ f)`. -/
theorem leftTrace_comm {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] {X Y : C} (f : X ⟶ Y) (g : Y ⟶ X) : leftTrace (f ≫ g) = leftTrace (g ≫ f) := sorry

/-- **Left trace via the mate**: `tr_L f = tr_R (fᘁ)`, relating the two traces through the dual. -/
theorem leftTrace_eq_rightTrace_mate {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] {X : C} (f : X ⟶ X) :
    leftTrace f = rightTrace (rightAdjointMate f) := sorry

/-- **Left and right dimension are exchanged by the dual**: `dim_L X = dim_R (Xᘁ)`. -/
theorem leftDim_eq_rightDim_rightDual {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] (X : C) : leftDim X = rightDim (Xᘁ : C) := sorry

/-- **Spherical category**: a pivotal category whose left and right traces agree on every
endomorphism (HPT §2.1). The common value is the spherical trace. -/
class Spherical (C : Type u) [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] : Prop where
  /-- Left and right traces coincide on every endomorphism. -/
  trace_eq : ∀ {X : C} (f : X ⟶ X), leftTrace f = rightTrace f

/-- **The spherical (two-sided) trace** of an endomorphism. -/
noncomputable def sphericalTrace {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] [Spherical C] {X : C} (f : X ⟶ X) : End (𝟙_ C) := leftTrace f

/-- **Quantum dimension** `dim X = tr (𝟙 X)` in a spherical category. -/
noncomputable def quantumDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] [Spherical C] (X : C) : End (𝟙_ C) := sphericalTrace (𝟙 X)

/-- **Frobenius–Perron dimension** (fusion bar): the Perron–Frobenius eigenvalue of the fusion
matrices, independent of the pivotal structure and always `> 0`. Meaningful only under the fusion
hypotheses of `README.md`; pinned here so `FPdim`-vs-`dim` comparisons and pseudo-unitarity are
expressible. -/
noncomputable def frobeniusPerronDim {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] (X : C) : ℝ := sorry

/-! ## Layer 3: `FDRep G` is pivotal and spherical (the standard structure)

For `G` a group and `k` a field, `FDRep k G` is a `RightRigidCategory`; the canonical double-duality
iso `V ≅ Vᘁᘁ` of finite-dimensional representations is a monoidal natural isomorphism, the
**standard** pivotal structure. Its traces are ordinary linear traces, so `FDRep k G` is spherical
and `dim V = finrank k V`. -/

section FDRep
variable (k G : Type) [Field k] [Group G]

/-- **The standard pivotal structure on `FDRep k G`.** -/
noncomputable instance : Pivotal (FDRep k G) := sorry

/-- **`FDRep k G` is spherical** in the standard pivotal structure (left and right traces are both the
ordinary linear trace; in particular `dim V = finrank k V`). -/
instance : Spherical (FDRep k G) := sorry

end FDRep

/-! ## Layer 4: the pointed categories `Vec^ω_G` and their pivotal structures

`Vec^ω_G` is the category of `G`-graded finite-dimensional `k`-vector spaces with associator on the
simple objects `δ_g` twisted by a normalized 3-cocycle `ω`. It is a pointed fusion category; pivotal
structures on it form a torsor over `Hom(G, kˣ)`. The degree-3 cocycle predicate is built from the
general `groupCohomology`/`inhomogeneousCochains` differential (Mathlib's bespoke API stops at
`cocycles₂`). -/

section Pointed
variable (k : Type) [Field k] (G : Type) [Group G]

/-- **Normalized 3-cocycle** `ω ∈ Z³(G, kˣ)` (trivial `G`-action on `kˣ`), the associator data of
`Vec^ω_G`. To be defined from the general group-cohomology differential; cohomologous cocycles give
monoidally equivalent categories. -/
def IsThreeCocycle (ω : G → G → G → kˣ) : Prop := sorry

/-- **The pointed fusion category `Vec^ω_G`**: `G`-graded finite-dimensional `k`-vector spaces (the
underlying objects are `GradedObject G (FGModuleCat k)`) with the associator twisted by `ω`. Simple
objects `δ_g`, `δ_g ⊗ δ_h = δ_{gh}`, unit `δ_e`, and `δ_gᘁ = δ_{g⁻¹}`. -/
def VecTwisted (ω : G → G → G → kˣ) : Type := sorry

noncomputable instance (ω : G → G → G → kˣ) : Category (VecTwisted k G ω) := sorry
noncomputable instance (ω : G → G → G → kˣ) : MonoidalCategory (VecTwisted k G ω) := sorry
noncomputable instance (ω : G → G → G → kˣ) : RightRigidCategory (VecTwisted k G ω) := sorry

/-- **A pivotal structure on `Vec^ω_G` always exists.** -/
noncomputable instance (ω : G → G → G → kˣ) : Pivotal (VecTwisted k G ω) := sorry

/-- **Classification of pivotal structures on `Vec^ω_G`**: the type of pivotal structures is in
bijection with the characters `Hom(G, kˣ)` (a torsor, once the canonical pivotal structure determined
by `ω` is fixed as basepoint). -/
noncomputable def VecTwisted.pivotal_equiv_characters (ω : G → G → G → kˣ) :
    Pivotal (VecTwisted k G ω) ≃ (G →* kˣ) := sorry

/-- **Frobenius–Schur indicators** (Ng–Schauenburg) of the simple object `δ_g`, computed from the
pivotal structure — the concrete invariant distinguishing the pivotal structures. -/
noncomputable def frobeniusSchurIndicator (ω : G → G → G → kˣ) [Pivotal (VecTwisted k G ω)]
    (n : ℕ) (g : G) : End (𝟙_ (VecTwisted k G ω)) := sorry

end Pointed

/-! ## Layer 5: gradings, the universal grading group, and the DGNO classification

For a fusion category `C` over an algebraically closed field of characteristic 0, the monoidal
natural automorphisms of the identity are the characters of the **universal grading group** `U(C)`;
combined with Layer 1's torsor, the pivotal structures are a torsor over `Hom(U(C), kˣ)`. -/

/-- **Monoidal natural automorphisms of the identity**, `Aut_⊗(𝟭 C)` (an abelian group), which acts
on the pivotal structures. The underlying data is a monoidal natural isomorphism `𝟭 C ≅ 𝟭 C`. -/
def monoidalAutId (C : Type u) [Category.{v} C] [MonoidalCategory C] : Type _ := sorry
noncomputable instance (C : Type u) [Category.{v} C] [MonoidalCategory C] :
    Group (monoidalAutId C) := sorry

/-- **The universal grading group** `U(C)` of a fusion category: the group carrying the finest
faithful grading, with trivial component the adjoint subcategory `C_ad` (Gelaki–Nikshych; DGNO10).
Meaningful under the fusion hypotheses of `README.md`. -/
def universalGradingGroup (C : Type u) [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C] :
    Type _ := sorry
noncomputable instance (C : Type u) [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C] :
    Group (universalGradingGroup C) := sorry

/-- **The DGNO10 classification**: for a fusion category over an algebraically closed field of
characteristic 0, `Aut_⊗(𝟭 C) ≅ Hom(U(C), kˣ)`. Stated with an abstract coefficient field `k`; the
`Equiv` is in fact a group isomorphism (see `README.md`). -/
noncomputable def monoidalAutId_equiv_characters (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] (k : Type) [Field k] :
    monoidalAutId C ≃ (universalGradingGroup C →* kˣ) := sorry

/-! ## Layer 6: the synoptic chart of tensor categories (HPT Figure 2)

The remaining nodes (braided is Mathlib's `BraidedCategory`) and the arrows: forgetful/axiom-imposing
maps, the Drinfel'd-centre arrows, and the central equivalence `balanced+rigid ≃ braided+pivotal`. -/

/-- **Balanced category**: a braided category with a **twist**, a natural automorphism `θ` of the
identity satisfying the balancing axiom `θ_{X⊗Y} = (θ_X ⊗ θ_Y) ≫ β_{Y,X} ≫ β_{X,Y}` (see
`README.md`; the axiom is carried in the docstring). -/
class Balanced (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C] where
  /-- The twist: a natural automorphism of the identity functor. -/
  twist : (𝟭 C : C ⥤ C) ≅ 𝟭 C

/-- **Ribbon category**: a balanced right rigid category whose twist is compatible with duals,
`θ_{Xᘁ} = (θ_X)ᘁ`. -/
class Ribbon (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C]
    [RightRigidCategory C] [Balanced C] : Prop where
  /-- The twist commutes with taking duals. -/
  twist_rightDual : ∀ X : C,
    (Balanced.twist (C := C)).hom.app (Xᘁ : C) = rightAdjointMate ((Balanced.twist (C := C)).hom.app X)

/-- **The central equivalence, one direction (HPT eq (3))**: a braided right rigid pivotal category
is balanced, via the explicit twist
`θ_X = (𝟙_X ⊗ ε_{Xᘁ}) ∘ (β_{Xᘁᘁ, X} ⊗ 𝟙_{Xᘁ}) ∘ (𝟙_{Xᘁᘁ} ⊗ η_X) ∘ φ_X`. -/
theorem nonempty_balanced_of_braided_pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [BraidedCategory C] [RightRigidCategory C] [Pivotal C] : Nonempty (Balanced C) := sorry

/-- **The central equivalence, other direction**: a braided right rigid balanced category is pivotal.
The round-trips make `balanced+rigid ≃ braided+pivotal` (HPT §2.3, Appendix A.2). -/
theorem nonempty_pivotal_of_braided_balanced (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [BraidedCategory C] [RightRigidCategory C] [Balanced C] : Nonempty (Pivotal C) := sorry

/-- **Drinfel'd-centre arrow `Z(pivotal) = braided+pivotal`** (HPT Prop 2.3): a pivotal structure on
`C` induces one on the (braided) centre `Z(C)`. Assumes the centre is right rigid (a sub-target). -/
theorem nonempty_center_pivotal_of_pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] [RightRigidCategory (Center C)] :
    Nonempty (Pivotal (Center C)) := sorry

/-- **Drinfel'd-centre arrow `Z(spherical) = ribbon`** (Müger): the centre of a spherical category is
ribbon (with its induced rigid, pivotal and balanced structures). -/
theorem nonempty_center_ribbon_of_spherical (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] [Spherical C] [RightRigidCategory (Center C)]
    [Pivotal (Center C)] [Balanced (Center C)] : Nonempty (Ribbon (Center C)) := sorry

end TauCetiRoadmap.PivotalSpherical
