# Roadmap: Dyson Brownian motion

**Summary.** This roadmap builds Dyson Brownian motion on two foundations: the finite-dimensional
spectral theory, Gaussian ensembles, free convolution and deformed-Wigner laws of the RandomMatrices
roadmap, and the Itô calculus and stochastic-differential-equation theory of the StochasticCalculus
roadmap. It follows Anderson–Guionnet–Zeitouni (**AGZ**) §§4.3.1–4.3.2, Tao (**T**) §3.1 and
Potters–Bouchaud (**PB**) chs. 8–9. It builds the adapters to stochastic calculus, the `β ≥ 1`
ordered particle system with its invariant Gaussian beta law, symmetric and Hermitian matrix
Brownian motion with the eigenvalue stochastic differential equation, and the hydrodynamic limit of
the empirical measure. Its end theorems are Dyson's theorem (the eigenvalues of matrix Brownian
motion solve the Dyson system and do not collide at positive times), global strong existence and
uniqueness without collisions for every real `β ≥ 1`, and convergence of the empirical measure
process, uniformly on compact time intervals, to the solution of a Burgers equation for the
Stieltjes transform. For a compactly supported initial limit `ν` and uniformly bounded initial
spectra, that limit is the free convolution `ν ⊞ SC_t`. [Suggested.lean](Suggested.lean) states the
headline theorems that are statable against the pinned libraries; this README is the roadmap.

## Scope and ownership

The matrices are real symmetric (`β = 1`) and complex Hermitian (`β = 2`) of fixed size `n`
driven by finitely many independent real Brownian motions; the particle system is the ordered
Dyson system on `ℝⁿ` for real `β ≥ 1`, with and without the Ornstein–Uhlenbeck drift. Limits are
taken as `n → ∞` on compact time intervals.

Outside the roadmap: `0 < β < 1`, where particles collide and the system needs reflection or
local-time terms; quaternionic `β = 4` matrix Brownian motion; infinite-dimensional Dyson
processes and the sine and Airy line ensembles; local relaxation flows and universality via
Dyson Brownian motion; fluctuation and large deviation theory of the empirical measure process
(AGZ §§4.3.3–4.3.4); and the finance and filtering models of PB.

Owned elsewhere and consumed here:

- Tau Ceti owns the empirical spectral measure `Matrix.spectralMeasure` and the semicircle family
  `TauCeti.Probability.semicircleReal`.
- [RandomMatrices](../RandomMatrices/README.md) owns the rest of the spectral API and its
  measurability (§§1.1–1.2), the GOE and GUE coordinates and their normalization (§5.1), the
  Gaussian beta ensemble densities (§§5.2–5.3), the resolvent transform toolkit (§§3.1–3.2),
  free additive convolution of compactly supported laws with its subordination and R-transform
  (§6.3), and the deformed-Wigner law `ν ⊞ SC_t` with the Pastur equation (§7.1).
  Here: the time-dependent versions of these objects and their stochastic analysis.
- StochasticCalculus owns finite-dimensional Brownian motion (S1), predictable `L²` Brownian
  integration, continuous integral processes and localization (S3.2–S3.4), brackets
  (S4.1–S4.3), the `C²` Itô formula on open domains (S5.1), Lévy's characterization (S5.5), and
  strong, local and maximal solutions with Lyapunov nonexplosion (S9.1–S9.2), and weak solutions
  with uniqueness in law from pathwise uniqueness (S9.3).

## Conventions

1. **Time and filtrations.** Time is `ℝ≥0`; finite horizons use StochasticCalculus'
   `timeMeasure T`. Collision and exit times are stopping times valued in `WithTop ℝ≥0`. The
   Brownian hypotheses are StochasticCalculus' filtration-relative predicates of S1.3,
   `IsFilteredBrownian` in the scalar case, for a filtration on which the matrix noise is
   Brownian; usual conditions are assumed only where that roadmap's theorems require them, and
   conclusions are transported back through its raw-filtration adapters. Statements that need no
   filtration use Mathlib's `IsBrownianReal`.
