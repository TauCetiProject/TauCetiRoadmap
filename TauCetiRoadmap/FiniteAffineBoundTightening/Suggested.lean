import Mathlib

/-!
# Finite simultaneous affine bound tightening: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib; every headline is statable at the pins.
These suggested forms are neither an exhaustive checklist nor implementation code.
The intentional `sorry` proofs check expressibility only and are not proof certificates.
-/

noncomputable section
open scoped BigOperators Topology
open Filter Set

namespace TauCetiRoadmap.FiniteAffineBoundTightening

/-! ## Layer 1: endpoints, interval operations and affine images -/

/-- Joint variable and row coordinates, with variables on the left and rows on the right. -/
abbrev Coord (n m : ℕ) := Fin n ⊕ Fin m

/-- Real lower and upper endpoints, including pairs whose lower endpoint exceeds the upper. -/
abbrev Raw (n m : ℕ) := (Coord n m → ℝ) × (Coord n m → ℝ)

/-- A nonempty joint closed interval or one global empty state. -/
abbrev State (n m : ℕ) := Interval (Coord n m → ℝ)

variable {n m : ℕ}

/-- Endpoint containment: reverse lower and forward upper inequalities, also for invalid pairs. -/
def Within (q r : Raw n m) : Prop := r.1 ≤ q.1 ∧ q.2 ≤ r.2

/-- The sum of all variable and row endpoint widths. -/
def width (q : Raw n m) : ℝ := ∑ c, (q.2 c - q.1 c)

/-- Convert ordered endpoints to a nonempty interval and invalid endpoints to global bottom. -/
def pack (q : Raw n m) : State n m :=
  if h : q.1 ≤ q.2 then (⟨q, h⟩ : NonemptyInterval _) else ⊥

/-- Lower endpoint of a signed coefficient product, with zero coefficients contributing zero. -/
def zLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 ≤ A i j then A i j * q.1 (.inl j) else A i j * q.2 (.inl j)

/-- Upper endpoint of a signed coefficient product, with zero coefficients contributing zero. -/
def zHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 ≤ A i j then A i j * q.2 (.inl j) else A i j * q.1 (.inl j)

/-- Sum of signed product lower endpoints for one affine row. -/
def imageLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) : ℝ :=
  ∑ j, zLo A q i j

/-- Sum of signed product upper endpoints for one affine row. -/
def imageHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) : ℝ :=
  ∑ j, zHi A q i j

/-- Row lower sum omitting one variable coordinate. -/
def restLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  ∑ k ∈ Finset.univ.erase j, zLo A q i k

/-- Row upper sum omitting one variable coordinate. -/
def restHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  ∑ k ∈ Finset.univ.erase j, zHi A q i k


/-! ## Layer 2: simultaneous operator and actual iteration -/

/-- Intersect raw endpoints with their initial variable and row bounds. -/
def clip (q q₀ : Raw n m) : Raw n m :=
  (fun c => max (q.1 c) (q₀.1 c), fun c => min (q.2 c) (q₀.2 c))

