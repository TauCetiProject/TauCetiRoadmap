# Roadmap: poisson approximation

**Summary.** This roadmap develops explicit bounds in total variation between the law of a
count of events and a Poisson law with the same mean. The count is the number of indicators
equal to one in a finite family whose joint law is arbitrary; the bounds are stated in terms of
the success probabilities, the probabilities that two events occur together, a dependency
structure or a monotone coupling, and the variance of the count. Total variation is taken in
the normalization in which two probability laws are at distance at most `2`: the sum over `k`
of the absolute differences of the masses at `k`.

- *The bound of Barbour and Hall, and Le Cam's inequality.* If `W` is a sum of independent
  indicators with success probabilities `p₁, …, pₘ` and `λ = p₁ + ⋯ + pₘ > 0`, the law of `W`
  is within `2 (1 − e^(−λ))/λ · ∑ pᵢ²` of the Poisson law of mean `λ`. Since the factor is at
  most `1`, this contains Le Cam's bound `2 ∑ pᵢ²`.
- *The local dependence theorem of Arratia, Goldstein and Gordon.* Let each index `i` have a
  neighbourhood `Nᵢ` containing `i` such that the `i`-th indicator is independent of the family
  of indicators outside `Nᵢ`. Then the law of `W` is within `2 (1 − e^(−λ))/λ · (b₁ + b₂)` of
  the Poisson law of mean `λ`, where `b₁` sums `pᵢ pⱼ` and `b₂` sums the probabilities that the
  `i`-th and `j`-th events both occur, over `i` and `j ∈ Nᵢ` (with `j ≠ i` in `b₂`).
- *Monotone couplings.* If for every `i` whose event has positive probability the family can be
  coupled with the family conditioned on the `i`-th event so that no other indicator increases,
  the law of `W` is within `2 (1 − e^(−λ))/λ · (λ − Var W)` of the Poisson law of mean `λ`.
- *Three classical counts.* Among `n` people with birthdays independent and uniform on `d ≥ 1`
  days, the number of pairs sharing a birthday is within `2 (1 − e^(−λ)) (4n − 7)/d` of the
  Poisson law of mean `λ = n(n − 1)/(2d)`. The number of fixed points of a uniform permutation
  of `n` letters is within `2^(n+1)/(n + 1)!` of the Poisson law of mean `1`. When `k` balls fall
  independently and uniformly into `n ≥ 1` boxes, the number of empty boxes is within
  `2 (1 − e^(−λ))/λ · (λ² − n(n − 1)(1 − 2/n)^k)` of the Poisson law of mean
  `λ = n(1 − 1/n)^k`.

The roadmap builds on Mathlib's total variation distance between finite measures and its
Poisson law on the natural numbers, and on Tau Ceti's description of total variation through
events, its couplings, its Poisson-binomial law (the law of a sum of
independent indicators) and its size-bias identity for the Poisson law. StandardDistributions
plans the Poisson-binomial law, which Tau Ceti already provides, and MarkovChainsAndRenewal the
expression of total variation on a countable space through masses, which no route here needs.

## How to read the build

Layer 1 below characterizes total variation on a countable space by couplings; it depends on no
other layer. Layer 2 treats the Stein equation of the Poisson law: the characterization of the
Poisson law through it, its explicit solution and the two bounds on that solution; it depends on
no other layer. Layer 3 proves the general bounds for counts of events: the local dependence
theorem and the theorem on monotone couplings rest on Layer 2, the bound of Barbour and Hall is
the case of independent events of the local dependence theorem, and Le Cam's inequality
follows from it and is also proved by coupling, from Layer 1. Layer 4 applies Layer 3 to birthdays (through the local
dependence theorem) and to empty boxes (through monotone couplings), and treats fixed points of
permutations directly from the count of permutations with a given number of fixed points; that
section depends on no other layer. Within a layer the sections are in build order.

## Conventions

- **Total variation.** `tvDist μ ν` is Mathlib's `MeasureTheory.tvDist`, the total variation of
  the signed measure `μ − ν`. For probability measures it lies in `[0, 2]` and equals
  `2 sup_A |μ A − ν A|` over measurable `A`; on `ℕ` it is `∑ₖ |μ{k} − ν{k}|`. Many texts,
  Ross's survey among them, use half this quantity; Le Cam and Arratia, Goldstein and Gordon use
  this one. Every bound here is written for `tvDist` and is twice the bound in the half
  normalization.
- **Poisson law.** `Po(r)` is Mathlib's `ProbabilityTheory.poissonMeasure r` for a rate
  `r : ℝ≥0`, with mass `e^(−r) r^k / k!` at `k`. `Po(0)` is the unit mass at `0`.
- **Families of indicators.** A family of events indexed by a finite type `ι` is given by its
  joint law: a probability measure `ξ` on `ι → Bool`. Its count is the number of `true`
  coordinates, its success probabilities are `pᵢ = ξ{x | xᵢ = true}`, and its intensity `λ` is
  `∑ pᵢ`, the mean of the count. Events on a probability space `(Ω, P)` give `ξ` as the image of
  `P` under `ω ↦ (i ↦ ω ∈ Aᵢ)`.
- **The Stein factor.** Several bounds contain `(1 − e^(−λ))/λ`. Lean's division gives it the
  value `0` at `λ = 0`. Every statement containing it is true at `λ = 0` as written: then all
  success probabilities vanish, the count is `0` almost surely and both sides are `0`. For
  `λ > 0` the factor lies in `(0, 1)` and is at most `min(1, 1/λ)`.
- **Uniform laws.** The uniform law on a finite type is Mathlib's
  `ProbabilityTheory.uniformOn Set.univ`, which is the zero measure on an empty type; statements
  whose sample space could be empty carry the hypothesis that excludes it.

