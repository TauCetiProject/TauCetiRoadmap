# Roadmap: generative adversarial objectives

**Summary.** A generative adversarial network fits a model law to a data law by a game: a
discriminator tries to tell samples of the two laws apart. Once the discriminator plays optimally,
each game becomes a divergence between the two laws. This roadmap proves that correspondence for
three games, for probability measures without density assumptions.

The first headline is the optimal discriminator of the original game. For probability
measures `P` and `Q` and a measurable discriminator `D` with values in the open interval `(0, 1)`,
the loss `∫ −log D dP + ∫ −log(1 − D) dQ` is `log 4 − 2 JSD(P, Q)` plus the integral against
`P + Q` of the binary relative entropy of `dP/d(P + Q)` from `D`; here `JSD` is the Jensen–Shannon
divergence, in `[0, log 2]`. So the infimum of the loss over discriminators is
`log 4 − 2 JSD(P, Q)`; it equals `log 4` exactly when `P = Q`, and it is attained exactly when `P`
and `Q` are mutually absolutely continuous, by the discriminator equal to `dP/d(P + Q)` almost
everywhere. The Jensen–Shannon divergence is in turn squeezed between two functions of the
statistical distance `δ(P, Q)`: it is at least `log 2 − h((1 − δ)/2)`, with `h` the binary entropy,
and at most `δ log 2`.

The second is the variational representation of f-divergences: for `f` convex on `[0, ∞)` and
continuous at `0`, the f-divergence of `P` from `Q`, including its singular part, is the supremum of
`E_P g − E_Q f*(g)` over finitely valued measurable `g` with values in the domain of the convex
conjugate `f*`; when `P` is absolutely continuous with respect to `Q`, a `g` with values in that
domain, with `g` and `f*(g)` integrable, attains it exactly when the Fenchel–Young inequality is an
equality at `dP/dQ` almost everywhere.

The third concerns the Wasserstein game, for a generator `g(z, θ)` into a Polish space, measurable
in `z` and Lipschitz in `θ` on an open set of a finite-dimensional space with an integrable constant
`L(z)`. If the `1`-Wasserstein loss is finite at one point of the set, it is Lipschitz there and
differentiable almost everywhere. On a bounded space, for an optimal `1`-Lipschitz critic, wherever
the loss and the critic along the generator are differentiable, the gradient of the loss is minus
the average gradient of the critic. For laws on a Euclidean space with finite first moments and
almost every pair of distinct points of an optimal coupling, an optimal critic has as gradient the
unit vector of the pair at every point of the segment between them where it is differentiable.

The roadmap builds on the Tau Ceti optimal transport library, which realizes the roadmap
OptimalTransport (Kantorovich–Rubinstein duality, optimal couplings, internal energies, convex
conjugates), and on MathematicalStatisticsNonparametric (the mutual information of a uniform
mixture, whose two-law case is the Jensen–Shannon divergence). Layer 1 treats the original game and
the Jensen–Shannon divergence; Layer 2 the f-divergences, as Tau Ceti's internal energies; Layer 3
the Wasserstein game.

## Conventions

- **Laws.** `P`, `Q`, `Pr` are probability measures on a measurable space `X`. Densities are
  Mathlib's `Measure.rnDeriv`, and `P.singularPart Q` is the part of `P` singular to `Q`.
- **Jensen–Shannon divergence (one normalisation throughout).** With `M = (P + Q)/2`,
  `JSD(P, Q) = ½ KL(P ‖ M) + ½ KL(Q ‖ M)`, valued in `[0, log 2]`. In Lean it is `jsDiv P Q`,
  defined as `mutualInfoUniform ![P, Q]` of MathematicalStatisticsNonparametric 2.4. This is
  Goodfellow et al.'s `JSD`. Polyanskiy–Wu (7.8) and the definitions of Arjovsky–Chintala–Bottou
  §2 write `JS = KL(P ‖ M) + KL(Q ‖ M) = 2 JSD`; every statement taken from them below is
  translated into `JSD`.
- **Statistical distance.** `δ(P, Q) = tvDist P Q / 2 = sup_A |P(A) − Q(A)|`: Mathlib's `tvDist`
  is the total mass of `P − Q`, which is `2` for mutually singular laws.
- **Logarithms** are natural; `h(t) = −t log t − (1 − t) log(1 − t)` is Mathlib's
  `Real.binEntropy`, and `0 log 0 = 0`, as in Mathlib's `Real.log`, for which `log 0 = 0`.
- **Discriminators and the GAN loss without junk values.** A discriminator is a measurable
  `D : X → ℝ` with `0 < D x < 1` for every `x`. The GAN loss `ganLoss P Q D` is
  `∫⁻ ofReal(−log D) dP + ∫⁻ ofReal(−log(1 − D)) dQ` in `[0, ∞]`, the negative of the value
  `V(D) = E_P log D + E_Q log(1 − D)` of the game. Lower integrals of nonnegative functions are
  used because a Bochner integral of a non-integrable `log D` is the junk value `0`; open values
  are required because with `log 0 = 0` the constant `D = 0` would have loss `0 < log 4` when
  `P = Q` (Check of 1.1). The optimal discriminator is `D*(x) = (dP/d(P + Q))(x)`, which lies in
  `[0, 1]` for `(P + Q)`-almost every `x`.
- **f-divergences.** For `f : ℝ → ℝ` only the values on `[0, ∞)` enter. The slope at infinity
  `f'(∞)` is Tau Ceti's recession constant `recessionConstant f`, the upper limit of `f(x)/x` as
  `x → ∞` in `EReal`, which for `f` convex on `[0, ∞)` is a limit in `(−∞, +∞]`
  (`ConvexOn.tendsto_div_recessionConstant`). The f-divergence
  `D_f(P ‖ Q) = ∫ f(dP/dQ) dQ + f'(∞) · P_⊥(X)`, with `P_⊥` the singular part and
  `f'(∞) · 0 = 0` also when `f'(∞) = +∞` (Polyanskiy–Wu Definition 7.1 and (7.2), pp. 115–116), is
  Tau Ceti's internal energy of `P` relative to `Q`, `internalEnergy f Q P`, in `EReal`; it sums
  the positive and the negative parts separately and is `+∞` when the positive part is infinite.
  For `f` convex on `[0, ∞)` and probability measures the negative part is finite (`f` lies above
  an affine function and `dP/dQ` is `Q`-integrable), so `D_f(P ‖ Q)` is the displayed sum when
  `f(dP/dQ)` is `Q`-integrable and `+∞` otherwise. Polyanskiy–Wu take `f` on `(0, ∞)` with
  `f(0) = f(0+)` allowed to be `+∞`; here `f(0)` is a real number, and 2.2 assumes `f(0) = f(0+)`.
  The conjugate is taken over `[0, ∞)`, `f*(y) = sup_{x ≥ 0} (x y − f(x))` in `(−∞, +∞]` (Lean
  `nonnegConjugate`), which is Polyanskiy–Wu's conjugate of the extension of `f` by `+∞` on
  `(−∞, 0)`; `dom f*` is the set where it is finite. Polyanskiy–Wu normalise `f(1) = 0`; adding a
  constant `c` to `f` adds `c` to both sides of every identity of Layer 2, and the GAN generator of
  Nowozin et al. has `f(1) = −log 4`, so that normalisation is not imposed.
- **Wasserstein distance.** `W₁(P, Q)` is Tau Ceti's `wassersteinEDist 1 P Q` in `[0, ∞]`. In
  Layer 3, `X` is a pseudometric space: with any σ-algebra in 3.1, Polish with its Borel σ-algebra
  in 3.2, with its Borel σ-algebra in 3.3; `(Z, μ)` is a probability space, a generator is
  `g : Z → Θ → X`, and the model law is `P_θ = μ.map (g · θ)`. Parameters live in a pseudometric
  space `Θ` in 3.2(1) and in a finite-dimensional real normed space `E` otherwise, with an additive
  Haar measure `ν` for "almost every parameter". A critic is a `1`-Lipschitz `f : X → ℝ`; it is
  optimal for `(Pr, P_θ)` when `∫ f dPr − ∫ f dP_θ` is the real number `W₁(Pr, P_θ)`.
