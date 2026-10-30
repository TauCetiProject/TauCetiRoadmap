# Roadmap: the C_st-conjecture for dagger varieties

**Summary.** Build the fundamental period diagram for smooth dagger varieties, identify its two bundle-cohomology defects, and prove comparison for products of varieties with nonnegative de Rham slopes, algebraic analytifications, almost proper varieties, the specified tube complements, and proper times Stein spaces. For small varieties the diagram is equivalent to acyclicity, a curvature condition, and the signed height identity. Recover arithmetic Hyodo–Kato and filtered de Rham cohomology from pro-étale cohomology with Galois action, and recover the extended period modules from the geometric cohomology functor. The unrestricted assertions of CN25 Conjectures 6.21 and 9.1 are research statements; the end theorems here have the hypotheses of CN25 Theorems 8.1, 9.3 and 9.8 and Proposition 8.17 (CN25 lines 2185, 2466, 2713, 2735, 2821).

## Scope and ownership

This roadmap owns the C-lattice version of filtered Frobenius–monodromy modules, its particular modifications and bounded period-Hom theorems; the analytic fundamental square and its cohomological filtration; the qBC filtration of analytic cohomology and its defect, height and equivalence theorems; the geometric comparison classes; exhaustion obstructions and proper-times-Stein comparison; and arithmetic and geometric recovery. Its filtered module adds an embedded de Rham lattice to the arithmetic coefficient module. Its bundle construction is the application of geometric gluing to that pair.

The following mathematical objects have one supplier and are not reconstructed here:

- Mathlib supplies the algebraic period-ring carriers `BDeRhamPlus` and `BDeRham`, finite generation `Module.Finite`, freeness `Module.Free`, bundled modules `ModuleCat`, the Witt-fraction-field Frobenius carrier `WittVector.Isocrystal` with its one-dimensional classification `WittVector.isocrystal_classification`, and the categorical predicate `CategoryTheory.BicartesianSq`.
- Tau Ceti supplies adic spaces and absolute Fargues–Fontaine period-domain and topological quotient geometry. The coherent geometric curve and its bundle theory are VectorBundlesAndIsocrystals VB1 and VB2 classification.
- AdicSpacesPartII R0–R1 owns morphisms, completed tensors and analytification. Dagger spaces, their de Rham complex, strict differentials, the dagger–rigid comparison, logarithmic forms and formal tubes are AdicSpacesPartIV F1.7–F1.12 and F1.16. Its strict-differential, finiteness and Künneth theorems have discretely valued bases and its resolution lemma is affinoid; the C-valued extensions are exact contracts below. Resolution of proper rigid pairs is PadicHodgeTheory §2.7's analytic log resolution.
- PadicHodgeTheory §§0.2–0.5, 3.4–3.7 and 5.2 owns generic rational period structures, arithmetic filtered modules, admissibility and arithmetic period functors; its §2.7 owns analytic log resolution of proper rigid spaces. CrystallineCohomology §CR.4.7 owns the slope decomposition of finite Witt isocrystals over perfect residue fields. VectorBundlesAndIsocrystals VB1–VB3 owns geometric bundle classification, slope cohomology and finite Banach–Colmez theory. Reasonable Pairs and qBC form the Part II extension of that finite BC direction, specified by the contract below rather than a second finite BC theory here.
- LocallyAnalyticDistributions §§0.0–0.2 owns nonarchimedean locally convex categories, strict derived categories, their left hearts and compact-type duality. Its distribution-algebra extensions do not supply the additional derived-limit contract below.
- CohomologyComparisons §§4.8–4.9 owns algebraic period comparison and dual descriptions. Its §4.9a owns analytic Hyodo–Kato realization, and the overconvergent crystalline complex of §2.8 is an exact contract below; §§4.10–4.11 state proper rigid comparison over K and C. Those two comparison targets are imported, including their induced filtration, and have no duplicate theorem section here. The proper fundamental square remains an application in Layer 1.
- ClassicalAdicEtaleCohomology §§1.3–1.4, 8.4 and 9.7 owns the analytic coefficient, proper-base-change and trace framework. Its integral proper-factor contract below is stronger than a prime-to-p torsion statement.

The qBC extension and the model-free dagger extension of the comparison direction are exact supplier contracts. They are not replaced by generic propositions standing for their conclusions. The positive crystalline affinoid equality and the continuous splitting each retain a separate proof obligation. Neither is an input to the geometric comparison classes or to the two principal recovery theorems.

## Conventions

Fix a prime p. Let K be complete discretely valued of characteristic zero, with perfect countable residue field k of characteristic p. Put F=W(k)[1/p], let Fⁿʳ be the algebraic maximal unramified extension inside K̄, and put C=completion(K̄). Spaces are separated, taut and countable at infinity. All diagrams and cohomology use these hypotheses; equal-characteristic fields and nonreduced nonsmooth thickenings do not acquire the comparison theorems. Completion of Fⁿʳ is an explicit scalar extension, used in the crystalline splitting and the positive crystalline refinement (CN25 §1.3, pp.7–8, lines 329–381; §7.3, lines 2394–2406).

Use Nφ=pφN, diagonal tensor operators and the period coordinate u with N(u)=−1 and φ(u)=pu. The Fontaine period t satisfies φ(t)=pt and g(t)=χ(g)t. Twisting M by {−r} multiplies φ by p⁻ʳ and leaves N unchanged. The degree of the associated filtered bundle is t_H−t_N; it is this degree that is used for nonnegative slopes. Cohomological shifts are cohomological shifts: a group in degree i is placed at [−i]. All spaces and functor categories live in fixed universes, with the category of sympathetic C-algebras made small in a larger universe; no arbitrary enlargement is used to replace its natural transformations by all C-point maps (CN25 §5.1, pp.31–33, lines 1600–1677; §5.3, p.36, lines 1798–1832).

Let LH(C_Q_p) be the abelian left heart of the bounded-below strict derived category of locally convex Q_p spaces. Tildes denote its cohomology; untilded objects denote their classical realizations. VS denotes the source's Vector Space category on sympathetic algebras. TVS consists of functors from those algebras to LH(C_Q_p) satisfying the boundedness condition on algebra maps in Definition 4.1; its maps are natural transformations. Evaluation at C yields an ordinary locally convex space only for classical objects. Hom_VS and Hom_TVS are neither arbitrary linear maps of C-points nor maps required to be period-linear (CN25 Definition 4.1, p.20, line 960; Definition 4.5, pp.21–22, line 1007).

A torsion period Pair means the left-heart object represented by an injection W₁→W₂ of topological B_m-modules for some m≥1, where B_m=B_dR⁺/tᵐ, followed by the specified completed scalar extension to sympathetic algebras. A reasonable B_m-module has its module Fréchet topology or is a c-compact inductive limit of Banach B_m-modules. A reasonable Pair has both terms reasonable and of the same type. The qBC category consists of TVS objects with positive finite-BC subobject, a torsion period Pair, reasonable or not, as middle graded piece, and negative finite-BC final quotient; its height is the sum of the two finite-BC heights. When the middle Pair is reasonable, the positive subobject is the largest sub-BC of curvature >0 and the final quotient the largest quotient BC of curvature <0, so the filtration is unique (CN25 Proposition 4.26, line 1432); without reasonableness only a given filtration is part of the data. These are the imported meanings, including the natural transformations and the original topologies (CN25 Definitions 4.4–4.5, CN25 lines 992–1025; §§4.3–4.4, CN25 lines 1259–1263, 1339–1341).

Write Fʳⁱ=Hⁱ(FʳRΓ_dR), Bⁱ=Hⁱ_dR(X/B_dR⁺), Filʳⁱ=im(Fʳⁱ→Bⁱ) and Aʳⁱ=ker(Fʳⁱ→Bⁱ). The induced lattice in Bⁱ[1/t] is F⁰ of the localized cohomological filtration. Derived completed tensors and derived simultaneous invariants precede taking cohomology. The square has maps a:H→X, b:H→F, c:X→B and d:F→B, with u=(a,b) and v=(c,−d). BC and qBC height is signed: ht(Q_p)=1, while a torsion B_dR⁺-Pair contributes height 0. Zero objects have no HN slopes, so weak admissibility and acyclicity include zero (CN25 lines 2294–2334, 2350–2381).

**Checks.**

- For φ(e₀)=e₀, φ(e₁)=pe₁ and N(e₁)=e₀, N(e₀)=0, one has Nφ(e₁)=pe₀=pφN(e₁). With diagonal monodromy, N(e₁+ue₀)=0 while N(e₁−ue₀)=2e₀. Both remain distinct for p=2 since the coefficient field has characteristic zero.
- The lattices B_dR⁺ and tB_dR⁺ on the trivial Frobenius line give O and O(−1), with degrees 0 and −1. A Hodge jump 1 with Newton number 0 gives lattice t⁻¹B_dR⁺ and degree 1. Reversing t_H−t_N reverses these values.
- At the degree-zero point, u(1)=(1,1) and v(1,1)=1−1=0; the sum would give 2. For the dual of the jump-one line, the jump is −1: Filʲ(D∨)=(Fil¹⁻ʲD)⊥.
- In the two-term complex K→K with identity differential, both cohomology groups are 0; in K→K with zero differential they are K in degrees 0 and 1. Moving the second group to [1] instead of [−1] changes its degree.
- For a torsion module B_dR⁺/t the height is 0, whereas Q_p has height 1 despite C-dimension 0. These distinguish height, Q_p-dimension, BC curvature and bundle slope.

- On the permutation representation Q_p³ of S₃, let g=(12) and h=(23). Then gh(e₁)=e₂ whereas hg(e₁)=e₃. The contragredient action (g·f)(v)=f(g⁻¹v) gives gh(e₁∨)=e₂∨ as well; omitting the inverse reverses the multiplication order. The same rule for the cyclic transposition squares to identity (CN25 §5.1.1, p.31, CN25 line 1605).
- Over K=Q₂(√2), with π=√2, the p-normalized logarithmic coordinate u equals 2u_π for compatible roots. Hence N(u_π)=−1/2 and N(u)=−1. Over unramified Q₃ the same p-coordinate has N(u)=−1. Thus the generic period coordinate is p-normalized rather than a silent uniformizer normalization (PadicHodgeTheory §0.5; CN25 §5.4.1, CN25 line 1856).

## Exact supplier contracts

### From Mathlib

Use `BDeRhamPlus` and `BDeRham` in `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` and `:88`, under a commutative ring R, prime p, p nonunit in R, and p-adic completeness. The first is the completion of the p-inverted Witt tilt along the theta kernel. The second localizes at completed images of generators of that kernel. The geometric Fontaine complete-DVR and field identifications and their natural topologies are part of the rational-period supplier contract. At p=0 in R these carriers are zero, so the geometric nonzero field hypotheses cannot be omitted.

Use `WittVector.Isocrystal` and `WittVector.isocrystal_classification` in `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` and `:180` for Frobenius-linear automorphisms over the Witt fraction field and the one-dimensional classification over an algebraically closed residue field. The carrier itself has no finite-dimensionality, monodromy, descent or filtration condition; the classification theorem requires dimension one. General finite coefficients and higher-rank slopes are the specified suppliers below.

Use `Module.Free` from `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` for existence of a basis and `Module.Finite` from `Mathlib/RingTheory/Finiteness/Defs.lean:121` for finite generation of the top submodule. They are separate conditions. `ModuleCat` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean` gives bundled algebraic modules and linear maps. Use `CategoryTheory.BicartesianSq` in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56` for a square that is both a pullback and a pushout; strict exactness must be interpreted in the supplied left heart.

### From Tau Ceti

Use `TauCeti.AdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` for the adic carrier; `TauCeti.FarguesFontaine.spaY` and `TauCeti.FarguesFontaine.frobeniusHomeomorph` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116` and `:218` for the absolute period domain and Frobenius; and `TauCeti.FarguesFontaine.spaX` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56` for its topological quotient. The relative coherent curve, completed untilt local ring and modification interfaces used below are consumed through VectorBundlesAndIsocrystals VB1. None of these imports is a construction of dagger cohomology.

### From TauCetiRoadmap.AdicSpacesPartII

R0.5, completed tensor products of Banach modules, supplies the separated completion of the projective ultrametric tensor seminorm and its universal property. R0.10–R0.17 supplies properness, continuous differentials and smooth morphisms. R1 supplies analytification and the rigid–adic comparison. Preserve completeness, Hausdorffness and the actual scalar topologies in every specialization.

### From TauCetiRoadmap.AdicSpacesPartIII

R3.4, quasi-Stein spaces, target Cohomology of a countable open exhaustion, supplies for a countable admissible exhaustion X=⋃X_n of a rigid space and a sheaf of abelian groups F the exact sequence 0→lim¹_n F(X_n)→H¹(X,F)→lim_n H¹(X_n,F)→0, with lim¹ the cokernel of the difference map on the product of groups and no surjectivity of restrictions assumed. It is used in §4.5 for coherent differential forms on the rigid completion of a dagger Stein space, over C.

### From TauCetiRoadmap.AdicSpacesPartIV

F1.7–F1.9 supplies dagger spaces, completion, strict neighbourhoods, continuous differentials and the overconvergent de Rham complex. F1.9 supplies strict differentials in its stated discretely valued range; F1.11 supplies its stated finiteness and discretely valued quasi-compact Künneth theorems. F1.8, Coherent cohomology of partially proper dagger spaces equals that of the associated rigid space, supplies vanishing of higher coherent cohomology on a dagger Stein space over any complete nontrivially valued K, in particular over C. F1.12 and F1.16 supplies logarithmic complexes and formal generic fibres and tubes; these contracts keep their own resolution and finiteness hypotheses. Only de Rham statements are requested below: finiteness of Hyodo–Kato and B_dR⁺-cohomology, the Hyodo–Kato side of each tube comparison and the induced lattice maps are derived here from them through the natural Hyodo–Kato comparisons of the dagger-analytic-complexes contract (CN25 Proposition 8.4 proof, line 2564).

What AdicSpacesPartIV must provide (gap:dagger-de-rham-finiteness-over-c): Provide finite-dimensional de Rham cohomology over C in every degree for three classes of smooth dagger spaces over C: quasi-compact ones, naive interiors of smooth dagger affinoids (defined in §1.2), and dagger analytifications of smooth finite-type C-schemes.

What AdicSpacesPartIV must provide (gap:dagger-strictness-over-c): Provide over C the strictness and closed image of every de Rham differential on global sections of a smooth dagger affinoid or smooth dagger Stein space, for its fringe, respectively Fréchet, topology.

What AdicSpacesPartIV must provide (gap:dagger-kunneth-over-c): Provide over C the cup-product Künneth isomorphism ⊕_(p+q=n) H^p_dR(X)⊗_C H^q_dR(Y)≅H^n_dR(X×Y), for every n≥0, for smooth dagger spaces X,Y over C whose de Rham cohomology is finite dimensional in every degree.

What AdicSpacesPartIV must provide (gap:geometric-finiteness-tubes): Provide, for the two tube settings of §§3.6–3.7 (a weak formal model with local étale charts Spf(O_K{T₁,…,T_n}/(T₁⋯T_s−π)), 1≤s≤m≤n, smooth proper generic fibre and boundary the intersection or the union of the loci T_j=0 for s<j≤m; and a smooth scheme-theoretic complete intersection of c hypersurfaces of codimension c in Pⁿ_K with tubes |f_j|≤ε on integral trivializations), that restriction from the complement of the boundary to the complement of its tube is a quasi-isomorphism of unfiltered de Rham complexes over K and after base change to C, in the second setting for every ε∈|K×| below one bound ε₀ that serves every nonempty Čech intersection of the union case.

### From TauCetiRoadmap.PadicHodgeTheory

§§0.2–0.5 supplies the geometric rational periods, their embeddings, t, Frobenius and N(u)=−1; §§3.4–3.7 and 5.2 supplies finite (φ,N,G_K)-modules, weak admissibility, the semistable fundamental complex in its stated range. The acyclic smooth-Galois reconstruction and the bounded subfiltration are the two additional contracts below (CN25 Lemmas 5.3–5.4 and Theorem 5.8–Corollary 5.10, CN25 lines 1650–1677, 1730–1773). Smooth Galois Hom is the union of continuous Hom equivariant for G_L over finite extensions L/K, with its natural semilinear descent action. The Hodge filtration is the decreasing convolution filtration and its dual is annihilator in degree 1−j. Its finite-K results alone are not an assertion over every discretely valued K.

§2.7, Primitive comparison and integral finiteness, supplies `properRigidLogResolution`: for a reduced proper rigid X/C and a dense smooth Zariski open U it constructs a proper morphism Y→X, isomorphic over U, with Y smooth proper and reduced boundary Y∖U a strict normal crossings divisor. Its standing C is the completion of an algebraic closure of a finite extension of Q_p; the contract below extends it to the present C.

What PadicHodgeTheory must provide (gap:proper-pair-resolution-over-c): Provide `properRigidLogResolution` over C, the completion of an algebraic closure of any complete discretely valued K of characteristic zero with perfect countable residue field, in particular for a smooth proper rigid X over C and the complement U of a nowhere dense closed analytic subspace Z, giving a proper surjective Y→X from a smooth proper rigid space, isomorphic over U, whose reduced inverse image of Z is a strict normal crossings divisor.

What PadicHodgeTheory must provide (gap:acyclic-arithmetic-period-hom): Provide, for every acyclic arithmetic filtered (φ,N,G_K)-module (M,Fil) over a complete discretely valued K of characteristic zero with perfect countable residue field and V=V_st(M,Fil), continuous evaluation isomorphisms `Hom^sm_(G_K)`(V,B_st)≅M∨ of (φ,N,G_K)-modules over Fⁿʳ and `Hom_(G_K)`(V,B_dR)≅M_K∨ of filtered K-modules with Filʲ(M_K∨)=(Fil¹⁻ʲM_K)⊥, and, when the φ-slopes lie in [0,r], Fil⁰M_K=M_K and Filʳ⁺¹M_K=0, the same isomorphisms for the bounded kernel V_stʳ=tʳV_st with the twist {r} (CN25 Theorem 5.8 and Corollaries 5.9–5.10, lines 1730–1770).

