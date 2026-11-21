# Roadmap: Stein's method for normal approximation

**Summary.** This roadmap develops Stein's method for approximating a law on the real line by the
standard normal law `N(0, 1)`, with explicit constants, in the Wasserstein distance `W₁` and for
smooth test functions. Its objects are the Stein operator `f ↦ f′(x) − x f(x)`, the solution
`f_h` of the Stein equation `f′(w) − w f(w) = h(w) − E h(Z)` for a test function `h` and a
standard normal `Z`, and a class of functions with explicit bounds on `f`, `f′` and the
Lipschitz constant of `f′`, called the Stein class. Every statement is in dimension one.

The headline theorems are these.

- *Stein's characterization.* A probability law `μ` on `ℝ` is `N(0, 1)` if and only if
  `∫ (f′(x) − x f(x)) dμ(x) = 0` for every continuously differentiable `f` with compact support.
- *Bounds on the Stein solution.* If `h` is `K`-Lipschitz, then `|f_h| ≤ K`, `|f_h′| ≤ √(2/π) K`
  and `f_h′` is `2K`-Lipschitz. If `h` is `k + 1` times differentiable and its
  `(k + 1)`-st derivative takes values in an interval `[a, b]`, then `|f_h^(k+2)| ≤ b − a`.
- *The Wasserstein distance through the Stein class.* For every probability law `μ` on `ℝ`,
  `W₁(μ, N(0, 1))` is at most the supremum of `|∫ (f′(x) − x f(x)) dμ(x)|` over the Stein class.
- *Sums.* If `X₁, …, Xₙ` are independent and centred with finite third moments and
  `∑ E Xᵢ² = 1`, the law of `∑ Xᵢ` is within `2 ∑ E Xᵢ² E|Xᵢ| + ∑ E|Xᵢ|³ ≤ 3 ∑ E|Xᵢ|³` of
  `N(0, 1)` in `W₁`. If the `Xᵢ` are centred with finite fourth moments and each `Xᵢ` is
  independent of the family of the `Xⱼ` outside a neighbourhood `Nᵢ`, then with
  `σ² = Var ∑ Xᵢ > 0` the law of `σ⁻¹ ∑ Xᵢ` is within
  `σ⁻³ ∑ᵢ E[|Xᵢ| (∑_{j ∈ Nᵢ} Xⱼ)²] + √(2/π) σ⁻² √Var(∑ᵢ Xᵢ ∑_{j ∈ Nᵢ} Xⱼ)` of `N(0, 1)`.

The roadmap builds on Mathlib's Gaussian law on `ℝ` and on Tau Ceti's Wasserstein distance with
the Kantorovich–Rubinstein duality, which identifies `W₁` with the supremum of differences of
expectations of `1`-Lipschitz functions; OptimalTransport plans that duality. Gaussian
integration by parts, one direction of the characterization, belongs to RandomMatrices and
MathematicalStatisticsFoundations. PoissonApproximation develops the same method for the Poisson
law in total variation; the dependency neighbourhoods of the last theorem are written as there.

## How to read the build

Layer 1 below defines the Stein solution, proves the Stein equation, and proves the
characterization of `N(0, 1)` from it. Layer 2, which uses Layer 1, bounds the Stein solution and
its derivatives, first for Lipschitz and then for smooth test functions. Layer 3, which uses
Layers 1 and 2, bounds `W₁` from `N(0, 1)` by the Stein class. Layer 4 applies Layer 3 to sums of
independent variables and to sums with dependency neighbourhoods. Within a layer the sections are
in build order.

## Conventions

- **The standard normal law.** `γ` is Mathlib's `ProbabilityTheory.gaussianReal 0 1`, `Z` a
  random variable with law `γ`, `φ` and `Φ` its density and distribution function, and
  `γh = E h(Z) = ∫ h dγ`.
