# Roadmap: The entropy method and concentration on product spaces

**Summary.** This roadmap builds the general theory of concentration for functions of
independent random variables that do not live on a Euclidean space: functions on an arbitrary
product of probability spaces, suprema of bounded empirical processes, martingales with
increments bounded on one side, and sums of independent vectors in a normed space. It starts from
sub-gamma variables, the common language of the tail bounds that follow, and proves Bennett's
inequality, Bernstein's inequality under moment conditions and the Paley–Zygmund lower bound. It
then develops the entropy functional of a nonnegative function (duality and variational formulas,
the comparison lemma for the differential inequalities of Herbst's argument, the transportation
lemma linking moment generating functions to relative entropy), the subadditivity of entropy on
products, Han's inequality for relative entropies, the modified logarithmic Sobolev inequality and
its consequences (one-sided bounded differences in quadratic mean, self-bounding and weakly
self-bounding functions, the exponential Efron–Stein inequality), and the transport method:
the Bobkov–Götze characterization of the transport-entropy inequality, the maximal coupling,
Marton's inequality and its tensorization, and Talagrand's convex distance inequality. It ends
with the Bernstein-type and Bousquet inequalities for suprema of empirical processes, Freedman's
inequality, and the inequalities of Lévy and Hoffmann-Jørgensen.

The nearest roadmaps are these. [RandomMatrices](../RandomMatrices/README.md) owns, in §§2.1–2.2,
the scalar Hoeffding, Azuma, McDiarmid and Efron–Stein interfaces, the definition of entropy, the
gradient logarithmic Sobolev inequality with Herbst's argument for Lipschitz functions, and
convex-Lipschitz concentration on cubes; this roadmap takes the entropy and the Efron–Stein
inequality from there and gives back the product-space theory, in particular the convex distance
inequality behind the convex-Lipschitz bound.
[MathematicalStatisticsHighDimensional](../MathematicalStatisticsHighDimensional/README.md)
(§§1.1–1.2) owns sub-Gaussian vectors and chi-squared tails, which are instances of the sub-gamma
calculus here. [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md)
owns the maximal inequalities of empirical-process theory (§3.3) and leaves the concentration of
suprema to this roadmap. [OptimalTransport](../OptimalTransport/README.md) (§11.1) supplies
relative entropy with Pinsker's inequality and the Donsker–Varadhan formula, and the Wasserstein
distance with Kantorovich–Rubinstein duality.
[NoncommutativeIntegration](../NoncommutativeIntegration/README.md)
(§6.2) owns Lévy's and Hoffmann-Jørgensen's inequalities for Rademacher sums of fixed vectors;
here they are proved for independent random summands. The roadmap
SeriesOfIndependentRandomVariables (§2.2) owns Lévy's inequalities for symmetric real summands;
7.2 here is the form for summands in a normed group.

The roadmap is a synthesis of several sources: Boucheron, Lugosi and Massart (*Concentration
Inequalities*), Ledoux (*The Concentration of Measure Phenomenon*), Massart (*Concentration
Inequalities and Model Selection*), van Handel (*Probability in High Dimension*), Ledoux and
Talagrand (*Probability in Banach Spaces*) and Bercu, Delyon and Rio (*Concentration
Inequalities for Sums and Martingales*). No layer follows the organisation of any one of them;
the layers follow proof dependency.

## How to read the build