What PadicHodgeTheory must provide (gap:bounded-arithmetic-subfiltration): Provide, for every acyclic arithmetic filtered (φ,N,G_K)-module over a complete discretely valued K of characteristic zero with perfect countable residue field, with φ-slopes in [0,r], Fil⁰M_K=M_K and Filʳ⁺¹M_K=0, a weakly admissible filtration Fil₁ with Filⁱ₁M_K⊆FilⁱM_K for every i and the same two filtration bounds (CN25 Lemma 5.4, line 1670).

What PadicHodgeTheory must provide (gap:positive-crystalline-hom): Provide, for every integer r≥0 and every finite Frobenius module M over Fⁿʳ with slopes in [0,r], with X_crisʳ(M)=(M⊗B_cris⁺)^(φ=pʳ), that every λ∈M∨⊗t⁻ʳB_cris⁺ whose evaluation pairing sends the C-points X_crisʳ(M)(C) into B_cris⁺ lies in M∨⊗B_cris⁺, compatibly with extension of scalars to F̂ⁿʳ and with Frobenius (the final equality of CN25 Remark 9.9(ii), lines 2862–2865).

What PadicHodgeTheory must provide (gap:galois-period-hom-vanishing): Provide the continuous G_L-equivariant vanishing Hom(C,B_dR)=0 and Hom(tʲB_dR⁺/tᵏB_dR⁺,B_dR)=0 for integers j<k and finite extensions L/K, with compatible topologies, density and Tate twists, as in CN25 Proposition 2.14(iv), for every complete discretely valued K of characteristic zero with perfect countable residue field.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

VB1, The exact tensor isocrystal-to-bundle functor, Slope-sensitive cohomology of standard bundles, Untilts and completed local rings, and Harder–Narasimhan filtration of geometric bundles, supplies the curve, its local period rings and slope cohomology. VB2 classification, Geometric classification of vector bundles and Hom and extension calculus for geometric bundles, identifies slope-zero bundles with sums of O. VB3, Sympathetic algebras and the classical category, Curvature, the tilted coherent heart and HN invariants, and Period modules and curvature calculus, supplies finite BC, its curvature filtration, Le Bras realization and the formula ht(H⁰E)−ht(H¹E)=rank E. Within VB3 Period modules and curvature calculus, Curvature-zero finite-length modules identifies finite-length B_dR⁺-modules with the curvature-zero BC objects, so that natural VS maps between them are exactly the B_dR⁺-linear maps (CN25 Proposition 3.17), and VS Hom vanishing from torsion period modules proves that every natural VS map from a BC object killed by a power of t to B_dR⁺ or to B_dR is zero, its bounded-image step included and without assuming the map period-linear (CN25 Corollary 3.18). In particular H¹(O(−1)) has height −1, whereas O has H⁰=Q_p of height 1. A torsion sheaf at a point other than ∞ has height 0 and positive curvature, so positive curvature alone gives no strict height inequality.

What VectorBundlesAndIsocrystals must provide (gap:period-lattice-gluing): Provide effective gluing of a finite projective B_e-module to a full B_dR⁺ lattice over their identified B_dR realization, compatibly with tensor, dual and cohomology, and identify the bounded simultaneous period eigenspace for every finite (φ,N)-module of slopes in [0,r] with the sections of its nonnegative-slope modification.

What VectorBundlesAndIsocrystals must provide (gap:qbc-pairs): Extend finite BC theory to the natural TVS category on sympathetic algebras, torsion B_dR⁺-Pairs and qBC objects, with signed additive height, dense finite-torsion presentations of every torsion B_dR⁺-Pair (CN25 Theorem 9.8 proof, line 2834), uniqueness of the curvature filtration of a qBC whose middle Pair is reasonable (CN25 Proposition 4.26, line 1432) and compatibility with finite BC.

VB3, Curvature, the tilted coherent heart and HN invariants, target Artinian property of BC, supplies stationarity of every descending chain of BC subobjects of a BC object.

What VectorBundlesAndIsocrystals must provide (gap:bc-countable-inverse-limits): Provide, from the Artinian property of BC (VB3, Curvature, the tilted coherent heart and HN invariants), that R¹lim vanishes for every countable inverse system of finite BC objects with BC transition maps, in the natural VS realization and in the left heart, compatibly with the realization functors (CN25 Remark 3.15, line 764).

What VectorBundlesAndIsocrystals must provide (gap:natural-period-hom): Provide vanishing of natural VS Ext¹ into B_dR from finite BC objects of curvature ≤0, in particular from finite-length B_dR⁺-modules (CN25 Lemma 3.26(i)), the rank-equals-height theorem for natural VS Hom into B_dR from finite BC objects of curvature ≤0 (CN25 Proposition 3.27(i)), and the comparison of VS Hom with TVS Hom on the objects used in geometric recovery.

### From TauCetiRoadmap.CrystallineCohomology

§CR.4.7, Slope decomposition on the existing isocrystal carrier, supplies for a perfect field k of characteristic p the canonical decomposition of a finite-dimensional `WittVector.Isocrystal` over the fraction field of W(k) into isoclinic pieces, the vanishing of Hom between distinct slopes, and over algebraically closed k its decomposition into standard blocks. Here it is applied over k̄: the completion F̂ⁿʳ of Fⁿʳ is W(k̄)[1/p] with Frobenius σ, and a finite Frobenius module over Fⁿʳ is extended to F̂ⁿʳ before the classification is applied. VectorBundlesAndIsocrystals VB0's Dieudonné–Manin classification has coefficient field the completion of the maximal unramified extension of a local field with residue field F̄_q, so it does not cover a residue field such as the perfection of F_p(z), whose algebraic closure has transcendence degree one over F̄_p.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.0 supplies the nonarchimedean locally convex categories, projective and inductive tensors, strict derived categories and abelian left hearts; §0.2 supplies strict-sequence and three-space results. Use its non-Hausdorff category when forming the heart, with Hausdorffness imposed where used. Compact-type regularity and strong duality are used with their coefficient-field hypotheses, rather than transferred from finite extensions of Q_p to arbitrary C without proof.

The ordinary projective limits of §0.0 and the strict countable inverse-limit theorem of §0.2 (Fréchet complexes, strict Roos surjectivity, finite-dimensional Mittag–Leffler cohomology) do not supply derived limits of the analytic towers of Layer 4: their terms, such as O(D_n)/C, are infinite dimensional, and their R¹lim terms are obstructions computed in Layer 4 rather than hypotheses. §0.0 builds the strict derived category from bounded complexes, whereas the analytic complexes of a non-quasi-compact space can have unbounded amplitude: for the countable disjoint union of the polyannuli Aᵐ, m≥0, de Rham cohomology is nonzero in every degree. The bounded-below strict derived category and the derived-limit calculus in its left heart are the contract below.

What LocallyAnalyticDistributions must provide (gap:strict-countable-derived-limits): Provide, for countable towers of complexes with a common lower cohomological bound in the quasi-abelian category of nonarchimedean locally convex Q_p-spaces, the bounded-below strict derived category with its left t-structure, extending the bounded construction of §0.0; exactness of countable products; the Roos derived limit Rlim C_n=Cone(1−shift)[−1] in that category, that is, the homotopy fibre of 1−shift:∏C_n→∏C_n, (a_n)↦(a_n−τ_n(a_(n+1))) for the transition maps τ_n, which for a tower of spaces V_n placed in degree zero is the complex [∏V_n→∏V_n] in degrees 0 and 1; the truncation compatibility τ_≤i Rlim C_n≅τ_≤i Rlim τ_≤i C_n for every integer i; its compatibility with left-heart cohomology; the Milnor short exact sequences 0→R¹lim H̃^(i−1)(C_n)→H̃^i(Rlim C_n)→lim H̃^i(C_n)→0 and the six-term lim/R¹lim sequence of a short exact sequence of towers in the left heart; and vanishing of R^q lim for q≥2; all without Fréchet, Mittag–Leffler or finite-dimensionality hypotheses and objectwise for functors from sympathetic algebras to the left heart.

### From TauCetiRoadmap.CohomologyComparisons

§§4.8–4.9 supplies algebraic comparison and dual period descriptions, and §4.9a supplies analytic HK with its algebraic unramified coefficients and model agreement. §§4.10–4.11 supplies smooth proper rigid C_st comparison without a semistable-model assumption over K and C, including the induced filtration. The proper arithmetic dual Hom is strict for the weak topology, as in CN25 Remark 6.7, p.41, line 2047. Over C the comparison uses F⁰ of localized cohomology for its modification, as in CN25 Theorem 6.8 proof, p.42, line 2086. This is the input to the proper case of the fundamental square.

What CohomologyComparisons must provide (gap:dagger-analytic-complexes): Provide, for a smooth dagger space X over C, the model-free overconvergent Hyodo–Kato, B_dR⁺-de Rham and syntomic complexes with their cup products, as objects of the bounded-below strict derived category; the strict derived completed comparisons RΓ_HK(X)⊗̂C≃RΓ_dR(X) and RΓ_HK(X)⊗̂B_dR⁺≃RΓ_dR(X/B_dR⁺), natural in X and multiplicative; for 0≤i≤r, that multiplication by t, FʳRΓ_dR(X/B_dR⁺)→F^(r+1)RΓ_dR(X/B_dR⁺), induces an isomorphism τ_≤iFʳRΓ_dR(X/B_dR⁺)≃τ_≤iF^(r+1)RΓ_dR(X/B_dR⁺) (CN25 line 2231 prints the truncation on the left side only); the filtered fiber triangle defining syntomic cohomology from the Frobenius eigenspace of Hyodo–Kato cohomology and the de Rham filtration; and, for quasi-compact X, Frobenius slopes of Hⁱ_HK(X) in [0,min(i,dim X)] (CN25 Proposition 6.1, line 1954; Remark 6.23(ii), line 2231; Lemma 7.13 proof, line 2405).

What CohomologyComparisons must provide (gap:stable-range-period-map): Provide, for a smooth dagger space X over C and integers 0≤i≤r, the syntomic-to-pro-étale period map α_r, an isomorphism on cohomology in degrees ≤r, together with the natural VS and TVS realizations on sympathetic algebras of pro-étale cohomology, of the Hyodo–Kato eigenspace and of filtered B_dR⁺-cohomology, and the compatibility of the left-heart comparison sequence with these realizations (CN25 Proposition 6.1, line 1954; Definition 4.1, line 960; footnote 22, line 2647).

What CohomologyComparisons must provide (gap:stein-affinoid-syntomic-diagram): Provide, for a smooth dagger Stein space or smooth dagger affinoid X over C and r≥0, the degree-r syntomic diagram of CN25 Theorem 6.14: its two strictly exact rows, strict vertical maps with closed image, and the Fréchet, respectively LB, topology on degree-r syntomic cohomology, compatibly with α_r (CN25 Theorem 6.14, line 2098).

What CohomologyComparisons must provide (gap:analytic-exhaustion-descent): Provide, for a smooth dagger space X over C with a countable increasing admissible exhaustion by small quasi-compact open dagger subspaces X_n, the derived-limit descent RΓ(X)≃Rlim_n RΓ(X_n) for the Hyodo–Kato, filtered B_dR⁺-de Rham, syntomic and pro-étale complexes; the vanishing R¹lim_n X_n^(r,i)=0 and R¹lim_n Fbar_n^(r,i)=0; and, for a Stein exhaustion by affinoids, the identification of the derived inverse systems of the dagger pieces with those of their rigid completions after cofinal strict shrinkings (CN25 Remark 8.9(i), line 2601; Proposition 8.12 proof, line 2664).

What CohomologyComparisons must provide (gap:de-rham-quotient-splitting): Provide, for a smooth quasi-compact dagger space X over C, every finite covering of X by smooth dagger affinoids and every integer q, with RΓ^q the degree-q term of the associated Čech–de Rham complex computing RΓ_dR(X/B_dR⁺) in its natural topology, E_q=RΓ^q/im(d^(q−1)), H_q=ker(d^q)/im(d^(q−1))=H^q_dR(X/B_dR⁺) and Q_q=RΓ^q/ker(d^q) with their quotient and subspace topologies, a continuous B_dR⁺-linear retraction E_q→H_q of the inclusion, for the finite-free topology on H_q, whose kernel maps homeomorphically onto Q_q (CN25 Proposition 7.15 proof, lines 2439–2444).

What CohomologyComparisons must provide (gap:overconvergent-crystalline-complex): Provide, for a smooth quasi-compact dagger space X over C, a functorial overconvergent log-crystalline complex RΓ_cris(X) built from semistable weak formal hypercoverings, with its Frobenius, its completion map to the filtered complex RΓ_dR(X/B_dR⁺), and a Frobenius-compatible strict quasi-isomorphism RΓ_cris(X)≃RΓ_HK(X)⊗̂B_cris⁺, not Galois equivariant, with the Hyodo–Kato complex over the completion of Fⁿʳ and compatible with its Fⁿʳ version, distinct from ordinary completed log-crystalline cohomology of a nonproper model (CN25 §7.3, lines 2394–2402).

What CohomologyComparisons must provide (gap:algebraic-comparison-over-c): Provide, for a smooth finite-type scheme V over C and every i, weak admissibility of the filtered (φ,N)-module (Hⁱ_HK(V),F⁰Hⁱ_dR(V/B_dR)) over C given by the algebraic geometric period comparison (CN25 Theorem 8.1(b) proof, line 2491).

What CohomologyComparisons must provide (gap:analytic-hk-gaga): Provide, for a smooth finite-type scheme V over C and every i, Hyodo–Kato GAGA: the natural map Hⁱ_HK(V)→Hⁱ_HK(Vᵃⁿ) to the Hyodo–Kato cohomology of the dagger analytification is an isomorphism compatible with φ, N and the de Rham comparisons (CN25 Theorem 8.1(b) proof, line 2493).

What CohomologyComparisons must provide (gap:proper-log-period-sequence): Provide, for a smooth proper rigid space X′ over C with a strict normal crossings divisor D, U=X′∖D and 0≤i≤r, the exact sequence Hⁱ⁻¹_dR(X′,log D/B_dR⁺)→Hⁱ_ét(U,Q_p(r))→(Hⁱ_HK(U)⊗̂B_st⁺)^(N=0,φ=pʳ)⊕Hⁱ(FʳRΓ_dR(X′,log D/B_dR⁺))→Hⁱ_dR(X′,log D/B_dR⁺)→0 in LH(C_Q_p), the identification of the Hyodo–Kato and unfiltered B_dR⁺-de Rham cohomology of the log pair with those of U, and the map from the logarithmic filtration to the naive analytic filtration of U compatible with these identifications (CN25 Theorem 8.1(c) proof, lines 2507–2525).

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§§1.3–1.4 supplies the analytic étale/pro-étale coefficient dictionary. §8.4 supplies proper base change and the projection formula in its stated coefficient range; §9.7 supplies proper pairings and integral traces. The perfect integral p-adic coefficient object needed in Layer 4 is the cohomology of the proper factor, not of an arbitrary second factor.

What ClassicalAdicEtaleCohomology must provide (gap:proper-rigid-integral-etale): Provide perfect integral Z_p-cohomology for a smooth proper rigid space over C, proper base change for its projection to any smooth rigid factor and the compatible rational étale/pro-étale realization on the quasi-compact completions used in strict Stein exhaustions.

## How to read the build

Layer 0 constructs the C-lattice module and its bounded period-Hom calculations. Layer 1 forms the analytic square on the supplied cohomology and proves its proper, Stein and affinoid instances. Layer 2 identifies the two failure objects and proves qBC, height and equivalence theorems; its crystalline and syntomic splitting branch has its own functional-analysis input. Layer 3 proves the geometric slope classes using torsion modifications. Layer 4 passes exactness through countable exhaustions and establishes proper-times-Stein comparison without smallness. Layer 5 proves recovery from the arithmetic representation and from the geometric TVS functor, then treats the stronger positive crystalline refinement. The mathematical specification is this README; [Suggested.lean](Suggested.lean) records the headline statability boundary at the pinned APIs.

## Layer 0: filtered period modules and modified bundles

### 0.1 filtered modules with a de Rham lattice

A filtered (φ,N)-module over C is a pair (M,L): M is finite dimensional over Fⁿʳ, φ is a bijective σ-semilinear map, N is Fⁿʳ-linear with Nφ=pφN, and L is a finite free B_dR⁺-submodule of M⊗B_dR spanning that module after inverting t. Morphisms are φ,N-equivariant maps carrying L into L′. The topology and period embeddings are the imported ones; C is not embedded canonically in B_dR⁺. No Galois action is part of the data over C.

(CN25 §5.3.1, p. 36, CN25 line 1798.)

A proof route uses the following steps. Use the existing finite Frobenius–monodromy coefficients over Fⁿʳ; add only the lattice datum. Use localization to express spanning and the induced period-linear morphism.

The defining data and their natural maps have the following API.

- Construct (M,L) from the stated operator and full-lattice data.
- A morphism is determined by its Fⁿʳ-linear map on M.
- The lattice includes into M⊗B_dR and localizes isomorphically.
- Tensor uses diagonal operators and L⊗L′; dual uses the B_dR⁺-dual lattice.
- A filtered module with smooth descent over K gives L=Fil⁰(M_K⊗B_dR), with convolution filtration, after extension to Fⁿʳ.
- Extension to period modules preserves identity and composition.

**Checks.**

- The zero module with zero lattice has rank 0 and is an object; requiring a positive rank would exclude it.
- For M=Fⁿʳ, φ=σ, N=0, every tᵐB_dR⁺, m∈Z, is a full lattice; changing m changes the embedded lattice.
- The zero submodule of B_dR is not a lattice in the rank-one trivial module.

*Needs:* PadicHodgeTheory §3.4, finite Frobenius–monodromy modules; PadicHodgeTheory §§0.2–0.5, coefficient embeddings and period structures; Mathlib `Module.Free` and `Module.Finite`.

### 0.2 the bundle of a filtered module

Associate E(M,L) on the geometric Fargues–Fontaine curve by gluing the finite projective B_e-module (M⊗B_st)^(N=0,φ=1) away from ∞ to L at the completed local ring B_dR⁺, using their common B_dR-realization. Put V_st(M,L)=H⁰(E), equivalently the kernel of (M⊗B_st)^(N=0,φ=1)→(M⊗B_dR)/L. These are actual coherent bundles and section functors, not arbitrary modules labelled as bundles.

(CN25 §5.3.1, p. 36, CN25 line 1803.)

A proof route uses the following steps. Apply the imported modification/gluing theory for bundles with a B_dR⁺ lattice. Identify H⁰ with the equalizer of the two restriction maps.

