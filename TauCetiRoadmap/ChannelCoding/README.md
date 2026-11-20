# Roadmap: channel coding

**Summary.** This roadmap proves Shannon's noisy-channel coding theorem for discrete memoryless
channels. A channel from a finite input alphabet `A` to a finite output alphabet `B` is a matrix
`W` of transition probabilities, `W a b` being the probability of receiving `b` when `a` is sent,
and an input law is a probability vector `p` on `A`. A code with `M` messages is an encoder and a
decoder, judged by the probability that a message is decoded wrongly, for the worst message or
on average. Mutual information is measured in nats. No decoding procedure or construction of
codes is a target. The main theorems are these.

- *Capacity.* The mutual information `I(p, W)` of input and output is concave in the input law,
  and on a nonempty input alphabet it attains its supremum, the capacity `C(W)`. The memoryless
  use of `W` on words of length `n`, which sends each letter through `W` independently, has
  capacity `n C(W)`. The binary symmetric channel with crossover probability `δ` has capacity
  `log 2 − h(δ)`, and the binary erasure channel with erasure probability `ε` has capacity
  `(1 − ε) log 2`, where `h` is the binary entropy.
- *Coding bounds for one use of a channel.* For every input law `p`, every `M ≥ 1` and every
  `γ > 0` there is a code with `M` messages each of whose error probabilities is at most
  `P[i(X; Y) < log γ] + M/γ`, where `i(a; b) = log (W a b / q b)` is the information density and
  `q` the output law (Feinstein); taking `γ = M e^τ` gives Shannon's random-coding bound.
  Conversely, every code with `M` messages and average error probability `Pₑ` satisfies
  `(1 − Pₑ) log M ≤ C(W) + h(Pₑ)`.
- *A finite-blocklength bound.* For every input law `p`, word length `n ≥ 1`, `M ≥ 1` and `δ > 0`,
  the memoryless use of `W` has a code with `M` messages each of whose error probabilities is at
  most `v / (n δ²) + M exp (−n (I(p, W) − δ))`, where `v` is the variance of the information
  density.
- *The noisy-channel coding theorem.* If `R < C(W)` and the input alphabet is nonempty, then for
  every `ε > 0` and all large `n` there is a code for words of length `n` with at least
  `exp (n R)` messages each of whose error probabilities is at most `ε`. If `R > C(W)`, the
  average error probability of codes for words of length `n` with at least `exp (n R)` messages
  stays above a positive constant for all large `n`.

The entropy of a random variable with finitely many values and the finite mutual information
come from the roadmap ProbabilisticAndMetricNumberTheory; the mutual information of an input law
and a channel is that finite mutual information, evaluated on the joint law of input and output.
Fano's inequality, which drives the converse, comes from the roadmap EntropyAndSourceCoding.
Mathlib supplies Markov kernels, of which channels are the matrices, the binary entropy, product
measures and Chebyshev's inequality. The combinatorial bounds on codes in Hamming space are the
subject of the roadmap BoundsOnCodes.

Layer 1 below defines channels, mutual information and capacity, with concavity, attainment,
tensorization and the two closed forms. Layer 2 treats codes for one use of a channel and uses
Layer 1. Layer 3 treats the memoryless use of a channel, with the finite-blocklength bound and
both halves of the coding theorem, and uses Layers 1 and 2.

## Conventions

- **Alphabets.** Alphabets are finite types carrying a measurable space in which singletons are
  measurable (Mathlib `MeasurableSingletonClass`), so that every subset is measurable; words of
  length `n` are functions `Fin n → A` with the product measurable space. A statement that needs
  a nonempty input alphabet says so.
- **Channels and input laws.** A channel is a matrix `W : A → B → ℝ` with `IsChannel W`: its
  entries are nonnegative and each row sums to `1`. An input law is a vector `p : A → ℝ` with
  nonnegative entries summing to `1`; the set of input laws is written out as
  `{p | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1}` (it is the set Mathlib's `stdSimplex ℝ A` denotes, a
  name the pinned Mathlib deprecates in favour of the type `Convexity.StdSimplex ℝ A` of
  finitely supported weights, whose set of weight vectors is this set by
  `Convexity.StdSimplex.range_toFun_comp_weights`). A channel is the matrix of a Markov kernel
  from `A` to `B` (Mathlib `ProbabilityTheory.Kernel` with `ProbabilityTheory.IsMarkovKernel`),
  read off by Tau Ceti's `ProbabilityTheory.Kernel.toMatrix`; the matrix is used because every
  quantity below is a finite sum of its entries, and 1.1 states the correspondence.
- **Joint law and mutual information.** `jointMeasure p W` is the measure on `A × B` putting mass
  `p a · W a b` on `(a, b)`. Mutual information is `channelMutualInformation p W`, the finite
  mutual information `finiteMutualInformation μ X Y = H(X) + H(Y) − H((X, Y))` of the two
  coordinates `X = Prod.fst` and `Y = Prod.snd` under `μ = jointMeasure p W`, where `H` is the
  finite-label entropy `labelEntropy`. Both definitions are those of
  ProbabilisticAndMetricNumberTheory §5.1a and §5.2, copied into `Suggested.lean` with that
  citation; no second mutual information is defined.
