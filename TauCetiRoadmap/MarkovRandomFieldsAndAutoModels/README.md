# Roadmap: Markov random fields and auto-models

**Summary.** This roadmap builds the theory of laws on a finite set of sites that are specified
through their conditional distributions, the setting of lattice data and areal spatial
statistics. A law is given by a density with respect to a product of reference measures, which
covers both countable state spaces (counting measures) and real-valued fields (Lebesgue
measure). Its full conditionals, the laws of one site given all the others, are defined
pointwise from the density. The roadmap proves:
- *Brook's lemma*: the ratio of the densities at two configurations is a product of ratios of
  full conditionals, provided the intermediate configurations have positive density; hence a
  positive law is determined by its full conditionals;
- the *canonical potential*: the logarithm of a density is a sum of interaction functions of
  subsets of sites, unique once normalized at a reference configuration and expressible through
  the full conditionals;
- the *Hammersley–Clifford theorem* for countable and continuous state spaces: a positive law
  whose full conditionals depend only on neighbouring sites is a product of positive functions
  of the cliques of the graph, and conversely every product of nonnegative clique functions has
  this Markov property; the conditional law of a block of sites depends only on its boundary;
- *Besag's auto-models*: when the full conditionals are one-parameter exponential families and
  the interactions are pairwise, the natural parameters are affine in the neighbouring
  statistics with symmetric coefficients; the auto-logistic model on binary data and the
  auto-Poisson model, which exists if and only if all interactions are nonpositive;
- *Gaussian conditional autoregressions*: Gaussian full conditionals with regression
  coefficients `C` and conditional variances `κ` come from a joint law exactly when
  `diag(κ)⁻¹ (I − C)` is symmetric and positive definite, the law being
  `N(μ, (I − C)⁻¹ diag(κ))`; simultaneous autoregressions are conditional ones, with explicit
  coefficients;
- *coding sets*: the sites of an independent set of the graph are conditionally independent
  given the rest, so the coding likelihood is a conditional likelihood; the pseudolikelihood of
  the one-parameter Gaussian autoregression has a closed-form maximizer;
- the *finite Gibbs sampler*: single-site updates are reversible, a sweep leaves the target
  invariant and a random scan is reversible; for a positive target, a sweep that visits every
  site and a random scan with positive site probabilities both converge in total variation
  uniformly in the initial state.

