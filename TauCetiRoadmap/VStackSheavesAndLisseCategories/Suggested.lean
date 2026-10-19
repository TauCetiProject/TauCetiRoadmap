import Mathlib

/-!
# Artin v-stacks, solid and lisse coefficients: representative target signatures

The definitive roadmap is README.md. These are suggested forms, not an exhaustive checklist:
they record light definitions and milestone statements on the pinned Mathlib carriers.
Integer solidity uses `CondensedMod.IsSolid`; general discrete rings use its polynomial
restriction criterion. Quasicompactness and quasiseparatedness concern condensed sheaves,
including their categorical fibre products. Geometric stacks, enhanced solid tensor products
and lisse categories are specified in the README.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject

universe u

namespace TauCeti.Blueprint.VStack

/-! ## Layer VS2: solid groups and condensed geometry -/

/-- The full subcategory of integer-solid condensed abelian groups (README VS2.1). -/
abbrev SolidAb :=
  ObjectProperty.FullSubcategory (fun A : CondensedAb.{u} => A.IsSolid)

namespace SolidAb

/-- Solid groups admit an abelian structure (CS Theorem 5.8(i)). -/
theorem abelian : Nonempty (Abelian SolidAb.{u}) := sorry

/-- All small limits and colimits exist in the solid category (CS Theorem 5.8(i)). -/
theorem limits : HasLimitsOfSize.{u, u} SolidAb.{u} ∧
    HasColimitsOfSize.{u, u} SolidAb.{u} := sorry

/-- Inclusion creates limits (CS Theorem 5.8(i)). -/
theorem createsLimits : Nonempty (CreatesLimitsOfSize.{u, u}
    (ObjectProperty.ι (fun A : CondensedAb.{u} => A.IsSolid))) := sorry

/-- Inclusion creates colimits (CS Theorem 5.8(i)). -/
theorem createsColimits : Nonempty (CreatesColimitsOfSize.{u, u}
    (ObjectProperty.ι (fun A : CondensedAb.{u} => A.IsSolid))) := sorry

/-- Solidity is closed under extensions (CS Theorem 5.8(i)). -/
theorem extensions (S : ShortComplex CondensedAb.{u})
    (hS : S.ShortExact) (h₁ : S.X₁.IsSolid) (h₃ : S.X₃.IsSolid) : S.X₂.IsSolid := sorry

/-- The inclusion is a right adjoint: solidification exists (CS Theorem 5.8(i), p.36). -/
theorem inclusion_isRightAdjoint :
    (ObjectProperty.ι (fun A : CondensedAb.{u} => A.IsSolid)).IsRightAdjoint :=
  sorry

/-- The existing profinite free solid group is solid (CS Proposition 5.7). -/
theorem freeStructure (S : Profinite.{u}) :
    ((Condensed.profiniteSolid (ULift.{u + 1} ℤ)).obj S).IsSolid := sorry

/-- Finite free solidification is an isomorphism (CS Corollary 5.5). -/
theorem freeStructure_finite (S : FintypeCat.{u}) :
    IsIso ((Condensed.profiniteSolidification (ULift.{u + 1} ℤ)).app
      (FintypeCat.toProfinite.obj S)) := sorry

/-- The zero group is solid (README VS2.1, `SolidAb.zero`). -/
theorem zero_isSolid : (0 : CondensedAb.{u}).IsSolid := sorry

end SolidAb

