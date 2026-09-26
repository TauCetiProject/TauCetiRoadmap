# Roadmap: standard probability distributions and their elementary theory

Develop the measure-level elementary theory of the distributions in Layers 0–15: definitions and normalization, densities or masses, moments, transforms, quantiles, and classical pushforward, convolution, independence, and mixture identities.
Complete Mathlib's existing families and construct the additional families and analytic foundations specified below.

**Families.** **Scalar:** Gaussian, Gamma, Beta, exponential, Cauchy, Pareto, interval uniform, Laplace, log-normal, Weibull, chi-squared/chi, inverse-gamma, Student t, F, logistic, Gumbel/GEV, generalized Pareto, inverse Gaussian, truncated/skew normal, Irwin–Hall/Bates, triangular, Kumaraswamy, Gompertz, log-logistic, Nakagami, beta prime, Lévy, generalized gamma/normal, asymmetric Laplace, logit-normal, log-uniform, half-t/half-Cauchy, noncentral chi-squared/chi/t/F/Beta, hypo/hyperexponential, arcsine, semicircle, and scalar stable laws.
**Discrete:** Bernoulli, binomial, Poisson, geometric, finite uniform, categorical, negative binomial, hypergeometric, beta-binomial, beta-negative-binomial, Poisson-binomial, Skellam, finite/infinite Zipf, Yule–Simon, logarithmic series, integer Laplace/Gaussian, and negative hypergeometric.
**Multivariate and matrix:** Gaussian/t, multinomial/negative multinomial, Dirichlet/Dirichlet-multinomial, multivariate hypergeometric, matrix normal, proper complex Gaussian, log-normal, simplex logistic-normal, nonsingular/Gaussian-Gram/inverse-Wishart, and LKJ.
**Spherical and circular:** uniform sphere/ball, von Mises–Fisher, von Mises, and wrapped normal/Cauchy; the entries also specify named specializations and shared constructions.

**Completion means every target and completion check is met.** The shared requirements apply to every entry; the entries determine which formulas and further results are required.
`Suggested.lean` illustrates interfaces, not an exhaustive checklist.
Named specializations may inherit proofs through explicit measure equalities and usable theorem specializations.

**Outside scope:** statistical inference (data, likelihoods, sufficiency, estimators, priors/posteriors, tests, losses, decision rules), sampling algorithms, numerical approximation, and stochastic processes.
Distributional constructions from random variables remain targets.

## Layers

