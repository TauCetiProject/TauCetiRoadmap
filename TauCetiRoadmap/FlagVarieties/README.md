# Classification of parabolic subgroups and projective homogeneous spaces

## Objective

Fix an algebraically closed field k of characteristic zero and a connected affine reductive group G of finite type over k. Fix a Borel subgroup B and a maximal torus T contained in B. Write W=N_G(T)/T and S for the simple reflections determined by B.

Construct standard algebraic parabolic subgroups P_J, indexed by subsets J of S, and prove:

1. J ↦ P_J is an order isomorphism from subsets of S to closed subgroup schemes of G containing B.
2. Every parabolic subgroup of G is conjugate under G(k) to exactly one P_J.
3. The represented homogeneous quotient G/H is projective if and only if H is parabolic, for every closed subgroup scheme H of G.
4. Every nonempty projective homogeneous G-variety is G-equivariantly isomorphic to exactly one G/P_J.
5. For standard parabolics, a G-equivariant morphism G/P_J → G/P_K exists exactly when J ⊆ K; when it exists, it is the canonical projection and is unique.

The group G and its action are fixed throughout the classification. This does not classify flag varieties up to abstract variety isomorphism, or pairs (G,X) allowing G to vary. The action is not required to be faithful. Include G itself as a parabolic, so that G/P_S is a point; P_∅=B. A torus has S empty and only the point as a projective homogeneous space.

## Scope and ownership

This is a consumer roadmap for the classification and its geometric interpretation. It uses existing algebraic-group definitions, not a new matrix-group foundation.

| Supplier | Exact material consumed | Boundary |
| --- | --- | --- |
| [ReductiveGroups, Layers 0–3 and 3A](../ReductiveGroups/README.md) | Hopf/scheme/points and representation dictionaries; closed subgroups, conjugation, stabilizers; represented homogeneous quotients; orbit maps and projective orbit models | General group dictionaries, quotient existence, and general orbit constructions remain there. |
| [ReductiveGroups, Layers 4–7 and 7C](../ReductiveGroups/README.md) | Borel fixed-point theorem and Borel conjugacy; maximal tori; root subgroups and Weyl group; Bruhat decomposition and the algebraic-group Tits system | Constructing the BN-pair, rank-one root maps, root datum and Bruhat coordinates remains there. New proofs of these supplier targets implement that roadmap. |
| Existing `TauCeti.GroupTheory.TitsSystem` theory | Abstract standard-parabolic classification, Bruhat cells and self-normalizers | Reuse these results; do not develop a second Tits-system API. |
| [SchemeAndStackFoundations, Layer 0 and Layer 1](../SchemeAndStackFoundations/README.md) | Schemes, morphism properties, projective space, closed immersions, and faithfully flat descent | Generic projective geometry and descent remain there. |
| [SchubertGeometry, conventions and S1](../SchubertGeometry/README.md) | Comparison with its flag models, universal type-A incidence objects, and Borel/opposition conventions | Schubert schemes, cells, Bott–Samelson geometry, line-bundle cohomology and K-theory are not targets here. |

This roadmap owns the comparison between standard parabolics of the actual group scheme and those of its Tits system; the resulting type classification and conjugacy invariance; the parabolic/projective-homogeneous-space equivalence and its classification application; and the equivariant morphism classification. Reuse any existing proof of an owned comparison and complete its API instead of creating a duplicate theorem hierarchy.

Levi decompositions, central isogeny classification, classification of reductive groups, non-algebraically-closed-field forms, relative schemes parametrizing parabolics, horospherical spaces and general spherical spaces are outside this scope. None is a prerequisite for the results above.

## Conventions and native interfaces

