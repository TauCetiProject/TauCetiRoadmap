# Roadmap: arithmetic Dirichlet series and Tauberian methods, part II — poles of higher order

**Summary.** This roadmap extends the Wiener–Ikehara layer of
[ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md)
from simple poles to poles of any integer order. Its central theorem is the integer-order case of
Delange's Tauberian theorem: if a nonnegative nondecreasing function `α` on `[0, ∞)` has an
absolutely convergent Laplace transform `F(s)` on `Re s > a > 0`, if `F` continues holomorphically
across every point of the line `Re s = a` other than `a`, and if near `a` it has the form
`g(s)/(s − a)^(k+1)` with `g` holomorphic and `g(a) = A > 0`, then
`α(t) ~ (A/k!) e^(at) t^k`. Through the identity `∫₀^∞ e^(−st) S_c(eᵗ) dt = F(s)/s` for the
counting function `S_c(X) = ∑_{1≤n≤X} c_n` of a nonnegative Dirichlet series `F`, this becomes the
counting theorem `S_c(X) ~ (A/(a·k!)) X^a (log X)^k`, together with the two perturbation statements
an arithmetic count needs: finitely many altered coefficients, and a signed error dominated by a
series whose pole has strictly lower order. The roadmap builds the one-sided Laplace transform with
a complex parameter, the boundary hypothesis as a named predicate, a squared-sinc kernel of total
mass one and Delange's polynomial regularising weight, and proves the theorem by regularisation,
Fourier smoothing and a monotone unsmoothing step. It ends with the divisor functions of `ζ²` and
`ζ⁴` as checks of the normalisation, and with a dyadic sequence showing that the hypothesis on the
rest of the boundary line cannot be dropped.

The end theorems are `delangeLaplace` (Layer HP.3) and its counting forms `delangeDirichlet` and
`delangeDirichlet_positiveAbscissa` (Layer HP.4). For `k = 0` the two Dirichlet counting implications are
special cases of the parent's Wiener–Ikehara layer; the new content is `k ≥ 1`, that is, a
generating series with a pole of order `m = k + 1 ≥ 2` at its abscissa of convergence. This is the
situation of Wood's totally real counts: for `r ≥ 1`, the series `F_r` counts continuous
homomorphisms from the absolute Galois group of ℚ to `C₂^(r+1)` whose finite-prime inertia images
meet `C₂^r × {1}` trivially and whose complex conjugation is trivial. The index is the absolute
discriminant of the quadratic character projected to the last factor, with the trivial
homomorphism treated separately. The pole has order `2^r`, and the count grows like
`X (log X)^(2^r − 1)` (Wood 2019, §7, pp. 416–417; wood2019 line 1652).

| Layer | Title | Headline targets |
| --- | --- | --- |
| HP.0 | Convergent Laplace transforms and boundary continuation | `HasLaplace`, `PoleBoundary` |
| HP.1 | Squared-sinc smoothing and the polynomial weight | `squaredSinc`, `delangeWeight` |
| HP.2 | Regularised transforms and the smoothed limit | `regularizedBoundaryL1`, `delangeSmoothedLimit` |
| HP.3 | Delange's theorem for integer pole orders | `monotoneUnsmoothing`, `delangeLaplace` |
| HP.4 | Counting functions of Dirichlet series and perturbations | `logSummatory_hasLaplace`, `delangeDirichlet`, `delangeDirichlet_positiveAbscissa`, `finiteChange_asymptotic`, `lowerPole_perturbation` |
| HP.5 | Zeta checks and the necessity of the boundary hypothesis | `zetaSquare_counting`, `dyadicLocalPoleCounterexample` |

The layer labels HP.0–HP.5 are the labels other roadmaps cite. The README states the API and
Checks. `Suggested.lean` states the headline acceptance theorems on the pinned carriers.

Suggested home: `HasLaplace` and its API in `TauCeti/Analysis/LaplaceTransform.lean`, namespace
`TauCeti`, following Dennj Osele, “The Laplace transform”, declarations `LaplaceConvergent`,
`laplace`, and `HasLaplace`; everything else in
`TauCeti/NumberTheory/LSeries/HigherPole/`, namespace TauCeti.HigherPoleTauberian, one file per
layer. `Suggested.lean` states the definitions and the main theorems in the namespace
`TauCetiRoadmap.ArithmeticDirichletSeriesPartII`.

## Scope and ownership

**Owned here.**

- The one-sided Laplace transform of a function, with a complex parameter, as the predicate
  `HasLaplace` with its projection, uniqueness, linearity and dilation API.
- The boundary predicate `PoleBoundary F a k A` for a pole of order `k + 1` on the line of
  convergence, with uniqueness of the leading coefficient and of the order, division by the
  argument, rescaling, multiplication by regular functions and products.
- The normalised squared-sinc kernel `squaredSinc` and Delange's polynomial weight
  `delangeWeight`.
- The locally integrable boundary values of the regularised remainder,
  the smoothed limit and the monotone unsmoothing step.
- Delange's theorem for nondecreasing functions and pole orders `k + 1`, `k ∈ ℕ` (the
  integer-exponent case of his Theorem III).
- The passage from a nonnegative Dirichlet series to the Laplace transform of its logarithmic
  counting function, the counting theorems at abscissa one and at a positive abscissa,
  invariance under finitely many altered coefficients, and the lower-pole perturbation theorem, at
  the scale `X^a (log X)^k`.
- The checks with the divisor functions of `ζ²` and `ζ⁴`, and the dyadic counterexample.

**Consumed.** Mathlib's `LSeries`, `LSeriesHasSum` and `LSeries.term`; Bochner integration,
Fubini, dominated convergence, Fatou's lemma and differentiation under the integral sign; the
Riemann–Lebesgue lemma; `Real.sinc`; the real Gamma function; analytic functions and removable
singularities; `riemannZeta` with its residue at `1`; arithmetic functions and Dirichlet
convolution. Tau Ceti's generic summatory function `TauCeti.summatory` (the generic form of the
inclusive summatory functions of the parent's Layer 4.2), its Laurent principal parts at a
meromorphic point and its sine integral. Every item is listed with its exact use under *Exact
supplier contracts*.

**Not owned here.**

- The complex Gamma–Laplace integral and its compact parameter-derivative bounds belong to
  AnalyticNumberTheoryPartII §4.5c (Complex Gamma–Laplace adapter). Its specialization to exponent
  `k + 1` and rate `s − a` supplies the integer model used here; no separate Gamma-integral
  theorem is a target of this roadmap.
