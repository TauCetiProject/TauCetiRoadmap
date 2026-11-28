# Roadmap: discrepancy of irrational rotations

**Summary.** Turn a circle of length `1` by an irrational amount `α`, starting from `0`, and mark
the points `{jα}` for `0 ≤ j < N`. Weyl's theorem says that the proportion of these points in an
interval `[0, t)` tends to `t`. This roadmap proves how fast. The worst error over all `t`, the
star discrepancy `D*_N`, is controlled by the continued fraction of `α`, and for `α` with bounded
partial quotients it is at most a constant times `log N / N`, with an explicit constant.

Write `α = [a₀; a₁, a₂, …]` and let `q₀ = 1, q₁ = a₁, q₂ = a₂ q₁ + q₀, …` be the denominators of
its convergents. Ostrowski's theorem says that every natural number `N` is, in exactly one way, a
sum `N = Σ b_k q_k` with digits `0 ≤ b₀ < a₁`, `0 ≤ b_k ≤ a_{k+1}` for `k ≥ 1`, and `b_{k−1} = 0`
whenever `b_k = a_{k+1}`. The three conditions together say that each partial sum
`b₀ q₀ + ⋯ + b_k q_k` is less than `q_{k+1}`. For `√2` the denominators are `1, 2, 5, 12, 29, …`
and `28 = 2·12 + 2·2`. For the golden ratio they are the Fibonacci numbers and the representation
is Zeckendorf's, a sum of Fibonacci numbers no two of which are consecutive: `100 = 89 + 8 + 3`.

At time `q_k` the orbit is as evenly spread as it can be. The Denjoy–Koksma inequality makes this
quantitative for any function `f` of period `1` and bounded variation: for every starting point
`x`, the sum of `f` over the `q_k` points `x, x + α, …, x + (q_k − 1)α` differs from `q_k ∫₀¹ f`
by at most the variation of `f` over a period. The bound does not grow with `k`. It holds more
generally at every fraction `p/q` in lowest terms with `|α − p/q| ≤ 1/q²`, and it fails if the
fraction is not in lowest terms.

The Ostrowski digits of `N` cut the first `N` points of the orbit into `b_k` blocks of length
`q_k`, for each `k`. A block of length `q_k` is a small displacement of `q_k` equally spaced
points, and its discrepancy, multiplied by `q_k`, is less than `1 + q_k/q_{k+1}`. Adding the
blocks gives `N D*_N < Σ (b_k + 1)`, the sum over the nonzero digits, and this is at most
`a₁ + ⋯ + a_{l+1}` when `q_l ≤ N`. So if the averages of the partial quotients are bounded, then
`N D*_N = O(log N)`. If every `a_k` with `k ≥ 1` is at most `K`, then
`N D*_N < G(K) log(N + 1)` for all `N ≥ 1`, where `G(K) = 2/log 2` for `K ≤ 3` and
`G(K) = (K + 1)/log(K + 1)` for `K ≥ 4`. For the golden ratio `K = 1`, and
`N D*_N < (2/log 2) log(N + 1)`: at `N = 100` the left side is `2.08` and the right side `13.32`.
By a theorem of Schmidt no sequence in `[0, 1)` does better than a constant times `log N / N`
infinitely often, so these rotations are low-discrepancy sequences.

The roadmap builds on Mathlib's continued fractions, functions of bounded variation and
Zeckendorf representations. From Tau Ceti it takes the convergent denominators and the notion of
a badly approximable number.
[ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md) defines the
star discrepancy and proves Koksma's inequality; with Layer 3 that inequality bounds the error of
integrating a function of bounded variation by averaging it along the orbit.
[Equidistribution](../Equidistribution/README.md) proves the properties of convergents used
here. No roadmap builds on this one.

## How to read the build

Layer 1 is arithmetic in `ℕ` and uses only the recurrence of the convergent denominators.
Layer 2 is one inequality and is independent of Layer 1. Layer 3 uses Layer 1 for the
decomposition into blocks; it does not use Layer 2, which treats a single block and all
functions of bounded variation, where 3.2 treats a single block and indicator functions with a
sharper constant. Each target is a bullet `name : statement`. A *Needs:* line names the targets
or supplier declarations a proof starts from. **Checks** are numerical instances, each computed
for this roadmap; a check marked *false variant* is a statement that the computation refutes.

## Conventions

- **Continued fractions.** The continued fraction of a real `ξ` is Mathlib's `GenContFract.of ξ`,
  and its `n`-th convergent is `ξ.convergent n : ℚ`. The convergent denominators are
  `Real.convDen ξ n = (ξ.convergent n).den`, so `q₀ = 1`. Indices of convergents start at `0`.
