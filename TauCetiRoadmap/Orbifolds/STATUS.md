<!--tauceti-status:v1 {"roadmap":"Orbifolds","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: Orbifolds

This file documents the status of the Orbifolds roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The local theory of a finite group acting smoothly on a manifold is now largely in place: Bochner linearization to an invariant ball, the germ kernel and the dense principal part, plus the finite-group cochain contraction and quotient diffeologies. None of it is yet stated on a proper étale presentation, because that carrier has not been defined. Orbifold charts, atlases, orbibundles, triangulations and weighted integration have not begun.

### Named results

- **Finite Bochner linearization on a manifold**: a finite group fixing a point by maps that are `C¹` there acts linearly in a chart, through its derivative representation. The chart can be taken with an invariant ball as target and connected domain, and the representation detects exactly the elements acting trivially near the point ([`exists_equivariant_chart_target_eq_sumOfConjugatesInnerSublevel_of_contMDiffAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/GroupAction/GermKernel.html#TauCeti.exists_equivariant_chart_target_eq_sumOfConjugatesInnerSublevel_of_contMDiffAt)).
- **The identity principle for finite-order actions**: an element of finite order acting by a `C¹` map that is the identity near one point of a connected manifold is the identity everywhere ([`germKernel_eq_ker`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/GroupAction/GermKernel.html#TauCeti.germKernel_eq_ker)). So the ineffective kernel is locally constant and normal.
- **The principal part of a finite smooth action**: for a finite group acting by `C¹` maps on a connected manifold, the points whose stabilizer is the kernel of the action are dense ([`dense_setOf_stabilizer_eq_ker_of_contMDiff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/GroupAction/GermKernel.html#TauCeti.dense_setOf_stabilizer_eq_ker_of_contMDiff)). This extends the earlier linear generic-stabilizer theorem ([`dense_setOf_stabilizer_eq_ker`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupAction/GenericStabilizer.html#TauCeti.dense_setOf_stabilizer_eq_ker)).
- **The averaging contraction of finite-group cochains**: when the group order is invertible, the identity on inhomogeneous cochains is homotopic to averaging onto invariants in degree zero ([`averagingHomotopy`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/GroupCohomology/Averaging.html#TauCeti.groupCohomology.averagingHomotopy)). So every positive-degree cocycle has an explicit primitive.
- **Isotropy as automorphisms in the action groupoid**: stabilizers are automorphism groups, with labels that act trivially retained ([`stabilizerMulEquivAut`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Groupoid/ActionCategory.html#CategoryTheory.ActionCategory.stabilizerMulEquivAut)), and `[*/G]` is not equivalent to a point for nontrivial `G` ([`isEmpty_equivalence_punit`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Groupoid/ActionCategory.html#CategoryTheory.ActionCategory.isEmpty_equivalence_punit)).

### Notable definitions and infrastructure

- **The germ kernel** ([`germKernel`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupAction/GermKernel.html#TauCeti.MulAction.germKernel)), the subgroup acting as the identity near a point. It is the roadmap's ineffective kernel in the group-action setting, and it is what the effective reduction of O2.3 will quotient by.
- **The quotient diffeology** ([`instDiffeologicalSpaceQuotient`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Quotient.html#TauCeti.Diffeology.instDiffeologicalSpaceQuotient)) with subductions. Its plots are the maps that lift locally, and its D-topology is the quotient topology. These are the local laws for gluing coarse diffeologies.
- **Normality and Lindelöfness under attaching** ([`normalSpace_of_isPushout`](https://taucetiproject.org/docs/TauCeti/Topology/Category/TopCat/Normal.html#TauCeti.TopCat.normalSpace_of_isPushout), [`normalSpace_of_isColimit`](https://taucetiproject.org/docs/TauCeti/Topology/Category/TopCat/Normal.html#TauCeti.TopCat.normalSpace_of_isColimit)). Normality, `T1` and the Lindelöf property survive closed attachments and sequential colimits along closed embeddings. These are the first steps of O4-T's proof that nerve realizations are paracompact.

### Roadmap coverage

O1.1 is partial: the algebraic action-groupoid dictionary exists, but there is no Hausdorff proper étale subcategory or arrow-space topology. O1.2–O1.6 are untouched. O2.1 and O2.3 now have their full analytic content for a finite group acting on a manifold: the Bochner chart with an invariant ball, the kernel detected by derivatives, the germ kernel and its local constancy, and the dense principal part. The groupoid isomorphism `Γ|U ≅ Γ_x⋉U`, the effective quotient presentation and the face-kernel statement are all missing. O2.4 is partial, with the finite-group cochain contraction but no invariant partitions, connection averaging or proper-groupoid cutoff. O2.6 has only the generic quotient-diffeology laws. O2.2 and O2.5 are untouched. Within O4-T, only the normal/`T1`/Lindelöf pushout and colimit lemmas exist. O3, O5–O7 and the rest of O4 are untouched.

## The frontier

- **The proper étale subcategory (O1.1)**: define Hausdorff proper étale presentations on LGP's groupoid carrier, with the action groupoid's arrow topology and structure-map formulas. Every chart-level theorem above waits on this, as does LGP G0's carrier.
- **The retained-arrow local chart (O2.1)**: the analysis is done, so what remains is the groupoid statement, finiteness of `Γ_x` from properness and étaleness, local bisections, and the isomorphism `Γ|U ≅ Γ_x⋉U`. It needs O1.1.
- **Effective reduction (O2.3)**: transfer the germ-kernel results into charts, build the effective quotient presentation, prove its coarse space is unchanged, and prove the face-kernel equality on O1.6 faces.
- **Paracompact realizations (O4-T)**: with the normal, `T1` and Lindelöf lemmas in place, the next steps are the regular-Lindelöf paracompactness argument and the clopen latching inclusions for étale nerves. The nerves themselves need O1.1.
- **The coarse diffeology (O2.6)**: the manifold diffeology with D-topology equal to the manifold topology, then gluing chart quotients and Morita independence.
