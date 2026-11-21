import Mathlib

/-!
# Sidon sets and linear equations: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the six
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

A set is a `Finset`. A Sidon set is one in which `a + b = c + d` forces `{a, b} = {c, d}`; this
is the strong form, which in a group with elements of order two also forbids `a + a = b + b` for
`a ≠ b`. A sum-free set is one with no solution of `x + y = z`, `x = y` allowed. For a finite
field `k` with `q` elements, Bose's and Singer's sets are built from a field `L` containing
`k` and an element `θ ∈ L` of multiplicative order `q² − 1` or `q³ − 1`; such a `θ` generates the
multiplicative group of the subfield `k(θ)`, which has `q²` or `q³` elements.
-/

noncomputable section

open Finset Filter Asymptotics

namespace TauCetiRoadmap.SidonSetsAndLinearEquations

/-! ## Layer 1: Sidon sets and the upper bounds -/

section Sidon

variable {G : Type*}

/-- 1.1 A finite set `A` is a Sidon set when `a + b = c + d` with `a, b, c, d ∈ A` forces
`{a, b} = {c, d}`, that is `(a, b) = (c, d)` or `(a, b) = (d, c)`. -/
def IsSidon [Add G] (A : Finset G) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ d ∈ A, a + b = c + d → (a = c ∧ b = d) ∨ (a = d ∧ b = c)

/-- 1.1 In an abelian group, `A` is a Sidon set iff every difference `a − b` of two distinct
elements of `A` determines `a` and `b`. -/
theorem isSidon_iff_sub [AddCommGroup G] (A : Finset G) :
    IsSidon A ↔
      ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ d ∈ A, a ≠ b → a - b = c - d → a = c ∧ b = d := by
  sorry

/-- 1.2 The energy identity: `A` is a Sidon set iff its additive energy is `2|A|² − |A|`, the
number of quadruples `(a, b, c, d)` with `{a, b} = {c, d}`. -/
theorem isSidon_iff_addEnergy [AddCommMonoid G] [DecidableEq G] (A : Finset G) :
    IsSidon A ↔ A.addEnergy A + #A = 2 * #A ^ 2 := by
  sorry

/-- 1.3 The counting bound: a Sidon set `A` in a finite abelian group `G` has
`|A| (|A| − 1) ≤ |G| − 1`. -/
theorem card_mul_card_sub_one_le [AddCommGroup G] [Finite G] {A : Finset G}
    (hA : IsSidon A) : #A * (#A - 1) ≤ Nat.card G - 1 := by
  sorry

end Sidon

