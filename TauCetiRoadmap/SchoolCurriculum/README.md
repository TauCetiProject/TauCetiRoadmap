# Roadmap: named theorems of the secondary-school curriculum

The classical results taught from the collège to the end of the lycée (ages 11–18) that sit
between Mathlib's general theory and the concrete statement a pupil states: the repeating
decimal of a fraction, RSA, the volume of a cone, adjacent sequences, the normal approximation
of the binomial law, the distance from a point to a plane. Mathlib has the general machinery
for each: `Real.digits`, `ArithmeticFunction.carmichael`, `MeasureTheory.volume` and
`MeasureTheory.Measure.prod`, `ProbabilityTheory.binomial` and the central limit theorem, and
`Metric.infDist`. It does not state these corollaries, and a curriculum-level formalization
needs every one of them as a usable theorem, together with its small basic theory.

This roadmap fixes the statements, their conventions and their order. Each layer is
independent of the others except where a dependency is stated.

Suggested homes:

```text
TauCeti/NumberTheory/Digits/
TauCeti/NumberTheory/Carmichael/
TauCeti/MeasureTheory/Measure/Solids/
TauCeti/Topology/Algebra/Order/AdjacentSequences/
TauCeti/Probability/DeMoivreLaplace/
TauCeti/Analysis/InnerProductSpace/Distance/
```

## Standing conventions

- **Dimension.** Solids are subsets of `ℝ × ℝ × ℝ` with `MeasureTheory.volume` the product
  measure, written with coordinates `p.1`, `p.2.1`, `p.2.2`. A solid of revolution has its
  axis along `p.1`; the cone has its axis along `p.2.2`. Dimension 3 is the scope of this
  roadmap.
- **Bases.** A base `b` is a natural number with `2 ≤ b`.
- **Vocabulary.** No private predicate wraps a Mathlib notion: monotone and antitone sequences
  are `Monotone`/`Antitone`, a limit is `Tendsto … atTop (𝓝 l)`, the binomial law is
  `ProbabilityTheory.binomial n p` with `p : unitInterval`, the standard normal law is
  `ProbabilityTheory.gaussianReal 0 1`.
- **Naturals.** Congruences use `Nat.ModEq`. Statements about `ℕ` carry no coprimality
  hypothesis that the mathematics does not need.

## What Mathlib already has (consume)

| Area | Existing material |
| --- | --- |
| Digits | `Real.digits`, `Real.ofDigits`, `Nat.digits`, `Nat.ofDigits` |
| Arithmetic | `ArithmeticFunction.carmichael`, `ZMod.pow_card_sub_one_eq_one`, `Nat.ModEq`, the Chinese remainder theorem for `Nat.ModEq` and `ZMod` |
| Measure | `Complex.volume_closedBall`, `Complex.volume_preserving_equiv_real_prod`, `MeasureTheory.Measure.prod_apply`, `MeasureTheory.volume_regionBetween_eq_integral`, `EuclideanSpace.volume_ball` |
| Sequences | `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf`, `Tendsto.sub` |
| Probability | `ProbabilityTheory.binomial`, `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.cdf`, `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum`, `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto'`, `MeasureTheory.Measure.infinitePi` |
| Geometry | `Metric.infDist`, `Metric.infDist_le_dist_of_mem`, `inner_mul_le_norm_mul_norm`, `AffineSubspace.mk'` |

## The build, in layers

### Layer 1: expansions of rationals in an integer base

Digits of a real number in base `b` through `Real.digits`.

1. For `x : ℝ`, relate the digits of `x` to those of `b * x` (a shift) and to the fractional
   part of `x`.
2. The digits of a nonnegative rational are eventually periodic: there are `p > 0` and `n₀`
   with `Real.digits q b (n + p) = Real.digits q b n` for `n ≥ n₀`.
3. Conversely a real whose digit sequence is eventually periodic is a rational, hence the
   equivalence: `x` is rational if and only if its digits in base `b` are eventually periodic.
4. The floor form used in the curriculum: `⌊q * b ^ (n + p)⌋ % b = ⌊q * b ^ n⌋ % b` for
   `n ≥ n₀`.
5. For `c` coprime to `b`, the digits of `a / c` (with `0 ≤ a < c`) are purely periodic, with
   period `orderOf (b : ZMod c)`.

### Layer 2: powers modulo a squarefree number, and RSA

1. For a prime `p` and `a : ℕ`, `a ^ (k * (p - 1) + 1) ≡ a [MOD p]`, including `p ∣ a`.
2. For a squarefree `n`: `a ^ (k * λ(n) + 1) ≡ a [MOD n]` for every `a`, where `λ` is
   `ArithmeticFunction.carmichael`. Conversely, if `n` is not squarefree there is an `a` for
   which it fails; hence `Squarefree n` is equivalent to the statement for all `a` and `k`.
3. A Carmichael number `n` satisfies `a ^ n ≡ a [MOD n]` for every `a`, coprime to `n` or not.
4. RSA: for distinct primes `p`, `q` and `e * d ≡ 1 [MOD (p - 1) * (q - 1)]`, `(m ^ e) ^ d ≡ m
   [MOD p * q]` for every `m : ℕ`. The generalization to a squarefree modulus and
   `e * d ≡ 1 [MOD λ(n)]`.
