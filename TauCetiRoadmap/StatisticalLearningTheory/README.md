# Roadmap: statistical learning theory

**Summary.** This roadmap builds the distribution-free theory of learning from examples on
Mathlib's measure theory, its reproducing-kernel Hilbert spaces and its shattering combinatorics,
on Tau Ceti's concentration inequalities (McDiarmid, Bernstein), Laplace laws, exchangeability
and Wasserstein library, and on the empirical-process toolkit of
[MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md):
- risk, empirical risk and the ERM inequality; the Bayes classifier, plug-in rules and the
  margin condition; proper losses; classification calibration and Zhang's comparison inequality
  for convex surrogates;
- empirical Rademacher complexity with Talagrand's contraction, Massart's finite-class lemma and
  the convex hull, the Rademacher complexity of a kernel ball, the Rademacher generalization
  bound and hold-out selection;
- the VC dimension of a class of classifiers, PAC learnability in the realizable and agnostic
  settings with upper and lower sample-complexity bounds, the fundamental theorem of statistical
  learning and the no-free-lunch theorem;
- the margin bound, generalization of uniformly stable algorithms and the stability of
  regularized kernel methods, and the oracle inequality for kernel ridge regression;
- split conformal prediction, the Cover–Hart inequalities and nearest-neighbour asymptotics,
  Stone's theorem for local weights and response-independent forests, and consistency of
  `k`-means;
- cost-complexity pruning, impurity decrease, the descent of `L²` boosting, the variance of an
  ensemble average and the training error and margins of AdaBoost;
- differential privacy: the Laplace, Gaussian and exponential mechanisms, post-processing, group
  privacy, basic and advanced composition, randomized response, contraction under local privacy,
  minimax rates of private mean estimation and the sparse vector technique;
- fairness criteria and their incompatibilities, covariate shift with importance weights, the
  domain-adaptation bound and label-shift correction.

The material is the graduate core of Mohri–Rostamizadeh–Talwalkar (2018),
Devroye–Györfi–Lugosi (1996) and Anthony–Bartlett (1999), with concentration from
Boucheron–Lugosi–Massart (2013) and Koltchinskii (2011), kernel methods from Cucker–Zhou (2007),
Schölkopf–Smola (2002) and Wainwright (2019), trees from Breiman–Friedman–Olshen–Stone (1984),
stability and margins from Hardt–Recht (2022), privacy from Dwork–Roth (2014), fairness from
Barocas–Hardt–Narayanan (2023), and distribution shift from Quiñonero-Candela et al. (2009); see
[References](#references). The organisation by layers is this roadmap's own: it follows proof
dependency, not the order of any of these texts. Headlines that restate a source result carry a
theorem, definition, section or equation locator with its printed page; corollaries,
adaptations and results whose source is a paper are derived in the proof routes.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the other headlines (bold or not) are
targets of the same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Statistics/Learning/`, with one subdirectory per layer.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Risk, Bayes rules and losses.** The ERM inequality; the Bayes classifier with its risk, its
   optimality and the excess-risk identity; the plug-in bounds, with the margin condition;
   properness of the logarithmic and Brier losses; classification calibration of convex
   surrogates and Zhang's comparison inequality.
2. **Rademacher averages.** Empirical Rademacher complexity; Talagrand's contraction, Massart's
   lemma and the convex hull identity; the kernel-ball bound; one-sided symmetrization and the
   Rademacher generalization bound in expectation and with high probability; finite classes and
   hold-out selection.
3. **VC dimension and PAC learnability.** VC dimension of classifiers, realizable and agnostic
   PAC learnability, uniform deviation over VC classes, upper sample-complexity bounds for
   empirical risk minimization and for consistent rules, lower bounds, the fundamental theorem
   and the no-free-lunch theorem.
4. **Margins, stability and kernel regression.** The margin bound and its kernel form; uniform
   stability and its generalization bound, with the stability of regularized kernel methods;
   kernel ridge regression: closed form, oracle inequality and its finite-rank and polynomial-decay
   rates.
5. **Distribution-free prediction, local rules and clustering.** Split conformal prediction; the
   Cover–Hart inequalities and the asymptotics of nearest-neighbour classification; Stone's
   theorem for local weights and the consistency of response-independent forests; consistency of
   `k`-means.
6. **Trees, boosting and ensembles.** Minimal cost-complexity pruning; impurity decrease and the
   categorical-split ordering; the descent of `L²` boosting; the variance of an ensemble average;
   AdaBoost's training error, margins and line search.
7. **Differential privacy.** Central and local privacy; post-processing and group privacy; the
   Laplace, Gaussian and exponential mechanisms; basic and advanced composition; randomized
   response and contraction under local privacy; minimax rates of private mean estimation; the
   sparse vector technique.
8. **Fairness and distribution shift.** Separation, sufficiency and independence and their
   incompatibilities; covariate shift, the domain-adaptation bound and importance-weighted
   validation; label-shift correction and identification.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built, or belong elsewhere:
- the VC dimension of a family of sets, the Sauer–Shelah bound, symmetrization in absolute value
  with outer expectations, chaining, and the covering numbers of VC classes:
  [MathematicalStatisticsAsymptotic](../MathematicalStatisticsAsymptotic/README.md) 3.2, 3.3
  and 3.5, on Mathlib's `Finset.vcDim` and `Finset.card_shatterer_le_sum_vcDim`. 2.3 proves the
  one-sided symmetrization with signed Rademacher averages that the generalization bounds use,
  by the same ghost-sample argument;
- `L²` consistency of nearest-neighbour and kernel regression, the reproducing-kernel Hilbert
  space and the representer theorem:
  [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 5.6
  and 5.8. 5.2 adds only the classification results, and 4.3 only the rates;
- Pinsker's inequality and Le Cam's two-point method:
  [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) 1.4
  and 2.2, applied in 3.3 and 7.5;
- i.i.d. sequences, samples and empirical measures:
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 8.5 and
  9.1, whose conventions this roadmap adopts;
- the Hedge forecaster and its regret:
  [RegretMinimizationAndEquilibria](../RegretMinimizationAndEquilibria/README.md) 1.2. Online
  gradient descent belongs to a roadmap on first-order methods in an open pull request;
- bandits (upper confidence bounds, Thompson sampling, adversarial and linear bandits, the
  Lai–Robbins and minimax lower bounds) belong to a roadmap on bandits in an open pull request;
- Markov decision processes, Bellman operators, policy iteration, linear programming and tabular
  `Q`-learning and TD(0): [MarkovDecisionProcesses](../MarkovDecisionProcesses/README.md);
- realisation maps of neural networks: [Neuromanifolds](../Neuromanifolds/README.md);
- Wasserstein distances and quantization of laws: Tau Ceti's optimal-transport library, consumed
  by 5.4;
- kernel mean embeddings, maximum mean discrepancy and characteristic kernels are not part of
  this roadmap.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the Tau Ceti namespace, with Mathlib's
  `ProbabilityTheory` and `MeasureTheory` opened. `Suggested.lean` states the prototypes in the
  namespace `TauCetiRoadmap.StatisticalLearningTheory`.
- **Samples.** A sample of size `n` from `P` on a measurable space `Z` is `z : Fin n → Z` under
  `Measure.pi (fun _ : Fin n ↦ P)`, as in Foundations. Almost sure statements about an i.i.d.
  sequence use a sequence `ℕ → Ω → Z` with `iIndepFun` and identical laws, as Tau Ceti's
  Wasserstein library does. `empiricalMean g z = n⁻¹ ∑ g(z i)` is the integral of `g` against
  the empirical measure of Foundations 9.1 (and `0` for `n = 0`).
- **Labels and scores.** Classifiers are `h : X → Bool`, and data are pairs in `X × Bool`. Real
  scores `h : X → ℝ` are read through `labelSign`, which sends `true` to `1` and `false` to `-1`;
  the source texts' labels `±1` are `labelSign` of a Boolean label. Ties: the Bayes and plug-in
  classifiers predict `true` when the score is at least `1/2` (Devroye–Györfi–Lugosi use the
  strict inequality, which changes no risk), and the misclassification risk of
  a real score, `marginError`, counts `labelSign y · h(x) = 0` as an error.
- **Losses and risks.** The 0–1 risk `classificationError P h = P(h(X) ≠ Y)` and the empirical
  risk `empiricalError` are real numbers in `[0, 1]`. Bounded losses are real-valued with values
  in `[0, 1]` or `[0, M]`, and their Bochner integrals carry measurability hypotheses. Surrogate
  risks, `k`-means risks, minimax risks and divergences can be infinite and live in `ℝ≥0∞`, with
  `∫⁻`. Empirical Rademacher complexities live in `EReal`: the empty class has complexity `⊥`
  and an unbounded supremum gives `⊤`, so `EReal.toReal` is used only for bounded nonempty
  classes, where it is not a junk value.
- **Measurability.** Probabilities of events quantified over an uncountable class, or defined
  through an arbitrary learning rule, are outer probabilities: Mathlib's `μ s` is the outer
  measure of a non-measurable set, and `Measure.real` inherits this, as in the convention of
  MathematicalStatisticsAsymptotic. Expectations of suprema over a class are taken for pointwise
  separable classes (`IsPointwiseSeparable`, Asymptotic 3.2), for which the suprema are
  measurable; countable classes are pointwise separable.
- **PAC learnability.** Learning rules are proper: they take values in the class. The
  realizable setting is the set of laws under which some member of the class has error zero (the
  convention of Anthony–Bartlett and Mohri–Rostamizadeh–Talwalkar), not the weaker condition that
  the infimum of the errors is zero.
- **Rademacher signs.** Empirical Rademacher complexities are averages over the `2^n` sign
  vectors `σ : Fin n → Bool`, with the signs `labelSign (σ i)`; this is the expectation under
  `n` independent Rademacher signs and needs no measurability in the class.
- **Neighbouring data sets.** Data sets are `D : Fin n → X`, and neighbours differ in at most
  one record: `hammingDist D D' ≤ 1` (Mathlib). This is substitution of a record. Dwork–Roth work
  with histograms and `‖x - y‖₁ ≤ 1`, which is addition or removal of a record; every privacy
  statement below is proved for the substitution convention by the same argument, with
  sensitivities defined for substitution.
- **Total variation.** Mathlib's `tvDist μ ν` is the total variation norm of `μ - ν`; the
  statistical distance `sup_B |μ(B) - ν(B)|` between probability measures is `tvDist μ ν / 2`,
  as in Foundations.
- **Kernels.** A reproducing-kernel Hilbert space of real functions on `X` is Mathlib's
  `RKHS ℝ H X ℝ`; the scalar kernel value `K(x, y)` is `RKHS.kernel H x y 1`, and
  `K(x, x) = ‖RKHS.kernel H x x‖`.

## Exact supplier contracts

### From Mathlib

- **Shattering:** `Finset.vcDim` and the Sauer–Shelah bound `Finset.card_shatterer_le_sum_vcDim`
  (`Mathlib/Combinatorics/SetFamily/Shatter.lean`).
- **Reproducing kernels:** the class `RKHS`, `RKHS.kerFun`, `RKHS.kernel` and the evaluation
  bound `RKHS.norm_apply_le` (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`).
- **Sub-Gaussian variables:** `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`).
- **Conditional independence:** `ProbabilityTheory.CondIndepFun`, with the notation
  `X ⟂ᵢ[Z, hZ; μ] Y` and the characterisation `ProbabilityTheory.condIndepFun_iff`
  (`Mathlib/Probability/Independence/Conditional.lean`).
- **Divergences and distances:** `tvDist`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`),
  `klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`), `Metric.hausdorffDist`
  (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean`) and `hammingDist`
  (`Mathlib/InformationTheory/Hamming.lean`).
- **Laws and moments:** `gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean`),
  `variance` (`Mathlib/Probability/Moments/Variance.lean`) and `covariance`
  (`Mathlib/Probability/Moments/Covariance.lean`).
- **Kernels and densities:** `Measure.compProd` with the notation `μ ⊗ₘ κ`
  (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean`), `Measure.rnDeriv`
  (`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean`), and the composition `κ ∘ₘ μ`.
- **Spectra:** `Matrix.IsHermitian.eigenvalues` (`Mathlib/Analysis/Matrix/Spectrum.lean`).

Mathlib has no Rademacher complexity, PAC learnability, generalization bound, conformal
prediction, differential privacy or fairness criterion.

### From Tau Ceti

- **Bounded differences:** `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin`
  (`TauCeti/Probability/McDiarmid.lean`): a measurable `f : (Fin n → β) → ℝ` that changes by at
  most `c` when one coordinate changes satisfies `HasSubgaussianMGF` with parameter `n (c/2)²`
  under the product measure, which gives McDiarmid's inequality.
- **Bernstein's inequality:** `ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le`
  (`TauCeti/Probability/Moments/Bernstein.lean`): for independent centred `X i` with `|X i| ≤ b`,
  `μ(ε ≤ |∑ X i|) ≤ 2 exp(-ε²/(2(v + bε/3)))` with `v = ∑ E X i²`.
- **Laplace laws:** `TauCeti.Probability.laplaceMeasure μ b`, the law with density
  `(2b)⁻¹ exp(-|x - μ|/b)`, and `TauCeti.Probability.isProbabilityMeasure_laplaceMeasure` for
  `b > 0` (`TauCeti/Probability/Distributions/Laplace/Basic.lean`).
- **Exchangeability:** `TauCeti.Probability.ExchangeableFamily μ X`, equality of the joint laws
  along injective selections of indices (`TauCeti/Probability/Exchangeability/Family.lean`).
- **Empirical measures and order statistics:** `TauCeti.Probability.empiricalMeasure`, the
  empirical probability measure of the first `n + 1` terms of a sequence
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`), and `TauCeti.orderStatistic`
  (`TauCeti/Data/Fin/Tuple/OrderStatistic.lean`).
- **Wasserstein convergence and quantization:**
  `TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Empirical.lean`): almost surely the
  `p`-Wasserstein distance from the empirical measure to a law with finite `p`-th moment tends to
  `0`; `TauCeti.wassersteinQuantizationError`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/FiniteSupport.lean`) and
  `TauCeti.exists_wassersteinEDist_eq_wassersteinQuantizationError`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantization.lean`).
- **Relative entropy:** the chain rule `TauCeti.klDiv_compProd_eq_add_lintegral` and the
  tensorization `TauCeti.klDiv_prod_prod_eq_add`
  (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`).

### From MathematicalStatisticsAsymptotic

- 3.2: pointwise separability, of which `IsPointwiseSeparable` is a local copy, and covering
  and packing numbers.
- 3.3: the finite sub-Gaussian maximal inequality and chaining with Mathlib's
  `Metric.packingNumber`.
- 3.5: the VC dimension of a family of sets, of which `vcDimSet` is a local copy, the
  Sauer–Shelah bound for traces, and the uniform `L¹(Q)` covering bound for VC families.

### From MathematicalStatisticsNonparametric

- 1.4: Pinsker's inequality.
- 2.2: Le Cam's two-point method in its total variation and Kullback–Leibler forms.
- 5.6: `L²` consistency of the `k`-nearest-neighbour regression estimate, with distance ties
  broken by index, for `k → ∞` and `k/n → 0`.
- 5.8: the representer theorem for Mathlib's `RKHS`.

### From MathematicalStatisticsFoundations

- 8.5: i.i.d. sequences; 9.1: empirical measures and sample means; the Conventions on samples
  and on `tvDist / 2`.

## How to read the build

