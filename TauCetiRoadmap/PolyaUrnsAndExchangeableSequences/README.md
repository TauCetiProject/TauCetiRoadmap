# Roadmap: Pólya urns and exchangeable sequences

**Summary.** An urn holds weight `a > 0` of white and `b > 0` of black. A ball is drawn with
probability proportional to weight, returned, and one more unit of its colour is added. The
weights need not be integers: an urn with `g` white and `r` black balls that adds `c > 0` balls of
the colour drawn is the case `a = g/c`, `b = r/c` after rescaling. This roadmap builds the theory
of the sequence of draws as a classical example of an exchangeable sequence that is not
independent. The draw sequence is defined by the probabilities of its finite prefixes, so no
conditional probability enters the definition.

The headline theorems, each for an urn with weights `a, b > 0`:

- The probability of a sequence of `n` draws with `k` white ones is
  `a(a+1)⋯(a+k−1) · b(b+1)⋯(b+n−k−1) / ((a+b)(a+b+1)⋯(a+b+n−1))`, which depends only on `k`;
  the draws are exchangeable, and the number of white draws among the first `n` has the
  beta-binomial law with parameters `n, a, b`.
- A measurable sequence of draws is a Pólya urn if and only if its law is that of coins flipped
  independently with a common bias drawn from `Beta(a, b)`. In the other direction, coins that
  are conditionally independent given a `Beta(a, b)` bias satisfy the rule of succession: after
  `k` heads in `n` flips the next is a head with probability `(a + k)/(a + b + n)`, which is
  Laplace's `(k + 1)/(n + 2)` for the uniform prior.
- The proportion of white weight is a martingale for the past draws. It converges almost surely,
  together with the frequency of white draws, to a limit with law `Beta(a, b)`; given this limit
  the draws are conditionally independent coin flips with that bias; and the proportion after `n`
  draws is the conditional expectation of the limit given those draws.

The roadmap builds on the exchangeability library that the completed Exchangeability roadmap put
into Tau Ceti (exchangeability, conditionally i.i.d. sequences, de Finetti's theorem, the strong
law for conditionally i.i.d. sequences), on the Beta and beta-binomial laws of Tau Ceti, and on
Mathlib's martingale convergence theorems and strong law. Layer 1 computes the law of the draws,
Layer 2 identifies it with the Beta mixture of coin flips, and Layer 3 proves the martingale
results and the conditional independence given the limit.

## Conventions

- Draws are `Bool`-valued, `true` meaning white. A process is `X : ℕ → Ω → Bool` on a measurable
  space `Ω` with a measure `μ`.
- `polyaWordProb a b w`, for a word `w : Fin n → Bool`, is the product over `i < n` of
  `c_i / (a + b + i)`, where `c_i = a + #{j < i | w j = true}` when `w i = true` and
  `c_i = b + #{j < i | w j = false}` otherwise. It is the empty product `1` when `n = 0`.
  Division is Mathlib's, with `x / 0 = 0`.
- `IsPolyaUrn μ X a b` holds when `0 < a`, `0 < b`, every `X i` is measurable, and for every `n`
  and every `w : Fin n → Bool` the event `{X 0 = w 0, …, X (n−1) = w (n−1)}` has probability
  `polyaWordProb a b w` (as `μ.real`). Taking `n = 0` gives `μ.real univ = 1`, so `μ` is a
  probability measure; no separate instance is assumed.
- `polyaUrnLaw a b` is the measure on `ℕ → Bool` obtained by drawing `p` from `Beta(a, b)` and
  then flipping i.i.d. coins with bias `p`: the bind of Mathlib's `betaMeasure a b` with
  `p ↦ (coinKernel (projIcc 0 1 p))^{⊗ℕ}`, where `coinKernel` is Tau Ceti's two-point law and
  `projIcc` clamps `p` into `[0, 1]` (the Beta law lives on `(0, 1)`).
- `drawFiltration X hX n` is `⨆ i < n, σ(X i)`, the σ-algebra of the draws strictly before
  time `n`; it is trivial at `n = 0`.
- `urnProportion a b X n ω = (a + Sₙ(ω)) / (a + b + n)` with `Sₙ(ω) = #{i < n | X i ω = true}`.
- Rising factorials are Mathlib's `ascPochhammer`: `x⁽ᵏ⁾ = x(x+1)⋯(x+k−1)`, `x⁽⁰⁾ = 1`.
- `I` is the unit interval. The limit proportion is a map `Θ : Ω → I`.

## Layer 1: the law of the draws

### 1.1 The word probability

For all real `a, b`, every `n` and every `w : Fin n → Bool` with `k` letters `true`,
`polyaWordProb a b w = a⁽ᵏ⁾ · b⁽ⁿ⁻ᵏ⁾ / (a + b)⁽ⁿ⁾` (`polyaWordProb_eq`). In particular the
word probability depends on `w` only through `k`.