- **Partial quotients.** `partQuot ξ k : ℕ` is the partial quotient `a_{k+1}`, the natural number
  whose cast is `(GenContFract.of ξ).partDens.get? k`. The shift by one is Mathlib's: `partDens`
  lists `a₁, a₂, …`. The integer part `a₀ = ⌊ξ⌋` plays no role. In prose `a_k` always carries
  the classical index.
- **Digits.** A digit string is a finitely supported `b : ℕ →₀ ℕ`; `b k` multiplies `q_k`.
- **Points and samples.** Points of `[0, 1)` are `Int.fract (j * α)`. The first `N` points of the
  orbit are the sample `fun j : Fin N ↦ Int.fract (j * α)`, indexed from `j = 0` as in
  [Nie, p. 26].
- **Discrepancy.** `starDiscrepancy` is that of ProbabilisticAndMetricNumberTheory §2.7:
  `D*(x) = sup_{0 ≤ t ≤ 1} |#{j : x_j < t}/N − t|` for `x : Fin N → ℝ`, with strict cuts, and
  `D* = 0` for the empty sample. Niederreiter states his bounds for the extreme discrepancy
  `D_N`, the supremum over all intervals `[u, v) ⊆ [0, 1)`. Since `D*_N ≤ D_N`
  [Nie, Proposition 2.4, p. 15], each bound holds for `D*_N`, and that is the form stated here.
- **Variation.** The variation of `f` over a period is `eVariationOn f (Set.Icc 0 1)` for a
  function `f : ℝ → ℝ` with `Function.Periodic f 1`. It counts the jump between `f(1⁻)` and
  `f(1) = f(0)`: the sawtooth `x ↦ {x} − 1/2` has variation `2`.
- **Golden ratio.** `φ = Real.goldenRatio = (1 + √5)/2`.

## Layer 1: Ostrowski numeration

**Summary.** The convergent denominators of an irrational number are the place values of a
numeration system for `ℕ`. This layer defines its digit strings, proves that every natural
number has exactly one, and identifies the system for the golden ratio with Zeckendorf's.

### 1.1 Partial quotients as natural numbers

- `partQuot (ξ : ℝ) (k : ℕ) : ℕ` : `⌊((GenContFract.of ξ).partDens.get? k).getD 0⌋₊`, the partial
  quotient `a_{k+1}`; it is `0` once the continued fraction has terminated.
- `convDen_add_two_eq` : for irrational `ξ`,
  `convDen ξ (k + 2) = partQuot ξ (k + 1) * convDen ξ (k + 1) + convDen ξ k`. Also
  `convDen ξ 1 = partQuot ξ 0` and `1 ≤ partQuot ξ k`.

  *Needs:* `Real.convDen_one`, `Real.convDen_add_two`, `exists_nat_partDens_get?_eq`,
  `Irrational.not_of_terminatedAt`.

**Checks.**
- `ξ = √2`: `partQuot √2 k = 2` for all `k`, and `convDen` runs `1, 2, 5, 12, 29, 70`.
- `ξ = φ`: `partQuot φ k = 1`, and `q₀ = q₁ = 1`. This is the only way two convergent
  denominators coincide: `q₀ = q₁` exactly when `a₁ = 1`.

### 1.2 Digit strings

- `ostrowskiValue (ξ : ℝ) (b : ℕ →₀ ℕ) : ℕ` : the value `Σ_k b k * convDen ξ k`.
- `IsOstrowskiRep (ξ : ℝ) (b : ℕ →₀ ℕ) : Prop` : for every `k`,
  `Σ_{j ≤ k} b j * convDen ξ j < convDen ξ (k + 1)`.
- `isOstrowskiRep_iff` : for irrational `ξ`, `IsOstrowskiRep ξ b` holds exactly when
  `b 0 < partQuot ξ 0`, `b (k + 1) ≤ partQuot ξ (k + 1)` for all `k`, and
  `b (k + 1) = partQuot ξ (k + 1)` implies `b k = 0` [AS, Theorem 3.9.1, as quoted in
  [MS, §1, (i)–(iii) and (2)]].

  *Needs:* `convDen_add_two_eq`.

The definition takes the partial sums rather than the three digit conditions because it does
not mention partial quotients, and because it is the form the proofs of 1.3 and 3.3 use. When
`a₁ = 1` the first condition reads `b 0 < 1`, so the digit of `q₀` is `0` and the unit is `q₁`.

