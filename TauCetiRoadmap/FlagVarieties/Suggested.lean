module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Weight.Parabolic.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic
public import TauCeti.Algebra.AlgebraicGroup.Representation.ProjectiveOrbit.Quotient
public import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic

/-!
# Flag varieties: target signatures

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
The GL case of headline 1 is stated below using the pinned weight-parabolic Hopf ideal.
The general classifications need the following additional interfaces:

1. Standard parabolic ideal classification: the actual reductive-group `TitsSystem` on
   `G(k)` and the scheme bridge `P_J`.
2. The uniqueness half for two closed subgroups containing the same Borel is stated below
   for a geometrically connected affine group. The full conjugacy classification needs
   the reductive-group Tits system and the standard-parabolic scheme bridge.
4. Classification of projective homogeneous schemes: the scheme action and stabilizer/quotient
   comparison and the standard-parabolic scheme bridge.
5. Equivariant morphism classification: represented `G/P_J` schemes, scheme-level equivariant
   morphisms, quotient descent and the ingredients of 1 and 2.

Headline 3 is stated below using the native parabolic predicate and represented projective
orbit scheme.

The declarations use native Hopf ideals. They introduce no point-set replacement for a scheme
statement.
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

/-! ## Layer 4: projectivity and the homogeneous-space dictionary -/

/-- Headline 3: a smooth closed subgroup `H` of a smooth connected affine group is parabolic
exactly when the orbit scheme representing `G/H` is proper over `k`. -/
theorem isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed {k : Type u} [Field k]
    [IsAlgClosed k] (G : FiniteTypeCommHopfAlgCat.{u, u} k)
    (hG_smooth : smoothCommHopfAlgProperty k G.obj)
    (hG_connected : geometricallyConnectedCommHopfAlgProperty k G.obj)
    (H : HopfIdeal k G)
    (hH : smoothCommHopfAlgProperty k (FiniteTypeCommHopfAlgCat.quotient G H).obj)
    (M : FGComoduleCat.{u, u, u} k G) (m : M) (hm : Module.IsUnimodular k m)
    (e : CommHopfAlgCat.fppfHomogeneousQuotient G.obj H ≅
      Comodule.projectiveOrbitPointsSheaf (H := G.obj) m hm) :
    AlgebraicGeometry.IsProper (Comodule.projectiveOrbitToSpec (H := G) m hm) ↔
      HopfIdeal.IsParabolicOverAlgClosed k G H := by
  sorry

end TauCetiRoadmap.FlagVarieties
