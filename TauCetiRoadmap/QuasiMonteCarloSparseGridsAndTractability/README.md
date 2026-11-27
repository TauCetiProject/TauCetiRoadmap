# Roadmap: quasi-Monte Carlo integration, sparse grids and tractability

**Summary.** This roadmap builds the deterministic theory of high-dimensional integration and
approximation on the unit cube `[0,1]^s`, and the complexity theory that says when the cost of
such problems grows only polynomially with the dimension:
- discrepancy: the local and star discrepancy of a finite point set, the Hlawka–Zaremba identity
  that writes the error of the equal-weight rule `Qₙ(f) = n⁻¹ ∑ f(tᵢ)` as a sum over the faces
  of the cube of integrals of mixed derivatives against the local discrepancy, the
  Hardy–Krause variation, and the Koksma–Hlawka inequality `|Qₙ(f) − I(f)| ≤ D*ₙ V(f)`;
- low-discrepancy points: the radical inverse, the Halton sequence and the Hammersley point set,
  `(t, m, s)`-nets and `(t, s)`-sequences, with star discrepancy `O((log n)^s / n)` for the
  sequences and `O((log n)^{s−1} / n)` for the point sets;
- weighted reproducing kernel Hilbert spaces of functions with square-integrable mixed first
  derivatives, anchored and unanchored, the closed form of the worst-case error of an
  equal-weight rule, randomly shifted rank-one lattice rules, their shift-averaged error in terms
  of the Bernoulli polynomial `B₂`, and the component-by-component construction of a generating
  vector with error `O(n^{−1+δ})`, independent of the dimension when the weights are summable to
  the power `1/(2 − 2δ)`;
- information-based complexity in the worst-case setting: algorithms that use `n` linear
  functionals, minimal errors and information complexity, polynomial, strong polynomial and weak
  tractability; for a bounded operator between Hilbert spaces the minimal error with `n`
  arbitrary functionals is its `n`th approximation number, attained by the truncated singular
  expansion for compact operators, so tractability is a property of the singular values: the
  Novak–Woźniakowski criterion, the curse of dimensionality of tensor products whose two largest
  eigenvalues are `1`, and the equivalence of polynomial tractability with polynomial decay of the
  eigenvalues when the largest is below `1`;
- the tractability of integration with function values in weighted Sobolev spaces with product
  weights `γⱼ`: strongly polynomially tractable exactly when `∑ γⱼ < ∞`, polynomially tractable
  exactly when `∑_{j ≤ s} γⱼ = O(log s)`;
- sparse grids: the hierarchical hat basis, the sparse-grid space with
  `2^n (n^{d−1}/(d−1)! + O(n^{d−2}))` points against `(2^n − 1)^d` for the full grid, and the
  interpolation errors `O(2^{−2n} n^{d−1})` in `L^∞` and `L²` and `O(2^{−n})` in the energy norm
  for functions with bounded mixed second derivatives, with explicit constants.

