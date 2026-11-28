import Mathlib

/-!
# Communication complexity: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A deterministic protocol is a finite binary tree whose internal nodes belong to Alice or to Bob
and carry a bit-valued function of that player's input, and whose leaves carry an output. Its
cost is its depth, the number of bits on a longest path; the output is read off the leaf, so the
last bit announced counts. The deterministic communication complexity of `f : X → Y → Bool` is
the least depth of a protocol computing `f`, an `sInf` of a set of natural numbers that is
nonempty as soon as `X` is finite (1.1).
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.CommunicationComplexity

/-! ## Layer 1: protocols and the rectangle property -/

/-- 1.1 A deterministic two-party protocol with inputs `X` (Alice) and `Y` (Bob) and outputs in
`Z`: a leaf with an output, or a node at which Alice (or Bob) sends the bit `a x` (or `b y`);
the protocol continues with the first subtree after the bit `false` and with the second after
`true`. -/
inductive Protocol (X Y Z : Type*) : Type _ where
  | leaf (z : Z) : Protocol X Y Z
  | alice (a : X → Bool) (p₀ p₁ : Protocol X Y Z) : Protocol X Y Z
  | bob (b : Y → Bool) (p₀ p₁ : Protocol X Y Z) : Protocol X Y Z

namespace Protocol

variable {X Y Z : Type*}

/-- 1.1 The output of a protocol on the inputs `x` and `y`: the label of the leaf reached. -/
def eval : Protocol X Y Z → X → Y → Z
  | leaf z, _, _ => z
  | alice a p₀ p₁, x, y => if a x then p₁.eval x y else p₀.eval x y
  | bob b p₀ p₁, x, y => if b y then p₁.eval x y else p₀.eval x y

/-- 1.1 The cost of a protocol: the depth of its tree, the number of bits sent on a longest
path from the root to a leaf. -/
def depth : Protocol X Y Z → ℕ
  | leaf _ => 0
  | alice _ p₀ p₁ => max p₀.depth p₁.depth + 1
  | bob _ p₀ p₁ => max p₀.depth p₁.depth + 1

/-- 1.2 The transcript of a protocol on `x` and `y`: the list of bits sent, in order. -/
def transcript : Protocol X Y Z → X → Y → List Bool
  | leaf _, _, _ => []
  | alice a p₀ p₁, x, y => a x :: (if a x then p₁.transcript x y else p₀.transcript x y)
  | bob b p₀ p₁, x, y => b y :: (if b y then p₁.transcript x y else p₀.transcript x y)

/-- 1.2 The rectangle property: if the inputs `(x, y)` and `(x', y')` produce the same
transcript, so does `(x, y')`. Hence the inputs with a given transcript form a set `A ×ˢ B`. -/
theorem transcript_eq_of_transcript_eq (p : Protocol X Y Z) {x x' : X} {y y' : Y}
    (h : p.transcript x y = p.transcript x' y') : p.transcript x y' = p.transcript x y := by
  sorry

end Protocol

variable {X Y : Type*}

/-- 1.1 The deterministic communication complexity `D(f)`: the least depth of a protocol whose
output on every pair of inputs is `f x y`. -/
def commComplexity (f : X → Y → Bool) : ℕ :=
  sInf {d | ∃ p : Protocol X Y Bool, (∀ x y, p.eval x y = f x y) ∧ p.depth ≤ d}

/-- 1.1 The trivial protocol: Alice sends her input in `⌈log₂ |X|⌉` bits and Bob announces
the value, so `D(f) ≤ ⌈log₂ |X|⌉ + 1`. In particular the set in `commComplexity` is nonempty
when `X` is finite. -/
theorem commComplexity_le [Fintype X] (f : X → Y → Bool) :
    commComplexity f ≤ Nat.clog 2 (Fintype.card X) + 1 := by
  sorry

/-- 1.3 A set of input pairs is a monochromatic rectangle of `f` when it is a product
`A ×ˢ B` on which `f` takes a single value. -/
def IsMonoRectangle (f : X → Y → Bool) (R : Finset (X × Y)) : Prop :=
  (∃ (A : Finset X) (B : Finset Y), R = A ×ˢ B) ∧ ∃ b : Bool, ∀ q ∈ R, f q.1 q.2 = b

/-- 1.3 The leaves of a protocol of depth `d` with outputs in `Bool` partition `X × Y` into at
most `2 ^ d` nonempty rectangles on each of which the output is constant. -/
theorem Protocol.exists_finpartition_isMonoRectangle [Fintype X] [Fintype Y] [DecidableEq X]
    [DecidableEq Y] (p : Protocol X Y Bool) :
    ∃ P : Finpartition (univ : Finset (X × Y)),
      P.parts.card ≤ 2 ^ p.depth ∧ ∀ R ∈ P.parts, IsMonoRectangle (fun x y => p.eval x y) R := by
  sorry

