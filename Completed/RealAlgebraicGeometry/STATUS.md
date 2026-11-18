<!--tauceti-status:v1 {"roadmap":"RealAlgebraicGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"90042ab5929cc7307e694c618e30bb9ee0d4d4e79b5e3c9c7bb1cc88f9567e24","roadmap":"RealAlgebraicGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: RealAlgebraicGeometry

This file documents the status of the RealAlgebraicGeometry roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All eight layers are done. Over `ℝ` the roadmap has the full Collins route to CAD and unconditional quantifier elimination, McCallum's order-invariant projection under well-orientedness, and Lazard's valuation-invariant projection, which needs no such hypothesis. Recent work restates and sharpens existing results rather than opening new ground.

### Named results

- **Validity of Lazard's projection** — every finite family of real polynomials in `n` variables has a CAD of `ℝⁿ` into analytic submanifolds on whose cells each member has constant Lazard valuation and constant sign, with no well-orientedness hypothesis and with nullification allowed: [`exists_isCAD_lazardValuationReindex_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Lazard/Existence.html#TauCeti.exists_isCAD_lazardValuationReindex_eq). The valuation is read with the coordinates in reverse.
- **Correctness of McCallum's projection** — a well-oriented family has a CAD into analytic submanifolds on which every member has constant order of vanishing: [`exists_isCAD_orderAt_eq_of_isMcCallumWellOriented`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/McCallum/Basic.html#TauCeti.exists_isCAD_orderAt_eq_of_isMcCallumWellOriented).
- **Existence of adapted CADs** — every finite family of real polynomials has a sign-invariant cylindrical algebraic decomposition, proved through Collins delineability: [`exists_isCAD_signInvariant`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.exists_isCAD_signInvariant).
- **The Tarski–Seidenberg theorem** — projections of semialgebraic subsets of real space are semialgebraic, an [instance over `ℝ`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.instHasSemialgebraicProjectionsReal), so [quantifier elimination](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Semialgebraic/QuantifierElimination.html#TauCeti.exists_isQF_realize_iff) holds there unconditionally.
- **Thom's lemma** — if a sign is prescribed for every derivative of a polynomial, including the polynomial itself, the points realising those signs form a set with at most one point or an open interval: [`preimage_derivativeSign_subsingleton_or_eq_Ioo`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Thom/Interval.html#Polynomial.preimage_derivativeSign_subsingleton_or_eq_Ioo).

### Notable definitions and infrastructure

- **The local discriminant theorem.** A polynomial of constant degree over a connected analytic submanifold, nowhere nullified there and with discriminant of constant order, is [analytically delineable](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Stack/Discriminant/Global.html#TauCeti.exists_analytic_delineation_of_orderAt_discr_eq). This drives the McCallum results. Underneath it sits a parametrised Puiseux theory whose branches and Laurent forms are now [compatible with complex conjugation](https://taucetiproject.org/docs/TauCeti/Analysis/Polynomial/Puiseux/RootDifference/Symmetry.html#TauCeti.Polynomial.exists_analyticOnNhd_nonmonic_root_sub_eq_zpow_mul_unit_conj).
- **Squarefree bases.** [`IsSquarefreeBasis`](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/SquarefreeBasis.html#Finset.IsSquarefreeBasis) gives primitive, squarefree, pairwise coprime factors that reconstruct each input up to a constant. McCallum's projection, lifting and well-orientedness are stated for such a basis, as the README specifies, and two counterexamples show the lifting hypotheses are needed. Root multiplicities of an input's Lazard evaluation are [fixed weighted sums](https://taucetiproject.org/docs/TauCeti/RingTheory/MvPolynomial/SquarefreeBasis/Lazard.html#Finset.IsSquarefreeBasis.exists_rootMultiplicity_lazardEval_eq_sum) of those of the basis.
- **Lazard lifting.** A family has a Lazard delineation over a connected analytic submanifold on which its Lazard projection is [valuation-invariant](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Projection/Lazard/Lifting.html#TauCeti.nonempty_lazardDelineation_of_lazardProjection). This is the inductive step of the Lazard recursion.

### Roadmap coverage

Layers 1–8 are all done. Layer 1 has ordered real closures, the characterisation of real closed fields by algebraically closed quadratic extensions, Sturm–Tarski with the Cauchy index on every kind of interval, and Thom encodings. Layer 2 has subresultants, the gcd and root-count criteria, the [structure theorem](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Subresultant/Scaling.html#Polynomial.subresultant_eq_sturmSubresultantFactor_mul) with exact scalars along signed remainders, and specialization formulas that track the exact factor when a degree bound drops. Layers 3–8 cover BKR sign determination, root continuity and common matching, Collins delineability, CAD and quantifier elimination over `ℝ`, McCallum's projection for a squarefree basis, and Lazard evaluation, projection and CAD existence.

## The frontier

- **No README milestone remains open.** Every layer's targets are proved. By the README's own choice of scope, the topological and CAD results are over `ℝ` rather than an arbitrary real closed field, so that generalisation is not a target.
- **Lazard's theorem in the native coordinate order** is optional. The validity theorem reads the Lazard valuation with the coordinates reversed, matching how Lazard evaluation treats them during the recursion. Lazard valuation is not invariant under permuting coordinates, so the order is part of the statement.
