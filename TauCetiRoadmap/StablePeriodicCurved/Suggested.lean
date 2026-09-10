import Mathlib
import TauCetiRoadmap.DGAInfinity.Suggested
import TauCetiRoadmap.GrothendieckEulerForms.Suggested

/-!
# Stable, periodic, and curved homological algebra: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below suggest Lean forms for load-bearing structures, universal
properties, and acceptance examples. Discharging every declaration here finishes neither a work
item nor the roadmap. `sorry` is allowed in this human-owned roadmap library: these are targets,
not completed definitions or proofs.

The primary algebraic convention is **right modules**. A right module over `A` is therefore a
Mathlib `Module Aᵐᵒᵖ M`. Gradings are cohomological, differentials have degree `+1`, parity is
the reduction of the integer degree modulo two, and the Koszul sign is `(-1)^(p*q)`. For a curved
DG algebra the stored curvature is the right-module curvature `w`: `d_A²(a) = a*w - w*a` and
`d_M²(m) = m*w`. Thus Positselski's usual curvature element is `h = -w`.

The categorical quotient below consumes Mathlib's `CategoryTheory.Quotient`; it does not replace
it with a private category construction. The exact structures used to prove that a Frobenius
stable category is triangulated come from the Grothendieck/Euler-forms roadmap, while the genuine
graded algebra and Koszul API comes from the DG/A-infinity roadmap.

Module categories live in the universe of their ring: a ring `R : Type u` has its finitely
generated modules in `ModuleCat.{u} Rᵐᵒᵖ`, so that the regular module and its finite free powers
are objects of the category being quantified over.

Where a construction produces a triangulated category (periodic homotopy and derived categories,
the curved homotopy category), its shift, pretriangulated, and triangulated structures are
recorded as a `TriangulatedStructure` value and installed as instances on the concrete type, so
that later theorems (triangulated hulls, Verdier quotients) can be stated against Mathlib's
`Pretriangulated` and `ObjectProperty.triangEnvelope` vocabulary rather than against stand-in
propositions.
-/

namespace TauCetiRoadmap.StablePeriodicCurved

open CategoryTheory
open CategoryTheory.Pretriangulated
open TauCetiRoadmap.DGAInfinity
open TauCetiRoadmap.GrothendieckEulerForms

universe u v w

/-- Boundedness for an integer-indexed cochain complex, stated with actual zero-object witnesses.
This predicate is used by every concrete bounded-derived and compression construction below. -/
def IsBoundedCochainComplex {C : Type u} [Category.{v} C]
    [CategoryTheory.Limits.HasZeroMorphisms C] (X : CochainComplex C ℤ) : Prop :=
  ∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → CategoryTheory.Limits.IsZero (X.X i)

/-- The actual full category of bounded cochain complexes. -/
abbrev BoundedCochainComplex (C : Type u) [Category.{v} C]
    [CategoryTheory.Limits.HasZeroMorphisms C] :=
  ObjectProperty.FullSubcategory
    (fun X : CochainComplex C ℤ ↦ IsBoundedCochainComplex X)

/-- The Mathlib structures that make a category triangulated, bundled so that a construction can
return them for a concrete type and have them installed as instances. The fields are the real
preadditive structure, zero object, `ℤ`-shift, additivity of the shifts, pretriangulated axioms,
and octahedron axiom, not a stand-in proposition. -/
structure TriangulatedStructure (T : Type u) [Category.{v} T] where
  preadditive : Preadditive T
  hasZeroObject : CategoryTheory.Limits.HasZeroObject T
  hasShift : HasShift T ℤ
  shift_additive :
    letI := preadditive
    letI := hasShift
    ∀ n : ℤ, (shiftFunctor T n).Additive
  pretriangulated :
    letI := preadditive
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor T n).Additive := shift_additive
    Pretriangulated T
  triangulated :
    letI := preadditive
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor T n).Additive := shift_additive
    letI := pretriangulated
    IsTriangulated T

/-! ## Layer 0: Frobenius functionals and the stable additive quotient -/

/-- A Frobenius functional on a finite-dimensional algebra. Finite-dimensionality belongs in
the hypotheses of the equivalence with `A ≃ A⁺`; the two nondegeneracy fields make the handedness
of the pairing `λ (a*b)` explicit without silently using that theorem. -/
structure FrobeniusFunctional (k A : Type*) [Field k] [Ring A] [Algebra k A] where
  functional : A →ₗ[k] k
  left_nondegenerate : ∀ a : A, (∀ b : A, functional (a * b) = 0) → a = 0
  right_nondegenerate : ∀ b : A, (∀ a : A, functional (a * b) = 0) → b = 0

/-- A symmetric Frobenius functional. This is extra structure: no claim that every Frobenius
algebra is symmetric is built into the API. -/
structure SymmetricFrobeniusFunctional (k A : Type*) [Field k] [Ring A] [Algebra k A]
    extends FrobeniusFunctional k A where
  trace_mul_comm : ∀ a b : A, functional (a * b) = functional (b * a)

/-- A two-sided additive ideal in a preadditive category. Its value on each hom group is an
actual `AddSubgroup`; closure under pre- and postcomposition is the categorical ideal law. -/
structure MorphismIdeal (C : Type u) [Category.{v} C] [Preadditive C] where
  hom : ∀ X Y : C, AddSubgroup (X ⟶ Y)
  comp_left : ∀ {X Y Z : C} (f : X ⟶ Y) {g : Y ⟶ Z},
    g ∈ hom Y Z → f ≫ g ∈ hom X Z
  comp_right : ∀ {X Y Z : C} {f : X ⟶ Y} (g : Y ⟶ Z),
    f ∈ hom X Y → f ≫ g ∈ hom X Z

namespace MorphismIdeal

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- Equality modulo a morphism ideal. -/
def rel (I : MorphismIdeal C) : HomRel C :=
  fun {X Y} f g ↦ f - g ∈ I.hom X Y

instance congruence (I : MorphismIdeal C) : Congruence I.rel where
  equivalence := by
    intro X Y
    refine ⟨?_, ?_, ?_⟩
    · intro f
      simp [rel]
    · intro f g h
      simpa only [rel, neg_sub] using (I.hom X Y).neg_mem h
    · intro f g h hfg hgh
      change f - h ∈ I.hom X Y
      have hs := (I.hom X Y).add_mem hfg hgh
      simpa only [sub_add_sub_cancel] using hs
  comp_left := by
    intro X Y Z f g g' h
    change g - g' ∈ I.hom Y Z at h
    simpa only [rel, Preadditive.comp_sub] using I.comp_left f h
  comp_right := by
    intro X Y Z f f' g h
    change f - f' ∈ I.hom X Y at h
    simpa only [rel, Preadditive.sub_comp] using I.comp_right g h

/-- The stable additive quotient has the same objects and morphisms modulo `I`. -/
abbrev Quotient (I : MorphismIdeal C) := CategoryTheory.Quotient I.rel

/-- Its canonical quotient functor. -/
abbrev quotientFunctor (I : MorphismIdeal C) : C ⥤ I.Quotient :=
  CategoryTheory.Quotient.functor I.rel

/-- Addition respects equality modulo an additive morphism ideal. This named lemma is shared by
the quotient's preadditive structure and the canonical functor's additive instance. -/
theorem rel_add (I : MorphismIdeal C) {X Y : C} (f₁ f₂ g₁ g₂ : X ⟶ Y)
    (hf : I.rel f₁ f₂) (hg : I.rel g₁ g₂) : I.rel (f₁ + g₁) (f₂ + g₂) := by
  change (f₁ + g₁) - (f₂ + g₂) ∈ I.hom X Y
  rw [show (f₁ + g₁) - (f₂ + g₂) = (f₁ - f₂) + (g₁ - g₂) by abel]
  exact (I.hom X Y).add_mem hf hg

noncomputable instance quotientPreadditive (I : MorphismIdeal C) : Preadditive I.Quotient :=
  CategoryTheory.Quotient.preadditive I.rel (by
    intro X Y f₁ f₂ g₁ g₂ hf hg
    exact I.rel_add f₁ f₂ g₁ g₂ hf hg)

/-- The quotient functor is genuinely additive, using Mathlib's quotient implementation. -/
noncomputable instance quotientFunctorAdditive (I : MorphismIdeal C) :
    I.quotientFunctor.Additive :=
  CategoryTheory.Quotient.functor_additive I.rel (by
    intro X Y f₁ f₂ g₁ g₂ hf hg
    exact I.rel_add f₁ f₂ g₁ g₂ hf hg)

/-- A functor kills an ideal when every member of the ideal maps to zero. -/
def Kills {D : Type w} [Category D] [Preadditive D] (I : MorphismIdeal C) (F : C ⥤ D)
    [F.Additive] : Prop :=
  ∀ ⦃X Y : C⦄ (f : X ⟶ Y), f ∈ I.hom X Y → F.map f = 0

/-- A functor killing `I` respects equality modulo `I`. -/
theorem map_eq_of_rel {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F)
    ⦃X Y : C⦄ (f g : X ⟶ Y) (h : I.rel f g) : F.map f = F.map g := by
  rw [← sub_eq_zero, ← F.map_sub]
  exact hF (f - g) h

/-- The universal factorization through an additive ideal quotient. -/
noncomputable def lift {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F) : I.Quotient ⥤ D :=
  CategoryTheory.Quotient.lift I.rel F (fun _ _ f g h ↦ I.map_eq_of_rel F hF f g h)

/-- The universal lift is additive. Surjectivity on quotient homs reduces the equation to the
source functor's `map_add` law. -/
noncomputable instance liftAdditive {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F) :
    (I.lift F hF).Additive where
  map_add := by
    intro X Y f g
    obtain ⟨f, rfl⟩ := I.quotientFunctor.map_surjective f
    obtain ⟨g, rfl⟩ := I.quotientFunctor.map_surjective g
    exact F.map_add

theorem lift_fac {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F) :
    I.quotientFunctor ⋙ I.lift F hF = F :=
  CategoryTheory.Quotient.lift_spec I.rel F _

theorem lift_unique {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F)
    (G : I.Quotient ⥤ D) (hG : I.quotientFunctor ⋙ G = F) : G = I.lift F hF :=
  CategoryTheory.Quotient.lift_unique I.rel F _ G hG

/-- A morphism factors through an object satisfying `P`. -/
def FactorsThrough (P : C → Prop) {X Y : C} (f : X ⟶ Y) : Prop :=
  ∃ Q : C, P Q ∧ ∃ i : X ⟶ Q, ∃ p : Q ⟶ Y, f = i ≫ p

/-- The ideal additively generated by maps factoring through `P`-objects. If the `P`-objects
are closed under finite biproducts, every element itself factors through one `P`-object. -/
noncomputable def factorIdeal (P : C → Prop) : MorphismIdeal C where
  hom X Y := AddSubgroup.closure {f : X ⟶ Y | FactorsThrough P f}
  comp_left := by
    intro X Y Z f g hg
    induction hg using AddSubgroup.closure_induction with
    | mem g hg =>
        apply AddSubgroup.subset_closure
        rcases hg with ⟨Q, hQ, i, p, rfl⟩
        exact ⟨Q, hQ, f ≫ i, p, by simp⟩
    | zero => simpa using (AddSubgroup.zero_mem _)
    | add g h _ _ hg hh =>
        simpa only [Preadditive.comp_add] using (AddSubgroup.add_mem _ hg hh)
    | neg g _ hg =>
        simpa only [Preadditive.comp_neg] using (AddSubgroup.neg_mem _ hg)
  comp_right := by
    intro X Y Z f g hf
    induction hf using AddSubgroup.closure_induction with
    | mem f hf =>
        apply AddSubgroup.subset_closure
        rcases hf with ⟨Q, hQ, i, p, rfl⟩
        exact ⟨Q, hQ, i, p ≫ g, by simp⟩
    | zero => simpa using (AddSubgroup.zero_mem _)
    | add f h _ _ hf hh =>
        simpa only [Preadditive.add_comp] using (AddSubgroup.add_mem _ hf hh)
    | neg f _ hf =>
        simpa only [Preadditive.neg_comp] using (AddSubgroup.neg_mem _ hf)

theorem mem_factorIdeal_of_factorsThrough (P : C → Prop) {X Y : C} (f : X ⟶ Y)
    (h : FactorsThrough P f) : f ∈ (factorIdeal P).hom X Y :=
  AddSubgroup.subset_closure h

example (I : MorphismIdeal C) : I.quotientFunctor.Additive := inferInstance

example {D : Type w} [Category D] [Preadditive D]
    (I : MorphismIdeal C) (F : C ⥤ D) [F.Additive] (hF : I.Kills F) :
    (I.lift F hF).Additive := inferInstance

end MorphismIdeal

/-! ## Layers 1–2: honest Frobenius-stable and singularity comparison targets -/

namespace FrobeniusComparison

variable {C : Type u} [Category.{v} C] [Preadditive C]
  [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]

/-- Projectivity relative to a specified Quillen exact structure, expressed by the actual lifting
property against deflations. -/
def IsRelativeProjective (E : ExactStructure C) (P : C) : Prop :=
  ∀ {X Y Z : C} {i : X ⟶ Y} {p : Y ⟶ Z}, E.Conflation i p →
    ∀ f : P ⟶ Z, ∃ g : P ⟶ Y, g ≫ p = f

/-- Injectivity relative to a specified Quillen exact structure, expressed by the actual extension
property against inflations. -/
def IsRelativeInjective (E : ExactStructure C) (I : C) : Prop :=
  ∀ {X Y Z : C} {i : X ⟶ Y} {p : Y ⟶ Z}, E.Conflation i p →
    ∀ f : X ⟶ I, ∃ g : Y ⟶ I, i ≫ g = f

/-- The full, nonvacuous Frobenius hypothesis: enough relative projectives and injectives and
equality of the two classes. -/
structure FrobeniusExactData (E : ExactStructure C) : Prop where
  enoughProjectives : ∀ X : C, ∃ (K P : C) (i : K ⟶ P) (p : P ⟶ X),
    E.Conflation i p ∧ IsRelativeProjective E P
  enoughInjectives : ∀ X : C, ∃ (I K : C) (i : X ⟶ I) (p : I ⟶ K),
    E.Conflation i p ∧ IsRelativeInjective E I
  projective_iff_injective : ∀ X : C, IsRelativeProjective E X ↔ IsRelativeInjective E X

/-- The stable category is the already-prototyped additive quotient by maps factoring through
relative projectives; Frobenius data proves that these are also the relative injectives. -/
abbrev StableCategory (E : ExactStructure C) :=
  (MorphismIdeal.factorIdeal (IsRelativeProjective E)).Quotient