- Wiener–Ikehara for a simple pole with a merely continuous boundary remainder, its zero-residue
  case and its variants (natural cutoffs, finitely many negative coefficients, a pole at a positive
  abscissa) are the parent's
  [Layer 9](../../Completed/ArithmeticDirichletSeries/README.md#layer-9-wienerikehara).
  Tau Ceti proves them as `TauCeti.LSeries.wienerIkehara`,
  `TauCeti.LSeries.wienerIkehara_zero`, `TauCeti.LSeries.wienerIkehara_of_eventually_nonneg`,
  `TauCeti.LSeries.wienerIkehara_nat` and `TauCeti.LSeries.wienerIkehara_rpow`
  (`TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean` and `Variants.lean`). At `k = 0`
  HP.4.2 and HP.4.3 are special cases of those, under the stronger hypothesis
  that the boundary extension is holomorphic rather than continuous; this roadmap proves nothing
  new at `k = 0` and uses its `k = 0` instances only as consistency checks.
- Arithmetic functions on ideals, ideal Euler products, prime counting functions and Dirichlet
  density are the parent's Layers 0–8 and 10.
- For counts of abelian extensions, the local factors, continuation, positivity of the leading
  coefficient and arithmetic majorants for non-surjective homomorphisms are input to an
  application of HP.4. This roadmap owns the generic analytic implication, with these inputs
  as explicit hypotheses, rather than any arithmetic construction of them.
- Delange's theorems for non-integral exponents, for exponents `≤ 0` and with logarithmic factors
  (his Theorems III and IV in full, which use complex powers and logarithms through his Lemmas 4–5)
  are not part of this roadmap: it treats pole orders `k + 1` with `k ∈ ℕ` at an abscissa `a > 0`.
- The Laplace transform of a positive measure at real arguments (Bernstein's theorem, in
  [OneParameterSemigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md),
  Part B — Completely monotone (and Bernstein) functions) is a different carrier from
  `HasLaplace`, which transforms functions of exponential growth at complex arguments.
  The periodic Fejér kernel is a function on a circle, whereas the squared-sinc kernel developed
  here is a function on `ℝ`.

## Conventions

| Subject | Convention |
| --- | --- |
| pole order | A pole of order `m = k + 1` with `k : ℕ`; `k = 0` is a simple pole. The leading coefficient `A` is the value at `a` of the holomorphic numerator `g` in `F(s) = g(s)/(s − a)^(k+1)`. It is real. |
| abscissa | The Tauberian and counting theorems (HP.2.3–HP.4.5) are stated at an abscissa `a > 0`, and the case `a = 0` is excluded from them (a witness is under HP.4.3). The predicates of HP.0, the supplied Gamma model and the boundary lemma HP.2.2 hold for every real `a`. |
| coefficients | Coefficients are `c : ℕ → ℝ`. The coefficient `c 0` is ignored, as in Mathlib's `LSeries.term`, which is `0` at `n = 0`. |
| counting function | `S_c(X) = TauCeti.summatory (fun n : ℕ ↦ n) ĉ X` with `ĉ 0 = 0` and `ĉ n = c n` for `n > 0`. The cutoff is inclusive: `S_c(X) = ∑_{1 ≤ n ≤ X} c n`, `S_c(1) = c 1`, `S_c(X) = 0` for `X < 1`. For `X ≥ 0` it equals `∑ n ∈ Finset.Icc 1 ⌊X⌋₊, c n`, the form used by Tau Ceti's Wiener–Ikehara theorems (by `TauCeti.summatory_eq_summatory_natFloor` and `TauCeti.mem_normLE_natCast`). The `Northcott` instance `northcott_natId` for the identity height on `ℕ` (finite sublevel sets `Set.Iic b`) is part of Layer HP.4. |
| Laplace transform | The ordinary one-sided transform `∫₀^∞ e^(−st) f(t) dt` of the function `f`, never the Laplace–Stieltjes transform `∫ e^(−st) df(t)`. Integrals are Bochner integrals for Lebesgue measure restricted to `(0, ∞)`; the endpoint is a null set, so `[0, ∞)` gives the same predicate. Convergence (integrability) is part of every Laplace assertion. Real functions are cast to `ℂ` before the predicate is applied. |
| boundary data | Every analytic agreement in `PoleBoundary` is required only on the open half-plane `Re s > a`. The values of a total function `F` on the line `Re s = a`, and in particular those of Mathlib's totalised `LSeries` (which is `0` where the series does not converge), carry no meaning and are never used. |
| kernel | `squaredSinc λ v = (λ/π) sinc(λv)²` with `Real.sinc 0 = 1`; total mass one for `λ > 0`. Fourier variables are angular: the kernel is `(1/2π) ∫_{−2λ}^{2λ} (1 − |y|/(2λ)) e^(iyv) dy`. Mathlib's Fourier transform uses `e^(−2πivw)`; the substitution `w = y/(2π)` converts. |
| weight | `delangeWeight k t = t ∫₀¹ e^(−ut) uᵏ/k! du`, total in `t`, with the cutoff `1`. |
| powers and limits | `X^a` is `Real.rpow`; `(log X)^k` is a natural power of `Real.log X`; `k!` is `Nat.factorial k` cast to `ℝ`. Asymptotic conclusions are limits of explicit ratios, `Tendsto (fun X ↦ S_c X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)`; the denominators are eventually positive. |

The conventions carry explicit witnesses:

- *Inclusive cutoff, `n = 0` discarded:* `S_c(e^0) = c 1` and `S_c(e^(log 2)) = c 1 + c 2`.
- *Ordinary, not Stieltjes, transform, hence the factor `1/a`:* the sequence with only `c 1 = 1`
  has `S_c(eᵗ) = 1` on `[0, ∞)`, with transform `1/s` (its Stieltjes transform would be `1`).
  Consequently `c n = n`, whose series `ζ(s − 1)` has a simple pole at `a = 2` with numerator `1`,
  has `∑_{n≤X} n ~ X²/2 = (A/a) X^a`.
- *Angular inverse Fourier phase:* at `y = 2π` and `v = 0, 1/4`, `exp(iyv)` is `1, i`;
  the forward phase `exp(−2πivw)` at `w = 1` is `1, −i`. At `λ = 1` the triangle formula
  yields `K_1(0) = 1/π` and `K_1(π/2) = 4/π³`, fixing both the mass factor and bandwidth.
- *Weight cutoff:* at `k = 0`, cutoff `1` gives `w_0(1) = 1 − 1/e` and
  `w_0(2) = 1 − 1/e²`; cutoff `1/2` gives `1 − e^(−1/2)` and `1 − 1/e` instead.
- *`k!`, not `k`, `(k−1)!` or `(k+1)!`:* `d₄ = σ₀ * σ₀` has series `ζ(s)⁴`, a pole of order four
  (`k = 3`) with numerator value `1`, and `∑_{n≤X} d₄(n) ~ X (log X)³/6`.

## Exact supplier contracts

### From Mathlib (pinned 6b7abb3c)

- `LSeriesHasSum f s a` and `LSeries.term` (`Mathlib/NumberTheory/LSeries/Basic.lean`): the
  Dirichlet-series hypothesis of Layers HP.4–HP.5, always on an open half-plane. Summability in
  `ℂ` gives absolute summability, which is what the termwise integration in HP.4.1 uses.
- `AnalyticAt`, `AnalyticOnNhd` (`Mathlib/Analysis/Analytic/Basic.lean`) for the germs of
  `PoleBoundary`; the identity theorem `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`
  (`Mathlib/Analysis/Analytic/Uniqueness.lean`) for its uniqueness API.
- `MeasureTheory.Integrable` and the Bochner integral; `MeasureTheory.integral_integral_swap`
  (Fubini, assuming integrability of the uncurried function on the product);
  `MeasureTheory.integral_tsum` (termwise integration, assuming measurability and a finite sum of
  norm integrals); `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` (a countably
  generated filter, an integrable majorant and almost-everywhere convergence);
  `MeasureTheory.lintegral_liminf_le'` (Fatou for nonnegative functions along a countably
  generated filter); `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the
  integral with a complex parameter, assuming a local integrable bound on the derivative);
  `MeasureTheory.integral_comp_mul_left_Ioi` (positive dilation on `(0, ∞)`).
  Fubini is in `Mathlib/MeasureTheory/Integral/Prod.lean`; termwise integration and dominated
  convergence are in `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`; Fatou is in
  `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`; differentiation is in
  `Mathlib/Analysis/Calculus/ParametricIntegral.lean`; dilation is in
  `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`.
- `integral_exp_mul_complex_Ioi` and `integrableOn_exp_mul_complex_Ioi`
  (`Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean`): for `Re z < 0`, `e^(zt)` is
  integrable on `(c, ∞)` with integral `−e^(zc)/z`.
- `Real.GammaIntegral_convergent`, `Real.integral_rpow_mul_exp_neg_mul_Ioi` and
  `Real.Gamma_nat_eq_factorial` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`): convergence
  of the Euler integral for a positive real parameter, its value `(1/r)^a Γ(a)` at a positive rate
  `r`, and `Γ(k + 1) = k!`. These are statements for real parameters only.
- `Real.sinc`, `Real.continuous_sinc`, `Real.abs_sinc_le_one`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean`).
- `Real.tendsto_integral_exp_smul_cocompact` (`Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`):
  `∫ e^(−2πivw) f(v) dv → 0` as `w` leaves compact sets, for every `f`.
- `Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt`
  (`Mathlib/Analysis/Complex/RemovableSingularity.lean`).
- `riemannZeta`, `analyticOn_riemannZeta` (analytic on `{1}ᶜ`), `riemannZeta_residue_one`
  (`(s − 1) ζ(s) → 1` on the punctured neighbourhood of `1`), `zeta_eq_tsum_one_div_nat_cpow`
  (agreement with the series on `Re s > 1` only), `Complex.summable_one_div_nat_cpow`.
  The zeta declarations are in `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`;
  complex-power summability is in `Mathlib/Analysis/PSeriesComplex.lean`.
- `LSeriesHasSum.convolution` (`Mathlib/NumberTheory/LSeries/Convolution.lean`),
  `ArithmeticFunction.zeta_mul_pow_eq_sigma`, `ArithmeticFunction.pow_zero_eq_zeta`,
  `ArithmeticFunction.sigma_zero_apply` (`σ₀ n = #(Nat.divisors n)`).
  The arithmetic-function identities are in `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean`.
- `hasSum_geometric_of_norm_lt_one` (`Mathlib/Analysis/SpecificLimits/Normed.lean`).
- `Northcott` (`Mathlib/Order/Northcott.lean`).

### From Tau Ceti (pinned a91d3aaf)

- `TauCeti.summatory N w X` (`TauCeti/Order/Northcott/Basic.lean`): for a natural-valued height
  `N : ι → ℕ` with a `Northcott N` instance, the sum of `w` over the finite set
  `TauCeti.normLE N X` of indices with `N i ≤ X`, inclusive. Used with
  `TauCeti.summatory_nonneg`, `TauCeti.summatory_mono` (nonnegative weights give a monotone
  function of the cutoff), `TauCeti.eventually_summatory_sub_eq` (weights equal outside a finite
  set have eventually constant difference) and `TauCeti.summatory_eq_summatory_natFloor`.
- `TauCeti.Contour.exists_laurent_data_of_meromorphicAt`
  (`TauCeti/Analysis/Contour/MeromorphicLaurent.lean`): at a meromorphic point, a finite principal
  part plus a function analytic at the point, equal on a punctured neighbourhood.
