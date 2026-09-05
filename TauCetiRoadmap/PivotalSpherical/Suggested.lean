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
`ᘁᘁ ≅ 𝟙 C`)"*.

## Declarations shaped after the in-flight Mathlib series

⚠ The declarations in Layers 0 to 2 marked `[#N]` below are **Tau Ceti targets to build now**, whose
names and signatures are taken from an open Mathlib pull request rather than invented here:

* `doubleRightDualFunctor` and its `Functor.Monoidal` instance are
  https://github.com/leanprover-community/mathlib4/pull/42145
* `PivotalCategory`, `pivotalIso`, `pivotalExactPairing` are
  https://github.com/leanprover-community/mathlib4/pull/42150
* `leftTrace`, `rightTrace`, `SphericalCategory`, `trace` are
  https://github.com/leanprover-community/mathlib4/pull/42191
* the pivotal and spherical structures on a rigid symmetric category are
  https://github.com/leanprover-community/mathlib4/pull/42192

⚠ **A `[#N]` marking is not a reason to wait.** None of those PRs has merged, so none of their
content is available; every one of these is work for us, startable today, and the marking tells you
only what to *call* things so that a later swap is cheap. **If and when a PR merges, we delete our
version and import Mathlib's;** we never adapt, fork or argue with what lands, and we never hold a
target back on the theory that it "belongs upstream" (deciding what Mathlib takes is for Mathlib's
contributors, not for us). See the `Relationship to the in-flight Mathlib series` section of
`README.md`, which is binding.

Accordingly the core definitions are stated over `RigidCategory`, following #42150, even though
everything they use is right-handed and `RightRigidCategory` would be the minimal bar. `FDRep k G`
carries only `RightRigidCategory` upstream; supplying the missing instance is a Layer-7 target rather
than a reason to weaken the class.

The pins below carry their **real axioms**, so an implementer cannot satisfy them with a
weaker-than-intended structure: `PivotalCategory` is a natural iso `𝟭 C ≅ (-)ᘁᘁ` together with
Mathlib's `NatTrans.IsMonoidal` predicate (the *complete* unit-and-tensor monoidality condition,
built on the double dual's pinned `.Monoidal` instance), not a bare natural iso; and
`BalancedCategory` carries the **balancing axiom** as a genuine field. Monoidality is not left to a
docstring: without it the Freyd–Yetter and torsor milestones are false, and without the balancing
axiom `RibbonCategory` and the braided↔pivotal equivalence are vacuous. The fusion-level milestones
(`frobeniusPerronDim`, `universalGradingGroup`, the DGNO classification) carry their hypotheses as
ordinary instance arguments, which is what fixes the coefficient field `k`, and `VecTwisted` is built
over a **bundled** normalized 3-cocycle so its monoidal structure is not asserted for an arbitrary
`ω`. `README.md` remains the definitive
document.
-/

namespace TauCetiRoadmap.PivotalSpherical

open CategoryTheory MonoidalCategory

universe w v u

/-! ## Layer 0: the dual and double-dual functors

Mathlib's `rightDualFunctor : C ⥤ (Cᵒᵖ)ᴹᵒᵖ` sends `X ↦ Xᘁ`. Composing it with itself through
`Functor.opMop` lands back in `C`, giving the covariant strong monoidal `doubleRightDualFunctor`.
`Xᘁᘁ` is just how `(Xᘁ)ᘁ` parses, so there is nothing to prove about objects; the endofunctor's
action on morphisms and its monoidal structure are the content. None of this is on Mathlib `master`,
so build it here, shaped as #42145 shapes it. -/

/-- `[#42145]` **The double right dual endofunctor** `(-)ᘁᘁ : C ⥤ C`, `X ↦ Xᘁᘁ`.

Build it as https://github.com/leanprover-community/mathlib4/pull/42145 does, namely
`rightDualFunctor C ⋙ (rightDualFunctor C).opMop`, so that if that PR merges we can delete this and
import `CategoryTheory.doubleRightDualFunctor` instead. -/
noncomputable def doubleRightDualFunctor (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RightRigidCategory C] : C ⥤ C := sorry

/-- `[#42145]` **The double right dual endofunctor is strong monoidal** (#42145 gets this by
`deriving Functor.Monoidal` from the monoidal structures on `rightDualFunctor` and `Functor.opMop`;
do the same).
This is the datum that makes "pivotal = *monoidal* natural iso `𝟭 C ≅ (-)ᘁᘁ`" a complete definition
via Mathlib's `NatTrans.IsMonoidal`, rather than a bare natural iso. -/
noncomputable instance doubleRightDualFunctorMonoidal (C : Type u) [Category.{v} C]
    [MonoidalCategory C] [RightRigidCategory C] : (doubleRightDualFunctor C).Monoidal := sorry

