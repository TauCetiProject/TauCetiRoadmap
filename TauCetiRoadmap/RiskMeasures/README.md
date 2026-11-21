# Roadmap: risk measures

**Summary.** A risk measure assigns to an uncertain future position a number read as a capital
requirement: the amount of cash that, added to the position, makes it acceptable. This roadmap
builds the axiomatic theory of such functionals and its two standard examples built on
quantiles. A position is a real function `X` on a set `Ω` of scenarios, read as a discounted
payoff, so that larger is better. A monetary risk measure is a real functional `ρ` that is
antitone for the pointwise order and cash invariant, `ρ(X + m) = ρ(X) − m` for every constant
`m`; it is convex if it is a convex function, and coherent if it is moreover positively
homogeneous. The scenario set is finite for the acceptance-set correspondence and the dual
representations; Value at Risk and Average Value at Risk are treated on an arbitrary probability
space.

The headline theorems are these.

- *Dual representation.* On a finite set `Ω` every convex risk measure satisfies
  `ρ(X) = max_Q (E_Q[−X] − α(Q))`, the maximum over all probability measures `Q` on `Ω` being
  attained, where the minimal penalty `α(Q)` is the supremum of `E_Q[−Y]` over the positions `Y`
  with `ρ(Y) ≤ 0` and may be `+∞`. A coherent risk measure is the maximum of `E_Q[−X]` over the
  probability measures of zero penalty (the theorem of Artzner, Delbaen, Eber and Heath), and
  conversely the supremum of `E_Q[−X]` over any nonempty set of probability measures is
  coherent. For the entropic risk measure `β⁻¹ log E_P[exp(−βX)]` with `β > 0` the minimal
  penalty is the relative entropy of `Q` with respect to `P` divided by `β`.
- *Value at Risk is not subadditive.* For every level `0 < t < 1` there are two positions on a
  four-point probability space whose sum has strictly larger Value at Risk than the sum of their
  Values at Risk, although at these levels Value at Risk of measurable positions is monotone,
  cash invariant and positively homogeneous on every probability space.
- *Average Value at Risk.* For a law with integrable negative part and `0 < t < 1`, the average
  of the Values at Risk at the levels below `t` equals `min_z (z + t⁻¹ E[(−X − z)⁺])`, the
  formula of Rockafellar and Uryasev, and the minimizers form the interval from Value at Risk to
  minus the lower `t`-quantile. At these levels Average Value at Risk is coherent on measurable
  positions with integrable negative part, and for an integrable
  position and `0 < t ≤ 1` it is the maximum of `E_Q[−X]` over the probability measures `Q`
  with `t·Q ≤ P`.

The roadmap builds on Tau Ceti's lower and upper quantile functions and inverse transform
sampling, on Tau Ceti's Donsker–Varadhan formula for Mathlib's relative entropy, and on
Mathlib's convex functions, its affine-minorant theorem and the compactness of the standard
simplex.

Layer 1 below sets up the axioms and acceptance sets. Layer 2, which uses it, proves the dual
representations on a finite set and treats the entropic risk measure. Layer 3 defines Value at
Risk through the upper quantile, and Layer 4, which uses Layer 3, treats Average Value at Risk.
Layers 3 and 4 do not use Layers 1 and 2.

## Conventions

- **Positions and signs.** A position is `X : Ω → ℝ`, a discounted payoff; constants are
  `Function.const Ω m`. A risk measure `ρ` is a capital requirement: cash invariance reads
  `ρ(X + m) = ρ(X) − m` and monotonicity reads `X ≤ Y ⇒ ρ(Y) ≤ ρ(X)`. A position is acceptable
  when `ρ(X) ≤ 0`. Losses `L = −X`, used by Rockafellar and Uryasev, are translated at each
  locator. Expected losses are written `E_Q[−X]`.
- **Order.** In Layers 1 and 2 monotonicity is for the pointwise order on all functions
  `Ω → ℝ`; no reference measure enters the axioms, so a probability measure that charges some
  points with mass zero plays no role there. In Layers 3 and 4 the statements use almost sure
  order under the probability measure `P`, which is weaker as a hypothesis.
- **Finite sets.** Layers 1 and 2 state their theorems on a finite type `Ω` where they need it.
  Probability measures on `Ω` are Mathlib's `ProbabilityMeasure Ω` for the discrete σ-algebra
  (`DiscreteMeasurableSpace Ω`), so that every position is measurable and `E_Q[−X]` is the
  Bochner integral `∫ ω, -X ω ∂Q`, a finite sum. An empty `Ω` carries no monetary risk measure,
  since `X + m = X` there, and no probability measure; every statement is vacuous for it.
  Finiteness is the setting chosen here, not a hypothesis shown to be necessary for each
  statement: it makes every function a bounded measurable position, makes the space of positions
  finite dimensional, so that a real convex functional is continuous and the probability
  measures form a compact simplex, and makes every supremum of expectations bounded. On an
  infinite `Ω` the theory needs a choice of the space of positions and of a continuity
  hypothesis (Föllmer–Schied, §4), which is not treated here.
- **Extended values.** Penalties take values in `EReal`; the minimal penalty may be `+∞`, and
  `(a : EReal) − ⊤ = ⊥` for real `a`. A supremum of real numbers over a set is Mathlib's
  `sSup`, which is `0` for the empty set and for a set unbounded above; every statement that uses
  it says why the set is nonempty and bounded.
- **Levels and quantiles.** For a law `μ` on `ℝ`, Tau Ceti's `μ.quantile t` is the lower
  quantile `inf {x | t ≤ F(x)}` and `μ.upperQuantile t` the upper quantile `inf {x | t < F(x)}`,
  with `F = ProbabilityTheory.cdf μ`. Both are the junk value `0` outside their natural ranges
  (`t ≤ 0` or `t > 1` for the lower, `t < 0` or `t ≥ 1` for the upper quantile). The level `t`
  of Value at Risk and Average Value at Risk is the probability of the bad tail, as in Föllmer
  and Schied and in Acerbi and Tasche; Rockafellar and Uryasev use the confidence level
  `α = 1 − t` and losses.
- **Laws of positions.** For a probability measure `P` on a measurable space `Ω`, Value at Risk
  and Average Value at Risk of a position are those of its law `P.map X`. For a position that is
  not almost everywhere measurable, `P.map X` is the zero measure (a junk value); the statements
  assume `AEMeasurable X P` where it matters.

## Layer 1: risk measures and acceptance sets

### 1.1 The axioms

Define, for `ρ : (Ω → ℝ) → ℝ` on any type `Ω`:

