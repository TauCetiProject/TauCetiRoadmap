import Mathlib

/-!
# Finite simultaneous affine bound tightening: target signatures

This file prototypes target signatures; the README is the definitive specification.
These suggested forms are neither an exhaustive checklist nor implementation code.
The intentional `sorry` proofs check expressibility only and are not proof certificates.
-/

noncomputable section
open scoped BigOperators Topology
open Filter Set
attribute [local instance] Classical.propDecidable

namespace FiniteAffineBoundTightening

abbrev Coord (n m : ℕ) := Fin n ⊕ Fin m
abbrev Raw (n m : ℕ) := (Coord n m → ℝ) × (Coord n m → ℝ)
abbrev State (n m : ℕ) := Interval (Coord n m → ℝ)

variable {n m : ℕ}

/-- Reverse lower / forward upper endpoint containment, defined even for invalid tuples. -/
def Within (q r : Raw n m) : Prop := r.1 ≤ q.1 ∧ q.2 ≤ r.2

def width (q : Raw n m) : ℝ := ∑ c, (q.2 c - q.1 c)

def pack (q : Raw n m) : State n m :=
  if h : q.1 ≤ q.2 then (⟨q, h⟩ : NonemptyInterval _) else ⊥

def clip (q q₀ : Raw n m) : Raw n m :=
  (fun c => max (q.1 c) (q₀.1 c), fun c => min (q.2 c) (q₀.2 c))

def zLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 ≤ A i j then A i j * q.1 (.inl j) else A i j * q.2 (.inl j)

def zHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 ≤ A i j then A i j * q.2 (.inl j) else A i j * q.1 (.inl j)

def imageLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) : ℝ :=
  ∑ j, zLo A q i j

def imageHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) : ℝ :=
  ∑ j, zHi A q i j

def restLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  ∑ k ∈ Finset.univ.erase j, zLo A q i k

def restHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  ∑ k ∈ Finset.univ.erase j, zHi A q i k

/-- The zero branch imposes no inverse restriction. -/
def inverseLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 < A i j then (q.1 (.inr i) - restHi A q i j) / A i j
  else if A i j < 0 then (q.2 (.inr i) - restLo A q i j) / A i j
  else q.1 (.inl j)

def inverseHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 < A i j then (q.2 (.inr i) - restLo A q i j) / A i j
  else if A i j < 0 then (q.1 (.inr i) - restHi A q i j) / A i j
  else q.2 (.inl j)

