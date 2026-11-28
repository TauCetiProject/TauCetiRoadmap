# Roadmap: functional inequalities for strongly log-concave laws

**Summary.** A probability law `π` on `ℝ^d` with density proportional to `exp(−V)` is strongly
log-concave when the potential `V` is `κ`-strongly convex for some `κ > 0`, that is when
`∇²V ≥ κ I` for a twice differentiable `V`. Such laws share with the standard Gaussian law the
functional inequalities that control concentration, transport and the speed of convergence to
equilibrium, with constants that depend on `κ` only and not on the dimension. This roadmap proves
them for an arbitrary strongly convex potential by the optimal-transport route, whose engine is
the convexity of the relative entropy `KL(· ‖ π)` along Wasserstein geodesics.

The main theorems are these.

- *The Bakry–Émery criterion.* If `V` is `κ`-strongly convex with `κ > 0`, then `π` satisfies the
  logarithmic Sobolev inequality `Ent_π(f²) ≤ (2/κ) ∫ ‖∇f‖² dπ` for every continuously
  differentiable `f` that is bounded with a bounded gradient, and hence the Poincaré inequality
  `Var_π(f) ≤ (1/κ) ∫ ‖∇f‖² dπ`. For the standard Gaussian law both constants cannot be improved.
- *Talagrand's inequality and the Otto–Villani theorem.* Under the same hypothesis every
  probability law `ν` satisfies `W₂(ν, π)² ≤ (2/κ) KL(ν ‖ π)`. More generally, a probability law
  `μ` that satisfies a logarithmic Sobolev inequality `Ent(f²) ≤ 2C ∫ ‖∇f‖²` with `C > 0`
  satisfies `W₂(ν, μ)² ≤ 2C KL(ν ‖ μ)` for every `ν`.
- *The HWI inequality.* If `V` is twice continuously differentiable and `κ`-strongly convex for a
  real `κ` of either sign, and `π` has a finite second moment, then
  `KL(ν ‖ π) ≤ W₂(ν, π) √I(ν ‖ π) − (κ/2) W₂(ν, π)²` for every law `ν` with a twice continuously
  differentiable, compactly supported density against `π`, where `I` is the relative Fisher
  information.
- *Exponential decay along the Fokker–Planck equation.* Along a classical positive solution of
  `∂ₜρ = Δρ + div(ρ∇V)` that satisfies explicit integrability conditions, the relative entropy
  has derivative `−I(ρₜ ‖ π)`; if `V` is `κ`-strongly convex with `κ > 0`, it decays like
  `exp(−2κt)`.

Relative entropies and transport distances take values in `[0, ∞]`.

The roadmap builds on the OptimalTransport roadmap and on the part of Tau Ceti that implements
it: the Wasserstein distance, Brenier's theorem, McCann's displacement convexity of the entropy
and the convexity of potential energies are used, not restated. RandomMatrices defines the two
inequalities in the normalisation used here and proves their Gaussian case, which comes out here
as one instance.

Layer 1 below sets up the Gibbs law of a potential, the two inequalities and the relative Fisher
information, and proves that a logarithmic Sobolev inequality implies a Poincaré inequality.
Layer 2 proves Talagrand's inequality, the HWI inequality and, from it, the Bakry–Émery
inequalities. Layer 3 proves the Otto–Villani theorem. Layer 4 proves the entropy dissipation
identity along a classical Fokker–Planck solution and, with Layer 2, its exponential decay.

## Conventions

- **Space.** `E = EuclideanSpace ℝ (Fin d)` for a natural number `d` (possibly `0`), with
  Lebesgue measure `volume`, its Borel σ-algebra and gradient `∇f = gradient f`.
- **Strong convexity.** `V` is `κ`-strongly convex when Mathlib's `StrongConvexOn univ κ V`
  holds: `V((1 − t) x + t y) ≤ (1 − t) V(x) + t V(y) − (κ/2) t (1 − t) ‖x − y‖²` for
  `t ∈ [0, 1]`. For a twice continuously differentiable `V` this is `∇²V(x) ≥ κ I` at every `x`.
  The parameter `κ` is any real number; the theorems that need `κ > 0` say so. For `κ ≥ 0` the
  density `exp(−V)` is then log-concave in the sense of Tau Ceti's `TauCeti.LogConcave`; strong
  log-concavity is the strong convexity of `V`, a stronger condition that predicate does not
  express.
- **Gibbs law.** `gibbsMeasure V` is Mathlib's tilted measure `volume.tilted (−V)`, the law with
  density `exp(−V)/Z`, `Z = ∫ exp(−V) dx`, when `exp(−V)` is integrable, and the zero measure
  otherwise. We write `π` for it.
- **Entropy and transport.** `KL(ν ‖ μ)` is Mathlib's `InformationTheory.klDiv ν μ` in `[0, ∞]`.
  `W₂(ν, μ)` is Tau Ceti's `TauCeti.wassersteinEDist 2 ν μ` in `[0, ∞]`, the distance itself
  (the infimum over couplings of the `L²` norm of `‖x − y‖`); its square is written out. For a
  probability density `h` against `μ`, `Ent_μ(h) = ∫ h log h dμ = KL(h μ ‖ μ)`.
- **Normalisation of the inequalities.** As in RandomMatrices 2.2: the logarithmic Sobolev
  inequality with constant `C` is `Ent_μ(f²) ≤ 2C ∫ ‖∇f‖² dμ`, with
  `Ent_μ(g) = ∫ g log g dμ − (∫ g dμ) log(∫ g dμ)` and `0 log 0 = 0`, and the Poincaré inequality
  with constant `C` is `Var_μ(f) ≤ C ∫ ‖∇f‖² dμ`. Gozlan–Léonard write `LS(C')` for
  `Ent_μ(f²) ≤ C' ∫ ‖∇f‖² dμ` and `T₂(C')` for `W₂² ≤ C' KL`; their `LS(2/κ)` is constant `1/κ`
  here and their `T₂(2/κ)` is `W₂² ≤ (2/κ) KL`.
- **Test functions.** The two inequalities are required for every continuously differentiable
  `f` that is bounded with a bounded gradient. Such `f` is continuous, hence Borel measurable,
  and every integral in the inequalities is finite against a probability measure.
- **Fisher information.** For a positive differentiable density `h` against `μ`, the relative
  Fisher information is `I(h μ ‖ μ) = ∫ ‖∇h‖²/h dμ = ∫ ‖∇ log h‖² d(h μ)` in `[0, ∞]`. With
  `h = f²` for an `f` without zeros it equals `4 ∫ ‖∇f‖² dμ`, so for such `h` with `∫ h dμ = 1`
  the logarithmic Sobolev inequality with constant `C` reads `KL(h μ ‖ μ) ≤ (C/2) I(h μ ‖ μ)`.
