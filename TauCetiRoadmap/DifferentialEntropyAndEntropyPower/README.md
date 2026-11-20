# Roadmap: differential entropy and the entropy power inequality

**Summary.** The differential entropy of a random vector `X` in `ℝ^d` with density `p` is
`h(X) = −∫ p log p`, the continuous analogue of Shannon's entropy. Unlike the discrete entropy it
can be negative, it changes under scaling (`h(aX) = h(X) + d log |a|`), and it can be `−∞` or
`+∞`. This roadmap develops it as `−D(law of X ‖ Lebesgue)`, with value `−∞` for a law without a
density, together with the Fisher information `J(p) = ∫ ‖∇p‖²/p` of a smooth positive density
and the heat flow `X + √t Z`, `Z` standard Gaussian and independent of `X`, that connects the
two. Statements are about probability measures on `ℝ^d`; most assume a finite second moment,
which keeps the entropy below `+∞`.

The headline theorems are these.

- *Gaussian maximum entropy.* If `X` has a finite second moment and a positive definite
  covariance matrix `Σ`, then `h(X) ≤ (1/2) log((2πe)^d det Σ)`, with equality exactly when `X`
  is Gaussian with the mean and covariance of `X`. The gap is the Kullback–Leibler divergence
  from that Gaussian.
- *De Bruijn's identity.* If `X` has a finite second moment, then for every `t > 0` the map
  `t ↦ h(X + √t Z)` is differentiable with derivative `J(X + √t Z)/2`, half the Fisher
  information of the smoothed law.
- *Stam's inequality.* For independent `X`, `Y` and `s, u > 0`, the smoothed variables
  `X_s = X + √s Z₁` and `Y_u = Y + √u Z₂` satisfy
  `1/J(X_s + Y_u) ≥ 1/J(X_s) + 1/J(Y_u)`; no moment is assumed.
- *The entropy power inequality.* For `d ≥ 1` and independent `X`, `Y` with finite second moments,
  `N(X + Y) ≥ N(X) + N(Y)`, where `N(X) = exp(2h(X)/d)/(2πe)` is the entropy power, taken to be
  `0` when `h(X) = −∞`.

The roadmap builds on three neighbours. Tau Ceti's signed Boltzmann entropy relative to a
reference measure, the formalization behind OptimalTransport's entropy functional, is the
negative of the differential entropy when the reference is Lebesgue measure, and its change of
reference to a Gibbs measure gives the comparison with Gaussians. DenoisingDiffusion supplies the
density of a law convolved with a Gaussian, its score, and the bound `d/t` on the Fisher
information of `X + √t Z`. ScoreBasedDiffusion supplies the heat equation satisfied by that
density. MathematicalStatisticsFoundations has the Fisher information of a parametric family,
a different object from the location Fisher information here.

Layer 1 below defines the differential entropy, proves its behaviour under affine maps, compares
it with Gaussians and shows that adding an independent variable does not decrease it. Layer 2
defines the Fisher information of a density, proves de Bruijn's identity and the behaviour of the
entropy along the heat flow as `t → 0` and `t → ∞`. Layer 3 proves Stam's Fisher information
inequality for smoothed laws. Layer 4 integrates it along the heat flow to obtain the entropy power
inequality.

## Conventions

- **Space.** `d : ℕ` and `E = EuclideanSpace ℝ (Fin d)`, with its Borel σ-algebra and Lebesgue
  measure `volume`. Laws are probability measures on `E`. A law `μ` has a *finite second moment*
  when `x ↦ ‖x‖²` is `μ`-integrable. Logarithms are natural.
