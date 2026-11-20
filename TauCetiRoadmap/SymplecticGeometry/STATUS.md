<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"symplectic structure and normal bundle of fixed loci, equivariant Darboux and the weight normal form on manifolds, and the rank-one coroot normalization","state":"partial"},{"id":"Layer 2","remaining":"Morse-Bott property of moment components on manifolds, connected levels, equivariant Thom/Euler classes and rational perfection","state":"partial"},{"id":"Layer 3","remaining":"convexity charts from the slice model, torus and Kirwan convexity, Kostant convexity, and the word121 symplectic form and moment-map identity","state":"partial"},{"id":"Layer 4","remaining":"the Duistermaat-Heckman measure for proper moment maps, its polynomial density, level bundles and reduced classes","state":"partial"},{"id":"Layer 5","remaining":"the Delzant quotient and classification, toric fibre and vertex theorems, cohomology, and the weighted orbifold charts and area","state":"partial"}],"readme_sha":"b5d66982a18715f926ed5d7faf82dcbf25eb12128e840da286e31b3cc140a2d3","roadmap":"SymplecticGeometry/ConvexityToric","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Done: the cotangent phase space, the matrix polar and Cartan package, Liouville's theorem, and contact Darboux and Gray stability at the level of forms. Partial: Liouville–Arnold, which has local action-angle coordinates but no global chart; flux and moment maps; generating functions and billiards; Lagrangian mechanics; and the foundations of every ConvexityToric layer. Missing: every theorem that needs a quotient manifold, namely regular reduction, torus convexity, Duistermaat–Heckman and Delzant classification.

### Named results

- **The contact Darboux theorem** — around every point of a manifold with a contact form α there is a chart to ℝⁿ × ℝⁿ × ℝ that [pulls dz − Σ pᵢ dqᵢ back to α itself](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Darboux/Strict.html#TauCeti.SmoothForm.IsContactForm.exists_strictDarbouxChart). Alongside it, [Gray's stability theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Gray.html#TauCeti.SmoothForm.mpullback_grayDiffeomorph_apply) holds on compact manifolds.
- **Periodic billiard trajectories** — on every strictly convex table, for each N ≥ 2, [the billiard map has a point of period N](https://taucetiproject.org/docs/TauCeti/Dynamics/Billiard/Chain.html#TauCeti.StrictConvexBilliardTable.exists_isPeriodicPt_billiardMap) whose least period divides N.
- **Noether's theorem** — for a Lagrangian invariant under a group action, [the Noether charges are conserved along the Lagrangian flow](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Legendre/Noether.html#TauCeti.momentMap_legendreMap_eq_of_isMIntegralCurveOn) and [form an equivariant moment map](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Legendre/Noether.html#TauCeti.isEquivariantMomentMap_momentMap_comp_legendreMap).
- **Local action-angle coordinates** — near a compact component of a regular level of Poisson-commuting functions, [action-angle coordinates exist locally](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Hamiltonian/Liouville/Action/Chart.html#TauCeti.SmoothTwoForm.IsSymplectic.exists_isLocalDiffeomorphAt_eval₂_mfderiv_eq_of_isCompact), and [such components are tori](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Hamiltonian/Liouville/Torus.html#TauCeti.SmoothTwoForm.IsSymplectic.nonempty_homeomorph_unitAddTorus).
- **Liouville's theorem** — [every time-t map of a complete Hamiltonian flow preserves the Liouville measure](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/LiouvilleMeasure.html#TauCeti.SmoothTwoForm.IsSymplectic.measurePreserving_globalFlowDiffeomorph_liouvilleMeasure) |σⁿ/n!|.

### Notable definitions and infrastructure

- **Lattice quotients of cotangent bundles.** T*B/Λ is a regular Lagrangian torus fibration. Its [action-angle chart is symplectic](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/LatticeQuotient/ActionAngle.html#TauCeti.CotangentBundle.LatticeQuotient.mpullback_actionAngleChart_symplecticForm), and it is injective exactly when its developing map is.
- **Flux and the Hamiltonian group.** On a compact symplectic manifold every first de Rham class is a flux. Hamiltonian isotopies have zero flux. The [flux group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Flux/Endpoint.html#TauCeti.fluxGroup) measures how far flux depends on the path, and for the two-torus it is the area lattice.
- **The local-to-global principle for convexity.** A proper map with convexity charts everywhere [has convex image](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/LocalToGlobal.html#IsProperMap.convex_range_of_isConvexChart) and connected fibres. This is the engine of torus convexity, once the charts come from the symplectic slice.

### Roadmap coverage

- **CotangentLagrangian.** C1 is done except for products and pullback along maps that are not diffeomorphisms. Conormal bundles of embedded submanifolds are now exact Lagrangians. C2.0 is largely done. C2.1 is partial: the Cartan decomposition and the [Schur–Horn theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star) are in, but maximality is missing. C2.2 is partial. C3 is partial, with the chain dictionary, composition of generating functions, smooth convex billiards with periodic orbits, and the circle table. C4 has only point-germ relative Darboux and the relative Poincaré lemma.
- **ContactGeometry.** CG1–CG2 are essentially done. CG3 is done for forms. Not established: relative Gray for distributions without a chosen family of forms. CG4–CG6 are partial, and the Legendrian neighbourhood theorems are missing.
- **HamiltonianReduction.** R1, R1a, R2 and R3 are partial. R1a now has the Hamiltonian group and the two-torus flux group. R2 has a moment map for left-invariant Kirillov forms. No reduced manifold exists. R2a, R4 and R5 are untouched.
- **ConvexityToric.** All five layers are partial. T1 has fixed sets of isometry groups as totally geodesic embedded submanifolds, but not their symplectic structure. T3 has the local-to-global principle and the exact word121 hexagon on the incidence variety.
- **IntegrableSystems.** I2.0 is largely done. I1–I4 are partial. I3 gained Noether's theorem and the Euler–Lagrange equations in charts. I4 has the rotational moment map and Runge–Lenz conservation. I5 has only strip-level tools: the generating-function equation, density normalization and a Moser argument.
- **Suspensions.** S0 and S1 are partial. S2 is untouched.

## The frontier

- **Regular reduction (R3).** What remains is the smooth structure and symplectic form on μ⁻¹(0)/G for a free proper action. The Delzant quotient and Duistermaat–Heckman both wait on this.
- **Torus convexity (T3.1).** The local-to-global theorem is in. Still needed: convexity charts and connected local fibres built from the symplectic slice normal form, then the polytope as the hull of fixed-component images.
- **Fixed loci as symplectic submanifolds (T1.2).** The fixed sets are embedded and totally geodesic. Missing: the smooth polar complex structure, nondegeneracy of the restricted form, and the symplectic normal bundle.
- **A global action-angle chart (I2).** The local coordinates and the symplectic model chart on T*B/Λ are both in. What remains is identifying a neighbourhood of a regular compact fibre with that model by one symplectomorphism.
- **The word121 moment polygon (T3.3).** The image of the weighted projector map is the hexagon. The symplectic form on the incidence variety and the proof that this map is its moment map are missing.
