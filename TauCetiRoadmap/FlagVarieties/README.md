# Roadmap: classification of parabolic subgroups and projective homogeneous spaces

**Summary.** Fix an algebraically closed field k and a smooth connected affine reductive group G of finite type over k. Fix a Borel subgroup B and a maximal torus T contained in B. Write W=N_G(T)/T and S for the simple reflections determined by B.

Construct standard algebraic parabolic subgroups P_J, indexed by subsets J of S, and prove:

1. J ↦ P_J is an order isomorphism from subsets of S to closed subgroup schemes of G containing B.
2. Every parabolic subgroup of G is conjugate under G(k) to exactly one P_J.
3. The represented homogeneous quotient G/H is projective if and only if H is parabolic, for every smooth closed subgroup scheme H of G; in characteristic zero, for every closed subgroup scheme H of G.
4. Every nonempty projective homogeneous G-variety with smooth scheme-theoretic stabilizers is G-equivariantly isomorphic to exactly one G/P_J.
5. For standard parabolics, a G-equivariant morphism G/P_J → G/P_K exists exactly when J ⊆ K; when it exists, it is the canonical projection and is unique.

The group G and its action are fixed throughout the classification. This does not classify flag varieties up to abstract variety isomorphism, or pairs (G,X) allowing G to vary. The action is not required to be faithful. Include G itself as a parabolic, so that G/P_S is a point; P_∅=B. A torus has S empty and only the point as a projective homogeneous space.

## Scope and ownership

This is a consumer roadmap for the classification and its geometric interpretation. It uses existing algebraic-group definitions, not a new matrix-group foundation.

ReductiveGroups 7/7b owns the Tits system on `G(k)`, Bruhat decomposition and the general bridge to abstract standard parabolics. FlagVarieties owns the five headline classifications. The pointwise normalizer suffices; no scheme-theoretic normalizer is needed. GroupSchemesOverABase GS7 owns relative `Bor(G)`, ShimuraData §3.8 owns relative `Par_t(G)`, and ReductiveGroups 7C.5 owns type-A block maps. Their field-fibre comparison is the only work here.

The uniqueness half of the second headline holds for every smooth connected affine group over algebraically closed `k`; its Hopf-ideal prototype in `Suggested.lean` uses only geometric connectedness of the ambient finite-type group.

ShimuraData §3.8 owns the smooth proper `Par_t(G)`, its projectivity over an affine base, and the comparison `G/P ≅ Par_t(G)`. This roadmap proves that containment of a Borel makes `G/H` proper and compares Borel containment with the parabolic notion used by that supplier; it does not reconstruct the projectivity of `G/P`.

Levi decompositions, central isogeny classification, classification of reductive groups, non-algebraically-closed-field forms, relative schemes parametrizing parabolics, horospherical spaces and general spherical spaces are outside this scope. None is a prerequisite for the results above.

## Conventions

- Keep the hypotheses separate: field, algebraic closedness, finite type, smoothness, geometric connectedness and reductivity. Do not encode the conclusions in a replacement group structure.
- Use the native finite-type commutative Hopf-algebra model and its scheme/points dictionary. A closed subgroup is represented by a native Hopf ideal. Its geometric inclusion order is opposite to the Hopf-ideal order. An order isomorphism stated on defining ideals therefore uses `OrderDual`.
- Use `HopfIdeal.IsParabolicOverAlgClosed`, which includes smoothness and containment of a Borel. Its supplier contract is `gap:parabolic-predicate`. Projectivity of the quotient is a theorem, not a redefinition.
- Write G/P for cosets gP with G acting on the left. This is the quotient by right multiplication by P. Mathlib calls these left cosets. Do not confuse this with P\G.
- The chosen B determines the positive system and S. A subset J lists simple roots included in the Levi, rather than omitted roots. Thus J ⊆ K gives P_J ⊆ P_K and a projection G/P_J → G/P_K.
- Identify S with the native subtype of simple reflections in the actual Tits system; prove its comparison with the root-system simple-root index. A chosen representative n_w in N_G(T)(k) is auxiliary data, and formulas must be independent of its choice.
- Use the native fppf homogeneous quotient. The equality (G/P)(k)=G(k)/P(k) is a comparison theorem. Do not identify the quotient sheaf with the pointwise quotient on every k-algebra.
- A homogeneous G-variety means a nonempty smooth separated finite-type k-scheme with a G-action transitive on geometric points. Over the fixed algebraically closed k, finite type and nonemptiness supply a k-point. Establish the quotient-by-stabilizer comparison; transitivity of an abstract action on a set is not a substitute.
- For comparison with SchubertGeometry's B− convention, identify our chosen B with its B− and transport the simple-root labels through its explicit Borel/opposition dictionary. Do not silently reuse labels attached to B+.

