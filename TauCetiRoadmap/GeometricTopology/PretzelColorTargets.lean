import Mathlib
import TauCeti.GroupTheory.Perm.SwapFactors

/-!
# Pretzel transposition colors: suggested interfaces

This file is not the roadmap and is not exhaustive; the README is definitive.
Integer twist conventions and finite permutations are
explicit; comparison with realized pretzel diagrams remains a geometric target.
-/
noncomputable section
namespace PretzelColorTargets
open Equiv

variable {G : Type*} [Group G]

/-- Positive Hurwitz twist: left strand acts on right by native conjugation. -/
def hurwitz : Perm (G × G) where
  toFun v := (v.1 * v.2 * v.1⁻¹, v.1)
  invFun v := (v.2, v.2⁻¹ * v.1 * v.2)
  left_inv := by rintro ⟨x,y⟩; simp [mul_assoc]
  right_inv := by rintro ⟨x,y⟩; simp [mul_assoc]

def closedTwist (p : ℤ) (x y : G) : G × G :=
  ((x*y)^p*x, (x*y)^(p-1)*x)

theorem twist_all_integers (x y : G) (hx : x^2=1) (hy : y^2=1) (p : ℤ) :
    (hurwitz ^ p) (x,y) = closedTwist p x y := by sorry

theorem twist_recurrence (x y : G) (hx : x^2=1) (hy : y^2=1) (p : ℤ) :
    closedTwist (p+1) x y = hurwitz (closedTwist p x y) := by sorry

def Consistent (p q r : ℤ) (x y z : G) : Prop :=
  (x*y)^p*x = (z*x)^(r-1)*z ∧ (z*x)^r*z = (y*z)^(q-1)*y

instance (p q r : ℤ) (x y z : G) [DecidableEq G] :
    Decidable (Consistent p q r x y z) := inferInstanceAs (Decidable (_ ∧ _))

theorem third_equation (p q r : ℤ) (x y z : G)
    (hx : x^2=1) (hy : y^2=1) (hz : z^2=1)
    (h : Consistent p q r x y z) : (y*z)^q*y = (x*y)^(p-1)*x := by sorry

abbrev S4 := Perm (Fin 4)
def starX : S4 := swap 0 1
def starY : S4 := swap 0 2
def starZ : S4 := swap 0 3
def pathX : S4 := swap 0 1
def pathY : S4 := swap 1 2
def pathZ : S4 := swap 2 3

def topSubgroup (x y z : S4) : Subgroup S4 := Subgroup.closure ({x,y,z} : Set S4)

theorem star_path_swaps :
    starX.IsSwap ∧ starY.IsSwap ∧ starZ.IsSwap ∧
    pathX.IsSwap ∧ pathY.IsSwap ∧ pathZ.IsSwap := by
  unfold Perm.IsSwap
  decide +kernel

theorem star_path_generates :
    topSubgroup starX starY starZ = ⊤ ∧ topSubgroup pathX pathY pathZ = ⊤ := by sorry

/-- Exhaustion of finite residue cases for each fixed ordering of the incoming labels. -/
theorem star_residue_certificate : ∀ p q r : Fin 6,
    Consistent (p:ℕ) (q:ℕ) (r:ℕ) starX starY starZ ↔
      p.val % 3 = 0 ∧ q.val % 3 = 0 ∧ r.val % 3 = 0 := by
  decide +kernel

theorem path_residue_certificate : ∀ p q r : Fin 6,
    Consistent (p:ℕ) (q:ℕ) (r:ℕ) pathX pathY pathZ ↔
      p.val % 3 = 0 ∧ q.val % 3 = 0 ∧ r.val % 2 = 0 := by
  decide +kernel

theorem consistency_mod_six (p q r : ℤ) (x y z : S4)
    (hx : x.IsSwap) (hy : y.IsSwap) (hz : z.IsSwap) :
    Consistent p q r x y z ↔ Consistent (p%6) (q%6) (r%6) x y z := by sorry

def S4Criterion (p q r : ℤ) : Prop :=
  (3 ∣ p ∧ 3 ∣ q ∧ 3 ∣ r) ∨
  (3 ∣ p ∧ 3 ∣ q ∧ 2 ∣ r) ∨
  (3 ∣ q ∧ 3 ∣ r ∧ 2 ∣ p) ∨
  (3 ∣ r ∧ 3 ∣ p ∧ 2 ∣ q)

def HasImageOrder (p q r : ℤ) (m : ℕ) : Prop :=
  ∃ x y z : S4, x.IsSwap ∧ y.IsSwap ∧ z.IsSwap ∧
    Consistent p q r x y z ∧ Nat.card (topSubgroup x y z) = m

theorem s4_criterion (p q r : ℤ) : HasImageOrder p q r 24 ↔ S4Criterion p q r := by sorry

theorem c2_always (p q r : ℤ) : HasImageOrder p q r 2 := by sorry

theorem v4_criterion (p q r : ℤ) : HasImageOrder p q r 4 ↔
    (2 ∣ p ∧ 2 ∣ q) ∨ (2 ∣ q ∧ 2 ∣ r) ∨ (2 ∣ r ∧ 2 ∣ p) := by sorry

def s3ColorMatrix (p q r : ℤ) : Matrix (Fin 2) (Fin 2) (ZMod 3) :=
  !![((p+r : ℤ) : ZMod 3), ((-p : ℤ) : ZMod 3);
     ((-r : ℤ) : ZMod 3), ((-q : ℤ) : ZMod 3)]

theorem s3_determinant (p q r : ℤ) :
    (s3ColorMatrix p q r).det = -((p*q+p*r+q*r : ℤ) : ZMod 3) := by
  sorry

theorem s3_criterion (p q r : ℤ) : HasImageOrder p q r 6 ↔ 3 ∣ p*q+p*r+q*r := by sorry

/-- A nonempty family of transpositions generates a Young subgroup, here one of four types. -/
theorem no_other_images (p q r : ℤ) (x y z : S4)
    (hx : x.IsSwap) (hy : y.IsSwap) (hz : z.IsSwap)
    (h : Consistent p q r x y z) :
    Nat.card (topSubgroup x y z) ∈ ({2,4,6,24} : Set ℕ) := by sorry

theorem pretzel333_star : Consistent 3 3 3 starX starY starZ := by decide +kernel

end PretzelColorTargets
