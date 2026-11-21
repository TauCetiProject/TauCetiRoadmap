# Roadmap: rate-distortion theory

**Summary.** Rate-distortion theory asks how many nats per letter are needed to describe a
source when the reproduction may differ from it at a prescribed average cost. This roadmap proves
Shannon's answer for a discrete memoryless source: a law `p` on a finite source alphabet `A`, a
finite nonempty reproduction alphabet `B`, and a real distortion `d(a, b)` for each pair, averaged
over the letters of a block. A code for blocks of `n` letters with `M` codewords maps each source
word to one of `M` indices and each index to a reproduction word, and is judged by its expected
per-letter distortion. Codes are mathematical objects here, not procedures. Logarithms are
natural.

The central object is the rate-distortion function `R(D)`, the least mutual information between
the source letter and a reproduction letter produced by any test channel, that is any stochastic
matrix from `A` to `B`, whose expected distortion is at most `D`. The main theorems are these.

- *Properties of `R`.* Let `D_min` be the expected least distortion of the source letter, the
  smallest distortion any test channel reaches. On `[D_min, ∞)` the infimum defining
  `R(D)` is attained, and `R` is convex and continuous, the endpoint included.
  For `D ≥ D_min`, `R(D) = 0` exactly when `D` is at least the expected distortion of the best
  constant reproduction. If `B = A` and, for every letter of positive probability, a correct
  reproduction costs a constant `c` and every wrong one costs more, then `R(c)` is the entropy
  of the source.
- *Single-letterization and converse.* For blocks of `n` independent letters with the
  per-letter distortion, the rate-distortion function is `n R(D)`. Hence every code for blocks
  of `n` letters with `M` codewords and expected per-letter distortion at most `D` satisfies
  `n R(D) ≤ log M`.
- *Achievability.* If `D > D_min` and `R > R(D)`, then for all large `n` some code for blocks of
  `n` letters has at most `exp (n R)` codewords and expected per-letter distortion at most `D`.
  It rests on Shannon's random-coding bound for one use of a test channel.
- *Closed forms with Hamming distortion.* For a source emitting `1` with probability `θ`,
  `R(D) = h(θ) − h(D)` for `0 ≤ D ≤ min (θ, 1 − θ)`, where `h` is the binary entropy, and `R(D) = 0`
  beyond. For the uniform source on `m` letters, `R(D) = log m − h(D) − D log (m − 1)` for
  `0 ≤ D ≤ 1 − 1/m`.

The roadmap builds on ChannelCoding, which supplies the channel matrices, their joint law with
an input law and the one mutual information used throughout, the finite mutual information of
ProbabilisticAndMetricNumberTheory. EntropyAndSourceCoding supplies Fano's inequality, used for
the closed forms, and elementary inequalities between entropies. Mathlib supplies the binary
entropy, convexity, compactness and Chebyshev's inequality.

Layer 1 below defines the rate-distortion function and proves its properties. Layer 2 computes it
for Hamming distortion. Layer 3 defines source codes and proves single-letterization and the
converse. Layer 4 proves the random-coding bound and achievability.

## Conventions

- **Alphabets.** Alphabets are finite types carrying a measurable space in which singletons are
  measurable (Mathlib `MeasurableSingletonClass`); words of length `n` are functions `Fin n → A`
  with the product measurable space. A statement that needs a nonempty reproduction alphabet says
  so; a source law makes the source alphabet nonempty.
- **Source laws and distortion.** A source law is a vector `p : A → ℝ` with nonnegative entries
  summing to `1`. A distortion measure is any matrix `d : A → B → ℝ`; it may take negative
  values, except in the random-coding bound 4.1, which assumes it nonnegative. It need not be a
  metric and `B` need not equal `A`.
- **Test channels and mutual information.** A test channel is a matrix `W : A → B → ℝ` with
  `IsChannel W`: nonnegative entries and rows summing to `1`. `jointMeasure p W` puts mass
  `p a · W a b` on `(a, b)`, and `channelMutualInformation p W`, written `I(p, W)`, is the finite
  mutual information `H(X) + H(Y) − H((X, Y))` of the two coordinates under it, `H` being the
  finite-label entropy `labelEntropy`. The definitions `labelEntropy`,
  `finiteMutualInformation`, `IsChannel`, `jointMeasure`, `channelMutualInformation`, `outputLaw`
  (`q b = ∑ a, p a · W a b`) and `informationDensity` (`i(a; b) = log (W a b / q b)`) are those of
  ChannelCoding 1.1, the first two copied there from ProbabilisticAndMetricNumberTheory §5.1a and
  §5.2; they are copied verbatim into `Suggested.lean` with that citation, and no second mutual
  information is defined.
- **Expected distortion.** `expectedDistortion p W d = ∑ a, ∑ b, p a · W a b · d a b`.
  `minDistortion p d = ∑ a, p a · min_b d a b` is written `D_min` and
  `maxDistortion p d = min_b ∑ a, p a · d a b` is written `D_max`; both use Mathlib's `⨅` over
  `B`, which is a minimum for nonempty finite `B`. Always `D_min ≤ D_max`.
- **Junk values.** `rateDistortion p d D` is the `sInf` of a set of reals. For `D < D_min` the
  set is empty and the value is the junk value `0`; every statement about `R(D)` either assumes
  `D ≥ D_min` or holds also at the junk value, and says which.
- **Codes.** A code `c : SourceCode M X Y` has an encoder `c.enc : X → Fin M` and a decoder
  `c.dec : Fin M → Y`, deterministic; `codeDistortion P e c = ∑ x, P x · e x (c.dec (c.enc x))`.
  For blocks, `productLaw p n x = ∏ i, p (x i)` and
  `blockDistortion d n x y = (∑ i, d (x i) (y i)) / n`, with Lean's `0 / 0 = 0` for `n = 0`. A
  code for blocks of `n` letters is a `SourceCode M (Fin n → A) (Fin n → B)`; its rate is
  `log M / n` nats per letter.
