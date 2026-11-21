# Roadmap: sturmian words and three distances

**Summary.** This roadmap studies mechanical words, above all those of irrational slope: the
infinite words obtained by discretising a straight line of slope `α` and intercept `ρ`, the lower
one with `n`-th letter `⌊(n + 1)α + ρ⌋ − ⌊nα + ρ⌋` and the upper one defined with ceilings. For
`0 < α < 1` they are the codings of the orbit of the rotation by `α` of the circle with respect to
a partition into two arcs of lengths `1 − α` and `α`; for irrational such `α`, the Sturmian words.
Words take values in the integers; the slope is any irrational number in the complexity theorem and
any real number in the frequency theorem, while in the characterisation by balance the letters are
`0` and `1` and `0 < α < 1`. Every target is a theorem about infinite words and points of the
circle.

The headline theorems are these.

- *Complexity `n + 1`.* A lower or upper mechanical word of irrational slope has exactly `n + 1`
  distinct factors (blocks of consecutive letters) of length `n`, for every `n ≥ 0` and every
  intercept.
- *Factors and frequencies.* For every real slope `α`, the factors of length `n` of a lower or
  upper mechanical word of slope `α` do not depend on the intercept, nor on the choice of floors or
  ceilings: they are the first `n` letters of the lower mechanical words of slope `α` whose
  intercept is one of the points `{−kα}`, `0 ≤ k ≤ n`, of the circle (`n + 1` distinct points when
  `α` is irrational). Each factor occurs with a frequency, and the frequency of the factor
  attached to a point is the length of the arc from that point to the next one. By the
  three-distance theorem the frequencies of the factors of length `n` therefore take at most three
  values, and when there are three, one is the sum of the other two.
- *Balanced words.* A word over `{0, 1}` is balanced (any two factors of the same length contain
  numbers of letters `1` differing by at most one) and not eventually periodic if and only if it is
  the lower or the upper mechanical word of some irrational slope `0 < α < 1` and some intercept.

The roadmap is a bridge between two roadmaps. Equidistribution supplies the points `{kα}`, the
multiset of the arcs they cut on the circle, and the three-distance theorem for these arcs; the
frequency theorem here is stated with exactly those objects, so that the three-distance theorem
becomes a statement about factor frequencies. SubspaceTheorem supplies the complexity function of
an infinite word, which it uses for the digits of algebraic numbers; here it is computed for
mechanical words. ProbabilisticAndMetricNumberTheory supplies uniform distribution modulo one in
the form of interval frequencies, which turns arc lengths into frequencies for irrational slopes.

## How to read the build

Layer 1 below defines the lower and upper mechanical words and recalls the complexity function.
Layer 2 proves that the complexity is `n + 1`; its route contains the step-function description of
the first `n` letters as a function of the intercept, which Layer 3 extends to every slope. Layer 3
identifies the factors and their frequencies with the points `{−kα}` and the arcs between them.
Layer 4 defines balanced words and proves that the balanced binary words that are not eventually
periodic are exactly the mechanical words of irrational slope in `(0, 1)`; it uses Layer 1 only.
Layers 2 and 3 use uniform distribution modulo one from ProbabilisticAndMetricNumberTheory for
irrational slopes, and Layer 3 treats rational slopes by periodicity; Layer 3 states its result
with Equidistribution's point set and gaps.

## Conventions

- **Infinite words.** An infinite word is a function `u : ℕ → ℤ`; positions are numbered from `0`.
  The letters of a mechanical word of slope `α` are `⌊α⌋` and `⌊α⌋ + 1`, so for `0 < α < 1` they are
  `0` and `1`. Integer letters let one definition serve every slope and let the sum of a factor be
  its number of letters `1` for a binary word.
  - Check: for `α = 1/2` and `ρ = 0` the lower mechanical word is `0101…`; for `α = 3/2` and
    `ρ = 0` it is `1212…`, its letters being `⌊α⌋ = 1` and `2`.
- **Finite words and factors.** A finite word is a `List`. The factor of length `n` of `u` at
  position `i` is the list `[u i, …, u (i + n − 1)]`, written
  `(List.range n).map fun k => u (i + k)` as in the body of `complexity`; the factor of length `0`
  is the empty list. A word `w` occurs at `i` when the factor of length `|w|` at `i` is `w`.
- **Points of the circle.** Points of the circle are fractional parts in `[0, 1)`, `Int.fract`, and
  `{x}` denotes `Int.fract x`. The `n + 1` points `{−kα}`, `0 ≤ k ≤ n`, are Equidistribution's
  `orbitFract (-α) (n + 1)`; for irrational `α` they are distinct. Since `{−kα} = 1 − {kα}` for
  `k ≥ 1`, they are the points `{k(1 − α)}` of Alessandri–Berthé §2.1.