- **Independent sums.** The law of `X + Y` for independent `X`, `Y` of laws `μ`, `ν` is the
  convolution `μ ∗ ν` (Mathlib's `Measure.conv`); Mathlib's
  `ProbabilityTheory.IndepFun.map_add_eq_map_conv_map` identifies the two. Statements are made for
  convolutions of laws, so no probability space is needed.
- **Gaussians.** `N(m, S) = multivariateGaussian m S` for `m : E` and a matrix `S`; it has a
  density exactly when `S` is positive definite. The heat flow of `μ` at time `t ≥ 0` is
  `μ ∗ N(0, t • 1)`, the law of `X + √t Z`.
- **Differential entropy.** `differentialEntropy μ = −Ent(μ)`, with `Ent` Tau Ceti's
  `TauCeti.boltzmannEntropy volume`, an extended real (`EReal`). Thus `h(μ) = −∞` when `μ` has no
  density; when `μ` has a density `p` and `p log p` is integrable, `h(μ) = −∫ p log p`; when the
  positive part of `p log p` has a finite integral and its negative part an infinite one,
  `h(μ) = +∞`. This is Polyanskiy–Wu's convention `h = −D(μ ‖ Lebesgue)` (Definition 2.6, p. 27).
  When both parts are infinite the source leaves `h` undefined and the value here is `−∞`; for a
  law with a finite second moment that case does not occur (1.1).
- **Covariance.** The covariance matrix of `μ` is Tau Ceti's `TauCeti.covMatrix μ`, the matrix of
  `cov[x ↦ x i, x ↦ x j; μ]`, Mathlib's `covariance` of two coordinates; the mean is `∫ x ∂μ`.
- **Smoothed densities.** `smoothedDensity μ c s y = ∫ φ_{s²}(y − c • x) dμ(x)`, with `φ_v` the
  density of `N(0, v • 1)` given by Tau Ceti's `multivariateGaussianPDFReal`. This is the
  definition of DenoisingDiffusion 3.1, copied with the same body. Only `c = 1` occurs here: for
  `t > 0`, `smoothedDensity μ 1 √t` is a density of `μ ∗ N(0, t • 1)`, positive and smooth.
- **Fisher information.** For a function `p : E → ℝ`,
  `fisherInformation p = ∫⁻ ‖∇p(y)‖²/p(y) dy` in `[0, ∞]`, with Mathlib's `gradient`. It is
  meant for positive differentiable densities, and every statement applies it to a smoothed
  density. On other functions the junk values of `gradient` and of division make it meaningless:
  the indicator of `[0, 1]` gets the value `0`, although the uniform law on `[0, 1]` has infinite
  Fisher information in the sense of absolutely continuous densities.
- **Entropy power.** For `d ≥ 1`, `entropyPower μ = exp(2h(μ)/d)/(2πe)` in `[0, ∞]`, through
  Mathlib's `EReal.exp`, so a law with `h(μ) = −∞` has entropy power `0`. For `d = 0` the formula
  gives `1/(2πe)` and the entropy power inequality fails (Check of 4.2), so the statements that
  use it assume `0 < d`.
- **Divergence.** The Kullback–Leibler divergence is Mathlib's `InformationTheory.klDiv`, valued
  in `[0, ∞]`. Identities between it and the entropy are stated in `EReal`, where `r − ⊥ = ⊤` for
  real `r`.
- **Finite second moments and `+∞`.** If `μ` has a finite second moment, then `h(μ) < +∞`: this is
  Tau Ceti's `TauCeti.boltzmannEntropy_ne_bot_of_integrable_exp` with `f(x) = −‖x‖²`, the bound of
  Rioul's Proposition 1 (p. 5), and it is consumed, not restated.

## Layer 1: differential entropy and the Gaussian maximum

### 1.1 Differential entropy

Define `differentialEntropy μ = −TauCeti.boltzmannEntropy volume μ` (Polyanskiy–Wu,
Definition 2.6 and (2.16), p. 27; Rioul, (1), p. 4, with the extension by `−∞` on p. 5).

- *Explicit formula.* If `μ = volume.withDensity p` for a measurable `p ≥ 0` with
  `p log p` integrable, then `h(μ) = −∫ p log p`, by
  `TauCeti.boltzmannEntropy_withDensity` and `TauCeti.boltzmannEntropy_of_integrable`.
- *No density.* If `μ` is not absolutely continuous with respect to `volume`, `h(μ) = −∞`, by
  `TauCeti.boltzmannEntropy_of_not_absolutelyContinuous`.
- *Upper bound.* For `μ` with a finite second moment, `h(μ) ≠ +∞` (Conventions).
- *Well defined.* If `μ = volume.withDensity p` has a finite second moment, the negative part of
  `p log p` has a finite integral, so `h(μ)` is either `−∞` or `−∫ p log p` and never the
  undefined case of the source. This is stated by OptimalTransport 11.2 (the moment bound makes
  the negative part of `ρ log ρ` integrable) and is consumed, not restated (Rioul, Proposition 1
  and its proof, p. 5, which compares `p` with a Cauchy density; with a finite second moment a
  Gaussian density serves).

**Checks.**
- The uniform law on `[0, 2]` (`d = 1`) has `h = log 2`; Tau Ceti's entropy of that law is
  `−log 2`, as OptimalTransport 11.2 computes. A definition without the minus sign gives `−log 2`.
- A Dirac mass has `h = −∞`, and so does the law `(δ₋₁ + δ₁)/2`; both have entropy power `0`.
- For `d = 0`, `E` is a point, `volume` is the Dirac mass there, the only law is `volume`, and
  `h = 0`.

The four items above are consequences of the library and of OptimalTransport 11.2, not separate
targets.

*Needs:* Tau Ceti `TauCeti.boltzmannEntropy`, `TauCeti.boltzmannEntropy_withDensity`,
`TauCeti.boltzmannEntropy_of_integrable`, `TauCeti.boltzmannEntropy_of_not_absolutelyContinuous`;
OptimalTransport 11.2.

### 1.2 Affine changes of variables

Prove `differentialEntropy_map_affine`: for every law `μ`, every invertible linear map `A` of `E`
and every `b : E`, the image of `μ` under `x ↦ A x + b` has differential entropy
`h(μ) + log |det A|`, in `EReal` (so `±∞` are kept). In particular `h` is translation invariant,
and the image under `x ↦ a • x`, `a ≠ 0`, has entropy `h(μ) + d log |a|` (Polyanskiy–Wu,
Theorem 2.7 (b), p. 27, stated there for finite entropies; Rioul, (5), p. 6). For `d ≥ 1` the entropy power of the image under `x ↦ a • x` is
`a² N(μ)`.

Route: the image of `volume.withDensity p` is `volume.withDensity (|det A|⁻¹ p ∘ A⁻¹(· − b))`, by
Tau Ceti's `MeasureTheory.Measure.map_affine_withDensity`; after the substitution the positive and
negative parts of `q log q`, `q` the new density, differ from those of `p log p` by at most
`|log |det A|| p`, so each is finite exactly when the old one is, and a law without a density is
carried to one without a density. For an absolutely continuous `μ` and a symmetric positive
definite `A`, the map `x ↦ A x + b` is the gradient of a convex quadratic and the formula is a case
of Tau Ceti's `TauCeti.internalEnergy_map_gradient` with `U(r) = r log r`; the general invertible
`A` and the laws without density are the target here. (Proved here.)

**Checks.**
- The Laplace law `e^(−|x|)/2` has `h = 1 + log 2 = 1.6931`; its image under `x ↦ 2x` has
  `h = 2.3863` and under `x ↦ −2x` the same value, matching `1.6931 + log 2`; a rule with
  `log a` in place of `log |a|` has no real value at `a = −2`.
- `d = 2`, `A = diag(2, 3)`: the standard Gaussian has `h = log(2πe) = 2.8379` and its image
  `N(0, diag(4, 9))` has `h = 2.8379 + log 6 = 4.6297`.

*Needs:* 1.1; Tau Ceti `MeasureTheory.Measure.map_affine_withDensity`; Mathlib
`MeasureTheory.Measure.withDensity`.

### 1.3 Comparison with a Gaussian and the Gaussian maximum

Let `μ` be a law with a finite second moment.

- *Divergence from a Gaussian* (`klDiv_multivariateGaussian`). For every `m : E` and every
  positive definite `S`,

      klDiv μ N(m, S) = (1/2) log((2π)^d det S) + (1/2) ∫ ⟪x − m, S⁻¹ (x − m)⟫ dμ(x) − h(μ)

  in `EReal`; both sides are `+∞` exactly when `h(μ) = −∞`. (Polyanskiy–Wu, the display in the
  proof of Theorem 2.8, p. 28.) The isotropic case `S = s • 1` is the change-of-reference
  identity of OptimalTransport 11.2 for a probability measure, with Lebesgue reference,
  `a = 1/(2s)` and `x₀ = m`; the target here is the case of a general positive definite `S`.
- *The Gaussian maximum* (`differentialEntropy_le_of_covMatrix`). If the covariance matrix
  `Σ` of `μ` is positive definite, then `h(μ) ≤ (1/2) log((2πe)^d det Σ)`, with equality if and
  only if `μ = N(∫ x dμ, Σ)` (Polyanskiy–Wu, Theorem 2.8, (2.19), p. 28; Rioul, (6) and (7),
  p. 6). Taking `m` the mean and `S = Σ` in the first item, the quadratic term is `d/2`, so the gap
  is `klDiv μ N(∫ x dμ, Σ)`, and `klDiv` vanishes only between equal laws.
- *Consequences.* `h(N(m, S)) = (1/2) log((2πe)^d det S)` for positive definite `S`
  (Polyanskiy–Wu, (2.18), p. 27), so `N(N(m, S)) = (det S)^(1/d)` for `d ≥ 1`; and if
  `∫ ‖x‖² dμ ≤ a` with `a > 0` and `d ≥ 1`, then `h(μ) ≤ (d/2) log(2πe a/d)` (Polyanskiy–Wu,
  (2.20), p. 28), from the first item with `S = (a/d) • 1`.

Route: by Tau Ceti's `TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`N(m, S) = volume.tilted f` with `f(x) = −⟪x − m, S⁻¹ (x − m)⟫/2`, whose normalizing constant is
`∫ exp f = ((2π)^d det S)^(1/2)`. Tau Ceti's `TauCeti.klDiv_tilted_eq_boltzmannEntropy`, for the
probability measure `μ`, against which `f` is integrable by the second moment, gives the first
item. The second follows with Mathlib's `InformationTheory.klDiv_eq_zero_iff` and the trace
identity `∫ ⟪x − m, Σ⁻¹(x − m)⟫ dμ = d` for the mean `m`. (Proved here, following the cited
proof.)

**Checks.**
- `d = 1`, Laplace law (variance `2`, `h = 1.6931`): the bound is `(1/2) log(4πe) = 1.7655`, and
  the divergence from `N(0, 2)` is `0.0724`. Against `N(−1, 3)` the identity gives
  `−1.6931 + (1/2) log(6π) + (2 + 1)/6 = 0.2751`, which agrees with direct integration.
- Uniform law on `[0, 1]`: `h = 0 < (1/2) log(2πe/12) = 0.1765`.
- `d = 2`, `S = [[2, 0.6], [0.6, 1]]`: `h(N(0, S)) = (1/2) log((2πe)² · 1.64) = 3.0852`.
- The positive definiteness of `Σ` is needed for the equality clause: for `μ = δ₀` and `d = 1`,
  `Σ = 0`, `N(0, 0) = δ₀ = μ`, but `h(μ) = −∞` while `(1/2) log(2πe · 0)` is the junk value
  `(1/2) log 0 = 0` of Lean's logarithm, so the equality case would fail.
- With the factor `2πe` replaced by `2π` in the bound, the Gaussian `N(0, 1)` would violate it:
  `1.4189 > 0.9189`.

*Needs:* 1.1; Tau Ceti `TauCeti.klDiv_tilted_eq_boltzmannEntropy`,
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.multivariateGaussianPDFReal`; Mathlib `multivariateGaussian`,
`MeasureTheory.Measure.tilted`, `InformationTheory.klDiv_eq_zero_iff`,
`ProbabilityTheory.covariance`; Tau Ceti `TauCeti.covMatrix`.

### 1.4 Adding an independent variable does not decrease the entropy

Prove `differentialEntropy_le_conv`: for laws `μ`, `ν` with finite second moments,
`max(h(μ), h(ν)) ≤ h(μ ∗ ν)` (Madiman–Melbourne–Xu, Theorem 2.1 and its proof for `p = 1`, p. 7;
it follows from Polyanskiy–Wu, Theorem 2.7 (b) and (c), p. 27, as `h(X + Y) ≥ h(X + Y | Y) = h(X)`).

Route, for `h(μ) ≤ h(μ ∗ ν)`: if `h(μ) = −∞` there is nothing to prove. Otherwise
`μ = volume.withDensity p`, and the
joint law of `(X + Y, Y)` is `(volume.withDensity (p ∘ (· − y)))` integrated against `ν`, by
`IndepFun.map_add_eq_map_conv_map` applied to the pair. The divergence of the joint law from the
product of its marginals is nonnegative and equals `h(μ ∗ ν) − h(μ)`, by translation invariance
(1.2) and the chain rule `InformationTheory.klDiv_compProd_eq_add`; both entropies are below `+∞`
by the second moments. The bound by `h(ν)` is the same with `μ` and `ν` exchanged, since
`μ ∗ ν = ν ∗ μ`. (Proved here, following the cited proof.)

**Checks.**
- Uniform laws on `[0, 1]`: the sum has the triangular law on `[0, 2]`, with `h = 1/2 > 0`.
- `μ = δ_a`: `μ ∗ ν` is the translate of `ν`, and `h(μ ∗ ν) = h(ν) ≥ −∞ = h(μ)`.

*Needs:* 1.1, 1.2; Mathlib `ProbabilityTheory.IndepFun.map_add_eq_map_conv_map`,
`InformationTheory.klDiv_compProd_eq_add`.

### Examples

Gaussian laws, for which every quantity is explicit; the uniform and Laplace laws on the line;
point masses and finite mixtures of them, the basic laws with entropy `−∞`.

### Dependencies

1.1 uses only Tau Ceti's Boltzmann entropy and OptimalTransport 11.2. 1.2 and 1.3 use 1.1; 1.4
uses 1.1 and 1.2. Tau Ceti supplies the Gaussian density, the image of a density under an affine
map, the change of reference to a Gibbs measure and the covariance matrix; Mathlib supplies Gaussian laws, tilted
measures, covariance, convolution and the chain rule for the divergence.

## Layer 2: Fisher information and the heat flow

### 2.1 Fisher information of smoothed laws

Define `smoothedDensity` as in DenoisingDiffusion 3.1 and
`fisherInformation p = ∫⁻ y, ENNReal.ofReal (‖∇p y‖²/p y)`. For a law `μ` and `t > 0` write
`p_t = smoothedDensity μ 1 √t`, a positive smooth density of `μ ∗ N(0, t • 1)` (DenoisingDiffusion
3.1 with `c = 1`, `s = √t`, together with `IndepFun.map_add_eq_map_conv_map`). The three facts
below are lemmas of the routes of 2.2, 3.2 and 4.1, recorded here and not separate targets:

- *Score form.* `fisherInformation p_t = ∫⁻ ‖∇ log p_t‖² d(μ ∗ N(0, t • 1))`, the second moment
  of the score `noisyScore μ 1 √t` of DenoisingDiffusion 3.1, since `p_t > 0` and
  `∇ log p_t = ∇p_t / p_t`. By DenoisingDiffusion 3.3 it is at most `d/t`, in particular finite;
  that bound is consumed, not restated (Rioul, (13), p. 8, for the identity of the two forms).
- *Gaussian value.* For `μ = N(m, S)`, `S` positive semidefinite, `p_t` is the density of
  `N(m, S + t • 1)` and `fisherInformation p_t = trace (S + t • 1)⁻¹`; for `μ = δ_m` it is `d/t`,
  so the bound of DenoisingDiffusion 3.3 is attained (Rioul, (16), p. 8, with
  `J(X*) = tr Cov(X)⁻¹`).
- *Scaling.* For `a ≠ 0`, let `μ_a` be the image of `μ` under `x ↦ a • x`. Then
  `fisherInformation (smoothedDensity μ_a 1 (|a| √t)) = a⁻² fisherInformation p_t` (Rioul, (14),
  p. 8).

Route: the score form is a pointwise identity. The Gaussian value is a Gaussian integral, using
`multivariateGaussian_conv_multivariateGaussian`. For the scaling, the smoothed density of
`μ_a` at variance `a² t` is `|a|^(−d) p_t(y/a)`, by a change of variables in the defining
integral.

**Checks.**
- `d = 1`, `μ = N(0, 1)`, `t = 1`: `p_1` is the density of `N(0, 2)` and the Fisher information
  is `1/2`; numerically `0.5000`.
- `d = 1`, `μ = (δ₋₁ + δ₁)/2`: at `t = 1/4` the Fisher information is `2.9024 < 4 = 1/t`, and at
  `t = 1` it is `0.5504 < 1`.
- The Fisher information of the smoothed law, not of `μ`, is what is defined: for the uniform law
  on `[0, 1]` the junk value on its density is `0` (Conventions), while at `t = 2` the smoothed
  law has Fisher information `0.4800`.

*Needs:* DenoisingDiffusion 3.1 (`smoothedDensity`, `hasLaw_smoothedDensity`, `noisyScore`) and
3.3 (`memLp_noisyScore`); Tau Ceti
`TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`; Mathlib `gradient`,
`ProbabilityTheory.IndepFun.map_add_eq_map_conv_map`.

### 2.2 De Bruijn's identity

Prove `hasDerivAt_differentialEntropy_conv`: for a law `μ` with a finite second moment and
`t > 0`, the real function `u ↦ h(μ ∗ N(0, u • 1))` (an `EReal` read through `EReal.toReal`)
has derivative `fisherInformation p_t / 2` at `t` (Rioul, (41b), p. 15, for a white Gaussian
perturbation, with the differentiability at every `t > 0` for square-integrable `X` credited
there to Barron in the proof of Lemma 4, p. 22; Madiman–Barron, Lemma 3, p. 5, for the
integrated form when `d = 1`). Barron's justification of the exchange of derivative and integral is
one-dimensional; the route below writes it out for every `d`.

For `u > 0` both `h(μ ∗ N(0, u • 1))` and the Fisher information are finite: the entropy is
below `+∞` by the second moment and at least `h(N(0, u • 1)) > −∞` by 1.4, and the Fisher
information is at most `d/u` by 2.1. So the reading through `EReal.toReal` loses nothing near `t`.

Route: `h(μ ∗ N(0, u • 1)) = −∫ p_u log p_u`. By ScoreBasedDiffusion 1.2 (the noise
derivative, at signal level `1`) `∂_u p_u = (1/2) Δ p_u` at every point. Differentiate under the
integral, `−∫ ∂_u p_u (1 + log p_u)`, with a domination from the Gaussian bounds on the
derivatives of the heat kernel (`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`)
and the lower bound `log p_u(y) ≥ −C − ‖y‖²/u` that the second moment gives through Jensen's
inequality. Then `∫ Δ p_u = 0` and an integration by parts,
`−∫ Δ p_u log p_u = ∫ ‖∇p_u‖²/p_u`, with Mathlib's
`integral_bilinear_hasFDerivAt_right_eq_neg_left_of_integrable` along each coordinate.
(Proved here, following the cited sources.)

**Checks.**
- `μ = δ₀`: `h(N(0, u • 1)) = (d/2) log(2πe u)` has derivative `d/(2u)`, and the Fisher
  information is `d/u`.
- `d = 1`, `μ = (δ₋₁ + δ₁)/2`: at `t = 0.1, 0.5, 2` the centred difference quotients of the
  entropy are `4.8794, 0.5380, 0.1688`, and half the Fisher information is
  `4.8794, 0.5380, 0.1688`. The law has entropy `−∞`, the smoothed laws a finite one.
- `d = 1`, uniform law on `[0, 1]`: at `t = 0.1, 0.5, 2` both sides are `2.7696, 0.8572, 0.2400`.
- Normalization: with the density of `X + t Z` (variance `t²`) in place of `X + √t Z` the
  derivative would be `t` times the Fisher information of the law at variance `t²`: at `t = 1/2`
  for the two-point law that is `(1/2) · 2.9024 = 1.4512` instead of `0.5380`.

*Needs:* 1.1, 1.4, 2.1; ScoreBasedDiffusion 1.2 (noise derivative); Tau Ceti
`TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`; Mathlib
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`integral_bilinear_hasFDerivAt_right_eq_neg_left_of_integrable`, `Laplacian.laplacian`.

### 2.3 The ends of the heat flow

Let `μ` have a finite second moment and write `h_t = h(μ ∗ N(0, t • 1))`.

- *Small times.* `h_t → h(μ)` in `EReal` as `t → 0⁺`, including when `h(μ) = −∞` (Rioul,
  Lemma 3, (52) and its proof, p. 22, for finite entropies; Polyanskiy–Wu, proof of
  Theorem 3.16, p. 64, for the continuity).
- *Large times.* `h_t − (d/2) log(2πe t) → 0` as `t → ∞`; for `d = 0` both terms are `0` (Rioul,
  §II-E1, p. 19, where this limit closes the basic proof).

Both are stated, as `tendsto_differentialEntropy_conv_nhdsGT_zero` and
`tendsto_differentialEntropy_conv_sub_atTop`.

Route. For small times, `h_t ≥ h(μ)` by 1.4. In the other direction, `X + √t Z → X` almost surely,
so the laws converge weakly; by 1.3 with the reference `N(m, 1)`, `m` the mean of `μ`,
`h_t = (d/2) log 2π + (1/2)(∫ ‖x − m‖² dμ + t d) − klDiv (μ ∗ N(0, t • 1)) N(m, 1)`, and the
lower semicontinuity of the divergence (`TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure`)
gives `limsup h_t ≤ h(μ)`. For large times, `h_t ≥ h(N(0, t • 1)) = (d/2) log(2πe t)` by 1.4,
and by 1.3 applied to `μ ∗ N(0, t • 1)`, whose covariance is `Σ + t • 1`, positive definite for
`t > 0` because `Σ` is positive semidefinite (`TauCeti.posSemidef_covMatrix`),
`h_t ≤ (1/2) log((2πe)^d det(Σ + t • 1))`, which exceeds `(d/2) log(2πe t)` by
`(1/2) log det(1 + Σ/t) → 0`. (Proved here, following the cited sources.)

**Checks.**
- Uniform law on `[0, 1]`: `h_t = 0.1806` at `t = 0.01` and `0.0571` at `t = 0.001`, tending to
  `0`; and `h_t − (1/2) log(2πe t) = 0.0041` at `t = 10`, tending to `0` from above.
- `μ = (δ₋₁ + δ₁)/2`, `d = 1`: `h_t = −0.1905` at `t = 0.01` and `−1.3418` at `t = 0.001`, equal to
  `(1/2) log(2πe t) + log 2` to four places, and tending to `−∞ = h(μ)`.

*Needs:* 1.3, 1.4; Tau Ceti `TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure`,
`TauCeti.posSemidef_covMatrix`.

### Examples

The two-point law `(δ₋₁ + δ₁)/2` on the line, whose smoothed density is
`(φ_t(y − 1) + φ_t(y + 1))/2` and whose entropy along the heat flow rises from `−∞`; Gaussian
laws, for which `h_t = (1/2) log((2πe)^d det(S + t • 1))` and the derivative
`(1/2) trace (S + t • 1)⁻¹` is half the Fisher information.

### Dependencies

2.1 uses DenoisingDiffusion 3.1 and 3.3 and Tau Ceti's Gaussian convolution law. 2.2 uses 1.1,
1.4, 2.1, ScoreBasedDiffusion 1.2 and Tau Ceti's heat-kernel bounds. 2.3 uses 1.3, 1.4, and from Tau Ceti
the lower semicontinuity of the divergence and the positive semidefiniteness of covariance
matrices.

## Layer 3: Stam's Fisher information inequality

Throughout, `μ`, `ν` are laws, `s, u > 0`, and `p = smoothedDensity μ 1 √s`,
`q = smoothedDensity ν 1 √u`, `r = smoothedDensity (μ ∗ ν) 1 √(s + u)`. Since
`(μ ∗ N(0, s • 1)) ∗ (ν ∗ N(0, u • 1)) = (μ ∗ ν) ∗ N(0, (s + u) • 1)`, by
`multivariateGaussian_conv_multivariateGaussian`, `r` is the density of the sum of independent
variables `Y₁`, `Y₂` with densities `p`, `q`. No moment of `μ` or `ν` is assumed.

### 3.1 The score of a sum

This is the step on which 3.2 rests, recorded here as a lemma of its route and not as a separate
target: for every `λ ∈ [0, 1]`, almost surely,
`∇ log r (Y₁ + Y₂) = E[λ ∇ log p (Y₁) + (1 − λ) ∇ log q (Y₂) | Y₁ + Y₂]` (Madiman–Barron, Lemma 1,
p. 3, for `λ = 1`, `d = 1` and an absolutely continuous density; Rioul, (32), p. 12, credited to Blachman).
In the language of laws: for every bounded measurable `g : E → E`,
`∫ ⟪g(y₁ + y₂), ∇ log r(y₁ + y₂)⟫ p(y₁) q(y₂) d(y₁, y₂)` equals the same integral with
`λ ∇ log p(y₁) + (1 − λ) ∇ log q(y₂)` in place of `∇ log r(y₁ + y₂)`.

Route: `r = p ⋆ q`, and `∇ r = (∇p) ⋆ q = p ⋆ (∇q)`, by differentiation under the integral,
dominated because `∇p` and `∇q` are bounded (DenoisingDiffusion 3.1 computes them under the
integral, and every derivative of the Gaussian density is bounded); take the convex combination
and divide by `r`. (Following the cited proof.)

**Checks.**
- Gaussian laws `μ = δ₀`, `ν = δ₀`: `∇ log r(y) = −y/(s + u)`, and
  `E[−λ Y₁/s − (1 − λ) Y₂/u | Y₁ + Y₂ = y] = −y (λ/(s + u) + (1 − λ)/(s + u))`, using
  `E[Y₁ | Y₁ + Y₂ = y] = s y/(s + u)`.

*Needs:* 2.1, DenoisingDiffusion 3.1; Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`,
`condExp`.

### 3.2 The weighted inequality

Prove `fisherInformation_conv_le`: for every `λ ∈ [0, 1]`,
`fisherInformation r ≤ λ² fisherInformation p + (1 − λ)² fisherInformation q` (Rioul,
Proposition 3, (17c), p. 8, and §II-C2, p. 12–13).

Route: by 3.1 and the `L²` contraction of the conditional expectation
(`MeasureTheory.eLpNorm_condExp_le_eLpNorm`), `fisherInformation r` is at most the second moment of
`λ ∇ log p (Y₁) + (1 − λ) ∇ log q (Y₂)`. Expanding, the cross term vanishes because the scores
have mean `0` (`∫ ∇p = 0`, a consequence of the bounds of 2.1) and `Y₁`, `Y₂` are independent.
(Proved here, following the cited proof.)

**Checks.**
- `d = 1`, `μ = (δ₋₁ + δ₁)/2`, `ν` uniform on `[0, 1]`, `s = 0.1`, `u = 0.2`: the Fisher
  informations are `9.7589` (for `p`), `3.5371` (for `q`) and `1.5173` (for `r`); the right side is
  `3.5371, 2.6115, 3.3240, 9.7589` at `λ = 0, 0.3, 0.5, 1`.
- `λ = 0` gives `J(Y₁ + Y₂) ≤ J(Y₂)`: adding an independent variable does not increase the Fisher
  information.

*Needs:* 3.1; Mathlib `MeasureTheory.eLpNorm_condExp_le_eLpNorm`, `ProbabilityTheory.IndepFun`.

### 3.3 Stam's inequality

Prove `inv_fisherInformation_add_le`: `(fisherInformation p)⁻¹ + (fisherInformation q)⁻¹ ≤
(fisherInformation r)⁻¹` in `[0, ∞]` (Rioul, Proposition 3, (17a), p. 8, attributed there to
Stam).

Route: the Fisher informations are finite by 2.1, and positive for `d ≥ 1`, since a positive
integrable function on `E` has a nonzero gradient somewhere on a set of positive measure. Take
`λ = J(q)/(J(p) + J(q))` in 3.2. For `d = 0` every Fisher information is `0` and both sides are
`∞`. (Proved here.)

**Checks.**
- `μ = ν = δ₀`, `d = 1`: `1/J = s`, `u` and `s + u`, with equality.
- In the example of 3.2, `1/J(r) = 0.6591 ≥ 0.1025 + 0.2827 = 0.3852`; for `s = u = 1` the two
  sides are `3.0494` and `2.9002`.

*Needs:* 2.1, 3.2.

### Examples

Gaussian laws `μ = N(0, S₁)`, `ν = N(0, S₂)`: `J(r) = trace (S₁ + S₂ + (s + u) • 1)⁻¹`, and for
`S₁ = S₂ = 0` Stam's inequality is an equality.

### Dependencies

3.1 uses 2.1 and DenoisingDiffusion 3.1; 3.2 uses 3.1; 3.3 uses 2.1 and 3.2. Mathlib supplies
differentiation under the integral and the conditional expectation; Tau Ceti supplies the Gaussian convolution law.

## Layer 4: the entropy power inequality

### 4.1 Entropy power and Lieb's form

Define `entropyPower μ = EReal.exp ((2/d) h(μ)) / (2πe)` (Polyanskiy–Wu, §3.8, p. 64; Rioul, (4),
p. 6). For laws `μ`, `ν` with finite second moments and `λ ∈ [0, 1]`, let `μ'` and `ν'` be the
images of `μ` under `x ↦ √λ • x` and of `ν` under `x ↦ √(1 − λ) • x`. Prove
`le_differentialEntropy_conv_map_sqrt`:

    h(μ' ∗ ν') ≥ λ h(μ) + (1 − λ) h(ν)

in `EReal` (Rioul, Proposition 2, (8c), p. 6, attributed there to Lieb; Madiman–Melbourne–Xu,
Theorem 2.5, (12), p. 8; Polyanskiy–Wu, (3.36), p. 64).

Route (Stam's, as in Rioul §II-E1, p. 19). If `λ ∈ {0, 1}` the two sides are equal. If `h(μ)` or
`h(ν)` is `−∞` the right side is `−∞`. Otherwise put
`f(t) = h_t(μ' ∗ ν') − λ h_t(μ) − (1 − λ) h_t(ν)` for `t > 0`, with `h_t` as in 2.3. By 2.2,
`f′(t)` is half of `J(r_t) − λ J(p_t) − (1 − λ) J(q_t)`, with `r_t`, `p_t`, `q_t` the smoothed
densities of `μ' ∗ ν'`, `μ`, `ν` at time `t`. Apply 3.2 to `μ'`, `ν'` at times `λ t` and
`(1 − λ) t`, whose sum is `t`, with weight `λ`: by the scaling of 2.1,
`J(r_t) ≤ λ² J(p_t)/λ + (1 − λ)² J(q_t)/(1 − λ)`. So `f` is nonincreasing on `(0, ∞)`. By 2.3
(large times, with `μ' ∗ ν'`, `μ`, `ν`) `f(t) → 0` as `t → ∞`, and by 2.3 (small times)
`f(t)` tends to `h(μ' ∗ ν') − λ h(μ) − (1 − λ) h(ν)` as `t → 0⁺`; hence that difference is at
least `0`. (Proved here, following the cited proof.)

**Checks.**
- Uniform laws on `[0, 1]` with `λ = 1/2`: `h((X + Y)/√2) = 1/2 − (1/2) log 2 = 0.1534 ≥ 0`.
- Gaussian laws `N(0, S)` and `N(0, S)`: `μ' ∗ ν' = N(0, S)` and both sides are equal.

*Needs:* 2.1, 2.2, 2.3, 3.2.

### 4.2 The entropy power inequality

Prove `entropyPower_add_le`: for `d ≥ 1` and laws `μ`, `ν` with finite second moments,
`entropyPower μ + entropyPower ν ≤ entropyPower (μ ∗ ν)` (Polyanskiy–Wu, Theorem 3.16, p. 64;
Madiman–Melbourne–Xu, Theorem 2.5, (11), p. 8; Rioul, Proposition 2, (8a), p. 6).

Route: if `h(μ) = −∞`, then `N(μ) = 0` and the claim is `N(ν) ≤ N(μ ∗ ν)`, which is 1.4;
likewise if `h(ν) = −∞`. Otherwise both entropies are finite, and
`λ = N(μ)/(N(μ) + N(ν)) ∈ (0, 1)`. Apply 4.1 to the images of `μ` and `ν` under
`x ↦ λ^(−1/2) • x` and `x ↦ (1 − λ)^(−1/2) • x`, whose rescaled convolution is `μ ∗ ν`; by 1.2 their
entropy powers are `N(μ) + N(ν)` each, and exponentiating 4.1 gives the claim (Rioul, proof of
Proposition 2, p. 7; Madiman–Melbourne–Xu, proof of Theorem 2.5, p. 9). (Proved here, following
the cited proofs.)

**Checks.**
- Uniform laws on `[0, 1]`: `N = 1/(2πe) = 0.0585` each, and the triangular sum has
  `N = e/(2πe) = 1/(2π) = 0.1592 ≥ 0.1171`.
- Laplace and uniform laws on the line: `h(μ ∗ ν) = 1.7274`, `N(μ ∗ ν) = 1.8531 ≥ 1.7891`.
- `d = 2`, `N(0, diag(1, 2))` and `N(0, diag(2, 1))`: `N` is `(det)^(1/2)`, and
  `3 ≥ √2 + √2 = 2.8284`; with `N(0, diag(2, 4))` in place of the second law the two sides are
  equal, `√18 = 4.2426`.
- `0 < d` is needed: for `d = 0` every law is the point mass, `h = 0`, and the inequality would
  read `2/(2πe) ≤ 1/(2πe)`.
- `δ₀` and any `ν`: `0 + N(ν) ≤ N(ν)`, with equality.

*Needs:* 1.2, 1.4, 4.1.

### Examples

Gaussian laws with proportional covariance matrices, for which `N` is additive; the uniform law on
the cube `[0, 1]^d`, with `h = 0` and `N = 1/(2πe)`, against which the inequality bounds the entropy
of sums of independent uniform vectors.

### Dependencies

4.1 uses 2.1, 2.2, 2.3 and 3.2. 4.2 uses 1.2, 1.4 and 4.1.

## Scope and ownership

This roadmap owns the differential entropy of laws on `ℝ^d` as `−Ent` against Lebesgue measure,
its affine change of variables, the divergence from a Gaussian and the Gaussian maximum entropy,
the inequality `h(μ ∗ ν) ≥ max(h(μ), h(ν))`, the Fisher information of a density and its values
on smoothed laws, de Bruijn's identity, the limits of the entropy along the heat flow, the score
of a sum, Stam's weighted and reciprocal Fisher information inequalities for smoothed laws, Lieb's
form of the entropy power inequality, and the entropy power inequality.

Already in the libraries and therefore not targets: the signed Boltzmann entropy with its
formula, its value `⊤` for laws without density, its finiteness criteria and its change of
reference to a Gibbs measure, and the bound `Ent > −∞` under an integrable confining weight
(Tau Ceti, the formalization behind OptimalTransport 11.2), from which `h < +∞` under a finite
second moment follows; the image of a density under an affine map, and the affine change of the
entropy for absolutely continuous laws and maps that are gradients of convex quadratics (Tau
Ceti, used in 1.2); the lower semicontinuity of the divergence (Tau Ceti); the Gaussian laws,
their convolution and density (Mathlib and Tau Ceti). OptimalTransport 11.2 states that a finite
second moment makes the negative part of `p log p` integrable (1.1).

Stated by other roadmaps and consumed:

- DenoisingDiffusion 3.1 owns the smoothed density, its positivity, smoothness and score, and
  3.3 the bound `d/s²` on the second moment of the score, which is the bound `J(p_t) ≤ d/t` used
  above. DenoisingDiffusion 1.1 owns the divergence between isotropic Gaussian laws on `E`, whose
  equal-variance case on the line is MathematicalStatisticsNonparametric 1.3; the identity of 1.3
  above is about an arbitrary law with a finite second moment against an arbitrary nondegenerate
  Gaussian, and reduces to theirs only when the law is itself an isotropic Gaussian and `S` is
  isotropic.
- ScoreBasedDiffusion 1.2 (an open roadmap, not on main) owns the time derivatives of the smoothed
  density, of which the heat equation `∂_t p_t = (1/2) Δ p_t` used in 2.2 is the noise derivative
  at signal level `1`. This roadmap depends on that one. ScoreBasedDiffusion 2.1 expresses the
  score and its derivative through the posterior law; nothing here restates it. The relation
  between the Fisher information of `X + √t Z` and the minimum mean-square error of estimating
  `X` (Rioul, Proposition 6, p. 11) is not treated here.
- MathematicalStatisticsFoundations 4.3 owns the Fisher information `∫ (∂_θ log f_θ)² dP_θ` of a
  real-parameter family and the information inequality. For the location family
  `f_θ(x) = p(x − θ)` on the line with `p` positive and differentiable, that parametric Fisher
  information at `θ = 0` is `fisherInformation p`, and the information inequality with `W(x) = x`
  gives the Cramér–Rao bound `J ≥ 1/Var`; neither is restated here.
- OptimalTransport 11.2 and 11.7 to 11.9 own the Boltzmann entropy as a functional on Wasserstein
  space and the heat and Fokker–Planck flows as its gradient flows; this roadmap uses the explicit
  Gaussian convolution only.
- RandomMatrices 2.2 owns the Gaussian logarithmic Sobolev and Poincaré inequalities. Their
  derivation from Stam's inequality or the entropy power inequality is not a target here.
- The entropy of discrete laws and source coding are not treated here.

Outside the scope: the cases of equality in Stam's inequality and in the entropy power inequality
(Gaussian laws with proportional covariances); Stam's inequality for densities that are only
absolutely continuous, which needs a weak-derivative notion of Fisher information; integral
representations of the entropy through the Fisher information; Costa's concavity of the entropy
power; Rényi entropies and Rényi entropy power inequalities; monotonicity of entropy in the
central limit theorem and the entropic central limit theorem; mutual information of channels and
the capacity of the Gaussian channel; conditional differential entropy.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Measure.conv` (notation `∗`, `Mathlib/MeasureTheory/Group/Convolution.lean`), and
  `ProbabilityTheory.IndepFun.map_add_eq_map_conv_map`
  (`Mathlib/Probability/Independence/Basic.lean`): for independent measurable `X`, `Y`, the law of
  `X + Y` is the convolution of their laws.
- `ProbabilityTheory.multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean`),
  the Gaussian law with mean `m` and covariance `S` on `EuclideanSpace ℝ ι`, and
  `ProbabilityTheory.covariance` with notation `cov[X, Y; μ]`
  (`Mathlib/Probability/Moments/Covariance.lean`).
- `InformationTheory.klDiv` and `InformationTheory.klDiv_eq_zero_iff` (for finite measures,
  `klDiv μ ν = 0 ↔ μ = ν`), `InformationTheory.klDiv_compProd_eq_add` (the chain rule), in
  `Mathlib/InformationTheory/KullbackLeibler/`.
- `MeasureTheory.Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean`) and
  `MeasureTheory.Measure.withDensity`.
- `MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar`: the image of an additive Haar
  measure under an invertible linear map is `|det A|⁻¹` times it.
- `EReal.exp : EReal → ℝ≥0∞` (`Mathlib/Analysis/SpecialFunctions/Log/ERealExp.lean`), with
  `EReal.exp ⊥ = 0`.
- `gradient`, `Laplacian.laplacian`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`,
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral with a
  local integrable domination of the derivative),
  `integral_bilinear_hasFDerivAt_right_eq_neg_left_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean`: integration by parts on a
  finite-dimensional space when the three products are integrable).
