<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the fixed-locus theorem, equivariant Darboux and the weight normal form on manifolds, and the rank-one coroot normalization","state":"partial"},{"id":"Layer 2","remaining":"Morse-Bott property of moment components on manifolds, connected levels, equivariant Thom/Euler classes and rational perfection","state":"partial"},{"id":"Layer 3","remaining":"torus and Kirwan convexity, Kostant projection convexity, and the word121 manifold, moment map and exact image","state":"partial"},{"id":"Layer 4","remaining":"the Duistermaat-Heckman measure for proper moment maps, its polynomial density, level bundles and reduced classes","state":"partial"},{"id":"Layer 5","remaining":"the Delzant quotient and classification, toric fibre and vertex theorems, cohomology, and the weighted orbifold charts and area","state":"partial"}],"readme_sha":"b5d66982a18715f926ed5d7faf82dcbf25eb12128e840da286e31b3cc140a2d3","roadmap":"SymplecticGeometry/ConvexityToric","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Done: the cotangent phase space, the matrix polar and Cartan package, and Liouville's theorem. Contact forms are done through Darboux and Gray stability. Partial: Liouville–Arnold, which has local action-angle coordinates but no global chart; moment maps and flux; generating functions; Lagrangian mechanics; and the foundations of every ConvexityToric layer. Missing: every theorem that needs a quotient manifold, namely regular reduction, torus convexity, Duistermaat–Heckman and Delzant classification.

### Named results

- **The contact Darboux theorem**: around every point of a contact manifold there is a chart to ℝⁿ × ℝⁿ × ℝ in which [the contact form is a positive multiple of dz − Σ pᵢ dqᵢ](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Darboux/Manifold.html#TauCeti.SmoothForm.IsContactForm.exists_darbouxChart).
- **Gray's stability theorem**: on a compact manifold, [the Gray flow carries a smooth family of contact forms to positive rescalings of one another](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Gray.html#TauCeti.SmoothForm.mpullback_grayDiffeomorph_apply). A [relative version](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Gray.html#TauCeti.SmoothForm.exists_partialDiffeomorph_mpullback_eq_smul) needs no compactness and fixes the points where the contact hyperplane is stationary.
- **Local action-angle coordinates**: near a compact component of a level of Poisson-commuting functions that consists of regular points, [action-angle coordinates exist locally](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Hamiltonian/Liouville/Action/Chart.html#TauCeti.SmoothTwoForm.IsSymplectic.exists_isLocalDiffeomorphAt_eval₂_mfderiv_eq_of_isCompact), and [such components are tori](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Hamiltonian/Liouville/Torus.html#TauCeti.SmoothTwoForm.IsSymplectic.nonempty_homeomorph_unitAddTorus).
- **Liouville's theorem**: [every time-t map of a complete Hamiltonian flow preserves the Liouville measure](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Manifold/LiouvilleMeasure.html#TauCeti.SmoothTwoForm.IsSymplectic.measurePreserving_globalFlowDiffeomorph_liouvilleMeasure) |σⁿ/n!|.
- **The Schur–Horn theorem**: the diagonals of the unitary conjugates of diag(w) are [exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star).

### Notable definitions and infrastructure

- **The cotangent bundle and its lattice quotients.** ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm). Dividing by a lattice of closed one-forms gives [a regular Lagrangian torus fibration](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/LatticeQuotient.html#TauCeti.CotangentBundle.LatticeQuotient.isLagrangianTorusFibration_proj) T*B/Λ → B, the model for a global action-angle chart.
- **Flux.** The flux of an isotopy is a homomorphism, and on a compact symplectic manifold [every first de Rham class is a flux](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Flux/Flow.html#TauCeti.Diffeotopy.exists_flux_eq).
- **Delzant polytopes and the Delzant level.** The zero level of the kernel torus's moment map is [a compact smooth manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Delzant/Level.html#TauCeti.Toric.IsDelzant.isManifold_delzantLevel) with a free torus action.

### Roadmap coverage

- **CotangentLagrangian.** C1 is done except for products and pullback along maps that are not diffeomorphisms. C2.0 is largely done. C2.1 is partial: the [Cartan decomposition of Sp(2n, ℝ)](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Cartan/Realify.html#TauCeti.GLSymplectic.cartanHomeomorph) through realified U(n) is in, but maximality is missing. C2.2 is partial: the non-Kähler argument for Kodaira–Thurston is missing. C3 is partial: generating functions, their composition, and the next-collision map of a convex billiard are in. C4 has only the point-germ relative Darboux theorem and the relative Poincaré lemma.
- **ContactGeometry.** CG1–CG2 are essentially done. CG3 is largely done. Not established: Darboux with exact pullback of the standard form, and relative Gray for distributions without a chosen family of forms. CG4–CG6 are partial, and the Legendrian neighbourhood theorems are missing.
- **HamiltonianReduction.** R1, R1a, R2 and R3 are partial. Torus moment maps are unique up to constants, cotangent lifts of torus actions are Hamiltonian, and regular toric levels are Lagrangian, but no reduced manifold exists. R2a, R4 and R5 are untouched.
- **ConvexityToric.** All five layers are partial. T1 gained smooth Bochner linearization and an equivariant Darboux theorem on vector spaces. T3 gained the word121 hexagon, computed from the fixed values.
- **IntegrableSystems.** I2.0 is largely done. I1–I4 are partial: I2 has local action-angle coordinates, and I3 has the Legendre transform, Hamilton's equations for hyperregular Lagrangians and the extended phase space. I5 has only the generating-function equation of an area-preserving strip map.
- **Suspensions.** S0 and S1 are partial. S2 is untouched.

## The frontier

- **Regular reduction (R3).** What remains is the smooth structure and symplectic form on μ⁻¹(0)/G for a free proper action. The Delzant quotient and Duistermaat–Heckman both wait on this.
- **The Delzant quotient (T5).** The level is a compact manifold with a free kernel-torus action. Still needed: the quotient manifold, its reduced form, the identification of its moment image with Δ, and uniqueness.
- **A global action-angle chart (I2).** The local coordinates, the torus theorem and integral-affine uniqueness are in. They still have to be assembled into one symplectomorphism from an action domain times the whole torus.
- **Fixed loci and equivariant normal forms on manifolds (T1).** Bochner linearization and the equivariant Darboux theorem on vector spaces are in. Missing: fixed loci as embedded symplectic submanifolds, equivariant Darboux on manifolds, and the weight normal form.
- **The word121 moment polygon (T3).** The hexagon and its vertices are computed from the fixed-point table. The Bott–Samelson manifold, its symplectic form, its moment map and the identification of the image with this hexagon are all missing.
