# Roadmap: shot noise and Campbell's theorem

**Summary.** Shot noise is the random signal `X(t) = Σ_i g(t − τ_i, M_i)` produced when a
homogeneous Poisson process of rate λ > 0 on the whole real line, with points `τ_i`, triggers
copies of a response `g`, each copy modulated by an independent random mark `M_i` with law ν. With
a constant mark this is the filtered Poisson process `Σ_i h(t − τ_i)`; with real marks and
`g(s, m) = m h(s)` it has random amplitudes. The roadmap builds the process from independent
exponential gaps, so that no general theory of random measures is needed, and proves the classical
formulas for it.

- Campbell's theorem: for `g` integrable against Lebesgue measure times ν, `X(t)` is integrable with
  mean `λ ∫ g`; if `g` is also square integrable, `X(t)` is square integrable and
  `Cov(X(t), X(t + τ)) = λ ∫ g(s, m) g(s + τ, m)`.
- The characteristic functional: for measurable `f` with `∫ min(|f|, 1) < ∞` the sum
  `Σ_i f(τ_i, M_i)` converges absolutely almost surely (when the integral is infinite it is almost
  surely not absolutely convergent) and
  `E exp(i Σ_i f(τ_i, M_i)) = exp(λ ∫ (e^{i f} − 1))`. For a bounded integrable kernel the
  cumulant generating function of `X(t)` is `θ ↦ λ ∫ (e^{θ g} − 1)`, so the n-th cumulant is
  `λ ∫ gⁿ`.
- For every measurable kernel the process `t ↦ X(t)` is strictly stationary, and as λ → ∞ the
  standardised process `(X(t) − λ ∫ g)/√λ` converges, in the sense of finite-dimensional
  characteristic functions, to the centred Gaussian process with covariance
  `C(τ) = ∫ g(s, m) g(s + τ, m)`, for `g` integrable and square integrable.
- In the infinite-server queue whose customers arrive at the points and stay for the marks, the
  number of customers present at a fixed time is Poisson with mean λ times the mean service time;
  if the mean service time is infinite, infinitely many customers are present almost surely.

The model rests on the renewal-process arrival times and their Erlang laws in the Tau Ceti library.
It is the line-and-marks case of the Poisson process theory in Last and Penrose's lectures, and the
one-sided count of exponential renewals is MarkovChainsAndRenewal Layer 7. Layer 1 builds the
marked process and its first-order, Laplace and characteristic functionals; Layer 2 proves
Campbell's theorem and the cumulants for shot noise; Layer 3 stationarity and the Gaussian limit;
Layer 4 the infinite-server queue.

## Conventions

1. **The process.** Points are indexed by `ℕ ⊕ ℕ`. Gaps `G i ≥ 0` and marks `M i ∈ E` (a measurable
   space) form independent pairs `(G i, M i)`, each with law `expMeasure λ ⊗ ν`
   (`IsMarkedPoissonInput`). The points on the right are the arrival times of the gaps
   `G (inl k)`: `τ(inl n) = G(inl 0) + ⋯ + G(inl n)`; the points on the left are
   `τ(inr n) = −(G(inr 0) + ⋯ + G(inr n))` (`twoSidedPoint`). Mark `M i` belongs to point `i`.
2. **Rate.** The rate λ is in `ℝ≥0`. Mathlib's `expMeasure 0` is the zero measure, so no input of
   rate zero exists; the hypothesis forces λ > 0, and it also forces ν to be a probability measure.
3. **Integrals.** Every integral over `ℝ × E` is against `volume.prod ν`, Lebesgue measure times ν;
   `∫ g` abbreviates it. Kernels are functions `g : ℝ × E → ℝ` of the pair `(s, m)`.
4. **Series.** `poissonSum f = Σ'_i f(τ_i, M_i)` is a real `tsum`, which is zero where the series is
   not summable; for real series, summable means absolutely summable. The shot noise
   `markedShotNoise g t = poissonSum (s, m ↦ g(t − s, m))`. By 1.4 the series converges
   absolutely almost surely when `∫ min(|g|, 1) < ∞` and is almost surely not absolutely convergent
   otherwise. Nonnegative functionals use
   the `ℝ≥0∞`-valued `tsum`, and `EReal.exp` gives `exp(−∞) = 0`.
5. **Moments.** Covariance is Mathlib's `covariance`, the cumulant generating function is `cgf`
   (the logarithm of `mgf`), and the n-th cumulant is the n-th derivative of `cgf` at zero.

## Layer 1: the marked Poisson process on the line

### 1.1 Definitions

`twoSidedPoint G i ω` is the point of index `i` (Convention 1), built from the library's
`TauCeti.Probability.arrival`. `IsMarkedPoissonInput P λ ν G M` says that every `G i` and `M i` is
measurable, that the pairs `(G i, M i)` are independent under `P`, and that each pair has law
`expMeasure λ ⊗ ν`. `poissonSum f G M ω = Σ'_i f(τ_i(ω), M_i(ω))`.

