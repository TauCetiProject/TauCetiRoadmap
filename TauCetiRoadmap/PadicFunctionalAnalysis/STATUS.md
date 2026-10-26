<!--tauceti-status:v1 {"roadmap":"PadicFunctionalAnalysis","to_sha":"b257e0ff255355b2b692c1311d061d2b4dc84e53","ts":"2026-10-26T06:42:33+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"adapted module norms, quotient and norm comparisons, gauge promotion and required checks","state":"partial"},{"id":"Layer 1","remaining":"Noetherian finite-module norm comparisons, discrete-valuation orthogonal bases and required checks","state":"partial"},{"id":"Layer 2","remaining":"countable-type strict splitting, completed extension, finite-coordinate detection and remaining basis comparisons","state":"partial"},{"id":"Layer 3","remaining":"character formulas, Mahler calculus, van der Put coordinate comparisons and remaining measure checks","state":"partial"},{"id":"Layer 4","remaining":"Amice analytic basis, stage injectivity and union, character analyticity, distribution bijection and convolution","state":"partial"},{"id":"Layer 5","remaining":"unit decomposition, weights, universal specialisation, measure functions, analytic factors and annular coefficients","state":"untouched"}],"readme_sha":"25034d7df4c77b5b6a301186aac79e1740adcc642a8042befdba23e1bb91017f","roadmap":"PadicFunctionalAnalysis","to_sha":"b257e0ff255355b2b692c1311d061d2b4dc84e53"}-->
# Status: PadicFunctionalAnalysis

This file documents the status of the PadicFunctionalAnalysis roadmap up until `b257e0f` (2026-10-26T06:42:33+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The residue-basis form of Serre’s theorem and bounded Mahler duality are proved, together with the integral dual unit ball. Layers 0–4 remain partial; the character, specialisation and annular-coefficient layer has no recorded implementation in the supplied evidence.

### Named results

- **[Serre’s orthonormalisation theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/ResidueBasis.html#TauCeti.ResidueModule.isOrthonormalBasis_iff)** — For complete ultrametric rings and modules with contractive action and norms in the powers of a multiplicative pseudo-uniformiser, a unit-ball family is an orthonormal basis exactly when its residues form a basis.
- **[Mahler duality](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.mahlerMomentsEquiv)** — Over Banach–Tate ℤ_p-algebras, measures on ℤ_p correspond bijectively to bounded moment sequences, with the field-valued operator norm equal to the [supremum of the moment norms](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/MahlerDuality.html#AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff).
- **The [integral dual unit ball](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Measure/IntegralUnitBall.html#AbstractMeasure.existsUnique_integral_iff_norm_le_one)** — A ℚ_p-valued measure has norm at most one exactly when it is the unique coefficient extension of a ℤ_p-valued measure.
- **[Van der Put’s theorem](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/VanDerPut.html#PadicInt.vanDerPutEquiv)** — Continuous functions on ℤ_p with values in a complete ultrametric normed group are isometrically parametrised by null sequences of clopen-ball coefficients.
- **Quantitative Amice estimates** — The inequalities [S_h ≤ D_h](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AmiceNorm.html#TauCeti.gaussNorm_amiceRadius_le_amiceDualNorm) and [D_h ≤ p S_(h+1)](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AmiceNorm.html#TauCeti.amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ), with boundedness hypotheses on the defining suprema, yield equivalence between all-level factorial-weighted boundedness and [convergence on every closed radius below one](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AmiceNorm.html#TauCeti.onOpenDisc_iff_forall_bddAbove_norm_coeff_mul_norm_factorial).

### Notable definitions and infrastructure

- **[Tate gauges](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TateGauge.html#TauCeti.Huber.tateGauge)** recover the topology from a subring and a unit whose powers define a neighbourhood basis; their kernel is the closure of zero, and changing the exponential base gives a power comparison.
- **The [ring-scalar operator norm](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/RingOpNorm.html#ContinuousLinearMap.ringOpNorm_eq_opNorm)** agrees with the field operator norm; the [quantitative open mapping theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Operator/RingOpNorm/OpenMapping.html#ContinuousLinearMap.exists_preimage_norm_le_of_isTate) supplies uniformly bounded lifts through surjections of complete modules over Tate scalars.
- **The [analytic stages](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.html#TauCeti.AnalyticStage)** use native null families of disc coefficients, with norm-decreasing evaluation and contractive re-expansion to finer discs; their identification with function spaces still needs injectivity.

### Roadmap coverage

On the supplied, partly truncated declaration evidence, Layers 0–4 are **partial**. Layer 0 has summation estimates, multiplicative units, rounding and gauges; adapted norms and the full quotient/comparison package are not established. Layer 1 has operator and mapping theory, but the Noetherian finite-module norm comparison and discrete-valuation orthogonal-basis package remain unestablished. Layer 2 has model coordinates, matrices, residue bases and countable-type spaces [potentially orthonormalisable](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Module/Bases/ModelSpace.html#TauCeti.isPotentiallyONable_of_dense_span); strict splitting, completed extension and finite-coordinate detection remain. Layer 3 has bounded duality and function coordinates, but character formulas and the full coordinate-change calculus remain. Layer 4 has stages and moment estimates, but the analytic basis, algebraic union and distribution bijection remain. Layer 5 is **untouched** on this evidence.

## The frontier

- **Finite-module norm control** — Establish the canonical complete quotient topology and presentation-independent norm comparison over Noetherian Banach–Tate rings, then finite-coordinate detection and closedness in model spaces.
- **Countable-type strict splitting** — Construct complements and the compatible product decomposition for closed-subspace exact sequences; transport it through the suppliers’ native completed tensor maps for the extension corollary.
- **Amice’s analytic basis theorem** — Prove the factorial-scaled binomial basis isometry onto each disc-coefficient stage, then evaluation injectivity for p-torsion-free coefficients and the Mahler decay criterion.
- **The distribution Amice bijection** — Form the algebraic union and compatible stage-bounded dual, identify its operator seminorms with the factorial-weighted bounds, and construct the inverse transform and additive convolution; the analytic basis is the missing bridge.
- **Characters and specialisation** — Establish the all-prime unit decomposition and weight parameters, followed by universal specialisation and its measure-coordinate comparison; the completed group algebra and general measure comparison are supplier interfaces, while the annular coefficient example remains unestablished.