2. **Order.** Eigenvalues are Mathlib's decreasing `Matrix.IsHermitian.eigenvalues₀`,
   `λ₁ ≥ ⋯ ≥ λₙ`, and the Dyson system is written on the closed chamber
   `{x₁ ≥ ⋯ ≥ xₙ}` with its interior `{x₁ > ⋯ > xₙ}`. AGZ orders increasingly; every quoted
   statement is translated.
3. **Normalization.** Matrix Brownian motion `H(t)` has the law of `√t` times GOE (`β = 1`) or
   GUE (`β = 2`) at time `t`, in the normalization of RandomMatrices Convention 5, which is
   AGZ Definition 4.3.1: off-diagonal entries of variance `t/n` and diagonal entries of variance
   `2t/(βn)`. Equivalently `H` is standard Brownian motion on the real space of symmetric or
   Hermitian matrices with inner product `(βn/2) Re tr(AB)`.
4. **Solutions.** Solutions use StochasticCalculus' strong-solution notion, whose scalar carrier is
   `IsStrongSolution`, with state space `ℝⁿ`. Singular coefficients are handled by globally
   Lipschitz truncations agreeing with them on
   `{x₁ > ⋯ > xₙ, min_{i<j}(xᵢ-xⱼ) ≥ 1/k, ‖x‖ ≤ k}`, pasted by S9.2 up to the exit times.
5. **Empirical measures.** `L_n(t) = n⁻¹ ∑ᵢ δ_{λᵢ(t)}` is Tau Ceti's `Matrix.spectralMeasure` at
   each time. Convergence of `(L_n(t))_{t ≤ T}` is uniform convergence on `[0,T]` for the
   Lévy–Prokhorov metric `levyProkhorovDist`, which metrizes weak convergence of probability
   measures on `ℝ`.
6. **Transforms.** `G_μ(z) = ∫ (z-x)⁻¹ dμ(x)` is the Stieltjes transform used in Layer 3, and
   `G_μ = −m_μ` for the transform `m_μ(z) = ∫ (x-z)⁻¹ dμ(x)` of RandomMatrices Convention 4.
   Under this sign change `∂_t G = −G ∂_z G` becomes `∂_t m = m ∂_z m`, which is the
   `t`-derivative of the Pastur equation `m_t(z) = m_ν(z + t m_t(z))`.

## Exact supplier contracts

### From Mathlib

- Brownian motion: `ProbabilityTheory.IsPreBrownianReal` and `ProbabilityTheory.IsBrownianReal`
  (`Mathlib/Probability/BrownianMotion/Basic.lean`), with Gaussian increments and continuous
  paths.
- `MeasureTheory.levyProkhorovDist` (`Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean`).
- `Matrix.IsHermitian.eigenvalues₀` and `Matrix.isHermitian_diagonal_of_self_adjoint`.

### From Tau Ceti

- `Matrix.spectralMeasure` (`TauCeti/Analysis/Matrix/SpectralMeasure.lean`), a
  `ProbabilityMeasure ℝ` for a Hermitian matrix of positive size.
- `TauCeti.Probability.semicircleReal`
  (`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean`).

### From TauCetiRoadmap roadmaps

- RandomMatrices: §§1.1–1.2, 3.1–3.3, 5.1–5.3, 6.3 and 7.1, with the GOE and GUE coordinates
  and normalization of §5.1.
- StochasticCalculus: S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.3, with
  `timeMeasure`, `IsFilteredBrownian` and `IsStrongSolution`.

## How to read the build

Layer 0 adapts StochasticCalculus to vector and matrix noise. Layer 1 solves the ordered
particle system for every real `β ≥ 1` without matrices, on Layer 0 and RandomMatrices §5.3.
Layer 2 constructs matrix Brownian motion and proves Dyson's theorem for `β = 1, 2` on Layers 0–1
and RandomMatrices §§1.2 and 5.1; the noncollision of the matrix eigenvalues is proved by
comparison with the Layer 1 solution. Layer 3 proves the hydrodynamic limit on Layers 1–2 and
RandomMatrices §§3.1–3.3, 6.3 and 7.1.