- **Frequencies.** The frequency of `w` in `u` is the limit of the number of occurrences at the
  positions `0, …, N` divided by `N + 1`, the normalisation of ProbabilisticAndMetricNumberTheory
  §2.5. Every frequency theorem below asserts that the limit exists.
- **Eventually periodic.** `u` is eventually periodic when there are `N` and `p > 0` with
  `u (n + p) = u n` for all `n ≥ N`, the form in which SubspaceTheorem 7.2 writes the hypothesis.

## Layer 1: mechanical words

### 1.1 Lower and upper mechanical words

Define `lowerMechanical α ρ n = ⌊(n + 1)α + ρ⌋ − ⌊nα + ρ⌋` and
`upperMechanical α ρ n = ⌈(n + 1)α + ρ⌉ − ⌈nα + ρ⌉`, for real `α`, `ρ` (Lothaire's lower and upper
mechanical words, as Alessandri–Berthé §2.1 recall them through rotations).

- *Letters.* Both take only the values `⌊α⌋` and `⌊α⌋ + 1`, because `⌊x + α⌋ − ⌊x⌋` and
  `⌈x + α⌉ − ⌈x⌉` lie in `{⌊α⌋, ⌊α⌋ + 1}` for every real `x`.
- *Sums of factors.* The sum of the factor of length `n` at `i` telescopes to
  `⌊(i + n)α + ρ⌋ − ⌊iα + ρ⌋`, and with ceilings for the upper word.
- *Shift and intercept.* `lowerMechanical α ρ (i + k) = lowerMechanical α (ρ + iα) k`, and the
  word does not change when an integer is added to `ρ` (`Int.floor_add_intCast`); the same holds
  for the upper word (`Int.ceil_add_intCast`). So the factor of the lower word at `i` is the
  prefix of the lower word with intercept `{iα + ρ}`.
- *Upper through lower.* `upperMechanical α ρ = −lowerMechanical (−α) (−ρ)`, by `Int.ceil_neg`.
- *Where they differ.* `⌈x⌉ − ⌊x⌋` is `0` for integer `x` and `1` otherwise, so the two words
  differ exactly at the positions `n` for which one of `nα + ρ`, `(n + 1)α + ρ` is an integer. For
  irrational `α` at most one `m` has `mα + ρ` an integer, so they differ at most at `m − 1` and
  `m`.
- *Rotation coding.* For `0 < α < 1`, `lowerMechanical α ρ n = 1` exactly when
  `{nα + ρ} ∈ [1 − α, 1)`: the lower word is the coding of the orbit of `{ρ}` under the rotation by
  `α` for the partition `[0, 1 − α)`, `[1 − α, 1)`, and the upper word is the coding for
  `(0, 1 − α]`, `(1 − α, 1]` (Alessandri–Berthé §2.1, p. 6).

**Checks.**

- `α = (3 − √5)/2 = 2 − φ` and `ρ = α`: the lower word is the Fibonacci word
  `0100101001001010010100100101…`; exchanging the letters `0` and `1` gives the Fibonacci
  sequence of Alessandri–Berthé §2.1 (p. 6), their coding of the orbit of `τ − 1 = 1 − α` under
  the rotation by `τ − 1`.
- `α = √2 − 1`, `ρ = 0`: the lower word begins `0`, since `⌊α⌋ − ⌊0⌋ = 0`, and the upper word
  begins `1`, since `⌈α⌉ − ⌈0⌉ = 1`; from position `1` on they agree, as `nα` is an integer only for
  `n = 0`. With `ρ = 3 − 5α` they differ exactly at positions `4` and `5`.
- `α = 1/2`, `ρ = 0`: the upper word is `1010…` and the lower word `0101…`; here `nα + ρ` is an
  integer for every even `n`, and the two words differ everywhere, which the irrationality in the
  last bullet but one excludes.

### 1.2 Complexity

The complexity `complexity u n` is the number of distinct factors of length `n` of `u`, counted by
`Set.ncard`; it is copied verbatim from SubspaceTheorem 7.3. For a word with finitely many letters
the set of factors of each length is finite, so the count is the number of factors; `Set.ncard`
of an infinite set is `0`.

**Checks.**

- For every word `complexity u 0 = 1`: the only factor of length `0` is the empty list.
- `α = 1/2`: the lower word `0101…` has the two factors `01`, `10` of length `2`, so complexity
  `2`, not `3`; irrationality is needed in 2.1.
- The Fibonacci word has the four factors `001`, `010`, `100`, `101` of length `3`.

### Examples

- The Fibonacci word of 1.1 is the coding of the golden rotation; its factors of length `1, 2, 3`
  are `0, 1`; `00, 01, 10`; `001, 010, 100, 101`.

### Dependencies

Mathlib `Int.floor`, `Int.ceil`, `Int.fract`, `Set.ncard`; SubspaceTheorem 7.3 for `complexity`.

## Layer 2: factor complexity