- **Information density.** `outputLaw p W b = ∑ a, p a · W a b` is the output law `q`, and
  `informationDensity p W a b = log (W a b / q b)`. Where `p a · W a b > 0` also `q b > 0`, so
  the density is the logarithm of a positive number there; elsewhere Mathlib's conventions
  `x / 0 = 0` and `log 0 = 0` give a junk value, which every statement weights by `p a · W a b`
  or evaluates under the joint law, where those pairs have mass `0`.
- **Logarithms.** Logarithms are natural, so a noiseless binary channel has capacity `log 2`.
  `h` is Mathlib's `Real.binEntropy`, `h(x) = x log x⁻¹ + (1 − x) log (1 − x)⁻¹`, with `h ≤ log 2`.
- **Codes and errors.** A code `c : ChannelCode M X Y` for a channel `V : X → Y → ℝ` has an
  encoder `c.enc : Fin M → X` and a decoder `c.dec : Y → Fin M`; the decoder always returns a
  message (a decoder that may declare failure is no better: replacing the failure symbol by a
  fixed message raises no error probability). `errorProb V c m` is
  `∑ y with c.dec y ≠ m, V (c.enc m) y`, and `avgErrorProb V c = M⁻¹ ∑ m, errorProb V c m`. A
  code with `M ≥ 1` messages needs a nonempty input alphabet; a code with `0` messages exists
  only when the output alphabet is empty, and its average error is the junk value `0`.
- **Deterministic codes.** Polyanskiy–Wu allow randomized encoders and decoders. A randomized
  code whose encoder and decoder draw independent randomness is a mixture of deterministic codes,
  and its error probabilities are the corresponding averages; so the achievability statements
  below are the stronger form, and the weak converse 2.4 extends to it by averaging, since `h` is
  concave.
- **Memoryless use.** `productChannel W n x y = ∏ i, W (x i) (y i)` for words `x`, `y` of length
  `n`; it is a channel from `Fin n → A` to `Fin n → B`. A code for words of length `n` is a
  `ChannelCode M (Fin n → A) (Fin n → B)`, and its rate is `log M / n` nats per letter.

## Layer 1: channels, mutual information and capacity

### 1.1 The joint law, mutual information and information density

Define `IsChannel`, `jointMeasure`, `channelMutualInformation`, `outputLaw` and
`informationDensity` as in the conventions, with `labelEntropy` and `finiteMutualInformation`
copied from ProbabilisticAndMetricNumberTheory §5.1a and §5.2. Prove
`channelMutualInformation_eq_sum`: for a channel `W` and nonnegative weights `p`,

`I(p, W) = ∑ a, ∑ b, p a · W a b · i(a; b)`,

the average of the information density under the joint law (Polyanskiy–Wu, Definition 18.1 and
Proposition 18.2, p. 351, for general alphabets). The identity does not use `∑ a, p a = 1`; it is
applied to input laws.

API, proved here, for an input law `p` and a channel `W`:

- `jointMeasure p W` is a probability measure; its first marginal is `p` and its second is the
  output law `q`.
- A matrix `W` is a channel exactly when it is the matrix of a Markov kernel: for a Markov kernel
  `κ` from `A` to `B` the real entries of `ProbabilityTheory.Kernel.toMatrix κ` form a channel,
  and every channel is the matrix of the kernel `ProbabilityTheory.Kernel.ofPMF` of its rows
  (each row a `PMF.ofFintype`). For that kernel, `jointMeasure p W` is the composition-product
  `MeasureTheory.Measure.compProd` of the measure with masses `p a` and the kernel.
- `I(p, W) = H(q) − ∑ a, p a · H(W a)`, where `H(r) = ∑ b, negMulLog (r b)` for a probability
  vector `r` and `W a` is the row of `a`.
- `0 ≤ I(p, W) ≤ min (log |A|, log |B|)` for nonempty alphabets.
- `p ↦ I(p, W)` is continuous on the set of input laws.

Route: the singleton masses of the joint law are `p a · W a b`, those of its marginals `p a` and
`q b` (Mathlib `MeasureTheory.Measure.dirac_apply`, `ENNReal.toReal_ofReal`). By
`Real.negMulLog_mul`, `H((X, Y)) = H(p) + ∑ a, p a · H(W a)`, which gives the second bullet; the
displayed formula follows by expanding `H(q)`, dropping the pairs with `p a · W a b = 0`, which
contribute `0` to both sides. The lower bound is the nonnegativity of finite mutual information
(ProbabilisticAndMetricNumberTheory §5.2). For the upper bound, `I(p, W) ≤ H(q)` by the
second bullet, since the rows have nonnegative entropy, and `I(p, W) = H(p) − H(X | Y) ≤ H(p)`
by §5.2, each term `p_ab log (p_b / p_ab)` of the conditional entropy being nonnegative because
`p_ab ≤ p_b`; then `H ≤ log` of the number of values (§5.1a). Continuity follows from the second
bullet and `Real.continuous_negMulLog`. The kernel bullet unfolds `toMatrix`, `ofPMF` and
`compProd` on singletons (Mathlib `MeasureTheory.Measure.compProd_apply_prod`).

