import Mathlib
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Separation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Weight.Parabolic.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.TitsSystem

/-!
# Suggested interfaces for flag varieties

This file contains suggested forms, not an exhaustive checklist; the README is definitive.
The five headline classifications cannot yet be stated on their intended native carriers at
the pinned Tau Ceti revision. Their precise missing declarations are:

1. Standard parabolic ideal classification: `HopfIdeal.IsParabolicOverAlgClosed`, the actual
   reductive-group `TitsSystem` and its `standardParabolicOrderIso`/scheme bridge.
2. The uniqueness half for two smooth closed subgroups containing the same Borel is stated
   below on pinned Hopf ideals. The full classification still needs the parabolic predicate,
   the standard-parabolic bridge, unconditional Borel conjugacy and pointwise normalizer.
3. Projective `G/H` iff parabolic: the predicate and a represented homogeneous quotient scheme
   with projectivity, complete `G/B`, and complete-scheme Borel fixed point.
4. Classification of projective homogeneous schemes: the scheme action and stabilizer/quotient
   comparison and the ingredients of 2 and 3.
5. Equivariant morphism classification: represented `G/P_J` schemes, scheme-level equivariant
   morphisms, quotient descent and the ingredients of 1 and 2.

The declarations below type-check the available Hopf-ideal/point order boundary and the
concrete GL carrier. They introduce no point-set replacement for a scheme statement.
-/

open CategoryTheory

namespace TauCeti.FlagVarieties

universe u v w

/-- The order of geometric point subgroups reverses the order of their defining ideals. -/
theorem points_antitone {k : Type u} [Field k]
    (H : CommHopfAlgCat.{v} k) (A : CommAlgCat.{w} k) :
    Antitone (fun I : HopfIdeal k H =>
      CommHopfAlgCat.quotientPointsSubgroup H I A) := by
  exact CommHopfAlgCat.quotientPointsSubgroup_antitone H A

/-- Reduced finite-type closed subgroups are determined by algebraically closed points. -/
theorem reduced_ideals_eq_of_points_eq {k : Type u} [Field k]
    {K : Type w} [Field K] [Algebra k K] [IsAlgClosed K]
    {H : CommHopfAlgCat.{v} k} {I J : HopfIdeal k H}
    [Algebra.FiniteType k (CommHopfAlgCat.quotient H I)]
    [IsReduced (CommHopfAlgCat.quotient H I)]
    [Algebra.FiniteType k (CommHopfAlgCat.quotient H J)]
    [IsReduced (CommHopfAlgCat.quotient H J)]
    (h : CommHopfAlgCat.quotientPointsSubgroup H I (CommAlgCat.of k K) =
      CommHopfAlgCat.quotientPointsSubgroup H J (CommAlgCat.of k K)) : I = J := by
  exact HopfIdeal.eq_of_quotientPointsSubgroup_eq h

/-- Two smooth closed subgroups containing the chosen Borel cannot be distinct conjugates.
This is the uniqueness half of the parabolic conjugacy classification. -/
theorem conjugate_eq_of_borel_le {k : Type u} [Field k] [IsAlgClosed k]
    (G : FiniteTypeCommHopfAlgCat.{u, v} k)
    (hG_smooth : smoothCommHopfAlgProperty k G.obj)
    (hG_connected : geometricallyConnectedCommHopfAlgProperty k G.obj)
    (B P Q : HopfIdeal k G)
    (hB : HopfIdeal.IsBorelOverAlgClosed k G B)
    (hP_smooth : smoothCommHopfAlgProperty k
      (FiniteTypeCommHopfAlgCat.quotient G P).obj)
    (hQ_smooth : smoothCommHopfAlgProperty k
      (FiniteTypeCommHopfAlgCat.quotient G Q).obj)
    (hPB : P ≤ B) (hQB : Q ≤ B)
    (g : WithConv (G.obj →ₐ[k] k)) (hconj : Q = P.conjugate g) : P = Q := by
  sorry

#check GeneralLinear.weightParabolicDefiningHopfIdeal
#check glTitsSystem

end TauCeti.FlagVarieties
