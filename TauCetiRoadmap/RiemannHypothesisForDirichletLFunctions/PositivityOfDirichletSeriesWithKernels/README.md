# Roadmap: positivity of Dirichlet series with kernels

**Summary.** Landau's theorem says that the real abscissa of convergence of the Laplace transform of an eventually nonnegative function is a singularity of the transform. Applied to `C e^(θu) − g`, it says that a function bounded above by `C e^(θu)` has its rightmost singularity on the real axis, with a sign. This roadmap proves that theorem, and a windowed form in which the bound is known only on windows arbitrarily far out, for the one-sided transform `Φ(s) = ∫₀^∞ g(u) e^(−su) du` of a measurable real function `g` with `∫₀^∞ |g(u)| e^(−σu) du < ∞` for every real `σ > A`, continued meromorphically to a half-plane `Re s > θ` with `θ < A`. The windowed proof is a positivity argument applied to one Taylor coefficient of `Φ` at a time: the coefficient is the integral of `g` against the Gamma kernel `u^k e^(−au)/k!`, which is small off a window. The roadmap also proves Laplace's method in several variables with the non-vanishing of the integrals it controls, the leading term of stationary phase for holomorphic phases on `ℂ^n`, and an exact stationary-phase formula over finite products of `p`-adic fields, both applied to the phase `Σ x_k + D/∏ x_k`.

The headline theorems are these. (1) If `g(u) ≤ C e^(θu)` for almost every `u ≥ u₀`, then either `Φ` has no pole in `Re s > θ` and the transform converges absolutely there, or the poles of `Φ` in `Re s > θ` have a largest real part, attained at a real pole `β` whose leading Laurent coefficient is negative, and the transform converges absolutely on `Re s > β`; so positive leading coefficients at the real poles exclude every pole. (2) The same dichotomy for the poles holds when the bound is known only on windows: it suffices that for some `δ > 0` and every `η > 0` there are arbitrarily large `U` with `∫_U^((1+δ)U) max(g, 0)(u) e^(−θu) du ≤ e^(ηU)`. Windows of bounded length do not suffice, and without a one-sided bound the conclusion fails: `e^(βu) cos(γu)` has only the nonreal poles `β ± iγ`. (3) In the variable `y = e^u` the windows are `[Y, Y^λ]` and the transform is the Mellin transform `∫₁^∞ G(y) y^(−s−1) dy`. If it converges absolutely for every real `s > A` and continues meromorphically to `Re s > θ`, and if for a fixed `λ > 1` the set of `y ≥ 1` with `G(y) ≤ C y^θ` contains intervals `[Y, Y^λ]` with `Y` arbitrarily large, then either the transform has no pole in `Re s > θ`, or its poles there have a largest real part, attained at a real pole with negative leading coefficient. (4) Laplace's method in several variables: let `E` be a finite-dimensional real normed space of dimension `n` with a Haar measure, `B` a real-bilinear form on `E` with complex values, and `c, γ > 0`; if functions `f_t` on `E`, indexed by the positive integers and measurable for large `t`, satisfy `f_t(Y/√t) → e^(−B(Y,Y))` for every `Y` as `t → ∞` and `|f_t(Y)| ≤ (1 + c‖Y‖²)^(−γt)` for all large `t`, then `Re B(Y,Y) > 0` for `Y ≠ 0`, `t^(n/2) ∫ f_t → ∫ e^(−B(Y,Y)) dY`, this limit is not zero, and so `∫ f_t ≠ 0` for all large `t`.

The transform and its convergence are the predicate `HasLaplace` of [ArithmeticDirichletSeriesPartII](../../ArithmeticDirichletSeriesPartII/README.md), whose boundary data fix the normalisation of the leading coefficient and whose counting-function transform gives the Dirichlet-series form. Landau's theorem for Dirichlet series with nonnegative coefficients is that of the completed [ArithmeticDirichletSeries](../../../Completed/ArithmeticDirichletSeries/README.md), with which the transform form agrees. Laplace's method and stationary phase in one variable are [AsymptoticExpansions](../../AsymptoticExpansions/README.md) Layers 5 and 6; Layers 7 and 8 are their analogues in several variables and over non-archimedean rings, and use no statement of them. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md) applies the one-sided and windowed theorems to sums over primes, [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) uses the window predicate, and [BesselPoincareSeriesAndGramBounds](../BesselPoincareSeriesAndGramBounds/README.md) uses Layers 7 and 8 for archimedean and local integrals.

Layer 6 first expresses the Taylor coefficients of a transform as integrals against the Gamma kernel (6.1, 6.2) and proves the classical theorem with its meromorphic, one-sided and rightmost-pole forms (6.3, 6.4). It then proves the three ingredients of the windowed theorem: one coefficient per window is bounded by positivity (6.5), a pole makes coefficients large (6.6), and a suitable expansion point exists (6.7). 6.8 is the windowed theorem for poles of any finite order, 6.9 its Mellin and Dirichlet-series forms with the window predicate, and 6.10 its agreement with Landau's theorem for Dirichlet series. Layer 7 is Laplace's method in several variables with a majorant uniform in the integer parameter, and the non-vanishing of the integrals for large parameter. Layer 8 is, over `ℂ^n`, the leading term of stationary phase for holomorphic phases with Banach-valued amplitudes and a remainder bounded by finitely many derivatives of the amplitude, with the critical data of the phase `Σ x_k + D/∏ x_k`; and, over a finite product of `p`-adic fields with a self-dual compact open subring, Gaussian integrals over admissible lattices and the exact stationary-phase formula for the same phase. Layers 7 and 8 use nothing of Layer 6.

## Conventions

Notation and conventions not restated here are those of ArithmeticDirichletSeriesPartII for Layer 6 (its Conventions, among them the ordinary one-sided Laplace transform, the inclusive counting function `S_c(X) = Σ_{1≤n≤X} c(n)` and `X^a` as `Real.rpow`, and the predicate `HasLaplace` of ArithmeticDirichletSeriesPartII §0.1). Layers 7 and 8 use only the notation of the last three rows below.

| Subject | Convention |
| --- | --- |
| Taylor coefficients (Layer 6) | For `Φ` analytic near `z`, `a_k(z) = (−1)^k Φ^(k)(z)/k!`, so that `Φ(z − t) = Σ_k a_k(z) t^k`. For a Laplace transform this makes `a_k(z) = ∫₀^∞ g(u) u^k e^(−zu)/k! du`, with no sign `(−1)^k`. |
| Gamma kernel (Layer 6) | `w_k^a(u) = u^k e^(−au)/k!` for `u > 0`, every real rate `a` and `k ∈ ℕ`; 6.1 (b) and 6.5 (a) use it at every rate `σ > A`, which may be `≤ 0`. This is notation, not a new definition. For `a > 0`, `w_k^a = a^(−k−1) · ProbabilityTheory.gammaPDFReal (k + 1) a` on `(0, ∞)`, and the lemmas of 6.2, all at positive rate, are stated for that expression; for `a ≤ 0` the kernel has infinite mass and no such form (at `a = 0`, `k = 0` it is the constant `1`, while the displayed expression vanishes, `gammaPDFReal 1 0` carrying the factor `0^1`). |
| meromorphic continuation (Layer 6) | One function `Φ : ℂ → ℂ` with `MeromorphicOn Φ {s | θ < s.re}` and `HasLaplace g s (Φ s)` for `Re s > A`. A pole is a point `ρ` with `meromorphicOrderAt Φ ρ < 0`; its order is `m = −meromorphicOrderAt Φ ρ`. Mathlib's meromorphic functions have poles of finite order only. A meromorphic function may take arbitrary values at its poles and at its removable singularities, so Layer 6 says "`Φ` has no pole in" a region, never "`Φ` is holomorphic on" it, and it uses values of `Φ` near a pole or on a circle only after passing to the normal form `toMeromorphicNFOn Φ {s | θ < s.re}` (6.1 (c)). |
| leading coefficient (Layer 6) | At a pole `ρ` of order `m`, `meromorphicTrailingCoeffAt Φ ρ`: the value `h(ρ)` in `Φ(s) = (s − ρ)^(−m) h(s)` near `ρ`, `h` analytic, `h(ρ) ≠ 0`. It depends only on `Φ` on a punctured neighbourhood of `ρ` (`meromorphicTrailingCoeffAt_congr_nhdsNE`), so `Φ` and its normal form have the same leading coefficients. This is the normalisation of the leading coefficient `A` of `PoleBoundary` (ArithmeticDirichletSeriesPartII §0.2); at a simple pole it is the residue. For real `g` the Laurent coefficients at a real pole are real (6.1 (c)); "negative leading coefficient" means a negative real number. |
| windows (Layer 6) | In the Laplace variable, `[U, λU]` with a fixed `λ > 1` (written `λ = 1 + δ`) and `U → ∞`; in the Mellin variable `y = e^u`, `[Y, Y^λ]` with `Y^λ = Real.rpow`. `g⁺ = max(g, 0)`. |
| several variables (Layer 7) | `E` is a finite-dimensional real normed space with a Haar measure `μ`, `n = dim E`; the parameter `t` runs over the positive integers, and `t → ∞` means `t → +∞`. |
| characters and measures on `ℂ` (8.1) | For `β ∈ ℂ^×`, `ψ_β(w) = exp(i Re(βw))`; these are the nontrivial continuous characters of `ℂ`. `μ_β = (|β|/2π) ·` Lebesgue measure on `ℂ = ℝ²` is the Haar measure self-dual for `ψ_β`; `ℂ^n` carries the product measure `μ_β^n` and the sup norm `‖x‖ = max_k |x_k|`, and `B(x₀, r)`, `B̄(x₀, r)` are the open and closed polydiscs. For a function on `ℂ^n = ℝ^(2n)`, `D^j` is its `j`-th real Fréchet derivative with the operator norm; for a holomorphic `g`, `∇g = (∂g/∂x_k)_k` (with the sup norm) and `D_ℂ^j g` is its `j`-th complex derivative. |
| the non-archimedean ring (8.2) | `K` is a finite product of finite extensions of fields `ℚ_p`, `𝔒 ⊂ K` a compact open subring, and `ψ : K → S¹` an additive character with `{a ∈ K : ψ(a𝔒) = 1} = 𝔒`. A *lattice* is a compact open subgroup of `(K, +)`; `L^⊥ = {a ∈ K : ψ(aL) = 1}`; `dx` is the Haar measure on `K` with `vol(𝔒) = 1`; `|a|` is the module of `a ∈ K^×`, `d(ax) = |a| dx`. Integrals over `K^m` are of locally constant functions with compact support. `𝟙` is the all-ones vector and `H_m(a) = a^(−1)(1 + 𝟙𝟙ᵀ) ∈ M_m(K)` for `a ∈ K^×`. |

## Layer 6: Landau's theorem for Laplace transforms, classical and windowed

Landau's theorem says that the real abscissa of convergence of the transform of an eventually
nonnegative function is a singularity. Applied to `C e^(θu) − g`, it says that a function bounded
above for all large `u` has its rightmost singularity on the real axis, with a sign. This layer
proves that theorem for the one-sided transform of ArithmeticDirichletSeriesPartII §0.1 and then a windowed form, in which the
bound is known only on windows `[U, (1+δ)U]` arbitrarily far out. The windowed proof expands the
transform at a far-out point `σ + iγ`, uses one Taylor coefficient per window, bounds it through
the window by positivity of the Gamma kernel, and shows that a pole right of `θ` makes the same
coefficient too large. Meromorphy of the continuation is assumed: unlike the classical case,
convergence of the transform left of its abscissa cannot be proved, since `g` is controlled only
on the windows. Growth enters only through integrability: `∫₀^∞ |g(u)| e^(−σu) du < ∞` for every
`σ > A`; no pointwise bound on `g` and no normalisation of `A` or `θ` is used.