- **Gradients** (3.4) are Mathlib's `gradient` on a finite-dimensional real inner product space.

## Layer 1: the GAN value and the Jensen–Shannon divergence

### 1.1 The Jensen–Shannon divergence, discriminators and the GAN loss

Copy `uniformMixture` and `mutualInfoUniform` verbatim from MathematicalStatisticsNonparametric 2.4
(with that section's `variable` line). Define `jsDiv P Q = mutualInfoUniform ![P, Q]`, the predicate
`IsDiscriminator D` (measurable, values in `(0, 1)`), the loss `ganLoss P Q D` of the Conventions,
and the binary relative entropy `binKL a b = a log(a/b) + (1 − a) log((1 − a)/(1 − b))`, which for
`a ∈ [0, 1]` and `b ∈ (0, 1)` is nonnegative and vanishes exactly when `a = b` (Gibbs' inequality on
two points).

**Checks.**

- `jsDiv P Q = ½ KL(P ‖ M) + ½ KL(Q ‖ M)` with `M = (P + Q)/2`, because `![P, Q]` sums to `P + Q`
  and the number of laws is `2`. For `P = δ_a`, `Q = δ_b` with `a ≠ b` it is `log 2`; for `P = Q` it
  is `0`.
- On `X = {a, b, c}` with `P = (½, ½, 0)` and `Q = (0, ½, ½)`: `M = (¼, ½, ¼)`,
  `KL(P ‖ M) = KL(Q ‖ M) = ½ log 2`, so `JSD = ½ log 2`, and `D* = (1, ½, 0)`. The Polyanskiy–Wu and
  Arjovsky §2 normalisation gives `log 2` here, twice as much.
- The open interval matters: for `P = Q` the function `D = 0` would give
  `∫ ofReal(−log 0) dP + ∫ ofReal(−log 1) dQ = 0` with `log 0 = 0`, below the value `log 4` of
  1.2; `IsDiscriminator` excludes it.

*Needs:* Mathlib `InformationTheory.klDiv`; MathematicalStatisticsNonparametric 2.4
`uniformMixture`, `mutualInfoUniform` (copied).

### 1.2 The optimal discriminator and the value of the game

For probability measures `P`, `Q` on a measurable space:

- (a) `ganLoss_add_two_mul_jsDiv`: for every discriminator `D`,
  `ganLoss P Q D + 2 JSD(P, Q) = log 4 + ∫⁻ ofReal(binKL(D*(x), D(x))) d(P + Q)(x)` in `[0, ∞]`;
- (b) `ganLoss_add_two_mul_jsDiv_eq_iff`: `ganLoss P Q D + 2 JSD(P, Q) = log 4` exactly when
  `D = D*` holds `(P + Q)`-almost everywhere;
- (c) `iInf_ganLoss_add_two_mul_jsDiv`: the infimum of `ganLoss P Q D` over discriminators plus
  `2 JSD(P, Q)` is `log 4`, that is, `sup_D V(D) = 2 JSD(P, Q) − log 4`; and the infimum is
  `log 4` exactly when `P = Q`;
- (d) `exists_ganLoss_add_two_mul_jsDiv_eq_iff`: some discriminator attains the infimum exactly
  when `P ≪ Q` and `Q ≪ P`.

(Goodfellow et al., Proposition 1 with eqs. (2)–(3), p. 4, and Theorem 1 with eqs. (4)–(6), pp. 4–5,
for laws with Lebesgue densities, where the optimal `D` is `p/(p + q)` with values in `[0, 1]`. The
measure form, the exact gap identity (a), the equality case (b) and the attainment criterion (d) are
not in the source and are proved here.)

Route. `P ≤ P + Q`, so `P ≪ P + Q`, and by `Measure.withDensity_rnDeriv_eq` `P` has density `D*` and
`Q` density `1 − D*` with respect to `P + Q`, both in `[0, 1]` almost everywhere. With
`lintegral_withDensity_eq_lintegral_mul`, `ganLoss P Q D` is the `(P + Q)`-integral of
`ofReal(−D* log D − (1 − D*) log(1 − D))`, and pointwise
`−a log b − (1 − a) log(1 − b) = h(a) + binKL(a, b)` for `a ∈ [0, 1]`, `b ∈ (0, 1)`. The same
densities give `dP/dM = 2 D*`, `dQ/dM = 2(1 − D*)`, hence
`KL(P ‖ M) + KL(Q ‖ M) = ∫ (log 2 − h(D*)) d(P + Q) = log 4 − ∫ h(D*) d(P + Q)`, since `P + Q` has
mass `2` and `h ≤ log 2`; this is (a), the two lower integrals being added because both integrands
are nonnegative. (b): `log 4` is finite, so equality in (a) means that the integral of
`binKL(D*, D)` vanishes, that is `binKL(D*, D) = 0` almost everywhere, that is `D = D*` almost
everywhere. (c), first part: `≥` is (a). For `≤`, let `D_ε` be `D*` clamped to `[ε, 1 − ε]` (a
discriminator for `0 < ε < ½`). For `a < ε` the convex function `binKL(·, ε)` vanishes at `ε`, so
`binKL(a, ε) ≤ binKL(0, ε) = −log(1 − ε)`, and symmetrically above `1 − ε`; so the gap of `D_ε` is
at most `−2 log(1 − ε) → 0`. (d): if `D = D*` almost everywhere with `0 < D < 1`, then `0 < D* < 1`
almost everywhere, and a set `A` with `Q(A) = ∫_A (1 − D*) d(P + Q) = 0` has `(P + Q)(A) = 0`, so
`P ≪ Q`, and symmetrically `Q ≪ P`. Conversely, if `P ≪ Q` and `Q ≪ P`, the set `{D* = 1}` is
`Q`-null (there `Q` has density `0`), hence `P`-null, hence `(P + Q)`-null, and likewise `{D* = 0}`;
so `D*` redefined as `½` on the null set where it leaves `(0, 1)` is a discriminator equal to `D*`
almost everywhere; apply (b). (c), second part: by the first, the infimum is `log 4` exactly when
`JSD(P, Q) = 0`, that is when `KL(P ‖ M) = KL(Q ‖ M) = 0`, which by `klDiv_eq_zero_iff` means
`P = M`, that is `P = Q`.

The pointwise inequality `binKL(a, b) ≥ 0` is Gibbs' inequality on two points (from
`log t ≤ t − 1`); it is proved inline.

**Checks.**

- The three-point example of 1.1: the infimum is `log 4 − log 2 = log 2`, and it is not attained,
  because `D*(a) = 1`. For `D = ½` everywhere, `ganLoss = 2 log 2`, and the right side of (a) is
  `log 4 − log 2 + (½ log 2 + 1 · 0 + ½ log 2) = 2 log 2` (from
  `binKL(1, ½) = binKL(0, ½) = log 2`).
- `P = Q`: `D* = ½`, the infimum `log 4` is attained by `D = ½`. Mutually singular `P`, `Q`:
  `JSD = log 2`, the infimum is `0` and is not attained, since every discriminator has positive
  loss.
- Polyanskiy–Wu Example 7.5, p. 150, in this normalisation reads
  `2 JSD(P, Q) = log 4 + sup_h (E_P log h + E_Q log(1 − h))`, which is (c); the source prints the
  constant `log 2`, which fails at `P = Q`, where the supremum is `−log 4`.

