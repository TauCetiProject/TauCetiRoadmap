<!--tauceti-status:v1 {"roadmap":"CrystallineCohomology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer CR.1","remaining":"PD schemes and the crystalline sites, on the PD foundations of DerivedDeRhamCohomology","state":"untouched"},{"id":"Layer CR.2","state":"untouched"},{"id":"Layer CR.3","state":"untouched"},{"id":"Layer CR.4","remaining":"rest of CR.4.1 (cohomology of E_p, colimits, saturation functor, Cartier criterion), then CR.4.2 onward","state":"partial"},{"id":"Layer CR.5","remaining":"prelog rings and log structures, independent of the crystalline layers","state":"untouched"},{"id":"Layer CR.6","state":"untouched"},{"id":"Layer CR.7","state":"untouched"}],"readme_sha":"d00c235982acdf96de26f9d40e9384be7ffa54cb40499f5d7c0229867407ada3","roadmap":"CrystallineCohomology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: CrystallineCohomology

This file documents the status of the CrystallineCohomology roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening of the de Rham–Witt layer exists: Dieudonné complexes, the normalized décalage, saturation and the Verschiebung, which is most of the first section of CR.4. Crystalline sites, the Poincaré lemma, log structures, Hyodo–Kato theory and coefficients have not begun, and none of the roadmap's end theorems is yet in reach.

### Named results

- **The saturation criterion** — a Dieudonné complex with p-torsion-free terms is saturated exactly when its Frobenius, viewed as a cochain map into the normalized décalage, is an isomorphism ([`isSaturated_iff_isIso_toNormalizedDecalage`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.isSaturated_iff_isIso_toNormalizedDecalage)).
- **The Verschiebung identities** — on a saturated complex the Verschiebung, characterised by F(Vx) = px, satisfies FV = VF = p, FdV = d and Vd = p·dV, and morphisms of saturated complexes commute with it ([`IsSaturated.V`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.IsSaturated.V), [`V_d_apply`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.IsSaturated.V_d_apply)).
- **Iterated Frobenius divisibility** — on a saturated complex, x lies in the image of Fʳ exactly when dx is divisible by pʳ, so every cocycle lies in the image of every power of Frobenius ([`mem_range_F_iterate_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Saturated.html#TauCeti.DieudonneComplex.IsSaturated.mem_range_F_iterate_iff)).
- **Frobenius as a map to the décalage** — on a torsion-free complex, a Dieudonné structure is the same data as a cochain map into the décalage, by two mutually inverse constructions that are natural in morphisms ([`ofNormalizedDecalage`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Basic.html#TauCeti.DieudonneComplex.ofNormalizedDecalage)).

### Notable definitions and infrastructure

- **The normalized décalage** E_p(M), made of the elements whose differential is divisible by p and given the differential d/p, functorial in cochain maps ([`normalizedDecalage`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/CochainComplex/NormalizedDecalage.html#CochainComplex.normalizedDecalage)). It is the operation whose fixed points the later strict-completion theory describes.
- **Dieudonné complexes** form a category with a faithful forgetful functor to cochain complexes that reflects isomorphisms ([`DieudonneComplex`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/DieudonneComplex/Basic.html#TauCeti.DieudonneComplex)). They are graded by all integers, so negative degrees are included from the start, as the roadmap asks.

### Roadmap coverage

CR.4 is partial. Within CR.4.1, the décalage's definition and functoriality, Dieudonné complexes and their morphisms, saturation and the Verschiebung identities are proved. Still missing from CR.4.1 are the cohomology computation Hⁿ(E_pM) = Hⁿ(M)/Hⁿ(M)[p], commutation with filtered colimits, the presentation as η_p inside M[1/p], the Bockstein and derived décalage, the saturation functor and the Cartier criterion. CR.4.2 through CR.4.8 have not begun. CR.1, CR.2, CR.3, CR.5 (including the log-algebra layer), CR.6 and CR.7 are untouched, as are CR.3:Frobenius-isogeny, CR.3:duality and the CR.DDR sections.

## The frontier

- **Cohomology of the décalage** — prove Hⁿ(E_pM) ≅ Hⁿ(M)/Hⁿ(M)[p] naturally, and that E_p commutes with filtered colimits. Both are elementary given the existing API.
- **Saturation and the Cartier criterion** — construct Sat(M) by iterated décalage and prove the Cartier criterion that closes CR.4.1. The Bockstein and derived-décalage statements come first.
- **The Verschiebung filtration and W_r(M)** — CR.4.2 can start now that saturated complexes and the Verschiebung identities are in place. Strict completion (CR.4.3) follows from it.
- **The Dieudonné–Manin decomposition** — the roadmap's own target file states it on Mathlib's isocrystals over an algebraically closed field, independent of everything above. It is an isolated headline open to anyone.
- **Prelog rings and log structures** — CR.5:log-algebra is independent of the crystalline layers and can be built in parallel. Its first item uses the prelog category promised by DerivedDeRhamCohomology §6.20, and CR.1 likewise waits on that roadmap's PD foundations.