Throughout, `g : ℝ → ℝ` is measurable and only its values on `(0, ∞)` matter; its transform is
`HasLaplace (fun u ↦ (g u : ℂ)) s (Φ s)` in the notation of ArithmeticDirichletSeriesPartII §0.1.

### 6.1 Taylor coefficients of a Laplace transform

Let `A ∈ ℝ` and let `g` be measurable with
`u ↦ g(u) e^(−σu)` integrable on `(0, ∞)` for every real `σ > A`. Then:

- (a) `HasLaplace g s (Φ s)` for every `s` with `Re s > A`, where `Φ(s) = ∫₀^∞ g(u) e^(−su) du`, and
  `Φ` is analytic on `{Re s > A}`;
- (b) for every `k ∈ ℕ` and every `z` with `Re z > A`, `u ↦ g(u) u^k e^(−zu)` is integrable on
  `(0, ∞)` and
  ```text
  a_k(z) = (−1)^k Φ^(k)(z)/k! = ∫₀^∞ g(u) u^k e^(−zu)/k! du ;
  ```
  in particular `a_k(σ)` is real for real `σ > A`, and `|a_k(σ + iγ)| ≤ ∫₀^∞ |g| w_k^σ` for real `γ`;
- (c) `Φ(s̄) = conj Φ(s)` on `Re s > A`, and `|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du` on `Re s ≥ σ′ > A`.
  Let `Φ̃` be meromorphic on `{Re s > θ}`, `θ < A`, with `Φ̃(s) = Φ(s)` on `Re s > A`, and let
  `Φ̂ = toMeromorphicNFOn Φ̃ {Re s > θ}` be its normal form. Then the poles of `Φ̃` lie in
  `θ < Re s ≤ A` and form a closed discrete subset of `{Re s > θ}`; `Φ̂` has the same poles, orders
  and leading coefficients as `Φ̃`, is analytic at every other point of the half-plane, and equals
  `Φ` on `Re s > A`; the set of poles is invariant under `s ↦ s̄`, `Φ̂(s̄) = conj Φ̂(s)` at every
  point that is not a pole, and at a real pole every Laurent coefficient is real.