- **Fokker–Planck equation.** The equation is `∂ₜρ = Δρ + div(ρ∇V)` for a Lebesgue density `ρ`,
  the normalisation of OptimalTransport 11.7 and 11.9, whose stationary law is `π`. For the
  density `h = dρ/dπ` against `π` it reads `∂ₜh = Δh − ⟪∇V, ∇h⟫`, the generator `Δ − ∇V·∇` of
  OptimalTransport 11.9. It is the law equation of `dX = −∇V(X) dt + √2 dB`.

## Layer 1: Gibbs laws, the two inequalities and relative Fisher information

### 1.1 Gibbs laws

Define `gibbsMeasure V` as in the Conventions. Prove `integrable_exp_neg_of_strongConvexOn`: if
`V` is `κ`-strongly convex with `κ > 0`, then `exp(−V)` is integrable, so `gibbsMeasure V` is a
probability measure (Mathlib `isProbabilityMeasure_tilted`). (Proved here.)

- Route: a convex function on `ℝ^d` that is finite everywhere is continuous; `V − (κ/2)‖·‖²` is
  convex, hence bounded below by an affine function, so `V(x) ≥ a + (κ/4)‖x‖²` for some `a`.
- The same bound gives `∫ exp(λ‖x‖²) dπ < ∞` for every `λ < κ/4`, so `π` has moments of every
  order; this is used in the route of 2.1.

**Checks.**
- For `V(x) = (κ/2)‖x‖²` the normalising constant is `Z = (2π/κ)^(d/2)` and `π` is the centred
  Gaussian law with covariance `κ⁻¹ I`. For `κ = 1` it is the standard Gaussian law: Tau Ceti's
  `TauCeti.Probability.stdGaussian_eq_withDensity_norm` gives its density
  `(2π)^(−d/2) exp(−‖x‖²/2)`, and `Z = (2π)^(d/2)` (numerically `2.5066` for `d = 1` and
  `6.2832` for `d = 2`).
- `κ > 0` cannot be replaced by `κ = 0`: `V = 0` is convex, `exp(−V)` is not integrable for
  `d ≥ 1`, and `gibbsMeasure 0` is the zero measure. Strong convexity is sufficient and not
  necessary: `V(x) = ‖x‖` is not strongly convex and `exp(−V)` is integrable.
- For `d = 0` the space is a point, every `V` is `κ`-strongly convex for every `κ`, and the Gibbs
  law is the Dirac mass.

*Needs:* Mathlib `MeasureTheory.Measure.tilted`, `isProbabilityMeasure_tilted`,
`StrongConvexOn`.

### 1.2 The logarithmic Sobolev and Poincaré inequalities

Define `LogSobolevInequality μ C` and `PoincareInequality μ C` for a measure `μ` on `E` and a real
`C`, in the normalisation of the Conventions, for the test functions of the Conventions. These are
the definitions of RandomMatrices 2.2 (logarithmic Sobolev and Poincaré inequalities), which
states them in prose, without a class of test functions and without a Lean definition; they are
written out here with the class of the Conventions so that they can be stated, and are not new
notions.

Prove `LogSobolevInequality.poincareInequality`: for a probability measure `μ`, the logarithmic
Sobolev inequality with constant `C` implies the Poincaré inequality with the same constant.

Route: for a test function `g` and small `ε`, `f = 1 + εg` is a test function, and expanding
`Ent_μ((1 + εg)²) = 2ε² Var_μ(g) + O(ε³)` (the constant in `O` depending on a bound for `g`)
against `2C ε² ∫ ‖∇g‖² dμ` and letting `ε → 0` gives the claim. (Proved here; the linearisation
is classical.)

**Checks.**
- Under the standard Gaussian law on `ℝ` with `g(x) = x` (here unbounded, so the computation
  tests the expansion and not the class), `Ent((1 + εx)²)/(2ε²)` equals `0.994983` at `ε = 0.1`,
  `0.999950` at `ε = 0.01` and `0.999999` at `ε = 0.001`, tending to `Var(x) = 1`.
- The two-point law `(δ₀ + δ₁)/2` on `ℝ` satisfies no Poincaré inequality: a smooth bounded `f`
  with bounded derivative, equal to `0` near `0` and to `1` near `1`, has variance `1/4` and
  gradient `0` at both atoms. By the theorem it satisfies no logarithmic Sobolev inequality
  either.
- For `d = 0` every gradient is `0` and every variance and entropy is `0`, so both inequalities
  hold for every `C`, in agreement with the theorem. For `d ≥ 1` and a probability measure `μ`,
  no logarithmic Sobolev inequality with `C < 0` holds: `f(x) = arctan ⟪e, x⟫` with `‖e‖ = 1` is
  a test function whose gradient never vanishes, so the right side is negative while
  `Ent_μ(f²) ≥ 0`.
- The factor `2` matters: the Gaussian law satisfies `Ent(f²) ≤ 2 ∫ f'²` (constant `C = 1` here)
  but not `Ent(f²) ≤ ∫ f'²`; see the Checks of 2.3.

*Needs:* RandomMatrices 2.2 (the definitions); Mathlib `ProbabilityTheory.variance`, `gradient`,
`ContDiff`.

### 1.3 Relative Fisher information

Define `relativeFisherInformation μ h = ∫⁻ x, ENNReal.ofReal (‖∇h x‖² / h x) ∂μ`, the Fisher
information `I(h μ ‖ μ)` of the law with density `h` against `μ`, in `[0, ∞]`. It is meant for
positive differentiable `h`; at a point where `h = 0` the integrand is `0` by the convention
`a / 0 = 0`.

- For `h = f²` with `f` a test function that does not vanish, `I(h μ ‖ μ) = 4 ∫ ‖∇f‖² dμ`.
- For `μ = volume`, `relativeFisherInformation volume p` has the body of the Fisher information
  of a Lebesgue density of DifferentialEntropyAndEntropyPower 2.1. This roadmap uses the
  definition only with a probability measure as reference, where it is a different object (Check
  below; see Scope and ownership).

**Checks.**
- `I(π ‖ π) = 0` (take `h = 1`), while the Fisher information of the density `φ` of `π = N(0, 1)`
  against Lebesgue measure, `∫ φ'²/φ dx`, is `1`: the relative information of a law is not the
  Fisher information of its Lebesgue density.
- For `π = N(0, κ⁻¹ I)` and the translate `ν = N(a, κ⁻¹ I)`, the density is
  `h(x) = exp(κ⟪a, x⟫ − κ‖a‖²/2)`, `∇ log h = κa`, and `I(ν ‖ π) = κ²‖a‖²`; numerically `1.0000`
  for `κ = 2`, `a = 1/2` in dimension `1`.

*Needs:* Mathlib `gradient`, `MeasureTheory.lintegral`.

