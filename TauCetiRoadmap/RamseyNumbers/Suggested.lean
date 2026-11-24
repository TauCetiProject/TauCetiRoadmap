import Mathlib

/-!
# Ramsey numbers: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the four
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's Checks and the values it derives from the
theorems below (such as `R(3, 3) = 6`) are not restated.

A colouring of the edges of the complete graph on `Fin n` with colours in `K` is Mathlib's
`SimpleGraph.TopEdgeLabeling (Fin n) K`, and the edges of colour `k` form the graph
`C.labelGraph k`. For `f : K → ℕ`, `RamseyProp f n` says that every such colouring has, for some
colour `k`, a set of `f k` vertices whose edges all have colour `k`; the Ramsey number
`ramseyNumber f` is the infimum in `ℕ` of the `n` with this property. The finite Ramsey theorem
says that the infimum is attained and that the property holds exactly from it on, for finitely
many colours. The two-colour number `R(s, t)` is `ramseyNumber ![s, t]`: colour `0` asks for `s`
vertices and colour `1` for `t`. Colourings of the `m`-element subsets are functions on the
subtype `{s : Finset (Fin n) // s.card = m}`.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.RamseyNumbers

/-! ## Layer 1: Ramsey numbers of complete graphs -/

/-- 1.1 The Ramsey property: every colouring of the edges of the complete graph on `n` vertices
with colours in `K` has, for some colour `k`, a set of `f k` vertices all of whose edges have
colour `k`. -/
def RamseyProp {K : Type*} (f : K → ℕ) (n : ℕ) : Prop :=
  ∀ C : TopEdgeLabeling (Fin n) K, ∃ k : K, ∃ s : Finset (Fin n), (C.labelGraph k).IsNClique (f k) s

/-- 1.1 The Ramsey number `R(f)`: the infimum in `ℕ` of the numbers of vertices with the Ramsey
property. By 1.2 it is the least such number when `K` is finite. -/
def ramseyNumber {K : Type*} (f : K → ℕ) : ℕ :=
  sInf {n | RamseyProp f n}

/-- 1.2 The finite Ramsey theorem for graphs, in any finite number of colours: the Ramsey property
holds on `n` vertices exactly when `n` is at least the Ramsey number. So the property holds for
some `n`, the Ramsey number is the least such `n`, and the property persists for all larger `n`. -/
theorem ramseyProp_iff_ramseyNumber_le {K : Type*} [Finite K] (f : K → ℕ) (n : ℕ) :
    RamseyProp f n ↔ ramseyNumber f ≤ n := by
  sorry

/-- 1.3 Relabelling the colours by a bijection does not change the Ramsey number; in particular
`R(s, t) = R(t, s)`. -/
theorem ramseyNumber_comp_equiv {K K' : Type*} (f : K → ℕ) (e : K' ≃ K) :
    ramseyNumber (f ∘ e) = ramseyNumber f := by
  sorry

/-! ## Layer 2: Ramsey numbers of hypergraphs -/