*Needs:* 1.1; Mathlib `Measure.withDensity_rnDeriv_eq`, `lintegral_withDensity_eq_lintegral_mul`,
`InformationTheory.klDiv_eq_zero_iff`.

### 1.3 The Jensen–Shannon divergence and total variation

For probability measures `P`, `Q` with `δ = δ(P, Q)`:

- `jsDiv_mem_bounds`: `log 2 − h((1 − δ)/2) ≤ JSD(P, Q) ≤ δ log 2`;
- `jsDiv_eq_log_two_iff`: `JSD(P, Q) = log 2` exactly when `P ⟂ Q`;
- `tendsto_jsDiv_iff_tendsto_tvDist`: for a family `P_i` along any filter,
  `JSD(P_i, Q) → 0` exactly when `δ(P_i, Q) → 0`.

In particular `JSD(P, Q) = 0` only when `P = Q`. Both bounds are attained for every `δ ∈ [0, 1]`:
the lower one by `Ber((1 + δ)/2)` and `Ber((1 − δ)/2)`, the upper one on three points `a`, `b`, `c`
by `δ δ_a + (1 − δ) δ_c` and `δ δ_b + (1 − δ) δ_c`, which have `M = (δ/2, δ/2, 1 − δ)` and both
relative entropies to `M` equal to `δ log 2`.

(Polyanskiy–Wu (7.39), p. 133, translated from `JS = 2 JSD`, with a sketch of the proof; the
equivalence of convergences is Arjovsky–Chintala–Bottou Theorem 2 (1), p. 6, proof in Appendix C,
pp. 21–23, stated there on a compact space. The proof below is complete and is the roadmap's own.)

Route. Upper bound: with `p`, `q` the densities with respect to `P + Q` and `t = p/(p + q)`,
`p log(2p/(p + q)) + q log(2q/(p + q)) = (p + q)(log 2 − h(t))`, and `h(t) ≥ (1 − |2t − 1|) log 2`
by concavity of `h` (Mathlib `Real.strictConcave_binEntropy`, with `h(0) = h(1) = 0` and
`h(½) = log 2`), so the integrand is at most `|p − q| log 2`; integrate, using
`∫ |p − q| d(P + Q) = tvDist P Q` (MathematicalStatisticsNonparametric 1.4,
`one_sub_tvDist_eq_integral_min`, with `|p − q| = p + q − 2 min(p, q)`), and halve. Lower bound:
take a Hahn set `s` (Mathlib `MeasureTheory.exists_isHahnDecomposition`), so that
`P(sᶜ) − Q(sᶜ) = δ` (`IsHahnDecomposition.tvDist_eq`), and push both laws and their mixture forward
along the indicator of `sᶜ`; by `klDiv_map_le` the divergence does not increase, which reduces to
`Ber(p)`, `Ber(q)` with `p − q = δ`. On that line the binary `JSD` is convex (each of its terms,
such as `p log(2p/(p + q))`, is the perspective `q ψ(p/q)` of the convex `ψ(t) = t log(2t/(1 + t))`,
with `ψ''(t) = 1/(t(1 + t)²)`; proved inline) and invariant under `(p, q) ↦ (1 − q, 1 − p)` (relabel
and swap the two laws), so it is smallest at the midpoint `((1 + δ)/2, (1 − δ)/2)`, where it equals
`log 2 − h((1 − δ)/2)`. The second item: if `P ⟂ Q` then `δ = 1` (`tvDist_of_mutuallySingular`) and
the lower bound is `log 2 − h(0) = log 2`; conversely the upper bound forces `δ = 1`, and then the
Hahn set has `P(sᶜ) = 1` and `Q(sᶜ) = 0`. The third: the upper bound gives one direction; for the
other, `φ(δ) = log 2 − h((1 − δ)/2)` is continuous and strictly increasing on `[0, 1]` with
`φ(0) = 0`, so `φ(δ_i) → 0` forces `δ_i → 0`. Pinsker's inequality would give only `δ²/2` and is not
used.

**Checks.**

- `Ber(2/3)` and `Ber(1/3)` (`δ = 1/3`): `JSD = log 2 − h(1/3) = (5/3) log 2 − log 3`, the lower
  bound; the upper bound `(1/3) log 2` exceeds it by `(1/3) log(27/16) > 0`.
- `Ber(1)` and `Ber(2/3)` (`δ = 1/3`, not of the extremal form):
  `JSD = (4/3) log 2 + ½ log 3 − (5/6) log 5`; six times its excess over the lower bound is
  `log(19683/12500) > 0`, and six times its deficit from the upper bound is `log(3125/1728) > 0`, so
  both inequalities are strict.
- `Ber(1)` and `Ber(½)`: `δ = ½` and `JSD < log 2`, as the second item requires for laws that are
  not mutually singular.

*Needs:* 1.1; MathematicalStatisticsNonparametric 1.4 (`one_sub_tvDist_eq_integral_min`); Mathlib
`MeasureTheory.exists_isHahnDecomposition`, `IsHahnDecomposition.tvDist_eq`,
`tvDist_of_mutuallySingular`, `InformationTheory.klDiv_map_le`, `Real.strictConcave_binEntropy`,
`Real.binEntropy_two_inv`.

### Examples

- The three-point example and the Bernoulli pairs of the Checks.
- 1.2 (c) and 1.3 together give `sup_D V(D) ∈ [−log 4, 0]`, with `0` exactly for mutually singular
  laws: a discriminator can then separate the laws perfectly in the limit, though no single one
  does.

### Dependencies

1.1 uses MathematicalStatisticsNonparametric 2.4 (copied definitions) and Mathlib. 1.2 uses 1.1 and
Mathlib; 1.3 uses 1.1, MathematicalStatisticsNonparametric 1.4 and Mathlib.

## Layer 2: f-divergences and their variational representation

### 2.1 f-divergences and convex conjugates

The f-divergence of the Conventions is Tau Ceti's `internalEnergy f Q P`, with
`f'(∞) = recessionConstant f`; for `f` convex on `[0, ∞)`, `f(x)/x` tends to `f'(∞) ∈ (−∞, +∞]`
(`ConvexOn.tendsto_div_recessionConstant`). Define `nonnegConjugate f y = sup_{x ≥ 0} (x y − f(x))`
in `EReal` as Tau Ceti's Legendre–Fenchel conjugate `fenchelConjugate`, for the inner product of
`ℝ`, of the extension of `f` by `⊤` on `(−∞, 0)` (for `x < 0` the term `x y − ⊤` is `⊥`). `f*`
never takes the value `−∞` (take `x = 0`), and for `f` convex on `[0, ∞)` its domain contains every
subgradient of `f` at `1`, so it is not empty.

**Checks.**

- `f(x) = x log x − x + 1`: `f*(y) = e^y − 1` (maximum at `x = e^y`), `dom f* = ℝ`, `f'(∞) = +∞`,
  and `D_f(P ‖ Q)` is Mathlib's `klDiv P Q` for probability measures (this `f` is Mathlib's
  `InformationTheory.klFun`), both being `+∞` when `P` is not absolutely continuous with respect to
  `Q`.
- `f(x) = |x − 1|/2`: `f*(y) = max(y, −½)` for `y ≤ ½` and `+∞` for `y > ½`, `f'(∞) = ½`, and
  `D_f(P ‖ Q) = δ(P, Q)`. For `P = δ_a`, `Q = δ_b` with `a ≠ b`: `f(0) · 1 + f'(∞) · 1 = 1`.
- The GAN generator `f(u) = u log u − (u + 1) log(u + 1)` of Nowozin–Cseke–Tomioka (Table 1,
  p. 3) has `f(1) = −log 4`, `f(0) = 0`, `f'(∞) = 0`, `f*(t) = −log(1 − e^t)` for `t < 0` and
  `+∞` for `t ≥ 0` (their Table 2, p. 4), and `D_f(P ‖ Q) = 2 JSD(P, Q) − log 4`; for
  `P = (½, ⅓, ⅙)` and `Q = (⅙, ⅓, ½)` both sides agree exactly. The caption of their Table 1
  says `f(1) = 0` for every row, which fails for this row; their Appendix B notes that the GAN
  generator does not satisfy `f(1) = 0`.