## Exact supplier contracts

| Consumed result | Owner roadmap and layer | Exact pinned declaration and file, or gap slug below |
| --- | --- | --- |
| Borel predicate and connected-group conjugacy | ReductiveGroups 7 | `HopfIdeal.IsBorelOverAlgClosed`, `Algebra/AlgebraicGroup/Borel/Basic.lean`; `gap:borel-conjugacy-connected` |
| Smooth parabolic predicate | ReductiveGroups 7 | `gap:parabolic-predicate` |
| Reduced finite-type point separation | ReductiveGroups 3 | `HopfIdeal.eq_of_quotientPointsSubgroup_eq`, `Algebra/AlgebraicGroup/HopfIdeal/Points/Separation.lean` |
| Hopf ideal conjugation, identity, inverse, composition, point comparison | ReductiveGroups 3 | `HopfIdeal.conjugate`, `HopfIdeal.conjugate_one`, `CommHopfAlgCat.pointConjugation_mem_conjugate_iff`, `Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean` |
| Actual `G(k)` Tits system, abstract parabolics, algebraic parabolics and pointwise normalizers | ReductiveGroups 7/7b | `TitsSystem`, `GroupTheory/TitsSystem/Basic.lean`; `gap:tits-system-of-points`, `gap:tits-standard-parabolic`, `gap:standard-parabolic-scheme`, `gap:borel-pointwise-normalizer`, `gap:parabolic-pointwise-normalizer` |
| GL Tits system and weight ideal | ReductiveGroups 7C | `glTitsSystem`, `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean`; `weightParabolicDefiningHopfIdeal`, `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean` |
| Represented homogeneous quotient, torsor and orbit maps | ReductiveGroups 3/3A | `CommHopfAlgCat.fppfHomogeneousQuotient`, `Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean`; `gap:homogeneous-quotient-scheme`, `gap:orbit-map-quotient` |
| Complete `G/B` and complete-scheme Borel fixed point | ReductiveGroups 3A | `gap:complete-borel-quotient`, `gap:borel-fixed-point-scheme` |
| Type-A block maps and incidence | ReductiveGroups 7C.5; SchubertGeometry S1–S2.3 | Consume the named block maps and incidence work of those roadmaps. |
| Scheme descent and morphism properties | SchemeAndStackFoundations 0–1 | The quotient universal property and descent required in Layer 5. |
| Cartier smoothness in characteristic zero | Tau Ceti | `TauCeti.smoothCommHopfAlgProperty_of_charZero`, `Algebra/AlgebraicGroup/Smooth/CharZero.lean:145` |

### From TauCetiRoadmap.ReductiveGroups

What ReductiveGroups must provide (gap:borel-conjugacy-connected): for a smooth geometrically connected affine group of finite type over an algebraically closed field, any two Hopf ideals satisfying `IsBorelOverAlgClosed` are conjugate by a rational point, without the `hcontain` hypothesis of `Borel/Conjugation.lean:161`.

What ReductiveGroups must provide (gap:borel-pointwise-normalizer): for such a group and a Borel ideal `B`, a rational point whose conjugation fixes `B` lies in `B(k)`.

What ReductiveGroups must provide (gap:parabolic-pointwise-normalizer): for a smooth connected reductive `G` over algebraically closed `k` and each standard parabolic `P_J`, its point subgroup is self-normalizing in `G(k)`.

What ReductiveGroups must provide (gap:tits-system-of-points): the Tits system on `G(k)` with `subgroupB = B(k)`, `subgroupN = N_G(T)(k)` and simple set the simple reflections of the root system of `(G,T)`, for `G` smooth connected reductive and `T ⊆ B`.

What ReductiveGroups must provide (gap:tits-standard-parabolic): for a Tits system on a group `G`, the subgroups containing `B` are exactly the `B W_J B`, for a unique `J` (Bourbaki IV §2.5 Theorem 3).

