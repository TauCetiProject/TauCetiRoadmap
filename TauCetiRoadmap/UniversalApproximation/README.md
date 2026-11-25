# Roadmap: universal approximation by one-hidden-layer networks

**Summary.** A one-hidden-layer neural network with activation `σ : ℝ → ℝ` computes a function
`x ↦ ∑ᵢ cᵢ σ(⟪wᵢ, x⟫ + bᵢ) + c₀` on a real inner product space: each hidden unit applies `σ` to
an affine function of the input, and the output is an affine combination of the units. This
roadmap answers two questions about such networks. Which activations let them approximate every
continuous function on every compact set? And when a function can be approximated, how fast does
the error fall as the number of hidden units grows? The activation is an arbitrary real function
unless a statement says otherwise, and approximation on compact sets is uniform approximation of
a function continuous on that set.

Four theorems are the headlines.

- *The theorem of Leshno, Lin, Pinkus and Schocken.* For a continuous activation `σ` and a
  nonzero real inner product space, the functions computed by one-hidden-layer networks are dense
  on compact sets if and only if `σ` is not a polynomial function. A polynomial activation of
  degree `d` produces only polynomials of degree at most `d`; every other continuous
  activation, ReLU included, is universal.
- *Hornik's theorem.* Every continuous, bounded, nonconstant activation is universal, on every
  real inner product space. Cybenko's continuous sigmoidal activations are the special case of
  functions tending to `0` at `−∞` and to `1` at `+∞`.
- *Maurey's lemma.* In a real inner product space, if `f` is a convex combination of points of
  norm at most `b`, then for every `k ≥ 1` the average of some `k` of these points, repetitions
  allowed, is within squared distance `(b² − ‖f‖²)/k` of `f`.
- *Barron's theorem.* Let `f` be a continuous integrable function on a finite-dimensional real
  inner product space with `∫ 2π ‖ξ‖ |𝓕f(ξ)| dξ = C` finite, where `𝓕` is the Fourier transform
  with the factor `2π` in the exponent. For every bounded measurable sigmoidal activation, every
  probability measure `μ` carried by the closed ball of radius `r` about the origin and every
  `m ≥ 1`, some network with `m` hidden units approximates `f` in `L²(μ)` with squared error at
  most `(2rC)²/m`.

The density theorems rest on the Stone–Weierstrass and Weierstrass approximation theorems and on
convolution with smooth bump functions, all in Mathlib; Barron's theorem rests on Mathlib's
Fourier inversion theorem and on `L²(μ)` as an inner product space. Tau Ceti's neuromanifold
library (the roadmap Neuromanifolds) has realization maps for multilayer
perceptrons and leaves approximation aside; the network of this roadmap agrees with its
two-layer case.

Layer 1 below defines networks and density on compact sets, and shows that polynomial
activations are not universal. Layer 2 proves that sums of ridge functions `h(⟪a, x⟫)` are dense
and reduces density for networks to the case of one variable. Layer 3 proves the univariate case
by smoothing and differentiation, and with Layer 2 the theorem of Leshno, Lin, Pinkus and
Schocken and Hornik's theorem. Layer 4 proves Maurey's lemma and Barron's theorem; it uses only
the network object of Layer 1.

## Conventions

- **Inputs.** `E` is a real inner product space with inner product `⟪x, y⟫`. Layers 1 to 3 and
  Maurey's lemma need nothing more; Barron's theorem (4.4, 4.5) assumes `E` finite-dimensional,
  with its Borel σ-algebra and Mathlib's volume, so that the Fourier transform is defined. On `ℝ`
  the inner product is `⟪w, t⟫ = w t`, so a network on `ℝ` computes `∑ᵢ cᵢ σ(wᵢ t + bᵢ) + c₀`.
  The trivial space `E = {0}` is allowed wherever no hypothesis excludes it; the statements that
  exclude it say so.
- **Activations.** An activation is any function `σ : ℝ → ℝ`. It is a *polynomial function* when
  `σ t = p(t)` for all real `t` and some real polynomial `p`. Agreeing with a polynomial on an
  interval, or on each of finitely many intervals, does not make `σ` a polynomial function: ReLU
  `t ↦ max 0 t` agrees with `0` on `(−∞, 0]` and with `t` on `[0, ∞)` and is not one. For a
  continuous `σ`, agreeing with a polynomial almost everywhere is the same as being one, so the
  "almost everywhere" of the discontinuous forms of the theorem does not arise here.
- **Networks.** A network with `m` hidden units has an output bias `c₀`, as in the depth-two
  multilayer perceptrons of Tau Ceti. Width `0` is allowed and gives the constant functions.
- **Density.** Uniform approximation on a compact set `K` is required for every function that is
  continuous on `K`, not only for restrictions of functions continuous on `E`; for compact `K` in a
  metric space the two agree by Tietze's extension theorem. The empty set is compact, and density
  on it holds trivially.
- **Fourier transform.** `𝓕 f ξ = ∫ exp(−2πi⟪x, ξ⟫) f(x) dx`, Mathlib's convention, applied to a
  real function through its complex values. Barron writes `f(x) = ∫ exp(i⟪ω, x⟫) f̃(ω) dω`; the
  substitution `ω = 2πξ` turns his `∫ |ω| |f̃(ω)| dω` into `barronNorm f` of 4.4, and for the ball
  of radius `r` his constant `∫ sup_{‖x‖ ≤ r} |⟪ω, x⟫| |f̃(ω)| dω` into `r · barronNorm f`.

## Layer 1: one-hidden-layer networks and density on compact sets

### 1.1 Networks