/-- 1.4 The Erdős–Turán–Lindström bound: a Sidon set `A ⊆ {1, …, N}` has
`|A| < N^(1/2) + N^(1/4) + 1`. -/
theorem card_lt_sqrt_add_rpow_add_one {N : ℕ} {A : Finset ℕ} (hA : IsSidon A)
    (hAN : A ⊆ Icc 1 N) : (#A : ℝ) < √(N : ℝ) + (N : ℝ) ^ ((1 : ℝ) / 4) + 1 := by
  sorry

/-! ## Layer 2: constructions and the size of the largest Sidon set -/

/-- 2.1 The Erdős–Turán set `{2pk + (k² mod p) : 0 ≤ k < p}`. -/
def erdosTuranSet (p : ℕ) : Finset ℕ :=
  (range p).image fun k => 2 * p * k + k ^ 2 % p

/-- 2.1 For a prime `p`, the Erdős–Turán set is a Sidon set of `p` integers in
`{0, …, 2p² − 1}`. -/
theorem erdosTuranSet_spec {p : ℕ} (hp : p.Prime) :
    IsSidon (erdosTuranSet p) ∧ #(erdosTuranSet p) = p ∧
      erdosTuranSet p ⊆ range (2 * p ^ 2) := by
  sorry

section FiniteField

variable (k : Type*) {L : Type*} [Field k] [Finite k] [Field L] [Algebra k L]

/-- 2.2 Bose's set: the residues modulo `q² − 1` of the exponents `0 ≤ a < q² − 1` with
`θ ^ a − θ ∈ k`, where `q = |k|`. -/
def boseSet (θ : L) : Finset (ZMod (Nat.card k ^ 2 - 1)) := by
  classical
  exact ((range (Nat.card k ^ 2 - 1)).filter
    fun a => ∃ c : k, θ ^ a = θ + algebraMap k L c).image fun a => (a : ZMod _)

/-- 2.2 Bose's theorem: if `k` has `q` elements and `θ ∈ L` has multiplicative order `q² − 1`,
then Bose's set has `q` elements, is a Sidon set modulo `q² − 1`, and every residue whose
representative in `[0, q² − 1)` is not divisible by `q + 1` is the difference of exactly one
ordered pair of its elements. -/
theorem boseSet_spec {θ : L} (hθ : orderOf θ = Nat.card k ^ 2 - 1) :
    #(boseSet k θ) = Nat.card k ∧ IsSidon (boseSet k θ) ∧
      ∀ g : ZMod (Nat.card k ^ 2 - 1), ¬ Nat.card k + 1 ∣ g.val →
        #{x ∈ boseSet k θ ×ˢ boseSet k θ | x.1 - x.2 = g} = 1 := by
  sorry

/-- 2.3 Singer's set: `0` together with the residues modulo `q² + q + 1` of the exponents
`0 ≤ a < q³ − 1` with `θ ^ a − θ ∈ k`, where `q = |k|`. -/
def singerSet (θ : L) : Finset (ZMod (Nat.card k ^ 2 + Nat.card k + 1)) := by
  classical
  exact insert 0 (((range (Nat.card k ^ 3 - 1)).filter
    fun a => ∃ c : k, θ ^ a = θ + algebraMap k L c).image fun a => (a : ZMod _))

/-- 2.3 Singer's theorem, explicit form: if `k` has `q` elements and `θ ∈ L` has
multiplicative order `q³ − 1`, then Singer's set has `q + 1` elements and every nonzero residue
modulo `q² + q + 1` is the difference of exactly one ordered pair of its elements. -/
theorem singerSet_spec {θ : L} (hθ : orderOf θ = Nat.card k ^ 3 - 1) :
    #(singerSet k θ) = Nat.card k + 1 ∧
      ∀ g : ZMod (Nat.card k ^ 2 + Nat.card k + 1), g ≠ 0 →
        #{x ∈ singerSet k θ ×ˢ singerSet k θ | x.1 - x.2 = g} = 1 := by
  sorry

/-- 2.3 Singer's theorem: for every finite field with `q` elements, `ℤ/(q² + q + 1)` contains a
perfect difference set of `q + 1` elements. -/
theorem exists_perfect_difference_set :
    ∃ A : Finset (ZMod (Nat.card k ^ 2 + Nat.card k + 1)),
      #A = Nat.card k + 1 ∧
        ∀ g : ZMod (Nat.card k ^ 2 + Nat.card k + 1), g ≠ 0 →
          #{x ∈ A ×ˢ A | x.1 - x.2 = g} = 1 := by
  sorry

end FiniteField

/-- 2.4 The explicit lower bound: for every `N`, `{1, …, N}` contains a Sidon set of at least
`√N / 2` elements. -/
theorem exists_isSidon_sqrt_div_two_le (N : ℕ) :
    ∃ A ⊆ Icc 1 N, IsSidon A ∧ √(N : ℝ) / 2 ≤ #A := by
  sorry

/-- 2.4 The size of the largest Sidon subset of `{1, …, N}`. -/
def sidonNumber (N : ℕ) : ℕ := by
  classical
  exact ((Icc 1 N).powerset.filter fun A => IsSidon A).sup card

/-- 2.4 The largest Sidon subset of `{1, …, N}` has asymptotically `√N` elements. -/
theorem sidonNumber_isEquivalent :
    (fun N : ℕ => (sidonNumber N : ℝ)) ~[atTop] fun N : ℕ => √(N : ℝ) := by
  sorry

/-! ## Layer 3: sum-free sets -/

section SumFree

variable {G : Type*}

/-- 3.1 A finite set `A` is sum-free when `x + y ∉ A` for all `x, y ∈ A`, `x = y` allowed. -/
def IsSumFree [Add G] (A : Finset G) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, x + y ∉ A

/-- 3.2 Erdős's theorem with the Alon–Kleitman refinement: a nonempty finite set of `n` nonzero
integers has a sum-free subset of at least `(n + 1)/3` elements. -/
theorem exists_isSumFree_card_add_one_le {A : Finset ℤ} (hA : A.Nonempty) (h0 : (0 : ℤ) ∉ A) :
    ∃ B ⊆ A, IsSumFree B ∧ #A + 1 ≤ 3 * #B := by
  sorry

/-- 3.3 Every finite abelian group with at least two elements has a sum-free subset of at least
`2|G|/7` elements. -/
theorem exists_isSumFree_two_mul_card_le [AddCommGroup G] [Finite G] [Nontrivial G] :
    ∃ A : Finset G, IsSumFree A ∧ 2 * Nat.card G ≤ 7 * #A := by
  sorry

end SumFree

/-! ## Layer 4: a single linear equation -/

/-- 4.1 Ruzsa's bound for symmetric equations: let `k ≥ 2` and `a₁, …, a_k` be nonzero integers.
If `A ⊆ {1, …, N}` has no solution of `∑ aᵢ xᵢ = ∑ aᵢ yᵢ` in `2k` pairwise distinct elements
of `A`, then `|A|² ≤ C(2k, 2) · (|a₁| + ⋯ + |a_k|) · N`. -/
theorem card_sq_le_of_forall_not_injective {k N : ℕ} (hk : 2 ≤ k) (a : Fin k → ℤ)
    (ha : ∀ i, a i ≠ 0) {A : Finset ℤ} (hAN : A ⊆ Icc 1 (N : ℤ))
    (hA : ∀ x y : Fin k → ℤ, (∀ i, x i ∈ A) → (∀ i, y i ∈ A) →
      ∑ i, a i * x i = ∑ i, a i * y i → ¬ Function.Injective (Sum.elim x y)) :
    #A ^ 2 ≤ (2 * k).choose 2 * (∑ i, (a i).natAbs) * N := by
  sorry

/-- 4.2 Behrend's construction for `a₁ x₁ + ⋯ + a_k x_k = b y` with positive integers `aᵢ`
and `b = a₁ + ⋯ + a_k`: for every `N` there is `A ⊆ {0, …, N − 1}` in which every solution has
`x₁ = ⋯ = x_k = y`, with `|A| ≥ N exp(−3 √(2 log (2b)) √(log N))`. -/
theorem exists_forall_eq_of_sum_mul_eq {k : ℕ} (a : Fin k → ℕ) (ha : ∀ i, 0 < a i) (N : ℕ) :
    ∃ A ⊆ range N,
      (∀ x : Fin k → ℕ, ∀ y ∈ A, (∀ i, x i ∈ A) →
        ∑ i, a i * x i = (∑ i, a i) * y → ∀ i, x i = y) ∧
      (N : ℝ) * Real.exp (-(3 * √(2 * Real.log (2 * ∑ i, (a i : ℝ)))) * √(Real.log N)) ≤
        #A := by
  sorry

/-- 4.3 An equation `a₁ x₁ + ⋯ + a_k x_k = c` with `a₁ + ⋯ + a_k ≠ 0` or `c ≠ 0` has no
solution at all in some set of at least `⌊N/m⌋` elements of `{1, …, N}`, where
`m = |a₁ + ⋯ + a_k| + |c| + 1`. -/
theorem exists_forall_sum_mul_ne {k : ℕ} (a : Fin k → ℤ) (c : ℤ) (h : ∑ i, a i ≠ 0 ∨ c ≠ 0)
    (N : ℕ) :
    ∃ A ⊆ Icc (1 : ℤ) N, (∀ x : Fin k → ℤ, (∀ i, x i ∈ A) → ∑ i, a i * x i ≠ c) ∧
      N / ((∑ i, a i).natAbs + c.natAbs + 1) ≤ #A := by
  sorry

end TauCetiRoadmap.SidonSetsAndLinearEquations