The roadmap is a synthesis of Dick, Kuo and Sloan's survey of quasi-Monte Carlo methods, of
Caflisch's survey of Monte Carlo and quasi-Monte Carlo integration, of Novak and Woźniakowski's
monograph on tractability, and of Bungartz and Griebel's survey of sparse grids (see
[References](#references)); it follows none of them section by section. Headlines that restate
a source result cite a theorem, definition, section or equation number with its printed page;
corollaries and adaptations carry a proof route.

It builds on Mathlib's reproducing kernel Hilbert spaces, product measures and variation, and on
Tau Ceti's approximation numbers of bounded operators, whose min–max formula is the minimal
error of Layer 4, and Tau Ceti's Kolmogorov space and kernel mean embeddings of a positive
semidefinite kernel, which realize the weighted spaces of Layer 3. Two roadmaps on main border
it. [ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md) owns
the one-dimensional star discrepancy and Koksma's inequality, which are the case `s = 1` of
Layer 1. [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) owns the maximum
mean discrepancy of two laws as a supremum over the unit ball of a kernel space; the worst-case
error of an equal-weight rule is the maximum mean discrepancy between the uniform law and the
empirical law of the points. Its downstream consumers are Monte Carlo and multilevel methods,
quasi-Monte Carlo methods for parametric problems, and the theory of widths and reduced models,
which use the complexity notions of Layer 4.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. The bullets without one are definitions, results supplied by Mathlib, Tau Ceti
or other roadmaps, compositions of two stated targets, or Checks, as the module docstring of
`Suggested.lean` says. It is not an exhaustive acceptance test: the prose targets have the same
standing.

Suggested home: `TauCeti/NumericalAnalysis/QuasiMonteCarlo/` for Layers 1–3 and 5,
`TauCeti/NumericalAnalysis/Complexity/` for Layer 4 and `TauCeti/NumericalAnalysis/SparseGrids/`
for Layer 6.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, and Checks, which are sanity checks of the key definitions and
theorems.

Layer 1 defines discrepancy and proves the Koksma–Hlawka inequality, first for smooth integrands
through the Hlawka–Zaremba identity and then for every function of bounded Hardy–Krause
variation. Layer 2 constructs point sets and sequences of small star discrepancy; with Layer 1
they give the classical quasi-Monte Carlo error rates. Layer 3 replaces the variation by the norm
of a weighted reproducing kernel Hilbert space, in which the worst-case error has a closed form;
it proves the error formula for randomly shifted lattice rules and the bound for the
component-by-component construction. Layer 4 is independent of Layers 1–3: it sets up algorithms,
information complexity and tractability for an arbitrary problem and solves the case of linear
operators between Hilbert spaces with arbitrary linear functionals. Layer 5 applies Layer 4 to
integration with function values in the spaces of Layer 3. Layer 6, sparse grids, uses only the
suppliers.

The layers are in build order: Layer 2 uses Layer 1; Layer 3 uses only the equal-weight rule of
Layer 1; Layer 5 uses Layers 3 and 4.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.QuasiMonteCarloSparseGridsAndTractability`.
- **Point sets.** In Layers 1–2 a point set is an indexed family `P : Fin n → Fin s → ℝ` with
  every `P i` in the closed cube `Set.Icc 0 1`; points are counted with multiplicity, as in
  [DKS, §2.3, p. 140]. The equal-weight rule is `qmcRule P f = (∑ᵢ f (P i)) / n`; every theorem
  about it that needs it assumes `0 < n`, since `qmcRule` is `0` for `n = 0`. The integral is
  `∫ x in Set.Icc 0 1, f x` for Lebesgue measure on `Fin s → ℝ`.
- **Boxes and discrepancy.** Anchored boxes are closed, `[0, x] = Set.Icc 0 x`, as in [DKS,
  (3.16), p. 176]. The star discrepancy `starDiscrepancy` is a supremum in `ℝ≥0∞` over `x` in the
  closed cube; it lies in `[0, 1]` (`starDiscrepancy_le_one`), so it is never the junk value of an
  unbounded real supremum. ProbabilisticAndMetricNumberTheory §2.7 uses strict cuts `[0, t)` and
  samples in `[0, 1)`; for such samples the two one-dimensional star discrepancies agree (a Check
  of 1.1).
- **Derivatives.** Mixed derivatives are `iteratedFDerivWithin` on the closed cube applied to
  standard basis vectors, under a `ContDiffOn` hypothesis on the cube, so that the derivative at a
  boundary point is the one-sided one. The face point `(y_u; 1)` is `facePoint u y`, with the
  coordinates outside `u` equal to `1`.
- **Function spaces.** In Layers 3 and 5 functions live on `Cube s = Fin s → unitInterval` with
  its product volume, a probability measure (Mathlib's `MeasureTheory.Measure.pi`). A reproducing
  kernel Hilbert space with kernel `k : Cube s → Cube s → ℝ` is any real Hilbert space `H` with
  `[RKHS ℝ H (Cube s) ℝ]` and `RKHS.kernel H = positiveDefiniteKernelOperator k`, Tau Ceti's
  operator form of a scalar kernel. Such an `H` exists when `k` is positive semidefinite (Tau
  Ceti's `Matrix.PosSemidef.KolmogorovSpace`, built on Mathlib's `RKHS.OfKernel`) and is unique up
  to isometry (`RKHS.equiv`), so the statements quantify over `H` with this hypothesis rather
  than fix a construction. All kernels of this roadmap are bounded and jointly continuous on the
  compact cube, so every element of `H` is bounded and continuous, hence integrable: no Bochner
  integral below is the junk value of a non-integrable function.
- **Weights.** General weights are `γ : Finset (Fin s) → ℝ`, nonnegative, with `γ_u` multiplying
  the term of the subset `u` of coordinates; product weights are
  `productWeights γ s u = ∏_{j ∈ u} γⱼ` for a sequence `γ : ℕ → ℝ`. Coordinates are zero-based: the
  source's `x₁` is `x 0`, and the source's first generating component `z₁ = 1` is `z 0 = 1`.
- **Errors and complexities.** Worst-case errors, shift-averaged errors, variations and
  sparse-grid errors are `ℝ≥0∞`-valued suprema, integrals `∫⁻` or norms `‖·‖ₑ`, since they can be
  infinite. Information complexities are `ℕ∞`-valued infima, so that the least `n` over an empty
  set is `⊤`, not the junk value 0 of an infimum of the empty set in `ℕ`. Real error bounds
  enter through `ENNReal.ofReal`.
- **Approximation numbers.** `ContinuousLinearMap.singularValue S n` is Tau Ceti's `n`th
  approximation number, the distance from `S` to the operators of rank at most `n`; it is
  zero-based, so for a compact operator between Hilbert spaces it is the `(n+1)`st singular value
  `√λₙ₊₁` of the sources, where `λ₁ ≥ λ₂ ≥ …` are the eigenvalues of `S*S`.
- **Tractability.** A complexity function is `N : ℕ → ℝ → ℕ∞` of the dimension `d` and the error
  `ε`; tractability quantifies over `d ≥ 1` and `ε ∈ (0, 1)` as in [NW, Definition 4.44,
  p. 149]. Weak tractability is stated without logarithms, as `N d ε ≤ exp(η (ε⁻¹ + d))` for
  `ε⁻¹ + d` large, which is the limit (4.55) of [NW, p. 151] and avoids `Real.log 0`.
- **Sparse grids.** Level vectors `l : Fin d → ℕ` are one-based, `lⱼ ≥ 1`, with mesh `2^{−lⱼ}`,
  as in [BG, (3.5), p. 155]; a level set is a `Finset (Fin d → ℕ)`. The energy norm of `v` is
  `(∫ ∑ⱼ (∂ⱼ v)²)^{1/2}` with `∂ⱼ v = fderiv ℝ v x (Pi.single j 1)`, the Euclidean length of the
  gradient, not the operator norm of `fderiv` for the sup norm on `Fin d → ℝ`; the target states
  that the error is differentiable almost everywhere, so `fderiv` is used only where it exists.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references). Dick–Kuo–Sloan and Caflisch write `s` for the dimension and index
  coordinates and points from `1` and `0` respectively; Bungartz–Griebel and Novak–Woźniakowski
  write `d`.

## Layer 1: discrepancy and the Koksma–Hlawka inequality

### 1.1 Local and star discrepancy

- **Local discrepancy** (`localDiscrepancy`): `Δ_P(x) = #{i | P i ∈ [0, x]}/n − x₁ ⋯ x_s` for
  `x ∈ [0,1]^s`, the integration error of the indicator of `[0, x]` [DKS, §3.5, p. 175; (3.3),
  p. 165 for `s = 1`].
- **Star discrepancy** (`starDiscrepancy`): `D*(P) = sup_{x ∈ [0,1]^s} |Δ_P(x)|` [DKS, (3.16),
  p. 176]; [Caf, (5.3), p. 25].
- **Bound** (`starDiscrepancy_le_one`): `D*(P) ≤ 1` for every point set. Route: both the counting
  term and the volume lie in `[0, 1]`.

**Checks.**

- A single point at `0`: `D* = 1`, attained at `x = 0`; a single point at `1/2` in one dimension:
  `D* = 1/2`.
- The midpoints `(2i + 1)/(2n)`, `i < n`, in one dimension: `D* = 1/(2n)` (computed for
  `n = 1, 2, 5`).
- Agreement with ProbabilisticAndMetricNumberTheory §2.7: for samples in `[0, 1)` in one dimension,
  the supremum with closed cuts `[0, x]` equals the supremum with strict cuts `[0, t)`, since the
  closed count at `x` is the limit from the right of the strict count and the strict count at `t`
  is the limit from the left of the closed count.
- Negative control: the two conventions differ in the local discrepancy on the faces `x_j = 1`,
  where the Hlawka–Zaremba identity of 1.2 evaluates it. For `s = 2`, the single point `(0, 1)`
  and `f(x, y) = x`, the error is `Qₙ(f) − I(f) = −1/2`; the right side of the identity is `−1/2`
  with closed boxes and `+1/2` with strict boxes `[0, x)`, which miss the point on the face
  `y = 1`.

### 1.2 The Hlawka–Zaremba identity

- **Face derivatives and smooth variation** (`facePoint`, `faceDerivative`, `smoothVariation`):
  `∂^{|u|} f/∂x_u` at `(y_u; 1)`, and `V(f) = ∑_{u ≠ ∅} ∫_{[0,1]^u} |∂^{|u|} f(y_u; 1)| dy_u`
  [DKS, p. 176]; [Caf, (5.8), p. 26].
- **Hlawka–Zaremba identity** (`hlawkaZaremba`): for `0 < n`, points in the cube and `f` of class
  `C^s` on the closed cube,
  `Qₙ(f) − I(f) = ∑_{u ≠ ∅} (−1)^{|u|} ∫_{[0,1]^u} ∂^{|u|} f(y_u; 1) Δ_P(y_u; 1) dy_u`
  [DKS, §3.5, p. 175]. Route: write `f(x) = ∑_u (−1)^{|u|} ∫ ∂_u f(y_u; 1) 1[x ≤ y]_u dy_u` by
  the fundamental theorem of calculus in each coordinate of `u`, average over the points and
  integrate over the cube; the `u = ∅` term cancels because `Δ_P(1) = 0`. The source assumes
  continuous mixed first derivatives; `C^s` on the cube is the formal hypothesis, and the general
  case is 1.3.
- **Koksma–Hlawka inequality for smooth integrands** (`koksmaHlawka_of_contDiffOn`):
  `|Qₙ(f) − I(f)| ≤ D*(P) V(f)` [DKS, Theorem 3.9 with `p = p' = ∞`, `q = q' = 1` and the
  seminorm, pp. 175–176]. Route: bound `|Δ_P(y_u; 1)|` by `D*(P)` in the identity.

**Checks.**

- `s = 1`: the identity reads `Qₙ(f) − I(f) = −∫₀¹ f'(x) Δ_P(x) dx`, which is [DKS, (3.2),
  p. 165] with the sign of the error reversed.
- `s = 2`, five random points and `f(x, y) = x²y + sin(x + 2y)`: both sides of the identity equal
  `−0.0798651` to seven digits, and `|Qₙ(f) − I(f)| = 0.0799 ≤ D* V = 0.694`.
- Negative control: dropping `0 < n` is wrong: for `n = 0` the rule is `0` and the identity fails
  for `f ≡ 1`, where the left side is `−1` and every mixed derivative vanishes.

### 1.3 Hardy–Krause variation and the general inequality

- **Vitali and Hardy–Krause variation** (`vitaliVariation`, `hardyKrauseVariation`): the Vitali
  variation of `g` on `[0,1]^k` is the supremum over grids `0 = p_{j,0} ≤ … ≤ p_{j,m_j} = 1` of
  `∑_cells |Δ_cell g|`, where `Δ_cell g` is the alternating sum of `g` over the `2^k` vertices of
  the cell; the Hardy–Krause variation of `f` anchored at `1` is the sum over `u ≠ ∅` of the
  Vitali variations of `y ↦ f(y_u; 1)`, in `ℝ≥0∞`. This is the variation of [DKS, p. 176] and
  [Caf, Theorem 5.1, p. 26].
- **One variable** (`hardyKrauseVariation_fin_one`): for `s = 1` the Hardy–Krause variation is
  Mathlib's `eVariationOn` of `t ↦ f t` on `[0, 1]`. Route: a grid with endpoints `0` and `1` is a
  monotone sequence in `[0, 1]`, and adding the endpoints to a sequence does not decrease its sum.
- **Smooth functions** (`hardyKrauseVariation_eq_smoothVariation`): for `f` of class `C^s` on the
  closed cube, `V_HK(f) = V(f)` [DKS, p. 176]. Route: on a cell the alternating vertex sum is the
  integral of the mixed derivative over the cell, so the grid sums are at most `V(f)`, and they
  converge to it along refining grids by uniform continuity of the mixed derivatives.
- **Koksma–Hlawka inequality** (`koksmaHlawka`): for `0 < n`, points in the cube and every
  `f : (Fin s → ℝ) → ℝ`, `|Qₙ(f) − I(f)| ≤ D*(P) V_HK(f)` [DKS, (3.15), p. 176]; [Caf,
  Theorem 5.1, p. 26]. No measurability hypothesis is needed: if `V_HK(f) < ∞` then `f` is
  bounded and differs from a Borel function only on a null set, so its integral is genuine;
  if `V_HK(f) = ∞` the right side is `∞` for `s ≥ 1`, because `D*(P) ≥ 1/(2n) > 0` (the
  one-dimensional bound applied to the first coordinates, at `x = (x₁, 1, …, 1)`); for `s = 0`
  both sides are `0`. Route: for `V_HK(f) < ∞`, take a product grid whose coordinates contain
  those of the points, and compare `Qₙ(f)` with the left-endpoint product rule `Q_G(f)` of the
  grid. Summation by parts in each coordinate gives the discrete form of the identity of 1.2:
  `Qₙ(f) − Q_G(f)` is a sum over `u ≠ ∅` and over the cells of the face `(y_u; 1)` of the
  alternating vertex sums of `f` times the difference of the local discrepancies of `P` and of
  the grid at a vertex, bounded by `D*(P) + D*(G)`. So
  `|Qₙ(f) − Q_G(f)| ≤ (D*(P) + D*(G)) V_HK(f)`; refine the grid, so that `D*(G) → 0` and
  `Q_G(f) → I(f)` (a function of bounded Hardy–Krause variation is Riemann integrable). A
  representation `f(x) = f(1) + ∑ (−1)^{|u|} ν_u([x_u, 1_u])` by signed measures holds only for
  one-sidedly continuous `f` (it fails for the indicator of `{1/2}` in one variable) and is not
  the route.

**Checks.**

- `s = 1`, `f` the indicator of `[1/2, 1]`, so `V_HK(f) = 1`: for the single point `{1/4}` the
  error is `1/2` and `D* = 3/4`; for `{1/2}` the error is `1/2` and `D* = 1/2`, so the bound is
  attained.
- `hardyKrauseVariation_fin_one` against ProbabilisticAndMetricNumberTheory §2.7: for samples in
  `[0, 1)`, `koksmaHlawka` at `s = 1` is its Koksma inequality, with the same star discrepancy by
  the Check of 1.1.
- Negative control: the Vitali variation alone is not enough: `f(x, y) = x` has Vitali variation
  `0` on `[0,1]²` (every alternating cell sum vanishes) but is not integrated exactly by the
  point `(0, 0)`; its Hardy–Krause variation is `1`, from the face `y = 1`.

## Layer 2: low-discrepancy point sets and sequences

### 2.1 Radical inverse, Halton and Hammersley

- **Radical inverse** (`radicalInverse`): for `b ≥ 2` and `i = ∑ₖ aₖ b^k`,
  `φ_b(i) = ∑ₖ aₖ b^{−k−1}`, with the digits of Mathlib's `Nat.digits`, least significant first
  [DKS, Definition 2.2, p. 141].
- **Range** (`radicalInverse_mem_Ico`): `φ_b(i) ∈ [0, 1)` for `b ≥ 2`. Route: the digit sum is
  at most `(b − 1) ∑_{k < L} b^{−k−1} = 1 − b^{−L}`.
- **Halton sequence** (`halton`): `tᵢ = (φ_{p₁}(i), …, φ_{p_s}(i))` for the first `s` primes, the
  `j`th prime being `Nat.nth Nat.Prime j` (zero-based, `Nat.nth_prime_zero_eq_two`) [DKS,
  Example 2.4, p. 141].
- **Hammersley point set** (`hammersley`): `tᵢ = (i/n, φ_{p₁}(i), …, φ_{p_{s−1}}(i))`, `i < n`
  [DKS, Example 2.5, p. 142].

**Checks.**

- `φ₂(0), …, φ₂(6) = 0, 1/2, 1/4, 3/4, 1/8, 5/8, 3/8`, the van der Corput sequence of [DKS,
  Example 2.3, p. 141]; `φ₃(3) = 1/9`, `φ₃(4) = 4/9`.
- Halton in three dimensions: `t₁ = (1/2, 1/3, 1/5)`, `t₂ = (1/4, 2/3, 2/5)`,
  `t₃ = (3/4, 1/9, 3/5)`, as listed in [DKS, p. 141].
- Negative control: reading the digits of `Nat.digits` most significant first turns
  `6 = 110₂` into `0.110₂ = 3/4` instead of `0.011₂ = 3/8`, and repeats values within the first
  eight points (`1` and `2` both give `1/2`).
- The Hammersley set in one dimension is `{i/n}`, with `D* = 1/n`.

### 2.2 Nets and sequences

- **`(t, m, s)`-nets** (`IsNet`): `b^m` points of `[0, 1)^s` such that every elementary box
  `∏ⱼ [aⱼ b^{−dⱼ}, (aⱼ + 1) b^{−dⱼ})` with `∑ dⱼ = m − t` contains exactly `b^t` of them [DKS,
  Definition 2.11, p. 145]. The definition allows `m = 0` and `s = 0`, where it is trivial.
- **`(t, s)`-sequences** (`IsTSSequence`): every block `t_{ℓ b^m}, …, t_{(ℓ+1) b^m − 1}` with
  `m > t` is a `(t, m, s)`-net [DKS, Definition 2.12, p. 146].
- **Van der Corput** (`isTSSequence_vanDerCorput`): for `b ≥ 2` the sequence `φ_b(i)` is a
  `(0, 1)`-sequence in base `b` [DKS, p. 146]. Route: within a block of `b^m` consecutive indices
  the last `m` digits run through all values, and `φ_b(i)` lies in the elementary interval of
  length `b^{−m}` given by those digits reversed.

**Checks.**

- The `(0, 1)` property of the van der Corput sequence holds for every block with `m ≤ 5`,
  `ℓ < 6` in base `2` and `m ≤ 3`, `ℓ < 5` in base `3` (computed).
- Every `b^m` points of `[0, 1)^s` form an `(m, m, s)`-net, since the only elementary box is the
  cube [DKS, p. 145].
- Negative control: the points `k/n` on the diagonal of `[0, 1)²`, `n = 4`, are not a
  `(0, 2, 2)`-net in base `2`: the box `[0, 1/2) × [1/2, 1)` contains none of them.

### 2.3 Discrepancy bounds

- **Halton** (`starDiscrepancy_halton_le`): there is `C(s)` with
  `D*(t₀, …, t_{n−1}) ≤ C(s) (log n)^s / n` for all `n ≥ 2` [Caf, (5.23), p. 30]; [DKS,
  Example 2.4, p. 141, in the integration form]. Route: decompose `[0, x]` into elementary boxes
  `∏ⱼ [aⱼ pⱼ^{−dⱼ}, (aⱼ + 1) pⱼ^{−dⱼ})` with at most `pⱼ − 1` boxes per digit of each coordinate and
  a remainder of small volume; by the Chinese remainder theorem the `j`th coordinates lie in such a
  box for exactly one residue class of `i` modulo `∏ⱼ pⱼ^{dⱼ}`, so each box has count error at most
  `1`.
- **Hammersley** (`starDiscrepancy_hammersley_le`): there is `C(s)` with
  `D* ≤ C(s) (log n)^{s−1} / n` for all `n ≥ 2` [DKS, Example 2.5, p. 142, in the integration
  form]. Route: as for Halton in the last `s − 1` coordinates, the first coordinate `i/n`
  replacing the residue condition on `i` by an interval of indices.
- **Nets** (`starDiscrepancy_net_le`): for `b ≥ 2` and `t, s` there is `C` with
  `D*(P) ≤ C (log n)^{s−1} / n`, `n = b^m`, for every `(t, m, s)`-net in base `b` with `m ≥ 1`.
  Route: the same decomposition into elementary boxes of volume at least `b^{t−m}`, each counted
  exactly; the only `m ≤ t` is `m = t`, where the bound holds for `C ≥ b^t (t log b)^{1−s}`
  since `D* ≤ 1`.
- **Sequences** (`starDiscrepancy_tsSequence_le`): for `b ≥ 2` and `t, s` there is `C` with
  `D* ≤ C (log n)^s / n` for the first `n ≥ 2` points of every `(t, s)`-sequence in base `b`.
  Caflisch states this form for the Faure, Sobol' and Niederreiter sequences [Caf, p. 30]; [DKS,
  p. 146] names them as `(t, s)`-sequences. Route: write `n` in base `b`; the first `n` points
  split into at most `(b − 1)(log_b n + 1)` nets with `m > t` and a remainder of fewer than
  `b^{t+1}` points (the digits of `n` at the places `m ≤ t`), and the star discrepancy of a union
  is at most the weighted sum.