- `TauCeti.Contour.tendsto_integral_sin_mul_div_atTop` and `TauCeti.Contour.tendsto_integral_sinc_atTop`
  (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`): for `b > 0`,
  `∫₀^R sin(bx)/x dx → π/2`. These are limits of interval integrals; unsquared `sinc` is not
  Lebesgue integrable and no such integral is used.

### From [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) (completed)

- Layer 9 (Wiener–Ikehara): the hypothesis style is kept — nonnegative coefficients,
  `LSeriesHasSum` on every point of the open half-plane, and a separately named boundary object
  instead of a statement about junk values. `PoleBoundary` replaces the continuous remainder `G` of
  Layer 9 by holomorphic germs, because the regularisation of Layer HP.2 differentiates `F`.
- Layer 9.2 (variants, in particular a pole at a positive abscissa), proved in Tau Ceti as
  `TauCeti.LSeries.wienerIkehara_rpow` with limit `κ/σ`: at `k = 0` the counting constant
  `A/(a·k!)` of HP.4.3 is the same `A/a`.
- Layer 4.2 (generic summatory functions with eventually constant finite discrepancies), consumed through
  `TauCeti.summatory`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

Section 4.5c, **Complex Gamma–Laplace adapter**, gives the absolutely convergent integral
`∫₀∞ t^(z−1) exp(−ct) dt = Γ(z) exp(−z Log c)` for `Re z > 0` and `Re c > 0`,
with principal `Log c`, joint holomorphy and compact integrable majorants for each fixed
finite parameter-derivative order. Use `z = k + 1`, `c = s − a`, `a : ℝ`, `k : ℕ`,
`a < Re s`, and Mathlib `Complex.Gamma_nat_eq_factorial`
(`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`, line 325). This gives the ordinary transform
of `exp(at) t^k` as `k! / (s − a)^(k+1)`, and hence the transform of
`(A/k!) exp(at) t^k` as `A / (s − a)^(k+1)`. The positive real part of `s − a`
excludes zero; the natural exponent has no branch ambiguity (Delange 1954, Lemma 4,
§5.1.2, p. 233; delange1954 line 719).

**Checks.**

- At `k = 0`, `s = a + 2`, the model transform is `1/2`; a Stieltjes transform has a different power.
- At `k = 1`, `s = a + 1 + i`, it is `1/(1+i)² = −i/2`; a real-rate substitution gives `1` instead.
- At `a = 0`, `k = 2`, `s = 2`, it is `2/2³ = 1/4`; omitting the factorial gives `1/8`.

## How to read the build

Layer HP.0 defines the two predicates every theorem is phrased in: the Laplace transform with its
convergence, and the boundary data of a pole of order `k + 1`. Layer HP.1 builds the two auxiliary
functions of Delange's argument, the smoothing kernel and the regularising weight, and needs only
Mathlib and Tau Ceti. Layer HP.2 uses the supplied Gamma model to prove the analytic core:
the integrable boundary values of the regularised remainder and the smoothed limit.
Layer HP.3 removes the smoothing by monotonicity and states Delange's theorem. Layer HP.4 turns a
Dirichlet series into a Laplace transform and reads off the counting theorems and the perturbation
statements. Layer HP.5 checks the normalisation on powers of `ζ` and shows by an example that the
boundary hypothesis is needed. Within each layer nothing is used before it is stated.

```text
Gamma–Laplace supplier ─> integer model ────────────┐
HP.0 HasLaplace ─────┬───────────────────────────────┤
HP.0 PoleBoundary ───┼─> HP.2.2 boundary L¹ ──────────┼─> HP.2.3 smoothed limit ─┐
HP.1 squaredSinc ────┤                                │                          ├─> HP.3.2 Delange
HP.1 delangeWeight ──┴────────────────────────────────┴─> HP.3.1 unsmoothing ────┘        │
HP.0 HasLaplace ─> HP.4.1 bridge ─────────────────────────────────────> HP.4.2, HP.4.3 <──┘
HP.4.3 ─> HP.4.5 lower-pole perturbation;   HP.4.4 finite change (Tau Ceti summatory API only)
HP.4.2, HP.4.4 ─> HP.5.1 divisor sums;   HP.0.2 ─> HP.5.2 dyadic counterexample
```

## Layer HP.0: Convergent Laplace transforms and boundary continuation

This layer fixes the two hypotheses of Delange's theorem as predicates: the ordinary Laplace
integral of the counting function converges on a half-plane, and its sum continues holomorphically
across the boundary line except for a pole of order `k + 1` at the real point `a`. Both are
phrased so that no junk value of a total function can satisfy or violate them.

### HP.0.1 The one-sided Laplace transform

**`HasLaplace`.** Let `E` be a normed additive group with `NormedSpace ℝ E` and `SMul ℂ E`. For
`f : ℝ → E`, `s : ℂ`, `z : E` and a measure `μ` on `ℝ` with default value
`volume.restrict (Set.Ioi 0)`, define `HasLaplace f s z μ` as the conjunction of

```text
Integrable (fun t ↦ Complex.exp (−s · t) • f t) μ      and      ∫ Complex.exp (−s · t) • f t ∂μ = z.
```

With the default measure, `HasLaplace f s z` says that the ordinary Laplace integral
`∫₀^∞ e^(−st) f(t) dt` converges absolutely and equals `z`. Integrability is part of the
predicate because the Bochner integral of a non-integrable function is `0`: the bare integral
equation cannot certify convergence. The predicate concerns the function `f` itself. For the
nonnegative coefficient counting functions of HP.4.1, termwise integration gives the ordinary Laplace transform `F(s)/s` for
`Re s > 0`; the theorem uses this identity directly. The counting applications use `E = ℂ`
and the cast `fun t ↦ (α t : ℂ)` of a real function `α`.

The one-sided Laplace API follows Dennj Osele, “The Laplace transform” (2026), declarations
`LaplaceConvergent` (lines 68–70; osele-laplace line 72), `laplace` (lines 117–118;
osele-laplace line 121) and `HasLaplace` (lines 121–123; osele-laplace line 125) of
`Mathlib/Analysis/LaplaceTransform.lean` at commit `90482cd37e85e423459de2ed103cea2f4d98cb20`.
Its argument order, default measure and scalar-action hypotheses give the shape of this predicate.

The API, in namespace `TauCeti`:

- Convergence: `HasLaplace f s z μ` gives `Integrable (fun t ↦ exp(−st) • f t) μ`.
- Integral value: `HasLaplace f s z μ` gives `∫ exp(−st) • f t ∂μ = z`.
- Uniqueness: `HasLaplace f s z μ` and `HasLaplace f s z' μ` give `z = z'`.
- Almost-everywhere congruence: `HasLaplace f s z μ` and `f =ᵐ[μ] g` give `HasLaplace g s z μ`.
- Additivity: with `DistribSMul ℂ E`, `HasLaplace f s z μ` and `HasLaplace g s w μ` give
  `HasLaplace (f + g) s (z + w) μ`.
- Scalar multiplication: with `NormedSpace ℂ E` and `IsScalarTower ℝ ℂ E`, `HasLaplace f s z μ`
  gives `HasLaplace (fun t ↦ c • f t) s (c • z) μ` for every `c : ℂ`.
- Positive dilation: with `NormedSpace ℂ E`, `IsScalarTower ℝ ℂ E`, the default measure
  and `0 < c`, `HasLaplace f (s / c) z` gives `HasLaplace (fun t ↦ f (c * t)) s ((c : ℂ)⁻¹ • z)`.
  Dilation is stated only for the default measure.

*Proof sketch.* The projections are the two conjuncts. Uniqueness is equality of the two values of
the same integral; almost-everywhere congruence changes neither integrability nor the integral.
Additivity and scaling are linearity of the Bochner integral. Dilation is the change of variables
`u = ct` on `(0, ∞)` (`MeasureTheory.integral_comp_mul_left_Ioi`), which turns `e^(−st)` into
`e^(−(s/c)u)` and contributes the Jacobian `c⁻¹`. *Needs:* Mathlib Bochner integration.

*Source.* Delange (1954), standing hypotheses on p. 213: the function studied is real,
nondecreasing and nonnegative on `t ≥ 0`, and its ordinary Laplace integral converges for
`Re s > a` with `a > 0`. In §3.3.1, pp. 221–222, the regularised function is again written as an
ordinary Laplace integral; the predicate records exactly this kind of convergence.

**Checks.**

- With `[NormedAddCommGroup E] [NormedSpace ℝ E] [SMulZeroClass ℂ E]`,
  the zero function has transform `0` at every complex `s` and for every measure `μ`.
  A complex action that does not preserve zero need not give a zero integrand.
- The constant function `1` has transform `1/s` whenever
  `Re s > 0`. A Stieltjes-type definition gives `1` instead.
- `t ↦ t²` has transform `2/s³` whenever `Re s > 0`. A
  Stieltjes-type definition gives `2/s²`. The value is also the case `a = 0`, `k = 2` of the
  supplied Gamma model, whose constant `k!` it fixes: a model with a stray factor `1/k!` or with
  `t^(k−1)` fails it.
- `HasLaplace (fun _ ↦ 1) 0 0` is false. A definition recording
  only the value of the integral would accept it, because the totalised integral of the
  non-integrable constant is `0`.

### HP.0.2 Boundary continuation with a pole of order `k + 1`

**`PoleBoundary`.** For `F : ℂ → ℂ`, `a A : ℝ` and `k : ℕ`, `PoleBoundary F a k A` is the
proposition with three fields:

1. `interior`: `F` is analytic at every point of `{s | a < s.re}`;
2. `pole`: there are `r > 0` and `g : ℂ → ℂ`, analytic on `Metric.ball a r`, with `g a = A` and
   `F s = g s / (s − a)^(k+1)` for every `s` in that ball with `a < s.re`;
3. `away`: for every real `y ≠ 0` there are `r_y > 0` and `g_y : ℂ → ℂ`, analytic on
   `Metric.ball (a + y·i) r_y`, with `F s = g_y s` for every `s` in that ball with `a < s.re`.

Agreement is only required on the open half-plane, so `F` may take arbitrary values on the line
`Re s = a`; when `F` is a totalised `LSeries`, its values there are never consulted. If `A ≠ 0`
the pole has exact order `k + 1`; the carrier also allows `A = 0`, which means order at most `k`.
The main theorems assume `0 < A`.

This is the integer-exponent case of the hypothesis of Delange's Theorem III: the transform is
holomorphic at every point of the line other than `a`, and near `a` it is `(s − a)^(−ω) g(s) + h(s)`
with `g`, `h` holomorphic and `g(a) ≠ 0`. For `ω = k + 1` the term `h` is absorbed into the
numerator `g + (s − a)^(k+1) h`, which has the same value at `a`. For a nonnegative `α` the
transform is nonnegative at real `s > a`, so the leading coefficient cannot be negative; Delange
derives `g(a) > 0` from `g(a) ≠ 0` (p. 237), whereas the theorems here take `0 < A` as a
hypothesis. Compared with the parent's Layer 9, which asks only for a continuous extension of
`F(s) − κ/(s − 1)` to the closed half-plane, the hypothesis is stronger at `k = 0`.

The API, in namespace TauCeti.HigherPoleTauberian:

- Agreement on the open half-plane: if `F s = G s` for every `s` with `a < s.re`, then `PoleBoundary F a k A`
  gives `PoleBoundary G a k A`; no equality on the line is needed.
- Uniqueness of the leading coefficient: `PoleBoundary F a k A` and `PoleBoundary F a k B` give `A = B`.
- Uniqueness of the pole order: `PoleBoundary F a k A`, `PoleBoundary F a l B`, `A ≠ 0` and `B ≠ 0`
  give `k = l`.
- Division by the argument in HP.0.2: for `0 < a`, `PoleBoundary F a k A` gives
  `PoleBoundary (fun s ↦ F s / s) a k (A / a)`.
- Rescaling in HP.0.2: for `0 < a`, `PoleBoundary F a k A` gives
  `PoleBoundary (fun s ↦ F (a * s)) 1 k (A / a^(k+1))`.
- Multiplication by a regular function: if `H` is analytic at every point of `{s | a ≤ s.re}` and `H a = C`
  with `C` real, then `PoleBoundary F a k A` gives `PoleBoundary (fun s ↦ F s * H s) a k (A * C)`.
- The product rule of HP.0.2: `PoleBoundary F a k A` and `PoleBoundary G a l B` give
  `PoleBoundary (fun s ↦ F s * G s) a (k + l + 1) (A * B)`; the pole orders add.

*Proof sketch.* Agreement: every field mentions `F` only on the open half-plane. Leading coefficient:
two numerators `g`, `g'` agree on the half-disc where both represent `F`, a nonempty open set,
hence on the connected disc by the identity theorem, and so `g a = g' a`. Pole order: if
`k < l`, then `g (s − a)^(l−k) = g'` on the half-disc, hence on the disc, and evaluating at `a`
gives `B = 0`. Division: shrink the disc so that it avoids `0` (possible as `a > 0`); `g/s`
is analytic there with value `A/a`, and every germ `g_y/s` is analytic near `a + iy ≠ 0`.
Rescaling: `s ↦ as` maps `Re s > 1` onto `Re s > a`, the disc of radius `r/a` about `1` into the
disc of radius `r` about `a`, and `a + iay` to the germ at `a + i(ay)`; the new numerator is
`g(as)/a^(k+1)`. Regular multiplication: multiply the numerator and every germ by `H`. Products: with
numerators `g` and `h`, on the smaller of the two discs the product is
`g(s) h(s)/(s − a)^(k+l+2)`, with numerator value `A B`,
and the germs multiply. *Needs:* Mathlib
`AnalyticOnNhd`, products and compositions of analytic functions, the identity theorem.

*Source.* Delange (1954), Theorem III, §5.2.1, pp. 235–236 (hypotheses) and its proof,
pp. 236–238; standing hypotheses on p. 213. A one-sided real limit at `a` does not supply these
hypotheses.

**Checks.**

- For all real `a`, `A` and natural `k`,
  `F(s) = A/(s − a)^(k+1)` satisfies `PoleBoundary F a k A` (constant numerator; the germs away
  from `a` are `F` itself).
- `F(s) = 1/(s − 1)` does not satisfy `PoleBoundary F 1 0 2`;
  a definition that did not tie the numerator's value to `A` would accept it.
- `1/(s − 1)` redefined to be `37` at `s = 1` still satisfies
  `PoleBoundary · 1 0 1`; a definition asking for agreement on the closed half-plane fails.
- `F(s) = 1/(1 − e^((1−s) log 2))` does not satisfy
  `PoleBoundary F 1 0 (1/log 2)`, because of its further poles at `1 + 2πim/log 2`, `m ≠ 0`,
  although it has the right local form at `1` (HP.5.2). A definition with only the `pole` field
  would accept it.
- For `A ≠ 0`, the zero function satisfies no
  `PoleBoundary · a k A`: its numerator vanishes on a half-disc, hence at `a`.

### Examples

- `riemannZeta` satisfies `PoleBoundary riemannZeta 1 0 1`: the numerator is `(s − 1) ζ(s)`,
  redefined as `1` at `s = 1` (removable by `riemannZeta_residue_one`), and the germs away from
  `1` are `ζ` itself (`analyticOn_riemannZeta`). By the product rule of HP.0.2, its powers give
  `PoleBoundary (ζ^m) 1 (m − 1) 1` for every `m ≥ 1`.
- The supplied Gamma model gives the transform of `e^(at) t^k`; the transform of a logarithmic counting function is
  HP.4.1.

### Dependencies

Mathlib only (analytic functions, Bochner integration). The hypothesis style follows the parent's
Layer 9.

## Layer HP.1: Squared-sinc smoothing and the polynomial weight

This layer builds the two auxiliary functions of Delange's proof. The kernel is a probability
density on `ℝ` whose Fourier transform is supported in a compact interval, which is what allows
boundary values that are only locally integrable. The weight regularises a pole of order `k + 1`
down to a locally integrable singularity and is asymptotic to `t^(−k)`.

### HP.1.1 The normalised squared-sinc kernel

**`squaredSinc`.** For real `λ` and `v` define

```text
squaredSinc λ v = (λ/π) · sinc(λv)²,        sinc(x) = sin(x)/x for x ≠ 0,  sinc(0) = 1,
```

using Mathlib's `Real.sinc`, and write `K_λ = squaredSinc λ`. The definition is total; the
analytic statements assume `λ > 0`. In angular frequency,

```text
K_λ(v) = (1/2π) ∫_{−2λ}^{2λ} (1 − |y|/(2λ)) e^(iyv) dy        (λ > 0),
```

so `K_λ` is the inverse Fourier transform of a triangle supported on `[−2λ, 2λ]`, and
`∫ K_λ = 1`. Delange's kernel (§3.3.5, p. 226) is the unnormalised transform of the same triangle
and produces the limit `πA`; dividing by `π` makes the smoothed limit equal to the coefficient
itself.

The API:

- Nonnegativity: `0 ≤ K_λ(v)` for `λ > 0` and all `v`.
- Evenness: `K_λ(−v) = K_λ(v)` for all `λ`, `v`.
- Continuity: `K_λ` is continuous for every real `λ`.
- Integrability: `K_λ` is Lebesgue integrable on `ℝ` for `λ > 0`.
- `squaredSinc_mass`: `∫_ℝ K_λ = 1` for `λ > 0`.
- `squaredSinc_fourier`: the displayed triangle formula, as an equality of complex numbers, for
  `λ > 0` and every `v`.
- Tail concentration: for `h > 0`, `∫_{|v| ≥ h} K_λ(v) dv → 0` as `λ → ∞`.

*Proof sketch.* Continuity and evenness come from `Real.continuous_sinc` and the evenness of
`sinc`. Integrability: `K_λ ≤ λ/π` everywhere (`Real.abs_sinc_le_one`) and
`K_λ(v) ≤ 1/(πλv²)` for `v ≠ 0`. Mass: after `w = λv`, `∫ K_λ = (1/π) ∫ sinc(w)² dw`; on `[0, R]`
integrate by parts,

```text
∫₀^R sin²w / w² dw = − sin²R / R + ∫₀^R sin(2w)/w dw,
```

and the last integral tends to `π/2` by Tau Ceti's sine integral with frequency `2`; evenness
doubles this to `π`. Only the improper limit of the unsquared integral is used. Fourier formula:
for `v ≠ 0`,

```text
∫_{−2λ}^{2λ} (1 − |y|/(2λ)) cos(yv) dy = (1 − cos 2λv)/(λv²) = 2λ · sinc(λv)²,
```

the sine part vanishes by symmetry, and both sides are continuous at `v = 0`. Tails: after
`w = λv` the tail is `(1/π) ∫_{|w| ≥ λh} sinc(w)² dw`, which tends to `0` by integrability.
*Needs:* Mathlib `Real.sinc`, `Real.continuous_sinc`, `Real.abs_sinc_le_one`; Tau Ceti
`TauCeti.Contour.tendsto_integral_sin_mul_div_atTop`.

*Source.* Delange (1954), §3.3.3–3.3.5, pp. 224–226: a continuous weight on `[−2λ, 2λ]`, its
Fourier transform, and the choice of the triangle in §3.3.5; §3.4, pp. 227–228, where positivity
of the kernel, its mass near the origin and its tails drive the Tauberian step.

**Checks.**

- `K_λ(0) = λ/π` for every real `λ`. This pins `Real.sinc 0 = 1` and the
  factor `λ/π`.
- `K_λ(π/λ) = 0` for `λ > 0`: the first zero sits at `π/λ`, matching the
  frequency endpoint `2λ`. A kernel built with `sinc(λv/2)`, that is with frequency endpoint `λ`,
  fails (its value there is `(λ/π)·(2/π)²`).
- `∫_ℝ K_2 = 1`. A missing factor `π` or `λ` fails.
- `K_1(0) = 1/π` and `K_1(2π) = 0`, so the kernel on `ℝ` is not `2π`-periodic; it cannot
  be substituted for the periodic Fejér kernel on a circle.

### HP.1.2 Delange's polynomial weight

**`delangeWeight`.** For `k ∈ ℕ` and `t ∈ ℝ` define

```text
w_k(t) = delangeWeight k t = t · ∫₀¹ e^(−ut) uᵏ/k! du.
```

The definition is total in `t`; positivity and bounds are asserted for `t ≥ 0`. For `t > 0` the
substitution `x = ut` gives

```text
w_k(t) · tᵏ = (1/k!) ∫₀ᵗ e^(−x) xᵏ dx,
```

the regularised lower incomplete Gamma function, which increases from `0` to `1`. So
`w_k(t) ~ t^(−k)` as `t → ∞`, while `w_k(0) = 0`: unlike `t^(−k)`, the weight has no singularity
at the origin.

In §3.1 Delange normalises the counting function by `t^(p+1) v(t)`, where
`v(t) = ∫₀^l e^(−tu) γ(u) du` for a suitable nondecreasing `γ` on `[0, l]`; in the proof of
Theorem III for an exponent `ω ≥ 1` (p. 237) he takes `p = 0` and `γ` proportional to `u^(ω−1)`,
with a cutoff `l < 1`. For `ω = k + 1`, `γ(u) = uᵏ/k!` and the cutoff `1`, `t·v(t)` is `w_k(t)`.
The restriction `l < 1` serves only the logarithmic factors of his Lemma 3; for pure powers every
positive cutoff gives the same limits, and `1` is used here.

The API:

- Continuity: `w_k` is continuous on `ℝ` for every `k`.
- Nonnegativity: `0 ≤ w_k(t)` for `t ≥ 0`.
- Positivity: `0 < w_k(t)` for `t > 0`.
- `delangeWeight_normalization`: `w_k(t) tᵏ → 1` as `t → ∞`.
- `delangeWeight_shift`: for each fixed real `h`, `w_k(t + h)/w_k(t) → 1` as `t → ∞`.
- Uniform shifts: for every `H > 0` and `ε > 0` there exists `T > H` such that for every
  `t ≥ T` and `|h| ≤ H`, `|w_k(t + h)/w_k(t) − 1| < ε`. In particular
  `sup_{|h| ≤ H} |w_k(t + h)/w_k(t) − 1| → 0` as `t → ∞`.
- Normalized bound: `w_k(t) tᵏ ≤ 1` for `t ≥ 0`.
- Differentiability: `w_k` is continuously differentiable on `ℝ`, with
  `w_k′(0) = 1/(k! (k + 1))` and `w_k′(t) = e^(−t)/k! − k w_k(t)/t` for `t > 0`.
  Consequently `w_k′(t)/w_k(t) → 0` as `t → ∞`. The denominators are nonzero for `t > 0`.

*Proof sketch.* Continuity: the integrand is jointly continuous and the `u`-interval is compact.
The incomplete-Gamma identity gives nonnegativity, positivity for `t > 0` and the bound, since the
complete integral is `Γ(k + 1) = k!` (`Real.GammaIntegral_convergent` after scaling,
`Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.Gamma_nat_eq_factorial`); the normalisation is the
convergence of the incomplete integral to the complete one. Shift:

```text
w_k(t + h)/w_k(t) = [w_k(t + h)(t + h)ᵏ] / [w_k(t) tᵏ] · (t/(t + h))ᵏ → 1,
```

and for a fixed `H > 0` the convergence is uniform in `|h| ≤ H`, because both normalised weights
tend to `1` once `t − H` is large and `(t/(t + h))ᵏ → 1` uniformly in `|h| ≤ H`; this uniform
form, the uniform shift limit of HP.1.2, is what HP.3.1 uses. Differentiation under the compact
`u`-integral gives continuous differentiability and the derivative at zero. Differentiating the
incomplete-Gamma identity at `t > 0` gives the displayed derivative; its ratio tends to zero
by normalization and exponential decay. The explicit cases below
follow by integrating a polynomial times an exponential. *Needs:* Mathlib Gamma function and `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

*Source.* Delange (1954), §3.1–3.2, pp. 220–221 (the function `v`, its positivity and
monotonicity, and `v(t + h)/v(t) → 1`); Lemma 3, §5.1.1, pp. 231–232 (the Abelian asymptotics of
`∫₀^l e^(−tu) u^ρ (log 1/u)^(−m) du`); §5.2.1, p. 237 (the choice of `p` and `γ` for `ω ≥ 1`).

**Checks.**

- `w_k(0) = 0` for every `k`.
- `w_0(t) = 1 − e^(−t)` for every real `t`; in particular `w_0(−1) = 1 − e < 0`,
  so positivity must be restricted to positive time.
- `t · w_1(t) = 1 − (1 + t) e^(−t)` for every real `t`.
- `t² · w_2(t) = 1 − (1 + t + t²/2) e^(−t)` for every real `t`.
  Without the `1/k!` the right side would be `2 − (2 + 2t + t²) e^(−t)`.
- The derivatives at zero for `k = 0, 1, 2` are `1, 1/2, 1/6`; extending the positive-time
  derivative formula to zero using totalized division incorrectly gives `1, 1, 1/2`.

### Examples

- `w_0(t) = 1 − e^(−t)` tends to `1`, and `w_0(t + h)/w_0(t) → 1` for every `h`; for `k = 0` the
  weight is bounded and the regularisation of HP.2.2 is harmless.
- `K_1` has its first zeros at `±π`, value `1/π` at `0` and mass `1`.

### Dependencies

Mathlib (`Real.sinc`, Gamma function) and Tau Ceti (sine integral). No earlier layer of this
roadmap is used.

## Layer HP.2: Regularised transforms and the smoothed limit

This layer subtracts the model pole from the transform, regularises the remainder so that its
boundary values become locally integrable, and proves that the counting function, weighted and
smoothed by `K_λ`, has the expected limit. No growth bound on the counting function is assumed
anywhere; the bound comes out of the monotone argument of Layer HP.3.

### HP.2.2 Locally integrable regularised boundary values

**`regularizedBoundaryL1`.** Assume `PoleBoundary F a k A`. Put

```text
R(s) = F(s) − A/(s − a)^(k+1),        H(s) = − ∫₀¹ R′(s + u) · uᵏ/k! du        (Re s > a).
```

Then there is `b : ℝ → ℂ` such that, for every `L > 0`, `b` is integrable on `[−L, L]` and

```text
∫_{−L}^{L} |H(a + ε + iy) − b(y)| dy → 0        as ε → 0⁺.
```

The derivative `R′` is only evaluated at points with real part `> a`, since `ε > 0` and `u ≥ 0`.
No positivity and no Laplace representation is used: this is a statement about the boundary
behaviour of `F` alone.

*Proof sketch.*

1. Near `a`, the `pole` field gives `R(s) = (g(s) − A)/(s − a)^(k+1)` on the half-disc, and the
   right side is defined on the whole punctured disc. Since `g − A` vanishes at `a`, it is
   meromorphic at `a` with a pole of order at most `k`; Tau Ceti's Laurent data
   (`TauCeti.Contour.exists_laurent_data_of_meromorphicAt`), applied to this quotient and not to
   the values of `F` on the line, write it as a principal part `∑_{1≤j≤k} c_j/(s − a)^j` plus a
   function analytic at `a`. For `k = 0`, the restriction of `R` to the open half-plane has an
   analytic continuation across `a`; the raw total function can have a different value there.
2. Split `u ∈ [0, 1]` into a part inside the disc and its complement. A principal term of order
   `j ≤ k` has derivative of size `|s − a|^(−j−1)`. With `s − a = ε + u + iy` and `ε, u ≥ 0`,
   `|ε + u + iy| ≥ (u + |y|)/√2`, so

   ```text
   ∫₀^δ uᵏ (u + |y|)^(−j−1) du ≤ C (1 + |log |y||)        (0 < |y| small),
   ```

   uniformly in small `ε > 0`. The factor `uᵏ` is what turns a power singularity into a
   logarithm, and the majorant is integrable near `y = 0`; the single point `y = 0` is a null set.
3. On a compact `y`-interval avoiding `0`, the `away` germs continue `R′` continuously across the line;
   a finite cover by the discs of the `away` field gives uniform convergence of `H(a + ε + iy)`
   to `b(y) = −∫₀¹ R̃′(a + u + iy) uᵏ/k! du`, where `R̃` is the continuation, with a uniform bound.
   The part of the `u`-integral away from the line is continuous in `(ε, y)` on a compact set.
4. Define `b` this way for `y ≠ 0`, and arbitrarily at `y = 0`; dominated convergence with the
   logarithmic majorant gives the `L¹` convergence on `[−L, L]`.

*Needs:* Layers HP.0.2 and HP.1.2; Tau Ceti `TauCeti.Contour.exists_laurent_data_of_meromorphicAt`;
Mathlib `MeasureTheory.tendsto_integral_filter_of_dominated_convergence`.

*Source.* Delange (1954), §3.3.1–3.3.2, pp. 221–224 (the regularised function `h`, its Laplace
representation, and its bound near each boundary point, obtained by an integration by parts
against `γ`); §4.1, pp. 228–229 (under the hypotheses of his Theorem I the boundary behaviour off
`a` is continuous and his Lemmas 1–2 are not needed); §5.2.1, pp. 237–238 (the size of the
remainder near `a` once the model pole is removed). Delange handles more general boundary
behaviour through his Lemmas 1–2; under the holomorphic hypothesis of `PoleBoundary`, compact
`L¹` convergence suffices.

**Checks.**

- A remaining pole of order `j ≤ k` produces at most a logarithmic singularity in `y`, never a
  non-integrable power. For `k = 1`, `c ∈ ℂ` and `R(s) = c/(s − a)`, the boundary value is
  `b(y) = c ∫₀¹ u/(u + iy)² du = c (log(1 + iy) − log(iy) + iy/(1 + iy) − 1)` for `y ≠ 0`
  (principal logarithm), which grows like `−c log |y|` as `y → 0`.
- For the model `F = A/(s − a)^(k+1)` the remainder `R` is `0`, so `H = 0` and `b = 0`.
- Updating the simple model to `37` at its pole leaves `PoleBoundary` unchanged. The raw
  remainder has value `37` at `a = 1` and value `0` at `1 + ε` for every `ε > 0`, so it is
  discontinuous at the pole; its analytic continuation from the open half-plane is zero.

### HP.2.3 The smoothed limit

**`delangeSmoothedLimit`.** Let `a > 0`, `k ∈ ℕ` and `A ∈ ℝ`. Let `α : ℝ → ℝ` be nonnegative and
nondecreasing on `[0, ∞)`, let `HasLaplace (fun t ↦ (α t : ℂ)) s (F s)` hold for every `s` with
`Re s > a`, and let `PoleBoundary F a k A` hold. Then for every `λ > 0`:

- for every `T ∈ ℝ`, `t ↦ w_k(t) e^(−at) α(t) K_λ(t − T)` is integrable on `[0, ∞)`;
- as `T → ∞`,

  ```text
  ∫₀^∞ w_k(t) e^(−at) α(t) K_λ(t − T) dt → A/k!.
  ```

No bound `α(t) = O(e^(at) tᵏ)` is assumed; that bound is a consequence, proved in HP.3.1. (The
limit is nonnegative, so the hypotheses force `A ≥ 0`.)

*Proof sketch.*

1. *The regularised transform.* Let `β(t) = (A/k!) e^(at) tᵏ`; by AnalyticNumberTheoryPartII §4.5c the transform of
   `α − β` is `R(s)` on `Re s > a`. For fixed `s` choose `a < σ₀ < σ₁ < Re s`: convergence at
   `σ₀` gives the integrable majorant `e^(−σ₀t) |α(t) − β(t)|`, and `t e^(−(σ₁ − σ₀)t)` is
   bounded, so `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (for the restricted half-line
   measure) gives `R′(s) = −∫₀^∞ t e^(−st) (α(t) − β(t)) dt`. Integrating against `uᵏ/k!` over
   `[0, 1]` and exchanging the integrals (`MeasureTheory.integral_integral_swap`) gives

   ```text
   H(s) = ∫₀^∞ e^(−st) w_k(t) (α(t) − β(t)) dt        (Re s > a),
   ```

   because `t ∫₀¹ e^(−ut) uᵏ/k! du` is exactly `w_k(t)`.
2. *The damped identity.* For `ε > 0`, write `K_λ(t − T)` by the triangle formula of HP.1.1 and
   exchange the `t`- and `y`-integrals, which converge absolutely at `ε > 0` over the compact
   frequency interval:

   ```text
   ∫₀^∞ e^(−εt) w_k(t) e^(−at) (α(t) − β(t)) K_λ(t − T) dt
       = (1/2π) ∫[−2λ, 2λ] H(a + ε + iy) (1 − |y|/(2λ)) e^(iyT) dy.
   ```

3. *Letting `ε → 0`.* On the right, `regularizedBoundaryL1` gives convergence to
   `(1/2π) ∫ b(y) (1 − |y|/(2λ)) e^(iyT) dy`. On the left, the `β`-part converges by dominated
   convergence, because `w_k(t) e^(−at) β(t) = (A/k!) w_k(t) tᵏ` is bounded
   (the normalized bound of HP.1.2). The `α`-part is nonnegative: Fatou's lemma
   (`MeasureTheory.lintegral_liminf_le'`) and the finiteness of the limit give integrability of
   the undamped product, which proves the first conclusion, and dominated convergence with that
   product as majorant removes `ε`. This proves the undamped identity before any limit in `T` is
   taken.
4. *Letting `T → ∞`.* The right side tends to `0` by the Riemann–Lebesgue lemma
   (`Real.tendsto_integral_exp_smul_cocompact`, after the substitution `w = y/(2π)`), applied to
   the integrable, compactly supported function `b(y)(1 − |y|/(2λ))`. On the left, the `β`-part
   is the convolution of the bounded function `(A/k!) w_k(t) tᵏ`, which tends to `A/k!`, with a
   kernel of mass one; by translation and dominated convergence it tends to `A/k!`. Hence the
   `α`-part tends to `A/k!`.

*Needs:* Layers HP.0.1, HP.0.2, HP.1.1, HP.1.2 and HP.2.2; AnalyticNumberTheoryPartII §4.5c; Mathlib
`MeasureTheory.integral_integral_swap`,
`MeasureTheory.tendsto_integral_filter_of_dominated_convergence`,
`MeasureTheory.lintegral_liminf_le'`, `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`Real.tendsto_integral_exp_smul_cocompact`.

*Source.* Delange (1954), §3.3.1–3.3.5, pp. 221–226 (the regularised function, the identity with
a weight supported on `[−2λ, 2λ]`, the passage to the undamped integral by positivity, the
Riemann–Lebesgue lemma and the model term, which together give the limit `πA` for his
unnormalised kernel); §4.1, pp. 228–229.

**Checks.**

- `α(t) = e^(at) tᵏ` is nonnegative and nondecreasing on `[0, ∞)`, has transform
  `k!/(s − a)^(k+1)` (AnalyticNumberTheoryPartII §4.5c) and satisfies `PoleBoundary` with `A = k!`; the theorem gives the
  limit `1`, and directly `w_k(t) e^(−at) α(t) = w_k(t) tᵏ → 1`.

### Examples

- For `k = 0` the weight is `1 − e^(−t)`, the model is `A e^(at)`, and the smoothed limit is the
  smoothed form of the Ikehara theorem.

### Dependencies

Layers HP.0 and HP.1; AnalyticNumberTheoryPartII §4.5c (integer Gamma model).
Mathlib measure theory and Fourier analysis; Tau Ceti Laurent data.

## Layer HP.3: Delange's theorem for integer pole orders

This layer removes the smoothing. Monotonicity of `α` converts the smoothed limits, at every
bandwidth, into a limit of the weighted function itself; the weight is then removed by its
normalisation.

### HP.3.1 Removing the smoothing by monotonicity

**`monotoneUnsmoothing`.** Let `a > 0`, `C ≥ 0` and `k ∈ ℕ`, and let `α` be nonnegative and
nondecreasing on `[0, ∞)`. Assume that for every `λ > 0` the integrals

```text
∫₀^∞ w_k(t) e^(−at) α(t) K_λ(t − T) dt
```

exist (integrability on `[0, ∞)`) for every `T` and tend to `C` as `T → ∞`. Then
`α(t)/(e^(at) tᵏ) → C` as `t → ∞`. No transform or boundary hypothesis is used. The hypothesis is
needed at every bandwidth: one bandwidth does not suffice.

*Proof sketch.* Put `J(t) = w_k(t) e^(−at) α(t)` for `t ≥ 0`; `J` itself need not be monotone.

1. *A bound for `J`.* Fix `h > 0` and `λ > 0` such that `K_λ` has positive mass `m` on
   `[−h/2, h/2]`. In the convolution centred at `T + h/2`, keep only `t ∈ [T, T + h]`. There
   `α(t) ≥ α(T)`, `e^(−at) ≥ e^(−ah) e^(−aT)`, and, for `T` large, `w_k(t) ≥ (1 − η) w_k(T)` by
   the uniform shift limit of HP.1.2. So the convolution is at least
   `(1 − η) e^(−ah) m J(T)`, and its limit bounds `J(T)` for large `T`. On compact intervals `α`
   is bounded (it is monotone) and `w_k` is continuous, so `J ≤ M` on `[0, ∞)` for some `M`.
2. *Two-sided comparison.* The same window gives `limsup J ≤ C e^(ah) / ((1 − η) m)`. For the lower
   bound, centre the convolution at `T − h/2` and keep `t ∈ [T − h, T]`, where `α(t) ≤ α(T)`,
   `e^(−at) ≤ e^(ah) e^(−aT)` and `w_k(t) ≤ (1 + η) w_k(T)`; the rest of the convolution is at
   most `M` times the mass of `K_λ` outside `[−h/2, h/2]`.
3. *Limits.* Let `T → ∞` at fixed `λ` and `h`; then `λ → ∞` at fixed `h`, so that the mass of
   `[−h/2, h/2]` tends to `1` and the tails to `0` (the tail concentration of HP.1.1); then `h → 0`, so that
   `e^(±ah) → 1`. Both `limsup J` and `liminf J` equal `C`.
4. Finally `α(t)/(e^(at) tᵏ) = J(t)/(w_k(t) tᵏ)` and `w_k(t) tᵏ → 1`. The case `C = 0` is
   included.

*Needs:* Layers HP.1.1 and HP.1.2.

*Source.* Delange (1954), §3.4.1–3.4.2, pp. 227–228: monotonicity of the counting function and the
shift behaviour of the weight give first a bound and then both inequalities, with the limits taken
first in the bandwidth and then in the window. The bound is derived, not assumed.

**Checks.**

- One bandwidth is not enough. For every `a > 0`,
  `C > 0`, `λ > 0` and `k ∈ ℕ`, such a counterexample exists. Take a small `ε > 0`, and `α` with
  `J(t) = C + ε cos(3λt)` for `t ≥ t₀`, continued as a nondecreasing nonnegative function on
  `[0, t₀]`. For `ε < aC/(a + 3λ)` and `t₀` large, `α(t) = J(t) e^(at)/w_k(t)` is nondecreasing
  on `[t₀, ∞)` as well: its logarithmic derivative is at least `a − 3λε/(C − ε) − w_k′(t)/w_k(t)`,
  and `w_k′/w_k → 0`. The convolution with this one `K_λ` tends to `C`, since the Fourier transform
  of `K_λ` vanishes at the frequency `3λ`, but `J` has no limit.
- `C = 0`: the theorem gives `α(t) = o(e^(at) tᵏ)`.

### HP.3.2 Delange's theorem

**`delangeLaplace`.** Let `a > 0`, `A > 0` and `k ∈ ℕ`, and write `m = k + 1`. Let `α : ℝ → ℝ` be
nonnegative and nondecreasing on `[0, ∞)`, let `HasLaplace (fun t ↦ (α t : ℂ)) s (F s)` hold for
every `s` with `Re s > a`, and let `PoleBoundary F a k A` hold. Then

```text
α(t) / (e^(at) tᵏ) → A/k!        as t → ∞,
```

that is, `α(t) ~ (A/(m − 1)!) e^(at) t^(m−1)`. Local integrability of `α` follows from
monotonicity; convergence of the transform and the boundary data are the two separate predicates
of Layer HP.0.

This is Delange's Theorem III for an integral exponent `ω = m ≥ 1`, where `Γ(ω) = (m − 1)! = k!`.
His standing hypotheses (p. 213) are `a > 0`, `α` real, nondecreasing and nonnegative, and
convergence of the Laplace integral on `Re s > a`.

*Proof sketch.* By HP.2.3, for every `λ > 0` the hypotheses of HP.3.1 hold with `C = A/k!`, which
is positive because `A > 0`. Apply HP.3.1; the denominators `e^(at) tᵏ` are positive for `t > 0`.
*Needs:* HP.2.3 and HP.3.1.

*Source.* Delange (1954), Theorem III, §5.2.1, pp. 235–238, with integral exponent; standing
hypotheses on p. 213.

**Checks.**

- `k = 0`: `α(t) ~ A e^(at)`, Ikehara's theorem under holomorphic continuation of the boundary.
- `k = 1`: `α(t) ~ A e^(at) t`, coefficient `A` and one power of `t`.
- The model `α(t) = e^(at) tᵏ`, with `A = k!`, gives the limit `1`.
  The ratio itself tends to `1` for every real `a`, by cancellation for `t > 0`.

### Examples

- The Laplace transform `1/(s − a)²` of `e^(at) t` has `k = 1`, `A = 1`, and the theorem returns
  `α(t) ~ e^(at) t`.

### Dependencies

Layers HP.1 and HP.2.

## Layer HP.4: Counting functions of Dirichlet series and perturbations

This layer translates Layer HP.3 to Dirichlet series. The counting function `S_c(eᵗ)` of a
nonnegative series is nondecreasing, and its ordinary Laplace transform is `F(s)/s`; dividing by
`s` multiplies the leading coefficient by `1/a`. Two perturbation theorems then let an arithmetic
count discard finitely many terms and terms dominated by a lower-order pole.

### HP.4.1 The logarithmic counting function and its Laplace transform

The `Northcott` instance `northcott_natId` for the identity height on `ℕ` (its sublevel sets are
the finite sets `Set.Iic b`) is registered first, so that `S_c(X) = TauCeti.summatory (fun n : ℕ ↦ n) ĉ X` is
defined for every `c` (Conventions).

**`logSummatory_hasLaplace`.** Let `c : ℕ → ℝ` with `c n ≥ 0` for all `n`, let `Re s > 0` and let
`LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)`. Put `α(t) = S_c(eᵗ)`. Then

```text
HasLaplace (fun t ↦ (α t : ℂ)) s (F(s)/s),
```

`α` is nonnegative and nondecreasing on `[0, ∞)`, and `α(0) = c 1`. The hypothesis `Re s > 0` is
needed even when the series happens to converge at a point with `Re s ≤ 0`.

*Proof sketch.* `α(t) = ∑_{n≥1} c_n 1[log n ≤ t]`, a finite sum for each `t`. The coefficient
`c 0` does not occur, as in `LSeries.term`; because the cutoff is inclusive, `n = 1` is present
already at `t = 0`. For each `n ≥ 1`, `∫_{log n}^∞ e^(−st) dt = n^(−s)/s`
(`integral_exp_mul_complex_Ioi`, as `Re s > 0`). The norm integrals sum to
`∑ c_n n^(−Re s)/Re s`, which is finite because summability in `ℂ` is absolute; so
`MeasureTheory.integral_tsum` exchanges sum and integral, and `LSeriesHasSum` identifies the sum
with `F(s)/s`. Nonnegativity and monotonicity are `TauCeti.summatory_nonneg` and
`TauCeti.summatory_mono` composed with `exp`. *Needs:* Layer HP.0.1; Mathlib `LSeriesHasSum`,
`LSeries.term`, `MeasureTheory.integral_tsum`, `integral_exp_mul_complex_Ioi`,
`integrableOn_exp_mul_complex_Ioi`; Tau Ceti `TauCeti.summatory`, `TauCeti.summatory_nonneg`,
`TauCeti.summatory_mono`.

The transform is that of `α` itself. The Laplace–Stieltjes transform `∫ e^(−st) dα(t)` would be
`F(s)`; the factor `1/s` is the source of the factor `1/a` in HP.4.3.

*Source.* Delange (1954), p. 213 (his theorem concerns the ordinary Laplace integral of a
nondecreasing function; footnote 1 notes that nonnegativity can be arranged by subtracting
`α(0)`), and Theorem III, §5.2.1, pp. 235–238. Wood (2019), §7, pp. 416–417, applies a Tauberian
theorem to the partial sums of a Dirichlet series whose coefficients count homomorphisms with
given discriminant; the bridge above is derived independently.

**Checks.**

- `S_c(e^0) = c 1`.
- For the sequence with `c 1 = 1` and all other coefficients `0`,
  `α = 1` on `[0, ∞)` and the transform is `1/s`.
- `S_c(e^(log 2)) = c 1 + c 2`; an exclusive cutoff gives `c 1`.
- `Re s > 0` cannot be dropped: for the sequence with only `c 1 = 1` the series converges at every
  `s` with sum `1`, in particular at `s = 0`, but `α = 1` on `[0, ∞)` has no Laplace transform at
  `s = 0` (the nonintegrability Check of HP.0.1), and the totalized quotient `F(0)/0 = 0` does not certify convergence.

### HP.4.2 Counting at abscissa one

**`delangeDirichlet`.** Let `c n ≥ 0` for all `n`, `A > 0` and `k ∈ ℕ`. Assume
`LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)` for every `s` with `Re s > 1`, and
`PoleBoundary F 1 k A`. Then, with `S_c` excluding `n = 0` and including every `1 ≤ n ≤ X`,

```text
S_c(X) / (X (log X)ᵏ) → A/k!        as X → ∞.
```

The hypotheses are genuine analytic continuation along the whole line `Re s = 1` and a positive
leading coefficient; `m = k + 1 ≥ 1`.

*Proof sketch.* HP.4.1 at every `s` with `Re s > 1` gives `α(t) = S_c(eᵗ)` with transform
`F(s)/s`, nonnegative and nondecreasing. Division by the argument in HP.0.2 at `a = 1` gives
`PoleBoundary (F/s) 1 k A`. HP.3.2 gives `α(t)/(eᵗ tᵏ) → A/k!`; substitute `t = log X` for
`X > 1`, using `e^(log X) = X` and `log X → ∞`. *Needs:* HP.0.2, HP.3.2, HP.4.1.

*Source.* Delange (1954), Theorem III, §5.2.1, pp. 235–238. Wood (2019), §7, p. 417: for the
series `F_r`, for `r ≥ 1`, the coefficients count continuous homomorphisms from the absolute
Galois group of ℚ to `C₂^(r+1)` whose finite-prime inertia images meet `C₂^r × {1}` trivially
and whose complex conjugation is trivial (wood2019 line 1652). The index is the absolute
discriminant of the quadratic character projected to the last factor, with the trivial
homomorphism treated separately (§7, p. 416; wood2019 line 1617). Its pole at `1` has order
`2^r` and its partial sums are asymptotic to a constant times `X (log X)^(2^r − 1)`
(wood2019 line 1692). Variants allowing nontrivial complex conjugation are separate applications
with their own series. The analytic hypotheses needed for this step are explicit here.

**Checks.**

- `c n = 1` for `n ≥ 1`: `F = ζ`, `PoleBoundary ζ 1 0 1`, and
  `S(X)/X → 1`, with the `n = 0` coefficient suppressed; this agrees with the elementary count
  `⌊X⌋/X → 1`.
- The divisor function, `k = 1`: `S(X)/(X log X) → 1` (HP.5.1).
- For `r = 1`, the character of ℚ(i) embedded in the last `C₂` factor has image
  `{0} × C₂`, whose intersection with `C₂ × {0}` is `{(0, 0)}`; it satisfies the finite-prime
  inertia condition. Complex conjugation maps to `(0, 1)`, so this homomorphism is excluded
  from `F_1`. The last-factor character has absolute discriminant `4`.

### HP.4.3 Counting at a positive abscissa

**`delangeDirichlet_positiveAbscissa`.** Let `a > 0`, `A > 0`, `k ∈ ℕ` and `c n ≥ 0` for all `n`.
Assume `LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)` for every `s` with `Re s > a`, and
`PoleBoundary F a k A`. Then

```text
S_c(X) / (X^a (log X)ᵏ) → A/(a · k!)        as X → ∞,
```

where `X^a` is `Real.rpow` (and `X > 1` eventually). The hypothesis `a > 0` is essential; no
theorem at `a = 0` is asserted.

*Proof sketch.* The bridge HP.4.1 applies on `Re s > a > 0`. Division by the argument in HP.0.2 changes
the leading coefficient to `A/a` on the same line. HP.3.2 gives
`α(t) ~ (A/(a·k!)) e^(at) tᵏ`; substitute `t = log X`, using `e^(a log X) = X^a`. An independent
check of the constant: Rescaling in HP.0.2 moves the pole to `1` with leading coefficient
`A/a^(k+1)`, and the time dilation `t ↦ at` contributes `aᵏ`; the product is `A/a`. *Needs:*
HP.0.2, HP.3.2, HP.4.1.

*Source.* Delange (1954), Theorem III, §5.2.1, pp. 235–238, which allows any abscissa `a > 0`;
standing hypotheses on p. 213. The factor `1/a` comes from the ordinary Laplace transform of the
logarithmic counting function.

**Checks.**

- `c n = n` has series `ζ(s − 1)`, a simple pole at `a = 2` with
  numerator `1`, and `S_c(X)/X² → 1/2 = A/a`; without the factor `1/a` the prediction would be `1`.
  This agrees with the elementary `⌊X⌋(⌊X⌋ + 1)/2`.
- At `a = 1` the statement is HP.4.2.
- At `k = 0` the constant `A/a` is the constant `κ/σ` of the parent's positive-abscissa variant
  (`TauCeti.LSeries.wienerIkehara_rpow`).
- A negative control: `c n = 1/n` has series `ζ(s + 1)`, convergent on
  `Re s > 0` with a simple pole at `0` and numerator value `1`, but `S_c(X) = ∑_{1≤n≤X} 1/n ~ log X`
  is not a constant multiple of `X^0 (log X)^0`. The transform `ζ(s + 1)/s` of `S_c(eᵗ)` has a
  pole of order two at `0`: at `a = 0` dividing by `s` raises the order of the pole instead of
  dividing the leading coefficient by `a`.

### HP.4.4 Finitely many altered coefficients

**`finiteChange_asymptotic`.** This variant allows signed coefficients and an arbitrary limiting
constant at any logarithmic scale, without a boundary hypothesis. Let `c, d : ℕ → ℝ` agree outside a finite set
(`∀ᶠ n in cofinite, c n = d n`), `a > 0` and `k ∈ ℕ`. If `S_c(X)/(X^a (log X)ᵏ) → C`, then
`S_d(X)/(X^a (log X)ᵏ) → C`. The coefficients may have any sign, and no series or boundary
hypothesis is involved.

*Proof sketch.* `TauCeti.eventually_summatory_sub_eq`, applied to the zero-suppressed weights,
makes `S_d − S_c` eventually equal to the finite sum of the coefficient changes. Since `a > 0`,
`X^a (log X)ᵏ → ∞`, so this constant divided by the scale tends to `0`; add the limits. A change
at `n = 1` is a constant and is covered. *Needs:* Tau Ceti `TauCeti.summatory`,
`TauCeti.eventually_summatory_sub_eq`.

*Source.* Delange (1954), p. 213, footnote 1 (a constant shift of the counting function does not
affect the conclusions); Wood (2019), §7, p. 417, where the trivial homomorphism, a single
coefficient, is set aside.

**Checks.**

- Adding `7` at `n = 1` to the divisor function leaves the limit of
  `S(X)/(X log X)` equal to `1`.

### HP.4.5 Errors dominated by a lower-order pole

**`lowerPole_perturbation`.** Let `a > 0`, `B > 0` and natural numbers `l < k`. Let `b n ≥ 0` for
all `n`, with `LSeriesHasSum (fun n ↦ (b n : ℂ)) s (G s)` for every `s` with `Re s > a` and
`PoleBoundary G a l B`. Suppose `|d n − c n| ≤ b n` for every `n` and
`S_c(X)/(X^a (log X)ᵏ) → C`. Then `S_d(X)/(X^a (log X)ᵏ) → C`: a signed change dominated by a
sequence whose series has a pole of order `l + 1 < k + 1` is negligible at the higher scale. The
majorant carries its own convergence and boundary hypotheses; `c` and `d` need not be nonnegative.

*Proof sketch.* HP.4.3 applied to `b` gives `S_b(X) = O(X^a (log X)^l)`. The triangle inequality
for finite sums and the coefficient bound give `|S_d(X) − S_c(X)| ≤ S_b(X)` (the coefficient at
`0` is suppressed on both sides). Divide by `X^a (log X)ᵏ` and use
`1 / (log X)^(k − l) → 0`, where `k − l ≥ 1`; conclude by the squeeze theorem. *Needs:* HP.4.3; Tau Ceti `TauCeti.summatory`.

*Source.* Wood (2019), §7, p. 417: the number of homomorphisms that are not surjective is bounded
in terms of a constant and the asymptotics of the coefficients of the series attached to the next
smaller group, whose pole has order `2^(r−1) < 2^r`. The theorem above is the generic analytic form
of that step, with a coefficientwise majorant; the arithmetic construction of the majorant and the
proof of its hypotheses are arithmetic input to the application.

**Checks.**

- The inequality `l < k` is strict. Take `c = b = 1` and `d = 2` on positive integers, and set
  all three coefficients to zero at `n = 0`. Then `|d n − c n| ≤ b n` gives `0 ≤ 0` at zero
  and `1 ≤ 1` at each positive integer. The majorant has the same simple pole as `c`, and the
  limit at scale `X` changes from `1` to `2` (the count of ones in HP.4.2).
- For `a = 1`, `k = 1`, `l = 0`, take `c(n) = d₂(n) = #(Nat.divisors n)`,
  `d(n) = d₂(n) + (−1)^n` and `b(n) = 1`
  on positive integers, with all three coefficients zero at zero. The error has absolute value
  one at every positive integer, and the majorant has series `ζ` and a simple pole. At integer
  cutoffs `1, 2, 3, 4`, the signed summatory errors are `−1, 0, −1, 0`; at every real cutoff
  they lie in `{0, −1}`. Both sums divided by `X log X` tend to `1`, so this lower-order
  majorant preserves the double-pole asymptotic (HP.5.1).