**Checks.**
- `ξ = √2`: `(b₀, b₁, b₂) = (1, 0, 2)` is a representation, of `1 + 2·5 = 11`.
- *False variant.* `ξ = √2`, `(b₀, b₁) = (1, 2)`, of value `5`: here `b₁ = a₂ = 2` and `b₀ ≠ 0`,
  and the partial sum `5` is not less than `q₂ = 5`. The representation of `5` is `b₂ = 1`.
- For nine values of `ξ` (among them `φ`, `√2`, `√3`, `e`) and all digit strings in the box
  `b_k ≤ a_{k+1} + 2` of length up to `10`, the two sides of `isOstrowskiRep_iff` agree.

### 1.3 Existence and uniqueness

- `existsUnique_isOstrowskiRep` : for irrational `ξ` and every `N : ℕ` there is exactly one
  `b : ℕ →₀ ℕ` with `IsOstrowskiRep ξ b` and `ostrowskiValue ξ b = N` [AS, Theorem 3.9.1, as
  quoted in [MS, §1]]; existence by the greedy algorithm is the first part of
  [Nie, Theorem 3.3, p. 26].
- `IsOstrowskiRep.support_subset_range_iff` : for irrational `ξ` and a representation `b`,
  `b.support ⊆ range k` exactly when `ostrowskiValue ξ b < convDen ξ k`. In particular the
  leading digit of `N ≥ 1` sits at the largest `l` with `q_l ≤ N`, the index `l(N)` of
  [Nie, Theorem 3.3].

  *Needs:* `Real.strictMono_convDen_succ` and `Real.tendsto_den_convergent` for the greedy step:
  divide `N` by the largest `q_l ≤ N`, and the remainder is less than `q_l`. Uniqueness: two
  representations of `N` have the same leading index by `support_subset_range_iff`, and the
  leading digit is `⌊N/q_l⌋` because the lower partial sum is less than `q_l`.

**Checks.**
- `ξ = √2`: `28 = 2·12 + 2·2`, digits `(0, 2, 0, 2)`; the digits `(0, 2)` and `(0, 2, 0, 2)` both
  use `b_k = a_{k+1}` with `b_{k−1} = 0`.
- For each of the nine values of `ξ`, the admissible strings supported below `k` are in
  bijection with `{0, …, q_k − 1}`; for `√2` and `k = 9` this is `2378` strings.
- *False variant.* Without the third digit condition uniqueness fails: for `√2`,
  `5 = 1·1 + 2·2 = 1·5`.

### 1.4 The golden ratio and Zeckendorf

- `IsOstrowskiRep.goldenRatio_apply` : if `IsOstrowskiRep φ b`, then
  `b k = if k + 1 ∈ Nat.zeckendorf (ostrowskiValue φ b) then 1 else 0`. The digit of
  `q_k = fib (k + 1)` is `1` exactly when `fib (k + 1)` occurs in the Zeckendorf representation
  [MS, §1].

  *Needs:* `TauCeti.den_convergent_goldenRatio` (`q_k = Nat.fib (k + 1)`), `isOstrowskiRep_iff`
  with `partQuot φ k = 1` (3.5), and the uniqueness in Mathlib's `Nat.zeckendorfEquiv`.

**Checks.**
- `100 = 89 + 8 + 3 = fib 11 + fib 6 + fib 4`: digits at `k = 10, 5, 3`, and
  `Nat.zeckendorf 100 = [11, 6, 4]`.
- *False variant.* `100 = 55 + 34 + 8 + 3` is not a representation: the digits at `k = 9` and
  `k = 8` are both `1 = a_{k+1}`.

### Dependencies

Mathlib: `GenContFract.of`, `Real.convergent`, `Nat.zeckendorf`, `Nat.zeckendorfEquiv`,
`Finsupp`. Tau Ceti: `Real.convDen` and its recurrence, `TauCeti.den_convergent_goldenRatio`.
No other roadmap.

## Layer 2: the Denjoy–Koksma inequality

**Summary.** Over `q` consecutive steps of a rotation by `α`, where `p/q` is a good rational
approximation of `α` in lowest terms, the sum of a function of bounded variation stays within
its variation of `q` times its mean.

### 2.1 The inequality