The identity holds with no hypothesis on `a` and `b`, including when some `a + b + i` vanishes,
because both sides use the same convention `x / 0 = 0` for the same denominator.

(Proved here.) Write the product of quotients as the quotient of the two products
(`Finset.prod_div_distrib`, valid in every field with `0⁻¹ = 0`). The product of the
denominators `a + b + i` over `i < n` is `(a + b)⁽ⁿ⁾`, by induction on `n` from
`ascPochhammer_succ_eval`. Split the product of the numerators according to the colour of
`w i`. List the white positions in increasing order as `i₀ < i₁ < ⋯ < i_{k−1}` (the order
isomorphism of the filtered `Finset` with `Fin k`). Exactly `l` white positions precede `i_l`,
so the factor at `i_l` is `a + l` and the white factors multiply to `a⁽ᵏ⁾`. The same
argument for the `n − k` black positions gives `b⁽ⁿ⁻ᵏ⁾`.

*Needs:* Mathlib `Finset.prod_div_distrib`, `ascPochhammer_succ_eval`.

**Checks.**

- `n = 0`: both sides are `1`.
- `a = b = 1`, `w = (true, false, true)`: the product is `(1/2)·(1/3)·(2/4) = 1/12`, and
  `1⁽²⁾ · 1⁽¹⁾ / 2⁽³⁾ = 2 · 1 / 24 = 1/12`.
- Both sides agree for all words of length at most `6` and all pairs `a, b` in
  `{0, 1, −1, 1/2, −3/2, 2, −2, 5/3}`, including pairs with vanishing denominators.

### 1.2 Exchangeability

If `IsPolyaUrn μ X a b`, then `X` is exchangeable in Tau Ceti's sense
(`IsPolyaUrn.exchangeable`): for every `n` and every permutation `σ` of `Fin n`, the law of
`(X (σ 0), …, X (σ (n−1)))` equals the law of `(X 0, …, X (n−1))`.

(Proved here.) Both laws are finite measures on the finite set `Fin n → Bool`, so it suffices
that they agree on singletons (Mathlib `Measure.ext_of_singleton`). The block law gives `{w}`
the mass of the event `{X (σ i) = w i for all i}`, which is the prefix event of the word
`w ∘ σ⁻¹`. The word `w ∘ σ⁻¹` has the same number of letters `true` as `w`. By the definition
of `IsPolyaUrn` and 1.1 both masses are `ENNReal.ofReal` of the same real number. The maps are
measurable because every `X i` is.

*Needs:* 1.1; Mathlib `Measure.ext_of_singleton`; Tau Ceti `Exchangeable`.

**Checks.**

- The draws are not independent: for `a = 1`, `b = 2` the first two draws are both white with
  probability `(1/3)(2/4) = 1/6`, while the first is white with probability `1/3` and
  `(1/3)² = 1/9`.

### 1.3 The beta-binomial law of the white count

If `IsPolyaUrn μ X a b`, then for every `n` the number `Sₙ = #{i < n | X i = true}` has law
`betaBinomialMeasure n a b` (`IsPolyaUrn.map_card_eq_betaBinomialMeasure`).

(Proved here.) Both sides are finite measures on `ℕ`, so compare singletons. The event
`{Sₙ = k}` is the disjoint union of the prefix events of the words with `k` letters `true`.
There are `C(n, k)` such words, in bijection with the `k`-subsets of `Fin n`, and by 1.1 each
has probability `a⁽ᵏ⁾ b⁽ⁿ⁻ᵏ⁾ / (a + b)⁽ⁿ⁾`. For `x > 0` and every `m`,
`x⁽ᵐ⁾ = Γ(x + m)/Γ(x)` by induction on `m` from `Real.Gamma_add_one`. Hence the probability is
`C(n, k) · beta(a + k, b + n − k)/beta(a, b)` for `k ≤ n`, with `beta x y = Γ(x)Γ(y)/Γ(x+y)`.
This is the singleton mass of Tau Ceti `betaBinomialMeasure_real_singleton`. For `k > n` both
sides vanish, because `C(n, k) = 0`.

*Needs:* 1.1; Mathlib `Real.Gamma_add_one`, `Measure.ext_of_singleton`; Tau Ceti
`betaBinomialMeasure_real_singleton`.

**Checks.**

- `n = 0`: `S₀ = 0` and the beta-binomial law is the Dirac mass at `0`
  (Tau Ceti `betaBinomialMeasure_zero_trials`).
- `a = b = 1`: `Sₙ` is uniform on `{0, …, n}`, with each mass `1/(n + 1)`.
- For four pairs `(a, b)` and `n ≤ 6`, the sum of the word probabilities with `k` letters `true`
  equals `C(n, k) beta(a + k, b + n − k)/beta(a, b)` exactly, and the total is `1`.

### Examples

- Durrett's case `c = g = r = 1` is `a = b = 1`: each word with `m` whites among `n` has
  probability `m!(n − m)!/(n + 1)!`.
