import Mathlib
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline
theorems against the pinned Mathlib and Tau Ceti APIs.

Layer 3A's locally closed reduced orbits, strict boundary dimension and closed-orbit
existence, and the SL coordinate presentation in the worked examples are statable.
The remaining endpoints require carriers whose construction is part of the roadmap:
* Layers 0–1: the category of rational algebraic group representations and its
  comparison functors (the native Hopf and comodule reconstruction is already supplied).
* Layers 2–8: represented homogeneous quotients,
  unipotent radicals, extracted root data and rational parabolic/Levi functors.
* Layer 9: a pinned reductive group with its extracted datum; the full-root-datum Chevalley realization and its ordered PBW family
  (the native Kostant subring alone does not specify these); signed ADE cover Lie algebras and
  their folded fixed algebras. These heavy constructions are not encoded here.
* Layer 10: rational highest-weight modules, Weyl and induced modules, and their
  distribution actions on the constructed group.
* Layer 11: the regular-semisimple Lie locus, its Weyl quotient and the comparison
  with based spectral monodromy. Bare scalar or abstract-cover surrogates do not
  state this endpoint. The complex orbit comparison also needs the supplier's
  scheme analytification functor, not a second point topology.
-/

open CategoryTheory MonoidalCategory CartesianMonoidalCategory AlgebraicGeometry
open scoped CategoryTheory.MonObj
open Topology

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace TauCetiRoadmap.ReductiveGroups

/-! ## Layer 3A: algebraic orbit geometry -/

namespace OrbitAcceptance

universe u

/-- Rational points as morphisms from the terminal scheme over the base field. -/
abbrev Points {k : Type u} [Field k] (X : Over (Spec (CommRingCat.of k))) :=
  (𝟙_ (Over (Spec (CommRingCat.of k))) ⟶ X)

variable {k : Type u} [Field k]
variable (G X : Over (Spec (CommRingCat.of k))) [GrpObj G] [ModObj G X]

/-- The orbit map sends g to g acting on the specified rational point x. -/
noncomputable def orbitMorphism (x : Points X) : G ⟶ X :=
  lift (𝟙 G) (toUnit G ≫ x) ≫ γ[G, X]

/-- The geometric orbit is the image on all scheme points of the orbit morphism. -/
def geometricOrbit (x : Points X) : Set X.left :=
  Set.range fun z : G.left => (orbitMorphism G X x).left z

/-- The closure is taken in the Zariski space of X. -/
def orbitClosure (x : Points X) : Set X.left := closure (geometricOrbit G X x)

/-- The boundary removes the entire geometric orbit from its closure. -/
def orbitBoundary (x : Points X) : Set X.left :=
  orbitClosure G X x \ geometricOrbit G X x

/-- Orbit dimension uses native topological Krull dimension, with empty dimension bottom. -/
noncomputable def orbitDimension (x : Points X) : WithBot ℕ∞ :=
  topologicalKrullDim (geometricOrbit G X x)

/-- Every orbit of a smooth affine algebraic group on a separated finite-type scheme is locally closed. -/
theorem orbit_locallyClosed
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    IsLocallyClosed (geometricOrbit G X x) := by sorry

/-- Each geometric orbit has a reduced locally closed scheme model over the base field. -/
theorem exists_reduced_orbit_model
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ (O : Over (Spec (CommRingCat.of k))) (i : O ⟶ X),
      AlgebraicGeometry.IsReduced O.left ∧ IsImmersion i.left ∧
      Set.range i.left = geometricOrbit G X x := by sorry

/-- The boundary has strictly smaller Krull dimension, including disconnected acting groups. -/
theorem boundary_dimension_lt
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    topologicalKrullDim (orbitBoundary G X x) < orbitDimension G X x := by sorry

/-- Every orbit closure contains a closed orbit over an algebraically closed field. -/
theorem exists_closed_orbit_in_closure
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (x : Points X) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) ∧
      geometricOrbit G X y ⊆ orbitClosure G X x := by sorry

/-- A nonempty rational-point space has a closed orbit; the empty space is excluded. -/
theorem exists_closed_orbit
    [hAlgClosed : IsAlgClosed k]
    [hAffine : IsAffine G.left] [hSmooth : Smooth G.hom]
    [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom]
    [hXQC : QuasiCompact X.hom] [hSeparated : IsSeparated X.hom] (hx : Nonempty (Points X)) :
    ∃ y : Points X, IsClosed (geometricOrbit G X y) := by sorry

end OrbitAcceptance

/-! ## Layer 9: the special linear coordinate presentation -/

namespace SpecialLinearAcceptance

/-- The integral generic determinant minus one, including the empty determinant at rank zero. -/
noncomputable def determinantRelation (n : ℕ) : MvPolynomial (Fin n × Fin n) ℤ :=
  Matrix.det (fun i j => MvPolynomial.X (i, j)) - 1

/-- The native determinant-kernel Hopf algebra has the polynomial presentation of SL,
with its matrix coordinates identified in both directions. -/
theorem exists_coordinatePresentation (n : ℕ) :
    ∃ e : TauCeti.SpecialLinear.coordinateHopfAlgebra ℤ n ≃ₐ[ℤ]
      (MvPolynomial (Fin n × Fin n) ℤ) ⧸ Ideal.span {determinantRelation n},
      (∀ i j, e ((TauCeti.SpecialLinear.coordinateMap ℤ n).hom
          (TauCeti.GeneralLinear.genericMatrix ℤ n i j)) =
        Ideal.Quotient.mk (Ideal.span {determinantRelation n}) (MvPolynomial.X (i, j))) ∧
      (∀ i j, e.symm
          (Ideal.Quotient.mk (Ideal.span {determinantRelation n}) (MvPolynomial.X (i, j))) =
        (TauCeti.SpecialLinear.coordinateMap ℤ n).hom
          (TauCeti.GeneralLinear.genericMatrix ℤ n i j)) := by
  sorry

end SpecialLinearAcceptance
end TauCetiRoadmap.ReductiveGroups