Define the structure `ShallowNet E m` of networks with `m` hidden units: inner weights
`weight i ∈ E`, hidden biases `bias i`, outer weights `coeff i` and an output bias `outBias`, for
`i : Fin m`. For an activation `σ`, `ShallowNet.eval σ N` is the function
`x ↦ ∑ᵢ coeff i · σ(⟪weight i, x⟫ + bias i) + outBias`. Define `shallowNetFunctions σ E`, the set
of functions `ShallowNet.eval σ N` over all widths `m` and all networks `N`.

- `shallowNetFunctions σ E` is the linear span of the constant functions and the units
  `x ↦ σ(⟪w, x⟫ + b)`, `w ∈ E`, `b ∈ ℝ`: a sum of two networks is a network whose width is the
  sum of the widths, and a scalar multiple of a network is a network of the same width.
- It is invariant under dilations and translations of `E`: if `g` is in it, so is
  `x ↦ g(λx + v)` for every real `λ` and `v ∈ E` (the unit `σ(⟪w, x⟫ + b)` becomes
  `σ(⟪λw, x⟫ + ⟪w, v⟫ + b)`); on `ℝ` this is `t ↦ g(λt + θ)`.

(Proved here.)

**Checks.**
- For `E` the Euclidean space `ℝⁿ`, `ShallowNet.eval σ N` is the single output of Tau Ceti's
  multilayer perceptron of depth `2` with widths `n`, `m`, `1` and hidden activation `σ`, whose
  first weight matrix has rows `weight i` and bias `bias`, and whose output layer has the single
  row `coeff` and bias `outBias`: its realization is `W₂ σ(W₁ x + b₁) + b₂` with the identity on
  the output layer.
- With `σ = 0`, or with width `0`, the network computes the constant `outBias`; so
  `shallowNetFunctions 0 E` is the set of constant functions.
- With `σ(t) = t` every network computes an affine function `x ↦ ⟪w, x⟫ + c`, and every affine
  function is computed by a network of width `1`.

*Needs:* Mathlib `Finset.sum`, `inner_add_left`. (Proved here.)

### 1.2 Density on compact sets

Define `DenseOnCompacts S`, for a set `S` of real functions on a topological space `X`: for every
compact `K ⊆ X`, every `f : X → ℝ` continuous on `K` and every `ε > 0` there is `g ∈ S` with
`|f(x) − g(x)| < ε` for all `x ∈ K`.

- If every function of `T` is approximable on compact sets by functions of `S`, and
  `DenseOnCompacts T`, then `DenseOnCompacts S` (approximate twice with `ε/2`).
- For a set `S` of continuous functions on a metric space, `DenseOnCompacts S` says that `S` is
  dense in `C(X, ℝ)` for the topology of uniform convergence on compact sets: a function
  continuous on a compact set extends to a continuous function on `X` by Tietze's theorem.

(Proved here.)

**Checks.**
- The empty compact set imposes nothing, and on a one-point space every set containing the
  constants is dense on compact sets.
- On `ℝ` the polynomials of degree at most `1` are not dense on compact sets: on `[0, 1]` the
  function `t ↦ t²` is at uniform distance `1/8` from all of them (the line `t − 1/8` attains it).
- The polynomial functions on `ℝ` are dense on compact sets, by Weierstrass' theorem.

*Needs:* Mathlib `IsCompact`, `ContinuousOn`, `ContinuousMap.exists_restrict_eq` (for the second
bullet). (Proved here.)

### 1.3 Polynomial activations are not universal

Let `E` be nonzero and let `σ` be a polynomial function of degree at most `d`. Then for every
unit vector `v`, every network `g` with activation `σ` is, along the line through `v`, a polynomial
`t ↦ g(tv)` of degree at most `d`, and `shallowNetFunctions σ E` is not dense on compact sets: on
the segment `{tv : 0 ≤ t ≤ 1}`, the function `x ↦ ⟪v, x⟫^(d+1)` stays at a positive uniform
distance from every network (Pinkus, p. 153, the paragraph after Theorem 3.1, for `ℝⁿ`).

Route: `σ(⟪w, tv⟫ + b)` is a polynomial in `t` of degree at most `d`, and so is every network
along the line. The polynomials of degree at most `d` on `[0, 1]` form a finite-dimensional,
hence closed, subspace of `C([0, 1], ℝ)` that does not contain `t^(d+1)`.

**Checks.**
- `d = 0`: networks are constant, and `t` stays at distance `1/2` from the constants on `[0, 1]`.
  `d = 1`: `t²` stays at distance `1/8` from the lines. In general the distance of `t^(d+1)` from
  the polynomials of degree at most `d` on `[0, 1]` is `2^(−2d−1)`.
- Nonzero `E` is needed: on `E = {0}` every function is constant, and the networks, which contain
  the constants through the output bias, are dense on compact sets whatever `σ`.
- With `σ(t) = t²` on `ℝ²` the networks are exactly the polynomials of degree at most `2`, a space
  of dimension `6`.

*Needs:* 1.1; Mathlib `Submodule.closed_of_finiteDimensional`, `Polynomial.degreeLT`. (Proved
here, following the cited paragraph.)

### Examples

Constant, affine and quadratic activations, whose networks are polynomials of bounded degree; the
agreement of `ShallowNet.eval` with Tau Ceti's depth-two perceptron.

### Dependencies

Mathlib `Finset.sum`, `inner_add_left`, `IsCompact`, `ContinuousOn`,
`ContinuousMap.exists_restrict_eq`, `Submodule.closed_of_finiteDimensional`,
`Polynomial.degreeLT`. No other layer.

## Layer 2: ridge functions and the reduction to one variable

### 2.1 Density of ridge functions

A ridge function on `E` is a function `x ↦ h(⟪a, x⟫)` with `a ∈ E` and `h : ℝ → ℝ` continuous.
Prove `denseOnCompacts_span_ridge`: the linear span of the ridge functions is dense on compact
sets of every real inner product space (Pinkus, Theorem 3.2, p. 155, for `ℝⁿ` and a set of
directions; this is its case where every direction is allowed, and Pinkus notes on p. 154 that the
exponentials `e^(⟪a, x⟫)` already form a dense set of ridge functions).

