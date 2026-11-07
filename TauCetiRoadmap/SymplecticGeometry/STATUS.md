<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"08a51bc861c1164cec8967d78702731083676e5d","ts":"2026-11-07T00:52:31Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `08a51bc` (2026-11-07T00:52:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space is in place, the contact floor (CG1–CG2) is largely built, contactization is done, and the matrix groundwork for C2 and T3 is substantial. The smooth mapping torus of S0 exists. Every deep theorem the roadmap names is still open: Darboux and Gray, reduction, moment-map convexity, Liouville–Arnold, Delzant and the S2 horizontal-image theorem. The latest window was only partly surveyed, so some layers may be further along.

### Named results

- **The cotangent bundle is symplectic** — ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm), matching the linear cotangent form in every chart.
- **The Schur–Horn theorem** — the diagonals of [the unitary orbit of a diagonal matrix](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star) form exactly the permutahedron of its eigenvalues, with a matching statement for [symmetric operators](https://taucetiproject.org/docs/TauCeti/Analysis/InnerProductSpace/SchurHorn.html#LinearMap.IsSymmetric.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm) and Rado's majorization description of the permutahedron.
- **The contact volume criterion** — on a (2n+1)-manifold, α is contact [exactly when α ∧ (dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero), equivalently when the Levi form of its kernel is nondegenerate.
- **Exact Lagrangians are projections of Legendrians** — [exact Lagrangian maps are exactly the projections of horizontal lifts to the contactization](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothTwoForm.IsNondegenerate.isExactLagrangianMap_iff_isHorizontalMap_contactization), and [the one-jet space T*M × ℝ is contact](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.CotangentBundle.isContactForm_contactization_liouvilleForm).
- **The real symplectic group is connected** — [Sp(2n,ℝ) is path connected](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#Matrix.isPathConnected_symplecticGroup), by contracting the positive polar factor inside the group. U(n) and GL(n,ℂ) are handled the same way.

### Notable definitions and infrastructure

- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) of φ comes with time and fibre forms, an orientation, and a suspension flow whose time-one map is φ. Its [closed orbits](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.closedOrbit) of least period d are embedded circles meeting each fibre d times.
- **Contact Hamiltonian vector fields** [`contactHamiltonianVectorField`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Hamiltonian.html#TauCeti.SmoothForm.contactHamiltonianVectorField) are unique and satisfy Cartan's formula. They generate cooriented contact flows and a Jacobi bracket obeying the Jacobi identity, and the Reeb field is the case f = 1.
- **The positive-period circle** is [a Lie group](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/AddCircle.html#AddCircle.instLieAddGroup) with time form, orientation and rescalings. It extends to oriented tori and to [smooth families of varying period](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/CircleFamily.html#TauCeti.CircleFamily), the base for I2 and S0.

### Roadmap coverage

- **CotangentLagrangian.** C1 items 1–2 are done. Lifts of group actions (item 3) and open restriction (item 4) now exist, but the product T*(M×N) and pullback along general maps do not. C2.0 is largely done. C2.1 is partial: polar preservation, connectedness and the sp Killing form are done, while realification, the intersection identities and the maximal-compact theorems are missing. C2.2 has the Liouville field and the Kodaira–Thurston manifold (π₁ = H(ℤ) × ℤ, b₁ = 3) but not its symplectic form, the conormals or the lift classification. C4 has the local relative Poincaré lemma only. C3 is untouched.
- **ContactGeometry.** CG1–CG2 are largely done and CG4's contactization is done. CG5 has Legendrian immersions and conformal symplectic normal spaces but no neighbourhood theorems. CG6 has the cooriented Jacobi bracket only. CG3 has only its linear and Moser preliminaries.
- **HamiltonianReduction.** R1 and R2 are partial: fundamental vector fields, stabilizers as Lie subgroups, and an algebraic KKS form with the so(3) and Heisenberg computations. R1a and R3–R5 are untouched.
- **ConvexityToric.** T3's Schur–Horn examples are done but Kostant convexity is not. The other layers are untouched.
- **IntegrableSystems.** I2.0 is largely done, missing family scaling and the uniform estimates. I1–I4 are untouched, though Kronecker's density theorem is ready for I2.
- **Suspension.** S0 is partial, with Y_φ built but no form Ω on S¹ × Y_φ. S1 has the periodic images and their homology classes but no block almost-complex structure. S2 is untouched.

## The frontier

- **Contact Darboux and Gray (CG3)**: integrate the contact-Moser field on a shrinking chart for Darboux, then prove relative Gray for families that agree along a closed set.
- **Suspension form and block structure (S0–S1)**: prove Ω = ds∧dt + ω_v symplectic on S¹ × Y_φ, then descend the seam-compatible J built from HeegaardFloer F2.1's compatible-structure family.
- **Coadjoint orbit manifolds (R2)**: build G/G_ν through SmoothBundlesConnections B1.4 and put the KKS form on it, with closedness and the moment-map property. Kostant convexity in T3 waits on this.
- **Maximal compact subgroups (C2.1)**: prove U(n) maximal compact in GL(n,ℂ) and in Sp(2n,ℝ), after realification and the intersection identities. The trace-growth lemma is already proved.
- **Finish C1 and the C2.2 examples**: the product T*(M×N) and cotangent pullback along general maps, then the zero section, closed graphs, conormals and the Kodaira–Thurston symplectic form.
