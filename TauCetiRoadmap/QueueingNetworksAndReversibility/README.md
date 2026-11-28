# Roadmap: product-form queueing networks, Kelly's reversal lemma and output theorems

**Summary.** In a queueing network customers move between stations at rates fixed by the current
state, and the stationary law is often a product of one factor per station. This roadmap proves the
classical product-form theorems and the output theorems that explain them by time reversal. The
data are transition rates `q` in `[0, ∞]` on a countable state space. Weights `π` are balanced
when the flow into every state equals the flow out of it; for out-rates at most a finite `r` and
finite weights this is invariance of `π` for the uniformized chain, which jumps from `i` to
`j ≠ i` with probability `q(i, j)/r`.

- **Kelly's reversal lemma.** If rates `q'` have the out-rates of `q` and
  `π(j) q(j, k) = π(k) q'(k, j)` for all `j ≠ k`, then `π` is balanced for both. No
  positivity or finiteness of the weights is needed.
- **Jackson's theorem.** In an open network a customer leaves station `j` at rate
  `λ_jk φ_j(n_j)` towards `k` and `μ_j φ_j(n_j)` towards the outside, with `φ_j(r) ≠ 0` for
  `r ≥ 1`, and enters `k` from outside at rate `ν_k`. Every solution `α ≥ 0` of the traffic
  equations `α_j (μ_j + Σ_k λ_jk) = ν_j + Σ_k α_k λ_kj` gives balanced product weights
  `∏_j ∏_{r ≤ n_j} α_j/φ_j(r)`; when each station's weights have a finite sum, the normalised law
  makes the stations independent.
- **The Gordon–Newell theorem.** For a closed network with `N` customers, `J ≥ 1` stations, an
  irreducible routing matrix, `φ_j(r) > 0` for `r ≥ 1` and a positive solution of
  `α_j Σ_k λ_jk = Σ_k α_k λ_kj`, the generator is an irreducible Q-matrix whose unique stationary
  law is the normalised product weight. A customer leaving a station sees the law with `N − 1`
  customers, and for single servers the mean queue lengths obey the mean value recursion.
- **Output theorems.** Suppose a chain started from an invariant probability `π` satisfies the
  reversed output condition: the stationary flow into each state through steps of class `c` is
  `p(c)` times the mass of the state. Then the classes of its first `T` steps are independent with
  law `p` and independent of the state at time `T`; run at the ticks of an independent Poisson
  clock, the class counts in the consecutive intervals of a finite grid are independent Poisson
  variables, independent of the final state. The condition holds for the exits of a Jackson
  network with bounded rates; for the single-server queue with arrival rate below service rate
  this gives Burke's theorem in the form of independent Poisson departure counts.
  It fails for a queue with a finite waiting room and for flows inside a network with feedback.

The roadmap builds on ContinuousTimeMarkovChains (Q-matrices, uniqueness of stationary vectors),
on Tau Ceti's path laws of Markov chains, on TimeReversalOfMarkovChains (stationary chains read
backwards) and on QueueingModels, whose finite queues appear in the examples. Layer 1 treats
balance, Layer 2 product-form networks, Layer 3 the uniformized chain and output theorems.

## Conventions

- **Rates.** `S` is a type with decidable equality and `q : S → S → ℝ≥0∞`. The diagonal of `q`
  is never read: `outRate q i = Σ_{j ≠ i} q i j` (a `tsum`). No finiteness, summability or
  regularity is assumed of `q` unless a statement says so. Weights `π : S → ℝ≥0∞` are not
  normalised.
- **Balance.** `IsBalanced q π` means `Σ_{i ≠ j} π i * q i j = π j * outRate q j` for every `j`:
  Kelly's equilibrium equations (Kelly, as displayed on p. 29 and p. 41). In `ℝ≥0∞`,
  `0 * ⊤ = 0` and `x / 0 = ⊤` for `x ≠ 0`, `0 / 0 = 0`, `⊤ / ⊤ = 0`; every statement below that
  divides names the hypothesis that avoids these values. Balance is a statement about rates: no
  continuous-time process is claimed in Layers 1 and 2, and for unbounded rates balance need not
  describe a process. Detailed balance is `π j * q j k = π k * q k j` for `j ≠ k`.
- **Reversed rates.** `reverseRate q π j k = π k * q k j / π j` (Kelly, Theorem 1.12, p. 28).
- **Q-matrices.** On a finite `S`, real matrices with rows indexing the starting state and row
  vectors acting by `p ᵥ* Q`; `IsMetzler`, `IsQMatrix`, `LeadsTo` and `IsIrreducibleGenerator` are
  copied verbatim from ContinuousTimeMarkovChains, Layer 1, 1.1.
- **Networks.** `J` stations, states `n : Fin J → ℕ`, `e_j = Pi.single j 1`. Open-network data
  are in `ℝ≥0`: routing rates `lam j k` (`j ≠ k`; the diagonal is not read), exit rates `μ j`,
  entry rates `ν k`, service functions `φ j r` (read only at `r ≥ 1`) and traffic solutions
  `α j`. In `ℝ≥0`, `x / 0 = 0`. Closed-network data are real: a routing matrix `lam` (Metzler),
  service functions `φ` and a solution `α` of the closed traffic equations.
- **Uniformization.** `S` is also countable, with a measurable structure in which singletons are
  measurable (so every subset is measurable). For `r : ℝ≥0∞`, `uniformize q r` is the kernel
  `i ↦ Σ_j w i j • δ_j` with `w i j = q i j / r` for `j ≠ i` and `w i i = 1 − outRate q i / r`
  (truncated subtraction). It is a Markov kernel when every out-rate is at most `r`. Its path law
  from an initial measure `π` is Tau Ceti's `markovChainLaw π K` on `ℕ → S`; the path law up to a
  horizon `T` is `chainPath`, copied verbatim with `pathEval` and `reverseIndex` from
  TimeReversalOfMarkovChains, Layer 1, 1.1; it is the image of `markovChainLaw π K` under
  restriction to the times `0, …, T` (both are `Kernel.partialTraj` of the same kernels from time
  `0`: Mathlib `Kernel.traj_map_frestrictLe`).
- **Classes of steps.** A *mark* is a function `mark : S → S → C`, read on consecutive states
  `(ω k, ω (k + 1))`; the step `k` of the path `ω` has class `mark (ω k) (ω (k + 1))`. Self-loops
  of the uniformized chain are steps too.
- **The Poisson clock.** The continuous-time chain on a grid of `m` consecutive intervals of
  lengths `s 0, …, s (m − 1)` is the uniformized chain `ω` run at the ticks of an independent
  clock whose tick counts `M 0, …, M (m − 1)` in the intervals are independent Poisson variables
  with means `r * s i` (Mathlib `poissonMeasure`). The steps in interval `i` are those with index
  `k` in `[M 0 + ⋯ + M (i − 1), M 0 + ⋯ + M i)`, and the state at the end of the grid is
  `ω (M 0 + ⋯ + M (m − 1))`. For a finite `S`, a Q-matrix `Q` and `r > 0` with `−Q i i ≤ r`, the
  uniformized kernel has the matrix `K = 1 + r⁻¹ Q`, and the transition matrix over an interval
  of length `t` is `Σ_n e^(−rt) (rt)^n/n! Kⁿ = exp(tQ)` by ContinuousTimeMarkovChains 3.1
  (`hasSum_uniformized_pow`).

## Layer 1: balance, reversed rates and truncation

### 1.1 Balance and Kelly's reversal lemma

Define `outRate`, `IsBalanced` and `reverseRate` as in the Conventions.

Prove **Kelly's reversal lemma** `isBalanced_of_reversed`: for all rates `q`, `q'` and weights
`π` (zero and infinite values allowed), if `outRate q' j = outRate q j` for every `j` and
`π j * q j k = π k * q' k j` for all `j ≠ k`, then `π` is balanced for `q` and for `q'` (Kelly,
Theorem 1.13, (1.27)–(1.28), p. 30, for positive `π` summing to one; proof p. 31). Detailed
balance is the case `q' = q`.

