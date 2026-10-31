import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Two braid-square quotients: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Generator squares and squares of all braids generate different normal subgroups.
-/
noncomputable section
namespace BraidSquareQuotientTargets
open TauCeti Equiv

def Ngen (n : ℕ) : Subgroup (BraidGroup n) :=
  Subgroup.normalClosure (Set.range fun i : Fin (n-1) ↦ (BraidGroup.sigma i)^2)

def Nall (n : ℕ) : Subgroup (BraidGroup n) :=
  Subgroup.normalClosure (Set.range fun b : BraidGroup n ↦ b^2)

instance (n : ℕ) : (Ngen n).Normal := by unfold Ngen; infer_instance
instance (n : ℕ) : (Nall n).Normal := by unfold Nall; infer_instance

def parity (n : ℕ) : BraidGroup n →* Multiplicative (ZMod 2) :=
  BraidGroup.lift (fun _ ↦ Multiplicative.ofAdd (1 : ZMod 2))
    (by intros; rfl) (by intros; rfl)

theorem parity_sigma {n : ℕ} (i : Fin (n-1)) :
    parity n (BraidGroup.sigma i) = Multiplicative.ofAdd (1 : ZMod 2) := by
  simp [parity]

theorem generator_squares_le_all_squares (n : ℕ) : Ngen n ≤ Nall n := by
  apply Subgroup.normalClosure_mono
  rintro _ ⟨i, rfl⟩
  exact ⟨BraidGroup.sigma i, rfl⟩

theorem generator_square_kernel (n : ℕ) : Ngen n = BraidGroup.pureSubgroup n := by sorry

theorem generator_square_quotient (n : ℕ) :
    ∃ e : (BraidGroup n ⧸ Ngen n) ≃* Perm (Fin n),
      ∀ i : Fin (n-1), e (QuotientGroup.mk' (Ngen n) (BraidGroup.sigma i)) =
        BraidGroup.transposition i := by sorry

theorem parity_exponentSum (n : ℕ) (b : BraidGroup n) :
    Multiplicative.toAdd (parity n b) =
      ((Multiplicative.toAdd (ArtinGroup.exponentSum (CoxeterMatrix.A (n-1)) b) : ℤ) : ZMod 2) := by
  sorry

theorem all_squares_kernel (n : ℕ) : Nall n = (parity n).ker := by sorry

theorem all_square_quotient (n : ℕ) (hn : 2 ≤ n) :
    ∃ e : (BraidGroup n ⧸ Nall n) ≃* Multiplicative (ZMod 2),
      ∀ b : BraidGroup n, e (QuotientGroup.mk' (Nall n) b) = parity n b := by sorry

def first (m : ℕ) : Fin (m+3-1) := ⟨0, by omega⟩
def second (m : ℕ) : Fin (m+3-1) := ⟨1, by omega⟩
def squareWitness (m : ℕ) : BraidGroup (m+3) :=
  (BraidGroup.sigma (first m) * BraidGroup.sigma (second m))^2

theorem squareWitness_separates (m : ℕ) :
    squareWitness m ∉ Ngen (m+3) ∧ squareWitness m ∈ Nall (m+3) := by sorry

theorem finite_three_cycle_square :
    ((swap (0 : Fin 3) 1 * swap 1 2)^2 : Perm (Fin 3)) ≠ 1 := by decide +kernel

theorem disjoint_B4_generators :
    BraidGroup.sigma (n := 4) 0 * BraidGroup.sigma 2 =
      BraidGroup.sigma 2 * BraidGroup.sigma 0 :=
  BraidGroup.sigma_mul_sigma_comm (Or.inl (by decide))

end BraidSquareQuotientTargets
