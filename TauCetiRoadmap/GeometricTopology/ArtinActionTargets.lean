import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.Algebra.Group.End
import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup

/-!
# Artin actions and boundary-marked complement groups

**This file is advisory, not the specification or an exhaustive checklist.**
See the GT4 Artin-action prefix in `README.md`. The elementary automorphism
and its inverse are concrete free-group maps. The braid relations and
faithfulness are future proof targets. Boundary markings use the opposite
of native `FundamentalGroup`, so word multiplication traverses paths from
left to right. Pullback from the top marking to the bottom marking then
has the native automorphism multiplication convention.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.GeometricTopology.ArtinActionTargets

open TauCeti

section Generators

variable {ι : Type*} [DecidableEq ι]

def forwardImage (a b j : ι) : FreeGroup ι :=
  if j = a then FreeGroup.of a * FreeGroup.of b * (FreeGroup.of a)⁻¹
  else if j = b then FreeGroup.of a else FreeGroup.of j

def backwardImage (a b j : ι) : FreeGroup ι :=
  if j = a then FreeGroup.of b
  else if j = b then (FreeGroup.of b)⁻¹ * FreeGroup.of a * FreeGroup.of b
  else FreeGroup.of j

def forward (a b : ι) : FreeGroup ι →* FreeGroup ι := FreeGroup.lift (forwardImage a b)
def backward (a b : ι) : FreeGroup ι →* FreeGroup ι := FreeGroup.lift (backwardImage a b)

def hurwitz (a b : ι) (h : a ≠ b) : MulAut (FreeGroup ι) :=
  (forward a b).toMulEquiv (backward a b)
    (by
      apply FreeGroup.ext_hom
      intro j
      by_cases ha : j = a
      · subst j
        simp [forward, backward, forwardImage, backwardImage, Ne.symm h, mul_assoc]
      · by_cases hb : j = b
        · subst j
          simp [forward, backward, forwardImage, backwardImage, Ne.symm h]
        · simp [forward, backward, forwardImage, backwardImage, ha, hb])
    (by
      apply FreeGroup.ext_hom
      intro j
      by_cases ha : j = a
      · subst j
        simp [forward, backward, forwardImage, backwardImage, Ne.symm h]
      · by_cases hb : j = b
        · subst j
          simp [forward, backward, forwardImage, backwardImage, Ne.symm h, mul_assoc]
        · simp [forward, backward, forwardImage, backwardImage, ha, hb])

end Generators

variable {n : ℕ}

def generator (i : Fin (n - 1)) : MulAut (FreeGroup (Fin n)) :=
  hurwitz (BraidGroup.strand i) (BraidGroup.strandSucc i) (BraidGroup.strand_ne_strandSucc i)

theorem generators_commute {i j : Fin (n - 1)}
    (h : (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) : generator i * generator j = generator j * generator i := by
  sorry

theorem generators_braid {i j : Fin (n - 1)}
    (h : (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i) :
    generator i * generator j * generator i = generator j * generator i * generator j := by
  sorry

def artin (n : ℕ) : BraidGroup n →* MulAut (FreeGroup (Fin n)) :=
  BraidGroup.lift generator generators_commute generators_braid

@[simp]
theorem artin_sigma (i : Fin (n - 1)) : artin n (BraidGroup.sigma i) = generator i :=
  BraidGroup.lift_sigma _ _ _ i

theorem artin_injective (n : ℕ) : Function.Injective (artin n) := by
  sorry

def boundaryWord (n : ℕ) : FreeGroup (Fin n) := (List.ofFn FreeGroup.of).prod

/-- This is a stated equation and peripheral condition, not an opaque property. -/
def PreservesPeripheralBoundary (φ : MulAut (FreeGroup (Fin n))) : Prop :=
  φ (boundaryWord n) = boundaryWord n ∧
    ∃ π : Equiv.Perm (Fin n), ∀ j, ∃ w : FreeGroup (Fin n),
      φ (FreeGroup.of j) = w * FreeGroup.of (π j) * w⁻¹

section BoundaryMarkings

variable (n : ℕ) (X : Type*) [TopologicalSpace X] (p : X)

structure BoundaryMarking where
  bottom : FreeGroup (Fin n) ≃* MulOpposite (FundamentalGroup X p)
  top : FreeGroup (Fin n) ≃* MulOpposite (FundamentalGroup X p)

noncomputable def BoundaryMarking.transport (m : BoundaryMarking n X p) : MulAut (FreeGroup (Fin n)) :=
  m.top.trans m.bottom.symm

variable {n X p} {Y : Type*} [TopologicalSpace Y] {q : Y}

theorem transport_eq_of_marked_equivalence (m : BoundaryMarking n X p)
    (m' : BoundaryMarking n Y q)
    (e : MulOpposite (FundamentalGroup X p) ≃* MulOpposite (FundamentalGroup Y q))
    (hb : m.bottom.trans e = m'.bottom) (ht : m.top.trans e = m'.top) :
    m.transport = m'.transport := by
  rw [BoundaryMarking.transport, BoundaryMarking.transport, ← hb, ← ht]
  ext g
  simp

end BoundaryMarkings

end TauCetiRoadmap.GeometricTopology.ArtinActionTargets