Route: the span of the exponentials `x ↦ exp⟪a, x⟫` consists of ridge functions, contains the
constants (`a = 0`), is closed under products (`exp⟪a, x⟫ · exp⟪b, x⟫ = exp⟪a + b, x⟫`) and
separates points (for `x ≠ y` take `a = x − y`). Its restriction to a compact `K` is a
point-separating subalgebra of `C(K, ℝ)`, and the Stone–Weierstrass theorem applies to `f`
restricted to `K`. No finite dimension is used.

**Checks.**
- On `ℝ` every continuous function is a ridge function (`a = 1`), so the statement is trivial
  there.
- On `ℝ²` the function `(x, y) ↦ xy` is not a ridge function (a ridge function is constant along
  the lines orthogonal to its direction, and `xy` is constant along no family of parallel lines),
  but it is the sum `((x + y)² − (x − y)²)/4` of two.

*Needs:* Mathlib `ContinuousMap.exists_mem_subalgebra_near_continuous_of_separatesPoints`,
`Real.exp_add`, `Submodule.span`. (Proved here.)

### 2.2 Reduction to one variable

Prove `denseOnCompacts_shallowNetFunctions_of_real`: for every activation `σ`, if
`shallowNetFunctions σ ℝ` is dense on compact sets of `ℝ`, then `shallowNetFunctions σ E` is dense
on compact sets of `E` (Pinkus, Proposition 3.3, pp. 155–156, for `ℝⁿ` and networks without
output bias).

Route: given `f` continuous on a compact `K` and `ε > 0`, 2.1 gives ridge functions with
`|f − ∑ᵢ hᵢ(⟪aᵢ, ·⟫)| < ε/2` on `K`. Each `⟪aᵢ, K⟫` lies in a compact interval, on which `hᵢ` is
within `ε/(2r)` of a univariate network `∑ⱼ cᵢⱼ σ(wᵢⱼ t + bᵢⱼ) + cᵢ₀`, with `r` the number of
ridge terms. Substituting `t = ⟪aᵢ, x⟫` gives the unit `σ(⟪wᵢⱼ aᵢ, x⟫ + bᵢⱼ)`, and the sum over
`i` is a network on `E` within `ε` of `f` on `K`.

**Checks.**
- On `E = ℝ` the statement is trivial; on `E = {0}` its conclusion holds for every `σ`.
- No regularity of `σ` enters: the statement holds for the discontinuous Heaviside function
  `1[t ≥ 0]`, whose univariate networks are the step functions with finitely many jumps.

*Needs:* 1.1, 1.2, 2.1; Mathlib `IsCompact.exists_bound_of_continuousOn`. (Proved here, following
the cited proof.)

### Examples

The product `xy` as a sum of two ridge functions; the reduction applied to a univariate
approximation of `t ↦ t²`.

### Dependencies

Layer 1 (1.1, 1.2). Mathlib
`ContinuousMap.exists_mem_subalgebra_near_continuous_of_separatesPoints`, `Real.exp_add`,
`Submodule.span`, `IsCompact.exists_bound_of_continuousOn`.

## Layer 3: the theorem of Leshno, Lin, Pinkus and Schocken

Throughout this layer `A(σ)` denotes the set of functions `h : ℝ → ℝ` that are approximable on
compact sets by univariate networks: for every compact `K ⊆ ℝ` and `ε > 0` some
`g ∈ shallowNetFunctions σ ℝ` has `|h − g| < ε` on `K`. It is a linear subspace and invariant
under `h ↦ (t ↦ h(λt + θ))`, because `shallowNetFunctions σ ℝ` is (1.1), and it is closed under
uniform convergence on compact sets (approximate twice with `ε/2`); these three facts are proved
with 3.1.

### 3.1 Smoothing stays in the closure

Let `σ` be continuous and `φ` continuous with compact support. Then the convolution
`(φ ⋆ σ)(t) = ∫ σ(t − y) φ(y) dy` and all its rescalings `t ↦ (φ ⋆ σ)(λt + θ)` lie in `A(σ)`
(Pinkus, proof of Proposition 3.7, p. 157).

Route: with `supp φ ⊆ [−α, α]` and `yᵢ = −α + 2αi/n`, the Riemann sums
`∑ᵢ σ(λt + θ − yᵢ) φ(yᵢ) (2α/n)` are networks of width `n`, and they converge to
`(φ ⋆ σ)(λt + θ)` uniformly for `t` in a compact set, because `σ` is uniformly continuous on
compact sets.

**Checks.**
- For `σ` = ReLU and `φ` the standard bump `exp(−1/(1 − y²))` on `(−1, 1)`, normalized to
  integral `1`, the Riemann sums with `n = 4, 16, 64, 256` differ from `φ ⋆ σ` on `[−2, 2]` by at
  most about `2·10⁻²`, `1.2·10⁻³`, `7·10⁻⁵`, `4·10⁻⁶`.
- Continuity of `σ` is used: for the indicator `1_ℚ` of the rationals and `φ ≥ 0` nonzero,
  `φ ⋆ 1_ℚ = 0`, while at rational `t` the Riemann sums with rational nodes tend to `∫ φ > 0`.

*Needs:* 1.1; Mathlib `MeasureTheory.convolution`, `IsCompact.uniformContinuousOn_of_continuous`.
(Proved here, following the cited proof.)

### 3.2 Monomials from derivatives

Let `ψ : ℝ → ℝ` be infinitely differentiable with `t ↦ ψ(λt + θ)` in `A(σ)` for all real `λ`,
`θ`. Then for every `k` and every `θ` the function `t ↦ t^k ψ^(k)(θ)` lies in `A(σ)` (Pinkus,
proof of Proposition 3.4, p. 156).