Layer 1 fixes the objects every later layer measures: risk, empirical risk, the Bayes
classifier, and the losses that replace the 0–1 loss. Layer 2 is the single source of uniform
deviation bounds: one symmetrization, one bounded-differences step (Tau Ceti's McDiarmid), and a
calculus of Rademacher averages (contraction, finite classes, convex hulls, kernel balls). Layer 3
turns the combinatorial capacity of Asymptotic 3.5 into the sample-complexity theory of PAC
learning, with the lower bounds by the probabilistic method. Layer 4 applies Layer 2 to
real-valued scores: margins via contraction, stability via McDiarmid directly, and kernel ridge
regression via localized Gaussian complexity.

Layers 5 and 6 are algorithms with guarantees. Layer 5 is distribution-free in the strong sense
(conformal prediction needs only exchangeability; nearest-neighbour and local-weight rules are
consistent for every law) and ends with `k`-means, which reduces to Wasserstein convergence of
empirical measures. Layer 6 collects the deterministic theory of trees, boosting and ensembles;
its only probabilistic input is the margin bound of 4.1 applied to AdaBoost.

Layers 7 and 8 are about data that are protected or shifted. Layer 7 is self-contained apart
from the Laplace and Gaussian laws and, for the lower bounds of 7.5, the minimax toolkit of
Nonparametric. Layer 8 uses conditional independence from Mathlib, Bernstein's inequality from
Tau Ceti and the disagreement argument of 1.1.

The layers are in build order. Layers 7 and 8 need only Layer 1 and the suppliers and may be
built directly after Layer 1.

## Layer 1: risk, Bayes rules and losses

### 1.1 Learning problems, risk and empirical risk minimization

- `labelSign b`, `empiricalMean g z`, `classificationError P h` and `empiricalError h z` as in
  the Conventions.
- **ERM inequality** (`le_add_two_mul_add_of_isApproxMin`; Devroye–Györfi–Lugosi, Lemma 8.2,
  p. 126): if `t₀` minimizes an empirical criterion `Rn` up to `ε` and `|Rn t - R t| ≤ D` for
  every `t`, then `R t₀ ≤ R t + 2D + ε` for every `t`. With `R` the risk and `D` the uniform
  deviation over a class, this is the excess-risk bound
  `R(f̂) - inf_F R ≤ 2 sup_F |R_n - R| + ε_n`.

*Proof route.* `R t₀ ≤ Rn t₀ + D ≤ Rn t + ε + D ≤ R t + 2D + ε`.

*Needs:* nothing beyond Mathlib.

**Checks.**

- `labelSign true = 1` and `labelSign false = -1`.
- `labelSign b * labelSign b = 1` for both values of `b`, so `labelSign y · h(x) > 0` exactly
  when the sign of the score agrees with the label.
- `labelSign` is not the Boolean-to-`{0, 1}` coding: `labelSign false = -1 ≠ 0`; a statement
  written with the `{0, 1}` coding of labels in a margin `y · h(x)` would make every score
  correct on the label `0`.
- `empiricalMean` of a constant `c` on a sample of size `n ≥ 1` is `c`.
- `empiricalMean` on the empty sample is `0` (the junk value of `x / 0`), not the constant `c`,
  which is why every bound below assumes `0 < n`.
- `empiricalMean g z` for `n = 2`, `g = id`, `z = (1, 3)` is `2`.
- `classificationError P h` for the law `P = ½ δ_(x, true) + ½ δ_(x, false)` is `1/2` for both
  constant classifiers: no classifier beats the coin when the label is independent of `x`.
- `classificationError P h = 0` when `P` is concentrated on the graph of `h`, and
  `classificationError P (not ∘ h) = 1` there.
- `classificationError P h + classificationError P (not ∘ h) = 1` for a measurable `h` and a
  probability `P`: exactly one of the two classifiers errs at each pair.
- `empiricalError h z` on the sample `((x, true), (x, false))` is `1/2` for every `h`.
- `empiricalError h z = 0` exactly when `h` is consistent with the sample.
- `empiricalError h z` counts the disagreements of `h`, not of the majority label: on
  `((x, true), (x, true))` the constant `false` has empirical error `1`, the majority vote `0`.

### 1.2 The Bayes classifier and plug-in rules

- `IsRegressionFunction P η`: `η` is measurable with values in `[0, 1]` and
  `P(X ∈ A, Y = true) = ∫_A η d(P.map Prod.fst)` for every measurable `A`; it is a version of
  `x ↦ P(Y = true | X = x)`.
- `bayesClassifier η x = decide (1/2 ≤ η x)`, the plug-in rule of a score `η`.
- **The Bayes classifier** (`classificationError_bayesClassifier`; Devroye–Györfi–Lugosi,
  Thm 2.1, p. 10, and Thm 2.2, p. 16): for a regression function `η` and a
  measurable `g`, `classificationError P (bayesClassifier η) = E min(η(X), 1 - η(X))`,
  `classificationError P (bayesClassifier η) ≤ classificationError P g`, and
  `classificationError P g - classificationError P (bayesClassifier η)` equals
  `E[|2η(X) - 1| 1{g(X) ≠ g*(X)}]`.
- **Plug-in bounds** (`classificationError_plugIn_sub_le`; Devroye–Györfi–Lugosi, Thm 2.2,
  p. 16): for a measurable integrable score `η̂`, the excess risk of `bayesClassifier η̂` is at
  most `2 E|η̂(X) - η(X)|`; and under the margin condition `P(|η(X) - 1/2| ≤ t) ≤ C t^α` for all
  `t > 0`, if `|η̂ - η| ≤ δ` everywhere with `δ > 0`, it is at most `2 C δ^(α + 1)`. A plug-in rule
  built from training data independent of the test pair satisfies both bounds conditionally on
  the training data, by applying them to the fixed score.

*Proof route.* Conditionally on `X = x`, the error of `g` is `η(x)` if `g(x) = false` and
`1 - η(x)` if `g(x) = true`; integrating against the marginal gives all three statements of the
first bullet. For the plug-in bound, disagreement of the two rules at `x` forces `η(x)` and `η̂(x)`
to lie on opposite sides of `1/2`, so `|2η(x) - 1| ≤ 2|η̂(x) - η(x)|`. Under the margin condition,
disagreement forces `|η(x) - 1/2| ≤ δ` and `|2η(x) - 1| ≤ 2δ`, so the excess risk is at most
`2δ P(|η - 1/2| ≤ δ) ≤ 2 C δ^(α+1)`. The margin form is not in Devroye–Györfi–Lugosi; the
argument is the one just given.

*Needs:* 1.1; Mathlib's disintegration of `P` along `Prod.fst` is not needed, since
`IsRegressionFunction` is stated on rectangles.

**Checks.**

- `IsRegressionFunction P η` with `P = μ ⊗ Bernoulli(η)` built from a measurable `η` with values in
  `[0, 1]`: `P(A × {true}) = ∫_A η dμ`, so `η` qualifies; two versions differ only on a
  `μ`-null set.
- `IsRegressionFunction` excludes the constant `η ≡ 2`: the value bound `η ∈ [0, 1]` fails, and the
  rectangle identity would give `P(A × {true}) = 2 μ(A) > μ(A)`.
- For `P = ½ δ_(x, true) + ½ δ_(x, false)` the constant `1/2` is the regression function.
- `bayesClassifier` at the tie `η = 1/2` returns `true`, while Devroye–Györfi–Lugosi's `g*`
  (p. 10) returns `0` there; both are Bayes rules, since at a tie either label errs with
  conditional probability `1/2`.
- `bayesClassifier η` with `η ≡ 0.2`: always `false`, with risk `0.2 = E min(η, 1 - η)`.
- `bayesClassifier` is not "the larger of `η` and `1 - η` as a number": it returns a label, and
  for `η = 0.8` the label is `true`, with conditional error `0.2`.
- Excess-risk identity with `η ≡ 0.8` and `g ≡ false`: excess `0.8 - 0.2 = 0.6 = |2 · 0.8 - 1|`.
- Plug-in bound with `X` uniform on `[0, 1]`, `η(x) = x`, `η̂ = η + 0.1`: the margin condition holds
  with `C = 2`, `α = 1`; the excess risk is `∫_{0.4}^{0.5} |2x - 1| dx = 0.01`, below the margin
  bound `2 · 2 · 0.1² = 0.04` and the `L¹` bound `0.2` (computed).
- Negative control for the margin bound: the margin condition is load-bearing. For
  `η ≡ 1/2 + δ/2` and `η̂ ≡ 1/2 - δ/2` the excess risk is `δ`, of first order; the condition with
  `α = 1` forces `C ≥ 2/δ` (take `t = δ/2`), and then `2Cδ² ≥ 4δ`, so the bound survives only
  through the size of `C`.

### 1.3 Proper losses

- **Logarithmic loss** (`crossEntropy_eq_entropy_add_relEntropy`): for probability vectors `p`,
  `q` on `Fin K` with `q j > 0` wherever `p j > 0`,
  `-∑ p j log q j = -∑ p j log p j + ∑ p j log(p j / q j)`, and the left side is at least the
  entropy `-∑ p j log p j`: the expected log loss is minimized by reporting the true
  probabilities.
- **Brier loss** (`brierScore_sub_eq`; Breiman–Friedman–Olshen–Stone, Prop 4.19, p. 122, for the
  equivalent mean-squared-error form): for a probability vector `p` and any `q : Fin K → ℝ`,
  `∑_j p j ∑_k (q k - 1{k = j})² - ∑_j p j ∑_k (p k - 1{k = j})² = ∑_k (q k - p k)²`.

*Proof route.* The logarithmic identity is the algebra `log q = log p - log(p/q)` on the terms with
`p j > 0`; the terms with `p j = 0` vanish on both sides. The inequality is Gibbs' inequality,
`∑ p log(p/q) ≥ 0`, from `log t ≤ t - 1` and `∑ q ≤ 1`. Mathlib's `klDiv` of the corresponding
measures on `Fin K` equals the finite sum, which identifies the right-hand term as the relative
entropy. The Brier identity expands both squares and uses `∑ p = 1`.

*Needs:* nothing beyond Mathlib.

### 1.4 Surrogate losses and calibration

- `condSurrogateRisk Φ η u = η Φ(-u) + (1 - η) Φ(u)`, the conditional risk of the score `u` when
  the label is `true` with probability `η`.
- `surrogateRisk P Φ h = E Φ(-labelSign(Y) h(X))`, valued in `ℝ≥0∞`.
- `marginError P h = P(labelSign(Y) h(X) ≤ 0)`.
- **Classification calibration** (`sign_of_isMinOn_condSurrogateRisk`;
  Mohri–Rostamizadeh–Talwalkar, Lemma 4.5, p. 74): for `Φ` convex and nondecreasing,
  differentiable at `0` with `Φ'(0) > 0`, and `η ∈ [0, 1]`, every real minimizer `u` of
  `condSurrogateRisk Φ η` is positive when `η > 1/2` and negative when `η < 1/2`, and `0` is a
  minimizer when `η = 1/2`.
- **Zhang's comparison inequality** (`marginError_sub_le_surrogateRisk_sub`;
  Mohri–Rostamizadeh–Talwalkar, Thm 4.7, p. 76; Zhang, *Statistical behavior and consistency of
  classification methods based on convex risk minimization*, 2004): for `Φ` convex,
  nondecreasing and nonnegative, `s ≥ 1`, `c > 0` and
  `|η(x) - 1/2|^s ≤ c^s (condSurrogateRisk Φ (η x) 0 - inf_u condSurrogateRisk Φ (η x) u)` for every
  `x`, every measurable score `h` with `P(h(X) = 0) = 0` satisfies
  `marginError P h - R* ≤ 2c (surrogateRisk P Φ h - inf_g surrogateRisk P Φ g)^(1/s)`, the infimum
  over measurable `g` and `R*` the Bayes risk of 1.2.
- **The tie hypothesis cannot be dropped.** For `η ≡ 1/2` and `h ≡ 0`, `marginError P h = 1` and
  `R* = 1/2`, while `surrogateRisk P Φ h = Φ(0)` is the minimum (by convexity,
  `(Φ(u) + Φ(-u))/2 ≥ Φ(0)`). Mohri–Rostamizadeh–Talwalkar's statement omits the hypothesis; it
  is needed because ties are counted as errors.
- **Hinge and squared hinge.** For `Φ(u) = max(0, 1 + u)` one may take `s = 1`, `c = 1/2`; for
  `Φ(u) = max(0, 1 + u)²`, `s = 2`, `c = 1/2` (Mohri–Rostamizadeh–Talwalkar, Exercise 4.3, p. 78,
  and the discussion after Thm 4.7). The hinge loss thus gives
  `marginError P h - R* ≤ surrogateRisk P Φ h - inf surrogateRisk`.

*Proof route.* Calibration: `u` minimizes the convex function `condSurrogateRisk Φ η` iff
`0 ∈ -η ∂Φ(-u) + (1 - η) ∂Φ(u)`; monotonicity of subgradients of a convex function and
`Φ'(0) > 0` exclude a minimizer of the wrong sign, as in the proof of Mohri's Lemma 4.5. The
comparison: by 1.2 the excess risk is `E[|2η - 1| 1{sign h ≠ g*}]` once `P(h = 0) = 0`. On the
disagreement set, `h(x)` has the wrong sign, so by convexity and calibration
`condSurrogateRisk Φ (η x) (h x) ≥ condSurrogateRisk Φ (η x) 0`; the hypothesis then bounds
`|2η - 1|^s` by `(2c)^s` times the conditional excess surrogate risk, and Jensen's inequality
for `t ↦ t^s` finishes. The infimum over measurable `g` equals the integral of the pointwise
infimum, by a measurable selection of near-minimizers on a grid of rational scores.

*Needs:* 1.2; Mathlib `ConvexOn`, `DifferentiableAt`, Jensen's inequality.

**Checks.**

- `condSurrogateRisk` for the hinge loss at `η = 0.8`: the infimum over `u` is `0.4`, attained on
  `u = 1` only, and `condSurrogateRisk Φ 0.8 0 = 1`, so the gap is `0.6 = |2η - 1|`
  (computed on a grid).
- `condSurrogateRisk` for the squared hinge at `η = 0.8`: the minimizer is `u = 2η - 1 = 0.6` and
  the gap is `(2η - 1)² = 0.36` (computed).
- `condSurrogateRisk Φ (1/2) u = (Φ(u) + Φ(-u))/2` is even in `u`, so a minimizer of the wrong
  sign at `η = 1/2` is not excluded; the calibration statement asserts only that `0` minimizes.
- `surrogateRisk P Φ h` is `⊤` for `Φ = exp`, a law whose labels are all `true` and a score with
  `E exp(-h(X)) = ∞`; the `ℝ≥0∞` value avoids the junk value `0` of a non-integrable Bochner
  integral, which would make every such `h` look optimal.
- `surrogateRisk P Φ 0 = Φ(0)` for every `P`.
- `marginError P 0 = 1` for every probability `P`: ties are errors.
- `marginError P h = classificationError P (fun x ↦ decide (0 < h x))` when `P(h(X) = 0) = 0`.
- Negative control: `marginError` with the strict inequality `< 0` would make `h ≡ 0` perfect;
  under the tie hypothesis `P(h(X) = 0) = 0` both conventions agree with the misclassification
  risk of the sign of `h`.

### Examples

- Logistic loss `Φ(u) = log(1 + e^u)`: `Φ'(0) = 1/2 > 0`, so it is classification calibrated; the
  conditional minimizer is `u = log(η/(1 - η))`, which has the sign of `η - 1/2`.
