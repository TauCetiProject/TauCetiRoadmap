# Roadmap: restricted Boltzmann machines

**Summary.** A restricted Boltzmann machine with `m` visible and `n` hidden binary units is the
Gibbs law `p(v, h) ∝ exp(−E(v, h))` on `{0, 1}^m × {0, 1}^n` of the energy
`E(v, h) = −Σ_i Σ_j W_ij h_i v_j − Σ_j b_j v_j − Σ_i c_i h_i`, for real weights `W` and biases `b`,
`c`; there is no coupling inside a layer. Every statement holds for all finite sets of units,
including empty ones, and for all real parameters. The headline theorems are these.

- *Conditionals and free energy.* Given the visible configuration the hidden units are
  independent, unit `i` being on with probability `σ(c_i + Σ_j W_ij v_j)`, `σ` the logistic
  function, and symmetrically for the visible units; the visible law is
  `p(v) ∝ exp(b · v) Π_i (1 + exp(c_i + Σ_j W_ij v_j))`.
- *Block Gibbs sampling and contrastive divergence.* The two block updates (resample one layer
  given the other) are reversible for the joint law, and the chain they induce on the visible
  layer is reversible for the visible law, although an explicit example shows that the
  alternating update of the pair is in general not reversible for the joint law. With
  `A_j = |b_j| + Σ_i |W_ij|` and `ε = Π_j 2σ(−A_j) ∈ (0, 1]`, `k` steps of the visible chain
  contract the total variation distance to the visible law by `(1 − ε)^k`. Consequently, for a
  data law `q`, every coordinate of the `k`-step contrastive divergence approximation of the
  gradient of the average log-likelihood differs from the true gradient by at most `(1 − ε)^k`
  times the distance from `q` to the visible law.
- *Representational power.* If a law `q` on `{0, 1}^m` is not the visible law of a machine, one
  more hidden unit gives a machine strictly closer to `q` in relative entropy. A law whose support
  lies in the union of `r` edges of the cube is approximated arbitrarily well in relative entropy
  by machines with `r − 1` hidden units; hence every law on `{0, 1}^m` is approximated by
  machines with `2^(m−1) − 1` hidden units.

The joint law is the Gibbs measure on a finite set of SimulatedAnnealing, whose contraction of
total variation by Dobrushin's coefficient gives the rate of the visible chain. The units take
the `{0, 1}` values of QuantumOptimization. The gradient of the log-likelihood comes from the
gradient of the log partition function of a natural exponential family in
MathematicalStatisticsFoundations, and the relative entropy and total variation facts from Tau
Ceti's information theory and measure theory.

Layer 1 defines the machine and proves the closed forms of its conditional and marginal laws.
Layer 2 computes the gradient of the log-likelihood. Layer 3 proves the reversibility statements
of block Gibbs sampling, and Layer 4 the geometric ergodicity of the visible chain and the bias
bound of contrastive divergence. Layer 5, which uses only Layer 1, proves the theorems on adding
hidden units and on universal approximation.

## Conventions

- **Units and configurations.** The visible units form a finite type `ι` and the hidden units a
  finite type `κ`, both with decidable equality; `m = Fintype.card ι`, `n = Fintype.card κ`. A
  visible configuration is `v : ι → Bool` and a hidden one `h : κ → Bool`, with the discrete
  (product of `⊤`) measurable structure. The value of a unit is `bit v j ∈ {0, 1}`, `1` when
  `v j` is true, copied verbatim from QuantumOptimization 1.1. The `±1` spins of that roadmap
  are not used: with spins the closed forms below change (Checks of 1.3).
- **Parameters.** A machine is one vector `θ` of the Euclidean space `Params ι κ` indexed by
  `(κ × ι) ⊕ ι ⊕ κ`: the weight `W_ij` between hidden unit `i` and visible unit `j` is the
  coordinate `Sum.inl (i, j)`, the visible bias `b_j` is `Sum.inr (Sum.inl j)` and the hidden
  bias `c_i` is `Sum.inr (Sum.inr i)`. The shape (hidden × visible) is that of Fischer–Igel,
  eq. (18), p. 10, and of Le Roux–Bengio, §1.1.1. The Euclidean structure is used only to
  state the gradient of 2.1.
- **Laws and kernels.** The Gibbs measure on a finite set is `gibbs U β` of SimulatedAnnealing
  3.1, copied verbatim; all laws here are at inverse temperature `1`. Composition of kernels is
  Mathlib's: `η ∘ₖ κ` applies `κ` first; `κ ^ k` is the `k`-th power for composition; the law
  reached from `μ` after `k` steps is `μ.bind (κ ^ k)`. Reversibility is Mathlib's
  `Kernel.IsReversible` (detailed balance on measurable sets).
- **Logistic function and distances.** `σ` is Mathlib's `Real.sigmoid`, `σ(x) = 1/(1 + e^(−x))`,
  with `σ(−x) = 1 − σ(x)`. Total variation is written `tvDist μ ν / 2` with Mathlib's
  `MeasureTheory.tvDist` (the total variation norm, in `[0, 2]` on probability measures), so
  that it is `max_A |μ A − ν A|`, the quantity `½|μ − ν|` of Fischer–Igel, eq. (13).
  Relative entropy is Mathlib's `InformationTheory.klDiv`, with values in `[0, ∞]`.
- **Junk values.** Every law of a machine charges every configuration, so the logarithms and
  relative entropies below are finite; `ENNReal.ofReal` is applied only to positive reals. A
  statement with `Fintype.card ι − 1` or `r − 1` uses natural subtraction; the cases where it
  truncates are checked where they occur (5.2, 5.3).

## Layer 1: the model, its conditionals and its free energy

### 1.1 The machine

