# Roadmap: classification of parabolic subgroups and projective homogeneous spaces

## Summary

Fix an algebraically closed field k and a smooth connected affine reductive group G of finite type over k. Fix a Borel subgroup B and a maximal torus T contained in B. Write W=N_G(T)/T and S for the simple reflections determined by B.

Construct standard algebraic parabolic subgroups P_J, indexed by subsets J of S, and prove:

1. J ↦ P_J is an order isomorphism from subsets of S to closed subgroup schemes of G containing B.
2. Every parabolic subgroup of G is conjugate under G(k) to exactly one P_J.
3. The represented homogeneous quotient G/H is projective if and only if H is parabolic, for every smooth closed subgroup scheme H of G; in characteristic zero, for every closed subgroup scheme H of G.
4. Every nonempty projective homogeneous G-variety with smooth scheme-theoretic stabilizers is G-equivariantly isomorphic to exactly one G/P_J.
5. For standard parabolics, a G-equivariant morphism G/P_J → G/P_K exists exactly when J ⊆ K; when it exists, it is the canonical projection and is unique.

The group G and its action are fixed throughout the classification. This does not classify flag varieties up to abstract variety isomorphism, or pairs (G,X) allowing G to vary. The action is not required to be faithful. Include G itself as a parabolic, so that G/P_S is a point; P_∅=B. A torus has S empty and only the point as a projective homogeneous space.

## Exact supplier contracts

This is a consumer roadmap for the classification and its geometric interpretation. It uses existing algebraic-group definitions, not a new matrix-group foundation.

| Consumed result | Owner roadmap and layer | Exact pinned declaration and file, or declared gap |
| --- | --- | --- |
| Borel predicate and connected-group conjugacy | ReductiveGroups 7 | `HopfIdeal.IsBorelOverAlgClosed`, `Algebra/AlgebraicGroup/Borel/Basic.lean`; unconditional `IsBorelOverAlgClosed.exists_conjugate_eq` in `Borel/Conjugacy/Existence.lean` is a declared gap at the pin |
| Smooth parabolic predicate | ReductiveGroups 7 | `HopfIdeal.IsParabolicOverAlgClosed`: declared gap at the pin |
| Reduced finite-type point separation | ReductiveGroups 3 | `HopfIdeal.eq_of_quotientPointsSubgroup_eq`, `Algebra/AlgebraicGroup/HopfIdeal/Points/Separation.lean` |
| Hopf ideal conjugation, identity, inverse, composition, point comparison | ReductiveGroups 3 | `HopfIdeal.conjugate`, `HopfIdeal.conjugate_one`, `CommHopfAlgCat.pointConjugation_mem_conjugate_iff`, `Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean` |
| Actual `G(k)` Tits system, Bruhat decomposition, standard-parabolic bridge and pointwise normalizer | ReductiveGroups 7/7b | `TitsSystem`, `GroupTheory/TitsSystem/Basic.lean`; actual reductive-group instance, `standardParabolicOrderIso`, bridge and normalizer: declared gaps at pin |
| GL Tits system and weight ideal | ReductiveGroups 7C | `glTitsSystem`, `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean`; `weightParabolicDefiningHopfIdeal`, `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean` |
| Represented homogeneous quotient, torsor and orbit maps | ReductiveGroups 3/3A | `CommHopfAlgCat.fppfHomogeneousQuotient`, `Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean`; scheme representability and orbit comparison: declared gaps |
| Complete `G/B` and complete-scheme Borel fixed point | ReductiveGroups 3A | declared gaps: independent complete-Borel-quotient theorem and fixed-point theorem |
| Type-A block maps and incidence | ReductiveGroups 7C.5; SchubertGeometry S1–S2.3 | declared gaps at pin; consume roadmap targets rather than duplicate them |
| Scheme descent and morphism properties | SchemeAndStackFoundations 0–1 | declared gap for the precise quotient descent used in F4 |