- **Binary entropy.** `h` is Mathlib's `Real.binEntropy`,
  `h(x) = x log x⁻¹ + (1 − x) log (1 − x)⁻¹`.

## Layer 1: the rate-distortion function

### 1.1 Expected distortion and convexity of mutual information in the channel

Define `expectedDistortion`, and take `labelEntropy`, `finiteMutualInformation`, `IsChannel`,
`jointMeasure`, `channelMutualInformation`, `outputLaw` and `informationDensity` from
ChannelCoding 1.1 (the joint law and mutual information). Prove
`convexOn_channelMutualInformation_channel`: for a source law `p`, the map `W ↦ I(p, W)` is convex
on the set of channels (Polyanskiy–Wu, Theorem 5.3, second part, p. 92).

API, proved here:

- The set of channels `A → B → ℝ` is convex, closed and bounded, hence compact; the channels with
  expected distortion at most `D` form a closed convex subset.
- `W ↦ I(p, W)` is continuous on the set of channels.
- `W ↦ expectedDistortion p W d` is linear.

Route: by ChannelCoding 1.1 (channelMutualInformation_eq_sum), `I(p, W)` is the sum over pairs
of `p a · W a b · log (W a b / q b)`. For `p a > 0` write the term as `x log (x / y)` with
`x = p a · W a b` and `y = p a · q b`, both linear in `W`; when `y = 0` also `x = 0`, and the
terms with `p a = 0` vanish. The map `(x, y) ↦ x log (x / y)` is convex on `[0, ∞) × (0, ∞)`: for a
mixture with weight `λ`, put `w₁ = λ y₁ / y` and `w₂ = (1 − λ) y₂ / y`, so that
`x / y = w₁ (x₁ / y₁) + w₂ (x₂ / y₂)`, apply the convexity of `t ↦ t log t` on `[0, ∞)` (Mathlib
`Real.convexOn_mul_log`) and multiply by `y` (Polyanskiy–Wu, Remark 5.2, p. 92, names this
perspective argument). For `λ ∈ {0, 1}` there is nothing to prove; for `0 < λ < 1` a pair with
`y = 0` in the mixture has `y₁ = y₂ = 0` and contributes `0` on both sides. Continuity follows
from the ChannelCoding 1.1 formula `I(p, W) = H(q) − ∑ a, p a · H(W a)` and
`Real.continuous_negMulLog`.

**Checks.**
- For the uniform law on two letters, the identity channel and the channel that swaps the
  letters both give `I = log 2`, and their midpoint, the channel with all entries `1/2`, gives
  `I = 0`. So the map is not concave: concavity would need `0 ≥ log 2`.
- For the channel of a deterministic map `f : A → B` (rows the point masses at `f a`),
  `I(p, W)` is the entropy of the image law; for the three-letter law `(1/2, 3/10, 1/5)` and the
  identity map it is `H(p) ≈ 1.0297`.

*Needs:* ChannelCoding 1.1 (the definitions, channelMutualInformation_eq_sum and the formula
`I(p, W) = H(q) − ∑ a, p a · H(W a)`); Mathlib `Real.convexOn_mul_log`,
`Real.continuous_negMulLog`. (Proved here.)

### 1.2 The rate-distortion function and its attainment

Define `rateDistortion p d D`, written `R(D)`, as the infimum of `I(p, W)` over the channels `W`
with `expectedDistortion p W d ≤ D`, and `minDistortion` and `maxDistortion` as in the
conventions (Polyanskiy–Wu, Theorem 24.3, p. 485, and (25.1), p. 490, where the infimum is
written `ϕ_S(D)`, with `D_max` from Theorem 24.4(e), p. 486; El Gamal–Kim, Lecture 3, p. 3–40,
with `D_min` and `D_max`). Prove `isLeast_rateDistortion`: if `B` is nonempty and
`D ≥ D_min`, the infimum is attained, that is `R(D)` belongs to the set of values `I(p, W)` of the
admissible channels and bounds it below (El Gamal–Kim, Lecture 3, p. 3–40, where it is written as
a minimum for `D ≥ D_min`).

API, proved here: `R(D) ≥ 0` for every `D`; for `D ≥ D_min`, `R(D) ≤ H(p) = ∑ a, negMulLog (p a)`.

Route: the channel sending each `a` to a letter minimizing `d a ·` has expected distortion
`D_min`, so the admissible set is nonempty; it is compact by 1.1, and the continuous map
`W ↦ I(p, W)` attains its infimum on it (Mathlib `IsCompact.exists_isMinOn`; the value is the
`sInf` by `IsCompact.sInf_mem` applied to the compact image). Nonnegativity is that of finite
mutual information (ProbabilisticAndMetricNumberTheory §5.2), which also holds for the junk
value `0`. For the upper bound, `I(p, W) = H(X) − H(X | Y)` (§5.2) and conditional entropy is
nonnegative (EntropyAndSourceCoding 1.1, joint labels).

**Checks.**
- For `p = (1/2, 3/10, 1/5)` and the distortion matrix with rows `(0, 1, 3)`, `(2, 1/2, 1)` and
  `(1, 2, 1/5)`, `D_min = 0 + 0.15 + 0.04 = 0.19` and `D_max = min (0.8, 1.05, 1.84) = 0.8`.
  Taking the largest column value instead would give `1.84`, at which 1.5 would fail: the
  constant channel to the first letter already has distortion `0.8` and mutual information `0`.
- `D ≥ D_min` is needed: for `D < D_min` the admissible set is empty, `R(D)` is the junk value
  `0`, and no channel attains it.
- For a fair bit with Hamming distortion, `R(1/2) = 0` and `R(0) = log 2`. A definition taking the
  supremum instead of the infimum would give `log 2` at `D = 1/2` (the identity channel has
  distortion `0 ≤ 1/2`).