The defining data and their natural maps have the following API.

- The punctured restriction has section module (M⊗B_st)^(N=0,φ=1).
- Completion at ∞ is L with its inclusion into M⊗B_dR.
- A morphism induces a bundle map; identity and composition agree.
- A section is exactly a period-invariant vector whose de Rham image belongs to L.
- The bundle of a tensor product is the tensor product of the bundles; use the existing scheme sheaf tensor and dual objects.

**Checks.**

- For the trivial module with L=B_dR⁺ the bundle is O and V_st=Q_p.
- For the same M and L=tᵐB_dR⁺ the bundle is O(−m); m=1 has negative slope.
- The zero pair gives the zero bundle and zero sections.

*Needs:* §0.1; VectorBundlesAndIsocrystals VB1, Untilts and completed local rings; the period-lattice-gluing contract.

### 0.3 weak admissibility and acyclicity over C

A pair (M,L) is weakly admissible when E(M,L) is semistable of slope zero; it is acyclic when every Harder–Narasimhan slope of E(M,L) is nonnegative. Both predicates hold for the zero object. The associated-bundle degree is t_H−t_N. It is opposite to the filtered degree t_N−t_H in PadicHodgeTheory §3.4; its destabilizing slopes use t_H−t_N and fix the dictionary for arithmetic comparison. Bundle slopes and BC curvature are distinct invariants. With this sign, every subobject D′ of a weakly admissible pair satisfies t_H(D′)≤t_N(D′), with equality for the whole module.

(CN25 Definition 5.13 and Remark 5.14(i), p. 36; §5.1.2, p. 32, CN25 line 1807.)

A proof route uses the following steps. Use the geometric bundle slope filtration, with zero treated by the empty slope list. Transport the K definition along the filtered-module bundle comparison.

The defining data and their natural maps have the following API.

- Acyclicity is equivalent to all bundle slopes being ≥0.
- Weak admissibility implies acyclicity.
- Both predicates are invariant under isomorphism.
- Tensor products of acyclic pairs are acyclic, by addition of bundle slopes.
- An acyclic arithmetic filtered module gives an acyclic pair over C; likewise for weak admissibility.

**Checks.**

- The zero pair has the empty slope list and is acyclic and weakly admissible; requiring a slope-zero nonzero summand fails.
- The trivial M with L=t⁻¹B_dR⁺ gives O(1): it is acyclic and is not weakly admissible.
- The trivial M with L=tB_dR⁺ gives O(−1) and is not acyclic.

*Needs:* §0.2; VectorBundlesAndIsocrystals VB1, Harder–Narasimhan filtration of geometric bundles; PadicHodgeTheory §5.2, the arithmetic sign dictionary.

### 0.4 cohomological criteria for acyclicity

For a pair (M,L), acyclicity is equivalent to H¹(E(M,L))=0, to surjectivity of (M⊗B_st)^(N=0,φ=1)→(M⊗B_dR)/L, and to the existence of a sublattice L′⊆L for which (M,L′) is weakly admissible. Weak admissibility is equivalent to E≅O^rank(M), and also to finite Q_p-dimension of V_st together with exactness of its fundamental sequence. In that case V_st⊗B_st≅M⊗B_st and V_st⊗B_dR⁺≅L.

The full fundamental sequence means 0→V_st→(M⊗B_st)^(N=0,φ=1)→(M⊗B_dR)/L→0, with the period embedding as its last map. For a weakly admissible pair the two evaluation maps have sources V_st⊗B_st and V_st⊗B_dR⁺ and targets M⊗B_st and L, respectively.

For an acyclic pair (M,L) and r≥0, if the Newton slopes are in [0,r] and M⊗B_dR⁺⊆L⊆M⊗t⁻ʳB_dR⁺, prove the bounded refinement: the weakly admissible sublattice can be chosen with M⊗B_dR⁺⊆L′⊆L and the same bounds. Acyclicity is indispensable here, as the slope-one Check below shows. The arithmetic counterpart, for an acyclic filtered (φ,N,G_K)-module with φ-slopes in [0,r], Fil⁰M_K=M_K and Filʳ⁺¹M_K=0, keeps both filtration bounds while shrinking only a positive nonzero filtration step; it is supplied by the bounded-arithmetic-subfiltration contract. This is the C-lattice refinement used in the proof of Proposition 5.23 (CN25 lines 1913–1919), alongside the arithmetic Lemma 5.4 (CN25 line 1670).

(CN25 Remark 5.14(ii)–(iii), p. 36; Lemma 5.3, pp. 32–33, CN25 line 1821.)

A proof route uses the following steps. Apply classification and H⁰/H¹ of slope bundles. Compute H¹ as the cokernel of the period-to-lattice-quotient map using the two-chart complex. Shrink a lattice to a slope-zero modification using the argument of Lemma 5.3; classification identifies its sections and period evaluations. For the bounded refinement shrink by colength-one steps that stay above M⊗B_dR⁺ and keep acyclicity, adapting Lemma 5.4.

**Checks.**

- For L=t⁻¹B_dR⁺ the smaller lattice B_dR⁺ is admissible; reversing that inclusion fails for L=tB_dR⁺.
- Negative control for the bounded refinement: r=1, M=Fⁿʳe with φ(e)=pe and N=0, and L=B_dR⁺e. The bounds M⊗B_dR⁺⊆L⊆M⊗t⁻¹B_dR⁺ hold and force L′=L, whose bundle has degree 0−1=−1, so E=O(−1) with H¹≠0. The pair is not acyclic and no weakly admissible L′ exists; without the acyclicity hypothesis the refinement is false.
- For the same M and L=t⁻¹B_dR⁺e the degree is 1−1=0, the pair is weakly admissible and L′=L. For the trivial M (φ(e)=e) with r=1 and L=t⁻¹B_dR⁺e the bundle is O(1), and L′=B_dR⁺e is the admissible choice inside the bounds.
- When L=M⊗B_dR⁺, untwisting by exp(uN) identifies E(M,L) with the bundle of the underlying isocrystal, whose slopes are the negatives of the Newton slopes. Such a pair is acyclic exactly when every Newton slope is ≤0; under the slope bound [0,r] of the bounded refinement this forces every Newton slope to be 0, and then L′=L. Negative control outside that bound: M=Fⁿʳe with φ(e)=p⁻¹e, N=0 and L=B_dR⁺e has Newton slope −1 and bundle O(1), which is acyclic since H¹(O(1))=0; with φ(e)=pe the bundle is O(−1) and the pair is not acyclic.

*Needs:* §0.3; VectorBundlesAndIsocrystals VB1, Slope-sensitive cohomology of standard bundles; VB2 classification, Geometric classification of vector bundles and Hom and extension calculus for geometric bundles; the bounded-arithmetic-subfiltration contract, for the arithmetic counterpart.

### 0.5 bounded eigenspaces and period kernels

For r∈N, M with φ-slopes in [0,r], and a lattice L satisfying M⊗tʳB_dR⁺⊆tʳL⊆M⊗B_dR⁺, define the VS-valued X_stʳ(M)=(M⊗B_st⁺)^(N=0,φ=pʳ) and V_stʳ(M,L)=ker(X_stʳ(M)→(M⊗B_dR⁺)/tʳL). The bounded positive ring is essential: the displayed quotient map is not defined on the unrestricted B_st eigenspace. In the acyclic case this is a short exact sequence and V_stʳ=tʳV_st inside M⊗B_dR. More generally for k≥0 the t⁻ᵏB_st⁺-version maps onto (M⊗t⁻ᵏB_dR⁺)/tʳL iff the pair is acyclic, with the same kernel. For any such M, X_stʳ(M) is a finite BC object of curvature ≤0 and height dim M: it is H⁰ of the nonnegative-slope bundle attached to M{−r} with lattice M⊗B_dR⁺. All maps are natural VS maps whose C-evaluations are the indicated period maps.

The period quotient is a finite-length B_dR⁺ module; after multiplying by tʳ its length is determined by the embedded lattice, not just its abstract free rank. The finite-BC height assertion follows from the identified bundle and the Euler-height theorem; the later period-Hom comparison additionally needs the rank-equals-height Hom theorem.

(CN25 Remark 5.16, pp.36–37; Proposition 5.18, p.37; Proposition 5.20, p.38, CN25 line 1833.)

A proof route uses the following steps. Form invariant subobjects of the imported period Vector Spaces and the indicated kernel. Use the VB1 gluing comparison to identify X_stʳ(M) with H⁰(E(M{−r},M⊗B_dR⁺)); its slopes are r minus the Newton slopes of M. Standard-bundle cohomology, the Le Bras equivalence and Euler height give finite BC, curvature ≤0 and height dim M. Use Remark 5.16 and the graded comparison of successive t-denominator levels to prove the criterion.

The defining data and their natural maps have the following API.

- v belongs to V_stʳ exactly when N(v)=0, φ(v)=pʳv and its image belongs to tʳL.
- A filtered morphism with the fixed bounds induces maps of both spaces, preserving identity and composition.
- The kernel includes in X_stʳ and hence in M⊗B_dR⁺.
- For an acyclic pair the quotient map is onto in VS and the sequence with V_stʳ is exact.
- The map tʳ identifies V_st with V_stʳ; it is the period realization of the Tate twist, not equality of Galois actions.

**Checks.**

- For r=0, M trivial and L=B_dR⁺, X_st⁰=V_st⁰=Q_p and the quotient is zero.
- For trivial M, L=B_dR⁺, r=1, the sequence is 0→Q_p·t→(B_cris⁺)^(φ=p)→C→0.
- For r=0 and L=t⁻¹B_dR⁺ the upper bound fails, although the pair is acyclic; do not apply the bounded theorem.
- Take φ(e₀)=e₀, φ(e₁)=pe₁, N(e₀)=0 and N(e₁)=e₀. With φ(u)=pu and N_B=−d/du, e₁+ue₀ belongs to X_st¹(M); e₁−ue₀ has diagonal monodromy 2e₀ and does not. This tests the imported monodromy sign.

*Needs:* §§0.1–0.4; PadicHodgeTheory §§0.4–0.5, positive periods; the period-lattice-gluing contract; VectorBundlesAndIsocrystals VB1, Slope-sensitive cohomology of standard bundles, and VB3, Le Bras equivalence and Euler–Poincaré height formula.

### 0.6 generation of the de Rham lattice

If M has φ-slopes in [0,r], X_stʳ(M)(C) spans M⊗B_dR⁺ over B_dR⁺. This is generation by the bounded simultaneous N=0,φ=pʳ eigenspace, without a filtration or Galois hypothesis.

(CN25 Lemma 5.17, p. 37, CN25 line 1852.)

A proof route uses the following steps. Reduce modulo t by Nakayama. Use the imported coordinate with N_B=−d/du. The horizontal lift is exp(uN_M)m, since (N_M−∂/∂u)exp(uN_M)m=0; its inverse exp(−uN_M) removes monodromy and reduces to B_cris⁺. This translates the source coordinate convention. Apply Dieudonné–Manin blocks of slope a/h and `U_(h,rh-a)`; independence of the conjugate Q_(pʰ)-characters shows their reductions span Cʰ.

**Checks.**

- A slope-zero trivial rank-one block at r=0 already generates the whole lattice.
- Negative control for the slope bound: for M=Fⁿʳe with φ(e)=pe (slope 1) and r=0, X_st⁰(M)=(B_cris⁺)^(φ=p⁻¹)e=0, which spans nothing; the hypothesis that the slopes lie in [0,r] cannot be dropped.

*Needs:* §0.5; CrystallineCohomology §CR.4.7, Slope decomposition on the existing isocrystal carrier, applied to M⊗F̂ⁿʳ; VectorBundlesAndIsocrystals VB3, The fundamental untilt sequence and degree-one divisors; PadicHodgeTheory §0.5, polynomial semistable coordinate.

### 0.7 period-valued Hom from an eigenspace

For M with φ-slopes in [0,r], evaluation induces B_dR- and B_st-linear isomorphisms M∨⊗B_dR≅Hom_VS(X_stʳ(M), B_dR) and M∨⊗B_st≅Hom_VS(X_stʳ(M), B_st). Hom here means natural Q_p-linear Vector Space morphisms, not merely linear maps of C-points and not maps assumed period-linear.

(CN25 Proposition 5.18 and Remark 5.19, pp.37–38; Proposition 3.27(i), p.20, CN25 line 1870.)

A proof route uses the following steps. Use generation for injectivity. Use the finite-BC realization and height dim M of X_stʳ(M), then the period-Hom theorem of Proposition 3.27(i), pp.19–20: for curvature ≤0 the B_dR-valued natural Hom module is finite free of rank equal to height. This gives the required rank equality and surjectivity over B_dR; Euler height alone is not a Hom theorem. Choose an admissible lattice and use its finite-dimensional period realization to force B_st-valued functionals to have B_st coefficients.

**Checks.**

- For the trivial line M=Fⁿʳe (φ(e)=e, N=0) and r=0, X_st⁰(M)=Q_p·e and both Hom modules are free of rank one, generated by the map sending e to 1, which is the evaluation of e∨⊗1; the zero map is not an isomorphism onto either module.
- For M=0 both sides are zero.
- For the trivial line and r=1, X_st¹(M)=(B_cris⁺)^(φ=p), the extension of C by Q_p·t given by θ. Natural VS Hom and Ext¹ from C into B_dR vanish, so Hom_VS(X_st¹(M),B_dR)≅Hom_VS(Q_p·t,B_dR)=B_dR, of rank one as the theorem asserts; Q_p-linear maps of C-points form a far larger module, since C has uncountable Q_p-dimension.

*Needs:* §§0.4–0.6; the natural-period-hom contract, Proposition 3.27(i) rank equality.

### 0.8 period-valued Hom from an acyclic kernel

For an acyclic pair (M,L) with the bounds of §0.5, evaluation gives M∨⊗B_dR≅Hom_VS(V_stʳ(M,L), B_dR) and M∨⊗B_st≅Hom_VS(V_stʳ(M,L), B_st). These are module isomorphisms for the indicated period rings.

(CN25 Proposition 5.20 and Remark 5.21, p. 38, CN25 line 1896.)

A proof route uses the following steps. Apply Hom into B_dR to 0→V_stʳ→X_stʳ→(M⊗B_dR⁺)/tʳL→0. Use vanishing of Hom and Ext¹ from the finite-length B_dR⁺ quotient into B_dR, then the preceding computation. For B_st choose a weakly admissible sublattice L′⊆L and evaluate on its finite Q_p period space.

**Checks.**

- Trivial line, r=1, L=B_dR⁺e: the pair is acyclic (bundle O), V_st¹=ker((B_cris⁺)^(φ=p)→C)=Q_p·t, and Hom_VS(Q_p·t,B_dR)=B_dR has rank one, as M∨⊗B_dR does. With L=t⁻¹B_dR⁺e the bounds still hold, the period quotient is zero, V_st¹=(B_cris⁺)^(φ=p) and the rank is again one.
- Negative control for acyclicity: M=Fⁿʳe with φ(e)=pe, r=1 and L=B_dR⁺e satisfy the bounds but give O(−1). Here φ(xe)=pxe forces φ(x)=x, so X_st¹(M)=Q_p·e, which injects into (M⊗B_dR⁺)/tL=C·e; hence V_st¹=0 and both Hom modules vanish instead of having rank one.

*Needs:* §§0.4–0.5 and 0.7; VectorBundlesAndIsocrystals VB3, Curvature-zero finite-length modules and VS Hom vanishing from torsion period modules, for Hom from the finite-length quotient into B_dR; the natural-period-hom contract, for natural Ext¹ from that quotient into B_dR.

### 0.9 period reconstruction modulo a power of t

Under the same acyclicity and boundedness assumptions, for k≥2r the evaluation map M∨⊗(B_dR⁺/tᵏ)→Hom_VS(V_stʳ(M,L),B_dR⁺/tᵏ) has kernel killed by tʳ and cokernel killed by t²ʳ. In particular both are killed by t²ʳ. No isomorphism for finite k is asserted.

(CN25 Proposition 5.23, pp. 38–39, CN25 line 1913.)

A proof route uses the following steps. Choose an admissible L′ between M⊗B_dR⁺ and L with the same bounds. Compare the kernels for L′ and L; their quotient is killed by tʳ. Compare their Hom groups with the two lattice quotients. The outside composite is multiplication by tʳ; the second torsion error gives t²ʳ on the cokernel.

**Checks.**

- For r=0 the asserted annihilators are 1, so the map is an isomorphism.
- Trivial line, L=B_dR⁺e, r=1, k=2: V_st¹=Q_p·t, Hom_VS(Q_p·t,B_dR⁺/t²)=B_dR⁺/t² by evaluation at t, and the evaluation map is multiplication by t on B_dR⁺/t². Its kernel tB_dR⁺/t² is killed by t=tʳ and its cokernel B_dR⁺/t=C is killed by t, within the bound t²ʳ; the map is not an isomorphism, so no finite-k isomorphism is asserted.

*Needs:* §§0.4–0.5 and 0.8; the bounded sublattice refinement in §0.4; VectorBundlesAndIsocrystals VB3, Curvature-zero finite-length modules, identifying natural VS maps between finite-length B_dR⁺-modules with B_dR⁺-linear maps, and VS Hom vanishing from torsion period modules.

### Examples

For M=Fⁿʳ with φ=σ and N=0, the lattices tᵐB_dR⁺ for m=−1,0,1 give O(1), O and O(−1). Thus the first two are acyclic, only the middle is weakly admissible, and the last has nonzero H¹ of height −1. For the rank-two monodromy module of the conventions, the horizontal generator is e₁+ue₀. At p=2 its wrong-sign counterpart still has monodromy 2e₀≠0 (CN25 §5.3, p.36, lines 1803–1832; Lemma 5.17, line 1852).

### Dependencies

Mathlib module and period carriers; PadicHodgeTheory §§0.2–0.5, 3.4–3.7 and 5.2; VectorBundlesAndIsocrystals VB1–VB3; CrystallineCohomology §CR.4.7; period-lattice-gluing, natural-period-hom and bounded-arithmetic-subfiltration contracts.

## Layer 1: the analytic fundamental diagram

### 1.1 filtered cohomology and its image filtration

