import Mathlib

/-!
# Combinatorial discrepancy: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of the
roadmap against the pinned Mathlib, each with `sorry`, together with the few definitions those
statements need: the discrepancy of a real matrix and of a finite set system, hereditary and
linear discrepancy, and the family of arithmetic progressions in `{0, …, n − 1}`.

Every headline theorem of the README is stated here.
-/

namespace TauCetiRoadmap.CombinatorialDiscrepancy

noncomputable section

open Finset

/-! ## Layer 1: discrepancy and the random colouring bound -/

section Matrix

variable {ι V : Type*} [Fintype ι] [Fintype V]

/-- 1.1 The discrepancy of a real matrix `A` (rows indexed by `ι`, columns by `V`): the least,
over colourings `x : V → ℤˣ`, of the largest absolute row sum `|∑ⱼ A i j * x j|`. With no rows
the largest row sum is `0`. -/
def matrixDisc (A : Matrix ι V ℝ) : ℝ :=
  ⨅ x : V → ℤˣ, ⨆ i, |∑ j, A i j * ((x j : ℤ) : ℝ)|

/-- 1.2 The random colouring bound: if every row of `A` has squared Euclidean norm at most `s`
and `A` has `m` rows, then `matrixDisc A ≤ √(2 s log (2m))`. -/
theorem matrixDisc_le_sqrt (A : Matrix ι V ℝ) (s : ℝ) (hs : ∀ i, ∑ j, A i j ^ 2 ≤ s) :
    matrixDisc A ≤ Real.sqrt (2 * s * Real.log (2 * Fintype.card ι)) := by
  sorry

end Matrix

/-! ## Layer 2: set systems of bounded degree -/

section SetSystem

variable {ι V : Type*} [Fintype ι] [Fintype V]

/-- 2.1 The discrepancy of a finite family of finite sets `S : ι → Finset V`: the least, over
colourings `x : V → ℤˣ`, of the largest `|∑_{v ∈ S i} x v|`. -/
def setSystemDisc (S : ι → Finset V) : ℝ :=
  ⨅ x : V → ℤˣ, ⨆ i, |∑ v ∈ S i, ((x v : ℤ) : ℝ)|

/-- 2.2 The Beck–Fiala theorem: if every point lies in at most `t` of the sets, `t ≥ 1`, then
the discrepancy of the family is at most `2t − 1`. -/
theorem setSystemDisc_le_two_mul_sub_one (S : ι → Finset V) (t : ℕ) (ht : 1 ≤ t)
    (hdeg : ∀ v, Nat.card {i // v ∈ S i} ≤ t) :
    setSystemDisc S ≤ 2 * t - 1 := by
  sorry

end SetSystem

/-! ## Layer 3: hereditary and linear discrepancy -/

section Hereditary

variable {ι V : Type*} [Fintype ι] [Fintype V]

/-- 3.1 Hereditary discrepancy: the largest discrepancy of a column submatrix `A(·, J)`, over all
sets `J` of columns (for a set system, all restrictions `S i ∩ J` of the sets to a part `J` of
the ground set). -/
def herdisc (A : Matrix ι V ℝ) : ℝ :=
  ⨆ J : Finset V, matrixDisc (A.submatrix id ((↑) : J → V))

/-- 3.1 Linear discrepancy: the largest, over weight vectors `w ∈ [−1, 1]^V`, of the least
`‖A (x − w)‖∞` over colourings `x : V → ℤˣ`. -/
def lindisc (A : Matrix ι V ℝ) : ℝ :=
  ⨆ w : V → Set.Icc (-1 : ℝ) 1, ⨅ x : V → ℤˣ,
    ⨆ i, |∑ j, A i j * (((x j : ℤ) : ℝ) - (w j : ℝ))|

/-- 3.2 Linear discrepancy is at most twice hereditary discrepancy
(Lovász–Spencer–Vesztergombi). -/
theorem lindisc_le_two_mul_herdisc (A : Matrix ι V ℝ) : lindisc A ≤ 2 * herdisc A := by
  sorry

/-- 3.3 The volume bound for square matrices (Lovász–Spencer–Vesztergombi): for a square real
matrix of size `k ≥ 1`, `|det B| ^ (1 / k) ≤ lindisc B`. -/
theorem abs_det_rpow_le_lindisc {n : Type*} [Fintype n] [DecidableEq n] [Nonempty n]
    (B : Matrix n n ℝ) : |B.det| ^ ((Fintype.card n : ℝ)⁻¹) ≤ lindisc B := by
  sorry

/-- 3.4 The determinant lower bound (Lovász–Spencer–Vesztergombi): for every `k ≥ 1` and every
choice of `k` rows `f` and `k` columns `g` of `A`, half the `k`-th root of `|det A(f, g)|` is at
most the hereditary discrepancy of `A`. -/
theorem abs_det_submatrix_rpow_div_two_le_herdisc (A : Matrix ι V ℝ) {k : ℕ} (hk : 0 < k)
    (f : Fin k → ι) (g : Fin k → V) :
    |(A.submatrix f g).det| ^ ((k : ℝ)⁻¹) / 2 ≤ herdisc A := by
  sorry

end Hereditary

/-! ## Layer 4: arithmetic progressions -/

/-- 4.1 The arithmetic progressions in `{0, …, n − 1}`: for a start `a < n`, a difference
`d < n` and a length `ℓ ≤ n`, the set of `x < n` of the form `a + k d` with `k < ℓ`. -/
def arithProg (n : ℕ) (p : Fin n × Fin n × Fin (n + 1)) : Finset (Fin n) :=
  univ.filter fun x => ∃ k ∈ range p.2.2, (x : ℕ) = p.1 + k * p.2.1

/-- 4.2 Roth's lower bound with an explicit constant: for every `n`, the discrepancy of the
arithmetic progressions in `{0, …, n − 1}` is at least `n ^ (1/4) / 8`. -/
theorem rpow_div_eight_le_setSystemDisc_arithProg (n : ℕ) :
    (n : ℝ) ^ ((1 : ℝ) / 4) / 8 ≤ setSystemDisc (arithProg n) := by
  sorry

end

end TauCetiRoadmap.CombinatorialDiscrepancy
