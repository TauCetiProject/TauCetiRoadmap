# Roadmap: thermodynamics of the Hopfield model with finitely many patterns

**Summary.** This roadmap studies the Hopfield model at positive temperature with a fixed number
`P` of patterns `ξ^1, …, ξ^P ∈ {±1}^N`: at inverse temperature `β` the spins `σ ∈ {±1}^N` have
probability proportional to `exp((β/2N) Σ_μ (Σ_i ξ^μ_i σ_i)²)`. The overlap `m_N ∈ ℝ^P` has
entries `(1/N) Σ_i ξ^μ_i σ_i`; `ν_N` is the law of the column `(ξ^μ_i)_μ` of a uniform site; for
a law `ν` on `{±1}^P`, `Φ_ν(m) = log 2 + Σ_η ν(η) log cosh(β⟪m, η⟫) − β‖m‖²/2`.

Headline theorems:

- *Hubbard–Stratonovich.* For `β ≥ 0`, the Boltzmann machine with these binary visible units and
  `P` standard Gaussian hidden units coupled by `√(β/N) ξ^μ_i` has the Hopfield law as visible
  marginal, Gaussian hidden units given the visible ones, independent visible units given the
  hidden ones, and total weight `(2π)^{P/2} Z_N(β)`, `Z_N` the sum of
  the weights above.
- *Free energy.* For `β ≥ 0` and `N ≥ 1`, `sup Φ_{ν_N} ≤ (1/N) log Z_N`, and `(1/N) log Z_N` is
  at most `max Φ_{ν_N}` over `[−1, 1]^P` plus `P log(N + 1)/N`; if `ν_N → ν`, then
  `(1/N) log Z_N → sup Φ_ν`.
- *Mattis states.* If `Σ_η ν(η)⟪m, η⟫² ≤ λ‖m‖²` for all `m` and `β ≥ 0`, then `Φ_ν` is at most
  the Curie–Weiss pressure at `βλ`, and if `β > 0` and `βλ ≤ 1` its only maximiser is `0`. For
  uniform `ν`, `P ≥ 1` and `β > 1`, the maximisers are exactly the `2P` points `±m*(β) e_μ`, with
  `m*(β)` the Curie–Weiss spontaneous magnetisation.
- *Overlaps.* If `ν_N → ν`, then for every real `β` the overlaps satisfy a large deviation
  principle at speed `N` with an explicit good rate; for `β > 0` its zeros are the maximisers of
  `Φ_ν`, and for every `ε > 0` the probability that `m_N` is at distance `≥ ε` from them is at
  most `e^{−cN}` for some `c > 0` and all large `N`.
- *Glauber dynamics.* If `P ≥ 1`, `ν_N` tends to the uniform law and `β > 1`, then
  `t_mix(1/4) ≥ e^{rN}` for some `r > 0` and all large `N`. For `N ≥ 1` sites, real symmetric
  couplings `J`, real `β` and `c > 0` with `Σ_{i≠v} tanh|β J_iv| ≤ 1 − c` at every site `v`, the
  dynamics of `∝ exp(β Σ_{i<j} J_ij σ_i σ_j)` has `t_mix(ε) ≤ ⌈N(log N + log(1/ε))/c⌉` for every
  `ε > 0`; for the Hopfield law, `c = 1 − |β|P` works when `|β|P < 1`.

The roadmap rests on HopfieldNetworks (Hebbian weights), CurieWeissModel (the one-dimensional
problem), LargeDeviations (Gärtner–Ellis and tilting) and MarkovChainMixing (Glauber dynamics,
bottlenecks, couplings). It extends the fast-mixing bounds of GlauberDynamicsOfTheIsingModel to
real couplings.

Layers: 1, the Hubbard–Stratonovich identity; 2, the free energy and the variational problem;
3, large deviations and concentration of the overlaps; 4, slow mixing (from Layers 2–3) and fast
mixing (by a coupling).

## Conventions

- **Configurations and patterns.** Sites form a finite type `ι` with `N = Fintype.card ι`;
  configurations are `x : ι → Bool` with spins `spin x i` (`−1` when `x i` is true;
  QuantumOptimization 1.1). Patterns are `ξ : Fin P → ι → Bool`, with `ξ^μ_i = spin (ξ μ) i`.
  Sequences of systems use `ξ : ∀ N : ℕ, Fin P → Fin N → Bool`, the `N`-th system on `Fin N`;
  no relation between the pattern matrices of different `N` is assumed.
- **The law.** `hopfieldLaw ξ β = gibbs (hopfieldEnergy (hebb ξ) 0) (β / N)`, with `gibbs` of
  SimulatedAnnealing 3.1 and `hopfieldEnergy`, `hebb` of HopfieldNetworks 1.1 and 4.1. The
  Hebbian weights there carry no factor `1/N` and have zero diagonal, so
  `hopfieldEnergy (hebb ξ) 0 x = PN/2 − ½ Σ_μ (Σ_i ξ^μ_i σ_i)²`; the constant `PN/2` cancels in
  `gibbs`, and `hopfieldLaw ξ β {x} ∝ exp(βN‖overlap ξ x‖²/2)`. The partition function
  `hopfieldPartition ξ β = Σ_x exp(βN‖overlap ξ x‖²/2)` includes the self-couplings: the
  normaliser of the Gibbs weights `exp(−(β/N) hopfieldEnergy)` is `e^{−βP/2}` times it. When
  `N = 0`, `β/N = 0` and the law is the point mass on the empty configuration.
- **Overlaps and column types.** `overlap ξ x ∈ EuclideanSpace ℝ (Fin P)` has entries
  `(1/N) Σ_i ξ^μ_i σ_i` (and is `0` when `N = 0`). The column type of site `i` is
  `η = (ξ μ i)_μ : Fin P → Bool`, with spin vector `spinVec η`; `columnFreq ξ η` is its frequency
  (`0` when `N = 0`). For weights `ν` on column types,
  `overlapCumulant ν t = Σ_η ν(η) log cosh⟪t, spinVec η⟫` and
  `pressureFunctional ν β m = log 2 + overlapCumulant ν (β m) − β‖m‖²/2`. "Uniform column types"
  means `ν = 2^{−P}` on each of the `2^P` types; then `Σ_η ν(η)⟪m, spinVec η⟫² = ‖m‖²`.
- **Gaussian–binary machine.** Hidden vectors are `z : Fin P → ℝ` with Lebesgue measure; the
  machine's density with respect to counting measure times Lebesgue measure is
  `exp(−‖z‖²/2 + Σ_μ z_μ √(β/N) Σ_i ξ^μ_i σ_i)`. This is the model of Barra–Bernacchia–
  Santucci–Contucci after the rescaling `z ↦ √β z` (their hidden variance is `1/β`) and with the
  Hopfield coupling divided by `N`.
