# Roadmap: p-adic Hodge theory and geometric comparison, Part II — generic crystalline monodromy

**Summary.** This roadmap proves, for an arbitrary connected reductive group G over Q_p, a decent b ∈ G(Q̆_p) with [b] ∈ B(G,μ) and a point η of the flag variety Fl_μ over a finite extension of Q̆_p lying over the generic point of Fl_μ, that every filtered isocrystal of (b, η) is weakly admissible, and that when (b, μ) is moreover Hodge–Newton irreducible the resulting crystalline Galois representation has image meeting G_der(Q_p) in an open subgroup; every Hodge–Newton irreducible pair therefore has a crystalline period point with open derived image (Gleason–Lim–Xu, Theorem 5.8 and Proposition 5.9). It is built from the rational period theory of PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory, the isocrystal and B(G) theory of VectorBundlesAndIsocrystals and BunGAndNewtonStrata, the reductive-group theory of ReductiveGroups and ReductiveGroupsPartII, the period towers of HeckeStacksAndLocalShtukas, and the diamonds and locally profinite torsors of DiamondsAndVStacks. The route runs through a decent fibre functor over a finite unramified field and Chen's coefficient-line description of the crystalline monodromy group (Layer 0), generic filtrations and Hodge–Newton estimates on highest weights (Layer 1), generic weak admissibility and derived monodromy (Layer 2), generic period points, the open-image point and its z-extension comparison (Layer 3), and the stabilizers of components of compact-image period torsors (Layer 4).

PadicHodgeTheory stops at the group-valued period torsor and its neutrality (§5.5) and at Sen theory for p-adic representations (§4.4). For a weakly admissible pair (b, μ) over a finite extension of Q̆_p with [b] ∈ B(G,{μ}) it constructs a crystalline representation ξ: Γ_K → G(Q_p), unique up to conjugacy. It has no algebraic monodromy group of ξ, no generic filtration, and no comparison between the Hodge–Newton geometry of (b, μ) and the size of ξ(Γ_K); this Part II supplies them.

The headline theorems are generic admissibility (§2.3, GLX26 Theorem 5.8(1)), generic derived monodromy (§2.4, GLX26 Theorem 5.8(2)), the crystalline period point with open derived image (§3.2, GLX26 Proposition 5.9), its comparison along z-extensions (§3.5) and the stabilizers of components of compact-image period torsors (§§4.1–4.2). [Suggested.lean](Suggested.lean) is not the roadmap; it states none of them, and its module docstring records why: each concerns carriers absent from the pinned Mathlib and Tau Ceti. These are the set B(G) of σ-conjugacy classes with its Newton and Kottwitz invariants and acceptable subsets B(G, μ), filtered isocrystals with G-structure over finite extensions of Q̆_p and their weak admissibility, crystalline representations with G-structure, the flag variety Fl_μ and its generic point, the admissible locus of the B_dR-Grassmannian, and locally profinite torsors over the diamond Spd K.

## Scope and ownership

This roadmap owns, layer by layer:

- Layer 0: the filtration jump of a nonzero vector, the full-period Frobenius degree sum, the sets `V^{s,k}_{b,μ}`, the decent fibre functor ω_s and its tensor group H_cris,s, rank-one coefficient objects, Chen's invariant-line criterion, and the Tannakian description, connectedness and period comparison of the full monodromy group (GLX26 §5.1; Chen14 §§3.1–3.3).
- Layer 1: generic filtrations and the generic-flag equality, the quasisplit threshold formula in a form valid for nonnormal reflex fields, the orbit bound, Frobenius transport of isotypic components, and the Hodge–Newton inequalities (GLX26 §§5.2–5.3).
- Layer 2: uniform descent of subisocrystals, generic minimality of Hodge degrees, generic weak admissibility and generic derived monodromy (GLX26 Theorem 5.8; Chen14 Théorème 5.0.6).
- Layer 3: generic flags over finite extensions of Q̆_p, the open-image period point, Zariski density of open subgroups of rational points (for every smooth connected affine group over a p-adic field; DeligneWeightsAndPurity §2.2 states the case Sp(V) over Q_ℓ), central lifting of derived containment and the z-extension comparison (GLX26 Lemma 5.10, Proposition 5.9, Proposition 6.7).
- Layer 4: components and stabilizers of compact-image period torsors and their images in an ambient tower (GLX26 Lemma 6.12 and its proof).

Supplied objects keep their owners' names and are imported, not restated: the filtered G-isocrystal functor, admissible pairs, the HN filtration of filtered isocrystals, crystalline ⇒ Hodge–Tate, the period torsor and Colmez–Fontaine over arbitrary perfect residue fields (PadicHodgeTheory §§3.3, 3.4, 3.6, 5.5); the Hodge and Newton numbers, weak admissibility and strictness of morphisms of weakly admissible objects (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2 and PadicHodgeTheory §3.4, on the carrier and exact-category API of PadicLocalLanglandsForGL2Qp §0.2); the derived subgroup scheme, its connectedness, its base change, the triviality of characters on it, the derived subgroup of an image, central isogenies of affine group schemes, and the point topology with the topological group G(Q_p) and its compact open integral points (Tau Ceti); Dieudonné–Manin and the slope calculus (VectorBundlesAndIsocrystals Layer 1); neutral reconstruction and tensor-isomorphism torsors (MotivesAndAlgebraicCycles §§6.1–6.3, 6.8); Galois averages, Newton and Kottwitz invariants, decent representatives, acceptable classes and bounded lifting through z-extensions (BunGAndNewtonStrata §§1.7–1.9, 1.12, 1.23, 1.43); period towers, classical points, adjoint comparison, nonemptiness and transitivity (HeckeStacksAndLocalShtukas §§HS2.11–HS2.13, HS2.15, HS2.16); openness of smooth maps on rational points, analytic charts, the completed unramified field and z-extensions (ReductiveGroupsPartII §§RG2.0.2, RG2.0.4, RG2.1.5); monodromy groups (ArithmeticGaloisRepresentations §§1.1, 7.6); parabolic-type flag varieties (ShimuraData §3.8); associated bundles (AutomorphicBundles §0.4); rank loci (AlgebraicModuliForArithmeticGeometry §1.7); étale coordinates and change of group of torsors (SchemeAndStackFoundations §§0.8, 2.3); representations, Lie algebras, closed subgroups, derived groups, root data with Galois action and split highest weights (ReductiveGroups Layers 1, 2, 3, 6, 7, 10); and locally profinite torsors, the Galois torsor of Spd K, components and limits of diamonds (DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.3, D6.5).

Two inputs are supplier gaps, stated under Exact supplier contracts: the irreducible representations of quasisplit groups by Galois orbits of dominant weights (gap:quasisplit-highest-weights, ReductiveGroups Layer 10) and Sen's openness theorem for Hodge–Tate representations (gap:serre-sen-openness, PadicHodgeTheory §4.4).

The roadmap ends at the arithmetic inputs of the component theory of local shtuka towers. The following lie outside it:

- The component theorem GLX26 Theorem 6.1 and its partial converse GLX26 Proposition 5.11 consume §§3.2, 3.5 and 4.2 and are not targets here. They follow from the circle of implications (3)⇒(4)⇒(5)⇒(1)⇒(2)⇒(3) of Theorem 6.1, whose step (3)⇒(4) is §3.2 here and whose step (4)⇒(5) consumes §4.2 here (see Downstream consumers).
- Infinite transcendence of Q̆_p over Q_p and the Witt-digit estimate behind it: ReductiveGroupsPartII §RG2.0.4, `transcendenceDegree_infinite`.
- The p-adic Simpson correspondence, crystalline local systems on smooth formal schemes and equivariant bundles on the Fargues–Fontaine curve, which are separate continuations of PadicHodgeTheory with their own directions.

## Conventions

- p is a prime, p = 2 included. F = Q̆_p is the completed maximal unramified extension of ReductiveGroupsPartII §RG2.0.4, identified there with Frac W(F̄_p); σ is its arithmetic Frobenius and `Q_{p^s}` ⊂ F the unramified extension of degree s > 0. K/F is a finite extension and Γ_K = Gal(K̄/K). G is a connected reductive group over Q_p.
- For b ∈ G(F) and a cocharacter μ of G_K, or a K-point η of the flag variety Fl_μ, `F_{b,μ}(V)` = (V⊗F, ρ(b)σ, Fil_μ V_K) is the filtered fibre functor of (b, μ) of PadicHodgeTheory §3.6. Filtrations decrease, and Fil^i_μ is the sum of the μ-weight spaces of weight at least i. The Hodge degree is t_H = Σ_i i·dim gr^i and the Newton degree t_N = v_p(det φ), with v_p(p) = 1. The covariant realization of Q_p(1) has φ = p⁻¹σ and filtration jump −1, as in PadicHodgeTheory's Conventions; its Hodge–Tate weight in that convention is +1.
- GLX orientation: [b] ∈ B(G,μ) means κ(b) = μ^♮ and ν_b ≤ μ^◇, which is the acceptable set B(G,{μ}) of BunGAndNewtonStrata §1.23. Here μ^◇ is the Galois average of BunGAndNewtonStrata §1.7 and μ^♮ is the class of the dominant representative in π_1(G)_Γ, the Hodge invariant written μ♯ in BunGAndNewtonStrata §§1.7 and 1.23 and μ^♮ in GLX26 §2 ¶2 (arXiv v3 p. 14) and PadicHodgeTheory §5.5. HeckeStacksAndLocalShtukas states its towers in the Berkeley orientation with B(G,μ⁻¹); its §HS2.12 states the GLX comparison through λ = μ⁻¹. Every use of HeckeStacksAndLocalShtukas below reads its μ as our μ⁻¹, including the Kottwitz sign κ(b) = −μ^♯ there.
- Decency: b is s-decent when sν_b is integral and (bσ)^s = (sν_b)(p)σ^s in G(F)⋊⟨σ⟩, with exactly s factors (the decent representatives of BunGAndNewtonStrata §1.9); then b and ν_b are defined over `Q_{p^s}`. Enlarging s (BunGAndNewtonStrata §1.12), arrange that `G_{Q_{p^s}}` is quasisplit and that it splits over an extension of `Q_{p^s}` whose Galois closure is totally ramified. Fix a lift σ̃ ∈ `Γ_{Q_p}` of σ and let σ_0 be its action on the absolute based root datum through the Galois action of ReductiveGroups Layer 7: for a Borel pair (T, B) of `G_{Q_{p^s}}` defined over `Q_{p^s}`, conjugate σ̃(T, B) back to (T, B). Two lifts differ by an element of the inertia group, which lies in `Γ_{Q_{p^s}}`, and σ̃^s lies in `Γ_{Q_{p^s}}`; so on `Γ_{Q_{p^s}}`-orbits of weights and on `Γ_{Q_{p^s}}`-invariant rational cocharacters σ_0 does not depend on the lift and σ_0^s acts trivially. Only these two actions of σ_0 are used; on the whole root datum σ_0^s need not be the identity (§1.4, Checks). GLX26 (2.7), arXiv v3 p. 15, likewise asks only that a power of its Frobenius action fix the inertia average. The dominant Newton point is arranged by σ-conjugating b by an element of `G(Q_{p^s})`. Such an element acts on Fl_μ over every field containing `Q_{p^s}` and the reflex field, so it preserves genericity. An element of G(F) is used only to transport a constructed period point between σ-conjugate representatives.
- Hodge–Newton irreducibility (GLX26 Definition 2.1): for one positive absolute root system with simple roots Δ, μ^◇ − ν_b = `Σ_{α∈Δ}` c_α α^∨ with every c_α > 0, together with [b] ∈ B(G,μ). For a torus Δ is empty and the condition reduces to [b] ∈ B(G,μ). Every average is over a nonempty finite orbit and every quotient k/s has s > 0.
- Monodromy: for a continuous ξ: Γ_K → G(Q_p), H ⊂ G is the full Zariski closure of ξ(Γ_K) and H° its identity component (ArithmeticGaloisRepresentations §7.6). For an arbitrary continuous ξ, as Layer 4 allows, H may be disconnected: a ramified quadratic character of Γ_K has closure μ_2 ⊂ 𝔾_m. GLX's Mumford–Tate group MT(b,η) is H°. For the crystalline ξ of an admissible pair over a finite K/F, H = H° (§0.7, connectedness), so the tensor group of the category generated by the image of `F_{b,η}` is H = H°. The statements below name H or H° as their arguments need and do not use this equality.
- Torsors: in Layer 4, G(Q_p) acts on the geometric fibre G(Q_p) of a period torsor by left multiplication and Γ_K by right multiplication through ξ. The Γ_K-orbits are the cosets gC with C = ξ(Γ_K), and the left stabilizer of gC is gCg⁻¹.

## Exact supplier contracts

### From Mathlib

At the pin: `Submodule` (`Mathlib/Algebra/Module/Submodule/Defs.lean`) carries the steps of every filtration; jumps are defined by membership and non-membership. Mathlib's `IsFiltration` (`Mathlib/RingTheory/FilteredAlgebra/Basic.lean`:49) is the increasing convention; a decreasing filtration Fil corresponds to the increasing family i ↦ `Fil^{-i}`, so the jump of §0.1 is the negative of the corresponding increasing index. `WittVector.isocrystal_classification` (`Mathlib/RingTheory/WittVector/Isocrystal.lean`:179) classifies one-dimensional isocrystals over an algebraically closed residue field; it does not treat higher rank, which is VectorBundlesAndIsocrystals Layer 1. `AlgebraicIndependent` (`Mathlib/RingTheory/AlgebraicIndependent/Defs.lean`:54) is injectivity of multivariable polynomial evaluation over the stated coefficient ring. `AlgebraicGeometry.UniversallyOpen.of_flat` (`Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean`:142, Stacks 01UA) makes a flat morphism locally of finite presentation universally open, and `AlgebraicGeometry.Scheme.Hom.isOpenMap` (same file, line 43) extracts openness of the underlying map. `Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`:194, Stacks 02GL) identifies a formally étale, essentially finite type algebra over a field with a finite product of finite separable field extensions.