- `MeasureTheory.eLpNorm_condExp_le_eLpNorm` (the conditional expectation does not increase `L^p`
  norms for `p ≥ 1`), `condExp`, `ProbabilityTheory.IndepFun`.

### From Tau Ceti

- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean`:
  `TauCeti.boltzmannEntropy m μ`, the signed entropy `∫ ρ log ρ dm` of `μ` against `m` in
  `EReal`, `⊤` when `μ` is not absolutely continuous; `TauCeti.boltzmannEntropy_withDensity`,
  `TauCeti.boltzmannEntropy_of_integrable`,
  `TauCeti.boltzmannEntropy_of_not_absolutelyContinuous`;
  `TauCeti.klDiv_tilted_eq_boltzmannEntropy` (for σ-finite nonzero `m`, `exp f` integrable against
  `m` and `f` integrable against the finite `μ`,
  `klDiv μ (m.tilted f) = Ent_m(μ) − ∫ f dμ + μ(X) log ∫ exp f dm + 1 − μ(X)`); and
  `TauCeti.boltzmannEntropy_ne_bot_of_integrable_exp` (under the same hypotheses, `Ent_m(μ) ≠ ⊥`).
- `TauCeti/MeasureTheory/Measure/WithDensity.lean`: `MeasureTheory.Measure.map_affine_withDensity`,
  for an additive Haar measure, an invertible continuous linear `A` and `c`, the image of
  `μ.withDensity g` under `x ↦ c + A x` is `μ.withDensity (|det A|⁻¹ g (A⁻¹(y − c)))`.
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/DisplacementConvexity.lean`:
  `TauCeti.internalEnergy_map_gradient`, the internal energy of the image of an absolutely
  continuous measure under the gradient of a convex function, as an integral against the Hessian
  determinant; for a convex quadratic it gives the case of 1.2 named there.
