<!--tauceti-status:v1 {"roadmap":"ContourIntegration","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"only extensions beyond the pinned scope: accumulation-free singular sets and locally straight essential singularities","state":"done"}],"readme_sha":"ae796dd51cdfdf5aa6753022b6161f50013b7282f20a8dcf6e6371b4362ea0f1","roadmap":"ContourIntegration","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: ContourIntegration

This file documents the status of the ContourIntegration roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hungerbühler–Wasem summit and all four supporting layers are established, for finite integral contour cycles as well as single curves. No layer is partial or untouched. What remains is generalisation beyond the roadmap's deliberately pinned scope.

### Named results

- **[The Hungerbühler–Wasem generalized residue theorem for cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/HungerbuhlerWasem.html#TauCeti.Contour.Cycle.hungerbuhlerWasem_residueTheorem)** — the principal value along a null-homologous contour cycle may pass through its finite singular set, and it equals the winding-weighted residue sum under conditions (A′) and (B). For poles that are at worst simple, it holds with no extra conditions.

- **[Hungerbühler–Wasem Proposition 2.2](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Crossing/ImmersionDecomposition.html#TauCeti.Contour.IsPwC1ImmersionOn.exists_crossingDecomposition)** — a closed piecewise-`C¹` immersion decomposes into an avoiding curve and finitely many model sectors, so its generalized winding number is an integer plus the sum of crossing angles divided by `2π`.

- **[Hungerbühler–Wasem Proposition 2.3](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/RealIntegral/OnCurve.html#TauCeti.Contour.windingNumber_eq_real_integral_of_closed_interior_crossings)** — for a closed immersion with interior crossings and one-sided `C^{1,1}` control of the derivative at them, the bounded real winding integrand is integrable in the ordinary sense and computes the generalized winding number.

- **[The homology Cauchy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/HomologyCauchy.html#TauCeti.Contour.homologyCauchyTheorem)** — a holomorphic function integrates to zero along a null-homologous closed contour. It comes with [Cauchy formulas for all iterated derivatives](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cauchy/HomologyFormula.html#TauCeti.Contour.cauchyIntegralFormula_iteratedDeriv_nullHomologous).

- **[The classical residue theorem for cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Residue.html#TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous)** — when a null-homologous cycle avoids a finite pole set, its integral is `2πi` times the winding-weighted residue sum. The [circle case](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Residue/Theorem.html#TauCeti.Contour.classicalResidueTheorem_circle) is stated separately.

### Notable definitions and infrastructure

- **[Contour cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Basic.html#TauCeti.Contour.Cycle)** are finite formal `ℤ`-linear combinations of closed piecewise-`C¹` curves. They carry additive integration, principal values, winding numbers, traces and null-homology.

- **[The generalized winding number](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/Number/Basic.html#TauCeti.Contour.windingNumber)** is defined by a Cauchy principal value, even for points on the curve. Exit-time cap windows isolate each crossing, and each window [contributes exactly its crossing angle over `2π`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Crossing/ExitWindow.html#TauCeti.Contour.windingNumber_sub_cap_exitCapWindow_eq_crossingAngle_div_two_pi), which ties local geometry to an avoiding contour.

- **The residue** is the order-`−1` Laurent coefficient, tied to `meromorphicOrderAt`. It is linear and computed on Laurent monomials, including the [residue of `g/(z − z₀)^(k+1)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Residue/Basic.html#TauCeti.Contour.residue_div_sub_pow_of_analyticAt) as a Taylor coefficient. This polar-part calculus drives both residue theorems.

### Roadmap coverage

Layers 0 and 1 are complete. Curves and cycles carry the generalized winding number, and continuous homotopies through the punctured plane preserve it. Integrality off the curve is the zero-crossing case of the integer-plus-angle formula. The model sector, the finite-crossing decomposition and the on-curve bounded real-integral formula are all present. Layers 2 and 3 are complete through residues, the argument principle, and the classical residue and homology Cauchy theorems, including cycle and star-shaped forms. Layer 4 is complete in the pinned form, for one curve and for cycles: finitely many singularities, meromorphic at each, with the basepoint off the singularities. The worked examples are realised: the model sector, the circle, the half-residue and the improper integrals, including `∫₀ᴿ sin x/x dx → π/2`.

## The frontier

- **Paper-level singularities.** The theorem still treats a finite set of meromorphic singularities. Extending it to the paper's accumulation-free sets and to locally straight essential singularities lies beyond the pinned result.

- **Direct cycle geometry.** Propositions 2.2 and 2.3 are stated for one closed immersion. The cycle theory combines curve results additively, but no separately named cycle-level versions of these propositions are established here.

- **The valence formula.** The contour engine supplies the on-boundary winding weights, and an argument principle whose curve may meet the zeros. Assembling the modular valence formula remains work for the Modular Forms roadmap.

- **Signed-curvature packaging.** The crossing value is still expressed as `(ẋÿ − ẏẍ)/(2(ẋ² + ẏ²))` under `C²` regularity, as the roadmap intends. The supplied material identifies no general signed-curvature API to package it.
