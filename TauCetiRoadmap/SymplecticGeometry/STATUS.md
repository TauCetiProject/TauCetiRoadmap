<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"7625b6caf1569c82302607627cb23796cd6f6035","ts":"2026-11-07T09:57:06Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `7625b6c` (2026-11-07T09:57:06Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space is in place, and the foundations of contact geometry (CG1–CG2) are essentially complete. The matrix polar package, the positive-period circle and the smooth mapping torus are well advanced. Moment maps, reduction, Liouville–Arnold, Duistermaat–Heckman, the Delzant classification and contact Darboux/Gray have not begun. Part of the latest work is missing from the record behind this report, so some layers may be further along.

### Named results

- **The Schur–Horn theorem** — as U runs over the unitary group, the diagonals of U diag(w) Uᴴ form [exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star).
- **The contact volume criterion** — on a (2n+1)-manifold, a one-form is contact [exactly when α∧(dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero). Equivalently, [the Levi form of its kernel is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Levi.html#TauCeti.SmoothForm.isContactForm_iff_forall_bijective_distributionLeviForm).
- **Contactization and one-jets** — dz − θ on W × ℝ is [contact exactly when −dθ is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothForm.isContactForm_contactization_iff). In T*M × ℝ, [one-jets of functions are Legendrian embeddings](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/OneJet.html#TauCeti.CotangentBundle.isLegendrianEmbedding_contactization_liouvilleForm), and [exact Lagrangian embeddings lift to Legendrian ones](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap.isLegendrianEmbedding_contactization).
- **Sp(2n,ℝ) is connected** — the path t ↦ P^(1−t)U [stays inside the symplectic group](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Polar/Symplectic.html#SymplecticGroup.joinedIn_polarUnitary), which gives [path-connectedness](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#SymplecticGroup.instPathConnectedSpace).
- **The topology of the Kodaira–Thurston manifold** — its [fundamental group is H(ℤ) × ℤ](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/UniversalCover/KodairaThurston.html#TauCeti.KodairaThurston.fundamentalGroupMulEquiv), and its [first Betti number is three](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DeRham/KodairaThurston.html#TauCeti.KodairaThurston.finrank_deRhamCohomology_one).

### Notable definitions and infrastructure

- **The cotangent bundle** [`CotangentBundle`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Cotangent.html#TauCeti.CotangentBundle) carries ω = −dλ, which is [symplectic](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm). Smooth Lie group actions now [lift smoothly to it](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Diffeomorph/Cotangent.html#TauCeti.CotangentBundle.instContMDiffSMul), as cotangent reduction needs.
- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) comes with its [suspension flow](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus.flow), the [fibre form](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/MappingTorus.html#TauCeti.SmoothMappingTorus.fiberForm) and an [orientation](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/Orientation.html#TauCeti.SmoothMappingTorus.orientation).
- **Contact Hamiltonian vector fields** [`contactHamiltonianVectorField`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Hamiltonian.html#TauCeti.SmoothForm.contactHamiltonianVectorField) include the Reeb field. Their flows [rescale α by exp ∫ R_α f](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Flow.html#TauCeti.SmoothForm.IsContactHamiltonianVectorField.mpullback_flowOf_apply), as CG3's Moser arguments need.

### Roadmap coverage

**CotangentLagrangian.** C1 is partial: the bundle, λ, ω, cotangent lifts, fibre translations and smooth equivariant lifts of group actions are done. Open restriction, products and general pullbacks are not established. In C2, the linear algebra is done, and so is most of C2.0. C2.1 is partial: it has symplectic polar preservation, connectedness of U(n), GL(n,ℂ) and Sp(2n,ℝ), and sp's Killing form and Cartan involution. Maximal compactness, the centre {±I} and the adjoint comparison are missing. C2.2 is partial: the Liouville field, an exact-Lagrangian notion and the Kodaira–Thurston topology are there, but conormals, the cotangent-lift classification and the Kodaira–Thurston symplectic form are not. C3 is untouched. C4 has only a relative Poincaré lemma on convex neighbourhoods.

**ContactGeometry.** CG1 and CG2 are essentially done. CG3 has only the linear normal form and the horizontal contact-Moser equation. CG4 has contactization but no symplectization. CG5 has the isotropic dimension bound and conformal symplectic normal spaces, but no neighbourhood theorem. CG6 has the Jacobi bracket only.

**HamiltonianReduction.** R1 is partial: it has fundamental vector fields with the bracket sign, stabilizers as Lie subgroups with the isotropy algebra, but no moment maps. R2 is partial: it has the coadjoint representation and an algebraic KKS form with so(3) and Heisenberg examples, but no orbit manifolds. R1a and R3–R5 are untouched.

**ConvexityToric.** In T3, the Schur–Horn part is done. Kostant convexity and the Atiyah–Guillemin–Sternberg theorem are not. T1, T2, T4 and T5 are untouched.

**IntegrableSystems.** I2.0 is largely done: the circle Lie group, its time form and orientation, the circle family, and integration over circles and 2-tori. I1 has only its local factorization ingredient. Kronecker density for linear torus flows is in hand for I4. I2 and I3 are untouched.

**Suspensions.** S0 is partial: the carrier, interval charts, flow, time and fibre forms and orientation are done, but not Ω = ds∧dt + ω_v on X_φ. S1 has closed orbits, their fibre intersection counts, orbit tori and homology classes, but no block structure J. S2 is untouched.

## The frontier

- **Symplectic form on X_φ (S0)**: prove Ω = ds∧dt + ω_v is closed and nondegenerate. S1's block J then needs HeegaardFloer F2.1's compatible structures.
- **Contact Darboux and Gray stability (CG3)**: the linear normal form, the horizontal Moser equation and Lie derivatives along time-dependent flows are in place. What remains is the local contact-Moser path and its flow on a shrunken chart.
- **Maximal compactness (C2.1)**: show that U(n) is maximal compact in GL(n,ℂ) and in Sp(2n,ℝ), using the trace-growth argument. The polar factors are ready.
- **Coadjoint orbits as manifolds (R2) and moment maps (R1)**: stabilizers are embedded Lie subgroups and KKS exists algebraically. Next is the orbit G/G_ν with KKS as its symplectic form.
- **Kodaira–Thurston symplectic form (C2.2)**: construct the closed nondegenerate form and the odd-b₁ obstruction to Kähler.
