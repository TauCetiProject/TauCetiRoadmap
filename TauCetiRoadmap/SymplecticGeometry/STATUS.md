<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The canonical cotangent symplectic structure and linear Lagrangian algebra remain established; matrix convexity, polar decomposition, contact dynamics and smooth suspension geometry now have substantial results. These layers are partial, while reduction, action-angle coordinates and the major neighborhood and classification theorems remain unestablished; some supplied declaration context is truncated.

### Named results

- **Schur–Horn** — The diagonals of a Hermitian matrix under unitary conjugation are exactly the convex hull of its eigenvalue permutations ([`Matrix.IsHermitian.range_re_diag_unitary_mul_mul_star`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.IsHermitian.range_re_diag_unitary_mul_mul_star)).
- **Weyl equidistribution for linear torus flows** — For a velocity with no nonzero integer resonance, time averages of every continuous function converge to its space average ([`TauCeti.UnitAddTorus.tendsto_inv_smul_intervalIntegral`](https://taucetiproject.org/docs/TauCeti/Analysis/Fourier/Kronecker.html#TauCeti.UnitAddTorus.tendsto_inv_smul_intervalIntegral)).
- **Matrix polar decomposition** — Every invertible real or complex matrix uniquely factors as a positive-definite matrix times an orthogonal or unitary matrix ([`Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Polar.html#Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary)).
- **The contact Jacobi identity** — The bracket induced by a contact form satisfies Jacobi for C² functions ([`TauCeti.SmoothForm.IsContactForm.jacobiBracket_jacobi`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Jacobi.html#TauCeti.SmoothForm.IsContactForm.jacobiBracket_jacobi)).
- **Primitive periodic-orbit tori** — The torus constructed from a periodic point in the mapping torus is smoothly embedded exactly when its parametrizing period is the least period ([`TauCeti.SmoothMappingTorus.isSmoothEmbedding_orbitTorus_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.isSmoothEmbedding_orbitTorus_iff)).

### Notable definitions and infrastructure

- **Cotangent phase space** — The established [symplectic form ω = −dλ](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm) now has [smooth product-bundle identifications](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Cotangent/Prod.html#TauCeti.CotangentBundle.prodDiffeomorph), open restrictions and lifted group actions available for further naturality comparisons.
- **Intrinsic contact distributions** — The line-valued Levi definition accommodates contact structures without choosing a global defining form ([`TauCeti.IsContactDistribution`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Distribution.html#TauCeti.IsContactDistribution)).
- **Variable-period circle families** — Smooth normalization to a product with the unit circle supports base change and rescaling; the total time form pulls back to dt − (t/p)dp and is not closed, unlike its fixed-period restrictions ([`TauCeti.CircleFamily.Pullback.normalization`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/CircleFamily/Pullback.html#TauCeti.CircleFamily.Pullback.normalization), [`TauCeti.CircleFamily.mpullback_representative_timeForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/CircleFamily.html#TauCeti.CircleFamily.mpullback_representative_timeForm)).

### Roadmap coverage

**CotangentLagrangian** remains partial: C1 has the missing bundle identifications, equivariance and general-map relations, but their Liouville/symplectic transport comparisons are not established here. C2 retains completed linear algebra; C2.0–C2.1 have smooth polar factors, connectedness and Killing-form calculations, but not the full ambient polar diffeomorphisms, compact intersections or maximality package. C2.2's examples remain incomplete. C4 has convex-coordinate relative primitives, without the manifold germ theorems; C3 is untouched. **HamiltonianReduction** R1–R2 are partial at smooth actions, coadjoint stabilizers and algebraic orbit forms; R1a, R2a and R3–R5 are untouched. **ConvexityToric** T3 has the matrix-convexity subtarget; T1–T2 and T4–T5 are untouched.

**IntegrableSystems** I2.0 is partial, with smooth circles, oriented forms, products and variable periods; uniform parameter estimates are not established. I4 has linear torus-flow ingredients; I1, I2 and I3 remain untouched. **ContactGeometry** CG1–CG6 are partial: intrinsic foundations, Reeb/Hamiltonian dynamics, the Moser equation, contactization, Legendrian jets and the cooriented Jacobi bracket are present; Darboux/Gray, symplectization and neighborhood conclusions are missing. **S0–S2** are partial through the mapping torus, periodic images and compact tangency lemmas; the suspension symplectic form, block structure and full horizontal-image theorem remain.

## The frontier

- **Cotangent form transport (C1)** — Prove the Liouville and symplectic identities for the new open-restriction and product identifications.
- **Embedded Lagrangian geometry (C2)** — Establish the tangent-image predicates and their immersion/embedding comparisons, then the zero-section, closed-form graph and conormal examples.
- **Symplectic suspension (S0–S2)** — Establish nondegeneracy of ds∧dt+ωᵥ, construct the seam-compatible block structure, and prove the compact horizontal-image theorem with its homological hypothesis and area normalization.
- **Relative Gray stability (CG3)** — Turn the invariant horizontal Moser equation into a neighborhood-germ isotopy fixing the prescribed closed subset, retaining the flow-domain argument without compactness.
- **Smooth coadjoint-orbit forms (R2)** — Assemble the algebraic form on the actual homogeneous quotient and prove smoothness, closedness and the orbit moment-map identity.