- Proper losses with `p = (0.5, 0.3, 0.2)`, `q = (0.2, 0.5, 0.3)`: cross entropy `1.2535` equals
  entropy `1.0297` plus relative entropy `0.2238`; the Brier excess is `0.14 = ∑ (q - p)²`
  (computed).

### Dependencies

Mathlib only.

## Layer 2: Rademacher averages

### 2.1 Empirical Rademacher complexity and its calculus

- `empiricalRademacherComplexity f z = 2^(-n) ∑_σ sup_t n⁻¹ ∑ labelSign(σ i) f t (z i)`, for an
  indexed class `f : T → Z → ℝ` and a sample `z : Fin n → Z`, valued in `EReal` (Mohri–
  Rostamizadeh–Talwalkar, Def 3.1, p. 30, and Def 3.2, p. 31, for the expected version).
- **Contraction** (`empiricalRademacherComplexity_comp_le`; Mohri–Rostamizadeh–Talwalkar,
  Lemma 5.7, p. 93; Koltchinskii, Thm 2.2, p. 20; Boucheron–Lugosi–Massart, Thm 11.6, p. 324):
  if `φ w` is `L`-Lipschitz for every `w`, the class `(t, w) ↦ φ w (f t w)` has empirical
  Rademacher complexity at most `L` times that of `f`. No condition `φ(0) = 0` is needed for the
  signed complexity; the absolute-value version of Koltchinskii and Boucheron–Lugosi–Massart
  needs it.
- **Massart's lemma** (Mohri–Rostamizadeh–Talwalkar, Thm 3.7, p. 35): for a finite nonempty
  class with `√(∑ i f t (z i)²) ≤ r` for all `t`, the empirical Rademacher complexity is at most
  `r √(2 log |T|) / n`.
- **Convex hulls** (Mohri–Rostamizadeh–Talwalkar, Lemma 7.4, p. 157): the class of finite convex
  combinations `∑ j w j f (t j)` has the same empirical Rademacher complexity as `f`.

*Proof route.* Contraction: condition on all signs but one and compare the two values of the
remaining sign, as in Mohri's proof of Lemma 5.7; induction on the coordinates. For a supremum
that is `⊤` the inequality is trivial, and for the empty class both sides are `⊥`. Massart: for
`λ > 0`, Jensen and Hoeffding's lemma give
`exp(λ n R) ≤ ∑_t E exp(λ ∑ σ_i a_ti) ≤ |T| exp(λ² r²/2)`; optimize in `λ`. Convex hulls: a
linear functional of `w` on the simplex is maximized at a vertex.

*Needs:* Mathlib `LipschitzWith`, Jensen's inequality.

**Checks.**

- `empiricalRademacherComplexity` of a one-member class is `0`: the average of `∑ σ_i a_i` over
  all sign vectors vanishes (computed for `n = 2`, `a = (0.7, 0.7)`).
- `empiricalRademacherComplexity` of the empty class is `⊥`, and of the class of all constants
  `c ∈ ℝ` on `n = 1` it is `⊤`, since `sup_c σ c = ∞` for both signs.
- On the empty sample (`n = 0`) the complexity of a nonempty class is `0`.
- The complexity is not the supremum of the absolute values: for the two-member class
  `{a, -a}` with `a = (1, 0)` on `n = 2` it is `1/2`, while the absolute version is also `1/2`, but
  for `{a}` alone the signed version is `0` and the absolute version is `1/2`.
- Massart with the two unit vectors of `ℝ²` and `n = 2`: complexity `1/4`, bound
  `√(2 log 2)/2 = 0.589` (computed).

### 2.2 Kernel balls

- **Kernel ball** (`empiricalRademacherComplexity_closedBall_le`; Mohri–Rostamizadeh–Talwalkar,
  Thm 6.12, p. 118): for Mathlib's `RKHS ℝ H X ℝ` and `B ≥ 0`, the ball
  `{h ∈ H : ‖h‖ ≤ B}` has empirical Rademacher complexity at most
  `(B/n) √(∑ i K(x i, x i))`, and at most `B r / √n` when `K(x i, x i) ≤ r²` for all `i`.

*Proof route.* By the reproducing property (`RKHS.inner_kerFun`),
`∑ σ_i h(x i) = ⟪h, ∑ σ_i kerFun(x i)⟫ ≤ B ‖∑ σ_i kerFun(x i)‖`; Jensen moves the expectation
under the square root, and the cross terms `σ_i σ_j K(x i, x j)` average to `0`.

*Needs:* 2.1; Mathlib `RKHS.kerFun`, `RKHS.kernel`.

**Checks.**

- `n = 1`, `K(x, x) = 2`, `B = 3`: the complexity equals the bound `3√2` (computed): the supremum
  `sup_{‖h‖ ≤ B} σ h(x) = B ‖kerFun x‖` is attained.
- Gaussian kernel at two points at distance `1`, `B = 1`: the complexity is
  `(√(2 + 2e⁻¹) + √(2 - 2e⁻¹))/4 = 0.6946`, below the bound `√2/2 = 0.7071` (computed).

### 2.3 The Rademacher bound

- **Rademacher bound** (`rademacher_bound`; Mohri–Rostamizadeh–Talwalkar, Thm 3.3, p. 31;
  Boucheron–Lugosi–Massart, Lemma 11.4, p. 322, for the symmetrization): for a pointwise separable
  class of measurable functions with values in `[0, 1]`, `n ≥ 1`, and `ERad` the expectation of the
  empirical Rademacher complexity under the sample,
  - `E sup_t (P_n f_t - P f_t) ≤ 2 ERad` and `E sup_t (P f_t - P_n f_t) ≤ 2 ERad`;
  - for `δ ∈ (0, 1)`, with probability at least `1 - δ`,
    `sup_t |P_n f_t - P f_t| ≤ 2 ERad + √(log(2/δ)/(2n))`;
  - for `δ ∈ (0, 1)`, with probability at least `1 - δ`,
    `sup_t (P f_t - P_n f_t) ≤ 2 R̂ad(z) + 3 √(log(2/δ)/(2n))`, with the empirical complexity on
    the sample.

*Proof route.* One-sided symmetrization: with an independent ghost sample `z'`,
`E sup (P_n - P) f ≤ E sup n⁻¹ ∑ (f(z i) - f(z' i))`, and the swap of `z i` and `z' i` multiplies
the summand by a sign, so the right side is `E sup n⁻¹ ∑ σ_i (f(z i) - f(z' i)) ≤ 2 ERad`. The
class is pointwise separable, so the suprema are suprema over a countable subfamily and are
measurable. The suprema change by at most `1/n` when one sample point changes, so Tau Ceti's
`TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin` with `c = 1/n` gives the
deviation `√(log(1/δ')/(2n))` with probability `1 - δ'`. The two-sided bound applies this to `f`
and `-f` with `δ' = δ/2` each; the signed complexity of `-f` has the same expectation as that of
`f`, by the symmetry of the signs. The empirical version applies the bounded-differences step
also to the empirical complexity, which changes by at most `1/n`, and splits `δ` in two.

*Needs:* 2.1; Asymptotic 3.2 (pointwise separability); Tau Ceti McDiarmid.

**Checks.**

- A one-member class `{f}`: the complexity is `0`, and the high-probability bound reduces to
  Hoeffding's inequality `|P_n f - P f| ≤ √(log(2/δ)/(2n))`.
- Countable classes are pointwise separable, so the hypothesis is automatic for them; for
  uncountable classes it is what makes the suprema measurable, and Asymptotic 3.2 records a class
  without it whose supremum is not measurable.
- `n = 1`, a class with values in `[0, 1]`: the deviation term `√(log(2/δ)/2)` exceeds `1` for
  `δ < 2e⁻²`, so the bound is trivially true there, as it must be.

### 2.4 Finite classes and hold-out selection

- **Finite classes** (Devroye–Györfi–Lugosi, Thm 8.3, p. 127): for `N` classifiers and `n`
  independent samples, the probability that
  `max_j |empiricalError (φ j) z - classificationError P (φ j)| > ε` is at most
  `2N exp(-2nε²)`.
- **Hold-out selection** (`holdOut_selection`): for `N` measurable classifiers fixed in advance
  (computed from an independent training part), and the classifier `φ (sel z)` of smallest error
  on a hold-out sample of size `l ≥ 1`, with probability at least `1 - δ`,
  `classificationError P (φ (sel z)) ≤ min_j classificationError P (φ j) + √(2 log(2N/δ)/l)`.
  Conditionally on the training part this is the hold-out bound of the source texts.

*Proof route.* The finite-class bound is Hoeffding's inequality (the case `N = 1` of 2.3) and a
union bound. For hold-out, on the event `max_j |L̂_j - L_j| ≤ t` with
`t = √(log(2N/δ)/(2l))`, `L(φ̂) ≤ L̂(φ̂) + t ≤ L̂(φ_j) + t ≤ L(φ_j) + 2t`, and
`2t = √(2 log(2N/δ)/l)`.

*Needs:* 2.3.

**Checks.**

- `N = 1`: the selector is constant and the event is empty.
- The hypothesis `l ≥ 1` is needed: for `l = 0` the threshold `√(2 log(2N/δ)/0)` is the junk value
  `0`, and the selected classifier can be strictly worse than the best with probability `1`.

### Examples

- For the class of indicators of half-lines on `ℝ`, Massart and Sauer–Shelah give
  `R̂ad ≤ √(2 log(n + 1)/n)`, so 2.3 recovers a Glivenko–Cantelli rate for the empirical
  distribution function.

### Dependencies

Layer 1; Tau Ceti McDiarmid; Asymptotic 3.2; Mathlib `RKHS`.

## Layer 3: VC dimension and PAC learnability

### 3.1 Capacity and learnability

- `vcDim H = vcDimSet {{x | h x = true} | h ∈ H}`, the VC dimension of a class of classifiers
  through Asymptotic 3.5; `indicatorClass H` is the real class `(h, x) ↦ 1{h x = true}`.
- `IsAgnosticPACLearnable H`: there are a rule `A` with values in `H` and a sample size
  `m(ε, δ)` such that for all `ε, δ ∈ (0, 1)`, every law `P` of `(X, Y)` and every
  `n ≥ m(ε, δ)`, `P^n(inf_H R + ε < R(A z)) ≤ δ`.
- `IsRealizablePACLearnable H`: the same for the laws with `R(h) = 0` for some `h ∈ H`, with the
  event `ε < R(A z)`.

(Anthony–Bartlett, Def 2.1, p. 16, and §4.1, p. 42, for the realizable and agnostic definitions,
in their function-learning form; Mohri–Rostamizadeh–Talwalkar, Def 2.3, p. 11, and Def 2.14,
p. 22.)

**Checks.**

- `vcDim` of the threshold classifiers `x ↦ decide (x ≤ t)` on `ℝ` is `1`; of the interval
  classifiers `2`.
- `vcDim` of a two-member class `{h, not ∘ h}` on a nonempty `X` is `1`: it shatters every single
  point and no pair.
- `vcDim ∅ = 0` and `vcDim {h} = 0`: the empty class shatters nothing, a singleton class only `∅`.
- `vcDim` of all classifiers on an infinite `X` is `⊤`.
- `indicatorClass H` takes values in `{0, 1}`.
- `indicatorClass H` is pointwise separable for countable `H`.
- `empiricalRademacherComplexity (indicatorClass {h, not ∘ h})` on one point is `1/2`
  (`(1 + 0)/2` over the two signs); with the coding `labelSign` in place of the indicator it would
  be `1`, since the `±1` coding is twice the indicator minus `1` and constant shifts average out.
- `IsAgnosticPACLearnable ∅` is false: a rule with values in `∅` does not exist, since the type of
  samples of size `0` is nonempty. So the fundamental theorem below assumes `H` nonempty.
- `IsRealizablePACLearnable` of a singleton class `{h}`: the constant rule works with `m = 0`.
- `IsAgnosticPACLearnable` of a finite nonempty class: empirical risk minimization works with
  `m(ε, δ) = ⌈2 log(2|H|/δ)/ε²⌉`, by the finite-class bound of 2.4 with deviation `ε/2`.
- `IsAgnosticPACLearnable H` implies `IsRealizablePACLearnable H`: on a realizable law
  `inf_H R = 0`, so the same rule and sample size work.
- `IsRealizablePACLearnable` fails for the class of all classifiers on `ℕ` (by 3.5), although
  every law is realizable for it.
- Negative control for the realizable convention: with "infimum of the errors is zero" in place
  of "some member has error zero", the threshold class `{x ↦ decide (x ≤ t) | t < 0}` under
  `δ_(0, true)` would be realizable although every member errs at `0` with probability `1`.

### 3.2 Upper bounds

- **Uniform deviation over a VC class** (`uniform_deviation_vcDim`; Mohri–Rostamizadeh–Talwalkar,
  Cor 3.19, p. 42; Vapnik, Thm 4.3, p. 145, and Schölkopf–Smola, Thm 5.3, p. 134, for the
  growth-function form): there is a universal
  `C` such that for every pointwise separable class of measurable classifiers of VC dimension
  `v ≥ 1`, every law, `n ≥ 2` and `δ ∈ (0, 1)`, with probability at least `1 - δ` every member
  satisfies `R(h) ≤ R_n(h) + C √((v log n + log(1/δ))/n)`.
- **Agnostic sample complexity of ERM** (`agnostic_erm_sampleComplexity`; Anthony–Bartlett,
  Thm 4.10, p. 54; Boucheron–Lugosi–Massart, Thm 13.7, p. 373, for the chaining bound behind
  it): there is a universal `C` such that every empirical risk minimizer over a pointwise
  separable class of measurable classifiers of VC dimension `d` has excess risk at most `ε` with
  probability at least `1 - δ` once `n ≥ C (d + log(1/δ))/ε²`.
- **Realizable sample complexity of consistent rules** (`realizable_consistent_sampleComplexity`;
  Anthony–Bartlett, Thm 4.8, p. 53, with `m ≥ (4/ε)(d log(12/ε) + log(2/δ))`): there is a
  universal `C` such that every rule that returns a member with zero empirical error whenever one
  exists has error at most `ε` with probability at least `1 - δ` under every realizable law once
  `n ≥ C (d log(2/ε) + log(1/δ))/ε`.

*Proof route.* Uniform deviation: the traces of the class on the sample have at most
`∑_{j ≤ v} (n choose j) ≤ (en/v)^v` members (Sauer–Shelah, Asymptotic 3.5), so Massart's lemma (2.1)
gives `R̂ad ≤ √(2 v log(en/v)/n)`, and `log(en/v) ≤ 3 log n` for `n ≥ 2`; then the third bullet of
2.3. Agnostic: the expected uniform deviation is at most `K √(d/n)` by chaining (Asymptotic 3.3)
with the VC covering bound (Asymptotic 3.5), the route of Boucheron–Lugosi–Massart, Thm 13.7;
bounded differences add `√(log(1/δ)/(2n))`, and the ERM inequality of 1.1 doubles the deviation.
Realizable: the ghost-sample argument of Anthony–Bartlett's proof of Thm 4.8, with the permutation
bound, gives `P(∃ h ∈ H, R_n(h) = 0, R(h) > ε) ≤ 2 Π_H(2n) 2^(-εn/2)`; Sauer–Shelah and the solution
of the resulting inequality give Thm 4.8. For `d = 0` all members agree everywhere and both upper
bounds are trivial; for `d ≥ 1` the factor `log(2/ε) ≥ log 2` absorbs the constants of
Anthony–Bartlett.

