# Roadmap: Blahut–Arimoto iteration and alternating minimization of divergence

**Summary.** This roadmap treats the geometry of the Kullback–Leibler divergence on a finite
alphabet and two classical iterations built on it, as theorems on sequences of vectors:
alternating minimization of the divergence between two convex sets (Csiszár and Tusnády) and the
Blahut–Arimoto sequence for the capacity of a finite channel. Divergences take values in `[0, ∞]`,
logarithms are natural, and a channel is a matrix `W` whose rows `W_a` are probability vectors.

The headline theorems are these.

- *Pythagorean inequality.* If `p'` minimizes `D(· ‖ Q)` on a convex set `S` of nonnegative vectors,
  then `D(p ‖ p') + D(p' ‖ Q) ≤ D(p ‖ Q)` for every `p ∈ S`. On a nonempty linear family, for `Q`
  with positive entries, some member gives equality for every member, and it lies in the exponential
  family through `Q` if the family contains a positive vector.
- *Alternating minimization.* For convex sets `P`, `Q` of nonnegative vectors, if `pₙ` minimizes
  `D(· ‖ qₙ)` on `P` and `qₙ₊₁` minimizes `D(pₙ ‖ ·)` on `Q`, then `D(pₙ ‖ qₙ)` decreases, and
  `n D(pₙ ‖ qₙ) ≤ n D(x ‖ y) + D(x ‖ p₀)` for all `x ∈ P`, `y ∈ Q` when `D(p₀ ‖ q₀)` is finite. If
  `q₀` charges every letter that some member of `Q` charges, `D(pₙ ‖ qₙ)` tends to the infimum of
  `D` on `P × Q`.
- *Capacity.* For a channel on a nonempty input alphabet, the capacity `C` is the least value of
  `max_a D(W_a ‖ Q)` over probability vectors `Q` on the outputs, attained only at the output law of
  an optimal input; an input law `p` is optimal exactly when `D(W_a ‖ pW)` is constant on the inputs
  `p` charges and no larger elsewhere, and the constant is then `C`.
- *Blahut–Arimoto.* The update `p ↦ p_a exp D(W_a ‖ pW) / Z` never decreases the mutual information.
  From an input law `p₀`, `C − I(pₙ, W) ≤ D(p' ‖ p₀)/n` for every optimal `p'` charging only inputs
  that `p₀` charges (at most `log |A| / n` from the uniform law); from `p₀` with positive entries,
  `I(pₙ, W)` and `max_a D(W_a ‖ pₙW)` both tend to `C`, and `pₙ` converges to an optimal input law.

It uses ChannelCoding's channels, mutual information and capacity unchanged and Mathlib's divergence
of measures; Tau Ceti's Csiszár identity and marginal projections are the general-measure neighbours
of Layer 1. Below, Layer 1 proves the projection theorems, Layer 2 alternating minimization, Layer 3
the capacity theorems (without Layer 2) and Layer 4 the Blahut–Arimoto theorems.

## Conventions

- **Vectors as measures.** A vector `p : α → ℝ` on a finite type (with measurable singletons) is
  read as the measure `vecMeasure p`, with mass `max (p a) 0` at `a`, and `D(p ‖ q) = klDivVec p q`
  is Mathlib's `InformationTheory.klDiv` of the two measures, in `ℝ≥0∞`. If `q a ≤ 0` forces
  `p a ≤ 0`, it is `∑ p a log (p a / q a) + ∑ q⁺ − ∑ p⁺` over the letters `p` charges, otherwise
  `∞`; the correction vanishes for probability vectors.
- **Probability vectors** have nonnegative entries summing to `1`, written out as
  `{p | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1}`; "`q` charges `a`" means `q a > 0`. 3.3 assumes a nonempty
  input alphabet.
- **Nonnegative vectors.** Layers 1 and 2 work with nonnegative vectors, that is with finite
  measures on the alphabet, as Csiszár–Shields do for alternating minimization (p. 466); the
  divergence then carries Mathlib's mass correction. A single reference vector (`Q` in 1.1 and 3.1,
  `P` in 1.3) is taken nonnegative, the natural domain, since `vecMeasure` reads a negative entry as
  `0`. For sets of vectors nonnegativity is a genuine hypothesis: the mixture of two vectors is not
  read as the mixture of their measures when an entry is negative, and the Checks of 1.1, 1.3 and
  2.2 show that each theorem fails without it.
- **Channels.** A channel is `W : A → B → ℝ` with `IsChannel W`, an input law `p` a probability
  vector on `A`, `pW = outputLaw p W` its output law, `I(p, W) = channelMutualInformation p W` and
  `C = channelCapacity W`, all copied verbatim from ChannelCoding 1.1 and 1.3 (3.0 below). The
  Checks use the identity channel on two letters and the three-input channel with rows `(1, 0)`,
  `(1/2, 1/2)`, `(0, 1)`.
- **Non-channels.** Every theorem of Layers 3 and 4 assumes `IsChannel W`, and `W = 2 · identity` on
  two letters shows it is needed in each. For it `I(p, W) = 2 H(p) − 2 log 2`, so `C = 0`; at
  `p = Q = (1/2, 1/2)` the sides of 3.1 are `4 log 2 − 1` and `2 log 2 − 1`, and
  `D(W_a ‖ pW) = 2 log 2 ≠ C` (3.2); `max_a D(W_a ‖ Q) ≥ 4 log 2 − 1 > C` for every `Q` (3.3);
  `log Z = log 4 > 0 = I` at the updated uniform law (4.1); from `(1/3, 2/3)` the update alternates
  between `(1/3, 2/3)` and `(2/3, 1/3)` with constant `I < 0`, so 4.3 fails and 4.2 fails at `n = 1`
  for `p' = (1/2, 1/2)`, whose sum is `(1/2) log (9/8)`.

