# Roadmap: classification of parabolic subgroups and projective homogeneous spaces

**Summary.** Fix an algebraically closed field k and a smooth connected affine reductive group G of finite type over k. Fix a Borel subgroup B and a maximal torus T contained in B. Write W=N_G(T)/T and S for the simple reflections determined by B.

Construct standard algebraic parabolic subgroups P_J, indexed by subsets J of S, and prove:

1. J ↦ P_J is an order isomorphism from subsets of S to smooth closed subgroup schemes of G containing B; in characteristic zero, to all closed subgroup schemes containing B.
2. Every parabolic subgroup of G is conjugate under G(k) to exactly one P_J.
3. The represented homogeneous quotient G/H is projective if and only if H is parabolic, for every smooth closed subgroup scheme H of G; in characteristic zero, for every closed subgroup scheme H of G.
4. Every nonempty projective homogeneous G-variety with smooth scheme-theoretic stabilizers is G-equivariantly isomorphic to exactly one G/P_J.
5. For standard parabolics, a G-equivariant morphism G/P_J → G/P_K exists exactly when J ⊆ K; when it exists, it is the canonical projection and is unique.

The group G and its action are fixed throughout the classification. This does not classify flag varieties up to abstract variety isomorphism, or pairs (G,X) allowing G to vary. The action is not required to be faithful. Include G itself as a parabolic, so that G/P_S is a point; P_∅=B. A torus has S empty and only the point as a projective homogeneous space.

## Scope and ownership

This is a consumer roadmap for the classification and its geometric interpretation. It uses existing algebraic-group definitions, not a new matrix-group foundation.

ReductiveGroups 7/7b owns the Tits system on `G(k)`, Bruhat decomposition and the general bridge to abstract standard parabolics. FlagVarieties owns the five headline classifications. The pointwise normalizer suffices; no scheme-theoretic normalizer is needed. ReductiveGroups 7C.5 owns type-A block maps.

The uniqueness half of the second headline holds for every smooth connected affine group over algebraically closed `k`; `conjugate_eq_of_borel_le` in `Suggested.lean` uses only geometric connectedness of the ambient finite-type group.

Headline 3 and §§4.1–4.2 hold for every smooth connected affine group over algebraically closed `k` (Milne Theorem 17.16, p.356); `isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed` is stated at that generality.

Realize `G/H` by `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`). This roadmap proves properness from Borel containment and then projectivity: the orbit scheme is locally closed in projective space, and properness makes that immersion closed.

Levi decompositions, central isogeny classification, classification of reductive groups, non-algebraically-closed-field forms, relative schemes parametrizing parabolics, horospherical spaces and general spherical spaces are outside this scope. None is a prerequisite for the results above.

## Conventions

- Keep the hypotheses separate: field, algebraic closedness, finite type, smoothness, geometric connectedness and reductivity. Do not encode the conclusions in a replacement group structure.
- Use the native finite-type commutative Hopf-algebra model and its scheme/points dictionary. A closed subgroup is represented by a native Hopf ideal. Its geometric inclusion order is opposite to the Hopf-ideal order. An order isomorphism stated on defining ideals therefore uses `OrderDual`.
- Use `HopfIdeal.IsParabolicOverAlgClosed`, which includes smoothness and containment of a Borel. It is defined in `Algebra/AlgebraicGroup/Parabolic/Basic.lean`. Projectivity of the quotient is a theorem, not a redefinition.
- Write G/P for cosets gP with G acting on the left. This is the quotient by right multiplication by P. Mathlib calls these left cosets. Do not confuse this with P\G.
- The chosen B determines the positive system and S. A subset J lists simple roots included in the Levi, rather than omitted roots. Thus J ⊆ K gives P_J ⊆ P_K and a projection G/P_J → G/P_K.
- Identify S with the native subtype of simple reflections in the actual Tits system; prove its comparison with the root-system simple-root index. A chosen representative n_w in N_G(T)(k) is auxiliary data, and formulas must be independent of its choice.
- Use the native fppf homogeneous quotient. The equality (G/P)(k)=G(k)/P(k) is a comparison theorem. Do not identify the quotient sheaf with the pointwise quotient on every k-algebra.
- A homogeneous G-variety means a nonempty smooth separated finite-type k-scheme with a G-action transitive on geometric points. Over the fixed algebraically closed k, finite type and nonemptiness supply a k-point. Establish the quotient-by-stabilizer comparison; transitivity of an abstract action on a set is not a substitute.
- For comparison with SchubertGeometry's B− convention, identify our chosen B with its B− and transport the simple-root labels through its explicit Borel/opposition dictionary. Do not silently reuse labels attached to B+.