### 2.1 Mechanical words of irrational slope have complexity `n + 1`

Prove `complexity_eq_add_one`: if `α` is irrational and `u` is `lowerMechanical α ρ` or
`upperMechanical α ρ`, then `complexity u n = n + 1` for every `n`. Alessandri–Berthé state this
for Sturmian codings, `0 < α < 1`, in §2.1, p. 7, after Lemma 1, by the interval description of the
factors; the statement here holds for every irrational slope, by the route below, which uses no
bound on `α`.

Route. *The step lemma.* For `t ∈ [0, 1)` let `wₜ` be the first `n` letters of
`lowerMechanical α t`. With `Hₖ(t) = ⌊kα + t⌋ − ⌊kα⌋`, the sum of the first `k` letters of `wₜ` is
`⌊kα⌋ + Hₖ(t)` (since `⌊t⌋ = 0`), so `wₜ` determines and is determined by `(H₁(t), …, Hₙ(t))`. For
`k ≥ 1`, `kα` is not an integer, so `Hₖ` is `0` on `[0, cₖ)` and `1` on `[cₖ, 1)` with
`cₖ = 1 − {kα} = {−kα}` (`Int.fract_neg`). The points `c₀ = 0, c₁, …, cₙ` are distinct because `α`
is irrational; sort them as `0 = t₀ < t₁ < ⋯ < tₙ` and put `tₙ₊₁ = 1`. On `[tⱼ, tⱼ₊₁)` every
`Hₖ` is constant and `H₁ + ⋯ + Hₙ = j`, so `wₜ = w_(tⱼ)` there and the `n + 1` words `w_(tⱼ)` are
distinct. *Lower words.* By 1.1 the factor of `lowerMechanical α ρ` at `i` is `w_({iα + ρ})`,
so every factor is one of the `w_(tⱼ)`. Conversely, uniform distribution modulo one of `iα + ρ`
makes the proportion of `i ≤ N` with `{iα + ρ} ∈ [tⱼ, tⱼ₊₁)` tend to `tⱼ₊₁ − tⱼ > 0`, so some `i`
has it, and `w_(tⱼ)` is a factor. Uniform distribution holds because
ProbabilisticAndMetricNumberTheory §2.5, `uniformDistribution_mod_one_tfae`, turns the Weyl sums
into interval frequencies, and for every integer `k ≠ 0` the Weyl sum
`(N + 1)⁻¹ ∑_(i ≤ N) e(k(iα + ρ))` is `e(kρ)` times a geometric sum with ratio `e(kα) ≠ 1`, of
modulus at most `2 / ((N + 1) |1 − e(kα)|)`. *Upper words.* `upperMechanical α ρ` is
`−lowerMechanical (−α) (−ρ)` (1.1), `−α` is irrational, and negating every letter is injective on
factors, so the count is the same.

**Checks.**

- `n = 0`: one factor, the empty list, and `0 + 1 = 1`.
- `α = 2 − φ`, `ρ = α`, `n = 3`: the cut points are `0`, `√5 − 2`, `(√5 − 1)/2`, `(3√5 − 5)/2`,
  and on the four intervals the words `wₜ` are `001`, `010`, `100`, `101`, the four factors of
  1.2.
- `α = 3/2 + √2` (letters `2` and `3`): the step lemma uses no bound on `α`, and the factors of
  length `2` of the lower word with `ρ = 0` are the three words `23`, `32`, `33`.

*Needs:* 1.1, 1.2; ProbabilisticAndMetricNumberTheory §2.5 `uniformDistribution_mod_one_tfae`;
Mathlib `Int.fract_neg`, `Int.floor_add_intCast`, `Int.ceil_neg`, `fourier_coe_apply`.

### Examples

- For `α = √2 − 1` and every `ρ`, the lower word has `n + 1` factors of length `n`; at `n = 1`
  these are `0` and `1`, at `n = 2` the words `00`, `01`, `10`: the letter `1` marks the points
  `{iα + ρ}` in `[1 − α, 1)`, and since `α < 1/2` the next point `{iα + ρ} + α − 1` then lies in
  `[0, α)`, outside that arc, so `11` does not occur.

### Dependencies

Layer 1; ProbabilisticAndMetricNumberTheory §2.5.

## Layer 3: factors, frequencies and the three distances

### 3.1 Points, gaps and frequencies

`orbitFract α N` is the finite set of the points `{kα}`, `k < N`, and `gaps α N` the multiset of
the lengths of the arcs between consecutive points, the last one reaching `1`; both are copied
verbatim from Equidistribution 4.1. The gaps are positive and sum to `1` for `N ≥ 1`
(Equidistribution 4.1). Define `occurrenceCount u w N`, the number of positions `i ≤ N` at which
`w` occurs in `u`, and `frequency u w`, the limit of `occurrenceCount u w N / (N + 1)` as `N → ∞`
(Mathlib's `limUnder`, so the junk value of `limUnder` when there is no limit; 3.2 proves that
the limit exists for the words it names).

