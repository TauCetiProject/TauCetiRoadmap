<!--tauceti-status:v1 {"roadmap":"ComplexTori","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Milestone 1","remaining":"lattice quotient as a compact connected complex Lie group, induced homomorphisms and their kernels, covering and homology","state":"untouched"},{"id":"Milestone 2","remaining":"complex structure on the family quotient, covering and submersion maps, fibre identification, smooth trivialization, marking","state":"partial"},{"id":"Milestone 3","state":"untouched"},{"id":"Milestone 4","remaining":"affine iterate formula, order and fixed-point criteria, period-two comparisons, connecting homomorphism and naturality","state":"partial"},{"id":"Milestone 5","state":"untouched"},{"id":"Milestone 6","state":"untouched"}],"readme_sha":"d0273492a34ea47fdcfc2e163208122e20d18714e758fe57ffe698d2a0f949cb","roadmap":"ComplexTori","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: ComplexTori

This file documents the status of the ComplexTori roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two of the roadmap's foundations are in place. One is the uniform lattice estimate behind families of tori. The other is the cohomological description of a cyclic automorphism. No complex torus has been built as a complex manifold yet, fixed or varying. The geometric milestones (descent, multiple fibres, logarithmic transforms) have not begun.

### Named results

- **Uniform period separation on compact sets.** On a compact set of parameters, one positive constant bounds every nonzero period of a continuous family of full lattices from below ([`exists_pos_le_norm_period_of_isCompact`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family.html#TauCeti.exists_pos_le_norm_period_of_isCompact)). In a chosen basis, this is a uniform bound for the inverse period maps ([`exists_pos_mul_norm_le_norm_sum_smul_period_of_isCompact`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family.html#TauCeti.exists_pos_mul_norm_le_norm_sum_smul_period_of_isCompact)).
- **Proper discontinuity of the period action.** The lattice acts on the product of base and vector space by period translation, and this action is properly discontinuous ([`properlyDiscontinuousVAdd_periodAddAction`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family.html#TauCeti.properlyDiscontinuousVAdd_periodAddAction)). It is also free. Two points share an orbit exactly when they lie over the same parameter and differ by a period there.
- **Degree-one cohomology of a cyclic automorphism.** Odd-degree classes are the norm-zero elements modulo the image of `1 - A` ([`groupCohomologyπOdd_cyclicRep_eq_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/GroupCohomology/CyclicAutomorphism.html#AddEquiv.groupCohomologyπOdd_cyclicRep_eq_iff)). These are the affine twists up to translation conjugacy.
- **Even-degree cohomology of a cyclic automorphism.** Positive even-degree classes are the fixed points of `A` modulo norms ([`groupCohomologyπEven_cyclicRep_eq_iff`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/GroupCohomology/CyclicAutomorphism.html#AddEquiv.groupCohomologyπEven_cyclicRep_eq_iff)). Applied to the lattice, this is the concrete target of the integral connecting class.

### Notable definitions and infrastructure

- **The period translation action** ([`periodAddAction`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/Family.html#TauCeti.periodAddAction)) is set up on the standard product, as the README asks. Its orbit quotient is the total space of the torus family, so it is ready to receive the complex-quotient theorem.
- **The cyclic representation** ([`cyclicRep`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Cyclic/Automorphism.html#AddEquiv.cyclicRep)) packages an automorphism of order dividing `m` as an object of `Rep ℤ C_m`. Its norm is identified with the ordered sum of powers. The rest of Milestone 4 will run through this object.

### Roadmap coverage

Milestone 2 and Milestone 4 are partial. In Milestone 2, only the first step is done: the period action with its uniform estimate. The complex structure on the quotient, the projection and its submersion charts, the fibre identification, the smooth trivialization and the marking are all still to come. In Milestone 4, the representation in `Rep ℤ C_m` is done, and so are the concrete descriptions of its odd- and even-degree cohomology, including the equality of the images of `A - 1` and `1 - A`. Still missing are the affine generator and its iterate formula, the order criteria, the fixed-point and freeness criterion, the period-two comparisons, the short exact sequence with its connecting map `δ`, and naturality. Milestones 1, 3, 5 and 6 are untouched.

## The frontier

- **Complex structure on the family quotient.** Feed the period action into the complex-manifolds quotient theorem. The goal is a complex manifold, with the orbit map a covering and local biholomorphism, followed by the projection to the base. This depends on the complex-manifolds roadmap's quotient theorem.
- **Fixed complex tori.** Milestone 1 has not started. It needs the quotient Lie-group structure, compactness, and the induced homomorphisms with their kernels. Much of it should follow from the family construction over a point, or in parallel with it.
- **Affine iterate and order criteria.** Define the affine generator `x ↦ A x + t` and the partial norms. Then prove the iterate formula, the norm-sum criterion for order dividing `m`, and the separate exact-order criterion. This is purely algebraic and unblocked.
- **Fixed points of every nonidentity power.** Prove the criterion that a power has a fixed point exactly when its partial norm lies in the range of `1 - A^k`, and hence freeness. Milestones 3 and 5 depend on this.
- **The integral connecting class.** Build the equivariant sequence `0 → Λ → E → T → 0`. Then compute `δ` as the class of the norm of a lift, prove vanishing for `E`, and conclude that `δ` is an isomorphism. The even-degree description above already gives the target quotient.