*Proof sketch.* (a), (b): induction on `k`, differentiating under the integral sign
(`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) on the disc of radius `r = (Re z₀ − A)/2` about
`z₀`; on it `|g(u) u^(k+1) e^(−zu)| ≤ C_k |g(u)| e^(−(A + r/2)u)`, which is integrable, and
`(d/dz)(u^k e^(−zu)/k!) = −(k + 1) u^(k+1) e^(−zu)/(k + 1)!`. (c): conjugation under the integral and
`|e^(−su)| = e^(−σu)`. On `Re s > A` the continuation equals the analytic `Φ`, so it has no pole
there, and the normal form does not change values at points of analyticity; Mathlib gives
discreteness of the poles, analyticity of the normal form off them, and equality of punctured germs
(hence of orders and leading coefficients). The function `s ↦ conj Φ̂(s̄)` is meromorphic in normal
form on the half-plane and agrees with `Φ̂` on `Re s > A`; by the identity theorem on the connected
complement of the discrete pole set the two agree off the poles, so the poles and their Laurent
expansions are symmetric, and at a real pole the coefficients are real.
*Needs:* ArithmeticDirichletSeriesPartII §0.1; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `MeromorphicOn`,
`meromorphicOrderAt`, `toMeromorphicNFOn` and its API, `meromorphicTrailingCoeffAt_congr_nhdsNE`, the
identity theorem.

**Checks.**

- `g = 1`: `Φ(s) = 1/s` on `Re s > 0` and `a_k(z) = z^(−k−1)`, which is `∫₀^∞ u^k e^(−zu)/k! du`. A
  convention without the sign `(−1)^k` would give `(−1)^k z^(−k−1)`.
- `g(u) = e^(Au)` has a pole at `s = A` on the boundary line: the bound on poles is `Re ρ ≤ A`, not
  `Re ρ < A`.
- For `g = 1` (`A = 0`) and `θ = −1`, the function `Φ̃` equal to `1/s` except at `s = −1/2`, where it
  is `0`, is meromorphic on `Re s > −1` and equals `Φ` on `Re s > 0`; it has no pole at `−1/2` but is
  not analytic there, and its normal form is `1/s`. "No pole" is the property that passes to the
  normal form; "holomorphic" is not.

### 6.2 The Gamma kernel

The kernel `w_k^a(u) = u^k e^(−au)/k!` of the Conventions, at a positive rate. Let `a > 0` and `k ∈ ℕ`; then
`w_k^a(u) = a^(−k−1) gammaPDFReal (k + 1) a u` for `u > 0`.

- (a) *Mass.* `∫₀^∞ w_k^a(u) du = a^(−k−1)`.
- (b) *Supremum and shift.* `0 ≤ w_k^a(u) ≤ a^(−k)` for `u ≥ 0`; and `w_k^(a′)(u) = e^(−bu) w_k^(a′−b)(u)` for all
  real `a′` and `b` (the kernel at every rate of the Conventions), so that a kernel at any rate is an exponential
  times one at a positive rate.
- (c) *Profile.* Put `φ(t) = t e^(1−t)` for `t > 0`. For `k ≥ 1` and `t > 0`,
  `w_k^a(tk/a) ≤ a^(−k) φ(t)^k`.
- (d) *Supremum off a window.* For `λ > 1` put
  ```text
  q_λ = max( φ(λ^(−1/2)), φ(λ^(1/4)) ) < 1,      U_λ(τ) = 1/(τ λ^(1/2) (λ^(1/4) − 1)) .
  ```
  For `τ ≥ 1` and `U ≥ U_λ(τ)` the integer `k = ⌈τ λ^(1/2) U⌉` satisfies `k ≥ U` and
  ```text
  w_k^τ(u) ≤ τ^(−k) q_λ^k      for every u > 0 with u ∉ [U, λU] .
  ```

*Proof sketch.* (a) is `Γ(k + 1) = k!` (`Real.integral_rpow_mul_exp_neg_mul_Ioi`), equivalently the
total mass `1` of the Gamma density (`lintegral_gammaPDF_eq_one`). (b) is `(au)^k/k! ≤ e^(au)`
(`Real.pow_div_factorial_le_exp`). (c): `w_k^a(tk/a) = a^(−k) t^k k^k e^(−tk)/k!` and `k! ≥ (k/e)^k`
(the same lemma at `x = k`). (d): `φ` increases on `(0, 1]`, decreases on `[1, ∞)` and is `< 1` off
`t = 1`, so `q_λ < 1`. Write `u = tk/τ`. Since `k ≥ τλ^(1/2)U`, `u < U` gives `t < λ^(−1/2)`; since
`k ≤ τλ^(1/2)U + 1 ≤ τλ^(3/4)U` (this is `U ≥ U_λ(τ)`), `u > λU` gives `t > λ^(1/4)`; in both cases
(c) gives `w_k^τ(u) ≤ τ^(−k) q_λ^k`. Finally `k ≥ τλ^(1/2)U ≥ U` as `τ ≥ 1`.
*Needs:* Mathlib `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.pow_div_factorial_le_exp`,
`ProbabilityTheory.gammaPDFReal`, `ProbabilityTheory.lintegral_gammaPDF_eq_one`.

**Checks.**

- `λ = 4`: `φ(1/2) = e^(1/2)/2 ≈ 0.824` and `φ(√2) = √2 e^(1−√2) ≈ 0.935`, so `q_4 ≈ 0.935`, and
  `U_4(1) = 1/(2(√2 − 1)) ≈ 1.21`.
- At `λ = 1` the construction breaks: `φ(1) = 1`, so off a window of ratio one only the trivial
  supremum `τ^(−k)` of (b) is available. The ratio `λ > 1` is what makes the kernel small off the
  window.
- (a) at `k = 0` is `∫₀^∞ e^(−au) du = 1/a`; (c) is an equality up to the factor `k^k e^(−k)/k!`
  at `t = 1`, where the kernel has its maximum `w_k^a(k/a)`.

### 6.3 Landau's theorem

Let `a ∈ ℝ`, `u₀ ≥ 0`, and let
`f : ℝ → ℝ` be measurable with `f(u) ≥ 0` for almost every `u ≥ u₀` and `HasLaplace f s (F s)` for
every `s` with `Re s > a`. If there are `r > 0` and `F₁` analytic on the ball `B(a, r)` with
`F₁(s) = F(s)` for `s ∈ B(a, r)` with `Re s > a`, then there is `a′ < a` such that `HasLaplace f s`
holds for every `s` with `Re s > a′`, and its value equals `F₁(s)` on `B(a, r) ∩ {Re s > a′}`.
Equivalently: if the infimum `σ_c` of the real `σ` at which `u ↦ f(u) e^(−σu)` is integrable is
finite, then `F` has no analytic continuation to a neighbourhood of `σ_c`.

*Proof sketch.* The part of `f` on `(0, u₀)` has an entire transform (it is integrable there), so
assume `f ≥ 0` almost everywhere. Choose real `b ∈ (a, a + r/2)`; `F` and `F₁` together are analytic
on the disc `B(b, r − (b − a))`, which reaches left of `a`. Its Taylor series at `b` is
`Σ_k a_k(b) t^k` with `a_k(b) = ∫ f(u) u^k e^(−bu)/k! du ≥ 0` (6.1 (b)). For real
`t ∈ (b − a, r − (b − a))` exchange sum and integral by monotone convergence:
`Σ_k a_k(b) t^k = ∫ f(u) e^(−(b−t)u) du < ∞`, so `f(u) e^(−σu)` is integrable at `σ = b − t < a`.
The values agree by analytic continuation.
*Needs:* 6.1; Mathlib `MeasureTheory.lintegral_tsum`, `DifferentiableOn.hasFPowerSeriesOnBall`.

**Checks.**

- `f = 1`: `F = 1/s` is singular at `σ_c = 0`. `f(u) = e^(−u)`: `F = 1/(s + 1)` is analytic at
  `0`, and indeed the transform converges on `Re s > −1`.
- The sign hypothesis is needed: `f(u) = sin u` has `F(s) = 1/(s² + 1)`, analytic at `0`, while
  `∫₀^∞ |sin u| e^(−σu) du` diverges at `σ = 0`, so `σ_c = 0` is not a singularity.

### 6.4 Meromorphic and one-sided forms

(a) Let `f` be as in 6.3
(eventually nonnegative, transform `F` on `Re s > a`) and let `b < a`. If `F₂` is meromorphic on
`{Re s > b}`, `F₂ = F` on `Re s > a`, and `F₂` has no pole on the real segment `(b, a]`, then
`F₂` has no pole in `Re s > b`, `HasLaplace f s` holds for every `s` with `Re s > b`, and its value
is that of the normal form of `F₂` (6.1 (c)), which equals `F₂` wherever `F₂` is analytic.

In (b)–(d), let `θ < A`, let `g` be measurable with `HasLaplace g s (Φ s)` for `Re s > A`, and let
`Φ` be meromorphic on `{Re s > θ}`.

(b) *Positive leading
coefficients exclude poles.* Suppose `g(u) ≤ C e^(θu)` for almost every `u ≥ u₀`, for some real `C`
and `u₀`. If `meromorphicTrailingCoeffAt Φ β > 0` at every real pole `β ∈ (θ, A]` of `Φ` (in
particular, if `Φ` has no real pole there), then `Φ` has no pole in `Re s > θ`, `HasLaplace g s`
holds for every `s` with `Re s > θ`, and `∫₀^∞ |C e^(θu) − g(u)| e^(−σu) du < ∞` for every real
`σ > θ`.

(c) *The rightmost pole is real.* Under the
one-sided bound of (b), without the condition on signs, exactly one of the following holds:

- (i) `Φ` has no pole in `Re s > θ`, and `HasLaplace g s` holds for every `s` with `Re s > θ`;
- (ii) `Φ` has a real pole `β > θ` such that every pole `ρ` of `Φ` in `Re s > θ` has `Re ρ ≤ β`,
  the leading coefficient `meromorphicTrailingCoeffAt Φ β` is a negative real number, and
  `HasLaplace g s` holds for every `s` with `Re s > β`.

Stated as `rightmost_pole_real_of_le` in `Suggested.lean`.

(d) *Lower bounds.* If instead `g(u) ≥ −C e^(θu)` for almost every `u ≥ u₀`, then (b) and (c) hold
with the signs of the leading coefficients reversed: negative leading coefficients at the real
poles in `(θ, A]` exclude every pole in `Re s > θ`, and otherwise the rightmost pole is real with
positive leading coefficient.

*Proof sketch.* (a): let `σ_c` be the abscissa of `f`; the transform is analytic on `Re s > σ_c` and
equals `F₂` there off the poles (identity theorem). If `σ_c > b`, the normal form of `F₂` is
analytic at the real point `σ_c`, contradicting 6.3; so `σ_c ≤ b`, and a pole in `Re s > b`
would be a point where `F₂` agrees off a discrete set with an analytic function. (c): apply (a)
and 6.3 to `h = C e^(θu) − g`, eventually nonnegative, with transform `H(s) = C/(s − θ) − Φ(s)`,
meromorphic on `Re s > θ` with the poles of `Φ`. If its abscissa is `≤ θ`, (i) holds. Otherwise the
abscissa `β > θ` is a singularity of `H` (6.3), hence a real pole of `Φ`, and `H`, `Φ` have no pole
in `Re s > β`. For real `σ ↓ β`, `H(σ) = ∫₀^(u₀) h e^(−σu) + ∫_(u₀)^∞ h e^(−σu)` is bounded below,
while `H(σ) ~ c_H (σ − β)^(−m)` with `c_H` real and nonzero (6.1 (c)); so `c_H > 0`, and the leading
coefficient of `Φ` at `β` is `−c_H`. (b): the sign condition excludes (c)(ii); then (c)(i) and (a)
for `h` give the convergence, which is absolute since `HasLaplace` includes integrability. (d) is
(b) and (c) for `−g`.
*Needs:* 6.1, 6.3.

**Checks.**

- `g(u) = −e^(βu)`, `θ < β ≤ A`: case (c)(ii) with leading coefficient `−1`. So in (b) the sign
  condition cannot be dropped.
- `g(u) = −u e^(βu)`, `θ < β < A`: `Φ(s) = −(s − β)^(−2)` has residue `0` and leading coefficient
  `−1`: the sign is carried by the leading coefficient, not by the residue.
- `g(u) = e^(βu) cos(γu)`, `γ ≠ 0`, is not bounded above by `C e^(θu)` for `θ < β`, and its transform
  `(s − β)/((s − β)² + γ²)` has only the nonreal poles `β ± iγ`: the one-sided bound is needed.

### 6.5 Coefficient inequalities on a window

Let `g` be as in 6.1 with
transform `Φ` on `Re s > A`, `σ > A` real, `γ` real and `k ∈ ℕ`.

- (a) *Positivity.* `|a_k(σ + iγ)| + a_k(σ) ≤ 2 ∫₀^∞ g⁺(u) w_k^σ(u) du`.
- (b) *One index per window.* Let `A′ > A`, `I = ∫₀^∞ |g(u)| e^(−A′u) du`, `λ > 1` with `q_λ` and
  `U_λ` as in 6.2 (d), `θ′ < A′`, and
  ```text
  σ ≥ max( A′ + 1, (A′ − q_λ θ′)/(1 − q_λ) ) .
  ```
  Then for every `U ≥ U_λ(σ − A′)` the integer `k = ⌈(σ − A′) λ^(1/2) U⌉` satisfies `k ≥ U` and, for
  every real `γ`,
  ```text
  |a_k(σ + iγ)| + a_k(σ) ≤ 2 (σ − θ′)^(−k) ( ∫_U^(λU) g⁺(u) e^(−θ′u) du + I ) .
  ```

*Proof sketch.* (a): `|a_k(σ + iγ)| ≤ ∫ |g| w_k^σ` (6.1 (b), `|e^(−iγu)| = 1`) and
`a_k(σ) = ∫ g w_k^σ`, and `|g| + g = 2g⁺`. This is the positivity of `1 + cos`, applied to one Taylor
coefficient. (b): split the integral of (a). On `[U, λU]`,
`w_k^σ(u) = e^(−θ′u) w_k^(σ−θ′)(u) ≤ e^(−θ′u) (σ − θ′)^(−k)` (6.2 (b); `σ > θ′` because `σ > A′ > θ′`).
Off it, `g⁺ ≤ |g|` and `w_k^σ(u) = e^(−A′u) w_k^(σ−A′)(u) ≤ e^(−A′u) (σ − A′)^(−k) q_λ^k` (6.2 (d) with
`τ = σ − A′ ≥ 1`), so that part is at most `2I (σ − A′)^(−k) q_λ^k`. The condition on `σ` is
`q_λ(σ − θ′) ≤ σ − A′`, that is `q_λ^k (σ − A′)^(−k) ≤ (σ − θ′)^(−k)`. Only the supremum of the
kernel is used on the window; off the window only its supremum there.
*Needs:* 6.1, 6.2.

**Checks.**

- For `g ≥ 0` and `γ = 0`, (a) is an equality: the constant `2` is sharp.
- For `g = −1` the right side of (a) is `0`; at `γ = 0` the left side is `0` too, and for `γ ≠ 0` it
  is `|σ + iγ|^(−k−1) − σ^(−k−1) < 0`.
- (a) holds at rates `σ ≤ 0`, with the kernel of the Conventions at every real rate: for `A = −1`,
  `g = 1_(0,1)`, `σ = 0`, `γ = 0` and `k = 0`, `a_0(0) = ∫₀¹ du = 1` and the inequality reads `2 ≤ 2∫₀¹ w_0^0 = 2`,
  with `w_0^0 ≡ 1`; a kernel read as `a^(−k−1)·gammaPDFReal (k + 1) a` would be `0` at rate `0` and give `2 ≤ 0`. Only
  (b), at the positive rates `σ − θ′` and `σ − A′`, uses 6.2.

### 6.6 Taylor coefficients near a pole

Let `z ∈ ℂ` and `r > 0`.

- (a) *Cauchy.* If `Φ` is analytic on `B(z, r)` and `0 < r′ < r`, there is `M` with
  `|a_k(z)| ≤ M r′^(−k)` for all `k`.
- (b) *Pole of finite order.* Let `ρ ∈ B(z, r)`, `ρ ≠ z`, let `Φ` be analytic on `B(z, r) ∖ {ρ}`,
  and let `ρ` be a pole of order `m ≥ 1` with principal part `Σ_{j=1}^m c_j (s − ρ)^(−j)`, `c_m ≠ 0`.
  Then for `0 < r′ < r` there is `M` with
  `|a_k(z) − Σ_{j=1}^m c_j C(k+j−1, j−1) (z − ρ)^(−k−j)| ≤ M r′^(−k)` for all `k`.
  If `d = |z − ρ| < r′`, there is `k₀` with `|a_k(z)| ≥ ½ |c_m| d^(−k−m)` for `k ≥ k₀`. If moreover
  `z` and `ρ` are real, `z > ρ`, the `c_j` are real and `c_m > 0`, then `Re a_k(z) ≥ ½ c_m d^(−k−m)`
  for `k ≥ k₀`.

*Proof sketch.* (a) is `norm_cauchyPowerSeries_le` on the circle of radius `r′`. (b): `Φ` minus its
principal part extends analytically to `B(z, r)` (removable singularity); apply (a). The `k`-th
coefficient of `(s − ρ)^(−j)` at `z` is `(−1)^k (d/ds)^k (s − ρ)^(−j)/k! = C(k+j−1, j−1)(z − ρ)^(−k−j)`.
For the lower bound, `C(k+j−1, j−1)/C(k+m−1, m−1) → 0` for `j < m`, so the main term is at least
`(3/4)|c_m| C(k+m−1, m−1) d^(−k−m) ≥ (3/4)|c_m| d^(−k−m)` for large `k`, and `(r′/d)^k` grows
geometrically; in the real case the main term is real and positive, so the same bound holds for the
real part of `a_k(z)` (the analytic remainder need not be real at `z`).
*Needs:* Mathlib `norm_cauchyPowerSeries_le`, `deriv_zpow`, removable singularities; Tau Ceti
`TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (finite principal part at a meromorphic
point).

**Checks.**

- `Φ(s) = 1/(s − ρ)` (`m = 1`, `c_1 = 1`): `a_k(z) = (z − ρ)^(−k−1)` exactly, so (b) holds with
  `M = 0`; the simple-pole case needs no separate statement.
- `Φ(s) = (s − ρ)^(−2)`: `a_k(z) = (k + 1)(z − ρ)^(−k−2)`; dropping the binomial factor gives
  `(z − ρ)^(−k−2)`, and dropping `(−1)^k` in `a_k` gives alternating signs.

### 6.7 Choosing the expansion point

Let `θ₀ < θ < σ` be real and let `Z` be a closed
discrete subset of `{Re s > θ₀}` (every point of the half-plane has a neighbourhood meeting `Z` in
finitely many points) with `Re ρ < σ` for every `ρ ∈ Z` and `Z ∩ {Re s > θ} ≠ ∅`. Then:

- (local finiteness) `Z ∩ B̄(w, r)` is finite whenever `B̄(w, r) ⊆ {Re s > θ₀}`;
- (dichotomy) either
  - (A) there are a real `γ`, a point `ρ ∈ Z` and `0 < d < r ≤ σ − θ` with `|σ + iγ − ρ| = d`,
    `Z ∩ B(σ + iγ, r) = {ρ}` and `Z ∩ B(σ, r) = ∅`; or
  - (B) there are a real `β ∈ Z` with `β > θ` and `r` with `σ − β < r ≤ σ − θ`, `Z ∩ B(σ, r) = {β}`,
    and `Re ρ ≤ β` for every `ρ ∈ Z`.

*Proof sketch.* Local finiteness: a closed disc in the half-plane is compact. Let
`F = Z ∩ B̄(σ, σ − θ)`, finite. If `F = ∅`, take `D = σ − θ` and any `ρ₁ ∈ Z` with `Re ρ₁ > θ`.
Otherwise let `D = dist(σ, Z) ≤ σ − θ`, so `Z ∩ B(σ, D) = ∅`. If some `ρ₁ ∈ Z` has `σ − Re ρ₁ < D`,
we are in the situation of (A) below. If none has, a point of `Z` at distance `D` from `σ` with
`σ − Re w ≥ D` is the real point `σ − D`; so the nearest point is the real `β = σ − D`, unique at
its distance, and finiteness gives `r`: this is (B), and every `w ∈ Z` has `Re w ≤ β`. For (A):
put `ε = min(D − (σ − Re ρ₁), σ − D − θ₀)/2 > 0`, `c₀ = σ + i Im ρ₁`, and let `F′ = Z ∩ B̄(c₀, D + ε)`,
finite. For two distinct points `p, p′` with real parts `< σ` there is at most one real `γ` with
`|σ + iγ − p| = |σ + iγ − p′|` (none if `Im p = Im p′`); choose `γ ∈ (Im ρ₁ − ε, Im ρ₁ + ε)` outside
these finitely many values, let `ρ` be the point of `F′` nearest to `σ + iγ` (unique), and `r` the
minimum of `D` and the next distance. Then `|σ + iγ − ρ| < D − ε`, and every point of `Z` in
`B(σ + iγ, r)` lies in `F′`.
*Needs:* Mathlib compactness of closed balls, finiteness of discrete subsets of compact sets.

**Checks.**

- `Z = {β + iγ₀, β − iγ₀}`, `γ₀ ≠ 0`, `θ < β < σ`: the two points are equidistant from `σ`, case (B)
  is impossible, and a shift `γ` near `γ₀` makes `β + iγ₀` the unique nearest point: case (A).
- `Z = {β}` real: case (B); case (A) would need a point `ρ₁` with `σ − Re ρ₁ < dist(σ, Z) = σ − β`.

### 6.8 The windowed Landau theorem

Let `θ < A` and `δ > 0`, let `g : ℝ → ℝ` be
measurable, and let `Φ` be meromorphic on `{Re s > θ}` with `HasLaplace g s (Φ s)` for `Re s > A`;
equivalently, since `HasLaplace` includes integrability (ArithmeticDirichletSeriesPartII §0.1), `∫₀^∞ |g(u)| e^(−σu) du < ∞` for
every real `σ > A` and `Φ(s) = ∫₀^∞ g(u) e^(−su) du` on `Re s > A`. Suppose that for every `η > 0`
and every `U₀` there is `U ≥ U₀` with
```text
∫_U^((1+δ)U) g⁺(u) e^(−θu) du ≤ e^(ηU) .
```
Then either `Φ` has no pole in `Re s > θ`, or `Φ` has a real pole `β > θ` such that every pole `ρ`
of `Φ` in `Re s > θ` has `Re ρ ≤ β` and `meromorphicTrailingCoeffAt Φ β` is a negative real number.
In particular, if the leading coefficient of `Φ` at every real pole in `(θ, A]` is positive (or
there is no real pole there), `Φ` has no pole in `Re s > θ`. Stated as `windowedLandau` in
`Suggested.lean`.

*Corollary (simple poles).* If every pole of `Φ` in `Re s > θ` is simple, the leading coefficient
is the residue: either `Φ` has no pole in `Re s > θ`, or its poles there have a largest real part,
attained at a real pole with negative residue.

The windows are needed only along some sequence `U → ∞`, which may depend on `η`; the ratio
`1 + δ` is fixed but arbitrary. Every pole has finite order, since `Φ` is meromorphic.

*Proof sketch.*

1. *Reductions.* Replace `Φ` by its normal form on `{Re s > θ}` (6.1 (c)): it has the same poles,
   orders and leading coefficients, is analytic off the poles, and is the transform on `Re s > A`.
   Suppose `Φ` has a pole `ρ₀` with `Re ρ₀ > θ`, and fix `θ′ ∈ (θ, Re ρ₀)`. Since
   `e^(−θ′u) ≤ e^(−θu)` for `u ≥ 0`, the window hypothesis holds at `θ′`. The set `Z` of poles in
   `Re s > θ` is closed and discrete there and lies in `Re s ≤ A` (6.1 (c)).
2. *Parameters.* Put `λ = 1 + δ`, fix `A′ > A`, put `I = ∫₀^∞ |g| e^(−A′u) < ∞`, and fix a real
   `σ ≥ max(A′ + 1, (A′ − q_λθ′)/(1 − q_λ))`; then `σ > A ≥ Re ρ` for every `ρ ∈ Z`. By 6.5 (b), for
   every `η > 0` and every window `U ≥ U_λ(σ − A′)` satisfying the hypothesis at `θ′`, the index
   `k = k(U) ≥ U` satisfies, for every real `γ`,
   `|a_k(σ + iγ)| + a_k(σ) ≤ 2 (e^(ηU) + I)(σ − θ′)^(−k)`.
3. *The dichotomy.* Apply 6.7 to `Z` with `(θ₀, θ) := (θ, θ′)`; its discs lie in `Re s > θ`, where
   `Φ` is meromorphic.
4. *Case (A) is impossible.* Let `ρ` have order `m` and leading coefficient `c_m ≠ 0`, put
   `z = σ + iγ` and `r′ = (d + r)/2`, so `d < r′ < r ≤ σ − θ′`. By 6.6 (b) at `z`,
   `|a_k(z)| ≥ ½ |c_m| d^(−k−m)` for `k ≥ k₀`; by 6.6 (a) at `σ` (no pole in `B(σ, r)`),
   `a_k(σ) ≥ −M′ r′^(−k)`. With step 2 and `(σ − θ′)^(−k) ≤ r′^(−k)`, multiplying by `r′^k` gives
   `½ |c_m| d^(−m) (r′/d)^k ≤ M′ + 2(e^(ηU) + I)`. Take `η = ½ log(r′/d) > 0`: since `k ≥ U`, the left
   side is at least `½ |c_m| d^(−m) e^(2ηU)`, which exceeds the right side for the arbitrarily large
   `U` that the hypothesis provides.
5. *Case (B) forces a negative coefficient.* Here `β` is real, `β > θ′ > θ`, every pole has real
   part `≤ β`, and the Laurent coefficients at `β` are real (6.1 (c)). If `c_m > 0`, 6.6 (b) at
   `z = σ` gives `Re a_k(σ) ≥ ½ c_m d^(−k−m)` with `d = σ − β`, and `a_k(σ)` is real (6.1 (b)), so
   `|a_k(σ)| + a_k(σ) ≥ c_m d^(−k−m)`, and step 2 at `γ = 0` gives the contradiction of step 4.
   Hence `c_m < 0`.

The simple-pole corollary is the case `m = 1`, where `c_1` is the residue.
*Needs:* 6.1, 6.2 (d), 6.5 (b), 6.6, 6.7.

*Source.* [FormalProof], for simple poles with positive residues at the real poles and under a
pointwise growth bound.

**Checks.**

- *Bounded windows do not suffice.* `g(u) = e^(βu) cos(γu)`, `γ > 0`, `θ < β ≤ A`: the transform
  `(s − β)/((s − β)² + γ²)` has simple poles at `β ± iγ` and no real pole, and `g ≤ 0` on every
  `[U_j, U_j + π/γ]`, `U_j = (2j + ½)π/γ`. These windows satisfy the integral bound, the conclusion
  fails, and they are not of the form `[U, (1+δ)U]`.
- *The sign condition cannot be dropped.* `g(u) = −e^(βu)`, `θ < β ≤ A` (the integrability
  hypothesis forces `β ≤ A`): every window satisfies the bound (`g⁺ = 0`), and `Φ = −1/(s − β)` has
  a real pole with leading coefficient `−1`.
- *Coexisting poles.* `g(u) = −e^u + 2e^(bu) cos(cu)` with `θ < b < 1 ≤ A` and `c ≠ 0`: `g(u) < 0` for
  large `u`, so every far window satisfies the bound; the poles `1` (leading coefficient `−1`) and
  `b ± ic` all lie in `Re s > θ`, and the rightmost one is the real pole with negative coefficient,
  as the theorem says.
- *Higher order.* `g(u) = −u e^(βu)`, `θ < β < A`: `Φ = −(s − β)^(−2)`, the windows hold since
  `g ≤ 0`, and the conclusion holds with leading coefficient `−1` and residue `0`; a version phrased
  with residues would be false here. For `g(u) = u e^(βu)` the leading coefficient is `+1`, so the
  window hypothesis must fail, and it does: `∫_U^((1+δ)U) u e^((β−θ)u) du` grows exponentially in `U`.
- *Integrability, not pointwise growth.* `g(u) = u e^(Au)` satisfies the hypothesis at `A`
  (`∫|g| e^(−σu) < ∞` for `σ > A`) but no bound `|g(u)| ≤ C₀ e^(Au)`; this is the growth of
  `G(y) = y log y` in the Mellin variable.
- *The classical theorem is the case of one infinite window.* If `g(u) ≤ C e^(θu)` for all `u ≥ u₀`,
  every `[U, (1+δ)U]` with `U ≥ u₀` satisfies `∫ g⁺ e^(−θu) ≤ C⁺ δ U ≤ e^(ηU)` for large `U`, and the
  conclusion is that of 6.4 (c) (without its convergence statement).

### 6.9 Windows of scales, the Mellin form and the Dirichlet-series form

(a) *Windows of scales.* For `S ⊆ ℝ` and `λ > 1`, `HasWindows S λ` means: for
every `Y₀` there is `Y ≥ max(Y₀, 1)` with `Set.Icc Y (Y ^ λ) ⊆ S`. API:

- monotone in `S`; for `1 < λ′ ≤ λ`, `HasWindows S λ` gives `HasWindows S λ′`;
- `HasWindows (Set.Ici x₀) λ` for every `x₀` and `λ > 1`;
- if `HasWindows S λ` and `S ∩ Set.Ici x₀ ⊆ S′`, then `HasWindows S′ λ`.

The predicate is `HasWindows` of `Suggested.lean`.

(b) *Mellin form.* Let `G : ℝ → ℝ` be measurable with
`∫₁^∞ |G(y)| y^(−σ−1) dy < ∞` for every real `σ > A`, and `Ψ(s) = ∫₁^∞ G(y) y^(−s−1) dy` for
`Re s > A`. Then `g(u) = G(e^u)` satisfies `∫₀^∞ |g(u)| e^(−σu) du = ∫₁^∞ |G(y)| y^(−σ−1) dy`,
`HasLaplace g s (Ψ s)` for `Re s > A`, and
`∫_U^(λU) g⁺(u) e^(−θu) du = ∫_(e^U)^(e^(λU)) G⁺(y) y^(−θ−1) dy`. Consequently, if `Ψ` continues
meromorphically to `Re s > θ` (`θ < A`) and, for some `λ > 1` and every `η > 0`, there are
arbitrarily large `Y` with `∫_Y^(Y^λ) G⁺(y) y^(−θ−1) dy ≤ Y^η`, the conclusion of 6.8 holds for
`Ψ`. This mean hypothesis holds in particular when `HasWindows {y ≥ 1 | G(y) ≤ C y^θ} λ` for some
real `C`. Stated, with this hypothesis, as `windowedLandau_mellin` in `Suggested.lean`.

(c) *Dirichlet-series form.* Let `A ≥ 0` and
`c : ℕ → ℝ` with `Σ_n |c(n)| n^(−σ) < ∞` for every `σ > A`, sum `F(s)` on `Re s > A`, and
`S_c(y) = Σ_{1≤n≤y} c(n)` (the counting function of the Conventions of ArithmeticDirichletSeriesPartII). Then
`∫₁^∞ |S_c(y)| y^(−σ−1) dy ≤ σ^(−1) Σ_n |c(n)| n^(−σ)` for `σ > A`, `∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s`
on `Re s > A`, and (b) applies to `G = S_c`, `Ψ = F/s`: if `F/s` continues meromorphically to
`Re s > θ` and `HasWindows {y ≥ 1 | S_c(y) ≤ C y^θ} λ`, then either `F/s` has no pole in `Re s > θ`
or its rightmost pole there is real with negative leading coefficient.

*Proof sketch.* (a): `Y^λ′ ≤ Y^λ` for `Y ≥ 1`; `[Y, Y^λ] ⊆ [x₀, ∞)` once `Y ≥ max(x₀, 1)`. (b): the
substitution `y = e^u` on `(0, ∞)` (`integral_comp_exp_Ioi`, `integrableOn_comp_exp_Ioi`); windows
`[U, λU]` become `[Y, Y^λ]` and `e^(ηU) = Y^η`; then 6.8 with `δ = λ − 1`. On a window of
`{G ≤ C y^θ}`, `∫_Y^(Y^λ) G⁺ y^(−θ−1) ≤ C⁺(λ − 1) log Y ≤ Y^η` for large `Y`. (c): Tonelli,
`∫₁^∞ |S_c(y)| y^(−σ−1) dy ≤ Σ_n |c(n)| ∫_n^∞ y^(−σ−1) dy = σ^(−1) Σ_n |c(n)| n^(−σ)`. For the
transform, apply ArithmeticDirichletSeriesPartII §4.1 as stated to `c⁺ = max(c, 0)` and `c⁻ = max(−c, 0)`, which are nonnegative with
absolutely convergent series on `Re s > A ≥ 0`: it gives `HasLaplace` of `S_(c^±)(e^t)` with values
`F^±(s)/s`, and `S_c = S_(c⁺) − S_(c⁻)`, `F = F⁺ − F⁻`, so additivity and scalar multiplication of
`HasLaplace` (ArithmeticDirichletSeriesPartII §0.1) and the substitution `y = e^u` give `∫₁^∞ S_c(y) y^(−s−1) dy = F(s)/s`.
*Needs:* 6.8; ArithmeticDirichletSeriesPartII §§0.1, 4.1; Mathlib `MeasureTheory.integral_comp_exp_Ioi` and
`MeasureTheory.integrableOn_comp_exp_Ioi` (the substitution `y = e^u` on `Ioi a`).

**Checks.**

- A set containing `[Y, 2Y]` for arbitrarily large `Y` need not have windows of any exponent
  `λ > 1`: `⋃_{j≥1} [2^(2^j), 2^(2^j + 1)]` contains no `[Y, Y^λ]` with `Y^(λ−1) > 2`, since its intervals are
  disjoint (`2^j + 1 < 2^(j+1)` for `j ≥ 1`) and a window inside `[2^(2^j), 2^(2^j+1)]` has `Y^λ ≤ 2Y`. The index must
  start at `1`: with `j = 0` the union contains `[2, 4] ∪ [4, 8] = [2, 8] = [Y, Y³]` at `Y = 2`, where `Y^(λ−1) = 4`.
- `HasWindows S λ` uses multiplicative windows `[Y, Y^λ]`, not `[Y, λY]`; the second are the
  bounded windows of the first Check of 6.8.
- `c(n) = log n`, `A = 1`: `S_c(y) ∼ y log y` admits no bound `C₀ y^A`, and (b) applies since
  `∫₁^∞ y log y · y^(−σ−1) dy = (σ − 1)^(−2)` for `σ > 1`.

### 6.10 Agreement with Landau's theorem for Dirichlet series

Let `c n ≥ 0` for all `n` and suppose the
abscissa of absolute convergence `σ_a` of `Σ c(n) n^(−s)` is a positive real number. Then the
infimum of the real `σ` at which the transform of `α(t) = S_c(e^t)` (ArithmeticDirichletSeriesPartII §4.1) converges is `σ_a`, the
transform is `F(s)/s` on `Re s > σ_a`, and 6.3 shows that `F` has no analytic continuation to a
neighbourhood of `σ_a`. This is Landau's theorem of completed ArithmeticDirichletSeries 8.1 (Tau Ceti
`TauCeti.LSeries.landau`) for `σ_a > 0`; the cases `σ_a ≤ 0` remain that theorem's alone, since
ArithmeticDirichletSeriesPartII §4.1 needs `Re s > 0`.