- Two draws from `a = b = 1` are both white with probability `1/3`, and two fair coins with
  probability `1/4`.

### Dependencies

Mathlib: `Finset.prod_div_distrib`, `ascPochhammer_succ_eval`, `Real.Gamma_add_one`,
`Measure.ext_of_singleton`. Tau Ceti: `Exchangeable`, `betaBinomialMeasure`,
`betaBinomialMeasure_real_singleton`.

## Layer 2: the Beta mixture of coin flips

### 2.1 The law of a Pólya urn

Let `0 < a`, `0 < b`, and let every `X i` be measurable. Then `IsPolyaUrn μ X a b` holds if and
only if the path law of `X`, the image of `μ` under `ω ↦ (X i ω)ᵢ`, is `polyaUrnLaw a b`
(`isPolyaUrn_iff_pathLaw_eq`). In particular Pólya urns exist: the coordinate process on
`ℕ → Bool` under `polyaUrnLaw a b` is one.

(Proved here.) The key computation is the mass of the cylinder `C_w` of paths beginning with a
word `w` of length `n` with `k` letters `true`. The kernel `p ↦ (coinKernel (projIcc 0 1 p))^{⊗ℕ}`
is measurable: compose Tau Ceti `measurable_infinitePi_const` with `coinKernel`, which is
measurable, and the clamp. So `Measure.bind_apply` writes `polyaUrnLaw a b (C_w)` as the
integral over `Beta(a, b)` of the product measure of `C_w`. By `Measure.infinitePi_pi` that
product measure is `θᵏ(1 − θ)ⁿ⁻ᵏ` with `θ = projIcc 0 1 p`. Beta-almost every `p` lies in `(0, 1)`
(Tau Ceti `ae_mem_Ioo_betaMeasure`), where the clamp is the identity. Tau Ceti
`integral_rpow_mul_one_sub_rpow_betaMeasure` gives `beta(a + k, b + n − k)/beta(a, b)`, which
is `polyaWordProb a b w`: for `x > 0`, `x⁽ᵐ⁾ = Γ(x + m)/Γ(x)` by induction on `m` from
`Real.Gamma_add_one`, so the quotient of Beta values is `a⁽ᵏ⁾ b⁽ⁿ⁻ᵏ⁾ / (a + b)⁽ⁿ⁾`, and 1.1
applies.

For the forward direction, the path law gives `C_w` the probability of the prefix event of `w`,
which is `polyaWordProb a b w`. So the two measures agree on every cylinder `C_w`, and both have
mass `1`. A measurable cylinder of Mathlib's `measurableCylinders` is determined by finitely many
coordinates, all below some `n`, so it is a finite disjoint union of cylinders `C_w` with `w` of
length `n`. The two measures therefore agree on `measurableCylinders`, a π-system generating the
product σ-algebra, and Mathlib `ext_of_generate_finite` makes them equal. For the converse, the
prefix event of `w` is the preimage of `C_w` under the path map, which is measurable because every
`X i` is. Its probability is `polyaUrnLaw a b (C_w) = polyaWordProb a b w`, and the positivity and
measurability fields are the hypotheses.

*Needs:* 1.1; Mathlib `Real.Gamma_add_one`, `Measure.bind_apply`,
`Measure.infinitePi_pi`, `measurableCylinders`, `isPiSystem_measurableCylinders`,
`generateFrom_measurableCylinders`, `ext_of_generate_finite`, `isProbabilityMeasureBeta`;
Tau Ceti `measurable_infinitePi_const`, `coinKernel`, `pathLaw`, `ae_mem_Ioo_betaMeasure`,
`integral_rpow_mul_one_sub_rpow_betaMeasure`. Source: Pemantle, §2.2, Lemma 2.5 and the
paragraph after it.

**Checks.**

- For `a, b ∈ {1, 2, 3, 4}` and all words of length at most `4`, the Beta integral
  `∫ θᵏ(1 − θ)ⁿ⁻ᵏ dBeta(a, b)` equals `polyaWordProb a b w` exactly; for `(a, b) = (1/2, 1/2)` and
  `(1/2, 3/2)`, `beta(a + k, b + n − k)/beta(a, b)` reduces exactly to the word probability.
- The hypothesis `0 < a` is needed for the converse direction: `betaMeasure 0 b` is the zero
  measure (Tau Ceti `betaMeasure_zero_left`), so `polyaUrnLaw 0 b = 0`. This is the path law of
  the zero measure, for which `IsPolyaUrn` fails at `n = 0`. The hypothesis `0 < b` is needed in
  the same way: Mathlib's `Real.Gamma_zero` gives `beta a 0 = 0`, so the Beta density vanishes,
  `betaMeasure a 0 = 0` and `polyaUrnLaw a 0 = 0`.

### 2.2 The rule of succession

