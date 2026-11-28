# Roadmap: finite volume schemes and hyperbolic systems

**Summary.** This roadmap builds the numerical analysis of conservative finite volume schemes for
scalar conservation laws in one space dimension, and the well-posedness theory of hyperbolic
systems that those schemes approximate:
- grid functions, cell averages and piecewise constant reconstructions, with the total variation
  of grid functions and its relation to Mathlib's and Tau Ceti's variations;
- conservative schemes with a general stencil, conservation, and the Lax–Wendroff theorem with
  its entropy version: bounded `L¹_loc` limits of consistent schemes are weak solutions, and
  entropy solutions when the scheme has a discrete entropy inequality;
- monotone, `ℓ¹`-contractive, total variation diminishing and monotonicity preserving schemes,
  the implications between them, the Lax–Friedrichs scheme under the CFL condition, Harten's
  lemma and the cell entropy inequality of Crandall and Majda;
- convergence of monotone schemes to the Kružkov entropy solution, uniformly in time in
  `L¹_loc`, through discrete estimates and a space-time compactness theorem;
- order barriers: the Harten–Hyman–Lax theorem that monotone schemes are at most first-order
  accurate, and Godunov's barrier for linear schemes, semi-discrete and fully discrete;
- error estimates: stability of entropy solutions in the flux, front tracking for scalar laws,
  Kuznetsov's lemma, the rate `√δ` of the vanishing viscosity method and the rate `√Δx` of
  monotone schemes;
- Tadmor's entropy-conservative and entropy-stable fluxes for systems with an entropy;
- the Riemann problem for strictly hyperbolic systems: weak solutions, the Rankine–Hugoniot
  condition, Lax shocks, contact discontinuities and rarefaction fans, Hugoniot curves, wave
  curves and Lax's theorem;
- systems with data of small total variation: Lipschitz continuity in time of weak solutions,
  front-tracking approximations, global existence, and the standard Riemann semigroup with its
  uniqueness class.