/-- Concrete Mathlib structures that Happel's construction must install on the stable quotient.
The fields are the real shift, pretriangulated axioms, and octahedron axiom, not a stand-in
proposition. -/
structure StableTriangulationTarget (E : ExactStructure C) where
  hasZeroObject : CategoryTheory.Limits.HasZeroObject (StableCategory E)
  hasShift : HasShift (StableCategory E) ℤ
  shift_additive :
    letI := hasShift
    ∀ n : ℤ, (shiftFunctor (StableCategory E) n).Additive
  pretriangulated :
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor (StableCategory E) n).Additive := shift_additive
    Pretriangulated (StableCategory E)
  triangulated :
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor (StableCategory E) n).Additive := shift_additive
    letI := pretriangulated
    IsTriangulated (StableCategory E)

/-- Happel's theorem target with its exact Frobenius hypothesis visible. -/
noncomputable def frobeniusStableTriangulation (E : ExactStructure C)
    (H : FrobeniusExactData E) : StableTriangulationTarget E := sorry

/-- Exact acyclicity in a Quillen exact category: the differential factors through a conflation
`Zⁿ ↪ Xⁿ ↠ Zⁿ⁺¹` in every degree. This is the concrete replacement for importing abelian
homology into a merely exact category. -/
structure ExactAcyclicWitness (E : ExactStructure C) (X : CochainComplex C ℤ) where
  cycles : ℤ → C
  inclusion : ∀ n, cycles n ⟶ X.X n
  projection : ∀ n, X.X n ⟶ cycles (n + 1)
  conflation : ∀ n, E.Conflation (inclusion n) (projection n)
  differential : ∀ n, X.d n (n + 1) = projection n ≫ inclusion (n + 1)

/-- Exact acyclicity is existence of the displayed cycle/conflation data. -/
def ExactAcyclic (E : ExactStructure C) (X : CochainComplex C ℤ) : Prop :=
  Nonempty (ExactAcyclicWitness E X)

/-- Exact quasi-isomorphisms between bounded complexes are the maps with exact-acyclic mapping
cone. The source is the actual full category of bounded complexes. -/
noncomputable def exactQuasiIso (E : ExactStructure C) :
    MorphismProperty (BoundedCochainComplex C) :=
  fun _ _ f ↦ ExactAcyclic E (CochainComplex.mappingCone f.hom)

/-- The constructed bounded exact-derived category `Dᵇ(E)`. -/
abbrev ExactBoundedDerived (E : ExactStructure C) := (exactQuasiIso E).Localization

/-- Its formal localization functor from bounded complexes. -/
abbrev exactDerivedQ (E : ExactStructure C) :
    BoundedCochainComplex C ⥤ ExactBoundedDerived E :=
  (exactQuasiIso E).Q

/-- The canonical degree-zero stalk functor into bounded complexes. Its boundedness proof is part
of this construction, rather than an arbitrary functor supplied to a comparison theorem. -/
noncomputable def boundedStalk : C ⥤ BoundedCochainComplex C := sorry

/-- The isomorphism-closed objects of Mathlib's homotopy category represented by bounded
componentwise relatively-projective complexes. This is the concrete `Kᵇ(P)` source. -/
def boundedProjectiveHomotopyProperty (E : ExactStructure C) :
    ObjectProperty (HomotopyCategory C (ComplexShape.up ℤ)) :=
  fun X ↦ ∃ P : CochainComplex C ℤ,
    IsBoundedCochainComplex P ∧ (∀ n : ℤ, IsRelativeProjective E (P.X n)) ∧
      Nonempty ((HomotopyCategory.quotient C (ComplexShape.up ℤ)).obj P ≅ X)

/-- The actual full homotopy category `Kᵇ(P)` of bounded relatively-projective complexes. -/
abbrev BoundedProjectiveHomotopyCategory (E : ExactStructure C) :=
  (boundedProjectiveHomotopyProperty E).FullSubcategory

/-- The canonical functor from `Kᵇ(P)` to the explicit exact-derived localization. It is induced
by the homotopy quotient and exact-derived localization, not supplied to a comparison theorem. -/
noncomputable def boundedProjectiveHomotopyToDerived (E : ExactStructure C) :
    BoundedProjectiveHomotopyCategory E ⥤ ExactBoundedDerived E := sorry

/-- The essential image of the concrete `Kᵇ(P) → Dᵇ(E)` functor. -/
def projectiveComplexImage (E : ExactStructure C) :
    ObjectProperty (ExactBoundedDerived E) :=
  fun X ↦ ∃ P : BoundedProjectiveHomotopyCategory E,
    Nonempty ((boundedProjectiveHomotopyToDerived E).obj P ≅ X)

/-- Structural output of constructing the triangulation on the explicit exact-derived
localization. No category, localization functor, or equivalence is an input field. -/
structure ExactDerivedTriangulation (E : ExactStructure C) where
  preadditive : Preadditive (ExactBoundedDerived E)
  hasZeroObject :
    letI := preadditive
    CategoryTheory.Limits.HasZeroObject (ExactBoundedDerived E)
  hasShift :
    letI := preadditive
    letI := hasZeroObject
    HasShift (ExactBoundedDerived E) ℤ
  shift_additive :
    letI := preadditive
    letI := hasZeroObject
    letI := hasShift
    ∀ n : ℤ, (shiftFunctor (ExactBoundedDerived E) n).Additive
  pretriangulated :
    letI := preadditive
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor (ExactBoundedDerived E) n).Additive := shift_additive
    Pretriangulated (ExactBoundedDerived E)
  triangulated :
    letI := preadditive
    letI := hasZeroObject
    letI := hasShift
    letI : ∀ n : ℤ, (shiftFunctor (ExactBoundedDerived E) n).Additive := shift_additive
    letI := pretriangulated
    IsTriangulated (ExactBoundedDerived E)
  projectiveImageNonempty : (projectiveComplexImage E).Nonempty

/-- The perfect kernel is the actual thick/triangulated envelope of `Kᵇ(P)` inside the explicit
bounded exact-derived category. -/
noncomputable def perfectKernel (E : ExactStructure C) (T : ExactDerivedTriangulation E) :
    ObjectProperty (ExactBoundedDerived E) := by
  letI := T.preadditive
  letI := T.hasZeroObject
  letI := T.hasShift
  letI : ∀ n : ℤ, (shiftFunctor (ExactBoundedDerived E) n).Additive := T.shift_additive
  letI := T.pretriangulated
  exact (projectiveComplexImage E).triangEnvelope

/-- Morphisms inverted in the Verdier quotient by the concrete perfect kernel. -/
noncomputable def perfectWeakEquivalence (E : ExactStructure C)
    (T : ExactDerivedTriangulation E) : MorphismProperty (ExactBoundedDerived E) := by
  letI := T.preadditive
  letI := T.hasZeroObject
  letI := T.hasShift
  letI : ∀ n : ℤ, (shiftFunctor (ExactBoundedDerived E) n).Additive := T.shift_additive
  letI := T.pretriangulated
  exact (perfectKernel E T).trW

/-- The constructed Verdier quotient `Dᵇ(E)/Perf(E)`. -/
abbrev ExactSingularityCategory (E : ExactStructure C) (T : ExactDerivedTriangulation E) :=
  (perfectWeakEquivalence E T).Localization

/-- The canonical Verdier localization functor. -/
noncomputable abbrev exactSingularityQ (E : ExactStructure C) (T : ExactDerivedTriangulation E) :
    ExactBoundedDerived E ⥤ ExactSingularityCategory E T :=
  (perfectWeakEquivalence E T).Q

/-- Happel/Keller–Vossieck supplies the triangulation on the concrete exact-derived construction
for a Frobenius exact category. -/
noncomputable def frobeniusExactDerivedTriangulation
    (E : ExactStructure C) (H : FrobeniusExactData E) : ExactDerivedTriangulation E := sorry

/-- The canonical comparison is forced by the degree-zero stalk and the two explicit quotient
functors; killing projective-injectives is proved inside the construction. -/
noncomputable def kellerVossieckComparison [EssentiallySmall C]
    (E : ExactStructure C) (H : FrobeniusExactData E) :
    StableCategory E ⥤
      ExactSingularityCategory E (frobeniusExactDerivedTriangulation E H) := sorry

/-- Keller–Vossieck's theorem for the explicit quotient
`Stable(E) → Dᵇ(E)/Perf(E)`, with no arbitrary source, target, or proposed equivalence. -/
theorem kellerVossieckComparison_isEquivalence [EssentiallySmall C]
    (E : ExactStructure C) (H : FrobeniusExactData E) :
    (kellerVossieckComparison E H).IsEquivalence := sorry

/-- Ring-theoretic hypotheses in Buchweitz's theorem, with both noetherian sides and both finite
self-injective dimensions represented by Mathlib's homological-dimension predicates. -/
structure IwanagaGorensteinHypotheses (R : Type u) [Ring R] : Prop where
  leftNoetherian : IsNoetherianRing R
  rightNoetherian : IsNoetherianRing Rᵐᵒᵖ
  leftSelfInjectiveDimension : ∃ n : ℕ,
    HasInjectiveDimensionLE (ModuleCat.of R R) n
  rightSelfInjectiveDimension : ∃ n : ℕ,
    HasInjectiveDimensionLE (ModuleCat.of Rᵐᵒᵖ R) n

/-- Finitely generated right modules, as a concrete full subcategory of `ModuleCat Rᵐᵒᵖ`. -/
abbrev FinitelyGeneratedRightModule (R : Type u) [Ring R] :=
  ObjectProperty.FullSubcategory
    (fun M : ModuleCat.{u} Rᵐᵒᵖ ↦ Module.Finite Rᵐᵒᵖ M)

noncomputable instance finitelyGeneratedRightModuleHasZeroObject
    (R : Type u) [Ring R] :
    CategoryTheory.Limits.HasZeroObject (FinitelyGeneratedRightModule R) := sorry

noncomputable instance finitelyGeneratedRightModuleHasBinaryBiproducts
    (R : Type u) [Ring R] :
    CategoryTheory.Limits.HasBinaryBiproducts (FinitelyGeneratedRightModule R) := sorry

/-- A complete projective resolution: a complex of *finitely generated* projective right modules
with the actual acyclicity of both `P` and `Hom_R(P,R)`, and with its degree-zero cycle
identified with `M`. Finite generation is a field of its own: finite generation of the cycle does
not force it on the terms (adding a contractible disk on an infinite free module away from degree
zero preserves every other field), and the comparison with `Kᵇ(proj-R)` needs it. -/
structure CompleteProjectiveResolution {R : Type u} [Ring R]
    (M : ModuleCat.{u} Rᵐᵒᵖ) where
  complex : CochainComplex (ModuleCat.{u} Rᵐᵒᵖ) ℤ
  componentFinite : ∀ n : ℤ, Module.Finite Rᵐᵒᵖ (complex.X n)
  componentProjective : ∀ n : ℤ, Projective (complex.X n)
  acyclic : complex.Acyclic
  dualAcyclic : ∀ n : ℤ,
    Function.Exact
      (fun f : complex.X (n + 1) →ₗ[Rᵐᵒᵖ] R ↦ f.comp (complex.d n (n + 1)).hom)
      (fun f : complex.X n →ₗ[Rᵐᵒᵖ] R ↦ f.comp (complex.d (n - 1) n).hom)
  cycleIso : complex.cycles 0 ≅ M

/-- The concrete complete-resolution predicate on finitely generated modules. -/
def IsGorensteinProjective {R : Type u} [Ring R]
    (M : FinitelyGeneratedRightModule R) : Prop :=
  Nonempty (CompleteProjectiveResolution M.obj)

/-- The actual full category `Gproj-R`. -/
abbrev GorensteinProjectiveModule (R : Type u) [Ring R] :=
  ObjectProperty.FullSubcategory (IsGorensteinProjective (R := R))

noncomputable instance gorensteinProjectiveModuleHasZeroObject
    (R : Type u) [Ring R] :
    CategoryTheory.Limits.HasZeroObject (GorensteinProjectiveModule R) := sorry

noncomputable instance gorensteinProjectiveModuleHasBinaryBiproducts
    (R : Type u) [Ring R] :
    CategoryTheory.Limits.HasBinaryBiproducts (GorensteinProjectiveModule R) := sorry

/-- The canonical inclusion `Gproj-R ⥤ mod-R`. -/
abbrev gorensteinProjectiveInclusion {R : Type u} [Ring R] :
    GorensteinProjectiveModule R ⥤ FinitelyGeneratedRightModule R :=
  ObjectProperty.ι (IsGorensteinProjective (R := R))

/-- The inherited abelian exact structure on finitely generated right modules over a right
noetherian ring. -/
noncomputable def finitelyGeneratedModuleExactStructure {R : Type u} [Ring R]
    (hR : IsNoetherianRing Rᵐᵒᵖ) : ExactStructure (FinitelyGeneratedRightModule R) := sorry

/-- The inherited Frobenius exact structure on the concrete Gorenstein-projective category. -/
noncomputable def gorensteinProjectiveExactStructure {R : Type u} [Ring R]
    (hR : IwanagaGorensteinHypotheses R) : ExactStructure (GorensteinProjectiveModule R) := sorry

theorem gorensteinProjectiveFrobeniusData {R : Type u} [Ring R]
    (hR : IwanagaGorensteinHypotheses R) :
    FrobeniusExactData (gorensteinProjectiveExactStructure hR) := sorry

/-- The triangulated bounded-derived construction for the concrete category `mod-R`. -/
noncomputable def finitelyGeneratedDerivedTriangulation {R : Type u} [Ring R]
    (hR : IsNoetherianRing Rᵐᵒᵖ) :
    ExactDerivedTriangulation (finitelyGeneratedModuleExactStructure hR) := sorry

/-- Buchweitz's comparison functor, formed from the concrete inclusion `Gproj-R ⥤ mod-R`, the
canonical stalk, and the explicit perfect-kernel localization. -/
noncomputable def buchweitzComparison {R : Type u} [Ring R]
    (hR : IwanagaGorensteinHypotheses R) :
    StableCategory (gorensteinProjectiveExactStructure hR) ⥤
      ExactSingularityCategory (finitelyGeneratedModuleExactStructure hR.rightNoetherian)
        (finitelyGeneratedDerivedTriangulation hR.rightNoetherian) := sorry

/-- Buchweitz's theorem with its noetherian and two-sided finite self-injective-dimension
hypotheses attached to the concrete `Gproj-R → D_sg(R)` functor. -/
theorem buchweitzComparison_isEquivalence {R : Type u} [Ring R]
    (hR : IwanagaGorensteinHypotheses R) :
    (buchweitzComparison hR).IsEquivalence := sorry

end FrobeniusComparison

open FrobeniusComparison

/-! ## Layer 3: differential modules and genuine two-periodic complexes -/

/-- A differential module is a *one-periodic* object: one right module over a possibly
noncommutative ring and one square-zero right-linear endomorphism. It is not definitionally a
parity-graded two-periodic complex. -/
structure DifferentialModule (R M : Type*) [Ring R] [AddCommGroup M] [Module Rᵐᵒᵖ M] where
  d : M →ₗ[Rᵐᵒᵖ] M
  d_sq : d.comp d = 0