What ReductiveGroups must provide (gap:standard-parabolic-scheme): for `J` a set of simple reflections, the smallest closed subgroup scheme `P_J` containing `B` and the root subgroups `U_{−α}`, `α ∈ J`, with `P_J(k) = B(k) W_J B(k)`, smooth, connected, `P_∅ = B`, `P_S = G`.

What ReductiveGroups must provide (gap:parabolic-predicate): `HopfIdeal.IsParabolicOverAlgClosed` meaning a smooth closed subgroup scheme whose ideal is contained in some Borel ideal.

What ReductiveGroups must provide (gap:homogeneous-quotient-scheme): for smooth affine `G` of finite type over `k` and any closed subgroup scheme `H`, a separated finite-type `k`-scheme representing `fppfHomogeneousQuotient` with its universal property (Milne Theorem 7.18, p.143).

What ReductiveGroups must provide (gap:complete-borel-quotient): `G/B` is proper over `k` for a Borel `B` of a smooth connected affine `G` (Milne Theorem 17.9(a), p.354).

What ReductiveGroups must provide (gap:borel-fixed-point-scheme): a smooth connected solvable group acting on a nonempty proper `k`-scheme over algebraically closed `k` has a `k`-rational fixed point (Milne Corollary 17.3, p.353).

What ReductiveGroups must provide (gap:orbit-map-quotient): for a transitive action on a smooth separated finite-type `X` with `k`-point `x` and smooth stabilizer `H`, the orbit map induces an isomorphism `G/H ≅ X` (Milne §7.e, Proposition 7.11 and the fibre comparison in Proposition 7.15, pp.141–143).

## How to read the build

`Suggested.lean` is a checked prototype, not an exhaustive checklist. The pinned Tau Ceti lacks the general parabolic predicate, actual reductive-group Tits system and represented quotient schemes. Its docstring names these gaps; a `sorry` is used only for a genuine proof obligation. The README is definitive.

## Layer 0: point/subgroup and quotient adapters

### 0.1 Closed subgroups and rational points

For a native closed subgroup H, expose H(k) as a subgroup of the native G(k). Prove compatibility with inclusion, conjugation and identity. Reuse `HopfIdeal.le_of_quotientPointsSubgroup_le` and `HopfIdeal.eq_of_quotientPointsSubgroup_eq` to reflect inclusion and equality under their finite-type and reducedness hypotheses. Smooth parabolics are reduced in any characteristic. `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:145`) supplies Cartier smoothness for arbitrary closed subgroup schemes in characteristic zero. Give the resulting order embedding from closed subgroup schemes, ordered by geometric inclusion, to `Subgroup G(k)`.

**Checks. Point detection:** `μ_p` and the Frobenius inverse image of a Borel have the same geometric points as their reductions in characteristic `p`, so point equality cannot recover a nonreduced ideal.

Do not assert pointwise detection for nonreduced subgroup schemes in positive characteristic. Do not assume that an arbitrary abstract subgroup of G(k) is algebraic.

*Needs:* native point-separation, smoothness and Cartier only for the characteristic-zero corollary.

### 0.2 Native conjugation and quotient comparison

Compare scheme conjugation, Hopf-ideal conjugation and conjugation in `Subgroup G(k)`. State the orientation explicitly and cite the existing identity, inverse and composition laws in `HopfIdeal/Conjugation.lean`. Use the existing homogeneous quotient and torsor interfaces to identify its k-points with cosets: a nonempty finite-type fibre over algebraically closed k has a k-point. Prove that this identification commutes with left translation and with subgroup-induced quotient maps.

*Needs:* ReductiveGroups Layer 3 represented quotient and torsor, existing conjugation laws.

### 0.3 Homogeneous orbit comparison

For an action as above and x∈X(k), use the native scheme-theoretic stabilizer H=Stab_G(x). Establish finite type and smoothness of H, and that the orbit map identifies X with the represented fppf quotient G/H. Consume ReductiveGroups' homogeneous quotient representability and orbit-map construction. Supply the transitivity-to-local-surjectivity adapter and the orbit-map fibre identity at these hypotheses; use the quotient universal property to obtain an isomorphism, rather than upgrading a bijection on k-points to a scheme isomorphism.

