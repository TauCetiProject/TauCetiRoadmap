# Roadmap: the Ornstein–Uhlenbeck semigroup

**Summary.** The Ornstein–Uhlenbeck semigroup is the family of averaging operators that moves a
point of `ℝ^d` towards the origin and blurs it with Gaussian noise so as to keep the standard
Gaussian law `γ` fixed: at time `t ≥ 0` a function `f` is replaced by `P_t f`, whose value at `x`
is the mean of `f` under the Gaussian law with mean `e^(−t) x` and covariance
`(1 − e^(−2t)) I`. It is the Markov semigroup of the Ornstein–Uhlenbeck process, which is also
the noising process of variance-preserving diffusion models. This roadmap builds the semigroup from Gaussian noising kernels, computes
its kernel, its generator `L f = Δf − ⟨x, ∇f⟩` and its eigenfunctions, and proves the three
quantitative statements that make it useful: decay of variance, decay of relative entropy and
Nelson's hypercontractivity. The space is a Euclidean space of finite dimension `d`; `d = 0` is
allowed except where a statement says otherwise.

The headline theorems are these.

- *Mehler's formula and reversibility.* For `t > 0` the law of `P_t` started at `x` has density
  with respect to `γ` equal to Mehler's kernel, an explicit Gaussian expression that is symmetric
  in `x` and `y` and is the sum of `e^(−|α| t) H_α(x) H_α(y) / α!` over all multi-indices `α`,
  where `H_α` are products of Hermite polynomials. For `t ≥ 0` the kernel is reversible for `γ`,
  so `γ` is invariant.
- *The generator and its eigenfunctions.* For a twice continuously differentiable `f` whose second
  derivative grows at most polynomially and for `t ≥ 0`, `t ↦ P_t f(x)` has derivative
  `P_t (L f)(x)` (from the right at `t = 0`), and `L P_t f = P_t L f`.
  The Hermite products satisfy `P_t H_α = e^(−|α| t) H_α` and `L H_α = −|α| H_α`.
- *Decay of variance and of entropy.* For `t ≥ 0`, `Var_γ(P_t f) ≤ e^(−2t) Var_γ(f)` for every
  `f` square integrable under `γ`, and for every probability law `μ` the Kullback–Leibler
  divergence from `γ` of the law of the process at time `t` started from `μ` is at most
  `e^(−2t)` times that of `μ`. Equality holds for linear functions and for shifted Gaussian laws.
- *Nelson's hypercontractivity.* If `t ≥ 0`, `p ≥ 1` and `q − 1 ≤ e^(2t)(p − 1)`, then
  `‖P_t f‖_q ≤ ‖f‖_p` in the norms of `L^p(γ)`. When `d ≥ 1` the condition cannot be relaxed:
  if `q − 1 > e^(2t)(p − 1)`, no constant bounds `‖P_t f‖_q` by `‖f‖_p`.

The kernels are the noising kernels of DenoisingDiffusion, whose composition law gives the
semigroup property. RandomMatrices supplies the Gaussian logarithmic Sobolev inequality, from
which the decay of entropy and hypercontractivity are proved, and Gaussian integration by parts,
which gives the generator and its Dirichlet form. Tau Ceti's Hermite basis of `L²` of the product
Gaussian gives the spectral route to the decay of variance. OptimalTransport constructs the
Fokker–Planck semigroup for a potential whose Hessian is bounded below, of which this is the
quadratic case; here the semigroup is the explicit one.

Below, Layer 1 builds the kernels, Mehler's formula and reversibility; Layer 2 the generator,
its Dirichlet form and eigenfunctions; Layer 3 the decay estimates and Nelson's theorem with its
sharpness.

## Conventions

- **Space and Gaussian.** `d : ℕ`, `E = EuclideanSpace ℝ (Fin d)` with its Borel σ-algebra, and
  `γ = stdGaussian E`, Mathlib's standard Gaussian. For `d = 0`, `E` is a point and `γ` the unit
  point mass. Coordinates of `x : E` are written `x i`; `⟪x, y⟫` is the inner product.
- **Kernels.** `noiseKernel a`, copied verbatim from DenoisingDiffusion 2.1, sends `x` to the law
  of `√a • x + √(1 − a) • Z` with `Z ~ γ`. The Ornstein–Uhlenbeck kernel is
  `ouKernel t = noiseKernel (exp (−2t))`, so for `t ≥ 0` it sends `x` to
  `N(e^(−t) x, (1 − e^(−2t)) I)`. For `t < 0` the signal level exceeds `1`, Mathlib's `Real.sqrt`
  of the negative number `1 − e^(−2t)` is `0`, and `ouKernel t x` is the point mass at
  `e^(−t) • x`; statements that fail for this extension assume `0 ≤ t`, and each says so.
- **The semigroup on functions.** For `f : E → ℝ`, `ouSemigroup t f x = ∫ y, f y ∂(ouKernel t x)`
  is the Bochner integral, which is `0` where `f` is not integrable against `ouKernel t x`. The
  law at time `t` of the process started from a law `μ` is `μ.bind (ouKernel t)`.
- **Derivatives.** `∇ f` is Mathlib's `gradient`, `Δ f` Mathlib's Laplacian (the trace of the
  second derivative), and the generator is `ouGenerator f x = Δ f x − ⟪x, ∇ f x⟫`. Some sources
  write the Ornstein–Uhlenbeck operator with the opposite sign, as `⟨x, ∇f⟩ − Δf`; the sign here
  makes `L` negative semidefinite.
- **Growth classes.** "The `k`-th derivative grows at most polynomially" means
  `‖iteratedFDeriv ℝ k f x‖ ≤ C (1 + ‖x‖)^m` for all `x`, for some constants `C` and `m`; for
  `k = 1` the statements use `fderiv`. Such a bound on the top derivative bounds the lower ones and
  `f` itself polynomially, by Taylor's formula, so every integral below is finite.
