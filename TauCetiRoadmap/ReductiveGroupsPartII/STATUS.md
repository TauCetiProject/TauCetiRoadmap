<!--tauceti-status:v1 {"roadmap":"ReductiveGroupsPartII","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer RG2.0","remaining":"smooth maps open on points, analytic charts and Haar Jacobians, Frobenius fixed points of Ĕ, scheme-level functoriality","state":"partial"},{"id":"Layer RG2.0a","remaining":"Deligne torus, integral Weil restriction, Edixhoven tame fixed points, descent of reductivity","state":"partial"},{"id":"Layer RG2.1","remaining":"valuations of root data, apartments, affine Weyl group, Kottwitz homomorphism; only the DR1-DR6 root datum exists","state":"partial"},{"id":"Layer RG2.2","state":"untouched"},{"id":"Layer RG2.3","state":"untouched"},{"id":"Layer RG2.4","state":"untouched"},{"id":"Layer RG2.5","state":"untouched"}],"readme_sha":"979341753c6b2de70937b75e9b50496273f8b604440045055d702932bf2e05b5","roadmap":"ReductiveGroupsPartII","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: ReductiveGroupsPartII

This file documents the status of the ReductiveGroupsPartII roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundational layers are well under way. For the topology on rational points (RG2.0), the affine theory, integral points and congruence subgroups are done, and so is the construction of `Ĕ`. The Weil restriction layer (RG2.0a) has its algebra and its group schemes, but not the Deligne torus. Of the Bruhat–Tits theory proper, only the abstract axioms of a root datum in a group exist. There are no valuations, buildings, parahorics, decompositions or dual groups yet.

### Named results

- **Indices of the congruence filtration** — for a formally smooth affine group of finite type over a complete discrete valuation ring with residue field of order `q`, each successive congruence quotient has `q^d` elements, where `d` is the rank of the cotangent module at the identity ([`natCard_quotient_congruenceSubgroup_pow_succ`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/CongruenceSubgroup/Quotient.html#TauCeti.HopfAlgebra.natCard_quotient_congruenceSubgroup_pow_succ)).
- **Congruence subgroups form a neighbourhood basis** — for a group of finite type, the congruence subgroups of a basis of ideals form a basis of neighbourhoods of the identity in the point topology ([`hasBasis_nhds_one_congruenceSubgroup`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/CongruenceSubgroup/Topology.html#TauCeti.HopfAlgebra.hasBasis_nhds_one_congruenceSubgroup)).
- **The first congruence subgroup is pro-`p`** — over an adic ring whose ideal of definition contains `p`, the congruence subgroup of that level is pro-`p` ([`isProP_congruenceSubgroup`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/CongruenceSubgroup/ProP.html#TauCeti.HopfAlgebra.isProP_congruenceSubgroup)). This is what makes `G(E)` locally pro-`p`.
- **Integral points are compact open** — for a finite-type algebra over the valuation ring of a local field, the integral points form an open subspace of the `E`-points ([`isOpenEmbedding_integralPoints`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/PointTopology/IntegralPoints.html#TauCeti.PointTopology.isOpenEmbedding_integralPoints)), and they are compact.
- **Weil restriction preserves smoothness** — restriction of scalars along a finite projective algebra carries smooth algebras to smooth algebras ([`instSmooth`](https://taucetiproject.org/docs/TauCeti/RingTheory/WeilRestriction/Smooth.html#TauCeti.Algebra.WeilRestriction.instSmooth)).

### Notable definitions and infrastructure

- **The topological group of points** — the [point topology](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/PointTopology/Basic.html#TauCeti.PointTopology.instTopologicalSpaceWithConv) on the points of a Hopf algebra makes them a [topological group](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/PointTopology/Group.html#TauCeti.PointTopology.isTopologicalGroup) with no Hausdorff hypothesis. Over a local field this group is Hausdorff, totally disconnected, locally compact and second countable. This is the ambient object for every later compact open subgroup.
- **The completed maximal unramified extension** — [`Breve E`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/Completion.html#TauCeti.MaxUnramifiedCompletion.Breve) with its continuous arithmetic [Frobenius](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Unramified/Completion.html#TauCeti.MaxUnramifiedCompletion.frobenius). It has a discrete valuation, and uniformizers of `E` stay uniformizers in it. This is the base field for RG2.1's quasi-split forms and for the Kottwitz map.
- **Weil restriction of group schemes** — the Hopf structure on the Weil restriction, its [functoriality in homomorphisms](https://taucetiproject.org/docs/TauCeti/Algebra/HopfAlgebra/WeilRestriction.html#TauCeti.Algebra.WeilRestriction.mapBialgHom), and its compatibility with the point topology through [`pointsHomeomorph`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/PointTopology/WeilRestriction.html#TauCeti.Algebra.WeilRestriction.pointsHomeomorph). Together these let groups like `Res GL_n`, norm tori and eventually the Deligne torus be handled as topological groups.

### Roadmap coverage

**RG2.0 is partial.** The following are done:
- the affine point topology, with its embedding, functoriality and localization results;
- the topological group of points and its separation properties;
- compact open integral points;
- the `GL_n` and `G_m` comparisons;
- the whole of RG2.0.3, the congruence subgroups;
- the construction of `Ĕ` with its Frobenius.

For schemes, only the gluing and open charts exist; their functoriality does not. Four milestones are missing: smooth morphisms being open, the analytic charts and Haar Jacobians in both characteristics, the Frobenius fixed points `Ĕ^σ = E`, and `G(E) = G(Ĕ)^σ`.

**RG2.0a is partial.** The following are done:
- the representing algebra and the point adjunction;
- base change, composition and tensor products;
- Hopf structure and points;
- smoothness and étaleness;
- the separable splitting;
- norm-one tori;
- the topology on points.

Five milestones are missing: the Deligne torus, Edixhoven's tame fixed-point theorem, integral Weil restriction, the descent of reductivity, and the dimension comparison.

**RG2.1 is partial.** Only the Bruhat–Tits axioms (DR1)–(DR6) of a root datum in a group exist. None of the rest of RG2.1 is there: valuations, apartments, `π₁` and the Kottwitz map.

**RG2.2–RG2.5 are untouched.**

## The frontier

- **Frobenius fixed points of `Ĕ`** — prove `Ĕ^σ = E`, the Frobenius congruence `σ(x) ≡ x^q`, and the algebraic closedness of the residue field. Then deduce `X(E) = X(Ĕ)^σ` on points, which needs nothing beyond the existing point-topology functoriality.
- **The Deligne torus** — `S = Res_{ℂ/ℝ} G_m` with its weight and norm conventions. The Weil restriction, norm-torus and point-topology inputs are all in place.
- **Remaining Weil restriction targets** — integral Weil restriction, the descent of reductivity along finite separable extensions, and Edixhoven's tame fixed-point theorem.
- **Smooth morphisms are open on local points, and analytic charts** — these feed RG2.4's unimodularity and adjoint-modulus results. Positive characteristic additionally waits on MassFormula Layer 2.
- **Valued root data** — put valuations on the existing Bruhat–Tits root datum and build the apartment. This opens RG2.1.3–RG2.1.4 and, after them, the building of RG2.2.