namespace DifferentialModule

variable {R M : Type*} [Ring R] [AddCommGroup M] [Module Rᵐᵒᵖ M]

/-- Coherent one-periodicity for the categorical shift. A natural isomorphism, rather than an
objectwise family, supplies exactly the naturality needed to transport a square-zero endomorphism
through Mathlib's shifted-square convention. -/
structure OnePeriodicIdentityShift (R : Type*) [Ring R]
    [HasShift (ModuleCat Rᵐᵒᵖ) (ZMod 1)] where
  identity : shiftFunctor (ModuleCat Rᵐᵒᵖ) (1 : ZMod 1) ≅
    Functor.id (ModuleCat Rᵐᵒᵖ)

/-- The precise bridge to Mathlib's categorical `DifferentialObject`. Its shifted-square proof is
derived from `X.d_sq` using naturality of the coherent identity shift; no desired square equation
is accepted as an input. -/
noncomputable def toMathlibDifferentialObject (X : DifferentialModule R M)
    [HasShift (ModuleCat Rᵐᵒᵖ) (ZMod 1)]
    (S : OnePeriodicIdentityShift R) :
    DifferentialObject (ZMod 1) (ModuleCat Rᵐᵒᵖ) where
  obj := ModuleCat.of Rᵐᵒᵖ M
  d := ModuleCat.ofHom X.d ≫
    S.identity.inv.app (ModuleCat.of Rᵐᵒᵖ M)
  d_squared := by
    rw [Functor.map_comp]
    simp only [Category.assoc]
    rw [← S.identity.inv.naturality_assoc]
    simp only [Functor.id_obj, Functor.id_map]
    have hd : ModuleCat.ofHom X.d ≫ ModuleCat.ofHom X.d = 0 := by
      ext x
      exact LinearMap.congr_fun X.d_sq x
    rw [← Category.assoc, hd]
    simp

end DifferentialModule

/-! ## Layer 3, continued: one-periodic compression and genuine periodic complexes -/

/-- One-periodic compression is an actual right differential module on the direct sum of all
degrees. Boundedness is retained as a named hypothesis; the implementation uses it to replace the
displayed direct sum by a finite biproduct and to construct the differential from the component
maps. -/
noncomputable def compressBoundedRightModuleComplex
    {R : Type u} [Ring R] (X : CochainComplex (ModuleCat Rᵐᵒᵖ) ℤ)
    (hX : IsBoundedCochainComplex X) :
    DifferentialModule R (DirectSum ℤ (fun i ↦ X.X i)) := sorry

/-- A genuine `n`-periodic complex in an additive category. The period is positive: `ZMod 0` is
integer indexing, which describes an ordinary complex rather than a finite cyclic grading, so the
`n = 0` case is excluded by `NeZero n` rather than admitted as a degenerate instance. -/
structure PeriodicComplex (C : Type u) [Category.{v} C] [Preadditive C] (n : ℕ) [NeZero n] where
  X : ZMod n → C
  d : ∀ i, X i ⟶ X (i + 1)
  d_sq : ∀ i, d i ≫ d (i + 1) = 0

namespace PeriodicComplex

variable {C : Type u} [Category.{v} C] [Preadditive C] {n : ℕ} [NeZero n]

/-- Even chain maps of periodic complexes. -/
@[ext]
structure Hom (X Y : PeriodicComplex C n) where
  f : ∀ i, X.X i ⟶ Y.X i
  comm : ∀ i, X.d i ≫ f (i + 1) = f i ≫ Y.d i

/-- Identities and composition are componentwise; the commuting-square fields are load-bearing. -/
noncomputable instance : Category (PeriodicComplex C n) where
  Hom := Hom
  id X :=
    { f := fun _ ↦ 𝟙 _
      comm := by simp }
  comp f g :=
    { f := fun i ↦ f.f i ≫ g.f i
      comm := by
        intro i
        rw [← Category.assoc, f.comm, Category.assoc, g.comm]
        simp only [Category.assoc] }
  id_comp := by
    intro X Y f
    ext i
    simp
  comp_id := by
    intro X Y f
    ext i
    simp
  assoc := by
    intro W X Y Z f g h
    ext i
    simp

/-- Evaluation at a residue class. -/
@[simps]
noncomputable def eval (i : ZMod n) : PeriodicComplex C n ⥤ C where
  obj X := X.X i
  map f := f.f i

/-- The cyclic shift: `(X⟦1⟧)ⁱ = Xⁱ⁺¹` with negated differential. -/
@[simps]
noncomputable def cyclicShift (X : PeriodicComplex C n) : PeriodicComplex C n where
  X i := X.X (i + 1)
  d i := -X.d (i + 1)
  d_sq i := by simp [X.d_sq]

section Cone

variable [CategoryTheory.Limits.HasBinaryBiproducts C]

open CategoryTheory.Limits in
/-- The mapping cone of an even chain map, with Mathlib's cochain convention
`cone(f)ⁱ = Xⁱ⁺¹ ⊞ Yⁱ` and differential `[[-d_X, 0], [f, d_Y]]`. The biproducts it needs are a
hypothesis of the cone itself, not of a later theorem about it. -/
noncomputable def mappingCone {X Y : PeriodicComplex C n} (f : X ⟶ Y) : PeriodicComplex C n where
  X i := X.X (i + 1) ⊞ Y.X i
  d i := biprod.desc
    (-X.d (i + 1) ≫ biprod.inl + f.f (i + 1) ≫ biprod.inr)
    (Y.d i ≫ biprod.inr)
  d_sq i := by
    apply biprod.hom_ext'
    · simp only [biprod.inl_desc_assoc, Preadditive.add_comp, Preadditive.neg_comp,
        Category.assoc, biprod.inl_desc, biprod.inr_desc, Preadditive.comp_add,
        Preadditive.comp_neg, reassoc_of% (X.d_sq (i + 1)), Limits.zero_comp, neg_zero,
        zero_add, ← reassoc_of% (f.comm (i + 1)), neg_add_cancel, Limits.comp_zero]
    · simp only [biprod.inr_desc_assoc, Category.assoc, biprod.inr_desc,
        reassoc_of% (Y.d_sq i), Limits.zero_comp, Limits.comp_zero]

/-- The inclusion of the target into the cone. -/
noncomputable def coneInl {X Y : PeriodicComplex C n} (f : X ⟶ Y) : Y ⟶ mappingCone f where
  f i := CategoryTheory.Limits.biprod.inr
  comm i := by simp [mappingCone]

/-- The projection from the cone onto the cyclic shift of the source. -/
noncomputable def coneFst {X Y : PeriodicComplex C n} (f : X ⟶ Y) :
    mappingCone f ⟶ X.cyclicShift where
  f i := CategoryTheory.Limits.biprod.fst
  comm i := by
    apply CategoryTheory.Limits.biprod.hom_ext'
    · simp only [mappingCone, cyclicShift, CategoryTheory.Limits.biprod.inl_desc_assoc,
        Preadditive.add_comp, Preadditive.neg_comp, Preadditive.comp_neg, Category.assoc,
        CategoryTheory.Limits.biprod.inl_fst, CategoryTheory.Limits.biprod.inr_fst,
        Category.comp_id, CategoryTheory.Limits.comp_zero, add_zero,
        CategoryTheory.Limits.biprod.inl_fst_assoc]
    · simp only [mappingCone, cyclicShift, CategoryTheory.Limits.biprod.inr_desc_assoc,
        Category.assoc, CategoryTheory.Limits.biprod.inr_fst, CategoryTheory.Limits.comp_zero,
        CategoryTheory.Limits.biprod.inr_fst_assoc, CategoryTheory.Limits.zero_comp]

end Cone

/-- An odd homotopy between two even maps. The boundary equation is written on the shifted index
`i + 1`, which ranges over every residue class, so that no `ZMod` cast appears. -/
structure Homotopy {X Y : PeriodicComplex C n} (f g : X ⟶ Y) where
  h : ∀ i, X.X (i + 1) ⟶ Y.X i
  comm : ∀ i, f.f (i + 1) - g.f (i + 1) = X.d (i + 1) ≫ h (i + 1) + h i ≫ Y.d i

/-- Two even maps are homotopic when an odd homotopy joins them. -/
def homotopyRel : HomRel (PeriodicComplex C n) := fun {_ _} f g ↦ Nonempty (Homotopy f g)

noncomputable instance homotopyCongruence :
    Congruence (homotopyRel (C := C) (n := n)) := sorry

/-- Periodic complexes form a preadditive category with componentwise addition. -/
noncomputable instance : Preadditive (PeriodicComplex C n) := sorry

noncomputable instance [CategoryTheory.Limits.HasZeroObject C] :
    CategoryTheory.Limits.HasZeroObject (PeriodicComplex C n) := sorry

noncomputable instance [CategoryTheory.Limits.HasBinaryBiproducts C] :
    CategoryTheory.Limits.HasBinaryBiproducts (PeriodicComplex C n) := sorry

/-- The cyclic shift as a functor. -/
@[simps]
noncomputable def cyclicShiftFunctor : PeriodicComplex C n ⥤ PeriodicComplex C n where
  obj X := X.cyclicShift
  map {X Y} f :=
    { f := fun i ↦ f.f (i + 1)
      comm := by
        intro i
        change (-X.d (i + 1)) ≫ f.f (i + 1 + 1) = f.f (i + 1) ≫ (-Y.d (i + 1))
        rw [Preadditive.neg_comp, Preadditive.comp_neg, f.comm] }

end PeriodicComplex

/-- The periodic homotopy category `Kₙ(C)`: periodic complexes modulo null-homotopic maps. -/
abbrev PeriodicHomotopyCategory (C : Type u) [Category.{v} C] [Preadditive C] (n : ℕ)
    [NeZero n] :=
  CategoryTheory.Quotient (PeriodicComplex.homotopyRel (C := C) (n := n))

/-- The homotopy quotient functor. -/
noncomputable abbrev periodicHomotopyQuotient (C : Type u) [Category.{v} C] [Preadditive C] (n : ℕ)
    [NeZero n] : PeriodicComplex C n ⥤ PeriodicHomotopyCategory C n :=
  CategoryTheory.Quotient.functor _

section PeriodicHomotopyTriangulation