Let `0 < a`, `0 < b`, let every `X i` be measurable, and let `Θ : Ω → I` have law `Beta(a, b)`,
that is, `μ.map (fun ω => (Θ ω : ℝ)) = betaMeasure a b`. If `X` is conditionally i.i.d. with
directing measure `ω ↦ coinKernel (Θ ω)` (Tau Ceti `ConditionallyIIDWith`), then
`IsPolyaUrn μ X a b` (`isPolyaUrn_of_conditionallyIIDWith`). Unfolding the last factor of the
product: given `k` white draws among the first `n`, the next draw is white with conditional
probability `(a + k)/(a + b + n)`.

(Proved here.) Since `betaMeasure a b` is a probability measure, it is not zero, so the map
`ω ↦ (Θ ω : ℝ)` is almost everywhere measurable (an image measure is zero otherwise) and `μ` is
a probability measure. Fix a word `w` of length `n` with `k` letters `true`. Apply the joint-law
identity of `ConditionallyIIDWith` to the injective index map `Fin.val : Fin n → ℕ`. Evaluated on
the product of the whole space with `{w}`, it gives the probability of the prefix event as the
integral of `∏ᵢ coinKernel (Θ ω) {w i} = Θ(ω)ᵏ (1 − Θ(ω))ⁿ⁻ᵏ`, using `coinKernel_apply_true` and
the complement for `false`. By the law of `Θ` this is `∫ tᵏ(1 − t)ⁿ⁻ᵏ dBeta(a, b)`, which
`integral_rpow_mul_one_sub_rpow_betaMeasure` evaluates as `beta(a + k, b + n − k)/beta(a, b)`.
As in 2.1, `x⁽ᵐ⁾ = Γ(x + m)/Γ(x)` for `x > 0` (induction from `Real.Gamma_add_one`) turns this
into `a⁽ᵏ⁾ b⁽ⁿ⁻ᵏ⁾ / (a + b)⁽ⁿ⁾`, which is `polyaWordProb a b w` by 1.1.

*Needs:* 1.1; Mathlib `isProbabilityMeasureBeta`, `Real.Gamma_add_one`; Tau Ceti
`ConditionallyIIDWith`, `coinKernel_apply_true`, `integral_rpow_mul_one_sub_rpow_betaMeasure`.
Source: Wagenmakers–Zabell–Gronau, eq. (1), for `a = b = 1` and `k = n`.

**Checks.**

- `a = b = 1`, `n` white draws: the next is white with probability `(n + 1)/(n + 2)`, and the
  next `m` are all white with probability `(n + 1)/(n + m + 1)`.
- Measurability of the draws is part of `IsPolyaUrn`, while `ConditionallyIIDWith` only asks for
  almost everywhere measurability. Take the coordinate process on `I × (ℕ → Bool)` under Tau Ceti's
  coin-flip mixture law with a `Beta(1, 1)` bias. Change `X 0` on a non-Borel subset of the null
  Borel set `{θ = 1/2}`; such subsets exist because that set is uncountable. The changed process
  still satisfies the hypothesis, by `ConditionallyIIDWith.congr_process`, but `X 0` is no longer
  measurable. So `hX` is not implied by the other hypotheses.

### Examples

- The coordinate process under `polyaUrnLaw 1 1` is the urn started with one ball of each colour;
  its count `Sₙ` is uniform on `{0, …, n}` by 1.3.

### Dependencies

Layer 1. Mathlib: `Real.Gamma_add_one`, `Measure.bind_apply`, `Measure.infinitePi_pi`,
`measurableCylinders`, `isPiSystem_measurableCylinders`, `generateFrom_measurableCylinders`,
`ext_of_generate_finite`, `isProbabilityMeasureBeta`. Tau Ceti: `measurable_infinitePi_const`, `coinKernel`,
`coinKernel_apply_true`, `pathLaw`, `ConditionallyIIDWith`, `ae_mem_Ioo_betaMeasure`,
`integral_rpow_mul_one_sub_rpow_betaMeasure`.

## Layer 3: the proportion martingale and its limit

### 3.1 The martingale

If `IsPolyaUrn μ X a b`, then `urnProportion a b X` is a martingale for `drawFiltration X`
(`IsPolyaUrn.martingale_urnProportion`).

