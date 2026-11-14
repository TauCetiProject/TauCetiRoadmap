# Progress log: RootSystemsPartII

An append-only record of what landed on the RootSystemsPartII roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"4f3afa11404c87a1b62f829de4fc0918348465d5","prs":[36022,37457,38160],"roadmap":"RootSystemsPartII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## RootSystemsPartII: 2026-11-11 to 2026-11-13 (`4f3afa1` to `aa6e43e`)

The headline is [Stembridge's lemma](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Stembridge.html#RootPairing.stembridge_step): between two distinct dominant weights whose difference is a natural sum of simple roots, one can always climb by a single positive root and stay dominant and below the upper endpoint (TauCeti#37457). The proof is Waldspurger's maximal-root argument, and it uses only the signs of simple-coroot values, so the endpoints need not be integral, the roots need not span, and the statement holds over any linearly ordered ring rather than only the reals. The coweight version is meant to come from applying it to the flipped pairing; no separate statement was added.

It rests on [integral root dominance](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/Dominance.html#RootPairing.rootLE), the order in which μ lies above λ when μ − λ is a natural combination of simple roots. It now has the API the roadmap asks for: reflexivity, transitivity and antisymmetry, invariance under translation, coordinatewise comparison on integral coordinates, transport along based equivalences, and an exact account of how it relates to the coarser rational cone.

The first piece of diagram folding also landed. The [orbit sum](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum) of a root under an automorphism adds the distinct roots of its orbit once each. The sums are fixed by the automorphism, and when it permutes the simple roots they are [never zero](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.orbitSum_ne_zero), and lie in the positive monoid when the root is positive. Their image set, [the folded roots](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/OrbitSum.html#RootPairing.foldedIndices), is in place to index the folded root system, but that root system itself has not been built.