5. Existence of a decryption exponent: for `e` coprime to `(p - 1) * (q - 1)` there is `d` with
   `e * d ≡ 1 [MOD (p - 1) * (q - 1)]`.

### Layer 3: Lebesgue measure of solids in `ℝ × ℝ × ℝ`

1. The disc: `volume {q : ℝ × ℝ | q.1 ^ 2 + q.2 ^ 2 ≤ r ^ 2} = ENNReal.ofReal (π * r ^ 2)`,
   and the closed disc of radius `r` at any centre.
2. The slice formula by Fubini: the volume of a measurable `S ⊆ ℝ × ℝ × ℝ` is the lower
   integral over `p.1` of the area of its slice, via `Measure.prod_apply`.
3. Solids of revolution, disc method: for `f` continuous and nonnegative on `[a, b]`,
   `volume {p | p.1 ∈ Icc a b ∧ p.2.1 ^ 2 + p.2.2 ^ 2 ≤ f p.1 ^ 2} = ofReal (π * ∫ x in a..b,
   f x ^ 2)`.
4. The cylinder, the cone and the frustum as the instances `f = c`, `f x = R * (1 - x / H)`
   and the affine `f`; the volume of the cone is `π R² H / 3` with the axis along `p.1` and,
   after a coordinate permutation, along `p.2.2`.
5. The ball of radius `r` in `ℝ × ℝ × ℝ` for the Euclidean distance, `4 π r ^ 3 / 3`, as the
   solid of revolution of `x ↦ √(r ^ 2 - x ^ 2)`.
6. Cavalieri's principle in `ℝ × ℝ × ℝ`: two measurable solids whose slices by every plane
   `p.1 = x` have equal area have equal volume.

Outside this layer: volumes in dimension other than 3.

### Layer 4: adjacent sequences

1. If `u` is monotone, `v` antitone and `v n - u n → 0`, then `u` and `v` converge to a common
   limit, and `u n ≤ l ≤ v n` for all `n`.
2. Nested segments: for `a` monotone and `b` antitone with `a n ≤ b n` and `b n - a n → 0`,
   the intersection of the `Icc (a n) (b n)` is a singleton.
3. The same statement for a linearly ordered additive commutative group with the order
   topology in which every bounded monotone sequence converges (the setting of
   `Mathlib/Topology/Algebra/Order/Group.lean`).
4. Consequence: an approximation of `√2`, `e` and `π` by decimal truncations from above and
   below, stated for the adjacent pair `⌊x * 10 ^ n⌋ / 10 ^ n` and `(⌊x * 10 ^ n⌋ + 1) / 10 ^ n`.

### Layer 5: the normal approximation of the binomial law

1. The binomial law is the law of a sum of `n` independent Bernoulli variables, on a product
   space built with `Measure.infinitePi`.
2. de Moivre–Laplace: for `0 < p < 1`, the cdf of the standardised binomial
   `(k - n p) / √(n p (1 - p))` converges pointwise to the standard normal cdf. It follows from
   the central limit theorem and the portmanteau theorem for sets with null frontier.
3. The uniform version: the convergence holds uniformly in `x` (Pólya).
4. Intervals of fluctuation: for `0 < p < 1` and `t > 0`, the probability under
   `binomial n p` that `|k / n - p| ≤ t √(p (1 - p) / n)` tends to
   `gaussianReal 0 1 (Set.Icc (-t) t)`.
5. Intervals of confidence: for `0 < p < 1`, the `liminf` of the probability under
   `binomial n p` that `|k / n - p| ≤ 1 / √n` is at least `gaussianReal 0 1 (Set.Icc (-2) 2)`.

This layer consumes `StandardDistributions` (binomial and Gaussian laws).

### Layer 6: distance from a point to an affine subspace

1. In a real inner product space `E` and `n ≠ 0`, `Metric.infDist m {x | ⟪n, x - a⟫ = 0} =
   |⟪n, m - a⟫| / ‖n‖`, realised by the orthogonal projection of `m`.
2. The same set as `{x | ⟪n, x⟫ = c}` and as an `AffineSubspace` built with `mk'`.
3. The distance from a point to a line in the plane, with the formula
   `|a x₀ + b y₀ + c| / √(a² + b²)`.
4. The distance from a point to an affine subspace with an orthonormal basis of its direction,
   via the orthogonal projection.

## Suggested Lean

`Suggested.lean` in this directory states the principal result of each layer against the
pinned Mathlib.

## Ordering

Layers 1–6 are independent. Within a layer the items are in dependency order. Layer 3 item 2
precedes items 3–6; Layer 5 item 1 precedes item 2.

## Provenance

The Lean proofs of Layers 1–6 are in
[`Commutator-IO/learn-lean`](https://github.com/Commutator-IO/learn-lean) (`upstream/` and
`courses/`), written against the Mathlib that library pins. This list is a map to that
source, not the specification: the statements above are.

## References

- Programme du cycle 4, programmes de mathématiques de lycée (Éducation nationale).
- R. L. Rivest, A. Shamir, L. Adleman, *A method for obtaining digital signatures and
  public-key cryptosystems*, Comm. ACM 21 (1978).
- W. Feller, *An Introduction to Probability Theory and Its Applications*, vol. 1, ch. VII.