## Exact supplier contracts

| Consumed result | Owner roadmap and layer | Exact pinned declaration and file, or gap slug below |
| --- | --- | --- |
| Borel predicate and conjugacy; a parabolic has a conjugate containing the chosen Borel | Tau Ceti | `HopfIdeal.IsBorelOverAlgClosed`, `Algebra/AlgebraicGroup/Borel/Basic.lean`; `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`, `Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`; `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le`, `Algebra/AlgebraicGroup/Parabolic/Basic.lean` |
| Smooth parabolic predicate | Tau Ceti | `HopfIdeal.IsParabolicOverAlgClosed`, `Algebra/AlgebraicGroup/Parabolic/Basic.lean` |
| Reduced finite-type point separation | Tau Ceti | `HopfIdeal.eq_of_quotientPointsSubgroup_eq`, `Algebra/AlgebraicGroup/HopfIdeal/Points/Separation.lean` |
| Hopf ideal conjugation, identity, inverse, composition, point comparison | Tau Ceti | `HopfIdeal.conjugate`, `HopfIdeal.conjugate_one`, `CommHopfAlgCat.pointConjugation_mem_conjugate_iff`, `Algebra/AlgebraicGroup/HopfIdeal/Conjugation.lean` |
| Abstract Tits systems, parabolics and Borel pointwise normalizer | Tau Ceti | `TitsSystem`, `GroupTheory/TitsSystem/Basic.lean`; `TitsSystem.standardParabolicOrderIso`, `TitsSystem.standardParabolic_eq_of_subgroupB_le`, `GroupTheory/TitsSystem/Parabolic/Classification.lean`; `TitsSystem.normalizer_subgroupB`, `GroupTheory/TitsSystem/Parabolic/Normalizer.lean` |
| Actual `G(k)` Tits system and standard algebraic parabolics | ReductiveGroups 7/7b | `gap:tits-system-of-points`, `gap:standard-parabolic-scheme` |
| GL Tits system, weight ideal, block-triangular points, standard-parabolic comparison and parabolicity | Tau Ceti | `glTitsSystem`, `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean`; `GeneralLinear.weightParabolicDefiningHopfIdeal`, `GeneralLinear.mem_weightParabolicPoints_iff`, `GeneralLinear.mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular`, `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean`; `GeneralLinear.standardParabolic_weightParabolicSimple`, `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/TitsSystem.lean`; `GeneralLinear.isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal`, `GeneralLinear.weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal`, `Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Borel.lean` |
| Represented homogeneous quotient, torsor and projective orbit | Tau Ceti | `CommHopfAlgCat.fppfHomogeneousQuotient`, `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv`, `Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean`; `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`, `Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`; `Comodule.projectiveOrbitι`, `Comodule.projectiveOrbitToSpec`, `Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Scheme.lean` |
| Orbit maps and scheme stabilizers | ReductiveGroups 3A.1 | Consume the orbit maps and stabilizers as scheme fibres; 0.3 proves the quotient-by-stabilizer isomorphism. |
| Complete `G/B` | ReductiveGroups 7 | `gap:complete-borel-quotient` |
| Projective Borel fixed point and comodule corestriction | Tau Ceti | `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable`, `Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean`; `Comodule.Corestrict`, `Algebra/Coalgebra/Comodule/Corestrict.lean` |
| Type-A block maps and incidence | ReductiveGroups 7C.5; SchubertGeometry S1–S2.3 | Consume the named block maps and incidence work of those roadmaps. |
| Scheme descent and morphism properties | SchemeAndStackFoundations 0–1 | The quotient universal property and descent required in Layers 0, 4 and 5. |
| Cartier smoothness in characteristic zero | Tau Ceti | `TauCeti.smoothCommHopfAlgProperty_of_charZero`, `Algebra/AlgebraicGroup/Smooth/CharZero.lean:148` |