For a smooth dagger X/C use the analytic complexes of the dagger-analytic-complexes contract and the period map of the stable-range-period-map contract to set Bⁱ=Hⁱ_dR(X/B_dR⁺), Fʳⁱ=Hⁱ(FʳRΓ_dR(X/B_dR⁺)), DRʳⁱ=Hⁱ(RΓ_dR/Fʳ), Filʳⁱ=im(Fʳⁱ→Bⁱ) and Aʳⁱ=ker(Fʳⁱ→Bⁱ). Set Hʳⁱ=Hⁱ_proét(X,Q_p(r)) for i≤r and Xʳⁱ=(Hⁱ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ); joint invariants at complex level are derived. Tildes denote left-heart cohomology, ordinary letters its classical part, and bold letters the natural TVS/VS realization when supplied. Filter Bⁱ[1/t] by images of filtered complexes. Fʳⁱ is not identified with Filʳⁱ.

(CN25 §7.1.1 and §§7.2.1–7.2.2, pp. 46–47; Proposition 6.1, pp. 39–40 (import contract), CN25 line 2294.)

A proof route uses the following steps. Take the cohomology and image/kernel maps of the filtered distinguished triangle. Use the period morphism only in the truncation range i≤r; retain syntomic cohomology outside it.

The defining data and their natural maps have the following API.

- There are natural Fʳⁱ→Bⁱ and Bⁱ→DRʳⁱ with their connecting map DRʳ,ⁱ⁻¹→Fʳⁱ.
- Fʳⁱ/Aʳⁱ identifies with Filʳⁱ with the induced categorical image topology.
- The maps Fʳ⁺¹→Fʳ induce Filʳ⁺¹ⁱ⊆Filʳⁱ and define the induced filtration on Bⁱ[1/t].
- Pullback preserves all cohomology maps, identity, composition and period comparison.
- Over K, Bⁱ≅Hⁱ_dR(X/K)⊗̂_K B_dR⁺; over C no canonical C-linear scalar-extension presentation is assumed.

**Checks.**

- For a geometric point, B⁰=B_dR⁺, Fʳ⁰=tʳB_dR⁺ and Aʳ⁰=0.
- For a positive-dimensional smooth dagger affinoid at degree r=1, A¹¹≅O(X)/ker d; for a disc this is O(X)/C and is nonzero.
- For i<0 all the listed cohomology groups vanish; in particular the degree-zero failure sequence has no H⁻¹ term.

*Needs:* AdicSpacesPartIV F1.7 and F1.9, dagger spaces and de Rham complexes; LocallyAnalyticDistributions §0.0, strict derived left heart; CohomologyComparisons §4.9a; the dagger-analytic-complexes contract, for the complexes and their filtered triangle; the stable-range-period-map contract, for Hʳⁱ with i≤r; the bounded-below strict derived category of the strict-countable-derived-limits contract, for complexes of unbounded amplitude.

### 1.2 small dagger varieties

A smooth dagger variety X/C is small when Bⁱ=Hⁱ_dR(X/B_dR⁺) is finite free over B_dR⁺ for every i≥0, as in the operational convention of §7.2. The analytic Hyodo–Kato isomorphism then identifies its rank with dim_Fⁿʳ Hⁱ_HK(X) and with dim_C Hⁱ_dR(X). Quasi-compact smooth dagger spaces, naive interiors of smooth dagger affinoids, and algebraic analytifications are the source examples; a naive interior of a smooth dagger affinoid Y is a Stein open subvariety of Y whose complement in Y is open and quasi-compact (CN1 Corollary 3.6 proof, p.26, CN1 line 1163; CN25 footnote 20, line 2302). For the closed dagger disc, the open unit disc is a naive interior, with complement the affinoid annulus {|T|=1}; the closed disc itself is not, since Stein spaces are partially proper and an affinoid of positive dimension is not. These examples require the corresponding finiteness and base-change inputs, not a definition by quasi-compactness.

(CN25 §7.2, p. 46; §1.2.3 and Remark 1.10, pp. 5–6, CN25 line 2289.)

A proof route uses the following steps. Define smallness by the actual B_dR⁺ modules. Use the imported strict Hyodo–Kato comparison to compute rank; cite finiteness for each geometric example.

The defining data and their natural maps have the following API.

- Each Bⁱ is free and finitely generated.
- rank_B_dR⁺ Bⁱ=dim_Fⁿʳ Hⁱ_HK(X)=dim_C Hⁱ_dR(X).
- Smallness is invariant under dagger isomorphism and under cohomology equivalences preserving the full period package.
- A smooth quasi-compact dagger variety over C is small: its de Rham cohomology over C is finite dimensional, and the Hyodo–Kato comparisons RΓ_HK⊗̂C≃RΓ_dR and RΓ_HK⊗̂B_dR⁺≃RΓ_dR(X/B_dR⁺) then give finite Hyodo–Kato cohomology and finite free B_dR⁺-cohomology of the same rank.
- The analytification of a finite-type smooth C-variety is small, by the same two steps.

**Checks.**

- A point is small, with rank one in degree zero and zero in other degrees; a definition requiring positive rank in every degree fails.
- The dagger closed disc is small although its H¹_proét is infinite dimensional over Q_p.
- A countable disjoint union of geometric points is not small: B⁰ is the product of countably many B_dR⁺ modules and is not finite free.

*Needs:* §1.1; Mathlib `Module.Free` and `Module.Finite`; the dagger-de-rham-finiteness-over-c contract, finite de Rham cohomology of the three example classes; the Hyodo–Kato and B_dR⁺ comparisons of the dagger-analytic-complexes contract.

### 1.3 the fundamental diagram

For every smooth dagger X/C and 0≤i≤r form the natural commutative square with upper row H̃ʳⁱ→X̃ʳⁱ and lower row F̃ʳⁱ→B̃ⁱ, using the syntomic period map and the map of triangles with common term RΓ_dR/Fʳ. The associated two maps are u=(a,b):H̃ʳⁱ→X̃ʳⁱ⊕F̃ʳⁱ and v=(c,−d):X̃ʳⁱ⊕F̃ʳⁱ→B̃ⁱ. Thus vu=0. X̃ and B̃ are classical. The general assertion that this square is bicartesian is Conjecture 6.21, not an unconditional theorem.

(CN25 §6.4 and Conjecture 6.21, pp. 43–44; square (6.16) and sequence (6.17), p.43, CN25 lines 2117–2128 and 2185, whose plus sign is replaced here by the difference map, so that v∘u=0.)

A proof route uses the following steps. Form the syntomic and filtered de Rham triangles and their compatible maps. Take left-heart cohomology and the truncation isomorphism α_r. Use the existing BicartesianSq predicate; in the abelian left heart it is equivalent to the sequence 0→H̃→X̃⊕F̃→B̃→0 being exact, with the stated minus sign.

The defining data and their natural maps have the following API.

- c∘a=d∘b in the left heart.
- The difference map v satisfies v∘u=0.
- Every dagger morphism induces a morphism of the four corners and both exactness maps.
- Mathlib BicartesianSq for the square is equivalent to exactness of 0→H̃→X̃⊕F̃→B̃→0 in the abelian left heart.
- X̃ʳⁱ and B̃ⁱ are the embeddings of Xʳⁱ and Bⁱ; no such automatic identification is made for H̃ and F̃.

**Checks.**

- For a point at i=r=0 the square is Q_p→Q_p over B_dR⁺→B_dR⁺, with bottom identity and both vertical maps the inclusions.
- For that square v(1,1)=0; using c+d instead gives 2≠0.
- Exactness of a sequence of underlying vector spaces alone does not certify BicartesianSq in LH(C_Q_p); a dense nonclosed inclusion must retain its left-heart cokernel.

*Needs:* §1.1; Mathlib `CategoryTheory.BicartesianSq`; the stable-range period morphism of the stable-range-period-map contract and the filtered triangle of the dagger-analytic-complexes contract; LocallyAnalyticDistributions §0.0, strict left-heart cohomology.

### 1.4 twist invariance and the surjectivity reduction

For fixed i≥0 the fundamental square is bicartesian for one r≥i iff it is so for every r≥i. Multiplication by t identifies H̃ʳⁱ with H̃ʳ⁺¹ⁱ and F̃ʳ⁺¹ⁱ=tF̃ʳⁱ; the quotient Xʳ⁺¹ⁱ/tXʳⁱ identifies with Hⁱ_HK(X)⊗̂C and the corresponding Bⁱ/tBⁱ with Hⁱ_dR(X), by Hyodo–Kato. For a fixed r, surjectivity of Xʳⁱ⊕Fʳⁱ→Bⁱ in all degrees 0≤i≤r yields the short exact left-heart sequences in that range by induction from degree −1=0.

(CN25 Remark 6.23(ii)–(iii), pp. 44–45, CN25 line 2200.)

A proof route uses the following steps. Apply the exact rows and columns for t multiplication; the bottom comparison is an isomorphism. Apply the long exact cohomology sequence of the syntomic fiber; preceding-degree surjectivity kills the left kernel.

**Checks.**

- Point at i=0, from r=0 to r=1: multiplication by t sends H̃⁰⁰=Q_p onto H̃¹⁰=Q_p·t and F⁰⁰=B_dR⁺ onto F¹⁰=tB_dR⁺, and X¹⁰/tX⁰⁰=(B_cris⁺)^(φ=p)/Q_p·t≅C=B⁰/tB⁰ through θ, as the Hyodo–Kato identification requires in degree zero.
- Point at i=r=0: X⁰⁰⊕F⁰⁰=Q_p⊕B_dR⁺→B_dR⁺, (x,f)↦x−f, is onto with kernel the diagonal Q_p=H⁰⁰; the degree −1 groups are zero, so this surjectivity alone gives the short exact sequence in degree zero, whereas in degree one the induction also uses the degree-zero surjectivity.

*Needs:* §1.3; §0.5, successive t-level comparisons; the filtered-complex t-shift and HK comparison of the dagger-analytic-complexes contract.

### 1.5 the simplified Stein and affinoid diagram

For a smooth dagger Stein space or dagger affinoid X/C and r≥0 there is a natural map between strictly exact rows 0→Ωʳ⁻¹(X)/ker d→Hʳ_proét(X,Q_p(r))→Xʳʳ→0 and 0→Ωʳ⁻¹(X)/ker d —d→ Ωʳ(X)^(d=0)→Hʳ_dR(X)→0. The left vertical map is identity, the right is ι_HK⊗θ, and the middle β̃=p⁻ʳβα_r⁻¹. All vertical maps are strict with closed image. Hʳ_proét is Fréchet in the Stein case and LB in the affinoid case; ker β̃≅(Hʳ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ⁻¹). Set Ω⁻¹=0.

Here r−1 in Ωʳ⁻¹ denotes the integer degree, with Ω⁻¹=0, and pʳ⁻¹ is an integer power in a characteristic-zero field. In particular at r=0 the kernel formula refers to φ=p⁻¹, not to natural subtraction followed by φ=1. The coefficient p⁻ʳ is defined because p is nonzero in Q_p.

(CN25 Theorem 6.14, p. 43, CN25 line 2098.)

A proof route uses the following steps. Import the syntomic Stein diagram and α_r in degree r. Normalize the middle map by p⁻ʳ to preserve symbols. Transport the topology, strictness and kernel assertions through α_r.

**Checks.**

- For a dagger disc D and r=1, the top row has kernel O(D)/C, and its nonzero class of T maps under the middle vertical arrow to dT. At a point and r=0 both left terms are Ω⁻¹=0, and the right arrow is the inclusion Q_p→C sending 1 to 1. These values distinguish the pro-étale row from the zero degree-one algebraic étale group of the affine line.

*Needs:* §1.3; AdicSpacesPartIV F1.9 and the dagger-strictness-over-c contract, strict differentials over C; the Stein and affinoid syntomic diagram, its strict maps and natural topologies of the stein-affinoid-syntomic-diagram contract.

### 1.6 bicartesian diagrams for proper, Stein and affinoid spaces

The fundamental square is bicartesian for smooth proper X/C and for smooth dagger Stein or affinoid X/C, in all 0≤i≤r by twist invariance. At degree i=r the proper horizontal arrows are injective and Fʳʳ→Filʳʳ is an isomorphism. At degree r in the Stein/affinoid case both horizontal arrows are surjective with common kernel Ωʳ⁻¹/ker d. The latter assertion uses pro-étale cohomology, not étale cohomology of a rigid affinoid completion.

(CN25 Corollaries 6.15 and 6.19, Remark 6.18, pp. 43–44, CN25 line 2117.)

A proof route uses the following steps. For the proper case use the short exact period sequence and the filtered quotient identification. For Stein/affinoid spaces compare the two triangles, use Hʲ(RΓ_dR/Fʳ)=0 for j≥r, and identify the two kernels by reduction to C. Apply twist invariance for other i≤r.

**Checks.**

- For a proper point at i=r=0 both horizontal maps are identities, Q_p→Q_p and B_dR⁺→B_dR⁺, and have kernel 0. For a dagger disc D at i=r=1 both horizontal maps are O(D)/C→0 and have kernel O(D)/C; the class of T is nonzero in that kernel.

*Needs:* §§1.4–1.5; CohomologyComparisons §§4.10–4.11, proper comparisons with induced filtration.

### Examples

For a geometric point at i=r=0 the square has upper identity Q_p→Q_p and lower identity B_dR⁺→B_dR⁺; its total complex is exact. For the dagger disc D at i=r=1, HK¹(D)=B¹=0 while F¹¹=O(D)/C and pro-étale H¹(D,Q_p(1))=O(D)/C. The horizontal kernel is nonzero, even though the diagram is bicartesian. At degree r=0, Ω⁻¹=0 and the point kernel at φ=p⁻¹ is zero (CN25 Theorem 6.14, lines 2098–2109; Corollaries 6.15 and 6.19, lines 2117, 2135).

### Dependencies

Layer 0; AdicSpacesPartIV F1.7–F1.12; CohomologyComparisons §§4.9a–4.11; LocallyAnalyticDistributions §0.0; dagger-analytic-complexes, stable-range-period-map, stein-affinoid-syntomic-diagram, strict-countable-derived-limits, dagger-de-rham-finiteness-over-c and dagger-strictness-over-c contracts.

## Layer 2: the qBC filtration and comparison criteria

### 2.1 bundle cohomology measuring the diagram

For small X, i≥0, r≥0 and n=0,1 put hⁿ_i(r)=Hⁿ(X_FF,E(Hⁱ_HK(X){−r},FilʳHⁱ_dR(X/B_dR))), as a finite BC object. Here {−r} multiplies φ by p⁻ʳ and leaves N fixed, and the lattice is the induced Filʳ lattice in Bⁱ[1/t]. Use hⁿ₋₁(r)=0. In the range 0≤i≤r, and also in every nonnegative degree for quasi-compact X when r≥dim X, the tʳ-period isomorphism identifies this modified bundle with the untwisted pair (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)); the simultaneous change of φ and lattice is essential. The lattice is the image filtration Filʳ; the torsion kernel Aʳⁱ is not part of it.

(CN25 §7.2.2 and Lemma 7.7, p. 47; proof of Proposition 7.10, p. 48, CN25 line 2333.)

A proof route uses the following steps. Apply the filtered-module bundle construction to the finite cohomology module and its image lattice. Use the finite BC realization of H⁰ and H¹ of a coherent bundle. Use t multiplication and the filtration shift in the range i≤r to identify the twisted and untwisted pairs.

The defining data and their natural maps have the following API.

- The zeroth object is H⁰ of the indicated modified bundle.
- The first object is H¹ of that bundle.
- Compatible pullbacks on filtered HK modules induce maps of hⁿ, preserving identity and composition.
- hⁿ₋₁(r)=0.
- Simultaneously twisting φ and the lattice by tʳ identifies the bundle and its cohomology with the untwisted F⁰ pair.

**Checks.**

- For a point at i=r=0 the bundle is O, so h⁰=Q_p and h¹=0.
- For a point at i=0,r=1, φ=p⁻¹ and lattice tB_dR⁺ cancel to give O again; twisting only the lattice would give O(−1).
- A zero HK group with zero lattice gives h⁰=h¹=0; adjoining a constant Q_p summand to the construction would fail.

*Needs:* §§0.2 and 1.1–1.2; §1.4, simultaneous twists; VectorBundlesAndIsocrystals VB3, finite BC realization of coherent cohomology.

### 2.2 kernel and cokernel descriptions

For small X and i≤r, h⁰_i(r)≅ker(Xʳⁱ⊕Filʳⁱ→Bⁱ)≅ker(Xʳⁱ→Bⁱ/Filʳⁱ), and h¹_i(r) is the corresponding cokernel. Moreover ker(Hʳⁱ→Xʳⁱ⊕Fʳⁱ)≅h¹ᵢ₋₁(r). These identifications lift to the natural TVS objects, with the difference-map convention of Layer 1.

(CN25 Lemma 7.7 and equation (7.6), pp. 46–47, CN25 line 2335.)

A proof route uses the following steps. The two-chart cohomology complex gives the first two identities. Compare the syntomic and filtered de Rham long exact sequences with their common DR term. Apply the snake lemma; multiplying Fʳⁱ by tʳ kills its torsion and identifies its image in Bⁱ, justifying the reduced bottom row.

**Checks.**

- At i=0 the preceding-degree kernel is zero.
- Point, i=0, r=1: X¹⁰⊕Fil¹⁰=(B_cris⁺)^(φ=p)⊕tB_dR⁺→B_dR⁺, (x,f)↦x−f, has kernel the diagonal copy of (B_cris⁺)^(φ=p)∩tB_dR⁺=Q_p·t, which is h⁰₀(1)=H⁰(O) realized through t, and it is onto because θ maps (B_cris⁺)^(φ=p) onto C, matching h¹₀(1)=H¹(O)=0.
- Dagger disc D, i=r=1: HK¹=0 and B¹=0, so h⁰₁(1)=h¹₁(1)=0, and ker(H¹¹→X¹¹⊕F¹¹)=ker(O(D)/C→0⊕O(D)/C)=0=h¹₀(1).

*Needs:* §§2.1 and 1.3; §0.5, two-chart period quotient; natural TVS lift from the stable-range-period-map contract.

### 2.3 the canonical qBC filtration on pro-étale cohomology

