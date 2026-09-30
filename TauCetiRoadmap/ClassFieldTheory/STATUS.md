<!--tauceti-status:v1 {"roadmap":"ClassFieldTheory","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"graded commutativity, full associativity and restriction compatibility, projection formula, Tate–Nakayama generalization","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"tateIso compatibility with restriction, corestriction, towers, conjugation and scaled inflation","state":"partial"},{"id":"Layer 4","remaining":"the four Artin–Tate diagrams, the character formula, uniqueness, and norm limitation","state":"partial"},{"id":"Layer 5","remaining":"invMap on the full Brauer group, brRes/brCor squares, H2(mu_n) = Z/n, localSymbol, local Tate duality","state":"partial"},{"id":"Layer 6","remaining":"the local class formation itself, localArtinEquiv, and the Frobenius normalization","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","state":"untouched"}],"readme_sha":"c7539775413fe42c462cefef2ffea4385853c0629cefd2a16dbfafa76084a134","roadmap":"ClassFieldTheory","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: ClassFieldTheory

This file documents the status of the ClassFieldTheory roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The abstract theory has reached its first summit. Tate's theorem is proved for class formations, and the abstract Artin map exists with its kernel and surjectivity. That theory still lacks its compatibility diagrams and norm limitation. On the local side, the Brauer group, Kummer theory and the unramified invariant are in place, but the local class formation is not. The absolute local theory, existence, the Weil group and everything global have not begun.

### Named results

- **Tate's theorem** — for a finite group, cup product with a suitable degree-two class is an isomorphism in every Tate degree ([`cup_bijective_of_forall_isPGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/TateTheorem.html#TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup)). The layer form, with its three hypotheses as explicit arguments, is [`tateTheorem`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.html#TauCeti.ClassFieldTheory.tateTheorem).
- **The Tate isomorphism of a class formation** — [`tateIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.html#TauCeti.ClassFieldTheory.ClassFormation.tateIso) gives `Ĥ^r(U/V, ℤ) ≃ Ĥ^{r+2}(U/V, A^V)` in all integer degrees, and its underlying map is cup product with the fundamental class.
- **Artin reciprocity for a finite normal layer** — [`artinEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.html#TauCeti.ClassFieldTheory.ClassFormation.artinEquiv) identifies `A^U / N(A^V)` with `(U/V)^ab` as the inverse of the degree −2 Nakayama map. The [Artin map](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.html#TauCeti.ClassFieldTheory.ClassFormation.artinMap) is surjective, and its [kernel is exactly the norm subgroup](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.html#TauCeti.ClassFieldTheory.ClassFormation.ker_artinMap).
- **The unramified local invariant** — on an unramified layer, [`unramifiedInv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Unramified.html#TauCeti.ClassFieldTheory.unramifiedInv) is normalized by arithmetic Frobenius so that [the class of `a` has invariant `v_K(a)/[L:K]`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Unramified.html#TauCeti.ClassFieldTheory.unramifiedInv_unramifiedClass). It is also [compatible with inflation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Unramified.html#TauCeti.ClassFieldTheory.unramifiedInv_map).
- **The Kummer isomorphism** — [`kummerEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/MuNRep.html#TauCeti.ClassFieldTheory.kummerEquiv) identifies `Fˣ/(Fˣ)ⁿ` with `H¹(G_F, μₙ)` for `n` invertible in `F`, and [in characteristic zero for every `n ≠ 0`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/MuNRep.html#TauCeti.ClassFieldTheory.kummerEquivOfCharZero).

### Notable definitions and infrastructure

- **Class formations** — [`ClassFormation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.html#TauCeti.ClassFieldTheory.ClassFormation) takes the invariant as data and derives the fundamental class. Tate's theorem and the Artin map are now stated over it, so the local and global formations will inherit reciprocity once they exist.
- **The Brauer group** — [`Br`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Basic.html#TauCeti.ClassFieldTheory.Br) is `H²(G_F, (Fˢ)ˣ)` on continuous cohomology, and [every class comes from a finite layer](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Formation.html#TauCeti.ClassFieldTheory.exists_brInfl_eq). This finite-layer description is what the local class formation needs.
- **The formation of units** — [`unitsFormation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Units.html#TauCeti.ClassFieldTheory.unitsFormation) is the module `(Kˢ)ˣ` over `G_K`, with [Hilbert 90 on every finite layer](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Units.html#TauCeti.ClassFieldTheory.subsingleton_h1_unitsFormation). It is the carrier the local class formation will be built on.

### Roadmap coverage

Layers 1 and 2 are done, now that the Tate restriction tower law is in the source.

- **Layer 0** is partial. The Tate cup product exists with a unit and naturality, and Tate's criterion is proved. Graded commutativity, associativity and restriction compatibility in all bidegrees, the projection formula and the Tate–Nakayama generalization remain.
- **Layer 3** is partial. `tateIso` is proved, but its compatibility with restriction, corestriction, towers, conjugation and scaled inflation is not.
- **Layer 4** is partial. The Nakayama map, Artin reciprocity, the kernel and surjectivity are proved. The four Artin–Tate diagrams, the character formula, uniqueness and norm limitation remain.
- **Layer 5** is partial. The Galois dictionary, Kummer theory, `Br F` and the unramified invariant are proved. The invariant on the full Brauer group, the `brRes`/`brCor` squares, `H²(μₙ) ≃ ℤ/n`, the local symbol and local duality remain.
- **Layer 6** is partial only in its ingredients. The units formation, Hilbert 90, solvability of local Galois groups, the solvable `H²` bound and the normal-basis lattice are proved, but the local class formation itself is not.
- **Layers 7–14** are untouched.

## The frontier

- **Norm limitation** — prove that a layer and its maximal abelian sublayer have the same norm subgroup. Artin reciprocity and the maximal abelian sublayer are both in place, so this is now a counting argument.
- **Artin–Tate diagrams and the character formula** — prove the four functoriality squares for `artinMap` and `χ(artinMap a) = inv(class(a) ∪ δχ)`. The [connecting class](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Character.html#TauCeti.ClassFieldTheory.NormalLayer.characterConnectingClass) `δχ` is already defined. The diagrams likely need the `tateIso` compatibilities of Layer 3 first.
- **The local invariant on the full Brauer group** — extend `unramifiedInv` from unramified layers to `invMap` on `Br K`, with the restriction and corestriction squares.
- **The local class formation** — assemble `unitsFormation`, Hilbert 90, the solvable `H²` bound and the invariant map into a `ClassFormation`. It is blocked on the full `invMap` and the cyclic Herbrand-quotient computation.
- **Remaining cup-product laws** — graded commutativity, the projection formula and the Tate–Nakayama tensor-product generalization.