```text
StochasticCalculus S1, S3–S5, S9 → 0 (adapters)
0 + RandomMatrices 5.3 → 1 (Dyson system for β ≥ 1)
0–1 + RandomMatrices 1.2, 5.1 → 2 (matrix Brownian motion, Dyson's theorem)
1–2 + RandomMatrices 3.1–3.3, 6.3, 7.1 → 3 (hydrodynamic limit)
```

For each new object the build supplies construction or existence, measurability or continuity,
invariances, and the operations its layer uses. Every limit theorem records the dimension
sequence, the initial data and its assumptions, the coupling across sizes, the normalization,
the topology and the mode of convergence in its statement.

## Layer 0: adapters to stochastic calculus

**Sources:** AGZ Appendix H; StochasticCalculus.

### 0.1 Vector and matrix noise

Consume from StochasticCalculus: vector Brownian motion on a finite-dimensional real
inner-product space with independent orthonormal coordinates and linear-isometry transport
(S1.2–S1.3); the predictable `L²` Brownian integral with its isometry, continuous integral
process and localization (S3.2–S3.4); quadratic and mutual variation with
`[∫H dM, ∫K dN] = ∫ HK d[M,N]` (S4.1–S4.3); the `C²` Itô formula on an open domain stopped before
its boundary, in coordinate form (S5.1); the vector Lévy characterization (S5.5); and strong
solutions, pathwise uniqueness, local and maximal solutions with compatible truncations, and
coercive `C²` Lyapunov nonexplosion (S9.1–S9.2); weak solutions and uniqueness in law from
pathwise uniqueness (S9.3). The construction of vector Brownian motion and
its orthonormal components are consumed from S1.2, not restated. State and prove the two
adapters that StochasticCalculus does not state:
- the mutual bracket of two linear functionals of a Brownian motion `W` on a finite-dimensional
  real inner-product space, `[⟨u,W⟩,⟨v,W⟩]_t = ⟨u,v⟩t` for every pair `u, v`, orthonormal or
  not, from the covariance of S1.2 and the bilinearity of S4.3;
- the integrand classes for matrix noise: StochasticCalculus' predictable classes with
  Hilbert–Schmidt norms, localized at collision and exit times.
*Needs:* StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.3.

**Checks.**

- On `ℝ²` with the standard inner product, `W = (B₁, B₂)` and `u = v = (1,1)/√2` give
  `[⟨u,W⟩]_t = t`; with the unnormalized `u = v = (1,1)` the bracket is `2t`.
- For the inner product `2⟨x,y⟩` on `ℝ`, a standard Brownian motion for it is `B/√2`, with
  `[B/√2]_t = t/2`; using the coordinates of the Euclidean structure would give `t`.
- A truncation agreeing with the drift `1/x` on `[1/k, k]` and globally Lipschitz gives a
  solution that agrees with any local solution up to the exit time of `[1/k, k]`; outside that
  interval the two may differ.

### Examples

- For a standard Brownian motion `W` on `ℝ²`, `u = (1, 0)` and `v = (1, 1)` are not orthonormal,
  and `[⟨u,W⟩,⟨v,W⟩]_t = [B₁, B₁ + B₂]_t = t = ⟨u,v⟩t`.

### Dependencies

StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.3.

## Layer 1: the Dyson system for `β ≥ 1`

**Sources:** AGZ §4.3.1, Lemma 4.3.3, Proposition 4.3.5 and the proof of Lemma 4.3.17; PB ch. 9.

### 1.1 Existence, uniqueness and noncollision