### From TauCetiRoadmap.ReductiveGroups

What ReductiveGroups must provide (gap:tits-system-of-points): the Tits system on `G(k)` with `subgroupB = B(k)`, `subgroupN = N_G(T)(k)` and simple set the simple reflections of the root system of `(G,T)`, for `G` smooth connected reductive and `T ⊆ B`.

What ReductiveGroups must provide (gap:standard-parabolic-scheme): for `J` a set of simple reflections, the smallest closed subgroup scheme `P_J` containing `B` and the root subgroups `U_{−α}`, `α ∈ J`, with `P_J(k) = B(k) W_J B(k)`, smooth, connected, `P_∅ = B`, `P_S = G`.

What ReductiveGroups must provide (gap:complete-borel-quotient): `G/B` is proper over `k` for a Borel `B` of a smooth connected affine `G` (Milne Theorem 17.9(a), p.354).

## How to read the build

Layers 0–1 establish the point, quotient and general-linear interfaces; Layer 2 constructs and classifies standard parabolics; Layer 3 classifies their conjugacy types and normalizers; Layers 4–5 classify projective homogeneous spaces and equivariant maps; Layer 6 checks the resulting classifications against concrete models.

## Layer 0: point/subgroup and quotient adapters

### 0.1 Closed subgroups and rational points

For a native closed subgroup H, expose H(k) as a subgroup of the native G(k). Prove compatibility with inclusion, conjugation and identity. Reuse `HopfIdeal.le_of_quotientPointsSubgroup_le` and `HopfIdeal.eq_of_quotientPointsSubgroup_eq` to reflect inclusion and equality under their finite-type and reducedness hypotheses. Smooth parabolics are reduced in any characteristic. `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`) supplies Cartier smoothness for arbitrary closed subgroup schemes in characteristic zero. Give the resulting order embedding from reduced closed subgroup schemes, ordered by geometric inclusion, to `Subgroup G(k)`.

**Checks.**

- `μ_p` has the same geometric points as its reduction in characteristic `p`, so point equality cannot recover its ideal.
- Over `k = 𝔽̄₂`, `B(k) ⊊ P_{s₁}(k)`, because `1 + E₂₁` lies in `P_{s₁}(k)` and not in `B(k)`.
- Negative control: `B(𝔽₂) = U(𝔽₂)`, of order 8, although `U ⊊ B`; points over a non-closed field do not detect subgroups.
- A nonreduced ideal defining the Frobenius inverse image of `B` has the points of `B` but is not detected by the order embedding.

Do not assert pointwise detection for nonreduced subgroup schemes in positive characteristic. Do not assume that an arbitrary abstract subgroup of G(k) is algebraic.

*Needs:* native point-separation, smoothness and Cartier only for the characteristic-zero corollary.

### 0.2 Native conjugation and quotient comparison

Compare scheme conjugation, Hopf-ideal conjugation and conjugation in `Subgroup G(k)`. State the orientation explicitly and cite the existing identity, inverse and composition laws in `HopfIdeal/Conjugation.lean`. Use the existing homogeneous quotient and torsor interfaces to identify its k-points with cosets: a nonempty finite-type fibre over algebraically closed k has a k-point. Prove that this identification commutes with left translation and with subgroup-induced quotient maps.

For closed subgroups `N ⊆ N′`, construct the morphism `G/N → G/N′` of representing schemes from `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv` and the quotient universal property (Milne Proposition 5.22, p.104).

*Needs:* `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`), `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv` (`Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean`), native quotient and torsor interfaces, existing conjugation laws, SchemeAndStackFoundations Layer 1 descent.

### 0.3 Homogeneous orbit comparison

For an action as above, x∈X(k), and the native scheme-theoretic stabilizer H=Stab_G(x), assume H smooth. Establish that H is of finite type and that the orbit map identifies X with the represented fppf quotient G/H. Consume pinned homogeneous quotient representability and ReductiveGroups' scheme orbit-map construction. Supply the transitivity-to-local-surjectivity adapter and the orbit-map fibre identity at these hypotheses; use the quotient universal property to obtain an isomorphism, rather than upgrading a bijection on k-points to a scheme isomorphism.

**Checks.**

