# Roadmap: logarithmic sobolev inequalities for finite markov chains

**Summary.** A logarithmic Sobolev inequality bounds the entropy of a function by the energy that
a Markov chain assigns to it; it controls the smoothing property called hypercontractivity. This
roadmap defines the logarithmic Sobolev constant of a chain on a finite set, computes it on
two-point spaces and for the chain that redraws from its law at every step, shows how it behaves
under products, and proves Gross's equivalence between the inequality and hypercontractivity of
the continuous-time chain, with the resulting bound on the time to equilibrium. Throughout, a
chain is a kernel on a finite set and `π` a probability measure on it; the energy of `f` is the
Dirichlet form `E(f) = ½ Σ_{x,y} (f(x) − f(y))² π(x) κ(x, y)`, the entropy of `f²` is
`Ent_π(f²) = Σ_x π(x) f(x)² log f(x)² − ‖f‖₂² log ‖f‖₂²`, and the logarithmic Sobolev constant
`α` is the largest constant with `α Ent_π(f²) ≤ E(f)` for every `f`.

The headline theorems are these.

- *Comparison with the spectral gap.* For every kernel and every probability measure, `2α ≤ γ`,
  the spectral gap, and `α ≥ c(π_min) γ`, where `π_min` is the least mass of a state and
  `c(p) = (1 − 2p)/log((1 − p)/p)`, with `c(1/2) = 1/2`.
- *Two points and the redrawing chain.* For a positive law `π`, the chain that redraws from `π`
  has constant exactly `c(π_min)`. On two points the constant of every chain is an explicit
  multiple of `c` at the mass of either point.
- *Tensorization.* For the product chain that moves coordinate `i` by its own chain with weight
  `w_i`, under the product law, the constant is the least of the numbers `w_i α_i`, provided no
  factor law is a point mass. For the lazy walk on the `n`-cube it is `1/(2n)`.
- *Hypercontractivity.* For a reversible chain with a positive stationary law on at least two
  states, `H_t = exp(t(P − I))` satisfies `‖H_t f‖_q ≤ ‖f‖₂` for every `f` whenever `t ≥ 0`,
  `q ≥ 2` and `q − 1 ≤ exp(4ct)`, exactly when `c ≤ α`. If moreover `α > 0`, then for a state `x`
  with `π(x) ≤ 1/e` and every `c ≥ 0` the chain started at `x` is within total variation
  `e^(1−c)/2` of `π` at every time `t ≥ log log(1/π(x))/(4α) + c/γ`.

The roadmap builds on MarkovChainMixing, which supplies the Dirichlet form, the spectral gap and
its Poincaré inequality, and whose normalization of total variation (half the total variation
norm) is used here. Mathlib supplies Markov kernels, reversibility and the matrix exponential.
RandomMatrices treats logarithmic Sobolev inequalities for gradients on
Euclidean spaces, a different inequality.

Layer 1 defines entropy and the logarithmic Sobolev constant and compares it with the spectral
gap. Layer 2 computes the two-point constant, identifies the constant of the redrawing chain and
proves tensorization. Layer 3 defines the continuous-time semigroup and proves Gross's theorem and
the mixing bound.

## Conventions

- **State spaces.** `S` is a finite type with a σ-algebra in which singletons are measurable
  (`[Fintype S] [MeasurableSpace S] [MeasurableSingletonClass S]`). `[Nonempty S]` is assumed
  where a least mass is taken, `[Nontrivial S]` where at least two states are needed, and
  `[DecidableEq S]` where matrices on `S` are multiplied.
- **Chains and laws.** A chain is a kernel `κ : Kernel S S`, and `κ(x, y)` abbreviates
  `(κ x).real {y}`; `P` is the real matrix with entries `κ(x, y)`, which agrees entry by entry
  with the transition matrix of MarkovChainMixing 2.1 (the real coercion of Tau Ceti's
  `Kernel.toMatrix`). `π` is a probability measure on
  `S`, `π(x)` abbreviates `π.real {x}`, and `π_min` is the least of the numbers `π(x)`.
  Reversibility is Mathlib's `κ.IsReversible π`. A statement asks for a Markov kernel, a
  reversible chain or a positive law only where it needs one; several statements hold for every
  kernel and every probability measure, and say so.
- **Dirichlet form and spectral gap.** `dirichletForm κ π f` and `spectralGap κ π` (written `γ`)
  are those of MarkovChainMixing 2.4, copied verbatim: `E(f) = ½ Σ_{x,y} (f x − f y)² π(x) κ(x, y)`
  and `γ` the infimum of `E(f)/Var_π(f)` over the `f` of nonzero variance, `0` when there is
  none. `Var_π f` is Mathlib's `Var[f; π]`.