- **Curie–Weiss objects.** `freeEnergy`, `pressure` and `spontaneousMagnetization` are those of
  CurieWeissModel 1.2: `pressure β 0 = max over m ∈ [−1, 1] of (βm²/2 + binEntropy((1 + m)/2))`,
  and `m*(β)` is the largest solution in `[0, 1]` of `tanh(βm) = m`.
- **Large deviations.** `LargeDeviationPrinciple` is RandomMatrices 9.1 and `IsGoodRateFunction`,
  `legendreRate` are LargeDeviations 1.1 and 4.1, copied verbatim. Laws of overlaps are measures on
  `EuclideanSpace ℝ (Fin P)` with its Borel σ-algebra; the speed is `N`.
- **Dynamics.** `glauber`, `tvToStationary` and `mixingTime` are MarkovChainMixing 6.1, 1.2 and
  1.3: the non-lazy heat-bath dynamics that resamples a uniform site from its conditional law,
  total variation normalised as `tvDist/2`, and `t_mix(ε)` the least `t` with `d(t) ≤ ε`.

## Layer 1: the Gaussian–binary machine

### 1.1 The Hubbard–Stratonovich identity

Define `overlap`, `hopfieldPartition`, `hopfieldLaw`, the hidden means
`hiddenMean ξ β x μ = √(β/N) Σ_i ξ^μ_i σ_i(x)`, the visible fields
`visibleField ξ β z i = √(β/N) Σ_μ z_μ ξ^μ_i`, the density `gaussBinaryWeight`, the normalised
joint law `gaussBinaryLaw`, and the two conditional kernels: `hiddenKernel` (given `x`, independent
Gaussians `N(hiddenMean ξ β x μ, 1)`) and `visibleKernel` (given `z`, independent spins with
`P(σ_i = 1) = (1 + tanh(visibleField ξ β z i))/2`).

Prove `gaussBinaryLaw_hubbardStratonovich`: for `β ≥ 0`,

- the total weight is `∫ gaussBinaryWeight = (2π)^{P/2} hopfieldPartition ξ β`;
- `gaussBinaryLaw ξ β = hopfieldLaw ξ β ⊗ₘ hiddenKernel ξ β`: the visible marginal is the
  Hopfield law and the hidden units given `x` are independent Gaussians of variance `1` around
  `√(βN) m_N(x)`;
- read from the hidden side, the law is its hidden marginal followed by `visibleKernel ξ β`;
- the hidden marginal is the law of `hiddenMean ξ β X + G`, with `X` Hopfield and `G` an
  independent standard Gaussian vector of `ℝ^P`.

(Barra–Bernacchia–Santucci–Contucci, arXiv:1105.2790v3, (2)–(3) p. 3, (4)–(5) p. 4 and the
Gaussian identity (9) with (10)–(11), p. 6, in their normalisation; Bovier–Gayrard,
arXiv:cond-mat/9607103, (5.14), p. 36, for the hidden marginal as the Gaussian smoothing of the
overlap law. Proved here at finite `N` with the stated normalisation, `N = 0` and `P = 0`
included.)

Route.

- For fixed `x`, the `z`-integral factors over `μ` (`MeasureTheory.integral_fintype_prod_eq_prod`,
  with `volume` on `Fin P → ℝ` the product measure); each factor is
  `∫ exp(−t²/2 + a t) dt = √(2π) e^{a²/2}` with `a = hiddenMean ξ β x μ` (Mathlib
  `integral_cexp_quadratic`, or `ProbabilityTheory.mgf_gaussianReal` at the standard Gaussian),
  and `Σ_μ a²/2 = (β/2N) Σ_μ (Σ_i ξ^μ_i σ_i)² = βN‖m_N(x)‖²/2`, which uses `√(β/N)² = β/N`, true
  for `β ≥ 0`. Summing over `x` gives the total weight.
- Completing the square, `gaussBinaryWeight ξ β x z = e^{‖a‖²/2} · exp(−‖z − a‖²/2)`, so the
  joint density is the Hopfield weight of `x` times the Gaussian density around `a`; this is the
  first decomposition, and its first marginal is the Hopfield law since `hiddenKernel` is Markov.
  The Hopfield weight is `hopfieldLaw` by the energy identity of the Conventions.
- Given `z`, the density is proportional to `Π_i exp(σ_i visibleField ξ β z i)`, whose
  normalised factors are `(1 + σ_i tanh(visibleField ξ β z i))/2`; this is the second
  decomposition (Bayes on explicit densities).
- The first decomposition writes the hidden vector as `a(X)` plus an independent standard
  Gaussian vector, which is the convolution in the last clause.

**Checks.**

- `N = 2`, `P = 1`, `ξ^1 = (1, 1)`: the overlaps of the four configurations are `1, 0, 0, −1`,
  so `hopfieldPartition = 2e^β + 2` and the total weight is `√(2π)(2e^β + 2)`. The Hebbian
  weight matrix is `[[0, 1], [1, 0]]` and `hopfieldEnergy` at `σ = (1, 1)` is `−1 = PN/2 − ½·2²`.
- `P = 0`: the hidden space is a point, the total weight is `1 · 2^N` and both sides of the first
  clause are `2^N`; the hidden marginal is the point mass.
- `β ≥ 0` is needed: for `β < 0`, `Real.sqrt (β/N) = 0`, so the machine is the uniform law times
  the Gaussian, while for the example above at `β = −1` the Hopfield law gives the aligned
  configurations mass `e^{−1}/(2e^{−1} + 2) ≠ 1/4`. (The antiferromagnetic case needs an
  imaginary coupling.)
- Conditional law of a visible unit: for `N = 1`, `P = 1`, `ξ^1 = (1)`, the density in `σ` is
  `exp(σ √β z)`, so `P(σ = 1 | z) = e^{√β z}/(e^{√β z} + e^{−√β z}) = (1 + tanh(√β z))/2`; with
  the convention of QuantumOptimization this is the value `false`.

*Needs:* Conventions (`hopfieldEnergy`, `hebb`, `gibbs`); Mathlib
`MeasureTheory.integral_fintype_prod_eq_prod`, `integral_cexp_quadratic`,
`ProbabilityTheory.gaussianReal`, `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.compProd`,
`ProbabilityTheory.Kernel.ofFunOfCountable`, `ProbabilityTheory.Kernel.withDensity`,
`MeasureTheory.Measure.conv`.

### Examples

- One pattern is the Curie–Weiss model (the Mattis gauge). For `P = 1` and `N ≥ 1`, the bijection
  `x ↦ (i ↦ xor (x i) (ξ 0 i))` of configurations multiplies each spin by `spin (ξ 0) i`, so it maps
  `Σ_i spin x i` to `N m_N`, and it pushes `curieWeiss N β 0` of CurieWeissModel 1.1 to
  `hopfieldLaw ξ β` (both laws are `∝ exp(β M²/2N)` in the respective
  variables). It commutes with single-site resampling, so it conjugates the two Glauber
  dynamics, and `hopfieldPartition ξ β = partitionFunction N β 0`. Hence CurieWeissModel 3.1,
  4.1, 4.2 and 5.1 hold verbatim for the one-pattern Hopfield model; the theorems of Layers 2–4
  are their analogues for every `P`.