### From Tau Ceti

At the pin: `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` (`TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`:101) is Chevalley's theorem with the subgroup character. For a commutative Hopf algebra over a field and a Hopf ideal whose underlying ideal is finitely generated, the closed subgroup is the stabilizer, over every commutative value algebra, of a line in an exterior power of a finite-dimensional subcomodule, and that line lies in the weight space of a unique character of the subgroup. `TauCeti.Tannaka.fgPointTensorIsoEquiv` (`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`:188) and `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138) identify the algebra-valued points of such a Hopf algebra with the tensor automorphisms of scalar extension on its finite-dimensional comodules. Reconstruction for an abstract neutral category is MotivesAndAlgebraicCycles §§6.1–6.3. `TauCeti.CommHopfAlgCat.derivedDefiningIdeal` (`TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean`:69) is the Hopf ideal of the derived subgroup scheme, the smallest closed subgroup scheme containing the image of the commutator morphism; `TauCeti.CommHopfAlgCat.derivedDefiningIdeal_map_le` (`…/Derived/Functoriality.lean`:68) says that a homomorphism sends the derived subgroup of its source into that of its target; `TauCeti.CommHopfAlgCat.connectedSpace_derived` (`…/Derived/Connected.lean`:153) says that the derived subgroup of a connected affine group of finite type over an algebraically closed field is connected; `GroupLike.sub_one_mem_derivedDefiningIdeal` (`…/Derived/Character.lean`:39) says that for a commutative Hopf algebra over any commutative ring a group-like element minus one lies in the derived defining ideal, that is, every character is trivial on the derived subgroup; and `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal` (`…/Derived/FreeBaseChange.lean`:89) says that the derived subgroup commutes with base change to a free algebra, in particular to every field extension. `TauCeti.CommHopfAlgCat.mapPointsFunctor_derivedMap_app_surjective` (`…/Derived/Image.lean`:97) says that for an injective map of finite-type coordinate Hopf algebras over a field, that is, a schematically dominant homomorphism of affine groups of finite type, the induced homomorphism of derived subgroups is surjective on points with values in every algebraically closed extension field; `TauCeti.CommHopfAlgCat.faithfullyFlat_derivedMap` (same file, line 113) says that over an algebraically closed base field, with reduced target, that homomorphism of derived subgroups is faithfully flat. These give the equality f(D(J)) = D(f(J)) of §3.4. Milne iAG Proposition 8.20 and Corollary 8.21(b), p. 131, describe D(J) as the algebraic subgroup generated by the commutator map and make it connected for connected J; Proposition 8.22 and Corollary 8.23, p. 132, characterize D(J) for a connected affine group variety J as the connected subgroup variety whose k̄-points form the commutator subgroup of J(k̄) in characteristic zero. Milne states no image equality; it follows by comparing k̄-points, as in §3.4. `TauCeti.CommHopfAlgCat.IsCentralIsogeny` (`TauCeti/Algebra/AlgebraicGroup/Isogeny/Basic.lean`:78) is a finite faithfully flat homomorphism with central kernel.

The topology on rational points is pinned: `TauCeti.PointTopology.topology` (`TauCeti/Topology/Algebra/PointTopology/Basic.lean`:83) is the coarsest topology on the R-points A →ₐ[k] R of Spec A for which every evaluation is continuous, with no finiteness or separation hypothesis; `TauCeti.PointTopology.instTopologicalSpaceWithConv` (same file, line 110) transports it to the convolution group `WithConv (A →ₐ[k] R)` of points of an affine group; `TauCeti.PointTopology.isTopologicalGroup` (`…/PointTopology/Group.lean`:102) makes these points a topological group when R is a commutative topological semiring; `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective` (`…/PointTopology/Functoriality.lean`:110) makes a surjection of coordinate rings, that is, a closed immersion, a closed embedding on points when R is T1; and `TauCeti.PointTopology.isOpenEmbedding_mapValue_integer` and `TauCeti.PointTopology.isCompact_range_mapValue_integer` (`…/PointTopology/IntegralPoints.lean`:102, 116) make the integral points of an affine group of finite type over the valuation ring of a nonarchimedean local field a compact open subgroup of its rational points. With k = R = Q_p these give the topological group G(Q_p) in which every continuous ξ: Γ_K → G(Q_p) here takes values, and its closed subgroups G_der(Q_p) and H(Q_p) carry the subspace topology.

### From TauCetiRoadmap.PadicHodgeTheory

Section 3.3 supplies Fontaine's functors and the implications crystalline ⇒ de Rham ⇒ Hodge–Tate. Section 3.4 supplies weak admissibility of filtered isocrystals and the Harder–Narasimhan filtration in that filtered category, and records what it imports from the exact-category API of PadicLocalLanglandsForGL2Qp §0.2: strictness of morphisms between weakly admissible objects, weak admissibility of their kernels, images and cokernels, and the abelian category of weakly admissible objects. Section 3.6 supplies the filtered fibre functor `F_{b,μ}` of a pair (b, μ) and the admissibility predicate: the pair is admissible when every `F_{b,μ}(V)` is weakly admissible. Section 5.5 supplies, for K complete discretely valued with arbitrary perfect residue field and in particular for finite K/Q̆_p, the Colmez–Fontaine equivalence between weakly admissible filtered isocrystals and crystalline representations (imported there from PadicLocalLanglandsForGL2Qp §0.2), and neutrality of the period torsor: for an admissible pair with [b] ∈ B(G,{μ}) there is a rational tensor trivialization, hence a continuous crystalline ξ: Γ_K → G(Q_p), unique up to G(Q_p)-conjugacy, whose crystalline realization is `F_{b,μ}` through the period comparison isomorphism over B_cris. Section 4.4 owns Sen theory for p-adic representations, including the Sen operator and its vanishing exactly when the inertia image is finite, proved through Sen's description of the Lie algebra of the inertia image.

What PadicHodgeTheory must provide (gap:serre-sen-openness): for a complete discretely valued field K of characteristic zero whose residue field is algebraically closed of characteristic p, for instance a finite extension of Q̆_p, and a continuous Hodge–Tate representation ρ: Γ_K → GL_n(Q_p), prove that ρ(Γ_K) is open in the Q_p-points of its Zariski closure (Serre79 §1.3, Théorème 1, p. 158; Chen14 Proposition 3.2.1(2), pp. 740–741).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Section R07.3.2 supplies the Hodge and Newton numbers t_H = Σ_i i·dim gr^i and t_N = v_p(det φ) with v_p(p) = 1, their additivity on short exact sequences, and the predicate `FilteredPhiNModule.IsWeaklyAdmissible`, as notation for the objects of PadicLocalLanglandsForGL2Qp §0.2 on the carrier `FilteredPhiNModule K` that §R07.3.1 fixes as notation for §0.2's category. Only the subcategory N = 0 is used.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

Section 0.2 supplies the category of filtered (φ, N)-modules over a complete discretely valued field K of characteristic zero with perfect residue field (the carrier that FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.1 names `FilteredPhiNModule K`), weak admissibility on it, and its exact-category API. PadicHodgeTheory §3.4 records what that API contains: strictness of morphisms between weakly admissible objects, weak admissibility of their kernels, images and cokernels, and the abelian category of weakly admissible objects. Strictness, in the form stated in PadicHodgeTheory §3.4, is used in §0.5.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

Layer 1 supplies, for every finite extension E of Q_p with residue cardinality q and in particular for E = `Q_{p^s}` with the q-Frobenius σ^s: "Finite isocrystals over the completed maximal unramified coefficient field", "Rational standard Frobenius blocks" D(s,r), "Dieudonné–Manin classification of finite isocrystals" (every finite isocrystal is a sum of coprime blocks, distinct slopes have no morphisms, short exact sequences split) and "Tensor and dual calculus for isocrystals" (tensor slopes add, dual slopes negate).

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Sections 6.1–6.3 supply neutral Tannakian reconstruction over any field, without a tensor generator. Section 6.8 supplies the tensor-isomorphism torsor of two fibre functors, its actions and its scalar extension.

### From TauCetiRoadmap.BunGAndNewtonStrata

Section 1.7 supplies the Hodge invariant μ^♮ (written μ♯ there) and the Galois average μ^◇; §1.8 supplies the Newton and Kottwitz invariants; §1.9 supplies decent representatives; §1.12 supplies the existence of decent representatives with G quasisplit over `Q_{p^s}` and the Newton point in the chosen dominant chamber; §1.23 supplies the acceptable set B(G,{μ}); §1.43 supplies bounded lifting of acceptable classes through a z-extension and the induced surjection of component cosets.

### From TauCetiRoadmap.HeckeStacksAndLocalShtukas

Section HS2.11 supplies the universal admissible period torsor and its crystalline classical fibres: the fibre at a point over a finite extension L of the completed reflex field is the torsor of a crystalline ρ_x: Gal(L̄/L) → G(Q_p) with isocrystal b and Hodge filtration BB(x). Section HS2.12 supplies the Białynicki-Birula bijection between classical cell points and flag points, restricted to admissible points and weakly admissible filtrations. Section HS2.13 supplies the comparison of bounded Grassmannians, admissible loci and infinite-level towers along a map inducing an isomorphism of adjoint groups, after base change of reflex fields. Section HS2.15 supplies nonemptiness: for [b] in the acceptable set the admissible cell has a point over a finite extension of the completed reflex field. Section HS2.16 supplies transitivity of G(Q_p) on the connected components of the infinite-level tower over an algebraically closed field for minuscule μ, and for general μ under its finite-level openness hypothesis.

### From TauCetiRoadmap.ReductiveGroupsPartII

Section RG2.0.2 supplies *smooth-morphism-open-map* (a smooth morphism of schemes over a local field is open on rational points) and *smooth-group-analytic-charts* (in characteristic zero, the points of a smooth affine group form an analytic manifold whose tangent space at the identity is the Lie algebra), both for the point topology of the Tau Ceti contract; the topological group G(Q_p) itself, its *points-topological-group*, is the pinned `TauCeti.PointTopology.isTopologicalGroup`. Section RG2.0.4 supplies Q̆_p with its Frobenius, its comparison with Frac W(F̄_p), and `transcendenceDegree_infinite`: Q̆_p has infinite transcendence degree over Q_p. Section RG2.1.5 supplies z-extensions: central quotients by induced tori with simply connected derived group.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Section 1.1 supplies continuous representations of Γ_K. Section 7.6 supplies the Zariski closure of a subgroup of G(K) through the vanishing ideal, the monodromy group and its identity component, the equality, over an algebraically closed field, of the closure of α(Σ) with α of the closure for a homomorphism α of algebraic groups, and the compatibility of closures with field extension. Over Q_p, the field of §§3.2 and 3.5, the form used is: for Σ ⊆ G(Q_p) and a homomorphism α: G → G′ over Q_p, the closure of α(Σ) is the scheme-theoretic image α(Σ̄) of the closure Σ̄. This needs no algebraically closed field: a function on G′ vanishes on α(Σ) exactly when its pullback vanishes on Σ, so the vanishing ideal of α(Σ) is the kernel of O(G′) → O(Σ̄), which is the ideal of the scheme-theoretic image. The Q_p-points of α(Σ̄) may be more than α(Σ̄(Q_p)); only the closed subgroup scheme is used.

### From TauCetiRoadmap.ShimuraData

Section 3.8 supplies `parabolicTypeVariety`: for a reductive group scheme and an étale-locally constant parabolic type, the smooth projective scheme of parabolic subgroups of that type, equal to G_L/P over any extension L with an L-rational parabolic P of the type. Here Fl_μ denotes this scheme for the type of P_μ over the reflex field of {μ}, over which that type is Galois-stable; over a field E containing the reflex field over which a representative μ is defined it is G_E/P_μ, the form used in Layer 1. For G = D^× with D the quaternion division algebra over Q_p and {μ} = (1, 0), the reflex field is Q_p and Fl_μ is a conic without Q_p-points, which becomes ℙ^1 over every quadratic extension splitting D, the smallest fields of definition of a representative. FlagVarieties classifies parabolic subgroups and projective homogeneous spaces over an algebraically closed field only, so it does not supply Fl_μ over the p-adic reflex field.

### From TauCetiRoadmap.AutomorphicBundles

Section 0.4 supplies `associatedCoefficient`: for a flat affine group P over a base, a right P-torsor locally trivial for the fpqc topology and a representation on a finite locally free module, the associated finite locally free module, with its maps, tensor structure, base change and rank.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Section 1.7 supplies `rankLocus`: for a map of finite locally free sheaves and r ≥ 0, the closed subscheme on which the rank is at most r, defined by the (r+1)-minors and compatible with base change. Its set of points is where the fibre rank is at most r; with source O and r = 0 it is the zero locus of a section.

### From TauCetiRoadmap.SchemeAndStackFoundations