- A torus acting on a point is included.
- `Gₘ` acting on itself is homogeneous but nonprojective.
- A dual-number thickening is excluded by smoothness.
- A Frobenius-twisted `SL₂` action on `ℙ¹` is homogeneous in the sense of the Conventions, but its stabilizer `F⁻¹(B)`, with ideal `(c^p)`, is not smooth. It is excluded by the smooth-stabilizer hypothesis, and it is not G-isomorphic to any `G/P_J`.
- `SL_p` acting on `PGL_p` in characteristic `p` has stabilizer `μ_p` (Milne Remark 7.14, p.142).

*Needs:* ReductiveGroups 3A.1 orbit maps and scheme stabilizers; `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`); SchemeAndStackFoundations Layer 1 descent.

### Examples

The point of a torus and the nonprojective homogeneous space `Gₘ/1` separate homogeneity from projectivity.

### Dependencies

Native Hopf-ideal points and conjugation; ReductiveGroups Layers 3 and 3A quotient and orbit contracts; SchemeAndStackFoundations descent.

## Layer 1: the GL case

### 1.1 Classification by block weights

For algebraically closed `k`, every reduced Hopf ideal `I ≤ GeneralLinear.UpperTriangular.definingHopfIdeal k (n+1)` of `GeneralLinear.coordinateHopfAlgebra k (n+1)` equals `GeneralLinear.weightParabolicDefiningHopfIdeal k (standardWeight J)` for exactly one `J : Finset (Fin n)`. Here `standardWeight J (i) = −#{j : Fin n | j < i ∧ j ∉ J}`. This layer owns the definition `standardWeight` and theorem `exists_unique_standardWeight_eq` in `Suggested.lean`, as well as the resulting order isomorphism with `OrderDual` on ideals. The retained flag dimensions are `{j+1 : j ∈ Fin n, j ∉ J}`; the index `j` corresponds to the simple reflection `s_{j+1}` of 2.1 and 6.1.

The block-triangular points, the comparison with the `glTitsSystem` standard parabolic, and parabolicity are pinned (the names and files in the supplier table). This layer proves three things:

- That `standardWeight J` is antitone, with equal adjacent weights exactly at the indices in `J`, so that `weightParabolicSimple` of `standardWeight J` corresponds to `J`.
- That `Q(k)` is classified by `standardParabolic_eq_of_subgroupB_le`, and the ideal is recovered by `HopfIdeal.eq_of_quotientPointsSubgroup_eq`.
- That the label is unique.

Give `standardWeight` the following API:

- It is antitone.
- Adjacent weights are equal exactly at `J`.
- `standardWeight ∅` is strictly decreasing.
- `standardWeight univ = 0`.

**Checks.**

- `standardWeight ∅` and `UpperTriangular.weights 3 = (2,1,0)` define the same ideal although their weight vectors differ.
- At `n=0`, `standardWeight` is the single zero weight.
- Distinct `J` and `J′` forbid different adjacent matrix entries, so their weight ideals differ.

*Needs:* pinned weight ideal and upper-triangular ideal; `GeneralLinear.mem_weightParabolicPoints_iff` and `GeneralLinear.mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean`); `GeneralLinear.standardParabolic_weightParabolicSimple` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/TitsSystem.lean`); `GeneralLinear.isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` and `GeneralLinear.weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Borel.lean`); pinned point separation; `TitsSystem.standardParabolicOrderIso` / `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`).

### Examples

For `n=2`, the weights for `∅`, `{0}`, `{1}` and `Finset.univ` are `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)` and `(0,0,0)`.

### Dependencies

Pinned general-linear weight and upper-triangular ideals; `GeneralLinear.mem_weightParabolicPoints_iff` and `GeneralLinear.mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean`); `GeneralLinear.standardParabolic_weightParabolicSimple` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/TitsSystem.lean`); `GeneralLinear.isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` and `GeneralLinear.weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Borel.lean`); reduced point separation; `TitsSystem.standardParabolicOrderIso` / `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`).

## Layer 2: standard algebraic parabolics and the BN-pair bridge

Inputs are ReductiveGroups Layer 7's actual algebraic-group Tits system on G(k), B(k), N_G(T)(k), its Weyl-group identification, and Layer 7C's rank-one subgroups. Prove the carrier and simple-reflection comparison equalities needed to invoke the abstract API `TitsSystem.standardParabolicOrderIso` / `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`).

