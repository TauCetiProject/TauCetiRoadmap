import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Data.Finset.Max

/-!
These are suggested forms for selected targets, not an exhaustive checklist.
The README is definitive. These native algebraic data do not stand in for the
geometric strand-deletion, longitude, closure or HOMFLY comparison targets.
-/

namespace TauCetiRoadmap.GeometricTopology.BrunnianBraidTargets

/-- Right-nested commutator, with a singleton interpreted as its generator. -/
def nestedWord {α : Type*} : List α → FreeGroup α
  | [] => 1
  | [i] => FreeGroup.of i
  | i :: j :: rest =>
      FreeGroup.of i * nestedWord (j :: rest) *
        (FreeGroup.of i)⁻¹ * (nestedWord (j :: rest))⁻¹

/-- Kill one generator, retaining the other labels in the same free group. -/
def killGenerator {α : Type*} [DecidableEq α] (i : α) : FreeGroup α →* FreeGroup α :=
  FreeGroup.lift (fun j => if j = i then 1 else FreeGroup.of j)

theorem kill_nestedWord {α : Type*} [DecidableEq α] (i : α) (l : List α)
    (hi : i ∈ l) : killGenerator i (nestedWord l) = 1 := by
  sorry

theorem nestedWord_ne_one {α : Type*} (l : List α)
    (hne : l ≠ []) (hnd : l.Nodup) : nestedWord l ≠ 1 := by
  sorry

/-- The conjugating word σ_(n-2) … σ_(i+1), with zero-based native indices. -/
def lastStrandConjugator {n : ℕ} (i : Fin (n - 1)) : TauCeti.BraidGroup n :=
  (((List.finRange (n - 1)).filter (fun j => i.val < j.val)).reverse.map
    (fun j => TauCeti.BraidGroup.sigma j)).prod

/-- The standard pure generator joining strand i to the last strand. -/
def lastStrandGenerator {n : ℕ} (i : Fin (n - 1)) : TauCeti.BraidGroup n :=
  lastStrandConjugator i * TauCeti.BraidGroup.sigma i ^ 2 *
    (lastStrandConjugator i)⁻¹

/-- The specified family of actual native Artin braid elements. -/
def milnorBraid (n : ℕ) : TauCeti.BraidGroup n :=
  FreeGroup.lift (lastStrandGenerator (n := n))
    (nestedWord (List.finRange (n - 1)))

theorem milnorBraid_mem_pure (n : ℕ) :
    milnorBraid n ∈ TauCeti.BraidGroup.pureSubgroup n := by
  sorry

/-- l-breadth of an actual Laurent polynomial whose coefficients are Laurent in m. -/
noncomputable def lBreadth (p : LaurentPolynomial (LaurentPolynomial ℤ)) : ℤ :=
  if h : p.coeff.support.Nonempty then p.coeff.support.max' h - p.coeff.support.min' h else 0

theorem lBreadth_le_of_support_bounds
    (p : LaurentPolynomial (LaurentPolynomial ℤ)) (hp : p ≠ 0)
    (lo hi : ℤ) (hbound : ∀ k ∈ p.coeff.support, lo ≤ k ∧ k ≤ hi) :
    lBreadth p ≤ hi - lo := by
  sorry

end TauCetiRoadmap.GeometricTopology.BrunnianBraidTargets