ReductiveGroups 7/7b owns the Tits system on `G(k)`, Bruhat decomposition and the general bridge to abstract standard parabolics. FlagVarieties owns the five headline classifications. The pointwise normalizer suffices; no scheme-theoretic normalizer is needed. GroupSchemesOverABase GS7 owns relative `Bor(G)`, ShimuraData §3.8 owns relative `Par_t(G)`, and ReductiveGroups 7C.5 owns type-A block maps. Their field-fibre comparison is the only work here.

Levi decompositions, central isogeny classification, classification of reductive groups, non-algebraically-closed-field forms, relative schemes parametrizing parabolics, horospherical spaces and general spherical spaces are outside this scope. None is a prerequisite for the results above.

## Conventions and native interfaces

- Keep the hypotheses separate: field, algebraic closedness, finite type, smoothness, geometric connectedness and reductivity. Do not encode the conclusions in a replacement group structure.
- Use the native finite-type commutative Hopf-algebra model and its scheme/points dictionary. A closed subgroup is represented by a native Hopf ideal. Its geometric inclusion order is opposite to the Hopf-ideal order. An order isomorphism stated on defining ideals therefore uses `OrderDual`.
- Use `HopfIdeal.IsParabolicOverAlgClosed`, which includes smoothness and containment of a Borel. It is a declared supplier gap at the pinned version. Projectivity of the quotient is a theorem, not a redefinition.
- Write G/P for cosets gP with G acting on the left. This is the quotient by right multiplication by P. Mathlib calls these left cosets. Do not confuse this with P\G.
- The chosen B determines the positive system and S. A subset J lists simple roots included in the Levi, rather than omitted roots. Thus J ⊆ K gives P_J ⊆ P_K and a projection G/P_J → G/P_K.
- Identify S with the native subtype of simple reflections in the actual Tits system; prove its comparison with the root-system simple-root index. A chosen representative n_w in N_G(T)(k) is auxiliary data, and formulas must be independent of its choice.
- Use the native fppf homogeneous quotient. The equality (G/P)(k)=G(k)/P(k) is a comparison theorem. Do not identify the quotient sheaf with the pointwise quotient on every k-algebra.
- A homogeneous G-variety means a nonempty smooth separated finite-type k-scheme with a G-action transitive on geometric points. Over the fixed algebraically closed k, finite type and nonemptiness supply a k-point. Establish the quotient-by-stabilizer comparison; transitivity of an abstract action on a set is not a substitute.
- For comparison with SchubertGeometry's B− convention, identify our chosen B with its B− and transport the simple-root labels through its explicit Borel/opposition dictionary. Do not silently reuse labels attached to B+.

## Layer F0: point/subgroup and quotient adapters

### F0.1 Closed subgroups and rational points

For a native closed subgroup H, expose H(k) as a subgroup of the native G(k). Prove compatibility with inclusion, conjugation and identity. Reuse `HopfIdeal.le_of_quotientPointsSubgroup_le` and `HopfIdeal.eq_of_quotientPointsSubgroup_eq` to reflect inclusion and equality under their finite-type and reducedness hypotheses. Smooth parabolics are reduced in any characteristic. Cartier supplies smoothness for arbitrary closed subgroup schemes only in characteristic zero. Give the resulting order embedding from closed subgroup schemes, ordered by geometric inclusion, to `Subgroup G(k)`.

Do not assert pointwise detection for nonreduced subgroup schemes in positive characteristic. Do not assume that an arbitrary abstract subgroup of G(k) is algebraic.

*Needs:* native point-separation, smoothness and Cartier only for the characteristic-zero corollary.

### F0.2 Native conjugation and quotient comparison

Compare scheme conjugation, Hopf-ideal conjugation and conjugation in `Subgroup G(k)`. State the orientation explicitly and cite the existing identity, inverse and composition laws in `HopfIdeal/Conjugation.lean`. Use the existing homogeneous quotient and torsor interfaces to identify its k-points with cosets: a nonempty finite-type fibre over algebraically closed k has a k-point. Prove that this identification commutes with left translation and with subgroup-induced quotient maps.