**Checks.**

- Computed: `n D*/(log n)` for Halton in one dimension is `0.72, 0.36, 0.24` at `n = 4, 16, 64`,
  and `n D*/(log n)²` in two dimensions is `1.04, 0.42, 0.19`; for Hammersley in two dimensions
  `n D*/log n` is `1.44, 0.99, 0.83` at `n = 4, 16, 64`.
- Negative control: replacing the bases by `p₁ = p₂ = 2` (Halton with a repeated base) puts every
  point on the diagonal, and `D*` stays above `1/4` (computed `0.5, 0.3125, 0.2656` at
  `n = 4, 16, 64`): at `x = (1/2, 1/2)` about half the points are counted against the volume
  `1/4`. Distinct primes are essential.

### 2.4 Integration error bounds

- **Rates** (composition of 2.3 with `koksmaHlawka`): for `f` of bounded Hardy–Krause variation,
  the rule on the first `n` Halton points has error at most `C(s) (log n)^s V_HK(f)/n`, on the
  Hammersley set `C(s) (log n)^{s−1} V_HK(f)/n`, and on the first `n` points of a `(t, s)`-sequence
  `C (log n)^s V_HK(f)/n` [DKS, pp. 141–142]; [Caf, (5.25), p. 30]. These carry no Lean name: each
  is one application of `koksmaHlawka` to a bound of 2.3.