- `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`:
  `TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure`, joint lower semicontinuity of the
  divergence on pairs of probability measures for the weak topology, on a pseudo-metrizable Borel
  space.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean`:
  `TauCeti.Probability.multivariateGaussianPDFReal m S`, the formula
  `(2π)^(−d/2) (det S)^(−1/2) exp(−⟪x − m, S⁻¹(x − m)⟫/2)`, and
  `TauCeti.Probability.multivariateGaussian_eq_withDensity` (for positive definite `S`, the
  Gaussian law has that density).
- `TauCeti/Probability/Moments/Covariance.lean`: `TauCeti.covMatrix μ`, the matrix of the
  covariances `cov[x ↦ x i, x ↦ x j; μ]` of the coordinates of a measure on
  `EuclideanSpace ℝ ι`, used in 1.3; and `TauCeti.posSemidef_covMatrix` (for a finite measure
  with `MemLp id 2 μ`, the covariance matrix is positive semidefinite), used in 2.3.
- `TauCeti/Probability/Distributions/Gaussian/Sum.lean`:
  `TauCeti.Probability.multivariateGaussian_conv_multivariateGaussian`, for positive semidefinite
  covariances, `N(m₁, S₁) ∗ N(m₂, S₂) = N(m₁ + m₂, S₁ + S₂)`.
- `TauCeti/Analysis/PDE/HeatKernel/Derivatives.lean`:
  `TauCeti.exists_norm_iteratedFDeriv_heatKernel_le_rpow_mul_exp`, for each `m` a constant `C`
  with `‖Dᵐ K_t x‖ ≤ C t^(−(d + m)/2) exp(−‖x‖²/(8t))` for all `t > 0`; `φ_v` is `K_(v/2)`.

### From TauCetiRoadmap.OptimalTransport

- 11.2: under a finite second moment the negative part of `ρ log ρ` is integrable, so the entropy
  lies in `(−∞, ∞]`; consumed in 1.1.

### From TauCetiRoadmap.DenoisingDiffusion

- 3.1: `smoothedDensity μ₀ c s`, which for `s > 0` is a positive smooth density of `c • X + s • Z`
  (`hasLaw_smoothedDensity`), with all derivatives taken under the integral; and
  `noisyScore μ₀ c s = ∇ log (smoothedDensity μ₀ c s)`. The definition of `smoothedDensity` is
  copied into `Suggested.lean` with the same body.
- 3.3: `memLp_noisyScore`, the score of `c • X + s • Z` is square integrable with second moment at
  most `d/s²`.

### From TauCetiRoadmap.ScoreBasedDiffusion

- 1.2, the noise derivative: for a finite measure `μ₀`, every `c` and every `s > 0`,
  `s ↦ smoothedDensity μ₀ c s y` has derivative `s Δ p(y)` at `s`, with
  `p = smoothedDensity μ₀ c s`. With `s = √t` this is `∂_t p_t = (1/2) Δ p_t`.

## References

- Yury Polyanskiy and Yihong Wu, *Information Theory: From Coding to Learning*, Cambridge
  University Press; prepublication version of 16 August 2024, which the authors make free to view
  and download for personal use on their pages. Locators are to that version.
- Olivier Rioul, *Information theoretic proofs of entropy power inequalities*, IEEE Transactions
  on Information Theory 57 (2011), 33–55; arXiv:0704.1751v2 (24 August 2010), whose numbering and
  pages are cited.
- Mokshay Madiman and Andrew Barron, *Generalized entropy power inequalities and monotonicity
  properties of information*, IEEE Transactions on Information Theory 53 (2007), 2317–2329;
  arXiv:cs/0605047v2.
- Mokshay Madiman, James Melbourne and Peng Xu, *Forward and reverse entropy power inequalities in
  convex geometry*, in *Convexity and Concentration*, IMA Volumes 161 (2017); arXiv:1604.04225v2.
- Attributions in prose: Claude Shannon (the entropy power inequality, 1948); A. J. Stam (the
  Fisher information inequality, de Bruijn's identity and the first proof of the entropy power
  inequality, 1959, crediting N. G. de Bruijn for the identity); Nelson M. Blachman (the score of
  a sum, 1965); Elliott H. Lieb (the form of 4.1, 1978); Andrew R. Barron (de Bruijn's identity for
  laws with finite variance, 1986).