### Examples

- Wood's totally real counts (Wood 2019, §7, pp. 416–417; wood2019 line 1652), for `r ≥ 1`:
  continuous homomorphisms into `C₂^(r+1)` with finite-prime inertia meeting `C₂^r × {1}`
  trivially and trivial complex conjugation give the series `F_r`, indexed by the absolute
  discriminant of the last-factor quadratic character, with the trivial homomorphism treated
  separately. It has pole order `2^r` at `s = 1`, so `k = 2^r − 1`; HP.4.2 gives the main term
  `X (log X)^(2^r − 1)` with constant `A/(2^r − 1)!`,
  HP.4.4 removes the trivial homomorphism, and HP.4.5 removes the non-surjective ones once they are
  dominated by the coefficients of a series with a pole of order `2^(r−1)`.

### Dependencies

Layers HP.0 and HP.3. Mathlib `LSeries`; Tau Ceti `TauCeti.summatory` and its API.

## Layer HP.5: Zeta checks and the necessity of the boundary hypothesis

This layer checks the factorial normalisation on powers of `ζ`, where everything is explicit, and
shows by an explicit series that a correct local pole at `a` is not enough.

### HP.5.1 Divisor sums from `ζ²`

**`zetaSquare_counting`.** Let `d(n) = #(Nat.divisors n)`, so `d(0) = 0` by Mathlib's convention.
Then:

- for every `s` with `Re s > 1`, `LSeriesHasSum (fun n ↦ (d n : ℂ)) s (ζ(s)²)`;
- `PoleBoundary (fun s ↦ ζ(s)²) 1 1 1`;
- `∑_{1≤n≤X} d(n) / (X log X) → 1` as `X → ∞`.

Here `ζ` is Mathlib's continued `riemannZeta`, identified with its Dirichlet series only on
`Re s > 1`.

*Proof sketch.* `ArithmeticFunction.zeta_mul_pow_eq_sigma` at `k = 0`, with
`ArithmeticFunction.pow_zero_eq_zeta`, gives `ζ * ζ = σ₀`, and `ArithmeticFunction.sigma_zero_apply`
identifies `σ₀ n` with `d(n)`. `LSeriesHasSum.convolution` with the series of `ζ`
(`zeta_eq_tsum_one_div_nat_cpow`, `Complex.summable_one_div_nat_cpow`) gives the first claim.
`analyticOn_riemannZeta` gives the interior and the germs away from `1`. The residue limit
`riemannZeta_residue_one` and `Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt`
show that `(s − 1) ζ(s)`, redefined as `1` at `s = 1`, is analytic at `1`; its square is a
numerator with value `1` for a double pole. HP.4.2 with `k = 1`, `A = 1` gives the count; since
`d(0) = 0`, suppressing the zeroth coefficient changes nothing. *Needs:* HP.0.2, HP.4.2;
Mathlib as listed.