(Proved here.) The measure `μ` is finite (its total mass is `1`). Each `urnProportion a b X n`
lies in `[0, 1]`, because `0 ≤ Sₙ ≤ n` and `a, b > 0`. It is a function of `X 0, …, X (n−1)`,
so it is measurable for the `n`-th σ-algebra, and it is integrable. By Mathlib `martingale_nat`
it remains to show that `Mₙ` is a version of `E[Mₙ₊₁ | 𝓕ₙ]`, where `Mₙ = urnProportion a b X n`
and `𝓕ₙ = drawFiltration X n`. We use `ae_eq_condExp_of_forall_setIntegral_eq`. The sets of `𝓕ₙ`
are the preimages of subsets of the finite set `Fin n → Bool` under the prefix map: these
preimages form a σ-algebra that contains each `σ(X i)`, `i < n`, and is contained in their
supremum. So each set of `𝓕ₙ` is a finite disjoint union of prefix events `E_w`, and it suffices
that `∫_{E_w} Mₙ₊₁ = ∫_{E_w} Mₙ`. Let `w` have `k` letters `true`. By the definition of
`polyaWordProb` (its last factor), `E_w ∩ {X n = true}` has probability
`P(E_w)·(a + k)/(a + b + n)` and `E_w ∩ {X n = false}` has probability
`P(E_w)·(b + n − k)/(a + b + n)`. On these two events `Mₙ₊₁` equals `(a + k + 1)/(a + b + n + 1)`
and `(a + k)/(a + b + n + 1)`. The weighted sum is
`P(E_w)·(a + k)(a + b + n + 1)/((a + b + n)(a + b + n + 1)) = P(E_w)·(a + k)/(a + b + n)`,
which is `∫_{E_w} Mₙ`.

*Needs:* Mathlib `martingale_nat`, `ae_eq_condExp_of_forall_setIntegral_eq`. Source: Durrett,
§4.3.2 (the one-step computation for an urn of integer contents).

**Checks.**

- The one-step identity
  `(a+k)/(a+b+n) · (a+k+1)/(a+b+n+1) + (b+n−k)/(a+b+n) · (a+k)/(a+b+n+1) = (a+k)/(a+b+n)`
  holds as an identity of rational functions, and `E[Mₙ₊₁; E_w] = Mₙ(w)·P(E_w)` holds exactly on
  all words of length at most `5` for `(a, b) = (1, 1)` and `(2/3, 5/2)`.
- The filtration must exclude the current draw. For the filtration `σ(X 0, …, X n)` the
  conditional expectation of `M₁` given time `0` is `M₁` itself. `M₁` takes the values
  `(a + 1)/(a + b + 1)` and `a/(a + b + 1)`, neither equal to `M₀ = a/(a + b)`.

### 3.2 Almost sure convergence and the Beta limit

If `IsPolyaUrn μ X a b`, there is a measurable `Θ : Ω → I` such that, almost surely,
`urnProportion a b X n → Θ` and `Sₙ/n → Θ`, and `Θ` has law `Beta(a, b)`
(`IsPolyaUrn.exists_tendsto_betaMeasure`).

(Proved here.) On path space let `Sₙ(x) = #{i < n | x i = true}` and
`L(x) = projIcc 0 1 (limsup Sₙ(x)/n)`. It is measurable by `Measurable.limsup`, and the set `G`
of paths on which `Sₙ(x)/n` converges is measurable by `measurableSet_exists_tendsto`. Put
`Θ = L ∘ (path map)`. Under the product measure of `coinKernel p` for `p ∈ (0, 1)`, the
indicators `1{x i = true}` are independent (Mathlib `iIndepFun_infinitePi`) and identically
distributed with mean `p`. By `strong_law_ae`, almost every path lies in `G` with limit `p`, so
`L = p` almost surely. Integrating over `p` against `Beta(a, b)`, which charges only `(0, 1)`,
shows that `polyaUrnLaw a b` gives `G ∩ {Sₙ/n → L}` full mass. It also gives the image of
`polyaUrnLaw a b` under `L` as the bind of `Beta(a, b)` with `p ↦ δ_p`, which is `Beta(a, b)`
(`Measure.bind_dirac`). Transport both facts to `Ω` by 2.1. Finally
`|Mₙ − Sₙ/n| ≤ (2a + b)/(a + b + n)` for `n ≥ 1`, which tends to `0`, so `Mₙ` has the same
limit. (Mathlib's martingale convergence theorem gives convergence of `Mₙ` directly, but not the
law of the limit.)

*Needs:* 2.1; Mathlib `Measurable.limsup`, `measurableSet_exists_tendsto`, `iIndepFun_infinitePi`,
`strong_law_ae`, `Measure.bind_apply`, `Measure.bind_dirac`; Tau Ceti `ae_mem_Ioo_betaMeasure`.
Source: Pemantle, §2.1, Theorem 2.1; Durrett, §4.3.2.

**Checks.**

- `a = b = 1`: the limit is uniform on `[0, 1]`, consistent with the uniform count law of 1.3.
- The bound `|Mₙ − Sₙ/n| ≤ (2a + b)/(a + b + n)` for `n ≥ 1` follows from `0 ≤ Sₙ ≤ n` and
  `Mₙ − Sₙ/n = a/(a + b + n) − Sₙ(a + b)/(n(a + b + n))`.

### 3.3 Conditional independence given the limit

Let `IsPolyaUrn μ X a b`, let `Θ : Ω → I` be measurable, and let `urnProportion a b X n → Θ`
almost surely. Then `X` is conditionally i.i.d. with directing measure `ω ↦ coinKernel (Θ ω)`
(`IsPolyaUrn.conditionallyIIDWith_limit`): given `Θ`, the draws are independent coin flips with
bias `Θ`.

