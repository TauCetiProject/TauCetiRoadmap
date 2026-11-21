import Mathlib

/-!
# Periodic nonnegative matrices: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
one definition they need, which has a real body. Every headline theorem of the README is statable
at the pins and is stated here; the README's API lists and Checks are not restated.

Matrices are real square matrices `A : Matrix n n ℝ` on a finite index type. Irreducibility is
Mathlib's `Matrix.IsIrreducible` (nonnegative entries and a strongly connected quiver of positive
entries, every pair of indices, equal or not, joined by a path of positive length) and primitivity
is Mathlib's `Matrix.IsPrimitive`. Complex eigenvalues are those of `A.map (↑) : Matrix n n ℂ`,
as in Tau Ceti's Perron–Frobenius files, and a Perron root `r` is given, as there, by an
eigenvector `v` with strictly positive entries and `A *ᵥ v = r • v`.
-/

noncomputable section

open Matrix

namespace TauCetiRoadmap.PeriodicNonnegativeMatrices

variable {n : Type*} [Fintype n] [DecidableEq n]

/-! ## Layer 1: The period and the cyclic classes -/

/-- 1.1 The period of the index `i` of a real square matrix: the gcd of the lengths `k ≥ 1` of
the closed walks at `i` in the quiver of positive entries, that is of the `k ≥ 1` with
`0 < (A ^ k) i i`. It is `0` when there is no such `k`. -/
def period (A : Matrix n n ℝ) (i : n) : ℕ :=
  Nat.setGcd {k : ℕ | 0 < k ∧ 0 < (A ^ k) i i}

/-- 1.1 All indices of an irreducible matrix have the same period. -/
theorem period_eq_period_of_isIrreducible {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i j : n) :
    period A i = period A j := by
  sorry

/-- 1.2 The period of an irreducible matrix is the gcd of the lengths of the cycles of its
quiver of positive entries: the `k ≥ 1` for which some injective `c : Fin k → n` has
`0 < A (c t) (c (t + 1))` for every `t`, indices taken modulo `k`. -/
theorem period_eq_setGcd_cycleLengths {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n) :
    period A i = Nat.setGcd {k : ℕ | 0 < k ∧ ∃ c : Fin k → n, Function.Injective c ∧
      ∀ t : Fin k, 0 < A (c t) (c (finRotate k t))} := by
  sorry

/-- 1.2 The period of an irreducible matrix lies between `1` and the number of indices. -/
theorem period_mem_Icc {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n) :
    period A i ∈ Set.Icc 1 (Fintype.card n) := by
  sorry

/-- 1.3 The cyclic classes: for an irreducible matrix of period `d`, there is a surjective
`c : n → ZMod d` that increases by one along every positive entry, and any other such map is a
translate of it. -/
theorem exists_cyclicClasses {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n) :
    ∃ c : n → ZMod (period A i), Function.Surjective c ∧
      (∀ j k, 0 < A j k → c k = c j + 1) ∧
      ∀ c' : n → ZMod (period A i), (∀ j k, 0 < A j k → c' k = c' j + 1) →
        ∃ a : ZMod (period A i), ∀ j, c' j = c j + a := by
  sorry

/-- 1.3 The period of an irreducible matrix is characterized by its cyclic labellings: for every
natural number `m`, some `c : n → ZMod m` increases by one along every positive entry if and only
if `m` divides the period. -/
theorem dvd_period_iff {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n) (m : ℕ) :
    m ∣ period A i ↔ ∃ c : n → ZMod m, ∀ j k, 0 < A j k → c k = c j + 1 := by
  sorry

/-- 1.4 A nonnegative matrix is primitive if and only if it is irreducible of period one. -/
theorem isPrimitive_iff_period_eq_one {A : Matrix n n ℝ} (i : n) :
    A.IsPrimitive ↔ A.IsIrreducible ∧ period A i = 1 := by
  sorry