**Checks. Homogeneous variety:** a torus acting on a point is included; `Gₘ` acting on itself is homogeneous but nonprojective; a dual-number thickening is excluded by smoothness; a Frobenius-twisted `SL₂` action on `ℙ¹` has nonsmooth stabilizer and is excluded in characteristic `p`.

*Needs:* ReductiveGroups 3A scheme orbit maps, stabilizer and quotient descent.

### Examples

The point of a torus and the nonprojective homogeneous space `Gₘ/1` separate homogeneity from projectivity.

### Dependencies

Native Hopf-ideal points and conjugation; ReductiveGroups Layers 3 and 3A quotient and orbit contracts; SchemeAndStackFoundations descent.

## Layer 1: the GL case

### 1.1 Classification by block weights

For algebraically closed `k`, every reduced Hopf ideal `I ≤ GeneralLinear.UpperTriangular.definingHopfIdeal k (n+1)` of `GeneralLinear.coordinateHopfAlgebra k (n+1)` equals `GeneralLinear.weightParabolicDefiningHopfIdeal k (standardWeight J)` for exactly one `J : Finset (Fin n)`. Here `standardWeight J (i) = −#{j : Fin n | j < i ∧ j ∉ J}`. This layer owns the definition `standardWeight` and theorem `exists_unique_standardWeight_eq` in `Suggested.lean`, as well as the resulting order isomorphism with `OrderDual` on ideals. The retained flag dimensions are the complement of `J`.

Prove the block-triangular point description of the weight ideal, classify the point subgroup using the abstract `B W_J B` theorem, and recover equality of the ideals with `HopfIdeal.eq_of_quotientPointsSubgroup_eq` (`HopfIdeal/Points/Separation.lean:84`). Prove that each weight ideal is parabolic and its label unique. In `GL₃`, the four weights are `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)` for `J = ∅, {0}, {1}, S`.

*Needs:* pinned weight ideal and upper-triangular ideal, pinned point separation, and `gap:tits-standard-parabolic`. The weight-ideal comparison and parabolicity are proved in this layer.

### Examples

For `n=2`, the weights for `∅`, `{0}`, `{1}` and `Finset.univ` are `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)` and `(0,0,0)`.

### Dependencies

Pinned general-linear weight and upper-triangular ideals, reduced point separation, and `gap:tits-standard-parabolic`.

## Layer 2: standard algebraic parabolics and the BN-pair bridge

Inputs are ReductiveGroups Layer 7's actual algebraic-group Tits system on G(k), B(k), N_G(T)(k), its Weyl-group identification, and Layer 7C's rank-one subgroups. Prove the carrier and simple-reflection comparison equalities needed to invoke the abstract API specified by `gap:tits-standard-parabolic`.

### 2.1 Algebraic realization

Consume ReductiveGroups 7/7b's construction of P_J as the smallest closed subgroup scheme containing B and the negative simple-root subgroups U_−α for α∈J. Use its closed-generation, minimality and monotonicity lemmas. Compare each rank-one generated subgroup with the supplier's minimal parabolic and its two Bruhat cells.

Consume the crucial supplier equality

    P_J(k) = TitsSystem.standardParabolic J.

This equality is a theorem, not a premise in the definition. To avoid a hidden closure gap, use the supplier's Bruhat decomposition and rank-one multiplication to identify the abstract subgroup with

    ⋃_{w∈W_J} B(k) n_w B(k),

and establish the finite-union closedness needed to compare the subgroup with the algebraic carrier. Each double coset is constructible as the image of `B × B → G`. The finite union is a constructible subgroup. A dense constructible subgroup contains a nonempty open subset of its closure; translations make it open in its closure, and its remaining cosets make the complement open. It is therefore closed. This needs the supplier root-cell and Bruhat comparison, not Schubert closure geometry. The reduced closed subvariety so obtained is a subgroup scheme: descend multiplication and inverse using geometric-point detection for reduced finite-type schemes, including reducedness of the products over the perfect field k. The supplier bridge identifies it with the closed-generated subgroup by minimality.

Consume smoothness in any characteristic, containment of B, parabolicity, connectedness, P_∅=B and P_S=G from ReductiveGroups 7/7b. For connectedness, the supplier uses connectedness of each generating root subgroup and B and its closed-generation theorem.