The Dyson system of size `n` and real parameter `β ≥ 1` is
`dλᵢ = √(2/(βn)) dBᵢ + n⁻¹ ∑_{j≠i} (λᵢ-λⱼ)⁻¹ dt`, `i = 1, …, n`, where `B` is an
`n`-dimensional Brownian motion relative to a filtration as in Convention 1. Prove:
- **Open chamber** (AGZ Lemma 4.3.3): for a deterministic start in the open chamber
  `{x₁ > ⋯ > xₙ}`, there is a unique strong solution, its paths stay in the open chamber at all
  times, and the solution is unique in law.
- **Closed chamber** (AGZ Proposition 4.3.5): for a deterministic start in the closed chamber
  `{x₁ ≥ ⋯ ≥ xₙ}`, there is a unique strong solution with continuous paths, it lies in the open
  chamber at every `t > 0`, and it depends continuously on the start.

The route is the truncation of Convention 4, noncollision from a logarithmic-gap argument,
nonexplosion from the quadratic Lyapunov estimate, and entrance from coincident starts by
approximation from the open chamber. Since the noise is additive, the system is the pathwise
identity `λᵢ(t) = xᵢ + √(2/(βn)) Bᵢ(t) + ∫₀ᵗ n⁻¹ ∑_{j≠i} (λᵢ(s)-λⱼ(s))⁻¹ ds` for paths in the open
chamber at positive times, with the drift integrable on `[0, t]`. `Suggested.lean` writes it as
`IsDysonSolution` and states both cases without the filtration, as pathwise existence and
uniqueness, in `dysonSystem_exists_unique`. Pathwise uniqueness needs no adaptedness. For the drift
`F` and `x, y` in the open chamber, with `aᵢⱼ = xᵢ - xⱼ` and `bᵢⱼ = yᵢ - yⱼ`,
`⟨F(x) - F(y), x - y⟩ = -n⁻¹ ∑_{i<j} (aᵢⱼ - bᵢⱼ)²/(aᵢⱼ bᵢⱼ) ≤ 0`. For two solutions driven by the
same path, `D = X - Y` is the integral of an integrable function, so
`|D(t)|² = 2∫₀ᵗ ⟨D, F(X) - F(Y)⟩ ds ≤ 0`. *Needs:* §0.1.

**Checks.**

- `n = 1`: the system is `dλ = √(2/β) dB`, and existence is that of Brownian motion.
- The monotonicity identity at `n = 2`, `x = (2, 0)`, `y = (1, 0)`: `F(x) = (1/4, -1/4)`,
  `F(y) = (1/2, -1/2)`, and both sides equal `-1/4`.
- A coincident start, `n = 2`, `β = 2`, `x = (0, 0)`: the gap solves `dr = dW + r⁻¹ dt` from `0`,
  a 3-dimensional Bessel process, and the drift is integrable, `E ∫₀ᵗ r⁻¹ ds = 2√(2t/π) < ∞`.
- `n = 2`: the gap `r = λ₁ − λ₂` solves `dr = √(4/(βn)) dW + (2/(nr)) dt`, a scaled Bessel
  process of dimension `β + 1`, which avoids `0` exactly when `β ≥ 1`.
- `β < 1` is excluded: by the previous Check the gap hits `0` with positive probability, so the
  collision time is finite.

### 1.2 The Ornstein–Uhlenbeck system and its invariant law

The Ornstein–Uhlenbeck system is the Dyson system of §1.1 with the added drift `-λᵢ/2`:
`dλᵢ = √(2/(βn)) dBᵢ + (n⁻¹ ∑_{j≠i} (λᵢ-λⱼ)⁻¹ - λᵢ/2) dt`. Prove the two statements of §1.1 for
it, by the proof of AGZ Lemma 4.3.3 with the same Lyapunov function, since the added drift is
globally Lipschitz. Prove the Gaussian beta density of RandomMatrices §5.3 invariant, with the
boundary terms needed to pass from formal generator symmetry to an invariant probability law
(AGZ, proof of Lemma 4.3.17: the system (4.3.40) at `t = 1` is this one, and the generator
computation there gives stationarity).
*Needs:* §1.1; RandomMatrices §5.3.