## Layer 1: divergence projections on a finite alphabet

### 1.0 Vectors as measures

Define `vecMeasure p = ∑ a, ofReal (p a) • dirac a` and
`klDivVec p q = klDiv (vecMeasure p) (vecMeasure q)`. The finite formula of the Conventions follows
from Mathlib `InformationTheory.klDiv_of_ac_of_integrable`, `MeasureTheory.integral_fintype` and Tau
Ceti `MeasureTheory.Measure.llr_eq_log_real_div_real_singleton`; when `q` is positive everywhere it
is Tau Ceti `TauCeti.klDiv_eq_ofReal_sum_log_singleton`.

**Checks.**
- `D(δ₁ ‖ (1, 0)) = 0` and `D((1/2, 1/2) ‖ (1, 0)) = ∞`: a definition by the finite sum with
  Mathlib's `log 0 = 0` would give the finite value `(1/2) log (1/2) < 0` instead of `∞`.

### 1.1 I-projections onto convex sets

Prove `klDivVec_add_klDivVec_le`: let `S` be a convex set of nonnegative vectors and `Q` a
nonnegative vector.
If `p' ∈ S` minimizes `D(· ‖ Q)` on `S`, then

    D(p ‖ p') + D(p' ‖ Q) ≤ D(p ‖ Q)  for every p ∈ S,

and every letter charged by some `p ∈ S` with `D(p ‖ Q) < ∞` is charged by `p'`. If `S` is also
closed and nonempty, a minimizer exists (Csiszár–Shields, Theorem 3.1, p. 440, for probability
distributions, `Q` with positive entries and `S` closed; the extension to measures is indicated on
p. 466; the general case is proved here).

Route. If `D(· ‖ Q) = ∞` on `S`, both claims are trivial. Otherwise `D(p' ‖ Q) < ∞`, and only `p`
with `D(p ‖ Q) < ∞` need treatment; such `p` and `p'` vanish off `T = {a | Q a > 0}`. For
`t ∈ [0, 1]` put `pₜ = (1 − t) p' + t p ∈ S`; by the finite formula, `f(t) = D(pₜ ‖ Q)` is
`∑_{a ∈ T} pₜ a log (pₜ a / Q a)` plus the mass term `∑ Q − ∑ pₜ`, which is affine in `t`, a convex
function with its minimum at `0`. If `p a > 0 = p' a` for some `a`, the right derivative of `f` at
`0` is `−∞`, a contradiction; this is the support claim. Otherwise the right derivative is
`∑ a, (p a − p' a) log (p' a / Q a) ≥ 0` (the derivative of the mass term cancels the linear part
of the derivative of `x log x`), and this sum is exactly `D(p ‖ Q) − D(p ‖ p') − D(p' ‖ Q)` (the
mass terms cancel). Existence: `D(· ‖ Q)` is lower semicontinuous on nonnegative vectors (its terms
are continuous by `Real.continuous_mul_log` and `{D = ∞}` is open). If it is `∞` on `S`, every
point minimizes. Otherwise, for some `p₁ ∈ S` with finite value, the sublevel set
`{p ∈ S | D(p ‖ Q) ≤ D(p₁ ‖ Q)}` is closed, and bounded because
`D(p ‖ Q) ≥ m log (m / M) + M − m` with `m = ∑ p`, `M = ∑ Q` (the log-sum inequality, from the
convexity of `x log x`, Mathlib `Real.strictConvexOn_mul_log`; if `M = 0` the set is `{0}`); so it
is compact (Mathlib `Metric.isCompact_of_isClosed_isBounded`), and
`LowerSemicontinuousOn.exists_isMinOn` gives a minimizer on it, which minimizes on `S`.

**Checks.**
- Convexity is needed: on `S = {δ₁, δ₂}` with `Q = (1/2, 1/2)` both points minimize, with value
  `log 2`, but `D(δ₂ ‖ δ₁) = ∞`, so both claims fail at `p' = δ₁`.
- Closedness is needed for existence: on `S = {(t, 1 − t) | 0 ≤ t < 1/2}` the infimum `0` of
  `D(· ‖ (1/2, 1/2))` is not attained.
- The finiteness clause is needed: for `Q = (1, 0)` and `S` all laws on two letters, the minimizer
  is `δ₁` (value `0`), while `(1/2, 1/2)` charges the second letter.
- Nonnegative entries are needed: let `S` be the segment from `(−1/2, 1)` to `(1/2, 0)` and
  `Q = (1/2, 1/2)`. Its members with nonnegative entries are `(s, 1/2 − s)`, `0 ≤ s ≤ 1/2`, and the
  others are read as `(0, m)` with `1/2 < m ≤ 1`, of divergence at least `1/2`; so the minimizer is
  `p' = (1/4, 1/4)`, with value `(1 − log 2)/2`. At `p = (−1/2, 1)` the inequality would say
  `(2 log 2 − 1/2) + (1 − log 2)/2 = (3/2) log 2 ≤ log 2`.