*Needs:* ReductiveGroups Layer 3 represented quotient and torsor, existing conjugation laws.

### F0.3 Homogeneous orbit comparison

For an action as above and x∈X(k), use the native scheme-theoretic stabilizer H=Stab_G(x). Establish finite type and smoothness of H, and that the orbit map identifies X with the represented fppf quotient G/H. Consume ReductiveGroups' homogeneous quotient representability and orbit-map construction. Supply the transitivity-to-local-surjectivity adapter and the orbit-map fibre identity at these hypotheses; use the quotient universal property to obtain an isomorphism, rather than upgrading a bijection on k-points to a scheme isomorphism.

*Needs:* ReductiveGroups 3A scheme orbit maps, stabilizer and quotient descent.

## Layer F1A: the GL case

For algebraically closed `k`, prove that every parabolic Hopf ideal of `GL_{n+1}` contained in the upper-triangular ideal uniquely equals `weightParabolicDefiningHopfIdeal k (w J)` for a subset `J` of the simple reflections of `glTitsSystem k n`. The map is an order isomorphism with `OrderDual` on ideals. The weight `w J` is constant exactly across the adjacent positions selected by `J`; give its explicit formula and the retained-dimension complement convention.

*Needs:* `standardParabolic_weightParabolicSimple`, `standardParabolic_eq_of_subgroupB_le`, `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal`, and `eq_of_quotientPointsSubgroup_eq`. The first three are declared gaps at the pinned version; the last exists in `HopfIdeal/Points/Separation.lean`. This layer uses only Tau Ceti results, not a new matrix foundation.

*Needs:* ReductiveGroups 7/7b actual Tits system, Bruhat cells and root subgroups.

## Layer F1: standard algebraic parabolics and the BN-pair bridge

Inputs are ReductiveGroups Layer 7's actual algebraic-group Tits system on G(k), B(k), N_G(T)(k), its Weyl-group identification, and Layer 7C's rank-one subgroups. Prove the carrier and simple-reflection comparison equalities needed to invoke the existing abstract API.

### F1.1 Algebraic realization

Consume ReductiveGroups 7/7b's construction of P_J as the smallest closed subgroup scheme containing B and the negative simple-root subgroups U_−α for α∈J. Use its closed-generation, minimality and monotonicity lemmas. Compare each rank-one generated subgroup with the supplier's minimal parabolic and its two Bruhat cells.

Consume the crucial supplier equality

    P_J(k) = TitsSystem.standardParabolic J.

This equality is a theorem, not a premise in the definition. To avoid a hidden closure gap, use the supplier's Bruhat decomposition and rank-one multiplication to identify the abstract subgroup with

    ⋃_{w∈W_J} B(k) n_w B(k),

and establish the finite-union closedness needed to compare the subgroup with the algebraic carrier. Each double coset is constructible as the image of `B × B → G`. The finite union is a constructible subgroup. A dense constructible subgroup contains a nonempty open subset of its closure; translations make it open in its closure, and its remaining cosets make the complement open. It is therefore closed. This needs the supplier root-cell and Bruhat comparison, not Schubert closure geometry. The reduced closed subvariety so obtained is a subgroup scheme: descend multiplication and inverse using geometric-point detection for reduced finite-type schemes, including reducedness of the products over the perfect field k. The supplier bridge identifies it with the closed-generated subgroup by minimality.

Consume smoothness in any characteristic, containment of B, parabolicity, connectedness, P_∅=B and P_S=G from ReductiveGroups 7/7b. For connectedness, the supplier uses connectedness of each generating root subgroup and B and its closed-generation theorem.

*Needs:* ReductiveGroups 7/7b Bruhat and root-cell inputs, Chevalley constructibility, F0.1.

### F1.2 Standard classification

Consume the ReductiveGroups 7/7b target `TauCeti.TitsSystem.standardParabolicOrderIso` (declared gap at the pin). For any closed subgroup Q containing B, classify Q(k) abstractly and recover Q=P_J through F0.1 and F1.1. Export an order isomorphism

    Set S ≃o {Q : closed subgroup schemes of G | B ⊆ Q}.