## Layer 3: weighted Sobolev spaces and randomly shifted lattice rules

### 3.1 Weighted kernels and their spaces

- **Anchored kernel** (`anchoredEta`, `anchoredKernel`): for an anchor `c ∈ [0, 1]`,
  `η_c(x, y) = min(x, y) − c` if `x, y > c`, `c − max(x, y)` if `x, y < c`, and `0` otherwise,
  and `K_{s,γ}(x, y) = ∏ⱼ (1 + γⱼ η_c(xⱼ, yⱼ))` [DKS, (4.1), p. 179 and §4.2, p. 180].
- **Unanchored kernel** (`bernoulliTwo`, `unanchoredEta`, `unanchoredKernel`, `productWeights`):
  `η(x, y) = B₂(|x − y|)/2 + (x − 1/2)(y − 1/2)` with `B₂(x) = x² − x + 1/6`, and
  `K_{s,γ}(x, y) = ∑_u γ_u ∏_{j ∈ u} η(xⱼ, yⱼ)` [DKS, (4.7), p. 182 and (4.3), p. 180].
- **Positive semidefiniteness** (`posSemidef_anchoredKernel`, `posSemidef_unanchoredKernel`): both
  kernels are positive semidefinite for nonnegative weights, the anchored one for every real
  anchor `c`. Route: `η_c` is the covariance of two independent Brownian motions started at `c`,
  one run to the right and one to the left, so on `(c, ∞)` and on `(−∞, c)` it is a shifted
  Brownian kernel `min`, `η` is the kernel of the one-dimensional space
  below, and sums and products of positive semidefinite kernels are positive semidefinite (Schur
  product). With Tau Ceti's `TauCeti.posSemidef_positiveDefiniteKernelOperator` this gives the
  space `Matrix.PosSemidef.KolmogorovSpace` with the kernel (`RKHS.OfKernel.kernel_ofKernel`).
- **The anchored space in one variable** (`anchored_one_range_and_norm`): for `γ > 0` the
  functions of the space are exactly the `h` with `h(x) = h(c) + ∫_c^x g` for some
  `g ∈ L²[0, 1]`, and `‖f‖² = f(c)² + γ⁻¹ ∫₀¹ g²` [DKS, p. 179]. Route: the kernel functions
  `K(·, y)` have this form with `g = γ 1_{(c, y)}` (or `−γ 1_{(y, c)}`), the stated inner product
  reproduces point values by the fundamental theorem of calculus, and the space of such `h` is
  complete; uniqueness of the reproducing kernel space (`RKHS.equiv`) identifies it with `H`.
- **The unanchored space in one variable** (`unanchored_one_range_and_norm`): for `γ > 0`, the
  same functions, with `‖f‖² = (∫₀¹ f)² + γ⁻¹ ∫₀¹ g²` [DKS, §4.3, p. 182]. Route: as above, with
  `∂ₓ η(x, y) = x − 1/2 − sign(x − y)/2` and `∫₀¹ η(x, y) dx = 0`.
- The `s`-dimensional norms are the sums over `u` of `γ_u⁻¹` times the `L²` norms of the mixed
  derivatives `∂_u f(x_u; c)` (anchored) or of their averages over the coordinates outside `u`
  (unanchored) [DKS, p. 181 and p. 183]; these follow from the one-variable cases by the tensor
  product structure of the kernels and are not stated separately.

**Checks.**

- Reproducing property in one variable, `γ = 0.7`: for the unanchored kernel at
  `y = 0.2, 0.5, 0.9`, `∫ K(·, y) = 1` and the norm formula gives
  `K(y, y) = 1.1213, 1.0583, 1.1703`; for the anchored kernel with `c = 0.3` at `y = 0.1, 0.6`,
  `K(c, y) = 1` and the norm formula gives `K(y, y) = 1.14, 1.21`.
- `c = 1`, `γ = 1`: `1 + η₁(x, y) = 2 − max(x, y)`, the kernel (3.7) of [DKS, p. 166].
- Negative control: the norm formula without the term `f(c)²`, the seminorm `γ⁻¹ ∫ g²` alone,
  gives `0` for the kernel function `K(·, c) ≡ 1`, whose norm is `K(c, c)^{1/2} = 1`.

### 3.2 The worst-case error in a reproducing kernel Hilbert space

- **Worst-case and initial error** (`worstCaseError`, `initialIntegrationError`):
  `e(P) = sup_{‖f‖ ≤ 1} |I(f) − Qₙ(f)|` and `e₀ = sup_{‖f‖ ≤ 1} |I(f)|` in `ℝ≥0∞` [DKS,
  Definition 3.4, p. 169].
- **The squared worst-case error** (`worstCaseError_sq_eq`): for a jointly continuous kernel `k`
  and `0 < n`, `e(P)² = ∫∫ k − (2/n) ∑ᵢ ∫ k(tᵢ, y) dy + n⁻² ∑ᵢ ∑ₗ k(tᵢ, tₗ)` and `e₀² = ∫∫ k`
  [DKS, Theorem 3.5, (3.9)–(3.10), p. 169]. Route: `e(P)` is the maximum mean discrepancy between
  the volume and the empirical law of the points, the supremum over the unit ball of
  KernelsAndSpectralMethods §7.2, transported from `H` to the Kolmogorov space by `RKHS.equiv`;
  Tau Ceti's `Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq`, with the integrability of
  `Matrix.PosSemidef.integrable_kolmogorovFeature`, gives the double integrals.

**Checks.**

- Unanchored kernel, `s = 2`, weights `γ_{0} = 0.8`, `γ_{1} = 0.5`, `γ_{0,1} = 0.3`, the lattice
  points of `n = 7`, `z = (1, 3)`: `e(P)² = 0.0097945` from the formula, the same with `γ_∅ = 5`
  in place of `1`, since `∫ η(x, y) dy = 0` makes the `u = ∅` terms cancel.
- The constant kernel `k ≡ 1`: the space is the constants, every rule with `0 < n` is exact, and
  the formula gives `1 − 2 + 1 = 0`.

### 3.3 Randomly shifted lattice rules

- **Shifts and the shift-averaged error** (`shiftPoints`, `shiftAveragedError`): `P + Δ` is
  `{tᵢ + Δ}` with fractional parts (`Int.fract`), and `e^sh(P)² = ∫_{[0,1]^s} e(P + Δ)² dΔ`
  [DKS, (5.8), p. 195].
- **Mean-square error** (`lintegral_sq_error_shift_le`): for every `f` in the space,
  `∫ |I(f) − Qₙ(Δ; f)|² dΔ ≤ e^sh(P)² ‖f‖²` [DKS, §5.2, p. 195]. Route:
  `|I(f) − Qₙ(Δ; f)| ≤ e(P + Δ) ‖f‖` by homogeneity of the error functional, then integrate. It
  holds for every reproducing kernel Hilbert space on the cube, with no kernel hypothesis: the
  Bochner integral is homogeneous without integrability, `∫ c f = c ∫ f`.
- **Lattice rules and the criterion** (`latticePoints`, `latticeCriterion`): the rank-one
  lattice `{k z/n}`, `k < n`, and
  `∑_{u ≠ ∅} γ_u n⁻¹ ∑_{k < n} ∏_{j ∈ u} B₂({k zⱼ/n})` [DKS, Lemma 5.5, (5.12) with `β = 0`,
  p. 198].
- **The shift-averaged error of a lattice rule** (`shiftAveragedError_latticePoints_sq`): in the
  unanchored space with any weights and `0 < n`, `e^sh(z)² = latticeCriterion n γ z` [DKS,
  Lemma 5.5, p. 198, with Theorem 5.3, p. 196 and Lemma 5.4, p. 197]. Route: by 3.2 and Fubini,
  `e^sh(P)²` is the worst-case error formula for the shift-averaged kernel
  `K^sh(x, y) = ∫ K({x + Δ}, {y + Δ}) dΔ = ∑_u γ_u ∏_{j ∈ u} B₂({xⱼ − yⱼ})`; for a lattice the
  differences `(i − k) z/n` run over the lattice `n` times each.

**Checks.**

- Computed for the weights of 3.2 with `n = 7`, `z = (1, 3)`: the average of `e(P + Δ)²` over
  `20000` random shifts is `0.005427`, against `latticeCriterion = 0.005425`.
- `s = 1`, `z = 1`: `latticeCriterion = γ₁ n⁻¹ ∑ₖ B₂(k/n) = γ₁/(6n²)` [DKS, p. 201] (computed
  for `n = 3, 7`).
- Negative control: without the shift average, `e(P)² = 0.0097945` for the same lattice, not the
  criterion; the criterion is the averaged quantity.