/-- Lower inverse-row candidate; the zero coefficient branch keeps the incoming endpoint. -/
def inverseLo (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 < A i j then (q.1 (.inr i) - restHi A q i j) / A i j
  else if A i j < 0 then (q.2 (.inr i) - restLo A q i j) / A i j
  else q.1 (.inl j)

/-- Upper inverse-row candidate; the zero coefficient branch keeps the incoming endpoint. -/
def inverseHi (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) (i : Fin m) (j : Fin n) : ℝ :=
  if 0 < A i j then (q.2 (.inr i) - restLo A q i j) / A i j
  else if A i j < 0 then (q.1 (.inr i) - restHi A q i j) / A i j
  else q.2 (.inl j)

/-- Keep variable endpoints and intersect each row with its affine image. -/
def up (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Raw n m :=
  (Sum.elim (fun j => q.1 (.inl j)) (fun i => max (q.1 (.inr i)) (imageLo A q i)),
   Sum.elim (fun j => q.2 (.inl j)) (fun i => min (q.2 (.inr i)) (imageHi A q i)))


/-- Keep row endpoints and intersect variables with all inverse candidates from the same state. -/
def down (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Raw n m :=
  (Sum.elim (fun j => Finset.univ.fold max (q.1 (.inl j)) (fun i => inverseLo A q i j))
     (fun i => q.1 (.inr i)),
   Sum.elim (fun j => Finset.univ.fold min (q.2 (.inl j)) (fun i => inverseHi A q i j))
     (fun i => q.2 (.inr i)))

/-- One simultaneous affine tightening step: clipping, upward images, then downward inverses. -/
def step (A : Matrix (Fin m) (Fin n) ℝ) (q₀ q : Raw n m) : Raw n m :=
  down A (up A (clip q q₀))

/-- Apply the raw step to nonempty intervals and keep global bottom absorbing. -/
def publicStep (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) : State n m → State n m :=
  Interval.recBotCoe ⊥ (fun q => pack (step A q₀ (q.fst, q.snd)))

/-- Actual raw iteration from the initial endpoints. -/
def rawRun (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) (k : ℕ) : Raw n m :=
  (step A q₀)^[k] q₀

/-- Actual public iteration from the packed initial endpoints. -/
def publicRun (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) (k : ℕ) : State n m :=
  (publicStep A q₀)^[k] (pack q₀)

/-- The joint point consisting of the original variables and their affine row values. -/
def graph (A : Matrix (Fin m) (Fin n) ℝ) (x : Fin n → ℝ) : Coord n m → ℝ :=
  Sum.elim x (A.mulVec x)


/-- An initially enclosed affine graph point belongs to every public iterate. -/
theorem graph_survives (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (x : Fin n → ℝ) (hx : graph A x ∈ Set.Icc q₀.1 q₀.2) (k : ℕ) :
    graph A x ∈ (publicRun A q₀ k : Set (Coord n m → ℝ)) := by sorry

/-! ## Layer 3: independent scalar LP and fixed-state correspondence -/

/-- Independent endpoint and product decision variables for the scalar linear program. -/
@[ext] structure Assignment (n m : ℕ) where
  endpoints : Raw n m
  zL : Matrix (Fin m) (Fin n) ℝ
  zU : Matrix (Fin m) (Fin n) ℝ

/-- The assignment whose products are the signed products of its endpoints. -/
def canonical (A : Matrix (Fin m) (Fin n) ℝ) (q : Raw n m) : Assignment n m :=
  ⟨q, zLo A q, zHi A q⟩


/-- Scalar affine constraints for ordered endpoints, initial containment and signed row propagation. -/
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

/-- The scalar program objective: total variable and row width. -/
def objective (p : Assignment n m) : ℝ := width p.endpoints


/-- Feasible assignments are exactly canonical assignments of ordered raw fixed tuples. -/
theorem lp_iff_fixed (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (p : Assignment n m) : lpFeasible A q₀ p ↔
    p = canonical A p.endpoints ∧ p.endpoints.1 ≤ p.endpoints.2 ∧
      Function.IsFixedPt (step A q₀) p.endpoints := by sorry

/-! ## Layer 4: conditional limit and unique full-width optimum -/

/-- Coordinatewise lower suprema and upper infima of the actual raw iterates. -/
def endpointLimit (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m) : Raw n m :=
  (fun c => sSup (Set.range (fun k => (rawRun A q₀ k).1 c)),
   fun c => sInf (Set.range (fun k => (rawRun A q₀ k).2 c)))


/-- For ordered initial endpoints, all public iterates are nonempty exactly when the scalar LP is feasible. -/
theorem run_nonempty_iff_lp (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2) :
    (∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) ↔
      ∃ p, lpFeasible A q₀ p := by sorry

/-- Nonempty actual iterates converge to the ordered greatest fixed interval inside the initial bounds. -/
theorem actual_limit (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2)
    (h : ∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) :
    (endpointLimit A q₀).1 ≤ (endpointLimit A q₀).2 ∧
    Within (endpointLimit A q₀) q₀ ∧
    Tendsto (rawRun A q₀) atTop (𝓝 (endpointLimit A q₀)) ∧
    Function.IsFixedPt (step A q₀) (endpointLimit A q₀) ∧
    IsGreatest {s : State n m | ∃ q : Raw n m, q.1 ≤ q.2 ∧
      Function.IsFixedPt (step A q₀) q ∧ s = pack q} (pack (endpointLimit A q₀)) := by sorry

/-- The actual endpoint limit gives the unique full scalar assignment maximizing joint width. -/
theorem unique_full_width_optimum (A : Matrix (Fin m) (Fin n) ℝ) (q₀ : Raw n m)
    (h₀ : q₀.1 ≤ q₀.2)
    (h : ∀ k, (publicRun A q₀ k : Set (Coord n m → ℝ)).Nonempty) :
    lpFeasible A q₀ (canonical A (endpointLimit A q₀)) ∧
    IsMaxOn objective {p | lpFeasible A q₀ p} (canonical A (endpointLimit A q₀)) ∧
    (∀ p, lpFeasible A q₀ p → IsMaxOn objective {p | lpFeasible A q₀ p} p →
      p = canonical A (endpointLimit A q₀)) := by sorry

/-! ## Layer 5: bounded original-coordinate application -/

/-- Initialize row bounds for bounded inequalities using the minimum of the image lower bound and row cap. -/
def sourceInitial (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) : Raw n m :=
  (Sum.elim l (fun i => min (imageLo A (Sum.elim l (fun _ => 0),
    Sum.elim u (fun _ => 0)) i) (r i)), Sum.elim u r)

/-- The original affine inequalities, additional restriction set and designated integer coordinates. -/
def sourceSet (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (extra : Set (Fin n → ℝ)) (integers : Finset (Fin n)) : Set (Fin n → ℝ) :=
  {x | A.mulVec x ≤ r ∧ x ∈ extra ∧ ∀ j ∈ integers, ∃ z : ℤ, x j = (z : ℝ)}

/-- The closed variable-coordinate box of a raw joint endpoint pair. -/
def variableBox (q : Raw n m) : Set (Fin n → ℝ) :=
  Set.Icc (fun j => q.1 (.inl j)) (fun j => q.2 (.inl j))

/-- LP infeasibility excludes every original feasible point in the initial bounded box. -/
theorem source_infeasible (A : Matrix (Fin m) (Fin n) ℝ) (r : Fin m → ℝ)
    (l u : Fin n → ℝ) (hl : l ≤ u) (extra : Set (Fin n → ℝ)) (integers : Finset (Fin n))
    (h : ¬ ∃ p, lpFeasible A (sourceInitial A r l u) p) :
    sourceSet A r extra integers ∩ Set.Icc l u = ∅ := by sorry

/-- The limit preserves the original bounded feasible set and its minimizers for the unchanged objective. -/
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

end TauCetiRoadmap.FiniteAffineBoundTightening