(Proved here.) By 1.2 and de Finetti's theorem in Tau Ceti (`conditionallyIID_of_exchangeable`,
for the standard Borel space `Bool`), `X` is conditionally i.i.d. with some directing measure `ν`.
The strong law for conditionally i.i.d. sequences (`ConditionallyIIDWith.tendsto_average_ae`,
applied to the indicator of `true`) gives `Sₙ/n → ν(ω){true}` almost surely. Since
`|Mₙ − Sₙ/n| ≤ (2a + b)/(a + b + n)` for `n ≥ 1` (from `0 ≤ Sₙ ≤ n`), `Sₙ/n` and
`urnProportion a b X n` have the same limits, so `ν(ω){true} = Θ(ω)` almost surely. A
probability measure on `Bool` is determined by its mass at `true`, so `ν = coinKernel ∘ Θ`
almost surely (`coinKernel_apply_true`, Tau Ceti
`ProbabilityMeasure.ae_eq_of_forall_apply_ae_eq`). The map `coinKernel ∘ Θ` is measurable, and
`ConditionallyIIDWith.congr_directing` transfers the directing measure.

*Needs:* 1.2; Tau Ceti `conditionallyIID_of_exchangeable`,
`ConditionallyIIDWith.tendsto_average_ae`, `ConditionallyIIDWith.congr_directing`,
`coinKernel_apply_true`, `ProbabilityMeasure.ae_eq_of_forall_apply_ae_eq`. Source: Pemantle,
§2.2, the paragraph after Lemma 2.5.

**Checks.**

- The measurability of `Θ` is needed, because the directing measure of `ConditionallyIIDWith`
  must be measurable. Take the coordinate process under `polyaUrnLaw 1 1` and `Θ = L` of 3.2.
  Let `Θ'` equal `0` on a non-Borel subset of the uncountable null Borel set `{L = 1/2}` and
  `L` elsewhere. Then `Θ'` is an almost sure limit, but `coinKernel ∘ Θ'` is not measurable,
  since its mass at `true` recovers `Θ'`.

### 3.4 The proportion as a conditional expectation

Let `IsPolyaUrn μ X a b` and let `urnProportion a b X n → Θ` almost surely, with `Θ : Ω → I`.
Then for every `n`, `urnProportion a b X n = E[Θ | drawFiltration X n]` almost surely
(`IsPolyaUrn.urnProportion_ae_eq_condExp`). In Bayesian terms, `(a + k)/(a + b + n)` is the
posterior mean of the bias after `k` white draws in `n`.

(Proved here.) The martingale `M` of 3.1 takes values in `[0, 1]`, so it is uniformly
integrable: apply Mathlib `uniformIntegrable_of` with the threshold `2`, above which every
truncation vanishes. `Martingale.ae_eq_condExp_limitProcess` gives `Mₙ = E[M_∞ | 𝓕ₙ]` almost
surely, where `M_∞` is Mathlib's `limitProcess`. `Submartingale.ae_tendsto_limitProcess`
gives `Mₙ → M_∞` almost surely, and limits in `ℝ` are unique, so `M_∞ = Θ` almost surely.
`condExp_congr_ae` replaces `M_∞` by `Θ`. No measurability of `Θ` is assumed: `Θ` is an almost
everywhere limit of measurable maps, so it is almost everywhere measurable
(`aemeasurable_of_tendsto_metrizable_ae`).

*Needs:* 3.1; Mathlib `uniformIntegrable_of`, `Martingale.ae_eq_condExp_limitProcess`,
`Martingale.submartingale`, `Submartingale.ae_tendsto_limitProcess`, `tendsto_nhds_unique`,
`condExp_congr_ae`,
`aemeasurable_of_tendsto_metrizable_ae`.

**Checks.**

- `n = 0`: `drawFiltration X 0` is trivial and the statement reads `a/(a + b) = E[Θ]`, the mean
  of `Beta(a, b)` (Tau Ceti `integral_id_betaMeasure`).

### Examples

- The urn is exchangeable but its exchangeable σ-algebra is not trivial. The event
  `{limsup Sₙ/n ≤ 1/2}` is unchanged by finite permutations of the draws and has probability `1/2`
  for `a = b = 1`. The Hewitt–Savage zero–one law of Tau Ceti (`hewittSavage_trivial_of_iIndep`)
  therefore needs independence.

### Dependencies

Layers 1 and 2. Mathlib: `martingale_nat`, `ae_eq_condExp_of_forall_setIntegral_eq`,
`Measurable.limsup`, `measurableSet_exists_tendsto`, `iIndepFun_infinitePi`, `strong_law_ae`,
`Measure.bind_apply`, `Measure.bind_dirac`, `uniformIntegrable_of`,
`Martingale.ae_eq_condExp_limitProcess`, `Martingale.submartingale`,
`Submartingale.ae_tendsto_limitProcess`, `tendsto_nhds_unique`,
`condExp_congr_ae`, `aemeasurable_of_tendsto_metrizable_ae`. Tau Ceti:
`conditionallyIID_of_exchangeable`, `ConditionallyIIDWith.tendsto_average_ae`,
`ConditionallyIIDWith.congr_directing`, `coinKernel_apply_true`,
`ProbabilityMeasure.ae_eq_of_forall_apply_ae_eq`, `ae_mem_Ioo_betaMeasure`.

