module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Weight.Parabolic.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic
public import TauCeti.Algebra.AlgebraicGroup.Representation.ProjectiveOrbit.Quotient
public import TauCeti.Algebra.AlgebraicGroup.Representation.Stabilizer

/-!
# Flag varieties: target signatures

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
The GL case of headline 1 is stated below using the pinned weight-parabolic Hopf ideal.
The five general reductive-group classifications still need the following declarations:

1. Standard parabolic ideal classification: `HopfIdeal.IsParabolicOverAlgClosed`,
   the actual reductive-group `TitsSystem` on `G(k)`, the `B W_J B` classification of subgroups containing `B`, and the scheme bridge `P_J`.
2. The uniqueness half for two closed subgroups containing the same Borel is stated below
   for a geometrically connected affine group. The full classification needs the parabolic predicate,
   the standard-parabolic bridge, unconditional Borel conjugacy and pointwise normalizer.
3. Projective `G/H` iff parabolic: the predicate and a represented homogeneous quotient scheme
   with projectivity and complete-scheme Borel fixed point. Complete `G/B` is a target here.
4. Classification of projective homogeneous schemes: the scheme action and stabilizer/quotient
   comparison and the ingredients of 2 and 3.
5. Equivariant morphism classification: represented `G/P_J` schemes, scheme-level equivariant
   morphisms, quotient descent and the ingredients of 1 and 2.

The declarations use native Hopf ideals. They introduce no point-set replacement for a scheme
statement.

Layer 4.0(a)-(b) needs carriers absent at the pinned Tau Ceti: the complete-flag incidence
scheme `Fl(V)` over the product of quotient-rank Grassmannians, its universal subbundles,
and its Plücker–Segre morphism to the projective scheme of the prefix-wedge tensor module.
`Module.Grassmannian.scheme` exists, but the complete-flag scheme does not. The compatible
`FGComoduleCat.tensorFin` / `Comodule.flagExteriorPowers` carrier and
`Module.Basis.flagTensorVector` are in progress in TauCeti PR #33233, not at this pin.
The README specifies these constructions and their point comparisons; no substitute carrier
or conclusion-shaped structure is introduced here. Layer 4.0(c) can already be stated using
the pinned projective orbit scheme and its fppf sheaf of points.
-/

public section

open CategoryTheory TauCeti

namespace TauCetiRoadmap.FlagVarieties

universe u v

/-! ## Layer 1: the GL case -/

/-- The block weight for a subset of the adjacent simple-root indices. -/
noncomputable def standardWeight {n : ℕ} (J : Set (Fin n))
    (i : Fin (n + 1)) : ℤ := by
  classical
  exact - ((Finset.univ.filter (fun j : Fin n => (j : ℕ) < (i : ℕ) ∧ j ∉ J)).card : ℤ)

/-- Every reduced standard parabolic ideal of `GL_{n+1}` has a unique block weight. -/
theorem exists_unique_standardWeight_eq {k : Type u} [Field k] [IsAlgClosed k] (n : ℕ)
    (I : HopfIdeal k (GeneralLinear.coordinateHopfAlgebra k (n + 1)))
    (hIB : I ≤ GeneralLinear.UpperTriangular.definingHopfIdeal k (n + 1))
    [IsReduced (CommHopfAlgCat.quotient (GeneralLinear.coordinateHopfAlgebra k (n + 1)) I)] :
    ∃! J : Finset (Fin n),
      I = GeneralLinear.weightParabolicDefiningHopfIdeal k (standardWeight (J : Set (Fin n))) := by
  sorry

/-- Two closed subgroups containing the chosen Borel cannot be distinct conjugates.
This is the uniqueness half of the parabolic conjugacy classification. -/
theorem conjugate_eq_of_borel_le {k : Type u} [Field k] [IsAlgClosed k]
    (G : FiniteTypeCommHopfAlgCat.{u, v} k)
    (hG_connected : geometricallyConnectedCommHopfAlgProperty k G.obj)
    (B P Q : HopfIdeal k G)
    (hB : HopfIdeal.IsBorelOverAlgClosed k G B)
    (hPB : P ≤ B) (hQB : Q ≤ B)
    (g : WithConv (G.obj →ₐ[k] k)) (hconj : Q = P.conjugate g) : P = Q := by
  sorry

/-! ## Layer 4: complete G/B -/

/-- A Borel is the scheme-theoretic line stabilizer in a finite-dimensional representation
with closed projective orbit. That orbit is proper and represents the native fppf quotient.
This is Layer 4.0(c), with no reductivity hypothesis. -/
theorem exists_closed_projectiveOrbit_borel_quotient {k : Type u} [Field k] [IsAlgClosed k]
    (G : FiniteTypeCommHopfAlgCat.{u, u} k)
    (hG_smooth : smoothCommHopfAlgProperty k G.obj)
    (hG_connected : geometricallyConnectedCommHopfAlgProperty k G.obj)
    (B : HopfIdeal k G) (hB : HopfIdeal.IsBorelOverAlgClosed k G B) :
    ∃ (M : FGComoduleCat.{u, u, u} k G) (m : M) (hm : Module.IsUnimodular k m),
      (Submodule.span k {m}).stabilizerHopfIdeal G = B ∧
      IsClosed (Set.range (Comodule.projectiveOrbitMap (H := G) m hm)) ∧
      AlgebraicGeometry.IsProper (Comodule.projectiveOrbitToSpec (H := G) m hm) ∧
      Nonempty (CommHopfAlgCat.fppfHomogeneousQuotient G.obj B ≅
        Comodule.projectiveOrbitPointsSheaf (H := G.obj) m hm) := by
  sorry

end TauCetiRoadmap.FlagVarieties
