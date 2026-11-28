import Mathlib

/-!
# Combinatorics of words: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need, each with a real body. Every headline theorem of the README is statable at the pins and
is stated here.

Words are lists. Over a linearly ordered alphabet, words are compared by Mathlib's lexicographic
order on `List`, in which a proper prefix is smaller than the word.
-/

namespace TauCetiRoadmap.CombinatoricsOfWords

variable {α : Type*}

/-! ## Layer 1: borders and the failure function -/

/-- 1.1 The failure function: the length of the longest border of `w`, that is, the largest
`i < |w|` such that the prefix of length `i` is also a suffix; it is `0` for the empty word. -/
def borderLength [DecidableEq α] (w : List α) : ℕ :=
  ((Finset.range w.length).filter fun i => w.take i <:+ w).sup id

/-- 1.1 **Borders of borders.** For a nonempty word `w`, the lengths of its borders are exactly
the values `f^[c] |w|` with `c ≥ 1`, where `f j` is the failure function of the prefix of `w` of
length `j`. -/
theorem take_isSuffix_iff_exists_iterate [DecidableEq α] {w : List α} (hw : w ≠ []) (i : ℕ) :
    (i < w.length ∧ w.take i <:+ w) ↔
      ∃ c, 1 ≤ c ∧ (fun j => borderLength (w.take j))^[c] w.length = i := by
  sorry

/-- 1.2 **The failure-function recurrence.** The failure function of `w ++ [a]` is one more than
the largest border length `i` of `w` whose next letter `w[i]` is `a`, and `0` if there is no
such border. -/
theorem borderLength_append_singleton [DecidableEq α] (w : List α) (a : α) :
    borderLength (w ++ [a]) =
      ((Finset.range w.length).filter fun i => w.take i <:+ w ∧ w[i]? = some a).sup (· + 1) := by
  sorry

/-! ## Layer 2: Lyndon words -/

/-- 2.1 A Lyndon word: a nonempty word strictly smaller than each of its nonempty proper
suffixes. -/
def IsLyndon [LinearOrder α] (w : List α) : Prop :=
  w ≠ [] ∧ ∀ i, 0 < i → i < w.length → w < w.drop i

/-- 2.1 **Lyndon words by rotations.** A word is Lyndon exactly when it is nonempty and strictly
smaller than each of its nontrivial rotations. -/
theorem isLyndon_iff_lt_rotate [LinearOrder α] (w : List α) :
    IsLyndon w ↔ w ≠ [] ∧ ∀ i, 0 < i → i < w.length → w < w.rotate i := by
  sorry

/-- 2.1 **Lyndon words by splittings.** A word is Lyndon exactly when it is nonempty and, for
every splitting `w = u ++ v` into two nonempty words, `u < v`. -/
theorem isLyndon_iff_take_lt_drop [LinearOrder α] (w : List α) :
    IsLyndon w ↔ w ≠ [] ∧ ∀ i, 0 < i → i < w.length → w.take i < w.drop i := by
  sorry

/-- 2.2 **Products of Lyndon words.** If `u` and `v` are Lyndon words and `u < v`, then `u ++ v`
is a Lyndon word. -/
theorem IsLyndon.append [LinearOrder α] {u v : List α} (hu : IsLyndon u) (hv : IsLyndon v)
    (huv : u < v) : IsLyndon (u ++ v) := by
  sorry

/-- 2.3 **The standard factorization.** Let `w = u ++ v` be a Lyndon word with `u` and `v`
nonempty, where `v` is the smallest nonempty proper suffix of `w`. Then `u` and `v` are Lyndon
words and `u < w < v`. -/
theorem IsLyndon.standard_factorization [LinearOrder α] {w u v : List α} (hw : IsLyndon w)
    (hu : u ≠ []) (hv : v ≠ []) (huv : w = u ++ v)
    (hmin : ∀ s, s ≠ [] → s <:+ w → s ≠ w → v ≤ s) :
    IsLyndon u ∧ IsLyndon v ∧ u < w ∧ w < v := by
  sorry

/-! ## Layer 3: the Chen–Fox–Lyndon factorization -/

/-- 3.1 A Chen–Fox–Lyndon factorization of `w`: a list of Lyndon words, in nonincreasing order,
whose concatenation is `w`. -/
def IsCFLFactorization [LinearOrder α] (w : List α) (l : List (List α)) : Prop :=
  (∀ x ∈ l, IsLyndon x) ∧ l.Pairwise (· ≥ ·) ∧ l.flatten = w

/-- 3.1 **The Chen–Fox–Lyndon theorem.** Every word has exactly one Chen–Fox–Lyndon
factorization. -/
theorem existsUnique_isCFLFactorization [LinearOrder α] (w : List α) :
    ∃! l, IsCFLFactorization w l := by
  sorry

/-! ## Layer 4: counting Lyndon words -/

/-- 4.1 **Words as rotations of powers of Lyndon words.** For `n ≥ 1`, summing `d` times the
number of Lyndon words of length `d` over all divisors `d` of `n` gives the number `kⁿ` of words
of length `n` on `k` letters. By Möbius inversion
(`ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`) this is equivalent to the count
`n · L(k, n) = ∑_{d ∣ n} μ(d) k^(n/d)` of the Lyndon words. -/
theorem sum_divisors_mul_card_lyndon (k n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, d * Nat.card {w : Fin d → Fin k // IsLyndon (List.ofFn w)} = k ^ n := by
  sorry

/-! ## Layer 5: the Fredricksen–Maiorana de Bruijn word -/

/-- 5.1 The Fredricksen–Maiorana word of order `n` on `k` letters: the concatenation, in
increasing lexicographic order, of the Lyndon words on `Fin k` whose length divides `n`. -/
noncomputable def fkmWord (k n : ℕ) : List (Fin k) :=
  open Classical in
  (((n.divisors.biUnion fun d => (Finset.univ : Finset (Fin d → Fin k)).image List.ofFn).filter
    IsLyndon).sort (· ≤ ·)).flatten

/-- 5.1 A de Bruijn sequence of order `n` on `k` letters: a word of length `kⁿ` in which every
word of length `n` occurs exactly once as a cyclic factor (copied verbatim from
DirectedMatrixTreeAndBEST 5.2). -/
def IsDeBruijn (k n : ℕ) (s : Fin (k ^ n) → Fin k) : Prop :=
  ∀ u : Fin n → Fin k, ∃! i : Fin (k ^ n),
    ∀ j : Fin n, s ⟨((i : ℕ) + j) % k ^ n, Nat.mod_lt _ i.pos⟩ = u j

/-- 5.1 **The Fredricksen–Maiorana theorem.** For `n ≥ 1` the Fredricksen–Maiorana word of order
`n` on `k` letters has length `kⁿ` and is a de Bruijn sequence of order `n`. -/
theorem isDeBruijn_fkmWord (k n : ℕ) (hn : 1 ≤ n) :
    ∃ h : (fkmWord k n).length = k ^ n,
      IsDeBruijn k n (fun i => (fkmWord k n).get (Fin.cast h.symm i)) := by
  sorry

end TauCetiRoadmap.CombinatoricsOfWords
