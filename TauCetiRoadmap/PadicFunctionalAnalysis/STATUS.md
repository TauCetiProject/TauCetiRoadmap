<!--tauceti-status:v1 {"roadmap":"PadicFunctionalAnalysis","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3","ts":"2026-10-26T19:49:38Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Full module norm comparisons, compatible normed gauge models and required examples.","state":"partial"},{"id":"Layer 1","remaining":"Canonical topology and norm comparisons for finite Banach modules; discrete-valued orthogonal bases.","state":"partial"},{"id":"Layer 2","remaining":"Strict countable-type splitting and completed extension; finite-coordinate detection; remaining Serre consequences.","state":"partial"},{"id":"Layer 3","remaining":"Character coordinates, multiplication formulas, coordinate changes and remaining convolution comparisons.","state":"partial"},{"id":"Layer 4","remaining":"Amice analytic basis, injective stage comparisons, algebraic union, distributions and convolution.","state":"partial"},{"id":"Layer 5","remaining":"Units decomposition, weights, universal specialisation, analytic factors and the annular coefficient ring.","state":"untouched"}],"readme_sha":"25034d7df4c77b5b6a301186aac79e1740adcc642a8042befdba23e1bb91017f","roadmap":"PadicFunctionalAnalysis","to_sha":"938acbb89c936ff7608191ef06108b13b32693b3"}-->
# Status: PadicFunctionalAnalysis

This file documents the status of the PadicFunctionalAnalysis roadmap up until `938acbb` (2026-10-26T19:49:38Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Central theorems on bases and bounded measures are proved, while Layers 0–4 remain partial and no results for Layer 5 are evidenced. Analytic coefficient stages and quantitative series estimates are available; the analytic basis theorem, strict splitting and distribution correspondence remain unestablished here, with some declarations omitted from the supplied context.

### Named results

- **Serre’s residue-basis criterion** — For complete ultrametric rings and modules with contractive action and norms in powers of a multiplicative pseudo-uniformiser, a unit-ball family is an orthonormal basis exactly when its residues form a basis ([`TauCeti.ResidueModule.isOrthonormalBasis_iff`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/ResidueBasis.html#TauCeti.ResidueModule.isOrthonormalBasis_iff)).
- **Model-space theorem for countable type** — Every infinite-dimensional ultrametric Banach space of countable type over a complete nontrivially normed field is continuously linearly equivalent to c₀(ℕ), without a discrete-valuation assumption ([`TauCeti.nonempty_continuousLinearEquiv_zeroAtInfty_nat_of_dense_span`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/ModelSpace.html#TauCeti.nonempty_continuousLinearEquiv_zeroAtInfty_nat_of_dense_span)).
- **Bounded Mahler duality** — Measures on ℤ_p over complete ultrametric Tate coefficients correspond to bounded moment sequences, with operator norm equal to the supremum of moment norms for complete field coefficients with contractive ℤ_p action ([`AbstractMeasure.mahlerMomentsEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.mahlerMomentsEquiv); [`AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff)).
- **Integral dual unit ball** — A ℚ_p-valued measure has norm at most one exactly when it is the unique coefficient extension of a ℤ_p-valued measure ([`AbstractMeasure.existsUnique_integral_iff_norm_le_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/IntegralUnitBall.html#AbstractMeasure.existsUnique_integral_iff_norm_le_one)).
- **Quantitative Amice estimates** — Writing D_h for the factorial-weighted coefficient supremum and S_h for the corresponding disc supremum, the inequalities S_h ≤ D_h ≤ p S_(h+1) hold when the relevant families are bounded ([`TauCeti.gaussNorm_amiceRadius_le_amiceDualNorm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AmiceNorm.html#TauCeti.gaussNorm_amiceRadius_le_amiceDualNorm); [`TauCeti.amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AmiceNorm.html#TauCeti.amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ)).

### Notable definitions and infrastructure

- **Tate gauges** recover the topology from a subring and a unit whose power ideals form a neighbourhood basis, supplying an ultrametric seminorm for topological Tate analysis ([`TauCeti.Huber.exists_tateSeminorm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TateGauge.html#TauCeti.Huber.exists_tateSeminorm)).
- **The universal property of c₀** turns bounded families into continuous linear maps isometrically over Tate scalars, supporting coefficient expansions and duality ([`ZeroAtInftyContinuousMap.linearCombinationEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/ContinuousMap/ZeroAtInfty/LinearCombination.html#ZeroAtInftyContinuousMap.linearCombinationEquiv)).
- **Analytic stages** retain disc coefficients as their carrier and provide norm-decreasing evaluation and re-expansion, preparing the comparison with analytic functions ([`TauCeti.AnalyticStage.transition`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.html#TauCeti.AnalyticStage.transition)).

### Roadmap coverage

Layers 0–2 are partial: gauges, unit-ball analysis, operator norms, mapping theorems, bases, duality and matrices are available, but the full norm-comparison package, finite Banach-module topology, strict countable-type splitting and finite-coordinate detection are not established here. Layer 3 is partial, with continuous-function coordinates, bounded duality, the integral unit ball and the measure projectors proved; character coordinates and all requested multiplication and convolution comparisons are not established here. Layer 4 is partial at the coefficient-stage and series-estimate level; its analytic basis, algebraic union and distribution theorems remain unestablished. Layer 5 is untouched in the available evidence, including weights, specialisation and the annular coefficient ring. No entire layer is certified complete.

## The frontier

- **Strict splitting in countable type.** Construct compatible projections and sections for closed exact sequences; then transport the splitting through the supplied completed tensor constructions.
- **Finite modules and coordinates.** Supply the canonical Banach topology and norm comparisons over Noetherian Banach–Tate rings, then closedness and finite-coordinate detection for finite submodules of c₀.
- **Amice’s analytic basis.** Prove the factorial-scaled binomial coefficient isometry, evaluation injectivity under the stated torsion hypotheses, and the diagonal transition formula.
- **The distribution correspondence.** Form the algebraic union and its stage-bounded dual, identify operator seminorms with the coefficient estimates, and construct the open-disc bijection and additive convolution; the analytic basis comparison is the prerequisite.
- **Weights and specialisation.** Establish the units decomposition with q=p or q=4, then character parameters and the adic and normed universal properties, using the specified local-field and completed-group-algebra suppliers.