*Proof sketch.* Tonelli: `∫₀^∞ α(t) e^(−σt) dt = σ^(−1) Σ c(n) n^(−σ)` for real `σ > 0`, finite or
not, so the transform converges at a real `σ > 0` exactly when the series does, and the two
infima agree; at `σ_a > 0`, `F/s` and `F` are analytic together. The series may converge at
`σ_a` itself (`c(n) = n^(σ_a − 1)/log²(n + 1)`), so the statement is about the infimum, not about
the half-plane of convergence.
*Needs:* 6.3; ArithmeticDirichletSeriesPartII §4.1; completed ArithmeticDirichletSeries 8.1 for the comparison.

**Checks.**

- `c n = 1`: `σ_a = 1`, `F = ζ`, and `ζ(s)/s` is singular at `1`.
- `c(n) = n^(σ_a − 1)/log²(n + 1)`, `σ_a > 0`: the series and the transform both converge at
  `σ = σ_a` and at no real `σ < σ_a`; the infimum is attained.

### Examples

- The model transforms `k!/(s − a)^(k+1)` of `e^(au) u^k` (AnalyticNumberTheoryPartII §4.5c) have a single real pole with positive leading coefficient; by
  6.4 (b), no function bounded above by `C e^(θu)`, `θ < a`, has such a transform.