- `denjoyKoksma` : let `0 < q`, let `p : ℤ` be coprime to `q`, and let `|α − p/q| ≤ 1/q²`. Let
  `f : ℝ → ℝ` have period `1` and bounded variation on `[0, 1]`. Then for every `x : ℝ`,
  `|Σ_{j < q} f (x + j α) − q ∫₀¹ f| ≤ (eVariationOn f (Set.Icc 0 1)).toReal`
  [Huv, (4), citing Herman, p. 73]; [CP, (6), with proof, for `|α − p/q| < 1/q²`].

  The number `α` is any real. Proof [CP, Lemma 2.1 and (6)]: write `α = p/q + θ/q` with
  `|θ| ≤ 1/q`. Because `p` is coprime to `q`, the points `x + jp/q`, `j < q`, are one from each
  class of `x + ℤ/q` modulo `1`, and `x + jα` is displaced from `x + jp/q` by `jθ/q`, of
  absolute value at most `(q − 1)/q² < 1/q` and of constant sign. So the `q` arcs of length
  `1/q` between consecutive points of `x + ℤ/q` contain one orbit point each. On each arc `I`,
  `|f(y) − q ∫_I f| ≤ Var(f, I)` for `y ∈ I`, and the variations over the arcs add up to at most
  the variation over a period.

  *Needs:* `eVariationOn.Icc_add_Icc` and the bound of `|f y − f z|` by the variation on a set
  containing `y` and `z` (`eVariationOn.edist_le`); `Function.Periodic.intervalIntegral_add_eq`.

**Checks.**
- `α = φ`, `q = 13`, `f(x) = {x} − 1/2` (variation `2`, mean `0`): the supremum over `x` of
  `|Σ_{j<13} f(x + jφ)|` is `0.701`.
- `α = 3/4`, `p/q = 1/2`, where `|α − p/q| = 1/q²` exactly: the bound holds for the sawtooth and
  for indicators of arcs.
- For eleven values of `α` (nine irrational, and `3/4` and `7/10`) and all `109` pairs of `α`
  with a reduced fraction `p/q`, `q < 120`, `|α − p/q| ≤ 1/q²`, the bound holds for five test
  functions at `25` starting points.
- *False variant, lowest terms.* `α = 1/3 + 10⁻⁷`, `p/q = 3/9`, so `|α − p/q| < 1/81`, and `f`
  the tent of height `1` and half-width `0.01` at the integers (variation `2`, mean `0.01`). The
  nine points fall in three clusters of three, and at `x = 0` the sum is `2.9999`, which differs
  from `9 · 0.01` by `2.91 > 2`.
- *False variant, no approximation hypothesis.* `α = φ`, `q = 100`, `x = 0`, `f` the indicator
  of `[0.554175, 0.631190]` (variation `2`): the error is `2.30 > 2`.
- *False variant, half the variation.* `f` the indicator of `[0, 0.3)`, `α = φ`, `q = 13`: for
  suitable `x` five of the thirteen points fall in the interval, and the error is
  `5 − 3.9 = 1.1`, more than half the variation.

### 2.2 At the convergent denominators

- `denjoyKoksma_convDen` : for every real `α`, every `k`, and `f`, `x` as in 2.1,
  `|Σ_{j < q_k} f (x + j α) − q_k ∫₀¹ f| ≤ (eVariationOn f (Set.Icc 0 1)).toReal` with
  `q_k = convDen α k` [dF, Proposition 1, citing Herman, VI.3.1].

  *Needs:* `denjoyKoksma` with `p/q = α.convergent k`, which is in lowest terms as a rational
  number, and `Real.abs_sub_convergent_le`, which gives `|α − p_k/q_k| ≤ 1/(q_k q_{k+1}) ≤ 1/q_k²`
  with `Real.monotone_den_convergent`. No irrationality hypothesis is used.

**Checks.**
- For the nine values of `α` and every `q_k ≤ 1500`, the ratio of the error to the variation is
  at most `0.65` over the five test functions.
- Taking `f` the indicator of `[0, t)` gives `|#{j < q_k : {x + jα} < t} − q_k t| ≤ 2`. Target 3.2
  replaces `2` by `1 + q_k/q_{k+1}` for the star discrepancy.

### Dependencies

Mathlib: `eVariationOn`, `BoundedVariationOn`, `Function.Periodic`, interval integrals,
`Real.convergent`. Tau Ceti: `Real.abs_sub_convergent_le`, `Real.monotone_den_convergent`. No
other roadmap, and no other layer.

## Layer 3: the discrepancy of the orbit

**Summary.** The star discrepancy of the first `N` points of an irrational rotation is bounded
by the Ostrowski digits of `N`, hence by the partial quotients, hence by `log N` when the
partial quotients are bounded.