*Needs:* Mathlib `Measure.rnDeriv`, `Measure.singularPart`, `innerₗ`, `EReal`; Tau Ceti
`TauCeti.internalEnergy`, `TauCeti.recessionConstant`, `ConvexOn.tendsto_div_recessionConstant`,
`TauCeti.fenchelConjugate`.

### 2.2 The variational representation

Let `f` be convex on `[0, ∞)` and `P`, `Q` probability measures.

- `integral_sub_integral_le_internalEnergy`: for `g : X → ℝ` with values in `dom f*`,
  `g ∈ L¹(P)` and `f*(g) ∈ L¹(Q)`, `E_P g − E_Q f*(g) ≤ D_f(P ‖ Q)`; and when `P ≪ Q`, equality
  holds exactly when `f(r) + f*(g) = r g` holds `Q`-almost everywhere, with `r = dP/dQ`, that is,
  when `g(x)` is a subgradient of `f` (extended by `+∞` on the negative half-line) at `r(x)` for
  almost every `x`.
  Convexity is the setting of f-divergences; the route of the equality clause uses it for the
  measurability of `f(r)`.
- `internalEnergy_eq_iSup`: if moreover `f` is continuous at `0` from the right, `D_f(P ‖ Q)` is
  the supremum of `E_P g − E_Q f*(g)` over the measurable `g` with finitely many values, all in
  `dom f*`.