- `g = 1`: `Φ(s) = 1/s` on `Re s > 0` and `a_k(z) = z^(−k−1)` (6.1), singular at the abscissa `0`;
  `f(u) = sin u`, which changes sign, has the transform `1/(s² + 1)`, analytic at its abscissa `0`
  (6.3).
- `g(u) = −u e^(βu)`, `θ < β < A`: `Φ = −(s − β)^(−2)` has residue `0` and leading coefficient `−1`, and
  every window satisfies the bound since `g ≤ 0`: the sign is carried by the leading coefficient,
  not by the residue (6.4, 6.8).
- `g(u) = e^(βu) cos(γu)`, `γ ≠ 0`: the transform `(s − β)/((s − β)² + γ²)` has only the nonreal
  poles `β ± iγ`; `g` is bounded above by no `C e^(θu)` with `θ < β`, and the windows of bounded
  length on which `g ≤ 0` are not of the form `[U, (1+δ)U]` (6.4, 6.8).
- At `λ = 4`, `q_4 ≈ 0.935` and `U_4(1) ≈ 1.21` (6.2 (d)); the set `⋃_{j≥1} [2^(2^j), 2^(2^j + 1)]`
  contains `[Y, 2Y]` for arbitrarily large `Y` but has no windows of any exponent `λ > 1` (6.9).

### Dependencies

ArithmeticDirichletSeriesPartII §0.1, ArithmeticDirichletSeriesPartII §0.2 (for the normalisation of the leading
coefficient) and ArithmeticDirichletSeriesPartII §4.1 for 6.9 (c) and 6.10; AnalyticNumberTheoryPartII §4.5c for the model transforms
of the Examples. Mathlib meromorphic functions and their normal form,
Cauchy estimates, Bochner integration and the Gamma integral; Tau Ceti's Laurent data at a
meromorphic point; completed ArithmeticDirichletSeries 8.1 for 6.10.

## Layer 7: Laplace's method in several variables

This layer proves Laplace's method for a family of integrals over a finite-dimensional real space whose integrands, rescaled by `√t`, converge pointwise to a Gaussian `e^(−B(v,v))` with complex-valued `B`, under a majorant uniform in the integer parameter `t`; it concludes that the integrals do not vanish for large `t`. It is the several-variable analogue of Laplace's method on the real line (AsymptoticExpansions §5.2) and uses no statement of it.

### 7.1 Laplace's method in several variables with a uniform majorant

Let `(f_t)_{t≥1}` be complex functions on `E`, indexed by the positive integers, `B : E × E → ℂ` a real-bilinear form, and `c, γ > 0`. Suppose that `f_t` is `μ`-almost everywhere strongly measurable for all large `t`, that `f_t(v/√t) → e^(−B(v,v))` as `t → ∞` for every `v ∈ E`, and that `|f_t(v)| ≤ (1 + c‖v‖²)^(−γt)` for every `v ∈ E` and all large `t`. Prove that:

- (a) *Positivity.* `Re B(v, v) > 0` for every `v ≠ 0`.
- (b) *The Gaussian integral.* For every real-bilinear `B′ : E × E → ℂ` with `Re B′(v, v) > 0` for all `v ≠ 0`, the function
  `v ↦ e^(−B′(v,v))` is integrable and `∫_E e^(−B′(v,v)) dμ(v) ≠ 0`.
- (c) *The limit.* `f_t` is `μ`-integrable for all large `t`, and
  ```text
  t^(n/2) · ∫_E f_t dμ  →  ∫_E e^(−B(v,v)) dμ(v)      as t → ∞ .
  ```
- (d) *Non-vanishing.* `∫_E f_t dμ ≠ 0` for all large `t`.

No symmetry or positivity of `B` is assumed; convergence is pointwise, with no uniformity. Clauses (a), (c) and (d) are stated as `tendsto_integral_of_laplaceMethod` in `Suggested.lean`.

*Route.* Fix an integer `N ≥ 1` beyond which the hypotheses hold and with `n < 2γN`. For `x ≥ 0` and `0 < s ≤ t`,
`(1 + x/s)^s ≤ (1 + x/t)^t` (weighted arithmetic–geometric mean inequality), so for `t ≥ N`,
`|f_t(w/√t)| ≤ (1 + c‖w‖²/t)^(−γt) ≤ (1 + (c/N)‖w‖²)^(−γN)`, an integrable function of `w` because `2γN > n`. Dominated
convergence gives `∫ f_t(w/√t) dμ(w) → ∫ e^(−B(w,w)) dμ(w)`, and the left side is `t^(n/2) ∫ f_t dμ` by the dilation
`w ↦ w/√t`: this is (c), the integrability of `f_t` being the majorant with `2γt > n`. For (a), the pointwise limit
`e^(−B(v,v))` is bounded by the same majorant, so `e^(−Re B(v,v)) ≤ (1 + (c/N)‖v‖²)^(−γN) < 1` for `v ≠ 0`. For (b), in a basis let
`A` and `C` be the real and imaginary parts of the symmetric matrix of `v ↦ B′(v, v)`; `A` is positive definite, so there is
an invertible real `P` with `PᵀAP = 1` and `PᵀCP` diagonal with entries `c_i`; then `B′(Pw, Pw) = Σ_i (1 + i c_i) w_i²` and the
integral is a positive multiple of `∏_i ∫_ℝ e^(−(1 + i c_i)x²) dx = ∏_i (π/(1 + i c_i))^(1/2) ≠ 0`. (d) follows from (a), (b), (c).
*Needs:* Mathlib `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`,
`integrable_rpow_neg_one_add_norm_sq`, `MeasureTheory.Measure.integral_comp_smul`,
`GaussianFourier.integral_cexp_neg_sum_mul_add`, `Real.geom_mean_le_arith_mean2_weighted`, the spectral theorem for real
symmetric matrices.

**Checks.**

- `E = ℝ`, `f_t(Y) = e^(−(1+i)tY²)`, `B(Y, Y′) = (1 + i)YY′`, `c = γ = 1`: `f_t(Y/√t) = e^(−(1+i)Y²)` for every `t`, the majorant
  holds because `e^x ≥ 1 + x`, (a) holds since `Re B(Y, Y) = Y²`, and both sides of (c) equal `(π/(1 + i))^(1/2)`, of
  modulus `2^(−1/4)√π`, for every `t ≥ 1`. With `f_t(Y) = (1 + Y²)^(−t)` and `B(Y, Y) = Y²`, (c) reads
  `√(πt) · Γ(t − ½)/Γ(t) → √π`.