### 3.4 The component-by-component construction

- **Truncated weights and the construction** (`truncateWeights`, `IsCBC`): `z₁ = 1`, every
  component in `Uₙ = {z | 1 ≤ z ≤ n − 1, gcd(z, n) = 1}`, and each subsequent component minimizes
  the criterion in its dimension over `Uₙ`, the earlier components being fixed; every minimizer
  is admissible at a tie [DKS, Algorithm 5.6 and (5.14), p. 199].
- **The CBC bound** (`latticeCriterion_le_of_isCBC`, with `cbcConstant`): for `n ≥ 2`,
  nonnegative weights and every `λ ∈ (1/2, 1]`,
  `e^sh(z)² ≤ (φ(n)⁻¹ ∑_{u ≠ ∅} γ_u^λ (2ζ(2λ)/(2π²)^λ)^{|u|})^{1/λ}`, with `φ = Nat.totient`
  and `ζ(2λ) = ∑_{k ≥ 1} k^{−2λ}` as a real series [DKS, Theorem 5.8, (5.18), p. 202]. The
  source proves it by induction on the dimension, the chosen component being no worse than the
  average over `Uₙ`, with Jensen's inequality `(∑ aₖ)^λ ≤ ∑ aₖ^λ` and the Fourier series of `B₂`.
- **Product weights and prime `n`** (`sqrt_latticeCriterion_le_of_prime`): for prime `n` and
  `γ ≥ 0`, `e^sh(z) ≤ (n − 1)^{−1/(2λ)} exp(c_λ/(2λ) ∑_{j < s} γⱼ^λ)`, c_λ = 2ζ(2λ)/(2π²)^λ.
  Route: `∑_{u ≠ ∅} ∏_{j ∈ u} γⱼ^λ c^{|u|} = ∏ⱼ (1 + c γⱼ^λ) − 1 ≤ exp(c ∑ γⱼ^λ)` and
  `φ(n) = n − 1`.
- **Dimension-independent rate** (`exists_sqrt_latticeCriterion_le_rate`): for
  `0 < δ ≤ 1/2`, if `∑ⱼ γⱼ^{1/(2−2δ)} < ∞`, there is `C` with `e^sh(z) ≤ C n^{−1+δ}` for every
  dimension `s`, every prime `n` and every CBC vector `z` [DKS, p. 202]. Route: the previous bound
  with `λ = 1/(2 − 2δ)`, `1/(2λ) = 1 − δ` and `(n − 1)^{−(1−δ)} ≤ 2 n^{−(1−δ)}`.

**Checks.**

- Computed CBC vectors for `s = 4` and `n = 7, 13, 16, 31`, with product weights `(j + 1)^{−2}`
  and with random general weights: the bound holds at `λ = 0.55, 0.75, 1` in all 24 cases, for
  example `n = 31`, product weights, `λ = 1`: `3.94·10⁻⁴ ≤ 8.36·10⁻³`; the product-weight bound of
  `sqrt_latticeCriterion_le_of_prime` holds at the same primes.
- `cbcConstant 1 = 2ζ(2)/(2π²) = 1/6`, matching `∑ₖ B₂(k/n)/n = 1/(6n²)` up to `φ(n)`, and
  `B₂` is Mathlib's `Polynomial.bernoulli 2`.
- Negative control: at `λ = 1/2` the series `∑ k^{−1}` diverges, so `cbcConstant (1/2)` is the
  junk value `0` of a non-summable `tsum` and the bound would read `e^sh(z)² ≤ 0`, false already
  for `s = 1`, where `e^sh(z)² = γ₁/(6n²)`; the open endpoint is necessary.

## Layer 4: worst-case complexity and tractability

### 4.1 Algorithms, minimal errors and information complexity

- **Algorithms and errors** (`algorithmError`, `minimalError`, `initialError`,
  `informationComplexity`): for `S : E → G`, a set `F ⊆ E` and a class `Λ` of continuous linear
  functionals, an algorithm with `n` information operations is `φ ∘ N`, `N f = (L₁ f, …, Lₙ f)`
  with `Lᵢ ∈ Λ` and an arbitrary map `φ`; its worst-case error is `sup_{f ∈ F} ‖S f − φ(N f)‖`;
  the information complexity `n(ε)` is the least `n` for which some algorithm has error at most
  `ε`, or `⊤`; the normalized criterion replaces `ε` by `ε e₀` with
  `e₀ = sup_{f ∈ F} ‖S f‖` [NW, (4.3)–(4.5), p. 90; (4.49)–(4.50), p. 148]. `Λ^all` is
  `Set.univ` and `Λ^std` is the set of point evaluations (5.1).
- **Minimal error equals the approximation number** (`minimalError_closedBall_eq_singularValue`):
  for a bounded `S` from a Hilbert space to any normed space and `F` the unit ball,
  `e(n) = aₙ(S)` with `Λ^all` [NW, Corollary 4.12, p. 119, for compact `S` between Hilbert
  spaces]. Route: for given functionals, every `f` in the unit ball of their common kernel has
  the same information as `−f`, so the error is at least `‖S f‖` (the radius of information,
  [NW, Theorem 4.2, (4.6), p. 91]); the kernel is `V^⊥` for a subspace `V` of rank at most `n`,
  and Tau Ceti's `ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal` gives
  `aₙ(S) ≤ ‖S|_{V^⊥}‖`; conversely the algorithm `f ↦ S P_V f` with an orthonormal basis of `V`
  has error `‖S|_{V^⊥}‖`. Compactness is not needed for the equality.
- **The truncated singular expansion is optimal**
  (`exists_linear_algorithmError_eq_singularValue`): for compact `S` between Hilbert spaces some
  linear algorithm attains `aₙ(S)`, namely `Aₙ f = ∑_{i ≤ n} ⟪f, eᵢ⟫ S eᵢ` for orthonormal
  eigenvectors `eᵢ` of `S*S` with the `n` largest eigenvalues [NW, Corollary 4.12, p. 119].
  Route: Tau Ceti's spectral theorem for the compact self-adjoint `S*S`, and
  `ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue`.
- **Information complexity of a compact operator** (`informationComplexity_closedBall_eq`): for
  compact `S` between Hilbert spaces, `n(ε) = min{n | aₙ(S) ≤ ε}`, which is
  `min{n | λₙ₊₁ ≤ ε²}` in the one-based eigenvalues [NW, p. 157]. Route: the two previous
  targets.

**Checks.**

- No information: on the unit ball, the minimal error with `0` functionals is `‖S‖`, the
  initial error, since the best constant algorithm is `0` by symmetry of the ball, and the
  approximation number at `0` is `‖S‖`.
- `S` of rank `r`: `n(ε) ≤ r` for every `ε ≥ 0`, since `a_r(S) = 0`.
- Negative control: the identity on a Hilbert space of dimension `r` has `n(ε) = r` for
  `ε ∈ (0, 1)`; reading the formula with one-based singular values, the least `n` with
  `σₙ ≤ ε` would give `r + 1`. The zero-based `ContinuousLinearMap.singularValue` gives `r`.

### 4.2 Tractability

- **Polynomial, strong polynomial and weak tractability** (`IsPolynomiallyTractable`,
  `IsStronglyPolynomiallyTractable`, `IsWeaklyTractable`): `N d ε ≤ C d^q ε^{−p}` for all
  `d ≥ 1`, `ε ∈ (0, 1)`, with `q = 0` for strong tractability [NW, Definition 4.44, p. 149];
  `log N d ε/(ε⁻¹ + d) → 0` as `ε⁻¹ + d → ∞` [NW, (4.55), p. 151], in the exponential form of the
  Conventions. Dick–Kuo–Sloan's form of the definition quantifies over `ε ∈ (0, 1]` and asks for
  `n ≥ 1` [DKS, Definition 4.4, p. 186]; the two give the same notions, because `N` is
  antitone in `ε` (the endpoint `ε = 1` is covered by values just below it) and raising `N` to
  at least `1` only enlarges the constant `C`.

**Checks.**

- `N d ε = 2^d` is neither polynomially nor weakly tractable; `N d ε = d^5 ε^{−3}` rounded up is
  polynomially but not strongly polynomially tractable.
- Negative control: the logarithmic form, with `⊤` sent to `0` in `ℕ` and Mathlib's convention
  that the logarithm of `0` is `0`, would call the complexity `N ≡ ⊤` weakly tractable; the
  exponential form in `ℕ∞` rejects it.

### 4.3 Linear problems on Hilbert spaces

- **The tail constant** (`linearComplexity`, `tailConstant`): for a family `S_d` of operators
  between Hilbert spaces, `n(d, ε)` is the absolute-error complexity on the unit ball with
  `Λ^all`, and `C₂ = sup_{d ≥ 1} (∑_{j ≥ ⌈C₁ d^{q₁}⌉} λ_{d,j}^τ)^{1/τ} d^{−q₂}` in `ℝ≥0∞`, with
  `λ_{d,j} = a_{j−1}(S_d)²` one-based.