Define `Params ι κ`, `energy θ v h`, the joint law `jointLaw θ = gibbs (energy θ) 1` on
`(ι → Bool) × (κ → Bool)`, and its marginals `visibleLaw θ` and `hiddenLaw θ` (images under the
two projections). With the sufficient statistic `T(v, h)` whose coordinates are
`bit h i · bit v j`, `bit v j` and `bit h i`, the energy is `−⟪θ, T(v, h)⟫`, the form used in 2.1.

- `jointLaw θ` is a probability measure giving every pair mass
  `exp(−E(v, h)) / Σ exp(−E) > 0`; hence `visibleLaw θ {v} > 0` and `hiddenLaw θ {h} > 0` for
  all `v`, `h`.

**Checks.**

- One visible and one hidden unit, `W = log 3`, `b = c = 0` (the *standard example* below): the
  weights `exp(−E)` of `(v, h) = (0,0), (0,1), (1,0), (1,1)` are `1, 1, 1, 3`, so `Z = 6`; the
  visible law is `(1/3, 2/3)`.
- No hidden units (`κ` empty): there is one hidden configuration and `visibleLaw θ` is the
  product of Bernoulli laws with parameters `σ(b_j)`; no visible units: the visible law is the
  point mass at the only configuration.

### 1.2 Conditional independence

Define `hiddenField θ v i = c_i + Σ_j W_ij v_j`, `visibleField θ h j = b_j + Σ_i W_ij h_i`, and
the kernels `hiddenKernel θ`, giving `h` the mass `Π_i σ(±hiddenField θ v i)` (sign `+` where
`h i` is true), and `visibleKernel θ`, giving `v` the mass `Π_j σ(±visibleField θ h j)`. Prove
(`jointLaw_eq_compProd`) that `jointLaw θ = visibleLaw θ ⊗ₘ hiddenKernel θ` and that the image of
`jointLaw θ` under the swap of coordinates is `hiddenLaw θ ⊗ₘ visibleKernel θ`. So the hidden
units are independent given `v` with `P(H_i = 1 | v) = σ(hiddenField θ v i)`, and the visible
units are independent given `h` with `P(V_j = 1 | h) = σ(visibleField θ h j)` (Fischer–Igel,
eqs. (19), (21), (22), p. 11, with the derivation of (22) in (23)–(25), pp. 11–12; Le Roux–Bengio,
§1.1.1, stated). Route: `exp(−E(v, h)) = exp(b · v) Π_i exp(h_i · hiddenField θ v i)`, so
for fixed `v` the weight is a product over `i` of factors depending on `h_i` alone; normalising
each factor over `h_i ∈ {0, 1}` gives `σ(±hiddenField θ v i)`, and the product of the normalisers
is proportional to the visible mass `p(v)`. The visible side is the same computation with the
roles of the layers exchanged. Both kernels are Markov: by `Finset.prod_univ_sum` the masses of a
row multiply out to `Π_i (σ(x_i) + σ(−x_i)) = 1`.

The qualitative statement, that the units of one layer are conditionally independent given the
other, is the global Markov property of the complete bipartite graph; the content of 1.2 is the
closed form of the conditional laws.

**Checks.**

- Standard example: `P(H = 1 | v = 1) = σ(log 3) = 3/4` and `P(H = 1 | v = 0) = 1/2`; then
  `p(1, 1) = p_V(1) · 3/4 = 1/2 = 3/6`, in agreement with the weights of 1.1.
- The sign: a positive weight favours agreement, `P(H = 1 | v = 1) = 3/4 > 1/2`; the variant
  `σ(−hiddenField θ v i)` (the sign of the energy dropped) would give `1/4`, and its product with
  `p_V(1)` would not reproduce `p(1, 1) = 1/2`.

*Needs:* 1.1; Mathlib `Measure.compProd`, `Measure.compProd_apply_prod`, `Kernel.ofFunOfCountable`,
`Real.sigmoid_neg`, `Finset.prod_univ_sum`.

### 1.3 The free energy

Define `freeEnergy θ v = −Σ_j b_j v_j − Σ_i log(1 + exp(hiddenField θ v i))`. Prove
(`visibleLaw_eq_gibbs_freeEnergy`) that `visibleLaw θ = gibbs (freeEnergy θ) 1`, that is
`p(v) = Z⁻¹ exp(b · v) Π_i (1 + exp(c_i + Σ_j W_ij v_j))` (Fischer–Igel, eq. (20), p. 11, where
the computation is printed). Route: sum the product form of 1.2 over `h`; the sum over `h_i` of
`exp(h_i x)` is `1 + e^x`, and both sides are normalised.

**Checks.**

- Standard example: the unnormalised masses are `1 + 1 = 2` at `v = 0` and `1 + 3 = 4` at `v = 1`,
  so `p_V = (1/3, 2/3)` as in 1.1.
- With the `±1` spins and the energy `−W s t`, the same `W = log 3` would give the masses
  `e^(−W) + e^W = 10/3` for both visible spins, a uniform visible law: the closed form depends
  on the `{0, 1}` convention.

*Needs:* 1.2 (or 1.1 directly); Mathlib `Finset.prod_univ_sum`.

### Examples

- Standard example: joint law `(1, 1, 1, 3)/6`, visible law `(1/3, 2/3)`, hidden law
  `(1/3, 2/3)`, `P(H = 1 | v) = 1/2, 3/4` and, by symmetry, `P(V = 1 | h) = 1/2, 3/4`.

### Dependencies

- QuantumOptimization 1.1 (`bit`, copied) and SimulatedAnnealing 3.1 (`gibbs`, copied); Mathlib
  kernels, `Measure.compProd` and `Real.sigmoid`.

## Layer 2: the gradient of the log-likelihood

### 2.1 Data mean minus model mean

