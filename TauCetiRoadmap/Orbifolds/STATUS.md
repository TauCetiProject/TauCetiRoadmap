<!--tauceti-status:v1 {"roadmap":"Orbifolds","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
# Status: Orbifolds

This file documents the status of the Orbifolds roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The local layer O2 now has its central theorems on proper étale groupoids: retained-arrow linear charts, effective reduction with the coarse space unchanged, and the cutoff contraction. The classifying model (O4-N) and its topology (O4-T) have their foundations, and O1 has topological carriers in unbundled form. Atlases (O2.2), triangulations (O3), orbibundles, duality and Thom classes have not begun.

### Named results

- **The retained-arrow linear chart**: near any object of a Hausdorff proper étale groupoid, the groupoid is the action groupoid of its full finite isotropy group acting linearly on an invariant ball, through a fully faithful chart that keeps every arrow ([`exists_linear_ball_isotropy_chart`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Etale/Linearization.html#TauCeti.exists_linear_ball_isotropy_chart)).
- **Effective reduction keeps the coarse space**: dividing an étale groupoid by the germ relation induces a homeomorphism of coarse spaces ([`isomorphismClassesHomeomorph`](https://taucetiproject.org/docs/TauCeti/Topology/CategoryTheory/Groupoid/Effective.html#TauCeti.EffectiveQuotient.isomorphismClassesHomeomorph)). The new isotropy is the old one divided by the ineffective kernel ([`quotientIneffectiveKernelMulEquivAut`](https://taucetiproject.org/docs/TauCeti/Topology/CategoryTheory/Groupoid/Effective.html#TauCeti.quotientIneffectiveKernelMulEquivAut)), and that kernel is finite under properness.
- **The cutoff contraction of a nerve**: for a cutoff function, the identity on nerve cochains is homotopic to cutoff averaging onto arrow-invariant functions in degree zero ([`cutoffHomotopy`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Nerve/Cutoff.html#TauCeti.nerveCochainComplex.cutoffHomotopy)). Smooth cutoffs exist on proper étale groupoids ([`exists_isCutoff_contMDiff`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Groupoid/Cutoff.html#TauCeti.Quiver.exists_isCutoff_contMDiff)).
- **The open-restriction equality**: over a saturated open subset of the coarse space, the fat classifying space is homeomorphic to that of the full restricted groupoid ([`fatClassifyingSpaceRestrictionHomeomorph`](https://taucetiproject.org/docs/TauCeti/Topology/CategoryTheory/CoarseSpace/Restrict.html#CategoryTheory.ObjectProperty.fatClassifyingSpaceRestrictionHomeomorph)).
- **The identity principle for finite-order actions**: an element of finite order acting by a `C¹` map that is the identity near one point of a connected manifold is the identity everywhere ([`germKernel_eq_ker`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/GroupAction/GermKernel.html#TauCeti.germKernel_eq_ker)).

### Notable definitions and infrastructure

- **The fat classifying space** ([`fatClassifyingSpace`](https://taucetiproject.org/docs/TauCeti/Topology/CategoryTheory/Nerve.html#TauCeti.fatClassifyingSpace)): the fat realization of the topological nerve, with its coarse map to the orbit space. It is O4-N's primary model. A contractible finite-action chart already has the classifying space of its group.
- **Invariant forms** ([`invariantForms`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Category/InvariantForm.html#TauCeti.Quiver.invariantForms)): forms on objects with `s*ω = t*ω`, closed under the exterior derivative and wedge products, and pulled back along smooth functors. For free actions they are forms on the quotient. This is the carrier for O4.2 and O4-R.
- **The manifold diffeology** ([`manifoldDiffeology`](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeology/Manifold.html#TauCeti.manifoldDiffeology)): its D-topology is the manifold topology. Together with subspace diffeologies and inductions, it gives the coarse diffeology of a proper étale groupoid local finite-quotient charts.

### Roadmap coverage

O2.1 is done in substance, with properness and étaleness as hypotheses. O2.3 is done except for the face-kernel equality on O1.6 faces (only its linear-chart lemma exists) and the trivial-gerbe example. O2.4 has the finite and cutoff contractions, smooth cutoffs, invariant partitions of unity and metric averaging, but no connection averaging. O2.6 has the manifold and quotient diffeologies and local quotient charts, but no gluing, Morita independence or comparison with Eltschig's development. O2.5 has only the injectivity of tangent representations for effective actions. In O1, three items are partial. For O1.1, topological groupoids are closed under restriction and products, and the action groupoid has its arrow topology and smooth structure, but there is no bundled proper étale class. For O1.2, refinements induce coarse homeomorphisms and coarse spaces are Hausdorff and paracompact, but there are no bibundles. For O1.3 and O1.5, comma categories and categories of elements are proper étale topological groupoids. O1.6 has only corner domains and faces as closed invariant sets, with closed restriction of classifying spaces. In O4, three parts are partial: O4-N (fat model, coarse map, open restriction), O4-T (clopen latching, colimit paracompactness) and O4.2 (invariant forms without Morita descent or supports). O4-R and O4-S have only the invariant Poincaré lemma and the Alexander–Whitney map. O5 has only the chart-level isotropy-index formula. O1.4, O2.2, O3, O4.1, O4-K, O4-W, O6 and O7 are untouched.

## The frontier

- **The retained-arrow atlas (O2.2)**: the local charts exist, so what remains is atlas data with overlap-arrow torsors, the presenting groupoid, and its Morita comparison with the original presentation.
- **Paracompact classifying spaces (O4-T)**: combine the clopen latching loci with the colimit paracompactness lemma, which needs the skeletal pushout description of the fat realization. Then come local contractibility and the thin and diagonal comparisons.
- **Proper étale presentations and generalized maps (O1.1–O1.2)**: bundle the hypotheses into one class closed under smooth equivalences, then add principal bibundles and the theorem that Morita equivalences induce coarse homeomorphisms.
- **The collared corner carrier (O1.6)**: build collars, quadrant charts and NDR data on the existing corner domains. The O2.3 face-kernel equality can then be transferred from its chart lemma.
- **Gluing the coarse diffeology (O2.6)**: glue the local quotient charts, then prove Morita independence and functoriality.
