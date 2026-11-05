# Roadmap: probabilistic, metric and ergodic number theory, part II — transfer operators and uniform renewal counting

**Summary.** For `n ≥ 3` the linear maps `γ_j(y) = (y₁, …, ŷ_j, …, y_n, Σ_{k≠j} y_k)` generate a free
semigroup acting on the ordered cone `H_n` of nonzero `y` with `0 ≤ y₁ ≤ ⋯ ≤ y_n` and
`y₁ + ⋯ + y_{n−1} = y_n`. The accelerated generators `γ_{n−1}^A γ_j` act on the projective section
`Δ_n = H_n / ℝ_{>0}` by countably many branches `F_a` with expansion factors `q_a`, and the free
semigroup `Γ′` they generate is counted by the growth of the last coordinate,
`N(w, r) = #{words u : log((γ_u y)_n / y_n) ≤ r}`. This roadmap
builds C¹ jet spaces on compact convex bodies, the explicit uniform contraction of the branches
and their closed coding attractor, the countable-branch transfer operators
`L_s f = Σ_a q_a^{−s} f∘F_a` with their two-norm (Ionescu-Tulcea–Marinescu) inequality, the
Schauder–Tychonoff fixed point theorem, Hennion's essential-radius bound, Birkhoff cone contraction
for general cones, a Ruelle–Perron–Frobenius theorem with a C¹ spectral gap for countably many
branches, analytic perturbation of simple isolated eigenvalues, Wielandt separation on vertical
lines from a non-lattice property of the delays, and a renewal Tauberian theorem that is uniform in
a compact parameter. The end theorems are `conformal_exponent`, a unique `β = β(n) > 1` admitting a
`β`-conformal probability on `Δ_n`, obtained from the pressure without arithmetic counting, and
`uniform_counting`, `N(w, r) ~ B(w) e^{βr}` uniformly in `w` for a positive C¹ function
`B = h_β / (β |λ′_β|)`. For `n = 3` the roadmap identifies `β(3) = 2` and proves
`counting_three`, `N(w, r) ~ 3e^{2r}/(π² w₂)` uniformly, through the Gauss map; it proves
`β(n) ≥ β(n − 1)` and the p-series enclosure `conformal_exponent_pseries` of `β(n)`.

## Scope and ownership

The base roadmap [ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md)
ends its continued-fraction theory with the total Gauss map, its invariant measure, the density
transfer operator at the Gauss parameter and an explicit C¹ derivative contraction with the
Gauss–Kuzmin rate (its §§4.4, 4.8 and 4.9). It has no complex parameter family, no spectral theory
of transfer operators and no higher-dimensional dynamics. This part continues in that direction:
the Gauss operator becomes the `n = 3` member of the family `L_s`, and the spectral theory is built
for every `n ≥ 3` and every complex `s` with `Re s > 1`.

This roadmap owns: the ordered projective simplex in chart coordinates, the accelerated branches,
their denominators and delays, chronological words and the renewal count (Layer 0); C¹ jet spaces
on compact convex bodies with value-plus-derivative norm, their pullbacks and compact inclusion
(Layer 0); the core/cusp decomposition, the ten short-block derivative bounds, uniform contraction
and the closed coding attractor (Layer 1); the countable-branch transfer operators on continuous and
C¹ functions, their C⁰ bounds, the two-norm inequality, holomorphy in the parameter, and the
two-sided Laplace and Mellin adapters (Layer 2); the Schauder–Tychonoff theorem, eigenprobabilities,
the Hilbert distance on general closed cones with Birkhoff's contraction theorem, the ball-cover
measure of noncompactness, Hennion's essential-radius bound, the countable-branch cone convergence
and the Ruelle–Perron–Frobenius theorem (Layer 3); simple isolated eigendata, their analytic
perturbation and uniform gaps on compact parameter intervals (Layer 4); the non-lattice condition,
its verification at branch fixed points, Wielandt separation and the pressure (Layer 5); uniform
growth, the renewal transform and its simple pole, uniform smoothing, the uniform renewal
Tauberian theorem, the conformal-measure characterisation and the counting theorem (Layer 6); the
parameter-dependent Gauss conjugacy, `β(3) = 2` with the explicit `n = 3` constant, the Rauzy
gasket comparison, explicit bounds for `β(n)` and monotonicity in `n` (Layer 7).

It leaves the following to named owners.

- The total Gauss map `gaussMap`, the Gauss measure `gaussMeasure`, the Gauss inverse branches with
  their absolute derivative and the invariant density telescope are ProbabilisticAndMetricNumberTheory
  §4.4; the density transfer operator `gaussDensityTransfer` and its duality are its §4.8; the
  explicit 9/10 contraction and the Gauss–Kuzmin rate are its §4.9. Layer 7 consumes them and proves
  only the parameter family and its conjugacy.
- The ordinary Laplace transform predicate `HasLaplace`, with its measure parameter, uniqueness and
  linearity, the squared-sinc kernel `squaredSinc`, the scalar monotone unsmoothing
  `monotoneUnsmoothing` and Delange's theorem `delangeLaplace` are ArithmeticDirichletSeriesPartII
  §§0.1, 1.1, 3.1 and 3.2. The two-sided transform used here is `HasLaplace` with the
  measure `volume`; this roadmap adds only its adapters. The uniform smoothing and uniform
  Tauberian theorems of Layer 6 differ from its Layer 3 in being uniform over a compact parameter
  space, with transforms valued in `C(X; ℂ)`; their scalar cases are its Layer 3.
- The scalar Wiener–Ikehara theorems are Tau Ceti's `TauCeti.LSeries.wienerIkehara` and its
  variants; they are not used.
- Brouwer's fixed point theorem for nonempty compact convex subsets of finite-dimensional real
  normed spaces, `brouwerFixedPoint_compactConvex_continuousOn`, is AlgebraicTopology Stage 2,
  item 7. Layer 3 consumes it for the finite-dimensional step of Schauder–Tychonoff and extends
  the fixed-point conclusion to compact convex subsets of Hausdorff locally convex spaces; the
  compact-map Schauder theorem on Banach spaces is BanachAlgebras A8.
- Hilbert's projective metric on positive vectors and Birkhoff's `tanh(Δ/4)` contraction for
  strictly positive finite matrices are Tau Ceti's `TauCeti.hilbertProjectiveDist`,
  `Matrix.projectiveDiameter` and `Matrix.hilbertProjectiveDist_mulVec_le`
  (`TauCeti/Data/Matrix/BirkhoffContraction.lean`); OptimalTransport Layer 13B, item 9 states the
  same finite case for strictly positive kernels. Layer 3 here proves the statement for salient
  convex cones in arbitrary real vector spaces and for the C¹ derivative cones; on strictly
  positive vectors its distance is the pinned one.
- The holomorphic functional calculus and Riesz idempotents for a finite partition of the spectrum,
  with the closed invariant direct-sum decomposition of a Banach-space operator, are BanachAlgebras
  A2. Layer 3 consumes them for the spectral splitting; the finite-cover estimate that bounds the
  essential spectral radius is owned here.
- Eigenvalue and spectral-subspace perturbation of self-adjoint operators belong to OperatorTheory
  (SelfAdjointSpectralTheory and SpectralSubspacePerturbation). Layer 4 differs in assuming
  neither an inner product nor an adjoint.
- Tau Ceti's `TauCeti.C1HolderSpace` is the space of bounded `C^{1,α}` maps on a whole normed
  space; the C¹ jets of Layer 0 differ in living on a compact convex body, with the segment-integral
  boundary convention and the sum norm.
- Ordinary renewal processes with i.i.d. increments, Blackwell's theorem and the key renewal theorem
  are MarkovChainsAndRenewal Layers 4–6. The renewal equation here is driven by a transfer
  operator, not by a single interarrival law.
- Markoff–Hurwitz varieties, their moves, the exceptional tuples and infinite descent are
  ClassicalArithmeticCompletion §§4.38, 4.57, 4.78 and 4.105. The passage from the linear count
  `N(w, r)` to integer points on Markoff–Hurwitz varieties (GMR19, §§2–3) and the identification of
  `β(n)` with Baragar's arithmetic exponent are outside this roadmap. No statement about the
  Hausdorff dimension of the attractor is made.

## Conventions

- **Dimensions.** `n ≥ 3` and `d = n − 2 ≥ 1`. A point of `Δ_n` is `w = (w₁, …, w_{n−1})` with
  `0 ≤ w₁ ≤ ⋯ ≤ w_{n−1}` and `Σ w_i = 1`, together with the homogeneous placeholder `w_n = 1`.
  Chart coordinates are `x = (w₁, …, w_d) ∈ ℝ^d` with `w_{n−1} = 1 − Σ_i x_i`; all derivatives act
  in dimension `d = n − 2`. In Lean a chart point is `x : Fin d → ℝ` with `x i = w_{i+1}`.
- **Alphabet.** A letter is `a = (A, j)` with `A ∈ ℕ` and `1 ≤ j ≤ n − 2`; it stands for the
  semigroup element `γ_{n−1}^A γ_j` (apply `γ_j`, then `γ_{n−1}` `A` times). In Lean the letter is
  `(A, j − 1) : ℕ × Fin d`. The sum defining `γ_j` runs over all `k ≠ j`, including `k = n`.
- **Words and codes.** A finite word `u = [a₁, …, a_m]` acts chronologically:
  `F_u = F_{a_m} ∘ ⋯ ∘ F_{a₁}` and `T_u(w) = Σ_k τ_{a_k}(F_{a_{k−1}} ⋯ F_{a₁} w)`; the empty word
  has `F = id` and `T = 0`. An infinite code `(a₁, a₂, …)` is read outer-prefix:
  `π(a) = lim_m F_{a₁} ∘ ⋯ ∘ F_{a_m}(w₀)`. The two orders are opposite.
- **Counts.** `N(w, r)` counts words, the empty word included, with multiplicity when several words
  send `w` to the same point; by freeness this equals the count of semigroup elements of GMR19 (1.7).
  It is `0` for `r < 0`; time is a real variable.
- **Norms.** Layer 1 uses the operator norm induced by `ℓ¹` on `ℝ^d` (maximal absolute column
  sum). C¹ norms are `‖f‖_∞ + ‖Df‖_∞` for a fixed norm on `ℝ^d`; all such norms are equivalent and
  the constants of the theorems absorb the change. The Lean predicate `C1BoundedOn` uses the
  pointwise sum `‖f(x)‖ + ‖Df(x)‖` and Lean's sup norm on `Fin d → ℝ`.
- **Complex weights.** `q^{−s} = exp(−s log q)` with real `q > 0`; this is the complex power with
  positive real base. No complex logarithm of a nonpositive number occurs.
- **Spectral radius.** Mathlib's `spectralRadius` takes values in `ℝ≥0∞`; real bounds are coerced.
- **Laplace and Fourier transforms.** The Laplace transform is the ordinary transform
  `∫ e^{−st} f(t) dt` of a function, never a Stieltjes transform, in the convention of
  ArithmeticDirichletSeriesPartII §0.1: `HasLaplace f s z μ` asserts integrability of
  `t ↦ e^{−st} f(t)` for `μ` and the value `z`. The one-sided transform uses
  `μ = volume.restrict (Ioi 0)`, the two-sided transform `μ = volume`. Fourier transforms use
  angular frequency, `k̂(ξ) = ∫ e^{−iξt} k(t) dt`, with inverse factor `1/(2π)`.
- **Measures.** Probability measures on `Δ` are Borel probability measures on `ℝ^d` carried by the
  chart image of `Δ`. Continuous test functions are continuous on `ℝ^d`; by Tietze's theorem this
  is the same as continuity on `Δ`.

## Exact supplier contracts

### From Mathlib

- Spectral theory: `spectralRadius` (`Mathlib/Analysis/Normed/Algebra/Spectrum.lean`), with its
  `ℝ≥0∞` values; `spectrum.isOpen_resolventSet` and `spectrum.isCompact` (same file);
  `spectrum.gelfand_formula`, `spectrum.nonempty` and `spectrum.hasFDerivAt_resolvent`
  (`Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`), which require a complete normed
  `ℂ`-algebra; `Module.End.maxGenEigenspace` and `Module.End.HasEigenvalue`;
  `ContinuousLinearMap.IsFredholm` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`).
- Analysis: `ImplicitFunctionData.differentiableAt_implicitFunction`
  (`Mathlib/Analysis/Calculus/Implicit.lean`), over a general complete nontrivially normed field
  and complete spaces; `DifferentiableOn.analyticOnNhd` (complex differentiability on an open set
  of `ℂ` gives analyticity of Banach-valued maps); `hasFDerivAt_tsum_of_isPreconnected` and
  `hasDerivAt_tsum_of_isPreconnected` (`Mathlib/Analysis/Calculus/SmoothSeries.lean`);
  `ContDiffOn`, `fderivWithin`, `contDiffOn_succ_iff_fderivWithin`, `uniqueDiffOn_convex`;
  `Convex.norm_image_sub_le_of_norm_fderivWithin_le`; `Seminorm` and `Seminorm.ball`
  (`Mathlib/Analysis/Normed/Module/Seminorm/Basic.lean`); `LocallyConvexSpace`
  (`Mathlib/Topology/Algebra/Module/LocallyConvex.lean`).
- Summability: `Real.summable_one_div_nat_rpow` (`Mathlib/Analysis/PSeries.lean`, summable iff
  `1 < p`, with the native value at `n = 0`), `Complex.summable_one_div_nat_cpow`
  (`Mathlib/Analysis/PSeriesComplex.lean`, summable iff `1 < Re p`), `hasSum_zeta_two`.
- Compactness: `BoundedContinuousFunction.arzela_ascoli`
  (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`, compact domain and a common compact
  value set); `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`
  (Stone–Weierstrass).
- Measures: `MeasureTheory.ProbabilityMeasure.continuous_integral_continuousMap`
  (`Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`, compact space, real continuous maps);
  `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le`
  (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`), used with the constant compact set `Δ` and zero
  bounds; `MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`
  (`Mathlib/MeasureTheory/Measure/FiniteMeasure.lean`); `MeasureTheory.Measure.pi` for `volume` on
  `Fin d → ℝ`.
- Integration: `MeasureTheory.integral_tsum` and
  `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`); `MeasureTheory.integral_comp_exp`
  and `MeasureTheory.integrable_comp_exp` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`,
  the substitution `u = e^t` over the whole line); `mellin` and `MellinConvergent`
  (`Mathlib/Analysis/MellinTransform.lean`; `mellin f s = ∫_{(0,∞)} t^{s−1} f(t) dt`);
  `Real.tendsto_integral_exp_smul_cocompact` (`Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`,
  Riemann–Lebesgue for functions with values in any complex normed space, in particular `C(X; ℂ)`).

### From Tau Ceti

Consume `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter` and
`Matrix.hilbertProjectiveDist_mulVec_le` (`TauCeti/Data/Matrix/BirkhoffContraction.lean`): for a
matrix `K` with strictly positive entries on finite index types and strictly positive vectors
`x`, `y`, `d(Kx, Ky) ≤ tanh(Δ(K)/4) d(x, y)`, where `d(x, y)` is the supremum over index pairs of
`log(x_i y_j/(y_i x_j))` and `Δ(K)` is the `d`-diameter of the columns of `K`; the formula is
total on all real vectors, and its metric laws hold on strictly positive vectors. This is the
finite positive-matrix case of §3.3 and is used there as a consistency check. Consume
`IsCompactOperator.finiteDimensional_genEigenspace_nat`
(`TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean`: every finite-order generalised
eigenspace of a compact operator at a nonzero scalar is finite-dimensional, over any complete
nontrivially normed field), `IsCompactOperator.finiteDimensional_ker_one_sub`,
`IsCompactOperator.isClosed_range_one_sub` and
`IsCompactOperator.finiteDimensional_quotient_range_one_sub`
(`TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean`: for a compact operator `K`, `1 − K`
has finite-dimensional kernel, and on a Banach space over `ℝ` or `ℂ` it has closed range and
finite-dimensional cokernel). These are the `r = 0` case of §3.5 and are used there as a
consistency check.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory §§4.4 and 4.8