**Checks.**

- The empty word occurs at every position, so its occurrence count is `N + 1` and its frequency
  `1`; `gaps (-α) 1` is the single gap `1`, in agreement with 3.2 at `n = 0`.
- `u = 0101…` (slope `1/2`) and `w = 01`: the occurrence count is `⌊N/2⌋ + 1`, and the frequency
  is `1/2`.

### 3.2 Factors and frequencies

Prove `factors_and_frequencies`: let `α` be real and `u` be `lowerMechanical α ρ` or
`upperMechanical α ρ`, and for `t` real let `wₜ` be the first `n` letters of
`lowerMechanical α t`. Then

- the set of factors of length `n` of `u` is the image of `orbitFract (-α) (n + 1)` under
  `t ↦ wₜ`;
- for each point `t` of `orbitFract (-α) (n + 1)`, `occurrenceCount u wₜ N / (N + 1)` converges, to
  `frequency u wₜ`;
- the multiset of the values `frequency u wₜ`, over the points `t` of `orbitFract (-α) (n + 1)`,
  is `gaps (-α) (n + 1)`.

For irrational `α` there are `n + 1` points; for rational `α = p/q` in lowest terms `{−kα}` depends
only on `k` modulo `q`, so there are `min(n + 1, q)` points, and the finite set and the multiset of
gaps count each point once. Alessandri–Berthé prove the
corresponding statements for Sturmian codings, `0 < α < 1` irrational: the factors correspond to
the nonempty sets `I(w)` of starting points, which are the `n + 1` arcs cut by
`0, {1 − α}, …, {n(1 − α)}`, and the frequency of a factor is the length of its arc by uniform
distribution (§2.1, pp. 6–8, Lemma 1 and the paragraphs before and after it; §2.3, p. 11). The
statement here allows every real slope, with the complete route below, and is made with
Equidistribution's objects.

Route. *Step lemma for every slope.* For `t ∈ [0, 1)` and `1 ≤ k ≤ n` put
`Hₖ(t) = ⌊kα + t⌋ − ⌊kα⌋`; the sum of the first `k` letters of `wₜ` is `⌊kα⌋ + Hₖ(t)`, so `wₜ`
determines and is determined by `(H₁(t), …, Hₙ(t))`. If `kα` is an integer, `Hₖ = 0` on `[0, 1)`;
otherwise `Hₖ` is `0` on `[0, cₖ)` and `1` on `[cₖ, 1)`, with `cₖ = {−kα} > 0`. Let
`0 = t₀ < t₁ < ⋯ < t_r` be the points of `orbitFract (-α) (n + 1)` (so `r = n` for irrational `α`)
and `t_(r+1) = 1`. Every `Hₖ` is constant on each arc `[tⱼ, tⱼ₊₁)`, so `wₜ = w_(tⱼ)` there; and
`H₁(tⱼ) + ⋯ + Hₙ(tⱼ)` is the number of `k` with `0 < cₖ ≤ tⱼ`, which increases strictly with `j`
because each `tⱼ` with `j ≥ 1` is one of the `cₖ`, so the words `w_(tⱼ)` are distinct.

*The arcs visited.* By 1.1 the factor of `lowerMechanical α ρ` at `i` is `w_(xᵢ)` with
`xᵢ = {iα + ρ}`, so it is `w_(tⱼ)` exactly when `xᵢ ∈ [tⱼ, tⱼ₊₁)`. For the upper word, for
`x ∈ (0, 1]` the first `n` letters of `upperMechanical α x` are constant on each `(tⱼ, tⱼ₊₁]`:
as `x` increases, `⌈kα + x⌉` changes only just after an `x` at which `kα + x` is an integer, and the
`x ∈ (0, 1]` at which some `kα + x`, `0 ≤ k ≤ n`, is an integer are the nonzero `tⱼ` and `1`. At an
`x` strictly inside `(tⱼ, tⱼ₊₁)` no `kα + x` is an integer, so every ceiling is the floor plus `1`
and the word is `w_(tⱼ)`. By 1.1 the factor of `upperMechanical α ρ` at `i` is the prefix of the
upper word with intercept `yᵢ = iα + ρ − ⌈iα + ρ⌉ + 1 = 1 − {−(iα + ρ)} ∈ (0, 1]`, so it is `w_(tⱼ)`
exactly when `yᵢ ∈ (tⱼ, tⱼ₊₁]`. In both cases `occurrenceCount u w_(tⱼ) N` is the number of
`i ≤ N` whose point (`xᵢ`, respectively `yᵢ`) lies in the `j`-th arc, and it remains to show that
this number divided by `N + 1` tends to `tⱼ₊₁ − tⱼ > 0`. That gives all three bullets: every arc
contains some point, so every `w_(tⱼ)` is a factor (and every factor is one of them); the limit
exists; and `tⱼ₊₁ − tⱼ` is the `j`-th entry of the list that `gaps (-α) (n + 1)` builds by
`zipWith` from the sorted points `t₀, …, t_r`, a list whose multiset is
`(orbitFract (-α) (n + 1)).val`.