There are seven layers. Layer 1 defines sub-gamma variables and proves the classical inequalities
for sums of independent real variables that Layers 4 and 6 reuse as the form of their bounds.
Layer 2 develops the entropy functional on one probability space and the two bridges from entropy
to moment generating functions: Herbst's argument through a comparison lemma for differential
inequalities, and the transportation lemma. Layer 3 proves the two product-space inequalities that
everything after rests on: subadditivity of entropy and Han's inequality for relative entropies.
Layer 4 is the entropy method proper (Layer 3 plus Herbst's argument); Layer 5 is the transport
method (Layer 3 plus the transportation lemma) and Talagrand's convex distance. Layers 6 and 7
apply the method to suprema of empirical processes, and treat the martingale and Banach-space
inequalities that sit beside it.

Each subsection states its targets with locators into the sources or a proof route; a target with
a Lean name is a declaration in `Suggested.lean`. Locators give the theorem or equation number and
the printed page. Each subsection ends with a *Needs:* line.

## Conventions

- **Random variables.** A random variable is a real function on a measure space `(Ω, μ)`, with
  `μ` a probability measure where a theorem says so. Mathlib's `mgf X μ t` is `∫ exp (t X) dμ`; it
  is `0` when `exp (t X)` is not integrable, so every statement that bounds it either states the
  integrability as a conclusion or follows from hypotheses that force it.
- **Products.** On a product, `ι` is a finite type, `α i` a measurable space and `P i` a
  probability measure on it for each `i`; the product measure is `Measure.pi P`. A function
  `g i` on the product *does not depend on the `i`-th coordinate* when
  `g i (Function.update x i y) = g i x` for all `x`, `y`. The `i`-th section of `g` at `x` is
  `y ↦ g (Function.update x i y)`.
- **Sub-gamma variables.** `HasSubgammaMGF X v c μ` says that `exp (t X)` is integrable and
  `E exp (t X) ≤ exp (v t² / (2 (1 - c t)))` for every `t ≥ 0` with `c t < 1`. It does not centre
  `X`; the theorems apply it to `X - E X`. With `c = 0` it is the one-sided form of Mathlib's
  `HasSubgaussianMGF`.
- **The two functions of Bennett.** `φ(u) = e^u - u - 1` is written out; `bennettH u` is
  `h(u) = (1 + u) log (1 + u) - u`, the Legendre transform of `φ` on `[-1, ∞)`. Mathlib's
  `Real.log 0 = 0` gives `h(-1) = 1`, the correct limit.
- **Entropy.** `entropy μ g = ∫ g log g dμ - (∫ g dμ) log (∫ g dμ)` is a verbatim copy of the
  definition owned by RandomMatrices §2.2. It is a junk value unless `g ≥ 0`, `g` is integrable
  and `g log g` is integrable, and every theorem about it carries these three hypotheses.
- **Infinite quantities.** Relative entropy `klDiv`, the Wasserstein distance `wassersteinEDist`,
  transport costs and the integrals of possibly non-integrable nonnegative functions are in `ℝ≥0∞`
  with lower Lebesgue integrals. Mathlib's `etvDist` is twice the total variation distance
  `sup_A |μ A - ν A|`.
- **Measurability.** The measure of a set that need not be measurable is its outer measure. Where
  this matters (diagonals, the convex distance, conditional couplings) the coordinate spaces are
  standard Borel, so that the sets in question are universally measurable and the outer measure is
  the measure of the completion.
- **Namespace.** Implementations live in the TauCeti namespace; `Suggested.lean` states the
  prototypes in the roadmap's namespace.

## Layer 1: Sub-gamma variables and sums of independent variables

### 1.1 Sub-gamma variables

**Definition** (`HasSubgammaMGF`). See Conventions. Boucheron–Lugosi–Massart (BLM below), §2.4,
p. 28, define the class for centred variables and `0 < λ < 1/c`; the definition here includes
`t = 0` (where it is automatic) and leaves centring to the statements.

**Targets.**

- **Tails** (`HasSubgammaMGF.measureReal_gt_le`): for a probability measure, `t ≥ 0` and `ε ≥ 0`,
  `P(X > √(2 v t) + c t) ≤ e^{-t}` and `P(X ≥ ε) ≤ exp(-ε² / (2 (v + c ε)))` (BLM §2.4, p. 29, for
  the first; the second is the bound `ψ*(ε) ≥ ε²/(2(v + cε))` of the same page). The first
  exceedance is strict: for `v = c = 0` and `X = 0` the event `{X ≥ 0}` has probability `1`. When
  `v + c ε = 0` the second bound reads `1` by Lean's `x / 0 = 0`, which is true.
- **Independent sums** (`HasSubgammaMGF.sum_of_iIndepFun`): a finite sum of independent sub-gamma
  variables with parameters `(vᵢ, cᵢ)` is sub-gamma with parameters `(∑ vᵢ, c₀)` for any `c₀` with
  every `cᵢ ≤ c₀`.
- **Expected maximum** (`HasSubgammaMGF.integral_sup'_le`): if `Z₁, …, Z_N`, `N ≥ 1`, are each
  sub-gamma with parameters `(v, c)`, then `E maxⱼ Zⱼ ≤ √(2 v log N) + c log N`, with no
  independence assumed (BLM Corollary 2.6, p. 33). When the maximum is not integrable its Bochner
  integral is `0`, below the nonnegative right side.
- **Gamma laws** (`hasSubgammaMGF_gammaMeasure`): for `a, r > 0`, if `Y` has Mathlib's
  `gammaMeasure a r` (shape `a`, rate `r`), then `Y - a/r` is sub-gamma with variance factor `a/r²`
  and scale parameter `1/r` (BLM §2.4, p. 28, with scale `b = 1/r`).

**Proof route.** Tails: Chernoff's bound `P(X ≥ s) ≤ e^{-ts} E e^{tX}` with
`t = (1 - (1 + 2cs/v)^{-1/2})/c` (or `t = s/v` when `c = 0`), which evaluates the Legendre
transform `ψ*(s) = (v/c²) h₁(cs/v)` with `h₁(u) = 1 + u - √(1 + 2u)`, `h₁⁻¹(u) = u + √(2u)`
(BLM (2.5), p. 29); the second form is `h₁(u) ≥ u²/(2(1 + u))`. Sums: Mathlib's
`iIndepFun.mgf_sum` and monotonicity of the bound in `c`; measurability of each `X i` follows from
the integrability of `exp (t X i)` at a small `t > 0`. Maximum: Jensen gives
`exp(t E max Zⱼ) ≤ ∑ⱼ E exp(t Zⱼ) ≤ N exp(v t²/(2(1 - ct)))`; take logarithms and optimise in
`t ∈ (0, 1/c)` (BLM Lemma 2.4 and Theorem 2.5, p. 32). Gamma:
`log E e^{t(Y - a/r)} = a(-log(1 - t/r) - t/r)` for `t < r`, and
`-log(1 - u) - u ≤ u²/(2(1 - u))` on `(0, 1)`.
*Needs:* Mathlib `mgf`, `iIndepFun.mgf_sum`, `gammaMeasure`, Jensen (`ConvexOn.map_integral_le`).

**Checks.**

- The centred exponential law (`a = r = 1`): `E e^{t(Y-1)} = e^{-t}/(1 - t)`, which at `t = 1/2`
  is `1.2131 ≤ e^{1/4} = 1.2840`.
- Negative control (`not_hasSubgammaMGF_gammaMeasure_of_lt`): for `c < 1/r` the definition fails
  for every `v`, because `t = r` is admissible (`c r < 1`) and `exp (r Y)` is not integrable under
  `gammaMeasure a r`. A definition without the integrability conjunct would accept it, since
  Mathlib's `mgf` is then `0`.
- `Y` gamma with `a = 2`, `r = 1`, `t = 1`: `P(Y - 2 > √4 + 1) = P(Y > 5) = 0.0404 ≤ e^{-1}`.
- Expected maximum: `N` independent centred `Exp(1)` variables have `E max = H_N - 1`
  (harmonic number), `1.2833` for `N = 5`, below `√(2 log 5) + log 5 = 3.4036`; for `N = 1` the
  bound is `0`, the mean.

### 1.2 Bennett's inequality

**Definition** (`bennettH`). `h(u) = (1 + u) log (1 + u) - u` (BLM §2.7, p. 35); see Conventions.

**Targets.** Let `Xᵢ`, `i ∈ s`, be independent, square integrable, with `Xᵢ ≤ b` almost surely
for some `b > 0`, and let `∑ E Xᵢ² ≤ v` (uncentred second moments).

- **Moment generating function** (`mgf_sum_sub_le_bennett`): for `t ≥ 0`, the centred sum
  `S = ∑ (Xᵢ - E Xᵢ)` has `E e^{tS} ≤ exp((v/b²) φ(b t))` (BLM Theorem 2.9, p. 35).
- **Tail** (`measureReal_sum_sub_ge_le_bennett`): for `ε ≥ 0`,
  `P(S ≥ ε) ≤ exp(-(v/b²) h(b ε / v))` (BLM Theorem 2.9, p. 35). For `v = 0` the bound reads `1`.

The source states both with `v = ∑ E Xᵢ²`; the bounds are monotone in `v` (for the tail,
`d/dv [v h(a/v)] = log(1 + a/v) - a/v ≤ 0`), so any `v` above the sum may be used.

**Proof route.** `u ↦ φ(u)/u²` is nondecreasing, so `φ(t Xᵢ) ≤ Xᵢ² φ(t b)/b²` for `Xᵢ ≤ b`;
take expectations, use `log(1 + x) ≤ x` and independence; the tail is Chernoff's bound with the
Legendre transform of `(v/b²) φ(b ·)`.
*Needs:* Mathlib `iIndepFun.mgf_sum`.

**Checks.**

- `bennettH 0 = 0`, `bennettH 1 = 2 log 2 - 1 = 0.3863`, `bennettH (-1) = 1`.
- `h(u) ≥ u²/(2(1 + u/3))` for `u ≥ 0` (at `u = 2`: `1.2958 ≥ 1.2`), which turns the tail into
  Bernstein's `exp(-ε²/(2(v + b ε/3)))`, the form proved in Tau Ceti
  (`iIndepFun.measureReal_sum_ge_le_of_ae_le`).
- Five Bernoulli(`0.1`) summands, `b = 1`, `v = 0.5`: `P(S ≥ 1) = P(Bin(5, 0.1) ≥ 2) = 0.0815`,
  below `exp(-0.5 h(2)) = 0.5231`.

### 1.3 Bernstein's inequality under moment conditions

**Target** (`hasSubgammaMGF_sum_sub_of_moment_le`). Let `Xᵢ`, `i ∈ s`, be independent and
integrable, and let `v, c ≥ 0` satisfy `∑ E Xᵢ² ≤ v` and
`∑ E (Xᵢ)₊^q ≤ q! v c^{q-2}/2` for every integer `q ≥ 3`, both in `ℝ≥0∞` with lower integrals.
Then the centred sum is sub-gamma with parameters `(v, c)` (BLM Theorem 2.10, p. 37; the source
takes `v, c > 0`, and the proof covers `0`). With 1.1 this gives
`P(S > √(2 v t) + c t) ≤ e^{-t}`.

**Proof route.** `φ(u) ≤ u²/2` for `u ≤ 0`, so `φ(t Xᵢ) ≤ t² Xᵢ²/2 + ∑_{q ≥ 3} t^q (Xᵢ)₊^q/q!`;
monotone convergence and the hypotheses give `∑ E φ(t Xᵢ) ≤ (v/2) ∑_{q ≥ 2} t^q c^{q-2}`, which
also proves integrability of `exp (t Xᵢ)` for `t < 1/c`; then `log(1 + x) ≤ x` as in 1.2.
The bounded case `Xᵢ ≤ b`, with `c = b/3`, is Tau Ceti's `iIndepFun.mgf_sum_le_exp_of_ae_le`.
*Needs:* 1.1; Mathlib `iIndepFun.mgf_sum`.

**Checks.**

- `X ~ Exp(1)` has `E X^q = q!`, so the hypotheses hold with `v = 2`, `c = 1`, and
  `X - 1` is sub-gamma with parameters `(2, 1)`: `e^{-t}/(1 - t) ≤ exp(t²/(1 - t))` on `[0, 1)`.
- `c = 0` forces `Xᵢ ≤ 0` almost surely; for `X = -Exp(1)`, `X + 1` has
  `E e^{t(X+1)} = e^t/(1 + t) ≤ e^{t²}` (here `v = E X² = 2`).

### 1.4 The Paley–Zygmund inequality

**Targets.** Let `μ` be a probability measure, `Y` square integrable and `m = E Y`.

- **Paley–Zygmund** (`paleyZygmund`): if `Y ≥ 0` almost surely and `0 ≤ θ ≤ 1`, then
  `(1 - θ)² m² ≤ P(Y > θ m) E Y²` (BLM Exercise 2.4, p. 47, with `Y ≥ a E Y` and
  `a ∈ (0, 1)`; Ledoux, (8.12), p. 163). The multiplied form has no division; the event is strict,
  which is the stronger statement.
- **Variance form** (`paleyZygmund_variance`): if `m ≥ 0` and `θ ≤ 1` (no sign condition on `Y`
  or `θ`), then `(1 - θ)² m² ≤ P(Y > θ m) (Var Y + (1 - θ)² m²)`.

**Proof route.** `E[(Y - θm) 1{Y > θm}] ≥ E[Y - θm] = (1 - θ) m ≥ 0`, and Cauchy–Schwarz bounds
the left side by `(E(Y - θm)² P(Y > θm))^{1/2}`, with `E(Y - θm)² = Var Y + (1 - θ)² m²`. For
`Y ≥ 0` and `0 ≤ θ ≤ 1`, `Var Y + (1 - θ)² m² ≤ E Y²`, which gives the first form.
*Needs:* Mathlib `variance`.

**Checks.**

- `Y ∈ {0, 2}` with probability `1/2` each, `θ = 1/2`: left `1/4`, right `1/2 · 2 = 1`; the
  variance form gives `1/2 · (1 + 1/4) = 0.625`.
- Negative control: the first form fails for `θ < 0`: `Y = 1`, `θ = -1` gives `4 > 1`.
- `Y = m` constant, `θ < 1`: both forms are equalities.

### Examples

The centred chi-squared law with `k` degrees of freedom is the gamma law `a = k/2`, `r = 1/2`
shifted by its mean, so it is sub-gamma with parameters `(2k, 2)` (BLM Example 2.7, p. 33); this
is the computation behind MathematicalStatisticsHighDimensional §1.2.

### Dependencies

Mathlib moment generating functions, independence and Bochner integration.

## Layer 2: The entropy functional

### 2.1 Entropy and relative entropy

`entropy` is the local copy of the definition of RandomMatrices §2.2 (Conventions). Let `μ` be a
probability measure and `g` satisfy the three hypotheses of the Conventions.

**Targets.**

- **Nonnegativity** (`entropy_nonneg`): `0 ≤ entropy μ g`.
- **Equality case** (`entropy_eq_zero_iff`): `entropy μ g = 0` exactly when `g` equals its mean
  almost everywhere.
- **Relative entropy** (`entropy_eq_mul_toReal_klDiv`): `entropy μ g = (∫ g) · D(ν ‖ μ)` with
  `ν = (g/∫ g) μ`, with the real value of the relative entropy. For `∫ g = 0` both sides are `0`.

**Proof route.** Jensen for the convex `x log x` (`ConvexOn.map_integral_le`) and its strict
convexity (`Real.strictConvexOn_mul_log`, `StrictConvexOn.ae_eq_const_or_map_average_lt`) give
the first two; the third is `klDiv` of a measure with a density (`Measure.withDensity`) written as
`∫ (g/m) log (g/m) dμ`. BLM p. 106 uses the identity with `g = dQ/dP`.
*Needs:* Mathlib `klDiv`, `klDiv_eq_zero_iff`.

**Checks.**

- `μ` uniform on two points, `g = (0, 2)`: `∫ g log g = log 2`, `∫ g = 1`, so
  `entropy μ g = log 2 = 0.6931`, equal to `1 · D((0, 1) ‖ (1/2, 1/2))`.
- Negative control: if `g log g` were not required to be integrable, Lean's Bochner integral would
  give `entropy μ g = -m log m`, negative for `m = ∫ g = 2`.

### 2.2 Duality and variational formulas

**Targets.** Same hypotheses as 2.1.

- **Duality formula** (`isLUB_entropy`): `entropy μ g` is the least upper bound of `∫ U g dμ` over
  the `U` with `exp U` integrable, `∫ exp U dμ = 1` and `U g` integrable (BLM Theorem 4.13, p. 97;
  van Handel Lemma 3.15, p. 57).
- **Variational formula** (`entropy_le_integral_mul_log_sub`): for every `u > 0`,
  `entropy μ g ≤ ∫ (g (log g - log u) - (g - u)) dμ`
  (BLM Corollary 4.17, p. 100). At `u = ∫ g > 0` the right side is the definition of entropy.

**Proof route.** Duality: for `E e^U = 1`, `Ent(g) - E[U g]` is the entropy of `g e^{-U}` under
`e^U μ`, hence `≥ 0` by 2.1; the supremum is approached by `U = log((g ∨ 1/n)/E(g ∨ 1/n))`. The
positive part of `U g` is always integrable, since `U g ≤ g log g - g + e^U` (Young's inequality,
BLM Remark 4.3, p. 98), so restricting to integrable `U g` does not change the supremum.
Variational:
the expected Bregman divergence of `x log x` from `u` to `g` exceeds the one from `∫ g` by the
Bregman divergence from `u` to `∫ g`, which is nonnegative (BLM Theorem 4.16, p. 100).
*Needs:* 2.1.

**Checks.**

- `g = (0.5, 1.5, 3)` with probabilities `(0.2, 0.5, 0.3)`: `U = log(g/E g)` attains the duality
  supremum; every `U = W - log E e^W` gives `E[U g] ≤ Ent(g)`.
- The variational bound at `u = ∫ g` is the definition; at `u = 1` and `∫ g = 1` it is too.

### 2.3 Herbst's argument

**Targets.**

- **Comparison lemma** (`le_mul_integral_of_differential_ineq`): let `b ∈ ℝ`, let `f` and `G` be
  differentiable on `(0, b)` with `f > 0` there, `g` continuous on `[0, b)`, `G/f → 0` at `0⁺`, and
  `f G' - f' G ≤ f² g` on `(0, b)`. Then `G(x) ≤ f(x) ∫₀^x g` for `x ∈ (0, b)` (BLM Lemma 6.25,
  p. 196, under weaker smoothness: the source asks for `f` of class `C¹`, `G` of class `C^∞`,
  `G(0) = G'(0) = 0`).
- **Herbst's argument** (`hasSubgammaMGF_zero_of_entropy_le`): if `Z` is integrable, `exp (t Z)`
  and `Z exp (t Z)` are integrable and `Ent(e^{tZ}) ≤ (t² v/2) E e^{tZ}` for every `t > 0`, then
  `Z - E Z` is sub-gamma with parameters `(v, 0)` (BLM Proposition 6.1, p. 169; van Handel
  Lemma 3.13, p. 56).

**Proof route.** Comparison: `ρ = G/f` has `ρ' = (f G' - f' G)/f² ≤ g` on `(0, b)`, so
`ρ - ∫₀ g` is antitone there; let the left end tend to `0`. Herbst: with `ψ(t) = log E e^{t(Z-EZ)}`,
`Ent(e^{tZ})/E e^{tZ} = t ψ'(t) - ψ(t)` (BLM (6.2), p. 169), so the comparison lemma with
`f(t) = t` and `g = v/2` gives `ψ(t) ≤ v t²/2`; `ψ(t)/t → ψ'(0) = 0`.
*Needs:* 2.1; Mathlib `image_le_of_deriv_right_le_deriv_boundary`, interval integrals.

**Checks.**

- `f(x) = x`, `G(x) = v x²/2`, `g = v/2`: `f G' - f' G = v x²/2 = f² g` and the conclusion is an
  equality, so the lemma is sharp.
- The standard Gaussian `Z` has `Ent(e^{tZ}) = (t²/2) E e^{tZ}`, so Herbst's argument applies with
  `v = 1` and gives the exact moment generating function.

### 2.4 The transportation lemma

**Target** (`hasSubgammaMGF_zero_iff_forall_klDiv`). For a probability measure `μ`, integrable `Z`
and `v ≥ 0`: `Z - E Z` is sub-gamma with parameters `(v, 0)` exactly when
`E_ν Z - E_μ Z ≤ √(2 v D(ν ‖ μ))` for every probability measure `ν ≪ μ` with finite relative
entropy under which `Z` is integrable (BLM Lemma 4.18, p. 101; the source takes `v > 0`).

**Proof route.** Forward: the Donsker–Varadhan lower bound (Tau Ceti
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`) with the function `t(Z - E Z)`, then
optimise in `t`. Backward: tilt `μ` by `e^{t Z_n}` with `Z_n = min(Z, n)` (Mathlib
`Measure.tilted`), so that `Z` is integrable under the tilt and
`log E e^{t Z_n} = t E_{ν_n} Z_n - D(ν_n ‖ μ) ≤ t E Z + v t²/2`; let `n → ∞` by monotone
convergence. The integrability restriction on `ν` avoids the junk value of a non-integrable
Bochner integral.
*Needs:* 1.1; Mathlib `klDiv`, `Measure.tilted`; Tau Ceti Donsker–Varadhan.

**Checks.**

- Rademacher `Z` (`v = 1`) and `ν` giving mass `q` to `+1`: `2q - 1 ≤ √(2 D)` with
  `D = q log(2q) + (1-q) log(2(1-q))`; this is Pinsker's inequality for two points.
- Negative control: `v = 0.9` fails at `q = 0.6`: `0.2 > √(1.8 · 0.0201) = 0.1904`.

### Examples

For `Z = ∑ xᵢ` on `{0, 1}^n` under a product of Bernoulli laws, Herbst's argument with
`v = n/4` and the transportation lemma both reproduce Hoeffding's bound; the comparison lemma
with `f(t) = e^t - 1` is the step of 4.3.

### Dependencies

Layer 1; RandomMatrices §2.2 for the definition of entropy; OptimalTransport §11.1 for relative
entropy.

## Layer 3: Entropy on product spaces

### 3.1 Subadditivity of entropy

**Target** (`entropy_pi_le`). Let `g ≥ 0` be measurable on the product with `g` and `g log g`
integrable under `Measure.pi P`. Then
`Ent(g) ≤ ∑ᵢ ∫ Entᵢ(g)(x) dP(x)`, where `Entᵢ(g)(x)` is the entropy under `P i` of the `i`-th
section of `g` at `x` (BLM Theorem 4.22, p. 105; Ledoux Proposition 5.6, p. 98; van Handel
Theorem 3.14, p. 57). The right side is a sum of lower integrals of the nonnegative parts in
`ℝ≥0∞`; for almost every `x` each section satisfies the hypotheses of 2.1 by Fubini, so the inner
entropies are nonnegative almost everywhere.

**Proof route.** BLM's martingale decomposition
`g(log g - log E g) = ∑ᵢ g (log Eᵢ g - log Eᵢ₋₁ g)` with `Eᵢ` integrating out coordinates
`i+1, …, n`, followed by the duality formula 2.2 in each coordinate (BLM pp. 105–106; Ledoux's
proof of Proposition 5.6, p. 98, uses the dual formula (5.13) in the same way).
*Needs:* 2.1, 2.2; Mathlib `Measure.pi`, Fubini.

**Checks.**

- One coordinate: both sides equal `Ent(g)`.
- `g(x) = g₁(x₁) g₂(x₂)` a product: `Ent(g) = E g₂ Ent(g₁) + E g₁ Ent(g₂)`, the right side, so the
  inequality is an equality.
- `g(x₁, x₂) = 1 + x₁x₂` on `{0,1}^2` with the uniform law:
  `Ent(g) = (1/2)log 2 - (5/4)log(5/4) = 0.0676…`, below the right side
  `log 2 - (3/2)log(3/2) = 0.0849…`.

### 3.2 Han's inequality for relative entropies

**Target** (`sum_klDiv_map_restrict_le`). For a probability measure `Q` on the product,
`∑ᵢ D(Q⁽ⁱ⁾ ‖ P⁽ⁱ⁾) ≤ (n - 1) D(Q ‖ P)`, where `n` is the number of coordinates, `P = Measure.pi P`,
and `Q⁽ⁱ⁾`, `P⁽ⁱ⁾` are the marginals on all coordinates but `i` (BLM Theorem 4.9, p. 92, for a
countable space). The multiplied form in `ℝ≥0∞` avoids division by `n - 1`; for `n = 1` both
sides are `0` (`0 · ∞ = 0`, and the marginals live on a point).

**Proof route.** For `D(Q ‖ P) < ∞` apply 3.1 to `g = dQ/dP`: `Ent(g) = D(Q ‖ P)` by 2.1. Let
`gᵢ = ∫ g dPᵢ` be `g` with coordinate `i` integrated out; by Fubini it is the density of `Q⁽ⁱ⁾`
with respect to `P⁽ⁱ⁾`, read as a function on the product. Fubini also gives
`∫ Entᵢ(g) dP = ∫ g log g dP - ∫ gᵢ log gᵢ dP`, and by 2.1 the two terms are `D(Q ‖ P)` and
`D(Q⁽ⁱ⁾ ‖ P⁽ⁱ⁾)`. No disintegration is needed, so the coordinate spaces are arbitrary measurable
spaces. This removes the countability of the source (BLM p. 105 notes the equivalence of the two
inequalities).
*Needs:* 3.1, 2.1; OptimalTransport §11.1; Mathlib's Fubini theorem for `Measure.pi`.

**Checks.**

- `Q` itself a product: the inequality is an equality for `n = 2`.
- `n = 2`, `P` uniform on `{0,1}^2`, `Q = (1/2, 1/4, 1/8, 1/8)` on `00, 01, 10, 11`:
  `D(Q ‖ P) = (1/4)log 2 = 0.1733…`, and the marginals `(3/4, 1/4)`, `(5/8, 3/8)` give
  `∑ D(Q⁽ⁱ⁾ ‖ P⁽ⁱ⁾) = 0.1624… ≤ 0.1733…`.
- Negative control: the inequality does not reverse. For `n = 2`, `P` uniform on `{0,1}^2` and
  `Q` the law of `(ξ, ξ)` with `ξ` a fair bit, `D(Q ‖ P) = log 2` while both marginal terms are
  `0`, so `∑ D(Q⁽ⁱ⁾ ‖ P⁽ⁱ⁾) ≥ (n - 1) D(Q ‖ P)` would read `0 ≥ log 2`.

### Dependencies

Layer 2; Mathlib `Measure.pi` and Fubini.

## Layer 4: The entropy method

### 4.1 The modified logarithmic Sobolev inequality

**Target** (`entropy_exp_le_sum_lintegral`). Let `f` be measurable on the product, `gᵢ` measurable
and not depending on the `i`-th coordinate, and `t ∈ ℝ` with `exp (t f)` and `f exp (t f)`
integrable. Then
`Ent(e^{tf}) ≤ ∑ᵢ E[e^{tf} φ(-t (f - gᵢ))]` (BLM Theorem 6.6, p. 175). The right side is a sum of
lower integrals of nonnegative functions.

**Proof route.** 3.1 for `g = e^{tf}`, then in each coordinate the variational formula 2.2 with
`u = e^{t gᵢ}`, which is constant on the `i`-th section.
*Needs:* 2.2, 3.1.

**Checks.**

- One coordinate and `g₁ = c` constant: the inequality is the variational formula with
  `u = e^{tc}`.
- Random `f`, `g₁`, `g₂` on `{0,1,2}^2` under random product laws and random `t`: the inequality
  holds.

### 4.2 Bounded differences in quadratic mean

**Target** (`hasSubgammaMGF_of_sum_sq_le`). Let `f` be measurable and integrable, `gᵢ` measurable,
not depending on the `i`-th coordinate, with `gᵢ ≤ f` and `∑ᵢ (f - gᵢ)² ≤ v` almost everywhere.
Then `f - E f` is sub-gamma with parameters `(v, 0)`, so `P(f - E f ≥ ε) ≤ e^{-ε²/(2v)}` by 1.1
(BLM Theorem 6.7, p. 176, with `gᵢ = inf_{xᵢ} f` and a strict tail).

**Proof route.** Since any admissible `gᵢ` lies below `inf_{xᵢ} f`, the hypothesis with `gᵢ`
implies the source's and avoids the measurability of the infimum. Truncate `f` to `min(f, N)` and
`gᵢ` to `min(gᵢ, N)` (the hypotheses persist, and `exp (t min(f, N))` is integrable for `t ≥ 0`);
4.1 with `φ(-u) ≤ u²/2` for `u ≥ 0` gives `Ent(e^{tf}) ≤ (t² v/2) E e^{tf}`; apply 2.3 and let
`N → ∞`.
*Needs:* 2.3, 4.1.

**Checks.**

- `f = ∑ xᵢ` on `{0,1}^n` with `gᵢ = ∑_{j≠i} xⱼ`: `∑ (f - gᵢ)² = ∑ xᵢ ≤ n`, and the bound
  `exp(n t²/2)` dominates `E e^{t(f - Ef)}` for `Bin(10, 0.1)` on `t ∈ [0, 6]`.
- The bounded-differences inequality of McDiarmid, Tau Ceti's
  `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences`, has the better constant
  `∑ cᵢ²/4` but needs two-sided bounds; 4.2 is one-sided.

### 4.3 Self-bounding functions

**Definition** (`IsSelfBounding f g`). Each `gᵢ` does not depend on the `i`-th coordinate,
`0 ≤ f - gᵢ ≤ 1` and `∑ᵢ (f - gᵢ) ≤ f` everywhere (BLM §6.7, p. 181). The witnesses are part of
the data so that the theorems can ask for their measurability.

**Targets.** Let `f` be self-bounding with measurable witnesses, `f` measurable and integrable, and
`m = E f`.

- **Moment generating function** (`IsSelfBounding.mgf_le`): for every real `t`,
  `exp (t (f - m))` is integrable and `E e^{t(f - m)} ≤ exp(φ(t) m)` (BLM Theorem 6.12, p. 182).
- **Upper tail** (`IsSelfBounding.measureReal_ge_le`): for `t > 0`,
  `P(f ≥ m + t) ≤ exp(-m h(t/m))` (BLM Theorem 6.12, p. 182). For `m = 0` the bound reads `1`.
- **Lower tail** (`IsSelfBounding.measureReal_le_le`): for `0 < t ≤ m`,
  `P(f ≤ m - t) ≤ exp(-m h(-t/m))` (BLM Theorem 6.12, p. 182).

**Proof route.** 4.1 with `φ(-t u) ≤ u φ(-t)` for `u ∈ [0, 1]` and `∑ (f - gᵢ) ≤ f` gives
`(t - φ(-t)) ψ'(t) - ψ(t) ≤ φ(-t) m` for `ψ(t) = log E e^{t(f - m)}`; the comparison lemma 2.3
with `f(t) = e^t - 1` solves it on each side of `0` (BLM p. 183 and the remark after Lemma 6.25,
p. 196). Integrability for `t > 0` comes from truncation as in 4.2. The tails are Chernoff's
bound. The variance bound `Var f ≤ E f` is the Efron–Stein inequality of RandomMatrices §2.1.
*Needs:* 2.3, 4.1.

**Checks.**

- `f = ∑ xᵢ` on `{0,1}^n` with `gᵢ = ∑_{j≠i} xⱼ` is self-bounding (`∑ (f - gᵢ) = f`); for
  `Bin(n, p)` the bound `E e^{t(f - np)} ≤ exp(φ(t) np)` holds for all real `t` (it is the Poisson
  moment generating function).
- `Bin(10, 0.1)`, `t = 1`: `P(f ≥ 2) = 0.2639 ≤ exp(-h(1)) = 0.6796`.
- Negative control: `f = 2 x₁` with `x₁` a fair bit violates `f - g₁ ≤ 1`, and the conclusion
  fails at `t = -3`: `E e^{-3(f - 1)} = cosh 3 = 10.07 > exp(φ(-3)) = 7.77`.

### 4.4 Weakly self-bounding functions

**Definition** (`IsWeaklySelfBounding a b f g`). For `a, b ≥ 0`: `f ≥ 0`, each `gᵢ ≥ 0` does not
depend on the `i`-th coordinate, and `∑ᵢ (f - gᵢ)² ≤ a f + b` everywhere (BLM §6.11, p. 190).

**Target** (`IsWeaklySelfBounding.hasSubgammaMGF`). If in addition `gᵢ ≤ f`, the witnesses are
measurable and `f` is measurable and integrable, then `f - E f` is sub-gamma with variance factor
`a E f + b` and scale parameter `a/2` (BLM Theorem 6.19, p. 190).

**Proof route.** 4.1 with `φ(-u) ≤ u²/2` for `u ≥ 0` gives
`t ψ' - ψ ≤ (t²/2)(a ψ' + a m + b)`, i.e. `(t - a t²/2) ψ' - ψ ≤ (t²/2) v` with `v = a m + b`.
Take `f(t) = t/(1 - a t/2)` on `(0, 2/a)` (on `(0, ∞)` when `a = 0`), the solution of
`f'/f = 1/(t (1 - a t/2))`. Then
`f ψ' - f' ψ = (f/(t (1 - a t/2))) ((t - a t²/2) ψ' - ψ) ≤ f² v/2`, and 2.3 with `g = v/2` gives
`ψ(t) ≤ f(t) v t/2 = v t²/(2(1 - a t/2))`; `ψ/f → 0` at `0⁺` since `ψ'(0) = 0`.
*Needs:* 2.3, 4.1.

**Checks.**

- A self-bounding function is weakly `(1, 0)`-self-bounding, since `(f - gᵢ)² ≤ f - gᵢ`.
- `Bin(n, p)`: sub-gamma with parameters `(np, 1/2)` holds on `[0, 2)` for `n = 1, 5, 10`.
- `a = 0`: the scale parameter is `0` and the conclusion is the sub-Gaussian bound of 4.2 with
  `v = b`.
- The route's choice of `f` at `a = 1`, `b = 0` for `Bin(10, 0.1)` (self-bounding, `v = m = 1`):
  the bound `v t²/(2(1 - a t/2))` is `1` at `t = 1` and `4.5` at `t = 1.5`, against
  `ψ(1) = 0.5857` and `ψ(1.5) = 1.4875`.
- Negative control for the choice of `f`: with `f(t) = t - a t²/2`, `f' = 1 - a t`, so
  `f ψ' - f' ψ = ((t - a t²/2) ψ' - ψ) + a t ψ`, and the extra term `a t ψ ≥ 0` (at `t = 1` above,
  `0.5857`) blocks the hypothesis of 2.3.

### 4.5 The exponential Efron–Stein inequality

Write `τ(u) = u (e^u - 1) ≥ 0` and `Dᵢ(x, y) = (f(x) - f(update x i y))₊`.

**Targets.**

- **Symmetrized modified logarithmic Sobolev inequality** (`entropy_exp_le_sum_lintegral_tau`):
  for `f` measurable and `t ∈ ℝ` with `exp (t f)` and `f exp (t f)` integrable,
  `Ent(e^{tf}) ≤ ∑ᵢ ∫∫ e^{tf(x)} τ(-t Dᵢ(x, y)) dPᵢ(y) dP(x)`, a sum of lower integrals
  (BLM Theorem 6.15, second inequality, p. 185).
- **Exponential Efron–Stein inequality** (`log_mgf_le_of_efronStein`): let `f` be measurable and
  integrable and `V⁺(x) = ∑ᵢ ∫ Dᵢ(x, y)² dPᵢ(y)`, computed in `ℝ≥0∞` and finite almost
  everywhere. For `t, θ > 0` with `t θ < 1` and `exp(t V⁺/θ)` integrable, `exp (t f)` is
  integrable and `log E e^{t(f - Ef)} ≤ (tθ/(1 - tθ)) log E e^{tV⁺/θ}` (BLM Theorem 6.16,
  p. 186).

**Proof route.** Symmetrized inequality (BLM p. 185): 3.1 reduces it to one coordinate, with
`F = f(update x i ·)` on `(α i, Pᵢ)`. For each `y`, the variational formula 2.2 with
`u = e^{tF(y)}` gives `Ent(e^{tF}) ≤ ∫ e^{tF(y')} φ(-t(F(y') - F(y))) dPᵢ(y')`; average over `y`.
Split `φ(-t(F(y') - F(y)))` into the parts where `F(y') > F(y)` and where `F(y') < F(y)`. The
measure-preserving swap of `y` and `y'` on `Pᵢ ⊗ Pᵢ` (`Measure.measurePreserving_swap`, applied
to nonnegative lower integrals) turns the second part into
`e^{tF(y')} e^{-t D} φ(t D)` with `D = (F(y') - F(y))₊`, and `φ(u) + e^u φ(-u) = τ(u)` with
`u = -tD`.

Exponential Efron–Stein (BLM pp. 186–187):

1. Truncate. Replace `f` by `f_N = min(f, N)`. Then `exp (s f_N)` and `f_N exp (s f_N)` are
   integrable for every `s ≥ 0`. The function `V⁺` of `f_N` is at most `V⁺`, since `min(·, N)`
   is monotone and `1`-Lipschitz.
2. Bound the entropy by `V⁺`. Since `τ(-u) ≤ u²` for `u ≥ 0`, the symmetrized inequality gives
   `Ent(e^{tf}) ≤ t² E[V⁺ e^{tf}]`.
3. Decouple. Apply the duality formula 2.2 (`isLUB_entropy`) with `U = W - log E e^W` for
   `W = t min(V⁺, M)/θ`, a bounded function. This gives
   `E[W e^{tf}] ≤ Ent(e^{tf}) + E[e^{tf}] log E e^W`. Let `M → ∞` by monotone convergence.
   Combined with step 2 this gives
   `(1 - tθ) Ent(e^{tf}) ≤ tθ ρ(t/θ) E e^{tf}`, where `ρ(s) = log E e^{sV⁺}`.
4. Solve the differential inequality. For `G(s) = log E e^{s(f - Ef)}`, step 3 reads
   `s G' - G ≤ sθ ρ(s/θ)/(1 - sθ)` on `(0, 1/θ)`. `G` is differentiable there by Mathlib's
   `hasDerivAt_mgf` (the interval lies in the interior of the integrable-exponential set), and
   `G(s)/s → 0` as `s → 0⁺` by dominated convergence. The comparison lemma 2.3, with
   `f(s) = s` and `g(u) = θ ρ(u/θ)/(u (1 - uθ))`, gives
   `G(λ) ≤ λ ∫₀^λ g`. Here `g` extends continuously to `0` with `g(0) = E V⁺`, since `ρ` is
   differentiable at `0`: `V⁺ ≥ 0`, so `0` is interior to its integrable-exponential set.
5. Bound the integral. Hölder's inequality (`ENNReal.lintegral_mul_le_Lp_mul_Lq`) gives
   `E e^{rW} ≤ (E e^W)^r` for `r ∈ [0, 1]`. So `ρ(u/θ)/u` is nondecreasing, and so is
   `1/(1 - uθ)`. Hence `∫₀^λ g ≤ θ ρ(λ/θ)/(1 - λθ)`.
6. Remove the truncation. The bound for `f_N` is uniform in `N` and `E f_N → E f`. Monotone
   convergence gives the integrability of `exp (t f)` and the bound for `f`.

*Needs:* 2.2, 2.3, 3.1; Mathlib `hasDerivAt_mgf`, `Measure.measurePreserving_swap`, Hölder.

**Checks.**

- Random `f` on `{0,1,2}^2` under random product laws, `t ∈ {-2, -0.5, 0.3, 1, 2.5}`: the
  symmetrized inequality holds.
- `τ(-u) = u (1 - e^{-u}) ≤ u²` for `u ≥ 0`, the step from the symmetrized inequality to `V⁺`.
- `f = ∑ xᵢ` on `{0,1}^n` under Bernoulli(`p`): `V⁺(x) = (1 - p) ∑ xᵢ`; the inequality holds for
  `t ∈ {0.1, 0.3, 0.6}`, `θ ∈ {0.2, 0.5, 1}` with `tθ < 1`, `n = 3, 10`.
- `f` constant: `V⁺ = 0` and both sides are `0`.

### Examples

For `f(x) = ∑ xᵢ` on `{0,1}^n`, 4.3 gives the Poisson-type tails of the binomial, 4.4 a sub-gamma
bound, and 4.2 the sub-Gaussian bound with `v = n`. The supremum of a bounded empirical process
in Layer 6 is the main example of all three.

### Dependencies

Layers 2 and 3; RandomMatrices §2.1 for the Efron–Stein inequality.

## Layer 5: Transport inequalities and the convex distance

### 5.1 The Bobkov–Götze theorem

**Definition** (`SatisfiesT1 μ C`). `W₁(ν, μ)² ≤ 2 C D(ν ‖ μ)` for every probability measure `ν`,
with `W₁` Tau Ceti's `wassersteinEDist 1` and everything in `ℝ≥0∞`.

**Target** (`satisfiesT1_iff`). On a second-countable pseudometric space with a standard Borel
measurable structure containing the open sets, for a probability measure `μ` with finite first
moment (`HasFiniteMoment 1 μ`): `SatisfiesT1 μ C` holds exactly when every `1`-Lipschitz `f` has
`HasSubgaussianMGF (f - E f) C μ` (van Handel Theorem 4.8, p. 76; Ledoux Proposition 6.1,
p. 119).

**Proof route.** Kantorovich–Rubinstein duality (Tau Ceti `wassersteinEDist_one_eq_iSup`, its weak
half `ofReal_integral_sub_integral_le_wassersteinEDist_one`) turns `T₁` into
`E_ν f - E_μ f ≤ √(2 C D(ν ‖ μ))` for all `1`-Lipschitz `f`, which is 2.4 applied to `f` and to
`-f`. Finite moments make Lipschitz functions integrable
(`HasFiniteMoment.integrable_of_lipschitzWith`);
a `ν` of finite relative entropy has a finite first moment by Donsker–Varadhan.
*Needs:* 2.4; OptimalTransport (Wasserstein distance, Kantorovich–Rubinstein duality).

**Checks.**

- The uniform law on `{-1, 1}` with `|x - y|` satisfies `T₁(1)`: `W₁(ν, μ) = |2q - 1|` and
  `(2q - 1)² ≤ 2 D` is Pinsker's inequality for two points.
- Negative control: `C = 0.9` fails at `q = 0.51`: `4 · 10⁻⁴ > 3.6 · 10⁻⁴` (`D = 2.0 · 10⁻⁴`).

### 5.2 Couplings and Marton's inequality

**Targets.**

- **Maximal coupling** (`exists_isCoupling_measure_ne_eq`): on a standard Borel space, for
  probability measures `μ`, `ν`, every coupling has `π(X ≠ Y) ≥ etvDist μ ν / 2`, and some
  coupling attains it (BLM Lemma 8.1, p. 240).
- **Tensorization** (`sum_sq_transport_pi_le`): let each `α i` be standard Borel, `wᵢ` a measurable
  cost on `α i × α i` with values in `ℝ≥0∞`, and `C ∈ ℝ≥0∞`. If for each `i` and each probability
  `ν` on `α i` the infimum over couplings of `P i` and `ν` of `C (E wᵢ)²` is at most `D(ν ‖ P i)`,
  then for every probability `Q` on the product the infimum over couplings of `Measure.pi P` and
  `Q` of `C ∑ᵢ (E wᵢ(Xᵢ, Yᵢ))²` is at most `D(Q ‖ Measure.pi P)` (BLM Lemma 8.13, p. 256, with
  `φ(x) = C x²`; van Handel Theorem 4.15, p. 84).
- **Marton's inequality** (`marton`): for standard Borel coordinates and every probability `Q` on
  the product, the infimum over couplings of `Measure.pi P` and `Q` of `∑ᵢ π(Xᵢ ≠ Yᵢ)²` is at most
  `D(Q ‖ Measure.pi P)/2` (BLM Theorem 8.2, p. 241; Massart Proposition 2.21, p. 37). The source
  assumes `Q ≪ P`; otherwise the right side is `∞`.

**Proof route.** Maximal coupling: `|μ A - ν A| ≤ π(X ≠ Y)`, and the coupling that keeps
`min(dμ, dν)` on the diagonal and couples the excesses independently attains it (BLM p. 240).
Tensorization: induction on the number of coordinates with the chain rule for relative entropy
(Tau Ceti `TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel`), gluing a measurable family of
near-optimal conditional couplings, and Jensen for the convex `x²` (BLM pp. 256–257); standard
Borel coordinates make the conditional laws and the selection measurable. Marton: tensorization
with `wᵢ = 1{x ≠ y}` and `C = 2`, whose one-coordinate case is the maximal coupling and Pinsker's
inequality (Tau Ceti `TauCeti.etvDist_sq_le_two_mul_klDiv`).
*Needs:* 2.1; OptimalTransport §11.1; Tau Ceti `IsCoupling`.

**Corollary** (prose target). If each `P i` satisfies `T₁(C)` on `(α i, dᵢ)`, the product
satisfies `T₁(C)` for the metric `∑ cᵢ dᵢ` whenever `∑ cᵢ² = 1` (van Handel Corollary 4.16,
p. 85): apply the tensorization with `wᵢ = dᵢ` and Cauchy–Schwarz.

**Checks.**

- Two points: `μ = (1/2, 1/2)`, `ν = (0.8, 0.2)`: the maximal coupling keeps `0.5 + 0.2 = 0.7` on
  the diagonal and disagrees with probability `0.3 = etvDist μ ν / 2`; the independent coupling
  disagrees with probability `0.5`.
- One coordinate: Marton is Pinsker's inequality `TV² ≤ D/2`.
- Random `Q` on `{0,1}^2` against random product `P`: the minimum over couplings of
  `∑ π(Xᵢ ≠ Yᵢ)²` is below `D(Q ‖ P)/2`.

### 5.3 Talagrand's convex distance inequality

**Definition** (`convexDistance A x`). `d_T(x, A) = sup_a inf_{y ∈ A} ∑ᵢ aᵢ 1{xᵢ ≠ yᵢ}`, the
supremum over `a ∈ ℝ≥0^ι` with `∑ aᵢ² ≤ 1`, in `ℝ≥0∞`; it is `∞` for `A = ∅` (BLM §7.4, p. 225;
Ledoux §4.2, p. 72).

**Targets.**

- **Convex-hull form** (`convexDistance_eq_infDist_convexHull`): for `A` nonempty, `d_T(x, A)` is
  the Euclidean distance from `0` to the convex hull of the disagreement patterns
  `(1{xᵢ ≠ yᵢ})ᵢ`, `y ∈ A` (Ledoux (4.5), p. 73).
- **One-variable inequality** (`exists_exp_mul_rpow_le`): for `0 < u ≤ 1` there is `θ ∈ [0, 1]`
  with `e^{(1-θ)²/4} u^{-θ} ≤ 2 - u` (Ledoux p. 74, with `θ = 1 + 2 log u` for `u > e^{-1/2}` and
  `θ = 0` otherwise).
- **Exponential form** (`measure_mul_lintegral_exp_convexDistance_sq_le`): for standard Borel
  coordinates and measurable `A`, `P(A) · E exp(d_T(X, A)²/4) ≤ 1` (Ledoux Theorem 4.6, p. 73).
- **Tail form** (`measure_mul_measure_le_convexDistance_le`): under the same hypotheses, for
  `t ≥ 0`, `P(A) · P(d_T(X, A) ≥ t) ≤ e^{-t²/4}` (BLM Theorem 7.9, p. 225).

**Proof route.** Convex-hull form: the disagreement patterns form a finite set in `[0,1]^ι`, and
the support-function identity `dist(0, K) = sup_{a ≥ 0, ‖a‖ ≤ 1} inf_{u ∈ K} ⟨a, u⟩` for a compact
convex `K` in the nonnegative orthant is the Hahn–Banach separation in `EuclideanSpace`.
Exponential form: Talagrand's induction on the number of coordinates (Ledoux pp. 73–75): for the
last coordinate `w`, the section `A(w)` and the projection `B` of `A` satisfy
`d_T(z, A)² ≤ (1-θ)² + θ d_T(x, A(w))² + (1-θ) d_T(x, B)²` by the convex-hull form; Hölder's
inequality (`ENNReal.lintegral_mul_le_Lp_mul_Lq`), the induction hypothesis and the one-variable
inequality with `u = P(A(w))/P(B)` finish, with `u(2 - u) ≤ 1`. The projection `B` is analytic,
hence universally measurable on standard Borel spaces. Tail form: Markov's inequality. BLM's own
route (Lemma 7.10, p. 226, with Theorems 6.19–6.20, pp. 190–191) gives the weaker exponent
`t²/10` (BLM p. 225), and its §8.4 route (p. 249) needs a measurable choice of the optimal weights.
*Needs:* Mathlib `convexHull`, `Metric.infDist`, Hölder; standard Borel spaces.

**Checks.**

- `A = {(0, 0)}`, `x = (1, 1)`: `d_T = √2`. `A = {(0, 1), (1, 0)}`, `x = (1, 1)`: `d_T = 1/√2`, the
  distance from `0` to the segment from `(1, 0)` to `(0, 1)`. `x ∈ A`: `d_T = 0`.
- Negative control: exchanging the supremum and the infimum gives `inf_y √(#{i : xᵢ ≠ yᵢ})`,
  which is `1` instead of `1/√2` for `A = {(0, 1), (1, 0)}`, `x = (1, 1)`.
- Uniform law on `{0,1}^3`: `P(A) E exp(d_T²/4) ≤ 1` for all `255` nonempty `A`, with equality
  for `A` the whole cube.
- One-variable inequality at `u = 1`: `θ = 1` gives `1 ≤ 1`.

### Examples

For a function `F` on the product such that every `x` has weights `a(x)` with `‖a(x)‖ ≤ 1` and
`F(x) ≤ F(y) + ∑ aᵢ(x) 1{xᵢ ≠ yᵢ}` for all `y`, 5.3 with `A = {F ≤ m}` gives
`P(F ≤ m) P(F ≥ m + r) ≤ e^{-r²/4}` and hence concentration around a median (Ledoux
Corollary 4.7, p. 76). With `F` the supremum of linear forms over a box this is the
convex-Lipschitz concentration owned by RandomMatrices §2.2.

### Dependencies

Layers 2 and 3; OptimalTransport for the Wasserstein distance and couplings.

## Layer 6: Suprema of empirical processes

Here `T` is a nonempty finite index set, the coordinates are vectors `xᵢ ∈ ℝ^T`, and
`Z(x) = max_s ∑ᵢ xᵢ(s)`. A finite `T` avoids the measurability questions of suprema; countable
classes follow by monotone limits.

### 6.1 Bousquet's elementary inequality

**Target** (`phi_neg_mul_le`). For `β ≥ 0`, `t ≥ 0` and `x ≤ 1`,
`φ(-t x) (1 + (β - 1) e^{-t}) ≤ (x + (β x² - x) e^{-t x}) φ(-t)` (BLM Lemma 12.6, p. 348, divided
form). The cross-multiplied form holds also at `t = 0`, where both sides vanish.

**Proof route.** BLM pp. 348–349: `ρ(x) = φ(-tx)/(x + (βx² - x) e^{-tx})` is nondecreasing on
`(-∞, 1]` by the monotone l'Hôpital rule (BLM Lemma 12.7, p. 348),
with `f(x) = t x e^{tx} - e^{tx} + 1`
and `g(x) = x e^{tx} + βx² - x`.
*Needs:* Mathlib calculus.

**Checks.**

- `x = 1`: both sides equal `φ(-t)(1 + (β - 1)e^{-t})`.
- Grid `β ∈ {0, 0.5, 1, 3}`, `t ∈ [0, 8]`, `x ∈ [-6, 1]`: the inequality holds.

### 6.2 A Bernstein-type inequality for bounded processes

**Target** (`hasSubgammaMGF_sup_sum`). Let the coordinates be independent with laws `Qᵢ` on
`ℝ^T`, centred (`E xᵢ(s) = 0`) and bounded (`|xᵢ(s)| ≤ 1` almost surely, for all `s`). With
`Σ² = E max_s ∑ᵢ xᵢ(s)²` and `σ² = max_s ∑ᵢ E xᵢ(s)²`, `Z - E Z` is sub-gamma with variance factor
`2 (Σ² + σ²)` and scale parameter `2` (BLM Theorem 12.2, p. 342).

**Proof route.** BLM pp. 342–343: with the maximizing index `ŝ`, the exponential Efron–Stein
inequality 4.5 (`θ = 1`) bounds `ψ(t)` by `(t/(1 - t)) log E e^{t(W + σ²)}` with
`W = max_s ∑ᵢ xᵢ(s)²`, and `W` is self-bounding (4.3), so `log E e^{tW} ≤ Σ² (e^t - 1)`; then
`(e^t - 1)(1 - t) ≤ t`.
*Needs:* 4.3, 4.5.

**Checks.**

- `|T| = 2` with `xᵢ(±) = ±εᵢ` Rademacher, so `Z = |∑ εᵢ|`, `Σ² = σ² = n`: the moment generating
  function bound holds for `n = 1, 2, 4, 8` on `[0, 1/2)`.
- `|T| = 1`: the statement is Bernstein's inequality with the weaker parameters `(4σ², 2)`.

### 6.3 Bousquet's inequality

**Targets.** Let the coordinates be independent with a common law `Q` on `ℝ^T`, with
`E x(s) = 0`, `x(s) ≤ 1` almost surely and `x(s)` square integrable for every `s`. Let
`v = 2 E Z + σ²` with `σ² = n max_s E x(s)²`.

- **Moment generating function** (`bousquet_mgf_le`): `E e^{t(Z - EZ)} ≤ exp(v φ(t))` for `t ≥ 0`
  (BLM Theorem 12.5, p. 347).
- **Tail** (`bousquet_measureReal_ge_le`): `P(Z ≥ E Z + ε) ≤ exp(-v h(ε/v))` for `ε ≥ 0`
  (BLM Theorem 12.5, p. 347; Massart (5.49), p. 170).

**Proof route.** BLM pp. 347–351, written on the product space:

1. Leave-one-out maxima. Let `Zᵢ` be the maximum of the sum without the `i`-th summand and `ŝᵢ`
   its first maximizer, a measurable function of the other coordinates. Then
   `xᵢ(ŝᵢ) ≤ Z - Zᵢ ≤ 1` and `∑ (Z - Zᵢ) ≤ Z` (BLM p. 347). `Zᵢ` does not depend on the
   `i`-th coordinate.
2. Modified logarithmic Sobolev inequality. `Z ≤ n`, so `exp (t Z)` and `Z exp (t Z)` are
   integrable for `t ≥ 0`. Then 4.1 with `gᵢ = Zᵢ` gives
   `Ent(e^{tZ}) ≤ ∑ᵢ E[e^{tZ} φ(-t(Z - Zᵢ))]`.
3. Elementary inequality. 6.1 with `β = 1/2` and `x = Z - Zᵢ ≤ 1` bounds each summand by
   `θ(t) [(Z - Zᵢ) e^{tZ} + ((Z - Zᵢ)²/2 - (Z - Zᵢ)) e^{tZᵢ}]`, where
   `θ(t) = φ(-t)/(1 - e^{-t}/2)` (BLM Lemma 12.8 and its proof, p. 349).
4. Pointwise step. With `a = 1`, the computation in the proof of BLM Lemma 11.11 (p. 329) gives
   `(Z - Zᵢ)² - 2(Z - Zᵢ) ≤ xᵢ(ŝᵢ)² - 2 xᵢ(ŝᵢ)`, because `Z - Zᵢ - xᵢ(ŝᵢ) ≥ 0` and
   `(Z - Zᵢ - 1) + (xᵢ(ŝᵢ) - 1) ≤ 0`.
5. Integrate out coordinate `i`. Fubini, `∫ x(s) dQ = 0` and `ŝᵢ` not depending on coordinate
   `i` give `∫ ((Z - Zᵢ)²/2 - (Z - Zᵢ)) dQ(xᵢ) ≤ max_s E x(s)²/2`. Jensen in coordinate `i`
   (`ConvexOn.map_integral_le`), with `∫ (Z - Zᵢ) dQ(xᵢ) ≥ 0`, gives
   `e^{tZᵢ} ≤ ∫ e^{tZ} dQ(xᵢ)`.
6. Sum over `i`. Using `∑ (Z - Zᵢ) ≤ Z`, this gives
   `Ent(e^{tZ}) ≤ θ(t) E[(Z - E Z + v/2) e^{tZ}]` (BLM p. 350). This is BLM Lemma 12.8,
   `f G' - f' G ≤ (v/2)(t f' - f)` for `G(t) = log E e^{t(Z - EZ)}` and `f(t) = φ(t) + t/2`.
7. Integrate. The comparison lemma 2.3 with
   `g(t) = (v/2)(t f'(t) - f(t))/f(t)²` (continuous on `[0, ∞)`, with `g(0) = v`) gives
   `G(t) ≤ f(t) ∫₀^t g`. Since `(x f' - f)/f² = (-x/f)'` and `x/f(x) → 2` as `x → 0⁺`,
   `∫₀^t g = (v/2)(2 - t/f(t))`, and the bound is `(v/2)(2 f(t) - t) = v φ(t)`
   (BLM pp. 350–351).

The tail follows by Chernoff's bound.
*Needs:* 2.3, 4.1, 6.1.

**Checks.**

- `|T| = 1` and Rademacher coordinates: `v = n` and the bound is Bennett's,
  `cosh(t)^n ≤ exp(n φ(t))`.
- Negative control for the factor of step 7: an extra `v/2` in front of `f(t) ∫₀^t g` would give
  `(v²/2) φ(t)`; for `n = 1`, `|T| = 1` (`v = 1`) at `t = 1/2` that is `0.0744`, below
  `log cosh(1/2) = 0.1201`, while `v φ(1/2) = 0.1487`.
- `Z = |∑ εᵢ|` (`|T| = 2`), `n = 8`, `ε = 2`: `P(Z ≥ E Z + 2) = 0.0703 ≤ 0.8577`.
- `n = 0`: `Z = 0`, `v = 0` and both sides are `1`.

### Dependencies

Layer 4.

## Layer 7: Martingales and sums of independent vectors

### 7.1 Freedman's inequality

**Target** (`freedman`). Let `(ℱ k)` be a filtration, `Y` strongly adapted, each `Y (k+1)` square
integrable with `E[Y (k+1) | ℱ k] = 0` and `Y (k+1) ≤ b` almost surely. Let
`M_n = ∑_{k<n} Y (k+1)` and `⟨M⟩_n = ∑_{k<n} E[Y (k+1)² | ℱ k]`. For `x, y ≥ 0`,
`P(M_n ≥ x, ⟨M⟩_n ≤ y) ≤ exp(-x²/(2(y + b x/3)))` (Bercu–Delyon–Rio Theorem 3.10, (3.31), p. 69,
in the variables `x/n`, `y/n`, which they take in `[0, b]` and `(0, ∞)`; for `x > n b` the event is
null since `M_n ≤ n b`). The form with `b x` in place of `b x/3` is Freedman's (BDR (3.32), p. 69).

**Proof route.** BDR prove (3.30) through the binomial rate function (BDR Lemma 3.12, p. 69,
with Lemma 2.23, p. 27). The route here gives (3.31) directly through Bennett's function.

1. One-step bound. For `b > 0` and `s ≥ 0`, the pointwise inequality of 1.2,
   `e^{u} ≤ 1 + u + u² φ(sb)/(sb)²` for `u ≤ sb`, gives
   `e^{sY} ≤ 1 + sY + Y² φ(sb)/b²`.
2. Conditional expectation. Conditioning on `ℱ k` (`condExp_mono`) and using
   `E[Y (k+1) | ℱ k] = 0` gives
   `E[e^{sY(k+1)} | ℱ k] ≤ exp(E[Y (k+1)² | ℱ k] φ(sb)/b²)`.
3. Supermartingale. By induction on `n`, with `condExp_mul_of_stronglyMeasurable_left` and
   `integral_condExp`, `E exp(s M_n - (φ(sb)/b²) ⟨M⟩_n) ≤ 1`.
4. Chernoff on the event. On the event, `exp(s M_n - (φ(sb)/b²) ⟨M⟩_n) ≥ exp(s x - φ(sb) y/b²)`.
   Markov's inequality and the choice `s = log(1 + bx/y)/b` give the bound
   `exp(-(y/b²) h(bx/y))`.
5. Compare with the stated bound. `h(u) ≥ u²/(2(1 + u/3))` (1.2) gives
   `exp(-x²/(2(y + bx/3)))`.

The boundary cases are separate. `b < 0` is impossible under the hypotheses. For `b = 0` the
increments vanish almost surely. For `y = 0` the conditional variances vanish, so `M_n = 0` almost
surely on the event.
*Needs:* Mathlib `Filtration`, `StronglyAdapted`, `condExp`.

**Checks.**

- Simple random walk (`b = 1`, `⟨M⟩_n = n`), `n = 100`, `x = 10`, `y = 100`:
  `P(M_n ≥ 10) = 0.1841 ≤ exp(-100/(2 · 103.33)) = 0.6164`.
- `y = 0`: the increments vanish and the event is null for `x > 0`.

### 7.2 Lévy's inequalities

**Target** (`levy`). Let `E` be a normed group with its Borel σ-algebra and second-countable
topology, `X i` measurable, independent and symmetric (`-X i` has the law of `X i`), and
`S_k = ∑_{i<k} X i`. For `t ≥ 0`, `P(max_{k ≤ N} ‖S_k‖ > t) ≤ 2 P(‖S_N‖ > t)` and
`P(max_{i<N} ‖X i‖ > t) ≤ 2 P(‖S_N‖ > t)` (Ledoux–Talagrand Proposition 2.3, (2.6) and (2.7),
p. 47, for symmetric sequences). With `E = ℝ` the first inequality is the case `t ≥ 0` of Lévy's
inequality in SeriesOfIndependentRandomVariables §2.2, which owns the real case and its signed
form; the normed-group form and the bound for `maxᵢ ‖X i‖` are owned here.

**Proof route.** With `τ` the first `k` with `‖S_k‖ > t`, the sequence reflected after `τ` has the
same law (independence and symmetry), and `2 S_k = S_N + (2 S_k - S_N)` gives
`P(τ = k) ≤ 2 P(τ = k, ‖S_N‖ > t)`; the same with `τ` the first `i` with `‖X i‖ > t` and
`2 X_i = (S_N) + (2X_i - S_N)` after reflecting all other summands.
*Needs:* Mathlib independence and image measures.

**Checks.**

- `X i = εᵢ` Rademacher, `N = 3`, `t = 1`: `P(max |S_k| > 1) = 1/2` and `P(|S_3| > 1) = 1/4`, so the
  first inequality is an equality; without the factor `2` it would fail.
- Random symmetric four-point laws, `N ≤ 4`: both inequalities hold.

### 7.3 The Hoffmann-Jørgensen inequalities

**Targets.** Same setting without symmetry unless stated; `s, t ≥ 0`.

- **Tail form** (`hoffmannJorgensen`): 
  `P(max_k ‖S_k‖ > 3t + s) ≤ P(max_k ‖S_k‖ > t)² + P(maxᵢ ‖X i‖ > s)`
  (Ledoux–Talagrand Proposition 6.7, (6.6), p. 155).
- **Symmetric tail form** (`hoffmannJorgensen_symmetric`): for symmetric summands,
  `P(‖S_N‖ > 2t + s) ≤ 4 P(‖S_N‖ > t)² + P(maxᵢ ‖X i‖ > s)` (Ledoux–Talagrand Proposition 6.7,
  (6.7), p. 155).
- **Moment form** (`hoffmannJorgensen_lintegral_rpow_le`): for `p > 0` and
  `t₀ = inf{t > 0 : P(max_k ‖S_k‖ > t) ≤ (2 · 4^p)⁻¹}`,
  `E max_k ‖S_k‖^p ≤ 2 · 4^p E maxᵢ ‖X i‖^p + 2 (4 t₀)^p`, in `ℝ≥0∞` with no integrability
  hypothesis (Ledoux–Talagrand Proposition 6.8, (6.8), p. 156; the source assumes `X i ∈ L_p`, and
  for `t₀ = ∞` or infinite moments the bound is `∞`).

**Proof route.** Ledoux–Talagrand pp. 155–156: with `τ` the first `j` with `‖S_j‖ > t`,
`max_k ‖S_k‖ ≤ t + maxᵢ ‖X i‖ + max_{k > j} ‖S_k - S_j‖`, and independence of `{τ = j}` from the
increments after `j`; the symmetric form uses 7.2 for the increments. The moment form integrates
the tail form with `s = t` over `u > t₀`.
*Needs:* 7.2.

**Checks.**

- Random three-point laws, `N ≤ 4`: the tail forms and the moment form for `p = 1, 2` hold.
- `X i = 0`: `t₀ = 0` and both sides of the moment form are `0`.

### Dependencies

Mathlib conditional expectation and independence.

## Downstream consumers

- RandomMatrices §2.2 proves convex-Lipschitz concentration on cubes; the convex distance
  inequality 5.3 with Ledoux's Corollary 4.7 is its product-space form.
- MathematicalStatisticsAsymptotic leaves Talagrand's and Bousquet's inequalities to a separate
  roadmap (its "Beyond" list); Layer 6 supplies them for finite index sets.
- MathematicalStatisticsHighDimensional §1.2 uses the sub-gamma tail of the chi-squared law, an
  instance of 1.1.
- Learning-theory bounds through McDiarmid's inequality and the self-bounding property of
  Rademacher averages use 4.3.

## Scope and ownership

The roadmap is complete when every target below is a theorem of the TauCeti namespace with the
hypotheses stated here, every owned definition has the API its Checks name, and every statement in
`Suggested.lean` is proved. The headlines with a Lean name are stated in `Suggested.lean`, each
with every conclusion this README attaches to it; that file is not an exhaustive acceptance test,
and the other headlines here are targets of the same standing, stated in prose.

Owned here:

- sub-gamma variables `HasSubgammaMGF` with their tails, sums, maxima and the gamma example;
  Bennett's function `bennettH`; Bennett's inequality, Bernstein's inequality under moment
  conditions, the Paley–Zygmund inequality and its variance form;
- the properties of entropy in 2.1–2.2, the comparison lemma and Herbst's argument for a single
  random variable (2.3), the transportation lemma (2.4);
- subadditivity of entropy on general products and Han's inequality for relative entropies;
- the modified logarithmic Sobolev inequality, bounded differences in quadratic mean,
  self-bounding functions `IsSelfBounding`, weakly self-bounding functions
  `IsWeaklySelfBounding`, the symmetrized modified logarithmic Sobolev inequality and the
  exponential Efron–Stein inequality;
- the transport inequality `SatisfiesT1` with the Bobkov–Götze theorem, the maximal coupling on
  standard Borel spaces, the tensorization of quadratic transport inequalities, Marton's
  inequality, the convex distance `convexDistance` with Talagrand's inequality;
- the Bernstein-type and Bousquet inequalities for suprema of empirical processes over finite
  index sets;
- Freedman's inequality, Lévy's and Hoffmann-Jørgensen's inequalities for independent random
  summands in a normed space.

**Not owned here.**

- RandomMatrices owns in §2.1 the Hoeffding, Azuma–Hoeffding, McDiarmid (independent coordinates
  with different laws) and Efron–Stein interfaces and sub-exponential variables with their
  Bernstein inequality, and in §2.2 the definition of entropy, the gradient logarithmic Sobolev and
  Poincaré inequalities with their tensorization, Herbst's argument for Lipschitz functions and the
  convex-Lipschitz concentration on cubes. The definition of entropy is a local copy here. None of
  these results, nor the Hanson–Wright inequality, is a target here. The comparison lemma and
  Herbst's argument of 2.3 are the one-variable statements those proofs share, stated for a
  function on an arbitrary probability space.
- MathematicalStatisticsHighDimensional owns sub-Gaussian vectors and the sub-Gaussian maximal
  inequality in probability (§1.1) and the chi-squared tails (§1.2).
  MathematicalStatisticsAsymptotic §3.3 owns the expected maximum of sub-Gaussian variables, which
  is the case `c = 0` of `HasSubgammaMGF.integral_sup'_le`, symmetrization and chaining.
- OptimalTransport §11.1 owns relative entropy, its tensorization over products, Pinsker's
  inequality and the Donsker–Varadhan formula; it also owns the Wasserstein distance and
  Kantorovich–Rubinstein duality. All are consumed.
- [MarkovChainMixing](../MarkovChainMixing/README.md) §1.1 owns the coupling characterization of
  total variation on countable spaces; 5.2 is the standard Borel case.
- NoncommutativeIntegration §6.2 owns Kahane's inequality, Lévy's inequality and the
  Hoffmann-Jørgensen tail iteration for Rademacher sums of fixed vectors; Layer 7 treats
  independent random summands.
- The roadmap SeriesOfIndependentRandomVariables (§2.2) owns Lévy's
  inequalities for independent symmetric real summands, `P(max_k S_k > a) ≤ 2 P(S_n > a)` and
  `P(max_k |S_k| > a) ≤ 2 P(|S_n| > a)`. The signed form is not stated here. The first conjunct of
  `levy` (7.2) with `E = ℝ` and `t ≥ 0` is the second of these; 7.2 is the form for summands in a
  normed group, together with the bound for `maxᵢ ‖X i‖`, which that roadmap does not state.
- The roadmap LogSobolevForMarkovChains states the subadditivity of entropy on finite state spaces
  for its own use and leaves modified logarithmic Sobolev inequalities out; the roadmap
  LogConcaveFunctionalInequalities owns Talagrand's quadratic transport inequality, the HWI
  inequality and the dual form of the quadratic transport inequality, and leaves `T₁` and
  Marton's argument out; the roadmap EntropyAndSourceCoding owns Han's inequality for Shannon
  entropy; the roadmap LargeDeviations owns the Cramér–Chernoff theorem. None of them is consumed.

## Exact supplier contracts

### From Mathlib

- `HasSubgaussianMGF`, `HasSubgaussianMGF.measure_ge_le`, `HasSubgaussianMGF.sum_of_iIndepFun`,
  `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`
  (`Mathlib/Probability/Moments/SubGaussian.lean`):
  the sub-Gaussian class, its tail, its sums, and Hoeffding's lemma.
- `mgf`, `iIndepFun.mgf_sum` (`Mathlib/Probability/Moments/Basic.lean`,
  `Mathlib/Probability/Independence/Basic.lean`): moment generating functions of independent sums.
- `gammaMeasure` (`Mathlib/Probability/Distributions/Gamma.lean`); `variance`, `evariance`
  (`Mathlib/Probability/Moments/Variance.lean`).
- `Measure.pi`, `Measure.withDensity`, `Measure.tilted`; `etvDist`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`), twice the total variation distance.
- `klDiv`, `klDiv_eq_zero_iff` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`).
- `ConvexOn.map_integral_le`, `StrictConvexOn.ae_eq_const_or_map_average_lt`,
  `Real.strictConvexOn_mul_log`: Jensen and the strict convexity of `x log x`.
- `image_le_of_deriv_right_le_deriv_boundary`: the comparison principle behind 2.3.
- `Filtration`, `StronglyAdapted`, `condExp`: martingale differences in 7.1.
- `convexHull`, `Metric.infDist`, `ENNReal.lintegral_mul_le_Lp_mul_Lq`: the convex-hull form and
  Hölder's inequality in 5.3.

### From Tau Ceti

- `iIndepFun.mgf_sum_le_exp_of_ae_le`, `iIndepFun.measureReal_sum_ge_le_of_ae_le`
  (`TauCeti/Probability/Moments/Bernstein.lean`): Bernstein's inequality for summands bounded
  above, the bounded case of 1.3.
- `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences`
  (`TauCeti/Probability/McDiarmid.lean`): McDiarmid's inequality on a product of identical laws.
- `TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`,
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`
  (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`): Donsker–Varadhan.
