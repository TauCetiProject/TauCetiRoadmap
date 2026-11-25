<!--tauceti-status:v1 {"roadmap":"NashBlowups","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c","ts":"2026-11-25T06:54:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Grassmannians along a surjection (0.4); normality for arbitrary separable extensions (0.6); glueing and backward stalk criterion (0.7)","state":"partial"},{"id":"Layer 1","remaining":"the Nash modification of a sheaf and its universal property, Plücker form, locality and base change (1.2-1.5)","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"the Lie derivative (4.2), the differential criterion (4.4) and Nobile's theorem (4.5)","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"027a4dc5613bab62138e2aba8239018d530f1398adc7bb3795aa71e19652734b","roadmap":"NashBlowups","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c"}-->
# Status: NashBlowups

This file documents the status of the NashBlowups roadmap up until `0253c4f` (2026-11-25T06:54:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Most of the Layer 0 preliminaries are proved, along with the setting lemma of Layer 1 and the first and third steps of the characteristic-zero smoothness criterion in Layer 4. Nothing that mentions the Nash blowup itself exists yet. Layers 2, 3, 5, 6 and 7 are untouched.

### Named results

- **Smoothness at closed points over a perfect field** — a scheme locally of finite type over a perfect field is smooth exactly when its local rings at closed points are regular; this is the last step of both smoothness criteria ([`smooth_iff_isRegularLocalRing_closedPoints`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Scheme/Regular/Locus.html#AlgebraicGeometry.Scheme.Hom.smooth_iff_isRegularLocalRing_closedPoints)).
- **Dense smooth locus and geometric reducedness** — a reduced scheme over a field has dense smooth locus if and only if it is geometrically reduced, the first part of the roadmap's setting lemma ([`dense_smoothLocus_iff_geometricallyReduced`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/Smooth/Locus/Dense.html#AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_iff_geometricallyReduced)).
- **Coordinates from a free quotient of the differentials** — a surjection from the differentials of a local algebra onto a free module of rank d yields elements x_j and dual derivations, with the span of the dx_j complementary to the kernel ([`exists_coordinates_of_kaehler_surjection`](https://taucetiproject.org/docs/TauCeti/RingTheory/Kaehler/Coordinates.html#KaehlerDifferential.exists_coordinates_of_kaehler_surjection)).
- **Minimal primes over a stable ideal are stable** — for a derivation preserving an ideal, every minimal prime over it of residual characteristic zero is preserved too; no Noetherian hypothesis is needed ([`Derivation.apply_mem_of_mem_minimalPrimes`](https://taucetiproject.org/docs/TauCeti/RingTheory/Derivation/MinimalPrime.html#Derivation.apply_mem_of_mem_minimalPrimes)).
- **Normality under separable base change** — a normal scheme stays normal after base change along a finitely generated, separably generated field extension ([`isNormalScheme_pullback_of_isSeparablyGenerated`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Scheme/Normal.html#TauCeti.AlgebraicGeometry.isNormalScheme_pullback_of_isSeparablyGenerated)).

### Notable definitions and infrastructure

- **The smooth locus of dimension d** ([`smoothLocusOfDim`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/Smooth/Locus/OfDim.html#TauCeti.AlgebraicGeometry.smoothLocusOfDim)) is the open set where the Nash blowup will be an isomorphism. Its rank of differentials equals the local dimension, so for a scheme pure of dimension d it is the whole smooth locus.
- **Locally free quotients of the differentials** ([`HasLocallyFreeQuotientOfDifferentials`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Modules/Differentials/LocallyFreeQuotient.html#TauCeti.AlgebraicGeometry.HasLocallyFreeQuotientOfDifferentials)) is the shared hypothesis of the triviality criterion and of both smoothness criteria. It already has restriction to opens, the smooth case, the empty scheme and the forward stalk criterion.
- **Uniqueness of locally free quotients** on a reduced scheme ([`existsUnique_iso_comp_eq`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/VectorBundle/Reduced.html#TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.existsUnique_iso_comp_eq)): two quotients that are isomorphisms on a dense set agree. Both the uniqueness bullet of §0.7 and the universal property of §1.3 use this argument.

### Roadmap coverage

Layer 0 is partial. The comparison map of differentials and its base-change isomorphism (§§0.1–0.2) were already in the library, and this window added surjectivity for closed immersions. The smooth locus of dimension d (§0.3) and the closed-point test (§0.5) are done. §0.7 has the predicate and most of its API, but not the glueing bullet or the backward stalk criterion. §0.6 has only the finitely generated, separably generated case, without directed colimits or geometric normality. §0.4, Grassmannians along a surjection, is untouched. Layer 1 is partial: the setting lemma §1.1 is proved in its parts, but the Nash modification of a sheaf (§§1.2–1.5) is not begun. Layer 4 is partial, with §§4.1 and 4.3 done and the Lie derivative (§4.2), the differential criterion (§4.4) and Nobile's theorem (§4.5) open. Layers 2, 3, 5, 6 and 7 are untouched.

## The frontier

- **The Lie derivative and stable annihilators (§4.2)** — define the Lie derivative on Kähler differentials and show that annihilators of stable quotients are derivation-stable. With §§4.1 and 4.3 it is the remaining algebraic input to §4.4.
- **The differential smoothness criterion in characteristic zero (§4.4)** — stated in `Suggested.lean`. Its route uses only the forward stalk criterion, §1.1, §0.3 and §0.5, all available, together with §4.2.
- **The Nash modification of a sheaf (§1.2)** — blocked on its supplier. The relative Grassmannian of a quasi-coherent sheaf is glued in the library, but its universal quotient and its universal property over arbitrary schemes are not. Without them §0.4, every construction of Layers 1–3 and the Nash-blowup forms of Layers 4–7 cannot be stated.
- **Normality along arbitrary separable extensions (§0.6)** — what remains is the normality of directed colimits of normal rings, geometric normality, and the extension from finitely generated to arbitrary separable field extensions that §6.3 needs.
- **The rest of §0.7** — the glueing bullet and the backward direction of the stalk criterion.