*Needs:* 1.1, 2.1, 2.3; Asymptotic 3.3, 3.5; Mathlib `Finset.card_shatterer_le_sum_vcDim`.

**Checks.**

- The realizable bound uses `log(2/ε)`, not `log(1/ε)`: with `log(1/ε)` the bound would claim
  `n ≥ C log(1/δ)/ε` samples suffice as `ε → 1` whatever `d`. For the class of all classifiers
  on `d` points, the uniform law and a consistent rule that labels unseen points against the
  target, the error is the unseen mass, about `1 - n/d`, which exceeds `0.99` for `n ≤ d/200`.
- `d = 0`, two agreeing members: the ERM has excess risk `0` for every `n`, consistent with the
  agnostic bound at `n = ⌈C log(1/δ)/ε²⌉`.

### 3.3 Lower bounds

- **Lower bounds** (`sampleComplexity_lower_bound`; Anthony–Bartlett, Thm 5.2, p. 62, and
  Thm 5.3, p. 66; Mohri–Rostamizadeh–Talwalkar, Thm 3.20, p. 43, and Thm 3.23, p. 46;
  Devroye–Györfi–Lugosi, Thm 14.1, p. 235, and Thm 14.5, p. 240): there is a universal `c > 0`
  such that for every class of measurable classifiers of VC dimension `d ≥ 1` and every rule
  with values in the class,
  - for `ε, δ ∈ (0, 1/64)` and `n < c (d + log(1/δ))/ε²` some law makes
    `P^n(inf_H R + ε < R(A z)) > δ`;
  - if the class has at least three members, for `ε ∈ (0, 1/8)`, `δ ∈ (0, 1/100)` and
    `n < c (d + log(1/δ))/ε` some law under which a member has error zero makes
    `P^n(ε < R(A z)) > δ`.
- **The hypotheses are needed.** The class `{h, not ∘ h}` on a one-point space has `d = 1` and two
  members: one sample reveals the target, so the realizable sample complexity is at most `1` for
  every `δ`, and no bound growing like `log(1/δ)/ε` holds. Anthony–Bartlett's realizable `log(1/δ)`
  term needs at least three members, its `d` term `d ≥ 2`; with at least three members and `d = 1`
  the `log(1/δ)` term dominates `d` since `log 100 > 1`. The agnostic `log(1/δ)` term needs at least
  two members, which `d ≥ 1` guarantees.
- **Infinite VC dimension** (Devroye–Györfi–Lugosi, Thm 14.3, p. 239): if `vcDim H = ⊤`, then
  for every rule and every `n` some law under which a member has error zero makes the expected
  error of the rule at least a universal positive constant. This is the limit `d → ∞` of the
  realizable bound, and 3.4 uses it.

*Proof route.* The probabilistic method on a shattered set, as in Anthony–Bartlett: in the
agnostic case, conditional probabilities `(1 ± cε)/2` on `d` shattered points, a uniformly random
sign pattern, and the two-point testing bound for each point, which needs order `1/ε²`
observations of it; in the realizable case, mass `1 - 8ε` on one point and `8ε/(d - 1)` on the
others, so that a sample of size `o(d/ε)` misses half of the light points. The `log(1/δ)` terms use
two (agnostic) or three (realizable) members and the probability that a small sample is
uninformative. Outer probabilities only increase failure probabilities, so the rules need no
measurability.

*Needs:* 3.1; Nonparametric 2.2 for the two-point bound.

### 3.4 The fundamental theorem

- **Fundamental theorem of statistical learning** (`vcDim_lt_top_iff_isPACLearnable`;
  Anthony–Bartlett, Thm 5.4, p. 69, and Thm 5.5, p. 69; Vapnik, Thm 4.5, p. 149, for the
  uniform-convergence form): for a nonempty pointwise separable class of measurable classifiers,
  `vcDim H < ⊤ ↔ IsRealizablePACLearnable H` and `vcDim H < ⊤ ↔ IsAgnosticPACLearnable H`.
- With 3.2 and 3.3, the realizable sample complexity lies between `c (d + log(1/δ))/ε` (for at least
  three members) and `C (d log(2/ε) + log(1/δ))/ε`, and the agnostic one between
  `c (d + log(1/δ))/ε²` and `C (d + log(1/δ))/ε²`, for `ε, δ` below the constants of 3.3.

*Proof route.* Finite dimension gives agnostic learnability by an empirical risk minimizer (it
exists, since the empirical errors take finitely many values) and 3.2; agnostic implies
realizable by restricting the laws; realizable learnability with infinite dimension contradicts
3.3 with `d` larger than `m(ε, δ)/c · ε`.

*Needs:* 3.2, 3.3.

### 3.5 No free lunch

- **No free lunch** (`exists_lintegral_classificationError_ge`; Devroye–Györfi–Lugosi,
  Thm 7.1, p. 112, stated for `ℝ^d`): on an infinite space with measurable singletons, for every
  rule `A`, sample size `n` and `ε > 0` there is a law under which some measurable classifier has
  error zero and `E R(A z) ≥ 1/2 - ε`.

*Proof route.* Devroye–Györfi–Lugosi's argument uses only countably many points: put the law
uniformly on `K ≥ n/(2ε)` points, with a uniformly random labelling; averaged over labellings,
the rule errs with probability `1/2` on each point outside the sample, and these carry mass at
least `1 - n/K`, so the average error is at least `(1 - n/K)/2 ≥ 1/2 - ε`; some labelling attains
the average. Measurable singletons make the finite
supports measurable and every function on them measurable.

*Needs:* 3.1.

**Checks.**

- `Infinite X` is needed: on a finite `X`, under a law with error zero for some classifier, the
  rule that copies the labels seen in the sample errs only on unseen points, whose expected mass
  `∑_x p(x)(1 - p(x))^n` is at most `|X|/n`, below `1/2 - ε` for large `n`.
- With `n = 0` the rule sees nothing, and for `K` points with a random labelling its expected
  error is exactly `1/2`, so the bound `1/2 - ε` cannot be raised to `1/2 + ε`.

### Examples

- Half-spaces in `ℝ^p` have VC dimension `p + 1` (Asymptotic 3.5), so linear classifiers are PAC
  learnable with `n = O((p + log(1/δ))/ε²)` samples.

### Dependencies

Layers 1–2; Asymptotic 3.3 and 3.5; Nonparametric 2.2.

## Layer 4: margins, stability and kernel regression

### 4.1 The margin bound

- `rampLoss ρ u = min(1, max(0, 1 - u/ρ))` and `empiricalMarginLoss ρ h z`, its sample average at
  `labelSign(Y_i) h(X_i)`.
- **Margin bound** (`marginError_le_empiricalMarginLoss`; Mohri–Rostamizadeh–Talwalkar,
  Thm 5.8, p. 94): for a bounded pointwise separable class of measurable scores, `ρ > 0`, `n ≥ 1`
  and `δ ∈ (0, 1)`, with probability at least `1 - δ` every member satisfies
  `marginError P h ≤ empiricalMarginLoss ρ h z + (2/ρ) ERad + √(log(1/δ)/(2n))`, and, with
  probability at least `1 - δ`,
  `marginError P h ≤ empiricalMarginLoss ρ h z + (2/ρ) R̂ad(z) + 3 √(log(2/δ)/(2n))`, with the
  Rademacher complexities of the class on the feature sample.
- **Kernel form**: for the ball `‖h‖ ≤ Λ` of an `RKHS` with `K(x, x) ≤ r²`, 2.2 bounds the
  complexity term `(2/ρ) R̂ad` by `2Λr/(ρ√n)`.

*Proof route.* `1{u ≤ 0} ≤ rampLoss ρ u ≤ 1{u ≤ ρ}`; apply the one-sided bounds of 2.3 to the class
`rampLoss ρ (labelSign y h(x))` with values in `[0, 1]`, and contraction (2.1) with `L = 1/ρ`; the
label sign is absorbed by the symmetry of the Rademacher signs. The expected-complexity version
uses the bounded-differences step once, with `log(1/δ)`; the empirical version twice. The class is
bounded so that the complexities are finite.

*Needs:* 2.1–2.3.

**Checks.**

- `rampLoss ρ u = 1` for `u ≤ 0`, `= 0` for `u ≥ ρ`, and `= 1/2` at `u = ρ/2`.
- `rampLoss ρ` is `1/ρ`-Lipschitz and is not the hinge loss: `max(0, 1 - u/ρ)` at `u = -ρ` is `2`,
  while `rampLoss ρ (-ρ) = 1`.
- `empiricalMarginLoss ρ h z` is at least the empirical error of the sign rule
  `x ↦ decide (0 < h x)`.
- `empiricalMarginLoss ρ h z` is at most the fraction of sample margins `≤ ρ`.
- `empiricalMarginLoss ρ h z` for one point with margin `ρ/2` is `1/2`, while the fraction of
  margins `≤ ρ` is `1` and the empirical error is `0`: neither indicator is the ramp.

### 4.2 Uniform stability

- **Stability bound** (`stable_generalization`; Mohri–Rostamizadeh–Talwalkar, Def 14.1, p. 334,
  and Thm 14.2, pp. 334–335): for a jointly measurable loss `L S z ∈ [0, M]` of the predictor
  trained on `S`, uniformly `β`-stable (changing one sample point changes every `L S z` by at most
  `β`), `n ≥ 1` and `δ ∈ (0, 1)`, with probability at least `1 - δ`,
  `∫ L S dP ≤ empiricalMean (L S) S + β + (2nβ + M) √(log(1/δ)/(2n))`.
- **Regularized kernel methods** (`uniformStability_rkhs_regularized`;
  Mohri–Rostamizadeh–Talwalkar, Def 14.3, p. 337, and Prop 14.4, p. 338): for an `RKHS` with
  `K(x, x) ≤ r²`, a loss `c y` convex and `G`-Lipschitz in the prediction, `λ > 0` and any
  minimizer `A S` of `n⁻¹ ∑ c(y_i, h(x_i)) + λ ‖h‖²`, changing one sample point changes every loss
  value by at most `G² r²/(nλ)`.
- **Average stability** (Hardt–Recht, Def 9, p. 111, and Prop 7, p. 112): the expected
  generalization gap equals the average stability `E n⁻¹ ∑ (L(A S, Z'ᵢ) - L(A S^(i), Z'ᵢ))`, with
  `S^(i)` the sample with its `i`-th point replaced by an independent copy `Z'ᵢ`; for a loss that
  is `μ`-strongly convex and `L`-Lipschitz in a parameter, empirical risk minimization has
  uniform stability at most `4L²/(μn)` (Hardt–Recht, Thm 4, p. 113).

