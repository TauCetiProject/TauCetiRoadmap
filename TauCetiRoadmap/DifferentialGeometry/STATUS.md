<!--tauceti-status:v1 {"roadmap":"DifferentialGeometry","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the endomorphism-valued CurvatureForm and the legacy two-form comparison equivalence","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"induced smooth structures on covering spaces (2.3), descent of forms along the orientation cover, the pi_1 criterion, the Mobius-band acceptance test","state":"partial"},{"id":"Layer 3","remaining":"Banach smooth dependence and flows, homogeneity, straightening, commuting and time-dependent flows","state":"partial"},{"id":"Layer 4","remaining":"involutivity criteria, local Frobenius flat charts, maximal leaves of an involutive distribution","state":"partial"},{"id":"Layer 5","remaining":"the homotopy operator (5.4); densities and Stokes with corners (5.5)","state":"partial"},{"id":"Layer 5.6","remaining":"agreement with corners Stokes (5.5) and the Riemannian divergence theorem (12.5), once those exist","state":"partial"},{"id":"Layer 6","remaining":"homotopy invariance, path integrals and H1 of simply connected M, extension by zero, compactly supported cohomology of R^n","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"degree at a regular value, the integral formula, and the degree calculus","state":"partial"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","remaining":"the Riemannian volume form and density (12.4), the divergence theorem and Green identities (12.5)","state":"partial"}],"readme_sha":"f24cde9d03da7ab4568645105ebdb97a790691864c6a464669d1de1cb9363c2d","roadmap":"DifferentialGeometry","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: DifferentialGeometry

This file documents the status of the DifferentialGeometry roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The exterior calculus on manifolds is done, Stokes' theorem holds for manifolds with boundary, and Green's theorem is proved in both of the strong forms the roadmap asks for. De Rham cohomology is defined with its first computations. Flows, orientations, Frobenius and the Riemannian operators are partial. Mayer–Vietoris, the de Rham theorem, Poincaré duality, the degree and the hairy ball theorem have not begun.

### Named results

- **Stokes' theorem** — [`integralTopForm_mextDeriv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Integration/Stokes.html#TauCeti.integralTopForm_mextDeriv): `∫_M dω = ∫_{∂M} ω` for a compactly supported `C¹` form on an oriented smooth manifold over the half-space, with the boundary carrying the outward-first orientation; on a [boundaryless manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Integration/BoundarylessStokes.html#TauCeti.integralTopForm_mextDeriv_eq_zero) exact top forms integrate to zero.
- **Green's theorem for absolutely continuous curves** — [`green_ac_winding`](https://taucetiproject.org/docs/TauCeti/Analysis/Green/Winding.html#TauCeti.Green.green_ac_winding): the circulation of a field that is `C¹` near a closed absolutely continuous curve equals its curl weighted by the winding number, with no simplicity or bounded-speed assumption. The [index-one form](https://taucetiproject.org/docs/TauCeti/Analysis/Green/IndexOne.html#TauCeti.Green.green_ac_index_one) is HOL Light's statement.
- **Green's theorem for divided regions** — [`Division.integrable_and_integral_add_integral_eq_integral_sub`](https://taucetiproject.org/docs/TauCeti/Analysis/Green/Division/Green.html#TauCeti.Green.Division.integrable_and_integral_add_integral_eq_integral_sub): the Isabelle-style theorem for separate type-I and type-II divisions, with Henstock–Kurzweil boundary integrals and only the directional derivatives it uses.
- **The Poincaré lemma on a normed space** — [`subsingleton_deRhamCohomology_normedSpace`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/NormedSpace.html#TauCeti.subsingleton_deRhamCohomology_normedSpace): de Rham cohomology vanishes in positive degrees. It rests on the [relative Poincaré homotopy](https://taucetiproject.org/docs/TauCeti/Analysis/Calculus/DifferentialForm/Poincare.html#Convex.extDerivWithin_poincareHomotopy) on convex sets, which also works at boundary charts.
- **Degree-zero cohomology** — [`finrank_deRhamCohomology_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/DegreeZero.html#TauCeti.finrank_deRhamCohomology_zero): on a connected manifold, `H⁰_dR` is one-dimensional, read through the locally constant functions.

### Notable definitions and infrastructure

- **The oriented integral of top forms**, pinned by its [chart formula](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/Integration/Regularity.html#TauCeti.integralTopForm_of_tsupport_subset_chart): signed chart integrals over the chart-sign orientations, glued over a cover. It is what Stokes and the planar comparisons are stated against.
- **[De Rham cohomology](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/Basic.html#TauCeti.deRhamCohomology)** as the homology of the de Rham complex in `ModuleCat ℝ`, with pullback functoriality, a [wedge product on classes](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/Wedge.html#TauCeti.deRhamCohomology.wedge_mk), and a [compactly supported version](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/CompactSupport.html#TauCeti.compactlySupportedDeRhamCohomology) that is functorial for proper maps. This is the carrier for layers 7–9.
- **[`GP` equals Henstock in dimension one](https://taucetiproject.org/docs/TauCeti/Analysis/BoxIntegral/FundThmCalculus.html#TauCeti.BoxIntegral.hasIntegral_GP_iff_Henstock_fin_one)**, which turns Mathlib's `GP` divergence theorem into a gauge fundamental theorem of calculus with countably many exceptions. The planar boundary integrals are built on it.

### Roadmap coverage

Layer 1 is done: the manifold `d` with its naturality, `d² = 0`, regularity, the Leibniz rule, the Lie derivative and Cartan's formula, and the `d(x dy)` acceptance check. Layer 0 is done except for the endomorphism-valued curvature form; the old `SmoothTwoForm` is now an abbreviation for the generic carrier. Layer 5.6 is done except for its comparisons with 5.5's corners Stokes and 12.5's divergence theorem, neither of which exists yet. Layer 5 has 5.1–5.3, but not the homotopy operator (5.4) or densities and corners (5.5). Layer 6 has 6.1, 6.2 and the compactly supported complex, but not homotopy invariance, path integrals, extension by zero or `H^•_c(ℝⁿ)`. Several layers are partial at the definitions:

- Layer 2 has orientations, orientation-preserving maps, the orientation double cover and invariant parts of forms, but not smooth structures on covers or descent along the cover.
- Layer 3 has the finite-dimensional maximal flow and completeness, but not the Banach theory.
- Layer 4 has integral manifolds and leaves of foliations, but not the involutivity criteria or flat charts.
- Layer 10 has regular values and Sard on manifolds, but no degree.
- Layer 12 has metrics, the gradient, divergence, Hessian and Laplace–Beltrami, but not 12.4–12.5.

Layers 7, 8, 9 and 11 are untouched.

## The frontier

- **Homotopy invariance of de Rham cohomology (5.4 → 6.3).** Next is the homotopy operator on `M × [0, 1]`, proved directly rather than through Stokes; homotopy invariance and `H¹` of simply connected manifolds follow from it.
- **Mayer–Vietoris (layer 7).** The short exact sequence and its connecting map have not been started. The cohomology carrier and smooth partitions are already in place, and layers 8 and 9 both run on this.
- **Densities and Stokes with corners (5.5).** Still missing: densities and their integral, the abstract boundary, and the `|∫_{S¹} dθ| = 2π` acceptance test. The comparisons left in 5.6 are also waiting on this.
- **Banach flows (3.1–3.2).** Smooth dependence on initial conditions for Banach-space fields is the gating analysis, followed by straightening, commuting flows and time-dependent flows. Homogeneity in 3.3 is what the degree theorem needs.
- **Frobenius (4.2–4.4).** Missing are the two involutivity criteria, flat charts from the existing graph-coordinate theorem, and maximal leaves of an involutive distribution.