- **Entropy.** For `g : S → ℝ`, `Ent_π(g) = Σ_x π(x) g(x) log g(x) − m log m` with
  `m = Σ_x π(x) g(x)`; it is applied to `g = f²`. Mathlib's `Real.log` has `log 0 = 0`, which
  gives the convention `0 log 0 = 0`. `Ent_π(f²)` equals `Σ_x π(x) f(x)² log(f(x)²/‖f‖₂²)`, the
  functional `L(f)` of Diaconis and Saloff-Coste; the functional of Aldous and Fill is half of it,
  and their logarithmic Sobolev time `τ_l` is `1/(2α)`. Every source constant quoted below has
  been converted to `α`.
- **Junk values.** Real division by zero is `0`, and an infimum of an empty set of reals is `0`.
  So `α` and `γ` are `0` on one state and when `π` is a point mass; each statement either holds
  there or excludes it.
- **Norms.** `‖f‖_q = (Σ_x π(x) |f(x)|^q)^(1/q)` for real `q > 0`, with `Real.rpow`.
- **Continuous time.** `H_t = exp(t(P − I))` for real `t`, Mathlib's `NormedSpace.exp` of the real
  matrix `t • (P − 1)`. Mathlib puts no norm on matrices; routes that differentiate in `t` choose
  one locally (for instance `Matrix.linftyOpNormedRing` with `Matrix.linftyOpNormedAlgebra`), and
  the exponential does not depend on the choice. `H_t f` is the matrix–vector product
  `H_t *ᵥ f`, and `H_t(x, y)` is an entry.
- **Total variation.** As in MarkovChainMixing (Conventions), the distance between two
  probability vectors is half the total variation norm, with values in `[0, 1]`: for the row of
  `H_t` at `x` it is `½ Σ_y |H_t(x, y) − π(y)|`, which is MarkovChainMixing's `tvDist / 2` by the
  formula of MarkovChainsAndRenewal 3.5 whenever the row is a probability vector.

## Layer 1: entropy and the logarithmic Sobolev constant

### 1.1 Entropy

Define `funEntropy π g` as `Ent_π(g)` of the Conventions, and carry over `dirichletForm` and
`spectralGap` from MarkovChainMixing 2.4. The routes below use the following elementary facts,
for a probability measure `π` and every `f`; they are part of the basic API of the definitions
rather than separate targets:

- `Ent_π(f²) ≥ 0`, with equality exactly when `|f|` is constant on the states of positive mass
  (Jensen's inequality for the strictly convex function `u ↦ u log u` on `[0, ∞)`);
- `Ent_π((a f)²) = a² Ent_π(f²)` for real `a`, and `Ent_π(f²) = Σ_x π(x) f(x)² log(f(x)²/‖f‖₂²)`;
- if `π(x) > 0` for all `x`, `g ≥ 0` and `Σ_x π(x) g(x) = 1`, then `Ent_π(g)` is the
  Kullback–Leibler divergence of the probability measure with masses `g(x) π(x)` from `π`,
  `(klDiv μ π).toReal`, by the finite formula of Tau Ceti;
- `E(f) ≥ 0`, `E(f + a) = E(f)` and `E(a f) = a² E(f)` for constants `a`, and `E(|f|) ≤ E(f)`.

(Aldous and Fill, Chapter 8, (52) and the sentence after it, for the first item when `π` is
positive.)

**Checks.**

- The zero function and every constant function have entropy `0`: for `f = a`,
  `a² log a² − a² log a² = 0`.
- `f` the indicator of a state of mass `p`: `Ent_π(f²) = −p log p`, which is `(log 2)/2 ≈ 0.3466`
  for `p = 1/2`. The functional without the term `m log m` would give `0` here and would not
  vanish on the constant `2`, where it is `4 log 4`.
- `π` a point mass at `a`: `Ent_π(f²) = f(a)² log f(a)² − f(a)² log f(a)² = 0` for every `f`.

*Needs:* MarkovChainMixing 2.4 (the definitions); Mathlib `Real.log`, `Real.strictConvexOn_mul_log`,
`InformationTheory.klDiv`; Tau Ceti `TauCeti.klDiv_eq_ofReal_sum_log_singleton`.

### 1.2 The logarithmic Sobolev constant

Define `logSobolevConstant κ π` (written `α`) as the infimum of `E(f)/Ent_π(f²)` over the `f`
with `Ent_π(f²) ≠ 0`, and `0` when there is none. Prove:

- `α ≥ 0`, the inequality `α · Ent_π(f²) ≤ E(f)` holds for every `f` (for `Ent_π(f²) = 0` because
  `E(f) ≥ 0`), and the infimum may be taken over the positive `f` alone, because
  `E(|f|) ≤ E(f)`;
- (`two_mul_logSobolevConstant_le_spectralGap`) for every kernel `κ` and every probability measure
  `π`, `2α ≤ γ`. Route: for `g` of nonzero variance and `f = 1 + ε g`,
  `Ent_π(f²) = 2 ε² Var_π(g) + O(ε³)` and `E(f) = ε² E(g)`, so `α ≤ E(g)/(2 Var_π(g)) + O(ε)`.
  (Aldous and Fill, Chapter 8, Lemma 22 and its proof, for finite irreducible reversible chains;
  the proof uses neither hypothesis, and the general statement is proved here.)

**Checks.**

- One state, or `π` a point mass: no `f` has `Ent_π(f²) ≠ 0`, so `α = 0`, and `γ = 0`; the
  inequality reads `0 ≤ 0`.
- The chain on two states with `κ(a, b) = 3/10`, `κ(b, a) = 1/10` and its stationary law
  `π = (1/4, 3/4)`: `γ = 2/5` and `α = (2/5) · c(1/4) = 1/(5 log 3) ≈ 0.1820` (by 2.1), so
  `2α ≈ 0.3641 < 0.4`.
- The uniform two-point law with the redrawing chain: `α = 1/2` and `γ = 1`, an equality. The
  lazy walk on the `n`-cube has `α = 1/(2n)` and `γ = 1/n` (2.3), again an equality.

*Needs:* 1.1; MarkovChainMixing 2.4 (`spectralGap`).

### Examples

The two-state chains and the cube of the Checks; the redrawing chain of 2.2.

### Dependencies

Layer 1 uses MarkovChainMixing 2.4, Mathlib's logarithm, convexity of `u log u` and
Kullback–Leibler divergence, and Tau Ceti's finite formula for it.

## Layer 2: the two-point constant and tensorization

### 2.1 The two-point space

Define `twoPointConstant p` (written `c(p)`) as `1/2` if `p = 1/2` and
`(1 − 2p)/log((1 − p)/p)` otherwise. Prove:

- `c(1 − p) = c(p)`; `c` is continuous on `(0, 1)`, the value `1/2` being the limit at `1/2`;
  `c` is increasing on `(0, 1/2]` and `0 < c(p) ≤ 1/2` on `(0, 1)`; and `c(0) = c(1) = 0` by the
  junk values of division and of the logarithm;
- (`logSobolevConstant_bool`) for every kernel `κ` on `Bool` and every probability measure `π`
  on `Bool`, writing `π₀ = π(false)` and `π₁ = π(true)`,
  `α = (π₀ κ(false, true) + π₁ κ(true, false)) / (2 π₀ π₁) · c(π₀)`.

Route: on two points `E(f) = ½ (π₀ κ(false, true) + π₁ κ(true, false)) (f(false) − f(true))²`
and `Var_π(f) = π₀ π₁ (f(false) − f(true))²`, so `α` is the stated multiple of the constant of
the redrawing chain, whose Dirichlet form is `Var_π`. For that chain one may take `f ≥ 0` with
`E_π f = 1`; the ratio `Ent_π(f²)/Var_π(f)` is then a function of `x = 1/(f(false) − f(true))`
whose largest value, `1/c(π₀)`, is attained at `x = 2π₀π₁/(1 − 2π₀)` when `π₀ ≠ 1/2`, and is
approached as `x → ∞` when `π₀ = 1/2`. (Aldous and Fill, Chapter 8, Example 28 for the redrawing
chain and Example 29 for a two-state chain with its stationary law; the form for an arbitrary
kernel and law is proved here.) When `π` is a point mass both sides are `0`, the right side
because its denominator vanishes.

**Checks.**

- `c(1/4) = 1/(2 log 3) ≈ 0.4551`, `c(1/3) = 1/(3 log 2) ≈ 0.4809`, `c(1/10) = 0.8/log 9 ≈ 0.3641`,
  `c(0.49) ≈ 0.49993`.
- Without the separate value at `1/2` the formula would give `0/log 1 = 0` there, while the
  uniform two-point redrawing chain has `α = 1/2`.
- The redrawing chain `κ(x, ·) = π`: the factor is `(π₀ π₁ + π₁ π₀)/(2 π₀ π₁) = 1`. A two-state
  chain with `κ(false, true) = a`, `κ(true, false) = b` and stationary `π = (b, a)/(a + b)`: the
  factor is `a + b`, which is its spectral gap. The identity kernel: the factor is `0`, and `α = 0`
  because `E = 0`.
- `π` the point mass at `false`: `α = 0`, and the right side is `0` because `π₀ π₁ = 0`.

*Needs:* 1.1, 1.2; Mathlib `Real.log`, `Bool`.

### 2.2 The redrawing chain

For the kernel `Kernel.const S π`, which moves to a point drawn from `π` whatever the present
state, `E(f) = Var_π(f)`, so `γ = 1` unless `π` is a point mass. Prove:

- (`logSobolevConstant_const`) if `π(x) > 0` for every `x`, then
  `logSobolevConstant (Kernel.const S π) π = c(π_min)`. (Chen, Liu and Saloff-Coste, Example
  (E6), p. 242, for every positive law on a finite set, proved there by reduction to the two-point
  space; Aldous and Fill, Chapter 8, Example 30, state it for `π_min < 1/2` and refer the proof to
  Diaconis and Saloff-Coste. The two-point case is 2.1. On one state both sides are `0`: `α` by
  the junk value and `c(1) = 0`.)
- (`twoPointConstant_mul_spectralGap_le`) for every kernel `κ` and every probability measure `π`,
  `c(π_min) · γ ≤ α`. Route: if `π_min = 0` the left side is `c(0) · γ = 0 ≤ α`. Otherwise, for
  `f` with `Ent_π(f²) ≠ 0`, the previous item gives `c(π_min) Ent_π(f²) ≤ Var_π(f)`, and the
  Poincaré inequality `γ Var_π(f) ≤ E(f)` finishes. MarkovChainMixing 2.4 states that inequality
  for Markov kernels; for an arbitrary kernel it holds by the definition of `γ` as an infimum of
  nonnegative ratios, and `E(f) ≥ 0` covers `Var_π(f) = 0`. (Aldous and Fill,
  Chapter 8, Corollary 31, for reversible chains with `π_min < 1/2`; the general statement is
  proved here.)

**Checks.**

- Uniform law on three points: `α = c(1/3) ≈ 0.4809`, and `γ = 1`.
- Positivity is needed in the first item: for `π = (0, 3/10, 7/10)`, `α = c(3/10) ≈ 0.4721`
  (the state of mass `0` plays no role), while `c(π_min) = c(0) = 0`.
- On two states the second item is an equality for every kernel and every positive `π`: both
  sides are `γ · c(π₀)` by 2.1, since `γ = (π₀ κ(false, true) + π₁ κ(true, false))/(2 π₀ π₁)`
  there.

*Needs:* 1.1, 1.2, 2.1; MarkovChainMixing 2.4 (Poincaré inequality); Mathlib `Kernel.const`.

### 2.3 Tensorization

Let `ι` be a finite type with decidable equality, `T i` finite state spaces as in the
Conventions, `κ i` Markov kernels on `T i` and `π i` probability measures on `T i`. For weights
`w : ι → ℝ≥0` define `coordinateKernel w κ` on `∀ i, T i`: at `x` it is
`Σ_i w_i · (κ i (x i)).map (Function.update x i)`, the chain that picks coordinate `i` with
probability `w_i` and moves it by `κ i`, when the weights sum to `1`. The product law is Mathlib's
`Measure.pi π`. Prove:

- the Dirichlet form splits: `E(f) = Σ_i w_i Σ_x π(x) E_i(f along coordinate i at x)`, where
  `E_i` is the Dirichlet form of `κ i` for `π i` applied to `y ↦ f (Function.update x i y)`, and
  the sum is over `x` in the product with `π(x)` the product mass (Aldous and Fill, Chapter 8,
  Lemma 35, for two factors in continuous time);
- subadditivity of entropy: `Ent_π(f²)` is at most the sum over `i` of the `π`-average of the
  entropies of `f²` along coordinate `i` (the standard tensorization of entropy for product
  measures, by induction on the number of factors; Aldous and Fill, Chapter 8, proof of
  Theorem 36, reach the two-factor case of the theorem instead by splitting the functional into a
  conditional part and the entropy of the conditional `L²` norms);
- (`logSobolevConstant_coordinateKernel`) for all weights `w_i ≥ 0`, if `(π i)(x) < 1` for every
  `i` and `x`, that is no factor law is a point mass, then `α = min_i w_i · α(κ i, π i)` (for
  empty `ι` both sides are `0`: the product is a one-point space). The two items above give `≥`;
  a function of one coordinate gives `≤`. (Aldous and Fill, Chapter 8, Theorem 36, for two
  factors in continuous time, where the rates add; the weighted form is the product lemma of
  Diaconis and Saloff-Coste and the same computation.)
- with the same hypothesis, `γ = min_i w_i · γ(κ i, π i)`, by the same argument with the variance,
  which is also subadditive.

**Checks.**

- The lazy walk on the `n`-cube (MarkovChainMixing 5.3) is `coordinateKernel` with `w_i = 1/n`
  and every factor the uniform two-point redrawing chain, so `α = (1/n)(1/2) = 1/(2n)` and
  `γ = 1/n`; for `n = 2`, `α = 1/4`. (Aldous and Fill, Chapter 8, Example 37, treat the walk that
  flips a uniform coordinate, which moves twice as fast: `α = 1/n` and `γ = 2/n` there.)
- A point mass factor breaks the equality: with `π 0` a point mass (so `α(κ 0, π 0) = 0`) and
  `w = (1/2, 1/2)`, functions are constant in the first coordinate on the support and
  `α = α(κ 1, π 1)/2 > 0`, while the minimum is `0`. A one-state factor is such a case.
- A zero weight: with `w = (1, 0)` the second coordinate never moves, a function of it alone has
  `E = 0` and positive entropy, and `α = 0 = min(α(κ 0, π 0), 0)`.
- The weights need not sum to `1`: both sides are homogeneous of degree one in `w`. On
  `2 × 3` states with random reversible factors and weights up to `3` the two sides agree to
  `10⁻⁶`.

*Needs:* 1.1, 1.2; Mathlib `Kernel.ofFunOfCountable`, `Measure.map`, `Function.update`,
`measurable_update`, `Measure.pi`, `Measure.pi_singleton`.

### Examples

The cube; the product of the redrawing chain on three points with a two-state chain.

### Dependencies

Layer 2 uses Layer 1, MarkovChainMixing 2.4 and Mathlib's kernels and product measures.

## Layer 3: hypercontractivity and mixing in continuous time

### 3.1 The semigroup and the `L^q` norms

Define `heatSemigroup κ t`, the matrix `H_t = exp(t(P − I))` of the Conventions, and
`weightedLpNorm π q f`, the norm `‖f‖_q`. For a Markov kernel the routes below use these facts,
each read off Mathlib's exponential: `H_0 = 1` and `H_(s+t) = H_s H_t`
(`Matrix.exp_add_of_commute`); `t ↦ H_t` has derivative `H_t (P − 1) = (P − 1) H_t`
(`hasDerivAt_exp_smul_const` and `hasDerivAt_exp_smul_const'`, with a matrix norm chosen locally);
`H_t = e^(−t) exp(tP)`, so for `t ≥ 0` the entries of `H_t` are nonnegative, as a sum of
nonnegative matrices, and its rows sum to `1`, since `(P − 1) 1 = 0`. If `κ` is reversible for
`π`, `P` is self-adjoint for `⟨f, g⟩_π = Σ_x π(x) f(x) g(x)` (MarkovChainMixing 2.1), hence so
is `H_t`, and `d/dt ‖H_t f‖₂² = −2 E(H_t f)`.

**Checks.**

- One state: `P = 1` and `H_t = 1` for all `t`.
- The redrawing chain: `Π = P` satisfies `Π² = Π`, so `H_t = e^(−t) I + (1 − e^(−t)) Π`; the row
  at `x` is `e^(−t) δ_x + (1 − e^(−t)) π`, and its distance to `π` is `e^(−t) (1 − π(x))`.
- `‖f‖₂² = Σ_x π(x) f(x)²`, and `q ↦ ‖f‖_q` is nondecreasing for a probability measure, so
  `‖H_t f‖_q ≤ ‖f‖₂` with `q > 2` is a gain of integrability.

*Needs:* Mathlib `NormedSpace.exp`, `Matrix.exp_add_of_commute`, `hasDerivAt_exp_smul_const`,
`hasDerivAt_exp_smul_const'`, `Matrix.linftyOpNormedRing`, `Matrix.linftyOpNormedAlgebra`;
MarkovChainMixing 2.1 (self-adjointness) and 2.4 (`E(f) = ⟨f, f⟩_π − ⟨f, P f⟩_π`).

### 3.2 Gross's theorem

(`forall_weightedLpNorm_heatSemigroup_le_iff`) Let `S` have at least two elements, `κ` be a
Markov kernel reversible for `π`, and `π(x) > 0` for every `x`. For every real `c`, the
following are equivalent: for all `t ≥ 0`, all `q ≥ 2` with `q − 1 ≤ exp(4ct)` and all `f`,
`‖H_t f‖_q ≤ ‖f‖₂`; and `c ≤ α`. (Aldous and Fill, Chapter 8, Theorem 24 in the form (57), with
`u = 1/(2c)`, and Lemma 25, for finite irreducible reversible chains; the proof does not use
irreducibility, and a reducible chain is the third Check below. The theorem is due to Gross in
the Euclidean setting, and to Diaconis and Saloff-Coste for finite chains.)

Route. For `c ≤ 0` the condition allows only `q = 2`, where it is the contraction of 3.1, and
`c ≤ 0 ≤ α`. For `c > 0` and `f ≥ 0`, `f ≠ 0`, put `q(t) = 1 + e^(4ct)` and
`F(t) = ‖H_t f‖_q(t)`; then `F′(t)` has the sign of
`(q′(t)/q(t)) L_q(t)(H_t f) − E(H_t f, (H_t f)^(q(t)−1))`, where
`L_q(g) = Σ_x π(x) g(x)^q log(g(x)/‖g‖_q)` and `E(f, g)` is the bilinear form of `E`. If the
inequality holds, then for `‖f‖₂ = 1` the derivative is `F′(0) = c Ent_π(f²) − E(f)` (since
`q′(0) = 4c` and `L_2(f) = Ent_π(f²)/2`), and `F′(0) ≤ 0` gives `c Ent_π(f²) ≤ E(f)`, so
`c ≤ α`. Conversely, if `c ≤ α`, the inequality `E(g, g^(q−1)) ≥ (4(q − 1)/q²) E(g^(q/2))`
for `g ≥ 0` (from
`(b^(q−1) − a^(q−1))(b − a) ≥ (4(q − 1)/q²)(b^(q/2) − a^(q/2))²` for `0 ≤ a < b`) and the
inequality for `g^(q/2)` give `F′ ≤ 0`, hence `‖H_t f‖_q(t) ≤ ‖f‖₂`; a smaller `q` follows because
`q ↦ ‖·‖_q` is nondecreasing, and a general `f` from `|H_t f| ≤ H_t |f|`, which uses the
nonnegative entries of `H_t`.

**Checks.**

- At least two states are needed: on one state `H_t = 1`, the left side holds for every `c`, and
  `α = 0`. Positivity of `π` is needed: for the point mass at an absorbing state `a` of a
  reversible chain on two states, `H_t f (a) = f(a)`, the left side holds for every `c`, and
  `α = 0`.
- The uniform two-point redrawing chain, `α = 1/2`: with `f = (1 + b, 1 − b)`, `H_t f` is
  `(1 + e^(−t) b, 1 − e^(−t) b)`, and the theorem reads
  `((|1 + ρb|^q + |1 − ρb|^q)/2)^(1/q) ≤ (1 + b²)^(1/2)` for `ρ = e^(−t)` and `ρ² (q − 1) ≤ 1`.
  For `q = 4`, `ρ² = 1/3` the fourth powers are `1 + 2b² + b⁴/9 ≤ (1 + b²)²`.
- A reducible reversible chain (two blocks with uniform `π` on four states) has `α = 0`, and for
  `c > 0` the indicator `1_A` of a block is fixed by `H_t` with `‖1_A‖_q = (1/2)^(1/q)`, more than
  `‖1_A‖₂ = (1/2)^(1/2)` for `q > 2`: the left side fails, as it must.
- Random reversible chains on `2` to `4` states: no `f`, `t ≤ 3` and `q ≤ 1 + e^(4αt)` with
  `‖H_t f‖_q > ‖f‖₂` was found, and with `c = 1.2 α` the inequality fails at `t = 0.2`.

*Needs:* 1.1, 1.2, 3.1; Mathlib `Real.rpow`, `Real.inner_le_Lp_mul_Lq`.

### 3.3 Mixing from hypercontractivity

(`sum_abs_heatSemigroup_sub_le`) Let `κ` be a Markov kernel reversible for `π`, `π(y) > 0` for
every `y`, and `α > 0` (then `γ ≥ 2α > 0` by 1.2). Let `x` be a state with `π(x) ≤ e^(−1)`, let
`c ≥ 0` and `t ≥ log(log(1/π(x)))/(4α) + c/γ`. Then

    Σ_y π(y) (H_t(x, y)/π(y) − 1)² ≤ e^(2(1 − c))   and   ½ Σ_y |H_t(x, y) − π(y)| ≤ e^(1 − c)/2.

Both are stated in `sum_abs_heatSemigroup_sub_le`. (Aldous and Fill, Chapter 8, Theorem 26(a)
for the first, stated there for finite irreducible reversible chains, and (3) for the passage
to total variation by the Cauchy–Schwarz inequality.
Here `α > 0` forces `γ > 0`, so the chain is irreducible.)

Route. Write `t = s + u` with `s = log(log(1/π(x)))/(4α) ≥ 0`, so that
`q(s) = 1 + e^(4αs) = 1 + log(1/π(x))`. By symmetry of `H_s` and Hölder's inequality with the
exponent conjugate to `q(s)`, the `L²` distance at time `t` is at most
`π(x)^(−1/q(s)) ‖H_s‖_(2→q(s)) e^(−γu)`; the middle factor is at most `1` by 3.2, the first is at
most `e`, and `e^(−γu) ≤ e^(−c)`. The decay `Var_π(H_u g) ≤ e^(−2γu) Var_π(g)` follows from
`d/du Var_π(H_u g) = −2 E(H_u g)` (3.1) and the Poincaré inequality of MarkovChainMixing 2.4.

**Checks.**

- `π(x) ≤ e^(−1)` is needed: for the redrawing chain on two states with `π = (1 − ε, ε)` and the
  start at the heavy state, `log(log(1/(1 − ε)))` is very negative; with `c = −γ log(log(1/π(x)))/(4α)`
  the time `t = 0` is allowed, the distance is `ε`, and for `ε = 1/100` the bound is
  `e^(1−c)/2 ≈ 0.0062 < 0.01`.
- `α > 0` is needed: the identity kernel on three states with uniform `π` has `α = γ = 0`; the
  junk values `1/(4α) = 0` and `c/γ = 0` make every `t ≥ 0` admissible, while `H_t = 1` keeps the
  distance at `2/3`, more than `e^(1−c)/2` for every `c ≥ 1`.
- The cube with `n = 3`: `π(x) = 1/8`, `α = 1/6`, `γ = 1/3`; for `c = 1` the time is
  `(3/2) log(3 log 2) + 3 ≈ 4.098`, and the distance there is about `0.187 ≤ 1/2`.
- `c ≥ 0` is needed: a negative `c` admits negative times, where `H_t` has negative entries. For
  the walk on the path `a, b, c` with rows `(0, 1, 0)`, `(1/2, 0, 1/2)`, `(0, 1, 0)`, reversible
  for `π = (1/4, 1/2, 1/4)` with eigenvalues `1, 0, −1`, `γ = 1` and `c(1/4) ≤ α ≤ 1/2` by 1.2
  and 2.2. For `x = a` and `c = −2` the time `log(log 4)/(4α) − 2` lies in `[−1.84, −1.82]`, where
  the distance exceeds `19`, while `e^(1−c)/2 = e³/2 ≈ 10.04`.
- The redrawing chain on three uniform points: `α = c(1/3) ≈ 0.4809`, `γ = 1`, and the distance
  `e^(−t) · 2/3` is below `e^(1−c)/2` at `t = log(log 3)/(4α) + c ≈ 0.0489 + c`.

*Needs:* 1.2, 3.1, 3.2; MarkovChainMixing 2.4 (Poincaré inequality); Mathlib `Real.log`,
`Real.inner_le_Lp_mul_Lq`.

### Examples

The redrawing chains, the two-state chains and the cube, for which 3.3 gives a time of order
`(n/4) log n` with the constants of 2.3.

### Dependencies

Layer 3 uses Layer 1 (1.1, 1.2), MarkovChainMixing 2.1 and 2.4, MarkovChainsAndRenewal 3.1 and
Mathlib's matrix exponential.

## Scope and ownership

This roadmap owns, for chains on finite state spaces: the entropy functional `Ent_π(f²)` with the
Dirichlet form of a chain, the logarithmic Sobolev constant, the inequality `2α ≤ γ` and its
reverse `c(π_min) γ ≤ α`, the two-point constant and the constants of two-state and redrawing
chains, tensorization of `α` and `γ` for weighted coordinate chains, Gross's equivalence between
the logarithmic Sobolev inequality and hypercontractivity of `exp(t(P − I))`, and the mixing bound
3.3 that follows.

Left to other roadmaps and to the libraries:

- MarkovChainMixing (an open roadmap, not on main, cited as a supplier) states the Dirichlet form,
  the spectral gap, the Poincaré inequality, the spectral decomposition of reversible chains,
  comparison of spectral gaps, Cheeger's inequality and the discrete-time mixing bounds from the
  spectral gap; the definitions used here are copied from its 2.4 and none of its theorems is
  restated. Its lazy walk on the cube (5.3) is the example of 2.3 above.
- BooleanFunctionAnalysis (an open roadmap, not on main) states hypercontractivity of the noise
  operator on the cube with the uniform measure, for all exponents `1 ≤ p ≤ q`, by Bonami's
  two-point inequality and induction on the dimension (its 4.1 and 4.2). The theorem of 3.2 above
  is a different statement: it is for every reversible chain on a finite set, goes from `L²` to
  `L^q` only, and is proved from the logarithmic Sobolev inequality. On the cube, `H_t` of the
  lazy walk is the noise operator with `ρ = e^(−t/n)`, and 3.2 with `α = 1/(2n)` gives its case
  `p = 2` for `0 < ρ ≤ 1`. This roadmap does not depend on that one.
- ContinuousTimeMarkovChains (a roadmap not on main) treats the matrix exponential of
  rate matrices: positivity and stochasticity of `exp(tQ)`, the Kolmogorov equations, uniformization
  and convergence. This roadmap defines `H_t` for `Q = P − I` only and states none of those
  theorems; the facts listed in 3.1 are read off Mathlib's exponential where a route needs them.
  This roadmap does not depend on that one.
- RandomMatrices 2.2 owns logarithmic Sobolev and Poincaré inequalities for gradients on Euclidean
  spaces, their tensorization and Herbst's argument; the Dirichlet form of a chain here is a
  different energy, and no Euclidean statement is made.
- Kullback–Leibler divergence is Mathlib's `klDiv`, with the finite formula of Tau Ceti; the
  entropy of a random variable with finitely many values (Shannon entropy) is the subject of other
  roadmaps and is not used.
- Mathlib supplies kernels, reversibility, product measures and the matrix exponential.

Out of scope: the modified logarithmic Sobolev inequality and entropy decay in discrete time,
hypercontractivity of discrete-time chains, Nash inequalities, comparison of logarithmic Sobolev
constants between chains, the constants of the cycle and of random transpositions, concentration
of measure for Markov chains, the asymptotic variance of ergodic averages and orderings of
chains, non-reversible chains in 3.2 and 3.3, and chains on infinite state spaces.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.Kernel`, `ProbabilityTheory.IsMarkovKernel`, `Kernel.const` (the constant
  kernel), `Kernel.ofFunOfCountable` (a kernel from any family of measures on a countable
  measurable space with measurable singletons) (`Mathlib/Probability/Kernel/Basic.lean`);
  `Kernel.IsReversible` and `Kernel.IsReversible.invariant` (a Markov kernel reversible for `π`
  leaves `π` invariant) (`Mathlib/Probability/Kernel/Invariance.lean`).
- `MeasureTheory.Measure.real`, `MeasureTheory.Measure.map`, `MeasureTheory.Measure.pi` and
  `MeasureTheory.Measure.pi_singleton` (the product mass of a point is the product of the
  masses) (`Mathlib/MeasureTheory/Constructions/Pi.lean`); `Function.update` and
  `measurable_update`.
- `ProbabilityTheory.variance` (`Var[f; π]`) (`Mathlib/Probability/Moments/Variance.lean`).
- `Real.log` (with `log 0 = 0`), `Real.strictConvexOn_mul_log` (strict convexity of `u log u` on
  `[0, ∞)`), `Real.rpow`, and `Real.inner_le_Lp_mul_Lq` (Hölder's inequality for finite sums).
- `InformationTheory.klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`).
- `NormedSpace.exp` (`Mathlib/Analysis/Normed/Algebra/Exponential.lean`),
  `Matrix.exp_add_of_commute` (`Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`),
  `hasDerivAt_exp_smul_const` and `hasDerivAt_exp_smul_const'` (derivative of `u ↦ exp(u • x)` in
  a complete normed algebra) (`Mathlib/Analysis/SpecialFunctions/Exponential.lean`),
  `Matrix.linftyOpNormedRing` and `Matrix.linftyOpNormedAlgebra`
  (`Mathlib/Analysis/Matrix/Normed.lean`).