For small X and 0≤i≤r the natural TVS Hʳⁱ is a qBC. Its functorial filtration, constructed from the fundamental diagram, has successive curvature pieces `H^(r,i)_(>0)`≅h¹ᵢ₋₁(r), `H^(r,i)_(=0)`≅Aʳⁱ=(Fʳⁱ)_(B_dR⁺-tors), and `H^(r,i)_(<0)`≅h⁰_i(r). The middle piece is the torsion B_dR⁺-Pair supplied by the filtered-cohomology presentation and need not be finite BC; its embedding and functorial filtration are part of the target. When X is quasi-compact the middle Pair is reasonable: for r≥dim X it is the Pair of CN25 Proposition 7.15 (line 2426), and multiplication by t identifies Aʳⁱ with Aʳ⁺¹ⁱ for every r≥i, since F̃ʳ⁺¹ⁱ=tF̃ʳⁱ by §1.4 and Bⁱ is t-torsion free. The filtration is then the unique qBC filtration of the Conventions. For other small X it need not be reasonable, and only the constructed functorial filtration is asserted. These are associated graded objects, not a canonical direct-sum decomposition. Zero pieces are allowed in every curvature class.

The canonical subobjects are the positive-curvature subobject and the subobject with positive and zero-curvature graded pieces. Their displayed quotients, rather than a choice of complementary subspaces, determine the filtration. The natural maps are maps of TVS functors.

(CN25 Corollary 7.9(i), p. 47, with its proof, CN25 line 2350.)

A proof route uses the following steps. Use the diagram of §2.2 to filter H by successive kernels. Identify the middle quotient with ker(F→B). Apply the imported qBC three-piece recognition; finite bundle H¹ and H⁰ provide the positive and negative curvature pieces. In the quasi-compact case apply the uniqueness theorem for qBC with reasonable middle Pair.

The defining data and their natural maps have the following API.

- The first subobject is h¹ᵢ₋₁(r), with its canonical injection into Hʳⁱ.
- The middle graded piece equals Aʳⁱ and its B_dR⁺-torsion description.
- The final quotient is h⁰_i(r).
- Dagger pullback preserves the filtration and induces the expected bundle maps on its finite graded pieces.
- When H is already finite BC, its filtration agrees with the existing finite BC curvature filtration; the qBC height restricts to the BC height.

**Checks.**

- For proper X the only potentially nonzero piece is the negative-curvature piece Hⁱ_proét(X,Q_p(r)), finite dimensional over Q_p; the positive and torsion pieces vanish.
- For X=P¹_C at (i,r)=(0,1) the triple is (0,0,Q_p(1)), with h⁰₀(1)=Q_p·t=H⁰_proét(P¹,Q_p(1)) of height 1; at i=r=1 it is (0,0,0), since H¹_HK(P¹)=0 and H¹_proét(P¹,Q_p(1))=0. Reading the final piece in degree r instead of i would give 0 in the first case.
- For the dagger disc at i=r=1, HK¹=0, so both finite pieces vanish while A¹¹=O(X)/C and H¹_proét≅A¹¹.
- For a point in degree zero the negative piece is Q_p of height one, not curvature zero merely because it has C-dimension zero.
- Negative control for reasonableness: X=D†⨿D, the disjoint union of the closed dagger disc and the open unit disc, is small, with B⁰=(B_dR⁺)² and Bⁱ=0 for i≥1. At i=r=1 the middle piece is A¹¹=O(D†)/C⊕O(D)/C. The first summand is of compact type and not Fréchet, the second is Fréchet and not normable, hence not a countable inductive limit of Banach spaces, so the Pair is neither Fréchet nor c-compact LB and is not reasonable; each summand alone is reasonable.

*Needs:* §2.2; §1.1; §1.4, the t-shift of filtered cohomology; the qbc-pairs contract, recognition, and uniqueness of the curvature filtration when the middle Pair is reasonable.

### 2.4 the exact sequence with two failure terms

For small X and 0≤i≤r there is a natural exact sequence of TVS objects 0→h¹ᵢ₋₁(r)→Hʳⁱ→Fʳⁱ⊕Xʳⁱ→Bⁱ→h¹_i(r)→0, where H→F⊕X is (b,a) and F⊕X→B sends (f,x) to c(x)−d(f). Consequently the fundamental diagram in degree i is bicartesian exactly when both h¹ᵢ₋₁(r) and h¹_i(r) vanish. Surjectivity of F⊕X→B alone controls only h¹_i(r); the preceding term h¹ᵢ₋₁(r) is the kernel of H→F⊕X.

(CN25 Corollary 7.9(ii), p. 47; Proposition 7.10(a)–(b), p. 48, CN25 line 2354.)

A proof route uses the following steps. Combine the kernel description with the canonical qBC filtration. The image of F→B is Fil, so adjoining F does not change the right cokernel. Compare the classical sequence with the left-heart sequence using the classical X,B corners and the strict analytic comparison.

**Checks.**

- Point, i=0, r=1: the sequence is 0→0→Q_p·t→tB_dR⁺⊕(B_cris⁺)^(φ=p)→B_dR⁺→0→0, exact, with kernel of (f,x)↦x−f the diagonal copy of Q_p·t.
- Dagger disc D, i=r=1: the sequence is 0→0→O(D)/C→O(D)/C⊕0→0→0→0, exact; the horizontal kernel ker(H→X) is all of O(D)/C although both failure terms vanish.

*Needs:* §§2.2–2.3; §1.3; the TVS and left-heart compatibility of the stable-range-period-map contract.

### 2.5 the height formula and its sign

For small X and r≥0, ht(Hʳʳ)=dim_Fⁿʳ Hʳ_HK(X)+ht(h¹ᵣ₋₁(r))+ht(h¹_r(r)). Each h¹ term has height ≤0, and height zero occurs only if that term is zero, because it is H¹ of a vector bundle. Therefore ht(Hʳʳ)≤dim_C Hʳ_dR(X), with equality exactly when both failure terms vanish. This strictness is not asserted for every positive-curvature BC: torsion away from ∞ is a counterexample to that broader assertion.

For O, the Euler-height equation reads 1−0=1. For O(−1), it reads 0−(−1)=1. The latter value proves the strict negative sign for a nonzero H¹ slope block; a torsion sheaf away from ∞ instead has Euler height 0 and is excluded from that strict claim.

(CN25 Proposition 7.10 proof, p. 48; Equation (3.10) and Remark 3.11, p.15; Remark 3.13(iv), p.16, CN25 line 2367.)

A proof route uses the following steps. The Pair piece has height zero and qBC height is additive. Apply the imported Euler-height identity ht(H⁰E)−ht(H¹E)=rk E. Decompose the bundle into slope blocks; each nonzero H¹ block has strictly negative height. Use the Hyodo–Kato rank comparison.

**Checks.**

- Point, r=0: ht(H⁰⁰)=ht(Q_p)=1=dim HK⁰+0+0. Dagger disc, r=1: ht(H¹¹)=ht(O(D)/C)=0=dim HK¹+0+0, although O(D)/C has infinite Q_p-dimension; Q_p-dimension in place of height would put ∞ on the left.

*Needs:* §2.3; §1.2, HK rank comparison; VectorBundlesAndIsocrystals VB3, Euler–Poincaré height formula, and VB1, Slope-sensitive cohomology of standard bundles; signed height additivity of the qbc-pairs contract.

### 2.6 the degreewise equivalence of comparison criteria

For a small smooth dagger X/C and r≥0 the following are equivalent: the fundamental square at degree i=r is bicartesian; h¹ᵣ₋₁(r)=h¹_r(r)=0; the two pairs (Hʲ_HK(X),F⁰Hʲ_dR(X/B_dR)) for j=r−1,r are acyclic; the TVS Hʳʳ and H_synʳ⁺¹(X,r) both have curvature ≤0; ht(Hʳʳ)=dim_C Hʳ_dR(X). The degree r+1 term here is syntomic, not Hʳ⁺¹_proét(X,Q_p(r)); it lies outside the comparison range. Negative-degree pairs vanish.

At r=0, use the zero filtered module in degree −1. The adjacent syntomic positive-curvature piece is constructed from the same fiber triangle; it is not identified with the full pro-étale group beyond the truncation range.

(CN25 Proposition 7.10 with footnote 21, p. 48, CN25 line 2367.)

A proof route uses the following steps. Use the failure exact sequence and acyclicity criteria. Twist the bundle pairs to remove r. Apply the positive-piece description also to the adjacent syntomic term in the source diagram; do not extend α_r past degree r. Use the height defect formula and the strict negativity of nonzero bundle H¹.

**Checks.**

- Point, r=0: the square is bicartesian; h¹₋₁(0)=0 and h¹₀(0)=H¹(O)=0; the pair (Fⁿʳ,B_dR⁺) is acyclic; H⁰⁰=Q_p has curvature <0, and H_syn¹(pt,0)=coker(Q_p⊕B_dR⁺→B_dR⁺)=0 because 1−φ is onto B_cris⁺ and F⁰=B_dR⁺; ht(H⁰⁰)=1=dim_C H⁰_dR. All five conditions hold.
- Dagger disc, r=1: the square is bicartesian (§1.6); h¹₀(1)=h¹₁(1)=0; the pairs in degrees 0 and 1 are O and the zero pair; ht(H¹¹)=0=dim_C H¹_dR(D).

*Needs:* §§2.1 and 2.4–2.5; §0.4; the adjacent syntomic positive piece obtained from the filtered fiber triangle of the dagger-analytic-complexes contract and the qbc-pairs recognition theorem.

### 2.7 the four conjectural properties for a small variety

For a small smooth dagger X/C the following families of statements are equivalent: the fundamental squares are bicartesian for all 0≤i≤r; all pairs (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)) are acyclic; every Hⁱ_proét(X,Q_p) has curvature ≤0; ht(Hⁱ_proét(X,Q_p))=dim_C Hⁱ_dR(X) for every i. This is an equivalence of properties, not a proof that they hold for every small X.

The first family quantifies over every pair of integers 0≤i≤r. The other three quantify over every i≥0. Tate twisting does not change the vanishing of the bundle H¹ terms, so the adjacent finite positive piece can be transported to twist r+1 where αᵣ₊₁ applies.

(CN25 Corollary 7.11 and Remark 7.12, p. 48; Conjectures 7.1, 7.3 and 7.4, p. 46, CN25 line 2382.)

A proof route uses the following steps. Vary r in the degreewise equivalence and use twist invariance. For the adjacent positive-curvature piece use the bundle-cohomology twist identification h¹_i(r)≅h¹_i(r+1) from the failure objects. At r+1 the comparison range includes degree r+1; this identifies the finite positive piece needed for the induction. No comparison of the full syntomic group in degree r+1 at twist r is asserted.

**Checks.**

- Dagger disc: degree 0 gives the pair O and ht(Q_p)=1=dim_C H⁰_dR; degree 1 gives the zero pair and ht(O(D)/C)=0=dim_C H¹_dR; higher degrees vanish. All four families hold.
- Negative control for the quantifier over all degrees: height bookkeeping with the pair O in degree 0 and a rank-one degree-2 pair with bundle O(−1) satisfies the identity in degree 0 (1=1) but not in degree 2, where the height is 1+ht(h¹₂(2))=1−1=0≠1. A single-degree identity does not give acyclicity in every degree.

*Needs:* §2.6; §1.4; §2.1, simultaneous twists of finite failure objects.

### 2.8 splitting the crystalline eigenspace complex

For a smooth quasi-compact dagger X/C, r≥dim X, and the functorial overconvergent log-crystalline complex RΓ_cris(X) of the overconvergent-crystalline-complex contract, Hⁱ([RΓ_cris(X)]^(φ=pʳ))≅(Hⁱ_HK(X)⊗B_st⁺)^(N=0,φ=pʳ) as BC objects. The eigenspace complex is quasi-isomorphic to the direct sum of these groups placed in degree i. The splitting depends on cocycle lifts; it is neither canonical nor claimed Galois equivariant. The proof uses the completed unramified coefficient version of HK, with its comparison to the Fⁿʳ version.

(CN25 Lemma 7.13 and Remark 7.14, pp. 48–49, CN25 line 2397.)

A proof route uses the following steps. Use the non-equivariant crystalline–HK comparison. Decompose each finite HK group into Dieudonné–Manin blocks and choose cocycle lifts of its basis. Construct maps into the mapping fiber of 1−φ/pʳ by correcting each lifted block with a primitive of its Frobenius discrepancy. Use the slope bound ≤min(i,dim X) and r≥dim X to identify the eigenspaces and cohomology.

**Checks.**

- For a point (dim X=0, r=0) the complex is B_cris⁺ in degree 0; its derived φ=1 eigenspace [B_cris⁺ —(1−φ)→ B_cris⁺] has H⁰=Q_p and H¹=0, since 1−φ is onto B_cris⁺, matching (B_st⁺)^(N=0,φ=1)=Q_p. At r=1 the same point gives (B_cris⁺)^(φ=p) in degree 0 and again nothing in degree 1.
- On the closed dagger disc the overconvergent realization has HK¹=0, as the formula requires. Ordinary completed crystalline cohomology of the smooth formal disc is built from the Tate algebra, whose de Rham H¹ contains the class of ω=Σ_(n≥1) pⁿT^(pⁿ−1)dT: its coefficients tend to 0, but its formal primitive Σ_(n≥1) T^(pⁿ) does not converge on the closed unit disc, while ω is a limit of the exact partial sums. Substituting that complex would add a nonzero, non-Hausdorff degree-one term.

*Needs:* §0.6; §1.2; CrystallineCohomology §CR.4.7, Slope decomposition on the existing isocrystal carrier, applied to Hⁱ_HK(X) over F̂ⁿʳ; the slope bound of the dagger-analytic-complexes contract; the overconvergent-crystalline-complex contract, for RΓ_cris(X), its Frobenius and its comparison with the completed-unramified Hyodo–Kato complex.

### 2.9 a noncanonical decomposition of syntomic cohomology

For smooth quasi-compact dagger X/C and r≥dim X, every natural syntomic TVS H_synⁱ(X,r) is isomorphic, noncanonically, to h¹ᵢ₋₁(r)⊕h⁰_i(r)⊕P_i, where P_i is a reasonable B_dR⁺-Pair representing the curvature-zero piece. For i≤r this decomposes pro-étale cohomology through α_r. It does not prove that the canonical qBC filtration splits canonically or that every qBC splits. The comparison classes of Layer 3 and the theorems of Layers 4–5 do not depend on this decomposition.

(CN25 Proposition 7.15, pp. 49–50, CN25 line 2424.)

A proof route uses the following steps. Replace the crystalline eigenspace complex by its split cohomology complex. Represent the syntomic fiber by the explicit three-term total complex and remove an acyclic differential-image complex. Choose a continuous B_dR⁺-linear complement of Hⁱ⁻¹_dR(X/B_dR⁺) in RΓ^(i−1)/im d mapping homeomorphically onto RΓ^(i−1)/ker d, as in the de-rham-quotient-splitting contract; the source's route uses finite free de Rham cohomology, compact-type reflexivity, extension of continuous forms and the open mapping theorem. The remaining kernel and cokernel are h⁰_i and h¹ᵢ₋₁; reduce the middle Pair modulo tʳ.

**Checks.**

- Point, r=i=0: H_syn⁰=Q_p=h¹₋₁(0)⊕h⁰₀(0)⊕P₀ with h¹₋₁(0)=0, h⁰₀(0)=Q_p and P₀=0.
- Dagger disc D, i=r=1: h¹₀(1)=0 and h⁰₁(1)=0 since HK¹=0, so H_syn¹(D,1)≅H¹_proét(D,Q_p(1))≅O(D)/C is the Pair term P₁ alone, of height 0.
- The splitting input in degree q=0 on the dagger disc: take the closed dagger disc D₀ over K, put D=D₀ base changed to C, and use the one-member covering, whose Čech–de Rham complex is the scalar extension RΓ_dR(D₀/K)⊗̂_K B_dR⁺ of §1.1 (K⊆B_dR⁺ canonically, whereas C is not). Then E₀=O(D₀)⊗̂_K B_dR⁺ (there is no image in degree 0), H₀=B_dR⁺ the constants and Q₀=E₀/B_dR⁺. Evaluation at T=0 on O(D₀), extended B_dR⁺-linearly, sends 1⊗b to b and T⊗b to 0; it is a continuous B_dR⁺-linear retraction onto H₀ whose kernel, the cochains with zero constant term, maps bijectively and homeomorphically onto Q₀. For a point, E₀=H₀=B_dR⁺ and Q₀=0.

*Needs:* §§2.3 and 2.8; LocallyAnalyticDistributions §§0.0–0.2, compact-type duality and open mapping; the de-rham-quotient-splitting contract, for the continuous complement in degree i−1; reasonable Pairs from the qbc-pairs contract.

### Examples

At a point, h⁰=Q_p, h¹=0 and A=0, so the qBC graded pieces are (0,0,Q_p) and the height is 1. On a dagger disc in degree one, the pieces are (0,O(D)/C,0) and the height is 0=dim H¹_dR(D). A hypothetical pair with O(−1) in degree r has ht(h¹_r)=−1; it contributes a deficit of 1, demonstrating why a zero height defect must kill each H¹ term separately (CN25 Corollary 7.9 and Proposition 7.10, lines 2350–2381).

### Dependencies

Layers 0–1; finite BC and coherent bundle cohomology from VectorBundlesAndIsocrystals VB1–VB3; qbc-pairs, dagger-analytic-complexes and stable-range-period-map contracts. Only the splitting branch uses de-rham-quotient-splitting and overconvergent-crystalline-complex.

## Layer 3: geometric classes with nonnegative de Rham slopes

### 3.1 varieties with nonnegative de Rham slopes

A smooth dagger X/C has de Rham slopes ≥0 if X is small and, for every i≥0, the filtered module (Hⁱ_HK(X),F⁰Hⁱ_dR(X/B_dR)) is acyclic. The term refers to slopes of its modified bundle, not to φ-slopes alone and not to nonnegative Hodge–Tate weights.

(CN25 §8.1, p. 50; Conjecture 7.1, p. 46, CN25 line 2462.)

A proof route uses the following steps. Use smallness to obtain finite filtered modules in every degree. Apply the acyclic predicate to their induced F⁰ lattices.

The defining data and their natural maps have the following API.

- The predicate implies smallness.
- For each i the indicated filtered HK module is acyclic.
- The predicate is preserved by compatible isomorphisms of the full cohomology package.
- For small X it is equivalent to all fundamental squares being bicartesian, by §2.7.
- It implies ht(Hⁱ_proét)=dim_C Hⁱ_dR in every degree.

**Checks.**

