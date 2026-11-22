# Roadmap: score matching, ratio matching and noise-contrastive estimation

**Summary.** Many statistical models are known only up to their normalising constant: a model is
an unnormalised density `q = exp(logq)` whose integral `Z` cannot be computed, and may even be
infinite. This roadmap develops three estimation principles that never use `Z`, each as an exact
theorem about the population objective, with every regularity condition stated.

- *Hyvärinen's identity.* Let `p` be a differentiable integrable density on `ℝⁿ` with finite Fisher
  information `∫ p ‖∇ log p‖²`, and let `logq` be a differentiable function with differentiable
  gradient, `∫ p ‖∇ logq‖² < ∞` and `p · ∂ᵢ² logq` integrable for each coordinate `i`. Then
  `½ ∫ p ‖∇ logq − ∇ log p‖² = ∫ p (Δ logq + ½ ‖∇ logq‖²) + ½ ∫ p ‖∇ log p‖²`. The right side
  involves `p` only through integration, so it can be estimated from a sample, and it involves
  `logq` only through derivatives, so `Z` never enters. If `p` is positive everywhere, the left
  side vanishes exactly when `logq − log p` is constant.
- *Exponential families in closed form.* For `logq = Σ θₖ Fₖ` with twice differentiable
  statistics and any law `P` under which `‖∇Fₖ‖²` and `Δ Fₖ` are integrable, Hyvärinen's
  objective is a quadratic in `θ`; when the Gram matrix `A` of the gradients `∇Fₖ` in `L²(P)` is
  positive definite it is minimised exactly at `θ̂ = −A⁻¹ b`, `bₖ = ∫ Δ Fₖ dP`.
- *Ratio matching.* For binary configurations `x ∈ {0,1}^ι`, every law `Px` (zero
  probabilities allowed) and every positive model `Q`, the ratio-matching distance between `Px`
  and `Q` equals `Σ_x Px(x) Σᵢ g(Q(x)/Q(xⁱ))² + c(Px)` with `g(u) = 1/(1 + u)` and `xⁱ` the
  configuration with site `i` flipped; it vanishes exactly when `Px = Q/ΣQ`. For an identifiable
  positive model continuous on a compact metric parameter space and independent samples from
  the model law at `θ₀`, every exact minimiser of the sample loss converges in probability to
  `θ₀`.
- *Noise-contrastive estimation.* For integrable data and noise densities `pd`, `pn`, which
  need be neither normalised nor positive, and any `ν > 0` noise points per data point, the logistic
  loss of telling data from noise with the classifier `e^f/(e^f + ν pn)` is bounded below by an
  explicit finite value; when `pn > 0` almost everywhere where `pd > 0`, a measurable log-model
  `f` attains it exactly when `pd > 0` almost everywhere where `pn > 0` and `f = log pd` almost
  everywhere where `pd > 0`, with no normalisation imposed on `e^f`.

DenoisingDiffusion owns the denoising form of score matching; MathematicalStatisticsAsymptotic
supplies the consistency theorem for maximisers under uniform convergence used for ratio
matching; Checks use RestrictedBoltzmannMachines and CurieWeissModel; Mathlib supplies
integration by parts for Fréchet derivatives and the Laplacian.

Layer 1 treats score matching on `ℝⁿ`, Layer 2 exponential families (after Layer 1), Layer 3
ratio matching and Layer 4 noise-contrastive estimation; Layers 3 and 4 are independent.

## Conventions

- **Continuous data.** `E = EuclideanSpace ℝ (Fin n)` with Lebesgue measure. A data density is a
  function `p : E → ℝ` with `p ≥ 0`. A model is an unnormalised log-density `logq : E → ℝ`;
  nothing requires `exp ∘ logq` to be integrable (the model `logq = x²/2` on `ℝ` is allowed). The
  model score is `gradient logq` and the data score `gradient (log ∘ p)`; where `p = 0` the data
  score is a junk value, and every integrand that contains it carries the factor `p`. `Δ` is
  Mathlib's Laplacian, the trace of `iteratedFDeriv ℝ 2`; `eᵢ = EuclideanSpace.single i 1`.
  This "score" is the gradient in the data variable; the likelihood score in the parameter
  (MathematicalStatisticsFoundations 4.3) is a different object.
- **Junk values.** A Bochner integral of a non-integrable function is `0`, `Real.log 0 = 0` and
  `x/0 = 0`. Every integral identity of Layers 1 and 2 carries the integrability hypotheses that
  make each integral genuine. The losses of Layer 4 are extended nonnegative integrals
  (`∫⁻`) of nonnegative integrands, so they need no integrability hypothesis.
- **Binary data.** Configurations are `x : ι → Bool` for a finite type `ι` of sites, `flipAt x i`
  changes the value at `i`. A data law and a model are functions `(ι → Bool) → ℝ`: the data law
  is a weight function (probabilities or empirical frequencies), the model is positive and
  unnormalised. `g(u) = 1/(1 + u)` is applied to ratios through `ratioTransform`, which writes
  `g(P(x)/P(xⁱ))` as `P(xⁱ)/(P(x) + P(xⁱ))`: this is `0` when `P(xⁱ) = 0 < P(x)` and `1` when
  `P(x) = 0 < P(xⁱ)`, the limiting values of `g`, and `0` when both vanish.
