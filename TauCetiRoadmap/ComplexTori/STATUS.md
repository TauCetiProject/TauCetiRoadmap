<!--tauceti-status:v1 {"roadmap":"ComplexTori","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Milestone 1","state":"done"},{"id":"Milestone 2","state":"done"},{"id":"Milestone 3","remaining":"reversal law, descended smooth trivializations over the free locus, and the homology action of the descended family","state":"partial"},{"id":"Milestone 4","remaining":"naturality of the connecting map under base change in a varying family","state":"partial"},{"id":"Milestone 5","remaining":"normal character ζ, triviality of N^m, canonical characters and adjunction for the multiple fibre","state":"partial"},{"id":"Milestone 6","remaining":"biholomorphic downstairs gauge, regluing into the ambient manifold, independence of choices, induced π₁ and H₁ maps","state":"partial"}],"readme_sha":"9564aa96c758250afce7f66e13636907ff399977d9ec0ddc2a280b8be1a6c5e4","roadmap":"ComplexTori","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ComplexTori

This file documents the status of the ComplexTori roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Fixed complex tori and holomorphic families from varying periods are done, and the algebra of cyclic affine actions is done apart from base change in families. Equivariant descent, multiple fibres and logarithmic transforms are partial. Monodromy along free homotopies, the multiple fibre as a set and the logarithmic gauge as a homeomorphism are in place. The normal and canonical characters, a biholomorphic gauge and the regluing are not.

### Named results

- **Homology of a complex torus** — for a full lattice `L`, the integral homology of `E/L` is the exterior algebra on `L`, naturally in maps induced by lattice-preserving linear maps ([`orbitRelQuotientHomologyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Torus/ZLattice.html#Submodule.orbitRelQuotientHomologyEquiv)).
- **Non-isotriviality of a varying elliptic family** — for a nonconstant holomorphic `τ`, the family `ℂ/(ℤτ(y) + ℤ)` admits no biholomorphism over the base onto a product with one fixed elliptic curve, so the smooth trivialization cannot be made holomorphic in general ([`exists_fst_ne_torusFamilyProjection_periodPair`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family/NonIsotrivial.html#TauCeti.exists_fst_ne_torusFamilyProjection_periodPair)).
- **The fixed-point criterion for affine maps** — the `k`-th iterate of `x ↦ A x + t` on a torus has a fixed point exactly when the partial norm `N_{A,k}(t)` lies in the image of `1 - A^k`, which decides freeness for every nonidentity power ([`exists_affineEquiv_iterate_apply_eq_self_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Cyclic/Affine.html#AddEquiv.exists_affineEquiv_iterate_apply_eq_self_iff)).
- **The integral connecting isomorphism** — for `0 → Λ → E → T → 0`, the connecting map sends the degree-one class of `t` to the class of the norm of a lift, and is an isomorphism `H¹(C_m,T) ≃ H²(C_m,Λ)` ([`cyclicConnectingEquiv`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/GroupCohomology/CyclicAutomorphism.html#TauCeti.cyclicConnectingEquiv)).
- **Multiplicity of the central fibre** — for a free cyclic affine action over the rotated disc, the quotient map `t = z^m` reads as `u^m` in every chart, so the central fibre has multiplicity exactly `m` ([`analyticOrderAt_torusFamilyAffineQuotientLift_rootsOfUnityBall`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family/RotatedDisc.html#TauCeti.analyticOrderAt_torusFamilyAffineQuotientLift_rootsOfUnityBall)).

### Notable definitions and infrastructure

- **The manifold structure on a torus family** ([`isManifold_torusFamily`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family/Manifold.html#TauCeti.isManifold_torusFamily)) puts the quotient atlas on `(Y × E)/Λ`. The orbit map is a covering and a local biholomorphism, and the projection is a holomorphic submersion. It is a Hurewicz fibration, with markings `Hₙ(T_y) ≅ ⋀ⁿΛ`.
- **The affine action on a torus family** ([`torusFamilyAffineMulAction`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family/AffineAction.html#TauCeti.torusFamilyAffineMulAction)) takes a linear cocycle and torus-valued translation sections. Its freeness is decided fibrewise at base stabilizers, so it handles elliptic base points that the linear constructor cannot. Its monodromy acts on the marking through `ρ`.
- **The logarithmic gauge** ([`torusFamilyLogGaugeEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family/LogGauge/Basic.html#TauCeti.torusFamilyLogGaugeEquiv)) identifies the punctured cyclic quotient with the punctured varying family over `D_t*`, independently of root and branch.

### Roadmap coverage

Milestones 1 and 2 are done. That includes the change of marking by `Aut(Λ)` and the regression test that a varying elliptic family is not isotrivial. Milestone 4 is done except naturality of `δ` under base change in a varying family. Milestone 3 is partial. Both constructors, proper discontinuity, total-space freeness, submersion charts over a free base and naturality under equivariant base change are proved. So is the monodromy formula along free homotopies, in the canonical marking and in an arbitrary one. The reversal law, the descended smooth trivializations and the homology action of the descended family are not established here. Milestone 5 has items 1–3: the free action, the quotient and its submersion off zero, and the local equation with multiplicity `m`. The central fibre is the smooth embedded image of `T_0/C_m`. Its normal and canonical characters (items 4–5) remain. Milestone 6 has the covering identification, most of the cyclic normalization, and the gauge as a homeomorphism. Holomorphy of the gauge downstairs, the regluing, independence of choices and the `π₁`/`H₁` computations remain.

## The frontier

- **Holomorphy of the downstairs gauge.** The upstairs gauge is holomorphic off the central fibre. It still has to be descended through the quotient atlas to make the gauge on `Q*` a biholomorphism.
- **Normal and canonical characters of the multiple fibre.** Identify the normal character as `ζ`, prove `N^⊗m` trivial, and prove adjunction `K_F ≅ K_Q|_F ⊗ N`. This needs ComplexManifolds Milestone 7.6.
- **Monodromy of the descended family.** The formula is proved along free homotopies in the total space. What remains is the reversal law, descending the smooth trivializations over the free locus, and the action on homology through exterior powers.
- **Family base change for the connecting class.** This is the last piece of Milestone 4: fibrewise cohomology comparisons along a pullback of the lattice, vector-space and torus local systems.
- **Regluing and its topology.** Glue `Q` into the ambient manifold through `G⁻¹`, prove independence of the choices, and compute the induced `π₁` and `H₁` maps. This waits on the biholomorphic gauge and on the ComplexManifolds and GeometricTopology gluing APIs.