*Proof route.* Stability bound: `Φ(S) = R(A S) - R̂(A S)` has expectation at most `β` (the
replace-one identity of Hardt–Recht's Prop 7) and changes by at most `2β + M/n` when one point
changes; Tau Ceti's bounded-differences theorem gives the deviation. Regularized methods: the
objective is `2λ`-strongly convex in `H`, so comparing the two minimizers gives
`2λ ‖A S - A S'‖² ≤ (2G r/n) ‖A S - A S'‖`, by the Lipschitz bound on the single changed term and
`|h(x)| ≤ ‖h‖ r` (`RKHS.norm_apply_le`); then `|c(y, A S x) - c(y, A S' x)| ≤ G r ‖A S - A S'‖`.

*Needs:* 1.1; Tau Ceti McDiarmid; Mathlib `RKHS.norm_apply_le`; Nonparametric 5.8 for the
existence of minimizers in the span of the kernel functions.

**Checks.**

- A constant algorithm (`L S z = ℓ(z)` independent of `S`) is `0`-stable, and the bound reduces to
  Hoeffding's inequality for `ℓ`.
- `n = 1`, `β = M`: the bound is `R ≤ R̂ + M + 3M √(log(1/δ)/2)`, never violated since `R ≤ M`.

### 4.3 Kernel ridge regression

- `krrObjective x y λ f = (2n)⁻¹ ∑ (y_i - f(x_i))² + λ ‖f‖²`; `empiricalNormSq x g = n⁻¹ ∑ g(x_i)²`;
  `gramMatrix H x = (K(x i, x j))_{i,j}`.
- **Closed form** (Cucker–Zhou, Prop 8.7, p. 139, for the convention without the factor `1/2`;
  Schölkopf–Smola, Thm 4.2, p. 90, for the representer theorem): the minimizer is
  `∑ a_i kerFun(x i)` with `(K + 2nλ I) a = y`. Proof: by the representer theorem (Nonparametric
  5.8) the minimizer lies in the span; on the span the objective is `(2n)⁻¹ ‖y - K a‖² + λ aᵀ K a`,
  whose gradient vanishes when `K(K a + 2nλ a - y) = 0`.
- **Oracle inequality** (`krr_oracle_inequality`; Wainwright, Thm 13.17, p. 439, and
  Cor 13.18, p. 440): there are universal `c₀, c₁, c₂, c₃ > 0` such that, on a fixed design with
  `y_i = f*(x_i) + σ w_i`, `w` standard Gaussian, if `δ > 0` satisfies the critical inequality
  `√((2/n) ∑_j min(δ², μ̂_j)) ≤ R δ²/(4σ)` for the eigenvalues `μ̂_j` of `K/n` and `λ ≥ 2δ²`, then
  `‖f̂ - f*‖_n² ≤ c₀ inf_{‖f‖ ≤ R} (‖f - f*‖_n² + c₁ R² (δ² + λ))` with probability at least
  `1 - c₂ exp(-c₃ n R² δ²/σ²)`, and in expectation.
- **Finite rank**: if `μ̂_j = 0` for `j > m`, the critical inequality holds with
  `δ² = 32σ² m/(nR²)`, since then `√((2/n) m δ²) = R δ²/(4σ)`.
- **Polynomial decay**: if `μ̂_j ≤ c j^(-2α)` with `α > 1/2`, it holds with
  `δ² = C (σ²/n)^(2α/(2α+1))`, `C` depending on `c`, `α` and `R` (Wainwright, Example 13.19,
  p. 440, and the discussion after Cor 13.18).
- **Sobolev kernel**: for `K(x, z) = min(x, z)` on `[0, 1]` and `x_i = i/n`, `μ̂_j ≤ 9/(4j²)`, so
  `α = 1` and `δ² ≍ (σ²/n)^(2/3)`.

*Proof route.* The oracle inequality is Wainwright's localization argument: the basic inequality
for the penalized estimator, the Gaussian complexity of the localized kernel ball bounded by
`√((2/n) ∑ min(δ², μ̂_j))` through the eigen-expansion of the Gram matrix, and Gaussian
concentration of the supremum (Lipschitz in `w`). The Sobolev bound: the eigenvalues of
`(min(i, j))_{i,j ≤ n}` are `1/(4 sin²((2j-1)π/(4n+2)))`, and `sin t ≥ 2t/π` on `[0, π/2]` gives
`μ̂_j ≤ ((2n+1)/(2n))²/(2j-1)² ≤ 9/(4j²)`.

*Needs:* 2.2; Nonparametric 5.8; Mathlib `gaussianReal`, `Matrix.IsHermitian.eigenvalues`.

**Checks.**

- `krrObjective` with one point, `H = ℝ` on a one-point set (`K = 1`): the minimizer of
  `(y - f)²/2 + λ f²` is `y/(1 + 2λ)`, the closed form with `n = 1`.
- `krrObjective` at `λ = 0` is half the empirical squared error, and its minimizers interpolate
  when `K` is invertible.
- `krrObjective` is not Cucker–Zhou's `n⁻¹ ∑ (y - f)² + γ‖f‖²`: the two agree for `γ = 2λ`.
- `empiricalNormSq x g = 0` iff `g` vanishes on the design.
- `empiricalNormSq` with `n = 2`, `g(x_1) = 1`, `g(x_2) = 3`: `5`.
- `empiricalNormSq` is not the `L²(P)` norm: it ignores `g` off the design.
- `gramMatrix` for the Gaussian kernel at two points at distance `1`: `[[1, e⁻¹], [e⁻¹, 1]]`, with
  eigenvalues `1 ± e⁻¹`.
- `gramMatrix` is positive semidefinite (Mathlib `RKHS.posSemidef_kernel`), so the `μ̂_j` are
  nonnegative.
- `gramMatrix` holds kernel values, not inner products of the inputs: for the Gaussian kernel its
  diagonal is `1` whatever the points, while `⟪x i, x i⟫ = ‖x i‖²`.
- Finite rank with `σ = 1`, `R = 1`, `m = 3`, `n = 100`: `δ² = 0.96`, and both sides of the
  critical inequality equal `0.24` (computed).
- Sobolev design: `max_j μ̂_j j²` is `0.494` for `n = 5`, `0.426` for `n = 20` and `0.409` for
  `n = 100`, below `9/4` (computed).

### Examples

- Support vector machines: the hinge loss is convex and `1`-Lipschitz, so 4.2 gives uniform
  stability `r²/(nλ)` for the soft-margin SVM, and 1.4 converts its surrogate risk into
  misclassification risk.

### Dependencies

Layers 1–2; Tau Ceti McDiarmid; Nonparametric 5.8; Mathlib `RKHS`.

## Layer 5: distribution-free prediction, local rules and clustering

### 5.1 Split conformal prediction

- `conformalThreshold s k`, for calibration scores `s : Fin n → ℝ`: the `k`-th smallest score
  `S_(k)` (`TauCeti.orderStatistic` at index `k - 1`), `-∞` for `k = 0` and `+∞` for `k > n`.
- **Split conformal prediction** (`splitConformal_coverage`; Vovk, Gammerman and Shafer,
  *Algorithmic learning in a random world*, 2005, and Lei, G'Sell, Rinaldo, Tibshirani and
  Wasserman, *Distribution-free predictive inference for regression*, 2018): for measurable
  scores `S : Fin (n + 1) → Ω → ℝ` forming an `ExchangeableFamily`, `α ∈ (0, 1)` and
  `k = ⌈(n + 1)(1 - α)⌉`, `P(S_(n+1) ≤ S_(k)) ≥ 1 - α`; if the scores are almost surely distinct,
  the probability is at most `1 - α + 1/(n + 1)`. The prediction set `{y : s(x, y) ≤ S_(k)}` of a
  score trained on an independent part covers the test response with these probabilities,
  conditionally on the training part.

*Proof route.* `S_(n+1) ≤ S_(k)` iff fewer than `k` calibration scores are strictly below
`S_(n+1)`. By exchangeability the rank of the last score among all `n + 1` is uniform on the
positions when the scores are distinct, and stochastically no larger otherwise (ties only lower
strict ranks), so the probability is `k/(n + 1)` or at least that. The conditional version
applies the theorem to the conditional laws given the training part, which are exchangeable.

*Needs:* Tau Ceti `ExchangeableFamily`, `TauCeti.orderStatistic`.

**Checks.**

- `conformalThreshold` for `n = 2`, `s = (3, 1)`, `k = 1`: `1`; `k = 2`: `3`; `k = 3`: `⊤`.
- `conformalThreshold s 0 = ⊥`, so the conformal event is empty when `k = 0`; for
  `α ∈ (0, 1)` the rank `k` is at least `1`.
- `conformalThreshold` is not the empirical `(1 - α)`-quantile of the calibration scores alone:
  for `n = 1` and `α = 0.25`, `k = ⌈1.5⌉ = 2 > n` and the threshold is `+∞`.
- Coverage with distinct scores is exactly `k/(n + 1)`: for `n = 9`, `α = 0.1` it is `0.9`; for
  `n = 4`, `α = 0.25`, `0.8 ∈ [0.75, 0.95]`; for `n = 2`, `α = 0.5`, `2/3 ∈ [0.5, 0.833]`
  (computed).
- Negative control: with all scores equal the coverage is `1`, so the upper bound needs distinct
  scores.

### 5.2 Nearest-neighbour classification

- **Cover–Hart inequalities** (`bayesRisk_le_nnRisk_le`; Devroye–Györfi–Lugosi, (3.1), p. 22):
  for a measurable `η` with values in `[0, 1]`, `L* = E min(η, 1 - η)` and
  `L(1) = E 2η(1 - η)`, `L* ≤ L(1) ≤ 2L*(1 - L*) ≤ 2L*`.
- **1-NN limit** (Devroye–Györfi–Lugosi, Thm 5.1, p. 70): for every law of `(X, Y)` on `ℝ^d`, the
  expected error of the 1-nearest-neighbour rule tends to `L(1)`.
- **`k`-NN limits** (Devroye–Györfi–Lugosi, Thm 5.2, p. 70, Thm 5.4, p. 73, and Thm 5.6, p. 75): for
  fixed odd `k`, the limit `L(k)` of the expected error exists for every law, is nonincreasing in
  odd `k`, and `L* ≤ L(k) ≤ L* + 1/√(ke)`; for even `k`, `L(2k) = L(2k-1)` (Thm 5.5, p. 74).
- **Consistency** (Devroye–Györfi–Lugosi, Thm 6.4, p. 101): if `k → ∞` and `k/n → 0`, the
  expected error of the `k`-NN rule tends to `L*` for every law.

Distance ties are broken by index, the convention of Nonparametric 5.6; Devroye–Györfi–Lugosi
break them by independent uniform marks, and the limits are the same by the same argument, since
the nearest neighbours converge to `X` almost surely whichever tie rule is used.

*Proof route.* Cover–Hart: `2η(1 - η) = 2m(1 - m)` with `m = min(η, 1 - η) ≤ 1/2`, so
`m ≤ 2m(1 - m)`, and Jensen gives `E 2m(1 - m) ≤ 2 Em (1 - Em)`. The limits: the nearest neighbours
converge to `X` almost surely (Devroye–Györfi–Lugosi, Lemma 5.1, p. 63), the labels of the
neighbours become conditionally independent with mean `η(X)` by the Lebesgue differentiation
argument, and the error of a majority vote among `k` independent `Bernoulli(η)` labels is a
polynomial in `η`. Consistency: the `k`-NN rule is the plug-in rule of the `k`-NN regression
estimate, so 1.2 bounds its excess risk by `2 E|η_n - η| ≤ 2 √(E(η_n - η)²)`, which tends to `0` by
Nonparametric 5.6.

*Needs:* 1.2; Nonparametric 5.6.

**Checks.**

- `η ≡ 1/2`: `L* = L(1) = 1/2` and `2L*(1 - L*) = 1/2`, so the first two inequalities are
  equalities.
- Deterministic labels (`η ∈ {0, 1}`): `L* = L(1) = 0`.
- `η ≡ 0.2`: `L* = 0.2`, `L(1) = 0.32 = 2L*(1 - L*) < 2L* = 0.4`.
- `η ∈ {0.1, 0.3}` with equal mass: `L* = 0.2`, `L(1) = 0.30 < 2L*(1 - L*) = 0.32` (computed).

### 5.3 Local weight estimates and forests

- **Stone's theorem for local weights** (`tendsto_lintegral_weightEstimate_sub_sq`; Györfi (ed.),
  Thm 2.1, p. 59; Devroye–Györfi–Lugosi, Thm 6.3, p. 98, for classification): let
  `w n x xs θ i ≥ 0`, with `∑_i w = 1` for `n ≥ 1`, be measurable in the test point `x`, the
  sample points `xs` and independent randomness `θ`, but not in the responses. If
  - (domination) for some `C`, every `n ≥ 1` and every bounded measurable `g ≥ 0`,
    `E ∑_i w_i g(X_i) ≤ C E g(X)`;
  - (locality) `E ∑_i w_i 1{‖X_i - X‖ > ε} → 0` for every `ε > 0`;
  - (no dominant weight) `E max_i w_i → 0`;

  then `E (∑_i w_i Y_i - m(X))² → 0` for every law of `(X, Y)` with `E Y² < ∞` and regression
  function `m`.
- **Response-independent forests**: leaf averages of a tree partition built from the sample
  points and independent randomness but not from the responses, and averages of several such
  trees, are local weight estimates when no leaf is free of sample points; the theorem applies
  once the three conditions are verified for the partition scheme (cells shrinking in diameter
  and containing a number of points tending to infinity).

*Proof route.* For bounded `Y` the conditional variance term is at most
`E ∑ w_i² Var(Y_i | X_i) ≤ C' E max_i w_i`; the bias term `E(∑ w_i (m(X_i) - m(X)))²` is handled by
approximating `m` in `L²` by a continuous function of bounded support, with locality for the
continuous part and domination for the remainder. Truncation of `Y` and domination remove the
boundedness. The responses are conditionally independent given `(X, xs, θ)` because the weights
do not use them. Nonparametric 5.6 runs this argument inside its proofs for kernel and
nearest-neighbour weights; here it is stated once, for every weight scheme.

*Needs:* 1.1; Foundations 8.5; Mathlib `condExp`, continuous functions dense in `L²`.

### 5.4 Consistency of `k`-means

- `kMeansRisk μ C = ∫⁻ min_{c ∈ C} ‖x - c‖² dμ` for a finite set of centers, valued in `ℝ≥0∞`
  (`⊤` for `C = ∅`).
- **Consistency of `k`-means** (`tendsto_hausdorffDist_kMeans`; Linder, Thm 4.2, p. 171, in
  Györfi (ed.); Pollard, *Strong consistency of k-means clustering*, 1981): for a law on `ℝ^d` with
  finite second moment whose `k`-means risk has a unique minimizing set `C*` of at most `k`
  centers, and i.i.d. points, every choice of empirical minimizers `Cₘ` (over sets of at most
  `k` centers, against the empirical measure of the first `m + 1` points) converges to `C*` in the
  Hausdorff distance almost surely.

*Proof route.* `kMeansRisk ν C` is the squared `W₂` distance from `ν` to the best law supported
on `C`, so `|kMeansRisk(ν)^(1/2) - kMeansRisk(μ)^(1/2)| ≤ W₂(ν, μ)` uniformly in `C`. Tau Ceti's
`TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae` with `p = 2` makes the empirical risks
converge uniformly almost surely; the empirical minimizers stay in a bounded set (a center far
away serves no mass), so by compactness every limit point of `Cₘ` minimizes the population
risk, and uniqueness identifies it with `C*`. Linder's Thm 4.2 states the convergence of the
risks; the convergence of the centers is the compactness step above.

*Needs:* Tau Ceti Wasserstein convergence and quantization; Mathlib `Metric.hausdorffDist`.

**Checks.**

- `kMeansRisk μ ∅ = ⊤`, so the empty set never minimizes when `k ≥ 1`; with the real-valued
  `⨅` over an empty set the risk would be the junk value `0` and `∅` would be optimal.
- `kMeansRisk (δ_a) {a} = 0` and `kMeansRisk (½ δ₀ + ½ δ₂) {1} = 1` on `ℝ`.
- `kMeansRisk μ C` is antitone in `C`: adding a center never increases it.
- Uniqueness forces the support to have at least `k` points: if it has `j < k` points, both the
  support and the support with one more point minimize with risk `0`.

### Examples

- Conformal regression with the absolute residual score `|y - f̂(x)|`: the prediction set is the
  interval `f̂(x) ± S_(k)`, with coverage at least `1 - α` for every law.

### Dependencies

Layer 1; Nonparametric 5.6; Tau Ceti exchangeability, order statistics and Wasserstein library.

## Layer 6: trees, boosting and ensembles

### 6.1 Cost-complexity pruning

- `CostTree`: a finite binary tree whose every node carries its resubstitution cost `R(t)`;
  `CostTree.cost` is the sum over the leaves, `CostTree.numLeaves` the number of leaves, and
  `CostTree.costComplexity α T = cost T + α numLeaves T`.
- `CostTree.IsPruning S T`: `S` is a pruned subtree of `T`, obtained by turning internal nodes into
  leaves; `CostTree.IsSmallestMinimizer α T S`: `S` minimizes `costComplexity α` among the pruned
  subtrees of `T` and is a pruned subtree of every other minimizer.
- **Minimal cost-complexity pruning** (`CostTree.existsUnique_isSmallestMinimizer`;
  Breiman–Friedman–Olshen–Stone, Thm 10.7, p. 285, and Thm 10.9, p. 286): for every `α ≥ 0` the
  smallest minimizing pruned subtree exists and is unique, and for `α ≤ α'` the one for `α'` is a
  pruned subtree of the one for `α`. Hence `α ↦ T(α)` takes finitely many values, forming a nested
  sequence.

*Proof route.* Recursion on the tree: the minimum of `costComplexity α` over the pruned subtrees of
`node r l m` is `min(r + α, opt(l) + opt(m))`, and the smallest minimizer prunes exactly when
`r + α ≤ opt(l) + opt(m)`. Uniqueness and the "pruned subtree of every minimizer" property follow
by induction. Nesting: `opt_α'(l) + opt_α'(m) ≥ opt_α(l) + opt_α(m) + (α' - α)` since every pruned
subtree of the children has at least one leaf, so a node pruned at `α` is pruned at `α'`. No
assumption on the costs is used; Breiman et al. assume `R(t) ≥ R(t_L) + R(t_R)` (Prop 4.2, p. 95),
which holds for misclassification costs.

*Needs:* nothing beyond Mathlib.

**Checks.**

- `CostTree.cost (node 5 (leaf 2) (leaf 1)) = 3`: the node's own cost `5` does not count.
- `CostTree.numLeaves (node 5 (leaf 2) (leaf 1)) = 2`, and `CostTree.numLeaves (leaf r) = 1`.
- `CostTree.costComplexity 2` of that tree is `7`, of its pruning `leaf 5` it is `7` as well; the
  smallest minimizer at `α = 2` is `leaf 5` (ties prune), at `α = 1` it is the full tree (`5 < 6`).
- `CostTree.IsPruning` is reflexive and transitive, and `IsPruning (leaf r) (node r l m)` holds for
  every `l`, `m`.
- `CostTree.IsPruning (leaf 3) (node 5 l m)` is false: pruning keeps the cost carried by the node.
- `CostTree.costComplexity 0 T = CostTree.cost T`, minimized by `T` itself when the costs satisfy
  Breiman et al.'s `R(t) ≥ R(t_L) + R(t_R)`.
- `CostTree.IsSmallestMinimizer 2 (node 5 (leaf 2) (leaf 1)) (leaf 5)` holds, and the full tree,
  also a minimizer, is not the smallest one: without the "smallest" clause the minimizer is not
  unique.

### 6.2 Impurity decrease

- **Impurity decrease** (`impurityDecrease_nonneg`; Breiman–Friedman–Olshen–Stone, Prop 4.4,
  p. 100, for the class of impurity functions of (4.3) there): for `φ` strictly concave on the
  probability simplex, children class proportions `qL`, `qR` and split proportions `pL, pR > 0`
  with `pL + pR = 1`, the decrease `φ(pL qL + pR qR) - pL φ(qL) - pR φ(qR)` is nonnegative and
  vanishes exactly when `qL = qR`.