Throughout, `D*_N(α)` abbreviates
`starDiscrepancy (fun j : Fin N ↦ Int.fract (j * α))`.

### 3.1 Concatenation

- `add_mul_starDiscrepancy_append_le` : for samples `x : Fin M → ℝ` and `y : Fin N → ℝ`,
  `(M + N) * starDiscrepancy (Fin.append x y) ≤ M * starDiscrepancy x + N * starDiscrepancy y`.
  This is the triangle inequality for discrepancies used in [Nie, proof of Theorem 3.3, p. 27],
  where it is cited from Kuipers and Niederreiter, p. 115.

  *Needs:* the definition; the counts of `Fin.append x y` below `t` add.

**Checks.**
- `x = (0)`, `y = (1/2)`: `D*(x) = 1`, `D*(y) = 1/2`, and `D*(0, 1/2) = 1/2`, so `1 ≤ 3/2`.
- With either sample empty the two sides are equal.

### 3.2 One block

- `convDen_mul_starDiscrepancy_block_lt` : for irrational `α` and all `k`, `n`, the block
  `fun j : Fin (convDen α k) ↦ Int.fract ((n + j) * α)` satisfies
  `q_k * starDiscrepancy block < 1 + q_k/q_{k+1}` [Nie, proof of Theorem 3.3, p. 27, where the
  bound `D(P_i) < 1/q_i + 1/q_{i+1}` is derived for the extreme discrepancy].

  *Needs:* `Real.abs_convErr_lt_inv_convDen_succ` and `Real.isCoprime_convNum_convDen`. The
  points `{nα + jp_k/q_k}` are `q_k` equally spaced points, and the block is obtained by moving
  each of them, modulo `1` and in one direction, by less than `1/q_{k+1}`. For points that do
  not pass `1`, `starDiscrepancy_perturb` of ProbabilisticAndMetricNumberTheory §2.7 bounds the
  change of the discrepancy by the displacement; at most one point passes `1`, and the proof
  counts it directly.
- The same bound holds for the block at every `n`, and that uniformity is what 3.3 uses.

**Checks.**
- `α = φ`, `k = 5`, `n = 0` (`q₅ = 8`, `q₆ = 13`): `8 D*₈ = 1.390 < 1 + 8/13 = 1.615`.
- `α = √2`, `k = 3`, `n = 0` (`q₃ = 12`, `q₄ = 29`): `12 D*₁₂ = 1.324 < 1 + 12/29 = 1.414`.
- For the nine values of `α`, every `q_k ≤ 1500` and `n = 0, 1, 2, 7, 100, 12345`, the bound
  holds, also for the extreme discrepancy; the ratio to the bound reaches `0.998`.
- *False variant.* The bound `1` of equally spaced points fails: `8 D*₈(φ) = 1.390 > 1`.

### 3.3 The digit bound

- `natCast_mul_starDiscrepancy_fract_lt` : for irrational `α`, `N ≥ 1`, and the Ostrowski
  representation `b` of `N` for `α`,
  `N D*_N(α) < Σ_{k ∈ b.support} (b k + 1)` [Nie, Theorem 3.3, p. 26].

  *Needs:* 3.1 and 3.2. The first `N` points split into `b k` blocks of length `q_k` for each
  `k`, so `N D*_N < Σ_k b_k (1 + q_k/q_{k+1})`, and `b_k q_k < q_{k+1}` by `IsOstrowskiRep`
  gives `b_k (1 + q_k/q_{k+1}) < b_k + 1`.
- `IsOstrowskiRep.sum_support_le_sum_partQuot` : for irrational `ξ`, a representation `b` and
  `n` with `b.support ⊆ range (n + 1)`,
  `Σ_{k ∈ b.support} (b k + 1) ≤ Σ_{k ≤ n} partQuot ξ k = a₁ + ⋯ + a_{n+1}`
  [Nie, Theorem 3.3, p. 26, second bound].

  *Needs:* `isOstrowskiRep_iff`. A digit `b_k < a_{k+1}` contributes at most `a_{k+1}`; a digit
  `b_k = a_{k+1}` contributes `a_{k+1} + 1`, and then `b_{k−1} = 0` leaves `a_k ≥ 1` unused.

**Checks.**
- `α = φ`, `N = 100 = 89 + 8 + 3`: `100 D*₁₀₀ = 2.078`, the digit bound is `6`, and the quotient
  bound with `n = 10` is `11`. The extreme discrepancy gives `100 D₁₀₀ = 2.692`, also below `6`.