*Needs:* 1.0; Mathlib `Metric.isCompact_of_isClosed_isBounded`, `Real.continuous_mul_log`,
`Real.strictConvexOn_mul_log`, `LowerSemicontinuousOn.exists_isMinOn`. (Proved here for
nonnegative vectors.)

### 1.2 Linear families

Prove `exists_klDivVec_eq_add_linearFamily`: let `Q` have positive entries, `f : ι → α → ℝ` a finite
family of functions and `c : ι → ℝ`, and suppose the linear family `L` of probability vectors `p`
with `∑ a, p a f i a = c i` for all `i` is nonempty. Some `p' ∈ L` satisfies the Pythagorean
identity `D(p ‖ Q) = D(p ‖ p') + D(p' ‖ Q)` for every `p ∈ L`; if `L` contains a vector with
positive entries, then `p' a = C · Q a · exp (∑ i, θ i f i a)` for some `θ` and `C`
(Csiszár–Shields, Theorem 3.2, p. 442).

Route. By 1.1 (`L` is closed, convex and nonempty) a minimizer `p'` exists and charges every letter
some member of `L` charges. For `p ∈ L`, `pₜ = (1 − t) p' + t p` stays in `L` for `t` in an interval
around `0` (the constraints are affine and `p` vanishes where `p'` does), so the derivative of 1.1's
route vanishes: `∑ a, (p a − p' a) log (p' a / Q a) = 0`, which is the identity. If `p'` has
positive entries, the vector `g = log (p' / Q)` is orthogonal to every difference `p − p'` with
`p ∈ L`, and these differences span the space of `v` with `∑ v = 0` and `∑ v f i = 0` for all `i`.
Hence `g` lies in the span of the constant `1` and the `f i` (double orthogonal complement, Mathlib
`Submodule.orthogonal_orthogonal` in `EuclideanSpace ℝ α`), which is the exponential form with
`C = exp θ₀`.

**Checks.**
- On three letters with `Q` uniform and the constraint `∑ a, a p a = 5/2`: `p' ∝ (1, r, r²)` with
  `r = (1 + √13)/2`, the positive root of `r² − r − 3 = 0`, and the identity holds at the members
  `(0, 1/2, 1/2)`, `(1/4, 0, 3/4)` and `(1/6, 1/6, 2/3)`.
- Positivity of `Q` is needed for the exponential form: with `Q = (1, 0)` and the constraint
  `p 2 = 1/2`, `L = {(1/2, 1/2)}` contains a positive vector, but `C · Q · exp(…)` vanishes at the
  second letter.

*Needs:* 1.1; Mathlib `Submodule.orthogonal_orthogonal`.

### 1.3 Reverse I-projections

Prove `forall_klDivVec_le_iff`: let `S` be a convex set of nonnegative vectors, `P` a nonnegative
vector with `D(P ‖ q) < ∞` for some `q ∈ S`, and `q' ∈ S`. Then `q'` minimizes `D(P ‖ ·)` on `S`
if and only if

    D(P' ‖ q') ≤ D(P' ‖ q) + D(P' ‖ P)  for every nonnegative vector P' and every q ∈ S

(Csiszár–Shields, Theorem 3.4, p. 445, there for probability distributions and closed `S`, where
closedness serves only the existence of a minimizer, which is not claimed here; the extension to
measures is indicated on p. 466).

Route. "If": take `P' = P`. "Only if": `D(P ‖ q') < ∞`, so `q'` charges every letter `P` charges.
For `q ∈ S` and small `t > 0`, `qₜ = (1 − t) q' + t q ∈ S`, and the right derivative at `0` of
`t ↦ D(P ‖ qₜ) = const − ∑ P a log qₜ a + ∑ qₜ` gives
`∑_{P a > 0} P a q a / q' a ≤ ∑ P + ∑ q − ∑ q'`. Given `P'` and `q` with finite right side, `P'`
charges only letters charged by `q` and `P`, hence by `q'`, and
`D(P' ‖ q) + D(P' ‖ P) − D(P' ‖ q') = ∑ P' a log (P' a q' a / (P a q a)) + ∑ q + ∑ P − ∑ q' − ∑ P'`.
By `x log (x / r) ≥ x − r` for `x, r > 0` (Mathlib `Real.log_le_sub_one_of_pos`) with
`r = P a q a / q' a`, this is at least `∑ q + ∑ P − ∑ q' − ∑_{P a > 0} P a q a / q' a ≥ 0`.

**Checks.**
- Nonnegative entries in `S` are needed: for `P = (1/2, 1/2)` and `S` the segment of 1.1's Check,
  from `(−1/2, 1)` to `(1/2, 0)`, the members read as `(0, m)` have divergence `∞`, so the minimizer
  is `q' = (1/4, 1/4)`; at `P' = δ₂` and `q = (−1/2, 1)`, read as `δ₂`, the inequality would say
  `2 log 2 − 1/2 ≤ 0 + log 2`.
- Convexity is needed: for `P = (1/2, 1/2)` and `S = {(2/5, 3/5), (19/20, 1/20)}` the first point
  minimizes, but at `P' = q = (19/20, 1/20)` the inequality would say
  `D(q ‖ (2/5, 3/5)) ≤ D(q ‖ P)`, which is false.
- The finiteness hypothesis is needed: for `P = (1/2, 1/2, 0)` and `S` the segment from `δ₃` to
  `δ₂`, every `q ∈ S` has `D(P ‖ q) = ∞`, so `q' = δ₃` minimizes, but `P' = δ₂`, `q = δ₂` give
  `∞ ≤ 0 + log 2`.

