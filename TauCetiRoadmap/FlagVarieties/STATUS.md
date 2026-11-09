<!--tauceti-status:v1 {"roadmap":"FlagVarieties","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"rational points of G/H as cosets (0.2) and the orbit-to-quotient isomorphism for homogeneous varieties (0.3)","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"standard parabolics P_J and their order classification; blocked on ReductiveGroups 7/7b","state":"untouched"},{"id":"Layer 3","remaining":"conjugacy to a unique P_J and pointwise self-normalization","state":"untouched"},{"id":"Layer 4","remaining":"G/H projective iff H parabolic, and classification of projective homogeneous G-varieties","state":"untouched"},{"id":"Layer 5","remaining":"base-point evaluation criterion (5.1) and classification of equivariant maps G/P_J to G/P_K (5.2); only sheaf-level projections exist","state":"partial"},{"id":"Layer 6","remaining":"torus, SL2, GL_n and GL3 model comparisons","state":"untouched"}],"readme_sha":"f122f2a1aaa55d337b6a5a076f6596766a7d94f293f33bc609310fc2f862c9ab","roadmap":"FlagVarieties","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: FlagVarieties

This file documents the status of the FlagVarieties roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general-linear case (Layer 1) is done: standard block weights classify the reduced closed overgroups of the upper-triangular Borel in GLₙ₊₁. Layer 0 is partly built and the canonical projections between quotient sheaves exist, but none of the five headline classifications for a general reductive group has begun: the standard parabolics P_J, their conjugacy classification, projectivity of G/H, and the classification of projective homogeneous spaces all wait on suppliers in ReductiveGroups.

### Named results

- **Classification of parabolics containing B in GLₙ₊₁** — a closed subgroup scheme of GLₙ₊₁ is reduced and contains the upper-triangular subgroup exactly when it is the weight parabolic of a decreasing integer weight ([`isReduced_and_le_upperTriangular_definingHopfIdeal_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Classification.html#TauCeti.GeneralLinear.isReduced_and_le_upperTriangular_definingHopfIdeal_iff)); over an algebraically closed field the normalized label J is unique, which gives the roadmap's order isomorphism with subsets of the simple reflections (`exists_unique_standardWeight_eq`, `standardWeightOrderIso`).
- **The characteristic-zero GL case** — in characteristic zero every closed subgroup scheme containing B is a standard weight parabolic, with no reducedness hypothesis, by Cartier's theorem ([`exists_antitone_eq_weightParabolicDefiningHopfIdeal_of_charZero`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Classification.html#TauCeti.GeneralLinear.exists_antitone_eq_weightParabolicDefiningHopfIdeal_of_charZero)).
- **Overgroups of the Borel in GLₙ₊₁(k) are block triangular** — the abstract point-group statement, proved through the GL Tits system and its standard parabolics ([`exists_antitone_weightParabolicPoints_eq`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/TitsSystem.html#TauCeti.GeneralLinear.exists_antitone_weightParabolicPoints_eq)).

### Notable definitions and infrastructure

- **Point detection of closed subgroups** — reduced finite-type closed subgroups embed, order-preservingly, into the subgroups of geometric points ([`quotientPointsOrderEmbedding`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Embedding.html#TauCeti.HopfIdeal.quotientPointsOrderEmbedding)), with smooth and characteristic-zero variants. This is what lets a classification of point groups be lifted back to subgroup schemes, as in the GL case.
- **Standard block weights** — [`standardWeight`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/BlockWeight.html#TauCeti.GeneralLinear.standardWeight) attaches to J the weight that drops by one exactly at the adjacent indices outside J, normalizing the many weights that define the same parabolic.
- **Projections of homogeneous quotients** — for P ⊆ Q, the canonical map G/P → G/Q of fppf sheaves ([`fppfHomogeneousQuotientMap`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Map.html#CommHopfAlgCat.fppfHomogeneousQuotientMap)), locally surjective, functorial, and the unique map compatible with the projections from G; the starting point for Layer 5.

### Roadmap coverage

Layer 1 is done. Layer 0 is partial: the point-detection embedding of 0.1 is proved, and the fppf quotient sheaf with its torsor structure exists, but the identification of rational points of G/H with cosets (0.2) and the orbit-to-quotient isomorphism for homogeneous varieties (0.3) are not established here. Layer 5 is partial only in the weakest sense: identity and composition of the sheaf-level projections are proved, but neither the base-point evaluation criterion (5.1) nor the classification of equivariant maps G/P_J → G/P_K (5.2) is. Layers 2, 3, 4 and 6 are untouched; the parabolic predicate itself is in the library as a supplier input.

## The frontier

- **Points of the quotient (0.2)** — identify (G/H)(k) with G(k)/H(k) compatibly with left translation and the new projection maps; this needs only the existing quotient and torsor interfaces plus the existence of k-points on nonempty finite-type fibres.
- **Equivariant maps (5.1)** — show that evaluation at eP identifies equivariant morphisms G/P → G/Q with P-fixed points; at the sheaf level this looks within reach of the new projection API, but the scheme-level statement needs `gap:homogeneous-quotient-scheme`.
- **Standard parabolics P_J (Layer 2)** — blocked on ReductiveGroups 7/7b: the Tits system on G(k), the B W_J B classification and the scheme bridge (`gap:tits-system-of-points`, `gap:tits-standard-parabolic`, `gap:standard-parabolic-scheme`).
- **Conjugacy and type (Layer 3)** — needs Layer 2 together with unconditional Borel conjugacy and the pointwise Borel normalizer (`gap:borel-conjugacy-connected`, `gap:borel-pointwise-normalizer`).
- **Projectivity and the homogeneous-space classification (Layer 4)** — needs a represented quotient scheme, complete G/B and the complete-scheme Borel fixed point theorem, plus ShimuraData §3.8's projective Par_t(G).