*Needs:* 1.1; ProbabilisticAndMetricNumberTheory §5.2 (nonnegativity of finite mutual
information and `I = H(X) − H(X | Y)`); EntropyAndSourceCoding 1.1 (nonnegativity of conditional
entropy); Mathlib `IsCompact.exists_isMinOn`, `IsCompact.sInf_mem`,
`IsCompact.image_of_continuousOn`, `Metric.isCompact_of_isClosed_isBounded`.

### 1.3 Convexity and monotonicity

Prove `convexOn_rateDistortion`: if `B` is nonempty, `R` is convex on `[D_min, ∞)` (Polyanskiy–Wu,
Theorem 24.4(a), p. 486; El Gamal–Kim, Lecture 3, p. 3–40). API, proved here: `R` is
nonincreasing on `[D_min, ∞)`.

Route: for `D₁, D₂ ≥ D_min` take channels `W₁`, `W₂` attaining `R(D₁)`, `R(D₂)` (1.2). For
`λ ∈ [0, 1]` the mixture `λ W₁ + (1 − λ) W₂` is a channel with expected distortion at most
`λ D₁ + (1 − λ) D₂` (1.1, linearity), and its mutual information is at most
`λ R(D₁) + (1 − λ) R(D₂)` by 1.1. Monotonicity: the admissible sets increase with `D` and their
values are bounded below by `0` (Mathlib `csInf_le_csInf`).

**Checks.**
- On all of `ℝ` the function is not monotone: for a fair bit with Hamming distortion, `R(−1)` is
  the junk value `0` while `R(0) = log 2`. This is why the statement is on `[D_min, ∞)`.
- For the Bernoulli source of 2.2 with `θ = 0.3`, `R(0.29) ≈ 0.0087 > 0 = R(0.3)`.

*Needs:* 1.1, 1.2; Mathlib `csInf_le_csInf`.

### 1.4 Continuity

Prove `continuousOn_rateDistortion`: if `B` is nonempty, `R` is continuous on `[D_min, ∞)`,
the endpoint included (Polyanskiy–Wu, Theorem 24.4(b), p. 486, on the open half-line; the
endpoint is proved here for finite alphabets).

Route: on the interior `(D_min, ∞)` continuity follows from convexity (1.3; Mathlib
`ConvexOn.continuousOn_interior`). At `D_min`, monotonicity gives `R(D) ≤ R(D_min)` for
`D ≥ D_min`. Conversely, for `Dₖ ↓ D_min` take channels `Wₖ` attaining `R(Dₖ)` (1.2); a
subsequence converges, by compactness of the set of channels (1.1), to a channel `W` whose
expected distortion is at most `D_min`, and by continuity of `I(p, ·)` (1.1),
`R(D_min) ≤ I(p, W) = lim I(p, Wₖ)`.

**Checks.**
- For `p = (1/2, 3/10, 1/5)` and the distortion with diagonal `1`, rows `(1, 2, 3/2)`,
  `(3, 1, 6/5)` and `(11/10, 4, 1)`, `D_min = 1` and `R(1) = H(p) ≈ 1.0297` by 1.5, while
  `R(1.05) ≈ 0.5013`, `R(1.01) ≈ 0.7565` and `R(1.001) ≈ 0.9804`: the values rise steeply
  towards `H(p)` as `D` decreases to `1`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `ConvexOn.continuousOn_interior`,
`IsCompact.tendsto_subseq`. (Proved here.)

### 1.5 The two ends

Prove, for a nonempty `B`:

- `rateDistortion_eq_zero_iff`: if `D ≥ D_min`, then `R(D) = 0` if and only if `D ≥ D_max`
  (Polyanskiy–Wu, Theorem 24.4(e), p. 486, for `D > D_max`; the value at `D_max` and the other
  direction are proved here);
- `rateDistortion_eq_entropy`: if `B = A` and, for every letter `a` with `p a > 0`, `d a a = c`
  and `d a b > c` for every `b ≠ a`, then `R(c) = H(p) = ∑ a, negMulLog (p a)` (Polyanskiy–Wu,
  Theorem 24.4(c), p. 486, there with the hypotheses on every letter and `c` written `D₀`; the
  rows of letters of probability `0` never enter an expected distortion).

Route: if `D ≥ D_max`, the constant channel to a letter `b` with `∑ a, p a · d a b = D_max` has
mutual information `0` and is admissible. Conversely, if `R(D) = 0` with `D ≥ D_min`, a channel
`W` attaining it (1.2) has `I(p, W) = 0`. By ChannelCoding 1.1 this is
`H(q) = ∑ a, p a · H(W a)` with `q = ∑ a, p a · W a`, and the equality case of Jensen's inequality
for the strictly concave `negMulLog` (Mathlib `Real.strictConcaveOn_negMulLog`,
`StrictConcaveOn.map_sum_eq_iff`), applied coordinatewise over the letters with `p a > 0`, gives
`W a = q` for those letters. Then the expected distortion is `∑ b, q b · ∑ a, p a · d a b ≥ D_max`.
For the second statement, every pair contributes `p a · W a b · d a b ≥ p a · W a b · c` (both
sides are `0` when `p a = 0`), with strict inequality when `p a · W a b > 0` and `a ≠ b`, so an
admissible channel has `p a · W a b = 0` whenever `a ≠ b`; the joint law then lives on the
diagonal with masses `p a`, so `H(X)`, `H(Y)` and `H((X, Y))` all equal `H(p)` and the mutual
information is `H(p)` (as for a label paired with itself, ProbabilisticAndMetricNumberTheory
§5.2). The identity channel is admissible, so `R(c) = H(p)`.

**Checks.**
- For the Bernoulli source with `θ = 0.3` and Hamming distortion, `D_max = 0.3` and `R(0.3) = 0`,
  while `R(0.29) ≈ 0.0087 > 0`.
- `D ≥ D_min` is needed in the first statement: at `D = −1` the junk value is `R(−1) = 0`, but
  `D_max = 0.3 > −1`.