Section 0.8 supplies `etale_coordinates`: a morphism smooth at x of relative dimension d admits, on an open neighbourhood of x, an étale map to affine d-space over the base (Stacks 054L). Section 2.3 supplies torsors under a sheaf of groups on a site and change of group along a homomorphism of sheaves of groups by contracted product; §4.1 applies it on the v-site of Spd K to the homomorphism Γ̲_K → G(Q_p)̲ induced by a continuous ξ.

### From TauCetiRoadmap.DiamondsAndVStacks

Section D0.6 supplies the profinite space of connected components of a spectral space, with the same clopens, in which the component of a point is the intersection of its clopen neighbourhoods. Section D3.10 supplies torsors under a locally profinite group G as torsors under the v-sheaf G̲ (those of SchemeAndStackFoundations §2.3 on the v-site) and, over a perfectoid base, their level spaces for open subgroups, finite étale transition maps and the torsor as the limit of its levels. Section D5.3 supplies cofiltered limits of diamonds along qcqs transition maps, the homeomorphism of the limit space with the limit of the spaces for spatial stages, and the finite-stage comparison of finite étale objects. Section D5.16 supplies the component formula for a group quotient when the space of orbits of components is totally disconnected, in particular when invariant clopens separate orbits of components. Section D6.3 supplies, for a Tate pair and a tower of finite étale Galois covers with perfectoid completion, the torsor under the limit profinite group over its Spd; for K finite over F and the tower of finite Galois extensions of K, this is the Γ_K-torsor Spd Ω → Spd K, Ω the completion of K̄ (as §D6.7 there records). Section D6.5 supplies the equivalences between the étale and finite étale sites of an analytic adic space over ℤ_p and those of its diamond, applied to Spa(K, O_K).

### From TauCetiRoadmap.ReductiveGroups

Layer 1 supplies rational representations as comodules and the representation dictionary; Layer 2 the Lie algebra of a closed subgroup and dimension through Lie algebras; Layer 3 closed subgroups, Zariski closures and identity components; Layer 6 derived groups, central isogenies and semisimplicity of the derived group; Layer 7 Borel subgroups, maximal tori, parabolic subgroups P_G(λ) and the absolute root datum with its Galois action; Layer 10 (10B) the highest-weight theory of split groups: simples classified by dominant weights with a one-dimensional highest line, and the highest-weight order and Weyl-orbit convex-hull bounds, so that every weight of the simple module L(λ) lies in the convex hull of Wλ and between w_0λ and λ.

What ReductiveGroups must provide (gap:quasisplit-highest-weights): for a quasisplit connected reductive group G over a field k of characteristic zero, with a k-Borel B ⊇ T and the Galois action on the dominant weights X*(T)^+, prove that the irreducible k-representations are the W_O for the Γ_k-orbits O of dominant weights, with W_O ⊗ k̄ ≅ `⊕_{λ∈O}` W_λ, and that the W_O-isotypic part V_O of every representation satisfies V_O ⊗ k̄ = `⊕_{λ∈O}` `V^λ_{k̄}`, `γ(V^λ_{k̄})` = `V^{γλ}_{k̄}` for γ ∈ Γ_k, and `V_O = (⊕_{λ∈O} V^λ_{k̄})^{Γ_k}` (GLX26 §5.2, ¶18, arXiv v3 p. 35).

## How to read the build

Layer 0 sets up the arithmetic side: decent fibres turn crystalline monodromy into stabilizers of explicit lines, and the period comparison transfers derived containment back to the Galois side. Layer 1 is the representation theory of generic flags: it computes generic filtration jumps from highest weights and bounds the full-period degree sums by Galois averages. Layer 2 combines them: generic flags are weakly admissible, and strict Hodge–Newton positivity forces the derived group into the monodromy group. Layer 3 produces generic flags over finite extensions of Q̆_p, constructs the open-image point and compares it along z-extensions. Layer 4 reads off stabilizers of components of period torsors. Layer 1 uses Layer 0's jump predicate in §1.1, its full-period degree sum in §1.5 and its tested-vector sets in §1.6; Layer 0 does not depend on Layer 1. Layers 2–4 combine these inputs and use their predecessors. Each layer ends with examples and its dependencies.

## Layer 0: decent fibres and crystalline invariant lines

### 0.1 The jump of a nonzero filtered vector

Let K be a field, V a K-vector space and Fil a decreasing ℤ-indexed family of subspaces of V. Define the jump predicate: v has jump d for Fil when v ∈ Fil^d and v ∉ `Fil^{d+1}`. If Fil is exhaustive (⋃ Fil^d = V) and separated (⋂ Fil^d = 0), every nonzero v has exactly one jump, written deg_Fil(v); zero has none. Construct the predicate on Mathlib's `Submodule` carrier by membership and non-membership. For v ≠ 0 the set of d with v ∈ Fil^d is nonempty by exhaustion, bounded above by separation and a lower set because Fil decreases; its maximum is the jump, and decrease gives uniqueness. (GLX26 §5.1, equation (5.2), arXiv v3 p. 32.) *Needs:* Mathlib `Submodule`.

The API:

- Membership: if v has jump d then v ∈ Fil^d and v ∉ `Fil^{d+1}`.
- Uniqueness: for decreasing Fil, two jumps of the same vector are equal.
- Existence: for exhaustive and separated Fil and v ≠ 0, a jump exists.
- Scaling: multiplying v by a nonzero scalar preserves its jump.
- Ultrametric inequality: for nonzero v, w with v + w ≠ 0, deg_Fil(v + w) ≥ min(deg_Fil v, deg_Fil w), with equality when the two jumps differ.

**Checks.**

- For Fil^i = K when i ≤ a and Fil^i = 0 otherwise, the vector 1 has jump a, including for negative a.
- The zero vector lies in every Fil^d and so has no jump; a model assigning it jump +∞ or 0 is excluded.
- In K e_1 ⊕ K e_2 with Fil^i = V for i ≤ −1, Fil^i = K e_1 for 0 ≤ i ≤ 2 and Fil^i = 0 for i ≥ 3, the vector e_1 has jump 2 and e_1 + e_2 has jump −1 = min(2, −1); taking the maximum, 2, would be the wrong rule.

### 0.2 The full-period Frobenius degree sum

For a set X, a function d: X → ℤ, a self-map φ of X and s ∈ ℕ, define the degree sum d_s(v) = `Σ_{0≤i<s}` d(φ^i(v)), a finite sum over i < s with ordinary iteration. In the crystalline application X is the set of nonzero vectors of V⊗F, φ = ρ(b)σ is bijective, s > 0 is a decency period, and d is the μ-filtration jump of §0.1 computed in V⊗K. (GLX26 §5.1, equation (5.4), arXiv v3 p. 33.) *Needs:* §0.1.

The API:

- Period zero: d_0(v) = 0.
- Period one: d_1(v) = d(v).
- Recursion: `d_{s+1}(v)` = d_s(v) + d(φ^s(v)).
- Transport: a map X → Y intertwining φ and ψ and preserving degrees preserves every d_s.

**Checks.**

- For φ the identity, d_s(v) = s·d(v).
- For the involution of a two-element set with degrees 1 and −1, the 2-sum at either point is 0; the model s·(first jump) would give 2 at the point of degree 1.
- For a three-cycle with degrees 2, 0, −5 starting at the first point, d_3 = −3 and d_2 = 2; the summands are not equal and the partial sums depend on s.

### 0.3 Vectors satisfying the Newton and Hodge equations

Let b ∈ G(F) be s-decent with s > 0, K/F finite, μ a cocharacter of G_K (or η ∈ Fl_μ(K)) and ρ: G → GL(V) a rational representation. For k ∈ ℤ let `V^{s,k}_{b,μ}` be the set of nonzero v ∈ `V⊗Q_{p^s}` with ρ((sν_b)(p))v = p^k v and d_s(v) = k, where d_s is the degree sum of §0.2 for φ = ρ(b)σ and the μ-jump in V⊗K. It is a set, not a subspace. The Newton operator ρ((sν_b)(p)) is defined on `V⊗Q_{p^s}` because b and ν_b are defined over `Q_{p^s}`, and φ^i(v) ∈ `V⊗Q_{p^s}` for every i. (GLX26 §5.1, equations (5.3)–(5.5), arXiv v3 pp. 32–33.) *Needs:* §0.2; BunGAndNewtonStrata §1.9.

The API:

- Membership: v ∈ `V^{s,k}_{b,μ}` iff v ≠ 0, the Newton eigenvalue equation holds and the degree sum equals k.
- Scaling: multiplication by `Q_{p^s}^×` preserves membership.

**Checks.**

- For G = 𝔾_m, b = p^a and μ of weight h on the standard character, a nonzero vector belongs to `V^{s,k}` exactly when k = sa = sh; for h ≠ a every `V^{s,k}` is empty.
- For φ = σ (b = 1) and the standard character with jump 1, every nonzero vector satisfies the Newton equation with k = 0 and has d_s = s, so `V^{s,0}` is empty.
- For G = GL_2, b = diag(p, 1), s = 1 and the rational flag Fil^1 = K e_1 of μ = (1, 0), the vector e_1 has Newton exponent 1 and jump 1, so it lies in `V^{1,1}`, and e_2 has exponent 0 and jump 0, so it lies in `V^{1,0}`; their sum is not an eigenvector of ρ(ν_b(p)) = diag(p, 1) and lies in no `V^{1,k}`, so `V^{s,k}` is not closed under addition, and the union over k is not a subspace.
- The zero vector satisfies the Newton equation for every k but has no jump; a model admitting it would make every `V^{s,k}` nonempty and would hand §0.6 a degenerate line to stabilize.

### 0.4 The finite decent-field crystalline fibre functor

On the full tensor subcategory Isoc^s of isocrystals over F whose slopes have denominators dividing s, define ω_s(N) = ⊕_λ {x ∈ N_λ : φ^s(x) = `p^{sλ}x`}, a `Q_{p^s}`-vector space. Then ω_s is an exact faithful tensor functor and the natural map `ω_s(N)⊗_{Q_{p^s}}F` → N is an isomorphism. Restrict ω_s to the subcategory `C_{b,μ}` generated by `F_{b,μ}(Rep G)` under tensor operations and subquotients. If b is s-decent, `ω_s∘F_{b,μ}` is canonically V ↦ `V⊗Q_{p^s}`, so the full tensor group H_cris,s = `Aut^⊗(ω_s|C_{b,μ})` embeds in `G_{Q_{p^s}}`. The unfiltered ω_s needs no admissibility; the restriction to `C_{b,μ}` and the group H_cris,s use an admissible pair. (Chen14 §3.1, pp. 739–740; Definition 3.3.1 and Lemma 3.3.2, p. 742; GLX26 §5.1 ¶14, arXiv v3 p. 32.)

Construct ω_s slope by slope: on N_λ the map `p^{−sλ}φ^s` is a σ^s-semilinear bijection of slope zero, so Dieudonné–Manin for `Q_{p^s}`-isocrystals gives a basis of fixed vectors. Tensor and dual compatibility follow from additivity of slopes. Decency gives the identification with `V⊗Q_{p^s}`; neutral Tannakian reconstruction gives H_cris,s, kept as the full group. *Needs:* VectorBundlesAndIsocrystals Layer 1 ("Dieudonné–Manin classification of finite isocrystals", "Tensor and dual calculus for isocrystals"); PadicHodgeTheory §3.6; MotivesAndAlgebraicCycles §§6.1–6.3; BunGAndNewtonStrata §1.9.

The API:

- Scalar extension: `ω_s(N)⊗_{Q_{p^s}}F` → N is an isomorphism, natural in N.
- Tensor structure: ω_s(N)⊗ω_s(M) → ω_s(N⊗M) and `Q_{p^s}` → ω_s(1) are isomorphisms satisfying the tensor coherences.
- Exactness and faithfulness: ω_s is exact and faithful on Isoc^s.
- Decent identification: for s-decent b, `ω_s(F_{b,μ}(V))` = `V⊗Q_{p^s}`, naturally in V and compatibly with tensor products.
- Subobjects: a subisocrystal N′ ⊆ N induces an injective `Q_{p^s}`-linear map ω_s(N′) → ω_s(N) with ω_s(N′)⊗F = N′.

**Checks.**

- For the unit (F, σ), ω_s = `Q_{p^s}`, with the identity unit constraint.
- For the standard block of slope 1/2 (φe_1 = e_2, φe_2 = pe_1) and s = 2, φ²(ae_1 + be_2) = p(σ²(a)e_1 + σ²(b)e_2), so ω_2 = `Q_{p²}e_1` ⊕ `Q_{p²}e_2` has dimension 2 over `Q_{p²}`.
- For the rank-one object φ = pσ, the unnormalized space {x : φ^s x = x} is zero, while ω_s = {x : σ^s x = x} has dimension one.
- For b = p^m ∈ 𝔾_m(F), s = 1 and the standard representation V, `ω_1(F_{b,μ}(V))` = {x ∈ V⊗F : p^mσx = p^m x} = V, as the decent identification requires; a representation of weights j contributes {x : `p^{jm}σx` = `p^{jm}x`}, again its rational points.

### 0.5 Rank-one coefficient objects and the degree equality