Define `condStat θ v ∈ Params ι κ`, the conditional mean of `T(v, ·)` under `hiddenKernel θ v`:
its coordinates are `σ(hiddenField θ v i) · v_j` at a weight, `v_j` at a visible bias and
`σ(hiddenField θ v i)` at a hidden bias. Prove (`hasFDerivAt_integral_log_visibleLaw`) that for
every probability measure `q` on the visible configurations (a data law) the average
log-likelihood `θ ↦ ∫ log p_θ(v) dq(v)` has at every `θ` the derivative
`⟪∫ condStat θ dq − ∫ condStat θ d(visibleLaw θ), ·⟫`. In coordinates: the derivative in `W_ij`
is `E_q[σ(c_i + W_i · v) v_j] − E_p[σ(c_i + W_i · v) v_j]`, in `b_j` it is `E_q v_j − E_p v_j`,
and in `c_i` it is `E_q σ(c_i + W_i · v) − E_p σ(c_i + W_i · v)` (Fischer–Igel, eqs. (26)–(31),
pp. 12–13, where the computation is printed for one data point and the average (28) for an
empirical law; Le Roux–Bengio, eq. (1), stated). The statement for a general data law
contains both: `q` the point mass at `v` gives (27), (30), (31).

Route, through MathematicalStatisticsFoundations 3.3: by 1.1,
`log p_θ(v) = log Σ_h exp⟪θ, T(v, h)⟫ − log Σ_(v, h) exp⟪θ, T(v, h)⟫`. Each term is
`logPartition ν id θ` for a finite measure `ν` on `Params ι κ`: the image of the counting measure
of the hidden configurations under `h ↦ T(v, h)`, and the image of the counting measure of all
pairs under `T`. A finite sum of point masses integrates every exponential, so the natural
parameter space is everything and its interior contains `θ`; `hasFDerivAt_logPartition` gives
the derivative `⟪mean, ·⟫`, the mean being taken under the exponential tilt, which is
`hiddenKernel θ v` pushed forward by `T(v, ·)` (1.2) for the first term and `jointLaw θ` pushed
forward by `T` for the second. By 1.2 the first mean is `condStat θ v`, and the second is
`∫ condStat θ d(visibleLaw θ)` (condition on `v`). Finally `∫ · dq` is the finite sum
`Σ_v q{v} ·`, and derivatives of finite sums add (`HasFDerivAt.sum`). *Needs:* 1.1, 1.2;
MathematicalStatisticsFoundations 3.3 (`hasFDerivAt_logPartition`, `logPartition`,
`naturalParameterSpace`, `exponentialFamilyMeasure`); Mathlib `integral_fintype`,
`HasFDerivAt.sum`, `innerSL`.

**Checks.**

- Standard example, `q` the point mass at `v = 1`: the derivative is `1/4` in `W`
  (`3/4 − (2/3)(3/4)`), `1/3` in `b` (`1 − 2/3`) and `1/12` in `c`
  (`3/4 − ((1/3)(1/2) + (2/3)(3/4))`). Directly for `b`: with `c = 0`, `W = log 3`, the masses
  of 1.3 are `2` and `4e^b`, so `log p(1) = log(4e^b) − log(2 + 4e^b)` has derivative
  `1 − 4/6 = 1/3` at `b = 0`.
- `q = visibleLaw θ` gives derivative `0`: the machine is a critical point of its own
  likelihood.

### Examples

- Fischer–Igel's rule "data minus model" (29) is the `W`-coordinate of 2.1 for an empirical law.

### Dependencies

- Layer 1; MathematicalStatisticsFoundations 3.3.

## Layer 3: block Gibbs sampling

### 3.1 The two block updates

Define the kernels on pairs `hiddenUpdate θ`, which keeps `v` and draws `h'` from
`hiddenKernel θ v`, and `visibleUpdate θ`, which keeps `h` and draws `v'` from
`visibleKernel θ h`. Prove (`isReversible_hiddenUpdate_and_visibleUpdate`) that each is
reversible for `jointLaw θ`. Route: by 1.2, `p(v, h) · p(h' | v) = p(v) p(h | v) p(h' | v)` is
symmetric in `h, h'`, and pairs with different `v` exchange no mass; on a finite set detailed
balance on points gives it on sets. The other update is the same with the layers exchanged.
(Proved here: Fischer–Igel describe block Gibbs sampling, p. 11, without a reversibility
argument; their eq. (16), p. 9, proves detailed balance for the single-site sampler.) *Needs:*
1.2; Mathlib `Kernel.IsReversible`, `lintegral_fintype`.

By Mathlib's `Kernel.IsReversible.invariant` and `Kernel.Invariant.comp`, the alternating update
`visibleUpdate θ ∘ₖ hiddenUpdate θ` (first the hidden layer, then the visible layer) leaves
`jointLaw θ` invariant. It is not reversible in general (Checks).

**Checks.**

- *The alternating update is not reversible.* Standard example: its kernel is
  `K((v, h), (v', h')) = p(h' | v) p(v' | h')`, and
  `p(0, 0) K((0, 0), (0, 1)) = (1/6)(1/4)(1/2) = 1/48` while
  `p(0, 1) K((0, 1), (0, 0)) = (1/6)(1/2)(1/2) = 1/24`; detailed balance fails for 10 of the 16
  ordered pairs of states, while `Σ_s p(s) K(s, t) = p(t)` for all four `t`.

### 3.2 The visible chain

Define `visibleChain θ = visibleKernel θ ∘ₖ hiddenKernel θ`, the kernel
`Q(v, v') = Σ_h p(h | v) p(v' | h)`: the law of the visible configuration after one round of
alternating block Gibbs sampling (hidden layer, then visible layer) started at `v`. Prove
(`isReversible_visibleChain`) that it is reversible for `visibleLaw θ`. Route: by 1.2,
`p(v) Q(v, v') = Σ_h p(v) p(h | v) p(v' | h) = Σ_h p(v, h) p(v', h) / p_H(h)`, which is symmetric
in `v, v'`; on a finite set detailed balance on points gives it on sets. (Proved here.)
*Needs:* 1.2; Mathlib `Kernel.comp_apply`, `Kernel.IsReversible`.