- `IsMonetaryRiskMeasure ρ`: `ρ` is `Antitone` for the pointwise order and
  `ρ (X + Function.const Ω m) = ρ X - m` for every `X` and every real `m`;
- `IsConvexRiskMeasure ρ`: monetary and `ConvexOn ℝ Set.univ ρ`;
- `IsCoherentRiskMeasure ρ`: convex and `ρ (t • X) = t * ρ X` for every `t ≥ 0` and every `X`;
- `acceptanceSet ρ`, the set `{X | ρ X ≤ 0}`.

(Föllmer–Schied, Definitions 2.1, 2.2 and 2.3, p. 2, and §3, p. 3; Artzner–Delbaen–Eber–Heath,
Axioms T, S, PH and M and Definition 2.4, with the reference instrument `r = 1`.) Föllmer and
Schied allow the value `+∞`; here risk measures are real valued.

- A monetary risk measure is `1`-Lipschitz for the supremum norm:
  `|ρ(X) − ρ(Y)| ≤ max_ω |X(ω) − Y(ω)|` when the maximum exists, since
  `X ≤ Y + max |X − Y|`. On a finite `Ω` it is therefore continuous.
- A coherent risk measure has `ρ(0) = 0` (take `t = 0`) and is subadditive; a monetary risk
  measure that is positively homogeneous and subadditive is coherent.
- For a monetary `ρ`, `ρ(X) = inf {m | X + m ∈ acceptanceSet ρ}`, and the infimum is attained
  at `m = ρ(X)` (Föllmer–Schied, (3.1)).

**Checks.**
- The worst-case measure `ρ(X) = −min_ω X(ω)` on a finite nonempty `Ω` is coherent. With the
  opposite sign convention `ρ(X + m) = ρ(X) + m` (losses), the same formula would fail:
  `−min(X + 1) = −min X − 1`.
- On a two-point `Ω` and a probability vector `P`, `ρ(X) = E_P[−X]` is coherent;
  `ρ(X) = E_P[X]` is cash additive with the wrong sign and antitone fails:
  `X = (0, 0) ≤ Y = (1, 1)` gives `E_P[Y] = 1 > 0`.
- `ρ(X) = E_P[−X] + σ_P(X)`, the mean-plus-standard-deviation rule, is cash invariant, convex and
  positively homogeneous but not monotone: with `P = (9/10, 1/10)`, `X = (0, 0) ≤ Y = (0, 10)`
  while `ρ(Y) = −1 + 3 = 2 > 0 = ρ(X)`.

*Needs:* Mathlib `Antitone`, `ConvexOn`.

### 1.2 Convexity and homogeneity through the acceptance set

Let `ρ` be a monetary risk measure on any `Ω`.

- `convexOn_iff_convex_acceptanceSet`: `ρ` is convex exactly when `acceptanceSet ρ` is convex.
- `homogeneous_iff_cone_acceptanceSet`: `ρ(t • X) = t ρ(X)` for all `t ≥ 0` and `X` exactly when
  `t • X ∈ acceptanceSet ρ` for all `t ≥ 0` and acceptable `X`.

(Föllmer–Schied, §3, p. 3, where both are stated without proof; Artzner–Delbaen–Eber–Heath,
Propositions 2.1 and 2.2, for the coherent case.)

Route: convexity of `ρ` gives convexity of its sublevel set `{ρ ≤ 0}`. Conversely, for `m > ρ(X)`
and `n > ρ(Y)`, `X + m` and `Y + n` are acceptable by cash invariance; their convex combination
`a X + (1 − a) Y + (a m + (1 − a) n)` is acceptable, so `ρ(a X + (1 − a) Y) ≤ a m + (1 − a) n`.
For the cone: homogeneity maps acceptable positions to acceptable ones. Conversely, for `t > 0`,
`X + m` is acceptable exactly when `t X + t m` is, so `ρ(t X) = t ρ(X)` by the infimum formula of
1.1; for `t = 0`, the constant `ρ(0)` is acceptable, so is `2 ρ(0)`, hence `ρ(0) ≤ 2 ρ(0)`, and
`0` is acceptable, hence `ρ(0) ≤ 0`; so `ρ(0) = 0`.

**Checks.**
- The monetary hypothesis is needed: on a one-point `Ω`, `ρ(x) = −x²` has acceptance set all of
  `ℝ`, which is convex, while `ρ` is not convex; and `ρ(x) = x³` has acceptance set `(−∞, 0]`,
  a cone, while `ρ(2 · 1) = 8 ≠ 2 = 2 ρ(1)`.
- Convexity does not give homogeneity: `ρ(X) = −min X − 1` is a convex risk measure whose
  acceptance set `{min X ≥ −1}` is convex but not a cone (it contains `(−1, −1)` and not
  `2 • (−1, −1)`), and `ρ(0) = −1 ≠ 0 = 0 · ρ(0)`.

*Needs:* 1.1; Mathlib `ConvexOn.convex_le`.

### 1.3 The risk measure of an acceptance set

Define `riskMeasureOf A X = sInf {m | X + m ∈ A}` for a set `A` of positions. Prove
`riskMeasureOf_isMonetary_and_acceptanceSet_eq`: let `Ω` be finite and `A` a set of positions
that contains a constant, such that `{m | X + m ∈ A}` is bounded below for every `X`, and such
that `X ∈ A` and `X ≤ Y` imply `Y ∈ A`. Then `riskMeasureOf A` is a monetary risk measure and its
acceptance set is the closure of `A` (Föllmer–Schied, (3.2)–(3.5) and the sentence after (3.5),
p. 3, which states the closure property without its form; Artzner–Delbaen–Eber–Heath,
Proposition 2.1, for convex cones).

Route: a constant `c ∈ A` and finiteness give `X + m ≥ c` for `m ≥ c − min X`, so the set is
nonempty, and by hypothesis bounded below. Monotonicity and cash invariance follow from the
upward closure and from shifting `m`. The acceptance set of a monetary risk measure is closed
because the measure is continuous (1.1) and contains `A`. If `riskMeasureOf A X ≤ 0`, then for
every `ε > 0` some `m < ε` has `X + m ∈ A`, so `X + ε ∈ A` by upward closure, and `X` is a limit
of points of `A`.

- By 1.2, `riskMeasureOf A` is convex when `A` is convex and positively homogeneous when `A` is a
  cone, since the closure of a convex set or a cone is again one.
- For a monetary `ρ`, `riskMeasureOf (acceptanceSet ρ) = ρ` by 1.1, and `acceptanceSet ρ`
  satisfies the three hypotheses.