| Layer | Content |
| --- | --- |
| [0](#layer-0-connect-existing-densities-and-add-the-uniform-distribution) | Density interfaces, interval uniform, parameter measurability |
| [1](#layer-1-complete-the-elementary-theory-of-existing-distributions) | Existing scalar families and probability generating functions |
| [2](#layer-2-incomplete-special-functions-and-closed-form-cdfs) | Incomplete Gamma/Beta, error function, cdfs |
| [3](#layer-3-new-scalar-families) | Laplace, log-normal, Weibull, chi-squared, inverse-gamma, t, F, negative binomial, hypergeometric |
| [4](#layer-4-relationships-among-distributions) | Squares, ratios, sums, mixtures, extrema, order statistics |
| [5](#layer-5-multivariate-distributions) | Gaussian, multinomial, Dirichlet, conditioning, splitting |
| [6](#layer-6-symmetric-matrices-and-wishart-distributions) | Symmetric volume, Cholesky, multivariate Gamma, Wishart and inverse-Wishart |
| [7](#layer-7-affine-laws-quantiles-and-distribution-constructions) | Transport, quantiles, conditioning, mixtures, Poisson constructions, tilting, hazards, continuity |
| [8](#layer-8-special-functions-for-the-expanded-families) | Bessel I, Owen's T, zeta/theta, inverse functions |
| [9](#layer-9-finite-mixed-and-integer-valued-discrete-families) | Finite, mixed, and integer-valued families |
| [10](#layer-10-scalar-continuous-and-noncentral-families) | Further scalar and noncentral families |
| [11](#layer-11-multivariate-t-and-gaussian-transformations) | Multivariate t; matrix, complex, log-normal, and logistic-normal laws |
| [12](#layer-12-spherical-and-circular-laws) | Sphere, ball, von Mises–Fisher, von Mises, wrapped laws |
| [13](#layer-13-quantile-formulas-and-coverage-of-all-families) | Quantile coverage |
| [14](#layer-14-lkj-correlation-matrix-laws) | LKJ correlation matrices |
| [15](#layer-15-scalar-stable-laws) | Scalar stable laws in Nolan's S₀ convention |

Dependencies, existing interfaces, suggested declaration names, and references follow the work plan.

## Shared requirements

### Interfaces and carriers

For every `fooMeasure p : Measure α`, specify all parameter values, prove probability under the exact valid hypotheses and named probability boundaries, and provide:

- **Density or mass API.** Full-dimensional continuous laws expose `fooPDFReal`, its `ℝ≥0∞` companion `fooPDF`, equality to `volume.withDensity`, `HasPDF` for variables with that law, and `rnDeriv`.
  Pushforward/mixture definitions prove this equality on their absolutely continuous range.
  Constrained laws name their chart and reference measure; sphere/circle laws use surface/Haar measure.
  Singular laws get singularity or Dirac theorems.
  Mixed laws expose their atoms and continuous component, not `HasPDF` for a law with a nonzero atom.
  Discrete laws expose singleton masses, support, and a weighted Dirac sum.
- **Parameter measurability.** Prove `Measurable fun p => fooMeasure p` for the full totalized family with the Giry measurable structure.
  Use coordinate parameters and `Matrix.of` for matrices, pairing other parameters alongside.
  Symmetric-matrix scale families also need the Borel symmetric-carrier corollary for random-scale kernels.
  Restriction to valid probability parameters gives a Markov kernel through existing APIs.
- **Usable identities.** Prove the entry's results, Layer 7 transport, and Layer 13 quantiles.
  Measure statements are primary; derive native-carrier `HasLaw` and independence corollaries.
  A construction from independent variables is a product-measure pushforward, and a mixture uses `Measure.bind`.

| Carrier | Analytic interface |
| --- | --- |
| `ℝ` | `ProbabilityTheory.cdf`, moments, and the explicitly requested scalar transforms/domains |
| `ℕ`, `ℤ` | Native masses, support, convolution, translations; real casts for analytic results and quantiles. Only `ℕ` uses `pgf`; integer bilateral series need explicit convergence domains. |
| Finite real vectors | `EuclideanSpace ℝ ι`, Bochner mean, matrix covariance linked to `covarianceBilin`, and named real linear observables. Count vectors stay on `ι → ℕ` until coordinatewise real casting. |
| Symmetric matrices | `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`, retained subtype topology, Frobenius pairing, and Layer 6 reference volume. Transforms use real trace statistics and bundled symmetric arguments. |
| Rectangular/complex Gaussian | Layer 11's real-coordinate identifications; distinguish complex covariance from pseudocovariance. |
| Sphere/circle | Ambient embeddings or circle characters; real cdfs/quantiles use the specified angle chart. |

There is no scalar vector/matrix cdf, matrix-valued `mgf id`, or joint multivariate quantile.
LKJ uses correlation-coordinate volume, not full symmetric volume.
Inverse-Wishart requires the stated mean, non-integrability, and diagonal marginals, not an additional covariance or transform development.

### Conventions

**Notation.** In scalar entries, $f,F,M,K,\varphi,D$ denote the real density, cdf, mgf, cgf, characteristic function, and exact set `integrableExpSet id μ`.
For other carriers use the named real observable.
These are mathematical abbreviations, not new Lean abstractions.
The characteristic kernel is $e^{i\langle t,x\rangle}$, not the $2\pi$-normalized Fourier kernel.
Write $G_a(x)=\mathrm{regularizedGamma}\ a\ x$, $I_x(a,b)=\mathrm{regularizedIncompleteBeta}\ a\ b\ x$, and $B(a,b)=\mathrm{ProbabilityTheory.beta}\ a\ b$.
The standard Gaussian density/cdf are $\phi,\Phi$ and its quantile is $z(u)$.
For simplex parameters, $p_i=p.\mathrm{weights}(i)$.

Analytic formulas cast counts and dimensions to `ℝ` before division; real exponents use `Real.rpow`, and noninteger complex powers use principal `Complex.cpow` where specified.
Natural powers and factorials retain their natural indices.
Explicit casts, reference measures, and branch choices are part of the specification.
Matrices act on Euclidean vectors through `Matrix.toEuclideanLin`; $S\succeq0$ and $S\succ0$ mean `S.PosSemidef` and `S.PosDef`, and $\sqrt S$ means `CFC.sqrt S`.
$N(m,v)$ and $N(m,S)$ denote the existing scalar and multivariate Gaussian laws.

**Hypotheses and totalization.** Each entry's valid parameter hypotheses govern its probability formulas unless a boundary or invalid case is stated.
Preserve existing parameter types and invalid behavior, notably Gamma's definition, which is not zeroed for invalid parameters.
New density-defined laws are zero outside the stated range unless a boundary law is named.
A pushforward or mixture inherits a fallback only when explicitly specified; otherwise guard before constructing it.
Use `Convexity.StdSimplex` for normalized finite weights, interval/nonnegative types where appropriate, and raw reals where required by analysis or established APIs.

**Moments and transforms.** Every substantive moment formula includes integrability; every requested sharp threshold includes non-integrability outside it.
Scalar laws require exact exponential-integrability domains even without a transform formula; every stated $D$ is exact.
A requested mgf formula also requires its simplified cgf on $D$ (for example $K_\Gamma(t)=-a\log(1-t/r)$).
Non-integrability concerns the integrand, never an infinite value for a totalized real integral.
No unlisted closed form is implicit: in particular, Beta's confluent-hypergeometric transforms, Bessel-K inverse-gamma/t transforms, and a log-normal mgf formula are excluded.

**Support and quantiles.** Distinguish almost-sure carrier, positivity of a chosen density/mass, and topological support: the closed set of points whose every neighbourhood has positive measure.
A positive-shape Gamma law is almost surely positive but has topological support $[0,\infty)$.
Every finite-valued quantile theorem explicitly assumes $0 < u<1$ and valid parameters; endpoint statements are one-sided limits, not values of totalized `sInf`.
Generic inverse/transport results plus family identities discharge specializations, but the requisite cdf, support, and regularity results must be supplied.

**Dirac package.** Prove once and specialize wherever requested: for $\delta_c$ on `ℝ`, $F(x)=\mathbf1_{c\le x}$, mean $c$, variance $0$, raw moment $c^n$, $D=\mathbb R$, $M(t)=e^{tc}$, $K(t)=tc$, $\varphi(t)=e^{itc}$; on `ℕ`, $\delta_k$ has cumulative mass $\mathbf1_{k\le n}$ and pgf $z^k$.
Dirac quantiles are covered by Layer 7.
Boundary identities remain explicit, e.g. chi-squared degree zero and negative binomial shape zero with $0 < p\le1$ are $\delta_0$.

**Reuse and naming.** Use `Measure`, `HasLaw`, `HasPDF`, `cdf`, `Measure.quantile`, `Measure.conv`, `cond`, `Measure.tilted`, `Measure.bind`, `Kernel`, and existing transforms; introduce no parallel abstractions or new PMF versions.
Connect existing PMFs, but put new theory on measures.
Do not re-prove Mathlib's Gaussian, Gamma-function, matrix-spectral, or independence infrastructure.
Follow `fooMeasure`, `fooPDFReal`, `fooPDF`, `isProbabilityMeasure_fooMeasure`, and the existing `integral_id_fooMeasure`, `variance_id_fooMeasure`, `mgf_id_fooMeasure`, `charFun_fooMeasure`, `cdf_fooMeasure_eq` styles.
Discrete analytic names identify the cast law or use `…_of_hasLaw_…`.
See the [existing API](#existing-api-to-reuse), [design references](#related-work-and-design-references), and [declaration index](#declaration-index).

## Work plan

### Layer 0: connect existing densities and add the uniform distribution

#### 0.1 Density interfaces

For Gamma, Gaussian, Beta, exponential, Cauchy, and Pareto, prove `HasLaw` → `HasPDF` and equality of the RV pdf to the named pdf almost everywhere on `volume`, on each absolutely continuous range.
Gamma's theorem needs no positive-parameter assumptions; Gaussian needs $v\ne0$ and Cauchy $\gamma\ne0$.
Factor the `withDensity` cases through `hasPDF_of_hasLaw_withDensity`.

#### 0.2 Radon–Nikodym derivatives

Identify the Gamma, Beta, exponential, Cauchy, and Pareto derivatives with their named pdfs using `Measure.rnDeriv_withDensity`.
At Cauchy scale zero the derivative is zero almost everywhere.
Reuse `rnDeriv_gaussianReal`, including its zero-variance case.

#### 0.3 Interval uniform

Define `uniformMeasure a b = cond volume (Ioc a b)`; it is zero for $b\le a$.
For $a < b$, use $f(x)=\mathbf1_{(a,b]}(x)/(b-a)$ and prove:

```math
F(x)=\begin{cases}0&x\le a,\\1&x\ge b,\\(x-a)/(b-a)&a < x < b,\end{cases}
\qquad E[X]=(a+b)/2,\quad \mathrm{Var}\,X=(b-a)^2/12.
```

Here $D=\mathbb R$, $M(0)=\varphi(0)=1$, and for $t\ne0$,

```math
M(t)=\frac{e^{bt}-e^{at}}{(b-a)t},\qquad
\varphi(t)=\frac{e^{ibt}-e^{iat}}{i(b-a)t}.
```

Prove the shared density interfaces, parameter measurability, and `(uniformMeasure 0 1).map (a+(b-a)*·) = uniformMeasure a b`.
Relate `HasLaw` of the unit uniform to `pdf.IsUniform` on `Ioc 0 1`, using its existing conditional-volume definition.

#### 0.4 Parameter measurability

Prove joint parameter measurability for the existing families; derive `withDensity` cases from joint measurability of the pdf.
Include `Measurable fun r : ℝ≥0 => poissonMeasure r`, used with `Real.toNNReal` in Layer 4.

### Layer 1: complete the elementary theory of existing distributions

**Cast cdf.** For probability `μ : Measure ℕ`, prove

```math
\mathrm{cdf}(\mu.\mathrm{map}\ \mathrm{Nat.cast})(x) =
\begin{cases}0&x<0,\\\mu.\mathrm{real}\{k:k\le\lfloor x\rfloor_+\}&x\ge0.\end{cases}
```

The negative branch must precede natural-number floor.

**Bernoulli and binomial.** For $p\in I$, put $q=1-p$.
The real Bernoulli on $`\{0,1\}`$ has mean $p$, variance $pq$, $M(t)=q+pe^t$, and $\varphi(t)=q+pe^{it}$.
For `Bin(ℝ,n,p)`, prove mean $np$, variance $npq$, $M(t)=(q+pe^t)^n$, and $\varphi(t)=(q+pe^{it})^n$ for every $t$; the powers are natural.
Prove native fixed-$p$ convolution by adding trial counts and the iid Bernoulli-sum law.
Layer 2 gives cumulative masses (Bernoulli is $n=1$); no general raw-moment formula is required.
Follow the referenced binomial mean/variance interfaces.

**Geometric.** For $p\in I$, $q=1-p$, retain Mathlib's $p=0$ law $\delta_0$ and its Dirac package.
For $p\ne0$,

```math
E[X]=q/p,\quad \mathrm{Var}\,X=q/p^2,\quad
D=\{t:qe^t<1\},\quad M(t)=\frac p{1-qe^t},\quad
\varphi(t)=\frac p{1-qe^{it}},\quad \mu\{k:k\le n\}=1-q^{n+1}.
```

Prove memorylessness for every $p$ in division-free form
$`\mu\{k:n+m\le k\}\mu(\mathbb N)=\mu\{k:n\le k\}\mu\{k:m\le k\}`$.
Give the `cond` form only for nonzero conditioning mass (automatic for $0 < p<1$).

**Poisson.** For $r:\mathbb R_{\ge0}$, the cast law has mean and variance $r$, $D=\mathbb R$, $M(t)=\exp(r(e^t-1))$, and $K(t)=r(e^t-1)$.
Reuse its characteristic function and native additivity; Layer 2 supplies the tail/cumulative formula.

**Exponential.** For $r>0$, prove mean $r^{-1}$, variance $r^{-2}$, $D=(-\infty,r)$, $M(t)=r/(r-t)$, $\varphi(t)=r/(r-it)$, and `cond` memorylessness.
Independent exponentials of positive rates $r,s$ have minimum of rate $r+s$.
Follow mathlib4#35504.

**Gamma.** For $a,r>0$,

```math
E[X]=a/r,\quad \mathrm{Var}\,X=a/r^2,\quad
D=(-\infty,r),\quad M(t)=(1-t/r)^{-a},\quad
\varphi(t)=(1-it/r)^{-a}.
```

Justify the principal complex power by the base's real part $1$.
Prove common-rate convolution by adding positive shapes and positive scaling $cX\sim\mathrm{Gamma}(a,r/c)$.

**Beta.** For $a,b>0$,

```math
E[X]=\frac a{a+b},\quad
\mathrm{Var}\,X=\frac{ab}{(a+b)^2(a+b+1)},\quad
E[X^n]=\frac{\Gamma(a+n)\Gamma(a+b)}{\Gamma(a)\Gamma(a+b+n)}\quad(n\in\mathbb N).
```

Bounded support gives $D=\mathbb R$; no mgf or characteristic-function formula is requested.

**Cauchy.** For $m\in\mathbb R$, $\gamma:\mathbb R_{\ge0}$, prove $\varphi(t)=e^{imt-\gamma|t|}$.
At $\gamma=0$, reuse `cauchyMeasure_zero_scale` and the Dirac package.
For $\gamma>0$, $F(x)=\tfrac12+\arctan((x-m)/\gamma)/\pi$, $`D=\{0\}`$, and `id` is not integrable.
For $n>0$ iid variables of this law, their average has the same law, including $\gamma=0$; no empty-average target.

**Pareto.** For threshold $t>0$ and shape $r>0$,

```math
F(x)=\begin{cases}0&x < t,\\1-(t/x)^r&x\ge t,\end{cases}\quad
E[X]=\frac{rt}{r-1}\ (r>1),\quad
\mathrm{Var}\,X=\frac{rt^2}{(r-1)^2(r-2)}\ (r>2).
```

Prove non-integrability of `id` for $r\le1$ and of $x^2$ for $r\le2$ within the valid family; $D=(-\infty,0]$.

**Real Gaussian.** For `gaussianReal m v`, prove even central moment $v^n(2n-1)!!$, vanishing odd central moments, and

```math
E[|X-m|^n]=(2v)^{n/2}\Gamma((n+1)/2)/\sqrt\pi.
```

Layer 2 supplies the cdf; noncentral absolute-moment closed forms are excluded.

**Real-power moments.** With valid parameters, prove the following formulas and exact integrability criteria using `Real.rpow`; null zero endpoints do not affect them:

| Law and integrand | Value | Integrable exactly when |
| --- | --- | --- |
| Gamma, $X^q$ | $r^{-q}\Gamma(a+q)/\Gamma(a)$ | $q>-a$ |
| Beta, $X^q(1-X)^s$ | $B(a+q,b+s)/B(a,b)$ | $a+q>0$ and $b+s>0$ |
| Pareto, $X^q$ | $rt^q/(r-q)$ | $q < r$ |

Derive the natural-moment specializations.

**Probability generating functions.** Define `pgf X μ z = ∫ ω, z ^ X ω ∂μ` for `ℕ`-valued `X`, and prove `pgf X μ (exp t) = mgf (fun ω => (X ω : ℝ)) μ t`.
Under a probability measure, prove multiplicativity over independent sums for $|z|\le1$, and for arbitrary $z$ when both factor integrands are integrable; do not use totalization to remove these hypotheses.

For every real $z$, the Bernoulli, binomial, and Poisson pgfs are $1-p+pz$, $(1-p+pz)^n$, and $e^{r(z-1)}$.
For geometric $p\ne0$, the exact absolute-integrability domain is $|(1-p)z|<1$, with pgf $p/(1-(1-p)z)$; at $p=0$ it is identically $1$.

For every probability measure on `ℕ`, prove coefficient recovery
`iteratedDeriv n (pgf id μ) 0 = n! * μ.real {n}` and `measure_eq_of_pgf_eqOn` from equality on $(-1,1)$.
Write $(k)_n$ for the natural falling factorial, zero for $k < n$.
A positive exponential moment gives
`iteratedDeriv n (pgf id μ) 1 = ∫ k, ((k)_n : ℝ) ∂μ`.
Under only a finite $n$th moment, require instead convergence of these derivatives to the factorial moment as $z\uparrow1$ through $(0,1)$; ordinary differentiability at $1$ is not asserted.
See the [curriculum gap](https://github.com/leanprover-community/mathlib4/blob/9caeba1000ef8f302920981f4a08651d325abc81/docs/undergrad.yaml#L574-L575).

### Layer 2: incomplete special functions and closed-form cdfs

Reuse complete Gamma and `ProbabilityTheory.beta`.
Consume the incomplete/error-function APIs at the pin; otherwise implement these shapes, following mathlib4#34053 for the real error functions.

**Incomplete Gamma.** Define

```math
\gamma(s,x)=\begin{cases}\int_0^{\max(x,0)}t^{s-1}e^{-t}\,dt&s>0,\\0&s\le0,\end{cases}
\qquad G_s(x)=\begin{cases}\gamma(s,x)/\Gamma(s)&s>0,\\0&s\le0.\end{cases}
```

Use the names `lowerIncompleteGamma` and `regularizedGamma`.
For $s>0$, prove convergence, continuity and monotonicity on `ℝ`, strict monotonicity on $[0,\infty)$, $G_s(x)\to1$ as $x\to\infty$, and

```math
\gamma(s+1,x)=s\gamma(s,x)-x^se^{-x}\quad(x\ge0).
```

The derivative $x^{s-1}e^{-x}$ is asserted for $x>0$; at zero with $0 < s<1$, require continuity only.

**Incomplete Beta.** For $a,b>0$, define `regularizedIncompleteBeta`, written $I_x(a,b)$, by integrating $t^{a-1}(1-t)^{b-1}/B(a,b)$ from $0$ to $\min(1,\max(x,0))$.
Invalid parameters give zero except $I_x(0,b)=1$ for $b>0,x\ge0$; retain zero at $b=0$.

For positive shapes, prove continuity/monotonicity on `ℝ`, strict monotonicity on $[0,1]$, the zero/one extensions, and interior differentiability.
For $0\le x\le1$,

```math
I_x(a,b)=1-I_{1-x}(b,a),\qquad
I_x(a+1,b)=I_x(a,b)-\frac{x^a(1-x)^b}{aB(a,b)}.
```

The recurrence follows the [DLMF shape](https://dlmf.nist.gov/8.17.E20).
The $a=0$ convention records the cdf of the boundary $\delta_0$ and includes $m=p=0$ in the binomial-tail formula.
Do not extend reflection to atomic boundary edges; the unused $b=0$ alternative would represent $\delta_1$.

**Error functions.** Define `Real.erf x = (2/√π) * ∫ t in 0..x, exp(-t²)` and `Real.erfc = 1-erf`.
Prove oddness, derivative, strict monotonicity, limits at both infinities, and $\mathrm{erf}(x)=G_{1/2}(x^2)$ for $x\ge0$.

**Cdfs and tails.** With valid family parameters, prove for every real $x$:
- Gaussian, $v\ne0$: $F(x)=(1+\mathrm{erf}((x-m)/\sqrt{2v}))/2$; at $v=0$ use $\mathbf1_{m\le x}$.
- Gamma: $F(x)=G_a(rx)$; Beta: $F(x)=I_x(a,b)$; the special functions are clamped below the support.
- Binomial, $m\le n,p\in I$: $P(X\ge m)=I_p(m,n-m+1)$.
- Poisson, $r:\mathbb R_{\ge0}$: $P(X>n)=G_{n+1}(r)$.

**Checks:** $G_1(x)=1-e^{-x}$ for $x\ge0$, and $\mathrm{erf}(0)=0$.

### Layer 3: new scalar families

The shared interfaces apply.
Each entry fixes its parameters and all invalid/boundary behavior; cdfs below include their support guards.

**Laplace — `laplaceMeasure m b`.** For $b>0$, define $f(x)=e^{-|x-m|/b}/(2b)$; otherwise the pdfs and law are zero.
Prove

```math
F(x)=\begin{cases}\tfrac12e^{(x-m)/b}&x < m,\\1-\tfrac12e^{-(x-m)/b}&x\ge m,\end{cases}
\quad E[X]=m,\quad\mathrm{Var}\,X=2b^2,
```

$D=(-1/b,1/b)$, $M(t)=e^{mt}/(1-b^2t^2)$, and $\varphi(t)=e^{imt}/(1+b^2t^2)$.

**Log-normal — `logNormalMeasure m v`, $v:\mathbb R_{\ge0}$.** Define `(gaussianReal m v).map exp`.
For $v>0$, derive by change of variables

```math
f(x)=\frac{e^{-(\log x-m)^2/(2v)}}{x\sqrt{2\pi v}},\qquad
F(x)=\frac{1+\mathrm{erf}((\log x-m)/\sqrt{2v})}{2}\quad(x>0),
```

with both zero for $x\le0$, and $D=(-\infty,0]$; no mgf closed form.
At $v=0$, prove $\delta_{e^m}$ and specialize the Dirac package.
For every real $q$, including zero variance, $E[X^q]=e^{qm+q^2v/2}$.
In particular, mean $e^{m+v/2}$ and variance $(e^v-1)e^{2m+v}$.

**Weibull — `weibullMeasure k s`.** For $k,s>0$, define $f(x)=(k/s)(x/s)^{k-1}e^{-(x/s)^k}$ for $x>0$, zero otherwise; invalid parameters give zero law/pdfs.
Its cdf is $1-e^{-(x/s)^k}$ for $x>0$, zero otherwise.
Prove $E[X^q]=s^q\Gamma(1+q/k)$ exactly for $q>-k$, including natural moments, and variance $s^2(\Gamma(1+2/k)-\Gamma(1+1/k)^2)$.

| Shape | Exact $D$ | Required mgf |
| --- | --- | --- |
| $k>1$ | $\mathbb R$ | Convergent $\sum_{n\ge0}(ts)^n\Gamma(1+n/k)/n!$ |
| $k=1$ | $(-\infty,1/s)$ | $(1-st)^{-1}$ |
| $0 < k<1$ | $(-\infty,0]$ | No closed form |

**Chi-squared — `chiSquaredMeasure k`.** Define $\delta_0$ at $k=0$, `gammaMeasure (k/2) (1/2)` at $k>0$, and zero at $k<0$.
For positive degree inherit the density/cdf, mean $k$, variance $2k$, $D=(-\infty,1/2)$, $M(t)=(1-2t)^{-k/2}$, and $\varphi(t)=(1-2it)^{-k/2}$ with principal complex power.
At degree zero specialize the Dirac package.
Prove convolution by adding nonnegative degrees.

**Inverse-gamma — `inverseGammaMeasure a r`.** For $a,r>0$, define `(gammaMeasure a r).map (·⁻¹)`; otherwise zero.
For $x>0$,

```math
f(x)=\frac{r^a}{\Gamma(a)}x^{-a-1}e^{-r/x},\qquad F(x)=1-G_a(r/x),
```

and both vanish for $x\le0$.
Prove $E[X^q]=r^q\Gamma(a-q)/\Gamma(a)$ exactly for $q < a$, mean $r/(a-1)$ for $a>1$, variance $r^2/((a-1)^2(a-2))$ for $a>2$, and matching first/second-moment failures.
Here $D=(-\infty,0]$; no Bessel-transform value is required.

**Student's t — `studentTMeasure ν`.** For $\nu>0$, define

```math
f(x)=\frac{\Gamma((\nu+1)/2)}{\sqrt{\nu\pi}\,\Gamma(\nu/2)}(1+x^2/\nu)^{-(\nu+1)/2};
```

otherwise zero.
Within this family, mean $0$ exists for $\nu>1$, variance $\nu/(\nu-2)$ for $\nu>2$, and the corresponding first/second integrands are non-integrable below or at those thresholds.
Put $b=\nu/(\nu+x^2)$: $F(x)=I_b(\nu/2,1/2)/2$ for $x<0$, and $1-I_b(\nu/2,1/2)/2$ otherwise.
Prove $`D=\{0\}`$; no Bessel-type characteristic formula.

**Fisher's F — `fisherSnedecorMeasure m n`.** For $m,n>0$, define, on $x>0$,

```math
f(x)=\frac{\Gamma((m+n)/2)}{\Gamma(m/2)\Gamma(n/2)}
(m/n)^{m/2}x^{m/2-1}(1+mx/n)^{-(m+n)/2},\qquad
F(x)=I_{mx/(n+mx)}(m/2,n/2).
```

The density/cdf vanish for $x\le0$ and invalid parameters give zero measure.
Prove mean $n/(n-2)$ for $n>2$, variance $2n^2(m+n-2)/(m(n-2)^2(n-4))$ for $n>4$, matching non-integrability, and $D=(-\infty,0]$.

**Negative binomial — `negativeBinomialMeasure r p`.** The probability range is $r\ge0$, $0 < p\le1$.
For $r>0$, define the weighted Dirac sum on `ℕ` with mass

```math
p_k=\frac{\Gamma(k+r)}{k!\Gamma(r)}p^r(1-p)^k.
```

At $r=0$ or $p=1$ within this range, the law is $\delta_0$; all other invalid parameters give zero.
All following formulas assume $0 < p\le1$.
Prove native masses/support and fixed-$p$ convolution by adding nonnegative shapes.

For $r>0$, the pgf has exact domain $|(1-p)z|<1$ and value $(p/(1-(1-p)z))^r$.
The cast law has

```math
E[X]=\frac{r(1-p)}p,\quad \mathrm{Var}\,X=\frac{r(1-p)}{p^2},\quad
D=\{t:(1-p)e^t<1\},\quad M(t)=\left(\frac p{1-(1-p)e^t}\right)^r,
```

$\varphi(t)=(p/(1-(1-p)e^{it}))^r$ (justify the principal branch), and $P(X\le k)=I_p(r,k+1)$.
Apply the guarded cast-cdf bridge.
At $r=0$, specialize the Dirac package; its domain is all `ℝ`, not the positive-shape domain.

**Hypergeometric — `hypergeometricMeasure N K n`.** For naturals $K,n\le N$, use mass

```math
p_k=\frac{\binom Kk\binom{N-K}{n-k}}{\binom Nn}\quad(k\le n),
```

zero for $k>n$ and zero measure for invalid parameters.
Interpret the definition's ratio in `ℝ≥0∞`; the positive-mass conditions are $k\le K$, $k\le n$, and $n-k\le N-K$.

With real casts, prove mean $nK/N$ for $N>0$ and variance
$n(K/N)(1-K/N)(N-n)/(N-1)$ for $N>1$.
At $N=0$, valid parameters are $K=n=0$ and both moments are zero; at $N=1$ retain the mean formula and set variance zero.
Cumulative masses, mgf and characteristic function are the finite sums of $p_k$ (transforms through $k\le n$), with $D=\mathbb R$; no hypergeometric special function is required.

Prove symmetry in $K,n$.
For fixed $n,k$, $K_N\le N$, and $K_N/N\to p\in I$, prove singleton-mass convergence to `binomial n p` as $N\to\infty$.

**Checks:** chi-squared degree $2$ is exponential of rate $1/2$; t degree $1$ is standard Cauchy; Weibull shape $1$ recovers the exponential cdf.

### Layer 4: relationships among distributions

State these as product-measure pushforwards or `Measure.bind` identities, with `HasLaw`/`iIndepFun` corollaries.
Variables in each product construction are independent.

#### 4.1 Gaussian squares

A standard Gaussian square has law `chiSquaredMeasure 1`; the sum of squares of `Fin k` standard Gaussians has law `chiSquaredMeasure k`, including the empty sum at $k=0$.

#### 4.2 Ratios

Prove $Z/\sqrt{V/\nu}\sim t_\nu$ for $Z\sim N(0,1)$, $V\sim\chi^2_\nu$, $\nu>0$; $(U/m)/(V/n)\sim F(m,n)$ for $U\sim\chi^2_m$, $V\sim\chi^2_n$, $m,n>0$; and $Z_1/Z_2\sim\mathrm{Cauchy}(0,1)$ for standard Gaussians.

#### 4.3 Gamma–Beta factorization

For $a,b,r>0$, prove the joint identity
```lean
((gammaMeasure a r).prod (gammaMeasure b r)).map
    (fun z => (z.1 / (z.1 + z.2), z.1 + z.2)) =
  (betaMeasure a b).prod (gammaMeasure (a + b) r)
```
Prove the zero-denominator branch null and deduce the Beta marginal and independence from the total.

#### 4.4 Sums and differences

Prove the difference of two rate-$1/b$ exponentials is `laplaceMeasure 0 b` for $b>0$; a sum of $n$ geometric variables with $p\in I$, $p\ne0$, is `negativeBinomialMeasure n p`, including $n=0$ and $p=1$; and a sum of $n>0$ rate-$r>0$ exponentials is `gammaMeasure n r` (Erlang).

#### 4.5 Gamma-mixed Poisson

For $r>0$, $0 < p<1$, prove
```lean
(gammaMeasure r (p / (1-p))).bind
    (fun lam => poissonMeasure (Real.toNNReal lam)) = negativeBinomialMeasure r p
```
using Layer 0's parameter measurability.

#### 4.6 Extrema and order statistics

For a nonempty finite independent family with cdfs $F_i$, prove maximum cdf $\prod_iF_i(x)$ and minimum cdf $1-\prod_i(1-F_i(x))$.
Define extrema through nonempty `Finset.univ`, with no empty default.
Retain `cdf_max_iid`, the iid minimum corollary, and the exponential-minimum specialization.

For $n\ge1$, $1\le k\le n$, define the kth order statistic of `Fin n → ℝ` by sorting with multiplicities.
Prove measurability and the characterization by at least $k$ coordinates being at most $x$.
For iid law $\mu$ (atoms allowed),

```math
F_{(k)}(x)=\sum_{j=k}^n\binom nj F(x)^j(1-F(x))^{n-j}.
```

For unit uniforms, identify the marginal as `betaMeasure k (n+1-k)` and the sorted joint density as
$n!\mathbf1_{0 < y_1<\cdots < y_n<1}$ relative to volume on `Fin n → ℝ`.
This is the joint-density target used for Layer 5 spacings; general joint order-statistic density theory is excluded.

**Check:** at $\nu=1$, the t-ratio and Cauchy-ratio constructions agree through Layer 3.

### Layer 5: multivariate distributions

#### 5.1 Covariance matrices

Define `covMatrix μ i j = cov[fun z => z i, fun z => z j; μ]` on `EuclideanSpace ℝ ι`.
For $S\succeq0$, prove `covMatrix (multivariateGaussian m S) = S`; reuse integrability and mean $m$ for every $S$, including invalid covariances.

For finite $\mu$ with `MemLp id 2 μ`, prove

```math
\mathrm{covarianceBilin}(\mu)(x,y)=\langle x,\mathrm{covMatrix}(\mu)y\rangle.
```

Keep `MemLp`: `covarianceBilin_of_not_memLp` sets the bilinear form to zero without forcing all entrywise covariances to vanish (for example, Cauchy × Gaussian).

#### 5.2 Gaussian density

For $S\succ0$, $d=\mathrm{card}\,\iota$, prove the full density API with

```math
f(x)=(2\pi)^{-d/2}(\det S)^{-1/2}
\exp\!\left(-\tfrac12\langle x-m,S^{-1}(x-m)\rangle\right).
```

Use Euclidean volume, real powers and dimension casts, and `Matrix.toEuclideanLin`.
Derive it by affine change of variables from `TauCeti.pi_gaussianReal_eq_withDensity`.
For $S$ not positive-definite, prove singularity relative to volume.

#### 5.3 Gaussian transport, transforms, and mixed moments

For rectangular $L:\mathrm{Matrix}\ \kappa\ \iota\ \mathbb R$, translation $c$, and $S\succeq0$,

```math
N(m,S).\mathrm{map}(x\mapsto Lx+c)=N(Lm+c,LSL^{\mathsf T}).
```

Do not extend this parameter formula to invalid $S$: the Dirac fallback need not survive a projection's change of covariance validity.
Reuse coordinate and restriction marginals.
For $Y=\langle\theta,X\rangle$, $D_Y=\mathbb R$ for every $S$; under $S\succeq0$,

```math
M_Y(t)=\exp\!\left(t\langle\theta,m\rangle+\tfrac12t^2\langle\theta,S\theta\rangle\right).
```

**Quadratic forms.** For $X\sim N(0,S)$, $S\succeq0$, and `Θ.IsHermitian`, put $`B=\sqrt S\,\Theta\sqrt S`$.
Prove

```math
t\in D_{\langle X,\Theta X\rangle}\iff I-2tB\succ0,\qquad
M(t)=\det(I-2t\Theta S)^{-1/2}\quad(t\in D).
```

Prove the determinant equals $\det(I-2tB)$ using `CFC.sqrt_mul_sqrt_self` and `Matrix.det_one_add_mul_comm`.
Required route: push `stdGaussian` by `CFC.sqrt S`, rotate by the eigenbasis using `stdGaussian_eq_map_pi_orthonormalBasis`, and combine independent squares with `iIndepFun.mgf_sum`.
The scalar factor is $(1-2t)^{-1/2}$ for $t<1/2$, from `integral_gaussian`/chi-squared degree one.

**Mixed moments.** For centered $Z$ with PSD covariance, prove monomial integrability and Wick–Isserlis: odd products have mean zero, and even products sum covariance products over pairings of positions.
In particular,

```math
E[Z_iZ_jZ_kZ_l]=S_{ij}S_{kl}+S_{ik}S_{jl}+S_{il}S_{jk}.
```

Expand about the mean for noncentered moments, reusing Gaussian polynomial integrability.
Prove independence of $AZ,BZ$ exactly when $ASB^{\mathsf T}=0$.
For standard Gaussian and mutually orthogonal orthogonal projections $P_i$, prove joint independence of projected vectors and $`\|P_iZ\|^2\sim\chi^2_{\mathrm{rank}\,P_i}`$, including rank zero.

#### 5.4 Conditional Gaussian

Use `EuclideanSpace ℝ (ι ⊕ κ)` and define $S_{ab}$ by the corresponding `Sum.inl`/`Sum.inr` submatrices, with matching mean and variable restrictions.
For joint $S\succeq0$ and $S_{22}\succ0$, define the measurable kernel

```math
x_2\longmapsto N\!\left(m_1+S_{12}S_{22}^{-1}(x_2-m_2),
 S_{11}-S_{12}S_{22}^{-1}S_{21}\right).
```

Prove `condDistrib X₁ X₂ P =ᵐ[P.map X₂] gaussianCondKernel` using `condDistrib_ae_eq_of_measure_eq_compProd` and the Schur-complement API.
Singular Schur complements, including Dirac conditional laws, are allowed.
For any PSD joint covariance, block independence is equivalent to $S_{12}=0$.
Generalized-inverse conditioning on singular $S_{22}$ is excluded.

#### 5.5 Multinomial

For finite nonempty `ι`, $n:\mathbb N$, and `p : Convexity.StdSimplex ℝ≥0 ι`, define the Dirac sum on `ι → ℕ` with mass

```math
\frac{n!}{\prod_i k_i!}\prod_i p_i^{k_i}\quad\text{if }\sum_i k_i=n,
```

zero otherwise.
This parameter type has no invalid branch.
Prove masses/support, native binomial marginals, and arbitrary finite aggregation: the fibre-sum map for $f:\iota\to\kappa$ gives `multinomialMeasure n (Convexity.StdSimplex.map f p)`.

Define `multinomialToEuclidean` by coordinatewise real casting through `EuclideanSpace.equiv.symm`.
For the cast law, prove mean $np$, covariance $n(\mathrm{diag}\,p-pp^{\mathsf T})$, and

```math
\varphi(t)=\left(\sum_jp_je^{it_j}\right)^n,\qquad
M_{\langle\theta,X\rangle}(t)=\left(\sum_jp_je^{t\theta_j}\right)^n,\qquad D_{\langle\theta,X\rangle}=\mathbb R.
```

Package covariance entrywise, as `covMatrix`, and as `covarianceBilin`.

#### 5.6 Dirichlet

For finite nonempty `ι`, define `dirichletMeasure a` by normalizing independent `gammaMeasure (a i) 1` variables when every $a_i>0$, and as zero otherwise.
The normalization map returns the zero vector if the total vanishes; prove this branch null.
Push into `EuclideanSpace ℝ ι` and prove simplex support via the pullback of `Set.range (fun p : Convexity.StdSimplex ℝ ι => p.weights)` under `EuclideanSpace.equiv`.

For positive shapes and $A=\sum_i a_i$,

```math
E[X_i]=a_i/A,\quad
\mathrm{Var}\,X_i=\frac{a_i(A-a_i)}{A^2(A+1)},\quad
\mathrm{Cov}(X_i,X_j)=-\frac{a_ia_j}{A^2(A+1)}\quad(i\ne j).
```

Give the Bochner mean, `covMatrix`, and `covarianceBilin` forms.
Surjective fibre aggregation adds shapes; surjectivity keeps every new shape positive.
With at least two coordinates, $X_i\sim\mathrm{Beta}(a_i,A-a_i)$; with one coordinate the law is $\delta_{\mathbf1}$, not Beta with zero second shape.
Include the `Fin 2` evaluation-at-zero identity.

**Chart density.** Delete coordinate $i_0$, let $`J=\{i:i\ne i_0\}`$, and reconstruct it as $1-\sum_{j\in J}x_j$.
On $x_j>0$, $\sum_jx_j<1$, use

```math
\frac{\Gamma(A)}{\prod_i\Gamma(a_i)}
\prod_{j\in J}x_j^{a_j-1}\left(1-\sum_jx_j\right)^{a_{i_0}-1},
```

zero elsewhere, with `ENNReal.ofReal` companion.
Prove that its weighted product-volume pushforward is the Dirichlet law; there is no ambient-volume density.
Bounded support gives every directional $D=\mathbb R$, but no closed-form transform (nor a renamed chart integral).

**Factorizations.** At any common $r>0$, prove the joint law
$(G/\sum G,\sum G)\sim\mathrm{Dirichlet}(a)\times\mathrm{Gamma}(A,r)$, including independence and the null zero-total branch.
On `Fin d`, $d\ge2$, independent
$V_i\sim\mathrm{Beta}(a_i,\sum_{j>i}a_j)$ for $i < d-1$ give
$X_i=V_i\prod_{j < i}(1-V_j)$ and $X_{d-1}=\prod_{j < d-1}(1-V_j)$.
Prove the inverse ratios and their independence under Dirichlet; one coordinate gives the constant one.

For $n$ iid unit uniforms, adjoin ordered endpoints $U_{(0)}=0,U_{(n+1)}=1$.
Prove that the $n+1$ spacings have Dirichlet law with shapes all one, using Layer 4's joint density and the spacing-coordinate Jacobian, not just marginal laws.
At $n=0$ the spacing is constantly one.

For at least two coordinates and real $q_i$,

```math
E\!\left[\prod_iX_i^{q_i}\right] =
\frac{\Gamma(A)}{\Gamma(A+\sum_iq_i)}\prod_i\frac{\Gamma(a_i+q_i)}{\Gamma(a_i)}
```

exactly when every $a_i+q_i>0$, with failure otherwise.
In one coordinate every such product is one for all real powers.

#### 5.7 Parameter measurability

Provide the shared parameter maps for Gaussian, multinomial, and Dirichlet, including
`Measurable fun q : EuclideanSpace ℝ ι × (ι → ι → ℝ) => multivariateGaussian q.1 (Matrix.of q.2)`.

#### 5.8 Poisson splitting and conditioning

For finite nonempty categories and $\lambda_i:\mathbb R_{\ge0}$, independent Poisson counts have Poisson total of rate $\Lambda=\sum_i\lambda_i$.
If $\Lambda>0$, conditioning on total $n$ gives multinomial weights $\lambda/\Lambda$.
Conversely, a Poisson total of rate $\Lambda\ge0$ mixed with multinomial allocation $p$ gives independent Poisson counts of rates $\Lambda p_i$.
Include zero weights/rates; impossible positive totals condition to zero.
At all-zero rates, conditioning on total zero gives $\delta_0$ without defining normalized weights.

**Checks:** `Fin 1` Gaussian is scalar Gaussian; `Fin 2` multinomial coordinates are binomial; the two-coordinate conditional mean is $m_1+\rho\sqrt{v_1/v_2}(x_2-m_2)$; identical jointly Gaussian coordinates of positive variance condition to a Dirac law; the Gamma–Dirichlet factorization reduces to Gamma–Beta; splitting retains independence for zero-rate categories.

### Layer 6: symmetric matrices and Wishart distributions

#### 6.1 Symmetric carrier and volume

Use `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`, identified with symmetric matrices by `Matrix.isHermitian_iff_isSelfAdjoint`; do not introduce `Matrix.symmetricSubmodule`.
Preserve the existing matrix product topology/uniformity and their subtype instances **definitionally**.

Install the compatible Frobenius norm through `Matrix.frobeniusNormedAddCommGroup` and `Matrix.frobeniusNormedSpace`; add `Matrix.frobeniusInnerProductSpace` with entrywise sum pairing and inherit the submodule structures.
Do not use `Matrix.toMatrixInnerProductSpace`, whose topology is not definitionally the product topology.
Supply coherent `IsUniformAddGroup`, `SecondCountableTopology`, `CompleteSpace`, `ContinuousENorm`, `MeasurableSpace`, `BorelSpace`, and inner-product `MeasureSpace` instances.
Use finite-dimensional completeness, the retained subtype Borel structure, and `measureSpaceOfInnerProductSpace` for volume.

Prove dimension $p(p+1)/2$, measurability of the positive-definite cone, and $\langle A,\Theta\rangle=\mathrm{tr}(\Theta A)$.
Read upper-triangular entries through
```lean
upperTriangle p = {ij : Fin p × Fin p // ij.1 ≤ ij.2}
symmetricCoordinates : selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)
  ≃L[ℝ] (upperTriangle p → ℝ)
```
with induced measurable equivalence.
Define `symmetricLebesgue p` by pushing product volume through its inverse, and prove measure preservation and the named `MeasureTheory.Measure.IsAddHaarMeasure` instance.

Prove `volume_symmetricMatrix_eq_smul_symmetricLebesgue`:

```math
\mathrm{volume}_{\mathrm{Frobenius}}=2^{p(p-1)/4}\,\mathrm{symmetricLebesgue}(p).
```

The exponent is **real**, implemented with `Real.rpow` and real casts before subtraction/division; coerce the positive multiplier to `ℝ≥0∞`.
At $p=0$, `symmetricLebesgue` is Dirac at the unique matrix.

Prove `symmetricLebesgue_setOf_det_eq_zero`.
Expand along a diagonal coordinate, use its at-most-one-root fibres outside a vanishing complementary minor, and apply Fubini and induction; imported polynomial-zero-locus results may replace this argument.

For `C : Matrix.GeneralLinearGroup (Fin p) ℝ`, define `symmetricCongruence C A = C*A*Cᵀ` as a continuous linear equivalence.
Its determinant is $(\det C)^{p+1}$, and its pushforward of symmetric Lebesgue measure is $|\det C|^{-(p+1)}$ times that measure.

#### 6.2 Cholesky

Use the subtype defined by `Matrix.IsLowerTriangular` and positive diagonal.
Build from `LDL.lower`/`LDL.diag`; Mathlib's `LDL.isLowerTriangular_lower` supplies lower triangularity.

Expose `choleskyEquiv` with inverse $L\mapsto LL^{\mathsf T}$, both named inverse identities, continuity, measurability, homeomorphism, and measurable equivalence; derive $A=LL^{\mathsf T}$ and uniqueness.
Keep the lower-triangular carrier's inherited subtype topology/Borel structure.
Its diagonal and strict-lower coordinates must form a homeomorphism, not define a replacement topology.

In those coordinates, prove

```math
\left|\det D(L\mapsto LL^{\mathsf T})\right|=2^p\prod_{i:\mathrm{Fin}\ p}L_{ii}^{p-i.\mathrm{val}}.
```

Prove that weighted positive-diagonal coordinate volume pushes forward to `symmetricLebesgue p` restricted to the positive-definite cone.
Both multivariate Gamma and Bartlett use this exact Jacobian.
No Cholesky value outside the positive-definite subtype is required; `Fin p` fixes the ordering.

#### 6.3 Multivariate Gamma

Define `multivariateGamma p a` by

```math
\Gamma_p(a)=\pi^{p(p-1)/4}\prod_{i:\mathrm{Fin}\ p}\Gamma(a-i.\mathrm{val}/2).
```

Again use real casts and `Real.rpow`, not natural division.
For $p>0$, $a>(p-1)/2$, prove via Cholesky

```math
\int_{A\succ0}(\det A)^{a-(p+1)/2}e^{-\mathrm{tr}\,A}\,d\mathrm{symmetricLebesgue}(p)=\Gamma_p(a).
```

For $p=0$, prove the identity for every $a$; both sides are $1$.

#### 6.4 Wishart laws

All matrix expressions refer to the underlying matrix of the bundled symmetric value.
Write $S_s$ for PSD/PD $S$ bundled into that carrier.
Transform arguments $\Theta$ are bundled symmetric matrices, not raw matrices with an extra symmetry hypothesis.

**Nonsingular real degrees.** For $n:\mathbb R$, $S\succ0$, $n>p-1$, define `nonsingularWishartMeasure n S` relative to `symmetricLebesgue p` by

```math
f(A)=\frac{(\det A)^{(n-p-1)/2}e^{-\mathrm{tr}(S^{-1}A)/2}}
{2^{np/2}(\det S)^{n/2}\Gamma_p(n/2)}\quad(A\succ0),
```

zero off the cone.
Invalid parameters give zero measure.
Every exponent uses `Real.rpow` with dimensions cast to `ℝ`.
Use this same definition at $p=0$: for $n>-1$ it is Dirac because the density and empty normalizers are one.

Prove probability, mean $nS_s$, and

```math
\mathrm{Cov}(A_{ij},A_{kl})=n(S_{ik}S_{jl}+S_{il}S_{jk}).
```

At fixed valid $S$, convolution adds degrees provided $n_1,n_2,n_1+n_2>p-1$; the sum condition matters at $p=0$.

For $M:\mathrm{Matrix}\ (\mathrm{Fin}\ q)\ (\mathrm{Fin}\ p)\ \mathbb R$ with rank $q$, congruence gives $W(n,MSM^{\mathsf T})$.
Include invertible congruences and principal blocks; use the Sylvester determinant identity between $(M^{\mathsf T}\Theta M)S$ and $\Theta(MSM^{\mathsf T})$ in the transform proof.
Rank-deficient images remain explicit pushforwards; at natural degrees in the overlap, identify them by the Gaussian-Gram theorem.
Under the canonical `Fin 1` coordinate equivalence, $W(n,\sigma^2)$ is $\sigma^2\chi_n^2$ for $n,\sigma^2>0$.

**Shared transforms and proof route.** Put $`B=\sqrt S\,\Theta\sqrt S`$ and prove its Hermitian property in a named lemma from $S\succeq0$; callers need not supply another proof.
For the real-degree law,

```math
D_\Theta=\{t:I-2tB\succ0\},\quad
M_\Theta(t)=\det(I-2t\Theta S)^{-n/2},\quad
K_\Theta(t)=-\tfrac n2\log\det(I-2t\Theta S).
```

Retain the named `mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff`, `mgf_trace_mul_nonsingularWishartMeasure`, and `cgf_trace_mul_nonsingularWishartMeasure`.
For $\Theta\succeq0$, give the $t=-1$ cone-Laplace specialization.
If $\lambda_j$ are the eigenvalues of $B$,

```math
\mathrm{charFun}(\mu)(\Theta)=\exp\!\left(-\tfrac n2\sum_j\mathrm{Log}(1-2i\lambda_j)\right).
```

Keep the **eigenvalue-wise principal logarithms**, not a principal power of the determinant ([branch issue](https://arxiv.org/abs/1901.09347)).
Factor a reusable analytic-continuation lemma for a real statistic with mgf $\prod_j(1-2t\lambda_j)^{-a_j}$ on its natural domain: use `analyticOnNhd_complexMGF` on the vertical strip, agreement on its real interval, and evaluation at $i$ through the trace pairing.

Derive both Wishart families' mean/covariance from trace mgfs near zero using `deriv_mgf_zero`, `iteratedDeriv_mgf_zero`, and polarization with $(\mathrm{Matrix.single}\ i\ j\ 1+\mathrm{Matrix.single}\ j\ i\ 1)/2$.
This must cover Gaussian-Gram degrees below $p$ as well.

**Natural-degree Gaussian-Gram.** Define `wishartGramMeasure ν S`, $\nu:\mathbb N$, by pushing `Measure.pi (fun _ : Fin ν => multivariateGaussian 0 S)` through the bundled sum of outer products.
Do not branch on $S$: invalid covariance and $\nu=0$ give $\delta_0$.
Prove probability, the iid-Gram `HasLaw` statement, and almost-sure positive semidefiniteness for **every** $S$.

For $S\succeq0$, prove exact almost-sure rank $\min(\nu,\mathrm{rank}\,S)$ and its upper-bound corollary; reduce to the range of $S$ and prove almost-sure maximal rank of rectangular standard-Gaussian matrices by the minor/polynomial null-set argument.
For arbitrary rectangular $M$, prove congruence sends this law to `wishartGramMeasure ν (M*S*Mᵀ)`, retaining PSD of $S$: a projection can carry a non-PSD scale to a PSD one, so the Dirac fallback does not respect arbitrary congruences.
For every $S$, convolution adds natural degrees, by splitting the product over `Fin (ν₁+ν₂) ≃ Fin ν₁ ⊕ Fin ν₂`.

For PSD $S$ and $\nu>0$, `mem_integrableExpSet_trace_mul_wishartGramMeasure_iff` gives the same exact trace domain $D_\Theta$.
On that domain, `mgf_trace_mul_wishartGramMeasure` and `cgf_trace_mul_wishartGramMeasure` give the preceding formulas with $n=\nu$ for every $\nu$; prove them from Layer 5 quadratic forms and `iIndepFun.mgf_sum`.
Require `charFun_wishartGramMeasure` with the same spectral formula through the shared continuation lemma, the cone-Laplace specialization, and mean/covariance with $n=\nu$.
At $\nu=0$, separately give $D=\mathbb R$, $M=1$, $K=0$ for every $S,\Theta$.

For $S\succ0$, $p\le\nu$, identify the two laws using `Measure.ext_of_charFun` and deduce the nonsingular-law Gram-sum `HasLaw` corollary.
For PSD $S$ with $\min(\nu,\mathrm{rank}\,S) < p$, prove singularity relative to symmetric Lebesgue measure using the determinant-null set.

#### 6.5 Bartlett decomposition

For real $n>p-1$, lift $W(n,I)$ to the positive-definite subtype by `.comap Subtype.val`, then apply Cholesky.
Prove the lift maps back to $W(n,I)$ using `map_comap_subtype_coe` and null complement of the cone.
Give both a product-law equality and one joint `iIndepFun` theorem:

```math
T_{ii}^2\sim\chi^2_{n-i.\mathrm{val}},\qquad T_{ij}\sim N(0,1)\ (j < i),
```

with all diagonal-square and strict-lower entries independent.
Degrees are real, indices zero-based.

#### 6.6 Inverse-Wishart

Define `inverseWishartMeasure n S` as `nonsingularWishartMeasure n S⁻¹` pushed through symmetric inversion, retaining Mathlib's zero inverse on singular matrices.
Valid source laws give that set zero mass; invalid parameters give zero measure as for Wishart.

Prove inversion sends positive-cone symmetric Lebesgue measure to itself weighted by $(\det B)^{-(p+1)}$.
For $S\succ0$, $n>p-1$, derive

```math
f(A)=\frac{(\det S)^{n/2}(\det A)^{-(n+p+1)/2}e^{-\mathrm{tr}(SA^{-1})/2}}
{2^{np/2}\Gamma_p(n/2)}\quad(A\succ0).
```

For $p>0$, mean $S_s/(n-p-1)$ exists exactly when $n>p+1$ within the valid family; prove non-integrability of `id` otherwise.
At $p=0$, every valid $n>-1$ gives Dirac at zero, integrable with mean zero.

#### 6.7 Parameter measurability

For all three laws, prove joint degree/scale measurability with scale in `Fin p → Fin p → ℝ` through `Matrix.of`, and with scale in the Borel symmetric carrier.
Use real degree for the density laws and natural degree for Gaussian-Gram.

#### 6.8 Real-degree Schur complements and inverse-Wishart marginals

For $p>0$, $S\succ0$, $n>p-1$, and $W\sim W(n,S^{-1})$, prove

```math
((W^{-1})_{ii})^{-1}\sim S_{ii}^{-1}\chi^2_{n-p+1},\qquad
(\mathrm{IW}(n,S))_{ii}\sim\mathrm{InverseGamma}\!\left(\frac{n-p+1}{2},\frac{S_{ii}}2\right).
```

Supply permutation, congruence, block-inverse, and scalar Schur-complement bridges.
Move coordinate $i$ last and apply real-degree Bartlett to its final diagonal square; the block inverse of $S^{-1}$ identifies scale $S_{ii}^{-1}$.
No separate block normalization integral is required.
At $p=1$, the complementary block is empty and the scalar identities apply.

**Checks:** topology/uniformity and induced topology are definitionally the retained subtype instances for symmetric and positive-diagonal lower-triangular carriers; the `1×1` Gram law is $\sigma^2\chi_\nu^2$ including $\sigma^2=0$ and $\nu=0$; the two Wishart families' transforms literally agree on the overlap; $\Gamma_1(a)=\Gamma(a)$; Bartlett's final square has degree $n-p+1$ for nonintegral degrees too.

### Layer 7: affine laws, quantiles, and distribution constructions

This layer applies to every valid probability law, including Layers 0–6.
Write $F(x-)=\mu.\mathrm{real}(\mathrm{Iio}\ x)$.

#### 7.1 Affine transport

For $\mu.\mathrm{map}(x\mapsto a+bx)$, prove probability, joint measurability in $(\mu,a,b)$, composition, `HasLaw` transport, and the Dirac image at $b=0$.
For $b\ne0$, transport density by $|b|^{-1}f((x-a)/b)$ with `HasPDF`/`rnDeriv`.
The cdf is $F((x-a)/b)$ for $b>0$ and $1-F(((x-a)/b)-)$ for $b<0$.

Transport integrability, mean, variance, and every natural raw/central moment under the corresponding absolute-moment hypotheses.
Prove

```math
M_{a+bX}(t)=e^{at}M_X(bt),\quad
\varphi_{a+bX}(t)=e^{iat}\varphi_X(bt),\quad
D_{a+bX}=\{t:bt\in D_X\},\quad K_{a+bX}(t)=at+K_X(bt)\ (t\in D).
```

Specialize to every scalar family.
Only the following named parameter changes are required; other images stay explicit pushforwards.
All rows assume valid input parameters and leave unmentioned parameters unchanged.

| Family | Parameters of $a+bX$ |
| --- | --- |
| Gaussian $(m,v)$ | $(a+bm,b^2v)$, all $b$ |
| Cauchy $(m,\gamma)$ | $(a+bm,\lvert b\rvert\gamma)$, all $b$ |
| Generalized normal $(m,s,p)$ | $(a+bm,\lvert b\rvert s,p)$, $b\ne0$ |
| Asymmetric Laplace $(m,l,r)$ | Location $a+bm$; rates $(l/b,r/b)$ for $b>0$, exchanged rates $(r/\lvert b\rvert,l/\lvert b\rvert)$ for $b<0$ |
| Laplace/logistic $(m,s)$ | $(a+bm,\lvert b\rvert s)$, $b\ne0$ |
| Interval uniform | Affine endpoints, reversed for $b<0$; endpoint conventions agree as measures |
| Triangular $(l,r,c)$ | Sorted transformed endpoints and mode $a+bc$, $b\ne0$ |
| Gumbel/GEV $(m,s,\xi)$ | $(a+bm,bs,\xi)$, $b>0$ |
| Lévy $(m,c)$ | $(a+bm,bc)$, $b>0$ |
| Skew-normal $(m,s,\alpha)$ | $(a+bm,\lvert b\rvert s,\mathrm{sign}(b)\alpha)$, $b\ne0$ |
| Truncated Gaussian | Transform Gaussian parameters and interval; reverse endpoints and inclusion flags for $b<0$ |

For $b<0$, maximum-Gumbel, GEV, and Lévy use their reflected laws.
At $b=0$, keep the Dirac image rather than extending a family's scale domain just to name it.

| Family | Parameters under $bX$, $b>0$ |
| --- | --- |
| Exponential/Gamma rate $r$ | $r/b$ |
| Inverse-gamma $(k,r)$ | $(k,br)$ |
| Weibull scale $s$; Pareto threshold $t$ | $bs$; $bt$ |
| Log-normal $(m,v)$ | $(m+\log b,v)$ |
| Chi/noncentral chi; generalized gamma; half-t | Scale multiplied by $b$ |
| Rice $(\nu,s)$; folded normal $(m,s)$ | $(b\nu,bs)$; $(bm,bs)$ |
| Log-uniform $(l,r)$ | $(bl,br)$ |
| Nakagami $(m,\Omega)$ | $(m,b^2\Omega)$ |
| GPD; log-logistic | Scale multiplied by $b$ |
| Inverse Gaussian $(\mu,\lambda)$ | $(b\mu,b\lambda)$ |
| Gompertz rate $r$ | $r/b$ |

Include Beta reflection $1-X\sim\mathrm{Beta}(b,a)$ and Student-t reflection; noncentral-t reflection negates its noncentrality.
Affine pushforward commutes with atom mixtures, truncation of the transformed event for $b\ne0$, and independent sums with accumulated translation.
Compound-Poisson jump transport concerns linear scaling only; translation remains an outer pushforward.

For discrete laws use real casts for arbitrary real affine maps.
On `ℤ`, integer translations shift uniform endpoints and Laplace/Gaussian centers; reflection negates/reverses endpoints or negates centers, and exchanges Skellam rates.
On `ℕ`, use natural translations and reflect only after casting, except the support-justified complements
$n-X\sim\mathrm{Bin}(n,1-p)$, $\mathrm{BetaBin}(n,b,a)$, and $\mathrm{Hypergeom}(N,N-K,n)$.

#### 7.2 Lower and upper quantiles

Reuse `Measure.quantile`, $`Q_\mu(u)=\inf\{x:u\le F(x)\}`$, and add `upperQuantile`, $`Q_\mu^+(u)=\inf\{x:u < F(x)\}`$.
Theorems about finite quantiles require $0 < u<1$; outside it retain ordinary `sInf` totalization.

Reuse `nonempty_setOf_le_cdf`, `bddBelow_setOf_le_cdf`, `monotoneOn_quantile`, `measurable_quantile`, and `quantile_le_iff`.
Prove upper counterparts, including the bounds needed for conditional completeness, and lower-quantile left continuity.
Prove
$F(Q(u)-)\le u\le F(Q(u))$, but retain the adjunction as the characterization: these inequalities alone allow ambiguity on flat cdf intervals.
Give the upper quantile's strict-level characterizations.
Continuous $F$ gives $F(Q(u))=u$; strict increase on its support interval gives uniqueness there.

Prove joint Giry measurability in $(\mu,u)$ for probability laws and interior levels, with the parameterized-family corollary.
Reuse `map_quantile_volume_Ioo`/`measurePreserving_quantile` to prove `(uniformMeasure 0 1).map Qμ = μ`; prove the probability integral transform for atomless laws.
In `EReal`, the one-sided limits at $0,1$ are the infimum/supremum of topological support, including infinite endpoints.

**Transport.** For $0 < u<1$,

```math
Q_{a+bX}(u)=\begin{cases}a+bQ_X(u)&b>0,\\a&b=0,\\a+bQ_X^+(1-u)&b<0.\end{cases}
```

Prove the upper versions.
For continuous nondecreasing $g:\mathbb R\to\mathbb R$, prove $Q_{g(X)}=g\circ Q_X$, also when those hypotheses hold only on a full-mass interval containing the interior quantiles.
Give the continuous strictly decreasing interval version using $Q_X^+(1-u)$, replacing it by $Q_X$ only when equality is proved.
Specialize to exponential, logarithm, positive powers, square root, and reciprocal on the positive half-line.
Native `ℕ`/`ℤ` laws give least-integer cumulative crossings, including finite support; other carriers use only their named scalar observables.

#### 7.3 Conditioning and interval truncation

For measurable $A$ with $0<\mu(A)<\infty$, prove probability, density/mass, integration, and parameter measurability for `cond μ A`.
Use measurable incidence sets for parameterized events, including the four interval conventions and $`\{0\}^{\mathrm c}`$.
Zero event mass gives zero measure.

For probability $\mu$ truncated to $(l,r]$, with possibly infinite bounds, let $L=\mu.\mathrm{real}(\mathrm{Iic}\ l)$, $R=\mu.\mathrm{real}(\mathrm{Iic}\ r)$, using $0,1$ at infinite endpoints.
For $L < R$,

```math
F_{\mathrm{cond}}(x)=\frac{\min(R,\max(L,F(x)))-L}{R-L},\qquad Q_{\mathrm{cond}}(u)=Q_\mu(L+u(R-L)).
```

For the other three endpoint conventions replace excluded lower and retained upper masses by the appropriate `Iio`/`Iic` values.
Keep finite-endpoint atoms; prove all conventions agree for atomless laws.

#### 7.4 Atoms and general mixtures

For probability $\mu$ on a measurable carrier with measurable singletons and $w\in[0,1]$, use `atomMixture` $w\delta_c+(1-w)\mu$ with `ℝ≥0∞` coefficients.
Prove masses, measurability, mean/variance, mgf linearity on its domain, and characteristic-function linearity; on `ℝ`, give the atomic/continuous decomposition when applicable and

```math
F_w(x)=w\mathbf1_{c\le x}+(1-w)F(x).
```

Use this cdf for the general quantile adjunction.
If $\mu$ is supported on $[0,\infty)$ and $c=0$, the quantile is zero up to $`w+(1-w)\mu\{0\}`$ and is $Q_\mu((u-w)/(1-w))$ above it for $w<1$; at $w=1$ it is constantly zero.

**Mixture API.** For probability $\rho$ and measurable `K : α → Measure β` with probability components $\rho$-almost everywhere, prove density/mass mixture theorems under corresponding a.e. component hypotheses, iterated integration, real mixture cdf, and characteristic-function linearity.
Reuse `MeasureTheory.isProbabilityMeasure_bind` and `Measure.bind_congr_right`; values on mixing-null sets need no artificial probability extension.
Under joint absolute first/second moment hypotheses, give $E[X]=E_\rho[m]$ and total covariance

```math
\mathrm{Cov}(X)=E_\rho[\mathrm{Cov}_{K}(X)]+\mathrm{Cov}_\rho(m),\qquad m(a)=E_{K(a)}X,
```

with the Markov-kernel form as a corollary.
Exponential integrability is equivalent to finiteness of the iterated **nonnegative extended-real** exponential integral; only then pass to real mgfs/cgfs.
The cgf is a logarithm of a weighted mgf sum, not a mixture of cgfs.

**Applications.** Finite mixtures have domain equal to the intersection over positive-weight components.
Include scalar/multivariate Gaussian mixtures with their component densities and scalar mixture-cdf quantile adjunctions.
Arbitrary mixtures/jump laws may have singular continuous components.

Include zero-inflated and zero-truncated Poisson and negative binomial, with explicit masses, cdfs, quantiles, means, variances, and exact domains.
Treat boundaries where truncation removes all mass.
Hurdle versions mix mass $w$ at zero with the zero-truncated base: positive masses are $`(1-w)\mu\{k\}/(1-\mu\{0\})`$ when the base has positive nonzero mass.
Derive cdfs, quantile rescaling, moments, and domains.
At $w=1$ use $\delta_0$ even if the truncated base is zero; exclude zero-base cases from other probability claims.

#### 7.5 Compound Poisson

On a measurable additive monoid with measurable addition, define convolution powers by $\mu^{*0}=\delta_0$ and
`compoundPoissonMeasure λ μ = (poissonMeasure λ).bind (fun n => μ ^∗ n)` for $\lambda:\mathbb R_{\ge0}$ and probability $\mu$.
Prove measurability in $\mu$, addition of powers, independent-sum `HasLaw`, probability and joint parameter measurability, rate-zero/zero-jump laws, and convolution by adding rates at fixed jump law.

For finite-dimensional real inner product spaces,

```math
\varphi_{\mathrm{CP}}=\exp(\lambda(\varphi_\mu-1)),\quad
E[\mathrm{CP}]=\lambda E[X],\quad \mathrm{Cov}(\mathrm{CP})=\lambda E[XX^{\mathsf T}],
```

under the respective moment hypotheses; scalar variance is $\lambda E[X^2]$.
For measurable real additive observables, prove $M_{\mathrm{CP}}(t)=\exp(\lambda(M_\mu(t)-1))$ and $K_{\mathrm{CP}}(t)=\lambda(M_\mu(t)-1)$ on their domain, including linear-functional cases.
At $\lambda>0$ the domain equals the jump domain; at zero it is `ℝ`.
For real jumps, give the Poisson-weighted cdf series including the empty-sum atom and its quantile adjunction, not a general density.
Native `ℕ`/`ℤ` jumps get mass series and cast bridges.

#### 7.6 Mixed Poisson

For probability $\rho$ on `ℝ≥0`, define `mixedPoissonMeasure ρ = ρ.bind poissonMeasure`.
Prove measurability, masses $E[e^{-\Lambda}\Lambda^k/k!]$, cumulative series, least-crossing quantiles, and Dirac-mixing specialization.
Under the relevant first, second, or $k$th moment hypotheses,

```math
E[N]=E[\Lambda],\quad \mathrm{Var}\,N=E[\Lambda]+\mathrm{Var}\,\Lambda,\quad E[(N)_k]=E[\Lambda^k].
```

Prove equivalence of factorial-moment finiteness using nonnegative extended integrals first.
For $0\le z\le1$, pgf $=E[e^{\Lambda(z-1)}]$; substitute $z=e^t$ for the mgf on its exact domain
$`\{t:e^t-1\in\mathrm{integrableExpSet}(\lambda\mapsto(\lambda:\mathbb R),\rho)\}`$.
Recover Gamma mixing with an explicit nonnegative-carrier bridge.

#### 7.7 Folding and censoring

For $|X|$, prove cdf $F(x)-F((-x)-)$ on $x\ge0$ (zero below), atom $`\mu\{0\}`$ at zero, and density $f(x)+f(-x)$ on $x>0$ when $\mu$ has a density.
For symmetric atomless laws, identify folding with conditioning to the nonnegative half-line and prove $Q_{|X|}(u)=Q_\mu((1+u)/2)$.

Clipping by $g(x)=\min(r,\max(l,x))$, $l < r$ finite, gives atoms $\mu(\mathrm{Iic}\ l)$ at $l$ and $\mu(\mathrm{Ici}\ r)$ at $r$, plus $\mu$ restricted to $(l,r)$.
Its cdf is $0$ below $l$, $F(x)$ on $[l,r)$, and $1$ above; its quantile is $g(Q_\mu(u))$.
Include one-sided clipping, first/second-moment decompositions, and all bounded moments/full domain for finite clipping.
Keep this pushforward distinct from conditional truncation.

#### 7.8 Exponential tilting

Reuse `Measure.tilted` normalization, density, composition, and cumulant derivatives on their stated domains.
Prove parameter measurability and $M_t(s)=M(t+s)/M(t)$ when both exponential integrals are finite.
Required parameter identities: Gaussian $(m,v)\mapsto(m+vt,v)$; Gamma $(a,r)\mapsto(a,r-t)$ for $t < r$; native Poisson $\lambda\mapsto\lambda e^t$; native binomial $p\mapsto pe^t/(1-p+pe^t)$.
Include Gaussian/Poisson/binomial probability boundaries.
Layer 12 specializes vector tilting on spheres.

#### 7.9 Survival and hazard

Use survival $S=1-F$, hazard $h=f/S$, and cumulative hazard $H=-\log S$ on $`\{S>0\}`$; retain ordinary division/log totalization elsewhere without asserting hazard identities there.
On intervals with continuous density and positive survival, prove $H'=h$.
For nonnegative atomless laws, before the support endpoint,

```math
S(x)=\exp\!\left(-\int_0^x h(t)\,dt\right).
```

Independent minima add hazards and cumulative hazards on their common positive-survival interval.
Instantiate exponential, Weibull, Gamma, and log-normal using the declared densities/cdfs.

#### 7.10 Quantile construction of order statistics

For $1\le k\le n$, prove that applying $Q_\mu$ to the kth uniform order statistic gives the kth statistic from iid law $\mu$: its law is `(betaMeasure k (n+1-k)).map Qμ`.
Sort the quantile-transformed sample; monotonicity suffices, including atoms and discontinuous quantiles.
Layer 13 gives its scalar quantile formula.

#### 7.11 Weak continuity

Work in `ProbabilityMeasure` on each stated valid parameter domain.
Prove joint weak continuity for:

| Families | Domain and boundaries |
| --- | --- |
| Multivariate Gaussian and scalar Gaussian, scalar/multivariate log-normal, logit-normal, simplex logistic-normal, matrix normal, proper complex Gaussian | Valid covariance domains, including PSD singular/zero covariance; fix the category type/reference coordinate for logistic-normal |
| Cauchy | Location and nonnegative scale |
| Gamma, Beta, Dirichlet | Positive shapes/rates |
| Finite categorical/multinomial | Fixed index type; full simplex of weights |
| Chi-squared; negative binomial | Nonnegative degrees; $r\ge0,0 < p\le1$ |
| Noncentral chi-squared; noncentral Beta | Nonnegative degrees/noncentrality; $a\ge0,b>0,\lambda\ge0$, including atomic/Dirac boundaries |
| Hypoexponential; hyperexponential | Fixed finite types; positive rates including coincidences; positive active rates with arbitrary inactive rates |

Prove preservation under fixed continuous pushforwards, continuous affine transport, finite products, and finite mixtures with convergent simplex weights.
Use Gaussian inheritance and Cauchy affine transport.
Keep the separate GEV shape-zero, t-to-Gaussian, and stable limits in their entries.
Do not require total-variation continuity at singular boundaries or weak continuity across invalid zero-measure branches or geometric $p=0$ totalization.

**Checks:** negative-scale quantiles on a two-atom law need the upper quantile; Dirac boundaries have constant interior quantiles and correct affine images; clipped Gaussian laws have endpoint atoms whereas conditional truncations are atomless; order statistics recover extrema at $k=1,n$ even for atomic sources.

### Layer 8: special functions for the expanded families

#### 8.1 Modified Bessel I

Provide `Real.besselI (ν x : ℝ) : ℝ`, denoted $I_\nu(x)$, with the real-order, nonnegative-argument theory below.
Use the regularized hypergeometric representation compatible with the referenced `Complex.besselI` proposal.
Reuse the complex function when available; implementing it or developing a general complex-order/complex-argument API is not required.
On $\nu>-1,x>0$,

```math
I_\nu(x)=\sum_{j\ge0}\frac{(x/2)^{2j+\nu}}{j!\Gamma(j+\nu+1)}.
```

Prove convergence, positivity, joint continuity/measurability, $I_\nu'=I_{\nu+1}+(\nu/x)I_\nu$, and the adjacent-order recurrence.
Nonnegative integer orders extend continuously to $I_0(0)=1$, $I_n(0)=0$ for $n>0$; orders in $(-1,0)$ instead get right asymptotics.
For integer $n\ge0$, $\kappa\ge0$,

```math
I_n(\kappa)=\frac1{2\pi}\int_{-\pi}^{\pi}e^{\kappa\cos\theta}\cos(n\theta)\,d\theta.
```

Prove Layer 12's sphere integral too.
Density formulas involving $I_{k/2-1}$ use positive arguments, with null endpoints fixed separately.
Bessel K and its inverse-gamma/t transforms are excluded.

#### 8.2 Owen's T

Define `owensT h a` by the oriented integral

```math
T(h,a)=\frac1{2\pi}\int_0^a\frac{e^{-h^2(1+t^2)/2}}{1+t^2}\,dt.
```

Prove joint continuity/measurability, evenness in $h$, oddness in $a$, $T(0,a)=\arctan(a)/(2\pi)$, and

```math
\partial_hT=-\phi(h)(\Phi(ah)-1/2),\qquad
\partial_aT=\frac{e^{-h^2(1+a^2)/2}}{2\pi(1+a^2)}.
```

Prove the Gaussian integral identity making $\Phi(x)-2T(x,\alpha)$ the skew-normal cdf, its limits, and derivative $2\phi(x)\Phi(\alpha x)$.

#### 8.3 Zeta and Gaussian lattice sums

For $s>1$, identify $\sum_{n\ge0}(n+1)^{-s}$ with the real value of `riemannZeta s`; prove positivity, finiteness, measurability, and the shifted-exponent convergence/divergence tests for Zipf moments.

For $c\in\mathbb R,s>0$, define

```math
Z(c,s)=\sum_{n\in\mathbb Z}e^{-(n-c)^2/(2s^2)}.
```

Prove positivity/finiteness, smoothness, integer-translation and reflection identities, and termwise differentiation with polynomial weights.
Prove

```math
Z(c,s)=e^{-c^2/(2s^2)}\mathrm{Re}\,\left(\mathrm{jacobiTheta}_2\!\left(\frac{-ic}{2\pi s^2},\frac{i}{2\pi s^2}\right)\right),
```

using Mathlib's two-variable `jacobiTheta₂`.
Reuse theta/Poisson summation for the periodized Gaussian identity and locally uniform density/Fourier-series convergence needed in Layer 12.

#### 8.4 Inverse functions

For $a>0$, $0 < u<1$, define $G_a^{-1}(u)$ as the unique positive root of $G_a(x)=u$; for $a,b>0$, define $B_{a,b}^{-1}(u)$ as the unique root of $I_x(a,b)=u$ in $(0,1)$.
Prove existence, uniqueness, inverse identities, strict monotonicity, continuity, joint parameter measurability, and endpoint limits.
Define zero outside those parameter domains and prove measurability of the totalized functions.
Obtain $`z(u)=\sqrt2\,\mathrm{erf}^{-1}(2u-1)`$ using the inverse on $(-1,1)$.
Reuse existing inverse APIs, or construct them from Layer 2's regularity and limits.

**Checks:** the circle integral has the correct zero-concentration Bessel values; lattice and theta expressions agree in normalization/translation, and periodized density and Fourier series integrate equally over one period.

### Layer 9: finite, mixed, and integer-valued discrete families

All scalar discrete entries require cumulative sums, cast-law least-crossing quantiles, and support-endpoint limits.
Finite support additionally requires all natural moments as finite sums, $D=\mathbb R$, native `ℕ` pgf where applicable, and finite-sum or specified-product mgf/characteristic formulas.
Integer differences are taken in `ℤ`, never truncated subtraction in `ℕ`.

#### 9.1 Finite uniform and categorical

Reuse `uniformOn Set.univ` on nonempty finite discrete types and `uniformOn` on nonempty finite subsets.
Prove uniform masses, finite-sum integration, bijective pushforward, and equality to existing `PMF.uniformOfFintype`/`PMF.uniformOfFinset` measures.
Define `categoricalMeasure p = ∑ i, (p.weights i : ℝ≥0∞) • dirac i` for `p : Convexity.StdSimplex ℝ≥0 ι` with its finite-coordinate measurable structure.
Prove arbitrary finite aggregation and one-hot pushforward to multinomial with one trial.
Numerical moments/quantiles use supplied labels, not an order on categories.

Rademacher has equal mass at $-1,1$, mean zero, variance one, $M(t)=\cosh t$, $\varphi(t)=\cos t$.
For integer interval $a\le b$, $N=b-a+1$, use mass $1/N$ on $[a,b]$ and zero measure for $b < a$.
Prove mean $(a+b)/2$, variance $(N^2-1)/12$, quantile $a+\lceil Nu\rceil-1$, finite-geometric-sum mgf with $t=0$ separate, and the pgf after translation to $`\{0,\ldots,N-1\}`$.

#### 9.2 Beta-binomial and Dirichlet-multinomial

For $n\in\mathbb N$, $a,b>0$, mix `binomial n p` against Beta, with an everywhere measurable kernel extension agreeing on $[0,1]$.
Invalid shapes give zero; $n=0$ with valid shapes gives $\delta_0$.
For $0\le k\le n$,

```math
p_k=\binom nk\frac{B(k+a,n-k+b)}{B(a,b)},\qquad
E[X]=np,\quad\mathrm{Var}\,X=np(1-p)\frac{A+n}{A+1},\quad A=a+b,\ p=a/A.
```

For finite nonempty categories, mix multinomial against Dirichlet via a measurable simplex-parameter map, independent of its off-simplex choice.
For $\alpha_i>0$, $A=\sum_i\alpha_i$, $\sum_i k_i=n$,

```math
p_k=\frac{n!}{\prod_i k_i!}\frac{\Gamma(A)}{\Gamma(A+n)}\prod_i\frac{\Gamma(\alpha_i+k_i)}{\Gamma(\alpha_i)}.
```

Mass is zero off support or at invalid shapes.
Prove mean $np$, covariance $n(A+n)(\mathrm{diag}\,p-pp^{\mathsf T})/(A+1)$, $p_i=\alpha_i/A$, aggregation, and Beta-binomial marginals for at least two categories; one category is Dirac.
Give finite-sum vector characteristic functions and directional mgfs.

#### 9.3 Sampling without replacement

For $K_i\in\mathbb N$, $N=\sum_iK_i$, $n\le N$, define multivariate hypergeometric mass
$\prod_i\binom{K_i}{k_i}/\binom Nn$ on $\sum_i k_i=n$, $k_i\le K_i$; otherwise zero, with zero law if $n>N$.
Prove aggregation, scalar hypergeometric marginals, mean $np$, and covariance
$n(N-n)(\mathrm{diag}\,p-pp^{\mathsf T})/(N-1)$ for $N>1$, $p_i=K_i/N$.
Handle $N=0,1$ by their Dirac laws.

Negative hypergeometric counts failures before the $r$th success in a population $N$ with $K$ successes.
For $1\le r\le K\le N$, $0\le k\le N-K$,

```math
p_k=\frac{\binom{k+r-1}{k}\binom{N-r-k}{K-r}}{\binom NK},\quad
E[X]=\frac{r(N-K)}{K+1},\quad
\mathrm{Var}\,X=\frac{r(N+1)(N-K)(K-r+1)}{(K+1)^2(K+2)}.
```

At $r=0,K\le N$ use $\delta_0$; other invalid parameters give zero.
Prove the labeled-uniform-permutation construction and cdf relation to the hypergeometric count in the first $k+r$ draws, with support cases.

#### 9.4 Poisson-binomial

Define the native sum of independent Bernoulli variables with $p_i\in[0,1]$.
Its mass at $k$ sums
$\prod_{i\in S}p_i\prod_{i\notin S}(1-p_i)$ over subsets of size $k$.
Prove pgf $\prod_i(1-p_i+p_i z)$, mean $\sum_i p_i$, variance $\sum_i p_i(1-p_i)$, corresponding mgf/characteristic products, and adjoining-one-trial recursion.
Empty families give $\delta_0$; constant parameters recover binomial.
This owns the non-identical Bernoulli-sum theorem.

#### 9.5 Skellam

For $\lambda_1,\lambda_2:\mathbb R_{\ge0}$, define the integer difference of independent Poissons.
For $k\ge0$,

```math
p_k=e^{-\lambda_1-\lambda_2}\sum_{j\ge0}\frac{\lambda_1^{j+k}\lambda_2^j}{(j+k)!j!};
```

negative masses exchange rates.
Prove convergence, mean $\lambda_1-\lambda_2$, variance $\lambda_1+\lambda_2$, $D=\mathbb R$, and $M(t)=\exp(\lambda_1(e^t-1)+\lambda_2(e^{-t}-1))$ with its characteristic counterpart.
Include zero rates, reflection, convolution adding both rates, and the absolutely convergent cumulative series over integers.
No Bessel mass formula.

#### 9.6 Zipf/zeta and finite Zipf

For $s>1$, use mass $k^{-s}/\zeta(s)$ on positive integers, zero at zero; for $s\le1$ use zero measure.
Prove $E[X^n]=\zeta(s-n)/\zeta(s)$ exactly when $n < s-1$, including mean/variance thresholds, and $D=(-\infty,0]$.

For $N\ge1$, any real $s$, normalize $k^{-s}$ on $1\le k\le N$; use zero law at $N=0$.
Prove total-variation convergence to infinite Zipf for $s>1$.
Both cdfs are partial sums and quantiles are their least crossings.

#### 9.7 Yule–Simon and logarithmic series

For $\rho>0$, Yule–Simon has mass $\rho B(k,\rho+1)$ on positive integers; invalid $\rho$ gives zero.
Prove

```math
P(X>k)=kB(k,\rho+1)\ (k\ge1),\quad P(X>0)=1,\quad
E[X]=\frac\rho{\rho-1}\ (\rho>1),\quad
\mathrm{Var}\,X=\frac{\rho^2}{(\rho-1)^2(\rho-2)}\ (\rho>2).
```

The exact absolute natural-moment threshold is $n<\rho$, and $D=(-\infty,0]$.

For $0 < q<1$, logarithmic series has mass $-q^k/(k\log(1-q))$ on positive integers; otherwise zero law.
Its pgf is $\log(1-qz)/\log(1-q)$ exactly on $|qz|<1$, and

```math
E[X]=\frac{-q}{(1-q)\log(1-q)},\quad
\mathrm{Var}\,X=\frac{-q(q+\log(1-q))}{(1-q)^2\log(1-q)^2},\quad D=(-\infty,-\log q).
```

Obtain the mgf from the pgf and the characteristic function using the principal logarithm, justified by $\mathrm{Re}(1-qe^{it})>0$.
Compound-Poisson logarithmic jumps at rate $-r\log(1-q)$ give negative binomial $(r,1-q)$ for every $r\ge0$.

#### 9.8 Discrete Laplace and Gaussian

For integer center $m$, $0\le q<1$, discrete Laplace has mass $(1-q)q^{|k-m|}/(1+q)$; $q=0$ means $\delta_m$, invalid $q$ means zero measure.
Prove mean $m$, variance $2q/(1-q)^2$, and for $0 < q<1$,

```math
M(t)=\frac{e^{mt}(1-q)^2}{(1-qe^t)(1-qe^{-t})},\quad D=\{t:|t|<-\log q\}.
```

Give the characteristic counterpart and integer cdf $q^{m-k}/(1+q)$ for $k < m$, otherwise $1-q^{k-m+1}/(1+q)$.
Use integer floor for real arguments and least crossings for quantiles; handle $q=0$ separately.

For real center $c$ and width $s>0$, discrete Gaussian has mass $e^{-(k-c)^2/(2s^2)}/Z(c,s)$; otherwise zero measure.
Prove translation/reflection, all natural moments via differentiated lattice sums, $D=\mathbb R$, and

```math
M(t)=e^{ct+s^2t^2/2}\frac{Z(c+s^2t,s)}{Z(c,s)},\quad
E[X]=c+s^2\partial_c\log Z,\quad \mathrm{Var}\,X=s^2+s^4\partial_c^2\log Z.
```

The center/width need not be mean/standard deviation.
If $2c$ is integral, reflection gives mean $c$.
Give convergent mass-series cdf/characteristic function and least-crossing quantiles.

#### 9.9 Negative multinomial

For finite nonempty categories, $r>0$, $p_0>0$, $p_i\ge0$, $p_0+\sum_i p_i=1$, mix independent Poisson counts of rates $p_i\Lambda$ against $\Lambda\sim\mathrm{Gamma}(r,p_0)$, with a measurable nonnegative-rate extension off the positive half-line.
Valid weights and $r=0$ give $\delta_0$; invalid weights or $r<0$ give zero.

For $r>0$, $K=\sum_i k_i$,

```math
p_k=\frac{\Gamma(r+K)}{\Gamma(r)\prod_i k_i!}p_0^r\prod_i p_i^{k_i},\quad
E[X_i]=\frac{rp_i}{p_0},\quad
\mathrm{Cov}(X_i,X_j)=\delta_{ij}\frac{rp_i}{p_0}+\frac{rp_ip_j}{p_0^2}.
```

After real casting, $Y=\sum_i\theta_iX_i$ has
$M_Y(t)=(p_0/(1-\sum_i p_i e^{t\theta_i}))^r$ on exactly $\sum_i p_i e^{t\theta_i}<1$.
Give the characteristic counterpart with principal complex power; its denominator has positive real part.
At $r=0$, $M=1$ on `ℝ`.

Prove arbitrary finite aggregation, fixed-weight convolution adding shapes, marginal `negativeBinomialMeasure r (p₀/(p₀+p_i))`, and total `negativeBinomialMeasure r p₀`.
All natural mixed moments follow from the falling-factorial moments
$r(r+1)\cdots(r+K-1)\prod_i(p_i/p_0)^{k_i}$, with empty-product and shape-zero cases separate.
Obtain marginal quantiles from these laws.

#### 9.10 Beta-negative-binomial

For $r\ge0,a,b>0$, mix `negativeBinomialMeasure r p` against `betaMeasure a b`; invalid parameters give zero.
At $r=0$, use $\delta_0$, with mass/Dirac moments and $D=\mathbb R$.
For $r>0$,

```math
p_k=\frac{\Gamma(r+k)}{\Gamma(r)k!}\frac{B(a+r,b+k)}{B(a,b)},\qquad D=(-\infty,0].
```

Prove convergent cumulative sums and least-crossing quantiles.
For natural $j>0$, moment integrability is exactly $j < a$, with factorial moment
$r(r+1)\cdots(r+j-1)B(a-j,b+j)/B(a,b)$; the zeroth moment is one.
Prove mean $rb/(a-1)$ for $a>1$, variance
$rb(a+b-1)(a+r-1)/((a-1)^2(a-2))$ for $a>2$, and matching thresholds.
For all valid $r$, the positive-order criterion is $r=0\lor j < a$.

Prove `(betaNegativeBinomialMeasure 1 ρ 1).map (fun k => k+1) = yuleSimonMeasure ρ` for $\rho>0$ on `ℕ`.
Require the absolutely convergent mass-series pgf on $|z|\le1$, mgf on $D$, and characteristic function; no hypergeometric special function.

#### 9.11 Non-identical order statistics

For independent laws with cdfs $F_i$, the count at most $x$ has Poisson-binomial parameters $F_i(x)$.
By Layer 4 sorting, the kth order-statistic cdf is the probability this count is at least $k$.
Include ties and recover the iid formula.

**Checks:** finite Zipf exponent zero is uniform on $`\{1,\ldots,N\}`$; direct and generic zero-inflated/truncated cdf/quantile calculations agree; one-coordinate negative multinomial is negative binomial and zero-weight coordinates are Dirac; Beta-negative-binomial factorial moments agree with conditional integration.

### Layer 10: scalar continuous and noncentral families

Unless specified otherwise, invalid parameters give zero law and zero pdfs.
Densities vanish off their displayed open support; endpoint choices do not create atoms.
Quantile statements assume valid parameters and $0 < u<1$.
A continuous-law root characterization requires existence, uniqueness on the support interior, continuity in $u$, and endpoint limits.
Natural moments include order zero; thresholds are sharp.

#### 10.1 Logistic

For $m\in\mathbb R,s>0$, define the image of unit uniform under $u\mapsto m+s\log(u/(1-u))$.
Put $y=(x-m)/s$; prove

```math
f(x)=\frac{e^{-y}}{s(1+e^{-y})^2},\quad F(x)=(1+e^{-y})^{-1},\quad
Q(u)=m+s\log\frac u{1-u},\quad E[X]=m,\quad\mathrm{Var}\,X=\pi^2s^2/3.
```

Here $D=(-1/s,1/s)$, $M(t)=e^{mt}\Gamma(1-st)\Gamma(1+st)$, and
$\varphi(t)=e^{imt}\pi st/\sinh(\pi st)$ for $t\ne0$, with $\varphi(0)=1$.
Give the uniform-variable `HasLaw` theorem and the difference-of-independent-Gumbels construction at equal scales, allowing unequal locations.

#### 10.2 Gumbel and generalized extreme value

**Gumbel.** For $s>0$, define the maximum convention by $m-s\log E$, $E\sim\mathrm{Exp}(1)$.
Derive density and

```math
F(x)=e^{-e^{-(x-m)/s}},\quad Q(u)=m-s\log(-\log u),\quad
E[X]=m+s\gamma_{\!E},\quad\mathrm{Var}\,X=\pi^2s^2/6,
```

where $\gamma_E$ is `Real.eulerMascheroniConstant`.
Prove $D=(-\infty,1/s)$, $M(t)=e^{mt}\Gamma(1-st)$, $\varphi(t)=e^{imt}\Gamma(1-ist)$ using `Complex.Gamma`.
Minimum Gumbel is the reflection, with Layer 7's quantile bridge.

**GEV.** For $s>0,\xi\in\mathbb R$, use Coles's maximum convention (opposite SciPy `genextreme` shape).
At $\xi\ne0$, define $X=m+s(E^{-\xi}-1)/\xi$, with Gumbel at zero shape.
Derive density and

```math
F(x)=\exp\!\left(-(1+\xi(x-m)/s)^{-1/\xi}\right),\quad
Q(u)=m+s\frac{(-\log u)^{-\xi}-1}{\xi}.
```

The cdf formula requires $1+\xi(x-m)/s>0$; beyond the finite boundary it is zero for $\xi>0$, one for $\xi<0$.
Prove weak continuity at $\xi=0$ and use the Gumbel quantile there.

For $\xi\ne0$, mean is $m+s(\Gamma(1-\xi)-1)/\xi$ when $\xi<1$; variance is $s^2(\Gamma(1-2\xi)-\Gamma(1-\xi)^2)/\xi^2$ when $\xi<1/2$.
For natural $n\ge1$, absolute moment finiteness is exactly $n\xi<1$; derive raw moments by binomial expansion of the exponential construction.
At zero shape all natural moments exist.

| Shape | Exact $D$ |
| --- | --- |
| $\xi>0$ | $(-\infty,0]$ |
| $\xi=0$ | $(-\infty,1/s)$ |
| $-1<\xi<0$ | $\mathbb R$ |
| $\xi=-1$ | $(-1/s,\infty)$ |
| $\xi<-1$ | $[0,\infty)$ |

No general closed transform is required.
The maximum of $n\ge1$ iid copies has scale $sn^\xi$ and location $m+s(n^\xi-1)/\xi$, or $m+s\log n$ at zero shape.
Identify Fréchet, $F(x)=e^{-(x/a)^{-\alpha}}$ for $x>0,a,\alpha>0$, and reversed Weibull as affine GEV specializations.

#### 10.3 Generalized Pareto

**API:** `generalizedParetoMeasure s ξ`.

For $s>0$, define $s(e^{\xi E}-1)/\xi$ with $E\sim\mathrm{Exp}(1)$, using $sE$ at $\xi=0$.
On $x\ge0$, $1+\xi x/s>0$,

```math
F(x)=1-(1+\xi x/s)^{-1/\xi},\qquad Q(u)=s\frac{(1-u)^{-\xi}-1}{\xi},
```

with exponential branches $F(x)=1-e^{-x/s}$ and $Q(u)=-s\log(1-u)$ at zero shape.
For $\xi<0$, the cdf is one at and above $-s/\xi$.
Derive density, mean $s/(1-\xi)$ for $\xi<1$, variance $s^2/((1-\xi)^2(1-2\xi))$ for $\xi<1/2$, and

```math
E[X^n]=\frac{s^nn!}{\prod_{j=1}^n(1-j\xi)}\quad\text{exactly when }n\xi<1\ (n\ge1).
```

Domains are $(-\infty,0]$, $(-\infty,1/s)$, and `ℝ` for positive, zero, and negative shape.
On positive survival, for $x>0$, prove $h(x)=1/(s+\xi x)$, $H(x)=\log(1+\xi x/s)/\xi$, with zero-shape $H=x/s$ and $H(0)=0$.
Conditional excess over admissible $v\ge0$ has shape $\xi$ and scale $s+\xi v$.

Identify exponential at $\xi=0$, uniform $(0,s)$ at $\xi=-1$, and Lomax scale $s/\xi$, shape $1/\xi$ at $\xi>0$.
Translation by $s/\xi$ then gives `paretoMeasure (s/ξ) (1/ξ)`; conversely Pareto $(t,r)$ minus $t$ is GPD scale $t/r$, shape $1/r$.

#### 10.4 Chi and Nakagami

For $k\ge0,s>0$, chi is $s\sqrt X$ with $X\sim\chi_k^2$.
For $k>0$,

```math
f(x)=\frac{2^{1-k/2}x^{k-1}e^{-x^2/(2s^2)}}{\Gamma(k/2)s^k}\ (x>0),\quad
F(x)=G_{k/2}(x^2/(2s^2))\ (x>0),\quad
Q(u)=s\sqrt{2G_{k/2}^{-1}(u)},
```

with cdf zero for $x\le0$.
Natural moments are $s^n2^{n/2}\Gamma((k+n)/2)/\Gamma(k/2)$; derive mean/variance.
Degree zero gives $\delta_0$, cdf $\mathbf1_{x\ge0}$, zeroth moment one and positive moments/quantiles zero.
Every valid chi law has $D=\mathbb R$; no closed mgf.
Identify half-normal, Rayleigh, and Maxwell–Boltzmann at $k=1,2,3$, with Gaussian absolute-value/norm constructions.

Nakagami, $m,\Omega>0$, is the square root of `gammaMeasure m (m/Ω)`.
Derive $f(x)=2(m/\Omega)^m x^{2m-1}e^{-mx^2/\Omega}/\Gamma(m)$ on $x>0$, cdf, moments, and quantile, and identify chi parameters $k=2m$, $s=\sqrt{\Omega/(2m)}$.

#### 10.5 Noncentral chi-squared and chi

**API:** `noncentralChiSquaredMeasure k λ`.

For $k\ge0$, $\lambda:\mathbb R_{\ge0}$, define $J\sim\mathrm{Poisson}(\lambda/2)$ and $X\mid J\sim\chi^2_{k+2J}$.
Guard $k<0$ before mixing.
Prove mean $k+\lambda$, variance $2(k+2\lambda)$, and for $k+\lambda>0$,

```math
D=(-\infty,1/2),\qquad M(t)=(1-2t)^{-k/2}\exp\!\left(\frac{\lambda t}{1-2t}\right).
```

At $k=\lambda=0$ the law is Dirac with full domain.
Give the characteristic counterpart with justified principal powers.
For $k>0$, density/cdf are Poisson-weighted central series; when $\lambda,x>0$, identify density

```math
\tfrac12e^{-(x+\lambda)/2}(x/\lambda)^{k/4-1/2}I_{k/2-1}(\sqrt{\lambda x}).
```

At $\lambda=0$ use the central formula.
At $k=0$, expose atom $e^{-\lambda/2}$ at zero and the continuous mixture over $J\ge1$.
Quantiles are zero through the atom and otherwise unique positive roots of the mixture cdf.

Prove convolution adds degrees and noncentralities.
In positive natural dimension, the squared norm of a standard-covariance Gaussian with nonzero mean has $`\lambda=\|m\|^2`$; zero dimension supplies only $\lambda=0$, not the other degree-zero mixtures.

Noncentral chi $(k,\delta,s)$, $k,\delta\ge0,s>0$, is $s\sqrt X$ with noncentrality $\lambda=\delta^2$.
Derive density, cdf, quantile, and atom by transport.
All natural moments are convergent mixtures of central chi moments, with zero-degree component zero for positive order and one for order zero; derive mean/variance and $D=\mathbb R$.

Rice uses $k=2$, $\delta=\nu/s$, $\nu\ge0$: prove planar Gaussian-norm construction and
$f(x)=x s^{-2}e^{-(x^2+\nu^2)/(2s^2)}I_0(x\nu/s^2)$ for $x>0$.
Folded normal is $|N(m,s^2)|$, corresponding to $k=1$, $\delta=|m|/s$; also give its elementary Gaussian cdf, mean, and variance.

#### 10.6 Noncentral t and F

For $\nu>0,\delta\in\mathbb R$, define $(Z+\delta)/\sqrt{V/\nu}$ from independent standard Gaussian $Z$ and $V\sim\chi_\nu^2$.
Prove denominator positivity.
Integrate $\sqrt{v/\nu}\phi(x\sqrt{v/\nu}-\delta)$ and $\Phi(x\sqrt{v/\nu}-\delta)$ against the chi-squared law to obtain positive density and continuous strictly increasing cdf, hence the real root quantile.
Prove

```math
E[X]=\delta\sqrt{\nu/2}\frac{\Gamma((\nu-1)/2)}{\Gamma(\nu/2)}\ (\nu>1),\quad
E[X^2]=\frac{\nu(1+\delta^2)}{\nu-2}\ (\nu>2),
```

variance by subtraction, absolute natural-moment threshold $n<\nu$, and $`D=\{0\}`$.
Include reflection $\delta\mapsto-\delta$, the central case, and square law noncentral F $(1,\nu,\delta^2)$.

For $m,n>0,\lambda\ge0$, define noncentral F as $(U/m)/(V/n)$ with independent noncentral chi-squared $(m,\lambda)$ and central chi-squared $n$.
Its density/cdf mix the scaled central laws $((m+2j)/m)F(m+2j,n)$ with Poisson weights; use that cdf for the quantile.
Prove

```math
E[X]=\frac{n(m+\lambda)}{m(n-2)}\ (n>2),\quad
E[X^2]=\frac{n^2((m+\lambda)^2+2(m+2\lambda))}{m^2(n-2)(n-4)}\ (n>4).
```

Derive variance, absolute natural-order-$r$ threshold $2r < n$, and $D=(-\infty,0]$.
No hypergeometric density closed forms are required for either family.

#### 10.7 Beta prime and Lévy

For $a,b>0$, beta prime is the image of Beta $(a,b)$ under $x/(1-x)$.
Prove

```math
f(x)=\frac{x^{a-1}(1+x)^{-a-b}}{B(a,b)},\quad F(x)=I_{x/(1+x)}(a,b)\quad(x>0),\quad
Q(u)=\frac{B_{a,b}^{-1}(u)}{1-B_{a,b}^{-1}(u)},
```

with $F=0$ for $x\le0$.
Identify the independent-Gamma ratio and $(a/b)F(2a,2b)$.
Prove $E[X^q]=B(a+q,b-q)/B(a,b)$ exactly for $-a < q < b$, mean $a/(b-1)$ for $b>1$, variance $a(a+b-1)/((b-2)(b-1)^2)$ for $b>2$, and $D=(-\infty,0]$.

For $m\in\mathbb R,c>0$, `levyMeasure m c` is `inverseGammaMeasure (1/2) (c/2)` translated by $m$.
On $x>m$,

```math
f(x)=\sqrt{\frac c{2\pi}}(x-m)^{-3/2}e^{-c/(2(x-m))},\quad
F(x)=\mathrm{erfc}\,\sqrt{\frac c{2(x-m)}},\quad Q(u)=m+\frac c{z(1-u/2)^2}.
```

Positive fractional moments of $|X-m|$ exist exactly below $1/2$.
Prove $D=(-\infty,0]$, $M(t)=e^{mt-\sqrt{-2ct}}$, the standard-Gaussian construction $m+c/Z^2$, and reflection.
Layer 15 gives the stable identifications.

#### 10.8 Inverse Gaussian

For $\mu,\lambda>0$, use

```math
f(x)=\sqrt{\frac\lambda{2\pi x^3}}\exp\!\left(-\frac{\lambda(x-\mu)^2}{2\mu^2x}\right)\quad(x>0).
```

Prove normalization, mean $\mu$, variance $\mu^3/\lambda$, and cdf zero for $x\le0$, otherwise

```math
F(x)=\Phi\!\left(\sqrt{\lambda/x}(x/\mu-1)\right) +
e^{2\lambda/\mu}\Phi\!\left(-\sqrt{\lambda/x}(x/\mu+1)\right).
```

The exact domain is the **closed** interval $D=(-\infty,\lambda/(2\mu^2)]$, with
$M(t)=\exp((\lambda/\mu)(1-\sqrt{1-2\mu^2t/\lambda}))$, including its finite endpoint value.
Give the characteristic counterpart using the principal square root, unique positive-root quantile, and Wald specialization $\mu=1$.

#### 10.9 Truncated and skew normal

**Truncated normal.** Apply Layer 7 conditioning to $N(m,v)$, $v:\mathbb R_{\ge0}$, on an interval with extended bounds $l < r$.
For $v>0$, let $s=\sqrt v$, $\alpha=(l-m)/s$, $\beta=(r-m)/s$, $Z=\Phi(\beta)-\Phi(\alpha)>0$.
Prove density $\phi((x-m)/s)/(sZ)$ on the interval, the clipped cdf, and

```math
Q(u)=m+s z(\Phi(\alpha)+uZ),\qquad E[X]=m+s\frac{\phi(\alpha)-\phi(\beta)}Z,
```

```math
\mathrm{Var}\,X=v\left(1+\frac{\alpha\phi(\alpha)-\beta\phi(\beta)}Z
-\left(\frac{\phi(\alpha)-\phi(\beta)}Z\right)^2\right),\qquad
M(t)=e^{mt+vt^2/2}\frac{\Phi(\beta-st)-\Phi(\alpha-st)}Z,\quad D=\mathbb R.
```

Define products at infinite bounds by their zero limits.
At $v=0$, conditioning is $\delta_m$ or zero according to membership in the interval with its explicit endpoint flags.
The centered one-sided case is half-normal.

**Skew-normal.** For $s>0$, shape $\alpha\in\mathbb R$, put $y=(x-m)/s$, $d=\alpha/\sqrt{1+\alpha^2}$.
Use $f(x)=2\phi(y)\Phi(\alpha y)/s$ and prove the independent-Gaussian construction $m+s(d|Z_1|+\sqrt{1-d^2}Z_2)$.
Prove

```math
F(x)=\Phi(y)-2T(y,\alpha),\quad E[X]=m+sd\sqrt{2/\pi},\quad
\mathrm{Var}\,X=s^2(1-2d^2/\pi),\quad M(t)=2e^{mt+s^2t^2/2}\Phi(dst),\quad D=\mathbb R.
```

Give the Owen-T root quantile, Gaussian specialization at $\alpha=0$, and shape reflection.

#### 10.10 Uniform sums and bounded elementary laws

**Irwin–Hall.** Sum $n\in\mathbb N$ independent unit uniforms; $n=0$ gives $\delta_0$.
For $n\ge1$,

```math
F(x)=\frac1{n!}\sum_{k=0}^n(-1)^k\binom nk\max(x-k,0)^n.
```

For $n\ge2$, the density is the same sum with power $n-1$ and denominator $(n-1)!$; $n=1$ is uniform.
Prove mean $n/2$, variance $n/12$, $D=\mathbb R$, $M(t)=((e^t-1)/t)^n$ for $t\ne0$, and $M(0)=1$.
**Bates** is its scaling by $1/n$ for $n\ge1$, with zero measure at $n=0$; inherit density, cdf, quantile, moments, and transforms.
For both continuous laws, quantiles are unique roots of their piecewise-polynomial cdfs; no arbitrary-degree radical formula.

**Triangular.** For $a < b$, $a\le c\le b$, use $2(x-a)/((b-a)(c-a))$ on $(a,c)$ and $2(b-x)/((b-a)(b-c))$ on $(c,b)$.
If $c=a$ or $c=b$, use only the nonempty branch.
Prove the piecewise-quadratic cdf, mean $(a+b+c)/3$, variance $(a^2+b^2+c^2-ab-ac-bc)/18$, and

```math
Q(u)=\begin{cases}a+\sqrt{u(b-a)(c-a)}&u\le(c-a)/(b-a),\\b-\sqrt{(1-u)(b-a)(b-c)}&\text{otherwise}.\end{cases}
```

All natural moments are finite binomial sums obtained from the two branches; $D=\mathbb R$.

**Kumaraswamy.** For $a,b>0$, $F(x)=1-(1-x^a)^b$ on $[0,1]$, $f(x)=abx^{a-1}(1-x^a)^{b-1}$ on $(0,1)$, and $Q(u)=(1-(1-u)^{1/b})^{1/a}$.
Prove $E[X^q]=bB(1+q/a,b)$ exactly for $q>-a$, derive mean/variance, prove $D=\mathbb R$, and identify $X^a\sim\mathrm{Beta}(1,b)$.

#### 10.11 Gompertz and log-logistic

**Gompertz.** For $\eta,b>0$, define $X=\log(1+E/\eta)/b$, $E\sim\mathrm{Exp}(1)$.
Prove survival $e^{-\eta(e^{bx}-1)}$ for $x\ge0$, density $\eta b e^{bx}e^{-\eta(e^{bx}-1)}$, cdf, and $Q(u)=\log(1-\log(1-u)/\eta)/b$.
For $x>0$, $h=\eta b e^{bx}$ and $H=\eta(e^{bx}-1)$, with $H(0)=0$.
All natural/exponential moments exist; use the convergent representations

```math
E[X^n]=b^{-n}\int_0^\infty\log(1+y/\eta)^n e^{-y}\,dy,\qquad
M(t)=\int_0^\infty(1+y/\eta)^{t/b}e^{-y}\,dy.
```

Mean/variance use the first two integrals.
Derive these by shared pushforward integration, without another special function or independent moment-integration development.

**Log-logistic.** For scale $a>0$, shape $b>0$, exponentiate logistic location $\log a$, scale $1/b$.
Derive density and, on $x>0$,

```math
F(x)=\frac1{1+(x/a)^{-b}},\quad Q(u)=a\left(\frac u{1-u}\right)^{1/b},\quad
h(x)=\frac{(b/a)(x/a)^{b-1}}{1+(x/a)^b},\quad H(x)=\log(1+(x/a)^b).
```

Prove $E[X^q]=a^q\Gamma(1+q/b)\Gamma(1-q/b)$ exactly for $|q| < b$, mean/variance for $b>1,b>2$, and $D=(-\infty,0]$.

#### 10.12 Generalized gamma

For $a,s>0,c\ne0$, define `generalizedGammaMeasure a c s` as $sG^{1/c}$ with $G\sim\mathrm{Gamma}(a,1)$.
For $x>0$,

```math
f(x)=\frac{|c|}{s\Gamma(a)}(x/s)^{ac-1}e^{-(x/s)^c},\qquad
F(x)=\begin{cases}G_a((x/s)^c)&c>0,\\1-G_a((x/s)^c)&c<0,\end{cases}
```

with cdf zero for $x\le0$.
Quantiles are $s(G_a^{-1}(u))^{1/c}$ for $c>0$, and $s(G_a^{-1}(1-u))^{1/c}$ for $c<0$.
Prove
$E[X^q]=s^q\Gamma(a+q/c)/\Gamma(a)$ exactly when $a+q/c>0$, deriving mean/variance.
Domains: `ℝ` for $c>1$, $(-\infty,1/s)$ for $c=1$, $(-\infty,0]$ for $c<1,c\ne0$; no further closed transform.

Identify Gamma $(a,1,s)$, Weibull $(1,c,s)$ for $c>0$, inverse-gamma $(a,-1,s)$, and Fréchet $(1,c,s)$ for $c<0$ in these generalized-gamma coordinates.
Chi degree $k>0$, scale $b$ is $(k/2,2,\sqrt2b)$; Nakagami is $(m,2,\sqrt{\Omega/m})$.
Obtain their real-power thresholds $q>-k$ and $q>-2m$; chi degree zero stays a direct Dirac case.

#### 10.13 Generalized normal

For $m\in\mathbb R,s,p>0$, use $f(x)=p\exp(-|(x-m)/s|^p)/(2s\Gamma(1/p))$.
Construct $m+s\varepsilon G^{1/p}$ from independent symmetric Rademacher and $G\sim\mathrm{Gamma}(1/p,1)$.
Prove

```math
F(x)=\tfrac12+\tfrac12\mathrm{sign}(x-m)G_{1/p}(|(x-m)/s|^p),
```

```math
Q(u)=m+s\mathrm{sign}(2u-1)\bigl(G_{1/p}^{-1}(|2u-1|)\bigr)^{1/p}\quad(u\ne1/2),\qquad Q(1/2)=m.
```

Prove mean $m$, symmetry, vanishing odd central moments, and
$E[|X-m|^q]=s^q\Gamma((q+1)/p)/\Gamma(1/p)$ exactly for $q>-1$; derive variance and natural raw moments.
Domains are `ℝ` for $p>1$, $(-1/s,1/s)$ for $p=1$, and $`\{0\}`$ for $0 < p<1$; no general transform formula.
Recover Laplace at $p=1$ and Gaussian variance $s^2/2$ at $p=2$.

#### 10.14 Asymmetric Laplace

For $l,r>0$, define $m+E_r-E_l$ from independent exponentials.
Density is $lr e^{l(x-m)}/(l+r)$ for $x\le m$, and $lr e^{-r(x-m)}/(l+r)$ otherwise.
Put $w=r/(l+r)$; prove

```math
F(x)=\begin{cases}we^{l(x-m)}&x\le m,\\1-(1-w)e^{-r(x-m)}&x>m,\end{cases}\qquad
Q(u)=\begin{cases}m+\log(u/w)/l&u\le w,\\m-\log((1-u)/(1-w))/r&u>w.\end{cases}
```

Mean is $m+1/r-1/l$, variance $1/r^2+1/l^2$, $D=(-l,r)$, and $M(t)=e^{mt}rl/((r-t)(l+t))$, with its characteristic counterpart.
Obtain all natural moments by independent-exponential expansion; equal rates give Laplace scale $1/r$.

#### 10.15 Logit-normal and log-uniform

**Logit-normal.** Push $N(m,v)$, $v:\mathbb R_{\ge0}$, through $\sigma(x)=(1+e^{-x})^{-1}$.
For $v>0,s=\sqrt v$, on $0 < x<1$,

```math
f(x)=\frac{\phi((\log(x/(1-x))-m)/s)}{sx(1-x)},\quad
F(x)=\Phi((\log(x/(1-x))-m)/s),\quad Q(u)=\sigma(m+sz(u)).
```

Give cdf zero/one outside the interval; $v=0$ gives $\delta_{\sigma(m)}$.
All natural moments and $D=\mathbb R$ follow from Gaussian integrals of powers of sigmoid; express mean/variance through those integrals, without elementary closed forms.
Reflection $1-X$ negates $m$.

**Log-uniform.** For $0 < a < b$, push uniform $(\log a,\log b)$ through exponential; invalid endpoints, including equality, give zero.
Prove $f(x)=1/(x\log(b/a))$ on $(a,b)$, $F(x)=\log(x/a)/\log(b/a)$ on $[a,b]$ with endpoint extensions, and $Q(u)=a(b/a)^u$.
Real-power moments are $(b^q-a^q)/(q\log(b/a))$ for $q\ne0$, one for $q=0$.
Derive mean/variance and $D=\mathbb R$.

#### 10.16 Half-Student t and half-Cauchy

For $\nu,s>0$, define $s|T|$, $T\sim t_\nu$; half-Cauchy is $\nu=1$.
Folding gives density $2f_T(x/s)/s$ for $x>0$, cdf $2F_T(x/s)-1$ for $x\ge0$, and quantile $sQ_T((1+u)/2)$.
Prove

```math
E[X^q]=\frac{s^q\nu^{q/2}\Gamma((q+1)/2)\Gamma((\nu-q)/2)}{\sqrt\pi\,\Gamma(\nu/2)}
```

exactly for $-1 < q<\nu$, mean/variance where finite, and $D=(-\infty,0]$.

#### 10.17 Noncentral Beta

**API:** `noncentralBetaMeasure a b λ`.

For $a\ge0,b>0,\lambda:\mathbb R_{\ge0}$, define $U/(U+V)$ from independent noncentral chi-squared $(2a,\lambda)$ and central chi-squared $2b$.
Prove denominator positivity; invalid shapes give zero law.
For fixed $b>0$, define a measurable component $B_b^*(c)$ as $\delta_0$ at $c=0$, Beta $(c,b)$ for $c>0$, and zero for $c<0$; do not change `betaMeasure`.
With $p_j=e^{-\lambda/2}(\lambda/2)^j/j!$, prove the measure mixture $\sum_jp_j B_b^*(a+j)$ with extended-real coefficients.

For $a>0$, density/cdf are the convergent Poisson sums of Beta densities/cdfs, with density zero off $(0,1)$ and cdf zero for $x\le0$, one for $x\ge1$.
At $a=0$, expose atom $w=e^{-\lambda/2}$ at zero plus $\sum_{j\ge1}p_j\mathrm{Beta}(j,b)$ of total mass $1-w$; its density describes only that component.
The mixed cdf is zero for $x<0$, $w$ at zero, atom plus continuous cdf on $(0,1)$, and one for $x\ge1$.
At $a=\lambda=0$ the law is $\delta_0$; at $a>0,\lambda=0$ it is Beta.
Topological support is $[0,1]$ except the Dirac case; a nonzero continuous component has positive density on $(0,1)$.

All natural moments exist, with order zero one and, for $n>0$,

```math
E[X^n]=\sum_{j\ge0}p_j\prod_{l=0}^{n-1}\frac{a+j+l}{a+b+j+l},
```

including the zero $a=j=0$ term.
Derive mean/variance and $D=\mathbb R$; no additional special-function transform.
For $a>0$, $Q$ is the unique cdf root in $(0,1)$; for $a=0$, $Q(u)=0$ for $u\le w$ and is that root above $w$.
Prove continuity and endpoint limits on the nonconstant ranges.
For $a>0$ only, $(b/a)X/(1-X)$ has noncentral F degrees $2a,2b$, noncentrality $\lambda$.

#### 10.18 Hypoexponential

**API:** `hypoexponentialMeasure λ`.

For finite, possibly empty `ι` and real rates $\lambda_i$, define the sum pushforward of independent exponentials when every rate is positive, and zero otherwise.
Repetitions are valid.
The empty law is $\delta_0$; a nonempty valid law is positive almost surely, atomless, and has topological support $[0,\infty)$.
Chosen pdfs are zero for invalid or empty families, with no density identity for the empty Dirac law.

**Assume nonempty valid rates for the following partial fractions and density/cdf.** Let $R$ be the distinct rates, $m_r$ their multiplicities, $C=\prod_i\lambda_i$.
For $r\in R$, $1\le k\le m_r$, define

```math
A_{r,k}=\left.\frac1{(m_r-k)!}\frac{d^{m_r-k}}{dz^{m_r-k}}
\left[C\prod_{q\in R\setminus\{r\}}(z+q)^{-m_q}\right]\right|_{z=-r}.
```

The differentiated denominators are nonzero near $-r$.
Away from poles, prove

```math
\prod_i\frac{\lambda_i}{z+\lambda_i}=\sum_{r\in R}\sum_{k=1}^{m_r}\frac{A_{r,k}}{(z+r)^k}.
```

For $x>0$,

```math
f(x)=\sum_{r,k}\frac{A_{r,k}x^{k-1}e^{-rx}}{(k-1)!},\qquad
F(x)=1-\sum_{r,k}\frac{A_{r,k}}{r^k}e^{-rx}\sum_{j=0}^{k-1}\frac{(rx)^j}{j!};
```

both are zero for $x\le0$.
Identify the density with the convolution law, prove normalization and strict positivity.
The coefficients may be negative.
Convolution positivity and transform uniqueness may be used, but a formal transform calculation alone is insufficient.
Recover the distinct-rate density
$\sum_i\lambda_i e^{-\lambda_i x}\prod_{j\ne i}\lambda_j/(\lambda_j-\lambda_i)$ and, for $n\ge1$ equal rates $r>0$, `gammaMeasure n r` with its Erlang density.

For all valid rates, including the empty family,

```math
E[X^n]=n!\sum_{\substack{k:\iota\to\mathbb N\\\sum_i k_i=n}}\prod_i\lambda_i^{-k_i},\quad
E[X]=\sum_i\lambda_i^{-1},\quad \mathrm{Var}\,X=\sum_i\lambda_i^{-2}.
```

Prove finiteness of the indexing set and moment integrability.
Empty-family moments are one at order zero and zero otherwise.
The exact domain and transforms are

```math
D=\{t:\forall i,\ t<\lambda_i\},\quad M(t)=\prod_i\frac{\lambda_i}{\lambda_i-t},\quad
K(t)=-\sum_i\log(1-t/\lambda_i),\quad \varphi(t)=\prod_i\frac{\lambda_i}{\lambda_i-it}.
```

Empty products give $D=\mathbb R$, $M=\varphi=1$, $K=0$.
Nonempty quantiles are unique positive roots of the cdf, continuous and strictly increasing with limits $0,\infty$; empty quantiles are zero.
Prove reindexing, independent-sum `HasLaw`, convolution by concatenation, and positive scaling dividing rates.
No matrix-exponential representation is required.

#### 10.19 Hyperexponential

**API:** `hyperexponentialMeasure p λ`.

For finite `ι`, `p : Convexity.StdSimplex ℝ≥0 ι`, real rates $\lambda_i$, put $w_i=p_i$ and $`A=\{i:w_i>0\}`$.
This set is nonempty; no weight parameter exists on an empty type.
Define $\sum_iw_i\mathrm{Exp}(\lambda_i)$ if every active rate is positive, and zero law/pdfs otherwise.
Inactive rates may be arbitrary.

On the valid domain, with sums over $A$, prove for $x>0$,

```math
f(x)=\sum_iw_i\lambda_i e^{-\lambda_i x},\quad F(x)=1-\sum_iw_i e^{-\lambda_i x},
```

both zero for $x\le0$, with normalization, atomlessness, positive density, and topological support $[0,\infty)$.
All natural moments satisfy $E[X^n]=n!\sum_iw_i/\lambda_i^n$; mean is $\sum_iw_i/\lambda_i$ and variance $2\sum_iw_i/\lambda_i^2-(\sum_iw_i/\lambda_i)^2$.
Prove

```math
D=\{t:\forall i\in A,\ t<\lambda_i\},\quad M(t)=\sum_i\frac{w_i\lambda_i}{\lambda_i-t},\quad
\varphi(t)=\sum_i\frac{w_i\lambda_i}{\lambda_i-it}.
```

The quantile is the unique positive solution of $\sum_iw_i e^{-\lambda_iQ(u)}=1-u$, continuous and strictly increasing with limits $0,\infty$.

Prove categorical-mixture `HasLaw`, reindexing, independence from inactive rates, deletion of zero weights, and merging equal-rate components by adding weights.
Equal active rate $r$ recovers exponential and $Q(u)=-\log(1-u)/r$.
Positive scaling divides rates.

#### 10.20 Arcsine and semicircle

Define arcsine as `betaMeasure (1/2) (1/2)` and unit-radius semicircle as `(betaMeasure (3/2) (3/2)).map (2*·-1)`; inherit their basic theory.
The arcsine formulas are

```math
f(x)=\frac1{\pi\sqrt{x(1-x)}}\ (0 < x<1),\quad
F(x)=\frac2\pi\arcsin\sqrt x\ (0\le x\le1),\quad Q(u)=\sin^2(\pi u/2).
```

The semicircle formulas are

```math
f(x)=\frac2\pi\sqrt{1-x^2}\ (-1 < x<1),\quad
F(x)=\frac12+\frac{x\sqrt{1-x^2}+\arcsin x}\pi\ (-1\le x\le1),\quad
Q(u)=2B_{3/2,3/2}^{-1}(u)-1.
```

Give cdf zero/one extensions.
Identify $(X_i+1)/2$ for a uniform-circle coordinate as arcsine, and a unit-disk coordinate as semicircle, through Layer 12.
Location-scale versions use Layer 7.

**Checks:** zero noncentrality recovers central chi-squared/chi/t/F and positive-shape Beta, retaining zero-shape atoms; Nakagami remains normalized below $m=1/2$ with threshold $q>-2m$; centered Gaussian folding equals half-normal and half-line conditioning; half-Cauchy is folded centered Cauchy; repeated-rate and inactive-rate cases agree with their declared laws.

### Layer 11: multivariate t and Gaussian transformations

Use the shared measure/parameter interfaces and Layer 13's named scalar quantiles; densities and covariance statements use the coordinates specified here.

#### 11.1 Multivariate t

On `EuclideanSpace ℝ ι`, finite nonempty `ι`, define $`m+\sqrt{\nu/V}\,Z`$ from independent $Z\sim N(0,S)$ and $V\sim\chi_\nu^2$, for $S\succeq0$, $\nu>0$; otherwise zero law.
For $S\succ0$, $d=\mathrm{card}\,\iota$,

```math
f(x)=\frac{\Gamma((\nu+d)/2)}{\Gamma(\nu/2)(\nu\pi)^{d/2}\sqrt{\det S}}
\left(1+\langle x-m,S^{-1}(x-m)\rangle/\nu\right)^{-(\nu+d)/2}.
```

For PSD singular $S$, prove support on $m+\mathrm{range}\,S$ and singularity relative to ambient volume.
At $S=0$ the law is $\delta_m$ for every $\nu>0$.

For nonzero PSD $S$, positive natural norm moment order $r$ is integrable exactly when $r<\nu$.
Mean is $m$ for $\nu>1$ and covariance is $\nu S/(\nu-2)$ for $\nu>2$; **scale is not covariance**.
Prove real linear marginals as location-scale Student laws, arbitrary affine closure, and weak convergence to $N(m,S)$ as $\nu\to\infty$.
Directional $D$ is $`\{0\}`$ for positive scale variance and `ℝ` for zero scale variance.

For block PSD scale with $S_{22}\succ0$, the conditional law given $x_2$ has degree $\nu+\mathrm{card}\,\kappa$, mean parameter $m_1+S_{12}S_{22}^{-1}(x_2-m_2)$, and scale

```math
\frac{\nu+q}{\nu+\mathrm{card}\,\kappa}
(S_{11}-S_{12}S_{22}^{-1}S_{21}),\qquad q=\langle x_2-m_2,S_{22}^{-1}(x_2-m_2)\rangle.
```

State it through `condDistrib` and a measurable kernel as in Layer 5.

#### 11.2 Matrix normal

Use `Matrix ι κ ℝ` with its product Borel structure.
For mean $M$ and PSD row/column covariances $U,V$, transport a Gaussian on `EuclideanSpace ℝ (ι × κ)` through `x ↦ Matrix.of (fun i j => x (i,j))`, with covariance entry $U_{ik}V_{jl}$.
Package the inverse `A ↦ WithLp.toLp 2 (fun ij => A ij.1 ij.2)` as a measurable equivalence and prove the product-volume comparison.
Invalid $U,V$ give $\delta_M$ by explicit branch.

For valid parameters prove mean $M$, entry covariance $U_{ik}V_{jl}$, affine-image support, row/column Gaussian marginals, and $AXB+C$ parameters $(AMB+C,AUA^{\mathsf T},B^{\mathsf T}VB)$.
If $U,V\succ0$, for $r$ rows and $c$ columns the density is

```math
(2\pi)^{-rc/2}(\det U)^{-c/2}(\det V)^{-r/2}
\exp\!\left(-\tfrac12\mathrm{tr}(V^{-1}(X-M)^{\mathsf T}U^{-1}(X-M))\right).
```

Give directional mgfs and characteristic functions by vectorization.
Empty row/column types give the unique-matrix Dirac law; describe singular support when product covariance is singular.

#### 11.3 Proper complex Gaussian

On finite `ι → ℂ` with product Borel structure, define mean $m$ and Hermitian PSD covariance $C$ through realification with covariance

```math
\frac12\begin{pmatrix}\mathrm{Re}\,C&-\mathrm{Im}\,C\\\mathrm{Im}\,C&\mathrm{Re}\,C\end{pmatrix}.
```

For Hermitian $C$, prove PSD equivalence with this real matrix; invalid $C$ gives $\delta_m$.
Prove complex covariance $E[(Z-m)(Z-m)^H]=C$, pseudocovariance $E[(Z-m)(Z-m)^{\mathsf T}]=0$, complex affine closure, coordinate marginals, real directional transforms, and singular support via realification.

For $C\succ0$, prove density

```math
\frac{\exp(-\mathrm{Re}((z-m)^HC^{-1}(z-m)))}{\pi^d\mathrm{Re}(\det C)}
```

relative to real product volume on complex coordinates, with positive determinant factor.
The centered law is invariant under every unit complex scalar; translated fluctuations are circular, not generally the law about zero.
A standard coordinate has independent real/imaginary Gaussians of variance $1/2$, expected squared modulus one, Rayleigh modulus of scale $1/\sqrt2$, and rate-one exponential squared modulus.
A nonzero-mean scalar modulus gives Rice.
Improper complex Gaussian theory is excluded.

#### 11.4 Multivariate log-normal

Define `multivariateLogNormalMeasure m S` by coordinatewise exponential of $N(m,S)$ for finite `ι`.
It is almost surely in the positive orthant.
Under PSD covariance, prove concentration on $\exp(m+\mathrm{range}\,S)$, topological support its ambient closure, and singularity relative to ambient volume when $S$ is singular.
Invalid covariance gives $\delta_{\exp m}$ with singleton support.
Empty index types give the unique-point law.

For $S\succ0$, derive density $\phi_{m,S}(\log x)/\prod_i x_i$ on the positive orthant, zero elsewhere, including the logarithmic derivative determinant and measure identity.
For every real vector $q$, the mixed power is integrable for **every** $S$; for PSD $S$,

```math
E\!\left[\prod_iX_i^{q_i}\right]=e^{\langle q,m\rangle+\langle q,Sq\rangle/2},\quad
E[X_i]=e^{m_i+S_{ii}/2},\quad
\mathrm{Cov}(X_i,X_j)=e^{m_i+m_j+(S_{ii}+S_{jj})/2}(e^{S_{ij}}-1).
```

Prove coordinate log-normal laws, Gaussian $\langle q,\log X\rangle$, and log-normal $\prod_iX_i^{q_i}$ with parameters $(\langle q,m\rangle,\langle q,Sq\rangle)$; obtain coordinate/monomial quantiles including zero variance.
Under PSD covariances, prove log-affine transport $X\mapsto\exp(c+L\log X)$ and componentwise multiplication of independent vectors by adding Gaussian means/covariances.
No claim that coordinate sums are log-normal, and no general directional mgf formula/domain target.

#### 11.5 Simplex logistic-normal

For finite nonempty `ι` and reference $r:\iota$, put $`J_r=\{i:i\ne r\}`$.
Extend $z\in\mathbb R^{J_r}$ by $\bar z_r=0$, and set

```math
T_r(z)_i=\frac{e^{\bar z_i}}{\sum_j e^{\bar z_j}}.
```

Define `logisticNormalMeasure r m S = (multivariateGaussian m S).map T_r` on the same ambient Euclidean carrier as Dirichlet.
Prove smooth chart equivalence onto the open simplex, inverse $A_r(x)_i=\log(x_i/x_r)$, and almost-sure simplex membership.

Use deleted-coordinate reconstruction $x_r=1-\sum_{i\ne r}x_i$ to push product volume to the simplex's affine hull.
For $S\succ0$, prove the chart Jacobian and density $\phi_{m,S}(A_r(x))/\prod_i x_i$ on the open simplex, zero elsewhere.
For PSD $S$, concentration is on $T_r(m+\mathrm{range}\,S)$ and topological support its ambient closure; PSD singular $S$ gives singularity relative to this reference measure in positive chart dimension.
Invalid $S$ gives $\delta_{T_r(m)}$ with singleton support; zero covariance does too.
One category is Dirac at its unique simplex point.

For reference $s$, define the linear equivalence $(B_{sr}z)_i=\bar z_i-\bar z_s$ for $i\ne s$.
Prove inverse $B_{rs}$, $T_s\circ B_{sr}=T_r$, and for **every** covariance parameter,

```math
\mathrm{LN}_r(m,S)=\mathrm{LN}_s(B_{sr}m,B_{sr}SB_{sr}^{\mathsf T}).
```

Invertibility preserves PSD validity and equates invalid Dirac fallbacks.
Deleted-coordinate chart changes have absolute Jacobian one, so reference measures agree.
Prove category permutations and Gaussian log-ratio laws/quantiles.

For every natural multi-index $k$, give integrable mixed moments as the Gaussian integral $`\int\prod_i T_r(z)_i^{k_i}\,dN(m,S)`$; mean/covariance use orders one/two.
Bounded simplex support gives every linear observable domain `ℝ`, with no closed ordinary moment/transform required.
Two categories recover scalar logit-normal in the non-reference coordinate; in higher dimensions the required Gaussian quantile observables are log ratios, not individual coordinates.

**Check:** one-dimensional multivariate t agrees with location-scale scalar t, including zero-scale Dirac.

### Layer 12: spherical and circular laws

#### 12.1 Uniform sphere and ball

For Euclidean dimension $d\ge1$, normalize `volume.toSphere` on the unit-sphere subtype.
Prove surface mass $2\pi^{d/2}/\Gamma(d/2)$, rotational invariance, equality to standard-Gaussian direction, and independence from radius.
Supply a measurable direction map, show zero Gaussian-null and its assigned direction irrelevant; radius has chi $(d,1)$.
Embedded mean is zero and covariance $I/d$.
Dimension one gives equal mass at $\pm1$; dimension zero has an empty sphere and no probability law.

For a ball of center $c$, radius $r>0$, use `cond volume (ball c r)`; radius zero gives $\delta_c$, negative radius gives zero.
Prove volume $\pi^{d/2}r^d/\Gamma(d/2+1)$, density, translation/scaling, orthogonal invariance, mean $c$, and covariance $r^2I/(d+2)$.
For $d\ge1,r>0$, normalized radius has cdf $t^d$ on $[0,1]$, quantile $u^{1/d}$, and is independent of direction.
Dimension-zero valid ball laws are Dirac.

For a sphere coordinate, $d\ge2$, $(X_i+1)/2\sim\mathrm{Beta}((d-1)/2,(d-1)/2)$; for the centered unit ball, $d\ge1$, the parameters are $((d+1)/2,(d+1)/2)$.
Derive coordinate cdfs/quantiles and arbitrary projections by rotation/scaling.

#### 12.2 Von Mises–Fisher

Let $\sigma_d$ be uniform sphere probability, $d\ge1$.
Define the natural-parameter law for any ambient $\eta$ as `σ_d.tilted (fun x => ⟪η,x⟫)`.
The unit-direction/concentration form has $\eta=\kappa m$, $\kappa\ge0$; negative concentration gives zero, and dimension zero gives the empty measure.
Prove equivalence to density $e^{\kappa\langle m,x\rangle}/Z$ relative to $\sigma_d$, integrability and positivity of $Z$, and parameter measurability.

In dimension one, masses at $1,-1$ are $e^\eta/(e^\eta+e^{-\eta})$ and $e^{-\eta}/(e^\eta+e^{-\eta})$, mean $\tanh\eta$, variance $1-\tanh^2\eta$, every projection domain `ℝ`, and quantiles follow the two cumulative masses.

For $d\ge2$, $\kappa>0$, the unnormalized-surface integral is

```math
Z_d(\kappa)=(2\pi)^{d/2}\kappa^{1-d/2}I_{d/2-1}(\kappa).
```

At zero use the uniform law and surface-area value, not $0/0$.
Put $A_d=I_{d/2}(\kappa)/I_{d/2-1}(\kappa)$; prove

```math
E[X]=A_dm,\qquad E[XX^{\mathsf T}]=\frac{A_d}\kappa I+
\left(1-\frac{dA_d}\kappa\right)mm^{\mathsf T},
```

and covariance by subtraction.
At zero concentration mean is zero and covariance $I/d$ directly.
Prove orthogonal equivariance and directional mgf as the normalizer ratio at vector parameters $\kappa m+t\theta$ and $\kappa m$, with full domain and zero-vector normalizer handled by surface area.
The projection $\langle m,X\rangle$ has density proportional to $e^{\kappa y}(1-y^2)^{(d-3)/2}$ on $(-1,1)$; give its constant, cdf integral, and unique-root quantile.

#### 12.3 Circle and von Mises

Use `AddCircle (2*π)` with Borel structure and `circleHaarProbability = cond volume Set.univ`.
Prove it is $(2\pi)^{-1}$ times volume, transported by sine/cosine to uniform sphere in `EuclideanSpace ℝ (Fin 2)`.
The measurable angle representative is **$[-\pi,\pi)$**, with integration $d\theta/(2\pi)$.
All circle cdfs/quantiles below concern this chart; prove location-representative independence of densities and circle characters.

For circle location $m$ and $\kappa\ge0$, von Mises has Haar density $e^{\kappa\cos(\theta-m)}/I_0(\kappa)$; negative concentration gives zero.
Prove rotational equivariance, the two-dimensional vMF identity, and integer Fourier moments

```math
E[e^{in\theta}]=e^{inm}\frac{I_{|n|}(\kappa)}{I_0(\kappa)}.
```

Give the first trigonometric moment and circular variance $1-I_1/I_0$, not an ordinary expectation equal to direction.
At zero concentration recover Haar probability.
Give the angle-density cdf integral and unique interior-root quantile.

#### 12.4 Wrapped normal

Translate the quotient pushforward of $N(0,v)$ by circle location $m$, $v:\mathbb R_{\ge0}$; $v=0$ gives $\delta_m$.
For $v>0$, the density relative to $d\theta$ has equivalent series

```math
\sum_{k\in\mathbb Z}\frac{e^{-(\theta-m+2\pi k)^2/(2v)}}{\sqrt{2\pi v}} =
\frac1{2\pi}\left(1+2\sum_{n\ge1}e^{-n^2v/2}\cos(n(\theta-m))\right).
```

The Haar density is $2\pi$ times this.
Prove positivity, normalization, representative independence, and locally uniform convergence for termwise integration.
Fourier moments are $e^{inm-n^2v/2}$; give the first trigonometric moment, circular variance $1-e^{-v/2}$, and convolution adding locations/variances.
Prove weak limits to Dirac as $v\downarrow0$ and Haar as $v\to\infty$.
The chart cdf integrates the periodized density, equivalently sums Gaussian interval probabilities, and gives a unique-root quantile for $v>0$; at zero use the chosen representative's Dirac quantile.

#### 12.5 Wrapped Cauchy

Translate the quotient pushforward of Cauchy $(0,\gamma)$, $\gamma:\mathbb R_{\ge0}$, by $m$.
Zero scale is $\delta_m$.
For $\gamma>0$, $\rho=e^{-\gamma}$, prove the Haar density and absolutely convergent Fourier series

```math
\frac{1-\rho^2}{1+\rho^2-2\rho\cos(\theta-m)} =
1+2\sum_{n\ge1}\rho^n\cos(n(\theta-m)).
```

Prove normalization/representative independence, Fourier moments $e^{inm-\gamma|n|}$, circular variance $1-e^{-\gamma}$, convolution adding locations/scales, and weak limits to Dirac as $\gamma\downarrow0$ and Haar as $\gamma\to\infty$.
Give the fixed-chart cdf integral and unique-root quantile for positive scale, and Dirac chart quantile at zero.
The limit $\rho=0$ is Haar, not a finite scale.

**Checks:** the Haar angle law equals `uniformMeasure (-π) π` as a real measure despite null endpoint differences; wrapped-normal Fourier coefficients use the declared characteristic convention without an extra $2\pi$.

### Layer 13: quantile formulas and coverage of all families

Every formula assumes valid parameters and **$0 < u<1$**, includes the named degenerate boundaries, and has Layer 7's one-sided support-endpoint limits.
It supplements, not replaces, prior moments/transforms/cdfs.

| Real law | Required quantile |
| --- | --- |
| Gaussian $(m,v)$ | $`m+\sqrt v\,z(u)`$, including $v=0$ |
| Gamma $(a,r)$, $a,r>0$ | $G_a^{-1}(u)/r$ |
| Beta $(a,b)$, $a,b>0$ | $B_{a,b}^{-1}(u)$ |
| Exponential $r>0$ | $-\log(1-u)/r$ |
| Cauchy $(m,\gamma)$, $\gamma\ge0$ | $m+\gamma\tan(\pi(u-1/2))$ |
| Pareto threshold $t>0$, shape $r>0$ | $t(1-u)^{-1/r}$ |
| Uniform $a < b$ | $a+(b-a)u$ |
| Laplace $(m,b)$, $b>0$ | $m+b\log(2u)$ for $u\le1/2$; $m-b\log(2(1-u))$ otherwise |
| Log-normal $(m,v)$, $v\ge0$ | $`\exp(m+\sqrt v\,z(u))`$ |
| Weibull shape $k>0$, scale $a>0$ | $a(-\log(1-u))^{1/k}$ |
| Chi-squared $k\ge0$ | $2G_{k/2}^{-1}(u)$ for $k>0$; zero for $k=0$ |
| Inverse-gamma $(a,r)$, $a,r>0$ | $r/G_a^{-1}(1-u)$ |
| Fisher F $(m,n)$, $m,n>0$ | $(n/m)b/(1-b)$, $b=B_{m/2,n/2}^{-1}(u)$ |

For Student $\nu>0$, use $-\sqrt{\nu(1/b-1)}$ below $1/2$, with $b=B_{\nu/2,1/2}^{-1}(2u)$; above $1/2$ use the positive expression with $b=B_{\nu/2,1/2}^{-1}(2(1-u))$; the median quantile is zero.

**Discrete casts.** Bernoulli gives zero for $u\le1-p$, one otherwise, including $p=0,1$.
Geometric, $0 < p<1$, gives $\lceil\log(1-u)/\log(1-p)\rceil-1$; both $p=0,1$ give zero.
Poisson uses the least $k\in\mathbb N$ whose explicit cumulative sum reaches $u$, equivalently Layer 2's regularized-Gamma criterion; rate zero gives zero.
Binomial, negative binomial, and hypergeometric use least supported crossings of the specified finite/cumulative formulas, including incomplete-Beta forms.
Prove these explicit crossings, not merely restate real `sInf`.

**Other scalar laws.** Use the formulas and root/crossing characterizations in Layers 9–10 and 15.
Mixtures/compound Poisson use their explicit cdf and general adjunction, without unwarranted uniqueness or strict monotonicity.
Interval truncations use Layer 7 probability rescaling, including infinite bounds and atom corrections.
For $1\le k\le n$, the kth iid order-statistic quantile is

```math
Q_\mu\!\left(B_{k,n+1-k}^{-1}(u)\right).
```

Prove it by cdf composition and the adjunction; continuity of $\mu$ or $Q_\mu$ is unnecessary.

**Non-scalar coverage.** Require the following, never a joint quantile:
- Finite uniform/categorical: sort distinct supplied real labels, aggregate equal labels, and take cumulative crossings.
  Multinomial, Dirichlet-multinomial, and multivariate hypergeometric: coordinate Binomial/Beta-binomial/hypergeometric quantiles.
  Negative multinomial: coordinate and total negative-binomial quantiles.
  Dirichlet: Beta coordinates, with one-coordinate Dirac at one.
- Multivariate Gaussian/t, matrix normal, proper complex Gaussian: real linear-functional Gaussian/t quantiles, including zero variance/scale.
  Multivariate log-normal: coordinate and positive monomial quantiles; logistic-normal: log-ratio Gaussian quantiles.
- Sphere/ball: Beta coordinate/projection and ball-radius quantiles; the dimension-one sphere is two-point. vMF: mean-direction projection.
  Circle laws: the fixed angle chart.
- Wishart: diagonal laws $S_{ii}\chi_n^2$ or $S_{ii}\chi_\nu^2$ from congruence/Gaussian squares, including valid zero scales/degrees.
  Inverse-Wishart, $p>0$: diagonal quantile $(S_{ii}/2)/G_{(n-p+1)/2}^{-1}(1-u)$ for valid $S,n$, agreeing with inverse-gamma at $p=1$.
  LKJ entry/partial-correlation quantiles are in Layer 14.

**Check:** $Q(1/2)$ is a median, including atoms; no general median uniqueness claim.

### Layer 14: LKJ correlation-matrix laws

#### 14.1 Correlation coordinates

For $`J_p=\{(i,j):\mathrm{Fin}\ p\times\mathrm{Fin}\ p\mid j < i\}`$, reconstruct $R(x)$ from strict-lower coordinates by symmetry and diagonal ones.
Prove a measurable affine homeomorphism onto unit-diagonal symmetric matrices.
Define `correlationLebesgue p` by pushing coordinate product volume to Layer 6's symmetric carrier.
The positive-definite coordinate region is open, bounded, measurable, of positive finite volume; its closure is the PSD correlation region and its determinant-zero boundary is null.
Prove permutation and diagonal-sign-conjugation invariance.
At $p=0,1$, the reference measure is Dirac at identity.

#### 14.2 Partial correlations and normalization

Use **one-based** $1\le j < i\le p$ in these formulas, with the corresponding `Fin p` offset in Lean.
For $z_{ij}\in(-1,1)$,

```math
L_{ij}=z_{ij}\prod_{k < j}\sqrt{1-z_{ik}^2}\ (j < i),\quad
L_{ii}=\prod_{k < i}\sqrt{1-z_{ik}^2},\quad L_{ij}=0\ (j>i).
```

Prove $z\mapsto LL^{\mathsf T}$ is a smooth bijection to the positive-definite correlation region, with inverse from Cholesky, and

```math
\det R=\prod_{i>j}(1-z_{ij}^2),\quad
|J|=\prod_{i>j}(1-z_{ij}^2)^{(p-j-1)/2}.
```

For $\eta>0$, deduce the integral of $(\det R)^{\eta-1}$ is

```math
Z_p(\eta)=\prod_{j=1}^{p-1}B(1/2,\eta+(p-j-1)/2)^{p-j}.
```

Empty products are one at $p=0,1$.
These are ordinary correlation coordinates, without Frobenius rescaling.

#### 14.3 Law and moments

For $\eta>0$, `lkjMeasure p η` has density $(\det R)^{\eta-1}/Z_p(\eta)$ on the positive-definite region relative to `correlationLebesgue p`, zero elsewhere; for $\eta\le0$ it is zero measure.
Prove probability, almost-sure positive definiteness, topological support the PSD unit-diagonal region, and the shared `rnDeriv`/parameter/`HasLaw` API.
Do not claim full symmetric-volume absolute continuity in positive dimension.
At $\eta=1$ the law is uniform restricted correlation volume; at $p=0,1$ it is Dirac at identity.

Prove permutation/sign invariance, mean identity, and for $p\ge2$, $i\ne j$,
$(R_{ij}+1)/2\sim\mathrm{Beta}(\alpha,\alpha)$ with $\alpha=\eta+(p-2)/2$.
Distinct strict-lower entries have covariance zero and variance $1/(2\eta+p-1)$; diagonals are constant.
Prove joint independence of partial correlations, whose densities are
$(1-z^2)^{\beta_j-1}/B(1/2,\beta_j)$ on $(-1,1)$, $\beta_j=\eta+(p-j-1)/2$, equivalently $(z_{ij}+1)/2\sim\mathrm{Beta}(\beta_j,\beta_j)$.

Give independent-Beta constructions of LKJ and its Cholesky-factor law.
All natural mixed entry moments exist: expand through $LL^{\mathsf T}$ and evaluate finite products of powers of $z_{ij}$ and nonnegative half-integer powers of $1-z_{ij}^2$ by independence/Beta integrals.
Every real linear observable has domain `ℝ`; no general closed matrix transform.

#### 14.4 Marginals and quantiles

For $\eta>0$, a principal block of size $q\le p$ has `lkjMeasure q (η+(p-q)/2)`, including empty/singleton blocks.
For $0 < u<1$, off-diagonal quantiles are $2B_{\alpha,\alpha}^{-1}(u)-1$, diagonal quantiles one, and partial-correlation quantiles $2B_{\beta_j,\beta_j}^{-1}(u)-1$.
Prove endpoint limits through these product/marginal laws.

**Checks:** $p=2$ is symmetric Beta on the free correlation and $\eta=1$ is uniform on $(-1,1)$; independent-coordinate and density constructions have identical normalizer/determinant exponent.

### Layer 15: scalar stable laws

Use compensated compound-Poisson limits, not a process, general Lévy–Khintchine classification, or Bochner representation theorem.

#### 15.1 Parameters and exponent

Use `stableMeasure (α β : ℝ) (s : ℝ≥0) (m : ℝ)` in Nolan's **S₀** convention.
Valid shapes are $0<\alpha\le2$, $-1\le\beta\le1$.
Check shape validity first: invalid shapes give zero even at $s=0$; valid shapes and $s=0$ give $\delta_m$.
All probability/formula statements below assume valid shapes and their local hypotheses.
Measurability covers the entire totalized family; continuity only its valid domain.

Define $\Psi_{\alpha,\beta}(0)=0$ and for $u\ne0$,

```math
\Psi_{\alpha,\beta}(u)=\begin{cases}
-|u|^\alpha+i\beta\tan(\pi\alpha/2)(\mathrm{sign}(u)|u|^\alpha-u)&\alpha\ne1,\\
-|u|-i(2\beta/\pi)u\log|u|&\alpha=1.
\end{cases}
```

Prove $\varphi(t)=\exp(imt+\Psi_{\alpha,\beta}(st))$; invalid shapes instead have characteristic function zero.
Define `stableS1Location` $d=m-h_\alpha(\beta,s)$, where $h=0$ at $s=0$, and for $s>0$,

```math
h_\alpha(\beta,s)=\begin{cases}\beta s\tan(\pi\alpha/2)&\alpha\ne1,\\(2/\pi)\beta s\log s&\alpha=1.\end{cases}
```

Prove the S₁ characteristic-function interoperability formula without a parallel family.

#### 15.2 Existence

For $0<\alpha<2$, define $\nu$ with density zero at zero and otherwise

```math
\frac{\Gamma(1+\alpha)\sin(\pi\alpha/2)}\pi
\bigl((1+\beta)\mathbf1_{x>0}+(1-\beta)\mathbf1_{x<0}\bigr)|x|^{-1-\alpha}.
```

For $\varepsilon>0$, restrict to $|x|>\varepsilon$, prove positive finite mass, and form compound Poisson with that rate and normalized jump measure.
Translate by $`-\int\sin x\,d\nu_\varepsilon`$.
Prove its characteristic function is the exponential of the truncated compensated integral and prove, for every $t$,

```math
\int(e^{itx}-1-it\sin x)\,d\nu(x)=\Psi_{\alpha,\beta}(t).
```

Require absolute integrability: near zero the integrand is $O_t(x^2)$; away from zero it is bounded and the restriction of $\nu$ has finite mass.
Evaluate the logarithmic $\alpha=1$ case separately.

Along $\varepsilon_n=2^{-n}$, prove characteristic-function convergence to $e^\Psi$ and continuity at zero.
Use `MeasureTheory.isTightMeasureSet_of_tendsto_charFun` and `isCompact_closure_of_isTightMeasureSet` to obtain a limit in `ProbabilityMeasure ℝ`; identify its characteristic function by bounded-continuous integration and uniqueness by `Measure.ext_of_charFun`.
Package this existence bridge as a reusable lemma.
Apply `ProbabilityMeasure.tendsto_of_tendsto_charFun` **after** existence.
Handle $\alpha=2$ with Gaussian and obtain scale/location by affine pushforward.

#### 15.3 Transport and convolution

For $b\ne0$, $a+bX$ has parameters $(\alpha,\mathrm{sign}(b)\beta,|b|s,a+bm)$.
For valid shapes $b=0$ gives $\delta_a$; every affine pushforward of an invalid law stays zero.

For two valid laws of common $\alpha$, set $s=(s_1^\alpha+s_2^\alpha)^{1/\alpha}$.
If $s>0$, convolution parameters are

```math
\beta=\frac{\beta_1s_1^\alpha+\beta_2s_2^\alpha}{s_1^\alpha+s_2^\alpha},\qquad
m=d_1+d_2+h_\alpha(\beta,s).
```

Prove output shape validity, reflection, and independent-sum `HasLaw` corollaries.
Both zero scales give $\delta_{m_1+m_2}$.
Prove

```math
S_0(2,\beta,s,m)=N(m,2s^2),\quad S_0(1,0,s,m)=\mathrm{Cauchy}(m,s),\quad
S_0(1/2,1,s,m)=\mathrm{L\acute evy}(m-s,s)\ (s>0),
```

and the reflected Lévy identity; the shift $m-s$ is required.

#### 15.4 Density, support, and quantiles

For $s>0$, prove a bounded smooth density

```math
f(x)=\frac1{2\pi}\mathrm{Re}\,\int_{\mathbb R}e^{-itx}\varphi(t)\,dt.
```

Use $|\varphi(t)|=e^{-|st|^\alpha}$, polynomially weighted integrability, and existing Fourier inversion with the stated normalization.
Prove density-measure equality and positivity on the support interior.
Exact topological support is $[d,\infty)$ for $0<\alpha<1,\beta=1$, $(-\infty,d]$ for $0<\alpha<1,\beta=-1$, and `ℝ` otherwise, including fully skewed $\alpha\ge1$.

Give the density-integral cdf, strict increase on the support interior, and its unique interior-root quantile for $0 < u<1$, continuous/strictly increasing with finite or infinite endpoint limits.
At $s=0$ use Dirac cdf/quantile and singularity instead of `HasPDF`.
Prove joint measurability including invalid shapes and joint weak continuity on the valid domain, including $\alpha=1,2$ and $s=0$, not across invalid boundaries.

#### 15.5 Moments and tails

For $s>0$, $0<\alpha<2$, and real $q>0$, $|x|^q$ is integrable exactly when $q<\alpha$.
Mean is $d$ for $\alpha>1$; `id` is not integrable for $\alpha\le1$.
The second moment is non-integrable for every positive-scale non-Gaussian stable law.
Gaussian/Dirac cases reuse their moment APIs.

With $C_\alpha=\Gamma(\alpha)\sin(\pi\alpha/2)/\pi$, prove

```math
x^\alpha\mu((x,\infty))\to C_\alpha s^\alpha(1+\beta),\qquad
x^\alpha\mu((-\infty,-x))\to C_\alpha s^\alpha(1-\beta).
```

These are limits even when a constant is zero, not equivalence to the zero function; use them for moment finiteness/divergence.
For $\beta=0$, $0 < q<\alpha<2$,

```math
E[|X-m|^q]=\frac{s^q2^q\Gamma((1+q)/2)\Gamma(1-q/\alpha)}{\sqrt\pi\,\Gamma(1-q/2)}.
```

No general shifted/skewed fractional-moment closed form is required.

#### 15.6 Exponential integrability

For valid shapes, the exact domain is

```math
D=\begin{cases}
\mathbb R&s=0\text{ or }\alpha=2,\\
\{0\}&s>0,\alpha<2,|\beta|<1,\\
(-\infty,0]&s>0,\alpha<2,\beta=1,\\
[0,\infty)&s>0,\alpha<2,\beta=-1.
\end{cases}
```

The last two cases include $\alpha=1$.
For $|\beta|=1,s>0,\alpha<2,\beta t<0$,

```math
K(t)=\begin{cases}
dt-(s|t|)^\alpha/\cos(\pi\alpha/2)&\alpha\ne1,\\
dt-(2/\pi)\beta st\log|t|&\alpha=1.
\end{cases}
```

Prove $M=e^K$ on the domain and $K(0)=0$.
Gaussian and Dirac cgfs are $mt+s^2t^2$ and $mt$.
Prove one-sided exponential finiteness and Laplace formulas independently of zero polynomial-tail constants; any limit argument needs integrability control, not weak convergence alone.
Prove non-integrability off $D$.

**Checks:** compensated integral and S₁ conversion give the same S₀ exponent at all valid shapes; Gaussian/Cauchy/Lévy/reflected-Lévy specializations agree in location, scale, support, and domains; invalid-shape and zero-scale branches are distinguished throughout.

## Existing API to reuse

Use existing declarations directly; the following inventory complements the interfaces named in the layers.

| Area | Existing API |
| --- | --- |
| Scalar laws | `gaussianReal`, `gammaMeasure`, `betaMeasure`, `expMeasure`, `cauchyMeasure`, `paretoMeasure`, `poissonMeasure`, `geometricMeasure`, `binomial`, `bernoulliMeasure`, `pdf.IsUniform` under `Mathlib/Probability/Distributions/`; use real Gaussian as the elementary-API model. Reuse `rnDeriv_gaussianReal`, `charFun_map_cast_poissonMeasure`, `poissonMeasure_conv_poissonMeasure`, and `Poisson/PoissonLimitThm.lean`. |
| Gaussian | `stdGaussian`, `multivariateGaussian`, `charFun_multivariateGaussian`, `covarianceBilin_multivariateGaussian`, `measurePreserving_eval_multivariateGaussian`, `measurePreserving_restrict₂_multivariateGaussian`, `stdGaussian_eq_map_pi_orthonormalBasis`, `integral_id_multivariateGaussian` (all covariances), `measurable_multivariateGaussian`; also `IsGaussian`, `isGaussian_iff_charFunDual_eq`, `HasGaussianLaw`, and joint-Gaussian independence iff zero covariance. |
| Moments/transforms | `mgf`, `cgf`, `complexMGF`, `integrableExpSet`, `moment`, `centralMoment`, `variance`, `evariance`, `covariance`, `covarianceBilin`, and the analytic mgf theory in `Mathlib/Probability/Moments/MGFAnalytic.lean`; use `deriv_mgf_zero`/`iteratedDeriv_mgf_zero` when zero lies in the domain interior and `analyticOnNhd_complexMGF` for the stated holomorphic continuations. Reuse `iIndepFun.mgf_sum`, `charFun`/`charFunDual`, `Measure.ext_of_charFun`, `ProbabilityTheory.iIndepFun_iff_charFun_pi`, `IndepFun.charFun_map_add_eq_mul`. |
| Laws and constructions | `cdf` as a `StieltjesFunction`, `measure_cdf`, `Measure.eq_of_cdf`, `pdf`/`HasPDF`, `HasPDF.hasLaw`, `HasLaw`/`HasCondDistrib`, `Measure.withDensity`, `Measure.conv`/`MeasureTheory.Measure.conv_assoc`, `Measure.bind`/kernel composition, `iIndepFun`, `IndepFun`, `IdentDistrib`, `variance_sum`, `IndepFun.variance_sum`. |
| Tilting | `Mathlib/MeasureTheory/Measure/Tilted.lean` and `Mathlib/Probability/Moments/Tilted.lean`; no statistical exponential-family structure. |
| Special functions | `Real.Gamma`, `Complex.Gamma`, `ProbabilityTheory.beta`, `Complex.betaIntegral`, `Real.Gamma_add_one`, log-convexity/Bohr–Mollerup, and `integral_gaussian`. |
| Matrices | `Matrix.PosDef`/`PosSemidef`, `Matrix.IsHermitian.spectral_theorem`, `eigenvalues_pos`, `Matrix.IsHermitian.det_eq_prod_eigenvalues`, `Matrix.PosDef.det_pos`, `Matrix.det_one_add_mul_comm`, `CFC.sqrt`, Frobenius norm, `Matrix.IsLowerTriangular`, LDL, Schur complements, `selfAdjoint.submodule`, `Matrix.isHermitian_iff_isSelfAdjoint`, and additive-Haar infrastructure. Simplex weights use `Convexity.StdSimplex.map` and `p.weights`. |

**Change of variables.** Use `Mathlib/MeasureTheory/Function/Jacobian.lean` and `JacobianOneDim.lean`, specifically `map_withDensity_abs_det_fderiv_eq_addHaar`, `restrict_map_withDensity_abs_det_fderiv_eq_addHaar`, `lintegral_image_eq_lintegral_abs_det_fderiv_mul`, and `integral_image_eq_integral_abs_det_fderiv_smul`.
For exponential/log-normal, scalar inversion, Gamma–Beta, Dirichlet normalization, Cholesky, symmetric congruence, and symmetric inversion, supply source/target regions, injectivity, derivative determinant, and the resulting measure equality.
Arbitrary Haar normalization does not supply the Wishart constants.
Use `Mathlib/Analysis/Matrix/LDL.lean`, `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`, and `condDistrib_ae_eq_of_measure_eq_compProd` for the indicated matrix/conditional targets.

**Tau Ceti reuse.** Under `TauCeti/Probability/Distributions/`, `PDFInstances.lean` supplies `TauCeti.Probability.hasPDF_of_hasLaw_gammaMeasure` without positivity hypotheses; `Gaussian/Transforms.lean` supplies unconditional `TauCeti.integrableExpSet_inner_multivariateGaussian`; `Gaussian/Density.lean` supplies `TauCeti.hasPDF_of_hasLaw_multivariateGaussian` with source normalization inherited from `HasLaw`; and `Wishart/Basic.lean` supplies `TauCeti.wishartGramMeasure` and unconditional `ae_posSemidef_wishartGramMeasure`.

Reuse [`Gaussian/Pi.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Probability/Distributions/Gaussian/Pi.lean), especially `TauCeti.pi_gaussianReal_eq_withDensity`; [`GiryMonad.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/MeasureTheory/Measure/GiryMonad.lean) for `Measure.map_bind`/`Measure.bind_map`; [`Triangular.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/LinearAlgebra/Matrix/Triangular.lean) for diagonal/inverse lemmas; [`Wishart/Bartlett.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Probability/Distributions/Wishart/Bartlett.lean) for Cholesky coordinates; [`Moments/Determinacy.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Probability/Moments/Determinacy.lean) for exponential-moment determinacy; and `TauCeti/Probability/Quantile.lean` for the measure-level quantile and Layer 7's named foundations.

**Suggested files.** Put families in `TauCeti/Probability/Distributions/`, retaining existing names; use `Uniform.lean`, `PDFInstances.lean`, `Multinomial.lean`, `Dirichlet.lean`, `Gaussian/Multivariate.lean`, `Wishart.lean`, `Affine.lean`, `Truncation.lean`, and `CompoundPoisson.lean`.
Put cross-family relationships in `Relations.lean`, split by source family as needed.
Other locations are `TauCeti/Probability/GeneratingFunction.lean`, `TauCeti/Probability/Quantile.lean`, `TauCeti/Analysis/Matrix/Frobenius.lean`, `TauCeti/MeasureTheory/Measure/SymmetricMatrix.lean`, `TauCeti/LinearAlgebra/Matrix/Cholesky.lean`, and `TauCeti/Analysis/SpecialFunctions/` (`IncompleteGamma.lean`, `IncompleteBeta.lean`, `Erf.lean`, `MultivariateGamma.lean`, and the Bessel/Owen developments).

## Related work and design references

Follow the API shapes in [mathlib4#40613](https://github.com/leanprover-community/mathlib4/pull/40613)/[#40916](https://github.com/leanprover-community/mathlib4/pull/40916) (binomial mean/variance), [#35504](https://github.com/leanprover-community/mathlib4/pull/35504) (exponential moments/mgf/memorylessness), and [#34053](https://github.com/leanprover-community/mathlib4/pull/34053) (error functions; only the real API is required).
Consume declarations at the pin; otherwise implement matching Tau Ceti declarations and remove local duplicates when imports provide them.

Further design references are [#42461](https://github.com/leanprover-community/mathlib4/pull/42461) (lower quantile), [#43070](https://github.com/leanprover-community/mathlib4/pull/43070) and the [Bessel discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Bessel.20functions/with/611260325), [#42909](https://github.com/leanprover-community/mathlib4/pull/42909) (finite uniform measures), and [#42821](https://github.com/leanprover-community/mathlib4/pull/42821) (PMFs versus measures).
Reuse `Measure.quantile` rather than a competing functional spelling and `uniformOn` rather than a new PMF; retain Layer 8's Bessel representation and endpoint choices.
Build missing prerequisites without waiting for proposal acceptance.

[`SampCert`](https://github.com/leanprover/SampCert) (Apache 2.0) verifies integer Laplace/Gaussian samplers in [`SLang`](https://github.com/leanprover/SampCert/blob/main/SampCert/SLang.lean).
These integer laws are not the continuous `laplaceMeasure` or `gaussianReal`.
Cite it as related work; independently develop the integer measures here without porting samplers, proving privacy, or duplicating its programming interface.
[`statlib`](https://github.com/stat-lib/statlib) concerns frequentist inference and lies outside this scope; coordinate on Lean Zulip if work approaches that boundary.
Neither project supplies code for this roadmap.

## Boundaries with other roadmaps

- [Orthogonal L² bases](../../Completed/OrthogonalL2Bases/README.md) owns moment determinacy and Gaussian Hermite L² theory.
  Reuse Gaussian `Basic`, `Pi`, `PolynomialMemLp`, and the determinacy material; do not restate their targets.
- [Optimal transport](../OptimalTransport/README.md) owns Gaussian Brenier/W₂ formulas, interpolation, barycenters, their positive-definite square-root/geometric-mean identities, and quantile construction/measurability/uniform pushforward.
  This roadmap owns distributional densities, conditionals, affine laws, Cholesky, upper-quantile reflection, distribution formulas, parameter measurability, and inverse-function specializations.
  Optimal couplings and Wasserstein quantile identities remain there.
- [One-parameter semigroups](../OneParameterSemigroups/README.md) owns positive-definite functions and Bochner theory; there are no shared targets or dependencies.
  This roadmap computes named characteristic functions and constructs scalar stable laws internally.

Also excluded are general Lévy–Khintchine classification, domains of attraction, general phase-type theory, Brownian arcsine theorems, and random-matrix semicircle limits.
Their named scalar laws here have independent specifications.
Every bridge not supplied by a cited prerequisite remains a target here.

## Ordering and claim size

Build Layer 0, then Layer 1.
The remaining dependencies are:

| Layer | Prerequisites and ownership |
| --- | --- |
| 2–3 | Independent except Layer 3 closed cdfs need Layer 2 |
| 4 | Layers 1–3 |
| 5 | Gaussian density/affine/mixed-moment/conditional theory: Layer 0 and existing Gaussian API. Projected-norm chi-squared laws: 3–4. Other families: 0–2; Dirichlet normalization/stick-breaking: 4.3; spacings: 4.6. |
| 6 | Layers 3–5: chi-squared for Bartlett and one-dimensional laws, Gaussian squares for Gram, quadratic-form mgf for Gram transforms |
| 7 | Layers 0–1 and existing measure theory; quantiles import optimal transport; order-statistic transport uses 4. Family identities and continuity use their definitions. Layer 13 owns the inverse-Beta quantile specialization. |
| 8 | Inverses: 2; Bessel/Owen/zeta/theta: the entry's stated foundations |
| 9 | Layers 7–8 and the specified Beta, multinomial, Dirichlet, hypergeometric APIs |
| 10 | Layers 0–4, 7–8; noncentral laws use Poisson mixtures, not unrelated discrete families. Hyperexponential uses 9's categorical construction; arcsine/semicircle geometric identifications use 12, but their scalar definitions do not. |
| 11 | Gaussian/chi-squared, 7, scalar t; conditional t uses 5 conditionals. Log-normal uses directional transforms and logarithmic change of variables; logistic-normal uses 5's simplex charts. |
| 12 | Gaussian, chi, existing polar measure; then the relevant functions of 8 |
| 13 | Each cdf/marginal as available; inverse-Wishart diagonals use 6.8 |
| 14 | Beta/inverse Beta (1–2, 8), symmetric matrices/Cholesky (6), quantile transport (7); its own reference measure, Jacobian, normalization |
| 15 | Compound Poisson/affine (7), existing Gaussian/Cauchy, Lévy (10), and Mathlib tightness, Prokhorov, characteristic uniqueness, Fourier inversion; its compensated integral and existence bridge are explicit internal targets |

Claims may cover one construction, family with specializations, inverse-function development, or an explicitly dependent slice (definition/normalization/support; moments/transforms; cdf/quantiles; relationships).
Every listed target remains required: completing a claim does not complete unfinished family theory.
Generic results plus explicit family identifications may discharge specializations.
Treat conditional Gaussian, conditional t, multivariate-Gamma integration, real-degree Wishart Schur complements, and LKJ coordinates/Jacobian as separate claims.

## Declaration index

Suggested names for the principal declarations of each layer, in the style fixed under [Conventions](#conventions).
A name that an entry itself states is a binding API commitment; the rest are suggestions, and `Suggested.lean` shows possible forms.

- **Layer 0:** `hasPDF_of_hasLaw_withDensity`, `uniformMeasure`, `isProbabilityMeasure_uniformMeasure`, `integral_id_uniformMeasure`, `variance_id_uniformMeasure`, `charFun_uniformMeasure`, `measurable_gammaMeasure`, `measurable_poissonMeasure`.
- **Layer 1:** `integral_of_hasLaw_binomial`, `variance_of_hasLaw_binomial`, `mgf_id_expMeasure`, `memoryless_expMeasure`, `map_min_expMeasure`, `gammaMeasure_conv_gammaMeasure`, `integral_rpow_gammaMeasure`, `charFun_cauchyMeasure`, `not_integrable_id_cauchyMeasure`, `centralMoment_two_mul_gaussianReal`, `pgf`, `pgf_bernoulliMeasure`, `pgf_poissonMeasure`, `iteratedDeriv_pgf_zero`, `iteratedDeriv_pgf_one`, `measure_eq_of_pgf_eqOn`.
- **Layer 2:** `lowerIncompleteGamma`, `regularizedGamma`, `regularizedIncompleteBeta`, `Real.erf`, `Real.erfc`, `cdf_gaussianReal_eq`, `cdf_gaussianReal_zero`, `cdf_gammaMeasure_eq`, `cdf_betaMeasure_eq`, `binomial_tail_eq_regularizedIncompleteBeta`, `poissonMeasure_tail_eq_regularizedGamma`.
- **Layer 3:** `laplaceMeasure`, `charFun_laplaceMeasure`, `logNormalMeasure_map_exp`, `integral_pow_logNormalMeasure`, `chiSquaredMeasure`, `charFun_chiSquaredMeasure`, `weibullMeasure`, `variance_id_weibullMeasure`, `inverseGammaMeasure`, `studentTMeasure`, `integral_id_studentTMeasure`, `not_integrable_sq_studentTMeasure`, `fisherSnedecorMeasure`, `negativeBinomialMeasure`, `hypergeometricMeasure`.
- **Layer 4:** `map_sq_gaussianReal`, `hasLaw_sum_sq_gaussian`, `hasLaw_studentT_of_gaussian_chiSquared`, `hasLaw_fisherSnedecor_of_chiSquared`, `hasLaw_ratio_gaussian_cauchy`, `map_div_add_prod_gammaMeasure`, `bind_gammaMeasure_poissonMeasure`, `cdf_max_indep`, `cdf_max_iid`, `cdf_orderStatistic_iid`.
- **Layer 5:** `covMatrix`, `rnDeriv_multivariateGaussian`, `map_affine_multivariateGaussian`, `mgf_inner_toEuclideanLin_multivariateGaussian`, `condDistrib_multivariateGaussian`, `multinomialMeasure`, `dirichletMeasure`, `dirichletMeasure_marginal_beta`, `map_normalize_sum_pi_gammaMeasure`, `bind_poissonMeasure_multinomialMeasure`, `measurable_multivariateGaussian`.
- **Layer 6:** `symmetricCoordinates`, `symmetricLebesgue`, `symmetricLebesgue_zero`, `symmetricLebesgue_setOf_det_eq_zero`, `Matrix.frobeniusInnerProductSpace`, `volume_symmetricMatrix_eq_smul_symmetricLebesgue`, `symmetricCongruence`, `det_symmetricCongruence`, `map_symmetricCongruence_symmetricLebesgue`, `choleskyEquiv`, `choleskyHomeomorph`, `choleskyMeasurableEquiv`, `abs_det_fderiv_choleskyReconstruction`, `map_cholesky_symmetricLebesgue`, `map_inv_symmetricLebesgue`, `multivariateGamma`, `integral_posDef_multivariateGamma`, `nonsingularWishartMeasure`, `isProbabilityMeasure_nonsingularWishartMeasure`, `wishartGramMeasure`, `isProbabilityMeasure_wishartGramMeasure`, `wishartGramMeasure_zero`, `hasLaw_sum_vecMulVec_gaussian`, `wishartGramMeasure_conv_wishartGramMeasure`, `wishartGramMeasure_eq_nonsingularWishartMeasure`, `hasLaw_sum_vecMulVec_gaussian_nonsingularWishartMeasure`, `mutuallySingular_wishartGramMeasure_symmetricLebesgue`, `integral_id_nonsingularWishartMeasure`, `mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff`, `mgf_trace_mul_nonsingularWishartMeasure`, `cgf_trace_mul_nonsingularWishartMeasure`, `charFun_nonsingularWishartMeasure`, `mem_integrableExpSet_trace_mul_wishartGramMeasure_iff`, `mgf_trace_mul_wishartGramMeasure`, `cgf_trace_mul_wishartGramMeasure`, `charFun_wishartGramMeasure`, `bartlett_nonsingularWishartMeasure`, `inverseWishartMeasure`, `integral_id_inverseWishartMeasure`, `measurable_nonsingularWishartMeasure`, `measurable_wishartGramMeasure`, `hasLaw_reciprocal_inv_diagonal_nonsingularWishartMeasure`, `map_diagonal_inverseWishartMeasure`.
- **Layer 7:** `upperQuantile`, `atomMixture`, `convolutionPower`, `compoundPoissonMeasure`, `mixedPoissonMeasure`, `quantile_map_monotone`, `cdf_map_natCast`, `variance_mixedPoissonMeasure`, `variance_bind`, `tilted_gammaMeasure`, `quantile_map_affine_pos`, `quantile_map_affine_neg`, `quantile_cond_Ioc`, `charFun_compoundPoissonMeasure`.
- **Layer 8:** `Real.besselI`, `owensT`, `gaussianLatticeSum`, `inverseRegularizedGamma`, `inverseRegularizedIncompleteBeta`, `hasDerivAt_owensT_right`, `gaussianLatticeSum_eq_jacobiTheta₂`, `regularizedGamma_inverse`, `regularizedIncompleteBeta_inverse`.
- **Layer 9:** `uniformOn`, `categoricalMeasure`, `betaBinomialMeasure`, `dirichletMultinomialMeasure`, `multivariateHypergeometricMeasure`, `negativeHypergeometricMeasure`, `poissonBinomialMeasure`, `skellamMeasure`, `zipfMeasure`, `finiteZipfMeasure`, `yuleSimonMeasure`, `logarithmicSeriesMeasure`, `discreteLaplaceMeasure`, `discreteGaussianMeasure`, `negativeMultinomialMeasure`, `betaNegativeBinomialMeasure`, `map_coordinate_negativeMultinomialMeasure`, `cdf_orderStatistic_indep`, `map_coordinate_dirichletMultinomialMeasure`, `pgf_poissonBinomialMeasure`, `mgf_discreteGaussianMeasure`.
- **Layer 10:** `logisticMeasure`, `gumbelMeasure`, `generalizedExtremeValueMeasure`, `generalizedParetoMeasure`, `chiMeasure`, `nakagamiMeasure`, `noncentralChiSquaredMeasure`, `noncentralChiMeasure`, `noncentralTMeasure`, `noncentralFMeasure`, `betaPrimeMeasure`, `levyMeasure`, `inverseGaussianMeasure`, `truncatedNormalMeasure`, `skewNormalMeasure`, `irwinHallMeasure`, `batesMeasure`, `triangularMeasure`, `kumaraswamyMeasure`, `gompertzMeasure`, `logLogisticMeasure`, `generalizedGammaMeasure`, `generalizedNormalMeasure`, `asymmetricLaplaceMeasure`, `logitNormalMeasure`, `logUniformMeasure`, `halfStudentTMeasure`, `halfCauchyMeasure`, `noncentralBetaMeasure`, `hypoexponentialMeasure`, `hyperexponentialMeasure`, `arcsineMeasure`, `semicircleMeasure`, `integral_rpow_generalizedGammaMeasure`, `noncentralChiSquaredMeasure_zero_degree_mass`, `noncentralTMeasure_zero`, `quantile_generalizedExtremeValueMeasure`.
- **Layer 11:** `multivariateTMeasure`, `matrixCoordinateEquiv`, `matrixNormalMeasure`, `complexGaussianRealCovariance`, `properComplexGaussianMeasure`, `multivariateLogNormalMeasure`, `logisticNormalMeasure`, `logisticNormalMeasure_change_reference`, `covariance_matrixNormalMeasure`, `properComplexGaussianMeasure_centered_rotation`.
- **Layer 12:** `uniformSphereMeasure`, `uniformBallMeasure`, `vonMisesFisherNaturalMeasure`, `vonMisesFisherMeasure`, `circleHaarProbability`, `vonMisesMeasure`, `wrappedNormalMeasure`, `wrappedCauchyMeasure`, `wrappedCauchyMeasure_conv`, `map_direction_multivariateGaussian`, `vonMisesFisherMeasure_zero`, `wrappedNormalMeasure_conv`.
- **Layer 13:** `quantile_gammaMeasure`, `quantile_inverseGammaMeasure`, `quantile_studentTMeasure`, `quantile_fisherSnedecorMeasure`, `quantile_map_cast_geometricMeasure`, `quantile_multivariateTMeasure_projection`, `quantile_diagonal_inverseWishartMeasure`.
- **Layer 14:** `correlationCoordinates`, `correlationLebesgue`, `lkjNormalizer`, `lkjMeasure`, `isProbabilityMeasure_lkjMeasure`, `lkjMeasure_entry_beta`, `map_partialCorrelations_lkjMeasure`, `map_principalSubmatrix_lkjMeasure`, `quantile_entry_lkjMeasure`.
- **Layer 15:** `stableCharacteristicExponent`, `stableS1Location`, `stableMeasure`, `exists_probabilityMeasure_of_tendsto_charFun`, `charFun_stableMeasure`, `stableMeasure_conv`, `integrable_rpow_abs_stableMeasure_iff`, `integrableExpSet_stableMeasure`, `quantile_stableMeasure`.

## References

- J. P. Nolan, [*Univariate Stable Distributions: Models for Heavy Tailed Data*](https://doi.org/10.1007/978-3-030-52915-4), Springer, 2020 ([introductory chapter](https://edspace.american.edu/jpnolan/wp-content/uploads/sites/1720/2020/09/Chap1.pdf)); [SciPy stable distributions](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.levy_stable.html) records the `S₀` and `S₁` characteristic-function conventions.
- J. Aitchison and S. M. Shen, [*Logistic-normal distributions: Some properties and uses*](https://doi.org/10.1093/biomet/67.2.261), Biometrika 67(2), 261–272, 1980 (Gaussian log-ratio coordinates on the simplex).
- [R noncentral Beta documentation](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Beta.html) (ratio and Poisson-mixture conventions; the zero-numerator-shape extension is specified explicitly in Layer 10).
- N. L. Johnson, S. Kotz, N. Balakrishnan, *Continuous Univariate Distributions*, [vol. 1](https://books.google.com/books?vid=ISBN9780471584957) (1994) and [vol. 2](https://books.google.com/books?id=BTANEAAAQBAJ) (1995), 2nd ed., Wiley (the scalar continuous families and their transformations).
- N. L. Johnson, A. W. Kemp, S. Kotz, [*Univariate Discrete Distributions*](https://onlinelibrary.wiley.com/doi/book/10.1002/0471715816), 3rd ed., Wiley, 2005 (especially chs. 3–6 for binomial, Poisson, negative-binomial, and hypergeometric laws).
- R. J. Muirhead, [*Aspects of Multivariate Statistical Theory*](https://onlinelibrary.wiley.com/doi/book/10.1002/9780470316559), Wiley, 1982 ([ch. 2](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch2) for the matrix Jacobians of Layer 6; [ch. 3](https://onlinelibrary.wiley.com/doi/10.1002/9780470316559.ch3) for multivariate Gamma, the Wishart density and moment-generating function, and Bartlett decomposition).
- E. Mayerhofer, [*Reforming the Wishart characteristic function*](https://arxiv.org/abs/1901.09347), 2019 (the branch ambiguity in determinant-power formulas for the Wishart characteristic function).
- T. W. Anderson, [*An Introduction to Multivariate Statistical Analysis*](https://books.google.com/books?id=1Ts4nwEACAAJ), 3rd ed., Wiley, 2003 (conditional multivariate Gaussians).
- M. L. Eaton, [*Multivariate Statistics: A Vector Space Approach*](https://books.google.com/books?id=WyvvAAAAMAAJ), IMS Lecture Notes–Monograph Series 53 (vector-space Gaussians, invariant measures, and Wishart theory).
- *NIST Digital Library of Mathematical Functions*, [ch. 7](https://dlmf.nist.gov/7) (error functions, especially [§7.2](https://dlmf.nist.gov/7.2) and [§7.11](https://dlmf.nist.gov/7.11)) and [ch. 8](https://dlmf.nist.gov/8) (incomplete gamma and beta functions, especially [§8.2](https://dlmf.nist.gov/8.2) and [§8.17](https://dlmf.nist.gov/8.17)).
- P. Billingsley, [*Probability and Measure*](https://books.google.com/books?id=d27jzQEACAAJ), 3rd ed., Wiley, 1995 (measure-theoretic probability foundations).
- N. I. Fisher, *Statistical Analysis of Circular Data*, Cambridge University Press, 1993, and K. V. Mardia and P. E. Jupp, *Directional Statistics*, Wiley, 2000 (circle and sphere laws, reference measures, and directional moments).
- S. Coles, *An Introduction to Statistical Modeling of Extreme Values*, Springer, 2001 (GEV and generalized Pareto conventions and stability identities).
- A. Azzalini and A. Capitanio, *The Skew-Normal and Related Families*, Cambridge University Press, 2014 (skew-normal constructions and Owen's T).
- D. Tse and P. Viswanath, [*Fundamentals of Wireless Communication*, appendix A](https://web.stanford.edu/~dntse/papers/press_book.pdf), Cambridge University Press, 2005 (proper complex Gaussian conventions).
- *NIST Digital Library of Mathematical Functions*, [§10.25](https://dlmf.nist.gov/10.25), [§10.29](https://dlmf.nist.gov/10.29), and [§10.32](https://dlmf.nist.gov/10.32) (modified Bessel functions, recurrences, and integral representations).
- C. L. Canonne, G. Kamath, and T. Steinke, [*The Discrete Gaussian for Differential Privacy*](https://arxiv.org/abs/2004.00010), 2020 (integer Gaussian normalization and parameter conventions; privacy theorems are outside scope).
- E. W. Stacy, [*A Generalization of the Gamma Distribution*](https://doi.org/10.1214/aoms/1177704481), 1962 (gamma-power parameterization); [SciPy generalized gamma](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.gengamma.html) fixes the signed-power convention used here.
- F. Ouimet, [*Moments of the negative multinomial distribution*](https://arxiv.org/abs/2209.04733), 2022 (multivariate factorial moments).
- D. Lewandowski, D. Kurowicka, and H. Joe, [*Generating random correlation matrices based on vines and extended onion method*](https://doi.org/10.1016/j.jmva.2009.04.008), 2009 (LKJ normalization and partial-correlation construction); [Stan correlation-matrix distributions](https://mc-stan.org/docs/functions-reference/correlation_matrix_distributions.html) records the determinant-power convention.
- [SciPy beta-negative-binomial](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.betanbinom.html), [asymmetric Laplace](https://docs.scipy.org/doc/scipy/tutorial/stats/continuous_laplace_asymmetric.html), and [wrapped Cauchy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.wrapcauchy.html), and [PyMC logit-normal](https://www.pymc.io/projects/docs/en/stable/api/distributions/generated/pymc.LogitNormal.html) (distribution conventions; computation and inference interfaces are not targets).