/-! ## Layer 2: rectangle partitions, rank and fooling sets -/

section Finite

variable [Fintype X] [Fintype Y] [DecidableEq X] [DecidableEq Y]

/-- 2.1 The partition number `χ(f)`: the least number of parts of a partition of `X × Y` into
nonempty monochromatic rectangles. The partition into singletons shows that the set is
nonempty. -/
def partitionNumber (f : X → Y → Bool) : ℕ :=
  sInf {k | ∃ P : Finpartition (univ : Finset (X × Y)),
    P.parts.card = k ∧ ∀ R ∈ P.parts, IsMonoRectangle f R}

/-- 2.1 The partition bound: `χ(f) ≤ 2 ^ D(f)`, that is `D(f) ≥ log₂ χ(f)`. -/
theorem partitionNumber_le_two_pow_commComplexity (f : X → Y → Bool) :
    partitionNumber f ≤ 2 ^ commComplexity f := by
  sorry

/-- 2.2 The communication matrix of `f` over a field `K`: the entry is `1` where `f` is true
and `0` where it is false. -/
def commMatrix (K : Type*) [Field K] (f : X → Y → Bool) : Matrix X Y K :=
  Matrix.of fun x y => if f x y then 1 else 0

/-- 2.2 The rank bound (Mehlhorn–Schmidt, in the form with both colours): over every field,
`rank M_f + rank M_{¬f} ≤ χ(f)`. -/
theorem rank_add_rank_le_partitionNumber (K : Type*) [Field K] (f : X → Y → Bool) :
    (commMatrix K f).rank + (commMatrix K fun x y => !f x y).rank ≤ partitionNumber f := by
  sorry

/-- 2.3 A fooling set for `f` with value `b`: `f = b` at every pair of `S`, and for two
distinct pairs `(x, y)`, `(x', y')` of `S`, `f x y' ≠ b` or `f x' y ≠ b`. -/
def IsFoolingSet (f : X → Y → Bool) (b : Bool) (S : Finset (X × Y)) : Prop :=
  (∀ q ∈ S, f q.1 q.2 = b) ∧
    ∀ q ∈ S, ∀ q' ∈ S, q ≠ q' → f q.1 q'.2 ≠ b ∨ f q'.1 q.2 ≠ b

/-- 2.3 The fooling-set bound: a fooling set has at most `χ(f)` pairs. -/
theorem card_le_partitionNumber_of_isFoolingSet (f : X → Y → Bool) (b : Bool)
    (S : Finset (X × Y)) (hS : IsFoolingSet f b S) : S.card ≤ partitionNumber f := by
  sorry

end Finite

/-- 2.4 Equality of two `n`-bit strings. -/
def equality (n : ℕ) (x y : Fin n → Bool) : Bool :=
  decide (x = y)

/-- 2.4 Disjointness: the sets of positions where `x` and where `y` are `true` do not meet. -/
def disjointness (n : ℕ) (x y : Fin n → Bool) : Bool :=
  decide (∀ i, ¬(x i = true ∧ y i = true))

/-- 2.4 `D(EQ_n) = n + 1` for `n ≥ 1`. -/
theorem commComplexity_equality (n : ℕ) (hn : 1 ≤ n) :
    commComplexity (equality n) = n + 1 := by
  sorry

/-- 2.4 `D(DISJ_n) = n + 1` for `n ≥ 1`. -/
theorem commComplexity_disjointness (n : ℕ) (hn : 1 ≤ n) :
    commComplexity (disjointness n) = n + 1 := by
  sorry

/-! ## Layer 3: discrepancy -/

/-- 3.1 The sign `±1` of a bit: `-1` for `true`, `1` for `false`. -/
def boolSign (b : Bool) : ℝ :=
  if b then -1 else 1

section Discrepancy

variable [Fintype X] [Fintype Y]

/-- 3.1 The discrepancy of `f` for real weights `μ` on `X × Y`: the largest value over all
rectangles `A ×ˢ B` of `|∑_{x ∈ A, y ∈ B} μ (x, y) · (±1 of f x y)|`. -/
def discrepancy (μ : X × Y → ℝ) (f : X → Y → Bool) : ℝ :=
  (univ : Finset (Finset X × Finset Y)).sup' univ_nonempty fun AB =>
    |∑ x ∈ AB.1, ∑ y ∈ AB.2, μ (x, y) * boolSign (f x y)|