*Needs:* 1.0; Mathlib `Real.log_le_sub_one_of_pos`.

### Examples

1.1 and 1.3 are the three- and four-point properties of Csiszár and Tusnády with `δ = D`
(Csiszár–Shields, Theorem 5.3, p. 464; on nonnegative vectors Mathlib's divergence with its mass
correction is the function `δ` of p. 466), the form Layer 2 uses.

### Dependencies

1.1 needs 1.0; 1.2 needs 1.1; 1.3 needs 1.0. External: Mathlib and Tau Ceti as listed above.

## Layer 2: alternating minimization of divergence

Throughout, `P` and `Q` are convex sets of nonnegative vectors, and for every `n`, `pₙ ∈ P`
minimizes `D(· ‖ qₙ)` on `P` and `qₙ₊₁ ∈ Q` minimizes `D(pₙ ‖ ·)` on `Q`.

### 2.1 The telescoping bound

Prove `antitone_and_mul_klDivVec_le`: if `D(p₀ ‖ q₀) < ∞`, then `D(pₙ ‖ qₙ)` is nonincreasing, and
for all `x ∈ P`, `y ∈ Q` and `n`,

    n · D(pₙ ‖ qₙ) ≤ n · D(x ‖ y) + D(x ‖ p₀)

in `[0, ∞]` (Csiszár–Shields, Theorem 5.3, p. 464, and its proof, inequality (5.8), p. 465, there
with abstract three- and four-point properties).

Route. `D(pₙ₊₁ ‖ qₙ₊₁) ≤ D(pₙ ‖ qₙ₊₁) ≤ D(pₙ ‖ qₙ)` by minimality, so all these values are finite.
For each `k`, 1.1 at `qₖ₊₁` gives `D(x ‖ pₖ₊₁) + D(pₖ₊₁ ‖ qₖ₊₁) ≤ D(x ‖ qₖ₊₁)`, and 1.3 with
`P := pₖ` (finite at `qₖ₊₁`), `P' := x` and `q := y` gives `D(x ‖ qₖ₊₁) ≤ D(x ‖ y) + D(x ‖ pₖ)`. By
induction on `n`, without subtraction in `[0, ∞]`,
`∑_{k=1}^{n} D(pₖ ‖ qₖ) + D(x ‖ pₙ) ≤ n D(x ‖ y) + D(x ‖ p₀)`; by monotonicity the sum is at least
`n D(pₙ ‖ qₙ)`.

**Checks.**
- Convexity of `P` is needed: `P = {(3/4, 1/4), δ₁}`, `Q = {(s, 1 − s) | 9/10 ≤ s ≤ 1}` and
  `q₀ = (9/10, 1/10)` give `pₙ = (3/4, 1/4)`, `qₙ = q₀`, and at `x = y = δ₁`, `n = 4` the bound says
  `log (625/432) ≤ log (4/3)`.
- Convexity of `Q` is needed: `P = {(t, 1 − t) | 0 ≤ t ≤ 1/10}`, `Q = {δ₂, (9/10, 1/10)}` and
  `q₀ = (9/10, 1/10)` give `pₙ = (1/10, 9/10)`, `qₙ = q₀`, and at `x = y = δ₂`, `n = 1` the bound
  would say `(4/5) log 9 ≤ log (10/9)`.
- Finiteness of `D(p₀ ‖ q₀)` is needed: on three letters let `P` be the segment from `(1/2, 1/2, 0)`
  to `δ₂` and `Q` the segment from `δ₃` to `(0, 1/2, 1/2)`. Every value at `q₀ = δ₃` and at
  `p₀ = (1/2, 1/2, 0)` is `∞`, so `pₙ = p₀`, `qₙ = δ₃` is admissible; at `x = δ₂`,
  `y = (0, 1/2, 1/2)`, `n = 1` the bound would say `∞ ≤ 2 log 2`.

*Needs:* 1.1, 1.3. (The summed bound is proved here.)

### 2.2 Convergence to the minimum divergence

Prove `tendsto_klDivVec_alternating`: if every letter charged by some member of `Q` is charged by
`q₀`, then `D(pₙ ‖ qₙ)` tends to `inf {D(x ‖ y) | x ∈ P, y ∈ Q}` (Csiszár–Shields, Corollary 5.1 on
p. 467, there for compact convex sets of measures with the divergence without mass correction;
compactness is not needed for this claim).

Route. If `D = ∞` on `P × Q`, every term is `∞`. Otherwise fix `x ∈ P`, `y ∈ Q` with `D(x ‖ y) < ∞`.
Then `x` charges only letters charged by `y`, hence by `q₀`, so `D(p₀ ‖ q₀) ≤ D(x ‖ q₀) < ∞`, and by
the support claim of 1.1 (at `Q := q₀`) `D(x ‖ p₀) < ∞`. By 2.1,
`D(pₙ ‖ qₙ) ≤ D(x ‖ y) + D(x ‖ p₀)/n` for `n ≥ 1`. The sequence is nonincreasing (2.1) and bounded
below by the infimum, so it converges (Mathlib `tendsto_atTop_iInf`) to a limit between the infimum
and every finite `D(x ‖ y)`.

**Checks.**
- The support condition on `q₀` is needed: in the three-letter example of 2.1, `q₀ = δ₃` misses the
  second letter, which `(0, 1/2, 1/2) ∈ Q` charges; the values stay `∞`, while the infimum is
  `D(δ₂ ‖ (0, 1/2, 1/2)) = log 2`.
