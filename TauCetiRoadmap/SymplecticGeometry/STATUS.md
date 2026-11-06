<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a","ts":"2026-11-06T05:03:45Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `afa08a3` (2026-11-06T05:03:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Linear symplectic algebra and the canonical cotangent forms are established; matrix, contact, circle-family and suspension layers are partial. Global reduction, moment-map convexity and action-angle theorems are not established here; the supplied declaration extract flags truncated context.

### Named results

- **The cotangent bundle is symplectic** — the canonical form ω=−dλ is closed and nondegenerate on T*M, with the required linear chart identification. [Cotangent symplecticity](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm).
- **The Schur–Horn theorem** — diagonals of unitary conjugates of a Hermitian matrix are exactly the convex hull of permutations of its eigenvalues. [Hermitian Schur–Horn](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.IsHermitian.range_re_diag_unitary_mul_mul_star).
- **Matrix polar decomposition** — every invertible real or complex matrix is uniquely PU with P positive definite and U orthogonal or unitary, and the positive factor contracts smoothly to the identity. [Unique factorization](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Polar.html#Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary); [smooth deformation](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Polar/Deformation.html#Matrix.GeneralLinearGroup.contMDiff_polarDeformation).
- **The algebraic Kirillov–Kostant–Souriau form** — ω([ξ],[η])=ν([ξ,η]) is nondegenerate on the stabilizer quotient 𝔤/𝔤_ν; this is an algebraic tangent model, not yet the smooth orbit theorem. [Nondegeneracy](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Coadjoint.html#Module.Dual.kksForm_nondegenerate).
- **The contact Jacobi identity** — the bracket defined by a contact form satisfies Jacobi for C² functions on finite-dimensional manifolds. [Jacobi identity](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Jacobi.html#TauCeti.SmoothForm.IsContactForm.jacobiBracket_jacobi).

### Notable definitions and infrastructure

- **Intrinsic contact structures** use the line-valued Levi form of a hyperplane distribution, allowing contactness without a global defining form. [Contact distribution](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Distribution.html#TauCeti.IsContactDistribution).
- **Positive-period circle families** support smooth base change and period scaling; the total time form obeys dη=dp∧β, while its fixed-period restrictions are closed. [Family time-form identity](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/CircleFamily.html#TauCeti.CircleFamily.mextDeriv_timeForm).
- **Smooth mapping tori** have quotient charts, complete translation flows, descended invariant forms and primitive closed-orbit embeddings, providing the geometric carrier for suspension. [Mapping torus](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus).

### Roadmap coverage

- **CotangentLagrangian:** C1 remains partial: product/open-restriction diffeomorphisms, equivariant lifts and general cotangent relations are recorded, but their full form-comparison package is not. C2 retains its completed linear algebra; C2.0–C2.1 have polar and connectedness results, not the full coordinate/maximal-compact comparisons. C2.2 is partial; C3 is untouched. C4 has the adapted-convex relative primitive, without the neighborhood theorems.
- **HamiltonianReduction:** R1 has fundamental fields and exponential flows; R2 has algebraic orbit forms and Lie stabilizers. Both are partial. R1a and R2a–R5 have no flux, orbit-height or reduction milestones established.
- **ConvexityToric:** T1 has torus arithmetic groundwork and T3 its matrix example; both remain partial. T2, T4 and T5 are untouched.
- **IntegrableSystems:** I2.0 now includes group operations, time forms, orientations, products and varying-period families, but the full estimates package is not established. I1 and I2–I4 remain untouched.
- **ContactGeometry:** CG1–CG6 are partial: contact distributions, Reeb dynamics, Moser equations, contactization, [Legendrian one-jets](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Legendrian.html#TauCeti.CotangentBundle.isLegendrianEmbedding_oneJet) and the cooriented bracket are recorded; Darboux/Gray, full symplectization, neighborhood and noncooriented Jacobi comparisons remain.
- **Suspensions:** S0–S2 are partial: quotient/flow geometry, periodic images and compact tangent-curve lemmas are present; product symplecticity, block structures, area/class formulas and the horizontal-image theorem are not established.

## The frontier

- **Cotangent naturality (C1)** — finish Liouville and symplectic comparisons for products and arbitrary open restrictions.
- **Suspension geometry (S0–S2)** — prove Ω=ds∧dt+ω_v symplectic, descend the seam-compatible block structure, and establish orbit-area and compact horizontal-image statements.
- **Contact normal forms (CG3–CG5)** — integrate the Moser equations with the stated flow domains to obtain Darboux, relative Gray and the prescribed neighborhood equivalences.
- **Matrix comparison (C2.0–C2.1)** — finish smooth polar coordinate diffeomorphisms, compact intersections, direct maximality and the separate adjoint-model comparisons.
- **Geometric moment maps (R1–R3)** — connect group actions to equivariant moment maps, build smooth homogeneous coadjoint orbits with closed KKS forms, then construct reduced spaces and their descended forms.
