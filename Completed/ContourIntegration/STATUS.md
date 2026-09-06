<!--tauceti-status:v1 {"roadmap":"ContourIntegration","to_sha":"0672a6c8860fefd8735c693005a94574cd823d27","ts":"2026-09-04T22:05:30Z"}-->
# Status: ContourIntegration

This file documents the status of the ContourIntegration roadmap up until `0672a6c` (2026-09-04T22:05:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hungerbühler–Wasem summit and all four supporting layers are established, now through finite integral contour cycles rather than only single curves. No required roadmap layer is partial or untouched; the remaining frontier consists of generalisations beyond the roadmap's deliberately pinned scope.

### Named results

- **[The Hungerbühler–Wasem generalized residue theorem for cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/HungerbuhlerWasem.html#TauCeti.Contour.Cycle.hungerbuhlerWasem_residueTheorem)** — the principal value along a null-homologous contour cycle may pass through its finite singular set and equals the winding-weighted residue sum under conditions (A′) and (B), with an unconditional form for at-worst-simple poles.

- **[Hungerbühler–Wasem Proposition 2.2](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Crossing/ImmersionDecomposition.html#TauCeti.Contour.IsPwC1ImmersionOn.exists_crossingDecomposition)** — a closed piecewise-`C¹` immersion decomposes into an avoiding curve and finitely many model sectors, so its generalized winding number is an integer plus the crossing-angle sum divided by `2π`.

- **[Hungerbühler–Wasem Proposition 2.3](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/RealIntegral/OnCurve.html#TauCeti.Contour.windingNumber_eq_real_integral_of_closed_interior_crossings)** — for a closed immersion with interior crossings and one-sided `C^{1,1}` derivative control there, the bounded real winding integrand is ordinarily integrable and computes the generalized winding number.

- **[The homology Cauchy theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/HomologyCauchy.html#TauCeti.Contour.homologyCauchyTheorem)** — a holomorphic function integrates to zero along a null-homologous closed contour, with Cauchy formulas for all iterated derivatives.

- **[The classical residue theorem for cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Residue.html#TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous)** — when a null-homologous cycle avoids a finite pole set, its integral is `2πi` times the winding-weighted residue sum.

### Notable definitions and infrastructure

- **[Contour cycles](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Cycle/Basic.html#TauCeti.Contour.Cycle)** package finite formal `ℤ`-linear combinations of closed piecewise-`C¹` curves, with additive integration, principal values, winding numbers, traces and null-homology.

- **[The generalized winding number](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Contour/Winding/Number/Basic.html#TauCeti.Contour.windingNumber)** is defined by a Cauchy principal value even on the curve; finite circular-cap excision connects its local crossing angles to an avoiding contour.

- **Residue** is the order-`−1` Laurent coefficient tied to `meromorphicOrderAt`; its polar-part decomposition drives both the classical and generalized residue theorems.

### Roadmap coverage

Layers 0–1 are complete: curves and cycles carry the generalized winding number, arbitrary continuous punctured-plane homotopies preserve it, off-curve integrality is the zero-crossing case of the integer-plus-angle formula, and the model-sector, finite-crossing decomposition and on-curve bounded-real-integral formula are all present. Layers 2–3 are complete through residues, the argument principle, classical residue and homology Cauchy theorems, including cycle and star-shaped forms. Layer 4 is complete in the pinned finite-singularity, meromorphic, basepoint-off-singularities form, both for one curve and for cycles. The model sector, circle, half-residue and improper-integral examples are realised; in particular `∫₀ᴿ sin x/x dx → π/2`.

## The frontier

- **Paper-level singularities.** The theorem still treats a finite meromorphic singular set; extending it to the paper's accumulation-free sets and locally straight essential singularities lies beyond the pinned result.

- **Direct cycle geometry.** Proposition 2.2 and the on-curve Proposition 2.3 are stated for one closed immersion; the cycle theory combines curve results additively, but no separately named cycle-level versions of these propositions are established here.

- **The valence formula.** The contour engine supplies the on-boundary winding weights and an argument principle whose curve may meet the zeros; assembling the modular valence formula remains work for the Modular Forms roadmap.

- **Signed-curvature packaging.** The crossing value remains expressed by `(ẋÿ − ẏẍ)/(2(ẋ² + ẏ²))` under `C²` regularity, as intended; the supplied material identifies no general signed-curvature API to package it.