- **Polynomial tractability criterion** (`isPolynomiallyTractable_iff_tailConstant`): polynomially
  tractable iff `C₂ < ∞` for some `C₁ > 0`, `q₁, q₂ ≥ 0`, `τ > 0` [NW, Theorem 5.1, p. 157].
- **The bound** (`linearComplexity_le_of_tailConstant`): if `C₂ < ∞`, then
  `n(d, ε) ≤ (C₁ + C₂^τ) d^{max(q₁, q₂τ)} ε^{−2τ}` for `ε ∈ (0, 1]`, `d ≥ 1` [NW, Theorem 5.1,
  p. 157]. Route: `n(d, ε)` counts the `j` with `λ_{d,j} > ε²` (4.1); those below `⌈C₁ d^{q₁}⌉`
  number at most `C₁ d^{q₁}`, and the others at most `ε^{−2τ} ∑_{tail} λ^τ ≤ ε^{−2τ} C₂^τ d^{q₂τ}`.
- **Strong polynomial tractability criterion**
  (`isStronglyPolynomiallyTractable_iff_tailConstant`): strongly polynomially tractable iff
  `C₂ < ∞` with `q₁ = q₂ = 0` [NW, Theorem 5.1, p. 157].
- The source assumes compact nonzero `S_d`. Neither hypothesis is needed: `S_d = 0` has
  `n(d, ε) = 0` and an empty tail; a finite `C₂` forces `aₙ(S_d) → 0`, which makes `S_d` compact
  (Tau Ceti's `ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue`), and tractability
  forces it likewise.

**Checks.**

- `λ_{d,j} = j^{−2}` for every `d`, `C₁ = 1`, `τ = 1`, `q₁ = q₂ = 0`: `C₂ = π²/6`, and
  `n(d, ε) = #{j | j < 1/ε}` is `1, 9, 33` at `ε = 0.5, 0.1, 0.03`, below the bound
  `(1 + π²/6) ε^{−2}`.
- Negative control: `λ_{d,j} = 1` for `j ≤ d` and `0` after: `n(d, ε) = d`, polynomially but not
  strongly polynomially tractable; the criterion holds with `q₁ = 1` and fails with `q₁ = 0`
  for every `C₁`, since the tail from `⌈C₁⌉` contains `d − ⌈C₁⌉ + 1` ones.

### 4.4 Tensor product problems

- **Tensor complexity** (`tensorComplexity`): for one-dimensional eigenvalues `λ₁ ≥ λ₂ ≥ … ≥ 0`
  (zero-based `lam 0 ≥ lam 1 ≥ …` in Lean), the `d`-fold tensor product has the eigenvalues
  `λ_{j₁} ⋯ λ_{j_d}`, and its absolute-error complexity is the number of multi-indices with
  `λ_{j₁} ⋯ λ_{j_d} > ε²` [NW, p. 157 with §5.2, p. 176]. The Hilbert tensor product of operators
  has no carrier in Mathlib or Tau Ceti, so the targets are stated through this count; for an
  implemented tensor product, 4.1 identifies its complexity with the count.
- **Curse of dimensionality** (`two_pow_le_tensorComplexity`): if `λ₁ = λ₂ = 1`, then
  `n(d, ε) ≥ 2^d` for all `d` and `ε ∈ (0, 1)`, and the problem is not weakly tractable [NW,
  Theorem 5.5, pp. 176–177]. Route: the `2^d` multi-indices in `{1, 2}^d` have product `1`.
- **Tensor products with `λ₁ < 1`** (`tensorComplexity_tractable_iff`): if `λ₂ > 0` and
  `λ₁ < 1`, polynomial tractability, strong polynomial tractability and `λₙ = O(n^{−r})` for some
  `r > 0` are equivalent [NW, Theorem 5.5, p. 177].

**Checks.**

- `λ₁ = λ₂ = 1`, `λⱼ = (j + 1)^{−2}/2` after: the count at `ε = 0.9` is exactly `2^d` for
  `d ≤ 7` (computed).
- `λⱼ = (j + 1)^{−2}/2`, `λ₁ = 1/2 < 1`: at `ε = 0.1` the counts for `d = 1, …, 8` are
  `7, 8, 7, 5, 1, 1, 0, 0`, bounded in `d`, as strong tractability requires.
- Negative control: `λ₁ = 1`, `λ₂ = 1/2`, `λⱼ = 0` after: the counts are `2^d` for small `ε`,
  so the hypothesis `λ₁ < 1` of the equivalence cannot be dropped although `λₙ = O(n^{−r})`.

## Layer 5: tractability of integration in weighted spaces

### 5.1 The integration problem with function values

- **Standard information and the complexity** (`cubeIntegral`, `standardInformation`,
  `integrationComplexity`): `I_s(f) = ∫_{[0,1]^s} f` on the unit ball of the space `Hₛ`, with
  `Λ^std` the point evaluations `RKHS.eval`, and arbitrary, possibly nonlinear, algorithms using `n`
  function values [DKS, §4.5, p. 186]; [NW, (4.49), p. 148].

### 5.2 Characterizations for product weights

The weights are `γⱼ > 0`, the anchor is `c ∈ [0, 1]`, and `Hₛ` is any reproducing kernel Hilbert
space with the anchored kernel, respectively the unanchored kernel with product weights.

- **Strong polynomial tractability, anchored** (`isStronglyPolynomiallyTractable_anchored_iff`):
  iff `∑ⱼ γⱼ < ∞` [DKS, Theorem 4.5, p. 187].
- **Polynomial tractability, anchored** (`isPolynomiallyTractable_anchored_iff`): iff there is
  `C` with `∑_{j < s} γⱼ ≤ C log(s + 1)` for all `s ≥ 1` [DKS, Theorem 4.6, p. 187]. The source's
  condition that the upper limit of `∑_{j ≤ s} γⱼ / log(s + 1)` is finite is equivalent, since
  `log(s + 1) > 0` for `s ≥ 1`; the explicit constant avoids a real upper limit of an unbounded
  sequence.
- **Strong polynomial tractability, unanchored**
  (`isStronglyPolynomiallyTractable_unanchored_iff`) and **polynomial tractability, unanchored**
  (`isPolynomiallyTractable_unanchored_iff`): the same two characterizations [DKS, Theorems 4.5
  and 4.6, p. 187].
- Route for the upper bounds: by 3.2 and the averaging argument, some point set has
  `e(P)² ≤ n⁻¹ ∏ⱼ (1 + 2B γⱼ)` with `B = (c² − c + 1/2)/2` (anchored) or `1/12` (unanchored),
  hence `e(P) ≤ n^{−1/2} exp(B ∑_{j < s} γⱼ)` [DKS, Lemma 4.2, p. 184]; so
  `n(s, ε) ≤ ε^{−2} exp(2B ∑_{j<s} γⱼ) + 1`, which is bounded by `C ε^{−2}` when `∑ γⱼ < ∞` and by
  `C ε^{−2} s^{2BC'}` when `∑_{j<s} γⱼ ≤ C' log(s + 1)`. Route for the lower bounds: by Smolyak's
  theorem [NW, Theorem 4.7, p. 115] linear rules `∑ aᵢ f(tᵢ)` are optimal among all algorithms
  with the same nodes, for a linear functional on a balanced convex set. For the anchored kernel,
  which is nonnegative, [DKS, Lemma 4.3, p. 185] with the weighted rule in place of the
  equal-weight one gives `e² ≥ e₀² (1 − n κ_s²)`, with `κ_s → 0` exactly when `∑ γⱼ = ∞` and
  `κ_s` decaying like `exp(−c ∑_{j<s} γⱼ)`; since `e₀ ≥ 1` (the kernel is at least `1`), this
  bound for the normalized error also bounds the absolute one. The unanchored kernel is not
  nonnegative, and [DKS, p. 185] refers its lower bound to Sloan and Woźniakowski; a route is to
  split its one-dimensional kernel into a part supported on `[0, 1/2]²` and one on `[1/2, 1]²`
  (decomposable kernels) and argue on each part as for a nonnegative kernel.

**Checks.**

- Equal weights `γⱼ = 1`: `∑_{j < s} γⱼ = s` is not `O(log s)`, so neither space is polynomially
  tractable (a consequence of the second characterization, not stated separately).
- `γⱼ = 1/j` (one-based): `∑_{j ≤ s} 1/j ≤ 1 + log s`, so polynomially but not strongly
  polynomially tractable.
- Negative control: the criterion with the lattice-rule condition `∑ γⱼ^{1/2} < ∞` of 3.4 in
  place of `∑ γⱼ < ∞` is wrong: `γⱼ = j^{−3/2}` is summable with `∑ γⱼ^{1/2} = ∞`, and the
  problem is strongly polynomially tractable, at the Monte Carlo exponent `p = 2`.

## Layer 6: sparse grids

### 6.1 The hierarchical basis

- **Hat functions and increments** (`hat`, `hatFunction`, `hierarchicalIndices`,
  `incrementSpace`): `φ(t) = max(1 − |t|, 0)`, `φ_{l,i}(x) = ∏ⱼ φ(2^{lⱼ} xⱼ − iⱼ)`, the index set
  `I_l` of `i` with odd `iⱼ < 2^{lⱼ}`, and `W_l = span{φ_{l,i} | i ∈ I_l}` [BG, (3.7)–(3.9),
  p. 156; (3.11), (3.13), p. 157].
- **Dimension of an increment** (`finrank_incrementSpace`): for `l ≥ 1`, `dim W_l = 2^{|l|₁ − d}`
  [BG, (3.20), p. 158]. Route: the supports of the `φ_{l,i}`, `i ∈ I_l`, have disjoint
  interiors, so the functions are linearly independent, and `#I_l = ∏ⱼ 2^{lⱼ − 1}`.
- **Hierarchical surplus** (`stencilWeight`, `surplus`, `mixedSecondDerivative`,
  `mixedSupSeminorm`, `mixedL2Seminorm`, `VanishesOnBoundary`): `v_{l,i}` is the tensor product of
  the stencils `[−1/2, 1, −1/2]` at `x_{l,i}` with mesh `2^{−l}` [BG, (3.23), p. 159], and
  `|u|_{2,q} = ‖∂^{2d} u/∂x₁² ⋯ ∂x_d²‖_{L^q}` [BG, (3.3), p. 155].
- **Surplus bound** (`enorm_surplus_le`): for `u` of class `C^{2d}` on the closed cube and
  `i ∈ I_l`, `|v_{l,i}| ≤ 2^{−d} 2^{−2|l|₁} |u|_{2,∞}` [BG, Lemma 3.3, (3.26), p. 160]. Route:
  `v_{l,i} = ∫ ψ_{l,i} D^{(2,…,2)} u` with `ψ_{l,i} = ∏ⱼ (−2^{−(lⱼ+1)}) φ_{lⱼ,iⱼ}` [BG, Lemma 3.2,
  (3.24), p. 159], by two integrations by parts in each coordinate, and
  `‖ψ_{l,i}‖₁ = 2^{−d} 2^{−2|l|₁}`. The source states it for `u` zero on the boundary; the
  identity is local, so the boundary values are not needed (for `u = x²` in one variable,
  `v_{l,1} = −4^{−l}`, equal in modulus to the bound).
- Each such `u` that is zero on the boundary of the cube is the sum of its hierarchical
  components u_l = ∑_{i ∈ I_l} v_{l,i} φ_{l,i}, uniformly on the cube, with
  `‖u_l‖_∞ ≤ 2^{−d} 2^{−2|l|₁} |u|_{2,∞}`, `‖u_l‖₂ ≤ 3^{−d} 2^{−2|l|₁} |u|_{2,2}` and
  `‖u_l‖_E ≤ (2 · 12^{(d−1)/2})⁻¹ 2^{−2|l|₁} (∑ⱼ 4^{lⱼ})^{1/2} |u|_{2,∞}` [BG, (3.19), p. 158;
  Lemma 3.4, (3.27), p. 161]. These are the steps of 6.3 and carry no Lean name.

**Checks.**

- `u(x) = x(1 − x)` in one dimension: `|u|_{2,∞} = 2` and `v_{l,1} = 4^{−l}`, equal to the bound:
  the surplus bound is sharp.
- `d = 1`: `dim W_l = 2^{l−1}`, and the first increment is spanned by the single hat centred at
  `1/2`.
- Negative control: a level `lⱼ = 0` gives `I_l = ∅` and `W_l = 0`, while the formula, with the
  natural subtraction of `finrank_incrementSpace`, gives `2^0 = 1` for `d = 1`; the one-based
  levels are part of the statement.

### 6.2 The sparse-grid space

- **Spaces and interpolant** (`sparseLevels`, `fullLevels`, `sparseGridSpace`, `fullGridSpace`,
  `sparseGridInterpolant`, `sparseGridConstant`): `V_n^{(1)} = ⊕_{|l|₁ ≤ n+d−1} W_l`,
  `V_n^{(∞)} = ⊕_{|l|_∞ ≤ n} W_l`, the interpolant `u_n^{(1)} = ∑_{|l|₁ ≤ n+d−1} u_l`, and
  `A(d, n) = ∑_{k < d} C(n + d − 1, k)` [BG, (3.17), p. 158; (3.61), p. 172; (3.65), p. 174].
- **Dimension** (`finrank_sparseGridSpace`): for `d ≥ 1`,
  `dim V_n^{(1)} = ∑_{i < n} 2^i C(d − 1 + i, d − 1)`, and this equals
  `(−1)^d + 2^n ∑_{i < d} C(n + d − 1, i) (−2)^{d−1−i}` [BG, Lemma 3.6, (3.62), p. 173]. Route: 6.1
  and the count `C(i − 1, d − 1)` of `l ≥ 1` with `|l|₁ = i`; the closed form by differentiating the
  geometric sum `d − 1` times.
- **Asymptotic dimension** (`isBigO_finrank_sparseGridSpace`):
  `dim V_n^{(1)} = 2^n (n^{d−1}/(d − 1)! + O(n^{d−2}))`, which is `O(h_n^{−1} |log₂ h_n|^{d−1})` for
  h_n = 2^{−n} [BG, Lemma 3.6, (3.62)–(3.63), p. 173].
- **Full grid** (`finrank_fullGridSpace`): `dim V_n^{(∞)} = (2^n − 1)^d` [BG, (3.31), p. 163].

**Checks.**

- The two formulas of `finrank_sparseGridSpace` agree with the count `∑_{|l|₁ ≤ n+d−1} 2^{|l|₁−d}`
  for all `d ≤ 4`, `n ≤ 6` (computed); in two dimensions the dimensions are
  `1, 5, 17, 49, 129` for `n = 1, …, 5`, against `1, 9, 49, 225, 961` for the full grid.
- `d = 3`: `dim/2^n − n²/2 = −4.0, −9.0, −19.0, −39.0` at `n = 10, 20, 40, 80`, linear in `n`
  as `O(n^{d−2})` says.
- The interpolant interpolates: `u_n^{(1)}(x_{l,i}) = u(x_{l,i})` at every sparse-grid point,
  and `u_n^{(1)} ∈ V_n^{(1)}`.
- Negative control: `d = 0` would give dimension `1` (the constants on a point) against the
  formula's `2^n − 1`; the hypothesis `d ≥ 1` is used.

### 6.3 Interpolation error

- **`L^∞` and `L²` errors** (`sparseGrid_sup_l2_error_le`): for `u` of class `C^{2d}` on the
  closed cube and zero on its boundary,
  `‖u − u_n^{(1)}‖_∞ ≤ 2 |u|_{2,∞} 8^{−d} 2^{−2n} A(d, n)` and
  `‖u − u_n^{(1)}‖₂ ≤ 2 |u|_{2,2} 12^{−d} 2^{−2n} A(d, n)`, both `O(h_n² |log₂ h_n|^{d−1})` [BG,
  Theorem 3.8, (3.68), p. 176]. Route: `‖u − u_n^{(1)}‖ ≤ ∑_{|l|₁ > n+d−1} ‖u_l‖` [BG,
  (3.64), p. 174], the component bounds of 6.1, and
  `∑_{|l|₁ > n+d−1} 2^{−2|l|₁} ≤ 2 · 2^{−2n} 2^{−2d} A(d, n)` [BG, Lemma 3.7, (3.66), p. 174].
- **Energy error** (`sparseGrid_energy_error_le`): for the same `u`, the error is differentiable
  almost everywhere on the cube and
  `‖u − u_n^{(1)}‖_E ≤ d |u|_{2,∞} (2 · 3^{(d−1)/2} 4^{d−1})⁻¹ 2^{−n} = O(h_n)` [BG,
  Theorem 3.8, (3.68), p. 176]. Route: as above with the energy bound of 6.1 and
  `∑_{|l|₁ = i} (∑ⱼ 4^{lⱼ})^{1/2} ≤ d 2^i`. The source's second energy bound, in terms of
  `|u|_{2,2}`, is not stated.

**Checks.**

- `u = ∏ⱼ xⱼ(1 − xⱼ)` with `|u|_{2,∞} = |u|_{2,2} = 2^d`, and `u = ∏ⱼ sin(π xⱼ)`, for
  `d = 1, 2, 3` and `n ≤ 5` (`n ≤ 3` for `d = 3`): all three bounds hold (computed), for example
  `d = 2`, `n = 5`, `u = ∏ xⱼ(1 − xⱼ)`: `L^∞` error `2.32·10⁻⁴ ≤ 8.55·10⁻⁴`, `L²` error
  `1.36·10⁻⁴ ≤ 3.80·10⁻⁴`, energy error `5.21·10⁻³ ≤ 1.80·10⁻²`.
- `n = 0`: the interpolant is `0`, and the bounds become `‖u‖_∞ ≤ 2 · 2^{d−1} 8^{−d} |u|_{2,∞}`,
  which for `x(1 − x)` reads `1/4 ≤ 1/2`.
- Negative control: without `VanishesOnBoundary` the bounds fail for `u ≡ 1`, whose mixed
  derivative vanishes but whose interpolant is `0`, since every hat function vanishes on the
  boundary.

## Downstream consumers

- Monte Carlo and multilevel methods consume the equal-weight rule and the mean-square error of
  randomly shifted rules (3.3) for randomized quasi-Monte Carlo estimators.
- Quasi-Monte Carlo methods for elliptic problems with random coefficients consume the weighted
  spaces (3.1), the worst-case error formula (3.2) and the CBC bounds of 3.4, with weights chosen
  from the parametric regularity of the solution.
- Kolmogorov widths, greedy reduced bases and the complexity of parametric problems consume the
  algorithms, minimal errors and tractability notions of Layer 4.
- Sparse polynomial and sparse-grid approximation of parametric solutions, and sparse-grid
  discretizations of partial differential equations, consume Layer 6.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

1. **Discrepancy.** Local and star discrepancy, the Hlawka–Zaremba identity, the Hardy–Krause and
   Vitali variations, the Koksma–Hlawka inequality for smooth functions and for functions of
   bounded variation, in every dimension `s`.
2. **Low-discrepancy points.** The radical inverse, Halton and Hammersley point sets, `(t, m, s)`
   -nets and `(t, s)`-sequences, the van der Corput sequence, and their star discrepancy bounds
   and integration rates.
3. **Weighted spaces and lattice rules.** The anchored and unanchored kernels, their positivity
   and one-variable norms, the worst-case and initial errors of equal-weight rules, randomly
   shifted rank-one lattice rules, the shift-averaged error formula in the unanchored space, and
   the component-by-component bounds.
4. **Complexity.** Algorithms with linear information, minimal errors, information complexity,
   polynomial, strong polynomial and weak tractability, the optimality of the truncated singular
   expansion, the Novak–Woźniakowski criterion and the tensor-product dichotomies.
5. **Tractability of integration** in the weighted anchored and unanchored spaces with product
   weights.
6. **Sparse grids.** The hierarchical hat basis, surplus bounds, the sparse-grid and full-grid
   spaces and their dimensions, and the `L^∞`, `L²` and energy errors of sparse-grid interpolation.

The numbers are those of the layers below, and k.n names subsection `n` of Layer `k`.

**Not owned here.**
- The one-dimensional star discrepancy with strict cuts, its basic API, the Erdős–Turán
  inequality and Koksma's inequality for functions of bounded variation on `[0, 1]`, and
  equidistribution:
  [ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md) §2.7 (and
  §§2.1–2.5). This roadmap's `s`-dimensional statements specialize to them at `s = 1`.
- The maximum mean discrepancy and its supremum form:
  [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) §7.2; the Kolmogorov space
  and the double-integral formula: Tau Ceti.
- Reproducing kernel Hilbert spaces (Mathlib), approximation numbers and their min–max formula
  (Tau Ceti).
- The excess of one law over another in
  [FiniteSamplingDiscrepancy](../FiniteSamplingDiscrepancy/README.md), and the combinatorial
  discrepancy of set systems in the open roadmap CombinatorialDiscrepancy, are different notions
  sharing the word.
- One-dimensional quadrature rules, Peano kernels and composite rules belong to the open roadmap
  QuadratureRulesAndPeanoKernels, which excludes multidimensional and quasi-Monte Carlo rules.
- Monte Carlo estimators, variance reduction and multilevel Monte Carlo, Kolmogorov widths and
  reduced bases, and polynomial chaos belong to the Monte Carlo and model-reduction roadmaps of
  the same numerical-analysis family.

Boundary in one sentence: deterministic and randomly shifted equal-weight rules on the unit cube
with their discrepancy and kernel error theory, worst-case complexity with linear information,
and piecewise linear sparse grids are here; random sampling, digital constructions and
higher-order sparse grids are not.

## Exact supplier contracts

### From Mathlib

- **Reproducing kernels:** `RKHS`, `RKHS.kernel`, `RKHS.eval`, `RKHS.equiv`, `RKHS.OfKernel` and
  `RKHS.OfKernel.kernel_ofKernel` (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`).
- **Measures and integrals:** `MeasureTheory.Measure.pi`, `unitInterval` with its volume, the
  Lebesgue integral `∫⁻` and Bochner integral; `eVariationOn`.
- **Calculus:** `iteratedFDerivWithin`, `Asymptotics.IsBigO`.
- **Arithmetic:** `Nat.digits`, `Nat.nth` with `Nat.nth_prime_zero_eq_two`, `Nat.totient`,
  `Int.fract`, `Polynomial.bernoulli`, `Set.encard`, `Fintype.piFinset`, `Module.finrank`.
- **Operators:** `IsCompactOperator`.

### From Tau Ceti

- **Approximation numbers:** `ContinuousLinearMap.singularValue`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/Basic.lean`), the min–max formula
  `ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal` (`…/MinMax.lean`) and
  `ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue` (`…/Compact.lean`).
- **Positive semidefinite kernels:** `TauCeti.positiveDefiniteKernelOperator`,
  `TauCeti.posSemidef_positiveDefiniteKernelOperator` and `Matrix.PosSemidef.KolmogorovSpace`
  (`TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`);
  `Matrix.PosSemidef.kernelMeanEmbedding`, `Matrix.PosSemidef.integrable_kolmogorovFeature` and
  `Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq`
  (`TauCeti/Analysis/PositiveDefinite/Kernel/MeanEmbedding.lean`).

### From ProbabilisticAndMetricNumberTheory

[ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md) §2.7 owns
the one-dimensional star discrepancy with strict cuts of samples in `[0, 1)` and Koksma's
inequality with `eVariationOn`. Nothing of it is restated. The Checks of 1.1 and 1.3 record that
at `s = 1` this roadmap's discrepancy agrees with it on such samples and that
`hardyKrauseVariation_fin_one` turns `koksmaHlawka` into its Koksma inequality; no target here
depends on §2.7.

### From KernelsAndSpectralMethods

[KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) §7.2 supplies the identity of
the maximum mean discrepancy between two laws with the supremum of `∫ f dμ − ∫ f dν` over the
unit ball of the Kolmogorov space, for integrable feature maps, used in the route of 3.2 with
`μ` the volume of the cube and `ν` the empirical law of the points.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- Digital nets and sequences: the digital construction over finite fields, Sobol', Faure,
  Niederreiter and Niederreiter–Xing sequences, digital shifts and scrambling, and higher-order
  nets for smooth integrands [DKS, §6, pp. 228–262].
- Lattice rules beyond the unanchored CBC bound: the anchored bound with auxiliary weights [DKS,
  Theorem 5.9, p. 204], fast CBC, Korobov and extensible lattice sequences, and higher-order
  lattice rules for periodic spaces [DKS, §5].
- Infinite-dimensional integration and multilevel quasi-Monte Carlo [DKS, §7, pp. 263–273].
- Tractability of the star discrepancy, with the bound `n ≤ C s ε^{−2}` from random points
  [DKS, §4.6, p. 188].
- Tractability for the normalized criterion, for standard information in approximation problems,
  and in the average-case and randomized settings [NW, Chapters 4–6 and Volumes II–III].
- Higher-order and energy-based sparse grids, the combination technique, sparse-grid quadrature
  and adaptivity [BG, (3.71) and Lemma 3.9, p. 177; §4, pp. 188–218].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 8efdbf7, states targets of Layers 1, 3, 4 and 6 in the modules
`NASC/MonteCarlo.lean` and `NASC/ModelReduction.lean`, all with `sorry`: a real-valued star
discrepancy with closed boxes, the face derivative and the smooth Koksma–Hlawka inequality of 1.2
under a global smoothness hypothesis; the lattice criterion and the CBC bound of 3.4, with the
criterion as the definition; the count of sparse-grid points of 6.2; and the polynomial
tractability criterion of 4.3 for an abstract antitone null sequence, without the explicit bound.
None of these is proved there, so no target of this roadmap has a prior proof. Its modules are a
cited source, not the specification.

## References

- [DKS] J. Dick, F. Y. Kuo, I. H. Sloan, High-dimensional integration: the quasi-Monte Carlo way,
  *Acta Numerica* 22 (2013), 133–288, §§2–5.
- [Caf] R. E. Caflisch, Monte Carlo and quasi-Monte Carlo methods, *Acta Numerica* 7 (1998),
  1–49, §5.
- [NW] E. Novak, H. Woźniakowski, *Tractability of Multivariate Problems, Volume I: Linear
  Information*, EMS Tracts in Mathematics 6, European Mathematical Society, 2008, Chapters 4–5.
- [BG] H.-J. Bungartz, M. Griebel, Sparse grids, *Acta Numerica* 13 (2004), 147–269, §3.