- Every entry of `Q` is positive (each factor `σ(·)` is), so the visible chain is irreducible and
  aperiodic; 4.1 gives an explicit rate.

**Checks.**

- Standard example: `Q(0, ·) = (3/8, 5/8)`, `Q(1, ·) = (5/16, 11/16)`, and
  `p_V(0) Q(0, 1) = (1/3)(5/8) = 5/24 = (2/3)(5/16) = p_V(1) Q(1, 0)`.

### Examples

- Standard example: `Q` as in the Check; its second eigenvalue is `1 − 5/8 − 5/16 = 1/16`.

### Dependencies

- Layer 1; Mathlib kernels and `Kernel.IsReversible`.

## Layer 4: geometric ergodicity and the bias of contrastive divergence

### 4.1 Geometric ergodicity of the visible chain

Define `minorizationConst θ = Π_j 2σ(−A_j)` with `A_j = |b_j| + Σ_i |W_ij|`; each factor lies in
`(0, 1]`, so `0 < minorizationConst θ ≤ 1`. Prove (`tvDist_bind_visibleChain_pow_le`) that for
every probability measure `μ` on the visible configurations and every `k`,

    tvDist (μ.bind (visibleChain θ ^ k)) (visibleLaw θ) / 2
      ≤ (1 − minorizationConst θ)^k · tvDist μ (visibleLaw θ) / 2.

Route (proved here):

1. *A floor for the visible conditionals.* For every `h`, `|visibleField θ h j| ≤ A_j`, because
   each `h_i ∈ {0, 1}`; `σ` is increasing, so `σ(±visibleField θ h j) ≥ σ(−A_j)` and
   `visibleKernel θ h {v'} ≥ η := Π_j σ(−A_j)` for all `h`, `v'`.
2. *Minorization.* `Q(v, {v'}) = Σ_h p(h | v) visibleKernel θ h {v'} ≥ η` for all `v`, `v'`,
   since the masses `p(h | v)` sum to `1` (1.2).
3. *Dobrushin's coefficient.* Every column of `Q` has least entry at least `η`, and there are
   `2^m` columns, so the column-minimum bound of SimulatedAnnealing 1.1,
   `δ(κ) ≤ 1 − Σ_z min_x κ(x, {z})`, gives
   `dobrushinCoeff (visibleChain θ) ≤ 1 − 2^m η = 1 − minorizationConst θ`. Directly: for all
   `x`, `y`, the distance `tvDist (Q x) (Q y) / 2` is `Σ_z (Q(x, {z}) − Q(y, {z}))⁺`, which is
   `1 − Σ_z min(Q(x, {z}), Q(y, {z})) ≤ 1 − 2^m η`, as each of the `2^m` minima is at least `η`.
