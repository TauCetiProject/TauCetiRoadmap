# Roadmap: standard probability distributions and their elementary theory

**Summary.** This roadmap builds the measure-level theory of the standard probability laws: some
fifty scalar continuous families (Gaussian, Gamma, Beta, Student, Fisher, the extreme-value and
noncentral laws among them), the discrete laws on `ℕ` and `ℤ`, the multivariate and matrix laws
(multivariate Gaussian and t, multinomial, Dirichlet, Wishart, matrix normal, complex Gaussian, LKJ
correlation matrices), the spherical and circular laws, and the scalar stable laws. Each law is a
measure on its native carrier, defined at every parameter value. For each, the roadmap proves that
it is a probability measure on the valid parameters and gives its density or masses, its measurable
dependence on the parameters, its moments with sharp integrability thresholds, its exact
exponential-integrability domain and named transforms, its cdf and quantiles, and its relations to
the other laws: sums, ratios, mixtures, extrema, conditioning and affine images.

Four results show its reach. If `(X₁, X₂)` is Gaussian with mean `(m₁, m₂)` and any positive
semidefinite covariance with blocks `Sᵢⱼ`, then for almost every `x₂` the law of `X₁` given
`X₂ = x₂` is Gaussian with mean `m₁ + S₁₂ S₂₂⁺ (x₂ − m₂)` and covariance `S₁₁ − S₁₂ S₂₂⁺ S₂₁`, where
`S₂₂⁺` is the Moore–Penrose pseudoinverse; the observed block need not be invertible. For `S`
positive definite and real `n > p − 1`, the Wishart law `W(n, S)` on symmetric `p × p` matrices has
the classical density; for natural `n ≥ p` it is the law of `∑ₖ Xₖ Xₖᵀ` for independent `N(0, S)`
vectors `X₁, …, Xₙ`; and (Bartlett) the Cholesky factor `T` of a `W(n, I)` matrix has independent
entries, with `Tᵢᵢ²` chi-squared of `n − i` degrees (rows counted from `0`) and standard Gaussian
entries below the diagonal. For `η > 0`, the LKJ law on `p × p` correlation matrices, with density
proportional to `(det R)^(η − 1)`, has independent partial correlations, each Beta distributed after
the map `z ↦ (z + 1)/2`, and `(Rᵢⱼ + 1)/2 ∼ Beta(η + (p − 2)/2, η + (p − 2)/2)` off the diagonal.
For `0 < α ≤ 2`, `|β| ≤ 1`, `s ≥ 0` and real `m` there is a probability law on `ℝ` with
characteristic function `exp(imt + Ψ_{α,β}(st))` in Nolan's S₀ convention; for `s > 0` and `α < 2`
it has a bounded smooth density, and for `q > 0`, `|x|^q` is integrable exactly when `q < α`.

Mathlib supplies the first laws (Gaussian, Gamma, Beta, exponential, Cauchy, Pareto, Poisson,
geometric, binomial) and the moment generating and characteristic functions; this roadmap completes
their theory before adding families. [OptimalTransport](../OptimalTransport/README.md) supplies the
quantile of a law on the line, on which the quantile results rest, and keeps the Gaussian transport
formulas. [OrthogonalL2Bases](../../Completed/OrthogonalL2Bases/README.md) owns moment determinacy,
which the log-normal counterexample shows cannot be dropped.
[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) builds statistical
inference on these laws, and [RandomMatrices](../RandomMatrices/README.md) starts from the Wishart
and uniform-ball laws.

Below, Layers 0–3 complete Mathlib's families and add the elementary new ones with the incomplete
Gamma and Beta functions and the error function; Layer 4 relates them; Layers 5 and 6 build the
multivariate Gaussian, multinomial and Dirichlet laws and the Wishart theory; Layer 7 gives the
generic operations (affine images, quantiles, conditioning, mixtures, compound Poisson laws, tilting,
hazards, weak continuity, biasing, stochastic order); Layer 8 adds special functions; Layers 9–12
add the discrete, scalar continuous, multivariate and spherical families; Layer 13 collects quantiles
and affine images of every family; Layers 14 and 15 build the LKJ and stable laws.

## How to read the build

The layers are areas of mathematics more than a single chain; each layer's `### Dependencies` says
exactly what it uses, and each section's *Needs:* line lists the inputs of its statement and of its
route, so that a target proved another way is not held behind an unrelated section. In outline:

| Area | Layers | Uses |
| --- | --- | --- |
| Shared interfaces and operations | 0, 4, 7 | Layer 0 rests on Mathlib's families; Layer 4 on Layers 0–3; Layer 7 on Layers 0–5 |
| Scalar analysis and special functions | 2, 8 | Layer 2 on Layers 0 and 1; Layer 8 on Layers 1, 2 and §7.2 |
| Scalar and discrete families | 1, 3, 9, 10, 13 | Layer 3 on Layers 0–2; Layer 9 on Layers 1, 3–5, 7 and 8; Layer 10 on Layers 0–4, 7, 8 and §9.1; Layer 13 on every family before it |
| Gaussian and multivariate laws | 5, 11 | Layer 5 on Layers 0, 1, 3 and 4; Layer 11 on Layers 1–3, 5, 7, 8 and 10 |
| Matrix laws | 6, 14 | Layer 6 on Layers 3–5; Layer 14 on Layers 1, 2, 6, 7 and 8 |
| Geometric and stable laws | 12, 15 | Layer 12 on Layers 0–2, 5, 7–10; Layer 15 on Layers 0, 1, 7 and §10.7 |

Within these, a few developments stand on their own and are best read as units: the covariance
pseudoinverse and the conditional Gaussian (§5.4), the conditional multivariate t (§11.1), the
multivariate Gamma integral (§6.3), the real-degree Schur complements of the Wishart law (§6.8),
the LKJ coordinates and Jacobian (§14.1–§14.2), and the existence, support and tails of the stable
laws (§15.2, §15.4, §15.5). Layer 13 gathers the quantile formulas of every scalar family and the
scalar observables of the others (§13.1–§13.4), the affine images of the named families (§13.5) and
the weak continuity of the families of Layers 9–11 (§13.6), because these need the families of
several earlier layers at once.

## Conventions

1. **Laws are measures on native carriers.** Every law of this roadmap is a `Measure` on its
   native carrier, given for all parameter values (totalized), and every statement about it is
   first a statement about the measure. Random-variable forms (`ProbabilityTheory.HasLaw`, `MeasureTheory.HasPDF`,
   `ProbabilityTheory.iIndepFun`) are corollaries on the same carrier. A law built from independent
   variables is the pushforward of a product measure, and a mixture is a `MeasureTheory.Measure.bind`.
   A named specialization of a family may inherit its theory through an explicit equality of
   measures and specialized theorems. The carriers are:

   | Carrier | Analytic interface |
   | --- | --- |
   | `ℝ` | `ProbabilityTheory.cdf`, moments, and the scalar transforms and domains each section asks for |
   | `ℕ`, `ℤ` | native masses, support, convolution and translations; real casts for analytic results and quantiles; only `ℕ` has a probability generating function, and bilateral series on `ℤ` carry explicit convergence domains |
   | finite real vectors | `EuclideanSpace ℝ ι`, the Bochner mean, the covariance matrix linked to `ProbabilityTheory.covarianceBilin`, and named real linear observables; count vectors stay on `ι → ℕ` until cast coordinatewise to `ℝ` |
   | symmetric matrices | `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)` with the subtype topology of the matrix product topology, the Frobenius pairing and the reference volume of Layer 6; transforms use real trace statistics and bundled symmetric arguments |
   | rectangular and complex Gaussian laws | the real-coordinate identifications of Layer 11; the complex covariance and the pseudocovariance are distinct |
   | sphere and circle | ambient embeddings or circle characters; real cdfs and quantiles use the angle chart of §12.3 |

   There is no cdf of a vector or matrix law, no matrix-valued mgf of the identity, and no joint
   multivariate quantile. The LKJ law of Layer 14 lives on correlation-coordinate volume, not on the
   full symmetric volume. For the inverse-Wishart law the roadmap asks for the mean, its
   non-integrability threshold and the diagonal marginals of §6.6 and §6.8, and no further
   covariance or transform theory.

2. **What every family carries.** For each law the roadmap asks, besides the formulas of its
   section:
   - the definition at every parameter value, the valid parameters, the boundary behaviour and the
     support;
   - probability under exactly the valid hypotheses, with the named probability boundaries;
   - a density or mass interface. A law with a density with respect to volume on a full-dimensional
     carrier has a real density (the naming pattern `fooPDFReal`), its `ℝ≥0∞` companion (`fooPDF`),
     the equality of the law with `volume.withDensity` of it, `MeasureTheory.HasPDF` for every
     variable with that law, and its Radon–Nikodym derivative; a law defined as a pushforward or
     mixture proves this equality on the parameter range where it is absolutely continuous. A law on
     a constrained carrier names its chart and its reference measure (surface or Haar measure on
     spheres and circles). A singular law has its singularity or Dirac theorem. A law with an atom
     exposes its atoms and its continuous part, and has no `MeasureTheory.HasPDF` theorem. A
     discrete law exposes its singleton masses, its support and its form as a weighted sum of Dirac
     masses;
   - parameter measurability: the map from parameters to laws is measurable for the Giry measurable
     structure on measures, for the whole totalized family; matrix parameters are coordinate
     functions read through `Matrix.of`, other parameters paired alongside; symmetric-matrix scale
     families have, in addition, the corresponding statement on the Borel symmetric carrier, so
     that a random scale gives a kernel; restricted to valid parameters this gives a Markov kernel;
   - the moments its section names, with their integrability and sharp thresholds;
   - the exact exponential-integrability domain of the identity (for scalar laws, always) and the
     transforms its section names;
   - the cdf and quantile formulas or characterizations of its scalar observables (Layer 13), and
     its distributional relationships and affine images (§7.1, §13.5).

3. **Notation.** In a section on a scalar law, `f`, `F`, `M`, `K`, `φ` and `D` are its real
   density, its cdf, its moment generating function `ProbabilityTheory.mgf id μ`, its cumulant
   generating function `ProbabilityTheory.cgf id μ`, its characteristic function
   `MeasureTheory.charFun μ`, and the exact set `ProbabilityTheory.integrableExpSet id μ` of `t`
   with `exp (t x)` integrable; for other carriers the section names the real observable. These are
   abbreviations in the text, not new Lean objects. The characteristic function has kernel
   `e^(i⟨t, x⟩)`, not the `2π`-normalized Fourier kernel. `G_a(x)` is the regularized lower
   incomplete Gamma function `TauCeti.regularizedGamma a x`, `I_x(a, b)` the regularized incomplete
   Beta function `TauCeti.regularizedIncompleteBeta a b x`, and `B(a, b)` the Beta function
   `ProbabilityTheory.beta a b`. The standard Gaussian density and cdf are `ϕ` and `Φ`, and its
   quantile is `z(u)`. For a simplex parameter `p`, `p_i` is `p.weights i`. `N(m, v)` and
   `N(m, S)` are Mathlib's `ProbabilityTheory.gaussianReal m v` and
   `ProbabilityTheory.multivariateGaussian m S`. `δ_c` is the Dirac mass at `c`. Within a
   section, a law is abbreviated by its family and parameters (`Bin(n, p)`, `Po(r)`, `Gamma(a, r)`,
   `Beta(a, b)`, `χ²_k`, `W(n, S)`, …) as that section or its layer introduction defines it.

4. **Casts, powers and branches.** Analytic formulas cast counts and dimensions to `ℝ` before
   dividing; real exponents are `Real.rpow`, and non-integer complex powers are the principal
   `Complex.cpow` where a section says so. Natural powers and factorials keep natural indices. The
   casts, the reference measures and the branch choices written in a section are part of its
   statement. Matrices act on Euclidean vectors through `Matrix.toEuclideanLin`; `S ⪰ 0` and
   `S ≻ 0` mean `S.PosSemidef` and `S.PosDef`, and `√S` is `CFC.sqrt S`.

5. **Hypotheses and totalization.** Each section's valid-parameter hypotheses govern its
   probability formulas unless it states a boundary or invalid case. The parameter types and the
   invalid-parameter behaviour of Mathlib's laws are kept; in particular `ProbabilityTheory.gammaMeasure`
   is not set to zero at invalid parameters. A new law defined by a density is zero outside its
   stated parameter range unless a boundary law is named. A pushforward or a mixture inherits a
   fallback value only where its section says so; otherwise its definition branches on the
   parameters before it is formed. Normalized finite weights are `Convexity.StdSimplex`; interval
   and nonnegative types are used where natural, and raw reals where the analysis or Mathlib's
   interface needs them.

6. **Moments and transforms.** Every moment formula comes with the integrability it needs, and
   every sharp threshold with non-integrability beyond it. Non-integrability is a statement about
   the integrand, never about an infinite value of a totalized real integral. A scalar law has its
   exact domain `D` even where no transform formula is asked for, and every `D` stated is exact. An
   mgf formula comes with its simplified cgf on `D` (for the Gamma law, `K(t) = −a log(1 − t/r)`).
   No closed form is asked for beyond those written: in particular the Beta law's
   confluent-hypergeometric transforms, the Bessel-`K` transforms of the inverse-gamma and
   Student t laws, and a closed mgf of the log-normal law are not part of the roadmap.

7. **Support and quantiles.** The almost-sure carrier, the positivity set of a chosen density or
   mass, and the topological support (the closed set of points every neighbourhood of which has
   positive measure) are distinct: a Gamma law of positive shape is almost surely positive and has
   topological support `[0, ∞)`. Every finite-valued quantile statement assumes `0 < u < 1` and
   valid parameters; statements at the endpoints are one-sided limits, not values of the totalized
   infimum. A quantile formula for a family follows from the generic results of §7.2 and a family
   identity, once the family's cdf, support and regularity are proved.

8. **Change of variables.** Densities of transformed laws come from Mathlib's change-of-variables
   theorems (`MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`,
   `MeasureTheory.restrict_map_withDensity_abs_det_fderiv_eq_addHaar`,
   `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`,
   `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`). Each use (the exponential and
   logarithm, scalar inversion, the Gamma–Beta map, Dirichlet normalization, Cholesky
   reconstruction, symmetric congruence and symmetric inversion) supplies its source and target
   regions, injectivity, the derivative determinant and the resulting equality of measures. An
   arbitrary normalization of Haar measure does not supply the Wishart constants: those are fixed
   by the reference measure of §6.1.

9. **Vocabulary and naming.** The roadmap works with `MeasureTheory.Measure`,
   `ProbabilityTheory.HasLaw`, `MeasureTheory.HasPDF`, `ProbabilityTheory.cdf`,
   `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.conv`, `ProbabilityTheory.cond`,
   `MeasureTheory.Measure.tilted`, `MeasureTheory.Measure.bind`, `ProbabilityTheory.Kernel` and
   Mathlib's transforms, and introduces no parallel abstraction and no new `PMF` version of a law:
   Mathlib's `PMF`s are connected to the measures, and the theory is developed on measures.
   Mathlib's Gaussian, Gamma-function, matrix-spectral and independence theory is used, not proved
   again. New names follow the patterns `fooMeasure`, `fooPDFReal`, `fooPDF`,
   `isProbabilityMeasure_fooMeasure`, `integral_id_fooMeasure`, `variance_id_fooMeasure`,
   `mgf_id_fooMeasure`, `charFun_fooMeasure` and `cdf_fooMeasure_eq`; an analytic statement about
   a discrete law names the cast law or has the form `…_of_hasLaw_…`.

10. **Names in code font.** A name in code font is either a declaration of the pinned Mathlib or Tau
    Ceti, written with its full namespace, or one of the few declarations of `Suggested.lean` (the
    headline theorems this roadmap states and the LKJ law), written without their namespace
    `TauCetiRoadmap.StandardDistributions`. A result the roadmap asks for that has neither is
    described in words. A layer that names a pinned declaration states with it the hypotheses and
    conclusion that are used.

## Layer 0: connect existing densities and add the uniform distribution

The scalar laws that Mathlib defines through a density (Gaussian, Gamma, Beta, exponential, Cauchy,
Pareto) are tied here to Mathlib's density notions: a variable with such a law has a density in the
sense of `MeasureTheory.HasPDF`, its pdf is the named density almost everywhere, and the
Radon–Nikodym derivative of the law against Lebesgue measure is that density. The layer adds the
interval uniform law, records the measurability of every family in its parameters for the Giry
measurable structure on measures, and fixes the Dirac package that the degenerate boundary laws of
later sections specialize.

### 0.1 Density interfaces

A law presented as `μ.withDensity f` with `f` almost everywhere measurable gives `MeasureTheory.HasPDF` to every
variable with that law (`TauCeti.Probability.hasPDF_of_hasLaw_withDensity`), and when `μ` is
σ-finite the pdf of such a variable is `f` almost everywhere
(`TauCeti.Probability.pdf_eq_of_hasLaw_withDensity`); neither statement asks anything of the
source measure. Every family statement below factors through these two bridges, on the parameter
range where the law is absolutely continuous (Billingsley). For a variable `X` on a measure space
`(Ω, P)`:

- **Gamma**, for all real shape `a` and rate `r`, with no positivity hypothesis: if `X` has law
  `ProbabilityTheory.gammaMeasure a r`, then `X` has a density
  (`TauCeti.Probability.hasPDF_of_hasLaw_gammaMeasure`) and its pdf is
  `ProbabilityTheory.gammaPDF a r` almost everywhere
  (`TauCeti.Probability.pdf_eq_gammaPDF_of_hasLaw_gammaMeasure`). Mathlib defines the Gamma law
  as `volume.withDensity (gammaPDF a r)` for every pair of real parameters, with the real-density
  form `TauCeti.Probability.gammaMeasure_eq_withDensity_ofReal`, and does not set it to zero
  outside `a, r > 0`.
- **Gaussian**: if `X` has law `ProbabilityTheory.gaussianReal m v` with `v ≠ 0`, then `X` has a
  density (`TauCeti.Probability.hasPDF_of_hasLaw_gaussianReal`); for every variance, including
  `v = 0`, its pdf is `ProbabilityTheory.gaussianPDF m v` almost everywhere
  (`TauCeti.Probability.pdf_eq_gaussianPDF_of_hasLaw_gaussianReal`), both sides vanishing almost
  everywhere at `v = 0` (`ProbabilityTheory.gaussianPDF_zero_var`).
- **Beta**, for all real `α, β`: `TauCeti.Probability.hasPDF_of_hasLaw_betaMeasure` and
  `TauCeti.Probability.pdf_eq_betaPDF_of_hasLaw_betaMeasure`, the pdf being
  `ProbabilityTheory.betaPDF α β`.
- **Exponential**, for every real rate: `TauCeti.Probability.hasPDF_of_hasLaw_expMeasure` and
  `TauCeti.Probability.pdf_eq_exponentialPDF_of_hasLaw_expMeasure`, the pdf being
  `ProbabilityTheory.exponentialPDF r`.
- **Cauchy**: if `X` has law `ProbabilityTheory.cauchyMeasure x₀ γ` with `γ ≠ 0`, then `X` has a
  density (`TauCeti.Probability.hasPDF_of_hasLaw_cauchyMeasure`); for every scale its pdf is
  `ProbabilityTheory.cauchyPDF x₀ γ` almost everywhere
  (`TauCeti.Probability.pdf_eq_cauchyPDF_of_hasLaw_cauchyMeasure`).
- **Pareto**, for all real threshold `t` and shape `r`:
  `TauCeti.Probability.hasPDF_of_hasLaw_paretoMeasure` and
  `TauCeti.Probability.pdf_eq_paretoPDF_of_hasLaw_paretoMeasure`, the pdf being
  `ProbabilityTheory.paretoPDF t r`.

*Needs:* Mathlib `MeasureTheory.HasPDF`, `MeasureTheory.pdf`, `ProbabilityTheory.HasLaw`,
`MeasureTheory.Measure.withDensity`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.expMeasure`,
`ProbabilityTheory.cauchyMeasure`, `ProbabilityTheory.paretoMeasure`; Tau Ceti
`TauCeti.Probability.hasPDF_of_hasLaw_withDensity`,
`TauCeti.Probability.pdf_eq_of_hasLaw_withDensity`.

**Checks.**

- The Gaussian law of variance `0` is the Dirac mass at `m`: it gives the point `m` mass `1`
  while Lebesgue measure gives it mass `0`, so no variable with this law has a density. A Gaussian
  density theorem stated without `v ≠ 0` would be false; the pdf identity survives at `v = 0`
  only because both sides vanish almost everywhere. The same holds for the Cauchy law at scale
  `0`.

### 0.2 Radon–Nikodym derivatives

The Radon–Nikodym derivative of each law against Lebesgue measure is its named density almost
everywhere, for every parameter value (Billingsley):

- Gamma: `TauCeti.Probability.rnDeriv_gammaMeasure` (`gammaPDF a r`, all real `a, r`);
- Beta: `TauCeti.Probability.rnDeriv_betaMeasure` (`betaPDF α β`);
- exponential: `TauCeti.Probability.rnDeriv_expMeasure` (`exponentialPDF r`);
- Pareto: `TauCeti.Probability.rnDeriv_paretoMeasure` (`paretoPDF t r`);
- Cauchy: `TauCeti.Probability.rnDeriv_cauchyMeasure` (`cauchyPDF x₀ γ`, every scale); at scale
  zero the law is `δ_x₀` (`ProbabilityTheory.cauchyMeasure_zero_scale`) and the derivative is `0`
  almost everywhere (`TauCeti.Probability.rnDeriv_cauchyMeasure_zero_scale`);
- Gaussian: `ProbabilityTheory.rnDeriv_gaussianReal` (`gaussianPDF m v`), including the zero
  variance case.

The withDensity cases follow from `MeasureTheory.Measure.rnDeriv_withDensity` and the
measurability of the densities.

*Needs:* Mathlib `MeasureTheory.Measure.rnDeriv`, `MeasureTheory.Measure.rnDeriv_withDensity`,
`ProbabilityTheory.rnDeriv_gaussianReal`, `ProbabilityTheory.cauchyMeasure_zero_scale`; §0.1.

**Checks.**

- At Cauchy scale `0` the law `δ_x₀` is a probability measure, yet its derivative against Lebesgue
  measure is `0` almost everywhere and integrates to `0`, not `1`: reading the Radon–Nikodym
  derivative as a density that always has total mass one fails exactly on the singular boundary.

### 0.3 Interval uniform

The interval uniform law is `TauCeti.Probability.uniformMeasure a b`, the conditional Lebesgue
measure `cond volume (Ioc a b)` (Mathlib `ProbabilityTheory.cond`). It is the zero measure when
`b ≤ a` (`TauCeti.Probability.uniformMeasure_eq_zero_of_le`) and a probability measure when `a < b`
(`TauCeti.Probability.isProbabilityMeasure_uniformMeasure`). For `a < b` (Johnson, Kotz and
Balakrishnan, vol. 2):

- its real density is `f(x) = (b − a)⁻¹` on `(a, b]` and `0` elsewhere
  (`TauCeti.Probability.uniformPDFReal`); its `ℝ≥0∞`-valued density is Mathlib's
  `MeasureTheory.pdf.uniformPDF (Ioc a b) · volume`, the two related by
  `TauCeti.Probability.uniformPDF_eq_ofReal_uniformPDFReal`; for all endpoints the law is
  `volume.withDensity` of it (`TauCeti.Probability.uniformMeasure_eq_withDensity`), a variable with
  this law has a density (`TauCeti.Probability.hasPDF_of_hasLaw_uniformMeasure`) whose pdf is the
  uniform density almost everywhere (`MeasureTheory.pdf.uniformPDF_eq_pdf`), and the
  Radon–Nikodym derivative of the law is that density (`TauCeti.Probability.rnDeriv_uniformMeasure`);
- its cdf is `0` for `x ≤ a`, `1` for `x ≥ b` and `(x − a)/(b − a)` for `a < x < b`
  (`TauCeti.Probability.cdf_uniformMeasure`);
- its mean is `(a + b)/2` and its variance `(b − a)²/12`
  (`TauCeti.Probability.integral_id_uniformMeasure`,
  `TauCeti.Probability.variance_id_uniformMeasure`);
- its topological support is `[a, b]` (`TauCeti.Probability.support_uniformMeasure`);
- `D = ℝ` for all endpoints (`TauCeti.Probability.integrableExpSet_id_uniformMeasure`); `M(0) = 1`
  and `M(t) = (e^(bt) − e^(at))/((b − a)t)` for `t ≠ 0`
  (`TauCeti.Probability.mgf_id_uniformMeasure_zero`, `TauCeti.Probability.mgf_id_uniformMeasure`),
  with cgf `K(0) = 0` and `K(t) = log((e^(bt) − e^(at))/((b − a)t))` for `t ≠ 0`
  (`TauCeti.Probability.cgf_id_uniformMeasure_zero`, `TauCeti.Probability.cgf_id_uniformMeasure`);
- `φ(0) = 1` and `φ(t) = (e^(ibt) − e^(iat))/(i(b − a)t)` for `t ≠ 0`
  (`TauCeti.Probability.charFun_uniformMeasure_zero`, `TauCeti.Probability.charFun_uniformMeasure`);
- every interval uniform law is an affine image of the unit one:
  `(uniformMeasure 0 1).map (x ↦ a + (b − a)x) = uniformMeasure a b`
  (`TauCeti.Probability.map_uniformMeasure_affine`).

For all endpoints, Mathlib's predicate `MeasureTheory.pdf.IsUniform X (Ioc a b) P volume` is by
definition the statement that `X` has law `cond volume (Ioc a b)`, so a variable has the uniform law
on `(a, b]` exactly when it is uniform on `Ioc a b` in Mathlib's sense; the direction from the law
is `TauCeti.Probability.isUniform_of_hasLaw_uniformMeasure`, the unit case being `a = 0`, `b = 1`.
The family is jointly measurable in its endpoints (`TauCeti.Probability.measurable_uniformMeasure`),
derived from the joint measurability of its density
(`TauCeti.Probability.measurable_uncurry_uniformPDF`).

*Needs:* Mathlib `ProbabilityTheory.cond`, `MeasureTheory.pdf.IsUniform`,
`MeasureTheory.pdf.uniformPDF`, `ProbabilityTheory.cdf`, `ProbabilityTheory.mgf`,
`ProbabilityTheory.cgf`, `MeasureTheory.charFun`, `ProbabilityTheory.integrableExpSet`,
`MeasureTheory.Measure.support`; §0.1.

**Checks.**

- The uniform law with endpoints `1` and `0` (in that order) is the zero measure, not the uniform
  law on `[0, 1]`: a definition through the unordered interval would make it a probability measure.
- For `t ≠ 0` the mgf `(e^(bt) − e^(at))/((b − a)t)` tends to `1` as `t → 0` (at `a = 0`, `b = 1`
  and `t = 10⁻⁶` it is `1.0000005`), matching `M(0) = 1`; a formula without the factor `b − a`
  would tend to `b − a`.
- For `a = −2`, `b = 2` the characteristic function at `t = 0.7` is `sin(2t)/(2t) ≈ 0.7039`, a
  real number, as it must be for a law symmetric about `0`; the `2π`-normalized Fourier kernel
  would give `sin(4πt)/(4πt)` instead.

### 0.4 Parameter measurability

Every family of Layers 0 and 1 is measurable in its parameters for the Giry measurable structure
on measures, jointly where it has several (Billingsley); the withDensity cases come from the joint
measurability of their densities in parameters and point:

- Gaussian: `ProbabilityTheory.measurable_gaussianReal` (in `(m, v) ∈ ℝ × ℝ≥0`), from
  `ProbabilityTheory.measurable_uncurry_gaussianPDF`;
- Gamma: `TauCeti.Probability.measurable_gammaMeasure`, from
  `TauCeti.Probability.measurable_uncurry_gammaPDF`;
- Beta: `TauCeti.Probability.measurable_betaMeasure`, from
  `TauCeti.Probability.measurable_uncurry_betaPDF`;
- exponential: `TauCeti.Probability.measurable_expMeasure`;
- Cauchy: `TauCeti.Probability.measurable_cauchyMeasure` (in `(x₀, γ) ∈ ℝ × ℝ≥0`), from
  `TauCeti.Probability.measurable_uncurry_cauchyPDF`;
- Pareto: `TauCeti.Probability.measurable_paretoMeasure`, from
  `TauCeti.Probability.measurable_uncurry_paretoPDF`;
- interval uniform: `TauCeti.Probability.measurable_uniformMeasure` (§0.3);
- Bernoulli, binomial and geometric: `TauCeti.Probability.measurable_bernoulliMeasure` (in
  `p ∈ [0, 1]`), `TauCeti.Probability.measurable_binomial` (in `(n, p) ∈ ℕ × [0, 1]`) and
  `TauCeti.Probability.measurable_geometricMeasure`;
- Poisson: `r ↦ poissonMeasure r` is measurable on `ℝ≥0`
  (`TauCeti.Probability.measurable_poissonMeasure`); composed with `Real.toNNReal` it is the form
  the Poisson mixtures of Layer 4 use.

*Needs:* Mathlib `MeasureTheory.Measure.instMeasurableSpace` (the Giry measurable structure),
`ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.geometricMeasure`,
`ProbabilityTheory.binomial`, `ProbabilityTheory.bernoulliMeasure`; §0.1, §0.3.

### 0.5 The Dirac package

The Dirac law `δ_c = MeasureTheory.Measure.dirac c` on `ℝ` has, for every real `c`:

- cdf `F(x) = 1` if `c ≤ x` and `0` otherwise (`TauCeti.Probability.cdf_dirac`);
- mean `c` and raw moments `cⁿ`, both from `∫ f dδ_c = f(c)` for every `f`
  (`MeasureTheory.integral_dirac`), and variance `0` (`ProbabilityTheory.variance_dirac`);
- `D = ℝ` (`TauCeti.Probability.integrableExpSet_dirac`), `M(t) = e^(tc)`
  (`ProbabilityTheory.mgf_dirac'`), `K(t) = tc` (`TauCeti.Probability.cgf_dirac'`) and
  `φ(t) = e^(itc)` (`MeasureTheory.charFun_dirac`).

These are stated once and specialized wherever a boundary law is a Dirac mass. The boundary
identities themselves stay explicit statements of their sections: the Gaussian of variance `0`
(`ProbabilityTheory.gaussianReal_zero_var`) and the Cauchy law of scale `0`
(`ProbabilityTheory.cauchyMeasure_zero_scale`) are `δ` at their centre, and the geometric law at
`p = 0` (§1.3), the Poisson law at rate `0` (§1.4), the log-normal law of variance `0` (§3.2), the
chi-squared law of degree `0` (§3.5) and the negative binomial law of shape `0` with `0 < p ≤ 1`
(§3.9) are identified with a Dirac mass there. The quantiles of a Dirac law belong to the generic
quantile theory of Layer 7. The `ℕ`-valued Dirac law, its cumulative masses and its probability
generating function are in §1.12.

*Needs:* Mathlib `MeasureTheory.Measure.dirac`, `MeasureTheory.integral_dirac`,
`ProbabilityTheory.variance_dirac`, `ProbabilityTheory.mgf_dirac'`, `MeasureTheory.charFun_dirac`;
Tau Ceti `TauCeti.Probability.cdf_dirac`, `TauCeti.Probability.integrableExpSet_dirac`,
`TauCeti.Probability.cgf_dirac'`.

**Checks.**

- The cdf of `δ_c` at `x = c` is `1`, by right continuity; a definition through `c < x` gives `0`
  there and is not a cdf.
- The mgf `e^(tc)` and cgf `tc` agree with the Gaussian formulas `e^(mt + vt²/2)` and
  `mt + vt²/2` at `v = 0`, `m = c`; a package with `K(t) = c` (dropping the factor `t`) would
  contradict `K(0) = 0`.

### Examples

- The uniform law on `(0, 1]` has cdf `1/4` at `x = 1/4`, mean `1/2`, variance `1/12` and
  `M(1) = e − 1`.
- The affine image `x ↦ 2 + 3x` of the unit uniform law is the uniform law on `(2, 5]`: its mean
  `2 + 3 · 1/2 = 7/2` is the midpoint of `[2, 5]`, and its variance `9 · 1/12 = 3/4` is
  `(5 − 2)²/12`.
- `δ_3` has cdf `0` at `2.9` and `1` at `3`, mgf `e^(3t)`, cgf `3t` and variance `0`.
- The Cauchy law of location `1` and scale `0` is `δ_1`: it has no density, its pdf and its
  Radon–Nikodym derivative vanish almost everywhere, and its cdf is the step at `1` from §0.5.

### Dependencies

Layer 0 uses no earlier layer. It rests on Mathlib's scalar families (the Gaussian, Gamma, Beta,
exponential, Cauchy, Pareto, Poisson, geometric, binomial and Bernoulli laws of
`Probability/Distributions/`), on Mathlib's density and conditioning notions
(`MeasureTheory.HasPDF`, `MeasureTheory.pdf`, `MeasureTheory.Measure.rnDeriv`,
`MeasureTheory.Measure.withDensity`, `MeasureTheory.pdf.IsUniform`, `ProbabilityTheory.cond`), on
Dirac measures and the Giry measurable structure on measures, and on Tau Ceti's density bridge, its
Dirac cdf and transforms, and its family modules for the uniform law and for the densities and
measurability of the Mathlib families.

## Layer 1: complete the elementary theory of existing distributions

The moments, transforms, cdfs and classical identities of the scalar and discrete families that
Mathlib defines, together with probability generating functions of `ℕ`-valued variables.
Discrete analytic statements are about the cast law on `ℝ`, `ν.map Nat.cast`, written `Bin(ℝ, n, p)`
and `Po(ℝ, r)` in Mathlib's notation, or about a variable with that law.

### 1.1 Cast cdf

For a probability measure `μ` on `ℕ` and its cast `μ.map Nat.cast` to `ℝ`, the cdf is `0` at every
`x < 0` (`MeasureTheory.Measure.cdf_map_natCast_of_neg`) and is `μ{k : k ≤ ⌊x⌋₊}` at every `x ≥ 0`
(`MeasureTheory.Measure.cdf_map_natCast`), where `⌊x⌋₊` is the natural floor. The negative branch
is a separate statement: the natural floor of a negative number is `0`. The integer analogue,
through the integer floor and with no sign split, is `MeasureTheory.Measure.cdf_map_intCast`.

*Needs:* Mathlib `ProbabilityTheory.cdf`, `MeasureTheory.Measure.map`, `Nat.floor`.

**Checks.**

- At `x = −1/2` the natural floor is `0`, so a formula without the negative branch would give the
  mass `μ{0}`, which is positive for the Poisson law; the cdf there is `0`.
- At `x = 2.7` the cdf is `μ{0, 1, 2}`, and at `x = 3` it jumps to `μ{0, 1, 2, 3}`: the cast cdf is
  right continuous with jumps at the naturals.

### 1.2 Bernoulli and binomial

Fix `p ∈ [0, 1]` and put `q = 1 − p` (Johnson, Kemp and Kotz, ch. 3). The real Bernoulli law on
`{0, 1}` is `ProbabilityTheory.bernoulliMeasure 1 0 p`, mass `p` at `1` and `q` at `0`
(`ProbabilityTheory.bernoulliMeasure_def`); it has mean `p` and variance `pq`
(`TauCeti.Probability.integral_id_bernoulliMeasure`,
`TauCeti.Probability.variance_id_bernoulliMeasure`, and for a variable with this law
`TauCeti.Probability.integral_of_hasLaw_bernoulliMeasure`,
`TauCeti.Probability.variance_of_hasLaw_bernoulliMeasure`), `M(t) = q + pe^t`
(`TauCeti.Probability.mgf_id_bernoulliMeasure`), cgf `log(q + pe^t)`
(`TauCeti.Probability.cgf_id_bernoulliMeasure`), `φ(t) = q + pe^(it)`
(`TauCeti.Probability.charFun_bernoulliMeasure`) and cdf `0` on `x < 0`, `q` on `[0, 1)` and `1`
on `x ≥ 1` (`TauCeti.Probability.cdf_bernoulliMeasure`).

The binomial law `ProbabilityTheory.binomial n p` on `ℕ` has masses `C(n, k) pᵏ q^(n−k)` for
`k ≤ n` (`ProbabilityTheory.binomial_real_singleton`), is the corresponding weighted Dirac sum
(`ProbabilityTheory.binomial_eq_sum_dirac`), and is `Ber(1, 0, p)` at `n = 1`
(`ProbabilityTheory.binomial_one_eq_bernoulliMeasure`). Its cast law `Bin(ℝ, n, p)` has, for every
`t` and with natural powers:

- mean `np` (`ProbabilityTheory.integral_of_hasLaw_binomial`, for any variable with this law) and
  variance `npq` (`TauCeti.Probability.variance_id_map_cast_binomial`,
  `TauCeti.Probability.variance_of_hasLaw_binomial`);
- `M(t) = (q + pe^t)ⁿ` (`TauCeti.Probability.mgf_id_map_cast_binomial`), cgf
  `log((q + pe^t)ⁿ)` (`TauCeti.Probability.cgf_id_map_cast_binomial`) and
  `φ(t) = (q + pe^(it))ⁿ` (`TauCeti.Probability.charFun_map_cast_binomial`).

Two native identities hold: for a fixed `p`, `Bin(n, p) ∗ Bin(m, p) = Bin(n + m, p)`
(`TauCeti.Probability.binomial_conv_binomial`), and the sum of a finite independent family of
`Ber(1, 0, p)` variables indexed by a type with `n` elements has law `Bin(n, p)`
(`TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli`). No general raw-moment formula is part of
this section. The binomial cumulative masses through the incomplete Beta function are in §2.4,
with the Bernoulli law as the case `n = 1`.

*Needs:* Mathlib `ProbabilityTheory.bernoulliMeasure`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `MeasureTheory.charFun`,
`ProbabilityTheory.variance`, `ProbabilityTheory.iIndepFun`; §1.1.

**Checks.**

- For `n = 2`, `p = 1/2` the masses are `1/4, 1/2, 1/4`, and `φ(π) = (1/2 + e^(iπ)/2)² = 0`
  agrees with `1/4 − 1/2 + 1/4`; with the `2π`-normalized kernel `e^(2πitx)` this zero would sit
  at `t = 1/2` instead.
- Convolution needs a common `p`: `Bin(1, 0) ∗ Bin(1, 1) = δ_0 ∗ δ_1 = δ_1`, while every
  `Bin(2, s)` gives `1` mass `2s(1 − s) ≤ 1/2`.

### 1.3 Geometric

Fix `p ∈ [0, 1]` and `q = 1 − p` (Johnson, Kemp and Kotz). Mathlib's
`ProbabilityTheory.geometricMeasure p` counts failures before the first success: for `p ≠ 0` it is
the weighted Dirac sum with masses `qᵏ p` (`ProbabilityTheory.geometricMeasure_eq`,
`ProbabilityTheory.geometricMeasure_real_singleton`), every mass being positive when `p ∉ {0, 1}`
(`ProbabilityTheory.geometricMeasure_real_singleton_pos`). At `p = 0` it is `δ_0`
(`TauCeti.Probability.geometricMeasure_zero`), and the Dirac package of §0.5 specializes: its cast
law has `D = ℝ`, `M ≡ 1`, `K ≡ 0`, `φ ≡ 1`, mean and variance `0`, and cdf `1` on `[0, ∞)`
(`TauCeti.Probability.integrableExpSet_id_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.mgf_id_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.cgf_id_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.charFun_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.integral_id_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.variance_id_map_cast_geometricMeasure_zero`,
`TauCeti.Probability.cdf_map_cast_geometricMeasure_zero`).

For `p ≠ 0` the cast law has:

- mean `q/p` and variance `q/p²` (`TauCeti.Probability.integral_id_map_cast_geometricMeasure`,
  `TauCeti.Probability.variance_id_map_cast_geometricMeasure`; for a variable with this law
  `TauCeti.Probability.integral_of_hasLaw_map_cast_geometricMeasure` and
  `TauCeti.Probability.variance_of_hasLaw_map_cast_geometricMeasure`);
- `D = {t : qe^t < 1}` (`TauCeti.Probability.integrableExpSet_id_map_cast_geometricMeasure`, from
  `TauCeti.Probability.integrable_exp_mul_id_map_cast_geometricMeasure_iff`),
  `M(t) = p/(1 − qe^t)` and `K(t) = log(p/(1 − qe^t))` on `D`
  (`TauCeti.Probability.mgf_id_map_cast_geometricMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_geometricMeasure`), and `φ(t) = p/(1 − qe^(it))` for every
  `t` (`TauCeti.Probability.charFun_map_cast_geometricMeasure`);
- cumulative masses `μ{k : k ≤ n} = 1 − q^(n+1)` and tails `μ{k : n ≤ k} = qⁿ`
  (`TauCeti.Probability.geometricMeasure_real_Iic`,
  `TauCeti.Probability.geometricMeasure_real_Ici`), and on the cast law the cdf
  `1 − q^(⌊x⌋₊ + 1)` for `x ≥ 0` (`TauCeti.Probability.cdf_map_cast_geometricMeasure`).

Memorylessness holds for every `p ∈ [0, 1]` in the division-free form
`μ{k : n + m ≤ k} = μ{k : n ≤ k} · μ{k : m ≤ k}` for all naturals `n, m`
(`TauCeti.Probability.geometricMeasure_memoryless`; `μ(ℕ) = 1` since the law is a probability
measure, `ProbabilityTheory.isProbabilityMeasure_geometricMeasure`). Its conditional form, that
under `μ` conditioned on `{k : n ≤ k}` the set `{k : n + m ≤ k}` has mass `μ{k : m ≤ k}`, holds
whenever the conditioning set has nonzero mass (`TauCeti.Probability.geometricMeasure_cond_Ici`),
which is automatic for `0 < p < 1`.

*Needs:* Mathlib `ProbabilityTheory.geometricMeasure`, `ProbabilityTheory.cond`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `MeasureTheory.charFun`,
`ProbabilityTheory.integrableExpSet`; §0.5, §1.1.

**Checks.**

- For `p = 1/2`: mean `1`, variance `2`, `μ{0} = μ{k : k ≤ 0} = 1 − 1/2 = 1/2`, and
  `D = (−∞, log 2)`. Counting trials instead of failures would give mean `2` and put no mass at
  `0`.
- At `p = 0` both sides of the memoryless identity are `1` when `n = m = 0` and `0` otherwise, so
  the division-free form holds on the Dirac boundary, where a quotient form would divide by `0`.

### 1.4 Poisson

For `r ∈ ℝ≥0`, Mathlib's `ProbabilityTheory.poissonMeasure r` is the weighted Dirac sum with
masses `e^(−r) rᵏ/k!` (`ProbabilityTheory.poissonMeasure_real_singleton`), summing to `1`
(`ProbabilityTheory.hasSum_one_poissonMeasure`), every mass positive when `r > 0`
(`ProbabilityTheory.poissonMeasure_real_singleton_pos`); at `r = 0` it is `δ_0`
(`TauCeti.Probability.poissonMeasure_zero`) (Johnson, Kemp and Kotz, ch. 4). Its cast law
`Po(ℝ, r)` has mean `r` and variance `r` (`TauCeti.Probability.integral_id_map_cast_poissonMeasure`,
`TauCeti.Probability.variance_id_map_cast_poissonMeasure`, and for a variable with this law
`TauCeti.Probability.integral_of_hasLaw_map_cast_poissonMeasure`,
`TauCeti.Probability.variance_of_hasLaw_map_cast_poissonMeasure`), `D = ℝ`
(`TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure`), `M(t) = exp(r(e^t − 1))` and
`K(t) = r(e^t − 1)` (`TauCeti.Probability.mgf_id_map_cast_poissonMeasure`,
`TauCeti.Probability.cgf_id_map_cast_poissonMeasure`), and
`φ(t) = exp(r(e^(it) − 1))` (`ProbabilityTheory.charFun_map_cast_poissonMeasure`). Native
additivity is `Po(r₁) ∗ Po(r₂) = Po(r₁ + r₂)` (`ProbabilityTheory.poissonMeasure_conv_poissonMeasure`,
with the variable form `ProbabilityTheory.IndepFun.hasLaw_add_poissonMeasure`). The tail and
cumulative masses through the incomplete Gamma function are in §2.4.

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.mgf`,
`ProbabilityTheory.cgf`, `MeasureTheory.charFun`, `ProbabilityTheory.integrableExpSet`;
§0.5, §1.1.

**Checks.**

- At `r = 0` the law is `δ_0`: mean and variance `0` and `M ≡ 1`, which the formulas
  `M(t) = exp(r(e^t − 1))` and `K(t) = r(e^t − 1)` give at `r = 0`.
- Mean and variance are both `r`; a parametrization by the mean inter-arrival time `1/r` would
  give mean `1/r`.

### 1.5 Exponential

For a rate `r > 0`, Mathlib's `ProbabilityTheory.expMeasure r` is `gammaMeasure 1 r`, with density
`re^(−rx)` on `x ≥ 0` (`ProbabilityTheory.exponentialPDF`); for `r ≤ 0` it is the zero measure
(`ProbabilityTheory.expMeasure_of_nonpos`) (Johnson, Kotz and Balakrishnan, vol. 1). For `r > 0`:

- mean `r⁻¹` and variance `r⁻²` (`TauCeti.Probability.integral_id_expMeasure`,
  `TauCeti.Probability.variance_id_expMeasure`);
- `D = (−∞, r)` (`TauCeti.Probability.integrableExpSet_id_expMeasure`), `M(t) = r/(r − t)` and
  `K(t) = log(r/(r − t))` for `t < r` (`TauCeti.Probability.mgf_id_expMeasure`,
  `TauCeti.Probability.cgf_id_expMeasure`), and `φ(t) = r/(r − it)`
  (`TauCeti.Probability.charFun_expMeasure`);
- memorylessness: for `s, t ≥ 0` the law conditioned on `(s, ∞)` gives `(s + t, ∞)` the mass
  `e^(−rt)` of `(t, ∞)` (`TauCeti.Probability.memoryless_expMeasure`), and the excess over `s`
  of the conditioned law is again `expMeasure r` (`TauCeti.Probability.map_sub_cond_expMeasure`);
- for rates `r, s > 0`, the minimum of the coordinates under the product law is exponential of
  rate `r + s` (`TauCeti.Probability.map_min_expMeasure`), so the minimum of independent
  exponential variables of rates `r` and `s` has rate `r + s`
  (`TauCeti.Probability.hasLaw_min_expMeasure_of_indepFun`);
- its topological support is `[0, ∞)` (`TauCeti.Probability.support_expMeasure`).

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.cond`,
`ProbabilityTheory.IndepFun`, `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`,
`MeasureTheory.charFun`; §0.1.

**Checks.**

- Rate `2` has mean `1/2` and variance `1/4`; the scale parametrization would give mean `2`.
- The minimum of independent exponentials of rates `1` and `2` has rate `3` and mean `1/3`, smaller
  than both means.

### 1.6 Gamma

For shape `a > 0` and rate `r > 0`, `ProbabilityTheory.gammaMeasure a r` has density
`r^a Γ(a)⁻¹ x^(a−1) e^(−rx)` on `x ≥ 0` and is a probability measure
(`ProbabilityTheory.isProbabilityMeasure_gammaMeasure`) (Johnson, Kotz and Balakrishnan, vol. 1).
For `a, r > 0`:

- mean `a/r` and variance `a/r²` (`TauCeti.Probability.integral_id_gammaMeasure`,
  `TauCeti.Probability.variance_id_gammaMeasure`);
- `D = (−∞, r)` (`TauCeti.Probability.integrableExpSet_id_gammaMeasure`, the boundary from
  `TauCeti.Probability.not_integrable_exp_mul_id_gammaMeasure`), `M(t) = (1 − t/r)^(−a)` and
  `K(t) = −a log(1 − t/r)` for `t < r` (`TauCeti.Probability.mgf_id_gammaMeasure`,
  `TauCeti.Probability.cgf_id_gammaMeasure`);
- `φ(t) = (1 − it/r)^(−a)` with the principal complex power
  (`TauCeti.Probability.charFun_gammaMeasure`): the base has real part `1`, so it stays off the
  branch cut, and the formula is the restriction to the imaginary axis of the complex mgf
  `(1 − z/r)^(−a)` on `Re z < r` (`TauCeti.Probability.complexMGF_id_gammaMeasure`);
- common-rate convolution adds shapes: `gammaMeasure a r ∗ gammaMeasure b r = gammaMeasure (a + b) r`
  for `a, b, r > 0` (`TauCeti.Probability.gammaMeasure_conv_gammaMeasure`);
- positive scaling divides the rate: for `c > 0`, the image of `gammaMeasure a r` under `x ↦ cx` is
  `gammaMeasure a (r/c)` (`TauCeti.Probability.gammaMeasure_map_const_mul`);
- its topological support is `[0, ∞)` (`TauCeti.Probability.support_gammaMeasure`), although the
  law is carried by `(0, ∞)` (`TauCeti.Probability.ae_pos_gammaMeasure`).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `Real.Gamma`, `ProbabilityTheory.complexMGF`,
`MeasureTheory.charFun`, `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`; §0.1.

**Checks.**

- At `a = 1` the mgf is `(1 − t/r)⁻¹ = r/(r − t)`, the exponential mgf of §1.5.
- For `X` of shape `a` and rate `r`, `2X` has rate `r/2` and mean `2a/r`; the rule for a scale
  parameter, `cX` of parameter `cr`, applied to the rate would give mean `a/(2r)`, a quarter of the
  true mean.

### 1.7 Beta

For `α, β > 0`, `ProbabilityTheory.betaMeasure α β` has density
`B(α, β)⁻¹ x^(α−1) (1 − x)^(β−1)` on `(0, 1)` (`ProbabilityTheory.betaPDF`) and is a probability
measure (`ProbabilityTheory.isProbabilityMeasureBeta`) (Johnson, Kotz and Balakrishnan, vol. 2).
For `α, β > 0`:

- mean `α/(α + β)` and variance `αβ/((α + β)²(α + β + 1))`
  (`TauCeti.Probability.integral_id_betaMeasure`, `TauCeti.Probability.variance_id_betaMeasure`);
- for every natural `n`, `E[Xⁿ] = Γ(α + n) Γ(α + β)/(Γ(α) Γ(α + β + n))`
  (`TauCeti.Probability.integral_pow_betaMeasure`);
- the bounded support gives `D = ℝ` (`TauCeti.Probability.integrableExpSet_id_betaMeasure`); no
  mgf or characteristic-function formula is part of this section;
- its topological support is `[0, 1]` (`TauCeti.Probability.support_betaMeasure`).

At `α = 0` the law is the zero measure (`TauCeti.Probability.betaMeasure_zero_left`).

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.beta`, `Real.Gamma`,
`ProbabilityTheory.integrableExpSet`; §0.1.

**Checks.**

- `α = β = 1` is the uniform law on `(0, 1)`: mean `1/2`, variance `1/12`, and
  `E[Xⁿ] = Γ(1 + n) Γ(2)/(Γ(1) Γ(2 + n)) = 1/(n + 1)` (at `n = 3`, `1/4`).

### 1.8 Cauchy

For a location `x₀ ∈ ℝ` and a scale `γ ∈ ℝ≥0`, `ProbabilityTheory.cauchyMeasure x₀ γ` is a
probability measure for every scale (`ProbabilityTheory.instIsProbabilityMeasure_cauchyMeasure`)
(Johnson, Kotz and Balakrishnan, vol. 1). For every `γ`, `φ(t) = e^(ix₀t − γ|t|)`
(`TauCeti.Probability.charFun_cauchyMeasure`). At `γ = 0` the law is `δ_x₀`
(`ProbabilityTheory.cauchyMeasure_zero_scale`) and the Dirac package of §0.5 specializes: cdf the
step at `x₀`, mean `x₀`, variance `0`, `D = ℝ`, `M(t) = e^(tx₀)`, `K(t) = tx₀`
(`TauCeti.Probability.cdf_cauchyMeasure_zero_scale`,
`TauCeti.Probability.integral_id_cauchyMeasure_zero_scale`,
`TauCeti.Probability.variance_id_cauchyMeasure_zero_scale`,
`TauCeti.Probability.integrableExpSet_id_cauchyMeasure_zero_scale`,
`TauCeti.Probability.mgf_id_cauchyMeasure_zero_scale`,
`TauCeti.Probability.cgf_id_cauchyMeasure_zero_scale`). For `γ > 0`:

- `F(x) = 1/2 + arctan((x − x₀)/γ)/π` (`TauCeti.Probability.cdf_cauchyMeasure_of_scale_ne_zero`);
- `D = {0}` (`TauCeti.Probability.integrableExpSet_id_cauchyMeasure`), and `id` is not integrable
  (`TauCeti.Probability.not_integrable_id_cauchyMeasure`).

For `n > 0` independent variables with the common law `cauchyMeasure x₀ γ`, their average has the
same law, including at `γ = 0` (`ProbabilityTheory.iIndepFun.hasLaw_average_cauchyMeasure`, for a
nonempty finite index type); no statement about an empty average is part of this section.

*Needs:* Mathlib `ProbabilityTheory.cauchyMeasure`, `MeasureTheory.charFun`,
`ProbabilityTheory.iIndepFun`, `ProbabilityTheory.integrableExpSet`; §0.5.

**Checks.**

- The average of two independent standard Cauchy variables has characteristic function
  `φ(t/2)² = (e^(−|t|/2))² = e^(−|t|)`, the standard Cauchy one: averaging does not shrink the scale,
  unlike the Gaussian case, where it divides the variance by `2`.
- `F(x₀) = 1/2` and `F(x₀ + γ) = 1/2 + arctan(1)/π = 3/4` for `γ > 0`, so the quartiles are
  `x₀ ± γ`; a parametrization by `γ²`, as for a variance, would put the upper quartile at
  `x₀ + √γ`.

### 1.9 Pareto

For a threshold `t > 0` and a shape `r > 0`, `ProbabilityTheory.paretoMeasure t r` has density
`r tʳ x^(−(r+1))` on `x ≥ t` and is a probability measure
(`ProbabilityTheory.isProbabilityMeasure_paretoMeasure`) (Johnson, Kotz and Balakrishnan, vol. 1).
For `t, r > 0`:

- `F(x) = 0` for `x < t` and `F(x) = 1 − (t/x)ʳ` for `x ≥ t`
  (`TauCeti.Probability.cdf_paretoMeasure_eq`);
- for `r > 1` the mean is `rt/(r − 1)` (`TauCeti.Probability.integral_id_paretoMeasure`), and for
  `r ≤ 1` the function `id` is not integrable (`TauCeti.Probability.not_integrable_id_paretoMeasure`;
  `TauCeti.Probability.integrable_id_paretoMeasure_iff` is the equivalence);
- for `r > 2` the variance is `rt²/((r − 1)²(r − 2))`
  (`TauCeti.Probability.variance_id_paretoMeasure`), and for `r ≤ 2` the function `x²` is not
  integrable (`TauCeti.Probability.not_integrable_sq_paretoMeasure`;
  `TauCeti.Probability.integrable_sq_paretoMeasure_iff`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_paretoMeasure`);
- its topological support is `[t, ∞)` (`TauCeti.Probability.support_paretoMeasure`).

*Needs:* Mathlib `ProbabilityTheory.paretoMeasure`, `ProbabilityTheory.variance`,
`ProbabilityTheory.integrableExpSet`; §0.1.

**Checks.**

- `t = 1`, `r = 3`: mean `3/2`, `E[X²] = 3`, variance `3 − 9/4 = 3/4 = 3/(2² · 1)`.
- `r = 2`: the mean `2t` is finite but `x²` is not integrable, so the variance threshold `r > 2` is
  sharp.

### 1.10 Real Gaussian

For `ProbabilityTheory.gaussianReal m v` with `m ∈ ℝ`, `v ∈ ℝ≥0` (Johnson, Kotz and Balakrishnan,
vol. 1), for every natural `n`:

- the even central moments are `E[(X − m)^(2n)] = vⁿ (2n − 1)!!`
  (`TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`, with the integral form
  `TauCeti.Probability.integral_sub_pow_two_mul_gaussianReal`), where `(−1)!! = 1`;
- the odd central moments vanish (`TauCeti.Probability.centralMoment_id_two_mul_add_one_gaussianReal`);
- the absolute central moments are `E[|X − m|ⁿ] = (2v)^(n/2) Γ((n + 1)/2)/√π`, with a real
  exponent `n/2` (`TauCeti.Probability.integral_abs_sub_pow_gaussianReal`).

Prove that for `v ≠ 0` the topological support of `gaussianReal m v` is `ℝ` (the density is
positive everywhere, `ProbabilityTheory.gaussianPDFReal_pos`; equivalently the cdf is strictly
increasing, `TauCeti.Probability.strictMono_cdf_gaussianReal`, and
`MeasureTheory.Measure.support_eq_univ_of_strictMono_cdf` applies). The cdf is in §2.4. Closed
forms for noncentral absolute moments are not part of this roadmap.

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.centralMoment`,
`Real.Gamma`, `Nat.doubleFactorial`, `MeasureTheory.Measure.support`; Tau Ceti
`TauCeti.Probability.strictMono_cdf_gaussianReal`,
`MeasureTheory.Measure.support_eq_univ_of_strictMono_cdf`.

**Checks.**

- `n = 1` and `n = 2` of the even formula give the variance `v` and the fourth central moment
  `3v²`.
- The absolute formula gives `E|X − m| = √(2v/π)` at `n = 1` (`≈ 0.7979` for `v = 1`) and
  `2v Γ(3/2)/√π = v` at `n = 2`; dropping the factor `2` in `(2v)^(n/2)` would give `v/2` at
  `n = 2`, half the variance.

### 1.11 Real-power moments

With valid parameters and real exponents through `Real.rpow`, the following hold, with the exact
integrability criteria (Johnson, Kotz and Balakrishnan, vol. 1 for Gamma and Pareto, vol. 2 for
Beta). The value of `x^q` at the null endpoint `0` does not affect them.

| Law and integrand | Value | Integrable exactly when |
| --- | --- | --- |
| Gamma `(a, r)`, `X^q` | `r^(−q) Γ(a + q)/Γ(a)` | `q > −a` |
| Beta `(a, b)`, `X^q (1 − X)^s` | `B(a + q, b + s)/B(a, b)` | `a + q > 0` and `b + s > 0` |
| Pareto `(t, r)`, `X^q` | `r t^q/(r − q)` | `q < r` |

The Gamma row is `TauCeti.Probability.integral_rpow_gammaMeasure` and
`TauCeti.Probability.integrable_rpow_gammaMeasure_iff` (for `a, r > 0`), the Beta row
`TauCeti.Probability.integral_rpow_mul_one_sub_rpow_betaMeasure` and
`TauCeti.Probability.integrable_rpow_mul_one_sub_rpow_betaMeasure_iff` (for `a, b > 0`), and the
Pareto row `TauCeti.Probability.integral_rpow_paretoMeasure` and
`TauCeti.Probability.integrable_rpow_paretoMeasure_iff` (for `t, r > 0`).

The natural-moment specializations: for Gamma, `E[Xⁿ] = Γ(a + n)/(Γ(a) rⁿ)` with `Xⁿ` integrable
for every `n` (`TauCeti.Probability.integral_pow_gammaMeasure`,
`TauCeti.Probability.integrable_pow_gammaMeasure`), and `E[X⁻ⁿ] = rⁿ Γ(a − n)/Γ(a)` exactly when
`n < a` (`TauCeti.Probability.integral_inv_pow_gammaMeasure`,
`TauCeti.Probability.integrable_inv_pow_gammaMeasure_iff`); for Beta, §1.7
(`TauCeti.Probability.integral_pow_betaMeasure`, `TauCeti.Probability.integrable_pow_betaMeasure`).
For Pareto with `t, r > 0`, prove that for every natural `n`, `Xⁿ` is integrable exactly when
`n < r`, and that then `E[Xⁿ] = r tⁿ/(r − n)`; the cases `n = 1, 2` are §1.9.

*Needs:* Mathlib `Real.rpow`, `Real.rpow_natCast`, `Real.Gamma`, `ProbabilityTheory.beta`; §1.6,
§1.7, §1.9.

**Checks.**

- `q = 1` in the three rows gives the means `a/r`, `a/(a + b)` and `rt/(r − 1)` of §1.6, §1.7 and
  §1.9; for `a = 3`, `r = 2` the Gamma value is `2⁻¹ Γ(4)/Γ(3) = 3/2`.
- At `q = −a` the Gamma integrand behaves like `x⁻¹` near `0` and is not integrable, so the strict
  inequality `q > −a` is needed; a criterion `q ≥ −a` would admit it.

### 1.12 Probability generating functions

For an `ℕ`-valued `X` on `(Ω, μ)` and real `z`, the probability generating function is
`TauCeti.Probability.pgf X μ z = ∫ ω, z^(X ω) ∂μ` (`TauCeti.Probability.pgf_def`), and
`pgf X μ (e^t) = mgf (X cast to ℝ) μ t` for every real `t` (`TauCeti.Probability.pgf_exp`)
(Johnson, Kemp and Kotz). On generating functions:

- **Independent sums.** For independent `X, Y` and real `z` with `z^X` and `z^Y` integrable,
  `pgf (X + Y) μ z = pgf X μ z · pgf Y μ z`, for any measure (`TauCeti.Probability.IndepFun.pgf_add`);
  under a finite measure, in particular a probability measure, and for almost everywhere
  measurable `X, Y`, the same holds for every `|z| ≤ 1` with no integrability hypothesis
  (`TauCeti.Probability.IndepFun.pgf_add_of_abs_le_one`), and likewise for finite independent
  families (`TauCeti.Probability.iIndepFun.pgf_sum`,
  `TauCeti.Probability.iIndepFun.pgf_sum_of_abs_le_one`). Totalization of the integral does
  not dispense with the integrability hypothesis.
- **Families.** For every real `z`, the Bernoulli, binomial and Poisson generating functions are
  `1 − p + pz`, `(1 − p + pz)ⁿ` and `e^(r(z − 1))` (`TauCeti.Probability.pgf_bernoulliMeasure`,
  `TauCeti.Probability.pgf_binomial`, `TauCeti.Probability.pgf_poissonMeasure`). For the geometric
  law with `p ≠ 0`, `z^X` is integrable exactly when `|(1 − p)z| < 1`
  (`TauCeti.Probability.integrable_pow_geometricMeasure_iff`), and there the pgf is
  `p/(1 − (1 − p)z)` (`TauCeti.Probability.pgf_geometricMeasure`); at `p = 0` it is identically
  `1` (`TauCeti.Probability.pgf_geometricMeasure_zero`).
- **The Dirac law on `ℕ`.** `δ_k` gives any set `s` the mass `1` if `k ∈ s` and `0` otherwise
  (`MeasureTheory.Measure.dirac_real_apply`), so its cumulative mass at `n` is `1` if `k ≤ n` and
  `0` otherwise. Prove that `pgf id δ_k z = z^k` for every real `z`.
- **Coefficients and uniqueness.** For every finite measure `ν` on `ℕ`, in particular every
  probability measure, the `n`-th derivative of `pgf id ν` at `0` is `n! ν{n}`
  (`TauCeti.Probability.iteratedDeriv_pgf_zero`), and two finite measures on `ℕ` whose generating
  functions agree on `(−1, 1)` are equal (`TauCeti.Probability.measure_eq_of_pgf_eqOn`).
- **Factorial moments.** Write `(k)ₙ = k(k − 1)⋯(k − n + 1)` for the falling factorial, `0` for
  `k < n` (`Nat.descFactorial`). If `ν` has a positive exponential moment, that is `e^(tk)` is
  `ν`-integrable for some `t > 0`, then the `n`-th derivative of `pgf id ν` at `1` is
  `∫ (k)ₙ dν(k)` (`TauCeti.Probability.iteratedDeriv_pgf_one`). Under a finite `n`-th moment only,
  the `n`-th derivative of `pgf id ν` at `z` tends to `∫ (k)ₙ dν(k)` as `z → 1` from below
  (`TauCeti.Probability.tendsto_iteratedDeriv_pgf_nhdsLT_one_of_integrable_pow_natCast`, for a
  finite measure); ordinary differentiability at `1` is not asserted.

The negative binomial generating function is in §3.9.

*Needs:* Mathlib `ProbabilityTheory.mgf`, `ProbabilityTheory.IndepFun`,
`ProbabilityTheory.iIndepFun`, `iteratedDeriv`, `Nat.descFactorial`, `MeasureTheory.Measure.dirac`,
`MeasureTheory.integral_dirac`; §1.2, §1.3, §1.4.

**Checks.**

- For the Poisson law the second derivative of `e^(r(z − 1))` at `z = 1` is `r²`, the second
  factorial moment `E[X(X − 1)]` (at `r = 1.7`, both are `2.89`); at `z = 0` the second derivative
  `r² e^(−r)` is `2! · P(X = 2)`.
- For the geometric law with `p = 1/2` the closed form `p/(1 − (1 − p)z)` is finite (`1/4`) at
  `z = −2`, but `z = −2` is outside the domain: `|(1 − p)z| = 1` and the series
  `∑ (1/2)^(k+1) (−2)^k` diverges. A domain read off the closed form would include it.
- `pgf X μ 1 = μ(Ω)`, which is `1` for a probability measure; for the zero measure the generating
  function is identically `0`, so the statements that need a probability or finite measure say so.

### Examples

- `Bin(3, 1/2)`: mean `3/2`, variance `3/4`, `M(t) = ((1 + e^t)/2)³`, mass `1/8` at `0`.
- The geometric law with `p = 1/3`: mean `2`, variance `(2/3)/(1/9) = 6`, and
  `μ{k : k ≤ 1} = 1 − (2/3)² = 5/9 = 1/3 + 2/9`.
- The Gamma law of shape `2` and rate `3`: mean `2/3`, variance `2/9`, `M(t) = (1 − t/3)^(−2)`
  for `t < 3`.
- The Pareto law with `t = 2`, `r = 4`: mean `8/3`, variance `16/18 = 8/9`, `E[X³] = 4 · 8/1 = 32`,
  and `X⁴` not integrable.
- For the Poisson law of rate `r`, the coefficient formula at `n = 1` gives
  `r e^(−r) = 1! · P(X = 1)`.

### Dependencies

Layer 1 uses Layer 0: the density identities of §0.1 for the moment integrals, and the Dirac package
of §0.5 for the geometric law at `p = 0`, the Poisson law at rate `0` and the Cauchy law at scale
`0`. Within the layer, §1.11 uses §1.6, §1.7 and §1.9, and §1.12 uses §1.2, §1.3 and §1.4. It rests
on Mathlib's scalar and discrete families, its moment and transform theory
(`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `ProbabilityTheory.complexMGF`,
`ProbabilityTheory.integrableExpSet`, `ProbabilityTheory.centralMoment`,
`ProbabilityTheory.variance`, `MeasureTheory.charFun`), `Real.Gamma` and
`ProbabilityTheory.beta`, independence and convolution of measures, and on Tau Ceti's cdf tools
for cast laws, its probability generating functions and its family modules.

## Layer 2: incomplete special functions and closed-form cdfs

The incomplete Gamma and Beta functions and the error function, and the closed-form cdfs and tails
they give. The complete Gamma function is Mathlib's `Real.Gamma` and the Beta function
`ProbabilityTheory.beta`. Write `G_s(x)` for the regularized lower incomplete Gamma function and
`I_x(a, b)` for the regularized incomplete Beta function.

### 2.1 Incomplete Gamma

The lower incomplete Gamma function is `TauCeti.lowerIncompleteGamma s x`, equal to
`∫ t in 0..max(x, 0), t^(s−1) e^(−t)` for `s > 0` and to `0` for `s ≤ 0`, and its regularization
is `TauCeti.regularizedGamma s x`, equal to `γ(s, x)/Γ(s)` for `s > 0` and to `0` for `s ≤ 0`
(`TauCeti.lowerIncompleteGamma_eq_integral`,
`TauCeti.lowerIncompleteGamma_eq_zero_of_nonpos_left`,
`TauCeti.lowerIncompleteGamma_eq_zero_of_nonpos_right`, `TauCeti.regularizedGamma_eq_div`,
`TauCeti.regularizedGamma_eq_zero_of_nonpos_left`) (DLMF ch. 8, §8.2). For `s > 0`:

- the integrand is interval integrable on every interval, the singularity at `0` included
  (`TauCeti.intervalIntegrable_rpow_mul_exp_neg`), and `γ(s, x) → Γ(s)` as `x → ∞`
  (`TauCeti.tendsto_lowerIncompleteGamma_atTop`), so `G_s(x) → 1`
  (`TauCeti.tendsto_regularizedGamma_atTop`);
- `γ(s, ·)` and `G_s` are continuous and monotone on `ℝ`, for every `s`
  (`TauCeti.continuous_lowerIncompleteGamma`, `TauCeti.continuous_regularizedGamma`,
  `TauCeti.lowerIncompleteGamma_monotone`, `TauCeti.regularizedGamma_monotone`), and strictly
  monotone on `[0, ∞)` (`TauCeti.strictMonoOn_lowerIncompleteGamma`,
  `TauCeti.strictMonoOn_regularizedGamma`);
- for `x ≥ 0`, `γ(s + 1, x) = s γ(s, x) − xˢ e^(−x)` (`TauCeti.lowerIncompleteGamma_add_one`),
  with the regularized form `G_(s+1)(x) = G_s(x) − xˢ e^(−x)/Γ(s + 1)`
  (`TauCeti.regularizedGamma_add_one`) (DLMF ch. 8);
- for `x > 0` the derivative of `γ(s, ·)` is `x^(s−1) e^(−x)`
  (`TauCeti.hasDerivAt_lowerIncompleteGamma`, and for `G_s`
  `TauCeti.hasDerivAt_regularizedGamma`); at `0` with `0 < s < 1` only continuity is asserted;
- `0 ≤ G_s ≤ 1`, with `G_s(x) > 0` exactly when `x > 0`
  (`TauCeti.regularizedGamma_nonneg`, `TauCeti.regularizedGamma_le_one`,
  `TauCeti.regularizedGamma_pos_iff`), and `G_1(x) = 1 − e^(−x)` for `x ≥ 0`
  (`TauCeti.regularizedGamma_one`).

*Needs:* Mathlib `Real.Gamma`, `intervalIntegral`, `Real.rpow`; Tau Ceti
`TauCeti.intervalIntegrable_rpow_mul_exp_neg`.

**Checks.**

- `G_1(x) = 1 − e^(−x)` for `x ≥ 0`, the exponential cdf of rate `1`.
- At `s = 1`, `x = 1.3` the recurrence gives `γ(2, x) = 1 − e^(−x) − xe^(−x) ≈ 0.37318`, which is
  `∫₀ˣ te^(−t) dt`; the opposite sign `+ xˢe^(−x)` would give `≈ 1.0818`, larger than
  `Γ(2) = 1`.
- At `s = 1/2` the derivative `x^(−1/2) e^(−x)` is unbounded as `x → 0⁺`, so `γ(1/2, ·)` has no
  derivative at `0`; only continuity holds there.

### 2.2 Incomplete Beta

For `a, b > 0`, the regularized incomplete Beta function `TauCeti.regularizedIncompleteBeta a b x`,
written `I_x(a, b)`, is the integral of `t^(a−1) (1 − t)^(b−1)/B(a, b)` from `0` to
`min(1, max(x, 0))` (`TauCeti.regularizedIncompleteBeta_def_of_pos`, and on `[0, 1]`
`TauCeti.regularizedIncompleteBeta_def_of_mem_Icc`) (DLMF ch. 8, §8.17). Outside the positive
range it is `0`, except that `I_x(0, b) = 1` for `b > 0` and `x ≥ 0`
(`TauCeti.regularizedIncompleteBeta_zero_left`); it is `0` for `a < 0`
(`TauCeti.regularizedIncompleteBeta_eq_zero_of_neg_left`) and for `b ≤ 0`, in particular at
`b = 0` (`TauCeti.regularizedIncompleteBeta_eq_zero_of_nonpos_right`). The value at `a = 0`
records the cdf of the boundary law `δ_0`, and makes the binomial tail formula of §2.4 include
`m = 0` (with `p = 0` as well); the unused alternative at `b = 0` would represent `δ_1`.

For `a, b > 0`:

- `I_x(a, b)` is continuous on `ℝ` (`TauCeti.continuous_regularizedIncompleteBeta`), monotone on
  `ℝ` for all parameters (`TauCeti.regularizedIncompleteBeta_monotone`), strictly monotone on
  `[0, 1]` (`TauCeti.strictMonoOn_regularizedIncompleteBeta`), and takes values in `[0, 1]`
  (`TauCeti.regularizedIncompleteBeta_nonneg`, `TauCeti.regularizedIncompleteBeta_le_one`);
- it is `0` for `x ≤ 0` when `a ≠ 0` (`TauCeti.regularizedIncompleteBeta_eq_zero_of_nonpos`), `0`
  for `x < 0` for all parameters (`TauCeti.regularizedIncompleteBeta_eq_zero_of_neg`), and `1` for
  `x ≥ 1` when `a ≥ 0` (`TauCeti.regularizedIncompleteBeta_eq_one_of_one_le`);
- on `(0, 1)` its derivative is `x^(a−1) (1 − x)^(b−1)/B(a, b)`
  (`TauCeti.hasDerivAt_regularizedIncompleteBeta`);
- reflection: `I_x(a, b) = 1 − I_(1−x)(b, a)` (`TauCeti.regularizedIncompleteBeta_symm`, stated for
  every real `x`, so for `0 ≤ x ≤ 1` in particular); it is not extended to the atomic boundary
  edges `a = 0` or `b = 0`;
- recurrence: for `0 ≤ x ≤ 1`, `I_x(a + 1, b) = I_x(a, b) − xᵃ (1 − x)ᵇ/(a B(a, b))`
  (`TauCeti.regularizedIncompleteBeta_add_one_left`) (DLMF, equation 8.17.20), with the companion
  `I_x(a, b + 1) = I_x(a, b) + xᵃ (1 − x)ᵇ/(b B(a, b))`
  (`TauCeti.regularizedIncompleteBeta_add_one_right`);
- at a unit parameter, `I_x(a, 1) = xᵃ` and `I_x(1, b) = 1 − (1 − x)ᵇ` on `[0, 1]`
  (`TauCeti.regularizedIncompleteBeta_one_right`, `TauCeti.regularizedIncompleteBeta_one_left`).

*Needs:* Mathlib `ProbabilityTheory.beta`, `intervalIntegral`, `Real.rpow`; Tau Ceti
`TauCeti.intervalIntegrable_rpow_mul_one_sub_rpow`, `TauCeti.integral_rpow_mul_one_sub_rpow`.

**Checks.**

- `I_x(1, 1) = x` on `[0, 1]` (the uniform cdf), and the recurrence gives
  `I_x(2, 1) = x − x(1 − x)/(1 · B(1, 1)) = x²`, agreeing with the unit-parameter value
  `I_x(a, 1) = xᵃ` at `a = 2`; a recurrence with `+` in place of `−` would give `2x − x²`.
- Reflection at `a = 1`, `b = 2`: `I_x(1, 2) = 1 − (1 − x)²` and `I_(1−x)(2, 1) = (1 − x)²`, whose
  sum is `1`.
- `I_0(0, b) = 1` is the cdf of `δ_0` at `0`; with the default value `0` at `a = 0` the binomial
  tail `P(X ≥ 0) = 1` would come out as `0`.

### 2.3 Error functions

The error function is `TauCeti.Real.erf x = (2/√π) ∫ t in 0..x, e^(−t²)` and the complementary
error function `TauCeti.Real.erfc x = 1 − erf x` (`TauCeti.Real.erf_def`, `TauCeti.Real.erfc_def`)
(DLMF ch. 7, §7.2). Then:

- erf is odd (`TauCeti.Real.erf_neg`), with `erf 0 = 0` (`TauCeti.Real.erf_zero`);
- its derivative is `(2/√π) e^(−x²)` at every `x` (`TauCeti.Real.hasDerivAt_erf`), and erfc has
  the opposite derivative (`TauCeti.Real.hasDerivAt_erfc`);
- erf is strictly increasing (`TauCeti.Real.strictMono_erf`) and erfc strictly decreasing
  (`TauCeti.Real.strictAnti_erfc`);
- `erf x → 1` as `x → ∞` and `erf x → −1` as `x → −∞` (`TauCeti.Real.tendsto_erf_atTop`,
  `TauCeti.Real.tendsto_erf_atBot`), with `erfc → 0` and `erfc → 2` at `±∞`
  (`TauCeti.Real.tendsto_erfc_atTop`, `TauCeti.Real.tendsto_erfc_atBot`);
- for `x ≥ 0`, `erf x = G_(1/2)(x²)` (`TauCeti.Real.erf_eq_regularizedGamma_half_sq`) (DLMF §7.11).

*Needs:* Mathlib `intervalIntegral`, `Real.exp`, `Real.sqrt`; §2.1.

**Checks.**

- `erf 0 = 0`.
- `erf 1 ≈ 0.842701`, and `G_(1/2)(1) = γ(1/2, 1)/Γ(1/2) ≈ 0.842701`; the derivative at `0` is
  `2/√π ≈ 1.1284`. Without the factor `2/√π` the limit at `∞` would be `√π/2` instead of `1`.

### 2.4 Cdfs and tails

With valid family parameters, for every real `x` (Johnson, Kotz and Balakrishnan, vol. 1 and
vol. 2; Johnson, Kemp and Kotz, chs. 3 and 4):

- **Gaussian.** For `v ≠ 0`, `F(x) = (1 + erf((x − m)/√(2v)))/2`
  (`TauCeti.Probability.cdf_gaussianReal_eq`); at `v = 0`, `F(x) = 1` if `m ≤ x` and `0` otherwise
  (`TauCeti.Probability.cdf_gaussianReal_zero`).
- **Gamma.** For `a, r > 0`, `F(x) = G_a(rx)` (`TauCeti.Probability.cdf_gammaMeasure_eq`), the
  special function vanishing below the support.
- **Beta.** For `α, β > 0`, `F(x) = I_x(α, β)` (`TauCeti.Probability.cdf_betaMeasure_eq`), the
  clamping of `I_x` giving `0` below `0` and `1` above `1`.
- **Binomial tail.** For naturals `m ≤ n` and `p ∈ [0, 1]`,
  `Bin(n, p){k : m ≤ k} = I_p(m, n − m + 1)`
  (`TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta`), the case `m = 0` resting on
  the boundary value of §2.2; the cumulative form is
  `Bin(n, p){k : k ≤ m} = I_(1−p)(n − m, m + 1)`
  (`TauCeti.Probability.binomial_cumulative_eq_regularizedIncompleteBeta`).
- **Poisson tail.** For `r ∈ ℝ≥0` and natural `n`, `Po(r){k : n < k} = G_(n+1)(r)`
  (`TauCeti.Probability.poissonMeasure_tail_eq_regularizedGamma`), with cumulative masses
  `1 − G_(n+1)(r)` (`TauCeti.Probability.poissonMeasure_real_Iic`) and the cast cdf
  `1 − G_(⌊x⌋₊+1)(r)` for `x ≥ 0` (`TauCeti.Probability.cdf_map_cast_poissonMeasure`).

*Needs:* Mathlib `ProbabilityTheory.cdf`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.poissonMeasure`; §0.5, §1.1, §1.2, §1.4, §1.6, §1.7, §1.10, §2.1, §2.2,
§2.3.

**Checks.**

- At `v = 0` the law is `δ_m` and `F(m) = 1`, while `(1 + erf(0))/2 = 1/2`; the cdfs of positive
  variance all equal `1/2` at `m`, so the degenerate case cannot be reached by continuity in `v`
  at `x = m` and needs its own statement.
- For `a = 1` the Gamma formula gives `G_1(rx) = 1 − e^(−rx)` for `x ≥ 0`, the exponential cdf of
  rate `r`; reading `r` as a scale, `G_1(x/r)`, would give `1 − e^(−x/r)`.
- `Bin(2, 1/2)`: `P(X ≥ 1) = 3/4 = I_(1/2)(1, 2) = 1 − (1/2)²`.
- At `n = 0` the Poisson tail is `P(X > 0) = 1 − e^(−r) = G_1(r)`, the check of §2.1.

### Examples

- `G_1(x) = 1 − e^(−x)` for `x ≥ 0` is the cdf of the exponential law of rate `1`.
- `I_x(1, 1) = x` and, by the recurrence, `I_x(2, 1) = x²` on `[0, 1]`.
- `Bin(3, 1/2)`: `P(X ≥ 2) = 1/2 = I_(1/2)(2, 2)`, the value at `1/2` of the cdf of the symmetric
  Beta law of parameters `2, 2`.
- For the Poisson law of rate `r`, `P(X > 1) = G_2(r) = 1 − e^(−r)(1 + r)`, which is
  `1 − P(X = 0) − P(X = 1)`.
- The standard Gaussian cdf at `0` is `(1 + erf 0)/2 = 1/2`.

### Dependencies

Layer 2 uses Layer 1 for the families whose cdfs §2.4 computes (§1.2, §1.4, §1.6, §1.7, §1.10) and
the cast cdf of §1.1, and Layer 0 for the Gaussian law at variance `0` (§0.5). Within the layer,
§2.3 uses §2.1, and §2.4 uses §2.1, §2.2 and §2.3. It rests on Mathlib's `Real.Gamma`,
`ProbabilityTheory.beta`, interval integrals and the fundamental theorem of calculus, and on Tau
Ceti's real Beta-integral theory and special-function modules.

## Layer 3: new scalar families

Each entry fixes its parameters and its invalid and boundary behavior, and the shared interface
applies: probability under the valid hypotheses, the density or the masses with
`MeasureTheory.HasPDF` and the Radon–Nikodym derivative where the law is absolutely continuous, and
measurability in the parameters. Cdfs below include their support guards.

### 3.1 Laplace

The Laplace law is `TauCeti.Probability.laplaceMeasure m b`, the measure with density
`TauCeti.Probability.laplacePDFReal m b x = e^(−|x − m|/b)/(2b)` for `b > 0`
(`TauCeti.Probability.laplacePDFReal_of_pos`); for `b ≤ 0` the densities and the law are zero
(`TauCeti.Probability.laplacePDFReal_of_nonpos`, `TauCeti.Probability.laplaceMeasure_of_nonpos`)
(Johnson, Kotz and Balakrishnan, vol. 2). Interface: the law is `volume.withDensity` of
`TauCeti.Probability.laplacePDF m b` (`TauCeti.Probability.laplaceMeasure_eq_withDensity`), a
variable with it has a density equal to `laplacePDF m b` almost everywhere
(`TauCeti.Probability.hasPDF_of_hasLaw_laplaceMeasure`,
`TauCeti.Probability.pdf_eq_laplacePDF_of_hasLaw_laplaceMeasure`), its Radon–Nikodym derivative is
`laplacePDF m b` (`TauCeti.Probability.rnDeriv_laplaceMeasure`), and the family is jointly
measurable (`TauCeti.Probability.measurable_laplaceMeasure`). For `b > 0`:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_laplaceMeasure`) with
  topological support `ℝ` (`TauCeti.Probability.support_laplaceMeasure`);
- `F(x) = e^((x − m)/b)/2` for `x < m` and `F(x) = 1 − e^(−(x − m)/b)/2` for `x ≥ m`
  (`TauCeti.Probability.cdf_laplaceMeasure_eq`);
- mean `m` and variance `2b²` (`TauCeti.Probability.integral_id_laplaceMeasure`,
  `TauCeti.Probability.variance_id_laplaceMeasure`);
- `D = (−1/b, 1/b)` (`TauCeti.Probability.integrableExpSet_id_laplaceMeasure`),
  `M(t) = e^(mt)/(1 − b²t²)` and `K(t) = log(e^(mt)/(1 − b²t²))` on `D`
  (`TauCeti.Probability.mgf_id_laplaceMeasure`, `TauCeti.Probability.cgf_id_laplaceMeasure`), and
  `φ(t) = e^(imt)/(1 + b²t²)` (`TauCeti.Probability.charFun_laplaceMeasure`).

*Needs:* Mathlib `MeasureTheory.Measure.withDensity`, `ProbabilityTheory.cdf`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `MeasureTheory.charFun`; §0.1.

**Checks.**

- Both branches of the cdf give `1/2` at `x = m`, so the cdf is continuous there; with `m = 0`,
  `b = 1`, `F(−1) = e^(−1)/2 ≈ 0.1839`.
- The variance is `2b²` (`4.5` at `b = 1.5`); reading `b` as the standard deviation would give
  `b²`.
- At `m = 0`, `b = 1`, `t = 1/2`, `M(t) = 1/(1 − 1/4) = 4/3`, which numerical integration of
  `e^(tx) e^(−|x|)/2` confirms.

### 3.2 Log-normal

For `m ∈ ℝ` and `v ∈ ℝ≥0`, the log-normal law is `TauCeti.Probability.logNormalMeasure m v`, the
image of `gaussianReal m v` under exp (`TauCeti.Probability.logNormalMeasure_map_exp`); it is a
probability measure for every `v` (`TauCeti.Probability.isProbabilityMeasure_logNormalMeasure`),
carried by `(0, ∞)` (`TauCeti.Probability.ae_pos_logNormalMeasure`), and jointly measurable in
`(m, v)` (`TauCeti.Probability.measurable_logNormalMeasure`) (Johnson, Kotz and Balakrishnan,
vol. 1). For `v > 0`, by change of variables:

- the density is `f(x) = (x√(2πv))⁻¹ e^(−(log x − m)²/(2v))` for `x > 0` and `0` for `x ≤ 0`
  (`TauCeti.Probability.logNormalPDFReal_of_pos`, `TauCeti.Probability.logNormalPDFReal_of_nonpos`),
  the law is `volume.withDensity (logNormalPDF m v)`
  (`TauCeti.Probability.logNormalMeasure_eq_withDensity`), a variable with this law has a density
  equal to it almost everywhere (`TauCeti.Probability.hasPDF_of_hasLaw_logNormalMeasure`,
  `TauCeti.Probability.pdf_eq_logNormalPDF_of_hasLaw_logNormalMeasure`), and it is the
  Radon–Nikodym derivative (`TauCeti.Probability.rnDeriv_logNormalMeasure`);
- `F(x) = (1 + erf((log x − m)/√(2v)))/2` for `x > 0` and `0` for `x ≤ 0`
  (`TauCeti.Probability.cdf_logNormalMeasure_eq`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_logNormalMeasure`, the positive side from
  `TauCeti.Probability.not_integrable_exp_mul_logNormalMeasure`); no closed form for the mgf is
  part of this roadmap;
- its topological support is `[0, ∞)` (`TauCeti.Probability.support_logNormalMeasure`).

At `v = 0` the law is `δ_(e^m)` (`TauCeti.Probability.logNormalMeasure_zero_var`), and the Dirac
package of §0.5 specializes (`TauCeti.Probability.cdf_logNormalMeasure_zero_var`,
`TauCeti.Probability.integral_id_logNormalMeasure_zero_var`,
`TauCeti.Probability.variance_id_logNormalMeasure_zero_var`,
`TauCeti.Probability.integrableExpSet_id_logNormalMeasure_zero_var`,
`TauCeti.Probability.mgf_id_logNormalMeasure_zero_var`,
`TauCeti.Probability.cgf_id_logNormalMeasure_zero_var`,
`TauCeti.Probability.charFun_logNormalMeasure_zero_var`). For every real `q` and every `v`,
including `v = 0`, `X^q` is integrable and `E[X^q] = e^(qm + q²v/2)`
(`TauCeti.Probability.integrable_rpow_logNormalMeasure`,
`TauCeti.Probability.integral_rpow_logNormalMeasure`; natural powers
`TauCeti.Probability.integral_pow_logNormalMeasure`). In particular the mean is `e^(m + v/2)` and
the variance `(e^v − 1) e^(2m + v)` (`TauCeti.Probability.integral_id_logNormalMeasure`,
`TauCeti.Probability.variance_id_logNormalMeasure`).

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `MeasureTheory.Measure.map`, `Real.exp`,
`Real.log`, `Real.rpow`, the one-dimensional change of variables
(`MeasureTheory.integral_image_eq_integral_abs_deriv_smul`); §0.1, §0.5, §1.10, §2.3.

**Checks.**

- `m = 0`, `v = 1`: mean `e^(1/2) ≈ 1.6487` and variance `(e − 1)e ≈ 4.6708`, while the median is
  `e^0 = 1` (`F(1) = (1 + erf 0)/2 = 1/2`): mean above median, as for every `v > 0`.
- At `q = 2`, `m = 0`, `v = 1` the formula gives `E[X²] = e² ≈ 7.389`; the variant
  `e^(qm + qv/2)`, which is right for `q = 1`, would give `E[X²] = e` and variance `0`.
- At `v = 0` the moment formula gives `E[X^q] = e^(qm)`, the moments of `δ_(e^m)`.

### 3.3 Moment indeterminacy

Let `f` be the density of `logNormalMeasure 0 1`. For `|ε| ≤ 1` the perturbed density is
`f_ε(x) = f(x)(1 + ε sin(2π log x))` for `x > 0` and `0` for `x ≤ 0`
(`TauCeti.Probability.logNormalMomentPerturbationPDFReal`,
`TauCeti.Probability.logNormalMomentPerturbationPDFReal_apply`), and the perturbed law is
`TauCeti.Probability.logNormalMomentPerturbation ε`, the standard log-normal law weighted by
`1 + ε sin(2π log x)` (`TauCeti.Probability.logNormalMomentPerturbation_eq_withDensity_logNormal`),
equivalently `volume.withDensity` of `f_ε`
(`TauCeti.Probability.logNormalMomentPerturbation_eq_withDensity`) (Heyde 1963). For `|ε| ≤ 1`:

- `f_ε ≥ 0` (`TauCeti.Probability.logNormalMomentPerturbationPDFReal_nonneg`), and the perturbed law
  is a probability measure (`TauCeti.Probability.isProbabilityMeasure_logNormalMomentPerturbation`);
- `ε ↦ logNormalMomentPerturbation ε` is measurable
  (`TauCeti.Probability.measurable_logNormalMomentPerturbation`), and distinct `ε, ε' ∈ [−1, 1]`
  give distinct laws (`TauCeti.Probability.injOn_logNormalMomentPerturbation`);
- for every natural `n`, `xⁿ` is integrable and `∫ xⁿ f_ε(x) dx = e^(n²/2)`, the `n`-th moment of
  the log-normal law itself (`TauCeti.Probability.integrable_pow_logNormalMomentPerturbation`,
  `TauCeti.Probability.integral_pow_logNormalMomentPerturbation`).

The key vanishing integral is `∫₀^∞ xⁿ f(x) sin(2π log x) dx = 0`: substitute `y = log x`, complete
the square to shift the Gaussian weight by `n`, and use that `sin(2π(z + n)) = sin(2πz)` for
integer `n` and that `sin(2πz)` is odd against the centred Gaussian. This concrete counterexample is
the whole of the section: neither a general classification of moment problems nor the family API of
each perturbed law is part of it.

*Needs:* Mathlib `MeasureTheory.Measure.withDensity`, `Real.sin`, `Real.log`; §3.2.

**Checks.**

- `n = 0` gives total mass `1`, and numerically `∫ eⁿʸ g(y) sin(2πy) dy` is `0` to within
  `10⁻¹³` for `n = 1, 2, 3` (with `g` the standard Gaussian density), while the log-normal moments
  are `e^(1/2)`, `e²`, `e^(9/2)`.
- The integer restriction matters: for the real exponent `1/4` the perturbed law has
  `E[X^(1/4)] = e^(1/32)(1 + ε e^(−2π²))`, which differs from the log-normal value `e^(1/32)` when
  `ε ≠ 0` (the correction `e^(1/32 − 2π²) ≈ 2.76 · 10⁻⁹` is confirmed numerically), since
  `sin(2π(z + 1/4)) = cos(2πz)` is even.

### 3.4 Weibull

For shape `k` and scale `s`, the Weibull law is `TauCeti.Probability.weibullMeasure k s`, the
measure with density `TauCeti.Probability.weibullPDFReal k s x = (k/s)(x/s)^(k−1) e^(−(x/s)^k)` for
`x > 0` when `k, s > 0`, and `0` otherwise (`TauCeti.Probability.weibullPDFReal_of_pos`,
`TauCeti.Probability.weibullPDFReal_of_nonpos`, `TauCeti.Probability.weibullPDFReal_of_shape_nonpos`,
`TauCeti.Probability.weibullPDFReal_of_scale_nonpos`); for invalid parameters the law is zero
(`TauCeti.Probability.weibullMeasure_of_not_pos`) (Johnson, Kotz and Balakrishnan, vol. 1).
Interface: `TauCeti.Probability.weibullMeasure_def` (the withDensity form),
`TauCeti.Probability.hasPDF_of_hasLaw_weibullMeasure`,
`TauCeti.Probability.pdf_eq_weibullPDF_of_hasLaw_weibullMeasure`,
`TauCeti.Probability.rnDeriv_weibullMeasure`, `TauCeti.Probability.measurable_weibullMeasure`, and
it is a probability measure exactly when `k, s > 0`
(`TauCeti.Probability.isProbabilityMeasure_weibullMeasure_iff`). For `k, s > 0`:

- `F(x) = 1 − e^(−(x/s)^k)` for `x > 0` and `0` otherwise
  (`TauCeti.Probability.cdf_weibullMeasure_eq`);
- for real `q`, `X^q` is integrable exactly when `q > −k`
  (`TauCeti.Probability.integrable_rpow_weibullMeasure_iff`), and then
  `E[X^q] = s^q Γ(1 + q/k)` (`TauCeti.Probability.integral_rpow_weibullMeasure`); natural moments
  `sⁿ Γ(1 + n/k)` (`TauCeti.Probability.integral_pow_weibullMeasure`);
- the variance is `s²(Γ(1 + 2/k) − Γ(1 + 1/k)²)` (`TauCeti.Probability.variance_id_weibullMeasure`);
- the exponential-integrability domain and the mgf depend on the shape
  (`TauCeti.Probability.integrableExpSet_id_weibullMeasure`):

| Shape | Exact `D` | mgf |
| --- | --- | --- |
| `k > 1` | `ℝ` | the convergent series `∑ₙ (ts)ⁿ Γ(1 + n/k)/n!` |
| `k = 1` | `(−∞, 1/s)` | `(1 − st)⁻¹` |
| `0 < k < 1` | `(−∞, 0]` | no closed form |

  The rows are `TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_one_lt` with
  `TauCeti.Probability.hasSum_mgf_id_weibullMeasure_of_one_lt` (cgf
  `TauCeti.Probability.cgf_id_weibullMeasure_of_one_lt`),
  `TauCeti.Probability.integrableExpSet_id_weibullMeasure_one` with
  `TauCeti.Probability.mgf_id_weibullMeasure_one` (cgf `−log(1 − st)`,
  `TauCeti.Probability.cgf_id_weibullMeasure_one`), and
  `TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_lt_one`.

Shape `1` is the exponential law of rate `1/s`: `weibullMeasure 1 s = expMeasure s⁻¹` for every
`s` (`TauCeti.Probability.weibullMeasure_one_eq_expMeasure`).

Prove that for `k, s > 0` the topological support of `weibullMeasure k s` is `[0, ∞)` (the density is
positive exactly on `(0, ∞)`, `TauCeti.Probability.weibullPDFReal_pos_iff`).

*Needs:* Mathlib `Real.Gamma`, `Real.rpow`, `MeasureTheory.Measure.support`; §0.1, §1.5.

**Checks.**

- Shape `1` recovers the exponential cdf: the cdf `1 − e^(−(x/s)^k)` at `k = 1` is `1 − e^(−x/s)`,
  the exponential cdf of rate `1/s`; reading `s` as a rate would give `1 − e^(−sx)`.
- `k = 2`, `s = 1` (the Rayleigh law): mean `Γ(3/2) = √π/2 ≈ 0.8862` and variance
  `1 − π/4 ≈ 0.2146`.
- At `k = 1` the series `∑ (ts)ⁿ Γ(1 + n)/n! = ∑ (ts)ⁿ` sums to `(1 − st)⁻¹` only for `|st| < 1`,
  although `D = (−∞, 1/s)`; the series form is asserted only for `k > 1`.

### 3.5 Chi-squared

The chi-squared law of degree `k` is `TauCeti.Probability.chiSquaredMeasure k`: `δ_0` at `k = 0`
(`TauCeti.Probability.chiSquaredMeasure_zero`), `gammaMeasure (k/2) (1/2)` for `k > 0`
(`TauCeti.Probability.chiSquaredMeasure_eq_gammaMeasure`) and `0` for `k < 0`
(`TauCeti.Probability.chiSquaredMeasure_of_neg`); it is a probability measure for every `k ≥ 0`
(`TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure`) and measurable in `k`
(`TauCeti.Probability.measurable_chiSquaredMeasure`) (Johnson, Kotz and Balakrishnan, vol. 1). For
`k > 0` it inherits from §1.6 and §2.4:

- density `TauCeti.Probability.chiSquaredPDFReal k x = x^(k/2−1) e^(−x/2)/(2^(k/2) Γ(k/2))` for
  `x ≥ 0` (`TauCeti.Probability.chiSquaredPDFReal_of_nonneg`), with
  `TauCeti.Probability.chiSquaredMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_chiSquaredMeasure`,
  `TauCeti.Probability.pdf_eq_chiSquaredPDF_of_hasLaw_chiSquaredMeasure` and
  `TauCeti.Probability.rnDeriv_chiSquaredMeasure`;
- cdf `G_(k/2)(x/2)` (`TauCeti.Probability.cdf_chiSquaredMeasure_eq`);
- mean `k` and variance `2k` (`TauCeti.Probability.integral_id_chiSquaredMeasure`,
  `TauCeti.Probability.variance_id_chiSquaredMeasure`, both stated for `k ≥ 0`);
- `D = (−∞, 1/2)` (`TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure`),
  `M(t) = (1 − 2t)^(−k/2)` and `K(t) = −(k/2) log(1 − 2t)` for `t < 1/2`
  (`TauCeti.Probability.mgf_id_chiSquaredMeasure`, `TauCeti.Probability.cgf_id_chiSquaredMeasure`),
  and `φ(t) = (1 − 2it)^(−k/2)` with the principal complex power
  (`TauCeti.Probability.charFun_chiSquaredMeasure`).

At `k = 0` the Dirac package specializes (`TauCeti.Probability.cdf_chiSquaredMeasure_zero`,
`TauCeti.Probability.integral_id_chiSquaredMeasure_zero`,
`TauCeti.Probability.variance_id_chiSquaredMeasure_zero`,
`TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure_zero`,
`TauCeti.Probability.mgf_id_chiSquaredMeasure_zero`,
`TauCeti.Probability.cgf_id_chiSquaredMeasure_zero`,
`TauCeti.Probability.charFun_chiSquaredMeasure_zero`). Convolution adds nonnegative degrees:
`chiSquaredMeasure k ∗ chiSquaredMeasure l = chiSquaredMeasure (k + l)` for `k, l ≥ 0`
(`TauCeti.Probability.chiSquaredMeasure_conv_chiSquaredMeasure`). The topological support is `{0}`
at `k = 0` and `[0, ∞)` for `k > 0` (`TauCeti.Probability.support_chiSquaredMeasure`). Degree `2`
is the exponential law of rate `1/2` (`TauCeti.Probability.chiSquaredMeasure_two`).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `MeasureTheory.Measure.dirac`; §0.5, §1.6,
§2.1, §2.4.

**Checks.**

- Degree `2` is the exponential law of rate `1/2`: mean `2 = 1/(1/2)`, variance `4 = 1/(1/2)²`,
  and `M(t) = (1 − 2t)^(−1) = (1/2)/(1/2 − t)`; a Gamma rate of `2` in place of `1/2` would give
  mean `1/2`.
- At degree `0`, `D = ℝ`, not `(−∞, 1/2)`: the formula `(1 − 2t)^0 = 1` holds on `t < 1/2`, but the
  Dirac law is exponentially integrable for every `t`, so the positive-degree domain does not
  extend to the boundary.

### 3.6 Inverse-gamma

For `a, r > 0`, the inverse-gamma law `TauCeti.Probability.inverseGammaMeasure a r` is the image of
`gammaMeasure a r` under `x ↦ x⁻¹` (`TauCeti.Probability.inverseGammaMeasure_of_pos`); for other
parameters it is zero (`TauCeti.Probability.inverseGammaMeasure_of_not_pos`) (Johnson, Kotz and
Balakrishnan, vol. 1). It is a probability measure for `a, r > 0`
(`TauCeti.Probability.isProbabilityMeasure_inverseGammaMeasure`), carried by `(0, ∞)`
(`TauCeti.Probability.ae_pos_inverseGammaMeasure`) and jointly measurable
(`TauCeti.Probability.measurable_inverseGammaMeasure`). For `a, r > 0` and `x > 0`:

- `f(x) = rᵃ Γ(a)⁻¹ x^(−a−1) e^(−r/x)` (`TauCeti.Probability.inverseGammaPDFReal_of_pos`) and
  `F(x) = 1 − G_a(r/x)` (`TauCeti.Probability.cdf_inverseGammaMeasure_eq`), both `0` for `x ≤ 0`
  (`TauCeti.Probability.inverseGammaPDFReal_of_nonpos`); the law is `volume.withDensity` of the
  density for all parameters (`TauCeti.Probability.inverseGammaMeasure_eq_withDensity`), with
  `TauCeti.Probability.hasPDF_of_hasLaw_inverseGammaMeasure`,
  `TauCeti.Probability.pdf_eq_inverseGammaPDF_of_hasLaw_inverseGammaMeasure` and
  `TauCeti.Probability.rnDeriv_inverseGammaMeasure`;
- for real `q`, `X^q` is integrable exactly when `q < a`
  (`TauCeti.Probability.integrable_rpow_inverseGammaMeasure_iff`), and then
  `E[X^q] = r^q Γ(a − q)/Γ(a)` (`TauCeti.Probability.integral_rpow_inverseGammaMeasure`);
- the mean is `r/(a − 1)` for `a > 1` (`TauCeti.Probability.integral_id_inverseGammaMeasure`) and
  `id` is not integrable for `a ≤ 1` (`TauCeti.Probability.not_integrable_id_inverseGammaMeasure`);
  the variance is `r²/((a − 1)²(a − 2))` for `a > 2`
  (`TauCeti.Probability.variance_id_inverseGammaMeasure`) and `x²` is not integrable for `a ≤ 2`
  (`TauCeti.Probability.not_integrable_sq_inverseGammaMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_inverseGammaMeasure`); no
  Bessel-function value of the transforms is part of this roadmap.

Prove that for `a, r > 0` the topological support of `inverseGammaMeasure a r` is `[0, ∞)`.

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `MeasureTheory.Measure.map`, `Real.Gamma`,
`Real.rpow`, `MeasureTheory.Measure.support`, the one-dimensional change of variables
(`MeasureTheory.integral_image_eq_integral_abs_deriv_smul`); §0.1, §1.6, §2.1.

**Checks.**

- `a = 3`, `r = 2`: mean `2/2 = 1`, variance `4/(4 · 1) = 1`.
- `q = −1` gives `E[X⁻¹] = r⁻¹ Γ(a + 1)/Γ(a) = a/r`, the mean of the Gamma law of `X⁻¹`, as it
  must; a formula with `Γ(a + q)` in place of `Γ(a − q)` would give `r⁻¹ Γ(a − 1)/Γ(a) =
  1/(r(a − 1))` there.

### 3.7 Student's t

For `ν > 0`, Student's law `TauCeti.Probability.studentTMeasure ν` has density
`TauCeti.Probability.studentTPDFReal ν x = Γ((ν + 1)/2)/(√(νπ) Γ(ν/2)) · (1 + x²/ν)^(−(ν+1)/2)`
(`TauCeti.Probability.studentTPDFReal_of_pos`); for `ν ≤ 0` the density and the law are zero
(`TauCeti.Probability.studentTPDFReal_of_nonpos`, `TauCeti.Probability.studentTMeasure_of_nonpos`)
(Johnson, Kotz and Balakrishnan, vol. 2). Interface: `TauCeti.Probability.studentTMeasure_def`,
`TauCeti.Probability.isProbabilityMeasure_studentTMeasure` (for `ν > 0`),
`TauCeti.Probability.hasPDF_of_hasLaw_studentTMeasure`,
`TauCeti.Probability.pdf_eq_studentTPDF_of_hasLaw_studentTMeasure`,
`TauCeti.Probability.rnDeriv_studentTMeasure`, `TauCeti.Probability.measurable_studentTMeasure`.
Within this family, for `ν > 0`:

- `id` is integrable exactly when `ν > 1` (`TauCeti.Probability.integrable_id_studentTMeasure_iff`),
  and then the mean is `0` (`TauCeti.Probability.integral_id_studentTMeasure`);
- `x²` is integrable exactly when `ν > 2` (`TauCeti.Probability.integrable_sq_studentTMeasure_iff`,
  with `TauCeti.Probability.not_integrable_sq_studentTMeasure` for `ν ≤ 2`), and then the variance
  is `ν/(ν − 2)` (`TauCeti.Probability.variance_id_studentTMeasure`);
- with `b = ν/(ν + x²)`, `F(x) = I_b(ν/2, 1/2)/2` for `x < 0` and `F(x) = 1 − I_b(ν/2, 1/2)/2` for
  `x ≥ 0` (`TauCeti.Probability.cdf_studentTMeasure_eq`);
- `D = {0}` (`TauCeti.Probability.integrableExpSet_id_studentTMeasure`); no Bessel-type formula for
  the characteristic function is part of this roadmap.

Degree `1` is the standard Cauchy law: `studentTMeasure 1 = cauchyMeasure 0 1`
(`TauCeti.Probability.studentTMeasure_one`).

Prove that for `ν > 0` the topological support of `studentTMeasure ν` is `ℝ` (the density is
positive, `TauCeti.Probability.studentTPDFReal_pos`, and the cdf strictly increasing,
`TauCeti.Probability.strictMono_cdf_studentTMeasure`).

*Needs:* Mathlib `Real.Gamma`, `Real.rpow`, `MeasureTheory.Measure.support`,
`ProbabilityTheory.integrableExpSet`; §0.1, §1.8, §2.2.

**Checks.**

- Degree `1` is the standard Cauchy law: at `x = −1`, `b = 1/2` and `I_(1/2)(1/2, 1/2) = 1/2`, so
  `F(−1) = 1/4 = 1/2 + arctan(−1)/π`.
- Degree `2` has the closed cdf `1/2 + x/(2√(2 + x²))`, which is `≈ 0.2113` at `x = −1`; the
  formula gives `I_(2/3)(1, 1/2)/2 = (1 − 1/√3)/2 ≈ 0.2113`, while exchanging the two Beta
  parameters would give `I_(2/3)(1/2, 1)/2 = √(2/3)/2 ≈ 0.408`.
- `F(0) = 1 − I_1(ν/2, 1/2)/2 = 1/2` for every `ν`, by symmetry; `ν = 3` has variance `3`.

### 3.8 Fisher's F

For `m, n > 0`, Fisher's law `TauCeti.Probability.fisherSnedecorMeasure m n` has, for `x > 0`,
density `Γ((m + n)/2)/(Γ(m/2) Γ(n/2)) · (m/n)^(m/2) x^(m/2−1) (1 + mx/n)^(−(m+n)/2)`
(`TauCeti.Probability.fisherSnedecorPDFReal_of_pos`) and cdf `F(x) = I_(mx/(n+mx))(m/2, n/2)`
(`TauCeti.Probability.cdf_fisherSnedecorMeasure_eq`); the density and the cdf vanish for `x ≤ 0`
(`TauCeti.Probability.fisherSnedecorPDFReal_of_nonpos`), and invalid parameters give the zero
measure (`TauCeti.Probability.fisherSnedecorMeasure_of_not_pos`) (Johnson, Kotz and Balakrishnan,
vol. 2). Interface: it is a probability measure exactly when `m, n > 0`
(`TauCeti.Probability.isProbabilityMeasure_fisherSnedecorMeasure_iff`), with
`TauCeti.Probability.fisherSnedecorMeasure_eq_withDensity`,
`TauCeti.Probability.hasPDF_of_hasLaw_fisherSnedecorMeasure`,
`TauCeti.Probability.pdf_eq_fisherSnedecorPDF_of_hasLaw_fisherSnedecorMeasure`,
`TauCeti.Probability.rnDeriv_fisherSnedecorMeasure` and
`TauCeti.Probability.measurable_fisherSnedecorMeasure`; its topological support is `[0, ∞)`
(`TauCeti.Probability.support_fisherSnedecorMeasure`). For `m, n > 0`:

- `id` is integrable exactly when `n > 2` (`TauCeti.Probability.integrable_id_fisherSnedecorMeasure_iff`),
  and then the mean is `n/(n − 2)` (`TauCeti.Probability.integral_id_fisherSnedecorMeasure`);
- `x²` is integrable exactly when `n > 4`
  (`TauCeti.Probability.integrable_sq_fisherSnedecorMeasure_iff`), and then the variance is
  `2n²(m + n − 2)/(m(n − 2)²(n − 4))` (`TauCeti.Probability.variance_id_fisherSnedecorMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_fisherSnedecorMeasure`).

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `Real.Gamma`, `Real.rpow`; §0.1, §1.7, §2.2.

**Checks.**

- `m = n = 2`: the density is `(1 + x)^(−2)` and `F(x) = I_(x/(1+x))(1, 1) = x/(1 + x)` (at `x = 3`,
  `3/4`); `id` is not integrable, since `n = 2` is not above `2`.
- `m = 2`, `n = 6`: mean `3/2`, `E[X²] = 36 · 4/(2 · 4 · 2) = 9`, variance `9 − 9/4 = 27/4`, which
  the formula `2 · 36 · 6/(2 · 16 · 2)` gives.

### 3.9 Negative binomial

The negative binomial law is `TauCeti.Probability.negativeBinomialMeasure r p` on `ℕ`; its
probability range is `r ≥ 0`, `0 < p ≤ 1` (`TauCeti.Probability.isProbabilityMeasure_negativeBinomialMeasure`)
(Johnson, Kemp and Kotz, ch. 5). For `r > 0` and `0 < p ≤ 1` it is the weighted Dirac sum with
masses `p_k = Γ(k + r)/(k! Γ(r)) · pʳ (1 − p)ᵏ`
(`TauCeti.Probability.negativeBinomialMeasure_eq_sum_dirac`,
`TauCeti.Probability.negativeBinomialMeasure_real_singleton`,
`TauCeti.Probability.negativeBinomialWeightReal_eq_gamma`). At `r = 0` or `p = 1` within this range
it is `δ_0` (`TauCeti.Probability.negativeBinomialMeasure_zero`,
`TauCeti.Probability.negativeBinomialMeasure_eq_dirac_of_successProbability_eq_one`), and every
other parameter gives the zero measure (`TauCeti.Probability.negativeBinomialMeasure_eq_zero_of_invalid`).
The family is jointly measurable (`TauCeti.Probability.measurable_negativeBinomialMeasure`), and
shape `1` is the geometric law: for `0 < p ≤ 1`, `geometricMeasure p = negativeBinomialMeasure 1 p`
(`TauCeti.Probability.geometricMeasure_eq_negativeBinomialMeasure_one`). The following assume
`0 < p ≤ 1`:

- native masses and support: `k` carries positive mass exactly when `k = 0` or `r > 0` and `p < 1`
  (`TauCeti.Probability.negativeBinomialMeasure_singleton_ne_zero_iff`);
- for a fixed `p`, convolution adds nonnegative shapes:
  `negativeBinomialMeasure r p ∗ negativeBinomialMeasure s p = negativeBinomialMeasure (r + s) p`
  for `r, s ≥ 0` (`TauCeti.Probability.negativeBinomialMeasure_conv_negativeBinomialMeasure`);
- for `r > 0`, `z^X` is integrable exactly when `|(1 − p)z| < 1`
  (`TauCeti.Probability.integrable_pow_negativeBinomialMeasure_iff`), and there the pgf is
  `(p/(1 − (1 − p)z))ʳ` (`TauCeti.Probability.pgf_negativeBinomialMeasure`);
- the cast law has mean `r(1 − p)/p` and variance `r(1 − p)/p²` for `r ≥ 0`
  (`TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure`,
  `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure`); for `r > 0`,
  `D = {t : (1 − p)e^t < 1}` (`TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure`),
  and on `D`, `M(t) = (p/(1 − (1 − p)e^t))ʳ` with cgf its logarithm
  (`TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure`);
- `φ(t) = (p/(1 − (1 − p)e^(it)))ʳ` with the principal complex power, for `r ≥ 0`
  (`TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure`): the base
  `p/(1 − (1 − p)e^(it))` has positive real part, since `1 − (1 − p)e^(it)` lies in the disc of
  radius `1 − p` about `1`, so it stays off the branch cut;
- for `r > 0`, `P(X ≤ k) = I_p(r, k + 1)` (`TauCeti.Probability.negativeBinomialMeasure_real_Iic`),
  and through the guarded cast-cdf bridge of §1.1 the cast cdf is `0` for `x < 0` and
  `I_p(r, ⌊x⌋₊ + 1)` for `x ≥ 0` (`TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_of_neg`,
  `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure`).

At `r = 0` the Dirac package specializes, and its exponential-integrability domain is all of `ℝ`,
not the positive-shape domain (`TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_zero`,
`TauCeti.Probability.pgf_negativeBinomialMeasure_zero`).

*Needs:* Mathlib `Real.Gamma`, `MeasureTheory.Measure.sum`, `MeasureTheory.Measure.dirac`,
`MeasureTheory.charFun`; Tau Ceti `TauCeti.Probability.pgf`; §0.5, §1.1, §1.12, §2.2.

**Checks.**

- Shape `1` is the geometric law: `P(X ≤ 0) = I_p(1, 1) = p`, the geometric mass at `0`, and the
  mean `r(1 − p)/p` at `r = 1` is the geometric mean `q/p` of §1.3; counting trials instead of
  failures would add `r` to the mean.
- `r = 1`, `p = 0.3`: variance `0.7/0.09 ≈ 7.78` exceeds the mean `0.7/0.3 ≈ 2.33`; the variance
  of a negative binomial law exceeds its mean whenever `0 < p < 1`, unlike the Poisson law.

### 3.10 Hypergeometric

For naturals `K, n ≤ N`, the hypergeometric law `TauCeti.Probability.hypergeometricMeasure N K n`
on `ℕ` has mass `C(K, k) C(N − K, n − k)/C(N, n)` at `k ≤ n` and `0` at `k > n`, the ratio read in
`ℝ≥0∞` (`TauCeti.Probability.hypergeometricWeight_of_le`,
`TauCeti.Probability.hypergeometricWeight_of_not_le`,
`TauCeti.Probability.hypergeometricMeasure_eq_sum_dirac`,
`TauCeti.Probability.hypergeometricMeasure_real_singleton`); for other parameters it is the zero
measure (`TauCeti.Probability.hypergeometricMeasure_eq_zero_of_invalid`) (Johnson, Kemp and Kotz,
ch. 6). It is a probability measure for `K, n ≤ N`
(`TauCeti.Probability.isProbabilityMeasure_hypergeometricMeasure`) and measurable in `(N, K, n)`
(`TauCeti.Probability.measurable_hypergeometricMeasure`); `k` has positive mass exactly when
`k ≤ K`, `k ≤ n` and `n − k ≤ N − K` (`TauCeti.Probability.hypergeometricMeasure_singleton_ne_zero_iff`).
For `K, n ≤ N`, with real casts:

- the mean is `nK/N` for `N > 0` and the variance `n(K/N)(1 − K/N)(N − n)/(N − 1)` for `N > 1`
  (`TauCeti.Probability.integral_id_map_cast_hypergeometricMeasure`,
  `TauCeti.Probability.variance_id_map_cast_hypergeometricMeasure`). At `N = 0` the valid
  parameters are `K = n = 0` and both moments are `0`; at `N = 1` the mean formula holds and the
  variance is `0`. The two statements cover these cases: they are stated for all `K, n ≤ N`, with
  the convention `x/0 = 0` of the real numbers in Lean giving these boundary values;
- the cumulative masses, the mgf and the characteristic function are the finite sums of the masses
  `p_k`, the transforms over `k ≤ n`, and `D = ℝ`
  (`TauCeti.Probability.hypergeometricMeasure_real_Iic_eq_sum`,
  `TauCeti.Probability.cdf_map_cast_hypergeometricMeasure`,
  `TauCeti.Probability.mgf_id_map_cast_hypergeometricMeasure`,
  `TauCeti.Probability.charFun_map_cast_hypergeometricMeasure`,
  `TauCeti.Probability.integrableExpSet_id_map_cast_hypergeometricMeasure`); no hypergeometric
  special function is part of this roadmap;
- symmetry in `K` and `n`: `hypergeometricMeasure N K n = hypergeometricMeasure N n K`
  (`TauCeti.Probability.hypergeometricMeasure_comm`);
- binomial limit: for fixed `n` and `k`, `p ∈ [0, 1]` and a sequence `K_N ≤ N` (eventually) with
  `K_N/N → p`, the mass of `k` under `hypergeometricMeasure N K_N n` tends to its mass under
  `binomial n p` as `N → ∞` (`TauCeti.Probability.tendsto_hypergeometricMeasure_real_singleton`).

*Needs:* Mathlib `Nat.choose`, `ProbabilityTheory.binomial`, `MeasureTheory.Measure.dirac`; §1.1,
§1.2.

**Checks.**

- `N = 4`, `K = 2`, `n = 2`: masses `1/6, 2/3, 1/6`, mean `1 = nK/N`, variance `1/3`, below the
  binomial variance `1/2` by the finite-population factor `(N − n)/(N − 1) = 2/3`.
- Symmetry: `N = 5` with `(K, n) = (1, 3)` gives mass `C(1,1)C(4,2)/C(5,3) = 3/5` at `1`, and
  `(K, n) = (3, 1)` gives `C(3,1)C(2,0)/C(5,1) = 3/5`.
- Without the guard `k ≤ n`, natural subtraction would make `n − k = 0` for `k > n` and the ratio
  `C(K, k)/C(N, n)` would not vanish (for `N = 4`, `K = 3`, `n = 1`, `k = 2` it would be `3/4`).

### Examples

- The Laplace law with `m = 0`, `b = 1`: `F(−1) = e^(−1)/2 ≈ 0.184`, variance `2`,
  `M(1/2) = 4/3`.
- The chi-squared law of degree `2` is the exponential law of rate `1/2`: `P(X > 2) = e^(−1)`.
- Student's law of degree `1` is the standard Cauchy law, and `F(−1) = I_(1/2)(1/2, 1/2)/2 = 1/4`.
- Fisher's law with `m = n = 2` has cdf `x/(1 + x)` on `x > 0`.
- The hypergeometric law with `N = 4`, `K = 2`, `n = 2` has masses `1/6, 2/3, 1/6`, mean `1` and
  variance `1/3`.

### Dependencies

Layer 3 uses Layers 0–2: the density bridges and the Dirac package (§0.1, §0.5); the cast cdf
(§1.1), the binomial law for the hypergeometric limit (§1.2), the exponential law for the Weibull
and chi-squared identifications (§1.5), the Gamma law for chi-squared and inverse-gamma (§1.6), the
Beta law for Fisher's F (§1.7), the Cauchy law for Student's degree one (§1.8), the Gaussian law for
the log-normal law (§1.10) and probability generating functions for the negative binomial law
(§1.12); and the closed cdfs of Layer 2 (§2.1 for chi-squared and inverse-gamma, §2.2 for Student,
Fisher and negative binomial, §2.3 for log-normal). Within the layer, §3.3 uses §3.2. It rests on
Mathlib's change of variables in one dimension, `Real.Gamma`, `ProbabilityTheory.beta`, Dirac
sums of measures and transforms, and on Tau Ceti's family modules.

## Layer 4: relationships among distributions

This layer relates the scalar families of Layers 1–3 to one another. Every identity is an equality
of measures: the pushforward of a product measure, which is the joint law of independent
variables, or a mixture `MeasureTheory.Measure.bind`. Each comes with its random-variable form, in
which `ProbabilityTheory.HasLaw` hypotheses on independent variables (`ProbabilityTheory.IndepFun`,
`ProbabilityTheory.iIndepFun`) give the law of the combined variable. The variables of every
product construction are independent. In formulas, N(m, v) is `ProbabilityTheory.gaussianReal m v`,
Gamma(a, r) is `ProbabilityTheory.gammaMeasure a r` (shape `a`, rate `r`), Beta(a, b) is
`ProbabilityTheory.betaMeasure a b`, Exp(r) is `ProbabilityTheory.expMeasure r` (rate `r`), χ²(k) is
`TauCeti.Probability.chiSquaredMeasure k`, t(ν) is `TauCeti.Probability.studentTMeasure ν`,
F(m, n) is `TauCeti.Probability.fisherSnedecorMeasure m n`, and NB(r, p) is
`TauCeti.Probability.negativeBinomialMeasure r p`.

### 4.1 Gaussian squares

The square of a standard Gaussian variable has the chi-squared law with one degree of freedom:
the image of N(0, 1) under `x ↦ x²` is χ²(1) (`TauCeti.Probability.gaussianReal_map_sq`). More
generally, for every finite index type `ι`, a sum of squares of independent standard Gaussian
variables indexed by `ι` has law χ²(card ι) (`TauCeti.Probability.iIndepFun.hasLaw_sum_sq_gaussian`).
For `ι = Fin k` this is the law of `Z₁² + ⋯ + Z_k²` for every `k`, including the empty sum at
`k = 0`, where both sides are the point mass at `0` (`TauCeti.Probability.chiSquaredMeasure_zero`).
In product-measure form, with a common variance `v`, the image of the product of copies of
N(0, v) under `y ↦ ∑ᵢ yᵢ²` is the image of χ²(card ι) under multiplication by `v`
(`TauCeti.Probability.map_sum_sq_pi_gaussianReal`) (Johnson, Kotz and Balakrishnan, vol. 1).

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `MeasureTheory.Measure.pi`,
`ProbabilityTheory.iIndepFun`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`; §1.10, §3.5.

**Checks.**

- At `k = 0` the empty sum is the constant `0` and χ²(0) is the point mass at `0`. A chi-squared
  law defined as Gamma(k/2, 1/2) for every `k ≥ 0` would be the zero measure at `k = 0`, because the
  Gamma density carries the factor `1/Γ(0)`, which is `0` under the division convention; the empty
  sum tells the two definitions apart.
- χ²(k) is Gamma(k/2, 1/2) with rate `1/2`, of mean `k`: for `k = 1` this is `E[Z²] = 1`, and the
  variance is `2 = E[Z⁴] − 1`. Reading `1/2` as a scale, that is Gamma(k/2, 2) with rate `2`, would
  give mean `k/4`. Also `P(Z² ≤ 1) = P(|Z| ≤ 1) ≈ 0.6827` is the χ²(1) cdf at `1`.

### 4.2 Ratios

Let `Z` be standard Gaussian and `V` an independent variable with law χ²(ν), `ν > 0`. Then
`Z/√(V/ν)` has law t(ν): the image of `N(0, 1) ⊗ χ²(ν)` under `(z, w) ↦ z/√(w/ν)` is t(ν)
(`TauCeti.Probability.map_div_sqrt_chiSquaredMeasure`, random-variable form
`TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared`). For independent `U` and `V` with
laws χ²(m) and χ²(n), `m, n > 0`, the variance ratio `(U/m)/(V/n)` has law F(m, n)
(`TauCeti.Probability.map_scaled_div_chiSquaredMeasure`,
`TauCeti.Probability.hasLaw_fisherSnedecor_of_chiSquared`); for independent Gamma variables of
shapes `a, b > 0` and a common rate `r > 0`, the ratio `(X/(2a))/(Y/(2b))` has law F(2a, 2b)
(`TauCeti.Probability.map_scaled_div_gammaMeasure`,
`TauCeti.Probability.hasLaw_fisherSnedecor_of_gammaMeasure`). The square of a t(ν) variable has law
F(1, ν) (`TauCeti.Probability.studentTMeasure_map_sq`). The ratio `Z₁/Z₂` of two independent
standard Gaussians has the standard Cauchy law `ProbabilityTheory.cauchyMeasure 0 1`
(`TauCeti.Probability.map_div_prod_gaussianReal`, random-variable form
`TauCeti.Probability.hasLaw_ratio_gaussian_cauchy`); the zero-denominator branch is null because
N(0, 1) has no atoms. The t law with one degree of freedom is the standard Cauchy law
(`TauCeti.Probability.studentTMeasure_one`, §3.7) (Johnson, Kotz and Balakrishnan, vol. 1 for the
Cauchy law, vol. 2 for t and F).

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.cauchyMeasure`,
`ProbabilityTheory.gammaMeasure`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`,
`TauCeti.Probability.studentTMeasure`, `TauCeti.Probability.fisherSnedecorMeasure`; §1.6, §1.8,
§1.10, §3.5, §3.7, §3.8, §4.1.

**Checks.**

- At `ν = 1` the two constructions agree: with `V = Z₂²` the t ratio is `Z₁/|Z₂|`, which has the
  law of `Z₁/Z₂` by the symmetry of `Z₁` and independence, and t(1) is the standard Cauchy law of
  §3.7. Both give `P(ratio ≤ 1) = 1/2 + arctan(1)/π = 3/4`.
- At `ν = 4` the t law has variance `ν/(ν − 2) = 2`, while the unnormalized ratio `Z/√V` has
  variance `E[Z²] E[1/V] = 1/(ν − 2) = 1/2`: dropping the division by `ν` is detected.
- F(2, 4) has mean `n/(n − 2) = 2`, while the unnormalized ratio `U/V` has mean
  `E[U] E[1/V] = m/(n − 2) = 1`. Squaring the t ratio gives `Z²/(V/ν)`, the F ratio of χ²(1)
  and χ²(ν), consistent with t(ν)² having law F(1, ν).

### 4.3 Gamma–Beta factorization

For `a, b, r > 0` (Johnson, Kotz and Balakrishnan, vol. 2):

    ((gammaMeasure a r).prod (gammaMeasure b r)).map
        (fun z => (z.1 / (z.1 + z.2), z.1 + z.2)) =
      (betaMeasure a b).prod (gammaMeasure (a + b) r)

(`TauCeti.Probability.map_div_add_prod_gammaMeasure`). The zero-denominator branch `z.1 + z.2 = 0`
is null under the product law, because a Gamma law is almost surely positive for every value of
its parameters (`TauCeti.Probability.ae_pos_gammaMeasure`), so the value of the totalized division
there does not matter. From the joint identity follow the Beta marginal of the ratio
(`TauCeti.Probability.map_div_add_gammaMeasure`) and the independence of the ratio and the total
under the product law (`TauCeti.Probability.indepFun_div_add_gammaMeasure`); the random-variable
forms are `TauCeti.Probability.hasLaw_div_add_prod_gammaMeasure_of_indepFun`,
`TauCeti.Probability.hasLaw_div_add_gammaMeasure_of_indepFun` and
`TauCeti.Probability.indepFun_div_add_of_hasLaw_gammaMeasure`. The change of variables behind it
uses the inverse map `(u, s) ↦ (us, (1 − u)s)` from `(0, 1) × (0, ∞)` onto the open quadrant,
injective there with Jacobian determinant `s` (`TauCeti.Probability.betaGammaMap_injOn`,
`TauCeti.Probability.det_fderivBetaGammaMap`, `TauCeti.Probability.map_betaGammaMap_withDensity`).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`,
`MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`; §1.6, §1.7.

**Checks.**

- At `a = b = 1` the two variables are exponential with a common rate, the ratio is uniform on
  `(0, 1)` (Beta(1, 1)) and the total is Gamma(2, r).
- The common rate is necessary: for independent `X` and `Y` of laws Exp(1) and Exp(2),
  `P(X/(X + Y) ≤ 1/2) = P(X ≤ Y) = 1/3`, while Beta(1, 1) gives `1/2`.

### 4.4 Sums and differences

The three identities below (Johnson, Kotz and Balakrishnan, vol. 1 for exponential sums, vol. 2 for
the Laplace law; Johnson, Kemp and Kotz, ch. 5 for geometric sums):

- For every real `b`, the image of `Exp(1/b) ⊗ Exp(1/b)` under `(x, y) ↦ x − y` is
  `TauCeti.Probability.laplaceMeasure 0 b` (`TauCeti.Probability.map_sub_prod_expMeasure`,
  random-variable form `TauCeti.Probability.IndepFun.hasLaw_sub_expMeasure`). For `b > 0` this says
  that the difference of two independent exponential variables of rate `1/b` is centred Laplace of
  scale `b`; for `b ≤ 0` both sides are the zero measure.
- For `p` in the unit interval with `p ≠ 0` and a finite index type `ι`, the sum of independent
  variables of law `ProbabilityTheory.geometricMeasure p` (failures before the first success) has
  law NB(card ι, p) (`TauCeti.Probability.map_sum_pi_geometricMeasure`,
  `TauCeti.Probability.iIndepFun.hasLaw_sum_geometricMeasure`). This includes `card ι = 0` and
  `p = 1`, where both sides are the point mass at `0`.
- For a nonempty finite index type and `r > 0`, the sum of independent Exp(r) variables has the
  Erlang law Gamma(card ι, r) (`TauCeti.Probability.map_sum_pi_expMeasure`,
  `TauCeti.Probability.iIndepFun.hasLaw_sum_expMeasure`); more generally, independent Gamma
  variables with a common rate add their shapes
  (`ProbabilityTheory.iIndepFun.hasLaw_sum_gammaMeasure`).

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.geometricMeasure`,
`ProbabilityTheory.gammaMeasure`; Tau Ceti `TauCeti.Probability.laplaceMeasure`,
`TauCeti.Probability.negativeBinomialMeasure`; §1.3, §1.5, §1.6, §3.1, §3.9.

**Checks.**

- At `b = 2` each exponential of rate `1/2` has variance `4`, and the difference has variance
  `8 = 2b²`, the Laplace variance; exponentials of rate `b` instead of `1/b` would give variance
  `2/b² = 1/2`.
- The probability that all `n` geometric counts vanish is `pⁿ`, the NB(n, p) mass at `0`. A
  geometric law counting trials (support starting at `1`) would give the sum no mass at `0`
  for `n ≥ 1`.
- For `n = 2`, `r = 1`, `P(X₁ + X₂ ≤ 1) = 1 − 2/e ≈ 0.2642`. The empty family is excluded: its sum
  is the point mass at `0`, while Gamma(0, r) is the zero measure.

### 4.5 Gamma-mixed Poisson

For `r > 0` and `0 < p < 1` (Johnson, Kemp and Kotz, ch. 5):

    (gammaMeasure r (p / (1 - p))).bind
        (fun lam => poissonMeasure (Real.toNNReal lam)) = negativeBinomialMeasure r p

(`TauCeti.Probability.bind_gammaMeasure_poissonMeasure`). The mixture is well formed because the
Poisson family `ProbabilityTheory.poissonMeasure` is measurable in its rate
(`TauCeti.Probability.measurable_poissonMeasure`, §0.4); `Real.toNNReal` carries the Gamma law,
which lives on `(0, ∞)`, to the rate space `ℝ≥0`. With an arbitrary positive Gamma rate `c` and a
nonnegative multiplier `a` of the Poisson rate, the mixture is NB(r, c/(c + a)), the point mass at
`0` when `a = 0` (`TauCeti.Probability.bind_gammaMeasure_poissonMeasure_mul_toNNReal`).

*Needs:* Mathlib `MeasureTheory.Measure.bind`, `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.gammaMeasure`, `Real.toNNReal`; Tau Ceti
`TauCeti.Probability.negativeBinomialMeasure`, `TauCeti.Probability.measurable_poissonMeasure`;
§0.4, §1.4, §1.6, §3.9.

**Checks.**

- The mass at `0` is `E[e^(−Λ)] = (β/(β + 1))^r` with `β = p/(1 − p)`, which is `p^r`, the NB(r, p)
  mass at `0`. Reading `p/(1 − p)` as a Gamma scale instead of a rate gives `(1 − p)^r`.
- The mean is `E[Λ] = r(1 − p)/p` and the variance `E[Λ] + Var Λ = r(1 − p)/p + r(1 − p)²/p² =
  r(1 − p)/p²`, the negative-binomial moments.

### 4.6 Extrema and order statistics

Let `ι` be a nonempty finite type and `X : ι → Ω → ℝ` an independent family, `Xᵢ` with law a
probability measure `μᵢ` and cdf `Fᵢ`. The maximum and the minimum are taken over `Finset.univ`
together with its nonemptiness proof (`Finset.sup'`, `Finset.inf'`), so no default value of an empty
family enters. The cdf of the maximum is `∏ᵢ Fᵢ(x)` and that of the minimum is
`1 − ∏ᵢ (1 − Fᵢ(x))` (`TauCeti.Probability.cdf_max_indep`, `TauCeti.Probability.cdf_min_indep`).
For an identically distributed family with law `μ`, cdf `F` and `d = card ι` these are `F(x)^d` and
`1 − (1 − F(x))^d` (`TauCeti.Probability.cdf_max_iid`, `TauCeti.Probability.cdf_min_iid`), and the
minimum of `d` independent Exp(r) variables, `r > 0`, has law Exp(d·r)
(`TauCeti.Probability.hasLaw_min_iid_expMeasure`; for two different rates
`TauCeti.Probability.map_min_expMeasure`) (Billingsley).

For a tuple `x : Fin n → ℝ` and `k : Fin n`, the order statistic `TauCeti.orderStatistic k x` is the
entry in position `k` once the entries of `x` are sorted increasingly with their multiplicities
(Mathlib's `Tuple.sort`). Positions are counted from `0`, so for `n ≥ 1` and `1 ≤ k ≤ n` the `k`th
order statistic is `TauCeti.orderStatistic (k − 1)`; all formulas below use the counting from `1`.

- It is measurable (`TauCeti.measurable_orderStatistic`), and the `k`th order statistic is at most
  `t` exactly when at least `k` entries are at most `t` (`TauCeti.orderStatistic_le_iff`). The first
  and the last are the minimum and the maximum (`TauCeti.orderStatistic_zero`,
  `TauCeti.orderStatistic_last`).
- For independent entries with a common law `μ` and cdf `F`, atoms allowed, the `k`th order
  statistic has cdf

      F₍ₖ₎(x) = ∑ j ∈ [k, n], C(n, j) F(x)^j (1 − F(x))^(n − j)

  (`TauCeti.Probability.cdf_map_orderStatistic_pi`, random-variable form
  `TauCeti.Probability.measureReal_setOf_orderStatistic_le_iid`); as an incomplete Beta value it is
  `I_F(x)(k, n + 1 − k)` (`TauCeti.Probability.cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta`,
  §2.2).
- For independent entries of law `TauCeti.Probability.uniformMeasure 0 1`, the `k`th order
  statistic has law Beta(k, n + 1 − k)
  (`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`,
  `TauCeti.Probability.hasLaw_orderStatistic_iid_uniformMeasure`) (Johnson, Kotz and Balakrishnan,
  vol. 2), and the sorted vector `i ↦ orderStatistic i x` has density
  `n! · 1{0 < y₁ < ⋯ < yₙ < 1}` relative to volume on `Fin n → ℝ`, for every `n` including `0`
  (`TauCeti.Probability.map_orderStatistics_pi_uniformMeasure`,
  `TauCeti.Probability.hasLaw_orderStatistics_iid_uniformMeasure`).

The joint density, and not only the marginal laws, is what the law of the uniform spacings needs. A
general theory of joint order-statistic densities is not part of this roadmap.

*Needs:* Mathlib `ProbabilityTheory.cdf`, `ProbabilityTheory.iIndepFun`, `Finset.sup'`,
`Finset.inf'`, `Tuple.sort`, `ProbabilityTheory.expMeasure`, `ProbabilityTheory.betaMeasure`; Tau
Ceti `TauCeti.Probability.uniformMeasure`; §0.3, §1.5, §1.7, §2.2.

**Checks.**

- Atoms count. For two independent fair Bernoulli variables on `{0, 1}`, the minimum is at most `0`
  with probability `1 − (1/2)² = 3/4`, and the order-statistic formula with `k = 1`, `n = 2` gives
  `2·(1/2)² + (1/2)² = 3/4`. Counting entries strictly below `x` instead would give `0` at `x = 0`.
- For three unit uniforms the median (`k = 2`) has cdf `C(3,2)/8 + C(3,3)/8 = 1/2` at `1/2`, the
  Beta(2, 2) value, and mean `k/(n + 1) = 1/2`.
- The joint density `n!` integrates to `1` over the ordered cube, whose volume is `1/n!`; without
  the factor `n!` the total mass would be `1/n!`.

### Examples

- For standard Gaussian `Z₁, Z₂, Z₃`, `Z₁² + Z₂² + Z₃²` has law χ²(3), mean `3` and variance `6`.
- For independent `X` and `Y` of law Exp(1), `X − Y` has the Laplace density `e^(−|x|)/2`, and
  `P(X − Y > 0) = 1/2`.
- For independent `X` and `Y` of laws Gamma(2, 1) and Gamma(3, 1), `X/(X + Y)` has law Beta(2, 3),
  with mean `2/5` and variance `1/25`, and is independent of `X + Y`, of law Gamma(5, 1).
- At `r = 1` the Gamma mixture of §4.5 is an exponential mixture of Poisson laws, and the result is
  the geometric law: NB(1, p) has mass `p(1 − p)^k` at `k`.
- For four unit uniforms the minimum has law Beta(1, 4), with mean `1/5`, and cdf `1 − (1 − x)⁴` on
  `[0, 1]`, in agreement with the minimum formula.

### Dependencies

Layers 0–3: §0.3 (interval uniform) and §0.4 (measurability of the Poisson family), §1.3
(geometric), §1.4 (Poisson), §1.5 (exponential), §1.6 (Gamma), §1.7 (Beta), §1.8 (Cauchy), §1.10
(real Gaussian), §2.2 (incomplete Beta, for the order-statistic cdf), §3.1 (Laplace), §3.5
(chi-squared), §3.7 (Student's t), §3.8 (Fisher's F), §3.9 (negative binomial). From Mathlib: the
scalar families under `Mathlib/Probability/Distributions/`, independence, `MeasureTheory.Measure.bind`
and the Jacobian change of variables. From Tau Ceti: the relations, sums, Gamma–Beta, Gamma–Poisson and
order-statistic files under `TauCeti/Probability/Distributions/` and the finite-tuple order
statistics under `TauCeti/Data/Fin/Tuple/`.

## Layer 5: multivariate distributions

This layer treats laws on finite-dimensional carriers: the multivariate Gaussian on
`EuclideanSpace ℝ ι`, the multinomial law on count vectors `ι → ℕ`, and the Dirichlet law on the
simplex of `EuclideanSpace ℝ ι`. Throughout, `ι`, `κ`, `τ` are finite types, matrices act on
Euclidean vectors through `Matrix.toEuclideanLin`, `√S` is `CFC.sqrt S`, and `S ⪰ 0`, `S ≻ 0` mean
`S.PosSemidef`, `S.PosDef`. N(m, S) is Mathlib's `ProbabilityTheory.multivariateGaussian m S`, the
image of the standard Gaussian `ProbabilityTheory.stdGaussian` under `x ↦ m + √S x`; when `S` is not
positive semidefinite, `√S = 0` and N(m, S) is the point mass at `m`
(`ProbabilityTheory.multivariateGaussian_of_not_posSemidef`).

### 5.1 Covariance matrices

For a measure `μ` on `EuclideanSpace ℝ ι`, the covariance matrix `TauCeti.covMatrix μ` has entries
`cov[z ↦ z i, z ↦ z j; μ]` (`TauCeti.covMatrix_apply`). It is symmetric
(`TauCeti.isHermitian_covMatrix`) and, for a finite `μ` with `MemLp id 2 μ`, positive semidefinite
(`TauCeti.posSemidef_covMatrix`) (Eaton).

- For `S ⪰ 0`, the covariance matrix of N(m, S) is `S`
  (`TauCeti.Probability.covMatrix_multivariateGaussian`).
- For every `S`, including covariances that are not positive semidefinite, N(m, S) is a Gaussian
  measure (`ProbabilityTheory.isGaussian_multivariateGaussian`), hence integrable
  (`ProbabilityTheory.IsGaussian.integrable_id`), with mean `m`
  (`ProbabilityTheory.integral_id_multivariateGaussian`; coordinatewise
  `TauCeti.Probability.integral_eval_multivariateGaussian`, random-variable form
  `TauCeti.Probability.integral_of_hasLaw_multivariateGaussian`).
- For a finite `μ` with `MemLp id 2 μ`, `covarianceBilin μ x y = ⟪x, covMatrix μ y⟫`
  (`TauCeti.covarianceBilin_eq_covMatrix`). The hypothesis `MemLp id 2 μ` stays: without it
  Mathlib's `ProbabilityTheory.covarianceBilin` is zero
  (`ProbabilityTheory.covarianceBilin_of_not_memLp`), while the entrywise covariances need not all
  vanish.

*Needs:* Mathlib `ProbabilityTheory.covariance`, `ProbabilityTheory.covarianceBilin`,
`ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.covariance_eval_multivariateGaussian`,
`ProbabilityTheory.covarianceBilin_multivariateGaussian`,
`MeasureTheory.MemLp`; Layer 0.

**Checks.**

- For the law of `(C, Z)` with `C` standard Cauchy and `Z` standard Gaussian, independent,
  `MemLp id 2` fails and the covariance bilinear form is `0`, but the covariance matrix is
  `diag(0, 1)`: the Gaussian entry is `1`, while the Cauchy entry and the cross entry are `0` by the
  totalization of nonintegrable Bochner integrals. The bridge without the second-moment hypothesis
  would be false.
- For `S = diag(1, −1)`, which is not positive semidefinite, N(m, S) is the point mass at `m`, with
  mean `m` and covariance matrix `0 ≠ S`: the identification of the covariance needs `S ⪰ 0`, the
  mean does not.

### 5.2 Gaussian density

For `S ≻ 0` and `d = card ι`, the density of N(m, S) is

    f(x) = (2π)^(−d/2) (det S)^(−1/2) exp(−⟪x − m, S⁻¹ (x − m)⟫ / 2)

with Euclidean volume, real powers (`Real.rpow`), the dimension cast to `ℝ`, and `S⁻¹` acting through
`Matrix.toEuclideanLin`. It is `TauCeti.Probability.multivariateGaussianPDFReal m S`, with
`ℝ≥0∞`-valued companion `TauCeti.Probability.multivariateGaussianPDF m S` given by `ENNReal.ofReal`
(Eaton). Its API:

- For `S ≻ 0`, N(m, S) is `volume.withDensity (multivariateGaussianPDF m S)`
  (`TauCeti.Probability.multivariateGaussian_eq_withDensity`), obtained by the affine change of
  variables `x ↦ m + √S x` from the product density of the standard Gaussian
  (`TauCeti.Probability.pi_gaussianReal_eq_withDensity`,
  `TauCeti.Probability.stdGaussian_eq_withDensity`).
- For `S ≻ 0`, a random vector with law N(m, S) has a density
  (`TauCeti.Probability.hasPDF_of_hasLaw_multivariateGaussian`) equal almost everywhere to the named
  one (`TauCeti.Probability.pdf_eq_multivariateGaussianPDF_of_hasLaw_multivariateGaussian`), and the
  Radon–Nikodym derivative of N(m, S) with respect to volume is the density almost everywhere
  (`TauCeti.Probability.rnDeriv_multivariateGaussian`).
- The density is positive when `det S > 0`, nonnegative and measurable for every `S`
  (`TauCeti.Probability.multivariateGaussianPDFReal_pos`,
  `TauCeti.Probability.multivariateGaussianPDFReal_nonneg`,
  `TauCeti.Probability.measurable_multivariateGaussianPDF`).
- For `S` not positive definite, N(m, S) is mutually singular with respect to volume
  (`TauCeti.Probability.mutuallySingular_multivariateGaussian_volume`) and its Radon–Nikodym
  derivative vanishes almost everywhere
  (`TauCeti.Probability.rnDeriv_multivariateGaussian_of_not_posDef`).
- For `S ⪰ 0`, the topological support `MeasureTheory.Measure.support` of N(m, S) is exactly the
  affine subspace `m + range(S.toEuclideanLin)` (`TauCeti.Probability.support_multivariateGaussian`),
  and N(m, S) is almost surely in it
  (`TauCeti.Probability.ae_mem_affineRange_multivariateGaussian`). The proof pushes the standard
  Gaussian, of full support (`TauCeti.Probability.support_stdGaussian`), by `x ↦ m + √S x`
  (`TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`) and uses that `S` and
  `√S` have the same range (`Matrix.PosSemidef.range_toEuclideanLin_sqrt`).

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.stdGaussian`,
`MeasureTheory.Measure.withDensity`, `MeasureTheory.HasPDF`, `MeasureTheory.Measure.rnDeriv`,
`MeasureTheory.Measure.MutuallySingular`, `MeasureTheory.Measure.support`, `CFC.sqrt`; §0.1, §0.2,
§1.10.

**Checks.**

- For `d = 2` and `S = diag(1, 4)` the density at the mean is `1/(2π · 2) = 1/(4π) ≈ 0.0796`. The
  normalization `(det S)^(−1)` in place of `(det S)^(−1/2)` would give `1/(8π)` and total mass
  `1/2`.
- For `S = diag(1, 0)` the law is carried by the line `m + ℝe₁`, a null set, and the displayed
  formula vanishes identically, since `(det S)^(−1/2) = 0^(−1/2) = 0` for the real power: it is no
  density, as singularity requires.
- For `S` the 2×2 matrix with all entries `1`, the support is the line `m + ℝ(1, 1)`, not the
  whole plane, and not the point `m`.

### 5.3 Gaussian transport, transforms, and mixed moments

**Affine maps.** For a rectangular `L : Matrix κ ι ℝ`, a translation `c` and `S ⪰ 0`,

    N(m, S).map (x ↦ L x + c) = N(L m + c, L S Lᵀ)

(`TauCeti.Probability.map_affine_multivariateGaussian`) (Eaton). Special cases are scaling and
translation (`TauCeti.Probability.map_add_smul_multivariateGaussian`), reindexing along any map of
index types, which repeats or omits coordinates
(`TauCeti.Probability.map_comp_multivariateGaussian`), the coordinate marginals N(mᵢ, Sᵢᵢ)
(`ProbabilityTheory.measurePreserving_eval_multivariateGaussian`) and the restriction to a subset
of the coordinates (`ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian`). The
parameter formula is not extended to covariances that are not positive semidefinite: the Dirac
fallback need not survive a map that changes the validity of the covariance (see the Checks). On a
one-element index type, N(m, S) is the image of the scalar Gaussian with mean `m₀` and variance
`S₀₀` under the inclusion of the coordinate, for every `S`
(`EuclideanSpace.multivariateGaussian_eq_map_single`).

**Directional transforms.** For `X` with law N(m, S) and `Y = ⟪θ, X⟫`, the exponential-integrability
domain of `Y` is all of `ℝ` for every `S` (`TauCeti.Probability.integrableExpSet_inner_multivariateGaussian`).
For `S ⪰ 0`, `Y` has law N(⟪θ, m⟫, ⟪θ, Sθ⟫) (`TauCeti.Probability.map_inner_multivariateGaussian`),
and for every real `t`

    M_Y(t) = exp(t⟪θ, m⟫ + t²⟪θ, Sθ⟫/2),    K_Y(t) = t⟪θ, m⟫ + t²⟪θ, Sθ⟫/2

(`TauCeti.Probability.mgf_inner_multivariateGaussian`,
`TauCeti.Probability.cgf_inner_multivariateGaussian`). The characteristic function is Mathlib's
`ProbabilityTheory.charFun_multivariateGaussian`.

**Quadratic forms.** Let `X` have law N(0, S), let `Θ` be symmetric (`Θ.IsHermitian`) and
`B = √S Θ √S`. For every `S`, `t` lies in the exponential-integrability domain of `⟪X, ΘX⟫` exactly
when `1 − 2tB ≻ 0` (`TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_multivariateGaussian_iff`),
and on that domain the moment-generating function is `det(1 − 2tB)^(−1/2)`
(`TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian_sqrt`). For `S ⪰ 0`,

    t ∈ D ⟺ 1 − 2tB ≻ 0,    M(t) = det(1 − 2tΘS)^(−1/2),    K(t) = −½ log det(1 − 2tΘS)

(`TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian`,
`TauCeti.Probability.cgf_inner_toEuclideanLin_multivariateGaussian`); the two determinants agree,
`det(1 − 2tB) = det(1 − 2tΘS)`
(`Matrix.PosSemidef.det_one_sub_smul_sqrt_mul_mul_sqrt_eq_det_one_sub_smul_mul`, from
`CFC.sqrt_mul_sqrt_self` and `Matrix.det_one_add_mul_comm`). The route pushes the standard Gaussian
by `√S`, rotates by an orthonormal eigenbasis of `B` (`ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis`),
so that the form becomes `∑ⱼ λⱼ Wⱼ²` with independent standard `Wⱼ`
(`TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_stdGaussian_iff`,
`TauCeti.Probability.mgf_inner_toEuclideanLin_stdGaussian`), and multiplies the scalar factors by
`ProbabilityTheory.iIndepFun.mgf_sum`. The scalar factor is `(1 − 2tλ)^(−1/2)` for `2tλ < 1`, from
the chi-squared law of degree one (`TauCeti.Probability.mgf_mul_sq_gaussianReal`, §4.1); at `λ = 1`
it is `(1 − 2t)^(−1/2)` for `t < 1/2`.

**Mixed moments.** Let `Z` have law N(m, S).

- Every shifted coordinate monomial `∏ᵢ (Zᵢ − cᵢ)^(nᵢ)` is integrable, for every `S`
  (`TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian`).
- Centred products of odd degree have mean zero, for every `S`: for a finite set `s` of positions
  of odd size and `j : κ → ι`, `E[∏ k ∈ s, (Z_(j k) − m_(j k))] = 0`
  (`TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`; multi-index form
  `TauCeti.Probability.integral_prod_pow_sub_multivariateGaussian_eq_zero_of_odd`).
- For `S ⪰ 0`, the fourth centred moment is the sum over the three pairings,
  `E[(Zᵢ − mᵢ)(Zⱼ − mⱼ)(Zₖ − mₖ)(Zₗ − mₗ)] = SᵢⱼSₖₗ + SᵢₖSⱼₗ + SᵢₗSⱼₖ`
  (`TauCeti.Probability.integral_mul_mul_mul_sub_multivariateGaussian`; centred law
  `TauCeti.Probability.integral_mul_mul_mul_multivariateGaussian`; random-variable form
  `ProbabilityTheory.HasLaw.integral_mul_mul_mul_sub_multivariateGaussian`).

Prove the Wick–Isserlis formula in every degree,
`integral_prod_sub_multivariateGaussian_eq_sum_perfectMatching`: for `S ⪰ 0`, a finite linearly
ordered type `κ` of positions and `j : κ → ι`,

    E[∏ k, (Z_(j k) − m_(j k))] = ∑ over perfect matchings π of κ, ∏ over k with k < π(k), S_(j k, j π(k))

where a perfect matching is a fixed-point-free involution of the positions (Tau Ceti's
`TauCeti.PerfectMatching κ`), each pair `{k, π(k)}` being counted once, at its smaller position.
Equivalently, the sum runs over the pairings of the positions, the finite partitions all of whose
blocks have two elements (`Finpartition.IsPairing`, with `Finpartition.IsPairing.toPerfectMatching`);
there are `(2n − 1)!!` of them for `2n` positions and none for an odd number, so the formula
contains the odd vanishing above, and for no positions it gives `1`. Prove the noncentred
moments by expansion about the mean, using the integrability above: for a finite set `s` of
positions,

    E[∏ k ∈ s, Z_(j k)] = ∑ A ⊆ s, (∏ k ∈ s \ A, m_(j k)) · E[∏ k ∈ A, (Z_(j k) − m_(j k))]

each term being given by the Wick formula, and zero for `A` of odd size.

**Independence.** For `S ⪰ 0` and rectangular `A : Matrix κ ι ℝ`, `B : Matrix τ ι ℝ`, the images
`AZ` and `BZ` are independent exactly when `ASBᵀ = 0`
(`TauCeti.Probability.indepFun_matrix_multivariateGaussian_iff`,
`TauCeti.Probability.indepFun_matrix_of_hasLaw_multivariateGaussian_iff`); the underlying criterion
for jointly Gaussian pairs is Mathlib's `ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_inner`.

**Orthogonal projections.** For the standard Gaussian on a finite-dimensional real inner product
space `E`, in particular on `EuclideanSpace ℝ ι`, and pairwise orthogonal subspaces `Kᵢ`
(equivalently, mutually orthogonal orthogonal projections `Pᵢ` with ranges `Kᵢ`, so that
`rank Pᵢ = dim Kᵢ`), the projections are jointly independent
(`TauCeti.Probability.iIndepFun_orthogonalProjectionOnto_stdGaussian`), each projection is the
standard Gaussian of `Kᵢ` (`Submodule.map_orthogonalProjectionOnto_stdGaussian`), and the squared
norms `‖PᵢZ‖²` are independent with laws χ²(dim Kᵢ)
(`Submodule.map_norm_sq_starProjection_stdGaussian`,
`TauCeti.Probability.map_norm_sq_orthogonalProjectionOnto_stdGaussian_pi`; random-variable forms
`ProbabilityTheory.HasLaw.iIndepFun_norm_sq_orthogonalProjectionOnto_stdGaussian`,
`ProbabilityTheory.HasLaw.pi_norm_sq_orthogonalProjectionOnto_stdGaussian`). Rank zero, where the law
is the point mass at `0`, and families not spanning `E` are included.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.stdGaussian`,
`ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis`, `ProbabilityTheory.iIndepFun.mgf_sum`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `ProbabilityTheory.integrableExpSet`, `CFC.sqrt`,
`Matrix.det_one_add_mul_comm`, `Finpartition`, `Submodule.orthogonalProjectionOnto`; Tau Ceti
`Finpartition.IsPairing`, `TauCeti.PerfectMatching`, `TauCeti.Probability.chiSquaredMeasure`; §3.5, §4.1, §5.1.

**Checks.**

- For `S = diag(1, −1)` and `L = (1 0)`, N(m, S) is the point mass at `m`, so its image is the point
  mass at `m₁`, while `LSLᵀ = (1)` is positive semidefinite and N(m₁, 1) is not a point mass: the
  affine formula fails off the positive semidefinite cone.
- On a one-element index type with `S = (v)`, `v > 0`, the density of §5.2 is
  `(2πv)^(−1/2) e^(−(x − m)²/(2v))`, the scalar Gaussian density: the `Fin 1` Gaussian is the scalar
  Gaussian.
- For `Θ = diag(1, −1)` and `S = 1`, the form `X₁² − X₂²` has moment-generating function
  `(1 − 2t)^(−1/2)(1 + 2t)^(−1/2) = (1 − 4t²)^(−1/2)` on `|t| < 1/2`. A domain condition involving
  only the largest eigenvalue would admit `t ≤ −1/2`, where the integral diverges.
- For `Θ` the matrix unit at `(1, 1)` and `S = [[2, 1], [1, 1]]`, the form is `X₁²` with `X₁` of
  law N(0, 2), so `M(t) = (1 − 4t)^(−1/2)` on `t < 1/4`, and `det(1 − 2tΘS) = 1 − 4t`. The matrix
  `1 − 2tΘS` is not symmetric for `t ≠ 0`, so the domain must be stated with `B = √S Θ √S`, not
  with `ΘS`.
- Six positions have `15` pairings, so `E[Z₁⁶] = 15 S₁₁³` for centred `Z`, and
  `E[Z₁² Z₂²] = S₁₁S₂₂ + 2S₁₂²`.
- For `S = 1`, `A = (1 1)` and `B = (1 −1)`, `ASBᵀ = 0` and the sum and difference are independent.
  For `S = [[1, ρ], [ρ, 2]]`, `ASBᵀ = −1` for every `ρ`, so they are dependent even when `ρ = 0`.

### 5.4 Conditional Gaussian

Write the joint vector on `EuclideanSpace ℝ (ι ⊕ κ)` and split it by Mathlib's
`EuclideanSpace.sumEquivProd` into the retained block `X₁` (indices `Sum.inl`) and the observed block
`X₂` (indices `Sum.inr`); `m₁`, `m₂` are the corresponding blocks of the mean, and `S₁₁`, `S₁₂`,
`S₂₁`, `S₂₂` the submatrices `S.submatrix Sum.inl Sum.inl`, `S.submatrix Sum.inl Sum.inr`, and so on
(Anderson 2003).

**The covariance pseudoinverse.** `Matrix.covariancePseudoInverse C` is `cfc (x ↦ x⁻¹) C` for
positive semidefinite `C` and `0` otherwise (`Matrix.covariancePseudoInverse_of_posSemidef`,
`Matrix.covariancePseudoInverse_of_not_posSemidef`), and `0⁺ = 0`
(`Matrix.covariancePseudoInverse_zero`). Write `C⁺` for it.

- For every `C`, `C⁺` is positive semidefinite (`Matrix.posSemidef_covariancePseudoInverse`),
  commutes with `C` (`Matrix.commute_covariancePseudoInverse`), satisfies `C⁺CC⁺ = C⁺`
  (`Matrix.covariancePseudoInverse_mul_self_mul`), and `CC⁺`, `C⁺C` are symmetric
  (`Matrix.isHermitian_mul_covariancePseudoInverse`, `Matrix.isHermitian_covariancePseudoInverse_mul`).
- For `C ⪰ 0`, `CC⁺C = C` (`Matrix.mul_covariancePseudoInverse_mul`), so the four Moore–Penrose
  identities hold (`Matrix.isMoorePenroseInverse_covariancePseudoInverse`), and `C⁺` is the unique
  matrix satisfying them (`Matrix.eq_covariancePseudoInverse_of_penrose`). Its operator is the
  Moore–Penrose inverse `LinearMap.moorePenroseInverse` of `C.toEuclideanLin`
  (`Matrix.toEuclideanLin_covariancePseudoInverse`), and `CC⁺ = C⁺C` is the orthogonal projection
  onto `R = range(C.toEuclideanLin)` (`Matrix.toEuclideanLin_mul_covariancePseudoInverse`,
  `Matrix.toEuclideanLin_covariancePseudoInverse_mul`). These hold for `C = 0` and for empty `ι`.
- For `C ≻ 0`, `C⁺ = C⁻¹` (`Matrix.covariancePseudoInverse_of_posDef`).
- For `C ⪰ 0`, `C⁺` is the limit of `(C² + εI)⁻¹C` as `ε ↓ 0`
  (`Matrix.tendsto_inv_sq_add_smul_mul`), and `C ↦ C⁺` is Borel measurable in all entries, the
  invalid branch included (`Matrix.measurable_covariancePseudoInverse`).

Prove the range-inverse description of `C⁺`, a reusable linear-algebra bridge: for `C ⪰ 0` and
`R = range(C.toEuclideanLin)`, the restriction of `C.toEuclideanLin` to `R` is a positive definite
automorphism of `R` (symmetric, with `⟪x, Cx⟫ > 0` for `0 ≠ x ∈ R`), and the composite of
`Submodule.orthogonalProjectionOnto R`, the inverse of this automorphism and the inclusion of `R`
into `EuclideanSpace ℝ ι` equals `(Matrix.covariancePseudoInverse C).toEuclideanLin`, including
`C = 0` and empty `ι`. The complement `R⊥` is `ker C`, by Mathlib's
`LinearMap.IsSymmetric.orthogonal_range` applied to the symmetric operator of `C`. No rectangular or
general non-Hermitian pseudoinverse theory is part of this roadmap.

**Blocks.** For `S ⪰ 0` on `ι ⊕ κ`, with no further hypothesis, `ker S₂₂ ⊆ ker S₁₂`
(`Matrix.PosSemidef.ker_toEuclideanLin_toBlocks₂₂_le`) and `range S₂₁ ⊆ range S₂₂`
(`Matrix.PosSemidef.range_toEuclideanLin_toBlocks₂₁_le`); consequently `S₁₂S₂₂⁺S₂₂ = S₁₂`
(`Matrix.PosSemidef.toBlocks₁₂_mul_covariancePseudoInverse_mul`), `S₂₂ = 0` forces `S₁₂ = 0`
(`Matrix.PosSemidef.toBlocks₁₂_eq_zero_of_toBlocks₂₂_eq_zero`), and the generalized Schur complement
`S₁₁ − S₁₂S₂₂⁺S₂₁` is positive semidefinite
(`Matrix.PosSemidef.schur_complement₂₂_covariancePseudoInverse`).

**The conditional kernel.** The conditional mean `EuclideanSpace.gaussianCondMean m S x₂` is
`m₁ + S₁₂S₂₂⁺(x₂ − m₂)` (`EuclideanSpace.gaussianCondMean_def`), the conditional covariance
`Matrix.gaussianCondCov S` is `S₁₁ − S₁₂S₂₂⁺S₂₁` (`Matrix.gaussianCondCov_def`), and the Markov kernel
`EuclideanSpace.gaussianCondKernel m S` is

    x₂ ↦ N(m₁ + S₁₂ S₂₂⁺ (x₂ − m₂), S₁₁ − S₁₂ S₂₂⁺ S₂₁)

at every ambient `x₂`, including points outside the affine support `m₂ + range S₂₂`, where
conditional distributions impose nothing (`EuclideanSpace.gaussianCondKernel_apply`,
`EuclideanSpace.isMarkovKernel_gaussianCondKernel`). For `S ⪰ 0` the conditional covariance is
positive semidefinite (`Matrix.PosSemidef.gaussianCondCov`), and for `S ≻ 0` positive definite
(`Matrix.PosDef.gaussianCondCov`). When `S₂₂ ≻ 0`, `S₂₂⁺ = S₂₂⁻¹` and the kernel is

    x₂ ↦ N(m₁ + S₁₂ S₂₂⁻¹ (x₂ − m₂), S₁₁ − S₁₂ S₂₂⁻¹ S₂₁)

(`EuclideanSpace.gaussianCondMean_of_posDef`, `Matrix.gaussianCondCov_of_posDef`). For a random vector
`X` with law N(m, S), `S ⪰ 0`, singular `S₂₂` and Dirac conditional laws included:

- the residual `X₁ − m₁ − S₁₂S₂₂⁺(X₂ − m₂)` is independent of `X₂`
  (`ProbabilityTheory.HasLaw.indepFun_gaussianResidual`);
- the joint law factors: the image of N(m, S) under `x ↦ (x₂, x₁)` is N(m₂, S₂₂) composed with the
  kernel, `N(m₂, S₂₂) ⊗ₘ gaussianCondKernel m S` (`EuclideanSpace.map_snd_fst_multivariateGaussian`);
- `condDistrib X₁ X₂ P =ᵐ[P.map X₂] gaussianCondKernel m S`
  (`TauCeti.Probability.condDistrib_multivariateGaussian`), through
  `ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`;
- the kernel is jointly measurable in the mean, all covariance entries (through `Matrix.of`) and the
  observed value, on all matrices and so on the positive semidefinite cone
  (`EuclideanSpace.measurable_gaussianCondKernel`, with `EuclideanSpace.measurable_gaussianCondMean`
  and `Matrix.measurable_gaussianCondCov`);
- the blocks are independent exactly when `S₁₂ = 0`
  (`TauCeti.Probability.indepFun_sumEquivProd_multivariateGaussian_iff`);
- at `S₂₂ = 0`, `S₁₂ = 0` (above) and the kernel is N(m₁, S₁₁) at every `x₂`
  (`EuclideanSpace.gaussianCondKernel_of_submatrix_eq_zero`), the unconditional first marginal
  (`TauCeti.Probability.map_comp_multivariateGaussian` along `Sum.inl`);
- with one observed coordinate, of variance `S₂₂ ≥ 0`, the mean at retained coordinate `i` has slope
  `Sᵢ₂/S₂₂`, which is `0` when `S₂₂ = 0` (`EuclideanSpace.gaussianCondMean_apply_of_unique`), and
  for two coordinates with variances `v₁`, `v₂` and correlation `ρ` the kernel is the scalar Gaussian with mean `m₁ + ρ√(v₁/v₂)(x₂ − m₂)` and
  variance `v₁(1 − ρ²)` (`EuclideanSpace.gaussianCondMean_apply_of_unique_of_posSemidef`,
  `Matrix.gaussianCondCov_apply_of_unique_of_posSemidef`,
  `EuclideanSpace.gaussianCondKernel_apply_of_unique_of_posSemidef`,
  `TauCeti.Probability.condDistrib_multivariateGaussian_of_unique`), zero variances included.

*Needs:* Mathlib `ProbabilityTheory.condDistrib`, `ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`,
`ProbabilityTheory.Kernel`, `EuclideanSpace.sumEquivProd`, `Matrix.submatrix`, `cfc`,
`Submodule.orthogonalProjectionOnto`, `LinearMap.IsSymmetric.orthogonal_range`; Tau Ceti
`LinearMap.moorePenroseInverse`; §5.2, §5.3.

**Checks.**

- Rank change. For `Z` standard Gaussian and the joint law of `(Z, tZ)`, with variances `1`, `t²` and
  covariance `t`, the kernel at observed value `0` is the point mass at `0` for `t ≠ 0` (slope
  `t/t² = 1/t`, residual variance `1 − t·t⁻²·t = 0`) and N(0, 1) for `t = 0` (`S₂₂ = 0`,
  `S₂₂⁺ = 0`). The conditional law is not continuous in the covariance where the observed rank drops.
- Two coordinates with `v₁ = 4`, `v₂ = 1` and covariance `1` (`ρ = 1/2`): the slope is
  `ρ√(v₁/v₂) = 1 = S₁₂/S₂₂` and the conditional variance `v₁(1 − ρ²) = 3 = 4 − 1²/1`. The slope
  `ρ√(v₂/v₁) = 1/4`, with the variances exchanged, is wrong.
- Identical coordinates of positive variance: for `X = (Z, Z)` with `Z` of law N(μ, v), `v > 0`, the
  slope is `v/v = 1` and the residual variance `v − v·v⁻¹·v = 0`, so the kernel at `x₂` is the point
  mass at `x₂`.
- Observing `(Z, Z)` determines `Z` although the observed covariance `S₂₂ = vJ`, `J` the 2×2
  all-ones matrix, is singular: `S₂₂⁺ = J/(4v)`, `S₁₂S₂₂⁺ = (1/2, 1/2)` and the residual variance is
  `v − v = 0`, so the kernel at `(u, u)` is the point mass at `u`. With the totalized ordinary inverse,
  `S₂₂⁻¹ = 0`, the formula would return the unconditional law N(μ, v).
- For `S₁₁ = (a)`, `S₁₂ = S₂₁ᵀ = (b, 0)`, `S₂₂ = diag(1, 0)` and `a ≥ b²`, the joint covariance is
  positive semidefinite (its leading minors are `a ≥ 0` and `a − b² ≥ 0`), `S₂₂⁺ = diag(1, 0)`, and the
  kernel at `x₂ = (u, w)` is N(m₁ + b(u − m₂,₁), a − b²), independent of `w`; the residual variance is
  positive for `a > b²` and the law is a point mass for `a = b²`.
- A constant observed block, `S₂₂ = 0`, forces `S₁₂ = 0`, and the kernel is the first marginal
  N(m₁, S₁₁) at every observed value.

### 5.5 Multinomial

For a finite type `ι`, which is nonempty since the simplex over an empty type is empty, `n : ℕ` and
`p : Convexity.StdSimplex ℝ≥0 ι` with weights `pᵢ`, the multinomial law
`TauCeti.Probability.multinomialMeasure n p` is the Dirac sum on `ι → ℕ` with mass

    n! / ∏ᵢ kᵢ! · ∏ᵢ pᵢ^kᵢ    if ∑ᵢ kᵢ = n,    and 0 otherwise

(`TauCeti.Probability.multinomialMeasure_def`, `TauCeti.Probability.multinomialMeasure_real_singleton`,
`TauCeti.Probability.multinomialMeasure_singleton`) (Johnson, Kemp and Kotz, ch. 3, for the binomial
marginals). The parameter type has no invalid branch: the law is a probability measure for every `n`
and `p` (`TauCeti.Probability.isProbabilityMeasure_multinomialMeasure`), the point mass at `0` for
`n = 0` (`TauCeti.Probability.multinomialMeasure_zero`). Its API:

- Masses and support: the mass of `k` is nonzero exactly when `∑ᵢ kᵢ = n` and no cell of weight
  `0` has a positive count (`TauCeti.Probability.multinomialMeasure_singleton_ne_zero_iff`); the law
  is concentrated on `{∑ᵢ kᵢ = n}` (`TauCeti.Probability.multinomialMeasure_sum_eq`); every function is
  integrable and integrals are finite sums (`TauCeti.Probability.integrable_multinomialMeasure`,
  `TauCeti.Probability.integral_multinomialMeasure`).
- Binomial marginals: the count in cell `i` has law `ProbabilityTheory.binomial n pᵢ`, with `pᵢ`
  read in the unit interval by `Convexity.StdSimplex.multinomialCellProbability`
  (`TauCeti.Probability.map_eval_multinomialMeasure`).
- Aggregation: for every `f : ι → κ`, the fibre-sum map `FunOnFinite.map f` carries
  `multinomialMeasure n p` to `multinomialMeasure n (Convexity.StdSimplex.map f p)`
  (`TauCeti.Probability.map_funOnFinite_map_multinomialMeasure`).
- The cast `TauCeti.Probability.multinomialToEuclidean k = (EuclideanSpace.equiv ι ℝ).symm (i ↦ kᵢ)`
  is a measurable embedding (`TauCeti.Probability.measurableEmbedding_multinomialToEuclidean`). The
  cast law has mean `np` (`TauCeti.Probability.integral_id_map_multinomialToEuclidean_multinomialMeasure`)
  and covariance `n(diag p − ppᵀ)`, entrywise
  (`TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_multinomialMeasure`, on the count
  vectors `TauCeti.Probability.covariance_cast_apply_multinomialMeasure`), as a covariance matrix
  (`TauCeti.Probability.covMatrix_map_multinomialToEuclidean_multinomialMeasure`) and as a covariance
  bilinear form (`TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_multinomialMeasure`).
- Transforms of the cast law `X`: for every frequency `t` and direction `θ`,

      φ(t) = (∑ⱼ pⱼ e^(i tⱼ))^n,    M_⟪θ,X⟫(t) = (∑ⱼ pⱼ e^(t θⱼ))^n,    D_⟪θ,X⟫ = ℝ

  (`TauCeti.Probability.charFun_map_multinomialToEuclidean_multinomialMeasure`,
  `TauCeti.Probability.mgf_inner_multinomial`, `TauCeti.Probability.integrableExpSet_inner_multinomial`),
  with cumulant-generating function `log((∑ⱼ pⱼ e^(t θⱼ))^n)` (`TauCeti.Probability.cgf_inner_multinomial`).

*Needs:* Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.map`, `FunOnFinite.map`,
`ProbabilityTheory.binomial`, `EuclideanSpace.equiv`, `MeasureTheory.charFun`; Tau Ceti
`TauCeti.covMatrix`; §1.2, §5.1.

**Checks.**

- On `Fin 3` with `n = 2` and `p = (1/2, 1/4, 1/4)`, the count vector `(1, 1, 0)` has mass
  `2!/(1!·1!·0!) · (1/2)(1/4) = 1/4`; without the multinomial coefficient it would be `1/8`, and the
  masses would not add up to `1`.
- On `Fin 2` with `p = (q, 1 − q)`, the first count has law Bin(n, q) and the second is `n` minus the
  first; the covariance matrix has `nq(1 − q)` on the diagonal and `−nq(1 − q)` off it.
- Merging the last two cells of the `Fin 3` example gives `Fin 2` with weights `(1/2, 1/2)`, and the
  mass of `(1, 1)` is `1/4 + 1/4 = 1/2`, the Bin(2, 1/2) mass at `1`.

### 5.6 Dirichlet

For finite `ι` and `a : ι → ℝ`, the Dirichlet law `TauCeti.Probability.dirichletMeasure a` on
`EuclideanSpace ℝ ι` is, when `ι` is nonempty and every `aᵢ > 0`, the image of the product of
`ProbabilityTheory.gammaMeasure (aᵢ) 1` under the normalization
`TauCeti.Probability.dirichletNormalize x = (xᵢ / ∑ⱼ xⱼ)ᵢ` (`TauCeti.Probability.dirichletMeasure_of_pos`),
and the zero measure otherwise, empty `ι` included
(`TauCeti.Probability.dirichletMeasure_eq_zero_of_invalid`). It is a probability measure exactly in
the valid case (`TauCeti.Probability.isProbabilityMeasure_dirichletMeasure`,
`TauCeti.Probability.isProbabilityMeasure_dirichletMeasure_iff`). The normalization returns the zero
vector when the total vanishes (`TauCeti.Probability.dirichletNormalize_eq_zero_of_sum_eq_zero`); that
branch is null because the total of the Gamma coordinates is almost surely positive
(`TauCeti.Probability.ae_pos_sum_pi_gammaMeasure`). For positive shapes every coordinate is almost
surely positive (`TauCeti.Probability.ae_pos_dirichletMeasure`), and the law is carried by the closed
simplex, the preimage under `EuclideanSpace.equiv ι ℝ` of the range of the weights of
`Convexity.StdSimplex ℝ ι` (`TauCeti.Probability.ae_mem_stdSimplex_dirichletMeasure`,
`TauCeti.Probability.ae_sum_eq_one_dirichletMeasure`).

**Moments.** For positive shapes and `A = ∑ᵢ aᵢ`:

    E[Xᵢ] = aᵢ/A,    Var Xᵢ = aᵢ(A − aᵢ)/(A²(A + 1)),    Cov(Xᵢ, Xⱼ) = −aᵢaⱼ/(A²(A + 1))  (i ≠ j)

(`TauCeti.Probability.integral_eval_dirichletMeasure`, `TauCeti.Probability.variance_eval_dirichletMeasure`,
`TauCeti.Probability.covariance_eval_dirichletMeasure_of_ne`), with the Bochner mean
(`TauCeti.Probability.integral_id_dirichletMeasure`), the covariance matrix
`(A²(A + 1))⁻¹(A·diag(a) − aaᵀ)` (`TauCeti.Probability.covMatrix_dirichletMeasure`) and the covariance
bilinear form (`TauCeti.Probability.covarianceBilin_dirichletMeasure`); all moments are finite
(`TauCeti.Probability.memLp_id_dirichletMeasure`).

**Aggregation and marginals.** For a surjective `f : ι → κ`, summing coordinates over fibres
(`TauCeti.euclideanFiberSum f`) carries Dirichlet(a) to the Dirichlet law with shapes
`∑ i with f i = j, aᵢ` (`TauCeti.Probability.map_euclideanFiberSum_dirichletMeasure`); surjectivity
keeps every new shape positive. For a block `s` with `s` and its complement nonempty, `∑ i ∈ s, Xᵢ`
has law Beta(∑ i ∈ s, aᵢ, ∑ i ∉ s, aᵢ) (`TauCeti.Probability.map_sum_dirichletMeasure`; Johnson, Kotz and
Balakrishnan, vol. 2, for the Gamma-ratio construction of the Beta law). With at least
two coordinates, `Xᵢ` has law Beta(aᵢ, A − aᵢ) (`TauCeti.Probability.map_eval_dirichletMeasure`, whose
second shape is written `∑ j ≠ i, aⱼ`); with one coordinate the law is the point mass at the vector
`1` (`TauCeti.Probability.dirichletMeasure_eq_dirac_of_card_eq_one`), not a Beta law with second shape
`0`; on `Fin 2`, `X₀` has law Beta(a₀, a₁) (`TauCeti.Probability.map_eval_zero_dirichletMeasure_fin_two`).

**Chart density.** Delete a coordinate `i₀`, let `J = {i // i ≠ i₀}`, and reconstruct the deleted
coordinate as `1 − ∑ j ∈ J, xⱼ` (`TauCeti.Probability.dirichletChart i₀`). On the region
`xⱼ > 0`, `∑ j ∈ J, xⱼ < 1` (`TauCeti.Probability.dirichletChartRegion i₀`) the chart density is

    Γ(A) / ∏ᵢ Γ(aᵢ) · ∏ j ∈ J, xⱼ^(aⱼ − 1) · (1 − ∑ j ∈ J, xⱼ)^(a_i₀ − 1)

and it is `0` elsewhere (`TauCeti.Probability.dirichletChartPDFReal`,
`TauCeti.Probability.dirichletChartPDFReal_of_mem`, `TauCeti.Probability.dirichletChartPDFReal_of_notMem`),
with `ENNReal.ofReal` companion `TauCeti.Probability.dirichletChartPDF`. For positive shapes the
Dirichlet law is the image under the chart of volume on `J → ℝ` weighted by the chart density
(`TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF`), which has total mass
one (`TauCeti.Probability.lintegral_dirichletChartPDF_eq_one`); the change of variables
`(s, y) ↦ (s(1 − ∑ⱼ yⱼ), s·y)` has Jacobian determinant `s^(card J)`
(`TauCeti.Probability.det_fderiv_dirichletUnchart`, `TauCeti.Probability.map_dirichletUnchart_withDensity`).
Prove that there is no ambient-volume density: for positive shapes the Dirichlet law is mutually
singular with respect to volume on `EuclideanSpace ℝ ι`, being carried by the hyperplane
`∑ᵢ xᵢ = 1`, a null set. The bounded support makes every directional exponential-integrability domain
equal to `ℝ` (`TauCeti.Probability.integrableExpSet_inner_dirichletMeasure`); no closed form of a
Dirichlet transform, and no renamed chart integral standing for one, is part of this roadmap.

**Factorizations.** For independent `Gᵢ` with laws Gamma(aᵢ, r), all `aᵢ > 0` and a common rate
`r > 0`, the pair `(G/∑ᵢ Gᵢ, ∑ᵢ Gᵢ)` has law Dirichlet(a) ⊗ Gamma(A, r)
(`TauCeti.Probability.map_dirichletNormalize_sum_pi_gammaMeasure`): the normalized vector is
Dirichlet at every common rate (`TauCeti.Probability.map_dirichletNormalize_pi_gammaMeasure`) and
independent of the total (`TauCeti.Probability.indepFun_dirichletNormalize_sum_of_hasLaw_gammaMeasure`;
random-variable forms `TauCeti.Probability.hasLaw_dirichletNormalize_sum_prod_gammaMeasure_of_iIndepFun`,
`TauCeti.Probability.hasLaw_dirichletNormalize_gammaMeasure_of_iIndepFun`), the zero-total branch being
null as above. One step of stick breaking: for positive shapes `a` on `Option ι`, `ι` nonempty, the
coordinate at `none` and the renormalized remaining coordinates have law
`Beta(a none, ∑ᵢ a (some i)) ⊗ Dirichlet(a ∘ some)`
(`TauCeti.Probability.map_dirichletStickSplit_dirichletMeasure`,
`ProbabilityTheory.HasLaw.dirichletStickSplit`, `ProbabilityTheory.HasLaw.indepFun_dirichletStickSplit`),
and conversely an independent Beta fraction and Dirichlet remainder rebuild Dirichlet(a)
(`TauCeti.Probability.map_dirichletStickInsert_prod_betaMeasure_dirichletMeasure`,
`ProbabilityTheory.IndepFun.hasLaw_dirichletStickInsert`).

Prove the stick-breaking construction on `Fin d`, `d ≥ 2`, with positive shapes: for independent
`Vᵢ` with laws Beta(aᵢ, ∑ j > i, aⱼ), `i < d − 1`, the vector with coordinates

    Xᵢ = Vᵢ ∏ j < i, (1 − Vⱼ)   (i < d − 1),    X_(d−1) = ∏ j < d − 1, (1 − Vⱼ)

has law Dirichlet(a); conversely, under Dirichlet(a) the inverse ratios
`Vᵢ = Xᵢ/(1 − ∑ j < i, Xⱼ)`, `i < d − 1`, whose denominators are almost surely positive, are
independent with these Beta laws. With one coordinate there is no ratio and the vector is the
constant `1`.

**Spacings.** For `n` independent unit uniforms, sorted, with the endpoints `U₍₀₎ = 0` and
`U₍ₙ₊₁₎ = 1` adjoined, the `n + 1` spacings (`TauCeti.tupleSpacings 0 1` of the sorted vector) have
law Dirichlet(1, …, 1) on `Fin (n + 1)` (`TauCeti.Probability.map_tupleSpacings_orderStatistics_pi_uniformMeasure`,
`TauCeti.Probability.hasLaw_tupleSpacings_orderStatistics_iid_uniformMeasure`). The proof uses the
joint density of §4.6 and the partial-sum change of coordinates, of determinant one, not the
marginal laws. At `n = 0` the single spacing is the constant `1`.

**Real-power moments.** For positive shapes and real `qᵢ` with every `aᵢ + qᵢ > 0`, the product
`∏ᵢ Xᵢ^(qᵢ)` is integrable (`TauCeti.Probability.integrable_prod_rpow_dirichletMeasure`) and

    E[∏ᵢ Xᵢ^(qᵢ)] = Γ(A)/Γ(A + ∑ᵢ qᵢ) · ∏ᵢ Γ(aᵢ + qᵢ)/Γ(aᵢ)

(`TauCeti.Probability.integral_prod_rpow_dirichletMeasure`; natural powers
`TauCeti.Probability.integral_prod_pow_dirichletMeasure`). Prove the converse: with at least two
coordinates, if `aᵢ + qᵢ ≤ 0` for some `i`, then `∏ᵢ Xᵢ^(qᵢ)` is not integrable. With one coordinate
every such product is `1` almost surely, integrable with integral `1` for all real powers
(`TauCeti.Probability.integrable_prod_rpow_dirichletMeasure_of_card_eq_one`,
`TauCeti.Probability.integral_prod_rpow_dirichletMeasure_of_card_eq_one`).

**Concentration limits.** Let `ι` be nonempty, let `p` be a point of the standard simplex
(`Convexity.StdSimplex ℝ ι`, or `Convexity.StdSimplex ℝ≥0 ι` in the second limit) with all weights
positive, and embed `p` and the vertices `eᵢ` of the simplex in `EuclideanSpace ℝ ι` through
`EuclideanSpace.equiv ι ℝ`. In `MeasureTheory.ProbabilityMeasure (EuclideanSpace ℝ ι)`, with its
topology of weak convergence, and through positive `c`:

    Dirichlet(c p) ⇒ δ_p  (c → ∞),        Dirichlet(c p) ⇒ ∑ᵢ pᵢ δ_(eᵢ)  (c ↓ 0)

(`TauCeti.Probability.tendsto_dirichletMeasure_concentration_atTop`;
`TauCeti.Probability.tendsto_dirichletMeasure_concentration_atBot`, whose limit is written as the image
of the categorical law `TauCeti.Probability.categoricalMeasure p` under the standard basis, and whose
filter is `Filter.atBot` on the positive reals). The first limit rests on
`E‖X − p‖² = (1 − ∑ᵢ pᵢ²)/(c + 1)` (`TauCeti.Probability.integral_norm_sub_sq_dirichletMeasure_smul`),
the sum of the coordinate variances; the second on `E[∑ᵢ Xᵢ²] = (c ∑ᵢ pᵢ² + 1)/(c + 1)`
(`TauCeti.Probability.integral_norm_sq_dirichletMeasure_smul`). The one-coordinate case is included.
For `0 < p < 1`, Beta(cp, c(1 − p)) tends to the point mass at `p` as `c → ∞` and to
`(1 − p)δ₀ + pδ₁` as `c ↓ 0` (`TauCeti.Probability.tendsto_betaMeasure_concentration_atTop`,
`TauCeti.Probability.tendsto_betaMeasure_concentration_atBot`, the latter with limit
`ProbabilityTheory.bernoulliMeasure 1 0 p`). These are limits through positive shapes; the definitions
at invalid shapes (the zero Dirichlet measure, and Mathlib's Beta law at a zero shape) are unchanged.

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`,
`ProbabilityTheory.bernoulliMeasure`, `Convexity.StdSimplex`, `EuclideanSpace.equiv`,
`MeasureTheory.ProbabilityMeasure`, `MeasureTheory.Measure.MutuallySingular`,
`MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`, `Real.Gamma`; Tau Ceti
`TauCeti.Probability.ae_pos_sum_pi_gammaMeasure`; §1.6, §1.7, §4.3, §4.6, §5.1.

**Checks.**

- For `a = (1, 1, 1)` the law is uniform on the triangle: the chart density is the constant
  `Γ(3) = 2` on a region of area `1/2`, the mean is `1/3`, `Var Xᵢ = 2/36 = 1/18` (the Beta(1, 2)
  variance) and `Cov(Xᵢ, Xⱼ) = −1/36`. A chart density without the factor `Γ(A)/∏ᵢ Γ(aᵢ)` would have
  mass `1/2`.
- With one coordinate the law is the point mass at `1`, whereas the marginal formula Beta(a, A − a)
  would give Beta(a, 0), the zero measure under Mathlib's normalization `1/B(a, 0) = 0`.
- For `a = (1, 1)`, `X₀` is uniform and `E[X₀^(−1/2)] = 2 = Γ(2)/Γ(3/2) · Γ(1/2)/Γ(1)`, while at
  `q₀ = −1`, `a₀ + q₀ = 0` and `E[1/X₀] = ∞`: the threshold is sharp.
- At `c = 2` and `p = (1/2, 1/2)`, `E[U² + (1 − U)²] = 2/3 = (2·(1/2) + 1)/3` for `U` uniform.
- On `Fin 2` the Gamma–Dirichlet factorization reduces to the Gamma–Beta factorization of §4.3: the
  first coordinate of `G/(G₀ + G₁)` is `G₀/(G₀ + G₁)`, of law Beta(a₀, a₁), independent of the total.
- Stick breaking for `a = (1, 1, 1)`: `V₀` has law Beta(1, 2) and `V₁` law Beta(1, 1), so
  `E[X₁] = (1/2)(2/3) = 1/3`. Taking the second shape to be only the next shape, `V₀` of law
  Beta(1, 1), would give `E[X₀] = 1/2`.
- For one uniform point the spacings are `(U, 1 − U)`, of law Dirichlet(1, 1); for two, the first
  spacing is the minimum, of mean `1/3 = 1/(n + 1)`.

### 5.7 Parameter measurability

The shared parameter maps, each for the full totalized family with the Giry measurable structure:

- Gaussian: `(m, S) ↦ N(m, S)` is measurable on `EuclideanSpace ℝ ι × Matrix ι ι ℝ`, that is jointly in
  the mean and all covariance entries, invalid covariances included
  (`ProbabilityTheory.measurable_multivariateGaussian`), in the coordinate form

      Measurable fun q : EuclideanSpace ℝ ι × (ι → ι → ℝ) => multivariateGaussian q.1 (Matrix.of q.2)

- multinomial: `(n, p) ↦ multinomialMeasure n p` is measurable on `ℕ × Convexity.StdSimplex ℝ≥0 ι`
  (`TauCeti.Probability.measurable_multinomialMeasure`);
- Dirichlet: `a ↦ dirichletMeasure a` is measurable on `ι → ℝ` (`TauCeti.Probability.measurable_dirichletMeasure`);
- the conditional Gaussian kernel of §5.4 is measurable in mean, covariance entries and observed
  value (`EuclideanSpace.measurable_gaussianCondKernel`).

*Needs:* Mathlib `MeasureTheory.Measure.instMeasurableSpace`, `Matrix.of`; §0.4, §5.4, §5.5, §5.6.

### 5.8 Poisson splitting and conditioning

For a nonempty finite type of categories and rates `λᵢ : ℝ≥0` with `Λ = ∑ᵢ λᵢ` (Johnson, Kemp and
Kotz, ch. 4):

- Independent Poisson counts have Poisson total of rate `Λ`
  (`TauCeti.Probability.map_sum_pi_poissonMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_sum_poissonMeasure`),
  zero rates included.
- If `Λ > 0`, conditioning the independent counts on the total `n` gives the multinomial law with
  weights `λᵢ/Λ`, for every `n` (`TauCeti.Probability.cond_pi_poissonMeasure`,
  `ProbabilityTheory.iIndepFun.hasLaw_cond_sum_poissonMeasure`); the weight vector is specified
  coordinatewise, so no normalization map is chosen. In terms of a total rate `r` and weights `p`, the
  restriction of the product of the Poisson(r pᵢ) laws to `{∑ᵢ kᵢ = n}` is the Poisson(r) mass of `n`
  times `multinomialMeasure n p`, for every `r` (`TauCeti.Probability.restrict_pi_poissonMeasure_mul_weights`),
  and conditioning gives `multinomialMeasure n p` whenever the total `n` has positive mass
  (`TauCeti.Probability.cond_pi_poissonMeasure_mul_weights`,
  `TauCeti.Probability.cond_pi_poissonMeasure_mul_weights_of_pos`).
- Conversely, a Poisson total of rate `Λ ≥ 0` allocated with multinomial weights `p` gives independent
  Poisson counts of rates `Λpᵢ`:

      (poissonMeasure Λ).bind (fun n => multinomialMeasure n p) =
        Measure.pi (fun i => poissonMeasure (Λ * p.weights i))

  (`TauCeti.Probability.bind_poissonMeasure_multinomialMeasure`,
  `ProbabilityTheory.HasLaw.iIndepFun_of_poisson_multinomial`), zero weights and `Λ = 0` included.
- At all-zero rates, conditioning on a positive total gives the zero measure
  (`TauCeti.Probability.cond_pi_poissonMeasure_zero_of_ne_zero`, stated with the point masses that
  the rate-zero Poisson laws are, `TauCeti.Probability.poissonMeasure_zero`), and conditioning on total
  `0` gives the point mass at the zero vector (`TauCeti.Probability.cond_pi_poissonMeasure_zero`),
  without normalized weights.

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.cond`,
`MeasureTheory.Measure.bind`, `MeasureTheory.Measure.pi`; §1.4, §5.5.

**Checks.**

- For rates `(2, 1, 0)` the count vector `(1, 1, 0)` has probability `2e^(−2) · e^(−1) · 1 = 2e^(−3)`
  under the product, and `P(N = 2) · 2!·(2/3)(1/3) = (9/2)e^(−3) · (4/9) = 2e^(−3)` under the mixture.
- A category of weight `0` receives the count `0` almost surely, the Poisson law of rate `0`, and it
  stays independent of the other counts: splitting retains independence for zero-rate categories.
- At all-zero rates a positive total is impossible and conditions to the zero measure, while total
  `0` conditions to the point mass at the zero vector; no weight vector `λ/Λ` is formed.

### Examples

- For a bivariate standard Gaussian with correlation `ρ`, `|ρ| < 1`, the conditional law of `X₁`
  given `X₂ = x` is N(ρx, 1 − ρ²); at `ρ = 1` it is the point mass at `x`.
- For `Z` standard Gaussian on `ℝ³` and `K` the line spanned by `(1, 1, 1)`, `‖P_K Z‖² = 3Z̄²` has law
  χ²(1) and `‖Z − P_K Z‖²` has law χ²(2), independent of it, with `Z̄` the coordinate mean.
- On `Fin 3` with `n = 2` and `p = (1/2, 1/4, 1/4)`, the cast multinomial law has covariance matrix
  with diagonal `(1/2, 3/8, 3/8)` and off-diagonal entries `−1/4`, `−1/4`, `−1/8`.
- Dirichlet(2, 3) on `Fin 2` has first coordinate of law Beta(2, 3), with mean `2/5` and variance
  `1/25`.
- A Poisson(5) total split with weights `(3/5, 2/5)` gives independent Poisson(3) and Poisson(2)
  counts; conditioned on total `5`, these return the Bin(5, 3/5) law for the first count.

### Dependencies

Layer 0 (§0.1 density interfaces, §0.2 Radon–Nikodym derivatives, §0.4 parameter measurability),
Layer 1 (§1.2 binomial, §1.4 Poisson, §1.6 Gamma, §1.7 Beta, §1.10 real Gaussian), Layer 3 (§3.5
chi-squared) and Layer 4 (§4.1 for projected squared norms and the scalar factor of Gaussian
quadratic forms; §4.3 for Dirichlet normalization, the Gamma–Dirichlet factorization and stick
breaking; §4.6 for the joint density behind the spacings). Within the layer, §5.4 uses §5.2 and §5.3,
§5.5 and §5.6 use §5.1, §5.7 uses §5.4–§5.6, and §5.8 uses §5.5. From Mathlib: the multivariate
Gaussian and the Gaussian independence criteria under `Mathlib/Probability/Distributions/Gaussian/`,
covariance and the covariance bilinear form, `ProbabilityTheory.condDistrib`, matrix functional calculus and
positive semidefinite matrices, the standard simplex, and weak convergence of probability measures.
From Tau Ceti: the Gaussian, multinomial and Dirichlet files under
`TauCeti/Probability/Distributions/`, the covariance matrix under `TauCeti/Probability/Moments/`, and
the covariance pseudoinverse, Schur complements, matrix square roots and positive semidefinite blocks
under `TauCeti/Analysis/Matrix/`.

## Layer 6: symmetric matrices and Wishart distributions

The laws of this layer live on the real symmetric `p × p` matrices, for a dimension `p : ℕ` that
may be zero. §6.1 fixes the carrier, its Frobenius geometry and the Lebesgue measure normalised by
the upper-triangular coordinates; §6.2 and §6.3 supply the Cholesky change of variables and the
multivariate Gamma integral that normalise the Wishart density; §6.4 to §6.8 build the three Wishart
families (the nonsingular law of real degree, the Gaussian-Gram law of natural degree and the
inverse-Wishart law) with their transforms, moments, decompositions, parameter measurability and
diagonal marginals. Throughout, a matrix expression evaluated at a point of the carrier refers to the
underlying matrix of that bundled symmetric value; for a positive semidefinite `S`, `S_s` is `S`
bundled into the carrier (with the membership proof given by `Matrix.isHermitian_iff_isSelfAdjoint`);
and a transform argument `Θ` is a point of the carrier, never a raw matrix with a separate symmetry
hypothesis. `S ≻ 0` and `S ⪰ 0` mean `S.PosDef` and `S.PosSemidef`, `√S` is `CFC.sqrt S`, and every
exponent is a real power (`Real.rpow`) with dimensions and degrees cast to `ℝ` before subtraction
or division. We write `W(n, S)`, `G(ν, S)` and `IW(n, S)` for the nonsingular Wishart, Gaussian-Gram
Wishart and inverse-Wishart laws of §6.4 and §6.6, `χ²_k` for the chi-squared law
`TauCeti.Probability.chiSquaredMeasure k` of §3.5, and `N(0, S)` for
`ProbabilityTheory.multivariateGaussian 0 S`. The matrix Jacobians are those of Muirhead, ch. 2; the
multivariate Gamma function, the Wishart density and moment-generating function and the Bartlett
decomposition are those of Muirhead, ch. 3; Eaton develops the same Wishart theory through
invariant measures.

### 6.1 Symmetric carrier and volume

The carrier is Mathlib's self-adjoint subspace `selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`.
Over `ℝ`, `star` is transposition, so this is the subspace of symmetric matrices, and
`Matrix.isHermitian_iff_isSelfAdjoint` connects membership with the Hermitian and spectral API
(`selfAdjoint.isHermitian_coe`, `selfAdjoint.coe_apply_comm`). No second submodule of symmetric
matrices is introduced. The carrier keeps the product topology and uniformity of
`Matrix (Fin p) (Fin p) ℝ` and their subtype instances, definitionally:

- its norm is the Frobenius norm induced from Mathlib's `Matrix.frobeniusNormedAddCommGroup` and
  `Matrix.frobeniusNormedSpace`, whose topology and uniformity are the product ones by definition;
  the induced metric of `TauCeti.symmetricMatrixNormedAddCommGroup` is rebuilt on the subtype
  uniformity, so its uniform and topological structures are the subtype instances on the nose;
- the Frobenius inner product of matrices is `Matrix.frobeniusInnerProductSpace`, the entrywise
  pairing `⟪A, B⟫ = ∑ i, ∑ j, A i j * B i j` (`Matrix.frobenius_inner_def`,
  `Matrix.frobenius_real_inner_eq_sum_mul`), compatible with the Frobenius norm and equal to
  `trace (Aᴴ * B)` (`Matrix.frobenius_inner_eq_trace_conjTranspose_mul`); like the Frobenius norm it
  is a scoped instance. The carrier's inner product `TauCeti.symmetricMatrixInnerProductSpace` pairs
  the underlying matrices (`selfAdjoint.coe_inner`). The inner product that Mathlib attaches to a
  positive semidefinite matrix, `Matrix.toMatrixInnerProductSpace`, is not used: its topology is not
  definitionally the product topology;
- the carrier has the instances `TauCeti.symmetricMatrixIsUniformAddGroup`,
  `TauCeti.symmetricMatrixSecondCountableTopology`, `TauCeti.symmetricMatrixCompleteSpace` (from
  finite-dimensional completeness), `TauCeti.symmetricMatrixContinuousENorm` and
  `TauCeti.symmetricMatrixBorelSpace`; its measurable structure is the subtype structure of the Borel
  structure of matrices, which is the Borel structure of the subtype topology, and its `volume` is
  Mathlib's `measureSpaceOfInnerProductSpace`, the Frobenius volume.

The carrier has dimension `p * (p + 1) / 2` (`TauCeti.finrank_symmetricMatrix`); the
positive-definite cone is open and measurable in it (`TauCeti.isOpen_setOfPred_posDefMatrix`,
`TauCeti.measurableSet_posDefMatrix`) and, as a subtype, is `TauCeti.PosDefMatrix p`; and the
Frobenius pairing is the trace pairing, `⟪A, Θ⟫ = trace (Θ * A)` (`selfAdjoint.inner_eq_trace_mul`),
so that `MeasureTheory.charFun` on the carrier uses the pairing of the Wishart trace statistics.

Upper-triangular entries are read through the index type
`TauCeti.upperTriangle p = {ij : Fin p × Fin p // ij.1 ≤ ij.2}`, which has `p * (p + 1) / 2`
elements (`TauCeti.card_upperTriangle`), and the continuous linear equivalence
`TauCeti.symmetricCoordinates p` from the carrier to `TauCeti.upperTriangle p → ℝ`, whose inverse
reflects the coordinates across the diagonal (`TauCeti.coe_symmetricCoordinates_symm_apply_of_le`,
`TauCeti.coe_symmetricCoordinates_symm_apply_of_ge`); its measurable-equivalence form is
`TauCeti.symmetricCoordinatesMeasurableEquiv p`. Symmetric Lebesgue measure
`TauCeti.symmetricLebesgue p` is the pushforward of product Lebesgue measure on the coordinates under
the inverse coordinate map. Both coordinate maps are measure preserving
(`TauCeti.measurePreserving_symmetricCoordinates_symm`,
`TauCeti.measurePreserving_symmetricCoordinates`), and symmetric Lebesgue measure is an additive Haar
measure in the sense of `MeasureTheory.Measure.IsAddHaarMeasure`
(`TauCeti.symmetricLebesgueIsAddHaarMeasure`), as Mathlib's change-of-variables API asks. The
Frobenius volume is a different Haar normalisation
(`TauCeti.volume_symmetricMatrix_eq_smul_symmetricLebesgue`):

    volume = ENNReal.ofReal (Real.rpow 2 ((p : ℝ) * ((p : ℝ) - 1) / 4)) • TauCeti.symmetricLebesgue p

with a real exponent and the positive multiplier coerced to `ℝ≥0∞`: each of the `p (p − 1)/2`
off-diagonal directions `Eᵢⱼ + Eⱼᵢ` has Frobenius norm `√2`. Only the normalisation by the
upper-triangular coordinates produces the classical Wishart constants of §6.3 to §6.6; an arbitrary
Haar measure does not. In dimension zero symmetric Lebesgue measure is the Dirac measure at the
unique matrix (`TauCeti.symmetricLebesgue_zero`), and in dimension one reading the single entry,
`TauCeti.symmetricFinOneEquiv`, carries it to Lebesgue measure on `ℝ`
(`TauCeti.measurePreserving_symmetricFinOneEquiv`).

The singular symmetric matrices form a null set for symmetric Lebesgue measure
(`TauCeti.symmetricLebesgue_setOf_det_eq_zero`): the determinant is a polynomial in the
upper-triangular coordinates, nonzero because the identity has determinant one
(`TauCeti.symmetricDetPolynomial_ne_zero`), and the zero locus of a nonzero polynomial is
Lebesgue-null. Expansion along a diagonal coordinate, whose fibres have at most one root outside a
vanishing complementary minor, with Fubini and induction on `p`, is an alternative route.

For `C : Matrix.GeneralLinearGroup (Fin p) ℝ`, congruence `A ↦ C * A * Cᵀ` is the continuous linear
automorphism `Matrix.GeneralLinearGroup.symmetricCongruence C` of the carrier; more generally a
rectangular `M : Matrix (Fin q) (Fin p) ℝ` gives the linear map `Matrix.symmetricCongruenceLinearMap M`
between the carriers of sizes `p` and `q`, adjoint for the Frobenius pairing to congruence by `Mᵀ`
(`Matrix.inner_symmetricCongruenceLinearMap`). In the upper-triangular coordinates congruence by `C`
has determinant `(det C)^(p + 1)` (`Matrix.GeneralLinearGroup.det_symmetricCongruence`; for an
arbitrary square matrix, `Matrix.det_symmetricCongruenceLinearMap`), and it pushes symmetric
Lebesgue measure forward to `|det C|^(−(p + 1))` times itself
(`Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue`), also after restriction to
the positive-definite cone, which it preserves
(`Matrix.GeneralLinearGroup.map_symmetricCongruence_restrict_posDef`) (Muirhead, ch. 2).

*Needs:* Mathlib `selfAdjoint.submodule`, `Matrix.isHermitian_iff_isSelfAdjoint`,
`Matrix.frobeniusNormedAddCommGroup`, `Matrix.frobeniusNormedSpace`,
`measureSpaceOfInnerProductSpace`, `MeasureTheory.Measure.IsAddHaarMeasure`,
`Matrix.GeneralLinearGroup`; Tau Ceti `Matrix.frobeniusInnerProductSpace` and the declarations named
above.

**Checks.**

- The topology and the uniformity that the Frobenius norm induces on the symmetric subspace are the
  subtype topology and uniformity of the product structure on matrices by definition, not merely
  equal to them: building the structure from the inner product attached to a positive semidefinite
  matrix, or from a norm whose uniformity is not rebuilt on the subtype, would put two
  non-definitionally-equal topologies on one type, and lemmas stated for one would not apply to the
  other.
- For `p = 2` and `A = Θ = E₁₂ + E₂₁`, the Frobenius pairing is `⟪A, Θ⟫ = trace (Θ * A) = 2`, while the
  Euclidean product of the upper-triangular coordinates `(0, 1, 0)` gives `1`; the two inner
  products differ exactly by the factor two on the off-diagonal coordinates that produces the volume
  constant.
- For `p = 2` the Frobenius volume of the coordinate unit cube is `√2` (its edges `E₁₁`, `E₂₂`,
  `E₁₂ + E₂₁` have Gram determinant `2`), and `2^(p (p − 1)/4) = 2^(1/2)`; for `p = 3` both are
  `2^(3/2)`. A natural-number quotient `p * (p - 1) / 4` would give the exponents `0` and `1`, hence
  the wrong factors `1` and `2`.
- For `p = 2` and `C = diag(c₁, c₂)`, congruence acts on the coordinates `(a, b, c)` of
  `[[a, b], [b, c]]` as `(c₁² a, c₁ c₂ b, c₂² c)`, with determinant `(c₁ c₂)³ = (det C)^(p + 1)`. The
  factor `(det C)²` by which congruence multiplies `det A`, or the exponent `2p` of congruence on all
  `p × p` matrices, would give `(c₁ c₂)²` or `(c₁ c₂)⁴`.

### 6.2 Cholesky

The positive-diagonal lower-triangular matrices are the subtype `TauCeti.PosDiagLowerTriangular p`
of the matrices `L` with `L.IsLowerTriangular` (Mathlib's `Matrix.IsLowerTriangular`) and `0 < L i i`
for every `i`; it keeps the subtype topology and Borel structure of `Matrix (Fin p) (Fin p) ℝ`. The
Cholesky factor `TauCeti.cholesky A` of `A : TauCeti.PosDefMatrix p` is built from Mathlib's LDL
decomposition: it is `LDL.lower` times the diagonal matrix of the square roots of the entries of
`LDL.diag` (`TauCeti.cholesky_coe`), lower triangular by `LDL.isLowerTriangular_lower`, with positive
diagonal. Cholesky values are defined only on the positive-definite subtype, and none is needed
outside it.

- A positive-definite `A` is `L * Lᵀ` for `L = cholesky A` (`TauCeti.cholesky_mul_transpose`), and
  `L` is the only positive-diagonal lower-triangular matrix with this property
  (`TauCeti.eq_cholesky_of_mul_transpose_self_eq`, from the uniqueness of positive-diagonal
  lower-triangular Gram factors `Matrix.IsLowerTriangular.eq_of_mul_transpose_self_eq`).
- Reconstruction `TauCeti.choleskyReconstruction L`, the positive-definite matrix `L * Lᵀ`
  (`TauCeti.choleskyReconstruction_coe`), is inverse to the factorisation on both sides
  (`TauCeti.choleskyReconstruction_cholesky`, `TauCeti.cholesky_choleskyReconstruction`); the
  resulting equivalence is `TauCeti.choleskyEquiv`.
- Both maps are continuous (`TauCeti.continuous_cholesky`, `TauCeti.continuous_choleskyReconstruction`)
  and measurable (`TauCeti.measurable_cholesky`, `TauCeti.measurable_choleskyReconstruction`), and form
  the homeomorphism `TauCeti.choleskyHomeomorph` and the measurable equivalence
  `TauCeti.choleskyMeasurableEquiv` between the positive-definite cone and the positive-diagonal
  lower-triangular matrices.
- The diagonal and strictly lower entries, indexed by `TauCeti.lowerTriangle p`, the positions
  `(i, j)` with `j ≤ i`, identify the positive-diagonal lower-triangular matrices with the coordinate
  space `TauCeti.PosDiagLowerCoordinates p` of functions with positive diagonal values. This is a
  homeomorphism for the subtype topologies on both sides,
  `TauCeti.lowerTriangleCoordinatesHomeomorph p`, with measurable form
  `TauCeti.lowerTriangleCoordinates p`; it does not define a replacement topology on the matrices.

Read in lower-triangular coordinates on both sides, `L ↦ L * Lᵀ` is the quadratic self-map
`TauCeti.choleskyReconstructionCoordinates p`, and at every point with positive diagonal
coordinates (Muirhead, ch. 2)

    |det D(L ↦ L * Lᵀ)| = 2^p * ∏ i : Fin p, (L i i)^(p − i.val)

(`TauCeti.abs_det_fderiv_choleskyReconstructionCoordinates`; the signed determinant is
`TauCeti.det_fderiv_choleskyReconstructionCoordinates`). Consequently Lebesgue measure on the
positive-diagonal coordinate region `TauCeti.posDiagLowerRegion p`, weighted by this Jacobian
(`TauCeti.choleskyJacobianDensity p`), pushes forward under the Gram map `TauCeti.lowerTriangleGram p`
to symmetric Lebesgue measure restricted to the positive-definite cone
(`TauCeti.map_cholesky_symmetricLebesgue`), with integral forms
`TauCeti.setLIntegral_posDef_symmetricLebesgue` and `TauCeti.integral_posDef_symmetricLebesgue`. The
multivariate Gamma integral of §6.3 and the Bartlett decomposition of §6.5 both use this exact
Jacobian; `Fin p` fixes the order of the coordinates.

*Needs:* Mathlib `Matrix.IsLowerTriangular`, `LDL.lower`, `LDL.diag`, `LDL.isLowerTriangular_lower`,
`MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`; Tau Ceti
`Matrix.IsLowerTriangular.eq_of_mul_transpose_self_eq`; §6.1.

**Checks.**

- The Cholesky factor of `A = [[4, 2], [2, 5]]` is `L = [[2, 0], [1, 2]]`. The matrix
  `[[−2, 0], [−1, 2]]` also satisfies `L * Lᵀ = A`, so without the positive-diagonal condition the
  factor is not unique and the factorisation is not a function.
- The positive-diagonal lower-triangular matrices carry the subtype topology of the product
  topology on matrices by definition, and the coordinate map onto the positive-diagonal coordinate
  space is a homeomorphism for it: a topology transported from the coordinates would be a second,
  only propositionally equal, structure on the same type.
- For `p = 2` and `L = [[x, 0], [y, z]]`, the lower coordinates of `L * Lᵀ` are
  `(x², xy, y² + z²)`, whose Jacobian determinant is `4x²z = 2² · x^(2 − 0) · z^(2 − 1)`. Applying
  the one-based exponent `p − i + 1` to the zero-based index `i.val` would give `4x³z²` instead.

### 6.3 Multivariate Gamma

The multivariate Gamma function is `TauCeti.multivariateGamma p a`,

    Γ_p(a) = π^(p (p − 1)/4) * ∏ i : Fin p, Γ(a − i.val/2)

with a real exponent of `π` and real shifts, not natural-number quotients
(`TauCeti.multivariateGamma_def`) (Muirhead, ch. 3). It is `1` in dimension zero
(`TauCeti.multivariateGamma_zero`) and Euler's `Γ` in dimension one (`TauCeti.multivariateGamma_one`);
dimensions add, `Γ_(p+q)(a) = π^(p q/2) Γ_p(a) Γ_q(a − p/2)` (`TauCeti.multivariateGamma_add`, with
the one-step recursion `TauCeti.multivariateGamma_succ`); it is positive for `a > (p − 1)/2`
(`TauCeti.multivariateGamma_pos`), vanishes exactly when some `a − i/2` with `i < p` is a nonpositive
integer (`TauCeti.multivariateGamma_eq_zero_iff`), and is Borel measurable in `a`
(`TauCeti.measurable_multivariateGamma`).

For every `p` and every real `a > (p − 1)/2`, in particular for `p > 0`,

    ∫ A in {A | A ≻ 0}, (det A)^(a − (p + 1)/2) * exp (−trace A) ∂TauCeti.symmetricLebesgue p = Γ_p(a)

(`TauCeti.integral_posDef_multivariateGamma`; lower-integral form
`TauCeti.lintegral_posDef_multivariateGamma`; integrability of the integrand on the cone
`TauCeti.integrableOn_posDef_det_rpow_mul_exp_neg_trace`), proved through the Cholesky change of
variables of §6.2, which splits the integral into one-dimensional Gamma and Gaussian integrals. For
`p = 0` the identity holds for every real `a`, both sides being `1`
(`TauCeti.integral_posDef_multivariateGamma_zero`). Two companions feed §6.4: a positive-definite
scale in the exponential weight, `exp (−trace (S⁻¹ A)/2)`, multiplies the integral by
`2^(p a) (det S)^a` for every real `a`
(`Matrix.PosDef.integral_det_rpow_mul_exp_neg_trace_inv_mul_div_two`, from
`Matrix.PosDef.integral_det_rpow_mul_exp_neg_trace_inv_mul`); and for a symmetric weight `B` that is
not positive definite and `a ≥ (p − 1)/2`, the integral of
`(det A)^(a − (p + 1)/2) * exp (−trace (B A))` over the cone is infinite
(`TauCeti.lintegral_posDef_det_rpow_mul_exp_neg_trace_mul_eq_top`,
`TauCeti.not_integrableOn_posDef_det_rpow_mul_exp_neg_trace_mul`).

*Needs:* Mathlib `Real.Gamma`, `Real.rpow`; §6.1, §6.2.

**Checks.**

- `Γ_1(a) = π^0 · Γ(a − 0) = Γ(a)`, and for `p = 1` the cone integral is Euler's integral
  `∫₀^∞ x^(a − 1) e^(−x) dx`, the exponent `a − (p + 1)/2` being `a − 1`.
- `Γ_2(3/2) = π^(1/2) · Γ(3/2) · Γ(1) = π/2`. Shifts `a − i` in place of `a − i/2` would give
  `π^(1/2) Γ(3/2) Γ(1/2) = π^(3/2)/2`, and the natural-number quotient `2 * 1 / 4 = 0` in the exponent
  of `π` would give `√π/2`.

### 6.4 Wishart laws

**Nonsingular real degrees.** For real `n` and `S : Matrix (Fin p) (Fin p) ℝ`, the nonsingular
Wishart law `W(n, S)`, `TauCeti.Probability.nonsingularWishartMeasure n S`, is, when `S ≻ 0` and
`n > p − 1`, the law with density against symmetric Lebesgue measure (Muirhead, ch. 3)

    f(A) = (det A)^((n − p − 1)/2) * exp (−trace (S⁻¹ A)/2) / (2^(n p/2) * (det S)^(n/2) * Γ_p(n/2))

for `A ≻ 0`, and `f(A) = 0` off the cone (`TauCeti.Probability.nonsingularWishartPDFReal`,
`TauCeti.Probability.nonsingularWishartPDFReal_of_not_posDef`, its `ℝ≥0∞` companion
`TauCeti.Probability.nonsingularWishartPDF`, and
`TauCeti.Probability.nonsingularWishartMeasure_of_posDef`). For every other parameter it is the zero
measure: when `S` is not positive definite (`TauCeti.Probability.nonsingularWishartMeasure_of_not_posDef`)
and when `n ≤ p − 1` (`TauCeti.Probability.nonsingularWishartMeasure_of_le`). The same definition
serves `p = 0`: for `n > −1` the law is the Dirac measure at the unique matrix, since the density and
the empty normalisers are `1` (`TauCeti.Probability.nonsingularWishartMeasure_zero`). For `S ≻ 0` and
`n > p − 1`:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_nonsingularWishartMeasure`),
  carried by the positive-definite cone (`TauCeti.Probability.ae_posDef_nonsingularWishartMeasure`,
  for all parameters), on which its density is positive
  (`TauCeti.Probability.nonsingularWishartPDFReal_pos_iff`); a random symmetric matrix with this law
  has a density against symmetric Lebesgue measure
  (`TauCeti.Probability.hasPDF_of_hasLaw_nonsingularWishartMeasure`, for all parameters), almost
  everywhere equal to the Wishart density
  (`TauCeti.Probability.pdf_eq_nonsingularWishartPDF_of_hasLaw_nonsingularWishartMeasure`), which is
  also the Radon–Nikodym derivative (`TauCeti.Probability.rnDeriv_nonsingularWishartMeasure`);
- its mean is `n S_s` (`TauCeti.Probability.integral_id_nonsingularWishartMeasure`; entrywise
  `TauCeti.Probability.integral_coe_apply_nonsingularWishartMeasure`) and
  `Cov(A_ij, A_kl) = n (S_ik S_jl + S_il S_jk)`
  (`TauCeti.Probability.covariance_coe_apply_nonsingularWishartMeasure`); the matrix has finite
  moments of all orders (`TauCeti.Probability.memLp_id_nonsingularWishartMeasure`);
- at a fixed scale, convolution adds degrees, `W(n₁, S) ∗ W(n₂, S) = W(n₁ + n₂, S)`, whenever `n₁`,
  `n₂` and `n₁ + n₂` all exceed `p − 1`, with no hypothesis on `S`
  (`TauCeti.Probability.nonsingularWishartMeasure_conv_nonsingularWishartMeasure`); the condition on
  the sum follows from the other two when `p > 0` and matters at `p = 0`;
- for `M : Matrix (Fin q) (Fin p) ℝ` of rank `q`, congruence by `M` carries `W(n, S)` to
  `W(n, M S Mᵀ)` (`TauCeti.Probability.map_symmetricCongruenceLinearMap_nonsingularWishartMeasure`).
  It includes invertible congruences, for every `n` and `S`
  (`TauCeti.Probability.map_symmetricCongruence_nonsingularWishartMeasure`, and
  `TauCeti.Probability.nonsingularWishartMeasure_eq_map_sqrt` for congruence by `√S`), and principal
  `q × q` blocks: for injective `f : Fin q → Fin p`, the block of `A` at `f` has law
  `W(n, S.submatrix f f)`
  (`TauCeti.Probability.map_symmetricCongruenceLinearMap_submatrix_one_nonsingularWishartMeasure`). A
  route through transforms compares the pencils of `(Mᵀ Θ M) S` and `Θ (M S Mᵀ)` with the Sylvester
  identity `det (1 + X Y) = det (1 + Y X)` (`Matrix.det_one_add_mul_comm`);
- in dimension one, under `TauCeti.symmetricFinOneEquiv`, `W(n, S)` is `S 0 0` times `χ²_n` for
  `n > 0` and `S 0 0 > 0` (`TauCeti.Probability.map_symmetricFinOneEquiv_nonsingularWishartMeasure`).

**Shared transforms.** For a scale `S` and a symmetric `Θ` put `B = √S Θ √S`; for `S` not positive
semidefinite `√S = 0` (`CFC.sqrt_of_not_nonneg`, with `Matrix.nonneg_iff_posSemidef`). `B` is
Hermitian (`Matrix.isHermitian_sqrt_mul_mul_sqrt`, which needs no hypothesis on `S`), so callers
supply no further proof; write `λ_j` for its eigenvalues, and note `det (1 − 2t B) = det (1 − 2t Θ S)`
for `S ⪰ 0` (`Matrix.PosSemidef.det_one_sub_smul_sqrt_mul_mul_sqrt_eq_det_one_sub_smul_mul`). For the
real trace statistic `A ↦ trace (Θ A)` under `W(n, S)` with `S ≻ 0` and `n > p − 1` (Muirhead,
ch. 3):

    D_Θ = {t : 1 − 2t B ≻ 0},   M_Θ(t) = det (1 − 2t Θ S)^(−n/2),   K_Θ(t) = −(n/2) log det (1 − 2t Θ S)

with `M_Θ` and `K_Θ` on `D_Θ` (`TauCeti.Probability.mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff`,
`TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure` and its form in `B`,
`TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure_sqrt`,
`TauCeti.Probability.cgf_trace_mul_nonsingularWishartMeasure`). The domain is exact: tilting the
density by `exp (t trace (Θ A))` replaces `S⁻¹` by `S⁻¹ − 2tΘ`, which is positive definite exactly
when `1 − 2tB` is (`Matrix.PosDef.posDef_inv_sub_smul_iff`), and §6.3 evaluates the tilted cone
integral or shows that it diverges. For `Θ ⪰ 0` the cone-Laplace specialisation `t = −1` is
`∫ exp (−trace (Θ A)) dW(n, S)(A) = det (1 + 2Θ S)^(−n/2)`
(`TauCeti.Probability.integral_exp_neg_trace_mul_nonsingularWishartMeasure`). The characteristic
function at `Θ` is

    MeasureTheory.charFun (W(n, S)) Θ = exp (−(n/2) * ∑ j, Log (1 − 2i λ_j))

with the principal logarithm taken eigenvalue by eigenvalue
(`TauCeti.Probability.charFun_nonsingularWishartMeasure`), not a principal power of
`det (1 − 2iΘS)`, which can cross the branch cut (Mayerhofer 2019). It comes from a reusable
continuation lemma: if a real statistic `X` has `ProbabilityTheory.mgf X μ t = ∏ j, (1 − 2t λ_j)^(−a_j)`
wherever every factor is positive, then
`ProbabilityTheory.complexMGF X μ z = exp (−∑ j, a_j Log (1 − 2z λ_j))` on the corresponding vertical
strip (`TauCeti.complexMGF_eq_exp_of_mgf_eq_prod_rpow`), in particular at `z = i`
(`TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow`). Its proof uses Mathlib's
`ProbabilityTheory.analyticOnNhd_complexMGF` on the strip and agreement on the real interval
(`TauCeti.eqOn_complexMGF_of_eqOn_mgf`); evaluation at `i` goes through the trace pairing
(`selfAdjoint.charFun_eq_complexMGF_trace_mul`), and
`TauCeti.Probability.charFun_eq_exp_of_mgf_trace_mul_eq_det_rpow` packages the argument for any law
on the carrier whose trace transform is a determinant power.

The mean and covariance of both Wishart families come from their trace transforms near zero: a law
on the carrier whose trace moment-generating function is `det (1 − 2tB)^(−n/2)` on the pencil domain,
for every `Θ` and an `S ⪰ 0`, has entrywise mean `n S_ij`, Bochner mean `n S_s` and covariance
`n (S_ik S_jl + S_il S_jk)` (`TauCeti.Probability.integral_coe_apply_of_mgf_trace_mul_eq_det_rpow`,
`TauCeti.Probability.integral_id_of_mgf_trace_mul_eq_det_rpow`,
`TauCeti.Probability.covariance_coe_apply_of_mgf_trace_mul_eq_det_rpow`), by
`ProbabilityTheory.deriv_mgf_zero`, `ProbabilityTheory.iteratedDeriv_mgf_zero` and polarisation with
the symmetric matrix `(Matrix.single i j 1 + Matrix.single j i 1)/2` (`TauCeti.symmetricEntry`). This
covers the Gaussian-Gram degrees below `p`, where no density exists.

**Natural-degree Gaussian-Gram.** For `ν : ℕ` and any `S`, the Gaussian-Gram law `G(ν, S)`,
`TauCeti.Probability.wishartGramMeasure ν S`, is the pushforward of
`MeasureTheory.Measure.pi (fun _ : Fin ν => ProbabilityTheory.multivariateGaussian 0 S)` under the
bundled Gram sum `TauCeti.Probability.wishartGram`, `X ↦ ∑ r, X r (X r)ᵀ`
(`TauCeti.Probability.coe_wishartGram`) (Muirhead, ch. 3). It does not branch on `S`: Mathlib's
`N(0, S)` is the Dirac measure at `0` when `S` is not positive semidefinite
(`ProbabilityTheory.multivariateGaussian_of_not_posSemidef`), and `G(ν, S)` is then `δ_0`
(`TauCeti.Probability.wishartGramMeasure_of_not_posSemidef`), as it is for `ν = 0`
(`TauCeti.Probability.wishartGramMeasure_zero`). For every `ν` and every `S`:

- `G(ν, S)` is a probability measure (`TauCeti.Probability.isProbabilityMeasure_wishartGramMeasure`);
  if `X₁, …, X_ν` are independent (`ProbabilityTheory.iIndepFun`) with law `N(0, S)`, their Gram sum
  has law `G(ν, S)` (`TauCeti.Probability.hasLaw_wishartGram_gaussian`); a matrix drawn from it is
  almost surely positive semidefinite (`TauCeti.Probability.ae_posSemidef_wishartGramMeasure`) and
  almost surely of rank at most `min ν (rank S)` (`TauCeti.Probability.ae_rank_le_wishartGramMeasure`);
- convolution adds natural degrees, `G(ν₁, S) ∗ G(ν₂, S) = G(ν₁ + ν₂, S)`
  (`TauCeti.Probability.wishartGramMeasure_conv_wishartGramMeasure`), by splitting the product over
  `Fin (ν₁ + ν₂) ≃ Fin ν₁ ⊕ Fin ν₂` (`finSumFinEquiv`);
- at `ν = 0` the trace statistic has `D = ℝ`, `M = 1` and `K = 0` for every `S` and `Θ`
  (`TauCeti.Probability.integrableExpSet_trace_mul_wishartGramMeasure_zero`,
  `TauCeti.Probability.mgf_trace_mul_wishartGramMeasure_zero`,
  `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure_zero`); for `ν > 0` its exponential
  integrability domain is `D_Θ` (`TauCeti.Probability.mem_integrableExpSet_trace_mul_wishartGramMeasure_iff`);
  on `D_Θ` its transforms are those of the nonsingular law with `n = ν` in the form in `B`
  (`TauCeti.Probability.mgf_trace_mul_wishartGramMeasure_sqrt`,
  `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure_sqrt`); and its characteristic function is the
  same spectral formula with `n = ν` (`TauCeti.Probability.charFun_wishartGramMeasure`), through the
  continuation lemma above.

For `S ⪰ 0`:

- prove `ae_rank_wishartGramMeasure`: for every `ν`, a matrix drawn from `G(ν, S)` has rank exactly
  `min ν (rank S)` almost surely; the bound of the previous paragraph is its upper-bound corollary.
  Route: `G(ν, S)` is the image of `G(ν, 1)` under congruence by `√S`
  (`TauCeti.Probability.wishartGramMeasure_eq_map_sqrt`), so the rank is that of `√S Z` for a
  `p × ν` matrix `Z` of independent standard Gaussian entries; rotating to an eigenbasis of `S`
  reduces this to the range of `S`, an `(rank S) × ν` Gaussian matrix, which has maximal rank almost
  surely (`TauCeti.Probability.ae_rank_eq_min_pi_gaussianReal`, from the minor and polynomial
  null-set argument `MeasureTheory.Measure.ae_rank_eq_min`). The hypothesis `S ⪰ 0` is needed:
  otherwise the law is `δ_0`, of rank `0`;
- for every rectangular `M : Matrix (Fin q) (Fin p) ℝ`, congruence by `M` carries `G(ν, S)` to
  `G(ν, M S Mᵀ)` (`TauCeti.Probability.map_symmetricCongruenceLinearMap_wishartGramMeasure`). Positive
  semidefiniteness of `S` is kept as a hypothesis: a projection can carry a scale that is not
  positive semidefinite to one that is, so the Dirac fallback does not respect arbitrary
  congruences;
- the moment-generating and cumulant-generating functions on `D_Θ` are `det (1 − 2t Θ S)^(−ν/2)` and
  `−(ν/2) log det (1 − 2t Θ S)` for every `ν` (`TauCeti.Probability.mgf_trace_mul_wishartGramMeasure`,
  `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure`), obtained from the Gaussian quadratic forms
  of §5.3 and `ProbabilityTheory.iIndepFun.mgf_sum`; for `Θ ⪰ 0` the cone-Laplace specialisation is
  `det (1 + 2Θ S)^(−ν/2)` (`TauCeti.Probability.integral_exp_neg_trace_mul_wishartGramMeasure`); and
  the mean is `ν S_s` and `Cov(A_ij, A_kl) = ν (S_ik S_jl + S_il S_jk)`
  (`TauCeti.Probability.integral_id_wishartGramMeasure`,
  `TauCeti.Probability.covariance_coe_apply_wishartGramMeasure`), including for `ν < p`.

In dimension one, under `TauCeti.symmetricFinOneEquiv`, `G(ν, S)` is `S 0 0` times `χ²_ν` whenever
`S 0 0 ≥ 0`, including `S 0 0 = 0` and `ν = 0`
(`TauCeti.Probability.map_symmetricFinOneEquiv_wishartGramMeasure`).

**Agreement and singularity.** For `S ≻ 0` and a natural degree `ν ≥ p`, the two families agree,
`G(ν, S) = W(ν, S)` (`TauCeti.Probability.wishartGramMeasure_eq_nonsingularWishartMeasure`), because
their characteristic functions are the same formula (`MeasureTheory.Measure.ext_of_charFun`). Hence
the Gram sum of an independent `N(0, S)` sample of size `ν ≥ p` has law `W(ν, S)`
(`TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure`), and `G(ν, S)` is then
carried by the positive-definite cone and has the Wishart density
(`TauCeti.Probability.ae_posDef_wishartGramMeasure`,
`TauCeti.Probability.hasPDF_of_hasLaw_wishartGramMeasure`,
`TauCeti.Probability.rnDeriv_wishartGramMeasure`). When `min ν (rank S) < p`, for any `S`, `G(ν, S)`
and symmetric Lebesgue measure are mutually singular
(`TauCeti.Probability.mutuallySingular_wishartGramMeasure_symmetricLebesgue`): the law is carried by
the singular matrices, which are null by §6.1. A congruence of rank below `q` does not produce a
nonsingular Wishart law, so its image is kept as an explicit pushforward. Prove that at natural
degrees in the overlap it is a Gaussian-Gram law: for `ν : ℕ` with `p ≤ ν`, `S ≻ 0` and every
`M : Matrix (Fin q) (Fin p) ℝ`, the image of `W(ν, S)` under `Matrix.symmetricCongruenceLinearMap M`
is `G(ν, M S Mᵀ)`, by the agreement theorem and the Gram congruence theorem above.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`,
`ProbabilityTheory.multivariateGaussian_of_not_posSemidef`, `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.iIndepFun.mgf_sum`, `ProbabilityTheory.analyticOnNhd_complexMGF`,
`ProbabilityTheory.deriv_mgf_zero`, `ProbabilityTheory.iteratedDeriv_mgf_zero`,
`MeasureTheory.Measure.ext_of_charFun`, `CFC.sqrt`, `CFC.sqrt_of_not_nonneg`,
`Matrix.det_one_add_mul_comm`, `finSumFinEquiv`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`,
`TauCeti.Probability.ae_rank_eq_min_pi_gaussianReal`, `MeasureTheory.Measure.ae_rank_eq_min` and the
declarations named above; §0.1 and §0.2 (density interfaces), §3.5 (chi-squared), §4.1 (Gaussian
squares), §5.3 (Gaussian quadratic forms), §6.1, §6.3.

**Checks.**

- In dimension one the Gram law is `σ²χ²_ν` with `σ² = S 0 0`, including `σ² = 0` and `ν = 0`, where
  both sides are `δ_0`: a definition of the Gram law through a density would give the zero measure
  in those two cases instead of a probability measure.
- On the overlap (natural `ν ≥ p`, `S ≻ 0`) the transforms of the two families are literally the
  same: domain `D_Θ`, moment-generating function `det (1 − 2tΘS)^(−ν/2)` and characteristic function
  `exp (−(ν/2) ∑ j Log (1 − 2iλ_j))`, the real-degree formulas at `n = ν`.
- For `p = 1` the density is `x^((n − 2)/2) e^(−x/(2σ²)) / (2^(n/2) σⁿ Γ(n/2))`, the density of
  `σ²χ²_n`; the mean `nσ²` and `Cov(A₀₀, A₀₀) = n (σ²σ² + σ²σ²) = 2nσ⁴ = Var(σ²χ²_n)` agree. A covariance
  `n S_ik S_jl` with one term would give `nσ⁴`, half the variance.
- For `p = 3`, `n = 3`, `S = Θ = 1`, every `λ_j` is `1`, and the characteristic function is
  `exp (−(9/2) Log (1 − 2i)) = (1 − 2i)^(−9/2)`, that of the trace `χ²_9` at `1`. The principal power of
  the determinant, `(det (1 − 2iΘS))^(−3/2) = (−11 + 2i)^(−3/2)`, is the negative of this value: the
  arguments of the three factors add up to `−3.32`, beyond `−π`. For `p = 2` the two expressions
  agree, so the difference shows only from dimension three on.
- For `S = diag(1, −1)`, which is not positive semidefinite, and `M = (1 0)`, `G(ν, S)` is `δ_0` and
  its image is `δ_0`, while `M S Mᵀ = 1` and `G(ν, 1)` is the law of `χ²_ν`: the Gram congruence
  theorem is false without `S ⪰ 0`.
- For `p = 0` the degrees `n₁ = n₂ = −0.6` are valid, `W(−0.6, S)` being `δ_0`, but
  `n₁ + n₂ = −1.2 ≤ −1`, so `W(−1.2, S)` is the zero measure while `δ_0 ∗ δ_0 = δ_0`: the hypothesis
  on the sum of the degrees cannot be dropped.
- For `ν = 1`, `p = 2` and `S = 1`, a draw `X Xᵀ` has rank `1 = min ν (rank S) < p`, so the law is
  carried by singular matrices and has no density against symmetric Lebesgue measure.

### 6.5 Bartlett decomposition

For real `n > p − 1`, lift `W(n, 1)` to the positive-definite subtype by
`MeasureTheory.Measure.comap Subtype.val` and apply Cholesky (Muirhead, ch. 3). The lift maps back
to the law under the inclusion, for every `n` and `S`, because the cone carries all of its mass
(`TauCeti.Probability.map_subtype_val_comap_nonsingularWishartMeasure`, from Mathlib's
`map_comap_subtype_coe` and the null complement of the cone). Write `T = cholesky A` for `A` drawn
from the lift; degrees are real and indices zero-based.

- Product law: the Cholesky coordinates of the lift have the product of the Bartlett coordinate laws
  `TauCeti.Probability.bartlettCoordinateMeasure n ij` as their law, which is the chi law with `n − i`
  degrees of freedom at a diagonal position `(i, i)` and the standard Gaussian law
  `ProbabilityTheory.gaussianReal 0 1` at a strictly lower position
  (`TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`); the square of
  a diagonal coordinate has law `χ²_(n − i)` (`TauCeti.Probability.map_sq_bartlettCoordinateMeasure_of_eq`),
  and the diagonal squares jointly have the product of the laws `χ²_(n − i)`
  (`TauCeti.Probability.map_diagonal_sq_pi_bartlettCoordinateMeasure`). Equivalently, `W(n, 1)` is the
  image of that product under the Gram map
  (`TauCeti.Probability.nonsingularWishartMeasure_one_eq_map_lowerTriangleGram`).
- Joint independence: the entries `T_ij`, `j ≤ i`, are independent, with
  `T_ii² ∼ χ²_(n − i.val)` and `T_ij ∼ N(0, 1)` for `j < i`
  (`TauCeti.Probability.bartlett_nonsingularWishartMeasure`); in particular all diagonal squares and
  strictly lower entries are jointly independent.

**Determinant law and real-power moments.** For `S ≻ 0` and real `n > p − 1`,

    det W  =ᵈ  (det S) * ∏ j : Fin p, Y_j,    Y_j ∼ χ²_(n − j) independently

as a product-measure pushforward (`TauCeti.Probability.map_det_nonsingularWishartMeasure`; standard
scale `TauCeti.Probability.map_det_nonsingularWishartMeasure_one`; random-variable forms
`TauCeti.Probability.hasLaw_det_nonsingularWishartMeasure` and
`TauCeti.Probability.hasLaw_prod_chiSquared_det_nonsingularWishartMeasure`), from the Bartlett
decomposition and congruence by a square root of `S`. For `p > 0`, `(det W)^q` is integrable exactly
when `q > −(n − p + 1)/2` (`TauCeti.Probability.integrable_rpow_det_nonsingularWishartMeasure_iff`),
and on that domain

    E[(det W)^q] = 2^(p q) * (det S)^q * Γ_p(n/2 + q) / Γ_p(n/2)

(`TauCeti.Probability.integral_rpow_det_nonsingularWishartMeasure`, valid for every `p`). The
independent chi-squared real-power moments give both the finiteness and the sharp divergence: the
last factor `Y_(p−1) ∼ χ²_(n − p + 1)` sets the threshold. At `p = 0` the determinant and all its real
powers are constantly `1` for every valid `n > −1`
(`TauCeti.Probability.integrable_rpow_det_nonsingularWishartMeasure_zero`,
`TauCeti.Probability.integral_rpow_det_nonsingularWishartMeasure_zero`).

*Needs:* Mathlib `MeasureTheory.Measure.comap`, `map_comap_subtype_coe`, `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.gaussianReal`; §1.11 (real-power moments of Gamma laws), §3.5 (chi-squared),
§6.2, §6.3, §6.4.

**Checks.**

- The final diagonal square has `n − p + 1` degrees of freedom also for nonintegral degrees: for
  `p = 3` and `n = 2.5` the degrees are `2.5, 1.5, 0.5`. Counting rows from one would give
  `1.5, 0.5, −0.5`, a negative degree although `n > p − 1`.
- For `p = 2`, `n = 3`, `S = 1`: `E[det W] = E[χ²_3] E[χ²_2] = 3 · 2 = 6`, and the moment formula at
  `q = 1` gives `2² Γ_2(5/2)/Γ_2(3/2) = 4 · Γ(5/2) Γ(2) / (Γ(3/2) Γ(1)) = 6`.
- For the same parameters the threshold is `−(n − p + 1)/2 = −1`, and `E[(det W)^(−1)]` is infinite
  because `E[1/χ²_2] = ∞`. A threshold read off the first diagonal degree, `q > −n/2 = −3/2`, would
  admit `q = −1`.

### 6.6 Inverse-Wishart

The inverse-Wishart law `IW(n, S)`, `TauCeti.Probability.inverseWishartMeasure n S`, is `W(n, S⁻¹)`
pushed forward under symmetric inversion `TauCeti.symmetricInv`
(`TauCeti.Probability.inverseWishartMeasure_def`), which keeps Mathlib's convention that a singular
matrix has inverse zero (`TauCeti.coe_symmetricInv`). Valid source laws give the singular matrices
zero mass (`TauCeti.Probability.nonsingularWishartMeasure_compl_posDef`), and invalid parameters, `S`
not positive definite or `n ≤ p − 1`, give the zero measure as for Wishart
(`TauCeti.Probability.inverseWishartMeasure_of_not_posDef`,
`TauCeti.Probability.inverseWishartMeasure_of_le`).

Inversion is an involution of the positive-definite cone and a bijection of it onto itself
(`TauCeti.symmetricInv_symmetricInv`, `TauCeti.bijOn_symmetricInv`), measurable
(`TauCeti.measurable_symmetricInv`), with absolute Jacobian `|det A|^(−(p + 1))`
(`TauCeti.abs_det_fderiv_symmetricInv`); hence it carries symmetric Lebesgue measure restricted to the
cone to the same restriction weighted by `(det B)^(−(p + 1))`
(`TauCeti.map_symmetricInv_symmetricLebesgue`) (Muirhead, ch. 2). For `S ≻ 0` and `n > p − 1` the law
has density

    f(A) = (det S)^(n/2) * (det A)^(−(n + p + 1)/2) * exp (−trace (S A⁻¹)/2) / (2^(n p/2) * Γ_p(n/2))

for `A ≻ 0`, and `0` off the cone, against symmetric Lebesgue measure
(`TauCeti.Probability.inverseWishartPDFReal`, `TauCeti.Probability.inverseWishartMeasure_of_posDef`);
it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_inverseWishartMeasure`) carried
by the cone (`TauCeti.Probability.ae_posDef_inverseWishartMeasure`); a random matrix with this law has
a density (`TauCeti.Probability.hasPDF_of_hasLaw_inverseWishartMeasure`), and the Radon–Nikodym
derivative of the law is the inverse-Wishart density (`TauCeti.Probability.rnDeriv_inverseWishartMeasure`);
and congruence by an invertible `C` carries `IW(n, S)` to `IW(n, C S Cᵀ)`
(`TauCeti.Probability.map_symmetricCongruence_inverseWishartMeasure`).

For `p > 0`, `S ≻ 0` and a valid `n > p − 1`, the matrix is integrable exactly when `n > p + 1`: for
`n > p + 1` it is integrable with mean `S_s/(n − p − 1)`
(`TauCeti.Probability.integrable_id_inverseWishartMeasure`,
`TauCeti.Probability.integral_id_inverseWishartMeasure`), and for `p − 1 < n ≤ p + 1` the identity is
not integrable (`TauCeti.Probability.not_integrable_id_inverseWishartMeasure`). At `p = 0`, every
valid `n > −1` gives the Dirac measure at zero, which is integrable with mean zero
(`TauCeti.Probability.inverseWishartMeasure_zero`,
`TauCeti.Probability.integrable_id_inverseWishartMeasure_zero`,
`TauCeti.Probability.integral_id_inverseWishartMeasure_zero`). The inverse-Wishart law is asked for
its density, this mean with its sharp threshold, and the diagonal marginals of §6.8; no covariance
or transform formula of it is part of this roadmap.

*Needs:* Mathlib `MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`; §6.1, §6.3, §6.4.

**Checks.**

- For `p = 1`, `IW(n, s)` is the law of `s/χ²_n`, the inverse-gamma law of shape `n/2` and rate `s/2`,
  with mean `(s/2)/(n/2 − 1) = s/(n − 2) = S/(n − p − 1)`, finite exactly when `n > 2 = p + 1`.
- The density exponent is `−(n − p − 1)/2 − (p + 1) = −(n + p + 1)/2`. Reading the density off the
  Wishart density without the Jacobian of inversion would give `(det A)^(−(n − p − 1)/2)`; for `p = 1`
  and `n = 3` that is `x^(−1/2) e^(−s/(2x))`, which is not even integrable at infinity.

### 6.7 Parameter measurability

All three laws are measurable jointly in degree and scale for the Giry measurable structure on
measures: with the scale in `Fin p → Fin p → ℝ` read through `Matrix.of`
(`TauCeti.Probability.measurable_nonsingularWishartMeasure`,
`TauCeti.Probability.measurable_wishartGramMeasure`,
`TauCeti.Probability.measurable_inverseWishartMeasure`), and with the scale in the Borel symmetric
carrier (`TauCeti.Probability.measurable_nonsingularWishartMeasure_selfAdjoint`,
`TauCeti.Probability.measurable_wishartGramMeasure_selfAdjoint`,
`TauCeti.Probability.measurable_inverseWishartMeasure_selfAdjoint`), the form a kernel with a random
symmetric scale needs. The degree is real for the two density laws and natural for the Gaussian-Gram
law. The densities are measurable jointly in degree, scale and point
(`TauCeti.Probability.measurable_uncurry_nonsingularWishartPDFReal`,
`TauCeti.Probability.measurable_uncurry_inverseWishartPDFReal`), and `Γ_p` in its argument (§6.3).
Restricted to the valid parameters, where each law is a probability measure, these maps define
Markov kernels in the sense of Mathlib's `ProbabilityTheory.Kernel`.

*Needs:* Mathlib `Matrix.of`, `ProbabilityTheory.Kernel`; §5.7 (measurability of the multivariate
Gaussian), §6.1, §6.3, §6.4, §6.6.

**Checks.**

- The parameter maps are measurable but not continuous for the weak topology: in dimension one,
  `W(n, t)` is `t χ²_n` for `t > 0`, which tends weakly to `δ_0` as `t → 0`, while `W(n, 0)` is the zero
  measure. A proof of measurability through continuity in the scale fails at the boundary of the
  cone; the proof goes through the measurable set of valid parameters and the measurable density.

### 6.8 Real-degree Schur complements and inverse-Wishart marginals

For `p > 0`, `S ≻ 0`, `n > p − 1`, `W ∼ W(n, S⁻¹)` and every `i : Fin p`,

    ((W⁻¹)_ii)⁻¹ ∼ (S_ii)⁻¹ χ²_(n − p + 1),     (IW(n, S))_ii ∼ IG((n − p + 1)/2, S_ii/2)

(`TauCeti.Probability.map_inv_inv_apply_nonsingularWishartMeasure`,
`TauCeti.Probability.map_coe_apply_inverseWishartMeasure`; random-variable forms
`TauCeti.Probability.hasLaw_inv_inv_apply_nonsingularWishartMeasure`,
`TauCeti.Probability.hasLaw_coe_apply_inverseWishartMeasure`), where `IG(a, r)` is the inverse-gamma
law `TauCeti.Probability.inverseGammaMeasure a r` of §3.6, the image under inversion of the Gamma law
of shape `a` and rate `r`. The inverse-gamma statement needs no hypothesis on `n`: for `n ≤ p − 1`
both sides are zero. Its standard-scale case is
`TauCeti.Probability.map_coe_apply_inverseWishartMeasure_one` (Muirhead, ch. 3; Johnson, Kotz and
Balakrishnan, vol. 1, for the chi-squared and inverse-gamma laws).

The bridges are: congruence by a permutation matrix permutes rows and columns simultaneously
(`Matrix.coe_symmetricCongruenceLinearMap_permMatrix_apply`); a positive-definite `S` factors as
`C Cᵀ` with `C` invertible and its `i`-th row supported on one entry
(`Matrix.PosDef.exists_generalLinearGroup_mul_transpose_eq_and_apply_eq_zero`), and congruence by
such a `C` reads the diagonal entry `(i, i)` off one diagonal entry
(`Matrix.coe_symmetricCongruenceLinearMap_apply_self_of_apply_eq_zero`); the inverse of a `2 × 2`
block matrix has the inverse Schur complement as its corner (Mathlib's `Matrix.invOf_fromBlocks₂₂_eq`);
and for `A ≻ 0`, `((A⁻¹)_ii)⁻¹` is the scalar Schur complement of the complementary principal block
(`Matrix.PosDef.inv_inv_apply_self_eq_sub`). Route: move coordinate `i` last and apply the
real-degree Bartlett decomposition of §6.5 to its final diagonal square, of degree `n − p + 1`; the
block inverse of `S⁻¹` identifies the scale `(S_ii)⁻¹`. No separate block normalisation integral is
required. At `p = 1` the complementary block is empty and the scalar identities of §6.4 and §6.6
apply.

*Needs:* Mathlib `Matrix.invOf_fromBlocks₂₂_eq`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`,
`TauCeti.Probability.inverseGammaMeasure` and the bridges named above; §3.5 (chi-squared), §3.6
(inverse-gamma), §6.4, §6.5, §6.6.

**Checks.**

- For `p = 1` the inverse-gamma statement is the description of `IW(n, s)` in §6.6: shape `n/2`,
  rate `s/2`.
- For `p = 2`, `n = 6` and `S_ii = 2`, the diagonal entry is inverse gamma of shape `5/2` and rate `1`,
  with mean `1/(5/2 − 1) = 2/3`, which is the `(i, i)` entry `S_ii/(n − p − 1)` of the mean of §6.6.
  The shape `n/2` of the one-dimensional case would give `1/2`.

### Examples

- In dimension one everything is scalar: symmetric Lebesgue measure is Lebesgue measure on `ℝ`
  through the single entry, `Γ_1 = Γ`, `W(n, σ²)` is `σ²χ²_n` for `n, σ² > 0`, `IW(n, s)` is the
  inverse-gamma law of shape `n/2` and rate `s/2`, and the Bartlett decomposition says `T₀₀² ∼ χ²_n`.
- For `p = 2`, the cone integral of `exp (−trace A)` against symmetric Lebesgue measure is
  `Γ_2(3/2) = π/2` (here `a = (p + 1)/2`, so the determinant factor is `1`). In Cholesky coordinates
  `L = [[x, 0], [y, z]]` it is `∫ 4x²z e^(−x² − y² − z²)` over `x, z > 0`, `y ∈ ℝ`, which is
  `4 · (√π/4) · √π · (1/2) = π/2`.
- For `p = 2`, `n = 3` and `S = 1`: the mean of `W(3, 1)` is three times the identity,
  `Var(A₀₁) = 3 (S₀₀ S₁₁ + S₀₁ S₁₀) = 3`, `Var(A₀₀) = 3 (1 + 1) = 6`, and `E[det A] = 6`.
- For `ν = 1`, `p = 2` and `S = 1`, `G(1, 1)` is the law of `X Xᵀ` with `X` standard Gaussian in `ℝ²`:
  it is carried by rank-one matrices and is singular to symmetric Lebesgue measure, while its trace
  `‖X‖²` has moment-generating function `det (1 − 2t · 1)^(−1/2) = (1 − 2t)^(−1)`, that of `χ²_2`, for
  `t < 1/2`.
- In dimension zero, symmetric Lebesgue measure, `W(n, S)` and `IW(n, S)` for `n > −1`, and `G(ν, S)`
  are all the Dirac measure at the unique matrix, `Γ_0 = 1`, and every real power of the determinant
  has mean `1`.

### Dependencies

Layers 3 to 5: the chi-squared law (§3.5) for the Bartlett decomposition, the determinant law and the
one-dimensional laws, the inverse-gamma law (§3.6) for the diagonal marginals, Gaussian squares
(§4.1) for the Gram law, the Gaussian quadratic-form transforms (§5.3) for the Gram transforms and the
multivariate Gaussian measurability (§5.7) for the Gram parameter map. The determinant moments use the
Bartlett decomposition and the real-power moments of Gamma laws (§1.11). The density interfaces of
§0.1 and §0.2 give the `MeasureTheory.HasPDF` and Radon–Nikodym forms of the density laws. Within the
layer, §6.1 is used by every later section, §6.2 by §6.3 and §6.5, §6.3 by §6.4 and §6.6, and §6.4 by
§6.5 to §6.8. Mathlib: the self-adjoint submodule, the Frobenius norm on matrices, positive
definiteness and the spectral theorem, the continuous functional calculus square root, the LDL
decomposition, Schur complements and block inverses, the Jacobian change-of-variables formula and
additive Haar measures, the multivariate Gaussian, moment-generating functions and their complex
analytic extension, characteristic functions, independence and kernels. Tau Ceti: the Frobenius
inner product on matrices, the measure theory of the symmetric matrices (coordinates, symmetric
Lebesgue measure, congruence, inversion, singular sets), Cholesky factorisation, the multivariate
Gamma function, the three Wishart families, the continuation of product-of-powers moment-generating
functions, the maximal rank of Gaussian matrices and the scalar Schur complement identity.

## Layer 7: affine laws, quantiles, and distribution constructions

This layer works with an arbitrary probability law and so applies to every valid law of Layers
0–6 and of the later layers. For a measure `μ` on `ℝ` write `F = cdf μ` (Mathlib
`ProbabilityTheory.cdf`, a Stieltjes function), `F(x−) = μ.real (Iio x)` for its left limit at `x`
(`MeasureTheory.Measure.leftLim_cdf`) and `S = 1 − F` for the survival function. Statements are
made for measures; random-variable forms use `ProbabilityTheory.HasLaw`. Discrete laws on `ℕ` and
`ℤ` enter the real-valued statements of this layer through their real casts.

### 7.1 Affine transport

For a measure `μ` on `ℝ` and real `a`, `b`, the law of `a + bX` for `X` with law `μ` is
`μ.map φ` with `φ(x) = a + bx`. If `μ` is a probability measure so is `μ.map φ`
(`MeasureTheory.Measure.isProbabilityMeasure_map_iff`), and (Johnson, Kotz and Balakrishnan,
vol. 1):

- affine pushforward is jointly measurable in the probability law, the intercept and the slope,
  for the Giry structure on `ProbabilityMeasure ℝ × ℝ × ℝ`
  (`TauCeti.Probability.measurable_map_affine`), and the image under `y ↦ c + dy` of the image
  under `x ↦ a + bx` is the image under `x ↦ (c + da) + dbx`
  (`TauCeti.Probability.map_affine_map_affine`);
- if `HasLaw X μ P` then `HasLaw (a + bX) (μ.map φ) P`: this is `ProbabilityTheory.HasLaw.comp`
  applied to `ProbabilityTheory.hasLaw_map` for the measurable map `φ`;
- at `b = 0` the image of a measure is `μ(ℝ)` times the Dirac mass at `a`
  (`MeasureTheory.Measure.map_const`), so the image of a probability law is `δ_a`;
- for `b ≠ 0` a density `f` with respect to Lebesgue measure is carried to
  `|b|⁻¹ f((x − a)/b)` (`TauCeti.Probability.affineDensity`), as an equality of measures
  `(volume.withDensity f).map φ = volume.withDensity (affineDensity a b f)`
  (`TauCeti.Probability.map_affine_withDensity_volume`); the Radon–Nikodym form is
  `TauCeti.Probability.rnDeriv_map_affine` (for `μ` s-finite), and for a random variable with
  `HasPDF X P` the transform has a density with the same formula
  (`TauCeti.Probability.hasPDF_affine`, `TauCeti.Probability.pdf_affine`,
  `TauCeti.Probability.hasLaw_affine`);
- for a probability law `μ`, the cdf of the image is `F((x − a)/b)` when `b > 0`
  (`TauCeti.Probability.cdf_map_affine_of_pos`) and `1 − F(((x − a)/b)−)` when `b < 0`
  (`TauCeti.Probability.cdf_map_affine_of_neg`); the left limit is essential when `μ` has an atom
  at `(x − a)/b`;
- for `b ≠ 0` and a finite measure `μ`, the image has exactly the absolute moments of `μ`: for
  every `p`, the identity is in `Lᵖ` of the image iff it is in `Lᵖ(μ)`
  (`TauCeti.Probability.memLp_id_map_affine_iff`); for a probability law the mean of the image is
  `a + b E[X]` when `X` is integrable (`TauCeti.Probability.integral_id_map_affine`) and its
  variance is `b² Var X` (`TauCeti.Probability.variance_id_map_affine`); for a finite measure with
  `|x|ⁿ` integrable, the `n`-th raw moment of the image is
  `∑_{k ≤ n} C(n, k) a^(n−k) b^k E[X^k]` (`TauCeti.Probability.moment_id_map_affine`), and for a
  probability law with integrable `X` the `n`-th central moment of the image is `bⁿ` times that of
  `μ` (`TauCeti.Probability.centralMoment_id_map_affine`).

The transforms of the image are

    M_{a+bX}(t) = e^(at) M_X(bt),        φ_{a+bX}(t) = e^(iat) φ_X(bt),
    D_{a+bX} = {t : bt ∈ D_X},           K_{a+bX}(t) = at + K_X(bt)   (bt ∈ D_X, μ ≠ 0):

the moment-generating function identity holds for every real `t`
(`TauCeti.Probability.mgf_id_map_affine`), the exponential-integrability domain is exact
(`TauCeti.Probability.integrableExpSet_id_map_affine`), the cumulant-generating function identity
holds on that domain for `μ ≠ 0` (`TauCeti.Probability.cgf_id_map_affine`), and the
characteristic function identity holds for every real `t` (`TauCeti.Probability.charFun_map_affine`).

Affine pushforward commutes with the constructions of this layer:

- with atom mixtures `w δ_c + (1 − w) μ` (`MeasureTheory.Measure.atomMixture`): for every
  measurable `f`, `(μ.atomMixture c w).map f = (μ.map f).atomMixture (f c) w`
  (`MeasureTheory.Measure.map_atomMixture`), in particular for `f = φ`;
- with truncation of the transformed event: for a measurable set `t` and measurable `f`,
  `(cond μ (f⁻¹' t)).map f = cond (μ.map f) t`, which is the case `ν = μ.map f`, `k = 1` of
  `ProbabilityTheory.map_cond_preimage`; for `f = φ` with `b ≠ 0`, `φ⁻¹' t` is the event `t`
  transformed back, so conditioning `X` on `{a + bX ∈ t}` and then transporting is conditioning
  `a + bX` on `t`;
- with independent sums, accumulating the translations. Prove that for s-finite measures `μ`, `ν`
  on `ℝ` and real `a₁`, `a₂`, `b`,

      (μ.map (x ↦ a₁ + bx)) ∗ (ν.map (x ↦ a₂ + bx)) = (μ ∗ ν).map (x ↦ (a₁ + a₂) + bx),

  so that for independent `X`, `Y` the law of `(a₁ + bX) + (a₂ + bY)` is the law of
  `(a₁ + a₂) + b(X + Y)`. The scaling part is `MeasureTheory.Measure.map_conv_addMonoidHom`;
  translations are convolutions with Dirac masses (`MeasureTheory.Measure.conv_dirac`).

The jump law of a compound Poisson law (§7.5) is transported by additive maps only:
`(compoundPoissonMeasure r μ).map f = compoundPoissonMeasure r (μ.map f)` for a measurable additive
`f` (`TauCeti.Probability.map_compoundPoissonMeasure`); a translation of the compound Poisson
variable is an outer pushforward, not a translation of its jumps. For discrete laws, real affine
maps act on the real cast. The parameter identities of the named families under affine maps are
stated in §13.5.

*Needs:* Mathlib `MeasureTheory.Measure.map`, `MeasureTheory.Measure.map_const`,
`ProbabilityTheory.cdf`, `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`,
`ProbabilityTheory.integrableExpSet`, `MeasureTheory.charFun`, `ProbabilityTheory.HasLaw`,
`MeasureTheory.HasPDF`, `ProbabilityTheory.cond`, `MeasureTheory.Measure.map_conv_addMonoidHom`,
`MeasureTheory.Measure.conv_dirac`; Tau Ceti `Probability/Distributions/Affine.lean`,
`MeasureTheory.Measure.atomMixture`, `ProbabilityTheory.map_cond_preimage`,
`TauCeti.Probability.compoundPoissonMeasure`; §0.1, §0.2.

**Checks.**

- For `μ = δ₀`, `a = 0`, `b = −1` the image is `δ₀`, whose cdf at `0` is `1`; the negative-slope
  formula gives `1 − μ(Iio 0) = 1`, while the variant `1 − F((x − a)/b) = 1 − F(0)` would give `0`.
- For `X` exponential of rate one, `D_X = (−∞, 1)`, and for `b = −2` the domain of `a + bX` is
  `{t : −2t < 1} = (−1/2, ∞)`; pulling back by `t ↦ t/b` instead of `t ↦ bt` would give
  `(−2, ∞)`.
- For `X` standard Gaussian, `e^(t) M_X(2t) = e^(t + 2t²)`, the moment-generating function of the
  Gaussian law with mean `1` and variance `4`, the image of the standard Gaussian under
  `x ↦ 1 + 2x`.

### 7.2 Lower and upper quantiles

The lower quantile of a measure `μ` on `ℝ` is `MeasureTheory.Measure.quantile`,
`Q(u) = μ.quantile u = inf {x : u ≤ F(x)}` (`MeasureTheory.Measure.quantile_def`), and its upper
quantile is `MeasureTheory.Measure.upperQuantile`, `Q⁺(u) = inf {x : u < F(x)}`
(`MeasureTheory.Measure.upperQuantile_def`); where `F` has a plateau at level `u` they are its two
ends, and elsewhere they agree (Billingsley). Every theorem about finite quantiles assumes
`0 < u < 1`; outside that range the ordinary `sInf` totalization is kept, so `Q(u) = 0` for
`u ≤ 0` and for `u > 1` (`MeasureTheory.Measure.quantile_of_nonpos`,
`MeasureTheory.Measure.quantile_of_one_lt`), and `Q⁺(u) = 0` for `u < 0` and `u ≥ 1`
(`MeasureTheory.Measure.upperQuantile_of_neg`, `MeasureTheory.Measure.upperQuantile_of_one_le`).
For `0 < u < 1`:

- the defining sets are nonempty and bounded below, so both infima are attained
  (`MeasureTheory.Measure.nonempty_setOf_le_cdf`, `MeasureTheory.Measure.bddBelow_setOf_le_cdf`,
  `MeasureTheory.Measure.nonempty_setOf_lt_cdf`, `MeasureTheory.Measure.bddBelow_setOf_lt_cdf`);
- the lower quantile is characterized by the adjunction `Q(u) ≤ x ⟺ u ≤ F(x)`
  (`MeasureTheory.Measure.quantile_le_iff`), and the upper quantile by its strict-level forms
  `x ≤ Q⁺(u) ⟺ F(x−) ≤ u` and `Q⁺(u) < x ⟺ u < F(x−)` for a probability law
  (`MeasureTheory.Measure.le_upperQuantile_iff`, `MeasureTheory.Measure.upperQuantile_lt_iff`);
- for a probability law, `F(Q(u)−) ≤ u ≤ F(Q(u))`
  (`MeasureTheory.Measure.measureReal_Iio_quantile_le`, `MeasureTheory.Measure.le_cdf_quantile`),
  with the same bounds at `Q⁺(u)` (`MeasureTheory.Measure.measureReal_Iio_upperQuantile_le`,
  `MeasureTheory.Measure.le_cdf_upperQuantile`); these inequalities do not determine the quantile
  on a plateau of `F`, which is why the adjunction is the characterization;
- `Q ≤ Q⁺` at each level and `Q⁺(s) ≤ Q(u)` for `s < u`
  (`MeasureTheory.Measure.quantile_le_upperQuantile`,
  `MeasureTheory.Measure.upperQuantile_le_quantile`); both are monotone on `(0, 1)`
  (`MeasureTheory.Measure.monotoneOn_quantile`, `MeasureTheory.Measure.monotoneOn_upperQuantile`)
  and measurable (`MeasureTheory.Measure.measurable_quantile`,
  `MeasureTheory.Measure.measurable_upperQuantile`); the lower quantile is left continuous and the
  upper quantile right continuous (`MeasureTheory.Measure.continuousWithinAt_Iio_quantile`,
  `MeasureTheory.Measure.continuousWithinAt_Ioi_upperQuantile`);
- if `F` is continuous then `F(Q(u)) = u` (`MeasureTheory.Measure.cdf_quantile`); if `F` is
  strictly increasing where its values lie in `(0, 1)` then `Q(F(x)) = x` and `F(x) = u` forces
  `Q(u) = x = Q⁺(u)` (`MeasureTheory.Measure.quantile_cdf`,
  `MeasureTheory.Measure.quantile_eq_of_cdf_eq`, `MeasureTheory.Measure.upperQuantile_eq_of_cdf_eq`);
  for a probability law with continuous `F`, carried by an interval on which `F` is strictly
  increasing, `Q(u)` is the unique point of the interval with `F(Q(u)) = u`
  (`MeasureTheory.Measure.quantile_eq_iff_of_ae_mem_of_strictMonoOn`);
- interior quantiles lie in every interval carrying the full mass (`Set.OrdConnected.quantile_mem`,
  `Set.OrdConnected.upperQuantile_mem`);
- the Dirac law has `(δ_c).quantile u = c` for `0 < u ≤ 1` and `(δ_c).upperQuantile u = c` for
  `0 ≤ u < 1` (`MeasureTheory.Measure.quantile_dirac`, `MeasureTheory.Measure.upperQuantile_dirac`).

Both quantiles are jointly measurable in the probability law, for the Giry structure, and the
interior level (`MeasureTheory.Measure.measurable_quantile_probabilityMeasure`,
`MeasureTheory.Measure.measurable_upperQuantile_probabilityMeasure`), with the parameterized-family
corollary: for a measurable family `a ↦ μ a` of probability laws, `(a, u) ↦ (μ a).quantile u` is
measurable on `α × (0, 1)` (`MeasureTheory.Measure.measurable_quantile_cdf_family`,
`MeasureTheory.Measure.measurable_upperQuantile_cdf_family`).

The quantile realizes every real law from a uniform variable: for a probability law `μ`, the image
of Lebesgue measure on `(0, 1)` under `Q` is `μ` (`MeasureTheory.Measure.map_quantile_volume_Ioo`,
`MeasureTheory.Measure.measurePreserving_quantile`). The same holds for the interval uniform law
`TauCeti.Probability.uniformMeasure 0 1` of §0.3, `(uniformMeasure 0 1).map μ.quantile = μ`: that
law is Lebesgue measure on `(0, 1]` (`TauCeti.Probability.uniformMeasure_eq_smul`), which agrees
with Lebesgue measure on `(0, 1)` because `{1}` is null
(`MeasureTheory.restrict_Ioo_eq_restrict_Ioc`). For an atomless probability law the probability
integral transform holds: the image of `μ` under `F` is Lebesgue measure on `[0, 1]`
(`MeasureTheory.Measure.cdf_map_eq_volume_restrict`).
In `EReal`, the one-sided limits of `Q` and of `Q⁺` at `0⁺` and `1⁻` are the infimum and the
supremum of the topological support, including infinite endpoints
(`MeasureTheory.Measure.tendsto_quantile_nhdsGT_zero`,
`MeasureTheory.Measure.tendsto_quantile_nhdsLT_one`,
`MeasureTheory.Measure.tendsto_upperQuantile_nhdsGT_zero`,
`MeasureTheory.Measure.tendsto_upperQuantile_nhdsLT_one`).

**Transport.** For a probability law `μ` and `0 < u < 1`,

    Q_{a+bX}(u) = a + b Q_X(u)        (b > 0),
                = a                    (b = 0),
                = a + b Q⁺_X(1 − u)    (b < 0),

(`TauCeti.Probability.quantile_map_affine`, with the cases
`TauCeti.Probability.quantile_map_affine_pos` and `TauCeti.Probability.quantile_map_affine_neg`),
and the upper versions exchange `Q` and `Q⁺` on the right
(`TauCeti.Probability.upperQuantile_map_affine`, `TauCeti.Probability.upperQuantile_map_affine_pos`,
`TauCeti.Probability.upperQuantile_map_affine_neg`). For `g : ℝ → ℝ` continuous and nondecreasing,
`Q_{g(X)} = g ∘ Q_X` on `(0, 1)` (`MeasureTheory.Measure.quantile_map_of_monotone`), and the same
holds when `g` is continuous and nondecreasing only on an interval carrying the full mass of `μ`
(`MeasureTheory.Measure.quantile_map_of_monotoneOn`); for `g` continuous and nonincreasing on such
an interval, `Q_{g(X)}(u) = g(Q⁺_X(1 − u))` (`MeasureTheory.Measure.quantile_map_of_antitoneOn`,
`MeasureTheory.Measure.quantile_map_of_antitone`), and `Q⁺_X(1 − u)` is replaced by `Q_X(1 − u)`
only where the two are proved equal. Upper-quantile counterparts hold for each
(`MeasureTheory.Measure.upperQuantile_map_of_monotone`,
`MeasureTheory.Measure.upperQuantile_map_of_monotoneOn`,
`MeasureTheory.Measure.upperQuantile_map_of_antitoneOn`). The specializations are the exponential,
`Q_{e^X} = e^(Q_X)` (`MeasureTheory.Measure.quantile_map_exp`); the logarithm on a law carried by
`(0, ∞)` (`MeasureTheory.Measure.quantile_map_log`); nonnegative real powers on a law carried by
`[0, ∞)` (`MeasureTheory.Measure.quantile_map_rpow`); the square root
(`MeasureTheory.Measure.quantile_map_sqrt`); and the reciprocal on a law carried by `(0, ∞)`,
`Q_{1/X}(u) = 1/Q⁺_X(1 − u)` (`MeasureTheory.Measure.quantile_map_inv`).

For a native law on `ℕ` or `ℤ`, the quantile of its real cast at `0 < u < 1` is the least integer
`k` with `u ≤ μ.real (Iic k)` (`MeasureTheory.Measure.quantile_map_natCast_eq_iff`,
`MeasureTheory.Measure.quantile_map_intCast_eq_iff`); this covers finite support: on `ℕ`, if
`μ(Iic k) = 1` then every level `1 − μ{k} < u < 1` has quantile `k`
(`MeasureTheory.Measure.quantile_map_natCast_eq_of_measureReal_Iic_eq_one`). Laws on other
carriers have quantiles only for their named real observables; on a finite carrier with a real
label `ℓ`, `Q(u) = x` iff `μ(ℓ < x) < u ≤ μ(ℓ ≤ x)` (`MeasureTheory.Measure.quantile_map_finite_eq_iff`).

*Needs:* Mathlib `ProbabilityTheory.cdf`, `MeasureTheory.ProbabilityMeasure`, `EReal`,
`MeasureTheory.Measure.support`; Tau Ceti `Probability/Quantile.lean`, `Probability/Quantile/Map.lean`,
`Probability/Quantile/Discrete.lean`, `Probability/Quantile/Finite.lean`, `Probability/Cdf.lean`,
`TauCeti.Probability.uniformMeasure`, `TauCeti.Probability.uniformMeasure_eq_smul`; Mathlib
`MeasureTheory.restrict_Ioo_eq_restrict_Ioc`; §7.1; §0.3, §0.5; §1.1.

**Checks.**

- For `μ = (δ₀ + δ₁)/2`, `Q(1/2) = 0` and `Q⁺(1/2) = 1`. The law of `−X` is `(δ₋₁ + δ₀)/2`, with
  `Q_{−X}(1/2) = −1 = −Q⁺_X(1/2)`; the negative-slope formula with `Q_X` in place of `Q⁺_X` would
  give `0`.
- For the same `μ`, the point `x = 1/2` satisfies `F(x−) ≤ 1/2 ≤ F(x)` although `Q(1/2) = 0`: the
  two inequalities alone do not single out the quantile on the plateau `[0, 1)` of `F`.
- A Dirac law has constant interior quantiles: `(δ_c).quantile u = c` for every `0 < u < 1`, and
  its affine image `δ_(a+bc)` has quantile `a + bc`, which the negative-slope formula reproduces as
  `a + b Q⁺(1 − u) = a + bc`.
- For `μ = δ₅`, `μ.quantile 0 = 0` by the `sInf` totalization, while the one-sided limit at `0⁺` is
  `5`, the infimum of the support; an endpoint statement read off the totalized value would be
  wrong.

### 7.3 Conditioning and interval truncation

For a measurable set `A` with `0 < μ(A) < ∞`, the conditional law `cond μ A`
(`ProbabilityTheory.cond`, `(μ A)⁻¹ • μ.restrict A`) is a probability measure
(`ProbabilityTheory.cond_isProbabilityMeasure_of_finite`) with masses
`(cond μ A)(t) = μ(A)⁻¹ μ(A ∩ t)` (`ProbabilityTheory.cond_apply`); if `μ(A) = 0` it is the zero
measure (`ProbabilityTheory.cond_eq_zero_of_meas_eq_zero`). Prove its density and integration
formulas: if `μ = ν.withDensity f` then `cond μ A = ν.withDensity (μ(A)⁻¹ · 1_A f)`, and for `g`
integrable on `A`, `∫ g d(cond μ A) = μ.real(A)⁻¹ ∫_A g dμ` (Billingsley). Conditioning is
measurable in the parameters: for a measurable family of finite measures `a ↦ μ a` and a measurable
incidence set `s ⊆ α × Ω`, `a ↦ cond (μ a) {x : (a, x) ∈ s}` is measurable, including where the
event has mass zero (`Measurable.cond`); for a fixed event (`{0}ᶜ`, say) it is
`Measurable.cond_const`, and for moving intervals `g⁻¹(l(a), r(a)]` with measurable endpoints the
four endpoint conventions are `Measurable.cond_preimage_Ioc`, `Measurable.cond_preimage_Icc`,
`Measurable.cond_preimage_Ioo`, `Measurable.cond_preimage_Ico`. The cdf of `cond μ A` for a finite
`μ` on `ℝ` and a measurable `A` with `μ(A) ≠ 0` is `x ↦ μ.real(A ∩ Iic x)/μ.real(A)`
(`MeasureTheory.Measure.cdf_cond`).

For a probability law `μ` truncated to `(l, r]`, with possibly infinite bounds, let
`L = μ.real(Iic l)` and `R = μ.real(Iic r)`, with `L = 0` at `l = −∞` and `R = 1` at `r = ∞`. If
`L < R`, then for every `x` and every `0 < u < 1`

    F_cond(x) = (min(R, max(L, F(x))) − L)/(R − L),        Q_cond(u) = Q_μ(L + u(R − L))

(`MeasureTheory.Measure.cdf_cond_Ioc`, `MeasureTheory.Measure.quantile_cond_Ioc` for finite bounds;
for infinite bounds, the forms for the difference `B \ A` of two measurable lower sets,
`MeasureTheory.Measure.cdf_cond_sdiff` and `MeasureTheory.Measure.quantile_cond_sdiff`, with
`A ∈ {∅, Iic l}` and `B ∈ {Iic r, ℝ}`) (Johnson, Kotz and Balakrishnan, vol. 1). For the other
three conventions the excluded lower mass and the retained upper mass are the appropriate `Iio` or
`Iic` values: `[l, r]` uses `μ.real(Iio l)` and `F(r)`, `(l, r)` uses `F(l)` and `μ.real(Iio r)`,
and `[l, r)` uses `μ.real(Iio l)` and `μ.real(Iio r)` (`MeasureTheory.Measure.cdf_cond_Icc`,
`MeasureTheory.Measure.quantile_cond_Icc`, `MeasureTheory.Measure.cdf_cond_Ioo`,
`MeasureTheory.Measure.quantile_cond_Ioo`, `MeasureTheory.Measure.cdf_cond_Ico`,
`MeasureTheory.Measure.quantile_cond_Ico`). Atoms at finite endpoints are kept by the conventions
that include them, and all four conventions give the same conditional law when the endpoint atoms
vanish (`MeasureTheory.Measure.cond_Icc_eq_cond_Ioc`, `MeasureTheory.Measure.cond_Ioo_eq_cond_Ioc`,
`MeasureTheory.Measure.cond_Ico_eq_cond_Ioc`), in particular for atomless laws.

*Needs:* Mathlib `ProbabilityTheory.cond`, `ProbabilityTheory.cond_isProbabilityMeasure_of_finite`,
`ProbabilityTheory.cond_apply`, `ProbabilityTheory.cond_eq_zero_of_meas_eq_zero`,
`MeasureTheory.Measure.withDensity`; Tau Ceti `Probability/ConditionalProbability.lean`,
`Probability/Distributions/Truncation.lean`; §7.2; §0.1, §0.4.

**Checks.**

- For `μ = δ₀/2 + U/2`, with `U` the uniform law on `(0, 1]`, conditioning on `[0, 1]` returns `μ`,
  with its atom `1/2` at `0`, while conditioning on `(0, 1]` gives `U`, which is atomless: the
  endpoint conventions differ exactly by endpoint atoms.
- For the exponential law of rate one truncated to `(1, 2]`, the median is
  `Q(L + (R − L)/2) = −log((e^(−1) + e^(−2))/2) ≈ 1.3799 = 1 + log(2e/(e + 1))`, as memorylessness
  predicts; the formula `Q(uR)` that forgets the excluded lower mass gives `≈ 0.5662`, outside
  `(1, 2]`.
- `cond δ₀ (1, 2]` is the zero measure, not a probability law: conditioning on an event of mass
  zero is not renormalized.

### 7.4 Atoms and general mixtures

For a measure `μ` on a measurable space, a point `c` and a weight `w ∈ [0, 1]`, the atom mixture
`MeasureTheory.Measure.atomMixture μ c w` is `w δ_c + (1 − w) μ` with `ℝ≥0∞` coefficients
`ENNReal.ofReal w` and `ENNReal.ofReal (1 − w)` (`MeasureTheory.Measure.atomMixture_def`). It is
`μ` at `w = 0` and `δ_c` at `w = 1` (`MeasureTheory.Measure.atomMixture_zero`,
`MeasureTheory.Measure.atomMixture_one`), a probability measure when `μ` is
(`MeasureTheory.Measure.isProbabilityMeasure_atomMixture`), and measurable jointly in `(μ, c, w)`
(`MeasureTheory.Measure.measurable_atomMixture`). With measurable singletons, its masses are
`w + (1 − w)μ{c}` at `c` and `(1 − w)μ{x}` at `x ≠ c`
(`MeasureTheory.Measure.atomMixture_singleton`, `MeasureTheory.Measure.atomMixture_singleton_of_ne`),
and integration against it is the convex combination `w f(c) + (1 − w)∫ f dμ` for `f` integrable
(`MeasureTheory.Measure.integral_atomMixture`). For a probability law `μ` on `ℝ` (Johnson, Kemp
and Kotz, chs. 3–6):

- if `μ = ν.withDensity f`, the mixture is the atom `w δ_c` plus the absolutely continuous part
  `ν.withDensity ((1 − w) f)` (`MeasureTheory.Measure.atomMixture_withDensity`);
- its mean is `wc + (1 − w)E[X]` for integrable `X`
  (`MeasureTheory.Measure.integral_id_atomMixture`), and for square-integrable `X` its variance is
  `(1 − w)Var X + w(1 − w)(c − E[X])²` (`MeasureTheory.Measure.variance_id_atomMixture`);
- its domain is `ℝ` at `w = 1` and `D_μ` otherwise
  (`MeasureTheory.Measure.integrableExpSet_id_atomMixture`), where its moment-generating function
  is `w e^(tc) + (1 − w)M_μ(t)` (`MeasureTheory.Measure.mgf_id_atomMixture`) and its
  cumulant-generating function the logarithm of that sum (`MeasureTheory.Measure.cgf_id_atomMixture`);
  its characteristic function is `w e^(itc) + (1 − w)φ_μ(t)`
  (`MeasureTheory.Measure.charFun_atomMixture`);
- its cdf is `F_w(x) = w 1_{c ≤ x} + (1 − w)F(x)` (`MeasureTheory.Measure.cdf_atomMixture`), and
  the quantile adjunction of §7.2 applied to this cdf is the general quantile statement for atom
  mixtures; if `μ` is a probability law carried by `[c, ∞)`, then for `0 < u ≤ 1` the quantile is
  `c` for `u ≤ w + (1 − w)μ{c}` and `Q_μ((u − w)/(1 − w))` above that level
  (`MeasureTheory.Measure.quantile_atomMixture`); at `w = 1` it is constantly `c`. The case `c = 0`
  with `μ` carried by `[0, ∞)` is the zero-atom statement.

**Mixture API.** For a probability measure `ρ` on `α` and `K : α → Measure β` measurable (or
`ρ`-a.e. measurable) whose values are probability measures `ρ`-almost everywhere, the mixture
`ρ.bind K` (Mathlib `MeasureTheory.Measure.bind`) is a probability measure
(`MeasureTheory.isProbabilityMeasure_bind`); it depends only on the `ρ`-a.e. class of `K`
(`MeasureTheory.Measure.bind_congr_right`), so values of `K` on `ρ`-null sets need no
probability extension; and pushforwards pass through it in both directions
(`MeasureTheory.Measure.map_bind`, `MeasureTheory.Measure.bind_map`) (Billingsley).

- Densities: if `K a = ν.withDensity (f a)` for `ρ`-almost every `a`, with `f` jointly measurable
  and `ρ`, `ν` s-finite, then `ρ.bind K = ν.withDensity (b ↦ ∫⁻ f a b dρ)`
  (`MeasureTheory.Measure.bind_eq_withDensity_of_ae_eq`) with the corresponding Radon–Nikodym
  derivative (`MeasureTheory.Measure.rnDeriv_bind_withDensity`, `ν` σ-finite), and a variable with
  law `ρ.bind K` has a density, almost everywhere equal to `b ↦ ∫⁻ f a b dρ`
  (`TauCeti.Probability.hasPDF_of_hasLaw_bind_withDensity`,
  `TauCeti.Probability.pdf_eq_of_hasLaw_bind_withDensity`); masses are `(ρ.bind K){x} = ∫⁻ K a {x} dρ`
  (`MeasureTheory.Measure.bind_apply`).
- Iterated integration: `∫⁻ g d(ρ.bind K) = ∫⁻ (∫⁻ g d(K a)) dρ`
  (`MeasureTheory.Measure.lintegral_bind`), and for `g` integrable against the mixture
  `∫ g d(ρ.bind K) = ∫ (∫ g d(K a)) dρ` (`MeasureTheory.Measure.integral_bind`), with integrability
  characterized componentwise (`MeasureTheory.Measure.integrable_bind_iff`).
- The cdf of a real mixture is `x ↦ ∫ F_{K a}(x) dρ(a)` (`MeasureTheory.Measure.cdf_bind`), and the
  characteristic function of a mixture of finite total mass on a real inner product space is
  `∫ φ_{K a} dρ(a)` (`MeasureTheory.Measure.charFun_bind`).
- Means and covariances: for measurable `K` and real observables `X`, `Y` square integrable under
  the mixture, the component means are square integrable (`TauCeti.Probability.memLp_integral_bind`),
  `E[X] = E_ρ[m]` with `m(a) = E_{K a}[X]`, and the law of total covariance
  `Cov(X, Y) = E_ρ[Cov_{K a}(X, Y)] + Cov_ρ(m_X, m_Y)` holds
  (`TauCeti.Probability.covariance_bind`), with the law of total variance as the case `X = Y`
  (`TauCeti.Probability.variance_bind`) and the Markov-kernel forms
  `ProbabilityTheory.Kernel.covariance_comp`, `ProbabilityTheory.Kernel.variance_comp`; applied to
  pairs of coordinates it gives the covariance matrix of a vector mixture.
- Exponential integrability of a measurable real observable `X` under the mixture is equivalent to
  finiteness of the iterated nonnegative extended-real integral
  `∫⁻ ∫⁻ e^(tX) d(K a) dρ(a) < ∞` (`MeasureTheory.Measure.mem_integrableExpSet_bind_iff`); only on
  that domain are the real transforms used: the moment-generating function is
  `∫ M_{K a}(t) dρ(a)` (`MeasureTheory.Measure.mgf_bind`) and the cumulant-generating function is
  `log ∫ M_{K a}(t) dρ(a)` (`MeasureTheory.Measure.cgf_bind`), the logarithm of a weighted mgf sum,
  not a mixture of cumulant-generating functions.

**Applications.** The finite mixture with simplex weights `p : Convexity.StdSimplex ℝ≥0 ι` is
`TauCeti.Probability.finiteMixtureMeasure p K = ∑ᵢ pᵢ Kᵢ`, equal to the mixture of `K` over the
categorical law of `p` (`TauCeti.Probability.finiteMixtureMeasure_eq_bind`); it is a probability
measure when every component is (`TauCeti.Probability.isProbabilityMeasure_finiteMixtureMeasure`),
measurable in its parameters (`TauCeti.Probability.measurable_finiteMixtureMeasure`), and a function
is integrable against it iff it is integrable against every component of positive weight
(`TauCeti.Probability.integrable_finiteMixtureMeasure_iff`). Prove that its exponential-integrability
domain is the intersection of the component domains over the components of positive weight,
`integrableExpSet X (∑ pᵢ Kᵢ) = ⋂_{pᵢ > 0} integrableExpSet X (Kᵢ)`. The scalar Gaussian mixture
`TauCeti.Probability.gaussianMixtureMeasure p m v` has density `∑ pᵢ φ_{mᵢ,vᵢ}` on its absolutely
continuous part (`TauCeti.Probability.gaussianMixtureMeasure_eq_sum_dirac_add_withDensity`, and
`TauCeti.Probability.gaussianMixtureMeasure_eq_withDensity` when every active variance is
positive), cdf `∑ pᵢ F_{mᵢ,vᵢ}` (`TauCeti.Probability.cdf_gaussianMixtureMeasure`) and quantile
adjunction `Q(u) ≤ x ⟺ u ≤ ∑ pᵢ F_{mᵢ,vᵢ}(x)` (`TauCeti.Probability.quantile_gaussianMixtureMeasure_le_iff`);
the multivariate Gaussian mixture `TauCeti.Probability.multivariateGaussianMixtureMeasure p m S`
has the component densities of its positive-definite components
(`TauCeti.Probability.multivariateGaussianMixtureMeasure_eq_add_withDensity`,
`TauCeti.Probability.multivariateGaussianMixtureMeasure_eq_withDensity`). Arbitrary mixtures and
jump laws may have singular continuous components, so no density statement is made for them.

The zero-inflated, zero-truncated and hurdle versions of a law `ν` on `ℕ` are
`ν.atomMixture 0 w`, `cond ν {0}ᶜ` and `(cond ν {0}ᶜ).atomMixture 0 w` (Johnson, Kemp and Kotz,
chs. 3–6). For a probability law `ν`:

- zero inflation has cumulative masses `w + (1 − w)ν(Iic k)` and the cast quantile is zero exactly
  for `u ≤ w + (1 − w)ν{0}`, rescaled to `Q_ν((u − w)/(1 − w))` above
  (`MeasureTheory.Measure.atomMixture_zero_real_Iic`,
  `MeasureTheory.Measure.quantile_map_natCast_atomMixture_zero`);
- zero truncation is the zero measure exactly when `ν{0} = 1`
  (`ProbabilityTheory.cond_compl_singleton_eq_zero_iff`) and otherwise a probability law
  (`ProbabilityTheory.isProbabilityMeasure_cond_compl_singleton`) with masses `ν{k}/(1 − ν{0})`
  for `k ≠ 0` (`ProbabilityTheory.cond_compl_singleton_real_singleton`), cumulative masses
  `(ν(Iic k) − ν{0})/(1 − ν{0})` (`MeasureTheory.Measure.cond_compl_zero_real_Iic`), raw moments
  of positive order and mean divided by `1 − ν{0}`
  (`MeasureTheory.Measure.integral_pow_map_natCast_cond_compl_zero`,
  `MeasureTheory.Measure.integral_id_map_natCast_cond_compl_zero`), the corresponding variance
  (`MeasureTheory.Measure.variance_id_map_natCast_cond_compl_zero`), the domain of `ν`
  (`MeasureTheory.Measure.integrableExpSet_id_map_natCast_cond_compl_zero`) and, when `ν{0} ≠ 1`,
  cast cdf and quantile rescaled through `ν{0} + u(1 − ν{0})`
  (`MeasureTheory.Measure.cdf_map_natCast_cond_compl_zero`,
  `MeasureTheory.Measure.quantile_map_natCast_cond_compl_zero`);
- the hurdle law has mass `w` at zero and `(1 − w)ν{k}/(1 − ν{0})` at `k ≠ 0`
  (`MeasureTheory.Measure.cond_compl_zero_atomMixture_zero_real_singleton_zero`,
  `MeasureTheory.Measure.cond_compl_zero_atomMixture_zero_real_singleton`), is a probability law
  exactly when `ν{0} ≠ 1` or `w = 1` (`MeasureTheory.Measure.isProbabilityMeasure_cond_compl_zero_atomMixture_zero_iff`),
  is `δ₀` at `w = 1` even when the truncated base is zero (`MeasureTheory.Measure.atomMixture_one`),
  and, when `ν{0} ≠ 1`, has the rescaled cdf and quantile, zero for `u ≤ w`
  (`MeasureTheory.Measure.cdf_map_natCast_cond_compl_zero_atomMixture_zero`,
  `MeasureTheory.Measure.quantile_map_natCast_cond_compl_zero_atomMixture_zero`), moments
  (`MeasureTheory.Measure.integral_id_map_natCast_cond_compl_zero_atomMixture_zero`,
  `MeasureTheory.Measure.variance_id_map_natCast_cond_compl_zero_atomMixture_zero`) and domain `ℝ`
  at `w = 1`, that of `ν` otherwise
  (`MeasureTheory.Measure.integrableExpSet_id_map_natCast_cond_compl_zero_atomMixture_zero`).

For the Poisson law of rate `r` these are explicit. Zero-inflated: mass `w + (1 − w)e^(−r)` at zero
and `(1 − w)e^(−r)rᵏ/k!` at `k ≠ 0`, mean `(1 − w)r`, variance `(1 − w)r(1 + wr)`, domain `ℝ`, cdf
`w + (1 − w)(1 − G_{⌊x⌋+1}(r))` for `x ≥ 0` and the rescaled least-crossing quantile
(`TauCeti.Probability.poissonMeasure_atomMixture_zero_real_singleton_zero`,
`TauCeti.Probability.poissonMeasure_atomMixture_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_poissonMeasure_atomMixture_zero`,
`TauCeti.Probability.variance_id_map_cast_poissonMeasure_atomMixture_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_atomMixture_zero`,
`TauCeti.Probability.cdf_map_cast_poissonMeasure_atomMixture_zero`,
`TauCeti.Probability.quantile_map_cast_poissonMeasure_atomMixture_zero`). Zero-truncated: the zero
measure exactly at `r = 0` (`TauCeti.Probability.poissonMeasure_cond_compl_zero_eq_zero_iff`),
otherwise masses `rᵏ/(k!(eʳ − 1))`, mean `r/(1 − e^(−r))`, variance
`r(1 + r)/(1 − e^(−r)) − (r/(1 − e^(−r)))²`, domain `ℝ`, cdf and quantile
(`TauCeti.Probability.poissonMeasure_cond_compl_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_poissonMeasure_cond_compl_zero`,
`TauCeti.Probability.variance_id_map_cast_poissonMeasure_cond_compl_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_cond_compl_zero`,
`TauCeti.Probability.cdf_map_cast_poissonMeasure_cond_compl_zero`,
`TauCeti.Probability.quantile_map_cast_poissonMeasure_cond_compl_zero`). Hurdle: masses
`(1 − w)rᵏ/(k!(eʳ − 1))` at `k ≠ 0`, mean `(1 − w)r/(1 − e^(−r))`, the corresponding variance,
domain `ℝ`, cdf and quantile
(`TauCeti.Probability.poissonMeasure_cond_compl_zero_atomMixture_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.variance_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.cdf_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.quantile_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`). For the
negative binomial law with `r ≥ 0`, `0 < p ≤ 1` (zero mass `pʳ`): zero-inflated masses, mean
`(1 − w)r(1 − p)/p`, variance `(1 − w)r(1 − p)(1 + wr(1 − p))/p²`, domain `{t : (1 − p)eᵗ < 1}`
for `r > 0` and `w ≠ 1`, cdf `w + (1 − w)I_p(r, ⌊x⌋ + 1)` and quantile
(`TauCeti.Probability.negativeBinomialMeasure_atomMixture_zero_real_singleton_zero`,
`TauCeti.Probability.negativeBinomialMeasure_atomMixture_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_atomMixture_zero`,
`TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_atomMixture_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_atomMixture_zero`,
`TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_atomMixture_zero`,
`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_atomMixture_zero`); zero truncation
removes all mass exactly when `r = 0` or `p = 1`
(`TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_eq_zero_iff`), and otherwise has
masses divided by `1 − pʳ`, mean `r(1 − p)/(p(1 − pʳ))`, the corresponding variance, the domain of
the base, cdf `(I_p(r, ⌊x⌋ + 1) − pʳ)/(1 − pʳ)` and quantile
(`TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_cond_compl_zero`,
`TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_cond_compl_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_cond_compl_zero`,
`TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_cond_compl_zero`,
`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_cond_compl_zero`); the hurdle
version has the analogous masses, moments, domain, cdf and quantile
(`TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_atomMixture_zero_real_singleton`,
`TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`,
`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`).
Here `G` is the regularized incomplete Gamma function of §2.1 and `I` the regularized incomplete
Beta function of §2.2. Probability claims about zero truncations and hurdle laws exclude the
zero-base cases.

*Needs:* Mathlib `MeasureTheory.Measure.bind`, `MeasureTheory.isProbabilityMeasure_bind`,
`MeasureTheory.Measure.bind_congr_right`, `MeasureTheory.Measure.bind_apply`,
`MeasureTheory.Measure.lintegral_bind`, `MeasureTheory.Measure.map_bind`,
`MeasureTheory.Measure.bind_map`, `ProbabilityTheory.cond`, `ProbabilityTheory.covariance`,
`ProbabilityTheory.variance`, `Convexity.StdSimplex`; Tau Ceti
`MeasureTheory/Measure/AtomMixture.lean`, `Probability/Distributions/AtomMixture.lean`,
`Probability/Distributions/Mixture.lean`, `MeasureTheory/Measure/Mixture/Basic.lean`,
`MeasureTheory/Integral/Bind.lean`, `Probability/Moments/Mixture.lean`,
`Probability/Distributions/Gaussian/Mixture/`, `Probability/Distributions/Zero/`,
`Probability/Distributions/Poisson/Zero/`, `Probability/Distributions/NegativeBinomial/Zero/`,
`TauCeti.Probability.categoricalMeasure`; §7.2, §7.3; §1.2, §1.4, §1.10, §2.1, §2.2, §2.4, §3.9;
§5.2.

**Checks.**

- The zero-inflated Poisson law with `w = 1/2`, `r = 1` has mass `1/2 + e^(−1)/2 ≈ 0.6839` at zero,
  mean `1/2` and variance `(1 − w)r(1 + wr) = 3/4`, computed also as `E[X²] − E[X]² = 1 − 1/4`; the
  Poisson-like value `(1 − w)r = 1/2` would miss the overdispersion.
- For `μ` exponential of rate one and `w = 1/2`, the atom mixture at `0` has quantile `0` for
  `u ≤ 1/2` and `Q_μ((u − 1/2)/(1/2))` above, so its quantile at `u = 3/4` is `log 2`.
- The hurdle law built on `ν = δ₀` (a Poisson law of rate zero) is `δ₀` at `w = 1` but has total
  mass `w < 1` for `w < 1`, because the truncated base is the zero measure.
- The mixture `N(−1, 1)/2 + N(1, 1)/2` has variance `2`: expected component variance `1` plus
  variance `1` of the component means; averaging the component variances alone gives `1`.
- The mixture `N(0, 1)/2 + N(0, 4)/2` has cumulant-generating function
  `log(e^(1/2)/2 + e²/2) ≈ 1.5083` at `t = 1`, while the average of the component cumulant-generating
  functions is `1.25`.
- For the zero-inflated Poisson law with weight `w = 1/2` at `0` and rate `1`, the cdf at `0` computed
  from the masses, `w + (1 − w)e^(−1) ≈ 0.68394`, equals the atom-mixture value `w · 1 + (1 − w)F_Po(0)`,
  and at `1` both give `≈ 0.86788`; the least-crossing quantile is `0` at `u = 0.68` and `1` at
  `u = 0.7` either way. For the zero-truncated Poisson law of rate `1`, the masses
  `e^(−1)/(k! (1 − e^(−1)))` give `F(1) = e^(−1)/(1 − e^(−1)) ≈ 0.58198`, which is the conditioning value
  `(F_Po(1) − F_Po(0))/(1 − F_Po(0))`, and the quantile at `u = 0.59` is `2`; rescaling by
  `1 − F_Po(0)` without removing the atom at `0` would give the truncated law a positive cdf at `0`.

### 7.5 Compound Poisson

On a measurable additive monoid, the convolution powers of a measure `μ` are
`MeasureTheory.Measure.convolutionPower`, with `μ^{*0} = δ₀` and `μ^{*(n+1)} = μ^{*n} ∗ μ`
(`MeasureTheory.Measure.convolutionPower_zero`, `MeasureTheory.Measure.convolutionPower_succ`). With
measurable addition, they are probability measures when `μ` is
(`MeasureTheory.Measure.isProbabilityMeasure_convolutionPower`), measurable in the probability law
`μ` (`MeasureTheory.Measure.measurable_convolutionPower`) and add,
`μ^{*(m+n)} = μ^{*m} ∗ μ^{*n}` for s-finite `μ` (`MeasureTheory.Measure.convolutionPower_add`);
the sum of `n` independent variables with law `μ` has law `μ^{*n}`
(`ProbabilityTheory.iIndepFun.hasLaw_finset_sum_convolutionPower`). For a rate `r : ℝ≥0` and a
measure `μ`, the compound Poisson law is

    compoundPoissonMeasure r μ = (poissonMeasure r).bind (n ↦ μ^{*n})

(`TauCeti.Probability.compoundPoissonMeasure`, `TauCeti.Probability.compoundPoissonMeasure_def`)
(Johnson, Kemp and Kotz, chs. 3–6). It is the law of `∑_{i<N} Xᵢ` for `N` Poisson of rate `r`
independent of an independent sequence `Xᵢ` with law `μ`
(`ProbabilityTheory.iIndepFun.hasLaw_sum_range_compoundPoissonMeasure`). For a probability law `μ`:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_compoundPoissonMeasure`),
  measurable in the rate (`TauCeti.Probability.measurable_compoundPoissonMeasure`) and jointly in
  the rate and the jump law (`TauCeti.Probability.measurable_compoundPoissonMeasure_probability`,
  with measurable addition);
- at rate zero, and for the zero jump `δ₀`, it is `δ₀`
  (`TauCeti.Probability.compoundPoissonMeasure_zero`,
  `TauCeti.Probability.compoundPoissonMeasure_dirac_zero`); for a Dirac jump `δ_x` it is the image
  of the Poisson law under `n ↦ n • x` (`TauCeti.Probability.compoundPoissonMeasure_dirac`);
- at a fixed s-finite jump law, convolution adds rates,
  `CP(r, μ) ∗ CP(s, μ) = CP(r + s, μ)`
  (`TauCeti.Probability.compoundPoissonMeasure_conv_compoundPoissonMeasure`), and independent
  sums have the added rate (`ProbabilityTheory.IndepFun.hasLaw_add_compoundPoissonMeasure`);
- on a second-countable real inner product space, its characteristic function is
  `exp(r(φ_μ − 1))` (`TauCeti.Probability.charFun_compoundPoissonMeasure`); its mean is `r E[X]` when
  the jump `X` is integrable (`TauCeti.Probability.integral_id_compoundPoissonMeasure`); for a
  square-integrable jump on `EuclideanSpace ℝ ι` its covariance matrix is `r E[XXᵀ]`
  (`TauCeti.Probability.covMatrix_compoundPoissonMeasure`), with the bilinear and
  linear-functional forms `TauCeti.Probability.covarianceBilin_compoundPoissonMeasure` and
  `TauCeti.Probability.covariance_compoundPoissonMeasure`; on `ℝ` its variance is `r E[X²]`
  (`TauCeti.Probability.variance_id_compoundPoissonMeasure`);
- for a measurable additive real observable `f` (a linear functional, say) and an s-finite jump
  law, the domain of `f` under the compound law is `ℝ` at rate zero and that of `f` under `μ` at
  positive rate (`TauCeti.Probability.integrableExpSet_compoundPoissonMeasure`), and on it
  `M(t) = exp(r(M_μ(t) − 1))` and `K(t) = r(M_μ(t) − 1)`
  (`TauCeti.Probability.mgf_compoundPoissonMeasure`, `TauCeti.Probability.cgf_compoundPoissonMeasure`);
- for real jumps its cdf is the Poisson-weighted series including the empty-sum atom,
  `F(x) = e^(−r) 1_{x ≥ 0} + ∑_{n≥1} e^(−r) rⁿ/n! F_{μ^{*n}}(x)`
  (`TauCeti.Probability.cdf_compoundPoissonMeasure`), with quantile adjunction
  `Q(u) ≤ x ⟺ u ≤ F(x)` for this series (`TauCeti.Probability.quantile_compoundPoissonMeasure_le_iff`);
  no general density is asserted;
- for native jumps on `ℕ` or `ℤ` its masses are the series `∑ₙ e^(−r) rⁿ/n! μ^{*n}{k}`
  (`TauCeti.Probability.compoundPoissonMeasure_real_singleton`), at least `e^(−r)` at zero
  (`TauCeti.Probability.exp_neg_le_compoundPoissonMeasure_real_singleton_zero`), and the cast laws
  have the corresponding cdf series and least-crossing quantiles
  (`TauCeti.Probability.cdf_map_natCast_compoundPoissonMeasure`,
  `TauCeti.Probability.cdf_map_intCast_compoundPoissonMeasure`,
  `TauCeti.Probability.quantile_map_natCast_compoundPoissonMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_intCast_compoundPoissonMeasure_eq_iff`).

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `MeasureTheory.Measure.conv`,
`MeasureTheory.Measure.bind`, `MeasureTheory.charFun`, `ProbabilityTheory.mgf`,
`ProbabilityTheory.iIndepFun`; Tau Ceti `MeasureTheory/Group/Convolution/Power.lean`,
`Probability/Independence/ConvolutionPower.lean`, `Probability/Distributions/CompoundPoisson/`;
§7.2, §7.4; §1.1, §1.4; §5.1.

**Checks.**

- With jump law `δ₁` on `ℕ`, `compoundPoissonMeasure r δ₁` is the Poisson law of rate `r`; its
  characteristic function `exp(r(e^(it) − 1))` is the Poisson one.
- For an atomless jump law the compound law has an atom of mass exactly `e^(−r)` at zero, coming
  from `μ^{*0} = δ₀`; a definition starting the convolution powers at `n = 1` would have total mass
  `1 − e^(−r)`.
- With jumps uniform on `{1, 2}` and `r = 2`, the mean is `2 · 3/2 = 3` and the variance is
  `r E[X²] = 2 · 5/2 = 5`; the value `r Var X = 1/2` is wrong.
- With standard Cauchy jumps, whose domain is `{0}`, the compound law of rate zero is `δ₀` with
  domain `ℝ`, and at every positive rate its domain is `{0}`.

### 7.6 Mixed Poisson

For a measure `ρ` on `ℝ≥0`, the mixed Poisson law is
`TauCeti.Probability.mixedPoissonMeasure ρ = ρ.bind poissonMeasure`
(`TauCeti.Probability.mixedPoissonMeasure_def`) (Johnson, Kemp and Kotz, chs. 3–6). It is
measurable in `ρ` (`TauCeti.Probability.measurable_mixedPoissonMeasure`), a probability measure when
`ρ` is (`TauCeti.Probability.isProbabilityMeasure_mixedPoissonMeasure`), the Poisson law of rate `λ`
for `ρ = δ_λ` (`TauCeti.Probability.mixedPoissonMeasure_dirac`), with masses
`E[e^(−Λ) Λᵏ/k!]` (`TauCeti.Probability.mixedPoissonMeasure_real_singleton`), cumulative masses
`∑_{k≤n} E[e^(−Λ) Λᵏ/k!]` (`TauCeti.Probability.mixedPoissonMeasure_real_Iic`,
`TauCeti.Probability.cdf_map_cast_mixedPoissonMeasure`) and least-crossing quantiles of the cast law,
zero exactly for `u ≤ E[e^(−Λ)]` (`MeasureTheory.Measure.quantile_map_cast_mixedPoissonMeasure_eq_iff`,
`MeasureTheory.Measure.quantile_map_cast_mixedPoissonMeasure_eq_zero_iff`).

For `N` with the mixed law and `Λ` with law `ρ`:

- factorial moments: `E[(N)ₖ] = E[Λᵏ]` first as nonnegative extended integrals
  (`TauCeti.Probability.lintegral_descFactorial_mixedPoissonMeasure`), hence integrability of
  `(N)ₖ` iff integrability of `Λᵏ` (`TauCeti.Probability.integrable_descFactorial_mixedPoissonMeasure_iff`)
  and equality of the real integrals (`TauCeti.Probability.integral_descFactorial_mixedPoissonMeasure`);
- `E[N] = E[Λ]` (`TauCeti.Probability.integral_natCast_mixedPoissonMeasure`), with integrability of
  `N` iff that of `Λ` (`TauCeti.Probability.integrable_natCast_mixedPoissonMeasure_iff`), and for
  `Λ` square integrable `Var N = E[Λ] + Var Λ` (`TauCeti.Probability.variance_mixedPoissonMeasure`);
- the probability generating function at `z ≥ 0` is `E[e^(Λ(z−1))]`
  (`TauCeti.Probability.pgf_mixedPoissonMeasure`), and substituting `z = eᵗ`, the exact domain is
  `{t : eᵗ − 1 ∈ integrableExpSet (λ ↦ (λ : ℝ)) ρ}`
  (`TauCeti.Probability.integrableExpSet_natCast_mixedPoissonMeasure`) with
  `M_N(t) = M_Λ(eᵗ − 1)` and `K_N(t) = K_Λ(eᵗ − 1)`
  (`TauCeti.Probability.mgf_natCast_mixedPoissonMeasure`,
  `TauCeti.Probability.cgf_natCast_mixedPoissonMeasure`).

Gamma mixing is recovered through the nonnegative carrier: the Gamma law of shape `r > 0` and rate
`p/(1 − p)`, `0 < p < 1`, carried to `ℝ≥0` by `Real.toNNReal`, mixes the Poisson laws into the
negative binomial law with parameters `r`, `p`
(`TauCeti.Probability.mixedPoissonMeasure_map_toNNReal_gammaMeasure`).

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `MeasureTheory.Measure.bind`,
`ProbabilityTheory.gammaMeasure`, `Real.toNNReal`; Tau Ceti
`Probability/Distributions/Poisson/Mixed/`, `Probability/Distributions/Gamma/Poisson.lean`,
`TauCeti.Probability.pgf`; §7.2, §7.4; §1.4, §1.6, §1.12, §3.9, §4.5.

**Checks.**

- Mixing over the Gamma law of shape `2` and rate `1` gives the negative binomial law with `r = 2`,
  `p = 1/2`: mean `2 = E[Λ]` and variance `4 = E[Λ] + Var Λ = 2 + 2`, and
  `E[N(N − 1)] = E[Λ²] = 6`.
- For the same mixture the moment-generating function is `(1 − (eᵗ − 1))^(−2)`, finite exactly
  for `t < log 2`; reading the Gamma domain `t < 1` directly would be wrong.
- For `ρ = δ_λ` the variance formula gives `λ + 0`, the Poisson variance.

### 7.7 Folding and censoring

For a probability law `μ` on `ℝ`, the folded law is `μ.map |·|`
(Johnson, Kotz and Balakrishnan, vol. 1). Its cdf is `F(x) − F((−x)−)` for `x ≥ 0` and zero below
(`MeasureTheory.Measure.cdf_map_abs_of_nonneg`, `MeasureTheory.Measure.cdf_map_abs_of_neg`), its
atom at zero is `μ{0}` (`MeasureTheory.Measure.map_abs_apply_zero`), and if `μ` has a density `f`
the folded law has density `f(x) + f(−x)` on `x > 0` and zero elsewhere
(`TauCeti.Probability.map_abs_withDensity`; for a random variable, `TauCeti.Probability.hasPDF_abs`,
`TauCeti.Probability.pdf_abs`). For a symmetric law (`MeasureTheory.Measure.IsNegInvariant`) the
cdf is `2F(x) − 1` on `x ≥ 0` (`MeasureTheory.Measure.cdf_map_abs_of_isNegInvariant`), the quantile
is `Q_{|X|}(u) = Q_μ((1 + u)/2)` for `u > 0` (`MeasureTheory.Measure.quantile_map_abs`), and if `μ`
has no atom at zero the folded law is the conditioning of `μ` on `[0, ∞)`
(`TauCeti.Probability.map_abs_eq_cond_Ici`); in particular this holds for symmetric atomless laws.

Censoring by `g(x) = min(r, max(l, x))` with `l < r` finite is the pushforward along the projection
onto `[l, r]` (Mathlib `Set.projIcc`): it is the atom `μ(Iic l)` at `l`, the atom `μ(Ici r)` at
`r`, and `μ` restricted to `(l, r)` (`MeasureTheory.Measure.map_coe_projIcc`). Its cdf is `0` below
`l`, `F(x)` on `[l, r)` and `1` from `r` on (`MeasureTheory.Measure.cdf_map_coe_projIcc`), and its
quantile is `g(Q_μ(u))` for `0 < u < 1` (`MeasureTheory.Measure.quantile_map_coe_projIcc`). Every
natural moment is finite and decomposes into the endpoint contributions and the interior integral,
`E[g(X)ⁿ] = μ.real(Iic l) lⁿ + ∫_{(l,r)} xⁿ dμ + μ.real(Ici r) rⁿ`
(`MeasureTheory.Measure.integrable_pow_map_coe_projIcc`,
`MeasureTheory.Measure.integral_pow_map_coe_projIcc`, with the first and second moments
`MeasureTheory.Measure.integral_id_map_coe_projIcc`, `MeasureTheory.Measure.integral_sq_map_coe_projIcc`),
and the domain is `ℝ` (`MeasureTheory.Measure.integrableExpSet_id_map_coe_projIcc`). One-sided
censoring at a lower bound `l` (`Set.projIci`) or an upper bound `r` (`Set.projIic`) has the one atom
and the restriction (`MeasureTheory.Measure.map_coe_projIci`, `MeasureTheory.Measure.map_coe_projIic`),
the cdf and quantile (`MeasureTheory.Measure.cdf_map_coe_projIci`,
`MeasureTheory.Measure.quantile_map_coe_projIci`, `MeasureTheory.Measure.cdf_map_coe_projIic`,
`MeasureTheory.Measure.quantile_map_coe_projIic`), integrability exactly that of `μ` on the
unchanged tail (`MeasureTheory.Measure.integrable_map_coe_projIci_iff`,
`MeasureTheory.Measure.integrable_map_coe_projIic_iff`), and the first and second moment
decompositions (`MeasureTheory.Measure.integral_id_map_coe_projIci`,
`MeasureTheory.Measure.integral_sq_map_coe_projIci`, `MeasureTheory.Measure.integral_id_map_coe_projIic`,
`MeasureTheory.Measure.integral_sq_map_coe_projIic`). Censoring is a pushforward and keeps all the
mass; it is distinct from the conditional truncation of §7.3.

*Needs:* Mathlib `Set.projIcc`, `Set.projIci`, `Set.projIic`, `MeasureTheory.Measure.IsNegInvariant`,
`ProbabilityTheory.cond`; Tau Ceti `Probability/Distributions/Folding.lean`,
`Probability/Distributions/Censoring.lean`, `MeasureTheory/Measure/Real.lean`,
`MeasureTheory/Measure/WithDensity.lean`, `Probability/Cdf.lean`; §7.2, §7.3; §0.1.

**Checks.**

- The standard Gaussian censored to `[−1, 1]` has atoms `Φ(−1) ≈ 0.1587` at `−1` and at `1`, and
  second moment `2Φ(−1) + (2Φ(1) − 1 − 2φ(1)) ≈ 0.5161`; its conditioning on `[−1, 1]` is atomless,
  with density `φ/(2Φ(1) − 1)` there. A censoring defined as conditioning would lose the atoms.
- The folded standard Gaussian has median `Q((1 + 1/2)/2) = Q(3/4) ≈ 0.6745`; using the level `u/2`
  would give the negative value `Q(1/4)`.
- For `X` with `P(X = 0) = 1/2`, `P(X = ±1) = 1/4`, the folded law has atom `1/2` at `0`, not
  `1`: the atom at zero is not doubled.

### 7.8 Exponential tilting

For a measure `μ` and a real function `f`, the exponential tilt is Mathlib's
`MeasureTheory.Measure.tilted`, the measure with density `e^f / ∫ e^f dμ` with respect to `μ`,
and the zero measure when `e^f` is not integrable. It is a probability measure when `μ ≠ 0` and
`e^f` is integrable (`MeasureTheory.isProbabilityMeasure_tilted`), tilts compose,
`(μ.tilted f).tilted g = μ.tilted (f + g)` when `e^f` is integrable (`MeasureTheory.tilted_tilted`),
its Radon–Nikodym derivative with respect to a σ-finite `ν` is `e^f / ∫ e^f dμ` times that of `μ`
(`MeasureTheory.rnDeriv_tilted_left`, for σ-finite `μ` and `f` a.e. measurable for `ν`), and along a
statistic `X` its mean and
variance are the first two derivatives of the cumulant-generating function at interior points of
the domain (`ProbabilityTheory.integral_tilted_mul_self`, `ProbabilityTheory.variance_tilted_mul`).
The tilt is measurable in its parameter: for an s-finite kernel `κ` and jointly measurable `f`,
`b ↦ (κ b).tilted (f b)` is measurable (`TauCeti.measurable_tilted`), and for an s-finite `μ` and a
measurable statistic `X`, `t ↦ μ.tilted (tX)` is measurable (`TauCeti.measurable_tilted_mul`). Its moment-generating
function is

    M_t(s) = M(t + s)/M(t),

for all `s` and `t`, both sides vanishing when `e^(tX)` is not integrable (`TauCeti.mgf_tilted_mul`);
its domain is `D − t` when `t ∈ D` (`TauCeti.integrableExpSet_tilted_mul`), and its
cumulant-generating function is `K(t + s) − K(t)` when both exponential integrals are finite
(`TauCeti.cgf_tilted_mul`).

The parameter identities of the tilt along the identity (along the real cast for the native
laws) are: Gaussian `(m, v) ↦ (m + vt, v)` for
every `v ≥ 0`, including the Dirac law `v = 0` (`TauCeti.Probability.gaussianReal_tilted_mul`);
Gamma `(a, r) ↦ (a, r − t)` for `a, r > 0` and `t < r` (`TauCeti.Probability.gammaMeasure_tilted_mul`);
native Poisson `λ ↦ λeᵗ` for every `λ ≥ 0`, including `λ = 0`
(`TauCeti.Probability.poissonMeasure_tilted_mul`); native binomial
`p ↦ peᵗ/(1 − p + peᵗ)` for every `p ∈ [0, 1]`, including the Dirac laws at `p = 0` and `p = 1`
(`TauCeti.Probability.binomial_tilted_mul`). Vector tilting on spheres is specialized in §12.2.

*Needs:* Mathlib `MeasureTheory.Measure.tilted`, `MeasureTheory.isProbabilityMeasure_tilted`,
`MeasureTheory.tilted_tilted`, `MeasureTheory.rnDeriv_tilted_left`,
`ProbabilityTheory.integral_tilted_mul_self`, `ProbabilityTheory.variance_tilted_mul`,
`ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.poissonMeasure`,
`ProbabilityTheory.binomial`; Tau Ceti `MeasureTheory/Measure/Tilted.lean`,
`Probability/Moments/Tilted.lean`, `Probability/Distributions/Tilted.lean`; §1.2, §1.4, §1.6, §1.10.

**Checks.**

- Tilting the standard Gaussian by `t` gives `N(t, 1)`, and `M_t(s) = e^((t+s)²/2 − t²/2) = e^(ts + s²/2)`
  is the moment-generating function of `N(t, 1)`.
- Tilting the exponential law of rate one (the Gamma law `(1, 1)`) by `t = 2` gives the zero measure,
  since `e^(2x)` is not integrable; the Gamma identity requires `t < r`, and `(1, −1)` names no law.
- The binomial law with `p = 1/2` tilted by `t = log 3` has `p' = (3/2)/(1/2 + 3/2) = 3/4`.

### 7.9 Survival and hazard

For a probability law `μ` on `ℝ` with `f` the derivative of `F`, the survival function is
`S = 1 − F`, the hazard `h = f/S` and the cumulative hazard `H = −log S`, all on `{S > 0}`;
elsewhere the ordinary totalized division and logarithm are kept and no hazard identity is asserted
(Johnson, Kotz and Balakrishnan, vol. 1). For a real function `S` absolutely continuous on the
interval between `a` and `x` (Mathlib `AbsolutelyContinuousOnInterval`), positive there, with
`S' = −f` almost everywhere there, `f/S` is interval integrable and

    S(x) = S(a) exp(−∫_a^x f(t)/S(t) dt)

(`TauCeti.Probability.survival_eq_exp_integral_hazard`, with no order assumed between `a` and
`x`); for `S = 1 − F` this is `TauCeti.Probability.intervalIntegrable_div_one_sub_cdf` and
`TauCeti.Probability.one_sub_cdf_eq_mul_exp_neg_integral`. Wherever `F` has derivative `d` at `t`
and `S(t) > 0`, `H` has derivative `d/S(t)` at `t` (`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf`),
so `H' = f/S` almost everywhere on such an interval.

The bridge from a density representation is: if `μ = volume.withDensity (ofReal ∘ f)` with `f`
nonnegative and a.e. measurable, then `F(b) − F(a) = ∫_a^b f`
(`TauCeti.Probability.cdf_sub_cdf_eq_integral_of_eq_withDensity`), `F` is absolutely continuous on
every compact interval (`TauCeti.Probability.absolutelyContinuousOnInterval_cdf_of_eq_withDensity`),
`F' = f` almost everywhere (`TauCeti.Probability.ae_hasDerivAt_cdf_of_eq_withDensity`), and
`F'(t) = f(t)` at every continuity point `t` of `f`
(`TauCeti.Probability.hasDerivAt_cdf_of_eq_withDensity`), which with
`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf` gives the pointwise identity `H' = f/S` on
the interior of an interval of positive survival where `f` is continuous; the hazard of such a law
is integrable on every compact interval of positive survival
(`TauCeti.Probability.intervalIntegrable_div_one_sub_cdf_of_eq_withDensity`). For a probability law
absolutely continuous with respect to Lebesgue measure and carried by `[0, ∞)`, `S(0) = 1`
(`TauCeti.Probability.one_sub_cdf_zero_eq_one_of_absolutelyContinuous`) and
`S(x) = exp(−∫_0^x h(t) dt)` whenever `S(x) > 0`, with `h` the Radon–Nikodym derivative divided by
`S` (`TauCeti.Probability.one_sub_cdf_eq_exp_neg_integral_rnDeriv`); for a law given by a density,
`∫_0^x f/S = H(x)` (`TauCeti.Probability.integral_div_one_sub_cdf_of_eq_withDensity`).

For a nonempty finite independent family with laws `μᵢ`, the minimum has survival
`∏ Sᵢ`, so cumulative hazards add at every point where all survivals are positive, atoms allowed
(`TauCeti.Probability.neg_log_one_sub_cdf_min_indep`, product form
`TauCeti.Probability.neg_log_one_sub_cdf_map_min_pi`); hazards add at every point where the
marginal cdfs are differentiable (`TauCeti.Probability.deriv_cdf_min_div_one_sub_cdf`,
`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_min_indep`,
`TauCeti.Probability.deriv_cdf_map_min_pi_div_one_sub_cdf`), almost everywhere on a compact interval
of positive survival where the marginal cdfs are absolutely continuous, with integrable hazard of
the minimum (`TauCeti.Probability.ae_deriv_cdf_min_div_one_sub_cdf`,
`TauCeti.Probability.intervalIntegrable_deriv_cdf_min_div_one_sub_cdf`), and pointwise where the
marginal densities are continuous (`TauCeti.Probability.deriv_cdf_min_div_one_sub_cdf_of_eq_withDensity`).

The family instances use the declared densities and cdfs: the exponential law of rate `r > 0` has
hazard `r` and cumulative hazard `rx` on `x ≥ 0`
(`TauCeti.Probability.exponentialPDFReal_div_one_sub_cdf`,
`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_expMeasure`,
`TauCeti.Probability.integral_exponentialPDFReal_div_one_sub_cdf`); the Weibull law of shape `k > 0`
and scale `s > 0` has hazard `(k/s)(x/s)^(k−1)` and cumulative hazard `(x/s)^k`
(`TauCeti.Probability.weibullPDFReal_div_one_sub_cdf`,
`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_weibullMeasure`,
`TauCeti.Probability.integral_weibullPDFReal_div_one_sub_cdf`); the Gamma law of shape `a > 0` and
rate `r > 0` has cumulative hazard `−log(1 − G_a(rx))`
(`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_gammaMeasure`,
`TauCeti.Probability.intervalIntegrable_gammaPDFReal_div_one_sub_cdf`,
`TauCeti.Probability.integral_gammaPDFReal_div_one_sub_cdf`); and the log-normal law with `v > 0`
has cumulative hazard `−log((1 − erf((log x − m)/√(2v)))/2)` on `x > 0`
(`TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_logNormalMeasure`,
`TauCeti.Probability.intervalIntegrable_logNormalPDFReal_div_one_sub_cdf`,
`TauCeti.Probability.integral_logNormalPDFReal_div_one_sub_cdf`).

*Needs:* Mathlib `AbsolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.intervalIntegrable_deriv`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `ProbabilityTheory.cdf`,
`ProbabilityTheory.expMeasure`, `ProbabilityTheory.iIndepFun`; Tau Ceti
`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`, `Probability/Hazard.lean`,
`Probability/Cdf/Density.lean`, `Probability/Distributions/Minimum.lean`,
`Probability/Distributions/{Exponential,Weibull,Gamma,LogNormal}/Hazard.lean`; §0.1, §0.2; §1.5,
§1.6, §2.1, §2.3, §3.2, §3.4; §4.6.

**Checks.**

- The Weibull law with `k = 2`, `s = 1` has `S(x) = e^(−x²)`, hazard `2x` and cumulative hazard `x²`;
  at `k = 1` the hazard is the constant `1/s` of the exponential law of rate `1/s`.
- For `δ₁`, survival drops from `1` to `0` at `1`; its cdf is not absolutely continuous, its
  derivative is `0` almost everywhere, and `S(0) exp(−∫_0^1 0) = 1` differs from `S(1) = 0`, so the
  absolute-continuity hypothesis cannot be dropped.
- The minimum of independent exponential laws of rates `1` and `2` has hazard `1 + 2 = 3`, the
  exponential law of rate `3`.

### 7.10 Quantile construction of order statistics

For `1 ≤ k ≤ n` and a probability law `μ` on `ℝ`, the `k`-th order statistic of `n` independent
variables with law `μ` (the order statistic `TauCeti.orderStatistic` of §4.6, indexed from `0`, so
that the `k`-th is at index `k − 1`) has the law of `Q_μ` applied to the `k`-th order statistic of
`n` independent uniforms, which is the Beta law `(k, n + 1 − k)`: the law is
`(betaMeasure k (n + 1 − k)).map Q_μ` (`TauCeti.Probability.map_orderStatistic_pi_eq_map_betaMeasure_quantile`,
random-variable form `TauCeti.Probability.hasLaw_orderStatistic_iid_map_betaMeasure_quantile`). The
route sorts the quantile-transformed uniform sample: `Q_μ` is nondecreasing on `(0, 1)`
(`MeasureTheory.Measure.monotoneOn_quantile`), so it commutes with order statistics of points of
`(0, 1)` (`TauCeti.orderStatistic_comp_of_monotoneOn`); with the uniform order-statistic law
(`TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`) and inverse transform sampling (§7.2)
this needs only monotonicity, so atoms of `μ` and jumps of `Q_μ` are allowed. The scalar quantile
formula of the order statistic is stated in §13.3.

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `MeasureTheory.Measure.pi`,
`ProbabilityTheory.iIndepFun`; Tau Ceti `Data/Fin/Tuple/OrderStatistic.lean`,
`Probability/Distributions/OrderStatistic/Basic.lean`, `TauCeti.Probability.uniformMeasure`; §7.2;
§0.3, §1.7, §4.6.

**Checks.**

- For the Bernoulli law with `p = 1/2` and `n = 2`, the minimum (`k = 1`) is `Q_μ(V)` with `V` Beta
  `(1, 2)`, so `P(min = 1) = P(V > 1/2) = (1/2)² = 1/4`, and the maximum (`k = 2`) has
  `P(max = 1) = 1 − 1/4 = 3/4`; both agree with the direct computation, and the atoms of the source
  cause no exception at the extremes.
- For the exponential law of rate one and `n = 2`, the maximum is `Q_μ(V)` with `V` Beta `(2, 1)`;
  `P(max ≤ log 2) = P(V ≤ 1/2) = 1/4 = (1 − e^(−log 2))²`.

### 7.11 Weak continuity

Weak continuity is continuity into `MeasureTheory.ProbabilityMeasure` with its topology of weak
convergence, on each stated valid parameter domain (Billingsley); the families of Layers 9–11 are
treated in §13.6. The following are jointly weakly continuous:

| Family | Domain and boundaries | Theorem |
| --- | --- | --- |
| Scalar Gaussian `(m, v)` | `m ∈ ℝ`, `v ≥ 0`, including `v = 0` | `TauCeti.Probability.continuous_gaussianReal`, `Continuous.gaussianReal` |
| Multivariate Gaussian `(m, S)` | `S` positive semidefinite, including singular and zero `S` and empty index types | `TauCeti.Probability.continuous_multivariateGaussian`, `Continuous.multivariateGaussian` |
| Scalar log-normal `(m, v)` | `m ∈ ℝ`, `v ≥ 0`, with `δ_(e^m)` at `v = 0` | `TauCeti.Probability.continuous_logNormalMeasure`, `Continuous.logNormalMeasure`, `TauCeti.Probability.tendsto_logNormalMeasure_nhds_zero_dirac` |
| Cauchy `(m, γ)` | `m ∈ ℝ`, `γ ≥ 0`, with `δ_m` at `γ = 0` | `TauCeti.Probability.continuous_cauchyMeasure`, `TauCeti.Probability.tendsto_cauchyMeasure_nhds_zero_dirac` |
| Gamma `(a, r)` | `a > 0`, `r > 0` | `TauCeti.Probability.continuous_gammaMeasure` |
| Beta `(a, b)` | `a > 0`, `b > 0` | `TauCeti.Probability.continuous_betaMeasure` |
| Dirichlet `a` | nonempty finite index type, `aᵢ > 0` | `TauCeti.Probability.continuous_dirichletMeasure`, `Continuous.dirichletMeasure` |
| Multinomial `(n, p)` | fixed finite index type, `n ∈ ℕ`, full simplex of weights | `TauCeti.Probability.continuous_multinomialMeasure`, `Continuous.multinomialMeasure` |
| Chi-squared `k` | `k ≥ 0`, with `δ₀` at `k = 0` | `TauCeti.Probability.continuous_chiSquaredMeasure` |
| Negative binomial `(r, p)` | `r ≥ 0`, `0 < p ≤ 1`, with `δ₀` at `r = 0` | `TauCeti.Probability.continuous_negativeBinomialMeasure`, `Continuous.negativeBinomialMeasure` |

Weak continuity is preserved by the generic operations:

- a fixed continuous pushforward, `ν ↦ ν.map f` for continuous `f` into a Borel space
  (`MeasureTheory.ProbabilityMeasure.continuous_map`), or for continuous measurable `f` when the
  target σ-algebra is finer than the Borel one (`MeasureTheory.ProbabilityMeasure.continuous_map_of_measurable`);
- continuous affine transport, jointly in the law and the parameters: for a jointly continuous
  `f : T × X → Y`, `(t, ν) ↦ ν.map (f t)` is continuous
  (`MeasureTheory.ProbabilityMeasure.continuous_map_of_continuous_uncurry`), and the affine case is
  `T = ℝ × ℝ`, `f (a, b) x = a + bx`;
- finite products: `(μ, ν) ↦ μ.prod ν` and `(μᵢ) ↦ ∏ μᵢ` are continuous on second-countable
  pseudometrizable spaces (`MeasureTheory.ProbabilityMeasure.continuous_prod`,
  `MeasureTheory.ProbabilityMeasure.continuous_pi`);
- finite mixtures with convergent simplex weights: prove that for a finite index type `ι`, a
  topological space `T`, continuous weights `p : T → Convexity.StdSimplex ℝ≥0 ι` and measures
  `Kᵢ(t)` on a topological space whose open sets are measurable, which are probability measures
  whenever `pᵢ(t) > 0` and depend weakly continuously on `t`
  on the open set `{pᵢ > 0}`, the mixture `t ↦ ∑ᵢ pᵢ(t) Kᵢ(t)` is weakly continuous on `T`; nothing
  is assumed of `Kᵢ(t)` where `pᵢ(t) = 0`. In particular finite mixtures whose simplex weights and
  components converge have convergent laws.

The Gaussian results follow from the characteristic functions and Lévy's continuity theorem
(Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`), and Cauchy continuity from
affine transport of the standard Cauchy law. The generalized extreme value limit at shape zero, the
Student-to-Gaussian limit and the continuity of the stable laws are stated in their own sections
(§10.2, §11.1 and §15.4); the Dirichlet and Beta concentration limits, which approach excluded parameter
boundaries through valid laws, belong to §5.6. No total-variation continuity is required at
singular boundaries, and no weak continuity across invalid zero-measure branches or across the
geometric totalization at `p = 0`. The Gaussian continuity statements concern the laws themselves;
conditional Gaussian kernels carry only the parameter measurability of §5.4.

Prove the rank-change statement of §5.4: for `Z` standard Gaussian, the joint law of `(Z, tZ)`, the
Gaussian law with mean `0` and covariance `[[1, t], [t, t²]]`, depends weakly continuously on `t`,
while the conditional kernel of §5.4 for the first coordinate given the second, evaluated at the
observed value `0`, is discontinuous at `t = 0`: it is `δ₀` for `t ≠ 0` and `N(0, 1)` at `t = 0`.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.ProbabilityMeasure.continuous_map`,
`MeasureTheory.ProbabilityMeasure.continuous_prod`, `MeasureTheory.ProbabilityMeasure.continuous_pi`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`, `MeasureTheory.Measure.toProbabilityMeasure`,
`ProbabilityTheory.multivariateGaussian`, `Convexity.StdSimplex`; Tau Ceti
`MeasureTheory/Measure/ProbabilityMeasure/Map.lean`, `TauCeti.Probability.finiteMixtureMeasure`,
`Probability/Distributions/*/Continuity.lean`; §7.1, §7.4; §1.6, §1.7, §1.8, §1.10, §3.2, §3.5,
§3.9, §5.3, §5.4, §5.5, §5.6.

**Checks.**

- As `v → 0`, `N(m, v)` converges weakly to `δ_m` (characteristic functions
  `e^(itm − vt²/2) → e^(itm)`), but for every `v > 0` the laws `N(m, v)` and `δ_m` are mutually
  singular (`N(m, v){m} = 0`, `δ_m{m} = 1`), at maximal total-variation distance: the boundary
  continuity is weak, not in total variation.
- For `Z` standard Gaussian, the joint law of `(Z, tZ)` is Gaussian with covariance
  `[[1, t], [t, t²]]`, positive semidefinite and continuous in `t`, so it varies weakly continuously in
  `t`; the conditional kernel of §5.4 for the first coordinate at observed value zero of the second is
  `δ₀` for `t ≠ 0` (conditional variance `1 − t²/t² = 0`) and `N(0, 1)` at `t = 0` (zero observed
  variance, pseudoinverse `0`), so it is discontinuous at `t = 0`.
- Geometric laws have no weak limit as `p → 0`: `P(X ≤ k) = 1 − (1 − p)^(k+1) → 0` for every `k`, so the
  mass escapes to infinity whatever value the totalization takes at `p = 0`.
- As `k → 0`, the chi-squared laws converge weakly to `δ₀`, the law at `k = 0`, since
  `(1 − 2it)^(−k/2) → 1`.

### 7.12 Weighted laws, size biasing, and power biasing

For a measure `μ` on `α` and a measurable weight `w : α → ℝ≥0`, the normalized weighted law is
`MeasureTheory.Measure.weighted`,

    μ.weighted w = Z⁻¹ · μ.withDensity w,        Z = ∫⁻ w dμ ∈ [0, ∞]

(`MeasureTheory.Measure.weighted_def`). The totalized expression is the zero measure for `Z = 0`
and for `Z = ∞` (`MeasureTheory.Measure.weighted_eq_zero_of_lintegral_eq_zero`,
`MeasureTheory.Measure.weighted_eq_zero_of_lintegral_eq_top`), and a probability measure when
`0 < Z < ∞` (`MeasureTheory.Measure.isProbabilityMeasure_weighted`). Its density with respect to
`μ` is `Z⁻¹ w` (`MeasureTheory.Measure.weighted_eq_withDensity`,
`MeasureTheory.Measure.rnDeriv_weighted` for σ-finite `μ`); it is unchanged by an a.e. equal weight
and by a positive constant rescaling of the weight (`MeasureTheory.Measure.weighted_congr`,
`MeasureTheory.Measure.weighted_const_smul`); `E_w[g] = E[wg]/E[w]` for every `g`
(`MeasureTheory.Measure.integral_weighted`), with `g` integrable against the weighted law iff
`wg` is integrable against `μ` when `0 < Z < ∞` (`MeasureTheory.Measure.integrable_weighted_iff`),
and the nonnegative form `MeasureTheory.Measure.lintegral_weighted`; for jointly measurable weight
families it is measurable in the parameter (`ProbabilityTheory.Kernel.measurable_weighted`,
`MeasureTheory.Measure.measurable_weighted_const`). Weightings compose by multiplying the weights,
`(μ.weighted w).weighted v = μ.weighted (wv)`, whenever the first weight has positive finite
integral (`MeasureTheory.Measure.weighted_weighted`), and the second weight integrates under the
first law to `∫⁻ wv dμ / ∫⁻ w dμ` (`MeasureTheory.Measure.lintegral_weighted`), which is positive
and finite exactly when `wv` has positive finite integral. These are measure operations; no
separate weighted-probability structure is introduced.

For a law on `ℝ` and `q ∈ ℝ`, the power-biased law is `MeasureTheory.Measure.powerBias μ q`, the
weighted law with weight `x^q` (`Real.rpow`), written `μ⟨q⟩`; it equals
`(∫⁻ ofReal(x^q) dμ)⁻¹ · μ.withDensity (ofReal(x^q))`
(`MeasureTheory.Measure.powerBias_def`, `MeasureTheory.Measure.powerBias_eq_smul_withDensity`).
For a probability law carried by `(0, ∞)`:

- `μ⟨q⟩ = μ.tilted (x ↦ q log x)` (`MeasureTheory.Measure.powerBias_eq_tilted`);
- `μ⟨0⟩ = μ` (`MeasureTheory.Measure.powerBias_zero`);
- when `x^q` is integrable, the normalizing integral is `∫ x^q dμ`, finite
  (`MeasureTheory.Measure.lintegral_powerBiasWeight_eq_of_integrable`) and positive because `x^q > 0`
  almost surely, so `μ⟨q⟩` is a probability law (`MeasureTheory.Measure.isProbabilityMeasure_powerBias`),
  `(μ⟨q⟩)⟨r⟩ = μ⟨q + r⟩` for every `r` (`MeasureTheory.Measure.powerBias_powerBias`), `x^r` is
  integrable under `μ⟨q⟩` exactly when `x^(q+r)` is integrable under `μ`
  (`MeasureTheory.Measure.integrable_rpow_powerBias_iff`), and
  `E_{μ⟨q⟩}[X^r] = E_μ[X^(q+r)] / E_μ[X^q]` (`MeasureTheory.Measure.integral_rpow_powerBias`), the
  denominator being positive by the almost-sure positivity;
- when `x^q` is not integrable, `μ⟨q⟩` is the zero measure
  (`MeasureTheory.Measure.powerBias_eq_zero_of_not_integrable`).

The family identities, on valid input parameters, with the exact normalization domains
(Johnson, Kotz and Balakrishnan, vols. 1 and 2):

| Family | Power-biased law | Domain | Theorem |
| --- | --- | --- | --- |
| Gamma `(a, r)` | Gamma `(a + q, r)` | `q > −a` | `TauCeti.Probability.powerBias_gammaMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_gammaMeasure_iff` |
| Beta `(a, b)` | Beta `(a + q, b)` | `q > −a` | `TauCeti.Probability.powerBias_betaMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_betaMeasure_iff` |
| Log-normal `(m, v)` | Log-normal `(m + qv, v)` | every real `q`, including `v = 0` | `TauCeti.Probability.powerBias_logNormalMeasure` |
| Pareto threshold `t`, shape `r` | Pareto `(t, r − q)` | `q < r` | `TauCeti.Probability.powerBias_paretoMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_paretoMeasure_iff` |

Outside the domain the power-biased Gamma, Beta and Pareto laws are the zero measure
(`TauCeti.Probability.powerBias_gammaMeasure_of_le`, `TauCeti.Probability.powerBias_betaMeasure_of_le`,
`TauCeti.Probability.powerBias_paretoMeasure_of_le`).

Size biasing of a law on `[0, ∞)` or on `ℕ` is weighting by `x`, a probability law exactly when the
first moment is positive and finite. The size-biased native Poisson law of rate `λ > 0` is
`(poissonMeasure λ).map Nat.succ`, and at rate zero the normalized weighted measure is zero
(`TauCeti.Probability.weighted_poissonMeasure`); in random-variable form, `X + 1` has the size-biased
law when `X` is Poisson of positive rate (`ProbabilityTheory.HasLaw.succ_poissonMeasure`). Weights
that vanish are handled through `withDensity`: the totalized real logarithm, `log 0 = 0`, does not
turn a zero weight into a zero exponential weight, which is why the identification with a tilt
assumes a law carried by `(0, ∞)`.

*Needs:* Mathlib `MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.tilted`, `Real.rpow`,
`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.paretoMeasure`,
`ProbabilityTheory.poissonMeasure`; Tau Ceti `MeasureTheory/Measure/Weighted.lean`,
`MeasureTheory/Measure/PowerBias.lean`, `Probability/Distributions/{Gamma,Beta,LogNormal,Pareto}/PowerBias.lean`,
`Probability/Distributions/Poisson/SizeBias.lean`; §7.8; §1.4, §1.6, §1.7, §1.9, §1.11, §3.2.

**Checks.**

- The size-biased Poisson law of rate `λ` gives `k ≥ 1` the mass
  `k · e^(−λ)λᵏ/k! / λ = e^(−λ)λ^(k−1)/(k − 1)!`, the law of `1 + X`.
- For the Gamma law `(a, 1)` and `q = −a`, `∫ x^(−a) x^(a−1) e^(−x) dx` diverges at `0`, so the power-biased
  law is zero: the domain `q > −a` is sharp.
- For the Gamma law `(a, 1)` and `q = 1`, the mean of the power-biased law `(a + 1, 1)` is
  `a + 1 = E[X²]/E[X] = a(a + 1)/a`.
- For `μ = (δ₀ + δ₁)/2`, weighting by `x` gives `δ₁`, while tilting by `x ↦ log x` with the
  convention `log 0 = 0` gives weight `e^0 = 1` at `0` and returns `μ`: the tilt identification needs
  the law to be carried by `(0, ∞)`.

### 7.13 Stochastic order and parameter comparisons

For probability measures on `ℝ`, `μ ⪯ ν` is mathematical shorthand for `F_μ(x) ≥ F_ν(x)` for every
real `x`; it does not replace Mathlib's pointwise order on measures, and statements are made through
cdf and quantile inequalities. The comparison is equivalent to `Q_μ(u) ≤ Q_ν(u)` for every
`0 < u < 1` (`MeasureTheory.Measure.cdf_le_iff_quantile_le`). The common-uniform construction
`(Q_μ(U), Q_ν(U))` is the quantile coupling `MeasureTheory.Measure.quantileCoupling μ ν`, the image of
Lebesgue measure on `(0, 1)` under `u ↦ (Q_μ(u), Q_ν(u))`
(`MeasureTheory.Measure.quantileCoupling_def`); it has marginals `μ` and `ν`
(`MeasureTheory.Measure.isCoupling_quantileCoupling`, for the coupling predicate `TauCeti.IsCoupling`)
and, when `μ ⪯ ν`, is concentrated on `{x ≤ y}` (`MeasureTheory.Measure.ae_fst_le_snd_quantileCoupling`).
Conversely, any coupling concentrated on ordered pairs forces `μ ⪯ ν`
(`TauCeti.IsCoupling.cdf_le_of_ae_fst_le_snd`, random-variable form
`ProbabilityTheory.HasLaw.cdf_le_of_ae_le`), so `μ ⪯ ν` iff some coupling is concentrated on ordered
pairs (`MeasureTheory.Measure.exists_isCoupling_ae_fst_le_snd_iff_cdf_le`). The order is reflexive,
transitive and antisymmetric (`MeasureTheory.Measure.cdf_le_refl`, `MeasureTheory.Measure.cdf_le_trans`,
`MeasureTheory.Measure.eq_of_cdf_le_cdf_le`), preserved by nondecreasing real maps
(`MeasureTheory.Measure.cdf_map_le_cdf_map_of_monotone`) and by convolution in both arguments, through
the product of ordered couplings (`MeasureTheory.Measure.cdf_conv_le_cdf_conv`). No second coupling
structure and no Wasserstein statement is involved.

The family comparisons and their common-uniform ordered couplings, with unmentioned parameters fixed
and real casts for the native discrete laws:

| Family | Increasing parameter | Decreasing parameter | Theorems |
| --- | --- | --- | --- |
| Poisson | rate `r ≥ 0`, including `r = 0` | — | `TauCeti.Probability.cdf_map_cast_poissonMeasure_le`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_map_cast_poissonMeasure` |
| Binomial | trial count `n ∈ ℕ`; success probability `p ∈ [0, 1]` | — | `TauCeti.Probability.cdf_map_cast_binomial_le_of_le_trials`, `TauCeti.Probability.cdf_map_cast_binomial_le_of_le_prob`, `TauCeti.Probability.cdf_map_cast_binomial_le`, `TauCeti.Probability.quantile_map_cast_binomial_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_map_cast_binomial` |
| Gamma | shape `a > 0` | rate `r > 0` | `TauCeti.Probability.cdf_gammaMeasure_le_of_shape_le`, `TauCeti.Probability.cdf_gammaMeasure_le_of_rate_le`, `TauCeti.Probability.cdf_gammaMeasure_le`, `TauCeti.Probability.quantile_gammaMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_gammaMeasure` |
| Beta | first shape `a > 0` | second shape `b > 0` | `TauCeti.Probability.cdf_betaMeasure_le_of_le_left`, `TauCeti.Probability.cdf_betaMeasure_le_of_le_right`, `TauCeti.Probability.cdf_betaMeasure_le`, `TauCeti.Probability.quantile_betaMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_betaMeasure` |

The classical constructions behind these comparisons are an added independent Poisson or Gamma
increment for the Poisson rate and the Gamma shape, scaling by a constant at least one for the Gamma rate, shared
uniform thresholds for the binomial success probability and extra independent trials for the trial
count, and Gamma ratios for the Beta shapes. Equal parameters are handled directly, the Poisson rate
zero and the binomial boundaries `n = 0`, `p ∈ {0, 1}` (Dirac laws) are included, and no Gamma or Beta
law of shape zero is used (Johnson, Kemp and Kotz, chs. 3–6).

*Needs:* Mathlib `ProbabilityTheory.cdf`, `MeasureTheory.Measure.conv`, `ProbabilityTheory.HasLaw`;
Tau Ceti `Probability/StochasticOrder.lean`, `MeasureTheory/OptimalTransport/Coupling.lean`,
`MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`,
`Probability/Distributions/{Poisson,Binomial,Gamma,Beta}/StochasticOrder.lean`; §7.2; §1.2, §1.4,
§1.6, §1.7; OptimalTransport §3.7.

**Checks.**

- `N(0, 1)` and `N(0, 4)` are not comparable: `Φ(−1) ≈ 0.1587 < Φ(−1/2) ≈ 0.3085` at `x = −1`
  but `Φ(1) ≈ 0.8413 > Φ(1/2) ≈ 0.6915` at `x = 1`; the order is partial.
- The Poisson laws of rates `1` and `2` have `F₂(0) = e^(−2) < e^(−1) = F₁(0)`, as the increasing-rate
  comparison requires.
- On `[0, 1]`, the Beta cdfs are `x²` for `(2, 1)`, `x` for `(1, 1)` and `2x − x²` for `(1, 2)`, and
  `x² ≤ x ≤ 2x − x²`, so `(1, 2) ⪯ (1, 1) ⪯ (2, 1)`: raising the first shape increases the law and raising
  the second decreases it.

### Examples

- For `X` exponential of rate one, the median of `3 − 2X` is `3 − 2 Q⁺_X(1/2) = 3 − 2 log 2 ≈ 1.6137`
  (§7.2), and its domain is `{t : −2t < 1} = (−1/2, ∞)` (§7.1).
- The compound Poisson law of rate `r` with Bernoulli jumps of parameter `p` on `ℕ` is the Poisson law
  of rate `rp`: its characteristic function is `exp(r(1 − p + pe^(it) − 1)) = exp(rp(e^(it) − 1))` (§7.5).
- The Poisson law mixed over the Gamma law of shape `2` and rate `1` is the negative binomial law
  with `r = 2`, `p = 1/2`, with mean `2` and variance `4` (§7.6).
- Power-biasing the Gamma law `(2, 1)` by `q = −1` gives the Gamma law `(1, 1)`, the exponential law
  of rate one, whose mean is `E[X⁰]/E[X^(−1)] = 1/1 = 1` under the Gamma law `(2, 1)` (§7.12).
- The median of three independent exponential variables of rate one has law `Q(V)`, `V` Beta `(2, 2)`;
  since `V` has median `1/2`, the sample median has median `Q(1/2) = log 2` (§7.10).

### Dependencies

Layer 7 uses Layer 0 (density interfaces §0.1, §0.2, the interval uniform law §0.3, parameter
measurability §0.4, the Dirac package §0.5), Layer 1 (cast cdfs §1.1 and the families of §1.2–§1.10,
real-power moments §1.11, probability generating functions §1.12), Layer 2 (the regularized
incomplete Gamma and Beta functions §2.1, §2.2, the error function §2.3 and the closed-form cdfs
§2.4, for the zero-modified and hazard formulas), Layer 3 (log-normal §3.2, Weibull §3.4, chi-squared
§3.5, negative binomial §3.9), Layer 4 (Gamma-mixed Poisson §4.5, order statistics §4.6) and Layer 5
(multivariate Gaussian §5.2–§5.4, multinomial §5.5, Dirichlet §5.6) for the family identities and
continuity statements, whose generic results are independent of those families. From Mathlib it uses
the Giry monad and its companions (`MeasureTheory.Measure.map`, `MeasureTheory.Measure.bind`,
`MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.tilted`), convolution, the
cdf and conditional probability, moment-generating and characteristic functions,
`ProbabilityTheory.HasLaw`, absolutely continuous functions on intervals, and the weak topology on
`MeasureTheory.ProbabilityMeasure`; from Tau Ceti the quantile and cdf library
(`Probability/Quantile*`, `Probability/Cdf*`), the construction files under
`Probability/Distributions/` (`Affine`, `Truncation`, `Censoring`, `Folding`, `AtomMixture`, `Mixture`,
`CompoundPoisson`, `Tilted`, `Minimum`, `Zero`, `OrderStatistic`), `Probability/Hazard.lean`,
`Probability/StochasticOrder.lean`, `MeasureTheory/Measure/{AtomMixture,Weighted,PowerBias,Tilted}.lean`,
the per-family continuity, hazard, power-bias and stochastic-order files, and the quantile coupling of
`MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`, which OptimalTransport §3.7 builds on.

## Layer 8: special functions for the expanded families

This layer supplies the real special functions that the families of Layers 9–13 need: the modified
Bessel function `I_ν` of real order (noncentral chi-squared, von Mises and von Mises–Fisher laws),
Owen's T function (skew-normal law), the real values of the Riemann zeta function and the Gaussian
lattice sum (Zipf, discrete Gaussian and wrapped normal laws), and the inverses of the regularized
incomplete Gamma and Beta functions and of the error function (quantiles of the Gamma, Beta,
Student, Fisher and Gaussian laws). Orders, arguments and parameters are real throughout. The
sphere-integral representation of `I_ν` used to normalize the von Mises–Fisher law is stated in
§12.2, not here.

### 8.1 Modified Bessel I

The modified Bessel function of the first kind of real order `ν` at a real argument `x` is
`Real.besselI ν x`, the real part of `(x/2)^ν · ₀F₁(; ν + 1; (x/2)²)` computed with the principal
complex power and Mathlib's regularized hypergeometric function `Complex.regularizedHGFun`
(`Real.besselI_def`); it is the representation of Mathlib's `Complex.besselJ` with the argument of
`₀F₁` changed from `−(x/2)²` to `(x/2)²`. At `x = 0` it takes the value `1` for `ν = 0` and `0`
otherwise (`Real.besselI_zero`). Write `I_ν(x)` for it (DLMF §10.25, §10.29, §10.32):

- for `x > 0` and every real `ν`, `I_ν(x) = ∑_(j≥0) (x/2)^(2j+ν) / (j! Γ(j+ν+1))`, the series
  converging (`Real.hasSum_besselI`), with the real power `Real.rpow` in place of the complex one
  (`Real.besselI_eq_rpow_mul`); for a natural order `n` the series
  `∑_(j≥0) (x/2)^(2j+n) / (j! (j+n)!)` converges to `I_n(x)` at every real `x`
  (`Real.hasSum_besselI_natCast`);
- `I_ν(x) > 0` for `ν > −1` and `x > 0` (`Real.besselI_pos`), and `I_0(x) ≥ 1` for every real `x`
  (`Real.one_le_besselI_zero_left`, `Real.besselI_zero_left_pos`);
- `(ν, x) ↦ I_ν(x)` is continuous at every point with `x ≠ 0` or `ν > 0`
  (`Real.continuousAt_besselI`), in particular on `ν > −1, x > 0`, and measurable on `ℝ²`
  (`Real.measurable_besselI`); for a natural order `n`, `x ↦ I_n(x)` is continuous on `ℝ`
  (`Real.continuous_besselI_natCast`), so the natural orders extend continuously to `I_0(0) = 1` and
  `I_n(0) = 0` for `n > 0`;
- for every real `ν`, `(x/2)^(−ν) I_ν(x) → 1/Γ(ν+1)` as `x → 0⁺`
  (`Real.tendsto_rpow_neg_mul_besselI_nhdsGT_zero`); for `ν ∈ (−1, 0)` this is the right asymptotic
  that replaces a value at `0`, and `I_ν(x) → +∞`;
- for `x ≠ 0`, `I_ν'(x) = I_(ν+1)(x) + (ν/x) I_ν(x)` (`Real.hasDerivAt_besselI`),
  `d/dx [(x/2)^(−ν) I_ν(x)] = (x/2)^(−ν) I_(ν+1)(x)` (`Real.hasDerivAt_rpow_neg_mul_besselI`), and the
  adjacent-order recurrence `I_(ν−1)(x) − I_(ν+1)(x) = (2ν/x) I_ν(x)` (`Real.besselI_sub_besselI`);
- for every natural `n` and every real `κ`, `∫_(−π)^π e^(κ cos θ) cos(nθ) dθ = 2π I_n(κ)`
  (`Real.integral_exp_mul_cos_mul_cos`), and for every integer `n`,
  `∫_(−π)^π e^(κ cos θ) e^(inθ) dθ = 2π I_|n|(κ)` (`Real.integral_exp_mul_cos_mul_cexp`): the Fourier
  coefficients of `θ ↦ e^(κ cos θ)` are the values `I_|n|(κ)`.

The densities of Layers 10 and 12 that contain `I_(k/2−1)` evaluate it only at positive arguments;
their values at the null endpoint are fixed separately in those sections. This roadmap develops
only real orders and real arguments: the complex-order, complex-argument theory and the function
`K_ν`, with the inverse-gamma and Student transforms that would need it, are outside its scope.

*Needs:* Mathlib `Complex.regularizedHGFun`, `Complex.besselJ` (the shape of the definition),
`Real.Gamma`; Tau Ceti `Real.besselI` and the facts above.

**Checks.**

- At `κ = 0` the circle integral is `∫_(−π)^π cos(nθ) dθ`, which is `2π` for `n = 0` and `0` for
  `n ≥ 1`, matching `I_0(0) = 1` and `I_n(0) = 0`; a normalization by `π` instead of `2π` would give
  `I_0(0) = 2`. At `κ = 1`, `(2π)⁻¹ ∫ e^(cos θ) dθ ≈ 1.26607 = I_0(1)` and
  `(2π)⁻¹ ∫ e^(cos θ) cos θ dθ ≈ 0.56516 = I_1(1)`.
- The half-integer orders are elementary: `I_(1/2)(x) = √(2/(πx)) sinh x` and
  `I_(−1/2)(x) = √(2/(πx)) cosh x` (both `≈ 1.18851` and `≈ 1.37923` at `x = 1.3`), and the
  recurrence at `ν = 1/2` reads `I_(−1/2) − I_(3/2) = (1/x) I_(1/2)`. The argument `−(x/2)²` of the
  Bessel function `J` would give `sin` and `cos` in place of `sinh` and `cosh`.
- At `ν = 0` the derivative formula is `I_0' = I_1`, positive on `(0, ∞)`, so `I_0` increases there;
  the sign of the corresponding formula for `J` (`J_0' = −J_1`) would make it decrease.

### 8.2 Owen's T

Owen's T function is `Real.owensT h a`, the oriented integral
`T(h, a) = (2π)⁻¹ ∫_0^a e^(−h²(1+t²)/2) / (1 + t²) dt` (`Real.owensT_def`). Write `ϕ` and `Φ` for the
standard Gaussian density `ProbabilityTheory.gaussianPDFReal 0 1` and cdf
`ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1)` (§1.10). For all real `h`, `a`, `x`, `α`
(Azzalini and Capitanio 2014):

- `(h, a) ↦ T(h, a)` is continuous and measurable on `ℝ²` (`Real.continuous_owensT`,
  `Real.measurable_owensT`), and so is its composition with continuous or measurable maps
  (`Continuous.owensT`, `Measurable.owensT`);
- `T(−h, a) = T(h, a)` and `T(h, −a) = −T(h, a)` (`Real.owensT_neg_left`, `Real.owensT_neg_right`),
  `T(h, 0) = 0` (`Real.owensT_zero_right`) and `T(0, a) = arctan(a)/(2π)` (`Real.owensT_zero_left`);
- `∂_a T(h, a) = e^(−h²(1+a²)/2) / (2π(1 + a²))` (`Real.hasDerivAt_owensT_right`) and
  `∂_h T(h, a) = −ϕ(h)(Φ(ah) − 1/2)` (`Real.hasDerivAt_owensT_left`), the latter through
  differentiation under the integral (`Real.hasDerivAt_intervalIntegral_owensT`);
- `|T(h, a)| ≤ |a| e^(−h²/2) / (2π)`, hence `T(h, a) → 0` as `h → ±∞` (`Real.abs_owensT_le`,
  `Real.tendsto_owensT_atTop`, `Real.tendsto_owensT_atBot`);
- the Gaussian integral identity `∫_(−∞)^x 2ϕ(t)Φ(αt) dt = Φ(x) − 2T(x, α)`
  (`TauCeti.Probability.integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`), where
  `t ↦ 2ϕ(t)Φ(αt)` is integrable with total integral `1`
  (`TauCeti.Probability.integrable_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`,
  `TauCeti.Probability.integral_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`); the function
  `x ↦ Φ(x) − 2T(x, α)` has derivative `2ϕ(x)Φ(αx)`
  (`TauCeti.Probability.hasDerivAt_cdf_gaussianReal_sub_two_mul_owensT`) and limits `0` at `−∞` and
  `1` at `+∞` (`TauCeti.Probability.tendsto_cdf_gaussianReal_sub_two_mul_owensT_atBot`,
  `TauCeti.Probability.tendsto_cdf_gaussianReal_sub_two_mul_owensT_atTop`). It is therefore the cdf of
  the skew-normal law with shape `α` that §10.9 defines.

*Needs:* Mathlib `ProbabilityTheory.gaussianPDFReal`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.cdf`, `Real.arctan`; §1.10; Tau Ceti `Real.owensT` and the facts above.

**Checks.**

- `T(0, 1) = arctan(1)/(2π) = 1/8`, and `T(h, 1) = Φ(h)(1 − Φ(h))/2` (both sides `≈ 0.11805` at
  `h = 0.3` and `≈ 0.06674` at `h = 1`). The skew-normal cdf with `α = 1` at `0` is
  `1/2 − 2 · 1/8 = 1/4`, which is `∫_(−∞)^0 2ϕΦ = Φ(0)² = 1/4`; the sign variant `Φ + 2T` would give
  `3/4`.
- With `α = −1` the cdf at `0` is `1/2 + 1/4 = 3/4`, the mirror image of the `α = 1` value, as
  `X ↦ −X` maps shape `α` to `−α`; an unoriented integral (over `[min(0, a), max(0, a)]`) would make
  `T` even in `a` and give `1/4` again.

### 8.3 Zeta and Gaussian lattice sums

**Real zeta values.** For real `s > 1`, `∑_(n≥0) (n+1)^(−s)` converges to the real part of Mathlib's
`riemannZeta s` (`TauCeti.hasSum_nat_add_one_rpow_neg_riemannZeta_re`), and so does
`∑_(n≥0) n^(−s)`, whose term at `n = 0` is `0` (`TauCeti.hasSum_nat_rpow_neg_riemannZeta_re`). This
real value is positive (`riemannZeta_re_pos_of_one_lt`) and is the whole value, as the imaginary part
vanishes (`riemannZeta_im_eq_zero_of_one_lt`); it is finite by construction, and `s ↦ Re ζ(s)` is
measurable because `riemannZeta` is (`TauCeti.measurable_riemannZeta`). The shifted-exponent test for
the Zipf moments of §9.6 is the `p`-series test: `∑_n n^p` converges iff `p < −1`
(`Real.summable_nat_rpow`), so `∑_k k^m k^(−s)` converges iff `m < s − 1` and diverges otherwise.

**Gaussian lattice sum.** For real `c` and `s`, the Gaussian lattice sum is
`Z(c, s) = ∑_(n∈ℤ) e^(−(n−c)²/(2s²))`, `Real.gaussianLatticeSum c s`
(`Real.gaussianLatticeSum_def`); at `s = 0` every term is `1` and the totalized value is `0`
(`Real.gaussianLatticeSum_zero_right`). For `s ≠ 0`, in particular for `s > 0` (Canonne, Kamath and
Steinke 2020):

- the series converges and `Z(c, s) > 0` (`Real.hasSum_gaussianLatticeSum`,
  `Real.gaussianLatticeSum_pos`); `Z(c, −s) = Z(c, s)` (`Real.gaussianLatticeSum_neg_right`);
- integer translation and reflection: `Z(c + k, s) = Z(c, s)` for `k ∈ ℤ`, so `c ↦ Z(c, s)` has period
  `1`, `Z(−c, s) = Z(c, s)` and `Z(k − c, s) = Z(c, s)` (`Real.gaussianLatticeSum_add_intCast`,
  `Real.gaussianLatticeSum_periodic`, `Real.gaussianLatticeSum_neg_left`,
  `Real.gaussianLatticeSum_intCast_sub`);
- polynomial weights: `∑_n n^k e^(−(n−c)²/(2s²))` converges (`Real.summable_pow_mul_exp_neg_sub_sq`;
  absolutely, for any positive denominator, `Real.summable_abs_pow_mul_exp_neg_sub_sq_div`) and may be
  differentiated termwise in `c` (`Real.hasDerivAt_tsum_pow_mul_exp_neg_sub_sq`,
  `Real.hasDerivAt_gaussianLatticeSum`);
- regularity: `c ↦ Z(c, s)` is `C^n` for every `n`, analytic included, for every `s`
  (`Real.contDiff_gaussianLatticeSum`); `(c, s) ↦ Z(c, s)` is continuous at every point with `s ≠ 0`
  (`Real.continuousAt_gaussianLatticeSum`) and measurable on `ℝ²` (`Real.measurable_gaussianLatticeSum`);
- theta form: for all real `c` and `s`,
  `Z(c, s) = e^(−c²/(2s²)) · Re jacobiTheta₂(−ic/(2πs²), i/(2πs²))`
  (`Real.gaussianLatticeSum_eq_jacobiTheta₂`), with Mathlib's two-variable `jacobiTheta₂`;
- Poisson summation: for all real `c` and `s`,
  `Z(c, s) = √(2π)|s| ∑_(n∈ℤ) e^(−2π²s²n²) cos(2πnc)` (`Real.gaussianLatticeSum_eq_fourier`,
  `Real.hasSum_gaussianLatticeFourier`), also as the cosine series
  `√(2π)|s| (1 + 2∑_(n≥1) e^(−2π²s²n²) cos(2πnc))` (`Real.gaussianLatticeSum_eq_cosineSeries`,
  `Real.hasSum_gaussianLatticeCosineSeries`), and both Fourier series converge uniformly in `c ∈ ℝ`
  (`Real.hasSumUniformly_gaussianLatticeFourier`, `Real.hasSumUniformly_gaussianLatticeCosineSeries`);
- periodized Gaussian: for `v ≠ 0` and `T ≠ 0`,
  `∑_(k∈ℤ) ϕ_(m,v)(x + kT) = (2πv)^(−1/2) Z((m − x)/T, √v/T)`, the series converging
  (`TauCeti.Probability.hasSum_gaussianPDFReal_add_zsmul`,
  `TauCeti.Probability.summable_gaussianPDFReal_add_zsmul`), where `ϕ_(m,v)` is the density of
  `N(m, v)`; this is the identity the wrapped normal law of §12.4 rests on.

Two further facts are targets.

- Prove that `(c, s) ↦ Z(c, s)` is `C^∞` on `ℝ × (ℝ ∖ {0})`. Route: the theta form, the joint
  holomorphy of `jacobiTheta₂` on `ℂ × {Im τ > 0}` (Mathlib `hasFDerivAt_jacobiTheta₂`) and the
  smoothness of `s ↦ i/(2πs²)` and `(c, s) ↦ −ic/(2πs²)`; or termwise differentiation in `(c, s)`
  dominated as in `Real.summable_abs_pow_mul_exp_neg_sub_sq_div`.
- Prove that, for fixed `s ≠ 0`, the series defining `Z(c, s)` converges locally uniformly in
  `c ∈ ℝ`, and hence that for `v ≠ 0` and `T ≠ 0` the periodized density series
  `∑_(k∈ℤ) ϕ_(m,v)(x + kT)` converges locally uniformly in `x ∈ ℝ`. Neither converges uniformly on `ℝ`:
  the tail beyond `|n| > N` contains the term `1` at `c = n`. Route: on `|c| ≤ R`,
  `|n − c| ≥ |n| − R`, and the Weierstrass test with `Real.summable_abs_pow_mul_exp_neg_sub_sq_div`.

*Needs:* Mathlib `riemannZeta`, `riemannZeta_re_pos_of_one_lt`, `riemannZeta_im_eq_zero_of_one_lt`,
`Real.summable_nat_rpow`, `jacobiTheta₂`, `hasFDerivAt_jacobiTheta₂`,
`ProbabilityTheory.gaussianPDFReal`; Tau Ceti `TauCeti.hasSum_nat_add_one_rpow_neg_riemannZeta_re`,
`TauCeti.measurable_riemannZeta`, `Real.gaussianLatticeSum` and the facts above; §1.10.

**Checks.**

- With the two-variable theta function `θ(z, τ) = ∑_n e^(2πinz + πin²τ)`, `τ = i/(2πs²)` and
  `z = −cτ`, `θ(z, τ) = ∑_n e^(πiτ(n² − 2nc)) = e^(c²/(2s²)) Z(c, s)`: at `c = 0` the prefactor is `1`
  and the theta value is `∑_n e^(−n²/(2s²))`. At `(c, s) = (0.3, 0.8)` and `(1.3, 0.8)` both sides of
  the theta form give `Z ≈ 2.00530`, while `Re θ` alone is `≈ 2.15137` and `≈ 7.50902`: the factor
  `e^(−c²/(2s²))` is exactly what makes the theta expression `1`-periodic in `c`, and an expression
  without it fails the translation identity.
- Integrating over one period, `∫_0^1 Z(c, s) dc = ∫_ℝ e^(−x²/(2s²)) dx = √(2π)|s|` (`≈ 1.75464` at
  `s = 0.7`), which is the constant term of the Fourier series; likewise the periodized density
  integrates to `1` over one period `[0, |T|]`. A Fourier expansion written with `s` in place of `|s|`
  would make `Z(c, s)` negative for `s < 0`, although every term of the lattice sum is positive.
- `Z(0, 1) = √(2π)(1 + 2e^(−2π²) + …)` exceeds `√(2π)` by about `1.3412 · 10⁻⁸`, and `Z(1/2, 1)` falls
  short of it by the same amount, as the cosine series predicts.
- `Re ζ(2) = π²/6 ≈ 1.64493` and `Re ζ(3) ≈ 1.20206`. For `s = 3` the shifted test admits `m = 1`
  (`1 < 2`) and rejects `m = 2`, where `∑_k k² k^(−3) = ∑_k 1/k` diverges: a threshold `m ≤ s − 1` would
  wrongly admit it.

### 8.4 Inverse functions

Write `G_a(x)` for the regularized lower incomplete Gamma function `TauCeti.regularizedGamma a x`
(§2.1), `I_x(a, b)` for the regularized incomplete Beta function
`TauCeti.regularizedIncompleteBeta a b x` (§2.2) and `erf` for `TauCeti.Real.erf` (§2.3).

**Inverse regularized Gamma function.** For `a > 0` and `0 < u < 1`, the inverse `G_a⁻¹(u)` is
`TauCeti.inverseRegularizedGamma a u`, defined as the quantile (§7.2) at level `u` of the Gamma law
of shape `a` and rate `1` (`TauCeti.inverseRegularizedGamma_eq_quantile`), so that
`G_a⁻¹(u) = inf {x : u ≤ G_a(x)}` (`TauCeti.inverseRegularizedGamma_eq_sInf`); it is `0` whenever
`a ≤ 0` or `u ∉ (0, 1)` (`TauCeti.inverseRegularizedGamma_eq_zero_of_not`,
`TauCeti.inverseRegularizedGamma_eq_zero_of_nonpos_left`,
`TauCeti.inverseRegularizedGamma_eq_zero_of_nonpos_right`,
`TauCeti.inverseRegularizedGamma_eq_zero_of_one_le`). For `a > 0` and `0 < u < 1` (DLMF §8.2):

- existence and uniqueness: `G_a⁻¹(u) > 0` and `G_a(G_a⁻¹(u)) = u`
  (`TauCeti.inverseRegularizedGamma_pos`, `TauCeti.regularizedGamma_inverseRegularizedGamma`), and
  `G_a⁻¹(u) = x` iff `G_a(x) = u` (`TauCeti.inverseRegularizedGamma_eq_iff`), so `G_a⁻¹(u)` is the
  unique root, and the unique positive root, of `G_a(x) = u`;
- the Galois characterizations `G_a⁻¹(u) ≤ x ⟺ u ≤ G_a(x)`, `x < G_a⁻¹(u) ⟺ G_a(x) < u` and
  `G_a⁻¹(u) < x ⟺ u < G_a(x)` (`TauCeti.inverseRegularizedGamma_le_iff`,
  `TauCeti.lt_inverseRegularizedGamma_iff`, `TauCeti.inverseRegularizedGamma_lt_iff`,
  `TauCeti.setOf_le_regularizedGamma_eq_Ici`), and the other inverse identity `G_a⁻¹(G_a(x)) = x` for
  `x > 0` (`TauCeti.inverseRegularizedGamma_regularizedGamma`);
- `G_a⁻¹` is strictly increasing and continuous on `(0, 1)`
  (`TauCeti.strictMonoOn_inverseRegularizedGamma`, `TauCeti.continuousOn_inverseRegularizedGamma`),
  tends to `0` from above as `u → 0⁺` and to `+∞` as `u → 1⁻`
  (`TauCeti.tendsto_inverseRegularizedGamma_nhdsGT_zero`,
  `TauCeti.tendsto_inverseRegularizedGamma_nhdsLT_one`);
- the totalized function `(a, u) ↦ G_a⁻¹(u)` is measurable on `ℝ²`
  (`TauCeti.measurable_inverseRegularizedGamma`), and `G_1⁻¹(u) = −log(1 − u)`
  (`TauCeti.inverseRegularizedGamma_one`).

**Inverse regularized incomplete Beta function.** For `a, b > 0` and `0 < u < 1`, `I_x(a, b) = u` has
exactly one root `x ∈ (0, 1)` (`TauCeti.exists_unique_regularizedIncompleteBeta_eq`), and
`B_(a,b)⁻¹(u)` is `TauCeti.inverseRegularizedIncompleteBeta a b u`, that root
(`TauCeti.inverseRegularizedIncompleteBeta_mem_Ioo`, `TauCeti.regularizedIncompleteBeta_inverse`); it
is `0` outside `a > 0, b > 0, 0 < u < 1` (`TauCeti.inverseRegularizedIncompleteBeta_eq_zero`). For
`a, b > 0` (DLMF §8.17):

- `B_(a,b)⁻¹(u) ≤ x ⟺ u ≤ I_x(a, b)` for `0 < u < 1`
  (`TauCeti.inverseRegularizedIncompleteBeta_le_iff`), and `B_(a,b)⁻¹(I_x(a, b)) = x` for `0 < x < 1`
  (`TauCeti.inverseRegularizedIncompleteBeta_regularizedIncompleteBeta`);
- `B_(a,b)⁻¹` is strictly increasing on `(0, 1)` and maps it onto `(0, 1)`
  (`TauCeti.strictMonoOn_inverseRegularizedIncompleteBeta`,
  `TauCeti.image_inverseRegularizedIncompleteBeta_Ioo`), is continuous there
  (`TauCeti.continuousAt_inverseRegularizedIncompleteBeta`,
  `TauCeti.continuousOn_inverseRegularizedIncompleteBeta`), tends to `0` as `u → 0⁺` and to `1` as
  `u → 1⁻` (`TauCeti.tendsto_inverseRegularizedIncompleteBeta_zero`,
  `TauCeti.tendsto_inverseRegularizedIncompleteBeta_one`), and `u ↦ B_(a,b)⁻¹(u)` is measurable on `ℝ`
  for all fixed real `a`, `b` (`TauCeti.measurable_inverseRegularizedIncompleteBeta`).

Prove that the totalized function `(a, b, u) ↦ B_(a,b)⁻¹(u)` is measurable on `ℝ³`. Route: on the
measurable set `{a > 0, b > 0, 0 < u < 1}` the Galois characterization gives
`{B_(a,b)⁻¹(u) ≤ x} = {u ≤ I_x(a, b)}`, so it suffices that `(a, b) ↦ I_x(a, b)` is measurable on
`{a > 0, b > 0}` for each fixed `x`, which holds because the Beta integrand
`t^(a−1)(1 − t)^(b−1)` is jointly measurable in `(a, b, t)` and `B(a, b)` is continuous there; off
that set the function is `0`.

**Inverse error function.** `erf` maps `ℝ` onto `(−1, 1)` (`Real.range_erf`), and `Real.erfInv` is
its inverse there and `0` off `(−1, 1)` (`Real.erf_erfInv`, `Real.erfInv_erf`, `Real.erfInv_eq_iff`,
`Real.erfInv_of_notMem`). It is odd, strictly increasing and continuous on `(−1, 1)`, measurable on
`ℝ`, tends to `±∞` at `±1`, and has derivative `(√π/2) e^((erf⁻¹ y)²)` on `(−1, 1)`
(`Real.erfInv_neg`, `Real.strictMonoOn_erfInv`, `Real.continuousOn_erfInv`, `Real.measurable_erfInv`,
`Real.tendsto_erfInv_nhdsLT_one`, `Real.tendsto_erfInv_nhdsGT_neg_one`, `Real.hasDerivAt_erfInv`)
(DLMF §7.2). The standard Gaussian quantile is `z(u) = √2 erf⁻¹(2u − 1)` for `0 < u < 1`
(`TauCeti.Probability.quantile_gaussianReal_zero_one`), and the quantile of `N(m, v)` is
`m + √(2v) erf⁻¹(2u − 1)` (`TauCeti.Probability.quantile_gaussianReal`).

These inverses are the ones that Layer 11 and Layer 13 use for the quantiles of the Gamma,
inverse-gamma, chi-squared, Beta, Student, Fisher and Gaussian laws.

*Needs:* §2.1, §2.2, §2.3, §7.2 (Tau Ceti `MeasureTheory.Measure.quantile`); Mathlib
`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.beta`; Tau Ceti
`TauCeti.inverseRegularizedGamma`, `TauCeti.inverseRegularizedIncompleteBeta`, `Real.erfInv` and the
facts above.

**Checks.**

- `G_1⁻¹(0.9) = log 10 ≈ 2.30259`, the `0.9`-quantile of the unit exponential law; inverting the upper
  regularized function `Γ(1, x)/Γ(1) = e^(−x)` instead gives `log(10/9) ≈ 0.10536`. With
  `G_2(x) = 1 − e^(−x)(1 + x)`, `G_2⁻¹(1 − 2/e) = 1`, where `1 − 2/e ≈ 0.26424`.
- `I_x(2, 1) = x²` and `I_x(1, 2) = 1 − (1 − x)²` on `[0, 1]`, so `B_(2,1)⁻¹(0.36) = 0.6` and
  `B_(1,2)⁻¹(0.36) = 0.2`, in agreement with `B_(a,b)⁻¹(u) = 1 − B_(b,a)⁻¹(1 − u)`
  (`1 − √0.64 = 0.2`); exchanging the shape parameters gives the other value.
- `z(0.975) = √2 erf⁻¹(0.95) ≈ 1.95996`; without the factor `√2` one gets `≈ 1.38590`, the quantile of
  `N(0, 1/2)`. Also `z(1/2) = 0`, as `erf⁻¹(0) = 0`.
- The totalized values at `u = 0` and `u = 1` are `0`, while the one-sided limits are `0` and `+∞` for
  `G_a⁻¹` and `0` and `1` for `B_(a,b)⁻¹`: an endpoint statement must be a limit, never the totalized
  value.

### Examples

- From the series, `I_(1/2)(1.3) ≈ 1.18851 = √(2/(1.3π)) sinh(1.3)`, and the recurrence at `ν = 1/2`
  gives `I_(−1/2)(1.3) − I_(3/2)(1.3) ≈ 0.91424 = I_(1/2)(1.3)/1.3`.
- The skew-normal cdf with shape `2` at `1` is `Φ(1) − 2T(1, 2) ≈ 0.68441`, the value of
  `∫_(−∞)^1 2ϕ(t)Φ(2t) dt`.
- `Z(0, 1) ≈ 2.5066282880` and `Z(1/2, 1) ≈ 2.5066282612`, on either side of `√(2π) ≈ 2.5066282746`.
- `G_1⁻¹(1/2) = log 2`, the median of the unit exponential law, and `B_(1,1)⁻¹(u) = u`.

### Dependencies

§8.1 and §8.3 rest on Mathlib's special functions (the Gamma function, the regularized hypergeometric
function, the Riemann zeta function, the two-variable Jacobi theta function); §8.2 and the
periodized Gaussian of §8.3 use the real Gaussian density and cdf of §1.10; §8.4 uses Layer 2
(§2.1–§2.3) and the quantile of §7.2. In Tau Ceti: `Analysis/SpecialFunctions` (Bessel `I`, Owen's T,
the Gaussian lattice sum and its Poisson summation, the error function and the incomplete Gamma and
Beta functions with their inverses), `NumberTheory/LSeries/RiemannZeta`, and
`Probability/Distributions/Gaussian` (Owen's T identities, periodization, quantiles) with
`Probability/Distributions/Gamma/Quantile`.

## Layer 9: finite, mixed, and integer-valued discrete families

Every scalar discrete family of this layer, on `ℕ`, on `ℤ` or through real labels on a finite type,
carries its cumulative sums (the cdf of its real cast), its least-crossing quantiles and the
one-sided limits of the quantile at `0` and `1`, which are the endpoints of its support. For a
probability law `μ` on `ℕ` or `ℤ` and `0 < u < 1`, the quantile of the real cast of `μ` is the least
integer `k` with `u ≤ μ(Iic k)` (`MeasureTheory.Measure.quantile_map_natCast_eq_iff`,
`MeasureTheory.Measure.quantile_map_intCast_eq_iff`, §7.2). A family with finite support also carries
all its natural moments as finite sums, `D = ℝ`, its `ℕ` pgf (§1.12) when it lives on `ℕ`, and its mgf
and characteristic function as finite sums or as the stated products. Each family has its masses,
its support, its form as a weighted sum of Dirac measures and its measurability in the parameters.
Integer differences are taken in `ℤ`, never by truncated subtraction in `ℕ`. Sources are Johnson, Kemp
and Kotz, *Univariate Discrete Distributions*, for the univariate families, and the references named
in each section.

### 9.1 Finite uniform and categorical

**Finite uniform laws.** The uniform law on a nonempty finite set `s` of a measurable space with
measurable singletons is Mathlib's `ProbabilityTheory.uniformOn s`, the counting measure conditioned
on `s`, a probability measure (`ProbabilityTheory.isProbabilityMeasure_uniformOn`); on a nonempty
finite type it is `ProbabilityTheory.uniformOn` of the whole space. For a finite set `s`:

- it is Mathlib's uniform law on a finite set, the measure
  `MeasureTheory.Measure.uniformOfFinset s = |s|⁻¹ ∑_(a∈s) δ_a`, for every finite set including the
  empty one, where both are zero (`Finset.uniformOn_coe_finset_eq_uniformOfFinset`);
- `{a}` has mass `1/|s|` for `a ∈ s` and `0` otherwise (`Finset.uniformOn_coe_finset_apply_singleton`);
  on a finite type every point has mass `1/|α|` (`TauCeti.Probability.uniformOn_univ_apply_singleton`)
  and a finite set `t` has mass `|t|/|α|` (`Finset.uniformOn_univ_real_finset`); in a T₁ space the
  topological support is `s` (`Finset.support_uniformOn_coe_finset`);
- every function is integrable and `∫ f = |s|⁻¹ ∑_(x∈s) f(x)` (`Finset.integrable_uniformOn_finset`,
  `Finset.integral_uniformOn_finset`, `TauCeti.Probability.integral_uniformOn_univ`); for a real label
  this gives every natural moment, the mgf and the characteristic function as finite sums, and
  `D = ℝ`;
- a bijection `f` from `s` onto `t` pushes the uniform law on `s` to the uniform law on `t`, with no
  finiteness hypothesis (`Set.BijOn.map_uniformOn`); an embedding `e` maps the uniform law on `s` to the uniform
  law on its image (`Function.Embedding.map_uniformOn_finset`), and an equivalence preserves the
  uniform law on the whole type (`Equiv.map_uniformOn_univ`);
- for a real label `ℓ` on a nonempty finite type, the cdf is `F(x) = |{i : ℓ(i) ≤ x}|/|α|`
  (`TauCeti.Probability.cdf_map_uniformOn_univ`); for `0 < u < 1`, `Q(u) = x` iff
  `|{ℓ < x}|/|α| < u ≤ |{ℓ ≤ x}|/|α|` (`TauCeti.Probability.quantile_map_uniformOn_univ_eq_iff`); and
  `Q(u)` tends to the least label as `u → 0⁺` and to the greatest as `u → 1⁻`
  (`TauCeti.Probability.tendsto_quantile_map_uniformOn_univ_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_uniformOn_univ_nhdsLT_one`).

**Categorical laws.** For a finite type `ι` with a measurable structure and a probability vector
`p : Convexity.StdSimplex ℝ≥0 ι` with weights `pᵢ`, the categorical law is
`TauCeti.Probability.categoricalMeasure p = ∑_i pᵢ δ_i` (`TauCeti.Probability.categoricalMeasure_def`),
a probability measure (`TauCeti.Probability.isProbabilityMeasure_categoricalMeasure`). With measurable
singletons:

- `{i}` has mass `pᵢ` (`TauCeti.Probability.categoricalMeasure_singleton`,
  `TauCeti.Probability.categoricalMeasure_real_singleton`) and `∫ g = ∑_i pᵢ g(i)`
  (`TauCeti.Probability.integral_categoricalMeasure`);
- the categorical law depends measurably on `p` for the coordinate measurable structure on the simplex
  (`TauCeti.Probability.measurable_categoricalMeasure`) and is weakly continuous in `p` on the whole simplex,
  zero weights included (`TauCeti.Probability.continuous_categoricalMeasure`,
  `Continuous.categoricalMeasure`);
- aggregation along any map `f : ι → κ` of finite types: the pushforward is the categorical law of
  `Convexity.StdSimplex.map f p`, whose weights are the sums of `p` over the fibres of `f`
  (`TauCeti.Probability.map_categoricalMeasure`);
- the one-hot encoding `i ↦ eᵢ`, the count vector with a single `1` in place `i`, pushes the
  categorical law to the multinomial law with one trial of §5.5 (`TauCeti.Probability.map_piSingle_categoricalMeasure`);
- numerical moments and quantiles use a supplied real label `ℓ`, never an order on `ι`: the cdf is
  `∑_(ℓ(i) ≤ x) pᵢ` (`Convexity.StdSimplex.cdf_map_categoricalMeasure`), the quantile is characterized
  by `∑_(ℓ(i) < x) pᵢ < u ≤ ∑_(ℓ(i) ≤ x) pᵢ`
  (`Convexity.StdSimplex.quantile_map_categoricalMeasure_eq_iff`), and its limits at `0` and `1` are
  the least and the greatest label of positive weight
  (`Convexity.StdSimplex.tendsto_quantile_map_categoricalMeasure_nhdsGT_zero`,
  `Convexity.StdSimplex.tendsto_quantile_map_categoricalMeasure_nhdsLT_one`).

**Rademacher law.** `TauCeti.Probability.rademacherMeasure` is `½δ_(−1) + ½δ_1` on `ℝ`
(`TauCeti.Probability.rademacherMeasure_eq`), a probability measure (its `MeasureTheory.IsProbabilityMeasure`
instance), invariant under `x ↦ −x` (`TauCeti.Probability.rademacherMeasure_map_neg`), with masses `1/2`
at `±1` and support `{−1, 1}` (`TauCeti.Probability.rademacherMeasure_singleton`,
`TauCeti.Probability.support_rademacherMeasure`). Every function is integrable and
`∫ f = (f(−1) + f(1))/2` (`TauCeti.Probability.integrable_rademacherMeasure`,
`TauCeti.Probability.integral_rademacherMeasure`); `E[Xⁿ]` is `1` for even `n` and `0` for odd `n`
(`TauCeti.Probability.integral_pow_rademacherMeasure`), the mean is `0` and the variance `1`
(`TauCeti.Probability.integral_id_rademacherMeasure`, `TauCeti.Probability.variance_id_rademacherMeasure`);
`D = ℝ`, `M(t) = cosh t`, `K(t) = log cosh t` and the characteristic function is `cos t`
(`TauCeti.Probability.integrableExpSet_id_rademacherMeasure`, `TauCeti.Probability.mgf_id_rademacherMeasure`,
`TauCeti.Probability.cgf_id_rademacherMeasure`, `TauCeti.Probability.charFun_rademacherMeasure`). The cdf
is `0`, `1/2`, `1` on `(−∞, −1)`, `[−1, 1)`, `[1, ∞)` (`TauCeti.Probability.cdf_rademacherMeasure`),
the quantile is `−1` for `u ≤ 1/2` and `1` for `u > 1/2`
(`TauCeti.Probability.quantile_rademacherMeasure`), with limits `−1` and `1`
(`TauCeti.Probability.tendsto_quantile_rademacherMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_rademacherMeasure_nhdsLT_one`).

**Integer intervals.** For integers `a`, `b` the uniform law on `{a, …, b}` is
`ProbabilityTheory.uniformOn` of the integer interval `Set.Icc a b`; it is the zero measure for
`b < a` (`TauCeti.Probability.uniformOn_Icc_int_of_lt`) and a probability measure for `a ≤ b`
(`TauCeti.Probability.isProbabilityMeasure_uniformOn_Icc_int`), with mass `1/N`, `N = b − a + 1`, at
each point of `[a, b]` (`TauCeti.Probability.uniformOn_Icc_int_apply_singleton`) and support `[a, b]`
(`TauCeti.Probability.support_uniformOn_Icc_int`). Integer translation by `c` shifts both endpoints and
`k ↦ −k` maps it to the law on `{−b, …, −a}` (`TauCeti.Probability.map_add_const_uniformOn_Icc_int`,
`TauCeti.Probability.map_neg_uniformOn_Icc_int`); as the parameters range over the countable set `ℤ²`,
measurability in them is automatic (`measurable_of_countable`). For `a ≤ b`:

- integration is the finite average over `[a, b]` (`TauCeti.Probability.integrable_uniformOn_Icc_int`,
  `TauCeti.Probability.integral_uniformOn_Icc_int`); the mean is `(a + b)/2` and the variance
  `(N² − 1)/12` (`TauCeti.Probability.integral_intCast_uniformOn_Icc`,
  `TauCeti.Probability.variance_intCast_uniformOn_Icc`);
- `D = ℝ` (`TauCeti.Probability.integrableExpSet_intCast_uniformOn_Icc`); for `t ≠ 0`,
  `M(t) = e^(ta)(e^(tN) − 1)/(N(e^t − 1))` and `K(t) = ta + log((e^(tN) − 1)/(N(e^t − 1)))`
  (`TauCeti.Probability.mgf_intCast_uniformOn_Icc`, `TauCeti.Probability.cgf_intCast_uniformOn_Icc`),
  while `M(0) = 1`; the characteristic function is the finite sum `N⁻¹ ∑_(k=a)^b e^(itk)`, equal to
  `e^(ita)(e^(itN) − 1)/(N(e^(it) − 1))` when `e^(it) ≠ 1`
  (`TauCeti.Probability.charFun_map_intCast_uniformOn_Icc`,
  `TauCeti.Probability.charFun_map_intCast_uniformOn_Icc_of_exp_ne_one`);
- after the translation `k ↦ k − a` the law is uniform on `{0, …, N − 1} ⊂ ℕ`
  (`TauCeti.Probability.map_toNat_sub_uniformOn_Icc_int`), whose pgf is `N⁻¹ ∑_(j<N) z^j`, equal to
  `(z^N − 1)/(N(z − 1))` for `z ≠ 1` (`TauCeti.Probability.pgf_uniformOn_Iio`,
  `TauCeti.Probability.pgf_uniformOn_Iio_of_ne_one`);
- the cdf is `0` below `a`, `(⌊x⌋ − a + 1)/N` on `[a, b]` and `1` above
  (`TauCeti.Probability.uniformOn_Icc_int_real_Iic`, `TauCeti.Probability.cdf_map_intCast_uniformOn_Icc`);
  for `0 < u < 1` the quantile is `a + ⌈Nu⌉ − 1`
  (`TauCeti.Probability.quantile_map_intCast_uniformOn_Icc`), with limits `a` and `b`
  (`TauCeti.Probability.tendsto_quantile_map_intCast_uniformOn_Icc_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_intCast_uniformOn_Icc_nhdsLT_one`).

*Needs:* Mathlib `ProbabilityTheory.uniformOn`, `ProbabilityTheory.isProbabilityMeasure_uniformOn`,
`MeasureTheory.Measure.uniformOfFinset`, `Convexity.StdSimplex`, `measurable_of_countable`; Tau Ceti
`TauCeti.Probability.categoricalMeasure`, `TauCeti.Probability.rademacherMeasure`,
`TauCeti.Probability.multinomialMeasure`, `TauCeti.Probability.pgf`; §1.12, §5.5, §7.2.

**Checks.**

- For the fair die, `a = 1` and `b = 6`: mean `7/2`, variance `35/12 = (6² − 1)/12`, and
  `Q(1/2) = 1 + ⌈3⌉ − 1 = 3`, the least `k` with `(k − a + 1)/6 ≥ 1/2`; the formula `a + ⌊Nu⌋` would
  give `4`, the upper quantile. `M(log 2) = 2(2⁶ − 1)/(6(2 − 1)) = 21 = (2 + 4 + 8 + 16 + 32 + 64)/6`.
- The uniform law on the integer interval `[2, 1]` is the zero measure, not a probability law, and so
  is the uniform law on the empty set in either form, conditioned counting measure or normalized
  Dirac sum.
- The Rademacher quantile at `u = 1/2` is `−1`, as the cdf reaches `1/2` at `−1`; a midpoint
  convention for the median would give `0` and the upper quantile gives `1`.
- The categorical law with weights `(0.2, 0.3, 0.5)` on `{1, 2, 3}`, aggregated along `1 ↦ 1, 2 ↦ 2, 3 ↦ 2`,
  has weights `(0.2, 0.8)`, the fibre sums; its one-hot image puts mass `0.3` on the count vector
  `(0, 1, 0)`, the mass of the one-trial multinomial law there.

### 9.2 Beta-binomial and Dirichlet-multinomial

**Beta-binomial law.** For `n ∈ ℕ` and `a, b > 0`, the beta-binomial law `BetaBin(n, a, b)` is
`TauCeti.Probability.betaBinomialMeasure n a b`, the mixture of `ProbabilityTheory.binomial n p`
against `p ~ Beta(a, b)` (§1.2, §1.7), through the kernel that sends a real `p` to the binomial law
with success probability the projection of `p` onto `[0, 1]` (Mathlib `Set.projIcc`); this kernel is
defined and measurable on all of `ℝ` (`TauCeti.Probability.measurable_binomial`) and agrees with
`binomial n p` on `[0, 1]` (`TauCeti.Probability.betaBinomialMeasure_eq_bind`). Invalid shapes give
the zero measure (`TauCeti.Probability.betaBinomialMeasure_eq_zero_of_invalid`) and `n = 0` with valid
shapes gives `δ₀` (`TauCeti.Probability.betaBinomialMeasure_zero_trials`); the family is measurable in
`(n, a, b)` (`TauCeti.Probability.measurable_betaBinomialMeasure`). For `a, b > 0`, with `A = a + b` and
`p = a/A` (Johnson, Kemp and Kotz):

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_betaBinomialMeasure`) with
  masses `w_k = C(n, k) B(k + a, n − k + b)/B(a, b)` at `0 ≤ k ≤ n`
  (`TauCeti.Probability.betaBinomialMeasure_real_singleton`,
  `TauCeti.Probability.betaBinomialMeasure_singleton`), positive exactly on `{0, …, n}`
  (`TauCeti.Probability.betaBinomialMeasure_singleton_ne_zero_iff`), and is the corresponding sum of
  Dirac measures (`TauCeti.Probability.betaBinomialMeasure_eq_sum_dirac`);
- integration is the finite sum against these masses and the iterated Beta–binomial integral
  (`TauCeti.Probability.integrable_betaBinomialMeasure`, `TauCeti.Probability.integral_betaBinomialMeasure`,
  `TauCeti.Probability.integral_betaBinomialMeasure_eq_integral`); every natural moment is the finite
  sum `∑_k w_k kᵐ` (`TauCeti.Probability.integral_pow_map_cast_betaBinomialMeasure`); `E[X] = np` and
  `Var X = np(1 − p)(A + n)/(A + 1)` (`TauCeti.Probability.integral_id_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.integral_sq_id_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.variance_id_map_cast_betaBinomialMeasure`), also for a variable with this law
  (`TauCeti.Probability.integral_of_hasLaw_betaBinomialMeasure`,
  `TauCeti.Probability.variance_of_hasLaw_betaBinomialMeasure`);
- `D = ℝ`, and the pgf, mgf, cgf and characteristic function are the finite sums `∑_k w_k z^k`,
  `∑_k w_k e^(tk)`, its logarithm and `∑_k w_k e^(itk)`
  (`TauCeti.Probability.integrableExpSet_id_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.pgf_betaBinomialMeasure`, `TauCeti.Probability.mgf_id_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.charFun_map_cast_betaBinomialMeasure`);
- the cdf is the cumulative sum of the masses (`TauCeti.Probability.betaBinomialMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_cast_betaBinomialMeasure`,
  `TauCeti.Probability.cdf_map_cast_betaBinomialMeasure_of_neg`,
  `TauCeti.Probability.betaBinomialMeasure_real_Iic_eq_one`); the quantile is its least crossing
  (`TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_iff`), equal to `0` iff
  `u ≤ B(a, b + n)/B(a, b)` and to `n` once `u > 1 − B(a + n, b)/B(a, b)`
  (`TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_zero_iff`,
  `TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_upper`), with limits `0` and `n`
  (`TauCeti.Probability.tendsto_quantile_map_cast_betaBinomialMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_betaBinomialMeasure_nhdsLT_one`).

**Dirichlet-multinomial law.** For a nonempty finite type `ι`, `n ∈ ℕ` and `α : ι → ℝ`,
`TauCeti.Probability.dirichletMultinomialMeasure n α` is the mixture of the multinomial law of §5.5
against the Dirichlet law of §5.6 through a measurable simplex-valued parameter map; every parameter
map whose weights agree almost surely with the Dirichlet vector gives the same law, so the choice off
the simplex does not matter (`TauCeti.Probability.dirichletMultinomialMeasure_eq_bind`,
`TauCeti.Probability.integral_dirichletMultinomialMeasure_eq_integral`). If some `αᵢ ≤ 0` it is the
zero measure (`TauCeti.Probability.dirichletMultinomialMeasure_eq_zero_of_invalid`); it is measurable
in `(n, α)` (`TauCeti.Probability.measurable_dirichletMultinomialMeasure`). For all `αᵢ > 0`, with
`A = ∑ᵢ αᵢ` and `pᵢ = αᵢ/A`:

- it is a probability measure
  (`TauCeti.Probability.isProbabilityMeasure_dirichletMultinomialMeasure`), and for `∑ᵢ kᵢ = n` the
  mass at `k` is `(n!/∏ᵢ kᵢ!) · Γ(A)/Γ(A + n) · ∏ᵢ Γ(αᵢ + kᵢ)/Γ(αᵢ)`, while every other `k` has mass `0`
  (`TauCeti.Probability.dirichletMultinomialMeasure_real_singleton`,
  `TauCeti.Probability.dirichletMultinomialMeasure_singleton`,
  `TauCeti.Probability.dirichletMultinomialMeasure_singleton_ne_zero_iff`); it is the corresponding
  finite sum of Dirac measures (`TauCeti.Probability.dirichletMultinomialMeasure_eq_sum_dirac`); `n = 0`
  gives `δ₀` and a single category gives the Dirac law at `n`
  (`TauCeti.Probability.dirichletMultinomialMeasure_zero_trials`,
  `TauCeti.Probability.dirichletMultinomialMeasure_eq_dirac_of_subsingleton`);
- on the Euclidean carrier, through the coordinatewise cast `TauCeti.Probability.multinomialToEuclidean`
  of §5.5: integration is the finite sum against the masses
  (`TauCeti.Probability.integrable_dirichletMultinomialMeasure`,
  `TauCeti.Probability.integral_dirichletMultinomialMeasure`,
  `TauCeti.Probability.integral_map_multinomialToEuclidean_dirichletMultinomialMeasure`), the law is
  square integrable (`TauCeti.Probability.memLp_id_map_multinomialToEuclidean_dirichletMultinomialMeasure`),
  its mean is `np` (`TauCeti.Probability.integral_id_map_multinomialToEuclidean_dirichletMultinomialMeasure`)
  and its covariance matrix (§5.1) is `n(A + n)/(A + 1) · (diag p − ppᵀ)`
  (`TauCeti.Probability.covMatrix_map_multinomialToEuclidean_dirichletMultinomialMeasure`), entrywise
  and as a bilinear form
  (`TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure`,
  `TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure_of_ne`,
  `TauCeti.Probability.variance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure`,
  `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_dirichletMultinomialMeasure`);
- aggregation: combining categories along a surjection `f : ι → κ` gives the Dirichlet-multinomial law
  with the shapes summed over the fibres
  (`TauCeti.Probability.map_funOnFinite_map_dirichletMultinomialMeasure`,
  `ProbabilityTheory.HasLaw.funOnFinite_map_dirichletMultinomialMeasure`); with at least two categories
  the coordinate `kᵢ` has the beta-binomial law `BetaBin(n, αᵢ, A − αᵢ)`
  (`TauCeti.Probability.map_eval_dirichletMultinomialMeasure`,
  `ProbabilityTheory.HasLaw.eval_dirichletMultinomialMeasure`), and the sum over a nonempty proper
  subset `s` has the law `BetaBin(n, ∑_s αᵢ, ∑_(sᶜ) αᵢ)`
  (`TauCeti.Probability.map_sum_dirichletMultinomialMeasure`);
- with `w_k` the mass at `k`, the vector characteristic function is the finite sum `∑_k w_k e^(i⟨t,k⟩)`
  (`TauCeti.Probability.charFun_map_multinomialToEuclidean_dirichletMultinomialMeasure`), and for every
  direction `θ` the linear observable `⟨θ, X⟩` has `D = ℝ` and finite-sum mgf and cgf
  (`TauCeti.Probability.integrableExpSet_map_multinomialToEuclidean_dirichletMultinomialMeasure`,
  `TauCeti.Probability.mgf_inner_dirichletMultinomialMeasure`,
  `TauCeti.Probability.cgf_inner_dirichletMultinomialMeasure`).

*Needs:* Mathlib `ProbabilityTheory.binomial`, `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.beta`,
`MeasureTheory.Measure.bind`, `Set.projIcc`, `Real.Gamma`; Tau Ceti
`TauCeti.Probability.measurable_binomial`, `TauCeti.Probability.dirichletMeasure`,
`TauCeti.Probability.multinomialMeasure`, `TauCeti.Probability.measurable_multinomialMeasure`,
`TauCeti.Probability.multinomialToEuclidean`, `TauCeti.covMatrix`; §1.2, §1.7, §1.12, §5.1, §5.5, §5.6,
§7.2, §7.4.

**Checks.**

- `BetaBin(n, 1, 1)` is uniform on `{0, …, n}`: `C(n, k) B(k + 1, n − k + 1) = 1/(n + 1)`. For `n = 2`
  the variance formula gives `2 · ½ · ½ · (2 + 2)/(2 + 1) = 2/3`, the variance `(3² − 1)/12` of the
  uniform law on `{0, 1, 2}`; masses without the factor `C(n, k)` would not sum to `1`.
- The Dirichlet-multinomial law with `α = (1, 1, 1)` and `n = 2` is uniform on the six compositions of
  `2` into three parts. Its first coordinate has masses `(1/2, 1/3, 1/6)`, which is
  `BetaBin(2, 1, 2)`, mean `2/3`, variance `5/9 = 2 · (3 + 2)/(3 + 1) · (1/3 − 1/9)`, and the covariance
  of two coordinates is `−5/18`. The multinomial covariance, without the overdispersion factor
  `(A + n)/(A + 1) = 5/4`, would give the variance `4/9`.

### 9.3 Sampling without replacement

**Multivariate hypergeometric law.** For a finite type `ι` of categories with sizes `K : ι → ℕ`,
`N = ∑ᵢ Kᵢ` and `n ∈ ℕ`, the law of the category counts in a uniform sample of size `n` drawn without
replacement is `TauCeti.Probability.multivariateHypergeometricMeasure K n`: mass
`∏ᵢ C(Kᵢ, kᵢ)/C(N, n)` at each `k` with `∑ᵢ kᵢ = n`, which is `0` unless every `kᵢ ≤ Kᵢ`, and no mass
elsewhere (`TauCeti.Probability.multivariateHypergeometricMeasure_def`,
`TauCeti.Probability.multivariateHypergeometricWeight_def`,
`TauCeti.Probability.multivariateHypergeometricMeasure_singleton`,
`TauCeti.Probability.multivariateHypergeometricMeasure_real_singleton`,
`TauCeti.Probability.multivariateHypergeometricMeasure_singleton_ne_zero_iff`). It is a probability
measure iff `n ≤ N` and the zero measure if `n > N`
(`TauCeti.Probability.isProbabilityMeasure_multivariateHypergeometricMeasure_iff`,
`TauCeti.Probability.multivariateHypergeometricMeasure_eq_zero_of_lt`); it is measurable in `(K, n)`
(`TauCeti.Probability.measurable_multivariateHypergeometricMeasure`). For `n ≤ N`, with `pᵢ = Kᵢ/N`:

- almost surely `∑ᵢ kᵢ = n` and `kᵢ ≤ Kᵢ` (`TauCeti.Probability.ae_multivariateHypergeometricMeasure`),
  and integration is the finite sum against the masses
  (`TauCeti.Probability.integrable_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.integral_multivariateHypergeometricMeasure`);
- aggregation along any `f : ι → κ` gives the multivariate hypergeometric law of the combined population
  (`TauCeti.Probability.map_funOnFinite_map_multivariateHypergeometricMeasure`,
  `ProbabilityTheory.HasLaw.funOnFinite_map_multivariateHypergeometricMeasure`); the sum over a set `s`
  of categories has the scalar hypergeometric law `Hyp(N, ∑_s Kᵢ, n)` of §3.10 (`Hyp(N, K, n)` is
  `TauCeti.Probability.hypergeometricMeasure N K n`: population `N`, `K` marked, `n` draws), and each
  coordinate the law `Hyp(N, Kᵢ, n)` (`TauCeti.Probability.map_sum_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.map_eval_multivariateHypergeometricMeasure`);
- `E[kᵢ] = npᵢ` and `Cov(kᵢ, kⱼ) = n(N − n)/(N − 1) · (δᵢⱼ pᵢ − pᵢpⱼ)` for `N > 1`
  (`TauCeti.Probability.integral_cast_apply_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.covariance_cast_apply_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.variance_cast_apply_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.variance_sum_cast_apply_multivariateHypergeometricMeasure`), and on the Euclidean
  carrier the law is square integrable with mean `np` and covariance matrix
  `n(N − n)/(N − 1) · (diag p − ppᵀ)`
  (`TauCeti.Probability.memLp_id_map_multinomialToEuclidean_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.integral_id_map_multinomialToEuclidean_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_multivariateHypergeometricMeasure`,
  `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_multivariateHypergeometricMeasure`).
  For `N = 0` or `N = 1` the law is a Dirac law
  (`TauCeti.Probability.multivariateHypergeometricMeasure_eq_dirac_of_support`, with
  `TauCeti.Probability.multivariateHypergeometricMeasure_zero_sample` and
  `TauCeti.Probability.multivariateHypergeometricMeasure_full_sample`) and its covariance is `0`; the
  cited covariance theorems hold for every `n ≤ N` and give `0` in these cases with the convention
  `x/0 = 0`.

**Negative hypergeometric law.** In a population of `N` items of which `K` are successes, drawn
without replacement in a uniformly random order, the number of failures before the `r`-th success has
the law `TauCeti.Probability.negativeHypergeometricMeasure N K r`. For `1 ≤ r ≤ K ≤ N` and
`0 ≤ k ≤ N − K` its mass at `k` is `C(k + r − 1, k) C(N − r − k, K − r)/C(N, K)`, and it has no mass
above `N − K` (`TauCeti.Probability.negativeHypergeometricMeasure_real_singleton`,
`TauCeti.Probability.negativeHypergeometricWeight_of_le`,
`TauCeti.Probability.negativeHypergeometricWeight_of_not_le`); for `r = 0` and `K ≤ N` it is `δ₀`
(`TauCeti.Probability.negativeHypergeometricMeasure_zero_successes`), and every other parameter value
(`r > K` or `K > N`) gives the zero measure
(`TauCeti.Probability.negativeHypergeometricMeasure_eq_zero_of_invalid`). It is measurable in
`(N, K, r)` (`TauCeti.Probability.measurable_negativeHypergeometricMeasure`). For `r ≤ K ≤ N` (Johnson,
Kemp and Kotz):

- it is a probability measure, the corresponding sum of Dirac measures on `{0, …, N − K}`, with mass at
  `k` positive iff `k ≤ N − K` and (`k = 0` or `r > 0`)
  (`TauCeti.Probability.isProbabilityMeasure_negativeHypergeometricMeasure`,
  `TauCeti.Probability.negativeHypergeometricMeasure_eq_sum_dirac`,
  `TauCeti.Probability.negativeHypergeometricMeasure_singleton_ne_zero_iff`);
- integration is the finite sum against the masses
  (`TauCeti.Probability.integral_negativeHypergeometricMeasure`,
  `TauCeti.Probability.integral_map_cast_negativeHypergeometricMeasure`), which gives every natural
  moment and the pgf `∑_k w_k z^k`, `w_k` the mass at `k` (§1.12, `TauCeti.Probability.pgf_def`), as
  finite sums; the rising factorial moments are
  `E[(X + r)(X + r + 1)⋯(X + r + m − 1)] = r(r + 1)⋯(r + m − 1) C(N + m, K + m)/C(N, K)`
  (`TauCeti.Probability.integral_ascFactorial_negativeHypergeometricMeasure`); `E[X] = r(N − K)/(K + 1)`
  and `Var X = r(N + 1)(N − K)(K − r + 1)/((K + 1)²(K + 2))`
  (`TauCeti.Probability.integral_id_map_cast_negativeHypergeometricMeasure`,
  `TauCeti.Probability.variance_id_map_cast_negativeHypergeometricMeasure`); `D = ℝ` and the mgf, cgf
  and characteristic function are finite sums
  (`TauCeti.Probability.integrableExpSet_id_map_cast_negativeHypergeometricMeasure`,
  `TauCeti.Probability.mgf_id_map_cast_negativeHypergeometricMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_negativeHypergeometricMeasure`,
  `TauCeti.Probability.charFun_map_cast_negativeHypergeometricMeasure`);
- sampling: if the positions of the `K` successes are a uniformly random `K`-element subset of
  `{0, …, N − 1}`, the number of failures before the `r`-th success, `Finset.failuresBeforeSuccess` of
  that set, has this law, for every `r ≤ K ≤ N`, `r = 0` and `N = 0` included
  (`TauCeti.Probability.map_failuresBeforeSuccess_uniformOn_powersetCard`,
  `ProbabilityTheory.HasLaw.failuresBeforeSuccess_negativeHypergeometricMeasure`); and a uniformly random
  permutation of a finite type carries a fixed `K`-element set to a uniformly random `K`-element set
  (`Finset.map_uniformOn_perm`, `Finset.map_preimage_uniformOn_perm`,
  `ProbabilityTheory.HasLaw.preimage_finset_uniformOn_perm`);
- at most `k` failures precede the `r`-th success iff the first `min(N, k + r)` draws contain at least
  `r` successes, so `P(X ≤ k) = P(Hyp(N, K, min(N, k + r)) ≥ r)` for every `k`, the support cases
  included (`TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_hypergeometric_tail`,
  `TauCeti.Probability.measureReal_le_of_hasLaw_negativeHypergeometricMeasure`);
- the cdf is the cumulative sum of the masses
  (`TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_sum`,
  `TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_one`,
  `TauCeti.Probability.cdf_map_cast_negativeHypergeometricMeasure`,
  `TauCeti.Probability.cdf_map_cast_negativeHypergeometricMeasure_of_neg`), the quantile its least
  crossing (`TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_zero_iff`,
  `TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_upper`), with limits `0` and
  `N − K` (`0` if `r = 0`)
  (`TauCeti.Probability.tendsto_quantile_map_cast_negativeHypergeometricMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_negativeHypergeometricMeasure_nhdsLT_one`).

Prove the labelled-permutation construction: for `r ≤ K ≤ N`, a fixed set `S` of `K` labels among
`{0, …, N − 1}` (the successes) and a uniformly random permutation `σ` of `{0, …, N − 1}` (label `j`
is drawn in position `σ(j)`), the number of failures before the `r`-th success,
`Finset.failuresBeforeSuccess` of the position set `σ(S)`, has law
`TauCeti.Probability.negativeHypergeometricMeasure N K r`. Route: `Finset.map_uniformOn_perm` on
`Fin N`, transport along the embedding of `Fin N` into `ℕ` with
`Function.Embedding.map_uniformOn_finset`, then
`TauCeti.Probability.map_failuresBeforeSuccess_uniformOn_powersetCard`.

*Needs:* §3.10 (Tau Ceti `TauCeti.Probability.hypergeometricMeasure`), §5.1, §5.5 (Tau Ceti
`TauCeti.Probability.multinomialToEuclidean`), §7.2, §9.1 (uniform laws on finite sets), §1.12; Tau Ceti
`Finset.failuresBeforeSuccess`, `Finset.map_uniformOn_perm`, `Function.Embedding.map_uniformOn_finset`.

**Checks.**

- For `K = (2, 3)` and `n = 2` (`N = 5`) the masses at `(0, 2)`, `(1, 1)`, `(2, 0)` are `3/10`, `6/10`,
  `1/10`; the first count has mean `0.8 = 2 · 2/5` and variance `0.36 = 2 · 0.4 · 0.6 · (5 − 2)/(5 − 1)`.
  Sampling with replacement (the binomial law) gives `0.48`: the factor `(N − n)/(N − 1)` is visible.
- For `N = 5`, `K = 3`, `r = 2` the masses are `(k + 1)(3 − k)/10 = 3/10, 4/10, 3/10` on `{0, 1, 2}`,
  which is what enumerating the ten `3`-element position sets gives; the mean is `1 = 2 · 2/4` and the
  variance `0.6 = 2 · 6 · 2 · 2/(16 · 5)`; `P(X ≤ 0) = 3/10 = C(3, 2)/C(5, 2)`, the probability that the
  first two draws are both successes, as the cdf relation with `min(N, 0 + r) = 2` draws requires.

### 9.4 Poisson-binomial

For a finite type `ι` and `p : ι → [0, 1]`, the Poisson-binomial law `PB(p)`,
`TauCeti.Probability.poissonBinomialMeasure p`, is the law
of the number of successes in independent Bernoulli trials with success probabilities `pᵢ`: every
`S ⊆ ι` contributes the weight `∏_(i∈S) pᵢ ∏_(i∉S) (1 − pᵢ)` at `|S|`
(`TauCeti.Probability.poissonBinomialWeight_def`, `TauCeti.Probability.poissonBinomialMeasure_eq_sum`,
`TauCeti.Probability.poissonBinomialMeasure_apply`, `TauCeti.Probability.sum_poissonBinomialWeight`).
It is a probability measure (`TauCeti.Probability.isProbabilityMeasure_poissonBinomialMeasure`) and is
measurable in `p` (`TauCeti.Probability.measurable_poissonBinomialMeasure`). (Johnson, Kemp and Kotz)

- Native sums: if `X_i` are independent with Bernoulli laws `Ber(pᵢ)` on `{0, 1} ⊂ ℕ` (Mathlib
  `ProbabilityTheory.bernoulliMeasure`, mass `pᵢ` at `1`), then `∑ᵢ X_i` has this law
  (`ProbabilityTheory.iIndepFun.hasLaw_sum_poissonBinomialMeasure`,
  `TauCeti.Probability.map_sum_pi_bernoulliMeasure`, real form
  `TauCeti.Probability.map_sum_natCast_pi_bernoulliMeasure`); this roadmap owns this non-identical
  Bernoulli-sum theorem. More generally the number of independent coordinates `X_i` lying in
  measurable sets `sᵢ` has the law `PB(μᵢ(sᵢ))` (`ProbabilityTheory.iIndepFun.hasLaw_card_filter_mem`,
  `TauCeti.Probability.hasLaw_card_filter_mem_pi`).
- Masses: the mass at `k` is the sum of the weights of the subsets of size `k`
  (`TauCeti.Probability.poissonBinomialMeasure_singleton`,
  `TauCeti.Probability.poissonBinomialMeasure_real_singleton`); it is positive iff
  `#{i : pᵢ = 1} ≤ k ≤ #{i : pᵢ ≠ 0}` (`TauCeti.Probability.poissonBinomialMeasure_singleton_ne_zero_iff`),
  zero above `|ι|`, and the law is carried by `{0, …, |ι|}`
  (`TauCeti.Probability.poissonBinomialMeasure_singleton_eq_zero`,
  `TauCeti.Probability.poissonBinomialMeasure_Iic_card`).
- Transforms and moments: the pgf is `∏ᵢ (1 − pᵢ + pᵢz)` (`TauCeti.Probability.pgf_poissonBinomialMeasure`);
  every function is integrable and integration is the finite sum over subsets
  (`TauCeti.Probability.integrable_poissonBinomialMeasure`,
  `TauCeti.Probability.integral_poissonBinomialMeasure`,
  `TauCeti.Probability.integrable_map_cast_poissonBinomialMeasure`), so every natural moment is a finite
  sum (`TauCeti.Probability.integral_pow_id_map_cast_poissonBinomialMeasure`); the mean is `∑ᵢ pᵢ` and the
  variance `∑ᵢ pᵢ(1 − pᵢ)` (`TauCeti.Probability.integral_id_map_cast_poissonBinomialMeasure`,
  `TauCeti.Probability.variance_id_map_cast_poissonBinomialMeasure`); `D = ℝ`,
  `M(t) = ∏ᵢ (1 − pᵢ + pᵢe^t)`, `K(t) = ∑ᵢ log(1 − pᵢ + pᵢe^t)` and the characteristic function is
  `∏ᵢ (1 − pᵢ + pᵢe^(it))` (`TauCeti.Probability.integrableExpSet_id_map_cast_poissonBinomialMeasure`,
  `TauCeti.Probability.mgf_id_map_cast_poissonBinomialMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_poissonBinomialMeasure`,
  `TauCeti.Probability.charFun_map_cast_poissonBinomialMeasure`).
- Adjoining one trial: for `j ∈ ι`, the law is the convolution of the Poisson-binomial law of the
  other trials with `Ber(pⱼ)` (`TauCeti.Probability.poissonBinomialMeasure_eq_conv_bernoulliMeasure`).
- Boundary cases: the empty family gives `δ₀` (`TauCeti.Probability.poissonBinomialMeasure_of_isEmpty`),
  and a constant parameter `p` gives the binomial law with `|ι|` trials and success probability `p`
  (`TauCeti.Probability.poissonBinomialMeasure_const`).
- The cdf is the sum of the weights of the subsets of size at most `⌊x⌋`
  (`TauCeti.Probability.poissonBinomialMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_cast_poissonBinomialMeasure`,
  `TauCeti.Probability.cdf_map_cast_poissonBinomialMeasure_of_neg`), `0` below `#{pᵢ = 1}` and `1` from
  `#{pᵢ ≠ 0}` on (`TauCeti.Probability.poissonBinomialMeasure_real_Iic_eq_zero_of_lt_lower`,
  `TauCeti.Probability.poissonBinomialMeasure_real_Iic_eq_one_of_upper_le`); the quantile is its least
  crossing (`TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_lower`,
  `TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_upper`), with limits `#{pᵢ = 1}`
  and `#{pᵢ ≠ 0}` (`TauCeti.Probability.tendsto_quantile_map_cast_poissonBinomialMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_poissonBinomialMeasure_nhdsLT_one`).

*Needs:* Mathlib `ProbabilityTheory.bernoulliMeasure`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.iIndepFun`, `MeasureTheory.Measure.pi`; §1.2, §1.12, §7.2.

**Checks.**

- For `p = (1/2, 1/3)` the masses are `1/3`, `1/2`, `1/6`, the coefficients of
  `(1 + z)/2 · (2 + z)/3 = (2 + 3z + z²)/6`; the mean is `5/6` and the variance `1/4 + 2/9 = 17/36`. The
  binomial law with the averaged probability `5/12` has variance `35/72`: replacing the family by its
  average is wrong.
- For `p = (1, 0)` the law is `δ₁`: the window `#{pᵢ = 1} ≤ k ≤ #{pᵢ ≠ 0}` is `{1}`.

### 9.5 Skellam

For rates `λ₁, λ₂ ∈ ℝ≥0`, `TauCeti.Probability.skellamMeasure λ₁ λ₂` is the law on `ℤ` of `X₁ − X₂`,
the difference taken in `ℤ`, for independent Poisson variables `X_i` of rates `λᵢ`: the pushforward of
the product of the two Poisson laws (`TauCeti.Probability.skellamMeasure_def`,
`ProbabilityTheory.IndepFun.hasLaw_sub_skellamMeasure`). It is a probability measure (its
`MeasureTheory.IsProbabilityMeasure` instance) and is measurable in `(λ₁, λ₂)`
(`TauCeti.Probability.measurable_skellamMeasure`). (Johnson, Kemp and Kotz)

- Masses: for `k ≥ 0`, `p_k = e^(−λ₁−λ₂) ∑_(j≥0) λ₁^(j+k) λ₂^j/((j + k)! j!)`, the series converging
  (`TauCeti.Probability.hasSum_skellamMeasure_mass`,
  `TauCeti.Probability.skellamMeasure_singleton_natCast`,
  `TauCeti.Probability.skellamMeasure_singleton_natCast_eq_tsum`, and for every integer `k`
  `TauCeti.Probability.skellamMeasure_real_singleton_eq_tsum`); `p_(−k)` is `p_k` with the rates
  exchanged (`TauCeti.Probability.skellamMeasure_singleton_neg`); when both rates are positive every
  integer has positive mass and the support is `ℤ` (`TauCeti.Probability.skellamMeasure_singleton_pos`,
  `TauCeti.Probability.support_skellamMeasure`). The masses are these series; no Bessel-function form
  of them belongs to this roadmap.
- Reflection and zero rates: `X ↦ −X` exchanges the rates (`TauCeti.Probability.map_neg_skellamMeasure`);
  `Skellam(λ, 0)` is `Poisson(λ)` cast to `ℤ`, `Skellam(0, λ)` is its image under `n ↦ −n`, and
  `Skellam(0, 0) = δ₀` (`TauCeti.Probability.skellamMeasure_zero_right`,
  `TauCeti.Probability.skellamMeasure_zero_left`, `TauCeti.Probability.skellamMeasure_zero_zero`).
- Convolution adds both rates: `Skellam(λ₁, λ₂) ∗ Skellam(μ₁, μ₂) = Skellam(λ₁ + μ₁, λ₂ + μ₂)`
  (`TauCeti.Probability.skellamMeasure_conv_skellamMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_add_skellamMeasure`).
- Moments and transforms: every natural moment exists
  (`TauCeti.Probability.integrable_pow_intCast_skellamMeasure`); the mean is `λ₁ − λ₂` and the variance
  `λ₁ + λ₂` (`TauCeti.Probability.integral_intCast_skellamMeasure`,
  `TauCeti.Probability.variance_intCast_skellamMeasure`); `D = ℝ`,
  `M(t) = exp(λ₁(e^t − 1) + λ₂(e^(−t) − 1))` and its logarithm is the cgf
  (`TauCeti.Probability.integrable_exp_mul_intCast_skellamMeasure`,
  `TauCeti.Probability.integrableExpSet_intCast_skellamMeasure`,
  `TauCeti.Probability.mgf_intCast_skellamMeasure`, `TauCeti.Probability.cgf_intCast_skellamMeasure`); the
  characteristic function is `exp(λ₁(e^(it) − 1) + λ₂(e^(−it) − 1))`
  (`TauCeti.Probability.charFun_map_intCast_skellamMeasure`); the real cast is the law of the difference
  of the real Poisson laws (`TauCeti.Probability.map_intCast_skellamMeasure`).
- Cumulative sums: `P(X ≤ k)` is the absolutely convergent sum of the masses over the integers
  `n ≤ k` (`TauCeti.Probability.hasSum_skellamMeasure_real_Iic_mass`), also a Poisson-weighted series of
  Poisson cdfs (`TauCeti.Probability.skellamMeasure_real_Iic`,
  `TauCeti.Probability.hasSum_skellamMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_intCast_skellamMeasure`), with
  `P(X ≤ k) = 1 − P(X' ≤ −k − 1)` for `X' ~ Skellam(λ₂, λ₁)`
  (`TauCeti.Probability.skellamMeasure_real_Iic_eq_one_sub`), positive when `λ₂ > 0` and below `1` when
  `λ₁ > 0` (`TauCeti.Probability.skellamMeasure_real_Iic_pos`,
  `TauCeti.Probability.skellamMeasure_real_Iic_lt_one`); the quantile is its least crossing
  (`TauCeti.Probability.quantile_map_intCast_skellamMeasure_eq_iff`, with the cases
  `TauCeti.Probability.quantile_map_intCast_skellamMeasure_zero_left_eq_zero_iff` and
  `TauCeti.Probability.quantile_map_intCast_skellamMeasure_zero_zero`), and tends to `−∞` as `u → 0⁺`
  unless `λ₂ = 0` (then to `0`) and to `+∞` as `u → 1⁻` unless `λ₁ = 0` (then to `0`)
  (`TauCeti.Probability.tendsto_quantile_map_intCast_skellamMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_intCast_skellamMeasure_nhdsLT_one`).

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.poissonMeasure_conv_poissonMeasure`,
`ProbabilityTheory.IndepFun`; §1.4, §7.2.

**Checks.**

- For `λ₁ = λ₂ = 1` the mass at `0` is `e^(−2) ∑_j 1/(j!)² ≈ 0.30851`, the mean is `0`, the variance `2` and
  `M(t) = exp(2(cosh t − 1))`.
- For `λ₁ = 0` and `λ₂ = 1` the law is that of `−Y`, `Y ~ Poisson(1)`: mass `e^(−1)/k!` at `−k`, and the
  quantile tends to `0`, the top of the support, as `u → 1⁻`. A difference computed by truncated
  subtraction in `ℕ` would put all the mass at `0`.

### 9.6 Zipf/zeta and finite Zipf

**Zipf law.** For `s > 1`, `TauCeti.Probability.zipfMeasure s` has mass `k^(−s)/Re ζ(s)` at every
positive integer `k` and no mass at `0` (`TauCeti.Probability.zipfMeasure_singleton`,
`TauCeti.Probability.zipfMeasure_real_singleton`, `TauCeti.Probability.zipfWeightReal_def`,
`TauCeti.Probability.zipfMeasure_singleton_zero`), normalized by the zeta value of §8.3
(`TauCeti.Probability.hasSum_zipfWeightReal`); it is a probability measure, the corresponding sum of
Dirac measures, with support the positive integers
(`TauCeti.Probability.isProbabilityMeasure_zipfMeasure`, `TauCeti.Probability.zipfMeasure_eq_sum_dirac`,
`TauCeti.Probability.zipfMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.ae_pos_zipfMeasure`). For
`s ≤ 1` it is the zero measure (`TauCeti.Probability.zipfMeasure_of_le_one`); it is measurable in `s`
(`TauCeti.Probability.measurable_zipfMeasure`). For `s > 1` (Johnson, Kemp and Kotz):

- for natural `n`, `xⁿ` is integrable for the real cast iff `n < s − 1`
  (`TauCeti.Probability.integrable_pow_map_cast_zipfMeasure_iff`), and then
  `E[Xⁿ] = Re ζ(s − n)/Re ζ(s)` (`TauCeti.Probability.integral_pow_map_cast_zipfMeasure`); in particular
  the mean exists iff `s > 2` and equals `ζ(s − 1)/ζ(s)`
  (`TauCeti.Probability.integrable_id_map_cast_zipfMeasure_iff`,
  `TauCeti.Probability.integral_id_map_cast_zipfMeasure`), and the second moment exists iff `s > 3`,
  with variance `ζ(s − 2)/ζ(s) − (ζ(s − 1)/ζ(s))²`
  (`TauCeti.Probability.memLp_two_id_map_cast_zipfMeasure_iff`,
  `TauCeti.Probability.variance_id_map_cast_zipfMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_map_cast_zipfMeasure`);
- for `x ≥ 0` the cdf is the partial sum `∑_(k≤⌊x⌋) k^(−s)/ζ(s)`; it vanishes for `x < 1` and is
  less than `1` everywhere (`TauCeti.Probability.zipfMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_zipfMeasure`,
  `TauCeti.Probability.cdf_map_cast_zipfMeasure_of_lt_one`, `TauCeti.Probability.cdf_map_cast_zipfMeasure_lt_one`);
  the quantile is its least crossing (`TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_succ_iff`,
  `TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_one_iff`), with limits `1` and `+∞`
  (`TauCeti.Probability.tendsto_quantile_map_cast_zipfMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_zipfMeasure_nhdsLT_one`).

**Finite Zipf law.** For `N ∈ ℕ` and every real `s`, `TauCeti.Probability.finiteZipfMeasure N s`
normalizes `k^(−s)` on `{1, …, N}` by `H_(N,s) = ∑_(k=1)^N k^(−s)`
(`TauCeti.Probability.finiteZipfNormalizer_def`, `TauCeti.Probability.finiteZipfMeasure_eq_sum_dirac`,
`TauCeti.Probability.finiteZipfMeasure_real_singleton`). It is the zero law at `N = 0` and a probability
measure iff `N ≥ 1` (`TauCeti.Probability.finiteZipfMeasure_zero_left`,
`TauCeti.Probability.isProbabilityMeasure_finiteZipfMeasure_iff`); it is `δ₁` at `N = 1`
(`TauCeti.Probability.finiteZipfMeasure_one_left`), the uniform law on `{1, …, N}` at `s = 0`
(`TauCeti.Probability.finiteZipfMeasure_zero_right`), has support `{1, …, N}`
(`TauCeti.Probability.support_finiteZipfMeasure`), and is measurable in `(N, s)`
(`TauCeti.Probability.measurable_finiteZipfMeasure`). For `N ≥ 1`:

- integration is the finite sum against the masses
  (`TauCeti.Probability.integral_finiteZipfMeasure`, `TauCeti.Probability.integral_map_cast_finiteZipfMeasure`);
  for every real `q`, `E[X^q] = H_(N,s−q)/H_(N,s)`
  (`TauCeti.Probability.integral_rpow_map_cast_finiteZipfMeasure`), with the natural moments, the mean
  and the variance as instances (`TauCeti.Probability.integral_pow_map_cast_finiteZipfMeasure`,
  `TauCeti.Probability.integral_id_map_cast_finiteZipfMeasure`,
  `TauCeti.Probability.variance_id_map_cast_finiteZipfMeasure`); `D = ℝ`, and the pgf, mgf, cgf and
  characteristic function are finite sums (`TauCeti.Probability.integrableExpSet_id_map_cast_finiteZipfMeasure`,
  `TauCeti.Probability.pgf_finiteZipfMeasure`, `TauCeti.Probability.mgf_id_map_cast_finiteZipfMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_finiteZipfMeasure`,
  `TauCeti.Probability.charFun_map_cast_finiteZipfMeasure`);
- the cdf is `H_(min(N,⌊x⌋),s)/H_(N,s)` for `x ≥ 0` (`TauCeti.Probability.finiteZipfMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_cast_finiteZipfMeasure`), the quantile its least crossing
  (`TauCeti.Probability.quantile_map_cast_finiteZipfMeasure_eq_iff`), with limits `1` and `N`
  (`TauCeti.Probability.tendsto_quantile_map_cast_finiteZipfMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_finiteZipfMeasure_nhdsLT_one`);
- for `s > 1` it is the Zipf law conditioned on `{X ≤ N}` (`TauCeti.Probability.finiteZipfMeasure_eq_cond`),
  its total-variation distance to `Zipf(s)`, measured by Mathlib's `MeasureTheory.tvDist` (the total
  mass of `|μ − ν|`), is `2(1 − P_Zipf(X ≤ N))` (`TauCeti.Probability.tvDist_finiteZipfMeasure_zipfMeasure`),
  and it converges to `Zipf(s)` in total variation as `N → ∞`
  (`TauCeti.Probability.tendsto_tvDist_finiteZipfMeasure_zipfMeasure`).

*Needs:* §8.3 (Mathlib `riemannZeta`), Mathlib `MeasureTheory.tvDist`, `ProbabilityTheory.cond`,
`ProbabilityTheory.uniformOn`; §7.2, §7.3, §9.1, §1.12.

**Checks.**

- The finite Zipf law with exponent `0` is the uniform law on `{1, …, N}`, as stated above:
  `H_(N,0) = N`. A normalization over `{0, …, N}` would put mass on `0` and give `1/(N + 1)`.
- For `s = 3`: `P(X = 1) = 1/ζ(3) ≈ 0.83191` and `E[X] = ζ(2)/ζ(3) ≈ 1.36843`, but there is no finite
  variance, since `2 < 3 − 1` fails; a threshold `n ≤ s − 1` would admit the second moment, whose series
  `∑_k 1/k` diverges.
- For `N = 1` and `s = 2` the finite law is `δ₁`, at distance `2(1 − 6/π²) ≈ 0.78415` from `Zipf(2)`
  with Mathlib's normalization; the supremum over events of `|μ(A) − ν(A)|` is half of that.

### 9.7 Yule–Simon and logarithmic series

**Yule–Simon law.** For `ρ > 0`, `TauCeti.Probability.yuleSimonMeasure ρ` has mass `ρB(k, ρ + 1)` at
every positive integer `k` and no mass at `0` (`TauCeti.Probability.yuleSimonMeasure_real_singleton`,
`TauCeti.Probability.yuleSimonWeightReal_def`, `TauCeti.Probability.yuleSimonMeasure_singleton_zero`);
`ρ ≤ 0` gives the zero measure (`TauCeti.Probability.yuleSimonMeasure_of_nonpos`). It is a probability
measure, the corresponding sum of Dirac measures, with support the positive integers
(`TauCeti.Probability.isProbabilityMeasure_yuleSimonMeasure`,
`TauCeti.Probability.yuleSimonMeasure_eq_sum_dirac`,
`TauCeti.Probability.yuleSimonMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.ae_pos_yuleSimonMeasure`),
and is measurable in `ρ` (`TauCeti.Probability.measurable_yuleSimonMeasure`); `p₁ = ρ/(ρ + 1)` and
`p_(k+1) = k p_k/(k + ρ + 1)` for `k ≥ 1` (`TauCeti.Probability.yuleSimonWeightReal_one`,
`TauCeti.Probability.yuleSimonWeightReal_add_one`). For `ρ > 0` (Johnson, Kemp and Kotz):

- `P(X > k) = kB(k, ρ + 1)` for `k ≥ 1` and `P(X > 0) = 1`
  (`TauCeti.Probability.yuleSimonMeasure_real_Ioi`, `TauCeti.Probability.yuleSimonMeasure_real_Ioi_zero`),
  so the cdf is `1 − ⌊x⌋B(⌊x⌋, ρ + 1)` for `x ≥ 1` and `0` below
  (`TauCeti.Probability.yuleSimonMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_yuleSimonMeasure`,
  `TauCeti.Probability.cdf_map_cast_yuleSimonMeasure_of_lt_one`);
- for natural `n`, `xⁿ` is integrable iff `n < ρ`
  (`TauCeti.Probability.integrable_pow_map_cast_yuleSimonMeasure_iff`); as `X ≥ 0` this is the exact
  threshold for the absolute natural moments; the rising factorial moments are
  `E[X(X + 1)⋯(X + m − 1)] = ρ m!/(ρ − m)` for `m < ρ`
  (`TauCeti.Probability.integral_ascPochhammer_map_cast_yuleSimonMeasure`); `E[X] = ρ/(ρ − 1)` for
  `ρ > 1` and `Var X = ρ²/((ρ − 1)²(ρ − 2))` for `ρ > 2`
  (`TauCeti.Probability.integral_id_map_cast_yuleSimonMeasure`,
  `TauCeti.Probability.variance_id_map_cast_yuleSimonMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_map_cast_yuleSimonMeasure`);
- the quantile is the least `n ≥ 1` with `nB(n, ρ + 1) ≤ 1 − u`
  (`TauCeti.Probability.quantile_map_cast_yuleSimonMeasure_eq_iff`), equal to `1` iff `u ≤ ρ/(ρ + 1)`
  (`TauCeti.Probability.quantile_map_cast_yuleSimonMeasure_eq_one_iff`), with limits `1` and `+∞`
  (`TauCeti.Probability.tendsto_quantile_map_cast_yuleSimonMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_yuleSimonMeasure_nhdsLT_one`).

**Logarithmic series law.** For `0 < q < 1`, `TauCeti.Probability.logarithmicSeriesMeasure q` has mass
`−q^k/(k log(1 − q))` at every positive integer `k` and no mass at `0`
(`TauCeti.Probability.logarithmicSeriesMeasure_real_singleton`,
`TauCeti.Probability.logarithmicSeriesWeightReal_eq_div`,
`TauCeti.Probability.logarithmicSeriesMeasure_singleton_zero`); every other `q` gives the zero measure
(`TauCeti.Probability.logarithmicSeriesMeasure_eq_zero_of_invalid`). It is a probability measure, the
corresponding sum of Dirac measures, with support the positive integers
(`TauCeti.Probability.isProbabilityMeasure_logarithmicSeriesMeasure`,
`TauCeti.Probability.logarithmicSeriesMeasure_eq_sum_dirac`,
`TauCeti.Probability.logarithmicSeriesMeasure_singleton_ne_zero_iff`,
`TauCeti.Probability.ae_pos_logarithmicSeriesMeasure`), and is measurable in `q`
(`TauCeti.Probability.measurable_logarithmicSeriesMeasure`). For `0 < q < 1` (Johnson, Kemp and Kotz):

- `z^X` is integrable iff `|qz| < 1` (`TauCeti.Probability.integrable_pow_logarithmicSeriesMeasure_iff`),
  and there the pgf is `log(1 − qz)/log(1 − q)` (`TauCeti.Probability.pgf_logarithmicSeriesMeasure`);
- `E[X] = −q/((1 − q) log(1 − q))` and `Var X = −q(q + log(1 − q))/((1 − q)² log(1 − q)²)`
  (`TauCeti.Probability.integral_id_map_cast_logarithmicSeriesMeasure`,
  `TauCeti.Probability.variance_id_map_cast_logarithmicSeriesMeasure`, and for a variable with this law
  `TauCeti.Probability.integral_of_hasLaw_map_cast_logarithmicSeriesMeasure`,
  `TauCeti.Probability.variance_of_hasLaw_map_cast_logarithmicSeriesMeasure`);
- `e^(tX)` is integrable iff `t < −log q`, so `D = (−∞, −log q)`
  (`TauCeti.Probability.integrable_exp_mul_id_map_cast_logarithmicSeriesMeasure_iff`,
  `TauCeti.Probability.integrableExpSet_id_map_cast_logarithmicSeriesMeasure`); on `D` the mgf is the pgf
  at `e^t`, `M(t) = log(1 − qe^t)/log(1 − q)`, with its logarithm as cgf
  (`TauCeti.Probability.mgf_id_map_cast_logarithmicSeriesMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_logarithmicSeriesMeasure`); the characteristic function is
  `Log(1 − qe^(it))/log(1 − q)` with the principal complex logarithm
  (`TauCeti.Probability.charFun_map_cast_logarithmicSeriesMeasure`), the principal branch being the
  right one because `Re(1 − qe^(it)) = 1 − q cos t ≥ 1 − q > 0`;
- the cdf is the cumulative sum of the masses
  (`TauCeti.Probability.logarithmicSeriesMeasure_real_Iic`,
  `TauCeti.Probability.logarithmicSeriesMeasure_real_Ioi`,
  `TauCeti.Probability.logarithmicSeriesMeasure_real_Iic_lt_one`,
  `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure`,
  `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure_of_lt_one`,
  `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure_lt_one`), the quantile its least crossing
  (`TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_succ_iff`,
  `TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_one_iff`), with limits `1` and `+∞`
  (`TauCeti.Probability.tendsto_quantile_map_cast_logarithmicSeriesMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_logarithmicSeriesMeasure_nhdsLT_one`);
- compound Poisson: for every `r ≥ 0`, the compound Poisson law of §7.5 with rate `−r log(1 − q)` and
  logarithmic-series jumps is the negative binomial law `NB(r, 1 − q)` of §3.9 (`NB(r, p)` is
  `TauCeti.Probability.negativeBinomialMeasure r p`, the number of failures before the `r`-th success
  with success probability `p`)
  (`TauCeti.Probability.compoundPoissonMeasure_logarithmicSeriesMeasure`), and so is the random sum
  `∑_(i<N) X_i` of independent logarithmic-series variables with an independent Poisson count `N` of
  that rate (`ProbabilityTheory.iIndepFun.hasLaw_sum_range_negativeBinomialMeasure`).

*Needs:* Mathlib `ProbabilityTheory.beta`, `ProbabilityTheory.poissonMeasure`, `Complex.log`; Tau Ceti
`TauCeti.Probability.compoundPoissonMeasure`, `TauCeti.Probability.negativeBinomialMeasure`,
`TauCeti.Probability.pgf`; §1.12, §3.9, §7.2, §7.5.

**Checks.**

- `ρ = 3`: `P(X = 1) = 3/4`, `E[X] = 3/2`, `Var X = 9/4`, and `P(X > 4) = 4B(4, 4) = 1/35`. For `ρ = 1`
  the masses are `1/(k(k + 1))` and `P(X > k) = 1/(k + 1)`, so the mean is infinite: the threshold
  `n < ρ` excludes `n = 1` at `ρ = 1`, while `n ≤ ρ` would not.
- `q = 1/2`: `P(X = 1) = 1/(2 log 2) ≈ 0.72135`, `E[X] = 1/log 2 ≈ 1.44270`, `Var X ≈ 0.80402` and
  `D = (−∞, log 2)`.
- Compound Poisson with `r = 2` and `q = 1/3`: the rate is `2 log(3/2)`, and as every jump is at least
  `1` the sum is `0` only when there is no jump, with probability `e^(−2 log(3/2)) = 4/9 = (2/3)²`, the
  mass of `NB(2, 2/3)` at `0`; the parameter `q` in place of `1 − q` would give `1/9`.
- At `t = 0` the characteristic function is `log(1 − q)/log(1 − q) = 1`, and `t ↦ 1 − qe^(it)` stays in
  the half-plane `Re ≥ 1 − q`, where the principal logarithm is continuous: no branch jump occurs as `t`
  runs over `ℝ`.

### 9.8 Discrete Laplace and Gaussian

**Discrete Laplace law.** For an integer center `m` and `0 ≤ q < 1`,
`TauCeti.Probability.discreteLaplaceMeasure m q` has mass `(1 − q) q^|k−m|/(1 + q)` at `k ∈ ℤ`
(`TauCeti.Probability.discreteLaplaceMeasure_real_singleton`,
`TauCeti.Probability.discreteLaplaceWeightReal_def`, `TauCeti.Probability.discreteLaplaceMeasure_eq_sum_dirac`);
`q = 0` gives `δ_m` (`TauCeti.Probability.discreteLaplaceMeasure_zero_right`) and every other `q` gives the
zero measure (`TauCeti.Probability.discreteLaplaceMeasure_eq_zero_of_invalid`). It is a probability
measure (`TauCeti.Probability.isProbabilityMeasure_discreteLaplaceMeasure`), with every integer of
positive mass and support `ℤ` when `q > 0` (`TauCeti.Probability.discreteLaplaceMeasure_singleton_pos`,
`TauCeti.Probability.support_discreteLaplaceMeasure`); integer translation shifts the center and
reflection negates it (`TauCeti.Probability.map_add_const_discreteLaplaceMeasure`,
`TauCeti.Probability.map_neg_discreteLaplaceMeasure`); it is measurable in `(m, q)`
(`TauCeti.Probability.measurable_discreteLaplaceMeasure`). It is a law on `ℤ`, not the continuous Laplace
law of §3.1: for `0 < q < 1` it is the restriction of the Laplace density with scale `b` to the
integers, renormalized, with `q = e^(−1/b)`. For `0 ≤ q < 1` (Johnson, Kemp and Kotz):

- every natural moment exists (`TauCeti.Probability.integrable_pow_intCast_discreteLaplaceMeasure`); the
  mean is `m` and the variance `2q/(1 − q)²` (`TauCeti.Probability.integral_intCast_discreteLaplaceMeasure`,
  `TauCeti.Probability.variance_intCast_discreteLaplaceMeasure`);
- `e^(tX)` is integrable iff `qe^t < 1` and `qe^(−t) < 1`
  (`TauCeti.Probability.integrable_exp_mul_intCast_discreteLaplaceMeasure_iff`), so for `0 < q < 1`,
  `D = {t : |t| < −log q}` (`TauCeti.Probability.integrableExpSet_intCast_discreteLaplaceMeasure`); there
  `M(t) = e^(mt)(1 − q)²/((1 − qe^t)(1 − qe^(−t)))` with its logarithm as cgf
  (`TauCeti.Probability.mgf_intCast_discreteLaplaceMeasure`,
  `TauCeti.Probability.cgf_intCast_discreteLaplaceMeasure`); the characteristic function is
  `e^(imt)(1 − q)²/((1 − qe^(it))(1 − qe^(−it)))`
  (`TauCeti.Probability.charFun_map_intCast_discreteLaplaceMeasure`);
- the integer cdf is `P(X ≤ k) = q^(m−k)/(1 + q)` for `k < m` and `1 − q^(k−m+1)/(1 + q)` for `k ≥ m`
  (`TauCeti.Probability.discreteLaplaceMeasure_real_Iic`,
  `TauCeti.Probability.discreteLaplaceMeasure_real_Iic_of_le`), and at a real `x` it is the integer cdf
  at `⌊x⌋` (`TauCeti.Probability.cdf_map_intCast_discreteLaplaceMeasure`); the quantile is its least
  crossing (`TauCeti.Probability.quantile_map_intCast_discreteLaplaceMeasure_eq_iff`), with `q = 0`
  separately, where it is `m` (`TauCeti.Probability.quantile_map_intCast_discreteLaplaceMeasure_zero`), and
  with limits `±∞` for `q > 0` and `m` for `q = 0`
  (`TauCeti.Probability.tendsto_quantile_map_intCast_discreteLaplaceMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_intCast_discreteLaplaceMeasure_nhdsLT_one`).

**Discrete Gaussian law.** For a real center `c` and a width `s > 0`,
`TauCeti.Probability.discreteGaussianMeasure c s` has mass `e^(−(k−c)²/(2s²))/Z(c, s)` at `k ∈ ℤ`, with
`Z` the lattice sum of §8.3 (`TauCeti.Probability.discreteGaussianMeasure_real_singleton`,
`TauCeti.Probability.discreteGaussianWeightReal_def`,
`TauCeti.Probability.discreteGaussianMeasure_eq_sum_dirac`); for `s ≤ 0` it is the zero measure
(`TauCeti.Probability.discreteGaussianMeasure_of_nonpos`), and it is a probability measure iff `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_discreteGaussianMeasure_iff`). It is measurable in `(c, s)`
(`TauCeti.Probability.measurable_discreteGaussianMeasure`). Like the discrete Laplace law, it is the
restriction of the density of `N(c, s²)` to the integers, renormalized. For `s > 0` (Canonne, Kamath and
Steinke 2020):

- every integer has positive mass and the support is `ℤ`
  (`TauCeti.Probability.discreteGaussianMeasure_singleton_pos`,
  `TauCeti.Probability.support_discreteGaussianMeasure`); translation by an integer `n` maps the law with
  center `c` to the law with center `c + n`, and `k ↦ −k` maps it to the law with center `−c`
  (`TauCeti.Probability.map_add_const_discreteGaussianMeasure`,
  `TauCeti.Probability.map_neg_discreteGaussianMeasure`);
- every natural moment exists and
  `E[Xⁿ] = ∑_k kⁿ e^(−(k−c)²/(2s²))/Z(c, s)`, a polynomially weighted lattice sum, which termwise
  differentiation in `c` (§8.3) produces from `Z`
  (`TauCeti.Probability.integrable_pow_intCast_discreteGaussianMeasure`,
  `TauCeti.Probability.integral_pow_intCast_discreteGaussianMeasure`);
- `D = ℝ` (`TauCeti.Probability.integrable_exp_mul_intCast_discreteGaussianMeasure`,
  `TauCeti.Probability.integrableExpSet_intCast_discreteGaussianMeasure`) and
  `M(t) = e^(ct + s²t²/2) Z(c + s²t, s)/Z(c, s)`, with its logarithm as cgf
  (`TauCeti.Probability.mgf_intCast_discreteGaussianMeasure`,
  `TauCeti.Probability.cgf_intCast_discreteGaussianMeasure`); hence `E[X] = c + s² ∂_c log Z(c, s)` and
  `Var X = s² + s⁴ ∂²_c log Z(c, s)` (`TauCeti.Probability.integral_intCast_discreteGaussianMeasure`,
  `TauCeti.Probability.variance_intCast_discreteGaussianMeasure`). The center and the width need not be
  the mean and the standard deviation; if `2c` is an integer, reflection gives `E[X] = c`
  (`TauCeti.Probability.integral_intCast_discreteGaussianMeasure_of_two_mul_eq_intCast`);
- with `w_k` the mass at `k`, the characteristic function is the convergent series `∑_k w_k e^(itk)`
  (`TauCeti.Probability.hasSum_charFun_map_intCast_discreteGaussianMeasure`), and the cdf the convergent
  series of the masses over `n ≤ ⌊x⌋` (`TauCeti.Probability.hasSum_discreteGaussianMeasure_real_Iic`,
  `TauCeti.Probability.discreteGaussianMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_intCast_discreteGaussianMeasure`), strictly between `0` and `1`
  (`TauCeti.Probability.discreteGaussianMeasure_real_Iic_pos`,
  `TauCeti.Probability.discreteGaussianMeasure_real_Iic_lt_one`); the quantile is its least crossing
  (`TauCeti.Probability.quantile_map_intCast_discreteGaussianMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_intCast_discreteGaussianMeasure_eq_iff_lt_le`), with limits `−∞` and
  `+∞` (`TauCeti.Probability.tendsto_quantile_map_intCast_discreteGaussianMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_intCast_discreteGaussianMeasure_nhdsLT_one`).

These are measures on `ℤ`; sampling procedures for them and privacy guarantees built on them are not
part of this roadmap.

*Needs:* §8.3 (Tau Ceti `Real.gaussianLatticeSum`, `Real.hasDerivAt_tsum_pow_mul_exp_neg_sub_sq`), §7.2;
§3.1 and §1.10 for the comparison with the continuous laws only.

**Checks.**

- `m = 0`, `q = 1/2`: the masses are `(1/3)(1/2)^|k|`, so `P(X = 0) = 1/3` and the variance is
  `4 = 2 · (1/2)/(1/2)²`; `F(−1) = (1/2)/(3/2) = 1/3` and `F(0) = 1 − (1/2)/(3/2) = 2/3`, so `Q(1/2) = 0`.
  Dropping the `+1` in the exponent for `k ≥ m` would give `F(0) = 1/3` and `Q(1/2) = 1`. At
  `t = log(3/2)`, `M(t) = (1/4)/((1 − 3/4)(1 − 1/3)) = 3/2`, equal to the direct sum `(1/3)(4 + 1/2)`.
- Discrete Gaussian with `c = 0`, `s = 1/2`: the variance is `≈ 0.21501`, below `s² = 0.25`, so the
  width is not the standard deviation; `s² + s⁴ ∂²_c log Z` gives the same value. At `c = 1/2`, `s = 1`
  the mean is exactly `1/2` by reflection, while at `c = 0.3`, `s = 1/2` it is `≈ 0.27842 ≠ c`.
- For `c = 0.3`, `s = 1/2`, `t = 0.7`, the mass series and `e^(ct + s²t²/2) Z(c + s²t, s)/Z(c, s)` both
  give `M(t) ≈ 1.29874`.

### 9.9 Negative multinomial

For a finite type `ι` of categories, a shape `r`, a success weight `p₀ > 0` and weights
`p : ι → ℝ≥0` with `p₀ + ∑ᵢ pᵢ = 1`, `TauCeti.Probability.negativeMultinomialMeasure r p₀ p` is, for
`r > 0`, the mixture of independent Poisson counts with rates `pᵢΛ` against `Λ ~ Gamma(r, p₀)` (shape `r`,
rate `p₀`), through the rate map `Λ ↦ pᵢ · max(Λ, 0)`, defined and measurable on all of `ℝ`
(`TauCeti.Probability.negativeMultinomialMeasure_of_pos`). Valid weights with `r = 0` give `δ₀`
(`TauCeti.Probability.negativeMultinomialMeasure_zero`), and invalid weights or `r < 0` give the zero
measure (`TauCeti.Probability.negativeMultinomialMeasure_eq_zero_of_invalid`); the family is measurable
in `(r, p₀, p)` (`TauCeti.Probability.measurable_negativeMultinomialMeasure`). For `r ≥ 0` and valid
weights:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_negativeMultinomialMeasure`);
  for `r > 0` the mass at `k` is `Γ(r + K)/(Γ(r) ∏ᵢ kᵢ!) · p₀^r ∏ᵢ pᵢ^(kᵢ)` with `K = ∑ᵢ kᵢ`, and for `r = 0`
  it is `1` at `k = 0` and `0` elsewhere (`TauCeti.Probability.negativeMultinomialMeasure_real_singleton`,
  `TauCeti.Probability.negativeMultinomialWeightReal_of_ne_zero`,
  `TauCeti.Probability.negativeMultinomialWeightReal_zero`); it is the corresponding sum of Dirac
  measures (`TauCeti.Probability.negativeMultinomialMeasure_eq_sum_dirac`), its support is `{0}` for
  `r = 0` and the set of `k` with `kᵢ = 0` whenever `pᵢ = 0` for `r > 0`
  (`TauCeti.Probability.negativeMultinomialMeasure_singleton_ne_zero_iff`), and `p₀ = 1` gives `δ₀`
  (`TauCeti.Probability.negativeMultinomialMeasure_eq_dirac_of_successWeight_eq_one`);
- moments: `E[Xᵢ] = rpᵢ/p₀` and `Cov(Xᵢ, Xⱼ) = δᵢⱼ rpᵢ/p₀ + rpᵢpⱼ/p₀²`
  (`TauCeti.Probability.integral_cast_apply_negativeMultinomialMeasure`,
  `TauCeti.Probability.integral_mul_cast_apply_negativeMultinomialMeasure`,
  `TauCeti.Probability.covariance_cast_apply_negativeMultinomialMeasure`,
  `TauCeti.Probability.variance_cast_apply_negativeMultinomialMeasure`); on the Euclidean carrier the law
  is square integrable with mean `rp/p₀` and covariance matrix `diag(rp/p₀) + (r/p₀²)ppᵀ`
  (`TauCeti.Probability.memLp_cast_apply_negativeMultinomialMeasure`,
  `TauCeti.Probability.memLp_id_map_multinomialToEuclidean_negativeMultinomialMeasure`,
  `TauCeti.Probability.integral_id_map_multinomialToEuclidean_negativeMultinomialMeasure`,
  `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_negativeMultinomialMeasure`,
  `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_negativeMultinomialMeasure`);
- falling-factorial moments (Ouimet 2022): for every `n : ι → ℕ` with `N = ∑ᵢ nᵢ`,
  `E[∏ᵢ Xᵢ(Xᵢ − 1)⋯(Xᵢ − nᵢ + 1)] = r(r + 1)⋯(r + N − 1) ∏ᵢ (pᵢ/p₀)^(nᵢ)`, the integrand being integrable,
  for every `r ≥ 0`, the empty product `1` at `N = 0` and the value `0` at `r = 0 < N` included
  (`TauCeti.Probability.integrable_prod_descFactorial_negativeMultinomialMeasure`,
  `TauCeti.Probability.integral_prod_descFactorial_negativeMultinomialMeasure`); every natural mixed
  moment `E[∏ᵢ Xᵢ^(nᵢ)]` follows, through Stirling numbers of the second kind
  (`TauCeti.Probability.integrable_prod_pow_negativeMultinomialMeasure`,
  `TauCeti.Probability.integral_prod_pow_negativeMultinomialMeasure`);
- transforms: for real `θ : ι → ℝ` and `Y = ∑ᵢ θᵢXᵢ` after casting to `ℝ`, `e^(tY)` is integrable iff
  `r = 0` or `∑ᵢ pᵢe^(tθᵢ) < 1`
  (`TauCeti.Probability.integrable_exp_mul_sum_mul_natCast_negativeMultinomialMeasure_iff`,
  `TauCeti.Probability.integrableExpSet_sum_mul_natCast_negativeMultinomialMeasure`), and there
  `M_Y(t) = (p₀/(1 − ∑ᵢ pᵢe^(tθᵢ)))^r` with cgf `r log(p₀/(1 − ∑ᵢ pᵢe^(tθᵢ)))`
  (`TauCeti.Probability.mgf_sum_mul_natCast_negativeMultinomialMeasure`,
  `TauCeti.Probability.cgf_sum_mul_natCast_negativeMultinomialMeasure`); at `r = 0`, `M = 1` on `ℝ`. The
  vector characteristic function is `(p₀/(1 − ∑ᵢ pᵢe^(itᵢ)))^r` with the principal complex power
  (`TauCeti.Probability.charFun_map_multinomialToEuclidean_negativeMultinomialMeasure`); its denominator
  has positive real part, `Re(1 − ∑ᵢ pᵢe^(itᵢ)) ≥ 1 − ∑ᵢ pᵢ = p₀`;
- aggregation along any `f : ι → κ` gives the negative multinomial law with the weights summed over the
  fibres (`TauCeti.Probability.map_funOnFinite_map_negativeMultinomialMeasure`,
  `ProbabilityTheory.HasLaw.funOnFinite_map_negativeMultinomialMeasure`); the marginal `Xᵢ` has the
  negative binomial law `NB(r, p₀/(p₀ + pᵢ))` of §3.9 and the total `∑ᵢ Xᵢ` the law `NB(r, p₀)`
  (`TauCeti.Probability.map_eval_negativeMultinomialMeasure`,
  `TauCeti.Probability.map_sum_negativeMultinomialMeasure`,
  `ProbabilityTheory.HasLaw.eval_negativeMultinomialMeasure`,
  `ProbabilityTheory.HasLaw.sum_negativeMultinomialMeasure`); at fixed weights, convolution adds shapes,
  for all `r, s ≥ 0` (`TauCeti.Probability.negativeMultinomialMeasure_conv_negativeMultinomialMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_add_negativeMultinomialMeasure`);
- marginal quantiles: by the marginal laws, the quantile of the real cast of `Xᵢ` is the least crossing
  of the cumulative sums of `NB(r, p₀/(p₀ + pᵢ))`, and that of `∑ᵢ Xᵢ` the least crossing for
  `NB(r, p₀)` (`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_eq_iff` for `r > 0`, and
  `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_zero`,
  `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_one` for the Dirac cases).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.poissonMeasure`,
`MeasureTheory.Measure.pi`, `MeasureTheory.Measure.bind`, `Complex.cpow`; Tau Ceti
`TauCeti.Probability.negativeBinomialMeasure`, `TauCeti.Probability.multinomialToEuclidean`,
`TauCeti.covMatrix`; §1.4, §1.6, §3.9, §4.5, §5.1, §7.2, §7.4.

**Checks.**

- With one category and `p₁ = 1 − p₀`, both the marginal and the total are `NB(r, p₀)`; for `r = 1` and
  `p₀ = 1/2` the masses `Γ(1 + k)/k! · (1/2)(1/2)^k = (1/2)^(k+1)` are the geometric masses. A
  coordinate with `pᵢ = 0` has the law `NB(r, 1) = δ₀`, the Dirac law at `0`.
- `r = 1`, `p₀ = 1/2`, `p = (1/4, 1/4)`: `E[X₁] = 1/2`, `Var X₁ = 3/4`, which is the variance
  `(1/3)/(2/3)²` of the marginal `NB(1, 2/3)`, and `Cov(X₁, X₂) = 1/4 > 0`: negative multinomial counts
  are positively correlated, unlike multinomial counts, whose covariance has the opposite sign. With
  `θ = (1, 1)` the mgf domain `e^t/2 < 1` is `t < log 2`, the domain of `NB(1, 1/2)`.

### 9.10 Beta-negative-binomial

For `r ≥ 0` and `a, b > 0`, the beta-negative-binomial law `BNB(r, a, b)`,
`TauCeti.Probability.betaNegativeBinomialMeasure r a b`, is the mixture of
the negative binomial law `NB(r, p)` of §3.9 against `p ~ Beta(a, b)`
(`TauCeti.Probability.betaNegativeBinomialMeasure_eq_bind`); every other parameter value gives the zero
measure (`TauCeti.Probability.betaNegativeBinomialMeasure_eq_zero_of_invalid`), and the family is
measurable in `(r, a, b)` (`TauCeti.Probability.measurable_betaNegativeBinomialMeasure`). At `r = 0` it is
`δ₀` (`TauCeti.Probability.betaNegativeBinomialMeasure_zero`), with the masses, moments and `D = ℝ` of a
Dirac law. For `r > 0` the mass at `k` is `Γ(r + k)/(Γ(r) k!) · B(a + r, b + k)/B(a, b)`, positive at
every `k` (`TauCeti.Probability.betaNegativeBinomialMeasure_real_singleton`,
`TauCeti.Probability.betaNegativeBinomialWeightReal_of_ne_zero`,
`TauCeti.Probability.betaNegativeBinomialWeightReal_pos_of_pos`) (SciPy beta-negative-binomial
documentation for the convention). For `r ≥ 0` and `a, b > 0`:

- it is a probability measure, its masses sum to `1`, it is the corresponding sum of Dirac measures, and
  the mass at `k` is positive iff `k = 0` or `r > 0`
  (`TauCeti.Probability.isProbabilityMeasure_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.hasSum_betaNegativeBinomialWeightReal`,
  `TauCeti.Probability.betaNegativeBinomialMeasure_eq_sum_dirac`,
  `TauCeti.Probability.betaNegativeBinomialMeasure_singleton_ne_zero_iff`);
- `D = ℝ` for `r = 0` and `D = (−∞, 0]` for `r > 0`
  (`TauCeti.Probability.integrableExpSet_id_map_cast_betaNegativeBinomialMeasure`);
- moments: for natural `j`, both `x^j` and the falling factorial `X(X − 1)⋯(X − j + 1)` are integrable
  iff `r = 0` or `j < a` (`TauCeti.Probability.integrable_pow_map_cast_betaNegativeBinomialMeasure_iff`,
  `TauCeti.Probability.integrable_descFactorial_betaNegativeBinomialMeasure_iff`), so for `r > 0` and
  `j > 0` integrability is exactly `j < a`; then the factorial moment is
  `r(r + 1)⋯(r + j − 1) B(a − j, b + j)/B(a, b)`, which is `1` at `j = 0`
  (`TauCeti.Probability.integral_descFactorial_betaNegativeBinomialMeasure`); the mean exists iff
  `r = 0` or `a > 1` and is `rb/(a − 1)`, the second moment exists iff `r = 0` or `a > 2` and the
  variance is `rb(a + b − 1)(a + r − 1)/((a − 1)²(a − 2))`
  (`TauCeti.Probability.integrable_id_map_cast_betaNegativeBinomialMeasure_iff`,
  `TauCeti.Probability.integral_id_map_cast_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.memLp_two_id_map_cast_betaNegativeBinomialMeasure_iff`,
  `TauCeti.Probability.integral_sq_id_map_cast_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.variance_id_map_cast_betaNegativeBinomialMeasure`, and for a variable with this
  law `TauCeti.Probability.integral_of_hasLaw_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.variance_of_hasLaw_betaNegativeBinomialMeasure`);
- the cdf is the convergent cumulative sum of the masses
  (`TauCeti.Probability.betaNegativeBinomialMeasure_real_Iic`,
  `TauCeti.Probability.cdf_map_cast_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.cdf_map_cast_betaNegativeBinomialMeasure_of_neg`, and below `1` for `r > 0`,
  `TauCeti.Probability.betaNegativeBinomialMeasure_real_Iic_lt_one`), the quantile its least crossing
  (`TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_eq_zero_iff`,
  `TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_zero`), with limits `0` and `+∞`
  (`0` for `r = 0`) (`TauCeti.Probability.tendsto_quantile_map_cast_betaNegativeBinomialMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_cast_betaNegativeBinomialMeasure_nhdsLT_one`);
- transforms are series in the masses `w_k`, with no hypergeometric special function: the pgf is
  `∑_k w_k z^k` for `|z| ≤ 1` (`TauCeti.Probability.hasSum_pgf_betaNegativeBinomialMeasure`), the mgf
  on `D` is
  `∑_k w_k e^(tk)` with its logarithm as cgf
  (`TauCeti.Probability.hasSum_mgf_id_map_cast_betaNegativeBinomialMeasure`,
  `TauCeti.Probability.cgf_id_map_cast_betaNegativeBinomialMeasure`), and the characteristic function is
  `∑_k w_k e^(itk)` (`TauCeti.Probability.hasSum_charFun_map_cast_betaNegativeBinomialMeasure`); these
  series converge absolutely, as a real or complex series has a sum in this unconditional sense exactly
  when it converges absolutely;
- for `ρ > 0`, the law `BNB(1, ρ, 1)` shifted by `k ↦ k + 1` is the Yule–Simon law
  of §9.7 on `ℕ` (`TauCeti.Probability.map_succ_betaNegativeBinomialMeasure`, stated with `Nat.succ`, and
  for a variable with this law `ProbabilityTheory.HasLaw.succ_yuleSimonMeasure`).

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.beta`, `Real.Gamma`,
`MeasureTheory.Measure.bind`; Tau Ceti `TauCeti.Probability.negativeBinomialMeasure`,
`TauCeti.Probability.pgf`; §1.7, §1.12, §3.9, §7.2, §7.4, §9.7.

**Checks.**

- Factorial moments by conditioning: given `p`, `NB(r, p)` has factorial moment
  `r(r + 1)⋯(r + j − 1)((1 − p)/p)^j`, and integrating `((1 − p)/p)^j` against `Beta(a, b)` gives
  `B(a − j, b + j)/B(a, b)`, so conditional integration reproduces the stated factorial moment. For
  `r = 2`, `a = 4`, `b = 3`: `E[X] = 2 · 3/3 = 2` and `E[X(X − 1)] = 6 B(2, 5)/B(4, 3) = 6 · (1/30)/(1/60) = 12`,
  so `Var X = 12 + 2 − 4 = 10 = 2 · 3 · 6 · 5/(3² · 2)`; summing the masses numerically gives the same
  values.
- `r = 1`, `a = b = 1`: the masses are `1/((k + 1)(k + 2))` and `P(X ≥ k) = 1/(k + 1)`, so the mean is
  infinite, in accordance with the threshold `1 < a`, which fails.
- `ρ = 5/2`: the masses of `BNB(1, ρ, 1)` at `0, 1, 2` are `5/7 ≈ 0.71429`,
  `≈ 0.15873`, `≈ 0.05772`, which are the Yule–Simon masses `ρB(k, ρ + 1)` at `k = 1, 2, 3`.

### 9.11 Non-identical order statistics

Let `X₁, …, Xₙ` be independent real random variables with laws `μᵢ` and cdfs `Fᵢ`. The number of
coordinates at most `x` has the Poisson-binomial law of §9.4 with parameters `Fᵢ(x)`
(`ProbabilityTheory.iIndepFun.hasLaw_card_filter_mem`). With the sorting of §4.6
(`TauCeti.orderStatistic`, positions counted from `0`, repeated values kept with their multiplicity), the
order statistic in position `k` is at most `x` iff more than `k` coordinates are at most `x`; in the
counting from `1` of §4.6, the `k`-th smallest is at most `x` iff at least `k` coordinates are. Hence,
for every `k` and `x` and with no continuity or identical-distribution hypothesis, so with ties and
atoms allowed, the cdf of the order statistic in position `k` is the Poisson-binomial tail
`PB(F₁(x), …, Fₙ(x))((k, ∞))` (`TauCeti.Probability.cdf_map_orderStatistic_pi_eq_poissonBinomial`),
equal to the finite sum of the Poisson-binomial weights of the index sets of more than `k` elements
(`TauCeti.Probability.cdf_map_orderStatistic_pi_eq_sum`), and likewise for independent variables with
these laws (`TauCeti.Probability.measureReal_setOf_orderStatistic_le_indep`). For identical laws `μ`,
`PB(F, …, F)` is the binomial law with `n` trials and success probability `F`
(`TauCeti.Probability.poissonBinomialMeasure_const`), and the formula
becomes the iid formula `∑_(j=k+1)^n C(n, j) F^j (1 − F)^(n−j)` of §4.6
(`TauCeti.Probability.cdf_map_orderStatistic_pi`).

*Needs:* §4.6 (Tau Ceti `TauCeti.orderStatistic`), §9.4; Mathlib `ProbabilityTheory.cdf`,
`MeasureTheory.Measure.pi`, `ProbabilityTheory.iIndepFun`.

**Checks.**

- `X₁` uniform on `[0, 1]` and `X₂` uniform on `[0, 2]`, at `x = 1/2`: `F₁ = 1/2`, `F₂ = 1/4`. The minimum
  has cdf `P(count ≥ 1) = 1 − (1/2)(3/4) = 5/8` and the maximum `P(count = 2) = 1/8`, the extremes
  `1 − ∏ᵢ(1 − Fᵢ)` and `∏ᵢ Fᵢ` of §4.6.
- Both laws `δ₀`: at `x = 0` the count is `2`, so both order statistics have cdf `1` at `0`; counting the
  coordinates strictly below `x` would give `0`, which is wrong for atoms.

### Examples

- The fair die, the uniform law on `{1, …, 6}`, has `Q(1/2) = 3`, `M(log 2) = 21` and, after translation
  to `{0, …, 5}`, the pgf `(z⁶ − 1)/(6(z − 1))`.
- `BetaBin(n, 1, 1)` is the uniform law on `{0, …, n}`, and `BetaBin(2, 1, 2)` is the first coordinate of
  the Dirichlet-multinomial law with `α = (1, 1, 1)` and `n = 2`.
- The Yule–Simon law with `ρ = 1` has `P(X > k) = 1/(k + 1)`; it is `BNB(1, 1, 1)` shifted by one.
- `Skellam(λ, 0)` is `Poisson(λ)` on `ℤ`, and `Skellam(λ, λ)` is symmetric with `M(t) = exp(2λ(cosh t − 1))`.
- The discrete Gaussian with `c = 1/2` and `s = 1` has mean exactly `1/2` and variance `≈ 1 + 2 · 10⁻⁷`,
  the correction `s⁴ ∂²_c log Z` being of order `e^(−2π²)`.

### Dependencies

Layer 9 uses Layers 7 and 8 and the Beta, multinomial, Dirichlet and hypergeometric laws: §1.2
(Bernoulli and binomial), §1.4 (Poisson), §1.6 (Gamma), §1.7 (Beta), §1.12 (pgf), §3.9 (negative
binomial), §3.10 (hypergeometric), §4.5 (Gamma-mixed Poisson), §4.6 (order statistics), §5.1
(covariance matrices), §5.5 (multinomial), §5.6 (Dirichlet), §7.2 (quantiles), §7.3 (conditioning),
§7.4 (mixtures), §7.5 (compound Poisson) and §8.3 (zeta values and the Gaussian lattice sum). In
Mathlib: the uniform, Bernoulli, binomial, Poisson, Gamma and Beta measures, `MeasureTheory.Measure.bind`,
product measures, total variation and the Riemann zeta function. In Tau Ceti: the family directories
under `Probability/Distributions` (categorical, uniform, Rademacher, beta-binomial,
Dirichlet-multinomial, multivariate and negative hypergeometric, Poisson-binomial, Skellam, Zipf,
Yule–Simon, logarithmic series, discrete Laplace and Gaussian, negative multinomial,
beta-negative-binomial, order statistics), `Probability/Quantile/Discrete`,
`Probability/GeneratingFunction` and `Data/Finset/SuccessPositions`.

## Layer 10: scalar continuous and noncentral families

This layer adds the remaining scalar continuous families on `ℝ`. Sections 10.1–10.10 cover the
logistic and extreme-value laws, the generalized Pareto law, the laws of Gaussian radii and of
noncentral quadratic forms (chi, Nakagami, noncentral chi-squared, chi, t and F), the beta prime and
Lévy laws, the inverse Gaussian law, truncated and skew-normal laws, and sums of uniforms with the
bounded elementary laws; the families after them follow in §10.11–§10.20. Throughout the layer:

- Unless a section says otherwise, a law at invalid parameters is the zero measure and its densities
  are zero. Densities vanish off the open support displayed in the section, and the endpoint
  convention chosen for a density creates no atom.
- Quantile statements assume valid parameters and `0 < u < 1`; behaviour at the ends of `(0, 1)` is
  stated as one-sided limits (§7.2). Where a quantile has no closed form it is characterized as a
  root of the cdf, and that characterization consists of existence, uniqueness on the interior of
  the support, continuity in `u` on `(0, 1)`, and the one-sided limits at `0` and `1`.
- Natural moments include order zero, and every threshold stated for a moment or for `D` is sharp:
  integrability holds exactly in the stated range.
- Every law carries the interface of Conventions 2 (probability on the valid parameters, the density
  interface on its absolutely continuous range, measurability in the parameters), whose
  declarations each section names.
- The noncentral laws are Poisson mixtures, `MeasureTheory.Measure.bind` of
  `ProbabilityTheory.poissonMeasure` against central laws of Layer 3, not constructions through
  other discrete families.

### 10.1 Logistic

For `m ∈ ℝ` and `s > 0` the logistic law with location `m` and scale `s` is
`TauCeti.Probability.logisticMeasure m s`, the image of the unit uniform law
`TauCeti.Probability.uniformMeasure 0 1` under `u ↦ m + s log(u/(1 − u))`
(`TauCeti.Probability.logisticMeasure_of_pos`); for `s ≤ 0` it is the zero measure
(`TauCeti.Probability.logisticMeasure_of_nonpos`) (Johnson, Kotz and Balakrishnan, vol. 2). For
`s > 0` it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_logisticMeasure`),
and if `U` has the unit uniform law then `m + s log(U/(1 − U))` has the logistic law
(`TauCeti.Probability.hasLaw_logisticMeasure_of_hasLaw_uniformMeasure`). Write `y = (x − m)/s`. For
`s > 0`:

- `f(x) = e^(−y)/(s(1 + e^(−y))²)`, positive everywhere
  (`TauCeti.Probability.logisticPDFReal_of_pos`, `TauCeti.Probability.logisticPDFReal_pos`); the
  density interface is `TauCeti.Probability.logisticPDFReal`, `TauCeti.Probability.logisticPDF`,
  `TauCeti.Probability.logisticMeasure_eq_withDensity` (at every parameter),
  `TauCeti.Probability.hasPDF_of_hasLaw_logisticMeasure` and
  `TauCeti.Probability.rnDeriv_logisticMeasure`;
- `F(x) = (1 + e^(−y))⁻¹`, Mathlib's `Real.sigmoid y` (`TauCeti.Probability.cdf_logisticMeasure_eq`),
  continuous and strictly increasing (`TauCeti.Probability.continuous_cdf_logisticMeasure`,
  `TauCeti.Probability.strictMono_cdf_logisticMeasure`), with topological support `ℝ`
  (`TauCeti.Probability.support_logisticMeasure`);
- `Q(u) = m + s log(u/(1 − u))` (`TauCeti.Probability.quantile_logisticMeasure`), tending to `−∞`
  at `0` and to `+∞` at `1` (`TauCeti.Probability.tendsto_quantile_logisticMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_logisticMeasure_nhdsLT_one`);
- every natural moment is finite (`TauCeti.Probability.integrable_pow_logisticMeasure`), `E X = m`
  and `Var X = π²s²/3` (`TauCeti.Probability.integral_id_logisticMeasure`,
  `TauCeti.Probability.variance_id_logisticMeasure`);
- `D = (−1/s, 1/s)` (`TauCeti.Probability.integrableExpSet_id_logisticMeasure`), and on `D`,
  `M(t) = e^(mt) Γ(1 − st) Γ(1 + st)` and `K(t) = mt + log Γ(1 − st) + log Γ(1 + st)`
  (`TauCeti.Probability.mgf_id_logisticMeasure`, `TauCeti.Probability.cgf_id_logisticMeasure`);
- `φ(t) = e^(imt) πst/sinh(πst)` for `t ≠ 0`, and `φ(0) = 1`
  (`TauCeti.Probability.charFun_logisticMeasure`,
  `TauCeti.Probability.charFun_logisticMeasure_zero`);
- the family is measurable in `(m, s)` (`TauCeti.Probability.measurable_logisticMeasure`).

The construction of the logistic law as a difference of independent Gumbel variables is stated in
§10.2, after the Gumbel law.

*Needs:* Tau Ceti `TauCeti.Probability.uniformMeasure`; Mathlib `Real.sigmoid`, `Real.Gamma`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`, `ProbabilityTheory.integrableExpSet`,
`MeasureTheory.charFun`; §0.3, §7.2.

**Checks.**

- At `m = 0`, `s = 1`: `F(log 3) = 3/4`, `Q(3/4) = log 3`, and `Var X = π²/3 ≈ 3.29`, not `1`: `s`
  is a scale, not the standard deviation.
- Since `Γ(1 − z)Γ(1 + z) = πz/sin(πz)`, at `m = 0`, `s = 1` the mgf gives `M(1/2) = π/2`, and the
  passage from `M` to `φ` turns `sin` into `sinh`; a characteristic function written with `sin`
  would have poles at the points `t = k/s`, `k ≠ 0` an integer.

### 10.2 Gumbel and generalized extreme value

**Gumbel.** For `m ∈ ℝ` and `s > 0` the Gumbel law in the maximum convention, written
`Gumbel(m, s)`, is `TauCeti.Probability.gumbelMeasure m s`, the law of `m − s log E` for `E` with the
standard exponential law `Exp(1)`, Mathlib's `ProbabilityTheory.expMeasure 1`
(`TauCeti.Probability.gumbelMeasure_of_pos`,
`TauCeti.Probability.hasLaw_gumbelMeasure_of_hasLaw_expMeasure`); it is the zero measure for `s ≤ 0`
(`TauCeti.Probability.gumbelMeasure_of_nonpos`) and a probability measure for `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_gumbelMeasure`) (Johnson, Kotz and Balakrishnan, vol. 2).
For `s > 0`, with `y = (x − m)/s` and Euler's constant `γ`, Mathlib's
`Real.eulerMascheroniConstant`:

- `f(x) = e^(−y) exp(−e^(−y))/s` (`TauCeti.Probability.gumbelPDFReal_of_pos`), with
  `TauCeti.Probability.gumbelPDF`, `TauCeti.Probability.gumbelMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_gumbelMeasure` and `TauCeti.Probability.rnDeriv_gumbelMeasure`;
- `F(x) = exp(−e^(−y))` (`TauCeti.Probability.cdf_gumbelMeasure_eq`), strictly increasing, with
  support `ℝ` (`TauCeti.Probability.strictMono_cdf_gumbelMeasure`,
  `TauCeti.Probability.support_gumbelMeasure`);
- `Q(u) = m − s log(−log u)` (`TauCeti.Probability.quantile_gumbelMeasure`), with limits `−∞` at `0`
  and `+∞` at `1` (`TauCeti.Probability.tendsto_quantile_gumbelMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_gumbelMeasure_nhdsLT_one`);
- every moment is finite (`TauCeti.Probability.memLp_id_gumbelMeasure`), `E X = m + sγ` and
  `Var X = π²s²/6` (`TauCeti.Probability.integral_id_gumbelMeasure`,
  `TauCeti.Probability.variance_id_gumbelMeasure`);
- `D = (−∞, 1/s)` (`TauCeti.Probability.integrableExpSet_id_gumbelMeasure`), with
  `M(t) = e^(mt) Γ(1 − st)` and `K(t) = mt + log Γ(1 − st)` on `D`
  (`TauCeti.Probability.mgf_id_gumbelMeasure`, `TauCeti.Probability.cgf_id_gumbelMeasure`), and
  `φ(t) = e^(imt) Γ(1 − ist)` with Mathlib's `Complex.Gamma`
  (`TauCeti.Probability.charFun_gumbelMeasure`);
- the family is measurable in `(m, s)` (`TauCeti.Probability.measurable_gumbelMeasure`).

The minimum-convention Gumbel law is the reflection of `Gumbel(m, s)`, its image under
`x ↦ −x` (Mathlib's `MeasureTheory.Measure.neg`), which is the law of `−m + s log E`
(`TauCeti.Probability.gumbelMeasure_map_neg`,
`TauCeti.Probability.hasLaw_neg_gumbelMeasure_of_hasLaw_expMeasure`); its cdf is
`1 − exp(−e^((x + m)/s))` and its quantile `−m + s log(−log(1 − u))`, the reflection bridge of §7.2
specialized (`TauCeti.Probability.cdf_neg_gumbelMeasure_eq`,
`TauCeti.Probability.quantile_neg_gumbelMeasure`). For a nonempty finite index type of cardinality
`n`, the maximum of `n` independent `Gumbel(m, s)` variables has law `Gumbel(m + s log n, s)`
(`TauCeti.Probability.map_max_pi_gumbelMeasure`, `TauCeti.Probability.hasLaw_max_iid_gumbelMeasure`).
For `s > 0` and any `m₁, m₂ ∈ ℝ`, if `X` and `Y` are independent with laws `Gumbel(m₁, s)` and
`Gumbel(m₂, s)`, then `X − Y` has the logistic law with location `m₁ − m₂` and scale `s` (§10.1)
(`TauCeti.Probability.map_sub_prod_gumbelMeasure`,
`ProbabilityTheory.IndepFun.hasLaw_sub_gumbelMeasure`).

**Generalized extreme value.** For `m ∈ ℝ`, `s > 0` and `ξ ∈ ℝ`, in Coles's maximum convention
(whose shape is the negative of the shape parameter of SciPy's genextreme), the GEV law
`GEV(m, s, ξ)` is `TauCeti.Probability.generalizedExtremeValueMeasure m s ξ`, the law of
`m + s(E^(−ξ) − 1)/ξ` for `ξ ≠ 0` and `E` with law `Exp(1)`
(`TauCeti.Probability.generalizedExtremeValueMeasure_of_shape_ne_zero`,
`TauCeti.Probability.hasLaw_generalizedExtremeValueMeasure_of_hasLaw_expMeasure_of_shape_ne_zero`),
and is `Gumbel(m, s)` at `ξ = 0` (`TauCeti.Probability.generalizedExtremeValueMeasure_zero`);
it is the zero measure for `s ≤ 0` (`TauCeti.Probability.generalizedExtremeValueMeasure_of_nonpos`)
and a probability measure for `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_generalizedExtremeValueMeasure`) (Coles 2001). For
`s > 0`, with `y = (x − m)/s`:

- for `ξ ≠ 0`, `f(x) = (1 + ξy)^(−1/ξ − 1) exp(−(1 + ξy)^(−1/ξ))/s` where `1 + ξy > 0`, and `f(x) = 0`
  where `1 + ξy ≤ 0` (`TauCeti.Probability.generalizedExtremeValuePDFReal_of_shape_ne_zero`,
  `TauCeti.Probability.generalizedExtremeValuePDFReal_of_shape_ne_zero_of_not_pos`); at `ξ = 0` it is
  the Gumbel density (`TauCeti.Probability.generalizedExtremeValuePDFReal_zero`); the density
  interface is `TauCeti.Probability.generalizedExtremeValueMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_generalizedExtremeValueMeasure` and
  `TauCeti.Probability.rnDeriv_generalizedExtremeValueMeasure`;
- for `ξ ≠ 0`, `F(x) = exp(−(1 + ξy)^(−1/ξ))` where `1 + ξy > 0`; beyond the finite boundary point
  `m − s/ξ`, `F = 0` if `ξ > 0` and `F = 1` if `ξ < 0`
  (`TauCeti.Probability.cdf_generalizedExtremeValueMeasure_eq`); the support is `[m − s/ξ, ∞)` for
  `ξ > 0`, `(−∞, m − s/ξ]` for `ξ < 0` and `ℝ` for `ξ = 0`
  (`TauCeti.Probability.support_generalizedExtremeValueMeasure`);
- `Q(u) = m + s((−log u)^(−ξ) − 1)/ξ` for `ξ ≠ 0`, and the Gumbel quantile at `ξ = 0`
  (`TauCeti.Probability.quantile_generalizedExtremeValueMeasure`), continuous on `(0, 1)`
  (`TauCeti.Probability.continuousOn_quantile_generalizedExtremeValueMeasure`), with one-sided
  limits `m − s/ξ` or `∓∞` according to the sign of `ξ`
  (`TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsGT_zero_of_shape_pos`,
  `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsGT_zero_of_shape_neg`,
  `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsLT_one_of_shape_pos`,
  `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsLT_one_of_shape_neg`,
  `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_zero_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_zero_nhdsLT_one`);
- the laws depend jointly weakly continuously on `(m, s, ξ) ∈ ℝ × (0, ∞) × ℝ` as elements of
  `MeasureTheory.ProbabilityMeasure ℝ`, across `ξ = 0`
  (`TauCeti.Probability.continuous_generalizedExtremeValueMeasure`); in particular they converge
  weakly to `Gumbel(m, s)` as `ξ → 0`
  (`TauCeti.Probability.tendsto_generalizedExtremeValueMeasure_nhds_zero_gumbelMeasure`);
- for natural `n`, `|x|ⁿ`, equivalently `xⁿ`, is integrable exactly when `nξ < 1`
  (`TauCeti.Probability.integrable_pow_abs_generalizedExtremeValueMeasure_iff`,
  `TauCeti.Probability.integrable_pow_generalizedExtremeValueMeasure_iff`), so every natural moment
  exists for `ξ ≤ 0`, in particular at `ξ = 0`; for `ξ ≠ 0` and `nξ < 1` the binomial expansion of
  the construction gives `E Xⁿ = ∑_{k=0}^{n} C(n, k) (m − s/ξ)^(n−k) (s/ξ)^k Γ(1 − kξ)`
  (`TauCeti.Probability.integral_pow_generalizedExtremeValueMeasure`); for `ξ ≠ 0`,
  `E X = m + s(Γ(1 − ξ) − 1)/ξ` when `ξ < 1`, and `Var X = s²(Γ(1 − 2ξ) − Γ(1 − ξ)²)/ξ²` when
  `ξ < 1/2` (`TauCeti.Probability.integral_id_generalizedExtremeValueMeasure`,
  `TauCeti.Probability.variance_id_generalizedExtremeValueMeasure`);
- the exact domain is given by the table below
  (`TauCeti.Probability.integrableExpSet_id_generalizedExtremeValueMeasure`), and no general closed
  transform is asked for;
- for a nonempty finite index type of cardinality `n`, the maximum of `n` independent copies is the
  GEV law with shape `ξ`, scale `s n^ξ` and location `m + s(n^ξ − 1)/ξ`, or location `m + s log n`
  at `ξ = 0` (`TauCeti.Probability.map_max_pi_generalizedExtremeValueMeasure`,
  `TauCeti.Probability.hasLaw_max_iid_generalizedExtremeValueMeasure`);
- for `a, α > 0` the Fréchet law, with `F(x) = exp(−(x/a)^(−α))` for `x > 0` and `F(x) = 0` for
  `x ≤ 0`, is the GEV law with location `a`, scale `a/α` and shape `1/α`
  (`TauCeti.Probability.cdf_generalizedExtremeValueMeasure_frechet`); for `c > 0` and any `s`, the
  reversed Weibull law, the reflection of the Weibull law of shape `c` and scale `s` (§3.4), is the
  GEV law with location `−s`, scale `s/c` and shape `−1/c`
  (`TauCeti.Probability.weibullMeasure_map_neg`);
- the family is measurable in `(m, s, ξ)`
  (`TauCeti.Probability.measurable_generalizedExtremeValueMeasure`).

| Shape | Exact `D` |
| --- | --- |
| `ξ > 0` | `(−∞, 0]` |
| `ξ = 0` | `(−∞, 1/s)` |
| `−1 < ξ < 0` | `ℝ` |
| `ξ = −1` | `(−1/s, ∞)` |
| `ξ < −1` | `[0, ∞)` |

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `Real.eulerMascheroniConstant`, `Real.Gamma`,
`Complex.Gamma`, `MeasureTheory.Measure.neg`, `MeasureTheory.ProbabilityMeasure`; Tau Ceti
`TauCeti.Probability.weibullMeasure`, `TauCeti.Probability.logisticMeasure`; §1.5, §3.4, §4.6, §7.2,
§7.11, §10.1.

**Checks.**

- In the maximum convention `F(m) = e^(−1) ≈ 0.368` and `E X = m + sγ > m`; the minimum-convention
  law of `−m + s log E` has cdf `1 − e^(−1) ≈ 0.632` at `−m` and mean `−m − sγ`. Defining the Gumbel
  law through `m + s log E` would exchange the two.
- At `ξ = 1/2`, `m = 0`, `s = 1` the law lives on `[−2, ∞)` and has mean `2(√π − 1) ≈ 1.545`; the
  same number read as SciPy's shape gives a law bounded above.
- For `ξ = 1` the square of the cdf of `GEV(m, s, 1)` is the cdf of `GEV(m + s, 2s, 1)`, as the
  maximum formula with `n = 2` requires; multiplying the scale by `n^ξ` without shifting the location
  by `s(n^ξ − 1)/ξ` would fail this.
- The Fréchet law with `a = 2`, `α = 3` and the law `GEV(2, 2/3, 1/3)` both have cdf `e^(−1)` at `2`;
  the reversed Weibull law with `c = 2`, `s = 3/2` and the law `GEV(−3/2, 3/4, −1/2)` both have cdf
  `exp(−(2/3)²) ≈ 0.641` at `−1`.

### 10.3 Generalized Pareto

For `s > 0` and `ξ ∈ ℝ`, the generalized Pareto law `GPD(s, ξ)` with scale `s` and shape `ξ` is
`TauCeti.Probability.generalizedParetoMeasure s ξ`, the law of `s(e^(ξE) − 1)/ξ` for `E` with law
`Exp(1)` when `ξ ≠ 0`
(`TauCeti.Probability.generalizedParetoMeasure_of_shape_ne_zero`,
`TauCeti.Probability.hasLaw_generalizedParetoMeasure_of_hasLaw_expMeasure_of_shape_ne_zero`), and
the law of `sE`, the exponential law of rate `1/s`, at `ξ = 0`
(`TauCeti.Probability.generalizedParetoMeasure_zero`); it is the zero measure for `s ≤ 0`
(`TauCeti.Probability.generalizedParetoMeasure_of_nonpos`) and a probability measure for `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_generalizedParetoMeasure`) (Coles 2001). For `s > 0`:

- `f(x) = (1 + ξx/s)^(−1/ξ − 1)/s` for `ξ ≠ 0`, `x > 0` and `1 + ξx/s > 0`; `f(x) = e^(−x/s)/s` for
  `ξ = 0` and `x > 0`; and `f = 0` elsewhere
  (`TauCeti.Probability.generalizedParetoPDFReal_of_shape_ne_zero`,
  `TauCeti.Probability.generalizedParetoPDFReal_zero`,
  `TauCeti.Probability.generalizedParetoPDFReal_of_nonpos`,
  `TauCeti.Probability.generalizedParetoPDFReal_of_neg_of_le`), with
  `TauCeti.Probability.generalizedParetoPDF`,
  `TauCeti.Probability.generalizedParetoMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_generalizedParetoMeasure` and
  `TauCeti.Probability.rnDeriv_generalizedParetoMeasure`;
- `F(x) = 0` for `x ≤ 0`; for `x ≥ 0` with `1 + ξx/s > 0`, `F(x) = 1 − (1 + ξx/s)^(−1/ξ)` if `ξ ≠ 0`
  and `F(x) = 1 − e^(−x/s)` if `ξ = 0`; for `ξ < 0`, `F(x) = 1` at and above `−s/ξ`
  (`TauCeti.Probability.cdf_generalizedParetoMeasure_eq`,
  `TauCeti.Probability.cdf_generalizedParetoMeasure_eq_one_of_neg_div_le`); the support is `[0, ∞)`
  for `ξ ≥ 0` and `[0, −s/ξ]` for `ξ < 0` (`TauCeti.Probability.support_generalizedParetoMeasure`);
- `Q(u) = s((1 − u)^(−ξ) − 1)/ξ` for `ξ ≠ 0` and `Q(u) = −s log(1 − u)` for `ξ = 0`
  (`TauCeti.Probability.quantile_generalizedParetoMeasure`), strictly increasing and continuous on
  `(0, 1)`, with limit `0` at `0` and limit `−s/ξ` (for `ξ < 0`) or `+∞` (for `ξ ≥ 0`) at `1`
  (`TauCeti.Probability.strictMonoOn_quantile_generalizedParetoMeasure`,
  `TauCeti.Probability.continuousOn_quantile_generalizedParetoMeasure`,
  `TauCeti.Probability.tendsto_quantile_generalizedParetoMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_generalizedParetoMeasure_nhdsLT_one`);
- for natural `n`, `xⁿ` is integrable exactly when `nξ < 1`
  (`TauCeti.Probability.integrable_pow_generalizedParetoMeasure_iff`), and then
  `E Xⁿ = sⁿ n!/∏_{j=1}^{n} (1 − jξ)` (`TauCeti.Probability.integral_pow_generalizedParetoMeasure`);
  `E X = s/(1 − ξ)` for `ξ < 1` and `Var X = s²/((1 − ξ)²(1 − 2ξ))` for `ξ < 1/2`
  (`TauCeti.Probability.integral_id_generalizedParetoMeasure`,
  `TauCeti.Probability.variance_id_generalizedParetoMeasure`);
- `D` is `(−∞, 0]`, `(−∞, 1/s)` and `ℝ` for `ξ > 0`, `ξ = 0` and `ξ < 0`
  (`TauCeti.Probability.integrableExpSet_id_generalizedParetoMeasure`);
- survival and hazard (§7.9): for `x > 0` with `s + ξx > 0` the hazard is
  `h(x) = f(x)/(1 − F(x)) = 1/(s + ξx)`
  (`TauCeti.Probability.generalizedParetoPDFReal_div_one_sub_cdf`); for `x ≥ 0` with `s + ξx > 0`
  the cumulative hazard is `H(x) = −log(1 − F(x)) = log(1 + ξx/s)/ξ`, and `H(x) = x/s` at `ξ = 0`, so
  that `H(0) = 0` (`TauCeti.Probability.neg_log_one_sub_cdf_generalizedParetoMeasure`), and
  `H(x) = ∫_0^x h(t) dt` (`TauCeti.Probability.integral_generalizedParetoPDFReal_div_one_sub_cdf`);
- threshold stability: for `v ≥ 0` with `s + ξv > 0`, the excess `X − v` of `X` conditioned on
  `X > v` has law `GPD(s + ξv, ξ)` (`TauCeti.Probability.map_sub_cond_generalizedParetoMeasure`,
  `TauCeti.Probability.hasLaw_sub_cond_generalizedParetoMeasure`);
- specializations: the exponential law of rate `1/s` at `ξ = 0`; at `ξ = −1` the uniform law
  `TauCeti.Probability.uniformMeasure 0 s` on `(0, s]`, for every `s`
  (`TauCeti.Probability.generalizedParetoMeasure_neg_one`); for `ξ > 0` the Lomax (Pareto type II)
  law with scale `s/ξ` and shape `1/ξ`, whose survival function `(1 + x/(s/ξ))^(−1/ξ)` on `x > 0` is
  the cdf formula above; translated by `s/ξ` it is `ProbabilityTheory.paretoMeasure (s/ξ) (1/ξ)`
  (`TauCeti.Probability.map_add_generalizedParetoMeasure_eq_paretoMeasure`), and conversely, for
  `t, r > 0`, the Pareto law of threshold `t` and shape `r` translated by `−t` is `GPD(t/r, 1/r)`
  (`TauCeti.Probability.map_sub_paretoMeasure_eq_generalizedParetoMeasure`);
- the family is measurable in `(s, ξ)` (`TauCeti.Probability.measurable_generalizedParetoMeasure`).

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.paretoMeasure`,
`ProbabilityTheory.cond`; Tau Ceti `TauCeti.Probability.uniformMeasure`; §0.3, §1.5, §1.9, §7.3, §7.9.

**Checks.**

- The moment formula at `n = 2` gives `E X² = 2s²/((1 − ξ)(1 − 2ξ))`; at `s = 2`, `ξ = −1` it is
  `4/3`, and the mean `1` and variance `1/3` are those of the uniform law on `(0, 2]`. A product
  indexed by `j = 0, …, n − 1` instead of `j = 1, …, n` would give `E X² = 2s²/(1 − ξ) = 4` there.
- Threshold stability with `s = 2`, `ξ = 0.4`, `v = 3`: the conditional survival `S(3 + y)/S(3)` is
  the survival of `GPD(3.2, 0.4)` at `y` (about `0.859` at `y = 0.5`); keeping the scale `s`, as for
  the memoryless exponential law, is right only at `ξ = 0`.

### 10.4 Chi and Nakagami

**Chi.** For `k ≥ 0` and `s > 0`, the chi law `chi(k, s)` of degree `k` and scale `s` is
`TauCeti.Probability.chiMeasure k s`, the law of `s√X` for `X` with the chi-squared law
`χ²_k = TauCeti.Probability.chiSquaredMeasure k` of §3.5
(`TauCeti.Probability.chiMeasure_of_scale_pos`,
`TauCeti.Probability.hasLaw_chiMeasure_of_hasLaw_chiSquaredMeasure`); it is the zero measure for
`s ≤ 0` or `k < 0` (`TauCeti.Probability.chiMeasure_of_scale_nonpos`,
`TauCeti.Probability.chiMeasure_of_neg`) and a probability measure for `k ≥ 0`, `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_chiMeasure`) (Johnson, Kotz and Balakrishnan, vol. 1).
For `s > 0`:

- for `k > 0`, `f(x) = 2^(1 − k/2) x^(k−1) e^(−x²/(2s²))/(Γ(k/2) s^k)` for `x > 0` and `f(x) = 0` for
  `x ≤ 0` (`TauCeti.Probability.chiPDFReal_of_pos`, `TauCeti.Probability.chiPDFReal_of_nonpos`),
  positive exactly on `(0, ∞)` (`TauCeti.Probability.support_chiPDF`), with
  `TauCeti.Probability.chiPDF`, `TauCeti.Probability.chiMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_chiMeasure` and `TauCeti.Probability.rnDeriv_chiMeasure`
  (each for `k > 0`, `s > 0`);
- for `k > 0`, `F(x) = 0` for `x < 0` and `F(x) = G_{k/2}(x²/(2s²))` for `x ≥ 0`
  (`TauCeti.Probability.cdf_chiMeasure_eq`);
- for `k ≥ 0`, `Q(u) = s √(2 G_{k/2}⁻¹(u))` with the inverse `TauCeti.inverseRegularizedGamma` of
  §8.4 (`TauCeti.Probability.quantile_chiMeasure`), with limit `0` at `0` and limit `+∞` (for
  `k > 0`) or `0` (for `k = 0`) at `1` (`TauCeti.Probability.tendsto_quantile_chiMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_chiMeasure_nhdsLT_one`);
- for `k > 0` and real `q`, `x^q` is integrable exactly when `q > −k`, and then
  `E X^q = s^q 2^(q/2) Γ((k + q)/2)/Γ(k/2)` (`TauCeti.Probability.integrable_rpow_chiMeasure_iff`,
  `TauCeti.Probability.integral_rpow_chiMeasure`); every natural moment exists
  (`TauCeti.Probability.integrable_pow_chiMeasure`) and for `k > 0`
  `E Xⁿ = sⁿ 2^(n/2) Γ((k + n)/2)/Γ(k/2)` (`TauCeti.Probability.integral_pow_chiMeasure`); for
  `k ≥ 0`, `E X = s√2 Γ((k + 1)/2)/Γ(k/2)`, `E X² = s²k` and
  `Var X = s²(k − 2(Γ((k + 1)/2)/Γ(k/2))²)` (`TauCeti.Probability.integral_id_chiMeasure`,
  `TauCeti.Probability.integral_sq_chiMeasure`, `TauCeti.Probability.variance_id_chiMeasure`);
- degree zero: `chi(0, s)` is the Dirac mass `δ₀` (`TauCeti.Probability.chiMeasure_zero`), with
  cdf `1_(x ≥ 0)` (`TauCeti.Probability.cdf_chiMeasure_zero`), zeroth moment `1` and positive moments
  `0` (`TauCeti.Probability.integral_pow_chiMeasure_zero`), quantile `0` (the formula above at
  `k = 0`) and support `{0}` (`TauCeti.Probability.support_chiMeasure`);
- every valid chi law has `D = ℝ` (`TauCeti.Probability.integrableExpSet_id_chiMeasure`); no closed
  mgf is asked for;
- the family is measurable in `(k, s)` (`TauCeti.Probability.measurable_chiMeasure`).

Gaussian radii: for a finite-dimensional real inner product space `E`, the norm of a vector with law
`ProbabilityTheory.stdGaussian E` has law `chi(dim E, 1)`, and its multiple by `s > 0` law
`chi(dim E, s)` (`TauCeti.Probability.stdGaussian_map_norm`,
`TauCeti.Probability.stdGaussian_map_const_mul_norm`, `ProbabilityTheory.HasLaw.norm_stdGaussian`);
for `v ≠ 0` and a finite index type of cardinality `k`, the Euclidean norm of independent `N(0, v)`
coordinates has law `chi(k, √v)` (`TauCeti.Probability.map_norm_pi_gaussianReal`,
`ProbabilityTheory.iIndepFun.hasLaw_norm_gaussianReal`), and `|X|` for `X ∼ N(0, v)` has law
`chi(1, √v)` (`TauCeti.Probability.gaussianReal_map_abs`,
`ProbabilityTheory.HasLaw.abs_gaussianReal`). The half-normal, Rayleigh and Maxwell–Boltzmann laws
of scale `s` are `chi(1, s)`, `chi(2, s)` and `chi(3, s)`, the laws of the
absolute value of `N(0, s²)` and of the norms of planar and spatial vectors of independent
`N(0, s²)` coordinates.

**Nakagami.** For `m, Ω > 0`, `TauCeti.Probability.nakagamiMeasure m Ω` is the image of the Gamma law
`Gamma(m, m/Ω)` of shape `m` and rate `m/Ω`, `ProbabilityTheory.gammaMeasure m (m/Ω)`, under
`x ↦ √x` (`TauCeti.Probability.nakagamiMeasure_of_pos`,
`TauCeti.Probability.hasLaw_nakagamiMeasure_of_hasLaw_gammaMeasure`); it is the zero measure unless
`m > 0` and `Ω > 0` (`TauCeti.Probability.nakagamiMeasure_of_not_pos`), and a probability measure
exactly when `m > 0` and `Ω > 0` (`TauCeti.Probability.isProbabilityMeasure_nakagamiMeasure_iff`),
including `0 < m < 1/2`. For `m, Ω > 0`:

- `f(x) = 2(m/Ω)^m x^(2m−1) e^(−mx²/Ω)/Γ(m)` for `x > 0` and `f(x) = 0` for `x ≤ 0`
  (`TauCeti.Probability.nakagamiPDFReal_of_pos`, `TauCeti.Probability.nakagamiPDFReal_of_nonpos`),
  with `TauCeti.Probability.nakagamiPDF`, `TauCeti.Probability.nakagamiMeasure_eq_withDensity` (at
  every parameter), `TauCeti.Probability.hasPDF_of_hasLaw_nakagamiMeasure` and
  `TauCeti.Probability.rnDeriv_nakagamiMeasure`;
- `F(x) = 0` for `x < 0` and `F(x) = G_m(mx²/Ω)` for `x ≥ 0`
  (`TauCeti.Probability.cdf_nakagamiMeasure_eq`);
- `Q(u) = √((Ω/m) G_m⁻¹(u))` (`TauCeti.Probability.quantile_nakagamiMeasure`), with limits `0` and
  `+∞` (`TauCeti.Probability.tendsto_quantile_nakagamiMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_nakagamiMeasure_nhdsLT_one`);
- for real `q`, `x^q` is integrable exactly when `q > −2m`, and then
  `E X^q = (Ω/m)^(q/2) Γ(m + q/2)/Γ(m)` (`TauCeti.Probability.integrable_rpow_nakagamiMeasure_iff`,
  `TauCeti.Probability.integral_rpow_nakagamiMeasure`); in particular
  `E X = √(Ω/m) Γ(m + 1/2)/Γ(m)`, `E X² = Ω` and `Var X = Ω(1 − (Γ(m + 1/2)/Γ(m))²/m)`
  (`TauCeti.Probability.integral_id_nakagamiMeasure`, `TauCeti.Probability.integral_sq_nakagamiMeasure`,
  `TauCeti.Probability.variance_id_nakagamiMeasure`), and `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_nakagamiMeasure`);
- the Nakagami law with parameters `m`, `Ω` is the chi law with `k = 2m` and `s = √(Ω/(2m))`
  (`TauCeti.Probability.nakagamiMeasure_eq_chiMeasure`), and its square has law
  `Gamma(m, m/Ω)` (`TauCeti.Probability.nakagamiMeasure_map_sq`);
- the family is measurable in `(m, Ω)` (`TauCeti.Probability.measurable_nakagamiMeasure`).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.stdGaussian`, `Real.Gamma`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`,
`TauCeti.regularizedGamma`, `TauCeti.inverseRegularizedGamma`; §0.5, §1.6, §1.10, §2.1, §3.5, §8.4.

**Checks.**

- The chi mean is `s√(2/π) ≈ 0.798 s` at `k = 1` (half-normal), `s√(π/2) ≈ 1.253 s` at `k = 2`
  (Rayleigh) and `2s√(2/π) ≈ 1.596 s` at `k = 3` (Maxwell–Boltzmann); at `k = 1`, `s = √v` it is
  `E|X| = √(2v/π)` for `X ∼ N(0, v)`. Reading `s` as a scale of the chi-squared variable, the law
  of `√(sX)`, would give `√s · √(2/π)` at `k = 1`.
- `chi(0, s)` is `δ₀`, with cdf `1_(x ≥ 0)`, `E X⁰ = 1` and `E Xⁿ = 0` for `n ≥ 1`; the density
  formula read at `k = 0` would give the zero function and so the zero measure.
- For `m = 1/4 < 1/2` the Nakagami law is still a probability law: its density behaves like
  `x^(−1/2)` at `0`, which is integrable. `x^q` is integrable exactly for `q > −1/2 = −2m`; at
  `q = −1/2` the integrand behaves like `1/x` at `0`. For every `m`, `E X² = Ω`, which is `s²k` for
  the chi parameters `k = 2m`, `s = √(Ω/(2m))`.

### 10.5 Noncentral chi-squared and chi

**Noncentral chi-squared.** For `k ≥ 0` and `λ ∈ ℝ≥0`, the noncentral chi-squared law `NCχ²(k, λ)`
with degree `k` and noncentrality `λ` is `TauCeti.Probability.noncentralChiSquaredMeasure k λ`, the
mixture (`MeasureTheory.Measure.bind`) of the laws `χ²_{k+2j}` against the Poisson law of mean
`λ/2`: the law of `X` given `J ∼ Poisson(λ/2)` and `X ∣ J ∼ χ²_{k+2J}`
(`TauCeti.Probability.noncentralChiSquaredMeasure_of_nonneg`,
`TauCeti.Probability.noncentralChiSquaredMeasure_eq_sum`); for `k < 0` it is the zero measure, the
guard coming before the mixture (`TauCeti.Probability.noncentralChiSquaredMeasure_of_neg`) (Johnson,
Kotz and Balakrishnan, vol. 2). For `k ≥ 0` it is a probability measure
(`TauCeti.Probability.isProbabilityMeasure_noncentralChiSquaredMeasure`), and for `k ≥ 0`, writing
`w_j = e^(−λ/2)(λ/2)^j/j!`:

- every natural moment exists (`TauCeti.Probability.integrable_pow_noncentralChiSquaredMeasure`),
  `E X = k + λ` and `Var X = 2(k + 2λ)` (`TauCeti.Probability.integral_id_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.variance_id_noncentralChiSquaredMeasure`);
- `D = (−∞, 1/2)` when `k + λ > 0`, and `D = ℝ` when `k = λ = 0`, where the law is `δ₀`
  (`TauCeti.Probability.integrableExpSet_id_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.not_integrable_exp_mul_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.noncentralChiSquaredMeasure_zero_noncentrality`,
  `TauCeti.Probability.chiSquaredMeasure_zero`); for `t < 1/2`,
  `M(t) = (1 − 2t)^(−k/2) exp(λt/(1 − 2t))` and `K(t) = −(k/2) log(1 − 2t) + λt/(1 − 2t)`
  (`TauCeti.Probability.mgf_id_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.cgf_id_noncentralChiSquaredMeasure`);
- `φ(t) = (1 − 2it)^(−k/2) exp(iλt/(1 − 2it))` for every real `t`, with the principal complex power
  `Complex.cpow` (`TauCeti.Probability.charFun_noncentralChiSquaredMeasure`);
- for `x > 0`, `f(x) = ∑_j w_j f_{k+2j}(x)` with `f_ν` the chi-squared density of §3.5 (the zero
  function at `ν = 0`), and `f(x) = 0` for `x ≤ 0`
  (`TauCeti.Probability.noncentralChiSquaredPDFReal_of_pos`,
  `TauCeti.Probability.noncentralChiSquaredPDFReal_of_nonpos`); when `λ > 0` and `x > 0`,
  `f(x) = ½ e^(−(x+λ)/2) (x/λ)^(k/4 − 1/2) I_{k/2−1}(√(λx))` with Tau Ceti's `Real.besselI` of §8.1
  (`TauCeti.Probability.noncentralChiSquaredPDFReal_eq_besselI`); at `λ = 0` it is the central
  density (`TauCeti.Probability.noncentralChiSquaredPDFReal_zero_noncentrality`); for `k > 0` the
  density interface is `TauCeti.Probability.noncentralChiSquaredPDF`,
  `TauCeti.Probability.noncentralChiSquaredMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_noncentralChiSquaredMeasure` and
  `TauCeti.Probability.rnDeriv_noncentralChiSquaredMeasure`;
- `F(x)` is the Poisson-weighted series `∑_j w_j F_{k+2j}(x)` of central cdfs
  (`TauCeti.Probability.hasSum_cdf_noncentralChiSquaredMeasure`), which for `k > 0` is
  `∑_j w_j G_{k/2+j}(x/2)` (`TauCeti.Probability.cdf_noncentralChiSquaredMeasure_eq`), continuous for
  `k > 0` (`TauCeti.Probability.continuous_cdf_noncentralChiSquaredMeasure`), and strictly
  increasing on `[0, ∞)` unless `k = λ = 0`
  (`TauCeti.Probability.strictMonoOn_cdf_noncentralChiSquaredMeasure`);
- degree zero: `NCχ²(0, λ)` is the atom `e^(−λ/2) δ₀` plus the continuous
  mixture `∑_{j ≥ 1} w_j χ²_{2j}` (`TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree`,
  `TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree_mass`,
  `TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree_eq_atom_add_withDensity`), the
  continuous part having mass `1 − e^(−λ/2)`
  (`TauCeti.Probability.integral_noncentralChiSquaredPDFReal_zero_degree`); no point other than `0`
  carries mass (`TauCeti.Probability.noncentralChiSquaredMeasure_singleton_of_ne_zero`), and the
  support is `[0, ∞)` except at `k = λ = 0`, where it is `{0}`
  (`TauCeti.Probability.support_noncentralChiSquaredMeasure`);
- quantiles: let `u₀ = e^(−λ/2)` if `k = 0` and `u₀ = 0` if `k > 0`; then `Q(u) = 0` exactly when
  `u ≤ u₀` (`TauCeti.Probability.quantile_noncentralChiSquaredMeasure_eq_zero_iff`), and for
  `u > u₀`, `Q(u)` is the unique `x > 0` with `F(x) = u`
  (`TauCeti.Probability.quantile_noncentralChiSquaredMeasure_eq_iff`); the quantile is continuous on
  `(0, 1)`, strictly increasing on `(u₀, 1)`, and tends to `0` at `0` and to `+∞` at `1` (to `0` if
  `k = λ = 0`) (`TauCeti.Probability.continuousOn_quantile_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.strictMonoOn_quantile_noncentralChiSquaredMeasure`,
  `TauCeti.Probability.tendsto_quantile_noncentralChiSquaredMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_noncentralChiSquaredMeasure_nhdsLT_one`);
- convolution adds degrees and noncentralities: for `k₁, k₂ ≥ 0`,
  `NCχ²(k₁, λ₁) ∗ NCχ²(k₂, λ₂) = NCχ²(k₁ + k₂, λ₁ + λ₂)`
  (`TauCeti.Probability.noncentralChiSquaredMeasure_conv_noncentralChiSquaredMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_add_noncentralChiSquaredMeasure`);
- stochastic order (§7.13): for `0 ≤ k₁ ≤ k₂` and `λ₁ ≤ λ₂`, the cdf of `NCχ²(k₂, λ₂)` lies below
  that of `NCχ²(k₁, λ₁)` everywhere (`TauCeti.Probability.cdf_noncentralChiSquaredMeasure_le`), the
  quantiles are ordered (`TauCeti.Probability.quantile_noncentralChiSquaredMeasure_le`), and the
  common-uniform quantile coupling `MeasureTheory.Measure.quantileCoupling` is ordered almost surely
  (`TauCeti.Probability.ae_fst_le_snd_quantileCoupling_noncentralChiSquaredMeasure`); the proof
  adds an independent noncentral chi-squared increment, and the degree-zero and Dirac boundaries are
  included;
- Gaussian construction: for a finite index type `ι` and `m ∈ EuclideanSpace ℝ ι`, `‖X‖²` for
  `X ∼ N(m, I)` has law `NCχ²(card ι, ‖m‖²)`
  (`TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral`,
  `ProbabilityTheory.HasLaw.norm_sq_multivariateGaussian`), likewise `∑ Xᵢ²` for independent
  `Xᵢ ∼ N(mᵢ, 1)` (`TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`,
  `ProbabilityTheory.iIndepFun.hasLaw_sum_sq_gaussianReal_noncentral`), and `X²` for `X ∼ N(m, 1)`
  has law `NCχ²(1, m²)` (`TauCeti.Probability.gaussianReal_map_sq_noncentral`). In positive natural
  dimension every `λ ≥ 0` arises this way; dimension zero gives only `λ = 0`, not the degree-zero
  mixtures with `λ > 0`;
- the family is measurable in `(k, λ)` (`TauCeti.Probability.measurable_noncentralChiSquaredMeasure`).

**Noncentral chi.** For `k ≥ 0`, `δ ∈ ℝ≥0` and `s > 0`, the noncentral chi law `NCχ(k, δ, s)` is
`TauCeti.Probability.noncentralChiMeasure k δ s`, the law of `s√X` for `X ∼ NCχ²(k, δ²)`
(`TauCeti.Probability.noncentralChiMeasure_of_scale_pos`,
`TauCeti.Probability.hasLaw_noncentralChiMeasure_of_hasLaw_noncentralChiSquaredMeasure`); it is the
zero measure for `s ≤ 0` or `k < 0` (`TauCeti.Probability.noncentralChiMeasure_of_scale_nonpos`,
`TauCeti.Probability.noncentralChiMeasure_of_neg`), a probability measure for `k ≥ 0`, `s > 0`
(`TauCeti.Probability.isProbabilityMeasure_noncentralChiMeasure`), the Poisson mixture
`∑_j w_j chi(k + 2j, s)` with `w_j = e^(−δ²/2)(δ²/2)^j/j!`
(`TauCeti.Probability.noncentralChiMeasure_eq_sum`), and `chi(k, s)` at `δ = 0`
(`TauCeti.Probability.noncentralChiMeasure_zero_noncentrality`). By transport, for `k ≥ 0`, `s > 0`:

- for `x > 0`, `f(x) = (2x/s²) f_{NCχ²}((x/s)²)` (`TauCeti.Probability.noncentralChiPDFReal_of_pos`),
  which for `δ > 0` is `(x/s²) e^(−((x/s)² + δ²)/2) (x/(sδ))^(k/2 − 1) I_{k/2−1}(δx/s)`
  (`TauCeti.Probability.noncentralChiPDFReal_eq_besselI`); for `k > 0` the density interface is
  `TauCeti.Probability.noncentralChiPDF`, `TauCeti.Probability.noncentralChiMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_noncentralChiMeasure` and
  `TauCeti.Probability.rnDeriv_noncentralChiMeasure`; at `k = 0` the law is an atom
  `e^(−δ²/2) δ₀` plus a density (`TauCeti.Probability.noncentralChiMeasure_zero_degree_mass`,
  `TauCeti.Probability.noncentralChiMeasure_zero_degree_eq_atom_add_withDensity`);
- `F(x) = 0` for `x < 0` and `F(x) = F_{NCχ²}((x/s)²)` for `x ≥ 0`
  (`TauCeti.Probability.cdf_noncentralChiMeasure_eq`), for `k > 0` the series
  `∑_j w_j G_{k/2+j}((x/s)²/2)` (`TauCeti.Probability.cdf_noncentralChiMeasure_eq_tsum`);
- `Q(u) = s √(Q_{NCχ²}(u))` (`TauCeti.Probability.quantile_noncentralChiMeasure`), zero exactly when
  `u ≤ u₀` with `u₀ = e^(−δ²/2)` at `k = 0` and `u₀ = 0` for `k > 0`
  (`TauCeti.Probability.quantile_noncentralChiMeasure_eq_zero_iff`), above `u₀` the unique positive
  root of `F(x) = u` (`TauCeti.Probability.quantile_noncentralChiMeasure_eq_iff`), continuous on
  `(0, 1)` with limits `0` and `+∞` (`0` if `k = δ = 0`)
  (`TauCeti.Probability.continuousOn_quantile_noncentralChiMeasure`,
  `TauCeti.Probability.tendsto_quantile_noncentralChiMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_noncentralChiMeasure_nhdsLT_one`);
- every natural moment exists (`TauCeti.Probability.integrable_pow_noncentralChiMeasure`) and is the
  convergent mixture `E Xⁿ = ∑_j w_j c_{n,j}` of central chi moments, with `c_{0,j} = 1` and, for
  `n ≥ 1`, `c_{n,j} = sⁿ 2^(n/2) Γ((k + 2j + n)/2)/Γ((k + 2j)/2)`, the degree-zero component
  (`k = 0`, `j = 0`, the law `δ₀`) contributing `0`
  (`TauCeti.Probability.hasSum_integral_pow_noncentralChiMeasure`,
  `TauCeti.Probability.integral_pow_noncentralChiMeasure`); the mean is the case `n = 1`
  (`TauCeti.Probability.integral_id_noncentralChiMeasure`), `E X² = s²(k + δ²)`
  (`TauCeti.Probability.integral_sq_noncentralChiMeasure`), the variance is their difference
  (`TauCeti.Probability.variance_id_noncentralChiMeasure`), and `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_noncentralChiMeasure`);
- Gaussian construction: `‖X‖` for `X ∼ N(m, I)` on `EuclideanSpace ℝ ι` has law
  `NCχ(card ι, ‖m‖, 1)`, and for `X ∼ N(m, s² I)` with `s > 0` the law
  `NCχ(card ι, ‖m‖/s, s)`
  (`TauCeti.Probability.map_norm_multivariateGaussian_noncentral`,
  `TauCeti.Probability.map_norm_multivariateGaussian_noncentral_of_scale`,
  `ProbabilityTheory.HasLaw.norm_multivariateGaussian_noncentral`,
  `ProbabilityTheory.HasLaw.norm_multivariateGaussian_noncentral_of_scale`);
- the family is measurable in `(k, δ, s)` (`TauCeti.Probability.measurable_noncentralChiMeasure`).

**Rice.** For `ν ∈ ℝ≥0` and `s > 0` the Rice law is `NCχ(2, ν/s, s)`: it is the law
of the norm of a planar Gaussian vector `N(m, s² I)` with `‖m‖ = ν` (the case `card ι = 2` of the
construction above), and for `x > 0` its density is
`f(x) = (x/s²) e^(−(x² + ν²)/(2s²)) I₀(xν/s²)`
(`TauCeti.Probability.noncentralChiPDFReal_two_div_scale_eq_besselI`).

**Folded normal.** For `m ∈ ℝ` and `s > 0` the folded normal law is the image of `N(m, s²)` under
`x ↦ |x|` (Johnson, Kotz and Balakrishnan, vol. 1). Prove that it is the noncentral chi law with
`k = 1`, `δ = |m|/s` and scale `s`, and that its cdf is `Φ((x − m)/s) − Φ((−x − m)/s)` for `x ≥ 0`
and `0` for `x < 0`, its mean is `s√(2/π) e^(−m²/(2s²)) + m(1 − 2Φ(−m/s))`, its second moment is
`m² + s²`, and its variance is `m² + s² − (E X)²`. Route: `X/s ∼ N(m/s, 1)`, whose square has law
`NCχ²(1, m²/s²)` (`TauCeti.Probability.gaussianReal_map_sq_noncentral`), and `|x| = s√((x/s)²)`; the
cdf is the folding formula of §7.7 (`MeasureTheory.Measure.cdf_map_abs_of_nonneg`); the mean splits
the Gaussian integral at `0`.

*Needs:* Mathlib `ProbabilityTheory.poissonMeasure`, `MeasureTheory.Measure.bind`,
`MeasureTheory.Measure.conv`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.multivariateGaussian`, `Complex.cpow`; Tau Ceti
`TauCeti.Probability.chiSquaredMeasure`, `TauCeti.Probability.chiMeasure`, `TauCeti.regularizedGamma`,
`Real.besselI`, `MeasureTheory.Measure.quantileCoupling`,
`MeasureTheory.Measure.cdf_map_abs_of_nonneg`; §1.4, §1.10, §2.1, §3.5, §4.4, §7.4, §7.7, §7.13, §8.1,
§10.4.

**Checks.**

- Zero noncentrality recovers the central laws and keeps the degree-zero atom:
  `NCχ²(k, 0) = χ²_k` for every `k ≥ 0`, so that at `k = 0` both are `δ₀`, the atom of mass
  `e^(−0/2) = 1`; and `NCχ(k, 0, s) = chi(k, s)`, again `δ₀` at `k = 0`.
- With `k = 3`, `λ = 2` the mixture gives `E X = 5 = k + λ` and `Var X = 14 = 2(k + 2λ)`; mixing with
  Poisson rate `λ` instead of `λ/2` would give mean `7`, contradicting `E‖X‖² = k + ‖m‖²` for
  `X ∼ N(m, I)`.
- Degree zero with `λ = 2`: the atom at `0` has mass `e^(−1) ≈ 0.368`, so `Q(u) = 0` for
  `u ≤ e^(−1)` and `Q(u) > 0` above; a definition of the degree-zero law through a density would lose
  the atom and fail to be a probability measure.
- The Poisson series and the Bessel form of the density agree: at `k = 3`, `λ = 1`, `x = 2` both are
  `0.17225…`.
- Folded normal with `m = s = 1`: mean `√(2/π) e^(−1/2) + 1 − 2Φ(−1) ≈ 1.1666`, second moment
  `2 = s²(k + δ²)` for `k = 1`, `δ = 1`, variance `≈ 0.6390`; the half-normal mean `√(2/π) ≈ 0.798`
  is wrong as soon as `m ≠ 0`.
- Rice with `ν = 0`, `s = 1`: `I₀(0) = 1` gives `f(x) = x e^(−x²/2)`, the Rayleigh density of
  `chi(2, 1)`.

### 10.6 Noncentral t and F

**Noncentral t.** For `ν > 0` and `δ ∈ ℝ`, the noncentral t law `NCt(ν, δ)` is
`TauCeti.Probability.noncentralTMeasure ν δ`, the law of `(Z + δ)/√(V/ν)` for independent
`Z ∼ N(0, 1)` and `V ∼ χ²_ν`
(`TauCeti.Probability.noncentralTMeasure_eq_map`,
`TauCeti.Probability.hasLaw_noncentralT_of_gaussian_chiSquared`); the denominator is positive almost
surely (`TauCeti.Probability.ae_pos_sqrt_div_chiSquaredMeasure`). It is the zero measure for `ν ≤ 0`
(`TauCeti.Probability.noncentralTMeasure_of_nonpos`) and a probability measure exactly when `ν > 0`
(`TauCeti.Probability.isProbabilityMeasure_noncentralTMeasure_iff`), and it is the mixture over `V`
of the laws of `Y/√(V/ν)` with `Y ∼ N(δ, 1)` (`TauCeti.Probability.noncentralTMeasure_eq_bind`)
(Johnson, Kotz and Balakrishnan, vol. 2). For `ν > 0`:

- integrating `√(v/ν) ϕ(x√(v/ν) − δ)` against the chi-squared law gives the density,
  `f(x) = ∫ √(v/ν) ϕ(x√(v/ν) − δ) dχ²_ν(v)` (`TauCeti.Probability.noncentralTPDFReal_def`), positive
  everywhere (`TauCeti.Probability.noncentralTPDFReal_pos`), with
  `TauCeti.Probability.noncentralTPDF`, `TauCeti.Probability.noncentralTMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_noncentralTMeasure` and
  `TauCeti.Probability.rnDeriv_noncentralTMeasure`;
- integrating `Φ(x√(v/ν) − δ)` gives the cdf, `F(x) = ∫ Φ(x√(v/ν) − δ) dχ²_ν(v)`
  (`TauCeti.Probability.cdf_noncentralTMeasure_eq`), continuous and strictly increasing
  (`TauCeti.Probability.continuous_cdf_noncentralTMeasure`,
  `TauCeti.Probability.strictMono_cdf_noncentralTMeasure`), with support `ℝ`
  (`TauCeti.Probability.support_noncentralTMeasure`);
- hence the quantile is the real root: `Q(u) = x` exactly when `F(x) = u`
  (`TauCeti.Probability.quantile_noncentralTMeasure_eq_iff`), strictly increasing and continuous on
  `(0, 1)` with limits `−∞` and `+∞` (`TauCeti.Probability.strictMonoOn_quantile_noncentralTMeasure`,
  `TauCeti.Probability.continuousOn_quantile_noncentralTMeasure`,
  `TauCeti.Probability.tendsto_quantile_noncentralTMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_noncentralTMeasure_nhdsLT_one`);
- for natural `n`, `xⁿ`, equivalently `|x|ⁿ`, is integrable exactly when `n < ν`
  (`TauCeti.Probability.integrable_pow_noncentralTMeasure_iff`);
  `E X = δ √(ν/2) Γ((ν − 1)/2)/Γ(ν/2)` for `ν > 1`, `E X² = ν(1 + δ²)/(ν − 2)` for `ν > 2`, and
  `Var X` is their difference for `ν > 2` (`TauCeti.Probability.integral_id_noncentralTMeasure`,
  `TauCeti.Probability.integral_sq_noncentralTMeasure`,
  `TauCeti.Probability.variance_id_noncentralTMeasure`);
- `D = {0}` (`TauCeti.Probability.integrableExpSet_id_noncentralTMeasure`);
- reflection: `−X` has law `NCt(ν, −δ)` (`TauCeti.Probability.noncentralTMeasure_map_neg`);
  central case: `NCt(ν, 0)` is Student's t law `TauCeti.Probability.studentTMeasure ν` of
  §3.7 (`TauCeti.Probability.noncentralTMeasure_zero_noncentrality`);
- the family is measurable in `(ν, δ)` (`TauCeti.Probability.measurable_noncentralTMeasure`).

**Noncentral F.** For `m, n > 0` and `λ ∈ ℝ≥0`, the noncentral F law `NCF(m, n, λ)` is
`TauCeti.Probability.noncentralFMeasure m n λ`, the law of `(U/m)/(V/n)` for independent
`U ∼ NCχ²(m, λ)` and `V ∼ χ²_n`
(`TauCeti.Probability.noncentralFMeasure_eq_map`,
`TauCeti.Probability.hasLaw_noncentralF_of_noncentralChiSquared`); it is the zero measure unless
`m, n > 0` (`TauCeti.Probability.noncentralFMeasure_of_not_pos`) and a probability measure exactly
when `m, n > 0` (`TauCeti.Probability.isProbabilityMeasure_noncentralFMeasure_iff`) (Johnson, Kotz and
Balakrishnan, vol. 2). For `m, n > 0`, with `w_j = e^(−λ/2)(λ/2)^j/j!`:

- the law is the Poisson mixture `∑_j w_j` of the laws `((m + 2j)/m) F(m + 2j, n)`, the images of
  the central F laws `F(m + 2j, n) = TauCeti.Probability.fisherSnedecorMeasure (m + 2j) n` of §3.8
  under `x ↦ ((m + 2j)/m) x` (`TauCeti.Probability.noncentralFMeasure_eq_sum`,
  `TauCeti.Probability.noncentralFMeasure_eq_bind`), and `NCF(m, n, 0)` is the central law
  `F(m, n)` (`TauCeti.Probability.noncentralFMeasure_zero_noncentrality`);
- its density is the mixture `f(x) = ∑_j w_j (m/(m + 2j)) f_{F(m+2j, n)}(mx/(m + 2j))`
  (`TauCeti.Probability.noncentralFPDFReal_of_pos`), positive on `(0, ∞)`
  (`TauCeti.Probability.noncentralFPDFReal_pos`), with `TauCeti.Probability.noncentralFPDF`,
  `TauCeti.Probability.noncentralFMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_noncentralFMeasure` and
  `TauCeti.Probability.rnDeriv_noncentralFMeasure`;
- `F(x) = 0` for `x ≤ 0` and `F(x) = ∑_j w_j I_{mx/(n + mx)}((m + 2j)/2, n/2)` for `x > 0`
  (`TauCeti.Probability.cdf_noncentralFMeasure_eq`), continuous and strictly increasing on `[0, ∞)`
  (`TauCeti.Probability.continuous_cdf_noncentralFMeasure`,
  `TauCeti.Probability.strictMonoOn_cdf_noncentralFMeasure`);
- the quantile is positive and is the unique root of this cdf: `Q(u) = x` exactly when `x > 0` and
  `F(x) = u` (`TauCeti.Probability.quantile_noncentralFMeasure_pos`,
  `TauCeti.Probability.quantile_noncentralFMeasure_eq_iff`), continuous on `(0, 1)` with limits `0`
  and `+∞` (`TauCeti.Probability.continuousOn_quantile_noncentralFMeasure`,
  `TauCeti.Probability.tendsto_quantile_noncentralFMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_noncentralFMeasure_nhdsLT_one`);
- for natural `r`, `x^r`, equivalently `|x|^r`, is integrable exactly when `2r < n`
  (`TauCeti.Probability.integrable_pow_noncentralFMeasure_iff`); `E X = n(m + λ)/(m(n − 2))` for
  `n > 2`, `E X² = n²((m + λ)² + 2(m + 2λ))/(m²(n − 2)(n − 4))` for `n > 4`, and their difference
  `Var X = 2n²((m + λ)² + (m + 2λ)(n − 2))/(m²(n − 2)²(n − 4))` for `n > 4`
  (`TauCeti.Probability.integral_id_noncentralFMeasure`,
  `TauCeti.Probability.integral_sq_noncentralFMeasure`,
  `TauCeti.Probability.variance_id_noncentralFMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_noncentralFMeasure`);
- the family is measurable in `(m, n, λ)` (`TauCeti.Probability.measurable_noncentralFMeasure`).

The square of a noncentral t variable is noncentral F: for every `ν` and `δ`, the image of
`NCt(ν, δ)` under `x ↦ x²` is `NCF(1, ν, δ²)`
(`TauCeti.Probability.noncentralTMeasure_map_sq`). No hypergeometric closed form of either density
is asked for.

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal`,
`ProbabilityTheory.cdf`, `ProbabilityTheory.poissonMeasure`, `Real.Gamma`; Tau Ceti
`TauCeti.Probability.chiSquaredMeasure`, `TauCeti.Probability.ae_pos_sqrt_div_chiSquaredMeasure`,
`TauCeti.Probability.studentTMeasure`, `TauCeti.Probability.fisherSnedecorMeasure`,
`TauCeti.regularizedIncompleteBeta`; §1.10, §2.2, §3.5, §3.7, §3.8, §4.2, §7.4, §10.5.

**Checks.**

- Zero noncentrality gives the central laws: `NCt(ν, 0)` has `E X² = ν/(ν − 2)`, the
  Student t value; `NCF(4, 10, 0)` has `E X = 1.25 = n/(n − 2)` and
  `E X² = 3.125 = n²(m + 2)/(m(n − 2)(n − 4))`, the values of `F(4, 10)`.
- With `ν = 3`, `δ = 1`: `E X = √(6/π) ≈ 1.382`, `E X² = 6` and `Var X = 6 − 6/π ≈ 4.090`; the square
  law gives `NCF(1, 3, 1)`, whose mean `3(1 + 1)/(1 · (3 − 2)) = 6` is `E X²`, as it must
  be.
- `D = {0}` although `E X` exists for `ν > 1`: the polynomial tails exclude every `t ≠ 0`, so a
  domain inferred from the finite moments would wrongly be an interval around `0`.

### 10.7 Beta prime and Lévy

**Beta prime.** For `a, b > 0`, the beta prime law `BetaPrime(a, b)` is
`TauCeti.Probability.betaPrimeMeasure a b`, the image of the Beta law
`Beta(a, b) = ProbabilityTheory.betaMeasure a b` under `x ↦ x/(1 − x)`, the map
`TauCeti.Probability.fisherSnedecorMap 2 2` (`TauCeti.Probability.betaPrimeMeasure_eq_map`); it is
the zero measure unless `a, b > 0` (`TauCeti.Probability.betaPrimeMeasure_of_not_pos`) and a
probability measure exactly when `a, b > 0`
(`TauCeti.Probability.isProbabilityMeasure_betaPrimeMeasure_iff`) (Johnson, Kotz and Balakrishnan,
vol. 2). For `a, b > 0`:

- `f(x) = x^(a−1)(1 + x)^(−a−b)/B(a, b)` for `x > 0` and `f(x) = 0` for `x ≤ 0`
  (`TauCeti.Probability.betaPrimePDFReal_of_pos`, `TauCeti.Probability.betaPrimePDFReal_of_nonpos`),
  with `TauCeti.Probability.betaPrimePDF`, `TauCeti.Probability.betaPrimeMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_betaPrimeMeasure` and
  `TauCeti.Probability.rnDeriv_betaPrimeMeasure`;
- `F(x) = 0` for `x ≤ 0` and `F(x) = I_{x/(1+x)}(a, b)` for `x > 0`
  (`TauCeti.Probability.cdf_betaPrimeMeasure_eq`);
- `Q(u) = B⁻¹_{a,b}(u)/(1 − B⁻¹_{a,b}(u))` with the inverse
  `TauCeti.inverseRegularizedIncompleteBeta a b` of §8.4
  (`TauCeti.Probability.quantile_betaPrimeMeasure`), with limits `0` and `+∞`
  (`TauCeti.Probability.tendsto_quantile_betaPrimeMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_betaPrimeMeasure_nhdsLT_one`);
- for independent `X ∼ Gamma(a, r)` and `Y ∼ Gamma(b, r)` with `r > 0`, `X/Y` has law
  `BetaPrime(a, b)` and is independent of `X + Y ∼ Gamma(a + b, r)`
  (`TauCeti.Probability.map_div_gammaMeasure`, `TauCeti.Probability.map_div_sum_prod_gammaMeasure`,
  `TauCeti.Probability.hasLaw_betaPrime_of_gammaMeasure`,
  `TauCeti.Probability.indepFun_div_sum_of_hasLaw_gammaMeasure`); and `BetaPrime(a, b)` is the
  image of `F(2a, 2b)` under `y ↦ (a/b) y`
  (`TauCeti.Probability.betaPrimeMeasure_eq_map_fisherSnedecorMeasure`);
- for real `q`, `x^q` is integrable exactly when `−a < q < b`, and then
  `E X^q = B(a + q, b − q)/B(a, b)` (`TauCeti.Probability.integrable_rpow_betaPrimeMeasure_iff`,
  `TauCeti.Probability.integral_rpow_betaPrimeMeasure`); `E X = a/(b − 1)` for `b > 1` and
  `Var X = a(a + b − 1)/((b − 2)(b − 1)²)` for `b > 2`
  (`TauCeti.Probability.integral_id_betaPrimeMeasure`,
  `TauCeti.Probability.variance_id_betaPrimeMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_betaPrimeMeasure`);
- the family is measurable in `(a, b)` (`TauCeti.Probability.measurable_betaPrimeMeasure`).

**Lévy.** For `m ∈ ℝ` and `c > 0`, the Lévy law `Lévy(m, c)` with location `m` and scale `c` is
`TauCeti.Probability.levyMeasure m c`, the inverse-gamma law
`TauCeti.Probability.inverseGammaMeasure (1/2) (c/2)` of §3.6 translated by `m`
(`TauCeti.Probability.levyMeasure_def`); it is the zero measure for `c ≤ 0`
(`TauCeti.Probability.levyMeasure_of_nonpos`), a probability measure for `c > 0`
(`TauCeti.Probability.isProbabilityMeasure_levyMeasure`), and concentrated on `(m, ∞)`
(`TauCeti.Probability.ae_lt_levyMeasure`) (Nolan 2020). For `c > 0`:

- `f(x) = √(c/(2π)) (x − m)^(−3/2) e^(−c/(2(x − m)))` for `x > m` and `f(x) = 0` for `x ≤ m`
  (`TauCeti.Probability.levyPDFReal_of_lt`, `TauCeti.Probability.levyPDFReal_of_le`), with
  `TauCeti.Probability.levyPDF`, `TauCeti.Probability.levyMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_levyMeasure` and `TauCeti.Probability.rnDeriv_levyMeasure`;
- `F(x) = erfc √(c/(2(x − m)))` for `x > m` and `F(x) = 0` for `x ≤ m`, with Tau Ceti's
  `TauCeti.Real.erfc` of §2.3 (`TauCeti.Probability.cdf_levyMeasure_eq`);
- `Q(u) = m + c/z(1 − u/2)²` (`TauCeti.Probability.quantile_levyMeasure_eq_quantile_gaussianReal`),
  equivalently `m + c/(2 erf⁻¹(1 − u)²)` with `Real.erfInv`
  (`TauCeti.Probability.quantile_levyMeasure`), with limits `m` and `+∞`
  (`TauCeti.Probability.tendsto_quantile_levyMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_levyMeasure_nhdsLT_one`);
- for real `q`, `|x − m|^q` is integrable exactly when `q < 1/2`, so the positive fractional moments
  of `|X − m|` exist exactly below `1/2` (`TauCeti.Probability.integrable_rpow_abs_sub_levyMeasure_iff`)
  and there is no mean (`TauCeti.Probability.not_integrable_id_levyMeasure`);
- `D = (−∞, 0]` (`TauCeti.Probability.integrableExpSet_id_levyMeasure`), and for `t ≤ 0`,
  `M(t) = exp(mt − √(−2ct))` and `K(t) = mt − √(−2ct)` (`TauCeti.Probability.mgf_id_levyMeasure`,
  `TauCeti.Probability.cgf_id_levyMeasure`); `φ(t) = exp(imt − √(−2ict))` with the principal square
  root `Complex.sqrt` (`TauCeti.Probability.charFun_levyMeasure`);
- for `Z ∼ N(0, 1)`, `m + c/Z²` has law `Lévy(m, c)`
  (`TauCeti.Probability.gaussianReal_map_add_div_sq`,
  `TauCeti.Probability.hasLaw_levyMeasure_of_hasLaw_gaussianReal`);
- the family is measurable in `(m, c)` (`TauCeti.Probability.measurable_levyMeasure`).

Reflection: for `m ∈ ℝ` and `c > 0` the reflected Lévy law is the image of `Lévy(m, c)` under
`x ↦ −x`, the law of `−m − c/Z²`. Prove that it is concentrated on `(−∞, −m)`, has density
`x ↦ f(−x)`, cdf `erf √(c/(2(−m − x)))` for `x < −m` and `1` for `x ≥ −m`, quantile
`Q(u) = −m − c/z((1 + u)/2)²`, exact domain `D = [0, ∞)`, and mgf `M(t) = exp(−mt − √(2ct))` for
`t ≥ 0`. Route: the affine transport and reflection results of §7.1 and §7.2 and Mathlib's
`ProbabilityTheory.mgf_neg`. The identifications of the Lévy and reflected Lévy laws with stable
laws of index `1/2` are stated in §15.3.

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.gammaMeasure`,
`ProbabilityTheory.beta`, `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.mgf_neg`,
`Complex.sqrt`; Tau Ceti `TauCeti.Probability.fisherSnedecorMeasure`,
`TauCeti.Probability.inverseGammaMeasure`, `TauCeti.regularizedIncompleteBeta`,
`TauCeti.inverseRegularizedIncompleteBeta`, `TauCeti.Real.erf`, `TauCeti.Real.erfc`, `Real.erfInv`;
§1.6, §1.7, §1.10, §2.2, §2.3, §3.6, §3.8, §4.3, §7.1, §7.2, §8.4.

**Checks.**

- `a = 2`, `b = 5`: `E X = B(3, 4)/B(2, 5) = 1/2 = a/(b − 1)`, which is also `(a/b) · 2b/(2b − 2)`,
  the mean of `(a/b) F(2a, 2b)`; `Var X = 1/4`.
- `a = b = 1`: `F(x) = x/(1 + x)`, so the median is `1`; `E X^q = Γ(1 + q)Γ(1 − q) = πq/sin(πq)` for
  `−1 < q < 1` (`π/2` at `q = 1/2`), and there is no mean.
- Lévy with `m = 0`, `c = 1`: the median is `1/z(3/4)² ≈ 2.198`, and `erfc √(1/(2 · 2.198)) = 1/2`
  there; the formula with `z(u)` in place of `z(1 − u/2)` would put the median at `1/z(1/2)²`,
  undefined since `z(1/2) = 0`.
- Lévy with `m = 0`, `c = 1`: `M(−1/2) = e^(−1)`, which is `E exp(−1/(2Z²))` for standard Gaussian
  `Z` through the construction `X = 1/Z²`.

### 10.8 Inverse Gaussian

For `μ, λ > 0`, the inverse Gaussian law `IG(μ, λ)` with mean `μ` and shape `λ` is
`TauCeti.Probability.inverseGaussianMeasure μ λ`, Lebesgue measure with density

    f(x) = √(λ/(2πx³)) exp(−λ(x − μ)²/(2μ²x))   (x > 0),   f(x) = 0   (x ≤ 0)

(`TauCeti.Probability.inverseGaussianPDFReal_of_pos`,
`TauCeti.Probability.inverseGaussianPDFReal_of_nonpos`,
`TauCeti.Probability.inverseGaussianMeasure_eq_withDensity`), and the zero measure unless `μ, λ > 0`
(`TauCeti.Probability.inverseGaussianMeasure_of_not_pos`) (Johnson, Kotz and Balakrishnan, vol. 1).
For `μ, λ > 0`:

- `∫ f = 1` (`TauCeti.Probability.integral_inverseGaussianPDFReal`), so the law is a probability
  measure, exactly when `μ, λ > 0`
  (`TauCeti.Probability.isProbabilityMeasure_inverseGaussianMeasure_iff`),
  with `TauCeti.Probability.inverseGaussianPDF`,
  `TauCeti.Probability.hasPDF_of_hasLaw_inverseGaussianMeasure`,
  `TauCeti.Probability.rnDeriv_inverseGaussianMeasure` and support `[0, ∞)`
  (`TauCeti.Probability.support_inverseGaussianMeasure`);
- `E X = μ` and `Var X = μ³/λ` (`TauCeti.Probability.integral_id_inverseGaussianMeasure`,
  `TauCeti.Probability.variance_id_inverseGaussianMeasure`), and every moment is finite
  (`TauCeti.Probability.memLp_id_inverseGaussianMeasure`);
- `F(x) = 0` for `x ≤ 0` and `F(x) = Φ(√(λ/x)(x/μ − 1)) + e^(2λ/μ) Φ(−√(λ/x)(x/μ + 1))` for `x > 0`
  (`TauCeti.Probability.cdf_inverseGaussianMeasure_eq`), strictly increasing on `[0, ∞)`
  (`TauCeti.Probability.strictMonoOn_cdf_inverseGaussianMeasure`);
- the exact domain is the closed interval `D = (−∞, λ/(2μ²)]`
  (`TauCeti.Probability.integrableExpSet_id_inverseGaussianMeasure`), and on `D`, its finite endpoint
  included, `M(t) = exp((λ/μ)(1 − √(1 − 2μ²t/λ)))` and `K(t) = (λ/μ)(1 − √(1 − 2μ²t/λ))`
  (`TauCeti.Probability.mgf_id_inverseGaussianMeasure`,
  `TauCeti.Probability.cgf_id_inverseGaussianMeasure`);
- `φ(t) = exp((λ/μ)(1 − √(1 − 2iμ²t/λ)))` with the principal square root `Complex.sqrt`
  (`TauCeti.Probability.charFun_inverseGaussianMeasure`);
- the quantile is the unique positive root of `F(x) = u`
  (`TauCeti.Probability.quantile_inverseGaussianMeasure_pos`,
  `TauCeti.Probability.quantile_inverseGaussianMeasure_eq_iff`), strictly increasing and continuous
  on `(0, 1)` with limits `0` and `+∞`
  (`TauCeti.Probability.strictMonoOn_quantile_inverseGaussianMeasure`,
  `TauCeti.Probability.continuousOn_quantile_inverseGaussianMeasure`,
  `TauCeti.Probability.tendsto_quantile_inverseGaussianMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_inverseGaussianMeasure_nhdsLT_one`);
- the family is measurable in `(μ, λ)` (`TauCeti.Probability.measurable_inverseGaussianMeasure`).

The Wald law is the case `μ = 1`, `IG(1, λ)`: the statements above specialize to
mean `1`, variance `1/λ`, `D = (−∞, λ/2]` and `M(t) = exp(λ(1 − √(1 − 2t/λ)))`.

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.cdf`, `Complex.sqrt`; §1.10,
§2.4, §7.2; the proof of the exponential domain compares `f(x) e^(tx)` with the Lévy density of
§10.7.

**Checks.**

- `μ = λ = 1`: `f(x) e^(x/2)` is `e` times the density of `Lévy(0, 1)`, so `M(1/2) = e`: the mgf
  is finite at the endpoint `λ/(2μ²)`, which an open domain `(−∞, λ/(2μ²))` would miss.
- `μ = λ = 1`: `F(1) = 1/2 + e² Φ(−2) ≈ 0.668`, so the mean is not the median; dropping the second
  term of the cdf would give `1/2`.

### 10.9 Truncated and skew normal

**Truncated normal.** For `m ∈ ℝ`, `v ∈ ℝ≥0` and a measurable set `s ⊆ ℝ`,
`TauCeti.Probability.truncatedNormalMeasure m v s` is the conditioning (§7.3, `ProbabilityTheory.cond`)
of `N(m, v)` on `s` (`TauCeti.Probability.truncatedNormalMeasure_def`); it
is a probability measure exactly when `N(m, v)(s) ≠ 0`, and the zero measure otherwise
(`TauCeti.Probability.isProbabilityMeasure_truncatedNormalMeasure_iff`,
`TauCeti.Probability.truncatedNormalMeasure_eq_zero_iff`) (Johnson, Kotz and Balakrishnan, vol. 1).
An interval with extended bounds `l < r` in `EReal` and either endpoint convention is any `s` with
`(l, r) ⊆ s ⊆ [l, r]`, read through the coercion `ℝ → EReal`; for `v ≠ 0` all four conventions give
the same law (`TauCeti.Probability.truncatedNormalMeasure_eq_preimage_Ioc`), which is a probability
measure (`TauCeti.Probability.isProbabilityMeasure_truncatedNormalMeasure_of_lt`). For `v > 0` write
`σ = √v`, `α = (l − m)/σ`, `β = (r − m)/σ` and `Z = Φ(β) − Φ(α) > 0`, where `ϕ(±∞) = 0` and the
products `α ϕ(α)`, `β ϕ(β)` at infinite bounds are `0`, their limits (the density at an extended
point is `TauCeti.Probability.gaussianPDFRealEReal`, zero at `±∞`). Then:

- `f(x) = ϕ((x − m)/σ)/(σZ)` on the interval and `0` off it
  (`TauCeti.Probability.truncatedNormalPDFReal_of_mem`,
  `TauCeti.Probability.truncatedNormalPDFReal_of_notMem`), with
  `TauCeti.Probability.truncatedNormalPDFReal`, `TauCeti.Probability.truncatedNormalPDF`,
  `TauCeti.Probability.truncatedNormalMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_truncatedNormalMeasure` and
  `TauCeti.Probability.rnDeriv_truncatedNormalMeasure` (for `v ≠ 0` and measurable `s`);
- the cdf is the clipped Gaussian cdf
  `F(x) = (min(Φ(β), max(Φ(α), Φ((x − m)/σ))) − Φ(α))/Z`
  (`TauCeti.Probability.cdf_truncatedNormalMeasure_eq`, and
  `TauCeti.Probability.cdf_truncatedNormalMeasure_eq_cdf_zero_one` for real bounds), continuous and
  strictly increasing on `(l, r)` (`TauCeti.Probability.continuous_cdf_truncatedNormalMeasure`,
  `TauCeti.Probability.strictMonoOn_cdf_truncatedNormalMeasure`);
- `Q(u) = m + σ z(Φ(α) + uZ)` (`TauCeti.Probability.quantile_truncatedNormalMeasure`,
  `TauCeti.Probability.quantile_truncatedNormalMeasure_eq_cdf_zero_one`), a point of `(l, r)` with
  limits `l` and `r` (`TauCeti.Probability.quantile_truncatedNormalMeasure_mem_Ioo`,
  `TauCeti.Probability.tendsto_quantile_truncatedNormalMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_truncatedNormalMeasure_nhdsLT_one`);
- `E X = m + σ(ϕ(α) − ϕ(β))/Z` and `Var X = v(1 + (αϕ(α) − βϕ(β))/Z − ((ϕ(α) − ϕ(β))/Z)²)`
  (`TauCeti.Probability.integral_id_truncatedNormalMeasure`,
  `TauCeti.Probability.variance_id_truncatedNormalMeasure`, and their forms
  `TauCeti.Probability.integral_id_truncatedNormalMeasure_eq_cdf_zero_one`,
  `TauCeti.Probability.variance_id_truncatedNormalMeasure_eq_cdf_zero_one` for real bounds);
- `D = ℝ` (`TauCeti.Probability.integrableExpSet_id_truncatedNormalMeasure`), and
  `M(t) = e^(mt + vt²/2)(Φ(β − σt) − Φ(α − σt))/Z`
  (`TauCeti.Probability.mgf_id_truncatedNormalMeasure_eq_cdf_zero_one` for real bounds, and
  `M(t) = e^(mt + vt²/2) N(m + vt, v)(s)/N(m, v)(s)` for every `s`,
  `TauCeti.Probability.mgf_id_truncatedNormalMeasure`), with
  `K(t) = mt + vt²/2 + log N(m + vt, v)(s) − log N(m, v)(s)` whenever `N(m, v)(s) ≠ 0`
  (`TauCeti.Probability.cgf_id_truncatedNormalMeasure`);
- at `v = 0` the law is `δ_m` if `m ∈ s` and the zero measure otherwise, so the endpoint convention
  decides whether `m = l` or `m = r` gives `δ_m` (`TauCeti.Probability.truncatedNormalMeasure_zero_var`),
  with quantile `m` (`TauCeti.Probability.quantile_truncatedNormalMeasure_zero_var`);
- the centered one-sided case is half-normal: conditioning `N(m, v)` on `[m, ∞)` (for `v ≠ 0`) or on
  `(m, ∞)` gives `m` plus the half-normal law `chi(1, √v)` of §10.4
  (`TauCeti.Probability.truncatedNormalMeasure_Ici_mean`,
  `TauCeti.Probability.truncatedNormalMeasure_Ioi_mean`,
  `ProbabilityTheory.HasLaw.cond_ge_mean_gaussianReal`,
  `ProbabilityTheory.HasLaw.cond_gt_mean_gaussianReal`); together with
  `TauCeti.Probability.gaussianReal_map_abs` this identifies, for `v ≠ 0`, the fold of `N(0, v)`,
  its conditioning on `[0, ∞)` and `chi(1, √v)`;
- the family is measurable in `(m, v, l, r)` for each endpoint convention
  (`TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ioc`,
  `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Icc`,
  `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ioo`,
  `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ico`), and along any measurable
  incidence set (`Measurable.truncatedNormalMeasure`).

**Skew-normal.** For `m ∈ ℝ`, `s > 0` and shape `α ∈ ℝ`, with `y = (x − m)/s` and
`d = α/√(1 + α²)`, the skew-normal law `SN(m, s, α)` is `TauCeti.Probability.skewNormalMeasure m s α`,
Lebesgue measure with density `f(x) = 2ϕ(y)Φ(αy)/s` (`TauCeti.Probability.skewNormalPDFReal_of_pos`,
`TauCeti.Probability.skewNormalMeasure_eq_withDensity`), and the zero measure for `s ≤ 0`
(`TauCeti.Probability.skewNormalMeasure_of_nonpos`) (Azzalini and Capitanio 2014). For `s > 0`:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_skewNormalMeasure`), with a
  positive density (`TauCeti.Probability.skewNormalPDFReal_pos`), `TauCeti.Probability.skewNormalPDF`,
  `TauCeti.Probability.hasPDF_of_hasLaw_skewNormalMeasure`,
  `TauCeti.Probability.rnDeriv_skewNormalMeasure`, and support `ℝ`
  (`TauCeti.Probability.support_skewNormalMeasure`);
- for independent standard Gaussians `Z₁`, `Z₂`, `m + s(d|Z₁| + √(1 − d²) Z₂)` has this law
  (`TauCeti.Probability.map_prod_gaussianReal_eq_skewNormalMeasure`,
  `TauCeti.Probability.hasLaw_skewNormalMeasure_of_indepFun`);
- `F(x) = Φ(y) − 2T(y, α)` with Owen's `T`, Tau Ceti's `Real.owensT` of §8.2
  (`TauCeti.Probability.cdf_skewNormalMeasure_eq`), continuous and strictly increasing, with
  derivative `f` (`TauCeti.Probability.continuous_cdf_skewNormalMeasure`,
  `TauCeti.Probability.strictMono_cdf_skewNormalMeasure`,
  `TauCeti.Probability.hasDerivAt_cdf_skewNormalMeasure`);
- `E X = m + sd√(2/π)` and `Var X = s²(1 − 2d²/π)`
  (`TauCeti.Probability.integral_id_skewNormalMeasure`,
  `TauCeti.Probability.variance_id_skewNormalMeasure`);
- `D = ℝ`, `M(t) = 2e^(mt + s²t²/2) Φ(dst)` and `K(t) = log 2 + mt + s²t²/2 + log Φ(dst)`
  (`TauCeti.Probability.integrableExpSet_id_skewNormalMeasure`,
  `TauCeti.Probability.mgf_id_skewNormalMeasure`, `TauCeti.Probability.cgf_id_skewNormalMeasure`);
- the quantile is the Owen-T root: `Q(u) = x` exactly when `Φ((x − m)/s) − 2T((x − m)/s, α) = u`
  (`TauCeti.Probability.quantile_skewNormalMeasure_eq_iff`). Prove that it is strictly increasing
  and continuous on `(0, 1)` and tends to `−∞` at `0` and to `+∞` at `1`, completing its root
  characterization. Route: §7.2 (`MeasureTheory.Measure.strictMonoOn_quantile`,
  `MeasureTheory.Measure.continuousOn_quantile`,
  `MeasureTheory.Measure.tendsto_quantile_nhdsGT_zero_of_cdf_pos`,
  `MeasureTheory.Measure.tendsto_quantile_nhdsLT_one_of_cdf_lt_one`) with the continuity and strict
  monotonicity of `F` and `0 < F < 1`;
- `α = 0` gives the Gaussian law `N(m, s²)` (`TauCeti.Probability.skewNormalMeasure_zero_shape`), and
  reflecting the shape reflects the law: `−X` has law `SN(−m, s, −α)`
  (`TauCeti.Probability.map_neg_skewNormalMeasure`);
- the family is measurable in `(m, s, α)` (`TauCeti.Probability.measurable_skewNormalMeasure`).

*Needs:* Mathlib `ProbabilityTheory.cond`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.gaussianPDFReal`, `ProbabilityTheory.cdf`; Tau Ceti
`TauCeti.Probability.chiMeasure`, `TauCeti.Probability.gaussianReal_map_abs`, `Real.owensT`; §1.10,
§2.3, §2.4, §7.2, §7.3, §7.7, §8.2, §10.4.

**Checks.**

- For `v > 0`, folding `N(0, v)`, conditioning it on `[0, ∞)` and `chi(1, √v)` give one law:
  the truncation formulas with `α = 0`, `β = +∞`, `Z = 1/2` give mean `σϕ(0)/(1/2) = √(2v/π)` and
  variance `v(1 − 2/π)`, the chi values at `k = 1`; omitting the normalization by `Z` would give the
  mean `σϕ(0) = √(v/(2π))`.
- `N(0, 1)` truncated to `(−1, 2)`: mean `(ϕ(−1) − ϕ(2))/(Φ(2) − Φ(−1)) ≈ 0.2296`, variance
  `≈ 0.5198` and median `z(Φ(−1) + (Φ(2) − Φ(−1))/2) ≈ 0.1712`, all three agreeing with direct
  integration of the truncated density; writing the mean with `ϕ(β) − ϕ(α)` would give `−0.2296`.
- Skew-normal with `α = 1`: `F(m) = 1/2 − 2T(0, 1) = 1/2 − arctan(1)/π = 1/4`; by the construction,
  `X − m = s(|Z₁| + Z₂)/√2`, this is the probability `1/4` of the quarter-plane `Z₂ ≤ −|Z₁|`. The mean
  is `m + s/√π`; a density without the factor `2` would have total mass `1/2`.

### 10.10 Uniform sums and bounded elementary laws

**Irwin–Hall.** For `n ∈ ℕ`, the Irwin–Hall law `IH(n)` is `TauCeti.Probability.irwinHallMeasure n`,
the `n`-th convolution power `MeasureTheory.Measure.convolutionPower` (§7.5) of the unit uniform law
(`TauCeti.Probability.irwinHallMeasure_def`), the law of the sum of `n` independent unit uniform
variables (`TauCeti.Probability.map_sum_pi_uniformMeasure_zero_one`,
`ProbabilityTheory.iIndepFun.hasLaw_sum_irwinHallMeasure`); `n = 0` gives `δ₀`
(`TauCeti.Probability.irwinHallMeasure_zero`) and `n = 1` the unit uniform law
(`TauCeti.Probability.irwinHallMeasure_one`), it is a probability measure for every `n`
(`TauCeti.Probability.isProbabilityMeasure_irwinHallMeasure`), and
`IH(m) ∗ IH(n) = IH(m + n)` (`TauCeti.Probability.irwinHallMeasure_conv_irwinHallMeasure`)
(Johnson, Kotz and Balakrishnan, vol. 2). Then:

- for `n ≥ 1`, `F(x) = (1/n!) ∑_{k=0}^{n} (−1)^k C(n, k) max(x − k, 0)^n`
  (`TauCeti.Probability.cdf_irwinHallMeasure_eq`), `0` for `x ≤ 0` and `1` for `x ≥ n`, continuous
  and strictly increasing on `[0, n]` (`TauCeti.Probability.continuous_cdf_irwinHallMeasure`,
  `TauCeti.Probability.strictMonoOn_cdf_irwinHallMeasure`), with support `[0, n]`
  (`TauCeti.Probability.support_irwinHallMeasure`);
- for `n ≥ 2`, `f(x) = (1/(n − 1)!) ∑_{k=0}^{n} (−1)^k C(n, k) max(x − k, 0)^(n−1)`
  (`TauCeti.Probability.irwinHallPDFReal_eq`), and for `n = 1` the uniform density
  (`TauCeti.Probability.irwinHallPDFReal_one`); for `n ≥ 1` the density interface is
  `TauCeti.Probability.irwinHallPDFReal`, `TauCeti.Probability.irwinHallPDF`,
  `TauCeti.Probability.irwinHallMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_irwinHallMeasure` and
  `TauCeti.Probability.rnDeriv_irwinHallMeasure`;
- `E X = n/2` and `Var X = n/12` (`TauCeti.Probability.integral_id_irwinHallMeasure`,
  `TauCeti.Probability.variance_id_irwinHallMeasure`), every natural moment is finite
  (`TauCeti.Probability.integrable_pow_irwinHallMeasure`), `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_irwinHallMeasure`), `M(t) = ((e^t − 1)/t)^n` for `t ≠ 0`
  (`TauCeti.Probability.mgf_id_irwinHallMeasure`) and `M(0) = 1` (Mathlib's
  `ProbabilityTheory.mgf_zero`), with `K` and `φ` (`TauCeti.Probability.cgf_id_irwinHallMeasure`,
  `TauCeti.Probability.charFun_irwinHallMeasure`);
- for `n ≥ 1` the quantile is the unique root in `(0, n)` of the piecewise-polynomial cdf
  (`TauCeti.Probability.quantile_irwinHallMeasure_mem_Ioo`,
  `TauCeti.Probability.quantile_irwinHallMeasure_eq_iff`), strictly increasing and continuous on
  `(0, 1)` with limits `0` and `n` (`TauCeti.Probability.strictMonoOn_quantile_irwinHallMeasure`,
  `TauCeti.Probability.continuousOn_quantile_irwinHallMeasure`,
  `TauCeti.Probability.tendsto_quantile_irwinHallMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_irwinHallMeasure_nhdsLT_one`), and at `n = 0` it is `0`
  (`TauCeti.Probability.quantile_irwinHallMeasure_zero`); no radical formula in arbitrary degree is
  asked for;
- measurability in `n` holds because every function on `ℕ` is measurable (Mathlib's
  `measurable_from_nat`).

**Bates.** For `n ≥ 1`, the Bates law `Bates(n)` is `TauCeti.Probability.batesMeasure n`, the image of
`IH(n)` under `x ↦ x/n` (`TauCeti.Probability.batesMeasure_eq_map_irwinHallMeasure`), the law of the
average of `n` independent unit uniform variables
(`TauCeti.Probability.map_average_pi_uniformMeasure_zero_one`,
`ProbabilityTheory.iIndepFun.hasLaw_average_batesMeasure`), and `Bates(0)` is the zero measure
(`TauCeti.Probability.batesMeasure_zero`). It inherits the Irwin–Hall theory: for `n ≥ 1` it is a
probability measure (`TauCeti.Probability.isProbabilityMeasure_batesMeasure`), the unit uniform law
at `n = 1` (`TauCeti.Probability.batesMeasure_one`); its density is `n f_{IH(n)}(nx)`
(`TauCeti.Probability.batesPDFReal_def`, `TauCeti.Probability.batesPDFReal_eq`), with
`TauCeti.Probability.batesPDF`, `TauCeti.Probability.batesMeasure_eq_withDensity`,
`TauCeti.Probability.hasPDF_of_hasLaw_batesMeasure` and `TauCeti.Probability.rnDeriv_batesMeasure`;
its cdf is `F_{IH(n)}(nx)` (`TauCeti.Probability.cdf_batesMeasure`,
`TauCeti.Probability.cdf_batesMeasure_eq`); its quantile is `Q_{IH(n)}(u)/n`
(`TauCeti.Probability.quantile_batesMeasure`), the unique root in `(0, 1)` of its cdf
(`TauCeti.Probability.quantile_batesMeasure_mem_Ioo`,
`TauCeti.Probability.quantile_batesMeasure_eq_iff`),
strictly increasing and continuous on `(0, 1)` with limits `0` and `1`
(`TauCeti.Probability.strictMonoOn_quantile_batesMeasure`,
`TauCeti.Probability.continuousOn_quantile_batesMeasure`,
`TauCeti.Probability.tendsto_quantile_batesMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_batesMeasure_nhdsLT_one`); `E X = 1/2` and
`Var X = 1/(12n)` (`TauCeti.Probability.integral_id_batesMeasure`,
`TauCeti.Probability.variance_id_batesMeasure`); `D = ℝ` and `M(t) = ((e^(t/n) − 1)/(t/n))^n` for
`t ≠ 0`, with `K` and `φ` (`TauCeti.Probability.integrableExpSet_id_batesMeasure`,
`TauCeti.Probability.mgf_id_batesMeasure`, `TauCeti.Probability.cgf_id_batesMeasure`,
`TauCeti.Probability.charFun_batesMeasure`); and the family is measurable in `n`
(`TauCeti.Probability.measurable_batesMeasure`).

**Triangular.** For `a < b` and `a ≤ c ≤ b`, the triangular law `Tri(a, b, c)` with endpoints `a`, `b`
and mode `c` is `TauCeti.Probability.triangularMeasure a b c`, Lebesgue measure with density
`2(x − a)/((b − a)(c − a))` for `a < x < c`, `2(b − x)/((b − a)(b − c))` for `c ≤ x < b`, and `0`
off `(a, b)` (`TauCeti.Probability.triangularPDFReal_def`,
`TauCeti.Probability.triangularMeasure_eq_withDensity`);
for `c = a` or `c = b` only the nonempty branch occurs. It is the zero measure unless `a < b` and
`a ≤ c ≤ b` (`TauCeti.Probability.triangularMeasure_eq_zero_of_not`) and a probability measure
exactly then (`TauCeti.Probability.isProbabilityMeasure_triangularMeasure_iff`) (Johnson, Kotz and
Balakrishnan, vol. 2). For `a < b`, `a ≤ c ≤ b`:

- the density interface is `TauCeti.Probability.triangularPDFReal`,
  `TauCeti.Probability.triangularPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_triangularMeasure` and
  `TauCeti.Probability.rnDeriv_triangularMeasure`, and the support is `[a, b]`
  (`TauCeti.Probability.support_triangularMeasure`);
- the cdf is piecewise quadratic: `0` for `x ≤ a`, `(x − a)²/((b − a)(c − a))` for `a < x ≤ c`,
  `1 − (b − x)²/((b − a)(b − c))` for `c < x ≤ b`, and `1` for `x > b`
  (`TauCeti.Probability.cdf_triangularMeasure_eq`), with `F(c) = (c − a)/(b − a)`
  (`TauCeti.Probability.cdf_triangularMeasure_mode`);
- `Q(u) = a + √(u(b − a)(c − a))` for `u ≤ (c − a)/(b − a)` and `Q(u) = b − √((1 − u)(b − a)(b − c))`
  otherwise (`TauCeti.Probability.quantile_triangularMeasure`), with limits `a` and `b`
  (`TauCeti.Probability.tendsto_quantile_triangularMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_triangularMeasure_nhdsLT_one`);
- `E X = (a + b + c)/3` and `Var X = (a² + b² + c² − ab − ac − bc)/18`
  (`TauCeti.Probability.integral_id_triangularMeasure`,
  `TauCeti.Probability.variance_id_triangularMeasure`); every natural moment is the finite binomial
  sum obtained from the two branches,
  `E Xⁿ = (2/(b − a)) ∑_{k=0}^{n} C(n, k)/(k + 2) (a^(n−k)(c − a)^(k+1) − b^(n−k)(c − b)^(k+1))`
  (`TauCeti.Probability.integral_pow_triangularMeasure`), and `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_triangularMeasure`);
- the family is measurable in `(a, b, c)` (`TauCeti.Probability.measurable_triangularMeasure`).

**Kumaraswamy.** For `a, b > 0`, the Kumaraswamy law `Kum(a, b)` is
`TauCeti.Probability.kumaraswamyMeasure a b`, Lebesgue measure with density
`f(x) = abx^(a−1)(1 − x^a)^(b−1)` on `(0, 1)` and `0` off it
(`TauCeti.Probability.kumaraswamyPDFReal_of_mem_Ioo`,
`TauCeti.Probability.kumaraswamyPDFReal_of_notMem_Ioo`,
`TauCeti.Probability.kumaraswamyMeasure_eq_withDensity`), the zero measure unless `a, b > 0`
(`TauCeti.Probability.kumaraswamyMeasure_of_not_pos`), and a probability measure exactly when
`a, b > 0` (`TauCeti.Probability.isProbabilityMeasure_kumaraswamyMeasure_iff`). For `a, b > 0`:

- the density interface is `TauCeti.Probability.kumaraswamyPDFReal`,
  `TauCeti.Probability.kumaraswamyPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_kumaraswamyMeasure`
  and `TauCeti.Probability.rnDeriv_kumaraswamyMeasure`, and the support is `[0, 1]`
  (`TauCeti.Probability.support_kumaraswamyMeasure`);
- `F(x) = 1 − (1 − x^a)^b` on `[0, 1]`, `0` for `x ≤ 0` and `1` for `x ≥ 1`
  (`TauCeti.Probability.cdf_kumaraswamyMeasure_eq`), and `Q(u) = (1 − (1 − u)^(1/b))^(1/a)`
  (`TauCeti.Probability.quantile_kumaraswamyMeasure`), with limits `0` and `1`
  (`TauCeti.Probability.tendsto_quantile_kumaraswamyMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_kumaraswamyMeasure_nhdsLT_one`);
- for real `q`, `x^q` is integrable exactly when `q > −a`, and then `E X^q = b B(1 + q/a, b)`
  (`TauCeti.Probability.integrable_rpow_kumaraswamyMeasure_iff`,
  `TauCeti.Probability.integral_rpow_kumaraswamyMeasure`); in particular `E X = b B(1 + 1/a, b)` and
  `Var X = b B(1 + 2/a, b) − (b B(1 + 1/a, b))²` (`TauCeti.Probability.integral_id_kumaraswamyMeasure`,
  `TauCeti.Probability.variance_id_kumaraswamyMeasure`), and `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_kumaraswamyMeasure`);
- `X^a` has the Beta law `Beta(1, b)` (`TauCeti.Probability.map_rpow_kumaraswamyMeasure`,
  `TauCeti.Probability.hasLaw_rpow_of_hasLaw_kumaraswamyMeasure`), and `Kum(1, b)` is
  `Beta(1, b)` (`TauCeti.Probability.kumaraswamyMeasure_one_left`);
- the family is measurable in `(a, b)` (`TauCeti.Probability.measurable_kumaraswamyMeasure`).

*Needs:* Mathlib `ProbabilityTheory.mgf_zero`, `ProbabilityTheory.betaMeasure`,
`ProbabilityTheory.beta`, `measurable_from_nat`; Tau Ceti `TauCeti.Probability.uniformMeasure`,
`MeasureTheory.Measure.convolutionPower`; §0.3, §1.7, §7.1, §7.2, §7.5.

**Checks.**

- `IH(2)` is `Tri(0, 2, 1)`: both cdfs are `x²/2` on `[0, 1]` and `1 − (2 − x)²/2` on `[1, 2]`, and
  both variances are `1/6`; `IH(3)` has `F(1) = 1/6` and, by symmetry, `F(3/2) = 1/2`; the density's
  expression (power `n − 1`, denominator `(n − 1)!`) taken as the cdf would give `1/2` at `x = 1`.
- `Bates(0)` is the zero measure while `IH(0) = δ₀`: dividing by `n` at `n = 0` is excluded rather
  than producing `δ₀`. `Bates(2)` has variance `1/24 = (2/12)/2²`.
- Triangular with `c = a`: the level `(c − a)/(b − a)` is `0`, so only the second branch of the
  quantile occurs; for `a = c = 0`, `b = 1`, `Q(0.36) = 1 − √0.64 = 0.2` and `F(0.2) = 1 − 0.8² = 0.36`.
- `Kum(1, b)` is `Beta(1, b)`: `E X = b B(2, b) = 1/(b + 1)`; for `a = 2`, `b = 3`,
  `E X = 3 B(3/2, 3) = 16/35 ≈ 0.457`.

### 10.11 Gompertz and log-logistic

**Gompertz.** For `η, b > 0` the Gompertz law is `TauCeti.Probability.gompertzMeasure η b`, the law
of `X = log(1 + E/η)/b` for `E` exponential of rate one, that is the image of
`ProbabilityTheory.expMeasure 1` under `e ↦ log(1 + e/η)/b`; it is the zero measure unless
`η, b > 0` (`TauCeti.Probability.gompertzMeasure_of_pos`,
`TauCeti.Probability.gompertzMeasure_of_not_pos`), and it is a probability measure exactly when
`η, b > 0` (`TauCeti.Probability.isProbabilityMeasure_gompertzMeasure_iff`), with the
random-variable form `TauCeti.Probability.hasLaw_gompertzMeasure_of_hasLaw_expMeasure` (Johnson,
Kotz and Balakrishnan, *Continuous Univariate Distributions*, vol. 2). For `η, b > 0`:

- its density is `f(x) = η b e^(bx) e^(−η(e^(bx) − 1))` for `x > 0` and `0` for `x ≤ 0`
  (`TauCeti.Probability.gompertzPDFReal`, `TauCeti.Probability.gompertzPDFReal_of_pos`,
  `TauCeti.Probability.gompertzPDFReal_of_nonpos`), with
  `TauCeti.Probability.gompertzMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_gompertzMeasure` and
  `TauCeti.Probability.rnDeriv_gompertzMeasure`; the density is positive on `(0, ∞)`, the law is
  almost surely positive and atomless, and its topological support is `[0, ∞)`
  (`TauCeti.Probability.gompertzPDFReal_pos`, `TauCeti.Probability.ae_pos_gompertzMeasure`,
  `TauCeti.Probability.nullSingletonClass_gompertzMeasure`,
  `TauCeti.Probability.support_gompertzMeasure`);
- its survival function is `1 − F(x) = e^(−η(e^(bx) − 1))` for `x ≥ 0`, and `F(x) = 0` for
  `x ≤ 0` (`TauCeti.Probability.cdf_gompertzMeasure_eq`,
  `TauCeti.Probability.one_sub_cdf_gompertzMeasure`); its quantile is
  `Q(u) = log(1 − log(1 − u)/η)/b` for `0 < u < 1`, continuous and strictly increasing there, with
  limits `0` at `0` and `∞` at `1` (`TauCeti.Probability.quantile_gompertzMeasure`,
  `TauCeti.Probability.continuousOn_quantile_gompertzMeasure`,
  `TauCeti.Probability.strictMonoOn_quantile_gompertzMeasure`,
  `TauCeti.Probability.tendsto_quantile_gompertzMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_gompertzMeasure_nhdsLT_one`);
- in the notation of §7.9, its hazard is `h(x) = f(x)/(1 − F(x)) = η b e^(bx)` for `x > 0` and its
  cumulative hazard is `H(x) = −log(1 − F(x)) = η(e^(bx) − 1)` for `x ≥ 0`, so `H(0) = 0`
  (`TauCeti.Probability.gompertzPDFReal_div_one_sub_cdf`,
  `TauCeti.Probability.neg_log_one_sub_cdf_gompertzMeasure`);
- every natural moment and every exponential moment is finite, so `D = ℝ`
  (`TauCeti.Probability.integrable_pow_gompertzMeasure`,
  `TauCeti.Probability.integrable_exp_mul_id_gompertzMeasure`,
  `TauCeti.Probability.integrableExpSet_id_gompertzMeasure`), and they are the convergent integrals

      E[Xⁿ] = b^(−n) ∫₀^∞ log(1 + y/η)ⁿ e^(−y) dy,      M(t) = ∫₀^∞ (1 + y/η)^(t/b) e^(−y) dy,

  with `K(t) = log M(t)` (`TauCeti.Probability.integral_pow_gompertzMeasure`,
  `TauCeti.Probability.mgf_id_gompertzMeasure`, `TauCeti.Probability.cgf_id_gompertzMeasure`); the
  mean and the variance are expressed through the first two of these integrals
  (`TauCeti.Probability.integral_id_gompertzMeasure`,
  `TauCeti.Probability.variance_id_gompertzMeasure`). These are integrals against the exponential
  law through the defining pushforward; no further special function and no separate moment
  computation enters;
- the family is jointly measurable in `(η, b)` (`TauCeti.Probability.measurable_gompertzMeasure`),
  and for `c > 0` the law of `cX` is Gompertz `(η, b/c)`
  (`TauCeti.Probability.map_mul_gompertzMeasure`, `TauCeti.Probability.hasLaw_mul_gompertzMeasure`).

**Log-logistic.** For scale `a > 0` and shape `b > 0` the log-logistic law is
`TauCeti.Probability.logLogisticMeasure a b`, the image under `exp` of the logistic law of §10.1
with location `log a` and scale `1/b`, `TauCeti.Probability.logisticMeasure (log a) b⁻¹`; it is
the zero measure unless `a, b > 0` (`TauCeti.Probability.logLogisticMeasure_of_pos`,
`TauCeti.Probability.logLogisticMeasure_of_not_pos`), a probability measure exactly when
`a, b > 0` (`TauCeti.Probability.isProbabilityMeasure_logLogisticMeasure_iff`), and its logarithm
has that logistic law (`TauCeti.Probability.map_log_logLogisticMeasure`,
`TauCeti.Probability.hasLaw_logLogisticMeasure_of_hasLaw_logisticMeasure`) (Johnson, Kotz and
Balakrishnan, vol. 2). For `a, b > 0`:

- its density is `f(x) = (b/a)(x/a)^(b − 1)/(1 + (x/a)^b)²` for `x > 0` and `0` for `x ≤ 0`
  (`TauCeti.Probability.logLogisticPDFReal`, `TauCeti.Probability.logLogisticPDFReal_of_pos`,
  `TauCeti.Probability.logLogisticPDFReal_of_nonpos`), positive on `(0, ∞)`
  (`TauCeti.Probability.logLogisticPDFReal_pos`), with
  `TauCeti.Probability.logLogisticMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_logLogisticMeasure` and
  `TauCeti.Probability.rnDeriv_logLogisticMeasure`; the law is carried by `(0, ∞)` and its
  topological support is `[0, ∞)` (`TauCeti.Probability.ae_mem_Ioi_logLogisticMeasure`,
  `TauCeti.Probability.support_logLogisticMeasure`);
- on `x > 0`, with `F(x) = 0` for `x ≤ 0` (`TauCeti.Probability.cdf_logLogisticMeasure_eq`,
  `TauCeti.Probability.one_sub_cdf_logLogisticMeasure`,
  `TauCeti.Probability.quantile_logLogisticMeasure`,
  `TauCeti.Probability.logLogisticPDFReal_div_one_sub_cdf`,
  `TauCeti.Probability.neg_log_one_sub_cdf_logLogisticMeasure`, the last for `x ≥ 0`),

      F(x) = 1/(1 + (x/a)^(−b)),      Q(u) = a (u/(1 − u))^(1/b),
      h(x) = (b/a)(x/a)^(b − 1)/(1 + (x/a)^b),      H(x) = log(1 + (x/a)^b),

  and the quantile tends to `0` at `0` and to `∞` at `1`
  (`TauCeti.Probability.tendsto_quantile_logLogisticMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_logLogisticMeasure_nhdsLT_one`);
- for real `q` the power `x^q` is integrable exactly when `|q| < b`, and then
  `E[X^q] = a^q Γ(1 + q/b) Γ(1 − q/b)` (`TauCeti.Probability.integrable_rpow_logLogisticMeasure_iff`,
  `TauCeti.Probability.integral_rpow_logLogisticMeasure`, and for natural powers
  `TauCeti.Probability.integrable_pow_logLogisticMeasure_iff`,
  `TauCeti.Probability.integral_pow_logLogisticMeasure`); the mean `a Γ(1 + 1/b) Γ(1 − 1/b)`
  exists exactly when `b > 1` and the variance
  `a²(Γ(1 + 2/b) Γ(1 − 2/b) − (Γ(1 + 1/b) Γ(1 − 1/b))²)` is finite exactly when `b > 2`
  (`TauCeti.Probability.integrable_id_logLogisticMeasure_iff`,
  `TauCeti.Probability.integral_id_logLogisticMeasure`,
  `TauCeti.Probability.integral_sq_logLogisticMeasure`,
  `TauCeti.Probability.variance_id_logLogisticMeasure`); and `D = (−∞, 0]`
  (`TauCeti.Probability.integrable_exp_mul_id_logLogisticMeasure_iff`,
  `TauCeti.Probability.integrableExpSet_id_logLogisticMeasure`);
- the family is jointly measurable (`TauCeti.Probability.measurable_logLogisticMeasure`), and for
  `c > 0` the law of `cX` has scale `ca` and the same shape
  (`TauCeti.Probability.map_mul_logLogisticMeasure`,
  `TauCeti.Probability.hasLaw_mul_logLogisticMeasure`).

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.cdf`, `ProbabilityTheory.mgf`,
`ProbabilityTheory.cgf`, `ProbabilityTheory.integrableExpSet`, `Real.Gamma`; Tau Ceti
`MeasureTheory.Measure.quantile`, `TauCeti.Probability.logisticMeasure`; §1.5 (exponential law),
§7.2 (quantiles), §7.9 (survival and hazard), §10.1 (logistic law).

**Checks.**

- For `η = b = 1` the median is `log(1 + log 2) ≈ 0.527`, where the survival function
  `e^(−(e^x − 1))` equals `1/2`. For `η = 1, b = 2` the hazard at `0` is `ηb = 2`: the other common
  Gompertz convention, with hazard `η e^(bx)` and survival `e^(−(η/b)(e^(bx) − 1))`, gives `1` and a
  different law.
- `E[e^(bX)] = 1 + 1/η`: at `t = b` the integrand of `M` is `(1 + y/η) e^(−y)`, matching
  `e^(bX) = 1 + E/η`; an exponent `tb` in place of `t/b` in the representation would give a
  different value unless `b = 1`.
- `F(a) = 1/2` for every shape `b`, so the scale is the median. For `b = 2` the mean is
  `a Γ(3/2) Γ(1/2) = πa/2 ≈ 1.571a`; for `b = 1`, where `F(x) = x/(a + x)`, neither `E[X]` nor
  `E[X^(−1)]` is finite, which a one-sided threshold `q < b` would get wrong at `q = −1`.

### 10.12 Generalized gamma

For `a, s > 0` and `c ≠ 0` the generalized gamma law is
`TauCeti.Probability.generalizedGammaMeasure a c s`, the law of `s G^(1/c)` for `G` Gamma of shape
`a` and rate one, that is the image of `ProbabilityTheory.gammaMeasure a 1` under
`x ↦ s x^(1/c)`, and the zero measure for every other parameter
(`TauCeti.Probability.generalizedGammaMeasure_of_valid`,
`TauCeti.Probability.generalizedGammaMeasure_of_not_valid`); it is a probability measure exactly
at these parameters (`TauCeti.Probability.isProbabilityMeasure_generalizedGammaMeasure_iff`),
`(X/s)^c` is Gamma `(a, 1)` (`TauCeti.Probability.generalizedGammaMeasure_map_rpow`), and
`TauCeti.Probability.hasLaw_generalizedGammaMeasure_of_hasLaw_gammaMeasure` is the random-variable
form. The signed power `c` follows Stacy 1962 as fixed by SciPy's `gengamma` documentation. For
`a, s > 0`, `c ≠ 0`:

- its density is `f(x) = |c|/(s Γ(a)) (x/s)^(ac − 1) e^(−(x/s)^c)` for `x > 0` and `0` for
  `x ≤ 0` (`TauCeti.Probability.generalizedGammaPDFReal`,
  `TauCeti.Probability.generalizedGammaPDFReal_of_pos`,
  `TauCeti.Probability.generalizedGammaPDFReal_of_nonpos`), with
  `TauCeti.Probability.generalizedGammaMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_generalizedGammaMeasure` and
  `TauCeti.Probability.rnDeriv_generalizedGammaMeasure`; the law is almost surely positive with
  topological support `[0, ∞)` (`TauCeti.Probability.ae_pos_generalizedGammaMeasure`,
  `TauCeti.Probability.support_generalizedGammaMeasure`);
- its cdf is zero for `x ≤ 0` and, for `x > 0`, `F(x) = G_a((x/s)^c)` when `c > 0` and
  `F(x) = 1 − G_a((x/s)^c)` when `c < 0` (`TauCeti.Probability.cdf_generalizedGammaMeasure_eq`);
  its quantile is `Q(u) = s (G_a⁻¹(u))^(1/c)` for `c > 0` and `Q(u) = s (G_a⁻¹(1 − u))^(1/c)` for
  `c < 0`, where `G_a⁻¹` is `TauCeti.inverseRegularizedGamma a` of §8.4
  (`TauCeti.Probability.quantile_generalizedGammaMeasure`), continuous on `(0, 1)` with limits `0`
  and `∞` (`TauCeti.Probability.continuousOn_quantile_generalizedGammaMeasure`,
  `TauCeti.Probability.tendsto_quantile_generalizedGammaMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_generalizedGammaMeasure_nhdsLT_one`);
- for real `q` the power `x^q` is integrable exactly when `a + q/c > 0`, and then
  `E[X^q] = s^q Γ(a + q/c)/Γ(a)`
  (`TauCeti.Probability.integrable_rpow_generalizedGammaMeasure_iff`,
  `TauCeti.Probability.integral_rpow_generalizedGammaMeasure`, with the natural-power forms
  `TauCeti.Probability.integrable_pow_generalizedGammaMeasure_iff` and
  `TauCeti.Probability.integral_pow_generalizedGammaMeasure`); hence the mean
  `s Γ(a + 1/c)/Γ(a)` exists exactly when `a + 1/c > 0`, and for `a + 2/c > 0` the variance is
  `s²(Γ(a + 2/c)/Γ(a) − (Γ(a + 1/c)/Γ(a))²)`
  (`TauCeti.Probability.integrable_id_generalizedGammaMeasure_iff`,
  `TauCeti.Probability.integral_id_generalizedGammaMeasure`,
  `TauCeti.Probability.variance_id_generalizedGammaMeasure`);
- `D = ℝ` for `c > 1`, `D = (−∞, 1/s)` for `c = 1`, and `D = (−∞, 0]` for `c < 1`, `c ≠ 0`
  (`TauCeti.Probability.integrableExpSet_id_generalizedGammaMeasure`); no further closed transform
  is part of the roadmap;
- the family is jointly measurable in `(a, c, s)`
  (`TauCeti.Probability.measurable_generalizedGammaMeasure`), and for `t > 0` the law of `tX` has
  scale `ts` (`TauCeti.Probability.generalizedGammaMeasure_map_const_mul`).

In these coordinates `(a, c, s)` the following laws are generalized gamma laws:

- `(a, 1, s)` is the Gamma law of shape `a` and rate `1/s`, `ProbabilityTheory.gammaMeasure a s⁻¹`
  (`TauCeti.Probability.generalizedGammaMeasure_one`);
- for `c > 0`, `(1, c, s)` is the Weibull law of shape `c` and scale `s` of §3.4,
  `TauCeti.Probability.weibullMeasure c s`
  (`TauCeti.Probability.generalizedGammaMeasure_one_shape_eq_weibullMeasure`);
- `(a, −1, s)` is the inverse-gamma law `TauCeti.Probability.inverseGammaMeasure a s` of §3.6, the
  law of `1/G` for `G` Gamma of shape `a` and rate `s`
  (`TauCeti.Probability.generalizedGammaMeasure_neg_one_eq_inverseGammaMeasure`, for all `a, s`);
- for `α > 0`, `(1, −α, s)` is the Fréchet law with cdf `e^(−(x/s)^(−α))` for `x > 0`, which is
  the generalized extreme-value law of §10.2 with location `s`, scale `s/α` and shape `1/α`
  (`TauCeti.Probability.generalizedGammaMeasure_one_shape_neg_eq_generalizedExtremeValueMeasure`,
  `TauCeti.Probability.cdf_generalizedExtremeValueMeasure_frechet`);
- for `k > 0`, the chi law of degree `k` and scale `s` of §10.4 is `(k/2, 2, √2 s)`
  (`TauCeti.Probability.chiMeasure_eq_generalizedGammaMeasure`), and the Nakagami law `(m, Ω)` is
  `(m, 2, √(Ω/m))` (`TauCeti.Probability.nakagamiMeasure_eq_generalizedGammaMeasure`, for all
  `m, Ω`). The condition `a + q/c > 0` becomes their real-power thresholds `q > −k` and `q > −2m`
  (`TauCeti.Probability.integrable_rpow_chiMeasure_iff`,
  `TauCeti.Probability.integrable_rpow_nakagamiMeasure_iff`). The chi law of degree zero is the
  Dirac mass at `0` (`TauCeti.Probability.chiMeasure_zero`) and is treated directly, not as a
  generalized gamma law.

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `Real.Gamma`; Tau Ceti
`TauCeti.regularizedGamma`, `TauCeti.inverseRegularizedGamma`, `TauCeti.Probability.weibullMeasure`,
`TauCeti.Probability.inverseGammaMeasure`, `TauCeti.Probability.generalizedExtremeValueMeasure`,
`TauCeti.Probability.chiMeasure`, `TauCeti.Probability.nakagamiMeasure`; §1.6, §1.11 (real-power
moments of the Gamma law), §2.1, §3.4, §3.6, §7.2, §8.4, §10.2, §10.4.

**Checks.**

- `(1, 1, s)` is the exponential law of mean `s`: the mean formula gives `s Γ(2)/Γ(1) = s`. Reading
  `s` as a rate would give mean `1/s`.
- `(1, −1, 1)` is the law of `1/E` for `E` standard exponential, and
  `F(1) = 1 − G_1(1) = e^(−1) ≈ 0.368`. Using `G_a((x/s)^c)` for negative `c` as well would give
  `1 − e^(−1) ≈ 0.632` and a decreasing function of `x`, not a cdf.
- The inverse-gamma law `(2, −1, 1)` has mean `Γ(1)/Γ(2) = 1` and infinite variance, since
  `a + 2/c = 0`. The condition `q > −ac`, which is the right threshold when `c > 0`, would claim
  exactly the wrong range here (`q > 2`).

### 10.13 Generalized normal

For `m ∈ ℝ` and `s, p > 0` the generalized normal law is
`TauCeti.Probability.generalizedNormalMeasure m s p`, Lebesgue measure with the density

    f(x) = p exp(−|(x − m)/s|^p) / (2 s Γ(1/p))

(`TauCeti.Probability.generalizedNormalPDFReal_of_pos`,
`TauCeti.Probability.generalizedNormalMeasure_eq_withDensity`); it is the zero measure unless
`s, p > 0` (`TauCeti.Probability.generalizedNormalMeasure_of_not_pos`) and a probability measure
exactly when `s, p > 0` (`TauCeti.Probability.isProbabilityMeasure_generalizedNormalMeasure_iff`)
(Johnson, Kotz and Balakrishnan). For `s, p > 0`:

- the density is positive everywhere and the topological support is `ℝ`
  (`TauCeti.Probability.generalizedNormalPDFReal_pos`,
  `TauCeti.Probability.support_generalizedNormalMeasure`), with
  `TauCeti.Probability.hasPDF_of_hasLaw_generalizedNormalMeasure` and
  `TauCeti.Probability.rnDeriv_generalizedNormalMeasure`; the family is jointly measurable
  (`TauCeti.Probability.measurable_generalizedNormalMeasure`);
- for independent `ε` symmetric Rademacher (`TauCeti.Probability.rademacherMeasure`, the masses
  `1/2` at `−1` and `1`) and `G` Gamma `(1/p, 1)`, `m + s ε G^(1/p)` has this law
  (`TauCeti.Probability.map_rademacher_prod_gammaMeasure_generalizedNormalMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_generalizedNormalMeasure`); equivalently, the centred law is
  the equal mixture of the generalized gamma law `(1/p, p, s)` of §10.12 and its reflection
  (`TauCeti.Probability.generalizedNormalMeasure_eq_add_map_neg`);
- its cdf and quantile are, with `sign 0 = 0` (`TauCeti.Probability.cdf_generalizedNormalMeasure_eq`,
  `TauCeti.Probability.quantile_generalizedNormalMeasure`,
  `TauCeti.Probability.quantile_generalizedNormalMeasure_half`),

      F(x) = 1/2 + (1/2) sign(x − m) G_(1/p)(|(x − m)/s|^p),
      Q(u) = m + s sign(2u − 1) (G_(1/p)⁻¹(|2u − 1|))^(1/p),   so Q(1/2) = m;

  `F` is continuous and strictly increasing, so `Q(u)` is the unique root of `F(x) = u`, continuous
  in `u` with limits `−∞` and `∞` (`TauCeti.Probability.continuous_cdf_generalizedNormalMeasure`,
  `TauCeti.Probability.strictMono_cdf_generalizedNormalMeasure`,
  `TauCeti.Probability.quantile_generalizedNormalMeasure_eq_iff`,
  `TauCeti.Probability.continuousOn_quantile_generalizedNormalMeasure`,
  `TauCeti.Probability.tendsto_quantile_generalizedNormalMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_generalizedNormalMeasure_nhdsLT_one`);
- the law is symmetric about `m`, its image under `x ↦ 2m − x` being itself
  (`TauCeti.Probability.generalizedNormalMeasure_map_two_mul_sub`); its mean is `m`
  (`TauCeti.Probability.integral_id_generalizedNormalMeasure`), its odd central moments vanish
  (`TauCeti.Probability.integral_pow_sub_generalizedNormalMeasure_of_odd`), and `|X − m|^q` is
  integrable exactly when `q > −1`, with `E[|X − m|^q] = s^q Γ((q + 1)/p)/Γ(1/p)`
  (`TauCeti.Probability.integrable_rpow_abs_sub_generalizedNormalMeasure_iff`,
  `TauCeti.Probability.integral_rpow_abs_sub_generalizedNormalMeasure`). Hence the even central
  moments are `s^n Γ((n + 1)/p)/Γ(1/p)`, the variance is `s² Γ(3/p)/Γ(1/p)`, and every natural raw
  moment is finite and equals `∑_k C(n, 2k) m^(n − 2k) s^(2k) Γ((2k + 1)/p)/Γ(1/p)`
  (`TauCeti.Probability.integral_pow_sub_generalizedNormalMeasure_of_even`,
  `TauCeti.Probability.variance_id_generalizedNormalMeasure`,
  `TauCeti.Probability.integrable_pow_generalizedNormalMeasure`,
  `TauCeti.Probability.integral_pow_generalizedNormalMeasure`);
- `D = ℝ` for `p > 1`, `D = (−1/s, 1/s)` for `p = 1`, and `D = {0}` for `0 < p < 1`
  (`TauCeti.Probability.integrableExpSet_id_generalizedNormalMeasure`); no general transform formula
  is part of the roadmap;
- `p = 1` is the Laplace law of §3.1 with location `m` and scale `s`
  (`TauCeti.Probability.generalizedNormalMeasure_one`), and `p = 2` is the Gaussian law of mean `m`
  and variance `s²/2` (`TauCeti.Probability.generalizedNormalMeasure_two`).

*Needs:* Mathlib `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.gaussianReal`,
`ProbabilityTheory.IndepFun`, `Real.Gamma`; Tau Ceti `TauCeti.Probability.rademacherMeasure`,
`TauCeti.Probability.laplaceMeasure`, `TauCeti.regularizedGamma`, `TauCeti.inverseRegularizedGamma`;
§1.6, §2.1, §3.1, §7.2, §8.4, §10.12.

**Checks.**

- At `p = 2` the variance is `s² Γ(3/2)/Γ(1/2) = s²/2`, so `s` is `√2` times the standard deviation;
  at `p = 1` it is `2s²`, the Laplace variance for scale `s`. A parameterization with `s` the
  standard deviation would break the identification with `N(m, s²/2)`. For `s = 1.3`, `m = 0`, the
  formula `1/2 + G_(1/2)((0.7/1.3)²)/2 ≈ 0.7768` agrees with the Gaussian cdf of standard deviation
  `1.3/√2` at `0.7`.
- At `p = 1/2` every natural moment is finite (the variance is `Γ(6)/Γ(2) s² = 120 s²`) and still
  `D = {0}`: finiteness of all moments does not make the mgf finite near `0`.
- For `m = 0, s = 1, p = 1`, `G_1⁻¹(1/2) = log 2`, so `Q(3/4) = log 2`, the Laplace quantile.

### 10.14 Asymmetric Laplace

For `m ∈ ℝ` and rates `l, r > 0` the asymmetric Laplace law is
`TauCeti.Probability.asymmetricLaplaceMeasure m l r`, the law of `m + E_r − E_l` for independent
exponential variables `E_r` of rate `r` and `E_l` of rate `l`
(`TauCeti.Probability.asymmetricLaplaceMeasure_eq_map`, which holds at every parameter,
`ProbabilityTheory.IndepFun.hasLaw_asymmetricLaplaceMeasure`); it is the zero measure when `l ≤ 0`
or `r ≤ 0` (`TauCeti.Probability.asymmetricLaplaceMeasure_of_nonpos_left`,
`TauCeti.Probability.asymmetricLaplaceMeasure_of_nonpos_right`) and a probability measure for
`l, r > 0` (`TauCeti.Probability.isProbabilityMeasure_asymmetricLaplaceMeasure`). The left tail
decays at rate `l` and the right tail at rate `r` (conventions: SciPy asymmetric Laplace
documentation). For `l, r > 0`, put `w = r/(l + r)`:

- its density is `l r e^(l(x − m))/(l + r)` for `x ≤ m` and `l r e^(−r(x − m))/(l + r)` for
  `x > m` (`TauCeti.Probability.asymmetricLaplacePDFReal_of_le`,
  `TauCeti.Probability.asymmetricLaplacePDFReal_of_lt`), positive everywhere
  (`TauCeti.Probability.asymmetricLaplacePDFReal_pos`), with
  `TauCeti.Probability.asymmetricLaplaceMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_asymmetricLaplaceMeasure` and
  `TauCeti.Probability.rnDeriv_asymmetricLaplaceMeasure`; its topological support is `ℝ`
  (`TauCeti.Probability.support_asymmetricLaplaceMeasure`);
- its cdf and quantile are (`TauCeti.Probability.cdf_asymmetricLaplaceMeasure_eq`,
  `TauCeti.Probability.quantile_asymmetricLaplaceMeasure`)

      F(x) = w e^(l(x − m))                for x ≤ m,      F(x) = 1 − (1 − w) e^(−r(x − m))       for x > m,
      Q(u) = m + log(u/w)/l                for u ≤ w,      Q(u) = m − log((1 − u)/(1 − w))/r      for u > w,

  so `Q(w) = m`; `F` is continuous and strictly increasing, and `Q` is continuous and strictly
  increasing on `(0, 1)` with limits `−∞` and `∞`
  (`TauCeti.Probability.quantile_asymmetricLaplaceMeasure_location`,
  `TauCeti.Probability.continuous_cdf_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.strictMono_cdf_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.continuousOn_quantile_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.strictMonoOn_quantile_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.tendsto_quantile_asymmetricLaplaceMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_asymmetricLaplaceMeasure_nhdsLT_one`);
- its mean is `m + 1/r − 1/l` and its variance `1/r² + 1/l²`
  (`TauCeti.Probability.integral_id_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.variance_id_asymmetricLaplaceMeasure`); every natural moment is finite
  (`TauCeti.Probability.integrable_pow_asymmetricLaplaceMeasure`) and comes from expanding
  `(E_r − E_l)ⁿ` binomially over the independent exponentials:
  `E[(X − m)ⁿ] = ∑_k C(n, k) (k!/r^k) (−1)^(n − k) (n − k)!/l^(n − k)`, and the raw moments follow
  by a second binomial expansion (`TauCeti.Probability.integral_pow_sub_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.integral_pow_asymmetricLaplaceMeasure`);
- `D = (−l, r)`, and on `D` (`TauCeti.Probability.integrableExpSet_id_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.mgf_id_asymmetricLaplaceMeasure`,
  `TauCeti.Probability.cgf_id_asymmetricLaplaceMeasure`)

      M(t) = e^(mt) r l / ((r − t)(l + t)),      K(t) = mt − log(1 − t/r) − log(1 + t/l),

  while `φ(t) = e^(imt) r l/((r − it)(l + it))` for every real `t`
  (`TauCeti.Probability.charFun_asymmetricLaplaceMeasure`);
- equal rates give the Laplace law of §3.1: for all `m, r` the asymmetric Laplace law `(m, r, r)` is
  the Laplace law of location `m` and scale `1/r`
  (`TauCeti.Probability.asymmetricLaplaceMeasure_self`);
- the family is jointly measurable in `(m, l, r)`
  (`TauCeti.Probability.measurable_asymmetricLaplaceMeasure`).

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `MeasureTheory.Measure.prod`,
`ProbabilityTheory.IndepFun`, `MeasureTheory.charFun`; Tau Ceti
`TauCeti.Probability.laplaceMeasure`; §1.5, §3.1, §4.4 (sums and differences), §7.2.

**Checks.**

- For `l = 1, r = 3, m = 0`: `w = P(X ≤ 0) = P(E_3 ≤ E_1) = 3/4`, the mean is `1/3 − 1 = −2/3`, the
  variance `1/9 + 1 = 10/9`, and the median `Q(1/2) = log(2/3) ≈ −0.405`. Attaching `r` to the left
  tail instead would give `w = 1/4` and mean `+2/3`.
- For equal rates `l = r` the variance is `2/r²`, the Laplace variance for scale `1/r`; reading the
  parameters as scales would give `2r²`.
- For the same parameters `M(1) = 3/((3 − 1)(1 + 1)) = 3/4`, inside `D = (−1, 3)`; at `t = 3` the
  right tail `e^(−3x)` makes `e^(tX)` non-integrable, so `D` is open at `r`.

### 10.15 Logit-normal and log-uniform

**Logit-normal.** For `m ∈ ℝ` and `v ∈ ℝ≥0` the logit-normal law is
`TauCeti.Probability.logitNormalMeasure m v`, the image of `N(m, v)` under the sigmoid
`σ(x) = (1 + e^(−x))⁻¹`, Mathlib's `Real.sigmoid`
(`TauCeti.Probability.logitNormalMeasure_def`); it is a probability measure for every `m, v`
(`TauCeti.Probability.isProbabilityMeasure_logitNormalMeasure`), is carried by `(0, 1)`
(`TauCeti.Probability.ae_mem_Ioo_logitNormalMeasure`), and its logit `log(x/(1 − x))` has law
`N(m, v)` (`TauCeti.Probability.map_logit_logitNormalMeasure`,
`ProbabilityTheory.HasLaw.sigmoid_gaussianReal`) (Aitchison and Shen 1980; conventions: PyMC
logit-normal documentation). For `v > 0` and `s = √v`:

- on `0 < x < 1` its density is `f(x) = ϕ((log(x/(1 − x)) − m)/s)/(s x (1 − x))`, that is
  `ProbabilityTheory.gaussianPDFReal m v (log(x/(1 − x)))/(x(1 − x))`, and it vanishes off `(0, 1)`
  (`TauCeti.Probability.logitNormalPDFReal_of_mem`,
  `TauCeti.Probability.logitNormalPDFReal_of_notMem`); it is positive on `(0, 1)`
  (`TauCeti.Probability.logitNormalPDFReal_pos`), with
  `TauCeti.Probability.logitNormalMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_logitNormalMeasure` and
  `TauCeti.Probability.rnDeriv_logitNormalMeasure`; its topological support is `[0, 1]`
  (`TauCeti.Probability.support_logitNormalMeasure`);
- its cdf is `F(x) = Φ((log(x/(1 − x)) − m)/s)` on `(0, 1)`, zero for `x ≤ 0` and one for `x ≥ 1`
  (`TauCeti.Probability.cdf_logitNormalMeasure`, `TauCeti.Probability.cdf_logitNormalMeasure_eq`,
  `TauCeti.Probability.cdf_logitNormalMeasure_of_nonpos`,
  `TauCeti.Probability.cdf_logitNormalMeasure_of_one_le`), and its quantile is
  `Q(u) = σ(m + s z(u))`, that is `σ(m + √(2v) erf⁻¹(2u − 1))` since `z(u) = √2 erf⁻¹(2u − 1)`,
  where `erf⁻¹` is the inverse error function `Real.erfInv` of §2.3
  (`TauCeti.Probability.quantile_logitNormalMeasure`,
  `TauCeti.Probability.quantile_gaussianReal_zero_one`); `Q(u)` lies in
  `(0, 1)`, is continuous on `(0, 1)` and tends to `0` and `1` at the ends
  (`TauCeti.Probability.quantile_logitNormalMeasure_mem_Ioo`,
  `TauCeti.Probability.continuousOn_quantile_logitNormalMeasure`,
  `TauCeti.Probability.tendsto_quantile_logitNormalMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_logitNormalMeasure_nhdsLT_one`).

At `v = 0` the law is the Dirac mass at `σ(m)` (`TauCeti.Probability.logitNormalMeasure_zero_var`),
singular with respect to Lebesgue measure
(`TauCeti.Probability.mutuallySingular_logitNormalMeasure_zero_var`), and its quantile is
constantly `σ(m)`. For all `m, v`:

- every natural moment is the Gaussian integral of a power of the sigmoid,
  `E[Xⁿ] = ∫ σ(y)ⁿ dN(m, v)(y)` (`TauCeti.Probability.integrable_pow_logitNormalMeasure`,
  `TauCeti.Probability.integral_pow_logitNormalMeasure`), and the mean and variance are expressed
  through these integrals (`TauCeti.Probability.integral_id_logitNormalMeasure`,
  `TauCeti.Probability.variance_id_logitNormalMeasure`); no elementary closed form is asked for;
  `D = ℝ` (`TauCeti.Probability.integrableExpSet_id_logitNormalMeasure`);
- reflection `1 − X` negates `m`: the image under `x ↦ 1 − x` is the logit-normal law `(−m, v)`
  (`TauCeti.Probability.map_one_sub_logitNormalMeasure`);
- the family is jointly measurable in `(m, v)`
  (`TauCeti.Probability.measurable_logitNormalMeasure`).

**Log-uniform.** For `0 < a < b` the log-uniform law is `TauCeti.Probability.logUniformMeasure a b`,
the image under `exp` of the interval uniform law of §0.3 on `(log a, log b]`,
`TauCeti.Probability.uniformMeasure (log a) (log b)`
(`TauCeti.Probability.logUniformMeasure_of_pos`); every other pair `(a, b)`, including `a = b`,
gives the zero measure (`TauCeti.Probability.logUniformMeasure_of_not_pos`). For `0 < a < b` it is
a probability measure (`TauCeti.Probability.isProbabilityMeasure_logUniformMeasure`) whose
logarithm is uniform (`TauCeti.Probability.map_log_logUniformMeasure`) (Johnson, Kotz and
Balakrishnan), and:

- its density is `f(x) = 1/(x log(b/a))` on `(a, b)` and zero elsewhere
  (`TauCeti.Probability.logUniformPDFReal_of_mem`, `TauCeti.Probability.logUniformPDFReal_pos_iff`),
  with `TauCeti.Probability.logUniformMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_logUniformMeasure` and
  `TauCeti.Probability.rnDeriv_logUniformMeasure`; its topological support is `[a, b]`
  (`TauCeti.Probability.support_logUniformMeasure`);
- `F(x) = 0` for `x ≤ a`, `F(x) = log(x/a)/log(b/a)` on `[a, b]`, and `F(x) = 1` for `x ≥ b`
  (`TauCeti.Probability.cdf_logUniformMeasure_eq`); `Q(u) = a (b/a)^u`
  (`TauCeti.Probability.quantile_logUniformMeasure`), with limits `a` and `b`
  (`TauCeti.Probability.tendsto_quantile_logUniformMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_logUniformMeasure_nhdsLT_one`);
- every real power is integrable (`TauCeti.Probability.integrable_rpow_logUniformMeasure`, for all
  `a, b, q`), with `E[X^q] = (b^q − a^q)/(q log(b/a))` for `q ≠ 0` and `E[X^0] = 1`
  (`TauCeti.Probability.integral_rpow_logUniformMeasure`,
  `TauCeti.Probability.integral_rpow_logUniformMeasure_zero`); the mean is `(b − a)/log(b/a)` and
  the variance `(b² − a²)/(2 log(b/a)) − ((b − a)/log(b/a))²`
  (`TauCeti.Probability.integral_id_logUniformMeasure`,
  `TauCeti.Probability.variance_id_logUniformMeasure`), and `D = ℝ`
  (`TauCeti.Probability.integrableExpSet_id_logUniformMeasure`);
- the family is jointly measurable (`TauCeti.Probability.measurable_logUniformMeasure`), and for
  `c > 0` the law of `cX` is log-uniform on `(ca, cb)`
  (`TauCeti.Probability.map_mul_logUniformMeasure`).

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal`,
`Real.sigmoid`, `MeasureTheory.Measure.dirac`; Tau Ceti `TauCeti.Probability.uniformMeasure`,
`Real.erfInv`, `TauCeti.Probability.quantile_gaussianReal_zero_one`; §0.3, §1.10, §2.3, §7.2.

**Checks.**

- For `m = 0` the reflection gives mean exactly `1/2` for every `v`. For `m = 1, v = 1` the median
  is `σ(1) ≈ 0.731` while the mean is `∫ σ dN(1, 1) ≈ 0.697`: the value `σ(m)` is the median, not
  the mean, whenever `m ≠ 0` and `v > 0`.
- For `v = 0` the law is the Dirac mass at `σ(m)`, a probability measure with no density; defining
  the family as Lebesgue measure with the density `f` would give the zero measure there.
- On `(a, b) = (1, e)` the median is `√e ≈ 1.649`, the mean `e − 1 ≈ 1.718` and
  `E[1/X] = 1 − e^(−1) ≈ 0.632`; the uniform law on `[1, e]`, which a density `1/(b − a)` in place of
  `1/(x log(b/a))` would give, has mean `(1 + e)/2 ≈ 1.859`. For `a = b` the law is the zero
  measure, not the Dirac mass at `a`.

### 10.16 Half-Student t and half-Cauchy

For `ν, s > 0` the half-Student t law is `TauCeti.Probability.halfStudentTMeasure ν s`, the law of
`s|T|` for `T` Student t with `ν` degrees of freedom, `TauCeti.Probability.studentTMeasure ν` of
§3.7 (`TauCeti.Probability.halfStudentTMeasure_of_pos`,
`TauCeti.Probability.hasLaw_halfStudentTMeasure`); it is the zero measure unless `ν, s > 0`
(`TauCeti.Probability.halfStudentTMeasure_of_not_pos`) and a probability measure for `ν, s > 0`
(`TauCeti.Probability.isProbabilityMeasure_halfStudentTMeasure`). The half-Cauchy law of scale `s`
is the case `ν = 1`, `TauCeti.Probability.halfCauchyMeasure s` (Johnson, Kotz and Balakrishnan,
vol. 2). For `ν, s > 0`, folding (§7.7) gives:

- the density `2 f_T(x/s)/s` for `x > 0` and `0` for `x ≤ 0`, where `f_T` is the Student density
  `TauCeti.Probability.studentTPDFReal ν` (`TauCeti.Probability.halfStudentTPDFReal_of_pos`,
  `TauCeti.Probability.halfStudentTPDFReal_of_not_pos`), with
  `TauCeti.Probability.halfStudentTMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_halfStudentTMeasure` and
  `TauCeti.Probability.rnDeriv_halfStudentTMeasure`; the law is almost surely positive, atomless,
  with topological support `[0, ∞)` (`TauCeti.Probability.ae_pos_halfStudentTMeasure`,
  `TauCeti.Probability.nullSingletonClass_halfStudentTMeasure`,
  `TauCeti.Probability.support_halfStudentTMeasure`);
- the cdf `2 F_T(x/s) − 1` for `x ≥ 0` and `0` for `x < 0`
  (`TauCeti.Probability.cdf_halfStudentTMeasure_eq`), continuous and strictly increasing on
  `[0, ∞)` (`TauCeti.Probability.continuous_cdf_halfStudentTMeasure`,
  `TauCeti.Probability.strictMonoOn_cdf_halfStudentTMeasure`), and the quantile
  `Q(u) = s Q_T((1 + u)/2)` (`TauCeti.Probability.quantile_halfStudentTMeasure`), positive,
  continuous and strictly increasing on `(0, 1)` with limits `0` and `∞`
  (`TauCeti.Probability.quantile_halfStudentTMeasure_pos`,
  `TauCeti.Probability.continuousOn_quantile_halfStudentTMeasure`,
  `TauCeti.Probability.strictMonoOn_quantile_halfStudentTMeasure`,
  `TauCeti.Probability.tendsto_quantile_halfStudentTMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_halfStudentTMeasure_nhdsLT_one`).

The power `x^q` is integrable exactly when `−1 < q < ν`, and then

    E[X^q] = s^q ν^(q/2) Γ((q + 1)/2) Γ((ν − q)/2) / (√π Γ(ν/2))

(`TauCeti.Probability.integrable_rpow_halfStudentTMeasure_iff`,
`TauCeti.Probability.integral_rpow_halfStudentTMeasure`, and for natural powers
`TauCeti.Probability.integrable_pow_halfStudentTMeasure_iff`,
`TauCeti.Probability.integral_pow_halfStudentTMeasure`). The mean
`s √ν Γ((ν − 1)/2)/(√π Γ(ν/2))` exists exactly when `ν > 1`; for `ν > 2`, `E[X²] = s² ν/(ν − 2)`
and the variance is `s²(ν/(ν − 2) − (ν/π)(Γ((ν − 1)/2)/Γ(ν/2))²)`
(`TauCeti.Probability.integrable_id_halfStudentTMeasure_iff`,
`TauCeti.Probability.integral_id_halfStudentTMeasure`,
`TauCeti.Probability.integral_sq_halfStudentTMeasure`,
`TauCeti.Probability.variance_id_halfStudentTMeasure`); in particular the half-Cauchy law has no
mean (`TauCeti.Probability.not_integrable_id_halfCauchyMeasure`). `D = (−∞, 0]`
(`TauCeti.Probability.integrable_exp_mul_id_halfStudentTMeasure_iff`,
`TauCeti.Probability.integrableExpSet_id_halfStudentTMeasure`). The random-variable forms are
`ProbabilityTheory.HasLaw.integral_rpow_halfStudentTMeasure`,
`ProbabilityTheory.HasLaw.integral_halfStudentTMeasure` and
`ProbabilityTheory.HasLaw.variance_halfStudentTMeasure`.

Further:

- the half-Cauchy law of scale `s > 0` is the folded centred Cauchy law: the image of the Cauchy law
  `ProbabilityTheory.cauchyMeasure 0 s` under `|·|` (`TauCeti.Probability.cauchyMeasure_map_abs`,
  `TauCeti.Probability.halfCauchyMeasure_eq_map_cauchyMeasure`,
  `TauCeti.Probability.hasLaw_halfCauchyMeasure`);
- `X = s √(ν Y)` for `Y` beta prime `(1/2, ν/2)` of §10.7
  (`TauCeti.Probability.halfStudentTMeasure_eq_map_betaPrimeMeasure`);
- the family is jointly measurable (`TauCeti.Probability.measurable_halfStudentTMeasure`), and for
  `c > 0` the law of `cX` has scale `cs` (`TauCeti.Probability.halfStudentTMeasure_map_const_mul`).

*Needs:* Mathlib `ProbabilityTheory.cauchyMeasure`, `Real.Gamma`; Tau Ceti
`TauCeti.Probability.studentTMeasure`, `TauCeti.Probability.studentTPDFReal`,
`TauCeti.Probability.betaPrimeMeasure`; §1.8 (Cauchy law), §3.7, §7.2, §7.7 (folding), §10.7.

**Checks.**

- The half-Cauchy median is `s Q_T(3/4) = s tan(π/4) = s`, and its mean is infinite.
- For `ν = 3, s = 1` the mean is `√3 Γ(1) Γ(1)/(√π Γ(3/2)) = 2√3/π ≈ 1.103`, which is `E|T|` for
  `T` Student with three degrees of freedom, and the variance is `3 − 12/π² ≈ 1.784`.
- The lower threshold `q > −1` does not depend on `ν`: the density at `0` is `2 f_T(0)/s > 0`, so
  `E[X^(−1)] = ∞` for every `ν`. A symmetric range `|q| < ν`, as for the log-logistic law, would
  wrongly admit `q = −1` when `ν > 1`.

### 10.17 Noncentral Beta

For shapes `a ≥ 0`, `b > 0` and noncentrality `λ ∈ ℝ≥0` the noncentral Beta law is
`TauCeti.Probability.noncentralBetaMeasure a b λ`, the law of `U/(U + V)` for independent `U`
noncentral chi-squared with degree `2a` and noncentrality `λ`
(`TauCeti.Probability.noncentralChiSquaredMeasure (2 * a) λ`, §10.5) and `V` central chi-squared
with degree `2b` (`TauCeti.Probability.chiSquaredMeasure (2 * b)`, §3.5)
(`TauCeti.Probability.noncentralBetaMeasure_eq_map`,
`TauCeti.Probability.hasLaw_noncentralBeta_of_noncentralChiSquared`); every other shape gives the
zero measure (`TauCeti.Probability.noncentralBetaMeasure_of_not`), and the law is a probability
measure exactly when `a ≥ 0` and `b > 0`
(`TauCeti.Probability.isProbabilityMeasure_noncentralBetaMeasure_iff`) (R noncentral Beta
documentation, Details, ratio and Poisson-mixture conventions; Johnson, Kotz and Balakrishnan,
vol. 2, pp. 502–503, where the R documentation locates both definitions). The
numerator shape `a = 0` is allowed and is specified explicitly below.

Prove that the denominator is almost surely positive: for `a ≥ 0`, `b > 0` and `λ ≥ 0`, under the
product of the noncentral chi-squared law `(2a, λ)` and the chi-squared law `2b` the set where
`U + V > 0` has full measure (`V > 0` almost surely since `2b > 0`, and `U ≥ 0` almost surely), so
the law does not depend on the value given to `x/0`.

**The Poisson mixture.** For fixed `b > 0`, the component law is
`TauCeti.Probability.noncentralBetaComponent c b`: the Dirac mass at `0` for `c = 0`, the Beta law
`ProbabilityTheory.betaMeasure c b` for `c > 0`, and the zero measure for `c < 0`
(`TauCeti.Probability.noncentralBetaComponent_zero`,
`TauCeti.Probability.noncentralBetaComponent_of_pos`,
`TauCeti.Probability.noncentralBetaComponent_of_neg`); `ProbabilityTheory.betaMeasure` itself is
not changed. It is measurable in `(c, b)` (`TauCeti.Probability.measurable_noncentralBetaComponent`),
it is the law of `U/(U + V)` for independent central chi-squared variables of degrees `2c` and `2b`
(`TauCeti.Probability.map_div_add_chiSquaredMeasure`), and for `c ≥ 0` its cdf is `I_x(c, b)`
(`TauCeti.Probability.cdf_noncentralBetaComponent`). With `p_j = e^(−λ/2)(λ/2)^j/j!`, the masses
`ProbabilityTheory.poissonMeasure (λ/2) {j}`, the noncentral Beta law is the measure mixture
`∑_j p_j B*(a + j)` with `ℝ≥0∞` coefficients, `B*(c)` the component above
(`TauCeti.Probability.noncentralBetaMeasure_eq_sum`, `TauCeti.Probability.noncentralBetaMeasure_eq_bind`,
`TauCeti.Probability.noncentralBetaMeasure_apply`,
`TauCeti.Probability.lintegral_noncentralBetaMeasure`).

**Positive numerator shape.** For `a > 0` and `b > 0` the law is absolutely continuous
(`TauCeti.Probability.absolutelyContinuous_noncentralBetaMeasure`,
`TauCeti.Probability.nullSingletonClass_noncentralBetaMeasure`), carried by `(0, 1)`
(`TauCeti.Probability.ae_mem_Ioo_noncentralBetaMeasure`), and:

- its density is the convergent Poisson sum `f(x) = ∑_j p_j f_(a+j,b)(x)` of Beta densities
  `ProbabilityTheory.betaPDFReal (a + j) b`, zero off `(0, 1)`
  (`TauCeti.Probability.noncentralBetaPDFReal_eq_tsum`,
  `TauCeti.Probability.summable_poisson_mul_betaPDFReal`,
  `TauCeti.Probability.noncentralBetaPDFReal_of_nonpos`,
  `TauCeti.Probability.noncentralBetaPDFReal_of_one_le`), with
  `TauCeti.Probability.noncentralBetaMeasure_eq_withDensity`,
  `TauCeti.Probability.hasPDF_of_hasLaw_noncentralBetaMeasure` and
  `TauCeti.Probability.rnDeriv_noncentralBetaMeasure`;
- its cdf is the convergent Poisson sum `F(x) = ∑_j p_j I_x(a + j, b)`, zero for `x ≤ 0` and one for
  `x ≥ 1`, and continuous (`TauCeti.Probability.cdf_noncentralBetaMeasure_eq`,
  `TauCeti.Probability.hasSum_cdf_noncentralBetaMeasure`,
  `TauCeti.Probability.cdf_noncentralBetaMeasure_of_neg`,
  `TauCeti.Probability.cdf_noncentralBetaMeasure_zero`,
  `TauCeti.Probability.cdf_noncentralBetaMeasure_of_one_le`,
  `TauCeti.Probability.continuous_cdf_noncentralBetaMeasure`).

**Zero numerator shape.** For `a = 0` and `b > 0` put `w = e^(−λ/2)`. The law has the atom `w` at
`0` and is the sum of `w δ₀` and the continuous component `∑_(j ≥ 1) p_j Beta(j, b)` of total mass
`1 − w` (`TauCeti.Probability.noncentralBetaMeasure_zero_shape_singleton`,
`TauCeti.Probability.noncentralBetaMeasure_zero_shape`,
`TauCeti.Probability.noncentralBetaMeasure_zero_shape_eq_atom_add_withDensity`,
`TauCeti.Probability.lintegral_noncentralBetaPDF_zero_shape`); the density
`TauCeti.Probability.noncentralBetaPDF 0 b λ` describes only that component, and the law, which has
an atom, has no `MeasureTheory.HasPDF` statement. Every point other than `0` is null
(`TauCeti.Probability.noncentralBetaMeasure_singleton_of_ne_zero`). The mixed cdf is `0` for
`x < 0`, `w` at `0`, `w + ∑_(j ≥ 0) p_(j+1) I_x(j + 1, b)` on `[0, 1)`, and `1` for `x ≥ 1`
(`TauCeti.Probability.cdf_noncentralBetaMeasure_zero`,
`TauCeti.Probability.cdf_noncentralBetaMeasure_zero_shape`,
`TauCeti.Probability.cdf_noncentralBetaMeasure_of_one_le`), continuous away from `0`
(`TauCeti.Probability.continuousOn_cdf_noncentralBetaMeasure`).

**Boundary cases and support.** At `λ = 0` the law is the component `B*(a)`
(`TauCeti.Probability.noncentralBetaMeasure_zero_noncentrality`): the Beta law `(a, b)` for
`a > 0` and the Dirac mass at `0` for `a = λ = 0`. Outside that Dirac case (`a ≠ 0` or `λ ≠ 0`) the
topological support is `[0, 1]`, the continuous component has positive density on `(0, 1)`, and the
cdf is strictly increasing on `[0, 1]` and below one before `1`
(`TauCeti.Probability.support_noncentralBetaMeasure`,
`TauCeti.Probability.noncentralBetaPDFReal_pos`,
`TauCeti.Probability.strictMonoOn_cdf_noncentralBetaMeasure`,
`TauCeti.Probability.cdf_noncentralBetaMeasure_lt_one`).

**Moments.** For `a ≥ 0` and `b > 0` every natural moment is finite
(`TauCeti.Probability.integrable_pow_noncentralBetaMeasure`), the moment of order zero is one, and

    E[Xⁿ] = ∑_(j ≥ 0) p_j ∏_(l = 0)^(n − 1) (a + j + l)/(a + b + j + l),

the empty product giving order zero and the term `a = j = 0` vanishing for `n > 0`
(`TauCeti.Probability.integral_pow_noncentralBetaMeasure`,
`TauCeti.Probability.hasSum_integral_pow_noncentralBetaMeasure`, componentwise
`TauCeti.Probability.integral_pow_noncentralBetaComponent`). The mean and the variance are the
cases `n = 1, 2` (`TauCeti.Probability.integral_id_noncentralBetaMeasure`,
`TauCeti.Probability.integral_sq_noncentralBetaMeasure`,
`TauCeti.Probability.variance_id_noncentralBetaMeasure`, and the random-variable forms
`ProbabilityTheory.HasLaw.integral_pow_noncentralBetaMeasure`,
`ProbabilityTheory.HasLaw.variance_noncentralBetaMeasure`), and `D = ℝ`
(`TauCeti.Probability.integrableExpSet_id_noncentralBetaMeasure`); no special-function transform
is part of the roadmap.

**Quantile.** For `a ≥ 0`, `b > 0` and `0 < u < 1`, let the cutoff be `w = e^(−λ/2)` when `a = 0`
and `0` when `a > 0`. Then `Q(u) = 0` exactly when `u` is at most the cutoff, and above the cutoff
`Q(u)` is the unique `x ∈ (0, 1)` with `F(x) = u`
(`TauCeti.Probability.quantile_noncentralBetaMeasure_eq_zero_iff`,
`TauCeti.Probability.quantile_noncentralBetaMeasure_eq_iff`,
`TauCeti.Probability.cdf_quantile_noncentralBetaMeasure`). On the nonconstant range `Q` is
strictly increasing (`TauCeti.Probability.strictMonoOn_quantile_noncentralBetaMeasure`), it is
continuous on `(0, 1)` (`TauCeti.Probability.continuousOn_quantile_noncentralBetaMeasure`), and it
tends to `0` at `0` and to `1` at `1`, except in the Dirac case `a = λ = 0`, where it is constantly
`0` (`TauCeti.Probability.tendsto_quantile_noncentralBetaMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_noncentralBetaMeasure_nhdsLT_one`).

**Noncentral F.** For `a > 0` only, `(b/a) X/(1 − X)` has the noncentral F law of §10.6 with
degrees `2a, 2b` and noncentrality `λ`, `TauCeti.Probability.noncentralFMeasure (2 * a) (2 * b) λ`
(`TauCeti.Probability.noncentralFMeasure_eq_map_noncentralBetaMeasure`). The family is jointly
measurable in `(a, b, λ)` (`TauCeti.Probability.measurable_noncentralBetaMeasure`).

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.betaPDFReal`,
`ProbabilityTheory.poissonMeasure`, `MeasureTheory.Measure.sum`, `MeasureTheory.Measure.bind`,
`MeasureTheory.Measure.prod`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure`,
`TauCeti.Probability.noncentralChiSquaredMeasure`, `TauCeti.Probability.noncentralFMeasure`,
`TauCeti.regularizedIncompleteBeta`; §1.4 (Poisson law), §1.7, §2.2, §3.5, §4.3 (Gamma–Beta
factorization), §7.2, §7.4 (atoms and mixtures), §10.5, §10.6.

**Checks.**

- Zero noncentrality recovers the central law: for `a > 0`, `λ = 0` gives Beta `(a, b)`, and for
  `a = 0`, `λ = 0` gives the Dirac mass at `0`; the zero-shape atom is kept, and a definition that
  dropped the zero-shape component would lose the mass `e^(−λ/2)`.
- For `a = 0, λ = 2` the atom at `0` has mass `e^(−1) ≈ 0.368`, so `Q(u) = 0` for `u ≤ e^(−1)`, and
  the continuous component has mass `1 − e^(−1)`.
- For `a = b = 1, λ = 2` the mean is `∑_j p_j (1 + j)/(2 + j) = 1 − E[1/(J + 2)]` with `J` Poisson of
  mean `1`, which is `1 − e^(−1) ≈ 0.632` (central Beta `(1, 1)`: `1/2`). Poisson weights of mean
  `λ` instead of `λ/2` would give `1 − (1 + e^(−2))/4 ≈ 0.716`.

### 10.18 Hypoexponential

For a finite, possibly empty type `ι` and real rates `λ : ι → ℝ`, the hypoexponential law is
`TauCeti.Probability.hypoexponentialMeasure λ`: when every rate is positive, the law of `∑_i E_i`
for independent exponential variables `E_i` of rates `λ_i`, the image under summation of the
product `MeasureTheory.Measure.pi` of the laws `ProbabilityTheory.expMeasure λ_i`
(`TauCeti.Probability.hypoexponentialMeasure_eq_map`,
`ProbabilityTheory.iIndepFun.hasLaw_sum_hypoexponentialMeasure`), and the zero measure otherwise
(`TauCeti.Probability.hypoexponentialMeasure_eq_zero_of_invalid`) (Johnson, Kotz and
Balakrishnan). Repeated rates are allowed. With positive rates:

- the law is a probability measure (`TauCeti.Probability.isProbabilityMeasure_hypoexponentialMeasure`);
  the empty family gives the Dirac mass at `0` (`TauCeti.Probability.hypoexponentialMeasure_of_isEmpty`),
  and a single rate the exponential law (`TauCeti.Probability.hypoexponentialMeasure_of_unique`);
- for `ι` nonempty the law is almost surely positive, absolutely continuous and hence atomless, and
  its topological support is `[0, ∞)` (`TauCeti.Probability.ae_pos_hypoexponentialMeasure`,
  `TauCeti.Probability.hypoexponentialMeasure_absolutelyContinuous`,
  `TauCeti.Probability.nullSingletonClass_hypoexponentialMeasure`,
  `TauCeti.Probability.support_hypoexponentialMeasure`).

The chosen density `TauCeti.Probability.hypoexponentialPDFReal λ` is zero for invalid or empty
families (`TauCeti.Probability.hypoexponentialPDFReal_of_not_pos`,
`TauCeti.Probability.hypoexponentialPDFReal_of_isEmpty`), and the empty Dirac law has no density
identity.

**Partial fractions, density and cdf** (for `ι` nonempty and every `λ_i > 0`). Let `R` be the set
of distinct rates, `m_ρ` the multiplicity of `ρ ∈ R`, and `C = ∏_i λ_i`. For `ρ ∈ R` and
`1 ≤ k ≤ m_ρ` the coefficient is

    A(ρ, k) = (1/(m_ρ − k)!) · d^(m_ρ − k)/dz^(m_ρ − k) [ C ∏_(q ∈ R, q ≠ ρ) (z + q)^(−m_q) ] at z = −ρ,

`TauCeti.Probability.hypoexponentialCoeff λ ρ k` (`TauCeti.Probability.hypoexponentialCoeff_def`,
the product being over the indices `i` with `λ_i ≠ ρ`); no factor `z + q` with `q ≠ ρ` vanishes
near `−ρ`, so the function differentiated is smooth there. The top coefficient is
`A(ρ, m_ρ) = C/∏_(λ_i ≠ ρ) (λ_i − ρ)` (`TauCeti.Probability.hypoexponentialCoeff_card`). Away from
the poles, over any field containing `ℝ`,

    ∏_i λ_i/(z + λ_i) = ∑_(ρ ∈ R) ∑_(k = 1)^(m_ρ) A(ρ, k)/(z + ρ)^k

(`TauCeti.Probability.prod_div_add_eq_sum_hypoexponentialCoeff`, which holds for any real rates),
and `∑_ρ ∑_k A(ρ, k)/ρ^k = 1` (`TauCeti.Probability.sum_hypoexponentialCoeff_div_pow`). For `x > 0`

    f(x) = ∑_(ρ, k) A(ρ, k) x^(k − 1) e^(−ρx)/(k − 1)!,
    F(x) = 1 − ∑_(ρ, k) (A(ρ, k)/ρ^k) e^(−ρx) ∑_(j = 0)^(k − 1) (ρx)^j/j!,

and both vanish for `x ≤ 0` (`TauCeti.Probability.hypoexponentialPDFReal_of_pos`,
`TauCeti.Probability.hypoexponentialPDFReal_of_nonpos`,
`TauCeti.Probability.cdf_hypoexponentialMeasure_eq`, for `x ≥ 0`,
`TauCeti.Probability.cdf_hypoexponentialMeasure_of_nonpos`). The density is that of the
convolution law, it has total mass one, and it is strictly positive on `(0, ∞)`
(`TauCeti.Probability.hypoexponentialMeasure_eq_withDensity`,
`TauCeti.Probability.lintegral_hypoexponentialPDF_eq_one`,
`TauCeti.Probability.hypoexponentialPDFReal_pos`,
`TauCeti.Probability.hypoexponentialPDFReal_pos_iff`), with
`TauCeti.Probability.hasPDF_of_hasLaw_hypoexponentialMeasure` and
`TauCeti.Probability.rnDeriv_hypoexponentialMeasure`; for every `R ≥ max_i λ_i` the law dominates
`∏_i (λ_i/R)` times the Gamma law of shape `n = |ι|` and rate `R`
(`TauCeti.Probability.smul_gammaMeasure_le_hypoexponentialMeasure`). The coefficients `A(ρ, k)` may
be negative. Equivalently, `f` is the signed combination, with coefficients `A(ρ, k)/ρ^k`, of the
Gamma densities of shape `k` and rate `ρ`, and `F` the same combination of the `G_k(ρx)`
(`TauCeti.Probability.hypoexponentialPDFReal_eq_sum_gammaPDFReal`,
`TauCeti.Probability.cdf_hypoexponentialMeasure_eq_sum_regularizedGamma`). Two specializations:

- distinct rates: `f(x) = ∑_i λ_i e^(−λ_i x) ∏_(j ≠ i) λ_j/(λ_j − λ_i)` and
  `F(x) = 1 − ∑_i e^(−λ_i x) ∏_(j ≠ i) λ_j/(λ_j − λ_i)`
  (`TauCeti.Probability.hypoexponentialPDFReal_of_injective`,
  `TauCeti.Probability.cdf_hypoexponentialMeasure_of_injective`);
- `n ≥ 1` equal rates `r > 0`: the law is `ProbabilityTheory.gammaMeasure n r`, with the Erlang
  density `rⁿ x^(n − 1) e^(−rx)/(n − 1)!` (`TauCeti.Probability.hypoexponentialMeasure_const`,
  `TauCeti.Probability.hypoexponentialPDFReal_const`, for `x ≠ 0`).

**Moments and transforms** (every `λ_i > 0`, the empty family included). Every natural moment is
finite (`TauCeti.Probability.integrable_pow_hypoexponentialMeasure`, for all rates) and

    E[Xⁿ] = n! ∑_(k : ι → ℕ, ∑_i k_i = n) ∏_i λ_i^(−k_i),      E[X] = ∑_i 1/λ_i,      Var X = ∑_i 1/λ_i²,

the index set being the finite set `Finset.piAntidiag Finset.univ n`
(`TauCeti.Probability.integral_pow_hypoexponentialMeasure`,
`TauCeti.Probability.integral_id_hypoexponentialMeasure`,
`TauCeti.Probability.variance_id_hypoexponentialMeasure`); for the empty family the moments are one
at order zero and zero at positive orders. The exact domain and the transforms are

    D = {t : t < λ_i for all i},   M(t) = ∏_i λ_i/(λ_i − t),   K(t) = −∑_i log(1 − t/λ_i),   φ(t) = ∏_i λ_i/(λ_i − it)

(`TauCeti.Probability.integrableExpSet_id_hypoexponentialMeasure`,
`TauCeti.Probability.mgf_id_hypoexponentialMeasure`,
`TauCeti.Probability.cgf_id_hypoexponentialMeasure`,
`TauCeti.Probability.charFun_hypoexponentialMeasure`), the empty products giving `D = ℝ`,
`M = φ = 1` and `K = 0`.

**Quantiles.** For `ι` nonempty and positive rates, `Q(u)` is the unique positive root of
`F(x) = u`, continuous and strictly increasing on `(0, 1)` with limits `0` and `∞`
(`TauCeti.Probability.quantile_hypoexponentialMeasure_pos`,
`TauCeti.Probability.quantile_hypoexponentialMeasure_eq_iff`,
`TauCeti.Probability.cdf_quantile_hypoexponentialMeasure`,
`TauCeti.Probability.continuousOn_quantile_hypoexponentialMeasure`,
`TauCeti.Probability.strictMonoOn_quantile_hypoexponentialMeasure`,
`TauCeti.Probability.tendsto_quantile_hypoexponentialMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_hypoexponentialMeasure_nhdsLT_one`); for `n` equal rates `r`
it is `G_n⁻¹(u)/r` (`TauCeti.Probability.quantile_hypoexponentialMeasure_const`). The quantile of
the empty family is `0` (`TauCeti.Probability.quantile_hypoexponentialMeasure_of_isEmpty`).

**Operations.** Reindexing along an equivalence does not change the law
(`TauCeti.Probability.hypoexponentialMeasure_reindex`); the convolution of two hypoexponential laws
is the hypoexponential law of the concatenated rates, `Sum.elim λ μ`
(`TauCeti.Probability.hypoexponentialMeasure_conv_hypoexponentialMeasure`, for all rates); and for
`c > 0` the law of `cX` has rates `λ_i/c`
(`TauCeti.Probability.map_mul_hypoexponentialMeasure`). The family is measurable in the rate
vector (`TauCeti.Probability.measurable_hypoexponentialMeasure`). No matrix-exponential
(phase-type) representation is part of the roadmap.

*Needs:* Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.gammaMeasure`,
`ProbabilityTheory.gammaPDFReal`, `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.conv`,
`ProbabilityTheory.iIndepFun`, `iteratedDeriv`, `Finset.piAntidiag`; Tau Ceti
`TauCeti.regularizedGamma`, `TauCeti.inverseRegularizedGamma`; §1.5, §1.6, §2.1, §4.4, §7.2, §8.4.

**Checks.**

- Rates `(1, 2)`: `A(1, 1) = 2` and `A(2, 1) = −2`, so `f(x) = 2(e^(−x) − e^(−2x))` and
  `F(x) = (1 − e^(−x))²`, the law of the maximum of two independent standard exponentials;
  `Q(1/4) = log 2`, the mean is `3/2` and the variance `5/4`. A sign slip in the partial fractions
  gives a function that is not zero at `0` and does not integrate to one.
- Rates `(1, 1, 2)`: `2/((z + 1)²(z + 2)) = −2/(z + 1) + 2/(z + 1)² + 2/(z + 2)`, so
  `f(x) = (2x − 2) e^(−x) + 2 e^(−2x)`, with `f(0) = 0`, total mass one and mean `5/2`, and
  `F(1.3) ≈ 0.2171`. Keeping only the top coefficients `A(ρ, m_ρ)` gives `2x e^(−x) + 2 e^(−2x)`, of
  total mass `3`.
- The empty family is the Dirac mass at `0`: moments `1, 0, 0, …`, `M = 1`, `D = ℝ` and quantile
  `0`.

### 10.19 Hyperexponential

For a finite type `ι`, weights `p : Convexity.StdSimplex ℝ≥0 ι` with `w_i = p_i` and real rates
`λ : ι → ℝ`, let `A = {i : w_i > 0}` be the active indices. `A` is nonempty: the simplex over an
empty type has no point (`Convexity.StdSimplex.nonempty`,
`Convexity.StdSimplex.support_weights_nonempty`), so there is no weight parameter on an empty
type. The hyperexponential law is
`TauCeti.Probability.hyperexponentialMeasure p λ`, the mixture `∑_i w_i Exp(λ_i)` when every active
rate is positive, and the zero measure otherwise
(`TauCeti.Probability.hyperexponentialMeasure_of_pos`,
`TauCeti.Probability.hyperexponentialMeasure_of_not_pos`); inactive rates are arbitrary, and the
law is a probability measure exactly when every active rate is positive
(`TauCeti.Probability.isProbabilityMeasure_hyperexponentialMeasure_iff`) (Johnson, Kotz and
Balakrishnan). The chosen density is zero on the invalid branch
(`TauCeti.Probability.hyperexponentialPDFReal_of_not_pos`). On the valid domain, with the sums
effectively over `A`:

- for `x > 0`, `f(x) = ∑_i w_i λ_i e^(−λ_i x)` and `F(x) = 1 − ∑_i w_i e^(−λ_i x)`, both zero for
  `x ≤ 0` (`TauCeti.Probability.hyperexponentialPDFReal_of_pos`,
  `TauCeti.Probability.cdf_hyperexponentialMeasure_eq`), with
  `TauCeti.Probability.hyperexponentialMeasure_eq_withDensity` (which holds at every parameter),
  `TauCeti.Probability.hasPDF_of_hasLaw_hyperexponentialMeasure` and
  `TauCeti.Probability.rnDeriv_hyperexponentialMeasure`; the law is normalized, atomless and almost
  surely positive, its density is positive exactly on `(0, ∞)`, and its topological support is
  `[0, ∞)` (`TauCeti.Probability.isProbabilityMeasure_hyperexponentialMeasure`,
  `TauCeti.Probability.ae_pos_hyperexponentialMeasure`,
  `TauCeti.Probability.hyperexponentialPDFReal_pos_iff`,
  `TauCeti.Probability.support_hyperexponentialMeasure`); `F` is strictly increasing on `[0, ∞)`
  and below one (`TauCeti.Probability.strictMonoOn_cdf_hyperexponentialMeasure`,
  `TauCeti.Probability.cdf_hyperexponentialMeasure_lt_one`);
- every natural moment is finite (`TauCeti.Probability.integrable_pow_hyperexponentialMeasure`, for
  all parameters) and `E[Xⁿ] = n! ∑_i w_i/λ_iⁿ`; the mean is `∑_i w_i/λ_i` and the variance
  `2 ∑_i w_i/λ_i² − (∑_i w_i/λ_i)²` (`TauCeti.Probability.integral_pow_hyperexponentialMeasure`,
  `TauCeti.Probability.integral_id_hyperexponentialMeasure`,
  `TauCeti.Probability.variance_id_hyperexponentialMeasure`);
- `D = {t : t < λ_i for all i ∈ A}`, `M(t) = ∑_i w_i λ_i/(λ_i − t)` and `K(t) = log M(t)` on `D`,
  and `φ(t) = ∑_i w_i λ_i/(λ_i − it)`
  (`TauCeti.Probability.integrable_exp_mul_hyperexponentialMeasure_iff`,
  `TauCeti.Probability.integrableExpSet_id_hyperexponentialMeasure`,
  `TauCeti.Probability.mgf_id_hyperexponentialMeasure`,
  `TauCeti.Probability.cgf_id_hyperexponentialMeasure`,
  `TauCeti.Probability.charFun_hyperexponentialMeasure`);
- for `0 < u < 1`, `Q(u)` is the unique positive solution `x` of `∑_i w_i e^(−λ_i x) = 1 − u`,
  continuous and strictly increasing with limits `0` and `∞`
  (`TauCeti.Probability.quantile_hyperexponentialMeasure_eq_iff`,
  `TauCeti.Probability.sum_exp_quantile_hyperexponentialMeasure`,
  `TauCeti.Probability.quantile_hyperexponentialMeasure_pos`,
  `TauCeti.Probability.continuousOn_quantile_hyperexponentialMeasure`,
  `TauCeti.Probability.strictMonoOn_quantile_hyperexponentialMeasure`,
  `TauCeti.Probability.tendsto_quantile_hyperexponentialMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_hyperexponentialMeasure_nhdsLT_one`).

Operations:

- the categorical mixture: the law is the mixture, a `MeasureTheory.Measure.bind`, of the
  exponential laws of rates `λ_i` against the categorical law
  `TauCeti.Probability.categoricalMeasure p` of §9.1, and for independent `I` categorical `p` and
  `E` exponential of rate one, `E/λ_I` has the hyperexponential law
  (`TauCeti.Probability.hyperexponentialMeasure_eq_bind`,
  `TauCeti.Probability.map_div_prod_categoricalMeasure_expMeasure`,
  `TauCeti.Probability.hasLaw_hyperexponentialMeasure_of_indepFun`);
- independence from inactive rates (`TauCeti.Probability.hyperexponentialMeasure_congr`), and
  regrouping along any map `g : ι → κ`, which adds weights: the law with weights `p.map g` and
  rates `s` equals the law with weights `p` and rates `λ` whenever `λ_i = s_(g(i))` for every active
  `i` (`TauCeti.Probability.hyperexponentialMeasure_stdSimplexMap`, with
  `Convexity.StdSimplex.map`): this merges components of equal rate by adding their weights,
  gives reindexing along an equivalence (`TauCeti.Probability.hyperexponentialMeasure_reindex`), and,
  applied to the inclusion of the active indices, shows that deleting the components of weight zero
  does not change the law;
- equal active rates `r > 0` give the exponential law of rate `r`, with `Q(u) = −log(1 − u)/r`
  (`TauCeti.Probability.hyperexponentialMeasure_const`,
  `TauCeti.Probability.quantile_hyperexponentialMeasure_of_const`);
- for `c > 0` the law of `cX` has rates `λ_i/c`
  (`TauCeti.Probability.map_mul_hyperexponentialMeasure`,
  `TauCeti.Probability.hasLaw_mul_hyperexponentialMeasure`); the family is jointly measurable in
  `(p, λ)` (`TauCeti.Probability.measurable_hyperexponentialMeasure`).

*Needs:* Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.map`, `ProbabilityTheory.expMeasure`,
`MeasureTheory.Measure.bind`, `ProbabilityTheory.IndepFun`; Tau Ceti
`TauCeti.Probability.categoricalMeasure`; §1.5, §7.2, §7.4, §9.1.

**Checks.**

- `p = (1/2, 1/2)`, rates `(1, 2)`: mean `3/4`, second moment `2(1/2 + 1/8) = 5/4`, variance
  `11/16`, so the squared coefficient of variation is `11/9 > 1`; the hypoexponential law of the same
  rates, a sum rather than a mixture, has mean `3/2`. Here `D = (−∞, 1)`, set by the smallest active
  rate.
- `p = (1, 0)` with rates `(2, −5)`: the inactive negative rate is ignored and the law is the
  exponential law of rate `2`; a validity condition over all indices would make it the zero measure.

### 10.20 Arcsine and semicircle

The arcsine law is `TauCeti.Probability.arcsineMeasure`, defined as
`ProbabilityTheory.betaMeasure (1/2) (1/2)`
(`TauCeti.Probability.arcsineMeasure_eq_betaMeasure`), and the semicircle law of unit radius is
`TauCeti.Probability.semicircleMeasure`, the image of `ProbabilityTheory.betaMeasure (3/2) (3/2)` under
`x ↦ 2x − 1` (`TauCeti.Probability.semicircleMeasure_eq_map_betaMeasure`, written there as
`x ↦ −1 + 2x`); both inherit the theory of the Beta law of §1.7 and §2.2 (Johnson, Kotz and
Balakrishnan, vol. 2).

**Arcsine.** It is a probability measure carried by `(0, 1)` with topological support `[0, 1]`
(`TauCeti.Probability.isProbabilityMeasure_arcsineMeasure`,
`TauCeti.Probability.ae_mem_Ioo_arcsineMeasure`, `TauCeti.Probability.support_arcsineMeasure`), and

    f(x) = 1/(π √(x(1 − x)))  (0 < x < 1),      F(x) = (2/π) arcsin √x  (0 ≤ x ≤ 1),      Q(u) = sin²(πu/2),

with `f = 0` off `(0, 1)`, `F = 0` for `x ≤ 0` and `F = 1` for `x ≥ 1`
(`TauCeti.Probability.arcsinePDFReal_def`, `TauCeti.Probability.arcsinePDFReal_eq_betaPDFReal`,
`TauCeti.Probability.arcsineMeasure_eq_withDensity`,
`TauCeti.Probability.hasPDF_of_hasLaw_arcsineMeasure`, `TauCeti.Probability.rnDeriv_arcsineMeasure`,
`TauCeti.Probability.cdf_arcsineMeasure_eq`, `TauCeti.Probability.cdf_arcsineMeasure_of_nonpos`,
`TauCeti.Probability.cdf_arcsineMeasure_of_one_le`, `TauCeti.Probability.hasDerivAt_cdf_arcsineMeasure`,
`TauCeti.Probability.quantile_arcsineMeasure`); the quantile is continuous on `(0, 1)` with limits
`0` and `1` (`TauCeti.Probability.continuousOn_quantile_arcsineMeasure`,
`TauCeti.Probability.tendsto_quantile_arcsineMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_arcsineMeasure_nhdsLT_one`). Its moments are the Beta
moments `E[Xⁿ] = Γ(1/2 + n) Γ(1)/(Γ(1/2) Γ(1 + n)) = C(2n, n)/4ⁿ`, its mean is `1/2`, its variance
`1/8`, and `D = ℝ` (`TauCeti.Probability.integrable_pow_arcsineMeasure`,
`TauCeti.Probability.integral_pow_arcsineMeasure`, `TauCeti.Probability.integral_id_arcsineMeasure`,
`TauCeti.Probability.variance_id_arcsineMeasure`,
`TauCeti.Probability.integrableExpSet_id_arcsineMeasure`).

**Semicircle.** It is a probability measure carried by `(−1, 1)`, symmetric, atomless, with
topological support `[−1, 1]` (`TauCeti.Probability.isProbabilityMeasure_semicircleMeasure`,
`TauCeti.Probability.ae_mem_Ioo_semicircleMeasure`, `TauCeti.Probability.map_neg_semicircleMeasure`,
`TauCeti.Probability.nullSingletonClass_semicircleMeasure`,
`TauCeti.Probability.support_semicircleMeasure`), and

    f(x) = (2/π) √(1 − x²)  (−1 < x < 1),      F(x) = 1/2 + (x √(1 − x²) + arcsin x)/π  (−1 ≤ x ≤ 1),
    Q(u) = 2 I⁻¹_(3/2, 3/2)(u) − 1,

with `f = 0` off `(−1, 1)`, `F = 0` for `x ≤ −1` and `F = 1` for `x ≥ 1`, where `I⁻¹_(a, b)` is
the inverse `TauCeti.inverseRegularizedIncompleteBeta a b` of §8.4
(`TauCeti.Probability.semicirclePDFReal_apply`, `TauCeti.Probability.semicirclePDFReal_pos_iff`,
`TauCeti.Probability.semicircleMeasure_eq_withDensity`,
`TauCeti.Probability.hasPDF_of_hasLaw_semicircleMeasure`,
`TauCeti.Probability.rnDeriv_semicircleMeasure`, `TauCeti.Probability.cdf_semicircleMeasure_eq`,
`TauCeti.Probability.hasDerivAt_cdf_semicircleMeasure`,
`TauCeti.Probability.quantile_semicircleMeasure`); the quantile lies in `(−1, 1)`, is continuous
and strictly increasing on `(0, 1)`, with limits `−1` and `1`
(`TauCeti.Probability.quantile_semicircleMeasure_mem_Ioo`,
`TauCeti.Probability.continuousOn_quantile_semicircleMeasure`,
`TauCeti.Probability.strictMonoOn_quantile_semicircleMeasure`,
`TauCeti.Probability.tendsto_quantile_semicircleMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_semicircleMeasure_nhdsLT_one`). Every natural moment is
finite, the mean is `0`, the variance `1/4`, the odd moments vanish and the even ones are
`E[X^(2n)] = C_n/4ⁿ` with `C_n` the `n`-th Catalan number, and `D = ℝ`
(`TauCeti.Probability.integrable_pow_semicircleMeasure`,
`TauCeti.Probability.integral_id_semicircleMeasure`,
`TauCeti.Probability.variance_id_semicircleMeasure`,
`TauCeti.Probability.integral_pow_two_mul_add_one_semicircleMeasure`,
`TauCeti.Probability.integral_pow_two_mul_semicircleMeasure`,
`TauCeti.Probability.integrableExpSet_id_semicircleMeasure`).

**Location–scale versions** are the images of these laws under `x ↦ a + cx`, `c ≠ 0`; their
densities, cdfs and quantiles are the affine transports of §7.1 and §7.2 of the formulas above, and
no further family is introduced for them. For the semicircle, the centre–variance law
`TauCeti.Probability.semicircleReal a v`, the image under `x ↦ a + 2√v x`, has mean `a`, variance
`v` and support `[a − 2√v, a + 2√v]`, is closed under affine maps, is the Dirac mass at `a` for
`v = 0`, and is the unit-radius law for `(a, v) = (0, 1/4)`
(`TauCeti.Probability.integral_id_semicircleReal`, `TauCeti.Probability.variance_id_semicircleReal`,
`TauCeti.Probability.support_semicircleReal`, `TauCeti.Probability.map_affine_semicircleReal`,
`TauCeti.Probability.semicircleReal_zero_var`, `TauCeti.Probability.semicircleReal_zero_inv_four`).

*Needs:* Mathlib `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.betaPDFReal`, `Real.arcsin`;
Tau Ceti `TauCeti.inverseRegularizedIncompleteBeta`; §1.7, §2.2, §7.1, §7.2, §8.4.

**Checks.**

- Arcsine: `F(1/2) = (2/π) arcsin(1/√2) = 1/2`, and `Q(1/4) = sin²(π/8) = (2 − √2)/4 ≈ 0.146` with
  `F(Q(1/4)) = (2/π)(π/8) = 1/4`; mean `1/2` and variance `1/8`, the Beta `(1/2, 1/2)` values. The
  other common normalization, the arcsine law on `(−1, 1)`, has variance `1/2`.
- Semicircle: `f(0) = 2/π`; with the constant `1/π` the total mass would be `1/2`. The variance is
  `1/4` and the fourth moment `C_2/16 = 1/8`; the radius-two (Wigner) normalization has variance `1`
  and fourth moment `2`. At `x = 1/2`, `F(1/2) = 2/3 + √3/(4π) ≈ 0.8045`.

### Examples

- `NCχ²(3, 2)`, the law of `‖X‖²` for `X ∼ N(m, I₃)` with `‖m‖² = 2`, has mean `5`, variance `14`
  and mgf `(1 − 2t)^(−3/2) exp(2t/(1 − 2t))` for `t < 1/2`; the standard Gaussian truncated to
  `[0, ∞)` is the half-normal law, the chi law of degree `1` and scale `1`, with mean `√(2/π)`.
- If `Y` is standard logistic, `e^Y` is log-logistic with `a = b = 1`: `F(x) = x/(1 + x)` for
  `x > 0`, the median is `1`, `Q(3/4) = 3`, and the mean is infinite because `b = 1`. The same law
  is Fisher's F with degrees `(2, 2)`: with `a = b = 1` and `λ = 0` the noncentral Beta law is the
  uniform law on `(0, 1)`, and `X/(1 − X)`, the ratio of two independent exponential variables of
  the same rate, has cdf `x/(1 + x)`.
- The chi law of degree `2` and scale `s` is the generalized gamma law `(1, 2, √2 s)`, that is the
  Weibull law of shape `2` and scale `√2 s`, the Rayleigh law: `F(x) = 1 − e^(−x²/(2s²))` and the
  mean is `√2 s Γ(3/2) = s √(π/2) ≈ 1.2533 s`.
- For rates `(1, 2)` the hypoexponential law (the sum) and the hyperexponential law with weights
  `(1/2, 1/2)` (the mixture) have means `3/2` and `3/4`; at `x = log 2` their cdfs are
  `(1 − 1/2)² = 1/4` and `1 − (1/2 + 1/4)/2 = 5/8`.
- The arcsine law gives `F(1/4) = (2/π) arcsin(1/2) = 1/3`, and the generalized normal law with
  `p = 1` gives back the Laplace law, whose quantile at `3/4` is `m + s log 2`.
- Several families of the layer reach a Dirac mass at a boundary of their parameters: the
  logit-normal law with `v = 0` is the Dirac mass at `σ(m)`, the noncentral Beta law with
  `a = λ = 0` and the hypoexponential law of the empty family are the Dirac mass at `0`, and the
  chi law of degree `0` is the Dirac mass at `0` as well; none of them has a density.

### Dependencies

Layer 10 uses Layers 0–4, 7 and 8, and §9.1. From Layers 0–4 it takes the
interval uniform law (§0.3), the Poisson, exponential, Gamma, Beta, Cauchy and Gaussian laws and
the real-power moments of Layer 1, the incomplete Gamma and Beta functions and the error function
of Layer 2, the Laplace, Weibull, chi-squared, inverse-gamma and Student t laws of Layer 3, and the
ratios, the Gamma–Beta factorization, the sums and differences and the extrema of Layer 4 (§4.2,
§4.3, §4.4, §4.6). From Layer 7 it takes affine transport (§7.1), the lower quantile and its
transport (§7.2), conditioning (§7.3), atoms and mixtures (§7.4), convolution powers (§7.5),
folding (§7.7), survival and hazard (§7.9), weak continuity (§7.11) and stochastic order (§7.13); from Layer 8 the inverse functions of §8.4,
the modified Bessel function of §8.1 for the noncentral chi-squared density and Owen's T of §8.2 for
the skew-normal cdf. The noncentral laws (§10.5, §10.6, §10.17) are Poisson mixtures, a
`MeasureTheory.Measure.bind` of `ProbabilityTheory.poissonMeasure` against central laws, not
constructions through other discrete families. The hyperexponential law (§10.19) uses the
categorical law of §9.1. The scalar definitions of the arcsine and semicircle laws (§10.20) use
no geometry: their identification with coordinates of the uniform laws on the circle and the unit
disk is a statement of §12.1, which uses this layer, and Layer 10 does not use Layer 12. Within
the layer, §10.2 uses §10.1, §10.5 uses §10.4, §10.6 uses §10.5, §10.8 uses §10.7, §10.9 uses
§10.4, §10.11 uses §10.1, §10.12 uses §10.2 and §10.4, §10.13 uses §10.12, §10.16 uses §10.7,
and §10.17 uses §10.5 and §10.6. The layer rests on
Mathlib's scalar laws (`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.betaMeasure`,
`ProbabilityTheory.expMeasure`, `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.cauchyMeasure`,
`ProbabilityTheory.poissonMeasure`), its moment and transform theory (`ProbabilityTheory.mgf`,
`ProbabilityTheory.cgf`, `ProbabilityTheory.integrableExpSet`, `MeasureTheory.charFun`), product
measures, independence and convolution of measures, `Real.Gamma`, `Convexity.StdSimplex` and
iterated derivatives, and on Tau Ceti's incomplete Gamma and Beta functions and their inverses, its
error function and inverse error function, its quantile and hazard theory, and its family modules
for the laws of the layer.

## Layer 11: multivariate t and Gaussian transformations

Each family of this layer carries the shared interface of the Conventions: its valid parameters, its
boundary and invalid branches, probability under the valid hypotheses, the density API against the
stated reference measure where the law is absolutely continuous, and parameter measurability.
Densities and covariance statements use the coordinates fixed in each section. The quantile
statements of §11.4 and §11.5 rest on the quantile transport of §7.2 and on the inverse error
function of §8.4; the scalar quantile tables of Layer 13 are not needed here.

### 11.1 Multivariate t

Let `ι` be a finite type, `d = card ι`, `m : EuclideanSpace ℝ ι`, `S : Matrix ι ι ℝ` and `ν : ℝ`.
The multivariate t law is `TauCeti.Probability.multivariateTMeasure m S ν`. For `ν > 0` and `S`
positive semidefinite it is the image of `N(0, S) ⊗ χ²(ν)` under `(z, v) ↦ m + √(ν/v) z`
(`TauCeti.Probability.multivariateTMeasure_of_posSemidef`), so that `m + √(ν/V) Z` has this law
whenever `Z ∼ N(0, S)` and `V ∼ χ²(ν)` are independent
(`TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared`); for `ν ≤ 0` or `S` not positive
semidefinite it is the zero measure (`TauCeti.Probability.multivariateTMeasure_of_nonpos`,
`TauCeti.Probability.multivariateTMeasure_of_not_posSemidef`). For valid parameters it is a
probability measure (`TauCeti.Probability.isProbabilityMeasure_multivariateTMeasure`) and the
Gaussian scale mixture `∫ N(m, (ν/v) S) dχ²(ν)(v)`
(`TauCeti.Probability.multivariateTMeasure_eq_bind`). The family is jointly measurable in
`(m, S, ν)`, with `S` given by its entries through `Matrix.of`
(`TauCeti.Probability.measurable_multivariateTMeasure`). In the bullets below `ν > 0` and `S` is
positive semidefinite.

- **Density.** If `S` is positive definite, the law has, against Euclidean volume, the density
  `f(x) = Γ((ν+d)/2) / (Γ(ν/2) (νπ)^(d/2) √(det S)) · (1 + ⟪x − m, S⁻¹(x − m)⟫/ν)^(−(ν+d)/2)`
  (`TauCeti.Probability.multivariateTPDFReal_of_posDef`,
  `TauCeti.Probability.multivariateTMeasure_eq_withDensity`), with
  `TauCeti.Probability.rnDeriv_multivariateTMeasure` and
  `TauCeti.Probability.hasPDF_of_hasLaw_multivariateTMeasure`.
- **Support and singularity.** The law is concentrated on the affine subspace `m + range S`
  (`TauCeti.Probability.ae_mem_affineRange_multivariateTMeasure`), which is its topological support
  (`TauCeti.Probability.support_multivariateTMeasure`); if `S` is not positive definite it is
  mutually singular with Euclidean volume
  (`TauCeti.Probability.mutuallySingular_multivariateTMeasure_volume`). At `S = 0` it is `δ_m` for
  every `ν > 0` (`TauCeti.Probability.multivariateTMeasure_zero_scale`).
- **Moments.** For a natural number `n`, `‖x‖ⁿ` is integrable exactly when `S = 0` or `n < ν`
  (`TauCeti.Probability.integrable_norm_pow_multivariateTMeasure_iff`); so for nonzero `S` a
  positive natural norm moment of order `r` exists exactly when `r < ν`. The mean is `m` for `ν > 1`
  (`TauCeti.Probability.integral_id_multivariateTMeasure`) and the covariance matrix of §5.1 is
  `ν S/(ν − 2)` for `ν > 2` (`TauCeti.Probability.covMatrix_multivariateTMeasure`,
  `TauCeti.Probability.covarianceBilin_multivariateTMeasure`): the scale matrix `S` is not the
  covariance.
- **Directional exponential integrability.** For `θ : EuclideanSpace ℝ ι`, the exact set
  `ProbabilityTheory.integrableExpSet` of the observable `x ↦ ⟪θ, x⟫` is `{0}` when `⟪θ, Sθ⟫ > 0`
  and `ℝ` when `⟪θ, Sθ⟫ = 0` (`TauCeti.Probability.integrableExpSet_inner_multivariateTMeasure`).
- **Marginals and affine closure.** Every real linear marginal is a location-scale Student law:
  `⟪θ, X⟫` has the law of `⟪θ, m⟫ + √⟪θ, Sθ⟫ T` with `T ∼ t(ν)`
  (`TauCeti.Probability.map_inner_multivariateTMeasure`). For every real matrix `L` with rows
  indexed by a finite type `κ` and every `c`, `LX + c` has law `t(Lm + c, L S Lᵀ, ν)`
  (`TauCeti.Probability.map_affine_multivariateTMeasure`). When `ι` has one element the law is the
  image of the scalar Student law of §3.7 under `t ↦ m + √S t`, the Dirac mass at `m` when `S = 0`
  (`TauCeti.Probability.multivariateTMeasure_eq_map_single`).
- **Gaussian limit.** As `ν → ∞` the laws converge weakly, as elements of
  `MeasureTheory.ProbabilityMeasure`, to `N(m, S)`
  (`TauCeti.Probability.tendsto_multivariateTMeasure_atTop`).
- **Conditional law.** Index the coordinates by `ι ⊕ κ` and write `S₁₁, S₁₂, S₂₁, S₂₂` and `m₁, m₂`
  for the blocks. If `S₂₂` is positive definite, the conditional law of the `ι`-block given the
  `κ`-block equal to `x₂` is the multivariate t law with degree `ν + card κ`, location
  `m₁ + S₁₂ S₂₂⁻¹ (x₂ − m₂)` and scale `((ν + q)/(ν + card κ)) (S₁₁ − S₁₂ S₂₂⁻¹ S₂₁)`, where
  `q = ⟪x₂ − m₂, S₂₂⁻¹ (x₂ − m₂)⟫`. It is stated through the kernel
  `EuclideanSpace.multivariateTCondKernel m S ν`, a Markov kernel for valid parameters
  (`EuclideanSpace.multivariateTCondKernel_apply`,
  `EuclideanSpace.isMarkovKernel_multivariateTCondKernel`; the location and the Schur complement
  take the displayed form by `EuclideanSpace.gaussianCondMean_of_posDef` and
  `Matrix.gaussianCondCov_of_posDef`); the joint law of the `κ`-block and the `ι`-block is the
  `κ`-marginal composed with this kernel (`EuclideanSpace.map_snd_fst_multivariateTMeasure`), and
  for every `X` with this law `ProbabilityTheory.condDistrib` of the `ι`-block given the `κ`-block
  equals the kernel almost everywhere (`TauCeti.Probability.condDistrib_multivariateTMeasure`). The
  Gaussian case of this conditional law is Anderson 2003.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.condDistrib`,
`ProbabilityTheory.Kernel`, `ProbabilityTheory.integrableExpSet`,
`MeasureTheory.ProbabilityMeasure`; Tau Ceti `TauCeti.Probability.chiSquaredMeasure` (§3.5),
`TauCeti.Probability.studentTMeasure` (§3.7), `TauCeti.covMatrix` (§5.1),
`EuclideanSpace.gaussianCondMean` and `Matrix.gaussianCondCov` (§5.4); §5.2 (Gaussian support), §5.3
(Gaussian affine transport), §7.1.

**Checks.**

- When `ι` has one element, the law is the scalar Student law moved by `t ↦ m + √S t`, and at
  `S = 0` it is the Dirac mass at `m` for every `ν > 0`; a definition through the density formula
  would have no law at `S = 0`.
- For `ν = 3` and positive definite `S`, the covariance matrix is `3S`; a definition that took `S`
  as the covariance would give `S`.
- For `ν = 1`, `d = 2`, `m = 0` and `S = I`, the density at the origin is
  `Γ(3/2)/(Γ(1/2) π) = 1/(2π)`; given that the second coordinate is `0`, the first has law
  `(1/√2) T` with `T ∼ t(2)`, whose density at `0` is `1/2`. A conditional law that kept the degree
  `ν = 1` and the scale `S₁₁ = 1` would be the Cauchy law, with density `1/π ≈ 0.318` at `0`. Given
  that the second coordinate is `1`, `q = 1` and the conditional law is `t(2)` itself.
- For `S ≠ 0` and `θ` with `⟪θ, Sθ⟫ > 0` the exponential-integrability set is `{0}`, while the
  Gaussian limit has the whole line; an argument transferring Gaussian transforms to the t law would
  wrongly give `ℝ`.

### 11.2 Matrix normal

Let `ι` and `κ` be finite types, `r = card ι`, `c = card κ`. Matrices `Matrix ι κ ℝ` carry the
product Borel structure on their entries, and volume on them is the product of the entry volumes
(`Matrix.instMeasureSpace`). The matrix normal law with mean `M : Matrix ι κ ℝ`, row covariance
`U : Matrix ι ι ℝ` and column covariance `V : Matrix κ κ ℝ` is
`TauCeti.Probability.matrixNormalMeasure M U V` (Eaton, vector-space Gaussians). For `U` and `V`
positive semidefinite it is the image, under the inverse of the column-stacking vectorization
`TauCeti.matrixVecMeasurableEquiv 2` onto `EuclideanSpace ℝ (κ × ι)`, of the Gaussian with mean
`vec M` and covariance the Kronecker product `V ⊗ U`
(`TauCeti.Probability.matrixNormalMeasure_of_posSemidef`,
`TauCeti.Probability.map_vec_matrixNormalMeasure`); otherwise it is `δ_M` by an explicit branch
(`TauCeti.Probability.matrixNormalMeasure_of_not_posSemidef`). It is a probability measure for all
parameters (`TauCeti.Probability.isProbabilityMeasure_matrixNormalMeasure`). The vectorization is a
measurable equivalence that carries the product volume on matrices to Euclidean volume
(`TauCeti.volume_preserving_matrixVecMeasurableEquiv`).

Prove the row-major presentation: the map `x ↦ Matrix.of (fun i j => x (i, j))` from
`EuclideanSpace ℝ (ι × κ)` to `Matrix ι κ ℝ`, with inverse
`A ↦ WithLp.toLp 2 (fun ij => A ij.1 ij.2)`, is a measurable equivalence carrying Euclidean volume
to the product volume on matrices, and for `U, V` positive semidefinite the matrix normal law is the
image under it of the Gaussian on `EuclideanSpace ℝ (ι × κ)` with mean `(i, j) ↦ M i j` and
covariance entries `((i, j), (k, l)) ↦ U i k * V j l`.

For `U` and `V` positive semidefinite:

- **Mean and covariance.** Every entry lies in `Lᵖ` for every finite `p` and has mean `M i j`, for
  all parameters (`TauCeti.Probability.memLp_apply_matrixNormalMeasure`,
  `TauCeti.Probability.integral_apply_matrixNormalMeasure`); the entry `X i j` has law
  `N(M i j, U i i · V j j)` (`TauCeti.Probability.map_apply_matrixNormalMeasure`), and
  `Cov(X i j, X k l) = U i k · V j l` (`TauCeti.Probability.covariance_matrixNormalMeasure`).
- **Rows and columns.** Row `i` is Gaussian with mean the `i`-th row of `M` and covariance
  `U i i · V`, and column `j` is Gaussian with mean the `j`-th column of `M` and covariance
  `V j j · U` (`TauCeti.Probability.map_row_matrixNormalMeasure`,
  `TauCeti.Probability.map_col_matrixNormalMeasure`).
- **Affine maps.** For real matrices `A` (rows indexed by a finite `ι'`), `B` (columns indexed by a
  finite `κ'`) and `C`, `AXB + C` has the matrix normal law with parameters
  `(AMB + C, A U Aᵀ, Bᵀ V B)` (`TauCeti.Probability.map_mul_mul_add_matrixNormalMeasure`); for all
  parameters the transpose has the matrix normal law `(Mᵀ, V, U)`
  (`TauCeti.Probability.map_transpose_matrixNormalMeasure`).
- **Degenerate parameters.** `U = 0` or `V = 0` gives `δ_M`
  (`TauCeti.Probability.matrixNormalMeasure_zero_left`,
  `TauCeti.Probability.matrixNormalMeasure_zero_right`), and an empty row or column type gives the
  Dirac mass at the unique matrix (`TauCeti.Probability.matrixNormalMeasure_of_subsingleton`).
- **Linear functionals and transforms.** For `T : Matrix ι κ ℝ`, the functional `X ↦ tr(Tᵀ X)`
  (every real linear functional on matrices has this form) has law `N(tr(Tᵀ M), tr(Tᵀ U T V))`
  (`TauCeti.Probability.map_trace_transpose_mul_matrixNormalMeasure`); its exponential-integrability
  set is `ℝ` for all parameters
  (`TauCeti.Probability.integrableExpSet_trace_transpose_mul_matrixNormalMeasure`), its mgf is
  `exp(tr(Tᵀ M) t + tr(Tᵀ U T V) t²/2)` with the corresponding cgf, and its characteristic function
  is `exp(i t tr(Tᵀ M) − tr(Tᵀ U T V) t²/2)`
  (`TauCeti.Probability.mgf_trace_transpose_mul_matrixNormalMeasure`,
  `TauCeti.Probability.cgf_trace_transpose_mul_matrixNormalMeasure`,
  `TauCeti.Probability.charFun_map_trace_transpose_mul_matrixNormalMeasure`).
- **Density.** If `U` and `V` are positive definite, the law has, against the product volume, the
  density

      (2π)^(−rc/2) (det U)^(−c/2) (det V)^(−r/2) exp(−tr(V⁻¹ (X − M)ᵀ U⁻¹ (X − M))/2)

  (`TauCeti.Probability.matrixNormalPDFReal_of_posDef`,
  `TauCeti.Probability.matrixNormalMeasure_eq_withDensity`), which is the Gaussian density of the
  vectorized matrix (`TauCeti.Probability.matrixNormalPDFReal_eq_multivariateGaussianPDFReal`), with
  `TauCeti.Probability.rnDeriv_matrixNormalMeasure` and
  `TauCeti.Probability.hasPDF_of_hasLaw_matrixNormalMeasure`.

Prove the support statements: for `U` and `V` positive semidefinite the law is concentrated on
`{M + U B V : B ∈ Matrix ι κ ℝ}`, the image under vectorization of the affine support of the
Gaussian (§5.2), and this set is its topological support; and if `ι` and `κ` are nonempty and `U` or
`V` is not positive definite (the invalid Dirac branch included), the law is mutually singular with
volume. Prove parameter measurability: the map sending `(M, U, V)` to the matrix normal law is
measurable for the Giry structure, with `U` and `V` given by their entries through `Matrix.of`.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `Matrix.vec`, `Matrix.kroneckerMap`,
`MeasureTheory.charFun`, `ProbabilityTheory.mgf`; Tau Ceti `TauCeti.matrixVecMeasurableEquiv`,
`TauCeti.volume_preserving_matrixVecMeasurableEquiv`, `Matrix.instMeasureSpace`,
`TauCeti.Probability.multivariateGaussianPDFReal` (§5.2); §5.2 (Gaussian density and support), §5.3
(Gaussian affine transport and transforms), §5.7 (Gaussian parameter measurability).

**Checks.**

- A `1 × 1` matrix normal law with `U = (u)` and `V = (v)` is `N(M, uv)`, and the density formula
  gives `(2π uv)^(−1/2) exp(−(x − M)²/(2uv))`.
- For `r = 2`, `c = 1`, `U = 2I` and `V = (1)`, the matrix is a Gaussian vector with covariance
  `2I`, whose density at its mean is `(2π)⁻¹ · 1/2`; the formula gives
  `(2π)^(−1) (det U)^(−1/2) (det V)^(−1) = (2π)⁻¹ · 1/2`. Exchanging the exponents of `det U` and
  `det V` would give `(2π)⁻¹ · 1/4`.
- With `U = diag(1, 2)` and `V = diag(3, 4)`, the entry `X₂₁` has variance `U₂₂ V₁₁ = 6` and `X₁₂`
  has variance `U₁₁ V₂₂ = 4`. The transpose has parameters `(Mᵀ, V, U)`, so its `(1, 2)` entry,
  which is `X₂₁`, has variance `6`; keeping `(U, V)` for the transpose would give `4`.

### 11.3 Proper complex Gaussian

Let `ι` be a finite type, `d = card ι`. Complex vectors `ι → ℂ` carry the product Borel structure
and the product of the Lebesgue measures of the complex coordinates, and the realification
`TauCeti.complexToRealEuclidean ι` identifies them with `EuclideanSpace ℝ (ι ⊕ ι)`, real parts on
the left copy and imaginary parts on the right. For a complex matrix `C`, its real covariance is
`TauCeti.Probability.complexGaussianRealCovariance C`, the block matrix

    (1/2) · ( Re C   −Im C )
            ( Im C    Re C )

(`TauCeti.Probability.complexGaussianRealCovariance_def`; entries
`TauCeti.Probability.complexGaussianRealCovariance_inl_inl` and its three companions), and it is
positive semidefinite, respectively positive definite, exactly when `C` is
(`TauCeti.Probability.posSemidef_complexGaussianRealCovariance_iff`,
`TauCeti.Probability.posDef_complexGaussianRealCovariance_iff`). The proper complex Gaussian with
mean `m : ι → ℂ` and covariance `C` is `TauCeti.Probability.properComplexGaussianMeasure m C`, the
image under the inverse realification of the Gaussian with the realified mean and this real
covariance (`TauCeti.Probability.properComplexGaussianMeasure_def`) (Tse and Viswanath, appendix A).
It is a probability measure and a Gaussian measure for all parameters
(`TauCeti.Probability.isProbabilityMeasure_properComplexGaussianMeasure`,
`TauCeti.Probability.isGaussian_properComplexGaussianMeasure`), it is `δ_m` when `C` is not positive
semidefinite and when `C = 0` (`TauCeti.Probability.properComplexGaussianMeasure_of_not_posSemidef`,
`TauCeti.Probability.properComplexGaussianMeasure_zero`), its mean is `m` for all parameters
(`TauCeti.Probability.integral_id_properComplexGaussianMeasure`), and it is jointly measurable in
`(m, C)` (`TauCeti.Probability.measurable_properComplexGaussianMeasure`). For `C` positive
semidefinite:

- **Covariance and pseudocovariance.** `E[(Zᵢ − mᵢ) conj(Zⱼ − mⱼ)] = C i j` and
  `E[(Zᵢ − mᵢ)(Zⱼ − mⱼ)] = 0`, the products being integrable for all parameters
  (`TauCeti.Probability.integral_mul_conj_sub_properComplexGaussianMeasure`,
  `TauCeti.Probability.integral_mul_sub_properComplexGaussianMeasure`,
  `TauCeti.Probability.integrable_mul_conj_sub_properComplexGaussianMeasure`,
  `TauCeti.Probability.integrable_mul_sub_properComplexGaussianMeasure`): the complex covariance is
  `C` and the pseudocovariance vanishes.
- **Affine closure and marginals.** For a complex matrix `L` with rows indexed by a finite `κ` and
  `c : κ → ℂ`, `LZ + c` is the proper complex Gaussian with parameters `(Lm + c, L C Lᴴ)`
  (`TauCeti.Probability.map_affine_properComplexGaussianMeasure`); for every map `f : κ → ι` the
  reindexed vector `Z ∘ f` has parameters `(m ∘ f, C.submatrix f f)`, which gives the coordinate
  marginals (`TauCeti.Probability.map_comp_properComplexGaussianMeasure`).
- **Rotation invariance.** For every complex `u` with `|u| = 1` and every `C`, the centered law is
  invariant under `z ↦ u z` (`TauCeti.Probability.properComplexGaussianMeasure_centered_rotation`).
  So the fluctuation `Z − m` is circular; the law of `Z` itself is not invariant when `m ≠ 0`.
- **Real directional transforms.** For `q : ι → ℂ`, `Re(qᴴ Z)` is `N(Re(qᴴ m), Re(qᴴ C q)/2)`
  (`TauCeti.Probability.map_re_dotProduct_properComplexGaussianMeasure`), with
  exponential-integrability set `ℝ` for all parameters, mgf `exp(t Re(qᴴ m) + t² Re(qᴴ C q)/4)`, the
  corresponding cgf, and characteristic function
  (`TauCeti.Probability.integrableExpSet_re_dotProduct_properComplexGaussianMeasure`,
  `TauCeti.Probability.mgf_re_dotProduct_properComplexGaussianMeasure`,
  `TauCeti.Probability.cgf_re_dotProduct_properComplexGaussianMeasure`,
  `TauCeti.Probability.charFun_map_re_dotProduct_properComplexGaussianMeasure`).
- **Support and singularity.** The law is concentrated on, and has as topological support, the
  preimage under realification of the affine subspace through the realified mean along the range of
  the real covariance (`TauCeti.Probability.ae_mem_affineRange_properComplexGaussianMeasure`,
  `TauCeti.Probability.support_properComplexGaussianMeasure`); the invalid branch has support `{m}`
  (`TauCeti.Probability.support_properComplexGaussianMeasure_of_not_posSemidef`), and if `C` is not
  positive definite the law is mutually singular with volume
  (`TauCeti.Probability.mutuallySingular_properComplexGaussianMeasure_volume`).
- **Density.** If `C` is positive definite, then `det C` is a positive real number
  (`Matrix.PosDef.det_pos`, in the order of `ℂ`), and the law has, against the real product volume
  on the complex coordinates, the density

      exp(−Re((z − m)ᴴ C⁻¹ (z − m))) / (π^d · Re(det C))

  (`TauCeti.Probability.properComplexGaussianPDFReal_of_posDef`,
  `TauCeti.Probability.properComplexGaussianMeasure_eq_withDensity`), with
  `TauCeti.Probability.rnDeriv_properComplexGaussianMeasure` and
  `TauCeti.Probability.hasPDF_of_hasLaw_properComplexGaussianMeasure`; it is the real Gaussian
  density of the realification
  (`TauCeti.Probability.properComplexGaussianPDFReal_eq_multivariateGaussianPDFReal`).
- **Scalar coordinates.** For each `i`, `(Re Zᵢ − Re mᵢ, Im Zᵢ − Im mᵢ)` has law
  `N(0, Re C i i/2) ⊗ N(0, Re C i i/2)`
  (`TauCeti.Probability.map_re_im_sub_eval_properComplexGaussianMeasure`), `|Zᵢ − mᵢ|²` has the law
  of `Re C i i · E` with `E` exponential of rate one
  (`TauCeti.Probability.map_norm_sq_sub_eval_properComplexGaussianMeasure`), its mean is `Re C i i`
  (`TauCeti.Probability.integral_norm_sq_sub_eval_properComplexGaussianMeasure`), and for
  `Re C i i > 0` the modulus `|Zᵢ − mᵢ|` has the chi law of §10.4 with two degrees and scale
  `√(Re C i i/2)`, the Rayleigh law of that scale
  (`TauCeti.Probability.map_norm_sub_eval_properComplexGaussianMeasure`). For a standard coordinate
  (`C i i = 1`) the real and imaginary parts are independent with variance `1/2`, the expected
  squared modulus is one, the squared modulus is exponential of rate one, and the modulus is
  Rayleigh of scale `1/√2`.

Prove the Rice modulus: if `Re C i i > 0` and `s = √(Re C i i/2)`, the modulus `|Zᵢ|` (not centered)
has the Rice law of §10.5, the noncentral chi law
`TauCeti.Probability.noncentralChiMeasure 2 (|mᵢ|/s) s`. A route: realify the coordinate, which is
`N((Re mᵢ, Im mᵢ), s² I)` in the plane, and apply
`TauCeti.Probability.map_norm_multivariateGaussian_noncentral_of_scale`.

Improper complex Gaussians, with nonzero pseudocovariance, are not part of this roadmap.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.IsGaussian`,
`ProbabilityTheory.expMeasure`, `Matrix.PosDef.det_pos`; Tau Ceti `TauCeti.complexToRealEuclidean`,
`TauCeti.Probability.chiMeasure` (§10.4), `TauCeti.Probability.noncentralChiMeasure` and
`TauCeti.Probability.map_norm_multivariateGaussian_noncentral_of_scale` (§10.5); §5.2, §5.3, §5.7,
§1.5 (exponential law).

**Checks.**

- For `d = 1`, `m = 0` and `C = 1`, the density at `0` is `1/π`, the density at the origin of the
  planar Gaussian with covariance `I/2`; without the factor `1/2` in the real covariance it would be
  `1/(2π)`, and the expected squared modulus would be `2` instead of `1`.
- For a standard coordinate, `P(|Z| > 1) = e^(−1) ≈ 0.368`, from the rate-one exponential law of
  `|Z|²`.
- A real Gaussian `X ∼ N(0, 1)` viewed in `ℂ` has `E[X · conj X] = E[X²] = 1`: its pseudocovariance
  is not zero, so it is not a proper complex Gaussian, although its complex covariance is that of a
  proper one with `C = 1`.
- For `m = 1` in dimension one, the image of the law under `z ↦ i z` has mean `i`, not `1`: only the
  centered law is rotation invariant.

### 11.4 Multivariate log-normal

For a finite type `ι`, `m : EuclideanSpace ℝ ι` and `S : Matrix ι ι ℝ`, the multivariate log-normal
law is `TauCeti.Probability.multivariateLogNormalMeasure m S`, the image of `N(m, S)` under the
coordinatewise exponential (`TauCeti.Probability.multivariateLogNormalMeasure_def`); it is a
probability measure for all parameters
(`TauCeti.Probability.isProbabilityMeasure_multivariateLogNormalMeasure`) and jointly measurable in
`(m, S)` (`TauCeti.Probability.measurable_multivariateLogNormalMeasure`). A vector `X` has this law
whenever `log X ∼ N(m, S)` (`TauCeti.Probability.hasLaw_exp_multivariateGaussian`), and the
coordinatewise logarithm of the law is `N(m, S)`
(`TauCeti.Probability.map_log_multivariateLogNormalMeasure`). The coordinate laws are the scalar
log-normal laws of §3.2 (Johnson, Kotz and Balakrishnan, vol. 1).

- **Support.** The law is almost surely in the open positive orthant
  (`TauCeti.Probability.ae_pos_multivariateLogNormalMeasure`). For `S` positive semidefinite it is
  concentrated on `exp(m + range S)` and its topological support is the closure of that set in the
  ambient space (`TauCeti.Probability.ae_mem_exp_affineRange_multivariateLogNormalMeasure`,
  `TauCeti.Probability.support_multivariateLogNormalMeasure`); if `S` is not positive definite it is
  mutually singular with volume
  (`TauCeti.Probability.mutuallySingular_multivariateLogNormalMeasure_volume`). An invalid
  covariance, and `S = 0`, give `δ_(exp m)`, with singleton support in the invalid case
  (`TauCeti.Probability.multivariateLogNormalMeasure_of_not_posSemidef`,
  `TauCeti.Probability.multivariateLogNormalMeasure_zero`,
  `TauCeti.Probability.support_multivariateLogNormalMeasure_of_not_posSemidef`).
- **Density.** For `S` positive definite the law has, against Euclidean volume, the density
  `φ_(m,S)(log x)/∏ᵢ xᵢ` on the open positive orthant and `0` elsewhere, where `φ_(m,S)` is the
  Gaussian density of §5.2 (`TauCeti.Probability.multivariateLogNormalPDFReal_of_pos`,
  `TauCeti.Probability.multivariateLogNormalPDFReal_of_not_pos`,
  `TauCeti.Probability.multivariateLogNormalMeasure_eq_withDensity`); the factor `1/∏ᵢ xᵢ` is the
  absolute determinant of the derivative of the coordinatewise logarithm
  (`TauCeti.Probability.multivariateLogNormalPDFReal_eq_abs_det_fderiv_log`). The density API is
  completed by `TauCeti.Probability.rnDeriv_multivariateLogNormalMeasure` and
  `TauCeti.Probability.hasPDF_of_hasLaw_multivariateLogNormalMeasure`.
- **Mixed powers.** For every real vector `q`, the monomial `∏ᵢ xᵢ^(qᵢ)` (real powers) is integrable
  for every `S` (`TauCeti.Probability.integrable_prod_rpow_multivariateLogNormalMeasure`), and for
  `S` positive semidefinite

      E[∏ᵢ Xᵢ^(qᵢ)] = exp(⟪q, m⟫ + ⟪q, Sq⟫/2),   E[Xᵢ] = exp(mᵢ + Sᵢᵢ/2),
      Cov(Xᵢ, Xⱼ) = exp(mᵢ + mⱼ + (Sᵢᵢ + Sⱼⱼ)/2) (exp(Sᵢⱼ) − 1)

  (`TauCeti.Probability.integral_prod_rpow_multivariateLogNormalMeasure`,
  `TauCeti.Probability.integral_eval_multivariateLogNormalMeasure`,
  `TauCeti.Probability.covariance_eval_multivariateLogNormalMeasure`), with the Bochner mean and the
  covariance matrix of §5.1 in the same form
  (`TauCeti.Probability.integral_id_multivariateLogNormalMeasure`,
  `TauCeti.Probability.covMatrix_multivariateLogNormalMeasure`).
- **Laws of observables.** For `S` positive semidefinite, coordinate `i` is log-normal `(mᵢ, Sᵢᵢ)`
  (`TauCeti.Probability.map_eval_multivariateLogNormalMeasure`), `⟪q, log X⟫` is
  `N(⟪q, m⟫, ⟪q, Sq⟫)` (`TauCeti.Probability.map_inner_log_multivariateLogNormalMeasure`), and
  `∏ᵢ Xᵢ^(qᵢ)` is log-normal `(⟪q, m⟫, ⟪q, Sq⟫)`
  (`TauCeti.Probability.map_prod_rpow_multivariateLogNormalMeasure`).
- **Quantiles.** For `S` positive semidefinite and `0 < u < 1`, the quantile of coordinate `i` is
  `exp(mᵢ + √(2Sᵢᵢ) erf⁻¹(2u − 1))` and that of `∏ᵢ Xᵢ^(qᵢ)` is
  `exp(⟪q, m⟫ + √(2⟪q, Sq⟫) erf⁻¹(2u − 1))`, including zero variance
  (`TauCeti.Probability.quantile_map_eval_multivariateLogNormalMeasure`,
  `TauCeti.Probability.quantile_map_prod_rpow_multivariateLogNormalMeasure`), with one-sided
  endpoint limits `exp(mᵢ)` or `0` and `exp(mᵢ)` or `∞` according as the variance vanishes
  (`TauCeti.Probability.tendsto_quantile_map_eval_multivariateLogNormalMeasure_nhdsGT_zero` and its
  three companions for `u → 1` and for monomials).
- **Transport.** For `S` positive semidefinite, a real matrix `L` with rows indexed by a finite `κ`
  and `c : EuclideanSpace ℝ κ`, the log-affine image `X ↦ exp(c + L log X)` is log-normal
  `(Lm + c, L S Lᵀ)` (`TauCeti.Probability.map_logAffine_multivariateLogNormalMeasure`); the
  componentwise product of independent log-normal vectors with positive semidefinite covariances is
  log-normal with added means and covariances
  (`TauCeti.Probability.map_mul_prod_multivariateLogNormalMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_mul_multivariateLogNormalMeasure`).

Prove that when `ι` is empty the law is the Dirac mass at the unique point of `EuclideanSpace ℝ ι`
(it is a probability measure on a one-point space).

Coordinate sums are not claimed to be log-normal, and no general directional mgf formula or domain
is part of this section.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`; Tau Ceti
`TauCeti.Probability.logNormalMeasure` (§3.2), `TauCeti.Probability.multivariateGaussianPDFReal`
(§5.2), `TauCeti.covMatrix` (§5.1), `Real.erfInv` (§8.4); Mathlib
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` (change of variables); §5.3 (Gaussian
affine transport and directional transforms), §7.2 (monotone quantile transport).

**Checks.**

- For `m = 0` and `S = (1)`, `E X = e^(1/2) ≈ 1.649` and `Var X = e(e − 1) ≈ 4.671`; a mean formula
  without the correction `Sᵢᵢ/2` would give `E X = 1`.
- For `m = 0` and `S = ((1, −1), (−1, 1))`, which is positive semidefinite and singular,
  `X₁X₂ = exp(Z − Z) = 1` almost surely: the mixed-power formula with `q = (1, 1)` gives
  `exp(⟪q, Sq⟫/2) = 1`, the covariance formula gives `e(e^(−1) − 1) = 1 − e ≈ −1.718`, and the law
  is singular with respect to volume on the plane.
- For a covariance that is not positive semidefinite the law is the Dirac mass at `exp m`, so every
  mixed power is integrable; the closed form `exp(⟪q, m⟫ + ⟪q, Sq⟫/2)` is not claimed there.

### 11.5 Simplex logistic-normal

Let `ι` be a finite nonempty type, `r : ι` a reference category and `J_r = {i : i ≠ r}`. For
`z : EuclideanSpace ℝ J_r`, extend `z` by `z̄ r = 0` and set `T_r(z)ᵢ = exp(z̄ᵢ) / ∑ⱼ exp(z̄ⱼ)`;
this is `TauCeti.Probability.logisticNormalChart r`
(`TauCeti.Probability.logisticNormalChart_apply`), with values in `EuclideanSpace ℝ ι`, the ambient
carrier of the Dirichlet law of §5.6. The logistic-normal law (Aitchison and Shen 1980) is
`TauCeti.Probability.logisticNormalMeasure r m S`, the image of `N(m, S)` under `T_r`
(`TauCeti.Probability.logisticNormalMeasure_def`), a probability measure for all parameters
(`TauCeti.Probability.isProbabilityMeasure_logisticNormalMeasure`), jointly measurable in `(m, S)`
(`TauCeti.Probability.measurable_logisticNormalMeasure`).

- **Chart.** `T_r` is continuous and injective, its coordinates are positive and sum to one, and its
  range is the open simplex `{x : ∀ i, 0 < xᵢ, ∑ᵢ xᵢ = 1}`
  (`TauCeti.Probability.continuous_logisticNormalChart`,
  `TauCeti.Probability.logisticNormalChart_injective`,
  `TauCeti.Probability.logisticNormalChart_pos`, `TauCeti.Probability.sum_logisticNormalChart`,
  `TauCeti.Probability.range_logisticNormalChart`). Its inverse on the open simplex is the log-ratio
  map `A_r(x)ᵢ = log(xᵢ/x_r)`, `TauCeti.Probability.logisticNormalLogRatio r`
  (`TauCeti.Probability.logisticNormalLogRatio_apply`,
  `TauCeti.Probability.logisticNormalLogRatio_chart`,
  `TauCeti.Probability.logisticNormalChart_logRatio`). Prove that `T_r` is infinitely differentiable
  and that `T_r` and `A_r` are mutually inverse homeomorphisms between `EuclideanSpace ℝ J_r` and
  the open simplex, `A_r` being infinitely differentiable on it as a function of the deleted
  coordinates.
- **Simplex membership and reference measure.** The law is almost surely in the open simplex
  (`TauCeti.Probability.ae_mem_simplex_logisticNormalMeasure`). The reference measure is the image
  of product volume on `J_r → ℝ` under the deleted-coordinate reconstruction
  `x_r = 1 − ∑_(i ≠ r) xᵢ`, `TauCeti.Probability.dirichletChart r` of §5.6; the chart change between
  two deleted coordinates has absolute Jacobian one
  (`TauCeti.Probability.abs_det_fderiv_dirichletChart_swap`), so the reference measures for `r` and
  `s` agree (`TauCeti.Probability.map_dirichletChart_volume_eq`).
- **Density.** In the deleted coordinates, the Jacobian determinant of `T_r` is `∏ᵢ T_r(z)ᵢ`, the
  product over all of `ι` (`TauCeti.Probability.det_fderiv_logisticNormalChart_coords`). For `S`
  positive definite the deleted-coordinate image of the law has, against volume on `J_r → ℝ`, the
  density `φ_(m,S)(A_r(x))/∏ᵢ xᵢ` on the chart region `{xⱼ > 0, ∑ⱼ xⱼ < 1}` and `0` elsewhere, and
  the law is the image of that measure under the reconstruction
  (`TauCeti.Probability.logisticNormalChartPDFReal_of_mem`,
  `TauCeti.Probability.logisticNormalChartPDFReal_of_notMem`,
  `TauCeti.Probability.map_coords_logisticNormalMeasure_eq_withDensity`,
  `TauCeti.Probability.logisticNormalMeasure_eq_map_withDensity_logisticNormalChartPDF`), with
  `TauCeti.Probability.rnDeriv_map_coords_logisticNormalMeasure` and
  `TauCeti.Probability.hasPDF_coords_of_hasLaw_logisticNormalMeasure`.
- **Support and singular cases.** For every `S` the law is concentrated on `T_r(m + range S)`
  (`TauCeti.Probability.ae_mem_chart_affineRange_logisticNormalMeasure`); for `S` positive
  semidefinite its topological support is the ambient closure of that set
  (`TauCeti.Probability.support_logisticNormalMeasure`); if `S` is not positive definite (so the
  chart dimension is positive) the law is mutually singular with the reference measure
  (`TauCeti.Probability.mutuallySingular_logisticNormalMeasure_chart_volume`). An invalid covariance
  gives `δ_(T_r(m))` with singleton support, and so does `S = 0`
  (`TauCeti.Probability.logisticNormalMeasure_of_not_posSemidef`,
  `TauCeti.Probability.support_logisticNormalMeasure_of_not_posSemidef`,
  `TauCeti.Probability.logisticNormalMeasure_zero`). With one category the law is the Dirac mass at
  the unique simplex point (`TauCeti.Probability.logisticNormalMeasure_of_subsingleton`).
- **Change of reference.** For a second reference `s`, the linear equivalence
  `(B_sr z)ᵢ = z̄ᵢ − z̄_s` for `i ≠ s` is `TauCeti.Probability.logisticNormalReferenceEquiv r s`,
  with matrix `TauCeti.Probability.logisticNormalReferenceMatrix r s`
  (`TauCeti.Probability.logisticNormalReferenceEquiv_apply`,
  `TauCeti.Probability.toEuclideanLin_logisticNormalReferenceMatrix`); its inverse is `B_rs`
  (`TauCeti.Probability.logisticNormalReferenceEquiv_symm`) and `T_s ∘ B_sr = T_r`
  (`TauCeti.Probability.logisticNormalChart_reference`). For every covariance parameter,

      LN_r(m, S) = LN_s(B_sr m, B_sr S B_srᵀ)

  (`TauCeti.Probability.logisticNormalMeasure_change_reference`), and `B_sr S B_srᵀ` is positive
  semidefinite exactly when `S` is
  (`TauCeti.Probability.posSemidef_logisticNormalReferenceMatrix_iff`), so invalid parameters
  correspond to invalid parameters and their Dirac fallbacks agree.
- **Permutations and log ratios.** Relabelling the categories by a bijection reindexes the mean and
  the covariance (`TauCeti.Probability.map_comp_logisticNormalMeasure`). The log-ratio vector
  `A_s(X)` is Gaussian with parameters `(B_sr m, B_sr S B_srᵀ)` for every `s`
  (`ProbabilityTheory.HasLaw.logisticNormalLogRatio`,
  `TauCeti.Probability.map_logisticNormalLogRatio_logisticNormalMeasure`); for `S` positive
  semidefinite, `log(Xⱼ/X_r)` is `N(mⱼ, Sⱼⱼ)` with quantile `mⱼ + √(2Sⱼⱼ) erf⁻¹(2u − 1)` for
  `0 < u < 1`, and the log ratios against any other reference have the quantiles given by the
  transformed parameters (`TauCeti.Probability.map_log_div_logisticNormalMeasure`,
  `TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure`,
  `TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure_reference`).
- **Moments.** For every natural multi-index `k`, the mixed moment `∏ᵢ xᵢ^(kᵢ)` is integrable and
  equals the Gaussian integral `∫ ∏ᵢ T_r(z)ᵢ^(kᵢ) dN(m, S)(z)`
  (`TauCeti.Probability.integrable_prod_pow_logisticNormalMeasure`,
  `TauCeti.Probability.integral_prod_pow_logisticNormalMeasure`); the mean and the covariance matrix
  are the order-one and order-two cases (`TauCeti.Probability.integral_id_logisticNormalMeasure`,
  `TauCeti.Probability.covMatrix_logisticNormalMeasure`). Bounded support gives every linear
  observable the exponential-integrability set `ℝ`
  (`TauCeti.Probability.integrableExpSet_inner_logisticNormalMeasure`); no closed form of the
  ordinary moments or transforms is part of this section.
- **Two categories.** If `card ι = 2`, the non-reference coordinate has the scalar logit-normal law
  of §10.15 with parameters `(mⱼ, Sⱼⱼ)`, and the vector is recovered from it
  (`TauCeti.Probability.map_eval_logisticNormalMeasure_of_card_eq_two`,
  `TauCeti.Probability.map_logitNormalMeasure_eq_logisticNormalMeasure`), in the convention of the
  PyMC LogitNormal documentation. In higher dimensions the Gaussian quantile observables are the log
  ratios, not the individual coordinates.

*Needs:* Mathlib `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.gaussianReal`; Tau
Ceti `TauCeti.Probability.dirichletChart`, `TauCeti.Probability.dirichletChartRegion` and
`TauCeti.Probability.map_dirichletChart_volume_eq` (§5.6),
`TauCeti.Probability.multivariateGaussianPDFReal` (§5.2), `TauCeti.covMatrix` (§5.1),
`TauCeti.Probability.logitNormalMeasure` (§10.15), `Real.erfInv` (§8.4); §5.3, §7.2.

**Checks.**

- With three categories, reference `3`, `m = 0` and `S = I`, the log ratio `log(X₂/X₁) = z₂ − z₁`
  has variance `2`, and changing the reference to `1` gives the parameters `(0, ((2, 1), (1, 1)))`;
  relabelling the coordinates without the congruence would keep `I` and give variance `1`.
- For `m = 0` and `S = 0` the law is the Dirac mass at the barycenter `(1/card ι, …, 1/card ι)`; a
  softmax over the non-reference coordinates alone would put mass `0` on the reference category and
  leave the open simplex.
- With two categories the chart is the sigmoid and its derivative is `σ(z)(1 − σ(z)) = x₁x₂`, the
  product over both coordinates; a Jacobian omitting the reference coordinate would give `x₁`.

### Examples

- With `ν = 1`, `d = 2`, `m = 0` and `S = I`, the multivariate t law is the bivariate Cauchy law,
  with density `(1/(2π)) (1 + ‖x‖²)^(−3/2)`; each coordinate is standard Cauchy, and given `X₂ = 0`
  the first coordinate has law `(1/√2) T` with `T ∼ t(2)`.
- A matrix normal law with one column and `V = (v)` is the Gaussian vector `N(M, vU)`; with one row
  and one column it is `N(M, uv)`.
- For the standard proper complex Gaussian in dimension one, the density at `0` is `1/π`, `|Z|²` is
  exponential of rate one and `P(|Z| > 1) = e^(−1) ≈ 0.368`.
- The multivariate log-normal law with `m = 0` and `S = ((1, −1), (−1, 1))` lives on the curve
  `x₁x₂ = 1`; its coordinates have mean `e^(1/2)` and covariance `1 − e`.
- The logistic-normal law with two categories, `m = (0)` and `S = (1)`, has the logit-normal law
  `(0, 1)` in its non-reference coordinate, whose median is `1/2`.

### Dependencies

Layer 1 (§1.5 exponential, §1.10 real Gaussian), Layer 2 (§2.3 error functions), Layer 3 (§3.2
log-normal, §3.5 chi-squared, §3.7 Student's t), Layer 5 (§5.1 covariance matrices, §5.2 Gaussian
density and support, §5.3 Gaussian transport and transforms, §5.4 conditional Gaussian, §5.6 the
Dirichlet chart and reference measure, §5.7 parameter measurability), Layer 7 (§7.1 affine
transport, §7.2 quantiles), Layer 8 (§8.4 inverse functions), Layer 10 (§10.4 chi, §10.5 noncentral
chi and Rice, §10.15 logit-normal). From Mathlib: the multivariate Gaussian and standard Gaussian,
conditional distributions and kernels, moment generating and characteristic functions, Kronecker
products and matrix vectorization, and the change-of-variables formula. From Tau Ceti: the families
in `Probability/Distributions/MultivariateT/`, `Probability/Distributions/MatrixNormal/`,
`Probability/Distributions/Gaussian/ProperComplex/`,
`Probability/Distributions/MultivariateLogNormal/` and `Probability/Distributions/LogisticNormal/`,
matrix vectorization and matrix volume, and the realification of complex vectors and matrices.

## Layer 12: spherical and circular laws

The sphere laws live on the unit-sphere subtype `sphere (0 : E) 1` of a finite-dimensional real
inner product space `E` of dimension `d`, with real observables through the embedding into `E`; the
circle laws live on `AddCircle (2π)`, with real cdfs and quantiles taken in the angle chart fixed in
§12.3 and moments taken through the circle characters.

### 12.1 Uniform sphere and ball

The uniform law on the sphere is `TauCeti.Probability.uniformSphereMeasure E`, the surface measure
of volume (`MeasureTheory.Measure.toSphere`) normalized by its total mass
(`TauCeti.Probability.uniformSphereMeasure_def`); the total mass is `2π^(d/2)/Γ(d/2)`
(`TauCeti.toSphere_volume_apply_univ`, via `MeasureTheory.Measure.toSphere_apply_univ`), so that the
uniform law of a set is its surface measure divided by `2π^(d/2)/Γ(d/2)`
(`TauCeti.Probability.uniformSphereMeasure_apply`) (Mardia and Jupp 2000). For `d ≥ 1`:

- it is a probability measure (`TauCeti.Probability.isProbabilityMeasure_uniformSphereMeasure`) and
  is carried to the uniform law of any isometric space by every linear isometry, in particular it is
  invariant under every orthogonal map (`LinearIsometryEquiv.map_uniformSphereMeasure`);
- it is the direction of a standard Gaussian vector, independent of its radius, which has the chi
  law of §10.4 with `d` degrees and scale one: for the measurable direction map
  `TauCeti.sphereDirection e`, which sends `x ≠ 0` to `x/‖x‖` and `0` to an assigned point `e`
  (`TauCeti.measurable_sphereDirection`, `TauCeti.sphereDirection_zero`), the image of the standard
  Gaussian `ProbabilityTheory.stdGaussian E` under `x ↦ (direction of x, ‖x‖)` is the product of the
  uniform law and `chi(d, 1)` for every `e`
  (`TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`,
  `TauCeti.Probability.stdGaussian_map_sphereDirection`,
  `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian`); the assigned direction
  plays no role, the origin being null for the standard Gaussian, which has a density against volume
  (`TauCeti.Probability.stdGaussian_eq_withDensity_norm`);
- the embedded mean is zero and the covariance is `I/d`, every observable `⟪u, X⟫` having variance
  `‖u‖²/d` (`TauCeti.Probability.integral_coe_uniformSphereMeasure`,
  `TauCeti.Probability.covMatrix_map_coe_uniformSphereMeasure`,
  `TauCeti.Probability.covarianceBilin_map_coe_uniformSphereMeasure`,
  `TauCeti.Probability.variance_inner_uniformSphereMeasure`);
- in dimension one it gives mass `1/2` to each of the two unit vectors, and on `ℝ` its embedding is
  the Rademacher law of §9.1 (`TauCeti.Probability.uniformSphereMeasure_eq_of_finrank_eq_one`,
  `TauCeti.Probability.map_coe_uniformSphereMeasure_real`).

Prove that in dimension zero the sphere is empty and `TauCeti.Probability.uniformSphereMeasure E` is
the zero measure, so that it carries no probability law.

The uniform law on the ball of center `c` and radius `r` is
`TauCeti.Probability.uniformBallMeasure c r`: `cond volume (ball c r)` for `r ≠ 0`, which is the
zero measure for `r < 0`, and `δ_c` for `r = 0` (`TauCeti.Probability.uniformBallMeasure_def`,
`TauCeti.Probability.uniformBallMeasure_of_neg`,
`TauCeti.Probability.uniformBallMeasure_zero_right`). It is a probability measure exactly when
`r ≥ 0` (`TauCeti.Probability.isProbabilityMeasure_uniformBallMeasure_iff`), it is jointly
measurable in `(c, r)` (`TauCeti.Probability.measurable_uniformBallMeasure`), its topological
support is the closed ball (`TauCeti.Probability.support_uniformBallMeasure`), and for `d ≥ 1` the
ball has volume `π^(d/2) r^d/Γ(d/2 + 1)` for `r ≥ 0` (`InnerProductSpace.volume_ball`).

- For `r ≠ 0` its density is the uniform density of the ball, with the Radon–Nikodym derivative,
  `MeasureTheory.HasPDF` and `MeasureTheory.pdf.IsUniform` for variables with this law
  (`TauCeti.Probability.uniformBallMeasure_eq_withDensity`,
  `TauCeti.Probability.rnDeriv_uniformBallMeasure`,
  `TauCeti.Probability.hasPDF_of_hasLaw_uniformBallMeasure`,
  `TauCeti.Probability.isUniform_of_hasLaw_uniformBallMeasure`);
- Translation moves the center, a nonzero scalar `s` multiplies the center by `s` and the radius by
  `|s|`, and every law with `r ≥ 0` is the image of the unit ball law under `x ↦ c + r x`
  (`TauCeti.Probability.map_const_add_uniformBallMeasure`,
  `TauCeti.Probability.map_const_smul_uniformBallMeasure`,
  `TauCeti.Probability.uniformBallMeasure_eq_map_unitBall`); a linear isometry moves the center and
  keeps the radius (`LinearIsometryEquiv.map_uniformBallMeasure`);
- For `r ≥ 0` the mean is `c` and the covariance form is `r²/(d + 2)` times the inner product
  (`TauCeti.Probability.integral_id_uniformBallMeasure`,
  `TauCeti.Probability.covarianceBilin_uniformBallMeasure`);
- For `d ≥ 1` and `r > 0` the normalized radius `‖X − c‖/r` has the Beta law `(d, 1)` and is
  independent of the direction, which is uniform on the sphere
  (`TauCeti.Probability.map_norm_sub_div_uniformBallMeasure`,
  `TauCeti.Probability.map_sphereDirection_prod_uniformBallMeasure`,
  `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_uniformBallMeasure`); so its cdf is `t^d`
  on `[0, 1]` and its quantile is `u^(1/d)` for `0 < u < 1`
  (`TauCeti.Probability.cdf_betaMeasure_one_right`,
  `TauCeti.Probability.quantile_betaMeasure_one_right`).

Prove that in dimension zero `TauCeti.Probability.uniformBallMeasure c r` is `δ_c` for every
`r ≥ 0`.

**Coordinates and projections.** For `E = EuclideanSpace ℝ ι`:

- if `d ≥ 2`, a sphere coordinate satisfies `(Xᵢ + 1)/2 ∼ Beta((d − 1)/2, (d − 1)/2)`, its cdf is
  `I_((x+1)/2)((d − 1)/2, (d − 1)/2)` and its quantile is `−1 + 2 B⁻¹_((d−1)/2,(d−1)/2)(u)`, with
  one-sided endpoint limits `−1` and `1`
  (`TauCeti.Probability.map_add_one_div_two_eval_uniformSphereMeasure`,
  `TauCeti.Probability.map_eval_uniformSphereMeasure`,
  `TauCeti.Probability.cdf_map_eval_uniformSphereMeasure`,
  `TauCeti.Probability.quantile_map_eval_uniformSphereMeasure`,
  `TauCeti.Probability.tendsto_quantile_map_eval_uniformSphereMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_eval_uniformSphereMeasure_nhdsLT_one`);
- if `d ≥ 1`, a coordinate of the centered unit ball satisfies
  `(Xᵢ + 1)/2 ∼ Beta((d + 1)/2, (d + 1)/2)`, with cdf and quantile in the same form
  (`TauCeti.Probability.map_add_one_div_two_eval_uniformBallMeasure`,
  `TauCeti.Probability.map_eval_uniformBallMeasure`,
  `TauCeti.Probability.cdf_map_eval_uniformBallMeasure`,
  `TauCeti.Probability.quantile_map_eval_uniformBallMeasure`);
- every projection follows by rotation and scaling: on the sphere, for `d ≥ 2`, `⟪v, X⟫` is
  `‖v‖(−1 + 2B)` with `B ∼ Beta((d − 1)/2, (d − 1)/2)`, with the corresponding quantile
  (`TauCeti.Probability.map_inner_uniformSphereMeasure`,
  `TauCeti.Probability.quantile_map_inner_uniformSphereMeasure`); on the ball of center `c` and
  radius `r ≥ 0`, `⟪v, X⟫` is `⟪v, c⟫ + r‖v‖(−1 + 2B)` with `B ∼ Beta((d + 1)/2, (d + 1)/2)`, with
  its cdf for `r > 0`, `v ≠ 0`, its quantile and endpoint limits
  (`TauCeti.Probability.map_inner_uniformBallMeasure`,
  `TauCeti.Probability.cdf_map_inner_uniformBallMeasure`,
  `TauCeti.Probability.quantile_map_inner_uniformBallMeasure`,
  `TauCeti.Probability.tendsto_quantile_map_inner_uniformBallMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_map_inner_uniformBallMeasure_nhdsLT_one`).

**The case `d = 2`: arcsine and semicircle laws.** Prove that for `E = EuclideanSpace ℝ (Fin 2)`: if
`X` is uniform on the unit circle, `(Xᵢ + 1)/2` has the arcsine law of §10.20,
`TauCeti.Probability.arcsineMeasure`, which is the Beta law `(1/2, 1/2)`
(`TauCeti.Probability.arcsineMeasure_eq_betaMeasure`); and if `X` is uniform on the unit disk, `Xᵢ`
has the unit semicircle law of §10.20, `TauCeti.Probability.semicircleMeasure`, the image of the
Beta law `(3/2, 3/2)` under `x ↦ −1 + 2x`
(`TauCeti.Probability.semicircleMeasure_eq_map_betaMeasure`). They are the cases `d = 2` of the
coordinate laws above.

*Needs:* Mathlib `MeasureTheory.Measure.toSphere`, `MeasureTheory.Measure.toSphere_apply_univ`,
`ProbabilityTheory.stdGaussian`, `ProbabilityTheory.betaMeasure`, `InnerProductSpace.volume_ball`,
`ProbabilityTheory.cond`, `Real.Gamma`; Tau Ceti `TauCeti.toSphere_volume_apply_univ`,
`TauCeti.sphereDirection`, `TauCeti.Probability.chiMeasure` (§10.4),
`TauCeti.Probability.rademacherMeasure` (§9.1), `TauCeti.regularizedIncompleteBeta` (§2.2),
`TauCeti.inverseRegularizedIncompleteBeta` (§8.4), `TauCeti.Probability.arcsineMeasure` and
`TauCeti.Probability.semicircleMeasure` (§10.20), `TauCeti.covMatrix` (§5.1); §1.7 (Beta), §1.10
(Gaussian), §7.2 (quantiles).

**Checks.**

- The surface mass is `2` in dimension one (two points), `2π` in dimension two and `4π` in dimension
  three; a normalization by the volume `π^(d/2)/Γ(d/2 + 1)` of the ball instead would give `2`, `π`
  and `4π/3`.
- In dimension three a sphere coordinate is uniform on `[−1, 1]` (the parameters are `(1, 1)`), with
  variance `1/3 = 1/d`; parameters `(d/2, d/2)` would give the semicircle law, of variance `1/4`.
- In dimension one the uniform sphere law is two-point, not uniform on `[−1, 1]`; the ball
  covariance `r²/(d + 2)` gives `r²/3`, the variance of the uniform law on `[−r, r]`, whereas `r²/d`
  would give `r²`.
- On the unit circle, `P((X₁ + 1)/2 ≤ 1/4) = P(cos θ ≤ −1/2) = 1/3`, and the arcsine cdf
  `(2/π) arcsin √x` at `1/4` is `1/3`.
- In the unit disk, `P(X₁ ≤ 1/2) = 2/3 + √3/(4π) ≈ 0.8045`, both from the area of the circular
  segment and from the semicircle cdf `1/2 + (x√(1 − x²) + arcsin x)/π`; the radius has median
  `1/√2 ≈ 0.707`, not `1/2`.

### 12.2 Von Mises–Fisher

Let `σ_d` be the uniform law `TauCeti.Probability.uniformSphereMeasure E`, `d ≥ 1`. The
natural-parameter von Mises–Fisher law for any `η : E` is
`TauCeti.Probability.vonMisesFisherNaturalMeasure η`, the exponential tilt
`σ_d.tilted (fun x => ⟪η, x⟫)` of §7.8 (`TauCeti.Probability.vonMisesFisherNaturalMeasure_def`)
(Mardia and Jupp 2000). The mean-direction and concentration form is
`TauCeti.Probability.vonMisesFisherMeasure m κ` for `m` on the sphere: the natural law at `η = κ m`
for `κ ≥ 0` and the zero measure for `κ < 0` (`TauCeti.Probability.vonMisesFisherMeasure_of_nonneg`,
`TauCeti.Probability.vonMisesFisherMeasure_of_neg`); in dimension zero the natural law is the zero
measure (`TauCeti.Probability.vonMisesFisherNaturalMeasure_of_subsingleton`). Both families are
measurable in their parameters (`TauCeti.Probability.measurable_vonMisesFisherNaturalMeasure`,
`TauCeti.Probability.measurable_vonMisesFisherMeasure`).

- **Density and normalizer.** `x ↦ exp⟪η, x⟫` is `σ_d`-integrable with positive integral `Z`
  (`TauCeti.Probability.integrable_exp_inner_uniformSphereMeasure`,
  `TauCeti.Probability.integral_exp_inner_uniformSphereMeasure_pos`), and the law has density
  `exp⟪η, x⟫/Z` relative to `σ_d`
  (`TauCeti.Probability.vonMisesFisherNaturalMeasure_eq_withDensity`,
  `TauCeti.Probability.rnDeriv_vonMisesFisherNaturalMeasure`). It is a probability measure for
  `d ≥ 1`, and the law of mean direction `m` and concentration `κ` is one exactly when `κ ≥ 0`
  (`TauCeti.Probability.isProbabilityMeasure_vonMisesFisherNaturalMeasure`,
  `TauCeti.Probability.isProbabilityMeasure_vonMisesFisherMeasure_iff`). At `η = 0` it is `σ_d`
  (`TauCeti.Probability.vonMisesFisherNaturalMeasure_zero`), so the law of concentration `0` is
  `σ_d` for every `m`. For `d ≥ 2` and `η ≠ 0`, with `κ = ‖η‖`, the integral against the
  unnormalized surface measure is

      Z_d(κ) = (2π)^(d/2) κ^(1 − d/2) I_(d/2 − 1)(κ)

  (`TauCeti.Probability.integral_exp_inner_toSphere_eq_besselI`, with
  `TauCeti.Probability.integral_exp_inner_uniformSphereMeasure_eq_besselI` for `σ_d`), whose route
  uses the Bessel series of §8.1 and the coordinate laws of §12.1; for `κ > 0` this gives the
  density `exp(κ⟪m, x⟫)/(Γ(d/2) (κ/2)^(1 − d/2) I_(d/2 − 1)(κ))` against `σ_d`
  (`TauCeti.Probability.vonMisesFisherMeasure_eq_withDensity_besselI`) (DLMF §10.25). At `κ = 0` the
  law is the uniform law and the normalizer is the surface area, not the value of the displayed
  quotient.
- **Dimension one.** If `d = 1`, `e` is a unit vector and `a = ⟪η, e⟫`, the law gives masses
  `e^a/(e^a + e^(−a))` and `e^(−a)/(e^a + e^(−a))` to `e` and `−e`; the projection `⟪e, X⟫` has mean
  `tanh a`, variance `1 − tanh² a`, mgf `cosh(a + t)/cosh a`, the two-point cdf, and the quantile
  `−1` up to the first cumulative mass and `1` above it
  (`TauCeti.Probability.vonMisesFisherNaturalMeasure_eq_of_finrank_eq_one`,
  `TauCeti.Probability.integral_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`,
  `TauCeti.Probability.variance_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`,
  `TauCeti.Probability.mgf_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`,
  `TauCeti.Probability.cdf_map_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`,
  `TauCeti.Probability.quantile_map_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`).
- **Mean.** For `d ≥ 2` and `κ > 0`, with `A_d(κ) = I_(d/2)(κ)/I_(d/2 − 1)(κ)`, the mean is
  `E[X] = A_d(κ) m` (`TauCeti.Probability.integral_coe_vonMisesFisherMeasure`,
  `TauCeti.Probability.integral_coe_vonMisesFisherNaturalMeasure`); at `κ = 0` it is zero
  (`TauCeti.Probability.integral_coe_vonMisesFisherMeasure_zero`) and the covariance is `I/d`, that
  of `σ_d` (§12.1).
- **Equivariance and transforms.** A linear isometry `f` carries the law with parameter `η` to the
  law with parameter `f η`, and the mean direction `m` to `f m`
  (`LinearIsometryEquiv.map_vonMisesFisherNaturalMeasure`,
  `LinearIsometryEquiv.map_vonMisesFisherMeasure`). For every direction `θ`, the projection `⟪θ, X⟫`
  has exponential-integrability set `ℝ` and mgf the normalizer ratio
  `∫ exp⟪η + tθ, x⟫ dσ_d / ∫ exp⟪η, x⟫ dσ_d`, with cgf the difference of logarithms
  (`TauCeti.Probability.integrableExpSet_inner_vonMisesFisherNaturalMeasure`,
  `TauCeti.Probability.mgf_inner_vonMisesFisherNaturalMeasure`,
  `TauCeti.Probability.cgf_inner_vonMisesFisherNaturalMeasure`); the zero vector parameter is
  covered, the normalizer against `σ_d` being one there.
- **Mean-direction projection.** For `d ≥ 2` and `κ ≥ 0`, `⟪m, X⟫` has density on `(−1, 1)`
  proportional to `e^(κy) (1 − y²)^((d − 3)/2)`, with the explicit constant of
  `TauCeti.Probability.vonMisesFisherProjectionPDFReal_of_mem` and zero outside
  (`TauCeti.Probability.map_inner_vonMisesFisherMeasure_eq_withDensity`,
  `TauCeti.Probability.rnDeriv_map_inner_vonMisesFisherMeasure`); its law is the tilt by `κy` of the
  image of `Beta((d − 1)/2, (d − 1)/2)` under `y ↦ 2y − 1`
  (`TauCeti.Probability.map_inner_vonMisesFisherMeasure`); its cdf is the integral of that density
  from `−1` (`TauCeti.Probability.cdf_map_inner_vonMisesFisherMeasure_eq_integral`), strictly
  increasing on `[−1, 1]` (`TauCeti.Probability.strictMonoOn_cdf_map_inner_vonMisesFisherMeasure`),
  and its quantile at `0 < u < 1` is the unique root in `(−1, 1)` of `cdf = u`
  (`TauCeti.Probability.quantile_map_inner_vonMisesFisherMeasure_eq_iff`).

Prove the second moment: for `d ≥ 2` and `κ > 0`,

    E[X Xᵀ] = (A_d(κ)/κ) I + (1 − d A_d(κ)/κ) m mᵀ,

and the covariance `E[X Xᵀ] − A_d(κ)² m mᵀ` by subtraction (Mardia and Jupp 2000; the route
differentiates the normalizer twice and uses the recurrence `I'_ν = I_(ν+1) + (ν/x) I_ν` of §8.1,
DLMF §10.29).

*Needs:* Mathlib `MeasureTheory.Measure.tilted`, `ProbabilityTheory.mgf`,
`ProbabilityTheory.betaMeasure`, `ProbabilityTheory.beta`; Tau Ceti `Real.besselI` (§8.1),
`TauCeti.Probability.uniformSphereMeasure` and the coordinate laws (§12.1); §7.8 (tilting), §7.2
(quantiles).

**Checks.**

- In dimension three `Z_3(κ) = (2π)^(3/2) κ^(−1/2) I_(1/2)(κ) = 4π sinh κ/κ`, which tends to the
  surface area `4π` as `κ → 0`; at `κ = 2` it is `≈ 22.788`.
- In dimension three `A_3(κ) = coth κ − 1/κ` (`≈ 0.5373` at `κ = 2`) and `E⟨m, X⟩² = 1 − 2A_3(κ)/κ`
  (`≈ 0.4627` at `κ = 2`), both agreeing with direct integration of the projection density
  `∝ e^(κy)` on `(−1, 1)`.
- The trace of the second-moment formula is `d A_d/κ + 1 − d A_d/κ = 1 = E‖X‖²`, and as `κ → 0`,
  `A_d(κ)/κ → 1/d`, so it tends to `I/d`; a formula with `A_d` in place of `A_d/κ` fails both.
- A density written against the unnormalized surface measure must divide by `Z_d(κ)`, against `σ_d`
  by `Z_d(κ)` over the surface area; mixing the two is off by the factor `2π^(d/2)/Γ(d/2)`.

### 12.3 Circle and von Mises

The circle is `AddCircle (2π)` with its Borel structure. Its Haar probability is Mathlib's
`AddCircle.haarAddCircle`, and volume is `2π` times it (`AddCircle.volume_eq_smul_haarAddCircle`);
prove that it equals `cond volume univ`, the normalized volume. The homeomorphism
`TauCeti.circleSphereHomeomorph`, `θ ↦ (cos θ, sin θ)` (`TauCeti.circleSphereHomeomorph_coe`),
carries `AddCircle.haarAddCircle` to the uniform law on the unit sphere of
`EuclideanSpace ℝ (Fin 2)` (`TauCeti.Probability.map_circleSphereHomeomorph_haarAddCircle`) (Fisher
1993; Mardia and Jupp 2000). The measurable angle representative is the chart
`AddCircle.equivIco (2π) (−π)` onto `[−π, π)`; it carries volume to Lebesgue measure on `[−π, π)`
(`AddCircle.map_coe_equivIco_volume`) and a Haar density `f` to the density `f/(2π)` against `dθ`
(`AddCircle.map_coe_equivIco_withDensity_haarAddCircle`). Every circle cdf and quantile of this
layer is that of the image of the law under this chart. Densities and circle characters are
functions on the circle, so they do not depend on the real representatives of the angle and the
location; their values at representatives are the displayed formulas
(`TauCeti.Probability.vonMisesPDFReal_coe_coe`, `fourier`).

The von Mises law with location `m` on the circle and concentration `κ` is
`TauCeti.Probability.vonMisesMeasure m κ`: for `κ ≥ 0` it has Haar density `e^(κ cos(θ − m))/I₀(κ)`
(`TauCeti.Probability.vonMisesPDFReal_def`, `TauCeti.Probability.vonMisesMeasure_of_nonneg`,
`TauCeti.Probability.rnDeriv_vonMisesMeasure`), equivalently it is the tilt of
`AddCircle.haarAddCircle` by `κ cos(θ − m)` (`TauCeti.Probability.vonMisesMeasure_eq_tilted`), and
for `κ < 0` it is the zero measure (`TauCeti.Probability.vonMisesMeasure_of_neg`). It is a
probability measure exactly when `κ ≥ 0`
(`TauCeti.Probability.isProbabilityMeasure_vonMisesMeasure_iff`), with full support for `κ ≥ 0`
(`TauCeti.Probability.support_vonMisesMeasure`), and is measurable in `(m, κ)`
(`TauCeti.Probability.measurable_vonMisesMeasure`). For `κ ≥ 0`:

- rotation by `a` moves the location to `m + a`
  (`TauCeti.Probability.map_add_right_vonMisesMeasure`), and the image under
  `TauCeti.circleSphereHomeomorph` is the two-dimensional von Mises–Fisher law with mean direction
  the image of `m` (`TauCeti.Probability.map_circleSphereHomeomorph_vonMisesMeasure`,
  `TauCeti.Probability.map_circleSphereHomeomorph_symm_vonMisesFisherMeasure`);
- the integer Fourier moments are `E[e^(inθ)] = e^(inm) I_|n|(κ)/I₀(κ)`
  (`TauCeti.Probability.integral_fourier_vonMisesMeasure`) (DLMF §10.32); the first trigonometric
  moment is `e^(im) I₁(κ)/I₀(κ)`, its modulus is `I₁(κ)/I₀(κ)`
  (`TauCeti.Probability.norm_integral_fourier_one_vonMisesMeasure`), and the circular variance is
  `1 − I₁(κ)/I₀(κ)`; the location is a direction on the circle, not an ordinary expectation of an
  angle representative;
- at `κ = 0` the law is `AddCircle.haarAddCircle`
  (`TauCeti.Probability.vonMisesMeasure_zero_concentration`);
- in the angle chart, the cdf at `x ∈ [−π, π]` is `(1/(2π)) ∫_(−π)^x e^(κ cos(t − m))/I₀(κ) dt`,
  strictly increasing there, and the quantile at `0 < u < 1` is the unique root in `(−π, π)` of
  `cdf = u` (`TauCeti.Probability.vonMisesAngleMeasure_def`,
  `TauCeti.Probability.cdf_vonMisesAngleMeasure_eq_integral`,
  `TauCeti.Probability.strictMonoOn_cdf_vonMisesAngleMeasure`,
  `TauCeti.Probability.quantile_vonMisesAngleMeasure_eq_iff`).

*Needs:* Mathlib `AddCircle.haarAddCircle`, `AddCircle.volume_eq_smul_haarAddCircle`,
`AddCircle.equivIco`, `fourier`, `ProbabilityTheory.cond`, `MeasureTheory.Measure.tilted`; Tau Ceti
`Real.besselI` (§8.1), `TauCeti.circleSphereHomeomorph`, `TauCeti.Probability.uniformSphereMeasure`
(§12.1), `TauCeti.Probability.vonMisesFisherMeasure` (§12.2); §7.2, §7.8.

**Checks.**

- The image of the Haar probability under the angle chart is the interval uniform law of §0.3 with
  endpoints `−π` and `π`, as a measure on `ℝ`, although the chart takes values in `[−π, π)` and the
  uniform law is defined through `(−π, π]`: the endpoints are null. The image of volume is Lebesgue
  measure on `[−π, π)`, of mass `2π`, not a probability law.
- `I₀(κ) = (1/(2π)) ∫_(−π)^π e^(κ cos θ) dθ`, so the von Mises density integrates to one against the
  Haar probability; against `dθ` it would need the normalizer `2π I₀(κ)`. At `κ = 1`,
  `I₀(1) ≈ 1.2661`, `I₁(1) ≈ 0.5652`, the mean resultant length is `≈ 0.4464`, the circular variance
  `≈ 0.5536`, and the Haar density at the mode is `e/I₀(1) ≈ 2.147`.
- For `m = π` the angle-chart law has density `∝ e^(−κ cos t)` on `[−π, π)`, symmetric about `0`, so
  the ordinary mean of the representative is `0` while the mean direction is `π`.

### 12.4 Wrapped normal

The wrapped normal law with location `m` on the circle and variance `v : ℝ≥0` is
`TauCeti.Probability.wrappedNormalMeasure m v`, the translate by `m` of the image of `N(0, v)` under
the quotient map `ℝ → AddCircle (2π)` (`TauCeti.Probability.wrappedNormalMeasure_def`); for a real
location `a` it is the image of `N(a, v)` (`TauCeti.Probability.wrappedNormalMeasure_coe`). It is a
probability measure (`TauCeti.Probability.isProbabilityMeasure_wrappedNormalMeasure`), `v = 0` gives
`δ_m` (`TauCeti.Probability.wrappedNormalMeasure_zero_var`), rotation moves the location
(`TauCeti.Probability.map_add_right_wrappedNormalMeasure`), and the family is measurable in `(m, v)`
(`TauCeti.Probability.measurable_wrappedNormalMeasure`) (Mardia and Jupp 2000). For `v > 0`:

- **Density.** The law has the positive Haar density `TauCeti.Probability.wrappedNormalPDFReal m v`
  (`TauCeti.Probability.wrappedNormalMeasure_eq_withDensity`,
  `TauCeti.Probability.wrappedNormalPDFReal_pos`,
  `TauCeti.Probability.integral_wrappedNormalPDFReal`,
  `TauCeti.Probability.rnDeriv_wrappedNormalMeasure`,
  `TauCeti.Probability.hasPDF_of_hasLaw_wrappedNormalMeasure`), defined on the circle as `2π` times
  the periodization of the Gaussian density (`TauCeti.Probability.wrappedNormalPDFReal_def`). At
  real representatives the density against `dθ`, which is the Haar density divided by `2π`, has the
  two equivalent series

      ∑_(k ∈ ℤ) exp(−(θ − m + 2πk)²/(2v))/√(2πv)
        = (1/(2π)) (1 + 2 ∑_(n ≥ 1) e^(−n²v/2) cos(n(θ − m)))

  (`TauCeti.Probability.wrappedNormalPDFReal_coe`,
  `TauCeti.Probability.hasSum_wrappedNormalPDFReal_coe`), the cosine series converging uniformly in
  `θ` (`TauCeti.Probability.hasSumUniformly_wrappedNormalPDFReal_coe`); the periodized sum is the
  Gaussian lattice sum of §8.3
  (`TauCeti.Probability.wrappedNormalPDFReal_coe_eq_gaussianLatticeSum`). Prove that the
  periodization series converges uniformly in `θ` as well, so that both series can be integrated
  termwise.
- **Fourier moments.** `E[e^(inθ)] = e^(inm − n²v/2)` for every `v`
  (`TauCeti.Probability.integral_fourier_wrappedNormalMeasure`); the first trigonometric moment has
  modulus `e^(−v/2)` (`TauCeti.Probability.norm_integral_fourier_one_wrappedNormalMeasure`), so the
  circular variance is `1 − e^(−v/2)`.
- **Convolution.** The convolution of the laws `(m₁, v₁)` and `(m₂, v₂)` is the law
  `(m₁ + m₂, v₁ + v₂)`, and the sum of independent wrapped normal variables has that law
  (`TauCeti.Probability.wrappedNormalMeasure_conv_wrappedNormalMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_add_wrappedNormalMeasure`).
- **Limits.** As `v ↓ 0` the law converges weakly to `δ_m`, and as `v → ∞` to
  `AddCircle.haarAddCircle` (`TauCeti.Probability.tendsto_wrappedNormalMeasure_nhds_zero_dirac`,
  `AddCircle.tendsto_wrappedNormalMeasure_atTop_haar`).
- **Chart cdf and quantile.** In the angle chart, the cdf at `x ∈ [−π, π]` integrates the periodized
  density from `−π`, equivalently it is the sum over `k ∈ ℤ` of the Gaussian probabilities of the
  intervals `(−π + 2πk, x + 2πk]` for a real location
  (`TauCeti.Probability.cdf_wrappedNormalAngleMeasure_eq_integral`,
  `TauCeti.Probability.cdf_wrappedNormalAngleMeasure_eq_tsum`); for `v > 0` it is strictly
  increasing on `[−π, π]` and the quantile at `0 < u < 1` is the unique root in `(−π, π)` of
  `cdf = u` (`TauCeti.Probability.strictMonoOn_cdf_wrappedNormalAngleMeasure`,
  `TauCeti.Probability.quantile_wrappedNormalAngleMeasure_eq_iff`). At `v = 0` the chart law is the
  Dirac mass at the chosen representative of `m`
  (`TauCeti.Probability.wrappedNormalAngleMeasure_zero_var`), whose quantile is that representative
  (`MeasureTheory.Measure.quantile_dirac`, §0.5).

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal`,
`AddCircle.haarAddCircle`, `fourier`, `MeasureTheory.Measure.conv`; Tau Ceti
`Real.gaussianLatticeSum` (§8.3), the angle chart of §12.3; §0.5, §1.10, §7.2.

**Checks.**

- For `v = 1`, `|E[e^(iθ)]| = e^(−1/2) ≈ 0.6065`; a computation with the `2π`-normalized kernel
  `e^(2πinθ)` would give `e^(−2π² v) ≈ 2.7 · 10⁻⁹`. The coefficients use the characteristic
  convention of the Conventions, with no extra `2π`.
- For `v = 2`, the Haar density at `θ = m` is `1 + 2 ∑ e^(−n²) ≈ 1.772637` from the cosine series
  and `√π ∑_k e^(−π²k²) ≈ 1.772637` from the periodization; dropping the factor `2π` between the two
  densities would give `≈ 0.2821` for the second.
- At `v = 0` the law is `δ_m` and has no Haar density; the formula of the density gives the zero
  function there, which is not a density of `δ_m`.

### 12.5 Wrapped Cauchy

The wrapped Cauchy law with location `m` on the circle and scale `γ : ℝ≥0` is
`TauCeti.Probability.wrappedCauchyMeasure m γ`, the translate by `m` of the image of the Cauchy law
`(0, γ)` of §1.8 under the quotient map (`TauCeti.Probability.wrappedCauchyMeasure_def`); for a real
location `a` it is the image of the Cauchy law `(a, γ)`
(`TauCeti.Probability.wrappedCauchyMeasure_coe`) (SciPy wrapcauchy documentation). It is a
probability measure (`TauCeti.Probability.isProbabilityMeasure_wrappedCauchyMeasure`), zero scale
gives `δ_m` (`TauCeti.Probability.wrappedCauchyMeasure_zero_scale`), rotation moves the location
(`TauCeti.Probability.map_add_right_wrappedCauchyMeasure`), and the family is measurable in `(m, γ)`
(`TauCeti.Probability.measurable_wrappedCauchyMeasure`). For `γ > 0` and `ρ = e^(−γ)`:

- **Density.** The law has the positive Haar density `(1 − ρ²)/(1 + ρ² − 2ρ cos(θ − m))`, which
  integrates to one against `AddCircle.haarAddCircle`
  (`TauCeti.Probability.wrappedCauchyPDFReal_apply`,
  `TauCeti.Probability.wrappedCauchyMeasure_eq_withDensity`,
  `TauCeti.Probability.wrappedCauchyPDFReal_pos`,
  `TauCeti.Probability.integral_wrappedCauchyPDFReal`,
  `TauCeti.Probability.rnDeriv_wrappedCauchyMeasure`,
  `TauCeti.Probability.hasPDF_of_hasLaw_wrappedCauchyMeasure`); it is a function on the circle,
  hence independent of representatives.
- **Fourier moments.** `E[e^(inθ)] = e^(inm − γ|n|)` for every `γ`
  (`TauCeti.Probability.integral_fourier_wrappedCauchyMeasure`), the first trigonometric moment has
  modulus `e^(−γ)` (`TauCeti.Probability.norm_integral_fourier_one_wrappedCauchyMeasure`), and the
  circular variance is `1 − e^(−γ)`.
- **Convolution.** The convolution of the laws `(m₁, γ₁)` and `(m₂, γ₂)` is the law
  `(m₁ + m₂, γ₁ + γ₂)`, also for independent sums
  (`TauCeti.Probability.wrappedCauchyMeasure_conv_wrappedCauchyMeasure`,
  `ProbabilityTheory.IndepFun.hasLaw_add_wrappedCauchyMeasure`).
- **Limits.** As `γ ↓ 0` the law converges weakly to `δ_m`, and as `γ → ∞` to
  `AddCircle.haarAddCircle` (`TauCeti.Probability.tendsto_wrappedCauchyMeasure_nhds_zero_dirac`,
  `AddCircle.tendsto_wrappedCauchyMeasure_atTop_haar`). The case `ρ = 0` is the Haar law, which is
  this limit and not the law of any finite scale.
- **Chart cdf and quantile.** For `γ > 0`, the chart cdf at `x ∈ [−π, π]` is `(1/(2π)) ∫_(−π)^x` of
  the Haar density, strictly increasing there, and the quantile at `0 < u < 1` is its unique root in
  `(−π, π)` (`TauCeti.Probability.cdf_wrappedCauchyAngleMeasure_eq_integral`,
  `TauCeti.Probability.strictMonoOn_cdf_wrappedCauchyAngleMeasure`,
  `TauCeti.Probability.quantile_wrappedCauchyAngleMeasure_eq_iff`); at `γ = 0` the chart law is the
  Dirac mass at the chosen representative of `m`
  (`TauCeti.Probability.wrappedCauchyAngleMeasure_zero_scale`), with that representative as quantile
  (`MeasureTheory.Measure.quantile_dirac`).

Prove the Fourier series of the density: for `γ > 0` the series `1 + 2 ∑_(n ≥ 1) ρⁿ cos(n(θ − m))`
converges absolutely and uniformly in `θ` to `(1 − ρ²)/(1 + ρ² − 2ρ cos(θ − m))`.

*Needs:* Mathlib `ProbabilityTheory.cauchyMeasure`, `AddCircle.haarAddCircle`, `fourier`,
`MeasureTheory.Measure.conv`; Tau Ceti the angle chart of §12.3; §0.5, §1.8, §7.2.

**Checks.**

- For `γ = log 2`, so `ρ = 1/2`, the Haar density is `3` at `θ = m` and `1/3` at `θ = m + π`, and
  the Fourier series gives `1 + 2 ∑ 2^(−n) = 3` and `1 + 2 ∑ (−1/2)ⁿ = 1/3`; the circular variance
  is `1/2`.
- For every finite `γ` the density at `θ = m` is `(1 + ρ)/(1 − ρ) > 1`, so no finite scale gives the
  Haar law; a parameterization by `ρ ∈ [0, 1)` with `ρ = 0` admitted would include it.
- Zero scale gives `δ_m`, not the Haar law, and it has no Haar density: at `ρ = 1` the density
  formula vanishes away from `θ = m`.

### Examples

- In dimension three a sphere coordinate is uniform on `[−1, 1]` and has variance `1/3`; the surface
  area is `4π`.
- For the unit disk, the radius has cdf `t²` and median `1/√2`, and a coordinate has the semicircle
  law with `P(X₁ ≤ 1/2) ≈ 0.8045`.
- The von Mises–Fisher law in dimension three with `κ = 2` has normalizer `4π sinh 2/2 ≈ 22.788` and
  mean `(coth 2 − 1/2) m ≈ 0.5373 m`.
- The von Mises law with `κ = 0` is the Haar law; with `κ = 1` its circular variance is
  `1 − I₁(1)/I₀(1) ≈ 0.5536`.
- The wrapped normal law with `v = 2 log 2` and the wrapped Cauchy law with `γ = log 2` both have
  first trigonometric moment of modulus `1/2`, hence circular variance `1/2`; the convolution of two
  wrapped Cauchy laws of scale `log 2` is wrapped Cauchy of scale `log 4`, with circular variance
  `3/4`.

### Dependencies

Layer 0 (§0.3 interval uniform, §0.5 Dirac package), Layer 1 (§1.7 Beta, §1.8 Cauchy, §1.10 real
Gaussian), Layer 2 (§2.2 incomplete Beta), Layer 5 (§5.1 covariance matrices), Layer 7 (§7.2
quantiles, §7.8 exponential tilting), Layer 8 (§8.1 modified Bessel I, §8.3 Gaussian lattice sums,
§8.4 inverse functions), Layer 9 (§9.1 Rademacher), Layer 10 (§10.4 chi, §10.20 arcsine and
semicircle). From Mathlib: the surface measure on the sphere and the volume of balls, the standard
Gaussian, the Beta and Cauchy laws, tilting, the Haar measure and Fourier characters of `AddCircle`,
and convolution of measures. From Tau Ceti: the families in
`Probability/Distributions/Uniform/Sphere/`, `Probability/Distributions/Uniform/Ball/`,
`Probability/Distributions/VonMisesFisher/`, `Probability/Distributions/VonMises/`,
`Probability/Distributions/WrappedNormal/` and `Probability/Distributions/WrappedCauchy/`, the
sphere direction map, the circle–sphere homeomorphism, the surface area of the sphere, and the image
of the circle measures under the angle chart.

## Layer 13: quantile formulas and coverage of all families

This layer specializes the quantile foundations of §7.2 and the inverse special functions of §8.4 to
the families of the roadmap. It adds no separate quantile construction, and it supplements the
moments, transforms and cdfs of the earlier layers without replacing them. The quantile is the lower
quantile `MeasureTheory.Measure.quantile`, `Q_μ(u) = inf {x : u ≤ F_μ(x)}` (§7.2). Every
finite-valued formula below assumes valid parameters and `0 < u < 1`, and includes the degenerate
boundaries named with it. Each also comes with the one-sided endpoint limits of §7.2: as `u → 0⁺`
and `u → 1⁻` the quantile of a real probability law tends, in `EReal`, to the infimum and to the
supremum of its topological support (`MeasureTheory.Measure.tendsto_quantile_nhdsGT_zero`,
`MeasureTheory.Measure.tendsto_quantile_nhdsLT_one`). Write `G_a⁻¹(u)` for the inverse regularized
Gamma function `TauCeti.inverseRegularizedGamma a u`, `B_(a,b)⁻¹(u)` for the inverse regularized
incomplete Beta function `TauCeti.inverseRegularizedIncompleteBeta a b u`, and
`z(u) = √2 · erf⁻¹(2u − 1)` for the standard Gaussian quantile, with the inverse error function
`Real.erfInv` (§8.4).

### 13.1 Quantiles of the real laws

For the real laws of Layers 1 and 3 the quantile has the closed form of the table, for every `u`
with `0 < u < 1` (Johnson, Kotz and Balakrishnan, vols. 1 and 2):

| Law | Parameters | `Q(u)` | Theorem |
| --- | --- | --- | --- |
| Gaussian `N(m, v)` | `m ∈ ℝ`, `v ≥ 0`, including `v = 0` | `m + √v · z(u) = m + √(2v) · erf⁻¹(2u − 1)` | `TauCeti.Probability.quantile_gaussianReal`, `TauCeti.Probability.quantile_gaussianReal_eq_add_mul` |
| Gamma, shape `a`, rate `r` | `a, r > 0` | `G_a⁻¹(u) / r` | `TauCeti.Probability.quantile_gammaMeasure` |
| Beta `(a, b)` | `a, b > 0` | `B_(a,b)⁻¹(u)` | `TauCeti.Probability.quantile_betaMeasure` |
| Exponential, rate `r` | `r > 0` | `−log(1 − u) / r` | `TauCeti.Probability.quantile_expMeasure` |
| Cauchy `(m, γ)` | `γ ≥ 0`, including `γ = 0` | `m + γ · tan(π(u − 1/2))` | `TauCeti.Probability.quantile_cauchyMeasure` |
| Pareto, threshold `t`, shape `r` | `t, r > 0` | `t · (1 − u)^(−1/r)` | `TauCeti.Probability.quantile_paretoMeasure` |
| Interval uniform `(a, b)` | `a < b` | `a + (b − a)u` | `TauCeti.Probability.quantile_uniformMeasure` |
| Laplace `(m, b)` | `b > 0` | `m + b · log(2u)` for `u ≤ 1/2`, `m − b · log(2(1 − u))` otherwise | `TauCeti.Probability.quantile_laplaceMeasure` |
| Log-normal `(m, v)` | `v ≥ 0`, including `v = 0` | `exp(m + √v · z(u))` | `TauCeti.Probability.quantile_logNormalMeasure` |
| Weibull, shape `k`, scale `a` | `k, a > 0` | `a · (−log(1 − u))^(1/k)` | `TauCeti.Probability.quantile_weibullMeasure` |
| Chi-squared, `k` degrees | `k ≥ 0` | `2 G_(k/2)⁻¹(u)` for `k > 0`, zero for `k = 0` | `TauCeti.Probability.quantile_chiSquaredMeasure` |
| Inverse-gamma, shape `a`, scale `r` | `a, r > 0` | `r / G_a⁻¹(1 − u)` | `TauCeti.Probability.quantile_inverseGammaMeasure` |
| Fisher F `(m, n)` | `m, n > 0` | `(n/m) · b/(1 − b)`, `b = B_(m/2,n/2)⁻¹(u)` | `TauCeti.Probability.quantile_fisherSnedecorMeasure` |

The chi-squared formula covers `k = 0` because the inverse regularized Gamma function is zero for a
nonpositive shape (`TauCeti.inverseRegularizedGamma_eq_zero_of_nonpos_left`), and chi-squared with
zero degrees is the Dirac law at zero (§3.5).

For Student's t with `ν > 0` (`TauCeti.Probability.quantile_studentTMeasure`), the quantile below
`1/2` is `−√(ν(1/b − 1))` with `b = B_(ν/2,1/2)⁻¹(2u)`, and above `1/2` it is `√(ν(1/b − 1))` with
`b = B_(ν/2,1/2)⁻¹(2(1 − u))`. The median quantile is zero
(`TauCeti.Probability.quantile_studentTMeasure_half`).

The one-sided endpoint limits hold in explicit form for each law of the table:

-  to `−∞` and `+∞` for the Gaussian and the Cauchy law with positive scale, and to `m` at both ends
  for zero scale (`TauCeti.Probability.tendsto_quantile_gaussianReal_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_gaussianReal_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_cauchyMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_cauchyMeasure_nhdsLT_one`); to `−∞` and `+∞` for the Laplace
  law and for Student's t (`TauCeti.Probability.tendsto_quantile_laplaceMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_laplaceMeasure_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_studentTMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_studentTMeasure_nhdsLT_one`);
-  to `0` and `+∞` for the Gamma, exponential, Weibull, inverse-gamma and Fisher F laws
  (`TauCeti.Probability.tendsto_quantile_gammaMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_gammaMeasure_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_expMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_expMeasure_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_weibullMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_weibullMeasure_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_inverseGammaMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_inverseGammaMeasure_nhdsLT_one`,
  `TauCeti.Probability.tendsto_quantile_fisherSnedecorMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_fisherSnedecorMeasure_nhdsLT_one`); for chi-squared with
  `k > 0`, and to `0` at both ends for `k = 0`
  (`TauCeti.Probability.tendsto_quantile_chiSquaredMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_chiSquaredMeasure_nhdsLT_one`); for the log-normal law with
  `v > 0`, and to `e^m` at both ends for `v = 0`
  (`TauCeti.Probability.tendsto_quantile_logNormalMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_logNormalMeasure_nhdsLT_one`);
-  to `0` and `1` for the Beta law (`TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsLT_one`), to `a` and `b` for the interval
  uniform law (`TauCeti.Probability.tendsto_quantile_uniformMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_uniformMeasure_nhdsLT_one`), and to `t` and `+∞` for the
  Pareto law (`TauCeti.Probability.tendsto_quantile_paretoMeasure_nhdsGT_zero`,
  `TauCeti.Probability.tendsto_quantile_paretoMeasure_nhdsLT_one`).

For every real probability law, `Q(1/2)` is a median, atoms included: `F(Q(1/2)) ≥ 1/2`
(`MeasureTheory.Measure.le_cdf_quantile`) and the mass strictly below `Q(1/2)` is at most `1/2`
(`MeasureTheory.Measure.measureReal_Iio_quantile_le`), so `[Q(1/2), ∞)` has mass at least `1/2`. No
uniqueness of the median is claimed.

*Needs:* §7.2 (Tau Ceti `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.quantile_le_iff`);
§8.4 (Tau Ceti `TauCeti.inverseRegularizedGamma`, `TauCeti.inverseRegularizedIncompleteBeta`,
`Real.erfInv`); the families and cdfs of Layers 1–3 (§2.4).

**Checks.**

-  For Student's t with `ν = 1` and `u = 0.9`, `B_(1/2,1/2)⁻¹(0.2) = sin²(0.1π) ≈ 0.0955`, because
  `I_x(1/2, 1/2) = (2/π) arcsin √x`, so the quantile is `√(1/b − 1) ≈ 3.0777 = tan(0.4π)`, the
  Cauchy quantile. Without the doubled level, `b = B_(1/2,1/2)⁻¹(0.1) = sin²(0.05π) ≈ 0.0245` would
  give `≈ 6.31`.
-  The inverse-gamma law with `a = r = 1` is the law of `1/Y` with `Y` exponential of rate one, with
  cdf `e^(−1/x)`, so `Q(u) = −1/log u`. The table gives `1/G_1⁻¹(1 − u) = 1/(−log u)`. The variant
  `r/G_a⁻¹(u)` would return the `(1 − u)`-quantile instead.
-  The Laplace law with `m = 0`, `b = 1` has `Q(1/4) = log(1/2) ≈ −0.693` and
  `Q(3/4) = −log(1/2) ≈ 0.693`, symmetric about the median. Omitting the factor `2` inside the
  logarithms would give `Q(1/2) = log(1/2) ≠ 0`.
-  The Cauchy quantile at `u = 3/4` is `m + γ`. The variant `m + γ tan(πu)` gives `m − γ`.
-  Chi-squared with `k = 2` gives `2 G_1⁻¹(u) = −2 log(1 − u)`, the exponential quantile with rate
  `1/2`, as `χ²_2` is that exponential law. Gaussian with `v = 0` gives the constant `m`.

### 13.2 Discrete casts

The quantiles of the real casts of the count laws are explicit least crossings of their cumulative
masses, not a restatement of the real infimum (Johnson, Kemp and Kotz, chs. 3–6). For every
probability law on `ℕ` the cast quantile at `u` is the least `k` with `u ≤ P(X ≤ k)`
(`MeasureTheory.Measure.quantile_map_natCast_eq_iff`), and on `ℤ` the least such integer
(`MeasureTheory.Measure.quantile_map_intCast_eq_iff`) (§7.2). The families give:

-  **Bernoulli.** The law with mass `p` at `1` and `1 − p` at `0` has quantile `0` for `u ≤ 1 − p`
  and `1` otherwise, including `p = 0` and `p = 1`
  (`TauCeti.Probability.quantile_bernoulliMeasure`).
-  **Geometric.** For the law with masses `(1 − p)^k p` on `ℕ` and `0 < p < 1`, the cast quantile is
  `⌈log(1 − u)/log(1 − p)⌉ − 1` (`TauCeti.Probability.quantile_map_cast_geometricMeasure`; the
  ceiling is at least one, so the natural subtraction there is exact). Both `p = 0` and `p = 1` give
  zero (`TauCeti.Probability.quantile_map_cast_geometricMeasure_zero`,
  `TauCeti.Probability.quantile_map_cast_geometricMeasure_one`).
-  **Poisson.** For rate `r ≥ 0` the cast quantile is the least `k ∈ ℕ` with
  `u ≤ ∑_(j ≤ k) e^(−r) r^j / j!` (`TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_iff`).
  Equivalently, it is the least `k` with `G_(k+1)(r) ≤ 1 − u`, Layer 2's regularized-Gamma criterion
  (`TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_iff_regularizedGamma`, §2.4). It is zero
  exactly when `u ≤ e^(−r)` (`TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_zero_iff`),
  and rate zero gives zero (`TauCeti.Probability.quantile_map_cast_poissonMeasure_zero`).
-  **Binomial.** The cast quantile of `Bin(n, p)` is the least `j` with `u ≤ 1` if `n ≤ j`, and
  `u ≤ I_(1−p)(n − j, j + 1)` otherwise (`TauCeti.Probability.quantile_map_cast_binomial_eq_iff`).
  It is zero exactly when `u ≤ (1 − p)^n`
  (`TauCeti.Probability.quantile_map_cast_binomial_eq_zero_iff`), and `n` when `u > 1 − p^n`
  (`TauCeti.Probability.quantile_map_cast_binomial_eq_self`). It is zero for `n = 0` and for
  `p = 0`, and `n` for `p = 1` (`TauCeti.Probability.quantile_map_cast_binomial_zero`,
  `TauCeti.Probability.quantile_map_cast_binomial_prob_zero`,
  `TauCeti.Probability.quantile_map_cast_binomial_prob_one`).
-  **Negative binomial.** For shape `r > 0` and `0 < p ≤ 1`, the cast quantile is the least `j` with
  `u ≤ I_p(r, j + 1)` (`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_eq_iff`).
  Shape zero and `p = 1` give zero
  (`TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_zero`,
  `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_one`).
-  **Hypergeometric.** For `K ≤ N` and `n ≤ N` the cast quantile is the least `i` with
  `u ≤ ∑_(j ≤ min(i, n)) C(K, j) C(N − K, n − j) / C(N, n)`
  (`TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_iff`). Near the ends of the
  support it equals `n − (N − K)` (in `ℕ`) or `min(K, n)`
  (`TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_lower`,
  `TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_upper`).

The endpoint limits are the ends of the supports:
`TauCeti.Probability.tendsto_quantile_bernoulliMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_bernoulliMeasure_nhdsLT_one`,
`TauCeti.Probability.tendsto_quantile_map_cast_geometricMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_map_cast_geometricMeasure_nhdsLT_one`,
`TauCeti.Probability.tendsto_quantile_map_cast_poissonMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_map_cast_poissonMeasure_nhdsLT_one`,
`TauCeti.Probability.tendsto_quantile_map_cast_binomial_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_map_cast_binomial_nhdsLT_one`,
`TauCeti.Probability.tendsto_quantile_map_cast_negativeBinomialMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_map_cast_negativeBinomialMeasure_nhdsLT_one`,
`TauCeti.Probability.tendsto_quantile_map_cast_hypergeometricMeasure_nhdsGT_zero` and
`TauCeti.Probability.tendsto_quantile_map_cast_hypergeometricMeasure_nhdsLT_one`.

*Needs:* §7.2 (Tau Ceti `MeasureTheory.Measure.quantile_map_natCast_eq_iff`); the binomial,
geometric and Poisson laws of Layer 1 (§1.2–§1.4); Layer 2's regularized Gamma and incomplete Beta
tails (§2.4); §3.9, §3.10.

**Checks.**

-  Geometric with `p = 1/2` has `P(X ≤ 0) = 1/2` and `P(X ≤ 1) = 3/4`. At `u = 0.6` the formula
  gives `⌈log 0.4 / log 0.5⌉ − 1 = ⌈1.32⌉ − 1 = 1`, and at `u = 1/2` it gives `⌈1⌉ − 1 = 0`. The
  variant with the floor would give `0` at `u = 0.6`, below the true crossing.
-  Poisson with rate one has cumulative masses `e^(−1) ≈ 0.368` and `2e^(−1) ≈ 0.736`, so
  `Q(1/2) = 1`.
-  The Bernoulli law with `p = 1/2` has `Q(1/2) = 0`. Both `0` and `1` are medians, since
  `P(X ≤ 0) = P(X ≥ 1) = 1/2`, which is why no median uniqueness is claimed.
-  The binomial formula with `n = 1` reproduces the Bernoulli quantile, since
  `I_(1−p)(1, 1) = 1 − p`. The crossing is `0` exactly when `u ≤ 1 − p`.

### 13.3 Other scalar laws

The quantiles of the families of Layers 9 and 10 are those stated in their own sections, as explicit
formulas or as root and crossing characterizations. The quantiles of the stable laws are stated in
§15.4. Mixtures and compound Poisson laws are handled through their explicit cdfs and the quantile
adjunction `Q(u) ≤ x ⟺ u ≤ F(x)` (`MeasureTheory.Measure.quantile_le_iff`; Billingsley), with no
uniqueness or strict monotonicity claimed where it fails:

-  **General mixtures.** For a probability measure `ρ` and an a.e.-measurable family `K` of laws
  that are probability measures `ρ`-a.e., the cdf of `ρ.bind K` is `x ↦ ∫ F_(K a)(x) dρ(a)`
  (`MeasureTheory.Measure.cdf_bind`, §7.4). Hence `Q(u) ≤ x` exactly when `u` is at most that
  integral.
-  **Finite Gaussian mixtures.** `Q(u) ≤ x` exactly when `u ≤ ∑ p_i Φ((x − m_i)/√v_i)`, with the
  zero-variance components as Dirac cdfs
  (`TauCeti.Probability.quantile_gaussianMixtureMeasure_le_iff`).
-  **Atom mixtures.** For `w δ_c + (1 − w)μ` with `μ` carried by `[c, ∞)`, the quantile is `c` up to
  level `w + (1 − w)μ{c}` and `Q_μ((u − w)/(1 − w))` above it
  (`MeasureTheory.Measure.quantile_atomMixture`, §7.4).
-  **Mixed Poisson.** The cast quantile is the least `k` with
  `u ≤ ∑_(j ≤ k) ∫ e^(−λ) λ^j / j! dρ(λ)`
  (`MeasureTheory.Measure.quantile_map_cast_mixedPoissonMeasure_eq_iff`, §7.6).
-  **Compound Poisson.** For rate `r` and a real jump law `μ`, `Q(u) ≤ x` exactly when
  `u ≤ e^(−r) 1_(x ≥ 0) + ∑_(n ≥ 0) e^(−r) r^(n+1)/(n+1)! · F_(μ^(∗(n+1)))(x)`, the empty sum giving
  the atom at zero (`TauCeti.Probability.quantile_compoundPoissonMeasure_le_iff`, §7.5). For jumps
  on `ℕ` or `ℤ` the cast quantile is the least crossing of the Poisson-weighted cumulative series
  (`TauCeti.Probability.quantile_map_natCast_compoundPoissonMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_intCast_compoundPoissonMeasure_eq_iff`).

Interval truncations use the probability rescaling of §7.3. If `L < R` are the masses excluded below
and retained up to the upper end, the conditioned quantile is `Q_μ(L + u(R − L))`, with the endpoint
atoms counted according to the four endpoint conventions (`MeasureTheory.Measure.quantile_cond_Ioc`,
`MeasureTheory.Measure.quantile_cond_Icc`, `MeasureTheory.Measure.quantile_cond_Ioo`,
`MeasureTheory.Measure.quantile_cond_Ico`). Infinite bounds are the case of a difference of
measurable lower sets (`MeasureTheory.Measure.quantile_cond_sdiff`).

For `1 ≤ k ≤ n`, the `k`-th order statistic of `n` independent variables with common real law `μ`
has quantile

    Q_μ(B_(k, n+1−k)⁻¹(u)),

with no continuity assumption on `μ` or on `Q_μ`. The library states this with a zero-based index,
`k + 1` in place of `k` (`TauCeti.Probability.quantile_map_orderStatistic_pi` for the product law,
`TauCeti.Probability.quantile_of_hasLaw_orderStatistic_iid` for an independent sample). The proof
composes the order-statistic cdf of §4.6 with the quantile adjunction (§7.10).

*Needs:* §7.2–§7.6 and §7.10 (Tau Ceti `MeasureTheory.Measure.quantile_le_iff`,
`MeasureTheory.Measure.cdf_bind`, `TauCeti.orderStatistic`); §4.6; §8.4; Layers 9 and 10 for their
own quantile statements.

**Checks.**

-  The maximum of two independent uniform variables on `[0, 1]` has cdf `x²` and quantile `√u`. The
  formula with `k = n = 2` gives `B_(2,1)⁻¹(u) = √u`. Interchanging the Beta parameters would give
  `B_(1,2)⁻¹(u) = 1 − √(1 − u)`, the quantile of the minimum.
-  For `w = 1/2`, `c = 0` and `μ` exponential of rate one, the atom-mixture quantile is `0` for
  `u ≤ 1/2`. At `u = 3/4` it is `Q_μ(1/2) = log 2`, and indeed
  `F(log 2) = 1/2 + (1/2)(1 − 1/2) = 3/4`.

### 13.4 Non-scalar coverage

No joint quantile is defined. The quantile statements for vector, matrix, sphere and circle laws
concern named real observables:

-  **Finite uniform and categorical.** For real labels on a finite type, `Q(u) = x` exactly when the
  total weight of the labels below `x` is less than `u` and the total weight of the labels at most
  `x` is at least `u`. This sorts the distinct labels, aggregates equal labels, and takes the
  cumulative crossing (`Convexity.StdSimplex.quantile_map_categoricalMeasure_eq_iff`,
  `TauCeti.Probability.quantile_map_uniformOn_univ_eq_iff`,
  `MeasureTheory.Measure.quantile_map_finite_eq_iff`; §9.1).
-  **Multinomial, Dirichlet-multinomial, multivariate hypergeometric.** A coordinate of `Mult(n, p)`
  has the binomial law with cell probability `p_i`
  (`TauCeti.Probability.map_eval_multinomialMeasure`). A coordinate of the Dirichlet-multinomial law
  with positive weights `a` and at least two categories has the beta-binomial law
  `BetaBin(n, a_i, ∑_(j≠i) a_j)` (`TauCeti.Probability.map_eval_dirichletMultinomialMeasure`). A
  coordinate of the multivariate hypergeometric law has the hypergeometric law
  `Hypergeom(∑_j K_j, K_i, n)` (`TauCeti.Probability.map_eval_multivariateHypergeometricMeasure`), a
  valid hypergeometric law when `n ≤ ∑_j K_j`. Their cast quantiles are therefore the crossings of
  §13.2 and of the beta-binomial law
  (`TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_iff`, §9.2).
-  **Negative multinomial.** For `r ≥ 0`, `p₀ > 0` and `p₀ + ∑ p_i = 1`, a coordinate has the
  negative binomial law with shape `r` and success probability `p₀/(p₀ + p_i)`
  (`TauCeti.Probability.map_eval_negativeMultinomialMeasure`). The total count has the negative
  binomial law with shape `r` and success probability `p₀`
  (`TauCeti.Probability.map_sum_negativeMultinomialMeasure`). Their quantiles are those of §13.2.
-  **Dirichlet.** With at least two coordinates, a coordinate has quantile
  `B_(a_i, ∑_(j≠i) a_j)⁻¹(u)` (`TauCeti.Probability.quantile_map_eval_dirichletMeasure`). With a
  single coordinate it is the Dirac law at one, with quantile `1`
  (`TauCeti.Probability.quantile_map_eval_dirichletMeasure_of_card_eq_one`).
-  **Gaussian-type vectors and matrices.** For `S ⪰ 0`, the observable `⟨q, X⟩` of `X ∼ N(m, S)` has
  quantile `⟨q, m⟩ + √⟨q, Sq⟩ · z(u)` (`EuclideanSpace.quantile_map_inner_multivariateGaussian`).
  For the multivariate t law with `ν > 0`, `⟨θ, X⟩` has quantile `⟨θ, m⟩ + √⟨θ, Sθ⟩ · t_ν(u)`, where
  `t_ν` is the Student quantile (`TauCeti.Probability.quantile_multivariateTMeasure_projection`).
  For the matrix normal law with `U, V ⪰ 0`, `tr(TᵀX)` has quantile `tr(TᵀM) + √tr(TᵀUTV) · z(u)`,
  and the entry `X_ij` has quantile `M_ij + √(U_ii V_jj) · z(u)`
  (`Matrix.quantile_map_trace_transpose_mul_matrixNormalMeasure`,
  `Matrix.quantile_map_apply_matrixNormalMeasure`). For the proper complex Gaussian with `C ⪰ 0`,
  `Re(q* z)` has quantile `Re(q* m) + √(Re(q* C q)/2) · z(u)`
  (`TauCeti.Probability.quantile_map_re_dotProduct_properComplexGaussianMeasure`). Zero variance or
  zero scale is included in each formula and gives the Dirac quantile.
-  **Log-normal and logistic-normal vectors.** For the multivariate log-normal law with `S ⪰ 0`, the
  coordinate `X_i` has quantile `exp(m_i + √S_ii · z(u))`, and the positive monomial `∏ X_i^(q_i)`
  has quantile `exp(⟨q, m⟩ + √⟨q, Sq⟩ · z(u))`
  (`TauCeti.Probability.quantile_map_eval_multivariateLogNormalMeasure`,
  `TauCeti.Probability.quantile_map_prod_rpow_multivariateLogNormalMeasure`). For the simplex
  logistic-normal law with reference coordinate `r`, the log-ratio `log(x_j/x_r)` has the Gaussian
  quantile `m_j + √S_jj · z(u)` (`TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure`;
  Aitchison and Shen 1980). The log-ratio against another reference has the Gaussian quantile with
  the transformed mean and covariance of §11.5
  (`TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure_reference`).
-  **Sphere and ball.** In dimension `d ≥ 2`, a coordinate of a uniform point on the unit sphere has
  quantile `−1 + 2 B_((d−1)/2,(d−1)/2)⁻¹(u)`. The projection `⟨v, X⟩` has quantile
  `‖v‖ · (−1 + 2 B_((d−1)/2,(d−1)/2)⁻¹(u))`
  (`TauCeti.Probability.quantile_map_eval_uniformSphereMeasure`,
  `TauCeti.Probability.quantile_map_inner_uniformSphereMeasure`). The sphere of dimension one is
  two-point: the projection onto a unit vector has the Rademacher law, with quantile `−1` for
  `u ≤ 1/2` and `1` otherwise
  (`TauCeti.Probability.map_inner_uniformSphereMeasure_of_finrank_eq_one`,
  `TauCeti.Probability.quantile_rademacherMeasure`). For the uniform law on the ball of centre `c`
  and radius `r ≥ 0`, `⟨v, X⟩` has quantile `⟨v, c⟩ + r‖v‖ · (−1 + 2 B_((d+1)/2,(d+1)/2)⁻¹(u))`
  (`TauCeti.Probability.quantile_map_inner_uniformBallMeasure`, with the coordinate case
  `TauCeti.Probability.quantile_map_eval_uniformBallMeasure`). For `r > 0` and `d ≥ 1` the
  normalized radius `‖X − c‖/r` has the Beta law `Beta(d, 1)`
  (`TauCeti.Probability.map_norm_sub_div_uniformBallMeasure`), with quantile `u^(1/d)`
  (`TauCeti.Probability.quantile_betaMeasure_one_right`). By positive scaling of §7.2
  (`TauCeti.Probability.quantile_map_affine_pos`), the radius `‖X − c‖` has quantile `r · u^(1/d)`.
-  **Von Mises–Fisher.** In dimension `d ≥ 2` with `κ ≥ 0`, the mean-direction projection `⟨m, X⟩`
  has as quantile the unique root in `(−1, 1)` of `∫_(−1)^x f = u`, where `f` is the projection
  density of §12.2 (`TauCeti.Probability.quantile_map_inner_vonMisesFisherMeasure_eq_iff`). In
  dimension one the natural-parameter law is two-point
  (`TauCeti.Probability.quantile_map_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`).
-  **Circle laws.** In the fixed angle chart `[−π, π)` the von Mises (`κ ≥ 0`), wrapped normal
  (`v > 0`) and wrapped Cauchy (`γ > 0`) angle quantiles are the unique roots of their cdf integrals
  (`TauCeti.Probability.quantile_vonMisesAngleMeasure_eq_iff`,
  `TauCeti.Probability.quantile_wrappedNormalAngleMeasure_eq_iff`,
  `TauCeti.Probability.quantile_wrappedCauchyAngleMeasure_eq_iff`; Fisher 1993, Mardia and Jupp
  2000). Zero variance or zero scale gives the Dirac law at the chart representative of the location
  (`TauCeti.Probability.wrappedNormalAngleMeasure_zero_var`,
  `TauCeti.Probability.wrappedCauchyAngleMeasure_zero_scale`), with that representative as quantile
  (`MeasureTheory.Measure.quantile_dirac`).
-  **Wishart.** Prove that for `i ∈ Fin p` the diagonal entry `W_ii` of a Gaussian-Gram Wishart
  matrix of integer degree `ν` and scale `S ⪰ 0` has the law of `S_ii · χ²_ν`, and that the same
  holds for the nonsingular Wishart law with `S ≻ 0` and real degree `n > p − 1`, with `χ²_n` in
  place of `χ²_ν`. Its quantile is therefore `2 S_ii G_(ν/2)⁻¹(u)` (resp. `2 S_ii G_(n/2)⁻¹(u)`).
  The quantile is zero when `S_ii = 0` or `ν = 0`, the valid zero scales and degrees. Route:
  congruence by the `1 × p` row selecting `i`
  (`TauCeti.Probability.map_symmetricCongruenceLinearMap_wishartGramMeasure`,
  `TauCeti.Probability.map_symmetricCongruenceLinearMap_submatrix_one_nonsingularWishartMeasure`),
  then the `1 × 1` identification with scaled chi-squared
  (`TauCeti.Probability.map_symmetricFinOneEquiv_wishartGramMeasure`,
  `TauCeti.Probability.map_symmetricFinOneEquiv_nonsingularWishartMeasure`), then
  `TauCeti.Probability.quantile_chiSquaredMeasure` and positive scaling (§6.4; Muirhead, ch. 3).
-  **Inverse-Wishart.** For `p > 0`, `S ≻ 0` and `n > p − 1`, the diagonal entry has the
  inverse-gamma law with shape `(n − p + 1)/2` and scale `S_ii/2`
  (`TauCeti.Probability.map_coe_apply_inverseWishartMeasure`, §6.8). Its quantile is therefore
  `(S_ii/2) / G_((n−p+1)/2)⁻¹(1 − u)` (`TauCeti.Probability.quantile_inverseGammaMeasure`). At
  `p = 1` this is the inverse-gamma quantile with shape `n/2` and scale `S/2`.
-  **LKJ.** The quantiles of the entries and of the partial correlations are stated in §14.4.

*Needs:* §13.1, §13.2; §5.5, §5.6 and Layer 9 for the count vectors and the Dirichlet law; §6.4,
§6.8 for the Wishart laws; Layer 11 for the Gaussian transformations; Layer 12 for the sphere, ball
and circle laws; §7.2 (Tau Ceti `TauCeti.Probability.quantile_map_affine_pos`).

**Checks.**

-  In dimension `3` a coordinate of a uniform point on the sphere is uniform on `[−1, 1]`
  (Archimedes), and the formula gives `−1 + 2 B_(1,1)⁻¹(u) = 2u − 1`. With the ball's parameter
  `(d + 1)/2 = 2` in place of `(d − 1)/2 = 1`, the coordinate would not be uniform.
-  A multinomial coordinate with `p_i = 1` is the Dirac law at `n`, and the binomial quantile of
  §13.2 with `p = 1` is `n` at every level.
-  At `p = 1` the inverse-Wishart diagonal formula `(S/2)/G_(n/2)⁻¹(1 − u)` agrees with the
  inverse-gamma row of §13.1 for shape `n/2` and scale `S/2`.

### 13.5 Family transport coverage

This section specializes the affine transport of §7.1 to named families (Johnson, Kotz and
Balakrishnan, vols. 1 and 2; Coles 2001 for the GEV and generalized Pareto laws; Azzalini and
Capitanio 2014 for the skew-normal law; the SciPy asymmetric Laplace documentation for its rate
convention). Only the parameter changes listed are required; other images stay explicit
pushforwards. Every row assumes valid input parameters and leaves the parameters it does not mention
unchanged. At `b = 0` the image of a probability law is the Dirac law at `a`
(`MeasureTheory.Measure.map_const`), and no family's scale domain is extended to name it. The
quantile, cdf, density and transform of every affine image are those of §7.1 and §7.2
(`TauCeti.Probability.quantile_map_affine`, `TauCeti.Probability.cdf_map_affine_of_pos`,
`TauCeti.Probability.cdf_map_affine_of_neg`, `TauCeti.Probability.charFun_map_affine`).

Affine images `a + bX`:

| Family | Parameters of `a + bX` | Theorem |
| --- | --- | --- |
| Gaussian `(m, v)` | `(a + bm, b²v)`, every `b` | `ProbabilityTheory.gaussianReal_map_const_mul` followed by `ProbabilityTheory.gaussianReal_map_const_add` |
| Cauchy `(m, γ)` | `(a + bm, \|b\|γ)`, every `b` | `TauCeti.Probability.cauchyMeasure_map_affine` |
| Generalized normal `(m, s, p)` | `(a + bm, \|b\|s, p)`, `b ≠ 0` | `TauCeti.Probability.generalizedNormalMeasure_map_affine` |
| Asymmetric Laplace, location `m`, rates `l, r` | location `a + bm`; rates `(l/b, r/b)` for `b > 0`, exchanged rates `(r/\|b\|, l/\|b\|)` for `b < 0` | `TauCeti.Probability.asymmetricLaplaceMeasure_map_affine_pos`, `TauCeti.Probability.asymmetricLaplaceMeasure_map_affine_neg` |
| Laplace `(m, s)` and logistic `(m, s)` | `(a + bm, \|b\|s)`, `b ≠ 0` | `TauCeti.Probability.laplaceMeasure_map_affine`, `TauCeti.Probability.map_affine_logisticMeasure` |
| Triangular `(l, r, c)` | endpoints `(a + bl, a + br)` sorted, mode `a + bc`, `b ≠ 0` | `TauCeti.Probability.triangularMeasure_map_affine_pos`, `TauCeti.Probability.triangularMeasure_map_affine_neg` |
| Gumbel `(m, s)` and GEV `(m, s, ξ)` | `(a + bm, bs)` and `(a + bm, bs, ξ)`, `b > 0` | `TauCeti.Probability.map_affine_gumbelMeasure`, `TauCeti.Probability.map_affine_generalizedExtremeValueMeasure` |
| Lévy `(m, c)` | `(a + bm, bc)`, `b > 0` | `TauCeti.Probability.map_affine_levyMeasure` |
| Skew-normal `(m, s, α)` | `(a + bm, \|b\|s, sign(b)α)`, `b ≠ 0` | `TauCeti.Probability.map_affine_skewNormalMeasure` |

The rows of the table are carried with their `HasLaw` forms
(`TauCeti.Probability.hasLaw_affine_cauchyMeasure`,
`TauCeti.Probability.hasLaw_affine_generalizedNormalMeasure`,
`TauCeti.Probability.hasLaw_affine_pos_asymmetricLaplaceMeasure`,
`TauCeti.Probability.hasLaw_affine_neg_asymmetricLaplaceMeasure`,
`TauCeti.Probability.hasLaw_affine_laplaceMeasure`,
`TauCeti.Probability.hasLaw_affine_pos_triangularMeasure`,
`TauCeti.Probability.hasLaw_affine_neg_triangularMeasure`,
`TauCeti.Probability.hasLaw_affine_gumbelMeasure`,
`TauCeti.Probability.hasLaw_affine_generalizedExtremeValueMeasure`,
`TauCeti.Probability.hasLaw_affine_levyMeasure`,
`TauCeti.Probability.hasLaw_affine_skewNormalMeasure`). The following rows are targets of this
section:

-  **Interval uniform.** Prove that for `l < r` and `b ≠ 0` the image of the interval uniform law on
  `(l, r]` under `x ↦ a + bx` is the interval uniform law with endpoints `a + bl < a + br` for
  `b > 0`, and with the reversed endpoints `a + br < a + bl` for `b < 0`. The half-open endpoint
  convention is immaterial, since the endpoints are null. The case `l = 0`, `r = 1`, `b > 0` is
  `TauCeti.Probability.map_uniformMeasure_affine`.
-  **Reflected Gumbel, GEV and Lévy.** For `b < 0` the image is a reflected law. Prove that `a + bX`
  has the law of `−Y` with `Y` Gumbel `(−a − bm, |b|s)`, GEV `(−a − bm, |b|s, ξ)`, or Lévy
  `(−a − bm, |b|c)` respectively. The route is the positive-slope rows above followed by the
  reflection `x ↦ −x`; for the Gumbel law, `TauCeti.Probability.gumbelMeasure_map_neg` writes the
  reflected law as the minimum-convention law.
-  **Truncated Gaussian.** The truncated normal law is the Gaussian law conditioned on a set `s`
  (§10.9). Prove that for `b ≠ 0` its image under `x ↦ a + bx` is the truncated normal law with
  parameters `(a + bm, b²v)` and set `{a + bx : x ∈ s}`. For an interval with endpoints `l < r` and
  given inclusion flags, the image interval has endpoints `a + bl`, `a + br` with the same flags for
  `b > 0`, and endpoints `a + br`, `a + bl` with exchanged flags for `b < 0`.

Positive scalings `bX`, `b > 0`:

| Family | Parameters of `bX` | Theorem |
| --- | --- | --- |
| Exponential and Gamma, rate `r` | `r/b` | `TauCeti.Probability.expMeasure_map_const_mul`, `TauCeti.Probability.gammaMeasure_map_const_mul` |
| Inverse-gamma `(k, r)` | `(k, br)` | `TauCeti.Probability.inverseGammaMeasure_map_const_mul` |
| Weibull scale `s`; Pareto threshold `t` | `bs`; `bt` | `TauCeti.Probability.weibullMeasure_map_const_mul`, `TauCeti.Probability.paretoMeasure_map_const_mul` |
| Log-normal `(m, v)` | `(m + log b, v)` | `TauCeti.Probability.logNormalMeasure_map_const_mul` |
| Chi; noncentral chi; generalized gamma; half-Student t and half-Cauchy | scale multiplied by `b` | `TauCeti.Probability.chiMeasure_map_const_mul`, `TauCeti.Probability.noncentralChiMeasure_map_const_mul`, `TauCeti.Probability.generalizedGammaMeasure_map_const_mul`, `TauCeti.Probability.halfStudentTMeasure_map_const_mul` |
| Rice `(ν, s)`; folded normal `(m, s)` | `(bν, bs)`; `(bm, bs)` | `TauCeti.Probability.noncentralChiMeasure_map_const_mul` |
| Log-uniform `(l, r)` | `(bl, br)` | `TauCeti.Probability.map_mul_logUniformMeasure` |
| Nakagami `(m, Ω)` | `(m, b²Ω)` | `TauCeti.Probability.nakagamiMeasure_map_const_mul` |
| Generalized Pareto; log-logistic | scale multiplied by `b` | `TauCeti.Probability.map_mul_generalizedParetoMeasure`, `TauCeti.Probability.map_mul_logLogisticMeasure` |
| Inverse Gaussian `(μ, λ)` | `(bμ, bλ)` | `TauCeti.Probability.inverseGaussianMeasure_map_const_mul` |
| Gompertz rate `r` | `r/b` | `TauCeti.Probability.map_mul_gompertzMeasure` |

The Rice and folded normal rows hold in the noncentral chi parametrization of §10.5. Rice is
noncentral chi with `k = 2` and `δ = ν/s`, and the folded normal law `|N(m, s²)|` is noncentral chi
with `k = 1` and `δ = |m|/s`. Scaling keeps `k` and `δ` and multiplies `s` by `b`, which is the
change `(ν, s) ↦ (bν, bs)`, resp. `(m, s) ↦ (bm, bs)`.

Reflections: `1 − X ∼ Beta(b, a)` for `X ∼ Beta(a, b)`
(`TauCeti.Probability.betaMeasure_map_one_sub`, `ProbabilityTheory.HasLaw.one_sub_betaMeasure`).
Student's t is invariant under `x ↦ −x` (`TauCeti.Probability.studentTMeasure_map_neg`), and the
reflection of the noncentral t law negates its noncentrality
(`TauCeti.Probability.noncentralTMeasure_map_neg`).

On `ℤ`, integer translations shift the endpoints of the uniform law on an integer interval and the
centres of the discrete Laplace and discrete Gaussian laws
(`TauCeti.Probability.map_add_const_uniformOn_Icc_int`,
`TauCeti.Probability.map_add_const_discreteLaplaceMeasure`,
`TauCeti.Probability.map_add_const_discreteGaussianMeasure`). Reflection reverses and negates the
endpoints or negates the centres (`TauCeti.Probability.map_neg_uniformOn_Icc_int`,
`TauCeti.Probability.map_neg_discreteLaplaceMeasure`,
`TauCeti.Probability.map_neg_discreteGaussianMeasure`), and it exchanges the two Skellam rates
(`TauCeti.Probability.map_neg_skellamMeasure`). On `ℕ` the translations are natural translations,
and a reflection is taken only after the real cast, except for the complements justified by the
support. For `K ≤ N`, `n − X ∼ Hypergeom(N, N − K, n)` when `X ∼ Hypergeom(N, K, n)`
(`TauCeti.Probability.map_sub_hypergeometricMeasure`,
`TauCeti.Probability.map_sub_map_cast_hypergeometricMeasure`,
`ProbabilityTheory.HasLaw.sub_hypergeometricMeasure`). Prove that `n − X ∼ Bin(n, 1 − p)` when
`X ∼ Bin(n, p)`, and that `n − X ∼ BetaBin(n, b, a)` when `X ∼ BetaBin(n, a, b)` with `a, b > 0`.

*Needs:* §7.1, §7.2 (Tau Ceti `TauCeti.Probability.quantile_map_affine`,
`TauCeti.Probability.charFun_map_affine`; Mathlib `MeasureTheory.Measure.map_const`); the families
of Layers 1, 3, 9 and 10; §10.5 for the noncentral chi parametrization; §10.9 for the truncated
normal law.

**Checks.**

-  The asymmetric Laplace law with location `m` and rates `(l, r)` has image `(−m, r, l)` under
  `x ↦ −x`: the rates are exchanged. Keeping `(l, r)` would put the steeper tail on the wrong
  half-line.
-  The triangular law on `[0, 1]` with mode `1/2` has image under `x ↦ −x` the triangular law on
  `[−1, 0]` with mode `−1/2`. Keeping the transformed endpoints in their original order would put
  the left endpoint `0` above the right endpoint `−1`.
-  For `N = 5`, `K = 2`, `n = 3`, `P(X = 0) = C(3, 3)/C(5, 3) = 1/10`, and the complement
  `3 − X = 3` has mass `C(3, 3) C(2, 0)/C(5, 3) = 1/10` under `Hypergeom(5, 3, 3)`. Keeping `K` in
  place of `N − K` would give `P(3 − X = 3) = 0`.

### 13.6 Weak continuity of the later families

As in §7.11, weak continuity is continuity into `MeasureTheory.ProbabilityMeasure` with its
topology of weak convergence, on each stated valid parameter domain (Billingsley), and the generic
preservation results of §7.11 (continuous pushforwards, affine transport, finite products, finite
mixtures with convergent simplex weights) apply to these families as well. The families defined in
Layers 9–11 are jointly weakly continuous:

| Family | Domain and boundaries | Theorem |
| --- | --- | --- |
| Categorical `p` (§9.1) | fixed finite index type with measurable singletons and a topology whose open sets are measurable; full simplex of weights, zero weights included | `TauCeti.Probability.continuous_categoricalMeasure`, `Continuous.categoricalMeasure` |
| Noncentral chi-squared `(k, λ)` (§10.5) | `k ≥ 0`, `λ ≥ 0`, including the atom `e^(−λ/2)` at zero for `k = 0` and `δ₀` at `k = λ = 0` | `TauCeti.Probability.continuous_noncentralChiSquaredMeasure`, `Continuous.noncentralChiSquaredMeasure` |
| Logit-normal `(m, v)` (§10.15) | `m ∈ ℝ`, `v ≥ 0`, with `δ_(σ(m))` at `v = 0` | `TauCeti.Probability.continuous_logitNormalMeasure`, `Continuous.logitNormalMeasure`, `TauCeti.Probability.tendsto_logitNormalMeasure_nhds_zero_dirac` |
| Noncentral Beta `(a, b, λ)` (§10.17) | `a ≥ 0`, `b > 0`, `λ ≥ 0`, including the atom `e^(−λ/2)` at zero for `a = 0` and `δ₀` at `a = λ = 0` | `TauCeti.Probability.continuous_noncentralBetaMeasure`, `Continuous.noncentralBetaMeasure` |
| Hypoexponential `λ` (§10.18) | fixed finite type, every rate positive, coincident rates included | `TauCeti.Probability.continuous_hypoexponentialMeasure` |
| Hyperexponential `(p, λ)` (§10.19) | fixed finite type, full simplex of weights, every active rate positive, inactive rates arbitrary | `TauCeti.Probability.continuous_hyperexponentialMeasure` |
| Matrix normal `(M, U, V)` (§11.2) | `U` and `V` positive semidefinite, singular and zero included | `TauCeti.Probability.continuous_matrixNormalMeasure`, `Continuous.matrixNormalMeasure` |
| Proper complex Gaussian `(m, C)` (§11.3) | `C` positive semidefinite, singular included, with `δ_m` at `C = 0` | `TauCeti.Probability.continuous_properComplexGaussianMeasure`, `Continuous.properComplexGaussianMeasure`, `TauCeti.Probability.tendsto_properComplexGaussianMeasure_nhds_zero_dirac` |
| Multivariate log-normal `(m, S)` (§11.4) | `S` positive semidefinite, singular included, with `δ_(exp m)` at `S = 0` | `TauCeti.Probability.continuous_multivariateLogNormalMeasure`, `Continuous.multivariateLogNormalMeasure`, `TauCeti.Probability.tendsto_multivariateLogNormalMeasure_nhds_zero_dirac` |
| Simplex logistic-normal `(m, S)` (§11.5) | fixed category type and reference category `r`; `S` positive semidefinite, singular included, with `δ_(T_r(m))` at `S = 0` | `TauCeti.Probability.continuous_logisticNormalMeasure`, `Continuous.logisticNormalMeasure`, `TauCeti.Probability.tendsto_logisticNormalMeasure_nhds_zero_dirac` |

Here `σ(x) = (1 + e^(−x))⁻¹` and `T_r` is the logistic chart of §11.5. As in §7.11, no
total-variation continuity is required at the singular and atomic boundaries, and no weak
continuity across invalid zero-measure branches.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`, `MeasureTheory.Measure.toProbabilityMeasure`,
`Convexity.StdSimplex`; Tau Ceti `Probability/Distributions/Categorical.lean`,
`Probability/Distributions/{NoncentralChiSquared,LogitNormal,NoncentralBeta,Hypoexponential,Hyperexponential,MatrixNormal,MultivariateLogNormal,LogisticNormal}/Continuity.lean`,
`Probability/Distributions/Gaussian/ProperComplex/Continuity.lean`; §7.11; §9.1, §10.5, §10.15,
§10.17, §10.18, §10.19, §11.2, §11.3, §11.4, §11.5.

**Checks.**

- The hyperexponential law with weights `(1 − ε, ε)` and rates `(1, 2)` tends to the exponential law
  of rate one as `ε → 0`, and the limit point `((1, 0), (1, 0))`, whose second rate is inactive and
  zero, is a valid parameter with that same law; a domain requiring every rate to be positive would
  exclude it.
- For `k = 0` the noncentral chi-squared law has the atom `e^(−λ/2)` at zero and a continuous part
  of mass `1 − e^(−λ/2)`; as `λ → 0` it converges weakly to `δ₀`, the law at `k = λ = 0`, although
  every law with `λ > 0` has a nonzero continuous part.
- The logit-normal laws with `m = 0` converge weakly to `δ_(1/2)` as `v → 0`, since `σ(0) = 1/2`.
- The categorical laws with weights `(1 − t, t)` converge weakly to the Dirac law at the first
  category as `t → 0`, the value at the zero weight.

### Examples

-  The median of the exponential law of rate `r` is `log 2 / r`, and its quantile at `1 − e^(−1)` is
  `1/r`.
-  `χ²_2` has quantile `−2 log(1 − u)`, that of the exponential law of rate `1/2`. Its median is
  `2 log 2 ≈ 1.386`.
-  The geometric law with `p = 1/2` has cast quantile `1` on `(1/2, 3/4]` and `2` at `u = 0.76`,
  since `⌈log 0.24 / log 0.5⌉ = ⌈2.06⌉ = 3`.
-  If `X` is Gamma with shape `a` and rate `r`, then `2X` is Gamma with shape `a` and rate `r/2`.
  Its quantile `2 G_a⁻¹(u)/r` is twice that of `X`, as positive scaling requires.
-  For the multivariate Gaussian `N(0, S)` with `S = diag(1, 0)`, the observable `⟨e₂, X⟩` has
  variance zero, and its quantile is `0` at every level.

### Dependencies

Layer 13 uses Layers 1–3 for the scalar families and their cdfs (§2.4), §4.6, the multivariate
families of Layers 5, 6, 9, 11 and 12, the scalar families of Layers 9 and 10, Layer 7 (§7.1 affine
transport, §7.2 quantiles, §7.3 truncation, §7.4–§7.6 mixtures, compound and mixed Poisson, §7.10
order statistics) and the inverse special functions of §8.4. The inverse-Wishart diagonals use §6.8.
§13.6 uses the weak-continuity framework of §7.11 and the families of Layers 9–11. In the libraries
it uses Tau Ceti's measure-level quantile (`Probability/Quantile`) and the families' quantile files,
Mathlib's Gaussian scaling lemmas, and Tau Ceti's affine pushforward
(`Probability/Distributions/Affine.lean`).

## Layer 14: LKJ correlation-matrix laws

The LKJ law of shape `η > 0` on `p × p` correlation matrices has density proportional to
`(det R)^(η−1)` with respect to the volume of the correlation coordinates, not the full symmetric
volume (Lewandowski, Kurowicka and Joe 2009; the Stan documentation records the same
determinant-power convention). Matrices live on Layer 6's symmetric carrier
`selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`. The coordinates and their Jacobian, the
normalization, and the law are separate steps.

### 14.1 Correlation coordinates

Let `J_p = {(i, j) ∈ Fin p × Fin p : j < i}` be the strictly lower index set,
`TauCeti.strictLowerTriangle p` (Lewandowski, Kurowicka and Joe 2009). The affine map
`TauCeti.correlationMatrix p` reconstructs from `x : J_p → ℝ` the symmetric matrix `R(x)` with ones
on the diagonal and `x(i, j)` at `(i, j)` and `(j, i)` for `j < i`
(`TauCeti.coe_correlationMatrix_apply_self`, `TauCeti.coe_correlationMatrix_apply_of_gt`,
`TauCeti.coe_correlationMatrix_apply_of_lt`). It is a continuous affine closed embedding
(`TauCeti.isClosedEmbedding_correlationMatrix`) and a measurable embedding
(`TauCeti.measurableEmbedding_correlationMatrix`). Its range is exactly the unit-diagonal symmetric
matrices (`TauCeti.range_correlationMatrix`), so it is a measurable affine homeomorphism onto them.
On that range it is inverted by the continuous linear map `TauCeti.correlationCoordinates p`, which
reads off the strictly lower entries (`TauCeti.correlationCoordinates_correlationMatrix`,
`TauCeti.correlationMatrix_correlationCoordinates`).

The correlation reference measure is `TauCeti.correlationLebesgue p`, the pushforward of Lebesgue
measure on `J_p → ℝ` by `TauCeti.correlationMatrix p`
(`TauCeti.measurePreserving_correlationMatrix`, `TauCeti.correlationLebesgue_apply`). It is
concentrated on the unit-diagonal matrices (`TauCeti.ae_correlationLebesgue_diag_eq_one`). For
`p ≤ 1` it is the Dirac measure at the identity (`TauCeti.correlationLebesgue_of_le_one`). It is
invariant under simultaneous permutation of rows and columns, and under conjugation by a diagonal
matrix of signs `±1` (`TauCeti.map_symmetricCongruenceLinearMap_permMatrix_correlationLebesgue`,
`TauCeti.map_symmetricCongruenceLinearMap_diagonal_correlationLebesgue`, with Layer 6's congruence
`Matrix.symmetricCongruenceLinearMap`). These are ordinary correlation coordinates, without
Frobenius rescaling of the off-diagonal entries. In positive dimension the unit-diagonal matrices
are a proper affine subspace, null for the full symmetric volume of §6.1, so no statement of this
layer asserts absolute continuity with respect to that volume.

The positive-definite coordinate region `TauCeti.posDefCorrelationRegion p = {x : R(x) ≻ 0}` is
open, convex, bounded and measurable, and contains `0`, the coordinates of the identity
(`TauCeti.isOpen_posDefCorrelationRegion`, `TauCeti.convex_posDefCorrelationRegion`,
`TauCeti.isBounded_posDefCorrelationRegion`, `TauCeti.measurableSet_posDefCorrelationRegion`,
`TauCeti.zero_mem_posDefCorrelationRegion`). It lies in the open cube `(−1, 1)^(J_p)`
(`TauCeti.posDefCorrelationRegion_subset_pi`). Its volume is positive and finite
(`TauCeti.volume_posDefCorrelationRegion_pos`, `TauCeti.volume_posDefCorrelationRegion_lt_top`), and
equals the reference mass of the positive-definite matrices
(`TauCeti.correlationLebesgue_setOf_posDef`). Its closure is the region of positive-semidefinite
correlation matrices (`TauCeti.closure_posDefCorrelationRegion`). Its frontier, the
positive-semidefinite correlation matrices with zero determinant, is null
(`TauCeti.frontier_posDefCorrelationRegion`, `TauCeti.volume_frontier_posDefCorrelationRegion`).

*Needs:* §6.1 (Tau Ceti `TauCeti.symmetricCoordinates`, `Matrix.symmetricCongruenceLinearMap`);
Mathlib `Matrix.PosDef`, `Matrix.PosSemidef`, `selfAdjoint.submodule`.

**Checks.**

-  For `p = 2` the reference measure is Lebesgue measure on the single coordinate `x(1, 0)`, and the
  positive-definite region is `(−1, 1)`, of volume `2 = B(1/2, 1)`. The Hausdorff measure of the
  Frobenius geometry on the same affine line would give `2√2`, because the off-diagonal coordinate
  occupies two entries.
-  For `p = 3` the matrix with all off-diagonal entries `−0.6` has determinant
  `1 − 3(0.36) − 2(0.216) = −0.512 < 0`. Its coordinates lie in the cube but not in the
  positive-definite region, so the region is a proper subset of the cube.

### 14.2 Partial correlations and normalization

The formulas use one-based indices `1 ≤ j < i ≤ p`; in Lean the index set is `Fin p`, shifted by
one. For `z ∈ (−1, 1)^(J_p)` let

    L_ij = z_ij ∏_(k<j) √(1 − z_ik²)  (j < i),   L_ii = ∏_(k<i) √(1 − z_ik²),   L_ij = 0  (j > i),

which is `TauCeti.partialCorrelationCholesky z` (`TauCeti.partialCorrelationCholesky_apply_of_gt`,
`TauCeti.partialCorrelationCholesky_apply_self`, `TauCeti.partialCorrelationCholesky_apply_of_lt`;
Lewandowski, Kurowicka and Joe 2009). On the open cube `L` is lower triangular with positive
diagonal (`TauCeti.isLowerTriangular_partialCorrelationCholesky`,
`TauCeti.partialCorrelationCholesky_diag_pos`). On the closed cube its rows have unit length
(`TauCeti.sum_sq_partialCorrelationCholesky`). The Gram matrix
`TauCeti.partialCorrelationGram z = LLᵀ` (`TauCeti.partialCorrelationGram_def`) is positive definite
with unit diagonal on the open cube (`TauCeti.posDef_partialCorrelationGram`,
`TauCeti.partialCorrelationGram_apply_self`). On the closed cube

    det R = ∏_(i>j) (1 − z_ij²)

(`TauCeti.det_partialCorrelationGram`). In correlation coordinates, the map `z ↦ LLᵀ` is
`TauCeti.correlationCoordinatesOfPartialCorrelation`. It is continuous, smooth on the open cube, and
a bijection from the open cube onto the positive-definite region
(`TauCeti.continuous_correlationCoordinatesOfPartialCorrelation`,
`TauCeti.contDiffOn_correlationCoordinatesOfPartialCorrelation`,
`TauCeti.bijOn_correlationCoordinatesOfPartialCorrelation`). Its inverse comes from Cholesky:
`TauCeti.partialCorrelationOfCorrelationCoordinates` reads `z` off the Cholesky factor
`TauCeti.cholesky` of `R(x)` by `z_ij = L_ij / √(1 − ∑_(k<j) L_ik²)`
(`Matrix.partialCorrelationOfCholesky`, `TauCeti.partialCorrelationOfCorrelationCoordinates_of_mem`,
`TauCeti.invOn_partialCorrelationOfCorrelationCoordinates`).

Prove that on the open cube the Jacobian determinant of
`TauCeti.correlationCoordinatesOfPartialCorrelation` has absolute value

    |J(z)| = ∏_(i>j) (1 − z_ij²)^((p−j−1)/2),

with one-based `j`. Prove also the resulting change of variables over the positive-definite region:
for measurable `g ≥ 0`, `∫_region g(x) dx = ∫_cube g(x(z)) |J(z)| dz`.

The normalizer is `TauCeti.Probability.lkjNormalizer p η`, the product
`∏_(k=1)^(p−1) B(1/2, η + (k − 1)/2)^k`. In the column index it is

    Z_p(η) = ∏_(j=1)^(p−1) B(1/2, η + (p − j − 1)/2)^(p−j)

(`TauCeti.Probability.lkjNormalizer_eq_prod_columns`), with `B` Mathlib's `ProbabilityTheory.beta`.
Empty products are one: `Z_0 = Z_1 = 1` (`TauCeti.Probability.lkjNormalizer_zero`,
`TauCeti.Probability.lkjNormalizer_one`), and `Z_2(η) = B(1/2, η)`
(`TauCeti.Probability.lkjNormalizer_two`). It satisfies
`Z_(p+1)(η) = Z_p(η) · B(1/2, η + (p − 1)/2)^p` (`TauCeti.Probability.lkjNormalizer_succ`), it is
positive for `η > 0` (`TauCeti.Probability.lkjNormalizer_pos`), and it is measurable in `η`
(`TauCeti.Probability.measurable_lkjNormalizer`). By Legendre duplication each factor is a symmetric
Beta normalizer: `Z_p(η) = ∏_k (2^(2β_k − 1) B(β_k, β_k))^k` with `β_k = η + (k − 1)/2`
(`TauCeti.Probability.lkjNormalizer_eq_prod_beta_self`).

Write `ρ_p` for the reference measure `TauCeti.correlationLebesgue p`. Prove
`setIntegral_rpow_det_correlationLebesgue`: for `η > 0`

    ∫_{R ≻ 0} (det R)^(η−1) dρ_p(R) = Z_p(η),

by the change of variables above and Fubini over the cube, using
`∫_(−1)^1 (1 − z²)^(β−1) dz = B(1/2, β)` for `β > 0`. At `p = 0, 1` both sides are one.

*Needs:* §6.1, §6.2 (Tau Ceti `TauCeti.cholesky`, `Matrix.partialCorrelationOfCholesky`); Layers 1–2
for the Beta function; Mathlib `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`,
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`, `ProbabilityTheory.beta`; Tau Ceti
`ProbabilityTheory.beta_one_half_left_eq_two_rpow_mul_beta_self`.

**Checks.**

-  For `p = 3` and order `(z₂₁, z₃₁, z₃₂)`, the entries are `r₂₁ = z₂₁`, `r₃₁ = z₃₁` and
  `r₃₂ = z₂₁z₃₁ + z₃₂ √((1 − z₂₁²)(1 − z₃₁²))`. The Jacobian matrix is triangular with diagonal
  `1, 1, √((1 − z₂₁²)(1 − z₃₁²))`, which is the formula with exponents `1/2, 1/2, 0`. The exponent
  `(p − j)/2` would give `(1 − z₂₁²)(1 − z₃₁²)(1 − z₃₂²)^(1/2)`.
-  `Z_3(1) = B(1/2, 3/2)² · B(1/2, 1) = (π/2)² · 2 = π²/2 ≈ 4.935`, the volume of the region of
  `3 × 3` positive-definite correlation matrices. Exponents `(p − j)/2` in the normalizer would give
  `B(1/2, 2)² · B(1/2, 3/2) = 8π/9 ≈ 2.79` instead.

### 14.3 Law and moments

The LKJ law of dimension `p` and shape `η` is `lkjMeasure p η`, a measure on
`selfAdjoint.submodule ℝ (Matrix (Fin p) (Fin p) ℝ)`. For `η > 0` it has density
`(det R)^(η−1) / Z_p(η)` on the positive-definite matrices with respect to
`TauCeti.correlationLebesgue p`, and density zero elsewhere. For `η ≤ 0` it is the zero measure
(Lewandowski, Kurowicka and Joe 2009; Stan documentation). For `η > 0`:

-  prove that it is a probability measure (`isProbabilityMeasure_lkjMeasure`), that it is almost
  surely positive definite, and that its
  topological support is the set of positive-semidefinite unit-diagonal matrices;
-  prove its Radon–Nikodym derivative with respect to `TauCeti.correlationLebesgue p`, joint
  measurability in `η` of the totalized family, and the `HasLaw` corollaries for random matrices;
-  prove that at `η = 1` it is the normalized restriction of the reference measure to the
  positive-definite region, and that at `p = 0, 1` it is the Dirac law at the identity;
-  prove invariance under simultaneous permutation of rows and columns and under conjugation by
  diagonal sign matrices, and that its mean is the identity;
-  for `i ≠ j` (so `p ≥ 2`), prove that `(R_ij + 1)/2` has the Beta law `Beta(α, α)`
  (`lkjMeasure_entry_beta`) with
  `α = η + (p − 2)/2`. Distinct strict-lower entries have covariance zero, each has variance
  `1/(2η + p − 1)`, and the diagonal entries are constantly one;
-  prove that the partial correlations `z_ij` are jointly independent
  (`map_partialCorrelation_lkjMeasure`, through `TauCeti.partialCorrelationOfCorrelationCoordinates`
  and `TauCeti.correlationCoordinates`), with densities
  `(1 − z²)^(β_j − 1) / B(1/2, β_j)` on `(−1, 1)`, `β_j = η + (p − j − 1)/2` (one-based `j`).
  Equivalently `(z_ij + 1)/2 ∼ Beta(β_j, β_j)`;
-  give the independent-Beta constructions: for independent `y_ij ∼ Beta(β_j, β_j)`, the LKJ law is
  the law of `LLᵀ` with `z_ij = 2y_ij − 1`, and the law of its Cholesky factor `TauCeti.cholesky R`
  is the law of `L`;
-  prove that every natural mixed moment of the entries exists. Its value comes from expanding
  `R = LLᵀ` and evaluating, by independence and Beta integrals, finite products of powers of `z_ij`
  and of nonnegative half-integer powers of `1 − z_ij²`;
-  prove that every real linear observable of `R` has exponential-integrability domain `ℝ`, since
  the entries are bounded by one. No general closed matrix transform is required;
-  for `p ≥ 2`, prove that `(det R)^q` is integrable exactly when `q > −η`
  (`integrable_rpow_det_lkjMeasure_iff`), and, for every `p` and every `q > −η`, that

      E[(det R)^q] = Z_p(η + q) / Z_p(η)

  (`integral_rpow_det_lkjMeasure`). The value comes from the density with shifted determinant
  exponent, and the sharp divergence from the independent partial correlations, whose last column
  has parameter `β_(p−1) = η`. At `p = 0, 1` the determinant and all its real powers are constantly
  one, and both sides of the formula are one.

*Needs:* §14.1, §14.2; the Beta law of Layer 1 (§1.7); §6.1 for the carrier; Tau Ceti
`TauCeti.Probability.lkjNormalizer`, `TauCeti.correlationLebesgue`.

### 14.4 Marginals and quantiles

For `η > 0`, prove that a principal block of size `q ≤ p` has the LKJ law of dimension `q` and shape
`η + (p − q)/2`, including empty and singleton blocks. For `0 < u < 1`, prove that the off-diagonal
entries have quantile `2 B_(α,α)⁻¹(u) − 1` with `α = η + (p − 2)/2`, that the diagonal entries have
quantile one, and that the partial correlation `z_ij` has quantile `2 B_(β_j,β_j)⁻¹(u) − 1`. Prove
the endpoint limits `−1` and `1` of the off-diagonal and partial-correlation quantiles through these
product and marginal laws. The quantiles follow from the Beta marginals of §14.3 by affine transport
(`TauCeti.Probability.quantile_map_affine_pos`, `TauCeti.Probability.quantile_betaMeasure`,
`TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsGT_zero`,
`TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsLT_one`).

*Needs:* §14.3; §7.2; §8.4 (Tau Ceti `TauCeti.inverseRegularizedIncompleteBeta`).

**Checks.**

-  For `p = 2` the free correlation `r` has density `(1 − r²)^(η−1)/B(1/2, η)` and
  `(r + 1)/2 ∼ Beta(η, η)`, the case `p = 2` of `α = η + (p − 2)/2`. At `η = 1` it is uniform on
  `(−1, 1)`, with density `1/B(1/2, 1) = 1/2`.
-  In partial-correlation coordinates the density of §14.3 is
  `(det R)^(η−1) |J| / Z_p(η) = ∏ (1 − z_ij²)^(β_j−1) / ∏ B(1/2, β_j)`, the independent product,
  because column `j` contributes `p − j` factors `B(1/2, β_j)` to `Z_p(η)`. For `p = 3`, `η = 1` the
  first-column partial correlations have the semicircle density `(2/π)√(1 − z²)` and `z₃₂` is
  uniform. The entry marginal with `α = 3/2` is also semicircular, consistent with `r₂₁ = z₂₁`.
-  For `p = 3`, `η = 1` the off-diagonal variance is `4 · (3/2)²/(3² · 4) = 1/4 = 1/(2 + 3 − 1)`.
  For `p = 2`, `η = 1`, `E[det R] = E[1 − r²] = 2/3 = B(1/2, 2)/B(1/2, 1)`, while
  `E[(det R)^(−1)] = ∫ (1/2)/(1 − r²) dr` diverges at `q = −η`.

### Examples

-  For `p = 2`, `η = 1` the LKJ law is the uniform law on the correlations `r ∈ (−1, 1)`, with
  quantile `2u − 1`.
-  For `p = 3`, `η = 1` the normalizer `π²/2` is the volume of the `3 × 3` correlation region, and
  the law is uniform on it.
-  For `p = 2` and `η = 2` the correlation has density `(3/4)(1 − r²)` on `(−1, 1)` and
  `E[det R] = Z_2(3)/Z_2(2) = B(1/2, 3)/B(1/2, 2) = (16/15)/(4/3) = 4/5`.
-  For `p = 0` and `p = 1` the LKJ law is the Dirac law at the identity for every `η > 0`.

### Dependencies

Layer 14 uses the Beta law and the incomplete Beta function of Layers 1–2 (§1.7, §2.2), the
symmetric carrier, its volume and the Cholesky coordinates of Layer 6 (§6.1, §6.2), the quantile
transport of §7.2, and the inverse incomplete Beta function of §8.4. Its own reference measure,
Jacobian and normalization are §14.1–§14.2, and the determinant moments use the normalizer and the
partial-correlation factorization. In the libraries it uses Tau Ceti's correlation coordinates
(`MeasureTheory/Measure/SymmetricMatrix/Correlation.lean`), its partial-correlation Cholesky
construction (`Analysis/Matrix/PartialCorrelation.lean`), the LKJ normalizer
(`Probability/Distributions/LKJ/Normalizer.lean`), and Mathlib's change of variables
(`MeasureTheory/Function/Jacobian.lean`).

## Layer 15: scalar stable laws

The stable laws are constructed within this roadmap as limits of compensated compound-Poisson laws.
The construction uses no Lévy process, no general Lévy–Khintchine classification, and no Bochner
theorem on positive-definite functions. The characteristic functions are computed directly (Nolan
2020; the SciPy levy_stable documentation records the `S₀` and `S₁` conventions).

### 15.1 Parameters and exponent

The stable law `S₀(α, β, s, m)` is `TauCeti.Probability.stableMeasure α β s m`, with `α, β, m ∈ ℝ`
and `s ≥ 0` (`s : ℝ≥0`), in Nolan's `S₀` convention (Nolan 2020, introductory chapter,
Definition 1.7). The valid shapes are `0 < α ≤ 2` and `−1 ≤ β ≤ 1`. Shape validity is checked
first. An invalid shape gives the zero measure at every scale and location, even at `s = 0`
(`TauCeti.Probability.stableMeasure_of_invalid`, `TauCeti.Probability.stableMeasure_of_not_valid`).
A valid shape with `s = 0` gives `δ_m` (`TauCeti.Probability.stableMeasure_zero_scale`), and every
valid shape gives a probability measure (`TauCeti.Probability.isProbabilityMeasure_stableMeasure`).
The probability and formula statements below assume valid shapes and their local hypotheses. The
whole totalized family is Giry measurable in `(α, β, s, m)`
(`TauCeti.Probability.measurable_stableMeasure`). It is jointly weakly continuous as a family of
probability measures on the valid domain, including `α = 1`, `α = 2` and `s = 0`, and not across the
invalid boundary (`TauCeti.Probability.continuous_stableMeasure`, `Continuous.stableMeasure`).

The characteristic exponent is `TauCeti.Probability.stableCharacteristicExponent α β`, with
`Ψ(0) = 0` and for `u ≠ 0`

    Ψ_(α,β)(u) = −|u|^α + iβ tan(πα/2) (sign(u)|u|^α − u)    (α ≠ 1),
    Ψ_(1,β)(u) = −|u| − i(2β/π) u log|u|

(`TauCeti.Probability.stableCharacteristicExponent_of_ne_one_of_ne_zero`,
`TauCeti.Probability.stableCharacteristicExponent_one`,
`TauCeti.Probability.stableCharacteristicExponent_zero`). For valid shapes the characteristic
function is `φ(t) = exp(imt + Ψ_(α,β)(st))` (`TauCeti.Probability.charFun_stableMeasure`). For
invalid shapes the law is zero, so its characteristic function is zero
(`MeasureTheory.charFun_zero_measure`). The exponent has real part `−|u|^α`
(`TauCeti.Probability.stableCharacteristicExponent_re`). Reflecting `u` conjugates it, and negating
`β` reflects `u` (`TauCeti.Probability.stableCharacteristicExponent_neg`,
`TauCeti.Probability.stableCharacteristicExponent_neg_skew`). It is continuous at the origin for
`α > 0` (`TauCeti.Probability.continuousAt_stableCharacteristicExponent_zero`) and continuous in
`(α, β)` on `0 < α ≤ 2` at every fixed frequency, through `α = 1`
(`TauCeti.Probability.continuous_stableCharacteristicExponent_params`).

The `S₁` location is `TauCeti.Probability.stableS1Location α β s m = m − h_α(β, s)` with `h = 0` at
`s = 0`, and for `s > 0`

    h_α(β, s) = β s tan(πα/2)    (α ≠ 1),      h_1(β, s) = (2/π) β s log s

(`TauCeti.Probability.stableS1Location_zero_scale`,
`TauCeti.Probability.stableS1Location_of_ne_one`, `TauCeti.Probability.stableS1Location_one`; Nolan
2020, introductory chapter, (1.7)).
Writing `d` for it, the characteristic exponent takes the `S₁` form
`−|st|^α + i(dt + β sign(t)|st|^α tan(πα/2))` for `α ≠ 1`, and `−|st| + i(dt − (2/π)βst log|t|)` for
`α = 1`, without a parallel family of measures
(`TauCeti.Probability.stableCharacteristicExponent_add_location_eq_s1_of_ne_one`,
`TauCeti.Probability.stableCharacteristicExponent_add_location_eq_s1_one`).

*Needs:* §0.5 for the Dirac law; Mathlib `MeasureTheory.charFun`,
`MeasureTheory.charFun_zero_measure`.

**Checks.**

-  At `u = e` and `β = 1` the shape-one imaginary part is `−(2/π) e ≈ −1.7305`. The non-logarithmic
  branch `tan(πα/2)(e^α − e)` gives `≈ −1.7296` at `α = 0.999` and `≈ −1.7306` at `α = 1.0001`,
  converging to it. The opposite sign on the logarithmic term would make the exponent jump at
  `α = 1`.
-  The invalid shape `α = 3` with `s = 0` gives the zero measure, not `δ_m`, while `α = 1`, `β = 0`
  with `s = 0` gives `δ_m`. A definition that tests the scale before the shape would confuse the two
  branches.

### 15.2 Existence

For `0 < α < 2` and `|β| ≤ 1`, the stable Lévy measure `ν` is
`TauCeti.Probability.stableLevyMeasure α β`, with density zero at zero and otherwise

    Γ(1 + α) sin(πα/2)/π · ((1 + β) 1_(x>0) + (1 − β) 1_(x<0)) · |x|^(−1−α)

(`TauCeti.Probability.stableLevyDensity`, `TauCeti.Probability.stableLevyDensity_of_ne_zero`; Nolan
2020). Outside this range `ν` is the zero measure
(`TauCeti.Probability.stableLevyMeasure_eq_zero_of_not`). For `ε > 0` the restriction of `ν` to
`{|x| > ε}` has positive finite mass (`TauCeti.Probability.stableLevyMeasure_abs_gt_pos`,
`TauCeti.Probability.stableLevyMeasure_abs_gt_ne_top`). Restricted to `(ε, ∞)` and to `(−∞, −ε)` it
is a multiple of the Pareto law with threshold `ε` and shape `α`, resp. of its reflection
(`TauCeti.Probability.stableLevyMeasure_restrict_Ioi`,
`TauCeti.Probability.stableLevyMeasure_restrict_Iio`), and its normalization is a probability jump
law (`TauCeti.Probability.isProbabilityMeasure_cond_stableLevyMeasure`). The approximation
`TauCeti.Probability.stableCompensatedPoissonMeasure α β ε` is the compound Poisson law with that
rate and jump law (§7.5), translated by `−∫_(|x|>ε) sin x dν(x)`
(`TauCeti.Probability.stableCompensatedPoissonMeasure_def`). It is a probability measure
(`TauCeti.Probability.isProbabilityMeasure_stableCompensatedPoissonMeasure`), and its characteristic
function is the exponential of the truncated compensated integral
`∫_(|x|>ε) (e^(itx) − 1 − it sin x) dν(x)`
(`TauCeti.Probability.charFun_stableCompensatedPoissonMeasure`).

The compensated integrand is absolutely integrable against `ν`: near zero it is `O_t(x²)`, and away
from zero it is bounded while `ν` restricted there is finite
(`TauCeti.Probability.integrable_exp_sub_one_sub_sin_stableLevyMeasure`). The truncated integrals
converge to the full one as `ε → 0`
(`TauCeti.Probability.tendsto_integral_exp_sub_one_sub_sin_stableLevyMeasure`). For every real `t`,

    ∫ (e^(itx) − 1 − it sin x) dν(x) = Ψ_(α,β)(t),

with the logarithmic case `α = 1` evaluated separately
(`TauCeti.Probability.integral_exp_sub_one_sub_sin_stableLevyMeasure`). Along `ε_n = 2^(−n)` the
characteristic functions converge to `e^(Ψ(t))`
(`TauCeti.Probability.tendsto_charFun_stableCompensatedPoissonMeasure_invTwoPow`), and the limit is
continuous at zero (`TauCeti.Probability.continuousAt_stableCharacteristicExponent_zero`).

The existence bridge is the reusable lemma `TauCeti.exists_probabilityMeasure_of_tendsto_charFun`
(Billingsley). If the characteristic functions of a sequence of probability measures on a
finite-dimensional real inner product space converge pointwise to a function continuous at zero,
there is a unique probability measure with that characteristic function, and the sequence converges
weakly to it. Its route is tightness (Mathlib `MeasureTheory.isTightMeasureSet_of_tendsto_charFun`),
Prokhorov's theorem (`isCompact_closure_of_isTightMeasureSet`), identification of the cluster
point's characteristic function by bounded continuous integration, and uniqueness
(`MeasureTheory.Measure.ext_of_charFun`). After existence, weak convergence of the dyadic
approximations to the standardized law `S₀(α, β, 1, 0)` follows from Mathlib's
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`
(`TauCeti.Probability.tendsto_stableCompensatedPoissonMeasure_invTwoPow`). The shape `α = 2` is
Gaussian: `S₀(2, β, s, m) = N(m, 2s²)` (`TauCeti.Probability.stableMeasure_two`). For `α < 2`, scale
and location come from the affine pushforward `x ↦ m + sx` of the standardized law.

*Needs:* §7.5 (Tau Ceti `TauCeti.Probability.compoundPoissonMeasure`); the Pareto law (§1.9); §1.10;
Mathlib `MeasureTheory.isTightMeasureSet_of_tendsto_charFun`,
`isCompact_closure_of_isTightMeasureSet`, `MeasureTheory.Measure.ext_of_charFun`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`; Tau Ceti
`TauCeti.exists_probabilityMeasure_of_tendsto_charFun`.

**Checks.**

-  For `α = 1/2`, `β = 1` and `t = 1` the compensating term cancels the imaginary part exactly
  (`sin(tx) − t sin x = 0`). The compensated integral is
  `(1/√(2π)) ∫_0^∞ (cos x − 1) x^(−3/2) dx = −1`, which is `Ψ_(1/2,1)(1) = −1`. The `S₁` exponent
  `−|t|^α (1 − iβ tan(πα/2) sign t)` with zero location gives `−1 + i` instead. The two differ by
  the location `h = β tan(π/4) = 1`, which agrees with the `S₁` form of §15.1 with `d = −1`.

### 15.3 Transport and convolution

For `b ≠ 0`, and for `b = 0` when the shape is valid, the image of `S₀(α, β, s, m)` under
`x ↦ a + bx` is `S₀(α, sign(b)β, |b|s, a + bm)` (`TauCeti.Probability.stableMeasure_map_affine`,
`TauCeti.Probability.hasLaw_affine_stableMeasure`; Nolan 2020). For a valid shape and `b = 0` this
is `δ_a`, by `TauCeti.Probability.stableMeasure_zero_scale`. Every affine image of an invalid law is
the zero measure. Reflection is the case `b = −1` (`TauCeti.Probability.stableMeasure_map_neg`).

For two valid laws of common shape `α`, set `s = (s₁^α + s₂^α)^(1/α)`. Their convolution is the
stable law of shape `α` with

    β = (β₁ s₁^α + β₂ s₂^α) / (s₁^α + s₂^α),      m = d₁ + d₂ + h_α(β, s),

where `d_i` are the `S₁` locations of the factors. Equivalently, the `S₁` locations add
(`TauCeti.Probability.stableMeasure_conv_stableMeasure`,
`TauCeti.Probability.stableMeasure_conv_stableMeasure_of_eq`). The output skewness is valid
(`TauCeti.Probability.abs_stableConvSkew_le_one`). The independent-sum form is
`ProbabilityTheory.IndepFun.hasLaw_add_stableMeasure`. When both scales are zero the formula gives
`s = 0`, `β = 0`, `m = m₁ + m₂`, the law `δ_(m₁+m₂)`.

The named specializations are `S₀(2, β, s, m) = N(m, 2s²)`
(`TauCeti.Probability.stableMeasure_two`), `S₀(1, 0, s, m) = Cauchy(m, s)`
(`TauCeti.Probability.stableMeasure_one_zero`), `S₀(1/2, 1, s, m) = Lévy(m − s, s)` for `s > 0`
(`TauCeti.Probability.stableMeasure_one_half_one`), and the reflected identity `S₀(1/2, −1, s, m)`
equal to the law of `−Y` with `Y ∼ Lévy(−m − s, s)` for `s > 0`
(`TauCeti.Probability.stableMeasure_one_half_neg_one`). The shift `m − s` is required: the Lévy
location is the `S₁` location of §15.1.

*Needs:* §15.1; §7.1; the Gaussian and Cauchy laws (§1.8, §1.10); the Lévy law (§10.7); Mathlib
`MeasureTheory.Measure.ext_of_charFun`.

**Checks.**

-  Two copies of `S₀(1, 1, 1, 0)` convolve to `S₀(1, 1, 2, (4/π) log 2)`. Both `S₁` locations are
  `0 − (2/π) · 1 · log 1 = 0`, and the output location is `h_1(1, 2) = (4/π) log 2 ≈ 0.883`. On
  characteristic functions, `2Ψ_(1,1)(t) = −2|t| − i(4/π) t log|t|`, and
  `iμt + Ψ_(1,1)(2t) = iμt − 2|t| − i(4/π) t log|t| − i(4/π) t log 2` matches it exactly when
  `μ = (4/π) log 2`. Adding the `S₀` locations would give `0`.
-  Two Cauchy laws `S₀(1, 0, s_i, m_i)` convolve to `S₀(1, 0, s₁ + s₂, m₁ + m₂)`, since
  `h_1(0, s) = 0`, which is `Cauchy(m₁ + m₂, s₁ + s₂)`.

### 15.4 Density, support, and quantiles

For `s > 0` the stable law has a bounded smooth density, the Fourier inversion of its characteristic
function,

    f(x) = (1/2π) Re ∫_ℝ e^(−itx) φ(t) dt,

`TauCeti.Probability.stablePDFReal α β s m` with `ℝ≥0∞` companion `TauCeti.Probability.stablePDF`
(`TauCeti.Probability.stablePDFReal_eq`; Nolan 2020). It uses `|φ(t)| = e^(−|st|^α)`
(`TauCeti.Probability.norm_charFun_stableMeasure`), the integrability of `|t|^n |φ(t)|` for every
natural `n` (`TauCeti.Probability.integrable_norm_pow_mul_norm_charFun_stableMeasure`), and Fourier
inversion with this normalization (Tau Ceti `MeasureTheory.Measure.eq_withDensity_charFunDensity`).
The density represents the law (`TauCeti.Probability.stableMeasure_eq_withDensity`). It is
nonnegative and continuous everywhere (`TauCeti.Probability.stablePDFReal_nonneg`,
`TauCeti.Probability.continuous_stablePDFReal`) and smooth
(`TauCeti.Probability.contDiff_stablePDFReal`). For valid shapes it is bounded by `Γ(1/α)/(παs)`
(`TauCeti.Probability.stablePDFReal_le`). The shared interface consists of
`TauCeti.Probability.hasPDF_of_hasLaw_stableMeasure`,
`TauCeti.Probability.pdf_eq_stablePDF_of_hasLaw_stableMeasure` and
`TauCeti.Probability.rnDeriv_stableMeasure`. At `s = 0` the chosen function vanishes
(`TauCeti.Probability.stablePDFReal_zero_scale`), and it is not a density of the Dirac law.

**Support.** Prove `support_stableMeasure`: for valid shapes, the exact topological support of
`S₀(α, β, s, m)` with `s > 0` is `[d, ∞)`
for `0 < α < 1`, `β = 1`, is `(−∞, d]` for `0 < α < 1`, `β = −1`, and is `ℝ` in every other valid
case, fully skewed `α ≥ 1` included (Nolan 2020, introductory chapter, Lemma 1.10). Here `d` is the
`S₁` location of §15.1. Prove both that the law is concentrated on the claimed set and that every
open interval meeting its interior has positive mass. Route: independent large-jump and
small-jump decompositions of §15.2's compensated compound-Poisson construction. These require
variance control of the centred small-jump remainder and positive probability for prescribed finite
collections of jump intervals. For `α < 1` with full
skewness, integrability of the jump size near zero identifies the endpoint `d`, and the one-sided
support follows from the nonnegative jumps, or by reflection. For `α ≥ 1` with full skewness the
small-jump centring diverges, and positive jumps alone do not confine the centred law to a
half-line. The library supplies the finite-cutoff pieces: the splitting of an approximation at two
cutoffs (`TauCeti.Probability.stableCompensatedPoissonMeasure_split`), the supports of the cutoff
jump laws and of the approximations (`TauCeti.Probability.support_cond_stableLevyMeasure_one`,
`TauCeti.Probability.support_cond_stableLevyMeasure_neg_one`,
`TauCeti.Probability.support_cond_stableLevyMeasure_of_abs_lt_one`,
`TauCeti.Probability.support_stableCompensatedPoissonMeasure_one`,
`TauCeti.Probability.support_stableCompensatedPoissonMeasure_neg_one`,
`TauCeti.Probability.support_stableCompensatedPoissonMeasure_of_abs_lt_one`), the small-jump second
moments `∫_(|x|<r) x² dν = 2 Γ(1+α) sin(πα/2)/π · r^(2−α)/(2 − α)`, which tend to zero
(`TauCeti.Probability.integral_sq_stableLevyMeasure_ball`,
`TauCeti.Probability.tendsto_integral_sq_stableLevyMeasure_ball_zero`), and the criterion that the
jump size is integrable near zero exactly when `α < 1`
(`TauCeti.Probability.integrableOn_id_stableLevyMeasure_iff`). The Gaussian case `α = 2` has support
`ℝ` because its density is positive (`ProbabilityTheory.gaussianPDFReal_pos`).

**Strict positivity.** The reusable real convolution lemma is
`MeasureTheory.convolution_pos_iff_mem_interior_add_tsupport`. For continuous nonnegative functions
with convex topological supports, a finite convolution integral is positive exactly at the interior
points of the sum of the supports. Boundedness of one factor gives finiteness and continuity of the
convolution (`MeasureTheory.convolutionExists_of_integrable_of_ae_norm_le`,
`BddAbove.continuous_convolution_right_of_integrable`). The positivity sets of continuous densities
are open and dense in the interiors of their supports, so a translated or reflected pair overlaps on
an open interval. Prove that for `s > 0` the stable density is strictly positive on the interior of
the support. Route: apply the lemma to a convolution factorization of §15.3, with the bounded
continuous densities and the exact supports above, and identify the convolution density pointwise by
continuity. Exact support and density continuity precede this step.

**Cdf and quantile.** For `s > 0` and `0 < u < 1`, prove that the cdf is the integral of the
density, that it is strictly increasing on the interior of the support, and that the quantile is the
unique root of `F(x) = u` in that interior. Prove also that the quantile is continuous and strictly
increasing on `(0, 1)`, with endpoint limits `d` or `−∞` at `0⁺` and `d` or `+∞` at `1⁻` according
to the support. At `s = 0` the law is the Dirac law `δ_m`, with the Dirac cdf and quantile
(`TauCeti.Probability.cdf_dirac`, `MeasureTheory.Measure.quantile_dirac`) and no `HasPDF`.
Measurability of the family including invalid shapes, and joint weak continuity on the valid domain,
are those of §15.1.

*Needs:* §15.2, §15.3; §0.5; §7.2; Tau Ceti `MeasureTheory.Measure.eq_withDensity_charFunDensity`,
`MeasureTheory.Measure.contDiff_charFunDensity`,
`MeasureTheory.convolution_pos_iff_mem_interior_add_tsupport`; Mathlib
`BddAbove.continuous_convolution_right_of_integrable`.

**Checks.**

-  The specializations agree with §15.3. `S₀(1/2, 1, s, m) = Lévy(m − s, s)` has support
  `[m − s, ∞) = [d, ∞)` with `d = m − s tan(π/4)`. The reflected law `S₀(1/2, −1, s, m)` has support
  `(−∞, m + s] = (−∞, d]` with `d = m + s`. `S₀(1, 0, s, m)` (Cauchy) and `S₀(2, β, s, m)`
  (Gaussian) have support `ℝ`. A support endpoint at the `S₀` location `m` would contradict the Lévy
  identity.
-  For `α = 1`, `β = 0`, `s = 1` the density bound `Γ(1/α)/(παs) = 1/π` is attained by the Cauchy
  density at its centre.

### 15.5 Moments and tails

For `s > 0`, `0 < α < 2` and real `q > 0`, prove that `|x|^q` is integrable exactly when `q < α`
(`integrable_rpow_abs_stableMeasure_iff`; Nolan 2020, introductory chapter, p. 15 and Problem 1.11).
Prove that the mean is the `S₁` location `d` when `α > 1`, and that `id` is not integrable when
`α ≤ 1` (Nolan 2020, introductory chapter, Proposition 1.13 and p. 16). In particular the second
moment is not integrable for any positive-scale non-Gaussian stable law. The Gaussian (`α = 2`) and
Dirac (`s = 0`) cases are those of §1.10 and §0.5.

For `s > 0` and `0 < α < 2`, with `C_α = Γ(α) sin(πα/2)/π`
(`TauCeti.Probability.stableTailConstant`), prove the tail limits
(`tendsto_rpow_mul_stableMeasure_Ioi`, `tendsto_rpow_mul_stableMeasure_Iio`; Nolan 2020,
introductory chapter, Theorem 1.12 and its reflected form, pp. 14–15, stated there as asymptotic
equivalences for `β ≠ −1` on the right and `β ≠ 1` on the left)

    x^α μ((x, ∞)) → C_α s^α (1 + β),      x^α μ((−∞, −x)) → C_α s^α (1 − β)    (x → ∞).

These are limits even when a constant is zero, not equivalence to the zero function. They are a
separate analytic step. The large-jump tail constants of the Lévy measure are exact:
`x^α ν((x, ∞)) = C_α(1 + β)` and `x^α ν((−∞, −x)) = C_α(1 − β)` for every `x > 0`
(`TauCeti.Probability.stableTailConstant`,
`TauCeti.Probability.rpow_mul_toReal_stableLevyMeasure_Ioi`,
`TauCeti.Probability.rpow_mul_toReal_stableLevyMeasure_Iio`,
`TauCeti.Probability.tendsto_rpow_mul_toReal_stableLevyMeasure_Ioi`,
`TauCeti.Probability.tendsto_rpow_mul_toReal_stableLevyMeasure_Iio`). The remainder estimates that
transfer them from the jump decomposition to the law are part of the target. The sharp moment
thresholds then follow by tail integration. Smooth Fourier inversion and exact support do not
substitute for these estimates. For `β = 0` and `0 < q < α < 2`, prove

    E[|X − m|^q] = s^q 2^q Γ((1 + q)/2) Γ(1 − q/α) / (√π Γ(1 − q/2)).

No general closed form of shifted or skewed fractional moments is required.

*Needs:* §15.2, §15.4; the small-jump moments of the Lévy measure (Tau Ceti
`TauCeti.Probability.integral_abs_rpow_stableLevyMeasure_ball`,
`TauCeti.Probability.integrableOn_abs_rpow_stableLevyMeasure_iff`); §1.10, §0.5.

**Checks.**

-  At `α = 1` the fractional-moment formula becomes `s^q Γ((1+q)/2) Γ((1−q)/2)/π = s^q / cos(πq/2)`
  by Legendre duplication, the absolute moment of the Cauchy law. At `q = 1/2` both give
  `√2 s^(1/2)`.
-  At `α = 1`, `C_1 = 1/π`, so `x μ((x, ∞)) → s/π` for the Cauchy law, as its cdf requires. At
  `α = 1/2`, `β = 1`, `2C_(1/2) s^(1/2) = √(2s/π)`, the Lévy tail constant. The constant
  `Γ(1 + α) sin(πα/2)/π` of the Lévy density would be wrong by the factor `α`.

### 15.6 Exponential integrability

For valid shapes, prove `integrableExpSet_stableMeasure`: the exact exponential-integrability domain
`D = ProbabilityTheory.integrableExpSet id μ` of `μ = S₀(α, β, s, m)` is

    D = ℝ          if s = 0 or α = 2,
    D = {0}        if s > 0, α < 2, |β| < 1,
    D = (−∞, 0]    if s > 0, α < 2, β = 1,
    D = [0, ∞)     if s > 0, α < 2, β = −1,

the last two including `α = 1`. For `|β| = 1`, `s > 0`, `α < 2` and `βt < 0`, prove that the cgf is

    K(t) = dt − (s|t|)^α / cos(πα/2)       (α ≠ 1),
    K(t) = dt − (2/π) β s t log|t|          (α = 1),

with `d` the `S₁` location, that `M = e^K` on `D`, and that `K(0) = 0`. The Gaussian and Dirac cgfs
are `mt + s²t²` and `mt`. Prove one-sided exponential finiteness and the Laplace formulas
independently of the vanishing polynomial tail constants. A limit argument needs integrability
control, not weak convergence alone. For the compound-Poisson approximants, prove uniform bounds on
the exponential moments at a parameter of strictly larger absolute value in the same allowed
half-line, and use them for uniform integrability and the passage to the limiting Laplace transform.
Prove non-integrability of `e^(tx)` off `D`.

*Needs:* §15.2 (the approximants), §15.3, §15.5; Mathlib `ProbabilityTheory.integrableExpSet`,
`ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`.

**Checks.**

-  For `α = 1/2`, `β = 1`, `t ≤ 0` the formula gives `K(t) = dt − √(s|t|)/cos(π/4) = dt − √(2s|t|)`
  with `d = m − s`. This is the cgf `(m − s)t − √(−2st)` of `Lévy(m − s, s)`. At `s = 1`, `m = 0`,
  `t = −1/2` both equal `−1/2`. The domain `(−∞, 0]` matches the heavy right tail.
-  `S₀(1, 0, s, m)` with `s > 0` is Cauchy and has `D = {0}`. `S₀(2, β, s, m) = N(m, 2s²)` has
  `D = ℝ` and cgf `mt + s²t²` for every `β`. An invalid shape gives the zero measure, which is not a
  probability measure and is excluded from these statements, while `s = 0` gives `δ_m` with `D = ℝ`.

### Examples

-  `S₀(2, β, s, m)` is `N(m, 2s²)` for every `β`; with `s = 1/√2` it is `N(m, 1)`.
-  `S₀(1, 0, s, m)` is the Cauchy law `Cauchy(m, s)`. Its quantile is `m + s tan(π(u − 1/2))` and
  its exponential-integrability domain is `{0}` for `s > 0`.
-  `S₀(1/2, 1, s, m)` with `s > 0` is `Lévy(m − s, s)`, with support `[m − s, ∞)`, no finite mean,
  and `E[|X|^q] < ∞` exactly for `q < 1/2`.
-  Two Cauchy laws `Cauchy(m₁, s₁)` and `Cauchy(m₂, s₂)` convolve to `Cauchy(m₁ + m₂, s₁ + s₂)`, the
  case `α = 1`, `β = 0` of §15.3.
-  For the standard symmetric case `α = 1`, `s = 1`, `m = 0`, the half moment is
  `E[|X|^(1/2)] = 1/cos(π/4) = √2`.

### Dependencies

Layer 15 uses the Dirac package (§0.5), the Pareto, Cauchy and Gaussian laws of Layer 1
(§1.8–§1.10), affine transport, quantiles and compound Poisson laws of Layer 7 (§7.1, §7.2, §7.5),
and the Lévy law of §10.7. Within the layer, density continuity and exact support precede
convolution positivity, jump-tail estimates precede the moment thresholds, and the one-sided Laplace
bounds are a separate target. In the libraries it uses Mathlib's characteristic functions,
tightness, Prokhorov's theorem, characteristic-function uniqueness and Lévy's convergence theorem
(`MeasureTheory/Measure/CharacteristicFunction`, `MeasureTheory/Measure/LevyConvergence.lean`,
`MeasureTheory/Measure/Prokhorov.lean`), Tau Ceti's existence bridge
(`MeasureTheory/Measure/LevyConvergence.lean`), Fourier inversion (`Analysis/Bochner/CharFun`),
convolution positivity (`Analysis/Convolution/Positivity.lean`), and the stable development
(`Probability/Distributions/Stable`).

## Downstream consumers

- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) builds
  statistical inference on these laws; it uses the order statistics of §4.6, the quantiles of §7.2,
  the tilting of §7.8 and the Gaussian, chi-squared, Student and Fisher laws.
- [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) uses the
  chi-squared laws of Gaussian projections of §5.3.
- [RandomMatrices](../RandomMatrices/README.md) uses the scalar and matrix laws of Layers 0 and 3–6,
  the Gaussian-Gram Wishart law and the uniform ball law of §12.1.
- [StochasticCalculus](../StochasticCalculus/README.md) uses the Poisson moments and the Poisson
  tail identity of Layers 1–2, the Gaussian cdf, the modified Bessel function of §8.1 and the
  sphere laws of §§12.1–12.2.
- [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) uses the scalar laws, their
  convolutions and moments of Layers 0–5 and 7.
- [FinancialMathematics](../FinancialMathematics/README.md) uses the Gaussian density and cdf
  identities.
- [FiniteSamplingDiscrepancy](../FiniteSamplingDiscrepancy/README.md) relies on the multivariate
  hypergeometric and multinomial count laws of §9.3 and §5.5.
- [FreeProbability](../FreeProbability/README.md) extends the Gaussian moments of §1.10 and
  Layer 5 to its Wick formula for matrix words.
- [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md),
  [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md),
  [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md) and
  [QSeriesPartitionsAndMockModularForms](../QSeriesPartitionsAndMockModularForms/README.md) build
  on the modified Bessel function of §8.1, the incomplete Gamma function and error function of
  Layer 2, and the inverse functions of §8.4.

## Scope and ownership

**What this roadmap owns.** The measure-level theory of every law of Layers 0–15, as the layers
state it: definitions at every parameter value, probability, densities and masses, parameter
measurability, moments and their sharp thresholds, exact exponential-integrability domains and the
named transforms, cdfs and quantiles of the scalar observables, and the relations between the laws
(sums, ratios, products, mixtures, extrema, order statistics, conditioning, affine images, weak
limits). It also owns the analytic foundations the laws need: the incomplete Gamma and Beta
functions and the error function (Layer 2), the modified Bessel function of real order, Owen's T,
the zeta and Gaussian lattice sums and the inverse special functions (Layer 8), the symmetric-matrix
reference volume, Cholesky coordinates and the multivariate Gamma function (Layer 6), the covariance
pseudoinverse (§5.4), correlation coordinates (§14.1–§14.2), and the generic constructions of Layer
7 (upper quantiles and quantile transport, conditioning and truncation, atom and general mixtures,
compound and mixed Poisson laws, folding and censoring, tilting identities, hazards, weak continuity,
weighted laws, and the scalar stochastic order with its parameter comparisons). It owns the
non-identical Bernoulli-sum theorem (§9.4) and the explicit log-normal moment-indeterminacy example
(§3.3). It owns the real Wick–Isserlis formula (§5.3): RandomMatrices, which consumes Layer 5, takes
the real case of its §2.5 from here and owns the complex formula and Gaussian integration by parts.
Constructions of laws from random variables are in scope, as product-measure pushforwards and their
`ProbabilityTheory.HasLaw` corollaries.

**What the pinned library already states.** The pinned Tau Ceti and Mathlib already prove most of
what the layers state: every fact the layers give with a declaration name is such a statement, and
the names are listed under the supplier contracts below. The targets the pinned libraries do not
state, and which this roadmap asks for, are:

- the topological support of the Gaussian law with `v ≠ 0` (§1.10), of the Weibull law (§3.4), the
  inverse-gamma law (§3.6) and the Student law (§3.7); the natural Pareto moments with their exact
  threshold (§1.11); the probability generating function of a Dirac mass on `ℕ` (§1.12);
- the Wick–Isserlis formula in every even degree and the noncentred mixed moments (§5.3); the
  range-inverse description of the covariance pseudoinverse (§5.4); the singularity of the Dirichlet
  law with respect to ambient volume, the full stick-breaking construction and the non-integrability
  of its real-power moments below the threshold (§5.6);
- the exact almost-sure rank of the Gaussian-Gram law, and the congruence image of the nonsingular
  law under a rank-deficient map at natural degrees (§6.4);
- affine maps commuting with convolution, the density and integration formulas of a conditional
  law, the domain of a finite mixture, and the weak continuity of finite mixtures with converging
  weights, and the rank-change statement for the joint laws of `(Z, tZ)` (§7.1, §7.3, §7.4, §7.11);
- the joint smoothness of the Gaussian lattice sum and the locally uniform convergence of the
  lattice and periodized series (§8.3), joint measurability of the inverse incomplete Beta function
  (§8.4), and the permutation construction of the negative hypergeometric law (§9.3);
- the folded normal law, the reflected Lévy law, and the monotonicity and limits of the skew-normal
  quantile (§10.5, §10.7, §10.9), and the positivity of the noncentral Beta denominator (§10.17);
- the row-major presentation, support, singularity and parameter measurability of the matrix normal
  law (§11.2), the Rice law of a complex Gaussian modulus (§11.3), the empty-index log-normal law
  (§11.4), the smooth logistic chart (§11.5), the dimension-zero sphere and ball laws and the circle
  and disk identifications of the arcsine and semicircle laws (§12.1), the second moment of the von
  Mises–Fisher law (§12.2), the Haar probability on the circle as a conditional volume (§12.3), the
  uniform convergence of the wrapped normal series (§12.4) and the Fourier series of the wrapped
  Cauchy density (§12.5);
- the diagonal laws of the Wishart matrices and the affine images listed as targets in §13.4–§13.5;
- the LKJ Jacobian and normalization integral (§14.2) and the whole LKJ law of §14.3–§14.4;
- the exact support, density positivity, cdf and quantiles of the stable laws (§15.4), their
  moment thresholds and tails (§15.5) and their exponential integrability (§15.6).

**Owned elsewhere.**

- [OptimalTransport](../OptimalTransport/README.md) owns the quantile of a law on the line, its
  measurability and the pushforward of uniform measure on `(0, 1)` to the law, and the optimal
  quantile coupling (its §3.7), which §7.2 and §7.13 use; the Gaussian Brenier and `W₂` formulas and
  the positive-definite square-root and geometric-mean identities (its §5.3); and Gaussian
  interpolation and barycenters (its §12.8). This roadmap owns the distributional densities, the
  conditional laws, the affine laws, Cholesky coordinates, the upper quantile and quantile
  reflection, the distribution formulas, parameter measurability, the inverse-function
  specializations and the scalar stochastic-order comparisons of §7.13; optimal couplings and the
  Wasserstein identities for quantiles stay with OptimalTransport.
- [OrthogonalL2Bases](../../Completed/OrthogonalL2Bases/README.md) owns moment determinacy and the
  Gaussian Hermite `L²` theory; the Gaussian polynomial integrability and the determinacy results it
  provides are used here and not stated again. The explicit log-normal counterexample is this
  roadmap's (§3.3).
- [OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md) owns positive-definite
  functions and Bochner's theorem; the two roadmaps share no targets and no dependencies. This
  roadmap computes the characteristic functions of its laws directly and constructs the stable laws
  itself (Layer 15).

**Outside this roadmap.** Statistical inference (data, likelihoods, sufficiency, estimators,
priors and posteriors, tests, losses, decision rules), sampling algorithms, numerical approximation
and stochastic processes; the general Lévy–Khintchine classification, domains of attraction,
general phase-type theory, Brownian arcsine theorems and random-matrix semicircle limits (the scalar
laws of those names here are specified on their own); the Bessel function `K`, complex orders and
arguments of Bessel functions, and the Bessel forms of transforms (§8.1, Conventions 6); closed
transforms beyond those the sections write.

**Related work.** SampCert (Apache 2.0) verifies samplers for the integer Laplace and Gaussian laws
in its `SLang` language. Those integer laws are not the continuous `TauCeti.Probability.laplaceMeasure` or
`ProbabilityTheory.gaussianReal`; §9.8 develops the integer measures independently, without
samplers, privacy theorems or SampCert's programming interface. statlib concerns frequentist
inference, which is outside this roadmap. Neither project supplies code here.

**Mathlib designs.** Where Mathlib states a declaration at the pin, the roadmap uses it. Its
interfaces follow the Mathlib design proposals listed under References (binomial variance,
exponential moments and memorylessness, the real error functions, the lower quantile, Bessel
functions, `PMF`s versus measures): `MeasureTheory.Measure.quantile` is the quantile, the finite
uniform laws are Mathlib's uniform measures on finite sets, and the Bessel representation and
endpoint choices of §8.1 are those of the Bessel proposal. Nothing in the roadmap waits for any of
these proposals.

## Exact supplier contracts

Every declaration below is assumed with exactly the hypotheses and conclusion with which the
section that cites it states it, at the claim; each is listed once, under the first section (or
Conventions item) that names it, grouped by file. The declarations of `Suggested.lean` are this
roadmap's own and are not listed.

### From Mathlib

Paths are under `Mathlib/`. `Nat.succ` (§9.10) is not Mathlib's: it is a constructor of Lean
core's `Nat`, in `Init/Prelude.lean` of the Lean toolchain.

- Conventions. `Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw`; `Probability/Density.lean`: `MeasureTheory.HasPDF`; `Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun`; `MeasureTheory/Measure/GiryMonad.lean`: `MeasureTheory.Measure.bind`; `Probability/CDF.lean`: `ProbabilityTheory.cdf`; `Probability/Moments/CovarianceBilin.lean`: `ProbabilityTheory.covarianceBilin`; `LinearAlgebra/Matrix/Defs.lean`: `Matrix.of`; `Analysis/SpecialFunctions/Pow/Real.lean`: `Real.rpow`; `Analysis/SpecialFunctions/Pow/Complex.lean`: `Complex.cpow`; `Analysis/InnerProductSpace/PiL2.lean`: `Matrix.toEuclideanLin`; `Probability/Distributions/Gamma.lean`: `ProbabilityTheory.gammaMeasure`; `Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex`; `MeasureTheory/Function/Jacobian.lean`: `MeasureTheory.map_withDensity_abs_det_fderiv_eq_addHaar`, `MeasureTheory.restrict_map_withDensity_abs_det_fderiv_eq_addHaar`, `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`, `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`; `MeasureTheory/Measure/MeasureSpaceDef.lean`: `MeasureTheory.Measure`; `MeasureTheory/Group/Convolution.lean`: `MeasureTheory.Measure.conv`; `Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond`; `MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted`; `Probability/Kernel/Defs.lean`: `ProbabilityTheory.Kernel`.
- §0.1. `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianPDF_zero_var`, `ProbabilityTheory.gaussianReal`; `Probability/Density.lean`: `MeasureTheory.pdf`; `MeasureTheory/Measure/WithDensity.lean`: `MeasureTheory.Measure.withDensity`; `Probability/Distributions/Beta.lean`: `ProbabilityTheory.betaMeasure`; `Probability/Distributions/Exponential.lean`: `ProbabilityTheory.expMeasure`; `Probability/Distributions/Cauchy.lean`: `ProbabilityTheory.cauchyMeasure`; `Probability/Distributions/Pareto.lean`: `ProbabilityTheory.paretoMeasure`.
- §0.2. `Probability/Distributions/Cauchy.lean`: `ProbabilityTheory.cauchyMeasure_zero_scale`; `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.rnDeriv_gaussianReal`; `MeasureTheory/Measure/Decomposition/Lebesgue.lean`: `MeasureTheory.Measure.rnDeriv_withDensity`, `MeasureTheory.Measure.rnDeriv`.
- §0.3. `Probability/Distributions/Uniform.lean`: `MeasureTheory.pdf.uniformPDF_eq_pdf`, `MeasureTheory.pdf.IsUniform`, `MeasureTheory.pdf.uniformPDF`; `Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf`, `ProbabilityTheory.cgf`; `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.charFun`; `Probability/Moments/IntegrableExpMul.lean`: `ProbabilityTheory.integrableExpSet`; `MeasureTheory/Measure/Support.lean`: `MeasureTheory.Measure.support`.
- §0.4. `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.measurable_gaussianReal`, `ProbabilityTheory.measurable_uncurry_gaussianPDF`; `Basic/NNReal/Defs.lean`: `Real.toNNReal`; `MeasureTheory/Measure/GiryMonad.lean`: `MeasureTheory.Measure.instMeasurableSpace`; `Probability/Distributions/Poisson/Basic.lean`: `ProbabilityTheory.poissonMeasure`; `Probability/Distributions/Geometric.lean`: `ProbabilityTheory.geometricMeasure`; `Probability/Distributions/Binomial.lean`: `ProbabilityTheory.binomial`; `Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure`.
- §0.5. `MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_dirac`; `Probability/Moments/Variance.lean`: `ProbabilityTheory.variance_dirac`; `Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf_dirac'`; `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.charFun_dirac`; `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal_zero_var`; `MeasureTheory/Measure/Dirac/Def.lean`: `MeasureTheory.Measure.dirac`.
- §1.1. `MeasureTheory/Measure/Map.lean`: `MeasureTheory.Measure.map`; `Algebra/Order/Floor/Defs.lean`: `Nat.floor`.
- §1.2. `Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure_def`; `Probability/Distributions/Binomial.lean`: `ProbabilityTheory.binomial_real_singleton`, `ProbabilityTheory.binomial_eq_sum_dirac`, `ProbabilityTheory.binomial_one_eq_bernoulliMeasure`, `ProbabilityTheory.integral_of_hasLaw_binomial`; `Probability/Moments/Variance.lean`: `ProbabilityTheory.variance`.
- §1.3. `Probability/Distributions/Geometric.lean`: `ProbabilityTheory.geometricMeasure_eq`, `ProbabilityTheory.geometricMeasure_real_singleton`, `ProbabilityTheory.geometricMeasure_real_singleton_pos`, `ProbabilityTheory.isProbabilityMeasure_geometricMeasure`.
- §1.4. `Probability/Distributions/Poisson/Basic.lean`: `ProbabilityTheory.poissonMeasure_real_singleton`, `ProbabilityTheory.hasSum_one_poissonMeasure`, `ProbabilityTheory.poissonMeasure_real_singleton_pos`, `ProbabilityTheory.charFun_map_cast_poissonMeasure`, `ProbabilityTheory.poissonMeasure_conv_poissonMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_poissonMeasure`.
- §1.5. `Probability/Distributions/Exponential.lean`: `ProbabilityTheory.exponentialPDF`; `Probability/Independence/Basic.lean`: `ProbabilityTheory.IndepFun`.
- §1.6. `Probability/Distributions/Gamma.lean`: `ProbabilityTheory.isProbabilityMeasure_gammaMeasure`; `Analysis/SpecialFunctions/Gamma/Basic.lean`: `Real.Gamma`; `Probability/Moments/ComplexMGF.lean`: `ProbabilityTheory.complexMGF`.
- §1.7. `Probability/Distributions/Beta.lean`: `ProbabilityTheory.betaPDF`, `ProbabilityTheory.isProbabilityMeasureBeta`, `ProbabilityTheory.beta`.
- §1.8. `Probability/Distributions/Cauchy.lean`: `ProbabilityTheory.instIsProbabilityMeasure_cauchyMeasure`.
- §1.9. `Probability/Distributions/Pareto.lean`: `ProbabilityTheory.isProbabilityMeasure_paretoMeasure`.
- §1.10. `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianPDFReal_pos`; `Probability/Moments/Basic.lean`: `ProbabilityTheory.centralMoment`; `Data/Nat/Factorial/DoubleFactorial.lean`: `Nat.doubleFactorial`.
- §1.11. `Analysis/SpecialFunctions/Pow/Real.lean`: `Real.rpow_natCast`.
- §1.12. `MeasureTheory/Measure/Dirac/Def.lean`: `MeasureTheory.Measure.dirac_real_apply`; `Data/Nat/Factorial/Basic.lean`: `Nat.descFactorial`.
- §2.3. `Analysis/Complex/Exponential.lean`: `Real.exp`; `Analysis/Real/Sqrt.lean`: `Real.sqrt`.
- §3.2. `Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log`; `MeasureTheory/Function/JacobianOneDim.lean`: `MeasureTheory.integral_image_eq_integral_abs_deriv_smul`.
- §3.3. `Analysis/Complex/Trigonometric.lean`: `Real.sin`.
- §3.9. `MeasureTheory/Measure/Sum.lean`: `MeasureTheory.Measure.sum`.
- §3.10. `Data/Nat/Choose/Basic.lean`: `Nat.choose`.
- §4.1. `MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`.
- §4.6. `Data/Fintype/Defs.lean`: `Finset.univ`; `Data/Finset/Lattice/Fold.lean`: `Finset.sup'`, `Finset.inf'`; `Data/Fin/Tuple/Sort.lean`: `Tuple.sort`.
- Layer 5 (introduction). `Probability/Distributions/Gaussian/Multivariate.lean`: `ProbabilityTheory.stdGaussian`, `ProbabilityTheory.multivariateGaussian_of_not_posSemidef`.
- §5.1. `Probability/Distributions/Gaussian/Multivariate.lean`: `ProbabilityTheory.isGaussian_multivariateGaussian`, `ProbabilityTheory.integral_id_multivariateGaussian`, `ProbabilityTheory.multivariateGaussian`, `ProbabilityTheory.covariance_eval_multivariateGaussian`, `ProbabilityTheory.covarianceBilin_multivariateGaussian`; `Probability/Distributions/Gaussian/Fernique.lean`: `ProbabilityTheory.IsGaussian.integrable_id`; `Probability/Moments/CovarianceBilin.lean`: `ProbabilityTheory.covarianceBilin_of_not_memLp`; `Probability/Moments/Covariance.lean`: `ProbabilityTheory.covariance`; `MeasureTheory/Function/LpSeminorm/Defs.lean`: `MeasureTheory.MemLp`.
- §5.2. `Basic/ENNReal/Basic.lean`: `ENNReal.ofReal`; `MeasureTheory/Measure/MutuallySingular.lean`: `MeasureTheory.Measure.MutuallySingular`; `Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean`: `CFC.sqrt`.
- §5.3. `Probability/Distributions/Gaussian/Multivariate.lean`: `ProbabilityTheory.measurePreserving_eval_multivariateGaussian`, `ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian`, `ProbabilityTheory.charFun_multivariateGaussian`, `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis`; `Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean`: `CFC.sqrt_mul_sqrt_self`; `LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.det_one_add_mul_comm`; `Probability/Moments/Basic.lean`: `ProbabilityTheory.iIndepFun.mgf_sum`; `Probability/Distributions/Gaussian/HasGaussianLaw/Independence.lean`: `ProbabilityTheory.HasGaussianLaw.indepFun_of_covariance_inner`; `Analysis/InnerProductSpace/Projection/Basic.lean`: `Submodule.orthogonalProjectionOnto`.
- §5.4. `Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace.sumEquivProd`; `Analysis/InnerProductSpace/Symmetric.lean`: `LinearMap.IsSymmetric.orthogonal_range`; `Probability/Kernel/CondDistrib.lean`: `ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd`, `ProbabilityTheory.condDistrib`; `LinearAlgebra/Matrix/Defs.lean`: `Matrix.submatrix`.
- §5.5. `Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex.map`; `LinearAlgebra/Finsupp/Pi.lean`: `FunOnFinite.map`; `Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace.equiv`.
- §5.6. `Order/Filter/AtTopBot/Defs.lean`: `Filter.atBot`; `MeasureTheory/Measure/ProbabilityMeasure.lean`: `MeasureTheory.ProbabilityMeasure`.
- §5.7. `Probability/Distributions/Gaussian/Multivariate.lean`: `ProbabilityTheory.measurable_multivariateGaussian`.
- Layer 6 (introduction). `LinearAlgebra/Matrix/Hermitian.lean`: `Matrix.isHermitian_iff_isSelfAdjoint`.
- §6.1. `Analysis/Matrix/Normed.lean`: `Matrix.frobeniusNormedAddCommGroup`, `Matrix.frobeniusNormedSpace`; `Analysis/Matrix/Order.lean`: `Matrix.toMatrixInnerProductSpace`; `MeasureTheory/Group/Measure.lean`: `MeasureTheory.Measure.IsAddHaarMeasure`; `Algebra/Star/Module.lean`: `selfAdjoint.submodule`; `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: `Matrix.GeneralLinearGroup`.
- §6.2. `LinearAlgebra/Matrix/Block.lean`: `Matrix.IsLowerTriangular`; `Analysis/Matrix/LDL.lean`: `LDL.lower`, `LDL.diag`, `LDL.isLowerTriangular_lower`.
- §6.4. `Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean`: `CFC.sqrt_of_not_nonneg`; `Analysis/Matrix/Order.lean`: `Matrix.nonneg_iff_posSemidef`; `Probability/Moments/ComplexMGF.lean`: `ProbabilityTheory.analyticOnNhd_complexMGF`; `Probability/Moments/MGFAnalytic.lean`: `ProbabilityTheory.deriv_mgf_zero`, `ProbabilityTheory.iteratedDeriv_mgf_zero`; `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.Measure.ext_of_charFun`.
- §6.5. `MeasureTheory/Measure/Restrict.lean`: `map_comap_subtype_coe`; `MeasureTheory/Measure/Comap.lean`: `MeasureTheory.Measure.comap`.
- §6.8. `LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.invOf_fromBlocks₂₂_eq`.
- §7.1. `MeasureTheory/Measure/Typeclasses/Probability.lean`: `MeasureTheory.Measure.isProbabilityMeasure_map_iff`; `Probability/HasLaw.lean`: `ProbabilityTheory.HasLaw.comp`, `ProbabilityTheory.hasLaw_map`; `MeasureTheory/Measure/Dirac/Basic.lean`: `MeasureTheory.Measure.map_const`; `MeasureTheory/Group/Convolution.lean`: `MeasureTheory.Measure.map_conv_addMonoidHom`, `MeasureTheory.Measure.conv_dirac`.
- §7.2. `MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean`: `MeasureTheory.restrict_Ioo_eq_restrict_Ioc`.
- §7.3. `Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond_isProbabilityMeasure_of_finite`, `ProbabilityTheory.cond_apply`, `ProbabilityTheory.cond_eq_zero_of_meas_eq_zero`.
- §7.4. `MeasureTheory/Measure/ProbabilityMeasure.lean`: `MeasureTheory.isProbabilityMeasure_bind`; `MeasureTheory/Measure/GiryMonad.lean`: `MeasureTheory.Measure.bind_congr_right`, `MeasureTheory.Measure.map_bind`, `MeasureTheory.Measure.bind_map`, `MeasureTheory.Measure.bind_apply`, `MeasureTheory.Measure.lintegral_bind`.
- §7.7. `MeasureTheory/Group/Measure.lean`: `MeasureTheory.Measure.IsNegInvariant`; `Order/Interval/Set/ProjIcc.lean`: `Set.projIcc`, `Set.projIci`, `Set.projIic`.
- §7.8. `MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.tilted_tilted`, `MeasureTheory.rnDeriv_tilted_left`; `Probability/Moments/Tilted.lean`: `ProbabilityTheory.integral_tilted_mul_self`, `ProbabilityTheory.variance_tilted_mul`.
- §7.9. `MeasureTheory/Integral/IntervalIntegral/DerivIntegrable.lean`: `AbsolutelyContinuousOnInterval.intervalIntegrable_deriv`; `MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`: `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`.
- §7.11. `MeasureTheory/Measure/ProbabilityMeasure.lean`: `MeasureTheory.ProbabilityMeasure.continuous_map`, `MeasureTheory.Measure.toProbabilityMeasure`; `MeasureTheory/Measure/FiniteMeasureProd.lean`: `MeasureTheory.ProbabilityMeasure.continuous_prod`; `MeasureTheory/Measure/FiniteMeasurePi.lean`: `MeasureTheory.ProbabilityMeasure.continuous_pi`; `MeasureTheory/Measure/LevyConvergence.lean`: `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_charFun`.
- §8.1. `Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: `Complex.regularizedHGFun`; `Analysis/SpecialFunctions/Bessel.lean`: `Complex.besselJ`.
- §8.2. `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianPDFReal`; `Analysis/SpecialFunctions/Trigonometric/Arctan.lean`: `Real.arctan`.
- §8.3. `NumberTheory/LSeries/Dirichlet.lean`: `riemannZeta_re_pos_of_one_lt`, `riemannZeta_im_eq_zero_of_one_lt`; `Analysis/PSeries.lean`: `Real.summable_nat_rpow`; `NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`: `hasFDerivAt_jacobiTheta₂`.
- §9.1. `Probability/UniformOn.lean`: `ProbabilityTheory.isProbabilityMeasure_uniformOn`, `ProbabilityTheory.uniformOn`; `MeasureTheory/Measure/Typeclasses/Probability.lean`: `MeasureTheory.IsProbabilityMeasure`; `MeasureTheory/MeasurableSpace/Basic.lean`: `measurable_of_countable`; `Probability/Distributions/Uniform.lean`: `MeasureTheory.Measure.uniformOfFinset`.
- §9.6. `MeasureTheory/Measure/TotalVariation/Defs.lean`: `MeasureTheory.tvDist`.
- §9.7. `Analysis/SpecialFunctions/Complex/Log.lean`: `Complex.log`.
- §10.1. `Analysis/SpecialFunctions/Sigmoid.lean`: `Real.sigmoid`.
- §10.2. `NumberTheory/Harmonic/EulerMascheroni.lean`: `Real.eulerMascheroniConstant`; `Analysis/SpecialFunctions/Gamma/Basic.lean`: `Complex.Gamma`; `MeasureTheory/Group/Measure.lean`: `MeasureTheory.Measure.neg`.
- §10.7. `Analysis/RCLike/Sqrt.lean`: `Complex.sqrt`; `Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf_neg`.
- §10.10. `Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf_zero`; `MeasureTheory/MeasurableSpace/Constructions.lean`: `measurable_from_nat`.
- §10.14. `MeasureTheory/Measure/Prod.lean`: `MeasureTheory.Measure.prod`.
- §10.17. `Probability/Distributions/Beta.lean`: `ProbabilityTheory.betaPDFReal`.
- §10.18. `Probability/Distributions/Gamma.lean`: `ProbabilityTheory.gammaPDFReal`; `Algebra/Order/Antidiag/Pi.lean`: `Finset.piAntidiag`.
- §10.19. `Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex.nonempty`, `Convexity.StdSimplex.support_weights_nonempty`.
- §10.20. `Analysis/SpecialFunctions/Trigonometric/Inverse.lean`: `Real.arcsin`.
- §11.2. `LinearAlgebra/Matrix/Vec.lean`: `Matrix.vec`; `LinearAlgebra/Matrix/Kronecker.lean`: `Matrix.kroneckerMap`.
- §11.3. `LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef.det_pos`; `Probability/Distributions/Gaussian/Basic.lean`: `ProbabilityTheory.IsGaussian`.
- §12.1. `MeasureTheory/Constructions/HaarToSphere.lean`: `MeasureTheory.Measure.toSphere`, `MeasureTheory.Measure.toSphere_apply_univ`; `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean`: `InnerProductSpace.volume_ball`.
- §12.3. `Analysis/Fourier/AddCircle.lean`: `AddCircle.haarAddCircle`, `AddCircle.volume_eq_smul_haarAddCircle`; `Topology/Instances/AddCircle/Defs.lean`: `AddCircle.equivIco`.
- §13.5. `Probability/Distributions/Gaussian/Real.lean`: `ProbabilityTheory.gaussianReal_map_const_mul`, `ProbabilityTheory.gaussianReal_map_const_add`.
- §14.1. `LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`, `Matrix.PosSemidef`.
- §15.1. `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`: `MeasureTheory.charFun_zero_measure`.
- §15.2. `MeasureTheory/Measure/LevyConvergence.lean`: `MeasureTheory.isTightMeasureSet_of_tendsto_charFun`; `MeasureTheory/Measure/Prokhorov.lean`: `isCompact_closure_of_isTightMeasureSet`.
- §15.4. `Analysis/Convolution.lean`: `BddAbove.continuous_convolution_right_of_integrable`.

### From Tau Ceti

Paths are under `TauCeti/`.

- Conventions. `Probability/Quantile.lean`: `MeasureTheory.Measure.quantile`.
- §0.1. `Probability/Density.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_withDensity`, `TauCeti.Probability.pdf_eq_of_hasLaw_withDensity`; `Probability/Distributions/Gamma/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_gammaMeasure`, `TauCeti.Probability.pdf_eq_gammaPDF_of_hasLaw_gammaMeasure`; `Probability/Distributions/Gamma/Basic.lean`: `TauCeti.Probability.gammaMeasure_eq_withDensity_ofReal`; `Probability/Distributions/Gaussian/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_gaussianReal`, `TauCeti.Probability.pdf_eq_gaussianPDF_of_hasLaw_gaussianReal`; `Probability/Distributions/Beta/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_betaMeasure`, `TauCeti.Probability.pdf_eq_betaPDF_of_hasLaw_betaMeasure`; `Probability/Distributions/Exponential/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_expMeasure`, `TauCeti.Probability.pdf_eq_exponentialPDF_of_hasLaw_expMeasure`; `Probability/Distributions/Cauchy/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_cauchyMeasure`, `TauCeti.Probability.pdf_eq_cauchyPDF_of_hasLaw_cauchyMeasure`; `Probability/Distributions/Pareto/PDF.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_paretoMeasure`, `TauCeti.Probability.pdf_eq_paretoPDF_of_hasLaw_paretoMeasure`.
- §0.2. `Probability/Distributions/Gamma/PDF.lean`: `TauCeti.Probability.rnDeriv_gammaMeasure`; `Probability/Distributions/Beta/PDF.lean`: `TauCeti.Probability.rnDeriv_betaMeasure`; `Probability/Distributions/Exponential/PDF.lean`: `TauCeti.Probability.rnDeriv_expMeasure`; `Probability/Distributions/Pareto/PDF.lean`: `TauCeti.Probability.rnDeriv_paretoMeasure`; `Probability/Distributions/Cauchy/PDF.lean`: `TauCeti.Probability.rnDeriv_cauchyMeasure`, `TauCeti.Probability.rnDeriv_cauchyMeasure_zero_scale`.
- §0.3. `Probability/Distributions/Uniform/Basic.lean`: `TauCeti.Probability.uniformMeasure_eq_zero_of_le`, `TauCeti.Probability.isProbabilityMeasure_uniformMeasure`, `TauCeti.Probability.uniformPDFReal`, `TauCeti.Probability.uniformPDF_eq_ofReal_uniformPDFReal`, `TauCeti.Probability.uniformMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_uniformMeasure`, `TauCeti.Probability.rnDeriv_uniformMeasure`, `TauCeti.Probability.cdf_uniformMeasure`, `TauCeti.Probability.integral_id_uniformMeasure`, `TauCeti.Probability.variance_id_uniformMeasure`, `TauCeti.Probability.integrableExpSet_id_uniformMeasure`, `TauCeti.Probability.mgf_id_uniformMeasure_zero`, `TauCeti.Probability.mgf_id_uniformMeasure`, `TauCeti.Probability.cgf_id_uniformMeasure_zero`, `TauCeti.Probability.cgf_id_uniformMeasure`, `TauCeti.Probability.charFun_uniformMeasure_zero`, `TauCeti.Probability.charFun_uniformMeasure`, `TauCeti.Probability.map_uniformMeasure_affine`, `TauCeti.Probability.isUniform_of_hasLaw_uniformMeasure`, `TauCeti.Probability.measurable_uniformMeasure`, `TauCeti.Probability.measurable_uncurry_uniformPDF`; `Probability/Distributions/Uniform/Support.lean`: `TauCeti.Probability.support_uniformMeasure`.
- §0.4. `Probability/Distributions/Gamma/Measurability.lean`: `TauCeti.Probability.measurable_gammaMeasure`, `TauCeti.Probability.measurable_uncurry_gammaPDF`; `Probability/Distributions/Beta/Measurability.lean`: `TauCeti.Probability.measurable_betaMeasure`, `TauCeti.Probability.measurable_uncurry_betaPDF`; `Probability/Distributions/Exponential/Measurability.lean`: `TauCeti.Probability.measurable_expMeasure`; `Probability/Distributions/Cauchy/Measurability.lean`: `TauCeti.Probability.measurable_cauchyMeasure`, `TauCeti.Probability.measurable_uncurry_cauchyPDF`; `Probability/Distributions/Pareto/Measurability.lean`: `TauCeti.Probability.measurable_paretoMeasure`, `TauCeti.Probability.measurable_uncurry_paretoPDF`; `Probability/Distributions/Bernoulli/Measurability.lean`: `TauCeti.Probability.measurable_bernoulliMeasure`; `Probability/Distributions/Binomial/Measurability.lean`: `TauCeti.Probability.measurable_binomial`; `Probability/Distributions/Geometric/Measurability.lean`: `TauCeti.Probability.measurable_geometricMeasure`; `Probability/Distributions/Poisson/Measurability.lean`: `TauCeti.Probability.measurable_poissonMeasure`.
- §0.5. `Probability/Distributions/Dirac.lean`: `TauCeti.Probability.cdf_dirac`, `TauCeti.Probability.integrableExpSet_dirac`, `TauCeti.Probability.cgf_dirac'`.
- §1.1. `Probability/Cdf.lean`: `MeasureTheory.Measure.cdf_map_natCast_of_neg`, `MeasureTheory.Measure.cdf_map_natCast`, `MeasureTheory.Measure.cdf_map_intCast`.
- §1.2. `Probability/Distributions/Bernoulli/Basic.lean`: `TauCeti.Probability.integral_id_bernoulliMeasure`, `TauCeti.Probability.variance_id_bernoulliMeasure`, `TauCeti.Probability.integral_of_hasLaw_bernoulliMeasure`, `TauCeti.Probability.variance_of_hasLaw_bernoulliMeasure`, `TauCeti.Probability.mgf_id_bernoulliMeasure`, `TauCeti.Probability.cgf_id_bernoulliMeasure`, `TauCeti.Probability.charFun_bernoulliMeasure`; `Probability/Distributions/Bernoulli/Cdf.lean`: `TauCeti.Probability.cdf_bernoulliMeasure`; `Probability/Distributions/Binomial/Basic.lean`: `TauCeti.Probability.variance_id_map_cast_binomial`, `TauCeti.Probability.variance_of_hasLaw_binomial`, `TauCeti.Probability.mgf_id_map_cast_binomial`, `TauCeti.Probability.cgf_id_map_cast_binomial`, `TauCeti.Probability.charFun_map_cast_binomial`, `TauCeti.Probability.binomial_conv_binomial`, `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli`.
- §1.3. `Probability/Distributions/Geometric/Basic.lean`: `TauCeti.Probability.geometricMeasure_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_geometricMeasure_zero`, `TauCeti.Probability.mgf_id_map_cast_geometricMeasure_zero`, `TauCeti.Probability.cgf_id_map_cast_geometricMeasure_zero`, `TauCeti.Probability.charFun_map_cast_geometricMeasure_zero`, `TauCeti.Probability.integral_id_map_cast_geometricMeasure_zero`, `TauCeti.Probability.variance_id_map_cast_geometricMeasure_zero`, `TauCeti.Probability.integral_id_map_cast_geometricMeasure`, `TauCeti.Probability.variance_id_map_cast_geometricMeasure`, `TauCeti.Probability.integral_of_hasLaw_map_cast_geometricMeasure`, `TauCeti.Probability.variance_of_hasLaw_map_cast_geometricMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_geometricMeasure`, `TauCeti.Probability.integrable_exp_mul_id_map_cast_geometricMeasure_iff`, `TauCeti.Probability.mgf_id_map_cast_geometricMeasure`, `TauCeti.Probability.cgf_id_map_cast_geometricMeasure`, `TauCeti.Probability.charFun_map_cast_geometricMeasure`, `TauCeti.Probability.geometricMeasure_real_Iic`, `TauCeti.Probability.geometricMeasure_real_Ici`, `TauCeti.Probability.geometricMeasure_memoryless`, `TauCeti.Probability.geometricMeasure_cond_Ici`; `Probability/Distributions/Geometric/Cdf.lean`: `TauCeti.Probability.cdf_map_cast_geometricMeasure_zero`, `TauCeti.Probability.cdf_map_cast_geometricMeasure`.
- §1.4. `Probability/Distributions/Poisson/Basic.lean`: `TauCeti.Probability.poissonMeasure_zero`, `TauCeti.Probability.integral_id_map_cast_poissonMeasure`, `TauCeti.Probability.variance_id_map_cast_poissonMeasure`, `TauCeti.Probability.integral_of_hasLaw_map_cast_poissonMeasure`, `TauCeti.Probability.variance_of_hasLaw_map_cast_poissonMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure`, `TauCeti.Probability.mgf_id_map_cast_poissonMeasure`, `TauCeti.Probability.cgf_id_map_cast_poissonMeasure`.
- §1.5. `Probability/Distributions/Exponential/Basic.lean`: `ProbabilityTheory.expMeasure_of_nonpos`, `TauCeti.Probability.integral_id_expMeasure`, `TauCeti.Probability.variance_id_expMeasure`, `TauCeti.Probability.integrableExpSet_id_expMeasure`, `TauCeti.Probability.mgf_id_expMeasure`, `TauCeti.Probability.cgf_id_expMeasure`, `TauCeti.Probability.charFun_expMeasure`, `TauCeti.Probability.memoryless_expMeasure`, `TauCeti.Probability.map_sub_cond_expMeasure`, `TauCeti.Probability.map_min_expMeasure`, `TauCeti.Probability.hasLaw_min_expMeasure_of_indepFun`; `Probability/Distributions/Exponential/Support.lean`: `TauCeti.Probability.support_expMeasure`.
- §1.6. `Probability/Distributions/Gamma/Basic.lean`: `TauCeti.Probability.integral_id_gammaMeasure`, `TauCeti.Probability.variance_id_gammaMeasure`, `TauCeti.Probability.integrableExpSet_id_gammaMeasure`, `TauCeti.Probability.not_integrable_exp_mul_id_gammaMeasure`, `TauCeti.Probability.mgf_id_gammaMeasure`, `TauCeti.Probability.cgf_id_gammaMeasure`, `TauCeti.Probability.gammaMeasure_conv_gammaMeasure`, `TauCeti.Probability.gammaMeasure_map_const_mul`, `TauCeti.Probability.ae_pos_gammaMeasure`; `Probability/Distributions/Gamma/CharFun.lean`: `TauCeti.Probability.charFun_gammaMeasure`, `TauCeti.Probability.complexMGF_id_gammaMeasure`; `Probability/Distributions/Gamma/Support.lean`: `TauCeti.Probability.support_gammaMeasure`.
- §1.7. `Probability/Distributions/Beta/Basic.lean`: `TauCeti.Probability.integral_id_betaMeasure`, `TauCeti.Probability.variance_id_betaMeasure`, `TauCeti.Probability.integral_pow_betaMeasure`, `TauCeti.Probability.integrableExpSet_id_betaMeasure`, `TauCeti.Probability.support_betaMeasure`, `TauCeti.Probability.betaMeasure_zero_left`.
- §1.8. `Probability/Distributions/Cauchy/Basic.lean`: `TauCeti.Probability.charFun_cauchyMeasure`, `TauCeti.Probability.cdf_cauchyMeasure_zero_scale`, `TauCeti.Probability.integral_id_cauchyMeasure_zero_scale`, `TauCeti.Probability.variance_id_cauchyMeasure_zero_scale`, `TauCeti.Probability.integrableExpSet_id_cauchyMeasure_zero_scale`, `TauCeti.Probability.mgf_id_cauchyMeasure_zero_scale`, `TauCeti.Probability.cgf_id_cauchyMeasure_zero_scale`, `TauCeti.Probability.cdf_cauchyMeasure_of_scale_ne_zero`, `TauCeti.Probability.integrableExpSet_id_cauchyMeasure`, `TauCeti.Probability.not_integrable_id_cauchyMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_average_cauchyMeasure`.
- §1.9. `Probability/Distributions/Pareto/Basic.lean`: `TauCeti.Probability.cdf_paretoMeasure_eq`, `TauCeti.Probability.integral_id_paretoMeasure`, `TauCeti.Probability.not_integrable_id_paretoMeasure`, `TauCeti.Probability.integrable_id_paretoMeasure_iff`, `TauCeti.Probability.variance_id_paretoMeasure`, `TauCeti.Probability.not_integrable_sq_paretoMeasure`, `TauCeti.Probability.integrable_sq_paretoMeasure_iff`, `TauCeti.Probability.integrableExpSet_id_paretoMeasure`; `Probability/Distributions/Pareto/Support.lean`: `TauCeti.Probability.support_paretoMeasure`.
- §1.10. `Probability/Distributions/Gaussian/Moments.lean`: `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`, `TauCeti.Probability.integral_sub_pow_two_mul_gaussianReal`, `TauCeti.Probability.centralMoment_id_two_mul_add_one_gaussianReal`, `TauCeti.Probability.integral_abs_sub_pow_gaussianReal`; `Probability/Distributions/Gaussian/Cdf.lean`: `TauCeti.Probability.strictMono_cdf_gaussianReal`; `Probability/Cdf.lean`: `MeasureTheory.Measure.support_eq_univ_of_strictMono_cdf`.
- §1.11. `Probability/Distributions/Gamma/Basic.lean`: `TauCeti.Probability.integral_rpow_gammaMeasure`, `TauCeti.Probability.integrable_rpow_gammaMeasure_iff`, `TauCeti.Probability.integral_pow_gammaMeasure`, `TauCeti.Probability.integrable_pow_gammaMeasure`, `TauCeti.Probability.integral_inv_pow_gammaMeasure`, `TauCeti.Probability.integrable_inv_pow_gammaMeasure_iff`; `Probability/Distributions/Beta/Basic.lean`: `TauCeti.Probability.integral_rpow_mul_one_sub_rpow_betaMeasure`, `TauCeti.Probability.integrable_rpow_mul_one_sub_rpow_betaMeasure_iff`, `TauCeti.Probability.integrable_pow_betaMeasure`; `Probability/Distributions/Pareto/Basic.lean`: `TauCeti.Probability.integral_rpow_paretoMeasure`, `TauCeti.Probability.integrable_rpow_paretoMeasure_iff`.
- §1.12. `Probability/GeneratingFunction.lean`: `TauCeti.Probability.pgf_def`, `TauCeti.Probability.pgf_exp`, `TauCeti.Probability.IndepFun.pgf_add`, `TauCeti.Probability.IndepFun.pgf_add_of_abs_le_one`, `TauCeti.Probability.iIndepFun.pgf_sum`, `TauCeti.Probability.iIndepFun.pgf_sum_of_abs_le_one`, `TauCeti.Probability.iteratedDeriv_pgf_zero`, `TauCeti.Probability.measure_eq_of_pgf_eqOn`, `TauCeti.Probability.iteratedDeriv_pgf_one`, `TauCeti.Probability.tendsto_iteratedDeriv_pgf_nhdsLT_one_of_integrable_pow_natCast`; `Probability/Distributions/Bernoulli/Basic.lean`: `TauCeti.Probability.pgf_bernoulliMeasure`; `Probability/Distributions/Binomial/Basic.lean`: `TauCeti.Probability.pgf_binomial`; `Probability/Distributions/Poisson/Basic.lean`: `TauCeti.Probability.pgf_poissonMeasure`; `Probability/Distributions/Geometric/Basic.lean`: `TauCeti.Probability.integrable_pow_geometricMeasure_iff`, `TauCeti.Probability.pgf_geometricMeasure`, `TauCeti.Probability.pgf_geometricMeasure_zero`.
- §2.1. `Analysis/SpecialFunctions/IncompleteGamma.lean`: `TauCeti.lowerIncompleteGamma_eq_integral`, `TauCeti.lowerIncompleteGamma_eq_zero_of_nonpos_left`, `TauCeti.lowerIncompleteGamma_eq_zero_of_nonpos_right`, `TauCeti.regularizedGamma_eq_div`, `TauCeti.regularizedGamma_eq_zero_of_nonpos_left`, `TauCeti.intervalIntegrable_rpow_mul_exp_neg`, `TauCeti.tendsto_lowerIncompleteGamma_atTop`, `TauCeti.tendsto_regularizedGamma_atTop`, `TauCeti.continuous_lowerIncompleteGamma`, `TauCeti.continuous_regularizedGamma`, `TauCeti.lowerIncompleteGamma_monotone`, `TauCeti.regularizedGamma_monotone`, `TauCeti.strictMonoOn_lowerIncompleteGamma`, `TauCeti.strictMonoOn_regularizedGamma`, `TauCeti.lowerIncompleteGamma_add_one`, `TauCeti.regularizedGamma_add_one`, `TauCeti.hasDerivAt_lowerIncompleteGamma`, `TauCeti.hasDerivAt_regularizedGamma`, `TauCeti.regularizedGamma_nonneg`, `TauCeti.regularizedGamma_le_one`, `TauCeti.regularizedGamma_pos_iff`, `TauCeti.regularizedGamma_one`.
- §2.2. `Analysis/SpecialFunctions/IncompleteBeta.lean`: `TauCeti.regularizedIncompleteBeta_def_of_pos`, `TauCeti.regularizedIncompleteBeta_def_of_mem_Icc`, `TauCeti.regularizedIncompleteBeta_zero_left`, `TauCeti.regularizedIncompleteBeta_eq_zero_of_neg_left`, `TauCeti.regularizedIncompleteBeta_eq_zero_of_nonpos_right`, `TauCeti.continuous_regularizedIncompleteBeta`, `TauCeti.regularizedIncompleteBeta_monotone`, `TauCeti.strictMonoOn_regularizedIncompleteBeta`, `TauCeti.regularizedIncompleteBeta_nonneg`, `TauCeti.regularizedIncompleteBeta_le_one`, `TauCeti.regularizedIncompleteBeta_eq_zero_of_nonpos`, `TauCeti.regularizedIncompleteBeta_eq_zero_of_neg`, `TauCeti.regularizedIncompleteBeta_eq_one_of_one_le`, `TauCeti.hasDerivAt_regularizedIncompleteBeta`, `TauCeti.regularizedIncompleteBeta_symm`, `TauCeti.regularizedIncompleteBeta_add_one_left`, `TauCeti.regularizedIncompleteBeta_add_one_right`, `TauCeti.regularizedIncompleteBeta_one_right`, `TauCeti.regularizedIncompleteBeta_one_left`; `Analysis/SpecialFunctions/Beta.lean`: `TauCeti.intervalIntegrable_rpow_mul_one_sub_rpow`, `TauCeti.integral_rpow_mul_one_sub_rpow`.
- §2.3. `Analysis/SpecialFunctions/Erf.lean`: `TauCeti.Real.erf_def`, `TauCeti.Real.erfc_def`, `TauCeti.Real.erf_neg`, `TauCeti.Real.erf_zero`, `TauCeti.Real.hasDerivAt_erf`, `TauCeti.Real.hasDerivAt_erfc`, `TauCeti.Real.strictMono_erf`, `TauCeti.Real.strictAnti_erfc`, `TauCeti.Real.tendsto_erf_atTop`, `TauCeti.Real.tendsto_erf_atBot`, `TauCeti.Real.tendsto_erfc_atTop`, `TauCeti.Real.tendsto_erfc_atBot`; `Analysis/SpecialFunctions/IncompleteGamma.lean`: `TauCeti.Real.erf_eq_regularizedGamma_half_sq`.
- §2.4. `Probability/Distributions/Gaussian/Cdf.lean`: `TauCeti.Probability.cdf_gaussianReal_eq`, `TauCeti.Probability.cdf_gaussianReal_zero`; `Probability/Distributions/Gamma/Cdf.lean`: `TauCeti.Probability.cdf_gammaMeasure_eq`; `Probability/Distributions/Beta/Cdf.lean`: `TauCeti.Probability.cdf_betaMeasure_eq`; `Probability/Distributions/Binomial/Tail.lean`: `TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta`, `TauCeti.Probability.binomial_cumulative_eq_regularizedIncompleteBeta`; `Probability/Distributions/Poisson/Tail.lean`: `TauCeti.Probability.poissonMeasure_tail_eq_regularizedGamma`, `TauCeti.Probability.poissonMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_poissonMeasure`.
- §3.1. `Probability/Distributions/Laplace/Basic.lean`: `TauCeti.Probability.laplacePDFReal_of_pos`, `TauCeti.Probability.laplacePDFReal_of_nonpos`, `TauCeti.Probability.laplaceMeasure_of_nonpos`, `TauCeti.Probability.laplaceMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_laplaceMeasure`, `TauCeti.Probability.pdf_eq_laplacePDF_of_hasLaw_laplaceMeasure`, `TauCeti.Probability.rnDeriv_laplaceMeasure`, `TauCeti.Probability.measurable_laplaceMeasure`, `TauCeti.Probability.isProbabilityMeasure_laplaceMeasure`, `TauCeti.Probability.cdf_laplaceMeasure_eq`, `TauCeti.Probability.integral_id_laplaceMeasure`, `TauCeti.Probability.variance_id_laplaceMeasure`, `TauCeti.Probability.integrableExpSet_id_laplaceMeasure`, `TauCeti.Probability.mgf_id_laplaceMeasure`, `TauCeti.Probability.cgf_id_laplaceMeasure`, `TauCeti.Probability.charFun_laplaceMeasure`; `Probability/Distributions/Laplace/Support.lean`: `TauCeti.Probability.support_laplaceMeasure`.
- §3.2. `Probability/Distributions/LogNormal/Basic.lean`: `TauCeti.Probability.logNormalMeasure_map_exp`, `TauCeti.Probability.isProbabilityMeasure_logNormalMeasure`, `TauCeti.Probability.ae_pos_logNormalMeasure`, `TauCeti.Probability.measurable_logNormalMeasure`, `TauCeti.Probability.logNormalPDFReal_of_pos`, `TauCeti.Probability.logNormalPDFReal_of_nonpos`, `TauCeti.Probability.logNormalMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_logNormalMeasure`, `TauCeti.Probability.pdf_eq_logNormalPDF_of_hasLaw_logNormalMeasure`, `TauCeti.Probability.rnDeriv_logNormalMeasure`, `TauCeti.Probability.cdf_logNormalMeasure_eq`, `TauCeti.Probability.integrableExpSet_id_logNormalMeasure`, `TauCeti.Probability.not_integrable_exp_mul_logNormalMeasure`, `TauCeti.Probability.support_logNormalMeasure`, `TauCeti.Probability.logNormalMeasure_zero_var`, `TauCeti.Probability.cdf_logNormalMeasure_zero_var`, `TauCeti.Probability.integral_id_logNormalMeasure_zero_var`, `TauCeti.Probability.variance_id_logNormalMeasure_zero_var`, `TauCeti.Probability.integrableExpSet_id_logNormalMeasure_zero_var`, `TauCeti.Probability.mgf_id_logNormalMeasure_zero_var`, `TauCeti.Probability.cgf_id_logNormalMeasure_zero_var`, `TauCeti.Probability.charFun_logNormalMeasure_zero_var`, `TauCeti.Probability.integrable_rpow_logNormalMeasure`, `TauCeti.Probability.integral_rpow_logNormalMeasure`, `TauCeti.Probability.integral_pow_logNormalMeasure`, `TauCeti.Probability.integral_id_logNormalMeasure`, `TauCeti.Probability.variance_id_logNormalMeasure`.
- §3.3. `Probability/Distributions/LogNormal/MomentIndeterminacy.lean`: `TauCeti.Probability.logNormalMomentPerturbationPDFReal`, `TauCeti.Probability.logNormalMomentPerturbationPDFReal_apply`, `TauCeti.Probability.logNormalMomentPerturbation_eq_withDensity_logNormal`, `TauCeti.Probability.logNormalMomentPerturbation_eq_withDensity`, `TauCeti.Probability.logNormalMomentPerturbationPDFReal_nonneg`, `TauCeti.Probability.isProbabilityMeasure_logNormalMomentPerturbation`, `TauCeti.Probability.measurable_logNormalMomentPerturbation`, `TauCeti.Probability.injOn_logNormalMomentPerturbation`, `TauCeti.Probability.integrable_pow_logNormalMomentPerturbation`, `TauCeti.Probability.integral_pow_logNormalMomentPerturbation`.
- §3.4. `Probability/Distributions/Weibull/Basic.lean`: `TauCeti.Probability.weibullPDFReal_of_pos`, `TauCeti.Probability.weibullPDFReal_of_nonpos`, `TauCeti.Probability.weibullPDFReal_of_shape_nonpos`, `TauCeti.Probability.weibullPDFReal_of_scale_nonpos`, `TauCeti.Probability.weibullMeasure_of_not_pos`, `TauCeti.Probability.weibullMeasure_def`, `TauCeti.Probability.hasPDF_of_hasLaw_weibullMeasure`, `TauCeti.Probability.pdf_eq_weibullPDF_of_hasLaw_weibullMeasure`, `TauCeti.Probability.rnDeriv_weibullMeasure`, `TauCeti.Probability.measurable_weibullMeasure`, `TauCeti.Probability.isProbabilityMeasure_weibullMeasure_iff`, `TauCeti.Probability.cdf_weibullMeasure_eq`, `TauCeti.Probability.integrable_rpow_weibullMeasure_iff`, `TauCeti.Probability.integral_rpow_weibullMeasure`, `TauCeti.Probability.integral_pow_weibullMeasure`, `TauCeti.Probability.variance_id_weibullMeasure`, `TauCeti.Probability.weibullMeasure_one_eq_expMeasure`, `TauCeti.Probability.weibullPDFReal_pos_iff`; `Probability/Distributions/Weibull/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_weibullMeasure`, `TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_one_lt`, `TauCeti.Probability.hasSum_mgf_id_weibullMeasure_of_one_lt`, `TauCeti.Probability.cgf_id_weibullMeasure_of_one_lt`, `TauCeti.Probability.integrableExpSet_id_weibullMeasure_one`, `TauCeti.Probability.mgf_id_weibullMeasure_one`, `TauCeti.Probability.cgf_id_weibullMeasure_one`, `TauCeti.Probability.integrableExpSet_id_weibullMeasure_of_lt_one`.
- §3.5. `Probability/Distributions/ChiSquared/Basic.lean`: `TauCeti.Probability.chiSquaredMeasure_zero`, `TauCeti.Probability.chiSquaredMeasure_eq_gammaMeasure`, `TauCeti.Probability.chiSquaredMeasure_of_neg`, `TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure`, `TauCeti.Probability.measurable_chiSquaredMeasure`, `TauCeti.Probability.chiSquaredPDFReal_of_nonneg`, `TauCeti.Probability.chiSquaredMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_chiSquaredMeasure`, `TauCeti.Probability.pdf_eq_chiSquaredPDF_of_hasLaw_chiSquaredMeasure`, `TauCeti.Probability.rnDeriv_chiSquaredMeasure`, `TauCeti.Probability.cdf_chiSquaredMeasure_eq`, `TauCeti.Probability.integral_id_chiSquaredMeasure`, `TauCeti.Probability.variance_id_chiSquaredMeasure`, `TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure`, `TauCeti.Probability.mgf_id_chiSquaredMeasure`, `TauCeti.Probability.cgf_id_chiSquaredMeasure`, `TauCeti.Probability.charFun_chiSquaredMeasure`, `TauCeti.Probability.cdf_chiSquaredMeasure_zero`, `TauCeti.Probability.integral_id_chiSquaredMeasure_zero`, `TauCeti.Probability.variance_id_chiSquaredMeasure_zero`, `TauCeti.Probability.integrableExpSet_id_chiSquaredMeasure_zero`, `TauCeti.Probability.mgf_id_chiSquaredMeasure_zero`, `TauCeti.Probability.cgf_id_chiSquaredMeasure_zero`, `TauCeti.Probability.charFun_chiSquaredMeasure_zero`, `TauCeti.Probability.chiSquaredMeasure_conv_chiSquaredMeasure`, `TauCeti.Probability.chiSquaredMeasure_two`; `Probability/Distributions/ChiSquared/Support.lean`: `TauCeti.Probability.support_chiSquaredMeasure`.
- §3.6. `Probability/Distributions/InverseGamma/Basic.lean`: `TauCeti.Probability.inverseGammaMeasure_of_pos`, `TauCeti.Probability.inverseGammaMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_inverseGammaMeasure`, `TauCeti.Probability.ae_pos_inverseGammaMeasure`, `TauCeti.Probability.measurable_inverseGammaMeasure`, `TauCeti.Probability.inverseGammaPDFReal_of_pos`, `TauCeti.Probability.inverseGammaPDFReal_of_nonpos`, `TauCeti.Probability.inverseGammaMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_inverseGammaMeasure`, `TauCeti.Probability.pdf_eq_inverseGammaPDF_of_hasLaw_inverseGammaMeasure`, `TauCeti.Probability.rnDeriv_inverseGammaMeasure`; `Probability/Distributions/InverseGamma/Cdf.lean`: `TauCeti.Probability.cdf_inverseGammaMeasure_eq`; `Probability/Distributions/InverseGamma/Moments.lean`: `TauCeti.Probability.integrable_rpow_inverseGammaMeasure_iff`, `TauCeti.Probability.integral_rpow_inverseGammaMeasure`, `TauCeti.Probability.integral_id_inverseGammaMeasure`, `TauCeti.Probability.not_integrable_id_inverseGammaMeasure`, `TauCeti.Probability.variance_id_inverseGammaMeasure`, `TauCeti.Probability.not_integrable_sq_inverseGammaMeasure`, `TauCeti.Probability.integrableExpSet_id_inverseGammaMeasure`.
- §3.7. `Probability/Distributions/StudentT/Basic.lean`: `TauCeti.Probability.studentTPDFReal_of_pos`, `TauCeti.Probability.studentTPDFReal_of_nonpos`, `TauCeti.Probability.studentTMeasure_of_nonpos`, `TauCeti.Probability.studentTMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_studentTMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_studentTMeasure`, `TauCeti.Probability.pdf_eq_studentTPDF_of_hasLaw_studentTMeasure`, `TauCeti.Probability.rnDeriv_studentTMeasure`, `TauCeti.Probability.measurable_studentTMeasure`, `TauCeti.Probability.studentTMeasure_one`, `TauCeti.Probability.studentTPDFReal_pos`; `Probability/Distributions/StudentT/Moments.lean`: `TauCeti.Probability.integrable_id_studentTMeasure_iff`, `TauCeti.Probability.integral_id_studentTMeasure`, `TauCeti.Probability.integrable_sq_studentTMeasure_iff`, `TauCeti.Probability.not_integrable_sq_studentTMeasure`, `TauCeti.Probability.variance_id_studentTMeasure`, `TauCeti.Probability.integrableExpSet_id_studentTMeasure`; `Probability/Distributions/StudentT/Cdf.lean`: `TauCeti.Probability.cdf_studentTMeasure_eq`, `TauCeti.Probability.strictMono_cdf_studentTMeasure`.
- §3.8. `Probability/Distributions/FisherSnedecor/Basic.lean`: `TauCeti.Probability.fisherSnedecorPDFReal_of_pos`, `TauCeti.Probability.fisherSnedecorPDFReal_of_nonpos`, `TauCeti.Probability.fisherSnedecorMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_fisherSnedecorMeasure_iff`, `TauCeti.Probability.fisherSnedecorMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_fisherSnedecorMeasure`, `TauCeti.Probability.pdf_eq_fisherSnedecorPDF_of_hasLaw_fisherSnedecorMeasure`, `TauCeti.Probability.rnDeriv_fisherSnedecorMeasure`, `TauCeti.Probability.support_fisherSnedecorMeasure`; `Probability/Distributions/FisherSnedecor/Cdf.lean`: `TauCeti.Probability.cdf_fisherSnedecorMeasure_eq`; `Probability/Distributions/FisherSnedecor/Measurability.lean`: `TauCeti.Probability.measurable_fisherSnedecorMeasure`; `Probability/Distributions/FisherSnedecor/Moments.lean`: `TauCeti.Probability.integrable_id_fisherSnedecorMeasure_iff`, `TauCeti.Probability.integral_id_fisherSnedecorMeasure`, `TauCeti.Probability.integrable_sq_fisherSnedecorMeasure_iff`, `TauCeti.Probability.variance_id_fisherSnedecorMeasure`, `TauCeti.Probability.integrableExpSet_id_fisherSnedecorMeasure`.
- §3.9. `Probability/Distributions/NegativeBinomial/Basic.lean`: `TauCeti.Probability.isProbabilityMeasure_negativeBinomialMeasure`, `TauCeti.Probability.negativeBinomialMeasure_eq_sum_dirac`, `TauCeti.Probability.negativeBinomialMeasure_real_singleton`, `TauCeti.Probability.negativeBinomialWeightReal_eq_gamma`, `TauCeti.Probability.negativeBinomialMeasure_zero`, `TauCeti.Probability.negativeBinomialMeasure_eq_dirac_of_successProbability_eq_one`, `TauCeti.Probability.negativeBinomialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.geometricMeasure_eq_negativeBinomialMeasure_one`, `TauCeti.Probability.negativeBinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.negativeBinomialMeasure_conv_negativeBinomialMeasure`, `TauCeti.Probability.integrable_pow_negativeBinomialMeasure_iff`, `TauCeti.Probability.pgf_negativeBinomialMeasure`, `TauCeti.Probability.pgf_negativeBinomialMeasure_zero`; `Probability/Distributions/NegativeBinomial/Measurability.lean`: `TauCeti.Probability.measurable_negativeBinomialMeasure`; `Probability/Distributions/NegativeBinomial/Transforms.lean`: `TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.mgf_id_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.cgf_id_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.charFun_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_zero`; `Probability/Distributions/NegativeBinomial/Cdf.lean`: `TauCeti.Probability.negativeBinomialMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_of_neg`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_zero`; `Probability/GeneratingFunction.lean`: `TauCeti.Probability.pgf`.
- §3.10. `Probability/Distributions/Hypergeometric/Basic.lean`: `TauCeti.Probability.hypergeometricWeight_of_le`, `TauCeti.Probability.hypergeometricWeight_of_not_le`, `TauCeti.Probability.hypergeometricMeasure_eq_sum_dirac`, `TauCeti.Probability.hypergeometricMeasure_real_singleton`, `TauCeti.Probability.hypergeometricMeasure_eq_zero_of_invalid`, `TauCeti.Probability.isProbabilityMeasure_hypergeometricMeasure`, `TauCeti.Probability.measurable_hypergeometricMeasure`, `TauCeti.Probability.hypergeometricMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.integral_id_map_cast_hypergeometricMeasure`, `TauCeti.Probability.variance_id_map_cast_hypergeometricMeasure`, `TauCeti.Probability.hypergeometricMeasure_real_Iic_eq_sum`, `TauCeti.Probability.mgf_id_map_cast_hypergeometricMeasure`, `TauCeti.Probability.charFun_map_cast_hypergeometricMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_hypergeometricMeasure`; `Probability/Distributions/Hypergeometric/Cdf.lean`: `TauCeti.Probability.cdf_map_cast_hypergeometricMeasure`; `Probability/Distributions/Hypergeometric/Symmetry.lean`: `TauCeti.Probability.hypergeometricMeasure_comm`; `Probability/Distributions/Hypergeometric/Limit.lean`: `TauCeti.Probability.tendsto_hypergeometricMeasure_real_singleton`.
- §4.1. `Probability/Distributions/Gaussian/ChiSquared.lean`: `TauCeti.Probability.gaussianReal_map_sq`, `TauCeti.Probability.iIndepFun.hasLaw_sum_sq_gaussian`, `TauCeti.Probability.map_sum_sq_pi_gaussianReal`; `Probability/Distributions/ChiSquared/Basic.lean`: `TauCeti.Probability.chiSquaredMeasure`.
- §4.2. `Probability/Distributions/StudentT/ChiSquared.lean`: `TauCeti.Probability.map_div_sqrt_chiSquaredMeasure`, `TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared`, `TauCeti.Probability.studentTMeasure_map_sq`; `Probability/Distributions/FisherSnedecor/ChiSquared.lean`: `TauCeti.Probability.map_scaled_div_chiSquaredMeasure`, `TauCeti.Probability.hasLaw_fisherSnedecor_of_chiSquared`, `TauCeti.Probability.map_scaled_div_gammaMeasure`, `TauCeti.Probability.hasLaw_fisherSnedecor_of_gammaMeasure`; `Probability/Distributions/Gaussian/Cauchy.lean`: `TauCeti.Probability.map_div_prod_gaussianReal`, `TauCeti.Probability.hasLaw_ratio_gaussian_cauchy`; `Probability/Distributions/StudentT/Basic.lean`: `TauCeti.Probability.studentTMeasure`; `Probability/Distributions/FisherSnedecor/Basic.lean`: `TauCeti.Probability.fisherSnedecorMeasure`.
- §4.3. `Probability/Distributions/Gamma/Beta.lean`: `TauCeti.Probability.map_div_add_prod_gammaMeasure`, `TauCeti.Probability.map_div_add_gammaMeasure`, `TauCeti.Probability.indepFun_div_add_gammaMeasure`, `TauCeti.Probability.hasLaw_div_add_prod_gammaMeasure_of_indepFun`, `TauCeti.Probability.hasLaw_div_add_gammaMeasure_of_indepFun`, `TauCeti.Probability.indepFun_div_add_of_hasLaw_gammaMeasure`, `TauCeti.Probability.betaGammaMap_injOn`, `TauCeti.Probability.det_fderivBetaGammaMap`, `TauCeti.Probability.map_betaGammaMap_withDensity`.
- §4.4. `Probability/Distributions/Sums.lean`: `TauCeti.Probability.map_sub_prod_expMeasure`, `TauCeti.Probability.IndepFun.hasLaw_sub_expMeasure`, `TauCeti.Probability.map_sum_pi_geometricMeasure`, `TauCeti.Probability.iIndepFun.hasLaw_sum_geometricMeasure`, `TauCeti.Probability.map_sum_pi_expMeasure`, `TauCeti.Probability.iIndepFun.hasLaw_sum_expMeasure`; `Probability/Distributions/Gamma/Sum.lean`: `ProbabilityTheory.iIndepFun.hasLaw_sum_gammaMeasure`; `Probability/Distributions/Laplace/Basic.lean`: `TauCeti.Probability.laplaceMeasure`; `Probability/Distributions/NegativeBinomial/Basic.lean`: `TauCeti.Probability.negativeBinomialMeasure`.
- §4.5. `Probability/Distributions/Gamma/Poisson.lean`: `TauCeti.Probability.bind_gammaMeasure_poissonMeasure`, `TauCeti.Probability.bind_gammaMeasure_poissonMeasure_mul_toNNReal`.
- §4.6. `Probability/Distributions/Relations.lean`: `TauCeti.Probability.cdf_max_indep`, `TauCeti.Probability.cdf_min_indep`, `TauCeti.Probability.cdf_max_iid`, `TauCeti.Probability.cdf_min_iid`; `Probability/Distributions/Exponential/Basic.lean`: `TauCeti.Probability.hasLaw_min_iid_expMeasure`; `Data/Fin/Tuple/OrderStatistic.lean`: `TauCeti.measurable_orderStatistic`, `TauCeti.orderStatistic_le_iff`, `TauCeti.orderStatistic_zero`, `TauCeti.orderStatistic_last`; `Probability/Distributions/OrderStatistic/Basic.lean`: `TauCeti.Probability.cdf_map_orderStatistic_pi`, `TauCeti.Probability.measureReal_setOf_orderStatistic_le_iid`, `TauCeti.Probability.cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta`, `TauCeti.Probability.map_orderStatistic_pi_uniformMeasure`, `TauCeti.Probability.hasLaw_orderStatistic_iid_uniformMeasure`; `Probability/Distributions/OrderStatistic/Joint.lean`: `TauCeti.Probability.map_orderStatistics_pi_uniformMeasure`, `TauCeti.Probability.hasLaw_orderStatistics_iid_uniformMeasure`; `Probability/Distributions/Uniform/Basic.lean`: `TauCeti.Probability.uniformMeasure`.
- §5.1. `Probability/Moments/Covariance.lean`: `TauCeti.covMatrix_apply`, `TauCeti.isHermitian_covMatrix`, `TauCeti.posSemidef_covMatrix`, `TauCeti.covarianceBilin_eq_covMatrix`; `Probability/Distributions/Gaussian/Multivariate.lean`: `TauCeti.Probability.covMatrix_multivariateGaussian`, `TauCeti.Probability.integral_eval_multivariateGaussian`, `TauCeti.Probability.integral_of_hasLaw_multivariateGaussian`.
- §5.2. `Probability/Distributions/Gaussian/Density.lean`: `TauCeti.Probability.multivariateGaussian_eq_withDensity`, `TauCeti.Probability.stdGaussian_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_multivariateGaussian`, `TauCeti.Probability.pdf_eq_multivariateGaussianPDF_of_hasLaw_multivariateGaussian`, `TauCeti.Probability.rnDeriv_multivariateGaussian`, `TauCeti.Probability.multivariateGaussianPDFReal_pos`, `TauCeti.Probability.multivariateGaussianPDFReal_nonneg`, `TauCeti.Probability.measurable_multivariateGaussianPDF`, `TauCeti.Probability.mutuallySingular_multivariateGaussian_volume`, `TauCeti.Probability.rnDeriv_multivariateGaussian_of_not_posDef`, `TauCeti.Probability.support_multivariateGaussian`, `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian`, `TauCeti.Probability.support_stdGaussian`; `Probability/Distributions/Gaussian/Pi.lean`: `TauCeti.Probability.pi_gaussianReal_eq_withDensity`; `Probability/Distributions/Gaussian/Multivariate.lean`: `TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`; `Analysis/Matrix/Sqrt.lean`: `Matrix.PosSemidef.range_toEuclideanLin_sqrt`.
- §5.3. `Probability/Distributions/Gaussian/Affine.lean`: `TauCeti.Probability.map_affine_multivariateGaussian`, `TauCeti.Probability.map_add_smul_multivariateGaussian`, `TauCeti.Probability.map_comp_multivariateGaussian`; `Probability/Distributions/Gaussian/LowDimension.lean`: `EuclideanSpace.multivariateGaussian_eq_map_single`; `Probability/Distributions/Gaussian/Transforms.lean`: `TauCeti.Probability.integrableExpSet_inner_multivariateGaussian`, `TauCeti.Probability.map_inner_multivariateGaussian`, `TauCeti.Probability.mgf_inner_multivariateGaussian`, `TauCeti.Probability.cgf_inner_multivariateGaussian`; `Probability/Distributions/Gaussian/QuadraticForm.lean`: `TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_multivariateGaussian_iff`, `TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian_sqrt`, `TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian`, `TauCeti.Probability.cgf_inner_toEuclideanLin_multivariateGaussian`, `TauCeti.Probability.mem_integrableExpSet_inner_toEuclideanLin_stdGaussian_iff`, `TauCeti.Probability.mgf_inner_toEuclideanLin_stdGaussian`; `Analysis/Matrix/Sqrt.lean`: `Matrix.PosSemidef.det_one_sub_smul_sqrt_mul_mul_sqrt_eq_det_one_sub_smul_mul`; `Probability/Distributions/Gaussian/ChiSquared.lean`: `TauCeti.Probability.mgf_mul_sq_gaussianReal`; `Probability/Distributions/Gaussian/MixedMoments.lean`: `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian`, `TauCeti.Probability.integral_mul_mul_mul_sub_multivariateGaussian`, `TauCeti.Probability.integral_mul_mul_mul_multivariateGaussian`, `ProbabilityTheory.HasLaw.integral_mul_mul_mul_sub_multivariateGaussian`; `Probability/Distributions/Gaussian/OddMoments.lean`: `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd`, `TauCeti.Probability.integral_prod_pow_sub_multivariateGaussian_eq_zero_of_odd`; `Order/Partition/Pairing.lean`: `Finpartition.IsPairing`; `Combinatorics/Enumerative/PerfectMatching/Pairing.lean`: `Finpartition.IsPairing.toPerfectMatching`; `Probability/Distributions/Gaussian/Independence.lean`: `TauCeti.Probability.indepFun_matrix_multivariateGaussian_iff`, `TauCeti.Probability.indepFun_matrix_of_hasLaw_multivariateGaussian_iff`; `Probability/Distributions/Gaussian/Projection.lean`: `TauCeti.Probability.iIndepFun_orthogonalProjectionOnto_stdGaussian`, `Submodule.map_orthogonalProjectionOnto_stdGaussian`, `Submodule.map_norm_sq_starProjection_stdGaussian`, `TauCeti.Probability.map_norm_sq_orthogonalProjectionOnto_stdGaussian_pi`, `ProbabilityTheory.HasLaw.iIndepFun_norm_sq_orthogonalProjectionOnto_stdGaussian`, `ProbabilityTheory.HasLaw.pi_norm_sq_orthogonalProjectionOnto_stdGaussian`; `Combinatorics/Enumerative/PerfectMatching.lean`: `TauCeti.PerfectMatching`.
- §5.4. `Analysis/Matrix/CovariancePseudoInverse.lean`: `Matrix.covariancePseudoInverse_of_posSemidef`, `Matrix.covariancePseudoInverse_of_not_posSemidef`, `Matrix.covariancePseudoInverse_zero`, `Matrix.posSemidef_covariancePseudoInverse`, `Matrix.commute_covariancePseudoInverse`, `Matrix.covariancePseudoInverse_mul_self_mul`, `Matrix.isHermitian_mul_covariancePseudoInverse`, `Matrix.isHermitian_covariancePseudoInverse_mul`, `Matrix.mul_covariancePseudoInverse_mul`, `Matrix.isMoorePenroseInverse_covariancePseudoInverse`, `Matrix.eq_covariancePseudoInverse_of_penrose`, `Matrix.toEuclideanLin_covariancePseudoInverse`, `Matrix.toEuclideanLin_mul_covariancePseudoInverse`, `Matrix.toEuclideanLin_covariancePseudoInverse_mul`, `Matrix.covariancePseudoInverse_of_posDef`, `Matrix.tendsto_inv_sq_add_smul_mul`, `Matrix.measurable_covariancePseudoInverse`; `Analysis/InnerProductSpace/MoorePenrose.lean`: `LinearMap.moorePenroseInverse`; `Analysis/Matrix/PosSemidef/Block.lean`: `Matrix.PosSemidef.ker_toEuclideanLin_toBlocks₂₂_le`, `Matrix.PosSemidef.range_toEuclideanLin_toBlocks₂₁_le`; `Analysis/Matrix/SchurComplement.lean`: `Matrix.PosSemidef.toBlocks₁₂_mul_covariancePseudoInverse_mul`, `Matrix.PosSemidef.schur_complement₂₂_covariancePseudoInverse`; `LinearAlgebra/Matrix/PosSemidef.lean`: `Matrix.PosSemidef.toBlocks₁₂_eq_zero_of_toBlocks₂₂_eq_zero`; `Probability/Distributions/Gaussian/Conditional/Basic.lean`: `EuclideanSpace.gaussianCondMean_def`, `Matrix.gaussianCondCov_def`, `EuclideanSpace.gaussianCondKernel_apply`, `EuclideanSpace.isMarkovKernel_gaussianCondKernel`, `Matrix.PosSemidef.gaussianCondCov`, `Matrix.PosDef.gaussianCondCov`, `EuclideanSpace.gaussianCondMean_of_posDef`, `Matrix.gaussianCondCov_of_posDef`, `ProbabilityTheory.HasLaw.indepFun_gaussianResidual`, `EuclideanSpace.map_snd_fst_multivariateGaussian`, `TauCeti.Probability.condDistrib_multivariateGaussian`, `EuclideanSpace.gaussianCondKernel_of_submatrix_eq_zero`; `Probability/Distributions/Gaussian/Conditional/Measurability.lean`: `EuclideanSpace.measurable_gaussianCondKernel`, `EuclideanSpace.measurable_gaussianCondMean`, `Matrix.measurable_gaussianCondCov`; `Probability/Distributions/Gaussian/Multivariate.lean`: `TauCeti.Probability.indepFun_sumEquivProd_multivariateGaussian_iff`; `Probability/Distributions/Gaussian/LowDimension.lean`: `EuclideanSpace.gaussianCondMean_apply_of_unique`, `EuclideanSpace.gaussianCondMean_apply_of_unique_of_posSemidef`, `Matrix.gaussianCondCov_apply_of_unique_of_posSemidef`, `EuclideanSpace.gaussianCondKernel_apply_of_unique_of_posSemidef`, `TauCeti.Probability.condDistrib_multivariateGaussian_of_unique`.
- §5.5. `Probability/Distributions/Multinomial/Basic.lean`: `TauCeti.Probability.multinomialMeasure_def`, `TauCeti.Probability.multinomialMeasure_real_singleton`, `TauCeti.Probability.multinomialMeasure_singleton`, `TauCeti.Probability.isProbabilityMeasure_multinomialMeasure`, `TauCeti.Probability.multinomialMeasure_zero`, `TauCeti.Probability.multinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.multinomialMeasure_sum_eq`, `TauCeti.Probability.integrable_multinomialMeasure`, `TauCeti.Probability.integral_multinomialMeasure`, `TauCeti.Probability.measurableEmbedding_multinomialToEuclidean`; `Probability/Distributions/Multinomial/Marginal.lean`: `Convexity.StdSimplex.multinomialCellProbability`, `TauCeti.Probability.map_eval_multinomialMeasure`; `Probability/Distributions/Multinomial/Aggregation.lean`: `TauCeti.Probability.map_funOnFinite_map_multinomialMeasure`; `Probability/Distributions/Multinomial/Moments.lean`: `TauCeti.Probability.integral_id_map_multinomialToEuclidean_multinomialMeasure`, `TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_multinomialMeasure`, `TauCeti.Probability.covariance_cast_apply_multinomialMeasure`, `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_multinomialMeasure`, `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_multinomialMeasure`; `Probability/Distributions/Multinomial/Transforms.lean`: `TauCeti.Probability.charFun_map_multinomialToEuclidean_multinomialMeasure`, `TauCeti.Probability.mgf_inner_multinomial`, `TauCeti.Probability.integrableExpSet_inner_multinomial`, `TauCeti.Probability.cgf_inner_multinomial`; `Probability/Moments/Covariance.lean`: `TauCeti.covMatrix`.
- §5.6. `Probability/Distributions/Dirichlet/Basic.lean`: `TauCeti.Probability.dirichletMeasure_of_pos`, `TauCeti.Probability.dirichletMeasure_eq_zero_of_invalid`, `TauCeti.Probability.isProbabilityMeasure_dirichletMeasure`, `TauCeti.Probability.isProbabilityMeasure_dirichletMeasure_iff`, `TauCeti.Probability.dirichletNormalize_eq_zero_of_sum_eq_zero`, `TauCeti.Probability.ae_pos_dirichletMeasure`, `TauCeti.Probability.ae_mem_stdSimplex_dirichletMeasure`, `TauCeti.Probability.ae_sum_eq_one_dirichletMeasure`, `TauCeti.Probability.dirichletMeasure_eq_dirac_of_card_eq_one`; `Probability/Distributions/Gamma/Pi.lean`: `TauCeti.Probability.ae_pos_sum_pi_gammaMeasure`; `Probability/Distributions/Dirichlet/Moments.lean`: `TauCeti.Probability.integral_eval_dirichletMeasure`, `TauCeti.Probability.variance_eval_dirichletMeasure`, `TauCeti.Probability.covariance_eval_dirichletMeasure_of_ne`, `TauCeti.Probability.integral_id_dirichletMeasure`, `TauCeti.Probability.covMatrix_dirichletMeasure`, `TauCeti.Probability.covarianceBilin_dirichletMeasure`, `TauCeti.Probability.memLp_id_dirichletMeasure`, `TauCeti.Probability.integrableExpSet_inner_dirichletMeasure`, `TauCeti.Probability.integral_norm_sq_dirichletMeasure_smul`; `Probability/Distributions/Dirichlet/Aggregation.lean`: `TauCeti.Probability.map_euclideanFiberSum_dirichletMeasure`; `Probability/Distributions/Dirichlet/Marginal.lean`: `TauCeti.Probability.map_sum_dirichletMeasure`, `TauCeti.Probability.map_eval_dirichletMeasure`, `TauCeti.Probability.map_eval_zero_dirichletMeasure_fin_two`; `Probability/Distributions/Dirichlet/Density.lean`: `TauCeti.Probability.dirichletChartPDFReal`, `TauCeti.Probability.dirichletChartPDFReal_of_mem`, `TauCeti.Probability.dirichletChartPDFReal_of_notMem`, `TauCeti.Probability.dirichletChartPDF`, `TauCeti.Probability.dirichletMeasure_eq_map_withDensity_dirichletChartPDF`, `TauCeti.Probability.lintegral_dirichletChartPDF_eq_one`, `TauCeti.Probability.det_fderiv_dirichletUnchart`, `TauCeti.Probability.map_dirichletUnchart_withDensity`; `Probability/Distributions/Dirichlet/Factorization.lean`: `TauCeti.Probability.map_dirichletNormalize_sum_pi_gammaMeasure`, `TauCeti.Probability.map_dirichletNormalize_pi_gammaMeasure`, `TauCeti.Probability.indepFun_dirichletNormalize_sum_of_hasLaw_gammaMeasure`, `TauCeti.Probability.hasLaw_dirichletNormalize_sum_prod_gammaMeasure_of_iIndepFun`, `TauCeti.Probability.hasLaw_dirichletNormalize_gammaMeasure_of_iIndepFun`; `Probability/Distributions/Dirichlet/StickBreaking.lean`: `TauCeti.Probability.map_dirichletStickSplit_dirichletMeasure`, `ProbabilityTheory.HasLaw.dirichletStickSplit`, `ProbabilityTheory.HasLaw.indepFun_dirichletStickSplit`, `TauCeti.Probability.map_dirichletStickInsert_prod_betaMeasure_dirichletMeasure`, `ProbabilityTheory.IndepFun.hasLaw_dirichletStickInsert`; `Probability/Distributions/Dirichlet/Spacing.lean`: `TauCeti.Probability.map_tupleSpacings_orderStatistics_pi_uniformMeasure`, `TauCeti.Probability.hasLaw_tupleSpacings_orderStatistics_iid_uniformMeasure`; `Probability/Distributions/Dirichlet/MixedMoments.lean`: `TauCeti.Probability.integrable_prod_rpow_dirichletMeasure`, `TauCeti.Probability.integral_prod_rpow_dirichletMeasure`, `TauCeti.Probability.integral_prod_pow_dirichletMeasure`, `TauCeti.Probability.integrable_prod_rpow_dirichletMeasure_of_card_eq_one`, `TauCeti.Probability.integral_prod_rpow_dirichletMeasure_of_card_eq_one`; `Probability/Distributions/Dirichlet/Concentration.lean`: `TauCeti.Probability.tendsto_dirichletMeasure_concentration_atTop`, `TauCeti.Probability.tendsto_dirichletMeasure_concentration_atBot`, `TauCeti.Probability.integral_norm_sub_sq_dirichletMeasure_smul`; `Probability/Distributions/Beta/Concentration.lean`: `TauCeti.Probability.tendsto_betaMeasure_concentration_atTop`, `TauCeti.Probability.tendsto_betaMeasure_concentration_atBot`.
- §5.7. `Probability/Distributions/Multinomial/Measurability.lean`: `TauCeti.Probability.measurable_multinomialMeasure`; `Probability/Distributions/Dirichlet/Measurability.lean`: `TauCeti.Probability.measurable_dirichletMeasure`.
- §5.8. `Probability/Distributions/Poisson/Sum.lean`: `TauCeti.Probability.map_sum_pi_poissonMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_sum_poissonMeasure`; `Probability/Distributions/Multinomial/Poisson.lean`: `TauCeti.Probability.cond_pi_poissonMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_cond_sum_poissonMeasure`, `TauCeti.Probability.restrict_pi_poissonMeasure_mul_weights`, `TauCeti.Probability.cond_pi_poissonMeasure_mul_weights`, `TauCeti.Probability.cond_pi_poissonMeasure_mul_weights_of_pos`, `TauCeti.Probability.bind_poissonMeasure_multinomialMeasure`, `ProbabilityTheory.HasLaw.iIndepFun_of_poisson_multinomial`, `TauCeti.Probability.cond_pi_poissonMeasure_zero_of_ne_zero`, `TauCeti.Probability.cond_pi_poissonMeasure_zero`.
- §6.1. `MeasureTheory/Measure/SymmetricMatrix/Basic.lean`: `selfAdjoint.isHermitian_coe`, `selfAdjoint.coe_apply_comm`, `TauCeti.symmetricMatrixNormedAddCommGroup`, `TauCeti.symmetricMatrixInnerProductSpace`, `selfAdjoint.coe_inner`, `TauCeti.symmetricMatrixIsUniformAddGroup`, `TauCeti.symmetricMatrixSecondCountableTopology`, `TauCeti.symmetricMatrixCompleteSpace`, `TauCeti.symmetricMatrixContinuousENorm`, `TauCeti.symmetricMatrixBorelSpace`, `TauCeti.finrank_symmetricMatrix`, `selfAdjoint.inner_eq_trace_mul`, `TauCeti.card_upperTriangle`, `TauCeti.coe_symmetricCoordinates_symm_apply_of_le`, `TauCeti.coe_symmetricCoordinates_symm_apply_of_ge`, `TauCeti.symmetricFinOneEquiv`; `Analysis/Matrix/Frobenius.lean`: `Matrix.frobeniusInnerProductSpace`, `Matrix.frobenius_inner_def`, `Matrix.frobenius_real_inner_eq_sum_mul`, `Matrix.frobenius_inner_eq_trace_conjTranspose_mul`; `MeasureTheory/Measure/SymmetricMatrix/PosDef.lean`: `TauCeti.isOpen_setOfPred_posDefMatrix`, `TauCeti.measurableSet_posDefMatrix`; `MeasureTheory/Measure/SymmetricMatrix/Lebesgue.lean`: `TauCeti.measurePreserving_symmetricCoordinates_symm`, `TauCeti.measurePreserving_symmetricCoordinates`, `TauCeti.symmetricLebesgueIsAddHaarMeasure`, `TauCeti.volume_symmetricMatrix_eq_smul_symmetricLebesgue`, `TauCeti.symmetricLebesgue_zero`, `TauCeti.measurePreserving_symmetricFinOneEquiv`; `MeasureTheory/Measure/SymmetricMatrix/Determinant.lean`: `TauCeti.symmetricLebesgue_setOf_det_eq_zero`, `TauCeti.symmetricDetPolynomial_ne_zero`; `MeasureTheory/Measure/SymmetricMatrix/Congruence.lean`: `Matrix.inner_symmetricCongruenceLinearMap`, `Matrix.GeneralLinearGroup.det_symmetricCongruence`, `Matrix.det_symmetricCongruenceLinearMap`, `Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue`, `Matrix.GeneralLinearGroup.map_symmetricCongruence_restrict_posDef`.
- §6.2. `LinearAlgebra/Matrix/Cholesky/Basic.lean`: `TauCeti.cholesky_coe`, `TauCeti.cholesky_mul_transpose`, `TauCeti.choleskyReconstruction_coe`, `TauCeti.choleskyReconstruction_cholesky`; `LinearAlgebra/Matrix/Cholesky/Equiv.lean`: `TauCeti.eq_cholesky_of_mul_transpose_self_eq`, `TauCeti.cholesky_choleskyReconstruction`, `TauCeti.choleskyEquiv`; `LinearAlgebra/Matrix/Triangular.lean`: `Matrix.IsLowerTriangular.eq_of_mul_transpose_self_eq`; `LinearAlgebra/Matrix/Cholesky/Topology.lean`: `TauCeti.continuous_cholesky`, `TauCeti.continuous_choleskyReconstruction`, `TauCeti.measurable_cholesky`, `TauCeti.measurable_choleskyReconstruction`, `TauCeti.choleskyHomeomorph`, `TauCeti.choleskyMeasurableEquiv`; `LinearAlgebra/Matrix/Cholesky/Jacobian.lean`: `TauCeti.abs_det_fderiv_choleskyReconstructionCoordinates`, `TauCeti.det_fderiv_choleskyReconstructionCoordinates`; `MeasureTheory/Measure/SymmetricMatrix/Cholesky.lean`: `TauCeti.map_cholesky_symmetricLebesgue`, `TauCeti.setLIntegral_posDef_symmetricLebesgue`, `TauCeti.integral_posDef_symmetricLebesgue`.
- §6.3. `Analysis/SpecialFunctions/MultivariateGamma/Basic.lean`: `TauCeti.multivariateGamma_def`, `TauCeti.multivariateGamma_zero`, `TauCeti.multivariateGamma_one`, `TauCeti.multivariateGamma_add`, `TauCeti.multivariateGamma_succ`, `TauCeti.multivariateGamma_pos`, `TauCeti.multivariateGamma_eq_zero_iff`, `TauCeti.measurable_multivariateGamma`; `Analysis/SpecialFunctions/MultivariateGamma/Integral.lean`: `TauCeti.integral_posDef_multivariateGamma`, `TauCeti.lintegral_posDef_multivariateGamma`, `TauCeti.integrableOn_posDef_det_rpow_mul_exp_neg_trace`, `TauCeti.integral_posDef_multivariateGamma_zero`, `Matrix.PosDef.integral_det_rpow_mul_exp_neg_trace_inv_mul_div_two`, `Matrix.PosDef.integral_det_rpow_mul_exp_neg_trace_inv_mul`; `Analysis/SpecialFunctions/MultivariateGamma/Divergence.lean`: `TauCeti.lintegral_posDef_det_rpow_mul_exp_neg_trace_mul_eq_top`, `TauCeti.not_integrableOn_posDef_det_rpow_mul_exp_neg_trace_mul`.
- §6.4. `Probability/Distributions/Wishart/Nonsingular.lean`: `TauCeti.Probability.nonsingularWishartPDFReal`, `TauCeti.Probability.nonsingularWishartPDFReal_of_not_posDef`, `TauCeti.Probability.nonsingularWishartPDF`, `TauCeti.Probability.nonsingularWishartMeasure_of_posDef`, `TauCeti.Probability.nonsingularWishartMeasure_of_not_posDef`, `TauCeti.Probability.nonsingularWishartMeasure_of_le`, `TauCeti.Probability.nonsingularWishartMeasure_zero`, `TauCeti.Probability.ae_posDef_nonsingularWishartMeasure`, `TauCeti.Probability.nonsingularWishartPDFReal_pos_iff`, `TauCeti.Probability.hasPDF_of_hasLaw_nonsingularWishartMeasure`, `TauCeti.Probability.pdf_eq_nonsingularWishartPDF_of_hasLaw_nonsingularWishartMeasure`, `TauCeti.Probability.rnDeriv_nonsingularWishartMeasure`; `Probability/Distributions/Wishart/Congruence.lean`: `TauCeti.Probability.isProbabilityMeasure_nonsingularWishartMeasure`, `TauCeti.Probability.map_symmetricCongruence_nonsingularWishartMeasure`, `TauCeti.Probability.nonsingularWishartMeasure_eq_map_sqrt`; `Probability/Distributions/Wishart/Moments.lean`: `TauCeti.Probability.integral_id_nonsingularWishartMeasure`, `TauCeti.Probability.integral_coe_apply_nonsingularWishartMeasure`, `TauCeti.Probability.covariance_coe_apply_nonsingularWishartMeasure`, `TauCeti.Probability.memLp_id_nonsingularWishartMeasure`, `TauCeti.Probability.integral_coe_apply_of_mgf_trace_mul_eq_det_rpow`, `TauCeti.Probability.integral_id_of_mgf_trace_mul_eq_det_rpow`, `TauCeti.Probability.covariance_coe_apply_of_mgf_trace_mul_eq_det_rpow`, `TauCeti.Probability.integral_id_wishartGramMeasure`, `TauCeti.Probability.covariance_coe_apply_wishartGramMeasure`; `Probability/Distributions/Wishart/CharFun.lean`: `TauCeti.Probability.nonsingularWishartMeasure_conv_nonsingularWishartMeasure`, `TauCeti.Probability.charFun_nonsingularWishartMeasure`, `selfAdjoint.charFun_eq_complexMGF_trace_mul`, `TauCeti.Probability.charFun_eq_exp_of_mgf_trace_mul_eq_det_rpow`, `TauCeti.Probability.charFun_wishartGramMeasure`; `Probability/Distributions/Wishart/Marginal.lean`: `TauCeti.Probability.map_symmetricCongruenceLinearMap_nonsingularWishartMeasure`, `TauCeti.Probability.map_symmetricCongruenceLinearMap_submatrix_one_nonsingularWishartMeasure`; `Probability/Distributions/Wishart/LowDimension.lean`: `TauCeti.Probability.map_symmetricFinOneEquiv_nonsingularWishartMeasure`, `TauCeti.Probability.map_symmetricFinOneEquiv_wishartGramMeasure`; `Analysis/Matrix/Sqrt.lean`: `Matrix.isHermitian_sqrt_mul_mul_sqrt`, `Matrix.PosDef.posDef_inv_sub_smul_iff`; `Probability/Distributions/Wishart/Transforms.lean`: `TauCeti.Probability.mem_integrableExpSet_trace_mul_nonsingularWishartMeasure_iff`, `TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure`, `TauCeti.Probability.mgf_trace_mul_nonsingularWishartMeasure_sqrt`, `TauCeti.Probability.cgf_trace_mul_nonsingularWishartMeasure`, `TauCeti.Probability.integral_exp_neg_trace_mul_nonsingularWishartMeasure`, `TauCeti.Probability.integrableExpSet_trace_mul_wishartGramMeasure_zero`, `TauCeti.Probability.mgf_trace_mul_wishartGramMeasure_zero`, `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure_zero`, `TauCeti.Probability.mem_integrableExpSet_trace_mul_wishartGramMeasure_iff`, `TauCeti.Probability.mgf_trace_mul_wishartGramMeasure_sqrt`, `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure_sqrt`, `TauCeti.Probability.mgf_trace_mul_wishartGramMeasure`, `TauCeti.Probability.cgf_trace_mul_wishartGramMeasure`, `TauCeti.Probability.integral_exp_neg_trace_mul_wishartGramMeasure`; `Probability/Moments/ComplexMGF.lean`: `TauCeti.complexMGF_eq_exp_of_mgf_eq_prod_rpow`, `TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow`, `TauCeti.eqOn_complexMGF_of_eqOn_mgf`; `MeasureTheory/Measure/SymmetricMatrix/Basic.lean`: `TauCeti.symmetricEntry`; `Probability/Distributions/Wishart/Basic.lean`: `TauCeti.Probability.wishartGram`, `TauCeti.Probability.coe_wishartGram`, `TauCeti.Probability.wishartGramMeasure_of_not_posSemidef`, `TauCeti.Probability.wishartGramMeasure_zero`, `TauCeti.Probability.isProbabilityMeasure_wishartGramMeasure`, `TauCeti.Probability.hasLaw_wishartGram_gaussian`, `TauCeti.Probability.ae_posSemidef_wishartGramMeasure`, `TauCeti.Probability.ae_rank_le_wishartGramMeasure`, `TauCeti.Probability.wishartGramMeasure_conv_wishartGramMeasure`, `TauCeti.Probability.wishartGramMeasure_eq_map_sqrt`, `TauCeti.Probability.map_symmetricCongruenceLinearMap_wishartGramMeasure`, `TauCeti.Probability.mutuallySingular_wishartGramMeasure_symmetricLebesgue`; `Probability/Distributions/Gaussian/Rank.lean`: `TauCeti.Probability.ae_rank_eq_min_pi_gaussianReal`; `MeasureTheory/Measure/Matrix.lean`: `MeasureTheory.Measure.ae_rank_eq_min`; `Probability/Distributions/Wishart/Agreement.lean`: `TauCeti.Probability.wishartGramMeasure_eq_nonsingularWishartMeasure`, `TauCeti.Probability.hasLaw_wishartGram_gaussian_nonsingularWishartMeasure`, `TauCeti.Probability.ae_posDef_wishartGramMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_wishartGramMeasure`, `TauCeti.Probability.rnDeriv_wishartGramMeasure`.
- §6.5. `Probability/Distributions/Wishart/Nonsingular.lean`: `TauCeti.Probability.map_subtype_val_comap_nonsingularWishartMeasure`; `Probability/Distributions/Wishart/Bartlett.lean`: `TauCeti.Probability.map_choleskyLowerCoordinates_comap_nonsingularWishartMeasure`, `TauCeti.Probability.map_sq_bartlettCoordinateMeasure_of_eq`, `TauCeti.Probability.map_diagonal_sq_pi_bartlettCoordinateMeasure`, `TauCeti.Probability.nonsingularWishartMeasure_one_eq_map_lowerTriangleGram`, `TauCeti.Probability.bartlett_nonsingularWishartMeasure`; `Probability/Distributions/Wishart/Determinant.lean`: `TauCeti.Probability.map_det_nonsingularWishartMeasure`, `TauCeti.Probability.map_det_nonsingularWishartMeasure_one`, `TauCeti.Probability.hasLaw_det_nonsingularWishartMeasure`, `TauCeti.Probability.hasLaw_prod_chiSquared_det_nonsingularWishartMeasure`, `TauCeti.Probability.integrable_rpow_det_nonsingularWishartMeasure_iff`, `TauCeti.Probability.integral_rpow_det_nonsingularWishartMeasure`, `TauCeti.Probability.integrable_rpow_det_nonsingularWishartMeasure_zero`, `TauCeti.Probability.integral_rpow_det_nonsingularWishartMeasure_zero`.
- §6.6. `MeasureTheory/Measure/SymmetricMatrix/Inv.lean`: `TauCeti.symmetricInv`, `TauCeti.coe_symmetricInv`, `TauCeti.symmetricInv_symmetricInv`, `TauCeti.bijOn_symmetricInv`, `TauCeti.measurable_symmetricInv`, `TauCeti.abs_det_fderiv_symmetricInv`, `TauCeti.map_symmetricInv_symmetricLebesgue`; `Probability/Distributions/Wishart/Inverse/Basic.lean`: `TauCeti.Probability.inverseWishartMeasure_def`, `TauCeti.Probability.inverseWishartMeasure_of_not_posDef`, `TauCeti.Probability.inverseWishartMeasure_of_le`, `TauCeti.Probability.inverseWishartPDFReal`, `TauCeti.Probability.inverseWishartMeasure_of_posDef`, `TauCeti.Probability.isProbabilityMeasure_inverseWishartMeasure`, `TauCeti.Probability.ae_posDef_inverseWishartMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_inverseWishartMeasure`, `TauCeti.Probability.rnDeriv_inverseWishartMeasure`, `TauCeti.Probability.map_symmetricCongruence_inverseWishartMeasure`, `TauCeti.Probability.inverseWishartMeasure_zero`; `Probability/Distributions/Wishart/Nonsingular.lean`: `TauCeti.Probability.nonsingularWishartMeasure_compl_posDef`; `Probability/Distributions/Wishart/Inverse/Moments.lean`: `TauCeti.Probability.integrable_id_inverseWishartMeasure`, `TauCeti.Probability.integral_id_inverseWishartMeasure`, `TauCeti.Probability.not_integrable_id_inverseWishartMeasure`, `TauCeti.Probability.integrable_id_inverseWishartMeasure_zero`, `TauCeti.Probability.integral_id_inverseWishartMeasure_zero`.
- §6.7. `Probability/Distributions/Wishart/Nonsingular.lean`: `TauCeti.Probability.measurable_nonsingularWishartMeasure`, `TauCeti.Probability.measurable_nonsingularWishartMeasure_selfAdjoint`, `TauCeti.Probability.measurable_uncurry_nonsingularWishartPDFReal`; `Probability/Distributions/Wishart/Measurability.lean`: `TauCeti.Probability.measurable_wishartGramMeasure`, `TauCeti.Probability.measurable_wishartGramMeasure_selfAdjoint`; `Probability/Distributions/Wishart/Inverse/Measurability.lean`: `TauCeti.Probability.measurable_inverseWishartMeasure`, `TauCeti.Probability.measurable_inverseWishartMeasure_selfAdjoint`; `Probability/Distributions/Wishart/Inverse/Basic.lean`: `TauCeti.Probability.measurable_uncurry_inverseWishartPDFReal`.
- §6.8. `Probability/Distributions/Wishart/Inverse/Marginal.lean`: `TauCeti.Probability.map_inv_inv_apply_nonsingularWishartMeasure`, `TauCeti.Probability.map_coe_apply_inverseWishartMeasure`, `TauCeti.Probability.hasLaw_inv_inv_apply_nonsingularWishartMeasure`, `TauCeti.Probability.hasLaw_coe_apply_inverseWishartMeasure`; `Probability/Distributions/Wishart/Inverse/Moments.lean`: `TauCeti.Probability.map_coe_apply_inverseWishartMeasure_one`; `MeasureTheory/Measure/SymmetricMatrix/Congruence.lean`: `Matrix.coe_symmetricCongruenceLinearMap_permMatrix_apply`, `Matrix.coe_symmetricCongruenceLinearMap_apply_self_of_apply_eq_zero`; `LinearAlgebra/Matrix/Cholesky/Basic.lean`: `Matrix.PosDef.exists_generalLinearGroup_mul_transpose_eq_and_apply_eq_zero`; `LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.PosDef.inv_inv_apply_self_eq_sub`; `Probability/Distributions/InverseGamma/Basic.lean`: `TauCeti.Probability.inverseGammaMeasure`.
- Layer 7 (introduction). `Probability/Cdf.lean`: `MeasureTheory.Measure.leftLim_cdf`.
- §7.1. `Probability/Distributions/Affine.lean`: `TauCeti.Probability.measurable_map_affine`, `TauCeti.Probability.map_affine_map_affine`, `TauCeti.Probability.affineDensity`, `TauCeti.Probability.map_affine_withDensity_volume`, `TauCeti.Probability.rnDeriv_map_affine`, `TauCeti.Probability.hasPDF_affine`, `TauCeti.Probability.pdf_affine`, `TauCeti.Probability.hasLaw_affine`, `TauCeti.Probability.cdf_map_affine_of_pos`, `TauCeti.Probability.cdf_map_affine_of_neg`, `TauCeti.Probability.memLp_id_map_affine_iff`, `TauCeti.Probability.integral_id_map_affine`, `TauCeti.Probability.variance_id_map_affine`, `TauCeti.Probability.moment_id_map_affine`, `TauCeti.Probability.centralMoment_id_map_affine`, `TauCeti.Probability.mgf_id_map_affine`, `TauCeti.Probability.integrableExpSet_id_map_affine`, `TauCeti.Probability.cgf_id_map_affine`, `TauCeti.Probability.charFun_map_affine`; `MeasureTheory/Measure/AtomMixture.lean`: `MeasureTheory.Measure.atomMixture`, `MeasureTheory.Measure.map_atomMixture`; `Probability/ConditionalProbability.lean`: `ProbabilityTheory.map_cond_preimage`; `Probability/Distributions/CompoundPoisson/Basic.lean`: `TauCeti.Probability.map_compoundPoissonMeasure`, `TauCeti.Probability.compoundPoissonMeasure`.
- §7.2. `Probability/Quantile.lean`: `MeasureTheory.Measure.quantile_def`, `MeasureTheory.Measure.upperQuantile`, `MeasureTheory.Measure.upperQuantile_def`, `MeasureTheory.Measure.quantile_of_nonpos`, `MeasureTheory.Measure.quantile_of_one_lt`, `MeasureTheory.Measure.upperQuantile_of_neg`, `MeasureTheory.Measure.upperQuantile_of_one_le`, `MeasureTheory.Measure.bddBelow_setOf_le_cdf`, `MeasureTheory.Measure.nonempty_setOf_lt_cdf`, `MeasureTheory.Measure.bddBelow_setOf_lt_cdf`, `MeasureTheory.Measure.quantile_le_iff`, `MeasureTheory.Measure.le_upperQuantile_iff`, `MeasureTheory.Measure.upperQuantile_lt_iff`, `MeasureTheory.Measure.measureReal_Iio_quantile_le`, `MeasureTheory.Measure.le_cdf_quantile`, `MeasureTheory.Measure.measureReal_Iio_upperQuantile_le`, `MeasureTheory.Measure.le_cdf_upperQuantile`, `MeasureTheory.Measure.quantile_le_upperQuantile`, `MeasureTheory.Measure.upperQuantile_le_quantile`, `MeasureTheory.Measure.monotoneOn_quantile`, `MeasureTheory.Measure.monotoneOn_upperQuantile`, `MeasureTheory.Measure.measurable_quantile`, `MeasureTheory.Measure.measurable_upperQuantile`, `MeasureTheory.Measure.continuousWithinAt_Iio_quantile`, `MeasureTheory.Measure.continuousWithinAt_Ioi_upperQuantile`, `MeasureTheory.Measure.cdf_quantile`, `MeasureTheory.Measure.quantile_cdf`, `MeasureTheory.Measure.quantile_eq_of_cdf_eq`, `MeasureTheory.Measure.upperQuantile_eq_of_cdf_eq`, `MeasureTheory.Measure.quantile_eq_iff_of_ae_mem_of_strictMonoOn`, `Set.OrdConnected.quantile_mem`, `Set.OrdConnected.upperQuantile_mem`, `MeasureTheory.Measure.measurable_quantile_probabilityMeasure`, `MeasureTheory.Measure.measurable_upperQuantile_probabilityMeasure`, `MeasureTheory.Measure.measurable_quantile_cdf_family`, `MeasureTheory.Measure.measurable_upperQuantile_cdf_family`, `MeasureTheory.Measure.map_quantile_volume_Ioo`, `MeasureTheory.Measure.measurePreserving_quantile`, `MeasureTheory.Measure.cdf_map_eq_volume_restrict`, `MeasureTheory.Measure.tendsto_quantile_nhdsGT_zero`, `MeasureTheory.Measure.tendsto_quantile_nhdsLT_one`, `MeasureTheory.Measure.tendsto_upperQuantile_nhdsGT_zero`, `MeasureTheory.Measure.tendsto_upperQuantile_nhdsLT_one`; `Probability/Cdf.lean`: `MeasureTheory.Measure.nonempty_setOf_le_cdf`; `Probability/Distributions/Dirac.lean`: `MeasureTheory.Measure.quantile_dirac`, `MeasureTheory.Measure.upperQuantile_dirac`; `Probability/Distributions/Affine.lean`: `TauCeti.Probability.quantile_map_affine`, `TauCeti.Probability.quantile_map_affine_pos`, `TauCeti.Probability.quantile_map_affine_neg`, `TauCeti.Probability.upperQuantile_map_affine`, `TauCeti.Probability.upperQuantile_map_affine_pos`, `TauCeti.Probability.upperQuantile_map_affine_neg`; `Probability/Quantile/Map.lean`: `MeasureTheory.Measure.quantile_map_of_monotone`, `MeasureTheory.Measure.quantile_map_of_monotoneOn`, `MeasureTheory.Measure.quantile_map_of_antitoneOn`, `MeasureTheory.Measure.quantile_map_of_antitone`, `MeasureTheory.Measure.upperQuantile_map_of_monotone`, `MeasureTheory.Measure.upperQuantile_map_of_monotoneOn`, `MeasureTheory.Measure.upperQuantile_map_of_antitoneOn`, `MeasureTheory.Measure.quantile_map_exp`, `MeasureTheory.Measure.quantile_map_log`, `MeasureTheory.Measure.quantile_map_rpow`, `MeasureTheory.Measure.quantile_map_sqrt`, `MeasureTheory.Measure.quantile_map_inv`; `Probability/Quantile/Discrete.lean`: `MeasureTheory.Measure.quantile_map_natCast_eq_iff`, `MeasureTheory.Measure.quantile_map_intCast_eq_iff`, `MeasureTheory.Measure.quantile_map_natCast_eq_of_measureReal_Iic_eq_one`; `Probability/Quantile/Finite.lean`: `MeasureTheory.Measure.quantile_map_finite_eq_iff`; `Probability/Distributions/Uniform/Basic.lean`: `TauCeti.Probability.uniformMeasure_eq_smul`.
- §7.3. `Probability/ConditionalProbability.lean`: `Measurable.cond`, `Measurable.cond_const`, `Measurable.cond_preimage_Ioc`, `Measurable.cond_preimage_Icc`, `Measurable.cond_preimage_Ioo`, `Measurable.cond_preimage_Ico`, `MeasureTheory.Measure.cond_Icc_eq_cond_Ioc`, `MeasureTheory.Measure.cond_Ioo_eq_cond_Ioc`, `MeasureTheory.Measure.cond_Ico_eq_cond_Ioc`; `Probability/Distributions/Truncation.lean`: `MeasureTheory.Measure.cdf_cond`, `MeasureTheory.Measure.cdf_cond_Ioc`, `MeasureTheory.Measure.quantile_cond_Ioc`, `MeasureTheory.Measure.cdf_cond_sdiff`, `MeasureTheory.Measure.quantile_cond_sdiff`, `MeasureTheory.Measure.cdf_cond_Icc`, `MeasureTheory.Measure.quantile_cond_Icc`, `MeasureTheory.Measure.cdf_cond_Ioo`, `MeasureTheory.Measure.quantile_cond_Ioo`, `MeasureTheory.Measure.cdf_cond_Ico`, `MeasureTheory.Measure.quantile_cond_Ico`.
- §7.4. `MeasureTheory/Measure/AtomMixture.lean`: `MeasureTheory.Measure.atomMixture_def`, `MeasureTheory.Measure.atomMixture_zero`, `MeasureTheory.Measure.atomMixture_one`, `MeasureTheory.Measure.isProbabilityMeasure_atomMixture`, `MeasureTheory.Measure.measurable_atomMixture`, `MeasureTheory.Measure.atomMixture_singleton`, `MeasureTheory.Measure.atomMixture_singleton_of_ne`, `MeasureTheory.Measure.integral_atomMixture`, `MeasureTheory.Measure.atomMixture_withDensity`; `Probability/Distributions/AtomMixture.lean`: `MeasureTheory.Measure.integral_id_atomMixture`, `MeasureTheory.Measure.variance_id_atomMixture`, `MeasureTheory.Measure.integrableExpSet_id_atomMixture`, `MeasureTheory.Measure.mgf_id_atomMixture`, `MeasureTheory.Measure.cgf_id_atomMixture`, `MeasureTheory.Measure.charFun_atomMixture`, `MeasureTheory.Measure.cdf_atomMixture`, `MeasureTheory.Measure.quantile_atomMixture`; `MeasureTheory/Measure/Mixture/Basic.lean`: `MeasureTheory.Measure.bind_eq_withDensity_of_ae_eq`, `MeasureTheory.Measure.rnDeriv_bind_withDensity`; `Probability/Distributions/Mixture.lean`: `TauCeti.Probability.hasPDF_of_hasLaw_bind_withDensity`, `TauCeti.Probability.pdf_eq_of_hasLaw_bind_withDensity`, `MeasureTheory.Measure.cdf_bind`, `MeasureTheory.Measure.charFun_bind`, `MeasureTheory.Measure.mem_integrableExpSet_bind_iff`, `MeasureTheory.Measure.mgf_bind`, `MeasureTheory.Measure.cgf_bind`, `TauCeti.Probability.finiteMixtureMeasure_eq_bind`, `TauCeti.Probability.isProbabilityMeasure_finiteMixtureMeasure`, `TauCeti.Probability.measurable_finiteMixtureMeasure`, `TauCeti.Probability.integrable_finiteMixtureMeasure_iff`; `MeasureTheory/Integral/Bind.lean`: `MeasureTheory.Measure.integral_bind`, `MeasureTheory.Measure.integrable_bind_iff`; `Probability/Moments/Mixture.lean`: `TauCeti.Probability.memLp_integral_bind`, `TauCeti.Probability.covariance_bind`, `TauCeti.Probability.variance_bind`, `ProbabilityTheory.Kernel.covariance_comp`, `ProbabilityTheory.Kernel.variance_comp`; `Probability/Distributions/Gaussian/Mixture/Basic.lean`: `TauCeti.Probability.gaussianMixtureMeasure_eq_sum_dirac_add_withDensity`, `TauCeti.Probability.gaussianMixtureMeasure_eq_withDensity`; `Probability/Distributions/Gaussian/Mixture/Quantile.lean`: `TauCeti.Probability.cdf_gaussianMixtureMeasure`, `TauCeti.Probability.quantile_gaussianMixtureMeasure_le_iff`; `Probability/Distributions/Gaussian/Mixture/Multivariate.lean`: `TauCeti.Probability.multivariateGaussianMixtureMeasure_eq_add_withDensity`, `TauCeti.Probability.multivariateGaussianMixtureMeasure_eq_withDensity`; `Probability/Distributions/Zero/Inflation.lean`: `MeasureTheory.Measure.atomMixture_zero_real_Iic`, `MeasureTheory.Measure.quantile_map_natCast_atomMixture_zero`; `Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond_compl_singleton_eq_zero_iff`, `ProbabilityTheory.isProbabilityMeasure_cond_compl_singleton`, `ProbabilityTheory.cond_compl_singleton_real_singleton`; `Probability/Distributions/Zero/Truncation.lean`: `MeasureTheory.Measure.cond_compl_zero_real_Iic`, `MeasureTheory.Measure.integral_pow_map_natCast_cond_compl_zero`, `MeasureTheory.Measure.integral_id_map_natCast_cond_compl_zero`, `MeasureTheory.Measure.variance_id_map_natCast_cond_compl_zero`, `MeasureTheory.Measure.integrableExpSet_id_map_natCast_cond_compl_zero`, `MeasureTheory.Measure.cdf_map_natCast_cond_compl_zero`, `MeasureTheory.Measure.quantile_map_natCast_cond_compl_zero`; `Probability/Distributions/Zero/Hurdle.lean`: `MeasureTheory.Measure.cond_compl_zero_atomMixture_zero_real_singleton_zero`, `MeasureTheory.Measure.cond_compl_zero_atomMixture_zero_real_singleton`, `MeasureTheory.Measure.isProbabilityMeasure_cond_compl_zero_atomMixture_zero_iff`, `MeasureTheory.Measure.cdf_map_natCast_cond_compl_zero_atomMixture_zero`, `MeasureTheory.Measure.quantile_map_natCast_cond_compl_zero_atomMixture_zero`, `MeasureTheory.Measure.integral_id_map_natCast_cond_compl_zero_atomMixture_zero`, `MeasureTheory.Measure.variance_id_map_natCast_cond_compl_zero_atomMixture_zero`, `MeasureTheory.Measure.integrableExpSet_id_map_natCast_cond_compl_zero_atomMixture_zero`; `Probability/Distributions/Poisson/Zero/Inflated.lean`: `TauCeti.Probability.poissonMeasure_atomMixture_zero_real_singleton_zero`, `TauCeti.Probability.poissonMeasure_atomMixture_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_poissonMeasure_atomMixture_zero`, `TauCeti.Probability.variance_id_map_cast_poissonMeasure_atomMixture_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_atomMixture_zero`, `TauCeti.Probability.cdf_map_cast_poissonMeasure_atomMixture_zero`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_atomMixture_zero`; `Probability/Distributions/Poisson/Zero/Truncated.lean`: `TauCeti.Probability.poissonMeasure_cond_compl_zero_eq_zero_iff`, `TauCeti.Probability.poissonMeasure_cond_compl_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_poissonMeasure_cond_compl_zero`, `TauCeti.Probability.variance_id_map_cast_poissonMeasure_cond_compl_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_cond_compl_zero`, `TauCeti.Probability.cdf_map_cast_poissonMeasure_cond_compl_zero`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_cond_compl_zero`; `Probability/Distributions/Poisson/Zero/Hurdle.lean`: `TauCeti.Probability.poissonMeasure_cond_compl_zero_atomMixture_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.variance_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.cdf_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_cond_compl_zero_atomMixture_zero`; `Probability/Distributions/NegativeBinomial/Zero/Inflated.lean`: `TauCeti.Probability.negativeBinomialMeasure_atomMixture_zero_real_singleton_zero`, `TauCeti.Probability.negativeBinomialMeasure_atomMixture_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_atomMixture_zero`, `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_atomMixture_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_atomMixture_zero`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_atomMixture_zero`, `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_atomMixture_zero`; `Probability/Distributions/NegativeBinomial/Zero/Truncated.lean`: `TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_eq_zero_iff`, `TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_cond_compl_zero`, `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_cond_compl_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_cond_compl_zero`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_cond_compl_zero`, `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_cond_compl_zero`; `Probability/Distributions/NegativeBinomial/Zero/Hurdle.lean`: `TauCeti.Probability.negativeBinomialMeasure_cond_compl_zero_atomMixture_zero_real_singleton`, `TauCeti.Probability.integral_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.variance_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.cdf_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`, `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_cond_compl_zero_atomMixture_zero`; `Probability/Distributions/Categorical.lean`: `TauCeti.Probability.categoricalMeasure`.
- §7.5. `MeasureTheory/Group/Convolution/Power.lean`: `MeasureTheory.Measure.convolutionPower`, `MeasureTheory.Measure.convolutionPower_zero`, `MeasureTheory.Measure.convolutionPower_succ`, `MeasureTheory.Measure.isProbabilityMeasure_convolutionPower`, `MeasureTheory.Measure.measurable_convolutionPower`, `MeasureTheory.Measure.convolutionPower_add`; `Probability/Independence/ConvolutionPower.lean`: `ProbabilityTheory.iIndepFun.hasLaw_finset_sum_convolutionPower`; `Probability/Distributions/CompoundPoisson/Basic.lean`: `TauCeti.Probability.compoundPoissonMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_compoundPoissonMeasure`, `TauCeti.Probability.measurable_compoundPoissonMeasure`, `TauCeti.Probability.measurable_compoundPoissonMeasure_probability`, `TauCeti.Probability.compoundPoissonMeasure_zero`, `TauCeti.Probability.compoundPoissonMeasure_dirac_zero`, `TauCeti.Probability.compoundPoissonMeasure_dirac`, `TauCeti.Probability.compoundPoissonMeasure_conv_compoundPoissonMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_compoundPoissonMeasure`, `TauCeti.Probability.charFun_compoundPoissonMeasure`, `TauCeti.Probability.compoundPoissonMeasure_real_singleton`, `TauCeti.Probability.exp_neg_le_compoundPoissonMeasure_real_singleton_zero`; `Probability/Distributions/CompoundPoisson/RandomSum.lean`: `ProbabilityTheory.iIndepFun.hasLaw_sum_range_compoundPoissonMeasure`; `Probability/Distributions/CompoundPoisson/Moments.lean`: `TauCeti.Probability.integral_id_compoundPoissonMeasure`, `TauCeti.Probability.covMatrix_compoundPoissonMeasure`, `TauCeti.Probability.covarianceBilin_compoundPoissonMeasure`, `TauCeti.Probability.covariance_compoundPoissonMeasure`, `TauCeti.Probability.variance_id_compoundPoissonMeasure`; `Probability/Distributions/CompoundPoisson/Transforms.lean`: `TauCeti.Probability.integrableExpSet_compoundPoissonMeasure`, `TauCeti.Probability.mgf_compoundPoissonMeasure`, `TauCeti.Probability.cgf_compoundPoissonMeasure`; `Probability/Distributions/CompoundPoisson/Cdf.lean`: `TauCeti.Probability.cdf_compoundPoissonMeasure`, `TauCeti.Probability.cdf_map_natCast_compoundPoissonMeasure`, `TauCeti.Probability.cdf_map_intCast_compoundPoissonMeasure`; `Probability/Distributions/CompoundPoisson/Quantile.lean`: `TauCeti.Probability.quantile_compoundPoissonMeasure_le_iff`, `TauCeti.Probability.quantile_map_natCast_compoundPoissonMeasure_eq_iff`, `TauCeti.Probability.quantile_map_intCast_compoundPoissonMeasure_eq_iff`.
- §7.6. `Probability/Distributions/Poisson/Mixed/Basic.lean`: `TauCeti.Probability.mixedPoissonMeasure_def`, `TauCeti.Probability.measurable_mixedPoissonMeasure`, `TauCeti.Probability.isProbabilityMeasure_mixedPoissonMeasure`, `TauCeti.Probability.mixedPoissonMeasure_dirac`, `TauCeti.Probability.mixedPoissonMeasure_real_singleton`, `TauCeti.Probability.mixedPoissonMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_mixedPoissonMeasure`, `TauCeti.Probability.lintegral_descFactorial_mixedPoissonMeasure`, `TauCeti.Probability.integrable_descFactorial_mixedPoissonMeasure_iff`, `TauCeti.Probability.integral_descFactorial_mixedPoissonMeasure`, `TauCeti.Probability.integral_natCast_mixedPoissonMeasure`, `TauCeti.Probability.integrable_natCast_mixedPoissonMeasure_iff`, `TauCeti.Probability.variance_mixedPoissonMeasure`, `TauCeti.Probability.pgf_mixedPoissonMeasure`, `TauCeti.Probability.integrableExpSet_natCast_mixedPoissonMeasure`, `TauCeti.Probability.mgf_natCast_mixedPoissonMeasure`, `TauCeti.Probability.cgf_natCast_mixedPoissonMeasure`; `Probability/Distributions/Poisson/Mixed/Quantile.lean`: `MeasureTheory.Measure.quantile_map_cast_mixedPoissonMeasure_eq_iff`, `MeasureTheory.Measure.quantile_map_cast_mixedPoissonMeasure_eq_zero_iff`; `Probability/Distributions/Gamma/Poisson.lean`: `TauCeti.Probability.mixedPoissonMeasure_map_toNNReal_gammaMeasure`.
- §7.7. `Probability/Cdf.lean`: `MeasureTheory.Measure.cdf_map_abs_of_nonneg`, `MeasureTheory.Measure.cdf_map_abs_of_neg`, `MeasureTheory.Measure.cdf_map_abs_of_isNegInvariant`; `MeasureTheory/Measure/Real.lean`: `MeasureTheory.Measure.map_abs_apply_zero`; `MeasureTheory/Measure/WithDensity.lean`: `TauCeti.Probability.map_abs_withDensity`; `Probability/Distributions/Folding.lean`: `TauCeti.Probability.hasPDF_abs`, `TauCeti.Probability.pdf_abs`, `TauCeti.Probability.map_abs_eq_cond_Ici`; `Probability/Quantile.lean`: `MeasureTheory.Measure.quantile_map_abs`; `Probability/Distributions/Censoring.lean`: `MeasureTheory.Measure.map_coe_projIcc`, `MeasureTheory.Measure.cdf_map_coe_projIcc`, `MeasureTheory.Measure.quantile_map_coe_projIcc`, `MeasureTheory.Measure.integrable_pow_map_coe_projIcc`, `MeasureTheory.Measure.integral_pow_map_coe_projIcc`, `MeasureTheory.Measure.integral_id_map_coe_projIcc`, `MeasureTheory.Measure.integral_sq_map_coe_projIcc`, `MeasureTheory.Measure.integrableExpSet_id_map_coe_projIcc`, `MeasureTheory.Measure.map_coe_projIci`, `MeasureTheory.Measure.map_coe_projIic`, `MeasureTheory.Measure.cdf_map_coe_projIci`, `MeasureTheory.Measure.quantile_map_coe_projIci`, `MeasureTheory.Measure.cdf_map_coe_projIic`, `MeasureTheory.Measure.quantile_map_coe_projIic`, `MeasureTheory.Measure.integrable_map_coe_projIci_iff`, `MeasureTheory.Measure.integrable_map_coe_projIic_iff`, `MeasureTheory.Measure.integral_id_map_coe_projIci`, `MeasureTheory.Measure.integral_sq_map_coe_projIci`, `MeasureTheory.Measure.integral_id_map_coe_projIic`, `MeasureTheory.Measure.integral_sq_map_coe_projIic`.
- §7.8. `MeasureTheory/Measure/Tilted.lean`: `TauCeti.measurable_tilted`, `TauCeti.measurable_tilted_mul`; `Probability/Moments/Tilted.lean`: `TauCeti.mgf_tilted_mul`, `TauCeti.integrableExpSet_tilted_mul`, `TauCeti.cgf_tilted_mul`; `Probability/Distributions/Tilted.lean`: `TauCeti.Probability.gaussianReal_tilted_mul`, `TauCeti.Probability.gammaMeasure_tilted_mul`, `TauCeti.Probability.poissonMeasure_tilted_mul`, `TauCeti.Probability.binomial_tilted_mul`.
- §7.9. `MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`: `TauCeti.Probability.survival_eq_exp_integral_hazard`; `Probability/Hazard.lean`: `TauCeti.Probability.intervalIntegrable_div_one_sub_cdf`, `TauCeti.Probability.one_sub_cdf_eq_mul_exp_neg_integral`, `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf`, `TauCeti.Probability.intervalIntegrable_div_one_sub_cdf_of_eq_withDensity`, `TauCeti.Probability.one_sub_cdf_eq_exp_neg_integral_rnDeriv`, `TauCeti.Probability.integral_div_one_sub_cdf_of_eq_withDensity`; `Probability/Cdf/Density.lean`: `TauCeti.Probability.cdf_sub_cdf_eq_integral_of_eq_withDensity`, `TauCeti.Probability.absolutelyContinuousOnInterval_cdf_of_eq_withDensity`, `TauCeti.Probability.ae_hasDerivAt_cdf_of_eq_withDensity`, `TauCeti.Probability.hasDerivAt_cdf_of_eq_withDensity`; `Probability/Cdf.lean`: `TauCeti.Probability.one_sub_cdf_zero_eq_one_of_absolutelyContinuous`; `Probability/Distributions/Minimum.lean`: `TauCeti.Probability.neg_log_one_sub_cdf_min_indep`, `TauCeti.Probability.neg_log_one_sub_cdf_map_min_pi`, `TauCeti.Probability.deriv_cdf_min_div_one_sub_cdf`, `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_min_indep`, `TauCeti.Probability.deriv_cdf_map_min_pi_div_one_sub_cdf`, `TauCeti.Probability.ae_deriv_cdf_min_div_one_sub_cdf`, `TauCeti.Probability.intervalIntegrable_deriv_cdf_min_div_one_sub_cdf`, `TauCeti.Probability.deriv_cdf_min_div_one_sub_cdf_of_eq_withDensity`; `Probability/Distributions/Exponential/Hazard.lean`: `TauCeti.Probability.exponentialPDFReal_div_one_sub_cdf`, `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_expMeasure`, `TauCeti.Probability.integral_exponentialPDFReal_div_one_sub_cdf`; `Probability/Distributions/Weibull/Hazard.lean`: `TauCeti.Probability.weibullPDFReal_div_one_sub_cdf`, `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_weibullMeasure`, `TauCeti.Probability.integral_weibullPDFReal_div_one_sub_cdf`; `Probability/Distributions/Gamma/Hazard.lean`: `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_gammaMeasure`, `TauCeti.Probability.intervalIntegrable_gammaPDFReal_div_one_sub_cdf`, `TauCeti.Probability.integral_gammaPDFReal_div_one_sub_cdf`; `Probability/Distributions/LogNormal/Hazard.lean`: `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf_logNormalMeasure`, `TauCeti.Probability.intervalIntegrable_logNormalPDFReal_div_one_sub_cdf`, `TauCeti.Probability.integral_logNormalPDFReal_div_one_sub_cdf`.
- §7.10. `Data/Fin/Tuple/OrderStatistic.lean`: `TauCeti.orderStatistic`, `TauCeti.orderStatistic_comp_of_monotoneOn`; `Probability/Distributions/OrderStatistic/Basic.lean`: `TauCeti.Probability.map_orderStatistic_pi_eq_map_betaMeasure_quantile`, `TauCeti.Probability.hasLaw_orderStatistic_iid_map_betaMeasure_quantile`.
- §7.11. `Probability/Distributions/Gaussian/Continuity.lean`: `TauCeti.Probability.continuous_gaussianReal`, `Continuous.gaussianReal`, `TauCeti.Probability.continuous_multivariateGaussian`, `Continuous.multivariateGaussian`; `Probability/Distributions/LogNormal/Continuity.lean`: `TauCeti.Probability.continuous_logNormalMeasure`, `Continuous.logNormalMeasure`, `TauCeti.Probability.tendsto_logNormalMeasure_nhds_zero_dirac`; `Probability/Distributions/Cauchy/Continuity.lean`: `TauCeti.Probability.continuous_cauchyMeasure`, `TauCeti.Probability.tendsto_cauchyMeasure_nhds_zero_dirac`; `Probability/Distributions/Gamma/Continuity.lean`: `TauCeti.Probability.continuous_gammaMeasure`; `Probability/Distributions/Beta/Continuity.lean`: `TauCeti.Probability.continuous_betaMeasure`; `Probability/Distributions/Dirichlet/Continuity.lean`: `TauCeti.Probability.continuous_dirichletMeasure`, `Continuous.dirichletMeasure`; `Probability/Distributions/Multinomial/Continuity.lean`: `TauCeti.Probability.continuous_multinomialMeasure`, `Continuous.multinomialMeasure`; `Probability/Distributions/ChiSquared/Continuity.lean`: `TauCeti.Probability.continuous_chiSquaredMeasure`; `Probability/Distributions/NegativeBinomial/Continuity.lean`: `TauCeti.Probability.continuous_negativeBinomialMeasure`, `Continuous.negativeBinomialMeasure`; `MeasureTheory/Measure/ProbabilityMeasure/Map.lean`: `MeasureTheory.ProbabilityMeasure.continuous_map_of_measurable`, `MeasureTheory.ProbabilityMeasure.continuous_map_of_continuous_uncurry`; `Probability/Distributions/Mixture.lean`: `TauCeti.Probability.finiteMixtureMeasure`.
- §7.12. `MeasureTheory/Measure/Weighted.lean`: `MeasureTheory.Measure.weighted`, `MeasureTheory.Measure.weighted_def`, `MeasureTheory.Measure.weighted_eq_zero_of_lintegral_eq_zero`, `MeasureTheory.Measure.weighted_eq_zero_of_lintegral_eq_top`, `MeasureTheory.Measure.isProbabilityMeasure_weighted`, `MeasureTheory.Measure.weighted_eq_withDensity`, `MeasureTheory.Measure.rnDeriv_weighted`, `MeasureTheory.Measure.weighted_congr`, `MeasureTheory.Measure.weighted_const_smul`, `MeasureTheory.Measure.integral_weighted`, `MeasureTheory.Measure.integrable_weighted_iff`, `MeasureTheory.Measure.lintegral_weighted`, `ProbabilityTheory.Kernel.measurable_weighted`, `MeasureTheory.Measure.measurable_weighted_const`, `MeasureTheory.Measure.weighted_weighted`; `MeasureTheory/Measure/PowerBias.lean`: `MeasureTheory.Measure.powerBias_def`, `MeasureTheory.Measure.powerBias_eq_smul_withDensity`, `MeasureTheory.Measure.powerBias_eq_tilted`, `MeasureTheory.Measure.powerBias_zero`, `MeasureTheory.Measure.lintegral_powerBiasWeight_eq_of_integrable`, `MeasureTheory.Measure.isProbabilityMeasure_powerBias`, `MeasureTheory.Measure.powerBias_powerBias`, `MeasureTheory.Measure.integrable_rpow_powerBias_iff`, `MeasureTheory.Measure.integral_rpow_powerBias`, `MeasureTheory.Measure.powerBias_eq_zero_of_not_integrable`; `Probability/Distributions/Gamma/PowerBias.lean`: `TauCeti.Probability.powerBias_gammaMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_gammaMeasure_iff`, `TauCeti.Probability.powerBias_gammaMeasure_of_le`; `Probability/Distributions/Beta/PowerBias.lean`: `TauCeti.Probability.powerBias_betaMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_betaMeasure_iff`, `TauCeti.Probability.powerBias_betaMeasure_of_le`; `Probability/Distributions/LogNormal/PowerBias.lean`: `TauCeti.Probability.powerBias_logNormalMeasure`; `Probability/Distributions/Pareto/PowerBias.lean`: `TauCeti.Probability.powerBias_paretoMeasure`, `TauCeti.Probability.isProbabilityMeasure_powerBias_paretoMeasure_iff`, `TauCeti.Probability.powerBias_paretoMeasure_of_le`; `Probability/Distributions/Poisson/SizeBias.lean`: `TauCeti.Probability.weighted_poissonMeasure`, `ProbabilityTheory.HasLaw.succ_poissonMeasure`.
- §7.13. `Probability/Quantile.lean`: `MeasureTheory.Measure.cdf_le_iff_quantile_le`; `MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`: `MeasureTheory.Measure.quantileCoupling_def`, `MeasureTheory.Measure.isCoupling_quantileCoupling`, `MeasureTheory.Measure.ae_fst_le_snd_quantileCoupling`; `MeasureTheory/OptimalTransport/Coupling.lean`: `TauCeti.IsCoupling`; `Probability/StochasticOrder.lean`: `TauCeti.IsCoupling.cdf_le_of_ae_fst_le_snd`, `ProbabilityTheory.HasLaw.cdf_le_of_ae_le`, `MeasureTheory.Measure.exists_isCoupling_ae_fst_le_snd_iff_cdf_le`, `MeasureTheory.Measure.cdf_le_refl`, `MeasureTheory.Measure.cdf_le_trans`, `MeasureTheory.Measure.eq_of_cdf_le_cdf_le`, `MeasureTheory.Measure.cdf_map_le_cdf_map_of_monotone`, `MeasureTheory.Measure.cdf_conv_le_cdf_conv`; `Probability/Distributions/Poisson/StochasticOrder.lean`: `TauCeti.Probability.cdf_map_cast_poissonMeasure_le`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_map_cast_poissonMeasure`; `Probability/Distributions/Binomial/StochasticOrder.lean`: `TauCeti.Probability.cdf_map_cast_binomial_le_of_le_trials`, `TauCeti.Probability.cdf_map_cast_binomial_le_of_le_prob`, `TauCeti.Probability.cdf_map_cast_binomial_le`, `TauCeti.Probability.quantile_map_cast_binomial_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_map_cast_binomial`; `Probability/Distributions/Gamma/StochasticOrder.lean`: `TauCeti.Probability.cdf_gammaMeasure_le_of_shape_le`, `TauCeti.Probability.cdf_gammaMeasure_le_of_rate_le`, `TauCeti.Probability.cdf_gammaMeasure_le`, `TauCeti.Probability.quantile_gammaMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_gammaMeasure`; `Probability/Distributions/Beta/StochasticOrder.lean`: `TauCeti.Probability.cdf_betaMeasure_le_of_le_left`, `TauCeti.Probability.cdf_betaMeasure_le_of_le_right`, `TauCeti.Probability.cdf_betaMeasure_le`, `TauCeti.Probability.quantile_betaMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_betaMeasure`.
- §8.1. `Analysis/SpecialFunctions/BesselI.lean`: `Real.besselI_def`, `Real.besselI_zero`, `Real.hasSum_besselI`, `Real.besselI_eq_rpow_mul`, `Real.hasSum_besselI_natCast`, `Real.besselI_pos`, `Real.one_le_besselI_zero_left`, `Real.besselI_zero_left_pos`, `Real.continuousAt_besselI`, `Real.measurable_besselI`, `Real.continuous_besselI_natCast`, `Real.tendsto_rpow_neg_mul_besselI_nhdsGT_zero`, `Real.hasDerivAt_besselI`, `Real.hasDerivAt_rpow_neg_mul_besselI`, `Real.besselI_sub_besselI`, `Real.integral_exp_mul_cos_mul_cos`, `Real.integral_exp_mul_cos_mul_cexp`, `Real.besselI`.
- §8.2. `Analysis/SpecialFunctions/OwensT.lean`: `Real.owensT_def`, `Real.continuous_owensT`, `Real.measurable_owensT`, `Continuous.owensT`, `Measurable.owensT`, `Real.owensT_neg_left`, `Real.owensT_neg_right`, `Real.owensT_zero_right`, `Real.owensT_zero_left`, `Real.hasDerivAt_owensT_right`, `Real.hasDerivAt_intervalIntegral_owensT`, `Real.abs_owensT_le`, `Real.tendsto_owensT_atTop`, `Real.tendsto_owensT_atBot`, `Real.owensT`; `Probability/Distributions/Gaussian/OwensT.lean`: `Real.hasDerivAt_owensT_left`, `TauCeti.Probability.integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`, `TauCeti.Probability.integrable_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`, `TauCeti.Probability.integral_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`, `TauCeti.Probability.hasDerivAt_cdf_gaussianReal_sub_two_mul_owensT`, `TauCeti.Probability.tendsto_cdf_gaussianReal_sub_two_mul_owensT_atBot`, `TauCeti.Probability.tendsto_cdf_gaussianReal_sub_two_mul_owensT_atTop`.
- §8.3. `NumberTheory/LSeries/RiemannZeta.lean`: `TauCeti.hasSum_nat_add_one_rpow_neg_riemannZeta_re`, `TauCeti.hasSum_nat_rpow_neg_riemannZeta_re`, `TauCeti.measurable_riemannZeta`; `Analysis/SpecialFunctions/Gaussian/LatticeSum.lean`: `Real.gaussianLatticeSum_def`, `Real.gaussianLatticeSum_zero_right`, `Real.hasSum_gaussianLatticeSum`, `Real.gaussianLatticeSum_pos`, `Real.gaussianLatticeSum_neg_right`, `Real.gaussianLatticeSum_add_intCast`, `Real.gaussianLatticeSum_periodic`, `Real.gaussianLatticeSum_neg_left`, `Real.gaussianLatticeSum_intCast_sub`, `Real.summable_pow_mul_exp_neg_sub_sq`, `Real.summable_abs_pow_mul_exp_neg_sub_sq_div`, `Real.hasDerivAt_tsum_pow_mul_exp_neg_sub_sq`, `Real.hasDerivAt_gaussianLatticeSum`, `Real.contDiff_gaussianLatticeSum`, `Real.continuousAt_gaussianLatticeSum`, `Real.measurable_gaussianLatticeSum`, `Real.gaussianLatticeSum_eq_jacobiTheta₂`, `Real.gaussianLatticeSum`; `Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean`: `Real.gaussianLatticeSum_eq_fourier`, `Real.hasSum_gaussianLatticeFourier`, `Real.gaussianLatticeSum_eq_cosineSeries`, `Real.hasSum_gaussianLatticeCosineSeries`, `Real.hasSumUniformly_gaussianLatticeFourier`, `Real.hasSumUniformly_gaussianLatticeCosineSeries`; `Probability/Distributions/Gaussian/Periodization.lean`: `TauCeti.Probability.hasSum_gaussianPDFReal_add_zsmul`, `TauCeti.Probability.summable_gaussianPDFReal_add_zsmul`.
- §8.4. `Analysis/SpecialFunctions/Erf.lean`: `TauCeti.Real.erf`, `Real.range_erf`, `Real.erfInv`, `Real.erf_erfInv`, `Real.erfInv_erf`, `Real.erfInv_eq_iff`, `Real.erfInv_of_notMem`, `Real.erfInv_neg`, `Real.strictMonoOn_erfInv`, `Real.continuousOn_erfInv`, `Real.measurable_erfInv`, `Real.tendsto_erfInv_nhdsLT_one`, `Real.tendsto_erfInv_nhdsGT_neg_one`, `Real.hasDerivAt_erfInv`; `Probability/Distributions/Gamma/Quantile.lean`: `TauCeti.inverseRegularizedGamma_eq_quantile`, `TauCeti.inverseRegularizedGamma_eq_sInf`, `TauCeti.inverseRegularizedGamma_eq_zero_of_not`, `TauCeti.inverseRegularizedGamma_eq_zero_of_nonpos_left`, `TauCeti.inverseRegularizedGamma_eq_zero_of_nonpos_right`, `TauCeti.inverseRegularizedGamma_eq_zero_of_one_le`, `TauCeti.inverseRegularizedGamma_pos`, `TauCeti.regularizedGamma_inverseRegularizedGamma`, `TauCeti.inverseRegularizedGamma_eq_iff`, `TauCeti.inverseRegularizedGamma_le_iff`, `TauCeti.lt_inverseRegularizedGamma_iff`, `TauCeti.inverseRegularizedGamma_lt_iff`, `TauCeti.setOf_le_regularizedGamma_eq_Ici`, `TauCeti.inverseRegularizedGamma_regularizedGamma`, `TauCeti.strictMonoOn_inverseRegularizedGamma`, `TauCeti.continuousOn_inverseRegularizedGamma`, `TauCeti.tendsto_inverseRegularizedGamma_nhdsGT_zero`, `TauCeti.tendsto_inverseRegularizedGamma_nhdsLT_one`, `TauCeti.measurable_inverseRegularizedGamma`, `TauCeti.inverseRegularizedGamma_one`, `TauCeti.inverseRegularizedGamma`; `Analysis/SpecialFunctions/IncompleteBeta.lean`: `TauCeti.exists_unique_regularizedIncompleteBeta_eq`, `TauCeti.inverseRegularizedIncompleteBeta_mem_Ioo`, `TauCeti.regularizedIncompleteBeta_inverse`, `TauCeti.inverseRegularizedIncompleteBeta_eq_zero`, `TauCeti.inverseRegularizedIncompleteBeta_le_iff`, `TauCeti.inverseRegularizedIncompleteBeta_regularizedIncompleteBeta`, `TauCeti.strictMonoOn_inverseRegularizedIncompleteBeta`, `TauCeti.image_inverseRegularizedIncompleteBeta_Ioo`, `TauCeti.continuousAt_inverseRegularizedIncompleteBeta`, `TauCeti.continuousOn_inverseRegularizedIncompleteBeta`, `TauCeti.tendsto_inverseRegularizedIncompleteBeta_zero`, `TauCeti.tendsto_inverseRegularizedIncompleteBeta_one`, `TauCeti.measurable_inverseRegularizedIncompleteBeta`, `TauCeti.inverseRegularizedIncompleteBeta`; `Probability/Distributions/Gaussian/Quantile.lean`: `TauCeti.Probability.quantile_gaussianReal_zero_one`, `TauCeti.Probability.quantile_gaussianReal`.
- §9.1. `Probability/Distributions/Uniform/Finite.lean`: `Finset.uniformOn_coe_finset_eq_uniformOfFinset`, `Finset.uniformOn_coe_finset_apply_singleton`, `TauCeti.Probability.uniformOn_univ_apply_singleton`, `Finset.uniformOn_univ_real_finset`, `Finset.support_uniformOn_coe_finset`, `Finset.integrable_uniformOn_finset`, `Finset.integral_uniformOn_finset`, `TauCeti.Probability.integral_uniformOn_univ`, `Set.BijOn.map_uniformOn`, `Function.Embedding.map_uniformOn_finset`, `Equiv.map_uniformOn_univ`, `TauCeti.Probability.cdf_map_uniformOn_univ`, `TauCeti.Probability.quantile_map_uniformOn_univ_eq_iff`, `TauCeti.Probability.tendsto_quantile_map_uniformOn_univ_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_uniformOn_univ_nhdsLT_one`; `Probability/Distributions/Categorical.lean`: `TauCeti.Probability.categoricalMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_categoricalMeasure`, `TauCeti.Probability.categoricalMeasure_singleton`, `TauCeti.Probability.categoricalMeasure_real_singleton`, `TauCeti.Probability.integral_categoricalMeasure`, `TauCeti.Probability.measurable_categoricalMeasure`, `TauCeti.Probability.continuous_categoricalMeasure`, `Continuous.categoricalMeasure`, `TauCeti.Probability.map_categoricalMeasure`, `TauCeti.Probability.map_piSingle_categoricalMeasure`, `Convexity.StdSimplex.cdf_map_categoricalMeasure`, `Convexity.StdSimplex.quantile_map_categoricalMeasure_eq_iff`, `Convexity.StdSimplex.tendsto_quantile_map_categoricalMeasure_nhdsGT_zero`, `Convexity.StdSimplex.tendsto_quantile_map_categoricalMeasure_nhdsLT_one`; `Probability/Distributions/Rademacher/Basic.lean`: `TauCeti.Probability.rademacherMeasure`, `TauCeti.Probability.rademacherMeasure_eq`, `TauCeti.Probability.rademacherMeasure_map_neg`, `TauCeti.Probability.rademacherMeasure_singleton`, `TauCeti.Probability.support_rademacherMeasure`, `TauCeti.Probability.integrable_rademacherMeasure`, `TauCeti.Probability.integral_rademacherMeasure`, `TauCeti.Probability.integral_pow_rademacherMeasure`, `TauCeti.Probability.integral_id_rademacherMeasure`, `TauCeti.Probability.variance_id_rademacherMeasure`, `TauCeti.Probability.integrableExpSet_id_rademacherMeasure`, `TauCeti.Probability.mgf_id_rademacherMeasure`, `TauCeti.Probability.cgf_id_rademacherMeasure`, `TauCeti.Probability.charFun_rademacherMeasure`, `TauCeti.Probability.cdf_rademacherMeasure`, `TauCeti.Probability.quantile_rademacherMeasure`, `TauCeti.Probability.tendsto_quantile_rademacherMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_rademacherMeasure_nhdsLT_one`; `Probability/Distributions/Uniform/IntegerInterval.lean`: `TauCeti.Probability.uniformOn_Icc_int_of_lt`, `TauCeti.Probability.isProbabilityMeasure_uniformOn_Icc_int`, `TauCeti.Probability.uniformOn_Icc_int_apply_singleton`, `TauCeti.Probability.support_uniformOn_Icc_int`, `TauCeti.Probability.map_add_const_uniformOn_Icc_int`, `TauCeti.Probability.map_neg_uniformOn_Icc_int`, `TauCeti.Probability.integrable_uniformOn_Icc_int`, `TauCeti.Probability.integral_uniformOn_Icc_int`, `TauCeti.Probability.integral_intCast_uniformOn_Icc`, `TauCeti.Probability.variance_intCast_uniformOn_Icc`, `TauCeti.Probability.integrableExpSet_intCast_uniformOn_Icc`, `TauCeti.Probability.mgf_intCast_uniformOn_Icc`, `TauCeti.Probability.cgf_intCast_uniformOn_Icc`, `TauCeti.Probability.charFun_map_intCast_uniformOn_Icc`, `TauCeti.Probability.charFun_map_intCast_uniformOn_Icc_of_exp_ne_one`, `TauCeti.Probability.map_toNat_sub_uniformOn_Icc_int`, `TauCeti.Probability.pgf_uniformOn_Iio`, `TauCeti.Probability.pgf_uniformOn_Iio_of_ne_one`, `TauCeti.Probability.uniformOn_Icc_int_real_Iic`, `TauCeti.Probability.cdf_map_intCast_uniformOn_Icc`, `TauCeti.Probability.quantile_map_intCast_uniformOn_Icc`, `TauCeti.Probability.tendsto_quantile_map_intCast_uniformOn_Icc_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_uniformOn_Icc_nhdsLT_one`; `Probability/Distributions/Multinomial/Basic.lean`: `TauCeti.Probability.multinomialMeasure`.
- §9.2. `Probability/Distributions/BetaBinomial/Basic.lean`: `TauCeti.Probability.betaBinomialMeasure_eq_bind`, `TauCeti.Probability.betaBinomialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.betaBinomialMeasure_zero_trials`, `TauCeti.Probability.measurable_betaBinomialMeasure`, `TauCeti.Probability.isProbabilityMeasure_betaBinomialMeasure`, `TauCeti.Probability.betaBinomialMeasure_real_singleton`, `TauCeti.Probability.betaBinomialMeasure_singleton`, `TauCeti.Probability.betaBinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.betaBinomialMeasure_eq_sum_dirac`, `TauCeti.Probability.integrable_betaBinomialMeasure`, `TauCeti.Probability.integral_betaBinomialMeasure`, `TauCeti.Probability.integral_betaBinomialMeasure_eq_integral`; `Probability/Distributions/BetaBinomial/Moments.lean`: `TauCeti.Probability.integral_pow_map_cast_betaBinomialMeasure`, `TauCeti.Probability.integral_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.integral_sq_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.variance_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.integral_of_hasLaw_betaBinomialMeasure`, `TauCeti.Probability.variance_of_hasLaw_betaBinomialMeasure`; `Probability/Distributions/BetaBinomial/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.pgf_betaBinomialMeasure`, `TauCeti.Probability.mgf_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.cgf_id_map_cast_betaBinomialMeasure`, `TauCeti.Probability.charFun_map_cast_betaBinomialMeasure`; `Probability/Distributions/BetaBinomial/Cdf.lean`: `TauCeti.Probability.betaBinomialMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_betaBinomialMeasure`, `TauCeti.Probability.cdf_map_cast_betaBinomialMeasure_of_neg`, `TauCeti.Probability.betaBinomialMeasure_real_Iic_eq_one`; `Probability/Distributions/BetaBinomial/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_map_cast_betaBinomialMeasure_eq_upper`, `TauCeti.Probability.tendsto_quantile_map_cast_betaBinomialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_betaBinomialMeasure_nhdsLT_one`; `Probability/Distributions/DirichletMultinomial/Basic.lean`: `TauCeti.Probability.dirichletMultinomialMeasure_eq_bind`, `TauCeti.Probability.integral_dirichletMultinomialMeasure_eq_integral`, `TauCeti.Probability.dirichletMultinomialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.measurable_dirichletMultinomialMeasure`, `TauCeti.Probability.isProbabilityMeasure_dirichletMultinomialMeasure`, `TauCeti.Probability.dirichletMultinomialMeasure_real_singleton`, `TauCeti.Probability.dirichletMultinomialMeasure_singleton`, `TauCeti.Probability.dirichletMultinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.dirichletMultinomialMeasure_eq_sum_dirac`, `TauCeti.Probability.dirichletMultinomialMeasure_zero_trials`, `TauCeti.Probability.dirichletMultinomialMeasure_eq_dirac_of_subsingleton`, `TauCeti.Probability.integrable_dirichletMultinomialMeasure`, `TauCeti.Probability.integral_dirichletMultinomialMeasure`, `TauCeti.Probability.integral_map_multinomialToEuclidean_dirichletMultinomialMeasure`; `Probability/Distributions/Multinomial/Basic.lean`: `TauCeti.Probability.multinomialToEuclidean`; `Probability/Distributions/DirichletMultinomial/Moments.lean`: `TauCeti.Probability.memLp_id_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.integral_id_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.covariance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure_of_ne`, `TauCeti.Probability.variance_eval_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_dirichletMultinomialMeasure`; `Probability/Distributions/DirichletMultinomial/Aggregation.lean`: `TauCeti.Probability.map_funOnFinite_map_dirichletMultinomialMeasure`, `ProbabilityTheory.HasLaw.funOnFinite_map_dirichletMultinomialMeasure`, `TauCeti.Probability.map_eval_dirichletMultinomialMeasure`, `ProbabilityTheory.HasLaw.eval_dirichletMultinomialMeasure`, `TauCeti.Probability.map_sum_dirichletMultinomialMeasure`; `Probability/Distributions/DirichletMultinomial/Transforms.lean`: `TauCeti.Probability.charFun_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.integrableExpSet_map_multinomialToEuclidean_dirichletMultinomialMeasure`, `TauCeti.Probability.mgf_inner_dirichletMultinomialMeasure`, `TauCeti.Probability.cgf_inner_dirichletMultinomialMeasure`; `Probability/Distributions/Dirichlet/Basic.lean`: `TauCeti.Probability.dirichletMeasure`.
- §9.3. `Probability/Distributions/MultivariateHypergeometric/Basic.lean`: `TauCeti.Probability.multivariateHypergeometricMeasure_def`, `TauCeti.Probability.multivariateHypergeometricWeight_def`, `TauCeti.Probability.multivariateHypergeometricMeasure_singleton`, `TauCeti.Probability.multivariateHypergeometricMeasure_real_singleton`, `TauCeti.Probability.multivariateHypergeometricMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.isProbabilityMeasure_multivariateHypergeometricMeasure_iff`, `TauCeti.Probability.multivariateHypergeometricMeasure_eq_zero_of_lt`, `TauCeti.Probability.measurable_multivariateHypergeometricMeasure`, `TauCeti.Probability.ae_multivariateHypergeometricMeasure`, `TauCeti.Probability.integrable_multivariateHypergeometricMeasure`, `TauCeti.Probability.integral_multivariateHypergeometricMeasure`, `TauCeti.Probability.multivariateHypergeometricMeasure_eq_dirac_of_support`, `TauCeti.Probability.multivariateHypergeometricMeasure_zero_sample`, `TauCeti.Probability.multivariateHypergeometricMeasure_full_sample`; `Probability/Distributions/MultivariateHypergeometric/Aggregation.lean`: `TauCeti.Probability.map_funOnFinite_map_multivariateHypergeometricMeasure`, `ProbabilityTheory.HasLaw.funOnFinite_map_multivariateHypergeometricMeasure`, `TauCeti.Probability.map_sum_multivariateHypergeometricMeasure`; `Probability/Distributions/MultivariateHypergeometric/Marginal.lean`: `TauCeti.Probability.map_eval_multivariateHypergeometricMeasure`; `Probability/Distributions/MultivariateHypergeometric/Moments.lean`: `TauCeti.Probability.integral_cast_apply_multivariateHypergeometricMeasure`, `TauCeti.Probability.covariance_cast_apply_multivariateHypergeometricMeasure`, `TauCeti.Probability.variance_cast_apply_multivariateHypergeometricMeasure`, `TauCeti.Probability.variance_sum_cast_apply_multivariateHypergeometricMeasure`, `TauCeti.Probability.memLp_id_map_multinomialToEuclidean_multivariateHypergeometricMeasure`, `TauCeti.Probability.integral_id_map_multinomialToEuclidean_multivariateHypergeometricMeasure`, `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_multivariateHypergeometricMeasure`, `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_multivariateHypergeometricMeasure`; `Probability/Distributions/NegativeHypergeometric/Basic.lean`: `TauCeti.Probability.negativeHypergeometricMeasure_real_singleton`, `TauCeti.Probability.negativeHypergeometricWeight_of_le`, `TauCeti.Probability.negativeHypergeometricWeight_of_not_le`, `TauCeti.Probability.negativeHypergeometricMeasure_zero_successes`, `TauCeti.Probability.negativeHypergeometricMeasure_eq_zero_of_invalid`, `TauCeti.Probability.measurable_negativeHypergeometricMeasure`, `TauCeti.Probability.isProbabilityMeasure_negativeHypergeometricMeasure`, `TauCeti.Probability.negativeHypergeometricMeasure_eq_sum_dirac`, `TauCeti.Probability.negativeHypergeometricMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.integral_negativeHypergeometricMeasure`, `TauCeti.Probability.integral_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.integral_ascFactorial_negativeHypergeometricMeasure`, `TauCeti.Probability.integral_id_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.variance_id_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.mgf_id_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.cgf_id_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.charFun_map_cast_negativeHypergeometricMeasure`; `Data/Finset/SuccessPositions.lean`: `Finset.failuresBeforeSuccess`; `Probability/Distributions/NegativeHypergeometric/Sampling.lean`: `TauCeti.Probability.map_failuresBeforeSuccess_uniformOn_powersetCard`, `ProbabilityTheory.HasLaw.failuresBeforeSuccess_negativeHypergeometricMeasure`; `Probability/Distributions/Uniform/Permutation.lean`: `Finset.map_uniformOn_perm`, `Finset.map_preimage_uniformOn_perm`, `ProbabilityTheory.HasLaw.preimage_finset_uniformOn_perm`; `Probability/Distributions/NegativeHypergeometric/Cdf.lean`: `TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_hypergeometric_tail`, `TauCeti.Probability.measureReal_le_of_hasLaw_negativeHypergeometricMeasure`, `TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_sum`, `TauCeti.Probability.negativeHypergeometricMeasure_real_Iic_eq_one`, `TauCeti.Probability.cdf_map_cast_negativeHypergeometricMeasure`, `TauCeti.Probability.cdf_map_cast_negativeHypergeometricMeasure_of_neg`; `Probability/Distributions/NegativeHypergeometric/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_map_cast_negativeHypergeometricMeasure_eq_upper`, `TauCeti.Probability.tendsto_quantile_map_cast_negativeHypergeometricMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_negativeHypergeometricMeasure_nhdsLT_one`; `Probability/Distributions/Hypergeometric/Basic.lean`: `TauCeti.Probability.hypergeometricMeasure`.
- §9.4. `Probability/Distributions/PoissonBinomial/Basic.lean`: `TauCeti.Probability.poissonBinomialWeight_def`, `TauCeti.Probability.poissonBinomialMeasure_eq_sum`, `TauCeti.Probability.poissonBinomialMeasure_apply`, `TauCeti.Probability.sum_poissonBinomialWeight`, `TauCeti.Probability.isProbabilityMeasure_poissonBinomialMeasure`, `TauCeti.Probability.measurable_poissonBinomialMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_sum_poissonBinomialMeasure`, `TauCeti.Probability.map_sum_pi_bernoulliMeasure`, `TauCeti.Probability.map_sum_natCast_pi_bernoulliMeasure`, `TauCeti.Probability.poissonBinomialMeasure_singleton`, `TauCeti.Probability.poissonBinomialMeasure_real_singleton`, `TauCeti.Probability.poissonBinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.poissonBinomialMeasure_singleton_eq_zero`, `TauCeti.Probability.poissonBinomialMeasure_Iic_card`, `TauCeti.Probability.pgf_poissonBinomialMeasure`, `TauCeti.Probability.integrable_poissonBinomialMeasure`, `TauCeti.Probability.integral_poissonBinomialMeasure`, `TauCeti.Probability.poissonBinomialMeasure_eq_conv_bernoulliMeasure`, `TauCeti.Probability.poissonBinomialMeasure_of_isEmpty`, `TauCeti.Probability.poissonBinomialMeasure_const`; `Probability/Distributions/PoissonBinomial/Count.lean`: `ProbabilityTheory.iIndepFun.hasLaw_card_filter_mem`, `TauCeti.Probability.hasLaw_card_filter_mem_pi`; `Probability/Distributions/PoissonBinomial/Moments.lean`: `TauCeti.Probability.integrable_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.integral_pow_id_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.integral_id_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.variance_id_map_cast_poissonBinomialMeasure`; `Probability/Distributions/PoissonBinomial/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.mgf_id_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.cgf_id_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.charFun_map_cast_poissonBinomialMeasure`; `Probability/Distributions/PoissonBinomial/Cdf.lean`: `TauCeti.Probability.poissonBinomialMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_poissonBinomialMeasure`, `TauCeti.Probability.cdf_map_cast_poissonBinomialMeasure_of_neg`, `TauCeti.Probability.poissonBinomialMeasure_real_Iic_eq_zero_of_lt_lower`, `TauCeti.Probability.poissonBinomialMeasure_real_Iic_eq_one_of_upper_le`; `Probability/Distributions/PoissonBinomial/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_lower`, `TauCeti.Probability.quantile_map_cast_poissonBinomialMeasure_eq_upper`, `TauCeti.Probability.tendsto_quantile_map_cast_poissonBinomialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_poissonBinomialMeasure_nhdsLT_one`.
- §9.5. `Probability/Distributions/Skellam/Basic.lean`: `TauCeti.Probability.skellamMeasure_def`, `ProbabilityTheory.IndepFun.hasLaw_sub_skellamMeasure`, `TauCeti.Probability.measurable_skellamMeasure`, `TauCeti.Probability.hasSum_skellamMeasure_mass`, `TauCeti.Probability.skellamMeasure_singleton_natCast`, `TauCeti.Probability.skellamMeasure_singleton_natCast_eq_tsum`, `TauCeti.Probability.skellamMeasure_real_singleton_eq_tsum`, `TauCeti.Probability.skellamMeasure_singleton_neg`, `TauCeti.Probability.skellamMeasure_singleton_pos`, `TauCeti.Probability.support_skellamMeasure`, `TauCeti.Probability.map_neg_skellamMeasure`, `TauCeti.Probability.skellamMeasure_zero_right`, `TauCeti.Probability.skellamMeasure_zero_left`, `TauCeti.Probability.skellamMeasure_zero_zero`; `Probability/Distributions/Skellam/Transforms.lean`: `TauCeti.Probability.skellamMeasure_conv_skellamMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_skellamMeasure`, `TauCeti.Probability.integrable_pow_intCast_skellamMeasure`, `TauCeti.Probability.integral_intCast_skellamMeasure`, `TauCeti.Probability.variance_intCast_skellamMeasure`, `TauCeti.Probability.integrable_exp_mul_intCast_skellamMeasure`, `TauCeti.Probability.integrableExpSet_intCast_skellamMeasure`, `TauCeti.Probability.mgf_intCast_skellamMeasure`, `TauCeti.Probability.cgf_intCast_skellamMeasure`, `TauCeti.Probability.charFun_map_intCast_skellamMeasure`, `TauCeti.Probability.map_intCast_skellamMeasure`; `Probability/Distributions/Skellam/Cdf.lean`: `TauCeti.Probability.hasSum_skellamMeasure_real_Iic_mass`, `TauCeti.Probability.skellamMeasure_real_Iic`, `TauCeti.Probability.hasSum_skellamMeasure_real_Iic`, `TauCeti.Probability.cdf_map_intCast_skellamMeasure`, `TauCeti.Probability.skellamMeasure_real_Iic_eq_one_sub`, `TauCeti.Probability.skellamMeasure_real_Iic_pos`, `TauCeti.Probability.skellamMeasure_real_Iic_lt_one`; `Probability/Distributions/Skellam/Quantile.lean`: `TauCeti.Probability.quantile_map_intCast_skellamMeasure_eq_iff`, `TauCeti.Probability.quantile_map_intCast_skellamMeasure_zero_left_eq_zero_iff`, `TauCeti.Probability.quantile_map_intCast_skellamMeasure_zero_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_skellamMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_skellamMeasure_nhdsLT_one`.
- §9.6. `Probability/Distributions/Zipf/Basic.lean`: `TauCeti.Probability.zipfMeasure_singleton`, `TauCeti.Probability.zipfMeasure_real_singleton`, `TauCeti.Probability.zipfWeightReal_def`, `TauCeti.Probability.zipfMeasure_singleton_zero`, `TauCeti.Probability.hasSum_zipfWeightReal`, `TauCeti.Probability.isProbabilityMeasure_zipfMeasure`, `TauCeti.Probability.zipfMeasure_eq_sum_dirac`, `TauCeti.Probability.zipfMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.ae_pos_zipfMeasure`, `TauCeti.Probability.zipfMeasure_of_le_one`, `TauCeti.Probability.measurable_zipfMeasure`; `Probability/Distributions/Zipf/Moments.lean`: `TauCeti.Probability.integrable_pow_map_cast_zipfMeasure_iff`, `TauCeti.Probability.integral_pow_map_cast_zipfMeasure`, `TauCeti.Probability.integrable_id_map_cast_zipfMeasure_iff`, `TauCeti.Probability.integral_id_map_cast_zipfMeasure`, `TauCeti.Probability.memLp_two_id_map_cast_zipfMeasure_iff`, `TauCeti.Probability.variance_id_map_cast_zipfMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_zipfMeasure`; `Probability/Distributions/Zipf/Cdf.lean`: `TauCeti.Probability.zipfMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_zipfMeasure`, `TauCeti.Probability.cdf_map_cast_zipfMeasure_of_lt_one`, `TauCeti.Probability.cdf_map_cast_zipfMeasure_lt_one`; `Probability/Distributions/Zipf/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_succ_iff`, `TauCeti.Probability.quantile_map_cast_zipfMeasure_eq_one_iff`, `TauCeti.Probability.tendsto_quantile_map_cast_zipfMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_zipfMeasure_nhdsLT_one`; `Probability/Distributions/Zipf/Finite.lean`: `TauCeti.Probability.finiteZipfNormalizer_def`, `TauCeti.Probability.finiteZipfMeasure_eq_sum_dirac`, `TauCeti.Probability.finiteZipfMeasure_real_singleton`, `TauCeti.Probability.finiteZipfMeasure_zero_left`, `TauCeti.Probability.isProbabilityMeasure_finiteZipfMeasure_iff`, `TauCeti.Probability.finiteZipfMeasure_one_left`, `TauCeti.Probability.finiteZipfMeasure_zero_right`, `TauCeti.Probability.support_finiteZipfMeasure`, `TauCeti.Probability.measurable_finiteZipfMeasure`, `TauCeti.Probability.integral_finiteZipfMeasure`, `TauCeti.Probability.integral_map_cast_finiteZipfMeasure`, `TauCeti.Probability.integral_rpow_map_cast_finiteZipfMeasure`, `TauCeti.Probability.integral_pow_map_cast_finiteZipfMeasure`, `TauCeti.Probability.integral_id_map_cast_finiteZipfMeasure`, `TauCeti.Probability.variance_id_map_cast_finiteZipfMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_finiteZipfMeasure`, `TauCeti.Probability.pgf_finiteZipfMeasure`, `TauCeti.Probability.mgf_id_map_cast_finiteZipfMeasure`, `TauCeti.Probability.cgf_id_map_cast_finiteZipfMeasure`, `TauCeti.Probability.charFun_map_cast_finiteZipfMeasure`, `TauCeti.Probability.finiteZipfMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_finiteZipfMeasure`, `TauCeti.Probability.quantile_map_cast_finiteZipfMeasure_eq_iff`, `TauCeti.Probability.tendsto_quantile_map_cast_finiteZipfMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_finiteZipfMeasure_nhdsLT_one`, `TauCeti.Probability.finiteZipfMeasure_eq_cond`, `TauCeti.Probability.tvDist_finiteZipfMeasure_zipfMeasure`, `TauCeti.Probability.tendsto_tvDist_finiteZipfMeasure_zipfMeasure`.
- §9.7. `Probability/Distributions/YuleSimon/Basic.lean`: `TauCeti.Probability.yuleSimonMeasure_real_singleton`, `TauCeti.Probability.yuleSimonWeightReal_def`, `TauCeti.Probability.yuleSimonMeasure_singleton_zero`, `TauCeti.Probability.yuleSimonMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_yuleSimonMeasure`, `TauCeti.Probability.yuleSimonMeasure_eq_sum_dirac`, `TauCeti.Probability.yuleSimonMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.ae_pos_yuleSimonMeasure`, `TauCeti.Probability.measurable_yuleSimonMeasure`, `TauCeti.Probability.yuleSimonWeightReal_one`, `TauCeti.Probability.yuleSimonWeightReal_add_one`, `TauCeti.Probability.yuleSimonMeasure_real_Ioi`, `TauCeti.Probability.yuleSimonMeasure_real_Ioi_zero`, `TauCeti.Probability.yuleSimonMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_yuleSimonMeasure`, `TauCeti.Probability.cdf_map_cast_yuleSimonMeasure_of_lt_one`; `Probability/Distributions/YuleSimon/Moments.lean`: `TauCeti.Probability.integrable_pow_map_cast_yuleSimonMeasure_iff`, `TauCeti.Probability.integral_ascPochhammer_map_cast_yuleSimonMeasure`, `TauCeti.Probability.integral_id_map_cast_yuleSimonMeasure`, `TauCeti.Probability.variance_id_map_cast_yuleSimonMeasure`, `TauCeti.Probability.integrableExpSet_id_map_cast_yuleSimonMeasure`; `Probability/Distributions/YuleSimon/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_yuleSimonMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_yuleSimonMeasure_eq_one_iff`, `TauCeti.Probability.tendsto_quantile_map_cast_yuleSimonMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_yuleSimonMeasure_nhdsLT_one`; `Probability/Distributions/LogarithmicSeries/Basic.lean`: `TauCeti.Probability.logarithmicSeriesMeasure_real_singleton`, `TauCeti.Probability.logarithmicSeriesWeightReal_eq_div`, `TauCeti.Probability.logarithmicSeriesMeasure_singleton_zero`, `TauCeti.Probability.logarithmicSeriesMeasure_eq_zero_of_invalid`, `TauCeti.Probability.isProbabilityMeasure_logarithmicSeriesMeasure`, `TauCeti.Probability.logarithmicSeriesMeasure_eq_sum_dirac`, `TauCeti.Probability.logarithmicSeriesMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.ae_pos_logarithmicSeriesMeasure`, `TauCeti.Probability.measurable_logarithmicSeriesMeasure`, `TauCeti.Probability.integrable_pow_logarithmicSeriesMeasure_iff`, `TauCeti.Probability.pgf_logarithmicSeriesMeasure`; `Probability/Distributions/LogarithmicSeries/Transforms.lean`: `TauCeti.Probability.integral_id_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.variance_id_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.integral_of_hasLaw_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.variance_of_hasLaw_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.integrable_exp_mul_id_map_cast_logarithmicSeriesMeasure_iff`, `TauCeti.Probability.integrableExpSet_id_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.mgf_id_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.cgf_id_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.charFun_map_cast_logarithmicSeriesMeasure`; `Probability/Distributions/LogarithmicSeries/Cdf.lean`: `TauCeti.Probability.logarithmicSeriesMeasure_real_Iic`, `TauCeti.Probability.logarithmicSeriesMeasure_real_Ioi`, `TauCeti.Probability.logarithmicSeriesMeasure_real_Iic_lt_one`, `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure`, `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure_of_lt_one`, `TauCeti.Probability.cdf_map_cast_logarithmicSeriesMeasure_lt_one`; `Probability/Distributions/LogarithmicSeries/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_succ_iff`, `TauCeti.Probability.quantile_map_cast_logarithmicSeriesMeasure_eq_one_iff`, `TauCeti.Probability.tendsto_quantile_map_cast_logarithmicSeriesMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_logarithmicSeriesMeasure_nhdsLT_one`; `Probability/Distributions/LogarithmicSeries/CompoundPoisson.lean`: `TauCeti.Probability.compoundPoissonMeasure_logarithmicSeriesMeasure`, `ProbabilityTheory.iIndepFun.hasLaw_sum_range_negativeBinomialMeasure`.
- §9.8. `Probability/Distributions/DiscreteLaplace/Basic.lean`: `TauCeti.Probability.discreteLaplaceMeasure_real_singleton`, `TauCeti.Probability.discreteLaplaceWeightReal_def`, `TauCeti.Probability.discreteLaplaceMeasure_eq_sum_dirac`, `TauCeti.Probability.discreteLaplaceMeasure_zero_right`, `TauCeti.Probability.discreteLaplaceMeasure_eq_zero_of_invalid`, `TauCeti.Probability.isProbabilityMeasure_discreteLaplaceMeasure`, `TauCeti.Probability.discreteLaplaceMeasure_singleton_pos`, `TauCeti.Probability.support_discreteLaplaceMeasure`, `TauCeti.Probability.map_add_const_discreteLaplaceMeasure`, `TauCeti.Probability.map_neg_discreteLaplaceMeasure`, `TauCeti.Probability.measurable_discreteLaplaceMeasure`; `Probability/Distributions/DiscreteLaplace/Transforms.lean`: `TauCeti.Probability.integrable_pow_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.integral_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.variance_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.integrable_exp_mul_intCast_discreteLaplaceMeasure_iff`, `TauCeti.Probability.integrableExpSet_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.mgf_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.cgf_intCast_discreteLaplaceMeasure`, `TauCeti.Probability.charFun_map_intCast_discreteLaplaceMeasure`; `Probability/Distributions/DiscreteLaplace/Cdf.lean`: `TauCeti.Probability.discreteLaplaceMeasure_real_Iic`, `TauCeti.Probability.discreteLaplaceMeasure_real_Iic_of_le`, `TauCeti.Probability.cdf_map_intCast_discreteLaplaceMeasure`; `Probability/Distributions/DiscreteLaplace/Quantile.lean`: `TauCeti.Probability.quantile_map_intCast_discreteLaplaceMeasure_eq_iff`, `TauCeti.Probability.quantile_map_intCast_discreteLaplaceMeasure_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_discreteLaplaceMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_discreteLaplaceMeasure_nhdsLT_one`; `Probability/Distributions/DiscreteGaussian/Basic.lean`: `TauCeti.Probability.discreteGaussianMeasure_real_singleton`, `TauCeti.Probability.discreteGaussianWeightReal_def`, `TauCeti.Probability.discreteGaussianMeasure_eq_sum_dirac`, `TauCeti.Probability.discreteGaussianMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_discreteGaussianMeasure_iff`, `TauCeti.Probability.measurable_discreteGaussianMeasure`, `TauCeti.Probability.discreteGaussianMeasure_singleton_pos`, `TauCeti.Probability.support_discreteGaussianMeasure`, `TauCeti.Probability.map_add_const_discreteGaussianMeasure`, `TauCeti.Probability.map_neg_discreteGaussianMeasure`; `Probability/Distributions/DiscreteGaussian/Moments.lean`: `TauCeti.Probability.integrable_pow_intCast_discreteGaussianMeasure`, `TauCeti.Probability.integral_pow_intCast_discreteGaussianMeasure`, `TauCeti.Probability.integral_intCast_discreteGaussianMeasure`, `TauCeti.Probability.variance_intCast_discreteGaussianMeasure`, `TauCeti.Probability.integral_intCast_discreteGaussianMeasure_of_two_mul_eq_intCast`; `Probability/Distributions/DiscreteGaussian/Transforms.lean`: `TauCeti.Probability.integrable_exp_mul_intCast_discreteGaussianMeasure`, `TauCeti.Probability.integrableExpSet_intCast_discreteGaussianMeasure`, `TauCeti.Probability.mgf_intCast_discreteGaussianMeasure`, `TauCeti.Probability.cgf_intCast_discreteGaussianMeasure`, `TauCeti.Probability.hasSum_charFun_map_intCast_discreteGaussianMeasure`; `Probability/Distributions/DiscreteGaussian/Cdf.lean`: `TauCeti.Probability.hasSum_discreteGaussianMeasure_real_Iic`, `TauCeti.Probability.discreteGaussianMeasure_real_Iic`, `TauCeti.Probability.cdf_map_intCast_discreteGaussianMeasure`, `TauCeti.Probability.discreteGaussianMeasure_real_Iic_pos`, `TauCeti.Probability.discreteGaussianMeasure_real_Iic_lt_one`; `Probability/Distributions/DiscreteGaussian/Quantile.lean`: `TauCeti.Probability.quantile_map_intCast_discreteGaussianMeasure_eq_iff`, `TauCeti.Probability.quantile_map_intCast_discreteGaussianMeasure_eq_iff_lt_le`, `TauCeti.Probability.tendsto_quantile_map_intCast_discreteGaussianMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_intCast_discreteGaussianMeasure_nhdsLT_one`.
- §9.9. `Probability/Distributions/NegativeMultinomial/Basic.lean`: `TauCeti.Probability.negativeMultinomialMeasure_of_pos`, `TauCeti.Probability.negativeMultinomialMeasure_zero`, `TauCeti.Probability.negativeMultinomialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.measurable_negativeMultinomialMeasure`, `TauCeti.Probability.isProbabilityMeasure_negativeMultinomialMeasure`, `TauCeti.Probability.negativeMultinomialMeasure_real_singleton`, `TauCeti.Probability.negativeMultinomialWeightReal_of_ne_zero`, `TauCeti.Probability.negativeMultinomialWeightReal_zero`, `TauCeti.Probability.negativeMultinomialMeasure_eq_sum_dirac`, `TauCeti.Probability.negativeMultinomialMeasure_singleton_ne_zero_iff`, `TauCeti.Probability.negativeMultinomialMeasure_eq_dirac_of_successWeight_eq_one`; `Probability/Distributions/NegativeMultinomial/Moments.lean`: `TauCeti.Probability.integral_cast_apply_negativeMultinomialMeasure`, `TauCeti.Probability.integral_mul_cast_apply_negativeMultinomialMeasure`, `TauCeti.Probability.covariance_cast_apply_negativeMultinomialMeasure`, `TauCeti.Probability.variance_cast_apply_negativeMultinomialMeasure`, `TauCeti.Probability.memLp_cast_apply_negativeMultinomialMeasure`, `TauCeti.Probability.memLp_id_map_multinomialToEuclidean_negativeMultinomialMeasure`, `TauCeti.Probability.integral_id_map_multinomialToEuclidean_negativeMultinomialMeasure`, `TauCeti.Probability.covMatrix_map_multinomialToEuclidean_negativeMultinomialMeasure`, `TauCeti.Probability.covarianceBilin_map_multinomialToEuclidean_negativeMultinomialMeasure`; `Probability/Distributions/NegativeMultinomial/FactorialMoments.lean`: `TauCeti.Probability.integrable_prod_descFactorial_negativeMultinomialMeasure`, `TauCeti.Probability.integral_prod_descFactorial_negativeMultinomialMeasure`, `TauCeti.Probability.integrable_prod_pow_negativeMultinomialMeasure`, `TauCeti.Probability.integral_prod_pow_negativeMultinomialMeasure`; `Probability/Distributions/NegativeMultinomial/Transforms.lean`: `TauCeti.Probability.integrable_exp_mul_sum_mul_natCast_negativeMultinomialMeasure_iff`, `TauCeti.Probability.integrableExpSet_sum_mul_natCast_negativeMultinomialMeasure`, `TauCeti.Probability.mgf_sum_mul_natCast_negativeMultinomialMeasure`, `TauCeti.Probability.cgf_sum_mul_natCast_negativeMultinomialMeasure`; `Probability/Distributions/NegativeMultinomial/CharFun.lean`: `TauCeti.Probability.charFun_map_multinomialToEuclidean_negativeMultinomialMeasure`; `Probability/Distributions/NegativeMultinomial/Aggregation.lean`: `TauCeti.Probability.map_funOnFinite_map_negativeMultinomialMeasure`, `ProbabilityTheory.HasLaw.funOnFinite_map_negativeMultinomialMeasure`, `TauCeti.Probability.map_eval_negativeMultinomialMeasure`, `TauCeti.Probability.map_sum_negativeMultinomialMeasure`, `ProbabilityTheory.HasLaw.eval_negativeMultinomialMeasure`, `ProbabilityTheory.HasLaw.sum_negativeMultinomialMeasure`; `Probability/Distributions/NegativeMultinomial/Convolution.lean`: `TauCeti.Probability.negativeMultinomialMeasure_conv_negativeMultinomialMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_negativeMultinomialMeasure`; `Probability/Distributions/NegativeBinomial/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_zero`, `TauCeti.Probability.quantile_map_cast_negativeBinomialMeasure_one`.
- §9.10. `Probability/Distributions/BetaNegativeBinomial/Basic.lean`: `TauCeti.Probability.betaNegativeBinomialMeasure_eq_bind`, `TauCeti.Probability.betaNegativeBinomialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.measurable_betaNegativeBinomialMeasure`, `TauCeti.Probability.betaNegativeBinomialMeasure_zero`, `TauCeti.Probability.betaNegativeBinomialMeasure_real_singleton`, `TauCeti.Probability.betaNegativeBinomialWeightReal_of_ne_zero`, `TauCeti.Probability.betaNegativeBinomialWeightReal_pos_of_pos`, `TauCeti.Probability.isProbabilityMeasure_betaNegativeBinomialMeasure`, `TauCeti.Probability.hasSum_betaNegativeBinomialWeightReal`, `TauCeti.Probability.betaNegativeBinomialMeasure_eq_sum_dirac`, `TauCeti.Probability.betaNegativeBinomialMeasure_singleton_ne_zero_iff`; `Probability/Distributions/BetaNegativeBinomial/Moments.lean`: `TauCeti.Probability.integrableExpSet_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.integrable_pow_map_cast_betaNegativeBinomialMeasure_iff`, `TauCeti.Probability.integrable_descFactorial_betaNegativeBinomialMeasure_iff`, `TauCeti.Probability.integral_descFactorial_betaNegativeBinomialMeasure`, `TauCeti.Probability.integrable_id_map_cast_betaNegativeBinomialMeasure_iff`, `TauCeti.Probability.integral_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.memLp_two_id_map_cast_betaNegativeBinomialMeasure_iff`, `TauCeti.Probability.integral_sq_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.variance_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.integral_of_hasLaw_betaNegativeBinomialMeasure`, `TauCeti.Probability.variance_of_hasLaw_betaNegativeBinomialMeasure`; `Probability/Distributions/BetaNegativeBinomial/Cdf.lean`: `TauCeti.Probability.betaNegativeBinomialMeasure_real_Iic`, `TauCeti.Probability.cdf_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.cdf_map_cast_betaNegativeBinomialMeasure_of_neg`, `TauCeti.Probability.betaNegativeBinomialMeasure_real_Iic_lt_one`; `Probability/Distributions/BetaNegativeBinomial/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_map_cast_betaNegativeBinomialMeasure_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_betaNegativeBinomialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_betaNegativeBinomialMeasure_nhdsLT_one`; `Probability/Distributions/BetaNegativeBinomial/Transforms.lean`: `TauCeti.Probability.hasSum_pgf_betaNegativeBinomialMeasure`, `TauCeti.Probability.hasSum_mgf_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.cgf_id_map_cast_betaNegativeBinomialMeasure`, `TauCeti.Probability.hasSum_charFun_map_cast_betaNegativeBinomialMeasure`; `Probability/Distributions/BetaNegativeBinomial/YuleSimon.lean`: `TauCeti.Probability.map_succ_betaNegativeBinomialMeasure`, `ProbabilityTheory.HasLaw.succ_yuleSimonMeasure`.
- §9.11. `Probability/Distributions/OrderStatistic/Independent.lean`: `TauCeti.Probability.cdf_map_orderStatistic_pi_eq_poissonBinomial`, `TauCeti.Probability.cdf_map_orderStatistic_pi_eq_sum`, `TauCeti.Probability.measureReal_setOf_orderStatistic_le_indep`.
- §10.1. `Probability/Distributions/Logistic/Basic.lean`: `TauCeti.Probability.logisticMeasure_of_pos`, `TauCeti.Probability.logisticMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_logisticMeasure`, `TauCeti.Probability.hasLaw_logisticMeasure_of_hasLaw_uniformMeasure`, `TauCeti.Probability.logisticPDFReal_of_pos`, `TauCeti.Probability.logisticPDFReal_pos`, `TauCeti.Probability.logisticPDFReal`, `TauCeti.Probability.logisticPDF`, `TauCeti.Probability.logisticMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_logisticMeasure`, `TauCeti.Probability.rnDeriv_logisticMeasure`, `TauCeti.Probability.cdf_logisticMeasure_eq`, `TauCeti.Probability.continuous_cdf_logisticMeasure`, `TauCeti.Probability.strictMono_cdf_logisticMeasure`, `TauCeti.Probability.support_logisticMeasure`, `TauCeti.Probability.quantile_logisticMeasure`, `TauCeti.Probability.measurable_logisticMeasure`; `Probability/Distributions/Logistic/Quantile.lean`: `TauCeti.Probability.tendsto_quantile_logisticMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_logisticMeasure_nhdsLT_one`; `Probability/Distributions/Logistic/Moments.lean`: `TauCeti.Probability.integrable_pow_logisticMeasure`, `TauCeti.Probability.integral_id_logisticMeasure`, `TauCeti.Probability.variance_id_logisticMeasure`; `Probability/Distributions/Logistic/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_logisticMeasure`, `TauCeti.Probability.mgf_id_logisticMeasure`, `TauCeti.Probability.cgf_id_logisticMeasure`, `TauCeti.Probability.charFun_logisticMeasure`, `TauCeti.Probability.charFun_logisticMeasure_zero`.
- §10.2. `Probability/Distributions/Gumbel/Basic.lean`: `TauCeti.Probability.gumbelMeasure_of_pos`, `TauCeti.Probability.hasLaw_gumbelMeasure_of_hasLaw_expMeasure`, `TauCeti.Probability.gumbelMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_gumbelMeasure`, `TauCeti.Probability.cdf_gumbelMeasure_eq`, `TauCeti.Probability.strictMono_cdf_gumbelMeasure`, `TauCeti.Probability.support_gumbelMeasure`, `TauCeti.Probability.quantile_gumbelMeasure`, `TauCeti.Probability.tendsto_quantile_gumbelMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_gumbelMeasure_nhdsLT_one`, `TauCeti.Probability.measurable_gumbelMeasure`; `Probability/Distributions/Gumbel/PDF.lean`: `TauCeti.Probability.gumbelPDFReal_of_pos`, `TauCeti.Probability.gumbelPDF`, `TauCeti.Probability.gumbelMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_gumbelMeasure`, `TauCeti.Probability.rnDeriv_gumbelMeasure`; `Probability/Distributions/Gumbel/Moments.lean`: `TauCeti.Probability.memLp_id_gumbelMeasure`, `TauCeti.Probability.integral_id_gumbelMeasure`, `TauCeti.Probability.variance_id_gumbelMeasure`; `Probability/Distributions/Gumbel/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_gumbelMeasure`, `TauCeti.Probability.mgf_id_gumbelMeasure`, `TauCeti.Probability.cgf_id_gumbelMeasure`, `TauCeti.Probability.charFun_gumbelMeasure`; `Probability/Distributions/Gumbel/Reflection.lean`: `TauCeti.Probability.gumbelMeasure_map_neg`, `TauCeti.Probability.hasLaw_neg_gumbelMeasure_of_hasLaw_expMeasure`, `TauCeti.Probability.cdf_neg_gumbelMeasure_eq`, `TauCeti.Probability.quantile_neg_gumbelMeasure`; `Probability/Distributions/Gumbel/Max.lean`: `TauCeti.Probability.map_max_pi_gumbelMeasure`, `TauCeti.Probability.hasLaw_max_iid_gumbelMeasure`; `Probability/Distributions/Logistic/Gumbel.lean`: `TauCeti.Probability.map_sub_prod_gumbelMeasure`, `ProbabilityTheory.IndepFun.hasLaw_sub_gumbelMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Basic.lean`: `TauCeti.Probability.generalizedExtremeValueMeasure_of_shape_ne_zero`, `TauCeti.Probability.hasLaw_generalizedExtremeValueMeasure_of_hasLaw_expMeasure_of_shape_ne_zero`, `TauCeti.Probability.generalizedExtremeValueMeasure_zero`, `TauCeti.Probability.generalizedExtremeValueMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_generalizedExtremeValueMeasure`, `TauCeti.Probability.measurable_generalizedExtremeValueMeasure`; `Probability/Distributions/GeneralizedExtremeValue/PDF.lean`: `TauCeti.Probability.generalizedExtremeValuePDFReal_of_shape_ne_zero`, `TauCeti.Probability.generalizedExtremeValuePDFReal_of_shape_ne_zero_of_not_pos`, `TauCeti.Probability.generalizedExtremeValuePDFReal_zero`, `TauCeti.Probability.generalizedExtremeValueMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_generalizedExtremeValueMeasure`, `TauCeti.Probability.rnDeriv_generalizedExtremeValueMeasure`, `TauCeti.Probability.support_generalizedExtremeValueMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Cdf.lean`: `TauCeti.Probability.cdf_generalizedExtremeValueMeasure_eq`; `Probability/Distributions/GeneralizedExtremeValue/Quantile.lean`: `TauCeti.Probability.quantile_generalizedExtremeValueMeasure`, `TauCeti.Probability.continuousOn_quantile_generalizedExtremeValueMeasure`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsGT_zero_of_shape_pos`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsGT_zero_of_shape_neg`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsLT_one_of_shape_pos`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_nhdsLT_one_of_shape_neg`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_zero_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_generalizedExtremeValueMeasure_zero_nhdsLT_one`; `Probability/Distributions/GeneralizedExtremeValue/Continuity.lean`: `TauCeti.Probability.continuous_generalizedExtremeValueMeasure`, `TauCeti.Probability.tendsto_generalizedExtremeValueMeasure_nhds_zero_gumbelMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Moments.lean`: `TauCeti.Probability.integrable_pow_abs_generalizedExtremeValueMeasure_iff`, `TauCeti.Probability.integrable_pow_generalizedExtremeValueMeasure_iff`, `TauCeti.Probability.integral_pow_generalizedExtremeValueMeasure`, `TauCeti.Probability.integral_id_generalizedExtremeValueMeasure`, `TauCeti.Probability.variance_id_generalizedExtremeValueMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_generalizedExtremeValueMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Max.lean`: `TauCeti.Probability.map_max_pi_generalizedExtremeValueMeasure`, `TauCeti.Probability.hasLaw_max_iid_generalizedExtremeValueMeasure`; `Probability/Distributions/GeneralizedGamma/Relations.lean`: `TauCeti.Probability.cdf_generalizedExtremeValueMeasure_frechet`, `TauCeti.Probability.weibullMeasure_map_neg`; `Probability/Distributions/Weibull/Basic.lean`: `TauCeti.Probability.weibullMeasure`; `Probability/Distributions/Logistic/Basic.lean`: `TauCeti.Probability.logisticMeasure`.
- §10.3. `Probability/Distributions/GeneralizedPareto/Basic.lean`: `TauCeti.Probability.generalizedParetoMeasure_of_shape_ne_zero`, `TauCeti.Probability.hasLaw_generalizedParetoMeasure_of_hasLaw_expMeasure_of_shape_ne_zero`, `TauCeti.Probability.generalizedParetoMeasure_zero`, `TauCeti.Probability.generalizedParetoMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_generalizedParetoMeasure`, `TauCeti.Probability.measurable_generalizedParetoMeasure`; `Probability/Distributions/GeneralizedPareto/PDF.lean`: `TauCeti.Probability.generalizedParetoPDFReal_of_shape_ne_zero`, `TauCeti.Probability.generalizedParetoPDFReal_zero`, `TauCeti.Probability.generalizedParetoPDFReal_of_nonpos`, `TauCeti.Probability.generalizedParetoPDFReal_of_neg_of_le`, `TauCeti.Probability.generalizedParetoPDF`, `TauCeti.Probability.generalizedParetoMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_generalizedParetoMeasure`, `TauCeti.Probability.rnDeriv_generalizedParetoMeasure`, `TauCeti.Probability.support_generalizedParetoMeasure`; `Probability/Distributions/GeneralizedPareto/Cdf.lean`: `TauCeti.Probability.cdf_generalizedParetoMeasure_eq`, `TauCeti.Probability.cdf_generalizedParetoMeasure_eq_one_of_neg_div_le`; `Probability/Distributions/GeneralizedPareto/Quantile.lean`: `TauCeti.Probability.quantile_generalizedParetoMeasure`, `TauCeti.Probability.strictMonoOn_quantile_generalizedParetoMeasure`, `TauCeti.Probability.continuousOn_quantile_generalizedParetoMeasure`, `TauCeti.Probability.tendsto_quantile_generalizedParetoMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_generalizedParetoMeasure_nhdsLT_one`; `Probability/Distributions/GeneralizedPareto/Moments.lean`: `TauCeti.Probability.integrable_pow_generalizedParetoMeasure_iff`, `TauCeti.Probability.integral_pow_generalizedParetoMeasure`, `TauCeti.Probability.integral_id_generalizedParetoMeasure`, `TauCeti.Probability.variance_id_generalizedParetoMeasure`; `Probability/Distributions/GeneralizedPareto/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_generalizedParetoMeasure`; `Probability/Distributions/GeneralizedPareto/Hazard.lean`: `TauCeti.Probability.generalizedParetoPDFReal_div_one_sub_cdf`, `TauCeti.Probability.neg_log_one_sub_cdf_generalizedParetoMeasure`, `TauCeti.Probability.integral_generalizedParetoPDFReal_div_one_sub_cdf`; `Probability/Distributions/GeneralizedPareto/Threshold.lean`: `TauCeti.Probability.map_sub_cond_generalizedParetoMeasure`, `TauCeti.Probability.hasLaw_sub_cond_generalizedParetoMeasure`; `Probability/Distributions/GeneralizedPareto/Relations.lean`: `TauCeti.Probability.generalizedParetoMeasure_neg_one`, `TauCeti.Probability.map_add_generalizedParetoMeasure_eq_paretoMeasure`, `TauCeti.Probability.map_sub_paretoMeasure_eq_generalizedParetoMeasure`.
- §10.4. `Probability/Distributions/Chi/Basic.lean`: `TauCeti.Probability.chiMeasure_of_scale_pos`, `TauCeti.Probability.hasLaw_chiMeasure_of_hasLaw_chiSquaredMeasure`, `TauCeti.Probability.chiMeasure_of_scale_nonpos`, `TauCeti.Probability.chiMeasure_of_neg`, `TauCeti.Probability.isProbabilityMeasure_chiMeasure`, `TauCeti.Probability.chiPDFReal_of_pos`, `TauCeti.Probability.chiPDFReal_of_nonpos`, `TauCeti.Probability.chiPDF`, `TauCeti.Probability.chiMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_chiMeasure`, `TauCeti.Probability.rnDeriv_chiMeasure`, `TauCeti.Probability.cdf_chiMeasure_eq`, `TauCeti.Probability.chiMeasure_zero`, `TauCeti.Probability.cdf_chiMeasure_zero`, `TauCeti.Probability.measurable_chiMeasure`; `Probability/Distributions/Chi/Support.lean`: `TauCeti.Probability.support_chiPDF`, `TauCeti.Probability.support_chiMeasure`; `Probability/Distributions/Chi/Quantile.lean`: `TauCeti.Probability.quantile_chiMeasure`, `TauCeti.Probability.tendsto_quantile_chiMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_chiMeasure_nhdsLT_one`; `Probability/Distributions/Chi/Moments.lean`: `TauCeti.Probability.integrable_rpow_chiMeasure_iff`, `TauCeti.Probability.integral_rpow_chiMeasure`, `TauCeti.Probability.integrable_pow_chiMeasure`, `TauCeti.Probability.integral_pow_chiMeasure`, `TauCeti.Probability.integral_id_chiMeasure`, `TauCeti.Probability.integral_sq_chiMeasure`, `TauCeti.Probability.variance_id_chiMeasure`, `TauCeti.Probability.integral_pow_chiMeasure_zero`, `TauCeti.Probability.integrableExpSet_id_chiMeasure`; `Probability/Distributions/Chi/Gaussian.lean`: `TauCeti.Probability.stdGaussian_map_norm`, `TauCeti.Probability.stdGaussian_map_const_mul_norm`, `ProbabilityTheory.HasLaw.norm_stdGaussian`, `TauCeti.Probability.map_norm_pi_gaussianReal`, `ProbabilityTheory.iIndepFun.hasLaw_norm_gaussianReal`, `TauCeti.Probability.gaussianReal_map_abs`, `ProbabilityTheory.HasLaw.abs_gaussianReal`; `Probability/Distributions/Nakagami/Basic.lean`: `TauCeti.Probability.nakagamiMeasure_of_pos`, `TauCeti.Probability.hasLaw_nakagamiMeasure_of_hasLaw_gammaMeasure`, `TauCeti.Probability.nakagamiMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_nakagamiMeasure_iff`, `TauCeti.Probability.nakagamiPDFReal_of_pos`, `TauCeti.Probability.nakagamiPDFReal_of_nonpos`, `TauCeti.Probability.nakagamiPDF`, `TauCeti.Probability.nakagamiMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_nakagamiMeasure`, `TauCeti.Probability.rnDeriv_nakagamiMeasure`, `TauCeti.Probability.cdf_nakagamiMeasure_eq`, `TauCeti.Probability.nakagamiMeasure_eq_chiMeasure`, `TauCeti.Probability.nakagamiMeasure_map_sq`, `TauCeti.Probability.measurable_nakagamiMeasure`; `Probability/Distributions/Nakagami/Quantile.lean`: `TauCeti.Probability.quantile_nakagamiMeasure`, `TauCeti.Probability.tendsto_quantile_nakagamiMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_nakagamiMeasure_nhdsLT_one`; `Probability/Distributions/Nakagami/Moments.lean`: `TauCeti.Probability.integrable_rpow_nakagamiMeasure_iff`, `TauCeti.Probability.integral_rpow_nakagamiMeasure`, `TauCeti.Probability.integral_id_nakagamiMeasure`, `TauCeti.Probability.integral_sq_nakagamiMeasure`, `TauCeti.Probability.variance_id_nakagamiMeasure`, `TauCeti.Probability.integrableExpSet_id_nakagamiMeasure`; `Analysis/SpecialFunctions/IncompleteGamma.lean`: `TauCeti.regularizedGamma`.
- §10.5. `Probability/Distributions/NoncentralChiSquared/Basic.lean`: `TauCeti.Probability.noncentralChiSquaredMeasure_of_nonneg`, `TauCeti.Probability.noncentralChiSquaredMeasure_eq_sum`, `TauCeti.Probability.noncentralChiSquaredMeasure_of_neg`, `TauCeti.Probability.isProbabilityMeasure_noncentralChiSquaredMeasure`, `TauCeti.Probability.noncentralChiSquaredMeasure_zero_noncentrality`, `TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree`, `TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree_mass`, `TauCeti.Probability.noncentralChiSquaredMeasure_singleton_of_ne_zero`, `TauCeti.Probability.support_noncentralChiSquaredMeasure`, `TauCeti.Probability.measurable_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/Moments.lean`: `TauCeti.Probability.integrable_pow_noncentralChiSquaredMeasure`, `TauCeti.Probability.integral_id_noncentralChiSquaredMeasure`, `TauCeti.Probability.variance_id_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_noncentralChiSquaredMeasure`, `TauCeti.Probability.not_integrable_exp_mul_noncentralChiSquaredMeasure`, `TauCeti.Probability.mgf_id_noncentralChiSquaredMeasure`, `TauCeti.Probability.cgf_id_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/CharFun.lean`: `TauCeti.Probability.charFun_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/PDF.lean`: `TauCeti.Probability.noncentralChiSquaredPDFReal_of_pos`, `TauCeti.Probability.noncentralChiSquaredPDFReal_of_nonpos`, `TauCeti.Probability.noncentralChiSquaredPDFReal_eq_besselI`, `TauCeti.Probability.noncentralChiSquaredPDFReal_zero_noncentrality`, `TauCeti.Probability.noncentralChiSquaredPDF`, `TauCeti.Probability.noncentralChiSquaredMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_noncentralChiSquaredMeasure`, `TauCeti.Probability.rnDeriv_noncentralChiSquaredMeasure`, `TauCeti.Probability.noncentralChiSquaredMeasure_zero_degree_eq_atom_add_withDensity`, `TauCeti.Probability.integral_noncentralChiSquaredPDFReal_zero_degree`; `Probability/Distributions/NoncentralChiSquared/Cdf.lean`: `TauCeti.Probability.hasSum_cdf_noncentralChiSquaredMeasure`, `TauCeti.Probability.cdf_noncentralChiSquaredMeasure_eq`, `TauCeti.Probability.continuous_cdf_noncentralChiSquaredMeasure`, `TauCeti.Probability.strictMonoOn_cdf_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/Quantile.lean`: `TauCeti.Probability.quantile_noncentralChiSquaredMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_noncentralChiSquaredMeasure_eq_iff`, `TauCeti.Probability.continuousOn_quantile_noncentralChiSquaredMeasure`, `TauCeti.Probability.strictMonoOn_quantile_noncentralChiSquaredMeasure`, `TauCeti.Probability.tendsto_quantile_noncentralChiSquaredMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_noncentralChiSquaredMeasure_nhdsLT_one`; `Probability/Distributions/NoncentralChiSquared/Convolution.lean`: `TauCeti.Probability.noncentralChiSquaredMeasure_conv_noncentralChiSquaredMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralChiSquared/StochasticOrder.lean`: `TauCeti.Probability.cdf_noncentralChiSquaredMeasure_le`, `TauCeti.Probability.quantile_noncentralChiSquaredMeasure_le`, `TauCeti.Probability.ae_fst_le_snd_quantileCoupling_noncentralChiSquaredMeasure`; `MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`: `MeasureTheory.Measure.quantileCoupling`; `Probability/Distributions/NoncentralChiSquared/Gaussian.lean`: `TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral`, `ProbabilityTheory.HasLaw.norm_sq_multivariateGaussian`, `TauCeti.Probability.map_sum_sq_pi_gaussianReal_noncentral`, `ProbabilityTheory.iIndepFun.hasLaw_sum_sq_gaussianReal_noncentral`, `TauCeti.Probability.gaussianReal_map_sq_noncentral`; `Probability/Distributions/NoncentralChi/Basic.lean`: `TauCeti.Probability.noncentralChiMeasure_of_scale_pos`, `TauCeti.Probability.hasLaw_noncentralChiMeasure_of_hasLaw_noncentralChiSquaredMeasure`, `TauCeti.Probability.noncentralChiMeasure_of_scale_nonpos`, `TauCeti.Probability.noncentralChiMeasure_of_neg`, `TauCeti.Probability.isProbabilityMeasure_noncentralChiMeasure`, `TauCeti.Probability.noncentralChiMeasure_eq_sum`, `TauCeti.Probability.noncentralChiMeasure_zero_noncentrality`, `TauCeti.Probability.noncentralChiMeasure_zero_degree_mass`, `TauCeti.Probability.cdf_noncentralChiMeasure_eq`, `TauCeti.Probability.cdf_noncentralChiMeasure_eq_tsum`, `TauCeti.Probability.measurable_noncentralChiMeasure`; `Probability/Distributions/NoncentralChi/PDF.lean`: `TauCeti.Probability.noncentralChiPDFReal_of_pos`, `TauCeti.Probability.noncentralChiPDFReal_eq_besselI`, `TauCeti.Probability.noncentralChiPDF`, `TauCeti.Probability.noncentralChiMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_noncentralChiMeasure`, `TauCeti.Probability.rnDeriv_noncentralChiMeasure`, `TauCeti.Probability.noncentralChiMeasure_zero_degree_eq_atom_add_withDensity`, `TauCeti.Probability.noncentralChiPDFReal_two_div_scale_eq_besselI`; `Probability/Distributions/NoncentralChi/Quantile.lean`: `TauCeti.Probability.quantile_noncentralChiMeasure`, `TauCeti.Probability.quantile_noncentralChiMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_noncentralChiMeasure_eq_iff`, `TauCeti.Probability.continuousOn_quantile_noncentralChiMeasure`, `TauCeti.Probability.tendsto_quantile_noncentralChiMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_noncentralChiMeasure_nhdsLT_one`; `Probability/Distributions/NoncentralChi/Moments.lean`: `TauCeti.Probability.integrable_pow_noncentralChiMeasure`, `TauCeti.Probability.hasSum_integral_pow_noncentralChiMeasure`, `TauCeti.Probability.integral_pow_noncentralChiMeasure`, `TauCeti.Probability.integral_id_noncentralChiMeasure`, `TauCeti.Probability.integral_sq_noncentralChiMeasure`, `TauCeti.Probability.variance_id_noncentralChiMeasure`, `TauCeti.Probability.integrableExpSet_id_noncentralChiMeasure`; `Probability/Distributions/NoncentralChi/Gaussian.lean`: `TauCeti.Probability.map_norm_multivariateGaussian_noncentral`, `TauCeti.Probability.map_norm_multivariateGaussian_noncentral_of_scale`, `ProbabilityTheory.HasLaw.norm_multivariateGaussian_noncentral`, `ProbabilityTheory.HasLaw.norm_multivariateGaussian_noncentral_of_scale`; `Probability/Distributions/Chi/Basic.lean`: `TauCeti.Probability.chiMeasure`.
- §10.6. `Probability/Distributions/NoncentralT/Basic.lean`: `TauCeti.Probability.noncentralTMeasure_eq_map`, `TauCeti.Probability.hasLaw_noncentralT_of_gaussian_chiSquared`, `TauCeti.Probability.noncentralTMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_noncentralTMeasure_iff`, `TauCeti.Probability.noncentralTMeasure_eq_bind`, `TauCeti.Probability.hasPDF_of_hasLaw_noncentralTMeasure`, `TauCeti.Probability.noncentralTMeasure_map_neg`, `TauCeti.Probability.noncentralTMeasure_zero_noncentrality`, `TauCeti.Probability.measurable_noncentralTMeasure`, `TauCeti.Probability.noncentralTMeasure_map_sq`; `Probability/Distributions/ChiSquared/Basic.lean`: `TauCeti.Probability.ae_pos_sqrt_div_chiSquaredMeasure`; `Probability/Distributions/NoncentralT/PDF.lean`: `TauCeti.Probability.noncentralTPDFReal_def`, `TauCeti.Probability.noncentralTPDFReal_pos`, `TauCeti.Probability.noncentralTPDF`, `TauCeti.Probability.noncentralTMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_noncentralTMeasure`; `Probability/Distributions/NoncentralT/Cdf.lean`: `TauCeti.Probability.cdf_noncentralTMeasure_eq`, `TauCeti.Probability.continuous_cdf_noncentralTMeasure`, `TauCeti.Probability.strictMono_cdf_noncentralTMeasure`, `TauCeti.Probability.support_noncentralTMeasure`, `TauCeti.Probability.quantile_noncentralTMeasure_eq_iff`, `TauCeti.Probability.strictMonoOn_quantile_noncentralTMeasure`, `TauCeti.Probability.continuousOn_quantile_noncentralTMeasure`, `TauCeti.Probability.tendsto_quantile_noncentralTMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_noncentralTMeasure_nhdsLT_one`; `Probability/Distributions/NoncentralT/Moments.lean`: `TauCeti.Probability.integrable_pow_noncentralTMeasure_iff`, `TauCeti.Probability.integral_id_noncentralTMeasure`, `TauCeti.Probability.integral_sq_noncentralTMeasure`, `TauCeti.Probability.variance_id_noncentralTMeasure`; `Probability/Distributions/NoncentralT/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_noncentralTMeasure`; `Probability/Distributions/NoncentralF/Basic.lean`: `TauCeti.Probability.noncentralFMeasure_eq_map`, `TauCeti.Probability.hasLaw_noncentralF_of_noncentralChiSquared`, `TauCeti.Probability.noncentralFMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_noncentralFMeasure_iff`, `TauCeti.Probability.noncentralFMeasure_eq_sum`, `TauCeti.Probability.noncentralFMeasure_eq_bind`, `TauCeti.Probability.noncentralFMeasure_zero_noncentrality`, `TauCeti.Probability.hasPDF_of_hasLaw_noncentralFMeasure`, `TauCeti.Probability.measurable_noncentralFMeasure`; `Probability/Distributions/NoncentralF/PDF.lean`: `TauCeti.Probability.noncentralFPDFReal_of_pos`, `TauCeti.Probability.noncentralFPDFReal_pos`, `TauCeti.Probability.noncentralFPDF`, `TauCeti.Probability.noncentralFMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_noncentralFMeasure`; `Probability/Distributions/NoncentralF/Cdf.lean`: `TauCeti.Probability.cdf_noncentralFMeasure_eq`, `TauCeti.Probability.continuous_cdf_noncentralFMeasure`, `TauCeti.Probability.strictMonoOn_cdf_noncentralFMeasure`; `Probability/Distributions/NoncentralF/Quantile.lean`: `TauCeti.Probability.quantile_noncentralFMeasure_pos`, `TauCeti.Probability.quantile_noncentralFMeasure_eq_iff`, `TauCeti.Probability.continuousOn_quantile_noncentralFMeasure`, `TauCeti.Probability.tendsto_quantile_noncentralFMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_noncentralFMeasure_nhdsLT_one`; `Probability/Distributions/NoncentralF/Moments.lean`: `TauCeti.Probability.integrable_pow_noncentralFMeasure_iff`, `TauCeti.Probability.integral_id_noncentralFMeasure`, `TauCeti.Probability.integral_sq_noncentralFMeasure`, `TauCeti.Probability.variance_id_noncentralFMeasure`, `TauCeti.Probability.integrableExpSet_id_noncentralFMeasure`; `Analysis/SpecialFunctions/IncompleteBeta.lean`: `TauCeti.regularizedIncompleteBeta`.
- §10.7. `Probability/Distributions/BetaPrime/Basic.lean`: `TauCeti.Probability.betaPrimeMeasure_eq_map`, `TauCeti.Probability.betaPrimeMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_betaPrimeMeasure_iff`, `TauCeti.Probability.betaPrimePDFReal_of_pos`, `TauCeti.Probability.betaPrimePDFReal_of_nonpos`, `TauCeti.Probability.betaPrimePDF`, `TauCeti.Probability.betaPrimeMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_betaPrimeMeasure`, `TauCeti.Probability.rnDeriv_betaPrimeMeasure`, `TauCeti.Probability.cdf_betaPrimeMeasure_eq`, `TauCeti.Probability.betaPrimeMeasure_eq_map_fisherSnedecorMeasure`; `Probability/Distributions/BetaPrime/Quantile.lean`: `TauCeti.Probability.quantile_betaPrimeMeasure`, `TauCeti.Probability.tendsto_quantile_betaPrimeMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_betaPrimeMeasure_nhdsLT_one`; `Probability/Distributions/BetaPrime/Gamma.lean`: `TauCeti.Probability.map_div_gammaMeasure`, `TauCeti.Probability.map_div_sum_prod_gammaMeasure`, `TauCeti.Probability.hasLaw_betaPrime_of_gammaMeasure`, `TauCeti.Probability.indepFun_div_sum_of_hasLaw_gammaMeasure`; `Probability/Distributions/BetaPrime/Moments.lean`: `TauCeti.Probability.integrable_rpow_betaPrimeMeasure_iff`, `TauCeti.Probability.integral_rpow_betaPrimeMeasure`, `TauCeti.Probability.integral_id_betaPrimeMeasure`, `TauCeti.Probability.variance_id_betaPrimeMeasure`, `TauCeti.Probability.integrableExpSet_id_betaPrimeMeasure`; `Probability/Distributions/BetaPrime/Measurability.lean`: `TauCeti.Probability.measurable_betaPrimeMeasure`; `Probability/Distributions/Levy/Basic.lean`: `TauCeti.Probability.levyMeasure_def`, `TauCeti.Probability.levyMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_levyMeasure`, `TauCeti.Probability.ae_lt_levyMeasure`, `TauCeti.Probability.levyPDFReal_of_lt`, `TauCeti.Probability.levyPDFReal_of_le`, `TauCeti.Probability.levyPDF`, `TauCeti.Probability.levyMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_levyMeasure`, `TauCeti.Probability.rnDeriv_levyMeasure`, `TauCeti.Probability.measurable_levyMeasure`; `Analysis/SpecialFunctions/Erf.lean`: `TauCeti.Real.erfc`; `Probability/Distributions/Levy/Cdf.lean`: `TauCeti.Probability.cdf_levyMeasure_eq`; `Probability/Distributions/Levy/Quantile.lean`: `TauCeti.Probability.quantile_levyMeasure_eq_quantile_gaussianReal`, `TauCeti.Probability.quantile_levyMeasure`, `TauCeti.Probability.tendsto_quantile_levyMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_levyMeasure_nhdsLT_one`; `Probability/Distributions/Levy/Moments.lean`: `TauCeti.Probability.integrable_rpow_abs_sub_levyMeasure_iff`, `TauCeti.Probability.not_integrable_id_levyMeasure`, `TauCeti.Probability.integrableExpSet_id_levyMeasure`; `Probability/Distributions/Levy/Transforms.lean`: `TauCeti.Probability.mgf_id_levyMeasure`, `TauCeti.Probability.cgf_id_levyMeasure`; `Probability/Distributions/Levy/CharFun.lean`: `TauCeti.Probability.charFun_levyMeasure`; `Probability/Distributions/Levy/Gaussian.lean`: `TauCeti.Probability.gaussianReal_map_add_div_sq`, `TauCeti.Probability.hasLaw_levyMeasure_of_hasLaw_gaussianReal`.
- §10.8. `Probability/Distributions/InverseGaussian/Basic.lean`: `TauCeti.Probability.inverseGaussianPDFReal_of_pos`, `TauCeti.Probability.inverseGaussianPDFReal_of_nonpos`, `TauCeti.Probability.inverseGaussianMeasure_eq_withDensity`, `TauCeti.Probability.inverseGaussianMeasure_of_not_pos`, `TauCeti.Probability.integral_inverseGaussianPDFReal`, `TauCeti.Probability.isProbabilityMeasure_inverseGaussianMeasure_iff`, `TauCeti.Probability.inverseGaussianPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_inverseGaussianMeasure`, `TauCeti.Probability.rnDeriv_inverseGaussianMeasure`, `TauCeti.Probability.support_inverseGaussianMeasure`, `TauCeti.Probability.cdf_inverseGaussianMeasure_eq`, `TauCeti.Probability.measurable_inverseGaussianMeasure`; `Probability/Distributions/InverseGaussian/Moments.lean`: `TauCeti.Probability.integral_id_inverseGaussianMeasure`, `TauCeti.Probability.variance_id_inverseGaussianMeasure`, `TauCeti.Probability.memLp_id_inverseGaussianMeasure`; `Probability/Distributions/InverseGaussian/Cdf.lean`: `TauCeti.Probability.strictMonoOn_cdf_inverseGaussianMeasure`; `Probability/Distributions/InverseGaussian/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_inverseGaussianMeasure`, `TauCeti.Probability.mgf_id_inverseGaussianMeasure`, `TauCeti.Probability.cgf_id_inverseGaussianMeasure`; `Probability/Distributions/InverseGaussian/CharFun.lean`: `TauCeti.Probability.charFun_inverseGaussianMeasure`; `Probability/Distributions/InverseGaussian/Quantile.lean`: `TauCeti.Probability.quantile_inverseGaussianMeasure_pos`, `TauCeti.Probability.quantile_inverseGaussianMeasure_eq_iff`, `TauCeti.Probability.strictMonoOn_quantile_inverseGaussianMeasure`, `TauCeti.Probability.continuousOn_quantile_inverseGaussianMeasure`, `TauCeti.Probability.tendsto_quantile_inverseGaussianMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_inverseGaussianMeasure_nhdsLT_one`.
- §10.9. `Probability/Distributions/TruncatedNormal/Basic.lean`: `TauCeti.Probability.truncatedNormalMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_truncatedNormalMeasure_iff`, `TauCeti.Probability.truncatedNormalMeasure_eq_zero_iff`, `TauCeti.Probability.truncatedNormalMeasure_eq_preimage_Ioc`, `TauCeti.Probability.isProbabilityMeasure_truncatedNormalMeasure_of_lt`, `TauCeti.Probability.truncatedNormalPDFReal_of_mem`, `TauCeti.Probability.truncatedNormalPDFReal_of_notMem`, `TauCeti.Probability.truncatedNormalPDFReal`, `TauCeti.Probability.truncatedNormalPDF`, `TauCeti.Probability.truncatedNormalMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_truncatedNormalMeasure`, `TauCeti.Probability.rnDeriv_truncatedNormalMeasure`, `TauCeti.Probability.cdf_truncatedNormalMeasure_eq`, `TauCeti.Probability.cdf_truncatedNormalMeasure_eq_cdf_zero_one`, `TauCeti.Probability.quantile_truncatedNormalMeasure`, `TauCeti.Probability.quantile_truncatedNormalMeasure_eq_cdf_zero_one`, `TauCeti.Probability.truncatedNormalMeasure_zero_var`; `Probability/Distributions/Gaussian/Basic.lean`: `TauCeti.Probability.gaussianPDFRealEReal`; `Probability/Distributions/TruncatedNormal/Cdf.lean`: `TauCeti.Probability.continuous_cdf_truncatedNormalMeasure`, `TauCeti.Probability.strictMonoOn_cdf_truncatedNormalMeasure`; `Probability/Distributions/TruncatedNormal/Quantile.lean`: `TauCeti.Probability.quantile_truncatedNormalMeasure_mem_Ioo`, `TauCeti.Probability.tendsto_quantile_truncatedNormalMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_truncatedNormalMeasure_nhdsLT_one`, `TauCeti.Probability.quantile_truncatedNormalMeasure_zero_var`; `Probability/Distributions/TruncatedNormal/Moments.lean`: `TauCeti.Probability.integral_id_truncatedNormalMeasure`, `TauCeti.Probability.variance_id_truncatedNormalMeasure`, `TauCeti.Probability.integral_id_truncatedNormalMeasure_eq_cdf_zero_one`, `TauCeti.Probability.variance_id_truncatedNormalMeasure_eq_cdf_zero_one`, `TauCeti.Probability.integrableExpSet_id_truncatedNormalMeasure`, `TauCeti.Probability.mgf_id_truncatedNormalMeasure_eq_cdf_zero_one`, `TauCeti.Probability.mgf_id_truncatedNormalMeasure`, `TauCeti.Probability.cgf_id_truncatedNormalMeasure`; `Probability/Distributions/TruncatedNormal/HalfNormal.lean`: `TauCeti.Probability.truncatedNormalMeasure_Ici_mean`, `TauCeti.Probability.truncatedNormalMeasure_Ioi_mean`, `ProbabilityTheory.HasLaw.cond_ge_mean_gaussianReal`, `ProbabilityTheory.HasLaw.cond_gt_mean_gaussianReal`; `Probability/Distributions/TruncatedNormal/Measurability.lean`: `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ioc`, `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Icc`, `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ioo`, `TauCeti.Probability.measurable_truncatedNormalMeasure_preimage_Ico`, `Measurable.truncatedNormalMeasure`; `Probability/Distributions/SkewNormal/Basic.lean`: `TauCeti.Probability.skewNormalPDFReal_of_pos`, `TauCeti.Probability.skewNormalMeasure_eq_withDensity`, `TauCeti.Probability.skewNormalMeasure_of_nonpos`, `TauCeti.Probability.isProbabilityMeasure_skewNormalMeasure`, `TauCeti.Probability.skewNormalPDFReal_pos`, `TauCeti.Probability.skewNormalPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_skewNormalMeasure`, `TauCeti.Probability.rnDeriv_skewNormalMeasure`, `TauCeti.Probability.support_skewNormalMeasure`, `TauCeti.Probability.cdf_skewNormalMeasure_eq`, `TauCeti.Probability.continuous_cdf_skewNormalMeasure`, `TauCeti.Probability.strictMono_cdf_skewNormalMeasure`, `TauCeti.Probability.hasDerivAt_cdf_skewNormalMeasure`, `TauCeti.Probability.quantile_skewNormalMeasure_eq_iff`, `TauCeti.Probability.skewNormalMeasure_zero_shape`, `TauCeti.Probability.map_neg_skewNormalMeasure`, `TauCeti.Probability.measurable_skewNormalMeasure`; `Probability/Distributions/SkewNormal/Construction.lean`: `TauCeti.Probability.map_prod_gaussianReal_eq_skewNormalMeasure`, `TauCeti.Probability.hasLaw_skewNormalMeasure_of_indepFun`; `Probability/Distributions/SkewNormal/Moments.lean`: `TauCeti.Probability.integral_id_skewNormalMeasure`, `TauCeti.Probability.variance_id_skewNormalMeasure`, `TauCeti.Probability.integrableExpSet_id_skewNormalMeasure`, `TauCeti.Probability.mgf_id_skewNormalMeasure`, `TauCeti.Probability.cgf_id_skewNormalMeasure`; `Probability/Quantile.lean`: `MeasureTheory.Measure.strictMonoOn_quantile`, `MeasureTheory.Measure.continuousOn_quantile`, `MeasureTheory.Measure.tendsto_quantile_nhdsGT_zero_of_cdf_pos`, `MeasureTheory.Measure.tendsto_quantile_nhdsLT_one_of_cdf_lt_one`.
- §10.10. `Probability/Distributions/IrwinHall/Basic.lean`: `TauCeti.Probability.irwinHallMeasure_def`, `TauCeti.Probability.map_sum_pi_uniformMeasure_zero_one`, `ProbabilityTheory.iIndepFun.hasLaw_sum_irwinHallMeasure`, `TauCeti.Probability.irwinHallMeasure_zero`, `TauCeti.Probability.irwinHallMeasure_one`, `TauCeti.Probability.isProbabilityMeasure_irwinHallMeasure`, `TauCeti.Probability.irwinHallMeasure_conv_irwinHallMeasure`; `Probability/Distributions/IrwinHall/Cdf.lean`: `TauCeti.Probability.cdf_irwinHallMeasure_eq`, `TauCeti.Probability.continuous_cdf_irwinHallMeasure`, `TauCeti.Probability.strictMonoOn_cdf_irwinHallMeasure`; `Probability/Distributions/IrwinHall/Support.lean`: `TauCeti.Probability.support_irwinHallMeasure`; `Probability/Distributions/IrwinHall/PDF.lean`: `TauCeti.Probability.irwinHallPDFReal_eq`, `TauCeti.Probability.irwinHallPDFReal_one`, `TauCeti.Probability.irwinHallPDFReal`, `TauCeti.Probability.irwinHallPDF`, `TauCeti.Probability.irwinHallMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_irwinHallMeasure`, `TauCeti.Probability.rnDeriv_irwinHallMeasure`; `Probability/Distributions/IrwinHall/Transforms.lean`: `TauCeti.Probability.integral_id_irwinHallMeasure`, `TauCeti.Probability.variance_id_irwinHallMeasure`, `TauCeti.Probability.integrable_pow_irwinHallMeasure`, `TauCeti.Probability.integrableExpSet_id_irwinHallMeasure`, `TauCeti.Probability.mgf_id_irwinHallMeasure`, `TauCeti.Probability.cgf_id_irwinHallMeasure`, `TauCeti.Probability.charFun_irwinHallMeasure`; `Probability/Distributions/IrwinHall/Quantile.lean`: `TauCeti.Probability.quantile_irwinHallMeasure_mem_Ioo`, `TauCeti.Probability.quantile_irwinHallMeasure_eq_iff`, `TauCeti.Probability.strictMonoOn_quantile_irwinHallMeasure`, `TauCeti.Probability.continuousOn_quantile_irwinHallMeasure`, `TauCeti.Probability.tendsto_quantile_irwinHallMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_irwinHallMeasure_nhdsLT_one`, `TauCeti.Probability.quantile_irwinHallMeasure_zero`; `Probability/Distributions/Bates/Basic.lean`: `TauCeti.Probability.batesMeasure_eq_map_irwinHallMeasure`, `TauCeti.Probability.map_average_pi_uniformMeasure_zero_one`, `ProbabilityTheory.iIndepFun.hasLaw_average_batesMeasure`, `TauCeti.Probability.batesMeasure_zero`, `TauCeti.Probability.isProbabilityMeasure_batesMeasure`, `TauCeti.Probability.batesMeasure_one`, `TauCeti.Probability.batesPDFReal_def`, `TauCeti.Probability.batesPDFReal_eq`, `TauCeti.Probability.batesPDF`, `TauCeti.Probability.batesMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_batesMeasure`, `TauCeti.Probability.rnDeriv_batesMeasure`, `TauCeti.Probability.cdf_batesMeasure`, `TauCeti.Probability.cdf_batesMeasure_eq`, `TauCeti.Probability.quantile_batesMeasure`, `TauCeti.Probability.integral_id_batesMeasure`, `TauCeti.Probability.variance_id_batesMeasure`, `TauCeti.Probability.integrableExpSet_id_batesMeasure`, `TauCeti.Probability.mgf_id_batesMeasure`, `TauCeti.Probability.cgf_id_batesMeasure`, `TauCeti.Probability.charFun_batesMeasure`, `TauCeti.Probability.measurable_batesMeasure`; `Probability/Distributions/Bates/Quantile.lean`: `TauCeti.Probability.quantile_batesMeasure_mem_Ioo`, `TauCeti.Probability.quantile_batesMeasure_eq_iff`, `TauCeti.Probability.strictMonoOn_quantile_batesMeasure`, `TauCeti.Probability.continuousOn_quantile_batesMeasure`, `TauCeti.Probability.tendsto_quantile_batesMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_batesMeasure_nhdsLT_one`; `Probability/Distributions/Triangular/Basic.lean`: `TauCeti.Probability.triangularPDFReal_def`, `TauCeti.Probability.triangularMeasure_eq_withDensity`, `TauCeti.Probability.triangularMeasure_eq_zero_of_not`, `TauCeti.Probability.isProbabilityMeasure_triangularMeasure_iff`, `TauCeti.Probability.triangularPDFReal`, `TauCeti.Probability.triangularPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_triangularMeasure`, `TauCeti.Probability.rnDeriv_triangularMeasure`, `TauCeti.Probability.support_triangularMeasure`, `TauCeti.Probability.cdf_triangularMeasure_eq`, `TauCeti.Probability.cdf_triangularMeasure_mode`, `TauCeti.Probability.measurable_triangularMeasure`; `Probability/Distributions/Triangular/Quantile.lean`: `TauCeti.Probability.quantile_triangularMeasure`, `TauCeti.Probability.tendsto_quantile_triangularMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_triangularMeasure_nhdsLT_one`; `Probability/Distributions/Triangular/Moments.lean`: `TauCeti.Probability.integral_id_triangularMeasure`, `TauCeti.Probability.variance_id_triangularMeasure`, `TauCeti.Probability.integral_pow_triangularMeasure`, `TauCeti.Probability.integrableExpSet_id_triangularMeasure`; `Probability/Distributions/Kumaraswamy/Basic.lean`: `TauCeti.Probability.kumaraswamyPDFReal_of_mem_Ioo`, `TauCeti.Probability.kumaraswamyPDFReal_of_notMem_Ioo`, `TauCeti.Probability.kumaraswamyMeasure_eq_withDensity`, `TauCeti.Probability.kumaraswamyMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_kumaraswamyMeasure_iff`, `TauCeti.Probability.kumaraswamyPDFReal`, `TauCeti.Probability.kumaraswamyPDF`, `TauCeti.Probability.hasPDF_of_hasLaw_kumaraswamyMeasure`, `TauCeti.Probability.rnDeriv_kumaraswamyMeasure`, `TauCeti.Probability.support_kumaraswamyMeasure`, `TauCeti.Probability.cdf_kumaraswamyMeasure_eq`, `TauCeti.Probability.map_rpow_kumaraswamyMeasure`, `TauCeti.Probability.hasLaw_rpow_of_hasLaw_kumaraswamyMeasure`, `TauCeti.Probability.kumaraswamyMeasure_one_left`, `TauCeti.Probability.measurable_kumaraswamyMeasure`; `Probability/Distributions/Kumaraswamy/Quantile.lean`: `TauCeti.Probability.quantile_kumaraswamyMeasure`, `TauCeti.Probability.tendsto_quantile_kumaraswamyMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_kumaraswamyMeasure_nhdsLT_one`; `Probability/Distributions/Kumaraswamy/Moments.lean`: `TauCeti.Probability.integrable_rpow_kumaraswamyMeasure_iff`, `TauCeti.Probability.integral_rpow_kumaraswamyMeasure`, `TauCeti.Probability.integral_id_kumaraswamyMeasure`, `TauCeti.Probability.variance_id_kumaraswamyMeasure`, `TauCeti.Probability.integrableExpSet_id_kumaraswamyMeasure`.
- §10.11. `Probability/Distributions/Gompertz/Basic.lean`: `TauCeti.Probability.gompertzMeasure_of_pos`, `TauCeti.Probability.gompertzMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_gompertzMeasure_iff`, `TauCeti.Probability.hasLaw_gompertzMeasure_of_hasLaw_expMeasure`, `TauCeti.Probability.ae_pos_gompertzMeasure`, `TauCeti.Probability.measurable_gompertzMeasure`, `TauCeti.Probability.map_mul_gompertzMeasure`, `TauCeti.Probability.hasLaw_mul_gompertzMeasure`; `Probability/Distributions/Gompertz/PDF.lean`: `TauCeti.Probability.gompertzPDFReal`, `TauCeti.Probability.gompertzPDFReal_of_pos`, `TauCeti.Probability.gompertzPDFReal_of_nonpos`, `TauCeti.Probability.gompertzMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_gompertzMeasure`, `TauCeti.Probability.rnDeriv_gompertzMeasure`, `TauCeti.Probability.gompertzPDFReal_pos`, `TauCeti.Probability.nullSingletonClass_gompertzMeasure`, `TauCeti.Probability.support_gompertzMeasure`; `Probability/Distributions/Gompertz/Cdf.lean`: `TauCeti.Probability.cdf_gompertzMeasure_eq`, `TauCeti.Probability.one_sub_cdf_gompertzMeasure`, `TauCeti.Probability.gompertzPDFReal_div_one_sub_cdf`, `TauCeti.Probability.neg_log_one_sub_cdf_gompertzMeasure`; `Probability/Distributions/Gompertz/Quantile.lean`: `TauCeti.Probability.quantile_gompertzMeasure`, `TauCeti.Probability.continuousOn_quantile_gompertzMeasure`, `TauCeti.Probability.strictMonoOn_quantile_gompertzMeasure`, `TauCeti.Probability.tendsto_quantile_gompertzMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_gompertzMeasure_nhdsLT_one`; `Probability/Distributions/Gompertz/Moments.lean`: `TauCeti.Probability.integrable_pow_gompertzMeasure`, `TauCeti.Probability.integrable_exp_mul_id_gompertzMeasure`, `TauCeti.Probability.integrableExpSet_id_gompertzMeasure`, `TauCeti.Probability.integral_pow_gompertzMeasure`, `TauCeti.Probability.mgf_id_gompertzMeasure`, `TauCeti.Probability.cgf_id_gompertzMeasure`, `TauCeti.Probability.integral_id_gompertzMeasure`, `TauCeti.Probability.variance_id_gompertzMeasure`; `Probability/Distributions/LogLogistic/Basic.lean`: `TauCeti.Probability.logLogisticMeasure_of_pos`, `TauCeti.Probability.logLogisticMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_logLogisticMeasure_iff`, `TauCeti.Probability.map_log_logLogisticMeasure`, `TauCeti.Probability.hasLaw_logLogisticMeasure_of_hasLaw_logisticMeasure`, `TauCeti.Probability.logLogisticPDFReal`, `TauCeti.Probability.logLogisticPDFReal_of_pos`, `TauCeti.Probability.logLogisticPDFReal_of_nonpos`, `TauCeti.Probability.logLogisticPDFReal_pos`, `TauCeti.Probability.logLogisticMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_logLogisticMeasure`, `TauCeti.Probability.rnDeriv_logLogisticMeasure`, `TauCeti.Probability.ae_mem_Ioi_logLogisticMeasure`, `TauCeti.Probability.support_logLogisticMeasure`, `TauCeti.Probability.cdf_logLogisticMeasure_eq`, `TauCeti.Probability.one_sub_cdf_logLogisticMeasure`, `TauCeti.Probability.logLogisticPDFReal_div_one_sub_cdf`, `TauCeti.Probability.neg_log_one_sub_cdf_logLogisticMeasure`, `TauCeti.Probability.measurable_logLogisticMeasure`, `TauCeti.Probability.map_mul_logLogisticMeasure`, `TauCeti.Probability.hasLaw_mul_logLogisticMeasure`; `Probability/Distributions/LogLogistic/Quantile.lean`: `TauCeti.Probability.quantile_logLogisticMeasure`, `TauCeti.Probability.tendsto_quantile_logLogisticMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_logLogisticMeasure_nhdsLT_one`; `Probability/Distributions/LogLogistic/Moments.lean`: `TauCeti.Probability.integrable_rpow_logLogisticMeasure_iff`, `TauCeti.Probability.integral_rpow_logLogisticMeasure`, `TauCeti.Probability.integrable_pow_logLogisticMeasure_iff`, `TauCeti.Probability.integral_pow_logLogisticMeasure`, `TauCeti.Probability.integrable_id_logLogisticMeasure_iff`, `TauCeti.Probability.integral_id_logLogisticMeasure`, `TauCeti.Probability.integral_sq_logLogisticMeasure`, `TauCeti.Probability.variance_id_logLogisticMeasure`, `TauCeti.Probability.integrable_exp_mul_id_logLogisticMeasure_iff`, `TauCeti.Probability.integrableExpSet_id_logLogisticMeasure`.
- §10.12. `Probability/Distributions/GeneralizedGamma/Basic.lean`: `TauCeti.Probability.generalizedGammaMeasure_of_valid`, `TauCeti.Probability.generalizedGammaMeasure_of_not_valid`, `TauCeti.Probability.isProbabilityMeasure_generalizedGammaMeasure_iff`, `TauCeti.Probability.generalizedGammaMeasure_map_rpow`, `TauCeti.Probability.hasLaw_generalizedGammaMeasure_of_hasLaw_gammaMeasure`, `TauCeti.Probability.ae_pos_generalizedGammaMeasure`, `TauCeti.Probability.generalizedGammaMeasure_map_const_mul`, `TauCeti.Probability.generalizedGammaMeasure_one`; `Probability/Distributions/GeneralizedGamma/PDF.lean`: `TauCeti.Probability.generalizedGammaPDFReal`, `TauCeti.Probability.generalizedGammaPDFReal_of_pos`, `TauCeti.Probability.generalizedGammaPDFReal_of_nonpos`, `TauCeti.Probability.generalizedGammaMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_generalizedGammaMeasure`, `TauCeti.Probability.rnDeriv_generalizedGammaMeasure`, `TauCeti.Probability.support_generalizedGammaMeasure`, `TauCeti.Probability.measurable_generalizedGammaMeasure`; `Probability/Distributions/GeneralizedGamma/Cdf.lean`: `TauCeti.Probability.cdf_generalizedGammaMeasure_eq`; `Probability/Distributions/GeneralizedGamma/Quantile.lean`: `TauCeti.Probability.quantile_generalizedGammaMeasure`, `TauCeti.Probability.continuousOn_quantile_generalizedGammaMeasure`, `TauCeti.Probability.tendsto_quantile_generalizedGammaMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_generalizedGammaMeasure_nhdsLT_one`; `Probability/Distributions/GeneralizedGamma/Moments.lean`: `TauCeti.Probability.integrable_rpow_generalizedGammaMeasure_iff`, `TauCeti.Probability.integral_rpow_generalizedGammaMeasure`, `TauCeti.Probability.integrable_pow_generalizedGammaMeasure_iff`, `TauCeti.Probability.integral_pow_generalizedGammaMeasure`, `TauCeti.Probability.integrable_id_generalizedGammaMeasure_iff`, `TauCeti.Probability.integral_id_generalizedGammaMeasure`, `TauCeti.Probability.variance_id_generalizedGammaMeasure`; `Probability/Distributions/GeneralizedGamma/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_generalizedGammaMeasure`; `Probability/Distributions/GeneralizedGamma/Relations.lean`: `TauCeti.Probability.generalizedGammaMeasure_one_shape_eq_weibullMeasure`, `TauCeti.Probability.generalizedGammaMeasure_neg_one_eq_inverseGammaMeasure`, `TauCeti.Probability.generalizedGammaMeasure_one_shape_neg_eq_generalizedExtremeValueMeasure`, `TauCeti.Probability.chiMeasure_eq_generalizedGammaMeasure`, `TauCeti.Probability.nakagamiMeasure_eq_generalizedGammaMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Basic.lean`: `TauCeti.Probability.generalizedExtremeValueMeasure`; `Probability/Distributions/Nakagami/Basic.lean`: `TauCeti.Probability.nakagamiMeasure`.
- §10.13. `Probability/Distributions/GeneralizedNormal/Basic.lean`: `TauCeti.Probability.generalizedNormalPDFReal_of_pos`, `TauCeti.Probability.generalizedNormalMeasure_eq_withDensity`, `TauCeti.Probability.generalizedNormalMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_generalizedNormalMeasure_iff`, `TauCeti.Probability.generalizedNormalPDFReal_pos`, `TauCeti.Probability.hasPDF_of_hasLaw_generalizedNormalMeasure`, `TauCeti.Probability.rnDeriv_generalizedNormalMeasure`, `TauCeti.Probability.measurable_generalizedNormalMeasure`, `TauCeti.Probability.integrable_rpow_abs_sub_generalizedNormalMeasure_iff`, `TauCeti.Probability.integral_rpow_abs_sub_generalizedNormalMeasure`; `Probability/Distributions/GeneralizedNormal/Cdf.lean`: `TauCeti.Probability.support_generalizedNormalMeasure`, `TauCeti.Probability.cdf_generalizedNormalMeasure_eq`, `TauCeti.Probability.continuous_cdf_generalizedNormalMeasure`, `TauCeti.Probability.strictMono_cdf_generalizedNormalMeasure`; `Probability/Distributions/GeneralizedNormal/Gamma.lean`: `TauCeti.Probability.map_rademacher_prod_gammaMeasure_generalizedNormalMeasure`, `ProbabilityTheory.IndepFun.hasLaw_generalizedNormalMeasure`, `TauCeti.Probability.generalizedNormalMeasure_eq_add_map_neg`; `Probability/Distributions/GeneralizedNormal/Quantile.lean`: `TauCeti.Probability.quantile_generalizedNormalMeasure`, `TauCeti.Probability.quantile_generalizedNormalMeasure_half`, `TauCeti.Probability.quantile_generalizedNormalMeasure_eq_iff`, `TauCeti.Probability.continuousOn_quantile_generalizedNormalMeasure`, `TauCeti.Probability.tendsto_quantile_generalizedNormalMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_generalizedNormalMeasure_nhdsLT_one`; `Probability/Distributions/GeneralizedNormal/Affine.lean`: `TauCeti.Probability.generalizedNormalMeasure_map_two_mul_sub`; `Probability/Distributions/GeneralizedNormal/Moments.lean`: `TauCeti.Probability.integral_id_generalizedNormalMeasure`, `TauCeti.Probability.integral_pow_sub_generalizedNormalMeasure_of_odd`, `TauCeti.Probability.integral_pow_sub_generalizedNormalMeasure_of_even`, `TauCeti.Probability.variance_id_generalizedNormalMeasure`, `TauCeti.Probability.integrable_pow_generalizedNormalMeasure`, `TauCeti.Probability.integral_pow_generalizedNormalMeasure`; `Probability/Distributions/GeneralizedNormal/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_generalizedNormalMeasure`; `Probability/Distributions/GeneralizedNormal/Relations.lean`: `TauCeti.Probability.generalizedNormalMeasure_one`, `TauCeti.Probability.generalizedNormalMeasure_two`.
- §10.14. `Probability/Distributions/AsymmetricLaplace/Basic.lean`: `TauCeti.Probability.asymmetricLaplaceMeasure_eq_map`, `ProbabilityTheory.IndepFun.hasLaw_asymmetricLaplaceMeasure`, `TauCeti.Probability.asymmetricLaplaceMeasure_of_nonpos_left`, `TauCeti.Probability.asymmetricLaplaceMeasure_of_nonpos_right`, `TauCeti.Probability.isProbabilityMeasure_asymmetricLaplaceMeasure`, `TauCeti.Probability.asymmetricLaplacePDFReal_of_le`, `TauCeti.Probability.asymmetricLaplacePDFReal_of_lt`, `TauCeti.Probability.asymmetricLaplacePDFReal_pos`, `TauCeti.Probability.asymmetricLaplaceMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_asymmetricLaplaceMeasure`, `TauCeti.Probability.rnDeriv_asymmetricLaplaceMeasure`, `TauCeti.Probability.support_asymmetricLaplaceMeasure`, `TauCeti.Probability.cdf_asymmetricLaplaceMeasure_eq`, `TauCeti.Probability.continuous_cdf_asymmetricLaplaceMeasure`, `TauCeti.Probability.strictMono_cdf_asymmetricLaplaceMeasure`, `TauCeti.Probability.integral_id_asymmetricLaplaceMeasure`, `TauCeti.Probability.variance_id_asymmetricLaplaceMeasure`, `TauCeti.Probability.charFun_asymmetricLaplaceMeasure`, `TauCeti.Probability.asymmetricLaplaceMeasure_self`, `TauCeti.Probability.measurable_asymmetricLaplaceMeasure`; `Probability/Distributions/AsymmetricLaplace/Quantile.lean`: `TauCeti.Probability.quantile_asymmetricLaplaceMeasure`, `TauCeti.Probability.quantile_asymmetricLaplaceMeasure_location`, `TauCeti.Probability.continuousOn_quantile_asymmetricLaplaceMeasure`, `TauCeti.Probability.strictMonoOn_quantile_asymmetricLaplaceMeasure`, `TauCeti.Probability.tendsto_quantile_asymmetricLaplaceMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_asymmetricLaplaceMeasure_nhdsLT_one`; `Probability/Distributions/AsymmetricLaplace/Moments.lean`: `TauCeti.Probability.integrable_pow_asymmetricLaplaceMeasure`, `TauCeti.Probability.integral_pow_sub_asymmetricLaplaceMeasure`, `TauCeti.Probability.integral_pow_asymmetricLaplaceMeasure`; `Probability/Distributions/AsymmetricLaplace/Transforms.lean`: `TauCeti.Probability.integrableExpSet_id_asymmetricLaplaceMeasure`, `TauCeti.Probability.mgf_id_asymmetricLaplaceMeasure`, `TauCeti.Probability.cgf_id_asymmetricLaplaceMeasure`.
- §10.15. `Probability/Distributions/LogitNormal/Basic.lean`: `TauCeti.Probability.logitNormalMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_logitNormalMeasure`, `TauCeti.Probability.ae_mem_Ioo_logitNormalMeasure`, `TauCeti.Probability.map_logit_logitNormalMeasure`, `ProbabilityTheory.HasLaw.sigmoid_gaussianReal`, `TauCeti.Probability.cdf_logitNormalMeasure`, `TauCeti.Probability.cdf_logitNormalMeasure_eq`, `TauCeti.Probability.cdf_logitNormalMeasure_of_nonpos`, `TauCeti.Probability.cdf_logitNormalMeasure_of_one_le`, `TauCeti.Probability.logitNormalMeasure_zero_var`, `TauCeti.Probability.integrable_pow_logitNormalMeasure`, `TauCeti.Probability.integral_pow_logitNormalMeasure`, `TauCeti.Probability.integral_id_logitNormalMeasure`, `TauCeti.Probability.variance_id_logitNormalMeasure`, `TauCeti.Probability.integrableExpSet_id_logitNormalMeasure`, `TauCeti.Probability.map_one_sub_logitNormalMeasure`, `TauCeti.Probability.measurable_logitNormalMeasure`; `Probability/Distributions/LogitNormal/PDF.lean`: `TauCeti.Probability.logitNormalPDFReal_of_mem`, `TauCeti.Probability.logitNormalPDFReal_of_notMem`, `TauCeti.Probability.logitNormalPDFReal_pos`, `TauCeti.Probability.logitNormalMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_logitNormalMeasure`, `TauCeti.Probability.rnDeriv_logitNormalMeasure`, `TauCeti.Probability.support_logitNormalMeasure`, `TauCeti.Probability.mutuallySingular_logitNormalMeasure_zero_var`; `Probability/Distributions/LogitNormal/Quantile.lean`: `TauCeti.Probability.quantile_logitNormalMeasure`, `TauCeti.Probability.quantile_logitNormalMeasure_mem_Ioo`, `TauCeti.Probability.continuousOn_quantile_logitNormalMeasure`, `TauCeti.Probability.tendsto_quantile_logitNormalMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_logitNormalMeasure_nhdsLT_one`; `Probability/Distributions/LogUniform/Basic.lean`: `TauCeti.Probability.logUniformMeasure_of_pos`, `TauCeti.Probability.logUniformMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_logUniformMeasure`, `TauCeti.Probability.map_log_logUniformMeasure`, `TauCeti.Probability.logUniformPDFReal_of_mem`, `TauCeti.Probability.logUniformPDFReal_pos_iff`, `TauCeti.Probability.logUniformMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_logUniformMeasure`, `TauCeti.Probability.rnDeriv_logUniformMeasure`, `TauCeti.Probability.support_logUniformMeasure`, `TauCeti.Probability.cdf_logUniformMeasure_eq`, `TauCeti.Probability.quantile_logUniformMeasure`, `TauCeti.Probability.integrable_rpow_logUniformMeasure`, `TauCeti.Probability.integral_rpow_logUniformMeasure`, `TauCeti.Probability.integral_rpow_logUniformMeasure_zero`, `TauCeti.Probability.integral_id_logUniformMeasure`, `TauCeti.Probability.variance_id_logUniformMeasure`, `TauCeti.Probability.integrableExpSet_id_logUniformMeasure`, `TauCeti.Probability.measurable_logUniformMeasure`, `TauCeti.Probability.map_mul_logUniformMeasure`; `Probability/Distributions/LogUniform/Quantile.lean`: `TauCeti.Probability.tendsto_quantile_logUniformMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_logUniformMeasure_nhdsLT_one`.
- §10.16. `Probability/Distributions/HalfStudentT/Basic.lean`: `TauCeti.Probability.halfStudentTMeasure_of_pos`, `TauCeti.Probability.hasLaw_halfStudentTMeasure`, `TauCeti.Probability.halfStudentTMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_halfStudentTMeasure`, `TauCeti.Probability.halfStudentTPDFReal_of_pos`, `TauCeti.Probability.halfStudentTPDFReal_of_not_pos`, `TauCeti.Probability.halfStudentTMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_halfStudentTMeasure`, `TauCeti.Probability.rnDeriv_halfStudentTMeasure`, `TauCeti.Probability.ae_pos_halfStudentTMeasure`, `TauCeti.Probability.nullSingletonClass_halfStudentTMeasure`, `TauCeti.Probability.support_halfStudentTMeasure`, `TauCeti.Probability.cauchyMeasure_map_abs`, `TauCeti.Probability.halfCauchyMeasure_eq_map_cauchyMeasure`, `TauCeti.Probability.hasLaw_halfCauchyMeasure`, `TauCeti.Probability.halfStudentTMeasure_eq_map_betaPrimeMeasure`, `TauCeti.Probability.measurable_halfStudentTMeasure`, `TauCeti.Probability.halfStudentTMeasure_map_const_mul`; `Probability/Distributions/HalfStudentT/Quantile.lean`: `TauCeti.Probability.cdf_halfStudentTMeasure_eq`, `TauCeti.Probability.continuous_cdf_halfStudentTMeasure`, `TauCeti.Probability.strictMonoOn_cdf_halfStudentTMeasure`, `TauCeti.Probability.quantile_halfStudentTMeasure`, `TauCeti.Probability.quantile_halfStudentTMeasure_pos`, `TauCeti.Probability.continuousOn_quantile_halfStudentTMeasure`, `TauCeti.Probability.strictMonoOn_quantile_halfStudentTMeasure`, `TauCeti.Probability.tendsto_quantile_halfStudentTMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_halfStudentTMeasure_nhdsLT_one`; `Probability/Distributions/HalfStudentT/Moments.lean`: `TauCeti.Probability.integrable_rpow_halfStudentTMeasure_iff`, `TauCeti.Probability.integral_rpow_halfStudentTMeasure`, `TauCeti.Probability.integrable_pow_halfStudentTMeasure_iff`, `TauCeti.Probability.integral_pow_halfStudentTMeasure`, `TauCeti.Probability.integrable_id_halfStudentTMeasure_iff`, `TauCeti.Probability.integral_id_halfStudentTMeasure`, `TauCeti.Probability.integral_sq_halfStudentTMeasure`, `TauCeti.Probability.variance_id_halfStudentTMeasure`, `TauCeti.Probability.not_integrable_id_halfCauchyMeasure`, `TauCeti.Probability.integrable_exp_mul_id_halfStudentTMeasure_iff`, `TauCeti.Probability.integrableExpSet_id_halfStudentTMeasure`, `ProbabilityTheory.HasLaw.integral_rpow_halfStudentTMeasure`, `ProbabilityTheory.HasLaw.integral_halfStudentTMeasure`, `ProbabilityTheory.HasLaw.variance_halfStudentTMeasure`; `Probability/Distributions/StudentT/Basic.lean`: `TauCeti.Probability.studentTPDFReal`; `Probability/Distributions/BetaPrime/Basic.lean`: `TauCeti.Probability.betaPrimeMeasure`.
- §10.17. `Probability/Distributions/NoncentralBeta/Basic.lean`: `TauCeti.Probability.noncentralBetaMeasure_eq_map`, `TauCeti.Probability.hasLaw_noncentralBeta_of_noncentralChiSquared`, `TauCeti.Probability.noncentralBetaMeasure_of_not`, `TauCeti.Probability.isProbabilityMeasure_noncentralBetaMeasure_iff`, `TauCeti.Probability.noncentralBetaComponent_zero`, `TauCeti.Probability.noncentralBetaComponent_of_pos`, `TauCeti.Probability.noncentralBetaComponent_of_neg`, `TauCeti.Probability.measurable_noncentralBetaComponent`, `TauCeti.Probability.map_div_add_chiSquaredMeasure`, `TauCeti.Probability.noncentralBetaMeasure_eq_sum`, `TauCeti.Probability.noncentralBetaMeasure_eq_bind`, `TauCeti.Probability.noncentralBetaMeasure_apply`, `TauCeti.Probability.lintegral_noncentralBetaMeasure`, `TauCeti.Probability.absolutelyContinuous_noncentralBetaMeasure`, `TauCeti.Probability.nullSingletonClass_noncentralBetaMeasure`, `TauCeti.Probability.ae_mem_Ioo_noncentralBetaMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_noncentralBetaMeasure`, `TauCeti.Probability.noncentralBetaMeasure_zero_shape_singleton`, `TauCeti.Probability.noncentralBetaMeasure_zero_shape`, `TauCeti.Probability.noncentralBetaMeasure_singleton_of_ne_zero`, `TauCeti.Probability.noncentralBetaMeasure_zero_noncentrality`, `TauCeti.Probability.support_noncentralBetaMeasure`, `TauCeti.Probability.measurable_noncentralBetaMeasure`; `Probability/Distributions/NoncentralBeta/Cdf.lean`: `TauCeti.Probability.cdf_noncentralBetaComponent`, `TauCeti.Probability.cdf_noncentralBetaMeasure_eq`, `TauCeti.Probability.hasSum_cdf_noncentralBetaMeasure`, `TauCeti.Probability.cdf_noncentralBetaMeasure_of_neg`, `TauCeti.Probability.cdf_noncentralBetaMeasure_zero`, `TauCeti.Probability.cdf_noncentralBetaMeasure_of_one_le`, `TauCeti.Probability.continuous_cdf_noncentralBetaMeasure`, `TauCeti.Probability.cdf_noncentralBetaMeasure_zero_shape`, `TauCeti.Probability.continuousOn_cdf_noncentralBetaMeasure`, `TauCeti.Probability.strictMonoOn_cdf_noncentralBetaMeasure`, `TauCeti.Probability.cdf_noncentralBetaMeasure_lt_one`; `Probability/Distributions/NoncentralBeta/PDF.lean`: `TauCeti.Probability.noncentralBetaPDFReal_eq_tsum`, `TauCeti.Probability.summable_poisson_mul_betaPDFReal`, `TauCeti.Probability.noncentralBetaPDFReal_of_nonpos`, `TauCeti.Probability.noncentralBetaPDFReal_of_one_le`, `TauCeti.Probability.noncentralBetaMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_noncentralBetaMeasure`, `TauCeti.Probability.noncentralBetaMeasure_zero_shape_eq_atom_add_withDensity`, `TauCeti.Probability.lintegral_noncentralBetaPDF_zero_shape`, `TauCeti.Probability.noncentralBetaPDFReal_pos`; `Probability/Distributions/NoncentralBeta/Moments.lean`: `TauCeti.Probability.integrable_pow_noncentralBetaMeasure`, `TauCeti.Probability.integral_pow_noncentralBetaMeasure`, `TauCeti.Probability.hasSum_integral_pow_noncentralBetaMeasure`, `TauCeti.Probability.integral_pow_noncentralBetaComponent`, `TauCeti.Probability.integral_id_noncentralBetaMeasure`, `TauCeti.Probability.integral_sq_noncentralBetaMeasure`, `TauCeti.Probability.variance_id_noncentralBetaMeasure`, `ProbabilityTheory.HasLaw.integral_pow_noncentralBetaMeasure`, `ProbabilityTheory.HasLaw.variance_noncentralBetaMeasure`, `TauCeti.Probability.integrableExpSet_id_noncentralBetaMeasure`; `Probability/Distributions/NoncentralBeta/Quantile.lean`: `TauCeti.Probability.quantile_noncentralBetaMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_noncentralBetaMeasure_eq_iff`, `TauCeti.Probability.cdf_quantile_noncentralBetaMeasure`, `TauCeti.Probability.strictMonoOn_quantile_noncentralBetaMeasure`, `TauCeti.Probability.continuousOn_quantile_noncentralBetaMeasure`, `TauCeti.Probability.tendsto_quantile_noncentralBetaMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_noncentralBetaMeasure_nhdsLT_one`; `Probability/Distributions/NoncentralBeta/NoncentralF.lean`: `TauCeti.Probability.noncentralFMeasure_eq_map_noncentralBetaMeasure`; `Probability/Distributions/NoncentralChiSquared/Basic.lean`: `TauCeti.Probability.noncentralChiSquaredMeasure`; `Probability/Distributions/NoncentralF/Basic.lean`: `TauCeti.Probability.noncentralFMeasure`.
- §10.18. `Probability/Distributions/Hypoexponential/Basic.lean`: `TauCeti.Probability.hypoexponentialMeasure_eq_map`, `ProbabilityTheory.iIndepFun.hasLaw_sum_hypoexponentialMeasure`, `TauCeti.Probability.hypoexponentialMeasure_eq_zero_of_invalid`, `TauCeti.Probability.isProbabilityMeasure_hypoexponentialMeasure`, `TauCeti.Probability.hypoexponentialMeasure_of_isEmpty`, `TauCeti.Probability.hypoexponentialMeasure_of_unique`, `TauCeti.Probability.ae_pos_hypoexponentialMeasure`, `TauCeti.Probability.hypoexponentialMeasure_const`, `TauCeti.Probability.measurable_hypoexponentialMeasure`; `Probability/Distributions/Hypoexponential/Support.lean`: `TauCeti.Probability.hypoexponentialMeasure_absolutelyContinuous`, `TauCeti.Probability.nullSingletonClass_hypoexponentialMeasure`, `TauCeti.Probability.support_hypoexponentialMeasure`; `Probability/Distributions/Hypoexponential/PDF.lean`: `TauCeti.Probability.hypoexponentialPDFReal_of_not_pos`, `TauCeti.Probability.hypoexponentialPDFReal_of_isEmpty`, `TauCeti.Probability.hypoexponentialPDFReal_of_pos`, `TauCeti.Probability.hypoexponentialPDFReal_of_nonpos`, `TauCeti.Probability.hypoexponentialMeasure_eq_withDensity`, `TauCeti.Probability.lintegral_hypoexponentialPDF_eq_one`, `TauCeti.Probability.hasPDF_of_hasLaw_hypoexponentialMeasure`, `TauCeti.Probability.rnDeriv_hypoexponentialMeasure`, `TauCeti.Probability.hypoexponentialPDFReal_eq_sum_gammaPDFReal`, `TauCeti.Probability.hypoexponentialPDFReal_of_injective`, `TauCeti.Probability.hypoexponentialPDFReal_const`; `Probability/Distributions/Hypoexponential/PartialFractions.lean`: `TauCeti.Probability.hypoexponentialCoeff_def`, `TauCeti.Probability.hypoexponentialCoeff_card`, `TauCeti.Probability.prod_div_add_eq_sum_hypoexponentialCoeff`, `TauCeti.Probability.sum_hypoexponentialCoeff_div_pow`; `Probability/Distributions/Hypoexponential/Cdf.lean`: `TauCeti.Probability.cdf_hypoexponentialMeasure_eq`, `TauCeti.Probability.cdf_hypoexponentialMeasure_of_nonpos`, `TauCeti.Probability.cdf_hypoexponentialMeasure_eq_sum_regularizedGamma`, `TauCeti.Probability.cdf_hypoexponentialMeasure_of_injective`; `Probability/Distributions/Hypoexponential/Positivity.lean`: `TauCeti.Probability.hypoexponentialPDFReal_pos`, `TauCeti.Probability.hypoexponentialPDFReal_pos_iff`, `TauCeti.Probability.smul_gammaMeasure_le_hypoexponentialMeasure`; `Probability/Distributions/Hypoexponential/Transforms.lean`: `TauCeti.Probability.integrable_pow_hypoexponentialMeasure`, `TauCeti.Probability.integral_id_hypoexponentialMeasure`, `TauCeti.Probability.variance_id_hypoexponentialMeasure`, `TauCeti.Probability.integrableExpSet_id_hypoexponentialMeasure`, `TauCeti.Probability.mgf_id_hypoexponentialMeasure`, `TauCeti.Probability.cgf_id_hypoexponentialMeasure`, `TauCeti.Probability.charFun_hypoexponentialMeasure`; `Probability/Distributions/Hypoexponential/Moments.lean`: `TauCeti.Probability.integral_pow_hypoexponentialMeasure`; `Probability/Distributions/Hypoexponential/Quantile.lean`: `TauCeti.Probability.quantile_hypoexponentialMeasure_pos`, `TauCeti.Probability.quantile_hypoexponentialMeasure_eq_iff`, `TauCeti.Probability.cdf_quantile_hypoexponentialMeasure`, `TauCeti.Probability.continuousOn_quantile_hypoexponentialMeasure`, `TauCeti.Probability.strictMonoOn_quantile_hypoexponentialMeasure`, `TauCeti.Probability.tendsto_quantile_hypoexponentialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_hypoexponentialMeasure_nhdsLT_one`, `TauCeti.Probability.quantile_hypoexponentialMeasure_const`, `TauCeti.Probability.quantile_hypoexponentialMeasure_of_isEmpty`; `Probability/Distributions/Hypoexponential/Operations.lean`: `TauCeti.Probability.hypoexponentialMeasure_reindex`, `TauCeti.Probability.hypoexponentialMeasure_conv_hypoexponentialMeasure`, `TauCeti.Probability.map_mul_hypoexponentialMeasure`.
- §10.19. `Probability/Distributions/Hyperexponential/Basic.lean`: `TauCeti.Probability.hyperexponentialMeasure_of_pos`, `TauCeti.Probability.hyperexponentialMeasure_of_not_pos`, `TauCeti.Probability.isProbabilityMeasure_hyperexponentialMeasure_iff`, `TauCeti.Probability.hyperexponentialPDFReal_of_not_pos`, `TauCeti.Probability.hyperexponentialPDFReal_of_pos`, `TauCeti.Probability.cdf_hyperexponentialMeasure_eq`, `TauCeti.Probability.hyperexponentialMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_hyperexponentialMeasure`, `TauCeti.Probability.rnDeriv_hyperexponentialMeasure`, `TauCeti.Probability.isProbabilityMeasure_hyperexponentialMeasure`, `TauCeti.Probability.ae_pos_hyperexponentialMeasure`, `TauCeti.Probability.hyperexponentialPDFReal_pos_iff`, `TauCeti.Probability.support_hyperexponentialMeasure`, `TauCeti.Probability.hyperexponentialMeasure_eq_bind`, `TauCeti.Probability.hyperexponentialMeasure_congr`, `TauCeti.Probability.hyperexponentialMeasure_const`, `TauCeti.Probability.measurable_hyperexponentialMeasure`; `Probability/Distributions/Hyperexponential/Cdf.lean`: `TauCeti.Probability.strictMonoOn_cdf_hyperexponentialMeasure`, `TauCeti.Probability.cdf_hyperexponentialMeasure_lt_one`; `Probability/Distributions/Hyperexponential/Moments.lean`: `TauCeti.Probability.integrable_pow_hyperexponentialMeasure`, `TauCeti.Probability.integral_pow_hyperexponentialMeasure`, `TauCeti.Probability.integral_id_hyperexponentialMeasure`, `TauCeti.Probability.variance_id_hyperexponentialMeasure`; `Probability/Distributions/Hyperexponential/Transforms.lean`: `TauCeti.Probability.integrable_exp_mul_hyperexponentialMeasure_iff`, `TauCeti.Probability.integrableExpSet_id_hyperexponentialMeasure`, `TauCeti.Probability.mgf_id_hyperexponentialMeasure`, `TauCeti.Probability.cgf_id_hyperexponentialMeasure`, `TauCeti.Probability.charFun_hyperexponentialMeasure`; `Probability/Distributions/Hyperexponential/Quantile.lean`: `TauCeti.Probability.quantile_hyperexponentialMeasure_eq_iff`, `TauCeti.Probability.sum_exp_quantile_hyperexponentialMeasure`, `TauCeti.Probability.quantile_hyperexponentialMeasure_pos`, `TauCeti.Probability.continuousOn_quantile_hyperexponentialMeasure`, `TauCeti.Probability.strictMonoOn_quantile_hyperexponentialMeasure`, `TauCeti.Probability.tendsto_quantile_hyperexponentialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_hyperexponentialMeasure_nhdsLT_one`, `TauCeti.Probability.quantile_hyperexponentialMeasure_of_const`; `Probability/Distributions/Hyperexponential/Operations.lean`: `TauCeti.Probability.map_div_prod_categoricalMeasure_expMeasure`, `TauCeti.Probability.hasLaw_hyperexponentialMeasure_of_indepFun`, `TauCeti.Probability.hyperexponentialMeasure_stdSimplexMap`, `TauCeti.Probability.hyperexponentialMeasure_reindex`, `TauCeti.Probability.map_mul_hyperexponentialMeasure`, `TauCeti.Probability.hasLaw_mul_hyperexponentialMeasure`.
- §10.20. `Probability/Distributions/Arcsine/Basic.lean`: `TauCeti.Probability.arcsineMeasure`, `TauCeti.Probability.arcsineMeasure_eq_betaMeasure`, `TauCeti.Probability.isProbabilityMeasure_arcsineMeasure`, `TauCeti.Probability.ae_mem_Ioo_arcsineMeasure`, `TauCeti.Probability.support_arcsineMeasure`, `TauCeti.Probability.integrable_pow_arcsineMeasure`, `TauCeti.Probability.integral_pow_arcsineMeasure`, `TauCeti.Probability.integral_id_arcsineMeasure`, `TauCeti.Probability.variance_id_arcsineMeasure`, `TauCeti.Probability.integrableExpSet_id_arcsineMeasure`; `Probability/Distributions/Semicircle/Basic.lean`: `TauCeti.Probability.semicircleMeasure`, `TauCeti.Probability.semicircleMeasure_eq_map_betaMeasure`, `TauCeti.Probability.isProbabilityMeasure_semicircleMeasure`, `TauCeti.Probability.ae_mem_Ioo_semicircleMeasure`, `TauCeti.Probability.support_semicircleMeasure`, `TauCeti.Probability.integrable_pow_semicircleMeasure`, `TauCeti.Probability.integral_id_semicircleMeasure`, `TauCeti.Probability.variance_id_semicircleMeasure`, `TauCeti.Probability.integrableExpSet_id_semicircleMeasure`; `Probability/Distributions/Arcsine/PDF.lean`: `TauCeti.Probability.arcsinePDFReal_def`, `TauCeti.Probability.arcsinePDFReal_eq_betaPDFReal`, `TauCeti.Probability.arcsineMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_arcsineMeasure`, `TauCeti.Probability.rnDeriv_arcsineMeasure`; `Probability/Distributions/Arcsine/Cdf.lean`: `TauCeti.Probability.cdf_arcsineMeasure_eq`, `TauCeti.Probability.cdf_arcsineMeasure_of_nonpos`, `TauCeti.Probability.cdf_arcsineMeasure_of_one_le`, `TauCeti.Probability.hasDerivAt_cdf_arcsineMeasure`; `Probability/Distributions/Arcsine/Quantile.lean`: `TauCeti.Probability.quantile_arcsineMeasure`, `TauCeti.Probability.continuousOn_quantile_arcsineMeasure`, `TauCeti.Probability.tendsto_quantile_arcsineMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_arcsineMeasure_nhdsLT_one`; `Probability/Distributions/Semicircle/PDF.lean`: `TauCeti.Probability.map_neg_semicircleMeasure`, `TauCeti.Probability.nullSingletonClass_semicircleMeasure`, `TauCeti.Probability.semicirclePDFReal_apply`, `TauCeti.Probability.semicirclePDFReal_pos_iff`, `TauCeti.Probability.semicircleMeasure_eq_withDensity`, `TauCeti.Probability.hasPDF_of_hasLaw_semicircleMeasure`, `TauCeti.Probability.rnDeriv_semicircleMeasure`; `Probability/Distributions/Semicircle/Cdf.lean`: `TauCeti.Probability.cdf_semicircleMeasure_eq`, `TauCeti.Probability.hasDerivAt_cdf_semicircleMeasure`; `Probability/Distributions/Semicircle/Quantile.lean`: `TauCeti.Probability.quantile_semicircleMeasure`, `TauCeti.Probability.quantile_semicircleMeasure_mem_Ioo`, `TauCeti.Probability.continuousOn_quantile_semicircleMeasure`, `TauCeti.Probability.strictMonoOn_quantile_semicircleMeasure`, `TauCeti.Probability.tendsto_quantile_semicircleMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_semicircleMeasure_nhdsLT_one`; `Probability/Distributions/Semicircle/Moments.lean`: `TauCeti.Probability.integral_pow_two_mul_add_one_semicircleMeasure`, `TauCeti.Probability.integral_pow_two_mul_semicircleMeasure`; `Probability/Distributions/Semicircle/LocationScale.lean`: `TauCeti.Probability.integral_id_semicircleReal`, `TauCeti.Probability.variance_id_semicircleReal`, `TauCeti.Probability.support_semicircleReal`, `TauCeti.Probability.map_affine_semicircleReal`, `TauCeti.Probability.semicircleReal_zero_var`, `TauCeti.Probability.semicircleReal_zero_inv_four`.
- §11.1. `Probability/Distributions/MultivariateT/Basic.lean`: `TauCeti.Probability.multivariateTMeasure_of_posSemidef`, `TauCeti.Probability.hasLaw_multivariateT_of_gaussian_chiSquared`, `TauCeti.Probability.multivariateTMeasure_of_nonpos`, `TauCeti.Probability.multivariateTMeasure_of_not_posSemidef`, `TauCeti.Probability.isProbabilityMeasure_multivariateTMeasure`, `TauCeti.Probability.multivariateTMeasure_eq_bind`, `TauCeti.Probability.ae_mem_affineRange_multivariateTMeasure`, `TauCeti.Probability.multivariateTMeasure_zero_scale`, `TauCeti.Probability.map_affine_multivariateTMeasure`; `Probability/Distributions/MultivariateT/Measurability.lean`: `TauCeti.Probability.measurable_multivariateTMeasure`; `Probability/Distributions/MultivariateT/PDF.lean`: `TauCeti.Probability.multivariateTPDFReal_of_posDef`, `TauCeti.Probability.multivariateTMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_multivariateTMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_multivariateTMeasure`; `Probability/Distributions/MultivariateT/Support.lean`: `TauCeti.Probability.support_multivariateTMeasure`, `TauCeti.Probability.mutuallySingular_multivariateTMeasure_volume`; `Probability/Distributions/MultivariateT/Moments.lean`: `TauCeti.Probability.integrable_norm_pow_multivariateTMeasure_iff`, `TauCeti.Probability.integral_id_multivariateTMeasure`, `TauCeti.Probability.covMatrix_multivariateTMeasure`, `TauCeti.Probability.covarianceBilin_multivariateTMeasure`; `Probability/Distributions/MultivariateT/Transforms.lean`: `TauCeti.Probability.integrableExpSet_inner_multivariateTMeasure`; `Probability/Distributions/MultivariateT/Marginal.lean`: `TauCeti.Probability.map_inner_multivariateTMeasure`, `TauCeti.Probability.multivariateTMeasure_eq_map_single`; `Probability/Distributions/MultivariateT/GaussianLimit.lean`: `TauCeti.Probability.tendsto_multivariateTMeasure_atTop`; `Probability/Distributions/MultivariateT/Conditional.lean`: `EuclideanSpace.multivariateTCondKernel_apply`, `EuclideanSpace.isMarkovKernel_multivariateTCondKernel`, `EuclideanSpace.map_snd_fst_multivariateTMeasure`, `TauCeti.Probability.condDistrib_multivariateTMeasure`; `Probability/Distributions/Gaussian/Conditional/Basic.lean`: `EuclideanSpace.gaussianCondMean`, `Matrix.gaussianCondCov`.
- §11.2. `MeasureTheory/Measure/Lebesgue/Matrix.lean`: `Matrix.instMeasureSpace`, `TauCeti.volume_preserving_matrixVecMeasurableEquiv`; `Probability/Distributions/MatrixNormal/Basic.lean`: `TauCeti.Probability.matrixNormalMeasure_of_posSemidef`, `TauCeti.Probability.map_vec_matrixNormalMeasure`, `TauCeti.Probability.matrixNormalMeasure_of_not_posSemidef`, `TauCeti.Probability.isProbabilityMeasure_matrixNormalMeasure`, `TauCeti.Probability.memLp_apply_matrixNormalMeasure`, `TauCeti.Probability.integral_apply_matrixNormalMeasure`, `TauCeti.Probability.map_apply_matrixNormalMeasure`, `TauCeti.Probability.covariance_matrixNormalMeasure`, `TauCeti.Probability.map_row_matrixNormalMeasure`, `TauCeti.Probability.map_col_matrixNormalMeasure`, `TauCeti.Probability.map_mul_mul_add_matrixNormalMeasure`, `TauCeti.Probability.map_transpose_matrixNormalMeasure`, `TauCeti.Probability.matrixNormalMeasure_zero_left`, `TauCeti.Probability.matrixNormalMeasure_zero_right`, `TauCeti.Probability.matrixNormalMeasure_of_subsingleton`; `Probability/Distributions/MatrixNormal/Transforms.lean`: `TauCeti.Probability.map_trace_transpose_mul_matrixNormalMeasure`, `TauCeti.Probability.integrableExpSet_trace_transpose_mul_matrixNormalMeasure`, `TauCeti.Probability.mgf_trace_transpose_mul_matrixNormalMeasure`, `TauCeti.Probability.cgf_trace_transpose_mul_matrixNormalMeasure`, `TauCeti.Probability.charFun_map_trace_transpose_mul_matrixNormalMeasure`; `Probability/Distributions/MatrixNormal/PDF.lean`: `TauCeti.Probability.matrixNormalPDFReal_of_posDef`, `TauCeti.Probability.matrixNormalMeasure_eq_withDensity`, `TauCeti.Probability.matrixNormalPDFReal_eq_multivariateGaussianPDFReal`, `TauCeti.Probability.rnDeriv_matrixNormalMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_matrixNormalMeasure`; `Analysis/Matrix/MeasurableSpace.lean`: `TauCeti.matrixVecMeasurableEquiv`; `Probability/Distributions/Gaussian/Density.lean`: `TauCeti.Probability.multivariateGaussianPDFReal`.
- §11.3. `Probability/Distributions/Gaussian/ProperComplex/Basic.lean`: `TauCeti.Probability.complexGaussianRealCovariance_def`, `TauCeti.Probability.complexGaussianRealCovariance_inl_inl`, `TauCeti.Probability.posSemidef_complexGaussianRealCovariance_iff`, `TauCeti.Probability.posDef_complexGaussianRealCovariance_iff`, `TauCeti.Probability.properComplexGaussianMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_properComplexGaussianMeasure`, `TauCeti.Probability.isGaussian_properComplexGaussianMeasure`, `TauCeti.Probability.properComplexGaussianMeasure_of_not_posSemidef`, `TauCeti.Probability.properComplexGaussianMeasure_zero`, `TauCeti.Probability.integral_id_properComplexGaussianMeasure`, `TauCeti.Probability.measurable_properComplexGaussianMeasure`; `Probability/Distributions/Gaussian/ProperComplex/Moments.lean`: `TauCeti.Probability.integral_mul_conj_sub_properComplexGaussianMeasure`, `TauCeti.Probability.integral_mul_sub_properComplexGaussianMeasure`, `TauCeti.Probability.integrable_mul_conj_sub_properComplexGaussianMeasure`, `TauCeti.Probability.integrable_mul_sub_properComplexGaussianMeasure`, `TauCeti.Probability.integral_norm_sq_sub_eval_properComplexGaussianMeasure`; `Probability/Distributions/Gaussian/ProperComplex/Affine.lean`: `TauCeti.Probability.map_affine_properComplexGaussianMeasure`, `TauCeti.Probability.map_comp_properComplexGaussianMeasure`, `TauCeti.Probability.properComplexGaussianMeasure_centered_rotation`; `Probability/Distributions/Gaussian/ProperComplex/Transforms.lean`: `TauCeti.Probability.map_re_dotProduct_properComplexGaussianMeasure`, `TauCeti.Probability.integrableExpSet_re_dotProduct_properComplexGaussianMeasure`, `TauCeti.Probability.mgf_re_dotProduct_properComplexGaussianMeasure`, `TauCeti.Probability.cgf_re_dotProduct_properComplexGaussianMeasure`, `TauCeti.Probability.charFun_map_re_dotProduct_properComplexGaussianMeasure`; `Probability/Distributions/Gaussian/ProperComplex/Support.lean`: `TauCeti.Probability.ae_mem_affineRange_properComplexGaussianMeasure`, `TauCeti.Probability.support_properComplexGaussianMeasure`, `TauCeti.Probability.support_properComplexGaussianMeasure_of_not_posSemidef`, `TauCeti.Probability.mutuallySingular_properComplexGaussianMeasure_volume`; `Probability/Distributions/Gaussian/ProperComplex/PDF.lean`: `TauCeti.Probability.properComplexGaussianPDFReal_of_posDef`, `TauCeti.Probability.properComplexGaussianMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_properComplexGaussianMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_properComplexGaussianMeasure`, `TauCeti.Probability.properComplexGaussianPDFReal_eq_multivariateGaussianPDFReal`; `Probability/Distributions/Gaussian/ProperComplex/Modulus.lean`: `TauCeti.Probability.map_re_im_sub_eval_properComplexGaussianMeasure`, `TauCeti.Probability.map_norm_sq_sub_eval_properComplexGaussianMeasure`, `TauCeti.Probability.map_norm_sub_eval_properComplexGaussianMeasure`; `Analysis/Complex/Euclidean/Space.lean`: `TauCeti.complexToRealEuclidean`; `Probability/Distributions/NoncentralChi/Basic.lean`: `TauCeti.Probability.noncentralChiMeasure`.
- §11.4. `Probability/Distributions/MultivariateLogNormal/Basic.lean`: `TauCeti.Probability.multivariateLogNormalMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_multivariateLogNormalMeasure`, `TauCeti.Probability.measurable_multivariateLogNormalMeasure`, `TauCeti.Probability.hasLaw_exp_multivariateGaussian`, `TauCeti.Probability.map_log_multivariateLogNormalMeasure`, `TauCeti.Probability.ae_pos_multivariateLogNormalMeasure`, `TauCeti.Probability.multivariateLogNormalMeasure_of_not_posSemidef`, `TauCeti.Probability.multivariateLogNormalMeasure_zero`, `TauCeti.Probability.map_eval_multivariateLogNormalMeasure`, `TauCeti.Probability.map_logAffine_multivariateLogNormalMeasure`; `Probability/Distributions/MultivariateLogNormal/Support.lean`: `TauCeti.Probability.ae_mem_exp_affineRange_multivariateLogNormalMeasure`, `TauCeti.Probability.support_multivariateLogNormalMeasure`, `TauCeti.Probability.mutuallySingular_multivariateLogNormalMeasure_volume`, `TauCeti.Probability.support_multivariateLogNormalMeasure_of_not_posSemidef`; `Probability/Distributions/MultivariateLogNormal/PDF.lean`: `TauCeti.Probability.multivariateLogNormalPDFReal_of_pos`, `TauCeti.Probability.multivariateLogNormalPDFReal_of_not_pos`, `TauCeti.Probability.multivariateLogNormalMeasure_eq_withDensity`, `TauCeti.Probability.multivariateLogNormalPDFReal_eq_abs_det_fderiv_log`, `TauCeti.Probability.rnDeriv_multivariateLogNormalMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_multivariateLogNormalMeasure`; `Probability/Distributions/MultivariateLogNormal/Moments.lean`: `TauCeti.Probability.integrable_prod_rpow_multivariateLogNormalMeasure`, `TauCeti.Probability.integral_prod_rpow_multivariateLogNormalMeasure`, `TauCeti.Probability.integral_eval_multivariateLogNormalMeasure`, `TauCeti.Probability.covariance_eval_multivariateLogNormalMeasure`, `TauCeti.Probability.integral_id_multivariateLogNormalMeasure`, `TauCeti.Probability.covMatrix_multivariateLogNormalMeasure`, `TauCeti.Probability.map_inner_log_multivariateLogNormalMeasure`, `TauCeti.Probability.map_prod_rpow_multivariateLogNormalMeasure`; `Probability/Distributions/MultivariateLogNormal/Quantile.lean`: `TauCeti.Probability.quantile_map_eval_multivariateLogNormalMeasure`, `TauCeti.Probability.quantile_map_prod_rpow_multivariateLogNormalMeasure`, `TauCeti.Probability.tendsto_quantile_map_eval_multivariateLogNormalMeasure_nhdsGT_zero`; `Probability/Distributions/MultivariateLogNormal/Product.lean`: `TauCeti.Probability.map_mul_prod_multivariateLogNormalMeasure`, `ProbabilityTheory.IndepFun.hasLaw_mul_multivariateLogNormalMeasure`; `Probability/Distributions/LogNormal/Basic.lean`: `TauCeti.Probability.logNormalMeasure`.
- §11.5. `Probability/Distributions/LogisticNormal/Basic.lean`: `TauCeti.Probability.logisticNormalChart_apply`, `TauCeti.Probability.logisticNormalMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_logisticNormalMeasure`, `TauCeti.Probability.measurable_logisticNormalMeasure`, `TauCeti.Probability.continuous_logisticNormalChart`, `TauCeti.Probability.logisticNormalChart_injective`, `TauCeti.Probability.logisticNormalChart_pos`, `TauCeti.Probability.sum_logisticNormalChart`, `TauCeti.Probability.range_logisticNormalChart`, `TauCeti.Probability.logisticNormalLogRatio_apply`, `TauCeti.Probability.logisticNormalLogRatio_chart`, `TauCeti.Probability.logisticNormalChart_logRatio`, `TauCeti.Probability.ae_mem_simplex_logisticNormalMeasure`, `TauCeti.Probability.logisticNormalMeasure_of_not_posSemidef`, `TauCeti.Probability.logisticNormalMeasure_zero`, `TauCeti.Probability.logisticNormalMeasure_of_subsingleton`, `TauCeti.Probability.map_logisticNormalLogRatio_logisticNormalMeasure`, `TauCeti.Probability.map_log_div_logisticNormalMeasure`; `Probability/Distributions/Dirichlet/ReferenceMeasure.lean`: `TauCeti.Probability.abs_det_fderiv_dirichletChart_swap`, `TauCeti.Probability.map_dirichletChart_volume_eq`; `Probability/Distributions/LogisticNormal/PDF.lean`: `TauCeti.Probability.det_fderiv_logisticNormalChart_coords`, `TauCeti.Probability.logisticNormalChartPDFReal_of_mem`, `TauCeti.Probability.logisticNormalChartPDFReal_of_notMem`, `TauCeti.Probability.map_coords_logisticNormalMeasure_eq_withDensity`, `TauCeti.Probability.logisticNormalMeasure_eq_map_withDensity_logisticNormalChartPDF`, `TauCeti.Probability.rnDeriv_map_coords_logisticNormalMeasure`, `TauCeti.Probability.hasPDF_coords_of_hasLaw_logisticNormalMeasure`; `Probability/Distributions/LogisticNormal/Support.lean`: `TauCeti.Probability.ae_mem_chart_affineRange_logisticNormalMeasure`, `TauCeti.Probability.support_logisticNormalMeasure`, `TauCeti.Probability.mutuallySingular_logisticNormalMeasure_chart_volume`, `TauCeti.Probability.support_logisticNormalMeasure_of_not_posSemidef`; `Probability/Distributions/LogisticNormal/Reference.lean`: `TauCeti.Probability.logisticNormalReferenceEquiv_apply`, `TauCeti.Probability.toEuclideanLin_logisticNormalReferenceMatrix`, `TauCeti.Probability.logisticNormalReferenceEquiv_symm`, `TauCeti.Probability.logisticNormalChart_reference`, `TauCeti.Probability.logisticNormalMeasure_change_reference`, `TauCeti.Probability.posSemidef_logisticNormalReferenceMatrix_iff`, `ProbabilityTheory.HasLaw.logisticNormalLogRatio`; `Probability/Distributions/LogisticNormal/Permutation.lean`: `TauCeti.Probability.map_comp_logisticNormalMeasure`; `Probability/Distributions/LogisticNormal/Quantile.lean`: `TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure`, `TauCeti.Probability.quantile_map_log_div_logisticNormalMeasure_reference`; `Probability/Distributions/LogisticNormal/Moments.lean`: `TauCeti.Probability.integrable_prod_pow_logisticNormalMeasure`, `TauCeti.Probability.integral_prod_pow_logisticNormalMeasure`, `TauCeti.Probability.integral_id_logisticNormalMeasure`, `TauCeti.Probability.covMatrix_logisticNormalMeasure`, `TauCeti.Probability.integrableExpSet_inner_logisticNormalMeasure`; `Probability/Distributions/LogisticNormal/LogitNormal.lean`: `TauCeti.Probability.map_eval_logisticNormalMeasure_of_card_eq_two`, `TauCeti.Probability.map_logitNormalMeasure_eq_logisticNormalMeasure`; `Probability/Distributions/Dirichlet/Density.lean`: `TauCeti.Probability.dirichletChart`, `TauCeti.Probability.dirichletChartRegion`; `Probability/Distributions/LogitNormal/Basic.lean`: `TauCeti.Probability.logitNormalMeasure`.
- §12.1. `Probability/Distributions/Uniform/Sphere/Basic.lean`: `TauCeti.Probability.uniformSphereMeasure_def`, `TauCeti.Probability.uniformSphereMeasure_apply`, `TauCeti.Probability.isProbabilityMeasure_uniformSphereMeasure`, `LinearIsometryEquiv.map_uniformSphereMeasure`, `TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm`, `TauCeti.Probability.stdGaussian_map_sphereDirection`, `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian`, `TauCeti.Probability.integral_coe_uniformSphereMeasure`; `Geometry/Euclidean/Volume/Sphere.lean`: `TauCeti.toSphere_volume_apply_univ`; `Analysis/Normed/Module/Normalize/Measurable.lean`: `TauCeti.measurable_sphereDirection`; `Analysis/Normed/Module/Normalize.lean`: `TauCeti.sphereDirection_zero`, `TauCeti.sphereDirection`; `Probability/Distributions/Gaussian/Density.lean`: `TauCeti.Probability.stdGaussian_eq_withDensity_norm`; `Probability/Distributions/Uniform/Sphere/Moments.lean`: `TauCeti.Probability.covMatrix_map_coe_uniformSphereMeasure`, `TauCeti.Probability.covarianceBilin_map_coe_uniformSphereMeasure`, `TauCeti.Probability.variance_inner_uniformSphereMeasure`; `Probability/Distributions/Uniform/Sphere/OneDimensional.lean`: `TauCeti.Probability.uniformSphereMeasure_eq_of_finrank_eq_one`, `TauCeti.Probability.map_coe_uniformSphereMeasure_real`; `Probability/Distributions/Uniform/Ball/Basic.lean`: `TauCeti.Probability.uniformBallMeasure_def`, `TauCeti.Probability.uniformBallMeasure_of_neg`, `TauCeti.Probability.uniformBallMeasure_zero_right`, `TauCeti.Probability.isProbabilityMeasure_uniformBallMeasure_iff`, `TauCeti.Probability.uniformBallMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_uniformBallMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_uniformBallMeasure`, `TauCeti.Probability.isUniform_of_hasLaw_uniformBallMeasure`, `TauCeti.Probability.map_const_add_uniformBallMeasure`, `TauCeti.Probability.map_const_smul_uniformBallMeasure`, `TauCeti.Probability.uniformBallMeasure_eq_map_unitBall`, `LinearIsometryEquiv.map_uniformBallMeasure`, `TauCeti.Probability.integral_id_uniformBallMeasure`, `TauCeti.Probability.covarianceBilin_uniformBallMeasure`, `TauCeti.Probability.map_norm_sub_div_uniformBallMeasure`, `TauCeti.Probability.map_sphereDirection_prod_uniformBallMeasure`, `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_uniformBallMeasure`; `Probability/Distributions/Uniform/Ball/Measurability.lean`: `TauCeti.Probability.measurable_uniformBallMeasure`; `Probability/Distributions/Uniform/Ball/Support.lean`: `TauCeti.Probability.support_uniformBallMeasure`; `Probability/Distributions/Beta/Cdf.lean`: `TauCeti.Probability.cdf_betaMeasure_one_right`; `Probability/Distributions/Beta/Quantile.lean`: `TauCeti.Probability.quantile_betaMeasure_one_right`; `Probability/Distributions/Uniform/Sphere/Coordinate.lean`: `TauCeti.Probability.map_add_one_div_two_eval_uniformSphereMeasure`, `TauCeti.Probability.map_eval_uniformSphereMeasure`, `TauCeti.Probability.cdf_map_eval_uniformSphereMeasure`, `TauCeti.Probability.quantile_map_eval_uniformSphereMeasure`, `TauCeti.Probability.tendsto_quantile_map_eval_uniformSphereMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_eval_uniformSphereMeasure_nhdsLT_one`, `TauCeti.Probability.map_inner_uniformSphereMeasure`, `TauCeti.Probability.quantile_map_inner_uniformSphereMeasure`; `Probability/Distributions/Uniform/Ball/Coordinate.lean`: `TauCeti.Probability.map_add_one_div_two_eval_uniformBallMeasure`, `TauCeti.Probability.map_eval_uniformBallMeasure`, `TauCeti.Probability.cdf_map_eval_uniformBallMeasure`, `TauCeti.Probability.quantile_map_eval_uniformBallMeasure`, `TauCeti.Probability.map_inner_uniformBallMeasure`, `TauCeti.Probability.cdf_map_inner_uniformBallMeasure`, `TauCeti.Probability.quantile_map_inner_uniformBallMeasure`, `TauCeti.Probability.tendsto_quantile_map_inner_uniformBallMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_inner_uniformBallMeasure_nhdsLT_one`.
- §12.2. `Probability/Distributions/VonMisesFisher/Basic.lean`: `TauCeti.Probability.vonMisesFisherNaturalMeasure_def`, `TauCeti.Probability.vonMisesFisherMeasure_of_nonneg`, `TauCeti.Probability.vonMisesFisherMeasure_of_neg`, `TauCeti.Probability.vonMisesFisherNaturalMeasure_of_subsingleton`, `TauCeti.Probability.measurable_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.measurable_vonMisesFisherMeasure`, `TauCeti.Probability.vonMisesFisherNaturalMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.isProbabilityMeasure_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.isProbabilityMeasure_vonMisesFisherMeasure_iff`, `TauCeti.Probability.vonMisesFisherNaturalMeasure_zero`, `TauCeti.Probability.integrableExpSet_inner_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.mgf_inner_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.cgf_inner_vonMisesFisherNaturalMeasure`; `Probability/Distributions/Uniform/Sphere/Basic.lean`: `TauCeti.Probability.integrable_exp_inner_uniformSphereMeasure`, `TauCeti.Probability.integral_exp_inner_uniformSphereMeasure_pos`, `TauCeti.Probability.uniformSphereMeasure`; `Probability/Distributions/VonMisesFisher/Normalizer.lean`: `TauCeti.Probability.integral_exp_inner_toSphere_eq_besselI`, `TauCeti.Probability.integral_exp_inner_uniformSphereMeasure_eq_besselI`, `TauCeti.Probability.vonMisesFisherMeasure_eq_withDensity_besselI`; `Probability/Distributions/VonMisesFisher/OneDimensional.lean`: `TauCeti.Probability.vonMisesFisherNaturalMeasure_eq_of_finrank_eq_one`, `TauCeti.Probability.integral_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`, `TauCeti.Probability.variance_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`, `TauCeti.Probability.mgf_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`, `TauCeti.Probability.cdf_map_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`, `TauCeti.Probability.quantile_map_inner_vonMisesFisherNaturalMeasure_of_finrank_eq_one`; `Probability/Distributions/VonMisesFisher/Moments.lean`: `TauCeti.Probability.integral_coe_vonMisesFisherMeasure`, `TauCeti.Probability.integral_coe_vonMisesFisherNaturalMeasure`, `TauCeti.Probability.integral_coe_vonMisesFisherMeasure_zero`; `Probability/Distributions/VonMisesFisher/Equivariance.lean`: `LinearIsometryEquiv.map_vonMisesFisherNaturalMeasure`, `LinearIsometryEquiv.map_vonMisesFisherMeasure`; `Probability/Distributions/VonMisesFisher/Projection.lean`: `TauCeti.Probability.vonMisesFisherProjectionPDFReal_of_mem`, `TauCeti.Probability.map_inner_vonMisesFisherMeasure_eq_withDensity`, `TauCeti.Probability.rnDeriv_map_inner_vonMisesFisherMeasure`, `TauCeti.Probability.map_inner_vonMisesFisherMeasure`, `TauCeti.Probability.cdf_map_inner_vonMisesFisherMeasure_eq_integral`, `TauCeti.Probability.strictMonoOn_cdf_map_inner_vonMisesFisherMeasure`, `TauCeti.Probability.quantile_map_inner_vonMisesFisherMeasure_eq_iff`.
- §12.3. `Geometry/Euclidean/Circle.lean`: `TauCeti.circleSphereHomeomorph`, `TauCeti.circleSphereHomeomorph_coe`; `Probability/Distributions/Uniform/Sphere/Circle.lean`: `TauCeti.Probability.map_circleSphereHomeomorph_haarAddCircle`; `MeasureTheory/Measure/AddCircle.lean`: `AddCircle.map_coe_equivIco_volume`, `AddCircle.map_coe_equivIco_withDensity_haarAddCircle`; `Probability/Distributions/VonMises/Basic.lean`: `TauCeti.Probability.vonMisesPDFReal_coe_coe`, `TauCeti.Probability.vonMisesPDFReal_def`, `TauCeti.Probability.vonMisesMeasure_of_nonneg`, `TauCeti.Probability.rnDeriv_vonMisesMeasure`, `TauCeti.Probability.vonMisesMeasure_eq_tilted`, `TauCeti.Probability.vonMisesMeasure_of_neg`, `TauCeti.Probability.isProbabilityMeasure_vonMisesMeasure_iff`, `TauCeti.Probability.support_vonMisesMeasure`, `TauCeti.Probability.measurable_vonMisesMeasure`, `TauCeti.Probability.map_add_right_vonMisesMeasure`, `TauCeti.Probability.integral_fourier_vonMisesMeasure`, `TauCeti.Probability.norm_integral_fourier_one_vonMisesMeasure`, `TauCeti.Probability.vonMisesMeasure_zero_concentration`; `Probability/Distributions/VonMises/Fisher.lean`: `TauCeti.Probability.map_circleSphereHomeomorph_vonMisesMeasure`, `TauCeti.Probability.map_circleSphereHomeomorph_symm_vonMisesFisherMeasure`; `Probability/Distributions/VonMises/Angle.lean`: `TauCeti.Probability.vonMisesAngleMeasure_def`, `TauCeti.Probability.cdf_vonMisesAngleMeasure_eq_integral`, `TauCeti.Probability.strictMonoOn_cdf_vonMisesAngleMeasure`, `TauCeti.Probability.quantile_vonMisesAngleMeasure_eq_iff`; `Probability/Distributions/VonMisesFisher/Basic.lean`: `TauCeti.Probability.vonMisesFisherMeasure`.
- §12.4. `Probability/Distributions/WrappedNormal/Basic.lean`: `TauCeti.Probability.wrappedNormalMeasure_def`, `TauCeti.Probability.wrappedNormalMeasure_coe`, `TauCeti.Probability.isProbabilityMeasure_wrappedNormalMeasure`, `TauCeti.Probability.wrappedNormalMeasure_zero_var`, `TauCeti.Probability.map_add_right_wrappedNormalMeasure`, `TauCeti.Probability.measurable_wrappedNormalMeasure`, `TauCeti.Probability.integral_fourier_wrappedNormalMeasure`, `TauCeti.Probability.norm_integral_fourier_one_wrappedNormalMeasure`, `TauCeti.Probability.wrappedNormalMeasure_conv_wrappedNormalMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_wrappedNormalMeasure`, `TauCeti.Probability.tendsto_wrappedNormalMeasure_nhds_zero_dirac`; `Probability/Distributions/WrappedNormal/Density.lean`: `TauCeti.Probability.wrappedNormalMeasure_eq_withDensity`, `TauCeti.Probability.wrappedNormalPDFReal_pos`, `TauCeti.Probability.integral_wrappedNormalPDFReal`, `TauCeti.Probability.rnDeriv_wrappedNormalMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_wrappedNormalMeasure`, `TauCeti.Probability.wrappedNormalPDFReal_def`, `TauCeti.Probability.wrappedNormalPDFReal_coe`, `TauCeti.Probability.hasSum_wrappedNormalPDFReal_coe`, `TauCeti.Probability.hasSumUniformly_wrappedNormalPDFReal_coe`, `TauCeti.Probability.wrappedNormalPDFReal_coe_eq_gaussianLatticeSum`; `Probability/Distributions/WrappedNormal/HaarLimit.lean`: `AddCircle.tendsto_wrappedNormalMeasure_atTop_haar`; `Probability/Distributions/WrappedNormal/Angle.lean`: `TauCeti.Probability.cdf_wrappedNormalAngleMeasure_eq_integral`, `TauCeti.Probability.cdf_wrappedNormalAngleMeasure_eq_tsum`, `TauCeti.Probability.strictMonoOn_cdf_wrappedNormalAngleMeasure`, `TauCeti.Probability.quantile_wrappedNormalAngleMeasure_eq_iff`, `TauCeti.Probability.wrappedNormalAngleMeasure_zero_var`.
- §12.5. `Probability/Distributions/WrappedCauchy/Basic.lean`: `TauCeti.Probability.wrappedCauchyMeasure_def`, `TauCeti.Probability.wrappedCauchyMeasure_coe`, `TauCeti.Probability.isProbabilityMeasure_wrappedCauchyMeasure`, `TauCeti.Probability.wrappedCauchyMeasure_zero_scale`, `TauCeti.Probability.map_add_right_wrappedCauchyMeasure`, `TauCeti.Probability.measurable_wrappedCauchyMeasure`, `TauCeti.Probability.integral_fourier_wrappedCauchyMeasure`, `TauCeti.Probability.norm_integral_fourier_one_wrappedCauchyMeasure`, `TauCeti.Probability.wrappedCauchyMeasure_conv_wrappedCauchyMeasure`, `ProbabilityTheory.IndepFun.hasLaw_add_wrappedCauchyMeasure`, `TauCeti.Probability.tendsto_wrappedCauchyMeasure_nhds_zero_dirac`; `Probability/Distributions/WrappedCauchy/Density.lean`: `TauCeti.Probability.wrappedCauchyPDFReal_apply`, `TauCeti.Probability.wrappedCauchyMeasure_eq_withDensity`, `TauCeti.Probability.wrappedCauchyPDFReal_pos`, `TauCeti.Probability.integral_wrappedCauchyPDFReal`, `TauCeti.Probability.rnDeriv_wrappedCauchyMeasure`, `TauCeti.Probability.hasPDF_of_hasLaw_wrappedCauchyMeasure`; `Probability/Distributions/WrappedCauchy/HaarLimit.lean`: `AddCircle.tendsto_wrappedCauchyMeasure_atTop_haar`; `Probability/Distributions/WrappedCauchy/Angle.lean`: `TauCeti.Probability.cdf_wrappedCauchyAngleMeasure_eq_integral`, `TauCeti.Probability.strictMonoOn_cdf_wrappedCauchyAngleMeasure`, `TauCeti.Probability.quantile_wrappedCauchyAngleMeasure_eq_iff`, `TauCeti.Probability.wrappedCauchyAngleMeasure_zero_scale`.
- §13.1. `Probability/Distributions/Gaussian/Quantile.lean`: `TauCeti.Probability.quantile_gaussianReal_eq_add_mul`, `TauCeti.Probability.tendsto_quantile_gaussianReal_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_gaussianReal_nhdsLT_one`; `Probability/Distributions/Gamma/Quantile.lean`: `TauCeti.Probability.quantile_gammaMeasure`, `TauCeti.Probability.tendsto_quantile_gammaMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_gammaMeasure_nhdsLT_one`; `Probability/Distributions/Beta/Quantile.lean`: `TauCeti.Probability.quantile_betaMeasure`, `TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_betaMeasure_nhdsLT_one`; `Probability/Distributions/Exponential/Quantile.lean`: `TauCeti.Probability.quantile_expMeasure`, `TauCeti.Probability.tendsto_quantile_expMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_expMeasure_nhdsLT_one`; `Probability/Distributions/Cauchy/Quantile.lean`: `TauCeti.Probability.quantile_cauchyMeasure`, `TauCeti.Probability.tendsto_quantile_cauchyMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_cauchyMeasure_nhdsLT_one`; `Probability/Distributions/Pareto/Quantile.lean`: `TauCeti.Probability.quantile_paretoMeasure`, `TauCeti.Probability.tendsto_quantile_paretoMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_paretoMeasure_nhdsLT_one`; `Probability/Distributions/Uniform/Quantile.lean`: `TauCeti.Probability.quantile_uniformMeasure`, `TauCeti.Probability.tendsto_quantile_uniformMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_uniformMeasure_nhdsLT_one`; `Probability/Distributions/Laplace/Quantile.lean`: `TauCeti.Probability.quantile_laplaceMeasure`, `TauCeti.Probability.tendsto_quantile_laplaceMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_laplaceMeasure_nhdsLT_one`; `Probability/Distributions/LogNormal/Quantile.lean`: `TauCeti.Probability.quantile_logNormalMeasure`, `TauCeti.Probability.tendsto_quantile_logNormalMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_logNormalMeasure_nhdsLT_one`; `Probability/Distributions/Weibull/Quantile.lean`: `TauCeti.Probability.quantile_weibullMeasure`, `TauCeti.Probability.tendsto_quantile_weibullMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_weibullMeasure_nhdsLT_one`; `Probability/Distributions/ChiSquared/Quantile.lean`: `TauCeti.Probability.quantile_chiSquaredMeasure`, `TauCeti.Probability.tendsto_quantile_chiSquaredMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_chiSquaredMeasure_nhdsLT_one`; `Probability/Distributions/InverseGamma/Quantile.lean`: `TauCeti.Probability.quantile_inverseGammaMeasure`, `TauCeti.Probability.tendsto_quantile_inverseGammaMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_inverseGammaMeasure_nhdsLT_one`; `Probability/Distributions/FisherSnedecor/Quantile.lean`: `TauCeti.Probability.quantile_fisherSnedecorMeasure`, `TauCeti.Probability.tendsto_quantile_fisherSnedecorMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_fisherSnedecorMeasure_nhdsLT_one`; `Probability/Distributions/StudentT/Quantile.lean`: `TauCeti.Probability.quantile_studentTMeasure`, `TauCeti.Probability.quantile_studentTMeasure_half`, `TauCeti.Probability.tendsto_quantile_studentTMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_studentTMeasure_nhdsLT_one`.
- §13.2. `Probability/Distributions/Bernoulli/Quantile.lean`: `TauCeti.Probability.quantile_bernoulliMeasure`, `TauCeti.Probability.tendsto_quantile_bernoulliMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_bernoulliMeasure_nhdsLT_one`; `Probability/Distributions/Geometric/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_geometricMeasure`, `TauCeti.Probability.quantile_map_cast_geometricMeasure_zero`, `TauCeti.Probability.quantile_map_cast_geometricMeasure_one`, `TauCeti.Probability.tendsto_quantile_map_cast_geometricMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_geometricMeasure_nhdsLT_one`; `Probability/Distributions/Poisson/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_iff_regularizedGamma`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_eq_zero_iff`, `TauCeti.Probability.quantile_map_cast_poissonMeasure_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_poissonMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_poissonMeasure_nhdsLT_one`; `Probability/Distributions/Binomial/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_binomial_eq_iff`, `TauCeti.Probability.quantile_map_cast_binomial_eq_zero_iff`, `TauCeti.Probability.quantile_map_cast_binomial_eq_self`, `TauCeti.Probability.quantile_map_cast_binomial_zero`, `TauCeti.Probability.quantile_map_cast_binomial_prob_zero`, `TauCeti.Probability.quantile_map_cast_binomial_prob_one`, `TauCeti.Probability.tendsto_quantile_map_cast_binomial_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_binomial_nhdsLT_one`; `Probability/Distributions/Hypergeometric/Quantile.lean`: `TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_iff`, `TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_lower`, `TauCeti.Probability.quantile_map_cast_hypergeometricMeasure_eq_upper`, `TauCeti.Probability.tendsto_quantile_map_cast_hypergeometricMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_hypergeometricMeasure_nhdsLT_one`; `Probability/Distributions/NegativeBinomial/Quantile.lean`: `TauCeti.Probability.tendsto_quantile_map_cast_negativeBinomialMeasure_nhdsGT_zero`, `TauCeti.Probability.tendsto_quantile_map_cast_negativeBinomialMeasure_nhdsLT_one`.
- §13.3. `Probability/Distributions/OrderStatistic/Quantile.lean`: `TauCeti.Probability.quantile_map_orderStatistic_pi`, `TauCeti.Probability.quantile_of_hasLaw_orderStatistic_iid`.
- §13.4. `Probability/Distributions/Dirichlet/Quantile.lean`: `TauCeti.Probability.quantile_map_eval_dirichletMeasure`, `TauCeti.Probability.quantile_map_eval_dirichletMeasure_of_card_eq_one`; `Probability/Distributions/Gaussian/Quantile.lean`: `EuclideanSpace.quantile_map_inner_multivariateGaussian`; `Probability/Distributions/MultivariateT/Marginal.lean`: `TauCeti.Probability.quantile_multivariateTMeasure_projection`; `Probability/Distributions/MatrixNormal/Quantile.lean`: `Matrix.quantile_map_trace_transpose_mul_matrixNormalMeasure`, `Matrix.quantile_map_apply_matrixNormalMeasure`; `Probability/Distributions/Gaussian/ProperComplex/Quantile.lean`: `TauCeti.Probability.quantile_map_re_dotProduct_properComplexGaussianMeasure`; `Probability/Distributions/Uniform/Sphere/OneDimensional.lean`: `TauCeti.Probability.map_inner_uniformSphereMeasure_of_finrank_eq_one`.
- §13.5. `Probability/Distributions/Cauchy/Affine.lean`: `TauCeti.Probability.cauchyMeasure_map_affine`, `TauCeti.Probability.hasLaw_affine_cauchyMeasure`; `Probability/Distributions/GeneralizedNormal/Affine.lean`: `TauCeti.Probability.generalizedNormalMeasure_map_affine`, `TauCeti.Probability.hasLaw_affine_generalizedNormalMeasure`; `Probability/Distributions/AsymmetricLaplace/Affine.lean`: `TauCeti.Probability.asymmetricLaplaceMeasure_map_affine_pos`, `TauCeti.Probability.asymmetricLaplaceMeasure_map_affine_neg`, `TauCeti.Probability.hasLaw_affine_pos_asymmetricLaplaceMeasure`, `TauCeti.Probability.hasLaw_affine_neg_asymmetricLaplaceMeasure`; `Probability/Distributions/Laplace/Affine.lean`: `TauCeti.Probability.laplaceMeasure_map_affine`, `TauCeti.Probability.hasLaw_affine_laplaceMeasure`; `Probability/Distributions/Logistic/Basic.lean`: `TauCeti.Probability.map_affine_logisticMeasure`; `Probability/Distributions/Triangular/Affine.lean`: `TauCeti.Probability.triangularMeasure_map_affine_pos`, `TauCeti.Probability.triangularMeasure_map_affine_neg`, `TauCeti.Probability.hasLaw_affine_pos_triangularMeasure`, `TauCeti.Probability.hasLaw_affine_neg_triangularMeasure`; `Probability/Distributions/Gumbel/Basic.lean`: `TauCeti.Probability.map_affine_gumbelMeasure`, `TauCeti.Probability.hasLaw_affine_gumbelMeasure`; `Probability/Distributions/GeneralizedExtremeValue/Basic.lean`: `TauCeti.Probability.map_affine_generalizedExtremeValueMeasure`, `TauCeti.Probability.hasLaw_affine_generalizedExtremeValueMeasure`; `Probability/Distributions/Levy/Basic.lean`: `TauCeti.Probability.map_affine_levyMeasure`, `TauCeti.Probability.hasLaw_affine_levyMeasure`; `Probability/Distributions/SkewNormal/Basic.lean`: `TauCeti.Probability.map_affine_skewNormalMeasure`, `TauCeti.Probability.hasLaw_affine_skewNormalMeasure`; `Probability/Distributions/Exponential/Basic.lean`: `TauCeti.Probability.expMeasure_map_const_mul`; `Probability/Distributions/InverseGamma/Basic.lean`: `TauCeti.Probability.inverseGammaMeasure_map_const_mul`; `Probability/Distributions/Weibull/Scaling.lean`: `TauCeti.Probability.weibullMeasure_map_const_mul`; `Probability/Distributions/Pareto/Scaling.lean`: `TauCeti.Probability.paretoMeasure_map_const_mul`; `Probability/Distributions/LogNormal/Scaling.lean`: `TauCeti.Probability.logNormalMeasure_map_const_mul`; `Probability/Distributions/Chi/Basic.lean`: `TauCeti.Probability.chiMeasure_map_const_mul`; `Probability/Distributions/NoncentralChi/Basic.lean`: `TauCeti.Probability.noncentralChiMeasure_map_const_mul`; `Probability/Distributions/Nakagami/Basic.lean`: `TauCeti.Probability.nakagamiMeasure_map_const_mul`; `Probability/Distributions/GeneralizedPareto/Basic.lean`: `TauCeti.Probability.map_mul_generalizedParetoMeasure`; `Probability/Distributions/InverseGaussian/Basic.lean`: `TauCeti.Probability.inverseGaussianMeasure_map_const_mul`; `Probability/Distributions/Beta/Reflection.lean`: `TauCeti.Probability.betaMeasure_map_one_sub`, `ProbabilityTheory.HasLaw.one_sub_betaMeasure`; `Probability/Distributions/StudentT/Basic.lean`: `TauCeti.Probability.studentTMeasure_map_neg`; `Probability/Distributions/Hypergeometric/Complement.lean`: `TauCeti.Probability.map_sub_hypergeometricMeasure`, `TauCeti.Probability.map_sub_map_cast_hypergeometricMeasure`, `ProbabilityTheory.HasLaw.sub_hypergeometricMeasure`.
- §13.6. `Probability/Distributions/NoncentralChiSquared/Continuity.lean`: `TauCeti.Probability.continuous_noncentralChiSquaredMeasure`, `Continuous.noncentralChiSquaredMeasure`; `Probability/Distributions/LogitNormal/Continuity.lean`: `TauCeti.Probability.continuous_logitNormalMeasure`, `Continuous.logitNormalMeasure`, `TauCeti.Probability.tendsto_logitNormalMeasure_nhds_zero_dirac`; `Probability/Distributions/NoncentralBeta/Continuity.lean`: `TauCeti.Probability.continuous_noncentralBetaMeasure`, `Continuous.noncentralBetaMeasure`; `Probability/Distributions/Hypoexponential/Continuity.lean`: `TauCeti.Probability.continuous_hypoexponentialMeasure`; `Probability/Distributions/Hyperexponential/Continuity.lean`: `TauCeti.Probability.continuous_hyperexponentialMeasure`; `Probability/Distributions/MatrixNormal/Continuity.lean`: `TauCeti.Probability.continuous_matrixNormalMeasure`, `Continuous.matrixNormalMeasure`; `Probability/Distributions/Gaussian/ProperComplex/Continuity.lean`: `TauCeti.Probability.continuous_properComplexGaussianMeasure`, `Continuous.properComplexGaussianMeasure`, `TauCeti.Probability.tendsto_properComplexGaussianMeasure_nhds_zero_dirac`; `Probability/Distributions/MultivariateLogNormal/Continuity.lean`: `TauCeti.Probability.continuous_multivariateLogNormalMeasure`, `Continuous.multivariateLogNormalMeasure`, `TauCeti.Probability.tendsto_multivariateLogNormalMeasure_nhds_zero_dirac`; `Probability/Distributions/LogisticNormal/Continuity.lean`: `TauCeti.Probability.continuous_logisticNormalMeasure`, `Continuous.logisticNormalMeasure`, `TauCeti.Probability.tendsto_logisticNormalMeasure_nhds_zero_dirac`.
- §14.1. `MeasureTheory/Measure/SymmetricMatrix/Correlation.lean`: `TauCeti.coe_correlationMatrix_apply_self`, `TauCeti.coe_correlationMatrix_apply_of_gt`, `TauCeti.coe_correlationMatrix_apply_of_lt`, `TauCeti.isClosedEmbedding_correlationMatrix`, `TauCeti.measurableEmbedding_correlationMatrix`, `TauCeti.range_correlationMatrix`, `TauCeti.correlationCoordinates_correlationMatrix`, `TauCeti.correlationMatrix_correlationCoordinates`, `TauCeti.measurePreserving_correlationMatrix`, `TauCeti.correlationLebesgue_apply`, `TauCeti.ae_correlationLebesgue_diag_eq_one`, `TauCeti.correlationLebesgue_of_le_one`, `TauCeti.map_symmetricCongruenceLinearMap_permMatrix_correlationLebesgue`, `TauCeti.map_symmetricCongruenceLinearMap_diagonal_correlationLebesgue`, `TauCeti.isOpen_posDefCorrelationRegion`, `TauCeti.convex_posDefCorrelationRegion`, `TauCeti.isBounded_posDefCorrelationRegion`, `TauCeti.measurableSet_posDefCorrelationRegion`, `TauCeti.zero_mem_posDefCorrelationRegion`, `TauCeti.posDefCorrelationRegion_subset_pi`, `TauCeti.volume_posDefCorrelationRegion_pos`, `TauCeti.volume_posDefCorrelationRegion_lt_top`, `TauCeti.correlationLebesgue_setOf_posDef`, `TauCeti.closure_posDefCorrelationRegion`, `TauCeti.frontier_posDefCorrelationRegion`, `TauCeti.volume_frontier_posDefCorrelationRegion`; `MeasureTheory/Measure/SymmetricMatrix/Congruence.lean`: `Matrix.symmetricCongruenceLinearMap`; `MeasureTheory/Measure/SymmetricMatrix/Basic.lean`: `TauCeti.symmetricCoordinates`.
- §14.2. `Analysis/Matrix/PartialCorrelation.lean`: `TauCeti.partialCorrelationCholesky_apply_of_gt`, `TauCeti.partialCorrelationCholesky_apply_self`, `TauCeti.partialCorrelationCholesky_apply_of_lt`, `TauCeti.isLowerTriangular_partialCorrelationCholesky`, `TauCeti.partialCorrelationCholesky_diag_pos`, `TauCeti.sum_sq_partialCorrelationCholesky`, `TauCeti.partialCorrelationGram_def`, `TauCeti.posDef_partialCorrelationGram`, `TauCeti.partialCorrelationGram_apply_self`, `TauCeti.det_partialCorrelationGram`, `Matrix.partialCorrelationOfCholesky`; `MeasureTheory/Measure/SymmetricMatrix/Correlation.lean`: `TauCeti.correlationCoordinatesOfPartialCorrelation`, `TauCeti.continuous_correlationCoordinatesOfPartialCorrelation`, `TauCeti.contDiffOn_correlationCoordinatesOfPartialCorrelation`, `TauCeti.bijOn_correlationCoordinatesOfPartialCorrelation`, `TauCeti.partialCorrelationOfCorrelationCoordinates`, `TauCeti.partialCorrelationOfCorrelationCoordinates_of_mem`, `TauCeti.invOn_partialCorrelationOfCorrelationCoordinates`; `LinearAlgebra/Matrix/Cholesky/Basic.lean`: `TauCeti.cholesky`; `Probability/Distributions/LKJ/Normalizer.lean`: `TauCeti.Probability.lkjNormalizer_eq_prod_columns`, `TauCeti.Probability.lkjNormalizer_zero`, `TauCeti.Probability.lkjNormalizer_one`, `TauCeti.Probability.lkjNormalizer_two`, `TauCeti.Probability.lkjNormalizer_succ`, `TauCeti.Probability.lkjNormalizer_pos`, `TauCeti.Probability.measurable_lkjNormalizer`, `TauCeti.Probability.lkjNormalizer_eq_prod_beta_self`; `Analysis/SpecialFunctions/Beta.lean`: `ProbabilityTheory.beta_one_half_left_eq_two_rpow_mul_beta_self`.
- §14.3. `MeasureTheory/Measure/SymmetricMatrix/Correlation.lean`: `TauCeti.correlationCoordinates`, `TauCeti.correlationLebesgue`; `Probability/Distributions/LKJ/Normalizer.lean`: `TauCeti.Probability.lkjNormalizer`.
- §15.1. `Probability/Distributions/Stable/Basic.lean`: `TauCeti.Probability.stableMeasure_of_invalid`, `TauCeti.Probability.stableMeasure_of_not_valid`, `TauCeti.Probability.stableMeasure_zero_scale`, `TauCeti.Probability.isProbabilityMeasure_stableMeasure`, `TauCeti.Probability.charFun_stableMeasure`; `Probability/Distributions/Stable/Measurability.lean`: `TauCeti.Probability.measurable_stableMeasure`; `Probability/Distributions/Stable/Continuity.lean`: `TauCeti.Probability.continuous_stableMeasure`, `Continuous.stableMeasure`; `Probability/Distributions/Stable/Exponent.lean`: `TauCeti.Probability.stableCharacteristicExponent_of_ne_one_of_ne_zero`, `TauCeti.Probability.stableCharacteristicExponent_one`, `TauCeti.Probability.stableCharacteristicExponent_zero`, `TauCeti.Probability.stableCharacteristicExponent_re`, `TauCeti.Probability.stableCharacteristicExponent_neg`, `TauCeti.Probability.stableCharacteristicExponent_neg_skew`, `TauCeti.Probability.continuousAt_stableCharacteristicExponent_zero`, `TauCeti.Probability.continuous_stableCharacteristicExponent_params`, `TauCeti.Probability.stableS1Location_zero_scale`, `TauCeti.Probability.stableS1Location_of_ne_one`, `TauCeti.Probability.stableS1Location_one`, `TauCeti.Probability.stableCharacteristicExponent_add_location_eq_s1_of_ne_one`, `TauCeti.Probability.stableCharacteristicExponent_add_location_eq_s1_one`.
- §15.2. `Probability/Distributions/Stable/LevyMeasure.lean`: `TauCeti.Probability.stableLevyDensity`, `TauCeti.Probability.stableLevyDensity_of_ne_zero`, `TauCeti.Probability.stableLevyMeasure_eq_zero_of_not`, `TauCeti.Probability.stableLevyMeasure_abs_gt_pos`, `TauCeti.Probability.stableLevyMeasure_abs_gt_ne_top`, `TauCeti.Probability.stableLevyMeasure_restrict_Ioi`, `TauCeti.Probability.stableLevyMeasure_restrict_Iio`, `TauCeti.Probability.isProbabilityMeasure_cond_stableLevyMeasure`; `Probability/Distributions/Stable/Approximation/Basic.lean`: `TauCeti.Probability.stableCompensatedPoissonMeasure_def`, `TauCeti.Probability.isProbabilityMeasure_stableCompensatedPoissonMeasure`, `TauCeti.Probability.charFun_stableCompensatedPoissonMeasure`, `TauCeti.Probability.tendsto_charFun_stableCompensatedPoissonMeasure_invTwoPow`; `Probability/Distributions/Stable/CompensatedIntegral.lean`: `TauCeti.Probability.integrable_exp_sub_one_sub_sin_stableLevyMeasure`, `TauCeti.Probability.tendsto_integral_exp_sub_one_sub_sin_stableLevyMeasure`; `Probability/Distributions/Stable/LevyKhintchine.lean`: `TauCeti.Probability.integral_exp_sub_one_sub_sin_stableLevyMeasure`; `MeasureTheory/Measure/LevyConvergence.lean`: `TauCeti.exists_probabilityMeasure_of_tendsto_charFun`; `Probability/Distributions/Stable/Basic.lean`: `TauCeti.Probability.tendsto_stableCompensatedPoissonMeasure_invTwoPow`, `TauCeti.Probability.stableMeasure_two`.
- §15.3. `Probability/Distributions/Stable/Operations.lean`: `TauCeti.Probability.stableMeasure_map_affine`, `TauCeti.Probability.hasLaw_affine_stableMeasure`, `TauCeti.Probability.stableMeasure_map_neg`, `TauCeti.Probability.stableMeasure_conv_stableMeasure`, `TauCeti.Probability.stableMeasure_conv_stableMeasure_of_eq`, `TauCeti.Probability.abs_stableConvSkew_le_one`, `ProbabilityTheory.IndepFun.hasLaw_add_stableMeasure`, `TauCeti.Probability.stableMeasure_one_zero`; `Probability/Distributions/Stable/Levy.lean`: `TauCeti.Probability.stableMeasure_one_half_one`, `TauCeti.Probability.stableMeasure_one_half_neg_one`.
- §15.4. `Probability/Distributions/Stable/PDF.lean`: `TauCeti.Probability.stablePDF`, `TauCeti.Probability.stablePDFReal_eq`, `TauCeti.Probability.norm_charFun_stableMeasure`, `TauCeti.Probability.stableMeasure_eq_withDensity`, `TauCeti.Probability.stablePDFReal_nonneg`, `TauCeti.Probability.continuous_stablePDFReal`, `TauCeti.Probability.stablePDFReal_le`, `TauCeti.Probability.hasPDF_of_hasLaw_stableMeasure`, `TauCeti.Probability.pdf_eq_stablePDF_of_hasLaw_stableMeasure`, `TauCeti.Probability.rnDeriv_stableMeasure`, `TauCeti.Probability.stablePDFReal_zero_scale`; `Probability/Distributions/Stable/Smooth.lean`: `TauCeti.Probability.integrable_norm_pow_mul_norm_charFun_stableMeasure`, `TauCeti.Probability.contDiff_stablePDFReal`; `Analysis/Bochner/CharFun/Inversion.lean`: `MeasureTheory.Measure.eq_withDensity_charFunDensity`; `Probability/Distributions/Stable/Cutoff.lean`: `TauCeti.Probability.stableCompensatedPoissonMeasure_split`; `Probability/Distributions/Stable/Approximation/Support.lean`: `TauCeti.Probability.support_cond_stableLevyMeasure_one`, `TauCeti.Probability.support_cond_stableLevyMeasure_neg_one`, `TauCeti.Probability.support_cond_stableLevyMeasure_of_abs_lt_one`, `TauCeti.Probability.support_stableCompensatedPoissonMeasure_one`, `TauCeti.Probability.support_stableCompensatedPoissonMeasure_neg_one`, `TauCeti.Probability.support_stableCompensatedPoissonMeasure_of_abs_lt_one`; `Probability/Distributions/Stable/SmallJumps.lean`: `TauCeti.Probability.integral_sq_stableLevyMeasure_ball`, `TauCeti.Probability.tendsto_integral_sq_stableLevyMeasure_ball_zero`, `TauCeti.Probability.integrableOn_id_stableLevyMeasure_iff`; `Analysis/Convolution/Positivity.lean`: `MeasureTheory.convolution_pos_iff_mem_interior_add_tsupport`; `Analysis/Convolution/Basic.lean`: `MeasureTheory.convolutionExists_of_integrable_of_ae_norm_le`; `Analysis/Bochner/CharFun/Smooth.lean`: `MeasureTheory.Measure.contDiff_charFunDensity`.
- §15.5. `Probability/Distributions/Stable/Tails.lean`: `TauCeti.Probability.stableTailConstant`, `TauCeti.Probability.rpow_mul_toReal_stableLevyMeasure_Ioi`, `TauCeti.Probability.rpow_mul_toReal_stableLevyMeasure_Iio`, `TauCeti.Probability.tendsto_rpow_mul_toReal_stableLevyMeasure_Ioi`, `TauCeti.Probability.tendsto_rpow_mul_toReal_stableLevyMeasure_Iio`; `Probability/Distributions/Stable/SmallJumps.lean`: `TauCeti.Probability.integral_abs_rpow_stableLevyMeasure_ball`, `TauCeti.Probability.integrableOn_abs_rpow_stableLevyMeasure_iff`.

### From TauCetiRoadmap.OptimalTransport

§3.7, the quantile coupling on the line: the quantile of a Borel probability law on `ℝ`
(`MeasureTheory.Measure.quantile`), its measurability, its pushforward of Lebesgue measure on
`(0, 1)` to the law (`MeasureTheory.Measure.measurePreserving_quantile`) and the optimality of the
monotone quantile coupling (`MeasureTheory.Measure.isOptimalCoupling_quantileCoupling`), assumed as
stated there. §7.2 builds the upper quantile, quantile transport and the quantile constructions of
the families on it, and §7.13 the common-uniform couplings of the stochastic order.

## References

- C. C. Heyde, [*On a Property of the Lognormal Distribution*](https://doi.org/10.1111/j.2517-6161.1963.tb00521.x), Journal of the Royal Statistical Society, Series B 25(2), 392–393, 1963 (the explicit moment-indeterminacy example).
- J. P. Nolan, [*Univariate Stable Distributions: Models for Heavy Tailed Data*](https://doi.org/10.1007/978-3-030-52915-4), Springer, 2020 ([introductory chapter](https://edspace.american.edu/jpnolan/wp-content/uploads/sites/1720/2020/09/Chap1.pdf), the author's text of chapter 1, whose numbering and printed pages the locators of Layer 15 follow); [SciPy stable distributions](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.levy_stable.html) records the `S₀` and `S₁` characteristic-function conventions.
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

### Design references and related work

- Mathlib design proposals followed by the interfaces of this roadmap:
  [mathlib4#40916](https://github.com/leanprover-community/mathlib4/pull/40916) (binomial
  variance), [mathlib4#35504](https://github.com/leanprover-community/mathlib4/pull/35504)
  (exponential moments, mgf and memorylessness),
  [mathlib4#34053](https://github.com/leanprover-community/mathlib4/pull/34053) (error functions;
  only the real API is used), [mathlib4#42461](https://github.com/leanprover-community/mathlib4/pull/42461)
  (lower quantile), [mathlib4#43070](https://github.com/leanprover-community/mathlib4/pull/43070) and
  the [Bessel functions discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Bessel.20functions/with/611260325)
  on the Lean Zulip (Bessel functions),
  [mathlib4#42821](https://github.com/leanprover-community/mathlib4/pull/42821) (PMFs versus
  measures). The binomial mean and the finite uniform measures are Mathlib declarations at the pin,
  `ProbabilityTheory.integral_of_hasLaw_binomial` (`Probability/Distributions/Binomial.lean`) and
  `MeasureTheory.Measure.uniformOfFinset` (`Probability/Distributions/Uniform.lean`).
- Mathlib's undergraduate curriculum list,
  [`docs/undergrad.yaml`, lines 574–575](https://github.com/leanprover-community/mathlib4/blob/9caeba1000ef8f302920981f4a08651d325abc81/docs/undergrad.yaml#L574-L575)
  (probability generating functions, §1.12).
- *NIST Digital Library of Mathematical Functions*, [equation 8.17.20](https://dlmf.nist.gov/8.17.E20)
  (the recurrence of the incomplete Beta function in §2.2).
- [SampCert](https://github.com/leanprover/SampCert) (Apache 2.0), with its
  [`SLang`](https://github.com/leanprover/SampCert/blob/main/SampCert/SLang.lean) language: verified
  samplers for integer Laplace and Gaussian laws (related work for §9.8).
- [statlib](https://github.com/stat-lib/statlib): frequentist inference in Lean (outside this
  roadmap).
