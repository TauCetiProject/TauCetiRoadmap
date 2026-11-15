<!--tauceti-status:v1 {"roadmap":"RootSystemsPartII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the OrbitSumRealization of the orthogonal fold (2.2) and the fixed Weyl group isomorphism (2.3)","state":"partial"},{"id":"Layer 3","remaining":"the irreducible case theorem, even-A reversal, component cycles and general_fold","state":"untouched"},{"id":"Layer 4","remaining":"chamber and cone transport into the fold, invariant_step and ambient_coroot_step","state":"untouched"}],"readme_sha":"9870546aef6c4ad3d16fcb338af6c3c2968fde5e6c0a96fffe406127bccf6507","roadmap":"RootSystemsPartII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: RootSystemsPartII

This file documents the status of the RootSystemsPartII roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1, integral dominance and the ordinary Stembridge step, is done. Layer 2 has only its first section, the distinct root-orbit sums; the orthogonal fold and the fixed Weyl group are not built. Layers 3 and 4, the fold of every based diagram automorphism and the invariant orbit-sum step, have not begun.

### Named results

- **Stembridge's lemma** — between distinct dominant weights λ ≤ μ there is a positive root β with λ + β dominant and still below μ; only simple-coroot signs are used, so the endpoints need not be integral, the roots need not span, and the scalars may be any linearly ordered ring ([`RootPairing.stembridge_step`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Stembridge.html#RootPairing.stembridge_step)).
- **Nonvanishing of based orbit sums** — for an automorphism permuting the simple roots, the roots of one orbit are all positive or all negative, so their sum cannot cancel to zero ([`RootPairing.orbitSum_ne_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum_ne_zero)).
- **Full-period sums** — if σᵐ fixes a root index, summing the m iterates counts each root of the orbit m/d times, d the orbit size; this pins down the distinct-sum normalization the fold depends on ([`RootPairing.sum_range_root_pow_apply_eq_nsmul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.sum_range_root_pow_apply_eq_nsmul)).

### Notable definitions and infrastructure

- **Integral root dominance** ([`RootPairing.rootLE`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Dominance.html#RootPairing.rootLE)) — μ is above λ when μ − λ is a natural sum of simple roots, literally membership in the positive monoid. Its API covers order laws, translation, coordinatewise comparison, transport along based equivalences, the flipped (coweight) convention and the exact relation to the rational cone, which is what Layers 1 and 4 compare against.
- **Root orbits and orbit sums** ([`RootPairing.orbitSum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum)) — the sum of the distinct roots on a cycle of σ, fixed by σ, independent of the representative, positive for positive roots, and carried along intertwining equivalences. These are the candidate roots of every fold.
- **The folded index set** ([`RootPairing.foldedIndices`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.foldedIndices)) — the image of the orbit sums in the ambient space, so two orbits with the same sum give one folded root. It is the intended index type of the folded root pairing.

### Roadmap coverage

Layer 1 is done: §1.1's dominance API and §1.2's Stembridge step are both proved. Layer 2 is partial: §2.1 (orbit sets, orbit sums, periods, positivity, transport, the image set) is done, while §2.2's `OrbitSumRealization` with its folded Cartan entries and §2.3's fixed Weyl group isomorphism are absent from the library. Layers 3 and 4 are untouched: none of the case theorem, the even-A reversal, component cycles, `general_fold`, the chamber and cone transports, the invariant step or the ambient coroot step is present.

## The frontier

- **The orthogonal fold (§2.2)** — build `OrbitSumRealization` on the fixed subspace for simply-laced systems with orthogonal simple orbits, with roots exactly the folded indices, base the simple-orbit sums, and the stated norms and Cartan entries; it depends on ReductiveGroups §9A.1b's distinct-sum comparison.
- **The fixed Weyl group (§2.3)** — define the centralizer subgroup and prove restriction to the fixed space is an isomorphism onto the folded Weyl group; needs §2.2's block-reflection comparison.
- **The irreducible case theorem (§3.1)** — show a based automorphism of a non-simply-laced irreducible system is trivial, and that in the simply-laced case simple orbits are orthogonal except for the reversal of A₂ₙ. It uses only native classification inputs, so it could start now, independently of §2.2.
- **The general fold (§§3.2–3.4)** — the even-A reversal giving Bₙ, component cycles, and assembly of `general_fold` for every based automorphism; this needs §2.2 and §3.1.
- **The invariant step and its exports (Layer 4)** — chamber and cone transport into the fold, then the invariant Stembridge step and the ambient, torsion-bearing coroot step; it needs the general fold, with Layer 1 already in hand.