**Checks.**
- Z channel: `W 0 = (1, 0)` and `W 1 = (1/2, 1/2)`. For the uniform input law, `q = (3/4, 1/4)`
  and `I = h(1/4) − (1/2) log 2 ≈ 0.2158`; the double sum gives the same value. The plausible
  wrong definition `∑ a, ∑ b, p a · W a b · log (W a b)`, which is `−H(Y | X)`, gives
  `−(1/2) log 2 ≈ −0.3466`.
- For the noiseless channel on two letters (the identity matrix), `I(p, W) = H(p)`: `log 2` for
  the uniform law and `h(1/4) ≈ 0.5623` for `(3/4, 1/4)`.
- For an input law concentrated on one letter, `I(p, W) = 0` for every channel.

*Needs:* ProbabilisticAndMetricNumberTheory §5.1a (finite-label entropy and conditional entropy,
the bound by the logarithm of the number of values) and §5.2 (finite mutual information, its
nonnegativity and `I = H(X) − H(X | Y)`); Mathlib `MeasureTheory.Measure.dirac_apply`,
`ENNReal.toReal_ofReal`, `Real.negMulLog_mul`, `Real.continuous_negMulLog`,
`ProbabilityTheory.IsMarkovKernel`, `MeasureTheory.Measure.compProd`,
`MeasureTheory.Measure.compProd_apply_prod`, `PMF.ofFintype`; Tau Ceti
`ProbabilityTheory.Kernel.toMatrix`, `ProbabilityTheory.Kernel.ofPMF`. (Proved here.)

### 1.2 Concavity in the input law

Prove `concaveOn_channelMutualInformation`: for a channel `W`, the map `p ↦ I(p, W)` is concave
on the set of input laws (Polyanskiy–Wu, Theorem 5.3, first part, p. 92).

Route: by 1.1, `I(p, W) = H(q) − ∑ a, p a · H(W a)`. The output law `q` depends linearly on `p`,
`H` is concave on probability vectors because `negMulLog` is concave on `[0, ∞)` (Mathlib
`Real.concaveOn_negMulLog`), and the second term is linear in `p`.

**Checks.**
- For the binary symmetric channel with `δ = 0.1`, the two point masses give `I = 0` and the
  uniform law, their midpoint, gives `log 2 − h(0.1) ≈ 0.3681 > 0`.
- The map is not convex: the same three points violate convexity.

*Needs:* 1.1; Mathlib `Real.concaveOn_negMulLog`. (Proved here.)

### 1.3 Capacity

Define `channelCapacity W` as the supremum of `I(p, W)` over the input laws. Prove
`isGreatest_channelCapacity`: if `A` is nonempty and `W` is a channel, the capacity belongs to
the set of values `I(p, W)` and bounds it above, so some input law attains it (Polyanskiy–Wu,
Theorem 19.9 with (19.8), p. 377, where the supremum appears; MacKay, (9.10), p. 150, as a
maximum).

API, proved here: `0 ≤ C(W) ≤ min (log |A|, log |B|)` for nonempty alphabets, from 1.1.

Route: the set of input laws is closed and bounded in `A → ℝ`, hence compact
(`Metric.isCompact_of_isClosed_isBounded`), and nonempty because it contains the uniform law. By
continuity (1.1) its image is compact (`IsCompact.image_of_continuousOn`) and contains its
supremum (`IsCompact.sSup_mem`).

**Checks.**
- The hypothesis that `A` is nonempty is needed: for an empty input alphabet there is no input
  law, the supremum of the empty set is the junk value `0`, and it is not attained.
- The Z channel of 1.1 has capacity `log (5/4) ≈ 0.2231`, attained at the input law
  `(3/5, 2/5)` and not at the uniform law, where `I ≈ 0.2158`: the maximizing law need not be
  uniform.

*Needs:* 1.1; Mathlib `Metric.isCompact_of_isClosed_isBounded`,
`IsCompact.image_of_continuousOn`, `IsCompact.sSup_mem`. (Proved here.)

### 1.4 Memoryless use and tensorization

Define `productChannel W n`. Prove `channelCapacity_productChannel`: for a channel `W` and every
`n`, `C(productChannel W n) = n · C(W)` (Polyanskiy–Wu, Theorem 6.1(a), p. 106, and
Proposition 19.10, p. 377).

API, proved here: `productChannel W n` is a channel; for an input law `P` on words, the law of
the `i`-th output letter is the output law of the `i`-th marginal of `P`; and
`I(P, productChannel W n) ≤ ∑ i, I(Pᵢ, W)`, where `Pᵢ` is the `i`-th marginal of `P`.

Route: by 1.1, `I(P, Wⁿ) = H(Yⁿ) − ∑ x, P x · H(Wⁿ x)`, and the entropy of the product row
`Wⁿ x` is `∑ i, H(W (x i))` by additivity of entropy for independent labels
(ProbabilisticAndMetricNumberTheory §5.1a). Subadditivity `H(Yⁿ) ≤ ∑ i, H(Yᵢ)` follows by
induction on `n` from the nonnegativity of finite mutual information (§5.2) and the invariance
of `labelEntropy` under a bijection of the values (immediate from the definition). Together
these give the API inequality and hence `C(Wⁿ) ≤ n C(W)`. For the reverse inequality, the product
`P x = ∏ i, p (x i)` of a law `p` attaining `C(W)` (1.3) makes the output letters independent, so
the subadditivity is an equality. For `n = 0` both sides are `0`, and for an empty input alphabet
and `n ≥ 1` both capacities are the junk value `0`.