*Source.* Delange (1954), Theorem III, §5.2.1, pp. 235–238, with `ω = 2`. The arithmetic
identities and the continuation of `ζ` are Mathlib's.

The elementary value `d(4) = 3` follows from the divisors `{1, 2, 4}` and fixes the arithmetic
function convention.

**Checks.**

- Replacing `d` by `d + 7 · 1[n = 1]` keeps the limit `1` (HP.4.4).
- `c n = 1` for `n ≥ 1`, the simple pole of `ζ`, gives `S(X)/X → 1`.
- `d₄ = σ₀ * σ₀` has series `ζ(s)⁴`, a pole of order four with
  numerator value `1`, so `∑_{n≤X} d₄(n) / (X (log X)³) → 1/6 = 1/3!`. Normalising by `k`,
  `(k − 1)!` or `(k + 1)!` would give `1/3`, `1/2` or `1/24`. This is the pole order of Wood's
  totally real count into `C₂³`, with finite-prime inertia meeting `C₂² × {1}` trivially and
  trivial complex conjugation (`r = 2`; wood2019 line 1652).

### HP.5.2 A local pole is not enough: the dyadic series

**`dyadicLocalPoleCounterexample`.** Let `c n = n` if `n = 2^j` for some `j ∈ ℕ`, and `c n = 0`
otherwise. Then:

- `c n ≥ 0` for every `n`;
- for `Re s > 1`, `LSeriesHasSum c s (F s)` with `F(s) = 1/(1 − e^((1−s) log 2)) = 1/(1 − 2^(1−s))`;
- near `1`, `F(s) = g(s)/(s − 1)` with `g` analytic on a disc about `1` and `g(1) = 1/log 2`;
- `PoleBoundary F 1 0 (1/log 2)` fails;
- `S_c(2^j)/2^j → 2` and `S_c(3 · 2^j)/(3 · 2^j) → 4/3` as `j → ∞`;
- `S_c(X)/X` does not tend to `1/log 2`. (By the previous item it has no limit at all.)

Every hypothesis of HP.4.2 holds except the `away` field: the coefficients are nonnegative, the
series converges on `Re s > 1`, and the local numerator has positive value. The conclusion fails.

*Proof sketch.* Reindexing by `n = 2^j` gives the geometric series with ratio `2^(1−s)`, of norm
`< 1` for `Re s > 1` (`hasSum_geometric_of_norm_lt_one`). The denominator `1 − 2^(1−s)` has a
simple zero at `1` with derivative `log 2`, so `(s − 1)/(1 − 2^(1−s))` is analytic near `1` with
value `1/log 2`. The denominator vanishes again at `1 + 2πi/log 2`, where `F` has a genuine pole:
`F` is unbounded as `s` approaches that point from the right, so no analytic germ there agrees with
`F` on the right half-disc. For the counts, `S_c(2^j) = 2^(j+1) − 1` and
`S_c(3 · 2^j) = 2^(j+2) − 1`; two different limits along two sequences tending to infinity exclude
any limit. *Needs:* HP.0.2; Mathlib `LSeriesHasSum`, `AnalyticAt`, `hasSum_geometric_of_norm_lt_one`;
Tau Ceti `TauCeti.summatory`.