- Nonnegative entries in `P` are needed: let `P` be the segment of 1.1's Check, from `(−1/2, 1)` to
  `(1/2, 0)`, `Q` the segment from `δ₂` to `(9/10, 1/10)`, and `q₀ = (9/10, 1/10)`. Then
  `pₙ = (9/20, 1/20)` and `qₙ = q₀` for every `n`, with value `(1 − log 2)/2`, while
  `x = (−1/2, 1)`, read as `δ₂`, and `y = δ₂` give `0`. The bound of 2.1 fails too, at `n = 17`,
  since `D(x ‖ p₀) = log 20 − 1/2 < 17 (1 − log 2)/2`.
- Nonnegative entries in `Q` are needed: let `P` be the segment from `δ₂` to `(1/5, 4/5)`, `Q` the
  segment from `(−1, 1)` to `(1, 1/2)`, and `q₀ = (1, 1/2)`. Inductively every `qₙ` charges both
  letters, hence so does `pₙ` (the support claim of 1.1, as `(1/5, 4/5) ∈ P` charges both letters
  with finite divergence), hence `D(pₙ ‖ y) = ∞` for the members `y` read with first entry `0`, and
  `qₙ₊₁` lies on the segment from `(0, 3/4)` to `(1, 1/2)`. That segment is disjoint from `P`, so
  the values stay above the positive minimum of `D` on the product of the two compact segments,
  while `x = δ₂` and `y = (−1, 1)`, read as `δ₂`, give `0`.

*Needs:* 1.1, 2.1; Mathlib `tendsto_atTop_iInf`. (Proved here without compactness.)

### Examples

The EM iteration for mixture weights is an instance (Csiszár–Shields, Example 5.1, p. 468).

### Dependencies

2.1 needs 1.1 and 1.3; 2.2 needs 1.1 and 2.1.

## Layer 3: capacity of a finite channel

### 3.0 Channels

Copy verbatim from ChannelCoding 1.1 and 1.3, with that citation: `labelEntropy`,
`finiteMutualInformation`, `IsChannel`, `jointMeasure`, `channelMutualInformation`, `outputLaw`,
`informationDensity` and `channelCapacity`. No second mutual information or capacity is defined.

*Needs:* ChannelCoding 1.1, 1.3.

### 3.1 The golden formula

Prove `sum_mul_klDivVec_eq`: for a channel `W`, an input law `p` and every nonnegative vector `Q`
on `B`,

    ∑ a, p a · D(W_a ‖ Q) = I(p, W) + D(pW ‖ Q)

in `[0, ∞]` (Polyanskiy–Wu, Theorem 4.1, eq. (4.2), p. 67, for probability measures `Q`; here `Q` is
any nonnegative vector, the mass correction occurring once on each side).

Route. Both sides are `∞` exactly when some input charged by `p` has a row charging an output where
`Q = 0`, since `pW b ≥ p a W a b`. Otherwise expand by 1.0; by ChannelCoding 1.1,
`I(p, W) = ∑ a, ∑ b, p a W a b log (W a b / pW b)`, so
`∑ p a W a b log (W a b / Q b) − I(p, W) = ∑ b, pW b log (pW b / Q b)`, and the corrections are
`∑ Q − 1` on both sides since `∑ p = 1`.

**Checks.**
- The normalization of `p` is needed: for `p = 0` and `Q = (1/2, 1/2)` the left side is `0` and the
  right side `D(0 ‖ Q) = 1` (Mathlib `InformationTheory.klDiv_zero_left`).

*Needs:* 1.0, 3.0; ChannelCoding 1.1 channelMutualInformation_eq_sum. (Proved here for nonnegative
`Q`.)

### 3.2 The Kuhn–Tucker conditions

Prove `channelMutualInformation_eq_channelCapacity_iff`: for a channel `W` and an input law `p` with
output law `q = pW`, `I(p, W) = C` if and only if there is `c ∈ [0, ∞]` with `D(W_a ‖ q) = c` for
every `a` with `p a > 0` and `D(W_a ‖ q) ≤ c` for every `a`; and if `I(p, W) = C`, then
`D(W_a ‖ q) = C` for every `a` with `p a > 0` (Polyanskiy–Wu, Theorem 5.4, p. 94, and Corollary 5.7,
p. 96; Nakagawa–Takei–Hara–Watabe, Theorem A, p. 2).

Route. "If": by 3.1 with `Q = q`, `c = ∑ p a D(W_a ‖ q) = I(p, W)`, and for every input law `r`,
`I(r, W) ≤ ∑ r a D(W_a ‖ q) ≤ c`, so `I(p, W) = C` (ChannelCoding 1.3). "Only if": for an input `x`
and `t ∈ (0, 1]` let `pₜ = (1 − t) p + t δₓ` and `qₜ = (1 − t) q + t W_x`. By 3.1 at `Q = qₜ`,
applied to `pₜ` and to `p`, `C ≥ I(pₜ, W) = t D(W_x ‖ qₜ) + (1 − t) (C + D(q ‖ qₜ))`, so
`D(W_x ‖ qₜ) ≤ C` (finite, as `qₜ ≥ t W_x`). As `t → 0`, `qₜ → q`; a term `W x b log (W x b / qₜ b)`
with `q b = 0 < W x b` would tend to `∞`, so `D(W_x ‖ qₜ) → D(W_x ‖ q) ≤ C`. Averaging under `p`
with 3.1 gives `D(W_a ‖ q) = C` where `p a > 0`; take `c = C`.

