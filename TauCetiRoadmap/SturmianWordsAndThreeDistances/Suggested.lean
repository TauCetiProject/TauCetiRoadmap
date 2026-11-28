import Mathlib

/-!
# Sturmian words and three distances: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need, each with a real body. Every headline theorem of the README is statable at the pins and
is stated here.

An infinite word is a function `ℕ → ℤ`; its factor of length `n` at position `i` is the list
`[u i, …, u (i + n - 1)]`, written `(List.range n).map fun k => u (i + k)` as in the body of
`complexity`. The definition `complexity` is copied verbatim from SubspaceTheorem 7.3, and
`orbitFract` and `gaps` are copied verbatim from Equidistribution 4.1.
-/

noncomputable section

namespace TauCetiRoadmap.SturmianWordsAndThreeDistances

open Filter Topology

/-! ## Layer 1: mechanical words -/

/-- 1.1 The lower mechanical word of slope `α` and intercept `ρ`:
`n ↦ ⌊(n + 1) α + ρ⌋ − ⌊n α + ρ⌋`. -/
noncomputable def lowerMechanical (α ρ : ℝ) (n : ℕ) : ℤ :=
  ⌊((n : ℝ) + 1) * α + ρ⌋ - ⌊(n : ℝ) * α + ρ⌋

/-- 1.1 The upper mechanical word of slope `α` and intercept `ρ`:
`n ↦ ⌈(n + 1) α + ρ⌉ − ⌈n α + ρ⌉`. -/
noncomputable def upperMechanical (α ρ : ℝ) (n : ℕ) : ℤ :=
  ⌈((n : ℝ) + 1) * α + ρ⌉ - ⌈(n : ℝ) * α + ρ⌉

/-- 1.2 The number of distinct factors of length `n` (copied verbatim from SubspaceTheorem 7.3,
where it is the README's `Function.complexity`). -/
def complexity {α : Type*} (a : ℕ → α) (n : ℕ) : ℕ :=
  Set.ncard (Set.range fun i : ℕ ↦ (List.range n).map fun k ↦ a (i + k))

/-! ## Layer 2: factor complexity -/

/-- 2.1 **Complexity `n + 1`.** A lower or upper mechanical word of irrational slope has exactly
`n + 1` distinct factors of length `n`, for every `n` and every intercept. -/
theorem complexity_eq_add_one {α ρ : ℝ} (hα : Irrational α) {u : ℕ → ℤ}
    (hu : u = lowerMechanical α ρ ∨ u = upperMechanical α ρ) (n : ℕ) :
    complexity u n = n + 1 := by
  sorry

/-! ## Layer 3: factors, frequencies and the three distances -/

section Copied

open Finset

/-- 3.1 The first `N` points of the rotation by `α`, as fractional parts in `[0, 1)` (copied
verbatim from Equidistribution 4.1). -/
noncomputable def orbitFract (α : ℝ) (N : ℕ) : Finset ℝ :=
  (range N).image fun n : ℕ => Int.fract (n * α)

/-- 3.1 The multiset of gaps between consecutive points of `orbitFract α N`, including the
wrap-around gap from the largest point to `1` (copied verbatim from Equidistribution 4.1). -/
noncomputable def gaps (α : ℝ) (N : ℕ) : Multiset ℝ :=
  let s := (orbitFract α N).sort (· ≤ ·)
  ((List.zipWith (· - ·) (s.tail ++ [1]) s : List ℝ) : Multiset ℝ)

end Copied

/-- 3.1 The number of positions `i ≤ N` at which the word `w` occurs in `u`. -/
def occurrenceCount {β : Type*} [DecidableEq β] (u : ℕ → β) (w : List β) (N : ℕ) : ℕ :=
  ((Finset.range (N + 1)).filter fun i => (List.range w.length).map (fun k => u (i + k)) = w).card

/-- 3.1 The frequency of the word `w` in `u`: the limit of `occurrenceCount u w N / (N + 1)`
when it exists (and Mathlib's junk value of `limUnder` otherwise). -/
noncomputable def frequency {β : Type*} [DecidableEq β] (u : ℕ → β) (w : List β) : ℝ :=
  limUnder atTop fun N : ℕ => (occurrenceCount u w N : ℝ) / (N + 1)

/-- 3.2 **Factors and their frequencies.** Let `α` be real and `u` the lower or upper mechanical
word of slope `α` and intercept `ρ`. The factors of length `n` of `u` are exactly the words
`wₜ = [s(0), …, s(n − 1)]` of the lower mechanical words `s` of slope `α` and intercept `t`, for `t`
among the points `{−k α}`, `0 ≤ k ≤ n` (`n + 1` distinct points for irrational `α`); each of these
words has a frequency in `u`; and the frequencies, listed over the points `t`, form the multiset of
the gaps between the consecutive points `{−k α}`, `0 ≤ k ≤ n`, on the circle. -/
theorem factors_and_frequencies {α ρ : ℝ} {u : ℕ → ℤ}
    (hu : u = lowerMechanical α ρ ∨ u = upperMechanical α ρ) (n : ℕ) :
    (Set.range fun i : ℕ => (List.range n).map fun k => u (i + k)) =
        (fun t => (List.range n).map (lowerMechanical α t)) '' ↑(orbitFract (-α) (n + 1)) ∧
      (∀ t ∈ orbitFract (-α) (n + 1),
        Tendsto (fun N : ℕ =>
            (occurrenceCount u ((List.range n).map (lowerMechanical α t)) N : ℝ) / (N + 1))
          atTop (𝓝 (frequency u ((List.range n).map (lowerMechanical α t))))) ∧
      (orbitFract (-α) (n + 1)).val.map
          (fun t => frequency u ((List.range n).map (lowerMechanical α t))) =
        gaps (-α) (n + 1) := by
  sorry

/-! ## Layer 4: balanced words -/

/-- 4.1 A word over `ℤ` is balanced when any two factors of the same length have sums that differ
by at most `1`; for a word over `{0, 1}` the sum of a factor is its number of letters `1`. -/
def IsBalanced (u : ℕ → ℤ) : Prop :=
  ∀ i j n : ℕ,
    |∑ k ∈ Finset.range n, u (i + k) - ∑ k ∈ Finset.range n, u (j + k)| ≤ 1

/-- 4.2 **Sturmian words are the balanced aperiodic binary words.** A word `u : ℕ → ℤ` takes only
the values `0` and `1`, is balanced and is not eventually periodic if and only if it is the lower
or the upper mechanical word of some irrational slope `0 < α < 1` and some intercept `ρ`. -/
theorem balanced_aperiodic_iff {u : ℕ → ℤ} :
    ((∀ n, u n = 0 ∨ u n = 1) ∧ IsBalanced u ∧ ¬ ∃ N p, 0 < p ∧ ∀ n ≥ N, u (n + p) = u n) ↔
      ∃ α ρ : ℝ, Irrational α ∧ 0 < α ∧ α < 1 ∧
        (u = lowerMechanical α ρ ∨ u = upperMechanical α ρ) := by
  sorry

end TauCetiRoadmap.SturmianWordsAndThreeDistances

end
