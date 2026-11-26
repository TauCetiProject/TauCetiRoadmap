<!--tauceti-status:v1 {"roadmap":"ModularCharactersAndBlocksPartII","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9","ts":"2026-11-25T18:48:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the fixed-class lemma for coprime actions (section 1.2), via conjugacy of coprime complements","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"2fad79232f241d4daa9ffd631787ef83bed0b90ee31227ec6a32e6594dfb5cbf","roadmap":"ModularCharactersAndBlocksPartII","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9"}-->
# Status: ModularCharactersAndBlocksPartII

This file documents the status of the ModularCharactersAndBlocksPartII roadmap up until `7433fc3` (2026-11-25T18:48:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The character-theoretic groundwork of the coprime-action strand is in place: the canonical extension, its values, Gallagher's correspondence and the degree bounds over a normal subgroup (Layer 2) are proved, and Layer 1 lacks only the fixed-class lemma. The cyclic and solvable cases, the Glauberman correspondence itself, and the whole block-theory strand (Layers 3–9) have not begun.

### Named results

- **Glauberman's canonical extension** — for a finite group `S` acting on `Γ` with coprime orders, each `S`-invariant irreducible character of `Γ` has exactly one irreducible extension to `Γ ⋊ S` afforded by a representation of determinant `1` on `S`; it restricts correctly to subgroups of `S` and commutes with isomorphisms and Galois conjugation ([existsUnique_canonicalExtension](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Glauberman/CanonicalExtension/Basic.html#TauCeti.existsUnique_canonicalExtension)).
- **Values of the canonical extension** — it has the same field of values as the character it extends, and it takes rational-integer values on `S` (Glauberman's Theorem 2 (b)); the input is that cyclotomic fields of coprime orders meet in `ℚ` ([canonicalExtension_values](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Glauberman/CanonicalExtension/Values.html#TauCeti.canonicalExtension_values)).
- **Gallagher's correspondence** — if an irreducible character of `G` restricts to `θ` on a normal subgroup `N`, multiplying it by the irreducible characters of `G/N` is a bijection onto the irreducible characters of `G` over `θ` ([gallagher_bijOn](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Gallagher.html#TauCeti.gallagher_bijOn)).
- **Brauer's permutation lemma** — an automorphism of a finite group fixes as many irreducible characters as conjugacy classes, so a cyclic group of automorphisms has as many invariant characters as invariant classes ([natCard_fixedBy_irreducibleCharacters_eq_natCard_fixedBy_conjClasses](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Automorphism.html#TauCeti.natCard_fixedBy_irreducibleCharacters_eq_natCard_fixedBy_conjClasses)).
- **Degrees over a normal subgroup** — for an irreducible constituent `θ` of the restriction of `χ` to `N ⊴ G`, `θ(1)` divides `χ(1)` and the ratio divides `|G : N|`. The proof goes through Schur's theorem that an irreducible projective representation has dimension dividing the group order ([exists_finrank_eq_mul_dvd_index_of_liesOver](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Induction/Clifford/DegreeRatio.html#FDRep.exists_finrank_eq_mul_dvd_index_of_liesOver), [finrank_dvd_card](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/ProjectiveRepresentation/Degree.html#TauCeti.IsProjectiveRep.finrank_dvd_card)).

### Notable definitions and infrastructure

- **Invariant irreducible characters** `Irr_S(Γ)`, the objects the Glauberman correspondence acts on. They are characterised as the characters whose inertia group in `Γ ⋊ S` is everything, which is what connects them to Clifford theory ([invariantIrreducibleCharacters](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Glauberman/Invariant.html#TauCeti.invariantIrreducibleCharacters)).
- **Gallagher's normalised extension**, proved over any field with no finiteness of `Γ`. It is the representation-level engine behind the canonical extension, and its uniqueness is what makes later restriction and Galois arguments one-liners ([existsUnique_semidirectProduct_extension_det_eq_one](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Glauberman/NormalizedExtension.html#Representation.existsUnique_semidirectProduct_extension_det_eq_one)).
- **A certified character table of `SL(2,3)`**, computed by the Dixon–Schneider algorithm, together with the character table of `Q₈`. These are the roadmap's running examples, ready for checking the cyclic correspondence and its sign ([isCharacterTableSpec_specialLinearTwoThree](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Dixon/Cyclotomic/SpecialLinearTwoThree.html#TauCeti.isCharacterTableSpec_specialLinearTwoThree)).

### Roadmap coverage

Layer 2 is done: the normalised extension (§2.1), the canonical extension with its restriction, transport and Galois laws (§2.2), its values (§2.3), Gallagher's correspondence (§2.4) and all three degree statements of §2.5. Layer 1 is partial: the invariant characters and their inertia characterisation (§1.1) and Brauer's permutation lemma with its corollaries (§1.3) are proved, but the fixed-class lemma for coprime actions (§1.2) is not in the library. Layers 3–5 (the cyclic case, the solvable case and the Glauberman correspondence, degree relations) are untouched. The block strand, Layers 6–9 (heights and Brauer's height theorem, Fong–Reynolds, blocks with a normal defect group and Reynolds' theorem, the two conjecture predicates), is untouched.

## The frontier

- **Fixed classes under a coprime action (§1.2)** — Glauberman's lemma that the `S`-fixed points of a compatible transitive action form one `C_Γ(S)`-orbit, giving the bijection between classes of `C` and `S`-invariant classes of `Γ`. It rests on the conjugacy of coprime complements from InverseGaloisAndArithmeticFundamentalGroups.
- **Cosets of a cyclic acting group (§3.1)** — conjugacy of `a g` into `a C` and the centraliser of `a t`; it needs the same conjugacy of complements.
- **The cyclic correspondence and its sign (§3.2)** — the sign `ε(χ)` and `χ*` with `χ̂(a t) = ε χ*(t)`, and bijectivity. The values, Gallagher's correspondence and Brauer's permutation lemma are ready; it waits on §§1.2 and 3.1.
- **Block characters and Brauer's theorem on heights (§§6.1–6.2)** — the first block-theory target, with nothing yet: the ordinary characters of a block, central characters over the `p`-modular system, Osima's formula and defect classes.
- **The Glauberman correspondence (§§4.1–4.5)** — the composition-series construction, the `p`-group characterisation, and existence and uniqueness of the compatible family; it comes after the cyclic case.