**Checks.**
- For the binary symmetric channel with `δ = 0.1` and `n = 2`, the input law uniform on
  `{00, 11}` gives `I ≈ 0.5144`, below `2 C ≈ 0.7361`; the product of uniform laws attains `2 C`.
- For `n = 0` the channel has one input and one output word, and its capacity is `0`.

*Needs:* 1.1, 1.3; ProbabilisticAndMetricNumberTheory §5.1a (additivity of entropy for
independent labels) and §5.2 (nonnegativity of finite mutual information); Mathlib
`Fintype.prod_sum`. (Proved here.)

### 1.5 The binary symmetric and binary erasure channels

Define `bsc δ : Fin 2 → Fin 2 → ℝ`, which keeps a bit with probability `1 − δ` and flips it with
probability `δ`, and `bec ε : Fin 2 → Fin 3 → ℝ`, which delivers the bit with probability
`1 − ε` and the erasure symbol `2` with probability `ε` (Polyanskiy–Wu, Table 19.1, p. 372;
MacKay, §9.3, p. 148). Prove, for parameters in `[0, 1]`:

- `channelCapacity_bsc`: `C(bsc δ) = log 2 − h(δ)`;
- `channelCapacity_bec`: `C(bec ε) = (1 − ε) log 2`

(Polyanskiy–Wu, §19.3, pp. 379–380).

Route: by 1.1, `I(p, bsc δ) = H(q) − h(δ) ≤ log 2 − h(δ)`, with equality for the uniform law,
which makes `q` uniform (Mathlib `Real.binEntropy_two_inv`). For the erasure channel
`q = ((1 − ε) p 0, (1 − ε) p 1, ε)`, so `H(q) = h(ε) + (1 − ε) H(p)` and every row has entropy
`h(ε)`; hence `I(p, bec ε) = (1 − ε) H(p) ≤ (1 − ε) log 2`, with equality for the uniform law.

**Checks.**
- `C(bsc 0.11) ≈ 0.3466` nats, about half a bit; `C(bsc (1/2)) = 0`; `C(bsc 0) = C(bsc 1) =
  log 2`, since a channel that always flips is noiseless. The erasure formula `(1 − δ) log 2`
  would wrongly give `0` at `δ = 1`.
- `C(bec 0.3) = 0.7 log 2 ≈ 0.4852`, and `C(bec 1) = 0`. For `ε = 1/2` and the input law
  `(3/4, 1/4)`, `I = (1/2) h(1/4) ≈ 0.2812`.
- The parameter must lie in `[0, 1]`: otherwise `bsc δ` has a negative entry and is not a
  channel.

*Needs:* 1.1, 1.3; Mathlib `Real.binEntropy`, `Real.binEntropy_two_inv`,
`Real.binEntropy_le_log_two`. (Proved here, following the cited computation.)

### Examples

The Z channel with `W 1 = (1/2, 1/2)` (capacity `log (5/4)`, non-uniform optimal input); the
binary symmetric channel with `δ = 0.1` and its use on pairs of letters; the noiseless channel on
two letters; the binary erasure channel with `ε = 0.3`.

### Dependencies

ProbabilisticAndMetricNumberTheory §5.1a and §5.2; Mathlib `MeasureTheory.Measure.dirac_apply`,
`ENNReal.toReal_ofReal`, `Real.negMulLog_mul`, `Real.continuous_negMulLog`,
`ProbabilityTheory.IsMarkovKernel`, `MeasureTheory.Measure.compProd`,
`MeasureTheory.Measure.compProd_apply_prod`, `PMF.ofFintype`,
`Real.concaveOn_negMulLog`, `Metric.isCompact_of_isClosed_isBounded`,
`IsCompact.image_of_continuousOn`, `IsCompact.sSup_mem`, `Fintype.prod_sum`, `Real.binEntropy`,
`Real.binEntropy_two_inv`, `Real.binEntropy_le_log_two`; Tau Ceti
`ProbabilityTheory.Kernel.toMatrix`, `ProbabilityTheory.Kernel.ofPMF`. No other layer.

## Layer 2: codes for one use of a channel

Throughout this layer `X` and `Y` are finite alphabets, `V : X → Y → ℝ` is a channel and `p` an
input law on `X`; probabilities of events about the information density are taken under
`jointMeasure p V`.

### 2.1 Codes and error probabilities

Define `ChannelCode M X Y`, `errorProb V c m` and `avgErrorProb V c` as in the conventions
(Polyanskiy–Wu, Definitions 17.1 and 17.2, pp. 342–343, with deterministic encoder and decoder).

API, proved here: each error probability lies in `[0, 1]`, and so does the average for `M ≥ 1`;
the average is at most the largest error probability; a code with one message has error
probability `0`.

**Checks.**
- The two error criteria differ: for the Z channel of 1.1, the code sending message `0` to
  `0` and `1` to `1` and decoding each output as itself has error probabilities `0` and `1/2`,
  so its largest error is `1/2` and its average `1/4`.