**Checks.**
- Each hypothesis is needed. For `A = ∅` the set of `m` is empty and `sInf ∅ = 0`, so
  `riskMeasureOf A (X + 1) = 0 ≠ −1`. For `A` the set of all positions on a nonempty `Ω` the set
  of `m` is `ℝ`, whose `sInf` is `0`, with the same failure. For `A = {0}` on a two-point `Ω`,
  `riskMeasureOf A (1, 1) = −1` and `riskMeasureOf A (1, 2) = sInf ∅ = 0`, so `(1, 1) ≤ (1, 2)`
  violates monotonicity.
- Finiteness is needed: on `Ω = ℕ`, `A = {X | X ≥ 0}` satisfies the three hypotheses, but for
  `X(n) = −n` no constant makes `X + m ≥ 0`, so `riskMeasureOf A X = 0 = riskMeasureOf A (X + 1)`.
- The closure is needed: on a one-point `Ω`, `A = (0, ∞)` gives `riskMeasureOf A = −x` and
  acceptance set `[0, ∞) ≠ A`.

*Needs:* 1.1, 1.2; Mathlib `closure`, `Real.sInf_empty`, `csInf_le`, `le_csInf`.

### Examples

The worst-case measure and the expectation as coherent risk measures; the mean-plus-deviation
rule as a cash-invariant convex functional that is not monotone; the acceptance set `{X ≥ 0}`
and its failure on `ℕ`.

### Dependencies

Mathlib `Antitone`, `ConvexOn`, `ConvexOn.convex_le`, `closure`, `Real.sInf_empty`, `csInf_le`,
`le_csInf`. No other layer.

## Layer 2: dual representations on a finite set

Throughout, `Ω` is finite with `MeasurableSpace Ω` and `DiscreteMeasurableSpace Ω`.

### 2.1 Convex risk measures

Define `minimalPenalty ρ Q` for `Q : ProbabilityMeasure Ω` as the supremum in `EReal` of
`E_Q[−X]` over `X ∈ acceptanceSet ρ`. Prove `isGreatest_sub_minimalPenalty`: for a convex risk
measure `ρ` and every position `X`, `ρ(X)` is the greatest element of the set of values
`E_Q[−X] − minimalPenalty ρ Q`, `Q` ranging over all probability measures on `Ω`
(Föllmer–Schied, the definition of the minimal penalty and (4.2) on p. 4, with the strong form
(4.6) on p. 4 for bounded measurable functions, of which this is the case of a finite set with
the discrete σ-algebra; proved here).

- For a monetary `ρ`, `minimalPenalty ρ Q` equals the supremum over all `X` of
  `E_Q[−X] − ρ(X)` (Föllmer–Schied, p. 4), by cash invariance; it is never `⊥` and at least
  `−ρ(0)`.
- If `ρ(X) = sup_Q (E_Q[−X] − α(Q))` for all `X` and some `α : ProbabilityMeasure Ω → EReal`,
  then `minimalPenalty ρ ≤ α`, since `E_Q[−X] − α(Q) ≤ ρ(X)` for all `X`.

Route: `E_Q[−X] − minimalPenalty ρ Q ≤ ρ(X)` because `X + ρ(X)` is acceptable. For the reverse,
let `s < ρ(X)`. By Mathlib's `ConvexOn.exists_affine_le_of_lt` on `Set.univ`, with `ρ`
continuous by 1.1, there are a continuous linear `ℓ` and a real `c` with `ℓ + c ≤ ρ` and
`ℓ(X) + c = s`. Write `ℓ(Y) = −∑ w(ω) Y(ω)`. Monotonicity forces `w ≥ 0` (compare `ρ` at
`X + λ 1_ω` for `λ → ∞`) and cash invariance forces `∑ w = 1` (compare at `X + m` for
`m → ±∞`), so `w` is a probability vector `Q`. Then `c ≤ ρ(Y) − E_Q[−Y]` for all `Y`, hence
`c ≤ −minimalPenalty ρ Q` and `s ≤ E_Q[−X] − minimalPenalty ρ Q`. Attainment: identify the
probability measures with the standard simplex `Convexity.StdSimplex ℝ Ω`, compact by the
instance `Convexity.StdSimplex.compactSpace`; `Q ↦ E_Q[−X]` is
continuous and `minimalPenalty ρ` is lower semicontinuous as a supremum of continuous functions,
so the difference attains its supremum (`UpperSemicontinuousOn.exists_isMaxOn`). This is
biconjugation: with the pairing `⟨Y, X⟩ = ∑ Y(ω) X(ω)`, the conjugate of `ρ` at `−Q` is
`minimalPenalty ρ Q` and is `+∞` off the probability vectors, so the identity without attainment
is also Tau Ceti's Fenchel–Moreau theorem `TauCeti.fenchelConjugate_flip_fenchelConjugate_eq`
read through that identification.

**Checks.**
- For `ρ(X) = E_P[−X]` the minimal penalty is `0` at `P` and `+∞` at every `Q ≠ P`: on two points
  with `P = (1/2, 1/2)` and `Q = (1/3, 2/3)`, `Y = (1, −1)` is acceptable and
  `E_Q[−cY] = c/3` for `c = 1, 10, 100`.
- The discrete σ-algebra is needed: with the trivial σ-algebra on two points the only
  probability measure gives `∫ −X = 0` for the non-measurable `X = (1, 2)`, the minimal penalty of
  the worst-case measure is `0`, and the representation would give `0 ≠ −1 = ρ(X)`.
- The value `+∞` occurs and is needed: for the worst-case measure every `Q` has penalty `0`,
  while for `E_P[−X]` every `Q ≠ P` has penalty `+∞`. No real-valued `α` represents `E_P[−X]`:
  for `Q ≠ P` the representation would need `E_Q[−X] − E_P[−X] ≤ α(Q)` for every `X`, and the
  left side is unbounded (it is `c/3` for `X = cY` in the first Check).

*Needs:* 1.1; Mathlib `ProbabilityMeasure`, `DiscreteMeasurableSpace`,
`ConvexOn.exists_affine_le_of_lt`, `Convexity.StdSimplex`, `Convexity.StdSimplex.compactSpace`,
`UpperSemicontinuousOn.exists_isMaxOn`.

### 2.2 Coherent risk measures

- `isGreatest_integral_of_isCoherent`: for a coherent `ρ` and every `X`, `ρ(X)` is the greatest
  value of `E_Q[−X]` over the probability measures `Q` with `minimalPenalty ρ Q ≤ 0`
  (Artzner–Delbaen–Eber–Heath, Proposition 4.1, with the supremum over the set described in its
  proof; Föllmer–Schied, (4.3), p. 4).