(Polyanskiy–Wu Theorem 7.26 (a), p. 148, with the weak inequality (7.104) and the identity
`sup dom f* = f'(∞)` (7.106) in its proof, pp. 155–156; Nguyen–Wainwright–Jordan Lemma 1, p. 4, with
the roles of the two laws exchanged; Nowozin–Cseke–Tomioka eqs. (4)–(5), p. 3, without proof. The
equality clause is stated here in its exact measure form. The proof of `internalEnergy_eq_iSup`
below differs from Polyanskiy–Wu's, which reduces to finite partitions by their Theorem 7.6, and is
the roadmap's own.)

Route. Decompose `P = r · Q + P_⊥` (`Measure.rnDeriv_add_singularPart`) with `P_⊥` carried by a
`Q`-null set `N`. Weak inequality: Fenchel–Young `r g − f*(g) ≤ f(r)` holds pointwise because
`x = r(x) ≥ 0` is admissible in the supremum defining `f*`; on `N`, every `y ∈ dom f*` satisfies
`y ≤ f'(∞)`, since `x y − f(x)` bounded above forces `y ≤ lim f(x)/x`. Integrate:
`E_P g = ∫ r g dQ + ∫ g dP_⊥` (when `f(r)` is not integrable the right side is `+∞`). Equality case
for `P ≪ Q`: `P_⊥ = 0`, `r g ∈ L¹(Q)` because `∫ |g| r dQ = ∫ |g| dP`, and the difference
`f(r) − r g + f*(g)` is nonnegative; if it vanishes almost everywhere then `f(r)` is integrable and
the two sides agree, and if the two sides agree the integral of the difference is `0`
(`integral_eq_zero_iff_of_nonneg_ae`). Supremum: `≤` is the weak inequality, simple functions being
integrable. For `≥`: first, for every `r ≥ 0`, `f(r) = sup_{y ∈ dom f*} (r y − f*(y))` (Tau Ceti's
Fenchel–Moreau theorem `fenchelConjugate_innerₗ_fenchelConjugate_innerₗ` on `ℝ`, applied to the
extension of `f` by `⊤`, which has a convex epigraph, never takes the value `⊥` and is lower
semicontinuous because `f` is continuous on `(0, ∞)` by convexity and at `0` by hypothesis; the
values `y ∉ dom f*` contribute `⊥`), and `sup dom f* = f'(∞)`. The function `y ↦ r y − f*(y)` is
concave on the interval `dom f*` and its value at an endpoint is at most its limit from the inside,
so the supremum may be taken over a countable set `{y_k}` dense in `dom f*`, together with the
endpoints that belong to it. Let `φ_n(r) = max_{k ≤ n} (r y_k − f*(y_k))`, `g_n(x)` a maximizing
`y_k` at `r(x)` for `x ∉ N`, and on `N` the largest `y_k`, `k ≤ n`. Then `g_n` is measurable with
finitely many values in `dom f*`, `E_P g_n − E_Q f*(g_n) = ∫ φ_n(r) dQ + (max_{k ≤ n} y_k) P_⊥(X)`,
`φ_n(r)` increases to `f(r)` and is bounded below by the integrable `r y_1 − f*(y_1)`, so by
monotone convergence (`MeasureTheory.lintegral_iSup` applied to `φ_n(r) − φ_1(r) ≥ 0`) the values
increase to `∫ f(r) dQ + f'(∞) P_⊥(X)` in `(−∞, +∞]`, which is `D_f(P ‖ Q)` (also when `f(r)` is not
integrable, both being `+∞`).

**Checks.**

- The KL row of 2.1 gives `KL(P ‖ Q) = sup_g (E_P g − E_Q (e^g − 1))` over finitely valued `g`,
  which Tau Ceti's `klDiv_eq_iSup_integral_sub_integral_exp_sub_one` states over bounded
  measurable `g`, and its equality case `g = log r` is the case `s = univ` of Tau Ceti's
  `integral_sub_integral_indicator_exp_sub_one_eq_toReal_klDiv_iff`.
- The GAN row of 2.1 with `g = log D`: the supremum over finitely valued discriminators of
  `E_P log D + E_Q log(1 − D)` is `2 JSD − log 4`, the value 1.2 (c) gives over all
  discriminators; for mutually singular laws it is `0` and not attained, as `dom f* = (−∞, 0)` is
  open.
- Continuity at `0` is needed: `f(x) = |x − 1|/2` for `x > 0` with `f(0) = 1` is convex on
  `[0, ∞)`, has the same conjugate as in 2.1, and for `P = δ_a`, `Q = δ_b` gives
  `D_f = 1 + ½ = 3/2` while the supremum is `1`.
- Convexity is needed: `f(x) = −(x − 1)²` has `f* = +∞` everywhere, so the supremum is over the
  empty set and is `⊥`, while `D_f(P ‖ P) = f(1) = 0`.
- `P ≪ Q` is needed in the equality clause: for `f(x) = |x − 1|/2`, `P = δ_a`, `Q = δ_b`, the
  function with `g(b) = −½`, `g(a) = 0` satisfies Fenchel–Young `Q`-almost everywhere, yet
  `E_P g − E_Q f*(g) = ½ < 1 = D_f`.

*Needs:* 2.1; Mathlib `Measure.rnDeriv_add_singularPart`, `integral_eq_zero_iff_of_nonneg_ae`,
`MeasureTheory.lintegral_iSup`; Tau Ceti `TauCeti.sub_le_fenchelConjugate` (Fenchel–Young),
`TauCeti.fenchelConjugate_innerₗ_fenchelConjugate_innerₗ`, `ConvexOn.tendsto_div_recessionConstant`.

### Examples

- Polyanskiy–Wu Examples 7.3–7.4, p. 149, extend `f(x) = |x − 1|/2` and `f(x) = (x − 1)²` to all
  of `ℝ` and obtain `δ = sup_{|g| ≤ ½} (E_P g − E_Q g)` and
  `χ²(P ‖ Q) = sup_g (2 E_P g − E_Q g² − 1)`. With the conjugate over `[0, ∞)` used here the
  formulas differ (for the second, `f*(y) = y + y²/4` for `y ≥ −2` and `−1` below), but the
  suprema are the same, since by 2.2 each is the f-divergence.

### Dependencies

2.1 and 2.2 use Mathlib and Tau Ceti (2.2 uses 2.1).

## Layer 3: the Wasserstein objective

### 3.1 Wasserstein distance against total variation

- `wassersteinEDist_one_le_ofReal_mul_tvDist`: on a pseudometric space with any σ-algebra, in
  which every distance is at most `R`, `W₁(P, Q) ≤ R · δ(P, Q)`. Hence
  convergence in total variation, or by 1.3 in Jensen–Shannon divergence, implies convergence in
  `W₁` there.
- Define `parallelLine θ`, the law of `(θ, Z)` on `ℝ × ℝ` for `Z` uniform on `[0, 1]`. Prove
  `parallelLine_divergences`: `W₁(P_0, P_θ) = |θ|` for every `θ`, and for `θ ≠ 0`,
  `JSD(P_0, P_θ) = log 2`, `KL(P_0 ‖ P_θ) = KL(P_θ ‖ P_0) = +∞` and `δ(P_0, P_θ) = 1`. So
  `θ ↦ W₁(P_0, P_θ)` is continuous while the Jensen–Shannon divergence, both relative entropies
  and the statistical distance jump at `θ = 0`, and the converse of the first item fails even on
  a bounded space: the laws `P_θ` with `|θ| ≤ 1` all live in `[−1, 1] × [0, 1]`.

(Arjovsky–Chintala–Bottou Example 1, p. 4, and Theorem 2 (4), p. 6, whose proof in Appendix C, p.
23, is one sentence on the strong and weak-star topologies; Theorem 1 (3), p. 5. The bound with the
constant `R` is proved here. `ℝ × ℝ` carries Lean's maximum metric; every value above is the same
for the Euclidean norm of the source, because the coupling below moves points horizontally and the
first coordinate is `1`-Lipschitz for both norms. The source prints `JS = log 2`, which is the value
in the normalisation of this roadmap, not in that of its own §2.)

Route. First item: let `m = min(p, q) · (P + Q)` with `p`, `q` the densities, of mass `1 − δ` by
MathematicalStatisticsNonparametric 1.4 (`one_sub_tvDist_eq_integral_min`). If `δ = 0` then `P = Q`
and the diagonal coupling costs `0`. Otherwise couple `m` with itself on the diagonal and `P − m`
with `Q − m` by the product coupling divided by `δ`; the marginals are `P` and `Q`, the diagonal
part costs `0` and the rest at most `R δ`, and `wassersteinEDist_le` bounds `W₁` by this cost. Only
upper bounds on lower integrals enter (`lintegral_add_measure`, `lintegral_map_le` along the
measurable diagonal map, `lintegral_mono` against the constant `R`), so the distance need not be
measurable on `X × X`. Parallel lines: `P_θ` is the image of `P_0` under `x ↦ x + (θ, 0)`, so
`wassersteinEDist_map_le` gives `W₁ ≤ |θ|`; the `1`-Lipschitz function `x ↦ −sign(θ) x₁` and
`ofReal_integral_sub_integral_le_wassersteinEDist_one` give `W₁ ≥ |θ|`. For `θ ≠ 0` the two laws
live on the disjoint lines `{0} × ℝ` and `{θ} × ℝ`, so they are mutually singular: `klDiv_of_not_ac`
in both orders, `tvDist_of_mutuallySingular` (`tvDist = 2`) and `jsDiv_eq_log_two_iff` of 1.3.

**Checks.**

- The bound is sharp: if singletons are measurable, `P = δ_x` and `Q = δ_y` with
  `dist x y = R > 0` have `W₁ = R` (Tau Ceti `TauCeti.wassersteinEDist_dirac_dirac`) and `δ = 1`.
- Boundedness is needed: on `ℝ`, `P = δ_0` and `Q_n = (1 − 1/n) δ_0 + (1/n) δ_(n²)` have
  `δ = 1/n → 0` while `W₁(P, Q_n) = n → ∞` (every coupling with a Dirac law is the product).

*Needs:* 1.3 (`jsDiv_eq_log_two_iff`); MathematicalStatisticsNonparametric 1.4
(`one_sub_tvDist_eq_integral_min`); Mathlib `MeasureTheory.lintegral_add_measure`,
`MeasureTheory.lintegral_map_le`, `MeasureTheory.lintegral_mono`; Tau Ceti
`TauCeti.wassersteinEDist_le`,
`TauCeti.wassersteinEDist_map_le`, `TauCeti.ofReal_integral_sub_integral_le_wassersteinEDist_one`;
Mathlib `InformationTheory.klDiv_of_not_ac`, `tvDist_of_mutuallySingular`.

### 3.2 Continuity and almost-everywhere differentiability of the Wasserstein loss

- `continuous_wassersteinEDist_one_map`: if every distance in `X` is at most `R`, `z ↦ g z θ` is
  measurable for every `θ` and `θ ↦ g z θ` is continuous for every `z` (on a pseudometric space
  `Θ`), then `θ ↦ W₁(Pr, P_θ)` is continuous.
- `lipschitzOnWith_wassersteinEDist_one_map`: let `U` be an open subset of a finite-dimensional
  real normed space, `z ↦ g z θ` measurable for `θ ∈ U`, and `L ∈ L¹(μ)` with
  `d(g z θ, g z θ') ≤ L(z) ‖θ − θ'‖` for every `z` and all `θ, θ' ∈ U`. If `W₁(Pr, P_θ₀) < ∞` for
  some `θ₀ ∈ U`, then `W₁(Pr, P_θ)` is finite for every `θ ∈ U`, `θ ↦ W₁(Pr, P_θ)` is
  `(∫ L dμ)`-Lipschitz on `U`, and it is differentiable at almost every point of `U` for every
  additive Haar measure.

(Arjovsky–Chintala–Bottou Theorem 1 (1)–(2), p. 5, proof in Appendix C, pp. 20–21, with Assumption
1, p. 20. The first item is stated in the source with the paper's standing assumption that `X` is
compact (§2, p. 3); here `X` is a bounded Polish space and the parameter space any pseudometric
space, and the printed proof applies unchanged. Without a bound it fails: Check. The second item
replaces the source's local Lipschitz constants `L(θ, z)` by a bound uniform on `U`: the printed
proof, p. 20, takes the expectation in `z` of a bound valid "whenever (θ′, z) ∈ U", where `U` is
the neighbourhood of a single pair `(θ, z)`, so it uses one neighbourhood for all `z`. With the
uniform bound the printed proof is complete, and no bound on `X` is needed.)

Route. For `θ, θ'` the law of `(g z θ, g z θ')` under `μ` couples `P_θ` and `P_θ'`, so
`wassersteinEDist_le` gives `W₁(P_θ, P_θ') ≤ ∫ d(g z θ, g z θ') dμ(z)`. By
`wassersteinEDist_triangle` and `wassersteinEDist_comm` (the distance is measurable on the standard
Borel space `X × X`), `|W₁(Pr, P_θ) − W₁(Pr, P_θ')| ≤ W₁(P_θ, P_θ')` whenever the terms are finite.
In the first item all of them are at most `R` (product coupling) and the integral tends to `0` as
`θ' → θ` by dominated convergence with the constant bound `R`
(`tendsto_lintegral_filter_of_dominated_convergence` along sequences of `Θ`). In the second the
integral is at most `(∫ L dμ) ‖θ − θ'‖`, which gives finiteness on `U` from `θ₀` and the Lipschitz
bound; Rademacher's theorem `LipschitzOnWith.ae_differentiableWithinAt_of_mem` gives
differentiability within `U` at almost every point of `U`, which is differentiability because `U` is
open (`DifferentiableWithinAt.differentiableAt`).

**Checks.**

- Without a bound on `X` the first item fails: `Z = (0, 1]` with the uniform law, `X = Θ = ℝ`,
  `g z θ = θ/z`, `Pr = δ_0`: `W₁(Pr, P_θ) = |θ| E[1/Z] = +∞` for `θ ≠ 0` and `0` at `θ = 0`.
- The parallel lines of 3.1 satisfy the second item with `L = 1` on `U = ℝ`: `W₁(P_0, P_θ) = |θ|`
  is `1`-Lipschitz and differentiable except at `0`.

*Needs:* Tau Ceti `TauCeti.wassersteinEDist_le`, `TauCeti.wassersteinEDist_triangle`,
`TauCeti.wassersteinEDist_comm`; Mathlib `tendsto_lintegral_filter_of_dominated_convergence`,
`LipschitzOnWith.ae_differentiableWithinAt_of_mem`, `DifferentiableWithinAt.differentiableAt`.

### 3.3 Optimal critics and the gradient of the Wasserstein loss

`hasFDerivAt_wassersteinEDist_one_map`: let every distance in `X` be at most `R`, let `U`, `g`
and `L` be as in the second item of 3.2, with `θ₀ ∈ U`, and let `f` be a `1`-Lipschitz function
with `∫ f dPr − ∫ f(g z θ₀) dμ(z) = W₁(Pr, P_θ₀)`. If `θ ↦ W₁(Pr, P_θ)` is differentiable at `θ₀`
(for almost every `θ₀ ∈ U` by 3.2 when `X` is moreover Polish) and `θ ↦ f(g z θ)` is
differentiable at `θ₀` for `μ`-almost every `z`, then the derivative of `θ ↦ W₁(Pr, P_θ)` at `θ₀`
is `−∫ D_θ f(g z θ)|_(θ₀) dμ(z)`.

Such critics exist when `X` is moreover Polish, by Kantorovich–Rubinstein duality with attainment:
`R ≥ 0` (take `x = y`), Tau Ceti's
`exists_lipschitzWith_norm_le_integral_sub_integral_eq_transportCost_truncated_dist` with the bound
`R/2` gives a `1`-Lipschitz `f` with `ofReal(∫ f dPr − ∫ f dP_θ₀)` equal to the transport cost of
`min(d, R) = d`, which is the finite `W₁(Pr, P_θ₀) ≤ R` (`wassersteinEDist_one_eq_transportCost`);
this `f` is optimal when `W₁(Pr, P_θ₀) > 0`, the function `0` is optimal when it is `0`, and
`∫ f dP_θ₀ = ∫ f(g z θ₀) dμ` by `integral_map`.

(Arjovsky–Chintala–Bottou Theorem 3, p. 7, proof in Appendix C, pp. 24–25, on the paper's compact
`X`; here `X` is bounded. The existence of an optimal critic, the first assertion of the source's
theorem, is the attainment just cited. The source cites an envelope theorem and requires that "both
terms are well-defined"; that requirement is replaced by the two differentiability hypotheses, and
the envelope step is proved here.)

Route. `f` is bounded on `X` (`|f x − f y| ≤ R`) and continuous, hence integrable for `Pr` and for
every `P_θ`, and `∫ f dP_θ = ∫ f(g z θ) dμ` for `θ ∈ U` (`integral_map`). `F(θ, z) = f(g z θ)` is
`L(z)`-Lipschitz in `θ ∈ U` and bounded, and `z ↦ D_θ F(θ₀, z)` is almost everywhere strongly
measurable: it is the linear map determined by its values on a basis `(e_i)`, each the almost
everywhere limit of the measurable quotients `n (F(θ₀ + e_i/n, z) − F(θ₀, z))`
(`aestronglyMeasurable_of_tendsto_ae`). So `hasFDerivAt_integral_of_dominated_loc_of_lip` makes
`I(θ) = ∫ F(θ, z) dμ` differentiable at `θ₀` with derivative `∫ D_θ F(θ₀, z) dμ`. By weak duality
(`ofReal_integral_sub_integral_le_wassersteinEDist_one`; `W₁(Pr, P_θ) ≤ R` is finite),
`φ(θ) = W₁(Pr, P_θ) − (∫ f dPr − I(θ))` is `≥ 0` on `U` and `0` at `θ₀`, so it has a local minimum
there; it is differentiable at `θ₀`, so its derivative vanishes (`IsLocalMin.hasFDerivAt_eq_zero`),
which is the formula.

**Checks.**

- `X = [−1, 1]`, `Pr = δ_0`, `g z θ` the point of `[−1, 1]` nearest to `θ`, `U = (−1, 1)`,
  `L = 1`: `W₁(Pr, P_θ) = |θ|`. At `θ₀ = 1/3` the critic `f(x) = −x` is optimal
  (`0 − (−1/3) = 1/3`) and the formula gives `−(−1) = 1`, the derivative of `|θ|` there.
- Optimality of the critic is needed: at `θ₀ = 1/3` the `1`-Lipschitz `f(x) = x` satisfies every
  other hypothesis, but `0 − 1/3 ≠ 1/3`, and the formula would give `−1`.
- At `θ₀ = 0` in the same example `f = 0` is optimal and `θ ↦ f(g z θ)` is differentiable, but the
  loss `|θ|` is not differentiable: the differentiability hypothesis on the loss cannot be dropped.

*Needs:* Tau Ceti `TauCeti.ofReal_integral_sub_integral_le_wassersteinEDist_one`,
`TauCeti.wassersteinEDist_le` (for `W₁ ≤ R`); Mathlib `integral_map`,
`aestronglyMeasurable_of_tendsto_ae`, `hasFDerivAt_integral_of_dominated_loc_of_lip`,
`IsLocalMin.hasFDerivAt_eq_zero`. The existence remark uses Tau Ceti
`TauCeti.exists_lipschitzWith_norm_le_integral_sub_integral_eq_transportCost_truncated_dist` and
`TauCeti.wassersteinEDist_one_eq_transportCost`; the differentiability remark uses 3.2.

### 3.4 Optimal critics have unit gradient along transport rays

Let `E` be a finite-dimensional real inner product space, `P`, `Q` probability measures with finite
first moments, `π` an optimal coupling of `P` (first marginal) and `Q` for the cost `‖x − y‖`, and
`f` a `1`-Lipschitz function with `∫ f dP − ∫ f dQ = W₁(P, Q)`.

- `gradient_eq_of_isOptimalCoupling`: for `π`-almost every `(x, y)`, `f(x) − f(y) = ‖x − y‖`, and if
  `x ≠ y`, then at every point `z = y + t(x − y)`, `t ∈ [0, 1]`, of the closed segment at which `f`
  is differentiable, `∇f(z) = (x − y)/‖x − y‖`.
- `norm_gradient_eq_one`: if `π` does not charge the diagonal `{x = y}`, then `‖∇f‖ = 1` at
  `P`-almost every and at `Q`-almost every point at which `f` is differentiable.

(Gulrajani et al., Proposition 1 and Corollary 1, §2.3, p. 3, with footnotes ‡ and §, proof in
Appendix A, pp. 12–13, on a compact space. Here the laws only have finite first moments, and the
proof below is complete. The source maximises `E_(P_r) f − E_(P_g) f` and parametrises the segment
as `t x + (1 − t) y`; here the orientation is fixed by `f(x) − f(y) = ‖x − y‖` with `x` drawn from
`P`, and the gradient points from `y` to `x`. Corollary 1 rests on the hypothesis `π(x = y) = 0` of
Proposition 1.)

Route. The finite moments make `f` integrable (`HasFiniteMoment.integrable_of_lipschitzWith`) and
`W₁` finite. As `π` is optimal (`IsOptimalCoupling`, `wassersteinEDist_one_eq_transportCost`),
`∫ ‖x − y‖ dπ = W₁(P, Q)`, and the marginals give `∫ (f x − f y) dπ = ∫ f dP − ∫ f dQ`, so the
nonnegative function `‖x − y‖ − (f x − f y)` has integral `0` and vanishes `π`-almost everywhere
(`integral_eq_zero_iff_of_nonneg_ae`). For such a pair with `x ≠ y`, `ψ(t) = f(y + t(x − y)) − f(y)`
is `‖x − y‖`-Lipschitz with `ψ(1) − ψ(0) = ‖x − y‖`, hence `ψ(t) = t ‖x − y‖`; so with
`v = (x − y)/‖x − y‖` the two-sided derivative of `f` at `z` along `v`, which exists where `f` is
differentiable, is `1` (at the endpoints `t = 0, 1` it is computed from the one side within the
segment), that is `⟪∇f(z), v⟫ = 1`. Since `‖∇f(z)‖ ≤ 1`, equality in Cauchy–Schwarz
(`real_inner_le_norm`, `inner_eq_norm_mul_iff_real`) gives `∇f(z) = v`. Corollary: take `t = 1` (the
point `x`) and `t = 0` (the point `y`) and project to the marginals; the set of points of
differentiability where `‖∇f‖ ≠ 1` is Borel (`measurableSet_of_differentiableAt`,
`measurable_fderiv`), so its `P`-measure is the `π`-measure of its preimage, which is `0`.

**Checks.**

- The diagonal hypothesis is needed: for `P = Q`, `f = 0` is optimal and has gradient `0`
  everywhere.
- On `ℝ`, `P = δ_1`, `Q = δ_0`: `f(t) = min(t, 1)` is optimal, has derivative `1` on the segment
  `(0, 1)` and `0` beyond `1`: the statement is about the segment only.
- Existence of an optimal coupling (so that the hypotheses can be met) is Tau Ceti's
  `exists_isOptimalCoupling` for the continuous cost `‖x − y‖` on the Polish space `E`.

*Needs:* Tau Ceti `TauCeti.IsOptimalCoupling`, `TauCeti.wassersteinEDist_one_eq_transportCost`,
`TauCeti.HasFiniteMoment.integrable_of_lipschitzWith`; Mathlib `gradient`,
`integral_eq_zero_iff_of_nonneg_ae`, `real_inner_le_norm`, `inner_eq_norm_mul_iff_real`,
`measurableSet_of_differentiableAt`, `measurable_fderiv`.

### Examples

- The parallel lines of 3.1, placed in the Euclidean plane: the loss `|θ|` has gradient `sign θ`
  for `θ ≠ 0`, and the critic `x ↦ −sign(θ) x₁` of its route is optimal for `(P_0, P_θ)` with
  gradient `(−sign θ, 0)`, the unit vector from `(θ, z)` to `(0, z)`, as 3.4 predicts for the
  optimal coupling `(0, z) ↦ (θ, z)`, which does not charge the diagonal.

### Dependencies

3.1 uses 1.3, MathematicalStatisticsNonparametric 1.4, Tau Ceti and Mathlib. 3.2 uses Tau Ceti and
Mathlib. 3.3 uses Tau Ceti and Mathlib, and 3.2 in a remark. 3.4 uses Tau Ceti and Mathlib.

## Scope and ownership

This roadmap owns: the measure form of the original GAN game (the gap identity, the value of the
game, its attainment and Goodfellow et al.'s Theorem 1); the bounds between the Jensen–Shannon
divergence and total variation with their consequences; the variational representation of
f-divergences and its equality case; the comparison of `W₁` with total variation on bounded
spaces and the parallel lines; continuity, Lipschitz continuity and almost-everywhere
differentiability of the Wasserstein loss; the gradient of the loss through an optimal critic; and
the unit-gradient property of optimal critics.

Stated elsewhere and not restated here:

- OptimalTransport, Layer 3 (3.1 the Wasserstein distance, 3.4 Wasserstein convergence, 3.8
  Kantorovich–Rubinstein duality) and Layer 1 (optimal couplings), realised by the Tau Ceti optimal
  transport library: Kantorovich–Rubinstein duality `TauCeti.wassersteinEDist_one_eq_iSup`, its
  bounded-Lipschitz form with attainment, existence of optimal couplings, and the equivalence of
  `W₁` convergence with weak convergence plus convergence of first moments
  (`TauCeti.WassersteinSpace.tendsto_iff_tendsto_toProbabilityMeasure_and_lintegral`, which gives
  Arjovsky–Chintala–Bottou Theorem 2 (2) on compact spaces). They are cited above by their
  declared names.
- MathematicalStatisticsNonparametric 2.4 owns the uniform mixture and its mutual information
  (copied verbatim) and Fano's inequality; its 1.1–1.2 own the Hellinger and chi-square divergences,
  and its 1.4 the comparison inequalities between them, total variation and the relative entropy, of
  which Scheffé's identity is used in 3.1. The Jensen–Shannon divergence here is the two-law case of
  its mutual information.
- Tau Ceti owns the variational formulas for the relative entropy
  (`TauCeti.klDiv_eq_iSup_integral_sub_integral_exp_sub_one` with its equality case, and the
  Donsker–Varadhan formula `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`) and Pinsker's
  inequality `TauCeti.etvDist_sq_le_two_mul_klDiv`. The first variational formula is the KL case
  of 2.2 (over bounded instead of finitely valued functions) and appears in its Checks; the
  Donsker–Varadhan formula follows from it by optimising over additive constants. No route uses
  any of them.
- OptimalTransport 9.5 (internal energies) and 5.1 (convex duality), realised by Tau Ceti, own the
  f-divergence itself, as the internal energy `TauCeti.internalEnergy` relative to `Q` with the
  recession constant `TauCeti.recessionConstant`, and the Legendre–Fenchel conjugate
  `TauCeti.fenchelConjugate` with the Fenchel–Young inequality and the Fenchel–Moreau theorem;
  Layer 2 uses them as its definitions and in its route.
- StatisticalLearningTheory, a roadmap by another contributor on the distribution-free theory of
  learning from examples (pull request
  [#2515](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2515)), lists generative
  adversaries, in its section "Beyond this roadmap" (Deep learning theory), among the topics that
  need a roadmap of their own. This roadmap treats the objectives of generative adversarial
  networks: the optimal discriminator and the Jensen–Shannon form of the value, the variational
  representation of f-divergences, and the Wasserstein objective. The pointwise identity in the
  route of 1.2, `−a log b − (1 − a) log(1 − b) = h(a) + binKL(a, b)`, is the two-point case of the
  logarithmic-loss item of that roadmap's 1.3 (`crossEntropy_eq_entropy_add_relEntropy`); it is
  proved here inline, together with the equality case `binKL(a, b) = 0` only for `a = b`, which 1.2
  also uses. Nothing else in that roadmap is used or restated, and this roadmap does not depend on
  it.

Not treated here: the convergence of the training dynamics (Goodfellow et al., Proposition 2); the
`−log D` generator objective and the manifold-support analysis of Arjovsky–Bottou; the metric
property of the square root of the Jensen–Shannon divergence; feed-forward networks as generators
(Arjovsky–Chintala–Bottou Corollary 1); maximum mean discrepancy and other kernel discrepancies;
noise-contrastive estimation, which fits a density by classifying data against samples of a fixed
noise law; and every training algorithm.

## Exact supplier contracts

### From Mathlib

- `InformationTheory.klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`; `+∞` unless
  `P ≪ Q` and the log-likelihood ratio is integrable, with the mass correction), with
  `klDiv_eq_zero_iff` (finite measures: `klDiv P Q = 0 ↔ P = Q`) and `klDiv_of_not_ac` in the same
  file; `klDiv_map_le` (`Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean`: finite
  measures and a measurable map).
- `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`, the total mass
  of `P − Q`); `tvDist_of_mutuallySingular` and `IsHahnDecomposition.tvDist_eq`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/Basic.lean`, finite measures);
  `MeasureTheory.exists_isHahnDecomposition`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Hahn.lean`).
- `Measure.rnDeriv`, `Measure.singularPart`, `Measure.rnDeriv_add_singularPart`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`); `Measure.withDensity_rnDeriv_eq`
  (`P ≪ Q` and a Lebesgue decomposition;
  `Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean`);
  `lintegral_withDensity_eq_lintegral_mul` (`Mathlib/MeasureTheory/Measure/WithDensity.lean`).
- `Real.binEntropy`, `Real.binEntropy_two_inv`, `Real.strictConcave_binEntropy` (strictly concave
  on `[0, 1]`) (`Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`).
- `integral_eq_zero_iff_of_nonneg_ae`, `integral_map`
  (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`); `MeasureTheory.lintegral_iSup` (monotone
  convergence; `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`);
  `tendsto_lintegral_filter_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean`, countably generated filter).