## Layer 1: total variation and coupling

### 1.1 The coupling characterization

Prove `isLeast_coupling_tvDist`: for probability measures `μ` and `ν` on a countable measurable
space with measurable singletons, `tvDist μ ν / 2` is the least value of `γ{(x, y) | x ≠ y}` over
the couplings `γ` of `μ` and `ν` (measures on the product with first marginal `μ` and second
marginal `ν`, Tau Ceti's `TauCeti.IsCoupling`). Equivalently: every coupling satisfies
`tvDist μ ν ≤ 2 γ{x ≠ y}`, and a coupling attains equality.

Route: for a measurable `A`, `μ A − ν A = γ(A × univ) − γ(univ × A) ≤ γ{x ∈ A, y ∉ A} ≤ γ{x ≠ y}`,
and Tau Ceti's `MeasureTheory.etvDist_le_two_mul_iff` turns this eventwise bound into the bound on
`tvDist`. For the converse put mass `min(μ{x}, ν{x})` at each diagonal point `(x, x)` and spread
the remaining masses `(μ{x} − ν{x})⁺` and `(ν{y} − μ{y})⁺` over the off-diagonal points by their
normalized product; the off-diagonal mass is `1 − ∑ min(μ{x}, ν{x})`, which is
`tvDist μ ν / 2` by Scheffé's identity `1 − tvDist μ ν / 2 = ∫ min(dμ/dρ, dν/dρ) dρ` with
`ρ = μ + ν` (MathematicalStatisticsNonparametric 1.4, `one_sub_tvDist_eq_integral_min`), whose
right side on a countable space is `∑ min(μ{x}, ν{x})`. (Levin and Peres, Proposition 4.7, p. 50, prove both directions in the half
normalization for finite state spaces; the countable case is proved here by the same argument.)

**Checks.**
- `μ` the unit mass at `0` and `ν = Po(r)`: the only coupling is the product, under which
  `x ≠ y` has probability `1 − e^(−r)`; the masses differ by `1 − e^(−r)` at `0` and by
  `1 − e^(−r)` in total on `{1, 2, …}`, so `tvDist μ ν = 2(1 − e^(−r))`.
- `μ = ν` the uniform law on `{0, 1}`: the independent coupling gives `γ{x ≠ y} = 1/2` while
  `tvDist μ ν = 0`, so a coupling need not attain the least value; the diagonal coupling does.
- The Bernoulli law with mean `p ∈ [0, 1]` on `{0, 1} ⊆ ℕ` and `Po(p)`: the coupling with
  masses `1 − p` at `(0, 0)`, `e^(−p) − (1 − p)` at `(1, 0)` and `e^(−p) pᵏ/k!` at `(1, k)` for
  `k ≥ 1` has the right marginals (since `1 − p ≤ e^(−p)`) and `γ{x ≠ y} = p (1 − e^(−p))`; the
  distance is `2p(1 − e^(−p))`, so this coupling is optimal. For `p = 1/2` the distance is
  `1 − e^(−1/2) = 0.3935`.

*Needs:* Mathlib `MeasureTheory.tvDist`, `MeasureTheory.etvDist`; Tau Ceti `TauCeti.IsCoupling`,
`MeasureTheory.etvDist_le_two_mul_iff`, `MeasureTheory.etvDist_eq_two_mul_iSup_sub`;
MathematicalStatisticsNonparametric 1.4 (Scheffé's identity).

### Examples

A unit mass against a Poisson law, the independent and diagonal couplings of a uniform law with
itself, and the optimal coupling of a Bernoulli law with the Poisson law of the same mean.

### Dependencies

Mathlib `MeasureTheory.tvDist`, `MeasureTheory.etvDist`; Tau Ceti `TauCeti.IsCoupling`,
`MeasureTheory.etvDist_le_two_mul_iff`, `MeasureTheory.etvDist_eq_two_mul_iSup_sub`;
MathematicalStatisticsNonparametric 1.4. No other layer.

## Layer 2: the Stein equation for the Poisson law

### 2.1 The Stein characterization

Prove `eq_poissonMeasure_iff_integral_stein`: a probability measure `μ` on `ℕ` equals `Po(r)` if
and only if `∫ (r f(k + 1) − k f(k)) dμ(k) = 0` for every bounded `f : ℕ → ℝ` (Ross, Lemma 4.1,
p. 37, for `r > 0`). The rate `r = 0` is included, where the condition says that `μ` is the unit
mass at `0`.

Route: for `μ = Po(r)` the identity is Tau Ceti's
`TauCeti.Probability.withDensity_natCast_poissonMeasure`
(weighting `Po(r)` by `k` gives `r` times its image under `k ↦ k + 1`), integrated against `f`;
the count is integrable under `Po(r)`. Conversely, `f` the indicator of `{j}` is bounded with
finite support, so the integrand is integrable and the condition gives
`r μ{j − 1} = j μ{j}` for `j ≥ 1`; hence `μ{j} = μ{0} rʲ/j!`, and normalization gives `Po(r)`.

**Checks.**
- The unit mass at `1` is not Poisson for any `r`: with `f` the indicator of `{1}` the integral
  is `r f(2) − 1 · f(1) = −1`.
- The condition fixes the rate: for `μ = Po(r')` and `f` the indicator of `{1}` the integral is
  `r Po(r'){0} − Po(r'){1} = e^(−r')(r − r')`, which vanishes only for `r' = r`.

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_real_singleton`,
`ProbabilityTheory.hasSum_one_poissonMeasure`, `MeasureTheory.Measure.ext_of_singleton`; Tau Ceti
`TauCeti.Probability.withDensity_natCast_poissonMeasure`.

### 2.2 The solution of the Stein equation

For `r : ℝ≥0` and `A ⊆ ℕ` define `steinSolution`, whose value at `r`, `A` and `k` is

    f_A(k) = (k − 1)! r^(−k) e^r (Po(r)(A ∩ {0, …, k − 1}) − Po(r)(A) Po(r)({0, …, k − 1})),

so `f_A(0) = 0`; at `r = 0` Lean's division makes `f_A` identically `0`. Prove
`steinSolution_stein`: for `r > 0`, every `A` and every `k`,
`r f_A(k + 1) − k f_A(k) = 1_A(k) − Po(r)(A)` (Ross, Lemma 4.2, p. 37). It is the only solution
with value `0` at `0`, since the equation determines `f(k + 1)` from `f(k)`.

Route: substitute and use `Po(r){k} · r^(−k) e^r k! = 1`.

**Checks.**
- `r = 1`, `A = {0}`: `f_A(1) = 1 − e^(−1) = 0.6321` and `f_A(2) = 1 − 2e^(−1) = 0.2642`; the
  equation at `k = 1` reads `f_A(2) − f_A(1) = 0 − e^(−1)`.
- `r > 0` is needed: at `r = 0`, `f_A = 0`, and for `A = {1}` the equation at `k = 1` would read
  `0 = 1 − 0`.

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.poissonMeasure_real_singleton`.

### 2.3 Bounds on the solution

Prove, for every `r : ℝ≥0`, every `A ⊆ ℕ` and every `k`:

- `abs_steinSolution_succ_sub_le`: `|f_A(k + 1) − f_A(k)| ≤ (1 − e^(−r))/r`, including `k = 0`
  (Ross, Lemma 4.4, p. 38).
- `abs_steinSolution_le`: `|f_A(k)| ≤ min(1, r^(−1/2))` (Ross, Lemma 4.4, p. 38, where the proof
  is referred to Barbour, Holst and Janson).

Route for the first bound, following Ross's proof: `f_A` is the sum over `j ∈ A` of `f_{{j}}`. For
`k ≥ 1`, the increment at `k` of `f_{{j}}` with `j ≥ 1` is at most `0` unless `k = j`, where it is
at most `(1 − e^(−r))/r`, and the increment at `k` of `f_{{0}}` is negative; so every increment
of `f_A` at `k ≥ 1` is at most `(1 − e^(−r))/r`, and `f_{ℕ∖A} = −f_A` gives the lower bound.
(Ross states these signs without the restriction `k ≥ 1`; at `k = 0` the increment of `f_{{0}}`
is `(1 − e^(−r))/r > 0`.) At `k = 0` the increment is
`f_A(1) = (1_A(0) − Po(r)(A))/r`, of absolute value at most `(1 − e^(−r))/r`. At `r = 0` both
sides of both bounds are `0` (Mathlib's `0 ^ x = 0` for `x ≠ 0`).

**Checks.**
- The first bound is attained: for `A = {0}`, `f_A(1) − f_A(0) = (1 − e^(−r))/r`. At `r = 1` this
  is `0.6321`; computing the largest increment over all `A` and all `k ≤ 4r + 40` for
  `r ∈ {0.01, 0.1, 0.5, 1, 2, 3, 5, 10, 20, 40}` returns `(1 − e^(−r))/r` each time, so the
  constant cannot be lowered.
- For the second bound the largest `|f_A(k)|` over the same range is `0.6321` at `r = 1`,
  `0.4455` at `r = 2` (bound `0.7071`) and `0.1984` at `r = 10` (bound `0.3162`).
- The weaker factor `min(1, 1/r)` that Ross states in his Theorems 4.6 and 4.7 differs from
  `(1 − e^(−r))/r`: at `r = 1` they are `1` and `0.6321`.

*Needs:* 2.2; Mathlib `Real.add_one_le_exp`, `Real.zero_rpow`.

### Examples

The solution for `A = {0}` and `r = 1` at `k = 0, 1, 2`, and the attainment of the bound on
increments.

### Dependencies

Mathlib `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.poissonMeasure_real_singleton`,
`ProbabilityTheory.hasSum_one_poissonMeasure`, `MeasureTheory.Measure.ext_of_singleton`,
`Real.add_one_le_exp`, `Real.zero_rpow`; Tau Ceti
`TauCeti.Probability.withDensity_natCast_poissonMeasure`. No other layer.

## Layer 3: sums of indicators

Throughout, `ι` is a finite type, `ξ` a probability measure on `ι → Bool`,
`pᵢ = ξ{x | xᵢ = true}`, and `W` the count.

### 3.1 Counts and the local dependence theorem

Define `occurrences`, the number of `i` with `xᵢ = true`, and `intensity`, which sends `ξ` to
`∑ᵢ pᵢ` in `ℝ≥0`. Prove `tvDist_le_of_dependencyNeighbourhoods`: let `N : ι → Finset ι`
satisfy `i ∈ Nᵢ` for every `i`, and let the coordinate `xᵢ` be independent under `ξ` of the
family `(xⱼ)_{j ∉ Nᵢ}`. With `λ = intensity ξ`,

    b₁ = ∑ᵢ ∑_{j ∈ Nᵢ} pᵢ pⱼ,    b₂ = ∑ᵢ ∑_{j ∈ Nᵢ, j ≠ i} ξ{xᵢ = xⱼ = true},

the image of `ξ` under `occurrences` is within `2 (1 − e^(−λ))/λ · (b₁ + b₂)` of `Po(λ)`
(Arratia, Goldstein and Gordon, Theorem 1, p. 11, in their normalization, which is this one,
with `b₃ = 0` because of the independence assumed, as they note on p. 12; they assume every
`pᵢ > 0`, and indices with `pᵢ = 0` change neither side. Ross, Theorem 4.7, p. 41, states it with
`min(1, 1/λ)` in the half normalization.)

Route: for `A ⊆ ℕ` and `f = steinSolution λ A`, 2.2 gives
`ξ(W ∈ A) − Po(λ)(A) = E[λ f(W + 1) − W f(W)]`. Write `W f(W) = ∑ᵢ xᵢ f(Wᵢ + 1)` with
`Wᵢ = W − xᵢ`, and `Vᵢ = ∑_{j ∉ Nᵢ} xⱼ`. Then

    E[λ f(W + 1) − W f(W)] = ∑ᵢ pᵢ E[f(W + 1) − f(Wᵢ + 1)] + ∑ᵢ E[(pᵢ − xᵢ)(f(Wᵢ + 1) − f(Vᵢ + 1))],

because `E[(pᵢ − xᵢ) f(Vᵢ + 1)] = 0` by the independence. Telescoping with the bound of 2.3 on
increments, the first sum is at most `(1 − e^(−λ))/λ · ∑ pᵢ²` and the second at most
`(1 − e^(−λ))/λ · ∑ᵢ ∑_{j ∈ Nᵢ, j ≠ i} (pᵢ pⱼ + ξ{xᵢ = xⱼ = true})`. Both sums together are
`(1 − e^(−λ))/λ · (b₁ + b₂)`, and Tau Ceti's `MeasureTheory.etvDist_le_two_mul_iff` doubles the
eventwise bound into a bound on `tvDist`.

**Checks.**
- `i ∈ Nᵢ` is needed. One index, `p₁ = 1` and `N₁ = ∅`: the independence holds vacuously, `b₁` and
  `b₂` are `0`, but `W = 1` almost surely and `tvDist` from `Po(1)` is `2(1 − e^(−1)) = 1.2642`.
- The independence is needed. Two indicators equal to each other, each with probability `1/2`:
  `W` is `0` or `2` with probability `1/2` each, `λ = 1`, and `tvDist` from `Po(1)` is `0.8964`.
  With `Nᵢ = {i}` the independence fails, and the right side would be `2(1 − e^(−1))/2 = 0.6321`;
  with `Nᵢ = {1, 2}` it holds and the right side is `2(1 − e^(−1)) · (1 + 1) = 2.5285`.
- Runs: for independent coins `y₁, …, yₙ` with probability `q` and `xᵢ = yᵢ ⋯ y_{i+w−1}`, with
  `Nᵢ = {j : |i − j| < w}`, the bound holds for 200 choices of `n ≤ 9`, `q ∈ {0, 0.1, …, 1}` and
  `w ≤ 3`, with equality in degenerate cases.

*Needs:* 2.2, 2.3; Mathlib `ProbabilityTheory.IndepFun`, `MeasureTheory.tvDist`; Tau Ceti
`MeasureTheory.etvDist_le_two_mul_iff`.

### 3.2 Independent indicators: the bound of Barbour and Hall

Prove `tvDist_poissonBinomialMeasure_le`: for `p : ι → [0, 1]` and `λ = ∑ pᵢ`, Tau Ceti's
Poisson-binomial law `TauCeti.Probability.poissonBinomialMeasure p` is within
`2 (1 − e^(−λ))/λ · ∑ pᵢ²` of `Po(λ)` (Arratia, Goldstein and Gordon, Theorem 1, p. 11, with
`Nᵢ = {i}`, which gives `b₁ = ∑ pᵢ²` and `b₂ = b₃ = 0` as on their p. 12; Ross, Theorem 4.6,
p. 40, with `min(1, 1/λ)`). The factor `(1 − e^(−λ))/λ` is due to Barbour and Hall.

Route: apply 3.1 to the product of Bernoulli laws on `ι → Bool` with `Nᵢ = {i}`; the law of the
count is the Poisson-binomial law by Tau Ceti's `TauCeti.Probability.hasLaw_card_filter_mem_pi`
with the set `{true}` in every coordinate.

**Checks.**
- One indicator with probability `p > 0`: both sides equal `2p(1 − e^(−p))`, so the bound is
  attained; for `p = 1` both are `1.2642`.
- Two indicators with probability `1/2`: the distance is `0.3964`, the bound `0.6321`, and Le
  Cam's bound of 3.3 is `1`.
- Ten indicators with probability `1/10`: the distance is `0.0586`, the bound `0.1264`, Le
  Cam's bound `0.2`. Exact computation confirms the bound for 309 families of at most twelve
  indicators with probabilities in `{0, 1/20, …, 1}`.

*Needs:* 3.1; Mathlib `ProbabilityTheory.bernoulliMeasure`, `MeasureTheory.Measure.pi`,
`ProbabilityTheory.iIndepFun_pi`; Tau Ceti `TauCeti.Probability.poissonBinomialMeasure`,
`TauCeti.Probability.hasLaw_card_filter_mem_pi`.

### 3.3 Le Cam's inequality

Prove Le Cam's inequality: the Poisson-binomial law with success
probabilities `pᵢ` is within `2 ∑ pᵢ²` of `Po(∑ pᵢ)` (Le Cam, Theorem 1, p. 1183, with every
`Mⱼ` the unit mass at `1`, where `λ π = ∑ pⱼ²`; his norm is the total mass of the difference, as
here).

Route, by coupling: the third Check of 1.1 gives for each `i` a coupling `γᵢ` of the Bernoulli
law with mean `pᵢ` and `Po(pᵢ)` with `γᵢ{x ≠ y} = pᵢ(1 − e^(−pᵢ)) ≤ pᵢ²`. Under the product of the
`γᵢ` the sum of the first coordinates has the Poisson-binomial law (Tau Ceti's
`TauCeti.Probability.map_sum_pi_bernoulliMeasure`), the sum of the second coordinates has the
law `Po(∑ pᵢ)` (Tau Ceti's `TauCeti.Probability.map_sum_pi_poissonMeasure`), and the two sums
differ only where some pair differs, with probability at most `∑ pᵢ²`. The first half of 1.1
gives the bound. It also follows from 3.2 in one step, since `(1 − e^(−λ))/λ ≤ 1` (and the
factor is `0` at `λ = 0`); for that reason it is not stated separately in `Suggested.lean`.

**Checks.**
- One indicator with `p = 1`: the distance is `1.2642 < 2`.
- All `pᵢ = 0`: the Poisson-binomial law and `Po(0)` are both the unit mass at `0`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.bernoulliMeasure`, `MeasureTheory.Measure.pi`,
`Real.add_one_le_exp`; Tau Ceti `TauCeti.Probability.poissonBinomialMeasure`,
`TauCeti.Probability.map_sum_pi_bernoulliMeasure`, `TauCeti.Probability.map_sum_pi_poissonMeasure`.

### 3.4 Monotone couplings

Prove `tvDist_le_of_monotoneCoupling`: suppose that for every `i` with `pᵢ ≠ 0` there is a
coupling `γ` of `ξ` with the conditioned law `ξ[· | xᵢ = true]` such that, `γ`-almost surely,
`yⱼ ≤ xⱼ` for every `j ≠ i`, where `(x, y)` is the pair of coordinates. Then, with
`λ = intensity ξ` and `Var W` the variance of the count under `ξ`, the image of `ξ` under
`occurrences` is within `2 (1 − e^(−λ))/λ · (λ − Var W)` of `Po(λ)` (Ross, Theorem 4.19,
p. 52, with `min(1, 1/λ)` in the half normalization; his proof uses only the bound of
Lemma 4.4 on increments, so it gives the factor `(1 − e^(−λ))/λ`).

Route: with `f = steinSolution λ A`, `E[W f(W)] = ∑ pᵢ E[f(Wᵢ)]` where `Wᵢ = ∑_{j ≠ i} yⱼ + 1`
under `γ` for index `i`, since `y` has the law of `x` given `xᵢ = true`. Hence
`|E[λ f(W + 1) − W f(W)]| ≤ (1 − e^(−λ))/λ · ∑ pᵢ E|W + 1 − Wᵢ|` by 2.3. Monotonicity makes
`W + 1 − Wᵢ = xᵢ + ∑_{j ≠ i}(xⱼ − yⱼ) ≥ 0`, so the absolute values can be dropped, and
`∑ pᵢ E[W + 1 − Wᵢ] = λ² + λ − E[W²] = λ − Var W`. Conclude with
`MeasureTheory.etvDist_le_two_mul_iff`.

**Checks.**
- Independent indicators satisfy the hypothesis with `y` equal to `x` except `yᵢ = true`; then
  `λ − Var W = ∑ pᵢ²` and the statement is the bound of 3.2.
- The hypothesis is needed. Two indicators equal to each other with probability `1/2`: given
  `x₁ = true` the second indicator is `true`, so no coupling has `y₂ ≤ x₂` almost surely; and
  `λ − Var W = 1 − 1 = 0` while the distance is `0.8964`.
- Under the hypothesis `λ − Var W ≥ 0`, since it equals `∑ pᵢ E[W + 1 − Wᵢ]`.

*Needs:* 2.2, 2.3; Mathlib `ProbabilityTheory.cond`, `ProbabilityTheory.cond_apply`,
`ProbabilityTheory.variance`; Tau Ceti `TauCeti.IsCoupling`,
`MeasureTheory.etvDist_le_two_mul_iff`.

### Examples

Runs of heads with their dependency neighbourhoods; one, two and ten independent indicators,
comparing Le Cam's bound with that of Barbour and Hall; two equal indicators, which violate both
the independence of 3.1 for small neighbourhoods and the hypothesis of 3.4.

### Dependencies

Layer 1 (1.1, for 3.3) and Layer 2 (2.2 and 2.3, for 3.1 and 3.4). Mathlib
`MeasureTheory.tvDist`, `ProbabilityTheory.IndepFun`, `ProbabilityTheory.bernoulliMeasure`,
`MeasureTheory.Measure.pi`, `ProbabilityTheory.iIndepFun_pi`, `ProbabilityTheory.cond`,
`ProbabilityTheory.cond_apply`, `ProbabilityTheory.variance`, `Real.add_one_le_exp`; Tau Ceti
`TauCeti.IsCoupling`, `MeasureTheory.etvDist_le_two_mul_iff`,
`TauCeti.Probability.poissonBinomialMeasure`, `TauCeti.Probability.hasLaw_card_filter_mem_pi`,
`TauCeti.Probability.map_sum_pi_bernoulliMeasure`, `TauCeti.Probability.map_sum_pi_poissonMeasure`.

## Layer 4: birthdays, matchings and empty boxes

### 4.1 The birthday problem

Prove `tvDist_birthday_le`: for `d ≥ 1`, under the uniform law on `Fin n → Fin d` (birthdays of
`n` people among `d` days) let `W` be the number of pairs `i < j` with the same birthday, and
`λ = n(n − 1)/(2d)`. Then the law of `W` is within `2 (1 − e^(−λ))(4n − 7)/d` of `Po(λ)`.

Route: apply 3.1 to the indicators of the pairs `α = {i, j}`, with `Nα` the pairs meeting `α`.
The indicator of `α` depends only on the birthdays in `α`, so it is independent of the
indicators of the pairs disjoint from `α`. Each pair has probability `1/d`; two distinct pairs
meeting in one person are both matched with probability `1/d²`; `|Nα| = 2n − 3`. So
`b₁ = λ²(2n − 3)/binom(n, 2)`, `b₂ = λ²(2n − 4)/binom(n, 2)`, and
`2 (1 − e^(−λ))/λ · (b₁ + b₂) = 2 (1 − e^(−λ))(4n − 7)/d`. This evaluates exactly the
quantities `b₁` and `b₂` of Arratia, Goldstein and Gordon, Example 2, pp. 14–15, who conclude
the weaker `16 λ (1 − e^(−λ))/n`.

**Checks.**
- `n = 2`, `d = 1`: `W = 1` surely, `λ = 1`, and both sides are `2(1 − e^(−1)) = 1.2642`.
- `n = 2`, `d = 2`: `W` is Bernoulli with mean `1/2`, and both sides are `1 − e^(−1/2) = 0.3935`.
- `n = 3`, `d = 2`: `W` is `1` with probability `3/4` and `3` with probability `1/4`; the
  distance is `1.0796` and the bound `3.8843`.
- `n ≤ 1`: `λ = 0`, both sides are `0` (the factor `4n − 7` is negative at `n = 1`, multiplied
  by `1 − e^0 = 0`).
- `d ≥ 1` is needed: for `d = 0` and `n ≥ 1` the sample space is empty, the uniform law is the
  zero measure, `λ = 0`, and the distance from `Po(0)` is `1`, while the right side is `0`.
- Pairwise but not mutual independence: the indicators of `{1, 2}`, `{1, 3}` and `{2, 3}` are
  pairwise independent, yet the third is determined by the first two being `1`; so the
  neighbourhoods must contain the pairs that meet `α`.
- Exhaustive computation confirms the bound for `d ≤ 5`, `n ≤ 6`, and for `n = 5`, `d = 10`.

*Needs:* 3.1; Mathlib `ProbabilityTheory.uniformOn`, `ProbabilityTheory.uniformOn_univ`,
`ProbabilityTheory.iIndepFun_pi`.

### 4.2 Fixed points of a uniform permutation

Prove:

- `card_filter_card_fixedPoints_eq`: the number of permutations of `Fin n` with exactly `j`
  fixed points is `binom(n, j) · D(n − j)`, with `D` Mathlib's `numDerangements`; it is `0` for
  `j > n`.
- `tvDist_fixedPoints_le`: for the uniform law on the permutations of `Fin n` (with any
  measurable structure with measurable singletons), the law of the number of fixed points is
  within `2^(n+1)/(n + 1)!` of `Po(1)`.

Route: choose the `j` fixed points and a derangement of the rest; Mathlib's
`card_derangements_eq_numDerangements` counts the latter. The law of the count of fixed points
puts mass `D(n − j)/((n − j)! j!)` at `j ≤ n`. From Mathlib's `numDerangements_sum`,
`D(m)/m! = ∑_{i ≤ m} (−1)^i/i!`, which differs from `e^(−1)` by at most `1/(m + 1)!` (alternating
series). So the mass at `j ≤ n` differs from `e^(−1)/j!` by at most `1/(j!(n + 1 − j)!)`, and
these sum to `(2^(n+1) − 1)/(n + 1)!` (Mathlib's `Nat.sum_range_choose`); the Poisson mass beyond
`n` is at most `1/(n + 1)!`. Tau Ceti's `MeasureTheory.etvDist_le_of_forall_le_add` turns the sum
of the mass differences into a bound on `tvDist`. (Proved here. Ross, Example 4.21, p. 57, proves
the bound `4/n` in the half normalization by exchangeable pairs; the bound here is smaller for
every `n ≥ 1`.)

**Checks.**
- `n = 4`: the counts for `j = 0, 1, 2, 3, 4` are `9, 8, 6, 0, 1`, summing to `24`.
- `n = 0` and `n = 1`: the count is `0` or `1` surely; the distance is `2(1 − e^(−1)) = 1.2642`
  and the bound is `2`.
- `n = 2`: the count is `0` or `2` with probability `1/2` each; the distance is `0.8964` and the
  bound `4/3`. For `n = 8` the distance is `0.001173` and the bound `0.001411`; exact
  computation for `n ≤ 8` gives ratios between `0.63` and `0.84`.

*Needs:* Mathlib `numDerangements`, `card_derangements_eq_numDerangements`, `numDerangements_sum`,
`Nat.sum_range_choose`, `ProbabilityTheory.uniformOn`, `ProbabilityTheory.uniformOn_univ`,
`ProbabilityTheory.poissonMeasure_real_singleton`; Tau Ceti
`MeasureTheory.etvDist_le_of_forall_le_add`.

### 4.3 Empty boxes

Prove `tvDist_emptyBoxes_le`: for `n ≥ 1`, under the uniform law on `Fin k → Fin n` (`k` balls
in `n` boxes) let `W` be the number of empty boxes and `λ = n(1 − 1/n)^k`. Then the law of `W` is
within `2 (1 − e^(−λ))/λ · (λ² − n(n − 1)(1 − 2/n)^k)` of `Po(λ)`.

Route: the indicators of empty boxes satisfy the hypothesis of 3.4. Given box `i`, take the balls
in box `i` and move each, independently and uniformly, to one of the other `n − 1` boxes; the new
configuration has the law of the old one conditioned on box `i` being empty, and no other box
becomes empty (Ross, Example 4.15, pp. 53–54). The mean of `W` is `λ`, and
`E[W(W − 1)] = n(n − 1)(1 − 2/n)^k`, so `λ − Var W = λ² − n(n − 1)(1 − 2/n)^k`, the expression of
Ross's (4.13), p. 54, rewritten. Then 3.4 gives the bound. When `n = 1` and `k ≥ 1` there is no
other box, but then `p₁ = 0` and the hypothesis of 3.4 is vacuous.

**Checks.**
- `n = 1`, `k = 0`: no ball, `W = 1`, `λ = 1`, and both sides are `1.2642`.
- `n = 2`, `k = 2`: `W` is Bernoulli with mean `1/2`, `λ − Var W = 1/4`, and both sides are
  `0.3935`.
- `n = 3`, `k = 3`: `λ = 8/9`, `λ − Var W = 46/81`, the distance is `0.6025` and the bound
  `0.7525`.
- `n ≥ 1` is needed: for `n = 0` and `k = 1` the sample space is empty and the distance from
  `Po(0)` is `1`, while the right side is `0`.
- Exhaustive computation confirms the mean, the variance and the bound for `n ≤ 6` and `k ≤ 7`
  with at most `300000` configurations.

*Needs:* 3.4; Mathlib `ProbabilityTheory.uniformOn`, `ProbabilityTheory.uniformOn_univ`,
`ProbabilityTheory.cond`, `ProbabilityTheory.variance`; Tau Ceti `TauCeti.IsCoupling`.

### Examples

Birthdays for two and three people; the counts of permutations of four letters by fixed points;
two and three balls in two and three boxes.

### Dependencies

Layer 3 (3.1 for 4.1, 3.4 for 4.3); 4.2 depends on no other layer. Mathlib
`ProbabilityTheory.uniformOn`, `ProbabilityTheory.uniformOn_univ`, `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.cond`, `ProbabilityTheory.variance`, `numDerangements`,
`card_derangements_eq_numDerangements`, `numDerangements_sum`, `Nat.sum_range_choose`,
`ProbabilityTheory.poissonMeasure_real_singleton`; Tau Ceti `TauCeti.IsCoupling`,
`MeasureTheory.etvDist_le_of_forall_le_add`.

## Scope and ownership

This roadmap owns: the coupling characterization of total variation on a countable space (1.1);
the Stein characterization of the Poisson law, the solution of its Stein equation and the two
bounds on it (Layer 2); the local dependence theorem, the bound of Barbour and Hall, Le Cam's
inequality and the theorem on monotone couplings, for counts of events (Layer 3); and the three
applications of Layer 4.

Already in the libraries and cited, not restated:

- Total variation `tvDist` and `etvDist` with their metric properties (Mathlib), and its
  expression through events, `etvDist_eq_two_mul_iSup_sub`, `etvDist_le_two_mul_iff` and
  `etvDist_le_of_forall_le_add` (Tau Ceti).
- The Poisson law with its masses and its convolution identity (Mathlib), the pointwise limit of
  binomial masses to Poisson masses (Mathlib's
  `ProbabilityTheory.tendsto_choose_mul_pow_of_tendsto_mul_atTop`),
  of which 3.2 and 3.3 are quantitative forms, and the size-bias identity of the Poisson law
  (Tau Ceti's `withDensity_natCast_poissonMeasure`), which is one direction of 2.1.
- The Poisson-binomial law, its identification as the law of a count of independent events and
  its moments (Tau Ceti); StandardDistributions plans it in its Layer 9.
- Couplings of two measures (Tau Ceti's `IsCoupling`), derangement numbers and the limit
  `numDerangements n / n! → e^(−1)` (Mathlib's `numDerangements_tendsto_inv_e`), of which the
  mass at `0` in 4.2 is a quantitative form.

Left to other roadmaps:

- MarkovChainsAndRenewal plans, in its Layer 3 item 5, the identity
  `tvDist μ ν = ∑_y |μ{y} − ν{y}|` on a countable space, and in item 4 the bound of total
  variation by the probability that two coupled chains have not met. The Conventions above use
  the identity to explain the normalization, and the Checks compute distances with it; no route
  here uses it.
- MathematicalStatisticsFoundations owns, in its 9.2, the bound `|P A − Q A| ≤ tvDist P Q / 2`
  in real form, and MathematicalStatisticsNonparametric, in its 1.4, Scheffé's identity
  `1 − tvDist P Q / 2 = ∫ min(dP/dρ, dQ/dρ) dρ` with `ρ = P + Q`, used in the route of 1.1, and the inequalities
  of Le Cam between total variation and the Hellinger distance; none of these is Le Cam's
  Poisson inequality of 3.3.

Not treated here: the convergence of Markov chains to equilibrium and mixing times, couplings of
Markov chains, and models of populations; the method of factorial moments for convergence to a
Poisson law, and Poisson limits for counts of subgraphs of random graphs; Poisson process
approximation (Theorems 2 and 3 of Arratia, Goldstein and Gordon) and the error term `b₃` for
neighbourhoods without exact independence; compound Poisson approximation; increasing size-bias
couplings and exchangeable pairs; and bounds below on the distance.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`: `MeasureTheory.etvDist μ ν`, the
  variation on the whole space of `μ − ν` for finite measures (`∞` otherwise), and
  `MeasureTheory.tvDist μ ν = (etvDist μ ν).toReal`, with values in `[0, 2]` on probability
  measures.
- `Mathlib/Probability/Distributions/Poisson/Basic.lean`: `ProbabilityTheory.poissonMeasure r`
  for `r : ℝ≥0`; `ProbabilityTheory.poissonMeasure_real_singleton` (the mass at `n` is
  `exp (−r) * r ^ n / n!`); `ProbabilityTheory.hasSum_one_poissonMeasure` (the masses sum to `1`).
- `Mathlib/Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure x y p`,
  the law with mass `p` at `x` and `1 − p` at `y`, for `p` in `[0, 1]`.
- `Mathlib/Probability/UniformOn.lean`: `ProbabilityTheory.uniformOn s`, the counting measure
  conditioned on `s`; `ProbabilityTheory.uniformOn_univ` (on a finite type, the measure of `s` is
  its cardinality divided by that of the type).
- `Mathlib/Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond` (notation
  `μ[|s]`) and `ProbabilityTheory.cond_apply` (for measurable `s`,
  `μ[t|s] = (μ s)⁻¹ * μ (s ∩ t)`).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.IndepFun` and
  `ProbabilityTheory.iIndepFun_pi` (coordinates of a product of probability measures are
  independent). `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`.
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`.
- `Mathlib/MeasureTheory/Measure/Dirac/Basic.lean`: `MeasureTheory.Measure.ext_of_singleton`
  (on a countable type, measures agreeing on singletons are equal).
- `Mathlib/Combinatorics/Derangements/Finite.lean`: `numDerangements`,
  `card_derangements_eq_numDerangements` (the derangements of a finite type number
  `numDerangements` of its cardinality), `numDerangements_sum` (the alternating sum formula).
- `Mathlib/Combinatorics/Derangements/Exponential.lean`: `numDerangements_tendsto_inv_e`
  (`numDerangements n / n!` tends to `e^(−1)`), cited in the scope only.
- `Mathlib/Data/Nat/Choose/Sum.lean`: `Nat.sum_range_choose` (`∑_{m ≤ n} binom(n, m) = 2^n`).
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.add_one_le_exp` (`x + 1 ≤ exp x`);
  `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`: `Real.zero_rpow` (`0 ^ x = 0` for `x ≠ 0`).

### From Tau Ceti

- `TauCeti/MeasureTheory/Measure/TotalVariation.lean`: for finite measures `μ`, `ν` on a
  measurable space, `MeasureTheory.etvDist_eq_two_mul_iSup_sub` (if `μ univ = ν univ`,
  `etvDist μ ν` is twice the supremum of `μ A − ν A` over measurable `A`),
  `MeasureTheory.etvDist_le_two_mul_iff` (if `μ univ = ν univ`, `etvDist μ ν ≤ 2 c` if and only if
  `μ A ≤ ν A + c` for every measurable `A`) and `MeasureTheory.etvDist_le_of_forall_le_add`
  (eventwise bounds `μ A ≤ ν A + c` and `ν A ≤ μ A + d` give `etvDist μ ν ≤ c + d`).
- `TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`: `TauCeti.IsCoupling γ μ ν` (the first
  marginal of `γ` is `μ` and the second is `ν`).
- `TauCeti/Probability/Distributions/Poisson/SizeBias.lean`:
  `TauCeti.Probability.withDensity_natCast_poissonMeasure` (weighting `Po(r)` by the count gives
  `r` times the image of `Po(r)` under `n ↦ n + 1`, for every `r`).
- `TauCeti/Probability/Distributions/Poisson/Sum.lean`:
  `TauCeti.Probability.map_sum_pi_poissonMeasure` (the sum of the coordinates of a product of
  Poisson laws is Poisson with the sum of the rates).
- `TauCeti/Probability/Distributions/PoissonBinomial/Basic.lean`:
  `TauCeti.Probability.poissonBinomialMeasure p` for `p : ι → [0, 1]` over a finite type, a
  probability measure on `ℕ`; `TauCeti.Probability.map_sum_pi_bernoulliMeasure` (the sum of the
  coordinates of a product of Bernoulli laws on `{0, 1}` has the Poisson-binomial law).
  `TauCeti/Probability/Distributions/PoissonBinomial/Count.lean`:
  `TauCeti.Probability.hasLaw_card_filter_mem_pi` (under a product of probability laws, the number
  of coordinates lying in prescribed measurable sets has the Poisson-binomial law of their
  masses).

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- Section 1.4, `one_sub_tvDist_eq_integral_min`: for probability measures `P`, `Q`,
  `1 − tvDist P Q / 2 = ∫ min(dP/dρ, dQ/dρ) dρ` with `ρ = P + Q` (Scheffé's identity); used in
  the route of 1.1 on a countable space.

## References

- Richard Arratia, Larry Goldstein and Louis Gordon, *Two moments suffice for Poisson
  approximations: the Chen–Stein method*, Annals of Probability 17 (1989), 9–25; open at Project
  Euclid and on the second author's page. Page numbers are those of the journal.
- Lucien Le Cam, *An approximation theorem for the Poisson binomial distribution*, Pacific
  Journal of Mathematics 10 (1960), 1181–1197; open at the publisher's archive.
- Nathan Ross, *Fundamentals of Stein's method*, Probability Surveys 8 (2011), 210–293;
  arXiv:1109.1880, version 1. Theorem and page numbers are those of the arXiv version.
- David A. Levin and Yuval Peres, with contributions by Elizabeth L. Wilmer, *Markov Chains and
  Mixing Times*, second edition, American Mathematical Society, 2017; open on the first author's
  page. Page numbers are those of that copy.
- Attributions made in prose without a locator: A. D. Barbour and Peter Hall (the factor
  `(1 − e^(−λ))/λ` for independent indicators, 1984); A. D. Barbour, Lars Holst and Svante Janson
  (the bound on the Stein solution, in their book *Poisson Approximation*, 1992); Louis H. Y.
  Chen (the method, 1975).