Route (proved here). At a state `j`, each term with `i ≠ j` of the inflow is
`π i * q i j = π j * q' j i` by the hypothesis at `(i, j)`; summing with `ENNReal.tsum_mul_left`
gives `π j * outRate q' j = π j * outRate q j`. The same computation with the hypothesis at
`(j, i)` gives balance for `q'`.

The converse is a short computation, used in 3.1 and not stated separately: if `π j ≠ 0` and
`π j ≠ ⊤` for every `j`, then `π` is balanced for `q` if and only if
`outRate (reverseRate q π) j = outRate q j` for every `j` (the rate form of Kelly, Theorem 1.12,
p. 28, which also shows `q(j) = q'(j)` on p. 30). Indeed `outRate (reverseRate q π) j` is
`(Σ_{k ≠ j} π k * q k j) * (π j)⁻¹` by `ENNReal.tsum_mul_right`, and since `π j ≠ 0, ⊤` this
equals `outRate q j` exactly when `Σ_{k ≠ j} π k * q k j = π j * outRate q j`
(`ENNReal.eq_div_iff`). In that case `reverseRate q π` satisfies the hypotheses of the lemma with
`q` (`π k * (π j * q j k / π k) = π j * q j k`, as `π k ≠ 0, ⊤`), so `π` is balanced for it as
well, and the same cancellation gives `reverseRate (reverseRate q π) π j k = q j k` for `j ≠ k`.

**Checks.**
- The cycle `0 → 1 → 2 → 0` with rates `1`: the uniform weights are balanced, the reversed rates
  are those of the opposite cycle, and detailed balance fails (`π 0 q 0 1 = 1/3`,
  `π 1 q 1 0 = 0`).
- The converse needs `π j ≠ 0`: on two states with `q 0 1 = 1`, `q 1 0 = 0` and `π = (0, 1)`,
  `π` is balanced (both flows are `0`), but `outRate (reverseRate q π) 0 = 0 · 0 / 0 = 0` while
  `outRate q 0 = 1`.
- The converse needs `π j ≠ ⊤`: with `q 0 1 = q 1 0 = 1` and `π = (⊤, ⊤)`, `π` is balanced
  (`⊤ = ⊤` at both states), but the reversed rate `⊤ · 1 / ⊤ = 0` gives out-rate `0 ≠ 1`.
- On the four states `0, …, 3` with rates `q 0 1 = 2`, `q 1 2 = 1`, `q 1 0 = 1/2`, `q 2 0 = 3`,
  `q 2 3 = 1`, `q 3 0 = 2`, the stationary vector of the generator is balanced, the reversed rates
  have the same out-rates and reverse back to `q`, and raising the weight of state `0` by `1/10`
  breaks both balance and the equality of out-rates.

*Needs:* Mathlib `ENNReal.tsum_mul_left`, `ENNReal.tsum_mul_right`, `ENNReal.eq_div_iff`.
(Proved here.)

### 1.2 Balance for a Q-matrix

Copy `IsMetzler`, `IsQMatrix`, `LeadsTo` and `IsIrreducibleGenerator` verbatim from
ContinuousTimeMarkovChains, Layer 1, 1.1.

Prove `isBalanced_ofReal_iff_vecMul_eq_zero`: for a finite `S`, a Q-matrix `Q` and a row vector
`p` with `p i ≥ 0` for all `i`, the weights `ENNReal.ofReal (p i)` are balanced for the rates
`ENNReal.ofReal (Q i j)` if and only if `p ᵥ* Q = 0`. So on finite state spaces balance is
stationarity in the sense of ContinuousTimeMarkovChains, and for an irreducible Q-matrix the
balanced probability weights are unique by its 4.3 (`existsUnique_stationary`).

Route (proved here). Off the diagonal `Q i j ≥ 0` and `p i ≥ 0`, so `ENNReal.ofReal_mul` and
`ENNReal.ofReal_sum_of_nonneg` turn the inflow at `j` into `ENNReal.ofReal (Σ_{i ≠ j} p i Q i j)`
and the outflow into `ENNReal.ofReal (p j · Σ_{k ≠ j} Q j k)`. Since the row sums vanish,
`Σ_{k ≠ j} Q j k = −Q j j`. Both arguments are nonnegative, so by `ENNReal.ofReal_eq_ofReal_iff`
balance at `j` is `Σ_{i ≠ j} p i Q i j + p j Q j j = 0`, which is `(p ᵥ* Q) j = 0`.

**Checks.**
- `p ≥ 0` is needed: for `Q = [[0, 0], [1, −1]]` and `p = (1, −1)`, the clipped weights `(1, 0)`
  are balanced while `p ᵥ* Q = (−1, 1)`.
- Zero row sums are needed: for `Q` the identity and `p = (1, 1)`, all off-diagonal rates vanish
  and the weights are balanced, while `p ᵥ* Q = (1, 1)`.
- The Metzler property is needed: for `Q = [[1, −1], [0, 0]]` and `p = (1, 0)`, the clipped rates
  vanish and the weights are balanced, while `p ᵥ* Q = (1, −1)`.

*Needs:* Mathlib `ENNReal.ofReal_mul`, `ENNReal.ofReal_sum_of_nonneg`,
`ENNReal.ofReal_eq_ofReal_iff`, `Matrix.vecMul`; ContinuousTimeMarkovChains 1.1 (definitions,
copied). (Proved here.)

### 1.3 Truncation and partial balance

Define `truncate q A`: the rate `q i j` when `i, j ∈ A`, and `0` otherwise.