- `LipschitzOnWith.ae_differentiableWithinAt_of_mem` (`Mathlib/Analysis/Calculus/Rademacher.lean`:
  finite-dimensional spaces, an additive Haar measure); `DifferentiableWithinAt.differentiableAt`;
  `hasFDerivAt_integral_of_dominated_loc_of_lip`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean`: a neighbourhood `s` of `x₀`, a.e.-measurable
  sections near `x₀`, integrable `F x₀`, a.e.-measurable `F'`, Lipschitz bound on `s` with
  integrable constant, a.e. differentiability at `x₀`); `IsLocalMin.hasFDerivAt_eq_zero`.
- `MeasureTheory.lintegral_add_measure`, `MeasureTheory.lintegral_map_le` (a.e.-measurable map, any
  integrand), `MeasureTheory.lintegral_mono`; `aestronglyMeasurable_of_tendsto_ae`
  (`Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean`); `innerₗ`;
  `InformationTheory.klFun` (`Mathlib/InformationTheory/KullbackLeibler/KLFun.lean`).
- `gradient`, `real_inner_le_norm`, `inner_eq_norm_mul_iff_real`;
  `measurableSet_of_differentiableAt`, `measurable_fderiv`
  (`Mathlib/Analysis/Calculus/FDeriv/Measurable.lean`).