- `isCoherent_sSup_integral`: for a nonempty set `𝒬` of probability measures on `Ω`,
  `X ↦ sSup {E_Q[−X] | Q ∈ 𝒬}` is a coherent risk measure (Artzner–Delbaen–Eber–Heath,
  Proposition 3.1, for a nonempty set of probability measures, and Proposition 4.1, the "if"
  part).

Route: for a coherent `ρ` the acceptance set is a cone (1.2), so `minimalPenalty ρ Q`, a
supremum of a linear function over a cone, is `0` or `+∞`; 2.1 then gives the first statement.
For the second, the set of values is nonempty and bounded by `max_ω |X(ω)|`; monotonicity, cash
invariance, homogeneity and subadditivity pass through the supremum.

- The set `{Q | minimalPenalty ρ Q ≤ 0}` is convex and closed in the simplex and is the largest
  set that represents `ρ`; it consists of the `Q` with `E_Q[−Y] ≤ ρ(Y)` for all `Y`, the set
  displayed in the proof of Artzner–Delbaen–Eber–Heath, Proposition 4.1.

**Checks.**
- The worst-case measure `−min X` is represented by all probability measures; it is not a
  function of the law under a `P` that charges a point with mass zero: with `P = (1, 0)`,
  `X = (0, −1)` and `Y = (0, 0)` agree `P`-almost surely, yet `ρ(X) = 1 ≠ 0 = ρ(Y)`. The axioms
  here use the pointwise order, under which this is allowed.
- Nonemptiness of `𝒬` is needed: for `𝒬 = ∅` the formula gives `sSup ∅ = 0` for every `X`, and
  `ρ(0 + 1) = 0 ≠ −1`.
- For `𝒬 = {Q | t·Q ≤ P}` the formula is Average Value at Risk (4.3).

*Needs:* 1.1, 1.2, 2.1; Mathlib `csSup_le`, `le_csSup`.

### 2.3 The entropic risk measure

Define `entropicRisk P β X = β⁻¹ log E_P[exp(−βX)]` for a probability measure `P`. Prove
`isConvex_entropicRisk_and_minimalPenalty_eq`: for `β > 0` the entropic risk measure is a convex
risk measure, and `β · minimalPenalty (entropicRisk P β) Q` is the relative entropy
`InformationTheory.klDiv Q P`, in `EReal`, for every probability measure `Q` (Föllmer–Schied,
(5.1) and the identification of its minimal penalty with `H(Q|P)/θ` on pp. 5–6, with `θ = β`).