- The majorant cannot be dropped: `f_t(Y) = e^(−tY²) − e^(−t(Y − t)²)` on `ℝ` satisfies
  `f_t(Y/√t) = e^(−Y²) − e^(−(Y − t^(3/2))²) → e^(−Y²)` for every `Y`, and `∫_ℝ f_t = 0` for every `t`.

### Examples

- `E = ℝ`, `B(Y, Y′) = (1 + i)YY′`, `f_t(Y) = e^(−(1+i)tY²)`: both sides of 7.1 (c) equal `(π/(1 + i))^(1/2)`, which is not zero, for every `t` (7.1 (b), (d)).
- `f_t(Y) = (1 + Y²)^(−t)` on `ℝ`: 7.1 (c) is `√(πt) · Γ(t − ½)/Γ(t) → √π`.
- `f_t(Y) = e^(−tY²) − e^(−t(Y − t)²)` has the pointwise limit `e^(−Y²)` after rescaling but integral `0` for every `t`: without the majorant, 7.1 (d) fails.

### Dependencies

No earlier layer and no other roadmap. Mathlib dominated convergence, Haar measure and dilations on finite-dimensional real spaces, the Gaussian integral with complex parameter, weighted arithmetic–geometric means and the spectral theorem for real symmetric matrices.

## Layer 8: Stationary phase over `ℂ^n` and over non-archimedean rings

This layer proves stationary phase in two settings, both used for the phase `Σ x_k + D/∏ x_k`. Over `ℂ^n` (8.1) it evaluates complex Gaussian integrals through the Autonne–Takagi factorisation and proves, for arbitrary holomorphic phases and Banach-valued amplitudes, a non-stationary bound and the leading term at a nondegenerate critical point, with remainders bounded by finitely many derivatives of the amplitude; it then records the critical data of the phase `Σ x_k + D/∏ x_k`. Only the leading term is asserted, no asymptotic expansion. Over a finite product of `p`-adic fields with a compact open subring that is its own orthogonal (8.2) it proves Gaussian integrals over admissible lattices and an exact stationary-phase formula for the same phase. Both are analogues of stationary phase on the real line (AsymptoticExpansions Layer 6) and use no statement of it.

### 8.1 Stationary phase for holomorphic phases on `ℂ^n`, and the phase `Σ x_k + D/∏ x_k`

Let `n ∈ ℕ` and `β ∈ ℂ^×`. Prove that:

- (a) *Complex Gaussian integrals.* For `a ∈ ℂ` and `δ > 0`,
  `∫_ℂ e^(−δ|w|²) ψ_β(a w²/2) dμ_β(w) = |β| / √(4δ² + |β|²|a|²)`. For a symmetric matrix `H ∈ M_n(ℂ)` (`Hᵀ = H`) with
  `det H ≠ 0` and `t ∈ ℂ^×`,
  `lim_{δ→0+} ∫_{ℂ^n} e^(−δ Σ_k |x_k|²) ψ_β(xᵀHx/(2t)) dμ_β^n(x) = |t|^n / |det H|`.
- (b) *Non-stationary phase.* For every `q ∈ ℕ` there is a constant `C = C(n, q, β)` such that: for every open `Ω ⊂ ℂ^n`,
  every holomorphic `g : Ω → ℂ`, all `η, P > 0` with `‖D_ℂ g(x)‖ ≥ η` and `‖D_ℂ^(j+1) g(x)‖ ≤ ‖D_ℂ g(x)‖ P^j` for `1 ≤ j ≤ q` and
  `x ∈ Ω`, every complex Banach space `V`, every `a : ℂ^n → V` of class `C^q` with compact support contained in `Ω` and
  `‖D^j a(x)‖ ≤ S P^j` for `j ≤ q` and all `x`, and every `t ∈ ℂ^×`,
  `‖∫_{ℂ^n} ψ_β(g(x)/t) a(x) dμ_β^n(x)‖ ≤ C · S · (|t| P/η)^q · μ_β^n(supp a)`.
- (c) *Stationary phase at a nondegenerate critical point.* For all `r, Λ > 0` there is a constant `C = C(n, β, r, Λ)` such
  that the following holds. Let `x₀ ∈ ℂ^n`, let `g` be holomorphic on `B(x₀, 2r)` with `|g| ≤ Λ` there and `∇g(x₀) = 0`, let
  `H = (∂²g/∂x_i∂x_j (x₀))` be its Hessian at `x₀`, and suppose `‖x − x₀‖ ≤ Λ ‖∇g(x)‖` for all `x ∈ B̄(x₀, r)`. Let `V` be a
  complex Banach space and `a : ℂ^n → V` of class `C^(2n+2)`, zero outside `B̄(x₀, r)`, with `‖D^j a(x)‖ ≤ S` for all
  `j ≤ 2n + 2` and all `x`. Then `det H ≠ 0` and, for every `t ∈ ℂ^×`,
  `‖∫_{ℂ^n} ψ_β(g(x)/t) a(x) dμ_β^n(x) − ψ_β(g(x₀)/t) · (|t|^n/|det H|) · a(x₀)‖ ≤ C · S · |t|^(n+1)`.
  The constant does not depend on `x₀`, `g`, `V`, `a`, `S` or `t`. The leading term carries no root of unity.
- (d) *The phase `g_D(x) = Σ_{k=1}^n x_k + D/∏_{k=1}^n x_k` on `(ℂ^×)^n`, `D ∈ ℂ^×`.*
  (i) `∂g_D/∂x_k = 1 − D/(x_k ∏_i x_i)`; the critical points are the points `(z, …, z)` with `z^(n+1) = D`; there
  `g_D = (n + 1)z`, the Hessian is `z^(−1)(1 + 𝟙𝟙ᵀ)` and its determinant is `(n + 1) z^(−n)`.
  (ii) If `0 < η ≤ 1/(4(n + 1))` and `|∂g_D/∂x_k (x)| < η` for all `k`, there is `z` with `z^(n+1) = D` and `|x_k − z| ≤ 6η|z|` for
  all `k`. Consequently, for every compact `K_c ⊂ ℂ^×` and `δ > 0` there is `c_δ > 0` with `‖∇g_D(x)‖ ≥ c_δ` for all `D ∈ K_c`
  and all `x ∈ (ℂ^×)^n` with `‖x − (z, …, z)‖ ≥ δ` for every root `z`.
  (iii) For `δ, R > 0` there is `Λ` such that for every `z` with `100(n + 1)δ ≤ |z| ≤ R`, `x₀ = (z, …, z)` and `D = z^(n+1)`:
  `B(x₀, 4δ) ⊂ (ℂ^×)^n`, `|g_D| ≤ Λ` on `B(x₀, 4δ)`, and `‖x − x₀‖ ≤ Λ‖∇g_D(x)‖` on `B̄(x₀, 2δ)`.
  (iv) `‖∇g_D(x)‖ ≤ ‖D_ℂ g_D(x)‖ ≤ n‖∇g_D(x)‖`, and for every `j ≥ 1` there is `C_j`, independent of `D`, with
  `‖D_ℂ^(j+1) g_D(x)‖ ≤ C_j (1 + ‖∇g_D(x)‖) ρ^(−j)` whenever `|x_k| ≥ ρ > 0` for all `k`.

(b) and (c) are stated for arbitrary holomorphic phases, with constants that depend on the phase only through `(η, P)`
and `(r, Λ)`: they are applied to amplitudes whose supports and derivative bounds vary with `t`.
Only the leading term is asserted; no asymptotic expansion.

*Route.* (a) In one variable rotate `w` so that `βa/2 ≥ 0`; in real coordinates the integral is a product of two real
Gaussian integrals with parameters `δ ∓ i|βa|/2`. In `n` variables use the Autonne–Takagi factorisation `H = WΣWᵀ` (`W`
unitary, `Σ` diagonal with entries `σ_k ≥ 0`: the antilinear map `x ↦ H x̄` has an orthonormal basis of vectors `v` with
`H v̄ = σv`, `σ ≥ 0`, found one at a time from an eigenvector of the linear map `x ↦ H H̄ x`), the unitary substitution
`x ↦ Wᵀx`, which preserves `μ_β^n` and `Σ|x_k|²`, and the one-variable formula; then `δ → 0+`. (b) With
`b_k = conj(∂_k g)/Σ_l |∂_l g|²`, `Σ_k ∂_k g · b_k = 1` and, for the Wirtinger derivatives `∂_k`,
`∫ ψ_β(g/t) a = −(2t/(iβ)) Σ_k ∫ ψ_β(g/t) ∂_k(b_k a)`; the hypotheses give `‖D^j b_k‖ ≤ C‖D_ℂ g‖^(−1) P^j`, so each integration by
parts gains a constant times `|t|P/η`; after `q` of them bound the integral by the supremum times the measure of the
support. (c) Translate to `x₀ = 0`. For `|t| ≥ 1` bound both terms trivially. For `|t| ≤ 1` put `τ = |t|` and
`φ = Re(βτ g/t)`, so that `ψ_β(g/t) = e^(iφ/τ)`; Cauchy's estimates bound finitely many real derivatives of `φ` on `B̄(0, r)`
in terms of `(n, β, r, Λ)`, and the gradient hypothesis gives `|∂_e φ(x)| ≥ (|β|/2Λ)‖x‖` for one of the `2n` real coordinate
directions `e`. In the symbol classes `‖D^j b(x)‖ ≤ K(‖x‖ + √τ)^(m−j)`, integration by parts with the operator built on
`(|∇φ|² + τ)^(−1)` gives `‖∫ e^(iφ/τ) b‖ ≤ CKτ^(n+q)` for symbols `b` of order `m = 2q` supported in `B̄(0, r)`. Write
`a = u + χ·(a(0) + Da(0)x)` with an even cut-off `χ`: `u` has order `2` and contributes `O(Sτ^(n+1))`. For the remaining
amplitude interpolate the phase between its quadratic part `φ₂` and `φ`: the second-order remainder in the interpolation
parameter is `O(τ^(n+1))`, and the first-order term is `O(τ^(n+1))` after discarding integrands odd in `x`. Finally
`∫ ψ_β(xᵀHx/(2t)) χ(x) dμ_β^n = |t|^n/|det H| + O(τ^(n+1))`, because `χ − e^(−δ Σ|x_k|²)` is a symbol of order `2` uniformly in
`δ ∈ (0, 1]`; let `δ → 0+` in (a). (d) Direct computation; in (ii), with `ρ = D/∏ x_i` one has `x_k = ρ/(1 − ε_k)`, `|ε_k| < η`,
and `ρ^(n+1) = D ∏_k (1 − ε_k)`. The following steps are used as stated and their proofs are not given here: the induction
that produces the Takagi basis in (a); in (c), the Cauchy estimates for the derivatives of `φ`, the integration-by-parts
bound in the symbol classes, and the interpolation of the phase with the bounds of its two error terms; and (d)(iii),
(d)(iv).
*Needs:* Mathlib Bochner integration, Cauchy estimates for holomorphic functions of several variables, smooth bump
functions (`ContDiffBump`), `integrable_one_add_norm`, the Gaussian integral with complex parameter, the spectral theorem.

**Checks.**