## Scope and ownership

This roadmap owns the Pólya urn: the five definitions of the Conventions and the nine theorems
1.1–3.4. They are written against the library built by the completed Exchangeability roadmap and
do not restate any of it.

Already in the library and used or cited, not restated:

- De Finetti's theorem for exchangeable sequences in a standard Borel space, the equivalence of
  exchangeability with mixtures of i.i.d. laws, and the uniqueness
  of directing measures; the binary case of de Finetti's theorem, with a mixing law on `[0, 1]`,
  is the instance `α = Bool`.
- The Hewitt–Savage zero–one law (`hewittSavage_trivial_of_iIndep`).
- The finite de Finetti bounds of Diaconis and Freedman
  (`ExchangeableAt.etvDist_prefixLaw_sampleWithReplacement_le` and its relatives). Their exact
  collision form and its attainment by distinct values are stated by the FiniteSamplingDiscrepancy
  roadmap.
- The coin-flip mixture `coinKernel` with its conditional independence, and the Beta and
  beta-binomial laws with their moments.

Not treated: urns with several colours and their Dirichlet limits, urns that also add balls of
the other colour (Friedman's urn) and generalised Pólya urns with a replacement matrix, the
Blackwell–MacQueen and Hoppe urns, rates of convergence and central limit theorems for the
proportion, and posterior laws beyond the posterior mean of 3.4.

## Exact supplier contracts

### From Mathlib

- `ascPochhammer_succ_eval` (`Mathlib/RingTheory/Polynomial/Pochhammer.lean`): in a semiring,
  `(ascPochhammer S (n+1)).eval k = (ascPochhammer S n).eval k * (k + n)`.
- `Finset.prod_div_distrib` (`Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`): in a
  division commutative monoid, `∏ (f i / g i) = (∏ f i) / (∏ g i)`.
- `Real.Gamma_add_one`, `Real.Gamma_zero` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`):
  `s ≠ 0` gives `Γ(s + 1) = s Γ(s)`, and `Γ(0) = 0`.
- `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.beta`, `isProbabilityMeasureBeta`
  (`Mathlib/Probability/Distributions/Beta.lean`): the Beta law on `ℝ`, a probability measure
  for `0 < α`, `0 < β`.
- `MeasureTheory.Measure.ext_of_singleton` (`Mathlib/MeasureTheory/Measure/Dirac/Basic.lean`):
  on a countable type, measures that agree on singletons are equal.
- `Measure.bind_apply`, `Measure.bind_dirac` (`Mathlib/MeasureTheory/Measure/GiryMonad.lean`):
  `(m.bind f) s = ∫⁻ a, f a s ∂m` for measurable `s` and almost everywhere measurable `f`, and
  `m.bind dirac = m`.
- `Measure.infinitePi_pi` (`Mathlib/Probability/ProductMeasure.lean`): for probability measures,
  the product measure of a finite box is the product of the masses.
- `iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean`): measurable
  functions of distinct coordinates are independent under `Measure.infinitePi`.
- `measurableCylinders`, `isPiSystem_measurableCylinders`, `generateFrom_measurableCylinders`
  (`Mathlib/MeasureTheory/Constructions/Cylinders.lean`), and `ext_of_generate_finite`
  (`Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean`): finite measures with equal total
  mass that agree on a generating π-system are equal.
- `ProbabilityTheory.strong_law_ae` (`Mathlib/Probability/StrongLaw.lean`): pairwise
  independent, identically distributed, integrable `X i` have averages converging almost surely
  to the mean.
- `Measurable.limsup` (`Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`) and
  `measurableSet_exists_tendsto`
  (`Mathlib/MeasureTheory/Constructions/Polish/StronglyMeasurable.lean`).
- `MeasureTheory.martingale_nat` (`Mathlib/Probability/Martingale/Basic.lean`): for a finite
  measure, a strongly adapted integrable sequence with `f i =ᵐ E[f (i+1) | 𝓕 i]` is a martingale.
  `MeasureTheory.Martingale.submartingale` (same file): a real martingale is a submartingale.
- `tendsto_nhds_unique` (`Mathlib/Topology/Separation/Hausdorff.lean`): limits in a Hausdorff
  space are unique.
- `MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq` and `condExp_congr_ae`
  (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`).
- `uniformIntegrable_of` (`Mathlib/MeasureTheory/Function/UniformIntegrable.lean`): for a finite
  measure, `1 ≤ p < ∞`, almost everywhere strongly measurable `f i` with uniformly small
  truncations above a threshold are uniformly integrable.