**Checks.**
- The right-hand points `τ(inl n)` are sums of `n + 1` exponential gaps and have the Erlang law of
  shape `n + 1` and rate λ; summing the Erlang densities over `n ≥ 1` gives
  `Σ λⁿ s^{n−1} e^{−λs}/(n − 1)! = λ` for `s > 0`, the intensity of the process.
- A model that reused one gap sequence for both sides (`τ(inr n) = −τ(inl n)`) would make the counts
  of `(0, 1]` and `[−1, 0)` equal, hence not independent; the two families of pairs are separate.

### 1.2 Campbell's formula

For a marked Poisson input and measurable `f : ℝ × E → [0, ∞]`,

```text
E Σ_i f(τ_i, M_i) = λ ∫ f(s, m) ds ν(dm)
```

(`lintegral_tsum_marked`). Source: Last–Penrose, Proposition 2.7, for a point process with
intensity measure λ Leb ⊗ ν; this model is such a process by Theorem 7.2 there on each half-line,
the superposition theorem (Theorem 3.3) and the marking theorem (Theorem 5.6).
Route (own organisation). By `MeasureTheory.lintegral_tsum` the left side is
`Σ_i E f(τ_i, M_i)`. Fix `n`. The pairs are independent with product law, so `M(inl n)` is
independent of `(G(inl 0), …, G(inl n))` and has law ν; by
`TauCeti.Probability.hasLaw_arrival_gammaMeasure` (applied to the gaps `G(inl k)`, independent with
law `expMeasure λ` as images of the pairs) `τ(inl n)` has law `gammaMeasure (n + 1) λ`. Hence
`E f(τ(inl n), M(inl n)) = ∫∫ f(s, m) γ_{n+1}(s) ds ν(dm)` with the Erlang density `γ_{n+1}`. By
Tonelli and the Erlang sum of 1.1 the right-hand points contribute `λ ∫_{s>0} ∫ f`. The left-hand
points are the reflections of a copy, so they contribute `λ ∫_{s<0} ∫ f`; the point `s = 0` is
Lebesgue-null.
*Needs:* Tau Ceti `TauCeti.Probability.hasLaw_arrival_gammaMeasure`; Mathlib
`MeasureTheory.lintegral_tsum`, `ProbabilityTheory.iIndepFun_iff_map_fun_eq_pi_map`,
`ProbabilityTheory.gammaMeasure`.

### 1.3 The Laplace functional

For measurable `f : ℝ × E → [0, ∞]`,

```text
E exp(−Σ_i f(τ_i, M_i)) = exp(−λ ∫ (1 − e^{−f}))
```

with `exp(−∞) = 0` on both sides (`lintegral_exp_neg_tsum_marked`). Source: Last–Penrose,
Theorem 3.9, with Theorems 3.3, 5.6 and 7.2 identifying the model as a Poisson process with
intensity λ Leb ⊗ ν.

*The window formula*, the lemma behind 1.3, 1.5, 2.2 and 2.3 (stated in the README only; proved
here). Let `L > 0` and let `φ : ℝ × E → ℂ` be bounded and measurable with `φ = 1` outside
`[−L, L] × E`. Almost surely only finitely many points lie in `[−L, L]`, and

```text
E Π_i φ(τ_i, M_i) = exp(λ ∫_{[−L,L]×E} (φ − 1)),
```

the product being almost surely a finite one.

Route (own organisation, through the gaps rather than through independent counts).
*Window formula.* Finiteness is `TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure` on
each side. On the right side let `K` be the number of `n` with `τ(inl n) ≤ L`. For each `k`, the
event `K = k` is `τ(inl (k−1)) ≤ L < τ(inl k)` (for `k = 0`: `L < τ(inl 0)`). The vector of the
first `k + 1` gaps and the first `k` marks has law `expMeasure λ^{⊗(k+1)} ⊗ ν^{⊗k}`
(`iIndepFun_iff_map_fun_eq_pi_map` on `Fin (k + 1)`). Integrate the marks out, writing
`ψ(s) = ∫ φ(s, m) ν(dm)`; change variables to the partial sums `s_1 < ⋯ < s_{k+1}` (a linear map
of determinant one), whose density is `λ^{k+1} e^{−λ s_{k+1}}` on the ordered cone; integrate
`s_{k+1}` over `(L, ∞)`. This gives

```text
E[Π_{n<k} φ(τ(inl n), M(inl n)); K = k] = e^{−λL} λ^k ∫_{0<s_1<⋯<s_k≤L} ψ(s_1)⋯ψ(s_k) ds
                                         = e^{−λL} (λ ∫_0^L ψ)^k / k!,
```