- **Samples.** A sample of size `T` is a point of `Fin T → (ι → Bool)` under
  `Measure.pi fun _ ↦ P₀`. Convergence in probability on these varying spaces is
  `TendstoInProbability`, copied verbatim from MathematicalStatisticsAsymptotic 1.1.

## Layer 1: score matching on Euclidean space

### 1.1 The two objectives

Define `scoreMatchingObjective p logq = ½ ∫ p ‖∇ logq − ∇ log p‖²` (the explicit objective of
Hyvärinen 2005, equation (2), p. 697; half the Fisher divergence) and, for a measure `P` on `E`,
`hyvarinenObjective P logq = ∫ (Δ logq + ½ ‖∇ logq‖²) dP` (the right side of Hyvärinen 2005,
equation (3), p. 697, without its constant). The second depends on the data only through
integration against `P`, so for the empirical law of a sample it is the sample objective of
Hyvärinen 2005, equation (4), p. 698. Both are unchanged when a constant is added to `logq`.

**Checks.**

- `n = 1`, `p` the standard normal density, `logq = −M (x − μ)²/2`: the model score is
  `−M (x − μ)`, the data score `−x`, and `scoreMatchingObjective p logq = ((M − 1)² + M² μ²)/2`;
  it vanishes only at `M = 1`, `μ = 0`.
- The same `p` and `logq = x²/2` (so `exp ∘ logq` is not integrable): the score is `x`,
  `scoreMatchingObjective p logq = ½ E (2X)² = 2`, and `hyvarinenObjective` of the standard
  normal law is `E(1 + X²/2) = 3/2`.

*Needs:* Mathlib `gradient`, `Laplacian.laplacian`.

### 1.2 Hyvärinen's identity

Prove (`scoreMatchingObjective_eq_hyvarinenObjective_add`) that if `p ≥ 0` is differentiable and
integrable, `logq` and `fderiv ℝ logq` are differentiable, and the functions `p ‖∇ logq‖²`,
`p ‖∇ log p‖²` and, for every `i`, `p · iteratedFDeriv ℝ 2 logq · (eᵢ, eᵢ)` are integrable, then
`scoreMatchingObjective p logq` equals `hyvarinenObjective` of the law with density `p` plus
`½ ∫ p ‖∇ log p‖²`, a constant that does not involve the model (Hyvärinen 2005, Theorem 1,
p. 697, proof Appendix A, pp. 706–708). The source assumes "weak regularity conditions"
(footnote 1, p. 697): differentiability of `p`, finite second moments of both scores and
`p ψ → 0` at infinity. Here the boundary condition is replaced by the integrability of `p` (which,
with the moment hypothesis on `ψ`, makes `p ψᵢ` integrable), and the integrability of `p ∂ᵢψᵢ`,
implicit in the source's right side, is a hypothesis.

Route (complete, following Appendix A).

1. Write `ψ = ∇ logq` and `s = ∇ log p`. The three functions `p ‖ψ‖²`, `p ⟪ψ, s⟫`, `p ‖s‖²` are
   integrable: they are measurable (`measurable_fderiv`, `p` continuous), the first and last by
   hypothesis, and `|p ⟪ψ, s⟫| ≤ p (‖ψ‖² + ‖s‖²)/2`. Expanding the square,
   `scoreMatchingObjective p logq = ½ ∫ p ‖ψ‖² − ∫ p ⟪ψ, s⟫ + ½ ∫ p ‖s‖²`.
2. `p · s = ∇ p` at every point: where `p x > 0` by the chain rule for `log`
   (`HasFDerivAt.log`); where `p x = 0` the
   point is a minimum of `p ≥ 0`, so `∇ p x = 0` (`IsLocalMin.fderiv_eq_zero`) and `p x · s x = 0`.
   Hence `p ⟪ψ, s⟫ = Σᵢ ∂ᵢp · ψᵢ` with `ψᵢ x = fderiv ℝ logq x eᵢ`.
3. For each `i`, integration by parts in the direction `eᵢ`
   (`integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable` with `f = p`, `g = ψᵢ`) gives
   `∫ ∂ᵢp · ψᵢ = −∫ p · ∂ᵢψᵢ`. Its three integrability hypotheses hold: `∂ᵢp · ψᵢ = p sᵢ ψᵢ` by
   step 2, measurable with `|p sᵢ ψᵢ| ≤ p (‖ψ‖² + ‖s‖²)/2`; `p · ∂ᵢψᵢ` because
   `∂ᵢψᵢ x = iteratedFDeriv ℝ 2 logq x (eᵢ, eᵢ)` (as `fderiv ℝ logq` is differentiable,
   `iteratedFDeriv_two_apply`); `p ψᵢ` because `|p ψᵢ| ≤ p (1 + ‖ψ‖²)/2`. Both functions are
   differentiable everywhere.
4. `Σᵢ iteratedFDeriv ℝ 2 logq x (eᵢ, eᵢ) = Δ logq x`
   (`InnerProductSpace.laplacian_eq_iteratedFDeriv_orthonormalBasis` for the standard basis
   `EuclideanSpace.basisFun`, whose vectors are the `eᵢ` by `EuclideanSpace.basisFun_apply`).
5. An integral against `volume.withDensity (ofReal ∘ p)` is `∫ p · (·)`
   (`integral_withDensity_eq_integral_toReal_smul`, `p` measurable). Collecting,
   `scoreMatchingObjective p logq = ∫ p (Δ logq + ½ ‖ψ‖²) + ½ ∫ p ‖s‖²`.

**Checks.**