- The strict inequality is needed in the second statement: with `d` identically `0` on a fair
  bit, `R(0) = 0 ≠ log 2`.
- Only letters of positive probability matter in the second statement: for `p = (3/5, 2/5, 0)`
  on three letters, Hamming distortion on the first two rows and the third row `(−5, −5, 7)`,
  `R(0) = H(p) = h(2/5) ≈ 0.6730`, although `d a a = 0` fails for the third letter.

*Needs:* 1.2; ChannelCoding 1.1 (the formula `I(p, W) = H(q) − ∑ a, p a · H(W a)`);
ProbabilisticAndMetricNumberTheory §5.2 (mutual information of a label with itself); Mathlib
`Real.strictConcaveOn_negMulLog`, `StrictConcaveOn.map_sum_eq_iff`.

### Examples

The three-letter source `(1/2, 3/10, 1/5)` with a nonsymmetric distortion (`D_min = 0.19`,
`D_max = 0.8`) and with a distortion of constant diagonal (`R(1) = H(p)`); the fair bit and the
Bernoulli source with `θ = 0.3` under Hamming distortion.

### Dependencies

ChannelCoding 1.1; ProbabilisticAndMetricNumberTheory §5.2; EntropyAndSourceCoding 1.1; Mathlib
`Real.convexOn_mul_log`, `Real.continuous_negMulLog`, `Real.strictConcaveOn_negMulLog`,
`StrictConcaveOn.map_sum_eq_iff`, `IsCompact.exists_isMinOn`, `IsCompact.sInf_mem`,
`IsCompact.image_of_continuousOn`, `IsCompact.tendsto_subseq`,
`Metric.isCompact_of_isClosed_isBounded`, `csInf_le_csInf`, `ConvexOn.continuousOn_interior`. No
other layer.

## Layer 2: Hamming distortion

### 2.1 Hamming distortion and the Bernoulli law

Define `hammingDistortion a b`, equal to `0` if `a = b` and `1` otherwise, and
`bernoulliLaw θ : Fin 2 → ℝ`, which gives the letter `1` probability `θ` and the letter `0`
probability `1 − θ`. Under Hamming distortion the expected distortion of a channel is the
probability that the reproduction differs from the source letter, `D_min = 0`, and `D_max` is
`1` minus the largest letter probability; for the Bernoulli law `D_max = min (θ, 1 − θ)`.

**Checks.**
- On words, `blockDistortion hammingDistortion n x y` is Mathlib's `hammingDist x y` divided by
  `n`: for `x = (0, 1, 1)` and `y = (0, 0, 1)` it is `1/3`.

*Needs:* nothing beyond the definitions; Mathlib `hammingDist` for the Check.

### 2.2 The Bernoulli source

Prove `rateDistortion_bernoulli`: for `0 ≤ θ ≤ 1` and `0 ≤ D ≤ min (θ, 1 − θ)`,

`R(D) = h(θ) − h(D)`

for `bernoulliLaw θ` with Hamming distortion (Polyanskiy–Wu, Theorem 26.1, p. 507, there for
`θ ≤ 1/2`; El Gamal–Kim, Lecture 3, pp. 3–41 to 3–42). For `D ≥ min (θ, 1 − θ)` the value is `0`,
by 1.5.

Route: by the symmetry `h(1 − x) = h(x)` (Mathlib `Real.binEntropy_one_sub`) and relabelling the
two letters it suffices to take `θ ≤ 1/2`. Lower bound: for an admissible channel with error
probability `Pₑ ≤ D`, `I = H(S) − H(S | Ŝ)` (ProbabilisticAndMetricNumberTheory §5.2), and Fano's
inequality with the estimate `Ŝ` on two letters gives `H(S | Ŝ) ≤ h(Pₑ)` (EntropyAndSourceCoding
1.3); since `Pₑ ≤ D ≤ 1/2` and `h` increases on `[0, 1/2]` (Mathlib
`Real.binEntropy_strictMonoOn`), `I ≥ h(θ) − h(D)`. Upper bound: if `D < 1/2`, let the
reproduction be `1` with probability `θ' = (θ − D) / (1 − 2D) ∈ [0, θ]` and let the source be
the reproduction flipped with probability `D`, independently; this joint law has first marginal
`bernoulliLaw θ`, so for `0 < θ` its conditional law is a test channel (for `θ = 0` also `D = 0`
and both sides are `0`), with error probability `D` and mutual information
`H(S) − H(S | Ŝ) = h(θ) − h(D)`. If `D = 1/2` then `θ = 1/2` and a constant channel gives
`R(1/2) = 0 = h(1/2) − h(1/2)`.

**Checks.**
- For a fair bit and `D = 0.11`, `R(D) = log 2 − h(0.11) ≈ 0.3466`, about half of `log 2`: one
  hundred bits can be described by about fifty with eleven percent of them wrong.
- For `θ = 0.3`: `R(0.29) ≈ 0.0087` and `R(0.3) = 0`.
- The range of `D` matters. The formula `max (h(θ) − h(D), 0)`, which agrees with `R` on
  `[0, 1 − θ]` for `θ ≤ 1/2`, fails beyond: for `θ = 0.1` and `D = 0.95` it gives
  `h(0.1) − h(0.95) ≈ 0.3251 − 0.1985 = 0.1266`, while `R(0.95) = 0` since `0.95 ≥ D_max = 0.1`.
- For `θ = 0` the source is constant and `R(0) = h(0) − h(0) = 0`.

