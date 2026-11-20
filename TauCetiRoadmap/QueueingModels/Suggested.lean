import Mathlib

/-!
# Queueing models: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

The objects are finite birth–death generators on the states `{0, …, N}`, written
`Fin (N + 1)`, and the stationary laws of the Markovian queues they model. Rates are real
functions on `ℕ`, matrices are `Matrix (Fin (N + 1)) (Fin (N + 1)) ℝ` with rows indexing the
starting state, and a stationary vector is a row vector `π` with `π ᵥ* Q = 0`. The headline
theorems are the detailed-balance characterization and the product form of Layer 1, the limit of
the single-server law with a finite waiting room, and Jagerman's integral, the monotonicity in the
load and the many-server limit of Erlang's loss formula. The stationary laws of the individual
models, the Erlang recursion, the carried load, the Poisson, binomial and geometric comparisons,
and the Engset and machine-repair identities follow from these in one or two steps or by algebra:
the README states them in prose, without Lean names. The law of the random paths of a queue
(waiting times, departure processes, the state seen by an arrival) is not stated: the pinned
libraries have no carrier for a continuous-time Markov process.
-/
noncomputable section

open Filter Topology Finset MeasureTheory ProbabilityTheory
open scoped Matrix Nat unitInterval

namespace TauCetiRoadmap.QueueingModels

/-! ## Layer 1: birth–death generators -/

/-- 1.1 The **birth–death generator** on `{0, …, N}` with birth rates `b` and death rates `d`:
the entry `(n, n + 1)` is `b n` for `n < N`, the entry `(n, n - 1)` is `d n` for `1 ≤ n ≤ N`,
the diagonal entry is minus the sum of the rates out of `n`, and every other entry is `0`. The
values `b N` and `d 0` are never read. -/
def birthDeathGenerator (N : ℕ) (b d : ℕ → ℝ) : Matrix (Fin (N + 1)) (Fin (N + 1)) ℝ :=
  Matrix.of fun i j =>
    if (j : ℕ) = i + 1 then b i
    else if (i : ℕ) = j + 1 then d i
    else if i = j then -((if (i : ℕ) < N then b i else 0) + (if 0 < (i : ℕ) then d i else 0))
    else 0

/-- 1.2 **Stationary vectors of a birth–death generator satisfy detailed balance**: for all real
rates and every real row vector `π`, `π Q = 0` if and only if `π i Q i j = π j Q j i` for all
`i, j`. -/
theorem vecMul_birthDeathGenerator_eq_zero_iff (N : ℕ) (b d : ℕ → ℝ) (π : Fin (N + 1) → ℝ) :
    π ᵥ* birthDeathGenerator N b d = 0 ↔
      ∀ i j, π i * birthDeathGenerator N b d i j = π j * birthDeathGenerator N b d j i := by
  sorry

/-- 1.3 The **product weight** `∏_(k < n) b k / d (k + 1)`. -/
def productWeight (b d : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∏ k ∈ range n, b k / d (k + 1)

/-- 1.3 The **birth–death law** on `{0, …, N}`: the product weights divided by their sum. -/
def birthDeathLaw (N : ℕ) (b d : ℕ → ℝ) : Fin (N + 1) → ℝ :=
  fun n => productWeight b d n / ∑ m : Fin (N + 1), productWeight b d m

/-- 1.3 **Product form of the stationary law.** If the birth rates `b n`, `n < N`, are
nonnegative and the death rates `d n`, `1 ≤ n ≤ N`, are positive, the birth–death law is the
unique stationary probability vector of the birth–death generator. Birth rates may vanish. -/
theorem stationary_iff_eq_birthDeathLaw {N : ℕ} {b d : ℕ → ℝ} (hb : ∀ n, n < N → 0 ≤ b n)
    (hd : ∀ n, 1 ≤ n → n ≤ N → 0 < d n) (π : Fin (N + 1) → ℝ) :
    ((∀ i, 0 ≤ π i) ∧ ∑ i, π i = 1 ∧ π ᵥ* birthDeathGenerator N b d = 0) ↔
      π = birthDeathLaw N b d := by
  sorry

/-! ## Layer 2: the single-server queue with a finite waiting room -/

/-- 2.1 The **truncated geometric law** of the M/M/1/N queue with traffic intensity `ρ`:
`ρ ^ n / ∑_(k ≤ N) ρ ^ k` for `n ≤ N`, and `0` for `n > N`. -/
def mm1nLaw (N : ℕ) (ρ : ℝ) (n : ℕ) : ℝ :=
  if n ≤ N then ρ ^ n / ∑ k ∈ range (N + 1), ρ ^ k else 0

/-- 2.3 **Infinite waiting room, stable case**: for a success probability `p ≠ 0` and
`ρ = 1 - p < 1`, the M/M/1/N law converges as `N → ∞`, at every state, to the geometric law of
parameter `p`, and its mean converges to the geometric mean `(1 - p) / p`. -/
theorem tendsto_mm1nLaw_geometric (p : I) (hp : p ≠ 0) :
    (∀ n : ℕ, Tendsto (fun N => mm1nLaw N (1 - p) n) atTop
        (𝓝 ((geometricMeasure p).real {n}))) ∧
      Tendsto (fun N => ∑ n ∈ range (N + 1), (n : ℝ) * mm1nLaw N (1 - p) n) atTop
        (𝓝 ((1 - p) / p)) := by
  sorry

/-! ## Layer 3: the Erlang loss system -/

/-- 3.1 The **truncated Poisson law** of the Erlang loss system with `c` servers and offered load
`a`: `(a ^ n / n!) / ∑_(k ≤ c) a ^ k / k!` for `n ≤ c`, and `0` for `n > c`. -/
def erlangLaw (c : ℕ) (a : ℝ) (n : ℕ) : ℝ :=
  if n ≤ c then (a ^ n / n !) / ∑ k ∈ range (c + 1), a ^ k / k ! else 0

/-- 3.1 **Erlang's loss formula** `B(c, a)`: the stationary probability that all `c` servers are
busy. -/
def erlangB (c : ℕ) (a : ℝ) : ℝ :=
  erlangLaw c a c

/-- 3.2 **Jagerman's integral**: for `a > 0`,
`1 / B(c, a) = a ∫_(0)^(∞) e^(-a y) (1 + y)^c dy`. -/
theorem inv_erlangB_eq_integral (c : ℕ) {a : ℝ} (ha : 0 < a) :
    (erlangB c a)⁻¹ = a * ∫ y in Set.Ioi (0 : ℝ), Real.exp (-(a * y)) * (1 + y) ^ c := by
  sorry

/-- 3.3 With at least one server, Erlang's loss formula is strictly increasing in the load on
`[0, ∞)`. -/
theorem erlangB_strictMonoOn {c : ℕ} (hc : 1 ≤ c) : StrictMonoOn (erlangB c) (Set.Ici 0) := by
  sorry

/-- 3.4 **Many servers at a fixed load per server**: for `a ≥ 0`, `B(c, a c)` tends to `0` if
`a ≤ 1` and to `1 - 1 / a` if `a > 1`. -/
theorem tendsto_erlangB_mul {a : ℝ} (ha : 0 ≤ a) :
    Tendsto (fun c : ℕ => erlangB c (a * c)) atTop (𝓝 (if a ≤ 1 then 0 else 1 - a⁻¹)) := by
  sorry

end TauCetiRoadmap.QueueingModels