Give evaluation/inverse lemmas, uniqueness, inclusion reflection, and endpoint lemmas. Show that the inverse selects s precisely when the corresponding minimal parabolic is contained in Q. Prove P_J∩P_K=P_(J∩K); prove that the closed subgroup generated by P_J and P_K is P_(J∪K). Formulate intersections scheme-theoretically, using characteristic-zero smoothness and F0.1 to recover their defining ideals.

*Needs:* F1.1, ReductiveGroups 7b abstract standard-parabolic classification, F0.1.

## Layer F2: conjugacy classes and intrinsic type

### F2.1 Existence and uniqueness of a standard representative

Use the supplier parabolic conjugation theorem to move a Borel contained in P to B, then apply F1.2. Prove uniqueness of the standard representative under G(k)-conjugacy.

The uniqueness argument must include its missing bridge: if gP_Jg⁻¹=P_K, then gBg⁻¹ and B are Borel subgroups of the connected group P_K. They remain Borel in P_K because any larger connected solvable subgroup would contradict maximality in G. Conjugate them inside P_K using the unconditional `IsBorelOverAlgClosed.exists_conjugate_eq` from `Borel/Conjugacy/Existence.lean` to modify g to an element normalizing B. Use the pointwise equality N_G(B)(k)=B(k) to conclude P_J=P_K and then J=K. Consume the existing abstract self-normalizer theorem through F0 and F1, rather than assuming normality of B in P_K.

Define the type of a parabolic as its unique standard label and prove invariance under conjugation, together with the converse: equal types imply conjugacy. Export the equivalence between subsets of S and G(k)-conjugacy classes of parabolic subgroup schemes.

*Needs:* F1.2, unconditional Borel conjugacy inside connected `P_K`, pointwise Borel normalizer.

### F2.2 Pointwise normalizers

Use the ReductiveGroups 7b pointwise `TitsSystem.normalizer_standardParabolic` target to show `N_{G(k)}(P_J(k))=P_J(k)` and transport this under conjugation. No normalizer subgroup scheme is required.

*Needs:* F1.1, F2.1 and ReductiveGroups 7b pointwise normalizer.

## Layer F3: projectivity and the homogeneous-space dictionary

### F3.1 Containing a Borel implies projectivity

For a closed subgroup H containing B, use ReductiveGroups Layer 3's represented quotient G/H. Apply its Chevalley projective-orbit construction: choose a finite-dimensional rational representation and a line whose scheme-theoretic stabilizer is H, identifying G/H with its locally closed orbit in projective space.

Prove this orbit is closed using the complete-quotient argument: first construct complete G/B via the supplier's Borel orbit/normalizer theorem (Humphreys §21.3), then descend G/B→G/H and prove it surjective. Properness descends along this surjection to the separated finite-type target G/H. A proper locally closed immersion into projective space is closed, so the Chevalley model is projective.

The dependency on complete G/B is explicit: consume the independently specified complete Borel-quotient target of ReductiveGroups Layer 3A, using its projective orbit and Borel normalizer construction, independently of F3's parabolic/projective equivalence. Neither the classification of projective homogeneous spaces nor Schubert cohomology is an input. Reuse an existing projective flag model through its quotient universal property instead of constructing another flag scheme.

*Needs:* ReductiveGroups 3A complete `G/B`, Chevalley line stabilizer and F0.2.

### F3.2 Projectivity implies containing a Borel

If G/H is projective, apply Borel fixed point to the left B-action. Lift the resulting point to g∈G(k) by F0.2. Its stabilizer condition says g⁻¹Bg⊆H. Express this as containment of subgroup schemes by F0.1. H is smooth by hypothesis; in characteristic zero Cartier supplies this hypothesis for every closed subgroup scheme, so it is parabolic in the native definition.