- For the noiseless channel on two letters, three messages cannot all be decoded: the best
  average error probability is `1/3`, and the best largest error probability is `1`.

*Needs:* nothing beyond the definitions. (Proved here.)

### 2.2 Feinstein's lemma

Prove `exists_errorProb_le`: for every input law `p`, every `M ≥ 1` and every `γ > 0` there is a
code with `M` messages such that, for every message `m`,

`errorProb V c m ≤ P[i(X; Y) < log γ] + M / γ`

(Polyanskiy–Wu, Theorem 18.7, p. 357, in the form of Remark 18.4, p. 357).

Route: if the right side is at least `1` every code will do. Otherwise put
`ε = P[i(X; Y) < log γ] + M/γ < 1`. For each input `x` with `p x > 0` let `E x` be the set of
outputs `y` with `V x y > 0` and `i(x; y) ≥ log γ`; then `q (E x) ≤ 1/γ`, since `q y ≤ V x y / γ`
on `E x`. Choose codewords greedily: as long as some `x` with `p x > 0` has `V x` giving
probability at least `1 − ε` to `E x` minus the decoding sets already chosen, add it with that
difference as its decoding set. When the procedure stops after `M'` steps, averaging the stopping
condition over `p` and the union bound give `ε < P[i(X; Y) < log γ] + M'/γ`, that is
`M' > γ (ε − P[i(X; Y) < log γ]) = M` (Theorem 18.7). Keep `M` of these codewords
and decode the outputs of the discarded decoding sets as one of the kept messages; this lowers no
kept message's success probability.

**Checks.**
- `γ > 0` is needed: with Lean's `log γ = log |γ|`, the noiseless channel on two letters, the
  uniform law, `M = 3` and `γ = −4` give the right side `1 − 3/4 = 1/4`, while every code with
  three messages has largest error probability `1`.
- `M ≥ 1` is needed: a code with no message has a decoder into the empty type, which does not
  exist when the output alphabet is nonempty.

*Needs:* 1.1 (definitions), 2.1. (Proved here, following the cited proof.)

### 2.3 Shannon's random-coding bound

For every input law `p`, every `M ≥ 1` and every real `τ` there is a code with `M` messages whose
average error probability is at most `P[i(X; Y) ≤ log M + τ] + exp (−τ)` (Polyanskiy–Wu,
Theorem 18.5, p. 354, stated there for `τ > 0` and decoders that may declare failure). This is a
consequence of 2.2 and is not a separate target: take `γ = M e^τ`, so that `log γ = log M + τ`
and `M/γ = e^(−τ)`; the event `i < log γ` lies in `i ≤ log γ`, and the average error is at most
the largest (2.1). As Polyanskiy–Wu observe after Remark 18.4 (p. 358), the two bounds have the
same form; Shannon's own proof draws the codewords independently from `p` and decodes by
thresholding the information density at `log M + τ`, using that an unsent codeword exceeds the
threshold with probability at most `exp (−(log M + τ))` (Polyanskiy–Wu, Corollary 18.4, p. 353).

**Checks.**
- For the binary symmetric channel with `δ = 0.1` used on words of length `3`, the uniform input
  law and `M = 2`, the bound is `≈ 0.6389` at `τ = 1`, while the best code (repetition) has
  average error `0.028`.

*Needs:* 2.1, 2.2.

### 2.4 The weak converse

Prove `one_sub_avgErrorProb_mul_log_le`: every code with `M` messages for `V`, with average error
probability `Pₑ`, satisfies

`(1 − Pₑ) log M ≤ C(V) + h(Pₑ)`

(Polyanskiy–Wu, Theorem 17.3, p. 348).

Route: let the message `U` be uniform on `Fin M` and the output `Y` have law `V (c.enc U)`, on
the finite space `Fin M × Y` with masses `M⁻¹ V (c.enc m) y`. Fano's inequality
(EntropyAndSourceCoding 1.3) with the estimate `c.dec Y` gives
`H(U | Y) ≤ h(Pₑ) + Pₑ log (M − 1)`. Since `H(U) = log M`, the finite mutual information
equals `H(U) − H(U | Y)` (ProbabilisticAndMetricNumberTheory §5.2) and `log (M − 1) ≤ log M`
(also for `M = 1`, where `log 0 = 0`), `log M ≤ I(U; Y) + h(Pₑ) + Pₑ log M`. By symmetry
(§5.2) and the chain rule (§5.1a), `I(U; Y) = H(Y) − H(Y | U)`; given the codeword the output
does not depend on the message, so `H(Y | U)` equals `∑ x, p' x · H(V x)` for the law `p'` of the
codeword, and by 1.1 `I(U; Y) = I(p', V) ≤ C(V)`. For `M = 0` both sides are junk values,
`0 ≤ C(V)`.

**Checks.**
- For the noiseless channel on two letters (capacity `log 2`) the code with two messages and no
  error gives equality, `log 2 = log 2 + h(0)`. With three messages the best average error is
  `1/3`, and `(2/3) log 3 ≈ 0.7324` is at most `log 2 + h(1/3) ≈ 1.3297`; without the term
  `h(Pₑ)` the inequality would fail, since `0.7324 > log 2 ≈ 0.6931`.