since the symmetric integrand over `[0, L]^k` splits into `k!` ordered pieces up to a null set.
The terms are bounded by `e^{−λL} (λ L ‖φ‖∞)^k / k!`, so summing over `k` is legitimate and gives
`e^{−λL} exp(λ ∫_0^L ψ) = exp(λ ∫_{[0,L]×E} (φ − 1))`, as ν is a probability measure. The left
side is the same computation for the reflected gaps `G(inr ·)`, independent of the right side,
with `[−L, 0)`; the product of the two expectations is the claim.

*Limit.* For `f ≥ 0` apply the window formula to `φ = e^{−f_L}`, `f_L = f · 1_{[−L,L]×E}` (with
`e^{−∞} = 0`, so `0 ≤ φ ≤ 1`). As `L ↑ ∞`, `Σ_i f_L(τ_i, M_i) ↑ Σ_i f(τ_i, M_i)`, so the left side
converges by dominated convergence (bound 1), and `∫ (1 − e^{−f_L}) ↑ ∫ (1 − e^{−f})` by monotone
convergence.
*Needs:* Tau Ceti `TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure`; Mathlib
`ProbabilityTheory.iIndepFun_iff_map_fun_eq_pi_map`, `MeasureTheory.lintegral_tsum`,
`EReal.exp`.

**Checks.**
- For `f = θ · 1_{(a,b]×E}` with `θ > 0` the formula gives `exp(−λ(b − a)(1 − e^{−θ}))`, the
  Laplace transform of a Poisson count of mean `λ(b − a)`; for `θ = ∞` it gives `e^{−λ(b−a)}`, the
  probability of no point in `(a, b]`.

### 1.4 Absolute convergence

For measurable `f : ℝ × E → ℝ`: if `∫ min(|f|, 1) < ∞`, then almost surely `Σ_i f(τ_i, M_i)` is
summable; if `∫ min(|f|, 1) = ∞`, then almost surely it is not (`summable_marked_dichotomy`).
Summability of a real family is absolute summability, so the statement concerns absolute
convergence only; nothing is claimed about sums taken in a particular order.
Source: Last–Penrose, Proposition 12.1 (stated for `f ≥ 0` and the sum itself). Route. Write
`f̃ = min(|f|, 1)`. If `∫ f̃ < ∞`, then `E Σ_i f̃(τ_i, M_i) = λ ∫ f̃ < ∞` by 1.2, so `Σ f̃ < ∞`
almost surely; then only finitely many indices have `|f| ≥ 1` (each adds 1 to `Σ f̃`), the others
add `|f| = f̃`, so `Σ |f| < ∞`, and a real family is summable exactly when its absolute values are
(`summable_abs_iff`). If `∫ f̃ = ∞`, use `1 − e^{−x} ≥ (1 − e^{−1}) x` on `[0, 1]` (concavity): then
`∫ (1 − e^{−f̃}) = ∞`, so 1.3 gives `E exp(−Σ f̃) = 0` and `Σ f̃ = ∞` almost surely; as `|f| ≥ f̃`,
the family is not absolutely summable.
*Needs:* 1.2, 1.3; Mathlib `summable_abs_iff`.

**Checks.**
- `f(s, m) = 1/(1 + |s|)` is square integrable but `∫ min(|f|, 1) = ∞`, so the sum diverges almost
  surely; `f(s, m) = |s|^{−1/2} 1_{(0,1)}(s)` is integrable, not square integrable, and the sum
  converges almost surely.

### 1.5 The characteristic functional

For measurable `f : ℝ × E → ℝ` with `∫ min(|f|, 1) < ∞`,

```text
E exp(i · poissonSum f) = exp(λ ∫ (e^{i f} − 1))
```