*Irrational slopes.* For the lower word this is ProbabilisticAndMetricNumberTheory §2.5 applied to
`iα + ρ` exactly as in 2.1. For the upper word, `yᵢ ∈ (a, b]` exactly when
`{−iα − ρ} ∈ [1 − b, 1 − a)`, and the same theorem applies to `−iα − ρ`, the slope `−α` being
irrational.

*Rational slopes.* Let `α = p/q` in lowest terms, `q ≥ 1`. Every `cₖ`, hence every `tⱼ`, lies in
`(1/q)ℤ`. The points `xᵢ` and `yᵢ` depend only on `i` modulo `q`, and since `i ↦ ip` is a bijection
of `ℤ/qℤ`, as `i` runs over `q` consecutive integers `xᵢ` runs exactly once over the `q` points of
`[0, 1)` congruent to `ρ` modulo `1/q`, and `yᵢ` over those of `(0, 1]`. An arc `[a, b)` or
`(a, b]` with `a`, `b` in `(1/q)ℤ` contains exactly `q(b − a)` points of such a set. So among any
`q` consecutive `i` exactly `q(tⱼ₊₁ − tⱼ)` have their point in the `j`-th arc, the count for
`i ≤ N` differs from `(N + 1)(tⱼ₊₁ − tⱼ)` by less than `q`, and the quotient tends to
`tⱼ₊₁ − tⱼ`.

*Consequence.* Equidistribution 4.2, `Rotation.card_toFinset_gaps_le_three` and
`Rotation.gaps_toFinset_subset`, applied to `-α` and `N = n + 1`, then says that the frequencies of
the factors of length `n` take at most three values, and that, when there are at least two points
(for instance for irrational `α` and `n ≥ 1`), each is `η⁺`, `η⁻` or
`η⁺ + η⁻`, where `η⁺` is the least positive point `{−kα}` and `η⁻` is one minus the largest. This is
the three-distance form of the frequencies, Alessandri–Berthé §2.3, Theorem 8 and the paragraph
after it (p. 11).

**Checks.**

- `α = 2 − φ`, `ρ = α` (the Fibonacci word), `n = 2`: the points are `0`, `√5 − 2`, `(√5 − 1)/2`,
  the words are `00`, `01`, `10` and their frequencies `√5 − 2`, `(3 − √5)/2`, `(3 − √5)/2`; two
  values, summing with multiplicity to `1`.
- The same word, `n = 3`: the factors `001`, `010`, `100`, `101` have frequencies `√5 − 2`,
  `(3 − √5)/2`, `√5 − 2`, `(7 − 3√5)/2`; three values, and `(3 − √5)/2 = (√5 − 2) + (7 − 3√5)/2`.
- `n = 1`: the letter `1` of the lower word of slope `α ∈ (0, 1)` has frequency `α`, the gap from
  `{−α} = 1 − α` to `1`; for the Fibonacci word, `(3 − √5)/2`.
- `α = 1/3`, `ρ = 0`: the lower word is `001001…`; for `n = 3` the points `{−k/3}`, `k ≤ 3`, are
  only the three points `0`, `1/3`, `2/3`, with words `w₀ = 001`, `w_(1/3) = 010`, `w_(2/3) = 100`,
  the three factors, each of frequency `1/3`, the three gaps. The statement holds, while the count
  `n + 1` of 2.1 fails for this rational slope.
- `α = 1/2`, `ρ = 0`, `n = 2`: the upper word `1010…` and the lower word `0101…` differ at every
  position, and both have exactly the factors `w₀ = 01` and `w_(1/2) = 10`, each of frequency
  `1/2`, the two gaps of the points `0`, `1/2`.

*Needs:* 1.1, the Weyl-sum computation of 2.1; Equidistribution 4.1 `orbitFract`, `gaps`;
ProbabilisticAndMetricNumberTheory §2.5 `uniformDistribution_mod_one_tfae`; Mathlib `limUnder`,
`Finset.sort`, `Int.ceil_add_intCast`, `Int.fract_neg`. The consequence uses Equidistribution 4.2.

### Examples

- The golden rotation. `{−k(2 − φ)} = {kφ}`, so for the Fibonacci word `orbitFract (-α) (n + 1)` is
  `orbitFract φ (n + 1)` and the frequencies are the gaps of the golden rotation. By
  Equidistribution 4.5, `Rotation.gaps_goldenRatio_le_sq_mul`, any two factors of the same length
  have frequencies within the factor `φ²`; at `n = 3` the ratio of the frequencies of `010` and
  `101` is `(3 − √5)/(7 − 3√5) = (3 + √5)/2 = φ²` exactly.