- `α = √2`, `N = 28`, digits `(0, 2, 0, 2)`: `28 D*₂₈ = 1.422`, the digit bound is `6`, and
  the quotient bound with `n = 3` is `8`.
- For the nine values of `α` and `477` values of `N ≤ 3000`, `N D_N` is at most `0.79` times
  the digit bound.
- *False variant.* The bound `Σ b_k` in place of `Σ (b_k + 1)` fails for `√2` at `N = 1`: the
  digit sum is `1` and `1 · D*₁ = 1`.

### 3.4 Bounded partial quotients

- `exists_natCast_mul_starDiscrepancy_fract_le_log` : for irrational `α`, if there is `C` with
  `Σ_{k < m} partQuot α k ≤ C m` for all `m`, then there is `C'` with
  `N D*_N(α) ≤ C' log N` for all `N ≥ 2` [Nie, Corollary 3.4, p. 27].

  *Needs:* 3.3 and `Real.fib_succ_le_den_convergent`, which bounds the leading index of `N` by
  a multiple of `log N`.
- `boundedQuotientConst (K : ℕ) : ℝ` : `G(K)`, equal to `2/log 2` for `K ≤ 3` and to
  `(K + 1)/log(K + 1)` for `K ≥ 4`.
- `natCast_mul_starDiscrepancy_fract_lt_of_partQuot_le` : for irrational `α` and `K` with
  `partQuot α k ≤ K` for all `k`, and every `N ≥ 1`,
  `N D*_N(α) < boundedQuotientConst K * log (N + 1)` [Nie, Corollary 3.5, p. 27].

  *Needs:* 3.3. With `s(N) = Σ_{b_k ≠ 0} (b_k + 1)`, induction on the leading index: if
  `N = b q_l + r` with `r < q_l`, then `s(N) = b + 1 + s(r)`, `N + 1 ≥ (b + 1)(r + 1)`, and
  `m + 1 ≤ G(K) log(m + 1)` for `1 ≤ m ≤ K` [Nie, (3.2) and (3.3), p. 28].
- `TauCeti.BadlyApproximable.exists_natCast_mul_starDiscrepancy_fract_le_log` : if `α` is badly
  approximable, there is `C` with `N D*_N(α) ≤ C log N` for all `N ≥ 2`.

  *Needs:* the previous target and `bounded_partial_denominators_iff_badlyApproximable` of
  ProbabilisticAndMetricNumberTheory §4.10, applied to `Int.fract α`, which has the same
  partial quotients `a_k`, `k ≥ 1`, and the same orbit.

**Checks.**
- `m + 1 ≤ G(K) log(m + 1)` for `1 ≤ m ≤ K`: at `K = 1`, `2 ≤ (2/log 2) log 2 = 2`; at `K = 3`,
  `m = 2`, `3 ≤ 3.17`; at `K = 4`, `m = 4`, `5 ≤ 5`. The inequality of the target is strict
  because 3.3 is.
- `α = √2` (`K = 2`), `[0; 4, 4, …] = √5 − 2` (`K = 4`), `[0; 5, 5, …]` (`K = 5`): over `477`
  values of `N ≤ 3000`, `N D_N/log(N + 1)` is at most `1.47`, against `G = 2.885`, `3.107`,
  `3.349`.
- *False variant.* The hypothesis on the partial quotients cannot be dropped. For
  `α = 1/3 + 10⁻⁹`, whose continued fraction starts `[0; 2, 1, 111111110, …]`, and `N = 2997`,
  `N D_N = 999.0`, against `(2/log 2) log 2998 = 23.1`.

### 3.5 The golden rotation

- `partQuot_goldenRatio` : `partQuot φ k = 1` for all `k`.

  *Needs:* `TauCeti.partDens_of_goldenRatio`.
- `natCast_mul_starDiscrepancy_fract_goldenRatio_lt` : for every `N ≥ 1`,
  `N D*_N(φ) < (2/log 2) log (N + 1)` [Nie, Corollary 3.5, p. 27, with `K = 1`].

**Checks.**
- `N = 1, 2, 5, 8, 13, 100, 1000`: `N D*_N(φ) = 1, 1, 1, 1.390, 1, 2.078, 1.348`, against
  `(2/log 2) log(N + 1) = 2, 3.17, 5.17, 6.34, 7.61, 13.32, 19.93`.
- *False variant.* `N D_N(φ)` is not bounded by `2`: `25 D₂₅ = 2.295` and `100 D₁₀₀ = 2.692`.
  For the star discrepancy, `100 D*₁₀₀ = 2.078 > 2`.