Route: monotonicity and cash invariance are direct. By the first bullet of 2.1,
`β · minimalPenalty Q = sup_X (E_Q[−βX] − log E_P[exp(−βX)])`, and with `f = −βX` ranging over
all functions on `Ω`, which are bounded and measurable, this is Tau Ceti's Donsker–Varadhan
formula `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`, whose `ENNReal.ofReal` clips only
negative values while the supremum is at least `0` (take `f = 0`). Convexity: by
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`, `ρ(X) ≥ E_Q[−X] − klDiv Q P / β` for
every `Q`, with equality at the Gibbs measure `P.tilted (−βX)` by
`TauCeti.klDiv_tilted_neg_add_ofReal_neg_log` applied with `μ` that measure (shift `X` by a
constant so that `βX ≥ 0`, using cash invariance) and `InformationTheory.klDiv_self`; so `ρ` is a
supremum of affine functions of `X`.

**Checks.**
- On `P = (1/2, 3/10, 1/5, 0)` with `β ∈ {1/2, 1, 3}`, the position `X* = −β⁻¹ log(Q/P)` on the
  first three points gives `E_Q[−X*] − ρ(X*) = KL(Q‖P)/β` for `Q = (1/4, 1/4, 1/2, 0)` and
  `Q = P`, and no perturbation of `X*` by `±3/10` in any coordinate does better. For
  `Q = (1/10, 0, 9/10, 0)`, which vanishes at a point that `P` charges, the supremum is not
  attained: with `X*` on the support of `Q` and the value `c` at the second point, at `β = 1`
  the difference is `0.9304` for `c = 0` and `1.1907` for `c = 5`, increasing to
  `KL(Q‖P) = 1.1927` as `c → ∞`. For `Q = (1/2, 3/10, 1/10, 1/10)`, which charges the `P`-null
  point, `X = −c 1_ω` at that point gives `ρ(X) = 0` and `E_Q[−X] = c/10`, so the penalty and
  `klDiv Q P` are both `+∞`.
- `β > 0` is needed: for `β = 0` the definition gives `0⁻¹ · log 1 = 0` for every `X`, which is
  not cash invariant; for `β = −1` it is monotone and cash invariant but not convex: with
  `P = (1/2, 1/2)`, `ρ(0, 0) = 0`, `ρ(0, 2) = −log((1 + e²)/2) ≈ −1.4338` and
  `ρ(0, 1) = −log((1 + e)/2) ≈ −0.6201 > −0.7169`, the average.
- Finiteness is needed: on `ℕ` with `P{n} = 2^(−n−1)` and `X(n) = −n`, `exp(−X)` is not
  integrable, the Bochner integral is `0` and `log 0 = 0`, so `ρ(X) = 0 = ρ(X + 1)`.

*Needs:* 1.1, 2.1; Mathlib `InformationTheory.klDiv`, `MeasureTheory.Measure.tilted`,
`InformationTheory.klDiv_self`; Tau Ceti `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`,
`TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv`,
`TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`.

### Examples

The expectation, the worst-case measure and the entropic risk measure with their minimal
penalties; Average Value at Risk on a finite set as the supremum over `{Q | t·Q ≤ P}`.

### Dependencies

Layer 1; Mathlib `ProbabilityMeasure`, `DiscreteMeasurableSpace`,
`ConvexOn.exists_affine_le_of_lt`, `Convexity.StdSimplex`, `Convexity.StdSimplex.compactSpace`,
`UpperSemicontinuousOn.exists_isMaxOn`, `csSup_le`, `le_csSup`, `InformationTheory.klDiv`,
`InformationTheory.klDiv_self`, `MeasureTheory.Measure.tilted`; Tau Ceti
`TauCeti/InformationTheory/KullbackLeibler/Variational.lean` and `Tilted.lean`.

## Layer 3: Value at Risk

### 3.1 Definition and the monetary properties

Define `valueAtRisk μ t = −μ.upperQuantile t` for a law `μ` on `ℝ` (Artzner–Delbaen–Eber–Heath,
Definition 3.3, which uses the upper quantile; Acerbi–Tasche, Definitions 2.1 and 2.2, p. 3).
Prove `valueAtRisk_monotone_cash_homogeneous`: for a probability measure `P` on any measurable
space and `0 < t < 1`, on almost everywhere measurable positions, `X ≤ Y` almost surely implies
`VaR_t(Y) ≤ VaR_t(X)`, `VaR_t(X + m) = VaR_t(X) − m`, and `VaR_t(cX) = c VaR_t(X)` for `c ≥ 0`
(Artzner–Delbaen–Eber–Heath, the sentence after Definition 3.3; Föllmer–Schied, p. 3; proved
here).

- For `0 < t < 1`, `valueAtRisk (P.map X) t = inf {m | P[X + m < 0] ≤ t}`, the form of
  Föllmer–Schied, p. 3, by Tau Ceti's `MeasureTheory.Measure.le_upperQuantile_iff`.
- On a finite `Ω` with the discrete σ-algebra the three properties say that
  `X ↦ valueAtRisk (P.map X) t` is a monetary risk measure that is positively homogeneous.

Route: an almost sure inequality gives `P[Y < x] ≤ P[X < x]` for every `x`, and
`le_upperQuantile_iff` turns it into the comparison of upper quantiles. Cash invariance and
homogeneity for `c > 0` are Tau Ceti's `TauCeti.Probability.upperQuantile_map_affine_pos`; for
`c = 0` the law is `δ_0` and both sides are `0`.

**Checks.**
- The upper quantile is the right one: for `X = ±1` with probability `1/2` each and `t = 1/2`,
  `VaR = −1`, and `P[X − 1 < 0] = 1/2 ≤ 1/2` confirms the infimum form; the lower-quantile variant
  would give `+1`.
- The range of `t` is needed: for `t ≥ 1` the upper quantile is the junk value `0`, so
  `VaR_t ≡ 0` is not cash invariant. At `t = 0` the formula gives minus the least point of the
  support for a law with finite support, which is monetary, but for a normal law the set
  `{x | 0 < F(x)}` is all of `ℝ`, its `sInf` is `0`, and cash invariance fails.
- Measurability is needed: with the trivial σ-algebra on two points, `X = (0, 1)` is not
  measurable, `P.map X = 0`, the upper quantile of the zero measure at `t < 1` is `0`, and
  `VaR_t(X + m) = 0 ≠ −m`.

*Needs:* Tau Ceti `MeasureTheory.Measure.upperQuantile`,
`MeasureTheory.Measure.le_upperQuantile_iff`, `TauCeti.Probability.upperQuantile_map_affine_pos`;
Mathlib `Measure.map`, `ProbabilityTheory.cdf`.

### 3.2 Value at Risk is not subadditive

Prove `exists_valueAtRisk_add_gt`: for every `0 < t < 1` there are a probability measure `P` on
`Fin 2 × Fin 2` and positions `X`, `Y` with `VaR_t(X) + VaR_t(Y) < VaR_t(X + Y)`
(Artzner–Delbaen–Eber–Heath, §3.3, the examples after Definition 3.3, at fixed levels;
Föllmer–Schied, p. 3; the example below is derived here for every level).

Route: take `P` the product of two laws on `Fin 2` giving `1` the mass `t`, `X = −1` on
`{first coordinate 1}` and `0` elsewhere, and `Y` the same in the second coordinate. Then
`F_X(−1) = t`, not more than `t`, so the upper quantile of `X` at `t` is `0` and `VaR_t(X) = 0`;
likewise `VaR_t(Y) = 0`. For the sum, `F(−2) = t² < t < 2t − t² = F(−1)`, so the upper quantile
is `−1` and `VaR_t(X + Y) = 1`.

**Checks.**
- At `t = 1/4`: `F_{X+Y}(−2) = 1/16` and `F_{X+Y}(−1) = 7/16 > 1/4`, so `VaR(X + Y) = 1 > 0`.
- `t > 0` is needed: at `t = 0` on a finite space Value at Risk is minus the least value taken
  with positive probability, which is subadditive.
- `t < 1` is needed: for `t ≥ 1` Value at Risk is the junk value `0`.

*Needs:* 3.1; Mathlib `Measure.prod`, `Measure.dirac`.

### Examples

The two independent defaults of 3.2; the symmetric two-point law, which separates the upper and
the lower quantile.

### Dependencies

Tau Ceti `MeasureTheory.Measure.upperQuantile`, `MeasureTheory.Measure.le_upperQuantile_iff`,
`TauCeti.Probability.upperQuantile_map_affine_pos`; Mathlib `Measure.map`,
`ProbabilityTheory.cdf`, `Measure.prod`, `Measure.dirac`. No other layer.

## Layer 4: Average Value at Risk

### 4.1 Definition and the Rockafellar–Uryasev formula

Define `averageValueAtRisk μ t = t⁻¹ ∫_(0, t) valueAtRisk μ s ds` (Föllmer–Schied, (2.1), p. 3;
Acerbi–Tasche, Definition 2.6 and Proposition 3.2 with (3.3), pp. 5–6, where it is called
Expected Shortfall). Prove `isLeast_averageValueAtRisk`: for a probability measure `μ` on `ℝ`
with `x ↦ max(−x, 0)` integrable and `0 < t < 1`,

    averageValueAtRisk μ t = min_z (z + t⁻¹ ∫ max(−x − z, 0) dμ(x)),

the minimum being attained, and the set of minimizers is the interval from `valueAtRisk μ t` to
`−μ.quantile t` (Acerbi–Tasche, Definition 2.5, p. 4, Proposition 4.2 and Corollary 4.3, p. 10,
with `s = −z`; Rockafellar–Uryasev, Theorem 10, p. 14, in losses with `α = 1 − t`). Both
sources prove it for integrable laws, and Acerbi and Tasche remark after Corollary 4.3 that the
integrability of the negative part suffices for the value; the statement here assumes only that,
which is all the route below uses, so it is wider than the proved statements of the sources.

- The two quantiles differ at countably many levels only, so the integral is unchanged with the
  lower quantile; with Tau Ceti's inverse transform sampling this gives
  `averageValueAtRisk μ 1 = −∫ x dμ` for an integrable law (`setIntegral_quantile_eq_integral`).
- `valueAtRisk μ t ≤ averageValueAtRisk μ t`, since `s ↦ −q⁺(s)` is antitone
  (Rockafellar–Uryasev, Corollary 7, p. 12).

Route: `g(z) = z + t⁻¹ E[(−X − z)⁺]` is finite and convex, with right derivative
`1 − t⁻¹ P[X < −z]` and left derivative `1 − t⁻¹ P[X ≤ −z]`; it is minimal exactly where
`P[X < −z] ≤ t ≤ P[X ≤ −z]`, which by `le_upperQuantile_iff` and
`MeasureTheory.Measure.quantile_le_iff` is `−q⁺(t) ≤ z ≤ −q⁻(t)`. At `z = −q⁺(t)`, inverse
transform sampling (`MeasureTheory.Measure.map_quantile_volume_Ioo`) writes
`E[(q⁺(t) − X)⁺]` as an integral over levels, and `g(−q⁺(t))` reduces to the average of `−q⁺`
over `(0, t)`. Only the negative part enters: `max(−x − z, 0) ≤ max(−x, 0) + |z|`, so `g` is
finite, and on `(0, t)` the lower quantile is at most `q⁻(t)` while its negative part is
integrable over `(0, 1)` by inverse transform sampling, so the level integral is finite.

**Checks.**
- For `X = ±1` with probability `1/2` and `t = 1/2`: `averageValueAtRisk = 1`, `g(z) = 1` on
  `[−1, 1]` and larger outside, and the interval of minimizers is `[VaR, −q⁻] = [−1, 1]`.
- The level `t = 1` is excluded because the minimum need not be attained: for the exponential
  law with mean `1`, `g(z) = e^z − 1` for `z < 0` and `g(z) = z` for `z ≥ 0`, whose infimum
  `−1 = −E[X]` is not attained.
- `t > 0` is needed: at `t = 0` the definition gives `0⁻¹ · 0 = 0` and `g(z) = z` has no least
  value.
- The integrability is needed: if `E[max(−X, 0)] = ∞`, the Bochner integral of `max(−x − z, 0)`
  is the junk value `0`, `g(z) = z`, and there is no least value.
- Exact rational computation on all laws with at most four atoms in `{−3, −1, 0, 2, 5}` and
  weights in `{1, 2, 3}`, at the levels `i/12` and at every cumulative level, confirms the
  minimum, the interval of minimizers and `VaR ≤ AVaR` (9680 cases).

*Needs:* 3.1; Tau Ceti `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.quantile_le_iff`,
`MeasureTheory.Measure.le_upperQuantile_iff`, `MeasureTheory.Measure.map_quantile_volume_Ioo`,
`MeasureTheory.Measure.setIntegral_quantile_eq_integral`,
`MeasureTheory.Measure.quantile_le_upperQuantile`.

### 4.2 Average Value at Risk is coherent

Prove `averageValueAtRisk_coherent`: for a probability measure `P` on any measurable space and
`0 < t < 1`, on almost everywhere measurable positions with integrable negative part (for
monotonicity, that of the smaller position, which bounds that of the larger),
`AVaR_t(P.map X)` is antitone for almost sure order, cash invariant, positively homogeneous for
`c ≥ 0` and subadditive (Acerbi–Tasche, Proposition 3.1, p. 5, with its Appendix for
subadditivity; Rockafellar–Uryasev, Corollary 12, p. 18; Föllmer–Schied, p. 3).

- On a finite `Ω` with the discrete σ-algebra, `X ↦ averageValueAtRisk (P.map X) t` is a coherent
  risk measure in the sense of 1.1 for `0 < t ≤ 1`; at `t = 1` it is `E_P[−X]`.

Route: monotonicity and the affine rules come from 3.1 integrated over the levels. Subadditivity
from 4.1: if `z₁` and `z₂` attain the minimum for `X` and `Y`, then
`(−X − Y − z₁ − z₂)⁺ ≤ (−X − z₁)⁺ + (−Y − z₂)⁺`, so the objective for `X + Y` at `z₁ + z₂` is at
most the sum.

**Checks.**
- Exact rational computation of `AVaR_t(X + Y) ≤ AVaR_t(X) + AVaR_t(Y)` for all positions with
  values in `{−2, 0, 1}` and `{−1, 0, 2}` on a three-point space with `P = (1/6, 1/3, 1/2)` and
  `t ∈ {1/6, 1/4, 1/2, 2/3}` (2916 cases).
- The integrability is needed: on `ℕ` with `P{n} = 2^(−n−1)` and `X(n) = −4^n`, the levels below
  `t` are not integrable against `−q⁺`, so the integral is the junk value `0` for `X` and for
  `X + 1`, and cash invariance fails.
- `t < 1` is needed under this integrability: for `X ≥ 0` with `E[X] = ∞`, the average over
  `(0, 1)` is not integrable, so `AVaR_1(X) = 0 = AVaR_1(X + 1)`. `t > 0` is needed since
  `AVaR_0 ≡ 0`. Measurability is needed as in 3.1, since `P.map X = 0` gives `AVaR_t = 0`.

*Needs:* 3.1, 4.1.

### 4.3 The dual representation

Prove `isGreatest_integral_averageValueAtRisk`: for a probability measure `P` on any measurable
space, an integrable position `X` and `0 < t ≤ 1`, `averageValueAtRisk (P.map X) t` is the
greatest value of `E_Q[−X]` over the probability measures `Q` with `t·Q ≤ P`
(Föllmer–Schied, (5.5), p. 6, for bounded positions; proved here).

Route: for such `Q`, `E_Q[−X] = z + E_Q[−X − z] ≤ z + t⁻¹ E_P[(−X − z)⁺]` for every `z`, and 4.1
gives the bound for `t < 1`; for `t = 1`, `Q = P`. Equality holds at the `Q` with density
`t⁻¹(1_{X < q} + κ 1_{X = q})` with respect to `P`, where `q = q⁺(t)` and
`κ = (t − P[X < q]) / P[X = q]` when `P[X = q] > 0`, `κ = 0` otherwise.

- On a finite `Ω`, 2.2 applies, and the set `{Q | t·Q ≤ P}` is the set of zero minimal penalty.

**Checks.**
- Exact computation on a three-point space, for every position with values in `{−2, −1, 0, 3}`,
  for `P ∈ {(1/3, 1/3, 1/3), (1/3, 2/3, 0), (0, 1/4, 3/4), (1/5, 3/10, 1/2)}` and
  `t ∈ {1/7, 1/3, 1/2, 5/6, 1}`, compares the greedy maximizer over `t·Q ≤ P`, which fills the
  worst outcomes first, with Average Value at Risk (1280 cases, null atoms of `P` included).
- `t ≤ 1` is needed: for `t > 1` no probability measure has `t·Q ≤ P`, and a greatest element of
  the empty set does not exist. `t > 0` is needed: at `t = 0` every `Q` qualifies, while
  `averageValueAtRisk = 0`; for `X = 1` every `Q` gives `−1`.
- Integrability is needed: on `ℕ` with `P{n}` proportional to `n^(−2)` for `n ≥ 1` and `X(n) = n`,
  `E_P[X] = ∞`; `Q = P` qualifies at `t = 1/2`, its Bochner integral is the junk value `0`, and
  `0` exceeds `AVaR_(1/2)(X) ≤ −1`.

*Needs:* 4.1; Mathlib `ProbabilityMeasure`, `Measure.withDensity`.

### Examples

The symmetric two-point law and the exponential law of 4.1; the greedy maximizer of 4.3 on a
three-point space.

### Dependencies

Layer 3; Tau Ceti `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.quantile_le_iff`,
`MeasureTheory.Measure.le_upperQuantile_iff`, `MeasureTheory.Measure.map_quantile_volume_Ioo`,
`MeasureTheory.Measure.setIntegral_quantile_eq_integral`,
`MeasureTheory.Measure.quantile_le_upperQuantile`; Mathlib `ProbabilityMeasure`,
`Measure.withDensity`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the axioms of monetary, convex and
coherent risk measures, acceptance sets and the risk measure of an acceptance set, the minimal
penalty and the dual representations on a finite set, the entropic risk measure with its
penalty, Value at Risk as a risk measure and its failure of subadditivity, and Average Value at
Risk with the Rockafellar–Uryasev formula, its coherence and its dual representation.

Already in the libraries and therefore not targets:

- the lower and upper quantile functions of a real law, their Galois characterizations, their
  behaviour under affine maps and inverse transform sampling (Tau Ceti
  `TauCeti/Probability/Quantile.lean` and `TauCeti/Probability/Distributions/Affine.lean`);
- the relative entropy, its Donsker–Varadhan variational formula and the change of reference to
  a Gibbs measure (Mathlib `InformationTheory.klDiv`; Tau Ceti
  `TauCeti/InformationTheory/KullbackLeibler/`);
- convex functions, the affine-minorant theorem, separation and the standard simplex (Mathlib);
  the Fenchel conjugate and the Fenchel–Moreau theorem for a pairing that represents every
  continuous linear functional (Tau Ceti `TauCeti/Analysis/Convex/Conjugate.lean`,
  `TauCeti.fenchelConjugate`, and `TauCeti/Analysis/Convex/FenchelMoreau.lean`,
  `TauCeti.fenchelConjugate_flip_fenchelConjugate_eq`). Read through the identification of the
  conjugate of a convex risk measure with its minimal penalty (2.1), Fenchel–Moreau gives the
  representation of 2.1 as a supremum; what 2.1 adds is that identification and the attainment.

Boundaries with other roadmaps:

- StandardDistributions, §7.2, owns the lower and upper quantiles and their images under affine
  maps, which Tau Ceti's `TauCeti/Probability/Quantile.lean` and
  `TauCeti/Probability/Distributions/Affine.lean` provide (`upperQuantile_map_affine_pos`, for a
  positive slope). Value at Risk is built on them, and the cash invariance and homogeneity in 3.1
  are those affine images read through `valueAtRisk`; they are used, not restated.
- StandardDistributions, §7.13, owns the scalar stochastic order of real laws, including the
  fact that an almost surely ordered coupling gives the inequality of distribution functions.
  The monotonicity of 3.1 and 4.2 is that fact for two positions on one space, read through the
  upper quantile; it is proved here from Tau Ceti's `le_upperQuantile_iff`, and no order between
  laws is stated. MeansMajorizationAndDiscreteInequalities, Layer 6, owns
  the convex order on the line through stop-loss transforms; the stop-loss integrals of 4.1 are
  used here only inside the Rockafellar–Uryasev objective, and no order between laws is stated.
- ConvexAnalysisAndDuality states in §2.1 the conjugacy of indicator and support functions on a
  real Hilbert space, and in §3.2 the max formula: on a real normed space, for a convex function
  finite and continuous at a point, the directional derivative there in a direction `d` is the
  greatest value at `d` of its subgradients there. A coherent risk measure is continuous (1.1),
  is its own directional derivative at `0`, and its subgradients at `0` are the maps
  `X ↦ E_Q[−X]` with `minimalPenalty ρ Q ≤ 0` (by monotonicity and cash invariance), so the max
  formula at `0` gives 2.2. The representations of Layer 2 are proved here directly from
  Mathlib's affine-minorant theorem on the finite-dimensional space of positions, and this
  roadmap does not depend on that one.
- NoncommutativeIntegration, §1.4, states for a semifinite von Neumann algebra the integrated
  Ky Fan inequality for `Φ_t(x) = ∫₀ᵗ μ_s(x) ds` and, without minimal projections, the formula
  of `Φ_t(x)` as a supremum over projections of trace at most `t`. On `L∞` of a probability
  space with the trace `E_P` and for a bounded position `X ≤ 0`, both `μ_s(X)` and
  `valueAtRisk (P.map X) s` are `inf {λ | P[−X > λ] ≤ s}` for `0 < s < 1`, atoms included, so
  `Φ_t(X) = t · AVaR_t(X)` for `0 < t < 1`. There the Ky Fan inequality is the subadditivity of
  4.2 for bounded `X, Y ≤ 0`, and on an atomless space the projection formula says that
  `AVaR_t(X)` is the supremum of `E_Q[−X]` over the `Q = t⁻¹ 1_A P` with `P(A) = t`, the
  indicator densities of 4.3. The statements here are for signed positions, any probability
  space and all densities, and are proved from Layer 3 and 4.1 without that roadmap.
- UtilityRepresentationTheorems 4.1 defines certainty equivalents, `IsCertaintyEquivalent D u μ c`:
  `c ∈ D` and `u c = ∫ x, u x ∂μ`. For a probability measure `P` on a finite `Ω`, `β > 0` and
  every position `X`, `IsCertaintyEquivalent Set.univ (fun x => -Real.exp (-(β * x))) (P.map X) c`
  holds exactly for `c = -entropicRisk P β X`, since `∫ exp(−βX) dP > 0`: the entropic risk
  measure of 2.3 is minus the certainty equivalent of the law of `X` for the exponential utility
  `x ↦ −exp(−βx)` on ℝ, which is unique as that utility is strictly increasing. Nothing of that
  roadmap is used.
- DiscreteTimeFinance 3.2, `superhedging_duality`, states that on a finite `Ω` with measurable
  singletons, for a probability measure `P` and adapted discounted prices without arbitrage up to
  a horizon, the least superhedging price of a claim is the greatest of its means over the
  martingale measures `Q ≪ P`, and only the least upper bound of its means over the equivalent
  ones. For the claim `−X` this is the greatest value of `E_Q[−X]` over a nonempty set of
  probability measures, so by `isCoherent_sSup_integral` (2.2) the map sending a position `X` to
  the least superhedging price of `−X` is a coherent risk measure. Neither roadmap uses the other.
- Expected-utility comparisons, stochastic dominance, trading strategies and the pricing of
  claims are not treated here; neither are risk measures on infinite spaces of positions (bounded
  measurable functions, `L^p`), law-invariant and spectral risk measures, and conditional or
  dynamic risk measures.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Monotone/Defs.lean`: `Antitone`. `Mathlib/Analysis/Convex/Function.lean`:
  `ConvexOn`, `ConvexOn.convex_le` (sublevel sets of a convex function are convex).
