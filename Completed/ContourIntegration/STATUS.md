<!--tauceti-status:v1 {"roadmap":"ContourIntegration","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"only extensions beyond the pinned scope: accumulation-free singular sets and locally straight essential singularities","state":"done"}],"readme_sha":"ae796dd51cdfdf5aa6753022b6161f50013b7282f20a8dcf6e6371b4362ea0f1","roadmap":"ContourIntegration","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ContourIntegration

This file documents the status of the ContourIntegration roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hungerbühler–Wasem summit and all four layers beneath it are established, for single curves and for finite integral contour cycles. No layer is partial or untouched. What remains is generalisation beyond the roadmap's deliberately pinned scope.

### Named results

- **[The Hungerbühler–Wasem generalized residue theorem for cycles](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Cycle/HungerbuhlerWasem.html#TauCeti.Contour.Cycle.hungerbuhlerWasem_residueTheorem)** — a null-homologous contour cycle may pass through its finite singular set, and under conditions (A′) and (B) the principal value of the integral equals `2πi` times the residue sum weighted by generalized winding numbers. When every pole is at worst simple, the [theorem needs no extra conditions](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Cycle/HungerbuhlerWasem.html#TauCeti.Contour.Cycle.hungerbuhlerWasem_residueTheorem_of_simple_poles).

- **[Hungerbühler–Wasem Proposition 2.2](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Crossing/ImmersionDecomposition.html#TauCeti.Contour.IsPwC1ImmersionOn.exists_crossingDecomposition)** — a closed piecewise-`C¹` immersion splits into an avoiding curve and finitely many model sectors, so its winding number about a point is an integer plus the crossing angles divided by `2π`.

- **[Hungerbühler–Wasem Proposition 2.3](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/RealIntegral/OnCurve.html#TauCeti.Contour.windingNumber_eq_real_integral_of_closed_interior_crossings)** — at interior crossings with one-sided `C^{1,1}` control, the real winding integrand is bounded and integrable in the ordinary sense, and it computes the generalized winding number.

- **[The homology Cauchy theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/HomologyCauchy.html#TauCeti.Contour.homologyCauchyTheorem)** — a holomorphic function integrates to zero along a closed contour that is null-homologous in its domain. This is proved by Dixon's argument and comes with the [homology-form Cauchy integral formula](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Cauchy/HomologyFormula.html#TauCeti.Contour.cauchyIntegralFormula_nullHomologous).

- **[The classical residue theorem for cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Residue.html#TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous)** — when a null-homologous cycle avoids a finite pole set, its integral is `2πi` times the residue sum weighted by integer winding numbers.

### Notable definitions and infrastructure

- **[The generalized winding number](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/Number/Basic.html#TauCeti.Contour.windingNumber)** is defined by a Cauchy principal value, so it also makes sense for points on the curve. This is what lets the summit weight on-contour residues by angles over `2π`.

- **[Contour cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Basic.html#TauCeti.Contour.Cycle)** are finite `ℤ`-combinations of closed piecewise-`C¹` curves. They carry integration, principal values, winding numbers and null-homology additively, so curve-level theorems can be restated for cycles.

- **[Piecewise-`C¹` curves](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.html#TauCeti.IsPiecewiseC1On)** now have one shared predicate, closed under sums, reversal, concatenation and restriction. Winding-number integrality, the argument principle and Rouché's theorem are stated against it, and the modular fundamental-domain boundary is [certified to satisfy it](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/LevelOne/FundamentalDomainBoundary/Basic.html#TauCeti.ModularForm.isPiecewiseC1On_fdBoundary).

### Roadmap coverage

Layers 0 and 1 are done. Curves and cycles carry the generalized winding number, which is integral off the curve, zero on the unbounded component, and invariant under continuous homotopies through the punctured plane. The model sector, the finite-crossing decomposition and the on-curve real-integral formula are all present. Layers 2 and 3 are done: residues against `meromorphicOrderAt`, the argument principle, and the classical residue and homology Cauchy theorems, in curve, cycle and star-shaped forms. Layer 4 is done in the pinned form for one curve and for cycles: finitely many singularities, meromorphic at each, with the basepoint off the singularities. The worked examples are realised, including the half-residue `πi · Res_s f` and `∫₀ᴿ sin x / x dx → π/2`.

## The frontier

- **Paper-level singularities.** The summit still treats a finite set of meromorphic singularities. Extending it to the paper's accumulation-free singular sets and to locally straight essential singularities lies beyond the pinned statement.

- **The valence formula.** The contour engine now supplies the on-boundary winding weights, an argument principle, and a piecewise-`C¹` certificate for the fundamental-domain boundary. Assembling the valence formula itself is work for the Modular Forms roadmap.

- **Cycle-level geometry.** Propositions 2.2 and 2.3 are stated for one closed immersion. Cycles combine curve results additively, but no separately named cycle-level versions are established here.

- **Signed-curvature packaging.** The crossing value of the real integrand is the explicit `(ẋÿ − ẏẍ)/(2(ẋ² + ẏ²))`, under a `C²` hypothesis, as the roadmap intends. The supplied material identifies no general signed-curvature API to express it through.