### From Tau Ceti

The optimal transport declarations are in `TauCeti/MeasureTheory/OptimalTransport/`, the
realisation of the roadmap OptimalTransport.

- `TauCeti.wassersteinEDist` (the infimum over couplings of the `L^p` norm of `edist`),
  `TauCeti.HasFiniteMoment`, `TauCeti.wassersteinEDist_le` (any coupling bounds `W_p`),
  `TauCeti.wassersteinEDist_dirac_dirac` (measurable singletons; in a Check of 3.1),
  `TauCeti.wassersteinEDist_map_le` (measurable distance, a.e.-measurable map),
  `TauCeti.wassersteinEDist_triangle` (standard Borel, measurable distance, finite middle measure),
  `TauCeti.wassersteinEDist_comm`, `TauCeti.wassersteinEDist_one_eq_transportCost` (measurable
  distance) (`Wasserstein/Basic.lean`); `TauCeti.HasFiniteMoment.integrable_of_lipschitzWith`
  (finite measure, first moment).
- `TauCeti.ofReal_integral_sub_integral_le_wassersteinEDist_one` (a `1`-Lipschitz function
  integrable for both measures), `TauCeti.wassersteinEDist_one_eq_iSup`,
  `TauCeti.exists_lipschitzWith_norm_le_integral_sub_integral_eq_transportCost_truncated_dist`
  (Polish, Borel, finite measures of equal mass, `0 ≤ R`)
  (`Wasserstein/KantorovichRubinstein.lean`).