- **The Wasserstein distance.** `W₁(μ, ν)` is Tau Ceti's `TauCeti.wassersteinEDist 1 μ ν`: the
  infimum over couplings of `μ` and `ν` of the mean distance, with values in `[0, ∞]`. For laws
  with a finite first moment it equals the supremum of `∫ h dμ − ∫ h dν` over the `1`-Lipschitz
  `h` (Tau Ceti's `TauCeti.wassersteinEDist_one_eq_iSup`, the Kantorovich–Rubinstein duality),
  which is the metric `d_W` of the Stein's method literature; on `ℝ` it is also
  `∫ |F_μ − F_ν|` for the distribution functions (Tau Ceti's
  `TauCeti.wassersteinEDist_one_eq_lintegral_enorm_cdf_sub`). No new distance is defined here.
- **Derivatives.** `f′` is Mathlib's `deriv f` and `f^(k)` is `iteratedDeriv k f`; both are `0`
  where the function is not differentiable, so every statement about them assumes or proves
  differentiability. Lipschitz constants are in `ℝ≥0` (`LipschitzWith K h`).
- **Random variables.** Variables `Xᵢ : Ω → ℝ` live on a probability space `(Ω, P)`, the law of
  `W` is the image measure `P.map W`, and `Var` is Mathlib's `ProbabilityTheory.variance`. Moment
  hypotheses are `MemLp` hypotheses; they also give the measurability that the image measures and
  the Bochner integrals need, since the integral of a non-integrable function is `0` in Lean.
- **Constants.** Ross states his bounds with `‖f‖ ≤ 2‖h′‖`; Layer 2 proves the sharper
  `‖f‖ ≤ ‖h′‖`, and the Stein class of Layer 3 uses it. Layer 4 uses the bound on `f` only for
  integrability, so its constants do not depend on that choice.

## Layer 1: the Stein equation of the standard normal law

### 1.1 The solution of the Stein equation

For `h : ℝ → ℝ` define `steinSolution h` by

    f_h(w) = e^(w²/2) ∫_{t ≤ w} (h(t) − γh) e^(−t²/2) dt,

the formula of Ross, Lemma 2.5, p. 9 (second form), and of Daly, (1.1), p. 567. Prove
`hasDerivAt_steinSolution`: if `h` is continuous and integrable against `γ`, then `f_h` is
differentiable at every `w` with `f_h′(w) = w f_h(w) + h(w) − γh`, that is,
`f_h′(w) − w f_h(w) = h(w) − γh` (Ross, Lemma 2.2, pp. 6–7, for the indicator test functions, and
Lemma 2.5, p. 9). Every other solution differs from `f_h` by a multiple of `e^(w²/2)`.

Route: `t ↦ (h(t) − γh) e^(−t²/2)` is continuous and integrable on `ℝ`, since `h` is integrable
against `γ`; so the integral over `(−∞, w]` is the integral over `(−∞, 0]` plus the interval
integral from `0` to `w` (`intervalIntegral.integral_Iic_sub_Iic`), which has derivative
`(h(w) − γh) e^(−w²/2)` (`intervalIntegral.integral_hasDerivAt_right`). The product rule gives
the equation. (Proved here.)

**Checks.**
- `h(x) = x`: `γh = 0` and `f_h ≡ −1`, since `∫_{t ≤ w} t e^(−t²/2) dt = −e^(−w²/2)`; the equation
  reads `0 + w = w`.
- `h(x) = x²`: `γh = 1` and `f_h(w) = −w`; the equation reads `−1 + w² = w² − 1`.
- `h(x) = |x|`: `γh = √(2/π)` and `f_h(0) = √(2π) (φ(0) − √(2/π)/2) = 0`.
- The value of `γh` matters: with `h ≡ 1` the solution is `0`; replacing `γh` by `0` would give
  `e^(w²/2) √(2π) Φ(w)`, which solves `f′ − w f = 1` but is unbounded.

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianReal_of_var_ne_zero`,
`intervalIntegral.integral_Iic_sub_Iic`, `intervalIntegral.integral_hasDerivAt_right`.

### 1.2 Stein's characterization of the standard normal law

Prove `eq_gaussianReal_iff_integral_stein`: a probability measure `μ` on `ℝ` equals `γ` if and only
if `∫ (f′(x) − x f(x)) dμ(x) = 0` for every `f` with `ContDiff ℝ 1 f` and `HasCompactSupport f`
(Ross, Lemma 2.1, pp. 6–7, where the class is that of the absolutely continuous `f` with
`E|f′(Z)| < ∞`; Stein's lemma). Every function of the class here is in Ross's class, and both
directions hold for it with no integrability side condition; a smaller class makes the converse
stronger.

Route. If `μ = γ` the identity is Gaussian integration by parts, `E f′(Z) = E[Z f(Z)]`, which
RandomMatrices owns (Layer 2, 2.5, Gaussian integration by parts and replacement) and
MathematicalStatisticsFoundations states in coordinates (4.4, Stein's identity,
`gaussian_integration_by_parts`, for `multivariateGaussian` on `EuclideanSpace ℝ (Fin p)`): with
`p = 1`, `θ = 0`, `v = 1`, transported along the isometry `EuclideanSpace ℝ (Fin 1) ≃ ℝ`, which
sends that law to `γ`; a compactly supported `C¹` function satisfies its hypotheses. It is cited,
not restated. Conversely, let `ψ` be continuous with compact support and `γψ = 0`. By 1.1,
`f_ψ` is `C¹` with `f_ψ′ = w f_ψ + ψ`; it vanishes to the left of the support of `ψ`, and to the
right of it as well because the integral of `ψ φ` over `ℝ` is `γψ = 0`. So `f_ψ` is admissible
and `∫ ψ dμ = ∫ (f_ψ′ − x f_ψ) dμ = 0`. Fix `ρ ≥ 0` continuous with compact support and
`γρ = 1`; applied to `ψ − (γψ) ρ` this gives `∫ ψ dμ = c ∫ ψ dγ` for every continuous compactly
supported `ψ`, with `c = ∫ ρ dμ ≥ 0`. Mathlib's
`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` gives `μ = c γ`, and the total
masses give `c = 1`. (The converse is proved here; Ross's proof uses the solution for an
indicator, which is neither `C¹` nor compactly supported.)

**Checks.**
- Take `f(x) = x (1 − x²)²` on `[−1, 1]` and `0` outside; it is `C¹` with `f′(0) = 1`. For the unit
  mass at `0` the integral is `f′(0) = 1`.
- For `N(0, v)` the integral is `(1 − v) E f′(X)` by Gaussian integration by parts: `−0.02187` for
  `v = 4` and `0.20184` for `v = 1/4`, and `0` for `v = 1`.
- The uniform law on `[−√3, √3]`, centred with variance `1` like `γ`, gives `−0.04399` for this
  `f`: the condition sees more than the first two moments.
- One test function does not suffice: for the law with masses `1/2` at `±1`, this `f` gives `0`,
  since `f` and `f′` vanish at `±1`; the converse uses every admissible `f`.

*Needs:* 1.1; RandomMatrices 2.5 (Gaussian integration by parts);
MathematicalStatisticsFoundations 4.4 (Stein's identity, `gaussian_integration_by_parts`); Mathlib
`ProbabilityTheory.gaussianReal`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
`HasCompactSupport`, `ContDiff`.

### Examples

The Stein solutions of `x`, `x²` and `|x|`; the test function `x (1 − x²)²` against a unit mass,
three centred normal laws, a uniform law and a two-point law.

### Dependencies

RandomMatrices Layer 2 (2.5, Gaussian integration by parts) and MathematicalStatisticsFoundations
Layer 4 (4.4, Stein's identity), for 1.2; Mathlib
`ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianReal_of_var_ne_zero`,
`intervalIntegral.integral_Iic_sub_Iic`, `intervalIntegral.integral_hasDerivAt_right`,
`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`, `HasCompactSupport`. No other
layer.

## Layer 2: bounds on the Stein solution

### 2.1 Lipschitz test functions

Let `h` be `K`-Lipschitz. Prove, for every `w`:

- `abs_steinSolution_le`: `|f_h(w)| ≤ K`;
- `abs_deriv_steinSolution_le`: `|f_h′(w)| ≤ √(2/π) K`;
- `lipschitzWith_deriv_steinSolution`: `f_h′` is `2K`-Lipschitz.

Ross, Lemma 2.5, part 2, p. 9, states `‖f_h‖ ≤ 2‖h′‖`, `‖f_h′‖ ≤ √(2/π) ‖h′‖` and
`‖f_h″‖ ≤ 2‖h′‖` for absolutely continuous `h` and refers the proof to Chen, Goldstein and Shao;
the sharper first bound `‖f_h‖ ≤ ‖h′‖` is (1.6) of Daly, p. 568, with `j = 1`, which Daly
attributes to Goldstein and Reinert, after Barbour and Götze. The third bound is also Daly's
Theorem 1.1, p. 568, with `k = 0`, for differentiable `h`. A Lipschitz `h` has linear growth, so
it is integrable against `γ` and 1.1 applies.

Route. `h` is absolutely continuous with an almost everywhere derivative `h′`, `|h′| ≤ K`
(`LipschitzWith.ae_differentiableAt`). Integrating `h(t) − h(x)` against `φ(x) dx` gives
`h(t) − γh = ∫_{s < t} h′(s) Φ(s) ds − ∫_{s > t} h′(s) (1 − Φ(s)) ds`, and substituting in 1.1,
with `c(w) = √(2π) e^(w²/2) = 1/φ(w)`,

    f_h(w) = −c(w) [ (1 − Φ(w)) ∫_{s < w} h′Φ ds + Φ(w) ∫_{s > w} h′(1 − Φ) ds ].

With `∫_{s < w} Φ = wΦ(w) + φ(w)` and `∫_{s > w} (1 − Φ) = φ(w) − w(1 − Φ(w))`, the bracket is at
most `K φ(w)` in absolute value, which is the first bound. For the second, `f_h′ = w f_h + h − γh`
is the same combination with the coefficients `1 − w c(w)(1 − Φ(w))` and `1 + w c(w) Φ(w)`, which
are positive by the Mills-ratio bound `1 − Φ(w) < φ(w)/w` for `w > 0` (and its mirror image for
`w < 0`); so `|f_h′(w)| ≤ K g(w)` with

    g(w) = 2φ(w) + 2w(2Φ(w) − 1) − 2 c(w) w² Φ(w)(1 − Φ(w)),

and `g` is even, decreasing on `[0, ∞)`, with `g(0) = 2φ(0) = √(2/π)`. For the third, wherever
`h′(w)` exists, `f_h″(w) = (1 + w²) f_h(w) + w (h(w) − γh) + h′(w)`, and the same substitution
writes `f_h″(w) − h′(w)` with coefficients whose absolute values, for `w ≥ 0`, are
`(1 + w²) c(w)(1 − Φ(w)) − w` and `w + (1 + w²) c(w) Φ(w)`; the first is nonnegative by the
Mills-ratio bound `1 − Φ(w) ≥ w φ(w)/(1 + w²)`, and the weighted sum of the two is exactly `1`.
So `|f_h″(w) − h′(w)| ≤ K`, hence `|f_h″| ≤ 2K` almost everywhere; for `w < 0` apply this to
`x ↦ h(−x)`, whose Stein solution is `w ↦ −f_h(−w)`. Since `f_h′ = w f_h + h − γh` is locally
absolutely continuous, it is `2K`-Lipschitz. The two Mills-ratio bounds are the two sides of
SpecialFunctionsEiLiErfIncompleteGamma 12.2 (inequalities for the error functions,
`millsRatio_bounds`, DLMF 7.8.2) at `x = w/√2`: they give
`2/(w + √(w² + 4)) < (1 − Φ(w))/φ(w) ≤ 2/(w + √(w² + 8/π))`, and the outer terms are at least
`w/(1 + w²)` and less than `1/w`. (Proved here.)

**Checks.**
- The first bound is attained: `h(x) = x` has `f_h ≡ −1` (1.1), so `|f_h| = 1 = K`.
- The second is attained: `h(x) = −|x|` has `γh = −√(2/π)` and `f_h′(0) = √(2/π) = 0.79788`.
  The function `g` takes the values `0.79788`, `0.74602`, `0.51744`, `0.19428` at
  `w = 0, 1, 3, 10`.
- The constant of the third cannot be lowered: for `h` the distance to the nearest integer
  (`K = 1`), `f_h″` jumps up by `2` at each integer `n`, and its left limit there is `−1.73829` at
  `n = 4` and `−1.99875` at `n = 40`, tending to `−2`. For `h(x) = |x|` the supremum of `|f_h″|`
  is `1`, and for `h(x) = sin x` it is `0.27522`.
- The first bound is approached by functions that are not linear: for `h(x) = |x − 1|`,
  `f_h(w)` tends to `1` as `w → −∞` and to `−1` as `w → ∞` (`f_h(−40) = 0.99584`,
  `f_h(40) = −0.94587`), so `sup |f_h| = 1 = K`, where Ross's constant allows `2`.
- `K = 0`: `h` is constant, `f_h ≡ 0`, and all three bounds read `0`.

*Needs:* 1.1; SpecialFunctionsEiLiErfIncompleteGamma 12.2 (`millsRatio_bounds`); Mathlib
`LipschitzWith`, `LipschitzWith.ae_differentiableAt`, `ProbabilityTheory.memLp_id_gaussianReal`.

### 2.2 Smooth test functions

Prove `abs_iteratedDeriv_steinSolution_le`: let `k ≥ 0` and let `h` be `k + 1` times
differentiable on `ℝ` (each of `h, h′, …, h^(k)` differentiable everywhere) with
`a ≤ h^(k+1)(x) ≤ b` for every `x`. Then `|f_h^(k+2)(w)| ≤ b − a` for every `w`; in particular
`|f_h^(k+2)| ≤ 2 sup |h^(k+1)|` (Daly, Theorem 1.1, p. 568, where `h` is `k + 1` times
differentiable with `h^(k)` absolutely continuous; the absolute continuity is automatic here,
since `h^(k)` has a bounded derivative and is therefore Lipschitz). For `k = 0` this is the
third bound of 2.1 in the sharper form `b − a` for differentiable `h`. The bound is sharp
(Daly, p. 577).

Route, following Daly's proof (pp. 574–577). With `Z(x) = Φ(x)/φ(x)`, his Lemma 2.2, p. 575,
writes `f_h^(k+2)(x)` as `h^(k+1)(x)` minus two integrals of `h^(k+1)` against positive weights;
when `h^(k+1) ≥ 0`, his Lemma 2.1 shows that the two weights have total mass `1` at every `x`, so
`f_h^(k+2)(x)` lies between `h^(k+1)(x) − sup h^(k+1)` and `h^(k+1)(x)`, and its absolute value is
at most `sup h^(k+1)`. For general `h` subtract `a x^(k+1)/(k+1)!`: the Stein solution of a
polynomial of degree `k + 1` is a polynomial of degree `k`, so `f^(k+2)` is unchanged, and the new
`(k + 1)`-st derivative lies in `[0, b − a]`. A function with bounded `(k + 1)`-st derivative has
polynomial growth, so it is integrable against `γ` and 1.1 applies; differentiating the Stein
equation, `f_h^(j+1) = w f_h^(j) + j f_h^(j−1) + h^(j)` for `1 ≤ j ≤ k + 1`, so `f_h` is `k + 2`
times differentiable and `iteratedDeriv (k + 2)` is its true derivative at every point.

**Checks.**
- `h(x) = x²`, `k = 1`: `h″ ≡ 2`, so `b − a = 0`; indeed `f_h(w) = −w` (1.1) and `f_h‴ ≡ 0`.
- `h(x) = sin x`, `k = 1`: the computed `sup |f_h‴|` is `0.20428` (at `w = ±1.84957`), below
  `2`; `h(x) = sin 3x` gives `6.93756` (at `w = ±0.56908`), below `18`.
- `h(x) = log cosh x`, `k = 1`: `h″ = sech² x` takes values in `(0, 1]`, so the bound is `1`
  where the cruder `2 sup |h″|` is `2`; the computed `sup |f_h‴|` is `0.25087`.
- `h(x) = arctan x`, `k = 2`: `h‴(x) = (6x² − 2)/(1 + x²)³` ranges over `[−2, 1/2]`, so the bound
  is `5/2`; the computed `sup |f_h⁗|` is `1.19983`.

*Needs:* 1.1; Mathlib `iteratedDeriv`, `iteratedDeriv_succ`,
`ProbabilityTheory.memLp_id_gaussianReal`.

### Examples

The Stein solutions of `x`, `−|x|`, the distance to the nearest integer, `x²`, `sin x`,
`log cosh x` and `arctan x`, with their extreme derivatives.

### Dependencies

Layer 1 (1.1). SpecialFunctionsEiLiErfIncompleteGamma 12.2 (for 2.1). Mathlib `LipschitzWith`,
`LipschitzWith.ae_differentiableAt`, `iteratedDeriv`, `iteratedDeriv_succ`,
`ProbabilityTheory.memLp_id_gaussianReal`.

## Layer 3: the Wasserstein distance through the Stein class

### 3.1 The Stein class and the bound on W₁

Define `steinClass`, the set of differentiable `f : ℝ → ℝ` with `|f| ≤ 1`, `|f′| ≤ √(2/π)` and
`f′` `2`-Lipschitz. By 2.1 it contains `f_h` for every `1`-Lipschitz `h`.

Prove `wassersteinEDist_le_iSup_steinClass`: for every probability measure `μ` on `ℝ`,

    W₁(μ, γ) ≤ sup over f ∈ steinClass of |∫ (f′(x) − x f(x)) dμ(x)|,

the supremum taken in `[0, ∞]` (Ross, Theorem 3.1, p. 10, with the class `‖f‖, ‖f″‖ ≤ 2`,
`‖f′‖ ≤ √(2/π)`; the class here bounds `f` by `1` instead of `2` and asks `f′` to be
`2`-Lipschitz in place of `‖f″‖ ≤ 2`, and the statement needs no moment hypothesis on `μ`).

Route. If `μ` has a finite first moment, so does `γ` (`ProbabilityTheory.memLp_id_gaussianReal`,
`TauCeti.hasFiniteMoment_iff_memLp_edist`), and `TauCeti.wassersteinEDist_one_eq_iSup` writes
`W₁(μ, γ)` as the supremum of `∫ h dμ − γh` over `1`-Lipschitz `h`. For such `h`, integrating the
Stein equation 1.1 against `μ` gives `∫ h dμ − γh = ∫ (f_h′ − x f_h) dμ`: `f_h′` is bounded and
`|x f_h(x)| ≤ |x|` is integrable. And `f_h ∈ steinClass` by 2.1. If `μ` has no finite first
moment, the right side is `∞`: for `h_R(x) = min(|x|, R)`, which is `1`-Lipschitz and bounded,
`x f_{h_R}(x) = f_{h_R}′(x) − h_R(x) + γh_R` is bounded, so the same computation is valid and gives
`∫ h_R dμ − γh_R`, which tends to `∞` with `R` by monotone convergence. (Proved here.)

**Checks.**
- `μ` the unit mass at `0`: `W₁(μ, γ) = E|Z| = √(2/π) = 0.79788`, and the right side is
  `sup |f′(0)| = √(2/π)` over the class, attained by the Stein solution of `−|x|`; the bound
  holds with equality.
- `μ` with masses `1/2` at `±1`: `W₁(μ, γ) = 4Φ(1) + 4φ(1) − 2φ(0) − 3 = 0.53538`.
- `μ` the standard Cauchy law: `W₁(μ, γ) = ∞`, and the right side is `∞` by the second case of
  the route.

*Needs:* 1.1, 2.1; Tau Ceti `TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_one_eq_iSup`,
`TauCeti.hasFiniteMoment_iff_memLp_edist`; Mathlib `ProbabilityTheory.memLp_id_gaussianReal`.

### Examples

A unit mass, a symmetric two-point law and the Cauchy law against `N(0, 1)`.

### Dependencies

Layer 1 (1.1) and Layer 2 (2.1). Tau Ceti `TauCeti.wassersteinEDist`,
`TauCeti.wassersteinEDist_one_eq_iSup`, `TauCeti.hasFiniteMoment_iff_memLp_edist`; Mathlib
`ProbabilityTheory.memLp_id_gaussianReal`.

## Layer 4: sums of independent and of locally dependent variables

Throughout, `ι` is a finite type, `(Ω, P)` a probability space and `X : ι → Ω → ℝ`.

### 4.1 Sums of independent variables

Prove `wassersteinEDist_map_sum_le`: let the `Xᵢ` be independent (`iIndepFun`), with
`E|Xᵢ|³ < ∞`, `E Xᵢ = 0` and `∑ E Xᵢ² = 1`. Then

    W₁(law of ∑ Xᵢ, γ) ≤ 2 ∑ E Xᵢ² · E|Xᵢ| + ∑ E|Xᵢ|³ ≤ 3 ∑ E|Xᵢ|³,

the second inequality by `E Xᵢ² · E|Xᵢ| ≤ E|Xᵢ|³` (Lyapunov's inequality). Ross proves the
fourth-moment form `n^(−3/2) ∑ E|Xᵢ|³ + √(2/π) n^(−1) √(∑ E Xᵢ⁴)` for `W = n^(−1/2) ∑ Xᵢ` with
`E Xᵢ² = 1` (Theorem 3.2, p. 10, and Lemma 3.4, p. 11) and remarks on p. 10 that a small
modification needs only third moments; the third-moment form is proved here. Sharper constants
for the third-moment bound are due to Goldstein (2010) and are not treated here.

Route. Let `f ∈ steinClass`, `W = ∑ Xⱼ` and `Wᵢ = W − Xᵢ`, which is independent of `Xᵢ`
(`iIndepFun.indepFun_finset` and composition). Since `E Xᵢ = 0` and `f` is bounded,
`E[W f(W)] = ∑ E[Xᵢ (f(W) − f(Wᵢ))]`. Taylor's formula with `f′` `2`-Lipschitz gives
`f(W) − f(Wᵢ) = Xᵢ f′(Wᵢ) + Rᵢ` with `|Rᵢ| ≤ Xᵢ²`, and `E[Xᵢ² f′(Wᵢ)] = E Xᵢ² · E f′(Wᵢ)` by
independence. With `∑ E Xᵢ² = 1`,

    E f′(W) − E[W f(W)] = ∑ E Xᵢ² · E[f′(W) − f′(Wᵢ)] − ∑ E[Xᵢ Rᵢ],

and `|f′(W) − f′(Wᵢ)| ≤ 2|Xᵢ|`, `|Xᵢ Rᵢ| ≤ |Xᵢ|³`. Conclude with 3.1. (Proved here.)

**Checks.**
- One Rademacher sign: `W₁ = 0.53538`, the bound is `3`. Nine independent signs scaled by `1/3`:
  `W₁ = 0.16819`, the bound is `1`.
- Centred Bernoulli variables with `p = 1/5`, scaled to variance `1`: for `n = 4` the exact
  distance is `0.36039`, the bound `1.65000`, and `3 ∑ E|Xᵢ|³ = 2.55000`. Exact computation
  confirms the bound for `n ∈ {1, 2, 3, 4, 6, 9}` and `p ∈ {1/2, 1/5}`.
- The third-moment hypothesis is needed, because a non-integrable `|Xᵢ|³` has integral `0` in
  Lean: one variable that is `0` with probability `0.99` and otherwise has variance `100` and no
  third moment has `E|X| ≤ 0.1` by Cauchy–Schwarz, so the right side would be at most `0.2`, while
  `W₁ ≥ E|Z| − E|X| ≥ 0.69`.
- A single standard normal variable gives distance `0` and bound `2 √(2/π) + 2 √(2/π) = 3.19`: the
  bound does not vanish at the normal law.

*Needs:* 3.1; Mathlib `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral`, `MeasureTheory.MemLp`.

### 4.2 Dependency neighbourhoods

Let `N : ι → Finset ι`, and suppose that each `Xᵢ` is independent of the family
`(Xⱼ)_{j ∉ Nᵢ}`, as in PoissonApproximation 3.1 (the local dependence theorem, there for
indicators). Prove
`wassersteinEDist_map_sum_le_of_dependencyNeighbourhoods`: if moreover `E Xᵢ⁴ < ∞`, `E Xᵢ = 0` and
`σ² = Var ∑ Xᵢ > 0`, then, with `T = ∑ᵢ Xᵢ ∑_{j ∈ Nᵢ} Xⱼ`,

    W₁(law of σ⁻¹ ∑ Xᵢ, γ) ≤ σ⁻³ ∑ᵢ E[|Xᵢ| (∑_{j ∈ Nᵢ} Xⱼ)²] + √(2/π) σ⁻² √(Var T).

These are the two intermediate terms (3.11) and (3.12) in Ross's proof of Theorem 3.5, pp. 12–14,
which Ross notes give a bound by themselves (p. 15). Ross's Theorem 3.5 then bounds them by
`D = maxᵢ |Nᵢ|`; that step counts each index in at most `D` neighbourhoods, which holds when the
neighbourhoods are symmetric (`j ∈ Nᵢ` exactly when `i ∈ Nⱼ`) but not in general, and it is not
a target here. The condition `i ∈ Nᵢ` of PoissonApproximation 3.1 is not needed: if `i ∉ Nᵢ`,
then `Xᵢ` is independent of itself, hence almost surely constant, hence `0`.

Route. Write `W = σ⁻¹ ∑ Xⱼ` and `Wᵢ = σ⁻¹ ∑_{j ∉ Nᵢ} Xⱼ`, independent of `Xᵢ`. For
`f ∈ steinClass`, `E[W f(W)] = σ⁻¹ ∑ E[Xᵢ (f(W) − f(Wᵢ))]`, and Taylor's formula around `W`
gives `f(W) − f(Wᵢ) = (W − Wᵢ) f′(W) + Rᵢ` with `|Rᵢ| ≤ (W − Wᵢ)²` and
`W − Wᵢ = σ⁻¹ ∑_{j ∈ Nᵢ} Xⱼ`. So

    E f′(W) − E[W f(W)] = E[f′(W) (1 − T/σ²)] − σ⁻¹ ∑ E[Xᵢ Rᵢ].

The second term is at most the first term of the bound. Independence and centring give
`E[Xᵢ Xⱼ] = 0` for `j ∉ Nᵢ`, so `E T = σ²`, and Cauchy–Schwarz bounds the first term by
`√(2/π) σ⁻² √(Var T)`. Fourth moments make `T` square integrable. Conclude with 3.1. (Proved here,
following Ross's proof.)

**Checks.**
- Independent Rademacher signs with `Nᵢ = {i}`: `T = n` is constant, the bound is `n^(−1/2)`, and
  the exact distances are `0.53538, 0.37603, 0.25708, 0.17864` for `n = 1, 2, 4, 8`.
- Moving sums `Xᵢ = εᵢ + εᵢ₊₁` of independent signs, `Nᵢ = {i − 1, i, i + 1}`: `σ² = 4n − 2`; for
  `n = 5` the distance is `0.12315` and the bound `1.52264`, for `n = 11` they are `0.07852` and
  `1.04669`. Exact enumeration confirms the bound for `n ∈ {1, 2, 3, 5, 8, 11}` and for the
  `2`-dependent family `Xᵢ = εᵢ εᵢ₊₁ + εᵢ₊₂` with `n ∈ {3, 6, 9}`.
- The independence is needed: for `X₁ = X₂ = ε` and `Nᵢ = {i}` it fails, `E T = 2 ≠ σ² = 4`, and
  the right side would be `0.25` while the distance is `0.53538`; with `Nᵢ = {1, 2}` it holds and
  the right side is `1`.

*Needs:* 3.1; Mathlib
`ProbabilityTheory.IndepFun`, `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral`,
`ProbabilityTheory.variance`, `MeasureTheory.MemLp`.

### Examples

Independent Rademacher signs and centred Bernoulli variables; moving sums and windows of
independent signs; two equal signs, which violate the independence for small neighbourhoods.

### Dependencies

Layer 3 (3.1). Mathlib
`ProbabilityTheory.iIndepFun`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.IndepFun`, `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral`,
`ProbabilityTheory.variance`, `MeasureTheory.MemLp`.

## Scope and ownership

This roadmap owns: the Stein solution for the standard normal law and the Stein equation (1.1);
the converse half of Stein's characterization, stated as an equivalence (1.2); the bounds on the
Stein solution for Lipschitz and for smooth test functions (Layer 2); the Stein class and the
bound of `W₁` through it (Layer 3); and the `W₁` bounds for sums of independent variables and
under dependency neighbourhoods (Layer 4). Everything is in dimension one: the multivariate
normal case, whose Stein solution is built from the Ornstein–Uhlenbeck semigroup, is not treated
here.

Already in the libraries and cited, not restated:

- The Gaussian law on `ℝ`, its density and its moments (Mathlib); the uniqueness of a regular
  measure from its integrals of compactly supported continuous functions (Mathlib).
- The Wasserstein distance, its Kantorovich–Rubinstein duality for laws with a finite first
  moment and its expression through distribution functions on `ℝ` (Tau Ceti). OptimalTransport
  plans the duality in its Layer 3, Wasserstein distances, item 3.8 (Kantorovich–Rubinstein
  duality), and the one-dimensional quantile formula, from which Tau Ceti derives the expression
  through distribution functions, in item 3.7 (the quantile coupling on the line); this roadmap
  defines no distance of its own.
- The central limit theorem (Mathlib's
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`), of which 4.1 is a
  quantitative form in `W₁`.

Left to other roadmaps:

- Gaussian integration by parts, the direct half of 1.2: RandomMatrices Layer 2 (2.5, Gaussian
  integration by parts and replacement) owns it, with a Lindeberg replacement inequality for
  smooth test functions, and MathematicalStatisticsFoundations Layer 4 (4.4, Stein's identity)
  states its coordinate form `gaussian_integration_by_parts`. 4.1 is a different bound: it is
  in `W₁`, for Lipschitz test functions, by the Stein solution rather than by replacement.
- Bounds on Mills' ratio of the normal law: SpecialFunctionsEiLiErfIncompleteGamma 12.2
  (`millsRatio_bounds`), consumed in the route of 2.1.
- The Stein–Chen method for the Poisson law in total variation: PoissonApproximation, Layers 2
  and 3. Its Stein solution, characterization and dependency-neighbourhood theorem are for the
  Poisson law and are not restated. 4.2 is a different statement, for the normal law and real
  variables in `W₁`; it writes its independence hypothesis in the form of PoissonApproximation
  3.1, and this roadmap does not depend on that one.
- The Kolmogorov distance, Esseen's smoothing inequality, the Berry–Esseen theorem and Edgeworth
  expansions: MathematicalStatisticsHigherOrderAndResampling 1.1 and Layers 2 and 4; its bounded
  Lipschitz distance (its 1.2) is not used here. No bound here is in the Kolmogorov distance.
- Kernel Stein discrepancies and score-based Stein identities for general targets:
  KernelsAndSpectralMethods 11.1 and 11.2. Its convergence control by such discrepancies, which
  it describes as needing solutions of the Stein equation of Langevin diffusions on `ℝᵈ` with
  gradient bounds, is a direction it names beyond its targets; nothing of it is treated here,
  and Layer 2 is only the one-dimensional standard normal case.

Not treated here: normal approximation in the Kolmogorov or total variation distance;
exchangeable pairs, size-bias and zero-bias couplings, and Goldstein's sharper constant in 4.1;
concentration inequalities by Stein's method; approximation by laws other than the normal and the
multivariate normal law; Ross's further bound of 4.2 by the largest neighbourhood size.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal m v`, the
  normal law with mean `m` and variance `v : ℝ≥0`; `ProbabilityTheory.gaussianReal_of_var_ne_zero`
  (for `v ≠ 0` it has density `gaussianPDF m v` with respect to Lebesgue measure);
  `ProbabilityTheory.memLp_id_gaussianReal` (the identity is in every `Lᵖ` with `p` finite).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`:
  `intervalIntegral.integral_Iic_sub_Iic` (for `f` integrable on `(−∞, a]` and `(−∞, b]`, the
  difference of the two integrals is the interval integral from `a` to `b`).
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_hasDerivAt_right` (the integral up to `b` of a function continuous at
  `b` has derivative its value at `b`).
- `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`:
  `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` (two regular measures with the
  same integrals of compactly supported continuous functions are equal).
- `Mathlib/Topology/Algebra/Support.lean`: `HasCompactSupport`.
  `Mathlib/Analysis/Calculus/ContDiff/Defs.lean`: `ContDiff`.
  `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`: `iteratedDeriv` and `iteratedDeriv_succ`
  (the `(n + 1)`-st derivative is `deriv` of the `n`-th, with no differentiability hypothesis).
  `Mathlib/Topology/EMetricSpace/Lipschitz.lean`: `LipschitzWith`.
  `Mathlib/Analysis/Calculus/Rademacher.lean`: `LipschitzWith.ae_differentiableAt` (a Lipschitz
  function on a finite-dimensional space is differentiable almost everywhere).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun`,
  `ProbabilityTheory.IndepFun`, `ProbabilityTheory.iIndepFun.indepFun_finset` (functions of
  disjoint subfamilies of an independent family are independent).
  `Mathlib/Probability/Independence/Integration.lean`:
  `ProbabilityTheory.IndepFun.integral_mul_eq_mul_integral` (the expectation of a product of two
  independent integrable variables is the product of the expectations).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`.
  `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean`: `MeasureTheory.MemLp`.
- `Mathlib/Probability/CentralLimitTheorem.lean`:
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`, cited in the scope only.

### From Tau Ceti

- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`: `TauCeti.wassersteinEDist p μ ν`
  (the infimum over couplings of the `Lᵖ` norm of the distance, in `[0, ∞]`);
  `TauCeti.HasFiniteMoment` and `TauCeti.hasFiniteMoment_iff_memLp_edist` (a finite `p`-th moment
  is the membership in `Lᵖ` of the distance to a basepoint).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.lean`:
  `TauCeti.wassersteinEDist_one_eq_iSup` (for probability measures with finite first moments on a
  second-countable pseudometric space with a standard Borel structure, `W₁` is the supremum of
  `ofReal (∫ f dμ − ∫ f dν)` over `1`-Lipschitz real `f`).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/OneDimensional.lean`:
  `TauCeti.wassersteinEDist_one_eq_lintegral_enorm_cdf_sub` (on `ℝ`, `W₁` is the integral of the
  absolute difference of the distribution functions), used in the Checks.

### From TauCetiRoadmap.RandomMatrices

- Section 2.5, Gaussian integration by parts: `E[Z f(Z)] = E f′(Z)` for a standard normal `Z`
  and `f` of class `C¹` with the integrability it needs. Used in 1.2.

### From TauCetiRoadmap.SpecialFunctionsEiLiErfIncompleteGamma

- Section 12.2, inequalities for the error functions: `millsRatio_bounds`, for `x ≥ 0`,
  `1/(x + √(x² + 2)) < (√π/2) e^(x²) erfc x ≤ 1/(x + √(x² + 4/π))` (DLMF 7.8.2), with Tau Ceti's
  `TauCeti.Real.erfc`. Used in the route of 2.1 at `x = w/√2`, where
  `(√π/2) e^(x²) erfc x = (1 − Φ(w))/(√2 φ(w))`.

### From TauCetiRoadmap.MathematicalStatisticsFoundations

- Section 4.4, `gaussian_integration_by_parts`: for `X` normal with mean `θ` and covariance `v I`
  on `EuclideanSpace ℝ (Fin p)`, `v > 0`, and a `C¹` field `g` in `L²` with integrable partial
  derivatives, `E[(Xᵢ − θᵢ) gᵢ(X)] = v E[∂ᵢ gᵢ(X)]`. Used in 1.2 with `p = 1`, `θ = 0`, `v = 1`.

## References

- Nathan Ross, *Fundamentals of Stein's method*, Probability Surveys 8 (2011), 210–293;
  arXiv:1109.1880, version 1. Theorem and page numbers are those of the arXiv version.
- Fraser Daly, *Upper bounds for Stein-type operators*, Electronic Journal of Probability 13
  (2008), 566–587; open at the journal. Page numbers are those of the journal.
- Larry Goldstein, *Bounds on the constant in the mean central limit theorem*, Annals of
  Probability 38 (2010), 1672–1689; arXiv:0906.5145. Attributed in prose, without a locator;
  read from its abstract.
- Attributions made in prose without a locator: Charles Stein (the method and the
  characterization, 1972 and 1986); Louis H. Y. Chen, Larry Goldstein and Qi-Man Shao, *Normal
  Approximation by Stein's Method* (2011), Lemma 2.4, to which Ross refers the proof of the bounds
  of 2.1; Larry Goldstein and Gesine Reinert (1997), A. D. Barbour (1990) and F. Götze (1991), to
  whom Daly attributes the bound `‖f_h^(j−1)‖ ≤ ‖h^(j)‖/j`.