(`integral_cexp_poissonSum`). (Proved here; Last–Penrose, Theorem 3.9, is the nonnegative
analogue.) Route. The integrand on the right is integrable because
`|e^{ix} − 1| ≤ min(|x|, 2) ≤ 2 min(|x|, 1)`. If `f` vanishes outside `[−L, L] × E`, then almost
surely only finitely many terms are nonzero, `poissonSum f` is their finite sum, and
`exp(i poissonSum f) = Π_i e^{i f(τ_i, M_i)}`; the window formula of 1.3 with `φ = e^{i f}` gives
the formula. In general put `f_L = f · 1_{[−L,L]×E}`. By 1.4 the family `f(τ_i, M_i)` is almost
surely summable, so `poissonSum f_L → poissonSum f` almost surely as `L → ∞` (dominated convergence
for series, bound `|f(τ_i, M_i)|`). Both sides then converge by dominated convergence, with bound 1
on the left and `2 min(|f|, 1)` inside the exponent on the right.
*Needs:* 1.3 (window formula), 1.4; Mathlib
`MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Checks.**
- The integrability hypothesis is needed. For `f = 2π` on `[0, ∞) × E` and `f = 1` on
  `[−1, 0) × E`, `e^{if} − 1` is integrable and the right side is `exp(λ(e^{i} − 1))`, of modulus
  `exp(−λ(1 − cos 1)) < 1`; but `∫ min(|f|, 1) = ∞`, the series diverges almost surely, the `tsum`
  is zero and the left side is 1.

### Examples

- The count of points in a bounded Borel window `B` is the sum of `1_{B×E}` over the points; 1.3,
  with the power-series argument of 4.1, shows that it is Poisson with mean `λ Leb(B)`. For
  `B ⊆ (0, ∞)` this is the one-window case of MarkovChainsAndRenewal 7.1.

### Dependencies

1.2 uses the Tau Ceti Erlang law of arrival times; 1.3 uses the library's nonexplosion; 1.4 uses
1.2 and 1.3; 1.5 uses 1.3 and 1.4.

## Layer 2: Campbell's theorem for shot noise

### 2.1 The mean

The marked shot noise is `markedShotNoise g G M t = poissonSum (s, m ↦ g(t − s, m))`, so
`X(t) = Σ'_i g(t − τ_i, M_i)`. For `g` integrable against Lebesgue measure times ν and every `t`,
`X(t)` is integrable and `E X(t) = λ ∫ g` (`integral_markedShotNoise`). Source: Last–Penrose,
equation (15.20) and Example 15.14 (the Poisson driven shot noise), from Proposition 2.7.
Route. Put `f_t(s, m) = g(t − s, m)`; the map `(s, m) ↦ (t − s, m)` preserves Lebesgue measure
times ν, so `f_t` is integrable with the same integral as `g`. Reduction to measurable `g`: choose a
measurable `g'` equal to `g` outside a measurable null set `N`; by 1.2 applied to the indicator of
the image of `N`, almost surely no `(t − τ_i, M_i)` lies in `N`, so `X(t)` is almost surely the shot
noise of `g'`. For measurable `g`, 1.2 applied to `|f_t|` gives `E Σ |f_t(τ_i, M_i)| = λ ∫ |g|`,
finite, so the series converges absolutely almost surely and `|X(t)| ≤ Σ |f_t(τ_i, M_i)|` is
integrable. A real `tsum` of countably many measurable functions is measurable, with the value
zero off the summability set (`Measurable.tsum`). Splitting `f_t = f_t⁺ − f_t⁻` and applying
1.2 to each part gives `E X(t) = λ ∫ g⁺ − λ ∫ g⁻`.
*Needs:* 1.2; Mathlib `Measurable.tsum`, `MeasureTheory.Measure.prod`.

**Checks.**
- Integrability cannot be dropped: for `g(s) = 1/s` on `(0, 1)` and zero elsewhere,
  `∫ min(|g|, 1) = 1`, so `X(t)` is finite almost surely, but `E X(t) = λ ∫ g = ∞` by 1.2 and `X(t)`
  is not integrable.

### 2.2 The covariance

For `g` integrable and square integrable and all `t, τ`, `X(t)` is square integrable and

```text
Cov(X(t), X(t + τ)) = λ ∫ g(s, m) g(s + τ, m) ds ν(dm)
```

(`covariance_markedShotNoise`). Source: Last–Penrose, Proposition 15.13 and Lemma 12.2. Route
(own organisation). Reduce to measurable `g` as in 2.1.
*Second moment.* For measurable `f ≥ 0` on `ℝ × E`, `E (Σ_i f(τ_i, M_i))² = λ ∫ f² + (λ ∫ f)²` in
`[0, ∞]`. For `f` bounded by `c` and zero outside `[−L, L] × E`, the window formula of 1.3 with
`φ = e^{θ f}` (bounded, equal to 1 outside the window) gives `E e^{θ Σ f} = exp(λ ∫ (e^{θ f} − 1))`
for every real θ. With `θ f` replaced by `θ c 1_{[−L,L]×E}` this shows that the number of points in
the window has finite exponential moments, which dominates the θ-derivatives of `e^{θ Σ f}` near
zero; two derivatives at `θ = 0` give the identity. For general `f ≥ 0` take
`f_k = min(f, k) 1_{[−k,k]×E} ↑ f` and use monotone convergence on both sides.
*Polarisation.* For `f, h ≥ 0` with finite integrals of `f, h, f², h²`, apply the second moment to
`f + h` and subtract: `E[Σ f · Σ h] = λ ∫ f h + λ² ∫ f ∫ h`.
*Signed kernels.* With `f_t(s, m) = g(t − s, m)` and `f_{t+τ}`, split both into positive and
negative parts; each part has finite second moment, so `X(t) ∈ L²`, and expanding the product into
four terms gives `E[X(t) X(t + τ)] = λ ∫ f_t f_{t+τ} + λ² ∫ f_t ∫ f_{t+τ}`. Subtract the product of
the means (2.1) and substitute `r = t − s`.
*Needs:* 1.3 (window formula), 2.1; Mathlib `ProbabilityTheory.covariance`.