- `TauCeti.etvDist_sq_le_two_mul_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`):
  Pinsker's inequality `etvDist² ≤ 2 D`.
- `TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel`
  (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`): the chain rule on a standard Borel
  second factor. Used in the tensorization of 5.2.
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`);
  `TauCeti.wassersteinEDist`, `TauCeti.HasFiniteMoment`,
  `TauCeti.HasFiniteMoment.integrable_of_lipschitzWith`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`);
  `TauCeti.ofReal_integral_sub_integral_le_wassersteinEDist_one`,
  `TauCeti.wassersteinEDist_one_eq_iSup`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.lean`):
  couplings, `W₁` and Kantorovich–Rubinstein duality.

### From other roadmaps

- [RandomMatrices](../RandomMatrices/README.md) §2.2: the definition of entropy, copied verbatim as
  `entropy`. §2.1: the Efron–Stein inequality `Var f(X) ≤ ∑ᵢ E(f(X) - E⁽ⁱ⁾ f(X))²`, used for the
  variance of self-bounding functions in 4.3.
- [OptimalTransport](../OptimalTransport/README.md) §11.1: relative entropy and the declarations
  listed above; the Wasserstein distance and Kantorovich–Rubinstein duality, through Tau Ceti.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Sharper bounds for empirical processes**: Bousquet-type bounds for non-identically distributed
  summands, the Klein–Rio and Samson left-tail bounds (BLM Theorems 12.9–12.11, pp. 351–352),
  and the symmetrized inequality of BLM Theorem 12.3, p. 344.
