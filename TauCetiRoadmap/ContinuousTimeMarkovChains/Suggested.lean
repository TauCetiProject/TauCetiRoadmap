import Mathlib

/-!
# Continuous-time Markov chains: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

The state space is a finite type `S` with decidable equality (Kolmogorov's criterion and the
definitions that need no finiteness are stated for any type), and matrices are real,
`Matrix S S ℝ`. Rows index the starting state: `exp (t • Q) i j` is the probability of being in
`j` at time `t` from `i`, a distribution is a row vector `π : S → ℝ`, and it evolves as
`π ᵥ* exp (t • Q)`. The matrix exponential is Mathlib's `NormedSpace.exp`, and a stochastic
matrix is a member of Mathlib's `Matrix.rowStochastic ℝ S`.

The law of the paths of a continuous-time chain, built from its jump chain and exponential
holding times, is not stated: Mathlib and Tau Ceti have no carrier for a continuous-time Markov
process (a law on càdlàg paths with the Markov property) at the pins.
-/

noncomputable section

open Filter Topology Finset
open scoped Matrix

namespace TauCetiRoadmap.ContinuousTimeMarkovChains

variable {S : Type*} [Fintype S] [DecidableEq S]

/-! ## Layer 1: Q-matrices, Metzler matrices and the sign of the exponential -/

/-- 1.1 A real square matrix is **Metzler** when its off-diagonal entries are nonnegative. -/
def IsMetzler {S : Type*} (B : Matrix S S ℝ) : Prop :=
  ∀ i j, i ≠ j → 0 ≤ B i j

/-- 1.1 A **Q-matrix** (rate matrix, generator) on a finite state space: a Metzler matrix whose
rows sum to zero. -/
def IsQMatrix (Q : Matrix S S ℝ) : Prop :=
  IsMetzler Q ∧ ∀ i, ∑ j, Q i j = 0

/-- 1.1 State `i` **leads to** state `j` for the matrix `B` when `j` is reached from `i` by a
finite chain of steps `a → b` with `a ≠ b` and `0 < B a b`; every state leads to itself. -/
def LeadsTo {S : Type*} (B : Matrix S S ℝ) (i j : S) : Prop :=
  Relation.ReflTransGen (fun a b => a ≠ b ∧ 0 < B a b) i j

/-- 1.1 A matrix is an **irreducible generator** when every state leads to every state. -/
def IsIrreducibleGenerator {S : Type*} (B : Matrix S S ℝ) : Prop :=
  ∀ i j, LeadsTo B i j

/-- 1.2 The exponential of a real square matrix `B` is entrywise nonnegative at every time
`t ≥ 0` if and only if `B` is Metzler. -/
theorem exp_smul_nonneg_iff_isMetzler (B : Matrix S S ℝ) :
    (∀ t : ℝ, 0 ≤ t → ∀ i j, 0 ≤ NormedSpace.exp (t • B) i j) ↔ IsMetzler B := by
  sorry

/-- 1.3 `exp (t • Q)` is a stochastic matrix for every `t ≥ 0` if and only if `Q` is a
Q-matrix. -/
theorem exp_smul_mem_rowStochastic_iff (Q : Matrix S S ℝ) :
    (∀ t : ℝ, 0 ≤ t → NormedSpace.exp (t • Q) ∈ Matrix.rowStochastic ℝ S) ↔ IsQMatrix Q := by
  sorry

/-! ## Layer 2: the Kolmogorov equations and transition semigroups -/

/-- 2.1 Uniqueness for the **forward equation**: a matrix function with `P 0 = 1` that solves
`P' = P Q` on `[0, ∞)` (one-sided at `0`) is `exp (t • Q)` there. -/
theorem eq_exp_smul_of_forward (Q : Matrix S S ℝ) (P : ℝ → Matrix S S ℝ) (h0 : P 0 = 1)
    (hP : ∀ t, 0 ≤ t → ∀ i j,
      HasDerivWithinAt (fun s => P s i j) ((P t * Q) i j) (Set.Ici 0) t) :
    ∀ t, 0 ≤ t → P t = NormedSpace.exp (t • Q) := by
  sorry

/-- 2.1 Uniqueness for the **backward equation**: a matrix function with `P 0 = 1` that solves
`P' = Q P` on `[0, ∞)` (one-sided at `0`) is `exp (t • Q)` there. -/
theorem eq_exp_smul_of_backward (Q : Matrix S S ℝ) (P : ℝ → Matrix S S ℝ) (h0 : P 0 = 1)
    (hP : ∀ t, 0 ≤ t → ∀ i j,
      HasDerivWithinAt (fun s => P s i j) ((Q * P t) i j) (Set.Ici 0) t) :
    ∀ t, 0 ≤ t → P t = NormedSpace.exp (t • Q) := by
  sorry