*Needs:* 1.1, 1.3 (the definition of capacity and `I(p', V) ≤ C(V)`), 2.1;
EntropyAndSourceCoding 1.3 (Fano's inequality); ProbabilisticAndMetricNumberTheory §5.1a (the
entropy `log M` of a uniform label, the chain rule) and §5.2 (symmetry and
`I = H(U) − H(U | Y)`); Mathlib `Real.binEntropy`. (Proved here.)

### Examples

The Z channel and the noiseless channel on two letters for the two error criteria and the weak
converse; the binary symmetric channel on words of length `3` for Shannon's bound.

### Dependencies

1.1, 1.3; EntropyAndSourceCoding 1.3; ProbabilisticAndMetricNumberTheory §5.1a and §5.2; Mathlib
`Real.binEntropy`. Within the layer, 2.2 and 2.4 use 2.1, and 2.3 uses 2.1 and 2.2.

## Layer 3: the coding theorem for discrete memoryless channels

Throughout this layer `A` and `B` are finite alphabets and `W : A → B → ℝ` is a channel; codes
for words of length `n` are codes for `productChannel W n`.

### 3.1 A finite-blocklength bound

Prove `exists_errorProb_productChannel_le`: for every input law `p`, every `n`, every `M ≥ 1` and
every `δ > 0` there is a code for words of length `n` with `M` messages such that, for every
message,

`errorProb (productChannel W n) c m ≤ v / (n δ²) + M exp (−n (I(p, W) − δ))`,

where `v` is the variance (Mathlib `ProbabilityTheory.variance`) of the information density under
`jointMeasure p W`. For `n = 0` the first term is Lean's `v / 0 = 0` and the bound is `M ≥ 1`.

Route: apply 2.2 to `productChannel W n`, the product input law `x ↦ ∏ i, p (x i)` and
`γ = exp (n (I(p, W) − δ))`. Under this input law the joint law of the input and output words is
the image of the product measure `Measure.pi (fun _ => jointMeasure p W)` under the regrouping of
`Fin n → A × B` as `(Fin n → A) × (Fin n → B)`; its output law is the product of the output laws,
so on the pairs of positive mass the information density of the words is the sum of the
information densities of the letters, and these are independent
(`ProbabilityTheory.iIndepFun_pi`) with mean `I(p, W)` (1.1) and variance `v`. By additivity of
the variance (`ProbabilityTheory.IndepFun.variance_sum`) and Chebyshev's inequality
(`ProbabilityTheory.meas_ge_le_variance_div_sq`) with `c = n δ`, the probability that the sum is
below `n (I(p, W) − δ)` is at most `n v / (n δ)² = v / (n δ²)` for `n ≥ 1`. (Proved here: the
source proves the asymptotic statement 3.2 from Shannon's bound 2.3 and the weak law of large
numbers, Polyanskiy–Wu, Theorem 19.8, p. 376; the explicit bound is the same argument with
Feinstein's lemma in place of Shannon's bound and Chebyshev's inequality in place of the weak
law.)

**Checks.**
- For the binary symmetric channel with `δ = 0.1` and the uniform input law,
  `v = 0.09 (log 9)² ≈ 0.4345` and `I ≈ 0.3681`. With `n = 1000` and the slack `0.05`, every
  `M ≤ exp (1000 · 0.2681)` admits a code of rate about `0.268` nats per letter whose error
  probabilities are at most `0.1738 + e^(−50) ≈ 0.1738`.
- For the noiseless channel on two letters and the uniform law, `v = 0` and `I = log 2`; the
  bound `M 2^(−n) e^(nδ)` is at least `1` once `M > 2^n`, where no code of length `n` is free of
  errors.
- `δ > 0` is needed: for that noiseless channel, `n = 1`, `M = 3` and `δ = −2` the right side is
  `3 e^(−(log 2 + 2)) ≈ 0.2030`, while every code with three messages has largest error
  probability `1`.

*Needs:* 1.1, 1.4 (the product channel), 2.2; Mathlib `MeasureTheory.Measure.pi`,
`ProbabilityTheory.iIndepFun_pi`, `ProbabilityTheory.variance`,
`ProbabilityTheory.IndepFun.variance_sum`, `ProbabilityTheory.meas_ge_le_variance_div_sq`.

### 3.2 Achievability

Prove `eventually_exists_errorProb_le`: if `A` is nonempty, `R < C(W)` and `ε > 0`, then for all
large `n` there are `M ≥ exp (n R)` and a code for words of length `n` with `M` messages each of
whose error probabilities is at most `ε` (Polyanskiy–Wu, Theorem 19.9, p. 377, with the maximal
error through Corollary 19.5, p. 375; MacKay, §10.1, part 1, p. 162).

Route: if `R ≤ 0`, one message suffices and has error `0`. If `R > 0`, take an input law attaining
`C(W)` (1.3), `δ = (C(W) − R)/2` and `M = ⌈exp (n R)⌉ ≤ 2 exp (n R)` (Mathlib
`Nat.ceil_lt_add_one`); by 3.1 every error probability is at most
`v / (n δ²) + 2 exp (−n δ)`, which is below `ε` for all large `n`.

