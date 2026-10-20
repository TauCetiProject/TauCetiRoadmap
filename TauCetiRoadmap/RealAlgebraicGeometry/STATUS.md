<!--tauceti-status:v1 {"roadmap":"RealAlgebraicGeometry","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"CAD existence by recursive Lazard projection, iterating the one-level lifting theorem","state":"partial"}],"readme_sha":"90042ab5929cc7307e694c618e30bb9ee0d4d4e79b5e3c9c7bb1cc88f9567e24","roadmap":"RealAlgebraicGeometry","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: RealAlgebraicGeometry

This file documents the status of the RealAlgebraicGeometry roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1–7 are done. Over `ℝ`, the roadmap now has the Collins route to CAD and unconditional quantifier elimination, plus McCallum's order-invariant projection. Only Layer 8 is partial: Lazard lifting is proved over a single cell and one CAD level, but the recursive construction of a CAD by Lazard projection has not landed.

### Named results

- **Existence of adapted CADs** — every finite family of real polynomials in `n` variables has a cylindrical algebraic decomposition of `ℝⁿ` on whose cells each member is sign-invariant, with no well-orientedness assumption: [`exists_isCAD_signInvariant`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.exists_isCAD_signInvariant).
- **The Tarski–Seidenberg theorem** — projections of semialgebraic subsets of `ℝⁿ⁺¹` are semialgebraic. This is installed as an [instance](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Existence.html#TauCeti.instHasSemialgebraicProjectionsReal), so [quantifier elimination](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Semialgebraic/QuantifierElimination.html#TauCeti.exists_isQF_realize_iff) and the definable-equals-semialgebraic theorem hold over `ℝ` with no extra hypothesis.
- **The local discriminant theorem** — a polynomial whose fibres are nonzero and of constant degree over a connected analytic submanifold, and whose discriminant has constant order there, is analytically delineable: [`exists_analytic_delineation_of_orderAt_discr_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Stack/Discriminant/Global.html#TauCeti.exists_analytic_delineation_of_orderAt_discr_eq). Order is also [constant along each root section](https://taucetiproject.org/docs/TauCeti/Analysis/Polynomial/Puiseux/GlobalOrder.html#Polynomial.orderAt_root_eq_of_orderAt_discr_eq).
- **Correctness of McCallum's projection** — a well-oriented family has a CAD into analytic submanifolds on which every member has constant order of vanishing: [`exists_isCAD_orderAt_eq_of_isMcCallumWellOriented`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/McCallum/Basic.html#TauCeti.exists_isCAD_orderAt_eq_of_isMcCallumWellOriented). The [sign-invariant variant](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/McCallum/Existence.html#TauCeti.exists_isCAD_signInvariant_of_isMcCallumWellOriented_projection) needs well-orientedness only below the top level.
- **Lazard lifting** — over a connected analytic submanifold on which the Lazard projection is valuation-invariant, a family has a Lazard delineation, even where its ordinary fibres vanish: [`nonempty_lazardDelineation_of_lazardProjection`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Projection/Lazard/Lifting.html#TauCeti.nonempty_lazardDelineation_of_lazardProjection).

### Notable definitions and infrastructure

- **McCallum well-orientedness.** [`IsMcCallumWellOriented`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/McCallum/Basic.html#TauCeti.IsMcCallumWellOriented) asks, recursively, that each basis polynomial is nullified at only finitely many points of the base. Families in at most two variables satisfy it automatically. A [counterexample](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/McCallum/Basic.html#TauCeti.exists_nullified_mcCallumProjection_orderAt_ne) shows the condition cannot be dropped.
- **One-level Lazard CAD lifting.** An analytic base CAD on which the Lazard projection is valuation-invariant [lifts to an analytic, sign-invariant CAD](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/CAD/Lazard/Projection.html#TauCeti.IsCAD.exists_isCAD_lazardValuation_eq_of_lazardProjection) whose cells have constant Lazard valuation. This is the inductive step that recursive Lazard CAD still needs.
- **Integer projection.** [`integerProjection`](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Projection/Integer.html#Finset.integerProjection) computes the Collins projection over `ℤ`. Its image in `ℝ` is [exactly the real projection](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Projection/Integer.html#Finset.image_map_integerProjection), so delineability transfers to integer input.

### Roadmap coverage

Layers 1–4 are done (real closures, Sturm–Tarski, Thom encodings, subresultants, BKR sign determination, root continuity and common matching). Layer 5 is done now that integer projection and integer delineability are in. Layer 6 is done: CADs exist, have their finite-partition characterization, and give unconditional projection closure and quantifier elimination over `ℝ`. Layer 7 is done. The analytic toolkit, both forms of Puiseux with parameters, the local discriminant theorem, the basis lifting theorem, the delineating refinement at nullifying points, the failure example and recursive correctness are all proved. The family theorem is stated for the irreducible basis rather than for a general squarefree, pairwise coprime basis. Layer 8 is partial. Valuations, evaluators, Lazard projection, single-polynomial and family lifting, one-level CAD lifting and the nullified example are in. CAD existence by recursive Lazard projection is not.

## The frontier

- **CAD by recursive Lazard projection** — iterate the one-level lifting theorem down the dimensions. The base projection must have constant Lazard valuation in the coordinate order the lifting expects, and a reindexed Lazard valuation is already defined for changing that order. Then recover sign-invariance for the original family, with no well-orientedness condition.
- **McCallum's family theorem for general bases** — optional. The README asks for a squarefree, pairwise coprime primitive basis, but the lifting theorems use an irreducible basis. Generalising would only widen the statement; the correctness theorem does not need it.