The material is the conditional-specification theory of Besag's 1974 paper, in the forms given
by Cressie, Gaetan–Guyon, van Lieshout, Rue–Held, the *Handbook of Spatial Statistics*, the
lecture notes edited by Spodarev, and Winkler (see [References](#references)); the roadmap is a
synthesis of these sources and follows none of them in its organization. Headlines that restate
a source result cite a theorem, definition, section or equation number with its printed page;
corollaries and adaptations carry a proof route.

The nearest roadmaps:
- [GraphicalModelsAndConditionalIndependence][GMCI] owns conditional independence,
  the three Markov properties and the Hammersley–Clifford theorem for finite state spaces, with
  Moussouris' counterexample. This roadmap proves that its Markov property of full conditionals
  is that roadmap's local Markov property, and extends the factorization theorem to countable
  and continuous state spaces.
- [MarkovChainMixing](../MarkovChainMixing/README.md) supplies the Glauber kernel and the
  distance to stationarity with its submultiplicativity; Layer 6 identifies the uniform random
  scan with the Glauber kernel and adds sweeps, weighted scans and Doeblin's bound.
- [GibbsMeasuresAndTheIsingModel](../GibbsMeasuresAndTheIsingModel/README.md) treats
  infinite-volume Gibbs measures on lattices; the finite-volume laws here are its local
  specifications in the Markov case.

[GMCI]: ../GraphicalModelsAndConditionalIndependence/README.md

`Suggested.lean` states the headlines below that carry a Lean name, each with every conclusion the
README attaches to it, and the definitions those statements need. It is not an exhaustive
acceptance test: the other headlines are targets of the same standing, stated in prose.

Suggested home: `TauCeti/Probability/MarkovRandomField/` for Layers 1–5 and
`TauCeti/Probability/MarkovChain/GibbsSampler.lean` for Layer 6.

## How to read the build

Layer 1 defines full conditionals from a density and the Markov property, connects them to
Mathlib's conditional distributions and conditional independence and to the finite theory of
GraphicalModelsAndConditionalIndependence, and proves Brook's lemma. Layer 2 is Möbius inversion
on the subsets of the sites: the canonical potential, and with it the Hammersley–Clifford
theorem. Layer 3 applies Layer 2 to exponential-family conditionals. Layer 4 is the Gaussian case
of Layers 1 and 3 together with finite-dimensional linear algebra. Layer 5 uses the
factorization of Layer 2 on independent sets. Layer 6 is independent of Layers 2–5: it treats
the Gibbs sampler of a positive law on a finite product of finite sets as a Markov kernel.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace TauCeti, with Mathlib's
  `ProbabilityTheory` and `MeasureTheory` opened. `Suggested.lean` states the prototypes in the
  namespace `TauCetiRoadmap.MarkovRandomFieldsAndAutoModels`.
- **Sites and configurations.** The sites form a finite type `S` with decidable equality. The
  state space at site `i` is a measurable space `E i`, and a configuration is
  `x : ∀ i, E i`. `x_{-i}` denotes the other coordinates, `x_A` the coordinates in `A`, and
  `Function.update x i y` replaces the coordinate at `i` by `y`. The neighbourhood structure is
  a Mathlib `SimpleGraph S`; `∂i` is the set of neighbours of `i`, and a *clique* is a set on
  which `SimpleGraph.IsClique` holds, so the empty set and every singleton are cliques.
- **Laws and densities.** Each `E i` carries a σ-finite reference measure `ρ i`, and a law is
  given by a density `π : (∀ i, E i) → ℝ≥0` with respect to `Measure.pi ρ`. A density need not
  be normalized: full conditionals, the Markov property and clique factorizations are unchanged
  when `π` is multiplied by a positive constant, and statements that need a probability law say
  so. Countable state spaces are the case `ρ i = Measure.count` with measurable singletons, where
  the density is a mass function. *Positive* means `π x ≠ 0` for every `x`.
- **Full conditionals.** `siteNormalizer ρ π i x = ∫⁻ z, π (Function.update x i z) ∂ρ i` and
  `fullConditional ρ π i x y = π (Function.update x i y) / siteNormalizer ρ π i x`, both in
  `ℝ≥0∞`; neither depends on `x i`. The division is the junk value `π(…)/0` or `π(…)/∞` where the
  normalizer is `0` or `∞`, so every statement that uses a full conditional either assumes the
  normalizers it meets are nonzero and finite or holds for the junk values as well, and says
  which. The phrase *proper normalizers* means `siteNormalizer ρ π i x ≠ 0` and
  `siteNormalizer ρ π i x ≠ ∞` for all `i` and `x`. On a countable space with finite total mass
  the normalizers are finite, and they are nonzero at every `x` in the support.
- **Pointwise conditionals.** Following Besag, full conditionals are computed pointwise from a
  fixed density, not as Radon–Nikodym derivatives defined almost everywhere. The Markov
  property of 1.2 is therefore a property of the chosen density, not of the law: changing `π` on
  a null set leaves the law unchanged and can destroy the property (Check of 1.3). 1.3 proves
  that the pointwise full conditionals are versions of Mathlib's `condDistrib`, so that the
  pointwise statements imply the almost-everywhere ones, which depend on the law only.
- **Energies** are written `π ∝ exp Q`, with the sign of Besag and Cressie; Gaetan–Guyon write
  `exp U` with the same sign, and Georgii and GibbsMeasuresAndTheIsingModel write `exp (−H)`.
- **Binary states.** Binary data are `Bool` with `true` the value `1`. The spin of
  GibbsMeasuresAndTheIsingModel is then `1 − 2x`, so `true` is the spin `−1` as there.
- **Matrices** are real, indexed by `S`, with `M = diag(κ)` the diagonal matrix of conditional
  variances; `(I − C)⁻¹` is Mathlib's `Matrix.inv`, the junk value `0` at a singular matrix, which
  every statement excludes by a positive-definiteness or determinant hypothesis.
- **Gaussian laws.** `gaussianPDF m v` is Mathlib's density of `N(m, v)` on `ℝ` in `ℝ≥0∞`, and
  the multivariate density is Tau Ceti's `TauCeti.Probability.multivariateGaussianPDFReal` on
  `EuclideanSpace ℝ S`, read in coordinates through `WithLp.toLp`.
- **Kernels.** In Layer 6 each `E i` is a finite type with measurable singletons. Kernels on the
  configurations are Mathlib kernels; `κ * η` is `κ ∘ₖ η`, so `η` acts first, and `κ ^ n` is the
  `n`-step kernel. Stationarity is `Kernel.Invariant` and reversibility `Kernel.IsReversible`.
  Total variation is Mathlib's `tvDist`, with values in `[0, 2]`, and the distance to
  stationarity is `tvToStationary κ π t = max_x tvDist ((κ ^ t) x) π / 2` of MarkovChainMixing
  1.2.
- **Locators** are `(Author, Theorem or equation, printed page)` in the editions listed under
  [References](#references).

## Layer 1: full conditionals and Brook's lemma

### 1.1 Full conditionals and the positivity condition

- `siteNormalizer` and `fullConditional` are as in the Conventions. Where the normalizer at `x`
  is nonzero and finite and `π` is measurable, `y ↦ fullConditional ρ π i x y` is a probability
  density with respect to `ρ i`, and `fullConditional ρ (c • π) i x = fullConditional ρ π i x`
  for every constant `c ≠ 0`.
- `marginalMass π i a = ∑' x with x i = a, π x`, for countable state spaces.
- `SatisfiesPositivity π`: every configuration whose coordinates all have positive marginal mass
  has positive mass, that is, the support of `π` is the product of the supports of its marginals
  (Besag, §2, p. 195, which names the condition after Hammersley and Clifford; Gaetan–Guyon,
  (2.9), p. 66). A positive `π` satisfies it.

**Checks.**

- On `{0, 1}²` with masses `p(0,0) = 1/2`, `p(0,1) = 1/4`, `p(1,0) = 0`, `p(1,1) = 1/4`, both
  marginals of the value `1` are positive and `p(1,0) = 0`, so `SatisfiesPositivity` fails; the
  site-`1` full conditional at the conditioning value `x₂ = 0` is the point mass at `0`.
- With `ρ i = Measure.count` on a finite `E i`, `siteNormalizer` is the finite sum
  `∑_z π(x with x_i := z)` and `fullConditional` is the elementary conditional probability.
- Negative control: the full conditional is not the marginal. For two copies of one fair bit,
  `fullConditional` at site `1` given `x₂ = 0` is the point mass at `0`, while the marginal of
  site `1` is uniform.

### 1.2 Markov random fields

- `IsMarkovRandomField ρ G π`: for every site `i` and configurations `x`, `x'` that agree on
  `∂i` and have nonzero finite normalizers at `i`,
  `fullConditional ρ π i x = fullConditional ρ π i x'`. This is the local Markov property of
  Besag, §3, p. 196 (the neighbours of a site are the sites on which its conditional depends),
  of Gaetan–Guyon,
  Definition 2.2, p. 65, and of van Lieshout, p. 60.
- **Agreement with the finite theory** (`isMarkovRandomField_count_iff_isLocalMarkov`): for finite
  state spaces with counting measures, `IsMarkovRandomField (fun _ ↦ Measure.count) G π` holds if
  and only if `IsLocalMarkov G π` of GraphicalModelsAndConditionalIndependence 2.2 holds, for
  every law, positive or not. Route: the local property `{i} ⊥ (S ∖ ({i} ∪ ∂i)) ∣ ∂i` is the
  margin identity `p(x_{∂i}) p(x) = p(x_{i ∪ ∂i}) p(x_{-i})`; where `p(x_{-i}) > 0` it says that
  `p(x) / p(x_{-i})` equals `p(x_{i ∪ ∂i}) / p(x_{∂i})`, a function of `x_i` and `x_{∂i}`;
  conversely, if the full conditional is a function `f(x_i, x_{∂i})` on configurations of
  positive conditioning mass, summing `p(x) = f · p(x_{-i})` over the coordinates outside
  `{i} ∪ ∂i` gives `p(x_{i ∪ ∂i}) = f · p(x_{∂i})`, and both sides of the margin identity vanish
  where `p(x_{-i}) = 0`. Through this theorem the global and pairwise Markov properties of that
  roadmap, its intersection property and its finite Hammersley–Clifford theorem apply to
  `IsMarkovRandomField`.

**Checks.**

- On the path `1 − 2 − 3` with binary states, let `p ∝ f(x₁, x₂) g(x₂, x₃)` with
  `f(0,0) = 1`, `f(0,1) = 2`, `f(1,0) = 3`, `f(1,1) = 0` and `g(0,0) = g(0,1) = 1`,
  `g(1,0) = 2`, `g(1,1) = 3`; the total weight is `18` and `p(1,1,·) = 0`. Both sides of the
  agreement theorem hold: given `x₂ = 0` the full conditional at site `1` is `(1/4, 3/4)` for
  either `x₃`, given `x₂ = 1` it is the point mass at `0`, the normalizer at site `3` vanishes at
  `(1,1,·)` and elsewhere the conditional depends on `x₂` only, and the margin identity holds at
  every site and configuration. Multiplying `p` by `2` where `x₁ = x₃` breaks both sides: given
  `x₂ = 0` the full conditional at site `1` is `(2/5, 3/5)` at `x₃ = 0` and `(1/7, 6/7)` at
  `x₃ = 1`, and the margin identity at site `1` and `x = (0,0,0)` reads `6/169 ≠ 15/676`.
- Negative control: the law of three copies of one fair bit is a Markov random field for the
  path `1 − 2 − 3` (where the normalizer at `1` is nonzero, `x₂ = x₃` and the full conditional
  is the point mass at `x₂`), but not for the graph with the single edge `2 − 3`: there
  `∂1 = ∅`, while the full conditional at `1` is the point mass at `0` or at `1` according to
  `x₂`.
- With the empty graph, `IsMarkovRandomField` says that each full conditional is a fixed density
  on the configurations with proper normalizers; for a positive law it is the product of its
  marginals (2.2 below).

### 1.3 Agreement with Mathlib's conditional laws

- **Full conditionals are conditional laws** (`condDistrib_ae_eq_withDensity_fullConditional`):
  let each `E i` be a nonempty standard Borel space, `ρ i` σ-finite, `π` measurable, and
  `P = (Measure.pi ρ).withDensity π` a probability measure. For every site `i` and
  `P`-almost every `x`, Mathlib's `condDistrib` of the coordinate `x i` given the coordinates
  `x_{-i}` (as a function on `{j // j ≠ i}`), evaluated at `x_{-i}`, is
  `(ρ i).withDensity (fullConditional ρ π i x)`. Route: by Fubini on
  `Measure.pi ρ = ρ i ⊗ Measure.pi (ρ ∘ (j ≠ i))`, the normalizer is nonzero and finite for
  almost every `x_{-i}`, and the kernel `x_{-i} ↦ (ρ i).withDensity (fullConditional ρ π i x)`
  disintegrates `P`; uniqueness of disintegrations is Mathlib's
  `condDistrib_ae_eq_of_measure_eq_compProd`.
- **The local Markov property in Mathlib's sense** (`IsMarkovRandomField.condIndepFun`): under
  the same hypotheses, if `π` is a Markov random field for `G`, then for every site `i` the
  coordinate `x i` is conditionally independent of the coordinates at the sites outside
  `{i} ∪ ∂i`, given the coordinates on `∂i`, in the sense of Mathlib's `CondIndepFun`. Route: the
  first bullet and the Markov property show that the conditional law of `x i` given `x_{-i}` is
  almost surely a measurable function of `x_{∂i}`, which is
  `condIndepFun_iff_condDistrib_prod_ae_eq_prodMkRight`.

**Checks.**

- For `ρ i = Measure.count` on finite `E i`, the first bullet holds at every `x` of positive mass,
  where `condDistrib` is the elementary conditional probability
  (`condDistrib_apply_of_ne_zero`).
- For the Gaussian law of 4.1 the first bullet gives the Gaussian conditional law
  `N(μ_i + ∑_{j ≠ i} C_{ij}(x_j − μ_j), κ_i)`, which is Tau Ceti's
  `TauCeti.Probability.condDistrib_multivariateGaussian` for the split of `S` into `{i}` and the
  rest.
- Negative control (versions): two sites, the empty graph, `ρ i` Lebesgue measure and
  `π(x) = φ(x₁) φ(x₂)` with `φ` the standard normal density, a Markov random field. Let `π'`
  equal `π` except on the null line `{x₂ = 0}`, where `π'(x₁, 0) = 2 φ(x₁) φ(0)` for `x₁ > 0`.
  Both densities give the same law, an independent pair, so the same `condDistrib` and the same
  `CondIndepFun` statements. But the full conditional of `π'` at site `1` given `x₂ = 0` is
  `φ(x₁)(1 + 1_{x₁ > 0})/(3/2)`, while given `x₂ = 1` it is `φ(x₁)`; both normalizers are
  nonzero and finite, so `π'` is not a Markov random field for the empty graph.

### 1.4 Brook's lemma

- **Brook's lemma** (`brook_factorization`): let `S = Fin n`, let `x`, `y` be configurations and
  `w_i = (x_1, …, x_{i−1}, y_i, …, y_n)` the conditioning configurations, whose coordinate at `i`
  is irrelevant. If `π y ≠ 0`, `π(x_1, …, x_{i−1}, y_i, …, y_n) ≠ 0` for every `i`, and the
  normalizers at `w_i` are nonzero and finite, then
  `π(x)/π(y) = ∏_i fullConditional ρ π i w_i (x_i) / fullConditional ρ π i w_i (y_i)`. Besag,
  (2.2), p. 195, with proof on p. 196; van Lieshout, Theorem 3.1, p. 51; Rue–Held, Lemma 2.3,
  p. 29; Handbook, Lemma 12.1, p. 176; Spodarev, Lemma 9.6, p. 299. Route: telescoping; the
  ratio of full conditionals at `w_i` is the ratio of `π` at the two configurations that differ
  only at site `i`, because the normalizers cancel. Rue–Held and the Handbook assume only that
  `x` and `y` have positive density; the hypothesis on the intermediate configurations is needed
  (second Check).
- **Under the positivity condition** (`brook_factorization_of_satisfiesPositivity`): on countable
  state spaces with finite total mass, `SatisfiesPositivity π`, `π x ≠ 0` and `π y ≠ 0` give the
  identity with counting measures. Every intermediate configuration takes each coordinate from
  `x` or `y`, so its coordinates have positive marginal mass, and the normalizers at points of
  the support are nonzero and finite (Besag, p. 196, which uses the condition for exactly this).
- **Uniqueness for positive densities** (`eq_of_fullConditional_eq`): two positive densities with
  proper normalizers, equal full conditionals and the same nonzero finite total mass are equal.
  Van Lieshout, Corollary 3.1, p. 52; Rue–Held, p. 29. Route: Brook's lemma at a fixed `y` gives
  `π = c π'`, and the masses give `c = 1`.
- **Uniqueness under the positivity condition**
  (`eq_of_fullConditional_eq_of_satisfiesPositivity`): on countable state spaces, two laws with
  the positivity condition, the same finite total mass, and the same full conditionals at every
  site and configuration are equal. Route: at a point `x` of the support of `π` the normalizer
  is nonzero and finite, so `fullConditional` of `π` at `x_i` is positive, hence so is that of
  `π'`, and `π' x ≠ 0`; the supports agree, and Brook's lemma on the common support gives
  `π = c π'`. Equality of full conditionals is required at every configuration, junk values
  included; this is how the hypothesis "same support" of the sources enters.

**Checks.**

- On `{0, 1} × {0, 1, 2}` with `p(a, b) = (3a + b + 1)/21`, `x = (1, 2)` and `y = (0, 0)`:
  `π(x)/π(y) = 6`, and the product is `π_1(1 ∣ 0)/π_1(0 ∣ 0) · π_2(2 ∣ 1)/π_2(0 ∣ 1) = 4 · 3/2`.
- Negative control (the intermediate hypothesis): for the law of 1.1 with `p(1,0) = 0`, `x = (1,1)`
  and `y = (0,0)` have positive mass and `π(x)/π(y) = 1/2`, but the intermediate configuration
  `(1, 0)` has mass `0`; the first factor of the product is `0` and the second is `1/0`, so
  the identity fails with every convention.
- `n = 0`: there is one configuration, `x = y`, the product is empty and the identity reads
  `π y / π y = 1`, which needs `π y ≠ 0`; this is why that hypothesis is stated separately.
- Negative control for uniqueness: `π` and `2π` have the same full conditionals, so the total
  masses must be compared.

*Needs:* Mathlib `Measure.pi`, `lintegral`, `Measure.withDensity`, `condDistrib`,
`condDistrib_ae_eq_of_measure_eq_compProd`, `condDistrib_apply_of_ne_zero`, `CondIndepFun`,
`condIndepFun_iff_condDistrib_prod_ae_eq_prodMkRight`, `Measure.count`; the local copies
`margin`, `CondIndep` and `IsLocalMarkov` of GraphicalModelsAndConditionalIndependence 1.1 and
2.2.

## Layer 2: the canonical potential and the Hammersley–Clifford theorem

### 2.1 The canonical potential

Fix a reference configuration `a`. For `B ⊆ S` write `x^B` for the configuration equal to `x` on
`B` and to `a` off `B`.

- `canonicalPotential π a A x = ∑_{B ⊆ A} (−1)^{|A ∖ B|} log π(x^B)`, with Mathlib's
  `Real.log` (which is `0` at `0`; the statements below that involve full conditionals assume
  `π` positive).
- **Möbius inversion** (`canonicalPotential_spec`): for every `π` and `a`,
  `log π x = ∑_A canonicalPotential π a A x`; each `canonicalPotential π a A` depends only on the
  coordinates in `A` (Mathlib's `DependsOn`); and `canonicalPotential π a A x = 0` when
  `x_i = a_i` for some `i ∈ A` (so `A` is nonempty). Van Lieshout, Theorem 3.2, p. 56, with the
  Möbius formula as Theorem 3.3, p. 56; Besag, (3.3), p. 197, with `a = 0`; Gaetan–Guyon, proof
  of Theorem 2.1, p. 66; Cressie, (6.4.5)–(6.4.6), p. 415. Route: Möbius inversion on the Boolean
  lattice of subsets of `S`, Mathlib's `Finset.sum_powerset_neg_one_pow_card`; normalization
  pairs `B` with `B ∪ {i}`, since `x^B = x^{B ∪ {i}}` when `x_i = a_i`. For positive `π` the
  first conjunct is `π = exp (∑_A V_A)`.
- **Uniqueness** (`eq_canonicalPotential`): a family `V` with the three properties of the
  previous bullet is the canonical potential (van Lieshout, Theorem 3.2, p. 56). Route: by
  locality and normalization `V_A(x^B) = 0` for `A ⊄ B`, so `log π(x^B) = ∑_{A ⊆ B} V_A(x)`, and
  Möbius inversion.
- **Through the full conditionals** (`canonicalPotential_eq_sum_log_fullConditional`): for a
  positive `π` with proper normalizers and `i ∈ A`,
  `canonicalPotential π a A x` equals
  `∑_{B ⊆ A ∖ {i}} (−1)^{|A ∖ {i} ∖ B|} log (π_i(x_i ∣ x^B) / π_i(a_i ∣ x^B))`. Van Lieshout, (3.6),
  p. 56; Besag, (3.2), p. 197.
  Route: group the sum by `B ∌ i` and `B ∪ {i}`; `log π(x^{B ∪ {i}}) − log π(x^B)` is the log
  ratio of full conditionals at `x^B`, the normalizers cancelling.

**Checks.**

- Two binary sites, `a = 0`, `π(0,0) = 0.1`, `π(0,1) = 0.2`, `π(1,0) = 0.3`, `π(1,1) = 0.4`:
  `V_∅ = log 0.1`, `V_1(1) = log 3`, `V_2(1) = log 2`, and `V_∅ + V_1 + V_2 + V_{12}` reproduces
  `log π` at all four points; `V_{12}(0, 1) = 0`, and `V_{12}(1, 1) = log (2/3) = −0.405465`,
  which the full-conditional formula reproduces as
  `log [(π_1(1 ∣ 1)/π_1(0 ∣ 1)) / (π_1(1 ∣ 0)/π_1(0 ∣ 0))] = log (2/3)`.
- Negative control: `V_∅ = log π(a)` is not normalized to `0`, so the variant of the
  normalization asking `V_A(a) = 0` for every `A` fails at `A = ∅` whenever `π(a) ≠ 1`; the
  normalization as stated is vacuous at `A = ∅`, since no site of `∅` agrees with `a`.
- For the Gaussian density of 4.1 with `a = μ`, `V_{{i}}(x) = −Q_{ii}(x_i − μ_i)²/2` and
  `V_{{i,j}}(x) = −Q_{ij}(x_i − μ_i)(x_j − μ_j)`, with `Q = M⁻¹(I − C)`, and `V_A = 0` for
  `|A| > 2` (van Lieshout, Example 3.6, p. 56).

### 2.2 The Hammersley–Clifford theorem

- **Hammersley–Clifford theorem** (`isMarkovRandomField_iff_factorization`): a positive density
  with proper normalizers is a Markov random field for `G` if and only if
  `π x = ∏_{C clique} ψ_C(x)` for positive functions `ψ_C` depending only on `x_C`. Besag, §3,
  pp. 197–198, for finite state spaces, with the extension to countable state spaces and to
  densities on p. 198; van Lieshout, Theorem 3.4, p. 60, for countable and absolutely continuous
  laws; Gaetan–Guyon, Theorem 2.1, pp. 65–66; Cressie, p. 417; Handbook, Theorem 12.7, p. 194;
  Spodarev, Theorem 9.3, p. 300. For finite state spaces this is
  GraphicalModelsAndConditionalIndependence 3.2 through 1.2. Route: the next bullet, with
  `ψ_C = exp V_C`.
- **Canonical form** (`isMarkovRandomField_iff_canonicalPotential`): under the same hypotheses,
  for any reference configuration `a`, `π` is a Markov random field for `G` if and only if
  `canonicalPotential π a A = 0` for every `A` that is not a clique. Route: if `j, k ∈ A` are not
  adjacent, the Markov property at `j` makes the log ratio of full conditionals at `x^B` in 2.1
  independent of `x_k`, so the terms of the alternating sum over `B` and `B ∪ {k}` cancel
  (Gaetan–Guyon, proof of Theorem 2.1, p. 66; Besag, p. 198). Conversely the full conditional at
  `i` is `exp (∑_{A ∋ i} V_A)` normalized, which involves only cliques through `i`, contained in
  `{i} ∪ ∂i`.
- **Nonnegative factorizations** (`isMarkovRandomField_of_factorization`): for any nonnegative
  `ψ_C` depending only on `x_C`, the product over cliques is a Markov random field for `G`, with
  no positivity. Van Lieshout, first half of the proof of Theorem 3.4, p. 60, which does not use
  positivity. Route: in the full conditional at `i` the factors of cliques not containing `i`
  are constant in `y` and cancel; where they vanish, so does the normalizer, which the definition
  of the Markov property excludes. For finite state spaces this is
  GraphicalModelsAndConditionalIndependence 2.3–2.4 through 1.2.
- Positivity cannot be dropped from the first bullet: Moussouris' law on the four-cycle is a
  Markov random field without a clique factorization (GraphicalModelsAndConditionalIndependence
  3.3; van Lieshout, Example 3.9, pp. 61–62). It is not restated here.

**Checks.**

- The positive law on the four-cycle with mass `2` on the two constant configurations and `1` on
  the other fourteen is not a Markov random field: relative to `a = 0`,
  `V_{{1,3}}(1, 0, 1, 0) = log 2 ≠ 0` for the non-adjacent pair `{1, 3}`.
- Negative control: on two non-adjacent binary sites a positive law is a Markov random field iff
  `V_{12} = 0`, iff it is a product law; the law of 2.1's Check, with `V_{12}(1,1) = −2.288`, is
  not.
- For the auto-logistic weight of 3.2 with `β_{ij} = 0` off the edges, the factors are
  `ψ_{{i}} = exp (α_i x_i)` and `ψ_{{i,j}} = exp (β_{ij} x_i x_j)`.

### 2.3 Blocks

- `blockNormalizer ρ π A x = ∫⁻ w, π(w on A, x off A) ∂Measure.pi (ρ on A)` and
  `setConditional ρ π A x z = π(z on A, x off A) / blockNormalizer ρ π A x`, the conditional
  density of `x_A` given `x_{S ∖ A}`.
- **Block form** (`setConditional_eq_of_eqOn_boundary`): for a positive Markov random field with
  proper normalizers and any `A`, the conditional density of the block `A` given the rest depends
  only on the coordinates at sites outside `A` adjacent to `A`. Besag, p. 198 (the corollary
  after the proof); Gaetan–Guyon, Definition 2.2, p. 65, takes this as the definition. Route: by
  2.2, `π(w on A, x off A)` is a function of `w` and `x_{∂A}` times a function of `x_{S ∖ A}`;
  the second factor is a positive finite constant in the block integral, so it comes out of the
  lower integral of any function, measurable or not, and cancels; when the block normalizer is
  infinite it is infinite at every `x'` with the same boundary values, both conditionals then
  being `0`.

**Checks.**

- `A = {i}` recovers the Markov property of 1.2:
  `setConditional ρ π {i} x z = fullConditional ρ π i x (z i)`.
- `A = S` gives `π z` over the total mass, with no boundary.

*Needs:* Layer 1; Mathlib `Real.log`, `DependsOn`, `Finset.sum_powerset_neg_one_pow_card`,
`SimpleGraph.IsClique`, `Measure.pi`.

## Layer 3: auto-models

Each `E i` has a distinguished value `0`, and `0` also denotes the configuration that is `0`
everywhere.

### 3.1 Besag's auto-model theorem

- `autoModel α β B C x = ∑_i (α_i B_i(x_i) + C_i(x_i)) + ∑_{i<j} β_{ij} B_i(x_i) B_j(x_j)`, the
  pair sum written as half the sum over ordered pairs `i ≠ j`.
- **Besag's theorem** (`exists_autoModel`): let `π` be a positive Markov random field for `G` with
  proper normalizers whose canonical potential relative to `0` vanishes on every set of more than
  two sites. Suppose that for each `i`,
  `log π_i(x_i ∣ x_{-i}) = A_i(x_{-i}) B_i(x_i) + C_i(x_i) + D_i(x_{-i})` with
  `B_i(0) = C_i(0) = 0` and `B_i` not identically `0`. Then there are `α_i` and `β_{ij} = β_{ji}`,
  with
  `β_{ij} = 0` for distinct non-adjacent `i`, `j`, such that
  `A_i(x_{-i}) = α_i + ∑_{j ≠ i} β_{ij} B_j(x_j)` and `π(x) = π(0) exp (autoModel α β B C x)`.
  Besag, (4.2)–(4.4), p. 200, with proof (4.14)–(4.15), p. 203; Gaetan–Guyon, Theorem 2.2(1),
  p. 67, with proof pp. 67–68; Cressie, (6.5.6)–(6.5.8), pp. 427–428. Besag (Assumption 1,
  p. 200) and Gaetan–Guyon ((2.10), p. 67) assume the pairwise expansion; here it is the
  hypothesis on the canonical potential of 2.1, and the logarithm of the full conditional at `0`
  is finite because `π` is positive. Route: 2.1 with `a = 0`;
  `V_{{i}}(x) = A_i(0) B_i(x_i) + C_i(x_i)` and, comparing the full conditionals at `i` and `j` with
  the other coordinates `0`,
  `V_{{i,j}}(x) = β_{ij} B_i(x_i) B_j(x_j)` with `β_{ij} = β_{ji}` (Gaetan–Guyon, p. 68).
- **Converse** (`fullConditional_autoModel`): for symmetric `β`, the full conditional of
  `exp (autoModel α β B C)` at `i` is
  `exp (η_i B_i(y) + C_i(y)) / ∫ exp (η_i B_i(z) + C_i(z)) dρ_i(z)` with
  `η_i = α_i + ∑_{j ≠ i} β_{ij} B_j(x_j)`, at every `x` and whether or not the weight is
  normalizable (both sides are `0` when the site integral is infinite). When the total mass is
  finite and nonzero these are the full conditionals of the normalized law (Gaetan–Guyon,
  Theorem 2.2(2), p. 67, and Corollary 2.3, p. 68). Route: the terms of `autoModel` not involving
  `x_i` factor out of the site integral.

**Checks.**

- Negative control (symmetry): with `β_{12} = 1`, `β_{21} = 0` the weight's full conditional at
  `1` has natural parameter `α_1 + x_2/2`, not `α_1 + β_{12} x_2`; the converse needs `β`
  symmetric, as the exponent counts the pair once with weight `(β_{12} + β_{21})/2`.
- The Gaussian auto-model: `B_i(x) = x`, `C_i(x) = −x²/(2κ_i)` with `ρ i` Lebesgue measure gives
  Gaussian full conditionals with variance `κ_i`; this is 4.1 with `μ = 0`.
- The auto-exponential model: `E i = [0, ∞)` with Lebesgue measure, `B_i(x) = x`, `C_i = 0`,
  natural parameter `−(α_i + ∑_j β_{ij} x_j)`; the full conditionals are exponential laws exactly
  when the rate is positive at every `x`, that is `α_i > 0` and `β_{ij} ≥ 0`, and then the weight
  is integrable (Besag, §4.2.5, p. 202; Gaetan–Guyon, p. 70).

### 3.2 The auto-logistic model

- **Auto-logistic model** (`fullConditional_autoLogistic`): on `{0, 1}^S`, for symmetric `β`, the
  weight `exp (∑_i α_i x_i + ∑_{i<j} β_{ij} x_i x_j)` has
  `π_i(1 ∣ x_{-i}) = e^{η_i} / (1 + e^{η_i})` with `η_i = α_i + ∑_{j ≠ i} β_{ij} x_j`. The state
  space is finite, so the weight is always normalizable. Besag, (4.7)–(4.8), p. 201; van
  Lieshout, Example 3.3, p. 51; Gaetan–Guyon, p. 69. Route: `fullConditional_autoModel` with
  `B_i(x) = x`, `C_i = 0` and counting measure.

**Checks.**

- `α = (0.2, −0.4, 0.1)`, `β_{12} = 0.7`, `β_{13} = −0.3`, `β_{23} = 0.5`, `x = (·, 1, 1)`:
  `π_1(1 ∣ x) = 0.645656 = 1/(1 + e^{−0.6})`.
- `β = 0` gives independent sites with `π(x_i = 1) = e^{α_i}/(1 + e^{α_i})`.
- With spins `σ = 1 − 2x ∈ {1, −1}`, `x_i x_j = (1 − σ_i)(1 − σ_j)/4`, so the auto-logistic law
  is an Ising law with coupling `β_{ij}/4` and an external field; for `β_{ij} > 0` the coupling
  of the spins is ferromagnetic.

### 3.3 The auto-Poisson model

- `autoPoissonWeight α β x = exp (∑_i (α_i x_i − log x_i!) + ∑_{i<j} β_{ij} x_i x_j)` on `ℕ^S`.
- **Auto-Poisson normalizability** (`tsum_autoPoissonWeight_ne_top_iff`): for symmetric `β`,
  `∑_x autoPoissonWeight α β x < ∞` if and only if `β_{ij} ≤ 0` for all `i ≠ j`. Besag, §4.2.4,
  p. 202; Gaetan–Guyon, pp. 69–70. Route: for `β ≤ 0` the weight is at most
  `∏_i e^{α_i x_i}/x_i!`; if `β_{12} > 0`, the terms with `x_1 = x_2 = k` and the other
  coordinates `0` are `exp ((α_1 + α_2) k + β_{12} k² − 2 log k!)`, which tend to infinity.
- **Poisson full conditionals** (`fullConditional_autoPoisson`): for symmetric `β`, the full
  conditional at `i` is the Poisson law `poissonMeasure` with mean
  `exp (α_i + ∑_{j ≠ i} β_{ij} x_j)` (Besag, p. 202). Route: `fullConditional_autoModel` with
  `B_i(x) = x`, `C_i(x) = −log x!`, and the exponential series.

**Checks.**

- `α = (0.3, −0.2)`, `β = 0`: the sum is `exp (e^{0.3} + e^{−0.2}) = 8.745940`.
- `β_{12} = −1`: the sum is `5.725062` (truncations at `60` and `80` agree).
- Negative control (`β_{12} = 0.01 > 0`): the truncated sums over `x_1, x_2 < N` are `8.8447` at
  `N = 40, 80, 160` and appear to converge, but the diagonal term has logarithm `−1724.3` at
  `k = 1000` and `+48252` at `k = 3000`; the series diverges.
- Sign: Gaetan–Guyon, p. 69, print the auto-Poisson energy with `+ log(x_i!)`; the Poisson
  conditional needs `− log x_i!`, as in Besag, p. 202.

*Needs:* Layers 1–2; Mathlib `poissonMeasure`, `Real.exp`, the exponential series.

## Layer 4: conditional and simultaneous autoregressions

Here `E i = ℝ`, `ρ i` is Lebesgue measure, and configurations are `x : S → ℝ`. `C` is a real
matrix with zero diagonal, `κ` a vector of positive conditional variances, `M = diag(κ)` and
`Q = M⁻¹(I − C)`.

### 4.1 Gaussian conditional specifications

- `gaussianDensity μ V` is the density of `N(μ, V)` in coordinates, Tau Ceti's
  `TauCeti.Probability.multivariateGaussianPDFReal` at `WithLp.toLp 2 x`.
- `HasGaussianFullConditionals π μ C κ`: for every `i` and `x`, the full conditional of `π` at `i`
  is `gaussianPDF (μ_i + ∑_{j ≠ i} C_{ij}(x_j − μ_j)) κ_i`.
- **Conditional autoregression** (`hasGaussianFullConditionals_gaussianDensity`): if `Q` is
  positive definite, then `gaussianDensity μ ((I − C)⁻¹ M)` has these Gaussian full conditionals,
  and Lebesgue measure with this density is the image of Mathlib's
  `multivariateGaussian (WithLp.toLp 2 μ) ((I − C)⁻¹ M)` under `WithLp.ofLp`. Besag, (4.9)–(4.11),
  p. 201, for `κ_i = σ²`; Rue–Held, Theorem 2.6, pp. 28–29, with `C_{ij} = −β_{ij}`; van
  Lieshout, Example 3.4, p. 51, and Definition 3.3, p. 52;
  Gaetan–Guyon, (1.25)–(1.26), pp. 35–36. Route: `(I − C)⁻¹ M = Q⁻¹`; completing the square in
  `x_i` in `(x − μ)ᵀ Q (x − μ)` gives conditional precision `Q_{ii} = 1/κ_i` and mean
  `μ_i − ∑_{j ≠ i} Q_{ij}(x_j − μ_j)/Q_{ii} = μ_i + ∑_{j ≠ i} C_{ij}(x_j − μ_j)`; the second
  conjunct is `TauCeti.Probability.multivariateGaussian_eq_withDensity`.
- **Besag's converse** (`eq_gaussianDensity_of_hasGaussianFullConditionals`): if a density of
  total mass `1` has these Gaussian full conditionals, then `C_{ij} κ_j = C_{ji} κ_i` for all
  `i`, `j`, `Q` is positive definite, and the density is `gaussianDensity μ ((I − C)⁻¹ M)` at
  every point. Rue–Held, Theorem 2.6, pp. 28–29, with proof by Brook's lemma; Gaetan–Guyon,
  p. 36. Route: Gaussian full conditionals are positive and finite, so
  the normalizers are proper and `π` is positive; Brook's lemma (1.4) along the orders `1, …, n`
  and `n, …, 1` gives `log π(x) − log π(μ)` as two quadratic forms whose cross terms are
  `C_{ij}/κ_i` and `C_{ji}/κ_j`, so these agree; the resulting form `−(x − μ)ᵀ Q (x − μ)/2` is
  integrable only when `Q` is positive definite.

**Checks.**

- `n = 3`, `μ = 0`, `Q` the path precision with `Q_{ii} = 2` and `Q_{12} = Q_{23} = −1`,
  `κ_i = 1/Q_{ii} = 1/2`, `C = −M(Q − diag Q)`, so `C_{12} = C_{21} = C_{23} = C_{32} = 1/2`:
  `(I − C)⁻¹ M = Q⁻¹ = [[3, 2, 1], [2, 4, 2], [1, 2, 3]]/4`, and Gaussian conditioning of
  `N(0, Q⁻¹)` at `x₂ = 1`, `x₃ = 3` gives site `1` the mean `1/2 = C_{12} x₂ + C_{13} x₃` and
  the variance `1/2 = κ_1`.
- Negative control (symmetry): `C_{12} = C_{21} = 1/2` with `κ = (1, 2)` violates
  `C_{12} κ_2 = C_{21} κ_1`; Brook's lemma from `0` to `(1, 1)` gives `log π(1,1) − log π(0)`
  equal to `−1/2` along one order and `−1/4` along the other, so no joint density exists.
- The conditional residuals `e = (I − C)(x − μ)` of the law in the first bullet satisfy
  `Cov(e, x) = M` (van Lieshout, p. 54), so `e_i` is uncorrelated with `x_j` for `j ≠ i`, while
  `Cov(e) = M(I − C)ᵀ` need not be diagonal.

### 4.2 Checking positive definiteness

- **Eigenvalue criterion** (`posDef_iff_forall_hasEigenvalue_pos`): if `κ > 0` and
  `C_{ij} κ_j = C_{ji} κ_i`, then `Q` is positive definite if and only if every real eigenvalue
  of `I − C` is positive. An adaptation: the sources require `Q` positive definite. Route:
  `I − C = MQ` is similar to the symmetric matrix `M^{1/2} Q M^{1/2}`, so its eigenvalues are real,
  and `Q` is congruent to that matrix.
- **Proportional to the adjacency matrix** (`eq_of_reachable_of_adjMatrix`): if
  `C = φ N` with `N = SimpleGraph.adjMatrix` of `G` and `φ ≠ 0`, the symmetry condition forces
  `κ_i = κ_j` whenever `i` and `j` are joined by a path, so `κ` is constant on each connected
  component.
- **Gershgorin's sufficient condition** (`posDef_of_abs_mul_degree_lt_one`): if `C = φ N`, `κ > 0`
  is equal at adjacent sites, and `|φ| deg(i) < 1` for every `i`, then `Q` is positive definite.
  Van Lieshout, Example 3.2, p. 50. Route: `I − φ N` is symmetric and strictly diagonally
  dominant, so its eigenvalues are positive by Mathlib's `eigenvalue_mem_ball`, and `M⁻¹`
  commutes with `N` when `κ` is equal at adjacent sites.

**Checks.**

- The star `K_{1,3}` with `C = φ N`: the least eigenvalue of `I − φ N` is `0.4804` at `φ = 0.3`,
  `0.1340` at `φ = 0.5` and `−0.0392` at `φ = 0.6`; the exact bound is `|φ| < 1/√3 = 0.5774`,
  while Gershgorin's condition asks `|φ| < 1/3`, so the condition is sufficient, not necessary.
- Negative control (constant `κ`): on the star with `φ = 0.3` and `κ = (1, 2, 1, 1)`, the matrix
  `M⁻¹(I − C)` is not symmetric (its entries `(1, 2)` and `(2, 1)` differ by `0.15`), so no joint
  law has these full conditionals, although `|φ| deg(i) < 1` at every site.
- `C_{12} = 1.5`, `C_{21} = 0.6`, `κ = (1, 0.4)`: the symmetry condition holds, the eigenvalues
  of `I − C` are `1.9487` and `0.0513`, and `Q` has eigenvalues `0.0729` and `3.4271`; both
  positive, as the criterion says, though `C_{12} > 1`.

### 4.3 Simultaneous autoregressions

- **SAR to CAR** (`exists_unique_car_of_sar`): let `B` have zero diagonal with `I − B`
  nonsingular, and `Λ = diag(λ)` with `λ > 0`. The covariance `(I − B)⁻¹ Λ (I − B)⁻ᵀ` of the
  simultaneous autoregression `x = μ + B(x − μ) + ε`, `ε ~ N(0, Λ)`, equals `(I − C)⁻¹ M` for a
  unique `C` with zero diagonal and `κ > 0`; for it `M⁻¹(I − C) = (I − B)ᵀ Λ⁻¹ (I − B)`,
  `κ_i⁻¹ = λ_i⁻¹ + ∑_j b_{ji}² λ_j⁻¹`, and every `C_{ij} ≠ 0` with `i ≠ j` has `b_{ij} ≠ 0`,
  `b_{ji} ≠ 0`, or `b_{li} b_{lj} ≠ 0` for some `l`. Van Lieshout, Proposition 3.1, pp. 53–54;
  Gaetan–Guyon, p. 37; Besag, (4.12)–(4.13), p. 201. Route: invert the covariance; the diagonal
  of `(I − B)ᵀ Λ⁻¹ (I − B)` is `κ⁻¹`, `C = I − M (I − B)ᵀ Λ⁻¹ (I − B)`, and the off-diagonal entry
  `(i, j)` is `−b_{ij}/λ_i − b_{ji}/λ_j + ∑_l b_{li} b_{lj}/λ_l`. The law of `x` is
  `N(μ, (I − B)⁻¹ Λ (I − B)⁻ᵀ)` by Tau Ceti's `TauCeti.Probability.map_affine_multivariateGaussian`.
- Gaetan–Guyon, p. 37, state the neighbour relation of the conditional autoregression as an
  equivalence; cancellation makes it an inclusion (second Check).

**Checks.**

- `b_{12} = 1/2`, `b_{23} = 1/4`, `b_{31} = 1/2`, other entries `0`, `λ = (1, 2, 1/2)`:
  `κ⁻¹ = (3/2, 3/4, 65/32)` both as the diagonal of `(I − B)ᵀ Λ⁻¹ (I − B)` and by the formula,
  `C = [[0, 1/3, 2/3], [2/3, 0, 1/6], [32/65, 4/65, 0]]`, and `(I − C)⁻¹ M` equals the covariance
  exactly; `C_{13} ≠ 0` comes from `b_{31} ≠ 0` alone.
- Negative control (the converse of the neighbour statement): `λ = 1`,
  `b_{12} = b_{13} = b_{23} = 1`, all other entries `0`, give
  `(I − B)ᵀ(I − B) = [[1, −1, −1], [−1, 2, 0], [−1, 0, 3]]`, so `C_{23} = 0` although `b_{23} ≠ 0`:
  the terms `−b_{23}` and `b_{12} b_{13}`
  cancel.

*Needs:* Layers 1 and 3; Mathlib `gaussianPDF`, `multivariateGaussian`, `Matrix.PosDef`,
`Matrix.inv`, `Module.End.HasEigenvalue`, `eigenvalue_mem_ball`, `SimpleGraph.adjMatrix`,
`SimpleGraph.degree`, `SimpleGraph.Reachable`; Tau Ceti
`TauCeti.Probability.multivariateGaussianPDFReal`,
`TauCeti.Probability.multivariateGaussian_eq_withDensity`,
`TauCeti.Probability.map_affine_multivariateGaussian`.

## Layer 5: coding sets and pseudolikelihood

### 5.1 Coding sets

- A *coding set* is a set of pairwise non-adjacent sites, Mathlib's `SimpleGraph.IsIndepSet`
  (Besag, §6.1, p. 211; Gaetan–Guyon, p. 193).
- `pseudoLikelihood ρ π D x = ∏_{i ∈ D} π_i(x_i ∣ x_{-i})`, Besag's pseudolikelihood over the
  window `D` (Gaetan–Guyon, §5.4.2, p. 191; van Lieshout, p. 64). Over a coding set it is the
  coding likelihood (Besag, p. 211). For a parametric family `θ ↦ π_θ` the pseudolikelihood is
  `θ ↦ pseudoLikelihood ρ π_θ D x`.
- **Coding sets** (`setConditional_eq_prod_of_isIndepSet`): for a measurable positive Markov
  random field with proper normalizers and a coding set `C`, the conditional density of `x_C`
  given `x_{S ∖ C}` is `∏_{i ∈ C} π_i(z_i ∣ x_{-i})`, so the coordinates in `C` are conditionally
  independent given the others with the full conditionals as their laws; in particular the
  coding likelihood `pseudoLikelihood ρ π C x` is the conditional density
  `setConditional ρ π C x x`. Besag, §6.1, p. 211; Gaetan–Guyon, p. 194 (the property behind
  Theorem 5.4). Route: by 2.2 the factors of `π` that involve a site of `C` are functions of
  that site and its neighbours, which lie outside `C`; the block normalizer factors into site
  normalizers by Tonelli for a product of measurable functions of separate coordinates, which is
  where measurability of `π` enters.

**Checks.**

- Negative control: on the path `1 − 2 − 3` with the law `exp (x_1 x_2 + x_2 x_3)` on `{0, 1}³`,
  `{1, 2}` is not a coding set and its conditional density given `x_3` is not the product of the
  full conditionals at `1` and `2` (each of which conditions on the other).
- For the empty graph every set is a coding set and the pseudolikelihood over `S` is the
  likelihood of the normalized product law.

### 5.2 The one-parameter Gaussian autoregression

- **Pseudolikelihood maximizer** (`gaussianCAR_pseudoLikelihood_le_max`): let `W` have zero
  diagonal and consider the full conditionals `x_i ∣ x_{-i} ~ N(b (Wx)_i, k)` at every site,
  with `b ∈ ℝ` and `k > 0`. The zero diagonal makes these full conditionals; the maximization
  below holds for every `W`, and the Lean statement does not assume it. If `Wx ≠ 0` and
  `⟨x, x⟩ − ⟨x, Wx⟩²/⟨Wx, Wx⟩ > 0` (that is, `x` is not a multiple of `Wx`), the
  pseudolikelihood `∏_i gaussianPDFReal (b (Wx)_i) k x_i` has the unique maximizer
  `b̂ = ⟨x, Wx⟩/⟨Wx, Wx⟩`, `k̂ = (⟨x, x⟩ − ⟨x, Wx⟩²/⟨Wx, Wx⟩)/|S|`. Gaetan–Guyon, p. 193.
  Route: the logarithm is `−(|S|/2) log (2πk) − RSS(b)/(2k)` with `RSS(b) = |x − b Wx|²`;
  minimize in `b` (least squares), then in `k`; the hypothesis is `RSS(b̂) > 0`.
- For symmetric `W`, `⟨Wx, Wx⟩ = xᵀW²x`; when moreover `I − bW` is positive definite, these are
  the full conditionals of the conditional autoregression of 4.1 with `C = bW` and `κ = k`.
- Gaetan–Guyon, p. 193, print `k̂ = (xᵀx − (xᵀWx)²/xᵀWx)/n`; the denominator of the second term
  is `xᵀW²x`, as in their `b̂` (first Check).

**Checks.**

- `W` the adjacency matrix of the `4`-cycle and `x = (1, 2, 0, −1)`: `Wx = (1, 1, 1, 1)`,
  `⟨x, Wx⟩ = 2`, `⟨Wx, Wx⟩ = 4`, `⟨x, x⟩ = 6`, so `b̂ = 1/2` and `k̂ = (6 − 1)/4 = 5/4`, which
  numerical maximization reproduces; the misprinted variance formula gives `(6 − 2)/4 = 1`.
- Negative control: if `x = c Wx` then `RSS(b̂) = 0` and the pseudolikelihood is unbounded as
  `k → 0`, so the hypothesis on `x` is needed.

*Needs:* Layers 1–2 and 4; Mathlib `SimpleGraph.IsIndepSet`, `gaussianPDFReal`, `dotProduct`,
`Matrix.mulVec`.

## Layer 6: the finite Gibbs sampler

Here every `E i` is a nonempty finite type with measurable singletons, and `π` is a probability
measure on the configurations.

### 6.1 Single-site updates

- `gibbsUpdate π i`: the kernel whose row at `x` is `π` conditioned (Mathlib's `cond`) on the
  configurations that agree with `x` off `i`, and `δ_x` where that set is `π`-null; built with
  `Kernel.ofFunOfCountable`. For positive `π` its row at `x` is `fullConditional` at `i` with
  counting measure, transported to the configurations. These are Winkler's local
  characteristics, (5.1), p. 113.
- **Markov property** (`isMarkovKernel_gibbsUpdate`): `gibbsUpdate π i` is a Markov kernel.
  Route: each row is a point mass or `π` conditioned on a set of positive mass, a probability
  measure because `π` is one; as for `glauber` in MarkovChainMixing 6.1.
- **Reversibility** (`isReversible_gibbsUpdate`): `gibbsUpdate π i` is reversible for `π`, for
  every `π`. Winkler, Lemma 5.1.1 and Theorem 5.1.1, p. 114. Route: both sides of detailed
  balance vanish unless `x` and `y` agree off `i`, and then both are `π{x} π{y} / π(B)`, with
  `B` the common conditioning set; invariance follows by `Kernel.IsReversible.invariant`.

### 6.2 Sweeps

- `gibbsSweep π l`: for a list `l` of sites, the product of the kernels `gibbsUpdate π i` in
  the order of `l`, the first entry acting first (Winkler, (5.2), p. 114).
- **Markov property** (`isMarkovKernel_gibbsSweep`): every sweep is a Markov kernel; the empty
  sweep is the identity kernel. Route: Markov kernels are closed under composition.
- **Invariance** (`invariant_gibbsSweep`): every sweep leaves `π` invariant (Winkler, p. 115).
  Route: invariance is preserved by composition.

**Checks.**

- Negative control: a sweep is in general not reversible. On `{0, 1}²` with masses
  `(0.4, 0.1, 0.2, 0.3)` at `00, 01, 10, 11`, the sweep updating site `1` then site `2` leaves
  `π` invariant to `6 · 10⁻¹⁷`, while its detailed-balance defect is `0.0533`.
- On one site, `gibbsUpdate π i x = π` for every `x`, and every sweep is the independent sampler.
- Order: for the same law, the sweep `[1, 2]` updates site `1` first, so its row at `x` depends
  only on `x₂`, and its transition from `00` to `01` has probability
  `π(x₁ = 0 ∣ x₂ = 0) π(x₂ = 1 ∣ x₁ = 0) = (2/3)(1/5) = 2/15`; the sweep `[2, 1]` gives
  `π(x₂ = 1 ∣ x₁ = 0) π(x₁ = 0 ∣ x₂ = 1) = (1/5)(1/4) = 1/20`. The updates do not commute.

### 6.3 Random scans

- `gibbsRandomScan π q = ∑_i q_i gibbsUpdate π i` for `q : S → ℝ≥0∞` (Winkler, (5.3),
  p. 115).
- **Markov property** (`isMarkovKernel_gibbsRandomScan`): if `∑ q_i = 1`, the random scan is a
  Markov kernel. Route: a convex combination of Markov kernels. With no sites the sum of the
  `q_i` is `0`, so the hypothesis excludes the empty site set, where the scan is the zero kernel.
- **Reversibility** (`isReversible_gibbsRandomScan`): every random scan is reversible for `π`,
  for all weights `q`, normalized or not (Winkler, proof of Theorem 5.1.3, p. 116). Route:
  `Kernel.IsReversible` is an identity between `∫⁻` of the kernel over sets, which is linear in
  the kernel with `ℝ≥0∞` coefficients, so reversibility is separate from the Markov property.
- **Agreement with Glauber dynamics** (`gibbsRandomScan_uniform_eq_glauber`): for constant
  state spaces `E i = A`, the uniform random scan `q_i = 1/|S|` is `glauber π` of
  MarkovChainMixing 6.1, whose reversibility is that roadmap's.

**Checks.**

- The law of 6.2's Check: the uniform scan and the scan with `q = (0.3, 0.7)` are reversible to
  `10⁻¹⁷`.
- A single step of a random scan changes at most one site, so `gibbsRandomScan π q` is not
  positive when `|S| ≥ 2`: in the Check of 6.2 its least entry is `0`.

### 6.4 Uniform convergence

- **Doeblin's bound** (`tvToStationary_le_of_minorization`): let `κ` be a Markov kernel on a
  finite type with invariant probability `π`. If `κ^N(x, {y}) ≥ ε π{y}` for all `x`, `y`, then
  `tvToStationary κ π n ≤ (1 − ε)^⌊n/N⌋` for every `n`. At `N = 0` (where `⌊n/0⌋ = 0`) and for
  `ε ≤ 0` the bound is at least `1 ≥ d(n)`, and `ε > 1` is impossible. Winkler, Lemma 4.3.1,
  p. 84, and Theorem 4.3.1, p. 85, in the language of contraction coefficients. Route: every row
  of `κ^N` is `ε π + (1 − ε) R_x` for probability laws `R_x`, so the distance between two rows is
  at most `1 − ε` (the argument of HiddenMarkovModels 6.1 for one step); MarkovChainMixing 1.2
  gives `d(t) ≤ d̄(t)`, `d̄(s + t) ≤ d̄(s) d̄(t)` and monotonicity.
- **Sweeps converge** (`tendsto_tvToStationary_gibbsSweep`): if `π` is positive and the list `l`
  contains every site, then for some `ε > 0` every row of the sweep dominates `ε π`, and
  `tvToStationary (gibbsSweep π l) π n → 0`; that is, `ν P^n → π` in total variation uniformly
  over initial laws `ν`. Winkler, Theorem 5.1.2, p. 115. Route: the last visit to each site draws
  its value from a positive conditional law, so every entry of the sweep is positive; Doeblin's
  bound with `N = 1`.
- **Random scans converge** (`tendsto_tvToStationary_gibbsRandomScan`): if `π` is positive and
  `q_i > 0` with `∑ q_i = 1`, then every row of the `|S|`-step random scan dominates `ε π` for
  some `ε > 0`, and `tvToStationary (gibbsRandomScan π q) π n → 0`. Winkler, Theorem 5.1.3,
  pp. 115–116, proves convergence for each initial law; uniformity follows from Theorem 4.3.1,
  p. 85, as in the proof of Theorem 5.1.2. Route: in `|S|` steps the scan visits the sites in a
  fixed order with positive probability; Doeblin's bound with `N = |S|`.

**Checks.**

- The law of 6.2's Check: the sweep has `ε = 0.5` and `d(1) = 0.25`, `d(5) = 1.93 · 10⁻⁴`,
  `d(20) = 5.1 · 10⁻¹⁶`, below the bounds `0.5` and `0.03125` at `n = 1, 5`; the uniform scan
  has `ε = 0.2917` for `N = 2`, `d(1) = 0.40`, `d(4) = 0.141 ≤ (1 − 0.2917)² = 0.5017`,
  `d(5) = 0.0993` and `d(20) = 5.2 · 10⁻⁴`.
- Negative control (positivity): for `π` uniform on `{00, 11}` the single-site updates fix every
  configuration of positive mass, so the sweep is not ergodic and `d(n) = 1/2` for all `n ≥ 1`.
- Negative control (every site visited): a sweep that omits site `2` never changes `x_2`, and
  `d(n)` stays at least `max_b π(x_2 ≠ b) > 0`.

*Needs:* Mathlib `ProbabilityTheory.cond`, `Kernel.ofFunOfCountable`, `Kernel.IsReversible`,
`Kernel.IsReversible.invariant`, `Kernel.Invariant`, `tvDist`; MarkovChainMixing 1.2 and 6.1.

## Downstream consumers

No roadmap on main or among the open pull requests consumes this one. Its natural consumers are
two bodies of mathematics outside it:
- the theory of Gaussian Markov random fields (precision matrices, improper and intrinsic
  models, stationary autoregressions on `ℤ^d`), whose finite-dimensional starting point is the
  normalizer and full conditional of 1.1, the Gaussian conditional specifications of 4.1 and
  the conditional form of the finite simultaneous autoregression of 4.3;
- the asymptotics of maximum pseudolikelihood and coding estimators on infinite graphs, which
  start from the Markov property of 1.2, the canonical potential of 2.1, the coding sets,
  coding identity and `pseudoLikelihood` of 5.1, with the auto-models of Layer 3 as examples.

The finite Gibbs point processes of the roadmap FiniteGibbsPointProcesses have their own
Hammersley–Clifford theorem and do not use 2.2.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Full conditionals and Brook's lemma.** Full conditionals of a density with respect to a
   product reference measure; the positivity condition; the Markov property of full conditionals
   and its agreement with the local Markov property of finite graphical models and with
   Mathlib's conditional distributions and conditional independence; Brook's lemma in general
   and under the positivity condition; uniqueness of a law with given full conditionals.
2. **The canonical potential and the Hammersley–Clifford theorem.** The canonical potential, its
   normalization, uniqueness and expression through full conditionals; the Hammersley–Clifford
   theorem for countable and continuous state spaces in factorization and canonical form; the
   Markov property of nonnegative clique products; the block form.
3. **Auto-models.** Besag's auto-model theorem and its converse; the auto-logistic model; the
   auto-Poisson model, its Poisson conditionals and the normalizability criterion.
4. **Autoregressions.** Gaussian conditional specifications: the joint law of a conditional
   autoregression and Besag's converse; the eigenvalue criterion; constancy of `κ` and
   Gershgorin's condition for `C = φ N`; the conditional representation of a simultaneous
   autoregression.
5. **Coding and pseudolikelihood.** Conditional independence on coding sets and the coding
   likelihood; the maximum pseudolikelihood estimator of the one-parameter Gaussian
   autoregression.
6. **The finite Gibbs sampler.** The Markov property of single-site updates, sweeps and random
   scans; reversibility of single-site updates and random scans, invariance of sweeps,
   agreement with Glauber dynamics, Doeblin's bound, and uniform convergence of sweeps and
   random scans.

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- conditional independence of finitely many variables with finite state spaces, its calculus,
  the pairwise, local and global Markov properties, their equivalence for positive laws, the
  Hammersley–Clifford theorem for finite state spaces and Moussouris' counterexample:
  GraphicalModelsAndConditionalIndependence, Layers 1–3 (local copies `margin`, `CondIndep`,
  `IsLocalMarkov`);
- the Glauber kernel with its reversibility, and the distances `d` and `d̄` with their
  submultiplicativity: MarkovChainMixing 6.1 and 1.2 (local copies `glauber`, `tvToStationary`);
- infinite-volume Gibbs measures, specifications, Dobrushin uniqueness and the Ising model:
  GibbsMeasuresAndTheIsingModel;
- Gaussian densities, affine images and conditioning: Mathlib and Tau Ceti, as listed under
  [Exact supplier contracts](#exact-supplier-contracts).

Neighbours that are separate subjects: the heat-bath dynamics of the Ising model and its mixing
(the roadmap GlauberDynamicsOfTheIsingModel); block Gibbs sampling of restricted Boltzmann
machines (the roadmap RestrictedBoltzmannMachines), whose two-block update is a sweep in
the sense of 6.2 with blocks in place of sites; error bounds for Markov chain Monte Carlo
(the roadmap MarkovChainMonteCarloGuarantees).
[HiddenMarkovModels](../HiddenMarkovModels/README.md) 6.1 states the one-step contraction of
the `ℓ¹` distance under a minorization for mass functions on countable spaces; Doeblin's bound of
6.4 is its `N`-step variant for Mathlib kernels on a finite type, stated for the distance to the
stationary law with the exponent `⌊n/N⌋`, and is proved here, not consumed.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Measures:** `Measure.pi`, `Measure.count`, `Measure.withDensity`, `lintegral`, `cond`,
  `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`).
- **Conditional laws:** `condDistrib`, `condDistrib_ae_eq_of_measure_eq_compProd`,
  `condDistrib_apply_of_ne_zero` (`Mathlib/Probability/Kernel/CondDistrib.lean`); `CondIndepFun`
  with the notation `X ⟂ᵢ[Z, hZ; μ] Y` and
  `condIndepFun_iff_condDistrib_prod_ae_eq_prodMkRight`
  (`Mathlib/Probability/Independence/Conditional.lean`).
- **Kernels:** `Kernel.ofFunOfCountable`, the monoid structure on `Kernel α α`,
  `Kernel.IsReversible`, `Kernel.IsReversible.invariant`, `Kernel.Invariant`
  (`Mathlib/Probability/Kernel/Invariance.lean`).
- **Graphs:** `SimpleGraph.IsClique`, `SimpleGraph.IsIndepSet`, `SimpleGraph.adjMatrix`,
  `SimpleGraph.degree`, `SimpleGraph.Reachable`.
- **Combinatorics and functions:** `Finset.sum_powerset_neg_one_pow_card`, `DependsOn`.
- **Laws:** `gaussianPDF`, `gaussianPDFReal`, `multivariateGaussian`, `poissonMeasure`.
- **Linear algebra:** `Matrix.PosDef`, `Matrix.inv`, `Module.End.HasEigenvalue`, Gershgorin's
  `eigenvalue_mem_ball` (`Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`), `dotProduct`,
  `Matrix.mulVec`.

### From Tau Ceti

- `TauCeti.Probability.multivariateGaussianPDFReal` and
  `TauCeti.Probability.multivariateGaussian_eq_withDensity`: a nondegenerate multivariate
  Gaussian law is Lebesgue measure with this density
  (`TauCeti/Probability/Distributions/Gaussian/Density.lean`).
- `TauCeti.Probability.map_affine_multivariateGaussian`: affine images of multivariate Gaussian
  laws (`TauCeti/Probability/Distributions/Gaussian/Affine.lean`).
- `TauCeti.Probability.condDistrib_multivariateGaussian`, the conditional law of a block of a
  multivariate Gaussian vector
  (`TauCeti/Probability/Distributions/Gaussian/Conditional/Basic.lean`), used in the
  Checks of 1.3.

### From GraphicalModelsAndConditionalIndependence

[GraphicalModelsAndConditionalIndependence][GMCI] supplies, for finite state
spaces and laws `p : (∀ v, X v) → ℝ≥0`:
- 1.1, the margins `margin p A x` and conditional independence `CondIndep p A B S` (local
  copies);
- 2.2, the local Markov property `IsLocalMarkov G p` (local copy), and through 1.2 of this
  roadmap its pairwise and global properties;
- 2.3–2.4 and 3.1–3.2, factorization and the equivalence of the Markov properties for positive
  laws, which 2.2 here extends to countable and continuous state spaces;
- 3.3, Moussouris' law, which shows that positivity cannot be dropped from 2.2.

### From MarkovChainMixing

[MarkovChainMixing](../MarkovChainMixing/README.md) supplies:
- 1.2, the distance to stationarity `tvToStationary κ π t` (local copy), the distance between
  starting points `d̄`, `d(t) ≤ d̄(t)` for stationary `π`, `d̄(s + t) ≤ d̄(s) d̄(t)`, monotonicity,
  and `d(t)` as the supremum over initial laws;
- 6.1, the Glauber kernel `glauber π` (local copy) on `V → A` with its Markov and reversibility
  properties.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Infinite graphs and asymptotics.** Markov random fields on countable graphs as Gibbs
  measures, existence and uniqueness, and the consistency and asymptotic normality of maximum
  pseudolikelihood and coding estimators with the coding likelihood-ratio test.
- **Gaussian Markov random fields.** Precision matrices and conditional independence, Cholesky
  factors, intrinsic models, and stationary autoregressions on `ℤ^d` with their spectral
  densities.
- **Without positivity.** Factorization theorems for non-positive laws on decomposable graphs,
  and Markov random fields with structural zeros.
- **Further samplers.** Metropolis-within-Gibbs, block updates on general partitions, simulated
  annealing schedules, and rates of convergence for specific models beyond Doeblin's bound.
- **Likelihood inference.** Maximum likelihood for auto-models by Monte Carlo approximation of
  normalizing constants, and the existence of maximum likelihood estimators in exponential
  families (van Lieshout, Theorem 3.5, p. 65).

## Prior formalization

[lean-MSSS](https://github.com/bjbraams/lean-MSSS) (Apache-2.0, commit 6826ba2), by the author
of this roadmap, proves without `sorry`, for countable state spaces and real-valued mass
functions, the following targets of Layers 1–3 and 5, all in `MSSS/Lattice/MarkovField.lean`:
- 1.4: Brook's lemma under the positivity condition with `S = Fin n`
  (MSSS.brook_factorization) and uniqueness under the positivity condition for laws of mass `1`
  (MSSS.eq_of_fullConditional_eq);
- 2.2–2.3: the Hammersley–Clifford theorem in factorization and canonical form
  (MSSS.isMarkovRandomField_iff_factorization, MSSS.isMarkovRandomField_iff_canonicalPotential),
  the Markov property of nonnegative clique products (MSSS.isMarkovRandomField_of_factorization),
  the block form (MSSS.setConditional_eq_of_eqOn_boundary), and Moussouris' example
  (MSSS.exists_markovRandomField_not_factorization);
- 3.1–3.2: Besag's auto-model theorem and its converse for a normalizable weight
  (MSSS.exists_autoModel, MSSS.fullConditional_autoModelDensity) and the auto-logistic conditionals
  (MSSS.fullConditional_autoLogistic);
- 5.1: the coding-set identity (MSSS.setConditional_codingSet).

The design differs in two places. lean-MSSS works with mass functions on countable state spaces
only, so the continuous Hammersley–Clifford theorem, the Gaussian results of Layer 4 and the
agreement theorems of 1.2–1.3 are not there; here a density with respect to a product reference
measure covers both cases. lean-MSSS's Markov property quantifies over configurations of
positive conditioning mass; here it quantifies over proper normalizers, which is the same for
mass functions. lean-MSSS defines the canonical potential of 2.1 but states none of its
properties as a public theorem; the auto-Poisson results, Layer 4, the Gaussian
pseudolikelihood of 5.2 and the Gibbs sampler of Layer 6 are not in lean-MSSS. The map is not
prescriptive.

## References

The locators refer to these editions; page numbers are printed page numbers.

- J. Besag, Spatial interaction and the statistical analysis of lattice systems, *Journal of the
  Royal Statistical Society, Series B* 36 (1974), 192–236.
- N. Cressie, *Statistics for Spatial Data*, revised edition, Wiley, 1993.
- C. Gaetan and X. Guyon, *Spatial Statistics and Modeling*, Springer, 2010.
- A. E. Gelfand, P. J. Diggle, M. Fuentes and P. Guttorp (eds.), *Handbook of Spatial
  Statistics*, CRC Press, 2010; chapter 12, H. Rue and L. Held, Discrete spatial variation
  (cited as Handbook).
- M. N. M. van Lieshout, *Theory of Spatial Statistics: A Concise Introduction*, CRC Press, 2019.
- H. Rue and L. Held, *Gaussian Markov Random Fields: Theory and Applications*, Chapman &
  Hall/CRC, 2005.
- E. Spodarev (ed.), *Stochastic Geometry, Spatial Statistics and Random Fields: Asymptotic
  Methods*, Lecture Notes in Mathematics 2068, Springer, 2013; chapter 9, A. Bulinski and
  E. Spodarev, Introduction to random fields (cited as Spodarev).
- G. Winkler, *Image Analysis, Random Fields and Markov Chain Monte Carlo Methods*, 2nd ed.,
  Springer, 2003.