- The two models of 1.1 under the standard normal law (Fisher information `1`): for
  `logq = −M (x − μ)²/2`, `hyvarinenObjective = −M + M² (1 + μ²)/2`, and adding `½` gives
  `((M − 1)² + M² μ²)/2`; for `logq = x²/2`, `3/2 + ½ = 2`. A non-normalisable model obeys the
  identity.
- `logq = −x⁴/4 + a x² + b x` against the standard normal law: both sides equal
  `½ E (ψ(X) + X)²` with `ψ = −x³ + 2a x + b`, by the exact moments of the normal law (the
  difference of the two sides is `E[X ψ(X)] − E[ψ′(X)] = 0`).
- The integrability of `p ∂ᵢψᵢ` is not implied by the others: for the standard normal `p` and
  `logq(x) = ∫₀ˣ sin(e^(t²)) dt` the score `sin(e^(x²))` is bounded and the Fisher information is
  `1`, while `p |ψ′| = φ(x) · 2|x| e^(x²) |cos(e^(x²))|` is not integrable.
- `n = 0`: `E` is a point, every gradient and Laplacian is `0`, and both sides are `0`.

*Needs:* 1.1; Mathlib `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`,
`InnerProductSpace.laplacian_eq_iteratedFDeriv_orthonormalBasis`, `EuclideanSpace.basisFun_apply`,
`iteratedFDeriv_two_apply`, `HasFDerivAt.log`, `IsLocalMin.fderiv_eq_zero`, `measurable_fderiv`,
`integral_withDensity_eq_integral_toReal_smul`.

### 1.3 Identification

Prove (`scoreMatchingObjective_eq_zero_iff`) that if `p > 0` everywhere, `p` and `logq` are
differentiable, and `p ‖∇ logq‖²` and `p ‖∇ log p‖²` are integrable, then
`scoreMatchingObjective p logq = 0` if and only if there is `c` with `logq x = log p x + c` for
every `x` (Hyvärinen 2005, Theorem 2, p. 698, proof Appendix B, p. 708, stated there for a
parametric model containing the data density, with identifiability; that form follows at once).
In particular, when `p` is also integrable, a model with objective `0` is normalisable, with
`∫ exp logq = e^c ∫ p`; without integrability of `p` it need not be (`p = 1`, `logq = 0` on `ℝ`).

Route. If `logq = log p + c` the two scores agree everywhere and the integrand is `0`.
Conversely the integrand `p ‖∇ logq − ∇ log p‖²` is nonnegative and integrable (as in step 1 of
1.2), so it vanishes almost everywhere (`integral_eq_zero_iff_of_nonneg`); as `p > 0`, the
function `h = logq − log ∘ p`, differentiable everywhere, has `∇ h = 0` almost everywhere. The
source (Appendix B) passes from the vanishing of the objective, through the positivity of the
densities, to equal scores and then to a constant difference of the log-densities, in two
sentences, and its footnote 2 reads equalities of densities almost everywhere. The step from scores
equal almost everywhere to a constant difference is the following lemma (own proof). *An
everywhere differentiable `h : E → ℝ` whose derivative vanishes almost everywhere is constant.*
Fix `v`, and let `N` be the measurable null set where `fderiv ℝ h ≠ 0` (`measurable_fderiv`). By
Tonelli's theorem and translation invariance the set of `(z, t) ∈ E × [0, 1]` with
`z + t v ∈ N` is null (`lintegral_prod`, `measure_preimage_add_right`), so for almost every `z`
the set of `t ∈ [0, 1]` with `z + t v ∈ N` is null. For such `z`, `t ↦ h (z + t v)` is
differentiable everywhere with derivative `0` almost everywhere, hence interval integrable, and
the fundamental theorem of calculus (`intervalIntegral.integral_eq_sub_of_hasDerivAt`) gives
`h (z + v) = h z`. The two sides are continuous in `z` and agree almost everywhere, so they agree
everywhere (`Continuous.ae_eq_iff_eq`). So `h` is invariant under every translation.

**Checks.**

- The Gaussian family of 1.1: the objective `((M − 1)² + M² μ²)/2` vanishes exactly at the data
  law, and `logq = −(x² − 7)/2` (any additive constant) also gives `0`.
- The moment hypothesis on the model is needed: for the standard normal `p` and `logq = e^(x²)`,
  `p (ψ − s)² ≥ φ(x) · 4x² e^(2x²)` is not integrable, so the Bochner integral is the junk `0`
  although `logq − log p` is not constant. Likewise for the data hypothesis with `logq = 0` and
  `p ∝ exp(−x² + sin(e^(x²)))`, whose Fisher information is infinite.

