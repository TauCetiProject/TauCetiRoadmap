/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Arithmetic Ramsey theory: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline theorems, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib, with `sorry`, and every definition has its
real body.

The headline theorems are:

* Layer 1: the simultaneous Ramsey theorem on arbitrary finite sets and its ordered form;
* Layer 2: van der Waerden numbers for colourings of `{1, …, N}`, bounded by Hales–Jewett numbers;
* Layer 3: Deuber's theorem on `(m, p, c)`-sets in the positive integers with its recursive bound,
  and Brauer's theorem;
* Layer 4: Folkman's theorem with its bound, its product form, the finite unions theorem and
  products of ordered blocks in an arbitrary monoid;
* Layer 5: Rado's theorem, the single-equation theorem, consistency, and the colour class that
  solves every partition regular system.

Layer 1.1 consumes RamseyNumbers 2.2 (`hypergraphRamseyProp_iff`); since that roadmap has no
implementation at the pin, the statements here do not mention its declarations.

Conventions: colourings are functions `χ : ℕ → κ` with `[Finite κ]`, and only their values on
`1, …, N` matter. Each number is the infimum in `ℕ` of the `n` with the corresponding property.
-/

open Finset

universe u v

namespace TauCetiRoadmap.ArithmeticRamseyTheory

/-! ### Layer 1: simultaneous and ordered Ramsey theorems -/

/-- 1.2 The simultaneous Ramsey theorem (Sanders' iterated Ramsey theorem): on some `t`-element
subset of any large enough finite set, the colour of a set of at most `k` elements depends only on
its size. -/
theorem exists_simultaneous_ramsey (k t : ℕ) (κ : ℕ → Type v) [∀ j, Finite (κ j)] :
    ∃ B : ℕ, ∀ (α : Type u) [DecidableEq α] (S : Finset α), B ≤ #S →
      ∀ χ : (j : ℕ) → Finset α → κ j, ∃ H ⊆ S, #H = t ∧
        ∀ j ≤ k, ∀ A ⊆ H, ∀ D ⊆ H, #A = j → #D = j → χ j A = χ j D := by
  sorry

/-- 1.3 The ordered simultaneous Ramsey theorem: colourings of increasing `j`-tuples in `Fin B`,
for all `j ≤ k`, are constant on the increasing tuples of the image of some `e : Fin t ↪o Fin B`.
-/
theorem exists_orderEmbedding_simultaneous_ramsey (k t : ℕ) (κ : ℕ → Type v)
    [∀ j, Finite (κ j)] :
    ∃ B : ℕ, t ≤ B ∧ ∀ χ : (j : ℕ) → (Fin j ↪o Fin B) → κ j, ∃ e : Fin t ↪o Fin B,
      ∀ j ≤ k, ∀ s s' : Fin j ↪o Fin t, χ j (s.trans e) = χ j (s'.trans e) := by
  sorry

/-! ### Layer 2: Hales–Jewett and van der Waerden numbers -/

section Layer2