- A point has the predicate: its only nonzero bundle is O.
- A smooth dagger affinoid has the predicate by the elementary diagram, smallness and §2.7; in particular the dagger disc does.
- The countable disjoint union of points does not have the predicate, because it is not small even though its components have it.

*Needs:* §§0.3 and 1.2; §2.7 for the API equivalences.

### 3.2 nonnegative de Rham slopes for products

If smooth dagger X,Y/C have de Rham slopes ≥0, their product has de Rham slopes ≥0. In degree n the cup product gives an injective bundle map ⊕_(i+j=n)E_i(X)⊗E_j(Y)→E_n(X×Y) whose cokernel is coherent and supported at ∞. Equality of the two filtration lattices is not required or asserted.

(CN25 Theorem 8.1(a), p. 50, CN25 line 2466.)

A proof route uses the following steps. The de Rham Künneth isomorphism over C for the small factors, transported through the multiplicative Hyodo–Kato comparisons, gives the HK and B_dR⁺ Künneth isomorphisms compatible with cup products; these establish smallness of X×Y and identify the punctured bundles. The filtered cup product gives lattice containment, hence the injection with torsion cokernel at ∞. Tensor acyclicity annihilates H¹ of the source and torsion sheaves have H¹=0; the long exact sequence annihilates H¹ of the target.

**Checks.**

- Two dagger discs: each factor and D×D have de Rham dimensions (1,0,0), as Künneth requires. Pro-étale cohomology has no such tensor formula: H¹_proét(D×D,Q_p(1))≅O(D×D)/C, and the class of TS is not in the span of the two pulled-back copies of O(D)/C, since ∂²(TS)/∂T∂S=1 whereas f(T)+g(S) has mixed derivative 0.
- Two dagger annuli: dimensions (1,1) and (1,1) give (1,2,1) for the product, with degree-two generator dT/T∧dS/S.

*Needs:* §3.1; §0.4, tensor acyclicity and torsion modification; the de Rham Künneth isomorphism over C of the dagger-kunneth-over-c contract; cup products and their compatibility with the HK and filtered B_dR⁺ comparisons from the dagger-analytic-complexes contract.

### 3.3 algebraic analytifications have nonnegative slopes

For a smooth finite-type algebraic variety V/C, its dagger analytification Vᵃⁿ has de Rham slopes ≥0. For each i, the algebraic admissible filtered module maps to its analytic counterpart, isomorphically on HK; the resulting bundle injection has coherent cokernel supported at ∞. The analytic lattice may be larger than the algebraic one.

(CN25 Theorem 8.1(b), pp. 50–51, CN25 line 2489.)

A proof route uses the following steps. Use the algebraic period comparison to obtain an admissible algebraic pair. Apply HK GAGA and analytic de Rham finiteness to obtain smallness and the lattice comparison. Enlarging the lattice gives a torsion modification; the H¹ sequence transfers acyclicity.

**Checks.**

- V=A¹: algebraic and analytic de Rham cohomology are both (1,0), and the degree-zero pair is O. Algebraic étale H¹(A¹_C,Q_p)=0, whereas H¹_proét(A¹ᵃⁿ,Q_p(1))≅O(A¹ᵃⁿ)/C≠0 by the Stein diagram with HK¹=0; replacing analytic pro-étale cohomology by algebraic étale cohomology loses this group.
- V=G_m: H¹_HK is a line with φ=p and H¹_dR is spanned by dT/T with Hodge jump 1; the algebraic and analytic pairs coincide, with lattice t⁻¹B_dR⁺ and bundle degree 1−1=0, so the pair is O.

*Needs:* §3.1; §0.4, torsion modifications; AdicSpacesPartIV F1.8, dagger analytification; CohomologyComparisons §4.8; the algebraic-comparison-over-c and analytic-hk-gaga contracts.

### 3.4 almost proper varieties have nonnegative slopes

Let X/C be smooth proper rigid analytic and Z⊆X any closed analytic subvariety. The smooth dagger complement U=X∖Z has de Rham slopes ≥0. No smoothness or normal crossings assumption on Z is imposed in the conclusion. A proper modification reducing the boundary to a simple normal crossings divisor is a proof input.

(CN25 Theorem 8.1(c), p. 51, CN25 line 2501.)

A proof route uses the following steps. First discard the connected components of X contained in Z; this leaves the same U and reduces the boundary to a nowhere dense closed subspace. Resolve that pair in characteristic zero, without changing U, obtaining a smooth proper X′ with normal crossings boundary D. Use the logarithmic period exact sequence for the proper pair (X′,D). Identify ordinary HK and unfiltered de Rham cohomology of U with the log pair and compare logarithmic and naive filtrations. Surjectivity in the top logarithmic sequence implies it for the fundamental difference map for U in every degree. Apply induction and §2.7; retain finiteness proving smallness.

**Checks.**

- For Z=∅ the result is the proper case. For Z=X the complement is empty and every cohomology group is 0. A singular or nonreduced boundary has the same complement as its reduced support, while the resolution input must still cover the proper rigid pair.

*Needs:* §3.1; §1.4, surjectivity induction; PadicHodgeTheory §2.7, `properRigidLogResolution`, through the proper-pair-resolution-over-c contract; the exact logarithmic sequence of the proper-log-period-sequence contract and its identification of HK and unfiltered de Rham cohomology of U with those of the proper log pair, whose finiteness gives smallness.

### 3.5 the logarithmic and naive filtration discrepancy

With U=X′∖D a resolved almost proper pair and i≤r, the two-term complexes [Hⁱ_ét(U,Q_p(r))→H̃ⁱ_proét(U,Q_p(r))] and [Hⁱ(FʳRΓ_dR(X′ with log D/B_dR⁺))→H̃ⁱ(FʳRΓ_dR(U/B_dR⁺))] are naturally isomorphic in the derived/left-heart realization. These are complexes with maps; no equality of ordinary quotient vector spaces without strictness is inferred.

(CN25 Remark 8.2, p. 51, CN25 line 2528.)

A proof route uses the following steps. Compare the logarithmic period and analytic syntomic triangles. Their HK and unfiltered de Rham terms are isomorphic. Cancel those terms in the associated mapping cones.

**Checks.**

- For a proper point with empty boundary at i=r=0 the two discrepancy complexes are [Q_p —id→ Q_p], respectively [B_dR⁺ —id→ B_dR⁺], and have zero cohomology in both degrees. Their terms are nonzero; zero here means the zero object of the derived category.

*Needs:* §3.4; §1.3; the compatible logarithmic and naive filtrations of the proper-log-period-sequence contract.

### 3.6 comparison for semistable tube complements