**Checks. Standard parabolic:** `P_∅=B`; `P_S=G`; in `GL₃`, `{s₁}` retains the plane and `{s₂}` the line; over `𝔽₂` the four point groups have orders `8,24,24,168`, unlike the Weyl parabolics of orders `1,2,2,6`.

*Needs:* ReductiveGroups 7/7b Bruhat and root-cell inputs, Chevalley constructibility, 0.1.

### 2.2 Standard classification

Consume `gap:tits-standard-parabolic` and `gap:standard-parabolic-scheme`. For any closed subgroup Q containing B, classify Q(k) abstractly and recover Q=P_J through 0.1 and 2.1. Export an order isomorphism

    Set S ≃o {Q : closed subgroup schemes of G | B ⊆ Q}.

Give evaluation/inverse lemmas, uniqueness, inclusion reflection, and endpoint lemmas. Show that the inverse selects s precisely when the corresponding minimal parabolic is contained in Q. Prove P_J∩P_K=P_(J∩K); prove that the closed subgroup generated by P_J and P_K is P_(J∪K). Formulate intersections scheme-theoretically in all characteristics, using the smooth connected intersection theorem of ReductiveGroups 7b and 0.1 to recover their defining ideals.

*Needs:* 2.1, ReductiveGroups 7b abstract standard-parabolic classification, 0.1.

### Examples

`P_∅=B`, `P_S=G`; in `GL₃`, the two singleton labels retain a plane and a line respectively.

### Dependencies

ReductiveGroups 7/7b supplies the actual Tits system, Bruhat/root cells and scheme bridge; Layer 0 supplies point separation.

## Layer 3: conjugacy classes and intrinsic type

### 3.1 Existence and uniqueness of a standard representative

Use the supplier parabolic conjugation theorem to move a Borel contained in P to B, then apply 2.2. Prove uniqueness of the standard representative under G(k)-conjugacy.

The uniqueness argument must include its missing bridge: if gP_Jg⁻¹=P_K, then gBg⁻¹ and B are Borel subgroups of the connected group P_K. They remain Borel in P_K because any larger connected solvable subgroup would contradict maximality in G. Conjugate them inside P_K using the unconditional `IsBorelOverAlgClosed.exists_conjugate_eq` from `Borel/Conjugacy/Existence.lean` to modify g to an element normalizing B. Use the pointwise equality N_G(B)(k)=B(k) to conclude P_J=P_K and then J=K. Consume the abstract self-normalizer theorem through Layers 0 and 2, rather than assuming normality of B in P_K.

Define the type of a parabolic as its unique standard label and prove invariance under conjugation, together with the converse: equal types imply conjugacy. Export the equivalence between subsets of S and G(k)-conjugacy classes of parabolic subgroup schemes.

**Checks. Type and maps:** conjugation by `[[1,0,0],[1,1,0],[0,1,1]]` sends the stabilizer of `⟨e₁⟩` to that of `⟨e₁+e₂⟩`; in characteristic 2 its inverse sends it to that of `⟨e₁+e₂+e₃⟩`, so the two directions differ. Conjugate parabolics have equal type; line and plane types in `GL₃` differ despite abstractly isomorphic projective planes; only forgetful projections with `J⊆K` exist.

*Needs:* 2.2, unconditional Borel conjugacy inside connected `P_K`, pointwise Borel normalizer.

### 3.2 Pointwise normalizers

Use the ReductiveGroups 7b pointwise normalizer theorem to show `N_{G(k)}(P_J(k))=P_J(k)` and transport this under conjugation. No normalizer subgroup scheme is required.

*Needs:* 2.1, 3.1 and `gap:parabolic-pointwise-normalizer`.

### Examples

In `GL₃`, the two maximal proper standard parabolics have equal dimension but distinct types.

### Dependencies

Layer 2 classification, `gap:borel-conjugacy-connected`, `gap:borel-pointwise-normalizer` and `gap:parabolic-pointwise-normalizer`.

## Layer 4: projectivity and the homogeneous-space dictionary

### 4.1 Containing a Borel implies properness

For a closed subgroup `H` containing `B`, use `gap:homogeneous-quotient-scheme` to form `G/H`. The complete `G/B` from `gap:complete-borel-quotient` maps surjectively to the separated finite-type `G/H`; properness descends along this map. This proves that Borel containment implies `G/H` proper (Milne Theorem 17.16, p.356).

