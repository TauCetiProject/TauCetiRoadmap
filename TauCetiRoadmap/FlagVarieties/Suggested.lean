module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Weight.Parabolic.Basic
public import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic

/-!
# Flag varieties: target signatures

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
The GL case of headline 1 is stated below using the pinned weight-parabolic Hopf ideal.
The five general reductive-group classifications still need the following declarations:

1. Standard parabolic ideal classification: `HopfIdeal.IsParabolicOverAlgClosed`, the actual
   reductive-group `TitsSystem` and its `standardParabolicOrderIso`/scheme bridge.
2. The uniqueness half for two closed subgroups containing the same Borel is stated below
   for a geometrically connected affine group. The full classification needs the parabolic predicate,
   the standard-parabolic bridge, unconditional Borel conjugacy and pointwise normalizer.
3. Projective `G/H` iff parabolic: the predicate and a represented homogeneous quotient scheme
   with projectivity, complete `G/B`, and complete-scheme Borel fixed point.
4. Classification of projective homogeneous schemes: the scheme action and stabilizer/quotient
   comparison and the ingredients of 2 and 3.
5. Equivariant morphism classification: represented `G/P_J` schemes, scheme-level equivariant
   morphisms, quotient descent and the ingredients of 1 and 2.

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

end TauCetiRoadmap.FlagVarieties