- Keep the hypotheses separate: field, algebraic closedness, characteristic zero, finite type, smoothness, geometric connectedness and reductivity. Do not encode the conclusions in a replacement group structure.
- Use the native finite-type commutative Hopf-algebra model and its scheme/points dictionary. A closed subgroup is represented by a native Hopf ideal. Its geometric inclusion order is opposite to the Hopf-ideal order. An order isomorphism stated on defining ideals therefore uses `OrderDual`.
- Use `HopfIdeal.IsParabolic` and its algebraically closed specialization. In the current native definition, parabolic means smooth and geometrically containing a Borel. Projectivity of the quotient is a theorem, not a redefinition.
- Write G/P for cosets gP with G acting on the left. This is the quotient by right multiplication by P. Mathlib calls these left cosets. Do not confuse this with P\G.
- The chosen B determines the positive system and S. A subset J lists simple roots included in the Levi, rather than omitted roots. Thus J ⊆ K gives P_J ⊆ P_K and a projection G/P_J → G/P_K.
- Identify S with the native subtype of simple reflections in the actual Tits system; prove its comparison with the root-system simple-root index. A chosen representative n_w in N_G(T)(k) is auxiliary data, and formulas must be independent of its choice.
- Use the native fppf homogeneous quotient. The equality (G/P)(k)=G(k)/P(k) is a comparison theorem. Do not identify the quotient sheaf with the pointwise quotient on every k-algebra.
- A homogeneous G-variety means a nonempty smooth separated finite-type k-scheme with a G-action transitive on geometric points. Over the fixed algebraically closed k, finite type and nonemptiness supply a k-point. Establish the quotient-by-stabilizer comparison; transitivity of an abstract action on a set is not a substitute.
- For comparison with SchubertGeometry's B− convention, identify our chosen B with its B− and transport the simple-root labels through its explicit Borel/opposition dictionary. Do not silently reuse labels attached to B+.

## Layer F0: point/subgroup and quotient adapters

### F0.1 Closed subgroups and rational points

For a native closed subgroup H, expose H(k) as a subgroup of the native G(k). Prove compatibility with inclusion, conjugation and identity. Reuse `HopfIdeal.le_of_quotientPointsSubgroup_le` and `HopfIdeal.eq_of_quotientPointsSubgroup_eq` to reflect inclusion and equality under their finite-type and reducedness hypotheses. Obtain reducedness for the closed subgroups here from Cartier smoothness in characteristic zero. Give the resulting order embedding from closed subgroup schemes, ordered by geometric inclusion, to `Subgroup G(k)`.

Do not assert pointwise detection for nonreduced subgroup schemes in positive characteristic. Do not assume that an arbitrary abstract subgroup of G(k) is algebraic.

### F0.2 Native conjugation and quotient comparison

Compare scheme conjugation, Hopf-ideal conjugation and conjugation in `Subgroup G(k)`. State the orientation explicitly and prove identity, inverse and composition laws. Use the existing homogeneous quotient and torsor interfaces to identify its k-points with cosets: a nonempty finite-type fibre over algebraically closed k has a k-point. Prove that this identification commutes with left translation and with subgroup-induced quotient maps.

### F0.3 Homogeneous orbit comparison

For an action as above and x∈X(k), use the native scheme-theoretic stabilizer H=Stab_G(x). Establish finite type and smoothness of H, and that the orbit map identifies X with the represented fppf quotient G/H. Consume ReductiveGroups' homogeneous quotient representability and orbit-map construction. Supply the transitivity-to-local-surjectivity adapter and the orbit-map fibre identity at these hypotheses; use the quotient universal property to obtain an isomorphism, rather than upgrading a bijection on k-points to a scheme isomorphism.

## Layer F1: standard algebraic parabolics and the BN-pair bridge

Inputs are ReductiveGroups Layer 7's actual algebraic-group Tits system on G(k), B(k), N_G(T)(k), its Weyl-group identification, and Layer 7C's rank-one subgroups. Prove the carrier and simple-reflection comparison equalities needed to invoke the existing abstract API.

### F1.1 Algebraic realization

For J⊆S, construct P_J as the smallest closed subgroup scheme containing B and the negative simple-root subgroups U_−α for α∈J. Construct closed generation using the native closed-subgroup/Hopf-ideal operations; prove its minimality and monotonicity. Compare each rank-one generated subgroup with the supplier's minimal parabolic and its two Bruhat cells.

Prove the crucial equality

    P_J(k) = TitsSystem.standardParabolic J.

This equality is a theorem, not a premise in the definition. To avoid a hidden closure gap, use the supplier's Bruhat decomposition and rank-one multiplication to identify the abstract subgroup with

    ⋃_{w∈W_J} B(k) n_w B(k),

