import Mathlib
import TauCeti.Topology.Sheaves.Flasque
import TauCeti.Algebra.Homology.Monoidal.Braiding

/-!
The README is the definitive specification. This file suggests interfaces and is not an
exhaustive checklist. The advanced comparison, purity and duality targets are stated in
the README. Native `Sheaf.H` is abelian Ext; its R-linear comparison is a separate target.
Independent parity uses two native complexes, with the super-to-native tensor and flag
comparison specified by TS0 and TS5.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits Opposite TopologicalSpace CategoryTheory.MonoidalCategory

universe u

namespace TauCetiRoadmap.TopologicalSheafCohomology

variable (R : Type u) [CommRing R] (X : Type u) [TopologicalSpace X]

/-- The implemented native abelian-sheaf theorem, with the same carrier and hypotheses. -/
example (Y : TopCat.{u})
    (F : CategoryTheory.Sheaf (Opens.grothendieckTopology Y) AddCommGrpCat.{u})
    [Injective F] : TopCat.Presheaf.IsFlasque F.obj :=
  TauCeti.Topology.isFlasque_of_injective F

/-- The implemented cochain Koszul swap at the matching `ModuleCat R` universe. -/
example (A B : CochainComplex (ModuleCat.{u} R) ℤ) : A ⊗ B ≅ B ⊗ A :=
  TauCeti.koszulBraiding R A B

/-- R-module sheaves on the native open-set Grothendieck site. -/
abbrev ModuleSheaf :=
  CategoryTheory.Sheaf (Opens.grothendieckTopology X) (ModuleCat.{u} R)

/-- Contravariance is part of the actual functor type. -/
abbrev KPresheaf := (Compacts X)ᵒᵖ ⥤ ModuleCat.{u} R

/-- Homotopy K-sheaf axioms will be properties of these genuine complex-valued functors. -/
abbrev KComplex := (Compacts X)ᵒᵖ ⥤ CochainComplex (ModuleCat.{u} R) ℤ

/-- A point is compact without a Hausdorff assumption. -/
def singletonCompact (x : X) : Compacts X :=
  ⟨{x}, isCompact_singleton⟩

/-- Singleton evaluation is the compact-presheaf stalk. -/
abbrev compactStalk (F : KPresheaf R X) (x : X) : ModuleCat.{u} R :=
  F.obj (op (singletonCompact X x))

/-- K ⊆ L gives F(L) → F(K), the direction needed by the local chain K-presheaf. -/
def compactRestriction (F : KPresheaf R X) {K L : Compacts X} (h : K ≤ L) :
    F.obj (op L) ⟶ F.obj (op K) :=
  F.map (homOfLE h).op

@[simp]
theorem compactRestriction_refl (F : KPresheaf R X) (K : Compacts X) :
    compactRestriction R X F (le_refl K) = 𝟙 (F.obj (op K)) := by
  simp [compactRestriction]

theorem compactRestriction_comp (F : KPresheaf R X) {K L N : Compacts X}
    (hKL : K ≤ L) (hLN : L ≤ N) :
    compactRestriction R X F hLN ≫ compactRestriction R X F hKL =
      compactRestriction R X F (hKL.trans hLN) := by
  exact (F.map_comp (homOfLE hLN).op (homOfLE hKL).op).symm.trans
    (congrArg F.map (Subsingleton.elim _ _))

def compactStalkMap {F G : KPresheaf R X} (f : F ⟶ G) (x : X) :
    compactStalk R X F x ⟶ compactStalk R X G x :=
  f.app (op (singletonCompact X x))

/-- The actual weak lower-homology condition, not a readiness proposition. It is one
condition in purity; it is not a replacement for the homotopy K-sheaf axioms. -/
def IsWeaklyLocallyBoundedBelow (F : KComplex R X) : Prop :=
  ∀ x : X, ∃ U : Opens X, x ∈ U ∧ ∃ N : ℤ,
    ∀ K : Compacts X, (K : Set X) ⊆ (U : Set X) →
      ∀ i : ℤ, i ≤ N →
        IsZero ((HomologicalComplex.homologyFunctor (ModuleCat.{u} R)
          (ComplexShape.up ℤ) i).obj (F.obj (op K)))

/-- Stalk concentration is stated separately; TS2 also requires weak local vanishing. -/
def IsSingletonConcentrated (F : KComplex R X) : Prop :=
  ∀ (x : X) (i : ℤ), i ≠ 0 →
    IsZero ((HomologicalComplex.homologyFunctor (ModuleCat.{u} R)
      (ComplexShape.up ℤ) i).obj (F.obj (op (singletonCompact X x))))

/-- Native tuple Čech complex. A covering condition is required by the comparison theorem,
not by the construction of this functor on an indexed family. -/
noncomputable def indexedOpenCech (n : ℕ) (U : ULift.{u} (Fin n) → Opens X) :
    ((Opens X)ᵒᵖ ⥤ ModuleCat.{u} R) ⥤ CochainComplex (ModuleCat.{u} R) ℕ :=
  cechComplexFunctor U

/-- Retain the actual refinement index function in native FormalCoproduct. -/
def rawOpenRefinement {m n : ℕ} (V : ULift.{u} (Fin m) → Opens X) (U : ULift.{u} (Fin n) → Opens X)
    (f : ULift.{u} (Fin m) → ULift.{u} (Fin n)) (h : ∀ i, V i ≤ U (f i)) :
    (FormalCoproduct.mk (ULift.{u} (Fin m)) V : FormalCoproduct (Opens X)) ⟶
      FormalCoproduct.mk (ULift.{u} (Fin n)) U :=
  ⟨f, fun i => homOfLE (h i)⟩

/-- The τ-normal form is an actual native graded family of native cochain complexes. -/
abbrev IndependentParityComplex :=
  GradedObject (ZMod 2) (CochainComplex (ModuleCat.{u} R) ℤ)

/-- Actual interval order: left endpoint increases and right endpoint decreases. -/
abbrev IntervalIndex (S : Type u) [PartialOrder S] :=
  {p : S × OrderDual S // p.1 ≤ OrderDual.ofDual p.2}

def intervalObject {S : Type u} [PartialOrder S] (s t : S) (h : s ≤ t) :
    IntervalIndex S :=
  ⟨(s, OrderDual.toDual t), h⟩

theorem interval_le_iff {S : Type u} [PartialOrder S] (a b : IntervalIndex S) :
    a ≤ b ↔ a.val.1 ≤ b.val.1 ∧ OrderDual.ofDual b.val.2 ≤ OrderDual.ofDual a.val.2 := by
  constructor
  · intro h
    exact ⟨h.1, h.2⟩
  · rintro ⟨h₁, h₂⟩
    exact ⟨h₁, h₂⟩

/-- Add a Finite/Fintype hypothesis on S when constructing the TS5 finite flag sum. -/
abbrev IntervalDiagram (S : Type u) [PartialOrder S] :=
  IntervalIndex S ⥤ CochainComplex (ModuleCat.{u} R) ℤ

def intervalStructureMap {S : Type u} [PartialOrder S] (A : IntervalDiagram R S)
    {a b : IntervalIndex S} (h : a ≤ b) : A.obj a ⟶ A.obj b :=
  A.map (homOfLE h)

end TauCetiRoadmap.TopologicalSheafCohomology