variable (C : Type u) [Category.{v} C] [Preadditive C]
  [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
  (n : ℕ) [NeZero n]

/-- The triangulation of `Kₙ(C)` by cyclic shifts and mapping cones. -/
noncomputable def periodicHomotopyTriangulation :
    TriangulatedStructure (PeriodicHomotopyCategory C n) := sorry

noncomputable instance : Preadditive (PeriodicHomotopyCategory C n) :=
  (periodicHomotopyTriangulation C n).preadditive

noncomputable instance :
    CategoryTheory.Limits.HasZeroObject (PeriodicHomotopyCategory C n) :=
  (periodicHomotopyTriangulation C n).hasZeroObject

noncomputable instance : HasShift (PeriodicHomotopyCategory C n) ℤ :=
  (periodicHomotopyTriangulation C n).hasShift

noncomputable instance (m : ℤ) : (shiftFunctor (PeriodicHomotopyCategory C n) m).Additive :=
  (periodicHomotopyTriangulation C n).shift_additive m

noncomputable instance : Pretriangulated (PeriodicHomotopyCategory C n) :=
  (periodicHomotopyTriangulation C n).pretriangulated

noncomputable instance : IsTriangulated (PeriodicHomotopyCategory C n) :=
  (periodicHomotopyTriangulation C n).triangulated

/-- The homotopy-category shift is the cyclic shift on representatives. -/
noncomputable def periodicHomotopyShiftIso :
    periodicHomotopyQuotient C n ⋙ shiftFunctor (PeriodicHomotopyCategory C n) (1 : ℤ) ≅
      PeriodicComplex.cyclicShiftFunctor ⋙ periodicHomotopyQuotient C n := sorry

/-- The cone triangle `X → Y → cone f → X⟦1⟧` is distinguished. -/
theorem periodicHomotopy_cone_distinguished {X Y : PeriodicComplex C n} (f : X ⟶ Y) :
    ∃ T : Triangle (PeriodicHomotopyCategory C n),
      T ∈ distTriang (PeriodicHomotopyCategory C n) ∧
      T.obj₁ = (periodicHomotopyQuotient C n).obj X ∧
      T.obj₂ = (periodicHomotopyQuotient C n).obj Y ∧
      T.obj₃ = (periodicHomotopyQuotient C n).obj (PeriodicComplex.mappingCone f) := sorry

/-- The Frobenius description: with the componentwise split exact structure, `Kₙ(C)` is the stable
category of periodic complexes, and the two triangulations agree. -/
theorem periodicHomotopy_stable_comparison :
    ∃ (E : ExactStructure (PeriodicComplex C n)) (H : FrobeniusExactData E)
      (F : FrobeniusComparison.StableCategory E ⥤ PeriodicHomotopyCategory C n),
      F.IsEquivalence := sorry

end PeriodicHomotopyTriangulation

/-- Exact acyclicity for a periodic complex uses actual Quillen conflations in every residue
class, with the differential factored through successive cycle objects. -/
structure PeriodicExactAcyclicWitness {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) {n : ℕ} [NeZero n] (X : PeriodicComplex C n) where
  cycles : ZMod n → C
  inclusion : ∀ i, cycles i ⟶ X.X i
  projection : ∀ i, X.X i ⟶ cycles (i + 1)
  conflation : ∀ i, E.Conflation (inclusion i) (projection i)
  differential : ∀ i, X.d i = projection i ≫ inclusion (i + 1)

/-- Periodic exact acyclicity is existence of the displayed cycle/conflation data. -/
def PeriodicExactAcyclic {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) {n : ℕ} [NeZero n] (X : PeriodicComplex C n) : Prop :=
  Nonempty (PeriodicExactAcyclicWitness E X)

/-- Periodic quasi-isomorphisms are exactly maps with exact-acyclic periodic cone. -/
noncomputable def periodicQuasiIso {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) (n : ℕ) [NeZero n] : MorphismProperty (PeriodicComplex C n) :=
  fun _ _ f ↦ PeriodicExactAcyclic E (PeriodicComplex.mappingCone f)

/-- The constructed `n`-periodic derived category, as the localization at quasi-isomorphisms. -/
abbrev PeriodicDerived {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) (n : ℕ) [NeZero n] := (periodicQuasiIso E n).Localization

/-- Its localization functor. -/
noncomputable abbrev periodicDerivedQ {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) (n : ℕ) [NeZero n] :
    PeriodicComplex C n ⥤ PeriodicDerived E n :=
  (periodicQuasiIso E n).Q

section PeriodicDerivedTriangulation

variable {C : Type u} [Category.{v} C] [Preadditive C]
  [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
  (E : ExactStructure C) (n : ℕ) [NeZero n]

/-- The isomorphism-closed acyclic objects of `Kₙ(C)`, represented by exact-acyclic periodic
complexes. -/
def periodicAcyclicProperty : ObjectProperty (PeriodicHomotopyCategory C n) :=
  fun X ↦ ∃ K : PeriodicComplex C n,
    PeriodicExactAcyclic E K ∧ Nonempty ((periodicHomotopyQuotient C n).obj K ≅ X)

/-- Acyclic periodic complexes form a triangulated subcategory of `Kₙ(C)`. -/
noncomputable instance periodicAcyclicProperty_isTriangulated :
    (periodicAcyclicProperty E n).IsTriangulated := sorry

/-- The second description of `Dₙ(C)`: the Verdier quotient `Kₙ(C)/Acₙ(C)`. -/
abbrev PeriodicVerdierDerived := (periodicAcyclicProperty E n).trW.Localization

/-- The Verdier localization functor `Kₙ(C) → Kₙ(C)/Acₙ(C)`. -/
noncomputable abbrev periodicVerdierQ : PeriodicHomotopyCategory C n ⥤ PeriodicVerdierDerived E n :=
  (periodicAcyclicProperty E n).trW.Q

/-- The comparison from the quasi-isomorphism localization to the Verdier quotient, induced by
the universal property of the former applied to `Kₙ(C) → Kₙ(C)/Acₙ(C)` precomposed with the
homotopy quotient. -/
noncomputable def periodicDerivedComparison : PeriodicDerived E n ⥤ PeriodicVerdierDerived E n :=
  sorry

/-- The two universal descriptions of `Dₙ(C)` agree. -/
theorem periodicDerivedComparison_isEquivalence :
    (periodicDerivedComparison E n).IsEquivalence := sorry

/-- The comparison commutes with the two localization functors. -/
noncomputable def periodicDerivedComparison_fac :
    periodicDerivedQ E n ⋙ periodicDerivedComparison E n ≅
      periodicHomotopyQuotient C n ⋙ periodicVerdierQ E n := sorry

/-- The triangulation of `Dₙ(C)`, transported from the Verdier quotient. -/
noncomputable def periodicDerivedTriangulation : TriangulatedStructure (PeriodicDerived E n) :=
  sorry

noncomputable instance : Preadditive (PeriodicDerived E n) :=
  (periodicDerivedTriangulation E n).preadditive

noncomputable instance : CategoryTheory.Limits.HasZeroObject (PeriodicDerived E n) :=
  (periodicDerivedTriangulation E n).hasZeroObject

noncomputable instance : HasShift (PeriodicDerived E n) ℤ :=
  (periodicDerivedTriangulation E n).hasShift

noncomputable instance (m : ℤ) : (shiftFunctor (PeriodicDerived E n) m).Additive :=
  (periodicDerivedTriangulation E n).shift_additive m

noncomputable instance : Pretriangulated (PeriodicDerived E n) :=
  (periodicDerivedTriangulation E n).pretriangulated

noncomputable instance : IsTriangulated (PeriodicDerived E n) :=
  (periodicDerivedTriangulation E n).triangulated

/-- The comparison is a triangle functor. -/
theorem periodicDerivedComparison_commShift :
    Nonempty ((periodicDerivedComparison E n).CommShift ℤ) := sorry

end PeriodicDerivedTriangulation

/-! ## Layer 4: compression, the shift-orbit category, and Stai's triangulated hull -/

/-- Folding a bounded complex into its residue classes modulo `n`. -/
noncomputable def compressBoundedComplex {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (n : ℕ) [NeZero n] : BoundedCochainComplex C ⥤ PeriodicComplex C n := sorry

/-- Compression descends through the two explicit localizations. This is the canonical functor
`Dᵇ(E) → Dₙ(E)`, not a functor supplied as an argument to Stai's theorem. -/
noncomputable def derivedCompression {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) (n : ℕ) [NeZero n] :
    ExactBoundedDerived E ⥤ PeriodicDerived E n := sorry

/-- The descended compression is characterized by the concrete folding functor and the two
canonical localization functors. -/
noncomputable def derivedCompression_fac {C : Type u} [Category.{v} C] [Preadditive C]
    [CategoryTheory.Limits.HasZeroObject C] [CategoryTheory.Limits.HasBinaryBiproducts C]
    (E : ExactStructure C) (n : ℕ) [NeZero n] :
    exactDerivedQ E ⋙ derivedCompression E n ≅
      compressBoundedComplex n ⋙ periodicDerivedQ E n := sorry

/-- The orbit category `D/⟦n⟧` of a preadditive category with an additive `ℤ`-shift, in the
form used by Keller and Stai. Its objects are those of `D`, and its hom groups are the direct
sums `⨁_{j ∈ ℤ} Hom_D(X, Y⟦n j⟧)`; the wrapper keeps the orbit category and `D` from being
confused by instance resolution. -/
structure ShiftOrbit (D : Type u) [Category.{v} D] (n : ℤ) where
  /-- The underlying object of `D`. -/
  obj : D

namespace ShiftOrbit

variable {D : Type u} [Category.{v} D] [Preadditive D] [HasShift D ℤ]
  [∀ m : ℤ, (shiftFunctor D m).Additive] {n : ℤ}

/-- The homogeneous piece of degree `i` of an orbit hom group. -/
abbrev HomPiece (X Y : ShiftOrbit D n) (i : ℤ) : Type v := X.obj ⟶ Y.obj⟦n * i⟧

/-- Composition of homogeneous pieces: `f : X ⟶ Y⟦n i⟧` followed by `g : Y ⟶ Z⟦n j⟧` is
`f ≫ g⟦n i⟧'`, then the coherence isomorphism `Z⟦n j⟧⟦n i⟧ ≅ Z⟦n (i + j)⟧`. -/
def homogeneousComp {X Y Z : ShiftOrbit D n} {i j : ℤ}
    (f : HomPiece X Y i) (g : HomPiece Y Z j) : HomPiece X Z (i + j) :=
  f ≫ g⟦n * i⟧' ≫ (shiftFunctorAdd' D (n * j) (n * i) (n * (i + j)) (by ring)).inv.app Z.obj

/-- Homogeneous composition is additive in the second variable. -/
def homogeneousCompRight {X Y Z : ShiftOrbit D n} {i j : ℤ} (f : HomPiece X Y i) :
    HomPiece Y Z j →+ HomPiece X Z (i + j) :=
  AddMonoidHom.mk' (fun g ↦ homogeneousComp f g) (by
    intro g g'
    simp [homogeneousComp, Functor.map_add, Preadditive.add_comp, Preadditive.comp_add])

omit [∀ m : ℤ, (shiftFunctor D m).Additive] in
/-- Homogeneous composition is additive in the first variable. -/
theorem homogeneousComp_add_left {X Y Z : ShiftOrbit D n} {i j : ℤ}
    (f f' : HomPiece X Y i) (g : HomPiece Y Z j) :
    homogeneousComp (f + f') g = homogeneousComp f g + homogeneousComp f' g := by
  simp [homogeneousComp, Preadditive.add_comp]

/-- The orbit hom group, as the direct sum of its homogeneous pieces. -/
abbrev OrbitHom (X Y : ShiftOrbit D n) : Type v := DirectSum ℤ (fun i ↦ HomPiece X Y i)

/-- The bilinear extension of homogeneous composition to the direct sums. -/
noncomputable def comp {X Y Z : ShiftOrbit D n} (f : OrbitHom X Y) (g : OrbitHom Y Z) :
    OrbitHom X Z :=
  DirectSum.toAddMonoid (fun i ↦ AddMonoidHom.mk'
    (fun fi : HomPiece X Y i ↦ DirectSum.toAddMonoid (fun j ↦
      (DirectSum.of (fun k ↦ HomPiece X Z k) (i + j)).comp (homogeneousCompRight fi)) g)
    (by
      intro fi fi'
      induction g using DirectSum.induction_on with
      | zero => simp
      | of j x =>
          simp only [DirectSum.toAddMonoid_of, AddMonoidHom.comp_apply]
          change DirectSum.of _ (i + j) (homogeneousComp (fi + fi') x) = _
          rw [homogeneousComp_add_left, map_add]
          rfl
      | add g₁ g₂ h₁ h₂ =>
          simp only [map_add, h₁, h₂]
          abel)) f

/-- The identity of `X` is `𝟙 X` placed in degree zero. -/
noncomputable def id (X : ShiftOrbit D n) : OrbitHom X X :=
  DirectSum.of (fun i ↦ HomPiece X X i) 0
    ((shiftFunctorZero' D (n * 0) (by simp)).inv.app X.obj)

/-- The orbit category. The hom formula `Hom(X, Y) = ⨁_j Hom_D(X, Y⟦n j⟧)` and the composition
of homogeneous pieces are definitional; the category laws are the proof obligations. -/
noncomputable instance : Category.{v} (ShiftOrbit D n) where
  Hom := OrbitHom
  id := id
  comp := comp
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The hom groups are literally the displayed direct sums. -/
theorem hom_eq (X Y : ShiftOrbit D n) :
    (X ⟶ Y) = DirectSum ℤ (fun i ↦ (X.obj ⟶ Y.obj⟦n * i⟧)) := rfl

/-- Composition of homogeneous pieces lands in the summed degree. -/
theorem of_comp_of {X Y Z : ShiftOrbit D n} {i j : ℤ} (f : HomPiece X Y i) (g : HomPiece Y Z j) :
    (DirectSum.of (fun k ↦ HomPiece X Y k) i f ≫ DirectSum.of (fun k ↦ HomPiece Y Z k) j g :
      X ⟶ Z) =
      DirectSum.of (fun k ↦ HomPiece X Z k) (i + j) (homogeneousComp f g) := by
  change comp _ _ = _
  simp only [comp, DirectSum.toAddMonoid_of, AddMonoidHom.comp_apply]
  rfl

/-- The orbit category is preadditive with the direct-sum addition on homs. -/
noncomputable instance : Preadditive (ShiftOrbit D n) where
  homGroup X Y := inferInstanceAs (AddCommGroup (OrbitHom X Y))
  add_comp := sorry
  comp_add := sorry

/-- The projection `D ⥤ D/⟦n⟧`: identity on objects, degree-zero inclusion on morphisms. -/
noncomputable def projection : D ⥤ ShiftOrbit D n where
  obj X := ⟨X⟩
  map {X Y} f := DirectSum.of (fun i ↦ HomPiece (⟨X⟩ : ShiftOrbit D n) ⟨Y⟩ i) 0
    (f ≫ (shiftFunctorZero' D (n * 0) (by simp)).inv.app Y)
  map_id := sorry
  map_comp := sorry

noncomputable instance projection_additive : (projection (D := D) (n := n)).Additive := sorry

/-- `X⟦n⟧` and `X` become isomorphic in the orbit category through the degree `1` and degree `-1`
identity pieces. -/
noncomputable def periodicityIso (X : D) :
    (projection (n := n)).obj (X⟦n⟧) ≅ (projection (n := n)).obj X where
  hom := DirectSum.of (fun i ↦ HomPiece (⟨X⟦n⟧⟩ : ShiftOrbit D n) ⟨X⟩ i) 1
    (eqToHom (by rw [mul_one]))
  inv := DirectSum.of (fun i ↦ HomPiece (⟨X⟩ : ShiftOrbit D n) ⟨X⟦n⟧⟩ i) (-1)
    ((shiftFunctorZero D ℤ).inv.app X ≫
      (shiftFunctorAdd' D n (n * (-1)) 0 (by ring)).hom.app X)
  hom_inv_id := sorry
  inv_hom_id := sorry

/-- The projection is `n`-periodic. -/
noncomputable def periodicity :
    shiftFunctor D n ⋙ projection (n := n) ≅ projection (n := n) :=
  NatIso.ofComponents periodicityIso sorry

section UniversalProperty

variable {E : Type w} [Category.{w} E] [Preadditive E]

/-- The universal property: an additive functor `G : D ⥤ E` with a periodicity isomorphism
`G ∘ ⟦n⟧ ≅ G` descends to the orbit category by summing the images of the homogeneous pieces. -/
noncomputable def desc (G : D ⥤ E) [G.Additive] (φ : shiftFunctor D n ⋙ G ≅ G) :
    ShiftOrbit D n ⥤ E := sorry

noncomputable instance desc_additive (G : D ⥤ E) [G.Additive]
    (φ : shiftFunctor D n ⋙ G ≅ G) : (desc G φ).Additive := sorry

/-- The descended functor restricts to `G` along the projection. -/
noncomputable def descFac (G : D ⥤ E) [G.Additive] (φ : shiftFunctor D n ⋙ G ≅ G) :
    projection ⋙ desc G φ ≅ G := sorry

/-- The factorization carries the periodicity isomorphism of the projection to `φ`. -/
theorem descFac_periodicity (G : D ⥤ E) [G.Additive] (φ : shiftFunctor D n ⋙ G ≅ G) (X : D) :
    (descFac G φ).hom.app (X⟦n⟧) ≫ φ.hom.app X =
      (desc G φ).map (periodicityIso X).hom ≫ (descFac G φ).hom.app X := sorry

/-- Uniqueness: any additive functor out of the orbit category restricting to `G` compatibly with
the periodicity isomorphisms is isomorphic to the descended functor. -/
theorem desc_unique (G : D ⥤ E) [G.Additive] (φ : shiftFunctor D n ⋙ G ≅ G)
    (G' : ShiftOrbit D n ⥤ E) [G'.Additive] (e : projection ⋙ G' ≅ G)
    (he : ∀ X : D, e.hom.app (X⟦n⟧) ≫ φ.hom.app X =
      G'.map (periodicityIso X).hom ≫ e.hom.app X) :
    Nonempty (G' ≅ desc G φ) := sorry

end UniversalProperty

end ShiftOrbit

/-- Finite-dimensional right modules over a finite-dimensional `k`-algebra. We represent these
as finitely generated right `Λ`-modules; finite-dimensionality of `Λ/k` makes this precisely the
usual `mod-Λ` category, while keeping restriction of scalars out of the object representation. -/
abbrev FiniteDimensionalRightModule (k Λ : Type u) [Field k] [Ring Λ] [Algebra k Λ]
    [FiniteDimensional k Λ] :=
  FrobeniusComparison.FinitelyGeneratedRightModule Λ

/-- The inherited abelian exact structure on `mod-Λ`. -/
noncomputable def finiteDimensionalModuleExactStructure
    (k Λ : Type u) [Field k] [Ring Λ] [Algebra k Λ] [FiniteDimensional k Λ] :
    ExactStructure (FiniteDimensionalRightModule k Λ) := sorry

/-- The derived triangulation on the explicit localization defining `Dᵇ(mod-Λ)`. -/
noncomputable def finiteDimensionalDerivedTriangulation
    (k Λ : Type u) [Field k] [Ring Λ] [Algebra k Λ] [FiniteDimensional k Λ] :
    ExactDerivedTriangulation (finiteDimensionalModuleExactStructure k Λ) := sorry

section StaiHull

variable (k Λ : Type u) [Field k] [Ring Λ] [Algebra k Λ] [FiniteDimensional k Λ]

/-- `Dᵇ(mod-Λ)` with its constructed triangulation installed as instances. -/
abbrev BoundedDerivedFiniteModule :=
  ExactBoundedDerived (finiteDimensionalModuleExactStructure k Λ)

noncomputable instance : Preadditive (BoundedDerivedFiniteModule k Λ) :=
  (finiteDimensionalDerivedTriangulation k Λ).preadditive

noncomputable instance :
    CategoryTheory.Limits.HasZeroObject (BoundedDerivedFiniteModule k Λ) :=
  (finiteDimensionalDerivedTriangulation k Λ).hasZeroObject

noncomputable instance : HasShift (BoundedDerivedFiniteModule k Λ) ℤ :=
  (finiteDimensionalDerivedTriangulation k Λ).hasShift

noncomputable instance (m : ℤ) : (shiftFunctor (BoundedDerivedFiniteModule k Λ) m).Additive :=
  (finiteDimensionalDerivedTriangulation k Λ).shift_additive m

noncomputable instance : Pretriangulated (BoundedDerivedFiniteModule k Λ) :=
  (finiteDimensionalDerivedTriangulation k Λ).pretriangulated

noncomputable instance : IsTriangulated (BoundedDerivedFiniteModule k Λ) :=
  (finiteDimensionalDerivedTriangulation k Λ).triangulated

/-- Finite global dimension of `Λ`, as a uniform projective-dimension bound on all right
modules in the ring's universe. -/
def HasFiniteGlobalDimension (d : ℕ) : Prop :=
  ∀ M : ModuleCat.{u} Λᵐᵒᵖ, HasProjectiveDimensionLE M d

variable (n : ℕ) [NeZero n]

/-- Stai's orbit category `Dᵇ(mod-Λ)/[n]` is the concrete shift-orbit category of the explicit
bounded derived category. -/
abbrev StaiOrbitCategory := ShiftOrbit (BoundedDerivedFiniteModule k Λ) (n : ℤ)

/-- The periodic derived category `Dₙ(mod-Λ)`. -/
abbrev PeriodicDerivedFiniteModule :=
  PeriodicDerived (finiteDimensionalModuleExactStructure k Λ) n

noncomputable instance derivedCompression_additive :
    (derivedCompression (finiteDimensionalModuleExactStructure k Λ) n).Additive := sorry

/-- Compression is `n`-periodic: folding `X⟦n⟧` gives the same periodic object as folding `X`. -/
noncomputable def derivedCompressionPeriodicity :
    shiftFunctor (BoundedDerivedFiniteModule k Λ) (n : ℤ) ⋙
      derivedCompression (finiteDimensionalModuleExactStructure k Λ) n ≅
      derivedCompression (finiteDimensionalModuleExactStructure k Λ) n := sorry

/-- The functor `Dᵇ(mod-Λ)/[n] → Dₙ(mod-Λ)` of Stai §3, obtained from compression by the
universal property of the orbit category. -/
noncomputable def staiCompression : StaiOrbitCategory k Λ n ⥤ PeriodicDerivedFiniteModule k Λ n :=
  ShiftOrbit.desc (derivedCompression (finiteDimensionalModuleExactStructure k Λ) n)
    (derivedCompressionPeriodicity k Λ n)

/-- The orbit functor restricts to compression along the projection. -/
noncomputable def staiCompression_fac :
    ShiftOrbit.projection ⋙ staiCompression k Λ n ≅
      derivedCompression (finiteDimensionalModuleExactStructure k Λ) n :=
  ShiftOrbit.descFac _ _

/-- Stai Lemma 3.12: the orbit-to-periodic functor is fully faithful when `Λ` has finite global
dimension. The hypothesis is visible; without it full faithfulness fails. -/
theorem staiCompression_full_faithful {d : ℕ} (hΛ : HasFiniteGlobalDimension Λ d) :
    (staiCompression k Λ n).Full ∧ (staiCompression k Λ n).Faithful := sorry

/-- Gradable periodic objects are the essential image of the orbit functor. -/
abbrev IsStaiGradable : ObjectProperty (PeriodicDerivedFiniteModule k Λ n) :=
  (staiCompression k Λ n).essImage

/-- Stai Theorem 4.3, the generation half: under finite global dimension, the triangulated
subcategory of `Dₙ(mod-Λ)` generated by the gradable objects (shifts, cones, retracts) is
everything. Together with full faithfulness this says that `Dₙ(mod-Λ)` is the triangulated hull
of the orbit category: the orbit category embeds, and the embedding generates. -/
theorem staiCompression_essImage_triangEnvelope_eq_top {d : ℕ}
    (hΛ : HasFiniteGlobalDimension Λ d) :
    (IsStaiGradable k Λ n).triangEnvelope = ⊤ := sorry

/-- Periodic complexes of finitely generated projectives, as a full subcategory of `Kₙ(mod-Λ)`. -/
def periodicProjectiveProperty :
    ObjectProperty (PeriodicHomotopyCategory (FiniteDimensionalRightModule k Λ) n) :=
  fun X ↦ ∃ P : PeriodicComplex (FiniteDimensionalRightModule k Λ) n,
    (∀ i, Projective (P.X i)) ∧
      Nonempty ((periodicHomotopyQuotient (FiniteDimensionalRightModule k Λ) n).obj P ≅ X)

/-- `Kₙ(proj-Λ)`. -/
abbrev PeriodicProjectiveHomotopyCategory := (periodicProjectiveProperty k Λ n).FullSubcategory

/-- The canonical functor `Kₙ(proj-Λ) → Dₙ(mod-Λ)`, restricting the Verdier localization and the
comparison of the two descriptions of `Dₙ`. -/
noncomputable def periodicProjectiveToDerived :
    PeriodicProjectiveHomotopyCategory k Λ n ⥤ PeriodicDerivedFiniteModule k Λ n := sorry

/-- `Dₙ(mod-Λ) ≃ Kₙ(proj-Λ)` under finite global dimension (Stai Proposition 3.10 and the
periodic version of the projective-resolution equivalence). -/
theorem periodicProjectiveToDerived_isEquivalence {d : ℕ} (hΛ : HasFiniteGlobalDimension Λ d) :
    (periodicProjectiveToDerived k Λ n).IsEquivalence := sorry

end StaiHull

/-- A `ℤ/2`-graded duplex of curvature `w`. This bounded prototype is the commutative,
central-potential specialization: at `w = 0` it is a genuine two-periodic complex; at nonzero
`w` it is curved and has no homology object in general. -/
structure CurvedDuplex (R M₀ M₁ : Type*) [CommRing R]
    [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁] (w : R) where
  dEven : M₀ →ₗ[R] M₁
  dOdd : M₁ →ₗ[R] M₀
  odd_even : dOdd.comp dEven = w • LinearMap.id
  even_odd : dEven.comp dOdd = w • LinearMap.id

/-- The curvature-zero specialization, with both composites literally zero. -/
abbrev TwoPeriodicComplex (R M₀ M₁ : Type*) [CommRing R]
    [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁] :=
  CurvedDuplex R M₀ M₁ 0

namespace CurvedDuplex

variable {R : Type*} [CommRing R]
variable {M₀ M₁ N₀ N₁ P₀ P₁ : Type*}
variable [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁]
variable [AddCommGroup N₀] [Module R N₀] [AddCommGroup N₁] [Module R N₁]
variable [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]
variable {w : R} (M : CurvedDuplex R M₀ M₁ w) (N : CurvedDuplex R N₀ N₁ w)

/-- An even closed morphism of duplexes. -/
structure Hom where
  even : M₀ →ₗ[R] N₀
  odd : M₁ →ₗ[R] N₁
  comm_even : N.dEven.comp even = odd.comp M.dEven
  comm_odd : N.dOdd.comp odd = even.comp M.dOdd

/-- An odd homotopy from a duplex to another duplex. -/
structure Homotopy (M : CurvedDuplex R M₀ M₁ w) (N : CurvedDuplex R N₀ N₁ w) where
  evenToOdd : M₀ →ₗ[R] N₁
  oddToEven : M₁ →ₗ[R] N₀

/-- The boundary `d_N h + h d_M` of an odd homotopy, component by component. -/
def Homotopy.boundary (h : Homotopy M N) : Hom M N where
  even := N.dOdd.comp h.evenToOdd + h.oddToEven.comp M.dEven
  odd := N.dEven.comp h.oddToEven + h.evenToOdd.comp M.dOdd
  comm_even := by
    ext x
    simp only [LinearMap.comp_apply, LinearMap.add_apply, map_add]
    have hM₀ := LinearMap.congr_fun M.odd_even x
    have hN₁ := LinearMap.congr_fun N.even_odd (h.evenToOdd x)
    simp only [LinearMap.comp_apply, LinearMap.smul_apply, LinearMap.id_apply] at hM₀ hN₁
    rw [hM₀, hN₁]
    simp only [map_smul]
    abel
  comm_odd := by
    ext x
    simp only [LinearMap.comp_apply, LinearMap.add_apply, map_add]
    have hM₁ := LinearMap.congr_fun M.even_odd x
    have hN₀ := LinearMap.congr_fun N.odd_even (h.oddToEven x)
    simp only [LinearMap.comp_apply, LinearMap.smul_apply, LinearMap.id_apply] at hM₁ hN₀
    rw [hM₁, hN₀]
    simp only [map_smul]
    abel

/-- Null-homotopy is an actual factorization through the boundary map, not a placeholder
proposition. -/
def Hom.IsNullHomotopic (f : Hom M N) : Prop :=
  ∃ h : Homotopy M N, h.boundary = f

/-- The parity shift swaps the two modules and negates both differentials. -/
def shift : CurvedDuplex R M₁ M₀ w where
  dEven := -M.dOdd
  dOdd := -M.dEven
  odd_even := by simpa using M.even_odd
  even_odd := by simpa using M.odd_even

/-- Mapping cones stay at the same curvature. The off-diagonal signs are fixed by the
cohomological shift convention. -/
noncomputable def cone (f : Hom M N) : CurvedDuplex R (N₀ × M₁) (N₁ × M₀) w := sorry

end CurvedDuplex

/-! ## Layer 5: right curved DG algebras and modules -/

/-- Curvature data on a genuinely internally graded `k`-algebra. The grading is the
`InternalGrading` supplied by the DG/A-infinity prerequisite, with unit and multiplication laws
recorded here because the total carrier `A` alone does not remember a graded algebra. -/
structure RightCurvedDGAlgebra (k A : Type*) [CommRing k] [Ring A] [Algebra k A] where
  grading : InternalGrading k A
  one_degree : grading.IsHomogeneous 0 1
  mul_degree : ∀ p q a b, grading.IsHomogeneous p a → grading.IsHomogeneous q b →
    grading.IsHomogeneous (p + q) (a * b)
  d : A →ₗ[k] A
  curvature : A
  d_degree : LinearHasDegree grading grading 1 d
  curvature_degree : grading.IsHomogeneous 2 curvature
  leibniz : ∀ p q a b, grading.IsHomogeneous p a → grading.IsHomogeneous q b →
    d (a * b) = d a * b + (((p.negOnePow : ℤ) : k) • (a * d b))
  d_sq : ∀ a, d (d a) = a * curvature - curvature * a
  d_curvature : d curvature = 0

namespace RightCurvedDGAlgebra

variable {k A M : Type*} [CommRing k] [Ring A] [Algebra k A]
variable [AddCommGroup M] [Module k M] [Module Aᵐᵒᵖ M]
variable [IsScalarTower k Aᵐᵒᵖ M] [SMulCommClass k Aᵐᵒᵖ M]

/-- A right curved DG module for the right-curvature convention. Its square is right
multiplication by `w`; the exponent in its Leibniz sign is the degree of the module element. Its
genuine internal grading and action-degree law exclude a vacuous homogeneous predicate. The
scalar-tower and commuting-action instances make the `k`- and `Aᵐᵒᵖ`-actions compatible. -/
structure RightModule (B : RightCurvedDGAlgebra k A) where
  grading : InternalGrading k M
  action_degree : ∀ p q a m, B.grading.IsHomogeneous p a → grading.IsHomogeneous q m →
    grading.IsHomogeneous (q + p) (MulOpposite.op a • m)
  d : M →ₗ[k] M
  d_degree : LinearHasDegree grading grading 1 d
  leibniz : ∀ p q m a, grading.IsHomogeneous q m → B.grading.IsHomogeneous p a →
    d (MulOpposite.op a • m) =
      MulOpposite.op a • d m + (((q.negOnePow : ℤ) : k) • (MulOpposite.op (B.d a) • m))
  d_sq : ∀ m, d (d m) = MulOpposite.op B.curvature • m

/-- Under the pinned graded-opposite multiplication, the same differential has right curvature
`-op(w)`. This definition fixes the sign independently of a later bundled graded-opposite ring. -/
def oppositeCurvature (B : RightCurvedDGAlgebra k A) : Aᵐᵒᵖ :=
  -MulOpposite.op B.curvature

/-- The genuine degree-zero subring cut out by the internal grading. The multiplication field
uses the graded multiplication law rather than assuming that an arbitrary degree predicate is
closed under products. -/
def degreeZeroSubring (B : RightCurvedDGAlgebra k A) : Subring A where
  carrier := B.grading.piece 0
  zero_mem' := (B.grading.piece 0).zero_mem
  add_mem' := (B.grading.piece 0).add_mem
  one_mem' := B.one_degree
  mul_mem' := by
    intro a b ha hb
    change B.grading.IsHomogeneous 0 (a * b)
    simpa using B.mul_degree 0 0 a b ha hb
  neg_mem' := (B.grading.piece 0).neg_mem

end RightCurvedDGAlgebra

/-! ## Layer 6: curved modules, their homotopy category, and derived categories of the second kind

The second-kind derived categories are *constructed*: the curved homotopy category is a concrete
quotient of a concrete category of bundled curved modules, the three acyclic classes are the
closures generated inside it by totalizations of short exact sequences, the three derived
categories are the Verdier quotients by those closures, and the comparison functors are induced
by the inclusions of the classes. Nothing in this layer takes a category, a localization functor,
or a set of acyclic objects as a parameter. -/

namespace RightCurvedDGAlgebra

variable {k : Type u} {A : Type v} [CommRing k] [Ring A] [Algebra k A]
  (B : RightCurvedDGAlgebra k A)

/-- A bundled right curved DG module over `B`, with carrier in the universe `wc`. -/
structure ModuleObj.{wc} where
  /-- The underlying `k`-module. -/
  carrier : Type wc
  [addCommGroup : AddCommGroup carrier]
  [moduleK : Module k carrier]
  [moduleOp : Module Aᵐᵒᵖ carrier]
  [scalarTower : IsScalarTower k Aᵐᵒᵖ carrier]
  [smulComm : SMulCommClass k Aᵐᵒᵖ carrier]
  /-- The curved module structure: internal grading, action degrees, and differential. -/
  str : RightModule (M := carrier) B

attribute [instance] ModuleObj.addCommGroup ModuleObj.moduleK ModuleObj.moduleOp
  ModuleObj.scalarTower ModuleObj.smulComm

namespace ModuleObj

variable {B}

/-- A closed degree-zero morphism of curved modules: `k`-linear, right `A`-linear, of degree zero,
and commuting with the differentials. -/
@[ext]
structure Hom (M N : B.ModuleObj) where
  toLinearMap : M.carrier →ₗ[k] N.carrier
  map_op_smul : ∀ (a : A) (m : M.carrier),
    toLinearMap (MulOpposite.op a • m) = MulOpposite.op a • toLinearMap m
  degree_zero : LinearHasDegree M.str.grading N.str.grading 0 toLinearMap
  comm_d : toLinearMap.comp M.str.d = N.str.d.comp toLinearMap

/-- The closed degree-zero category of curved modules. -/
noncomputable instance : Category B.ModuleObj where
  Hom := Hom
  id M :=
    { toLinearMap := LinearMap.id
      map_op_smul := fun _ _ ↦ rfl
      degree_zero := fun p x hx ↦ by simpa using hx
      comm_d := by simp }
  comp f g :=
    { toLinearMap := g.toLinearMap.comp f.toLinearMap
      map_op_smul := fun a m ↦ by simp [f.map_op_smul, g.map_op_smul]
      degree_zero := fun p x hx ↦ by simpa using g.degree_zero _ _ (f.degree_zero p x hx)
      comm_d := by
        rw [LinearMap.comp_assoc, f.comm_d, ← LinearMap.comp_assoc, g.comm_d,
          LinearMap.comp_assoc] }
  id_comp f := by ext; rfl
  comp_id f := by ext; rfl
  assoc f g h := by ext; rfl

/-- An odd homotopy: a right-linear map of degree `-1`. Right-linear maps of odd degree carry no
Koszul sign, since the algebra acts on the other side. -/
structure Homotopy (M N : B.ModuleObj) where
  h : M.carrier →ₗ[k] N.carrier
  map_op_smul : ∀ (a : A) (m : M.carrier), h (MulOpposite.op a • m) = MulOpposite.op a • h m
  degree : LinearHasDegree M.str.grading N.str.grading (-1) h

/-- The boundary `d_N h + h d_M` of an odd homotopy. -/
def Homotopy.boundary {M N : B.ModuleObj} (H : Homotopy M N) : M.carrier →ₗ[k] N.carrier :=
  N.str.d.comp H.h + H.h.comp M.str.d

/-- The boundary of a homotopy is a closed degree-zero morphism. Commutation with the
differentials uses that `M` and `N` have the *same* curvature: `d_N² h = h d_M²` because both are
right multiplication by `w`. -/
noncomputable def Homotopy.boundaryHom {M N : B.ModuleObj} (H : Homotopy M N) : M ⟶ N where
  toLinearMap := H.boundary
  map_op_smul := sorry
  degree_zero := sorry
  comm_d := sorry

/-- A morphism is null-homotopic when it is the boundary of an odd homotopy. -/
def IsNullHomotopic {M N : B.ModuleObj} (f : M ⟶ N) : Prop :=
  ∃ H : Homotopy M N, H.boundary = f.toLinearMap

end ModuleObj

/-- Two morphisms are homotopic when their difference is a boundary. -/
def homotopyRel : HomRel B.ModuleObj :=
  fun {_ _} f g ↦ ∃ H : ModuleObj.Homotopy _ _, H.boundary = f.toLinearMap - g.toLinearMap

noncomputable instance homotopyCongruence : Congruence B.homotopyRel := sorry

/-- The curved homotopy category: closed degree-zero maps modulo boundaries. -/
abbrev HomotopyCategory := CategoryTheory.Quotient B.homotopyRel

/-- The homotopy quotient functor. -/
noncomputable abbrev homotopyQuotient : B.ModuleObj ⥤ B.HomotopyCategory :=
  CategoryTheory.Quotient.functor _

/-- The triangulation of the curved homotopy category by shifts and cones, even though its
objects have no homology. -/
noncomputable def homotopyTriangulation : TriangulatedStructure B.HomotopyCategory := sorry

noncomputable instance : Preadditive B.HomotopyCategory :=
  B.homotopyTriangulation.preadditive

noncomputable instance : CategoryTheory.Limits.HasZeroObject B.HomotopyCategory :=
  B.homotopyTriangulation.hasZeroObject

noncomputable instance : HasShift B.HomotopyCategory ℤ :=
  B.homotopyTriangulation.hasShift

noncomputable instance (m : ℤ) : (shiftFunctor B.HomotopyCategory m).Additive :=
  B.homotopyTriangulation.shift_additive m

noncomputable instance : Pretriangulated B.HomotopyCategory :=
  B.homotopyTriangulation.pretriangulated

noncomputable instance : IsTriangulated B.HomotopyCategory :=
  B.homotopyTriangulation.triangulated

/-- The homotopy category inherits the small coproducts and products of graded modules. -/
noncomputable instance :
    CategoryTheory.Limits.HasCoproducts.{max u w} (ModuleObj.{u, v, w} B) := sorry

noncomputable instance :
    CategoryTheory.Limits.HasProducts.{max u w} (ModuleObj.{u, v, w} B) := sorry

noncomputable instance :
    CategoryTheory.Limits.HasCoproducts.{max u w} (HomotopyCategory.{u, v, w} B) := sorry

noncomputable instance :
    CategoryTheory.Limits.HasProducts.{max u w} (HomotopyCategory.{u, v, w} B) := sorry

/-- A short exact sequence of curved modules: closed morphisms whose underlying linear maps form
a short exact sequence. -/
structure ShortExact (L M N : B.ModuleObj) where
  i : L ⟶ M
  p : M ⟶ N
  injective : Function.Injective i.toLinearMap
  surjective : Function.Surjective p.toLinearMap
  exact : Function.Exact i.toLinearMap p.toLinearMap

/-- The total curved module of a short exact sequence: the direct sum `L ⊕ M ⊕ N` with the
differential twisted by `i` and `p`, in Positselski's sign convention transported to right
modules. -/
noncomputable def ShortExact.totalization {L M N : ModuleObj.{u, v, w} B}
    (S : B.ShortExact L M N) : ModuleObj.{u, v, w} B := sorry

/-- The objects of the homotopy category represented by totalizations of short exact sequences.
This is the generating class of all three second-kind acyclic classes. -/
def totalizationProperty : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  fun X ↦ ∃ (L M N : ModuleObj.{u, v, w} B) (S : B.ShortExact L M N),
    Nonempty (B.homotopyQuotient.obj S.totalization ≅ X)

/-- The totalization of the zero sequence witnesses that the generating class is nonempty. -/
noncomputable instance : B.totalizationProperty.Nonempty := sorry

end RightCurvedDGAlgebra

/-! The three second-kind acyclic classes, the three Verdier quotients, and the comparison
functors, for an arbitrary triangulated category `T` and generating class `P`. They are
instantiated below with the curved homotopy category and its totalizations. The universe
parameter written first on `coacyclic` and `contraacyclic` is the universe of the indexing types
of the coproducts and products used in the closure. -/
namespace SecondKind

variable {T : Type u} [Category.{v} T] [CategoryTheory.Limits.HasZeroObject T] [Preadditive T]
  [HasShift T ℤ] [∀ m : ℤ, (shiftFunctor T m).Additive] [Pretriangulated T]
  (P : ObjectProperty T)

/-- Absolutely acyclic objects: the smallest thick triangulated subcategory containing `P`. This
is Mathlib's triangulated envelope, closed under shifts, cones, and retracts. -/
abbrev absoluteAcyclic : ObjectProperty T := P.triangEnvelope

/-- Coacyclic objects: the smallest isomorphism-closed triangulated subcategory containing `P`
and closed under small coproducts. -/
def coacyclic : ObjectProperty T :=
  ⨅ (Q : ObjectProperty T) (_ : P ≤ Q) (_ : Q.IsTriangulated)
    (_ : Q.IsClosedUnderIsomorphisms)
    (_ : ∀ J : Type v, Q.IsClosedUnderColimitsOfShape (Discrete J)), Q

/-- Contraacyclic objects: the smallest isomorphism-closed triangulated subcategory containing `P`
and closed under small products. -/
def contraacyclic : ObjectProperty T :=
  ⨅ (Q : ObjectProperty T) (_ : P ≤ Q) (_ : Q.IsTriangulated)
    (_ : Q.IsClosedUnderIsomorphisms)
    (_ : ∀ J : Type v, Q.IsClosedUnderLimitsOfShape (Discrete J)), Q

theorem le_coacyclic : P ≤ coacyclic P :=
  le_iInf fun _ ↦ le_iInf fun hPQ ↦ le_iInf fun _ ↦ le_iInf fun _ ↦ le_iInf fun _ ↦ hPQ

theorem le_contraacyclic : P ≤ contraacyclic P :=
  le_iInf fun _ ↦ le_iInf fun hPQ ↦ le_iInf fun _ ↦ le_iInf fun _ ↦ le_iInf fun _ ↦ hPQ

noncomputable instance coacyclic_isTriangulated : (coacyclic P).IsTriangulated := sorry

noncomputable instance coacyclic_isClosedUnderIsomorphisms :
    (coacyclic P).IsClosedUnderIsomorphisms := sorry

noncomputable instance contraacyclic_isTriangulated : (contraacyclic P).IsTriangulated :=
  sorry

noncomputable instance contraacyclic_isClosedUnderIsomorphisms :
    (contraacyclic P).IsClosedUnderIsomorphisms := sorry

/-- `Ac_abs ⊆ Ac_co`: a triangulated subcategory closed under countable coproducts is thick, so
the coacyclic closure contains the thick closure. -/
theorem absoluteAcyclic_le_coacyclic [CategoryTheory.Limits.HasCoproducts T] :
    absoluteAcyclic P ≤ coacyclic P := sorry

/-- `Ac_abs ⊆ Ac_ctr`, dually. -/
theorem absoluteAcyclic_le_contraacyclic [CategoryTheory.Limits.HasProducts T] :
    absoluteAcyclic P ≤ contraacyclic P := sorry

/-- The absolute derived category `D_abs = T / Ac_abs`. -/
abbrev AbsoluteDerived := (absoluteAcyclic P).trW.Localization

/-- The coderived category `D_co = T / Ac_co`. -/
abbrev Coderived := (coacyclic P).trW.Localization

/-- The contraderived category `D_ctr = T / Ac_ctr`. -/
abbrev Contraderived := (contraacyclic P).trW.Localization

/-- The Verdier localization `T → D_abs`. -/
noncomputable abbrev absoluteQ : T ⥤ AbsoluteDerived P := (absoluteAcyclic P).trW.Q

/-- The Verdier localization `T → D_co`. -/
noncomputable abbrev coderivedQ : T ⥤ Coderived P := (coacyclic P).trW.Q

/-- The Verdier localization `T → D_ctr`. -/
noncomputable abbrev contraderivedQ : T ⥤ Contraderived P := (contraacyclic P).trW.Q

theorem absoluteAcyclic_trW_le_coacyclic_trW [CategoryTheory.Limits.HasCoproducts T] :
    (absoluteAcyclic P).trW ≤ (coacyclic P).trW :=
  ObjectProperty.trW_monotone (absoluteAcyclic_le_coacyclic P)

theorem absoluteAcyclic_trW_le_contraacyclic_trW [CategoryTheory.Limits.HasProducts T] :
    (absoluteAcyclic P).trW ≤ (contraacyclic P).trW :=
  ObjectProperty.trW_monotone (absoluteAcyclic_le_contraacyclic P)

/-- The coderived localization inverts the absolute weak equivalences, because it inverts the
larger class. -/
theorem absoluteAcyclic_trW_isInvertedBy_coderivedQ
    [CategoryTheory.Limits.HasCoproducts T] :
    (absoluteAcyclic P).trW.IsInvertedBy (coderivedQ P) :=
  fun _ _ f hf ↦ Localization.inverts (coderivedQ P) (coacyclic P).trW f
    (absoluteAcyclic_trW_le_coacyclic_trW P f hf)

theorem absoluteAcyclic_trW_isInvertedBy_contraderivedQ
    [CategoryTheory.Limits.HasProducts T] :
    (absoluteAcyclic P).trW.IsInvertedBy (contraderivedQ P) :=
  fun _ _ f hf ↦ Localization.inverts (contraderivedQ P) (contraacyclic P).trW f
    (absoluteAcyclic_trW_le_contraacyclic_trW P f hf)

/-- The comparison `D_abs → D_co` induced by `Ac_abs ⊆ Ac_co` through the universal property of
the absolute localization. -/
noncomputable def absoluteToCoderived [CategoryTheory.Limits.HasCoproducts T] :
    AbsoluteDerived P ⥤ Coderived P :=
  Localization.lift (coderivedQ P) (absoluteAcyclic_trW_isInvertedBy_coderivedQ P)
    (absoluteQ P)

/-- The comparison `D_abs → D_ctr` induced by `Ac_abs ⊆ Ac_ctr`. -/
noncomputable def absoluteToContraderived [CategoryTheory.Limits.HasProducts T] :
    AbsoluteDerived P ⥤ Contraderived P :=
  Localization.lift (contraderivedQ P) (absoluteAcyclic_trW_isInvertedBy_contraderivedQ P)
    (absoluteQ P)

/-- The comparison commutes with the localizations up to the natural isomorphism supplied by the
universal property. A localization only ever provides a natural isomorphism here, never a strict
equality of functors. -/
noncomputable def absoluteToCoderived_fac [CategoryTheory.Limits.HasCoproducts T] :
    absoluteQ P ⋙ absoluteToCoderived P ≅ coderivedQ P :=
  Localization.fac _ _ _

noncomputable def absoluteToContraderived_fac [CategoryTheory.Limits.HasProducts T] :
    absoluteQ P ⋙ absoluteToContraderived P ≅ contraderivedQ P :=
  Localization.fac _ _ _

/-- The comparison functors are triangle functors. -/
theorem absoluteToCoderived_commShift [CategoryTheory.Limits.HasCoproducts T] :
    Nonempty ((absoluteToCoderived P).CommShift ℤ) := sorry

theorem absoluteToContraderived_commShift [CategoryTheory.Limits.HasProducts T] :
    Nonempty ((absoluteToContraderived P).CommShift ℤ) := sorry

end SecondKind

/-- Theorem 7.8(b)'s exact boundedness alternatives, represented on the genuine internally graded
algebra. Semisimplicity is Mathlib's actual predicate on the degree-zero subring and is needed only
in the nonnegative alternative. -/
inductive PositselskiBoundednessAlternative
    {k A : Type*} [CommRing k] [Ring A] [Algebra k A]
    (B : RightCurvedDGAlgebra k A) : Prop
  | nonpositive (curvature_zero : B.curvature = 0)
      (vanishPositive : ∀ n : ℤ, 0 < n → B.grading.piece n = ⊥)
  | nonnegative (curvature_zero : B.curvature = 0)
      (vanishNegative : ∀ n : ℤ, n < 0 → B.grading.piece n = ⊥)
      (degreeZeroSemisimple : IsSemisimpleRing B.degreeZeroSubring)
      (degreeOneVanishes : B.grading.piece 1 = ⊥)

/-- The coproduct totalization selected by Mathlib's countable coproduct API. -/
noncomputable abbrev CountableCoproductTotalization
    {GradedModule : Type u} [Category.{v} GradedModule]
    (J : ℕ → GradedModule) [CategoryTheory.Limits.HasCoproduct J] : GradedModule :=
  ∐ J

/-- Its actual component injection. -/
noncomputable abbrev countableCoproductTotalizationι
    {GradedModule : Type u} [Category.{v} GradedModule]
    (J : ℕ → GradedModule) [CategoryTheory.Limits.HasCoproduct J] (n : ℕ) :
    J n ⟶ CountableCoproductTotalization J :=
  CategoryTheory.Limits.Sigma.ι J n

/-- The universal property retained with the chosen coproduct totalization. -/
noncomputable def countableCoproductTotalizationIsColimit
    {GradedModule : Type u} [Category.{v} GradedModule]
    (J : ℕ → GradedModule) [CategoryTheory.Limits.HasCoproduct J] :
    CategoryTheory.Limits.IsColimit
      (CategoryTheory.Limits.Cofan.mk (CountableCoproductTotalization J)
        (countableCoproductTotalizationι J)) :=
  CategoryTheory.Limits.coproductIsCoproduct J

/-- The product totalization selected by Mathlib's countable product API. -/
noncomputable abbrev CountableProductTotalization
    {GradedModule : Type u} [Category.{v} GradedModule]
    (P : ℕ → GradedModule) [CategoryTheory.Limits.HasProduct P] : GradedModule :=
  ∏ᶜ P

/-- Its actual component projection. -/
noncomputable abbrev countableProductTotalizationπ
    {GradedModule : Type u} [Category.{v} GradedModule]
    (P : ℕ → GradedModule) [CategoryTheory.Limits.HasProduct P] (n : ℕ) :
    CountableProductTotalization P ⟶ P n :=
  CategoryTheory.Limits.Pi.π P n

/-- The universal property retained with the chosen product totalization. -/
noncomputable def countableProductTotalizationIsLimit
    {GradedModule : Type u} [Category.{v} GradedModule]
    (P : ℕ → GradedModule) [CategoryTheory.Limits.HasProduct P] :
    CategoryTheory.Limits.IsLimit
      (CategoryTheory.Limits.Fan.mk (CountableProductTotalization P)
        (countableProductTotalizationπ P)) :=
  CategoryTheory.Limits.productIsProduct P

/-- Right-module translation of Theorem 7.9(a)'s condition `(*)`, in an actual abelian category
of graded right modules with actual countable coproducts. -/
def CountableInjectiveCondition
    {GradedModule : Type u} [Category.{v} GradedModule] [Abelian GradedModule]
    [CategoryTheory.Limits.HasCoproductsOfShape ℕ GradedModule] : Prop :=
  ∀ J : ℕ → GradedModule, (∀ n, Injective (J n)) →
    ∃ d : ℕ, HasInjectiveDimensionLE (CountableCoproductTotalization J) d

/-- Right-module translation of Theorem 7.9(b)'s condition `(**)`: a countable product of
projective graded right modules must have finite projective dimension. -/
def CountableProjectiveCondition
    {GradedModule : Type u} [Category.{v} GradedModule] [Abelian GradedModule]
    [CategoryTheory.Limits.HasProductsOfShape ℕ GradedModule] : Prop :=
  ∀ P : ℕ → GradedModule, (∀ n, Projective (P n)) →
    ∃ d : ℕ, HasProjectiveDimensionLE (CountableProductTotalization P) d

/-- Theorem 7.9(a)'s sum hypothesis is exposed independently, with the actual coproduct
totalization in its conclusion. -/
theorem positselski_7_9a_sum_condition
    {GradedModule : Type u} [Category.{v} GradedModule] [Abelian GradedModule]
    [CategoryTheory.Limits.HasCoproductsOfShape ℕ GradedModule]
    (h : CountableInjectiveCondition (GradedModule := GradedModule))
    (J : ℕ → GradedModule)
    (hJ : ∀ n, Injective (J n)) :
    ∃ d : ℕ, HasInjectiveDimensionLE (CountableCoproductTotalization J) d :=
  h J hJ

/-- Theorem 7.9(b)'s product hypothesis is exposed independently; it neither assumes nor
produces a coderived/contraderived comparison. -/
theorem positselski_7_9b_product_condition
    {GradedModule : Type u} [Category.{v} GradedModule] [Abelian GradedModule]
    [CategoryTheory.Limits.HasProductsOfShape ℕ GradedModule]
    (h : CountableProjectiveCondition (GradedModule := GradedModule))
    (P : ℕ → GradedModule)
    (hP : ∀ n, Projective (P n)) :
    ∃ d : ℕ, HasProjectiveDimensionLE (CountableProductTotalization P) d :=
  h P hP

namespace RightCurvedDGAlgebra

variable {k : Type u} {A : Type v} [CommRing k] [Ring A] [Algebra k A]
  (B : RightCurvedDGAlgebra k A)

/-- The absolutely acyclic curved modules. -/
abbrev absoluteAcyclic : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  SecondKind.absoluteAcyclic B.totalizationProperty

/-- The coacyclic curved modules. -/
abbrev coacyclic : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  SecondKind.coacyclic B.totalizationProperty

/-- The contraacyclic curved modules. -/
abbrev contraacyclic : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  SecondKind.contraacyclic B.totalizationProperty

/-- The absolute derived category of curved modules over `B`. -/
abbrev AbsoluteDerived := SecondKind.AbsoluteDerived (totalizationProperty.{u, v, w} B)

/-- The coderived category of curved modules over `B`. -/
abbrev Coderived := SecondKind.Coderived (totalizationProperty.{u, v, w} B)

/-- The contraderived category of curved modules over `B`. -/
abbrev Contraderived := SecondKind.Contraderived (totalizationProperty.{u, v, w} B)

/-- `D_abs → D_co` for curved modules. -/
noncomputable abbrev absoluteToCoderived : AbsoluteDerived.{u, v, w} B ⥤ Coderived.{u, v, w} B :=
  SecondKind.absoluteToCoderived (totalizationProperty.{u, v, w} B)

/-- `D_abs → D_ctr` for curved modules. -/
noncomputable abbrev absoluteToContraderived :
    AbsoluteDerived.{u, v, w} B ⥤ Contraderived.{u, v, w} B :=
  SecondKind.absoluteToContraderived (totalizationProperty.{u, v, w} B)

/-- A graded right module over the graded ring underlying `B`, without differential. This is the
abelian category in which Positselski's homological-dimension hypotheses are stated. -/
structure GradedModuleObj.{wc} where
  /-- The underlying `k`-module. -/
  carrier : Type wc
  [addCommGroup : AddCommGroup carrier]
  [moduleK : Module k carrier]
  [moduleOp : Module Aᵐᵒᵖ carrier]
  [scalarTower : IsScalarTower k Aᵐᵒᵖ carrier]
  [smulComm : SMulCommClass k Aᵐᵒᵖ carrier]
  grading : InternalGrading k carrier
  action_degree : ∀ p q a m, B.grading.IsHomogeneous p a → grading.IsHomogeneous q m →
    grading.IsHomogeneous (q + p) (MulOpposite.op a • m)

attribute [instance] GradedModuleObj.addCommGroup GradedModuleObj.moduleK
  GradedModuleObj.moduleOp GradedModuleObj.scalarTower GradedModuleObj.smulComm

namespace GradedModuleObj

variable {B}

/-- Degree-zero right-linear maps of graded modules. -/
@[ext]
structure Hom (M N : B.GradedModuleObj) where
  toLinearMap : M.carrier →ₗ[k] N.carrier
  map_op_smul : ∀ (a : A) (m : M.carrier),
    toLinearMap (MulOpposite.op a • m) = MulOpposite.op a • toLinearMap m
  degree_zero : LinearHasDegree M.grading N.grading 0 toLinearMap

noncomputable instance : Category B.GradedModuleObj where
  Hom := Hom
  id M :=
    { toLinearMap := LinearMap.id
      map_op_smul := fun _ _ ↦ rfl
      degree_zero := fun p x hx ↦ by simpa using hx }
  comp f g :=
    { toLinearMap := g.toLinearMap.comp f.toLinearMap
      map_op_smul := fun a m ↦ by simp [f.map_op_smul, g.map_op_smul]
      degree_zero := fun p x hx ↦ by simpa using g.degree_zero _ _ (f.degree_zero p x hx) }
  id_comp f := by ext; rfl
  comp_id f := by ext; rfl
  assoc f g h := by ext; rfl

/-- Graded right modules form an abelian category with degreewise kernels and cokernels. -/
noncomputable instance : Abelian B.GradedModuleObj := sorry

noncomputable instance :
    CategoryTheory.Limits.HasCoproductsOfShape ℕ B.GradedModuleObj := sorry

noncomputable instance :
    CategoryTheory.Limits.HasProductsOfShape ℕ B.GradedModuleObj := sorry

end GradedModuleObj

/-- Forgetting the differential of a curved module. -/
def ModuleObj.underlyingGraded (M : ModuleObj.{u, v, w} B) : GradedModuleObj.{u, v, w} B where
  carrier := M.carrier
  grading := M.str.grading
  action_degree := M.str.action_degree

/-- Finite right graded global dimension: a uniform projective-dimension bound in the abelian
category of graded right modules. This is the hypothesis of Theorem 7.8(a) applied to the graded
opposite, translated to right modules. -/
def FiniteGradedGlobalDimension (d : ℕ) : Prop :=
  ∀ M : GradedModuleObj.{u, v, w} B, HasProjectiveDimensionLE M d

/-- Positselski Theorem 7.8(a): under finite graded global dimension the three acyclic classes
coincide, so the three second-kind derived categories agree. -/
theorem positselski_7_8a {d : ℕ} (h : FiniteGradedGlobalDimension.{u, v, w} B d) :
    absoluteAcyclic.{u, v, w} B = coacyclic.{u, v, w} B ∧
      absoluteAcyclic.{u, v, w} B = contraacyclic.{u, v, w} B := sorry

/-- The objects of the homotopy category represented by ordinary acyclic modules. This only has
its intended meaning at curvature zero, where `d² = 0` and `ker d / im d` exists. -/
def acyclicProperty : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  fun X ↦ ∃ M : ModuleObj.{u, v, w} B, Function.Exact M.str.d M.str.d ∧
    Nonempty (B.homotopyQuotient.obj M ≅ X)

/-- Positselski Theorem 7.8(b): at curvature zero, under one of the boundedness alternatives and
finite graded global dimension, ordinary acyclicity agrees with absolute acyclicity, hence with
all three second-kind classes. -/
theorem positselski_7_8b (hB : PositselskiBoundednessAlternative B) {d : ℕ}
    (h : FiniteGradedGlobalDimension.{u, v, w} B d) :
    acyclicProperty.{u, v, w} B = absoluteAcyclic.{u, v, w} B := sorry

/-- The objects of the homotopy category represented by modules whose underlying graded module is
injective. -/
def gradedInjectiveProperty : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  fun X ↦ ∃ M : ModuleObj.{u, v, w} B, Injective M.underlyingGraded ∧
    Nonempty (B.homotopyQuotient.obj M ≅ X)

/-- The objects of the homotopy category represented by modules whose underlying graded module is
projective. -/
def gradedProjectiveProperty : ObjectProperty (HomotopyCategory.{u, v, w} B) :=
  fun X ↦ ∃ M : ModuleObj.{u, v, w} B, Projective M.underlyingGraded ∧
    Nonempty (B.homotopyQuotient.obj M ≅ X)

/-- The homotopy category of graded-injective curved modules maps to the coderived category. -/
noncomputable def coderivedInjectiveModel :
    (gradedInjectiveProperty.{u, v, w} B).FullSubcategory ⥤ Coderived.{u, v, w} B := sorry

/-- The homotopy category of graded-projective curved modules maps to the contraderived
category. -/
noncomputable def contraderivedProjectiveModel :
    (gradedProjectiveProperty.{u, v, w} B).FullSubcategory ⥤ Contraderived.{u, v, w} B := sorry

/-- Positselski Theorem 7.9(a): under the countable-coproduct injective condition `(*)`, the
graded-injective homotopy category is the coderived category. -/
theorem positselski_7_9a
    (h : CountableInjectiveCondition (GradedModule := GradedModuleObj.{u, v, w} B)) :
    (coderivedInjectiveModel.{u, v, w} B).IsEquivalence := sorry

/-- Positselski Theorem 7.9(b): under the countable-product projective condition `(**)`, the
graded-projective homotopy category is the contraderived category. -/
theorem positselski_7_9b
    (h : CountableProjectiveCondition (GradedModule := GradedModuleObj.{u, v, w} B)) :
    (contraderivedProjectiveModel.{u, v, w} B).IsEquivalence := sorry

end RightCurvedDGAlgebra

/-! ## Layer 7: matrix factorizations and executable examples -/

/-- A finite matrix factorization is the finite-projective specialization of a curved duplex.
Projectivity and finite generation are predicates on the two modules in the category-level API;
the algebraic factorization equations themselves are exactly this structure. -/
abbrev MatrixFactorization (R M₀ M₁ : Type*) [CommRing R]
    [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁] (w : R) :=
  CurvedDuplex R M₀ M₁ w

/-- Multiplication by an element of a commutative ring, as a linear endomorphism. -/
def mulMap {R : Type*} [CommRing R] (r : R) : R →ₗ[R] R :=
  LinearMap.mulLeft R r

@[simp]
theorem mulMap_apply {R : Type*} [CommRing R] (r x : R) : mulMap r x = r * x := rfl

/-- The worked matrix factorization `(x^i, x^j)` of the potential `x^(i+j)`. Taking
`R = k[x]` and `i+j=n` gives the periodic resolution attached to `k[x]/(x^n)`. -/
def powerMatrixFactorization {R : Type*} [CommRing R] (x : R) (i j : ℕ) :
    MatrixFactorization R R R (x ^ (i + j)) where
  dEven := mulMap (x ^ i)
  dOdd := mulMap (x ^ j)
  odd_even := by
    ext
    simp [mulMap, pow_add, mul_comm]
  even_odd := by
    ext
    simp [mulMap, pow_add]

/-- The matrix-factorization dual with the pinned single-minus convention. If
`P=(dEven,dOdd)` has potential `w`, then `(dual dOdd,-dual dEven)` has potential `-w`.
Finite projectivity, which makes the double-dual comparison an isomorphism, belongs in the
category-level duality theorem. -/
noncomputable def matrixFactorizationDual
    {R M₀ M₁ : Type*} [CommRing R]
    [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁]
    (w : R) (P : MatrixFactorization R M₀ M₁ w) :
    MatrixFactorization R (M₀ →ₗ[R] R) (M₁ →ₗ[R] R) (-w) := sorry

/-- An algebraic matrix factorization with components satisfying the displayed, later-instantiated
module predicate. The comparison theorems below instantiate it only with finite-free or
finite-projective modules. -/
structure FiniteMatrixFactorization (S : Type u) [CommRing S] (w : S)
    (Component : ModuleCat.{u} S → Prop) where
  P₀ : ModuleCat.{u} S
  P₁ : ModuleCat.{u} S
  component₀ : Component P₀
  component₁ : Component P₁
  dEven : P₀ ⟶ P₁
  dOdd : P₁ ⟶ P₀
  odd_even : dEven ≫ dOdd = w • 𝟙 P₀
  even_odd : dOdd ≫ dEven = w • 𝟙 P₁

namespace FiniteMatrixFactorization

variable {S : Type u} [CommRing S] {w : S} {Component : ModuleCat.{u} S → Prop}

@[ext]
structure Hom (P Q : FiniteMatrixFactorization S w Component) where
  even : P.P₀ ⟶ Q.P₀
  odd : P.P₁ ⟶ Q.P₁
  comm_even : P.dEven ≫ odd = even ≫ Q.dEven
  comm_odd : P.dOdd ≫ even = odd ≫ Q.dOdd

/-- The category structure is componentwise on the two genuine module maps. -/
noncomputable instance : Category (FiniteMatrixFactorization S w Component) where
  Hom := Hom
  id P :=
    { even := 𝟙 _
      odd := 𝟙 _
      comm_even := by simp
      comm_odd := by simp }
  comp f g :=
    { even := f.even ≫ g.even
      odd := f.odd ≫ g.odd
      comm_even := by
        rw [← Category.assoc, f.comm_even, Category.assoc, g.comm_even]
        simp only [Category.assoc]
      comm_odd := by
        rw [← Category.assoc, f.comm_odd, Category.assoc, g.comm_odd]
        simp only [Category.assoc] }
  id_comp := by
    intro P Q f
    ext <;> simp
  comp_id := by
    intro P Q f
    ext <;> simp
  assoc := by
    intro P Q T U f g h
    ext <;> simp

/-- Difference of two closed maps is null-homotopic by an actual odd pair. -/
def HomotopyRel : HomRel (FiniteMatrixFactorization S w Component) :=
  fun {P Q} f g ↦ ∃ (h₀ : P.P₀ ⟶ Q.P₁) (h₁ : P.P₁ ⟶ Q.P₀),
    f.even - g.even = P.dEven ≫ h₁ + h₀ ≫ Q.dOdd ∧
    f.odd - g.odd = P.dOdd ≫ h₀ + h₁ ≫ Q.dEven

noncomputable instance homotopyCongruence : Congruence (HomotopyRel (w := w)
    (Component := Component)) := sorry

/-- The concrete homotopy category of matrix factorizations. -/
abbrev HomotopyCategory (S : Type u) [CommRing S] (w : S)
    (Component : ModuleCat.{u} S → Prop) :=
  CategoryTheory.Quotient (HomotopyRel (w := w) (Component := Component))

end FiniteMatrixFactorization

/-- Actual finite-free and finite-projective component predicates. -/
def IsFiniteFreeModule {S : Type u} [CommRing S] (M : ModuleCat.{u} S) : Prop :=
  Module.Finite S M ∧ Module.Free S M

def IsFiniteProjectiveModule {S : Type u} [CommRing S] (M : ModuleCat.{u} S) : Prop :=
  Module.Finite S M ∧ Module.Projective S M

/-- The handed version used by the singularity comparison, whose module category is right-sided. -/
def IsFiniteProjectiveRightModule {S : Type u} [CommRing S]
    (M : ModuleCat.{u} Sᵐᵒᵖ) : Prop :=
  Module.Finite Sᵐᵒᵖ M ∧ Module.Projective Sᵐᵒᵖ M

abbrev FiniteFreeMatrixFactorization (S : Type u) [CommRing S] (w : S) :=
  FiniteMatrixFactorization S w IsFiniteFreeModule

abbrev FiniteProjectiveMatrixFactorization (S : Type u) [CommRing S] (w : S) :=
  FiniteMatrixFactorization S w IsFiniteProjectiveModule

abbrev HMFfree (S : Type u) [CommRing S] (w : S) :=
  FiniteMatrixFactorization.HomotopyCategory S w IsFiniteFreeModule

abbrev HMFprojective (S : Type u) [CommRing S] (w : S) :=
  FiniteMatrixFactorization.HomotopyCategory S w IsFiniteProjectiveModule

/-- The affine zero-fiber ring. -/
abbrev HypersurfaceRing (S : Type u) [CommRing S] (w : S) :=
  S ⧸ Ideal.span ({w} : Set S)

/-- Noetherianity of the commutative hypersurface quotient, including the right-module side. -/
theorem hypersurfaceRightNoetherian {S : Type u} [CommRing S] [IsNoetherianRing S]
    (w : S) : IsNoetherianRing (HypersurfaceRing S w)ᵐᵒᵖ := sorry

/-- The exact singularity category of the zero fiber, built from bounded finitely generated
modules and the concrete perfect kernel above. -/
abbrev HypersurfaceSingularityCategory {S : Type u} [CommRing S] [IsNoetherianRing S]
    (w : S) :=
  FrobeniusComparison.ExactSingularityCategory
    (FrobeniusComparison.finitelyGeneratedModuleExactStructure
      (hypersurfaceRightNoetherian w))
    (FrobeniusComparison.finitelyGeneratedDerivedTriangulation
      (hypersurfaceRightNoetherian w))

/-- The canonical finite-free cokernel functor to the explicit singularity quotient of `S/(w)`.
Its definition descends ordinary cokernels through matrix-factorization homotopy. -/
noncomputable def finiteFreeCokernelToSingularity
    {S : Type u} [CommRing S] [IsNoetherianRing S] (w : S) :
    HMFfree S w ⥤ HypersurfaceSingularityCategory w := sorry

/-- The canonical finite-projective cokernel functor to the same concrete zero-fiber quotient. -/
noncomputable def finiteProjectiveCokernelToSingularity
    {S : Type u} [CommRing S] [IsNoetherianRing S] (w : S) :
    HMFprojective S w ⥤ HypersurfaceSingularityCategory w := sorry

/-- Eisenbud's regular-local, finite-free comparison. Its source, zero fiber, singularity
quotient, and cokernel functor are fixed constructions; only the theorem's genuine hypotheses are
arguments. -/
theorem eisenbudLocalCokernel_isEquivalence
    {S : Type u} [CommRing S] [IsRegularLocalRing S]
    (w : S) (hw_maximal : w ∈ IsLocalRing.maximalIdeal S)
    (hw_nonzero : w ≠ 0) (hw_nonunit : ¬ IsUnit w) (hw_regular : IsRegular w) :
    (finiteFreeCokernelToSingularity w).IsEquivalence := sorry

/-- Affine `(ELF)`'s enough-locally-free condition, translated into an actual finite-projective
cover of every finitely generated module. -/
def HasEnoughFiniteProjectives (S : Type u) [CommRing S] : Prop :=
  ∀ M : FrobeniusComparison.FinitelyGeneratedRightModule S,
    ∃ P : ModuleCat.{u} Sᵐᵒᵖ, IsFiniteProjectiveRightModule P ∧
      ∃ p : P ⟶ M.obj, Epi p

/-- Orlov's affine finite-projective comparison. The `k[t]`-module flatness instance is the flat
map `Spec S → 𝔸¹ₖ`; regularity, noetherianity, finite Krull dimension, and enough finite
projectives are all explicit. -/
theorem orlovAffineCokernel_isEquivalence
    {k S : Type u} [Field k] [CommRing S] [Algebra k S] [IsRegularRing S]
    [FiniteRingKrullDim S] [Algebra (Polynomial k) S]
    [IsScalarTower k (Polynomial k) S] [Module.Flat (Polynomial k) S]
    (hNoetherian : IsNoetherianRing S) (hEnough : HasEnoughFiniteProjectives S)
    (w : S) (maps_X : algebraMap (Polynomial k) S (Polynomial.X : Polynomial k) = w) :
    (finiteProjectiveCokernelToSingularity w).IsEquivalence := sorry

/-- A nontrivial-looking square-zero map on `M × M`, `(x,y) ↦ (0,x)`. -/
def pairDifferential {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] :
    (M × M) →ₗ[R] (M × M) :=
  (0 : (M × M) →ₗ[R] M).prod (LinearMap.fst R M M)

@[simp]
theorem pairDifferential_apply {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (x : M × M) : pairDifferential (R := R) (M := M) x = (0, x.1) := rfl

/-- A genuine two-periodic complex whose two differentials are the square-zero pair map. -/
def pairTwoPeriodicComplex {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] :
    TwoPeriodicComplex R (M × M) (M × M) where
  dEven := pairDifferential
  dOdd := pairDifferential
  odd_even := by ext x <;> simp [pairDifferential]
  even_odd := by ext x <;> simp [pairDifferential]

/-- The truncated polynomial algebra used by the stable-category acceptance example. -/
abbrev TruncatedPolynomial (k : Type*) [Field k] (n : ℕ) :=
  Polynomial k ⧸ Ideal.span ({Polynomial.X ^ n} : Set (Polynomial k))

/-- For `n > 0`, coefficient extraction in degree `n-1` descends to a symmetric Frobenius
functional on `k[x]/(x^n)`. No characteristic restriction is required. -/
noncomputable def truncatedPolynomialFrobenius (k : Type*) [Field k] (n : ℕ) (hn : 0 < n) :
    SymmetricFrobeniusFunctional k (TruncatedPolynomial k n) := sorry

/-- The residue class of `x` in `k[x]/(x^n)`. -/
noncomputable def truncatedX (k : Type*) [Field k] (n : ℕ) : TruncatedPolynomial k n :=
  Ideal.Quotient.mk (Ideal.span ({Polynomial.X ^ n} : Set (Polynomial k))) Polynomial.X

/-- The cyclic module `M_i=A/(x^i)`, represented as a right module through `Aᵐᵒᵖ`. The
commutativity of `A` supplies the action. -/
abbrev TruncatedCyclicModule (k : Type*) [Field k] (n i : ℕ) :=
  @HasQuotient.Quotient (TruncatedPolynomial k n)
    (Ideal (TruncatedPolynomial k n)) Ideal.instHasQuotient
    (Ideal.span ({truncatedX k n ^ i} : Set (TruncatedPolynomial k n)))

/-- Maps factoring through the regular module form the concrete subspace killed in stable Hom.
This generated submodule is used rather than an opaque predicate. -/
noncomputable def regularFactorSubmodule
    (k : Type*) [Field k] (n i j : ℕ) :
    Submodule k (TruncatedCyclicModule k n i →ₗ[TruncatedPolynomial k n]
      TruncatedCyclicModule k n j) :=
  Submodule.span k {f | ∃
    (a : TruncatedCyclicModule k n i →ₗ[TruncatedPolynomial k n] TruncatedPolynomial k n)
    (b : TruncatedPolynomial k n →ₗ[TruncatedPolynomial k n]
      TruncatedCyclicModule k n j), f = b.comp a}

/-- Concrete carrier for the flagship stable-Hom calculation: `A`-linear maps modulo the
`k`-subspace generated by `A`-linear factorizations through the regular module. -/
abbrev TruncatedStableHom (k : Type*) [Field k] (n i j : ℕ) :=
  @HasQuotient.Quotient
    (TruncatedCyclicModule k n i →ₗ[TruncatedPolynomial k n]
      TruncatedCyclicModule k n j)
    (Submodule k (TruncatedCyclicModule k n i →ₗ[TruncatedPolynomial k n]
      TruncatedCyclicModule k n j))
    Submodule.hasQuotient (regularFactorSubmodule k n i j)

/-- The kernel of the canonical free cover of `M_i=A/(x^i)`, as an actual ideal of the
truncated-polynomial algebra. -/
noncomputable abbrev TruncatedSyzygy (k : Type*) [Field k] (n i : ℕ) :
    Ideal (TruncatedPolynomial k n) :=
  Ideal.span ({truncatedX k n ^ i} : Set (TruncatedPolynomial k n))

/-- The complete flagship bridge ties one actual syzygy object, the actual stable-Hom quotient,
and the explicit `(x^i,x^(n-i))` factorization together. -/
structure TruncatedPolynomialBridgeTarget
    (k : Type*) [Field k] (n i j : ℕ) (hi : i ≤ n) where
  syzygy_equiv : Nonempty
    (TruncatedSyzygy k n i ≃ₗ[TruncatedPolynomial k n]
      TruncatedCyclicModule k n (n - i))
  stableHom_dimension : Module.finrank k (TruncatedStableHom k n i j) =
    min (min i j) (min (n - i) (n - j))
  factorization : MatrixFactorization (Polynomial k) (Polynomial k) (Polynomial k)
    (Polynomial.X ^ n)
  factorization_eq : factorization = by
    simpa [Nat.add_sub_of_le hi] using
      powerMatrixFactorization (Polynomial.X : Polynomial k) i (n - i)

/-- Flagship theorem target with all index hypotheses visible. -/
noncomputable def truncatedPolynomialBridge
    (k : Type*) [Field k] (n i j : ℕ) (hn : 2 ≤ n)
    (hi0 : 1 ≤ i) (hin : i < n) (hj0 : 1 ≤ j) (hjn : j < n) :
    TruncatedPolynomialBridgeTarget k n i j (Nat.le_of_lt hin) := sorry

/-!
The category-level acceptance theorem built after the exact-category and singularity layers says:
for a field `k`, `n ≥ 2`, and `1 ≤ i < n`, the finitely generated right
`k[x]/(x^n)`-module `M_i = A/(x^i)` has

* `Ω M_i ≅ M_(n-i)` and `Ω² M_i ≅ M_i` in the stable category;
* a minimal free resolution alternating multiplication by `x^i` and `x^(n-i)`;
* `dim_k stableHom(M_i,M_j) = min(i,j,n-i,n-j)` for `1 ≤ i,j < n`;
* the same two maps form the matrix factorization of `x^n` over `k[x]`, whose cokernel is
  `M_i` over `k[x]/(x^n)`.

These statements require the actual stable quotient, syzygy, finite-generation, quotient-ring,
and matrix-factorization APIs. They are not represented here by content-free `Prop` declarations.
-/

end TauCetiRoadmap.StablePeriodicCurved
