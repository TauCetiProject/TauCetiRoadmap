<!--tauceti-status:v1 {"roadmap":"RootSystemsPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the OrbitSumRealization of the orthogonal fold (2.2) and the fixed Weyl group isomorphism (2.3)","state":"partial"},{"id":"Layer 3","remaining":"the simply-laced half of the case theorem, the even-A reversal, component cycles and general_fold","state":"partial"},{"id":"Layer 4","remaining":"chamber and cone transport into the fold, invariant_step and ambient_coroot_step","state":"untouched"}],"readme_sha":"2c590b66415726cf3dc88893ab5418aac61a284199055d7f5968839f393b152f","roadmap":"RootSystemsPartII","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: RootSystemsPartII

This file documents the status of the RootSystemsPartII roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, integral dominance and the ordinary Stembridge step, is done. Layer 2 has only its first section, the distinct root-orbit sums. Layer 3 has the non-simply-laced half of its irreducible case theorem and nothing more. Layer 4, the invariant orbit-sum step, has not begun.

### Named results

- **Stembridge's lemma** — between distinct dominant weights λ ≤ μ there is a positive root β with λ + β dominant and still below μ. Only simple-coroot signs are used, so the endpoints need not be integral, the roots need not span, and the scalars may come from any linearly ordered ring ([`RootPairing.stembridge_step`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Stembridge.html#RootPairing.stembridge_step)).
- **Rigidity of non-simply-laced root systems** — a based automorphism of a finite irreducible reduced crystallographic root system with a multiple edge is the identity, over any characteristic-zero domain. This is the first statement of §3.1 ([`RootPairing.Base.eq_one_of_forall_mem_support_of_not_isSimplyLaced`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/DiagramPermutations/Rigidity.html#RootPairing.Base.eq_one_of_forall_mem_support_of_not_isSimplyLaced), with the index form [`RootPairing.Base.indexEquiv_eq_self_of_forall_mem_support_of_not_isSimplyLaced`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/DiagramPermutations/Rigidity.html#RootPairing.Base.indexEquiv_eq_self_of_forall_mem_support_of_not_isSimplyLaced)).
- **Trivial symmetry of the non-simply-laced diagrams** — the numbered diagrams Bₙ, Cₙ (every rank), F₄ and G₂ admit no nonidentity permutation preserving the oriented Cartan matrix; this is the classification input for the rigidity theorem ([`TauCeti.DynkinType.diagramSymmetry_eq_bot_of_not_isSimplyLaced`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/DiagramPermutations/NonSimplyLaced.html#TauCeti.DynkinType.diagramSymmetry_eq_bot_of_not_isSimplyLaced)).
- **Nonvanishing of based orbit sums** — when the automorphism permutes the simple roots, the roots of one orbit are all positive or all negative, so their sum is never zero ([`RootPairing.orbitSum_ne_zero`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum_ne_zero)).
- **Full-period sums** — if σᵐ fixes a root index, the m-term sum is m/d times the distinct orbit sum, d the orbit size. This fixes the normalization the fold depends on ([`RootPairing.sum_range_root_pow_apply_eq_nsmul`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.sum_range_root_pow_apply_eq_nsmul)).

### Notable definitions and infrastructure

- **Integral root dominance** ([`RootPairing.rootLE`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/Dominance.html#RootPairing.rootLE)) — μ lies above λ when μ − λ is a natural sum of simple roots. Its API covers the order laws, translation, transport along based equivalences, the coweight convention and the comparison with the rational cone, which Layer 4 will need.
- **Root orbits and orbit sums** ([`RootPairing.orbitSum`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum)) — the sum of the distinct roots on one cycle of σ. It is σ-fixed, independent of the representative, equal to the root for a fixed root, and carried along intertwining equivalences. These sums are the candidate roots of every fold.
- **The folded index set** ([`RootPairing.foldedIndices`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.foldedIndices)) — the finite image of the orbit sums, so that two orbits with the same sum give one folded root. It is the intended index type of the folded root pairing.

### Roadmap coverage

Layer 1 is done (§1.1's dominance API and §1.2's step). Layer 2 is partial: §2.1 is done, while §2.2's `OrbitSumRealization`, with its folded norms and Cartan entries, and §2.3's fixed Weyl group isomorphism are absent. Layer 3 is partial: §3.1's non-simply-laced statement is proved, though not under the README's name `indexEquiv_eq_self_of_multiple_edge`. Its simply-laced alternative `simpleOrbit_pairing_eq_zero_or_typeA_even` is missing, and so are the even-A reversal (§3.2), component cycles (§3.3) and `general_fold` (§3.4). Layer 4 is untouched.

## The frontier

- **The simply-laced case theorem (§3.1)** — prove that for a simply-laced irreducible system every simple orbit is orthogonal unless the system is A₂ₙ and τ reverses its numbering, and supply that numbering. The README's route uses the centre of the diagram tree and needs only classification inputs already in place.
- **The orthogonal fold (§2.2)** — build `OrbitSumRealization` on the fixed subspace for simply-laced systems with orthogonal simple orbits, with roots exactly the folded indices, base the simple-orbit sums, and the stated norms and Cartan entries. It depends on ReductiveGroups §9A.1b's distinct-sum comparison.
- **The fixed Weyl group (§2.3)** — define the subgroup of Weyl elements commuting with σ and prove that restriction to the fixed space is an isomorphism onto the folded Weyl group. It needs §2.2's block-reflection comparison, and nothing later uses it.
- **The general fold (§§3.2–3.4)** — the even-A reversal giving Bₙ, cycles of components, and the assembly of `general_fold` for every based automorphism. It needs §2.2 and all of §3.1.
- **The invariant step and its exports (Layer 4)** — transport chambers and cones into the fold, then prove the invariant Stembridge step and the ambient coroot step, including the version with torsion. It needs the general fold; Layer 1 is already in hand.