- `TauCeti.IsOptimalCoupling`, `TauCeti.transportCost` (`Cost/Basic.lean`);
  `TauCeti.exists_isOptimalCoupling` (Polish spaces, lower semicontinuous cost)
  (`Existence/Basic.lean`);
  `TauCeti.WassersteinSpace.tendsto_iff_tendsto_toProbabilityMeasure_and_lintegral`
  (`Wasserstein/Moment.lean`).
- `TauCeti.internalEnergy` (`Wasserstein/InternalEnergy/Basic.lean`); `TauCeti.recessionConstant`
  and `ConvexOn.tendsto_div_recessionConstant` (`f` convex on `[0, ∞)`)
  (`TauCeti/Analysis/Convex/RecessionConstant.lean`); `TauCeti.fenchelConjugate` and
  `TauCeti.sub_le_fenchelConjugate` (`TauCeti/Analysis/Convex/Conjugate.lean`);
  `TauCeti.fenchelConjugate_innerₗ_fenchelConjugate_innerₗ` (complete real inner product space,
  convex epigraph, lower semicontinuous, never `⊥`) (`TauCeti/Analysis/Convex/FenchelMoreau.lean`).
- `TauCeti.klDiv_eq_iSup_integral_sub_integral_exp_sub_one`,
  `TauCeti.integral_sub_integral_indicator_exp_sub_one_eq_toReal_klDiv_iff`,
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`
  (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`) and
  `TauCeti.etvDist_sq_le_two_mul_klDiv` (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`),
  in Checks and the scope section only.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 2.4 `uniformMixture` and `mutualInfoUniform`, copied verbatim with their `variable` line
  (`{X Y : Type*} [MeasurableSpace X] [PseudoMetricSpace Y] [MeasurableSpace Y]`), in 1.1.
- 1.4 `one_sub_tvDist_eq_integral_min` (Scheffé: for probability measures,
  `1 − tvDist P Q / 2 = ∫ min(dP/dν, dQ/dν) dν` with `ν = P + Q`), in 1.3 and 3.1.

## References

- I. Goodfellow, J. Pouget-Abadie, M. Mirza, B. Xu, D. Warde-Farley, S. Ozair, A. Courville and
  Y. Bengio, *Generative adversarial nets*, arXiv:1406.2661v1 (2014). Used: Proposition 1 and
  eqs. (2)–(4), p. 4; Theorem 1 and eqs. (5)–(6), p. 5.
- Y. Polyanskiy and Y. Wu, *Information Theory: From Coding to Learning*, Cambridge University
  Press (2025); cited in the authors' draft of August 16, 2024 from the first author's MIT page,
  whose printed page numbers are used. Used: Definition 7.1 and (7.2), pp. 115–116; (7.8), p. 117;
  (7.39), p. 133; Theorem 7.26, p. 148; Examples 7.3–7.5, pp. 149–150; proof of Theorem 7.26,
  pp. 155–156.
- X. Nguyen, M. J. Wainwright and M. I. Jordan, *Estimating divergence functionals and the
  likelihood ratio by convex risk minimization*, arXiv:0809.0853v2. Used: Lemma 1, p. 4.
- S. Nowozin, B. Cseke and R. Tomioka, *f-GAN: training generative neural samplers using
  variational divergence minimization*, arXiv:1606.00709v1 (2016). Used: eq. (3), p. 2; Table 1 and
  eqs. (4)–(5), p. 3; Table 2, p. 4.
- M. Arjovsky, S. Chintala and L. Bottou, *Wasserstein GAN*, arXiv:1701.07875v3 (2017). Used: §2,
  pp. 3–4; Example 1, p. 4; Theorem 1, p. 5; Theorem 2, p. 6; Theorem 3, p. 7; Assumption 1 and the
  proofs of Theorems 1–3, Appendices B–C, pp. 20–25.
- I. Gulrajani, F. Ahmed, M. Arjovsky, V. Dumoulin and A. Courville, *Improved training of
  Wasserstein GANs*, arXiv:1704.00028v3 (2017). Used: §2.3, Proposition 1, Corollary 1 and
  footnotes, p. 3; Appendix A, pp. 12–13.