def up (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Raw n m :=
  (Sum.elim (fun j => q.1 (.inl j)) (fun i => max (q.1 (.inr i)) (imageLo A q i)),
   Sum.elim (fun j => q.2 (.inl j)) (fun i => min (q.2 (.inr i)) (imageHi A q i)))

/-- All candidates use the same incoming q; extrema are seeded with its endpoints. -/
def down (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Raw n m :=
  (Sum.elim (fun j => Finset.univ.fold max (q.1 (.inl j)) (fun i => inverseLo A q i j))
     (fun i => q.1 (.inr i)),
   Sum.elim (fun j => Finset.univ.fold min (q.2 (.inl j)) (fun i => inverseHi A q i j))
     (fun i => q.2 (.inr i)))

def step (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q : Raw n m) : Raw n m :=
  down A (up A (clip q q₀))

def publicStep (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) : State n m → State n m :=
  Interval.recBotCoe ⊥ (fun q => pack (step A q₀ (q.fst, q.snd)))

def rawRun (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) (k : ℕ) : Raw n m :=
  (step A q₀)^[k] q₀

def publicRun (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) (k : ℕ) : State n m :=
  (publicStep A q₀)^[k] (pack q₀)

def graph (A : Matrix (Fin m) (Fin n) ℝ) (x : Fin n → ℝ) : Coord n m → ℝ :=
  Sum.elim x (A.mulVec x)

/-- Endpoint limit is intrinsic to the actual raw iteration. -/
def endpointLimit (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) : Raw n m :=
  (fun c => sSup (Set.range (fun k => (rawRun A q₀ k).1 c)),
   fun c => sInf (Set.range (fun k => (rawRun A q₀ k).2 c)))

/-- Independent scalar decision variables: products are not definitionally canonical. -/
@[ext] structure Assignment (n m : ℕ) where
  endpoints : Raw n m
  zL : Matrix (Fin m) (Fin n) ℝ
  zU : Matrix (Fin m) (Fin n) ℝ

def canonical (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Assignment n m :=
  ⟨q, zLo A q, zHi A q⟩

/-- Scalar affine inequalities for fixed A, with signed equalities also at zero. -/
def lpFeasible (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (p : Assignment n m) : Prop :=
  p.endpoints.1 ≤ p.endpoints.2 ∧ Within p.endpoints q₀ ∧
  (∀ i j, p.zL i j = zLo A p.endpoints i j ∧ p.zU i j = zHi A p.endpoints i j) ∧
  (∀ i, (∑ j, p.zL i j) ≤ p.endpoints.1 (.inr i) ∧
    p.endpoints.2 (.inr i) ≤ ∑ j, p.zU i j) ∧
  (∀ i j, 0 < A i j →
    (p.endpoints.1 (.inr i) - ∑ k ∈ Finset.univ.erase j, p.zU i k) / A i j ≤
      p.endpoints.1 (.inl j) ∧
    p.endpoints.2 (.inl j) ≤
      (p.endpoints.2 (.inr i) - ∑ k ∈ Finset.univ.erase j, p.zL i k) / A i j) ∧
  (∀ i j, A i j < 0 →
    (p.endpoints.2 (.inr i) - ∑ k ∈ Finset.univ.erase j, p.zL i k) / A i j ≤
      p.endpoints.1 (.inl j) ∧
    p.endpoints.2 (.inl j) ≤
      (p.endpoints.1 (.inr i) - ∑ k ∈ Finset.univ.erase j, p.zU i k) / A i j)

def objective (p : Assignment n m) : ℝ := width p.endpoints

/-! ## Layer 1: raw/public bridge and signed arithmetic -/
theorem mem_pack (q : Raw n m) (v : Coord n m → ℝ) :
    v ∈ (pack q : Set (Coord n m → ℝ)) ↔ v ∈ Set.Icc q.1 q.2 := by sorry

theorem signed_bounds (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m)
    (x : Fin n → ℝ) (hx : ∀ j, q.1 (.inl j) ≤ x j ∧ x j ≤ q.2 (.inl j)) (i j) :
    zLo A q i j ≤ A i j * x j ∧ A i j * x j ≤ zHi A q i j := by sorry

/-! ## Layer 2: concrete formulas, invalidity and graph preservation -/
theorem step_contract (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q : Raw n m) :
    Within (step A q₀ q) q ∧ Within (step A q₀ q) q₀ := by sorry

theorem step_mono (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q r : Raw n m)
    (h : Within q r) : Within (step A q₀ q) (step A q₀ r) := by sorry

theorem step_continuous (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) :
    Continuous (step A q₀) := by sorry

theorem invalid_absorbs (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q : Raw n m)
    (h : ¬ q.1 ≤ q.2) : pack (step A q₀ q) = ⊥ := by sorry

theorem run_bridge (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) (k : ℕ) :
    publicRun A q₀ k = pack (rawRun A q₀ k) := by sorry

theorem graph_survives (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (x : Fin n → ℝ) (hx : graph A x ∈ Set.Icc q₀.1 q₀.2) (k : ℕ) :
    graph A x ∈ (publicRun A q₀ k : Set (Coord n m → ℝ)) := by sorry

theorem fixed_within_iterates (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q : Raw n m)
    (hq : q.1 ≤ q.2) (hf : Function.IsFixedPt (step A q₀) q) (k : ℕ) :
    Within q q₀ ∧ Within q (rawRun A q₀ k) := by sorry

/-! ## Layer 3: scalar LP correspondence -/
theorem lp_iff_fixed (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (p : Assignment n m) : lpFeasible A q₀ p ↔
    p = canonical A p.endpoints ∧ p.endpoints.1 ≤ p.endpoints.2 ∧
      Function.IsFixedPt (step A q₀) p.endpoints := by sorry

theorem singleton_graph_feasible (A : Matrix (Fin m) (Fin n) ℝ)
    (q₀ : Raw n m) (x : Fin n → ℝ) (hx : graph A x ∈ Set.Icc q₀.1 q₀.2) :
    lpFeasible A q₀ (canonical A (graph A x, graph A x)) := by sorry

theorem lp_infeasible_no_graph (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h : ¬ ∃ p, lpFeasible A q₀ p) : ¬ ∃ x, graph A x ∈ Set.Icc q₀.1 q₀.2 := by sorry

/-! ## Layer 4: conditional limit and unique optimum -/
theorem run_nonempty_iff_fixed (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2) :
    (∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) ↔
      ∃ q : Raw n m, q.1 ≤ q.2 ∧ Function.IsFixedPt (step A q₀) q := by sorry

theorem run_nonempty_iff_lp (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2) :
    (∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) ↔
      ∃ p, lpFeasible A q₀ p := by sorry

theorem actual_limit (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2)
    (h : ∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) :
    (endpointLimit A q₀).1 ≤ (endpointLimit A q₀).2 ∧
    Within (endpointLimit A q₀) q₀ ∧
    Tendsto (rawRun A q₀) atTop (𝓝 (endpointLimit A q₀)) ∧
    Function.IsFixedPt (step A q₀) (endpointLimit A q₀) ∧
    IsGreatest {s : State n m | ∃ q : Raw n m, q.1 ≤ q.2 ∧
      Function.IsFixedPt (step A q₀) q ∧ s = pack q} (pack (endpointLimit A q₀)) := by sorry

theorem unique_full_width_optimum (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2)
    (h : ∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) :
    lpFeasible A q₀ (canonical A (endpointLimit A q₀)) ∧
    IsMaxOn objective {p | lpFeasible A q₀ p} (canonical A (endpointLimit A q₀)) ∧
    (∀ p, lpFeasible A q₀ p → IsMaxOn objective {p | lpFeasible A q₀ p} p →
      p = canonical A (endpointLimit A q₀)) := by sorry

theorem graph_survives_limit (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2)
    (h : ∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty)
    (x : Fin n → ℝ) (hx : graph A x ∈ Set.Icc q₀.1 q₀.2) :
    graph A x ∈ Set.Icc (endpointLimit A q₀).1 (endpointLimit A q₀).2 := by sorry

/-! ## Layer 5: original-coordinate bounded application -/
def sourceInitial (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) : Raw n m :=
  (Sum.elim l (fun i => min (imageLo A (Sum.elim l (fun _ => 0),
    Sum.elim u (fun _ => 0)) i) (r i)), Sum.elim u r)

def sourceSet (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (extra : Set (Fin n → ℝ)) (integers : Finset (Fin n)) : Set (Fin n → ℝ) :=
  {x | A.mulVec x ≤ r ∧ x ∈ extra ∧ ∀ j ∈ integers, ∃ z : ℤ, x j = (z : ℝ)}

def variableBox (q : Raw n m) : Set (Fin n → ℝ) :=
  Set.Icc (fun j => q.1 (.inl j)) (fun j => q.2 (.inl j))

theorem source_graph_iff (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) (hl : l ≤ u) (x : Fin n → ℝ) :
    graph A x ∈ Set.Icc (sourceInitial A r l u).1 (sourceInitial A r l u).2 ↔
      x ∈ Set.Icc l u ∧ A.mulVec x ≤ r := by sorry

theorem source_infeasible (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) (hl : l ≤ u) (extra : Set (Fin n → ℝ)) (integers : Finset (Fin n))
    (h : ¬ ∃ p, lpFeasible A (sourceInitial A r l u) p) :
    sourceSet A r extra integers ∩ Set.Icc l u = ∅ := by sorry

theorem source_preservation (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) (hl : l ≤ u) (extra : Set (Fin n → ℝ)) (integers : Finset (Fin n))
    (f : (Fin n → ℝ) → ℝ)
    (h : ∀ k, (publicRun A (sourceInitial A r l u) k : Set (Coord n m → ℝ)).Nonempty) :
    (∀ j, (endpointLimit A (sourceInitial A r l u)).1 (.inl j) ≤
      (endpointLimit A (sourceInitial A r l u)).2 (.inl j)) ∧
    variableBox (endpointLimit A (sourceInitial A r l u)) ⊆ Set.Icc l u ∧
    sourceSet A r extra integers ∩ variableBox (endpointLimit A (sourceInitial A r l u)) =
      sourceSet A r extra integers ∩ Set.Icc l u ∧
    (∀ x, (x ∈ sourceSet A r extra integers ∩ variableBox (endpointLimit A (sourceInitial A r l u)) ∧
      IsMinOn f (sourceSet A r extra integers ∩ variableBox (endpointLimit A (sourceInitial A r l u))) x) ↔
      (x ∈ sourceSet A r extra integers ∩ Set.Icc l u ∧
      IsMinOn f (sourceSet A r extra integers ∩ Set.Icc l u) x)) := by sorry

end FiniteAffineBoundTightening