**Checks.**

- `n = 1` with drift `-λ/2`: the stationary variance is `(2/β)/(2 · 1/2) = 2/β`, the variance of
  `exp(-βx²/4)`.
- For general `n` the drift equals `(βn)⁻¹ ∇ log p` for
  `log p = β ∑_{i<j} log|xᵢ-xⱼ| − βn ∑ xᵢ²/4`, so `p` is the invariant density; dropping the
  factor `(βn)⁻¹` breaks the balance with the noise `√(2/(βn))`.
- At `β = 2`, `n = 1` the invariant law is `N(0,1)`, the GUE law of size `1`.

### Examples

- `β = 2`, `n = 2`: the gap `r = λ₁ − λ₂` solves `dr = dW + r⁻¹ dt`, the Bessel process of
  dimension `3`, which is Brownian motion conditioned never to hit `0`.

### Dependencies

Layer 0; RandomMatrices §5.3.

## Layer 2: matrix Brownian motion and Dyson's theorem

**Sources:** AGZ §4.3.1, Definition 4.3.1 and Theorem 4.3.2; T §3.1; PB ch. 9.

### 2.1 Matrix Brownian motion

Construct real symmetric (`β = 1`) and complex Hermitian (`β = 2`) matrix Brownian motion as
standard Brownian motion on that real space with inner product `(βn/2) Re tr(AB)` (AGZ
Definition 4.3.1), so `[tr(AH), tr(BH)]_t = (2/(βn)) Re tr(AB) t` and the time-one entry
variances are those of RandomMatrices §5.1. Its API:
- joint measurability in `(t, ω)` and almost sure continuity of paths;
- independent increments: `H(t) − H(s)` is independent of the past before `s` and has the law of
  `√(t − s)` times GOE (`β = 1`) or GUE (`β = 2`);
- invariance in law under conjugation by a fixed orthogonal (`β = 1`) or unitary (`β = 2`)
  matrix, so that for every start `H(0)` the process `U*H(·)U` is matrix Brownian motion from
  `U*H(0)U`;
- Brownian scaling: `H(ct)` from `0` has the law of `√c H(t)`;
- the bracket formula above.

`Suggested.lean` writes it as `matrixBrownian`: the real diagonal start `diag d` plus the noise
matrix `matrixBrownianNoise` built from independent standard Brownian coordinates with the
coordinates and normalization of RandomMatrices §5.1, with `matrixBrownian_isHermitian`.
*Needs:* §0.1; RandomMatrices §5.1.

**Checks.**

- `β = 1`, `n = 1`, `A = B = E₁₁`: `[tr(AH)]_t = 2t`, the GOE diagonal variance; for `β = 2`
  it is `t`.
- `β = 2`, `n = 2`, `A = B = E₁₂ + E₂₁`: `Re tr(A²) = 2`, so `[tr(AH)]_t = (2/4) · 2t = t`;
  since `tr(AH) = 2 Re H₁₂`, `Re H₁₂` has variance `t/4`, half of `E|H₁₂|² = t/2`.
- At `t = 1` from `d = 0`, `matrixBrownian` has the law of GOE or GUE; at `t = 4` the law of
  `2` times it, not `4` times it.

### 2.2 The eigenvalue equation

Prove Dyson's theorem (AGZ Theorem 4.3.2, (4.3.3)): for `β = 1, 2` and every start `H(0)` in the
real symmetric (`β = 1`) or complex Hermitian (`β = 2`) space, including starts with coincident
eigenvalues, the ordered eigenvalue process of matrix Brownian motion is a weak solution of the
Dyson system of §1.1 started at the ordered spectrum of `H(0)`, and it lies in the open chamber at
every `t > 0`. The steps:
- for distinct starting eigenvalues, derive the eigenvalue equation up to the first collision,
  with derivatives of eigenvalues and projectors, the quadratic-variation computation, and the
  identification of the martingale parts as independent Brownian motions by Lévy's
  characterization;