/-- 2.1 Every colouring of the cube `Fin n → Fin k` has a monochromatic combinatorial line. -/
def IsHJBound (k : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ C : (Fin n → Fin k) → κ, ∃ l : Combinatorics.Line (Fin k) (Fin n), l.IsMono C

/-- 2.1 The Hales–Jewett number. -/
noncomputable def hjNumber (k : ℕ) (κ : Type v) : ℕ := sInf {n | IsHJBound k κ n}

/-- 2.2 Every colouring of the positive integers has a monochromatic `k`-term progression with
positive common difference inside `{1, …, n}`. -/
def IsVdWBound (k : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ χ : ℕ → κ, ∃ a d : ℕ, 0 < d ∧ (∀ j < k, a + j * d ∈ Icc 1 n) ∧
    ∀ j < k, ∀ j' < k, χ (a + j * d) = χ (a + j' * d)

/-- 2.2 The van der Waerden number. -/
noncomputable def vdWNumber (k : ℕ) (κ : Type v) : ℕ := sInf {n | IsVdWBound k κ n}

variable {κ : Type v}

/-- 2.1 The Hales–Jewett property holds exactly from the Hales–Jewett number on. -/
theorem isHJBound_iff_hjNumber_le [Finite κ] {k : ℕ} (hk : 1 ≤ k) (n : ℕ) :
    IsHJBound k κ n ↔ hjNumber k κ ≤ n := by
  sorry

/-- 2.2 Van der Waerden's theorem in finite form. -/
theorem isVdWBound_iff_vdWNumber_le [Finite κ] (k n : ℕ) :
    IsVdWBound k κ n ↔ vdWNumber k κ ≤ n := by
  sorry

/-- 2.2 A Hales–Jewett dimension for the alphabet `Fin (k + 1)` gives a van der Waerden bound. -/
theorem isVdWBound_of_isHJBound {k n : ℕ} (h : IsHJBound (k + 1) κ n) :
    IsVdWBound (k + 1) κ (k * n + 1) := by
  sorry

/-- 2.2 Check: two-term progressions are the pigeonhole principle. -/
theorem vdWNumber_two [Finite κ] [Nonempty κ] : vdWNumber 2 κ = Nat.card κ + 1 := by
  sorry

end Layer2

/-! ### Layer 3: `(m, p, c)`-sets -/

section Layer3

/-- 3.1 The `j`-th row of the `(m, p, c)`-set with generators `x`: the sums `∑ i, λ i * x i` with
`λ i = 0` for `i < j`, `λ j = c` and `|λ i| ≤ p` for `i > j`. -/
def mpcRow (p c : ℕ) {m : ℕ} (x : Fin m → ℤ) (j : Fin m) : Set ℤ :=
  {z | ∃ μ : Fin m → ℤ, (∀ i < j, μ i = 0) ∧ μ j = c ∧ (∀ i, j < i → |μ i| ≤ p) ∧
    z = ∑ i, μ i * x i}

/-- 3.1 The `(m, p, c)`-set with generators `x`, the union of its rows. -/
def mpcSet (p c : ℕ) {m : ℕ} (x : Fin m → ℤ) : Set ℤ := ⋃ j, mpcRow p c x j

/-- 3.1 Subfamilies of generators, taken in increasing order, generate subsets. -/
theorem mpcSet_comp_orderEmbedding (p c : ℕ) {m m' : ℕ} (x : Fin m → ℤ) (e : Fin m' ↪o Fin m) :
    mpcSet p c (x ∘ e) ⊆ mpcSet p c x := by
  sorry

/-- 3.1 If an `(m, p, c)`-set with `c ≥ 1` consists of positive integers, its generators are
positive and each `c xⱼ` exceeds `p` times the sum of the later generators. -/
theorem lt_of_mpcSet_pos {p c m : ℕ} (hc : 1 ≤ c) {x : Fin m → ℤ}
    (hx : ∀ z ∈ mpcSet p c x, 0 < z) (j : Fin m) :
    0 < x j ∧ (p : ℤ) * ∑ i ∈ Ioi j, x i < c * x j := by
  sorry

/-- 3.1 Every nonempty subset sum of the generators lies in the row of its least index. -/
theorem finsetSum_mem_mpcRow {p m : ℕ} (hp : 1 ≤ p) (x : Fin m → ℤ) (I : Finset (Fin m))
    (hI : I.Nonempty) : ∑ i ∈ I, x i ∈ mpcRow p 1 x (I.min' hI) := by
  sorry

/-- 3.2 Every colouring has, inside `{1, …, n}`, an `(m, p, c)`-set whose rows are each
monochromatic. -/
def IsMPCRowMonoBound (m p c : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ χ : ℕ → κ, ∃ x : Fin m → ℤ, (∀ z ∈ mpcSet p c x, 1 ≤ z ∧ z ≤ n) ∧
    ∀ j, ∀ z ∈ mpcRow p c x j, ∀ z' ∈ mpcRow p c x j, χ z.toNat = χ z'.toNat

/-- 3.2 The row-monochromatic `(m, p, c)` number. -/
noncomputable def mpcRowMonoNumber (m p c : ℕ) (κ : Type v) : ℕ :=
  sInf {n | IsMPCRowMonoBound m p c κ n}

/-- 3.3 Every colouring has a monochromatic `(m, p, c)`-set inside `{1, …, n}`. -/
def IsMPCBound (m p c : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ χ : ℕ → κ, ∃ x : Fin m → ℤ, (∀ z ∈ mpcSet p c x, 1 ≤ z ∧ z ≤ n) ∧
    ∀ z ∈ mpcSet p c x, ∀ z' ∈ mpcSet p c x, χ z.toNat = χ z'.toNat

/-- 3.3 The `(m, p, c)` number. -/
noncomputable def mpcNumber (m p c : ℕ) (κ : Type v) : ℕ := sInf {n | IsMPCBound m p c κ n}

variable {κ : Type v}

/-- 3.2 Row-monochromatic `(m, p, c)`-sets exist in every long enough interval. -/
theorem isMPCRowMonoBound_iff [Finite κ] {m p c : ℕ} (hc : 1 ≤ c) (n : ℕ) :
    IsMPCRowMonoBound m p c κ n ↔ mpcRowMonoNumber m p c κ ≤ n := by
  sorry

/-- 3.2 The recursive bound by van der Waerden numbers. -/
theorem mpcRowMonoNumber_succ_le [Finite κ] (m p c : ℕ) :
    mpcRowMonoNumber (m + 1) p c κ ≤
      c * vdWNumber (2 * m * p * mpcRowMonoNumber m p c κ + 1) κ := by
  sorry

/-- 3.3 Deuber's theorem in the positive integers, in finite form. -/
theorem isMPCBound_iff [Finite κ] {m p c : ℕ} (hc : 1 ≤ c) (n : ℕ) :
    IsMPCBound m p c κ n ↔ mpcNumber m p c κ ≤ n := by
  sorry

/-- 3.3 Monochromatic sets from row-monochromatic ones, by the pigeonhole principle on rows. -/
theorem mpcNumber_le [Finite κ] (m p c : ℕ) :
    mpcNumber m p c κ ≤ mpcRowMonoNumber (Nat.card κ * m + 1) p c κ := by
  sorry

/-- 3.4 Brauer's theorem: a monochromatic progression together with its common difference. -/
theorem exists_mono_ap_and_diff [Finite κ] (k : ℕ) (χ : ℕ → κ) :
    ∃ a d : ℕ, 1 ≤ a ∧ 1 ≤ d ∧ a + k * d ≤ mpcNumber 2 k 1 κ ∧
      ∀ j < k, χ (a + j * d) = χ d := by
  sorry

end Layer3

/-! ### Layer 4: Folkman's theorem and finite unions -/

section Layer4

/-- 4.1 Every colouring has `m` distinct positive integers with sum at most `n` all of whose
nonempty subset sums have one colour. -/
def IsFolkmanBound (m : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ χ : ℕ → κ, ∃ x : Fin m → ℕ, Function.Injective x ∧ (∀ i, 0 < x i) ∧ ∑ i, x i ≤ n ∧
    ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty → χ (∑ i ∈ I, x i) = χ (∑ i ∈ J, x i)

/-- 4.1 The Folkman number. -/
noncomputable def folkmanNumber (m : ℕ) (κ : Type v) : ℕ := sInf {n | IsFolkmanBound m κ n}

/-- 4.3 Every colouring of the subsets of `Fin n` has `m` ordered blocks all of whose nonempty
unions have one colour. -/
def IsFinUnionsBound (m : ℕ) (κ : Type v) (n : ℕ) : Prop :=
  ∀ χ : Finset (Fin n) → κ, ∃ D : Fin m → Finset (Fin n), (∀ j, (D j).Nonempty) ∧
    (∀ i j, i < j → ∀ a ∈ D i, ∀ b ∈ D j, a < b) ∧
    ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty → χ (I.biUnion D) = χ (J.biUnion D)

variable {κ : Type v}

/-- 4.1 Folkman's theorem in finite form. -/
theorem isFolkmanBound_iff_folkmanNumber_le [Finite κ] (m n : ℕ) :
    IsFolkmanBound m κ n ↔ folkmanNumber m κ ≤ n := by
  sorry

/-- 4.1 The Folkman number is at most the `(m, 1, 1)` number. -/
theorem folkmanNumber_le_mpcNumber [Finite κ] (m : ℕ) :
    folkmanNumber m κ ≤ mpcNumber m 1 1 κ := by
  sorry

/-- 4.1 The superincreasing form: each element exceeds the sum of the later ones. -/
theorem exists_superincreasing_finsetSum_mono [Finite κ] (m : ℕ) (χ : ℕ → κ) :
    ∃ x : Fin m → ℕ, (∀ i, 0 < x i) ∧ (∀ i, ∑ j ∈ Ioi i, x j < x i) ∧
      ∑ i, x i ≤ mpcNumber m 1 1 κ ∧
      ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty → χ (∑ i ∈ I, x i) = χ (∑ i ∈ J, x i) := by
  sorry

/-- 4.1 The min-colour form: the colour of a subset sum depends only on its least index. -/
theorem exists_finsetSum_color_eq_of_min_eq [Finite κ] (m : ℕ) (χ : ℕ → κ) :
    ∃ x : Fin m → ℕ, (∀ i, 0 < x i) ∧ (∀ i, ∑ j ∈ Ioi i, x j < x i) ∧
      ∑ i, x i ≤ mpcRowMonoNumber m 1 1 κ ∧
      ∀ (I J : Finset (Fin m)) (hI : I.Nonempty) (hJ : J.Nonempty), I.min' hI = J.min' hJ →
        χ (∑ i ∈ I, x i) = χ (∑ i ∈ J, x i) := by
  sorry

/-- 4.2 Finite products: distinct powers of two all of whose nonempty subset products have one
colour. -/
theorem exists_injective_finsetProd_mono [Finite κ] (m : ℕ) (χ : ℕ → κ) :
    ∃ x : Fin m → ℕ, Function.Injective x ∧ (∀ i, 1 < x i ∧ ∃ e, x i = 2 ^ e) ∧
      ∏ i, x i ≤ 2 ^ folkmanNumber m κ ∧
      ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty → χ (∏ i ∈ I, x i) = χ (∏ i ∈ J, x i) := by
  sorry

/-- 4.3 The finite unions theorem for ordered blocks. -/
theorem exists_isFinUnionsBound [Finite κ] (m : ℕ) : ∃ n, IsFinUnionsBound m κ n := by
  sorry

/-- 4.3 The finite unions property is upward closed. -/
theorem IsFinUnionsBound.mono {m n n' : ℕ} (h : IsFinUnionsBound m κ n) (hn : n ≤ n') :
    IsFinUnionsBound m κ n' := by
  sorry

/-- 4.4 The product of `a i` over `i ∈ A`, in increasing order of `i`. -/
@[to_additive /-- 4.4 The sum of `a i` over `i ∈ A`, in increasing order of `i`. -/]
def orderedProd {M : Type*} [Monoid M] {n : ℕ} (a : Fin n → M) (A : Finset (Fin n)) : M :=
  (((List.finRange n).filter (· ∈ A)).map a).prod

/-- 4.4 The ordered product over a union of ordered blocks is the ordered product of the block
products. -/
@[to_additive]
theorem orderedProd_biUnion {M : Type*} [Monoid M] {n m : ℕ} (a : Fin n → M)
    (D : Fin m → Finset (Fin n)) (hD : ∀ i j, i < j → ∀ x ∈ D i, ∀ y ∈ D j, x < y)
    (J : Finset (Fin m)) :
    orderedProd a (J.biUnion D) = orderedProd (fun j ↦ orderedProd a (D j)) J := by
  sorry

/-- 4.4 Products of ordered blocks of any sequence in any monoid: the ordered nonempty
subproducts of the block products have one colour. -/
@[to_additive]
theorem exists_orderedProd_blocks_mono {m n : ℕ} (hn : IsFinUnionsBound m κ n)
    {M : Type*} [Monoid M] (a : Fin n → M) (χ : M → κ) :
    ∃ D : Fin m → Finset (Fin n), (∀ j, (D j).Nonempty) ∧
      (∀ i j, i < j → ∀ x ∈ D i, ∀ y ∈ D j, x < y) ∧
      ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty →
        χ (orderedProd (fun j ↦ orderedProd a (D j)) I) =
          χ (orderedProd (fun j ↦ orderedProd a (D j)) J) := by
  sorry

/-- 4.4 The commutative form: products of disjoint blocks. -/
@[to_additive]
theorem exists_finsetProd_blocks_mono {m n : ℕ} (hn : IsFinUnionsBound m κ n)
    {M : Type*} [CommMonoid M] (a : Fin n → M) (χ : M → κ) :
    ∃ D : Fin m → Finset (Fin n), (∀ j, (D j).Nonempty) ∧
      (∀ i j, i < j → ∀ x ∈ D i, ∀ y ∈ D j, x < y) ∧
      ∀ I J : Finset (Fin m), I.Nonempty → J.Nonempty →
        χ (∏ j ∈ I, ∏ i ∈ D j, a i) = χ (∏ j ∈ J, ∏ i ∈ D j, a i) := by
  sorry

end Layer4

/-! ### Layer 5: Rado's theorem -/

section Layer5

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- 5.1 A rational system `A x = 0` is partition regular when every finite colouring of the
positive integers has a monochromatic positive solution. -/
def IsPartitionRegular (A : Matrix ι κ ℚ) : Prop :=
  ∀ (r : ℕ) (χ : ℕ → Fin r), ∃ x : κ → ℕ, (∀ i, 0 < x i) ∧
    A.mulVec (fun i ↦ (x i : ℚ)) = 0 ∧ ∀ i j, χ (x i) = χ (x j)

/-- 5.1 Rado's columns condition: the columns split into blocks indexed by `Fin t` such that the
columns of each block sum to a rational combination of the columns of the earlier blocks. -/
def ColumnsCondition (A : Matrix ι κ ℚ) : Prop :=
  ∃ (t : ℕ) (b : κ → Fin t), ∀ s : Fin t,
    ∑ i ∈ univ.filter (fun i ↦ b i = s), A.transpose i ∈
      Submodule.span ℚ (A.transpose '' {i | b i < s})

/-- 5.2 The last nonzero digit of `n` in base `p`. -/
def lastDigit (p n : ℕ) : ℕ := n / p ^ padicValNat p n % p

/-- 5.2 Necessity, in the strong form: monochromatic solutions for the last-digit colourings of
infinitely many primes force the columns condition. -/
theorem columnsCondition_of_frequently_lastDigit (A : Matrix ι κ ℚ)
    (h : ∀ N : ℕ, ∃ p, N ≤ p ∧ p.Prime ∧ ∃ x : κ → ℕ, (∀ i, 0 < x i) ∧
      A.mulVec (fun i ↦ (x i : ℚ)) = 0 ∧ ∀ i j, lastDigit p (x i) = lastDigit p (x j)) :
    ColumnsCondition A := by
  sorry

/-- 5.3 Under the columns condition, every `(t, p, c)`-set contains a solution, for suitable
`p, c`. -/
theorem ColumnsCondition.exists_mpc {A : Matrix ι κ ℚ} (hA : ColumnsCondition A) :
    ∃ t p c : ℕ, 1 ≤ p ∧ 1 ≤ c ∧ ∀ x : Fin t → ℤ, ∃ y : κ → ℤ, (∀ i, y i ∈ mpcSet p c x) ∧
      A.mulVec (fun i ↦ (y i : ℚ)) = 0 := by
  sorry

/-- 5.3 Sufficiency with a bound: under the columns condition, every finite colouring has a
monochromatic positive solution with entries at most an `(m, p, c)` number. -/
theorem ColumnsCondition.exists_mono_solution_le {A : Matrix ι κ ℚ} (hA : ColumnsCondition A) :
    ∃ t p c : ℕ, 1 ≤ p ∧ 1 ≤ c ∧ ∀ (κ' : Type) [Finite κ'] (χ : ℕ → κ'),
      ∃ x : κ → ℕ, (∀ i, 0 < x i ∧ x i ≤ mpcNumber t p c κ') ∧
        A.mulVec (fun i ↦ (x i : ℚ)) = 0 ∧ ∀ i j, χ (x i) = χ (x j) := by
  sorry

/-- 5.3 Rado's theorem. -/
theorem isPartitionRegular_iff_columnsCondition (A : Matrix ι κ ℚ) :
    IsPartitionRegular A ↔ ColumnsCondition A := by
  sorry

/-- 5.4 Rado's theorem for one equation in at least one variable, with nonzero coefficients. -/
theorem isPartitionRegular_single_iff [Nonempty κ] (a : κ → ℚ) (ha : ∀ i, a i ≠ 0) :
    IsPartitionRegular (Matrix.of fun (_ : Fin 1) i ↦ a i) ↔
      ∃ I : Finset κ, I.Nonempty ∧ ∑ i ∈ I, a i = 0 := by
  sorry

/-- 5.5 Rado's consistency theorem. -/
theorem IsPartitionRegular.fromBlocks {ι' κ' : Type*} [Fintype ι'] [Fintype κ']
    {A : Matrix ι κ ℚ} {B : Matrix ι' κ' ℚ} (hA : IsPartitionRegular A)
    (hB : IsPartitionRegular B) : IsPartitionRegular (Matrix.fromBlocks A 0 0 B) := by
  sorry

/-- 5.5 One colour class solves every partition regular system. -/
theorem exists_color_forall_isPartitionRegular {C : Type*} [Finite C] (χ : ℕ → C) :
    ∃ c : C, ∀ (k n : ℕ) (A : Matrix (Fin k) (Fin n) ℚ), IsPartitionRegular A →
      ∃ x : Fin n → ℕ, (∀ i, 0 < x i) ∧ A.mulVec (fun i ↦ (x i : ℚ)) = 0 ∧
        ∀ i, χ (x i) = c := by
  sorry

end Layer5

end TauCetiRoadmap.ArithmeticRamseyTheory