*Needs:* 1.1, 1.2 (step 1); Mathlib `integral_eq_zero_iff_of_nonneg`, `measurable_fderiv`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`, `Continuous.ae_eq_iff_eq`, `lintegral_prod`,
`measure_preimage_add_right`.

### Examples

The Gaussian model against the standard normal law (values in 1.1–1.3); the non-normalisable
model `x²/2`; the quartic model of 1.2.

### Dependencies

1.2 and 1.3 use 1.1 and Mathlib's calculus and integration; 1.3 uses step 1 of 1.2.

## Layer 2: exponential families

### 2.1 The score-matching estimator in closed form

For statistics `F : Fin m → E → ℝ` define `expFamilyLogDensity F θ = Σₖ θₖ Fₖ`, the Gram matrix
`scoreGram P F` with entries `∫ ⟪∇Fₖ, ∇Fₗ⟫ dP` and the vector `laplacianMean P F` with entries
`∫ Δ Fₖ dP`. Prove (`hyvarinenObjective_expFamily_minimizer`) that for any measure `P`, if every
`Fₖ` and `fderiv ℝ Fₖ` is differentiable, `‖∇Fₖ‖²` and `Δ Fₖ` are `P`-integrable and
`A = scoreGram P F` is positive definite, then `θ ↦ hyvarinenObjective P (expFamilyLogDensity F θ)`
attains its minimum at `θ̂ = −A⁻¹ b`, `b = laplacianMean P F`, and only there (Hyvärinen 2007,
Section 4.1, equations (29)–(34), p. 2506, derivation printed, for the empirical law and
`θ ∈ ℝᵐ`; the source leaves the invertibility of `A` implicit). With 1.2, for a law with a
density satisfying its hypotheses, `θ̂` also minimises the score-matching objective.

Route. `logq_θ` and its derivative are differentiable, with `∇ logq_θ = Σ θₖ ∇Fₖ` and
`Δ logq_θ = Σ θₖ Δ Fₖ` (the first two derivatives of a finite sum of twice differentiable
functions are the sums of the derivatives, `fderiv_sum`). So the integrand is
`Σ θₖ Δ Fₖ + ½ Σₖ Σₗ θₖ θₗ ⟪∇Fₖ, ∇Fₗ⟫`, integrable since `|⟪a, b⟫| ≤ (‖a‖² + ‖b‖²)/2`, and
`hyvarinenObjective P logq_θ = bᵀθ + ½ θᵀAθ`. As `A` is symmetric positive definite,
`bᵀθ + ½ θᵀAθ = ½ (θ − θ̂)ᵀ A (θ − θ̂) − ½ bᵀA⁻¹b`, which is minimal exactly at `θ = θ̂`.

**Checks.**

- The Gaussian on `ℝ`, `F = (x, −x²/2)`, so `logq_θ = θ₁ x − θ₂ x²/2`, and `P` the empirical law
  of `{0, 1, 3}`: `A = [[1, −4/3], [−4/3, 10/3]]`, `b = (0, −1)`, `θ̂ = (6/7, 9/14)`. The model has
  precision `θ₂ = 9/14`, the inverse of the sample variance `14/9`, and mean `θ₁/θ₂ = 4/3`, the
  sample mean: score matching returns the maximum-likelihood estimates (Hyvärinen 2005,
  Section 3.1.1, p. 699). The minimum value is `−½ bᵀA⁻¹b = −9/28`.
- Positive definiteness is needed: for the one-point law at `2`, `A = [[1, −2], [−2, 4]]` is
  singular and the objective along `θ = (2s, s)` is `−s`, unbounded below. In general `A` is
  positive definite exactly when the `∇Fₖ` are linearly independent in `L²(P)`.

*Needs:* 1.1; Mathlib `fderiv_sum`, `iteratedFDeriv_two_apply`, `Matrix.PosDef`,
`Matrix.PosDef.inv`, `Matrix.mulVec`.

### Examples

The sample Gaussian of 2.1; the degenerate one-point law.

### Dependencies

2.1 uses 1.1 (and 1.2 only for the remark on densities).

## Layer 3: ratio matching for binary data

### 3.1 The ratio-matching identity

Define `flipAt`, `ratioTransform P x i = P (flipAt x i) / (P x + P (flipAt x i))`, the
ratio-matching objective
`ratioMatchingObjective Px Q = ½ Σ_x Px(x) Σᵢ ([r(x) − ρ(x)]² + [r(xⁱ) − ρ(xⁱ)]²)` with
`r = ratioTransform Px ·  i`, `ρ = ratioTransform Q · i`, `xⁱ = flipAt x i` (Hyvärinen 2007,
equation (13), p. 2502), and the loss `ratioMatchingLoss Px Q = Σ_x Px(x) Σᵢ ρ(x)²` (equation (14);
for empirical frequencies, equation (16)). Prove (`exists_ratioMatchingObjective_eq_add`) that if
`Px ≥ 0` there is a constant `c` such that
`ratioMatchingObjective Px Q = ratioMatchingLoss Px Q + c` for every positive `Q`
(Hyvärinen 2007, Theorem 1, p. 2502, proof Appendix A, pp. 2508–2509, stated there
when all probabilities are positive; here `Px` may vanish).

Route (complete; the source's algebra, with the zero cases checked). Fix `i`; `x ↦ xⁱ` is an
involution of the configurations, so a sum over `x` may be reindexed by `xⁱ`. For `Px ≥ 0`,
`(Px(x) + Px(xⁱ)) r(x) = Px(xⁱ)`: if the sum is positive by definition, and if it is `0` both
weights are `0`. Expanding the squares, `2 · ratioMatchingObjective = A + B − 2C` with
`A = Σ_x Px(x) Σᵢ (r(x)² + r(xⁱ)²)`, which does not involve `Q`,
`B = Σ_x Px(x) Σᵢ (ρ(x)² + ρ(xⁱ)²)` and `C = Σ_x Px(x) Σᵢ (r(x)ρ(x) + r(xⁱ)ρ(xⁱ))`. Reindexing
the second half of `C`, its `i`-th part is `Σ_x (Px(x) + Px(xⁱ)) r(x) ρ(x) = Σ_x Px(xⁱ) ρ(x)`, and
reindexing again, `Σ_x Px(x) ρ(xⁱ)`. As `Q > 0`, `ρ(x) + ρ(xⁱ) = 1`, so the `i`-th part of
`B − 2C` is `Σ_x Px(x) (ρ² + (1 − ρ)² − 2(1 − ρ)) = Σ_x Px(x) (2ρ(x)² − 1)`. Hence
`c = A/2 − (|ι|/2) Σ_x Px(x)`.

**Checks.**

- `ratioTransform (t • Q) = ratioTransform Q` for `t > 0`: the loss needs no normalising constant.
- Two sites, `Px` giving `½` to each configuration with first site `false` and `0` to the others,
  `Q` uniform: `ratioMatchingObjective = 1/4`, `ratioMatchingLoss = 1/2`, `c = −1/4` (by the
  formula above), so the identity holds with zero probabilities.
- Nonnegativity of `Px` is needed: on one site with `Px = (1, −1)`, objective minus loss is `0`
  for `Q = (1, 1)` and `−1/2` for `Q = (1, 3)`.
- Positivity of `Q` is needed: on one site with `Px = (½, ½)`, `c = −1/4`, while `Q = 0` gives
  objective `1/4` and loss `0`.
- The restricted Boltzmann machine of RestrictedBoltzmannMachines 1.3, whose visible law is the
  Gibbs law of its free energy `F`: for `Q = exp(−F)`, `ratioTransform Q v j = σ(F(v) − F(vʲ))`.
  With one visible and one hidden unit, weight `log 3` and zero biases, `Q = (2, 4)` on `v = 0, 1`
  (visible law `(1/3, 2/3)`), and `ratioTransform Q` is `1/3` at `v = 1` and `2/3` at `v = 0`.
- The Curie–Weiss law of CurieWeissModel 1.1, `Q(x) = exp(β M²/(2N) + h M)` with `M` the sum of
  the spins: flipping a site of spin `s` gives `ratioTransform Q x i = σ(−2s(β m̌ + h))` with
  `m̌` the sum of the other spins divided by `N` (checked exactly for `N = 3`); for `N = 2`,
  `h = 0`, `e^β = 3` and equal spins the value is `1/(1 + e^β) = 1/4`. The fully visible
  Boltzmann machine `Q = exp(½ xᵀ M x + bᵀx)` on `{−1, 1}ⁿ` with `M` symmetric with zero diagonal
  has
  `Q(xⁱ)/Q(x) = exp(−2xᵢ (Mx)ᵢ − 2bᵢxᵢ)` (Hyvärinen 2007, equation (18), p. 2503).

*Needs:* Mathlib `Function.update`, `Fintype.sum_equiv`.

### 3.2 Identification

Prove (`ratioMatchingObjective_eq_zero_iff`) that if `Px ≥ 0` with `Σ_x Px(x) = 1` and `Q > 0`,
then `ratioMatchingObjective Px Q = 0` if and only if `Px = Q / Σ_y Q(y)` (Hyvärinen 2007,
Theorem 2, first part, p. 2503, proof Appendix B, p. 2510, for a positive data law in the model
with identifiability; here `Px` may vanish, and the parametric form follows at once).

Route. If `Px = Q/ΣQ` the two transforms agree (scale invariance) and every term is `0`.
Conversely all terms are nonnegative, so `r(x) = ρ(x)` and `r(xⁱ) = ρ(xⁱ)` whenever
`Px(x) > 0`. If `Px(x) > 0` and `Px(xⁱ) = 0` then `r(x) = 0 < ρ(x)`: so the support of `Px` is
closed under every flip (own step). Any two configurations are joined by flips at the sites where
they differ, and the support is nonempty (`Σ Px = 1`), so `Px > 0` everywhere. Then `r(x) = ρ(x)`
says `Px(xⁱ)/Px(x) = Q(xⁱ)/Q(x)`, so `Px/Q` is invariant under each flip, hence constant, and
the constant is `1/ΣQ`.

**Checks.**

- The two-site law of 3.1 with a zero: the objective is `1/4 > 0` against the uniform model,
  and by the theorem it is positive against every positive model.
- The normalisation `Σ Px = 1` is needed: `Px = 2 Q/ΣQ` has objective `0`.
- `ι` empty: one configuration, `Px = 1 = Q/ΣQ`, objective `0`.

*Needs:* 3.1 (the definitions).

### 3.3 Consistency

Prove (`tendstoInProbability_ratioMatching`) that if `Θ` is a compact metric space,
`Q : Θ → (ι → Bool) → ℝ` is positive with `θ ↦ Q θ x` continuous for every `x`, the model is
identifiable at `θ₀` (equal normalised laws force `θ = θ₀`), `P₀` is the probability measure
with `P₀ {x} = Q θ₀ x / Σ_y Q θ₀ y`, and `θhat T ω` minimises
`θ ↦ ratioMatchingLoss (empiricalFreq ω) (Q θ)` for every sample `ω` of every size `T`, then
`θhat` converges in probability to `θ₀` under the product laws (Hyvärinen 2007, Theorem 2,
second part, p. 2503, proved in Appendix B, p. 2510, by an appeal to the law of large numbers,
with no hypothesis on the parameter space; here compactness and continuity give the
well-separated minimum that the route below uses).

Route. Put `s_θ(x) = Σᵢ ratioTransform (Q θ) x i ²`, which lies in `[0, |ι|]` and is continuous in
`θ`, and `J θ = Σ_x P₀{x} s_θ(x)`. The sample loss is `Σ_x empiricalFreq ω x · s_θ(x)`, so
`sup_θ |loss − J θ| ≤ |ι| Σ_x |empiricalFreq ω x − P₀{x}|`, bounded, and tending to `0` in
probability: each frequency is an average of `T` independent indicators (`iIndepFun_pi`), of
variance at most `1/(4T)` (`IndepFun.variance_sum`, `meas_ge_le_variance_div_sq`). By 3.1 and
3.2, `J θ − J θ₀ = ratioMatchingObjective P₀ (Q θ) ≥ 0`, with equality exactly when the
normalisations of `Q θ` and `Q θ₀` agree, that is (identifiability) when `θ = θ₀`. On the
compact set `{θ | ε ≤ dist θ θ₀}` the continuous `J` attains its minimum, which is therefore
above `J θ₀` (`IsCompact.exists_isMinOn`): the minimum is well separated. Apply
MathematicalStatisticsAsymptotic 5.1 (`tendstoInProbability_of_isWellSeparated`) to `−J` and the
negated sample losses, with remainder `0`.

**Checks.**

- `Θ` a single point: the conclusion is trivial.
- Without compactness the separation can fail: one site, `Θ = [0, ∞)`,
  `Q θ = (1, exp(θ e^(−θ)))`; `J` is minimised only at `0`, but `J θ → J 0` as `θ → ∞`.

*Needs:* 3.1, 3.2; MathematicalStatisticsAsymptotic 1.1 (`TendstoInProbability`, copied) and 5.1
(`tendstoInProbability_of_isWellSeparated`); Mathlib `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.IndepFun.variance_sum`, `ProbabilityTheory.meas_ge_le_variance_div_sq`,
`IsCompact.exists_isMinOn`.

### Examples

The two-site law with a zero (3.1–3.2); the binary Boltzmann-type models of 3.1.

### Dependencies

3.2 uses 3.1. 3.3 uses 3.1, 3.2 and MathematicalStatisticsAsymptotic 1.1 and 5.1. The Checks of
3.1 use RestrictedBoltzmannMachines 1.3 and CurieWeissModel 1.1.

## Layer 4: noise-contrastive estimation

### 4.1 The nonparametric theorem

Let `μ` be a measure on a measurable space `X`, `pd, pn ≥ 0` measurable and `μ`-integrable (data
and noise densities) and `ν > 0`. For `f : X → ℝ` the classifier `h = e^f/(e^f + ν pn)` gives the
logistic loss `nceLoss μ pd pn ν f = ∫⁻ pd · log(1/h) + ν pn · log(1/(1 − h))` (the negative of the
objective of Gutmann–Hyvärinen 2012, equation (11), p. 311, built from equations (3)–(6),
p. 310); its integrand is `0` where `pn = 0`. Let `nceOptimalLoss μ pd pn ν` be
`∫⁻ pd log((pd + ν pn)/pd) + ν pn log((pd + ν pn)/(ν pn))`. Prove (`nceLoss_minimizers`):

- `nceOptimalLoss μ pd pn ν` is finite and at most `nceLoss μ pd pn ν f` for every `f`;
- if `pn > 0` almost everywhere where `pd > 0`, a measurable `f` has
  `nceLoss μ pd pn ν f = nceOptimalLoss μ pd pn ν` exactly when `pd > 0` almost everywhere where
  `pn > 0` and `f = log pd` almost everywhere where `pd > 0`.

(Gutmann–Hyvärinen 2012, Theorem 1, p. 311, proof Appendix A.2, pp. 342–343, by a second-order
expansion. The source says that the maximum is attained at `f = log pd`, with no other extrema
when `pn` is nonzero wherever `pd` is; for real-valued `f` the attainment needs `pd > 0` where
`pn > 0`, which is the first clause of the characterisation.)

Route (own pointwise form of the source's argument). For `a ≥ 0`, `b > 0` and real `t`, put
`α = a/(a + b)` and `β = eᵗ/(eᵗ + b)`; then
`a log((eᵗ + b)/eᵗ) + b log((eᵗ + b)/b) − [a log((a + b)/a) + b log((a + b)/b)]` equals
`(a + b) (α log(α/β) + (1 − α) log((1 − α)/(1 − β)))`, a binary Kullback–Leibler divergence,
which is `≥ 0` with equality exactly when `α = β`, that is `eᵗ = a` (so `a > 0`)
(`Real.log_le_sub_one_of_pos`). For `b = 0` both integrands are `0`. So the integrands satisfy
the inequality pointwise and the bound follows (`lintegral_mono`); the optimal integrand is at
most `a + b` because `log(1 + y) ≤ y`, so the optimum is at most `∫ pd + ν ∫ pn`. If the loss of a
measurable `f` equals the finite optimum, the integrands agree almost everywhere
(`ae_eq_of_ae_le_of_lintegral_le`), so almost everywhere on `{pn > 0}`, `pd > 0` and
`f = log pd`; the support hypothesis puts `{pd > 0}` inside `{pn > 0}`. Conversely these
conditions make the integrands agree almost everywhere.

In particular, if `pd = exp ∘ f_θ⋆` for a parametric family `θ ↦ f_θ` of measurable functions
(so `pd > 0`), `pn > 0` almost everywhere and `exp ∘ f_θ = pd` almost everywhere forces
`θ = θ⋆`, then `θ⋆` is the only minimiser of `θ ↦ nceLoss μ pd pn ν f_θ`; for
`f_(α, c) = log q_α + c` with a free normalising parameter `c` the minimiser has
`c = log ∫ pd − log ∫ q_α⋆`, which is `−log ∫ q_α⋆` when `pd` is a probability density. The
source's proof of its Theorem 2, p. 312, obtains this uniqueness in Lemma 10, p. 344, from
Theorem 1 and a full-rank condition, where identifiability is assumed here.

**Checks.**

- The support hypothesis is needed: `X = {0, 1}` with counting measure, `pd = (½, ½)`,
  `pn = (1, 0)`, `ν = 1`. The loss is `½ log(1 + e^(−f₀)) + log(1 + e^(f₀))`, independent of
  `f₁`, minimal at `e^(f₀) = ½` with value `½ log 3 + log(3/2)`, the optimum. So `f = (log ½, 0)`
  is a minimiser with `f₁ ≠ log pd₁`, and `e^f` has total mass `3/2`.
- Attainment can fail under the support hypothesis: `pd = (1, 0)`, `pn = (½, ½)`, `ν = 1`. The
  point `1` contributes `½ log(1 + 2e^(f₁)) > 0` for every real `f₁` and the optimum `0`, so no
  `f` attains the optimum, which is still the infimum.
- `ν > 0` is needed: for `ν = 0` every loss and the optimum are `0`, so every `f` attains the
  optimum.
- One point, `pd = 1`, `pn = 2`, `ν = 1`: the optimum is `log 3 + 2 log(3/2)`, below the bound
  `pd + ν pn = 3`, and the derivative in `t` of the integrand is `2(eᵗ − 1)/(eᵗ + 2)`.

*Needs:* Mathlib `lintegral_mono`, `ae_eq_of_ae_le_of_lintegral_le`, `Real.log_le_sub_one_of_pos`,
`Real.add_one_le_exp`, `ofReal_integral_eq_lintegral_ofReal`.

### Examples

The two-point laws of 4.1.

### Dependencies

4.1 uses Mathlib only.

## Scope and ownership

This roadmap owns the implicit (integration-by-parts) form of score matching on `ℝⁿ` and its
identification theorem, the closed-form score-matching estimator of exponential families, the
ratio-matching identity, identification and consistency for binary data, and the nonparametric
theorem of noise-contrastive estimation.

Stated by other roadmaps and used or bordered above: DenoisingDiffusion 3.3 owns the denoising
objective, its equality with the explicit objective up to a constant (`dsm_eq_esm_add`) and the
noise-prediction minimiser (`noisePrediction_minimizer`), all for the law of a Gaussian-smoothed
variable and a general vector field; this roadmap does not restate them. For a model score
`∇ logq` and `p` the density of that smoothed law, the explicit objective there is twice the
objective `scoreMatchingObjective` of 1.1, which is defined here for every density `p`.
ScoreBasedDiffusion 2.3 owns the time-integrated denoising objective.
MathematicalStatisticsAsymptotic 5.1 owns consistency of approximate maximisers under uniform
convergence and well-separation, used in 3.3.
MathematicalStatisticsFoundations 4.3 owns the Fisher information of a parametric family, built
on the likelihood score in the parameter, which is not the score of this roadmap. For Gaussian
data the integration by parts of 1.2 is Gaussian integration by parts, which RandomMatrices 2.5
owns and SteinsMethodForNormalApproximation uses; 1.2 is the identity for general densities.
RestrictedBoltzmannMachines owns the free energy, the likelihood gradient and contrastive
divergence; CurieWeissModel owns the Curie–Weiss law; both enter only Checks of 3.1.
DiscriminantAnalysisAndLogisticRegression owns logistic regression and the existence of its
maximum-likelihood estimator; 4.1 is the population theorem of a logistic loss with a known
noise density, not an estimator.
LogConcaveFunctionalInequalities 1.3 states its results with the relative Fisher information
`relativeFisherInformation μ h = ∫⁻ ‖∇h‖²/h dμ`. For `p > 0` and `logq` differentiable, `μ` the
measure with density `exp ∘ logq` and `h = p/exp ∘ logq`, it is `∫⁻ p ‖∇ logq − ∇ log p‖²`,
which is twice `scoreMatchingObjective p logq` when that integrand is integrable: the same quantity
in another form and carrier. DifferentialEntropyAndEntropyPower 2.1 defines the Fisher
information `∫⁻ ‖∇p‖²/p` of a density, which for `p > 0` differentiable is the integral
`∫ p ‖∇ log p‖²` in the model-free term of 1.2 when finite. Neither states an identity of the
form of 1.2 or 1.3, no theorem of either is restated here, and this roadmap does not depend on
those ones.

Not treated here: the sample-level consistency of score matching (Hyvärinen 2005, Corollary 3,
argued there from the law of large numbers; a uniform law of large numbers over the parameter
space and a well-separated minimum, which the argument uses, are not among its hypotheses) and
of noise-contrastive estimation (Gutmann–Hyvärinen 2012, Theorem 2, which assumes the uniform
convergence); the asymptotic normality of noise-contrastive estimation (Theorem 3 there) and
its efficiency corollaries; score matching for non-negative data (Hyvärinen 2007, Theorems
3–4); sliced and denoising variants beyond those cited; adversarial training objectives, with
the optimal discriminator between two probability laws and the Jensen–Shannon form of the value.
For `ν = 1`, probability densities and `pn > 0`, the classifier `h` of 4.1 is such a
discriminator between the laws with densities `pd` and `pn`; 4.1 itself allows any `ν > 0` and
densities that are neither normalised nor positive.

## Exact supplier contracts

### From Mathlib

- `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`
  (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean`): on a finite-dimensional space
  with an additive Haar measure, if `f' v · g`, `f · g' v` and `f · g` are integrable, `f` is
  differentiable on `tsupport g` and `g` on `tsupport f`, then `∫ f · g' v = −∫ f' v · g`.
