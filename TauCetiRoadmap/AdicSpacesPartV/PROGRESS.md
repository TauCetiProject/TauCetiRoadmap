# Progress log: AdicSpacesPartV

An append-only record of what landed on the AdicSpacesPartV roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"8c1c22af2800c071f38d1dc4229a987a279acb73","prs":[43138,"forgejo:https://git.taucetiproject.org/taucetiproject/tauceti@1#301"],"roadmap":"AdicSpacesPartV","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## AdicSpacesPartV: 2026-11-18 to 2026-11-19 (`8c1c22a` to `b235000`)

The first result for this roadmap is faithfully flat descent of regularity (Stacks, Tag 07NT): if A → C is a regular ring map and C is faithfully flat over an intermediate B, then A → B is regular ([`RegularAlgebraMap.of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/RegularAlgebraMap/Basic.html#TauCeti.Excellence.RegularAlgebraMap.of_faithfullyFlat)). This is *regular-map-faithfully-flat-descent*, one of the three regularity lemmas that open §0.5. Its docstring records why faithful flatness cannot be weakened to flatness, using the punctured cusp. The proof rests on two companion descent statements: regularity of S ⊗ B from regularity of S ⊗ C ([`IsRegularRing.tensorProduct_of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/Descent.html#TauCeti.IsRegularRing.tensorProduct_of_faithfullyFlat)), and geometric regularity over a field ([`GeometricallyRegular.of_faithfullyFlat`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/GeometricallyRegular.html#TauCeti.Excellence.GeometricallyRegular.of_faithfullyFlat), TauCeti#43138).

The other two §0.5 lemmas have not landed: ascent of regularity along a flat local map whose closed fibre is regular but not a field, and locality of regular maps at maximal ideals. Nothing has landed yet on regularity of affinoid localizations, which is what these lemmas are for. No rigid-geometric construction from the roadmap has begun.
