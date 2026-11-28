import Mathlib

/-!
# Fair division: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's route steps, API lists and Checks are not
restated.

A divisible cake is the interval `[0, 1)`. A division of it among `n + 1` players is a cut-set, a
point `x` of `simplex (Fin (n + 1))`, copied verbatim from RegretMinimizationAndEquilibria, whose
coordinates are the lengths of the pieces, together with a permutation saying which piece each
player receives; piece `k` is the half-open interval between the `k`-th and the `(k + 1)`-th partial
sums of `x`. Players value the cake by measures on `ℝ`. Indivisible goods are a finite type `α`
allocated to a finite type `ι` of players by a map `α → ι`; valuations are real functions on
`Finset α`. A bankruptcy problem is a vector of claims and an estate.
-/

noncomputable section

open MeasureTheory
open scoped ENNReal

namespace TauCetiRoadmap.FairDivision

/-! ## Layer 1: cut-sets and pieces -/

-- 1.1 (copied verbatim from RegretMinimizationAndEquilibria, Layer 1, 1.1); the cut-sets for
-- `n + 1` pieces are the points of `simplex (Fin (n + 1))`, vectors of nonnegative piece lengths
-- summing to one.
/-- The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-- 1.1 The `k`-th cut point of a cut-set: the total length of the pieces with index below
`k`. -/
def cutPoint {n : ℕ} (x : Fin (n + 1) → ℝ) (k : ℕ) : ℝ :=
  ∑ j ∈ Finset.univ.filter (fun j : Fin (n + 1) => (j : ℕ) < k), x j

/-- 1.1 The `k`-th piece of a cut-set: the half-open interval between the `k`-th and the
`(k + 1)`-th cut points. -/
def piece {n : ℕ} (x : Fin (n + 1) → ℝ) (k : Fin (n + 1)) : Set ℝ :=
  Set.Ico (cutPoint x k) (cutPoint x ((k : ℕ) + 1))

/-! ## Layer 2: proportional division -/

/-- 2.1 Proportional division into intervals: for `n + 1` measures that are finite and have no
atoms on `[0, 1)`, some cut-set and some assignment of its pieces give every player a piece worth
at least `1 / (n + 1)` of that player's value of the whole cake. -/
theorem exists_proportional_intervals (n : ℕ) (μ : Fin (n + 1) → Measure ℝ)
    (hfin : ∀ p, μ p (Set.Ico 0 1) ≠ ∞) (hatom : ∀ p, ∀ t ∈ Set.Ico (0 : ℝ) 1, μ p {t} = 0) :
    ∃ x ∈ simplex (Fin (n + 1)), ∃ π : Equiv.Perm (Fin (n + 1)),
      ∀ p, μ p (Set.Ico 0 1) ≤ ((n : ℝ≥0∞) + 1) * μ p (piece x (π p)) := by
  sorry

/-! ## Layer 3: envy-free division -/

/-- 3.1 Envy-free cut-sets for closed, hungry preferences (Simmons–Su): if the set of cut-sets
at which player `p` prefers piece `k` is closed for every `p` and `k`, and at every cut-set each
player prefers some piece of positive length, then at some cut-set the players prefer pairwise
different pieces. -/
theorem exists_envyFree_of_closed_hungry (n : ℕ)
    (pref : Fin (n + 1) → (Fin (n + 1) → ℝ) → Set (Fin (n + 1)))
    (hclosed : ∀ p k, IsClosed {x | x ∈ simplex (Fin (n + 1)) ∧ k ∈ pref p x})
    (hhungry : ∀ p, ∀ x ∈ simplex (Fin (n + 1)), ∃ k ∈ pref p x, 0 < x k) :
    ∃ x ∈ simplex (Fin (n + 1)), ∃ π : Equiv.Perm (Fin (n + 1)), ∀ p, π p ∈ pref p x := by
  sorry

/-- 3.2 Envy-free division into intervals: for `n + 1` measures that are finite and have no
atoms on `[0, 1)`, some cut-set and some assignment of its pieces leave no player valuing
another player's piece above its own. -/
theorem exists_envyFree_intervals (n : ℕ) (μ : Fin (n + 1) → Measure ℝ)
    (hfin : ∀ p, μ p (Set.Ico 0 1) ≠ ∞) (hatom : ∀ p, ∀ t ∈ Set.Ico (0 : ℝ) 1, μ p {t} = 0) :
    ∃ x ∈ simplex (Fin (n + 1)), ∃ π : Equiv.Perm (Fin (n + 1)),
      ∀ p q, μ p (piece x (π q)) ≤ μ p (piece x (π p)) := by
  sorry

/-! ## Layer 4: indivisible goods -/

/-- 4.1 The bundle of player `i` under the allocation `a`: the goods `a` sends to `i`. -/
def bundle {ι α : Type*} [Fintype α] [DecidableEq ι] (a : α → ι) (i : ι) : Finset α :=
  Finset.univ.filter fun g => a g = i

/-- 4.1 Envy-freeness up to one good: whenever player `i` values the bundle of `j` above its own,
removing some single good from the bundle of `j` removes the envy. -/
def IsEF1 {ι α : Type*} [Fintype α] [DecidableEq ι] [DecidableEq α]
    (u : ι → Finset α → ℝ) (a : α → ι) : Prop :=
  ∀ i j, u i (bundle a j) ≤ u i (bundle a i) ∨
    ∃ g ∈ bundle a j, u i ((bundle a j).erase g) ≤ u i (bundle a i)