**Checks.**
- `g = 1_{[0,a)}` (constant mark): `X(t)` counts the points in `(t − a, t]`, a Poisson count; mean
  `λa`, variance `λa`, and `Cov(X(t), X(t + τ)) = λ (a − |τ|)⁺`, the mean count of the overlap.
- `g(s) = e^{−s} 1_{s≥0}`: mean λ, variance `λ/2`, covariance `λ e^{−|τ|}/2`.
- `g = 1_{[0,1)} − 1_{[1,2)}` (signed): mean 0, variance `2λ`, and covariance `−λ` at `τ = 1`, which
  is `−Var N(t − 1, t]` computed directly.
- Integrability cannot be dropped: `g(s) = 1/(1 + |s|)` is square integrable, the series diverges
  almost surely (1.4), `X(t) = 0` almost surely and the covariance is zero, while
  `λ ∫ g² = 2λ > 0`. Square integrability cannot be dropped:
  `g(s) = s^{−1/2} 1_{(0,1)}(s)` is integrable and `E X(t)² = ∞`.

### 2.3 Cumulants

For `g` integrable and bounded (`|g| ≤ C` everywhere) and every `t`, the cumulant generating
function of `X(t)` is

```text
cgf_{X(t)}(θ) = λ ∫ (e^{θ g} − 1),   θ ∈ ℝ,
```

and its n-th derivative at zero is `λ ∫ gⁿ` for every `n ≥ 1` (`cgf_markedShotNoise`).
(Proved here.) Route. Reduce to measurable `g` as in 2.1 and put `f = f_t`,
`f_L = f 1_{[−L,L]×E}`. The window formula of 1.3 gives
`E e^{θ Σ f_L} = exp(λ ∫ (e^{θ f_L} − 1))`. As `L → ∞`, the right side converges to
`exp(λ ∫ (e^{θ g} − 1))` by dominated convergence, using `|e^{θx} − 1| ≤ |θ| e^{|θ|C} |x|` for
`|x| ≤ C`. On the left, `Σ f_L → Σ f` almost surely (1.4); the second moments
`E e^{2θ Σ f_L} = exp(λ ∫ (e^{2θ f_L} − 1)) ≤ exp(2λ|θ| e^{2|θ|C} ∫ |g|)` are bounded in `L`, so
the family is uniformly integrable, the limit `e^{θ X(t)}` is integrable by Fatou's lemma, and the
expectations converge to `E e^{θ X(t)}` (`MeasureTheory.tendsto_Lp_finite_of_tendsto_ae` with
`p = 1`). Hence `mgf` is the positive number `exp(λ ∫ (e^{θ g} − 1))` and `cgf` is its exponent.
For `n ≥ 1`, the n-th derivative of `θ ↦ λ ∫ (e^{θ g} − 1)` is `λ ∫ gⁿ e^{θ g}`, by induction with
`hasDerivAt_integral_of_dominated_loc_of_deriv_le` and, for `θ'` within 1 of `θ`, the bound
`|gⁿ e^{θ' g}| ≤ C^{n−1} e^{(|θ|+1)C} |g|`; at zero it is `λ ∫ gⁿ`.
*Needs:* 1.3 (window formula), 1.4; Mathlib `ProbabilityTheory.cgf`, `ProbabilityTheory.mgf`,
`MeasureTheory.tendsto_Lp_finite_of_tendsto_ae`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**
- `g = 1_{[0,a)}`: `cgf(θ) = λa(e^θ − 1)`, the cumulant generating function of a Poisson count of
  mean `λa`; every cumulant equals `λa = λ ∫ gⁿ`.
- `g(s) = e^{−s} 1_{s≥0}`: the cumulants are `λ/n` for `n ≥ 1`.
- Boundedness cannot be dropped: for the integrable `g(s) = s^{−1/2} 1_{(0,1)}(s)`,
  `E e^{θX(t)} = ∞` for `θ > 0`, so `mgf` and `cgf` are zero there, while for `θ < 0`
  `cgf(θ) = λ ∫ (e^{θ g} − 1)` has difference quotients tending to `λ ∫ g = 2λ` as `θ ↑ 0`; so `cgf`
  is not differentiable at zero and its derivative there is zero, not `λ ∫ g = 2λ`.
  Integrability cannot be dropped: for the bounded `g(s) = 1/(1 + |s|)`, `X(t) = 0` almost surely
  (1.4) and every derivative of `cgf` vanishes, while `λ ∫ g² = 2λ`.

### Examples

- Random amplitudes: for `E = ℝ`, `g(s, m) = m h(s)` with `h` integrable and square integrable and
  ν with finite second moment, 2.1 and 2.2 give mean `λ E[M] ∫ h` and covariance
  `λ E[M²] ∫ h(s) h(s + τ) ds`.

### Dependencies

2.1 uses 1.2; 2.2 uses 1.3 and 2.1; 2.3 uses 1.3 and 1.4.

## Layer 3: stationarity and the Gaussian limit

### 3.1 Strict stationarity

