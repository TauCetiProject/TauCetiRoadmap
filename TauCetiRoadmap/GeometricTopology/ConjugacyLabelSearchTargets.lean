import Mathlib

/-!
# Finite conjugacy-label search: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Finite relator equations are actual word evaluations. Geometric dictionaries
and completeness of propagation from selected diagram arcs remain separate targets.
-/
noncomputable section
namespace ConjugacyLabelSearchTargets
open Equiv
variable {G : Type*} [Group G] {n m : ℕ}

def Solution (rels : Fin m → FreeGroup (Fin n)) (v : Fin n → G) : Prop :=
  ∀ k, FreeGroup.lift v (rels k) = 1

instance [DecidableEq G] (rels : Fin m → FreeGroup (Fin n)) (v : Fin n → G) :
    Decidable (Solution rels v) := by unfold Solution; infer_instance

def Generating (v : Fin n → G) : Prop := Subgroup.closure (Set.range v) = ⊤

def solutionHom (rels : Fin m → FreeGroup (Fin n)) (v : Fin n → G)
    (hv : Solution rels v) : PresentedGroup (Set.range rels) →* G :=
  PresentedGroup.toGroup (by rintro _ ⟨k,rfl⟩; exact hv k)

theorem solutionHom_generator (rels : Fin m → FreeGroup (Fin n)) (v : Fin n → G)
    (hv : Solution rels v) (i : Fin n) : solutionHom rels v hv (PresentedGroup.of i) = v i := by
  exact PresentedGroup.toGroup.of _

theorem conjugation_preserves_solution (rels : Fin m → FreeGroup (Fin n))
    (v : Fin n → G) (g : ConjAct G) :
    Solution rels (g • v) ↔ Solution rels v := by
  have hmaps : FreeGroup.lift (g • v) =
      (MulAut.conj (ConjAct.ofConjAct g)).toMonoidHom.comp (FreeGroup.lift v) := by
    ext i
    simp [ConjAct.smul_def, MulAut.conj_apply]
  unfold Solution
  rw [hmaps]
  simp

abbrev ClassSolutions (rels : Fin m → FreeGroup (Fin n)) (a : G) :=
  {v : Fin n → G // Solution rels v ∧ ∀ i, IsConj (v i) a}

abbrev FixedSolutions (rels : Fin m → FreeGroup (Fin n)) (a : G) (base : Fin n) :=
  {v : ClassSolutions rels a // v.val base = a}

def fullOrbitRel (rels : Fin m → FreeGroup (Fin n)) (a : G) : Setoid (ClassSolutions rels a) :=
  Setoid.comap (fun v ↦ v.val) (MulAction.orbitRel (ConjAct G) (Fin n → G))

def residual (a : G) : Subgroup (ConjAct G) :=
  Subgroup.centralizer ({ConjAct.toConjAct a} : Set (ConjAct G))

def fixedOrbitRel (rels : Fin m → FreeGroup (Fin n)) (a : G) (base : Fin n) :
    Setoid (FixedSolutions rels a base) :=
  Setoid.comap (fun v ↦ v.val.val) (MulAction.orbitRel (residual a) (Fin n → G))

theorem fixed_fiber_quotient (rels : Fin m → FreeGroup (Fin n)) (a : G) (base : Fin n) :
    ∃ e : Quotient (fullOrbitRel rels a) ≃ Quotient (fixedOrbitRel rels a base),
      ∀ v : FixedSolutions rels a base,
        e (Quotient.mk (fullOrbitRel rels a) v.val) = Quotient.mk (fixedOrbitRel rels a base) v := by
  sorry

theorem tuple_stabilizer (v : Fin n → G) :
    MulAction.stabilizer (ConjAct G) v =
      Subgroup.comap ConjAct.ofConjAct.toMonoidHom
        (Subgroup.centralizer (Subgroup.closure (Set.range v) : Set G)) ∧
    (Generating v → MulAction.stabilizer (ConjAct G) v =
      Subgroup.comap ConjAct.ofConjAct.toMonoidHom (Subgroup.center G)) := by
  sorry

abbrev S5 := Perm (Fin 5)
def representatives : Fin 7 → S5 :=
  ![1, swap 0 1, ([0,1,2] : List (Fin 5)).formPerm,
    ([0,1,2,3] : List (Fin 5)).formPerm, ([0,1,2,3,4] : List (Fin 5)).formPerm,
    swap 0 1 * swap 2 3, swap 0 1 * ([2,3,4] : List (Fin 5)).formPerm]

def classSize (g : S5) : ℕ := Nat.card (ConjClasses.mk g).carrier

theorem s5_class_sizes : (fun i ↦ classSize (representatives i)) = ![1,10,20,30,24,15,20] := by
  sorry

theorem mixed_cycle_powers :
    representatives 6 ^ 3 = swap 0 1 ∧
    representatives 6 ^ 6 = 1 ∧ representatives 6 ^ 2 ≠ 1 := by decide +kernel

end ConjugacyLabelSearchTargets