4. *Contraction.* The visible chain is Markov (1.2) and leaves `visibleLaw θ` invariant (3.2 and
   Mathlib's `Kernel.IsReversible.invariant`). SimulatedAnnealing 1.2
   (`tvDist_bind_le_dobrushinCoeff_mul`) applied to `μ.bind (visibleChain θ ^ j)` and
   `visibleLaw θ` gives one factor `1 − minorizationConst θ` per step; induct on `k`, using
   `μ.bind (κ ^ (j + 1)) = (μ.bind (κ ^ j)).bind κ` (`Measure.bind_bind`, powers of one kernel
   commute).

Fischer–Igel, eq. (17), p. 9, quote a bound of this shape for the single-site periodic sampler of
a general random field, with the constant `1 − e^(−NΔ)`, citing Brémaud without proof; the
constant here is the one proved above. *Needs:* 1.2, 3.2; SimulatedAnnealing 1.1
(`dobrushinCoeff`, the column-minimum bound) and 1.2 (`tvDist_bind_le_dobrushinCoeff_mul`);
Mathlib `Real.sigmoid_strictMono`, `Kernel.IsReversible.invariant`, `Measure.bind_bind`,
`Fintype.card_fun`.

**Checks.**

- Standard example: `minorizationConst = 2σ(−log 3) = 2 · 1/4 = 1/2`. The true coefficient is
  `|3/8 − 5/16| = 1/16`; the column minima of `Q` are `5/16` and `5/8`, so the column-minimum
  bound with the true minima, `1 − 15/16`, is exact here, while steps 1–2 bound each column
  minimum below only by `η = 1/4`. From the point mass at `0` the distance `2/3` becomes
  `1/24 = (1/16)(2/3)` after one
  step, below the bound `(1/2)(2/3) = 1/3`.
- `θ = 0`: `minorizationConst = 1`, and indeed `visibleKernel` is uniform in every row, so the
  chain reaches `visibleLaw 0` (uniform) in one step: the bound is `0` for `k ≥ 1`.

### 4.2 The bias of contrastive divergence

Define `cdGradient θ k q = ∫ condStat θ dq − ∫ condStat θ d(q.bind (visibleChain θ ^ k))`, the
`k`-step contrastive divergence approximation (CD-k) of the gradient of 2.1: the model mean is
replaced by the mean after `k` steps of the visible chain started from the data law (Fischer–Igel,
eq. (32) and the update rules of their Algorithm 1, p. 14, averaged over the data). Prove
(`abs_sub_cdGradient_le`) that for every probability measure `q`, every `k` and every coordinate
`a`,

    |(∫ condStat θ dq − ∫ condStat θ d(visibleLaw θ) − cdGradient θ k q) a|
      ≤ (1 − minorizationConst θ)^k · tvDist q (visibleLaw θ) / 2.

Route (proved here):

1. *The bias as an expected gradient (Bengio–Delalleau form).* The difference is
   `∫ condStat θ d(q.bind Q^k) − ∫ condStat θ d(visibleLaw θ)`. By 2.1 at a point mass, the
   gradient of `log p_θ(v)` is `condStat θ v − ∫ condStat θ d(visibleLaw θ)`, so the difference is
   the mean of that gradient over the law of the `k`-th state of the chain started from `q`.
   Fischer–Igel state the pointwise form of this identity as Theorem 1, eq. (33), p. 14, citing
   Bengio and Delalleau without proof; the two lines above are its proof.
2. *A `[0, 1]`-valued test function.* Each coordinate `ψ_a(v)` of `condStat θ v` lies in
   `[0, 1]`. For probability measures `μ`, `ν` on a finite set,
   `∫ ψ dμ − ∫ ψ dν = Σ_v ψ(v)(μ{v} − ν{v}) ≤ μ(A) − ν(A)` with `A = {μ > ν}`, which is at most
   `tvDist μ ν / 2` (Tau Ceti's `etvDist_eq_two_mul_iSup_sub`); exchanging `μ` and `ν` bounds the
   absolute value.
3. Apply 2 with `μ = q.bind Q^k`, `ν = visibleLaw θ`, then 4.1 with `μ = q`.

As `minorizationConst θ > 0`, the bias tends to `0` as `k → ∞` for every `θ`. Fischer–Igel,
Theorem 2, eq. (34), p. 15, state a bound of this shape with another constant, citing Fischer and
Igel (2011) without proof; this roadmap neither uses nor restates their constant. *Needs:* 2.1,
4.1; Tau Ceti `etvDist_eq_two_mul_iSup_sub`; Mathlib `integral_fintype`.

**Checks.**

- Standard example, `q` the point mass at `1`, `k = 1`: `Q(1, ·) = (5/16, 11/16)`, so the CD-1
  approximation is `3/4 − (11/16)(3/4) = 15/64` in `W`, `1 − 11/16 = 5/16` in `b` and
  `3/4 − ((5/16)(1/2) + (11/16)(3/4)) = 5/64` in `c`; the biases are `1/4 − 15/64 = 1/64`,
  `1/3 − 5/16 = 1/48` and `1/12 − 5/64 = 1/192`, below the bound `(1/2)(1/3) = 1/6`.
- `k = 0`: `cdGradient θ 0 q = 0`, so the statement bounds the gradient itself by
  `tvDist q (visibleLaw θ) / 2`; in the standard example the `b`-coordinate `1/3` attains it, so
  the factor at `k = 0` cannot be lowered.

### Examples

- For `θ = 0` the bias vanishes for every `k ≥ 1`, since one step of the visible chain reaches
  the visible law.

### Dependencies

- Layers 1–3 (4.1 uses 1.2 and 3.2; 4.2 uses 2.1 and 4.1); SimulatedAnnealing 1.1–1.2; Tau Ceti
  total variation.

## Layer 5: representational power

### 5.1 Adding a hidden unit

Define `addHidden θ w c ∈ Params ι (Option κ)`, the machine with one more hidden unit, indexed by
`none`, with weights `w : ι → ℝ` to the visible units and bias `c`, all other parameters those of
`θ`. Prove (`exists_klDiv_addHidden_lt`) that if a probability measure `q` on the visible
configurations is not `visibleLaw θ`, then for some `w`, `c`,
`klDiv q (visibleLaw (addHidden θ w c)) < klDiv q (visibleLaw θ)` (Le Roux–Bengio, Theorem 2.3,
proof in Appendix 5.2; their hypothesis `KL(q‖p) > 0` is `q ≠ p`).

Route:

1. *The new visible law* (Le Roux–Bengio, Lemma 2.1, proof in Appendix 5.1). By 1.3
   the free energy of `addHidden θ w c` is `freeEnergy θ v − log(1 + exp(w · v + c))`, so its
   visible law is `visibleLaw θ` tilted by `v ↦ log(1 + exp(w · v + c))` (Mathlib's
   `Measure.tilted`): `p_(w,c)(v) = p(v)(1 + e^(w·v+c)) / Σ_v' p(v')(1 + e^(w·v'+c))`. It
   depends on `θ` only through `p`, and for `w = 0` it is `p`.
2. *First order in `t = e^c`.* With `u_v = e^(w·v)` and Tau Ceti's
   `klDiv_eq_ofReal_sum_log_singleton`,
   `KL(q‖p_(w,c)) − KL(q‖p) = −Σ_v q(v) log(1 + t u_v) + log(1 + t Σ_v p(v) u_v)`, a smooth
   function of `t ≥ 0` vanishing at `0` with derivative `Σ_v (p(v) − q(v)) u_v` there.
3. *A direction.* As `q ≠ p` and both are probability measures, some `v̂` has `q(v̂) > p(v̂)`. For
   `w = a(v̂ − ½𝟙)` the exponent `w · v` is maximal exactly at `v = v̂`, so
   `e^(−w·v̂) Σ_v (p(v) − q(v)) u_v → p(v̂) − q(v̂) < 0` as `a → ∞`. Fix such an `a`; the
   derivative of step 2 is negative, so the difference is negative for small `t > 0`.

*Needs:* 1.3; Mathlib `Measure.tilted`, `klDiv`; Tau Ceti `klDiv_eq_ofReal_sum_log_singleton`.

**Checks.**

- One visible unit, no hidden units, `b = 0` (so `p = (1/2, 1/2)`), `q = (1/4, 3/4)`; add
  `w = log 2`, `c = 0`: the factors `1 + e^0 = 2`, `1 + e^(log 2) = 3` give `p' = (2/5, 3/5)`,
  and `KL(q‖p') < KL(q‖p)` because `(p_0/p'_0)^(1/4) (p_1/p'_1)^(3/4) < 1`, that is
  `(5/4)(5/6)³ = 625/864 < 1`.
- The hypothesis is needed: for `q = visibleLaw θ` the divergence is `0` and cannot decrease.
- `w = 0`: the new law equals `p` for every `c` (step 1), so adding units never loses
  approximation power.

### 5.2 Edges of the cube and universal approximation

Prove (`exists_klDiv_lt_of_support_subset_edges`) that if the support of a probability measure
`q` on `{0, 1}^ι` lies in the union of the `r` edges `{y_k, y_k ⊕ e_(l_k)}` of the cube (`y_k ⊕
e_l` is `y_k` with unit `l` flipped), then for every `ε > 0` some machine with `r − 1` hidden
units has `klDiv q (visibleLaw θ) < ε` (Montúfar–Ay, Theorem 1, pp. 4–5, where the proof,
pp. 5–7, is given as a sketch; the route below is complete and proved here). For `r = 0` the
hypothesis is never met by a probability measure, so the truncated `r − 1` is harmless.

Write `M_n` for the set of visible laws of machines with `n` hidden units (as vectors in
`ℝ^(2^m)`) and `cl M_n` for its closure.

1. *Monotonicity.* `M_n ⊆ M_(n+1)`: add a unit with `w = 0` (5.1, step 1), and relabel the hidden
   units `Option (Fin n) ≃ Fin (n + 1)`, which does not change the visible law.
2. *One edge.* `M_0` is the set of products of Bernoulli laws with parameters `σ(b_j)`. Every law
   on an edge `{y, y ⊕ e_l}` is in `cl M_0`: take `b_j = a(2y_j − 1)` for `j ≠ l` and `b_l` the
   log-ratio of the two masses (or `±a` if one of them is `0`), and let `a → ∞`; the mass of every
   `v` off the edge is at most `e^(−a)` times that of the edge point with the same `v_l`.
3. *Boosting an edge.* Let `P = {y, y'}` be an edge, `y' = y ⊕ e_l`, and `g : {0,1}^ι → [1, ∞)`
   equal to `1` off `P`. If `p ∈ cl M_n` then the normalisation of `p · g` lies in
   `cl M_(n+1)`. For `p ∈ M_n` and `g > 1` on `P`, write `g(y) = 1 + λ_0`, `g(y') = 1 + λ_1` when
   `y_l = 0` (exchange otherwise), and add the unit with `w_j = a(2y_j − 1)` (`j ≠ l`),
   `w_l = log λ_1 − log λ_0`, `c = −a Σ_(j ≠ l) y_j + log λ_0`. Then
   `w · v + c = −a d(v, y) + (log λ_1 − log λ_0) v_l + log λ_0`, `d` the number of units `j ≠ l`
   where `v` and `y` differ, so `1 + e^(w·v+c)` tends to `g(v)` at every `v` as `a → ∞`, and by
   5.1, step 1, the visible laws tend to the normalisation of `p · g`. The cases `g = 1` at a
   point of `P` and `p ∈ cl M_n` follow by continuity: normalising `p · g` is continuous in `p`
   and `g`, since `Σ p g ≥ 1`.
4. *Induction on `r`.* Order the edges `P_1, …, P_r`, put `U_k = P_1 ∪ … ∪ P_k`, and prove that
   every law supported in `U_k` lies in `cl M_(k−1)` (`k ≥ 1`). The case `k = 1` is step 2. For
   `k + 1`: if `P_(k+1) ⊆ U_k` use the case `k` and step 1. Otherwise let `q(U_k) = α`. If
   `α = 0`, `q` lives on one edge: step 2 and step 1. If `α > 0`, the law `q' = q|U_k / α` lies in
   `cl M_(k−1)`; take `p_t ∈ M_(k−1)` with `p_t → q'` (each charges every point), and let `g_t`
   be `1` off `S = P_(k+1) \ U_k` and `max(1, q(v) p_t(U_k) / (α p_t(v)))` at `v ∈ S`. By step 3
   the normalisation of `p_t g_t` lies in `cl M_k`; its unnormalised masses tend to `q(v)/α` on
   `U_k` (where `g_t = 1`), to `q(v)/α` on `S` (as `p_t(v) → 0` and `p_t(U_k) → 1`) and to `0`
   elsewhere, so it tends to `q`, and `cl M_k` is closed.
5. *Relative entropy.* Laws of machines charge every point, so by Tau Ceti's
   `klDiv_eq_ofReal_sum_log_singleton`, `KL(q‖p_t) = Σ_(q(v) > 0) q(v) log(q(v)/p_t(v)) → 0` when
   `p_t → q` pointwise. (Montúfar–Ay do not name the sense of approximation; Le Roux–Bengio's
   Theorem 2.4 is in relative entropy.)

Every support point lies on some edge when `m ≥ 1`, so a law with `s` support points satisfies
the hypothesis with `r = s`, and step 1 gives Le Roux–Bengio's Theorem 2.4 (`s + 1` hidden units,
proof in Appendix 5.3) as a consequence. *Needs:* 1.3, 5.1 (step 1 of its route); Tau Ceti
`klDiv_eq_ofReal_sum_log_singleton`.

**Checks.**

- *One edge, no hidden unit.* Two visible units, `q` on `{00, 01}`: `r = 1`, and the products
  with `b_1 = −a` and `b_2` the log-ratio of the masses (`±a` if one of them is `0`) tend to `q`
  as `a → ∞`.
- *A hidden unit is needed for the parity law.* Two visible units, `q = ½(δ_00 + δ_11)`. For a
  product law with marginals `x`, `y`, `KL(q‖p) = −log 2 − ½ log(x(1 − x)y(1 − y)) ≥ log 2`,
  because `x(1 − x) ≤ 1/4`; so no machine without hidden units comes within `log 2`. The support
  is not an edge but lies in two edges, so 5.2 gives one hidden unit, and indeed `b = (−a, −a)`,
  `w = (3a, 3a)`, `c = −4a` give the unnormalised masses `1 + e^(−4a)`, `e^(−a)(1 + e^(−a))`
  (twice) and `1 + e^(−2a)` at `00`, `01`, `10`, `11`, which tend to `1, 0, 0, 1`.
- Step 3 on two visible units, `y = 00`, `l = 2`: `w = (−a, log λ_1 − log λ_0)`, `c = log λ_0`,
  and `w · v + c` is `log λ_0`, `log λ_1`, `log λ_0 − a`, `log λ_1 − a` at `00`, `01`, `10`, `11`,
  so the factor tends to `1 + λ_0`, `1 + λ_1`, `1`, `1`.

### 5.3 Every law on the cube

Prove (`exists_klDiv_lt`) that for every probability measure `q` on `{0, 1}^ι` and every
`ε > 0` some machine with `2^(m−1) − 1` hidden units has `klDiv q (visibleLaw θ) < ε`
(Montúfar–Ay, Corollary 2, p. 5). Route: for `m ≥ 1` fix a unit `l`; the `2^(m−1)` edges
`{y, y ⊕ e_l}` with `y_l = 0` cover the cube, so 5.2 applies with `r = 2^(m−1)`. For `m = 0` the
cube is one point, the expression `2^(0−1) − 1` is `0` in natural numbers, and the only law is the
visible law of the machine with no units. *Needs:* 5.2; Mathlib `Fintype.card_fun`.

**Checks.**

- `m = 1`: no hidden unit is needed; the visible laws are the Bernoulli laws `σ(b)`, and the
  point mass at `1` has `KL = −log σ(b) → 0` as `b → ∞`.
- `m = 2`: one hidden unit (the parity Check of 5.2); `m = 3`: three, against the
  `s + 1 = 9` of Le Roux–Bengio's theorem for a law with full support.

### Examples

- The standard example's visible law `(1/3, 2/3)` is already the visible law of the machine with
  no hidden unit and `b = log 2`.

### Dependencies

- Layer 1 (1.3); Mathlib `Measure.tilted`; Tau Ceti relative entropy on finite sets.

## Scope and ownership

This roadmap owns restricted Boltzmann machines with binary units: the closed forms of their
conditional and marginal laws, the gradient of the log-likelihood for a data law, the two block
Gibbs updates and the visible chain with their reversibility, the geometric ergodicity of the
visible chain with the explicit constant of 4.1, the bias bound of contrastive divergence, the
strict improvement by an added hidden unit and the universal approximation theorems of 5.2–5.3.

Stated by other roadmaps or in the libraries, and used here:

- SimulatedAnnealing 3.1 owns the Gibbs measure `gibbs` of an energy on a finite set, copied
  verbatim; its 1.1 (the coefficient and its column-minimum bound) and 1.2 (Dobrushin's
  contraction) are the suppliers of 4.1.
- QuantumOptimization 1.1 owns `bit`, copied verbatim.
- MathematicalStatisticsFoundations 3.3 owns the gradient of the log partition function of a
  natural exponential family; 2.1 applies it twice and is not a restatement, since its content
  is the closed form of the two means.
- Mathlib owns kernels, their composition, invariance and reversibility (and the implication
  from reversibility to invariance), the logistic function, total variation and relative
  entropy. Tau Ceti owns total variation as an excess over events and the finite formula for
  relative entropy.

Statements of other roadmaps that border this one, none of them used:

- MarkovChainMixing 6.1 owns the Glauber dynamics of a measure on configurations, which resamples
  one uniformly chosen site; the block updates of 3.1 resample a whole layer, a different
  kernel, and the mixing bounds of that roadmap are not used.
- GraphicalModelsAndConditionalIndependence owns factorization and the Markov properties of
  graphs; the qualitative conditional independence of 1.2 is the global Markov property of the
  complete bipartite graph, and 1.2 is stated for its closed form.
- HiddenMarkovModels 6.1 states the contraction of total variation under a minorization for
  probability mass functions; 4.1 uses Dobrushin's coefficient on measures instead.
- HopfieldNetworks owns the deterministic dynamics of Hopfield networks and leaves Boltzmann
  machines out of its scope; UniversalApproximation owns the approximation of functions by
  one-hidden-layer networks, a different statement from the approximation of laws in 5.2–5.3.

Outside the scope: Gaussian and other non-binary units; deep belief networks and deep Boltzmann
machines; concavity properties of the likelihood; convergence of
contrastive divergence learning or of any training procedure; persistent and tempered sampling;
lower bounds on the number of hidden units needed for universal approximation; Fischer–Igel's
constant in their Theorem 2; and every algorithm, program and running time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/SpecialFunctions/Sigmoid.lean`: `Real.sigmoid` (`(1 + exp(−x))⁻¹`),
  `Real.sigmoid_neg` (`σ(−x) = 1 − σ(x)`), `Real.sigmoid_strictMono`. Used in 1.2, 4.1.
- `Mathlib/Probability/Kernel/Basic.lean`: `Kernel.ofFunOfCountable` (a kernel from any function
  on a countable space with measurable singletons).
  `Mathlib/Probability/Kernel/Composition/Comp.lean`:
  `Kernel.comp` (`η ∘ₖ κ`, applying `κ` first), `Kernel.comp_apply`
  (`(η ∘ₖ κ) a = (κ a).bind η`), the monoid structure giving `κ ^ k`. Used in 1.2, 3.2, 4.1.
- `Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`: `Measure.compProd` (`μ ⊗ₘ κ`),
  `Measure.compProd_apply_prod` (`(μ ⊗ₘ κ)(s ×ˢ t) = ∫⁻ a in s, κ a t ∂μ`). Used in 1.2.
- `Mathlib/Probability/Kernel/Invariance.lean`: `Kernel.IsReversible` (detailed balance on
  measurable sets), `Kernel.IsReversible.invariant` (for a Markov kernel, reversibility implies
  invariance), `Kernel.Invariant.comp`. Used in 3.1, 3.2, 4.1.
- `Mathlib/MeasureTheory/Measure/GiryMonad.lean`: `Measure.bind`, `Measure.bind_apply`,
  `Measure.bind_bind`. Used in 4.1.
- `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`: `MeasureTheory.tvDist`
  (`(etvDist μ ν).toReal`, the total variation norm). Used in 4.1, 4.2.
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv`. Used in
  5.1–5.3.
- `Mathlib/MeasureTheory/Measure/Tilted.lean`: `Measure.tilted` (`μ` with density
  `exp(f x)/∫ exp f dμ`). Used in 5.1.
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`;
  `Mathlib/Analysis/Normed/Lp/WithLp.lean`: `WithLp.toLp`;
  `Mathlib/Analysis/InnerProductSpace/LinearMap.lean`: `innerSL`. Used in 2.1.
- `Mathlib/Analysis/Calculus/FDeriv/Add.lean`: `HasFDerivAt.sum`;
  `Mathlib/MeasureTheory/Integral/Bochner/SumMeasure.lean`: `integral_fintype` (an integral over
  a finite type is a finite sum). Used in 2.1, 4.2.
- `Mathlib/MeasureTheory/Integral/Lebesgue/Countable.lean`: `lintegral_fintype`. Used in 3.1.
- `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Finset.prod_univ_sum` (a product of sums is
  a sum of products). Used in 1.2, 1.3. `Mathlib/Data/Fintype/BigOperators.lean`:
  `Fintype.card_fun`. Used in 4.1, 5.3.

### From Tau Ceti

- `TauCeti/MeasureTheory/Measure/TotalVariation.lean`: `MeasureTheory.etvDist_eq_two_mul_iSup_sub`
  (for finite measures of equal total mass, `etvDist μ ν = 2 · ⨆_A (μ A − ν A)`). Used in 4.2,
  step 2.
- `TauCeti/InformationTheory/KullbackLeibler/Finite.lean`:
  `TauCeti.klDiv_eq_ofReal_sum_log_singleton` (on a finite space, for a reference measure
  charging every point, `klDiv μ ν` is the finite sum `Σ_x μ{x} log(μ{x}/ν{x})` plus the mass
  correction). Used in 5.1 and 5.2.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- 3.1: `naturalParameterSpace ν T`, `logPartition ν T η = log ∫ exp⟪η, T x⟫ dν`,
  `exponentialFamilyMeasure ν T η` (the tilt of `ν` by `⟪η, T⟫`). 3.3:
  `hasFDerivAt_logPartition` (for `ν ≠ 0` on a finite-dimensional inner product space with its
  Borel structure and `η` in the interior of the natural parameter space, `logPartition ν id` has
  derivative `⟪∫ x d(exponentialFamilyMeasure ν id η), ·⟫` at `η`). Used in 2.1.

### From TauCetiRoadmap.SimulatedAnnealing

- 3.1: `gibbs U β = Σ_x ofReal(exp(−β U x)/Σ_y exp(−β U y)) • δ_x` on a finite type with
  measurable singletons, copied verbatim. Used throughout.
- 1.1: `dobrushinCoeff κ`, the largest row distance `tvDist (κ x) (κ y) / 2` of a kernel on a
  nonempty finite set, and its column-minimum bound `δ(κ) ≤ 1 − Σ_z min_x κ(x, {z})` for a Markov
  kernel (a stated item of 1.1 without a Lean declaration). 1.2:
  `tvDist_bind_le_dobrushinCoeff_mul` (for a Markov kernel `κ` and probability measures `μ`, `ν`,
  `tvDist (μ.bind κ) (ν.bind κ) / 2 ≤ dobrushinCoeff κ · tvDist μ ν / 2`). Used in 4.1.

### From TauCetiRoadmap.QuantumOptimization

- 1.1: `bit x i` (`1` if `x i` is true, `0` otherwise), copied verbatim. Used throughout.

## References

- Asja Fischer and Christian Igel, *Training restricted Boltzmann machines: an introduction*,
  Pattern Recognition 47 (2014), 25–39; preprint on the author's page (christian-igel.github.io).
  Equation, theorem and page numbers above are those of the preprint, whose printed page numbers
  are its PDF page numbers: eq. (13), p. 8; eqs. (16), (17), p. 9; (18), p. 10; (19)–(22), p. 11;
  (23)–(27), pp. 11–12; (28)–(31), p. 13; (32), Algorithm 1 and Theorem 1 with (33), p. 14;
  Theorem 2 with (34), p. 15. Theorems 1 and 2 are stated there without proof.
- Nicolas Le Roux and Yoshua Bengio, *Representational power of restricted Boltzmann machines and
  deep belief networks*, Neural Computation 20(6) (2008), 1631–1649. Located above by section,
  equation, lemma, theorem and appendix number, as numbered in the authors' preprint: §1.1.1 and
  eq. (1); Lemma 2.1 and Theorems 2.3, 2.4 in §2; proofs in Appendix 5.1 (Lemma 2.1), 5.2
  (Theorem 2.3) and 5.3 (Theorem 2.4).
- Guido Montúfar and Nihat Ay, *Refinements of universal approximation results for deep belief
  networks and restricted Boltzmann machines*, arXiv:1005.1593, version 2 (26 July 2010):
  Theorem 1, pp. 4–5; Corollary 2, p. 5; proof of Theorem 1, pp. 5–7.