### Examples

For `V(x) = κ‖x‖²/2` the Gibbs law is `N(0, κ⁻¹ I)`; for `V(x) = x²/2 + x⁴/4` on `ℝ` it is a
non-Gaussian law with `κ = 1`, whose variance is `0.4679`.

### Dependencies

RandomMatrices 2.2 (the normalisation of the inequalities); Mathlib `Measure.tilted`,
`isProbabilityMeasure_tilted`, `StrongConvexOn`, `ProbabilityTheory.variance`, `gradient`;
Tau Ceti `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (a Check). No other layer.

## Layer 2: displacement convexity and the Bakry–Émery inequalities

### 2.1 Talagrand's transport inequality

Prove `wassersteinEDist_sq_le_klDiv_gibbsMeasure`: if `V` is `κ`-strongly convex with `κ > 0`,
then for every probability measure `ν` on `E`,

    W₂(ν, π)² ≤ (2/κ) KL(ν ‖ π)   in [0, ∞]

(Gozlan–Léonard, Corollary 7.2, p. 32, for `V` of class `C²`; for the standard Gaussian law on
`ℝ`, Theorem 1.5, p. 6, due to Talagrand). No smoothness of `V` is assumed: the route below uses
only strong convexity.

Route.
- If `KL(ν ‖ π) = ∞` there is nothing to prove. Otherwise `ν` has a finite second moment, by the
  Donsker–Varadhan formula (Tau Ceti `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`) with
  the bounded functions `λ min(‖x‖², M)`, `λ < κ/4`, and the moments of 1.1; and `V` is
  `ν`-integrable.
- Let `d ≥ 1` (for `d = 0` both sides are `0`). `π` is absolutely continuous, so Brenier's
  theorem (Tau Ceti
  `TauCeti.exists_isKantorovichOptimalTransportMap_gradient`) gives an optimal map `∇u` from `π`
  to `ν` for the cost `‖x − y‖²/2`, and `νₜ = ((1 − t) id + t ∇u)₊ π` is the displacement
  interpolation, with `∫ ‖x − ∇u(x)‖² dπ = W₂(π, ν)²`.
- Along `νₜ`, the Boltzmann entropy against Lebesgue measure is convex (McCann's condition for
  `r log r`: Tau Ceti `TauCeti.internalEnergy_map_smul_add_smul_gradient_le`), and the potential
  energy `∫ V dνₜ` is `κ`-convex (Tau Ceti `StrongConvexOn.potentialEnergy_map_le`, applied to the
  graph plan of `∇u`). By the change of reference `KL(· ‖ π) = Ent + ∫ V + log Z` (Tau Ceti
  `TauCeti.klDiv_tilted_eq_boltzmannEntropy`), `KL(νₜ ‖ π) ≤ t KL(ν ‖ π) − (κ/2) t (1 − t) W₂²`.
  This `κ`-convexity of the relative entropy is the displacement convexity of the Fokker–Planck
  energy `Ent + ∫ V` that OptimalTransport 11.5 and 11.7 (item 2) state; at the pins it is
  assembled from the three theorems above.
- Since `KL(νₜ ‖ π) ≥ 0`, dividing by `t` and letting `t → 0` gives `(κ/2) W₂² ≤ KL(ν ‖ π)`.

**Checks.**
- Equality on translates: for `π = N(0, κ⁻¹ I)` and `ν = N(a, κ⁻¹ I)`, `W₂² = ‖a‖²` and
  `KL = κ‖a‖²/2`, so both sides equal `‖a‖²` (numerically, in dimension `1`, `0.09`, `1` and `4`
  for `a = 0.3, 1, 2` and each of `κ = 0.5, 1, 3`). The constant `1/κ` in place of `2/κ` would
  give `‖a‖²/2 < ‖a‖²`: the constant is sharp.
- Dilations are strict: for `π = N(0, 1)` and `ν = N(0, s²)`, `W₂² = (s − 1)²` and
  `2 KL = s² − 1 − 2 log s`; at `s = 2` these are `1` and `1.6137`, at `s = 1/2` they are `0.25`
  and `0.6363`.
- A non-Gaussian law: for `V(x) = x²/2 + x⁴/4` on `ℝ` (`κ = 1`) and `ν` its translate by `a`,
  `W₂² = a²` against `2 KL = 0.6322` at `a = 0.5` and `7.9397` at `a = 1.5`.
- For `d ≥ 1` a law `ν` that is not absolutely continuous, such as a Dirac mass, has
  `KL(ν ‖ π) = ∞` and the inequality holds trivially, which is why no hypothesis on `ν` is needed.

*Needs:* 1.1; Tau Ceti `TauCeti.wassersteinEDist`,
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`,
`TauCeti.internalEnergy_map_smul_add_smul_gradient_le`,
`StrongConvexOn.potentialEnergy_map_le`, `TauCeti.klDiv_tilted_eq_boltzmannEntropy`,
`TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`; OptimalTransport 9.5 and 11.2 (the
specification those declarations implement).

### 2.2 The HWI inequality

Prove `klDiv_le_hwi`: let `V` be twice continuously differentiable and `κ`-strongly convex for a
real `κ` (zero and negative values allowed), with `exp(−V)` integrable and
`∫ ‖x‖² dπ < ∞`. Let `f` be nonnegative, twice continuously differentiable and compactly
supported, with `∫ f dπ = 1`, and `ν = f π`. Then `KL(ν ‖ π)`, `W₂(ν, π)` and `I(ν ‖ π)` are
finite and

    KL(ν ‖ π) ≤ W₂(ν, π) √I(ν ‖ π) − (κ/2) W₂(ν, π)²

(Gozlan–Léonard, Corollary 7.4, p. 33, due to Otto and Villani, for nonnegative smooth compactly
supported `f`). The second-moment hypothesis is not in the source: it holds automatically for
`κ > 0` (1.1), and it is added because the statement here is between real numbers, which needs
`W₂(ν, π)` finite; the source's inequality in `[0, ∞]` is trivial when `W₂(ν, π) = ∞` and `κ < 0`
(see the Checks).

- Finiteness: `f` is bounded, so `KL(ν ‖ π) = ∫ f log f dπ` is finite; `ν` has compact support
  and `π` a finite second moment, so `W₂(ν, π)` is finite; and a nonnegative `C²` function with
  bounded second derivative `M` satisfies `‖∇f‖² ≤ 2M f`, so `I(ν ‖ π) ≤ 2M`.