/-- General-ring solidity tests every restriction along an integer polynomial map
(CS Lecture VII; the docstring of Mathlib's `CondensedMod.IsSolid`, README VS2.2). -/
def IsSolidGeneral {R : Type (u + 1)} [Ring R] (A : CondensedMod.{u} R) : Prop :=
  ∀ f : Polynomial (ULift.{u + 1} ℤ) →+* R,
    CondensedMod.IsSolid (Polynomial (ULift.{u + 1} ℤ))
      ((sheafCompose (coherentTopology CompHaus.{u}) (ModuleCat.restrictScalars.{u + 1} f)).obj A)

namespace IsSolidGeneral

/-- Coefficient restriction preserves the polynomial criterion (README VS2.2). -/
theorem restrict {R S : Type (u + 1)} [Ring R] [Ring S] (f : R →+* S)
    (A : CondensedMod.{u} S) (h : IsSolidGeneral A) :
    IsSolidGeneral ((sheafCompose (coherentTopology CompHaus.{u}) (ModuleCat.restrictScalars.{u + 1} f)).obj A) := sorry

/-- The criterion is invariant under isomorphism (README VS2.2). -/
theorem iso {R : Type (u + 1)} [Ring R] {A B : CondensedMod.{u} R}
    (e : A ≅ B) : IsSolidGeneral A ↔ IsSolidGeneral B := sorry

/-- Finite-type integer algebras recover the library predicate (CS Lecture VII). -/
theorem finiteType {R : Type (u + 1)} [Ring R] [Algebra ℤ R]
    [Algebra.FiniteType ℤ R] (A : CondensedMod.{u} R) :
    IsSolidGeneral A ↔ A.IsSolid := sorry

/-- Integer coefficients recover integer solidity (README VS2.2). -/
theorem integer (A : CondensedAb.{u}) : IsSolidGeneral A ↔ A.IsSolid := sorry

/-- Zero satisfies every polynomial restriction test (README VS2.2). -/
theorem zero {R : Type (u + 1)} [Ring R] :
    IsSolidGeneral (0 : CondensedMod.{u} R) := sorry

/-- The polynomial identity test recovers the library polynomial solidity (README VS2.2). -/
theorem polynomial (A : CondensedMod.{u} (Polynomial (ULift.{u + 1} ℤ)))
    (h : IsSolidGeneral A) : A.IsSolid := sorry

end IsSolidGeneral

namespace CondensedQCQS

/-- A condensed set is quasicompact if it has a profinite epimorphic cover
(PQ Appendix A, README VS2.3). -/
def IsQuasicompact (X : CondensedSet.{u}) : Prop :=
  ∃ (S : Profinite.{u}) (f : S.toCondensed ⟶ X), Epi f

/-- A quasicompact map has quasicompact pullback along each profinite test. -/
def IsQuasicompactMap {X Y : CondensedSet.{u}} (f : X ⟶ Y) : Prop :=
  ∀ (S : Profinite.{u}) (g : S.toCondensed ⟶ Y), IsQuasicompact (pullback f g)

/-- Quasiseparatedness tests all pairs of profinite sources, not just abstract points. -/
def IsQuasiseparated (X : CondensedSet.{u}) : Prop :=
  ∀ (S T : Profinite.{u}) (f : S.toCondensed ⟶ X) (g : T.toCondensed ⟶ X),
    IsQuasicompact (pullback f g)

/-- A profinite realization has its identity epimorphic cover. -/
example (S : Profinite.{u}) : IsQuasicompact S.toCondensed :=
  ⟨S, 𝟙 _, inferInstance⟩

/-- Identity maps pass every profinite pullback test. -/
example (X : CondensedSet.{u}) : IsQuasicompactMap (𝟙 X) := by
  intro S g
  exact ⟨S, inv (pullback.snd (𝟙 X) g), inferInstance⟩

/-- A profinite realization has quasicompact structure map (PQ Appendix A, README VS2.3). -/
theorem profinite_to_terminal (S : Profinite.{u}) :
    IsQuasicompactMap (terminal.from S.toCondensed) := sorry

/-- The infinite discrete natural numbers have nonquasicompact structure map (README VS2.3). -/
theorem infiniteDiscrete_to_terminal_not :
    ¬ IsQuasicompactMap (terminal.from (TopCat.of (ULift.{u + 1} ℕ)).toCondensedSet) := sorry

/-- Quasicompactness of a map is stable under arbitrary base change (PQ Appendix A). -/
theorem baseChange {X Y Z : CondensedSet.{u}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (h : IsQuasicompactMap f) : IsQuasicompactMap (pullback.snd f g) := sorry

/-- A subobject of a quasiseparated condensed set is quasiseparated (PQ Lemma A.6). -/
theorem subobject {X Y : CondensedSet.{u}} (f : X ⟶ Y) [Mono f]
    (h : IsQuasiseparated Y) : IsQuasiseparated X := sorry

end CondensedQCQS

/-- QCQS is the conjunction of the two sheaf-theoretic conditions. -/
def CondensedQCQS (X : CondensedSet.{u}) : Prop :=
  CondensedQCQS.IsQuasicompact X ∧ CondensedQCQS.IsQuasiseparated X

namespace CondensedQCQS

/-- Profinite realizations are qcqs (PQ Lemmas A.3–A.4). -/
theorem profinite (S : Profinite.{u}) : CondensedQCQS S.toCondensed := sorry

/-- The empty condensed set is qcqs (README VS2.3). -/
theorem empty : CondensedQCQS (Profinite.of PEmpty.{u + 1}).toCondensed := sorry

/-- An infinite discrete set is quasiseparated and not quasicompact (README VS2.3). -/
theorem infiniteDiscrete : IsQuasiseparated (TopCat.of (ULift.{u + 1} ℕ)).toCondensedSet ∧
    ¬ IsQuasicompact (TopCat.of (ULift.{u + 1} ℕ)).toCondensedSet := sorry

/-- Filtered unions along quasicompact injections remain quasiseparated (PQ Lemma A.5). -/
theorem colimits {J : Type u} [SmallCategory J] [IsFiltered J] (F : J ⥤ CondensedSet.{u})
    (hF : ∀ j, CondensedQCQS (F.obj j))
    (hmap : ∀ {i j : J} (f : i ⟶ j), Mono (F.map f) ∧ IsQuasicompactMap (F.map f))
    (c : Cocone F) (hc : IsColimit c) : IsQuasiseparated c.pt := sorry

end CondensedQCQS

end TauCeti.Blueprint.VStack