**Checks.**
- The nonempty input alphabet is needed: for an empty one every map `W` is a channel, the
  capacity is the junk value `0`, and for `R < 0` and `n ≥ 1` there is no code with at least
  `exp (n R) > 0` messages, since there is no input word.

*Needs:* 1.3, 3.1; Mathlib `Nat.ceil_lt_add_one`.

### 3.3 The converse

Prove `exists_pos_le_avgErrorProb`: if `R > C(W)`, there is `η > 0` such that for all large `n`
every code for words of length `n` with at least `exp (n R)` messages has average error
probability at least `η` (the argument of the proof of Polyanskiy–Wu, Theorem 19.7, p. 376,
which applies Theorem 17.3 to words of length `n`; the theorem itself, p. 375, bounds the lim inf
of the rate).

Route: by 2.4 for `productChannel W n` and 1.4, `(1 − Pₑ) log M ≤ n C(W) + log 2`
(`Real.binEntropy_le_log_two`). Since `R > C(W) ≥ 0`, `log M ≥ n R > 0`, so
`Pₑ ≥ 1 − C(W)/R − log 2/(n R)`, which is at least `η = (1 − C(W)/R)/2` once
`n ≥ 2 log 2/(R − C(W))`.

**Checks.**
- For the binary erasure channel with `ε = 1/2` (capacity `(1/2) log 2`) and `R = log 2`, every
  code for words of length `n ≥ 4` with at least `2^n` messages has average error probability at
  least `1/2 − 1/n ≥ 1/4`.

*Needs:* 1.4, 2.4; Mathlib `Real.binEntropy_le_log_two`.

### Examples

The binary symmetric channel with `δ = 0.1` at `n = 1000`; the noiseless channel on two letters;
the binary erasure channel with `ε = 1/2` at rate `log 2`.

### Dependencies

1.1, 1.3, 1.4, 2.2, 2.4; Mathlib `MeasureTheory.Measure.pi`, `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.variance`, `ProbabilityTheory.IndepFun.variance_sum`,
`ProbabilityTheory.meas_ge_le_variance_div_sq`, `Nat.ceil_lt_add_one`,
`Real.binEntropy_le_log_two`.

## Scope and ownership

This roadmap owns the statements above: channels on finite alphabets as matrices, their joint
law with an input law, the information density, capacity with its concavity, attainment and
tensorization, the capacities of the binary symmetric and erasure channels, codes with their
largest and average error probabilities, Feinstein's and Shannon's bounds, the weak converse, the
finite-blocklength bound and both halves of the noisy-channel coding theorem.

Stated by roadmaps on main and consumed here:

- ProbabilisticAndMetricNumberTheory §5.1a defines the finite-label entropy and conditional
  entropy, with the chain rule, the bounds `0 ≤ H(X) ≤ log |A|` and additivity for independent
  labels; the paragraph on finite mutual information in its §5.2 defines
  `I(X, Y) = H(X) + H(Y) − H((X, Y))` and proves symmetry, `I = H(X) − H(X | Y)` and
  nonnegativity. The mutual information of an input law and a channel is this finite mutual
  information of the two coordinates under the joint law; the two definitions are copied into
  `Suggested.lean` with that citation, and none of the facts is restated.