Route: by induction on `k`, `t ↦ t^k ψ^(k)(λt + θ)` lies in `A(σ)` for all `λ`, `θ`. The
difference quotients `((t^k ψ^(k)((λ + h)t + θ)) − t^k ψ^(k)(λt + θ))/h` lie in `A(σ)` and tend to
`t^(k+1) ψ^(k+1)(λt + θ)` uniformly for `t` in a compact set, by the mean value theorem with
`ψ^(k+2)` bounded on compact sets. Take `λ = 0`.

**Checks.**
- For `ψ = tanh`, `θ = 0.3` and `t ∈ [−3, 3]`, the quotients `(ψ(ht + θ) − ψ(θ))/h` differ from
  `t ψ'(θ)` by at most about `0.29`, `0.025`, `0.0024` for `h = 10⁻¹, 10⁻², 10⁻³`: linear in `h`.
- For `ψ = exp` all derivatives at `0` are `1`, so every monomial lies in `A(σ)` as soon as all
  `t ↦ exp(λt + θ)` do.

*Needs:* Mathlib `iteratedDeriv`, `ContDiff`, `exists_hasDerivAt_eq_slope`. (Proved here,
following the cited proof.)

### 3.3 Density in one variable

Let `σ` be continuous and not a polynomial function. Then `shallowNetFunctions σ ℝ` is dense on
compact sets of `ℝ` (Pinkus, Proposition 3.7, pp. 157–158).

Route: if every monomial lies in `A(σ)`, so does every polynomial, and Weierstrass' theorem on an
interval containing `K`, with Tietze's theorem to extend `f` from `K` to that interval, gives
density. Otherwise some `t^k` is not in `A(σ)`. For every normed bump function `φ` (Mathlib's
`ContDiffBump.normed`) the function `ψ = φ ⋆ σ` is infinitely differentiable, and by 3.1 all its
rescalings lie in `A(σ)`; by 3.2 so does `t ↦ t^k ψ^(k)(θ)`, which forces `ψ^(k)(θ) = 0` for all
`θ`, since `A(σ)` is a subspace without `t^k`. By Taylor's theorem `ψ` is a polynomial of degree
less than `k`. As the support radius of `φ` tends to `0`, `φ ⋆ σ` tends to `σ` uniformly on every
`[−R, R]`. Polynomials of degree less than `k` form a closed subspace of `C([−R, R], ℝ)`, so `σ`
agrees on `[−R, R]` with such a polynomial `p_R`; two of these agree on an interval and are equal,
so `σ` is a polynomial function, a contradiction.

**Checks.**
- ReLU, `tanh`, `exp`, `sin` and the logistic sigmoid are continuous and not polynomial functions,
  so each gives density in one variable.
- `σ(t) = |t|` agrees with a polynomial on each half-line and is not a polynomial function; its
  networks include `t ↦ |t − a|` for every `a`, and on a bounded interval `[−M, M]` these with
  the constants give every continuous piecewise linear function with finitely many breaks
  (`t = (|t + M| − |t − M|)/2` there).
- The hypothesis "not a polynomial function" is needed (1.3), and so is continuity: for
  `σ = 1_ℚ` a network takes one and the same value at every `t` for which no `wᵢ t + bᵢ` with
  `wᵢ ≠ 0` is rational, which is all but countably many `t`. That set meets every neighbourhood
  of `0` and of `1`, so no network is within `1/4` of `t ↦ t` on `[0, 1]`, although `1_ℚ` is not
  a polynomial function.

*Needs:* 3.1, 3.2; Mathlib `polynomialFunctions_closure_eq_top`, `ContinuousMap.exists_restrict_eq`,
`ContDiffBump.normed`, `ContDiffBump.contDiff_normed`, `ContDiffBump.hasCompactSupport_normed`,
`HasCompactSupport.contDiff_convolution_left`, `ContDiffBump.dist_normed_convolution_le`,
`taylor_mean_remainder_lagrange`, `Submodule.closed_of_finiteDimensional`, `Polynomial.degreeLT`,
`Polynomial.eq_of_infinite_eval_eq`. (Proved here, following the cited proof.)

### 3.4 The characterization

Prove `denseOnCompacts_shallowNetFunctions_iff`: let `E` be a nonzero real inner product space and
`σ` continuous. Then `shallowNetFunctions σ E` is dense on compact sets if and only if `σ` is not a
polynomial function (Pinkus, Theorem 3.1, p. 153, for `ℝⁿ` with `n ≥ 1` and networks without
output bias; Leshno, Lin, Pinkus and Schocken, 1993).

Route: "if" is 3.3 followed by 2.2; "only if" is 1.3.

**Checks.**
- `E = ℝ`, `σ = ReLU`: dense. `σ(t) = t³`: not dense, since networks are cubic polynomials.
- `E = {0}` is excluded: there every `σ`, polynomial or not, gives density (1.3).
- Continuity is in the hypothesis: for `σ = 1_ℚ` the right-hand side holds and the left-hand side
  fails (3.3).

*Needs:* 1.3, 2.2, 3.3. (Proved here.)

### 3.5 Bounded and sigmoidal activations

Prove `denseOnCompacts_shallowNetFunctions_of_bounded`: if `σ` is continuous, bounded and
nonconstant, then `shallowNetFunctions σ E` is dense on compact sets, for every real inner product
space `E` (Hornik, 1991, as reported by Pinkus, pp. 152–153). A continuous `σ` with limit `0` at
`−∞` and `1` at `+∞` is bounded and nonconstant, which gives Cybenko's theorem (Cybenko, 1989, as
reported by Pinkus, p. 152).