Let K/F be finite and s > 0. In the scalar extension to `Q_{p^s}` of the category of weakly admissible filtered isocrystals over K (objects with a `Q_{p^s}`-action, morphisms commuting with it), an object is of rank one when its underlying F-space has dimension s. Up to isomorphism the rank-one objects are `X(d_0,…,d_{s−1})` for integers d_i, with F-basis `e_0,…,e_{s−1}`, φ(e_i) = `e_{i+1}` for i < s−1, `φ(e_{s−1})` = p^k e_0 where k = Σ_i d_i, coefficient a ∈ `Q_{p^s}` acting on F e_i through σ^i(a), and filtration jump d_i on K e_i; each such object is weakly admissible. For an admissible pair (b, μ) with b s-decent, the nonzero morphisms `X(d_0,…,d_{s−1})` → `F_{b,μ}(V)⊗Q_{p^s}` correspond, through the image of e_0, to the vectors v ∈ `V^{s,k}_{b,μ}` with deg(φ^i v) = d_i; in particular their fibre lines are the lines `Q_{p^s}v` for v ∈ `V^{s,k}_{b,μ}`, over all k. (Chen14 §3.3, Lemma 3.3.5 and Proposition 3.3.6 with its proof, pp. 744–745; Chen's statement writes the summands as `Q_{p^s}`-lines where F-lines are meant.)

Decompose the coefficient action through `Q_{p^s}⊗F` ≅ F^s: Frobenius cycles the factors and rank-one classification normalizes the wraparound scalar. The maximal destabilizing subobject of the Harder–Narasimhan filtration is stable under the coefficient field, and a proper nonzero coefficient-stable φ-subobject cannot exist because Frobenius cycles the rank-one factors; so total degree equality gives weak admissibility. A nonzero map from a rank-one object is injective and, between weakly admissible objects, strict, which identifies the jumps. *Needs:* §§0.3, 0.4; VectorBundlesAndIsocrystals Layer 1 ("Rational standard Frobenius blocks", "Dieudonné–Manin classification of finite isocrystals"); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2; PadicLocalLanglandsForGL2Qp §0.2 with PadicHodgeTheory §3.4 (strict morphisms of weakly admissible objects); PadicHodgeTheory §§3.4 (Harder–Narasimhan filtration), 3.6.

The API:

- Classification: every rank-one object of the coefficient category is isomorphic to exactly one `X(d_0,…,d_{s−1})` (Chen14 Lemme 3.3.5, p. 744).
- Invariants: t_H(X(d)) = t_N(X(d)) = Σ_i d_i, and X(d) is weakly admissible.
- Scalar-extension decomposition: for a coefficient object Z, the action of `Q_{p^s}⊗_{Q_p}F` ≅ `∏_{0≤i<s}` F splits the underlying space as Z = ⊕_i Z_i, the summand Z_i being where a ∈ `Q_{p^s}` acts through σ^i(a), and φ maps Z_i bijectively onto `Z_{i+1}`, indices mod s (Chen14 proof of Proposition 3.3.6, p. 745).
- Hom description: for an admissible pair (b, μ) with b s-decent, the nonzero morphisms X(d) → `F_{b,μ}(V)⊗Q_{p^s}` correspond, through the image of e_0, to the v ∈ `V^{s,k}_{b,μ}` with deg(φ^i v) = d_i for 0 ≤ i < s, where k = Σ_i d_i (Chen14 proof of Proposition 3.3.6, p. 745).
- Morphisms of tested vectors: for an admissible pair (b, μ) with b s-decent, a G-equivariant map f: V → W and v ∈ `V^{s,k}_{b,μ}` with f(v) ≠ 0, the image f(v) lies in `W^{s,k}_{b,μ}`. The Newton equation passes through f; for the degree sum, v defines a nonzero map from X(deg v, …, deg `φ^{s−1}v`), its composite with `F_{b,μ}(f)` is nonzero, hence injective, and strictness of morphisms of weakly admissible objects gives deg(φ^i f(v)) = deg(φ^i v).

**Checks.**

- For s = 1 the objects are rank-one filtered isocrystals with φ = p^k σ and jump k: equality t_H = t_N of an ordinary crystalline line.
- For s = 2 and jumps (1, −1), k = 0: t_H = t_N = 0. Forgetting the coefficients, the φ-stable lines are F(e_0 + ce_1) with cσ(c) = 1; each meets Fil^0 = Ke_0 trivially, so it has t_H = −1 ≤ 0 = t_N, and the object is weakly admissible although its two jumps differ.
- The same jumps with wraparound p e_0 (k = 1 ≠ 0 = Σ d_i) give t_N = 1 ≠ 0 = t_H, which is not weakly admissible and not of the listed form.
- Negative control for the morphism bullet: T = 𝔾_m², b = 1, s = 1, μ = (0,1), V = χ_1 ⊕ χ_2, v = e_1 + e_2. Then v has Newton exponent 0 and jump min(0,1) = 0, so v ∈ `V^{1,0}`, while its image e_2 under the projection to χ_2 has jump 1 ≠ 0. Here (b, μ) is not admissible, since `F_{b,μ}(χ_2)` has t_H = 1 > 0 = t_N; the admissibility hypothesis is needed.
- With admissibility for a split torus, b is σ-conjugate to μ(p) and ν_b = μ, so components of v with equal Newton exponent have equal μ-weight and every equivariant projection preserves the degree sum.

### 0.6 Chen's invariant-line criterion for the full monodromy group

Let (b, μ) be admissible with b s-decent and K/F finite. As closed subgroup schemes of `G_{Q_{p^s}}`, H_cris,s is the intersection, over all rational representations V, all k ∈ ℤ and all v ∈ `V^{s,k}_{b,μ}`, of the scheme-theoretic stabilizers of the lines `Q_{p^s}v`. In particular a closed subgroup scheme of `G_{Q_{p^s}}` fixing every such v is contained in H_cris,s. Stabilizing a line allows a nontrivial scalar action on it; no connectedness is assumed. (Chen14 Proposition 3.3.4(1), pp. 743–744, and Proposition 3.3.6, pp. 744–745; GLX26 §5.1 ¶15, arXiv v3 p. 33.)

Every tensor automorphism of `ω_s|C_{b,μ}` preserves the fibres of the rank-one coefficient subobjects, which gives one inclusion. For the other, write H_cris,s as the stabilizer of a line by `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`, transported through the representation/comodule dictionary; realize that line as a rank-one coefficient subobject using the `Q_{p^s}`-action, and identify it with a tested line by §0.5. Work with points over every `Q_{p^s}`-algebra, not only rational points. *Needs:* §§0.4, 0.5; Tau Ceti `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`; ReductiveGroups Layer 1; MotivesAndAlgebraicCycles §§6.1–6.3.

**Checks.**

- For G = 𝔾_m, b = p^m and μ = z^m with m ≠ 0 (an admissible pair), the generator e of the standard representation lies in `V^{1,m}`; the tensor powers of `F_{b,μ}(V)` are pairwise non-isomorphic, so H_cris,1 = 𝔾_m, which stabilizes Q_p e through a nontrivial character. Requiring g·v = v instead of g·v ∈ `Q_{p^s}v` would give the trivial group.
- For b = 1 and μ = 0 every nonzero vector of every `V⊗Q_{p^s}` is tested (k = 0, all jumps 0). For faithful V, an element stabilizing every line of V ⊕ 1 acts on it by one scalar, which is 1 on the trivial summand, so the intersection of all line stabilizers is trivial, matching the trivial representation. For G = GL_2, testing only lines inside irreducible representations would give the centre 𝔾_m.
- The criterion uses all representations: for G = 𝔾_m with faithful χ, every mixed tensor power `χ^{⊗m_1}⊗(χ^∨)^{⊗m_2}` is one-dimensional with the single weight m_1 − m_2, while 1 ⊕ χ has two weights and embeds in no single such power.

### 0.7 The full monodromy group and the ambient period comparison

Let K/F be finite, b s-decent, (b, η) admissible with [b] ∈ B(G,μ), and ξ: Γ_K → G(Q_p) the crystalline representation of PadicHodgeTheory §5.5 for a chosen tensor trivialization. Let H be the Zariski closure of ξ(Γ_K) and `T_{b,η}` the Tannakian subcategory of crystalline representations generated by the representations ρ∘ξ, closed under tensor operations and subquotients.

- Tannakian description: H = `Aut^⊗(ω|T_{b,η})` inside G = Aut^⊗(ω_can), for the forgetful fibre functor ω (Chen14 Proposition 3.2.3, pp. 741–742).
- Period comparison: there is g ∈ G(B_cris) with g·(H_cris,s `⊗_{Q_{p^s}}` B_cris)·g⁻¹ = H `⊗_{Q_p}` B_cris inside `G_{B_cris}`, compatibly with the standard fibres (Chen14 Proposition 3.3.3 and its proof, pp. 742–743).
- Derived containment: if `G_der,Q_{p^s}` ⊆ H_cris,s, then G_der ⊆ H°.
- Connectedness: H = H°. This uses that the residue field of K is algebraically closed. (The argument is the roadmap's own; it is why GLX26 Definition 5.1 and §5.1 ¶14, arXiv v3 p. 32, may take the identity component as the Tannakian group.)

For the first item, ξ(Γ_K) ⊆ `Aut^⊗(ω|T_{b,η})(Q_p)` gives H ⊆ Aut^⊗; Chevalley's theorem writes H as the stabilizer of a line, which is a subobject in `T_{b,η}`. For the second, the crystalline comparison of fibre functors on `T_{b,η}`, restricted along `F_{b,η}` and the decent identification, is a tensor automorphism of ω_can⊗B_cris, that is, an element g ∈ G(B_cris), and it conjugates the two embedded groups. For the third, G_der is normal, so G_der,B_cris = g G_der,B_cris g⁻¹ ⊆ `H_{B_cris}`; containment of closed subgroup schemes descends along the faithfully flat Q_p → B_cris, and connectedness of G_der places it in H°. An abstract inner-form isomorphism between H_cris,s and `H_{Q_{p^s}}`, without the ambient conjugation, does not give this containment. For the fourth, let W be the coordinate ring of the finite étale group H/H° with its regular representation, a faithful representation of H/H°. By the first item W is an object of `T_{b,η}`, and Γ_K acts on it through the finite group (H/H°)(Q_p). A representation with finite inertia image is de Rham of Hodge–Tate weight zero (PadicHodgeTheory §3.3), so the filtration of its filtered isocrystal has the single jump 0. Then t_H = 0 on every subobject. Weak admissibility makes the slope of each isoclinic summand nonnegative, and the slopes sum to t_N = t_H = 0, so every slope is 0. Over F, whose residue field is algebraically closed, a slope-zero isocrystal is a sum of unit objects (VectorBundlesAndIsocrystals Layer 1), so the filtered isocrystal of W is that of a trivial representation. By full faithfulness of the Colmez–Fontaine equivalence (PadicHodgeTheory §5.5), Γ_K acts trivially on W. Then ξ(Γ_K), hence its Zariski closure H, acts trivially on the faithful representation W of H/H°, so H/H° = 1. GLX26 §5.1 ¶14 (arXiv v3 p. 32) states the Tannakian description for H°, which agrees with the first item by the fourth. *Needs:* §§0.4, 0.6; PadicHodgeTheory §§3.3, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2; VectorBundlesAndIsocrystals Layer 1 ("Dieudonné–Manin classification of finite isocrystals"); MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; Tau Ceti `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` and `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`; ArithmeticGaloisRepresentations §7.6; ReductiveGroups Layers 3 and 6.

**Checks.**

- For b = 1 and μ = 0, ξ is trivial and H = H_cris,s = 1.
- For G = 𝔾_m, b = p^m and μ = z^m with m ≠ 0, ξ is the character `χ^{−m}` of the cyclotomic character χ; its image is open in ℤ_p^×, so H = 𝔾_m = H°, and H_cris,1 = 𝔾_m as in §0.6.
- Changing the chosen trivialization by h ∈ G(Q_p) replaces ξ by hξh⁻¹ and H by hHh⁻¹, and conjugates the comparison element; G_der ⊆ H° is unchanged because G_der is normal.
- For a torus the derived containment is the statement 1 ⊆ H° and says nothing about H.
- Negative control for connectedness: over K = Q_p, whose residue field is finite, the unramified quadratic character ε is crystalline with image {±1}, whose Zariski closure μ_2 ⊂ 𝔾_m is disconnected. Its filtered isocrystal is the line Q_p e with φ(e) = −e and jump 0: weakly admissible (t_H = t_N = 0), but not the unit object over Q_p. Over F the equation σ(x) = −x has a unit solution (for odd p a square root of a nonsquare unit, for p = 2 the element √−3), so over F the same line is the unit object and ε is trivial on the inertia group. A model claiming H = H° without the algebraically closed residue field fails here.

### Examples

For the rank-one coefficient object X(1, −1) with s = 2 (of dimension 2 over F), φ(e_0) = e_1, φ(e_1) = e_0 and jumps 1, −1, the distinguished vector e_0 has full-period degree 0 and Newton exponent 0 although its two jumps differ. For a rank-one object φ = p^a σ with jump h the two equations of §0.3 require k = sa and k = sh, so h = a; for Q_p(1) both are −1. A torus may act on a preserved line by a nontrivial character, which is why §0.6 tests line stabilizers.

### Dependencies

Mathlib `Submodule`; Tau Ceti `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` and `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`; PadicHodgeTheory §§3.3, 3.4, 3.6, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2; PadicLocalLanglandsForGL2Qp §0.2; VectorBundlesAndIsocrystals Layer 1; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; BunGAndNewtonStrata §1.9; ArithmeticGaloisRepresentations §7.6; ReductiveGroups Layers 1, 3 and 6. Within the layer, §§0.1–0.3 precede §0.5, and §0.4 precedes §§0.5–0.7; the behaviour of tested vectors under morphisms is the last API item of §0.5, after `V^{s,k}_{b,μ}` is defined in §0.3.

## Layer 1: generic filtrations and Hodge–Newton estimates

### 1.1 Generic filtrations and generic flags

Let k be a field of characteristic zero, G a quasisplit connected reductive group over k with k-rational T ⊆ B, and μ a B-dominant cocharacter defined over a finite extension E/k. Let P_μ be the stabilizer of the μ-filtration, whose Lie algebra is the sum of the nonnegative μ-weight spaces, and Fl_μ = G_E/P_μ the flag variety (ShimuraData §3.8). For V ∈ Rep_k(G) define the generic filtration Fil^i_gen V = V ∩ `⋂_{g∈G(E)}` ρ(g)Fil^i_μ V_E and its jump deg_gen(v) by §0.1. A map Spec K′ → Fl_μ is generic when its point is the generic point of Fl_μ. (GLX26 Definitions 5.3 and 5.5 with ¶17, arXiv v3 pp. 33–34.)

Prove:

- each Fil^i_gen V is a G-subrepresentation of V, functorial in V and compatible with direct sums, and deg_gen(v) = `min_{g∈G(E)}` deg_μ(ρ(g)v) (GLX26 ¶17 and (5.9), arXiv v3 p. 34);
- generic-flag equality: for every field K′ ⊇ E and every generic η: Spec K′ → Fl_μ, Fil^i_gen V = V ∩ Fil^i_η `V_{K′}`, and equally Fil^i_gen V = V ∩ `⋂_{x∈Fl_μ(E)}` Fil^i_x V_E (GLX26 Proposition 5.6, arXiv v3 pp. 34–35; Chen14 Lemme 4.2.2, p. 747);
- Galois invariance: for every k-embedding τ of E into k̄, the generic filtration of V attached to τμ equals that attached to μ (GLX26 Proposition 5.4, arXiv v3 p. 34).

The universal filtration on Fl_μ is the associated bundle of the P_μ-torsor G_E → Fl_μ and the P_μ-stable steps Fil^i_μ V. Since V is a G-representation, the associated bundle is G_E-equivariantly the trivial bundle V⊗O, and the step Fil^i is the G_E-stable subbundle whose fibre at gP_μ is ρ(g)Fil^i_μ V; its steps are locally direct factors. A vector w ∈ V_E lies in Fil^i_x exactly where its section of the quotient bundle V⊗O/Fil^i vanishes, a closed locus. The E-points of the open big cell U_G(−μ)·P_μ/P_μ ≅ 𝔸^N_E are Zariski dense because E is infinite, so a closed locus containing the orbit G(E)·P_μ, or the generic point, is all of Fl_μ. Hence the intersection over G(E) equals the kernel of the G_E-equivariant map from V_E to the global sections of the quotient bundle, which is G_E-stable; this gives the first two items, intersecting with V commuting with the flat extension by the coordinate ring of G. The third item transports the intersection by τ, using that V is defined over k. *Needs:* §0.1; ShimuraData §3.8 (`parabolicTypeVariety`); AutomorphicBundles §0.4 (`associatedCoefficient`); AlgebraicModuliForArithmeticGeometry §1.7 (`rankLocus`); ReductiveGroups Layer 1 and Layer 7 (P_G(λ), U_G(λ) and the Bruhat decomposition).

The API:

- Subrepresentations: each step is G-stable, and a G-map V → W sends Fil^i_gen V into Fil^i_gen W.
- Generic-flag equality, in the two forms above.
- Galois invariance under every k-embedding of E.
- Exhaustion and separation: Fil^i_gen V = V for i ≤ min of the μ-weights and 0 above their maximum.

**Checks.**

- For G = GL_2, μ = (1,0) and V standard, every E-line occurs as Fil^1_x, so Fil^1_gen V = 0 and Fil^0_gen V = V. A generic flag is the line K′(1,t) with t transcendental over E, which meets V trivially, whereas the rational flag [1:0] gives V ∩ Fil^1 = k e_1 ≠ 0: genericity is needed.
- For V = det of GL_2 and μ = (1,0), the single weight is 1, so Fil^1_gen det = det: a nonzero jump survives on a character.
- For k = Q_5, E = `Q_5(5^{1/3})`, G = `Res_{E/k}𝔾_m`, V = E and μ the cocharacter attached to the given embedding of E, Fl_μ is a point and V_E = E ⊗_k E is the product of E (weight 1) and a quadratic E-algebra (weight 0). The diagonal copy V meets the weight-one factor only in 0, so Fil^1_gen V = 0 although Fil^1_μ V_E ≠ 0.

### 1.2 The quasisplit threshold formula

In the setting of §1.1, let O run over the Γ_k-orbits of dominant weights, V_O the W_O-isotypic part of V (gap:quasisplit-highest-weights) and w_0 the longest Weyl element, which commutes with Γ_k. Put m_O = `min_{λ∈O}` ⟨w_0λ, μ⟩. Then Fil^j_gen V = `⊕_{O : m_O ≥ j}` V_O for every j. Since μ is fixed by Γ_E, the pairing ⟨w_0λ, μ⟩ is constant on each Γ_E-orbit C ⊆ O, so m_O = min_C ⟨w_0 q_C, μ⟩ with q_C = |C|⁻¹ `Σ_{λ∈C}` λ. Consequently deg_gen(v) = min{m_O : v_O ≠ 0}, and a nonzero v_O has jump m_O. E is not assumed normal over k. (GLX26 Proposition 5.7 and its proof, arXiv v3 pp. 36–37, in a corrected form: for a nonnormal reflex field the family indexed by Gal(E/k) there does not run over all Γ_E-orbits in O.)

If m_O ≥ j, every lowest weight w_0λ of V_O⊗k̄ = `⊕_{λ∈O}` V^λ pairs with μ to at least j, and so does every weight of V^λ, which lies above w_0λ; hence V_O⊗E ⊆ Fil^j_μ V_E, and since V_O⊗E is G_E-stable it lies in every ρ(g)Fil^j_μ V_E. Conversely, Fil^j_gen V is a subrepresentation contained in Fil^j_μ V_E, hence the sum of its intersections with the V_O. A nonzero subrepresentation of V_O is a sum of copies of W_O, whose geometric fibre contains every W_λ with λ ∈ O and so every lowest weight w_0λ; it lies in Fil^j_μ V_E only if m_O ≥ j. A vector therefore lies in Fil^j_gen V iff each nonzero component v_O has m_O ≥ j. *Needs:* §1.1; gap:quasisplit-highest-weights; ReductiveGroups Layers 7 and 10.

**Checks.**

- For the restriction-of-scalars torus of §1.1, O consists of the three embeddings, refined by Γ_E into orbits of sizes 1 and 2 with pairings 1 and 0, so m_O = 0, matching Fil^1_gen V = 0. A formula indexed by Gal(E/k) = {1} at the representative e_1 would predict jump 1.
- For GL_2, μ = (1,0) and the standard representation, O = {(1,0)}, w_0λ = (0,1) and m_O = 0, so Fil^1_gen = 0; for det, λ = w_0λ = (1,1) and m_O = 1.
- For E/k quadratic and Galois and the trivial weight, the orbit O = {0} is a single Γ_E-orbit and v_O = v; summing that refined component over both elements of Gal(E/k) would give 2v.
- For μ = 0, m_O = 0 for every O, so Fil^0_gen V = V and Fil^1_gen V = 0.

### 1.3 The orbit bound at a generic flag

In the setting of §1.2, let μ̄ = |Γ_k·μ|⁻¹ `Σ_{μ′∈Γ_k·μ}` μ′ be the Galois average of μ. For nonzero v ∈ V and every geometric highest weight λ occurring in v (that is, `v_{O_λ}` ≠ 0 for its orbit O_λ),

deg_gen(v) ≤ `m_{O_λ}` ≤ Σ_C (|C|/|O_λ|)⟨w_0 q_C, μ⟩ = ⟨w_0λ, μ̄⟩,

the sum running over the Γ_E-orbits C ⊆ O_λ. In the arithmetic setting k = `Q_{p^s}`, G splits over an extension whose Galois closure is totally ramified over `Q_{p^s}`, so μ̄ is the inertia average of μ (GLX26 (2.6), arXiv v3 p. 15). (GLX26 Theorem 5.8 proof, equations (5.23)–(5.28), arXiv v3 p. 38, with the weights |C|/|O| replacing the sum over Gal(E/k) in (5.29).) A minimum is at most a convex average; equivariance of the pairing and invariance of w_0 identify the orbit average with ⟨w_0λ, μ̄⟩. *Needs:* §1.2.

**Checks.**

- With refined orbits of sizes 1 and 2 and pairings 0 and 3 the bound reads 0 ≤ (1·0 + 2·3)/3 = 2; the unweighted average (0+3)/2 = 3/2 is not the orbit average.
- For the restriction-of-scalars torus of §1.1, μ̄ = (1/3,1/3,1/3) and the bound reads 0 ≤ 0 ≤ 1/3.
- For GL_2, μ = (1,0) and the standard representation, both sides equal ⟨(0,1),(1,0)⟩ = 0.

### 1.4 Frobenius transport of isotypic components

Let s be as in the Conventions, with `G_{Q_{p^s}}` quasisplit, T ⊆ B over `Q_{p^s}`, σ_0 as in the Conventions, and b ∈ `G(Q_{p^s})`. For V ∈ `Rep_{Q_p}(G)` and a dominant `Γ_{Q_{p^s}}`-orbit O, the σ-semilinear bijection ρ(b)σ of `V⊗Q_{p^s}` carries the isotypic part `(V⊗Q_{p^s})_O` onto `(V⊗Q_{p^s})_{σ_0(O)}`. Hence `((ρ(b)σ)v)_{σ_0(O)}` = (ρ(b)σ)(v_O), and the highest weights occurring in (ρ(b)σ)^i v are the σ_0^i-translates of those occurring in v. (GLX26 Theorem 5.8 proof, arXiv v3 p. 39.) The map 1⊗σ carries a subrepresentation to one isomorphic to its σ-twist, and the σ-twist of W_O is `W_{σ_0(O)}` because conjugating σ(T, B) back to (T, B) induces σ_0 on dominant weights; ρ(b) preserves every isotypic part because the isotypic parts are G-stable. *Needs:* gap:quasisplit-highest-weights; ReductiveGroups Layer 7 (absolute root datum with Galois action).

**Checks.**

- For G = `Res_{Q_{p²}/Q_p}𝔾_m`, s = 2, b = 1 and V = `Q_{p²}`, the decomposition `V⊗Q_{p²}` = `Q_{p²}` × `Q_{p²}` has the characters e_1, e_2, and 1⊗σ swaps the factors, matching σ_0(e_1) = e_2; a model in which ρ(b)σ preserves each isotypic part fails here.
- The direction of the transport: for G = `Res_{Q_{p³}/Q_p}𝔾_m`, s = 3, b = 1 and V = `Q_{p³}`, write `V⊗Q_{p³}` = `∏_τ Q_{p³}` through x⊗y ↦ (τ(x)y)_τ, τ running over Gal(`Q_{p³}`/Q_p), the factor τ being the weight space of the character e_τ, with `γ·e_τ = e_{γτ}`. Then `((1⊗σ)w)_τ = σ(w_{σ⁻¹τ})`, so the e_1-part is carried onto the e_σ-part, and σ_0(e_1) = e_σ. The inverse model O ↦ σ_0⁻¹(O) would give the `e_{σ²}`-part; it passes the quadratic Check above, where σ_0 = σ_0⁻¹, and fails here.
- For split G, σ_0 is the identity and every isotypic part is preserved.
- For b ∈ `G(Q_{p^s})` and σ omitted, ρ(b) alone preserves every isotypic part, so the transport comes from σ.
- The lift of σ matters on weights but not on orbits. Let L/Q_p be cyclic of degree 4 with e = f = 2 (for odd p, the extension of local class field theory for the character of Q_p^× sending p to i and restricting to the quadratic character of ℤ_p^×), Gal(L/Q_p) = ⟨g⟩ with inertia group {1, g²} = Gal(L/`Q_{p²}`), G = `Res_{L/Q_p}𝔾_m` and s = 2, which the Conventions admit (L/`Q_{p²}` is totally ramified). The lifts of σ act on X^*(T) = ℤ[⟨g⟩] through g or g³, two different automorphisms whose square g² is not the identity, so no lift has σ_0² = 1 on the root datum. Both carry the `Γ_{Q_{p²}}`-orbit {e_1, `e_{g²}`} onto {e_g, `e_{g³}`} and back, which is all that the transport uses.

### 1.5 The full-period Galois-average inequality

Let b be s-decent with s as in the Conventions, K/F finite containing the field of definition E of the dominant representative μ, and η: Spec K → Fl_μ generic. For nonzero v ∈ `V⊗Q_{p^s}` and every highest weight λ occurring in v, d_s(v) ≤ s⟨w_0λ, μ^◇⟩, where d_s is the degree sum of §0.2 for the η-filtration and μ^◇ = `(1/s)Σ_{0≤i<s}` σ_0^i(μ̄). Repetitions in the average are permitted when s is enlarged. (GLX26 Theorem 5.8 proof, equations (5.30)–(5.36), arXiv v3 p. 39.)

Each φ^i v = (ρ(b)σ)^i v lies in `V⊗Q_{p^s}` and, by §1.1, has η-jump equal to its generic jump over k = `Q_{p^s}`. By §1.4 the weight σ_0^i λ occurs in φ^i v, so §1.3 gives deg(φ^i v) ≤ ⟨w_0σ_0^iλ, μ̄⟩ = ⟨w_0λ, `σ_0^{−i}μ̄⟩`. Summing over a full period and reindexing with σ_0^s μ̄ = μ̄ (Conventions) gives s⟨w_0λ, μ^◇⟩; the identity holds for the full sum, not term by term. *Needs:* §§0.2, 1.1, 1.3, 1.4; BunGAndNewtonStrata §§1.7, 1.9.

**Checks.**

- For G = 𝔾_m, b = p^m, μ = z^m and s = 1, d_1(v) = m = ⟨1, μ^◇⟩: equality.
- For GL_2 with b basic of slope 1/2, s = 2, μ = (1,0) and the standard representation, d_2(v) ≤ 2⟨(0,1),(1,0)⟩ = 0 for every v, while `V^{2,k}` needs k = 1 (ν_b = (1/2,1/2)); so `V^{2,1}` is empty.
- Replacing s by ms multiplies both sides by m: for s-decent b, φ^s v = ρ((sν_b)(p))v on `V⊗Q_{p^s}` and the generic jump is invariant under `G(Q_{p^s})`, so `d_{ms}(v)` = m·d_s(v), while μ^◇ does not depend on s.
- For the cyclic quartic torus of the last Check of §1.4, s = 2 and μ = e_1 ∈ X_*(T) = ℤ[⟨g⟩], the inertia average is μ̄ = (e_1 + `e_{g²}`)/2; both lifts give σ_0μ̄ = (e_g + `e_{g³}`)/2 and σ_0²μ̄ = μ̄, so μ^◇ = (μ̄ + σ_0μ̄)/2 = (1/4)Σ_τ e_τ, the full Galois average. The reindexing needs only σ_0²μ̄ = μ̄, which holds although σ_0² ≠ 1.

### 1.6 The Newton lowest-weight inequality

Suppose ν_b is dominant, b is s-decent and v ∈ `V^{s,k}_{b,μ}`. Every torus weight χ with nonzero component in v satisfies ⟨χ, ν_b⟩ = k/s, and every geometric highest weight λ occurring in v satisfies ⟨w_0λ, ν_b⟩ ≤ k/s. (GLX26 Theorem 5.8 proof, equations (5.37)–(5.38), arXiv v3 pp. 39–40.) Over a splitting field, decompose v into weight vectors: the eigenvalue equation forces `p^{s⟨χ,ν_b⟩}` = p^k on every nonzero component. The lowest weight w_0λ lies below each weight χ of the summand of highest weight λ, and the difference pairs nonnegatively with dominant ν_b. *Needs:* §0.3; BunGAndNewtonStrata §§1.8, 1.12; ReductiveGroups Layer 10.

**Checks.**

- For GL_2 with ν = (a, b), a ≥ b, the standard lowest weight (0,1) has value b, and every eigenvector of the Newton operator has exponent in {sa, sb}, at least sb.
- For a torus, highest weight and weight coincide and the inequality is the equality ⟨χ, ν_b⟩ = k/s.
- The zero vector would have no occurring weight, which is why `V^{s,k}` excludes it.

### 1.7 Strict Hodge–Newton positivity kills derived weights

Let Δ be the simple absolute roots, ν ≤ μ^◇ dominant, and μ^◇ − ν = `Σ_{α∈Δ}` c_α α^∨ with every c_α > 0. If λ is dominant and ⟨w_0λ, ν⟩ ≤ q ≤ ⟨w_0λ, μ^◇⟩ for some rational q, then ⟨λ, α^∨⟩ = 0 for every α ∈ Δ; so the simple module of highest weight λ is one-dimensional and factors through G/G_der. For Δ empty the conclusion about G_der is vacuous. (GLX26, end of the proof of Theorem 5.8(2), arXiv v3 p. 40.) Antidominance gives a_α = ⟨w_0λ, α^∨⟩ ≤ 0, the sandwich gives 0 ≤ Σ c_α a_α ≤ 0, and strict positivity forces every a_α = 0; since −w_0 permutes the simple coroots, ⟨λ, α^∨⟩ = 0 for every α ∈ Δ. One-dimensionality is derived from what ReductiveGroups 10B states: each simple reflection fixes λ, because s_α λ = λ − ⟨λ, α^∨⟩α, so Wλ = {λ} and w_0λ = λ; every weight of L(λ) lies in the convex hull of Wλ, so λ is the only weight, and the highest line is one-dimensional, so dim L(λ) = 1. A one-dimensional module over a splitting field E′ is a character of `G_{E′}`, a group-like element of its coordinate Hopf algebra, and every character is trivial on the derived subgroup (Tau Ceti `GroupLike.sub_one_mem_derivedDefiningIdeal`, over any commutative base ring); that derived subgroup is `(G_der)_{E′}` (Tau Ceti `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal`), so L(λ) factors through G/G_der. *Needs:* ReductiveGroups Layers 6, 7 and 10 (10B); Tau Ceti `GroupLike.sub_one_mem_derivedDefiningIdeal`, `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal`.

**Checks.**

- For SL_2 with c > 0 and the antidominant weight −n (n > 0), the middle term is −cn < 0, contradicting the sandwich.
- For GL_2 ordinary, ν = μ^◇ = (1,0), c = 0 and λ = (1,0): the sandwich 0 ≤ 0 ≤ 0 holds while ⟨λ, α^∨⟩ = 1, so the strict hypothesis cannot be weakened to c_α ≥ 0.
- For a torus, Δ is empty, every λ is a character and the conclusion holds trivially.
- For SL_2 and λ = 0 the simple module is the trivial one, of dimension 1; for λ = 1 the weights are 1 and −1 and the dimension is 2, so a weight that is not orthogonal to the coroot never gives a one-dimensional module.

### Examples

For the restriction-of-scalars torus attached to the nonnormal cubic field `Q_5(5^{1/3})`, the generic jump of V = E is 0, the minimum of the refined pairings 1 and 0, while the orbit average is 1/3. For refined orbits of sizes 1 and 2 and pairings 0 and 3, the minimum is 0 and the orbit average 2. In type A_1 a strict coefficient c > 0 and an antidominant value a ≤ 0 give ca = 0 only for a = 0; with c = 0 that conclusion fails.

### Dependencies

ShimuraData §3.8; AutomorphicBundles §0.4; AlgebraicModuliForArithmeticGeometry §1.7; BunGAndNewtonStrata §§1.7–1.9, 1.12; ReductiveGroups Layers 1, 6, 7 and 10; Tau Ceti `GroupLike.sub_one_mem_derivedDefiningIdeal` and `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal` (§1.7); gap:quasisplit-highest-weights (§§1.2 and 1.4); Layer 0: §0.1 in §1.1, §0.2 in §1.5 and §0.3 in §1.6. Within the layer, §1.1 precedes §1.2, which precedes §1.3; §§1.3–1.4 precede §1.5.

## Layer 2: generic admissibility and derived monodromy

### 2.1 Uniform decent-field descent of isocrystal subobjects

For s-decent b and V ∈ Rep G, every φ-stable F-subspace D′ ⊆ V⊗F is the scalar extension of the `Q_{p^s}`-subspace ω_s(D′) ⊆ ω_s(V⊗F) = `V⊗Q_{p^s}`, which is stable under ρ(b)σ. Every subobject tested for weak admissibility is therefore defined over the single field `Q_{p^s}`, independently of D′. (Chen14 §3.1, pp. 739–740, and proof of Théorème 5.0.6(1), pp. 750–751.) The slopes of D′ are among those of V⊗F, so ω_s applies to D′; the subobject bullet of §0.4 gives ω_s(D′)⊗F = D′. No enumeration of subobjects is used. *Needs:* §0.4; BunGAndNewtonStrata §1.9; VectorBundlesAndIsocrystals Layer 1.

**Checks.**

- For b = 1 and s = 1, a φ-stable line is F v′ with v′ ∈ V rational.
- For the simple block of slope a/h with h | s, the only φ-stable subspaces are 0 and the block, and descent returns 0 and the whole `Q_{p^s}`-form of rank h.
- For GL_2 with b = diag(p, 1), the φ-stable lines are the two slope lines Fe_1 and Fe_2, both defined over Q_p.

### 2.2 Generic flags minimize subobject Hodge degree

Let E/Q_p be finite, containing `Q_{p^s}` and the field of definition of the dominant representative μ, with G_E quasisplit, and let D′_0 ⊆ V⊗E be a fixed E-subspace of rank r. On Fl_μ = G_E/P_μ the function x ↦ t_H(D′_0 ⊗ κ(x), Fil_x ∩ D′_0 ⊗ κ(x)) is upper semicontinuous. Hence its value at the generic point, equal to its value at any generic η: Spec K → Fl_μ, is at most its value at every point of Fl_μ, and in particular at every point over a finite extension of F. The total Hodge degree of V is constant on Fl_μ. (Chen14 proof of Théorème 5.0.6(1), pp. 750–751; GLX26 Theorem 5.8(1) proof, arXiv v3 p. 38.)

Choose integers A ≤ B with Fil^A_x = V and `Fil^{B+1}_x` = 0 for all x. Then t_H = A·r + `Σ_{i=A+1}^{B}` dim(D′_0 ∩ Fil^i_x). Each term is r minus the rank at x of D′_0⊗O → (V⊗O)/Fil^i, the map from a trivial bundle to the quotient of the universal filtration of §1.1, so it is upper semicontinuous by `rankLocus`; a finite sum of upper semicontinuous functions is upper semicontinuous, and an upper semicontinuous function on an irreducible space takes its minimum at the generic point. Fixed μ fixes the dimensions of the graded pieces. *Needs:* §1.1 (universal filtration); AlgebraicModuliForArithmeticGeometry §1.7 (`rankLocus`); ShimuraData §3.8; AutomorphicBundles §0.4.

**Checks.**

- For a plane with jumps 1, 0 (Fil^1_x = ℓ_x a line) and a fixed line D′_0 = L, t_H = dim(L ∩ ℓ_x) is 1 at the single point ℓ_x = L and 0 on its complement, which contains the generic point.
- For D′_0 the whole plane, t_H = 1 at every point.
- The locus {x : dim(L ∩ ℓ_x) ≥ 1} is the rank locus rank(L → V/ℓ_x) ≤ 0, the closed point [L]; an open condition here would contradict the minimality at the generic point.

### 2.3 Generic acceptable decent pairs are admissible

Let G be connected reductive over Q_p, b ∈ G(F) decent, [b] ∈ B(G,μ), K/F finite containing the reflex field, and η: Spec K → Fl_μ generic over the reflex field. Then (b, η) is admissible: every `F_{b,η}(V)` is weakly admissible, hence admissible. No Hodge–Newton irreducibility is assumed. (GLX26 Theorem 5.8(1) and proof, arXiv v3 pp. 37–38; Chen14 Théorème 5.0.6(1), pp. 750–751.)

Choose s as in the Conventions and let E ⊆ K be the compositum of `Q_{p^s}` ⊂ F ⊆ K and the reflex field E_0 ⊆ K of {μ}. As `G_{Q_{p^s}}` is quasisplit with T ⊆ B over `Q_{p^s}`, every element of `Γ_{Q_{p^s}}` preserves the B-dominant chamber, so an element of Γ_E carries the B-dominant representative μ of {μ} to a B-dominant member of {μ}, which is μ itself; hence μ is defined over E, G_E is quasisplit, and §§1.5 and 2.2 apply with this E and this K. The K-point η of Fl_μ and the inclusion E ⊆ K give a K-point of `Fl_μ ⊗_{E_0} E` = G_E/P_μ over η. It is the generic point because Fl_μ is geometrically integral, so `Fl_μ ⊗_{E_0} E` is integral, and the projection to Fl_μ is finite and flat, so only the generic point lies over the generic point. By §2.1 every φ-subobject D′ of V⊗F descends to D′_0 ⊆ `V⊗Q_{p^s}`. By HeckeStacksAndLocalShtukas §§HS2.15 and HS2.12 (with its μ read as our μ⁻¹), the admissible cell has a point over a finite extension of F, giving a weakly admissible flag x. By §2.2, t_H at η of D′ is at most t_H at x, which is at most t_N(D′); the total degrees agree because t_H(V) is constant on Fl_μ. This handles all subobjects at once. Weak admissibility gives admissibility by the Colmez–Fontaine equivalence over arbitrary perfect residue fields (PadicHodgeTheory §5.5); the conclusion is the exact tensor functor, not a chosen trivialization. *Needs:* §§2.1, 2.2; HeckeStacksAndLocalShtukas §§HS2.12, HS2.15; PadicHodgeTheory §§3.6, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2; BunGAndNewtonStrata §§1.9, 1.12, 1.23.

**Checks.**

- For GL_2, μ = (1,0) and b = diag(p,1), the flag Fil^1 = Ke_2 (the slope-zero line) gives that line t_H = 1 > 0 = t_N, so it is not weakly admissible although the total degrees agree; at a generic flag the same line has t_H = 0.
- For G = 𝔾_m, b = p^m and μ = z^h, Fl_μ is a point and [b] ∈ B(G,μ) means m = h, which is exactly t_H = t_N for the standard character.
- For the slope-1/2 basic b in GL_2 and μ = (1,0), the isocrystal of the standard representation is simple and its only test is the total degree 1 = 1. Every representation of GL_2 is a direct summand of sums of tensor constructions of the standard one, and a direct summand of a weakly admissible object is weakly admissible, so every flag, generic or not, is weakly admissible here.

### 2.4 Generic monodromy contains the derived group

Let (b, η) be as in §2.3 and suppose (b, μ) is Hodge–Newton irreducible. Then H° = MT(b,η) contains G_der, for every connected reductive G over Q_p, including ramified and nonquasisplit groups. (GLX26 Theorem 5.8(2) and proof, arXiv v3 pp. 37–40.)

Replace b by a σ-conjugate under `G(Q_{p^s})` with ν_b dominant (BunGAndNewtonStrata §1.12), which preserves genericity, and let ξ be given by PadicHodgeTheory §5.5. For v ∈ `V^{s,k}_{b,η}` and every highest weight λ occurring in v, §1.5 gives k/s ≤ ⟨w_0λ, μ^◇⟩ and §1.6 gives ⟨w_0λ, ν_b⟩ ≤ k/s. By §1.7 each such λ is orthogonal to all coroots, so G_der acts trivially on the corresponding summands and fixes v. By §0.6, `G_der,Q_{p^s}` ⊆ H_cris,s, and by §0.7, G_der ⊆ H°. *Needs:* §§0.6, 0.7, 1.5, 1.6, 1.7, 2.3; BunGAndNewtonStrata §1.12; PadicHodgeTheory §5.5; ReductiveGroups Layer 10.

**Checks.**

- For G = GL_2, μ = (1,0) and b basic of slope 1/2, μ^◇ − ν = (1/2)α^∨ is strictly positive and `V^{2,1}` of the standard representation is empty (§1.5); the theorem gives SL_2 ⊆ H°.
- For a torus the conclusion is 1 ⊆ H° and adds nothing about the central part of the monodromy.
- For GL_2 ordinary (b = diag(p,1), μ = (1,0)), c_α = 0. At a generic flag `V^{1,0}` of the standard representation is Q_p^×e_2 and `V^{1,1}` is empty (e_1 has generic jump 0). The sandwich at q = 0 holds for λ = (1,0) with ⟨λ, α^∨⟩ = 1, and indeed the slope-zero line Fe_2 has t_H = t_N = 0, so it is a weakly admissible subobject, ξ is reducible and H° does not contain SL_2.

### Examples

Take G = GL_2, μ = (1,0) and b = diag(p,1). If Fil^1 is the slope-zero line, that subobject has t_H = 1 and t_N = 0, so the flag is not weakly admissible although the total degrees agree; moving the flag to the generic point gives that line Hodge degree 0. For the basic isocrystal of slopes (1/2, 1/2), μ − ν = (1/2)α^∨ is strictly positive, the standard representation has no tested coefficient line with Newton exponent 1 and full-period Hodge sum 1, and the argument of §2.4 yields SL_2 inside the monodromy group.

### Dependencies

Layers 0 and 1; PadicHodgeTheory §§3.6, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.2; PadicLocalLanglandsForGL2Qp §0.2; HeckeStacksAndLocalShtukas §§HS2.12, HS2.15; BunGAndNewtonStrata §§1.9, 1.12, 1.23; AlgebraicModuliForArithmeticGeometry §1.7; ShimuraData §3.8; AutomorphicBundles §0.4; VectorBundlesAndIsocrystals Layer 1; ReductiveGroups Layer 10. Section 2.3 does not use Layer 1 beyond §1.1, and §2.4 uses all of Layer 1.

## Layer 3: generic period points, open image and central lifting

### 3.1 Generic flags over finite extensions of Q̆_p

Let E/Q_p be finite and X a nonempty smooth geometrically integral E-variety, for instance Fl_μ. There are a finite extension K/F, an embedding E → K and a map Spec K → X whose point is the generic point of X. (GLX26 Lemma 5.10 and proof, arXiv v3 p. 40; Stacks 054L, 02GL, 03WT.)

Let n = dim X and choose a nonempty affine open U with an étale map U → 𝔸^n_E (SchemeAndStackFoundations §0.8). Let FE be the compositum, finite over F. By ReductiveGroupsPartII §RG2.0.4 choose x_1,…,x_n ∈ F algebraically independent over Q_p, hence over E since E/Q_p is algebraic; they give Spec FE → 𝔸^n_E at the generic point. The étale map is open (Mathlib `AlgebraicGeometry.UniversallyOpen.of_flat`), so its image contains the generic point, and the pullback of U is a nonempty quasi-compact étale FE-scheme, a finite disjoint union of spectra of finite separable extensions (Mathlib `Algebra.FormallyEtale.iff_exists_algEquiv_prod`). Choose one, K. Its point in U lies over the generic point of 𝔸^n_E, so its residue field has transcendence degree n over E and it is the generic point of U and of X. For n = 0, geometric integrality makes X = Spec E, and K = FE. *Needs:* SchemeAndStackFoundations §0.8; ReductiveGroupsPartII §RG2.0.4 (`transcendenceDegree_infinite`); Mathlib `AlgebraicIndependent`, `AlgebraicGeometry.UniversallyOpen.of_flat`, `AlgebraicGeometry.Scheme.Hom.isOpenMap`, `Algebra.FormallyEtale.iff_exists_algEquiv_prod`.

**Checks.**

- For X = ℙ^1_E, a generic point over K is a coordinate transcendental over E, such as an element of F transcendental over Q_p; no closed point is generic.
- For a torus G, Fl_μ = Spec E is a point and K = FE works with no transcendental parameter.
- A Zariski-dense set of closed points of X does not provide a generic point: every closed point of ℙ^1_E has a coordinate algebraic over E, and §2.2 needs the generic point itself.

### 3.2 A crystalline period point with open derived image

Let G be a connected reductive group over Q_p, {μ} a geometric conjugacy class of cocharacters of G with reflex field E_0, and b ∈ G(F) such that (b, μ) is Hodge–Newton irreducible in the sense of the Conventions; in particular [b] ∈ B(G,μ). Then for some finite extension K/F containing E_0, the admissible cell for b of HeckeStacksAndLocalShtukas §HS2.12 (its cell for μ⁻¹ in the orientation of the Conventions, written Gr^b_μ here) has a point x over Spd K whose crystalline representation ξ_x: Γ_K → G(Q_p) (§HS2.11) meets the derived group in an open subgroup: ξ_x(Γ_K) ∩ G_der(Q_p) is open in G_der(Q_p). No minuscule or quasisplit hypothesis is imposed. (GLX26 Proposition 5.9 and proof, arXiv v3 p. 40; Theorem 5.2, arXiv v3 p. 32.)

Replace b by a decent σ-conjugate b′ = gbσ(g)⁻¹ (BunGAndNewtonStrata §1.12). By §3.1 choose a generic η over a finite K; by §2.3 (b′, η) is admissible and PadicHodgeTheory §5.5 gives ξ; by §2.4, G_der ⊆ H°. Choose a faithful representation ρ: G → GL(V) (ReductiveGroups Layer 1). Then ρ∘ξ is crystalline, hence Hodge–Tate (PadicHodgeTheory §3.3), and gap:serre-sen-openness makes ρ(ξ(Γ_K)) open in the Q_p-points of its Zariski closure, which is the scheme-theoretic image ρ(H) (ArithmeticGaloisRepresentations §7.6, in the form over Q_p of the supplier contract); since ρ is a closed immersion, ξ(Γ_K) is open in H(Q_p). As G_der ⊆ H, the intersection ξ(Γ_K) ∩ G_der(Q_p) is open in G_der(Q_p), which carries the subspace topology (Tau Ceti `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective`; the same declaration makes ρ a homeomorphism of H(Q_p) onto the closed subgroup ρ(H)(Q_p)). By HeckeStacksAndLocalShtukas §HS2.12, with its μ read as our μ⁻¹, η is BB(x′) for a point x′ of the admissible cell for b′ whose fibre is ξ (the crystalline classical fibre of §HS2.11); changing the framing by g transports x′ to a point x for b with conjugate crystalline representation. *Needs:* §§2.3, 2.4, 3.1; gap:serre-sen-openness; BunGAndNewtonStrata §1.12; PadicHodgeTheory §§3.3, 5.5; HeckeStacksAndLocalShtukas §§HS2.11, HS2.12; Tau Ceti `TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective`; ReductiveGroups Layer 1; ArithmeticGaloisRepresentations §7.6.

**Checks.**

- The image ξ_x(Γ_K) is compact; openness concerns its intersection with G_der(Q_p), not equality with a noncompact group.
- After a finite extension K′/K the restricted image is closed of finite index in ξ_x(Γ_K), hence open in it, and its derived intersection stays open.
- For a torus G_der = 1 and the assertion is automatic; for the quadratic norm-one torus T with μ = 0 and nontrivial κ(b) ∈ ℤ/2, [b] ∉ B(T,0) and no admissible point exists, so the acceptability hypothesis cannot be dropped.

### 3.3 Open subgroups of rational points are Zariski dense

Let E be a nonarchimedean local field of characteristic zero, J a smooth connected affine group over E, and U ⊆ J(E) an open subgroup for the point topology. Then U is Zariski dense in J. Consequently, if J is a closed subgroup of an affine group G′ and U ⊆ H(E) for a closed subgroup H ⊆ G′, then J ⊆ H°. Let Z ⊆ J be the Zariski closure of U, a closed subgroup, smooth in characteristic zero. By the analytic charts of ReductiveGroupsPartII §RG2.0.2, Z(E) is a closed analytic submanifold of J(E) of dimension dim Z, cut out near 1 by dim J − dim Z local parameters with independent differentials. Since Z(E) contains the open set U, no such parameter exists, so dim Z = dim J and Z = J because J is connected. Serre79 §1.3, pp. 157–158, compares in the same way the Lie algebra of a compact subgroup of GL_V(Q_p) with that of its Zariski closure. DeligneWeightsAndPurity §2.2 states the case of Sp(V) over Q_ℓ. *Needs:* ReductiveGroupsPartII §RG2.0.2 (*smooth-group-analytic-charts*); Tau Ceti `TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective`; ReductiveGroups Layers 2 and 3; ArithmeticGaloisRepresentations §7.6.

**Checks.**

- For J = 𝔾_m over Q_p and U = 1 + pℤ_p, the closure is 𝔾_m, since a proper closed subgroup of 𝔾_m is finite.
- Connectedness is needed: for the disconnected orthogonal group O(2) over Q_p, the open subgroup SO(2)(Q_p) has closure SO(2) ≠ O(2).
- Openness is needed: the compact subgroup of diagonal matrices in GL_2(ℤ_p) has Zariski closure the diagonal torus, not GL_2.

### 3.4 Central lifting of derived containment

Let k be a field of characteristic zero, f: G̃ → G a surjective homomorphism of connected reductive k-groups with central kernel, and J ⊆ G̃ a closed subgroup. If f(J°) ⊇ G_der, then J° ⊇ G̃_der. The derived group D(J°) is connected and f(D(J°)) = D(f(J°)) ⊇ D(G_der) = G_der. Milne iAG Proposition 8.20 and Corollary 8.21(b), p. 131, describe D(J°) as the algebraic subgroup generated by the commutator map and make it connected; Proposition 8.22 and Corollary 8.23, p. 132, make it the connected subgroup variety whose k̄-points form the commutator subgroup of J°(k̄). The image equality is not stated there: it follows by comparing k̄-points, since f carries the commutator subgroup of J°(k̄) onto that of f(J°)(k̄) = f(J°(k̄)), and is derived below from Tau Ceti. As D(J°) ⊆ G̃_der and f restricts to a central isogeny G̃_der → G_der with finite kernel ker f ∩ G̃_der, dimension forces D(J°) = G̃_der. This repairs the crystalline step of GLX26 Proposition 6.7 (arXiv v3 p. 47), where the Galois image is treated as a subgroup of the derived group. Connectedness of D(J°) is read off after base change to k̄ from `TauCeti.CommHopfAlgCat.connectedSpace_derived`, and D(J°) ⊆ G̃_der is `TauCeti.CommHopfAlgCat.derivedDefiningIdeal_map_le` for the inclusion J° → G̃. For the equality, f(J°) is the scheme-theoretic image of J°, so the coordinate map O(f(J°)) → O(J°) is injective, and `TauCeti.CommHopfAlgCat.mapPointsFunctor_derivedMap_app_surjective` makes D(J°)(k̄) → D(f(J°))(k̄) surjective; the closed subgroup f(D(J°)) lies in D(f(J°)) by `TauCeti.CommHopfAlgCat.derivedDefiningIdeal_map_le`, and the two have the same k̄-points, so they are equal because D(f(J°)) is smooth, hence reduced, in characteristic zero. Equivalently, after base change to k̄, `TauCeti.CommHopfAlgCat.faithfullyFlat_derivedMap` makes D(J°) → D(f(J°)) faithfully flat. *Needs:* ReductiveGroups Layers 3 and 6; Tau Ceti `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`, `TauCeti.CommHopfAlgCat.derivedDefiningIdeal_map_le`, `TauCeti.CommHopfAlgCat.connectedSpace_derived`, `TauCeti.CommHopfAlgCat.mapPointsFunctor_derivedMap_app_surjective`, `TauCeti.CommHopfAlgCat.faithfullyFlat_derivedMap`.

**Checks.**

- For GL_2 → PGL_2 (kernel 𝔾_m) and J = GL_2 or J = SL_2, f(J°) = PGL_2 and J° ⊇ SL_2. Here D(J°) = SL_2, of dimension 3, maps onto D(PGL_2) = PGL_2 on k̄-points with kernel μ_2, as the derived-image equality requires.
- For J a maximal torus of GL_2, f(J°) is a maximal torus of PGL_2, the hypothesis fails, and so does the conclusion.
- The central kernel is needed: for det: GL_2 → 𝔾_m and J the diagonal torus, f(J°) ⊇ (𝔾_m)_der = 1 holds but J° does not contain SL_2.

### 3.5 Open derived image through a z-extension

Let f: G̃ → G be a z-extension (central kernel an induced torus, G̃_der simply connected; ReductiveGroupsPartII §RG2.1.5) and [b̃] ∈ B(G̃,μ̃) a lift of [b] ∈ B(G,μ) (BunGAndNewtonStrata §1.43). Then the following are equivalent: there are a finite K/F and a crystalline period point of type (b, μ) over K whose Galois image meets G_der(Q_p) openly; there are a finite L/F containing the reflex field of μ̃ and such a point of type (b̃, μ̃) for G̃. The comparison concerns the specified lifted data, not arbitrary continuous representations, and the derived map G̃_der → G_der is not assumed surjective on Q_p-points. (GLX26 Proposition 6.7, crystalline step, arXiv v3 p. 47; Proposition 6.6(1), arXiv v3 pp. 45–46.)

Upstairs to downstairs: f∘ξ̃ has type (b, μ), and f maps an open subgroup of G̃_der(Q_p) onto an open subgroup of G_der(Q_p) because the central isogeny is étale (ReductiveGroupsPartII §RG2.0.2, *smooth-morphism-open-map*). Downstairs to upstairs: HeckeStacksAndLocalShtukas §HS2.13 identifies the admissible loci after base change to L ⊇ K and the reflex field of μ̃, so x lifts to x̃ with f∘ξ̃ conjugate to ξ|Γ_L. The image ξ(Γ_L) has finite index in ξ(Γ_K), so its derived intersection is open; by §3.3 the closure H of ξ(Γ_L) contains G_der. The closure H̃ of ξ̃(Γ_L) has scheme-theoretic image f(H̃) equal to a G(Q_p)-conjugate of H (ArithmeticGaloisRepresentations §7.6, in the form over Q_p of the supplier contract), so f(H̃°), the identity component of that conjugate, contains G_der, which is normal, and §3.4 gives H̃° ⊇ G̃_der. For a faithful representation ρ̃ of G̃, ρ̃∘ξ̃ is crystalline, hence Hodge–Tate (PadicHodgeTheory §3.3); gap:serre-sen-openness and the closed immersion ρ̃ make ξ̃(Γ_L) open in H̃(Q_p), as in §3.2, and its intersection with G̃_der(Q_p) is open. *Needs:* §§3.3, 3.4; gap:serre-sen-openness; HeckeStacksAndLocalShtukas §HS2.13; BunGAndNewtonStrata §1.43; ReductiveGroupsPartII §§RG2.0.2, RG2.1.5; ArithmeticGaloisRepresentations §7.6; PadicHodgeTheory §§3.3, 5.5; ReductiveGroups Layer 1.

**Checks.**

- For the z-extension GL_2 → PGL_2, the image of SL_2(Q_p) in PGL_2(Q_p) is open of index [Q_p^× : `Q_p^{×2}`] (4 for odd p, 8 for p = 2); it is a proper subgroup, and openness, not surjectivity, is what transfers.
- For G̃ = G × 𝔾_m → G with G_der simply connected, a lift may carry an extra central character, so ξ̃(Γ_L) need not lie in G̃_der; the conclusion concerns its intersection with G̃_der(Q_p).
- If the crystalline step tested only ξ̃(Γ_L) ⊆ G̃_der, it would fail already for G̃ = GL_2, where det∘ξ̃ is a nontrivial power of the cyclotomic character for μ̃ = (1,0).

### Examples

A projective-line flag needs one parameter transcendental over its reflex field; a torus flag needs none. For the central isogeny SL_2 → PGL_2 the rational image is a proper open subgroup. For G × 𝔾_m → G a lift may carry an extra central character, so openness is tested on the intersection with the derived group. For det: GL_2 → 𝔾_m, whose kernel is not central, derived containment does not lift.

### Dependencies

Layer 2; SchemeAndStackFoundations §0.8; ReductiveGroupsPartII §§RG2.0.2, RG2.0.4, RG2.1.5; BunGAndNewtonStrata §§1.12, 1.43; HeckeStacksAndLocalShtukas §§HS2.11–HS2.13; PadicHodgeTheory §§3.3, 5.5; gap:serre-sen-openness (§§3.2, 3.5); ArithmeticGaloisRepresentations §7.6; ReductiveGroups Layers 1, 2, 3 and 6; Tau Ceti `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`, `TauCeti.CommHopfAlgCat.derivedDefiningIdeal_map_le`, `TauCeti.CommHopfAlgCat.connectedSpace_derived`, `TauCeti.CommHopfAlgCat.mapPointsFunctor_derivedMap_app_surjective`, `TauCeti.CommHopfAlgCat.faithfullyFlat_derivedMap`, `TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.PointTopology.isClosedEmbedding_comap_of_surjective`; Mathlib `AlgebraicIndependent`, `AlgebraicGeometry.UniversallyOpen.of_flat`, `AlgebraicGeometry.Scheme.Hom.isOpenMap`, `Algebra.FormallyEtale.iff_exists_algEquiv_prod`. Sections 3.3 and 3.4 are independent of Layers 0–2.

## Layer 4: compact torsor stabilizers

### 4.1 Compact crystalline-image torsor components

Let K/F be finite, Ω the completion of K̄ and ξ: Γ_K → G(Q_p) continuous. Let T_ξ → Spd K be the G(Q_p)-torsor obtained from the Γ_K-torsor Spd Ω → Spd K (DiamondsAndVStacks §D6.3) by change of group along ξ (contracted product, SchemeAndStackFoundations §2.3, for the torsors of DiamondsAndVStacks §D3.10): T_ξ is the quotient of Spd Ω × G(Q_p) by Γ_K acting through γ·(x, g) = (γx, gξ(γ)⁻¹), and G(Q_p) acts by left multiplication on the second factor. Its geometric fibre is G(Q_p) with the actions of the Torsors convention. Put C = ξ(Γ_K), a compact closed subgroup. With the torsor conventions above, π_0(T_ξ) ≅ G(Q_p)/C equivariantly, and the component indexed by gC has stabilizer gCg⁻¹. This identifies actual connected components; no formula π_0(X/H) = π_0(X)/H for an arbitrary group action is used. (GLX26 proof of Lemma 6.12, arXiv v3 pp. 50–51.)

Each geometric Galois orbit gC is compact and descends to a closed subdiamond `T_{gC}`. Writing C as the inverse limit of the finite transitive Γ_K-sets C/U, the descended finite étale K-covers are connected, and the qcqs limit comparison with the spectral clopen criterion shows `T_{gC}` connected. Compactness of C and the compact open subgroups of G(Q_p) separate distinct cosets by C-invariant clopen sets, whose descents separate the orbit subdiamonds; so each `T_{gC}` is a maximal connected subset. The restricted-quotient interface of DiamondsAndVStacks §D5.16 is applied only after this separation is verified. *Needs:* ArithmeticGaloisRepresentations §1.1; DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.3, D6.5; SchemeAndStackFoundations §2.3; Tau Ceti `TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.PointTopology.isOpenEmbedding_mapValue_integer`, `TauCeti.PointTopology.isCompact_range_mapValue_integer` (compact open subgroups of G(Q_p) as integral points of finite-type ℤ_p-groups, such as congruence subgroups).

**Checks.**

- If ξ is trivial, C = 1, each component is a copy of Spd K and every stabilizer is trivial.
- For finite C, the identity coset C descends to a finite connected étale K-cover with stabilizer C, and the coset gC has stabilizer gCg⁻¹. For C = {1, diag(1,−1)} ⊂ GL_2(Q_p) and g = [[1,1],[0,1]], gCg⁻¹ contains [[1,−2],[0,−1]] ∉ C, so the stabilizer of gC is not C.
- For an infinite compact C, the finite transitive quotients give the connected components; declaring the geometric fibre points to be components would give the wrong, trivial stabilizer.

### 4.2 Open derived stabilizers in the ambient tower

Let y be a crystalline period point over finite K/F with open derived image (§3.2), T_y its period torsor and j: T_y → Y a G(Q_p)-equivariant map to a locally spatial diamond. Here T_y is the fibre at y of the universal torsor of HeckeStacksAndLocalShtukas §HS2.11, a left torsor through g·τ = τ∘g⁻¹; as §HS2.11 makes that fibre the torsor of ξ_y, inverting the second factor identifies T_y with T_ξ of §4.1 for ξ = ξ_y. Every connected component of Y containing the image of a component of T_y has a stabilizer whose intersection with G_der(Q_p) is open in G_der(Q_p). If G(Q_p) acts transitively on π_0(Y), this holds for every component of Y. Transitivity is a hypothesis; for the infinite-level local shtuka tower over an algebraically closed field it is HeckeStacksAndLocalShtukas §HS2.16 (for minuscule μ, and for general μ under the finite-level openness hypothesis stated there). (GLX26 Lemma 6.12 and proof, arXiv v3 pp. 50–51.)

A continuous map sends a connected component into a connected component, and equivariance puts the source stabilizer inside the target stabilizer. By §4.1 the source stabilizer is a conjugate of ξ_y(Γ_K), whose derived intersection is open by §3.2 and normality of G_der. Under transitivity every component is a translate of one reached in this way; conjugate the inclusion. Connectedness of a quotient alone does not give transitivity. *Needs:* §§3.2, 4.1; HeckeStacksAndLocalShtukas §§HS2.11, HS2.16; DiamondsAndVStacks §D3.10.

**Checks.**

- The source stabilizer equals a conjugate of the compact image, while the ambient stabilizer is only asserted to contain it; for Y a point it is all of G(Q_p).
- Without transitivity the conclusion is restricted to components reached from T_y: for Y = T_y ⊔ (G(Q_p) × Spd K), with G(Q_p) translating the second summand, the components g × Spd K have trivial stabilizer, whose intersection with G_der(Q_p) is not open when G_der ≠ 1.
- For a torus G_der = 1 and every stabilizer trivially has open derived intersection.
- The open derived image of the source is needed: for G = GL_2 and the trivial representation ξ, whose image {1} meets SL_2(Q_p) in {1}, take Y = T_ξ and j the identity. Every component stabilizer is trivial by §4.1, and {1} is not open in SL_2(Q_p), since the elements [[1,pⁿ],[0,1]] ≠ 1 tend to 1; the conclusion of §4.2 fails, while that of §4.1 holds.

### Examples

If ξ is trivial, the torsor is G(Q_p) × Spd K and every component stabilizer is trivial. If C is finite, the identity coset descends to a finite connected field cover with stabilizer C, and the coset gC has stabilizer gCg⁻¹. An infinite compact C is recovered from its finite transitive quotients and gives a nontrivial stabilizer although the geometric fibre points are separate. For an ambient component only the inclusion of the source stabilizer is asserted.

### Dependencies

Layer 3 (§3.2); ArithmeticGaloisRepresentations §1.1; DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.3, D6.5; SchemeAndStackFoundations §2.3; HeckeStacksAndLocalShtukas §§HS2.11, HS2.16; Tau Ceti `TauCeti.PointTopology.isTopologicalGroup`, `TauCeti.PointTopology.isOpenEmbedding_mapValue_integer`, `TauCeti.PointTopology.isCompact_range_mapValue_integer`.

## Downstream consumers

The crystalline period point with open derived image (§3.2), the z-extension comparison (§3.5) and the ambient stabilizer theorem (§4.2) are the arithmetic inputs to the GLX component theorem for local shtuka towers and affine Deligne–Lusztig varieties: §3.2 is its step (3)⇒(4), §4.2 enters its step (4)⇒(5), and §3.5 its reduction to simply connected derived groups. The quasisplit converse, GLX26 Proposition 5.11, is deduced from that theorem and is not an input to any target here. Those consumers supply the global transitivity, normalizer and generation arguments of the component classification themselves.

## References

- [GLX26] Ian Gleason, Dong Gyu Lim and Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*, arXiv:2208.07195v3 (November 2025); published in Inventiones mathematicae (2026), [doi:10.1007/s00222-025-01386-1](https://doi.org/10.1007/s00222-025-01386-1). Theorem, section and equation numbers and the page numbers above refer to arXiv v3.
- [Chen14] Miaofen Chen, *Composantes connexes géométriques de la tour des espaces de modules de groupes p-divisibles*, Annales scientifiques de l'École normale supérieure (4) 47 (2014), 723–764, [SMF](https://smf.emath.fr/system/files/2017-08/ens_ann-sc_47_723-764.pdf). Page numbers are those of the journal.
- [Serre79] Jean-Pierre Serre, *Groupes algébriques associés aux modules de Hodge–Tate*, Astérisque 65 (1979), 155–188, [Numdam](https://www.numdam.org/item/AST_1979__65__155_0/).
- [Milne iAG] J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*, version 2.00 (2015), [author page](https://www.jmilne.org/math/CourseNotes/iAG200.pdf).
- [Stacks] The Stacks Project, Tags [054L](https://stacks.math.columbia.edu/tag/054L) (Lemma 29.37.21), [02GL](https://stacks.math.columbia.edu/tag/02GL) (Lemma 29.37.7), [03WT](https://stacks.math.columbia.edu/tag/03WT) (Lemma 29.37.13) and [01UA](https://stacks.math.columbia.edu/tag/01UA) (Lemma 29.26.10).