Let 𝔛/O_K be weak formal with local étale charts Spf(O_K{T₁,…,T_n}/(T₁⋯T_s−π)), 1≤s≤m≤n. Let 𝔝 be locally either ⋂_(j=s+1)^m V(T_j) or ⋃_(j=s+1)^m V(T_j), with the stated compatible charts, and assume 𝔛_K smooth proper. For U=]𝔛_k∖𝔝_k[_𝔛, the base change U_C has de Rham slopes ≥0 and hence bicartesian fundamental diagrams. The restriction RΓ_dR(𝔛_K∖𝔝_K)→RΓ_dR(U) is an unfiltered quasi-isomorphism, compatible with the natural filtration map; no filtered-complex quasi-isomorphism is claimed. The compatible HK comparison identifies the underlying coefficients, and naturality gives inclusion of the induced full B_dR⁺ lattices. That inclusion, rather than equality of the filtrations, suffices for acyclicity.

For an empty intersection of coordinate zero loci (m=s) the intersection boundary is the entire model and its complement is empty. For the empty union the boundary is empty and the complement is the whole generic fibre. These conventions are kept distinct. Taking the reduced boundary leaves the complement unchanged; a square-zero thickening itself is not a smooth comparison input.

(CN25 Proposition 8.3 and the following example, pp.51–52, CN25 line 2538; GK04 Corollary 3.8(a),(c), p.16; Proposition 3.7, pp.14–16, in arXiv v1 pagination, GK04 line 556.)

A proof route uses the following steps. Use Grosse-Klönne Corollary 3.8(a),(c) for the unfiltered tube-complement comparison in the stated charts. The filtration compatibility used here is containment of induced lattices, as distinguished from an equivalence of filtered complexes by the Check below. Apply the almost proper theorem to V=(𝔛_K∖𝔝_K)_C, and use the compatible HK comparison to identify its punctured bundle with that of U_C. Quasi-compactness of U_C gives smallness. The natural filtration map sends L_V into L_U inside the common localized period module. These are full lattices, so E_i(V)→E_i(U_C) is injective with finite-length cokernel at ∞. Torsion sheaves have H¹=0; the cohomology sequence therefore transfers H¹=0 from E_i(V) to E_i(U_C).

**Checks.**

- Empty intersection (m=s): the boundary is the whole model, so 𝔛_K∖𝔝_K and U are both empty and the restriction is the zero map of zero complexes. Empty union: U is the whole generic fibre and the restriction is the identity.
- For the weak formal projective line and the infinity section, restriction from the affine line to the dagger closed unit disc is not a quasi-isomorphism on gr⁰ of the naive Hodge filtration: (1−πT)⁻¹ is overconvergent on the disc but has a pole on the affine line. This rules out the stronger filtered-complex claim without affecting unfiltered de Rham invariance or the lattice-inclusion argument.

*Needs:* §3.4; §0.4, lattice enlargement; AdicSpacesPartIV F1.16, formal tubes; geometric-finiteness-tubes, the unfiltered de Rham quasi-isomorphism of the semistable tube restriction over K and over C; the natural Hyodo–Kato comparison of dagger-analytic-complexes and §1.1 pullback of filtered cohomology, for the HK identification and the full-lattice inclusion; dagger-de-rham-finiteness-over-c, smallness of the quasi-compact U_C.

### 3.7 small tubular neighbourhoods in projective space

Let X=Pⁿ_K and let Z=Z₁×_X⋯×_XZ_c be a smooth scheme-theoretic complete intersection of c hypersurfaces in the codimension-c setting of Proposition 8.4. There is ε₀∈|K×| such that for positive ε∈|K×| with ε<ε₀, removing the specified tubular neighbourhood Z(ε) instead of Z induces compatible quasi-isomorphisms in de Rham and HK cohomology. The union version is the corresponding restriction for X∖⋃Z_j→X∖⋃Z_j(ε); its target includes a simultaneous comparison on the intersections of that cover, at one sufficiently small radius. Smoothness of the full complete intersection alone is not used as a claim that every partial intersection is smooth. The resulting dagger complement over C has de Rham slopes ≥0. The chosen tube definition and its radius inequalities are part of the geometric-finiteness-tubes contract. The restriction preserves the induced filtration, but equality of filtration lattices or a filtered-complex quasi-isomorphism is not required: lattice containment transfers acyclicity through a torsion quotient at ∞.

Choose integral models of the hypersurface line bundles on the standard projective formal model. On a formal chart trivializing them, define Z(ε) by all inequalities |f_j|≤ε. Integral changes of trivialization have absolute value 1 and give the same subdomain; arbitrary rescaling of the equations changes the radius and is not ignored. For a union use the union of the individual tubes. Require 0<ε<ε₀, with ε,ε₀∈|K×|. The local definition and its independence are BKV22 §4, p.26, lines 1176–1187. The complete-intersection condition is codimension c. At c=0, the intersection is X and both intersection complements are empty, while the empty union has complement X; these cases are distinct. For the union assertion, the common small-radius bound must work on every nonempty Čech intersection; the geometric-finiteness-tubes contract includes precisely this compatibility.

(CN25 Proposition 8.4 and the following paragraph, p. 52, CN25 line 2557; GK04 Proposition 3.7, pp.14–16, in arXiv v1 pagination, GK04 line 499.)

The tube Z(ε) has the following API.

- On two integral charts trivializing the line bundles the transition functions are units of the integral structure sheaf, of absolute value 1 at every point, so the local subdomains {|f_j|≤ε} agree on overlaps and Z(ε) is a well-defined subset of Xᵃⁿ (BKV22 lines 1180–1183).
- Changing a trivialization by an integral unit leaves each local inequality, and hence Z(ε), unchanged; multiplying an equation by a constant λ∈K with 0<|λ|<1 replaces the radius ε by ε/|λ|.
- For ε≤ε′ in |K×| one has Z(ε)⊆Z(ε′), and every Z(ε) contains Zᵃⁿ.
- The intersection tube is the intersection of the hypersurface tubes Z_j(ε), and the union tube is their union; on a chart their complements are {x : |f_j(x)|>ε for some j} and {x : |f_j(x)|>ε for every j} respectively, so for c=0 the first is empty and the second is the whole chart, and for c≥1 they are {max_j|f_j|>ε} and {min_j|f_j|>ε}.

**Checks.**

- Unit rescaling: on the chart Spf O_K⟨T⟩ of P¹ with f=T and ε=|π| the tube is {|T|≤|π|}; for |a|=1 the equation aT gives the same set, and the point T=1 lies outside it.
- Non-unit rescaling: the equation πT with the same ε gives {|T|≤1}, the whole chart, which contains T=1; a definition that ignored rescaling of the equations would not determine the radius.
- Monotonicity: the radius |π|² gives {|T|≤|π|²}, which contains T=π² but not T=π, whereas both points lie in the tube of radius |π|.
- Degenerate index sets: with c=0 equations the intersection tube is the whole chart and its complement is empty; the empty union of tubes is empty and its complement is the whole chart.
- On P¹ with Z=∞, coordinate S=1/T near ∞, f=S and ε=|π|: the closed tube is {|S|≤|π|}, its complement is the open disc {|T|<|π|⁻¹}, and the pieces U_ε′={|S|≥ε′}={|T|≤1/ε′} for ε′∈|K̄×| with |π|<ε′<1 are closed discs exhausting it after base change to C. For K=Q_p the original value group has no such ε′, whereas ε′=|p|^(1−1/n), n≥2, decreases to |p| and the corresponding disc radii increase to |p|⁻¹. Over C each has de Rham cohomology (C,0), as do the open disc and A¹_C=P¹_C∖Z_C; the corresponding spaces defined over K have (K,0). Grosse-Klönne's U for the radius |π| itself is the closed disc {|T|≤|π|⁻¹}, which also contains the circle |T|=|π|⁻¹ and so is strictly larger than the complement of the closed tube.

A proof route uses the following steps. For the geometric comparison first base change X and Z to C. For every ε′∈|K̄×| with ε′<ε₀, Grosse-Klönne Proposition 3.7, applied with the local normal-coordinate description along the smooth complete intersection, gives the quasi-isomorphism RΓ_dR(X_C∖Z_C)→RΓ_dR(U_ε′) for U_ε′={x : |f_j(x)|≥ε′ for some j}; it removes the open polydisc tube {|f_j|<ε′ for all j}. The complement of the closed tube Z(ε) is the increasing union of the quasi-compact U_ε′ over ε<ε′<ε₀ in the divisible value group |K̄×|, which is nonempty even when |K×| has no element strictly between ε and ε₀. Along a sequence ε′_n in |K̄×| decreasing to ε, its de Rham complex is the derived limit of theirs; the transition maps are quasi-isomorphisms, so the R¹lim terms vanish and the limit is again a quasi-isomorphism. Transfer to HK through its comparison and naturality; check analytic Čech descent for all strata used in the union statement. The comparison over K and its compatibility with this geometric base change, as well as the precise radius and descent compatibility, are part of the geometric-finiteness-tubes contract. Use the unfiltered HK/de Rham comparisons and the period comparison to establish finite freeness and smallness of the tube complement; naturality includes the induced lattice of the almost proper complement in that of the tube complement. The resulting injective bundle map has torsion cokernel at ∞; its cohomology sequence transfers H¹=0 as in the semistable tube case. The maps on HK and on the induced B_dR⁺ lattices commute with restriction on every Čech intersection at the common radius; unfiltered de Rham invariance gives no equality of filtrations.

*Needs:* §3.4; §0.4, lattice enlargement; geometric-finiteness-tubes, unfiltered de Rham quasi-isomorphisms for the integral tube models with simultaneous Čech-radius control; the natural Hyodo–Kato comparison of dagger-analytic-complexes and §1.1 pullback of filtered cohomology, for the HK quasi-isomorphisms and the lattice inclusion; §3.4, smallness of X∖Z, transported to the tube complement by the de Rham quasi-isomorphism and the Hyodo–Kato comparison; the derived limit over the exhaustion by the U_ε′ from strict-countable-derived-limits.

### Examples

A point and a dagger disc have nonnegative de Rham slopes. The product of two annuli has de Rham dimensions (1,2,1), with degree-two generator dT/T∧dS/S; the two degree-one summands occur in the cup product. For the weak formal P¹ minus the infinity section, the semistable tube complement of §3.6 is the closed dagger unit disc: both have unfiltered de Rham dimensions (1,0), while the analytic function (1−πT)⁻¹ on that disc cannot extend to the whole affine line because of its pole at π⁻¹. Thus the comparison of complexes is unfiltered (CN25 Theorem 8.1 and Proposition 8.3, lines 2466–2549; GK04 Proposition 3.7, line 499, Corollary 3.8, line 556).

### Dependencies

Layers 0–2 except the splitting branch; AdicSpacesPartIV F1.11–F1.12 and F1.16; CohomologyComparisons §§4.8–4.11; PadicHodgeTheory §2.7; algebraic-comparison-over-c, analytic-hk-gaga, proper-log-period-sequence, dagger-analytic-complexes, dagger-de-rham-finiteness-over-c, dagger-kunneth-over-c, proper-pair-resolution-over-c and geometric-finiteness-tubes contracts.

## Layer 4: inverse limits and proper times Stein

### 4.1 cohomology along a countable exhaustion

Fix a smooth dagger X/C with a chosen increasing admissible exhaustion X=⋃_(n∈N) X_n by quasi-compact open dagger subspaces, each having nonnegative de Rham slopes. For fixed r use the inverse systems `H_n^(r,i)`,`X_n^(r,i)`,`F_n^(r,i)`,B_n^i,`A_n^(r,i)` and `Fbar_n^(r,i)`=`F_n^(r,i)`/`A_n^(r,i)`=`Fil_n^(r,i)`, with restriction maps. The global versions are cohomology of the respective derived inverse-limit complexes, not definitions as ordinary limits of groups. In this setting `X^(r,i)`≅lim `X_n^(r,i)`, B^i≅lim B_n^i, and R¹lim `X_n^(r,i)`=R¹lim `Fbar_n^(r,i)`=0.

(CN25 §8.2.1, notation (8.5)–(8.8) and Remark 8.9(i)–(ii), pp. 52–53, CN25 line 2574.)

A proof route uses the following steps. Restrict the analytic complexes and their comparison maps to the chosen exhaustion. Use the imported derived-limit descent for HK, filtered de Rham and pro-étale complexes. Apply the analytic inverse-limit vanishing contract summarized in CN25 Remark 8.9(i), including the finite BC quotient argument for F̄^r.

The defining data and their natural maps have the following API.

- Restriction maps commute with all four corners and the torsion kernels.
- F̄_n=F_n/A_n is the induced image filtration, not F_n itself.
- A cofinal refinement induces the canonical isomorphism of derived-limit complexes.
- X and B identify with their ordinary limits under the stated analytic descent hypotheses.

**Checks.**

- For a constant exhaustion X_n=X the derived-limit complex is the original complex and the R¹lim terms vanish.
- Degree of the Roos model: for the constant tower Q_p placed in degree 0, 1−shift on ∏Q_p is onto, with section (b_n)↦(a_n), a₀=0, a_n=−Σ_(k<n)b_k, and kernel the diagonal Q_p; so Cone(1−shift)[−1]=[∏Q_p→∏Q_p] in degrees 0 and 1 has (H⁰,H¹)=(Q_p,0), while the unshifted cone has (H⁻¹,H⁰)=(Q_p,0) and puts the limit in degree −1. For a constant tower V placed in degree 1 the only nonzero group is H¹=V, as the Milnor sequence requires.
- For an exhaustion of the dagger open disc, `F_n^(1,1)` can have a nonzero torsion kernel although `Fbar_n^(1,1)`=0; replacing F by F̄ loses that kernel.
- Unbounded amplitude: for X the disjoint union of the polyannuli Aᵐ, m≥0, with A a dagger annulus, and X_n the union of those with m≤n, each X_n is quasi-compact with nonnegative de Rham slopes and Hⁿ_dR(X_n) contains the nonzero class of dT₁/T₁∧⋯∧dT_n/T_n. No common upper bound exists, so the derived limits are formed in the bounded-below category; in each degree i the truncations τ_≤i RΓ_dR(X_n) have the common amplitude [0,i] and compute the same degree-i group.

*Needs:* §§1.1 and 3.1; the strict-countable-derived-limits contract, Roos derived limits of towers of bounded-below complexes in the left heart and their truncation compatibility; the analytic-exhaustion-descent contract, exhaustion descent and period-limit vanishing; the bc-countable-inverse-limits contract, finite BC inverse-limit vanishing.

### 4.2 the inverse-limit obstruction sequence

For the chosen exhaustion and a fixed r, in each integer degree 0≤i≤r the Milnor sequences are 0→R¹lim `F_n^(r,i-1)`→`F^(r,i)`→lim `F_n^(r,i)`→0 and 0→R¹lim `H_n^(r,i-1)`→`H^(r,i)`→lim `H_n^(r,i)`→0. The stagewise comparison sequences give 0→lim `H_n^(r,i)`→lim `X_n^(r,i)`⊕lim `F_n^(r,i)`→lim B_n^i→R¹lim `H_n^(r,i)`→R¹lim `F_n^(r,i)`→0. If R¹lim `H_n^(r,j)`=0 for every 0≤j≤r, with negative-degree terms zero, the global sequence 0→`H^(r,i)`→`X^(r,i)`⊕`F^(r,i)`→B^i→0 is exact and R¹lim `F_n^(r,i)`=0 in that range.

(CN25 Remark 8.9(ii)–(iii), p. 53, CN25 line 2601.)

A proof route uses the following steps. Apply the Milnor sequences of the Roos derived limit in the left heart, where R^q lim vanishes for q≥2, to the towers of complexes. Apply the long exact inverse-limit sequence to the stagewise short exact comparison sequence. Use R¹lim X_n=0 and the two Milnor sequences to replace the limits by the actual global groups.

**Checks.**

- At degree zero all negative-degree groups vanish.
- For the constant tower `F_n^(1,1)`=O(D)/C of a dagger disc, 1−shift on the countable product is onto, with the continuous section (b_n)↦(−Σ_(k<n) b_k); hence lim=O(D)/C and R¹lim=R²lim=0, although O(D)/C is infinite dimensional over Q_p, so the finite-dimensional Mittag–Leffler limit theorem does not apply to it.
- For the tower V_n=⊕_(j≥n)Q_p with inclusions, lim=0 while R¹lim≅Q_p^N/⊕Q_p contains the nonzero class of (1,1,1,…); the Milnor sequence places such a class in the next degree of the global group, so the obstruction terms are not zero in general.

*Needs:* §4.1; §2.4, stagewise short exact comparison; the strict-countable-derived-limits contract, Milnor sequences, the six-term lim/R¹lim sequence and R^q lim=0 for q≥2 in the left heart.

### 4.3 a de Rham criterion for R¹lim vanishing

For the exhaustion above, fixed r and i≤r, R¹lim `DR_n^(r,i-1)`=0 implies R¹lim `A_n^(r,i)`=0, which implies R¹lim `H_n^(r,i)`=0. Here `DR_n^(r,j)`=Hʲ(RΓ_dR(X_n/B_dR⁺)/Fʳ). Moreover R¹lim(`H_n^(r,i)`/`A_n^(r,i)`)=0 without the first hypothesis: these quotients lift functorially to finite BC objects.

(CN25 Lemma 8.10, Remark 8.11 and footnote 22, p. 53; Remark 3.15, p.16, CN25 line 2623.)

A proof route uses the following steps. The de Rham long exact sequence expresses A_n as a quotient of `DR_n^(r,i-1)`; countable R²lim=0 proves the first implication. Use comparison to express H_n/A_n as a kernel between finite BC objects, retaining their Vector Space lifts. Use countable BC inverse-limit vanishing and the long exact sequence for 0→A_n→H_n→H_n/A_n→0.

**Checks.**

- Constant exhaustion X_n=X: every tower is constant, 1−shift is onto with section (b_n)↦(−Σ_(k<n)b_k), and all three R¹lim terms vanish, as the chain of implications predicts.
- Constant exhaustion of a dagger disc at r=i=1: A_n¹¹=H_n¹¹=O(D)/C and the quotient H_n¹¹/A_n¹¹=0 is trivially finite BC, so its R¹lim vanishes with no hypothesis on DR.
- The tower ⊕_(j≥n)Q_p of §4.2 has R¹lim≠0, so the criterion depends on the de Rham towers and their finite BC quotients, not on a property of all towers of Q_p-spaces.

*Needs:* §§4.1–4.2; the filtered long exact sequence of §1.1; R²lim=0 and the six-term lim/R¹lim sequence from the strict-countable-derived-limits contract; the finite BC quotient realization of §2.3 and countable BC inverse-limit vanishing from the bc-countable-inverse-limits contract.

### 4.4 étale Künneth with a proper factor

For smooth rigid analytic Y,T/C with Y proper, cup product gives ⊕_(j≥0)Hʲ_ét(Y,Q_p)⊗_(Q_p)Hⁱ⁻ʲ_ét(T,Q_p)≅Hⁱ_ét(Y×T,Q_p) for every i≥0. The sum is finite in each degree. At integral level the corresponding comparison uses a derived tensor over Z_p. The perfect coefficient complex in the projection formula is RΓ_ét(Y,Z_p); no perfection of RΓ_ét(T,Z_p) is assumed.

The integral statement is RΓ_ét(Y,Z_p)⊗ᴸ_(Z_p)RΓ_ét(T,Z_p)≃RΓ_ét(Y×T,Z_p). The comparison is the cup-product map induced by the two projections, and its reduction to the rational direct sum uses the perfect proper-factor complex.

(CN25 Lemma 8.13, equations (8.14)–(8.15), p. 54, CN25 line 2673.)

A proof route uses the following steps. Apply proper base change to the projection Y×T→T to identify its derived direct image with the constant RΓ_ét(Y,Z_p). Use perfection of the proper factor to pull this constant complex through derived global sections. Invert p and take cohomology over the field Q_p.

**Checks.**

- Y=P¹: Hʲ_ét(P¹,Q_p) is Q_p, 0, Q_p(−1) for j=0,1,2, so Hⁱ(P¹×T)=Hⁱ(T)⊕Hⁱ⁻²(T)(−1) for every smooth T, a finite sum even when Hⁱ(T) is infinite dimensional. For Y a point the map is the identity.
- T a disjoint union of countably many points and Y=P¹: H⁰_ét(Y×T,Q_p)=(∏_N Z_p)[1/p]=Q_p⊗(∏_N Z_p)[1/p], the sequences with bounded denominators; it is strictly smaller than the pro-étale group ∏_N Q_p, which contains (p⁻ⁿ)_n. Both sides of the formula agree, finiteness is needed only on the proper factor, and for two nonproper factors no formula is asserted.

*Needs:* ClassicalAdicEtaleCohomology §8.4, proper base change and projection formula; the proper-rigid-integral-etale contract, perfect proper-factor Z_p-cohomology and rationalization.

### 4.5 R¹lim vanishing for proper times Stein

Let Y/C be smooth proper and S/C smooth dagger Stein, with a strictly increasing admissible covering by open dagger affinoids S_n, that is, a Stein covering with S_n ⊂† S_(n+1) in the sense of AdicSpacesPartIV F1.7. Put X_n=Y×S_n. For every i≥0, R¹lim_n Hⁱ_proét(X_n,Q_p)=0. Consequently Hⁱ_proét(Y×S,Q_p)≅lim_n Hⁱ_proét(X_n,Q_p), with the natural cohomological topologies.

(CN25 Proposition 8.12 and Remark 8.16(i), p. 54, CN25 line 2660.)

The Stein factor needs its own limit theorem. For S and (S_n) as above and every integer j≥0, prove R¹lim_n(Ωʲ⁻¹(S_n)/ker d)=0 in LH(C_Q_p), with Ω⁻¹=0, and deduce R¹lim_n Hʲ_proét(S_n,Q_p(j))=0. The towers of §1.5 do not give this by themselves: the analytic-exhaustion-descent contract kills R¹lim of the towers `X_n^(j,j)` and `Fbar_n^(j,j)`, and on discs `Fbar_n^(1,1)`=0 while Ω⁰(S_n)/ker d=O(S_n)/C is nonzero.

(CN25 Proposition 8.12 proof, lines 2664–2671, where Theorem 6.14 is applied to the Stein factor.)

A proof route for the Stein factor uses the following steps. The rigid completion Ŝ is a partially proper rigid space covered admissibly by the affinoids Ŝ_n, and AdicSpacesPartIV F1.8 gives H¹(Ŝ,Ωʲ⁻¹)=0 because S is Stein; AdicSpacesPartIII R3.4, Cohomology of a countable open exhaustion, then gives lim¹_n Ωʲ⁻¹(Ŝ_n)=0 algebraically. Since S_n ⊂† S_(n+1), Ŝ_(n+1) contains a strict neighbourhood of Ŝ_n, so restriction gives maps Ωʲ⁻¹(Ŝ_(n+1))→Ωʲ⁻¹(S_n)→Ωʲ⁻¹(Ŝ_n); the dagger and the Banach towers are cofinal subsequences of one interleaved tower and have the same lim and lim¹. The difference map on the countable product of the Banach spaces Ωʲ⁻¹(Ŝ_n) is therefore a continuous surjection of Fréchet spaces, hence strict by the Fréchet open mapping theorem, so R¹lim vanishes in the left heart for the Banach tower and, by cofinality, for the dagger tower. The strict exact sequence 0→ker d→Ωʲ⁻¹(S_n)→Ωʲ⁻¹(S_n)/ker d→0 and R²lim=0 give the first assertion. The strictly exact top row 0→Ωʲ⁻¹(S_n)/ker d→Hʲ_proét(S_n,Q_p(j))→`X_n^(j,j)`→0 of §1.5 in the affinoid case, its naturality in n, and R¹lim `X_n^(j,j)`=0 give the second through the six-term sequence.

A proof route uses the following steps. Compare the derived inverse systems of dagger pieces and their rigid completions using cofinal strict shrinkings of the Stein exhaustion and the analytic descent contract. The affinoid pieces are not partially proper, so a termwise completion isomorphism is not used. On the quasi-compact completions use the étale realization relevant to the comparison. Apply proper-factor étale Künneth; the finite-dimensional proper groups commute with the inverse-limit computation. Use the Stein-factor limit theorem above, transported to the completions Ŝ_n by the same comparison, to kill R¹lim of the second factor.

**Checks.**

- Y=P¹ and S the dagger open disc exhausted by closed dagger discs S_n: by §4.4, H⁰(X_n)=Q_p and H²(X_n)=Q_p(−1), since H²(S_n)=0 for the one-dimensional S_n with HK²=0; these are constant towers with R¹lim=0 and limits Q_p and Q_p(−1).
- Stein-factor theorem at j=0: Ω⁻¹=0, and the second assertion reduces to the tower `X_n^(0,0)`; when every S_n is connected it is the constant tower Q_p, with R¹lim=0.
- Stein-factor theorem for closed dagger discs S_n of radii increasing to 1 exhausting the open disc, j=1: the quotients are O(S_n)/C, infinite dimensional over Q_p, and the target asserts R¹lim(O(S_n)/C)=0 for them directly, not through `Fbar_n^(1,1)`=0. Polynomials are dense in each O(Ŝ_n), so the difference map on ∏O(Ŝ_n) is onto.
- Stein-factor theorem, negative control: the tower ⊕_(k≥n)Q_p of §4.2 has R¹lim≠0, so the vanishing uses Theorem B on Ŝ and the interleaving of dagger and Banach sections, not a property of all towers of infinite-dimensional spaces.

*Needs:* §4.4; §1.5, the affinoid case of the simplified diagram; AdicSpacesPartIV F1.7, Stein coverings, and F1.8, vanishing of higher coherent cohomology on a dagger Stein space; AdicSpacesPartIII R3.4, Cohomology of a countable open exhaustion; LocallyAnalyticDistributions §0.2, Fréchet open mapping; the six-term lim/R¹lim sequence and R²lim=0 of the strict-countable-derived-limits contract; the analytic-exhaustion-descent contract, R¹lim `X_n^(j,j)`=0 for the affinoid exhaustion and the derived-system comparison after cofinal strict shrinkings; the proper-rigid-integral-etale contract; the Milnor sequences of the strict-countable-derived-limits contract.

### 4.6 pro-étale Künneth for proper times Stein

For the same Y,S, cup product gives ⊕_jHʲ_proét(Y,Q_p)⊗_(Q_p)Hⁱ⁻ʲ_proét(S,Q_p)≅Hⁱ_proét(Y×S,Q_p). The tensor products are ordinary tensors with the finite-dimensional proper-factor groups, carrying their natural finite direct-sum topology. This statement is restricted to a proper factor; the analogous algebraic tensor formula fails for the product of two open one-dimensional balls.

(CN25 Remark 8.16(ii), p. 54, CN25 line 2704.)

A proof route uses the following steps. Pass the proper-factor étale Künneth maps to the inverse limit over S_n. Use proper finiteness and the preceding R¹lim vanishing to identify both sides with pro-étale groups.

**Checks.**

- Y=P¹ and S a dagger open disc: the cup-product formula gives Q_p, H¹(S), Q_p(−1) and H¹(S)(−1) in degrees 0–3 and zero above, since H²(S)=0; the degree-three group is the tensor of the finite H²(P¹)=Q_p(−1) with the infinite-dimensional H¹(S).

*Needs:* §§4.4–4.5; proper-factor finiteness from proper-rigid-integral-etale.

### 4.7 the fundamental diagram for proper times Stein

For smooth proper Y/C and smooth dagger Stein S/C, X=Y×S has a bicartesian fundamental square in LH(C_Q_p) for every 0≤i≤r, r≥0. Its associated sequence is 0→Hⁱ_proét(X,Q_p(r))→(Hⁱ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ)⊕Hⁱ(FʳRΓ_dR(X/B_dR⁺))→Hⁱ_dR(X/B_dR⁺)→0, with the difference-map signs. Smallness of the global space X is not required.

Writing the order of summands as X⊕F, the last arrow is c−d and the first is (a,b). The map is formed in the left heart before extracting any ordinary cohomology groups.

(CN25 Proposition 8.17, p. 55, CN25 line 2713.)

A proof route uses the following steps. Each X_n=Y×S_n has nonnegative de Rham slopes by product stability and the proper and affinoid cases. Apply stagewise comparison, proper-times-Stein R¹lim vanishing and the inverse-limit obstruction sequence. Use the classical-corner criterion to lift exactness to the abelian left heart.

**Checks.**

- Y a point and S a countable disjoint union of points, a smooth dagger Stein space that is not small: at i=r=0 the square is ∏Q_p→∏Q_p over ∏B_dR⁺→∏B_dR⁺, the difference map ∏Q_p⊕∏B_dR⁺→∏B_dR⁺ is onto with kernel the diagonal ∏Q_p, and the sequence is exact although B⁰ is not finite free.

*Needs:* §§4.2 and 4.5; §§1.6 and 3.2, comparison of exhaustion stages; §1.3, classical corners and left-heart exactness.

### Examples

For a constant exhaustion, every derived inverse-limit error is 0. For Y=P¹ and S a dagger disc or dagger open disc, Hʲ_proét(Y,Q_p) is Q_p at j=0 and Q_p(−1) at j=2, with H¹(Y)=0. Hence H¹(Y×S)=H¹(S), H²(Y×S)=Q_p(−1), and H³(Y×S)=H¹(S)(−1), with finite-factor tensor topology. For a cofinal subsequence X₂ₙ, the global derived complexes and their Milnor sequences are unchanged (CN25 Lemma 8.13 and Remark 8.16, lines 2673–2707).

### Dependencies

Layers 1–3 except the splitting branch; AdicSpacesPartIV F1.7–F1.8; AdicSpacesPartIII R3.4; LocallyAnalyticDistributions §§0.0 and 0.2; ClassicalAdicEtaleCohomology §§1.3–1.4, 8.4 and 9.7; strict-countable-derived-limits, analytic-exhaustion-descent, bc-countable-inverse-limits and proper-rigid-integral-etale contracts.

## Layer 5: arithmetic and geometric period recovery

### 5.1 vanishing on the differential error term

For a smooth dagger affinoid X/K and i≥1, both `Hom^sm_(G_K)`((Ωⁱ⁻¹(X)/ker d)⊗̂_K C,B_st) and `Hom_(G_K)`((Ωⁱ⁻¹(X)/ker d)⊗̂_K C,B_dR) vanish. The maps are continuous Q_p-linear; the smooth Hom means the union of `Hom_(G_L)` over finite L/K. The same argument applies to the relevant Čech terms used for quasi-compact X. For i=0 the differential term is zero.

(CN25 Lemma 9.5 and its proof, pp. 55–56, CN25 line 2746.)

A proof route uses the following steps. Reduce smooth B_st maps to B_dR maps equivariant for G_L. Use Fontaine’s vanishing `Hom_(G_L)`(C,B_dR)=0 on each simple tensor. Use density of algebraic tensors and continuity in the completed tensor product.

**Checks.**

- i=0: Ω⁻¹=0 and both Hom groups vanish trivially. Dagger disc over K, i=1: the class of T in O(X)/K is nonzero, but for a continuous G_K-equivariant map ψ the map c↦ψ(T⊗c) is a continuous G_K-map C→B_dR, hence zero; density of algebraic tensors then gives ψ=0.

*Needs:* AdicSpacesPartIV F1.9, strict differential quotients; LocallyAnalyticDistributions §0.0, completed tensors and density; the galois-period-hom-vanishing contract and the smooth Galois Hom interface of acyclic-arithmetic-period-hom.

### 5.2 vanishing on the arithmetic torsion kernel

For a small smooth dagger X/K whose base change to C has nonnegative de Rham slopes, set `A^(r,i)`=ker(Hⁱ(FʳRΓ_dR(X_C/B_dR⁺))→Hⁱ_dR(X_C/B_dR⁺)), i≤r. Then `Hom^sm_(G_K)`(`A^(r,i)`,B_st)=`Hom_(G_K)`(`A^(r,i)`,B_dR)=0. The topology and G_K action are the natural ones. The quasi-compact proof extends to the other small cases through the finite-free cohomology and strict Čech presentations used in §9.1.3.

(CN25 Lemma 9.6 and §§9.1.2–9.1.3, pp. 56–57, CN25 line 2772.)

A proof route uses the following steps. Express A as a quotient of the preceding truncated de Rham cohomology. Compute truncated de Rham cohomology by Čech complexes with coefficients B_dR⁺/t^k. Use the Banach/compact-type presentations, density and the differential vanishing argument degree by degree. Pass through the strict quotients and CN25’s smallness reduction.

**Checks.**

- Dagger disc over K at i=r=1: A¹¹=O(X_C)/C is infinite dimensional of height 0 and is not finite BC; it is the image of the differential term Ω⁰/ker d, so both Hom groups vanish by §5.1. For a point, A=0.

*Needs:* §5.1; §1.1, filtered triangle; §1.2, finite free cohomology of the small X_C; the B_dR⁺ complexes and their cohomological topologies from dagger-analytic-complexes, on which the strict Čech presentations with B_dR⁺/t^k coefficients are formed in this section; AdicSpacesPartIV F1.7, dagger affinoid coverings; PadicHodgeTheory §3.7, Galois period-Hom topology.

### 5.3 arithmetic pro-étale-to-de Rham recovery

Let X/K be smooth dagger and assume X_C has de Rham slopes ≥0 (hence is small). For every i≥0, naturally and strictly for the weak Hom topologies, `Hom^sm_(G_K)`(Hⁱ_proét(X_C,Q_p),B_st)≅Hⁱ_HK(X_C)^∨ as (φ,N,G_K)-modules over Fⁿʳ, and `Hom_(G_K)`(Hⁱ_proét(X_C,Q_p),B_dR)≅Hⁱ_dR(X/K)^∨ as filtered K-modules. Filtration on Hom is pointwise image in tʲB_dR⁺; smooth invariants are the colimit over finite extensions. These are contravariant duals; the Hodge filtration is retained only with the arithmetic G_K structure.

(CN25 Theorem 9.3; Remark 9.2; §§9.1.1–9.1.3, pp. 55–57, CN25 line 2735.)

A proof route uses the following steps. Choose r≥i, use bicartesian comparison, and quotient `H^(r,i)` by `A^(r,i)`. Identify that quotient with the bounded V_st^r of the induced acyclic filtered HK module. Kill maps from A by arithmetic torsion vanishing and apply the imported arithmetic acyclic period reconstruction. Undo the Tate twist, check the φ,N,G_K and filtration conventions, and establish strictness using the Hausdorff weak Hom topology and finite-dimensional source of the comparison.

**Checks.**

- X a point over K, i=0: the smooth Hom from Q_p to B_st is the union of the B_st^(G_L), which is Fⁿʳ, and Hom_(G_K)(Q_p,B_dR)=K; these are the duals of H⁰_HK and H⁰_dR.
- P¹ over K, i=2: H²=Q_p(−1); its smooth Hom into B_st is Fⁿʳ·t⁻¹ with φ(t⁻¹)=p⁻¹t⁻¹, dual to φ=p on H²_HK, and its G_K-Hom into B_dR is K·t⁻¹ in filtration degree −1, dual to the Hodge jump 1. A covariant reading would give φ=p and jump 1.
- Dagger disc over K, i=1: H¹_proét(X_C,Q_p)≠0, but both Hom groups vanish, matching H¹_HK=H¹_dR=0.

*Needs:* §§5.1–5.2; §2.7; §0.8; the acyclic-arithmetic-period-hom contract, arithmetic acyclic period reconstruction including its bounded twist; PadicHodgeTheory §§3.4–3.7 and 5.2.

### 5.4 geometric pro-étale-to-period-module recovery

Let X/C be smooth dagger with de Rham slopes ≥0. With 𝐇 the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p), M=Hⁱ_HK(X) and B=Hⁱ_dR(X/B_dR⁺), there are natural B_st- and B_dR-linear isomorphisms Hom_TVS(𝐇,𝐁_st)≅Hom_(Fⁿʳ)(M,B_st) and Hom_TVS(𝐇,𝐁_dR)≅Hom_(B_dR⁺)(B,B_dR). Here Hom_TVS consists of natural transformations between functors on sympathetic algebras valued in LH(C_Q_p), with the boundedness condition of Definition 4.1. It is not the set of arbitrary continuous maps on C-points. These recover extended period modules; no φ,N or Hodge filtration is claimed to be recovered from the geometric functor alone.