**Checks.**
- The Z channel with rows `(1, 0)` and `(1/2, 1/2)`: `p = (3/5, 2/5)`, `q = (4/5, 1/5)` and
  `D(W_a ‖ q) = log (5/4)` for both inputs, so `C = log (5/4) = I(p, W)`.
- The three-input channel: `p = (1/2, 0, 1/2)` has `q = (1/2, 1/2)` and divergences `log 2`, `0`,
  `log 2`, so `C = log 2` with an optimal input that is not of full support and a strict inequality
  off it.
- `p` must be an input law: for `p = 0` on the identity channel every `D(W_a ‖ 0) = ∞`, so `c = ∞`
  satisfies the conditions while `I(0, W) = 0 < log 2 = C`.

*Needs:* 3.1; ChannelCoding 1.3 isGreatest_channelCapacity.

### 3.3 Capacity as a divergence radius

Prove `isLeast_iSup_klDivVec`: for a channel on a nonempty input alphabet, `C` is the least value of
`max_a D(W_a ‖ Q)` over probability vectors `Q` on `B`, and if `p` attains the capacity, every `Q`
with `max_a D(W_a ‖ Q) ≤ C` equals `pW` (Polyanskiy–Wu, Corollaries 5.5–5.7, pp. 94–96).

Route. ChannelCoding 1.3 gives an optimal `p*` with output law `q*`. For every `Q`, 3.1 gives
`C + D(q* ‖ Q) = ∑ p* a D(W_a ‖ Q) ≤ max_a D(W_a ‖ Q)`, so `C` is a lower bound, attained at `q*` by
3.2. If `max_a D(W_a ‖ Q) ≤ C` for an optimal `p` with output law `q`, the same identity gives
`D(q ‖ Q) = 0`, so `Q = q` (Mathlib `InformationTheory.klDiv_eq_zero_iff`).

**Checks.**
- A nonempty input alphabet is needed: for empty `A` and `B` there is no probability vector on `B`,
  and the set of values is empty.

*Needs:* 3.1, 3.2; ChannelCoding 1.3 isGreatest_channelCapacity; Mathlib
`InformationTheory.klDiv_eq_zero_iff`.

### Examples

For the binary symmetric channel with crossover `δ`, the uniform input has
`D(W_a ‖ (1/2, 1/2)) = log 2 − h(δ)` for both inputs, so 3.2 recovers ChannelCoding 1.5,
channelCapacity_bsc.

### Dependencies

3.1 needs 1.0 and 3.0; 3.2 needs 3.1; 3.3 needs 3.1 and 3.2. External: ChannelCoding 1.1, 1.3.

## Layer 4: the Blahut–Arimoto sequence

### 4.0 The update

Define `blahutArimotoStep W p a = p a exp (dₐ) / Z`, where
`dₐ = ∑ b, W a b · informationDensity p W a b` and `Z = ∑ a, p a exp (dₐ)`, and
`blahutArimoto W p₀ n`, its `n`-th iterate from `p₀` (Polyanskiy–Wu, §5.6, p. 103;
Nakagawa–Takei–Hara–Watabe, eq. (5), p. 3). For an input law `p` and `p a > 0`, `dₐ` is the real
value of `D(W_a ‖ pW)`; for `p a = 0` the junk value of `dₐ` is multiplied by `0`. The update maps
input laws to input laws, never charges a new input, and keeps positive entries positive.

**Checks.**
- On the three-input channel from the uniform law, `pₙ = (2ⁿ, 1, 2ⁿ)/(2ⁿ⁺¹ + 1)` and
  `I(pₙ, W) = (1 − 1/(2ⁿ⁺¹ + 1)) log 2`; for `p = p₀` the bounds of 4.1 read
  `(2/3) log 2 ≤ log (5/3) ≤ (4/5) log 2`.

### 4.1 Arimoto's sandwich

Prove `channelMutualInformation_le_log_le`: for a channel and an input law `p`,
`I(p, W) ≤ log Z ≤ I(p', W)` with `p' = blahutArimotoStep W p` (Polyanskiy–Wu, §5.6, pp. 102–103,
where the update comes from an alternating maximization; the bound through `log Z` is proved here).

Route. By ChannelCoding 1.1, `I(p, W) = ∑ p a dₐ`; Jensen's inequality for `exp` (Mathlib
`ConvexOn.map_sum_le`, `convexOn_exp`) gives `exp I(p, W) ≤ Z`. For the second inequality let
`Φ(a | b) = p a W a b / q b` and `Φ'(a | b) = p' a W a b / q' b`, with `q = pW`, `q' = p'W`. Where
`p a > 0`, `log p' a = log p a + dₐ − log Z` and `dₐ = ∑ b, W a b log Φ(a | b) − log p a`, so
`log Z = ∑ a, ∑ b, p' a W a b log (Φ(a | b) / p' a)`. By ChannelCoding 1.1 the same expression with
`Φ'` is `I(p', W)`, and the difference is `∑ b, q' b D(Φ'(· | b) ‖ Φ(· | b)) ≥ 0` (Gibbs'
inequality, from Mathlib `Real.log_le_sub_one_of_pos`).

**Checks.**
- The normalization of `p` is needed: on the identity channel, for `p = δ₁/e`, `I(p, W) = 1/e`
  (from the entropy formula) while `Z = 1`.