- **Hermite polynomials.** `Heₙ` is Mathlib's `Polynomial.hermite n`, the probabilists' Hermite
  polynomial (`He₂ = X² − 1`), evaluated with `Polynomial.aeval`. For a multi-index
  `α : Fin d → ℕ`, `|α| = ∑ i, α i`, `α! = ∏ i, (α i)!` and `H_α x = ∏ i, Heₐᵢ(x i)`.
- **Norms, variance and divergence.** `‖f‖_p` is `eLpNorm f (ENNReal.ofReal p) γ`, valued in
  `ℝ≥0∞` and infinite when `f ∉ L^p(γ)`. `Var_γ` is Mathlib's `variance`, which is `0` for a
  function that is not square integrable. Divergences are Mathlib's `klDiv`, valued in `ℝ≥0∞`.

## Layer 1: the kernels, Mehler's formula and reversibility

### 1.1 The kernels and the semigroup on functions

Define `noiseKernel` (copied verbatim from DenoisingDiffusion 2.1), `ouKernel` and
`ouSemigroup` as in the Conventions. Facts, with `s, t ≥ 0`:

- `ouKernel s ∘ₖ ouKernel t = ouKernel (s + t)`: this is DenoisingDiffusion 2.1's composition law
  `noiseKernel b ∘ₖ noiseKernel a = noiseKernel (a * b)` with `a = e^(−2t)`, `b = e^(−2s)`. The
  kernels are Markov (DenoisingDiffusion 2.1) and `ouKernel 0 = Kernel.id`.
- The Mehler form: `ouSemigroup t f x = ∫ z, f (e^(−t) • x + √(1 − e^(−2t)) • z) ∂γ` whenever `f`
  is a.e. strongly measurable for `ouKernel t x`, from the definition and Mathlib's `integral_map`
  (van Handel, Lemma 2.22, p. 28, for `d = 1`, and Example 8.13, p. 265; O'Donnell, Remark 11.14,
  p. 331).