(CN25 Theorem 9.8 and §9.2 proof, pp. 57–58, CN25 line 2821.)

A proof route uses the following steps. Use the canonical qBC filtration and the fundamental diagram to identify H/A with bounded V_st^r after twisting. Present the B_dR⁺-Pair A, reasonable or not, densely by finite torsion pieces (CN25 Theorem 9.8 proof, line 2834); their maps to B_dR and B_st vanish, and continuity passes this to A. Apply filtered-period-Hom and undo the Tate twist to obtain both module isomorphisms.

**Checks.**

- Point: Hom_TVS(Q_p,B_st)=B_st=Hom_(Fⁿʳ)(Fⁿʳ,B_st) and Hom_TVS(Q_p,B_dR)=B_dR=Hom_(B_dR⁺)(B_dR⁺,B_dR).
- Dagger disc in degree one: H=O(D)/C is a torsion Pair with no nonzero natural maps to B_st or B_dR, matching M=0 and B=0, although continuous Q_p-linear maps of its C-points to Q_p⊆B_dR exist by Hahn–Banach.

*Needs:* §2.3; §2.7; §§0.8–0.9; the dense finite-torsion presentation in qbc-pairs; VectorBundlesAndIsocrystals VB3, VS Hom vanishing from torsion period modules, for the finite torsion pieces; the VS/TVS comparison in natural-period-hom.

### 5.5 positive crystalline recovery for affinoids

For a smooth dagger affinoid X/C in degree i, put M=Hⁱ_HK(X), B=Hⁱ_dR(X/B_dR⁺) and r=i. Monodromy untwisting identifies X_st^i(M) with X_cris^i(M). The strengthened affinoid comparison target is Hom_TVS(Hⁱ_proét(X,Q_p(i)),B_cris⁺)≅Hom_TVS(X_cris^i(M),B_cris⁺)=M^∨⊗B_cris⁺. After the stated completed unramified scalar extension and duality it recovers φ on M⊗_(Fⁿʳ)F̂ⁿʳ. Also Filⁱ⁺ᵏB=t^kB for k≥0. The equality with positive crystalline coefficients is an exact target of Remark 9.9(ii), subject to the positive-crystalline-hom contract; the weaker sandwich M^∨⊗B_cris⁺⊆Hom_VS(X_cris^i(M),B_cris⁺)⊆M^∨⊗t⁻ⁱB_cris⁺ alone does not prove that equality. The contract asks that every λ∈M∨⊗t⁻ⁱB_cris⁺ pairing X_cris^i(M)(C) into B_cris⁺ lie in M∨⊗B_cris⁺.

The exact equality is a proof target with the positivity criterion of the supplier contract. It cannot be inferred from the two inclusions: for i=1 the candidate t⁻¹ in the outer bound is absent from B_cris⁺. The source's route through the set of λ∈M∨⊗B_cris whose Frobenius iterates φⁿ(λ), n≥0, lie in M∨⊗B_dR⁺ is not used: PadicHodgeTheory §0.4 proves only φ(B′_cris)⊆B_cris⁺⊆B′_cris for B′_cris={x∈B_cris : φⁿ(x)∈B_dR⁺ for all n≥0} (with φ² at p=2), not B′_cris=B_cris⁺.

(CN25 Remarks 5.19 and 5.21, pp. 38–39; Remark 9.9(ii), p. 58, CN25 line 2859.)

A proof route uses the following steps. Apply eigenspace generation and the weaker positive crystalline Hom sandwich. Use the affinoid exact sequence and torsion-Pair Hom vanishing to remove the differential term. By the sandwich every natural map is evaluation of some λ∈M∨⊗t⁻ⁱB_cris⁺, and its values on X_cris^i(M)(C) lie in B_cris⁺; the positive-crystalline-hom criterion then puts λ in M∨⊗B_cris⁺, which is not supplied by the sandwich. Then extend scalars to F̂ⁿʳ and dualize, respecting φ; use the affinoid filtered de Rham complex for the displayed filtration.

**Checks.**

- Point, i=0: Hom(Q_p,B_cris⁺)=B_cris⁺=M∨⊗B_cris⁺ for M=Fⁿʳ, and Fil^kB=t^kB_dR⁺=t^kB for k≥0.
- i=1: t⁻¹ lies in the outer bound t⁻¹B_cris⁺ but not in B_cris⁺, so the sandwich is strict on the right and does not decide the equality.
- The positivity criterion for the trivial line at r=1: X_cris¹=(B_cris⁺)^(φ=p) contains t and an element x with θ(x)=1. The coefficient λ=t⁻¹ sends t to 1∈B_cris⁺ but x to x/t, which is not in B_dR⁺ since θ(x)≠0; so λ violates the hypothesis of the criterion, consistently with λ∉B_cris⁺. At r=0 the trivial line has X_cris⁰=Q_p and the criterion is the tautology λ∈B_cris⁺.

*Needs:* §5.4; §§0.6–0.8, crystalline untwisting and the bounded Hom sandwich; §1.5, affinoid differential quotient; VectorBundlesAndIsocrystals VB3, VS Hom vanishing from torsion period modules, into B_dR⁺⊇B_cris⁺; the positive-crystalline-hom contract.

### 5.6 information and scope of the recovery theorems

For a smooth proper X/C the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p) is the constant finite-dimensional Q_p functor. Its geometric period Hom functors therefore retain its rank and the corresponding free extended period modules, while CN25’s extra φ,N and filtration data require additional structure. The full recovery assertions for arbitrary smooth dagger spaces, including the sheafified direction of Remark 9.9(iii), are research problems, not theorem targets discharged by Theorems 9.3 or 9.8.

For rank d, both geometric period-Hom modules are free of rank d; rank zero gives zero. A one-dimensional constant Q_p functor gives B_st and B_dR. This forgetful calculation is not an impossibility theorem about enriched coefficient sheaves.

(CN25 Remark 9.9(i),(iii), p. 58; Conjectures 1.6, 1.8 and 9.1, pp.5,55, CN25 line 2856.)

A proof route uses the following steps. Specialize geometric recovery to a constant finite Q_p functor and identify its natural period Hom modules with finite free modules. Compare the arithmetic theorem’s G_K input with the geometric theorem’s Topological Vector Space functor input. Record the unrestricted conjectures as open and keep all non-small cases outside the finite-module recovery theorem.

**Checks.**

- A good-reduction elliptic curve and a Tate elliptic curve over C both give free geometric period-Hom modules of rank two in degree one, while their monodromy operators have ranks 0 and 1: the geometric Hom modules alone do not see N.

*Needs:* §§5.3–5.4; CohomologyComparisons §§4.10–4.11, proper finite-dimensional realization.

### Examples

For X a point over K the arithmetic Hom values are Fⁿʳ and K; over C the geometric Hom values are B_st and B_dR. For the dagger disc in degree one, arithmetic continuous Galois Hom of its differential term is zero although O(D)/C is nonzero. For P¹, the degree-two representation Q_p(−1) has dual period line of jump −1 and Frobenius p⁻¹; a rank-one geometric Hom module records the extended module without that arithmetic normalization (CN25 Lemma 9.5, line 2746; Theorems 9.3 and 9.8, lines 2735, 2821).

### Dependencies

Layers 0–3 except the splitting branch; PadicHodgeTheory §§3.4–3.7 and 5.2; natural-period-hom, qbc-pairs and acyclic-arithmetic-period-hom contracts. Only the positive crystalline refinement uses positive-crystalline-hom.

## Downstream consumers

The comparison and reconstruction interfaces supply analytic arithmetic geometry with a single fundamental square and its topology. The arithmetic theorem retains smooth Galois descent, Frobenius, monodromy and the Hodge filtration; the geometric theorem supplies extended period modules through natural TVS Hom. A consumer needing finite HK modules uses the smallness hypothesis; the proper-times-Stein theorem supplies a diagram without granting finite-rank recovery. Sheafified recovery for arbitrary smooth dagger varieties is the research direction in CN25 Remark 9.9(iii), p.58, line 2870.

## Worked examples

For the trivial filtered line, the triple of lattices t⁻¹B_dR⁺, B_dR⁺, tB_dR⁺ has degrees 1, 0, −1. The weakly admissible lattice inside the first is B_dR⁺; no slope-zero sublattice exists inside the last. For the geometric point at twist r=1 the simultaneous changes φ↦p⁻¹φ and L↦tL cancel: the vector t is Frobenius-fixed for the twisted total operator and lies in the shifted lattice, so the bundle is O and the period line is Q_p·t. Shifting only the lattice would give O(−1) (CN25 Remark 5.14 and §7.2.2, lines 1809–1832, 2333–2340).

For a smooth proper geometrically connected curve of genus g over K, the period modules have ranks 1, 2g, 1 in degrees 0, 1, 2. The height identities have the same three values and Aʳⁱ=0 at i=r. For the disjoint union of two projective lines the ranks are instead 2, 0, 2; geometric connectedness is needed for the rank-one endpoints. A Tate elliptic curve has N of rank 1 in degree one, whereas a good-reduction elliptic curve has N=0; both have height 2. Thus height alone does not encode monodromy. For the two-dimensional Tate operator model, exp(uN)(e₁)=e₁+ue₀ and exp(−uN)(e₁+ue₀)=e₁; the nilpotence N²=0 makes these two-term expressions exact (CN25 Theorems 6.4, 6.8 and Proposition 7.10, lines 2000, 2057, 2367).

For the dagger disc at i=r=1, the nonzero class of T in O(D)/C maps to dT under the simplified diagram. It has zero HK image and is precisely part of the curvature-zero Pair. Its height is 0, agreeing with zero de Rham H¹. Replacing filtered-complex cohomology F¹¹ by its image Fil¹¹=0 would erase this class. The example distinguishes the pro-étale group, the filtered group and its image (CN25 Theorem 6.14, line 2098; Corollary 7.9, line 2350).

For the projective line with the infinity section, the functions Σ_(n≥0)πⁿTⁿ converge on a disc of radius greater than 1, and sum to (1−πT)⁻¹. Restriction from the analytic affine line to the closed dagger disc cannot produce this function: at T=π⁻¹ the denominator is 0. Both unfiltered de Rham complexes still have cohomology K in degree 0 and 0 in degree 1. This is the negative control against a filtered-complex equivalence, and the lattice-inclusion argument in Layer 3 supplies the slope conclusion (GK04 Corollary 3.8(a),(c), p.16, line 556; CN25 Proposition 8.3, p.51, line 2538).

## References

- **CN25.** Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*. [Author CN5 manuscript](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), 24 November 2024, 61 pages; [arXiv:2108.12785v4](https://arxiv.org/abs/2108.12785v4). Published in Duke Mathematical Journal 174 (2025), 2203–2301, [DOI](https://doi.org/10.1215/00127094-2024-0074). All page and line locators here refer to the author manuscript, not the journal pagination. Principal locators are §§5.3–5.4, pp.36–39; Proposition 6.1, pp.39–40; Theorem 6.14 and §6.4, pp.43–45; §§7.2–7.3, pp.46–50; §§8–9, pp.50–58; Appendix A, pp.58–60.
- **CN1.** Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, I: The basic comparison theorem*. [arXiv:2104.13448v3](https://arxiv.org/abs/2104.13448v3), 1 November 2023. Only the definition of a naive interior in the proof of Corollary 3.6, p.26, line 1163, is used; pages and lines refer to this preprint.
- **GK04.** Elmar Grosse-Klönne, *De Rham cohomology of rigid spaces*, Mathematische Zeitschrift 247 (2004), 223–240. [arXiv:1408.3330v1](https://arxiv.org/abs/1408.3330v1), 14 August 2014. Proposition 3.7, pp.14–16, line 499, and Corollary 3.8(a),(c), p.16, line 556; pages and lines refer to this preprint.
- **BKV22.** Federico Binda, Hiroki Kato and Alberto Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in toric varieties*. [arXiv:2207.00369v2](https://arxiv.org/abs/2207.00369v2), §4, pp.25–26, especially the tube definition preceding Corollary 4.6, lines 1176–1187. Only the tube definition and its integral-trivialization independence are used here; the motive comparison does not replace the HK comparison contract.