*Needs:* 1.2, 1.5, 2.1; ProbabilisticAndMetricNumberTheory §5.2; EntropyAndSourceCoding 1.3
(Fano's inequality); Mathlib `Real.binEntropy`, `Real.binEntropy_one_sub`,
`Real.binEntropy_strictMonoOn`, `Real.binEntropy_two_inv`.

### 2.3 The uniform source on `m` letters

Prove `rateDistortion_uniform`: for a nonempty alphabet `A` with `m` letters, the uniform law and
Hamming distortion, and `0 ≤ D ≤ 1 − 1/m`,

`R(D) = log m − h(D) − D log (m − 1)`.

(Proved here.) For `m = 2` this is 2.2 at `θ = 1/2`.

Route: lower bound as in 2.2, with Fano's inequality in its general form
`H(S | Ŝ) ≤ h(Pₑ) + Pₑ log (m − 1)` (EntropyAndSourceCoding 1.3) and `H(S) = log m`
(ProbabilisticAndMetricNumberTheory §5.1a), using that `x ↦ h(x) + x log (m − 1)` is
nondecreasing on `[0, 1 − 1/m]`: it is continuous there, and on the interior its derivative
`log ((1 − x)(m − 1) / x)` is nonnegative (Mathlib `Real.deriv_binEntropy`).
Upper bound: the symmetric channel that keeps the letter with probability `1 − D` and moves it to
each other letter with probability `D / (m − 1)` has error probability `D`, uniform output, and
rows of entropy `h(D) + D log (m − 1)`, so by ChannelCoding 1.1 its mutual information is the
stated value. For `m = 1` the range is `D = 0` and both sides are `0`.

**Checks.**
- For `m = 3` and `D = 0.2`, `R(D) ≈ 1.0986 − 0.5004 − 0.1386 = 0.4596`; omitting the term
  `D log (m − 1)` would give `0.5982`, more than the mutual information `0.4596` of the symmetric
  channel, which is admissible.
- At the end of the range, `D = 2/3` for `m = 3`, both sides are `0`, and `D_max = 2/3`.
- The range is needed: for `m = 2` and `D = 0.6` the formula gives `log 2 − h(0.6) ≈ 0.0201`,
  while `R(0.6) = 0`.

*Needs:* 1.2, 2.1; ChannelCoding 1.1 (the formula for `I(p, W)`); ProbabilisticAndMetricNumberTheory
§5.1a and §5.2; EntropyAndSourceCoding 1.3; Mathlib `Real.binEntropy`, `Real.deriv_binEntropy`.

### Examples

The fair bit at `D = 0.11`; the Bernoulli sources with `θ = 0.3` and `θ = 0.1`; the uniform source
on three letters at `D = 0.2`.

### Dependencies

1.2, 1.5; ChannelCoding 1.1; ProbabilisticAndMetricNumberTheory §5.1a and §5.2;
EntropyAndSourceCoding 1.3; Mathlib `Real.binEntropy`, `Real.binEntropy_one_sub`,
`Real.binEntropy_strictMonoOn`, `Real.binEntropy_two_inv`, `Real.deriv_binEntropy`,
`hammingDist`.

## Layer 3: source codes and the converse

### 3.1 Codes, product laws and block distortion

Define `SourceCode M X Y`, `codeDistortion`, `productLaw` and `blockDistortion` as in the
conventions (Polyanskiy–Wu, Definition 24.2 and (24.8), p. 485; El Gamal–Kim, Lecture 3,
pp. 3–37 to 3–39). API, proved here: `productLaw p n` is a source law on words; the expected
block distortion of the product channel of a test channel `W` (ChannelCoding 1.4, the memoryless
use of a channel) is `expectedDistortion p W d`; and the block distortion of any channel on words
is the average over `i` of the expected distortions of its `i`-th letters.

**Checks.**
- For `n = 0` there is one word, `blockDistortion d 0` is the junk value `0`, and every code has
  distortion `0`.

*Needs:* ChannelCoding 1.4 (`productChannel`); Mathlib `Fintype.prod_sum`. (Proved here.)

### 3.2 Single-letterization

Prove `rateDistortion_productLaw`: for a source law `p`, a distortion `d`, every `n` and every
real `D`, the rate-distortion function of `productLaw p n` with `blockDistortion d n` at `D` is
`n R(D)` (Polyanskiy–Wu, Theorem 24.8, pp. 487–488).

Route: if `n = 0`, both sides are `0` (one word, distortion `0`, mutual information `0`; for
`D < 0` both are junk values). If `n ≥ 1` and `B` is empty, there is no channel on either side and
both are `0`. Let `n ≥ 1` and `B` nonempty; block and letter have the same `D_min`, so for
`D < D_min` both sides are junk values. For `D ≥ D_min`: a channel `W` attaining `R(D)` (1.2) gives
the product channel (ChannelCoding 1.4), admissible by 3.1, whose mutual information with the
product law is `n I(p, W)`: the pairs (letter, reproduction) at different positions are
independent, so the three entropies are additive (ProbabilisticAndMetricNumberTheory §5.1a).
Conversely, for an admissible channel on words with letters `Xᵢ`, `Yᵢ`,
`I(Xⁿ; Yⁿ) = ∑ H(Xᵢ) − H(Xⁿ | Yⁿ) ≥ ∑ (H(Xᵢ) − H(Xᵢ | Yᵢ)) = ∑ I(Xᵢ; Yᵢ)`, using
independence of the `Xᵢ`, the chain rule and that conditioning on more reduces entropy
(EntropyAndSourceCoding 1.1). Each `I(Xᵢ; Yᵢ)` is `I(p, Wᵢ)` for the channel `Wᵢ` of the
`i`-th letter (any fixed row where `p a = 0`), whose expected distortion `Dᵢ ≥ D_min`; so
`I(Xⁿ; Yⁿ) ≥ ∑ R(Dᵢ) ≥ n R((1/n) ∑ Dᵢ) ≥ n R(D)` by convexity (1.3, Mathlib
`ConvexOn.map_sum_le`), monotonicity (1.3) and 3.1.

**Checks.**
- For a fair bit with Hamming distortion and `n = 2`, `2 R(1/4) = 2 (log 2 − h(1/4)) ≈ 0.2616`;
  the code with codewords `00` and `11` has block distortion `1/4`, and `0.2616 ≤ log 2` as 3.3
  requires.

*Needs:* 1.2, 1.3, 3.1; ChannelCoding 1.4 (`productChannel`); ProbabilisticAndMetricNumberTheory
§5.1a (chain rule, additivity for independent labels) and §5.2; EntropyAndSourceCoding 1.1
(conditioning on more reduces entropy, relabelling); Mathlib `ConvexOn.map_sum_le`.

### 3.3 The converse

Prove `mul_rateDistortion_le_log`: for a source law `p`, a distortion `d`, every `n` and every
code for blocks of `n` letters with `M` codewords and expected per-letter distortion at most `D`,
`n R(D) ≤ log M` (Polyanskiy–Wu, p. 490, where it is derived from Theorems 24.3 and 24.8;
El Gamal–Kim, Lecture 3, p. 3–48).

Route: write `P = productLaw p n`, `e = blockDistortion d n` and `c` for the code; a code with
`M = 0` codewords has no encoder, since a source law makes the set of words nonempty. The channel
`W x = δ (c.dec (c.enc x))` on words is admissible at `D` for `(P, e)`, since its expected
distortion is the code distortion. By ProbabilisticAndMetricNumberTheory §5.2 and the
nonnegativity of conditional entropy (EntropyAndSourceCoding 1.1), `I(P, W) ≤ H(Y)`, where the
output `Y` is a function of the index `U = c.enc X`, which takes at most `M` values; so
`H(Y) ≤ H((U, Y)) = H(U) ≤ log M`, by the monotonicity and the relabelling (by the injective map
`u ↦ (u, c.dec u)`) of EntropyAndSourceCoding 1.1 and the alphabet bound of
ProbabilisticAndMetricNumberTheory §5.1a. This is the one-shot bound of Polyanskiy–Wu,
Theorem 24.3, pp. 485–486, for the block source: the rate-distortion function of `(P, e)` at `D`
is at most `log M`. By 3.2 that function is `n R(D)`.

**Checks.**
- For a fair bit, `n = 3` and `M = 2`, a best code (codewords `000` and `111`; the optimal pairs
  of codewords are exactly the four complementary pairs) has distortion `1/4`, and
  `3 R(1/4) ≈ 0.3924 ≤ log 2 ≈ 0.6931`.
- For `n = 1`, a fair bit with Hamming distortion and the code with two codewords that reproduces
  the bit, the distortion is `0` and `R(0) = log 2 = log M`: the bound is attained.

*Needs:* 1.2, 3.1, 3.2; ProbabilisticAndMetricNumberTheory §5.1a (alphabet bound) and §5.2;
EntropyAndSourceCoding 1.1 (relabelling, monotonicity, nonnegativity of conditional entropy).

### Examples

The fair bit with codes of two codewords for blocks of two and three letters.

### Dependencies

1.2, 1.3; ChannelCoding 1.4; ProbabilisticAndMetricNumberTheory §5.1a and §5.2;
EntropyAndSourceCoding 1.1; Mathlib `Fintype.prod_sum`, `ConvexOn.map_sum_le`. Within the layer,
3.2 uses 3.1, and 3.3 uses 3.1 and 3.2.

## Layer 4: achievability

### 4.1 The random-coding bound

Prove `exists_codeDistortion_le`: let `X`, `Y` be finite alphabets, `P` a source law on `X`, `V`
a channel from `X` to `Y`, `e` a nonnegative distortion, `y₀ ∈ Y` and `M` a natural number. Some
code `c` with `M + 1` codewords satisfies `e x (c.dec (c.enc x)) ≤ e x y₀` for every `x` and, for
every real `γ`,

`codeDistortion P e c ≤ E e(X, Y) + E e(X, y₀) · exp (−M/γ) + E [e(X, y₀); i(X; Y) > log γ]`,

the expectations taken under the joint law of `P` and `V` and `i` the information density
(Polyanskiy–Wu, Theorem 25.2, pp. 493–495, stated there for `γ > 0`).

Route: draw `M` codewords independently from the output law `q` and add `y₀`; encode each `x` to
a codeword of least distortion. The average over codebooks of the code distortion is bounded as
in the cited proof: for each `x` and threshold `u`, the probability that every random codeword
has distortion above `u` is `(1 − δ)^M` with `δ` the `q`-probability of the outputs of
distortion at most `u`, and `(1 − δ)^M ≤ exp (−M/γ) + (1 − γ δ)⁺` with the change of measure from
`q` to `V x`; integrating over `u ∈ [0, e x y₀]` gives the three terms. Since the bound holds for
the average and every `γ`, one codebook meets it for every `γ` at once (a finite average is at
least its minimum). For `γ ≤ 0` the second term alone is at least `E e(X, y₀)`, because then
`exp (−M/γ) ≥ 1`, and the code that always uses `y₀` already meets the bound.

**Checks.**
- For the uniform law on two letters, the binary symmetric channel with crossover `0.1`, Hamming
  distortion, `y₀ = 0` and `M = 2`: at `γ = 2` the information densities `log 1.8 ≈ 0.5878` and
  `log 0.2` are below `log 2`, and the bound is `0.1 + (1/2) e^(−1) ≈ 0.2839`; at `γ = 1` it is
  `0.1 + (1/2) e^(−2) + 0.45 ≈ 0.6177`.
- Nonnegativity of `e` is needed: for `e` identically `−1` every code has distortion `−1`, while
  for `γ > 0` the right side is `−1 − exp (−M/γ) − P[i > log γ] < −1`.

*Needs:* 1.1 (definitions), 3.1; ChannelCoding 1.1 (`outputLaw`, `informationDensity`); Mathlib
`Real.one_sub_le_exp_neg`, `Fintype.prod_sum`. (Proved here, following the cited proof, with
finite averages in place of expectations over random codebooks.)

### 4.2 Achievability

Prove `eventually_exists_sourceCode`: if `B` is nonempty, `D > D_min` and `R > R(D)`, then for
all large `n` there are `M ≤ exp (n R)` and a code for blocks of `n` letters with `M` codewords
and expected per-letter distortion at most `D` (Polyanskiy–Wu, Theorem 25.1, p. 491, proof
pp. 496–497; El Gamal–Kim, Lecture 3, pp. 3–43 to 3–47).

Route: subtracting the least value of `d` from `d` shifts `D`, `D_min`, the code distortions and
the argument of `R` by the same constant, so take `d ≥ 0`. By continuity (1.4) there is `D'` with
`D_min < D' < D` and `R(D') < R`; let `W` attain `R(D')` (1.2), put `I = I(p, W)` and
`δ = (R − I)/3 > 0`. Apply 4.1 to `productLaw p n`, the product channel of `W` (ChannelCoding
1.4), `blockDistortion d n`, the constant word `y₀` at a letter attaining `D_max`,
`M_n = ⌈exp (n (I + 2δ))⌉` and `γ = exp (n (I + δ))`. The first term is at most `D'` (3.1), the
second at most `D_max · exp (−exp (n δ))`, and the third at most `max d` times the probability
that the information density of the words exceeds `n (I + δ)`. On pairs of positive mass that
density is the sum of the `n` independent letter densities, of mean `I` (ChannelCoding 1.1) and
variance `v`, so by Chebyshev's inequality the probability is at most `v / (n δ²)`. All three
extra terms tend to `0`, so for large `n` the distortion is at most `D`, and
`M_n + 1 ≤ exp (n (I + 2δ)) + 2 ≤ exp (n R)`.

**Checks.**
- `D > D_min` is needed: for `θ = 0.1`, `D = 0 = D_min` and `R = 0.5`, which exceeds
  `R(0) = h(0.1) ≈ 0.3251`, a code of distortion `0` must reproduce each of the `2ⁿ` words, all of
  positive probability, and `2ⁿ > exp (0.5 n)` for every `n ≥ 1`.
- A nonempty `B` is needed: for an empty one `D_min` and `R(D)` are junk values `0`, while no code
  for blocks of `n ≥ 1` letters exists.

*Needs:* 1.2, 1.4, 3.1, 4.1; ChannelCoding 1.1 (channelMutualInformation_eq_sum) and 1.4
(`productChannel`); Mathlib `MeasureTheory.Measure.pi`, `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.variance`, `ProbabilityTheory.IndepFun.variance_sum`,
`ProbabilityTheory.meas_ge_le_variance_div_sq`, `Nat.ceil_lt_add_one`.

### Examples

The binary symmetric test channel with crossover `0.1` for the random-coding bound; the Bernoulli
source with `θ = 0.1` at `D = 0`.

### Dependencies

1.1, 1.2, 1.4, 3.1; ChannelCoding 1.1 and 1.4; Mathlib `Real.one_sub_le_exp_neg`,
`Fintype.prod_sum`, `MeasureTheory.Measure.pi`, `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.variance`, `ProbabilityTheory.IndepFun.variance_sum`,
`ProbabilityTheory.meas_ge_le_variance_div_sq`, `Nat.ceil_lt_add_one`. Within the layer, 4.2 uses
4.1.

## Scope and ownership

This roadmap owns the statements above: the expected distortion of a test channel, the convexity
of mutual information in the channel, the rate-distortion function of a finite source with its
attainment, convexity, monotonicity, continuity and values at the two ends, its closed forms for
Bernoulli and uniform sources under Hamming distortion, source codes with their expected
distortion, single-letterization, the converse for blocks (through the one-shot bound), the
random-coding bound and achievability.

Stated by other roadmaps and consumed here:

- ChannelCoding 1.1 (the joint law and mutual information) defines channels as matrices, the
  joint law of an input law and a channel, the mutual information `channelMutualInformation`
  (the finite mutual information of ProbabilisticAndMetricNumberTheory §5.2 of the two
  coordinates), the output law and the information density, and proves the average formula and
  `I(p, W) = H(q) − ∑ a, p a · H(W a)`; its 1.4 defines the memoryless use of a channel. The
  definitions are copied verbatim into `Suggested.lean` with that citation. ChannelCoding proves
  concavity in the input law (its 1.2); convexity in the channel (1.1 above) is a different
  statement. Its Feinstein and random-coding bounds concern channel codes, which decode outputs
  into messages; 4.1 is a covering bound for source codes, a different statement, and neither is
  used for the other.
- ProbabilisticAndMetricNumberTheory §5.1a and §5.2 supply finite-label entropy, the
  chain rule, the alphabet bound, additivity for independent labels, and the finite mutual
  information with symmetry, `I = H(X) − H(X | Y)`, nonnegativity and the value `H(X)` for a
  label paired with itself.
- EntropyAndSourceCoding supplies, in its 1.1, relabelling, monotonicity, nonnegativity of
  conditional entropy and that conditioning on more reduces entropy, and in its 1.3 Fano's
  inequality. Its lossless source coding, typical sets and asymptotic equipartition are not used:
  the achievability route goes through Chebyshev's inequality.

Not treated here:

- MathematicalStatisticsNonparametric §2.4, Fano's method, bounds the error of
  estimating a uniform index through an average Kullback–Leibler divergence; nothing of it is
  used or restated. Its 1.3 states the joint convexity of the binary divergence `klBin`; the
  convexity used in the route of 1.1 is that of the unnormalized `(x, y) ↦ x log (x / y)` on
  `[0, ∞) × (0, ∞)`, a route step proved there and not a target.
- MeansMajorizationAndDiscreteInequalities states the log-sum inequality (its 6.3), of which the
  same route step is the two-term case; this roadmap does not depend on that one.
- LargeDeviations states the method of types and Sanov's theorem; the routes above use neither,
  and no statement here concerns types or empirical laws.
- DifferentialEntropyAndEntropyPower treats continuous laws; the Gaussian source with squared
  error, and every source on an infinite alphabet, are outside this roadmap.
- RenyiDivergenceAndPrivacy treats Rényi divergences; nothing here uses them.
- The combinatorial covering of Hamming space by balls is not stated here.

Already in the libraries and therefore not targets: the binary entropy with its symmetry,
monotonicity on `[0, 1/2]` and derivative (`Real.binEntropy` and its lemmas), `negMulLog` and
`t ↦ t log t` with their concavity and convexity, Jensen's inequality and its equality case,
continuity of convex functions on open sets, compactness of closed bounded sets, independence of
coordinates under product measures, variance and Chebyshev's inequality, and the Hamming distance
of words (`hammingDist`). Neither library has distortion measures, the rate-distortion function or
source codes with a fidelity criterion. Tau Ceti's Kullback–Leibler library
(`TauCeti/InformationTheory/KullbackLeibler/`) proves convexity of the divergence in its first
measure for a fixed reference (`TauCeti.klDiv_smul_add_smul_le`), which is not the joint convexity
that 1.1 needs, and is not used. Mathlib proves the data-processing inequality and the chain rule
for `InformationTheory.klDiv` (`InformationTheory.klDiv_map_le`,
`InformationTheory.klDiv_compProd_eq_add`), from which joint convexity can be derived; neither
library states joint convexity of the divergence or convexity of mutual information in the
channel, and 1.1 argues on the finite formula instead.

Outside the scope: the Blahut–Arimoto alternating minimization and every procedure for computing
`R(D)` or constructing codes; excess-distortion criteria, dispersion and error exponents of lossy
coding; the operational function at `D = D_min`; sources with memory, continuous alphabets and the
Gaussian source; joint source-channel coding; lossy coding with side information and multiterminal
problems; Kolmogorov's metric entropy.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`: `Real.convexOn_mul_log` (`t ↦ t log t`
  is convex on `[0, ∞)`), `Real.continuous_negMulLog`, `Real.strictConcaveOn_negMulLog`
  (strictly concave on `[0, ∞)`).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConvexOn.map_sum_le` (Jensen's inequality for finite
  sums with nonnegative weights summing to `1`), `StrictConcaveOn.map_sum_eq_iff` (equality in
  Jensen's inequality, with positive weights, exactly when all points equal their mean).
- `Mathlib/Analysis/Convex/Continuous.lean`: `ConvexOn.continuousOn_interior` (a convex function on
  a finite-dimensional space is continuous on the interior of its domain).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn`, `IsCompact.sInf_mem`.
  `Mathlib/Topology/Compactness/Compact.lean`: `IsCompact.image_of_continuousOn`.
  `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded`.
  `Mathlib/Topology/Sequences.lean`: `IsCompact.tendsto_subseq` (a sequence in a compact set of a
  metric space has a convergent subsequence with limit in the set).