- **Categorical splits** (Breiman–Friedman–Olshen–Stone, Thm 4.5, p. 101): for two classes and a
  categorical predictor with `L` categories ordered by their class-one proportion within the
  node, some optimal split for a strictly concave symmetric impurity sends an initial segment of
  the ordering to one child, so `L - 1` splits replace the `2^(L-1) - 1` candidates.

*Proof route.* The first is the definition of strict concavity. For the second, the impurity
decrease of a split is a concave function of the class-one proportion of the left child at fixed
size, and an exchange argument moves categories along the order; Breiman et al. prove it for
impurities of the class `F` (4.3), which contains the Gini index and the entropy.

*Needs:* Mathlib `StrictConcaveOn`.

**Checks.**

- Gini index `1 - ∑ p²` with `qL = (0.9, 0.1)`, `qR = (0.6, 0.4)`, `pL = pR = 1/2`: decrease
  `0.045 > 0`.
- Misclassification rate `1 - max p` with the same split: decrease `0` although the children
  differ, so it is concave but not strictly concave and the equality clause fails for it
  (computed).

### 6.3 Descent of `L²` boosting

- **Boosting descent** (`boosting_descent`): in an inner product space, with residuals `r m` and
  base learners `h m ≠ 0` such that `⟪r m, h m⟫ ≥ γ ‖r m‖ ‖h m‖` for a fixed `γ > 0`, and the
  shrunken least-squares step `r (m + 1) = r m - ν (⟪r m, h m⟫/‖h m‖²) h m` with `0 < ν < 2`,
  `‖r (m + 1)‖² ≤ (1 - ν(2 - ν)γ²) ‖r m‖²`, and hence `‖r m‖² ≤ (1 - ν(2 - ν)γ²)^m ‖r 0‖²`.

*Proof route.* `‖r - ν a h‖² = ‖r‖² - ν(2 - ν) ⟪r, h⟫²/‖h‖²` with `a = ⟪r, h⟫/‖h‖²`, and
`⟪r, h⟫² ≥ γ² ‖r‖² ‖h‖²`. In `L²` of the law of `X` with `r m = f* - f_m`, this is the descent of
gradient boosting for squared loss; the source texts state it in this form without a theorem
number, so the route is the computation just given.

*Needs:* Mathlib inner product spaces.

**Checks.**

- `r = (1, 2)`, `h = (1, 0.3)`, `ν = 1/2`: `γ = 0.6854` is the cosine, and the ratio
  `‖r'‖²/‖r‖² = 0.6477` equals the bound, the equality case (computed).
- `ν = 1`: the factor is `1 - γ²`, the exact least-squares step.

### 6.4 Variance of an ensemble average

- **Ensemble variance** (`variance_ensembleAverage`): for `B ≥ 1` square-integrable predictions
  with common variance `σ²` and pairwise covariances `ρσ²`, the average has variance
  `σ²(ρ + (1 - ρ)/B)`.

*Proof route.* Expand the variance of the sum into `B` variances and `B(B - 1)` covariances.

*Needs:* Mathlib `variance`, `covariance`.

**Checks.**

- `B = 2`, `σ² = 2`, `ρ = 0.3`: `1.3`; `B = 5`: `0.88` (computed from the covariance matrix).
- `ρ = 1`: the variance stays `σ²`, so averaging perfectly correlated predictions does not help.

### 6.5 AdaBoost

- `adaDist y F i = exp(-y_i F_i)/∑_j exp(-y_j F_j)`; `adaScore y H t` the score after `t` rounds
  (`F 0 = 0`, `F (t + 1) = F t + α_t H t`); `adaError y H t` the weighted error
  `ε_t = ∑ adaDist y (F t) i 1{H t i ≠ y i}`; `adaAlpha y H t = (1/2) log((1 - ε_t)/ε_t)`. Labels
  and base predictions on the sample take values `±1`.
- **AdaBoost** (`adaBoost_bounds`; Mohri–Rostamizadeh–Talwalkar, Thm 7.2, p. 149, and Thm 7.7,
  p. 159): if `0 < ε_t < 1/2` for every round `t < T`, then
  - the training error of the sign of `F T` is at most `∏_{t<T} 2√(ε_t(1 - ε_t))`;
  - this product is at most `exp(-2 ∑_{t<T} (1/2 - ε_t)²)`, hence at most `exp(-2γ²T)` when
    every `ε_t ≤ 1/2 - γ`;
  - for every `ρ ≥ 0`, the fraction of sample points with `y_i F_T(x_i) ≤ ρ ∑ α_t` is at most
    `2^T ∏_t √(ε_t^(1-ρ) (1 - ε_t)^(1+ρ))`;
  - each `α_t` minimizes `a ↦ ∑_i exp(-y_i(F_t(x_i) + a H_t(x_i)))`.
- **Margins without dependence on `T`**: if `0 < ρ < γ < 1/2` and every `ε_t ≤ 1/2 - γ`, the margin
  fraction is at most `u^T` with `u = (1 - 2γ)^((1-ρ)/2)(1 + 2γ)^((1+ρ)/2) < 1`; since the convex
  hull of a class has the Rademacher complexity of the class (2.1), the margin bound of 4.1
  applies to `F_T/∑ α_t` with the complexity of the base class (Mohri–Rostamizadeh–Talwalkar,
  Cor 7.5, p. 158; Hardt–Recht, Thm 5, p. 120).

*Proof route.* `1{u ≤ 0} ≤ exp(-u)`, and the normalizers satisfy `Z_t = 2√(ε_t(1 - ε_t))` at the
chosen `α_t`, so the exponential loss telescopes into `∏ Z_t`;
`2√(ε(1 - ε)) = √(1 - 4(1/2 - ε)²) ≤ exp(-2(1/2 - ε)²)`. Margins: `1{u ≤ ρ∑α} ≤ exp(ρ∑α - u)` and
the same telescoping. The line search: the derivative of the exponential loss in `a` vanishes
exactly at `α_t`. The bound `u < 1` follows from the monotonicity of `ε^(1-ρ)(1 - ε)^(1+ρ)` on
`[0, (1 - ρ)/2]` and a one-variable inequality in `γ` for `ρ < γ`.

*Needs:* 2.1, 4.1.

**Checks.**

- `adaDist y 0 = 1/m`, the uniform start.
- `adaDist` sums to `1`, and on the empty sample it is the junk value `0` of a division by `0`;
  the theorem assumes `m ≥ 1`.
- `adaError` of a base learner equal to the labels is `0`, where `adaAlpha` is the junk value
  `log(1/0)/2 = 0`; the hypothesis `0 < ε_t` excludes it.
- `adaAlpha` at `ε = 1/4` is `log 3/2 = 0.549`.
- `adaAlpha` at `ε = 1/2` is `0`: a learner no better than the coin gets no weight.
- `adaAlpha` is not `log((1 - ε)/ε)`: the factor `1/2` is what makes `Z_t = 2√(ε_t(1 - ε_t))`.
- `adaError` of a base learner equal to the negated labels is `1`.
- `adaError` at round `0` is the unweighted training error of the first learner.
- `adaScore y H 0 = 0`.
- `adaScore y H 1 = adaAlpha y H 0 • H 0`, so its sign is the first learner when
  `adaError y H 0 < 1/2`.
- `adaScore` on four points with `y = (1, 1, -1, -1)` and three base learners: weighted errors
  `0.25`, `0.1667`, `0.1`, each `α_t` agrees with a grid line search, the training error is `0`
  and the product bound is `0.387 ≤ 0.513` (computed).
- `u` for `γ = 0.25`, `ρ = 0`: `√(1 - 4γ²) = 0.866 < exp(-2γ²) = 0.882`; for `γ = 0.3`, `ρ = 0.29`:
  `u = 0.978 < 1` (computed).

### Examples

- Random forests: bootstrap aggregation of response-independent trees is covered by 5.3 for
  consistency and by 6.4 for the variance reduction, `σ²ρ` being the floor as `B → ∞`.

### Dependencies

Layers 2 and 4 for the AdaBoost margins; Layer 5 for forests; otherwise Mathlib only.

## Layer 7: differential privacy

### 7.1 Definitions, post-processing and groups

- `IsDifferentiallyPrivate M ε δ`: for `D, D'` with `hammingDist D D' ≤ 1` and measurable `A`,
  `(M D).real A ≤ e^ε (M D').real A + δ` (Dwork–Roth, Def 2.4, p. 17, with the substitution
  convention of the Conventions).
- `IsLocallyPrivate Q ε`: `(Q x).real B ≤ e^ε (Q x').real B` for all inputs and measurable `B`.
- **Post-processing and groups** (`isDifferentiallyPrivate_postProcess`; Dwork–Roth, Prop 2.1,
  p. 19, and Thm 2.2, p. 20): if `M` is `(ε, δ)`-private with probability measures as values,
  `fun D ↦ K ∘ₘ M D` is `(ε, δ)`-private for every Markov kernel `K`; and if `δ = 0`, data sets
  at Hamming distance at most `k` satisfy `(M D).real A ≤ e^(kε) (M D').real A`.

*Proof route.* Post-processing: `(K ∘ₘ M D)(A) = ∫ K(·)(A) d(M D)`, and the privacy inequality
extends from indicators to measurable functions with values in `[0, 1]` by the layer-cake
formula (the `δ` term is paid once since `∫₀¹ δ dt = δ`). Groups: a path of `k` substitutions.

*Needs:* Mathlib `hammingDist`, `Kernel`.

**Checks.**

- `IsDifferentiallyPrivate` of a constant mechanism `M D = ν` holds with `ε = δ = 0`.
- `IsDifferentiallyPrivate` of the identity release `M D = δ_D` with `n ≥ 1` and two distinct
  records fails for every `ε` when `δ < 1`: the event `{D}` has probability `1` and `0`.
- `IsDifferentiallyPrivate M ε δ` holds trivially for `δ ≥ 1` and probability measures.
- A query of substitution sensitivity `0` released without noise (`M D = δ_(f D)`) is
  `IsDifferentiallyPrivate M 0 0`.
- `IsLocallyPrivate` of randomized response with `e^ε = 3` (truth `±1` kept with probability
  `3/4`) is Dwork–Roth's Claim 3.5, p. 30: the ratio is `3`.
- `IsLocallyPrivate Q ε` implies `IsDifferentiallyPrivate` of the product release
  `D ↦ Measure.pi (fun i ↦ Q (D i))` with the same `ε`; the converse fails (the Laplace mechanism
  on the mean is centrally but not locally private with the same `ε` for `n ≥ 2`).
- Negative control for group privacy: with `δ > 0` the factor `e^(kε)` alone is false; Dwork–Roth's
  Thm 2.2 is stated for `δ = 0`, and the `(ε, δ)` version carries `k e^((k-1)ε) δ`.

### 7.2 Mechanisms

- `laplaceMechanism f b D = ⊗_j Lap(f D j, b)`, `gaussianMechanism f s D = ⊗_j N(f D j, s²)`, and
  `exponentialMechanism u ε Δu D`, the law on a finite `R` with weights
  `∝ exp(ε u(D, r)/(2Δu))`.
- **Laplace mechanism** (`isDifferentiallyPrivate_laplaceMechanism`; Dwork–Roth, Thm 3.6, p. 32):
  for `ε > 0` and a query of `ℓ¹` sensitivity at most `Δ > 0`, `laplaceMechanism f (Δ/ε)` is
  `ε`-differentially private.
- **Gaussian mechanism** (`isDifferentiallyPrivate_gaussianMechanism`; Dwork–Roth, Thm 3.22,
  p. 53): for `ε, δ ∈ (0, 1)`, `c > 0` with `c² > 2 log(1.25/δ)`, a query of Euclidean
  sensitivity at most `Δ₂ > 0` and `s ≥ c Δ₂/ε`, `gaussianMechanism f s` is
  `(ε, δ)`-differentially private.
- **Exponential mechanism** (`exponentialMechanism_spec`; Dwork–Roth, Thm 3.10, p. 38, and
  Thm 3.11, p. 39): for `ε, Δu > 0` and a utility of sensitivity at most `Δu` in each output, the
  mechanism is `ε`-differentially private, and for every `r₀` and `η ∈ (0, 1]` the event
  `u(D, r) ≤ u(D, r₀) - (2Δu/ε)(log|R| + log(1/η))` has probability at most `η`.

*Proof route.* Laplace: the density ratio at a point is `exp((|y - f D'| - |y - f D|)₁/b) ≤ e^ε`
coordinatewise, multiplied over coordinates. Gaussian: the privacy loss `log(p_D/p_D')` is a
Gaussian variable with mean `Δ²/(2s²)` and variance `Δ²/s²` along the direction of `f D - f D'`;
its exceedance of `ε` has probability at most `δ` under the hypothesis on `c`, Dwork–Roth's
computation; on the complement the density ratio is at most `e^ε`. Exponential: numerator and
normalizer each change by a factor at most `e^(ε/2)`. Accuracy: the outputs with low utility have
total weight at most `|R| exp(ε(u(r₀) - t)/(2Δu))` relative to the weight of `r₀`.

*Needs:* 7.1; Tau Ceti `laplaceMeasure`; Mathlib `gaussianReal`.

**Checks.**

- `laplaceMechanism` with `k = 1`, `Δ = 1`, `ε = 1/2`: the maximal density ratio between the laws
  centred at `0` and `1` is `e^(1/2) = 1.6487` (computed).