For every measurable kernel `g` and every `s`, the path map `ω ↦ (t ↦ X(t)(ω))` is measurable for
the product σ-algebra on `ℝ → ℝ`, and the law of `t ↦ X(t + s)` equals the law of `t ↦ X(t)`
(`map_markedShotNoise_shift`). Source: Last–Penrose, Exercise 15.10 (finite-dimensional laws, for
the Poisson driven shot noise); route proved here. Measurability: each `X(t)` is measurable as in
2.1, and a map into a product is measurable when its coordinates are. Two probability measures on
`ℝ → ℝ` that agree on measurable cylinders are equal (the cylinders form a generating π-system,
`MeasureTheory.isPiSystem_measurableCylinders`), so it suffices to compare the laws of
`(X(t_1 + s), …, X(t_k + s))` and `(X(t_1), …, X(t_k))` on `EuclideanSpace ℝ (Fin k)`, and by
`MeasureTheory.Measure.ext_of_charFun` their characteristic functions. The integral
`∫ min(|g(t − ·, ·)|, 1)` does not depend on `t`. If it is infinite, every `X(t)` is zero almost
surely by 1.4 and both laws are the point mass at zero. If it is finite, for `u ∈ ℝ^k` the
function `F_s(r, m) = Σ_j u_j g(t_j + s − r, m)` has
`∫ min(|F_s|, 1) ≤ Σ_j max(|u_j|, 1) ∫ min(|g|, 1)` and `Σ_j u_j X(t_j + s) = poissonSum F_s` almost
surely (each series is summable), so 1.5 gives the
characteristic function `exp(λ ∫ (e^{i F_s} − 1))`; the substitution `r ↦ r + s` in the Lebesgue
integral shows that it does not depend on `s`.
*Needs:* 1.4, 1.5; Mathlib `MeasureTheory.Measure.ext_of_charFun`,
`MeasureTheory.isPiSystem_measurableCylinders`, `MeasureTheory.generateFrom_measurableCylinders`.

### 3.2 The Gaussian limit at high density

Let rates `λ_n → ∞` and, for each `n`, a marked Poisson input of rate `λ_n` with the same mark law
ν, all on one probability space; let `g` be integrable and square integrable, and write `X_n` for
the shot noise of the n-th input and `c = ∫ g`. For every `k`, times `t_1, …, t_k` and
`u ∈ ℝ^k`,

```text
E exp(i Σ_j u_j (X_n(t_j) − λ_n c)/√λ_n)  →  exp(−½ Σ_{j,l} u_j u_l C(t_l − t_j)),
C(τ) = ∫ g(s, m) g(s + τ, m) ds ν(dm)
```

(`tendsto_cexp_standardized_markedShotNoise`). (Proved here.) Route. Reduce to measurable `g` as
in 2.1 (for each `n` the shot noise changes only on a null set). Put
`F(r, m) = Σ_j u_j g(t_j − r, m)`, integrable and square integrable, with `∫ F = c Σ_j u_j`. As in
3.1, `Σ_j u_j X_n(t_j) = poissonSum F` almost surely, and 1.5 applied to `F/√λ_n` gives

```text
E exp(i Σ_j u_j (X_n(t_j) − λ_n c)/√λ_n) = exp(λ_n ∫ (e^{i F/√λ_n} − 1 − i F/√λ_n)).
```