/-- 1.4 For an irreducible matrix of period `d` and a cyclic labelling `c` of its indices by
`ZMod d`, the power `A ^ d` vanishes between different classes, and its restriction to each
class is primitive. -/
theorem pow_period_block {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n)
    (c : n → ZMod (period A i)) (hc : ∀ j k, 0 < A j k → c k = c j + 1) :
    (∀ j k, c j ≠ c k → (A ^ period A i) j k = 0) ∧
      ∀ a : ZMod (period A i),
        ((A ^ period A i).submatrix (fun j : {j // c j = a} => j.1)
          (fun j : {j // c j = a} => j.1)).IsPrimitive := by
  sorry

/-! ## Layer 2: The peripheral spectrum -/

/-- 2.1 An irreducible matrix of period `d` is similar, by a diagonal matrix whose entries have
modulus one, to its multiple by `exp (2πi/d)`. -/
theorem exists_diagonal_conj_eq_exp_smul {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n) :
    ∃ D : n → ℂ, (∀ j, ‖D j‖ = 1) ∧
      diagonal D * (A.map (↑) : Matrix n n ℂ) * diagonal (fun j => (D j)⁻¹) =
        Complex.exp (2 * Real.pi * Complex.I / period A i) • (A.map (↑) : Matrix n n ℂ) := by
  sorry

/-- 2.1 The spectrum of an irreducible matrix of period `d`, with algebraic multiplicities, is
invariant under multiplication by `exp (2πi/d)`. -/
theorem rootMultiplicity_charpoly_exp_mul {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n)
    (μ : ℂ) :
    (A.map (↑) : Matrix n n ℂ).charpoly.rootMultiplicity
        (Complex.exp (2 * Real.pi * Complex.I / period A i) * μ) =
      (A.map (↑) : Matrix n n ℂ).charpoly.rootMultiplicity μ := by
  sorry

/-- 2.2 The peripheral spectrum of an irreducible matrix of period `d ≥ 2` with Perron root `r`:
the eigenvalues of modulus `r` are exactly the `d` complex numbers `μ` with `μ ^ d = r ^ d`, and
each is a simple root of the characteristic polynomial. -/
theorem peripheral_spectrum {A : Matrix n n ℝ} (hA : A.IsIrreducible) (i : n)
    (hd : 2 ≤ period A i) {r : ℝ} {v : n → ℝ} (hv : ∀ j, 0 < v j) (hAv : A *ᵥ v = r • v) :
    {μ : ℂ | μ ∈ spectrum ℂ (A.map (↑) : Matrix n n ℂ) ∧ ‖μ‖ = r} =
        {μ : ℂ | μ ^ period A i = (r : ℂ) ^ period A i} ∧
      {μ : ℂ | μ ∈ spectrum ℂ (A.map (↑) : Matrix n n ℂ) ∧ ‖μ‖ = r}.ncard = period A i ∧
      ∀ μ : ℂ, μ ^ period A i = (r : ℂ) ^ period A i →
        (A.map (↑) : Matrix n n ℂ).charpoly.rootMultiplicity μ = 1 := by
  sorry

/-! ## Layer 3: Adjacency matrices of graphs -/

section Graphs

variable {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]

/-- 3.1 The adjacency matrix of a connected graph with at least two vertices has period `2` if
the graph is bipartite and period `1` otherwise. -/
theorem period_adjMatrix [Nontrivial V] (hG : G.Connected) (v : V) :
    (G.IsBipartite → period (G.adjMatrix ℝ) v = 2) ∧
      (¬ G.IsBipartite → period (G.adjMatrix ℝ) v = 1) := by
  sorry

/-- 3.2 A connected graph whose adjacency matrix has Perron root `r` is bipartite if and only if
`-r` is an adjacency eigenvalue. -/
theorem isBipartite_iff_neg_mem_spectrum (hG : G.Connected) {r : ℝ} {x : V → ℝ}
    (hx : ∀ v, 0 < x v) (hAx : G.adjMatrix ℝ *ᵥ x = r • x) :
    G.IsBipartite ↔ -r ∈ spectrum ℝ (G.adjMatrix ℝ) := by
  sorry

/-- 3.3 A finite graph is bipartite if and only if its adjacency spectrum is symmetric about `0`
with multiplicities: `μ` and `-μ` have the same multiplicity as roots of the characteristic
polynomial for every real `μ`. -/
theorem isBipartite_iff_rootMultiplicity_neg :
    G.IsBipartite ↔ ∀ μ : ℝ, (G.adjMatrix ℝ).charpoly.rootMultiplicity (-μ) =
      (G.adjMatrix ℝ).charpoly.rootMultiplicity μ := by
  sorry

end Graphs

end TauCetiRoadmap.PeriodicNonnegativeMatrices