Export equivalence of: H parabolic; G/H proper over k; G/H projective over k. The proper-to-parabolic proof uses the complete-scheme form of Borel fixed point, and the parabolic-to-projective proof above supplies the stronger conclusion. Do not use proper ⇒ projective for general schemes.

*Needs:* complete-scheme Borel fixed point, F0.1–F0.2 and F3.1.

### F3.3 Classification of projective homogeneous G-varieties

For nonempty projective homogeneous X choose x∈X(k), apply F0.3, F3.2 and F2.1, and obtain a G-equivariant k-isomorphism X≅G/P_J with unique J. Prove independence of x: stabilizers of two points are conjugate. Give both directions of the classification, including the construction of the G-action, smoothness, projectivity and geometric transitivity on each G/P_J.

Do not construct a type of all varieties in a fixed universe merely to express a bijection. An existence-and-uniqueness theorem for each X, plus the comparison theorem G/P_J≅_G G/P_K iff J=K, states the classification without unnecessary size infrastructure.

*Needs:* F0.3, F2.1 and F3.2.

## Layer F4: equivariant morphisms and projections

### F4.1 Evaluation at the base point

For closed subgroups P,Q, prove that evaluation at eP identifies G-equivariant scheme morphisms G/P→G/Q with P-fixed k-points of G/Q. A point gQ is fixed exactly when g⁻¹Pg⊆Q as subgroup schemes. Establish the equivariant descent construction for the converse and independence of the representative g. This is a scheme-morphism statement, not just the classification of equivariant functions on rational points.

*Needs:* F0.2, scheme-level quotient descent and the stabilizer fixed-point criterion.

### F4.2 Standard parabolics

For P_J,P_K show a fixed coset exists iff J⊆K and is then eP_K. Use B⊆P_J, and show that the only B-fixed point of G/P_K is eP_K: if g⁻¹Bg⊆P_K, conjugate this Borel to B inside connected P_K and use N_G(B)=B. Conclude uniqueness of every equivariant morphism and identify it with the subgroup-induced projection.

Prove identity and composition of the projections, and the equivalence G/P_J≅_G G/P_K iff J=K. In particular every G-equivariant automorphism of G/P_J is the identity. This makes no assertion about the full automorphism group of the underlying variety.

*Needs:* F4.1, F2.1 and F1.2.

## Layer F5: concrete classification checks

Reuse existing group and incidence models; build comparison isomorphisms and classification applications rather than new Grassmannian or flag constructions. Consume the type-A block maps of ReductiveGroups 7C.5 and the incidence comparisons of SchubertGeometry S1; SchubertGeometry S2.3 owns the subword/Bruhat closure criterion.

1. Torus: S=∅, B=G, P_∅=G, and the only projective homogeneous G-variety is a point.
2. SL₂: S has one element; the two spaces are SL₂/B≅P¹ and a point. Identify the action and stabilizer in the existing line model.
3. GL_n: use the upper-triangular Borel stabilizing the standard ascending coordinate flag. For J⊆{1,…,n−1}, the retained dimensions of the partial flag are the complement D={1,…,n−1}\J. Prove that P_J is the stabilizer of that partial flag. Compare the quotient with the existing incidence scheme and its tautological subspaces. Include n=1, full flags, the point, and Grassmannians.
4. GL₃: list the four types ∅,{s₁},{s₂},S. They give the full flag, the dimension-2 Grassmannian, the dimension-1 Grassmannian, and a point, respectively. The two projective-plane models are not GL₃-equivariantly isomorphic although their underlying varieties are isomorphic. Recover exactly the forgetful projection maps allowed by inclusion.

*Needs:* F1A, F3.3, F4.2, ReductiveGroups 7C.5 and SchubertGeometry S1.

## References and proof route

Primary reference: J. E. Humphreys, *Linear Algebraic Groups*, Graduate Texts in Mathematics 21, Springer. Use section numbers rather than edition-dependent page numbers.