- `Mathlib/Analysis/Convex/Approximation.lean`: `ConvexOn.exists_affine_le_of_lt` (for `φ`
  convex and lower semicontinuous on a closed convex set `s` in a locally convex space, `x ∈ s`
  and `a < φ x`, a continuous affine function below `φ` on `s` takes the value `a` at `x`).
- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex` (probability weights
  on a type); `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`: the instance
  `Convexity.StdSimplex.compactSpace` (compact for a finite type).
  `Mathlib/Topology/Semicontinuity/Basic.lean`: `UpperSemicontinuousOn.exists_isMaxOn` (an
  upper semicontinuous function on a nonempty compact set attains its maximum).
- `Mathlib/Order/ConditionallyCompleteLattice/`: `csInf_le`, `le_csInf`, `csSup_le`, `le_csSup`.
  `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean`: `Real.sInf_empty` (`sInf ∅ = 0`).
  `closure` (the product topology on `Ω → ℝ`).
- `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`: `ProbabilityMeasure`.
  `Mathlib/MeasureTheory/MeasurableSpace/Defs.lean`: `DiscreteMeasurableSpace`. `Measure.map`,
  `Measure.prod`, `Measure.dirac`, `Measure.withDensity`;
  `Mathlib/MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted`.
- `Mathlib/Probability/CDF.lean`: `ProbabilityTheory.cdf` (for a probability measure on `ℝ`,
  `x ↦ μ (Iic x)`).
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv` (in
  `ENNReal`, `+∞` unless `Q ≪ P` with integrable log-likelihood ratio),
  `InformationTheory.klDiv_self`.