### From Tau Ceti

- `TauCeti.klDiv_eq_ofReal_sum_log_singleton`
  (`TauCeti/InformationTheory/KullbackLeibler/Finite.lean`): for finite measures on a finite type
  with a reference measure charging every point, `klDiv μ ν` is `ENNReal.ofReal` of
  `Σ_x μ(x) log(μ(x)/ν(x)) + ν(S) − μ(S)`.

### From TauCetiRoadmap.MarkovChainMixing

MarkovChainMixing is an open roadmap, not on main; its sections are cited as they stand in its
open version.

- Conventions: total variation as half the total variation norm, `tvDist / 2`.
- 2.1: the transition matrix of a kernel; for a kernel reversible for `π`,
  `⟨P f, g⟩_π = ⟨f, P g⟩_π`.
- 2.4: the definitions `dirichletForm` and `spectralGap` (copied verbatim into `Suggested.lean`);
  for a stationary `π`, `E(f) = ⟨f, f⟩_π − ⟨f, P f⟩_π`; the Poincaré inequality
  `γ Var_π(f) ≤ E(f)` for every `f`.
- 5.3: the lazy walk on the cube, used in an Example and a Check of 2.3.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) 3.1 (Layer 3, item 1): the
  singleton and matrix forms of `Kernel.Invariant` and `Kernel.IsReversible`; 3.5 (Layer 3,
  item 5): the formula `tvDist μ ν = Σ_y |μ {y} − ν {y}|` on a countable space, used in the
  Conventions.

## References

- D. Aldous and J. A. Fill, *Reversible Markov chains and random walks on graphs*, Chapter 8,
  "Advanced L² techniques for bounding mixing times", draft of May 19, 1999, made available by
  the authors at stat.berkeley.edu/~aldous/RWG/book.html. Section 4 (equations (52) to (73),
  Lemma 22, Theorems 24, 26 and 36, Lemmas 25 and 35, Examples 28 to 30 and 37, Corollary 31).
- G.-Y. Chen, W.-W. Liu and L. Saloff-Coste, *The logarithmic Sobolev constant of some finite
  Markov chains*, Annales de la Faculté des sciences de Toulouse, Mathématiques 17 (2008), 239–290,
  open access on Numdam. Section 1.1, Example (E6).
- P. Diaconis and L. Saloff-Coste, *Logarithmic Sobolev inequalities for finite Markov chains*,
  Annals of Applied Probability 6 (1996), 695–750. Named for attribution; not consulted.
- L. Gross, *Logarithmic Sobolev inequalities*, American Journal of Mathematics 97 (1975),
  1061–1083. Named for attribution; not consulted.