Route. Let `T = id + ∇θ` be the Brenier map from `ν` to `π` (Tau Ceti
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`), so that `W₂(ν, π)² = ∫ ‖∇θ‖² dν`.
The case `g = 1` of Cordero-Erausquin's inequality gives
`KL(ν ‖ π) ≤ −∫ ⟪∇f, ∇θ⟫ dπ − (κ/2) ∫ ‖∇θ‖² dν`. Gozlan–Léonard, Theorem 7.1, p. 31, state that
inequality for compactly supported `g`; they use its case `g = 1`, where `log g ∘ T = 0`, in
(32), p. 33, and the outline of the proof on p. 32 applies to it. The proof takes logarithms in
the Monge–Ampère equation of `T`, uses `V(x + ∇θ) − V(x) ≥ ⟪∇V(x), ∇θ⟫ + (κ/2)‖∇θ‖²` and
`log det(I + ∇²θ) ≤ Δθ` for the Alexandrov Hessian, and integrates by parts against the
compactly supported `f`. The Cauchy–Schwarz inequality
`−∫ ⟪∇ log f, ∇θ⟫ dν ≤ W₂(ν, π) √I(ν ‖ π)` concludes. Equivalently, the inequality is the
`κ`-convexity of `KL(· ‖ π)` along the geodesic from `ν` to `π` (as in 2.1) combined with the
first variation of the entropy at the smooth law `ν`, whose gradient is `∇ log f` (OptimalTransport
11.5). (Proved here, following the cited outline.)

**Checks.**
- Gaussian translates: for `π = N(0, κ⁻¹ I)` and `ν = N(a, κ⁻¹ I)`, `KL = κ‖a‖²/2`,
  `W₂ = ‖a‖` and `I = κ²‖a‖²`, so the right side is `κ‖a‖² − κ‖a‖²/2` and the two sides are
  equal. These laws are not compactly supported; approximating them by laws with compactly
  supported smooth densities shows that the coefficient `κ/2` cannot be raised.
- Compactly supported densities, computed by quadrature in dimension `1` with
  `f ∝ (1 − x²)⁴` on `[−1, 1]`: for `V = x²/2` (`κ = 1`), `KL = 0.7815`, `W₂ = 0.7092`,
  `I = 10.667` and the right side is `2.0647`; for `V = x⁴/4 − x²/2`, whose second derivative
  `3x² − 1` is at least `−1` (`κ = −1`), `KL = 1.0814` and the right side is `2.8412`.
- The second-moment hypothesis cannot be dropped when `κ < 0`: `V(x) = (3/2) log(1 + x²)` on `ℝ`
  has `V'' = 3(1 − x²)/(1 + x²)² ≥ −3/8` and `exp(−V) = (1 + x²)^(−3/2)` integrable, but
  `∫ x² (1 + x²)^(−3/2) dx = ∞` (the integral over `[0, L]` grows like `log L`: `4.30`, `8.90`,
  `13.51` for `L = 10², 10⁴, 10⁶`). Then `W₂(ν, π) = ∞` for every compactly supported `ν`, its
  real part `ENNReal.toReal ∞` is `0`, and the statement would claim `KL(ν ‖ π) ≤ 0`, false for
  `ν ≠ π`. For `κ > 0` the hypothesis holds by 1.1.
- `f = 1` (`ν = π`) is excluded unless `π` has compact support, which never happens for
  `d ≥ 1`; in dimension `0`, `f = 1` and all three quantities are `0`.

*Needs:* 1.1, 1.3; Tau Ceti `TauCeti.exists_isKantorovichOptimalTransportMap_gradient`,
`TauCeti.wassersteinEDist`; OptimalTransport 5.5 (Brenier's theorem), 6.6 (the Jacobian equation
of a Brenier map) and 11.5 (the first variation of the entropy).

### 2.3 The Bakry–Émery logarithmic Sobolev inequality

Prove `logSobolevInequality_gibbsMeasure`: if `V` is `κ`-strongly convex with `κ > 0`, then
`π = gibbsMeasure V` satisfies the logarithmic Sobolev inequality with constant `1/κ`, that is
`Ent_π(f²) ≤ (2/κ) ∫ ‖∇f‖² dπ` for every test function `f` (Gozlan–Léonard, Corollary 7.3,
p. 32, for `V` of class `C²`; Bakry and Émery, Corollaire 2, for a diffusion generator satisfying
their curvature condition, with hypercontractivity in place of the inequality, the two being
equivalent by their Proposition 4).

Route.
- For `V` of class `C²` and `f` nonnegative, `C²` and compactly supported with `∫ f dπ = 1`, 2.2
  and `W √I − (κ/2) W² ≤ I/(2κ)` give `KL(f π ‖ π) ≤ I(f π ‖ π)/(2κ)`.
- A test function `g` is approximated by `hₙ = cₙ (gₙ² + εₙ) ψₙ²`, with `gₙ` a mollification of
  `g`, `εₙ → 0`, `ψₙ` smooth cut-offs equal to `1` on growing balls with gradients bounded by a
  multiple of `1/n`, and `cₙ` the normalising constants; by dominated convergence
  `Ent_π(hₙ)/cₙ → Ent_π(g²)` and `I(hₙ π ‖ π)/cₙ → 4 ∫ ‖∇g‖² dπ`, which gives the inequality for
  `g` with `I/(2κ) = (2/κ) ∫ ‖∇g‖²`.
- For a strongly convex `V` that is not `C²`, the mollifications `V ∗ φ_ε` are smooth and
  `κ`-strongly convex, are bounded below by a common quadratic, and converge to `V` locally
  uniformly; for a fixed test function every integral in the inequality converges by dominated
  convergence.

**Checks.**
- The Gaussian case: for `V(x) = ‖x‖²/2` (`κ = 1`), `π` is the standard Gaussian law (1.1) and the
  statement is the Gaussian logarithmic Sobolev inequality with constant `1` of RandomMatrices 2.2.
- Equality on exponentials: for `π = N(0, κ⁻¹)` on `ℝ` and `f(x) = exp(ax/2)` (unbounded, so
  this tests the constant through bounded truncations of `f`),
  `Ent_π(f²) = (a²/(2κ)) exp(a²/(2κ))` and `(2/κ) ∫ f'² dπ` is the same number: `0.321006` for
  `κ = 1/2`, `a = 1/2` and for `κ = 2`, `a = 1`. A constant `C < 1/κ` would fail on these
  functions.
- A non-Gaussian law: for `V(x) = x²/2 + x⁴/4` (`κ = 1`) the ratio `Ent_π(f²)/(2 ∫ f'² dπ)` for
  `f(x) = exp(ax/2)` is `0.4603`, `0.4394` and `0.3769` for `a = 0.5, 1, 2`, below `1/κ = 1`.

*Needs:* 1.1, 1.2, 1.3, 2.2; Mathlib `HasCompactSupport`, `ContDiff` and convolution with a
mollifier (`HasCompactSupport.contDiff_convolution_left`).

### 2.4 The Poincaré inequality

If `V` is `κ`-strongly convex with `κ > 0`, then `π` satisfies the Poincaré inequality with
constant `1/κ`, that is `Var_π(f) ≤ (1/κ) ∫ ‖∇f‖² dπ` for every test function `f`. This is
`LogSobolevInequality.poincareInequality` (1.2) applied to `logSobolevInequality_gibbsMeasure`
(2.3), `π` being a probability measure by 1.1, and is not stated separately in `Suggested.lean`.
It also follows from 2.1 by Gozlan–Léonard, Proposition 8.11, p. 41, which turns `T₂(2/κ)` into
the Poincaré inequality with constant `1/κ`.

**Checks.**
- For `π = N(0, κ⁻¹ I)` and `f(x) = ⟪e, x⟫` with `‖e‖ = 1` (unbounded, so a check of sharpness by
  truncation), `Var_π(f) = 1/κ = (1/κ) ∫ ‖∇f‖² dπ`: equality, `0.5` for `κ = 2`. For `κ = 1`
  this is the Gaussian Poincaré inequality of RandomMatrices 2.2.
- For `V(x) = x²/2 + x⁴/4` the variance of `x` is `0.4679 < 1`.

*Needs:* 1.1, 1.2, 2.3.

### Examples

The Gaussian laws `N(0, κ⁻¹ I)` give equality in 2.1, 2.3 and 2.4 on translates, on
exponentials and on linear functions (the last two through bounded truncations); the law with
potential `x²/2 + x⁴/4` satisfies all three strictly on the same functions.

### Dependencies

Layer 1; Tau Ceti `TauCeti.wassersteinEDist`,
`TauCeti.exists_isKantorovichOptimalTransportMap_gradient`,
`TauCeti.internalEnergy_map_smul_add_smul_gradient_le`, `StrongConvexOn.potentialEnergy_map_le`,
`TauCeti.klDiv_tilted_eq_boltzmannEntropy`, `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`;
OptimalTransport 5.5, 6.6, 9.5, 11.2 and 11.5.

## Layer 3: from the logarithmic Sobolev inequality to transport

### 3.1 The Otto–Villani theorem

Prove `wassersteinEDist_sq_le_klDiv_of_logSobolevInequality`: let `μ` be a probability measure on
`E` that satisfies the logarithmic Sobolev inequality with a constant `C > 0`. Then for every
probability measure `ν`,

    W₂(ν, μ)² ≤ 2C KL(ν ‖ μ)   in [0, ∞]

(Gozlan–Léonard, Theorem 8.12, p. 42, for every probability measure on `ℝ^k`, with their `LS(2C)`
and `T₂(2C)`; first proof, pp. 42–43, due to Bobkov, Gentil and Ledoux). The hypothesis `C > 0`
is theirs and cannot be dropped (Check below).

Route.
- Reduction to an absolutely continuous `μ`. For `ε > 0` let `μ_ε = μ ∗ N(0, εI)`, the image of
  `μ ⊗ N(0, C I)` under `(x, y) ↦ x + √(ε/C) y`. The product satisfies the inequality with
  constant `C` (tensorization and the Gaussian case, RandomMatrices 2.2, the Gaussian law with
  covariance `C I` having constant `C`), and composing a test function with that map multiplies
  `‖∇f‖²` by `1 + ε/C`, so `μ_ε` satisfies it with constant `C + ε`; and `μ_ε` is absolutely
  continuous. The same Gaussian kernel does not increase the divergence,
  `KL(ν ∗ N(0, εI) ‖ μ_ε) ≤ KL(ν ‖ μ)` (Mathlib `InformationTheory.klDiv_comp_right_le`), and moves
  each law by at most `√(dε)` in `W₂` (the coupling `(X, X + √ε G)`). The case of `μ_ε` and the
  triangle inequality (Tau Ceti `TauCeti.wassersteinEDist_triangle`) give
  `W₂(ν, μ) ≤ 2√(dε) + (2(C + ε) KL(ν ‖ μ))^(1/2)`, and `ε → 0` concludes. It remains to treat an
  absolutely continuous `μ`.
- Extension of the inequality to bounded Lipschitz functions, the extension from smooth to
  Lipschitz functions that RandomMatrices 2.2 states; for an absolutely continuous `μ` it reads:
  for a bounded Lipschitz `F` the mollifications `F ∗ φ_ε` are test functions with gradients
  bounded by the Lipschitz constant, converging uniformly to `F`, with gradients converging to
  `∇F` at every Lebesgue point of `∇F`, hence Lebesgue-almost everywhere and so `μ`-almost
  everywhere, and dominated convergence gives the inequality for `F` with `∇F` the gradient where
  it exists (Rademacher).
- For `g` bounded and Lipschitz and `t > 0` let `Qₜg(x) = inf_y (g(y) + ‖x − y‖²/(2Ct))`, the
  Hopf–Lax function (Tau Ceti `TauCeti.hopfLax` with the Lagrangian `‖w‖²/(2C)`); it is bounded
  and Lipschitz, and its subsolution inequality (Tau Ceti `TauCeti.hopfLax_add_add_smul_le`) gives
  `∂ₜQₜg + (C/2) ‖∇Qₜg‖² ≤ 0` where `(t, x) ↦ Qₜg(x)` is differentiable, which is almost
  everywhere, hence for almost every `t` at `μ`-almost every `x`.
- With `Zₜ = ∫ exp(t Qₜg) dμ`, the inequality applied to `exp(t Qₜg/2)` and the subsolution
  inequality give `t Zₜ' − Zₜ log Zₜ ≤ 0`, so `t ↦ (log Zₜ)/t` is nonincreasing and
  `log ∫ exp(Q₁g) dμ ≤ ∫ g dμ`. This is the Bobkov–Götze dual form of
  `W₂(ν, μ)² ≤ 2C KL(ν ‖ μ)`, which follows by Kantorovich duality for the quadratic cost and the
  Donsker–Varadhan formula (Tau Ceti `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`).

**Checks.**
- With 2.3 and `C = 1/κ` the theorem gives `W₂² ≤ (2/κ) KL` for `π`, the inequality of 2.1, with
  the same constant: the two routes agree.
- `C > 0` cannot be dropped: the Dirac mass `δ₀` on `ℝ` satisfies the inequality with `C = 0`
  (every entropy is `0`), while `W₂(δ₁, δ₀)² = 1` and `2C KL(δ₁ ‖ δ₀) = 0 · ∞ = 0`. For an
  absolutely continuous `μ` and `d ≥ 1` the hypothesis is automatic: `f(x) = arctan ⟪e, x⟫` with
  `‖e‖ = 1` is a test function with `f²` not `μ`-almost everywhere constant, so `Ent_μ(f²) > 0`
  and the inequality forces `C > 0`. For `d = 0` both sides of the conclusion are `0`.

*Needs:* 1.2; RandomMatrices 2.2 (tensorization, the Gaussian case, the extension to Lipschitz
functions); Tau Ceti `TauCeti.hopfLax`, `TauCeti.hopfLax_add_add_smul_le`,
`TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_triangle`,
`TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`; Mathlib
`InformationTheory.klDiv_comp_right_le`; OptimalTransport 2.4 (Kantorovich duality) and 3.1 (the
Wasserstein distance).

### Examples

For `π = N(0, I)`, 3.1 with the Gaussian constant `C = 1` of RandomMatrices 2.2 is Talagrand's
`W₂² ≤ 2 KL`; for every strongly log-concave law it recovers 2.1 from 2.3.

### Dependencies

Layer 1; RandomMatrices 2.2; Tau Ceti `TauCeti.hopfLax`, `TauCeti.hopfLax_add_add_smul_le`,
`TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_triangle`,
`TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp`; Mathlib
`InformationTheory.klDiv_comp_right_le`; OptimalTransport 2.4 and 3.1. It does not use Layer 2.

## Layer 4: relative entropy along the Fokker–Planck equation

### 4.1 Classical solutions and entropy dissipation

Define `IsClassicalFokkerPlanckFlow V h I` for a potential `V`, a function `h : ℝ → E → ℝ` (the
density `h t` of the law at time `t` against `π = gibbsMeasure V`) and a set of times `I`: `I` is
open; `(t, x) ↦ h t x` is twice continuously differentiable on `I × E`; `h t x > 0`;
`∫ h t dπ = 1`; `∂ₜ h = Δ(h t) − ⟪∇V, ∇(h t)⟫` at every `(t, x)` with `t ∈ I`; and, for every
`t ∈ I`, the functions `h log h`, `‖∇h‖ |log h + 1|` and `‖∇h‖²/h` are `π`-integrable, and
`|(Δh − ⟪∇V, ∇h⟫)(log h + 1)|` is bounded, for all times near `t`, by a `π`-integrable function
of `x`. These are the hypotheses the route below uses: the domination near each time
differentiates the entropy under the integral, and with the two integrability conditions it
justifies the integration by parts. The hypothesis
`∫ h t dπ = 1` cannot hold when `π` is the zero measure, so `exp(−V)` is integrable for every
such flow. The existence of such flows from given initial data is not a target here.

Prove `hasDerivAt_klDiv_of_isClassicalFokkerPlanckFlow`: if `V` is continuously differentiable,
then along such a flow `t ↦ KL(h t π ‖ π)` is real-valued and has derivative `−I(h t π ‖ π)` at
every `t ∈ I` (van Handel, Theorem 3.20, p. 63, the first display of its proof, in semigroup
form; proved here in this form).

Route.
- `KL(h t π ‖ π) = ∫ h t log h t dπ`, finite by hypothesis. Differentiating under the integral
  (Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`) gives the derivative
  `∫ (Δh − ⟪∇V, ∇h⟫)(log h + 1) dπ`.
- With `G = exp(−V) (log h + 1) ∇h`, a continuously differentiable field,
  `div G = exp(−V) ((Δh − ⟪∇V, ∇h⟫)(log h + 1) + ‖∇h‖²/h)`. Both `G` and `div G` are Lebesgue
  integrable by the hypotheses, so `∫ div G dx = 0`: integrate `div G` against cut-offs `χ(x/R)`,
  move the derivative to the cut-off (Mathlib `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`,
  the cut-off having compact support), and let `R → ∞`. Hence the derivative is
  `−∫ ‖∇h‖²/h dπ = −I(h t π ‖ π)`.

**Checks.**
- Gaussian translates: for `V(x) = κ‖x‖²/2`, `h t x = exp(κ⟪aₜ, x⟫ − κ‖aₜ‖²/2)` with
  `aₜ = exp(−κt) a` solves the equation: both `∂ₜh` and `Δh − ⟪κx, ∇h⟫` equal
  `κ²⟪aₜ, aₜ − x⟫ h`. Its entropy is `κ‖aₜ‖²/2`, its Fisher information `κ²‖aₜ‖²`, and
  `d/dt (κ‖aₜ‖²/2) = −κ²‖aₜ‖²`.
  Numerically, for `κ = 1.5`, `a = 1.2` in dimension `1`: at `t = 0`, `0.4`, `1` the central
  difference of the entropy is `−3.24000`, `−0.975869`, `−0.161310`, equal to `−I`.
- The stationary flow `h = 1` has `KL = 0` and `I = 0`.
- The direction of time matters: with `aₜ = exp(κt) a` the same family solves
  `∂ₜh = −(Δh − ⟪∇V, ∇h⟫)`, the equation run backwards, and its entropy increases.

*Needs:* 1.1, 1.3; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`, the Laplacian `Δ` of
`Mathlib/Analysis/InnerProductSpace/Laplacian.lean`, `InformationTheory.klDiv`.

### 4.2 Exponential decay of the relative entropy

Prove `klDiv_le_exp_mul_klDiv_of_isClassicalFokkerPlanckFlow`: if `V` is continuously
differentiable and `κ`-strongly convex with `κ > 0`, then along a flow as in 4.1 on `I = (0, ∞)`,

    KL(h t π ‖ π) ≤ exp(−2κ(t − s)) KL(h s π ‖ π)   for 0 < s ≤ t, in [0, ∞]

(van Handel, Theorem 3.20, pp. 63–64, implication 1 ⇒ 2, in semigroup form; the constant `1/(2κ)`
of the entropy form of 2.3 is his `c`).

Route.
- By 2.3 in the entropy form of the Conventions, `KL(h π ‖ π) ≤ I(h π ‖ π)/(2κ)` for every test
  density; for the densities `h t`, which are positive, `C²` and have finite entropy and Fisher
  information but need not be bounded, it extends by the approximation of 2.3 (truncate `√h t`
  smoothly at height `n`, cut off at radius `n`, and pass to the limit with Fatou's lemma on the
  entropy side and dominated convergence on the Fisher side).
- With 4.1, `F(t) = KL(h t π ‖ π)` satisfies `F' = −I ≤ −2κ F` on `(0, ∞)`, so
  `t ↦ exp(2κt) F(t)` is nonincreasing there.

**Checks.**
- The Gaussian translates of 4.1 give equality: `KL(h t π ‖ π) = κ‖a‖² exp(−2κt)/2`. Numerically,
  for `κ = 1.5` and `a = 1.2`, `1.08` at `t = 0`, `0.325290` at `t = 0.4` and `0.053770` at
  `t = 1`, equal to `exp(−3t) · 1.08`: the rate `2κ` cannot be improved.
- The normalisation of the equation matters: with the generator `(1/2)(Δ − ⟪∇V, ∇·⟫)`, the
  translate moves like `exp(−κt/2) a` and the entropy decays like `exp(−κt)`; at `κ = 1.5`,
  `t = 1` the ratio is `0.2231` instead of `exp(−3) = 0.0498`.

*Needs:* 2.3, 4.1.

### Examples

For `V(x) = κ‖x‖²/2` and an initial law `N(a, κ⁻¹ I)` the flow stays Gaussian with mean
`exp(−κt) a`, its entropy is `κ‖a‖² exp(−2κt)/2` and its Fisher information `κ²‖a‖² exp(−2κt)`.

### Dependencies

Layers 1 and 2 (2.3 only, for 4.2); Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable`, the Laplacian, `InformationTheory.klDiv`.

## Scope and ownership

This roadmap owns: the integrability of `exp(−V)` for a strongly convex `V` (1.1); the passage
from the logarithmic Sobolev inequality to the Poincaré inequality (1.2); the relative Fisher
information against a probability reference measure (1.3); Talagrand's inequality for strongly
log-concave laws (2.1); the HWI inequality (2.2); the Bakry–Émery logarithmic Sobolev inequality
for a general strongly convex potential and its Poincaré consequence (2.3, 2.4); the Otto–Villani
theorem
(3.1); and the entropy dissipation identity and exponential decay of the relative entropy along
classical solutions of the Fokker–Planck equation (4.1, 4.2).

Already in the libraries and therefore not targets: tilted measures (Mathlib); the
Kullback–Leibler divergence and its Donsker–Varadhan formula (Mathlib and Tau Ceti); the
Wasserstein distance, Brenier's theorem, McCann's displacement convexity of internal energies,
the convexity of the potential energy of a strongly convex potential along interpolations of
plans, the Boltzmann entropy and its change of reference to a Gibbs measure, the triangle
inequality of the Wasserstein distance, and the Hopf–Lax formula with its subsolution inequality
(Tau Ceti, the formalization behind OptimalTransport); the data-processing inequality of the
divergence under a Markov kernel (Mathlib); log-concave functions (Tau Ceti `TauCeti.LogConcave`,
which expresses log-concavity of `exp(−V)` and not the strong convexity of `V` used here).

Stated by other roadmaps and consumed, not restated:

- RandomMatrices 2.2 defines the logarithmic Sobolev and Poincaré inequalities in the
  normalisation used here and owns their tensorization, the Gaussian inequalities with constant
  `1`, Herbst's argument, the extension from smooth to Lipschitz functions and Lipschitz
  concentration under a logarithmic Sobolev inequality; the route of 3.1 uses the first, second
  and fourth of these. The
  definitions are written out in `Suggested.lean` with the class of test functions of the
  Conventions, because RandomMatrices has no Lean definition of them. The Gaussian case of 2.3
  and 2.4 is the Gaussian inequality of RandomMatrices 2.2, said in the Checks of 2.3 and 2.4;
  2.3 and 2.4 differ in holding for every strongly convex potential. Gaussian concentration for
  Lipschitz functions under a strongly log-concave law follows from 2.3 and RandomMatrices 2.2
  and is not restated.
- OptimalTransport owns the Boltzmann entropy (11.2), displacement convexity and the potential
  and internal energies (9.3, 9.5), the convexity of the Fokker–Planck energy `Ent + ∫ V` (11.5,
  11.7 item 2), the curvature-dimension condition of a smooth weighted space (14.6), the
  Fokker–Planck equation as a Wasserstein gradient flow and its Markov semigroup with invariant
  law `π` and contraction `W₂(μₜ, νₜ) ≤ exp(−κt) W₂(μ₀, ν₀)` (11.7, 11.9), and the Bakry–Émery
  gradient estimate on `RCD(K, ∞)` spaces (14.7). None of these is restated. OptimalTransport
  10.3 proves that an evolution variational inequality implies the energy-dissipation identity,
  and 11.9 states energy dissipation for the Fokker–Planck flows that 11.7 constructs, in that
  metric form, with the slope of the energy as the dissipation. 4.1 here is a different
  statement: the classical identity `d/dt KL(ρₜ ‖ π) = −I(ρₜ ‖ π)`, with the relative Fisher
  information as the dissipation, for a classical solution taken as given data with explicit
  hypotheses. The existence of such a solution, its identification with the flow or the
  semigroup of OptimalTransport 11.7 and 11.9, and the identification of the slope with the
  Fisher information are not stated here. OptimalTransport names no logarithmic Sobolev,
  Talagrand, HWI or Otto–Villani statement.
- DifferentialEntropyAndEntropyPower 2.1 defines the Fisher information of a Lebesgue density,
  `∫ ‖∇p‖²/p dx`, and `relativeFisherInformation volume p` has the same body. The kept variant
  differs in its reference measure: this roadmap uses it only against a probability measure `π`,
  where it is the relative information `I(ν ‖ π)`, a different object that vanishes at `ν = π`
  (Check of 1.3) and that roadmap does not define. Nothing of that roadmap is used, its de Bruijn
  identity along the heat flow is not restated, and this roadmap does not depend on it.
- LangevinAndHamiltonianMonteCarlo 5.2 to 5.4 prove the Wasserstein contraction, the invariant
  law and the one-step defect bound of the unadjusted Langevin algorithm in discrete time and
  leave the diffusion and its entropy decay aside. Layer 4 here is about densities solving the
  Fokker–Planck equation; it restates nothing of that roadmap and uses no stochastic differential
  equation.
- LogSobolevForMarkovChains treats logarithmic Sobolev inequalities for chains on finite sets;
  nothing here is about finite state spaces.
- The Ornstein–Uhlenbeck semigroup as such (its Mehler formula, its generator on test functions,
  its Hermite eigenfunctions, hypercontractivity, and the entropy and variance decay of the
  semigroup acting on arbitrary initial laws) is not treated here. The potential `‖x‖²/2` appears
  in 4.1 and 4.2 only as one instance of a classical solution.

Outside the scope: logarithmic Sobolev inequalities for potentials that are not convex
(perturbation and Lyapunov criteria); the Brascamp–Lieb inequality and the
Kannan–Lovász–Simonovits problem for log-concave laws; Caffarelli's contraction theorem;
transport–information inequalities; the `Γ₂` calculus and the local logarithmic Sobolev
inequalities of a semigroup; Riemannian and nonsmooth versions (`Ric + ∇²V ≥ κ`, `RCD(K, ∞)`);
modified logarithmic Sobolev inequalities and discrete spaces; the transport inequality `T₁` and
Marton's argument; existence, uniqueness and regularity theory for the Fokker–Planck equation and
the identification of the law of the Langevin diffusion with its solution.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Measure/Tilted.lean`: `MeasureTheory.Measure.tilted μ f`, the measure
  with density `exp(f)/∫ exp(f) dμ` against `μ` when `exp ∘ f` is integrable and `0` otherwise;
  `MeasureTheory.isProbabilityMeasure_tilted` (for `μ ≠ 0` and `exp ∘ f` integrable, a
  probability measure).
- `Mathlib/Analysis/Convex/Strong.lean`: `StrongConvexOn s m f`.
- `Mathlib/InformationTheory/KullbackLeibler/Basic.lean`: `InformationTheory.klDiv μ ν` in
  `[0, ∞]`, equal to `∫ llr μ ν dμ + ν(univ) − μ(univ)` when `μ ≪ ν` with an integrable
  log-likelihood ratio and `∞` otherwise.
- `Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean` (the data-processing
  inequalities): `InformationTheory.klDiv_comp_right_le` (for finite `μ`, `ν` and a Markov kernel
  `κ`, `KL(μ.bind κ ‖ ν.bind κ) ≤ KL(μ ‖ ν)`).
- `Mathlib/Probability/Moments/Variance.lean`: `ProbabilityTheory.variance f μ`.
- `Mathlib/Analysis/Calculus/Gradient/Basic.lean`: `gradient f x`.
- `Mathlib/Analysis/InnerProductSpace/Laplacian.lean`: the Laplacian `Δ f` of a function on a
  finite-dimensional real inner product space, the trace of its second derivative.
- `Mathlib/Analysis/Calculus/ParametricIntegral.lean`:
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral with an
  integrable bound on the derivative).
- `Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean`:
  `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable` (integration by parts on a
  finite-dimensional space against an additive Haar measure, for integrable products).
- `Mathlib/Analysis/Calculus/ContDiff/Convolution.lean`:
  `HasCompactSupport.contDiff_convolution_left` (the convolution with a compactly supported
  smooth function is smooth), used for mollification.

### From Tau Ceti

- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`: `TauCeti.wassersteinEDist p μ
  ν`, the infimum over couplings of the `eLpNorm` of the distance, in `[0, ∞]`;
  `TauCeti.wassersteinEDist_triangle` (the triangle inequality for `p ≥ 1` on a standard Borel
  space, the middle law finite).
- `TauCeti/MeasureTheory/OptimalTransport/Brenier.lean`:
  `TauCeti.exists_isKantorovichOptimalTransportMap_gradient` (for probability measures `μ ≪ ρ`,
  `ρ` an additive Haar measure, and a finite quadratic cost, the gradient of a convex function is
  an optimal map from `μ` to `ν` and induces the only optimal coupling).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/DisplacementConvexity.lean`:
  `TauCeti.internalEnergy_map_smul_add_smul_gradient_le` (McCann's displacement convexity of the
  internal energy along `((1 − t) id + t ∇F)₊ μ`, for `U(0) = 0`, McCann's condition, `μ ≪ ρ` and
  neither endpoint energy `⊥`; it applies to `U(r) = r log r`).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/PotentialEnergy.lean`:
  `TauCeti.potentialEnergy`, `StrongConvexOn.potentialEnergy_map_le` (for an `m`-strongly convex
  measurable `V`, a plan with square-integrable displacement and endpoint energies not `⊥`, the
  potential energy of the interpolation is `m`-convex with the remainder of the plan).
- `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/InternalEnergy/Basic.lean`:
  `TauCeti.boltzmannEntropy`, `TauCeti.klDiv_tilted_eq_boltzmannEntropy` (for `exp ∘ f`
  integrable against a nonzero σ-finite `m` and `f` integrable against a finite `μ`,
  `KL(μ ‖ m.tilted f) = Ent_m(μ) − ∫ f dμ + μ(X) log ∫ exp f dm + 1 − μ(X)` in `EReal`).
- `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`:
  `TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp` (for probability measures, the
  Donsker–Varadhan formula over bounded measurable functions).
- `TauCeti/Analysis/PDE/HopfLax.lean`: `TauCeti.hopfLax`, `TauCeti.hopfLax_add_add_smul_le` (for
  `φ` and `L` bounded below, `L` convex, `t > 0` and `h ≥ 0`,
  `u(t + h, x + h w) ≤ u(t, x) + h L(w)`).
- `TauCeti/Probability/Distributions/Gaussian/Density.lean`:
  `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (the density of the standard Gaussian
  law, used in a Check of 1.1).
- `TauCeti/Analysis/Convex/LogConcave.lean`: `TauCeti.LogConcave f` for `f : E → ℝ≥0∞`
  (`f x ^ a * f y ^ b ≤ f (a • x + b • y)` for weights `a + b = 1`), cited in the Conventions.

### From TauCetiRoadmap.OptimalTransport

- 2.4 (Kantorovich duality), 3.1 (the Wasserstein distance), 5.5 (Brenier's theorem), 6.6 (the
  Jacobian equation of a Brenier map), 9.5 (potential and internal energies and McCann's
  condition), 11.2 (the Boltzmann entropy) and 11.5 (first variations of the entropy and the
  potential energy): the specification that the Tau Ceti declarations above implement, consumed
  as stated there. 10.3 (evolution variational inequalities and the energy-dissipation
  identity), 11.7 and 11.9 (the Fokker–Planck flow, its semigroup, its energy dissipation and its
  contraction) and 14.6 and 14.7 are cited in Scope and ownership only.

### From TauCetiRoadmap.RandomMatrices

- 2.2: the logarithmic Sobolev and Poincaré inequalities on finite-dimensional Euclidean spaces,
  in the normalisation `Ent_μ(f²) ≤ 2C ∫ ‖∇f‖² dμ` and `Var_μ(f) ≤ C ∫ ‖∇f‖² dμ`, whose
  definitions `Suggested.lean` writes out with an explicit class of test functions; their
  Gaussian case with `C = 1`, their tensorization and their extension from smooth to Lipschitz
  functions (the route of 3.1).

## References

- Nathael Gozlan and Christian Léonard, *Transport inequalities. A survey*, arXiv:1003.3852v1
  (2010). Theorem, corollary, proposition and page numbers are those of this version.
- Ramon van Handel, *Probability in High Dimension*, APC 550 lecture notes, Princeton University,
  version of December 21, 2016, from the author's page.
- Dominique Bakry and Michel Émery, *Diffusions hypercontractives*, Séminaire de probabilités
  (Strasbourg) 19 (1985), 177–206 (Numdam).
- Attributions made in prose without a locator, following Gozlan–Léonard's text: Michel Talagrand
  (the Gaussian transport inequality); Felix Otto and Cédric Villani (the HWI inequality and the
  theorem of 3.1); Dario Cordero-Erausquin (the inequality used in the routes of 2.2 and 2.3);
  Sergey Bobkov, Ivan Gentil and Michel Ledoux (the Hamilton–Jacobi proof of 3.1); Sergey Bobkov
  and Friedrich Götze (the dual form of the transport inequality).