- §§11–12: Chevalley's representation/stabilizer construction and homogeneous quotients.
- §17.6 and §19: Lie–Kolchin and connected solvable groups; consume their existing formalizations.
- §§21–23, especially §§21.2–21.3 and §23.3: Borel fixed point, conjugacy, normalizers and G/B.
- §§24–28: tori, roots, rank-one structure and Bruhat decomposition; supplier ReductiveGroups.
- §§29.1–29.3: Tits systems, Bruhat cells and abstract parabolics; consume the native TitsSystem API.
- §30.1: standard algebraic parabolics and the classification comparison.

The intended path is the classical algebraic route, not classification of reductive groups by root data and not complex Lie-group classification. Milne, *Algebraic Groups* (2017), and Conrad–Feng, *Reductive Groups over Fields* (2020 version), are supporting references for the existing scheme/Hopf and dynamic interfaces. Humphreys supplies the mathematical proof strategy; the native Tau Ceti interfaces determine how it is expressed in Lean.

## Mathlib and Zulip coordination

A search of open Mathlib PRs and Lean Zulip for “flag variety”, “Grassmannian”, “homogeneous quotient”, and “group scheme” did not identify a reviewed open PR or Zulip design supplying the represented `G/P` scheme or its classification. Recheck these four searches at implementation time and adopt a substantive Mathlib carrier if one appears. The pinned `Module.Grassmannian` is a module/subspace carrier whose parameter is quotient rank, not a representing scheme; do not duplicate it or mistake it for `G/P`.

## How to read the build

`Suggested.lean` is a checked prototype, not an exhaustive checklist. The pinned Tau Ceti lacks the general parabolic predicate, actual reductive-group Tits system and represented quotient schemes. Its docstring names these gaps; a `sorry` is used only for a genuine proof obligation. The README is definitive.

## Checks

**Checks. Homogeneous variety:** a torus acting on a point is included; `Gₘ` acting on itself is homogeneous but nonprojective; a dual-number thickening is excluded by smoothness; a Frobenius-twisted `SL₂` action on `ℙ¹` has nonsmooth stabilizer and is excluded in characteristic `p`.

**Checks. Standard parabolic:** `P_∅=B`; `P_S=G`; in `GL₃`, `{s₁}` retains the plane and `{s₂}` the line; over `𝔽₂` the four point groups have orders `8,24,24,168`, unlike the Weyl parabolics of orders `1,2,2,6`.

**Checks. Type and maps:** conjugation by `[[1,0],[1,1]]` sends the stabilizer of `⟨e₁⟩` to that of `⟨e₁+e₂⟩` and tests `g` versus `g⁻¹`; conjugate parabolics have equal type; line and plane types in `GL₃` differ despite abstractly isomorphic projective planes; only forgetful projections with `J⊆K` exist.

**Checks. Point detection:** `μ_p` and the Frobenius inverse image of a Borel have the same geometric points as their reductions in characteristic `p`, so point equality cannot recover a nonreduced ideal.

## Downstream consumers

SchubertGeometry consumes the standard quotient and incidence conventions. ShimuraData §3.8 and GroupSchemesOverABase GS7 identify the fibres of their relative parabolic and Borel schemes with these quotients. ReductiveGroups 7C.5 supplies the type-A block maps used in F5.

## Claim-local source locators

F0.3 uses Milne (2017), §7.7 and Proposition 7.15, printed pp.141–142, for quotient comparison. F1.1 uses Humphreys §§29.1–29.3 for BN-pairs and Bruhat cells; F1.2 uses Humphreys §30.1 and Milne Theorem 21.91, pp.453–454, for smooth standard parabolics in arbitrary characteristic. F2.1 uses Milne Theorem 17.9(b), p.354, for Borel conjugacy and Conrad–Feng (2020), Appendix T.1, p.305, for uniqueness of standard type. F3.1 uses Milne Theorem 17.9, p.354, and Humphreys §21.3 for complete `G/B`. F4.1 uses Milne Proposition 5.22, p.104, and the quotient universal property. Humphreys remains the primary reference. Editions and links are in `sources.toml`.