Pointwise, `λ (e^{iy/√λ} − 1 − iy/√λ) → −y²/2` as `λ → ∞`, and
`|e^{ix} − 1 − ix| ≤ x²/2` bounds the integrand by `F²/2`, which is integrable; dominated
convergence gives the limit `exp(−½ ∫ F²)`. Expanding `F²` and substituting `r' = t_j − r` gives
`∫ F² = Σ_{j,l} u_j u_l C(t_l − t_j)`.
*Needs:* 1.4, 1.5; Mathlib `MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Checks.**
- `g(s) = e^{−s} 1_{s≥0}`: the limit covariance is `C(τ) = e^{−|τ|}/2`, the stationary
  Ornstein–Uhlenbeck covariance with unit relaxation rate and stationary variance ½.
- `g = 1_{[0,1)}`: at one time the statement is the normal approximation of a Poisson count of mean
  `λ_n`, standardised by `√λ_n`.
- Integrability cannot be dropped: for `g(s) = 1/(1 + |s|)` every `X_n(t)` is zero almost surely,
  `∫ g` is the Bochner value zero, and the left side is 1, while the right side is `e^{−u²}` at
  one time (`C(0) = 2`). Square integrability cannot be dropped: for `g(s) = s^{−1/2} 1_{(0,1)}(s)`
  and `u > 0` the exponent is `2u² ∫_{u/√λ_n}^∞ (e^{iy} − 1 − iy) y^{−3} dy`, whose real part tends
  to `−∞`, so the left side tends to 0, while `C(0)` is the Bochner value zero and the right side
  is 1.

### Examples

- A constant mark recovers the filtered Poisson process `Σ_i h(t − τ_i)`: stationarity for every
  measurable `h`, and the Gaussian limit with covariance `∫ h(s) h(s + τ) ds`.

### Dependencies

3.1 and 3.2 use 1.4 and 1.5.

## Layer 4: the infinite-server queue

### 4.1 The number of customers in the system

Take marks in `ℝ≥0`, read as service times with law ν: customer `i` arrives at `τ_i` and is
present during `[τ_i, τ_i + M_i)`. `numberInSystem G M t` is the number of `i` with
`τ_i ≤ t < τ_i + M_i`, in `ℕ∞`. If the mean service time `m = ∫ x ν(dx)` is finite, the number in
system at time `t` has the Poisson law of mean `λ m`; if `m = ∞`, it is infinite almost surely
(`numberInSystem_poisson`). Source: Popov (2024), p. 3, for the queue started empty at time 0
(Poisson with mean `λ E(S ∧ t)`); the stationary form on the whole line is proved here. Route. The
number in system `Q` is the `ℝ≥0∞`-valued sum `Σ_i 1_B(τ_i, M_i)` over
`B = {(s, x) : s ≤ t < s + x}`,
hence measurable. By Tonelli, `(Leb ⊗ ν)(B) = ∫ Leb{s : t − x < s ≤ t} ν(dx) = m`. For `θ > 0`,
1.3 with `f = θ 1_B` gives `E e^{−θ Q} = exp(−λ m (1 − e^{−θ}))`. If `m = ∞` the right side is
zero, so `Q = ∞` almost surely. If `m < ∞`, letting `θ ↓ 0` gives `P(Q < ∞) = 1`; with
`z = e^{−θ} ∈ (0, 1)`, `Σ_k P(Q = k) z^k = Σ_k e^{−λm} (λm)^k z^k / k!`, two power series with
coefficients `a_k, b_k ∈ [0, 1]` that agree on `(0, 1)`. They have equal coefficients: letting
`z ↓ 0` (dominated convergence for series, bound `z^k ≤ 2^{−k}` for `z ≤ ½`) gives `a_0 = b_0`;
subtracting, dividing by `z` and repeating gives `a_k = b_k` for every `k`.
*Needs:* 1.3; Mathlib `ProbabilityTheory.poissonMeasure`.

**Checks.**
- Exponential service of rate μ: mean `λ/μ`, the stationary law of the M/M/∞ queue. Deterministic
  service `d`: Poisson of mean `λd`.
- By 2.2 with the kernel `g(s, x) = 1{0 ≤ s < x}` (integrable when `m < ∞`), the covariance of the
  numbers in system at `t` and `t + τ` is `λ E(M − |τ|)⁺`; for exponential service it is
  `(λ/μ) e^{−μ|τ|}`.
- A service law with an atom at zero contributes customers present for no time; they are never
  counted, and `m` does not see them.

### Examples

- The queue started empty at time 0: the customers arriving in `(0, t]` and still present at `t`
  are counted by `1_{B'}` with `B' = {(s, x) : 0 < s ≤ t < s + x}`, of measure `E(M ∧ t)`, and the
  argument of 4.1 makes their number Poisson of mean `λ E(M ∧ t)`.

### Dependencies

4.1 uses 1.3.

## Scope and ownership

Owned here: the two-sided marked model built from exponential gaps (`twoSidedPoint`,
`IsMarkedPoissonInput`, `poissonSum`), its Campbell formula, Laplace and characteristic functionals
and absolute-convergence dichotomy (Layer 1); shot noise with its mean, covariance and cumulants
(Layer 2); strict stationarity and the high-density Gaussian limit (Layer 3); the number in system
of the infinite-server queue (Layer 4).

Already in the library: the arrival times of a renewal process
(`TauCeti.Probability.arrival`), their Erlang laws for exponential gaps and nonexplosion, and the
Poisson law of the one-sided count. Stated by MarkovChainsAndRenewal (Layer 7): exponential
renewals form a Poisson process on the half-line, with the microscopic characterisation,
restarting, thinning and superposition; this roadmap does not restate them and does not use them.
Infinitely divisible laws and compound Poisson approximation are
InfinitelyDivisibleLawsAndTriangularArrays.

PointProcesses (an open roadmap, not on main) states the Campbell formula and the Laplace
functional of a Poisson random measure on a general measurable space (its Layer 4), the marking and
superposition theorems (its Layer 6), and the intensity and covariance measure of a shot-noise Cox
director on Euclidean space (its Layer 9). Targets 1.2 and 1.3 are the line-and-marks cases of its
Layer 4 formulas, and 2.1 and 2.2 with a constant mark and a nonnegative kernel correspond to its
Layer 9 shot-noise example; here they are stated for a different object, an explicitly constructed
sequence of marked points rather than a random measure, and proved from the gaps. It states a
characteristic function only for compound Poisson sums over a time interval (its Layer 6), a special
case of 1.5; the convergence dichotomy (1.4), the cumulants, the stationarity of shot noise, the
Gaussian limit and the queue are not stated there. This roadmap does not depend on that one.

Not treated here: random measures and point processes on general spaces, the general Mecke and
marking theorems, Palm theory, Cox processes driven by shot noise, Poisson processes that are not
homogeneous, spectral densities of shot noise, and departure processes of queues.

Downstream: Layer 1 is a self-contained Poisson calculus on the line for work on noise processes
and queues; Layer 3 supplies the Gaussian approximation of high-density shot noise.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.expMeasure (r : ℝ) : Measure ℝ`
  (`Mathlib/Probability/Distributions/Exponential.lean`), defined as `gammaMeasure 1 r`;
  `ProbabilityTheory.gammaMeasure`
  (`Mathlib/Probability/Distributions/Gamma.lean`); `ProbabilityTheory.poissonMeasure (r : ℝ≥0)`
  (`Mathlib/Probability/Distributions/Poisson/Basic.lean`).
- `ProbabilityTheory.iIndepFun_iff_map_fun_eq_pi_map`
  (`Mathlib/Probability/Independence/Basic.lean`): for a finite index type, a probability measure
  and almost everywhere measurable maps,
  independence is equivalent to the joint law being the product of the marginals.
- `MeasureTheory.lintegral_tsum` (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`): countable
  index, almost everywhere measurable summands. `Measurable.tsum`
  (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean`): a `tsum` of countably many measurable
  functions into a complete second-countable space such as `ℝ` is measurable.
- `MeasureTheory.tendsto_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`): integrable bound, a.e. bounds and
  a.e. convergence. `MeasureTheory.tendsto_Lp_finite_of_tendsto_ae`
  (`Mathlib/MeasureTheory/Function/UniformIntegrable.lean`): finite measure, `1 ≤ p < ∞`, uniform
  integrability, a limit in `Lᵖ` and a.e. convergence give `Lᵖ` convergence.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
  (`Mathlib/Analysis/Calculus/ParametricIntegral.lean`): differentiation under the integral sign,
  for an integrand integrable near the base point and a derivative with an integrable bound
  uniform on a neighbourhood.