### Dependencies

Layer 1 and the Weyl-sum computation of 2.1; Equidistribution 4.1 and, for the consequence and the
example, 4.2 and 4.5; ProbabilisticAndMetricNumberTheory §2.5.

## Layer 4: balanced words

### 4.1 Balance

Define `IsBalanced u`: for all positions `i`, `j` and lengths `n`, the sums of the factors of
length `n` at `i` and at `j` differ by at most `1`. For a word over `{0, 1}` the sum of a factor is
its number of letters `1`, and this is the balance of Alessandri–Berthé §2.1, p. 8.

**Checks.**

- `0011…` is not balanced: its factors `00` and `11` have sums `0` and `2`. The Thue–Morse word
  `0110100110010110…` is not balanced for the same reason (it contains `00` and `11`).
- `010000…` (one letter `1`) is balanced, since every factor contains at most one `1`, and it is
  eventually periodic: aperiodicity is needed in 4.2.

### 4.2 Balanced aperiodic binary words are the Sturmian words

Prove `balanced_aperiodic_iff`: a word `u : ℕ → ℤ` takes only the values `0` and `1`, is balanced
and is not eventually periodic if and only if `u` is `lowerMechanical α ρ` or `upperMechanical α ρ`
for some irrational `α` with `0 < α < 1` and some real `ρ`. Alessandri–Berthé state the
characterisation without proof (§2.1, p. 8); the proof is written here in full. (Proved here.)

Route, from the mechanical side. The letters are `0` and `1` by 1.1. The sum of the factor of
length `n` at `i` is `⌊(i + n)α + ρ⌋ − ⌊iα + ρ⌋` (1.1), which lies in `{⌊nα⌋, ⌊nα⌋ + 1}`, so two
such sums differ by at most `1`; for the upper word, `{⌈nα⌉ − 1, ⌈nα⌉}`. If `u (n + p) = u n` for
all `n ≥ N` with `p > 0`, the sum `S(n)` of the factor of length `p` at `n` is constant for `n ≥ N`
(its increment is `u (n + p) − u n`), say `c`; adding it over `n = N, N + p, …, N + (m − 1)p` gives
`⌊(N + mp)α + ρ⌋ − ⌊Nα + ρ⌋ = mc`, so `|mpα − mc| < 1` for every `m`, `pα = c`, and `α` is
rational, a contradiction (the same for ceilings).

Route, from the balanced side. Let `h(n)` be the sum of the first `n` letters and `W(i, n)` the sum
of the factor of length `n` at `i`, an integer in `[0, n]`. Let `Mₙ` and `mₙ` be the largest and the
smallest `W(i, n)` over `i`; balance gives `Mₙ − mₙ ≤ 1`.

1. *Slope.* `W(i, p + q) = W(i, p) + W(i + p, q)` gives `M(p + q) ≤ Mₚ + M_q` and
   `m(p + q) ≥ mₚ + m_q`. By Fekete's lemma (Mathlib `Subadditive.tendsto_lim`, the sequence
   `Mₙ / n` being bounded below by `0`) `Mₙ / n` converges to `α = inf Mₙ / n`, and likewise
   `mₙ / n` converges to `sup mₙ / n`; the two limits agree because `Mₙ − mₙ ≤ 1`. Hence
   `mₙ ≤ nα ≤ Mₙ` for `n ≥ 1`, so `nα − 1 ≤ Mₙ − 1 ≤ mₙ ≤ W(i, n) ≤ Mₙ ≤ mₙ + 1 ≤ nα + 1`:
   `|W(i, n) − nα| ≤ 1` for all `i` and `n`, and `0 ≤ α ≤ 1`.
2. *The slope is irrational.* Suppose `α = p/q` with `q ≥ 1`. By step 1 the sums `W(i, q)` lie in
   `{p − 1, p, p + 1}` and by balance in a set `{c, c + 1}`; say all are at least `p` (the case
   "at most `p`" is symmetric). The integers `g(i) = q h(i) − p i` satisfy
   `g(i + q) − g(i) = q (W(i, q) − p) ≥ 0`, and `|g(i)| = q |h(i) − iα| ≤ q` by step 1 at `i = 0`.
   So for each residue `r < q` the sequence `g(r + kq)` is nondecreasing, integral and bounded,
   hence constant from some `k` on. Past all these points `W(i, q) = p` for every `i`, so
   `W(i + 1, q) = W(i, q)`, that is `u (i + q) = u i`: `u` is eventually periodic, a contradiction.
   Hence `α` is irrational, and `0 < α < 1`.