- **Conditional transport**: Marton's conditional transportation inequality and the two-sided
  bounded differences in quadratic mean (BLM Theorems 8.5–8.6, p. 245;
  van Handel Theorem 4.20, p. 91).
- **Strongly self-bounding functions** and the lower tails of weakly self-bounding functions
  (BLM Theorems 6.20–6.21, pp. 191–192, with Lemma 6.22, p. 193), and the self-bounding property
  of the squared convex distance (BLM Lemma 7.10, p. 226).
- **Martingale Bernstein inequalities** under conditional moment conditions
  (BDR Theorem 3.14, p. 71) and Banach-space-valued martingales.
- **Applications**: configuration functions and certificates, bin packing, the longest
  increasing subsequence, and concentration on the symmetric group.

## References

- S. Boucheron, G. Lugosi and P. Massart, *Concentration Inequalities: A Nonasymptotic Theory of
  Independence*, Oxford University Press, 2013.
- M. Ledoux, *The Concentration of Measure Phenomenon*, Mathematical Surveys and Monographs 89,
  American Mathematical Society, 2001.
- P. Massart, *Concentration Inequalities and Model Selection*, Lecture Notes in Mathematics 1896,
  Springer, 2007.
- R. van Handel, *Probability in High Dimension*, lecture notes, Princeton University, 2016.
- M. Ledoux and M. Talagrand, *Probability in Banach Spaces*, Ergebnisse der Mathematik 23,
  Springer, 1991.
- B. Bercu, B. Delyon and E. Rio, *Concentration Inequalities for Sums and Martingales*,
  SpringerBriefs in Mathematics, Springer, 2015.
- D. A. Freedman, On tail probabilities for martingales, *Ann. Probab.* 3 (1975), 100–118.
- M. Talagrand, Concentration of measure and isoperimetric inequalities in product spaces,
  *Publ. Math. IHÉS* 81 (1995), 73–205.
- O. Bousquet, A Bennett concentration inequality and its application to suprema of empirical
  processes, *C. R. Acad. Sci. Paris* 334 (2002), 495–500.