### Dependencies

Layer 1. Mathlib: `Fin.append`, `Real.log`. Tau Ceti: convergent errors,
`TauCeti.BadlyApproximable`, the continued fraction of the golden ratio.
ProbabilisticAndMetricNumberTheory: `starDiscrepancy`, `starDiscrepancy_perturb`,
`bounded_partial_denominators_iff_badlyApproximable`.

## Downstream consumers

No roadmap consumes this one. Composing 3.4 with `koksma` of
ProbabilisticAndMetricNumberTheory §2.7 bounds the error of the rule
`(1/N) Σ_{j<N} f({jα})` for `∫₀¹ f` by `Var(f) G(K) log(N + 1)/N`; this is one application of
`koksma` and carries no Lean name here.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Lower bounds.** Schmidt proved that there is an absolute constant `c > 0` such that every
  sequence in `[0, 1)` has `N D_N > c log N` for infinitely many `N` [Nie, p. 24, citing Schmidt,
  Acta Arith. 21 (1972)]. With it the rotations of 3.4 have the least possible order of
  discrepancy. The proof is not a continued-fraction argument and is not a target here.
- **The converse of 3.4.** Niederreiter's notes attribute to Schoißengeier the statement that
  `N D_N(α) = O(log N)` only if the averages of the partial quotients are bounded
  [Nie, notes to Chapter 3, p. 44, citing Schoißengeier, Acta Arith. 44 (1984)].
- **Exact formulas.** The exact value of `limsup N D*_N(α)/log N` for quadratic irrationals, and
  the Ostrowski expansion of real numbers, which describes the sets of bounded remainder.

## Scope and ownership

This roadmap owns `partQuot`, the Ostrowski numeration (`ostrowskiValue`, `IsOstrowskiRep` and
their theorems), the Denjoy–Koksma inequality, the concatenation inequality 3.1, and the
discrepancy bounds of Layer 3 for the sequence `{jα}`.

It does not own, and does not restate:

- the star discrepancy, its bounds, permutation and perturbation lemmas, the Erdős–Turán
  inequality and Koksma's inequality, which are ProbabilisticAndMetricNumberTheory §2.7. Target
  3.1 is a statement about that definition which §2.7 does not list; an implementation places it
  beside `starDiscrepancy`;
- the equivalence of bounded partial quotients and bad approximability, which is
  ProbabilisticAndMetricNumberTheory §4.10, and `BadlyApproximable` itself, which is
  DiophantineApproximationAndTranscendence §0.6 and is in Tau Ceti;
- convergents, their errors, best approximations, the continued fraction of the golden ratio and
  the three-gap theorem, which are Equidistribution Layers 3 and 4 and are in Tau Ceti;
- the discrepancy of a tuple of points of the circle, which is
  DiophantineApproximationAndTranscendencePartII Layer 3;
- the multidimensional star discrepancy, the Koksma–Hlawka inequality, and the van der Corput,
  Halton and Hammersley point sets, which the open roadmap
  QuasiMonteCarloSparseGridsAndTractability treats;
- mechanical and Sturmian words, which the open roadmap SturmianWordsAndThreeDistances treats.
  Its balance property is a statement about the same orbit, but it is not a discrepancy bound
  and no target here is stated there.

The discrepancy of set systems in the open roadmap CombinatorialDiscrepancy and the sampling
discrepancy of FiniteSamplingDiscrepancy are different notions.

## Exact supplier contracts

### From Mathlib

- `Mathlib/NumberTheory/DiophantineApproximation/Basic.lean`: `Real.convergent`.
- `Mathlib/Algebra/ContinuedFractions/Computation/Basic.lean`: `GenContFract.of`.
  `Mathlib/Algebra/ContinuedFractions/Basic.lean`: `GenContFract.partDens`,
  `GenContFract.TerminatedAt`.
- `Mathlib/Data/Nat/Fib/Zeckendorf.lean`: `Nat.zeckendorf`, `List.IsZeckendorfRep`,
  `Nat.isZeckendorfRep_zeckendorf`, `Nat.zeckendorfEquiv`.
- `Mathlib/Topology/EMetricSpace/BoundedVariation.lean`: `eVariationOn`, `BoundedVariationOn`,
  `eVariationOn.edist_le`, `eVariationOn.Icc_add_Icc`.
