<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"83769e442d55cda9d85b3927a93b286831c595ff","ts":"2026-11-10T23:06:22+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the fixed-locus theorem, equivariant Darboux and the weight normal form on manifolds, and the rank-one coroot normalization","state":"partial"},{"id":"Layer 2","remaining":"Morse-Bott property of moment components on manifolds, connected levels, equivariant Thom/Euler classes and rational perfection","state":"partial"},{"id":"Layer 3","remaining":"torus and Kirwan convexity, Kostant projection convexity, and the word121 moment polygon","state":"partial"},{"id":"Layer 4","remaining":"the Duistermaat-Heckman measure for proper moment maps, its polynomial density, level bundles and reduced classes","state":"partial"},{"id":"Layer 5","remaining":"the Delzant quotient and classification, toric fibre and vertex theorems, cohomology, and the weighted orbifold charts and area","state":"partial"}],"readme_sha":"b5d66982a18715f926ed5d7faf82dcbf25eb12128e840da286e31b3cc140a2d3","roadmap":"SymplecticGeometry/ConvexityToric","to_sha":"83769e442d55cda9d85b3927a93b286831c595ff"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `83769e4` (2026-11-10T23:06:22+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Done: the cotangent phase space, the basic theory of contact forms, the matrix polar package and Liouville's theorem. Partial: moment maps, reduction ingredients, generating functions, the classical examples and the combinatorics of toric polytopes. Not yet begun: none of the main global theorems has landed, namely symplectic reduction as a manifold, torus convexity, Liouville–Arnold, Delzant classification, and contact Darboux and Gray stability.

### Named results

- **Liouville's theorem**: [every time-t map of a complete Hamiltonian flow preserves the Liouville measure](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/LiouvilleMeasure.html#TauCeti.SmoothTwoForm.IsSymplectic.measurePreserving_globalFlowDiffeomorph_liouvilleMeasure) |σⁿ/n!|.
- **The cotangent bundle is symplectic**: ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm).
- **The contact criterion**: a one-form on a (2n+1)-manifold is contact exactly when [α ∧ (dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero).
- **The Schur–Horn theorem**: the diagonals of the unitary conjugates of diag(w) are [exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star).
- **Bound Kepler orbits fill tori**: at energies above the circular one, [each bound energy–momentum level is a torus](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Hamiltonian/CentralForce/Kepler/Torus.html#TauCeti.nonempty_homeomorph_unitAddTorus_keplerBoundPhaseSpace), which is the Liouville–Arnold picture in a worked example.

### Notable definitions and infrastructure

- **Delzant polytopes and the Delzant level.** Facet presentations have a Delzant predicate, satisfied by simplices, products and Hirzebruch trapezoids. The zero level of the kernel torus's moment map is [a compact smooth manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Delzant/Level.html#TauCeti.Toric.IsDelzant.isManifold_delzantLevel) on which that torus acts freely. This is everything Delzant's quotient construction needs on the level set itself.
- **Flux.** The [flux of an isotopy](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Flux.html#TauCeti.Diffeotopy.flux) is defined, and a symplectic vector field is Hamiltonian exactly when its de Rham class vanishes. This opens the global-flux layer of reduction.
- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) is the carrier of the suspension family. Its suspension form is now symplectic, and its projection to the circle is a submersion with nondegenerate vertical form.

### Roadmap coverage

- **CotangentLagrangian.** C1 is done except for products, open restriction and general pullbacks. C2.0 is largely done. C2.1 is partial: the adjoint kernel of Sp is {±1} and Ad⁻¹(Ad U(n)) = U(n), but realification and maximality are missing. C2.2 is partial: the Kodaira–Thurston manifold is symplectic with b₁ = 3, and the non-Kähler argument is missing. C3 is partial: generating functions give canonical transformations. C4 is partial: there is a relative Poincaré lemma and a point-germ relative Darboux theorem, but no relative neighbourhood theorems.
- **ContactGeometry.** CG1–CG2 are essentially done. CG3 has ingredients only. CG4–CG6 are partial: the symplectization embeds in T*M symplectically exactly for contact forms, and unit conormals are Legendrian. The neighbourhood theorems are missing.
- **HamiltonianReduction.** R1, R1a, R2 and R3 are partial. Moment maps, the equivariant quadratic moment map of linear actions, flux and the Hamiltonian ideal are in, as are a natural algebraic KKS form and the descent of brackets and Hamiltonian flows to a presymplectic quotient. There are no orbit manifolds and no reduced manifolds. R2a, R4 and R5 are untouched.
- **ConvexityToric.** All five layers are partial, and each has only its foundations. T1 has the period-lattice dictionary, invariant metrics and the smooth polar complex structure. T2 has the Morse–Bott carrier and the weight-model indices. T3 has the U(n) Schur–Horn case. T4 has the Liouville measure. T5 has the Delzant combinatorics and level, and the weighted ellipsoid quotient as a topological space.
- **IntegrableSystems.** I2.0 is largely done. I1–I4 are partial: planar central forces are integrable, the Kepler, spherical-pendulum and isotropic-oscillator examples are in, and the angle map of a section is smooth and injective modulo 2π. There is no Liouville–Arnold theorem.
- **Suspensions.** S0 and S1 are partial. S2 is untouched.

## The frontier

- **The Delzant quotient (T5).** The level is a compact manifold with a free kernel-torus action. What remains is to build the quotient manifold, put the reduced form on it, identify its moment image with Δ, and then prove uniqueness.
- **Regular reduction (R3).** Brackets and Hamiltonian flows already descend. The missing piece is the smooth structure and symplectic form on μ⁻¹(0)/G for a free proper action.
- **Liouville–Arnold (I2).** The angle map is smooth, periodic and injective modulo the period lattice. Still needed are the general theorem identifying compact connected regular fibres with tori, and action coordinates.
- **Duistermaat–Heckman (T4).** The Liouville measure, its invariance and the weight-model pushforward are in. What remains is the DH measure for proper moment maps and its piecewise-polynomial density. This depends on reduction and on orbifold integration.
- **Contact Darboux and Gray stability (CG3).** Contact-Moser fields are now smooth in families. What remains is integrating the Moser flow, and the relative Gray theorem.