Prove `isBalanced_truncate_iff`: let `π` be balanced for `q`, let `A ⊆ S`, and let
`π j * outRate q j ≠ ⊤` for every `j ∈ A`. Then the restriction of `π` to `A` (zero outside `A`)
is balanced for `truncate q A` if and only if the partial balance equations
`π j · Σ_{k ∉ A} q j k = Σ_{k ∉ A} π k q k j` hold at every `j ∈ A` (Kelly, Exercise 1.6.2,
(1.24), p. 27, where the truncated chain's equilibrium is the conditional law `π(j)/π(A)`). Every
`π` satisfying detailed balance satisfies them, term by term.

Route (proved here). At `j ∉ A` both sides of truncated balance vanish (every truncated rate into
`j` is `0`, and the restricted weight at `j` is `0`). At `j ∈ A` split the inflow and the outflow
of the balance equation for `q` into the parts inside and outside `A`: `a + b = c + d`, with
`a = Σ_{i ∈ A, i ≠ j} π i q i j`, `b = Σ_{i ∉ A} π i q i j`, `c = π j Σ_{k ∈ A, k ≠ j} q j k`,
`d = π j Σ_{k ∉ A} q j k`. Truncated balance at `j` is `a = c`, partial balance is `b = d`. Since
`c + d = π j * outRate q j ≠ ⊤`, all four are finite and either equality gives the other by
`ENNReal.add_right_inj`.

**Checks.**
- The single-server queue with `λ = 1`, `μ = 2` on `{0, …, 12}` has balanced geometric weights
  `2⁻ⁿ`; for every `K ≤ 12` the truncation to `{0, …, K}` is balanced and the normalised weights
  are the truncated geometric law `mm1nLaw K (1/2)` of QueueingModels 2.1. The infinite-server
  queue with load `3/2` truncated to `{0, …, c}` gives the Erlang law `erlangLaw c (3/2)` of
  QueueingModels 3.1.
- The cycle `0 → 1 → 2 → 0` truncated to `{0, 1}` fails: the flow from `0` to state `2` is `0`,
  the flow from `2` to `0` is `1/3`, and the truncated rates (only `0 → 1`) do not balance the
  uniform weights.
- `π j * outRate q j ≠ ⊤` is needed: on `{0, 1, 2}` with `q 0 1 = 1`, `q 1 0 = 0`,
  `q 0 2 = q 2 0 = q 1 2 = q 2 1 = ⊤` and `π = (1, 1, 1)`, `π` is balanced and partial balance
  holds on `A = {0, 1}` (`⊤ = ⊤`), while the truncated flows at `0` are `0` in and `1` out.

*Needs:* 1.1 (`IsBalanced`); Mathlib `Set.indicator`, `ENNReal.add_right_inj`. (Proved here.)

### Examples

- For a real Metzler matrix `B` that is an irreducible generator, on any index type, whose
  products along every closed walk agree with those along the reversed walk,
  ContinuousTimeMarkovChains 5.2 (`exists_detailedBalance_iff_cycle`) gives positive weights in
  detailed balance; by the lemma of 1.1 with `q' = q` they are balanced for the rates
  `ENNReal.ofReal (B i j)`.

### Dependencies

ContinuousTimeMarkovChains (definitions of 1.2, copied; 4.3 and 5.2 in remarks); QueueingModels
2.1 and 3.1 (Checks of 1.3); Mathlib.

## Layer 2: product-form networks

### 2.1 Jackson's theorem for open migration processes

Define, for `n m : Fin J → ℕ`, the rates `jacksonRate lam μ ν φ n m`: the sum of
`lam j k * φ j (n j)` over the pairs `j ≠ k` with `n j > 0` and
`m = update (update n j (n j − 1)) k (n k + 1)` (a customer moves from `j` to `k`), of
`μ j * φ j (n j)` over the `j` with `n j > 0` and `m = update n j (n j − 1)` (a customer leaves
from `j`), and of `ν k` over the `k` with `m = update n k (n k + 1)` (a customer enters at `k`)
(Kelly, (2.8), p. 48). Routing depends only on the station a customer leaves and on its count:
the rate of a move from `j` is `lam j k` times the service rate `φ j (n j)` of station `j`. Define
`nodeWeight α φ j n = ∏_{r = 1}^{n} α j / φ j r`, `jacksonWeight α φ n = ∏_j nodeWeight α φ j (n j)`
and the law `jacksonLaw α φ = Σ_n (jacksonWeight α φ n / Σ_m jacksonWeight α φ m) • δ_n`, a
measure on `Fin J → ℕ` (the zero measure when the sum is infinite).

Prove `isBalanced_jacksonWeight`: let `φ j r ≠ 0` for `r ≥ 1` and let `α` satisfy the traffic
equations `α j (μ j + Σ_{k ≠ j} lam j k) = ν j + Σ_{k ≠ j} α k lam k j` for every `j` (Kelly, (2.9),
p. 49, written without dividing by the total rates). Then

- (a) `jacksonWeight α φ` is balanced for `jacksonRate lam μ ν φ`;
- (b) if `Σ_n nodeWeight α φ j n < ⊤` for every `j` (Kelly's `b_j > 0`, p. 49), `jacksonLaw α φ`
  is a probability measure, gives `n` the mass `∏_j nodeWeight α φ j (n j) / Σ_m nodeWeight α φ j m`
  (the stations are independent at a fixed time, each with the law of an isolated station), and
  its point masses are balanced (Kelly, Theorem 2.4, p. 49, proof p. 50).

Prove `reverseRate_jacksonRate`: if `φ j r ≠ 0` for `r ≥ 1` and `α j ≠ 0` for every `j`, then
for `n ≠ m` the reversed rates `reverseRate (jacksonRate lam μ ν φ) (jacksonWeight α φ) n m` are
the rates of the open network with routing `α k lam k j / α j`, exit rates `ν j / α j` and entry
rates `α k μ k` (the rate computation in the proof of Kelly, Theorem 2.5, p. 51). The traffic
equations are not assumed: the identity of rates holds for every nonzero `α`.

No irreducibility and no positivity of `α` is assumed in (a): a station that no customer reaches
has `α j = 0`, and the weights vanish where it is occupied. Summing the traffic equations over `j`
gives `Σ_j α j μ j = Σ_j ν j`: the exit flow equals the entry flow.

Route (proved here; Kelly, p. 50). Write `w = jacksonWeight α φ`. For `n j ≥ 1`,
`w n * φ j (n j) = w (n − e_j) * α j` (multiply out `α j / φ j (n j) · φ j (n j) = α j`, valid
since `φ j (n j) ≠ 0`); no division by `α` occurs. *Partial balance at `j`* (for `n j ≥ 1`): the
flow out of `n` through departures from `j` is
`w n φ j (n j) (μ j + Σ_{k ≠ j} lam j k) = w (n − e_j) α j (μ j + Σ_{k ≠ j} lam j k)`, and the flow
into `n` through arrivals at `j` is
`w (n − e_j) ν j + Σ_{k ≠ j} w (n − e_j + e_k) φ k (n k + 1) lam k j`, which equals
`w (n − e_j) (ν j + Σ_{k ≠ j} α k lam k j)` by the identity at station `k` for the state
`n − e_j + e_k`; the two agree by the traffic equation at `j`. For `n j = 0`
neither flow has terms. *Partial balance for entries*: the flow out of `n` through entries is
`w n Σ_k ν k`, and the flow into `n` through exits is `Σ_k w (n + e_k) μ k φ k (n k + 1)`, which is
`w n Σ_k α k μ k`; they agree since `Σ_k α k μ k = Σ_k ν k` (sum the traffic equations; the double
sums `Σ_j Σ_{k ≠ j} α j lam j k` cancel, all terms finite in `ℝ≥0`). Every transition into or out
of `n` is a departure from some `j` or an entry, so summing the partial balance equations over
`j` and adding the entry equation gives (a); the `tsum` over target states is a finite sum of
indicator terms, each selecting one state. For (b), `Σ_n w n = ∏_j Σ_r nodeWeight α φ j r` by
`tsum_prod` and `ENNReal.tsum_mul_left`, inductively over the stations; this is finite
and at least `1` (the state `0`), so the masses are `w n / Σ w`, they sum to `1`, the quotient
splits into the product of the station quotients, and balance passes to the multiple
`(Σ w)⁻¹ w` by `ENNReal.tsum_mul_right`. For the reversed network, `w n ≠ 0, ⊤` since
`α j, φ j r ≠ 0`; for a move
`m = n − e_j + e_k`, `w m * (lam k j φ k (n k + 1)) / w n = α k lam k j φ j (n j) / α j`; for an
exit `m = n − e_j`, `w m * ν j / w n = ν j φ j (n j) / α j`; for an entry `m = n + e_k`,
`w m * μ k φ k (n k + 1) / w n = α k μ k`; any other `m ≠ n` has rate `0` on both sides.

**Checks.**
- The tandem `ν = (2, 0)`, `lam 0 1 = 3`, `μ = (0, 4)`, single servers: `α = (2/3, 1/2)`, the
  weights are balanced at every state of `{0, …, 4}²`, and the law is the product of geometric
  laws `(1/3)(2/3)ⁿ` and `(1/2)(1/2)ⁿ`.
- Balance holds, and the reversed rates are those of `reverseRate_jacksonRate`, on `{0, …, 4}^J`
  for: a two-station loop
  (`ν = (1, 0)`, `lam 0 1 = 2`, `lam 1 0 = 1`, `μ = (0, 2)`, two servers at station 1,
  `α = (3/4, 1/2)`), three stations with service functions `1`, `r`, `min(r, 2)`, a single
  station with two servers, zero routing, and a loop of infinite-server stations (`φ j r = r`).
- A station that no customer reaches: with `lam 0 1 = 1`, `lam 2 0 = 1`, `μ = (1, 2, 1)`,
  `ν = (1, 0, 0)`, the traffic solution is `α = (1/2, 1/4, 0)`, the weights vanish when station 2
  is occupied, and (a) holds.
- The reversed network needs `α j ≠ 0`: in the previous network, at `n = (0, 0, 1)` and
  `m = (1, 0, 1)` the reversed rate is `0 · μ 0 / 0 = 0`, while the claimed entry rate is
  `α 0 μ 0 = 1/2`.
- The traffic equations are needed: in the two-station loop above with `α = (1/3, 1/3)` (which
  violates them) balance fails at some state of `{0, …, 4}²`, while the identity of the reversed
  rates still holds there.
- Routing must not depend on the receiving station: with the loop rates of the previous Check but
  the move from `j` to `k` at rate `lam j k (1 + n k)`, no weights `a^(n 0) b^(n 1)` are balanced
  (balance at `(0, 0)` forces `b = 1/2`, and no `a` then balances `(1, 0)`, `(0, 1)` and `(1, 1)`).
- The finiteness in (b) is not automatic: a single server with `α = 1` has node weights `1` and
  an infinite sum, and `jacksonLaw` is then the zero measure.

*Needs:* 1.1 (`IsBalanced`, `reverseRate`); Mathlib `tsum_prod`, `ENNReal.tsum_mul_left`,
`ENNReal.tsum_mul_right`, `Measure.sum`, `Measure.dirac`, `Measure.sum_smul_dirac_singleton`.
(Proved here.)

### 2.2 The Gordon–Newell theorem for closed migration processes

Define `closedRate lam φ n m` as the sum of `lam j k * φ j (n j)` over the pairs `j ≠ k` with
`n j > 0` and `m = update (update n j (n j − 1)) k (n k + 1)` (Kelly, (2.1), p. 40). The states with
`N` customers are `ClosedState J N`, the elements of `Finset.Nat.antidiagonalTuple J N`; on this
finite type `closedGenerator lam φ N` has the off-diagonal entries `closedRate` and the diagonal
entries minus the row sums of the rates. Define
`closedWeight α φ n = ∏_j α j ^ n j / ∏_{r ≤ n j} φ j r`, the normalising constant
`normalizingConstant α φ N = Σ_{n ∈ antidiagonalTuple J N} closedWeight α φ n` (written `G(N)`), and
the Gordon–Newell law `closedLaw α φ N n`, equal to
`closedWeight α φ n / G(N)` when `n` has `N` customers and to `0` otherwise.

Prove `stationary_iff_eq_closedLaw`: let `J ≥ 1`, let `lam` be a Metzler matrix that is an
irreducible generator (a customer can pass between any two stations, Kelly, p. 41), let
`φ j r > 0` for `r ≥ 1`, and let `α` be positive with
`α j Σ_{k ≠ j} lam j k = Σ_{k ≠ j} α k lam k j`
for every `j` (Kelly, (2.2), p. 41). Then for every `N` the generator `closedGenerator lam φ N` is
a Q-matrix and an irreducible generator, and a vector on `ClosedState J N` is nonnegative, sums to
`1` and is annihilated by the generator if and only if it is the Gordon–Newell law (Kelly,
Theorem 2.3, p. 41, proof p. 42).

Route (proved here). *Q-matrix*: the off-diagonal entries are `lam j k φ j (n j) ≥ 0` (Metzler and
`φ > 0`), and the rows sum to `0` by construction (`closedRate n n = 0`, since a move changes the
state). *Irreducibility*: for `n ≠ m` with `N` customers choose `a` with `n a > m a` and `b` with
`n b < m b`; irreducibility of `lam` gives a chain `a = c₀, c₁, …, c_ℓ = b` of stations with
`c_i ≠ c_(i+1)` and `lam c_i c_(i+1) > 0`. Move one customer along it: before step `i` station
`c_i` holds at least one customer (initially `n a ≥ 1`, afterwards the customer just moved in), so
each step has rate `lam c_i c_(i+1) φ (·) > 0` and changes the state. The result is
`n − e_a + e_b`, which is closer to `m` in `ℓ¹` distance by `2`; induct on the distance. The
induced chain of states is a `LeadsTo` chain of the generator. *Stationarity*: by the identity
`closedWeight n · φ j (n j) = closedWeight (n − e_j) · α j` (`n j ≥ 1`), the flow out of `n` through
departures from `j`, `closedWeight n · φ j (n j) Σ_{k ≠ j} lam j k`, equals the flow into `n`
through
arrivals at `j`, `Σ_{k ≠ j} closedWeight (n − e_j + e_k) · φ k (n k + 1) lam k j`; both are
`closedWeight (n − e_j) α j Σ_{k ≠ j} lam j k`, the second by the identity at station `k` and the
traffic equation at `j` (partial balance,
Kelly, (2.5), p. 42); for `n j = 0` both are empty. Summing over `j` gives `closedLaw ᵥ* Q = 0`.
The weights are positive and the state set is nonempty (`J ≥ 1`), so `G(N) > 0` and the law is a
probability vector. *Uniqueness*: ContinuousTimeMarkovChains 4.3 (`existsUnique_stationary`).

**Checks.**
- Three stations with routing `lam = [[0, 2, 1], [1, 0, 3], [2, 1/2, 0]]` and service functions
  `1`, `min(r, 2)`, `r`, and a cyclic network of four stations with rates `1, 2, 3, 1/2`: for
  `N = 0, …, 4` the generator is a Q-matrix of rank `|S| − 1`, and the Gordon–Newell law is
  annihilated by it and sums to `1`.
- The marginals are not independent: with two stations, `N = 1`, `φ = 1`, `α = (1, 1)`, the law is
  `1/2` at `(1, 0)` and at `(0, 1)`; the probability that both stations hold a customer is `0`,
  while the product of the marginal probabilities is `1/4`.
- `J ≥ 1` is needed: for `J = 0` and `N = 1` the state set is empty, the Gordon–Newell law is the
  empty vector, and no vector sums to `1`.
- `N = 0` and `J = 1` give a single state, with law `1`.

*Needs:* 1.2 (`IsMetzler`, `IsQMatrix`, `LeadsTo`, `IsIrreducibleGenerator`, copied);
ContinuousTimeMarkovChains 4.3 (`existsUnique_stationary`); Mathlib
`Finset.Nat.antidiagonalTuple`, `Finset.Nat.mem_antidiagonalTuple`, `Relation.ReflTransGen`.
(Proved here.)

### 2.3 Normalising constants, the arrival theorem and mean values

Define `meanCount α φ N j = Σ_{n ∈ antidiagonalTuple J N} closedLaw α φ N n · n j`, the mean
number `L_j(N)` of customers at station `j`.

Three theorems, each proved separately below.

- (a) Prove `powerSeries_mk_normalizingConstant`: for all real `α` and `φ`, the generating
  function `Σ_N G(N) zᴺ` is the product over `j` of `Σ_n α j ^ n / ∏_{r ≤ n} φ j r · zⁿ`, as
  formal power series (Kelly, Exercise 2.3.6, pp. 47–48).
- (b) Prove `closedLaw_add_single_mul` (the arrival theorem): if `α j > 0` for every `j` and
  `φ j r > 0` for `r ≥ 1`, then for `N ≥ 1`, every station `j` and every `m`,
  `closedLaw α φ N (m + e_j) · φ j (m j + 1) = α j G(N − 1)/G(N) · closedLaw α φ (N − 1) m`.
  Multiplied by `Σ_{k ≠ j} lam j k`, the left side is the stationary rate at which a customer
  leaves station `j` from the state `m + e_j`, leaving `m` behind; summed over `m` this rate is
  the throughput `α j (Σ_{k ≠ j} lam j k) G(N − 1)/G(N)` of station `j` (Kelly, Exercise 2.3.1,
  pp. 46–47, where Kelly's `B_N` is `1/G(N)`). The factor `Σ_{k ≠ j} lam j k` does not depend on
  `m`, so the state seen by a customer leaving `j`, with the customer removed, has the
  Gordon–Newell law with `N − 1` customers (the open-network analogue is Kelly, Corollary 2.7,
  p. 52).
- (c) Prove `meanCount_recursion` (mean values): if `α j > 0` for every `j` and `φ j r = 1` for
  all `j, r` (single servers), then for `N ≥ 1`,
  `L_j(N) = α j (1 + L_j(N − 1)) G(N − 1)/G(N)` and `G(N − 1)/G(N) = N / Σ_k α k (1 + L_k(N − 1))`.
  Together they compute every `L_j(N)` from `L(0) = 0` without the normalising constants.

Route (proved here). (a): by `PowerSeries.coeff_prod` the coefficient of `zᴺ` in the product is
the sum, over the functions `l` with finite support summing to `N`, of
`∏_j α j ^ l j / ∏_{r ≤ l j} φ j r`; these functions correspond bijectively to
`antidiagonalTuple J N`
(`Finset.mem_finsuppAntidiag`, `Finset.Nat.mem_antidiagonalTuple`), and the summand is
`closedWeight α φ l`. (b): if `m` has `N − 1` customers, `m + e_j` has `N`, and
`closedWeight (m + e_j) = closedWeight m · α j / φ j (m j + 1)`; then both sides equal
`α j closedWeight m / G(N)`, as `G(N − 1) > 0` (positive weights, nonempty state set since `j`
exists). Otherwise `m + e_j` does not have `N` customers (here `N ≥ 1` is used) and both sides are
`0`. (c): with `φ = 1` the shift `n ↦ n − k e_j` is a bijection from the states with `N`
customers and `n j ≥ k` onto the states with `N − k` customers, multiplying weights by `α j ^ (−k)`;
so the probability that station `j` holds at least `k` customers is `α j ^ k G(N − k)/G(N)` for
`1 ≤ k ≤ N` (Kelly, Exercise 2.3.8, p. 48). Summing over `k`,
`L_j(N) = Σ_{1 ≤ k ≤ N} α j ^ k G(N − k)/G(N)`, and splitting off `k = 1`,
`L_j(N) = α j G(N − 1)/G(N) · (1 + Σ_{1 ≤ k ≤ N − 1} α j ^ k G(N − 1 − k)/G(N − 1))`,
which is `α j G(N − 1)/G(N) (1 + L_j(N − 1))`. Summing this over `j` and using `Σ_j L_j(N) = N`
gives the
second identity (its denominator is positive).

**Checks.**
- With `α = (1, 1/2, 2/3)` and single servers: `G(1) = 13/6`, `G(2) = 115/36`,
  `L(1) = (6/13, 3/13, 4/13)`, and `G(1)/G(2) = 78/115 = 2 / Σ_k α k (1 + L_k(1))`. The two
  identities of (c), the tail formula and the arrival theorem hold for `N ≤ 6` (and also with four
  stations, `α = (3, 1, 1/5, 2)`); the generating function identity holds up to `z⁷`.
- With service functions `1`, `min(r, 2)`, `r` and `α = (2, 1, 3/2)` the arrival theorem holds
  for `N ≤ 5`.
- `N ≥ 1` is needed in (b): at `N = 0`, `m = 0` the left side is `0` (the state `e_j` has one
  customer) and the right side is `α j`.
- (c) needs single servers: with two servers at station 0, `α = (1, 1/2)`, `N = 3`, the first
  identity fails.

*Needs:* 2.2 (`closedWeight`, `normalizingConstant`, `closedLaw`); Mathlib `PowerSeries.mk`,
`PowerSeries.coeff_prod`, `Finset.mem_finsuppAntidiag`, `Finset.Nat.mem_antidiagonalTuple`.
(Proved here.)

### Examples

- With two stations, `φ 0 r = r` (working machines, each failing at rate `λ`) and `φ 1 r = 1` (one
  repairer of rate `μ`), `lam 0 1 = λ`, `lam 1 0 = μ`, the traffic solution `α = (μ, λ)` gives the
  law of the number of machines under repair `M!/(M − n)! (λ/μ)ⁿ / Σ_k M!/(M − k)! (λ/μ)ᵏ`: the
  machine-repair law of QueueingModels 4.3. For `M = 3`, `λ = 1`, `μ = 2` it is
  `(4/19, 6/19, 6/19, 3/19)`.
- A single station with `φ j r = min(r, s)` and `α = λ/μ` has the stationary law of the M/M/s
  queue; when `λ < sμ` its node weights have a finite sum.

### Dependencies

Layer 1; ContinuousTimeMarkovChains 4.3; QueueingModels 4.3 (Example); Mathlib.

## Layer 3: uniformized time and output theorems

### 3.1 The uniformized chain and its reversal

Copy `pathEval`, `reverseIndex` and `chainPath` verbatim from TimeReversalOfMarkovChains, Layer 1,
1.1. Define `uniformize q r` as in the Conventions (Mathlib `Kernel.ofFunOfCountable`).

Prove `uniformize_markov_invariant_reverse`: let `r ≠ ⊤` and `outRate q i ≤ r` for every `i`.
Then `uniformize q r` is a Markov kernel; a measure `π` on `S` with `π {i} ≠ ⊤` for every `i` is
invariant for it (`Kernel.Invariant`) if and only if its point masses are balanced for `q`; and
if moreover `π` is finite, `π {i} ≠ 0` for every `i` and the point masses are balanced, then for
every horizon `T` the stationary chain read backwards,
`(chainPath π (fun _ ↦ uniformize q r) T).map (reverseIndex T)`, is the stationary chain of the
reversed rates, `chainPath π (fun _ ↦ uniformize (reverseRate q π{·}) r) T` (the uniformized form
of Kelly, Theorem 1.12, p. 28).

Route (proved here). *Markov*: the total mass at `i` is
`(1 − outRate q i / r) + Σ_{j ≠ i} q i j / r = (1 − outRate q i / r) + outRate q i / r`, which is
`1` as `outRate q i / r ≤ 1` (for
`r = 0` all rates vanish and `0 / 0 = 0`). *Invariance*: on a countable space with measurable
singletons two measures agree when they agree on points (`Measure.ext_of_singleton`), and
`(π.bind K) {x} = Σ_y π {y} K y {x}` (`Measure.bind_apply`, `lintegral_countable'`). This is
`π {x} (1 − outRate q x / r) + Σ_{y ≠ x} π {y} q y x / r`; as
`π {x} = π {x} (1 − outRate q x / r) + π {x} outRate q x / r` and the first summand is finite
(`π {x} ≠ ⊤`), invariance at `x` is
`Σ_{y ≠ x} π {y} q y x / r = π {x} outRate q x / r`, which for `0 < r < ⊤` is balance at `x`
(multiply by `r`); for `r = 0` both hold trivially. *Reversal*: by the first two parts
`K = uniformize q r` is Markov and `π` invariant, so TimeReversalOfMarkovChains 2.1
(`chainPath_map_reverseIndex_of_invariant`; the countable space with measurable singletons is
standard Borel, and an empty `S` is trivial) identifies the reversed path law with
`chainPath π (fun _ ↦ K†π) T`. It remains to show `K†π = uniformize q̂ r` with
`q̂ = reverseRate q π{·}`. Fix `x`; `(K ∘ₘ π) {x} = π {x} ≠ 0`, so TimeReversalOfMarkovChains 1.3
(`posterior_apply_singleton_eq_div`) gives `(K†π) x {y} = π {y} K y {x} / π {x}`. For `y ≠ x` this
is `π {y} q y x / (r π {x}) = q̂ x y / r`; for `y = x` it is `1 − outRate q x / r`, which is
`1 − outRate q̂ x / r` by the converse computation of 1.1 (balance, with `0 < π {x} < ⊤`). Both
measures agree on points, hence everywhere.

**Checks.**
- The cycle `0 → 1 → 2 → 0` with rates `1`, `r = 1`: the uniformized kernel is the rotation
  `i ↦ i + 1`, the uniform law is invariant, and the reversed path law is that of the rotation
  `i ↦ i − 1`, the uniformized kernel of the reversed rates.
- For the four-state chain of 1.1 and `r = 4`, `9/2`, `10`: the kernel is Markov, the stationary
  vector is invariant and the perturbed one is not, and every path of length `3` has the same
  stationary mass as its reversal under the uniformized reversed rates.
- `r ≥ outRate` is needed: for the same chain and `r = 2 < 4 = outRate q 2`, the diagonal weight
  at `2` is truncated to `0` and the masses exceed `1`.
- `π {i} ≠ ⊤` is needed: on two states with `q 0 1 = 1`, `q 1 0 = 0`, `r = 2` and
  `π {0} = π {1} = ⊤`,
  `π` is invariant (both masses stay `⊤`) but not balanced (`0` flows into `0`, `⊤` flows out).

*Needs:* 1.1 (`IsBalanced`, `reverseRate`, the converse computation);
TimeReversalOfMarkovChains 1.1 (definitions, copied), 1.3 (`posterior_apply_singleton_eq_div`),
2.1 (`chainPath_map_reverseIndex_of_invariant`); Mathlib `Kernel.ofFunOfCountable`,
`Kernel.Invariant`, `posterior`, `Measure.ext_of_singleton`, `Measure.bind_apply`,
`lintegral_countable'`. (Proved here.)

### 3.2 The discrete output theorem

Define `IsReversedOutput π K mark p` for a measure `π`, a kernel `K`, a mark `mark : S → S → C` and
`p : C → ℝ≥0∞`: for every class `c` and every state `x`,
`Σ_y [mark y x = c] π {y} K y {x} = p c · π {x}` — the stationary flow into `x` through steps of
class `c` is proportional to `π {x}`, with a constant that does not depend on `x`. This is the
uniformized form of Kelly's condition (3.10), p. 67, which together with (3.8) characterises
quasi-reversibility; it says that in the reversed chain the next step has class `c` with
probability `p c`, whatever the current state.

Prove `markovChainLaw_marks_eq`: for a Markov kernel `K`, an s-finite measure `π` and
`IsReversedOutput π K mark p`, for every `T`, every word `w : Fin T → C` and every `x`,
the mass under `markovChainLaw π K` of the paths `ω` with `mark (ω k) (ω (k + 1)) = w k` for all
`k < T` and `ω T = x` is `(∏_k p (w k)) · π {x}`. For a probability `π`, the classes of the first
`T` steps are independent,
each with law `p`, and independent of the state at time `T`. No reversibility of `K` is assumed.
(Kelly's argument for Theorem 3.6 (ii), p. 66, and Corollary 2.6, p. 52, in uniformized time.)

Route (proved here). The event is the union, over the paths `v : Fin (T + 1) → S` with
`v T = x` and classes `w`, of the events that the first `T + 1` states are `v`; by Tau Ceti
`markovChainLaw_map_prefix_apply_singleton` its mass is the sum over these `v` of
`π {v 0} ∏_{k < T} K (v k) {v (k + 1)}`. Let `f_t y` be this sum over paths of length `t` ending at
`y` with classes `w 0, …, w (t − 1)`. Then `f_0 y = π {y}`, and
`f_(t+1) z = Σ_y f_t y K y {z} [mark y z = w t]`. By induction `f_t y = (∏_{k < t} p (w k)) π {y}`:
the step is `f_(t+1) z = (∏_{k < t} p (w k)) Σ_y [mark y z = w t] π {y} K y {z}`, which is
`(∏_{k ≤ t} p (w k)) π {z}` by the condition at `(w t, z)`. (Equivalently: by
TimeReversalOfMarkovChains 2.1 and 1.3 the reversed stationary chain has kernel
`π {y} K y {x} / π {x}`, and the condition says that its steps have class law `p` from every
state.)

**Checks.**
- M/M/1 with `λ = 1`, `μ = 2`, uniformized at `r = 3`, stationary law `π {n} = 2^(−n−1)`,
  departures `mark y x = [y = x + 1]`: the condition holds with `p = (1/3, 2/3)` (departure, no
  departure) at every `x ≤ 11` (at `r = 5` it holds with `p = (1/5, 4/5)`), and for every word
  of length `3` and `x ≤ 8` the joint mass equals the product; for instance (departure, no
  departure, departure) with `x = 0` has mass `1/3 · 2/3 · 1/3 · 1/2 = 1/27`.
- M/M/2 with `λ = 3`, `μ = 2`, `r = 7`, stationary law `(1, 3/2, 9/8, …)/7`: the same holds with
  departure probability `3/7`, and the geometric law `2^(−n−1)` violates the condition.
- A finite waiting room breaks it. M/M/1/1 with `λ = μ = 1`, uniformized at `r = 2`, has the
  stationary law `(1/2, 1/2)` (QueueingModels 1.3), and every transition probability is `1/2`.
  The departure flow into `0` is `1/4 = (1/2) · π {0}`, the departure flow into `1` is `0`; no
  single `p` fits. Indeed `P(D₀ = 1) = 1/4` and `P(D₀ = D₁ = 1) = 0 ≠ 1/16`.

*Needs:* Tau Ceti `markovChainLaw`, `markovChainLaw_map_prefix_apply_singleton`. (Proved here.)

### 3.3 Exits from a Jackson network

Define the exit mark `exitMark y x` on `Fin J → ℕ`: `some j` if `y j > 0` and
`x = update y j (y j − 1)` (a customer leaves the network from `j`; the least such `j`, which is
unique, through `Fin.find`), and `none` otherwise. Define `exitProb α μ ν r` by
`exitProb (some j) = α j μ j / r` and `exitProb none = 1 − (Σ_k ν k) / r`.

Prove `isReversedOutput_jackson`: under the hypotheses of 2.1 (`φ j r ≠ 0` for `r ≥ 1`, the
traffic equations) and for every `r : ℝ≥0∞` with `outRate (jacksonRate lam μ ν φ) n ≤ r` for all
`n`, the reversed output condition holds for the law `jacksonLaw α φ`, the kernel
`uniformize (jacksonRate lam μ ν φ) r`, the mark `exitMark` and the probabilities
`exitProb α μ ν r`. With 3.2 and 3.4: exits from the stations form independent
streams, of rates `α j μ j`, independent of the current state (Kelly, Corollary 2.6, p. 52). Only
exits are covered: a flow between stations of a network with feedback is not of this form.

Route (proved here). If `jacksonLaw α φ` is the zero measure (some node weights have an infinite
sum) both sides vanish. Otherwise write `π n = w n / Z`. For `r = ⊤` every jump probability is
`0`, the kernel is the identity, `exitProb (some j) = 0`, `exitProb none = 1`, and the condition is
`π {x} = π {x}`. Let `r < ⊤`. *Class `some j`*: the only `y` with `exitMark y x = some j` is
`x + e_j` (and `x + e_j ≠ x`), so the flow is `π (x + e_j) μ j φ j (x j + 1) / r`, and
`π (x + e_j) φ j (x j + 1) = π x α j` (the identity of 2.1, divided by `Z`); this is
`α j μ j / r · π x`. *Class `none`*: by 2.1 (a) the weights are balanced, hence so are the point
masses of `jacksonLaw α φ` (a finite multiple, as `Z` is finite), and these masses are finite; by
3.1 `π` is invariant, `Σ_y π y K y {x} = π x`. Removing the exit classes, the flow of class
`none` into `x` is `π x − π x Σ_j α j μ j / r` (all terms finite, `ENNReal.mul_sub`), and
`Σ_j α j μ j = Σ_j ν j` (sum the traffic equations, 2.1), which is at most `outRate q 0 ≤ r`, so
the truncated subtraction in `exitProb none` is exact.

**Checks.**
- The loop `ν = (1, 0)`, `lam 0 1 = 2`, `lam 1 0 = 1`, `μ = (0, 2)`, single servers:
  `α = (3/4, 1/2)`,
  `r = 6` bounds the out-rates, and the condition holds at every `x ∈ {0, …, 5}²` with
  `exitProb (some 1) = 1/6`, `exitProb (some 0) = 0`, `exitProb none = 5/6`. Every word of length
  `3` of exits from station 1 has mass `∏ (1/6 or 5/6)`.
- Flows inside the network are not covered. In the same loop the moves from station 0 to station
  1 enter only states with `x 1 ≥ 1`, so their flow is not proportional to `π`; and the arrivals
  at station 0 (from outside or fed back from station 1) are not independent in uniformized time:
  `P(A₀) = 1/4` but `P(A₀, not A₁, A₂) = 7/144 ≠ 3/64 = (1/4)(3/4)(1/4)` (Kelly, p. 50 and p. 52).
- M/M/∞ (`φ j r = r`) has no finite `r` bounding the out-rates, so it is outside this statement.

*Needs:* 2.1 (`jacksonRate`, `jacksonWeight`, `jacksonLaw`, `isBalanced_jacksonWeight`);
3.1 (`uniformize`, `uniformize_markov_invariant_reverse`); 3.2 (`IsReversedOutput`); Mathlib
`Fin.find`, `ENNReal.mul_sub`. (Proved here.)

### 3.4 The output theorem in continuous time

Define `classCount mark ω a b c`, the number of `k ∈ [a, b)` with `mark (ω k) (ω (k + 1)) = c`.

Prove `prod_pi_poisson_classCount_eq`: let `C` be finite, `K` a Markov kernel, `π` a probability
measure, `p : C → ℝ≥0` with `IsReversedOutput π K mark p`, `r ≥ 0`, and `m` intervals of lengths
`s i ≥ 0`. Under the product of `markovChainLaw π K` and the independent Poisson tick counts
`M i` with means `r s i`, for all counts `d i c` and every `x`, the probability that interval `i`
contains exactly `d i c` steps of class `c` for all `i, c` and that the state at the end is `x`
equals `(∏_i ∏_c Po(p c · r s i) {d i c}) · π {x}`. So the counts of the classes in disjoint
intervals are independent Poisson variables with means `p c · r s i`, and independent of the final
state. For the exits of a Jackson network (3.3) and the single-server queue (`J = 1`, `φ = 1`,
`λ < μ`), in the Poisson-clock model of the Conventions, this is Burke's theorem at the level of
finite-dimensional laws: on every finite grid of intervals ending at time `t`, the departure
counts are independent Poisson variables with means `λ` times the lengths, independent of the
number in the queue at `t` (Kelly, Theorem 2.1, p. 34, states it for the departure process).
No statement about the departure process as a random point process is made.

Route (proved here). *The class law sums to one*: summing the condition over `c` and `x` gives
`Σ_c p c = Σ_y π {y} K y (S) = 1`. *Conditioning on the clock*: the counts `d` force
`M i = D i := Σ_c d i c`; the event is the product of the event `E_D` for the chain (block class
counts `d`, state `x` at time `D 0 + ⋯ + D (m − 1)`) and the point `{D}`, so by `Measure.prod_prod`
and
`Measure.pi_pi` its mass is `markovChainLaw π K (E_D) · ∏_i Po(r s i) {D i}`. *The chain*: `E_D` is
the disjoint union over the words `w` whose blocks have class counts `d`, so by 3.2 its mass is
`π {x} ∏_i F(D i, d i)`, where `F(n, e) = Σ_{u : Fin n → C, counts e} ∏_k p (u k)`. *Counting
words*: `F(0, e) = [e = 0]` and `F(n + 1, e) = Σ_c [e c ≥ 1] p c F(n, e − e_c)` (split off the last
letter), so by induction on `n`, `F(n, e) = [Σ e = n] n! / ∏_c (e c)! · ∏_c p c ^ (e c)`; the step
uses `Σ_c e c = n + 1` and `(e c)!/(e c − 1)! = e c`. *Poisson algebra*: with `a = r s i` and
`n = D i`, `e^(−a) aⁿ/n! · n!/∏_c (d i c)! · ∏_c p cᵈ = ∏_c e^(−p c a) (p c a)^(d i c)/(d i c)!`,
since `Σ_c p c = 1` gives `e^(−a) = ∏_c e^(−p c a)` (`Real.exp_sum`) and `aⁿ = ∏_c a^(d i c)`. The
Poisson masses are those of `poissonMeasure_singleton`.

**Checks.**
- M/M/1 with `λ = 1`, `μ = 2`, `r = 3`, classes (departure, no departure) with `p = (1/3, 2/3)`,
  two intervals of lengths `1/2` and `2/3`: for the counts `((0,0),(0,0))`, `((1,0),(0,1))`,
  `((1,1),(2,0))`, `((0,2),(1,1))`, `((2,1),(0,0))` and `x ≤ 3`, the rational factors of both sides
  agree, and the exponential factors agree because `p` sums to `1`.
- The Poisson counts are of all steps of the uniformized chain, self-loops included; only the
  class counts, not the tick counts, are observable in continuous time.

*Needs:* 3.2 (`IsReversedOutput`, `markovChainLaw_marks_eq`); Mathlib `poissonMeasure`,
`poissonMeasure_singleton`, `Measure.pi`, `Measure.pi_pi`, `Measure.prod_prod`, `Real.exp_sum`;
Tau Ceti `markovChainLaw`. (Proved here.)

### Examples

- Burke's theorem (Kelly, Theorem 2.1, p. 34): the single-server queue is the open network with
  `J = 1`, `ν 0 = λ`, `μ 0 = μ`, `φ = 1`, `α 0 = λ/μ`; for `λ < μ` its law is the geometric law
  `(1 − λ/μ)(λ/μ)ⁿ`, `r = λ + μ` bounds the out-rates, and 3.3 with 3.2 and 3.4 give independent
  Bernoulli departures with probability `λ/r` in uniformized time and Poisson departures of rate
  `λ` in continuous time, independent of the final queue length. With `φ r = min(r, s)` and
  `λ < sμ` the same holds for the M/M/s queue (Kelly, p. 35), with `r = λ + sμ`.
- For a reversible Jackson network (`α j lam j k = α k lam k j`, `α j μ j = ν j`, Kelly, (2.11),
  p. 51) and positive `α`, the reversed rates of 2.1 (`reverseRate_jacksonRate`) are the rates
  themselves, the uniformized kernel is reversible for the law (MarkovChainsAndRenewal 3.1,
  `isReversible_iff_singletons`), and 3.1
  says that the stationary uniformized chain has the same law read backwards, as
  TimeReversalOfMarkovChains 2.2 (`isReversible_iff_map_reverseIndex_eq`) predicts.

### Dependencies

Layers 1 and 2; TimeReversalOfMarkovChains 1.1 (definitions), 1.3, 2.1; Tau Ceti path laws;
QueueingModels 1.3 (Check of 3.2); MarkovChainsAndRenewal 3.1 (Example); Mathlib.

## Scope and ownership

Owned here: balance in `ℝ≥0∞` and Kelly's reversal lemma with its converse (1.1), the bridge to
Q-matrices (1.2), truncation and partial balance (1.3); the open-network rates, product weights
and law, Jackson's theorem with the reversed network (2.1); closed-network rates, generators,
weights and the Gordon–Newell theorem (2.2); the generating function of the normalising
constants, the closed arrival theorem and the mean value identities (2.3); the uniformized kernel
of a countable rate function with its invariance and reversal (3.1); the reversed output
condition and the discrete output theorem (3.2); the exits of Jackson networks (3.3); the output
theorem along a Poisson clock (3.4).

Stated by other roadmaps and used here: Q-matrices, irreducibility, uniqueness of stationary
vectors, uniformization of finite generators and Kolmogorov's criterion (ContinuousTimeMarkovChains,
Layers 1, 3, 4, 5); path laws up to a horizon and the reversal of stationary chains
(TimeReversalOfMarkovChains, Layers 1 and 2); finite birth–death queues, the M/M/1/K, Erlang and
machine-repair laws (QueueingModels, Layers 1–4: the one-station cases); singleton tests for
invariance and reversibility (MarkovChainsAndRenewal, Layer 3); path laws of discrete chains
(Tau Ceti).

What each layer is for: Layer 1 is the interface between rates and stationary laws on countable
spaces, for any roadmap that checks a guessed stationary law by balance or by reversal.
Layer 2 is the product-form theory of open and closed networks. Layer 3 turns rate statements into
statements about paths of the uniformized chain, for output theorems of queues and networks.

Not treated here: continuous-time Markov processes on countable spaces as path objects (the pins
have no such carrier; Layer 3 works with the uniformized chain along a grid), explosion and
regularity of rates, and the Poisson process as a random measure; quasi-reversibility as a
property of a process and Kelly's networks of quasi-reversible queues with customer classes
(Kelly, Section 3.2, pp. 65–70), of which 3.2 is the uniformized output half; customer routes,
waiting and sojourn times, and the independence of waiting times in tandem queues (Kelly,
Theorem 2.2, p. 38); the infinite-server queue with general service times; stability conditions
beyond the finiteness of the node sums; Kelly's symmetric queues and BCMP networks; the duality
between queues and random walks (Lindley's recursion, Adan–Resing, Section 7.5, (7.10), p. 68;
Loynes' theorem; the Pollaczek–Khinchine formula).

## Exact supplier contracts

### From Mathlib

- `ENNReal.tsum_mul_left`, `ENNReal.tsum_mul_right`, `tsum_prod` (stated for complete
  canonically ordered monoids such as `ℝ≥0∞`): constant factors and iterated sums in `ℝ≥0∞`, no
  hypotheses; `ENNReal.eq_div_iff` (the divisor is neither `0` nor `⊤`).
- `ENNReal.ofReal_mul` (first factor nonnegative), `ENNReal.ofReal_sum_of_nonneg` (nonnegative
  terms), `ENNReal.ofReal_eq_ofReal_iff` (both nonnegative).
- `ENNReal.add_right_inj` (the common summand is not `⊤`); `ENNReal.mul_sub` (the factor is finite
  when the difference is nontrivial).
- `Set.indicator`; `Matrix.vecMul` (`ᵥ*`).
- `ProbabilityTheory.Kernel.ofFunOfCountable` (countable source with measurable singletons),
  `ProbabilityTheory.Kernel.Invariant`, `ProbabilityTheory.IsMarkovKernel`,
  `ProbabilityTheory.posterior` (standard Borel, nonempty source; finite measure and kernel),
  `ProbabilityTheory.Kernel.partialTraj`, `ProbabilityTheory.Kernel.traj_map_frestrictLe`.
- `MeasureTheory.Measure.sum`, `MeasureTheory.Measure.dirac`,
  `MeasureTheory.Measure.sum_smul_dirac_singleton`, `MeasureTheory.Measure.ext_of_singleton`
  (countable type with measurable singletons), `MeasureTheory.Measure.bind_apply`,
  `MeasureTheory.lintegral_countable'`, `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.pi_pi` (σ-finite factors), `MeasureTheory.Measure.prod_prod` (s-finite).
- `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.poissonMeasure_singleton`;
  `Real.exp_sum`.
- `Finset.Nat.antidiagonalTuple`, `Finset.Nat.mem_antidiagonalTuple`,
  `Finset.mem_finsuppAntidiag`, `PowerSeries.mk`, `PowerSeries.coeff_prod`;
  `Relation.ReflTransGen`; `Fin.find`.

### From Tau Ceti

- `TauCeti.Probability.markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean`): the path
  law on `ℕ → S` of a Markov kernel from an initial measure.
- `TauCeti.Probability.markovChainLaw_map_prefix_apply_singleton` (same file): for an s-finite
  initial measure and measurable singletons, the mass of a finite path is the initial mass times
  the product of the transition masses.

### From TauCetiRoadmap.ContinuousTimeMarkovChains

- 1.1 `IsMetzler`, `IsQMatrix`, `LeadsTo`, `IsIrreducibleGenerator` (copied verbatim).
- 3.1 `hasSum_uniformized_pow` (Conventions: identification with `exp(tQ)` for finite `S`).
- 4.3 `existsUnique_stationary`: a Q-matrix that is an irreducible generator on a nonempty
  finite type has exactly one stationary probability vector (2.2).
- 5.2 `exists_detailedBalance_iff_cycle` (Examples of Layer 1).

### From TauCetiRoadmap.TimeReversalOfMarkovChains

- 1.1 `pathEval`, `reverseIndex`, `chainPath` (copied verbatim).
- 1.3 `posterior_apply_singleton_eq_div`: for a finite measure and kernel on standard Borel
  spaces and a point `x` of positive mass under `κ ∘ₘ μ`, the posterior at `x` gives `ω` the mass
  `μ {ω} κ ω {x} / (κ ∘ₘ μ) {x}` (3.1).
- 2.1 `chainPath_map_reverseIndex_of_invariant`: for a Markov kernel with a finite invariant
  measure on a standard Borel nonempty space, the stationary chain read backwards is the
  stationary chain of the posterior kernel (3.1).
- 2.2 `isReversible_iff_map_reverseIndex_eq` (Examples of Layer 3).

### From TauCetiRoadmap.QueueingModels

- 1.3 `stationary_iff_eq_birthDeathLaw` (Check of 3.2: the M/M/1/1 law), 2.1 `mm1nLaw` and 3.1
  `erlangLaw` (Checks of 1.3), 4.3 the machine-repair law (Example of Layer 2).

### From TauCetiRoadmap.MarkovChainsAndRenewal

- 3.1 `isReversible_iff_singletons` (Examples of Layer 3).

## References

- F. P. Kelly, *Reversibility and Stochastic Networks*, Wiley, 1979; chapters posted with the
  copyright holder's permission on the author's page,
  `http://www.statslab.cam.ac.uk/~frank/BOOKS/kelly_book.html`. Chapter 1: Exercise 1.6.2 and
  (1.24), p. 27; Theorem 1.12, pp. 28–29; Theorem 1.13, (1.27)–(1.28), pp. 30–31. Chapter 2:
  Theorem 2.1, p. 34, and the M/M/s remark, p. 35; Theorem 2.2, p. 38; (2.1), p. 40; (2.2) and
  Theorem 2.3, p. 41, proof and (2.5), p. 42; Exercises 2.3.1, 2.3.6 and 2.3.8, pp. 46–48; (2.8),
  p. 48; (2.9) and Theorem 2.4, p. 49, proof p. 50; (2.11) and Theorem 2.5, p. 51; Corollaries 2.6
  and 2.7, p. 52. Chapter 3: Section 3.2, pp. 65–70, Theorem 3.6 and (3.8), p. 66, (3.10), p. 67.
- I. Adan and J. Resing, *Queueing Systems*, lecture notes, Eindhoven University of Technology,
  `https://www.win.tue.nl/~iadan/queueing.pdf`: Section 7.5, Lindley's equation (7.10), p. 68.
- I. Davidovich, D. Ganguly, V. Singh and V. Chaudhary, *StochBench: A Domain-Specific Benchmark
  for Stochastic Processes in Lean*, arXiv:2609.09264: a benchmark of Lean 4 problem statements
  (proofs left open), among them a guess-and-verify form of Kelly's lemma for real rates, the
  product form, the reversed network and the output of open Jackson networks and the departures
  of a sampled M/M/1 queue, stated with real-valued data, routing probabilities and given laws. The statements and definitions of this roadmap are
  formulated independently of it.