and prove that this finite union is closed in G. Use Bruhat closure containment for w∈W_J, deriving it from the supplier's rank-one/root-cell geometry and the subword property if no closedness lemma exists. Reuse SchubertGeometry's closure comparison when it already supplies exactly that theorem; otherwise the finite-union closedness comparison is a target here and does not require its later cohomology theory. The reduced closed subvariety so obtained is a subgroup scheme: descend multiplication and inverse using geometric-point detection for reduced finite-type schemes, including reducedness of the products over the perfect field k. It equals the closed-generated subgroup by minimality.

Prove smoothness via Cartier, containment of B, parabolicity, connectedness, P_∅=B and P_S=G. For connectedness, each generating root subgroup and B is connected; the closed subgroup generated by connected subgroups is connected. Reuse the supplier's closed-generation theorem or prove this specialization here.

### F1.2 Standard classification

Invoke `TauCeti.TitsSystem.standardParabolicOrderIso`. For any closed subgroup Q containing B, classify Q(k) abstractly and recover Q=P_J through F0.1 and F1.1. Export an order isomorphism

    Set S ≃o {Q : closed subgroup schemes of G | B ⊆ Q}.

Give evaluation/inverse lemmas, uniqueness, inclusion reflection, and endpoint lemmas. Show that the inverse selects s precisely when the corresponding minimal parabolic is contained in Q. Prove P_J∩P_K=P_(J∩K); prove that the closed subgroup generated by P_J and P_K is P_(J∪K). Formulate intersections scheme-theoretically, using characteristic-zero smoothness and F0.1 to recover their defining ideals.

## Layer F2: conjugacy classes and intrinsic type

### F2.1 Existence and uniqueness of a standard representative

Use the existing parabolic conjugation theorem to move a Borel contained in P to B, then apply F1.2. Prove uniqueness of the standard representative under G(k)-conjugacy.

The uniqueness argument must include its missing bridge: if gP_Jg⁻¹=P_K, then gBg⁻¹ and B are Borel subgroups of the connected group P_K. They remain Borel in P_K because any larger connected solvable subgroup would contradict maximality in G. Conjugate them inside P_K to modify g to an element normalizing B. Use N_G(B)(k)=B(k) to conclude P_J=P_K and then J=K. Consume the existing abstract self-normalizer theorem through F0 and F1, rather than assuming normality of B in P_K.

Define the type of a parabolic as its unique standard label and prove invariance under conjugation, together with the converse: equal types imply conjugacy. Export the equivalence between subsets of S and G(k)-conjugacy classes of parabolic subgroup schemes.

### F2.2 Normalizers

Use `TauCeti.TitsSystem.normalizer_standardParabolic` for the pointwise theorem. Obtain N_G(P)=P as subgroup schemes via the native normalizer representability and characteristic-zero reducedness. Do the same for B. Keep the scheme-level theorem distinct from its k-point consequence. These comparisons belong to ReductiveGroups' normalizer API; use them here for equivariant uniqueness.

## Layer F3: projectivity and the homogeneous-space dictionary

### F3.1 Containing a Borel implies projectivity

For a closed subgroup H containing B, use ReductiveGroups Layer 3's represented quotient G/H. Apply its Chevalley projective-orbit construction: choose a finite-dimensional rational representation and a line whose scheme-theoretic stabilizer is H, identifying G/H with its locally closed orbit in projective space.

Prove this orbit is closed using the complete-quotient argument: first construct complete G/B via the supplier's Borel orbit/normalizer theorem (Humphreys §23.3), then descend G/B→G/H and prove it surjective. Properness descends along this surjection to the separated finite-type target G/H. A proper locally closed immersion into projective space is closed, so the Chevalley model is projective.

The dependency on complete G/B is explicit: implement the complete Borel-quotient theorem at ReductiveGroups Layers 3A/7 if absent, using its projective orbit and Borel normalizer construction, independently of F3's parabolic/projective equivalence. Neither the classification of projective homogeneous spaces nor Schubert cohomology is an input. Reuse an existing projective flag model through its quotient universal property instead of constructing another flag scheme.

### F3.2 Projectivity implies containing a Borel

If G/H is projective, apply Borel fixed point to the left B-action. Lift the resulting point to g∈G(k) by F0.2. Its stabilizer condition says g⁻¹Bg⊆H. Express this as containment of subgroup schemes by F0.1. H is smooth in characteristic zero, so it is parabolic in the native definition.