/-- 2.2 Every family of stochastic matrices `P t`, `t ≥ 0`, with `P 0 = 1`, the semigroup law
`P (s + t) = P s * P t` and right-continuity at `0` is `exp (t • Q)` for exactly one
Q-matrix `Q`. -/
theorem existsUnique_isQMatrix_of_semigroup (P : ℝ → Matrix S S ℝ) (h0 : P 0 = 1)
    (hadd : ∀ s t, 0 ≤ s → 0 ≤ t → P (s + t) = P s * P t)
    (hstoch : ∀ t, 0 ≤ t → P t ∈ Matrix.rowStochastic ℝ S)
    (hcont : ContinuousWithinAt P (Set.Ici 0) 0) :
    ∃! Q : Matrix S S ℝ, IsQMatrix Q ∧ ∀ t, 0 ≤ t → P t = NormedSpace.exp (t • Q) := by
  sorry

/-! ## Layer 3: uniformization -/

/-- 3.1 The uniformized matrix `1 + r⁻¹ • Q` at rate `r`. -/
def uniformized (Q : Matrix S S ℝ) (r : ℝ) : Matrix S S ℝ :=
  1 + r⁻¹ • Q

/-- 3.1 **Uniformization**: for every real matrix `Q`, every rate `r ≠ 0` and every real `t`,
`exp (t • Q) = Σₙ e^(−r t) (r t)ⁿ / n! · Kⁿ` entrywise, with `K = 1 + r⁻¹ • Q`. -/
theorem hasSum_uniformized_pow (Q : Matrix S S ℝ) {r : ℝ} (hr : r ≠ 0) (t : ℝ) (i j : S) :
    HasSum (fun n : ℕ => Real.exp (-(r * t)) * (r * t) ^ n / n.factorial *
      (uniformized Q r ^ n) i j) (NormedSpace.exp (t • Q) i j) := by
  sorry

/-! ## Layer 4: communication, stationary laws and convergence -/

/-- 4.1 A row vector `π` satisfies `π Q = 0` if and only if `π exp (t • Q) = π` for every
`t ≥ 0`. -/
theorem vecMul_eq_zero_iff_forall_vecMul_exp_smul (Q : Matrix S S ℝ) (π : S → ℝ) :
    π ᵥ* Q = 0 ↔ ∀ t : ℝ, 0 ≤ t → π ᵥ* NormedSpace.exp (t • Q) = π := by
  sorry

/-- 4.2 For a Metzler matrix `B` and a time `t > 0`, the entry `exp (t • B) i j` is strictly
positive if and only if `i` leads to `j`. -/
theorem exp_smul_apply_pos_iff {B : Matrix S S ℝ} (hB : IsMetzler B) {t : ℝ} (ht : 0 < t)
    (i j : S) : 0 < NormedSpace.exp (t • B) i j ↔ LeadsTo B i j := by
  sorry

omit [DecidableEq S] in
/-- 4.3 An irreducible Q-matrix on a nonempty finite state space has exactly one stationary
probability vector. -/
theorem existsUnique_stationary [Nonempty S] {Q : Matrix S S ℝ} (hQ : IsQMatrix Q)
    (hirr : IsIrreducibleGenerator Q) :
    ∃! π : S → ℝ, (∀ i, 0 ≤ π i) ∧ ∑ i, π i = 1 ∧ π ᵥ* Q = 0 := by
  sorry

/-- 4.4 **Convergence to equilibrium**: for an irreducible Q-matrix with stationary probability
vector `π`, every entry `exp (t • Q) i j` tends to `π j` as `t → ∞`. -/
theorem tendsto_exp_smul_apply {Q : Matrix S S ℝ} (hQ : IsQMatrix Q)
    (hirr : IsIrreducibleGenerator Q) {π : S → ℝ} (hπ0 : ∀ i, 0 ≤ π i) (hπ1 : ∑ i, π i = 1)
    (hπQ : π ᵥ* Q = 0) (i j : S) :
    Tendsto (fun t : ℝ => NormedSpace.exp (t • Q) i j) atTop (𝓝 (π j)) := by
  sorry

/-! ## Layer 5: detailed balance and Kolmogorov's criterion -/

/-- 5.1 The weights `π` satisfy detailed balance for `Q` if and only if they satisfy it for
`exp (t • Q)` at every time `t ≥ 0`. -/
theorem detailedBalance_iff_forall_exp_smul (Q : Matrix S S ℝ) (π : S → ℝ) :
    (∀ i j, π i * Q i j = π j * Q j i) ↔
      ∀ t : ℝ, 0 ≤ t → ∀ i j, π i * NormedSpace.exp (t • Q) i j =
        π j * NormedSpace.exp (t • Q) j i := by
  sorry

/-- 5.2 **Kolmogorov's criterion**: an irreducible Metzler matrix (in particular an irreducible
Q-matrix), on any index type, admits strictly positive weights satisfying detailed balance if and only if along
every closed walk the product of the entries equals the product of the entries of the reversed
walk. -/
theorem exists_detailedBalance_iff_cycle {S : Type*} {B : Matrix S S ℝ} (hB : IsMetzler B)
    (hirr : IsIrreducibleGenerator B) :
    (∃ π : S → ℝ, (∀ i, 0 < π i) ∧ ∀ i j, π i * B i j = π j * B j i) ↔
      ∀ (n : ℕ) (c : ℕ → S), c n = c 0 →
        ∏ k ∈ range n, B (c k) (c (k + 1)) = ∏ k ∈ range n, B (c (k + 1)) (c k) := by
  sorry

end TauCetiRoadmap.ContinuousTimeMarkovChains