/-- 3.2 The distributional discrepancy bound: for weights `μ` with total `1` and a protocol
whose outputs differ from `f` on a set of weight at most `ε`,
`1 - 2 ε ≤ 2 ^ depth · disc_μ(f)`. -/
theorem one_sub_two_mul_le_two_pow_depth_mul_discrepancy (μ : X × Y → ℝ)
    (hμ : ∑ q, μ q = 1) (f : X → Y → Bool) (p : Protocol X Y Bool) (ε : ℝ)
    (hε : ∑ q ∈ univ.filter (fun q : X × Y => p.eval q.1 q.2 ≠ f q.1 q.2), μ q ≤ ε) :
    1 - 2 * ε ≤ 2 ^ p.depth * discrepancy μ f := by
  sorry

/-- 3.3 The discrepancy bound for public-coin protocols: if a probability distribution `w` on a
finite family of protocols of depth at most `d` errs with probability at most `ε` on every
input, then `1 - 2 ε ≤ 2 ^ d · disc_μ(f)` for every probability distribution `μ` on `X × Y`. -/
theorem one_sub_two_mul_le_two_pow_mul_discrepancy_of_publicCoin {ι : Type*} [Fintype ι]
    (ps : ι → Protocol X Y Bool) (w : ι → ℝ) (hw₀ : ∀ i, 0 ≤ w i) (hw : ∑ i, w i = 1)
    (d : ℕ) (hd : ∀ i, (ps i).depth ≤ d) (f : X → Y → Bool) (ε : ℝ)
    (hε : ∀ x y, ∑ i ∈ univ.filter (fun i => (ps i).eval x y ≠ f x y), w i ≤ ε)
    (μ : X × Y → ℝ) (hμ₀ : ∀ q, 0 ≤ μ q) (hμ : ∑ q, μ q = 1) :
    1 - 2 * ε ≤ 2 ^ d * discrepancy μ f := by
  sorry

end Discrepancy

/-! ## Layer 4: the inner product function -/

/-- 4.1 The inner product modulo `2` of two `n`-bit strings: `true` when the number of
positions where both are `true` is odd. -/
def innerProduct (n : ℕ) (x y : Fin n → Bool) : Bool :=
  decide (Odd (univ.filter fun i => x i = true ∧ y i = true).card)

/-- 4.1 The sign matrix of the inner product function is a Hadamard matrix: its entries are
`±1` and `H * Hᵀ = 2 ^ n • 1`. -/
theorem isHadamard_innerProduct (n : ℕ) :
    (Matrix.of fun x y : Fin n → Bool => boolSign (innerProduct n x y)).IsHadamard := by
  sorry

/-- 4.2 Lindsey's lemma: for all sets `A`, `B` of `n`-bit strings,
`|∑_{x ∈ A, y ∈ B} (±1 of ⟨x, y⟩)| ≤ √(|A| |B| 2 ^ n)`. -/
theorem abs_sum_boolSign_innerProduct_le (n : ℕ) (A B : Finset (Fin n → Bool)) :
    |∑ x ∈ A, ∑ y ∈ B, boolSign (innerProduct n x y)| ≤
      Real.sqrt (A.card * B.card * 2 ^ n) := by
  sorry

/-- 4.3 Under the uniform distribution the inner product function has discrepancy at most
`2 ^ (-n/2)`. -/
theorem discrepancy_innerProduct_le (n : ℕ) :
    discrepancy (fun _ => (1 / 4 ^ n : ℝ)) (innerProduct n) ≤ 1 / Real.sqrt (2 ^ n) := by
  sorry

/-- 4.3 Public-coin protocols for the inner product function: if a probability distribution on
a finite family of protocols of depth at most `d` errs with probability at most `ε` on every
input, then `(1 - 2 ε) · 2 ^ (n/2) ≤ 2 ^ d`. -/
theorem one_sub_two_mul_mul_sqrt_le_of_innerProduct {ι : Type*} [Fintype ι] (n : ℕ)
    (ps : ι → Protocol (Fin n → Bool) (Fin n → Bool) Bool) (w : ι → ℝ) (hw₀ : ∀ i, 0 ≤ w i)
    (hw : ∑ i, w i = 1) (d : ℕ) (hd : ∀ i, (ps i).depth ≤ d) (ε : ℝ)
    (hε : ∀ x y, ∑ i ∈ univ.filter (fun i => (ps i).eval x y ≠ innerProduct n x y), w i ≤ ε) :
    (1 - 2 * ε) * Real.sqrt (2 ^ n) ≤ 2 ^ d := by
  sorry

/-- 4.4 `D(IP_n) = n + 1` for `n ≥ 1`. -/
theorem commComplexity_innerProduct (n : ℕ) (hn : 1 ≤ n) :
    commComplexity (innerProduct n) = n + 1 := by
  sorry

end TauCetiRoadmap.CommunicationComplexity