- MathematicalStatisticsNonparametric §2.4 (Fano's method) defines `mutualInfoUniform`, the
  average Kullback–Leibler divergence of a finite family of laws from their mixture, valued in
  `ℝ≥0∞` on an arbitrary measurable space: the mutual information between a uniformly
  distributed index and an observation. For the laws `V (c.enc m)` of a code on a finite output
  alphabet it is the quantity `I(U; Y)` of the route of 2.4, here computed as a finite mutual
  information and never defined a second time. Its `fano_average` bounds the average error of
  every randomized decoder through `(1 − Pₑ) log M ≤ I(U; Y) + log 2` for `M ≥ 2`. The weak
  converse 2.4 is a different statement: it has `h(Pₑ)` in place of `log 2` and the capacity in
  place of `I(U; Y)`, holds for every `M`, and is proved from Fano's inequality of
  EntropyAndSourceCoding. Nothing of §2.4 is used here, and nothing here is used there.

Consumed from EntropyAndSourceCoding: its 1.3, Fano's inequality for a label and an arbitrary
estimate, in the route of 2.4. Its typical sets and asymptotic equipartition property (its 3.1)
are not used: the route of 3.1 goes through Chebyshev's inequality instead.

Not treated here:

- The combinatorial bounds relating length, size and minimum Hamming distance of block codes are
  the subject of the roadmap BoundsOnCodes; no statement here involves Hamming distance, and no
  rate–distance bound is stated.
- DifferentialEntropyAndEntropyPower leaves the capacity of the Gaussian channel outside its
  scope; it is outside this one too, which treats finite alphabets only.

Already in the libraries and therefore not targets: the binary entropy function
(`Real.binEntropy`), `negMulLog` with its concavity and continuity, independence and variance of
real random variables with Chebyshev's inequality, the Kullback–Leibler divergence
(`InformationTheory.klDiv`, not used here), and Markov kernels, which are channels in the
general sense: 1.1 identifies a channel matrix with the Markov kernel it comes from through Tau
Ceti's `ProbabilityTheory.Kernel.toMatrix` and `ProbabilityTheory.Kernel.ofPMF`, and the joint
law with Mathlib's `MeasureTheory.Measure.compProd`. Neither library has the mutual information
of a channel, its capacity, or codes with their error probabilities; Tau Ceti's coding library
(`TauCeti/InformationTheory/Coding/`) treats linear codes and Hamming distance, not channels.

Outside the scope: error exponents (Gallager's random-coding exponent and the reliability
function), the strong converse and channel dispersion; channels with memory, feedback or
continuous alphabets; zero-error capacity; linear codes for channels; decoding procedures and
their complexity; rate–distortion theory and channels with several users.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/Dirac/Def.lean`: `MeasureTheory.Measure.dirac_apply` (with
  measurable singletons, `dirac a s` is `1` or `0` according as `a ∈ s`).
  `Mathlib/Basic/ENNReal/Basic.lean`: `ENNReal.toReal_ofReal` (`(ofReal r).toReal = r` for `r ≥ 0`).
- `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`: `Real.negMulLog`,
  `Real.negMulLog_mul` (`negMulLog (x y) = y negMulLog x + x negMulLog y`),
  `Real.continuous_negMulLog`, `Real.concaveOn_negMulLog` (concave on `[0, ∞)`).
- `Mathlib/Probability/Kernel/Defs.lean`: `ProbabilityTheory.IsMarkovKernel`.
  `Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`:
  `MeasureTheory.Measure.compProd` (the joint law `μ ⊗ₘ κ`) and
  `MeasureTheory.Measure.compProd_apply_prod` (its value on a rectangle, for s-finite `μ`, `κ`).
  `Mathlib/Probability/ProbabilityMassFunction/Constructions.lean`: `PMF.ofFintype`.
- `Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`: `Real.binEntropy`,
  `Real.binEntropy_two_inv` (`h(1/2) = log 2`), `Real.binEntropy_le_log_two` (`h ≤ log 2` on
  all of `ℝ`).
- `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded` (closed
  bounded sets of a proper space are compact). `Mathlib/Topology/Compactness/Compact.lean`:
  `IsCompact.image_of_continuousOn`. `Mathlib/Topology/Order/Compact.lean`: `IsCompact.sSup_mem`
  (a nonempty compact set of reals contains its supremum).
- `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Fintype.prod_sum` (a product of sums over a
  finite type is the sum over functions of the products).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi` (the product of
  finitely many measures). `Mathlib/Probability/Independence/Basic.lean`:
  `ProbabilityTheory.iIndepFun_pi` (the coordinates are independent under a product of
  probability measures).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`,
  `ProbabilityTheory.IndepFun.variance_sum` (the variance of a sum of pairwise independent square
  integrable variables is the sum of the variances),
  `ProbabilityTheory.meas_ge_le_variance_div_sq` (Chebyshev's inequality on a finite measure).
- `Mathlib/Algebra/Order/Floor/Semiring.lean`: `Nat.ceil_lt_add_one` (`⌈a⌉ < a + 1` for `a ≥ 0`).

### From Tau Ceti

- `TauCeti/Probability/Kernel/Matrix.lean`: `ProbabilityTheory.Kernel.toMatrix` (the matrix of
  singleton masses of a kernel, in `ℝ≥0`). `TauCeti/Probability/Kernel/PMF.lean`:
  `ProbabilityTheory.Kernel.ofPMF` (the Markov kernel with given rows, on a countable source with
  measurable singletons). Both are used only in the kernel bullet of 1.1.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §5.1a (finite-label entropy): the finite-label entropy (copied as `labelEntropy`) and
  conditional entropy, the bounds `0 ≤ H(X) ≤ log |A|` for a nonempty alphabet (its target
  labelEntropy_nonneg_le_log_card) and `H((X, Y)) = H(X) + H(Y)` for independent labels (its
  target labelEntropy_pair_of_indepFun). These are stated for measurable labels into finite types
  on a probability space, with natural logarithms, as here.
- §5.2, the paragraph defining finite mutual information (copied as `finiteMutualInformation`):
  it is symmetric, equals `H(X) − H(X | Y)` and is nonnegative.

### From TauCetiRoadmap.EntropyAndSourceCoding

- 1.3, Fano's inequality (its target condLabelEntropy_le_binEntropy_add_mul_log): for measurable
  labels `X : Ω → A`, `Y : Ω → B` into finite types on a probability space and any map
  `g : B → A`, with `Pₑ = μ (g(Y) ≠ X)`, `H(X | Y) ≤ h(Pₑ) + Pₑ log (|A| − 1)`.

## References

- Yury Polyanskiy and Yihong Wu, *Information Theory: From Coding to Learning*, prepublication
  version of 16 August 2024 (730 pages), free to view and download from the first author's page at
  MIT; the theorem, definition and page numbers above are the printed ones of that version.
- David J. C. MacKay, *Information Theory, Inference, and Learning Algorithms*, Cambridge
  University Press, 2003, the edition viewable on the author's page; page numbers are the printed
  ones.
- Attributions made in prose without a locator: Claude E. Shannon (the coding theorem, the
  capacity formula and the random-coding argument, 1948); Amiel Feinstein (the maximal-coding
  lemma); Robert M. Fano (his inequality).