- The polynomial identity behind the gauge: for `N = 3`, `Σ_σ q^{(ξ·σ)²} = 2q^9 + 6q` for every
  `ξ ∈ {±1}^3`, the same as for `ξ = (1, 1, 1)`.

### Dependencies

1.1 uses HopfieldNetworks 1.1 and 4.1, SimulatedAnnealing 3.1, QuantumOptimization 1.1; the
Examples use CurieWeissModel 1.1, 3.1, 4.1, 4.2, 5.1.

## Layer 2: the free energy with finitely many patterns

### 2.1 The free-energy sandwich and its limit

Define `columnFreq`, `spinVec`, `overlapCumulant` and `pressureFunctional` as in the
Conventions.

- Prove `pressureFunctional_columnFreq_le_log_div`: for `N ≥ 1`, `β ≥ 0` and every `m ∈ ℝ^P`,
  `Φ_{ν_N}(m) ≤ (1/N) log Z_N(β)`, where `ν_N = columnFreq ξ` and `Z_N = hopfieldPartition ξ β`.
- Prove `exists_log_hopfieldPartition_div_le`: for every real `β` some `m` in the cube
  `[−1, 1]^P` has `(1/N) log Z_N(β) ≤ Φ_{ν_N}(m) + P log(N + 1)/N`.
- Prove `tendsto_log_hopfieldPartition_div`: if `columnFreq (ξ N) η → ν(η)` for every column
  type `η`, then for `β ≥ 0`, `(1/N) log Z_N(β) → sup_m Φ_ν(m)`.

