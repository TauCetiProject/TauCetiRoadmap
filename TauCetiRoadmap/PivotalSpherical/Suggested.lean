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
(`Monoidal/Braided/*`), the Drinfel'd centre (`Monoidal/Center.lean`, braided), the right rigid
symmetric example `FDRep k G` (`RepresentationTheory/FDRep.lean`), a monoidal structure on graded
objects (`CategoryTheory/GradedObject/Monoidal.lean`, untwisted associator), and the general
group-cohomology cochain complex (`RepresentationTheory/Homological/GroupCohomology/*`). It has **no
pivotal categories, no spherical categories, no categorical trace or quantum dimension**, no
cocycle-twisted graded category, and no universal grading group. `Rigid/Basic.lean` carries the
standing TODO *"Define pivotal categories (rigid categories equipped with a natural isomorphism
`ᘁᘁ ≅ 𝟙 C`)"*, which this roadmap discharges.

The core definitions are stated over a **right rigid** category: the double dual `Xᘁᘁ` and both of
HPT's trace formulas use only right duals, and Mathlib registers `FDRep k G` as a
`RightRigidCategory` (via `FGModuleCat`), so this is the natural common generality. The mathematics is
the usual rigid setting (see `README.md`).

The pins below carry their **real axioms**, so an implementer cannot satisfy them with a
weaker-than-intended structure: `Pivotal` is a natural iso `𝟭 C ≅ (-)ᘁᘁ` together with Mathlib's
`NatTrans.IsMonoidal` predicate (the *complete* unit-and-tensor monoidality condition, built on the
double dual's pinned `.Monoidal` instance), not a bare natural iso; and `Balanced` carries the
**balancing axiom** as a genuine field. Monoidality is not left to a docstring: without it the
Freyd–Yetter and torsor milestones are false, and without the balancing axiom `Ribbon` and the
braided↔pivotal equivalence are vacuous. The fusion-level milestones (`frobeniusPerronDim`,
`universalGradingGroup`, the DGNO classification) carry an explicit `IsFusion k C` hypothesis tying
the coefficient field `k` to `C`, and `VecTwisted` is built over a **bundled** normalized 3-cocycle so
its monoidal structure is not asserted for an arbitrary `ω`. `README.md` remains the definitive
document.
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

/-- **The double-dual endofunctor is strong monoidal** (Layer-0 build: the monoidal comparison
`(X ⊗ Y)ᘁᘁ ≅ Xᘁᘁ ⊗ Yᘁᘁ` from `rightDualTensorIso` applied twice, and `𝟙ᘁᘁ ≅ 𝟙`). This is the datum
that makes "pivotal = *monoidal* natural iso `𝟭 C ≅ (-)ᘁᘁ`" a complete definition via Mathlib's
`NatTrans.IsMonoidal`, rather than a bare natural iso. -/
noncomputable instance doubleDualFunctorMonoidal (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] : (doubleDualFunctor C).Monoidal := sorry

/-! ## Layer 1: pivotal structures

A **pivotal structure** is a *monoidal* natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ` (a trivialization of
the double dual). We pin it as exactly that: a natural iso together with Mathlib's
`NatTrans.IsMonoidal` predicate on it, so monoidality (the unit *and* tensor coherences) is Mathlib's
own complete condition — not a hand-rolled axiom list that could be silently incomplete. A bare
natural iso to the double dual is *not* a pivotal structure. -/

/-- **Pivotal category** (discharging the `Rigid/Basic.lean` TODO): a right rigid category with a
**monoidal** natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ`. -/
class Pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C] where
  /-- The natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ`. -/
  iso : 𝟭 C ≅ doubleDualFunctor C
  /-- `φ` is a **monoidal** natural transformation (Mathlib's `NatTrans.IsMonoidal`: unit and tensor
  coherences). -/
  monoidal : NatTrans.IsMonoidal iso.hom

/-- The component `φ_X : X ≅ Xᘁᘁ` of a pivotal structure: the value of `Pivotal.iso` at `X`, retyped
through `doubleDualFunctor_obj`. -/
noncomputable def pivotalIso {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    [Pivotal C] (X : C) : X ≅ ((Xᘁ : C)ᘁ : C) := sorry

/-- **The Freyd–Yetter redundancy** (Selinger, Lem 4.11): the historical fourth axiom
`φ_{Xᘁ} = (φ_X⁻¹)ᘁ` is a theorem, provable from the monoidality of `φ`, not an axiom. -/
theorem pivotalIso_rightDual {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] [Pivotal C] (X : C) :
    (pivotalIso (Xᘁ : C)).hom = rightAdjointMate (pivotalIso X).inv := sorry

/-- **A monoidal natural automorphism of the identity**, an element of `Aut_⊗(𝟭 C)`: a natural iso
`𝟭 C ≅ 𝟭 C` that is monoidal (`NatTrans.IsMonoidal`). These form an abelian group acting on pivotal
structures. -/
structure MonoidalAut (C : Type u) [Category.{v} C] [MonoidalCategory C] where
  /-- The natural automorphism `𝟭 C ≅ 𝟭 C`. -/
  iso : 𝟭 C ≅ 𝟭 C
  /-- It is a monoidal natural transformation. -/
  monoidal : NatTrans.IsMonoidal iso.hom

noncomputable instance (C : Type u) [Category.{v} C] [MonoidalCategory C] :
    Group (MonoidalAut C) := sorry

/-- **The torsor of pivotal structures.** Any two pivotal structures differ by a monoidal natural
automorphism of the identity: `Aut_⊗(𝟭 C)` acts freely and transitively on them (when nonempty). -/
theorem pivotal_torsor {C : Type u} [Category.{v} C] [MonoidalCategory C] [RightRigidCategory C]
    (P Q : Pivotal C) : ∃ u : MonoidalAut C, P.iso = u.iso ≪≫ Q.iso := sorry

/-! ## Layer 2: traces, dimensions, and spherical categories

The left and right traces of `f : X ⟶ X` live in `End 𝟙_C`. With Mathlib's convention
`η_ X Y : 𝟙 ⟶ X ⊗ Y` and `ε_ X Y : Y ⊗ X ⟶ 𝟙`, HPT's formulas are
`tr_L f = ε_ X (Xᘁ) ∘ (𝟙_{Xᘁ} ⊗ f) ∘ (𝟙_{Xᘁ} ⊗ φ_X⁻¹) ∘ η_ (Xᘁ) (Xᘁᘁ)` and
`tr_R f = ε_ (Xᘁ) (Xᘁᘁ) ∘ (φ_X ⊗ 𝟙_{Xᘁ}) ∘ (f ⊗ 𝟙_{Xᘁ}) ∘ η_ X (Xᘁ)`; the bodies are the Layer-2
build. -/

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

/-- **The fusion hypotheses** on `C` over `k`, bundled as a predicate tying the coefficient field `k`
to `C`: `C` is `k`-linear, rigid, semisimple, with finitely many simple objects and `End 𝟙_C ≅ k`
(over an algebraically closed field of characteristic 0). To be defined; a `FusionCategory` class may
replace it after a later refactor. It is the hypothesis under which the fusion-level milestones below
hold. -/
def IsFusion (k : Type) [Field k] (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] : Prop := sorry

/-- **Frobenius–Perron dimension** (fusion bar): the Perron–Frobenius eigenvalue of the fusion
matrices, independent of the pivotal structure and always `> 0`. Stated under `IsFusion k C`; the
target facts are `FPdim X > 0` and `FPdim (X ⊗ Y) = FPdim X * FPdim Y`. -/
noncomputable def frobeniusPerronDim {k : Type} [Field k] {C : Type u} [Category.{v} C]
    [MonoidalCategory C] [RightRigidCategory C] (_hC : IsFusion k C) (X : C) : ℝ := sorry

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
simple objects `δ_g` twisted by a normalized 3-cocycle `ω`. It is a pointed tensor category (fusion
for `G` finite); its pivotal structures form a torsor over `Hom(G, kˣ)`. The degree-3 cocycle
predicate is built from the general `groupCohomology`/`inhomogeneousCochains` differential (Mathlib's
bespoke API stops at `cocycles₂`). -/

section Pointed
variable (k : Type) [Field k] (G : Type) [Group G]

/-- **Normalized 3-cocycle predicate** on `ω : G → G → G → kˣ` (trivial `G`-action on `kˣ`): the
pentagon/normalization conditions, to be defined from the general group-cohomology differential. -/
def IsThreeCocycle (ω : G → G → G → kˣ) : Prop := sorry

/-- **A normalized 3-cocycle**, bundled: the associator datum of `Vec^ω_G`. Bundling ensures the
monoidal structure below is built only for genuine cocycles, never an arbitrary `ω`. Cohomologous
cocycles give monoidally equivalent categories. -/
structure ThreeCocycle where
  /-- The underlying `kˣ`-valued function. -/
  ω : G → G → G → kˣ
  /-- It is a normalized 3-cocycle. -/
  isCocycle : IsThreeCocycle k G ω

/-- **The pointed category `Vec^ω_G`**: `G`-graded finite-dimensional `k`-vector spaces (the
underlying objects are `GradedObject G (FGModuleCat k)`) with the associator twisted by the bundled
cocycle. Simple objects `δ_g`, `δ_g ⊗ δ_h = δ_{gh}`, unit `δ_e`, and `δ_gᘁ = δ_{g⁻¹}`. -/
def VecTwisted (c : ThreeCocycle k G) : Type := sorry

noncomputable instance (c : ThreeCocycle k G) : Category (VecTwisted k G c) := sorry
noncomputable instance (c : ThreeCocycle k G) : MonoidalCategory (VecTwisted k G c) := sorry
noncomputable instance (c : ThreeCocycle k G) : RightRigidCategory (VecTwisted k G c) := sorry

/-- **A pivotal structure on `Vec^ω_G` always exists.** -/
noncomputable instance (c : ThreeCocycle k G) : Pivotal (VecTwisted k G c) := sorry

/-- **Classification of pivotal structures on `Vec^ω_G`**: the type of pivotal structures is (non
canonically — a torsor) in bijection with the characters `Hom(G, kˣ)`, the bijection depending on the
canonical pivotal structure determined by the cocycle as basepoint. -/
noncomputable def VecTwisted.pivotal_equiv_characters (c : ThreeCocycle k G) :
    Pivotal (VecTwisted k G c) ≃ (G →* kˣ) := sorry

/-- **Frobenius–Schur indicators** (Ng–Schauenburg) of the simple object `δ_g`, computed from the
pivotal structure — the concrete invariant distinguishing the pivotal structures. -/
noncomputable def frobeniusSchurIndicator (c : ThreeCocycle k G) [Pivotal (VecTwisted k G c)]
    (n : ℕ) (g : G) : End (𝟙_ (VecTwisted k G c)) := sorry

end Pointed

/-! ## Layer 5: gradings, the universal grading group, and the DGNO classification

For a fusion category `C` over an algebraically closed field of characteristic 0, the monoidal
natural automorphisms of the identity are the characters of the **universal grading group** `U(C)`;
combined with Layer 1's torsor, the pivotal structures are a torsor over `Hom(U(C), kˣ)`. -/

/-- **The universal grading group** `U(C)` of a fusion category: the group carrying the finest
faithful grading, with trivial component the adjoint subcategory `C_ad` (Gelaki–Nikshych; DGNO10).
Stated under `IsFusion k C`. -/
def universalGradingGroup {k : Type} [Field k] (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] (_hC : IsFusion k C) : Type _ := sorry
noncomputable instance {k : Type} [Field k] (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] (hC : IsFusion k C) : Group (universalGradingGroup C hC) := sorry

/-- **The DGNO10 classification**: for a fusion category over an algebraically closed field of
characteristic 0, `Aut_⊗(𝟭 C) ≅ Hom(U(C), kˣ)` — as groups. The coefficient field `k` is the same
one witnessing `IsFusion k C`; here the equivalence of underlying types is pinned. -/
noncomputable def monoidalAut_equiv_characters {k : Type} [Field k] (C : Type u) [Category.{v} C]
    [MonoidalCategory C] [RightRigidCategory C] (hC : IsFusion k C) :
    MonoidalAut C ≃ (universalGradingGroup C hC →* kˣ) := sorry

/-! ## Layer 6: the synoptic chart of tensor categories (HPT Figure 2)

The remaining nodes (braided is Mathlib's `BraidedCategory`) and the arrows: forgetful/axiom-imposing
maps, the Drinfel'd-centre arrows, and the central equivalence `balanced+rigid ≃ braided+pivotal`. -/

/-- **Balanced category**: a braided category with a **twist**, a natural automorphism `θ` of the
identity satisfying the balancing axiom `θ_{X⊗Y} = (θ_X ⊗ θ_Y) ≫ β_{X,Y} ≫ β_{Y,X}`. The axiom is a
genuine field, not a docstring. -/
class Balanced (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C] where
  /-- The twist `θ : 𝟭 C ≅ 𝟭 C`, a natural automorphism of the identity (naturality is free). -/
  twist : 𝟭 C ≅ 𝟭 C
  /-- The balancing axiom (double braiding). -/
  compat : ∀ X Y : C, twist.hom.app (X ⊗ Y) =
    (twist.hom.app X ⊗ₘ twist.hom.app Y) ≫ (BraidedCategory.braiding X Y).hom ≫
      (BraidedCategory.braiding Y X).hom

/-- **Ribbon category**: a balanced right rigid category whose twist is compatible with duals,
`θ_{Xᘁ} = (θ_X)ᘁ`. -/
class Ribbon (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C]
    [RightRigidCategory C] [Balanced C] : Prop where
  /-- The twist commutes with taking duals. -/
  twist_rightDual : ∀ X : C,
    (Balanced.twist (C := C)).hom.app (Xᘁ : C) =
      rightAdjointMate ((Balanced.twist (C := C)).hom.app X)

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