Compare Borel containment with the parabolic condition used by ShimuraData §3.8. For a resulting parabolic `P`, consume that roadmap's `Par_t(G)`, its projectivity over the affine base `Spec k`, and its isomorphism `G/P ≅ Par_t(G)`. This supplies the projective direction of headline 3 without a second projectivity construction.

The completeness of `G/B` is supplied independently of this layer's equivalence, by Milne Theorem 17.9(a), p.354, and Humphreys §21.3. Neither the classification of projective homogeneous spaces nor Schubert cohomology is an input.

*Needs:* `gap:homogeneous-quotient-scheme`, `gap:complete-borel-quotient`, 0.2 and ShimuraData §3.8's `Par_t(G)` comparison and projectivity.

### 4.2 Projectivity implies containing a Borel

If G/H is projective, apply Borel fixed point to the left B-action. Lift the resulting point to g∈G(k) by 0.2. Its stabilizer condition says g⁻¹Bg⊆H. Express this as containment of subgroup schemes by 0.1. H is smooth by hypothesis; in characteristic zero Cartier supplies this hypothesis for every closed subgroup scheme, so it is parabolic in the native definition.

Export equivalence of: H parabolic; G/H proper over k; G/H projective over k. The proper-to-parabolic proof uses the complete-scheme form of Borel fixed point, and the parabolic-to-projective proof above supplies the stronger conclusion. Do not use proper ⇒ projective for general schemes.

*Needs:* complete-scheme Borel fixed point, 0.1–0.2 and 4.1.

### 4.3 Classification of projective homogeneous G-varieties

For nonempty projective homogeneous X choose x∈X(k), apply 0.3, 4.2 and 3.1, and obtain a G-equivariant k-isomorphism X≅G/P_J with unique J. Prove independence of x: stabilizers of two points are conjugate. Give both directions of the classification, including the construction of the G-action, smoothness, projectivity and geometric transitivity on each G/P_J.

Do not construct a type of all varieties in a fixed universe merely to express a bijection. An existence-and-uniqueness theorem for each X, plus the comparison theorem G/P_J≅_G G/P_K iff J=K, states the classification without unnecessary size infrastructure.

*Needs:* 0.3, 3.1 and 4.2.

### Examples

For `SL₂`, `G/B ≅ ℙ¹` is projective while `G/T` is not proper; `G/G` is a point.

### Dependencies

Layer 0 quotient and orbit comparison, Layer 3 type classification, ReductiveGroups 3A complete `G/B` and fixed point, ShimuraData §3.8 projective `Par_t(G)`.

## Layer 5: equivariant morphisms and projections

### 5.1 Evaluation at the base point

For closed subgroups P,Q, prove that evaluation at eP identifies G-equivariant scheme morphisms G/P→G/Q with P-fixed k-points of G/Q. A point gQ is fixed exactly when g⁻¹Pg⊆Q as subgroup schemes. Establish the equivariant descent construction for the converse and independence of the representative g. This is a scheme-morphism statement, not just the classification of equivariant functions on rational points.

*Needs:* 0.2, scheme-level quotient descent and the stabilizer fixed-point criterion.

### 5.2 Standard parabolics

For P_J,P_K show a fixed coset exists iff J⊆K and is then eP_K. Use B⊆P_J, and show that the only B-fixed point of G/P_K is eP_K: if g⁻¹Bg⊆P_K, conjugate this Borel to B inside connected P_K and use N_G(B)=B. Conclude uniqueness of every equivariant morphism and identify it with the subgroup-induced projection.

Prove identity and composition of the projections, and the equivalence G/P_J≅_G G/P_K iff J=K. In particular every G-equivariant automorphism of G/P_J is the identity. This makes no assertion about the full automorphism group of the underlying variety.

*Needs:* 5.1, 3.1 and 2.2.

### Examples

The projection from the full `GL₃` flag to either Grassmannian exists; no `GL₃`-equivariant map exchanges its line and plane quotients.

### Dependencies

Layer 2 order classification, Layer 3 Borel conjugacy, and Layer 0 scheme quotient descent.

## Layer 6: concrete classification checks