3. *Intercept.* Put `aₙ = h(n) − nα`, so `a₀ = 0`. For `n > m`, `aₙ − aₘ = W(m, n − m) − (n − m)α`
   lies in `[−1, 1]` by step 1, so `S = sup aₙ` and `I = inf aₙ` exist, `I ≤ 0 ≤ S` and
   `S − I ≤ 1`. The `aₙ` are distinct, since `aₙ = aₘ` gives `(n − m)α ∈ ℤ`, and no two of them
   differ by exactly `1`, for the same reason; so if `S − I = 1`, `S` and `I` are not both attained.
4. *Lower case.* If `S − I < 1`, or if `I` is not attained, put `ρ = S`. Then `aₙ ≤ ρ < aₙ + 1`
   for every `n` (in the second case because `aₙ > I = S − 1`), that is `h(n) ≤ nα + ρ < h(n) + 1`,
   so `h(n) = ⌊nα + ρ⌋` and `u n = h(n + 1) − h(n) = lowerMechanical α ρ n`.
5. *Upper case.* Otherwise `S − I = 1`, `I` is attained and `S` is not. Put `ρ = I`; then
   `ρ > −1` (else `S = 0 = a₀` would be attained), so `⌈ρ⌉ = 0`, and `ρ ≤ aₙ < ρ + 1` for every
   `n`, that is `h(n) − 1 < nα + ρ ≤ h(n)`, so `h(n) = ⌈nα + ρ⌉ − ⌈ρ⌉` and
   `u = upperMechanical α ρ`.

**Checks.**

- `u = 5 + lowerMechanical (√2 − 1) 0` is balanced and not eventually periodic but takes the
  values `5` and `6`: the hypothesis on the letters is needed.
- The two cases of steps 4 and 5 both occur: for `u = upperMechanical α 0` with `α` irrational in
  `(0, 1)`, `h(n) = ⌈nα⌉`, so `a₀ = 0 = I` is attained and `aₙ = 1 − {nα}` for `n ≥ 1` has
  supremum `S = 1`, not attained; the lower case fails there, and the construction returns `ρ = 0`.
- Balance is needed: the word `0 1 1 0 1 1 1 0 1 1 1 1 0 …` (a `0` after each block of `k`
  letters `1`, `k = 2, 3, …`) is not eventually periodic and is not mechanical, and it is not
  balanced, its factors `0110` and `1111` having sums `2` and `4`.

*Needs:* 1.1, 4.1; Mathlib `Subadditive`, `Subadditive.tendsto_lim`, `Int.floor_eq_iff`,
`Int.ceil_eq_iff`, `Irrational`.

### Examples

- The Fibonacci word is balanced: its factors of length `n` have `⌊n(2 − φ)⌋` or
  `⌊n(2 − φ)⌋ + 1` letters `1`; for `n = 3`, the factors `001`, `010`, `100`, `101` have one or two.

### Dependencies

Layer 1 and 4.1; Mathlib's subadditive sequences.

## Scope and ownership

This roadmap owns: the lower and upper mechanical words as functions `ℕ → ℤ`; their complexity
`n + 1` for every irrational slope; the identification, for every real slope, of their factors of
length `n` with the points `{−kα}`, `0 ≤ k ≤ n`, and of the frequencies of those factors with the
gaps of these points; the notions of occurrence count, frequency and balance for infinite words
over `ℤ`; and the characterisation of the balanced binary words that are not eventually periodic
as the mechanical words of irrational slope in `(0, 1)`.

Stated by other roadmaps and used here, not restated:

- Equidistribution owns the point set `orbitFract` and the multiset `gaps` (its 4.1; the
  definitions are copied verbatim into `Suggested.lean`), the three-distance theorem in the forms
  `Rotation.card_toFinset_gaps_le_three` and `Rotation.gaps_toFinset_subset` (its 4.2), the gap
  lengths through convergent denominators (its 4.4) and the golden rotation (its 4.5). The
  three-distance theorem is applied above, never restated.
- SubspaceTheorem owns the complexity function `complexity` (its 7.3, copied verbatim) and the
  Morse–Hedlund theorem relating bounded complexity to eventual periodicity, which its 7.3 lists.
  The roadmap does not use that theorem: Sturmian words are defined here as mechanical words, and
  4.2 is proved without it.
- ProbabilisticAndMetricNumberTheory owns uniform distribution modulo one and Weyl's criterion
  (its §2.5, `uniformDistribution_mod_one_tfae`), which 2.1 and 3.2 apply.
- Mathlib has Fine and Wilf's theorem on periods of finite words (`List.HasPeriod.gcd`) and Beatty
  sequences with Rayleigh's theorem (`beattySeq`, `compl_beattySeq`), to which mechanical words are
  related through the positions of their letters `1` (Alessandri–Berthé §4.3, pp. 16–17); neither
  is restated or used.