- `Martingale.ae_eq_condExp_limitProcess`, `Submartingale.ae_tendsto_limitProcess`
  (`Mathlib/Probability/Martingale/Convergence.lean`): for a finite measure, an `L¹`-bounded
  submartingale converges almost surely to `limitProcess`, and a uniformly integrable martingale
  is the conditional expectation of it.
- `aemeasurable_of_tendsto_metrizable_ae`
  (`Mathlib/MeasureTheory/Constructions/BorelSpace/Metrizable.lean`).

### From Tau Ceti

- `TauCeti.Probability.Exchangeable` (`TauCeti/Probability/Exchangeability/Basic.lean`) and
  `pathLaw` (`TauCeti/Probability/Process/PathLaw/Basic.lean`, `μ.map (fun ω i => X i ω)`).
- `ConditionallyIIDWith` (`TauCeti/Probability/Exchangeability/ConditionallyIID/Basic.lean`):
  a.e. measurable `X i`, a measurable directing measure `ν`, and for every injective
  `k : Fin m → ι` the joint law of `(ν, (X (k i))ᵢ)` is `∫ δ_{ν ω} ⊗ (ν ω)^{⊗m} dμ`.
- `coinKernel`, `coinKernel_apply_true`
  (`TauCeti/Probability/Exchangeability/ConditionallyIID/CoinFlips.lean`): `coinKernel p` is the
  law on `Bool` with mass `p` at `true`.
- `conditionallyIID_of_exchangeable` (`TauCeti/Probability/DeFinetti/Theorem.lean`): values in a
  nonempty standard Borel space, a finite measure, a.e. measurable coordinates.
- `ConditionallyIIDWith.tendsto_average_ae`
  (`TauCeti/Probability/Exchangeability/ConditionallyIID/StrongLaw.lean`): a finite measure and
  a bounded measurable `f`.
- `ConditionallyIIDWith.congr_directing`, `ConditionallyIIDWith.congr_process`
  (`TauCeti/Probability/Exchangeability/ConditionallyIID/Congr.lean`).
- `MeasureTheory.ProbabilityMeasure.ae_eq_of_forall_apply_ae_eq`
  (`TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Ext.lean`): a countably generated space.
- `TauCeti.MeasureTheory.measurable_infinitePi_const`
  (`TauCeti/MeasureTheory/Measure/ProductKernel.lean`).
- `ae_mem_Ioo_betaMeasure`, `betaMeasure_zero_left`,
  `integral_rpow_mul_one_sub_rpow_betaMeasure` (needs `0 < α`, `0 < β`, `0 < α + q`,
  `0 < β + s`), `integral_id_betaMeasure`
  (`TauCeti/Probability/Distributions/Beta/Basic.lean`).
- `betaBinomialMeasure`, `betaBinomialMeasure_real_singleton` (`0 < a`, `0 < b`),
  `betaBinomialMeasure_zero_trials` (`TauCeti/Probability/Distributions/BetaBinomial/Basic.lean`).
- Cited only: `hewittSavage_trivial_of_iIndep`
  (`TauCeti/Probability/Exchangeability/PathSpace/HewittSavage.lean`),
  `ExchangeableAt.etvDist_prefixLaw_sampleWithReplacement_le`
  (`TauCeti/Probability/Exchangeability/FiniteDeFinetti.lean`).

## References

- R. Durrett, *Probability: Theory and Examples*, 5th edition (online version of 11 January
  2019), §4.3.2 "Polya's Urn Scheme" (pp. 226–227: martingale, a.s. convergence, word
  probabilities and their invariance under rearrangement, the uniform and Beta limits) and §4.7
  (Theorem 4.7.9, de Finetti's theorem; Theorem 4.7.10, the `{0, 1}`-valued case).
- R. Pemantle, *A survey of random processes with reinforcement*, Probability Surveys 4 (2007),
  1–79, doi:10.1214/07-PS094, arXiv:math/0610076: §2.1, Theorem 2.1 (real `a, b > 0`, limit
  `Beta(a, b)`); §2.2, Lemma 2.5 and equation (2.5) (exchangeability and the word probability),
  with the conditional independence given the limit in the paragraph after it.
- G. Pólya, *Sur quelques points de la théorie des probabilités*, Annales de l'I. H. P. 1 (1930),
  no. 2, 117–161 (Numdam): the urn scheme of contagion, pp. 135–136.
- E.-J. Wagenmakers, S. Zabell and Q. F. Gronau, *J. B. S. Haldane's rule of succession*,
  Statistical Science 39 (2024), 346–354, doi:10.1214/23-STS912, arXiv:2307.09489: equation (1),
  Laplace's rule `(n + 1)/(n + 2)` after `n` agreeing instances under the uniform prior, and, in the
  paragraph after it, the probability `(n + 1)/(n + z′ + 1)` that `z′` further instances all agree.