/-- 2.1 The Ramsey property for `m`-uniform hypergraphs: every colouring of the `m`-element subsets
of an `n`-element set with colours in `K` has, for some colour `k`, a set `S` of `f k` elements all
of whose `m`-element subsets have colour `k`. -/
def HypergraphRamseyProp {K : Type*} (m : ℕ) (f : K → ℕ) (n : ℕ) : Prop :=
  ∀ c : {s : Finset (Fin n) // s.card = m} → K, ∃ k : K, ∃ S : Finset (Fin n), S.card = f k ∧
    ∀ s : {s : Finset (Fin n) // s.card = m}, s.1 ⊆ S → c s = k

/-- 2.1 The hypergraph Ramsey number: the infimum in `ℕ` of the numbers of elements with the
hypergraph Ramsey property. By 2.2 it is the least such number when `K` is finite. -/
def hypergraphRamseyNumber {K : Type*} (m : ℕ) (f : K → ℕ) : ℕ :=
  sInf {n | HypergraphRamseyProp m f n}

/-- 2.2 Ramsey's theorem for `m`-uniform hypergraphs in finitely many colours: the property holds
on `n` elements exactly when `n` is at least the hypergraph Ramsey number. -/
theorem hypergraphRamseyProp_iff {K : Type*} [Finite K] (m : ℕ) (f : K → ℕ) (n : ℕ) :
    HypergraphRamseyProp m f n ↔ hypergraphRamseyNumber m f ≤ n := by
  sorry

/-- 2.3 For `m = 2` the hypergraph Ramsey property is the Ramsey property of Layer 1, for every
type of colours and every number of vertices. -/
theorem hypergraphRamseyProp_two_iff {K : Type*} (f : K → ℕ) (n : ℕ) :
    HypergraphRamseyProp 2 f n ↔ RamseyProp f n := by
  sorry

/-! ## Layer 3: upper bounds -/

/-- 3.1 The recurrence of Greenwood and Gleason in `r` colours: if every `f k` is at least `2`,
then `R(f) ≤ 2 − r + ∑ₖ R(f − eₖ)`, where `f − eₖ` lowers the `k`-th entry by one. -/
theorem ramseyNumber_add_card_le {K : Type*} [Fintype K] [DecidableEq K] (f : K → ℕ)
    (hf : ∀ k, 2 ≤ f k) :
    ramseyNumber f + Fintype.card K ≤
      2 + ∑ k, ramseyNumber (Function.update f k (f k - 1)) := by
  sorry

/-- 3.2 The binomial bound: `R(s + 1, t + 1) ≤ binom(s + t, s)` for all `s, t`. -/
theorem ramseyNumber_two_le_choose (s t : ℕ) :
    ramseyNumber ![s + 1, t + 1] ≤ (s + t).choose s := by
  sorry

/-- 3.3 The parity refinement of Greenwood and Gleason: if `R(s + 1, t + 2)` and `R(s + 2, t + 1)`
are both even, then `R(s + 2, t + 2)` is strictly less than their sum. -/
theorem ramseyNumber_two_lt_of_even (s t : ℕ) (hs : Even (ramseyNumber ![s + 1, t + 2]))
    (ht : Even (ramseyNumber ![s + 2, t + 1])) :
    ramseyNumber ![s + 2, t + 2] < ramseyNumber ![s + 1, t + 2] + ramseyNumber ![s + 2, t + 1] := by
  sorry

/-! ## Layer 4: exact values -/

/-- 4.1 `R(3, 4) = 9`. -/
theorem ramseyNumber_three_four : ramseyNumber ![3, 4] = 9 := by
  sorry

/-- 4.1 `R(3, 5) = 14`. -/
theorem ramseyNumber_three_five : ramseyNumber ![3, 5] = 14 := by
  sorry

/-- 4.2 `R(4, 4) = 18`. -/
theorem ramseyNumber_four_four : ramseyNumber ![4, 4] = 18 := by
  sorry

/-- 4.3 `R(3, 3, 3) = 17`. -/
theorem ramseyNumber_three_three_three : ramseyNumber ![3, 3, 3] = 17 := by
  sorry

/-! ## Layer 5: Erdős's lower bound -/

/-- 5.1 Erdős's counting criterion: if `binom(n, k) · 2 < 2 ^ binom(k, 2)`, some two-colouring of the
edges of the complete graph on `n` vertices has no monochromatic set of `k` vertices, so
`n < R(k, k)`. -/
theorem lt_ramseyNumber_of_choose_mul_two_lt (n k : ℕ) (h : n.choose k * 2 < 2 ^ k.choose 2) :
    n < ramseyNumber ![k, k] := by
  sorry

/-- 5.2 Erdős's lower bound: `R(k, k) > 2 ^ (k / 2)` (real exponent) for every `k ≥ 3`, written
without real numbers as `2 ^ k < R(k, k) ^ 2`. -/
theorem two_pow_lt_ramseyNumber_sq (k : ℕ) (hk : 3 ≤ k) :
    2 ^ k < ramseyNumber ![k, k] ^ 2 := by
  sorry

/-! ## Layer 6: Schur's theorem -/

/-- 6.1 Schur's theorem with the Ramsey bound: if `κ` is finite and `R(3, …, 3)`, with one entry `3`
for each colour, is at most `N + 1`, then every colouring `c` of the positive integers with
colours in `κ` has positive `x`, `y` with `x + y ≤ N` and `x`, `y`, `x + y` of one colour. -/
theorem exists_add_eq_of_ramseyNumber_le {κ : Type*} [Finite κ] (c : ℕ → κ) (N : ℕ)
    (hN : ramseyNumber (fun _ : κ => 3) ≤ N + 1) :
    ∃ x y, 0 < x ∧ 0 < y ∧ x + y ≤ N ∧ c x = c y ∧ c (x + y) = c x := by
  sorry

end TauCetiRoadmap.RamseyNumbers
