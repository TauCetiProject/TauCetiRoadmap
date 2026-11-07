import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Topology.Homotopy.Lifting

/-! Representative native forms accompanying the definitive Layer7C programme.
The finite A2 formulas below test the order of actual factors. They do not
implement generic reductive root groups or the contraction/cover proof. -/

namespace TauCetiRoadmap.ReductiveGroups.BruhatCoordinates

/-- Positive type-A roots are actual ordered pairs. -/
def positivePair (n : ℕ) := {p : Fin n × Fin n // p.1 < p.2}

/-- The source's retained-positive convention, with LEFT Weyl action. -/
def retained {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) : Prop :=
  w.symm p.val.1 < w.symm p.val.2

def inverted {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) : Prop :=
  w.symm p.val.2 < w.symm p.val.1

theorem retained_or_inverted {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) :
    retained w p ∨ inverted w p := by
  have hne : w.symm p.val.1 ≠ w.symm p.val.2 := fun h =>
    (ne_of_lt p.property) (w.symm.injective h)
  exact lt_or_gt_of_ne hne

theorem not_both {n : ℕ} (w : Equiv.Perm (Fin n)) (p : positivePair n) :
    ¬ (retained w p ∧ inverted w p) := by
  exact fun h => (not_lt_of_gt h.1) h.2

def s1 : Equiv.Perm (Fin 3) := Equiv.swap 0 1
def longest : Equiv.Perm (Fin 3) := Equiv.swap 0 2
def alpha1 : positivePair 3 := ⟨(0,1), by decide⟩
def alpha2 : positivePair 3 := ⟨(1,2), by decide⟩

theorem wrong_left_complement_overlaps :
    retained s1 alpha2 ∧ retained (longest * s1) alpha2 := by
  unfold retained s1 longest alpha2
  decide

theorem correct_right_complement_contains_alpha1 :
    inverted s1 alpha1 ∧ retained (s1 * longest) alpha1 := by
  unfold inverted retained s1 longest alpha1
  decide

section Matrix
variable {K : Type*} [CommRing K]

/-- Upper-unitriangular coordinates: the third parameter is the matrix13 entry. -/
def upper3 (a b c : K) : Matrix (Fin 3) (Fin 3) K :=
  !![1,a,c; 0,1,b; 0,0,1]

theorem upper3_mul (a b c a' b' c' : K) :
    upper3 a b c * upper3 a' b' c' =
      upper3 (a+a') (b+b') (c+c'+a*b') := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [upper3, Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

def stabilizerS1 (b c : K) := upper3 0 b c
def complementS1 (a : K) := upper3 a 0 0

/-- A right-coset coordinate uses complement FIRST. -/
theorem complement_first (a b c : K) :
    complementS1 a * stabilizerS1 b (c-a*b) = upper3 a b c := by
  simp [complementS1, stabilizerS1, upper3_mul]

theorem stabilizer_first (a b c : K) :
    stabilizerS1 b c * complementS1 a = upper3 a b c := by
  simp [complementS1, stabilizerS1, upper3_mul]

def recoverComplementFirst (a b c : K) : K × (K × K) := (a,b,c-a*b)
def assembleComplementFirst (a : K) (h : K × K) : K × (K × K) :=
  (a,h.1,h.2+a*h.1)

theorem recover_assemble (a : K) (h : K × K) :
    recoverComplementFirst (assembleComplementFirst a h).1
      (assembleComplementFirst a h).2.1 (assembleComplementFirst a h).2.2 = (a,h) := by
  rcases h with ⟨b,c⟩
  simp [recoverComplementFirst, assembleComplementFirst]

theorem assemble_recover (a b c : K) :
    assembleComplementFirst (recoverComplementFirst a b c).1
      (recoverComplementFirst a b c).2 = (a,b,c) := by
  simp [recoverComplementFirst, assembleComplementFirst]

/-- The other A2 stabilizer U_alpha2 is not normal in the whole Uplus. -/
theorem nonnormal_conjugation :
    upper3 (1:K) 0 0 * upper3 0 1 0 * upper3 (-1) 0 0 = upper3 0 1 1 := by
  simp [upper3_mul]

end Matrix

section Covering
variable {E X : Type*} [TopologicalSpace E] [TopologicalSpace X]
variable [PreconnectedSpace E] [SimplyConnectedSpace X] [LocallyPathConnectedSpace X]

/-- The exact connected-cover step: the TOTAL space need not be assumed simply connected.
The chosen e0 ensures a nonempty total space and fixes the actual inverse lift. -/
noncomputable def coveringHomeomorph (p : E → X) (hp : IsCoveringMap p) (e0 : E) : E ≃ₜ X := by
  classical
  let ex := hp.existsUnique_continuousMap_lifts (ContinuousMap.id X) (p e0) e0 rfl
  let s := Classical.choose ex
  have hs := (Classical.choose_spec ex).1
  have hs_right : ∀ x, p (s x) = x := fun x => congrFun hs.2 x
  have hs_left : s ∘ p = id := by
    exact hp.eq_of_comp_eq (s.continuous.comp hp.continuous) continuous_id
      (by funext e; exact hs_right (p e)) e0 hs.1
  exact
    { toEquiv :=
        { toFun := p
          invFun := s
          left_inv := fun e => congrFun hs_left e
          right_inv := hs_right }
      continuous_toFun := hp.continuous
      continuous_invFun := s.continuous }

theorem coveringHomeomorph_apply (p : E → X) (hp : IsCoveringMap p) (e0 e : E) :
    coveringHomeomorph p hp e0 e = p e := by
  rfl

end Covering

end TauCetiRoadmap.ReductiveGroups.BruhatCoordinates