The roadmap is a synthesis of Holden and Risebro, Godlewski and Raviart, LeVeque, Tadmor's Acta
Numerica survey, Hundsdorfer and Verwer, and Bressan (see [References](#references)); it follows
none of them section by section. Headlines that restate a source result cite a theorem, equation
or section with its printed page; corollaries and adaptations carry a proof route.

It rests on Mathlib's pointwise variation, Lipschitz functions, the Bochner and lower Lebesgue
integrals, product measures and the implicit function theorem, and on Tau Ceti's distributional
total variation with its translation estimate and compactness theorem.
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) §3.3 identifies that variation on the
line with the essential variation. HamiltonJacobiAndConservationLaws supplies the scalar theory:
integral solutions (§5.1), the convex Riemann problem (§5.4), Kružkov entropy solutions (§6.1),
the `L¹` contraction, uniqueness, the maximum principle and the decay of total variation (§6.2),
the viscous approximation (§6.3), and existence, the time-continuous representative, qualitative
stability in the flux and the Lipschitz bound in time for data of bounded variation (§6.4). This
roadmap does not restate those results. Two neighbours share no statement with it:
SymmetricHyperbolicSystems treats linear symmetric systems and Friedrichs' scheme for them by
energy methods, and CompressibleEulerEquations treats classical solutions of the Euler equations;
the shocks and Riemann problems of Layer 8 are the weak-solution side of the same systems.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the other headlines are targets of the
same standing, stated in prose.

Suggested home: `TauCeti/NumericalAnalysis/ConservationLaws/` for Layers 1–7 and
`TauCeti/Analysis/PDE/HyperbolicSystems/` for Layers 8–9.

## How to read the build

Layer 1 fixes grid functions and conservative schemes; it uses no other layer, and
GeometricMeasureTheory §3.3 for the variation of reconstructions. Layer 2 (the
Lax–Wendroff theorem) uses Layer 1 and the integral solutions of HamiltonJacobiAndConservationLaws
§5.1. Layer 3 is order theory on grid functions and uses Layer 1 only. Layer 4 combines Layers 2
and 3 with the compactness theorem of §4.2 and the uniqueness of entropy solutions from
HamiltonJacobiAndConservationLaws §6.2. Layer 5 is calculus at a constant state and finite sums;
it uses the definitions of Layers 1 and 3 and no theorem of them. Layer 6 uses Layers 1, 3 and 4
and the supplier's §§6.2–6.4. Layer 7 is algebra in a real inner product space with one ordinary
differential inequality, and stands alone. Layer 8 stands alone apart from the scalar Check of
§8.1. Layer 9 uses Layer 8 and, for existence, the compactness argument of §4.2.

## Conventions

- **Space-time functions.** Time comes first: `u : ℝ → ℝ → E`, `u t x`. Solutions live on
  `(0, ∞) × ℝ` or `(0, T) × ℝ`; values at negative times are never used. `IsL1ContinuousOn u s`
  says that `t ↦ u t` is continuous from `s` into `L¹(ℝ)`, with `∫⁻ x, ‖u t x − u t₀ x‖ₑ` as the
  distance, so it holds for slices that are not integrable but whose differences are.
- **Grids.** A grid function is `v : ℤ → ℝ`. Cell `j` is `[jΔx, (j + 1)Δx)`; `cellAverage Δx u₀`
  is the grid function of averages of `u₀` over the cells and `finiteVolumeReconstruction Δx v`
  the function equal to `v j` on cell `j`. Subscripts are shorthand for arguments: `vⱼ` is `v j`,
  `γₖ` is `γ k`, and `F_{j+1/2}` is the flux through the interface `j + 1/2`. The mesh ratio
  `μ = Δt/Δx > 0` is fixed as `Δx → 0`.
- **Schemes.** A numerical flux with stencil `(p, q)` is `F : (Fin (p + q + 1) → ℝ) → ℝ`;
  `numericalFlux p q F v j` is `F` at the values `v (j − p), …, v (j + q)`, the flux through the
  interface `j + 1/2`. The conservative update is
  `conservativeUpdate p q F μ v j = v j − μ (F_{j+1/2} − F_{j−1/2})`, and
  `schemeApprox p q F μ Δx u₀ t x` is its `⌊t/(μΔx)⌋`-th iterate from `cellAverage Δx u₀`,
  evaluated in the cell of `x`. `IsConsistentFlux F f` is `F (u, …, u) = f u`.
- **Variation.** `gridTV v = ∑ⱼ |v (j + 1) − v j|` in `ℝ≥0∞`. The variation of a function on `ℝ`
  is `essVar u = TauCeti.totalVariationOn volume ⊤ u`, the total mass of the distributional
  derivative; it depends only on the a.e. class of `u`, and for locally integrable `u` it is the
  least of the pointwise variations `eVariationOn v univ` of the functions `v` equal to `u` almost
  everywhere, attained by the right-continuous representative when finite (GeometricMeasureTheory
  §3.3). Statements about solutions use `essVar`; statements about a chosen representative
  (Layer 9) use `eVariationOn`.
- **Errors.** `L¹` distances, total variations and moduli of continuity are `ℝ≥0∞`-valued
  (`∫⁻` and `‖·‖ₑ`), so no statement relies on a finite value of a quantity that can be infinite.
  Real Bochner integrals occur only inside definitions of weak and entropy solutions and of the
  Kuznetsov form, where the integrands are bounded with compact support or integrable under the
  stated hypotheses. No real supremum over an unbounded set occurs.
- **Properties on a range of values.** Monotonicity, `ℓ¹` contraction and the TVD property are
  asserted for data with values in a set `I` of states (usually `[m, M]`), since the
  Lax–Friedrichs scheme, say, is monotone only where `μ |f'| ≤ 1`.
- **Systems.** States are `Fin m → ℝ` with Mathlib's sup norm. The characteristic speeds are
  `lam k` (written `λ_k` in prose), strictly increasing in `k`, with right eigenvectors `r k`.
  Families are indexed by `Fin m`, so the source's families `1, …, m` are `0, …, m − 1` here.
- **Copied definitions.** `IsIntegralSolution` and `IsEntropySolution` are verbatim copies of the
  definitions of HamiltonJacobiAndConservationLaws §5.1 and §6.1, in the namespace of this
  roadmap.

## Layer 1: grid functions and conservative schemes

### 1.1 Grid functions and cell averages

- **Grid variation** (`gridTV_eq_eVariationOn`): `gridTV v = eVariationOn v univ` for
  `v : ℤ → ℝ`. Route: a monotone finite sequence of integers refines to consecutive integers,
  and the triangle inequality.
- **Reconstructions** (`essVar_finiteVolumeReconstruction`): for `Δx > 0`,
  `essVar (finiteVolumeReconstruction Δx v) = gridTV v`. Route: the reconstruction is
  right-continuous, so by GeometricMeasureTheory §3.3 its essential variation is its pointwise
  variation when that is finite, and that is `gridTV v` by the first bullet on the cells; when
  `gridTV v = ⊤`, `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn` at the cell midpoints,
  which are Lebesgue points, gives `essVar = ⊤`.
- **Cell averages** (`gridTV_cellAverage_le`): `gridTV (cellAverage Δx u₀) ≤ essVar u₀` for
  locally integrable `u₀` and `Δx > 0`. Route: the average over a cell is a limit of averages of
  a mollification, whose pointwise variation is at most `essVar u₀`.
- **Projection error** (`lintegral_finiteVolumeReconstruction_sub_le`):
  `∫⁻ |finiteVolumeReconstruction Δx (cellAverage Δx u₀) − u₀| ≤ Δx · essVar u₀`. Route: on
  each cell, `∫ |u₀ − ū| ≤ Δx` times the variation on the open cell, and the variations of
  disjoint open cells add up to at most `essVar u₀`.

**Checks.**
- `v` the indicator of `j ≥ 0`: `gridTV v = 1`; `v j = (−1)^j`: `gridTV v = ⊤`.
- `u₀` the indicator of `[0, 1/2)` with `Δx = 1`: the cell averages are `1/2` at `j = 0` and `0`
  elsewhere, `gridTV = 1 < 2 = essVar u₀`, and the projection error `1/2` is at most `Δx · 2`.
- `u₀(x) = x` on `[0, 1]` and `0` elsewhere, `Δx = 1/N`: each cell contributes `Δx²/4`, so the
  projection error is `1/(4N) ≤ 2/N = Δx · essVar u₀`.
- Negative control: `essVar` ignores null sets, `eVariationOn` does not; the indicator of
  `{0}` has `essVar = 0` and `eVariationOn = 2`, so the reconstruction identity needs the
  right-continuous representative that `finiteVolumeReconstruction` is, and fails for the
  representative that differs at one point.

*Needs:* GeometricMeasureTheory §3.3; Mathlib `eVariationOn`; Tau Ceti `TauCeti.totalVariationOn`,
`TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`.

### 1.2 Conservative schemes

- **Conservation** (`tsum_conservativeUpdate`): for a locally Lipschitz `F` and summable `v`,
  the update is summable with the same sum. Route: `v → 0` at `±∞`, so the fluxes tend to
  `F 0` at both ends, their differences are summable by the Lipschitz bound on a bounded set,
  and the sum of differences telescopes to `0`.
- **Lax–Friedrichs flux**: `laxFriedrichsFlux f μ (a, b) = (f a + f b)/2 − (b − a)/(2μ)` with
  stencil `(0, 1)`; its update is `½(v (j + 1) + v (j − 1)) − (μ/2)(f (v (j + 1)) − f (v (j − 1)))`
  [LV, (4.20), p. 71].

**Checks.**
- `isConsistentFlux_laxFriedrichsFlux` (proved): the Lax–Friedrichs flux is consistent.
- `conservativeUpdate_shift` (proved): the update commutes with translation of the grid.
- A constant grid function is a fixed point of every update, since its flux differences vanish.
- Negative control (conservation form): the non-conservative update
  `v j − μ v j (v j − v (j − 1))` of Burgers' equation on the summable `v = 1_{0}` with `μ = 1/2`
  gives `1/2` at `j = 0` and `0` elsewhere, so the sum drops from `1` to `1/2`.

*Needs:* 1.1; Mathlib `LocallyLipschitz`.

## Layer 2: the Lax–Wendroff theorem

`IsEntropyInequality η qf u₀ u` says that `∂ₜη(u) + ∂ₓqf(u) ≤ 0` with initial datum `u₀`, in the
sense of nonnegative `C¹` test functions of compact support on `[0, ∞) × ℝ`.

### 2.1 Weak limits

- **The Lax–Wendroff theorem** (`isIntegralSolution_of_tendsto`). Let `F` be locally Lipschitz
  and consistent with `f`, `μ > 0`, `u₀` locally integrable, and `Δx k → 0`. If the
  approximations `schemeApprox p q F μ (Δx k) u₀` are uniformly bounded for `t ≥ 0` and converge
  to a measurable `u` in `L¹((0, T) × [−R, R])` for every `T` and `R`, then `u` is an integral
  solution of `∂ₜu + ∂ₓf(u) = 0` with datum `u₀` in the sense of HamiltonJacobiAndConservationLaws
  §5.1 [GR, Chapter IV, Theorem 1.1, p. 219; LV, Theorem 12.1, p. 240; HR, Theorem 3.4, p. 105].
  Route: summation by parts against the cell averages of the test function; the flux terms
  converge because `F` is Lipschitz on the bounded range and consistent, and the initial term
  because cell averages converge to `u₀` in `L¹_loc`. No bound on the total variation is used;
  the sources that assume one use it to obtain the convergence, which here is a hypothesis.

*Needs:* 1.1–1.2; HamiltonJacobiAndConservationLaws §5.1; Mathlib `LocallyIntegrable`,
`HasCompactSupport`.

### 2.2 Entropy limits

- **Entropy version** (`isEntropyInequality_of_tendsto`). If moreover all computed values lie
  in a bounded set `I`, the scheme satisfies on data with values in `I` the discrete entropy
  inequality `η(v_j^{n+1}) ≤ η(v_j) − μ(G_{j+1/2} − G_{j−1/2})` with a locally Lipschitz numerical
  entropy flux `G` consistent with `qf`, and `η` is continuous, then `u` satisfies the entropy
  inequality for `(η, qf)` [LV, (12.37)–(12.38), p. 243].
  Route: as in 2.1 with an inequality and nonnegative test functions.

**Checks.**
- For `f(u) = u` and the upwind flux `F(a) = a` with `μ = 1`, the scheme is the exact shift, the
  limit is `u₀(x − t)`, and the identity of §5.1 of the supplier holds by a change of variables.
- Negative control (consistency): the flux `F(a, b) = 2 · (f a + f b)/2 − (b − a)/(2μ)` gives
  limits of the law with flux `2f`; for Burgers' equation with Riemann data `1, 0` the limit
  shock moves with speed `1`, not `1/2` (the Rankine–Hugoniot speed of `2f`).
- Negative control (conservation): the non-conservative upwind form
  `v j − μ v j (v j − v (j − 1))` of Burgers' equation converges for the same data to a jump with
  the wrong speed [LV, §12.9, p. 237], which is why the theorem is stated for conservative
  updates only.

*Needs:* 2.1.

## Layer 3: monotone and total variation diminishing schemes

An operator `S` on grid functions is monotone on `I` (`IsMonotoneOn`) if `v ≤ w` implies
`S v ≤ S w` for data with values in `I`; an `ℓ¹` contraction on `I` (`IsL1ContractiveOn`) if
`∑ |S v − S w| ≤ ∑ |v − w|` in `ℝ≥0∞`; total variation diminishing on `I` (`IsTVDOn`) if
`gridTV (S v) ≤ gridTV v`; monotonicity preserving on `I` (`IsMonotonicityPreservingOn`) if it
maps monotone data of finite variation to monotone grid functions of the same direction.

### 3.1 The implications

- **Crandall–Tartar for schemes** (`isL1ContractiveOn_of_isMonotoneOn`): a conservative update
  with locally Lipschitz flux that is monotone on `[m, M]` is an `ℓ¹` contraction there and maps
  data with values in `[m, M]` to such data [HR, Lemma 2.13, p. 82, and Theorem 3.6(i),
  pp. 107–108]. Route: constants are fixed points, which with monotonicity gives the range; for
  `v − w` summable the update preserves `∑ (v − w)` (as in 1.2), and the Crandall–Tartar
  argument applies to `S (v ⊔ w) − S w`. Consistency, assumed in the source, is not needed.
- **Contraction gives TVD** (`isTVDOn_of_isL1ContractiveOn`): an `ℓ¹` contraction on `I` that
  commutes with translation is TVD on `I` [HR, Theorem 3.6(ii), p. 107]. Route: compare `v`
  with its translate.
- **TVD gives monotonicity preservation** (`isMonotonicityPreservingOn_of_isTVDOn`): a TVD
  conservative update with continuous flux preserves monotonicity [HR, Theorem 3.6(iii), p. 107].
  Route: a monotone `v` of finite variation has limits at `±∞`, the update has the same limits by
  continuity of `F`, so `gridTV (S v)` is at least the difference of the limits, which equals
  `gridTV v`; equality in `gridTV w ≥ |w(∞) − w(−∞)|` forces `w` monotone in that direction.

*Needs:* 1.1–1.2.

### 3.2 The Lax–Friedrichs scheme

- **Monotonicity under the CFL condition** (`isMonotoneOn_laxFriedrichs`): if `f` is
  `L`-Lipschitz on `I`, `μ > 0` and `μL ≤ 1`, the Lax–Friedrichs update is monotone on `I`
  [HR, Example 3.7, p. 109]. Route: the update is
  `½(1 − μ f'·)v_{j+1} + ½(1 + μ f'·)v_{j−1}` in difference-quotient form, and the two
  coefficients are nonnegative.

*Needs:* 1.2, 3.1.

### 3.3 Harten's lemma

Write the update in incremental form
`v j = u j − A (j − 1) (u j − u (j − 1)) + B j (u (j + 1) − u j)`, where `A j` and `B j` belong to
the interface `j + 1/2`.

- **Variation** (`gridTV_incremental_le`): if `A j, B j ≥ 0` and `A j + B j ≤ 1` for all `j`,
  then `gridTV v ≤ gridTV u` [HR, Lemma 3.12, p. 118; LV, Theorem 6.1, p. 116; GR, Chapter IV,
  Proposition 1.3, p. 221]. Route: `v_{j+1} − v_j` is a combination of three consecutive jumps of
  `u` with nonnegative coefficients; sum over `j` and regroup.
- **Maximum principle** (`incremental_mem_Icc`): if `A j, B j ≥ 0` and `A (j − 1) + B j ≤ 1`, the
  updated values lie in every interval `[m, M]` containing the old ones. Route: `v j` is a convex
  combination of `u (j − 1)`, `u j`, `u (j + 1)`. The two conditions differ in their index; neither
  implies the other.

*Needs:* 1.1.

### 3.4 The cell entropy inequality

- **Crandall–Majda** (`monotoneUpdate_entropy_inequality`): for an update monotone on `I`, data
  with values in `I` and `k ∈ I`,
  `|S v_j − k| ≤ |v_j − k| − μ(G_{j+1/2} − G_{j−1/2})` with the numerical entropy flux
  `G = F(v ⊔ k) − F(v ⊓ k)` [HR, (3.32)–(3.33), p. 111; CM]. Route: `S(v ⊔ k) ≥ S v ⊔ k` and
  `S(v ⊓ k) ≤ S v ⊓ k` by monotonicity and the fixed point `k`, and subtract. Consistency is not
  needed; with it, `G` is consistent with the Kružkov flux `sign(u − k)(f u − f k)`.

**Checks.**
- `conservativeUpdate_shift` gives the translation hypothesis of `isTVDOn_of_isL1ContractiveOn`
  for every conservative update.
- Lax–Friedrichs for Burgers' equation: the partial derivative in `v_{j+1}` is `0.05` at
  `v = 1`, `μ = 0.9` and `−0.05` at `μ = 1.1` (computed), so the CFL condition is sharp for
  monotonicity.
- Harten's lemma with `A = B = 1/4` and `u` the indicator of `{1, 3}`: `v` is
  `1/4, 1/2, 1/2, 1/2, 1/4` at `j = 0, …, 4` and `0` elsewhere, so `gridTV v = 1 ≤ 4 = gridTV u`
  and the values stay in `[0, 1]`.
- The Crandall–Majda inequality for Lax–Friedrichs on Burgers' equation at `μ = 9/10`, with
  `v (j − 1), v j, v (j + 1) = 1, 0, −1` and `k = 1/2`: the update is `0`, the left side `1/2`
  and the right side `107/80` (exact).
- Negative control (TVD without monotonicity): the linear update with coefficients
  `(−0.1, 1.2, −0.1)` maps the step `0, 0, 1, 1` to `0, −0.1, 1.1, 1`, which is neither monotone
  nor TVD (computed); a scheme that is not monotone need not satisfy any of the three properties.
- Negative control (index of the maximum principle): `A j + B j ≤ 1` for all `j` does not give
  the range bound; `A = 1` at `j − 1`, `B = 1` at `j` and `u = (1, 0, 1)` give `v j = 2`.

*Needs:* 1.2, 3.1.

## Layer 4: convergence of monotone schemes

### 4.1 Discrete estimates

- **Bounds** (`iterate_conservativeUpdate_bounds`): for an update monotone on `[m, M]` whose flux
  is `L`-Lipschitz on `[m, M]^{p+q+1}` in the sup norm, every iterate of data with values in
  `[m, M]` has values in `[m, M]` and variation at most `gridTV v`, and one step moves it by at
  most `μL(p + q + 1) · gridTV v` in `ℓ¹`. Route: 3.1 for the first two; for the third, each flux
  difference is at most `L` times the largest of `p + q + 1` consecutive jumps. These are the
  bounds that the convergence theorem of the sources requires [HR, Theorem 3.8, p. 109].

*Needs:* 1.1, 3.1; Mathlib `LipschitzOnWith`.

### 4.2 Compactness

- **Compactness in `C([0, T]; L¹_loc)`** (`exists_subseq_tendsto_iSup_lintegral`): a sequence
  `w k` of uniformly bounded space-time functions with measurable slices,
  `essVar (w k t) ≤ V` for `t ∈ [0, T]` and `∫⁻ |w k t − w k s| ≤ L|t − s| + ρ k` with `ρ k → 0`
  has a subsequence and a limit `w'` with measurable slices, `L¹`-continuous on `[0, T]`, with
  `sup_{t ∈ [0,T]} ∫⁻_K |w (φ j) t − w' t| → 0` for every compact `K` [HR, Theorem A.11, p. 437].
  Route: `TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le` at the
  rational times of `[0, T]`, a diagonal subsequence, and the equicontinuity to pass to all
  times; the limit inherits `∫⁻ |w' t − w' s| ≤ L|t − s|` by Fatou's lemma on each compact.

*Needs:* 1.1; Tau Ceti
`TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le`.

### 4.3 Limits are entropy solutions

- **Entropy limits** (`isEntropySolution_of_tendsto`): a measurable `L¹_loc` limit of a consistent
  update with locally Lipschitz flux that is monotone on `[m, M]`, started from measurable data
  with values a.e. in `[m, M]`, is an entropy solution on `(0, T)` for every `T`, in the sense of
  HamiltonJacobiAndConservationLaws §6.1 [HR, Theorem 3.9, p. 111]. Route: the cell entropy
  inequality of 3.4 for every `k ∈ [m, M]` and 2.2 with `η = |· − k|`; for `k` outside `[m, M]`
  the entropy inequality is the weak formulation of 2.1 with a sign.

*Needs:* 2.1–2.2, 3.4; HamiltonJacobiAndConservationLaws §6.1.

### 4.4 Convergence

- **Convergence of monotone schemes** (`tendsto_schemeApprox`): let `F` be locally Lipschitz and
  consistent with `f`, `μ > 0`, the update monotone on `[m, M]`, and `u₀` integrable, of finite
  variation `essVar u₀`, with values a.e. in `[m, M]`. If `u` is the entropy solution with datum
  `u₀` on every `(0, T)`, `L¹`-continuous on `[0, ∞)`, then
  `sup_{t ∈ [0,T]} ∫⁻_K |schemeApprox p q F μ Δx u₀ t − u t| → 0` as `Δx → 0⁺` for every compact
  `K` and every `T` [HR, Theorem 3.9, p. 111]. Route: 4.1 and 1.1 give the hypotheses of 4.2 with
  `ρ = μL(p + q + 1)Δx · essVar u₀`; every limit is the entropy solution by 4.3 and uniqueness
  (HamiltonJacobiAndConservationLaws §6.2), so the whole family converges. The entropy solution
  exists and has the continuous representative by HamiltonJacobiAndConservationLaws §6.4.

**Checks.**
- The upwind scheme for `f(u) = u` with `μ = 1` reproduces `u₀(x − t)` on the grid exactly, and
  the convergence reduces to `L¹` continuity of translation.
- Lax–Friedrichs on Burgers' equation on `[0, 1]` with `μ = 0.9`: the flux is Lipschitz in the sup
  norm with `L = 1/2 + 1/μ`, and for data of variation `2` the `ℓ¹` step bound of 4.1 is
  `0.9 · 1.611 · 2 · 2 = 5.8` (computed).
- Negative control (monotonicity): the Lax–Wendroff scheme is consistent and conservative but
  not monotone; for Burgers' equation with data `−1` for `j < 0` and `1` for `j ≥ 0` every interface
  flux equals `1/2` (computed), so the stationary non-entropy jump is a fixed point and the limit
  is not the rarefaction.

*Needs:* 1.1, 4.1–4.3; HamiltonJacobiAndConservationLaws §§6.2, 6.4.

## Layer 5: order barriers

### 5.1 The Harten–Hyman–Lax theorem

`schemeMap p q F μ` is the update as a function of the `p + q + 2` values
`v (j − p − 1), …, v (j + q)`, with `v j` in slot `p + 1`. At a constant state `u` with partial
derivatives `hᵢ = ∂ᵢH(u, …, u)`, consistency gives `∑ h_i = 1` and
`∑ (i − p − 1) h_i = −μ f'(u)`, and
`hhlBeta p q F μ f u = ∑ (i − p − 1)² h_i − μ² f'(u)²`.

- **The coefficient** (`hhlBeta_nonneg`): for a consistent `C¹` flux whose scheme map is monotone
  on `I^{p+q+2}` and `u` interior to `I`, `β(u) ≥ 0`, and `β(u) = 0` exactly when a single
  partial derivative `hᵢ` is nonzero, and then `μ f'(u) = p + 1 − i` [HR, (3.34)–(3.41),
  pp. 112–114]. Route: monotonicity gives `hᵢ ≥ 0`, so `β` is the variance of the offsets
  `i − p − 1` under the weights `hᵢ`.
- **Translation case** (`affine_of_hhlBeta_eq_zero`): under the same hypotheses, if `β` vanishes
  on an open interval `J ⊆ I` and `μ > 0`, then `f` is affine on `J` with slope `k/μ` for an
  integer `k` [HR, Theorem 3.10, p. 115]. Route: the previous bullet makes `μ f'`
  integer-valued and continuous on `J`.
- **The defect** (`isBigO_hhl_defect`): for a consistent `C³` flux and a `C³` classical solution
  of `∂ₜu + f'(u)∂ₓu = 0`, at every point the one-step defect satisfies
  `u(t + μΔx, x) − H(u(t, x + (i − p − 1)Δx)_i) = −(Δx²/2) ∂ₓ(β(u) ∂ₓu) + O(Δx³)`
  [HR, (3.34)–(3.41), pp. 112–114; GR, Chapter IV, Proposition 1.2, p. 219]. Route: Taylor
  expansion of both sides to second order, `∂ₜ²u = ∂ₓ(f'(u)² ∂ₓu)`, and the conservation form,
  which turns the second-order term of `H` into a divergence.

Together the last two say that a monotone scheme is at most first-order accurate unless the
flux is affine with integer CFL number, where the scheme is an exact translation.

*Needs:* 1.2; Mathlib `Asymptotics.IsBigO`.

### 5.2 Godunov's barrier

- **Semi-discrete** (`one_le_abs_sum_sq_mul`): for `w_j' = (a/h) ∑ γ_k w_{j+k}` with `a ≠ 0`,
  positivity `a γₖ ≥ 0` for `k ≠ 0` and first-order consistency `∑ kγ_k = −1`, the second moment
  satisfies `|∑ k²γ_k| ≥ 1`; hence the second-order condition `∑ k²γ_k = 0` fails and a positive
  semi-discretization of advection is at most first-order [HV, Chapter I, (3.25)–(3.26), p. 59,
  and (7.6), p. 118, with the order barrier in §I.7, p. 119]. Route:
  `|∑ k²γ_k| = ∑ k²|γ_k| ≥ ∑ |k||γ_k| ≥ |∑ kγ_k|`. The condition `∑ γ_k = 0` of the source is not
  needed.
- **Fully discrete** (`exists_int_eq_of_positive_stencil_secondMoment`): a nonnegative stencil
  `c` with `∑ c_k = 1`, `∑ k c_k = ν` and `∑ k² c_k = ν²`, the moments of the translation
  `v ↦ v(· + ν)`, is a unit mass at `k = ν`, so `ν` is an integer. Route: `∑ (k − ν)² c_k = 0`.
- **Monotonicity preservation is monotonicity** for linear schemes
  (`nonneg_of_isMonotonicityPreservingOn_linearScheme`): if `v ↦ ∑ c_k v(· + k)` preserves
  monotonicity, all `cₖ ≥ 0`. Route: apply it to the step `v j = [j ≥ j₀]`, whose image has
  increments `c_{j₀−j−1}`. With the previous bullet: a linear monotonicity preserving scheme of
  second order is an exact translation (Godunov's theorem).

**Checks.**
- Lax–Friedrichs on Burgers' equation, `u(t, x) = x/(1 + t)`: the defect minus
  `−(Δx²/2)∂ₓ(β ∂ₓu)` vanishes through order `Δx²`, with `β = 1 − μ²u²` (computed symbolically).
- Lax–Friedrichs (`p = 0`, `q = 1`) with `ν = μ f'(u)`: the weights `hᵢ` are `(1 + ν)/2`, `0`,
  `(1 − ν)/2` on the offsets `−1, 0, 1`, with mean `−ν`, and `β = 1 − ν²`; it is positive for
  `|ν| < 1` and vanishes at `ν = ±1`, where a single weight is nonzero and the scheme is the
  translation by one cell.
- Upwind for `f(u) = u`, `μ = 1`: `h = (1, 0)`, `β = 1 − 1 = 0`, the translation case with `k = 1`.
- The minimum of `∑ k²γ_k` under the constraints of the semi-discrete bullet with `a > 0` is `1`,
  attained by first-order upwind `γ_{−1} = 1`, `γ_0 = −1` (computed).
- Negative control (`a ≠ 0`): with `a = 0` the positivity condition is empty, and
  `γ_{−1} = 1/2`, `γ_1 = −1/2` has `∑ kγ_k = −1` and `∑ k²γ_k = 0`.
- Negative control (positivity): Lax–Wendroff for `f(u) = u` has coefficients
  `ν(1 + ν)/2`, `1 − ν²`, `−ν(1 − ν)/2` on `k = −1, 0, 1`, matches the three moments of the
  translation by `−ν` (computed for `ν = 0.3, 0.7`), and has a negative coefficient for
  `0 < ν < 1`.

*Needs:* The definitions of Layer 3.

## Layer 6: error estimates

### 6.1 Stability in the flux and front tracking

- **Stability in the flux** (`lintegral_sub_le_of_flux`): let `f, g` be Lipschitz with `f − g`
  `K`-Lipschitz on `[−M, M]`, and let `u, v` be the entropy solutions on `(0, T)` with integrable
  data `u₀, v₀` with values a.e. in `[−M, M]`. Then for almost every `t ∈ (0, T)`,
  `∫⁻ |u t − v t| ≤ ∫⁻ |u₀ − v₀| + t · min(essVar u₀, essVar v₀) · K`
  [HR, Theorem 2.14, (2.79), p. 86, for piecewise `C²` fluxes]. Route: the source's statement for
  piecewise affine interpolants of `f` and `g` on a common grid, whose difference interpolates
  `f − g` and so is `K`-Lipschitz, and the qualitative stability in the flux of
  HamiltonJacobiAndConservationLaws §6.4 to pass to the limit.
- **Front tracking** (`exists_frontTracking_scalar`): for a continuous piecewise affine flux with
  breakpoints `b` (`IsPiecewiseAffine`) and step data `u₀` (`IsStepFunction`: constant on every
  closed interval that misses a finite set), there are an entropy solution `u` on every
  `(0, T)` and `N` such that at each positive time `u t` is a step function with at most `N`
  jumps and values in the values of `u₀` and the breakpoints [HR, Lemma 2.6, p. 71, and
  Corollary 2.8, p. 73]. Route: solve each Riemann problem by the lower convex envelope of the
  flux between its states for an increasing jump and the upper concave envelope for a decreasing
  one, each piecewise affine with breakpoints among those of the flux; finitely many interactions
  occur by the source's count of fronts and states.

*Needs:* HamiltonJacobiAndConservationLaws §§5.4, 6.1–6.2, 6.4.

### 6.2 Kuznetsov's lemma

For a mollifier profile `θ` (smooth, even, values in `[0, 1]`, support in `[−1, 1]`, integral
one; `IsMollifierProfile`) and `θ_ε(y) = θ(y/ε)/ε` (`mollifier`), `kruzkovFunctional f T u φ k`
is
`∫₀^T ∫ (|u − k| ∂ₛφ + sign(u − k)(f(u) − f(k)) ∂ₓφ) − ∫ |u(T) − k| φ(T) + ∫ |u(0) − k| φ(0)`,
and the Kuznetsov form `kuznetsovForm f θ ε ε₀ T u v` integrates it over `(s', x') ∈ (0, T) × ℝ`
with `k = v(s', x')` and `φ(s, x) = θ_{ε₀}(s − s') θ_ε(x − x')`. The time modulus
`timeModulus u T ε₀` is the supremum of `∫⁻ |u(t + τ) − u(t)|` over `t, t + τ ∈ [0, T]` and
`|τ| ≤ ε₀`, in `ℝ≥0∞`.

- **Kuznetsov's lemma** (`kuznetsov`): let `f` be `L`-Lipschitz, `0 < ε`, `0 < ε₀ < T < T'`, `v`
  the entropy solution on `(0, T')` with integrable datum `v₀`, `L¹`-continuous on `[0, T]`, and
  `u` bounded and measurable with integrable slices on `[0, T]`. Then
  `‖u(T) − v(T)‖₁ + Λ_{ε,ε₀}(u, v) ≤ ‖u(0) − v₀‖₁ + essVar v₀ · (2ε + ε₀L) + ν(u, ε₀)`
  [HR, (3.54)–(3.56), pp. 127–128, and Theorem 3.14, p. 128]. Route: the doubling of variables
  of Kružkov's proof with `v` an exact solution, and the translation estimate
  `TauCeti.lintegral_enorm_comp_add_sub_le_mul_totalVariationOn` for the error terms. The source
  states the left side with the left limit `u(T−)` and assumes `u` of bounded variation; its
  proof compares `u(T)` with `u(s)` for `s < T` only through `ν(u, ε₀)`, which contains the value
  `u(T)`, and uses bounded variation only for `v`.
- **Exact solutions** (`kuznetsovForm_nonneg`): for continuous `f`, if `u` is itself the entropy
  solution on `(0, T')`, `L¹`-continuous on `[0, T]`, with integrable datum, and `v` is bounded
  and measurable with integrable slices, then `Λ_{ε,ε₀}(u, v) ≥ 0`. Route: for fixed `(s', x')`
  the test function is nonnegative, and the terms at `T` and `0` are the limits of a cut-off in
  time by `L¹` continuity.

*Needs:* HamiltonJacobiAndConservationLaws §§6.1–6.2, 6.4; Tau Ceti
`TauCeti.lintegral_enorm_comp_add_sub_le_mul_totalVariationOn`.

### 6.3 Rates

- **Vanishing viscosity** (`lintegral_viscous_sub_le`): for `f ∈ C²` and `δ > 0`, a bounded
  classical solution `uδ` of `∂ₜu + ∂ₓf(u) = δ∂ₓ²u`, continuous on `(0, ∞) × ℝ`, with `C²` slices
  and `L¹` initial trace `u₀`, satisfies `‖uδ(T) − u(T)‖₁ ≤ 4 essVar u₀ · √(Tδ)` for `T > 0`, with
  `u` the `L¹`-continuous entropy solution [HR, Example 3.16, p. 134, whose last display
  evaluates the minimum of `(2ε + 2Tδ/ε)` as `2√(Tδ)`; the minimum is `4√(Tδ)`]. Route:
  Kuznetsov's lemma with `u = uδ` (its value at `t = 0` replaced by `u₀`), the entropy dissipation
  `−Λ ≤ δ ∫∫∫ |∂ₓθ_ε| |∂ₓuδ| ≤ 2Tδ essVar u₀/ε` for a profile `θ` nonincreasing on
  `[0, ∞)`, so that `∫ |∂ₓθ_ε| ≤ 2/ε`, the decay of variation
  `essVar (uδ t) ≤ essVar u₀`, `ε₀ → 0`, and `ε = √(Tδ)`.
- **Monotone schemes** (`exists_lintegral_schemeApprox_sub_le_sqrt`): under the hypotheses of
  4.4 with `F` `L`-Lipschitz on `[m, M]^{p+q+1}`, there is `C` with
  `‖schemeApprox p q F μ Δx u₀ T − u(T)‖₁ ≤ C√Δx` for `0 < Δx ≤ 1` [HR, Example 3.17,
  pp. 134–139, and (3.72), p. 139]. Route: Kuznetsov's lemma with `u` the approximation, the
  cell entropy inequality of 3.4 to bound `−Λ` by `C(Δx/ε + Δx/ε₀)` times the variation, the
  time modulus `ν ≤ C(ε₀ + Δx)` from 4.1, and `ε = ε₀ = √Δx`.

**Checks.**
- `f = 0` (heat equation, `u(T) = u₀`), `u₀` the indicator of `[0, 1]`, `T = 1`: the error is
  `2 · 2√δ/√π`, that is `0.2257`, `0.0714`, `0.0226` for `δ = 10⁻², 10⁻³, 10⁻⁴`, below the
  bounds `0.8`, `0.253`, `0.08`.
- Negative control (the exponent): in the same example the error divided by `√δ` is `2.257` for
  all three `δ`, while the error divided by `δ` is `22.6`, `71.4`, `225.7`; no bound of order `δ`
  holds.
- Upwind for `f(u) = u`, `μ = 1/2`, `u₀` the indicator of `[0, 1]`: the `L¹` error at `T = 1`
  divided by `√Δx` is `1.140`, `1.126`, `1.128`, `1.128` for `Δx = 0.08, 0.02, 0.005, 0.00125`
  (computed), so the exponent `1/2` is attained.
- Two linear fluxes `f(u) = u`, `g(u) = u/4`, `u₀ = v₀` the indicator of `[0, 1]`, `t = 1/2`:
  the solutions are the indicators of `[1/2, 3/2]` and `[1/8, 9/8]`, at `L¹` distance `3/4`,
  and the bound is `t · min(2, 2) · 3/4 = 3/4`: equality in the flux stability bound.
- Front tracking for `f(u) = |u|`, breakpoint `0`, data `1` on `x < 0` and `−1` on `x ≥ 0`: the
  Rankine–Hugoniot speed is `0` and both characteristic speeds point into the jump, so the
  solution is the stationary jump, with values `1, −1` and one jump for all time.
- Front tracking for `f(u) = |u|` and data `−1, 1`: the solution is a pair of fronts from `0`
  through the breakpoint value `0`, moving with speeds `−1` and `1`; the value `0` is not a value
  of the data, which is why the breakpoints enter the range.

*Needs:* 3.4, 4.1, 4.4, 6.2; HamiltonJacobiAndConservationLaws §§6.2–6.4.

## Layer 7: entropy-conservative and entropy-stable fluxes

Here `V` is a real inner product space of states, `w : V → V` an entropy variable (the gradient
of an entropy `η`), `qf` the entropy flux, and
`entropyFluxPotential w f qf u = ⟪w(u), f(u)⟫ − qf(u)`, written `ψ`. A two-point flux `g` is
entropy conservative if `⟪w b − w a, g a b⟫ = ψ b − ψ a` for all states and entropy stable if
`≤` holds [Ta, (3.10)–(3.11), p. 464; the cell entropy inequality they encode is (3.3),
p. 463]. Tadmor's numerical entropy flux is
`tadmorEntropyFlux w f qf g a b = ½⟪w a + w b, g a b⟫ − ½(ψ a + ψ b)` [Ta, p. 464, the flux
of the identity (3.9)].

### 7.1 Characterization

- **Entropy conservation** (`entropyConservative_iff`): for a consistent `g`, entropy
  conservation is equivalent to the existence of a numerical entropy flux `G`, consistent with
  `qf`, with the cell equality `G b c − G a b = ⟪w b, g b c − g a b⟫` for all `a, b, c`; Tadmor's
  flux is one [Ta, Theorem 3.1, p. 464]. Route: `⇐` by the cell equality at `(a, b, b)` and
  `(a, a, b)`; `⇒` by expanding Tadmor's flux.
- **Entropy stability** (`entropyStable_iff`): the same with `≤` in both places
  [Ta, Theorem 3.1, p. 464, the entropy-stable case]. Route: as for conservation; for `⇒`,
  Tadmor's flux satisfies the cell inequality with defect half the sum of the two interface
  defects.

*Needs:* Mathlib real inner product spaces.

### 7.2 The semi-discrete entropy inequality

- **Cell entropy inequality** (`hasDerivAt_entropy_le`): along a solution of
  `u_j' = −(g(u_j, u_{j+1}) − g(u_{j−1}, u_j))/Δx` with an entropy-stable flux and `η` with
  gradient `w`, `(η ∘ u_j)' ≤ −(G_{j+1/2} − G_{j−1/2})/Δx` with Tadmor's flux
  [Ta, (3.9) and Theorem 3.1, p. 464]. Route: the chain rule and the three-point inequality of 7.1
  at `b = u_j`. Consistency of `g` is not needed for the inequality.

*Needs:* 7.1.

### 7.3 The scalar entropy-conservative flux

`entropyConservativeFlux w f qf a b = (ψ b − ψ a)/(w b − w a)` off the diagonal and `f a` on it.

- **Formula, uniqueness and continuity** (`entropyConservativeFlux_spec`): on an open interval
  `I` where `η ∈ C²` with `η'' > 0`, `f ∈ C¹` and `qf' = η' f'`, the flux with `w = η'` is
  continuous on `I × I`, equals the `η''`-weighted average `(∫ₐᵇ f η'')/(w b − w a)` off the
  diagonal, and is the only entropy-conservative flux off the diagonal [Ta, (4.4), p. 465, there
  as an average along the segment of entropy variables, and Example 4.2, p. 466]. Route:
  `ψ' = w' f`, so `ψ b − ψ a = ∫ₐᵇ f η''` by
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`; uniqueness since `w` is strictly increasing;
  continuity since the weighted average of a continuous function tends to its value.

**Checks.**
- `entropyStable_viscosityForm_iff` (proved): `g* − (Q/2)(w b − w a)` is entropy stable at
  `(a, b)` exactly when `Q ≥ 0` [Ta, (4.3) and (4.6), p. 465, and Corollary 4.1, pp. 465–466].
- `entropyConservativeFlux_burgers` (proved): for Burgers' flux and `η = u²/2`,
  `g*(a, b) = (a² + ab + b²)/6`.
- `entropyConservativeFlux_burgers_log` (proved): for Burgers' flux and `η = −log u` on `u > 0`,
  `g*(a, b) = ab/2` [Ta, Example 4.2, p. 466].
- The three-point cell equality for Tadmor's flux with the Burgers flux of the second Check at
  `(a, b, c) = (0, 1, 2)`: `G 0 1 = 0`, `G 1 2 = 1`, and `⟪w 1, g 1 2 − g 0 1⟫ = 7/6 − 1/6 = 1`.
- For `f = exp` and `η = exp`, the integral and difference forms agree:
  `g*(a, b) = (exp a + exp b)/2` [Ta, Example 4.2, p. 466], `2.5806` at `(1.3, 0.4)`.
- Negative control: the central flux `(f a + f b)/2` is not entropy conservative for Burgers'
  equation with `η = u²/2`; at `(0, 1)` it gives `1/4 ≠ 1/6`.

*Needs:* 7.1; Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

## Layer 8: the Riemann problem for systems

### 8.1 Weak solutions and jumps

`IsWeakConservationLaw f u₀ u` says that `u` is measurable and essentially bounded on
`(0, ∞) × ℝ` and satisfies
`∫₀^∞ ∫ (∂ₜφ u + ∂ₓφ f(u)) + ∫ φ(0, x) u₀(x) = 0` for every `C¹` test function of compact support
on `[0, ∞) × ℝ`, with `u₀` locally integrable; the values lie in a real Banach space.

- **Rankine–Hugoniot** (`isWeakConservationLaw_singleJump_iff`): the single jump from `a` to `b`
  with speed `s` is a weak solution with Riemann data `riemannData a b` exactly when
  `f b − f a = s(b − a)` [GR, Chapter I, Theorem 4.1, p. 32]. Route: split the integral
  along the line `x = st` and apply the divergence theorem on each half-plane.

**Checks.**
- `isWeakConservationLaw_iff_isIntegralSolution` (proved): for scalar laws the definition is the
  integral solution of HamiltonJacobiAndConservationLaws §5.1.
- Burgers' equation, `a = 1`, `b = 0`: the speed is `1/2`.
- Negative control: the jump from `1` to `0` with speed `0` is not a weak solution, since
  `f(0) − f(1) = −1/2 ≠ 0`.
- `a = b`: the condition holds for every `s`, and the jump is the constant solution.

*Needs:* HamiltonJacobiAndConservationLaws §5.1 (for the scalar Check); Mathlib `HasCompactSupport`.

### 8.2 Hyperbolicity and elementary waves

`IsStrictlyHyperbolicOn f U lam r`: `U` open, `f ∈ C²(U)`, `λ_k`, `r_k ∈ C¹(U)`, the speeds
strictly increasing in `k` at each state and `r_k` a nonzero right eigenvector of the Jacobian
of `f` with eigenvalue `λ_k`. The field `k` is genuinely nonlinear (`IsGenuinelyNonlinearOn`) if
`∇λ_k · r_k > 0` on `U`, linearly degenerate (`IsLinearlyDegenerateOn`) if it vanishes.

- A Lax `k`-shock (`IsLaxShock`) from `a` to `b` with speed `s`: the Rankine–Hugoniot condition,
  `λ_k(b) < s < λ_k(a)`, `λ_i(a) < s` for `i < k` and `s < λ_i(b)` for `i > k`
  [HR, Definition 5.13, p. 248]. A `k`-contact (`IsContact`): Rankine–Hugoniot with
  `λ_k(a) = s = λ_k(b)`. A `k`-rarefaction fan (`IsRarefactionFan`) on `[σ, τ]`: `λ_k(W ξ) = ξ`
  and `W'(ξ)` parallel to `r_k(W ξ)`. An elementary wave (`IsElementaryWave`) is a trivial
  wave, a shock or contact, or a fan; a Riemann fan (`IsRiemannFan`) from `a` to `b` is a
  succession of elementary waves of the families `0, …, m − 1` with increasing speeds separated
  by constant states.
- **Fans are weak solutions** (`isWeakConservationLaw_of_isRiemannFan`): for a strictly
  hyperbolic flux and a Riemann fan `W`, `u(t, x) = W(x/t)` is a weak solution with data
  `riemannData a b`. Route: in a fan `∂ₜu + ∂ₓf(u) = t⁻¹(−ξ + λ_k)W' = 0`; jumps satisfy
  Rankine–Hugoniot; constant states are solutions; glue by 8.1.

*Needs:* 8.1.

### 8.3 Hugoniot curves

- **Hugoniot curves and the Lax condition** (`exists_hugoniotCurve`): in a genuinely nonlinear
  field `k`, through each `a ∈ U` there is a `C¹` curve `H` of states joined to `a` by a jump
  with speed `s(ε)` satisfying Rankine–Hugoniot, with `H 0 = a`, `H'(0) = r_k(a)`,
  `s(0) = λ_k(a)`, and for small `ε ≠ 0` the jump is a Lax `k`-shock exactly when `ε < 0`
  [HR, Theorem 5.11, p. 238, and Theorem 5.14, p. 248; GR, Chapter II, Theorem 5.2, p. 109].
  Route: the implicit function theorem (`HasStrictFDerivAt.implicitFunction`) for
  `f(b) − f(a) = s(b − a)` after division by `|b − a|`, and `s'(0) = ½∇λ_k · r_k`.

*Needs:* 8.2; Mathlib `HasStrictFDerivAt.implicitFunction`.

### 8.4 Wave curves

- **Wave curves** (`exists_waveCurve`): if every field is genuinely nonlinear or linearly
  degenerate, then for `uL ∈ U` and each `k` there are a neighbourhood `V` of `uL` and a map `Φ`,
  `C¹` in `(ε, a)` on `(−ε₀, ε₀) × V`, with `Φ(0, a) = a`, `∂_εΦ(0, a) = r_k(a)`, such that `a`
  and `Φ(ε, a)` are joined by an elementary `k`-wave with states in `U` [HR, Theorems 5.6
  and 5.7, pp. 231–232, and Theorem 5.16, p. 253]. Route: integral curves of `r_k`
  (`ODE_solution_unique` for uniqueness) for `ε > 0` in a genuinely nonlinear field, the Hugoniot
  curve of 8.3 for `ε < 0`, and both coincide in a linearly degenerate field, where every jump
  on them is a contact.

*Needs:* 8.3; Mathlib `ODE_solution_unique`.

### 8.5 Lax's theorem

- **Lax's theorem** (`exists_selfSimilar_riemann_solution`): if every field is genuinely
  nonlinear or linearly degenerate, each `uL ∈ U` has a neighbourhood `V ⊆ U` such that for every
  `uR ∈ V` the Riemann problem has a Riemann fan with states in `V`, and two such fans agree
  almost everywhere [HR, Theorem 5.17, p. 254; GR, Chapter II, Theorem 6.1, p. 117]. Route: the
  composite `(ε_0, …, ε_{m−1}) ↦ Φ_{m−1}(ε_{m−1}, …, Φ_0(ε_0, uL))` has derivative with columns
  `r_k(uL)` at `0`, which form a basis; the inverse function theorem gives existence and
  uniqueness of small strengths, and the Lax condition rules out waves of other families on
  small jumps. Take `V` the image of a small open cube of strengths: the intermediate states and
  the values inside the fans of the solution for strengths `(ε_0, …, ε_{m−1})` have strengths
  `(ε_0, …, ε_{k−1}, ε', 0, …, 0)` with `|ε'| ≤ |ε_k|`, in the same cube, so they lie in `V`. For
  a ball `V` this fails: the intermediate states for `uR` near its boundary may leave it.

**Checks.**
- Linear systems `f(u) = Au` with distinct eigenvalues: every field is linearly degenerate, the
  wave curves are the lines `a + εr_k`, and the Riemann solution decomposes `uR − uL` in the
  eigenbasis.
- Shallow water `(h, hv) ↦ (hv, hv² + gh²/2)` with `g = 1` at `h > 0`: `λ = v ∓ √h`, both fields
  genuinely nonlinear. The jump from `(1, 0)` to `(2, −√3)` with speed `−√3` satisfies
  Rankine–Hugoniot (residual `4 · 10⁻¹⁶`) and the Lax condition for the first family:
  `λ₁ = −2.280 < −1.732 < −1` and `−1.732 < λ₂ = 0.548` at the right state (computed).
- `m = 1`: a Riemann fan is a single elementary wave, and Lax's theorem gives the solution of the
  scalar Riemann problem with convex flux near `uL` (HamiltonJacobiAndConservationLaws §5.4).
- Negative control (Lax condition): for Burgers' equation the jump from `0` to `1` with speed
  `1/2` satisfies Rankine–Hugoniot but `λ(1) = 1 > 1/2`, so it is not a Lax shock; the Riemann fan
  from `0` to `1` is the rarefaction `W ξ = ξ` on `[0, 1]`.

*Needs:* 8.2–8.4; HamiltonJacobiAndConservationLaws §5.4 (for the scalar Check).

## Layer 9: small total variation

The approximate jump of `u` at `(t, x)` from `a` to `b` with speed `σ` (`IsApproxJumpPoint`)
means that the mean over the square of side `2ρ` of `‖u − U‖`, with `U` the jump along
`y = x + σ(s − t)`, tends to `0`. `SatisfiesLaxAtJumps lam u`: at every approximate jump at a
positive time some family `k` has `λ_k(b) ≤ σ ≤ λ_k(a)` [HR, condition (B), p. 345].
`HasBVAlongCurves u β`: along every positive `β`-Lipschitz curve `t = γ(x)` the function
`x ↦ u(γ x, x)` has locally bounded variation [HR, condition (C), p. 345].

### 9.1 Lipschitz continuity in time

- **Lipschitz in time** (`lintegral_sub_le_of_isWeakConservationLaw`): a weak solution with
  values in `K`, where `f` is `L`-Lipschitz, with `eVariationOn (u t) univ ≤ C` for `t > 0`,
  satisfies `∫⁻ |u t − u s| ≤ C L |t − s|` for almost all `s, t > 0` [HR, Remark 7.9 and
  Theorem 7.10, p. 345]. Route: test the equation with `φ(x)χ_{[s,t]}`, bound
  `|∫ ∂ₓφ f(u)|` by the variation of `f ∘ u` (`LipschitzOnWith.comp_eVariationOn_le`) and pair
  with test functions of sup norm one in the dual norm.

*Needs:* 8.1; Mathlib `LipschitzOnWith.comp_eVariationOn_le`.

### 9.2 Front tracking

- **Front-tracking approximations** (`exists_frontTracking`): if every field is genuinely
  nonlinear or linearly degenerate and `ū ∈ U`, there are `δ₀ > 0` and `C` such that measurable
  data `u₀` with `u₀ − ū` integrable, `‖u₀ − ū‖ < δ₀` and variation below `δ₀` have, for each
  `δ ∈ (0, 1]`, a measurable piecewise constant approximation `w δ` with values in `U`, finitely
  many jumps at each time, variation at most `C` times that of `u₀`, `L¹`-Lipschitz in time with
  constant `C · eVariationOn u₀ univ`, initial error at most `δ`, and weak residual tending to
  `0` with `δ` for every test function [HR, Theorem 6.4, p. 297, and Theorem 6.7, p. 307; Br].
  Route: approximate Riemann solvers with rarefactions split into fronts of size `δ`, Glimm's
  interaction potential to bound the variation and the number of fronts, and non-physical fronts
  to keep the number finite.

*Needs:* 8.2–8.5.

### 9.3 Existence

- **Global existence for small variation** (`exists_isWeakConservationLaw_smallTV`): with the
  same hypotheses there are `δ > 0`, `C` and `β > 0` such that the data above have a global weak
  solution with values in `U`, variation at most `C` times that of `u₀` at all times, Lax's
  condition at its jumps and bounded variation along `β`-Lipschitz curves [HR, Theorem 6.7,
  p. 307; Br]. Route: 9.2, compactness as in 4.2 (with `eVariationOn` and Helly's
  selection theorem), and passage to the limit in the residual.

*Needs:* 4.2, 9.1–9.2.

### 9.4 The standard Riemann semigroup

- **Semigroup and uniqueness** (`exists_smallVariation_conservation_semigroup`): with the same
  hypotheses there are `δ > 0`, `C`, `β > 0`, a set `D` of data containing all data of 9.3, and a
  map `S` with `S t D ⊆ D`, `S 0 v = v` and `S(s + t) = S s ∘ S t` almost everywhere,
  `∫⁻ |S t v − S t w| ≤ C ∫⁻ |v − w|` for `v, w ∈ D`, whose trajectories are weak solutions with
  values in `U`, Lax's condition at jumps and bounded variation along `β`-Lipschitz curves, and
  such that every weak solution with these two properties and values in `D` at positive times is
  the trajectory of `S` for almost every `t` [HR, Theorem 7.8, p. 344, and Theorem 7.20, p. 365;
  Br]. Route: the Bressan–Liu–Yang functional, equivalent to the `L¹`
  distance and almost decreasing along front-tracking approximations, gives the Lipschitz bound
  and the convergence of 9.2; uniqueness by comparing an arbitrary solution with the semigroup
  along the error formula `‖u(t) − S t v‖ ≤ C ∫₀^t liminf_h ‖u(s + h) − S h u(s)‖/h ds`.

**Checks.**
- For a linear system `f(u) = Au` with distinct eigenvalues and eigenvector matrix `R` the
  semigroup translates the characteristic components of `R⁻¹v`, and the Lipschitz constant can be
  taken `m ‖R‖ ‖R⁻¹‖` in the sup norm.
- `m = 1`: the semigroup is the restriction of the entropy semigroup of
  HamiltonJacobiAndConservationLaws §6.4 to data near `ū`, with `C = 1`.
- Negative control (condition (B)): for Burgers' equation the jump from `0` to `1` with speed
  `1/2` is a weak solution of bounded variation that violates Lax's condition and differs from
  the rarefaction given by `S`; uniqueness fails without the condition.

*Needs:* 9.2–9.3; HamiltonJacobiAndConservationLaws §6.4 (for the scalar Check).

## Downstream consumers

- Higher-order finite volume methods (MUSCL reconstructions, flux limiters, ENO and WENO) consume
  the TVD framework and Harten's lemma (§3.3) and the Lax–Wendroff theorem (Layer 2).
- Entropy-stable discontinuous Galerkin and summation-by-parts methods consume Tadmor's fluxes
  (Layer 7).
- Godunov-type schemes and approximate Riemann solvers (Roe, HLL) for systems consume the Riemann
  problem (Layer 8).
- Error analysis of numerical methods for systems consumes the small-variation theory (Layer 9).
- Numerical methods for balance laws, multidimensional problems on unstructured meshes and
  well-balanced schemes consume Layers 1–6.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above. It owns grid variation and cell-average estimates, conservative
schemes with general stencils, the Lax–Wendroff theorem and its entropy version, the monotone,
`ℓ¹`-contractive, TVD and monotonicity preserving properties with their implications, Harten's
lemma, the Crandall–Majda cell entropy inequality, the convergence of monotone schemes, the
Harten–Hyman–Lax and Godunov barriers, stability of entropy solutions in the flux (the
quantitative statement), scalar front tracking, Kuznetsov's lemma and the rates `√δ` and `√Δx`,
Tadmor's entropy-conservative and entropy-stable fluxes, weak solutions of systems and the
Riemann problem for strictly hyperbolic systems, and the small-variation theory of Layer 9.

Inputs, not restated:
- Mathlib: `eVariationOn`, `LocallyLipschitz`, `LipschitzOnWith`,
  `LipschitzOnWith.comp_eVariationOn_le`, `LocallyIntegrable`, `HasCompactSupport`,
  `Asymptotics.IsBigO`, `HasStrictFDerivAt.implicitFunction`, `ODE_solution_unique`,
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`.
- Tau Ceti: `TauCeti.totalVariationOn`,
  `TauCeti.lintegral_enorm_comp_add_sub_le_mul_totalVariationOn`,
  `TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le`,
  `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`.
- [GeometricMeasureTheory](../GeometricMeasureTheory/README.md) §3.3: the distributional variation
  on an interval is the essential variation, attained by the right-continuous representative.
- HamiltonJacobiAndConservationLaws: integral solutions and the scalar Rankine–Hugoniot
  condition (§5.1), the scalar Riemann problem (§5.4), entropy solutions (§6.1, copied
  verbatim), the `L¹` contraction, uniqueness, comparison, maximum principle and the decay of
  `totalVariationOn volume ⊤ (u t)` (§6.2), the viscous approximation (§6.3), and existence, the
  time-continuous representative, qualitative stability in the flux and the Lipschitz bound
  `N · TV(u₀) · |t − s|` (§6.4).

Left to other roadmaps or outside the family:
- the scalar theory of HamiltonJacobiAndConservationLaws listed above, including the total
  variation bound and the Lipschitz bound in time for scalar entropy solutions;
- linear symmetric hyperbolic systems, their energy estimates, and Friedrichs' scheme for them
  (the Lax–Friedrichs scheme in one space variable) with its `L²` stability under the CFL
  condition (SymmetricHyperbolicSystems, Layers 2 and 4); classical solutions of the compressible
  Euler equations (CompressibleEulerEquations);
- the CFL condition as a necessary condition for convergence and the strong stability preserving
  time discretizations that make semi-discrete TVD and entropy-stable schemes fully discrete
  (a roadmap on finite-difference stability and the method of lines);
- Riemann invariants, the Godunov–Mock theorem and entropies of systems beyond the entropy
  variables used in Layer 7.

## Exact supplier contracts

### From Mathlib

- `eVariationOn` (total variation in `ℝ≥0∞`) and `LipschitzOnWith.comp_eVariationOn_le`.
- `LocallyLipschitz`, `LipschitzOnWith`, `LocallyIntegrable`, `HasCompactSupport`,
  `Asymptotics.IsBigO`.
- `HasStrictFDerivAt.implicitFunction`, `ODE_solution_unique`,
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

### From Tau Ceti

- `TauCeti.totalVariationOn`: the variation of the distributional derivative on an open set.
- `TauCeti.lintegral_enorm_comp_add_sub_le_mul_totalVariationOn`: the `L¹` translation estimate
  `∫⁻ |u(· + h) − u| ≤ ‖h‖ · totalVariationOn`.
- `TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le`: compactness in
  `L¹_loc` of sequences bounded in `L¹_loc` with bounded variation.
- `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`: the variation along Lebesgue points is at
  most the total variation.

### From GeometricMeasureTheory

- §3.3: for `u` locally integrable on an open interval `I`, `TauCeti.totalVariationOn volume I u`
  is the infimum of `eVariationOn v I` over the `v` equal to `u` almost everywhere on `I`,
  attained by the right-continuous representative when finite (Conventions; 1.1).

### From HamiltonJacobiAndConservationLaws

- §5.1: `IsIntegralSolution`, copied verbatim.
- §5.4: the entropy solution of the Riemann problem for a uniformly convex flux (the `m = 1`
  Check of Layer 8).
- §6.1: `IsEntropySolution`, copied verbatim.
- §6.2: uniqueness and the `L¹` contraction of entropy solutions, for almost every `t`; the
  maximum principle; the decay of `totalVariationOn volume ⊤ (u t)`.
- §6.3: the `L¹` contraction and entropy identity of the viscous approximation, in the route of
  §6.3 here.
- §6.4: existence of the entropy solution for locally Lipschitz flux and bounded data, the
  representative continuous into `L¹_loc`, qualitative stability in the flux, and
  `‖u(t) − u(s)‖₁ ≤ N · TV(u₀) · |t − s|`.

## Beyond this roadmap

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **The Glimm scheme**: random choice, the interaction estimates and Glimm's functional, and the
  convergence of the scheme for almost every sampling sequence [Br].
- **Vanishing viscosity for systems**: the Bianchini–Bressan theorem that viscous approximations
  converge to the semigroup of Layer 9.
- **Rates for front tracking and for schemes for systems**: error estimates of order `√Δx` or
  `Δx |log Δx|` for systems, and the Bressan–Liu–Yang stability functional in quantitative form.
- **Nonconvex scalar Riemann problems and Liu's admissibility condition** for nonconvex systems.
- **High-order schemes**: MUSCL, flux limiters, ENO and WENO reconstructions and their TVD or
  entropy-stability properties [LV, Chapter 6].
- **Multidimensional schemes**: unstructured meshes, convergence of monotone finite volume schemes
  in several space dimensions and the `h^{1/4}` rate.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, module NASC/ConservationLaws.lean, proves without `sorry`, in its own
conventions:
- §3.4: the Crandall–Majda inequality for monotone three-point conservative updates
  (NASC.monotoneUpdate_entropy_inequality);
- §5.2: the fully discrete Godunov barrier (NASC.exists_int_eq_of_positive_stencil_secondMoment);
- §7.1: the scalar three-point inequality for Tadmor's numerical entropy flux under the
  entropy-stability condition, the core of the `⇒` direction of `entropyStable_iff`
  (NASC.tadmor_cell_entropy_le).

Its statements of the other targets of this roadmap carry `sorry`. Its modules are a cited
source, not the specification.

## References

- [Br] A. Bressan, *Hyperbolic Systems of Conservation Laws: The One-Dimensional Cauchy Problem*,
  Oxford University Press, 2000.
- [CM] M. G. Crandall and A. Majda, *Monotone difference approximations for scalar conservation
  laws*, Mathematics of Computation 34 (1980), 1–21,
  [doi:10.1090/S0025-5718-1980-0551288-3](https://doi.org/10.1090/S0025-5718-1980-0551288-3).
- [GR] E. Godlewski and P.-A. Raviart, *Numerical Approximation of Hyperbolic Systems of
  Conservation Laws*, 2nd ed., Springer, 2021.
- [HR] H. Holden and N. H. Risebro, *Front Tracking for Hyperbolic Conservation Laws*, 2nd ed.,
  Springer, 2015.
- [HV] W. Hundsdorfer and J. Verwer, *Numerical Solution of Time-Dependent
  Advection-Diffusion-Reaction Equations*, Springer, 2003.
- [Kr] S. N. Kružkov, *First order quasilinear equations in several independent variables*,
  Mathematics of the USSR-Sbornik 10 (1970), 217–243.
- [LV] R. J. LeVeque, *Finite Volume Methods for Hyperbolic Problems*, Cambridge University Press,
  2002.
- [Ta] E. Tadmor, *Entropy stability theory for difference approximations of nonlinear conservation
  laws and related time-dependent problems*, Acta Numerica 12 (2003), 451–512.