- prove that the collision time is almost surely infinite, by comparison with the solution of
  §1.1 (AGZ Theorem 4.3.2 and the remark following it), and pass to coincident starts with
  Proposition 4.3.5;
- reduce a general start to a real diagonal one by the conjugation invariance of §2.1.

A complex Hermitian start that is not real symmetric, with `β = 1` noise, is not covered.
`Suggested.lean` states two cases for real diagonal starts: the noncollision, from any such start,
as `matrixBrownian_eigenvalues_strictAnti`; and, from a start with decreasing entries, coincident
ones included, the equation as `matrixBrownian_eigenvalues_dyson`, with the eigenvalue process an
`IsDysonSolution` for some independent Brownian motions on the same probability space. *Needs:*
§§0.1, 1.1, 2.1; RandomMatrices §1.2.

**Checks.**

- `n = 1`: `dλ = √(2/β) dB`, with no drift.
- `n = 2`, `λ₁ > λ₂`: the drift of `λ₁` is `+1/(2(λ₁-λ₂))` and that of `λ₂` is its negative, so
  the eigenvalues repel and `λ₁ + λ₂` is a Brownian motion with bracket `(4/(βn))t = (2/β)t`.
- Itô's formula for `∑ λᵢ² = tr H²` gives the drift `n⁻¹ · n(n-1) + n · 2/(βn) = n - 1 + 2/β`,
  which matches `E tr H(t)² = n(n-1) · t/n + n · 2t/(βn) = (n - 1 + 2/β)t` computed from the
  entries; a drift `∑_{j≠i} (λᵢ-λⱼ)⁻¹` without the factor `n⁻¹` would give `n(n-1) + 2/β`.

### Examples

- `β = 1`, `n = 2`, from `0`: for `H = [[x, y], [y, z]]` the gap is `λ₁ − λ₂ = √((x − z)² + 4y²)`.
  Here `x − z` and `2y` are independent Brownian motions with bracket `2t`, so the gap is `√2`
  times a two-dimensional Bessel process, the dimension `β + 1 = 2` of §1.1.

### Dependencies

Layers 0–1; RandomMatrices §§1.2, 5.1.

## Layer 3: the hydrodynamic limit

**Sources:** AGZ §4.3.2, Proposition 4.3.10, Corollary 4.3.11 and Exercise 4.3.18; PB ch. 9.

### 3.1 Convergence of the empirical measure process

Prove the empirical-measure evolution against `C_c²` test functions, its martingale
quadratic-variation estimate, tightness on finite time intervals, and the limiting weak equation.
For initial empirical laws converging weakly to `ν` with `sup_n n⁻¹ ∑ᵢ log(1 + λᵢ(0)²) < ∞`, and
with the systems of all sizes defined on one probability space with no assumption on their joint law
(AGZ Proposition 4.3.10 assumes none), prove that `(L_n(t))_{t ≤ T}` converges uniformly on `[0,T]`
in the Lévy–Prokhorov metric, almost surely and in probability, to the unique family `μ_t` with
`μ₀ = ν` whose Stieltjes transforms `G_t(z) = ∫ (z-x)⁻¹ dμ_t(x)` satisfy
`G_t(z) = G_0(z) - ∫₀ᵗ G_s(z) ∂_z G_s(z) ds` for `z ∉ ℝ` (AGZ Proposition 4.3.10 for the particle
system and every `β ≥ 1`; AGZ Corollary 4.3.11 for matrix Brownian motion from a real diagonal
start). Convergence in probability depends only on the law of each size. `Suggested.lean` states the
matrix case `β = 1, 2`, in probability, as `matrixBrownian_hydrodynamic_limit`. *Needs:* §§1.1, 2.2;
RandomMatrices §§3.1–3.2.

**Checks.**