Route: a nonconstant polynomial `p` has `|p(t)| → ∞` as `t → ∞`, so a bounded nonconstant `σ` is
not a polynomial function, and 3.4 applies when `E` is nonzero. On `E = {0}` every function is the
constant output bias.

**Checks.**
- The logistic sigmoid `(1 + e^(−t))⁻¹` tends to `0` and `1`, so it gives density; `tanh` is
  bounded and nonconstant though its limits are `±1`.
- Each hypothesis is needed: constant `σ` gives only constants (1.3), `σ(t) = t` is unbounded and
  gives only affine functions, and the bounded nonconstant `1_ℚ` is not continuous and fails
  (3.3).

*Needs:* 3.4; Mathlib `Polynomial.abs_tendsto_atTop`, `Real.tendsto_sigmoid_atTop`,
`Real.tendsto_sigmoid_atBot` (for the Check). (Proved here.)

### Examples

ReLU, `tanh`, the logistic sigmoid and `exp` as universal activations; the polynomial `t³` and the
discontinuous `1_ℚ` as activations that are not.

### Dependencies

Layer 1 (1.1, 1.3), Layer 2 (2.2). Mathlib `MeasureTheory.convolution`,
`IsCompact.uniformContinuousOn_of_continuous`, `iteratedDeriv`, `ContDiff`,
`exists_hasDerivAt_eq_slope`, `polynomialFunctions_closure_eq_top`,
`ContinuousMap.exists_restrict_eq`, `ContDiffBump.normed`, `ContDiffBump.contDiff_normed`,
`ContDiffBump.hasCompactSupport_normed`, `HasCompactSupport.contDiff_convolution_left`,
`ContDiffBump.dist_normed_convolution_le`, `taylor_mean_remainder_lagrange`,
`Submodule.closed_of_finiteDimensional`, `Polynomial.degreeLT`,
`Polynomial.eq_of_infinite_eval_eq`, `Polynomial.abs_tendsto_atTop`.

## Layer 4: Maurey's lemma and Barron's theorem

### 4.1 Maurey's lemma

Prove `maurey_convexHull`: let `G` be a subset of a real inner product space all of whose points
have norm at most `b`, and `f` in the convex hull of `G`. For every `k ≥ 1` there are
`g₁, …, g_k ∈ G`, repetitions allowed, with `‖f − (1/k) ∑ᵢ gᵢ‖² ≤ (b² − ‖f‖²)/k` (Telgarsky,
Lemma 3.1, p. 20, for a random variable with values in `G`; attributed there to Maurey through
Pisier).

Route: write `f = ∑ⱼ pⱼ hⱼ` as a finite convex combination of points of `G`, and draw
`V₁, …, V_k` independently with `P(Vᵢ = hⱼ) = pⱼ`. Expanding the square,
`E‖f − (1/k)∑ᵢ Vᵢ‖² = (∑ⱼ pⱼ ‖hⱼ‖² − ‖f‖²)/k ≤ (b² − ‖f‖²)/k`, and some outcome is at most the
mean. The expectation is a finite sum over `k`-tuples of indices, so no measure theory is needed.

**Checks.**
- On 300 random finite sets in `ℝ`, `ℝ²`, `ℝ³` with up to four points and `k ≤ 4`, the identity
  for the mean holds to `10⁻⁹` and the best `k`-term average meets the bound.
- The bound is attained: for `G = {g, −g}` with `‖g‖ = b`, `f = 0` and `k = 1`, every choice has
  squared distance `b² = (b² − ‖f‖²)/1`.
- `k ≥ 1` is needed for the division; for `G` empty the convex hull is empty and nothing is
  asserted.

*Needs:* Mathlib `convexHull_eq`, `inner_add_left`, `Finset.sum`. (Proved here, following the
cited proof.)

### 4.2 Maurey's lemma for the closed convex hull