/-- 4.1 Pareto optimality: every allocation that makes no player worse off makes no player
better off. -/
def IsParetoOptimal {ι α : Type*} [Fintype α] [DecidableEq ι]
    (u : ι → Finset α → ℝ) (a : α → ι) : Prop :=
  ∀ b : α → ι, (∀ i, u i (bundle a i) ≤ u i (bundle b i)) → ∀ i, u i (bundle b i) ≤ u i (bundle a i)

/-- 4.2 EF1 allocations exist for monotone valuations (Lipton–Markakis–Mossel–Saberi): with at
least one player, finitely many goods and every valuation monotone under inclusion, some
allocation of all the goods is envy-free up to one good. -/
theorem exists_isEF1_of_monotone {ι α : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    [Fintype α] [DecidableEq α] (u : ι → Finset α → ℝ) (hu : ∀ i, Monotone (u i)) :
    ∃ a : α → ι, IsEF1 u a := by
  sorry

/-- 4.3 Balanced EF1 allocations for additive valuations: for nonnegative values of goods, some
allocation of all the goods is envy-free up to one good and gives any two players numbers of
goods that differ by at most one. -/
theorem exists_isEF1_balanced {ι α : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    [Fintype α] [DecidableEq α] (v : ι → α → ℝ) (hv : ∀ i g, 0 ≤ v i g) :
    ∃ a : α → ι, IsEF1 (fun i A => ∑ g ∈ A, v i g) a ∧
      ∀ i j, (bundle a i).card ≤ (bundle a j).card + 1 := by
  sorry

/-- 4.4 EF1 and Pareto optimal allocations for additive valuations (Caragiannis–Kurokawa–
Moulin–Procaccia–Shah–Wang): for nonnegative values of goods, some allocation of all the goods
is both envy-free up to one good and Pareto optimal. -/
theorem exists_isEF1_isParetoOptimal {ι α : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    [Fintype α] [DecidableEq α] (v : ι → α → ℝ) (hv : ∀ i g, 0 ≤ v i g) :
    ∃ a : α → ι, IsEF1 (fun i A => ∑ g ∈ A, v i g) a ∧
      IsParetoOptimal (fun i A => ∑ g ∈ A, v i g) a := by
  sorry

/-! ## Layer 5: bankruptcy problems and the Talmud rule -/

/-- 5.1 The contested-garment share of the claimant with claim `a` against a claimant with
claim `b`, when the amount `t` is divided: what the other concedes, `max (t - b) 0`, plus half of
what neither concedes. -/
def garmentShare (a b t : ℝ) : ℝ :=
  (t + max (t - b) 0 - max (t - a) 0) / 2

/-- 5.1 A division of the estate `E` among claims `d`: every award is nonnegative and at most its
claim, and the awards add up to `E`. -/
def IsDivision {ι : Type*} [Fintype ι] (d : ι → ℝ) (E : ℝ) (x : ι → ℝ) : Prop :=
  (∀ i, 0 ≤ x i ∧ x i ≤ d i) ∧ ∑ i, x i = E

/-- 5.1 Pairwise consistency with the contested-garment rule: every two claimants split what
they jointly receive as the contested-garment rule splits it between their two claims. -/
def IsGarmentConsistent {ι : Type*} (d x : ι → ℝ) : Prop :=
  ∀ i j, i ≠ j → x i = garmentShare (d i) (d j) (x i + x j)

/-- 5.1 The Talmud allocation: when the estate is at most half the total claim, constrained equal
awards on the half-claims; otherwise each claimant loses a constrained equal amount of its
half-claim. -/
def IsTalmudAllocation {ι : Type*} [Fintype ι] (d : ι → ℝ) (E : ℝ) (x : ι → ℝ) : Prop :=
  ∑ i, x i = E ∧ ∃ l : ℝ, ∀ i,
    x i = if 2 * E ≤ ∑ j, d j then min (d i / 2) l else d i - min (d i / 2) l

/-- 5.2 Aumann–Maschler: for nonnegative claims and an estate between zero and the total claim,
exactly one division is pairwise consistent with the contested-garment rule. -/
theorem existsUnique_isDivision_isGarmentConsistent {ι : Type*} [Fintype ι] (d : ι → ℝ) (E : ℝ)
    (hd : ∀ i, 0 ≤ d i) (hE : 0 ≤ E) (hED : E ≤ ∑ i, d i) :
    ∃! x : ι → ℝ, IsDivision d E x ∧ IsGarmentConsistent d x := by
  sorry

/-- 5.3 The garment-consistent division is the Talmud allocation: for nonnegative claims and an
estate between zero and the total claim, a vector of awards is a division pairwise consistent
with the contested-garment rule exactly when it is the Talmud allocation. -/
theorem isDivision_isGarmentConsistent_iff_isTalmudAllocation {ι : Type*} [Fintype ι]
    (d : ι → ℝ) (E : ℝ) (hd : ∀ i, 0 ≤ d i) (hE : 0 ≤ E) (hED : E ≤ ∑ i, d i) (x : ι → ℝ) :
    IsDivision d E x ∧ IsGarmentConsistent d x ↔ IsTalmudAllocation d E x := by
  sorry

end TauCetiRoadmap.FairDivision