Export equivalence of: H parabolic; G/H proper over k; G/H projective over k. The proper-to-parabolic proof uses the complete-scheme form of Borel fixed point, and the parabolic-to-projective proof above supplies the stronger conclusion. Do not use proper ⇒ projective for general schemes.

### F3.3 Classification of projective homogeneous G-varieties

For nonempty projective homogeneous X choose x∈X(k), apply F0.3, F3.2 and F2.1, and obtain a G-equivariant k-isomorphism X≅G/P_J with unique J. Prove independence of x: stabilizers of two points are conjugate. Give both directions of the classification, including the construction of the G-action, smoothness, projectivity and geometric transitivity on each G/P_J.

Do not construct a type of all varieties in a fixed universe merely to express a bijection. An existence-and-uniqueness theorem for each X, plus the comparison theorem G/P_J≅_G G/P_K iff J=K, states the classification without unnecessary size infrastructure.

## Layer F4: equivariant morphisms and projections

### F4.1 Evaluation at the base point

For closed subgroups P,Q, prove that evaluation at eP identifies G-equivariant scheme morphisms G/P→G/Q with P-fixed k-points of G/Q. A point gQ is fixed exactly when g⁻¹Pg⊆Q as subgroup schemes. Establish the equivariant descent construction for the converse and independence of the representative g. This is a scheme-morphism statement, not just the classification of equivariant functions on rational points.

### F4.2 Standard parabolics

For P_J,P_K show a fixed coset exists iff J⊆K and is then eP_K. Use B⊆P_J, and show that the only B-fixed point of G/P_K is eP_K: if g⁻¹Bg⊆P_K, conjugate this Borel to B inside connected P_K and use N_G(B)=B. Conclude uniqueness of every equivariant morphism and identify it with the subgroup-induced projection.

Export identity and composition of the projections, and the equivalence G/P_J≅_G G/P_K iff J=K. In particular every G-equivariant automorphism of G/P_J is the identity. This makes no assertion about the full automorphism group of the underlying variety.

## Layer F5: concrete classification checks

Reuse existing group and incidence models; build comparison isomorphisms and classification applications rather than new Grassmannian or flag constructions.

1. Torus: S=∅, B=G, P_∅=G, and the only projective homogeneous G-variety is a point.
2. SL₂: S has one element; the two spaces are SL₂/B≅P¹ and a point. Identify the action and stabilizer in the existing line model.
3. GL_n: use the upper-triangular Borel stabilizing the standard ascending coordinate flag. For J⊆{1,…,n−1}, the retained dimensions of the partial flag are the complement D={1,…,n−1}\J. Prove that P_J is the stabilizer of that partial flag. Compare the quotient with the existing incidence scheme and its tautological subspaces. Include n=1, full flags, the point, and Grassmannians.
4. GL₃: list the four types ∅,{s₁},{s₂},S. They give the full flag, the dimension-2 Grassmannian, the dimension-1 Grassmannian, and a point, respectively. The two projective-plane models are not GL₃-equivariantly isomorphic although their underlying varieties are isomorphic. Recover exactly the forgetful projection maps allowed by inclusion.

## References and proof route

Primary reference: J. E. Humphreys, *Linear Algebraic Groups*, Graduate Texts in Mathematics 21, Springer. Use section numbers rather than edition-dependent page numbers.

- §§11–12: Chevalley's representation/stabilizer construction and homogeneous quotients.
- §17.6 and §19: Lie–Kolchin and connected solvable groups; consume their existing formalizations.
- §§21–23, especially §§21.2–21.3 and §23.3: Borel fixed point, conjugacy, normalizers and G/B.
- §§24–28: tori, roots, rank-one structure and Bruhat decomposition; supplier ReductiveGroups.
- §§29.1–29.3: Tits systems, Bruhat cells and abstract parabolics; consume the native TitsSystem API.
- §30.1: standard algebraic parabolics and the classification comparison.

The intended path is the classical algebraic route, not classification of reductive groups by root data and not complex Lie-group classification. Milne, *Algebraic Groups* (2017), and Conrad's reductive-group notes are supporting references for the existing scheme/Hopf and dynamic interfaces. Humphreys supplies the mathematical proof strategy; the native Tau Ceti interfaces determine how it is expressed in Lean.
