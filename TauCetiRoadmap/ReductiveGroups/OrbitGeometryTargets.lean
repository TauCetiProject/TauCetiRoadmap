import TauCetiRoadmap.ReductiveGroups.Suggested
import Mathlib.CategoryTheory.Monoidal.Cartesian.Mod
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp
import Mathlib.CategoryTheory.Monoidal.Cartesian.Over
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.Topology.KrullDimension

/-!
# Generic algebraic orbit geometry: illustrative targets

README Layer3A is definitive and not exhausted by this file. Native ModObj,
group objects, schemes, their points, immersions and Krull dimension are used
directly. No quotient-representability or reductive-classification premise is
used. Every sorry below is a proof target, not an implemented theorem.
The concrete point-topology formula below is the affine-chart presentation to
compare with ComplexComparisonPartII C−1.1, not a new analytification engine.
-/

open CategoryTheory MonoidalCategory CartesianMonoidalCategory AlgebraicGeometry
open scoped CategoryTheory.MonObj
open Topology

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace TauCetiRoadmap.ReductiveGroups.OrbitGeometry

universe u v

section Cartesian
variable {C : Type u} [Category.{v} C] [CartesianMonoidalCategory C]

abbrev Points (X : C) := (𝟙_ C ⟶ X)

def constant (Y : C) {X : C} (x : Points X) : Y ⟶ X := toUnit Y ≫ x

variable (G X : C) [GrpObj G] [ModObj G X]

def orbitMorphism (x : Points X) : G ⟶ X :=
  lift (𝟙 G) (constant G x) ≫ γ[G, X]

def translation (g : Points G) : X ⟶ X :=
  lift (constant X g) (𝟙 X) ≫ γ[G, X]

theorem point_orbitMorphism (x : Points X) (g : Points G) :
    g ≫ orbitMorphism G X x = g • x := by sorry

theorem translation_inverse (g : Points G) :
    translation G X g ≫ translation G X g⁻¹ = 𝟙 X := by sorry

theorem translation_point (g : Points G) (x : Points X) :
    x ≫ translation G X g = g • x := by sorry
end Cartesian

section Algebraic
variable {k : Type u} [Field k]
variable (G X : Over (Spec (CommRingCat.of k))) [GrpObj G] [ModObj G X]

noncomputable def pointLocation (x : Points X) : X.left :=
  x.left (IsLocalRing.closedPoint k)

noncomputable def geometricOrbit (x : Points X) : Set X.left :=
  Set.range fun z : G.left => (orbitMorphism G X x).left z

noncomputable def orbitClosure (x : Points X) : Set X.left := closure (geometricOrbit G X x)

noncomputable def orbitBoundary (x : Points X) : Set X.left :=
  orbitClosure G X x \ geometricOrbit G X x

noncomputable def orbitDimension (x : Points X) : WithBot ℕ∞ :=
  topologicalKrullDim (geometricOrbit G X x)


/-- New finite-type-to-orbit-map adapter; Chevalley itself is already native. -/
theorem orbitMorphism_finitePresentation
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    LocallyOfFinitePresentation (orbitMorphism G X x).left ∧
      QuasiCompact (orbitMorphism G X x).left := by sorry

/-- Exact point-image dictionary, using closed-point fibres over algebraically closed k. -/
theorem point_mem_geometricOrbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x y : Points X) :
    pointLocation X y ∈ geometricOrbit G X x ↔ ∃ g : Points G, g • x = y := by sorry

theorem orbit_open_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsOpen ((Subtype.val : orbitClosure G X x → X.left) ⁻¹'
      geometricOrbit G X x) := by sorry

theorem orbit_locallyClosed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsLocallyClosed (geometricOrbit G X x) := by sorry

/-- Actual reduced scheme model; no arbitrary carrier or quotient data assumed. -/
theorem exists_reduced_orbit_model
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ (O : Over (Spec (CommRingCat.of k))) (i : O ⟶ X),
      AlgebraicGeometry.IsReduced O.left ∧ IsImmersion i.left ∧
      Set.range i.left = geometricOrbit G X x := by sorry

theorem orbit_dimension_finite
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ d : ℕ, orbitDimension G X x = (d : WithBot ℕ∞) := by sorry

/-- Full finite-component case: no ConnectedSpace G or irreducible-closure premise. -/
theorem boundary_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    topologicalKrullDim (orbitBoundary G X x) < orbitDimension G X x := by sorry

theorem boundary_orbit_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x y : Points X)
    (hy : pointLocation X y ∈ orbitBoundary G X x) :
    orbitDimension G X y < orbitDimension G X x := by sorry

theorem exists_closed_orbit_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) ∧
      geometricOrbit G X y ⊆ orbitClosure G X x := by sorry

theorem exists_closed_orbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (hx : Nonempty (Points X)) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) := by sorry

theorem minimal_dimension_orbit_closed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X)
    (hmin : ∀ y : Points X, orbitDimension G X x ≤ orbitDimension G X y) :
    IsClosed (geometricOrbit G X x) := by sorry

end Algebraic

section ComplexPoints

noncomputable def affinePointEval (Y : Over (Spec (CommRingCat.of ℂ))) (y : Points Y)
    (f : Γ(Y.left, ⊤)) : ℂ :=
  (Scheme.ΓSpecIso (CommRingCat.of ℂ)).hom.hom (y.left.appTop.hom f)

/-- Affine open chart images of inverse images of complex-open sets by regular functions. -/
def classicalPointSubbasis (X : Over (Spec (CommRingCat.of ℂ))) : Set (Set (Points X)) :=
  {U | ∃ (Y : Over (Spec (CommRingCat.of ℂ))) (j : Y ⟶ X), IsOpenImmersion j.left ∧ IsAffine Y.left ∧
    ∃ (f : Γ(Y.left, ⊤)) (W : Set ℂ), IsOpen W ∧
      U = {x | ∃ y : Points Y, y ≫ j = x ∧ affinePointEval Y y f ∈ W}}

@[instance_reducible] def classicalPointTopology (X : Over (Spec (CommRingCat.of ℂ))) : TopologicalSpace (Points X) :=
  TopologicalSpace.generateFrom (classicalPointSubbasis X)

/-- The actual properness-to-compactness comparison cut of CC C−1.1. -/
theorem compact_complexPoints (X : Over (Spec (CommRingCat.of ℂ)))
    [IsProper X.hom] :
    @CompactSpace (Points X) (classicalPointTopology X) := by sorry

theorem hausdorff_complexPoints (X : Over (Spec (CommRingCat.of ℂ)))
    [LocallyOfFiniteType X.hom] [IsSeparated X.hom] :
    @T2Space (Points X) (classicalPointTopology X) := by sorry

/-- Proper ambient space plus a closed geometric orbit; no claim for an open projective orbit. -/
theorem compact_closed_orbit_points (G X : Over (Spec (CommRingCat.of ℂ))) [GrpObj G] [ModObj G X]
    [IsAffine G.left] [Smooth G.hom] [QuasiCompact G.hom]
    [IsProper X.hom]
    (x : Points X) (hclosed : IsClosed (geometricOrbit G X x)) :
    @IsCompact (Points X) (classicalPointTopology X)
      {y | pointLocation X y ∈ geometricOrbit G X x} := by sorry

end ComplexPoints
end TauCetiRoadmap.ReductiveGroups.OrbitGeometry