- `laplaceMechanism f b` with `b ≤ 0` is the zero measure (Tau Ceti's convention), so the theorem
  assumes `Δ, ε > 0`.
- `laplaceMechanism` adds noise to every coordinate; the scale is `Δ/ε` with the `ℓ¹` sensitivity,
  not the Euclidean one.
- `gaussianMechanism` for `ε = 0.5`, `δ = 10⁻³`: `c = 3.776`, `s = 7.553`, and the exact `δ(ε)` of
  the pair `N(0, s²)`, `N(1, s²)` is `3.2 · 10⁻⁶ ≤ 10⁻³`; for `ε = 0.9`, `δ = 10⁻⁵` it is
  `3.5 · 10⁻⁸` (computed).
- Negative control: the hypothesis `ε < 1` is needed. At `ε = 10`, `δ = 0.1`, with `c = 2.248`
  just above `√(2 log 12.5)` and `s = c/ε = 0.225`, the exact `δ(ε)` is `0.41 > 0.1` (computed).
- `gaussianMechanism` with `s = 0` is the Dirac release, which is not private.
- `gaussianMechanism` takes the standard deviation `s`, and Mathlib's `gaussianReal` the
  variance `s²`.
- `exponentialMechanism` with `R = {0, 1, 2}`, utilities `(0, 1, 2)` against the neighbour
  `(1, 1, 1)`, `ε = Δu = 1`: the probability ratios are at most `1.79 ≤ e` (computed).
- `exponentialMechanism` with a constant utility is uniform on `R`.
- `exponentialMechanism` uses `2Δu` in the exponent; with `Δu` alone the privacy level is `2ε`.
- Accuracy with `|R| = 1`: the event is empty for `η < 1` and everything for `η = 1`.

### 7.3 Composition

- **Basic composition** (`isDifferentiallyPrivate_compProd`; Dwork–Roth, Thm 3.16, p. 43): if
  `M₁` is `(ε₁, δ₁)`-private and, for every first release `y`, `D ↦ M₂ D y` is `(ε₂, δ₂)`-private,
  with nonnegative parameters, the joint release `D ↦ M₁ D ⊗ₘ M₂ D` is
  `(ε₁ + ε₂, δ₁ + δ₂)`-private. By induction, the adaptive composition of `k` mechanisms is
  `(∑ εᵢ, ∑ δᵢ)`-private.
- **Advanced composition** (Dwork–Roth, Thm 3.20, p. 49): the adaptive composition of `k`
  mechanisms, each `(ε, δ)`-private, is `(ε', kδ + δ')`-private for every `δ' ∈ (0, 1)`, with
  `ε' = √(2k log(1/δ')) ε + k ε (e^ε - 1)`. The `k`-fold adaptive composition is the iterated
  `Measure.compProd`, each mechanism a kernel from the earlier releases.

*Proof route.* Basic: for a set `A` of pairs, bound the inner probability by
`min(1, e^(ε₂) g(y) + δ₂)` with `g(y) = (M₂ D' y)(A_y)`, and apply the function form of 7.1 to
`M₁`. Advanced: the privacy loss of each step has conditional mean at most `ε(e^ε - 1)` and range
`[-ε, ε]` off events of probability `δ`, so Azuma's inequality for the sum of the losses gives the
tail `δ'` (Dwork–Roth, proof of Thm 3.20, with Lemma 3.17–3.18 there for the reduction from
`(ε, δ)` to `(ε, 0)` off a bad event).

*Needs:* 7.1; Mathlib `Measure.compProd`; Azuma's inequality from Tau Ceti's bounded-differences
file, in its martingale form.

### 7.4 Local privacy: randomized response and contraction

- `rrRate ε = (e^ε - 1)/(e^ε + 1)`; `randomizedResponse ε x` releases `1` with probability
  `(1 + rrRate ε · x)/2` and `-1` otherwise; `clipUnit t = max(-1, min(1, t))`.
- **Randomized response** (`randomizedResponse_spec`; Dwork–Roth, Claim 3.5, p. 30, for
  `e^ε = 3` on bits): for `ε > 0`, the kernel is `ε`-locally private on `[-1, 1]` with mean
  `rrRate ε · x`; for a law `P` on `[-1, 1]` and `n ≥ 1` independent releases, the estimate
  `∑ Z_i/(n rrRate ε)` is unbiased for the mean of `P` with mean squared error at most
  `1/(n rrRate ε²)`, and its clipping has mean squared error at most `min(4, 1/(n rrRate ε²))`.
  Since `rrRate ε = tanh(ε/2) ≥ tanh(1/2) ε` for `ε ≤ 1`, this is at most
  `4.69 min(1, 1/(nε²))`.
- **Contraction under local privacy** (`klDiv_add_klDiv_le_of_isLocallyPrivate`; Duchi, Jordan and
  Wainwright, *Local privacy and statistical minimax rates*, 2013): for an `ε`-locally private
  Markov kernel `Q` and probability measures `P₁`, `P₂`,
  `klDiv (Q ∘ₘ P₁) (Q ∘ₘ P₂) + klDiv (Q ∘ₘ P₂) (Q ∘ₘ P₁) ≤ 4(e^ε - 1)² (tvDist P₁ P₂/2)²`.
- **Sequential releases**: for `n` individuals with independent inputs of law `P₁`, respectively
  `P₂`, each released through an `ε`-locally private kernel that may depend on the earlier
  releases, the symmetrized relative entropy of the laws of all releases is at most
  `4n(e^ε - 1)² (tvDist P₁ P₂/2)²`.

*Proof route.* Randomized response: the two release probabilities have ratio at most
`(1 + rrRate ε)/(1 - rrRate ε) = e^ε`; unbiasedness and the variance bound `Var Z_i ≤ 1` are direct;
clipping to `[-1, 1]`, which contains the mean, does not increase the error, and the error is at
most `2²`. Contraction: local privacy makes all `Q x` mutually absolutely continuous; take densities
`q(z|x)` with respect to one of them and `m_j(z) = ∫ q(z|x) dP_j(x)`. The symmetrized divergence is
`∫ (m₁ - m₂) log(m₁/m₂)`. Since `P₁ - P₂` has positive and negative parts of mass
`TV = tvDist P₁ P₂/2`,
`|m₁(z) - m₂(z)| ≤ (sup_x q(z|x) - inf_x q(z|x)) TV ≤ (e^ε - 1) inf_x q(z|x) TV`, and
`|log(m₁/m₂)| ≤ |m₁ - m₂|/min(m₁, m₂)` with `min(m₁, m₂) ≥ inf_x q(z|x)`. Multiplying and
integrating gives at most `(e^ε - 1)² TV² ∫ inf_x q(z|x)`, and the last integral is at most `1`.
This is Duchi–Jordan–Wainwright's argument, with their constant `4` to spare. Sequential releases:
Tau Ceti's chain rule `TauCeti.klDiv_compProd_eq_add_lintegral` adds the per-individual bounds; for
non-interactive releases the tensorization `TauCeti.klDiv_prod_prod_eq_add` suffices.

*Needs:* 7.1; Mathlib `klDiv`, `tvDist`; Tau Ceti relative-entropy chain rule.

**Checks.**

- `rrRate 1 = tanh(1/2) = 0.4621`.
- `(1 + rrRate ε)/(1 - rrRate ε) = e^ε` for `ε ∈ {0.1, 0.5, 1, 2}` (computed).
- `rrRate 0 = 0`: at `ε = 0` the release is a fair coin and carries no information.
- `rrRate` is not `ε/2`: `rrRate 2 = 0.762 ≠ 1`.
- `randomizedResponse ε x` is a probability measure for `x ∈ [-1, 1]`; for `|x| > 1` one weight is
  negative and `ENNReal.ofReal` truncates it to `0`, which is why the privacy and mean statements
  are restricted to `[-1, 1]`.
- `randomizedResponse ε 0` is the fair coin on `{-1, 1}`.
- `randomizedResponse ε 1` releases `1` with probability `e^ε/(e^ε + 1)`.
- `clipUnit 3 = 1` and `clipUnit (-0.2) = -0.2`.
- `clipUnit` is `1`-Lipschitz, so clipping an estimate of a mean in `[-1, 1]` never increases its
  error.
- `clipUnit` is not the sign: `clipUnit 0.5 = 0.5`, while a sign-based clipping would give `1`.
- The worst ratio of `min(4, 1/(nρ²))` to `min(1, 1/(nε²))` over `ε ∈ (0, 1]` and `n` is `4.68`, so
  the constant `4` of a naive estimate is not enough (computed).
- Contraction for randomized response between `δ₁` and `δ₋₁` (`TV = 1`): symmetrized relative
  entropy `0.245` at `ε = 0.5` and `0.924` at `ε = 1`, below `4(e^ε - 1)² = 1.68` and `11.8`
  (computed).

### 7.5 Private mean estimation

- `localMinimaxMeanRisk n ε`: the infimum over `n` noninteractive `ε`-locally private kernels
  `ℝ → ℝ` (private on inputs in `[-1, 1]`) and measurable estimators of the supremum over laws on
  `[-1, 1]` of the mean squared error; `centralMinimaxMeanRisk n ε`: the same over
  `ε`-differentially private Markov kernels from `Fin n → ℝ` to `ℝ`. Both are `ℝ≥0∞`-valued.
- **Minimax rates** (`privateMean_minimax`; Duchi, Jordan and Wainwright, 2013, for the local
  rate): there are `0 < c ≤ C` such that for `n ≥ 1` and `0 < ε ≤ 1`, the local minimax risk lies
  between `c min(1, 1/(nε²))` and `C min(1, 1/(nε²))`, and the central one between
  `c min(1, 1/n + 1/(nε)²)` and `C min(1, 1/n + 1/(nε)²)`.

*Proof route.* Local upper bound: 7.4. Local lower bound: Le Cam's two-point method
(Nonparametric 2.2, Kullback–Leibler form) with two laws on `{-1, 1}` whose means differ by
`2t`, the sequential contraction bound of 7.4 with `tvDist/2 = t`, and Pinsker (Nonparametric
1.4); choose `t² ≍ min(1, 1/(nε²))`. Central upper bound: the Laplace mechanism with scale
`2/(nε)` on the mean of the clipped data (sensitivity `2/n`, 7.2), clipped to `[-1, 1]` by
post-processing (7.1): error at most `1/n + 8/(nε)²`. Central lower bound: the non-private rate
`1/n` by Le Cam, and `1/(nε)²` by group privacy (7.1) between two data-generating laws whose
samples differ in about `1/ε` records, coupled so that the mechanism cannot separate them.

*Needs:* 7.1, 7.2, 7.4; Nonparametric 1.4 and 2.2.

**Checks.**

- `localMinimaxMeanRisk n ε ≤ 1`: the estimator `0` has squared error at most `1` for every law on
  `[-1, 1]`, so the minimax risk is never the junk value of an unbounded supremum.
- The central risk is at most the local one: clipping each record with `clipUnit`, releasing it
  through the local kernels and applying the estimator is a central `ε`-private mechanism (one
  substituted record changes one factor of the product law), and it has the same risk on laws on
  `[-1, 1]`.
- `centralMinimaxMeanRisk` at `n = 10`, `ε = 1`: the Laplace upper bound `1/n + 8/(nε)² = 0.18`;
  at `n = 100`, `ε = 0.1`: `0.09` (computed).
- `centralMinimaxMeanRisk n ε ≤ 1`, by the estimator `0`, as for the local risk.
- `localMinimaxMeanRisk n ε` at `n = 100`, `ε = 0.1` is at least `c` times `min(1, 1/(nε²)) = 1`:
  local privacy at this level leaves the mean essentially unidentified, while the central risk
  is `O(0.09)`.
- Negative control: without the restriction to laws on `[-1, 1]` both risks are `⊤` (the mean is
  unbounded), which is why the supremum carries it.

### 7.6 The sparse vector technique

- `aboveThresholdIndex q ν t`: the first `i < k` with `q i + ν i ≥ t`, and `k` if there is none;
  `aboveThreshold f T ε k D` is the law of that index for `t = T + Lap(2/ε)` and independent
  `ν i ~ Lap(4/ε)` (Dwork–Roth, Algorithm 1, p. 57).
- **Sparse vector technique** (`aboveThreshold_spec`; Dwork–Roth, Thm 3.23, p. 57, and Thm 3.24,
  p. 59): for sensitivity-one queries, `aboveThreshold f T ε k` is `ε`-differentially private for
  every `k`; and if among the first `k ≥ 1` queries only the last can satisfy `f_i(D) ≥ T - α`, with
  `α = 8(log k + log(2/β))/ε` and `β ∈ (0, 1)`, then with probability at least `1 - β` the index is
  at least `k - 1`, a halt at `j < k` has `f_j(D) ≥ T - α`, and every earlier query has
  `f_i(D) ≤ T + α`.
- **Several thresholds**: running AboveThreshold `c` times in succession, each with `ε/c` and
  started after the previous run halts, is `ε`-differentially private by 7.3.

Adaptively chosen queries reduce to a fixed sequence: until the halt every answer is "below", so
the analyst's queries are determined by the all-"below" history.

*Proof route.* Privacy: condition on the query noises of the queries before the halt; shifting the
threshold noise by at most `1` and the halting query's noise by at most `2` maps the halting event
for `D` into that for `D'`, with density ratios `e^(ε/2)` each, as in Dwork–Roth. Accuracy: the
threshold noise exceeds `α/2` with probability `exp(-αε/4)`, and some of the `k` query noises
exceeds `α/2` with probability at most `k exp(-αε/8)`; the choice of `α` makes the sum at most `β`.

*Needs:* 7.1, 7.3; Tau Ceti `laplaceMeasure`.

**Checks.**

- `aboveThresholdIndex` with `k = 3`, `q = (0, 5, 9)`, `ν = 0`, `t = 4`: `1`; with `t = 10`: `3`.
- `aboveThresholdIndex` with `k = 0` is `0`, the "never halts" value.
- `aboveThresholdIndex` compares `q i + ν i ≥ t`, not `>`: at equality it halts.
- `aboveThreshold` with `k = 5`, `β = 0.1`, `ε = 1`: `α = 8 log 100 = 36.8`, and a simulation
  with the first four queries at `T - α - 1` and the last at `T + α + 1` halts too early with
  frequency `2.1 · 10⁻⁴ ≤ 0.1` (computed).
- `aboveThreshold` uses scale `2/ε` for the threshold and `4/ε` for the queries; with `2/ε` for
  both the privacy proof loses a factor `2`.
- `α` for `k = 1`, `β = 0.1`, `ε = 1`: `8 log 20 = 23.97`.

### Examples

- Private ERM by the exponential mechanism over a finite class with utility `-n · empiricalError`
  (sensitivity `1`): with probability `1 - η` the released classifier has empirical error within
  `(2/(nε))(log|H| + log(1/η))` of the best, and 2.4 converts this into excess risk.

### Dependencies

Layer 1 (for the examples); Tau Ceti Laplace laws and relative entropy; Nonparametric 1.4 and
2.2; Mathlib Gaussian laws and kernels.

## Layer 8: fairness and distribution shift

### 8.1 Fairness criteria

Let `S` be a real score, `A` a binary group attribute and `Y` a binary outcome on a standard Borel
probability space. **Independence** is `IndepFun S A`, **separation** (equalized odds) is
`S ⟂ᵢ[Y, hY; μ] A`, and **sufficiency** is `Y ⟂ᵢ[S, hS; μ] A` (Barocas–Hardt–Narayanan, Def 1,
p. 55, Def 2, p. 57, and Def 3, p. 60).

- **Separation and sufficiency** (`exists_ae_eq_comp_of_separation_of_sufficiency`;
  Barocas–Hardt–Narayanan, Prop 4, p. 66, under positivity of all events): if all four cells
  `(A, Y)` have positive probability and the group base rates `P(Y = true | A = a)` differ, a score
  with separation and sufficiency determines the outcome: `Y = g(S)` almost surely for a measurable
  `g`. In particular a score calibrated within groups (`P(Y = true | S, A) = S` almost surely) with
  separation determines `Y`, since calibration within groups implies sufficiency.
- **Independence against the conditional criteria** (`fairness_criteria`;
  Barocas–Hardt–Narayanan, Prop 2 and Prop 3, p. 65, and Prop 1, p. 61): if `A` and `Y` are
  dependent, independence and sufficiency cannot both hold; if moreover `S` and `Y` are dependent,
  independence and separation cannot both hold; and if `S` is sufficient and `ℓ(S)` is a version of
  `P(Y = true | S)`, then `P(Y = true | ℓ(S), A) = ℓ(S)` almost surely: the recalibrated score is
  calibrated within groups.

*Proof route.* Separation and sufficiency: with `ν_y` the law of `S` given `Y = y` (the same for
both groups by separation) and `π_a = P(Y = true | A = a)`, the conditional probability
`P(Y = true | S = s, A = a)` is `π_a r(s)/(π_a r(s) + 1 - π_a)` with `r = dν_true/dν_false` in
`[0, ∞]`; sufficiency makes it independent of `a`, and since `π ↦ πr/(πr + 1 - π)` is strictly
increasing for `r ∈ (0, ∞)` and `π₀ ≠ π₁`, `r ∈ {0, ∞}` almost surely: `ν_true` and `ν_false` are
mutually singular, and `g` is the indicator of a set carrying `ν_true`. Barocas et al.'s
positivity of all events excludes exactly this degenerate case, which is why their Prop 4 says
"cannot both hold". The other statements: Barocas et al.'s proofs, written with Mathlib's
`ProbabilityTheory.condIndepFun_iff` and conditional expectations.

*Needs:* Mathlib `CondIndepFun`, `condExp`.

**Checks.**

- `S = Y` (the outcome itself as score): separation and sufficiency both hold, and `Y = g(S)` with
  `g = id`, so the conclusion cannot be strengthened to "cannot both hold".
- A score independent of `(A, Y)`: independence and separation hold, and sufficiency reduces to
  the independence of `A` and `Y`, so it fails once they are dependent, as the second bullet
  requires.
- Base rates `0.8` and `0.4` with `S = A`: independence fails; sufficiency holds, since `A` is a
  function of `S`; separation fails, since `S = A` is not independent of `A` given `Y`. The first
  bullet does not apply, and indeed `Y` is not a function of `S`.

### 8.2 Covariate shift and domain adaptation

- **Covariate shift** (`integral_compProd_eq_integral_rnDeriv_mul`; Quiñonero-Candela et al.,
  §1.4, p. 8, and §6.2, pp. 88–89): if source and target laws are `μS ⊗ₘ κ` and `μT ⊗ₘ κ` with a
  common Markov kernel `κ` and `μT ≪ μS`, then for every loss integrable under the target,
  `∫ L d(μT ⊗ₘ κ) = ∫ (dμT/dμS)(x) L(x, y) d(μS ⊗ₘ κ)`.
- `hDeltaHDivergence H PS PT = 2 sup_{h, h' ∈ H} |PS(h ≠ h') - PT(h ≠ h')|`, on the feature
  marginals.
- **Domain adaptation** (`classificationError_target_le`; Ben-David, Blitzer, Crammer, Kulesza,
  Pereira and Vaughan, *A theory of learning from different domains*, 2010): for every `h ∈ H`,
  `R_T(h) ≤ R_S(h) + hDeltaHDivergence H PS PT/2 + inf_{g ∈ H} (R_S(g) + R_T(g))`.
- **Importance-weighted validation** (`importanceWeighted_risk_spec`): for a measurable density
  ratio `w` with `0 ≤ w ≤ B` and `E_S w = 1`, a measurable loss with values in `[0, 1]`, and
  `n ≥ 1` independent source pairs, the weighted mean `n⁻¹ ∑ w(X_i) L(X_i, Y_i)` is unbiased for
  `R_T = E_S[w L]`, has mean squared error at most `B/n`, and for `δ ∈ (0, 1)` deviates from `R_T`
  by more than `√(2B log(2/δ)/n) + 2B log(2/δ)/(3n)` with probability at most `δ`. For a predictor
  trained on independent data the statements hold conditionally on it.

*Proof route.* Covariate shift: `Measure.compProd` with `μT = (dμT/dμS) · μS`. Domain adaptation:
for `g ∈ H`, `R_T(h) ≤ R_T(g) + PT(h ≠ g) ≤ R_T(g) + PS(h ≠ g) + d/2`, and
`PS(h ≠ g) ≤ R_S(g) + R_S(h)`, by the triangle inequality for disagreement (subadditivity of outer
measure, so no measurability is needed), then take the infimum over `g`. Weighted validation:
`E[w² L²] ≤ B E[w] = B`; `E w = 1` forces `B ≥ 1 ≥ R_T`, so the centred terms satisfy
`|w L - R_T| ≤ B`; Tau Ceti's `ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le` with
`v = B/n` and `b = B/n` and the threshold `t = √(2vℓ) + 2bℓ/3`, `ℓ = log(2/δ)`, gives
`t²/(2(v + bt/3)) ≥ ℓ`.

*Needs:* 1.1; Mathlib `Measure.compProd`, `Measure.rnDeriv`; Tau Ceti Bernstein.

**Checks.**

- `hDeltaHDivergence H P P = 0`.
- `hDeltaHDivergence` of a one-member class is `0` for every pair of laws: `h ≠ h` never happens,
  so the bound reduces to `R_T(h) ≤ R_S(h) + R_S(h) + R_T(h)`.
- `hDeltaHDivergence` is at most `2`, and equals `2` for the classifiers `x ↦ decide (x ≤ t)` on
  `ℝ` between `δ₀` and `δ₁`: the thresholds `1/2` and `-1` disagree at `0` and agree at `1`.
- `hDeltaHDivergence` is not `tvDist`: for a one-member class it is `0` while `tvDist` can be `2`.
- Bernstein inversion with `B = 1`, `n = 100`, `δ = 0.05`: `t = 0.296` and the exponent
  `t²/(2(v + bt/3)) = 3.99 ≥ log 40 = 3.69` (computed).
- Negative control for the weighted bound: dropping `E_S w = 1` breaks the variance bound. With
  `w ≡ 8`, `B = 8` and `L` a fair coin, `wL` has variance `16 > B = 8`.

### 8.3 Label shift

- **Label shift** (`labelShift_spec`; Quiñonero-Candela et al., §1.5, (1.9), pp. 12–13, for the
  posterior correction; Lipton, Wang and Smola, *Detecting and correcting for label shift with
  black box predictors*, 2018, for the identification): with source and target laws
  `pS ⊗ₘ κ` and `pT ⊗ₘ κ` on `Fin K × X`, a common class-conditional kernel `κ`, `pS{j} > 0` for
  all `j`, `w_j = pT{j}/pS{j}`, and a source posterior `q x j`,
  - the target posterior is `w_j q x j/∑_l w_l q x l`;
  - `R_T(L) = E_S[w_Y L]` for every target-integrable loss;
  - for a measurable classifier `h : X → Fin K`, the target law of its predictions is `C w` with
    the source confusion matrix `C i j = PS(Y = j, h(X) = i)`, and `w = C⁻¹ (PT(h(X) = i))_i` when
    `C` is invertible.

*Proof route.* All three are Bayes' rule with `pT = w · pS`: the target joint law is the source
joint law reweighted by `w_Y`, which gives the risk identity and, on rectangles, the posterior;
the prediction law is `∑_j PT(Y = j) κ_j(h = i) = ∑_j C i j w_j`. The denominator
`∑_l w_l q x l` is the density of the target feature law with respect to the source one, so it
vanishes only on a target-null set, and the division by zero there is harmless.

*Needs:* Mathlib `Measure.compProd`, `Matrix`.

**Checks.**

- `K = 2`, `pS = (0.5, 0.5)`, `pT = (0.8, 0.2)`, `P(h = i | Y = j) = [[0.9, 0.2], [0.1, 0.8]]`:
  `q = (0.76, 0.24) = C w` and `C⁻¹ q = (1.6, 0.4) = w` (computed).
- `pT = pS`: `w ≡ 1` and nothing changes.
- A constant classifier gives a singular `C` for `K ≥ 2`, and `w` is not identified from it.

### Examples

- Reweighting a classifier trained on a balanced source to a target with base rate `0.8`: the
  posterior odds are multiplied by `w_1/w_0 = 0.8/0.2 · 0.5/0.5 = 4`.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib conditional independence and kernels; Tau Ceti Bernstein.

## Downstream consumers

No other roadmap consumes the results of this one.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Online learning.** Online gradient descent (owned by a roadmap on first-order methods in an
  open pull request), online-to-batch conversion, mirror descent and the Littlestone dimension of
  online learnability.
- **Bandits and reinforcement learning.** Bandit algorithms and lower bounds (a roadmap on bandits
  in an open pull request); policy gradient, sample complexity with a generative model and natural
  policy gradient, which go beyond the tabular theory of MarkovDecisionProcesses; temporal
  differences with linear features.
- **Graphical models and variational inference.** Belief propagation and the Bethe free energy,
  exact inference on trees and junction trees, and the variational representation of the cumulant
  function: a roadmap on graphical models.
- **Deep learning theory.** Approximation rates (Barron, deep ReLU networks), compositional
  classes, depth separation, the neural tangent kernel, Gaussian-process limits, ridgeless least
  squares, implicit bias, network capacity, softmax and cross-entropy layers, generative
  adversaries and equivariant layers. The realisation maps of networks are owned by
  Neuromanifolds; the rest needs a roadmap of its own.
- **Network models.** Exact and weak recovery in the stochastic block model, the Kesten–Stigum
  threshold, the Aldous–Hoover theorem for graphs, Weisfeiler–Leman bounds, spectral clustering of
  block models and the phase transitions of the Erdős–Rényi graph.
- **Refinements of generalization theory.** Local Rademacher complexities and fast rates under
  the margin condition, PAC-Bayes bounds, sample compression, multiclass learnability (Natarajan
  and DS dimensions), and the optimal realizable sample complexity without the `log(1/ε)` factor.
- **Refinements of privacy.** Rényi and concentrated differential privacy, privacy amplification
  by subsampling, private empirical risk minimization and private PAC learning.
- **Refinements of conformal prediction.** Full conformal prediction, conformalized quantile
  regression and conditional coverage.
- **Fairness.** Multicalibration, fairness under causal models, and the impossibility results
  for scores without binary outcomes.

## Prior formalization

This section is secondary and non-prescriptive.

**lean-CKSD** (Core Knowledge of Statistics and Data Science; files `CKSD/Learning/`, status in
`formalization.json`) proves, without admitted proofs unless stated:
- `CKSD/Learning/Generalization/`: a Rademacher bound in expectation and with high probability
  (`Concentration.lean`), split conformal coverage for exchangeable scores with exact coverage for
  distinct scores (`Conformal.lean`), the Bayes excess-risk identity and plug-in bound and the sign
  of surrogate minimizers (`Classification.lean`), a margin bound (`Margin.lean`), the stability
  bound (`Stability.lean`) and a contraction lemma (`Contraction.lean`);
- `CKSD/Learning/Privacy/`: composition, local contraction of relative entropy, the Laplace mean
  mechanism, and central and local lower bounds for mean estimation;
- `CKSD/Learning/Algorithms.lean`: AdaBoost training-error bounds and deterministic sparse-vector
  accuracy steps; `CKSD/Learning/KernelAndClustering.lean`: oracle bounds for ridge prediction and
  almost sure convergence of `k`-means centers under compact support;
- `CKSD/Learning/LocalAveraging.lean`: the Cover–Hart inequalities (proved), the nearest-neighbour
  limits and Stone's weight theorem (admitted).

Their statements use fixed real-valued risks and finite classes in several places where this
roadmap has general classes, outer probabilities and `ℝ≥0∞`-valued risks; they are design input
only.

**Statlib** (see the Statlib coverage notes in lean-CKSD) reaches the Bayes rule and its risk
`E min(η, 1 - η)` (part of 1.2), and supplies ingredients (divergence identities, data processing
for total variation) but none of the generalization bounds, trees, ensembles, privacy or shift
results.

**Coverage of CKSD 107.** The allocated entries of the CKSD synopsis are covered as follows.

| CKSD 107 | Here | CKSD 107 | Here |
|---|---|---|---|
| 1 | 3.2–3.4 | 18 | 6.3 |
| 2 | 2.3 | 20 | 5.3 |
| 3 | 2.2 | 21 | 1.3 |
| 6 | 5.1 | 22 | 6.4 |
| 7 | 3.5 | 24 | 6.5 |
| 8 | 1.2 | 25 | 6.2 |
| 9 | 1.1 | 64 | 7.2 |
| 10 | 4.1 | 65 | 7.3 |
| 11 | 1.4 | 66 | 7.5 |
| 12 | 4.2 | 67 | 8.1 |
| 13 | 4.3 | 68 | 8.2 |
| 14 | 5.2 | 69 | 7.1 |
| 15 | 2.4 | 70 | 7.2 |
| 16 | 5.4 | 71 | 7.2 |
| 17 | 6.1 | 72 | 7.4 |
| 73 | 8.2 | 74 | 7.6 |
| 75 | 7.4 | 76 | 8.1 |
| 77 | 8.3 | | |

## References

- M. Anthony and P. L. Bartlett, *Neural Network Learning: Theoretical Foundations*, Cambridge
  University Press, 1999. Chapters 2, 4 and 5: PAC learning, upper and lower sample-complexity
  bounds, the fundamental theorem (3.1–3.4).
- S. Barocas, M. Hardt and A. Narayanan, *Fairness and Machine Learning: Limitations and
  Opportunities*, MIT Press, 2023 (author manuscript of 2022). Chapter 3: independence,
  separation, sufficiency and their relations (8.1).
- S. Boucheron, G. Lugosi and P. Massart, *Concentration Inequalities: A Nonasymptotic Theory of
  Independence*, Oxford University Press, 2013. Chapters 6, 11 and 13: bounded differences,
  symmetrization and contraction, chaining for VC classes (2.1, 2.3, 3.2).
- L. Breiman, J. H. Friedman, R. A. Olshen and C. J. Stone, *Classification and Regression
  Trees*, Wadsworth, 1984. Chapters 4 and 10: impurity, categorical splits, Brier loss and
  minimal cost-complexity pruning (1.3, 6.1, 6.2).
- F. Cucker and D.-X. Zhou, *Learning Theory: An Approximation Theory Viewpoint*, Cambridge
  University Press, 2007. Chapters 1 and 8: least-squares risk and regularized kernel regression
  (4.3).
- L. Devroye, L. Györfi and G. Lugosi, *A Probabilistic Theory of Pattern Recognition*, Springer,
  1996. Chapters 2, 3, 5, 6, 7, 8 and 14: Bayes and plug-in rules, nearest neighbours, Stone's
  theorem, no free lunch, ERM and lower bounds (1.1, 1.2, 2.4, 3.3, 3.5, 5.2, 5.3).
- C. Dwork and A. Roth, *The Algorithmic Foundations of Differential Privacy*, Foundations and
  Trends in Theoretical Computer Science 9, 2014. Chapters 2 and 3: definitions, mechanisms,
  composition and the sparse vector technique (Layer 7).
- L. Györfi (ed.), *Principles of Nonparametric Learning*, CISM Courses and Lectures 434,
  Springer, 2002. Györfi's chapter for Stone's theorem (5.3) and T. Linder's chapter for empirical
  quantizer design (5.4).
- M. Hardt and B. Recht, *Patterns, Predictions, and Actions: Foundations of Machine Learning*,
  Princeton University Press, 2022 (manuscript of 2023). Chapter 6: stability and margins (4.2,
  6.5).
- V. Koltchinskii, *Oracle Inequalities in Empirical Risk Minimization and Sparse Recovery
  Problems*, Lecture Notes in Mathematics 2033, Springer, 2011. Chapter 2: symmetrization and
  contraction (2.1).
- M. Mohri, A. Rostamizadeh and A. Talwalkar, *Foundations of Machine Learning*, 2nd ed., MIT
  Press, 2018. Chapters 2–7 and 14: PAC learning, Rademacher complexity, surrogate losses, margins,
  kernels, boosting and stability (Layers 1–4, 6.5).
- J. Quiñonero-Candela, M. Sugiyama, A. Schwaighofer and N. D. Lawrence (eds.), *Dataset Shift in
  Machine Learning*, MIT Press, 2009. Chapters 1 and 6: covariate shift and prior probability
  shift (8.2, 8.3).
- B. Schölkopf and A. J. Smola, *Learning with Kernels*, MIT Press, 2002. Chapters 4 and 5: the
  representer theorem and uniform convergence (4.3, 3.2).
- V. N. Vapnik, *Statistical Learning Theory*, Wiley, 1998. Chapter 4: growth functions and the
  equivalence of finite VC dimension and uniform convergence (3.2, 3.4).
- M. J. Wainwright, *High-Dimensional Statistics: A Non-Asymptotic Viewpoint*, Cambridge
  University Press, 2019. Chapter 13: oracle inequalities for kernel ridge regression (4.3).