### 2.1 Algebraic realization

Consume ReductiveGroups 7/7b's construction of P_J as the smallest closed subgroup scheme containing B and the negative simple-root subgroups U_−α for α∈J. Use its closed-generation, minimality and monotonicity lemmas. Compare each rank-one generated subgroup with the supplier's minimal parabolic and its two Bruhat cells.

Consume the crucial supplier equality

    P_J(k) = B(k) W_J B(k).

This is the theorem supplied by `gap:standard-parabolic-scheme`; its proof uses constructibility of the finite Bruhat-cell union to establish closedness.

Consume smoothness in any characteristic, containment of B, parabolicity, connectedness, P_∅=B and P_S=G from ReductiveGroups 7/7b. For connectedness, the supplier uses connectedness of each generating root subgroup and B and its closed-generation theorem.

**Checks.**

- `P_∅=B`.
- `P_S=G`.
- In `GL₃`, `{s₁}` retains the plane and `{s₂}` the line.
- Over `𝔽₂` the four point groups have orders `8,24,24,168`, unlike the Weyl parabolics of orders `1,2,2,6`.
- In characteristic `p`, `F⁻¹(B) ⊆ SL₂` contains `B`, has the points of `B`, and is no `P_J`; it is excluded by smoothness.

*Needs:* `gap:standard-parabolic-scheme`, ReductiveGroups 7/7b Bruhat and root-cell inputs, 0.1.

### 2.2 Standard classification

Consume `TitsSystem.standardParabolicOrderIso` and `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`) and `gap:standard-parabolic-scheme`. For any smooth closed subgroup `Q` containing `B` (any closed subgroup in characteristic zero, by `TauCeti.smoothCommHopfAlgProperty_of_charZero`), classify `Q(k)` abstractly and recover `Q=P_J` through 0.1 and 2.1; invoke `HopfIdeal.eq_of_quotientPointsSubgroup_eq` with the reducedness of both quotient coordinate rings. Export an order isomorphism

    Set S ≃o {Q : smooth closed subgroup scheme of G | B ⊆ Q}.

Give evaluation/inverse lemmas, uniqueness, inclusion reflection, and endpoint lemmas. Show that the inverse selects s precisely when the corresponding minimal parabolic is contained in Q. Prove P_J∩P_K=P_(J∩K); prove that the closed subgroup generated by P_J and P_K is P_(J∪K). Formulate intersections scheme-theoretically in all characteristics, using the smooth connected intersection theorem of ReductiveGroups 7b and 0.1 to recover their defining ideals.

*Needs:* 2.1, `TitsSystem.standardParabolicOrderIso` / `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`), 0.1.

### Examples

`P_∅=B`, `P_S=G`; in `GL₃`, the two singleton labels retain a plane and a line respectively.

### Dependencies

ReductiveGroups 7/7b supplies the actual Tits system, Bruhat/root cells and scheme bridge; `TitsSystem.standardParabolicOrderIso` / `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`) supplies abstract classification; Layer 0 supplies point separation.

## Layer 3: conjugacy classes and intrinsic type

### 3.1 Existence and uniqueness of a standard representative

By `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`), P has a conjugate containing B; apply 2.2. Prove uniqueness of the standard representative under G(k)-conjugacy.

The uniqueness argument must include its missing bridge: if gP_Jg⁻¹=P_K, then gBg⁻¹ and B are Borel subgroups of the connected group P_K. They remain Borel in P_K because any larger connected solvable subgroup would contradict maximality in G. Conjugate them inside `P_K` by `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`) applied to `P_K`, modifying g to an element normalizing B. Derive the pointwise equality N_G(B)(k)=B(k) from `gap:tits-system-of-points` and `TitsSystem.normalizer_subgroupB` (`GroupTheory/TitsSystem/Parabolic/Normalizer.lean`), and use it to conclude P_J=P_K and then J=K.

Define the type of a parabolic as its unique standard label, with the following API:

- It is invariant under conjugation.
- Equal types imply conjugacy.

Export the equivalence between subsets of S and G(k)-conjugacy classes of parabolic subgroup schemes.

**Checks.**