- From `ν = δ₀` the limit at time `t` is `semicircleReal 0 t`: its transform
  `G_t(z) = (z − √(z²−4t))/(2t)` solves `∂_t G + G ∂_z G = 0` with `G_0(z) = 1/z`, and at `t = 1`
  this is the semicircle law of RandomMatrices §4.3 (AGZ Exercise 4.3.18).
- From `ν = δ_a` the limit is `semicircleReal a t`, the translate: `G_t(z) = G⁰_t(z − a)` for the
  centred solution `G⁰`.
- The transform equation is Burgers' equation with the sign `−G ∂_z G`; with `+G ∂_z G` the
  solution from `δ₀` would be `G_t(z) = (−z + √(z²+4t))/(2t)`, whose expansion
  `1/z − t/z³ + ⋯` has second moment `−t < 0`, so it is not the Stieltjes transform of a
  probability measure.

### 3.2 Identification with free convolution

For compactly supported `ν` and initial spectra bounded uniformly in `n`, identify `μ_t` as
`ν ⊞ SC_t` through the subordination form of RandomMatrices §6.3 and the Pastur equation of
RandomMatrices §7.1, in the transform convention of Convention 6, and prove uniqueness through
the Stieltjes equation. For other `ν` of §3.1, `μ_t` is the solution of §3.1.

Prove the Ornstein–Uhlenbeck limit by a deterministic time change and scaling. If `λ` solves the
Dyson system of §1.1, then `Y(t) = e^(−t/2) λ(e^t − 1)` solves the system of §1.2 with respect
to the Brownian motion `∫₀^(e^t−1) (1 + s)^(−1/2) dB(s)`. So for every `ν` of §3.1, the
Ornstein–Uhlenbeck empirical measures converge to the image of `μ_(e^t−1)` under
`x ↦ e^(−t/2) x`, which is the image of `ν ⊞ SC_(e^t−1)` in the compactly supported case.
*Needs:* §3.1; RandomMatrices §§3.3, 6.3, 7.1.

**Checks.**

- From `ν = δ₀`, `δ₀ ⊞ SC_t = semicircleReal 0 t`, agreeing with §3.1.
- `ν = (δ₋₁ + δ₁)/2`: `ν ⊞ SC_t` at small `t` has two components near `±1`, which merge at
  `t = 1`; the classical convolution `ν ∗ N(0,t)` has full support for every `t > 0`.
- The Pastur equation `m(z) = ∫ (x − z − t m(z))⁻¹ dν(x)` with `t = 0` returns `m = m_ν`.
- From `ν = δ₀` the Pastur equation gives `t m² + z m + 1 = 0`, and `G = −m` gives
  `t G² − z G + 1 = 0`, whose root decaying at `∞` is the `(z − √(z²−4t))/(2t)` of §3.1.
- Ornstein–Uhlenbeck from `ν = δ₀`: the limit at time `t` is `semicircleReal 0 (1 − e^(−t))`,
  which tends to `semicircleReal 0 1` as `t → ∞`, the invariant limit.

### Examples

- From `ν = δ₀` the limit at time `t` is `semicircleReal 0 t`, the law of `√t` times the
  semicircle law of variance `1`, in agreement with the Brownian scaling of §2.1.

### Dependencies

Layers 1–2; RandomMatrices §§3.1–3.3, 6.3, 7.1.

## Downstream consumers

- RandomMatrices §7.1, the deformed-Wigner law `ν ⊞ SC_t` at a fixed `t`, is the static
  counterpart of §3.2; this roadmap consumes it, and no roadmap consumes this one.

## References

- [AGZ] G. W. Anderson, A. Guionnet, O. Zeitouni, *An Introduction to Random Matrices*,
  Cambridge University Press, 2010.
- [T] T. Tao, *Topics in Random Matrix Theory*, Graduate Studies in Mathematics 132, AMS, 2012.
- [PB] M. Potters, J.-P. Bouchaud, *A First Course in Random Matrix Theory*, Cambridge University
  Press, 2020.
