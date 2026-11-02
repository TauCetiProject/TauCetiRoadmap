import Mathlib
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`.

Stated here, because every carrier exists at the pins: Layer 3A's locally closed reduced
orbits, strict boundary dimension and closed-orbit existence; Layer 6's characteristic-zero
implication from reductivity to linear reductivity (the pin proves the converse,
`TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`);
Layer 7's conjugacy of Borel subgroups over an algebraically closed field; and the SL
coordinate presentation of the worked examples.

Not statable at the pins, hence not stated, with the missing carrier named:
* Layers 0–1: the category of rational algebraic group representations and its comparison
  functors with comodules. The native Hopf/points dictionary, the embedding theorem
  (`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`) and the Tannakian
  reconstruction of the points functor are supplied, so Layer 1 states no theorem here.
* Layers 3 and 6B: representability of homogeneous quotients. The fppf homogeneous quotient
  sheaf of an affine group by any closed subgroup
  (`CommHopfAlgCat.fppfHomogeneousQuotient`), its torsor structure and the coinvariant
  subalgebra (`TauCeti.HopfIdeal.coinvariants`) exist at the pin. Layer 6B's Matsushima theorem,
  that for reductive `G ⊃ H` over `ℂ` this sheaf is `Spec` of the coinvariants, is not stated:
  the fppf sheaf of points of an affine scheme on the site `CommAlgCat.fppfTopology`, and the
  comparison map from the quotient sheaf to it, are Layer 0 and Layer 3 constructions, not
  pinned carriers.
* Layers 4–5 and 7–8: diagonalizable groups and tori as objects, unipotent radicals, parabolic
  and Levi subgroup functors, and the root datum extracted from a group: no carrier.
* Layer 9: a pinned reductive group with its extracted root datum; the full-root-datum
  Chevalley realization and its ordered PBW family (the native Kostant subring alone does not
  specify these); signed ADE cover Lie algebras and their folded fixed algebras.
* Layer 10: rational highest-weight modules, Weyl and induced modules, and their distribution
  actions on the constructed group.
* Layer 11: the regular-semisimple Lie locus, its Weyl quotient and the comparison with based
  spectral monodromy; and 11B's finite Weyl-arrangement theorem `π₁(V_reg/W) ≃ ArtinGroup`.
  For 11B the group side exists (`TauCeti.ArtinGroup`, `coxeterMatrixOfBase`,
  `rootPairingBaseChange`); the missing carrier is the `W`-action on the complexified
  root-hyperplane complement and its quotient. Bare scalar or abstract-cover surrogates do not
  state these endpoints. The complex orbit comparison of 3A.5 needs the complex-manifold
  charts on complex points that 3A.5 constructs, not a second point topology.
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

/-! ## Layer 6: reductive and semisimple groups -/

namespace StructureAcceptance

universe v

/-- In characteristic zero a reductive group is linearly reductive: every finite-dimensional
comodule over the coordinate Hopf algebra of a smooth, geometrically connected, finite-type
affine group with trivial geometric unipotent radical is completely reducible (Milne,
Algebraic Groups, Theorem 22.42). The converse implication is proved at the pin by
`TauCeti.reductiveCommHopfAlgProperty.of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive`. -/
theorem linearlyReductive_of_reductive {k : Type v} [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (h : TauCeti.reductiveCommHopfAlgProperty k H) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj := by
  sorry

/-! ## Layer 7: structure theory -/

/-- Over an algebraically closed field (a conjunct of the Borel predicate), any two Borel
subgroups of a finite-type affine group are conjugate by a rational point: the Hopf ideal
of one is the conjugate of the Hopf ideal of the other (Milne, Algebraic Groups,
Theorem 17.10). -/
theorem exists_conjugate_eq_of_isBorelOverAlgClosed {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) (I J : TauCeti.HopfIdeal k H)
    (hI : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H I)
    (hJ : TauCeti.HopfIdeal.IsBorelOverAlgClosed k H J) :
    ∃ g : WithConv (H →ₐ[k] k), J = I.conjugate g := by
  sorry

end StructureAcceptance

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
