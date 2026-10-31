import TauCeti.GroupTheory.SpecificGroups.Braid.Word

/-!
Native all-strand ordered exchange family. Multiplication of the native endpoint
permutations applies the rightmost factor first. No geometric linking carrier
or realized-closure comparison is introduced by this prototype.
-/
namespace TauCetiRoadmap.GT4Exchange
open TauCeti
open TauCeti.BraidGroup

/-- The ordered positive word σ₁⋯σₙ on n+1 strands (zero-based native indices). -/
def cycleWord (n : ℕ) : BraidWord (n + 1) :=
  (List.finRange n).map fun i => (i, (1 : ℤˣ))

/-- c_(n+1), evaluated in the actual Artin braid group. -/
def cycle (n : ℕ) : BraidGroup (n + 1) := (cycleWord n).toBraid

/-- β_(n,p) = c_(n+1)^((n+1)p); for the obstruction n,p are positive. -/
def beta (n p : ℕ) : BraidGroup (n + 1) := cycle n ^ ((n + 1) * p)

/-- Ordered word representative, retaining the individual positive crossings. -/
def betaWord (n p : ℕ) : BraidWord (n + 1) :=
  (List.replicate ((n + 1) * p) (cycleWord n)).flatten

@[simp] theorem length_cycleWord (n : ℕ) : (cycleWord n).length = n := by
  simp [cycleWord]

/-- Evaluation of repeated words agrees with group powers; noncommutative order is retained. -/
theorem toBraid_repeat (n k : ℕ) (w : BraidWord n) :
    BraidWord.toBraid ((List.replicate k w).flatten : BraidWord n) = w.toBraid ^ k := by
  induction k with
  | zero => simp
  | succ k ih => simp [List.replicate_succ, ih, pow_succ']

@[simp] theorem toBraid_betaWord (n p : ℕ) : (betaWord n p).toBraid = beta n p := by
  exact toBraid_repeat (n + 1) ((n + 1) * p) (cycleWord n)

/-- The m-th power of the adjacent-transposition cycle is the identity.
This finite-permutation calculation is the only admitted target in the prototype. -/
theorem perm_cycle_power (n : ℕ) :
    permHom (n + 1) (cycle n) ^ (n + 1) = 1 := by
  sorry

/-- Every family member is pure, reduced to the one-cycle endpoint calculation. -/
theorem beta_pure (n p : ℕ) : beta n p ∈ pureSubgroup (n + 1) := by
  rw [mem_pureSubgroup, beta, map_pow, pow_mul, perm_cycle_power, one_pow]

/-- Permutation endpoint lemma: two factors fixing b in an exchange expression
with trivial total permutation must both fix its other distinguished endpoint a. -/
theorem exchange_fixes_endpoints {α : Type*} [DecidableEq α]
    (u v : Equiv.Perm α) (a b : α)
    (hub : u b = b) (hvb : v b = b)
    (h : u * Equiv.swap a b * v * Equiv.swap a b = 1) :
    u a = a ∧ v a = a := by
  have hua : u a = a := by
    have he := congrArg (fun e : Equiv.Perm α => e a) h
    simpa [Equiv.Perm.mul_apply, hvb] using he
  refine ⟨hua, ?_⟩
  have he := congrArg (fun e : Equiv.Perm α => e b) h
  have hs : Equiv.swap a b (v a) = b := by
    apply u.injective
    simpa [Equiv.Perm.mul_apply, hub] using he
  have he' := congrArg (Equiv.swap a b) hs
  simpa using he'

/-- Exchange-shaped braid with U,V on the first n+1 of n+2 strands. -/
def exchange (n : ℕ) (U V : BraidGroup (n + 1)) : BraidGroup (n + 2) :=
  strandIncl U * (sigma (Fin.last n))⁻¹ * strandIncl V * sigma (Fin.last n)

/-- The native pure-exchange hypothesis forces the old last strand to be fixed
by each old-strand factor. This is the endpoint input for the zero-pair argument. -/
theorem exchange_endpoint (n : ℕ) (U V : BraidGroup (n + 1))
    (h : permHom (n + 2) (exchange n U V) = 1) :
    permHom (n + 1) U (Fin.last n) = Fin.last n ∧
    permHom (n + 1) V (Fin.last n) = Fin.last n := by
  have he : permHom (n + 2) (strandIncl U) *
      Equiv.swap (Fin.castSucc (Fin.last n)) (Fin.last (n + 1)) *
      permHom (n + 2) (strandIncl V) *
      Equiv.swap (Fin.castSucc (Fin.last n)) (Fin.last (n + 1)) = 1 := by
    simpa only [exchange, map_mul, map_inv, permHom_sigma_last, Equiv.swap_inv] using h
  have hh := exchange_fixes_endpoints
    (permHom (n + 2) (strandIncl U)) (permHom (n + 2) (strandIncl V))
    (Fin.castSucc (Fin.last n)) (Fin.last (n + 1))
    (permHom_strandIncl_last U) (permHom_strandIncl_last V) he
  constructor
  · apply Fin.castSucc_injective
    simpa using hh.1
  · apply Fin.castSucc_injective
    simpa using hh.2

#print axioms cycleWord
#print axioms cycle
#print axioms beta
#print axioms betaWord
#print axioms length_cycleWord
#print axioms toBraid_repeat
#print axioms toBraid_betaWord
#print axioms perm_cycle_power
#print axioms beta_pure
#print axioms exchange_fixes_endpoints
#print axioms exchange
#print axioms exchange_endpoint
end TauCetiRoadmap.GT4Exchange