- Conjugation by `[[1,0,0],[1,1,0],[0,1,1]]` sends the stabilizer of `⟨e₁⟩` to that of `⟨e₁+e₂⟩`; in characteristic 2 its inverse sends it to that of `⟨e₁+e₂+e₃⟩`, so the two directions differ.
- Conjugate parabolics have equal type.
- Line and plane types in `GL₃` differ despite abstractly isomorphic projective planes.
- Only forgetful projections with `J⊆K` exist.

*Needs:* 2.2, `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`), `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`), `gap:tits-system-of-points` and `TitsSystem.normalizer_subgroupB` (`GroupTheory/TitsSystem/Parabolic/Normalizer.lean`).

### 3.2 Pointwise normalizers

For `g ∈ G(k)` with `gP_Jg⁻¹ = P_J`, the bridge of §3.1 with `K = J` gives `g ∈ P_J(k)` (Milne Corollary 17.49, p.367); transport this pointwise self-normalization under conjugation. No normalizer subgroup scheme is required.

*Needs:* 3.1.

### Examples

In `GL₃`, the two maximal proper standard parabolics have equal dimension but distinct types.

### Dependencies

Layer 2 classification, `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`), and `gap:tits-system-of-points` with `TitsSystem.normalizer_subgroupB` (`GroupTheory/TitsSystem/Parabolic/Normalizer.lean`).

## Layer 4: projectivity and the homogeneous-space dictionary

### 4.1 Containing a Borel implies properness

For a closed subgroup `H` containing `B`, use `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`) to realize `G/H` as a projective orbit scheme. The complete `G/B` from `gap:complete-borel-quotient` maps surjectively to the separated finite-type `G/H`; properness descends along this map. This proves that Borel containment implies `G/H` proper (Milne Theorem 17.16, p.356).

The orbit immersion `Comodule.projectiveOrbitι` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Scheme.lean`) is locally closed in `P(M)`. Since the orbit scheme is proper over `k` and projective space is separated, the immersion is proper and hence closed. Thus `G/H` is projective. This proves the projective direction of headline 3 using the same quotient realization.

The completeness of `G/B` is supplied independently of this layer's equivalence, by Milne Theorem 17.9(a), p.354, and Humphreys §21.3. Neither the classification of projective homogeneous spaces nor Schubert cohomology is an input.

*Needs:* `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`), `Comodule.projectiveOrbitι` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Scheme.lean`), `gap:complete-borel-quotient` and 0.2's subgroup-induced morphism.

### 4.2 Projectivity implies containing a Borel

If the represented G/H is proper, its orbit scheme has nonempty closed image in P(M) by 4.1. This image is G(k)-stable, hence B(k)-stable. Corestrict M along O(G) → O(B) with `Comodule.Corestrict` (`Algebra/Coalgebra/Comodule/Corestrict.lean`), and apply `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean`) to obtain a B(k)-fixed closed point of the orbit. Lift the resulting point to g∈G(k) by 0.2. Its stabilizer condition says g⁻¹B(k)g⊆H(k). Express this as containment g⁻¹Bg⊆H of subgroup schemes by 0.1. H is smooth by hypothesis; in characteristic zero Cartier supplies this hypothesis for every closed subgroup scheme, so it is parabolic in the native definition.

Export `isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed` in `Suggested.lean` as “H parabolic ⇔ G/H proper”, and extend it to the equivalence of: H parabolic; G/H proper over k; G/H projective over k. Properness of the orbit scheme makes its immersion into P(M) closed (4.1), and the pinned projective Borel fixed-point theorem applies to the corestricted B-action. Headline 3 and §§4.1–4.2 hold for every smooth connected affine group over algebraically closed `k` (Milne Theorem 17.16, p.356); `isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed` is stated at that generality.

*Needs:* `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean`), `Comodule.Corestrict` (`Algebra/Coalgebra/Comodule/Corestrict.lean`), 0.1–0.2 and 4.1.

### 4.3 Classification of projective homogeneous G-varieties

For nonempty projective homogeneous X choose x∈X(k), apply 0.3, 4.2 and 3.1, and obtain a G-equivariant k-isomorphism X≅G/P_J with unique J. Prove independence of x: stabilizers of two points are conjugate. Give both directions of the classification, including the construction of the G-action, smoothness, projectivity and geometric transitivity on each G/P_J.