(Bovier–Gayrard, §3.1, (3.1)–(3.2), p. 18, note that for a fixed number of patterns the large
deviations of the tilted overlap laws follow from Varadhan's lemma; their p. 3 recalls that for
random patterns with `P/N → 0` the free energy is that of the Curie–Weiss model. Proved here: the
elementary sandwich below replaces Varadhan's lemma.)

Route.

- Product identity: for `t ∈ ℝ^P`, `Σ_x exp(N⟪t, m_N(x)⟫) = Π_i 2 cosh⟪t, c_i⟫`, where `c_i`
  is the spin vector of the column type of site `i`; so
  `(1/N) log Σ_x exp(βN⟪m, m_N(x)⟫) = log 2 + overlapCumulant ν_N (βm)`.
- Lower bound: `‖a‖²/2 ≥ ⟪m, a⟫ − ‖m‖²/2`, applied to `a = m_N(x)` and multiplied by `βN ≥ 0`,
  gives `Z_N ≥ e^{−βN‖m‖²/2} Σ_x exp(βN⟪m, m_N(x)⟫)`.
- Upper bound: group the configurations by the value `m` of `m_N(x)`; each coordinate lies in
  `{−1, −1 + 2/N, …, 1}`, so there are at most `(N + 1)^P` values, all in the cube. For
  `m_N(x) = m`, `βN‖m‖²/2 = βN⟪m, m_N(x)⟫ − βN‖m‖²/2`, so the group of `m` contributes at most
  `exp(N Φ_{ν_N}(m))`; no sign of `β` is used.
- Limit: `Φ_{ν_N} → Φ_ν` uniformly on bounded sets (finitely many column types, and
  `|log cosh u| ≤ |u|`). For `β > 0`, `Φ_ν` tends to `−∞` at infinity, so it attains its
  supremum, and every maximiser satisfies the stationarity equation
  `m = Σ_η ν(η) spinVec η tanh(β⟪m, spinVec η⟫)`, hence lies in the cube. So
  `sup_{ℝ^P} Φ_ν = max over the cube of Φ_ν`, and both halves of the sandwich converge to it; for
  `β = 0` every term is `log 2`.

**Checks.**

- `N = 1`, `P = 1`: `Z_1 = 2e^{β/2}`. The lower bound reads
  `log 2 + log cosh(βm) − βm²/2 ≤ log 2 + β/2`, true since `log cosh u ≤ |u|` and
  `β|m| − βm²/2 ≤ β/2`. The upper bound at `m = 1` reads
  `log 2 + β/2 ≤ 2 log 2 + log cosh β − β/2`, that is `e^β ≤ e^β + e^{−β}`.
- `β = 0`: every side is `log 2`, the upper bound up to the term `P log(N + 1)/N`.
- `N ≥ 1` is needed in the lower bound: on no sites `log Z/N = 0` while `Φ(0) = log 2`.
- `β ≥ 0` is needed in the lower bound and in the limit: at `N = 1`, `P = 1`, `β = −1`,
  `(1/N) log Z = log 2 − 1/2 < log 2 = Φ(0)`. For the limit, at `P = 1` and `β = −1` every
  `Φ_ν(m) ≥ log 2 + m²/2` is unbounded, so `⨆ Φ_ν` is the junk value `0`, while
  `‖m_N‖² ≤ 1` gives `(1/N) log Z_N ≥ log 2 − 1/2 > 0` for every `N ≥ 1`.
- `P = 1`: by the Mattis gauge of Layer 1, the limit is `pressure β 0`, in agreement with
  CurieWeissModel 3.1 at `h = 0`.

*Needs:* 1.1 (`overlap`, `hopfieldPartition`); Mathlib `Real.cosh_le_exp_half_sq`,
`IsCompact.exists_isMaxOn`.

### 2.2 The variational problem: the Curie–Weiss bound and the Mattis states

- Prove `pressureFunctional_le_pressure`: let `ν ≥ 0` with `Σ_η ν(η) = 1`, let `λ` satisfy
  `Σ_η ν(η)⟪m, spinVec η⟫² ≤ λ‖m‖²` for all `m` (for instance the largest eigenvalue of the
  covariance `Σ_η ν(η) spinVec η spinVec ηᵀ`), and `β ≥ 0`. Then
  `pressureFunctional ν β m ≤ pressure (βλ) 0` for every `m`; and if `0 < β` and `βλ ≤ 1`, then
  `pressureFunctional ν β m < log 2 = pressureFunctional ν β 0` for every `m ≠ 0`.
- Prove `isMaxOn_pressureFunctional_uniform_iff`: for uniform column types, `P ≥ 1` and `β > 1`,
  `sup_m Φ(m) = pressure β 0`, and `m` is a maximiser exactly when `m = ±m*(β) e_μ` for some `μ`
  (`EuclideanSpace.single μ (± spontaneousMagnetization β)`), the `2P` Mattis states.

(Bovier–Gayrard, (6.4) and (6.7), p. 40, the Curie–Weiss function, and Lemma 6.3 with
Proposition 6.4, p. 43, which prove a quantitative form in expectation over i.i.d. symmetric
patterns, the minimum attained only at `±x* e_μ`. Proved here: the concavity route below, for
deterministic column-type laws.)

Route.

- One-dimensional duality: for `b ≥ 0`,
  `log 2 + sup_u (log cosh(bu) − bu²/2) = pressure b 0`, with the same maximisers. At a critical
  point `tanh(bu) = u`, and for `u = tanh h` one has `binEntropy((1 + u)/2) = log(2 cosh h) − hu`,
  so `log 2 + log cosh(bu) − bu²/2 = bu²/2 + binEntropy((1 + u)/2)`. Both sides attain their
  suprema at such points: the left one because it tends to `−∞` for `b > 0` and its derivative
  is `b(tanh(bu) − u)`, and `pressure b 0 = −min freeEnergy b`, whose minimisers on `[−1, 1]`
  solve `tanh(bm) = m` by CurieWeissModel 2.1 and 2.2 (`b = 0` is direct). The maximisers are `0`
  for `b ≤ 1` and `±m*(b)` for `b > 1` by CurieWeissModel 2.1
  (`TauCetiRoadmap.CurieWeissModel.setOf_tanh_mul_eq_self_of_le_one`)
  and 2.2 (`TauCetiRoadmap.CurieWeissModel.spontaneousMagnetization_spec`).
- Concavity: for `b ≥ 0`, `g(t) = log cosh(b√t)` is concave and nondecreasing on `[0, ∞)`, and
  strictly concave for `b > 0`, since `g′(t) = b tanh(b√t)/(2√t)` and `tanh y / y` is strictly
  decreasing on `(0, ∞)`.
- Jensen (`ConcaveOn.le_map_sum`), with `b = β`:
  `overlapCumulant ν (βm) = Σ_η ν(η) g(⟪m, spinVec η⟫²)`, which is at most
  `g(Σ_η ν(η)⟪m, spinVec η⟫²) ≤ g(λ‖m‖²) = log cosh(β√λ ‖m‖)`, and
  `log cosh(β√λ ‖m‖) − β‖m‖²/2` is the one-dimensional function at inverse temperature `βλ`
  (substitute `w = ‖m‖/√λ`; for `P ≥ 1` the hypothesis at any `m ≠ 0` forces `λ > 0`, and for
  `P = 0` the space is a point, `Φ_ν = log 2` and `pressure (βλ) 0 ≥ log 2`, its value at `0`).
  This gives the bound. For `0 < β`, `βλ ≤ 1` and `m ≠ 0`, `log cosh y < y²/2`
  for `y ≠ 0` gives the strict inequality.
- Mattis states: for uniform `ν`, `λ = 1`, so `Φ ≤ pressure β 0`, with equality at `±m* e_μ` by
  the one-dimensional duality (only one term of the sum is nonzero there). Equality at `m`
  requires equality in Jensen for the strictly concave `g` (`StrictConcaveOn.lt_map_sum`), so
  `⟪m, s⟫²` takes one value on all `s ∈ {±1}^P`; flipping `s_μ` changes it by
  `±4 m_μ Σ_{ν≠μ} m_ν s_ν`, which forces at most one nonzero coordinate; then the one-dimensional
  maximisers give `±m* e_μ`.

**Checks.**

- Uniform column types, `P = 2`: `⟪m, s⟫²` takes the values `(m_1 + m_2)²` and `(m_1 − m_2)²`,
  each with probability `½`; its mean is `‖m‖²` (so `λ = 1`) and its variance is `4m_1²m_2²`,
  zero exactly on the coordinate axes.
- A mixed state is strictly worse: at `m = (u, u)`, `Φ(m) = log 2 + ½ log cosh(2βu) − βu²`,
  while the Mattis direction of the same norm gives `log 2 + log cosh(√2 βu) − βu²`; the first is
  smaller for `u ≠ 0` because `2 cosh 2y − 1 < cosh(2√2 y)` for `y ≠ 0` (Taylor coefficients:
  `2·4^k < 8^k` for `k ≥ 2`, equal for `k ≤ 1`).
- `λ` is sharp: for two equal patterns the column types are `(1, 1)` and `(−1, −1)` with any
  weights; then `λ = 2` and `Φ(u, u) = log 2 + log cosh(2βu) − (2β)u²/2`, so
  `sup Φ = pressure (2β) 0`, which exceeds `log 2` for `½ < β ≤ 1`: the high-temperature clause
  needs `βλ ≤ 1`, not `β ≤ 1`.
- `0 < β` is needed for uniqueness: at `β = 0`, `Φ ≡ log 2`. `β ≥ 0` is needed in the bound: for
  `β < 0` and `P ≥ 1`, `Φ_ν(m) ≥ log 2 + |β| ‖m‖²/2` is unbounded.
- In the second theorem `1 < β` is the case with Mattis states: for `0 < β ≤ 1`,
  `spontaneousMagnetization β = 0` and the same statement holds with the single maximiser `0` (the
  first theorem with `λ = 1`), and at `β = 0` it fails, every point being a maximiser.
- `1 ≤ P` is needed in the second theorem: for `P = 0` the space is a point, the maximiser is
  `0`, and there are no Mattis states.

*Needs:* 2.1 (`pressureFunctional`); CurieWeissModel 1.2 (`freeEnergy`, `pressure`,
`spontaneousMagnetization`), 2.1, 2.2; Mathlib `ConcaveOn.le_map_sum`,
`StrictConcaveOn.lt_map_sum`, `Real.binEntropy`, `Real.cosh_le_exp_half_sq`,
`EuclideanSpace.single`.

### Examples

- Random patterns: if the columns `c_0, c_1, …` are independent and uniform on `{±1}^P` and the
  `N`-th system uses `c_0, …, c_{N−1}`, then almost surely `columnFreq → 2^{−P}` for every type
  (the strong law, `ProbabilityTheory.strong_law_ae`, for the indicators of each type), and 2.1
  and 2.2 give `(1/N) log Z_N → pressure β 0` for every `β ≥ 0`: the free energy of the
  Curie–Weiss model.
- Mean-field equations: the maximisers of `Φ_ν` solve
  `m = Σ_η ν(η) spinVec η tanh(β⟪m, spinVec η⟫)`, for `P = 1` the Curie–Weiss equation
  `m = tanh(βm)`.

### Dependencies

2.1 uses 1.1; 2.2 uses 2.1 and CurieWeissModel 1.2, 2.1, 2.2.

## Layer 3: large deviations and concentration of the overlaps

### 3.1 The large deviation principle of the overlaps

Define `overlapRate ν β m = Λ_ν*(m) − β‖m‖²/2 + sup_y (β‖y‖²/2 − Λ_ν*(y))`, formed in `EReal`
and returned to `ℝ≥0∞`, where `Λ_ν* = legendreRate Λ_ν` is the Legendre transform of
`Λ_ν = overlapCumulant ν`. Prove `largeDeviationPrinciple_overlap`: if
`columnFreq (ξ N) η → ν(η)` for every `η`, then for every real `β` the laws
`(hopfieldLaw (ξ N) β).map (overlap (ξ N))` satisfy `LargeDeviationPrinciple` at speed `N` with
rate `overlapRate ν β`, and the rate is good.

(Bovier–Gayrard, §3.1, (3.1)–(3.2), p. 18, for fixed `P` with a reference to Varadhan's lemma;
the instance here, with the explicit cumulant and the truncation, is proved here.)

Route.

- Uniform reference: under the uniform law of configurations (`hopfieldLaw (ξ N) 0`), the
  factorisation `Σ_x exp(N⟪t, m_N(x)⟫) = Π_i 2 cosh⟪t, c_i⟫` (the first step of the route of 2.1)
  gives `N^{−1} log ∫ exp(N⟪t, m⟫) = overlapCumulant (columnFreq (ξ N)) t` for `N ≥ 1`, which
  tends to `Λ_ν(t)` for every `t`.
- `Λ_ν` is finite, convex, smooth and continuous on `ℝ^P`, so the hypotheses of
  `TauCetiRoadmap.LargeDeviations.gartnerEllis` (LargeDeviations 5.3) hold: `0` is interior to
  `{Λ_ν < ⊤} = ℝ^P`, `IsEssentiallySmoothSteep Λ_ν` holds with an empty frontier, and `Λ_ν` is
  lower semicontinuous. So the uniform overlap laws satisfy the principle with the good rate
  `Λ_ν*`. Since `log cosh u ≤ |u|`, `Λ_ν(t)` is at most the support function
  `Σ_η ν(η)|⟪t, spinVec η⟫|` of the compact convex set
  `Z_ν = {Σ_η ν(η) a_η spinVec η | a_η ∈ [−1, 1]}`, so `Λ_ν*` is `⊤` off `Z_ν` (separate a point
  from `Z_ν` by some `t` and scale it), and `Z_ν` lies in the cube.
- The overlaps lie in the cube, where `‖m‖² ≤ P`, and so does `Z_ν`. With the bounded
  continuous function `F(m) = (β/2) min(‖m‖², P)`, the Hopfield overlap law is the tilt
  `(uniform overlap law).tilted (N · F)`, because `hopfieldLaw {x} ∝ exp(βN‖m_N(x)‖²/2)`.
- `TauCetiRoadmap.LargeDeviations.LargeDeviationPrinciple.tilted` (LargeDeviations 2.4) gives
  the principle with rate `Λ_ν* − F + sup(F − Λ_ν*)`. Off `Z_ν` both rates are `⊤`, and on it
  `F = β‖·‖²/2`, so the rate is `overlapRate ν β`.
- Goodness: `overlapRate ν β` is lower semicontinuous (it is the rate of a principle) and its
  sublevel sets lie in the compact set `Z_ν`, so they are compact.

**Checks.**

- `P = 1`: for every probability vector `ν`, `Λ_ν(t) = log cosh t` and
  `Λ_ν*(m) = ((1 + m)/2) log(1 + m) + ((1 − m)/2) log(1 − m) = log 2 − binEntropy((1 + m)/2)`
  on `[−1, 1]`; then `overlapRate ν β m = freeEnergy β m + pressure β 0`, the rate function of
  CurieWeissModel 1.2 at `h = 0`, for every real `β`, and `⊤` for `|m| > 1`.
- `β = 0`: the rate is `Λ_ν*`, Cramér's rate for a sum of independent symmetric signs with column
  weights `ν`; it vanishes only at `∇Λ_ν(0) = 0`.
- Truncation: without it `β‖m‖²/2` is not bounded on `ℝ^P`, and the tilting theorem would not
  apply; on the cube the two functions agree.

*Needs:* 2.1 (`overlapCumulant`, the product identity); LargeDeviations 1.1
(`IsGoodRateFunction`), 2.4 (`LargeDeviationPrinciple.tilted`), 4.1 (`legendreRate`), 5.3
(`IsEssentiallySmoothSteep`, `gartnerEllis`); RandomMatrices 9.1 (`LargeDeviationPrinciple`);
Mathlib `MeasureTheory.Measure.tilted`; Tau Ceti `TauCeti.fenchelConjugate`.

### 3.2 The zeros of the rate and concentration

Prove `setOf_overlapRate_eq_zero`: if `columnFreq (ξ N) η → ν(η)` for every `η` and `β > 0`, then

- the zeros of `overlapRate ν β` are exactly the maximisers of `pressureFunctional ν β`;
- for every `ε > 0` there is `c > 0` such that for all large `N` the Hopfield probability that
  `m_N` is at distance at least `ε` from the maximisers of `Φ_ν` is at most `e^{−cN}`.

The limit `ν` is a probability vector, and every probability vector on the column types is such a
limit (give `⌊Nν(η)⌋` sites the type `η` for each `η` and the remaining sites one fixed type), so
the first clause holds for every probability vector `ν`.

For uniform column types this is concentration on `{0}` for `0 < β ≤ 1` (2.2, first theorem with
`λ = 1`) and on the `2P` Mattis states for `β > 1` and `P ≥ 1` (2.2, second theorem); for
`P = 1` it is CurieWeissModel 4.1 and 4.2 at the level of exponential rates. (Proved here.)

Route.

- With `J(y) = Λ_ν*(y) − β‖y‖²/2`, `overlapRate ν β m = 0` exactly when `m` minimises `J`.
- Fenchel–Young (Tau Ceti `TauCeti.sub_le_fenchelConjugate`): `Λ_ν(βy) + Λ_ν*(y) ≥ β‖y‖²`, so
  `J(y) ≥ −(Φ_ν(y) − log 2) ≥ −(sup Φ_ν − log 2)`.
- If `m` maximises `Φ_ν` (one exists: `Φ_ν` is continuous and, since `Λ_ν(t) ≤ √P ‖t‖`, tends to
  `−∞` at infinity), stationarity gives `∇Λ_ν(βm) = m`. The convex
  differentiable `Λ_ν` lies above its tangent at `βm`, so `⟪s, m⟫ − Λ_ν(s) ≤ ⟪βm, m⟫ − Λ_ν(βm)`
  for every `s`, and Tau Ceti `TauCeti.fenchelConjugate_le` gives equality in Fenchel–Young at
  `(βm, m)`; hence `J(m) = −(sup Φ_ν − log 2)`: `m` minimises `J`.
  Conversely, a minimiser `m` of `J` has `Φ_ν(m) − log 2 ≥ −J(m) = sup Φ_ν − log 2` by the
  Fenchel–Young inequality, so it maximises `Φ_ν`.
- The set `{m | dist(m, argmax Φ_ν) ≥ ε}` is closed and contains no zero of the good rate, so
  `TauCetiRoadmap.LargeDeviations.LargeDeviationPrinciple.exists_pos_eventually_log_le`
  (LargeDeviations 1.2) with 3.1 and the first clause gives the exponential bound for the overlap
  laws, which is the bound on the preimage of that set under `overlap (ξ N)`.

**Checks.**

- `β > 0` is needed in the first clause: for `P ≥ 1` and `β = 0`, `Φ_ν ≡ log 2` has every point
  as a maximiser, while the rate vanishes only at `0` (3.1, Check).
- `P = 1`, `β = 2`: the zeros of `freeEnergy 2 m + pressure 2 0` on `[−1, 1]` are `±m*(2)`
  (CurieWeissModel 2.2), the maximisers of `log 2 + log cosh(2m) − m²` by the duality of 2.2.

*Needs:* 2.1, 2.2 (the duality and the maximisers), 3.1; LargeDeviations 1.2
(`TauCetiRoadmap.LargeDeviations.LargeDeviationPrinciple.exists_pos_eventually_log_le`); Tau Ceti
`TauCeti.sub_le_fenchelConjugate`, `TauCeti.fenchelConjugate_le`; Mathlib `Metric.infDist`.

### Examples

- Uniform patterns at `β = 3/2`, `P = 3`: the overlap concentrates exponentially fast near the six
  points `±m*(3/2) e_μ`, and near none of the mixed points such as `m*(e_1 + e_2)/√2`.

### Dependencies

3.1 uses 1.1, 2.1, LargeDeviations 1.1, 2.4, 4.1, 5.3 and RandomMatrices 9.1; 3.2 uses 2.1, 2.2,
3.1 and LargeDeviations 1.2.

## Layer 4: the Glauber dynamics

### 4.1 Slow mixing at low temperature

Prove `exp_le_mixingTime_glauber_hopfieldLaw`: if `P ≥ 1`, `columnFreq (ξ N) η → 2^{−P}` for
every `η` and `β > 1`, there is `r > 0` with `⌈e^{rN}⌉₊ ≤ t_mix(1/4)` for
`glauber (hopfieldLaw (ξ N) β)`, for all large `N`. (LPW, Theorem 15.4(ii), p. 218, and
CurieWeissModel 5.1 for `P = 1`. Proved here for every `P ≥ 1`.)

Route. Let `μ_N` be the Hopfield law and
`U = {m | m_0 > 0 and m_0 > |m_ν| for all ν ≠ 0}`, an open cone, and `A = {x | m_N(x) ∈ U}`.

- `glauber μ_N` is Markov and `μ_N` is stationary
  (`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`,
  `TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`, Mathlib
  `ProbabilityTheory.Kernel.IsReversible.invariant`).
- `μ_N(A) ≤ ½`: the global flip `x ↦ !x` preserves `μ_N` (the weight is even in `σ`) and maps `A`
  onto the disjoint set `{m_N ∈ −U}`.
- `μ_N(A) ≥ e^{−δN}` for every `δ > 0` and large `N`: `U` is an open set containing the Mattis
  state `m* e_0`, a zero of the rate (2.2, 3.2), so the lower bound of 3.1 applies.
- A step of the chain changes one spin, hence each overlap coordinate by at most `2/N`. So
  `Q(A, Aᶜ) ≤ μ_N(m_N ∈ K_N)` with `K_N` the set of points of the closure of `U` within distance
  `2√P/N` of its complement. For large `N`, `K_N ∩ [−1, 1]^P` lies in the compact set `K` of
  points of the cube in the closure of `U` within distance `ρ` of `Uᶜ`, where `ρ` is less than
  the distance `m*/√2` (or `m*` when `P = 1`) from `m* e_0` to `Uᶜ`. The other Mattis
  states are not in the closure of `U`, so `K` has positive distance `ε` from the maximisers and 3.2
  gives
  `μ_N(m_N ∈ K) ≤ e^{−cN}` for large `N`.
- With `δ = c/2`, the bottleneck ratio of `A` is at most `e^{−cN/2}`, and
  `TauCetiRoadmap.MarkovChainMixing.le_tvToStationary_of_bottleneckRatioOf` (MarkovChainMixing
  3.1) gives `d(t) ≥ ½ − t e^{−cN/2} > ¼` for `t < e^{cN/2}/4`; take `r < c/2` and use
  `TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`.

**Checks.**

- `β > 1` is needed: at `β = 0` the Hopfield law is uniform and the chain is the hypercube walk,
  with `t_mix(1/4) ≤ ⌈N log(4N)⌉` by the Hebbian clause of 4.2 with `c = 1`.
- `P ≥ 1` is needed: for `P = 0` the law is uniform for every `β`, the same walk.
- The statement is given for uniform column types because the route identifies the maximisers of
  `Φ_ν` only in that case (2.2).

*Needs:* 2.2, 3.1, 3.2; MarkovChainMixing 1.2 (`tvToStationary`), 1.3 (`mixingTime`,
`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`), 3.1
(`TauCetiRoadmap.MarkovChainMixing.le_tvToStationary_of_bottleneckRatioOf`), 6.1 (`glauber`,
`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`,
`TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`); Mathlib
`ProbabilityTheory.Kernel.IsReversible.invariant`, `Nat.ceil_le`.

### 4.2 Fast mixing under a Dobrushin-type condition

Prove `glauber_gibbs_ising_fastMixing`: on a nonempty set `ι` of `N` sites,

- for real couplings `J : Matrix ι ι ℝ`, real `β`, and `c > 0` with
  `Σ_{i ≠ v} tanh|β (J i v + J v i)/2| ≤ 1 − c` for every site `v`, the Glauber dynamics of
  `gibbs (ising (−½ J) 0) β` satisfies `d(t) ≤ N (1 − c/N)^t` for every `t` and
  `t_mix(ε) ≤ ⌈N(log N + log(1/ε))/c⌉₊` for every `ε > 0`;
- the Hebbian case: for `P` patterns and `|β| P < 1`, the same two bounds hold for
  `glauber (hopfieldLaw ξ β)` with `c = 1 − |β| P`.

(LPW, Theorem 15.1, pp. 215–216, for the Ising model on a graph with `β ≥ 0`, proved there by path
coupling. Proved here for real couplings and every real `β`; the Gibbs law depends on `J` only
through `(J + Jᵀ)/2` off the diagonal, which is the matrix in the condition.)

Route.

- Heat-bath formula: with `K = (J + Jᵀ)/2`, `glauber (gibbs (ising (−½ J) 0) β) x` picks a
  uniform site `v` and sets its spin to `1` with probability
  `(1 + tanh(β Σ_{j≠v} K v j σ_j))/2`: the conditional law of `σ_v` is computed from the Gibbs
  weights, in which the diagonal of `J` is a constant.
- Grand coupling: run two copies with the same site and the same uniform number. For two
  configurations differing only at `w`, the spins at `v ≠ w` disagree afterwards with
  probability `|tanh(a + b) − tanh(a − b)|/2 ≤ tanh|b|` with `b = β K v w`, and site `w` agrees
  afterwards; so the expected Hamming distance is at most `1 − c/N`. By the triangle inequality
  along a path of single flips, the expected distance of any pair contracts by `1 − c/N`.
- `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_of_isMarkovCoupling` (MarkovChainMixing
  4.1) with `P(X_t ≠ Y_t) ≤ E dist(X_t, Y_t) ≤ N(1 − c/N)^t` gives the first bound. (Path coupling
  through `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam`, MarkovChainMixing
  4.2, also applies, with the Hamming metric on Mathlib's type synonym `Hamming`: on plain
  functions `ι → Bool` Mathlib's metric is the supremum metric, not the Hamming distance.)
- `N(1 − c/N)^t ≤ N e^{−ct/N} ≤ ε` once `t ≥ N(log N + log(1/ε))/c`.
- Hebbian case, from the first clause: `hopfieldLaw ξ β` is
  `gibbs (ising (−½ hebb ξ) 0) (β/N)` (as `−0 = 0`), `hebb ξ` is symmetric and its off-diagonal
  entries have modulus at most `P`; so the sum in the condition at inverse temperature `β/N` is
  at most `(N − 1) tanh(|β| P/N) ≤ |β| P`, and `c = 1 − |β| P` works.

**Checks.**

- `N = 2`, `J 0 1 = J 1 0 = a` with `tanh(βa) = ½` (`e^{2βa} = 3`): `c = ½` and the bound is
  `d(t) ≤ 2(¾)^t`. Iterating the 4 × 4 transition matrix in rational arithmetic gives
  `d(0) = 7/8` and `d(t) = ½(¾)^t` for `t ≥ 1`, so `t_mix(1/4) = 3`, against the bound
  `⌈4 log 8⌉ = 9`.
- Graphs: for the adjacency matrix of a graph of maximal degree `Δ` and `β ≥ 0`, the sum in the
  condition is `deg(v) tanh β ≤ Δ tanh β`, and the two bounds are those of
  GlauberDynamicsOfTheIsingModel 3.1
  (`TauCetiRoadmap.GlauberDynamicsOfTheIsingModel.glauber_isingGibbs_fastMixing`).
- One pattern: the Hebbian condition reads `|β| < 1`; for `0 ≤ β < 1` this is the
  high-temperature regime of the complete graph in GlauberDynamicsOfTheIsingModel 3.2, transported
  by the Mattis gauge of Layer 1.
- `P = 0`: the law is uniform, `c = 1`, and the bound `N(1 − 1/N)^t` is the coupon-collector
  bound of the hypercube walk.
- `N ≥ 1` is needed: on no sites `glauber` is `(0 : ℝ≥0∞)⁻¹ • 0 = 0`, the zero kernel, so
  `d(1) = tvDist(0, π)/2 = 1/2` while the bound `N(1 − c/N)^t` is `0`; the condition is vacuous,
  and the Hebbian clause fails in the same way at `β = 0`.

*Needs:* Conventions (`ising`, `gibbs`, `hebb`); MarkovChainMixing 1.2, 1.3, 4.1
(`TauCetiRoadmap.MarkovChainMixing.IsMarkovCoupling`,
`TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_of_isMarkovCoupling`), 6.1 (`glauber`,
`TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber`,
`TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`); Mathlib `hammingDist`, `Real.tanh`,
`Nat.ceil_le`.

### Examples

- The gap between 4.1 and 4.2: for uniform patterns mixing is exponentially slow for `β > 1`
  and fast for `|β| P < 1`; the regime `1/P ≤ β ≤ 1` is not settled by these two theorems.

### Dependencies

4.1 uses 2.2, 3.1, 3.2 and MarkovChainMixing 1.2, 1.3, 3.1, 6.1, and 4.2 in Checks; 4.2 uses
MarkovChainMixing 1.2, 1.3, 4.1, 6.1 and, in Checks, GlauberDynamicsOfTheIsingModel 3.1, 3.2.

## Scope and ownership

This roadmap owns the Hopfield model at positive temperature with a fixed number of patterns: the
Gaussian–binary machine and its Hubbard–Stratonovich identity, the free energy at finite `N` and
in the limit, the variational problem and the Mattis states, the large deviations and the
concentration of the overlaps, and the mixing of the Glauber dynamics of the Hopfield law at low
and at high temperature, together with the fast-mixing bound for real couplings.

Stated by other roadmaps and used here:

- HopfieldNetworks owns the Hopfield energy and the Hebbian weights (1.1, 4.1), which are copied,
  and the retrieval of patterns at zero temperature (4.1–4.2), which is not restated. It notes
  that the stochastic network at inverse temperature `β` is the Glauber dynamics of the Gibbs law
  of the Hopfield energy and does not restate it, and its scope leaves out the
  statistical-mechanics storage capacity of the Hebb rule for random patterns and Boltzmann
  machines.
- CurieWeissModel owns the Curie–Weiss law, its pressure, rate function and spontaneous
  magnetisation (1.2) and the mean-field equation (2.1–2.2); through the Mattis gauge (Examples
  of Layer 1) its thermodynamic limit, concentration and slow mixing (3.1, 4.1, 4.2, 5.1) imply
  the one-pattern cases of the limit in 2.1 (with the duality of 2.2), of the concentration
  clause of 3.2 and of 4.1 here.
- GlauberDynamicsOfTheIsingModel owns the heat-bath formula and the fast-mixing bounds for the
  Ising model on graphs (1.2, 3.1, 3.2); 4.2 extends the bounds of 3.1 to real couplings and
  every real `β`, and recovers them on graphs (Check).
- MarkovChainMixing owns the Glauber dynamics, mixing times, the bottleneck bound and couplings
  (1.2, 1.3, 3.1, 4.1, 6.1); LargeDeviations owns the Gärtner–Ellis theorem and exponential
  tilting with their consequences (1.2, 2.4, 5.3), and lists statistical-mechanics applications
  (the Curie–Weiss model, equivalence of ensembles) beyond its scope; 3.1 is an application of
  that kind. RandomMatrices 9.1 owns the definition of the large deviation principle;
  SimulatedAnnealing 3.1 owns `gibbs` and QuantumOptimization 1.1 owns `spin` and `ising`.

Not treated here: an unbounded number of patterns (`P/N → α > 0`), the replica-symmetric
solution and storage capacity, the fluctuations of the overlaps, random patterns beyond the
almost-sure frequencies of the Examples of Layer 2, binary hidden units, mean-field
approximations of general graphical models, infinite-volume Gibbs measures, and every algorithm,
program and running time.

## Exact supplier contracts

### From Mathlib

- `integral_cexp_quadratic` (`∫ exp(b x² + c x + d) = (π/−b)^{1/2} exp(d − c²/(4b))` for
  `Re b < 0`); `ProbabilityTheory.gaussianReal` and `ProbabilityTheory.mgf_gaussianReal`
  (`Mathlib/Probability/Distributions/Gaussian/Real.lean`);
  `MeasureTheory.integral_fintype_prod_eq_prod` (integral of a product over `Measure.pi`,
  `Mathlib/MeasureTheory/Integral/Pi.lean`);
  `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.compProd`, `MeasureTheory.Measure.conv`,
  `MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.count`,
  `MeasureTheory.Measure.tilted`; `ProbabilityTheory.Kernel.ofFunOfCountable`,
  `ProbabilityTheory.Kernel.withDensity` (for an s-finite kernel), `ProbabilityTheory.Kernel.const`.
- `ConcaveOn.le_map_sum` and `StrictConcaveOn.lt_map_sum` (Jensen, with strict inequality when two
  points differ and all weights are positive) (`Mathlib/Analysis/Convex/Jensen.lean`);
  `Real.cosh_le_exp_half_sq` (`cosh x ≤ exp(x²/2)`); `Real.tanh`; `Real.binEntropy`;
  `IsCompact.exists_isMaxOn`; `Metric.infDist`; `EuclideanSpace.single`, `WithLp.toLp`.
- `ProbabilityTheory.Kernel.IsReversible.invariant` (a Markov kernel reversible for `π` leaves
  `π` invariant) (`Mathlib/Probability/Kernel/Invariance.lean`); `MeasureTheory.tvDist`;
  `hammingDist` and `Hamming` (`Mathlib/InformationTheory/Hamming.lean`); `Nat.ceil_le`;
  `ProbabilityTheory.strong_law_ae` (`Mathlib/Probability/StrongLaw.lean`, Examples).

### From Tau Ceti

- `TauCeti.fenchelConjugate` (`TauCeti/Analysis/Convex/Conjugate.lean`), inside `legendreRate`;
  `TauCeti.sub_le_fenchelConjugate` (the Fenchel–Young inequality
  `B x y − f x ≤ fenchelConjugate B f y`) and `TauCeti.fenchelConjugate_le` (a bound on every
  term bounds the conjugate), same file, in the route of 3.2.

### From TauCetiRoadmap.LargeDeviations

- 1.1 `IsGoodRateFunction` (copied); 1.2
  `TauCetiRoadmap.LargeDeviations.LargeDeviationPrinciple.exists_pos_eventually_log_le` (a closed
  set with no zero of a good rate has `a(n)⁻¹ log μₙ(F) ≤ −c` eventually, for some `c > 0`).
- 2.4 `TauCetiRoadmap.LargeDeviations.LargeDeviationPrinciple.tilted` (probability measures,
  `OpensMeasurableSpace`, `a → ∞`, `F` bounded continuous: the tilted laws satisfy the principle
  with rate `(I − F + sup(F − I)).toENNReal`).
- 4.1 `legendreRate` (copied); 5.3 `TauCetiRoadmap.LargeDeviations.IsEssentiallySmoothSteep` and
  `TauCetiRoadmap.LargeDeviations.gartnerEllis` (finite-dimensional inner product space with
  Borel σ-algebra, probability measures, `a → ∞`, pointwise limit `Λ` of the scaled logarithmic
  moment generating functions, `0` interior to `{Λ < ⊤}`, `Λ` essentially smooth and lower
  semicontinuous: the good rate `legendreRate Λ` and the principle).

### From TauCetiRoadmap.RandomMatrices

- 9.1 `LargeDeviationPrinciple` (copied).

### From TauCetiRoadmap.CurieWeissModel

- 1.2 `freeEnergy`, `pressure`, `spontaneousMagnetization` (copied);
  2.1 `TauCetiRoadmap.CurieWeissModel.setOf_tanh_mul_eq_self_of_le_one` (`β ≤ 1`: the only solution
  of `tanh(βm) = m` is `0`, the only minimiser of `freeEnergy β` on `[−1, 1]`); 2.2
  `TauCetiRoadmap.CurieWeissModel.spontaneousMagnetization_spec` (`β > 1`: `0 < m* < 1`, solutions
  `{−m*, 0, m*}`, minimisers `{±m*}`); 1.1, 3.1, 4.1, 4.2, 5.1 in Examples and Checks.

### From TauCetiRoadmap.HopfieldNetworks

- 1.1 `hopfieldEnergy` and 4.1 `hebb` (copied); 4.2 retrieval, named in the scope only.

### From TauCetiRoadmap.MarkovChainMixing

- 1.2 `tvToStationary`, 1.3 `mixingTime` (copied) and
  `TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`; 3.1
  `TauCetiRoadmap.MarkovChainMixing.le_tvToStationary_of_bottleneckRatioOf` (Markov kernel,
  stationary probability `π`, `0 < π(A)`: `1 − t Φ(A) − π(A) ≤ d(t)`); 4.1
  `TauCetiRoadmap.MarkovChainMixing.IsMarkovCoupling` and
  `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_of_isMarkovCoupling`; 4.2
  `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam` (alternative route, requires
  a `MetricSpace` instance on the state space); 5.3 the hypercube walk (named in Checks); 6.1
  `glauber` (copied), `TauCetiRoadmap.MarkovChainMixing.isMarkovKernel_glauber` (nonempty site
  set, probability measure) and `TauCetiRoadmap.MarkovChainMixing.isReversible_glauber`.

### From TauCetiRoadmap.GlauberDynamicsOfTheIsingModel

- 3.1 `TauCetiRoadmap.GlauberDynamicsOfTheIsingModel.glauber_isingGibbs_fastMixing` and 3.2
  `TauCetiRoadmap.GlauberDynamicsOfTheIsingModel.mixingTime_glauber_isingGibbs_top_le`, in Checks
  only.

### From TauCetiRoadmap.SimulatedAnnealing

- 3.1 `gibbs` (copied).

### From TauCetiRoadmap.QuantumOptimization

- 1.1 `spin` and `ising` (copied).

## References

- A. Barra, A. Bernacchia, E. Santucci and P. Contucci, *On the equivalence of Hopfield networks
  and Boltzmann machines*, Neural Networks 34 (2012), 1–9, doi:10.1016/j.neunet.2012.06.003;
  arXiv:1105.2790v3, the version read. Used: (2)–(5),
  pp. 3–4; (8)–(11), p. 6.
- A. Bovier and V. Gayrard, *Hopfield models as generalized random mean field models*,
  arXiv:cond-mat/9607103. Used: p. 3; §3.1, (3.1)–(3.2), p. 18; (5.14), p. 36; (6.4), (6.7),
  p. 40; Lemma 6.3 and Proposition 6.4, p. 43 (printed page numbers of the arXiv version).
- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017; the edition made available by the authors.
  Used: Theorem 15.1, pp. 215–216; Theorem 15.4, p. 218.