- `InnerProductSpace.laplacian_eq_iteratedFDeriv_orthonormalBasis`
  (`Mathlib/Analysis/InnerProductSpace/Laplacian.lean`): `Δ f x = Σᵢ iteratedFDeriv ℝ 2 f x
  (vᵢ, vᵢ)` for any orthonormal basis `v`; `Laplacian.laplacian`, notation `Δ`
  (`Mathlib/Analysis/Distribution/DerivNotation.lean`); `gradient`
  (`Mathlib/Analysis/Calculus/Gradient/Basic.lean`).
- `measurable_fderiv` (`Mathlib/Analysis/Calculus/FDeriv/Measurable.lean`): `fderiv 𝕜 f` is
  measurable for every `f` (complete target); `IsLocalMin.fderiv_eq_zero`.
- `integral_withDensity_eq_integral_toReal_smul`: for a measurable a.e. finite density `f`,
  `∫ g d(μ.withDensity f) = ∫ (f x).toReal • g x dμ`; `integral_eq_zero_iff_of_nonneg`:
  a nonnegative integrable function has integral `0` iff it is `0` a.e.;
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`: the fundamental theorem of calculus for an
  everywhere differentiable function with interval integrable derivative;
  `Continuous.ae_eq_iff_eq`; `lintegral_prod`.
- `Matrix.PosDef`, `Matrix.PosDef.inv`, `Matrix.mulVec`.
- `ProbabilityTheory.iIndepFun_pi`: coordinates of a finite product of probability measures are
  independent; `ProbabilityTheory.IndepFun.variance_sum`;
  `ProbabilityTheory.meas_ge_le_variance_div_sq` (Chebyshev); `IsCompact.exists_isMinOn`.
- `lintegral_mono`; `ae_eq_of_ae_le_of_lintegral_le`: `f ≤ g` a.e., `∫⁻ f ≠ ∞`, `g`
  a.e.-measurable and `∫⁻ g ≤ ∫⁻ f` give `f = g` a.e.; `ofReal_integral_eq_lintegral_ofReal`;
  `Real.log_le_sub_one_of_pos`; `Real.add_one_le_exp`.

### From TauCetiRoadmap.MathematicalStatisticsAsymptotic

- 1.1, `TendstoInProbability` (copied verbatim): for every `ε > 0` the outer measure of
  `{ω | ε ≤ dist (X i ω) c}` tends to `0` along the filter.
- 5.1, `tendstoInProbability_of_isWellSeparated`: for a metric space `Θ`, criteria `Mn n ω θ`
  and `M θ` with `sup_θ |Mn n ω θ − M θ| → 0` in probability (each supremum bounded above), a
  well-separated maximum of `M` at `θ₀` (for every `ε > 0` some `η > 0` with `M θ ≤ M θ₀ − η`
  when `ε ≤ dist θ θ₀`), and `Mn n ω θ₀ ≤ Mn n ω (θhat n ω) + R n ω` with `R → 0` in
  probability, `θhat → θ₀` in probability.

### From TauCetiRoadmap.RestrictedBoltzmannMachines

- 1.3, `freeEnergy` and `visibleLaw_eq_gibbs_freeEnergy`: the visible law is the Gibbs law of
  `F(v) = −Σⱼ bⱼ vⱼ − Σᵢ log(1 + exp(cᵢ + Σⱼ Wᵢⱼ vⱼ))` (used in a Check of 3.1).

### From TauCetiRoadmap.CurieWeissModel

- 1.1, `cwEnergy` and `curieWeiss`: the Gibbs law with weights `exp(β M²/(2N) + h M)`, spins
  `−1` at `true` (used in a Check of 3.1).

## References

- A. Hyvärinen, *Estimation of non-normalized statistical models by score matching*, Journal of
  Machine Learning Research 6 (2005), 695–709 (open access, jmlr.org): equations (1)–(4),
  pp. 696–698; Theorem 1 and footnote 1, p. 697; Theorem 2 and Corollary 3, p. 698;
  Section 3.1.1, p. 699; Appendices A–B, pp. 706–708.
- A. Hyvärinen, *Some extensions of score matching*, Computational Statistics & Data Analysis 51
  (2007), 2499–2512, doi:10.1016/j.csda.2006.09.003 (author's copy, cs.helsinki.fi): equations
  (12)–(18), pp. 2502–2503; Theorems 1–2, pp. 2502–2503; Section 4.1, p. 2506; Appendices A–B,
  pp. 2508–2510.
- M. U. Gutmann and A. Hyvärinen, *Noise-contrastive estimation of unnormalized statistical
  models, with applications to natural image statistics*, Journal of Machine Learning Research 13
  (2012), 307–361 (open access, jmlr.org): equations (3)–(11), pp. 310–311; Theorem 1, p. 311;
  Theorem 2, p. 312; Appendix A.1–A.3, pp. 341–345.