- `Mathlib/Algebra/Order/Floor/Defs.lean`: `Int.fract`.
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean`:
  `Function.Periodic.intervalIntegral_add_eq`. Also `Function.Periodic`, `Fin.append`,
  `Real.goldenRatio`, `Nat.fib`.

Mathlib has no Ostrowski numeration, no Denjoy–Koksma inequality and no discrepancy; its
`Mathlib/NumberTheory/Ostrowski.lean` is Ostrowski's theorem on absolute values of `ℚ`.

### From Tau Ceti

In `TauCeti/NumberTheory/DiophantineApproximation/ContinuedFractions.lean`, which is in Tau Ceti
at the roadmap's pin:

- `Real.den_convergent`, `Real.abs_sub_convergent_le` (`|ξ − ξ.convergent n| ≤ 1/(q_n q_{n+1})`,
  for every real `ξ`), `Real.monotone_den_convergent`, `Real.fib_succ_le_den_convergent`,
  `Real.tendsto_den_convergent`, `Irrational.not_of_terminatedAt`.

In `TauCeti/NumberTheory/DiophantineApproximation/BadlyApproximable.lean`, at the pin:
`TauCeti.BadlyApproximable`.

In `TauCeti/NumberTheory/DiophantineApproximation/ContinuedFractions/`, which is in Tau Ceti's
main branch and not yet at the roadmap's pin:

- `Convergents.lean`: `Real.convDen`, `Real.convNum`, `Real.convErr`, `Real.convDen_zero`,
  `Real.convDen_one`, `Real.convDen_add_two`, `Real.strictMono_convDen_succ`,
  `Real.isCoprime_convNum_convDen`, `Real.abs_convErr_lt_inv_convDen_succ`,
  `exists_nat_partDens_get?_eq`.
- `GoldenRatio.lean`: `TauCeti.partDens_of_goldenRatio`, `TauCeti.den_convergent_goldenRatio`.

`Suggested.lean` therefore carries a copy of `Real.convDen` under the name `convDen`.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §2.7: `starDiscrepancy` (definition above), `starDiscrepancy_bounds`, `starDiscrepancy_perm`,
  `starDiscrepancy_perturb`, `koksma`.
- §4.10: `bounded_partial_denominators_iff_badlyApproximable`.

These are roadmap targets, not yet in Tau Ceti; `Suggested.lean` carries a copy of
`starDiscrepancy`.

### From TauCetiRoadmap.Equidistribution

Layer 3 (convergent data and errors, the golden ratio), through its Tau Ceti implementation
listed above.

## References

- [AS] J.-P. Allouche and J. Shallit, *Automatic Sequences: Theory, Applications,
  Generalizations*, Cambridge University Press, 2003. Theorem 3.9.1 (Ostrowski numeration),
  cited here as quoted in [MS].
- [CP] J.-P. Conze and A. Piękniewska, *On multiple ergodicity of affine cocycles over irrational
  rotations*, arXiv:1209.3798. Lemma 2.1 and (6): the Denjoy–Koksma inequality with proof.
- [dF] A. de Faveri, *Möbius disjointness for `C^{1+ε}` skew products*, arXiv:2002.01076.
  Proposition 1: the Denjoy–Koksma inequality at convergent denominators.
- [Huv] F. Huveneers, *Subdiffusive behavior generated by irrational rotations*,
  arXiv:0712.2731. Inequality (4): Denjoy–Koksma for `|α − p/q| ≤ 1/q²`.
- M. R. Herman, *Sur la conjugaison différentiable des difféomorphismes du cercle à des
  rotations*, Publ. Math. IHÉS 49 (1979), 5–233. The original reference for the Denjoy–Koksma
  inequality (p. 73, VI.3.1), cited here through [Huv] and [dF].
- [MS] M. Mittal and D. Sharma, *On the representation of an integer in Ostrowski and recurrence
  numeration systems*, arXiv:2409.06232. Section 1 states Ostrowski's theorem with the digit
  conditions (i)–(iii) and the equivalent partial-sum condition (2).
- [Nie] H. Niederreiter, *Random Number Generation and Quasi-Monte Carlo Methods*, CBMS-NSF
  Regional Conference Series in Applied Mathematics 63, SIAM, 1992. Proposition 2.4 (p. 15),
  the remark on Schmidt's theorem (p. 24), Theorem 3.3 (p. 26), Corollaries 3.4 and 3.5 (p. 27).
- A. Ostrowski, *Bemerkungen zur Theorie der Diophantischen Approximationen*, Abh. Math. Sem.
  Univ. Hamburg 1 (1922), 77–98. The original numeration and discrepancy estimates.
- W. M. Schmidt, *Irregularities of distribution. VII*, Acta Arith. 21 (1972), 45–50.