- `MeasureTheory.Measure.ext_of_charFun`
  (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`): finite measures on a complete
  second-countable real inner product space with equal `charFun`.
- `MeasureTheory.isPiSystem_measurableCylinders`, `MeasureTheory.generateFrom_measurableCylinders`
  (`Mathlib/MeasureTheory/Constructions/Cylinders.lean`): the measurable cylinders of a product
  of measurable spaces form a π-system generating the product σ-algebra.
- `summable_abs_iff` (`Mathlib/Topology/Algebra/InfiniteSum/Order.lean`): in a complete linearly
  ordered additive group such as `ℝ`, a family is summable iff its absolute values are.
- `ProbabilityTheory.covariance` (`Mathlib/Probability/Moments/Covariance.lean`);
  `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`
  (`Mathlib/Probability/Moments/Basic.lean`); `EReal.exp`
  (`Mathlib/Analysis/SpecialFunctions/Log/ERealExp.lean`).

### From Tau Ceti

- `TauCeti.Probability.arrival (T : ℕ → Ω → ℝ≥0) (n : ℕ) : Ω → ℝ≥0`, the sum of the first `n`
  increments (`TauCeti/Probability/Renewal/Basic.lean`, module `TauCeti.Probability.Renewal.Basic`).
- `TauCeti.Probability.hasLaw_arrival_gammaMeasure` (`TauCeti/Probability/Renewal/Exponential.lean`,
  module `TauCeti.Probability.Renewal.Exponential`): for independent increments with law
  `expMeasure r` and `n ≠ 0`, `arrival T n` has law `gammaMeasure n r`.
- `TauCeti.Probability.ae_tendsto_arrival_atTop_of_expMeasure` (same file): measurable independent
  increments with law `expMeasure r` give arrival times tending to infinity almost surely.

## References

- G. Last and M. Penrose, *Lectures on the Poisson Process*, IMS Textbooks, Cambridge University
  Press, 2017; authors' version of 21 August 2017 (open PDF on the authors' pages). Proposition 2.7
  (p. 13), Theorem 3.3 (p. 20), Theorem 3.9 (p. 23), Theorem 5.6 (p. 42), Theorem 7.2 (p. 59),
  Proposition 12.1 (p. 111), Lemma 12.2 (p. 112), equations (15.18)–(15.20) and
  Proposition 15.13 (p. 161), Example 15.14 (p. 162), Exercise 15.10 (p. 165). Its historical
  notes trace Proposition 2.7 to N. Campbell, *The study of discontinuous phenomena*, Proc.
  Cambridge Philos. Soc. 15 (1909), 117–136.
- S. Popov, *On transience of M/G/∞ queues*, arXiv:2406.03517v2 (2024).