- `Mathlib/Order/ConditionallyCompleteLattice/Basic.lean`: `csInf_le_csInf`.
- `Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`: `Real.binEntropy`,
  `Real.binEntropy_one_sub`, `Real.binEntropy_strictMonoOn` (strictly increasing on
  `[0, 1/2]`), `Real.binEntropy_two_inv` (`h(1/2) = log 2`), `Real.deriv_binEntropy`.
- `Mathlib/InformationTheory/Hamming.lean`: `hammingDist`.
- `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Fintype.prod_sum`.
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.one_sub_le_exp_neg` (`1 − x ≤ exp (−x)`).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`.
  `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun_pi`.
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`,
  `ProbabilityTheory.IndepFun.variance_sum`, `ProbabilityTheory.meas_ge_le_variance_div_sq`
  (Chebyshev's inequality on a finite measure).
- `Mathlib/Algebra/Order/Floor/Semiring.lean`: `Nat.ceil_lt_add_one`.

### From Tau Ceti

Nothing is consumed.

### From TauCetiRoadmap.ChannelCoding

- 1.1 (the joint law and mutual information): the definitions `IsChannel`, `jointMeasure`,
  `channelMutualInformation`, `outputLaw`, `informationDensity` (copied verbatim), the target
  channelMutualInformation_eq_sum (for a channel and nonnegative weights, `I(p, W)` is the
  average of the information density under the joint law), and the API formula
  `I(p, W) = H(q) − ∑ a, p a · H(W a)`, for alphabets with measurable singletons.
- 1.4 (memoryless use): the definition `productChannel W n` (used in routes only, not in
  `Suggested.lean`).

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §5.1a (finite-label entropy): `labelEntropy` (copied through ChannelCoding), the chain rule,
  the alphabet bound `H(X) ≤ log |A|`, additivity for independent labels.
- §5.2, the paragraph on finite mutual information: `finiteMutualInformation` (copied through
  ChannelCoding), symmetry, `I = H(X) − H(X | Y)`, nonnegativity, and `I(X, X) = H(X)`.

### From TauCetiRoadmap.EntropyAndSourceCoding

- 1.1 (joint labels and submodularity), its API: relabelling by an injective map, monotonicity,
  nonnegativity of conditional entropy, and `H(X | (Y, Z)) ≤ H(X | Y)`.
- 1.3 (Fano's inequality, its target condLabelEntropy_le_binEntropy_add_mul_log): for labels
  `X : Ω → A`, `Y : Ω → B` into finite types and any `g : B → A`, with `Pₑ = μ (g(Y) ≠ X)`,
  `H(X | Y) ≤ h(Pₑ) + Pₑ log (|A| − 1)`.

## References

- Yury Polyanskiy and Yihong Wu, *Information Theory: From Coding to Learning*, prepublication
  version of 16 August 2024, free to view and download from the first author's page at MIT; the
  theorem, definition and page numbers above are the printed ones of that version.
- Abbas El Gamal and Young-Han Kim, *Lecture Notes on Network Information Theory*,
  arXiv:1001.3404v4 (2010); page numbers are those printed on the slides of Lecture 3.
- Attributions made in prose without a locator: Claude E. Shannon (the rate-distortion function
  and the coding theorem for a source with a fidelity criterion, 1959).