- (a) at `β = 2`, `a = 1`, `δ = 1`: `ψ_2(w²/2) = e^(i(x² − y²))` for `w = x + iy`, and
  `(1/π) ∫_ℝ e^(−(1−i)x²) dx ∫_ℝ e^(−(1+i)y²) dy = (1/π) · π/√2 = 1/√2 = 2/√(4 + 4)`.
- (c) for `n = 1`, `β = 1`, `g(x) = x + 1/x`, `x₀ = 1` (so `g(x₀) = 2`, `H = (2)`, and the hypotheses hold with `r = 0.4`,
  `Λ = 7`), and the amplitude `a(x) = exp(1 − 1/(1 − |x − 1|²/r²))` for `|x − 1| < r`, `a = 0` elsewhere: the leading term
  is `e^(i Re(2/t)) |t|/2`, and numerical integration gives a difference of modulus `5.6·10^(−4)` at `t = 0.02 e^(0.7i)` and
  `5.5·10^(−5)` at `t = 0.01 e^(0.7i)`, that is `1.4|t|²` and `0.55|t|²`, against leading terms of modulus `10^(−2)` and `5·10^(−3)`.
- (d)(i) for `n = 2`: `g_D = x₁ + x₂ + D/(x₁x₂)`; `x₁²x₂ = D = x₁x₂²` forces `x₁ = x₂ = z`, `z³ = D`; the Hessian there is
  `z^(−1)[[2, 1], [1, 2]]`, of determinant `3z^(−2)`. For `n = 1`: `x + D/x`, critical points `±√D`, second derivative `2/z`.

### 8.2 Gaussian integrals over lattices and stationary phase for `Σ x_k + D/∏ x_k` over a non-archimedean ring

Let `(K, 𝔒, ψ)` be as in the Conventions; every nonzero integer is invertible in `K`, and nothing is assumed about the
residue characteristics or about `𝔒` being a maximal order. For every lattice `L`, `L^⊥` is a lattice,
`L^(⊥⊥) = L` and `vol(L) vol(L^⊥) = 1`, so `dx` is the Haar measure self-dual for `ψ`. For `m ≥ 1` and `D ∈ K^×` let
`g_D(x) = Σ_{k=1}^m x_k + D/∏_{k=1}^m x_k` on `(K^×)^m`; its critical points are the points `(z, …, z)` with `z^(m+1) = D`, finitely
many, with `g_D(z, …, z) = (m + 1)z`. An *amplitude of type `(L₀, Λ₁)`*, for lattices `L₀`, `Λ₁`, is a function `A : K^m → ℂ` that
vanishes unless every `x_k` is a unit with `x_k ∈ L₀` and `x_k^(−1) ∈ L₀`, and that is invariant under translation by `Λ₁^m`.
Prove that:

- (a) *Gaussian integrals.* Let `M ∈ M_m(K)` be symmetric with `det M ∈ K^×`, and call a lattice `L` *admissible for `M`* if
  `ψ(½ yᵀM^(−1)y) = 1` for all `y ∈ (L^⊥)^m`. Every lattice containing an admissible lattice is admissible. For every
  admissible `L`, `|∫_{L^m} ψ(½ ξᵀMξ) dξ| = |det M|^(−1/2)`,
  and the integral is the same for all admissible `L`. The number `γ_ψ(M) = |det M|^(1/2) ∫_{L^m} ψ(½ ξᵀMξ) dξ`, of modulus
  `1`, is the *Gauss factor* of `M`. For `γ(a) := γ_ψ(H_m(a))`: `∫_{L^m} ψ(½ ξᵀH_m(a)ξ) dξ = γ(a) |m + 1|^(−1/2) |a|^(m/2)` for `L`
  admissible for `H_m(a)`, and `γ(ab²) = γ(a)` for all `a, b ∈ K^×`. For every lattice `L` and compact `Q ⊂ K^×` there is a
  neighbourhood `V` of `0` such that `L` is admissible for `H_m(zt)` whenever `t ∈ V ∩ K^×` and `z^(m+1) ∈ Q`.
- (b) *The Morse lemma for `g_D`.* For every compact `Q ⊂ K^×` there is a neighbourhood `V` of `0` such that for every
  `𝔒`-submodule `B ⊂ V` of `K` that is a lattice and every `z ∈ K^×` with `z^(m+1) ∈ Q` there is a bijection `φ : B^m → B^m` with:
  for every `𝔒`-submodule `Λ ⊂ B` and `ξ, η ∈ B^m`, `φ(ξ) − φ(η) ∈ Λ^m` if and only if `ξ − η ∈ Λ^m`; and for every `ξ ∈ B^m` the
  elements `z + φ(ξ)_k` are units and
  `g_{z^(m+1)}(z + φ(ξ)_1, …, z + φ(ξ)_m) = (m + 1)z + ½ ξᵀ H_m(z) ξ`.
- (c) *Vanishing away from the critical points.* For lattices `L₀, Λ₁, B` and compact `Q ⊂ K^×` there is a neighbourhood `V`
  of `0` such that for all `t ∈ V ∩ K^×`, `D ∈ Q` and every amplitude `A` of type `(L₀, Λ₁)`, the integral of
  `A(x) ψ(g_D(x)/t)` over the set of `x` lying in no `(z, …, z) + B^m`, `z^(m+1) = D`, is `0`.
- (d) *Stationary phase.* For lattices `L₀, Λ₁` and compact `Q ⊂ K^×` there is a neighbourhood `V` of `0` such that for all
  `t ∈ V ∩ K^×`, `D ∈ Q` and every amplitude `A` of type `(L₀, Λ₁)`,
  `∫_{K^m} A(x) ψ(g_D(x)/t) dx = |t|^(m/2) Σ_{z ∈ K^×, z^(m+1) = D} γ(zt) |m + 1|^(−1/2) |z|^(m/2) ψ((m + 1)z/t) A(z, …, z)`.

The identities (b), (c), (d) are exact, and special to the phase `g_D`; (a) holds for every nondegenerate symmetric `M`.
The Gauss factor is defined by (a); with the self-dual measure no index of lattices appears.