### From Tau Ceti

- `TauCeti/Probability/Quantile.lean`: `MeasureTheory.Measure.quantile` and
  `MeasureTheory.Measure.upperQuantile` (the conventions above);
  `MeasureTheory.Measure.quantile_le_iff` (for `0 < t < 1`, `q⁻(t) ≤ x ↔ t ≤ F(x)`);
  `MeasureTheory.Measure.le_upperQuantile_iff` (for a probability measure and `0 < t < 1`,
  `x ≤ q⁺(t) ↔ μ(Iio x) ≤ t`); `MeasureTheory.Measure.quantile_le_upperQuantile`;
  `MeasureTheory.Measure.map_quantile_volume_Ioo` (the lower quantile pushes the uniform law on
  `(0, 1)` forward to `μ`); `MeasureTheory.Measure.setIntegral_quantile_eq_integral` (the
  average of the lower quantile over `(0, 1)` is the mean).
- `TauCeti/Probability/Distributions/Affine.lean`:
  `TauCeti.Probability.upperQuantile_map_affine_pos` (for a probability measure, `b > 0` and
  `0 < u < 1`, the upper quantile of the image under `x ↦ a + b x` is `a + b q⁺(u)`).
- `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`:
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp` (for probability measures,
  `klDiv μ ν` is the supremum over bounded measurable `f` of
  `ENNReal.ofReal (∫ f dμ − log ∫ exp f dν)`) and
  `TauCeti.ofReal_integral_sub_log_integral_exp_le_klDiv` (each such term is at most `klDiv μ ν`,
  for `f` integrable under `μ` with `exp ∘ f` integrable under `ν`).
- `TauCeti/InformationTheory/KullbackLeibler/Tilted.lean`:
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log` (for probability measures and an almost
  everywhere measurable `f ≥ 0`,
  `klDiv μ (ν.tilted (−f)) + ofReal(−log ∫ exp(−f) dν) = ∫⁻ ofReal f dμ + klDiv μ ν`).