Do not construct a type of all varieties in a fixed universe merely to express a bijection. An existence-and-uniqueness theorem for each X, plus the comparison theorem G/P_J≅_G G/P_K iff J=K, states the classification without unnecessary size infrastructure.

*Needs:* 0.3, 3.1 and 4.2.

### Examples

For `SL₂`, `G/B ≅ ℙ¹` is projective while `G/T` is not proper; `G/G` is a point.

### Dependencies

Layer 0 quotient and orbit comparison, Layer 3 type classification, ReductiveGroups 7 complete `G/B`, the pinned projective fixed-point theorem `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean`), `Comodule.Corestrict` (`Algebra/Coalgebra/Comodule/Corestrict.lean`), and the pinned projective-orbit immersion (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Scheme.lean`).

## Layer 5: equivariant morphisms and projections

### 5.1 Evaluation at the base point

For closed subgroups P,Q, prove that evaluation at eP identifies G-equivariant scheme morphisms G/P→G/Q with P-fixed k-points of G/Q. A point gQ is fixed exactly when g⁻¹Pg⊆Q as subgroup schemes. Reuse 0.2's subgroup-induced morphism in the equivariant descent construction for the converse, and prove independence of the representative g. This is a scheme-morphism statement, not just the classification of equivariant functions on rational points.

*Needs:* 0.2, scheme-level quotient descent and the stabilizer fixed-point criterion.

### 5.2 Standard parabolics

For P_J,P_K show a fixed coset exists iff J⊆K and is then eP_K. Use B⊆P_J, and show that the only B-fixed point of G/P_K is eP_K: if g⁻¹Bg⊆P_K, conjugate this Borel to B inside connected P_K and use N_G(B)=B. Conclude uniqueness of every equivariant morphism and identify it with 0.2's subgroup-induced projection.

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

There are no downstream roadmap consumers. ReductiveGroups 7C.5 and SchubertGeometry S1 supply the type-A block and incidence comparisons used here.

## References

Primary reference: J. E. Humphreys, *Linear Algebraic Groups*, Graduate Texts in Mathematics 21, Springer. Use section numbers rather than edition-dependent page numbers.

- §§11–12: Chevalley's representation/stabilizer construction and homogeneous quotients.
- §17.6 and §19: Lie–Kolchin and connected solvable groups; consume their existing formalizations.
- §§21–23, especially §§21.2–21.3 and §23.3: Borel fixed point, conjugacy, normalizers and G/B.
- §§24–28: tori, roots, rank-one structure and Bruhat decomposition; supplier ReductiveGroups.
- §§29.1–29.3: Tits systems, Bruhat cells and abstract parabolics; consume the native TitsSystem API.
- §30.1: standard algebraic parabolics and the classification comparison.

The intended path is the classical algebraic route, not classification of reductive groups by root data and not complex Lie-group classification. Milne, *Algebraic Groups* (2017), and Conrad–Feng, *Reductive Groups over Fields* (2020 version), are supporting references for the existing scheme/Hopf and dynamic interfaces. Humphreys supplies the mathematical proof strategy; the native Tau Ceti interfaces determine how it is expressed in Lean.

### Claim-local locators

Layer 0.3 uses Milne (2017), §7.e and Propositions 7.11 and 7.15, printed pp.141–143, for the orbit-to-quotient isomorphism and fibre comparison. Layer 2.1 uses Humphreys §§29.1–29.3 for BN-pairs and Bruhat cells. Layer 2.2 uses Humphreys §30.1 and Milne Theorem 21.91, pp.453–454, for smooth standard parabolics in arbitrary characteristic; its scheme-theoretic intersection equality holds in every characteristic by ReductiveGroups 7b's smooth connected intersection theorem. Layer 3.1 uses Milne Theorem 17.9(b), p.354, for Borel conjugacy, Milne Theorem 21.91, p.453, for uniqueness of standard type, and Conrad–Feng (2020), Appendix T.1, p.305, as a statement reference. Layer 3.2 uses Milne Corollary 17.49, p.367, for pointwise self-normalization. Layer 4.1 uses Milne Theorem 17.9(a), p.354, and Humphreys §21.3 for complete `G/B`. Layer 5.1 uses Milne Proposition 5.22, p.104, with the quotient universal property. Humphreys is cited by locator only (uncertified).