*Needs:* 4.0; ChannelCoding 1.1 channelMutualInformation_eq_sum; Mathlib `ConvexOn.map_sum_le`,
`convexOn_exp`, `Real.log_le_sub_one_of_pos`.

### 4.2 The rate

Prove `mul_channelCapacity_sub_le`: if `p'` is an input law attaining the capacity and `p₀` an input
law charging every input that `p'` charges, then

    n (C − I(pₙ, W)) ≤ ∑ a, p' a log (p' a / p₀ a) = D(p' ‖ p₀)  for every n;

from the uniform law the right side may be replaced by `log |A|` (Fasoulakis–Varsos–Traganitis,
Lemma 2, eq. (4), p. 5, for the one-step identity behind the route, and Corollary 1, p. 4, which
attributes a rate `O(log |A| / n)` to Arimoto (1972)).

Route. Every `pₙ` charges exactly the inputs `p₀` charges (4.0), hence every input `p'` charges, and
then `qₙ = pₙW` charges every output charged by the row of such an input, so that `dₐ(pₙ)` is the
real value of `D(W_a ‖ qₙ)` where `p' a > 0`. With `q* = p'W`,
`∑ a, p' a log (pₙ₊₁ a / pₙ a) = ∑ a, p' a dₐ(pₙ) − log Zₙ`, and the real form of 3.1 at `Q = qₙ`
gives `∑ a, p' a dₐ(pₙ) = C + D(q* ‖ qₙ) ≥ C`. With 4.1,
`D(p' ‖ pₙ) − D(p' ‖ pₙ₊₁) ≥ C − log Zₙ ≥ C − I(pₙ₊₁, W)`. Summing over `k < n`, and using
`D(p' ‖ pₙ) ≥ 0` and that `I(pₖ, W)` increases (4.1), `n (C − I(pₙ, W)) ≤ D(p' ‖ p₀)`. For the
uniform `p₀`, `D(p' ‖ p₀) = log |A| − H(p') ≤ log |A|`, with `p'` from ChannelCoding 1.3; for empty
`A` both sides of the uniform bound are `0` (the capacity is `sSup ∅ = 0` and `log 0 = 0`).

**Checks.**
- Three-input channel from the uniform law:
  `n log 2 / (2ⁿ⁺¹ + 1) ≤ log (3/2) = D((1/2, 0, 1/2) ‖ p₀)`.
- The support condition on `p₀` is needed: on the identity channel from `δ₁` the sequence stays at
  `δ₁` with `I = 0`, while `p' = (1/2, 1/2)` charges the second input and its sum is `−(1/2) log 2`
  (the term at the second letter is `(1/2) log (1/2 / 0) = 0`).
- `p'` must be an input law: on the identity channel `(1/4, 1/4)` has `I = log 2 = C` and sum
  `−(1/2) log 2 < 0`, while from the uniform `p₀` the left side is `0`.
- `p'` must be optimal: on the three-input channel with `p' = p₀` uniform, at `n = 1` the left side
  is `(1/5) log 2 > 0`.

*Needs:* 3.1, 4.0, 4.1; ChannelCoding 1.1 channelMutualInformation_eq_sum, 1.3
isGreatest_channelCapacity. (Proved here.)

### 4.3 Convergence

Prove `tendsto_blahutArimoto`: from an input law `p₀` with positive entries, `I(pₙ, W) → C`,
`max_a D(W_a ‖ pₙW) → C`, and `pₙ` converges to an input law attaining the capacity (Polyanskiy–Wu,
(5.29), p. 103, state the convergence of the two bounds; that of the laws is proved here).

Route. The first limit follows from 4.2 and `I(pₙ, W) ≤ C`. Input laws form a compact set, so a
subsequence tends to some `p̄` (Mathlib `IsCompact.tendsto_subseq`); `I(·, W)` is continuous on
input laws (in ChannelCoding 1.1's formula, `p a W a b |log q b| ≤ q b |log q b|`), so `p̄` is
optimal. By the route of 4.2, `D(p̄ ‖ pₙ)` is nonincreasing; it tends to `0` along the subsequence,
hence everywhere, and every limit point `r` has `D(p̄ ‖ r) = 0` by lower semicontinuity, so
`pₙ → p̄`. Then `pₙW → q̄ = p̄W`; by 3.2, `D(W_a ‖ q̄) ≤ C < ∞`, so `q̄` and every `pₙW` are
positive on the support of each row, `D(W_a ‖ ·)` is continuous there, and
`max_a D(W_a ‖ pₙW) → max_a D(W_a ‖ q̄) = C` by 3.3.

**Checks.**
- Positive entries of `p₀` are needed: on the identity channel from `δ₁`, `I(pₙ, W) = 0` for all `n`
  while `C = log 2`.

*Needs:* 3.2, 3.3, 4.1, 4.2; ChannelCoding 1.1 channelMutualInformation_eq_sum; Mathlib
`IsCompact.tendsto_subseq`, `Metric.isCompact_of_isClosed_isBounded`. (Proved here.)

### Examples

On the Z channel the laws tend to `(3/5, 2/5)`, the only optimal input (the rows are independent).

### Dependencies

4.0 needs 3.0; 4.1 needs 4.0; 4.2 needs 3.1, 4.0, 4.1; 4.3 needs 3.2, 3.3, 4.1, 4.2. External:
ChannelCoding 1.1, 1.3.

## Scope and ownership

Owned here: `vecMeasure` and `klDivVec`, and every target of Layers 1–4 as stated above, with the
Blahut–Arimoto update of 4.0.

Stated by ChannelCoding and used unchanged: the objects of 3.0 with the average formula (its 1.1),
the attainment of capacity (its 1.3) and the binary symmetric channel's capacity (its 1.5); the
definitions are copied verbatim and nothing it states is restated.

Already in the library and not targets: Mathlib's `InformationTheory.klDiv`; Tau Ceti's Csiszár
identity `TauCeti.klDiv_eq_klDiv_add_klDiv`, which recognizes a projection whose log-density has the
same integral over the whole family, the projection onto a prescribed marginal
(`MeasureTheory.Measure.fitLaw`) and iterative proportional fitting
(`MeasureTheory.Measure.proportionalFitting`). They are not used: 1.1–1.3 treat arbitrary convex
sets and linear constraints on a finite alphabet.

The golden formula holds for arbitrary channels (Polyanskiy–Wu, Theorem 4.1); 3.1 is its
finite-alphabet form, for ChannelCoding's mutual information and a nonnegative reference vector.
Its forms on general measure spaces, such as for additive channels, are not treated here.

Not treated here: continuous-alphabet channels; rate-distortion theory; the measure-theoretic EM
algorithm (MathematicalStatisticsSemiparametric, Layer 7); alternating projections in Hilbert space
and mirror descent, which ConvexAnalysisAndDuality and FirstOrderOptimization also leave outside
their scope; rates for the iterates themselves and accelerated variants.

## Exact supplier contracts

### From Mathlib

- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv`;
  `InformationTheory.klDiv_of_ac_of_integrable` (`μ ≪ ν` and `llr μ ν` integrable give
  `klDiv μ ν = ofReal (∫ llr μ ν dμ + ν univ − μ univ)`); `InformationTheory.klDiv_zero_left`
  (`klDiv 0 ν = ν univ` for finite `ν`); `InformationTheory.klDiv_eq_zero_iff` (for finite measures,
  `klDiv μ ν = 0 ↔ μ = ν`).
- `MeasureTheory.integral_fintype` (an integral on a finite type is a finite sum);
  `Real.log_le_sub_one_of_pos` (`log x ≤ x − 1` for `x > 0`); `Real.continuous_mul_log`;
`Real.strictConvexOn_mul_log` (`x log x` is strictly convex on `[0, ∞)`);
  `convexOn_exp` with `ConvexOn.map_sum_le` (Jensen's inequality for finite weights).
- `Metric.isCompact_of_isClosed_isBounded` (proper spaces), `IsCompact.tendsto_subseq`
  (first-countable spaces), `LowerSemicontinuousOn.exists_isMinOn` (nonempty compact set),
  `tendsto_atTop_iInf` (antitone sequences), `Submodule.orthogonal_orthogonal` (`Kᗮᗮ = K`, here in
  `EuclideanSpace ℝ α`).

### From Tau Ceti

- `TauCeti/InformationTheory/KullbackLeibler/Basic.lean`:
  `MeasureTheory.Measure.llr_eq_log_real_div_real_singleton` (with measurable singletons, at a point
  `x` with `R {x} ≠ 0, ∞`, `llr π R x = log (π.real {x} / R.real {x})`).
- `TauCeti/InformationTheory/KullbackLeibler/Finite.lean`:
  `TauCeti.klDiv_eq_ofReal_sum_log_singleton` (finite measures on a finite type, reference mass
  nonzero at every point: the log-ratio sum with the mass correction).

### From TauCetiRoadmap.ChannelCoding

- 1.1: the definitions of 3.0 except `channelCapacity` (with `labelEntropy` and
  `finiteMutualInformation` from ProbabilisticAndMetricNumberTheory §5.1a and §5.2), and
  channelMutualInformation_eq_sum: for `IsChannel W` and `p ≥ 0`,
  `I(p, W) = ∑ a, ∑ b, p a W a b · informationDensity p W a b`.
- 1.3: the definition `channelCapacity`, copied verbatim, and isGreatest_channelCapacity: for a
  channel on a nonempty input alphabet the capacity is attained by an input law.
- 1.5: channelCapacity_bsc, in the Examples of Layer 3.

## References

- S. Arimoto, An algorithm for computing the capacity of arbitrary discrete memoryless channels,
  *IEEE Trans. Inform. Theory* 18 (1972), 14–20.
- R. E. Blahut, Computation of channel capacity and rate-distortion functions, *IEEE Trans. Inform.
  Theory* 18 (1972), 460–473.
- I. Csiszár and P. C. Shields, *Information Theory and Statistics: A Tutorial*, Foundations and
  Trends in Communications and Information Theory 1 (2004), no. 4, 417–528 (author's page).
- I. Csiszár and G. Tusnády, Information geometry and alternating minimization procedures,
  *Statistics and Decisions*, Supplement Issue 1 (1984), 205–237.
- M. Fasoulakis, K. Varsos and A. Traganitis, Revisit the Arimoto–Blahut algorithm: new analysis
  with approximation, arXiv:2407.06013v6 (2025).
- K. Nakagawa, Y. Takei, S. Hara and K. Watabe, On a proof of the convergence speed of a
  second-order recurrence formula in the Arimoto–Blahut algorithm, arXiv:2209.04961.
- Y. Polyanskiy and Y. Wu, *Information Theory: From Coding to Learning*, Cambridge University
  Press; prepublication version of 16 August 2024, from the first author's page.