Consume `gaussMap` (`T(x) = fract(1/x)`, `T(0) = 0`), `gaussMeasure` (density
`1/((1 + x) log 2)` on `(0, 1]`, a probability), the inverse branches `v_a(x) = 1/(a + x)`,
`a ≥ 1`, with absolute derivative `1/(a + x)²` on `[0, 1]`, and the invariant density telescope
`Σ_{a≥1} 1/((a + x)(a + x + 1)) = 1/(1 + x)` on `[0, 1]`, all from §4.4. Consume
`gaussDensityTransfer` (`Lf(x) = Σ_{a≥1} f(1/(a + x))/(a + x)²`, a native real sum, with absolute
and uniform convergence for continuous `f` on `[0, 1]`) and its Lebesgue duality from §4.8. The
supplier's index `a ≥ 1` is `A + 1` here.

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII §§0.1, 1.1, 3.1 and 3.2

Consume `HasLaplace f s z μ` for `f : ℝ → E` with `NormedSpace ℝ E` and `SMul ℂ E`: integrability
of `t ↦ exp(−st) • f t` for `μ` together with the value `z`; its uniqueness, almost-everywhere
congruence and linearity API (§0.1). For `λ > 0`, consume `squaredSinc λ`, its nonnegativity,
mass one (`squaredSinc_mass`), triangle Fourier transform on `[−2λ, 2λ]` (`squaredSinc_fourier`)
and tail concentration as `λ → ∞`; evenness holds for every real `λ` (§1.1). At `λ = 0` the
kernel is identically `0`, of mass `0`, and for `λ < 0` it is negative at `v = 0`
(`squaredSinc (−1) 0 = −1/π`), so the positive scale is part of every use. The
scalar statements `monotoneUnsmoothing` (§3.1) and `delangeLaplace` with `k = 0` (§3.2) are the
one-point cases of Layer 6 and are used as consistency checks of its constants.

### From TauCetiRoadmap.AlgebraicTopology Stage 2, item 7

Consume `brouwerFixedPoint_compactConvex_continuousOn`: for a nonempty compact convex subset `C` of
a finite-dimensional real normed space and `f` continuous on `C` with `f(C) ⊆ C`, some point of
`C` is fixed by `f`; no full-dimensionality of `C` is assumed. The finite-dimensional linear span
of finitely many vectors of a Hausdorff topological vector space carries its unique Hausdorff
vector topology, so Mathlib's `LinearEquiv.toContinuousLinearEquiv` transports a finite convex
hull to a normed model where the theorem applies.

### From TauCetiRoadmap.OptimalTransport Layer 13B

Item 9 builds Hilbert's projective metric and Birkhoff contraction with factor `tanh(Δ(K)/4)` for
strictly positive finite kernels. Layer 3 here proves the general cone statement and checks that its
distance on strictly positive vectors is the logarithmic max/min ratio used there.

### From TauCetiRoadmap.BanachAlgebras A2

Consume the Riesz idempotents of a finite partition of the spectrum of a bounded operator on a
complex Banach space into nonempty disjoint compact sets, their orthogonality, sum one, commutation
with the operator, the exact corner spectra and the resulting closed invariant direct-sum
decomposition.

## How to read the build