Outside the scope: the recurrence function of a Sturmian word (Alessandri–Berthé Theorem 11, whose
proof in the source omits the proof of its Lemma 5); the combinatorics of finite words (borders,
periods, Lyndon words) beyond the factors used here; standard and characteristic words built from
continued fractions; Sturmian morphisms and substitutions; codings of rotations for partitions
into more than two arcs and their complexity `an + b`; square billiards; episturmian and
Arnoux–Rauzy words; and Sturmian subshifts as dynamical systems.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Algebra/Order/Floor/Ring.lean`: `Int.floor`, `Int.ceil`, `Int.fract`;
  `Int.floor_add_intCast` (`⌊a + z⌋ = ⌊a⌋ + z`), `Int.ceil_add_intCast` (`⌈a + z⌉ = ⌈a⌉ + z`),
  `Int.ceil_neg` (`⌈−a⌉ = −⌊a⌋`), `Int.fract_neg` (`fract x ≠ 0 → fract (−x) = 1 − fract x`),
  `Int.floor_eq_iff` (`⌊a⌋ = z ↔ z ≤ a ∧ a < z + 1`), `Int.ceil_eq_iff`
  (`⌈a⌉ = z ↔ z − 1 < a ∧ a ≤ z`).
- `Mathlib/Analysis/Subadditive.lean`: `Subadditive` (`u (m + n) ≤ u m + u n`) and
  `Subadditive.tendsto_lim` (for subadditive `u` with `u n / n` bounded below, `u n / n` tends to
  `Subadditive.lim`, the infimum of `u n / n` over `n ≥ 1`).
- `Mathlib/NumberTheory/Real/Irrational.lean`: `Irrational`, `Irrational.neg`,
  `Irrational.ne_int`. `Mathlib/Analysis/Fourier/AddCircle.lean`: `fourier_coe_apply`
  (`fourier n (x : AddCircle T) = exp (2π i n x / T)`).
- `Mathlib/Data/Set/Card.lean`: `Set.ncard` (`0` on infinite sets). `Mathlib/Data/Finset/Sort.lean`:
  `Finset.sort`. `Mathlib/Topology/Defs/Filter.lean`: `limUnder`. Core: `List.range`, `List.map`.
- Related, not consumed: `Mathlib/Data/List/PeriodicityLemma.lean` `List.HasPeriod.gcd`;
  `Mathlib/NumberTheory/Rayleigh.lean` `beattySeq`, `compl_beattySeq`.

### From TauCetiRoadmap.Equidistribution

- 4.1: the definitions `Rotation.orbitFract α N` (the image of `range N` under
  `n ↦ Int.fract (n * α)`) and `Rotation.gaps α N` (the successive differences of the sorted
  points, the last to `1`), copied verbatim into `Suggested.lean`; the facts that the gaps are
  positive and sum to `1` for `N ≥ 1`, and that the card is `N` for irrational `α`.
- 4.2: `Rotation.card_toFinset_gaps_le_three` (for every real `α` and `N`, at most three distinct
  gaps) and `Rotation.gaps_toFinset_subset` (for `2 ≤ card`, every gap is `η⁺`, `η⁻` or their sum),
  for the consequence in 3.2.
- 4.5: `Rotation.gaps_goldenRatio_le_sq_mul` (for `α = φ` and `N ≥ 1`, any two gaps within the
  factor `φ²`), for the example of Layer 3.

### From TauCetiRoadmap.SubspaceTheorem

- 7.3: the definition `complexity a n` (the `Set.ncard` of the set of factors of length `n`),
  copied verbatim into `Suggested.lean`. No theorem of that roadmap is used.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §2.5: `uniformDistribution_mod_one_tfae` (for `u : ℕ → ℝ`, equidistribution of the classes of
  `u n` for the circle's Haar measure, convergence of the proportion of `i ≤ n` with
  `Int.fract (u i) ∈ [a, b)` to `b − a` for all `0 ≤ a ≤ b ≤ 1`, and the vanishing of the Weyl
  averages for every nonzero integer frequency, are equivalent), used from the third condition to
  the second.

## References

- P. Alessandri and V. Berthé, *Three distance theorems and combinatorics on words*,
  Enseign. Math. 44 (1998) 103–132, read in the authors' copy on V. Berthé's page
  (`irif.fr/~berthe/Articles/3d.pdf`), with its page numbers: §2 and §2.1 (codings of rotations,
  Sturmian sequences as the codings for two arcs, Lemma 1, complexity `n + 1`, frequencies as arc
  lengths, the balanced characterisation stated without proof; pp. 5–8), §2.3 (Theorem 8 and the
  paragraph after it, frequencies and the three distance theorem; p. 11), §3 (the three distance
  theorem; pp. 11–12), §4.3 (Beatty sequences; pp. 16–17), §5 (Theorem 11, the recurrence function;
  pp. 17–18).
- M. Lothaire, *Algebraic Combinatorics on Words*, Cambridge University Press, 2002, Chapter 2
  (J. Berstel and P. Séébold), for the names lower and upper mechanical word; cited for the
  terminology only, not opened.
