import Mathlib

/-!
# The polynomial method in combinatorics: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here, together with the coefficient formula of 1.2 and the
three statements of Layer 3 on polynomials vanishing on a set or along a line, on which Layers 4
and 5 rest. The README's API lists and its Checks are not restated.

Points of `Fⁿ` are functions `σ → F` on a finite coordinate type, or `Fin n → F`. Polynomials are
Mathlib's `MvPolynomial`. Sizes of finite sets are natural numbers, and every bound is written
without natural-number subtraction where a truncated difference would change its meaning.
-/

noncomputable section

open Finset MvPolynomial

namespace TauCetiRoadmap.PolynomialMethodInCombinatorics

/-! ## Layer 1: restricted sums -/

/-- 1.1 The restricted sum of a family of finite sets `A i` of a field with respect to a
polynomial `h`: the sums `∑ i, x i` over the points `x` with `x i ∈ A i` for every `i` and
`h(x) ≠ 0`. -/
def polySumset {σ F : Type*} [Fintype σ] [DecidableEq σ] [Field F] [DecidableEq F]
    (h : MvPolynomial σ F) (A : σ → Finset F) : Finset F :=
  ((Fintype.piFinset A).filter fun x => eval x h ≠ 0).image fun x => ∑ i, x i

/-- 1.1 The polynomial restricted-sum theorem of Alon, Nathanson and Ruzsa, over any field: let
the sets `A i` be nonempty, `c i = #(A i) - 1` and `m + deg h = ∑ c i`. If the coefficient of
`∏ X i ^ c i` in `(∑ X i) ^ m * h` is nonzero, the restricted sum has at least `m + 1` elements. -/
theorem le_card_polySumset {σ F : Type*} [Fintype σ] [DecidableEq σ] [Field F] [DecidableEq F]
    (h : MvPolynomial σ F) (A : σ → Finset F) (hA : ∀ i, (A i).Nonempty) (m : ℕ)
    (hm : m + h.totalDegree = ∑ i, (#(A i) - 1))
    (hc : ((∑ i, X i) ^ m * h).coeff (Finsupp.equivFunOnFinite.symm fun i => #(A i) - 1) ≠ 0) :
    m + 1 ≤ #(polySumset h A) := by
  sorry

/-- 1.2 The coefficient of `∏ X i ^ c i` in `(∑ X i) ^ m * ∏_{i < j} (X j - X i)` over `ℤ`, when
`∑ c i = m + (r choose 2)`, is `m! ∏_{i < j} (c j - c i) / ∏ c i!` (Alon, Lemma 4.4); stated
multiplied out by `∏ c i!`. -/
theorem coeff_sum_pow_mul_vandermonde (r m : ℕ) (c : Fin r → ℕ)
    (hc : ∑ i, c i = m + r.choose 2) :
    ((∑ i, X i) ^ m * ∏ i, ∏ j ∈ Ioi i, (X j - X i) : MvPolynomial (Fin r) ℤ).coeff
        (Finsupp.equivFunOnFinite.symm c) * ∏ i, ((c i).factorial : ℤ) =
      m.factorial * ∏ i, ∏ j ∈ Ioi i, ((c j : ℤ) - c i) := by
  sorry

/-- 1.3 The sums `∑ i, x i` with `x i ∈ A i` for every `i` and the `x i` pairwise distinct. -/
def restrictedSumset {σ R : Type*} [Fintype σ] [DecidableEq σ] [AddCommMonoid R]
    [DecidableEq R] (A : σ → Finset R) : Finset R :=
  ((Fintype.piFinset A).filter fun x => Function.Injective x).image fun x => ∑ i, x i

/-- 1.3 Sums of distinct elements from sets of distinct sizes (Alon, Proposition 4.2): for a
prime `p` and nonempty sets `A i ⊆ ℤ/p`, indexed by a type with `r` elements and of pairwise
distinct sizes, if `∑ #(A i) ≤ p + (r + 1 choose 2) - 1`, the sums of distinct representatives
number at least `∑ #(A i) - (r + 1 choose 2) + 1`. -/
theorem card_restrictedSumset_of_injective {σ : Type*} [Fintype σ] [DecidableEq σ] {p : ℕ}
    (hp : p.Prime) (A : σ → Finset (ZMod p)) (hA : ∀ i, (A i).Nonempty)
    (hinj : Function.Injective fun i => #(A i))
    (hsum : ∑ i, #(A i) + 1 ≤ p + (Fintype.card σ + 1).choose 2) :
    ∑ i, #(A i) + 1 ≤ #(restrictedSumset A) + (Fintype.card σ + 1).choose 2 := by
  sorry

/-- 1.4 The theorem of Dias da Silva and Hamidoune (the Erdős–Heilbronn conjecture for `s = 2`):
for a prime `p`, a finite set `A ⊆ ℤ/p` and `s ≥ 0`, the sums of `s` distinct elements of `A`
number at least `min p (s |A| - s² + 1)`, the difference truncated at `0`. -/
theorem min_le_card_restrictedSumset_const {p : ℕ} (hp : p.Prime) (A : Finset (ZMod p))
    (s : ℕ) :
    min p (s * #A + 1 - s ^ 2) ≤ #(restrictedSumset fun _ : Fin s => A) := by
  sorry

/-! ## Layer 2: covers of grids and regular subgraphs -/

/-- 2.1 The theorem of Alon and Füredi, for grids over any field: if the solution sets of the
affine equations `a j ⬝ᵥ x = b j`, `j : ι`, cover every point of the grid `∏ S i` except the
point `u` of the grid, and `u` satisfies none of them, there are at least `∑ (#(S i) - 1)`
equations. -/
theorem sum_card_sub_one_le_card_of_covers {σ ι F : Type*} [Fintype σ] [DecidableEq σ]
    [Fintype ι] [Field F] [DecidableEq F] (S : σ → Finset F) (u : σ → F) (hu : ∀ i, u i ∈ S i)
    (a : ι → σ → F) (b : ι → F)
    (hcover : ∀ x ∈ Fintype.piFinset S, x ≠ u → ∃ j, a j ⬝ᵥ x = b j)
    (hmiss : ∀ j, a j ⬝ᵥ u ≠ b j) :
    ∑ i, (#(S i) - 1) ≤ Fintype.card ι := by
  sorry

/-- 2.2 The degree of a vertex `v` in the edge set `S` of a multigraph whose edges `e` have
ends `ends e`: the number of edges of `S` incident to `v` (a loop counts once). -/
def subDegree {V E : Type*} [DecidableEq V] (ends : E → Sym2 V) (S : Finset E) (v : V) : ℕ :=
  #{e ∈ S | v ∈ ends e}

/-- 2.2 The theorem of Alon, Friedland and Kalai: let `q` be a prime power and `G` a finite
multigraph with more than `(q - 1) |V|` edges and every degree at most `2q - 1`. Then some
nonempty set of edges has degree `0` or `q` at every vertex: `G` has a `q`-regular subgraph. -/
theorem exists_regular_subgraph {V E : Type*} [Fintype V] [Fintype E] [DecidableEq V]
    (ends : E → Sym2 V) {q : ℕ} (hq : IsPrimePow q)
    (hedges : (q - 1) * Fintype.card V < Fintype.card E)
    (hdeg : ∀ v, subDegree ends univ v ≤ 2 * q - 1) :
    ∃ S : Finset E, S.Nonempty ∧ ∀ v, subDegree ends S v = 0 ∨ subDegree ends S v = q := by
  sorry

/-! ## Layer 3: low-degree polynomials vanishing on a set -/

/-- 3.1 Fewer than `(b + n choose n)` points of `Kⁿ`, `n = card σ`, are common zeros of a nonzero
polynomial of total degree at most `b`. -/
theorem exists_ne_zero_totalDegree_le_eval_eq_zero {σ K : Type*} [Fintype σ] [Field K]
    (S : Finset (σ → K)) (b : ℕ) (hS : #S < (b + Fintype.card σ).choose (Fintype.card σ)) :
    ∃ P : MvPolynomial σ K, P ≠ 0 ∧ P.totalDegree ≤ b ∧ ∀ x ∈ S, eval x P = 0 := by
  sorry

/-- 3.2 For `n = card σ ≥ 1`, fewer than `(b + n - 1 choose n - 1)` points of `Kⁿ` are common
zeros of a nonzero homogeneous polynomial of degree `b`. -/
theorem exists_isHomogeneous_ne_zero_eval_eq_zero {σ K : Type*} [Fintype σ] [Field K]
    (hσ : 1 ≤ Fintype.card σ) (S : Finset (σ → K)) (b : ℕ)
    (hS : #S < (b + Fintype.card σ - 1).choose (Fintype.card σ - 1)) :
    ∃ P : MvPolynomial σ K, P ≠ 0 ∧ P.IsHomogeneous b ∧ ∀ x ∈ S, eval x P = 0 := by
  sorry

/-- 3.3 A polynomial of total degree at most `b` that vanishes at `z + t • y` for more than `b`
values of `t` vanishes at `z + t • y` for every `t`. -/
theorem eval_eq_zero_of_eval_eq_zero_on_line {σ K : Type*} [Field K] (P : MvPolynomial σ K)
    (b : ℕ) (hP : P.totalDegree ≤ b) (z y : σ → K) (T : Finset K) (hT : b < #T)
    (hzero : ∀ t ∈ T, eval (z + t • y) P = 0) (t : K) : eval (z + t • y) P = 0 := by
  sorry

/-! ## Layer 4: Kakeya sets over finite fields -/

/-- 4.1 Dvir's theorem with the bound of Alon and Tao: a set `K ⊆ Fⁿ`, `F` a finite field with
`q` elements, containing a line `{y + a • x | a ∈ F}` in every direction `x` has at least
`(q + n - 1 choose n)` points. -/
theorem choose_le_card_of_isKakeya {F : Type*} [Field F] [Finite F] (n : ℕ)
    (K : Finset (Fin n → F)) (hK : ∀ x : Fin n → F, ∃ y, ∀ a : F, y + a • x ∈ K) :
    (Nat.card F + n - 1).choose n ≤ #K := by
  sorry

open scoped Classical in
/-- 4.2 Dvir's bound for sets meeting many lines in many points: let `F` have `q` elements and
`d ≥ 0`. If a set `L ⊆ Fⁿ` has more than `d q^(n-1)` elements, and for every `y ∈ L` some line
`{z + a • y | a ∈ F}` meets `K` in at least `d + 2` points, then `#K ≥ (d + n - 1 choose n - 1)`. -/
theorem choose_le_card_of_many_rich_lines {F : Type*} [Field F] [Finite F]
    (n d : ℕ) (K L : Finset (Fin n → F))
    (hL : d * Nat.card F ^ (n - 1) < #L)
    (hrich : ∀ y ∈ L, ∃ z : Fin n → F, d + 2 ≤ #{w ∈ K | ∃ a : F, w = z + a • y}) :
    (d + n - 1).choose (n - 1) ≤ #K := by
  sorry

/-! ## Layer 5: joints -/

/-- 5.1 A point `x` is a joint of a family `L` of affine subspaces when the directions of the
members of `L` through `x` span the whole space. -/
def IsJoint {K : Type*} [Field K] {d : ℕ} (L : Finset (AffineSubspace K (Fin d → K)))
    (x : Fin d → K) : Prop :=
  (⨆ ℓ ∈ L, ⨆ (_ : x ∈ ℓ), ℓ.direction) = ⊤

/-- 5.1 The joints theorem (Guth–Katz for `d = 3`; Kaplan–Sharir–Shustin and Quilodrán in
general; Carbery–Iliopoulou over every field), over any field: for `d ≥ 2` and a finite family
`L` of lines in `Kᵈ`, every finite set `J` of joints of `L` satisfies
`#J ^ (d - 1) ≤ 4 ^ d * d! * #L ^ d`, that is `#J ≤ (4ᵈ d!)^(1/(d-1)) #L^(d/(d-1))`. -/
theorem card_pow_le_of_isJoint {K : Type*} [Field K] {d : ℕ} (hd : 2 ≤ d)
    (L : Finset (AffineSubspace K (Fin d → K)))
    (hL : ∀ ℓ ∈ L, Module.finrank K ℓ.direction = 1)
    (J : Finset (Fin d → K)) (hJ : ∀ x ∈ J, IsJoint L x) :
    #J ^ (d - 1) ≤ 4 ^ d * d.factorial * #L ^ d := by
  sorry

end TauCetiRoadmap.PolynomialMethodInCombinatorics