*Source.* Delange (1954), §5.3, p. 242 (second remark): if only the behaviour at `a` is assumed,
one obtains only that `α(t)` has the order of magnitude `e^(at) t^(ω−1)`, not an asymptotic;
compare the hypotheses of Theorem III, pp. 235–236. The dyadic series is not taken from the
source. It shows that the weaker conclusion of that remark cannot be improved to an asymptotic: its
ratio `S_c(X)/X` stays between positive bounds but has no limit.

**Checks.**

- The exact formulas `S_c(2^j) = 2^(j+1) − 1` and
  `S_c(3 · 2^j) = 2^(j+2) − 1` give `S_c(1) = 1`, `S_c(2) = 3`, `S_c(3) = 3`, `S_c(4) = 7`, `S_c(6) = 7`,
  `S_c(8) = 15`, `S_c(12) = 15`; the ratios at `2^j` are `1, 3/2, 7/4, 15/8 → 2` and at `3 · 2^j`
  are `1, 7/6, 5/4, … → 4/3`.
- `1/log 2 ≈ 1.4427` lies strictly between the two limit points.

### Examples

- `ζ(s)²`: Layer HP.0.2's example gives the boundary data, HP.4.2 the count `X log X`, HP.4.4 the
  insensitivity to the value at `n = 1`.

### Dependencies

Layer HP.4 (HP.5.1) and Layer HP.0 (HP.5.2). Mathlib `riemannZeta` and arithmetic functions.

## Downstream consumers

- Totally real counts of abelian extensions with restricted finite-prime inertia
  (Wood 2019, §7, pp. 416–417; wood2019 line 1652) illustrate the analytic
  input to HP.4.2, HP.4.4 and HP.4.5: the application must prove continuation, positivity of the
  leading coefficient and a coefficientwise arithmetic majorant. These are conditional
  applications of the generic theorems here.
- Orbit counts that are proved through a renewal equation, such as the asymptotic for integer
  points on Markoff–Hurwitz varieties (Gamburd–Magee–Ronan 2019), use HP.3.2 with `k = 0` at a
  positive abscissa: a nondecreasing counting function whose Laplace transform has a single simple
  pole on its line of convergence. Such a consumer proves the convergence, the continuation across
  the boundary line and the positivity of the residue from its own spectral data, and proves the
  uniformity of its count in the starting point separately; HP.3.2 is a statement for one
  function.

## References

- H. Delange, *Généralisation du théorème de Ikehara*, Ann. Sci. École Norm. Sup. (3) **71**
  (1954), 213–242, DOI 10.24033/asens.1023,
  [numdam](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf). Standing hypotheses p. 213;
  regularisation and smoothing §§3–4.1, pp. 220–229; Lemmas 3–4, §5.1, pp. 231–233; Theorem III,
  §5.2.1, pp. 235–238; remarks §5.3, p. 242. The primary source for Layers HP.0–HP.4.
- M. M. Wood, *Nonabelian Cohen–Lenstra moments*, Duke Math. J. **168** (2019), 377–427,
  [author version](https://par.nsf.gov/servlets/purl/10152050); §7, pp. 415–417, for the
  higher-order pole counts and the removal of non-surjective homomorphisms.
- A. Gamburd, M. Magee, R. Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz
  varieties*, Ann. of Math. **190** (2019), 751–809,
  [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf).
  §4.1, pp. 790–791, equation (4.4), and §4.3, pp. 796–797, for the Laplace-resolvent identity
  and holomorphic boundary continuation; uniformity remains a consumer obligation.
- D. Osele, *The Laplace transform* (2026),
  [author source](https://github.com/dennj/mathlib4/blob/90482cd37e85e423459de2ed103cea2f4d98cb20/Mathlib/Analysis/LaplaceTransform.lean#L121-L123),
  declarations `LaplaceConvergent` (lines 68–70; osele-laplace line 72), `laplace`
  (lines 117–118; osele-laplace line 121) and `HasLaplace` (lines 121–123; osele-laplace line 125)
  at commit `90482cd37e85e423459de2ed103cea2f4d98cb20`, for the predicate's shape.