*Route.* (a) Let `Λ ⊂ L` be a lattice under which the integrand is invariant. The integral is `vol(Λ)^m S`,
`S = Σ_{y ∈ L^m/Λ^m} F(y)`, `F(y) = ψ(½ yᵀMy)`, and `F(y + w) = F(y)F(w)ψ(yᵀMw)`. For a function `F` of modulus `1` on a finite
abelian group `X` with `F(y + w) = F(y)F(w)β(y, w)`, `β` a bicharacter, and `F = 1` on the radical `X₀` of `β`:
`|Σ_X F|² = #X · #X₀`. Admissibility gives `M^(−1)(L^⊥)^m ⊂ L^m`, identifies `X₀` with `M^(−1)(L^⊥)^m/Λ^m` and gives `F = 1` on it; so
`|∫|² = vol(L)^m vol(L^⊥)^m |det M|^(−1) = |det M|^(−1)`. Independence: for admissible `L ⊂ L″`, on a coset `c + L^m ≠ L^m` in `L″^m`
the translations by `M^(−1)u`, `u ∈ (L^⊥)^m`, preserve the coset and multiply the integrand by the constant `ψ(cᵀu)`, which is
`≠ 1` for some `u`; so only `L^m` contributes, and two admissible lattices are compared with their sum.
`det H_m(a) = (m + 1)a^(−m)`; `ξ ↦ bξ` gives `γ(ab²) = γ(a)`. (b) For `(1 + y_k)w_k = 1`: `Σ_k y_k + ∏_k w_k − 1 = ½ yᵀM(w)y` with `M(w)_{ii} = 2w_i`,
`M(w)_{ij} = w_i w_j ∏_{k < min(i,j)} w_k`, `M(𝟙) = H := 1 + 𝟙𝟙ᵀ`; so `g_{z^(m+1)}(z(1 + y)) = (m + 1)z + ½ z yᵀM(w)y`. For matrices
`G, N` with entries in `𝔒` the equation `Y = N − ϖ YGY` (`ϖ ∈ 𝔒` a unit of `K` with `K = ⋃_j ϖ^(−j)𝔒`) has a solution with entries
in `𝔒`, as a fixed point of a map of a compact set that is contracting for the filtration by the `ϖ^j𝔒`; it is symmetric
when `G, N` are and depends on `N` compatibly with congruences modulo every `𝔒`-submodule. With `H′ = (m + 1) − 𝟙𝟙ᵀ`
(`HH′ = m + 1`), a symmetric solution of `Y = N − ϖ YH′Y` gives `P = 1 + 2ϖ H′Y` with `PᵀHP = H + 4(m + 1)ϖ N`; take
`N = (M(w) − H)/(4(m + 1)ϖ)` for `y ∈ 4(m + 1)ϖ𝔒` and `ξ = z P(y)y`; a map `v ↦ v + ϖ Y(v)v` with `Y(·)` integral and compatible
with congruences is a bijection of `B^m` preserving congruences. (c) On balls of radius `ν`, `ν/t` a negative power of `ϖ`,
the amplitude is constant and the phase is affine modulo `t𝔒`; away from the critical points some `∂g_D/∂x_k` is not
small (otherwise Hensel's lemma for `(m + 1)`-th roots puts `x` near a critical point), and the sum of the character over
the ball vanishes. (d) Split `K^m` into the balls `(z, …, z) + B^m` and the rest, for a small `𝔒`-module `B`; use (c) on
the rest; on a ball `A` is constant, (b) turns the phase into `(m + 1)z/t + ½ ξᵀH_m(zt)ξ` by a measure-preserving
bijection, and (a) evaluates the Gaussian integral over `B^m`, `B` being admissible for `H_m(zt)` when `t` is small.
The following steps are used as stated and their proofs are not given here: the duality of lattices (`L^⊥` a lattice,
`L^(⊥⊥) = L`, `vol(L) vol(L^⊥) = 1`); the finite Gauss-sum identity `|Σ_X F|² = #X · #X₀`; the vanishing on a coset in the
independence step, beyond the sketch above; the admissibility of a fixed lattice for `H_m(zt)` for small `t`, at the end
of (a); the local form of the Morse lemma, from which (b) follows; and the details of (c), whose route is a sketch.
*Needs:* Mathlib additive characters (`AddChar`), Haar measure on locally compact groups, indices of subgroups,
orthogonality of characters of finite abelian groups.

**Checks.**

- (a) for `K = ℚ_3`, `𝔒 = ℤ_3`, `ψ(x) = e^(2πi{x})`, `m = 1`, `M = (2/3)`, so `½ ξᵀMξ = ξ²/3` and `|det M|^(−1/2) = 3^(−1/2)`: the
  lattices `ℤ_3` and `3^(−1)ℤ_3` are admissible and both give `(1/3)(1 + 2e^(2πi/3)) = i/√3`, so `γ_ψ(M) = i`; the lattice `3ℤ_3`
  is not admissible and gives `1/3`.
- (d) for `K = ℚ_3`, `m = 1`, `D = 1`, `t = 9`, `A` the indicator of `ℤ_3^×`: the left side is
  `(1/9) Σ_{x ∈ (ℤ/9)^×} e^(2πi(x + x^(−1))/9) = (2/3) cos(4π/9)`; on the right `z = ±1`, `γ(±9) = 1` (as `Σ_{ξ mod 9} e^(2πiξ²/9) = 3`),
  and the sum is `(1/3)(e^(4πi/9) + e^(−4πi/9)) = (2/3) cos(4π/9)`. At `t = 3` the two sides are `−1/3` and `1`: the
  neighbourhood `V` is needed.
- (b) for `m = 1`: `x + z²/x = 2z + ξ²/z` with `x = z(1 + y)` and `ξ = z y (1 + y)^(−1/2)`, since `y + (1 + y)^(−1) − 1 = y²/(1 + y)`.

### Examples

- 8.1 (a) at `β = 2`, `a = 1`, `δ = 1`: the one-variable Gaussian integral equals `1/√2 = 2/√(4 + 4)`.
- 8.1 (c) for `n = 1`, `g(x) = x + 1/x` at `x₀ = 1`: the leading term is `e^(i Re(2/t)) |t|/2`, and the difference from the integral against a bump amplitude is about `1.4|t|²` at `|t| = 0.02` and `0.55|t|²` at `|t| = 0.01`.
- 8.1 (d)(i) for `n = 2`: the critical points of `x₁ + x₂ + D/(x₁x₂)` are `(z, z)` with `z³ = D`, with Hessian determinant `3z^(−2)`.
- 8.2 (a) over `ℚ_3` with `M = (2/3)`: the admissible lattices `ℤ_3` and `3^(−1)ℤ_3` both give `i/√3`, so the Gauss factor is `i`; the lattice `3ℤ_3` is not admissible and gives `1/3`.
- 8.2 (d) over `ℚ_3` with `m = 1`, `D = 1` and `A` the indicator of `ℤ_3^×`: both sides equal `(2/3) cos(4π/9)` at `t = 9`, and differ (`−1/3` against `1`) at `t = 3`.
- 8.2 (b) for `m = 1`: `x + z²/x = 2z + ξ²/z` with `x = z(1 + y)` and `ξ = z y (1 + y)^(−1/2)`.

### Dependencies

No earlier layer and no other roadmap. Mathlib Bochner integration, Cauchy estimates for holomorphic functions of several variables, smooth bump functions, the Gaussian integral with complex parameter and the spectral theorem (8.1); additive characters, Haar measure on locally compact groups, indices of subgroups and orthogonality of characters of finite abelian groups (8.2).

## Downstream consumers

- GeneralizedRiemannHypothesisFromWindowBounds: Landau's theorem for positive combinations of logarithmic derivatives of Dirichlet and ray-class `L`-functions, for all large `y` (6.4 (b) and (d), at GeneralizedRiemannHypothesisFromWindowBounds §§1.1–1.3) and on windows (6.8 and 6.9 (b), at GeneralizedRiemannHypothesisFromWindowBounds §§2.1–2.5), and the window predicate `HasWindows` with its API (6.9 (a), in the Conventions of that roadmap, at GeneralizedRiemannHypothesisFromWindowBounds §3.1 and in its Layers 4–5). That roadmap proves the meromorphic continuation, the location of the poles and the signs of their residues for its own transforms; Layer 6 needs none of that arithmetic.
- ThetaChainsAndFrobeniusPrimeSums: the window predicate `HasWindows` and its API (6.9 (a)), at ThetaChainsAndFrobeniusPrimeSums §§10.7, 10.10 and 10.11.
- BesselPoincareSeriesAndGramBounds: the non-vanishing of Laplace's method 7.1 (d), with `t` a positive integer, at BesselPoincareSeriesAndGramBounds §5.13d (e); the non-stationary bound, the leading term of stationary phase and the critical data of the phase `Σ x_k + D/∏ x_k`, 8.1 (b), (c), (d), at BesselPoincareSeriesAndGramBounds §5.18d (g); and the Gauss factor and the exact stationary-phase formula over a non-archimedean ring, 8.2 (a), (d), at BesselPoincareSeriesAndGramBounds §5.17c (b1).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns:

- Landau's theorem for one-sided Laplace transforms (Layer 6): Taylor coefficients of a transform as integrals against the Gamma kernel; the kernel's mass, supremum, profile and supremum off a window; the classical theorem for eventually nonnegative functions and its meromorphic, one-sided and rightmost-pole forms; the coefficient-wise window inequality; Cauchy estimates near a pole of finite order; the choice of expansion point; the windowed theorem for poles of any finite order; its Mellin and Dirichlet-series forms, with the window predicate `HasWindows`; and the agreement with Landau's theorem for Dirichlet series.
- Laplace's method in several variables with a uniform majorant, with the positivity of the limiting form, the non-vanishing of complex Gaussian integrals and of the integrals for large parameter (Layer 7).
- Over `ℂ^n`: complex Gaussian integrals, the non-stationary bound and the leading term of stationary phase for holomorphic phases with Banach-valued amplitudes, and the critical data of the phase `Σ x_k + D/∏ x_k`; over a finite product of `p`-adic fields with a self-dual compact open subring: Gaussian integrals over admissible lattices with the Gauss factor, the Morse lemma for the same phase, its vanishing away from the critical points, and the exact stationary-phase formula (Layer 8).

The theory these statements extend is owned by their homes. [ArithmeticDirichletSeriesPartII](../../ArithmeticDirichletSeriesPartII/README.md) owns the one-sided Laplace transform and the predicate `HasLaplace` (ArithmeticDirichletSeriesPartII §0.1), the boundary data `PoleBoundary` with its normalisation of the leading coefficient (ArithmeticDirichletSeriesPartII §0.2), the counting function of a Dirichlet series (its Conventions) and its transform (ArithmeticDirichletSeriesPartII §4.1), and Delange's theorem. [AsymptoticExpansions](../../AsymptoticExpansions/README.md) owns Laplace's method and stationary phase in one variable (Layers 5 and 6); Layers 7 and 8 above are their analogues in several variables and over non-archimedean rings and use no statement of them.

Not owned here:

- Landau's theorem for Dirichlet series with nonnegative coefficients is completed ArithmeticDirichletSeries 8.1, in the library as `TauCeti.LSeries.landau`; 6.10 only records the agreement.
- Weighted families of Dirichlet or ray-class characters, their Riesz-smoothed prime sums, the residues of the associated transforms and every zero-free conclusion drawn from Layer 6: GeneralizedRiemannHypothesisFromWindowBounds.
- Windows shorter than a fixed ratio, `[U, U + ψ(U)]` with `ψ(U) = o(U)`: Layer 6 does not treat them, and for bounded `ψ` the statement is false (Checks of 6.8).
- The Bessel periods, orbital integrals and local integrals to which Layers 7 and 8 are applied: BesselPoincareSeriesAndGramBounds.

## Exact supplier contracts

### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII

- §0.1, `HasLaplace` and its API (convergence, value, uniqueness, almost-everywhere congruence, additivity, scalar multiplication): every transform of Layer 6 is a `HasLaplace` statement with the default measure on `(0, ∞)`; integrability is part of the predicate; additivity and scalar multiplication are used in 6.9 (c).
- §0.2, `PoleBoundary`: the normalisation of its leading coefficient `A`, which is the leading coefficient `meromorphicTrailingCoeffAt` of the Conventions above.
- Conventions and §4.1: the counting function `S_c` and the transform `F(s)/s` of `S_c(e^t)` for nonnegative coefficients with an absolutely convergent series on `Re s > a ≥ 0`, used as stated in 6.9 (c) and 6.10.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

- §4.5c, the complex Gamma–Laplace adapter: the model transforms `k!/(s − a)^(k+1)` of `e^(au) u^k` in the Examples of Layer 6.

### From [ArithmeticDirichletSeries](../../../Completed/ArithmeticDirichletSeries/README.md) (completed)

- Layer 8.1, Landau's theorem (`TauCeti.LSeries.landau`: a Dirichlet series with nonnegative coefficients and finite abscissa of absolute convergence `σ` has no analytic continuation across `σ`): the comparison of 6.10.

### From Mathlib

- `MeromorphicOn`, with `MeromorphicOn.eventually_codiscreteWithin_analyticAt` (the poles of a meromorphic function on an open set are discrete in it), `meromorphicOrderAt` and `meromorphicTrailingCoeffAt` (the value `h(x)` of a presentation `(z − x)^order • h z`, `h` analytic at `x`), with `meromorphicTrailingCoeffAt_congr_nhdsNE` (functions that agree on a punctured neighbourhood of `x` have the same leading coefficient at `x`): poles, orders and leading coefficients in Layer 6.
- `toMeromorphicNFOn`, with `toMeromorphicNFOn_eqOn_codiscrete`, `meromorphicNFOn_toMeromorphicNFOn`, `MeromorphicOn.toMeromorphicNFOn_eq_self_on_nhdsNE`, `meromorphicOrderAt_toMeromorphicNFOn` and `MeromorphicNFAt.meromorphicOrderAt_nonneg_iff_analyticAt`: the normal form of 6.1 (c), analytic off the poles, with the same orders and the same punctured germs.
- `norm_cauchyPowerSeries_le` and `DifferentiableOn.hasFPowerSeriesOnBall`: Taylor expansion on discs and Cauchy's estimate for its coefficients, 6.3 and 6.6; `deriv_zpow` and removable singularities, 6.6.
- `MeasureTheory.integral_comp_exp_Ioi` and `MeasureTheory.integrableOn_comp_exp_Ioi`: the substitution `y = e^u`, 6.9.
- `Real.pow_div_factorial_le_exp` (`x^n/n! ≤ e^x` for `x ≥ 0`; at `x = n` it gives `n! ≥ (n/e)^n`), `Real.integral_rpow_mul_exp_neg_mul_Ioi`, `ProbabilityTheory.gammaPDFReal` and `ProbabilityTheory.lintegral_gammaPDF_eq_one`: the kernel of 6.2. `MeasureTheory.lintegral_tsum` (monotone convergence for series), 6.3. `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral sign), 6.1.
- Compactness of closed balls in `ℂ` and finiteness of discrete subsets of compact sets, 6.7; the identity theorem, 6.1 and 6.4.
- `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`, `integrable_rpow_neg_one_add_norm_sq`, `MeasureTheory.Measure.integral_comp_smul`, `GaussianFourier.integral_cexp_neg_sum_mul_add`, `Real.geom_mean_le_arith_mean2_weighted` and the spectral theorem for real symmetric matrices: 7.1.
- Bochner integration of Banach-valued functions, Cauchy estimates for holomorphic functions of several variables, smooth bump functions (`ContDiffBump`), `integrable_one_add_norm`, the Gaussian integral with complex parameter and the spectral theorem: 8.1.
- Additive characters (`AddChar`), Haar measure on locally compact groups, indices of subgroups and orthogonality of characters of finite abelian groups: 8.2.

### From Tau Ceti

- `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (the finite principal part at a meromorphic point): 6.6.
- `TauCeti.LSeries.landau` (Landau's theorem for Dirichlet series with nonnegative coefficients): the comparison of 6.10.

## References

- E. Landau, *Über einen Satz von Tschebyschef*, Math. Ann. 61 (1905): the theorem on transforms of nonnegative functions (6.3) and its one-sided use (6.4).
- D. V. Widder, *The Laplace Transform*, Princeton (1941), Chapter II: differentiation under the integral and the singularity at the real abscissa (6.1, 6.3).
- H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory*, Cambridge (2007), §15.1: Landau's theorem and one-sided oscillation (6.4).
- J. Kaczorowski and J. Pintz, *Oscillatory properties of arithmetical functions I, II*, Acta Math. Hungar. 48 (1986) and 49 (1987): localized oscillation theorems, context for 6.8.
- [FormalProof] The Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The source of the windowed Landau theorem and its route (6.5–6.8).
- [Announcement] The announcement of that proof by its author, 20 November 2026: <https://alpo.ge/remark.pdf>.