## References

- Hans Föllmer and Alexander Schied, *Convex and coherent risk measures*, survey of October 8,
  2008, from the first author's page at Humboldt-Universität zu Berlin. Definitions 2.1–2.3,
  equations (2.1), (3.1)–(3.5), (4.1)–(4.3), (4.6), (5.1), (5.5) and (5.6), with the page numbers
  of that version. Its (5.5) is printed as an infimum of `E_Q[X]`; with (2.1) and (5.6) the
  intended value is the supremum of `E_Q[−X]`, which is what 4.3 states.
- Philippe Artzner, Freddy Delbaen, Jean-Marc Eber and David Heath, *Coherent measures of risk*,
  preprint of July 22, 1998, from the second author's page at ETH Zürich (published in
  Mathematical Finance 9, 1999). Axioms T, S, PH, M, Definitions 2.4 and 3.3, Propositions 2.1,
  2.2 and 4.1, and the examples of §3.3, with the numbering of that preprint.
- Carlo Acerbi and Dirk Tasche, *On the coherence of Expected Shortfall*, arXiv:cond-mat/0104295,
  version 5 (May 2, 2002). Definitions 2.1, 2.2, 2.5 and 2.6, Propositions 3.1, 3.2 and 4.2,
  Corollary 4.3 and the remark after it, with the page numbers of that version.
- R. Tyrrell Rockafellar and Stanislav Uryasev, *Conditional value-at-risk for general loss
  distributions*, version of November 28, 2001, from the first author's page at the University of
  Washington. Theorem 10, Corollaries 7 and 12, with the page numbers of that version.
- Attributions in prose without a locator, as Föllmer and Schied report them in the survey: the
  extension of the axioms from coherent to convex risk measures to Heath, to Föllmer and Schied,
  and to Frittelli and Rosazza Gianin (§2), and the dual representation theory to a line of work
  that includes these authors, Artzner–Delbaen–Eber–Heath, Huber, and Gilboa and Schmeidler (§4).
- Prior formalization, not a supplier: R. Coelho, *formal-mathfin* (Lean 4, Apache 2.0),
  release v1.11.0 of November 2026, states in the loss convention the representation of a
  coherent risk measure on a finite state space as a least upper bound of expected losses, the
  Rockafellar–Uryasev minimum and the coherence of expected shortfall for integrable losses, its
  dual over bounded densities, and the failure of subadditivity of Value at Risk for independent
  defaults and for a Pareto law. The statements here are in the positions convention, with
  pointwise axioms, attained maxima, the minimal penalty, the interval of minimizers and
  integrability of the negative part only.