- `P_t` fixes constants, preserves the order of functions integrable against the kernel, and is a
  contraction of `L^p(γ)` for `1 ≤ p < ∞`, by Jensen's inequality and the invariance of 1.3
  (O'Donnell, Proposition 11.15, p. 331).

**Checks.**
- A linear function `f x = ⟪v, x⟫` has `P_t f x = e^(−t) ⟪v, x⟫`, and `f x = (x 0)²` (for `d ≥ 1`)
  has `P_t f x = e^(−2t) (x 0)² + 1 − e^(−2t)`, whose mean under `γ` is `1` at every time.
- A plausible wrong kernel, `N(e^(−t) x, (1 − e^(−t)) I)`, does not keep `γ`: started from `γ` its
  first coordinate has variance `e^(−2t) + 1 − e^(−t)`, which is `0.7675` at `t = 1`.
- For `t = −½ log 2` the extension of the Conventions gives `P_t f x = f (√2 x)`.

*Needs:* DenoisingDiffusion 2.1 (`noiseKernel`, its composition law and its Markov property);
Mathlib `stdGaussian`, `Kernel.map`, `Kernel.prod`, `Kernel.const`, `integral_map`. (Proved here.)

### 1.2 Mehler's kernel and Mehler's formula

Define Mehler's kernel `mehlerKernel`: with `ρ = e^(−t)`,

    (1 − ρ²)^(−d/2) · exp (−(ρ² ‖x‖² − 2 ρ ⟪x, y⟫ + ρ² ‖y‖²) / (2 (1 − ρ²))),

and the Hermite products `hermiteProd`, with
`hermiteProd α x = ∏ i, aeval (x i) (hermite (α i))`. For `t > 0`:

- `ouKernel_eq_withDensity`: `ouKernel t x = γ.withDensity (fun y ↦ ofReal (mehlerKernel t x y))`;
- `hasSum_mehlerKernel`: Mehler's formula, the sum over `α : Fin d → ℕ` of
  `e^(−|α| t) H_α(x) H_α(y) / α!` is `mehlerKernel t x y` (an unconditional, absolutely
  convergent sum; Mehler, 1866).

Route: by DenoisingDiffusion 2.1, `ouKernel t x = N(ρ x, (1 − ρ²) I)`; both it and `γ` have
densities with respect to Lebesgue measure (Tau Ceti's `multivariateGaussian_eq_withDensity`
and `stdGaussian_eq_withDensity`), and their quotient is the kernel above after completing the
square. For the series, the case `d = 1` is DLMF 18.18.28 (stated there for the physicists'
polynomials `Hₙ`) after the substitution `Heₙ(x) = 2^(−n/2) Hₙ(x/√2)`; the kernel and the
summand both factor over coordinates, since `‖x‖²`, `⟪x, y⟫` and `‖y‖²` are sums of coordinate
terms, and the product of `d` absolutely convergent series is the sum over multi-indices.
Absolute convergence for `0 < ρ < 1`: by the Cauchy–Schwarz inequality the sum of
`ρⁿ |Heₙ(x) Heₙ(y)| / n!` is at most the geometric mean of the sums of `ρⁿ Heₙ(x)² / n!` and
`ρⁿ Heₙ(y)² / n!`, which have nonnegative terms and converge by the same formula at `y = x`.

**Checks.**
- `d = 1`, `ρ = 2/5` (`t = log (5/2)`), `(x, y) = (0.3, −0.7)`: the kernel is `0.9342031102`,
  the value of the Gaussian case of the Poisson kernel computed in
  SpecialFunctionsOrthogonalPolynomialsGeneral 8.2.
- `d = 2`, `x = (0.3, −0.7)`, `y = (1.1, 0.25)`: at `t = 1` the kernel is `1.0686382199`, and the
  multi-index sum truncated at `|α| ≤ 159` agrees to ten digits, at `t = 0.2` as well
  (`0.6779163502`).
- `d = 0`: the kernel and the single term of the sum are `1`, and `ouKernel t x` is the point
  mass, as is `γ`.
- `t = 0` is excluded: `ouKernel 0 x` is the point mass at `x`, which for `d ≥ 1` has no density
  with respect to `γ`.

*Needs:* 1.1; DenoisingDiffusion 2.1 (`DenoisingDiffusion.noiseKernel_apply`); Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.stdGaussian_eq_withDensity`; Mathlib `Polynomial.hermite`,
`Measure.withDensity`, `HasSum`. (Density: proved here. Series: DLMF 18.18.28 for `d = 1`, the
product over coordinates proved here.)

### 1.3 Reversibility and invariance

Prove `isReversible_ouKernel`: for `t ≥ 0`, `(ouKernel t).IsReversible γ`, that is
`∫⁻ x in A, ouKernel t x B ∂γ = ∫⁻ x in B, ouKernel t x A ∂γ` for measurable `A`, `B` (van Handel,
Lemma 2.22, p. 28, for `d = 1`; Example 8.13, p. 265). Consequences:

- `γ` is invariant, `γ.bind (ouKernel t) = γ`, by Mathlib's `Kernel.IsReversible.invariant`, the
  kernel being Markov by `Kernel.IsMarkovKernel.map`;
- `P_t` is symmetric on `L²(γ)`: `∫ f · P_t g dγ = ∫ g · P_t f dγ` for `f, g ∈ L²(γ)`;
- if `μ = h · γ` with `h ≥ 0` integrable, then `μ.bind (ouKernel t) = (P_t h) · γ`.

Route: for `t > 0` the density of 1.2 is symmetric in `x` and `y`, so both sides equal
`∫∫ 1_A(x) 1_B(y) mehlerKernel t x y dγ(x) dγ(y)` by Tonelli's theorem; for `t = 0` the kernel is
the identity.

**Checks.**
- `d = 1`, `t = 0.3`, `f y = e^(−y²)(1 + y)`, `g y = sin 2y + y²`: both sides of the symmetry
  identity are `0.4463293644`.
- The extension to `t < 0` is not reversible: for `d = 1`, `e^(−t) = 2`, `A = [0, 1]`,
  `B = [0, 2]`, the two sides are `γ([0, 1]) = 0.3413` and `γ([0, 1/2]) = 0.1915`.

*Needs:* 1.1, 1.2; Mathlib `Kernel.IsReversible`, `Kernel.IsReversible.invariant`,
`Kernel.IsMarkovKernel.map`, `lintegral_lintegral_swap`. (Proved here.)

### Examples

The one-dimensional kernel at `t = log (5/2)` and the two-dimensional Mehler sums of 1.2; the
stationary process, whose two-time law at times `0` and `t` is the centred Gaussian on `E × E`
with covariance `[[I, e^(−t) I], [e^(−t) I, I]]`.

### Dependencies

DenoisingDiffusion 2.1; Mathlib `stdGaussian`, `Kernel.map`, `Kernel.IsReversible`,
`Kernel.IsReversible.invariant`, `Kernel.IsMarkovKernel.map`, `integral_map`,
`Measure.withDensity`, `Polynomial.hermite`; Tau Ceti
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.stdGaussian_eq_withDensity`. No other layer.

## Layer 2: the generator, its Dirichlet form and its eigenfunctions

### 2.1 The generator and the backward equation

Define the generator `ouGenerator`, `ouGenerator f x = Δ f x − ⟪x, ∇ f x⟫`. Let `f` be `C²` with
second derivative growing at most polynomially, and `t ≥ 0`.

- `hasDerivWithinAt_ouSemigroup`: `s ↦ P_s f x` has derivative `P_t (L f) x` at `t` within
  `[0, ∞)` (a right derivative at `t = 0`).
- `ouGenerator_ouSemigroup`: `L (P_t f) x = P_t (L f) x`.

(van Handel, Lemma 2.22 and its proof, pp. 28–29, for `d = 1`, and Example 8.13, p. 265, for the
generator in dimension `d`; O'Donnell, Propositions 11.26 and 11.27, pp. 334–335, with the
opposite sign of `L`.)

Route: write `P_t f x = E f (ρ x + σ Z)` with `ρ = e^(−t)`, `σ = √(1 − ρ²)`, `Z ~ γ`, and
differentiate under the integral, which the polynomial bounds and the Gaussian moments justify.
For `t > 0`, `d/dt` gives `E ⟪∇f(ρx + σZ), −ρ x + (ρ²/σ) Z⟫`, and Gaussian integration by parts
turns `E ⟪∇f(ρx + σZ), Z⟫` into `σ E Δf(ρx + σZ)`; this is `P_t (L f) x`. At `t = 0` a second
order Taylor expansion of `f` at `ρ x` gives the right derivative, because `σ²/t → 2`. The
commutation is the same computation in `x`: `∇(P_t f) = ρ P_t ∇f` and `Δ(P_t f) = ρ² P_t Δf`, and
integration by parts again identifies `P_t ⟪·, ∇f⟫`.

**Checks.**
- `d = 2`, `f x = sin (x 0) (x 1)² + (x 0)³ − cos (x 0 + 2 x 1)`, `x = (0.7, −0.4)`: at `t = 0.3`
  the time derivative, `L P_t f x` and `P_t L f x` all equal `1.5252743`; at `t = 0` they equal
  `9.029586`.
- `L (x 0)² = 2 − 2 (x 0)²`. The generator `½Δ − ½⟨x, ∇⟩` of the time-changed process would give
  half of this and would not match 1.1, where `P_t (x 0)²` has derivative `2 e^(−2t)(1 − (x 0)²)`.
- The extension to `t < 0` fails: there `P_t f x = f (c x)` with `c = e^(−t) > 1`, and
  `L (P_t f) x − P_t (L f) x = (c² − 1) Δf (c x)`, which is `22.83` for the function above at
  `t = −1/2`.
- The growth bound is needed: for `d = 1` and `f x = sin (exp (x²))`, `f` is bounded but `f'` and
  `f''` are not integrable against `N(m, σ²)` once `σ² ≥ 1/2`, so for `t ≥ ½ log 2` the right
  side `P_t (L f) x` is the junk value `0` at every `x`. The statement would then make
  `t ↦ P_t f x` constant on `[½ log 2, ∞)`, hence equal to its limit `∫ f dγ` there; but
  `P_t f` is not constant, since `f` is not and `P_t` is injective on `L²(γ)` (its eigenvalues
  `e^(−|α| t)` in 2.4 are nonzero).

*Needs:* 1.1; RandomMatrices 2.5 or MathematicalStatisticsFoundations 4.4 (Gaussian integration by
parts); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `gradient`, the Laplacian
`InnerProductSpace.laplacian_eq_iteratedFDeriv_orthonormalBasis`, `iteratedFDeriv`.

### 2.2 The Dirichlet form

Prove `integral_mul_ouGenerator`: for `f` of class `C¹` with derivative growing at most
polynomially and `g` of class `C²` with second derivative growing at most polynomially,
`∫ f · L g dγ = −∫ ⟪∇f, ∇g⟫ dγ` (van Handel, Lemma 2.22, p. 28, and Example 8.13, p. 265;
O'Donnell, Proposition 11.28, p. 335, with the opposite sign of `L`). In particular `L` is
symmetric and nonpositive on this class.

Route: apply Gaussian integration by parts, `∫ (x i) h(x) dγ = ∫ ∂ᵢ h dγ`, to `h = f ∂ᵢ g` for each
coordinate `i`, and sum: `∫ f ⟪x, ∇g⟫ dγ = ∫ ⟪∇f, ∇g⟫ dγ + ∫ f Δg dγ`.

**Checks.**
- `d = 2`, `f` as in 2.1 and `g x = arctan (x 0) + (x 0)(x 1)²`: both sides are `−8.786550`.
- `f = g = x 0`: `L g = −x 0`, so the left side is `−∫ (x 0)² dγ = −1`, and the right side is
  `−1`.
- The growth bound on `g` is needed: for `d = 1`, `f = 1` and `g` with `g′(x) = √(2π) e^(x²/2)
  arctan x`, the product of `L g` with the Gaussian density is the derivative of `arctan`, so
  the left side is `∫ dx/(1 + x²) = π`, while `∇f = 0` makes the right side `0`.

*Needs:* 2.1 (the definition of `L`); RandomMatrices 2.5 or MathematicalStatisticsFoundations 4.4
(`gaussian_integration_by_parts`, with `θ = 0`, `v = 1`). (Proved here.)

### 2.3 The gradient commutes with the semigroup

Prove `gradient_ouSemigroup`: for `f` of class `C¹` with derivative growing at most polynomially,
`∇(P_t f) x = e^(−t) ∫ ∇f d(ouKernel t x)` for every real `t`. For `t ≥ 0` this is
`∇ P_t f = e^(−t) P_t ∇f` (van Handel, proof of Theorem 2.25, p. 30, for `d = 1`); for `t < 0`
it is the chain rule for `x ↦ f (e^(−t) x)`.

Route: differentiate `x ↦ E f (e^(−t) x + σ Z)` under the integral.

**Checks.**
- `d = 2`, `f` and `x` as in 2.1, `t = 0.3`: the two coordinates of both sides are `1.8594180`
  and `−0.2091590`.
- The growth bound is needed: for `d = 1`, `f x = sin (exp (x²))` and `t = 1`, `f'` is not
  integrable against `ouKernel 1 x`, so the right side is `0`, while `P_1 f` is not constant and
  so has nonzero derivative somewhere.

*Needs:* 1.1; Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `gradient`. (Proved
here.)

### 2.4 The Hermite polynomials are eigenfunctions

Prove, for every multi-index `α : Fin d → ℕ`:

- `ouGenerator_hermiteProd`: `L H_α = −|α| H_α`;
- `ouSemigroup_hermiteProd`: for `t ≥ 0`, `P_t H_α = e^(−|α| t) H_α`.

(O'Donnell, Exercise 11.10 (c), p. 371, for the differential equation of `Heₙ`, and
Propositions 11.33 and 11.37, pp. 338–339, for the action of the semigroup, written there with
`ρ = e^(−t)` and normalized polynomials.)

Route: Mathlib's `hermite_succ` and Tau Ceti's `derivative_hermite` give `He″ₙ − X He′ₙ = −n Heₙ`;
`L` of a product of functions of distinct coordinates is the sum of the one-dimensional operators
applied factor by factor, so `L H_α = −|α| H_α`. The function `u t = P_t H_α x` then satisfies
`u′ = −|α| u` on `[0, ∞)` by 2.1, with `u 0 = H_α x`.

**Checks.**
- `d = 2`, `α = (2, 1)`, `x = (0.7, −0.4)`: `H_α x = (0.49 − 1)(−0.4) = 0.204`, and at `t = 0.25`
  both sides of the second statement are `0.0963627768`.
- The physicists' polynomial `4x² − 2` is not an eigenfunction: `L (4x² − 2) = 8 − 8x²`, which is
  not a multiple of `4x² − 2`.
- `α = 0`: `H_0 = 1`, and both statements say that constants are fixed.
- The extension to `t < 0` fails: for `d = 1`, `α = (2)`, `x = 0.7`, `t = −1/2`, the left side is
  `He₂(e^(1/2) · 0.7) = 0.3320` and the right side is `e · He₂(0.7) = −1.3863`.

*Needs:* 1.1, 2.1; Mathlib `Polynomial.hermite`, `Polynomial.hermite_succ`, `Polynomial.aeval`;
Tau Ceti `Polynomial.derivative_hermite`.

### Examples

The Hermite products of degree at most `3` in two variables and their images under `P_t`; the
function of 2.1 with its time derivative.

### Dependencies

Layer 1 (1.1 for 2.1, 2.3 and 2.4); RandomMatrices 2.5 or MathematicalStatisticsFoundations 4.4
(for 2.1 and 2.2); Mathlib `gradient`, Laplacian, `iteratedFDeriv`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `Polynomial.hermite`,
`Polynomial.hermite_succ`; Tau Ceti `Polynomial.derivative_hermite` (for 2.4).

## Layer 3: decay of variance and entropy, and hypercontractivity

### 3.1 Decay of variance

Prove `variance_ouSemigroup_le`: for `t ≥ 0` and `f ∈ L²(γ)`,
`Var_γ(P_t f) ≤ e^(−2t) Var_γ(f)` (van Handel, Theorem 2.18, p. 26, implication from 1 to 2 with
`c = 1`, applied with the Gaussian Poincaré inequality of Corollary 2.27, p. 31).

Route (spectral): transport Tau Ceti's Hermite basis of `L²` of the product Gaussian to `E` by
Mathlib's `map_pi_eq_stdGaussian`; its vectors are `H_α / √(α!)`. By 1.3 and 2.4,
`⟪P_t f, H_α⟫ = ⟪f, P_t H_α⟫ = e^(−|α| t) ⟪f, H_α⟫`, so Parseval's identity gives
`Var_γ(P_t f) = ∑_(α ≠ 0) e^(−2|α| t) ⟪f, H_α⟫² / α! ≤ e^(−2t) Var_γ(f)`. A second route
differentiates `t ↦ Var_γ(P_t f)` with 2.1 and 2.2 and uses the Gaussian Poincaré inequality of
RandomMatrices 2.2, as in van Handel's Theorem 2.18.

**Checks.**
- Equality for linear functions: `f x = x 0` has `Var_γ(P_t f) = e^(−2t)`, so the constant
  `e^(−2t)` cannot be lowered.
- `d = 1`, `f = sign`, `t = 0.5`: `Var_γ(P_t f) = 0.2398`, below `e^(−1) = 0.3679`.
- The hypothesis `f ∈ L²(γ)` is needed: `f x = exp ((x 0)²/4)` is not square integrable, so
  `Var_γ(f)` is the junk value `0`, while at `t = 1` `P_t f` is square integrable with variance
  `0.01857`.
- The extension to `t < 0` fails: `f x = (x 0)²` and `e^(−t) = c > 1` give `Var_γ(P_t f) = 2c⁴`
  against `e^(−2t) Var_γ(f) = 2c²`.

*Needs:* 1.1, 1.3, 2.4; Tau Ceti `TauCeti.gaussianHermitePiBasis`,
`TauCeti.coeFn_gaussianHermitePiBasis`, `TauCeti.hasSum_gaussianHermitePi_expansion`; Mathlib
`map_pi_eq_stdGaussian`, `variance`. For the second route: 2.1, 2.2 and RandomMatrices 2.2.

### 3.2 Decay of relative entropy

Prove `klDiv_bind_ouKernel_le`: for `t ≥ 0` and every probability law `μ` on `E`,
`klDiv (μ.bind (ouKernel t)) γ ≤ e^(−2t) · klDiv μ γ` in `ℝ≥0∞`. Equivalently, for `h ≥ 0` with
`∫ h dγ = 1`, `Ent_γ(P_t h) ≤ e^(−2t) Ent_γ(h)` with `Ent_γ(h) = ∫ h log h dγ` (van Handel,
Theorem 3.20, p. 63, implication from 1 to 2 with `c = 1/2`, applied with the Gaussian
logarithmic Sobolev inequality in the form of Theorem 3.24, p. 66). With `ouKernel t =
noiseKernel (e^(−2t))` this reads `klDiv (μ.bind (noiseKernel a)) γ ≤ a · klDiv μ γ` for
`0 < a ≤ 1`.

Route: if `klDiv μ γ = ∞` there is nothing to prove. Otherwise `μ = h · γ` and, by 1.3, the law at
time `t` is `(P_t h) · γ`. For `h` smooth and bounded between two positive constants, 2.1 and 2.2
give `d/dt Ent_γ(P_t h) = −∫ ‖∇P_t h‖² / P_t h dγ`, and the logarithmic Sobolev inequality of
RandomMatrices 2.2 with constant `1`, applied to `√(P_t h)`, bounds `Ent_γ(P_t h)` by half of this
integral; Grönwall's inequality gives the decay. For `t = 0` there is nothing to prove. For
`t > 0` and a general `h`, let `hₙ` be `min (max h (1/n)) n` divided by its integral and replace
it by `P_ε hₙ`, which is smooth, lies between the same constants and has bounded derivatives;
the semigroup law turns the inequality for `P_ε hₙ` into one between `Ent_γ(P_(t+ε) hₙ)` and
`Ent_γ(P_ε hₙ)`. Letting `ε → 0` and then `n → ∞`, the right side converges to `Ent_γ(h)` by
dominated convergence (`|hₙ log hₙ|` is bounded by a multiple of `1 + h + |h log h|`), and
`P_t hₙ → P_t h` pointwise, the density of `ouKernel t x` with respect to `γ` being bounded, so
Fatou's lemma for the nonnegative integrand `u log u − u + 1` gives the inequality on the left.
Mathlib states no semicontinuity of `klDiv`, so this limit argument is part of the target.

**Checks.**
- Equality for shifted Gaussians: `μ = N(m, I)` has `klDiv μ γ = ‖m‖²/2`, and its law at time `t`
  is `N(e^(−t) m, I)` with divergence `e^(−2t) ‖m‖²/2`.
- `d = 1`, `μ = N(0, v)`: the divergence `(v − 1 − log v)/2` decays strictly faster; for
  `v = 3` and `t = 0.5` it is `0.0922` at time `t` against `e^(−1) · 0.4507 = 0.1658`.
- The probability hypothesis is needed: `μ = 2γ` has `klDiv μ γ = 2 log 2 − 1 = 0.3863` (Mathlib's
  divergence of finite measures carries the mass correction), and `μ.bind (ouKernel t) = 2γ` has
  the same divergence, which exceeds `e^(−2t) · 0.3863` for `t > 0`.
- The extension to `t < 0` fails: for `μ = γ` and `e^(−2t) = 2` the law at time `t` is `N(0, 2I)`
  with divergence `d (1 − log 2)/2 = 0.1534 d`, against `0` on the right.

*Needs:* 1.3, 2.1, 2.2; RandomMatrices 2.2 (the Gaussian logarithmic Sobolev inequality with
`C = 1`); Mathlib `klDiv`, `Measure.bind`.

### 3.3 Nelson's hypercontractivity

Prove `eLpNorm_ouSemigroup_le`: if `t ≥ 0`, `p ≥ 1` and `q − 1 ≤ e^(2t)(p − 1)`, then for every
`f` that is a.e. strongly measurable for `γ`, `‖P_t f‖_q ≤ ‖f‖_p` (Nelson, 1966 and 1973; van
Handel, Theorem 8.9, p. 262, implication from 1 to 2 with `c = 1`, and Example 8.13, p. 265;
O'Donnell, Theorem 11.23, p. 334, in the form `ρ = e^(−t) ≤ √((p − 1)/(q − 1))`). For `q < 1` the
statement is a consequence of the case `q = 1`, and for `q ≤ 0` the left side is `0`.

The exponents are real numbers; the case `p = ∞` allowed by O'Donnell's theorem is the
contraction of `L^∞(γ)`, which is not stated here.

Route (Gross, 1975): since `|P_t f| ≤ P_t |f|`, take `f ≥ 0` in `L^p(γ)`, and `t > 0`, `q ≥ 1` (the
other cases are the monotonicity of norms). Truncating `f` and approximating it in `L^p(γ)` by
smooth functions between two positive constants, `P_t` of the approximations converges in `L¹(γ)`,
since `P_t` is a contraction there, hence almost everywhere along a subsequence, and Fatou's lemma
carries the inequality to `f`; so take `f` smooth and between two positive constants. With
`q(s) = 1 + e^(2s)(p − 1)`, van Handel's Lemma 8.8, p. 261, computes `d/ds log ‖P_s f‖_(q(s))` from
2.1; the chain rule in the Dirichlet form of 2.2 (van Handel, Example 8.10, p. 262) and the
logarithmic Sobolev inequality of RandomMatrices 2.2 with constant `1` make it nonpositive. So
`‖P_t f‖_(q(t)) ≤ ‖f‖_p`, and a smaller `q` follows from the monotonicity of `L^q(γ)` norms in `q`.

**Checks.**
- The exponent is attained by exponentials: for `f x = exp (λ x 0)`,
  `log (‖P_t f‖_q / ‖f‖_p) = (λ²/2)((q − 1) e^(−2t) − (p − 1))`. With `t = ½ log 3`, `p = 2`,
  `q = 4` and `λ = 1` both norms are `e`.
- The hypothesis `p ≥ 1` is needed: for `d = 1`, `t = ½ log 2`, `p = 3/4` and `q = 1/2` (so that
  `q − 1 = e^(2t)(p − 1)`) and `f` the indicator of `[0, 1/10]`, `‖f‖_p = γ([0, 1/10])^(4/3) =
  0.01360` while `‖P_t f‖_q = 0.03754`.
- `t = 0` gives `q ≤ p`, the monotonicity of norms under a probability measure; `p = q = 1` gives
  the contraction of `L¹(γ)`.

*Needs:* 1.3, 2.1, 2.2; RandomMatrices 2.2 (the Gaussian logarithmic Sobolev inequality with
`C = 1`); Mathlib `eLpNorm`, `eLpNorm_le_eLpNorm_of_exponent_le`.

### 3.4 The exponent cannot be improved

Prove `exists_eLpNorm_ouSemigroup_gt`: if `d ≥ 1`, `p ≥ 1` and `e^(2t)(p − 1) < q − 1`, then for
every constant `C ≥ 0` some `f ∈ L^p(γ)` has `C ‖f‖_p < ‖P_t f‖_q`; this holds for every real `t`.

Route: `f x = exp (λ x 0)`. For `t ≥ 0`, `P_t f x = exp (λ e^(−t) x 0 + λ²(1 − e^(−2t))/2)`, so
`log (‖P_t f‖_q / ‖f‖_p) = (λ²/2)((q − 1) e^(−2t) − (p − 1))`, which tends to `∞` with `λ`. For
`t < 0`, `P_t f x = exp (λ e^(−t) x 0)` and the logarithm of the ratio is
`(λ²/2)(q e^(−2t) − p)`, which is positive because `q e^(−2t) − p > e^(−2t) − 1 > 0`. (Proved
here; the computation is the standard one showing that Nelson's condition is sharp.)

**Checks.**
- `d ≥ 1` is needed: for `d = 0`, `E` is a point, `P_t f = f`, and `‖P_t f‖_q = ‖f‖_p = |f 0|`,
  so `C = 1` admits no `f`.
- `p = 2`, `q = 4`, `t = 0.3`, `λ = 1`: the logarithm of the ratio is
  `(1/2)(3 e^(−0.6) − 1) = 0.3232`.

*Needs:* 1.1; Mathlib `eLpNorm`, `MemLp`, `mgf_gaussianReal` (the moment generating function of
`gaussianReal`). (Proved here.)

### Examples

The decay of the variance of `sign`, of `x²` and of an indicator under `P_t` in dimension one;
Gaussian and two-component mixture starting laws for 3.2; exponentials and indicators against
Nelson's exponent.

### Dependencies

Layer 1 (1.1, 1.3), Layer 2 (2.1, 2.2, 2.4); RandomMatrices 2.2 (for 3.2, 3.3 and the second
route of 3.1); Tau Ceti `TauCeti.gaussianHermitePiBasis`, `TauCeti.coeFn_gaussianHermitePiBasis`,
`TauCeti.hasSum_gaussianHermitePi_expansion` (for 3.1); Mathlib `map_pi_eq_stdGaussian`,
`variance`, `klDiv`, `eLpNorm`, `MemLp`, `mgf_gaussianReal`.

## Downstream consumers

- DenoisingDiffusion 2.2: its forward marginals are `μ₀.bind (noiseKernel (ᾱ t))`, so 3.2 gives
  `klDiv (forwardMarginal μ₀ β t) γ ≤ ᾱ t · klDiv μ₀ γ` whenever the data law has finite
  divergence from `γ`, an exponential rate beside that roadmap's moment bound, which needs no
  such hypothesis.
- ScoreBasedDiffusion, the examples of its Layer 1: the variance-preserving path with `β = 2`
  has the kernels of 1.1, and the exponential decay of the divergence along that path, which
  that roadmap leaves out, is 3.2 after a change of time.

## Scope and ownership

This roadmap owns the Ornstein–Uhlenbeck kernels and semigroup on `E` as defined above, Mehler's
kernel and Mehler's formula in dimension `d`, reversibility, the generator on the polynomial
growth classes with the backward equation and its commutation with the semigroup, the Dirichlet
form, the commutation of gradient and semigroup, the Hermite eigenfunctions, the decay of
variance and of relative entropy along the semigroup, Nelson's hypercontractivity and the
sharpness of its exponent.

Already in the libraries or in roadmaps on main, and therefore not targets:

- DenoisingDiffusion 2.1 (noising kernels, in its Layer 2 on the forward noising chain) owns
  `noiseKernel`, its Gaussian form `DenoisingDiffusion.noiseKernel_apply`, its composition law
  `DenoisingDiffusion.noiseKernel_comp` and its Markov property; the definition is copied verbatim
  above and the semigroup law of 1.1 is that composition law.
- RandomMatrices 2.2 (logarithmic Sobolev and Poincaré inequalities, in its Layer 2 on
  concentration) owns these inequalities on Euclidean spaces, with constant `1` for the standard
  Gaussian; they are consumed in 3.1, 3.2 and 3.3 and not restated. RandomMatrices 2.5 (Gaussian
  integration by parts and replacement) and MathematicalStatisticsFoundations 4.4 (Stein's
  identity) own Gaussian integration by parts, consumed in 2.1 and 2.2.
- OptimalTransport 11.9 (linear flows and semigroups, in its Layer 11) constructs, for a `C²`
  potential `V` with `∇²V ≥ λ I`, the Markov semigroup generated by `Δ − ∇V · ∇` through the
  Wasserstein gradient flow of the Fokker–Planck equation, with its `W₂` contraction, its invariant
  law `Z⁻¹ e^(−V)` when `Z = ∫ e^(−V) dx` is finite, and its realization as a `C₀`-semigroup; for
  `V = ‖x‖²/2` it is the Ornstein–Uhlenbeck semigroup. The invariance of `γ` in 1.3 is not a target
  here: it is Mathlib's `Kernel.IsReversible.invariant` applied to the reversibility of 1.3. The
  semigroup here is a different object, defined directly by its kernels, and its statements are
  explicit computations with them; the identification of the two for `V = ‖x‖²/2`, any
  `C₀`-semigroup realization on `L^p(γ)` and any `W₂` statement are left to that roadmap and are not
  treated here.
- SpecialFunctionsOrthogonalPolynomialsGeneral 8.2 (the Poisson kernel, in its Layer 8 on
  orthogonal expansions) defines the Poisson kernel of an orthogonal polynomial system and checks,
  as an example, that for the Gaussian it is Mehler's kernel in dimension one; the theorem of 1.2 in
  dimension `d` is the statement behind that Check.
- Tau Ceti's Hermite orthogonality under `gaussianReal 0 1` and its Hermite bases of `L²` of the
  one-dimensional and product Gaussians (the completed roadmap OrthogonalL2Bases), consumed in
  3.1. Tau Ceti's `TauCeti.hermiteFunction_oscillator` (the Hermite functions as eigenfunctions
  of `−d²/dx² + x²`) is the same eigenvalue problem as the case `d = 1` of 2.4 after the
  substitution `x ↦ x/√2` and multiplication by the square root of the Gaussian density; 2.4 is
  stated for the polynomials `H_α` and the operator `L` in dimension `d`, which it does not give.

Neighbouring roadmaps that do not overlap:

- BooleanFunctionAnalysis states hypercontractivity of the noise operator on the discrete cube
  and leaves Gaussian hypercontractivity out; 3.3 is the Gaussian theorem, proved from the
  Gaussian logarithmic Sobolev inequality of RandomMatrices 2.2, and this roadmap does not
  depend on it.
- DifferentialEntropyAndEntropyPower treats Fisher information and de Bruijn's identity along the
  heat flow; the entropy dissipation used in the route of 3.2 is along this semigroup and stays
  inside that proof.
- StochasticCalculus 9.4 (named examples of stochastic differential equations) solves the
  scalar Ornstein–Uhlenbeck equation; the identification of the law of its solution with the
  kernels here is not treated here.

Outside the scope: the Ornstein–Uhlenbeck semigroup for a general covariance or drift matrix and
on infinite-dimensional Gaussian spaces; Bakry–Émery theory, Talagrand's transport inequality
and entropy decay for strongly log-concave laws other than `γ`; reverse hypercontractivity;
moment bounds on Wiener chaos; Malliavin calculus; Stein's method.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`: `stdGaussian E` (the image of
  the product of standard real Gaussians under an orthonormal basis; a probability measure,
  `isProbabilityMeasure_stdGaussian`); `map_pi_eq_stdGaussian` (the product of `gaussianReal 0 1`
  over `ι`, mapped by `WithLp.toLp 2`, is `stdGaussian (EuclideanSpace ℝ ι)`).
- `Mathlib/Probability/Kernel/Invariance.lean`: `Kernel.IsReversible κ π` (for measurable `A`,
  `B`, `∫⁻ x in A, κ x B ∂π = ∫⁻ x in B, κ x A ∂π`), `Kernel.Invariant κ μ` (`μ.bind κ = μ`),
  `Kernel.IsReversible.invariant` (a reversible Markov kernel leaves `π` invariant).
- Kernels: `Kernel.id`, `Kernel.const`, `Kernel.prod` (`×ₖ`), `Kernel.map`,
  `Kernel.IsMarkovKernel.map` (the image of a Markov kernel under a measurable map is Markov),
  `Kernel.comp` (`∘ₖ`), `Measure.bind`.
- Integration: `integral_map` (for an a.e. measurable map and an a.e. strongly measurable
  integrand), `integral_dirac` (with measurable singletons, `∫ f d(dirac a) = f a` for every `f`),
  `lintegral_lintegral_swap`, `Measure.withDensity`,
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
  `hasFDerivAt_integral_of_dominated_of_fderiv_le` (differentiation under the integral sign).
- Calculus: `gradient` (notation `∇`), the Laplacian of
  `Mathlib/Analysis/InnerProductSpace/Laplacian.lean` (notation `Δ`, with
  `InnerProductSpace.laplacian_eq_iteratedFDeriv_orthonormalBasis`: the sum over an orthonormal
  basis of the second derivative on the diagonal), `iteratedFDeriv`, `fderiv`, `ContDiff`,
  `HasDerivWithinAt`.
- `Mathlib/RingTheory/Polynomial/Hermite/Basic.lean`: `Polynomial.hermite` (the probabilists'
  Hermite polynomials over `ℤ`), `Polynomial.hermite_succ`
  (`hermite (n + 1) = X * hermite n − derivative (hermite n)`).
- `InformationTheory.klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: for
  `μ ≪ ν` with integrable log-likelihood ratio, `ofReal (∫ llr μ ν dμ + ν(univ) − μ(univ))`, and
  `∞` otherwise); `ProbabilityTheory.variance` (the extended variance `evariance` converted to a
  real number, `0` when it is infinite); `MeasureTheory.eLpNorm`, `MeasureTheory.MemLp`,
  `eLpNorm_le_eLpNorm_of_exponent_le`; `ProbabilityTheory.mgf_gaussianReal`.

### From Tau Ceti

- `TauCeti/Probability/Distributions/Gaussian/Density.lean`:
  `TauCeti.Probability.stdGaussian_eq_withDensity` (the standard Gaussian on
  `EuclideanSpace ℝ ι` is Lebesgue measure with density `(2π)^(−card ι/2) exp (−‖x‖²/2)`);
  `TauCeti.Probability.multivariateGaussian_eq_withDensity` (for a positive definite `S`,
  `multivariateGaussian m S` is Lebesgue measure with the Gaussian density).
- `TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean`:
  `TauCeti.gaussianHermitePiBasis 𝕜 ι` (a Hilbert basis of `L²` of the product of
  `gaussianReal 0 1` over a finite `ι`, indexed by `ι → ℕ`); `TauCeti.coeFn_gaussianHermitePiBasis`
  (its `a`-th vector is a.e. `x ↦ ∏ i, Heₐᵢ(x i)/√((a i)!)`).
- `TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Parseval.lean`:
  `TauCeti.hasSum_gaussianHermitePi_expansion` (every vector of that `L²` space is the sum of its
  Hermite series).
- `TauCeti/RingTheory/Polynomial/Hermite/Derivative.lean`: `Polynomial.derivative_hermite`
  (`derivative (hermite n) = n • hermite (n − 1)`).

### From TauCetiRoadmap.DenoisingDiffusion

- Section 2.1 (noising kernels): `noiseKernel a`, the image of `x` and an independent `Z ~ γ` under
  `√a • x + √(1 − a) • Z`, copied verbatim; `DenoisingDiffusion.noiseKernel_apply` (for
  `0 ≤ a ≤ 1`, `noiseKernel a x = multivariateGaussian (√a • x) ((1 − a) • 1)`);
  `DenoisingDiffusion.noiseKernel_comp` (for `a, b ∈ [0, 1]`,
  `noiseKernel b ∘ₖ noiseKernel a = noiseKernel (a * b)`); the Markov property.

### From TauCetiRoadmap.RandomMatrices

- Section 2.2 (logarithmic Sobolev and Poincaré inequalities): the Gaussian Poincaré inequality
  `Var_γ(f) ≤ ∫ ‖∇f‖² dγ` and the Gaussian logarithmic Sobolev inequality `Ent_γ(f²) ≤ 2 ∫ ‖∇f‖² dγ`
  (constant `C = 1` in that section's normalization), for smooth and, by its extension,
  Euclidean-Lipschitz `f`.
- Section 2.5 (Gaussian integration by parts and replacement): Gaussian integration by parts.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- Section 4.4 (Stein's identity and James–Stein): `gaussian_integration_by_parts` (for
  `X ~ N(θ, v I)` with `v > 0` and a `C¹` field `g` in `L²` with integrable partial derivatives,
  `E[(Xᵢ − θᵢ) gᵢ(X)] = v E[∂ᵢ gᵢ(X)]`), used with `θ = 0` and `v = 1`.

## References

- R. van Handel, *Probability in High Dimension*, APC 550 lecture notes, Princeton University,
  version of December 21, 2016, from the author's page
  (`web.math.princeton.edu/~rvan/APC550.pdf`): Theorem 2.18 (p. 26), Lemma 2.22 and its proof
  (pp. 28–29), the proof of Theorem 2.25 (p. 30), Corollary 2.27 (p. 31), Theorem 3.20 (p. 63),
  Theorem 3.24 (p. 66), Lemma 8.8 (p. 261), Theorem 8.9 and Example 8.10 (p. 262), Example 8.13
  (p. 265).
- R. O'Donnell, *Analysis of Boolean Functions*, Cambridge University Press, 2014; the arXiv
  edition `arXiv:2105.10386v1` (May 2021), whose numbering and page numbers are cited: Remark
  11.14 and Proposition 11.15 (p. 331), Theorem 11.23 and Proposition 11.26 (p. 334),
  Propositions 11.27 and 11.28 (p. 335), Proposition 11.33 (p. 338), Proposition 11.37 (p. 339),
  Exercise 11.10 (p. 371).
- NIST Digital Library of Mathematical Functions, `dlmf.nist.gov`, equation 18.18.28 (Mehler's
  formula for the physicists' Hermite polynomials).
- The papers of Mehler (1866), Uhlenbeck and Ornstein (1930), Nelson (1966, 1973) and Gross (1975)
  are named as O'Donnell's notes to Chapter 11 and van Handel's notes to Chapter 8 attribute the
  results; they were not consulted.