/-- **The dual functor is an equivalence** on a rigid category. Unlike the two above, this one has
no counterpart in the open series at all: it is still listed under `Future work` in
`Rigid/Functor.lean` and #42145 does not close it, so it will survive any merge. The monoidal half of
"monoidal equivalence" is `rightDualFunctorMonoidal`. -/
instance rightDualFunctorIsEquivalence (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] : (rightDualFunctor C).IsEquivalence := sorry

/-- **The double left dual endofunctor** `ᘁᘁ(-) : C ⥤ C`, the left-handed mirror of
`doubleRightDualFunctor`. -/
noncomputable def doubleLeftDualFunctor (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [LeftRigidCategory C] : C ⥤ C := sorry

/-- **The two double duals are inverse, not isomorphic.**

⚠ There is *no* natural isomorphism `(-)ᘁᘁ ≅ ᘁᘁ(-)`; that would force the quadruple dual to be the
identity. What is canonical is that they are mutually inverse monoidal autoequivalences, whose
object-level shadows are Mathlib's `leftDual_rightDual` and `rightDual_leftDual`. Left and right
duals become isomorphic only once a pivotal structure is chosen (#42150's `leftDualIsoRightDual`). -/
noncomputable def doubleRightDualCompDoubleLeftDual (C : Type u) [Category.{v} C]
    [MonoidalCategory C] [RigidCategory C] :
    doubleRightDualFunctor C ⋙ doubleLeftDualFunctor C ≅ 𝟭 C := sorry

/-! ## Layer 1: pivotal structures

A **pivotal structure** is a *monoidal* natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ` (a trivialization of
the double dual). We pin it as exactly that: a natural iso together with Mathlib's
`NatTrans.IsMonoidal` predicate on it, so monoidality (the unit *and* tensor coherences) is Mathlib's
own complete condition — not a hand-rolled axiom list that could be silently incomplete. A bare
natural iso to the double dual is *not* a pivotal structure. -/

/-- `[#42150]` **Pivotal category** (discharging the `Rigid/Basic.lean` TODO): a rigid category with a
**monoidal** natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ`.

Field names follow `CategoryTheory.PivotalCategory` in
https://github.com/leanprover-community/mathlib4/pull/42150, so that this can be deleted in favour
of Mathlib's if that PR merges. -/
class PivotalCategory (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C] where
  /-- The natural isomorphism `φ : 𝟭 C ≅ (-)ᘁᘁ`. -/
  pivotalIso : 𝟭 C ≅ doubleRightDualFunctor C
  /-- `φ` is a **monoidal** natural transformation (Mathlib's `NatTrans.IsMonoidal`: unit and tensor
  coherences). -/
  pivotalIso_isMonoidal : NatTrans.IsMonoidal pivotalIso.hom

/-- The component `φ_X : X ≅ Xᘁᘁ` of a pivotal structure. -/
noncomputable def pivotalIsoApp {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] (X : C) : X ≅ ((Xᘁ : C)ᘁ : C) := sorry

/-- `[#42150]` **In a pivotal category, `X` is a left dual of its right dual.** This is what makes
the trace formulas below the naive ones: `φ` is absorbed into the pairing. Named after
`CategoryTheory.pivotalExactPairing` in #42150. -/
@[implicit_reducible]
noncomputable def pivotalExactPairing {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] (X : C) : ExactPairing (Xᘁ : C) X := sorry

/-- **The Freyd–Yetter redundancy** (Selinger, Lem 4.11): the historical fourth axiom
`φ_{Xᘁ} = (φ_X⁻¹)ᘁ` is a theorem, provable from the monoidality of `φ`, not an axiom.

⚠ Distinct from #42150's `rightAdjointMate_rightAdjointMate` (`(fᘁ)ᘁ = φ_X⁻¹ ≫ f ≫ φ_Y`), which is
about morphisms rather than about `φ` at a dual object; both are wanted, along with the derivation of
each from the other. -/
theorem pivotalIsoApp_rightDual {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] (X : C) :
    (pivotalIsoApp (Xᘁ : C)).hom = rightAdjointMate (pivotalIsoApp X).inv := sorry

/-- **A monoidal natural automorphism of the identity**, an element of `Aut_⊗(𝟭 C)`: a natural iso
`𝟭 C ≅ 𝟭 C` that is monoidal (`NatTrans.IsMonoidal`). These form an abelian group acting on pivotal
structures. -/
structure MonoidalAut (C : Type u) [Category.{v} C] [MonoidalCategory C] where
  /-- The natural automorphism `𝟭 C ≅ 𝟭 C`. -/
  iso : 𝟭 C ≅ 𝟭 C
  /-- It is a monoidal natural transformation. -/
  monoidal : NatTrans.IsMonoidal iso.hom

/-- `Aut_⊗(𝟭 C)` is **abelian**: natural endomorphisms of the identity already commute pointwise by
naturality, before monoidality is imposed. -/
noncomputable instance (C : Type u) [Category.{v} C] [MonoidalCategory C] :
    CommGroup (MonoidalAut C) := sorry

/-- **The torsor of pivotal structures**, transitivity half: any two pivotal structures differ by a
monoidal natural automorphism of the identity. -/
theorem pivotal_torsor {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    (P Q : PivotalCategory C) :
    ∃ u : MonoidalAut C, P.pivotalIso = u.iso ≪≫ Q.pivotalIso := sorry

/-- **The torsor of pivotal structures**, freeness half: the `u` above is unique. Together with
`pivotal_torsor` this is the torsor statement; the final form should use Mathlib's `MulAction`,
`MulAction.IsPretransitive` and freeness rather than these two ad hoc lemmas. -/
theorem pivotal_torsor_unique {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    (P Q : PivotalCategory C) {u u' : MonoidalAut C}
    (h : P.pivotalIso = u.iso ≪≫ Q.pivotalIso) (h' : P.pivotalIso = u'.iso ≪≫ Q.pivotalIso) :
    u = u' := sorry

/-! ## Layer 2: traces, dimensions, and spherical categories

The left and right traces of `f : X ⟶ X` are morphisms `𝟙_ C ⟶ 𝟙_ C`. #42191 packages them through
`pivotalExactPairing X : ExactPairing Xᘁ X`, which absorbs `φ` into the pairing and leaves the naive
formulas `leftTrace f = η_ Xᘁ X ≫ Xᘁ ◁ f ≫ ε_ X Xᘁ` and
`rightTrace f = η_ X Xᘁ ≫ f ▷ Xᘁ ≫ ε_ Xᘁ X`; unfolding the pairing recovers HPT's formulas with `φ_X`
and `φ_X⁻¹` written out. ⚠ #42191 adds these two definitions and **no lemmas about them**, so
everything after the two `def`s below is ours whatever happens to that PR, and is the most valuable
part of this layer. -/

/-- `[#42191]` **Left trace** of an endomorphism (HPT §2.1). -/
noncomputable def leftTrace {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] {X : C} (f : X ⟶ X) : 𝟙_ C ⟶ 𝟙_ C := sorry

/-- `[#42191]` **Right trace** of an endomorphism (HPT §2.1). -/
noncomputable def rightTrace {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] {X : C} (f : X ⟶ X) : 𝟙_ C ⟶ 𝟙_ C := sorry

/-- **Left dimension** `dim_L X = leftTrace (𝟙 X)`. -/
noncomputable def leftDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] (X : C) : 𝟙_ C ⟶ 𝟙_ C := leftTrace (𝟙 X)

/-- **Right dimension** `dim_R X = rightTrace (𝟙 X)`. -/
noncomputable def rightDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] (X : C) : 𝟙_ C ⟶ 𝟙_ C := rightTrace (𝟙 X)

/-- **Cyclicity of the left trace**: `leftTrace (f ≫ g) = leftTrace (g ≫ f)`. Ours: #42191 proves
nothing about the traces it defines, and this is the lemma that makes sphericity meaningful. -/
theorem leftTrace_comm {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] {X Y : C} (f : X ⟶ Y) (g : Y ⟶ X) :
    leftTrace (f ≫ g) = leftTrace (g ≫ f) := sorry

/-- **Left trace via the mate**: `leftTrace f = rightTrace fᘁ`, relating the two traces through the
dual. Ours. -/
theorem leftTrace_eq_rightTrace_mate {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] {X : C} (f : X ⟶ X) :
    leftTrace f = rightTrace (rightAdjointMate f) := sorry

/-- **The left trace is monoidal**: `leftTrace (f ⊗ₘ g) = leftTrace f ≫ leftTrace g` modulo the unit
unitor. Ours. -/
theorem leftTrace_tensor {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] {X Y : C} (f : X ⟶ X) (g : Y ⟶ Y) :
    leftTrace (f ⊗ₘ g) = (λ_ (𝟙_ C)).inv ≫ (leftTrace f ⊗ₘ leftTrace g) ≫ (λ_ (𝟙_ C)).hom := sorry

/-- **The left trace of a scalar is itself.** Ours. -/
theorem leftTrace_unit {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] (a : 𝟙_ C ⟶ 𝟙_ C) : leftTrace a = a := sorry

/-- **Left and right dimension are exchanged by the dual**: `dim_L X = dim_R (Xᘁ)`. Ours. -/
theorem leftDim_eq_rightDim_rightDual {C : Type u} [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] (X : C) : leftDim X = rightDim (Xᘁ : C) := sorry

/-- `[#42191]` **Spherical category**: a pivotal category whose left and right traces agree on every
endomorphism (HPT §2.1). Field name follows `CategoryTheory.SphericalCategory` in #42191. -/
class SphericalCategory (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] : Prop where
  /-- Left and right traces coincide on every endomorphism. -/
  leftTrace_eq_rightTrace : ∀ {X : C} (f : X ⟶ X), leftTrace f = rightTrace f

/-- `[#42191]` **The trace in a spherical category.** Named after `CategoryTheory.trace` in #42191. -/
noncomputable def trace {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] [SphericalCategory C] {X : C} (f : X ⟶ X) : 𝟙_ C ⟶ 𝟙_ C := leftTrace f

/-- **Quantum dimension** `dim X = trace (𝟙 X)` in a spherical category. Ours. -/
noncomputable def quantumDim {C : Type u} [Category.{v} C] [MonoidalCategory C] [RigidCategory C]
    [PivotalCategory C] [SphericalCategory C] (X : C) : 𝟙_ C ⟶ 𝟙_ C := trace (𝟙 X)

/-! ## Layers 3 to 6: finite semisimple categories, fusion categories, Perron–Frobenius

⚠ None of this exists in Mathlib. There is no semisimplicity class, no decomposition API, no
Grothendieck ring for a monoidal category and no Perron–Frobenius theorem, and no other Tau Ceti
roadmap covers any of it. The fusion hypotheses are carried as ordinary instance arguments rather
than bundled: that is what the generality bar in `README.md` asks for, and it fixes the coefficient
field properly, which a `Prop`-valued hypothesis cannot do. -/

/-- **Finite semisimple category**: every object is a finite biproduct of simple objects.

Named *finite* because that is what it says. No separate Karoubian or artinian hypothesis is
needed: abelian categories are idempotent complete, and finite decompositions give finite length.
⚠ It does **not** imply that `Hom` spaces are finite-dimensional over `k`; that is a separate
hypothesis, needed from `endUnitAlgEquiv` onwards. -/
class IsFiniteSemisimpleCategory (C : Type u) [Category.{v} C] [Abelian C] : Prop where
  /-- Every object decomposes as a finite biproduct of simple objects. -/
  exists_biproduct_simples : ∀ X : C, ∃ (ι : Type) (_ : Fintype ι) (f : ι → C)
    (_ : ∀ i, Simple (f i)) (_ : Limits.HasBiproduct f), Nonempty (X ≅ ⨁ f)

/-- **The isomorphism classes of simple objects**, as a subtype of Mathlib's `Skeleton`.

⚠ An opaque index type would state nothing, and `Fintype` of it would not be a finiteness
hypothesis. Using `Skeleton` makes `SimpleClasses.repr` simple by construction and makes equality of
classes mean isomorphism of representatives. The wanted API is the class of a given simple object,
`repr` of that class isomorphic to it, equality of classes iff representatives are isomorphic,
exhaustiveness, and invariance under an equivalence of categories. -/
def SimpleClasses (C : Type u) [Category.{v} C] [Limits.HasZeroMorphisms C] : Type u :=
  {X : Skeleton C // Simple (X.out : C)}

/-- The chosen representative of a class of simple objects. -/
noncomputable def SimpleClasses.repr {C : Type u} [Category.{v} C] [Limits.HasZeroMorphisms C]
    (i : SimpleClasses C) : C := (i.1).out

instance {C : Type u} [Category.{v} C] [Limits.HasZeroMorphisms C] (i : SimpleClasses C) :
    Simple i.repr := i.2

/-- **The endomorphisms of a simple unit are the scalars.**

⚠ `FiniteDimensional k (End (𝟙_ C))` is required and the statement is **false** without it: finite
dimensional vector spaces over `k(t)`, as a `k`-linear category, are semisimple and rigid with a
simple unit and `End (𝟙) = k(t)`. Mathlib's `finrank_endomorphism_simple_eq_one` carries the same
hypothesis. Build this as the inverse of the canonical map `k → End (𝟙_ C)`. -/
noncomputable def endUnitAlgEquiv (k : Type w) [Field k] [IsAlgClosed k] (C : Type u)
    [Category.{v} C] [MonoidalCategory C] [Abelian C] [Linear k C] [Simple (𝟙_ C)]
    [FiniteDimensional k (End (𝟙_ C))] : End (𝟙_ C) ≃ₐ[k] k := sorry

/-- **The fusion coefficients** `N_{ij}^l`, with the convention pinned here.

Targets: this equals the multiplicity of `X_l` in `X_i ⊗ X_j`, and agrees with the count computed
from `X_l ⟶ X_i ⊗ X_j`. ⚠ `Module.finrank` elaborates without a finite-dimensionality instance and
returns junk when the space is infinite-dimensional, so the `Hom`-finiteness hypothesis is doing
real work here. -/
noncomputable def fusionCoeff (k : Type w) [Field k] {C : Type u} [Category.{v} C]
    [MonoidalCategory C] [Abelian C] [Linear k C] [MonoidalPreadditive C] [MonoidalLinear k C]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] (i j l : SimpleClasses C) : ℕ :=
  Module.finrank k (i.repr ⊗ j.repr ⟶ l.repr)

/-- **The Grothendieck based ring** of a fusion category: free of finite rank on `SimpleClasses C`,
with multiplication given by `fusionCoeff`, unit `[𝟙_ C]` and involution `[X] ↦ [Xᘁ]`. Its
**transitivity** in the sense of Etingof–Gelaki–Nikshych–Ostrik is what Layer 5 consumes. -/
def grothendieckRing (k : Type w) [Field k] (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [Abelian C] [Linear k C] [MonoidalPreadditive C] [MonoidalLinear k C]
    [Simple (𝟙_ C)] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] [IsFiniteSemisimpleCategory C]
    [Fintype (SimpleClasses C)] : Type u := sorry

/-- **Frobenius–Perron dimension**: the value at `[X]` of the unique character of the Grothendieck
ring taking nonnegative values on the basis.

⚠ Do **not** define this as the Perron root of the fusion matrix of `X` taken one matrix at a time:
an individual fusion matrix need not be irreducible, and the matrix of the unit is the identity,
which is reducible whenever there is more than one simple class. The construction goes through
multiplication by the sum of all basis elements, whose matrix is strictly positive, and the common
positive eigenvector it produces; identification with the spectral radius of `N_X` is a theorem
afterwards.

Targets: `FPdim (X ⊗ Y) = FPdim X * FPdim Y`, `0 ≤ FPdim X`, and `FPdim X = 0 ↔ IsZero X`. No
characteristic hypothesis is needed. -/
noncomputable def frobeniusPerronDim (k : Type w) [Field k] [IsAlgClosed k] {C : Type u}
    [Category.{v} C] [MonoidalCategory C] [RigidCategory C] [Abelian C] [Linear k C]
    [MonoidalPreadditive C] [MonoidalLinear k C] [Simple (𝟙_ C)]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] [IsFiniteSemisimpleCategory C]
    [Fintype (SimpleClasses C)] (X : C) : ℝ := sorry

/-! ## Layer 7: `FDRep G` is pivotal and spherical (the standard structure)

⚠ #42192 proves that **any** rigid symmetric monoidal category is canonically pivotal (via
`drinfeldIso`) and spherical, and `FDRep k G` is already `SymmetricCategory` in Mathlib. So do **not**
build a bespoke `FDRep` double-duality isomorphism: the only thing standing between us and the
standard structure is that Mathlib registers `FGModuleCat K` as merely `RightRigidCategory`, so
`RigidCategory (FDRep k G)` does not synthesize. Supply that here, and Layer 7 reduces to identifying
the trace with the linear trace. -/

section FDRep
variable (k G : Type) [Field k] [Group G]

/-- **The missing rigidity instance.** Mathlib registers only `RightRigidCategory (FGModuleCat K)`.
`BraidedCategory.rigidCategoryOfRightRigidCategory` would produce this from the symmetric structure,
but the dual vector space is canonical here and should not be routed through the braiding, so build a
genuine `LeftRigidCategory (FGModuleCat K)`. -/
noncomputable instance : LeftRigidCategory (FGModuleCat k) := sorry

/-- Full rigidity of `FGModuleCat k` is then immediate, and propagates to `FDRep k G` through
Mathlib's `Action.instRigidCategory`. -/
noncomputable instance : RigidCategory (FGModuleCat k) := ⟨⟩

/-- **The standard pivotal structure on `FDRep k G`.** After the instance above this is the
Drinfeld isomorphism of the symmetric structure (as in #42192's `symmetricPivotalCategory`) rather
than a hand construction; build it that way. -/
noncomputable instance : PivotalCategory (FDRep k G) := sorry

/-- **`FDRep k G` is spherical**, by the same route as #42192's `symmetricSphericalCategory`. -/
instance : SphericalCategory (FDRep k G) := sorry

/-- **The quantum dimension is the vector-space dimension.** The real content of Layer 7, and the
acceptance criterion for Layer 2's API: it says the categorical trace machinery computes the thing it
is supposed to compute. Ours.

The companion statement, that `trace f` is the ordinary linear trace of `f` for every endomorphism
`f`, needs the identification `End (𝟙_ (FDRep k G)) ≃ₐ[k] k` in order to be stated at all; building
that identification is part of this layer, and the statement is deliberately omitted here rather than
written with a placeholder that would assert nothing. -/
theorem quantumDim_fdRep (V : FDRep k G) :
    quantumDim V = (Module.finrank k V : k) • 𝟙 (𝟙_ (FDRep k G)) := sorry

end FDRep

/-! ## Layer 8: the pointed categories `Vec^ω_G` and their pivotal structures

`Vec^ω_G` is the category of `G`-graded finite-dimensional `k`-vector spaces with associator on the
simple objects `δ_g` twisted by a normalized 3-cocycle `ω`. It is a pointed tensor category (fusion
for `G` finite); its pivotal structures form a torsor over `Hom(G, kˣ)`. The degree-3 cocycle
predicate is built from the general `groupCohomology`/`inhomogeneousCochains` differential (Mathlib's
bespoke API stops at `cocycles₂`). -/

section Pointed
variable (k : Type u) [Field k] (G : Type) [Group G]

/-- **Normalized 3-cocycle predicate** on `ω : G → G → G → kˣ` (trivial `G`-action on `kˣ`): the
cocycle identity, which is the pentagon for `Vec^ω_G`, together with normalization.

Written out rather than derived, because it needs no API that does not already exist. Mathlib's
`groupCohomology A n` takes `A : Rep k G` with additive coefficients, so relating this to
`inhomogeneousCochains` means passing through `Additive kˣ` as a trivial `Rep ℤ G`; that comparison
is a theorem to prove, and this equation is the definition. -/
def IsThreeCocycle (ω : G → G → G → kˣ) : Prop :=
  (∀ g h k l : G, ω h k l * ω g (h * k) l * ω g h k = ω (g * h) k l * ω g h (k * l)) ∧
    (∀ h k : G, ω 1 h k = 1) ∧ (∀ g k : G, ω g 1 k = 1) ∧ (∀ g h : G, ω g h 1 = 1)

/-- **A normalized 3-cocycle**, bundled: the associator datum of `Vec^ω_G`. Bundling ensures the
monoidal structure below is built only for genuine cocycles, never an arbitrary `ω`. Cohomologous
cocycles give monoidally equivalent categories. -/
structure ThreeCocycle where
  /-- The underlying `kˣ`-valued function. -/
  ω : G → G → G → kˣ
  /-- It is a normalized 3-cocycle. -/
  isCocycle : IsThreeCocycle k G ω

/-- **The pointed category `Vec^ω_G`**: `G`-graded finite-dimensional `k`-vector spaces with the
associator twisted by the bundled cocycle. Simple objects `δ_g`, `δ_g ⊗ δ_h = δ_{gh}`, unit `δ_e`,
and `δ_gᘁ = δ_{g⁻¹}`.

⚠ The objects must be **finitely supported** families, not all of `GradedObject G (FGModuleCat k)`.
That type is the full function type `G → FGModuleCat k`, and for infinite `G` the convolution tensor
product is a coproduct over a fibre equivalent to `G`, which `FGModuleCat` does not have. The
universe is `Type (u+1)` for `k : Type u`, not `Type u`. -/
def VecTwisted (c : ThreeCocycle k G) : Type (u + 1) := sorry

noncomputable instance (c : ThreeCocycle k G) : Category (VecTwisted k G c) := sorry
noncomputable instance (c : ThreeCocycle k G) : MonoidalCategory (VecTwisted k G c) := sorry
noncomputable instance (c : ThreeCocycle k G) : RigidCategory (VecTwisted k G c) := sorry

/-- **A pivotal structure on `Vec^ω_G` always exists.** -/
noncomputable instance (c : ThreeCocycle k G) : PivotalCategory (VecTwisted k G c) := sorry

/-- **Classification of pivotal structures on `Vec^ω_G`**: the type of pivotal structures is (non
canonically — a torsor) in bijection with the characters `Hom(G, kˣ)`, the bijection depending on the
canonical pivotal structure determined by the cocycle as basepoint. -/
noncomputable def VecTwisted.pivotal_equiv_characters (c : ThreeCocycle k G) :
    PivotalCategory (VecTwisted k G c) ≃ (G →* kˣ) := sorry

/-- **Frobenius–Schur indicators** (Ng–Schauenburg) of the simple object `δ_g`, computed from the
pivotal structure. Indexed by a **positive** natural.

⚠ These are invariants of the pivotal structure and do not determine it. For `G = ℤ` every
nontrivial `δ_g` has `Hom(𝟙, δ_g^{⊗n}) = 0` for all `n > 0`, so no collection of indicators recovers
a character `ℤ → kˣ`. The completeness statement needs hypotheses on `G`. -/
noncomputable def frobeniusSchurIndicator (c : ThreeCocycle k G) [PivotalCategory (VecTwisted k G c)]
    (n : ℕ+) (g : G) : 𝟙_ (VecTwisted k G c) ⟶ 𝟙_ (VecTwisted k G c) := sorry

end Pointed

/-! ## Layer 9: gradings, the universal grading group, and the DGNO classification

For a fusion category `C` over an algebraically closed field of characteristic 0, the monoidal
natural automorphisms of the identity are the characters of the **universal grading group** `U(C)`;
combined with Layer 1's torsor, the pivotal structures are a torsor over `Hom(U(C), kˣ)`. -/

/-- **The universal grading group** `U(C)` of a fusion category: the group carrying the finest
faithful grading, with trivial component the adjoint subcategory `C_ad` (Gelaki–Nikshych; DGNO10).
Consumes the Grothendieck based ring of Layer 4. -/
def universalGradingGroup (k : Type w) [Field k] [IsAlgClosed k] (C : Type u) [Category.{v} C]
    [MonoidalCategory C] [RigidCategory C] [Abelian C] [Linear k C] [MonoidalPreadditive C]
    [MonoidalLinear k C] [Simple (𝟙_ C)] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    [IsFiniteSemisimpleCategory C] [Fintype (SimpleClasses C)] : Type u := sorry

noncomputable instance (k : Type w) [Field k] [IsAlgClosed k] (C : Type u) [Category.{v} C]
    [MonoidalCategory C] [RigidCategory C] [Abelian C] [Linear k C] [MonoidalPreadditive C]
    [MonoidalLinear k C] [Simple (𝟙_ C)] [∀ X Y : C, FiniteDimensional k (X ⟶ Y)]
    [IsFiniteSemisimpleCategory C] [Fintype (SimpleClasses C)] :
    Group (universalGradingGroup k C) := sorry

/-- **The DGNO10 classification**: for a fusion category over an algebraically closed field of
characteristic 0, `Aut_⊗(𝟭 C) ≃* Hom(U(C), kˣ)`, as groups and not merely as types. `CharZero` is
carried here, where it is genuinely used, rather than as a blanket restriction. -/
noncomputable def monoidalAut_mulEquiv_characters (k : Type w) [Field k] [IsAlgClosed k]
    [CharZero k] (C : Type u) [Category.{v} C] [MonoidalCategory C] [RigidCategory C] [Abelian C]
    [Linear k C] [MonoidalPreadditive C] [MonoidalLinear k C] [Simple (𝟙_ C)]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] [IsFiniteSemisimpleCategory C]
    [Fintype (SimpleClasses C)] :
    MonoidalAut C ≃* (universalGradingGroup k C →* kˣ) := sorry

/-- **The pivotal structures of a fusion category form a torsor over `Hom(U(C), kˣ)`**, when there
is one to start from.

⚠ The nonemptiness hypothesis is not decoration. Whether every fusion category admits a pivotal
structure is open, which is why Etingof–Nikshych–Ostrik's pivotalization exists; dropping `hP` would
assert that conjecture. -/
theorem pivotal_torsor_characters (k : Type w) [Field k] [IsAlgClosed k] [CharZero k] (C : Type u)
    [Category.{v} C] [MonoidalCategory C] [RigidCategory C] [Abelian C] [Linear k C]
    [MonoidalPreadditive C] [MonoidalLinear k C] [Simple (𝟙_ C)]
    [∀ X Y : C, FiniteDimensional k (X ⟶ Y)] [IsFiniteSemisimpleCategory C]
    [Fintype (SimpleClasses C)]
    (hP : Nonempty (PivotalCategory C)) (P Q : PivotalCategory C) :
    ∃! χ : universalGradingGroup k C →* kˣ,
      P.pivotalIso = ((monoidalAut_mulEquiv_characters k C).symm χ).iso ≪≫ Q.pivotalIso := sorry

/-! ## Layer 10: the synoptic chart of tensor categories (HPT Figure 2)

The remaining nodes (braided is Mathlib's `BraidedCategory`) and the arrows: forgetful/axiom-imposing
maps, the Drinfel'd-centre arrows, and the central equivalence `balanced+rigid ≃ braided+pivotal`. -/

/-- **Balanced category**: a braided category with a **twist**, a natural automorphism `θ` of the
identity satisfying the balancing axiom `θ_{X⊗Y} = (θ_X ⊗ θ_Y) ≫ β_{X,Y} ≫ β_{Y,X}`. The axiom is a
genuine field, not a docstring. -/
class BalancedCategory (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C] where
  /-- The twist `θ : 𝟭 C ≅ 𝟭 C`, a natural automorphism of the identity (naturality is free). -/
  twist : 𝟭 C ≅ 𝟭 C
  /-- The balancing axiom (double braiding). -/
  compat : ∀ X Y : C, twist.hom.app (X ⊗ Y) =
    (twist.hom.app X ⊗ₘ twist.hom.app Y) ≫ (BraidedCategory.braiding X Y).hom ≫
      (BraidedCategory.braiding Y X).hom

/-- **Ribbon category**: a balanced right rigid category whose twist is compatible with duals,
`θ_{Xᘁ} = (θ_X)ᘁ`. -/
class RibbonCategory (C : Type u) [Category.{v} C] [MonoidalCategory C] [BraidedCategory C]
    [RigidCategory C] [BalancedCategory C] : Prop where
  /-- The twist commutes with taking duals. -/
  twist_rightDual : ∀ X : C,
    (BalancedCategory.twist (C := C)).hom.app (Xᘁ : C) =
      rightAdjointMate ((BalancedCategory.twist (C := C)).hom.app X)

/-- **The central equivalence, one direction (HPT eq (3))**: a braided right rigid pivotal category
is balanced, via the explicit twist
`θ_X = (𝟙_X ⊗ ε_{Xᘁ}) ∘ (β_{Xᘁᘁ, X} ⊗ 𝟙_{Xᘁ}) ∘ (𝟙_{Xᘁᘁ} ⊗ η_X) ∘ φ_X`. -/
theorem nonempty_balanced_of_braided_pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [BraidedCategory C] [RigidCategory C] [PivotalCategory C] : Nonempty (BalancedCategory C) := sorry

/-- **The central equivalence, other direction**: a braided right rigid balanced category is pivotal.
The round-trips make `balanced+rigid ≃ braided+pivotal` (HPT §2.3, Appendix A.2). -/
theorem nonempty_pivotal_of_braided_balanced (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [BraidedCategory C] [RigidCategory C] [BalancedCategory C] : Nonempty (PivotalCategory C) := sorry

/-- **Drinfel'd-centre arrow `Z(pivotal) = braided+pivotal`** (HPT Prop 2.3): a pivotal structure on
`C` induces one on the (braided) centre `Z(C)`. Assumes the centre is right rigid (a sub-target). -/
theorem nonempty_center_pivotal_of_pivotal (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] [RigidCategory (Center C)] :
    Nonempty (PivotalCategory (Center C)) := sorry

/-- **The twist induced on the centre by a spherical structure.** The pivotal structure of
`nonempty_center_pivotal_of_pivotal` makes `Z C` braided pivotal, and eq (3) turns that into a
twist; this pins *that* twist, which is the one the next statement is about. -/
@[implicit_reducible]
noncomputable def centerBalancedOfSpherical (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] [SphericalCategory C] [RigidCategory (Center C)]
    [PivotalCategory (Center C)] : BalancedCategory (Center C) := sorry

/-- **Drinfel'd-centre arrow `Z(spherical) = ribbon`** (Müger): the centre of a spherical category is
ribbon, for the twist induced by its spherical structure.

⚠ Quantifying over an arbitrary `[BalancedCategory (Center C)]` instead would be **false**. Given a
ribbon twist `θ` and a monoidal natural automorphism `u` of the identity, `θ · u` is again a twist,
and it is ribbon only when `u_{Xᘁ} = (u_X)ᘁ`. The theorem has to name the twist it means, which is
why it is stated against `centerBalancedOfSpherical`. -/
theorem ribbon_center_of_spherical (C : Type u) [Category.{v} C] [MonoidalCategory C]
    [RigidCategory C] [PivotalCategory C] [SphericalCategory C] [RigidCategory (Center C)]
    [PivotalCategory (Center C)] :
    letI := centerBalancedOfSpherical C
    RibbonCategory (Center C) := sorry

end TauCetiRoadmap.PivotalSpherical