### 6.1 Model comparisons

Reuse existing group and incidence models; build comparison isomorphisms and classification applications rather than new Grassmannian or flag constructions. Consume the type-A block maps of ReductiveGroups 7C.5 and the incidence comparisons of SchubertGeometry S1; SchubertGeometry S2.3 owns the subword/Bruhat closure criterion.

1. Torus: S=∅, B=G, P_∅=G, and the only projective homogeneous G-variety is a point.
2. SL₂: S has one element; the two spaces are SL₂/B≅P¹ and a point. Identify the action and stabilizer in the existing line model.
3. GL_n: use the upper-triangular Borel stabilizing the standard ascending coordinate flag. For J⊆{1,…,n−1}, the retained dimensions of the partial flag are the complement D={1,…,n−1}\J. Prove that P_J is the stabilizer of that partial flag. Compare the quotient with the existing incidence scheme and its tautological subspaces. Include n=1, full flags, the point, and Grassmannians.
4. GL₃: list the four types ∅,{s₁},{s₂},S. They give the full flag, the dimension-2 Grassmannian, the dimension-1 Grassmannian, and a point, respectively. The two projective-plane models are not GL₃-equivariantly isomorphic although their underlying varieties are isomorphic. Recover exactly the forgetful projection maps allowed by inclusion.

*Needs:* Layer 1, 4.3, 5.2, ReductiveGroups 7C.5 and SchubertGeometry S1.

### Examples

For `GL₃`, the four quotients are the full flag, plane Grassmannian, line Grassmannian and point.

### Dependencies

Layers 1–5, ReductiveGroups 7C.5 block maps, and SchubertGeometry S1 incidence comparison.

## Downstream consumers

There are no downstream roadmap consumers today. ShimuraData §3.8 supplies `Par_t(G)` earlier in the build order; ReductiveGroups 7C.5 and SchubertGeometry S1 supply the type-A block and incidence comparisons used here.

## References and proof route

Primary reference: J. E. Humphreys, *Linear Algebraic Groups*, Graduate Texts in Mathematics 21, Springer. Use section numbers rather than edition-dependent page numbers.

- §§11–12: Chevalley's representation/stabilizer construction and homogeneous quotients.
- §17.6 and §19: Lie–Kolchin and connected solvable groups; consume their existing formalizations.
- §§21–23, especially §§21.2–21.3 and §23.3: Borel fixed point, conjugacy, normalizers and G/B.
- §§24–28: tori, roots, rank-one structure and Bruhat decomposition; supplier ReductiveGroups.
- §§29.1–29.3: Tits systems, Bruhat cells and abstract parabolics; consume the native TitsSystem API.
- §30.1: standard algebraic parabolics and the classification comparison.

The intended path is the classical algebraic route, not classification of reductive groups by root data and not complex Lie-group classification. Milne, *Algebraic Groups* (2017), and Conrad–Feng, *Reductive Groups over Fields* (2020 version), are supporting references for the existing scheme/Hopf and dynamic interfaces. Humphreys supplies the mathematical proof strategy; the native Tau Ceti interfaces determine how it is expressed in Lean.

### Claim-local locators

Layer 0.3 uses Milne (2017), §7.e and Propositions 7.11 and 7.15, printed pp.141–143, for the orbit-to-quotient isomorphism and fibre comparison. Layer 2.1 uses Humphreys §§29.1–29.3 for BN-pairs and Bruhat cells. Layer 2.2 uses Humphreys §30.1 and Milne Theorem 21.91, pp.453–454, for smooth standard parabolics in arbitrary characteristic; its scheme-theoretic intersection equality holds in every characteristic by ReductiveGroups 7b's smooth connected intersection theorem. Layer 3.1 uses Milne Theorem 17.9(b), p.354, for Borel conjugacy, Milne Theorem 21.91, p.453, for uniqueness of standard type, and Conrad–Feng (2020), Appendix T.1, p.305, as a statement reference. Layer 4.1 uses Milne Theorem 17.9(a), p.354, and Humphreys §21.3 for complete `G/B`; ShimuraData §3.8 supplies projectivity of `Par_t(G)`. Layer 5.1 uses Milne Proposition 5.22, p.104, with the quotient universal property. Humphreys is the primary reference, cited by locator only; its paywalled text was not checked here.