Prove `maurey_closure_convexHull`: under the same bound on `G`, if `f` lies in the closure of the
convex hull of `G`, then for every `k ≥ 1` and every `c > b² − ‖f‖²` there are `g₁, …, g_k ∈ G`
with `‖f − (1/k) ∑ᵢ gᵢ‖² ≤ c/k` (Barron, 1993, attributed in prose; Pinkus, p. 179, reports
the result of Barron and Maurey that Makovoz's Theorem 6.12 generalizes).

Route: choose `h` in the convex hull with `‖f − h‖` small, apply 4.1 to `h`, and use
`‖f − avg‖ ≤ ‖f − h‖ + ‖h − avg‖`; as `h → f` the bound `(‖f − h‖ + ((b² − ‖h‖²)/k)^(1/2))²`
tends to `(b² − ‖f‖²)/k < c/k`.

**Checks.**
- The inequality `c > b² − ‖f‖²` cannot be relaxed to `≥`: in `ℝ²` let `G` consist of the points
  `(1 − 1/n, ±1)`, `n ≥ 1`, of norm less than `b = √2`. Their midpoints `(1 − 1/n, 0)` tend to
  `f = (1, 0)`, and `b² − ‖f‖² = 1`, but every `g ∈ G` has `‖f − g‖² = 1 + 1/n² > 1`.
- When `f ≠ 0` one may take `c = b²`, which gives `‖f − avg‖² ≤ b²/k`.

*Needs:* 4.1; Mathlib `closure`, `Metric.mem_closure_iff`. (Proved here.)

### 4.3 Sigmoidal activations and steps

Define `IsSigmoidal σ`: `σ` is measurable and bounded, `σ(t) → 0` as `t → −∞` and `σ(t) → 1` as
`t → +∞` (Pinkus, p. 150, for the limits; p. 179 for Barron's bounded measurable sigmoidal
functions). Prove: for `σ` sigmoidal, `w ∈ E`, `b ∈ ℝ` and a finite measure `μ` on `E`, the
units `x ↦ σ(λ(⟪w, x⟫ + b) + λ^(1/2))` converge, as `λ → ∞`, to the step
`x ↦ 1[⟪w, x⟫ + b ≥ 0]` at every point and in `L²(μ)`. (Proved here; Barron proves the
corresponding approximation, attributed in prose.)

Route: with `s = ⟪w, x⟫ + b`, the argument `λs + λ^(1/2)` tends to `+∞` if `s ≥ 0` (including
`s = 0`, which is why the term `λ^(1/2)` is there) and to `−∞` if `s < 0`. Since `σ` is bounded and
`μ` finite, dominated convergence gives convergence in `L²(μ)`.

**Checks.**
- The Heaviside function `1[t ≥ 0]` and the logistic sigmoid are sigmoidal; `tanh` is not (its
  limit at `−∞` is `−1`) but `(1 + tanh)/2` is; ReLU is not (unbounded).
- Without the shift `λ^(1/2)` the units `σ(λs)` tend to `σ(0)` on the hyperplane `s = 0`, which is
  `1/2` for the logistic sigmoid; a measure with an atom on that hyperplane then sees a different
  limit from the step.

*Needs:* Mathlib `MeasureTheory.tendsto_lintegral_of_dominated_convergence`,
`MeasureTheory.MemLp.of_bound`. (Proved here.)

### 4.4 The Barron norm and the step representation

Define `barronNorm f`, for `f : E → ℝ` on a finite-dimensional `E`, as
`∫ 2π ‖ξ‖ ‖𝓕 f ξ‖ dξ` (Telgarsky, Definition 3.1, p. 17, where it is written
`∫ ‖(∇f)^(ξ)‖ dξ`). Let `f` be continuous and integrable with `ξ ↦ ‖ξ‖ ‖𝓕 f ξ‖` integrable, and
`C = barronNorm f`. Prove:

- `𝓕 f` is integrable, so the Fourier inversion formula `f(x) = ∫ exp(2πi⟪ξ, x⟫) 𝓕 f ξ dξ` holds
  at every `x`: `𝓕 f` is bounded by `∫ |f|`, hence integrable on the unit ball, and outside it
  `‖𝓕 f ξ‖ ≤ ‖ξ‖ ‖𝓕 f ξ‖`.
- `|f(x) − f(0)| ≤ ‖x‖ · C` for every `x`, since `|exp(2πi⟪ξ, x⟫) − 1| ≤ 2π ‖ξ‖ ‖x‖`.
- For every `r ≥ 0` and every probability measure `μ` on `E` carried by the closed ball of radius
  `r` about `0`, the class of `x ↦ f(x) − f(0)` in `L²(μ)` lies in the closure of the convex hull of
  the classes of `x ↦ ±2rC · 1[⟪u, x⟫ + t ≥ 0]`, `u ∈ E`, `t ∈ ℝ` (Telgarsky, Theorem 3.1, p. 18,
  for `r = 1`, where the measure on the steps has mass at most `2C`; Barron, 1993, attributed in
  prose).

Route for the third bullet: write `𝓕 f ξ = |𝓕 f ξ| exp(2πiθ(ξ))`. For `‖x‖ ≤ r` and `ξ ≠ 0`, put
`u = ξ/‖ξ‖` and `z = ⟪u, x⟫ ∈ [−r, r]`. The real part of `(exp(2πi⟪ξ, x⟫) − 1) 𝓕 f ξ` is
`|𝓕 f ξ| (cos(2π‖ξ‖z + 2πθ) − cos(2πθ))`, a function of `z` vanishing at `0` whose derivative is
bounded by `2π‖ξ‖ |𝓕 f ξ|`; it is the integral over `t ∈ [0, r]` of its derivative at `t` against
`1[z − t ≥ 0]`, minus the integral over `t ∈ [−r, 0]` against `1[t − z ≥ 0]`. Integrating over `ξ`
writes `f − f(0)` on the ball as an integral of steps against a signed measure of mass at most
`2r · C`, and such an integral lies in the closed convex hull of the steps multiplied by `±2rC`.

**Checks.**
- For the Gaussian `f(x) = exp(−πx²)` on `ℝ`, `𝓕 f = f` and
  `barronNorm f = 2π ∫ |ξ| e^(−πξ²) dξ = 2`. Barron's `∫ |ω| |f̃(ω)| dω`, with
  `f̃(ω) = 𝓕 f(ω/2π)/(2π)`, is also `2`. Dropping the factor `2π` would give `1/π`.
- The second bullet with `C = 2` reads `1 − e^(−πr²) ≤ 2r`, true for all `r ≥ 0`; the wrong
  normalization `C = 1/π` would claim `1 − e^(−π/4) ≈ 0.544 ≤ 0.159` at `r = 1/2`, which is false.
- The total variation of `z ↦ cos(2πξz + φ) − cos φ` on `[−r, r]` is
  `2π|ξ| ∫ |sin(2πξz + φ)| dz ≤ 4π|ξ|r`, and the ratio of the two tends to `|sin φ|` as
  `r → 0`, so the bound is attained in the limit when `sin φ = ±1`.
- On `E = {0}`, `barronNorm f = 0` and `f − f(0) = 0`.

*Needs:* Mathlib `Real.fourier_eq'`, `Real.fourierInv_eq'`, `Real.norm_fourier_le_integral_norm`,
`Continuous.fourierInv_fourier_eq`, `MeasureTheory.L2.innerProductSpace`,
`MeasureTheory.MemLp.of_bound`. (Proved here, following the cited derivation.)

### 4.5 Barron's theorem

Prove `exists_shallowNet_lintegral_sq_le`: let `E` be finite-dimensional, `f : E → ℝ` continuous
and integrable with `ξ ↦ ‖ξ‖ ‖𝓕 f ξ‖` integrable, `σ` sigmoidal, `μ` a probability measure with
`μ` of the complement of the closed ball of radius `r` about `0` equal to `0`, and `m ≥ 1`. Then
some `N : ShallowNet E m` satisfies

    ∫⁻ x, ENNReal.ofReal ((f x − N.eval σ x)²) ∂μ ≤ ENNReal.ofReal ((2 r barronNorm f)² / m)

(Barron, 1993, attributed in prose; Telgarsky, Example 3.1, item 2, p. 22, for `r = 1`
and threshold units; Pinkus, pp. 179–181, discusses the result and its dependence on the
dimension through the constant).

Route: put `b = 2r · barronNorm f` and `F = f − f(0)` in `L²(μ)`. If `F = 0` in `L²(μ)`, the network
with all outer weights `0` and output bias `f(0)` has error `0`. Otherwise 4.4 places `F` in the
closed convex hull of `±b` times steps, each of norm at most `b` in `L²(μ)`, and 4.2 with
`c = b² − ‖F‖²/2` gives `m` signed steps whose average is within `c/m < b²/m` of `F`. That average
plus `f(0)` is a network with `m` Heaviside units and output bias `f(0)`. By 4.3 each step is the
`L²(μ)` limit of single `σ`-units, so replacing the steps by units close enough keeps the squared
error below `b²/m`.

**Checks.**
- For the Gaussian on `ℝ`, `μ` uniform on `[−1, 1]` and Heaviside `σ`, the bound is `16/m`; the best
  squared errors for `m = 1, 2, 3` are about `0.080`, `0.021`, `0.015`.
- `m ≥ 1` is needed: with `m = 0` the right side is `0` (division by `0` gives `0`), while a
  network of width `0` is a constant, so the bound would fail for every `f` that is not
  `μ`-almost everywhere constant.
- Continuity of `f` is needed: on `ℝ`, the indicator of `{0}` is integrable with `𝓕 f = 0`, so its
  Barron norm is `0`; for `r = 1`, `μ` uniform on `{−1, 0, 1}` and Heaviside `σ`, every network
  with one unit is monotone, and its squared error against the values `0, 1, 0` is at least
  `1/6`, while the bound is `0`.
- `r` enters only through the constant: for `r < 0` the ball is empty, no probability measure is
  carried by it, and nothing is asserted.

*Needs:* 1.1, 4.2, 4.3, 4.4; Mathlib `MeasureTheory.L2.innerProductSpace`. (Proved here, following
the cited sources.)

### Examples

The Gaussian on `ℝ` with Barron norm `2` and its approximation by step networks of widths one to
three; Maurey's lemma for two opposite points.

### Dependencies

Layer 1 (1.1). Mathlib `convexHull_eq`, `inner_add_left`, `Finset.sum`, `closure`,
`Metric.mem_closure_iff`, `MeasureTheory.tendsto_lintegral_of_dominated_convergence`,
`MeasureTheory.MemLp.of_bound`, `Real.fourier_eq'`, `Real.fourierInv_eq'`,
`Real.norm_fourier_le_integral_norm`, `Continuous.fourierInv_fourier_eq`,
`MeasureTheory.L2.innerProductSpace`.

## Downstream consumers

- A roadmap on the expressivity of deep ReLU networks can copy `ShallowNet` and
  `ShallowNet.eval` for the one-hidden-layer case of its networks.
- Approximation-theoretic parts of statistical learning theory (estimation error of network
  classes combined with approximation error) consume 3.4 and 4.5.

## Scope and ownership

This roadmap owns the one-hidden-layer network object `ShallowNet` with its realization, density
on compact sets, the failure of density for polynomial activations, the density of ridge
functions and the reduction to one variable, the theorem of Leshno, Lin, Pinkus and Schocken for
continuous activations, Hornik's and Cybenko's theorems as its corollaries, Maurey's lemma in both
forms, the Barron norm, and Barron's `L²` rate for sigmoidal activations.

Already in the libraries and therefore not targets:

- The Stone–Weierstrass and Weierstrass theorems, Tietze's extension theorem, convolution with
  normed bump functions and its convergence, Taylor's theorem, the Fourier transform with its
  inversion theorem, and `L²(μ)` as an inner product space, all in Mathlib.
- The realization maps of multilayer perceptrons, coordinatewise activations (including ReLU and
  `tanh`) and dense layers, in Tau Ceti's neuromanifold library, the formalization of the roadmap
  Neuromanifolds, which places approximation outside its scope. This roadmap defines its own
  network on an inner product space, because density statements range over all widths at once
  and Barron's theorem needs the Euclidean geometry of the input; the Check of 1.1 records the
  agreement with the depth-two perceptron.

Boundaries with other roadmaps:

- RobustnessCertificates (an open roadmap, not on main) defines a vector-valued one-hidden-layer
  network on `Fin n → ℝ` for Lipschitz and bound-propagation certificates. It states nothing about
  density or approximation rates, and this roadmap does not depend on it.
- PolynomialInterpolationAndBestApproximation (an open roadmap, not on main) treats quantitative
  polynomial approximation of univariate functions (Jackson's theorem, Bernstein polynomials); this
  roadmap uses only the qualitative Weierstrass theorem from Mathlib and does not depend on it.
- StatisticalLearningTheory (an open roadmap of another author, not on main) lists approximation
  rates of networks among the subjects beyond its scope; this roadmap does not depend on it.
- BanachSpaceTheory (on main) has Maurey's finite blocking lemma, a different statement about
  block bases in Banach spaces.

Outside the scope: discontinuous activations (the forms of the theorem for locally bounded
activations that are not almost everywhere polynomials), restricted sets of weights and
thresholds, simultaneous approximation of derivatives, interpolation, lower bounds on the order of
approximation, networks with two or more hidden layers and every statement about depth (exact
representation of piecewise linear functions by ReLU networks, counts of linear pieces, depth
separation), and the Kolmogorov superposition theorem. No statement here is specific to the ReLU
activation.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean`:
  `ContinuousMap.exists_mem_subalgebra_near_continuous_of_separatesPoints` (on a compact space, a
  point-separating subalgebra of `C(X, ℝ)` approximates every continuous function uniformly).
  `Mathlib/Topology/ContinuousMap/Weierstrass.lean`: `polynomialFunctions_closure_eq_top`
  (polynomials are dense in `C([a, b], ℝ)`). `Mathlib/Topology/TietzeExtension.lean`:
  `ContinuousMap.exists_restrict_eq` (a continuous function on a closed subset of a normal space
  extends).
- `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean`: `ContDiffBump.normed`,
  `ContDiffBump.contDiff_normed`, `ContDiffBump.hasCompactSupport_normed` (the normed bump
  function is smooth with compact support).
  `Mathlib/Analysis/Calculus/BumpFunction/Convolution.lean`:
  `ContDiffBump.dist_normed_convolution_le` (convolution with a normed bump of radius `ρ` moves a
  function by at most its oscillation on balls of radius `ρ`). `Mathlib/Analysis/Convolution.lean`:
  `MeasureTheory.convolution`. `Mathlib/Analysis/Calculus/ContDiff/Convolution.lean`:
  `HasCompactSupport.contDiff_convolution_left` (a smooth compactly supported function convolved
  with a locally integrable one is smooth).
- `Mathlib/Analysis/Calculus/Taylor.lean`: `taylor_mean_remainder_lagrange`.
  `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `exists_hasDerivAt_eq_slope`.
  `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`: `iteratedDeriv`.
  `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`: `ContDiff`.
- `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`: `Submodule.closed_of_finiteDimensional`
  (finite-dimensional subspaces are closed). `Mathlib/RingTheory/Polynomial/Basic.lean`:
  `Polynomial.degreeLT`. `Mathlib/Algebra/Polynomial/Roots.lean`:
  `Polynomial.eq_of_infinite_eval_eq` (polynomials agreeing at infinitely many points are equal).
  `Mathlib/Analysis/Polynomial/Basic.lean`: `Polynomial.abs_tendsto_atTop` (a polynomial of
  positive degree tends to infinity in absolute value).
- `Mathlib/Topology/UniformSpace/HeineCantor.lean`:
  `IsCompact.uniformContinuousOn_of_continuous`. `Mathlib/Analysis/Normed/Group/Bounded.lean`:
  `IsCompact.exists_bound_of_continuousOn`. `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean`:
  `Metric.mem_closure_iff`.
- `Mathlib/Analysis/Convex/Combination.lean`: `convexHull_eq` (the convex hull is the set of
  finite convex combinations). `Mathlib/Analysis/InnerProductSpace/Basic.lean`:
  `inner_add_left`. `Mathlib/Analysis/Complex/Exponential.lean`: `Real.exp_add`.
- `Mathlib/Analysis/Fourier/FourierTransform.lean`: `Real.fourier_eq'` and `Real.fourierInv_eq'`
  (the transform and its inverse with `exp(∓2πi⟪x, ξ⟫)`), `Real.norm_fourier_le_integral_norm`
  (`‖𝓕 f ξ‖ ≤ ∫ ‖f‖`). `Mathlib/Analysis/Fourier/Inversion.lean`:
  `Continuous.fourierInv_fourier_eq` (for continuous integrable `f` with integrable `𝓕 f`,
  `𝓕⁻ (𝓕 f) = f`).
- `Mathlib/MeasureTheory/Function/L2Space.lean`: `MeasureTheory.L2.innerProductSpace`.
  `Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean`: `MeasureTheory.MemLp.of_bound` (a
  bounded measurable function is in every `Lᵖ` of a finite measure).
  `Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean`:
  `MeasureTheory.tendsto_lintegral_of_dominated_convergence`.
- `Mathlib/Analysis/SpecialFunctions/Sigmoid.lean`: `Real.sigmoid`, `Real.tendsto_sigmoid_atTop`,
  `Real.tendsto_sigmoid_atBot`, used in Checks.

### From Tau Ceti

- `TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`: `TauCeti.Neuromanifold.MLPSpec` and
  `TauCeti.Neuromanifold.MLPSpec.realize`, with `MLPSpec.realize_succ` (the output layer is affine),
  named in the Check of 1.1 only. `TauCeti/Geometry/Neuromanifold/Activation.lean`:
  `TauCeti.Neuromanifold.reluActivation`, the coordinatewise ReLU, whose scalar function is the
  ReLU of the Checks.

## References

- Allan Pinkus, *Approximation theory of the MLP model in neural networks*, Acta Numerica 8
  (1999), 143–195; author's copy at pinkus.net.technion.ac.il. The theorem, proposition and page
  numbers above are those of that copy, which carries the journal's pagination.
- Matus Telgarsky, *Deep learning theory lecture notes*, version 2021-10-27 (v0.0-e7150f2d),
  mjt.cs.illinois.edu/dlt; the definition, theorem, lemma, example and page numbers above are
  those of that version.
- Attributions made in prose without a locator: Moshe Leshno, Vladimir Ya. Lin, Allan Pinkus and
  Shimon Schocken (Neural Networks 6, 1993) for the characterization; George Cybenko (1989) and
  Kurt Hornik (1991) for the sigmoidal and the bounded nonconstant cases; Andrew R. Barron
  (IEEE Transactions on Information Theory 39, 1993) for the closed-convex-hull form of Maurey's
  lemma, the step representation and the `L²` rate; Bernard Maurey, through Gilles Pisier
  (Séminaire d'analyse fonctionnelle, 1980–1981), and Lee K. Jones (1992) for the sampling lemma;
  V. E. Vostrecov and M. A. Kreines (1961) for the density of ridge functions.