Layer 0 fixes the carriers: the simplex in its chart, the branches, the words and the count, and
the C¹ jets with their calculus. Layer 1 proves that long branch compositions contract uniformly
and builds the closed attractor. Layer 2 constructs the transfer operators, bounds them and proves
the two-norm inequality and holomorphy in `s`; it also fixes the two-sided Laplace conventions.
Layer 3 develops the functional analysis (Schauder–Tychonoff, Hilbert cones, noncompactness and
Hennion's bound) and proves the real Ruelle–Perron–Frobenius theorem. Layer 4 continues the
leading eigendata holomorphically and makes the gap uniform on compact parameter intervals.
Layer 5 proves that the delays are non-lattice, deduces Wielandt separation on vertical lines, and
locates the unique exponent `β` from the pressure. Layer 6 turns the spectral data into a uniform
growth bound and a meromorphic renewal transform with one simple pole on its abscissa,
characterises `β` by conformal measures, and proves the uniform counting theorem. Layer 7 compares with the Gauss map
and the Rauzy gasket and bounds `β(n)`. The general theorems of Layers 3, 4 and 6 (fixed points,
cones, noncompactness, perturbation, uniform Tauberian) depend on no transfer operator.

## Layer 0: Affine carriers and branch counting

### 0.1 The ordered projective simplex

Define `orderedSimplex` `d` as the set of chart points `x ∈ ℝ^d` with nonnegative nondecreasing
coordinates and `x_i ≤ 1 − Σ_k x_k` for every `i`, that is `0 ≤ w₁ ≤ ⋯ ≤ w_{n−2} ≤ w_{n−1}` with
`w_{n−1} = 1 − Σ x`. It is the chart image of `Δ_n = {0 ≤ w₁ ≤ ⋯ ≤ w_{n−1}, Σ w_i = 1}`, which is
the positive-ray quotient of `H_n = {y ∈ ℝ^n_{≥0} ∖ {0} : y₁ ≤ ⋯ ≤ y_n, y₁ + ⋯ + y_{n−1} = y_n}`
under `w_i = y_i / y_n` (GMR19, (1.5), p.756; §4.1, p.790; §5.1, p.800). `H_n` is a cone, not a
vector space; the vectors `e_j + e_n`, `1 ≤ j ≤ n − 1`, form a basis of its linear span (GMR19,
p.756).

Its API consists of these facts.

- Every `y ∈ H_n` has `y_n > 0`: if `y_n = 0`, the sum relation and nonnegativity force `y = 0`.
  Normalisation `y ↦ (y₁/y_n, …, y_{n−1}/y_n)` is constant exactly on positive rays, and
  multiplication by the last coordinate inverts it.
- The set is nonempty, compact and convex, with nonempty interior in `ℝ^d`; the point
  `w_i = 2i/(n(n − 1))` has strictly increasing positive coordinates and lies in the interior.
- Every chart coordinate satisfies `0 ≤ x_j ≤ 1/2`, because `x_j ≤ w_{n−1}` and
  `x_j + w_{n−1} ≤ 1`. The last free coordinate satisfies `1/(n − 1) ≤ w_{n−1} ≤ 1` and is not
  bounded by `1/2`.
- Within-derivatives on the set are unique (convexity and nonempty interior, `uniqueDiffOn_convex`).

**Checks.**

- For `n = 3` the set is the segment `0 ≤ w₁ ≤ 1/2`, `w₂ = 1 − w₁`. A definition that keeps the
  ordering but drops nonnegativity would contain `w₁ = −1`, `w₂ = 2`.
- `(1, 2, 3)` and `(2, 4, 6)` lie in `H₃` and both normalise to `w = (1/3, 2/3)`; `(1, 1, 3)`
  violates `y₁ + y₂ = y₃` and lies outside `H₃`; the zero tuple is excluded and has no
  normalisation.
- For `n = 4` the chart is the triangle with vertices `(0, 0)`, `(0, 1/2)` and `(1/3, 1/3)`, that is
  `w = (0, 0, 1)`, `(0, 1/2, 1/2)` and `(1/3, 1/3, 1/3)`. The chart point `(1/2, 1/2)` gives
  `w₃ = 0 < w₂` and is excluded.
- Charting in dimension `n − 1` instead of `n − 2` would put `Δ_n` inside a hyperplane with empty
  interior, where within-derivatives are not unique; the chart of dimension `d` avoids this.

*Needs:* Mathlib `Convex`, `IsCompact`, `uniqueDiffOn_convex`.

### 0.2 Accelerated projective branches

Define `branchDenom` `a x = q_a(w) = 1 + (A + 1)(1 − w_j)` and `branchMap` `a x = F_a(w)`: delete
`w_j` from `(w₁, …, w_{n−1})` and divide by `q_a(w)`. The full image point is
`(w₁, …, ŵ_j, …, w_{n−1}, 1 + A(1 − w_j)) / q_a(w)`; its last coordinate is not a chart coordinate.
This is the normalised action of `γ_{n−1}^A γ_j`:
`γ_{n−1}^A γ_j (w₁, …, w_{n−1}, 1) = (w₁, …, ŵ_j, …, w_{n−1}, 1 + A(1 − w_j), 1 + (A + 1)(1 − w_j))`
(GMR19, Lemma 33, (4.5)–(4.6), p.791). Put `τ_a = log q_a`, the delay of `a`, and use the complex
weight `q_a^{−s} = exp(−s τ_a)`.

Its API consists of these facts.

- Homogeneous identity: `γ_{n−1}^A γ_j y = y_n q_a(w) (F_a(w), 1)` for `y ∈ H_n` over `w`. One route
  is induction on `A`: each application of `γ_{n−1}` replaces the last two coordinates
  `(z_{n−1}, z_n)` by `(z_n, 2z_n − z_{n−1})`.
- Bounds: on the simplex `(A + 3)/2 ≤ q_a ≤ A + 2`, hence `τ_a ≥ log(3/2)`; this uses
  `0 ≤ w_j ≤ 1/2`.
- Logarithmic derivative: `|∂ log q_a / ∂w_j| = (A + 1)/q_a ≤ 2(A + 1)/(A + 3) < 2`, uniformly in
  `A`, `j` and `w`, and the other partial derivatives vanish.
- `F_a` is the restriction of a rational map that is smooth on the open neighbourhood `{q_a > 0}`
  of the simplex, and it maps the simplex into itself: the appended coordinate `1 + A(1 − w_j)` is
  at least `1 ≥ w_{n−1}`, so the image is again ordered.
- `|q_a^{−s}| = q_a^{−Re s}`, and the weight is positive at real `s`.

**Checks.**

- `n = 4`, `w = (1/6, 1/3, 1/2)`, `(A, j) = (0, 1)`: `q = 11/6` and `F = (2/11, 3/11, 6/11)`.
- Same `w`, `(A, j) = (1, 2)`: `q = 7/3` and `F = (1/14, 3/14, 5/7)`. Applying the moves in the
  opposite order, `γ_2 γ_3`, gives the different point `(1/16, 3/8, 9/16)` with last coordinate
  `8/3`.
- `n = 3`, `w = (0, 1)`: `q = A + 2` and `F = (1/(A + 2), (A + 1)/(A + 2))`; `A = 0` is a genuine
  branch, with `F = (1/2, 1/2)`.
- The bound `τ_a ≥ log(3/2)` is attained: `n = 3`, `w = (1/2, 1/2)`, `A = 0` gives `q = 3/2`.
- Off the simplex the total Lean formulas need not describe a positive geometric weight:
  `w_j = 3`, `A = 0` gives `q = −1`, `Real.log q = log 1 = 0`, and at `s = 3` the complex power
  `q^{−s}` is `−1`, while `exp(−s log q) = 1`. The two agree, and the weight is meaningful, only
  where `q > 0`, which holds on the simplex.

*Needs:* §0.1.

### 0.3 Words, delays and the renewal count

Define `wordMap` on finite lists of letters, read chronologically: the empty word acts as the
identity and `F_{a :: u} = F_u ∘ F_a`. Define `wordDelay` in the same order: the empty word has
delay `0` and `T_{a :: u}(w) = τ_a(w) + T_u(F_a w)`. Define `wordCount` `d x r = N(w, r)`, the number of
words `u`, the empty word included, with `T_u(w) ≤ r`. The Lean value is `Set.ncard` of the set of
such lists, which is `0` on an infinite set; the finiteness theorem below is what gives the value
its meaning. This is the count of GMR19 (1.7), p.759, over `Γ′ ∪ {e}`.

Its API consists of these facts.

- Concatenation: `T_{u ++ v}(w) = T_u(w) + T_v(F_u w)` and `F_{u ++ v} = F_v ∘ F_u`.
- Homogeneous meaning: `T_u(w) = log((γ_u y)_n / y_n)` for `γ_u = γ_{a_m} ⋯ γ_{a₁}` (accelerated
  letters) and any `y ∈ H_n` over `w`; hence `N` is invariant under positive scaling of `y`.
- Finiteness: `T_u(w) ≥ |u| log(3/2)`, and every letter of a word with `T_u(w) ≤ r` has
  `A ≤ 2e^r − 3`; for each `r` only finitely many words contribute.
- Monotonicity and measurability: `N(w, ·)` is nonnegative, nondecreasing and right-continuous (a
  finite sum of indicators of `[T_u(w), ∞)` below each cutoff), hence Borel; `N(w, r) = 0` for
  `r < 0` and `N(w, r) = 1` for `0 ≤ r < log(3/2)`.
- Renewal equation: `N(w, r) = 1{r ≥ 0} + Σ_a N(F_a w, r − τ_a(w))`, a finite sum at each `r`
  (partition nonempty words by their first letter; GMR19, (4.1), p.790).
- Freeness: the maps `γ_{n−1}^A γ_j` freely generate the semigroup `Γ′`, as an identity of linear
  maps (GMR19, p.756 and footnote 5). One route: on a generic strictly increasing positive tuple,
  the image `z = γ_i y` determines the deleted coordinate `y_i = 2z_{n−1} − z_n`, whose insertion
  slot in `z₁ ≤ ⋯ ≤ z_{n−2}` recovers the last unaccelerated letter; iterating, maximal final runs
  of `γ_{n−1}` recover the accelerated blocks. Boundary points may have coinciding images; this
  does not create word relations.

**Checks.**

- `N(w, −1) = 0` at every `w`, and `N(w, 0) = 1`.
- For `n = 4`, `w = (1/6, 1/3, 1/2)`, `a = (0, 1)` and `b = (1, 2)`, the word `[a, b]` has delay
  `log(11/6) + log(27/11) = log(9/2)`, and the homogeneous computation from `y = (1/6, 1/3, 1/2, 1)`
  ends with last coordinate `9/2`. Evaluating both letters at `w`, `log(11/6) + log(7/3)`, gives the
  wrong value `log(77/18)`.
- For `n = 3`, `w = (1/2, 1/2)`: `q_A = (A + 3)/2`, so `N(w, log 2) = 3` (the empty word, `[0]` and
  `[1]`); every two-letter word has delay at least `log(9/4) > log 2`.
- For `n = 4`, `w = (1/4, 1/4, 1/2)`: the letters `(0, 1)` and `(0, 2)` both send `w` to
  `(1/7, 2/7, 4/7)` with `q = 7/4`, so `N(w, log(7/4)) = 3`, while a count of distinct image points
  would give `2`.

*Needs:* §0.2.

### 0.4 C¹ jets on a compact convex body

Let `E` be a finite-dimensional real normed space, `K ⊂ E` nonempty, compact and convex with
nonempty interior, and `V` a real Banach space (a complex Banach space when complex scalars are
needed). Define the space of **C¹ jets** `C¹(K; V)` as the pairs `(f, D)` of continuous maps
`f : K → V` and `D : K → L(E, V)` with the segment identity
`f(y) − f(x) = ∫₀¹ D(x + t(y − x))(y − x) dt` for all `x, y ∈ K`, normed by
`‖f‖_∞ + ‖D‖_∞`. For an affine `K`, translate to its affine span first. For the simplex, define
`C1BoundedOn` `d f K`: `f : ℝ^d → ℂ` is `ContDiffOn ℝ 1` on `orderedSimplex d` and
`‖f(x)‖ + ‖Df(x)‖ ≤ K` there, with `Df` the derivative within the simplex. This is the C¹ space
that GMR19 use (norm `‖f‖_∞ + ‖∇f‖_∞`, p.793), with the boundary convention made explicit.

Its API consists of these facts.

- The derivative is determined by the values: on the interior the segment identity and continuity
  of `D` make `D` the Fréchet derivative, and the interior is dense.
- `C¹(K; V)` is a Banach space: it is a closed subspace of `C(K; V) × C(K; L(E, V))`, segment
  integration being continuous under uniform convergence; the norm is the sum of the two sup norms,
  and complex scalars act on both components.
- Value evaluation and derivative evaluation have operator norm at most `1`.
- Comparison with Mathlib: a function that is `ContDiffOn ℝ 1` on `K` gives the jet
  `(f, fderivWithin ℝ f K)`, and every jet arises in this way; in particular a C¹ map on an open
  neighbourhood of `K` restricts to a jet.
- Lipschitz bound: `‖f(y) − f(x)‖ ≤ ‖D‖_∞ ‖y − x‖` on `K`.
- The pointwise bound and the norm agree up to a factor two: a jet of norm at most `K` satisfies
  `C1BoundedOn` with `K`, and `C1BoundedOn` with `K` gives norm at most `2K`.
- `C1BoundedOn` is monotone in `K`, adds bounds under sums and scales by `|c|` under
  multiplication by `c`; it depends only on the values of `f` on the simplex.

**Checks.**

- The constant `1` on `[0, 1]` has `D = 0` and norm `1`.
- `f(x) = 2x + 3` on `[0, 1]` has `D = 2` and norm `5 + 2 = 7`.
- The pair `f = 0`, `D = 1` on `[0, 1]` fails the segment identity, which demands
  `0 = y − x`.
- For the singleton `K = {p}` in the zero space every derivative is the zero map, but in a nonzero
  space a single point does not determine a within-derivative; this is why the nonempty-interior
  hypothesis is imposed.
- For `d = 1`, `f(x) = x₀` satisfies the pointwise bound with `K = 3/2` on `[0, 1/2]`, attained at
  `x₀ = 1/2`, and fails it with `K = 1`.
- For `d = 1`, the constant `1` has least pointwise bound `1`; a predicate that summed sup norms
  would agree here, but one that dropped the value term would give `0`.
- For `d = 1`, `f(x) = 2x₀ + 3` on `[0, 1/2]` has least pointwise bound `4 + 2 = 6`, attained at
  `x₀ = 1/2`, so the bound `5` fails.

*Needs:* Mathlib `ContDiffOn`, `fderivWithin`, `contDiffOn_succ_iff_fderivWithin`,
`uniqueDiffOn_convex`, interval integration; §0.1.

### 0.5 C¹ calculus and compact inclusion

**C¹ pullback, products and compact inclusion.** Let `K ⊂ E` and `J ⊂ F` be compact convex bodies as
in §0.4 and `Φ : K → J` a C¹ map, given by a jet. Then `f ↦ f ∘ Φ` is a bounded linear map
`C¹(J; V) → C¹(K; V)` with `D(f ∘ Φ) = (Df ∘ Φ) DΦ` and
`‖f ∘ Φ‖_{C¹} ≤ max(1, ‖DΦ‖_∞) ‖f‖_{C¹}`; pullback preserves identities and reverses composition.
For `V = ℂ` the Leibniz rule holds, with `‖fg‖_{C¹} ≤ ‖f‖_{C¹} ‖g‖_{C¹}` (chain rule and Leibniz:
GMR19, Lemma 46 and its use in the proof of Lemma 38, pp.798–799), and the value inclusion
`C¹(K; ℂ) → C(K; ℂ)` is compact (Arzelà–Ascoli, used by GMR19 in footnote 21, p.794). The chain rule holds without assuming that `Φ` maps interior points to interior
points; one route uses the segment identity along chords and approximation from interior chords.
Compactness follows from the Lipschitz bound of §0.4, which makes the unit ball equicontinuous with
values in a compact disc, and Arzelà–Ascoli.

**Checks.**

- The pullback of a constant has derivative `0`.
- For an affine `Φ(x) = Mx + b` the formula is composition with the linear map `M`.
- `f = g = x` on `[0, 1]`: `‖fg‖_{C¹} = 1 + 2 = 3 ≤ 4 = ‖f‖_{C¹} ‖g‖_{C¹}`.

*Needs:* §0.4; Mathlib `BoundedContinuousFunction.arzela_ascoli`.

### Examples

- For `n = 3` the chart is `w₁ ∈ [0, 1/2]` and the branches are `F_A(w₁) = (1 − w₁)/q_A(w₁)` with
  `q_A = 1 + (A + 1)(1 − w₁)`; in the Gauss coordinate `x = w₁/w₂` they become `x ↦ 1/(x + A + 1)`
  (GMR19, Example 34, pp.791–792).
- For `n = 4`, `w = (1/6, 1/3, 1/2)`, the letters `(0, 1)` and `(1, 2)` have denominators `11/6`
  and `7/3` and images `(2/11, 3/11, 6/11)` and `(1/14, 3/14, 5/7)`.

### Dependencies

Mathlib only.

## Layer 1: Explicit contraction and the coding attractor

### 1.1 Core and cusp

For `n ≥ 4` write `b = Σ_{i≤n−2} w_i`, so `w_{n−1} = 1 − b`. Define the closed subsets
`Δ₀ = {b ≤ 1/2}`, `Δ_core = {0 ≤ 1 − 2b ≤ w_{n−2}}` and `Δ_cusp = {1 − 2b ≥ w_{n−2}}` of the
simplex (GMR19, §5.1, pp.800–801).

Its API consists of these facts.

- `Δ₀ = Δ_core ∪ Δ_cusp`, and the two meet exactly where `1 − 2b = w_{n−2}`.
- The unaccelerated maps send the simplex into these pieces: `γ_i(Δ) ⊂ Δ_core` for `i ≤ n − 2` and
  `γ_{n−1}(Δ) ⊂ Δ_cusp`; hence every accelerated branch, including `A = 0`, maps `Δ` into `Δ₀`.
- Coordinate bounds: on `Δ₀`, `w_{n−1} ≥ 1/2`; on `Δ_core`, `w_{n−j} ≤ 1/(2(j − 1))` for
  `2 ≤ j ≤ n − 1`, in particular `w_{n−2} ≤ 1/2` and `w_{n−3} ≤ 1/4`; on `Δ_cusp`,
  `w_{n−1} ≥ (1 + w_{n−2})/2`, `w_{n−2} ≤ 1/3` and `w_{n−3} ≤ 1/5`.
- The first `n − 2` coordinates identify the simplex with its compact convex chart polytope.

**Checks.**

- `n = 4`: `(0, 0, 1)` lies in `Δ_cusp` and not in `Δ_core`.
- `n = 4`: `(0, 1/2, 1/2)` lies in `Δ_core` and not in `Δ_cusp`.
- `n = 4`: `(0, 1/3, 2/3)` and `(1/5, 1/5, 3/5)` lie in both; for the second,
  `w₃ = (1 + w₂)/2` holds with equality, so a strict cusp inequality would exclude it.
- `n = 4`: `(1/3, 1/3, 1/3)` has `b = 2/3` and lies outside `Δ₀`; no branch image reaches it.

*Needs:* §§0.1–0.2.

### 1.2 Ten derivative bounds

**Ten short-block bounds.** For `n ≥ 4`, with `‖·‖` the operator norm induced by `ℓ¹` on the first
`n − 2` coordinates, on `Δ₀` unless a region is named and with `b = Σ_{k≤n−2} w_k`:

```text
(5.1)  ‖dγ_i‖ ≤ 2/(2 − w_i), i ≤ n−2;  ≤ 6/5 on Δ_cusp, ≤ 4/3 on Δ_core
(5.2)  ‖dγ_{n−1}‖ = (1 + 2b − 2w₁)/(1 + b)² ≤ 1
(5.3)  ‖d(γ_i∘γ_j)‖ ≤ 2/(4 − 2w_j − w_i) ≤ 4/5,  i < j ≤ n−2
(5.4)  ‖d(γ_i∘γ_j)‖ ≤ 2/(4 − 2w_j − w_{i+1}) ≤ 4/5,  j ≤ i < n−2
(5.5)  ‖d(γ_{n−2}∘γ_j)‖ ≤ (4 + 2b − 2w₁ − 3w_j)/(3 + b − 2w_j)² ≤ 4/5,  j ≤ n−2
(5.6)  ‖d(γ_{n−1}∘γ_i)‖ ≤ 2/(3 − 2w_i), i ≤ n−3;  ≤ 10/13 on Δ_cusp, ≤ 4/5 on Δ_core
(5.7)  ‖d(γ_{n−1}∘γ_{n−2})‖ ≤ 2/(3 − 2w_{n−2});  ≤ 6/7 on Δ_cusp, ≤ 1 on Δ_core
(5.8)  ‖d(γ_i∘γ_{n−1}∘γ_{n−2})‖ ≤ 2/(6 − 4w_{n−2} − w_i) ≤ 4/7,  i ≤ n−3
(5.9)  ‖d(γ_{n−2}∘γ_{n−1}∘γ_{n−2})‖ ≤ (7 + 2b − 2w₁ − 6w_{n−2})/(5 + b − 4w_{n−2})² ≤ 32/49
(5.10) ‖d(γ_{n−1}²∘γ_{n−2})‖ ≤ 2/(4 − 3w_{n−2});  ≤ 2/3 on Δ_cusp, ≤ 4/5 on Δ_core
```

Empty index ranges impose no assertion (GMR19, §5.2, (5.1)–(5.10), pp.801–802, and Table 1, p.804;
the case computations are in GMR19 arXiv v3, proofs of (5.1)–(5.10), pp.46–53). The denominators of
(5.5) and (5.9) are squares, and the core/cusp inequality is non-strict; see Notes on the sources.
One route differentiates each composite rational map, keeps the composed denominator, computes every
absolute column sum and bounds the largest with the coordinate inequalities of §1.1. In (5.1) the
columns `k ≠ i` have sum `2/(2 − w_i)` and the exceptional column `(1 + 2b − 2w_i)/(2 − w_i)²` is
no larger on `Δ₀`; in (5.5) the ordinary column sums decrease in `w_k`, so the column `k = 1`
dominates, and for `j = 1` the displayed expression is a common upper bound.

**Checks.**

- `n = 4`, chart point `(1/6, 1/3)` (so `b = 1/2`): (5.2) holds with equality, both sides `20/27`.
- `n = 4`, `w = (0, 0, 1)`: the norms in (5.5), for `j = 1` and `j = 2`, equal `4/9`, the value of
  the squared bound; the expression without the square would give `4/3`, which exceeds `4/5`. In
  (5.9) the norm is `7/25`, again the squared bound, against `7/5` without the square.
- `n = 4`, `w = (0, 1/2, 1/2)` in `Δ_core`: `‖dγ₂‖ = 4/3`, so single branches are not
  contractions; only short blocks are.

*Needs:* §1.1.

### 1.3 Uniform contraction

Prove `eventual_contraction`: for every `n ≥ 3` there are `D ≥ 1` and `0 < ρ < 1`, depending
only on `n` and the chosen norm, such that every word `u` of length `m` satisfies
`sup_{w∈Δ} ‖dF_u(w)‖ ≤ D ρ^m`, the derivative of `wordMap u` taken within the simplex. The Lean
statement uses the operator norm of the sup norm on `ℝ^d`; any two norms on `ℝ^d` differ by a
factor that `D` absorbs. For `n ≥ 4`, every composition of two accelerated branches has
`ℓ¹` derivative norm at most `24/25` on `Δ₀` (GMR19, Proposition 45, p.798; Lemma 48 and proof,
pp.802–803). One route writes a two-branch block as `γ_{n−1}^A γ_i γ_{n−1}^B γ_j`: if `A, B ≥ 1`,
(5.2), (5.6) and (5.7) give `6/7`; if `B = 0`, (5.3)–(5.5) give `4/5`; if `A = 0`, `B ≥ 1` and
`j ≤ n − 3`, (5.1) and (5.6) give `24/25`; if `j = n − 2`, (5.8)–(5.9) give `32/49` for `B = 1` and
(5.1), (5.10) give `24/25` for `B ≥ 2`. The first branch enters `Δ₀`; bound its derivative on all of
`Δ` from `q_a ≥ (A + 3)/2`, pair the remaining letters and absorb an unpaired factor, comparing
norms once. For `n = 3` use `x = w₁/w₂`: the inverse Gauss branches `x ↦ 1/(A + 1 + x)` compose in
pairs with derivative at most `1/4` on `[0, 1]`, and the coordinate change is a C¹ diffeomorphism
(GMR19, Examples 34 and 37, pp.791–793).

**Checks.**

- `m = 0`: the empty word has derivative the identity, of norm `1`, which forces `D ≥ 1`.
- `n = 3`, `A = B = 0`, `x = 0`: the two-branch derivative is `(1 + 1)^{−2} · 1^{−2} = 1/4`.
- A single branch can expand: `‖dγ₂‖ = 4/3` at `(0, 1/2, 1/2)` for `n = 4` (§1.2).

*Needs:* §1.2; §0.5; ProbabilisticAndMetricNumberTheory §4.4 (Gauss inverse branches and their
absolute derivative).

### 1.4 The closed coding attractor

For an infinite code `a = (a₁, a₂, …)` define `π(a) = lim_m F_{a₁} ∘ ⋯ ∘ F_{a_m}(w₀)`, with the
outermost letters fixed as `m` grows. The **coding attractor** `K` is the closure in `Δ` of the
image of `π`; equivalently `K = ⋂_m closure(⋃_{|u|=m} F_{u₁} ∘ ⋯ ∘ F_{u_m}(Δ))`. The closure is
needed because the alphabet is countable and the code space is not compact (GMR19, §4.2, p.794,
where the image itself is called the attractor).

Its API consists of these facts.

- The limit exists, does not depend on `w₀`, and `π(a) = F_{a₁}(π(σa))` for the shifted code `σa`;
  nested images of `Δ` have diameter at most `Dρ^m diam Δ`.
- `K` is nonempty and compact, `F_a(K) ⊂ K` for every letter, and `K` is the closure of
  `⋃_a F_a(K)`.
- Every nonempty chronological word `u = [a₁, …, a_m]` has a unique fixed point in `Δ`, and it
  lies in `K`: it is the point coded by the infinite repetition of the reversed word,
  `(a_m, …, a₁, a_m, …, a₁, …)`, in the outer-prefix convention, whose outer block is
  `F_{a_m} ∘ ⋯ ∘ F_{a₁} = F_u`. The repetition of `u` itself, `(a₁, …, a_m, a₁, …, a_m, …)`,
  codes the fixed point of `F_{a₁} ∘ ⋯ ∘ F_{a_m}`, the map of the reversed word, which need not
  be the same point. The empty word acts as the identity and fixes every point of `Δ`; no
  uniqueness or membership in `K` is asserted for it (for `n = 4` it fixes `(1/3, 1/3, 1/3) ∉ K`).
- Every image `F_u(w)` with `|u| = m` lies within `D ρ^m diam Δ` of `K`.

**Checks.**

- A constant code `(a, a, …)` gives the fixed point of `F_a`.
- `n = 3`, `u = [(0, 1), (1, 1)]`, chart coordinate `w₁`: `F_u = F₁ ∘ F₀` is `w ↦ 1/(4 − w)`, with
  fixed point `2 − √3 ≈ 0.268`; the periodic code `(a₁, a₂, a₁, a₂, …)` read outer-prefix is the
  fixed point of `F₀ ∘ F₁ : w ↦ (2 − w)/(5 − 3w)`, which is `1 − 1/√3 ≈ 0.423`; the code of the
  reversed word, `(a₂, a₁, a₂, a₁, …)`, gives `2 − √3`. Both points lie in `K`.
- `n = 3`, Gauss coordinate: the fixed point of `x ↦ 1/(x + A + 1)` is
  `x_A = 2/((A + 1) + √((A + 1)² + 4))`, which tends to `0`; so `x = 0` lies in `K`.
- `n = 3`: every code gives `x = 1/(A₁ + 1 + x′) > 0`, so the unclosed image omits `0` and is not
  compact. Here `K` is the whole segment, since the images `[1/(A + 2), 1/(A + 1)]` cover `(0, 1]`.
- `n = 4`: `K ⊂ Δ₀` (§1.1), so `(1/3, 1/3, 1/3) ∉ K` and `K ≠ Δ`.

*Needs:* §1.3.

### Examples

- For `n = 3`, `K` is the whole chart segment and the contraction constant of two-letter blocks is
  `1/4` in the Gauss coordinate.
- For `n = 4`, `K` is contained in `Δ₀ = {w₁ + w₂ ≤ 1/2}`; it is the ordered part of the Rauzy
  gasket (§7.3).

### Dependencies

Layer 0; ProbabilisticAndMetricNumberTheory §4.4.

## Layer 2: Transfer operators and convergent transforms

### 2.1 The countable transfer operator

Define `transferOp` `d s f x = L_s f(w) = Σ_a q_a(w)^{−s} f(F_a w)` as the native sum over the
alphabet `ℕ × Fin d` (GMR19, (4.3) and (4.7), pp.791–792). For `Re s > 1` it is an absolutely and
uniformly convergent sum on the simplex for bounded `f`, and it defines bounded complex-linear
operators on `C(Δ; ℂ)` (GMR19, Lemma 35, p.792) and on `C¹(Δ; ℂ)` (GMR19, Lemma 38, p.793). For
`Re s ≤ 1` the native sum is a junk value (for `f = 1` the series diverges and the native sum is
`0`); no theorem uses it there.

Its API consists of these facts.

- Convergence: for `Re s > 1` and `x` in the simplex the series converges absolutely and
  uniformly, with majorant `2^{Re s}(n − 2) Σ_{A≥0} (A + 3)^{−Re s} ‖f‖_∞`; each branch term is a
  bounded weighted pullback.
- C¹ boundedness: the product and chain rules of §0.5, the bound on `d log q_a` of §0.2 and the
  contraction of §1.3 give a shifted p-series majorant for the C¹ norm, uniform for `s` in compact
  subsets of `Re s > 1`; the C¹ operator followed by the value inclusion is the C⁰ operator.
- Positivity: for real `s > 1` and `f ≥ 0`, `L_s f ≥ 0`; for complex `s`,
  `|L_s f| ≤ L_{Re s} |f|` pointwise.
- Powers are word sums: `L_s^m f(w) = Σ_{|u|=m} e^{−s T_u(w)} f(F_u w)`, with the chronological
  order and delays of §0.3; absolute convergence justifies the iterated sums.

**Checks.**

- `L_s 0 = 0`.
- `L_s 1(w) = Σ_a q_a(w)^{−s}`, which is not constant: for `n = 3`, `L_2 1(0, 1) = ζ(2) − 1 ≈ 0.645`
  and `L_2 1(1/2, 1/2) = 4(ζ(2) − 1 − 1/4) ≈ 1.580`.
- `n = 3`: the weight of branch `A` at `w = (0, 1)` is `(A + 2)^{−s}`; the Gauss operator has
  `(A + 1)^{−s}` there, and the two are related by the conjugacy of §7.1, not equal.
- `n = 3`, `s = 2`, `h(w) = 1/w₂`: at `w = (1/2, 1/2)`,
  `Σ_A q_A^{−2} h(F_A w) = Σ_A 4/((A + 2)(A + 3)) = 2 = h(w)`.

*Needs:* §§0.2–0.5, §1.3; Mathlib `Real.summable_one_div_nat_rpow`,
`Complex.summable_one_div_nat_cpow`.

### 2.2 Summability, tails and C⁰ bounds

**C⁰ bounds.** For real `σ > 1`,

```text
(n − 2) Σ_{A≥0} (A + 2)^{−σ} ≤ inf_Δ L_σ 1 ≤ sup_Δ L_σ 1 ≤ 2^σ (n − 2) Σ_{A≥0} (A + 3)^{−σ},
```

the C⁰ operator norm of `L_σ` is `sup L_σ 1`, and `‖L_s‖_{C⁰} ≤ sup L_{Re s} 1` for complex `s`.
Truncating at `A ≤ M` leaves a C⁰ tail at most
`2^σ (n − 2) Σ_{A>M} (A + 3)^{−σ} ≤ 2^σ (n − 2)(M + 2)^{1−σ}/(σ − 1)`.
(GMR19, Lemma 35, p.792, and proof of Proposition 43, §4.5, p.799, with the factor `2^σ`). One
route uses both sides of `(A + 3)/2 ≤ q_a ≤ A + 2` term by term and positivity on constants; the
tail bound is the integral test.

**Checks.**

- `n = 3`, `σ = 2`: the lower bound `ζ(2) − 1 ≈ 0.645` is attained at `w = (0, 1)` and the upper
  bound `4(ζ(2) − 1 − 1/4) ≈ 1.580` at `w = (1/2, 1/2)`; the printed constant `2` in place of
  `2^σ` would give `0.790`, below the value at `(1/2, 1/2)`.
- As `σ ↓ 1` the lower sum diverges; as `σ → ∞` the upper bound tends to `0` by domination at a
  fixed `σ₀ > 1`, since `2/(A + 3) < 1`.

*Needs:* §2.1.

### 2.3 The Ionescu-Tulcea–Marinescu inequality

**Two-norm inequality.** There is `C`, independent of `m`, `s` and `w`, such that for
`σ = Re s > 1`, `m ≥ 0` and `f ∈ C¹(Δ; ℂ)`,
`|D(L_s^m f)(w)| ≤ C |s| L_σ^m |f|(w) + D ρ^m L_σ^m |Df|(w)` and `|L_s^m f| ≤ L_σ^m |f|`, where
`|Df|` is the norm of the real derivative and `L_σ` acts on nonnegative continuous functions
(GMR19, Lemma 46 and proof, pp.798–799, with the real operator `L_{Re s}` on the right). On compact
subsets of `Re s > 1` all constants are uniform. One route: the derivative of `T_u` is a sum of
`dτ` at successive images composed with prefix derivatives, and the geometric bound of §1.3 gives
`|DT_u| ≤ C` uniformly in `u`; differentiating `e^{−sT_u} f ∘ F_u` gives the two summands.

**Checks.**

- For `Im s ≠ 0` the right side is real and nonnegative, as an order inequality requires; with the
  complex operator `L_s` on the right the inequality would compare a complex function with a real
  one.
- `m = 0` gives `|Df| ≤ C|s||f| + D|Df|`, which holds because `D ≥ 1`.

*Needs:* §1.3, §2.1, §0.5.

### 2.4 Holomorphic operator family

**Holomorphy in the parameter.** The map `s ↦ L_s` is holomorphic from `{Re s > 1}` into the
complex Banach algebra of bounded operators on `C¹(Δ; ℂ)`, with
`∂_s^k L_s f = Σ_a (−τ_a)^k q_a^{−s} f ∘ F_a`; for every compact set of parameters the series and
their C¹ derivatives converge uniformly in operator norm (GMR19, Lemma 38, p.793, and its proof,
pp.798–799). One route truncates the `A`-sum: each truncation is entire, because `τ_a` is a fixed
bounded C¹ function, and the tails, including logarithmic factors and their spatial derivatives,
are dominated by `q^{−σ₀}` for `1 < σ₀ < inf Re s`; then `DifferentiableOn.analyticOnNhd` gives
analyticity. The claim is holomorphy in operator norm on C¹, not pointwise in `w`: the
first-derivative series `Σ_a τ_a q_a^{−s} f ∘ F_a` converges in operator norm because
`τ_a ≤ log(A + 2)` is absorbed by `q_a^{σ₀ − σ}`.

**Checks.**

- `n = 3`, `w = (0, 1)`, `f = 1`: `L_s 1(w) = Σ_{k≥2} k^{−s}`, and at real `s = 2` its derivative is
  `−Σ_{k≥2} (log k)/k² = ζ′(2) ≈ −0.938 < 0`; dropping the sign of `(−τ_a)` in the first
  derivative would make it positive.
- The second derivative at the same point is `Σ_{k≥2} (log k)²/k² ≈ 1.989 > 0`, so
  `σ ↦ L_σ 1(w)` is decreasing and convex there.

*Needs:* §2.3; Mathlib `DifferentiableOn.analyticOnNhd`.

### 2.5 Two-sided Laplace and Mellin adapters

The two-sided Laplace transform of `f : ℝ → V` at `s` is
ArithmeticDirichletSeriesPartII's `HasLaplace f s z volume`. This section proves its adapters for a
complex Banach space `V`.

- **Splitting.** `HasLaplace f s z volume` holds exactly when the transforms of `f` on `(0, ∞)` and
  of `t ↦ f(−t)` at `−s` on `(0, ∞)` both converge, and `z` is their sum; the point `t = 0` is null.
- **Zero extension.** If `HasLaplace f s z (volume.restrict (Ioi 0))`, then the zero extension of
  `f` to `t ≤ 0` has two-sided transform `z`, with no extra factor `s`.
- **Holomorphy on strips.** If `f` is almost everywhere strongly measurable and, for each compact
  `[c, d] ⊂ (a, b)`, `t ↦ sup_{σ∈[c,d]} e^{−σt} ‖f(t)‖` is integrable, then the two-sided transform
  is holomorphic on `a < Re s < b`; polynomial factors in `t` are absorbed by exponential slack.
- **Mellin.** With `g(u) = f(log u)` for `u > 0`, `HasLaplace f s z volume` holds exactly when
  `MellinConvergent g (−s)` and `mellin g (−s) = z`; the values of `g` on `u ≤ 0` play no role. The
  substitution `u = e^t` turns `u^{−s−1} g(u) du` into `e^{−st} f(t) dt`, including absolute
  convergence.
- **Translation.** For real `c`, `t ↦ f(t − c)` has transform `e^{−sc} z`.

(GMR19, §4.1, (4.2)–(4.4), pp.790–791, which use the two-sided transform of a function vanishing at
negative times.)

**Checks.**

- `f = 1_{[c, ∞)}`, `Re s > 0`: the transform is `e^{−sc}/s`.
- `f(t) = e^{−|t|}`, `−1 < Re s < 1`: the transform is `1/(1 + s) + 1/(1 − s) = 2/(1 − s²)`.
- `g = 1_{[1, ∞)}`: `mellin g (−s) = 1/s` for `Re s > 0`; at `+s` the integral converges only for
  `Re s < 0`, so the sign `−s` is forced.
- The constant `1` on `ℝ` has no convergent two-sided transform at any `s`.

*Needs:* ArithmeticDirichletSeriesPartII §0.1; Mathlib `mellin`, `MellinConvergent`,
`MeasureTheory.integral_comp_exp`, `MeasureTheory.integrable_comp_exp`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### Examples

- For `n = 3` and `s = 2`, `L_2 h = h` for `h(w) = 1/w₂`, and `L_2 1` ranges over
  `[ζ(2) − 1, 4(ζ(2) − 5/4)]` on the chart segment.

### Dependencies

Layers 0–1; ArithmeticDirichletSeriesPartII §0.1.

## Layer 3: Fixed points, cones and spectral decomposition

### 3.1 The Schauder–Tychonoff fixed point theorem

Prove `schauder_tychonoff`: let `V` be a Hausdorff locally convex real topological vector space,
`C ⊂ V` nonempty, compact and convex, and `f` continuous on `C` with `f(C) ⊂ C`; then `f` has a fixed
point in `C` (Morris–Noussair, Theorem 2.6, p.167, with its proof on pp.167–168, which treats a
continuous map of a convex set into a compact subset of it; the compact convex self-map is the case
`F = A = C`). One route: for each convex balanced neighbourhood `U` of `0`, a finite `U`-net and a
subordinate partition of unity give `p_U : C → conv{x₁, …, x_m}` with `x − p_U x ∈ U`; the finite
convex hull is a nonempty compact convex subset of the finite-dimensional span of its vertices,
whose induced topology is the unique Hausdorff vector topology, so
`brouwerFixedPoint_compactConvex_continuousOn` (AlgebraicTopology Stage 2, item 7), applied after
`LinearEquiv.toContinuousLinearEquiv` to a normed model, gives a fixed point of `p_U ∘ f`; a
cluster point of these approximate fixed points, as `U` shrinks, is a fixed point by Hausdorffness
and continuity. For a one-vertex hull the fixed point is the vertex itself.

**Checks.**

- Nonemptiness is needed: the empty set is compact and convex and has no fixed point.
- Compactness is needed: translation by `1` on the closed convex set `[0, ∞) ⊂ ℝ` has none.
- Convexity is needed: rotation by `π` of the circle `{|z| = 1} ⊂ ℂ` has none.

*Needs:* AlgebraicTopology Stage 2, item 7 (`brouwerFixedPoint_compactConvex_continuousOn`);
Mathlib `LocallyConvexSpace`, `LinearEquiv.toContinuousLinearEquiv`.

### 3.2 Positive eigenprobabilities

Define `IsEigenprobability` `d σ c ν`: `ν` is a Borel probability on `ℝ^d` carried by the simplex
with `∫ L_σ f dν = c ∫ f dν` for every continuous `f : ℝ^d → ℂ`. For `c = 1` the measure is
`σ`-conformal (its Jacobian form is §6.6). Construct, for every real `σ > 1`, an eigenprobability with
`c = ∫ L_σ 1 dν > 0` as a fixed point of `μ ↦ L_σ^* μ / ∫ L_σ 1 dμ` on probability measures
(GMR19, Corollary 36, p.792). One route realises probability measures as normalised positive
functionals inside the Hausdorff locally convex space `ℝ^{C(Δ; ℝ)}`, where Prokhorov's theorem
with the constant compact set `Δ` gives compactness and injectivity of integrals identifies the
image; `inf L_σ 1 > 0` (§2.2) makes the normalisation continuous, `L_σ^* μ` is the convergent sum of
the weighted pushforwards `(q_a^{−σ} μ) ∘ F_a^{−1}`, and Schauder–Tychonoff applies.

Its API consists of these facts.

- The eigenvalue is determined by the measure: testing `f = 1` gives `c = ∫ L_σ 1 dν`, so `c` lies
  between the bounds of §2.2 and is positive.
- The identity for complex `f` follows from the identity for real `f` by real and imaginary parts.
- The unnormalised weighted pushforward sum `Σ_a (q_a^{−σ} μ) ∘ F_a^{−1}` evaluates `f` as
  `∫ L_σ f dμ`; its probability normalisation evaluates `f` as `(∫ L_σ f dμ)/(∫ L_σ 1 dμ)`. For
  `n = 3`, `σ = 2`, `μ = δ₀` and `f = 1` the first is `ζ(2) − 1 ≈ 0.645` and the second is `1`.
- No uniqueness is asserted here; uniqueness is part of §3.7.

**Checks.**

- `n = 3`, `σ = 2`: twice Lebesgue measure on the chart segment `[0, 1/2]` is an eigenprobability
  with `c = 1`; for `f(w) = w₁²` both sides equal `1/12`.
- The Dirac mass at the vertex `w = (0, 1)` (chart point `0`) is not one: for `n = 3` the branch
  images `F_A(0) = 1/(A + 2)` are never `0`, so a continuous `f ≥ 0` vanishing at `0` and positive
  at `1/2` gives `∫ L_σ f dδ₀ > 0 = c f(0)`.
- On a one-point space with branch weights of total `c > 0` the point mass is the eigenprobability
  and the eigenvalue is `c`, not `1`.

*Needs:* §3.1, §2.2; Mathlib `MeasureTheory.ProbabilityMeasure.continuous_integral_continuousMap`,
`isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le`,
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

### 3.3 Cone order and Hilbert distance

For a closed convex cone `C` with `C ∩ −C = {0}` in a real Banach space, define for `f, g ∈ C ∖ {0}`
`α(f, g) = sup{a ≥ 0 : g − af ∈ C}`, `β(f, g) = inf{b ≥ 0 : bf − g ∈ C}` and the **Hilbert
distance** `d_C(f, g) = log(β/α)` when `0 < α` and `β < ∞`; elements with `α = 0` or `β = ∞` are
incomparable (Liverani, §1, the projective metric before Theorem 1.1, preprint p.4). For `a > 0`
define the derivative cone `C_a = {f ∈ C¹(Δ; ℝ) : f ≥ 0, |Df| ≤ a f}`.

Its API consists of these facts.

- Scale invariance: `d_C(cf, c′g) = d_C(f, g)` for `c, c′ > 0`; the triangle inequality holds on
  each comparability class.
- For comparable nonzero elements, `d_C(f, g) = 0` exactly when they lie on one positive ray.
- On strictly positive vectors of `ℝ^k`, `d(f, g) = log(max_i (g_i/f_i) / min_i (g_i/f_i))`,
  which is Tau Ceti's `TauCeti.hilbertProjectiveDist f g` and the convention of OptimalTransport
  Layer 13B, item 9.
- Every nonzero element of `C_a` is strictly positive: along a segment, `|Df| ≤ af` gives
  `f(y) ≤ e^{a‖y − x‖} f(x)`, so `f` vanishing at one point vanishes everywhere.
- For `0 < κ < 1`, `C_{κa} ∖ {0}` has finite diameter in `C_a`, at most
  `2 log((1 + κ)/(1 − κ)) + 2κa diam Δ`; constants lie in `C_a`.
- Prove `birkhoff_contraction`: let `C₁ ⊂ V` and `C₂ ⊂ W` be convex cones in real vector spaces
  with `C_i ∩ −C_i = {0}` (no topology and no closedness is needed for this form), `T : V → W`
  linear with `T(C₁) ⊂ C₂`, and `Δ ≥ 0` such that any two images `Tf`, `Tg` of nonzero elements
  of `C₁` satisfy `a Tf ≤ Tg ≤ b Tf` for some `a > 0` with `log(b/a) ≤ Δ`. If `f ∈ C₁ ∖ {0}` and
  `a f ≤ g ≤ b f` with `a > 0`, then `a′ Tf ≤ Tg ≤ b′ Tf` for some `a′ > 0` with
  `log(b′/a′) ≤ tanh(Δ/4) log(b/a)`. The hypothesis on `T` is an order bound on pairs of images,
  which the zero map satisfies; it is the Hilbert diameter bound `diam T(C₁ ∖ {0}) ≤ Δ` exactly
  when `T` sends nonzero elements of `C₁` to nonzero elements of `C₂`. For the closed
  Banach-space cones on which `d_C` is defined, if `T` sends every nonzero element of `C₁` to a
  nonzero element of `C₂`, taking infima gives `d_{C₂}(Tf, Tg) ≤ tanh(Δ/4) d_{C₁}(f, g)` for
  comparable `f`, `g` (Liverani, Theorem 1.1, preprint p.4, and its footnote 2 on the absence of
  topology). One route applies the order bound to `g − af` and `bf − g` when both are nonzero (if
  one vanishes, `Tg` is a multiple of `Tf` and `a′ = b′` works), obtaining
  `α T(g − af) ≤ T(bf − g) ≤ β T(g − af)` with `α > 0` and `log(β/α) ≤ Δ`, and rearranges to
  `a′ = (b + βa)/(1 + β)` and `b′ = (b + αa)/(1 + α)`; as a function of `log(b/a) ≥ 0`,
  `log(b′/a′)` vanishes at `0` and has derivative at most `(√β − √α)/(√β + √α) = tanh(log(β/α)/4)`.

**Checks.**

- `d((1, 2), (3, 6)) = 0`.
- In `ℝ²_{≥0}`, `d((1, 1), (1, 4)) = log 4`, with `α = 1` and `β = 4`.
- `(1, 0)` and `(0, 1)` are incomparable: `α = 0`.
- On `[0, 1]`, `f(x) = 1 + x` lies in `C_1`, and not in `C_a` for `0 < a < 1`, since `|f′(0)| = 1`.
- On `[0, 1]`, the constant `1` lies in every `C_a`, and `−1` lies in none, by the sign condition.
- On `[0, 1]`, for `a > 0`, `e^{ax}` lies in `C_a` with equality `|f′| = af`, and `e^{(a+ε)x}`
  with `ε > 0` does not, since `(a + ε)e^{(a+ε)x} > a e^{(a+ε)x}`; a cone without the derivative
  condition would contain both.
- `[[2, 1], [1, 2]]` on `ℝ²_{≥0}` has image diameter `log 4` and contracts by
  `tanh(log 4/4) = 1/3` (the images `(2, 1)`, `(1, 2)` of the axes are at distance `log 4`): for
  `f = (1, 1)`, `g = (1, 2)`, with `d = log 2`, the images `(3, 3)` and `(4, 5)` are at distance
  `log(5/4) ≈ 0.223 ≤ (1/3) log 2 ≈ 0.231`; this is `Matrix.hilbertProjectiveDist_mulVec_le` for
  `K = [[2, 1], [1, 2]]`, whose `projectiveDiameter` is `log 4`.
- `T = 0` on `C₁ = C₂ = ℝ_{≥0}`, `Δ = 0`, `f = g = 1`, `a = b = 1`: every hypothesis of
  `birkhoff_contraction` holds and its conclusion reads `0 ≤ 0 ≤ 0` with `a′ = b′ = 1`; but
  `d(Tf, Tg) = d(0, 0)` is not defined, so the metric corollary needs the nonzero-image
  hypothesis and does not apply to `T = 0`.

*Needs:* §0.4; Tau Ceti `Matrix.hilbertProjectiveDist_mulVec_le`; OptimalTransport Layer 13B,
item 9.

### 3.4 The ball-cover measure of noncompactness

For a bounded subset `A` of a complex Banach space define `χ(A)` as the infimum of the radii `r > 0`
of finite covers of `A` by balls of radius `r` centred anywhere in the space. For a bounded
operator `T` put `χ(T) = χ(T(B₁))` with `B₁` the closed unit ball, and
`r_χ(T) = lim_m χ(T^m)^{1/m}`, which exists and equals the infimum by submultiplicativity (Hennion,
§5, Définitions 5.1–5.2 and Propositions 5.1–5.2, pp.19–20).

Its API consists of these facts.

- `χ(A) < ∞` exactly for bounded `A`; `χ` is monotone, `χ(A + A′) ≤ χ(A) + χ(A′)` and
  `χ(cA) = |c| χ(A)`.
- In a Banach space `χ(A) = 0` exactly when `A` is relatively compact.
- For bounded `A` and nonempty relatively compact `K₀`, `χ(A + K₀) = χ(A)`; adding a compact
  operator does not change `r_χ`.
- `χ(T(A)) ≤ χ(T) χ(A)`, `χ(T^{m+k}) ≤ χ(T^m) χ(T^k)`, `χ(T) ≤ ‖T‖`, and `r_χ(T)` is at most the
  real value of `spectralRadius ℂ T`.

**Checks.**

- A finite set, and any bounded set of a finite-dimensional space, has `χ = 0`.
- In an infinite-dimensional Banach space `χ(B₁) = 1` and `r_χ(id) = 1`.
- `r_χ(cT) = |c| r_χ(T)` for `c ∈ ℂ`.
- `χ(∅) = 0` and `A + ∅ = ∅`, so in an infinite-dimensional space `χ(B₁ + ∅) = 0 ≠ 1 = χ(B₁)`: the
  compact-set rule needs `K₀` nonempty.

*Needs:* Mathlib `spectralRadius`.

### 3.5 Hennion's essential-radius bound

Prove `hennion_essential_radius`: let `B` be a complex Banach space, `p` a seminorm on `B`, and `T`
a bounded operator such that `T(B₁)` is `p`-precompact (for every `ε > 0` finitely many `p`-balls
of radius `ε` cover it), `p(Tf) ≤ M p(f)` for some `M`, and `‖T^k f‖ ≤ R p(f) + r^k ‖f‖` for some
`k ≥ 1`, `R` and `r ≥ 0`. Then every spectral value `z` with `|z| > r` is an eigenvalue, an isolated
point of the spectrum, and has finite-dimensional generalised eigenspace; for every `t > r` only
finitely many spectral values have `|z| ≥ t` (Hennion, Théorème 3.1, p.11, Corollaire 5.2, p.21,
and Proposition 3.1, p.11). If moreover `p` is a norm, the iterates are uniformly `p`-bounded
(`p(T^m f) ≤ M′ p(f)` for all `m`) and `r < 1`, then either `spectralRadius ℂ T < 1`, or it
equals `1` and every spectral value on the unit circle is such an eigenvalue (Hennion,
Proposition 3.3 and Corollaire 3.1, pp.11–13). One route iterates the `k`-step
inequality to `‖T^{ks} f‖ ≤ R_s p(f) + r^{ks} ‖f‖`, covers `T(B₁)` by finitely many small `p`-balls
to get `χ(T^{ks+1}) ≤ 2‖T‖ r^{ks}`, hence `r_χ(T) ≤ r`; for `|z| > r_χ` bounded approximate solutions
of `(z − T)f = g` have convergent subsequences, so `z − T` has finite-dimensional kernel and closed
range of finite codimension, with stationary kernel and range chains (Hennion, Appendice A,
pp.43–46); for `t > r` with no spectral value of modulus `t`, the BanachAlgebras A2 Riesz
idempotent of the finite spectral set `{|z| > t}` splits off the generalised eigenspaces. The radius alternative is retained: a contraction need not have a
spectral value on the unit circle.

**Checks.**

- A compact `T` satisfies the hypotheses with `p = ‖·‖`, `k = 1`, `R = ‖T‖` and `r = 0`, and the
  conclusion is the Riesz–Schauder description of its nonzero spectrum; the finite-dimensional
  generalised eigenspaces at nonzero scalars and the Fredholm property of `1 − T` at `r = 0` are
  Tau Ceti's `IsCompactOperator.finiteDimensional_genEigenspace_nat`,
  `IsCompactOperator.finiteDimensional_ker_one_sub`, `IsCompactOperator.isClosed_range_one_sub`
  and `IsCompactOperator.finiteDimensional_quotient_range_one_sub`.
- For `T = id` on an infinite-dimensional space, `r_χ = 1`, and no `r < 1` can satisfy the
  hypotheses with a precompactness seminorm; the conclusion would fail at `z = 1`.
- For `T = (1/2) id` on `ℂ` the spectral radius is `1/2 < 1`, the first branch of the alternative.

*Needs:* §3.4; BanachAlgebras A2; Mathlib `spectrum.gelfand_formula`, `spectrum.nonempty`,
`Module.End.maxGenEigenspace`, `ContinuousLinearMap.IsFredholm`; Tau Ceti
`IsCompactOperator.finiteDimensional_genEigenspace_nat` (the compact case, as a check).

### 3.6 Countable-branch cone convergence

**Cone convergence.** For real `σ > 1` there are `Q ≥ 1`, `a > 0` and `0 < κ < 1` with
`L_σ^Q(C_a ∖ {0}) ⊂ C_{κa} ∖ {0}`. With an eigenprobability `ν` and its eigenvalue `λ` (§3.2) there
are `h ∈ C¹(Δ; ℝ)` with `h > 0` and `∫ h dν = 1`, and constants `M < ∞`, `0 < θ < 1`, with
`‖λ^{−m} L_σ^m f − h ∫ f dν‖_{C¹} ≤ M θ^m ‖f‖_{C¹}` for every complex `f ∈ C¹(Δ; ℂ)` and `m ≥ 0`.
The proof covers the infinitely many branches and the boundary of `Δ` (Liverani, §1, Theorem 1.1
and Lemma 1.3, preprint pp.4–6; §2, Lemmas 2.1–2.3 and Theorem 2.5, preprint pp.7–12; GMR19,
Theorem 39, p.793, and its proof sketch, p.799). One route: the two-norm inequality gives
`|D L_σ^Q f| ≤ (Cσ + Dρ^Q a) L_σ^Q f` on `C_a`, so choose `Q` with `Dρ^Q < κ` and then
`a > Cσ/(κ − Dρ^Q)`; apply Birkhoff's theorem with the finite diameter of §3.3; on the section
`∫ f dν = 1` the cone order controls the C¹ norm, so `λ^{−kQ} L_σ^{kQ} 1` is Cauchy in C¹; a real C¹
function `f` plus the constant `‖f‖_∞ + ‖Df‖_∞/a` lies in `C_a`, and the finitely many residues of
`m` modulo `Q` give the full bound.

**Checks.**

- C¹ convergence is strictly stronger than uniform convergence: on the chart segment,
  `f_k(x) = sin(kx)/k` tends uniformly to `0` (sup at most `1/k`), but `f′_k(0) = 1`, so its C¹
  norm never drops below `1`; a C⁰ form of the conclusion would not control derivatives.
- For `n = 3`, `σ = 2`: `λ = 1`, `ν` is twice Lebesgue measure on `[0, 1/2]`, and
  `h(w) = 1/(2 log 2 · w₂)` has `∫ h dν = 1`.

*Needs:* §2.3, §3.2, §3.3.

### 3.7 The Ruelle–Perron–Frobenius theorem

Prove `ruelle_perron_frobenius`: for `d ≥ 1` and real `σ > 1` there are `λ_σ > 0`, a function
`h_σ` that is C¹ and positive on the simplex, and an eigenprobability `ν_σ` with eigenvalue `λ_σ`,
such that every eigenprobability of `L_σ`, with any eigenvalue, equals `ν_σ`; `∫ h_σ dν_σ = 1`;
`L_σ h_σ = λ_σ h_σ` on the simplex; and there are `M` and `0 < θ < 1` such that for every `f` with
`C1BoundedOn` bound `K` and every `m`, `λ_σ^{−m} L_σ^m f − h_σ ∫ f dν_σ` has `C1BoundedOn` bound
`M θ^m K` (GMR19, Theorem 39, pp.793–794). Equivalently, on `C¹(Δ; ℂ)` the eigenvalue `λ_σ` is
algebraically simple with spectral projection `P_σ f = h_σ ∫ f dν_σ`, and `R_σ = L_σ − λ_σ P_σ`
satisfies `P_σ R_σ = R_σ P_σ = 0` and `spectralRadius ℂ R_σ < λ_σ`. The probability `h_σ ν_σ` is
invariant for the normalised operator `f ↦ L_σ(h_σ f)/(λ_σ h_σ)`, and the support of `ν_σ` is the
coding attractor `K` of §1.4.

One route takes the exponential convergence of §3.6. If `μ` is another eigenprobability with
eigenvalue `c′`, testing `h_σ` gives `c′ = λ_σ`, then integrating the convergence against `μ` and
using density of C¹ functions in `C(Δ)` (Stone–Weierstrass) gives `μ = ν_σ`. Positivity of every
branch weight gives forward invariance of the support; contraction and periodic codes put every
coding point in it; and the normalised iterates concentrate within `Dρ^m diam Δ` of `K`, which puts
the support inside `K`.

*Needs:* §3.6, §1.4; Mathlib `spectrum.gelfand_formula`,
`ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`.

### Examples

- For `n = 3`, `σ = 2`: `λ₂ = 1`, `ν₂` is twice Lebesgue measure on `[0, 1/2]`, and the normalised
  eigenfunction is `h₂(w) = 1/(2 log 2 · w₂)`; the unnormalised eigenfunction `1/w₂` is the
  Gauss–Kuzmin density in disguise (§7.2).
- In `ℝ²_{≥0}` the matrix `[[2, 1], [1, 2]]` maps the open quadrant into the cone spanned by `(2, 1)`
  and `(1, 2)`, of Hilbert diameter `log 4`, and contracts the Hilbert distance by `tanh(log 4/4)`.

### Dependencies

Layers 0–2; Tau Ceti (Birkhoff contraction for positive matrices, Riesz theory of compact
operators, both as checks); AlgebraicTopology Stage 2, item 7; OptimalTransport Layer 13B;
BanachAlgebras A2.

## Layer 4: Analytic perturbation and uniform gaps

### 4.1 Simple isolated eigendata

For a complex Banach space `B` and a bounded operator `T`, **simple isolated eigendata** are
`(λ, h, φ)` with `λ ∈ ℂ`, `h ∈ B`, `φ ∈ B*`, `φ(h) = 1`, `Th = λh`, `φ ∘ T = λφ`, such that `T − λ`
maps `ker φ` bijectively onto itself; the inverse is then bounded by the open mapping theorem. Put
`P f = φ(f) h` and `R = T − λP` (Kloeckner, Definition 1.1, p.178, and §3.1, pp.185–186). The
bijectivity on the complement encodes algebraic simplicity and isolation, not merely a
one-dimensional eigenspace.

Its API consists of these facts.

- `P` is the bounded projection onto `ℂh` with kernel `ker φ`; `PT = TP = λP`, `PR = RP = 0`.
- Replacing `(h, φ)` by `(ch, c^{−1}φ)` for `c ≠ 0` preserves `P` and the data.
- `T − λ + P` is invertible: it is the identity on `ℂh` and the given bijection on `ker φ`.
- `λ` lies in the spectrum of `T`, and a punctured disc around `λ` lies in the resolvent set; the
  BanachAlgebras A2 Riesz idempotent of `{λ}` is `P`.

**Checks.**

- `T = diag(2, 1)` on `ℂ²`, `λ = 2`, `h = e₁`, `φ = e₁*`: `P = diag(1, 0)` and `T − 2` acts on
  `ker φ = ℂe₂` as `−1`.
- The Jordan block `[[λ, 1], [0, λ]]` has a one-dimensional eigenspace `ℂe₁`, but every `φ` with
  `φ ∘ T = λφ` is a multiple of `e₂*`, which kills `e₁`; no normalised data exist.
- On `ℂ`, multiplication by `λ` has `ker φ = {0}`, so the bijectivity condition holds, also for
  `λ = 0`.

*Needs:* Mathlib `spectralRadius`, `spectrum.isOpen_resolventSet`; BanachAlgebras A2.

### 4.2 Analytic simple-eigenvalue perturbation

Prove `simple_eigenvalue_analytic`: let `U ⊂ ℂ` be open, `T : U → L(B)` holomorphic, `z₀ ∈ U`, and
`(λ₀, h₀, φ₀)` simple isolated eigendata of `T(z₀)`. Then on an open neighbourhood `V ⊂ U` of `z₀`
there are holomorphic `λ(z)`, `h(z)`, `φ(z)` with `λ(z₀) = λ₀`, `h(z₀) = h₀`, `φ(z₀) = φ₀`, which
are simple isolated eigendata of `T(z)` for every `z ∈ V`, normalised by `φ(z)h(z) = 1`, and
`λ′(z₀) = φ₀(T′(z₀) h₀)` (Kloeckner, the qualitative theorem and its proof, pp.177–178;
Propositions 3.1 and 3.2, p.186). If moreover the remainder `R(z₀)` has spectral radius below
`|λ(z₀)|`, the strict gap persists near `z₀` (Kloeckner, Corollary 1.13, p.182). One route applies
the implicit function theorem to `(z, u, ℓ) ↦ (T(z)u − ℓu, φ₀(u) − 1)`, whose derivative in
`(u, ℓ)` at the base point is `(v, t) ↦ ((T₀ − λ₀)v − t h₀, φ₀(v))` with explicit inverse on
`ℂh₀ ⊕ ker φ₀`; `ImplicitFunctionData.differentiableAt_implicitFunction` at every nearby point and
`DifferentiableOn.analyticOnNhd` give holomorphy; the dual family gives `φ(z)`; differentiating
`T h = λ h` and applying `φ` gives `λ′`. For gap persistence choose `m` with
`‖R(z₀)^m‖^{1/m} < r < |λ(z₀)|` by Gelfand's formula and keep the inequality by continuity of
`R(z)^m`; continuity of the spectral radius is not used.

**Checks.**

- `T(z) = diag(e^z, 1/2)`, `z₀ = 0`, `λ₀ = 1`, `h₀ = e₁`, `φ₀ = e₁*`: `λ(z) = e^z` and
  `λ′(0) = 1 = φ₀(T′(0) e₁)`.
- `T(z) = [[0, 1], [z, 0]]` has eigenvalues `±√z`, not holomorphic at `0`; there `T(0)` is a Jordan
  block and the simple-isolated hypothesis fails.

*Needs:* §4.1; Mathlib `ImplicitFunctionData.differentiableAt_implicitFunction`,
`DifferentiableOn.analyticOnNhd`, `spectrum.hasFDerivAt_resolvent`, `spectrum.gelfand_formula`.

### 4.3 Spectral gap on compact parameter intervals

**Uniform gap.** Prove `uniform_ruelle_perron_frobenius`: for `d ≥ 1` and every compact interval
`[a, b] ⊂ (1, ∞)` there are `M` and `0 < θ < 1`, chosen before `σ`, such that for every
`σ ∈ [a, b]` the data of §3.7 exist with these constants: `λ_σ > 0`, a function `h_σ` that is C¹
and positive on the simplex, and an eigenprobability `ν_σ` with eigenvalue `λ_σ`,
`∫ h_σ dν_σ = 1` and `L_σ h_σ = λ_σ h_σ` on the simplex, such that for every `f` with
`C1BoundedOn` bound `K` and every `m`, `λ_σ^{−m} L_σ^m f − h_σ ∫ f dν_σ` has `C1BoundedOn` bound
`M θ^m K`. Equivalently, `‖λ_σ^{−m} L_σ^m − P_σ‖_{C¹} ≤ M θ^m` for all `σ ∈ [a, b]` and `m ≥ 0`,
with `P_σ f = h_σ ∫ f dν_σ`; moreover there is `ε > 0` such that for every `σ ∈ [a, b]` every
spectral value of `L_σ` other than `λ_σ` has modulus at most `λ_σ − ε`. Near each real `σ`, the
data `λ`, `h`, `ν` and `P` continue holomorphically, normalised by `ν(1) = ν(h) = 1`; off the real
axis `ν` is a continuous complex-linear functional, not a measure (GMR19, Theorem 39(1), p.793, and
§4.4, p.799). One route: at each real parameter a power of the normalised remainder has norm `< 1`;
§4.2 keeps that bound on a neighbourhood; a finite subcover of `I` and a positive minimum of `λ`
give uniform constants; uniqueness at real parameters patches the local branches.

**Checks.**

- The statement is uniform only on compact intervals: as `σ ↓ 1`, `λ_σ → ∞` (§5.4), and no gap
  uniform on `(1, ∞)` is claimed.
- On the one-point interval `[2, 2]` with `n = 3` the data are those of §3.6: `λ₂ = 1`,
  `ν₂ = 2 dw₁` on `[0, 1/2]` and `h₂ = 1/(2 log 2 · w₂)`. On `[2, 3]` the constants `M`, `θ` are
  quantified before `σ`: constants `M_σ`, `θ_σ` taken from §3.7 at each `σ` separately, with
  `θ_σ → 1` as `σ → 3`, would satisfy the pointwise statement at every `σ` and not the uniform
  one.
- For `a > b` the interval is empty and the statement is vacuous; the headline carries only
  `1 < a`.

*Needs:* §3.7, §2.4, §4.2.

### Examples

- `T(z) = diag(e^z, 1/2)` has the holomorphic leading eigenvalue `e^z` and a gap on `|z| < log 2`.

### Dependencies

Layers 2–3; BanachAlgebras A2.

## Layer 5: Non-lattice separation and pressure

### 5.1 The non-lattice condition

The delay cocycle is **non-lattice** on the attractor `K` if for every real `t ≠ 0` there are no
bounded `G : K → ℝ` and `r ∈ ℝ` with `−tτ_a(w) − G(F_a w) + G(w) − r ∈ 2πℤ` for all letters `a` and
all `w ∈ K`; no continuity of `G` is required (GMR19, Definition 40, p.794, with `v = Im(−s log q)`).

Its API consists of these facts.

- Equivalent circle form: there is no `u : K → S¹` with `e^{−itτ_a(w)} u(F_a w) = e^{ir} u(w)`; a
  bounded principal argument turns such `u` into `G`, which is why `G` is not required continuous.
- At a fixed point `p_a` of `F_a` the `G`-terms cancel, so a lattice representation forces
  `−tτ_a(p_a) − r ∈ 2πℤ`.
- Adding `H ∘ F_a − H` to every delay, for bounded `H`, preserves the condition.

**Checks.**

- Constant delays `τ_a = c` are lattice: `G = 0`, `r = −tc` works for every `t`.
- Delays in `c + δℤ` are lattice with `t = 2π/δ` and `r = −tc`. On a one-point space with two
  branches of delays `√2` and `√2 + 1`, the common-phase condition holds with `t = 2π`, `G = 0`,
  `r = −2π√2`; with the phase fixed to `0` no `t ≠ 0` works, since the difference forces
  `t = 2πk` and then `k√2 ∈ ℤ` forces `k = 0`. So a definition without `r` is wrong when `c/δ` is
  irrational; for delays `1/2` and `3/2` both definitions call them lattice (`t = 4π`, `r = 0`).
- A sequence of fixed-point delays whose successive differences are positive and tend to `0` cannot
  lie in one coset `c + δℤ` with `δ > 0`.

*Needs:* §1.4, §0.2.

### 5.2 The fixed-point test

**The GMR delays are non-lattice.** For the letters `a_A = (A, n − 2)` the branch has a fixed ray
with multiplier `t_A = ((A + 1) + √((A + 1)² + 4))/2` and delay `log t_A`; these delays are strictly
increasing with `log t_{A+1} − log t_A → 0`, so the delay cocycle is non-lattice on `K` (GMR19,
Proposition 42 and proof, pp.795–796). One route: `det(γ_{n−1}^A γ_{n−2} − T·I_n)` equals
`(1 − T)^{n−3}(−T)(T² − (A + 1)T − 1)` (GMR19, p.795), so the monic characteristic polynomial
`det(T·I_n − γ_{n−1}^A γ_{n−2})` is `T(T − 1)^{n−3}(T² − (A + 1)T − 1)`; the roots agree. The
eigenvector `(0, …, 0, 1, t_A, t_A(t_A − A))`, with `n − 3` leading zeros, is nonnegative and lies
in `H_n` (its last coordinate is `t_A(t_A − A) = 1 + t_A`), and its ray lies in `K` by periodic
coding. For `n ≥ 4` the fixed ray is a boundary point of `Δ` (`w₁ = 0`); for `n = 3` all three
coordinates are positive and the chart point `1/(1 + t_A)` lies in the interior `(0, 1/2)`, since
`t_A > 1`.

**Checks.**

- `t₀ = (1 + √5)/2 ≈ 1.618`, `t₁ = 1 + √2 ≈ 2.414`, `t₂ = (3 + √13)/2 ≈ 3.303`; the gaps
  `log t₁ − log t₀ ≈ 0.400` and `log t₂ − log t₁ ≈ 0.314` decrease.
- `n = 3`: the eigenvector `(1, t_A, t_A(t_A − A))` satisfies the sum relation because
  `t_A² − (A + 1)t_A − 1 = 0`. At `A = 0` its chart point is `1/(1 + t₀) = (3 − √5)/2 ≈ 0.382`,
  strictly inside `(0, 1/2)`.
- `n = 3`, `A = 0`: the matrix `[[0, 1, 0], [0, 0, 1], [0, 1, 1]]` has `det(M − T·I) = −T³ + T² + T`
  and monic characteristic polynomial `T³ − T² − T`; at `T = 2` they take the values `−2` and `2`,
  so the two conventions differ by the sign `(−1)^n` in odd dimension, with the same roots.

*Needs:* §5.1.

### 5.3 Wielandt separation

Prove `wielandt_separation`: for `d ≥ 1`, real `σ > 1`, `t ≠ 0` and an eigenprobability `ν` of
`L_σ` with eigenvalue `c`, there are `C` and `0 ≤ θ < c` such that for every `f` with `C1BoundedOn`
bound `K` and every `m`, `L_{σ+it}^m f` has `C1BoundedOn` bound `C θ^m K`. Equivalently, on
`C¹(Δ; ℂ)`, `spectralRadius ℂ L_{σ+it} < λ_σ`; at `t = 0` the radius is `λ_σ`. Hence `1 − L_s` is
invertible on `C¹(Δ; ℂ)` for every `s` with `Re s = β` and `Im s ≠ 0`, once `λ_β = 1` (GMR19,
Theorem 41, p.795, and Proposition 42, pp.795–796; Lemma 46, pp.798–799). One route normalises by
`λ_σ` and conjugates by `h_σ`; positivity bounds every complex iterate in C⁰, and the two-norm
inequality with the compact inclusion of §0.5 puts the operator in the setting of §3.5 with radius
at most `1`. A unit-modulus eigenvalue with eigenvector `f` would make `|f/h_σ|` constant on `K`
(maximum on `K`, attraction to `K`, density of descendants), and equality in the triangle
inequality for the countable sum with strictly positive weights would give
`e^{−itτ_a(w)} g(F_a w) = ζ g(w)` on `K`, a lattice representation excluded by §5.2.

**Checks.**

- Domination `|L_s f| ≤ L_σ |f|` alone gives only `spectralRadius ≤ λ_σ`: constant delays (§5.1)
  satisfy the domination and have `spectralRadius L_{σ+it} = λ_σ` whenever `tc ∈ 2πℤ`.

*Needs:* §3.5, §3.7, §2.3, §5.2.

### 5.4 The pressure and the unique exponent

Prove `pressure_eigenvalue`: for `d ≥ 1` there is a real analytic `σ ↦ λ_σ` on `(1, ∞)` such that
`λ_σ > 0` is the eigenvalue of an eigenprobability of `L_σ`,
`λ′_σ = ∫ (∂_σ L_σ) h_σ dν_σ ≤ −log(3/2) λ_σ < 0`, `λ_σ → ∞` as `σ ↓ 1` and `λ_σ → 0` as `σ → ∞`.
Hence there is a unique `β = β(n) > 1` with `λ_β = 1`, a simple crossing with `λ′_β < 0`; existence
uses no arithmetic counting (GMR19, Proposition 43, pp.796 and 799–800; Lemma 35, p.792). One route:
the perturbation formula of §4.2 with `∂_σ q_a^{−σ} = −τ_a q_a^{−σ}`, `τ_a ≥ log(3/2)` and
`ν_σ h_σ = 1` gives the derivative bound; integrating the lower p-series bound of §2.2 against
`ν_σ` gives divergence at `1`; the corrected upper bound gives decay; the intermediate value
theorem and strict negativity give `β`.

**Checks.**

- `n = 3`: `λ₂ = 1`, so `β(3) = 2` (§7.2), and
  `λ′₂ = −π²/(12 log 2) ≈ −1.187 ≤ −log(3/2) ≈ −0.405`.
- Strict monotonicity alone is not used to infer `λ′_β ≠ 0`; the quantitative bound gives it.

*Needs:* §4.3, §2.2, §0.2.

### Examples

- For `n = 3`, `σ ↦ λ_σ` is the leading eigenvalue of the Gauss operator `G_σ` (§7.1), with
  `λ₂ = 1` and `λ′₂ = −π²/(12 log 2)`.

### Dependencies

Layers 1–4.

## Layer 6: Uniform renewal and conformal measures

### 6.1 Uniform exponential growth

**Uniform growth bound.** With `β` from §5.4 there is `C < ∞` with `0 ≤ N(w, r) ≤ C e^{βr}` for every
`w ∈ Δ` and `r ≥ 0`; `N(w, ·)` vanishes on negative times and is measurable and nondecreasing. No
continuity of `w ↦ N(w, r)` is asserted (Lalley, Lemma 8.1 and its recurrence argument,
pp.28–29; GMR19, (4.1), p.790). One route: put `p_a(w) = q_a(w)^{−β} h_β(F_a w)/h_β(w)`, which sum to
`1` by the eigen-relation, and `G(w, r) = e^{−βr} N(w, r)/h_β(w)`; with `c = log(3/2)`, for
`r ∈ [kc, (k + 1)c)` every child time is below `kc`, so the supremum of `G` up to time `(k + 1)c`
is at most the supremum up to `kc` plus `(min h_β)^{−1} e^{−βkc}`; sum the geometric forcing.

**Checks.**

- `n = 3`, `w = (1/2, 1/2)`, `r = log 2`: `N(w, r) e^{−2r} = 3/4`, which exceeds `sup B = 6/π² ≈ 0.61`
  (§6.7); the uniform constant `C` is a bound for all times, not the asymptotic constant.
- The bound is proved before any smoothing; it is an input of §6.5, not a consequence of the
  asymptotic.

*Needs:* §0.3, §5.4, §3.7.

### 6.2 The renewal transform

**Resolvent and Mellin identity.** For `Re s > β` the one-sided and the zero-extended two-sided
Laplace transforms of `r ↦ N(w, r)` converge absolutely, uniformly in `w` on compact parameter
sets, and equal `N̂(w, s) = s^{−1} ((1 − L_s)^{−1} 1)(w)`; the right side is holomorphic with values
in `C¹(Δ; ℂ)`. With `g_w(u) = N(w, log u)` (which vanishes for `u < 1`), the same value is
`mellin g_w (−s)` (GMR19, §4.1, (4.2)–(4.4), pp.790–791). One route: §6.1 dominates the integrand
by `C e^{−(Re s − β) r}`; integrating each word indicator gives `e^{−sT_u}/s`, and the positive real
sum justifies Fubini; for `σ > β`, `λ_σ < 1`, the two-norm argument gives
`spectralRadius L_s ≤ λ_σ < 1`, so the Neumann series of `(1 − L_s)^{−1}` converges, also when
`Im s = 0`; powers are word sums (§2.1) and §2.5 converts to the Mellin form. The count is not
assumed continuous in `w`; its transform is C¹-valued because it equals the resolvent expression.

**Checks.**

- The factor `s^{−1}` comes from integrating an indicator: the empty word contributes
  `∫₀^∞ e^{−sr} dr = 1/s`, not `1` as a Stieltjes convention would give.

*Needs:* §6.1, §2.5, §2.4, §5.3; ArithmeticDirichletSeriesPartII §0.1;
Mathlib `MeasureTheory.integral_tsum`.

### 6.3 The simple pole and the counting residue

**Simple pole.** Near `β` write `R_s = L_s − λ_s P_s` with the holomorphic data of §4.3. Then
`(1 − L_s)^{−1} = (λ_s/(1 − λ_s)) P_s + (1 − R_s)^{−1}`, equivalently
`(1 − L_s)^{−1} = (1 − λ_s)^{−1} P_s + (1 − R_s)^{−1}(1 − P_s)`. The transform
`N̂(s) = s^{−1}(1 − L_s)^{−1} 1` has a simple pole at `β` with residue
`B = h_β/(β |λ′_β|)`, a positive C¹ function, where `ν_β(1) = ν_β(h_β) = 1`; and `N̂(s) − B/(s − β)`
extends holomorphically, with values in `C¹(Δ; ℂ)`, to a neighbourhood of every point of the line
`Re s = β` (GMR19, §4.3, item (1), p.797; Lalley, Proposition 7.2, p.25, and Theorem 1 with (2.5),
pp.8–9). One route: `PR = RP = 0`; on the range of `P` the first identity acts as
`λ/(1 − λ) + 1 = 1/(1 − λ)`; `(1 − R_s)^{−1}` is holomorphic near `β` because its radius is below
`1`; `1 − λ_s = −λ′_β(s − β) + O((s − β)²)` and `P_β 1 = h_β`; division by `s` gives the factor
`β^{−1}`. At the other points of the line §5.3 puts `1` in the resolvent set of `L_s`, and openness
of the resolvent set with holomorphy of inversion gives the local continuation. No strip of uniform
width is asserted.

**Checks.**

- Evaluate both sides on `h_s`: `R_s h_s = 0` and `P_s h_s = h_s`, so the corrected identity gives
  `(1 − λ_s)^{−1} h_s`, while the printed form `(1 − λ_s)^{−1} P_s + (1 − R_s)^{−1}` gives
  `(1 − λ_s)^{−1} h_s + h_s`.
- `n = 3`: `h₂(w) = 1/(2 log 2 · w₂)`, `|λ′₂| = π²/(12 log 2)`, hence `B(w) = 3/(π² w₂)`, which is
  not `h₂`.

*Needs:* §6.2, §4.2, §4.3, §5.3, §5.4.

### 6.4 Uniform smoothing

**Uniform smoothed limit.** Let `X` be a compact space, `a > 0`, and `α_x : ℝ → [0, ∞)` measurable,
vanishing for `t < 0`, with `α_x(t) ≤ C e^{at}` uniformly in `x` for `t ≥ 0`. Suppose the Laplace
transform `F(s)(x) = ∫₀^∞ e^{−st} α_x(t) dt` is a holomorphic `C(X; ℂ)`-valued map on `Re s > a` and
`F(s) − B/(s − a)` has a holomorphic `C(X; ℂ)`-valued germ at every point of `Re s = a`, with
`B ∈ C(X; ℝ)`. Then for every even probability density `k` on `ℝ` whose Fourier transform is
continuous, nonnegative and compactly supported (for instance `squaredSinc λ` with `λ > 0`, ArithmeticDirichletSeriesPartII §1.1),
`∫ k(r − t) e^{−at} α_x(t) dt → B(x)` uniformly in `x` as `r → ∞` (Lalley, §8, proof of Theorem 1,
(8.10)–(8.12), pp.30–32). One route damps `g_x(t) = e^{−at} α_x(t)` by `e^{−εt}`, writes the
symmetrised convolution with `k(r − t) + k(−r − t)` as a frequency integral of
`2 cos(rξ) k̂(ξ) F(a + ε + iξ)` over the compact support of `k̂`, lets the pole contribute
`B · ε/(ε² + ξ²)`, whose normalised mass tends to a point mass, and disposes of the regular part by
the Riemann–Lebesgue lemma for `C(X; ℂ)`-valued integrable functions (or by integration by parts in
`ξ` when `k̂` is smooth); then `ε ↓ 0` by the uniform bound, and the reflected term vanishes because
`g_x = 0` on negative times.

**Checks.**

- Pointwise Riemann–Lebesgue in each `x` would give convergence for each `x` but not uniformly;
  the `C(X; ℂ)`-valued form is what gives the sup-norm limit.
- One-point `X` with `α(t) = e^{at}`: `F(s) = 1/(s − a)`, `B = 1`, and the smoothed limit is
  `∫ k = 1`.
- `squaredSinc 0` is identically `0`, of mass `0`, so it is not a probability density and is
  excluded; the smoothed limit with it would be `0 ≠ B`.

*Needs:* §2.5; ArithmeticDirichletSeriesPartII §1.1; Mathlib
`Real.tendsto_integral_exp_smul_cocompact`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

### 6.5 The uniform renewal Tauberian theorem

Prove `uniform_renewal_tauberian`: let `X` be compact, `a > 0`, and for each `x ∈ X` let `α_x` be
nonnegative and nondecreasing on `[0, ∞)` with `α_x(t) ≤ C e^{at}` for one `C` and all `x`, `t ≥ 0`.
Let `F : ℂ → C(X; ℂ)` be holomorphic on `Re s > a` with `F(s)(x) = ∫₀^∞ e^{−st} α_x(t) dt` there,
and suppose that for every real `y` the difference `F(s) − B/(s − a)`, with `B ∈ C(X; ℝ)`, agrees on
`Re s > a` near `a + iy` with a holomorphic `C(X; ℂ)`-valued function on a disc around `a + iy`.
Then `e^{−ar} α_x(r) → B(x)` uniformly in `x` (Lalley, Lemma 8.2, p.30). When `min B > 0` this is a
uniform relative asymptotic. One route: choose `k = squaredSinc λ` with `λ > 0` and with mass at least `1 − ε` in
`[−δ, δ]` (tail concentration); the uniform bound makes the omitted tails at most `Cε`;
monotonicity on `[r, r + 2δ]` gives a lower bound `(1 − ε) e^{−2aδ} e^{−ar} α_x(r)` for the
smoothed quantity at `r + δ`, and on `[r − 2δ, r]` an upper bound `e^{2aδ} e^{−ar} α_x(r) + Cε` at
`r − δ`; §6.4 and `ε, δ ↓ 0` squeeze uniformly. At a single `x` with `B(x) > 0` the hypotheses are
those of ArithmeticDirichletSeriesPartII §3.2 with `k = 0` and `A = B(x)`, and the constants
agree; when `B(x) = 0` the squeeze applies directly.

**Checks.**

- One-point `X`, `α(t) = e^{at}`: the conclusion `e^{−ar} α(r) → 1 = B` matches `delangeLaplace`
  with `k = 0` and `A = 1`.
- The uniform exponential bound is used: without it the tails of the kernel are not controlled
  uniformly in `x`, and monotonicity in `t` alone gives only pointwise conclusions.
- `B` vanishing somewhere is allowed: the conclusion is an absolute, not relative, uniform limit.

*Needs:* §6.4; ArithmeticDirichletSeriesPartII §§1.1 and 3.2.

### 6.6 Conformal measures

**Jacobian identity.** For every element `γ` of the semigroup, the projective action on `Δ` has
`|Jac_w γ| = ((γy)_n / y_n)^{−(n−1)}`; in particular `|det dF_a| = q_a^{−(n−1)}`, although `Δ` has
dimension `n − 2` (GMR19, Lemma 44, p.797). One route: on the span of `H_n` each `γ_i` has
determinant `±1` in the basis `e_j + e_n`; projectivising divides by `q^{dim+1} = q^{n−1}`; compose
with the cocycle.

Prove `conformal_exponent`: for `d ≥ 1` there is exactly one real `β`, and it satisfies `β > 1`,
such that some Borel probability `ν` on the simplex satisfies `∫ f dν = Σ_a ∫ f(F_a w) |Jac_w F_a|^{β/(n−1)} dν(w)` for every
continuous `f`, that is, `ν` is an eigenprobability of `L_β` with eigenvalue `1`; at `β` this
probability is unique, it is `ν_β`, and its support is `K` (GMR19, Theorem 10, Remarks 11–12,
p.759). One route: the Jacobian identity turns the conformal equation into `L_s^* ν = ν`; for
`s ≤ 1` testing `f = 1` is impossible, since the series `Σ_a q_a^{−s}` diverges (the native sum is
the junk value `0`, which would give `0 = 1`), so `s > 1`; then testing the positive `h_s` of §3.7
gives `λ_s = 1`, so `s = β` by §5.4; conversely `ν_β` works, and §3.7 gives
uniqueness. The exponent `β` is not asserted to be a Hausdorff dimension.

**Checks.**

- `n = 3`: `dF_A/dw₁ = −q_A^{−2}`, so `|Jac F_A| = q_A^{−2} = q_A^{−(n−1)}`.
- `n = 4`, chart point `(1/6, 1/3)`: `|det dγ₁| = 216/1331 = (11/6)^{−3}` and, for `a = (1, 2)`,
  `|det dF_a| = 27/343 = (7/3)^{−3}`; the exponent is `n − 1 = 3`, not the dimension `2`.

*Needs:* §0.2, §5.4, §3.7.

### 6.7 The uniform counting theorem

Prove `uniform_counting`: for `d ≥ 1`, if `ν` is a `β`-conformal probability (an eigenprobability
of `L_β` with eigenvalue `1`), then there is a function `B`, C¹ and positive on the simplex, with
`L_β B = B` there, such that `N(w, r)/(B(w) e^{βr}) → 1` uniformly for `w` in the simplex (GMR19,
Theorem 13 and (1.8), pp.759–761; §4.3, pp.796–797). By §6.6, `β` is the exponent of §5.4 and
`B = h_β/(β|λ′_β|)` with `ν_β(1) = ν_β(h_β) = 1`. Pulled back by `y ↦ y/y_n`, `B` is a bounded,
positive, degree-zero C¹ function on `H_n` with the same uniform asymptotic and
`Σ_a ((γ_a y)_n/y_n)^{−β} B(γ_a y) = B(y)`. One route takes `X = Δ` and `a = β` in §6.5: §6.1 gives
the uniform bound and monotonicity, §6.2 the transform, §6.3 the residue and the boundary germs, and
compactness with positivity gives `min B > 0`, converting absolute into relative error. No
identification with an arithmetic exponent is used.

**Checks.**

- `n = 3`, `w = (0, 1)` (chart point `0`): `B = 3/π²` and `N(w, log R) ≈ 3R²/π²`; at `R = 150`,
  `N = 6858` against `3R²/π² ≈ 6839`.
- `n = 3`, `w = (1/2, 1/2)`: `B = 6/π²`; at `R = 150`, `N = 13699` against `≈ 13678`.
- The leading function is `B`, not the `ν`-normalised `h_β`: for `n = 3` they differ by the factor
  `6 log 2/π² ≈ 0.42`.

*Needs:* §6.1, §6.3, §6.5, §6.6.

### Examples

- For `n = 3`: `β = 2`, `ν₂` is twice Lebesgue measure on `[0, 1/2]`, and
  `N(w, r) ~ 3e^{2r}/(π² w₂)` uniformly on the chart segment.

### Dependencies

Layers 0–5; ArithmeticDirichletSeriesPartII §§0.1, 1.1 and 3.2.

## Layer 7: Gauss, Rauzy and exponent comparisons

### 7.1 The parameter-dependent Gauss conjugacy

**Gauss conjugacy.** For `n = 3` use `x = w₁/w₂ ∈ [0, 1]`, so `w = (x/(1 + x), 1/(1 + x))`; then
`F_A(x) = 1/(x + A + 1)` and `q_A(x) = (x + A + 2)/(x + 1)`. For `Re s > 1` let
`M_s f(x) = (1 + x)^s f(x)`; `M_s` and its inverse are bounded on `C¹([0, 1])`, and
`M_s^{−1} L_s M_s = G_s` with `G_s f(x) = Σ_{A≥0} (x + A + 1)^{−s} f(1/(x + A + 1))`, the coordinate
pullback being understood (GMR19, Example 34, pp.791–792; Example 37, pp.792–793). At `s = 2`,
`G₂` is the complexification of the density transfer operator `gaussDensityTransfer`. One route is
branchwise: `q_A^{−s} (1 + F_A(x))^s / (1 + x)^s = (x + A + 1)^{−s}`, summed by uniform C¹
convergence.

**Checks.**

- At `x = 0` the weight of branch `A` is `(A + 2)^{−s}` for `L_s` and `(A + 1)^{−s}` for `G_s`.
- `x = 1`, `A = 0`: `F₀(1) = 1/2` and `q₀(1) = 3/2`, matching `w = (1/2, 1/2)` and
  `q = 1 + (1/2)` of §0.2.
- `M₂ 1` takes the values `1` at `x = 0` and `4` at `x = 1`; the inverse multiplier
  `(1 + x)^{−2}` gives `1` and `1/4`.
- The derivative of `M₂ 1 = (1 + x)²` is `2(1 + x)`, with endpoint values `2` and `4`, so its C¹
  sum norm on `[0, 1]` is `4 + 4 = 8`.
- `s = 2`, `x = 1`, `A = 0`: the conjugated branch weight is
  `q₀^{−2} (1 + F₀(1))² / (1 + 1)² = (3/2)^{−2} (3/2)² / 4 = 1/4 = (1 + 0 + 1)^{−2}`; with the
  inverse multiplier, `q₀^{−2} (1 + 1)² / (1 + F₀(1))² = 64/81`, so the direction
  `M_s^{−1} L_s M_s` is forced.

*Needs:* §2.1, §0.5; ProbabilisticAndMetricNumberTheory §4.4 (`gaussMap`, inverse branches and
their absolute derivative) and §4.8 (`gaussDensityTransfer`).

### 7.2 The Gauss normalisation and the exponent for `n = 3`

Prove `eigenprobability_three`: twice Lebesgue measure on the chart segment `[0, 1/2]` is a
`2`-conformal probability for `n = 3`. With `conformal_exponent` this gives `β(3) = 2` (GMR19,
Example 37, p.793; Baragar's value `β(3) = 2` is recorded at GMR19, (1.3), p.753). One route: on the
branch `A`, `v = F_A(w₁)` with `t = 1 − w₁` satisfies `dv/dt = q_A^{−2}`, and the images
`[1/(A + 3), 1/(A + 2)]` tile `(0, 1/2]`, so `∫ L₂ f dw₁ = ∫ f dw₁` on `[0, 1/2]`.

**The `n = 3` constants.** For real `s > 1` the Gauss operator `G_s` on `C¹([0, 1])` has a simple
positive leading eigenvalue and the uniform gaps of §4.3, transported by §7.1. At `s = 2`,
`G₂(1/(1 + x)) = 1/(1 + x)` by the supplier's telescope, the invariant Gauss density is
`1/((1 + x) log 2)` (`gaussMeasure`), the unnormalised leading eigenfunction of `L₂` is
`(1 + x)²/(1 + x) = 1 + x = 1/w₂`, `λ′₂ = −π²/(12 log 2)` (one route: the Lebesgue eigenmeasure of
`G₂` and `∫₀¹ log y/(1 + y) dy = −π²/12`), and the counting function of §6.7 is
`B(w) = 3/(π² w₂)`. Prove `counting_three`: on the chart segment `[0, 1/2]`,
`N(w, r) / (3e^{2r}/(π² w₂)) → 1` uniformly, with `w₂ = 1 − w₁ ≥ 1/2` (GMR19, Theorem 13 at
`n = 3`, p.759, with Example 37, pp.792–793). One route: `uniform_counting` with `ν₂` from
`eigenprobability_three` gives the uniform asymptotic, and the residue formula of §6.3 with the
constants above identifies `B`.

**Checks.**

- The raw eigenfunction `1/(1 + x)` of `G₂`, its probability normalisation `1/((1 + x) log 2)` and
  the `ν₂`-normalised `h₂ = 1/(2 log 2 · w₂)` are three different functions.
- `n = 3`, `f(w) = w₁²`: `∫ f dν₂ = 2 · (1/2)³/3 = 1/12`, and `∫ L₂ f dν₂` has the same value.
- `n = 3`, `w = (1/4, 3/4)`, `R = 150`: `N(w, log R) = 9124` against `3R²/(π² · 3/4) ≈ 9119`.
- The constant of `counting_three` at the endpoints is `3/π² ≈ 0.304` at `w₁ = 0` and
  `6/π² ≈ 0.608` at `w₁ = 1/2`; using `h₂` instead would give `1/(2 log 2) ≈ 0.721` and
  `1/log 2 ≈ 1.443`, contradicting the counts `6858` and `13699` at `R = 150`.

*Needs:* §7.1, §4.3, §5.4, §6.3, §6.6, §6.7; ProbabilisticAndMetricNumberTheory §4.4 (density telescope,
`gaussMeasure`).

### 7.3 The Rauzy gasket comparison

**Rauzy comparison.** For `n = 4`, in the basis `e_i + e₄` of the span of `H₄`, `γ₁`, `γ₂`, `γ₃`
have the matrices `[[0,1,0],[0,0,1],[1,1,1]]`, `[[1,0,0],[0,0,1],[1,1,1]]` and
`[[1,0,0],[0,1,0],[1,1,1]]` (GMR19, Example 9, p.757). Moving the last row to slot `i` gives the
matrix `A_i` whose row `i` is all ones and whose other rows are those of the identity; the
projective action of `{A₁, A₂, A₃}` on the positive 2-simplex is the iterated function system of the
Rauzy gasket (GMR19, Example 9, p.757). The family `{A_i}` is equivariant under coordinate
permutations, sorting identifies its quotient with the ordered `γ` dynamics, and the full gasket is
the permutation saturation of the ordered closed attractor of §1.4, the parabolic boundary points
being included through closure under acceleration. Individual unsorted branches are not claimed to
equal sorted ones. One route decomposes unaccelerated words into maximal `γ₃`-runs separated by
`γ₁` or `γ₂`: codes with infinitely many separators are accelerated codes, and tails consisting of
`γ₃` alone give parabolic limits, already in the closed attractor as `A → ∞`.

**Checks.**

- `γ₁` with its last row moved to slot `1` is `[[1,1,1],[0,1,0],[0,0,1]] = A₁`; `γ₂` with its last
  row moved to slot `2` is `[[1,0,0],[1,1,1],[0,0,1]] = A₂`; `γ₃ = A₃`.
- The ordered attractor for `n = 4` avoids `(1/3, 1/3, 1/3)` (§1.4), and so does the gasket,
  consistent with the holes of GMR19, Figure 1, p.758.

*Needs:* §0.2, §1.4.

### 7.4 Explicit bounds for the exponent

Prove `conformal_exponent_pseries`: if `ν` is a `β`-conformal probability for `d = n − 2` chart
coordinates, then `d Σ_{A≥0} (A + 2)^{−β} ≤ 1 ≤ 2^β d Σ_{A≥0} (A + 3)^{−β}`, that is
`(n − 2)(ζ(β) − 1) ≤ 1 ≤ 2^β (n − 2)(ζ(β) − 1 − 2^{−β})`; for `d = 0` no conformal probability
exists, and for `β ≤ 1` the hypothesis cannot hold (§6.6), so both sums are genuine (GMR19,
Lemma 35, p.792, and §4.5, p.799, with the factor `2^β`). One route: testing `f = 1` gives
`1 = ∫ L_β 1 dν`, which lies between `inf L_β 1` and `sup L_β 1` (§2.2). Both sides are strictly decreasing in `β`, so `β(n)` lies between
the roots of the two equations.

**Checks.**

- `n = 3`: the enclosure is `1.728 < β(3) < 2.425`, containing `2`.
- `n = 4`: `2(ζ(2.18) − 1) > 1` and `2 · 2^{3.3}(ζ(3.3) − 1 − 2^{−3.3}) < 1`, so
  `2.18 < β(4) < 3.3`; GMR19, (1.3), p.753, records Baragar's enclosure `(2.430, 2.477)` for the
  arithmetic exponent, inside this interval.
- With the printed factor `2` in place of `2^β` the upper equation `2(n − 2)(ζ(β) − 1 − 2^{−β}) = 1`
  has root `≈ 1.882` for `n = 3`, which would exclude `β(3) = 2`; the corrected constant is needed.

*Needs:* §2.2, §5.4, §6.6.

### 7.5 Monotonicity of the exponent

Prove `conformal_exponent_mono`: if `ν` is an `s`-conformal probability for `d` chart coordinates and
`ν′` an `s′`-conformal probability for `d + 1`, then `s ≤ s′`; hence `β(n) ≥ β(n − 1)` and
`β(n) ≥ 2` for all `n ≥ 3` (GMR19, Remark 14, p.761). One route: prepending a zero,
`(w₁, …, w_{n−2}) ↦ (0, w₁, …, w_{n−2})`, embeds `Δ_{n−1}` in `Δ_n`, sends the letter `(A, j)` to
`(A, j + 1)`, intertwines the branches and preserves `q` and all word delays; the induced injection
of words gives `N_n(ιw, r) ≥ N_{n−1}(w, r)`, and §6.7 forces `β(n) ≥ β(n − 1)`.

**Checks.**

- `n = 3 → 4`: the embedding sends `w = (1/3, 2/3)` to `(0, 1/3, 2/3)`, and `(A, 1)` to `(A, 2)`:
  `q_{(A,1)}(1/3, 2/3) = 1 + (A + 1)(2/3) = q_{(A,2)}(0, 1/3, 2/3)`.
- The index shift is `j ↦ j + 1`; with `j ↦ j` the letter `(A, 1)` would read the new zero
  coordinate and give `q = A + 2` instead.

*Needs:* §6.6, §6.7, §7.2, §0.2.

### Examples

- `β(3) = 2` with `B(w) = 3/(π² w₂)`; `2.18 < β(4) < 3.3`; `β(n) ≥ 2` for every `n ≥ 3`.

### Dependencies

Layers 0–6; ProbabilisticAndMetricNumberTheory §§4.4 and 4.8.

## Downstream consumers

- Counts of integer points on Markoff–Hurwitz varieties (GMR19, Theorem 3) consume
  `uniform_counting`, `conformal_exponent` and the renewal equation of §0.3, with the varieties,
  moves, exceptional tuples and descent of ClassicalArithmeticCompletion §§4.38, 4.57, 4.78 and
  4.105; ArithmeticDirichletSeriesPartII's downstream note describes exactly this use of a uniform
  renewal argument at a positive abscissa.
- Counts of one-sided simple closed geodesics on hyperbolic structures on `RP²` minus three points
  have growth exponent `β(4)` (GMR19, p.761) and consume the `n = 4` case with §7.3.
- Spectral applications of countable-branch transfer operators (Gauss-type maps, the Rauzy gasket)
  consume `ruelle_perron_frobenius`, `wielandt_separation` and `pressure_eigenvalue`; the general
  theorems `schauder_tychonoff`, `hennion_essential_radius`, `simple_eigenvalue_analytic` and
  `uniform_renewal_tauberian` have no transfer-operator hypothesis.

## Worked examples

- **`n = 3`.** The chart is `w₁ ∈ [0, 1/2]`; `L₂` is conjugate to the Gauss density operator;
  `β(3) = 2`; `ν₂ = 2 dw₁`; `h₂ = 1/(2 log 2 · w₂)`; `λ′₂ = −π²/(12 log 2)`; and
  `N(w, r) ~ 3e^{2r}/(π² w₂)`. At `R = e^r = 150` the counts at `w₁ = 0, 1/4, 1/2` are `6858`, `9124`
  and `13699`, against predictions `6839`, `9119` and `13678`.
- **`n = 4`.** The branches at `w = (1/6, 1/3, 1/2)` have `q = 11/6` for `(0, 1)` and `q = 7/3` for
  `(1, 2)`; the two-letter word `[(0, 1), (1, 2)]` has delay `log(9/2)`; the exponent satisfies
  `2.18 < β(4) < 3.3`; the attractor is the ordered part of the Rauzy gasket.

## References

- **GMR19** — Alex Gamburd, Michael Magee and Ryan Ronan,
  [An asymptotic formula for integer points on Markoff–Hurwitz varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf),
  Annals of Mathematics 190 (2019), 751–809, doi:10.4007/annals.2019.190.3.2; arXiv version 3,
  [arXiv:1603.06267v3](https://arxiv.org/pdf/1603.06267v3), whose numbering of §4 differs (see Notes
  on the sources).
- **LAL89** — Steven P. Lalley,
  [Renewal theorems in symbolic dynamics, with applications to geodesic flows, non-Euclidean tessellations and their fractal limits](https://www.stat.uchicago.edu/~lalley/Papers/acta.pdf),
  Acta Mathematica 163 (1989), 1–55; author's copy, printed page numbers.
- **LIV95** — Carlangelo Liverani,
  [Decay of correlations](https://carlangelo-liverani.github.io/Lavori/live9502.ps.gz), Annals of
  Mathematics 142 (1995), 239–301; author preprint, locators use preprint pages.
- **MN75** — Sidney A. Morris and E. S. Noussair,
  [The Schauder–Tychonoff fixed point theorem and applications](https://www.sidneymorris.net/Morris34.pdf),
  Matematický časopis 25 (1975), 165–172; author's copy, printed page numbers.
- **KLO19** — Benoît R. Kloeckner,
  [Effective perturbation theory for simple isolated eigenvalues of linear operators](https://jot.theta.ro/jot/archive/2019-081-001/2019-081-001-008.pdf),
  Journal of Operator Theory 81 (2019), 175–194.
- **HEN95** — Hubert Hennion,
  [Quasi-compacité. Cas des noyaux lipschitziens et des noyaux markoviens](https://www.numdam.org/item/PSMIR_1995___2_A6_0.pdf),
  Publications mathématiques et informatiques de Rennes (1995), fascicule 2, 1–50.

In the text, Lalley, Liverani, Morris–Noussair, Kloeckner and Hennion refer to LAL89, LIV95, MN75,
KLO19 and HEN95.

### Notes on the sources

The statements above correct the following printed passages.

- GMR19, §4.2, p.794: the image of the coding map is called the attractor and is said to be
  compact. For `n = 3` the fixed points of the branches tend to `x = 0`, which no code reaches; the
  attractor of §1.4 is the closure of the image.
- GMR19, §4.5, p.799: the upper p-series bound is printed with the factor `2` in place of `2^σ`;
  `q_a ≥ (A + 3)/2` gives `q_a^{−σ} ≤ 2^σ (A + 3)^{−σ}`, and at `n = 3`, `w = (1/2, 1/2)` the printed
  bound fails for every `σ > 1` (§2.2).
- GMR19, Lemma 46, p.798: the right side of the two-norm inequality is written with the complex
  operator; the order inequality needs `L_{Re s}` in both majorants (§2.3).
- GMR19, §4.3, item (1), p.797, and Lalley, Proposition 7.2, (7.7), p.25: the decomposition
  `(1 − L_s)^{−1} = (1 − λ_s)^{−1} P_s + (1 − L′_s)^{−1}` with the full remainder counts the
  eigendirection twice; §6.3 states the two correct forms.
- GMR19, §4.3, p.797: the leading coefficient with the normalisations of Theorem 39 is
  `h_β/(β|λ′_β|)`, not `h_β`; Theorem 13 allows the rescaling (§6.3).
- GMR19, (5.5), p.801, and (5.9), p.802: the denominators are squares, `(3 + b − 2w_j)²` and
  `(5 + b − 4w_{n−2})²`, as the case computations in arXiv v3, pp.49 and 52, show (§1.2).
- GMR19, §5.1, p.801: on the cusp the inequality is `w_{n−1} ≥ (1 + w_{n−2})/2`, not strict; the
  point `(1/5, 1/5, 3/5)` attains it (§1.1).
- GMR19 arXiv v3, (5.1), p.44: the index range is printed `1 ≤ i ≤ n − 3`; the published display
  (p.801), the use of (5.1) in the proof of Lemma 48 for `j = n − 2`, `B ≥ 2` (p.803), and the
  proof of (5.1) in arXiv v3, p.46, which treats `i = 1, …, n − 2`, all need `1 ≤ i ≤ n − 2`
  (§1.2).
- GMR19, Table 1, p.804: the derivative row of a surviving coordinate `w_k` is `w_k/(2 − w_i)²`; the
  third such row should carry `w₃` where it precedes the deleted index, not a repeated `w₂`.
- GMR19 arXiv v3, proof of (5.5), p.49: for ordinary columns the comparison is `C₁ ≥ C_k`, since the
  column sums decrease in `w_k`; for `j = 1` the displayed expression is a common upper bound rather
  than the exceptional column sum; the final bound `4/5` is unaffected.
- Hennion, Proposition 5.1(v), p.19: `χ(A + K₀) = χ(A)` needs `K₀` nonempty, as the proof assumes
  (§3.4).
- Lalley, §7, before Propositions 7.2–7.3, p.25: lower semicontinuity of the spectral radius does
  not keep nearby values below a bound; the finite-power Gelfand argument of §4.2 gives the needed
  upper bound.

The published and arXiv numberings of GMR19 differ: arXiv Theorem 37, Theorem 39, Proposition 40,
Lemma 36, Lemma 44 and Lemma 46 are published Theorem 39, Theorem 41, Proposition 42, Lemma 38,
Lemma 46 and Lemma 48. Locators above use the published numbering unless arXiv v3 is named.
