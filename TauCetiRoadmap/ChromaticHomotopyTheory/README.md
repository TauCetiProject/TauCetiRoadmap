# Roadmap: chromatic homotopy theory

**Summary.** Build the chromatic interfaces from finite p-local spectra and oriented theories to periodic detection, Bousfield–Kuhn functors, telescopic Tate vanishing, finite-local blueshift and commutative-ring height. The applications compare real K-theory, topological modular forms and James-filtered Thom rings at every prime. The library is general in the height, the prime, the coefficient spectrum and the coherent finite-group action wherever these parameters occur. Algebraic K-theory purity and redshift use these interfaces as consumers.

## Scope and ownership

This roadmap owns unstable periodic homotopy and finite nullification, the Bousfield–Kuhn construction, the all-spectra p-inversion convention for finite localization, the acyclicity comparison for homotopy-unital spectral magmas, generalized fiberwise homology, the extension of Morava realization to arbitrary finite height, telescopic Tate vanishing and blueshift, higher semiadditivity of telescopic localizations with the weak-ring finite-Postnikov criterion and the sharp connectivity bound, Hahn’s Dₚ acyclicity and Tate theorems, elliptic spectral affineness, faithful full-level spectral Galois extensions for every positive level and the chromatic Thom-family comparisons.

The following constructions are stated by their named owners and are consumed here by section, including the Checks that compare their conventions with these applications.

- GeneralizedCohomology G2–G3 and G5.1 own spectra, stable smash and mapping objects, spectral limits, localization at integers, connective covers and finite duality. The p-local finite/compact and duality specialization is the exact additional contract below.
- GeneralizedCohomology G4.5 and BordismFormalGroups F1–F3/F5 own orientations, native formal groups, multiplication series and height, MU, Quillen universality, BP and its truncations, k(n), K(n), E(n), regular coefficient cofibers, Landweber realization and algebraic Lubin–Tate deformations. The pointwise geometric-height criterion used in Layer 8 is the spectral locality consequence, rather than a second algebraic height invariant.
- BordismFormalGroups F6.1–F6.4 own homological Bousfield localization, its class order, Morava nilpotence, type, thick classification, periodicity and eventual centrality, positive-height telescopes, including ⟨K(n)⟩≤⟨T(n)⟩ and the choice-independence of ⟨T(n)⟩ consumed in §3.2, p-local finite localization and its kernel, Ravenel’s class identities, Hopkins–Ravenel smashing and chromatic fracture. Layer 4 extends the finite tower to all spectra with S[1/p] at its bottom. Layer 8 compares telescopic localization on chromatically local objects.
- BordismFormalGroups F6.5 owns coherent Borel actions, norms, generic Tate cofibers, lax monoidal and module structures, K(n)-local Tate vanishing and the K(n)-localization formula for p-local spectra. Layer 9 proves the corresponding telescopic and finite-local conclusions and builds the higher π-finite-space norms on the finite-group ones. Generic finite-group norm and action carriers keep that owner.
- GeneralizedCohomology G2.10 owns mapping-path homotopy fibers and their exact sequence for arbitrary based continuous maps. StableHomotopyKTheory §§2.4–2.7 own the boundary identification, pointed-set π₁-action and path-transport comparisons; §3.18 owns space Postnikov sections and their convergent towers; §§7.21–7.27 own filtered-spectrum spectral sequences and convergence comparisons, including strong convergence for exhaustive filtrations bounded below (§7.24). AlgebraicTopology Stages 4–5 supply CW geometry and ordinary twisted Serre theory, and Stage 8 relative homotopy of based pairs, Hurewicz, Whitehead and Eilenberg–Mac Lane representability. HomotopySpheres §§3A–3B own convenient pointed spaces, Freudenthal stabilization for spheres, the word-length filtration of the James construction and the connected James equivalence; the stable James splitting is the contract gap:stable-james-splitting addressed to §3B.
- HomotopySpheres §4B owns the real Bott theorem; TopologicalKTheory T7 owns the Clifford-module coefficient comparison with a²=4b; GeneralizedCohomology G5.4 owns ko, KO, ku, KU, multiplicative Bott inversion and the complexification values c(a)=2u², c(b)=u⁴. Layer 11 proves their positive-height telescopic consequences.
- EllipticCohomology E1–E3 own elliptic moduli and its nodal compactification, elliptic cohomology triples, the topological structure sheaf, tmf, Tmf and TMF, and height-one/two Morava realization and its coherent actions. E4 owns the surviving discriminant class Δ²⁴ and its localization comparison. E6 owns the spectral level covers. Layer 7 extends the realization and action to heights at least three using the supplied obstruction machinery; Layer 12 owns spectral affineness, the resulting chromatic comparisons and the faithful spectral Galois assertions.
- EllipticCohomology E5 owns the units spectrum gl₁(R) of a commutative ring spectrum R, the mapping-space description of Thom orientations with its obstruction fibre sequence, and the E₁ Thom refinement of loop-multiplicative spherical-fibration diagrams with its comparison with GeneralizedCohomology G5.3’s bundle-diagram Thom spectrum. §13.1 consumes gl₁(R) and builds Thom modules of arbitrary R-line local systems on it, comparing with E5’s E₁ refinement at R=S; the String orientation, its cell-attachment and B-side calculations stay in E5.
- ModularCurves §§3D, 4B–4C and 5B own the naive level comparison with the level inverted, the smooth Weierstrass groupoid, the ordered full-level-three torsor and full ordered-basis schemes for N≥3, including their right change-of-basis action. §§7E and 7F own p-divisible groups with the ordinary/supersingular formal heights and the Serre–Tate equivalence. EllipticCohomology E1/E6 supplies the moduli stacks, including the level stacks at N=1,2 and the nodal compactification.
- AInfCohomology §AI.7.2 owns the spectral Tate diagonal X→(X^⊗p)^tC_p with its lax symmetric monoidal structure; §10.1 composes it with an E∞ multiplication to obtain the Tate-valued Frobenius of an E∞ ring.
- RefinedTraceMethods owns the Segal comparison S^tC_p≃S_p^∧ (§2.3), THH of E₁-rings and of small stable ∞-categories with its cyclotomic Frobenius (§§2.6 and 2.10), TC (§2.9), connective and nonconnective K-theory of small stable ∞-categories (§4.9), the cyclotomic trace (§4.11) and the identification of K(1)-localization with p-completed KU-localization (§6.8). §8.3 and §9.5 consume them.

Mathlib already supplies `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.Point`, `FormalGroup.map`, `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ` and `CategoryTheory.ObjectProperty.isLocal`. Tau Ceti already supplies `WeierstrassCurve.formalGroup`. These are the native algebraic carriers; the ordinary precomposition predicate does not itself construct a spectral reflector. No formal-group point calculation is a substitute for a chromatic headline theorem.

**ChromaticHomotopyTheory, Part II.** The extension starts with higher-height telescope separation, after the periodic, finite-local, Tate and ring-height interfaces of Layers 0–13. It uses the purity and redshift results of the downstream GeneralAlgebraicKTheoryPartII KII.5–KII.6. Its complete separation target and the extra supplier contracts are specified here as the ownership boundary; these are inputs and targets of Part II, not of the layers below.

At every prime and every n≥2 there is a T(n)-local spectrum X which is not K(n)-local. More precisely, for every n≥2 and k≥0 use the p-complete associative truncated Brown–Peterson model and coherent Adams ℤ-action of the Part II contract gap:bhls-bp-redshift and set X(p,n,k)=L_(T(n))K(BP⟨n−1⟩^(h pᵏℤ)); prove that X(p,n,k) is not K(n)-local. The model retains its E₁⊗A₂ structure and the specified Adams action. Its cyclotomic non-hyperdescent argument uses GeneralAlgebraicKTheoryPartII KII.5’s purity theorem and high-height cyclotomic trace, the fixed-point trace contract gap:bhls-purity-comparison and the BP-model contract gap:bhls-bp-redshift, in addition to Layer 3’s ring-acyclicity result. This is the precise limit of the L_n-local comparison in §8.2. (bhls, Introduction, Theorem A, pp.2–4; bhls line 98).

*Proof route for Part II.* At n≥2 construct the BHLS T(n)-localized algebraic K-theory witness and the Adams-operation homotopy-fixed-point comparison, and prove the cyclotomic non-hyperdescent separating its T(n) and K(n) localizations. The algebraic K-theory, THH, TC and trace carriers are RefinedTraceMethods §§2.6, 2.9, 2.10, 4.9 and 4.11; the coassembly and cyclotomic-completion construction belongs to this target. Let B be the model of gap:bhls-bp-redshift with h=n−1. Its fp-type n−1 makes U⊗B bounded for a type-n U with v_n self-map v, so a power of v is null on U⊗B and B is T(n)-acyclic; so is B^(h pᵏℤ), the fiber of a self-map of B. For a T(n)-acyclic E₁ ring C, L_(T(n−1)∨T(n))C=L_T(n−1)C, so KII.5’s purity theorem gives L_T(n)K(L_T(n−1)C)≃L_T(n)K(C) for C=B and C=B^(h pᵏℤ). KII.5’s high-height trace gives L_T(n)K(B)≃L_T(n)TC(B) and hence its pᵏℤ-homotopy fixed points; gap:bhls-purity-comparison gives the trace for the (−1)-connective ring B^(h pᵏℤ). For any functor F and coherent G-object A, the comparison F(A^hG)→F(A)^hG comes from applying F to the limit cone A^hG→A. The coassembly maps F(B^(h pᵏℤ))→F(B)^(h pᵏℤ) connect the two rows by naturality; they are not asserted to be equivalences. Use gap:bhls-bp-redshift for the height-(n−1) Lichtenbaum–Quillen property, which with fp-type n−1 gives the telescopic asymptotic constancy of the TC coassembly maps for k≫0, and for T(n)⊗TC(BP⟨n−1⟩)≠0. Prove the cyclotomic completion/coassembly theorem using these inputs, retaining every prime and n≥2 (bhls, Corollary 4.33, pp.51–52, Corollary 6.3 and Theorem 6.25, pp.66–67,73–74; bhls line 2227, line 2893 and line 3194).

**Checks for Part II.**

- At p=2,n=2,k=0, the Adams action fixes π₀BP⟨1⟩=ℤ₂. Since ℤ has cohomological dimension 1, π_−1(BP⟨1⟩^hℤ)=H¹(ℤ;ℤ₂)=ℤ₂. Thus this trace input is not connective. The separation proof also needs T(2)⊗TC(BP⟨1⟩)≠0: if it were 0, a thick-subcategory argument starting from it would detect no nonzero coassembly fiber.

- At height one the two acyclic classes agree; for each p and n≥2 the BHLS witness has L_T(n)X=X and L_K(n)X≠X. For a ring, acyclicity comparison concerns zero localizations and does not identify these two nonzero outputs.

- For a T(n)-acyclic E₁ ring C and n≥2, L_(T(n−1)∨T(n))C=L_T(n−1)C: the ring L_T(n−1)C is L_(n−1)^(p,f)-local, hence T(n)-acyclic because that localization is smashing and kills finite type-n spectra (§4.2), so C→L_T(n−1)C is a T(n−1)∨T(n)-equivalence with local target. For C=Hℤ_p at n=2 both sides are 0, since the bounded spectrum Hℤ_p is T(1)- and T(2)-acyclic, and purity gives L_T(2)K(ℤ_p)=L_T(2)K(0)=0. The K(2)-local Lubin–Tate ring E₂ is not T(2)-acyclic: L_(T(1)∨T(2))E₂=E₂, while π₀L_T(1)E₂ is the p-completion of W(𝔽_(p²))((u₁)), not W(𝔽_(p²))[[u₁]]. The acyclicity hypothesis cannot be dropped.

- The fp-type index of the BP model is h, not h−1. At p=2 and h=1 take ku_2^∧, a form of BP⟨1⟩ with v₁ the Bott class, and U the cofiber of the degree-8 Adams map Σ⁸S/2→S/2, a type-2 complex; this map induces multiplication by v₁⁴ on ku_*(S/2)=𝔽₂[v₁], so π_*(U⊗ku_2^∧)=𝔽₂[v₁]/(v₁⁴) is 𝔽₂ in degrees 0, 2, 4 and 6 and zero elsewhere. For the type-1 complex S/2, π_*(S/2⊗ku_2^∧)=𝔽₂[v₁] is nonzero in every even degree ≥0, so fp-type 0 fails.

The Part II extension uses GeneralAlgebraicKTheoryPartII KII.5’s chromatic purity theorem: for every E₁ ring A and n≥1, the localization A→L_(T(n−1)∨T(n))A induces L_T(n)K(A)≃L_T(n)K(L_(T(n−1)∨T(n))A), with T(0)=S[1/p]. It also uses KII.5’s high-height cyclotomic trace: for every E₁ ring A and n≥2, the maps K(A)←K(τ_≥0A)→TC(τ_≥0A) are T(n)-equivalences. For a connective T(h+1)-acyclic E₁ ring A, h≥1, these two theorems give the connective comparisons L_T(h+1)K(L_T(h)A)≃L_T(h+1)K(A)≃L_T(h+1)TC(A) of bhls Theorem 6.1 (bhls line 2876), because L_(T(h)∨T(h+1))A=L_T(h)A for such A; purity applies equally to the nonconnective fixed-point ring. The higher-height separation target requires in addition the following contracts from KII.5 (the trace for fixed-point rings) and KII.6 (redshift). The BP-specific assertion is stronger than the general E∞-ring height bound; it requires the indicated associative model.

Additional contract for the Part II extension from GeneralAlgebraicKTheoryPartII (gap:bhls-purity-comparison): For every prime p, h≥1 and connective E₁ ring A with coherent ℤ-action, prove that the cyclotomic trace K(A^(hℤ))→TC(A^(hℤ)) of the possibly (−1)-connective homotopy fixed-point ring becomes an equivalence after L_T(h+1), naturally in A, using Levy’s theorem that every truncating invariant inverts the map of ℤ-homotopy fixed points induced by a 1-connective ℤ-equivariant map of connective E₁ rings; applied to the restricted actions it covers A^(h pᵏℤ) for every k≥0. (bhls, Theorem 6.2 and Corollary 6.3 with proof, pp.66–67; bhls line 2886 and line 2906).

Additional contract for the Part II extension from GeneralAlgebraicKTheoryPartII (gap:bhls-bp-redshift): For every prime p and h≥1, provide a p-complete associative BP⟨h⟩ model of fp-type h (for every finite p-local type-(h+1) spectrum U, U⊗BP⟨h⟩ has finitely many nonzero homotopy groups, each finite) with the E₁⊗A₂ structure and locally unipotent coherent Adams ℤ-action of bhls Theorem 5.4, its height-h Lichtenbaum–Quillen property (THH is bounded below and V⊗THH is bounded in the cyclotomic t-structure for every finite p-local type-(h+2) spectrum V), and T(h+1)⊗TC(BP⟨h⟩)≠0, with no restriction on p or h. (bhls, Definitions 4.1 and 4.2, p.37; Theorem 5.4, pp.53–54, and Theorem 6.25 proof, pp.73–74; bhls line 1596, line 2300 and line 3217; hahn-wilson, Theorem B and its following corollary, p.3, and Corollary 5.0.2 with proof, p.40; hahn-wilson line 93 and line 1422).

## Conventions

Fix a prime p. The auxiliary letter q also denotes a prime; impose q≠p wherever displayed, while the relative-fiber Checks explicitly allow q=p. Work in explicitly fixed nested universes: spaces and diagram index sets are small in the first universe, spectra and their presentable categories in the next; finite spectra are essentially small. Include comparison along universe enlargement. Tensor products, mapping objects, fibers, cofibers and (co)limits are derived. S is the integral sphere, 0 the zero spectrum and Σ∞ the reduced suspension spectrum of a pointed space; a subscript + adds a disjoint basepoint. Homotopy and homology have integer homological grading, π_kΣX=π_(k−1)X, while Eʳ(X)=[Σ∞X,ΣʳE]. The symmetry on degrees a,b has sign (−1)^(ab). In the cofiber triangle X→Y→C→ΣX the boundary lowers homological degree by one.

Finite p-local means compact in Sp_(p), including retracts of finite p-local sphere-cell spectra. A p-local dual has tensor–Hom comparison only against a p-local target. Set K(0)=Hℚ and K(∞)=H𝔽_p. For n≥1 use the supplied type-n self-map telescope T(n), retaining its chosen source when discussing periodic groups; only its Bousfield class is choice independent. Set T(0)=S[1/p] on all spectra. Write L_n=L_(K(0)∨⋯∨K(n)), L_n^f=L_(Hℚ∨T(1)∨⋯∨T(n)) and L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). Their bottom terms differ on all spectra. The Bousfield order ⟨E⟩≤⟨F⟩ means that every F-acyclic spectrum is E-acyclic.

An m-connective space has π_i=0 for i<m, including the appropriate component condition, so it is (m−1)-connected. A map is m-connective when all its homotopy fibers are m-connective; it induces isomorphisms in degrees below m and a surjection in degree m. For r≥1, X⟨r⟩=fib(X→τ_≤(r−1)X). In particular the fiber of a simply connected space’s degree-two Postnikov section is X⟨3⟩. Space Postnikov sections are taken componentwise and retain fundamental-group transport; only the trivial-action stages are treated as principal fibrations.

Use geometric formal-group height only at characteristic-p field points, with height∞ for the zero p-series and height 0 when p is invertible. A geometric height bound is uniform over all points. It is distinct from the ring height of Layer 10. Graded p-typical coefficients use v₀=p and |v_i|=2(pⁱ−1); fix Hazewinkel generators and the supplied coordinate conversions. For Morava E-theory write π_*E=π₀E[u,u⁻¹] with |u|=−2 after choosing a trivialization (behrens, §1.6, p.28; behrens line 1024). EllipticCohomology E2 writes the height-one and height-two periodic coefficients with a generator of degree +2; that generator is u⁻¹ here, and ψ_(−1) at height one sends both u and u⁻¹ to their negatives. For elliptic sheaves π_(2r)Otop=ωʳ; weight 12 for Δ therefore gives spectral degree 24, and Δ²⁴ has degree 576. Even periodicity on a chart includes a degree-two unit after trivializing its line and does not assert even global homotopy.

A finite-group action is a coherent functor from BG, not merely an action on homotopy groups. Tate always means the cofiber of the normalized Borel norm. A localized Tate conclusion names the localization explicitly. p-complete Thom spectra use the p-complete symmetric monoidal category: its tensor and colimits are the completions of ambient tensor and colimits.

**Checks.**

- ΣS has π₁=ℤ; swapping two degree-one sphere factors acts by −1. For S→S→0, the cofiber of the identity is 0, and the cofiber of 0→S is S.
- With q≠p, S[1/p]∧S/q=S/q while Hℚ∧S/q=0. At p=2,q=3, multiplication by 3 on π₀(S/2)=ℤ/2 is the identity and (ℤ/3)[1/2]=ℤ/3. The integer 4 is excluded: multiplication by 4 on ℤ/2 is zero and (ℤ/4)[1/2]=0. With X=S_(p), both bottom finite-local conventions give Hℚ.
- K(A,2)⟨3⟩=* and τ_≤2K(A,2)=K(A,2); using cover index 2 would retain π₂=A.
- For the native multiplicative coordinate, [2](X)=2X+X² and [3](X)=3X+3X²+X³, reducing to X² and X³ in the respective characteristics. This pins the plus sign in X+Y+XY.
- At height 1 and odd p, ψ_(−1)(u)=−u with ψ_(−1)²(u)=u; its action on π₀ is the identity. For elliptic sheaves, Δ²⁴ has weight 288 and degree 576.

## Exact supplier contracts

### From Mathlib

Use `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.map`, `FormalGroup.Point`, `FormalGroup.𝔾ₐ` and `FormalGroup.𝔾ₘ` from `Mathlib/RingTheory/FormalGroup/Basic.lean`. The formal law is a two-variable power series with the unit and associativity laws; commutativity is a separate class. Its point carrier imposes the actual substitution condition on a multivariable series, rather than representing every element of every topological algebra. Use `CategoryTheory.ObjectProperty.isLocal` from `Mathlib/CategoryTheory/Localization/Bousfield.lean` only for the ordinary-category comparison: it says that precomposition with a morphism is bijective into each object of a specified property. Spectral locality uses derived mapping spaces and every shift.

Use `IsLocalization.flat` from `Mathlib/RingTheory/Flat/Localization.lean` and `Module.Flat.lTensor_exact` from `Mathlib/RingTheory/Flat/Basic.lean` for exact tensoring of abelian homotopy-group sequences with ℤ[1/p]. The former applies to any commutative-ring localization; the latter preserves exactness for linear maps of modules over a commutative ring.

### From Tau Ceti

Use `WeierstrassCurve.formalGroup` from `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`. Its carrier is the native Mathlib formal law obtained from the Weierstrass addition series by the specified two-variable reindexing. The coordinate convention is transported through the elliptic and oriented comparisons; no new elliptic formal law is introduced.

### From TauCetiRoadmap.GeneralizedCohomology

Consume G2’s actual symmetric spectral model, derived monoidal and module categories, commutative rings and algebra localization; G2.10’s mapping-path homotopy fibers and their arbitrary-map exact sequence, including the pointed-set end; G3.4/G3.7/G3.9’s homotopy-colimit, compact-object and integer-localization comparisons, including G3.7’s finite-CW suspension-spectrum mapping formula, which represents a stable map of finite complexes after finitely many suspensions; G3.8’s multiplicative connective covers and spectral Postnikov sections; G4.5’s real, complex and quaternionic orientation data; G5.1’s finite duality and G5.4’s real and complex Bott spectra. In particular retain the unit maps of Bott inversion and connective covers, not just their coefficient groups.

What GeneralizedCohomology must provide (gap:p-local-finite-duality): For every prime p, identify compact p-local spectra with retracts of finite p-local cell spectra, present every p-local spectrum as their filtered colimit, and prove p-local Spanier–Whitehead duality with p-local targets.

### From TauCetiRoadmap.BordismFormalGroups

Consume F1’s multiplication series, morphisms and geometric height, F2’s Quillen comparison and orientation-coordinate convention, F3’s actual BP-module cofibers and their associative-product qualifications, its Adams splitting ku_(p)≃∏_(i=0)^(p−2)Σ^(2i)BP⟨1⟩ at odd p and ku_(2)≃BP⟨1⟩ with the Bott cyclic action between the factors, and F5’s invariant ideals and marked algebraic deformations. F6.1 supplies L_E with its mapping-space universal property, exactness, unit and class comparisons. F6.2–F6.3 supply all-prime nilpotence including the H𝔽_p endpoint, type, thick classification, periodicity, central powers, positive-height telescopes with ⟨K(n)⟩≤⟨T(n)⟩ and choice-independent Bousfield class, and the p-local compactly generated finite quotient with its smashing property and finite-source telescope comparison, used on the associative endomorphism ring in §3.3. F6.3–F6.4 supply the Ravenel class identities, including ⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩, and L_n smashing, including the pro-constancy content of the Adams tower. F6.5 supplies coherent actions, generic transfer/norm and Tate/module naturality, general marked straightening and Kan extensions, the E(n)-locality of Landweber-exact theories whose coefficients vanish modulo I_(n+1), and the formula L_(K(n))X≃holim_i(L_nX∧M_i) for p-local X over F6.3’s cofinal generalized Moore tower M_i. The ring-acyclicity and telescopic Tate theorems below use these generic constructions.

Apply F6.5’s pointwise comma-category Kan-extension formula and composition theorem to a map f:X→Y of spaces and a spectrum-valued local system D: its left Kan extension at y is the colimit on fib_y(f), and taking the colimit over Y gives colim_XD. The slice is the homotopy fiber because X and Y are groupoids; all comparisons retain their naturality.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Consume E0.4–E0.5’s stable-category and space-indexed colimit comparison and E5’s stable monoidal enhancements. The spectral elliptic module category has the following additional exact contract, beyond ordinary derived modules on a ringed site.

What EnhancedDerivedSheaves must provide (gap:spectral-ringed-sites): For an algebraic stack with an étale sheaf of E∞ rings, construct quasicoherent spectral modules with affine-chart base change, étale descent, tensoring by spectra and the global-sections adjunction.

### From TauCetiRoadmap.StableHomotopyKTheory

Consume §2.4’s connecting map δ:π_(n+1)B→π_n hofib(f), §2.5’s identification of that connecting map with the boundary of GeneralizedCohomology G2.10’s arbitrary-map homotopy-fiber exact sequence, §2.6’s π₁(B)-action on π₀ of the fiber and §2.7’s transport of homotopy fibers along paths in the base, with its compatibility with δ; none of these needs an NDR hypothesis on a strict fiber inclusion. Consume §3.18’s space Postnikov sections and compatible convergent towers, with the twisted obstruction data of §3.21 for componentwise use; §§7.21–7.27’s coherent filtered spectra, exact couples, homological spectral sequences and their finite-filtration, bounded-below and derived-limit convergence criteria. By §7.24 the homological spectral sequence of an exhaustive filtration that vanishes in sufficiently negative filtration converges strongly, with no boundedness hypothesis on the coefficient spectrum; the lim¹ conditions of §7.26 concern complete towers and cohomological indexing.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stages 4–5’s based Hausdorff CW geometry, cofibrations, cellular and twisted ordinary homology, bundles and fibration comparisons, and Stage 8’s relative homotopy groups and exact sequence of based NDR pairs, Hurewicz, Whitehead and ordinary Eilenberg–Mac Lane representability, with their pair and connectivity hypotheses. Use GeneralizedCohomology G2.10 for the arbitrary-map homotopy-fiber sequence and StableHomotopyKTheory §§2.4–2.7 for its boundary and transport comparisons. Generalized Serre coefficients are constructed in Layer 6, with monodromy retained.

### From TauCetiRoadmap.HomotopySpheres

Consume §3A’s convenient pointed suspension–loop adjunction, Freudenthal bounds for spheres, §3B’s word filtration J_rW, its quotients J_rW/J_(r−1)W≃W^∧r and its connected James equivalence, and §4B’s real Bott theorem. The comparison J∞W≃ΩΣW requires connected W. §3B does not state the stable splitting; it is the following contract, whose reduced wedge begins at r=1.

What HomotopySpheres must provide (gap:stable-james-splitting): For every path-connected pointed CW complex W, construct a natural equivalence Σ∞ΩΣW≃⋁_(r≥1)Σ∞W^∧r compatible with the word-length filtration J_rW, whose r-th filtration quotient is W^∧r.

### From TauCetiRoadmap.TopologicalKTheory

Consume T7’s Clifford-module coefficient comparison, with α²=4β, complexification α↦2b² and β↦b⁴; T7 and GeneralizedCohomology G5.4 write α, β and the complex Bott class b as a, b and u, in cohomological degrees −4, −8 and −2, so these are their relations a²=4b, c(a)=2u² and c(b)=u⁴. The real Bott theorem itself is HomotopySpheres §4B, and G5.4 supplies the corresponding coherent spectrum models.

### From TauCetiRoadmap.EllipticCohomology

Consume E1’s stable one-pointed genus-one compactification and Hodge line; E2’s height-one/two marked Morava realizations, obstruction machinery and coherent automorphism actions; E3’s Otop sheaf, elliptic formal-group comparison and global spectra tmf→Tmf→TMF; E4’s actual surviving δ=Δ²⁴∈π₅₇₆Tmf with TMF≃Tmf[δ⁻¹]; E5’s units spectrum gl₁(R) of a commutative ring spectrum R in GeneralizedCohomology G2’s model, with Ω∞gl₁(R) the union of unit components of Ω∞R, its Thom-orientation mapping-space description, and its E₁ Thom refinement of loop-multiplicative spherical-fibration diagrams with the comparison to G5.3; E6’s Γ(N) level stacks, sheaf pullbacks and deck-group descent over ℤ[1/N] for every N≥1. Use their smooth restrictions to define TMF(N), retaining stacks at N=1,2; scheme representability is required only at N≥3. Layer 7 supplies the higher-height extension of E2. The affine chart objects used in Layer 12 retain their formal-group identification, including nodal height 1, and their integral treatment at 2 and 3.

### From TauCetiRoadmap.ModularCurves

Consume §3D’s naive–Drinfeld comparison where N is invertible, §4B’s smooth Weierstrass presentation and effective descent, §4C’s full ordered level-three torsor over ℤ[1/3], and §5B’s full ordered-basis schemes for N≥3, right row-vector GL₂(ℤ/Nℤ)-action and Weil-pairing determinant law. The small-level stacks come from EllipticCohomology E1/E6, not §5B’s scheme assertion. Consume §7E’s p-divisible groups, connected p-divisible comparison and ordinary/supersingular formal heights, and §7F’s Serre–Tate equivalence and universal deformation of the supersingular p-divisible group. No primitive N-th root is fixed in the full-level problem; for N=3 at 2 the deck group is GL₂(𝔽₃), of order 48.

### From TauCetiRoadmap.AInfCohomology

Consume §AI.7.2’s spectral Tate diagonal: for each prime p, the natural lax symmetric monoidal transformation X→(X^⊗p)^tC_p on spectra, with C_p permuting the tensor factors, whose value at the sphere is S→S^hC_p→S^tC_p. For an E∞ ring A it is a map of E∞ rings, and composing with the Tate construction of the C_p-equivariant multiplication A^⊗p→A, with trivial action on the target, gives the Tate-valued Frobenius A→A^tC_p used in §10.1.

### From TauCetiRoadmap.RefinedTraceMethods

Consume §2.3’s Segal comparison, identifying the trivial-action C_p Tate spectrum of S with S_p^∧; §2.6’s THH of E₁-rings with its circle action and cyclotomic Frobenius; §2.9’s TC; §2.10’s THH of small stable ∞-categories with THH(Perf(A))≃THH(A); §4.9’s connective and nonconnective K-theory of small stable ∞-categories, applied to Perf(A), the compact objects of the module category of an associative ring spectrum A (GeneralizedCohomology G2; EnhancedDerivedSheaves E5:presentability.1); §4.11’s natural cyclotomic trace K(A)→TC(A); and §6.8’s formula L_(K(1))X≃(L_(KU)X)_p^∧. The Segal and height-one localization comparisons are used in §9.5.

## How to read the build

Layers 0–2 fix the supplied finite, oriented and nilpotence interfaces and their distinguishing examples. Layer 3 develops periodic groups and ring acyclicity; Layer 4 extends finite localization to the all-spectra convention. Layer 5 constructs Bousfield–Kuhn functors and Layer 6 applies them to connective spaces and generalized homology. Layer 7 extends marked Morava realization to every finite height. Layer 8 proves chromatic comparisons and their exact range, Layer 9 telescopic Tate vanishing, blueshift, higher semiadditivity and the sharp connectivity bound m=n+1 for Layer 6, and Layer 10 the commutative-ring height results. Layers 11–13 give the real, elliptic and Thom-family applications. Each Needs line lists statement carriers and proof-route inputs separately enough that a different proof can use the same statement. `README.md` is the roadmap; `Suggested.lean` contains only headline target signatures that can be expressed on the pinned APIs.

## Layer 0: Finite spectra and homological localization

The finite category, p-local dual and localization unit enter through the exact supplier contracts. The following examples pin their use in every later layer.

### Examples

For finite p-local spectra, the p-local sphere has π₀=ℤ_(p) and is compact in Sp_(p); S/p has π₀=𝔽_p and q acts invertibly for q≠p; the identity of ⋁_(j≥0)S_(p) cannot factor through a finite subwedge. (hs, Preliminaries, p.9; hs line 359; Theorem 7, p.3; hs line 129).

**Checks.**

- S_(p) is finite p-local, even though its underlying integral spectrum need not be compact.

- S/p lies in FinSp_(p) and multiplication by any prime q different from p is invertible.

- An infinite wedge of nonzero copies of S_(p) is not compact in Sp_(p).

For Spanier–Whitehead duality, D(S/p)=Σ⁻¹S/p and D(S_(p))=S_(p). With V=S_(p), X=Hℤ, the two integral π₀ values are 0 and ℤ_(p), respectively. (hs, §1.4, p.14; hs line 548; proof of Theorem 7 in §2.2, p.19; hs line 664).

**Checks.**

- D(S/p)≃Σ^(-1)S/p.

- D(S_(p))≃S_(p).

- The p-locality of X matters: for V=S_(p) and X=Hℤ, π₀F(V,Hℤ)=Hom(ℤ_(p),ℤ)=0, whereas π₀(D V⊗Hℤ)=ℤ_(p).

For homological Bousfield localization, L_(zero spectrum)S=0, L_SS=S and L_HℚS=Hℚ. For q≠p, Hℚ∧S/q=0 but S[1/p]∧S/q=S/q≠0. (lmmt, Definition 2.5 and Lemma 2.8, p.8; lmmt line 322 and line 344).

**Checks.**

- L_(zero spectrum) X≃0, whereas L_S X≃X.

- L_Hℚ S≃Hℚ and S/p is Hℚ-acyclic.

- For q different from p, S[1/p]⊗S/q is nonzero although Hℚ⊗S/q is zero.

### Dependencies

GeneralizedCohomology G2–G3 and G5.1; gap:p-local-finite-duality; BordismFormalGroups F6.1; AlgebraicTopology Stage 4.

## Layer 1: Oriented coefficient spectra and height

The oriented theories and their native formal-law comparisons enter through the exact supplier contracts. Keep completed projective-space cohomology and the specified p-typical generators throughout.

### Examples

For complex orientations, for Hℤ, F(X,Y)=X+Y; for the degree-zero KU coordinate [L]−1, F=X+Y+XY. At p=2 its 2-series is 2X+X², reducing to X², so replacing this coordinate by its negative changes the displayed cross term. (behrens, Definitions 1.2.1, 1.2.6, Proposition 1.2.10, pp.4–6; behrens line 132 and line 220).

**Checks.**

- Hℤ with its standard orientation gives the additive law.

- KU with the degree-zero coordinate [L]−1 gives X+Y+XY.

- Changing coordinate does not change the geometric height; a random power series with nonunit linear term is not an orientation coordinate.

For geometric height of an orientation, over 𝔽₂, [2]_add=0 and [2]_mult=X²; over 𝔽₃, [3]_mult=X³. Ordinary and supersingular elliptic formal heights are 1 and 2; a square-zero coefficient does not replace a field in the height definition. (behrens, §1.5, p.21; behrens line 766; §1.6, pp.27–28; behrens line 1007; goerss, §3.3, pp.238–239; goerss line 670).

**Checks.**

- Over 𝔽_p, the additive law has infinite height since [p]=0.

- Over 𝔽_p, the multiplicative law has [p](X)=X^p and height one.

- An ordinary elliptic formal group has height one and a supersingular elliptic formal group has height two; neither height is assigned to an arbitrary law merely because it has dimension one.

For complex cobordism and Brown–Peterson theory, v₀=p has degree 0; |v₁|=2 at p=2 and 4 at p=3. At p=3, π₂BP=0 and π₂MU_(3)=ℤ_(3). (ravenel, §2, p.360; ravenel line 379; behrens, §1.6, p.24; behrens line 876).

**Checks.**

- The p-typical v₀ convention is p, of degree zero.

- |v₁|=2p−2, including degree two at p=2.

- At p=3, π₂BP=0 whereas π₂MU_(3)=ℤ_(3); the p-typical retract is not all of MU_(3).

For Morava K-theory and Johnson–Wilson spectra, K(0)_0=ℚ and K(0)_2=0; K(1) at 2 has 𝔽₂ in every even degree and zero in odd degrees; H𝔽₂ has only degree 0 coefficients. (ravenel, §2, p.360 and Theorem 2.1, pp.361–363; ravenel line 386 and line 401).

**Checks.**

- K(0) has ℚ in degree zero and no other homotopy groups.

- For n≥1, K(n)_* is a graded field with a nonzero class precisely in degrees divisible by 2(p^n−1).

- K(∞)=H𝔽_p is distinct from every periodic K(n).

For connective periodic cofiber sequences, at p=2,n=1, the degree 2 v₁ quotient of BP⟨1⟩ has π₀=ℤ_(2), while that of k(1) has π₀=𝔽₂. The p-cofiber of Hℤ_(p) has π₀=𝔽_p. K(0)∧K(1)=0. (ravenel, Theorem 2.1(e),(f),(h),(i) and proof, pp.361–363; ravenel line 401).

**Checks.**

- At n=1 the quotient of BP⟨1⟩ by v₁ is Hℤ_(p), whereas the quotient of k(1) is H𝔽_p.

- At n=0 the relevant self-map is p, with degree zero.

### Dependencies

GeneralizedCohomology G4.5/G5.4; BordismFormalGroups F1–F3/F5; ModularCurves §7E.

## Layer 2: Nilpotence, type and periodicity

The supplied nilpotence, type and periodicity interfaces apply at every prime and every finite type. The mod-p endpoint is retained in nilpotence on arbitrary targets.

### Examples

For chromatic type, type(S_(p))=0, type(S/p)=1 and type(0)=∞; max(0,1)=1 gives type(S_(p)∧S/p)=1, whereas max(1,∞)=∞ gives type((S/p)∧0)=∞. (hs, Theorem 7 and nested supports, p.3; Lemma 2.1, p.15; hs line 129).

**Checks.**

- S_(p) has type zero.

- S/p has type one.

- The zero spectrum is in every C_n and must not be assigned any finite exact type.

For the nilpotence theorem, for R=H𝔽_p, K(i)∧R=0 at every finite i but H𝔽_p∧R≠0; the unit is not nilpotent. For R=0 the unit is zero and its first power is zero. (hs, Theorem 3, pp.2–3; hs line 89; its reduction in §2.1, pp.15–17; hs line 582; lmmt, Remark 2.4, p.8; lmmt line 317).

**Checks.**

- The unit of a nonzero ring spectrum cannot be nilpotent.

For the thick subcategory theorem, thick(S_(p))=C₀, thick(S/p)=C₁ and thick(0)={0}. Hℚ∧S_(p)=Hℚ≠0, while Hℚ∧S/p=0; hence C₁≠C₀. (hs, Theorem 7, p.3; proof in §2.2, pp.17–19; hs line 129).

**Checks.**

- A type-one object does not thickly generate the p-local sphere.

- C_n strictly contains C_(n+1) for every finite n.

For periodic self-maps, p acts as 0 on K(1)_*(S/p), so it is not invertible there. A degree-d v-map has its a-th power in degree ad for a≥1. At height 0, π₀S[1/p]=ℤ[1/p], not ℚ. (lmmt, §2.1, p.6; lmmt line 239).

**Checks.**

- Multiplication by p on S/p is not a v₁ self-map since it is zero on K(1)-homology.

- A positive power of a v_n self-map is again a v_n self-map, with degree multiplied by the exponent.

- For the height-zero sphere, inverting the degree-zero p map gives S[1/p], not its rationalization on all spectra.

For periodicity and asymptotic centrality, for f=id and identical v-maps choose powers a=b=1; replacing v by v² is matched by (a,b)=(2,1), with degree 2d on both sides. A sign −1 in graded interchange has even power +1. (hs, Theorems 9 and 11, pp.4–6; hs line 152 and line 166; Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21; hs line 790; lmmt, Lemma 2.2(vii), p.7; lmmt line 265).

**Checks.**

- A stable map between two type-n complexes becomes compatible after powers; the original maps need not commute.

### Dependencies

BordismFormalGroups F6.2–F6.3; GeneralizedCohomology G5.1; Layers 0–1’s supplied interfaces.

## Layer 3: Telescopes and periodic homotopy

### 3.1 Periodic homotopy groups

For n≥1 and a fixed unstable representative v:Σ^dV→V, define v_n⁻¹π_k(X;V) as colim_r π_(k+rd)Map_*(V,X) under precomposition with v, taking a tail where k+rd≥2 for spaces. For spectra use the stable mapping spectrum and integer grading. A v_n-periodic equivalence induces isomorphisms in every degree. At height zero, for spectra and simple spaces use π_*(X)[1/p]; it is a separate convention. For a 2-connective map f:X→Y with arbitrary endpoints, define the relative height-zero condition by requiring π_k(X,x)⊗ℤ[1/p]→π_k(Y,f(x))⊗ℤ[1/p] to be an isomorphism for every x and k≥2. Connectivity already supplies bijectivity on components and isomorphisms on π₁. By the fiber exact sequence and flatness of ℤ[1/p], this condition is equivalent to π_k(fib_y(f))⊗ℤ[1/p]=0 for every y and k≥2; no abelianization or p-inversion of the endpoints’ π₁ is used. (lmmt, Definition 2.1 and Lemma 2.2(i),(ii),(viii), pp.6–7; lmmt line 248; Proposition 2.11(ii) and proof, pp.9–10; lmmt line 386 and line 398).

The construction has the following API.

- A pointed map induces maps on every periodic homotopy group, preserving identity and composition.

- The groups for a spectrum X and for Ω∞X agree at positive height.

- The transition induced by v gives an isomorphism from degree k to degree k+d in the colimit, with the corresponding source suspension identification.

- A v_n-periodic equivalence is exactly an isomorphism on all displayed colimits.

- For a 2-connective map, the relative height-zero condition is equivalent to p-inverted higher-homotopy vanishing of every fiber, naturally under basepoint transport. Tensor the abelian exact segments π_(k+1)X→π_(k+1)Y→π_kF→π_kX→π_kY for k≥2; the k=2 converse uses π₁F=0.

*Proof route.* Precomposition increases mapping-space homotopy degree by d; the positive degree makes a cofinal abelian tail available. Compare unstable mapping into Ω∞X with the mapping spectrum out of Σ∞V through adjunction. Keep dependence on V in the groups; only the equivalence condition is independent after the telescope comparison.

**Checks.**

- For the finite Moore complex S/p and any supplied stable v₁ power of degree d>0, G3.7 represents that class by Σ^(d+k)S/p→Σ^kS/p for some finite k. At odd p one can take d=2p−2 for the Adams map; at p=2 use a supplied periodic power. The sphere-only Freudenthal bound has no input for S/p.

- A bounded Postnikov spectrum has zero positive-height periodic groups.

- The p-inverted groups of S/q with q≠p can be nonzero at height zero.

- For X=* each colimit group is 0. For Hℤ in degree k, the stable mapping groups from Σ^(k+rd)V are eventually 0. At height 0, (ℤ/q)[1/p]=ℤ/q when q≠p.

- The identity on BS₃ satisfies the relative condition: for k≥2 it gives 0→0, although π₁=S₃ is nonabelian. For BS₃×K(ℤ/q,2)→BS₃ with q prime, the fiber is 2-connective and its p-inverted π₂ is 0 if q=p, and ℤ/q if q≠p. Thus only q=p satisfies the condition.

*Needs:* GeneralizedCohomology G2 (mapping spectra and suspension–loop adjunction); HomotopySpheres §3A (convenient pointed mapping spaces and suspension–loop adjunction); GeneralizedCohomology G3.7 (finite-CW suspension-spectrum mapping formula and unstable representatives after finitely many suspensions); BordismFormalGroups F6.3 (v_n maps and telescope classes); GeneralizedCohomology G2.10 (homotopy-fiber exact sequence); StableHomotopyKTheory §§2.4–2.7 (boundary identification and basepoint transport); Mathlib `IsLocalization.flat` and `Module.Flat.lTensor_exact` (flat localization and exact tensor).

### 3.2 Telescope acyclicity criteria

For n≥1: (a) X and Ω∞X have the same v_n-periodic groups; (b) any integer connective cover of a spectrum, and any finite connected cover of a space, is a v_n-periodic equivalence; (c) K(i)⊗T(n)=0 for i≠n, including i=0,∞; (d) S/p-acyclicity implies T(n)-acyclicity; (e) X→X_p^∧ is a T(n)-equivalence, for arbitrary spectra with the imported derived p-completion; (f) X is T(n)-acyclic exactly when all its v_n-periodic groups vanish. The inequality ⟨K(n)⟩≤⟨T(n)⟩ and the choice-independence of ⟨T(n)⟩ are BordismFormalGroups F6.3 and are used here as stated there. At n=0 use the separate p-inversion convention of Layer 4. (lmmt, Lemma 2.2(i)–(viii) and proof, pp.6–7; lmmt line 257).

*Proof route.* Use positive-degree suspension tails for cover invariance. Apply graded-field Künneth to the telescope; use finite p-power annihilation for the S/p comparison and the S/p-equivalence of derived completion. Dualize the finite source to identify π_*(T(n)⊗X) with the v_n-periodic groups of X for the dual complex, and use the choice-independence of ⟨T(n)⟩ to pass between sources. This identifies acyclicity, rather than an equivalence T(n)≃K(n).

**Checks.**

- For X=Hℤ the groups [Σ^(k+rd)V,Hℤ] vanish for large r because V is finite, so (f) gives T(n)⊗Hℤ=0; for X=V itself the class of the identity survives in the colimit because v is not nilpotent, so T(n)⊗V≠0.

- At positive n, T(n)∧Hℚ=0 and T(n)∧H𝔽_p=0; K(n)∧T(n)≠0. The completion S→S_p^∧ has height 0 π₀ map ℤ[1/p]→ℚ_p, which is not an isomorphism.

*Needs:* §3.1 (periodic mapping groups); GeneralizedCohomology G5.1 (finite duality) and G3.9 (derived p-completion); BordismFormalGroups F6.3 (central powers, source independence and finite p-power annihilation).

### 3.3 Ring-spectrum acyclicity comparison

For n≥1 let R be a spectrum with a unit η:S→R and multiplication μ:R⊗R→R such that μ∘(η⊗id_R):S⊗R→R and μ∘(id_R⊗η):R⊗S→R are the unit identifications in the homotopy category. Then T(n)⊗R=0 if and only if K(n)⊗R=0. Associativity and commutativity are not required; associative unital ring spectra are an application. No such comparison is asserted for an arbitrary spectrum or for T(0) versus K(0). (lmmt, Lemma 2.3, p.7; lmmt line 301; Remark 2.4, p.8; lmmt line 317).

*Proof route.* One direction is telescope detection. For the other put W=D V⊗V, the associative endomorphism ring of a finite type-n V. The smashing finite localization Q_n=L_n^fW=(L_n^fS_(p))⊗W is an E₁ ring. BordismFormalGroups F6.3’s finite-source comparison identifies its underlying spectrum with a v_n telescope on W, so ⟨Q_n⟩=⟨T(n)⟩. Tensor Q_n’s multiplication and unit with those of R; the tensor is a unital magma. All Morava theories, including H𝔽_p, kill this tensor if K(n) kills R. Smash nilpotence applied to its unit S→Q_n⊗R makes an iterated tensor power of the unit zero. Composing with any fixed iterated multiplication gives the unit again, so it is zero; either unit identity then makes the identity of the object zero. This argument needs no associativity of R.

**Checks.**

- For V=U∨U with nonzero finite type-n U, End(V) has e₁₂e₂₁=e₁₁ and e₂₁e₁₂=e₂₂, with distinct idempotents. Thus it is not commutative. Tensoring with the commutative idempotent algebra L_n^fS_(p) preserves its associative multiplication, while F6.3 gives a telescope of class ⟨T(n)⟩.

- Let A have rational basis 1,a,b, two-sided unit 1, and products a²=b, ab=1, ba=b²=0. Then (a²)a=0 while a(a²)=1, so its Eilenberg–Mac Lane spectrum has the required unital multiplication without an associative one inducing these products. For every n≥1, T(n)⊗HA=K(n)⊗HA=0 because HA is rational. The zero multiplication on a nonzero rational spectrum fails the unit identities.

- At height zero the ring H𝔽_q, q≠p, separates S[1/p] from Hℚ.

- R=0 gives both smash products 0; R=K(n) gives both nonzero by field Künneth. At height 0 and q≠p, S[1/p]∧H𝔽_q=H𝔽_q but Hℚ∧H𝔽_q=0.

*Needs:* BordismFormalGroups F6.2–F6.3 (Morava unit nilpotence, finite duality, central-power self-maps and telescope classes); BordismFormalGroups F6.3 (smashing finite localization and finite-source telescope comparison); GeneralizedCohomology G2 (tensor of homotopy-unital multiplications).

### Examples

For telescopes, Tel(0)=0 and Tel(id_V)=V. For q≠p, Tel(p:S→S)∧S/q=S/q, since p is a unit mod q; its rational alternative is 0. (lmmt, §2.1 and Lemma 2.2(vii), pp.6–7; lmmt line 239 and line 265).

**Checks.**

- Inverting a nilpotent map gives zero.

- Replacing v_n by a positive power gives an equivalent telescope.

- For q≠p, T(0)⊗S/q≠0 whereas Hℚ⊗S/q=0.

### Dependencies

GeneralizedCohomology G2 (mapping spectra and suspension–loop adjunction); HomotopySpheres §3A (convenient pointed mapping spaces and suspension–loop adjunction); GeneralizedCohomology G3.7 (finite-CW suspension-spectrum mapping formula and unstable representatives after finitely many suspensions); BordismFormalGroups F6.3 (v_n maps and telescope classes); GeneralizedCohomology G2.10 (homotopy-fiber exact sequence); StableHomotopyKTheory §§2.4–2.7 (boundary identification and basepoint transport); Mathlib `IsLocalization.flat` and `Module.Flat.lTensor_exact` (flat localization and exact tensor). §3.1 (periodic mapping groups); GeneralizedCohomology G5.1 (finite duality) and G3.9 (derived p-completion); BordismFormalGroups F6.3 (central powers, source independence and finite p-power annihilation). BordismFormalGroups F6.2–F6.3 (Morava unit nilpotence, finite duality, central-power self-maps and telescope classes); BordismFormalGroups F6.3 (smashing finite localization and finite-source telescope comparison); GeneralizedCohomology G2 (tensor of homotopy-unital multiplications).

## Layer 4: Finite localization and fracture

### 4.1 Finite chromatic localizations

Write L_n=L_(K(0)∨⋯∨K(n)). On all spectra write L_n^f=L_(Hℚ∨T(1)∨⋯∨T(n)), so this includes p-localization, and write L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). For n=0 these are respectively Hℚ-localization and p-inversion. Construct units and tower maps L_n→L_(n−1), L_n^f→L_(n−1)^f and L_n^(p,f)→L_(n−1)^(p,f). The finite kernels and smashing property are theorems, not parts of the notation. (lmmt, Definition 2.5, p.8; lmmt line 322).

The construction has the following API.

- Each tower has natural units from X.

- The truncation maps of the detector wedges induce compatible maps down the towers.

- An object is local exactly for the E-equivalences of the displayed wedge.

- For a smashing tower, the localized sphere is an idempotent commutative algebra and L(X)=L(S)⊗X.

At n=0 a tower map to height −1 is not part of this notation; define L_−1=0 separately only when a fiber formula uses it.

*Proof route.* Use the wedge of the indicated detecting spectra to obtain each reflector. The inclusion of acyclic classes gives natural transition maps compatible with the units.

**Checks.**

- L_0^fS=Hℚ but L_0^(p,f)S=S[1/p].

- L_n^f kills S/q for q≠p while L_n^(p,f) preserves this spectrum.

- At n=1, L₁^fK(1)≃L₁^(p,f)K(1)≃K(1)≠0: K(1) is K(1)-local, hence T(1)-local by ⟨K(1)⟩≤⟨T(1)⟩, hence local for both displayed wedges. Since p acts by zero on K(1)_*, both Hℚ⊗K(1) and S[1/p]⊗K(1) are 0, so a tower that keeps its bottom functor constant in n fails this Check.

*Needs:* BordismFormalGroups F6.1 (homological reflectors) and F6.3 (positive-height telescope classes); GeneralizedCohomology G3.9 (p-inversion and p-localization).

### 4.2 Finite localization kernels

For n≥0 the kernel of L_n^(p,f) on all spectra is the localizing subcategory generated by finite p-primary-torsion spectra of type at least n+1. It is smashing. The kernel of L_n^f on all spectra also contains the localizing subcategories at the primes q≠p. Both towers restrict on Sp_(p) to the supplied finite localization with kernel Ind(C_(n+1)), and the quotient functor preserves compact objects into its compact localized category. (lmmt, Lemma 2.6 and proof, p.8; lmmt line 330).

*Proof route.* Extend the supplied finite quotient from Sp_(p) to integral spectra using the finite p-primary generators. Prove that their localizing tensor ideal is the kernel by the localization universal property. Compact dualizable generators make local objects closed under coproducts, and tensoring with the localized sphere realizes the reflector. Add the q-primary generators for the Hℚ-bottom convention.

**Checks.**

- At n=0, the p-finite kernel is generated by S/p.

- On p-local spectra, the n=0 kernel is all rationally acyclic spectra.

- At n=0, the p-finite kernel contains S/p but not S/q for q≠p; its p-local restriction consists of rationally acyclic objects. L₀^f kills both S/p and S/q on all spectra.

*Needs:* §4.1 (all-spectra finite towers); BordismFormalGroups F6.3 (p-local finite kernel and thick classification); GeneralizedCohomology G5.1 and gap:p-local-finite-duality (compact dualizable generators).

### 4.3 Comparison on p-local spectra

If X is p-local then L_n^(p,f)X≃L_n^fX, naturally and compatibly with tower units and transition maps. Both outputs are p-local. Without p-locality the comparison is false, as S/q with q≠p shows. The functor L_n^(p,f) is the localization of the same name in cmnn line 97. (lmmt, Definition 2.5, p.8; consequence (i) of Lemma 2.8, p.9; lmmt line 356).

*Proof route.* On p-local spectra, tensoring with S[1/p] is rationalization. The positive-height detectors are already p-local. Restrict the two localization universal properties to Sp_(p); their acyclics coincide there.

**Checks.**

- Check X=S_(p), including n=0.

- Check X=S/q, q≠p, to disprove an unrestricted comparison.

- For S_(p), both bottom outputs are Hℚ. For S/q with q≠p, the outputs are S/q and 0, so the unrestricted comparison fails.

*Needs:* §4.1 (two finite towers); §4.2 (smashing and kernels); GeneralizedCohomology G3.9 (p-localization and rationalization).

### 4.4 Chromatic fracture squares

Let E,F be spectra and assume L_E sends F-acyclics to F-acyclics. For every X the natural square L_(E∨F)X→L_FX over L_EX→L_E L_FX is cartesian. The hypothesis holds if L_E is smashing or if L_F kills every E-local spectrum. Apply it for 0≤m<n to E=T(0)∨⋯∨T(m) and F=T(m+1)∨⋯∨T(n), giving the finite-tower fracture square with upper-left L_n^(p,f)X and lower-left L_m^(p,f)X. The analogous p-local Hℚ convention follows by comparison. (lmmt, Lemmas 2.7–2.8 and proof, p.8; lmmt line 344).

*Proof route.* The pullback is local for E∨F because its three other vertices are local for the appropriate detector. Compare its fiber with that of X→L_FX, then use preservation of F-acyclics to see the map from X is also an E-equivalence. Check the two sufficient conditions explicitly; use smashing of the lower finite tower in the application.

**Checks.**

- For m=0 the lower localization is p-inversion, not integral rationalization.

- For E=0,F=S, the square has vertices X,X,0,0 and its pullback is X. For E=S,F=0 the vertices are X,0,X,0 and again the pullback is X. At m=0 the lower detector preserves S/q for q≠p.

*Needs:* BordismFormalGroups F6.1 (L_E and locality); §4.2 (smashing for the finite-tower application).

### 4.5 Bottom finite-local comparison

If X is T(1)-acyclic, then L_1^(p,f)X→X[1/p] is an equivalence, without a p-locality assumption on X. In the p-local subcategory this says L_1^fX≃X⊗Hℚ. (lmmt, Consequences (i)–(ii) of Lemma 2.8, p.9; lmmt line 356).

*Proof route.* Use the height-one fracture square with lower detector S[1/p]. The T(1)-local corner of X is zero, so the pullback is X[1/p].

**Checks.**

- For X=S/q with q≠p, the result is X rather than zero.

- For X=S/q with q≠p, T(1)∧X=0 and both L₁^(p,f)X and X[1/p] equal X≠0; for X=0 both are 0.

*Needs:* §4.4 (fracture with E=S[1/p], F=T(1)); §4.3 (restriction to Sp_(p)).

### Examples

For every n≥0, both towers fix Hℚ and kill H𝔽_p: L_n^fHℚ=L_n^(p,f)Hℚ=Hℚ, because Hℚ is a module over both bottom detectors Hℚ and S[1/p] and hence local for each displayed wedge, while L_n^fH𝔽_p=L_n^(p,f)H𝔽_p=0, because Hℚ, S[1/p] and every T(i) with i≥1 annihilate H𝔽_p (§3.2). (lmmt, Definition 2.5, p.8; lmmt line 322.)

### Dependencies

BordismFormalGroups F6.1 (homological reflectors) and F6.3 (positive-height telescope classes); GeneralizedCohomology G3.9 (p-inversion and p-localization). §4.1 (all-spectra finite towers); BordismFormalGroups F6.3 (p-local finite kernel and thick classification); GeneralizedCohomology G5.1 and gap:p-local-finite-duality (compact dualizable generators). §4.1 (two finite towers); §4.2 (smashing and kernels); GeneralizedCohomology G3.9 (p-localization and rationalization). BordismFormalGroups F6.1 (L_E and locality); §4.2 (smashing for the finite-tower application). §4.4 (fracture with E=S[1/p], F=T(1)); §4.3 (restriction to Sp_(p)).

## Layer 5: Bousfield–Kuhn functors

### 5.1 Finite telescopic functors

For a finite pointed complex V and a v_n map v:Σ^d V→V with n≥1, construct a spectrum-valued functor Φ_v on pointed spaces by repeating Map_*(V,−) along the v-induced degree-d structure maps. Its integer homotopy groups are v_n⁻¹π_*(−;V). Transport along compatible powers of self-maps and finite maps is coherently functorial, rather than a choice made only in the homotopy category. (kuhn-guide, §3.1, Lemma 3.1, pp.9–11; Theorem 5.2 and Lemma 5.4, pp.15–17; kuhn-guide line 393).

The construction has the following API.

- π_kΦ_v(X) is the displayed periodic mapping-space colimit.

- Positive powers give canonically compatible equivalent functors.

- For f:V→W intertwining equal-degree powers, precomposition induces Φ_w(Y)→Φ_v(Y), naturally in Y; these maps have rigidified composition and identity.

- On Ω∞X, the construction agrees with periodic localization of the mapping spectrum F(V,X).

*Proof route.* Construct the d-periodic prespectrum from precomposition by v and spectrify it. Identify integer homotopy with the cofinal abelian tails. Construct Kuhn’s cofinal system of finite type-n complexes, cofibration replacements and eventually commuting power maps; rigidify their composition before taking limits. The cofinal comparison must be coherent in finite sources, rather than merely an isomorphism of periodic groups.

**Checks.**

- If X is a finite Postnikov space then Φ_v(X)=0.

- Φ_v(*)=0.

- For v and v² the direct systems have the same colimit by the even cofinal subsequence r=0,2,4,… .

- On Ω∞T(n) the periodic groups are nonzero, since K(n)⊗T(n)≠0; replacing Φ_v by the zero functor fails this test.

*Needs:* §3.1 (periodic groups); HomotopySpheres §3A (convenient pointed mapping spaces and suspension–loop adjunction); GeneralizedCohomology G3.7 (finite-CW suspension-spectrum mapping formula and unstable representatives after finitely many suspensions); GeneralizedCohomology G2 (prespectra, spectrification and mapping spectra); BordismFormalGroups F6.3 (eventually compatible powers).

### 5.2 Bousfield–Kuhn functor

For each n≥1 construct Φ_n:Spaces_*→Sp_(T(n)) with natural equivalences F(V,Φ_nY)≃Φ_vY for finite type-n V with self-map v, and Φ_nΩ∞X≃L_(T(n))X. The first comparison uses the finite mapping spectrum; the second is natural in every spectrum X. State uniqueness with the finite-source compatibilities, not merely the equality of homotopy groups. (kuhn-guide, Theorem 1.1, pp.3–4; Theorem 5.2, Lemmas 5.4–5.5 and Definition 5.6, pp.15–18; kuhn-guide line 113).

The construction has the following API.

- Every value of Φ_n is T(n)-local.

- The finite-source formula is natural in Y and compatible with powers and finite maps.

- The natural equivalence Φ_nΩ∞≃L_(T(n)) respects maps of spectra.

- T(n)-local-valued functors equipped with the compatible finite-source characterization are equivalent compatibly with that characterization; locality is part of the uniqueness hypothesis.

*Proof route.* Take the homotopy inverse limit over the cofinal, rigidified finite-source system. Finite duality proves the finite-source characterization, and that characterization proves T(n)-locality and the Ω∞ comparison. For uniqueness require T(n)-local values and compatible equivalences on every finite type-n source and its power maps.

**Checks.**

- Φ_nΩ∞ of a T(n)-acyclic spectrum is zero.

- Φ_nΩ∞T(n)≃L_(T(n))T(n) is nonzero.

- There is no height-zero functor with this unrestricted comparison on all spectra, since Ω∞ annihilates strictly negative Eilenberg–Mac Lane spectra.

- Φ_nΩ∞0=0 and Φ_nΩ∞T(n)=L_T(n)T(n)≠0. Ω∞Σ⁻¹Hℚ=* but S[1/p]∧Σ⁻¹Hℚ=Σ⁻¹Hℚ≠0, excluding the unrestricted height 0 formula.

*Needs:* §5.1 (rigidified finite-source functors); §3.2 (telescope acyclicity); gap:p-local-finite-duality; BordismFormalGroups F6.1 (local categories).

### 5.3 Detection by suspension and loops

For n≥1, if Σ∞Ω∞f is a T(n)-equivalence then f is a T(n)-equivalence. Indeed L_(T(n))f is a retract of Φ_nΩ∞Σ∞Ω∞f by the suspension-loop unit and counit. At n=0 the corresponding detection holds for maps of connective spectra with p inverted. The positive-height functor Σ∞Ω∞ does not in general preserve T(n)-equivalences: Hℤ is T(n)-acyclic whereas Σ∞Ω∞Hℤ=Σ∞ℤ has nonzero sphere summands. (lmmt, Proposition 2.9 and Remark 2.10, p.9; lmmt line 361).

*Proof route.* Apply Φ_n to the suspension-loop triangle identity, giving a natural retract diagram. For the height-zero connective assertion compare the least nonzero p-inverted homotopy group using Hurewicz, and then the fiber. Use Hℤ and its discrete infinite loop space to test the absent preservation direction.

**Checks.**

- A negative Eilenberg–Mac Lane spectrum rules out the unrestricted height-zero detection statement.

- T(n)∧Hℤ=0 for n≥1, whereas Σ∞Ω∞Hℤ=Σ∞ℤ has a sphere retract and nonzero T(n)-homology. For Σ⁻¹Hℚ→0, suspension-loop detection at height 0 would send 0→0 to a non-equivalence.

*Needs:* §5.2 (Bousfield–Kuhn equivalence); GeneralizedCohomology G2 (suspension–loop unit and counit); AlgebraicTopology Stage 8 (connective Hurewicz for the height-zero case).

### Examples

For a discrete pointed space X, such as S⁰, Φ_n(X)=0 for every n≥1: π_jMap_*(V,X)=[Σ^jV,X]_* vanishes for j≥1 because Σ^jV is connected, so every periodic colimit is zero. Since L_(T(n))Σ∞S⁰=L_(T(n))S≠0, the functor Φ_n is not L_(T(n))Σ∞; only Φ_nΩ∞≃L_(T(n)) holds. (kuhn-guide, Theorem 1.1, pp.3–4; kuhn-guide line 113.)

### Dependencies

§3.1 (periodic groups); HomotopySpheres §3A (convenient pointed mapping spaces and suspension–loop adjunction); GeneralizedCohomology G3.7 (finite-CW suspension-spectrum mapping formula and unstable representatives after finitely many suspensions); GeneralizedCohomology G2 (prespectra, spectrification and mapping spectra); BordismFormalGroups F6.3 (eventually compatible powers). §5.1 (rigidified finite-source functors); §3.2 (telescope acyclicity); gap:p-local-finite-duality; BordismFormalGroups F6.1 (local categories). §5.2 (Bousfield–Kuhn equivalence); GeneralizedCohomology G2 (suspension–loop unit and counit); AlgebraicTopology Stage 8 (connective Hurewicz for the height-zero case).

## Layer 6: Connective spaces and generalized homology

### 6.1 Generalized Serre filtration

For a fibration F→X→Y over a CW space and a spectrum E, filter E⊗Σ∞_+X by the inverse images of the skeleta of Y. The resulting homological spectral sequence has E²_(s,t)=H_s(Y; y↦E_t(F_y,+)) and d_r:(s,t)↦(s−r,t+r−1), with the full monodromy local system. Its total-degree target is π_(s+t)(E⊗Σ∞_+X). The filtration is exhaustive and starts at the inverse image of the empty skeleton, which is empty, so the spectral sequence converges strongly to π_(s+t)(E⊗Σ∞_+X) for every CW base and every spectrum E (StableHomotopyKTheory §7.24). (lmmt, Proof of Proposition 2.11(ii), p.10; lmmt line 398; bhm, Lemma 3.5, p.6; bhm line 258).

The construction has the following API.

- The filtration is natural under maps of coefficient spectra and under maps of fibrations whose base map is cellular. An arbitrary map of fibrations over a map g of CW bases induces maps from E² on and on the abutment: replace g by a homotopic cellular map, lift the homotopy through the target fibration, and use that a cellular homotopy raises skeletal filtration by at most one, so the induced maps from E² on do not depend on the replacement. On E² these maps are the maps of local-coefficient homology induced by g and the fiber maps.

- Over each s-cell the graded contribution is Σ^s(E⊗Σ∞_+F_y).

- The second page is homology with the full displayed monodromy system.

- The filtration is exhaustive and zero in negative filtration, so the spectral sequence converges strongly, with E^∞ the associated graded of the image filtration on π_*(E⊗Σ∞_+X).

*Proof route.* Pull back the skeletal filtration of the base. For naturality, apply cellular approximation to the base map and the homotopy lifting property of the target fibration. Trivialize over cells and identify its graded terms with sums of shifted fiber E-homology. The cellular boundary retains path transport, producing local coefficients. Exhaustiveness holds because E⊗Σ∞_+ preserves the sequential homotopy colimit of the preimages of the skeleta; apply the convergence theorem for exhaustive filtrations bounded below.

**Checks.**

- For Y=* the target is E_*(F_+).

- Give I its CW structure with 0-cells {0,1}, and map the identity fibration I→I to itself by t↦t/2 on total space and base. Filtration 0 is {0,1}, and its image {0,1/2} is not contained in {0,1}; so this map does not preserve the skeletal filtrations. The base map is homotopic rel 0 to the constant cellular map at 0, and the induced map on E²=H_*(I;E_*(pt)) is the identity on H₀, the only nonzero column, as for any self-map of the contractible base.

- For E=Hℤ and the mapping torus of a degree −1 map S¹→S¹, monodromy acts by −1 on H₁ of the fiber. The spectral sequence gives H₁=ℤ⊕ℤ/2 and H₂=0; constant coefficients would incorrectly give the torus groups ℤ² and ℤ.

- For E=KU and the identity fibration of ℂP^∞, the base is infinite-dimensional and E is periodic, and the spectral sequence still converges strongly: E²_(s,t)=H_s(ℂP^∞;KU_t) is ℤ for s and t even and 0 otherwise, so every differential, which lowers total degree by one, vanishes, and the abutment is KU_*(ℂP^∞). The cohomological spectral sequence of the same filtration has entering differentials and needs the lim¹ conditions of StableHomotopyKTheory §7.26.

- For the reflection mapping torus of S¹, 1−(−1)=2 on H₁(S¹); ker(2:ℤ→ℤ)=0 and coker(2)=ℤ/2, giving H₂=0 and H₁=ℤ⊕ℤ/2. Constant transport instead gives H₂=ℤ and H₁=ℤ².

*Needs:* StableHomotopyKTheory §§7.21–7.23 (filtered spectra, exact couples and their spectral sequence) and §7.24 (strong convergence for exhaustive filtrations bounded below); AlgebraicTopology Stages 4–5 (cellular local systems, cellular approximation and fibration transport); GeneralizedCohomology G2 (smash and colimits).

### 6.2 Fiberwise homology comparison

Let f:X→Y be a map of spaces and E a spectrum. If for every y the augmentation E⊗Σ∞_+fib_y(f)→E is an equivalence, then E⊗Σ∞_+f is an equivalence, with no finiteness hypothesis on Y and no boundedness hypothesis on E. For pointed connected fibers the hypothesis says that their reduced E-homology vanishes. This theorem supplies the arbitrary-base comparison. (lmmt, Proposition 2.11(ii) proof, p.10; lmmt line 398).

*Proof route.* Unstraighten f as a space-indexed local system of spaces; after applying E⊗Σ∞_+ its colimit over Y is E⊗Σ∞_+X. The fiber augmentations give a natural equivalence to the constant local system E. Take colimits. Compose the left Kan extension along f with that along Y→*; its pointwise fiber formula identifies the first colimit with E⊗Σ∞_+X and the constant-system colimit with E⊗Σ∞_+Y. The unstraightening and the pointwise Kan-extension formulas and their composition are supplied by BordismFormalGroups F6.5.

**Checks.**

- The augmentation condition uses unreduced fibers; asserting E_*(F_+)=0 would incorrectly fail even for a point.

- For f=id_Y every fiber is a point and its augmentation is E→E, the identity. For ∅→*, the fiber augmentation is 0→E, which is an equivalence exactly when E=0. For a two-point fiber it is E⊕E→E, the fold, with fiber E.

*Needs:* BordismFormalGroups F6.5 (space-indexed unstraightening); BordismFormalGroups F6.5 (pointwise Kan formulas and composition); GeneralizedCohomology G2 (Σ∞_+ and tensor preserve colimits).

### 6.3 Connective periodic vanishing

Fix n≥1 and a noncontractible finite pointed suspension V of type n+1 with p-primary reduced integral homology, suspended enough to be simply connected. Construct its nullification N_V on spaces with natural unit η_X:X→N_VX. A space Z is V-null when evaluation Map(V,Z)→Z is an equivalence; Map here is unpointed and derived, equivalently Map_*((V,v),(Z,z)) is contractible for every z. Precomposition with η_X must give Map(N_VX,Z)≃Map(X,Z) for every V-null Z. A basepoint on X gives one on N_VX by η_X, and the corresponding equivalence of pointed mapping spaces holds for pointed V-null targets. (bhm, §3 nullification setup, p.5; bhm line 210 and line 217).

The construction has the following API.

- N_V is functorial and η is natural; N_VX is V-null for every X.

- For V-null X, η_X is an equivalence. In general N_Vη_X and η_(N_VX) are equivalences, giving the natural idempotence N_VN_VX≃N_VX.

- On simply connected p-local spaces the unit preserves rational homotopy and v_i-periodic homotopy for 1≤i≤n, and its output has zero v_i-periodic groups for i>n. If d is the least degree with π_dV≠0, a map between p-local spaces whose homotopy groups vanish in degrees at most d is an N_V-equivalence exactly when it is a rational homotopy equivalence and a v_i-periodic equivalence for 1≤i≤n. This is the range of the finite-nullification comparison; rationalization agrees with p-inversion on these p-local inputs. (bhm, §3(i)–(iii) and Theorem 3.1, p.5; bhm line 220 and line 225; the p-local convention is bhm line 30).

**Checks.**

- N_VV≃*: the map V→* is inverted by its own nullification. Since V is noncontractible, the identity functor would give the wrong result.

- N_VK(ℚ,2)≃K(ℚ,2), and its unit is an equivalence: the homotopy groups of Map_*(V,K(ℚ,2)) are the reduced rational cohomology groups H̃^(2−j)(V;ℚ)=0. A constant-point functor would lose π₂=ℚ.

- N_V(V∨K(ℚ,2))≃K(ℚ,2), with unit given by collapsing V. Mapping this wedge into any V-null Z gives Map_*(V,Z)×Map_*(K(ℚ,2),Z)≃Map_*(K(ℚ,2),Z), so the universal property identifies the output and its unit; the constant-point alternative again loses π₂=ℚ.

For every n≥1 there is an integer m≥2, depending on n and p, with the following properties. Every m-connective pointed space F with π_kF⊗ℤ[1/p]=0 for k≥2 and vanishing v_i-periodic homotopy for 1≤i≤n has L_n^(p,f)-acyclic reduced suspension spectrum. If f:X→Y is an m-connective map satisfying §3.1’s relative height-zero condition and a v_i-periodic equivalence for every 1≤i≤n and every compatible basepoint, then Σ∞f is an L_n^(p,f)-equivalence for every choice of basepoint, with arbitrary endpoints X,Y. The uniform value m=n+1 is the sharp connectivity theorem of §9.6, whose proof uses higher semiadditivity and hence the telescopic Tate vanishing of §9.3. (lmmt, Proposition 2.11, pp.9–10; lmmt line 382 and line 390; bhm, §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6; bhm line 225).

*Proof route.* For positive heights let d be the least degree with π_dV≠0 for the type-(n+1) suspension V of the nullification above, and take m=d+1; m≥3 because V is simply connected. Apply the displayed nullification comparison to the m-connective space F_(p); its rational homotopy groups vanish by the p-inversion hypothesis, so F_(p)→* is an N_V-equivalence. For 1≤i≤n and every T(i)-local spectrum Z, Ω∞Z is V-null, since Σ∞V is finite of type n+1 and hence T(i)-acyclic; so Map_*(F_(p),Ω∞Σ^jZ) is contractible for every j, and Σ∞F_(p) is T(i)-acyclic. The map Σ∞F→Σ∞F_(p) is a p-local equivalence because F is simply connected, and T(i) is p-local, so Σ∞F is T(i)-acyclic. S[1/p]-acyclicity is the simply connected p-inversion Hurewicz argument applied directly to F. For the map theorem, the flat fiber comparison in §3.1 gives p-inverted higher-homotopy vanishing of every fiber; exactness of positive-height periodic groups gives the remaining vanishings. Apply the absolute theorem to each fiber and then §6.2.

**Checks.**

- A contractible fiber has zero periodic groups and zero reduced suspension, for every m. For K(ℤ/p,r), all v_i-periodic groups with i≥1 vanish because it is bounded, and π_r⊗ℤ[1/p]=0; the theorem applies once r≥m. At r=n, the space K(ℤ/p,n) has nonzero K(n)-homology, so no admissible m is at most n; §9.6 shows that m=n+1 is admissible.

- At n=1, id on BS₃ is admitted with π₁=S₃ and all higher maps 0→0. For BS₃×K(ℤ/q,m)→BS₃ with q prime, positive-height periodic groups of the fiber vanish. If q=p, its π_m[1/p]=0 and the theorem applies; if q≠p, π_m[1/p]=ℤ/q and its reduced H_m(−;ℤ[1/p])=ℤ/q≠0, excluding finite-local equivalence at the bottom detector.

*Needs:* §3.1–§3.2 (periodic equivalences); §6.2 (fiberwise comparison); BordismFormalGroups F6.1/F6.3 (localization and finite type spectra); AlgebraicTopology Stage 8 (Hurewicz, for the height-zero case); the nullification comparison constructed in this subsection.

### 6.4 Connective preservation by suspension and loops

For n≥1, Σ∞Ω∞ preserves m-connective L_n^(p,f)-equivalences of spectra, where m is the integer of §6.3; by §9.6 one may take m=n+1. This does not assert preservation of arbitrary T(n)-equivalences. (lmmt, Proposition 2.11(iii), pp.9–10; lmmt line 403).

*Proof route.* Apply Ω∞ to the connective map; positive-height periodic groups agree with the stable ones. A finite-local equivalence is a T(0)-equivalence, so its maps on π_k⊗ℤ[1/p] are isomorphisms for k≥2; this supplies §3.1’s relative height-zero condition. Ω∞ preserves the connective fibers and hence the component and π₁ isomorphisms. Use §6.3 at every basepoint and then apply Σ∞.

**Checks.**

- For an identity map all fibers and comparison cofibers are 0. Hℤ→0 has fiber Hℤ with π₀=ℤ, hence is not m-connective for any m≥1; its suspension-loop image has nonzero T(n)-homology.

*Needs:* §6.3 (the integer m and the all-basepoint space comparison); §3.2 (agreement of stable and infinite-loop periodic groups); GeneralizedCohomology G2 (Ω∞ preserves homotopy fibers); GeneralizedCohomology G2.10 (homotopy-fiber exact sequence, for the component and π₁ isomorphisms).

### Examples

For Postnikov and connected-cover conventions, τ_≤0S¹=*; for the pointed set {a,b}, τ_≤0 is {a,b} and X⟨1⟩={a}. K(A,2)⟨3⟩=* while τ_≤2K(A,2)=K(A,2). (lmmt, Lemma 2.2(ii), p.6; proof of Proposition 2.11, pp.9–10; lmmt line 259; bhm, Lemma 3.2, p.6; bhm line 233).

**Checks.**

- τ_≤0X is the discrete component space, not a connected replacement.

- X⟨1⟩ is the basepoint component of X.

- K(A,r)⟨r+1⟩ is contractible, whereas τ_≤rK(A,r)≃K(A,r).

### Dependencies

StableHomotopyKTheory §§7.21–7.23 (filtered spectra, exact couples and their spectral sequence) and §7.24 (strong convergence for exhaustive filtrations bounded below); AlgebraicTopology Stages 4–5 (cellular local systems, cellular approximation and fibration transport); GeneralizedCohomology G2 (smash and colimits). BordismFormalGroups F6.5 (space-indexed unstraightening); BordismFormalGroups F6.5 (pointwise Kan formulas and composition); GeneralizedCohomology G2 (Σ∞_+ and tensor preserve colimits). §3.1–§3.2 (periodic equivalences); §6.2 (fiberwise comparison); BordismFormalGroups F6.1/F6.3 (localization and finite type spectra); AlgebraicTopology Stage 8 (Hurewicz, for the height-zero case); the nullification comparison constructed in this subsection. §6.3 (the integer m and the all-basepoint space comparison); §3.2 (agreement of stable and infinite-loop periodic groups); GeneralizedCohomology G2 (Ω∞ preserves homotopy fibers); GeneralizedCohomology G2.10 (homotopy-fiber exact sequence, for the component and π₁ isomorphisms).

## Layer 7: Morava E-theory and stabilizer actions

### 7.1 Morava E-theory

For every perfect field k of characteristic p and one-dimensional commutative formal group G of finite height h≥3, extend the marked height-one/two realization interface to a K(h)-local even-periodic E∞ ring E(k,G) with π₀E=R(k,G), the marked algebraic universal deformation ring, and π_*E≅R(k,G)[u,u⁻¹], |u|=−2 after choosing a coordinate and periodicity generator. Its formal group is the universal deformation of G. The space of realizations together with that deformation identification is contractible. Together with the supplied h=1,2 realizations this gives one interface at every h≥1; neither the coordinate nor the polynomial presentation of R(k,G) is canonical. (goerss, §3.3, Theorem 3.6, pp.238–239; goerss line 688; behrens, Theorem 1.7.6 and discussion, pp.33–34; behrens line 1252).

The construction has the following API.

- The degree-zero ring represents the imported marked deformation problem; the periodic grading has |u|=−2.

- The complex-oriented formal group is isomorphic to the universal deformation under the marking.

- E(k,G) is K(h)-local and even periodic.

- The space of realizations with the specified deformation comparison is contractible.

The height-one/two restriction agrees with the supplied marked realization and action. The higher-height extension preserves its coordinate-change and unit compatibilities.

*Proof route.* Apply the supplied marked obstruction machinery to the arbitrary-height universal deformation. Construct its complete cooperation algebra, the realization obstruction groups and their vanishing, the comparison with Landweber realization, and the contractible marked realization space. Verify the h≥3 coefficient and mapping-space comparisons using the same tower, without identifying algebraic representability alone with an E∞ realization.

**Checks.**

- For h=1 and k=𝔽_p the deformation ring is ℤ_p, with no deformation parameters.

- For h=2 and k=𝔽_(p²), π₀ is W(𝔽_(p²))[[u₁]].

- At h=1,k=𝔽_p the ring is ℤ_p and there are 0 parameters; at h=2 it is W(𝔽_(p²))[[u₁]]; at h=3 there are 2 parameters. The additive law has h=∞ and is excluded.

- The degree convention agrees with the supplied h=1,2 realizations of EllipticCohomology E2, whose periodicity generator w has degree +2: under w=u⁻¹ the two Laurent rings coincide, and at h=1 and odd p the operation ψ_(−1) sends u to −u and w to (−u)⁻¹=−w. With |u|=−2 the coefficient map v_i↦u_iu^(1−pⁱ) has degree 2(pⁱ−1)=|v_i|; a generator of degree +2 in the same formula would give the negative degree 2(1−pⁱ).

*Needs:* BordismFormalGroups F1/F5 (marked formal groups and universal deformation rings); EllipticCohomology E2.2–E2.3 (the h=1,2 interface and general realization/obstruction machinery); GeneralizedCohomology G2 (E∞ ring and module carriers).

### 7.2 Morava stabilizer actions

Extend the supplied h=1,2 functoriality to h≥3, making E(k,G) functorial on the groupoid of perfect characteristic-p fields with specified isomorphisms of their height-h formal groups after coefficient transport. Aut(k,G) acts coherently through E∞ maps. For a Honda law over 𝔽_(p^h), specify the extended stabilizer G_h=Aut(G/𝔽_(p^h))⋊Gal(𝔽_(p^h)/𝔽_p). Its action on coefficients is continuous for the maximal-ideal topology, and its finite subgroup restrictions are coherent finite actions usable in Tate and homotopy fixed points. A profinite action is not modeled as a discrete finite-quotient action on E_h. (goerss, Theorem 3.6 and following paragraph, p.239; goerss line 688; behrens, §1.6, pp.27–28; behrens line 1016).

The construction has the following API.

- An isomorphism of pairs gives an E∞ equivalence with coherent identity and composition.

- Automorphisms of the pair induce the coherent group action.

- The action on π₀ is the action on marked universal deformations.

- Restriction to a finite subgroup agrees with the coherent finite-action carrier.

The height-one/two restriction agrees with the supplied marked realization and action. The higher-height extension preserves its coordinate-change and unit compatibilities.

*Proof route.* Transport marked deformation morphisms through the realization tower and its mapping-space uniqueness, keeping coherent identity and composition. On coefficients use the maximal-ideal quotients to prove continuity. Restrict to actual finite subgroups to obtain the coherent actions needed below; no arbitrary profinite homotopy-fixed-point construction is required here.

**Checks.**

- At h=1 the stabilizer contains ℤ_p^× and acts through p-adic Adams operations.

- The h=2 residue-field involution is retained in the extended group.

- At odd p and height one, the subgroup {±1} fixes π₀E₁=ℤ_p, while its nonidentity Adams operation sends the periodicity generator u to −u. The action on π₀ alone therefore does not determine the finite action on the spectrum.

- At h=1 and odd p, ψ_(−1) fixes π₀=ℤ_p and sends u to −u; its square fixes u. At h=2 the residue involution has square 1 and is not discarded. At h=3 the residue field has Galois group of order 3.

*Needs:* §7.1 (all finite-height realization); BordismFormalGroups F5 (marked deformation automorphisms and their adic topology), F6.5 (coherent finite actions); EllipticCohomology E2.2–E2.3 (functorial obstruction comparison at h=1,2).

### Examples

At h=1 with k=𝔽_p and G the multiplicative formal group, E(k,G) is p-complete complex K-theory KU_p^∧, with π₀=ℤ_p and Aut(k,G)=ℤ_p^×. The class a∈ℤ_p^× acts by the Adams operation ψ^a, which multiplies π_(2m) by a^m; in particular ψ^a(u)=a⁻¹u, and a=−1 recovers ψ_(−1)(u)=−u. (goerss, Theorem 3.6, p.239; goerss line 688; behrens, §1.6, p.28; behrens line 1016.)

### Dependencies

BordismFormalGroups F1/F5 (marked formal groups and universal deformation rings); EllipticCohomology E2.2–E2.3 (the h=1,2 interface and general realization/obstruction machinery); GeneralizedCohomology G2 (E∞ ring and module carriers). §7.1 (all finite-height realization); BordismFormalGroups F5 (marked deformation automorphisms and their adic topology), F6.5 (coherent finite actions); EllipticCohomology E2.2–E2.3 (functorial obstruction comparison at h=1,2).

## Layer 8: Chromatic localization and its limits

### 8.1 Finite-height locality

Let R be a p-local even-periodic oriented homotopy commutative ring with geometric height at most n at every point of Spec π₀R. Then R is L_n-local, as is every spectrum M with a homotopy-unital R-action: a map a:R⊗M→M satisfying a∘(η⊗id_M)=id_M in the homotopy category. Coherent R-modules are an application when R has a specified E₁ refinement. The graded variant assumes the explicit unit-ideal criterion (p,v₁,…,v_n)=π_*R. The pointwise condition in the even-periodic case implies that criterion after converting the coefficients to degree zero. These statements require a uniform finite bound; no bound is inferred merely from having a one-dimensional law. (lmmt, Proof of Corollary 4.21, p.22; lmmt line 904; behrens, §1.6, pp.27–29; behrens line 1048).

*Proof route.* After p-typicalization and a degree-zero periodicity choice, show that the absence of points of height greater than n makes (p,v₁,…,v_n) the unit ideal. Use finite invariant-ideal descent and the BP coefficient comparisons to prove ⟨R⟩≤⟨E(n)⟩. BordismFormalGroups F6.3’s pairing locality criterion then makes R⊗M L_n-local for every spectrum M. The maps M→R⊗M→M, given by η⊗id_M and a, exhibit M as a retract, so M is L_n-local. Taking M=R with its multiplication proves locality of R itself. This uses the displayed homotopy identity without requiring a derived module category for the homotopy ring.

**Checks.**

- For M=R and a=μ, the unit-action composite R→R⊗R→R is id_R, so the retract recovers R itself.

- For M=0, the composite 0→R⊗0→0 is id_0=0; the action condition admits the zero spectrum.

- On nonzero M, the zero proposed action R⊗M→M gives composite 0≠id_M. It fails the unit-action hypothesis and cannot supply the required retract.

- The additive characteristic-p theory has infinite height and does not meet a finite bound.

- For the multiplicative height 1 law, v₁ is a unit after choosing periodicity, so (p,v₁)=(1). For the additive characteristic-p law all v_i and p vanish, giving ideal 0≠(1) over a nonzero field. For the zero ring, 0=(1) and the conclusion is the zero module.

- For the zero coefficient ring the height-bound ideal is the unit ideal because 0=1, and every module is zero. Over a nonzero characteristic-p field with additive law the same generators give the proper ideal 0, so the finite-height conclusion has no hypothesis witness.

*Needs:* BordismFormalGroups F1/F5 (height ideals, coordinate invariance and finite invariant-ideal descent), F6.1 and F6.4 (locality and Ravenel classes); BordismFormalGroups F6.3 (pairing locality criterion and closure of local objects under retracts); GeneralizedCohomology G2 (spectral tensor and homotopy-unit maps).

### 8.2 Telescopes on chromatically local spectra

For n≥1, every L_(n−1)-local spectrum is T(n)-acyclic. For every L_n-local X, the canonical comparison L_(T(n))X→L_(K(n))X is an equivalence. Both assertions require the stated chromatic locality and do not prove equality of the two localization functors on all spectra. The p-local chromatic level one agrees with KU_(p)-localization; global KU detects all primes. (lmmt, Proof of Corollary 4.21, p.22; lmmt line 920; behrens, Proposition 1.6.8 and the chromatic fracture square, pp.28–29; behrens line 1048).

*Proof route.* By Hopkins–Ravenel smashing, every L_(n−1)-local X is L_(n−1)S⊗X. Ravenel orthogonality makes the ring L_(n−1)S K(n)-acyclic; ring acyclicity then makes it T(n)-acyclic, and smashing with X proves the first assertion. This uses the ring comparison on the localized sphere, not on an arbitrary module. Apply the chromatic fracture square to L_n-local X; its lower piece is T(n)-acyclic and its height-n piece is detected by K(n). At height one compare the p-local KU Bousfield class with E(1) and Hℚ∨K(1), importing complex Bott theory. The comparison identifies the two natural units on each fracture piece and then on the pullback.

**Checks.**

- KU_(p) is L₁-local, but its p-completion must still be distinguished from global KU.

- For X=L_(n−1)S the T(n) localization and K(n) localization are both 0. For X=K(n) both are K(n). At n=1, KU_(p) has coefficient ℤ_(p) while its completion has ℤ_p.

*Needs:* §3.3 (ring acyclicity on the localized sphere); BordismFormalGroups F6.4 (smashing, orthogonality and chromatic fracture); §8.1 (module locality); GeneralizedCohomology G5.4 and BordismFormalGroups F3 (KU and Adams-summand class comparison).

### 8.3 Height-one telescope equality

At height one and every prime, ⟨T(1)⟩=⟨K(1)⟩ (miller, Theorem 4.11 and Corollary 4.12, pp.294–295; miller line 272 and line 282, for odd primes; mahowald, Theorem 6.3, p.382; mahowald line 627, with its corrected proof in mahowald-addendum, §2, pp.118–119; mahowald-addendum line 87). This identifies the two height-one localization functors on every spectrum, extending §8.2 beyond its L₁-local domain.

*Proof route.* Compare Miller’s odd-prime calculation and Mahowald’s prime-two bo-resolution calculation, using the corrected vanishing line and periodicity proof in mahowald-addendum §§1–3, with the supplied telescope and Morava detectors.

**Checks.**

- At p=2 and at odd primes, a type-one v₁ telescope has nonzero K(1)-homology and its T(1)- and K(1)-localizations agree.
- For Hℚ and H𝔽_p, both positive height-one localizations are 0; equality does not identify these nonzero spectra with 0 before localization.
- For KU_(p), the two localizations give KU_p^∧ with π₀=ℤ_p, rather than leaving π₀=ℤ_(p) unchanged.

*Needs:* BordismFormalGroups F6.1/F6.3 (the two local categories and telescope source-independence); GeneralizedCohomology G5.4 (real and complex K spectra); the height-one calculations of this subsection.

### 8.4 Chromatic support of BP truncations

For n≥0 and i>n, BP⟨n⟩ is K(i)-acyclic and T(i)-acyclic. For n≥1 the map BP⟨n⟩→E(n) is a T(n)-equivalence, and is also a T(i)-equivalence for i>n because both objects are acyclic there. It is not an L_n^f-equivalence in general: the rational homotopy of BP⟨n⟩ is connective, whereas E(n) has negative rational classes for n≥1. (ravenel, Theorem 2.1(d)–(f), pp.361–363; ravenel line 405 and line 407; lmmt, Corollary 4.12 and Remark 4.13, p.20; lmmt line 808).

*Proof route.* Induct on n, without choosing a ring structure on BP⟨n⟩. For n=0, BP⟨0⟩=Hℤ_(p) is bounded, so its v_i-periodic groups vanish and it is T(i)-acyclic for every i≥1 by §3.2. For n≥1 and i>n, smash the cofiber sequence Σ^(2(pⁿ−1))BP⟨n⟩→BP⟨n⟩→BP⟨n−1⟩ with T(i): the third term vanishes by induction, so v_n acts invertibly on T(i)⊗BP⟨n⟩ and T(i)⊗BP⟨n⟩≃T(i)⊗v_n⁻¹BP⟨n⟩=T(i)⊗E(n). This is zero because ⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩ and K(j)⊗T(i)=0 for j≤n<i. K(i)-acyclicity follows from ⟨K(i)⟩≤⟨T(i)⟩. The cofibers of the powers of v_n are iterated extensions of shifts of BP⟨n−1⟩, which are T(n)-acyclic, so the sequential inversion map BP⟨n⟩→E(n) is a T(n)-equivalence. At n=1, rationalization preserves the distinction between the connective polynomial coefficient ring and its Laurent localization, disproving the stronger routed assertion.

**Checks.**

- For n=1 the inversion map is a T(1)-equivalence but fails to be a rational equivalence.

- For n=0, BP⟨0⟩=Hℤ_(p) has no positive finite-height support.

- At n=1, (BP⟨1⟩⊗Hℚ)_−(2p−2)=0, whereas (E(1)⊗Hℚ)_−(2p−2)=ℚ. Its v₁-inversion cofiber is T(1)-acyclic; Hℤ_(p) has K(i)- and T(i)-homology 0 for i≥1.

*Needs:* BordismFormalGroups F3 (BP⟨n⟩, its v_n-cofiber sequences and E(n)=v_n⁻¹BP⟨n⟩), F6.3 (⟨K(i)⟩≤⟨T(i)⟩) and F6.4 (⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩); §3.2 (telescope orthogonality and the periodic-group criterion); GeneralizedCohomology G2 (filtered v_n inversion).

### Examples

For Ravenel’s Bousfield class formula, BP[p⁻¹] and Hℚ have equal acyclics, though π_(2p−2)BP[p⁻¹] contains ℚ and π_(2p−2)Hℚ=0. At n=1 the H𝔽_p term survives for BP⟨1⟩ and dies on v₁ inversion. (ravenel, Theorem 2.1(b),(d),(e),(f), pp.361–363; ravenel line 401; lmmt, Proof of Corollary 4.21, p.22; lmmt line 904).

**Checks.**

- At n=0 the inverted BP class is rational, although BP[p⁻¹] has many rational homotopy groups.

- The H𝔽_p summand is essential before v_n inversion.

For the Hopkins–Ravenel smashing theorem, at n=0, L₀S=Hℚ and L₀S∧X=Hℚ∧X. For X=S/p both outputs are 0. The inverse tower H(ℤ/pʳ), r≥1, has homotopy limit Hℤ_p, but id_(ℤ_p) cannot factor through any ℤ/pʳ: such a factorization would make pʳ kill ℤ_p. Convergence alone therefore does not give a finite-stage factorization of the identity. (mm, Theorems 4.6–4.7 and Corollary 4.8, pp.26–27; mm line 1244, line 1256 and line 1270; lmmt, Proof of Corollary 4.21, p.22; lmmt line 904).

**Checks.**

- At n=0 and X=S/p, L₀S⊗X=Hℚ⊗S/p=0=L₀(S/p); replacing rationalization by the identity would retain S/p.
- At n=0 and X=S, both sides are Hℚ with π₀=ℚ; replacing the localized sphere by 0 would give 0 instead.
- For the tower H(ℤ/pʳ), the limit has π₀=ℤ_p. Every map factoring through π₀H(ℤ/pʳ)=ℤ/pʳ is killed by pʳ, whereas pʳ·1≠0 in ℤ_p, so the identity of the limit cannot factor through any finite stage.

### Dependencies

BordismFormalGroups F1/F5 (height ideals, coordinate invariance and finite invariant-ideal descent), F6.1 and F6.4 (locality and Ravenel classes); BordismFormalGroups F6.3 (pairing locality criterion and closure of local objects under retracts); GeneralizedCohomology G2 (spectral tensor and homotopy-unit maps). §3.3 (ring acyclicity on the localized sphere); BordismFormalGroups F6.4 (smashing, orthogonality and chromatic fracture); §8.1 (module locality); GeneralizedCohomology G5.4 and BordismFormalGroups F3 (KU and Adams-summand class comparison). BordismFormalGroups F6.1/F6.3 (the two local categories and telescope source-independence); GeneralizedCohomology G5.4 (real and complex K spectra); the height-one calculations of this subsection. BordismFormalGroups F3 (BP⟨n⟩, its v_n-cofiber sequences and E(n)=v_n⁻¹BP⟨n⟩), F6.3 (⟨K(i)⟩≤⟨T(i)⟩) and F6.4 (⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩); §3.2 (telescope orthogonality and the periodic-group criterion); GeneralizedCohomology G2 (filtered v_n inversion).

## Layer 9: Norms, Tate spectra and blueshift

### 9.1 Localized norms and Tate spectra

Use the coherent finite-group norm and Tate construction of the supplier contracts. For an E-local spectrum X with coherent G-action, the norm in Sp_E is L_E(X_hG)→X^hG, and its cofiber is L_E(X^tG). The fixed points are already E-local because local objects are closed under limits. The imported Tate module structure is compatible with this comparison. The comparison here is the passage to an arbitrary homological localization. (cm-tate, Definition 2.2 and Proposition 2.3, pp.2–3; cm-tate line 70).

*Proof route.* Compute colimits in Sp_E by applying L_E to ambient colimits, and limits by the fully faithful inclusion. Apply the exact functor L_E to the imported norm cofiber sequence; identify its target with X^hG. Transport the imported multiplicative and module structures through the symmetric monoidal localization.

**Checks.**

- For G trivial both localized norm and ambient norm are identities.

- For rational-local inputs, averaging by |G| gives norm equivalence.

- For G=1 the norm is id_X and its cofiber is 0. For a rational trivial C₂-action the degree 0 norm is multiplication by 2 on ℚ, with inverse 1/2; for H𝔽₂ it is 0 and the raw Tate object is nonzero.

*Needs:* BordismFormalGroups F6.1 (exact homological localization) and F6.5 (Borel norm, Tate cofiber and lax monoidal module structure).

### 9.2 Localized transfer splitting

For a homological localization L and finite G, these are equivalent: every G-object in LSp has norm equivalence; L((LS)^tG)=0 for the trivial action on LS; the transfer Σ∞_+BG→S admits a section after L. If these properties hold for prime-order groups they hold for every finite group. The transfer Σ∞_+BC_p→S admits a section after Ω^(∞+1), by Kahn–Priddy in its cyclic-group form. (cm-tate, Lemma 2.1, Proposition 2.3, Lemma 2.4 and Theorem 2.5, pp.2–3; cm-tate line 75).

*Proof route.* Construct the cyclic Kahn–Priddy section after Ω^(∞+1), including the suspension shift. For a homological localization L, use the module action on Tate to reduce all local G-objects to the Tate algebra of LS. Relate a transfer section to a norm class restricting to 1, then prove that class is a unit by the connected-space cohomology argument. Use subgroup transfers and induction to reduce finite groups to prime-order groups; do not average at a noninvertible prime.

**Checks.**

- For rational localization the section follows by dividing by |G|.

- On rational degree 0 classes the C₂ transfer is 2 and a section is 1/2; at C₃ the values are 3 and 1/3. The augmentation has its basepoint section before localization, while the integral transfer has degree |G| and has no integral degree 0 section for |G|>1.

- For rational trivial actions of C₂ and S₃, the transfer on degree-zero constants is 2 and 6, with sections 1/2 and 1/6. The S₃ case tests a nonabelian group; averaging is used here only because these integers are invertible.

*Needs:* §9.1 (localized norms); BordismFormalGroups F6.5 (transfer, module action and subgroup functoriality); the cyclic Kahn–Priddy section and prime-order reduction constructed in this subsection.

### 9.3 Kuhn’s telescopic Tate vanishing

For n≥1, every finite group G and every T(n)-local spectrum X with coherent G-action, L_(T(n))(X^tG)=0. Equivalently L_(T(n))(X_hG)→X^hG is an equivalence. In particular the norm sequence becomes split after T(n)-localization. A raw Tate spectrum of a T(n)-local object need not vanish. (cm-tate, Theorem 2.6 and Corollary 2.7, pp.3–4; cm-tate line 118; kuhn-tate, Theorem 1.5 and Corollary 1.7, manuscript pp.4–5; kuhn-tate line 151).

*Proof route.* Apply the Bousfield–Kuhn functor, with one suspension shift as required, to the unstable Kahn–Priddy section. Obtain a localized stable transfer section at every prime-order group, then use the transfer criterion and finite-group reduction. Use the local-category cofiber convention to state the conclusion; raw Tate vanishing is not inferred.

**Checks.**

- At height zero in a p-local rational category norm equivalence is elementary averaging.

- For X=KU_p^∧ and G=C_p with trivial action, raw Tate can be nonzero while its T(1)-localization vanishes.

- For X=KU_p^∧ with trivial C_p-action the raw π₀ is ℚ_p(ζ_p)≠0 while L_T(1) of the Tate spectrum is 0. For G=1 the raw cofiber is 0. At a prime q≠p, q is invertible on p-local coefficients and the norm is invertible by averaging.

- For G=C₂ or S₃ and X=Ind_1^G L_(T(n))S, Shapiro identifies both localized orbits and fixed points with L_(T(n))S. The norm is the identity under these identifications and its raw Tate cofiber is 0; no inversion of |G| enters this induced-object Check.

*Needs:* §9.2 (transfer criterion, Kahn–Priddy and prime-order reduction); §5.2 (Bousfield–Kuhn with suspension shift); §9.1 (localized cofiber comparison).

### 9.4 Finite-local Tate blueshift

For n≥1, if X is L_n^(p,f)-local with a coherent C_p-action, then its raw Tate spectrum X^tC_p is L_(n−1)^(p,f)-local. The p-local Hℚ finite convention satisfies the corresponding statement. This lowers the upper finite-height bound by one and permits a further drop; it asserts neither zero Tate nor exact height n−1 for every X. (cmnn, Introduction preceding Theorem C, p.3; proof of Theorem 4.10, p.21; cmnn line 99; lmmt, Remark 3.9, p.16; lmmt line 625).

*Proof route.* First prove the raw Tate vanishing lemma for a trivial-action v_n telescope by Kuhn’s module argument, in addition to localized vanishing. Finite dualizable smash commutes with Tate. Apply this to finite type-n test objects and use the Tate algebra of the finite-local sphere and its unital action on every coherent equivariant module. Its finite-type cofiber/telescope filtration gives an actual lower-local sphere Tate algebra, hence lower-locality of its modules. Verify the finite-local mapping-space criterion on every shifted compact generator. This is stronger than the vanishing of the top localized Tate object, which alone does not imply lower-locality.

**Checks.**

- The n=1 output is p-inverted, or rational when the input is p-local.

- At n=1 the raw KU_p^∧ Tate output has p invertible and is rational, so it is L₀^f-local. For X=0 the output is 0, demonstrating a drop beyond exact height n−1.

*Needs:* §9.3 (telescopic Tate vanishing); §4.1–§4.3 (finite towers and kernels); BordismFormalGroups F6.3/F6.5 (finite dualizability and Tate module action); the raw-telescope Tate lemma and lower-locality argument of this subsection.

### 9.5 Nonzero raw Tate spectra

For the trivial C_p-action on KU_p^∧, identify π₀((KU_p^∧)^tC_p) with ℚ_p(ζ_p), including ℚ₂ at p=2. This is nonzero, whereas its T(1)-localization vanishes. Compare the specified trivial-action sphere Tate spectrum with S_p^∧ through RefinedTraceMethods §2.3’s Segal comparison: the sphere is not a T(n)-local input to the telescopic vanishing theorem. (greenlees-sadofsky, Corollary 2.4, p.400; greenlees-sadofsky line 343; hesselholt-ku, p.844; hesselholt-ku line 1658; cm-tate, Remark 2.8, p.4; cm-tate line 129).

*Proof route.* Apply the cyclic Tate comparison with the inverse Thom tower of the faithful complex line, and prove its completed KU Euler-inversion identification, with the inverse-limit and periodicity convergence conditions. Compare with the uncompleted KU formula in hesselholt-ku line 1658; the completed comparison is proved using the same oriented tower, rather than assuming Tate commutes with completion. In KU⁰(BC_p) the relation is (1+z)^p−1=0. After inverting z it becomes ((1+z)^p−1)/z=0. Weierstrass preparation identifies the resulting quotient with ℤ_p[ζ_p][1/(ζ_p−1)]=ℚ_p(ζ_p). Establish the K(1)-locality of KU_p^∧ before invoking telescopic vanishing: inverting the Bott class in BordismFormalGroups F3’s Adams splitting gives KU_(p)≃∏_(i=0)^(p−2)Σ^(2i)E(1) at odd p and KU_(2)≃E(1); E(1) is E(1)-local by F6.5, being Landweber exact with E(1)_*/(p,v₁)=0; and F6.5’s formula at n=1, whose type-one tower is cofinal with the Moore spectra S/pⁱ, identifies L_(K(1))KU_(p) with holim_i KU/pⁱ=KU_p^∧. RefinedTraceMethods §6.8’s formula L_(K(1))X≃(L_(KU)X)_p^∧, applied to X=KU, gives the same conclusion directly. Use the Segal comparison only for the separate sphere example.

**Checks.**

- At p=2 the displayed field is nonzero.

- After T(1)-localization the KU example vanishes, agreeing with Kuhn’s theorem.

- At p=2, ((1+z)²−1)/z=2+z, so z=−2 and inverting z gives ℚ₂. At p=3 the equation is z²+3z+3=0, an Eisenstein polynomial, and the result is ℚ₃(ζ₃). Both are nonzero; their positive finite-height localizations are 0.

*Needs:* §9.3 (localized Tate vanishing); §8.3 (height-one class equality); GeneralizedCohomology G5.4 (oriented KU); BordismFormalGroups F3 (Adams splitting of ku_(p) with its Bott action) and F6.5 (E(n)-locality of Landweber-exact theories and the K(n)-localization formula), or RefinedTraceMethods §6.8 (K(1)-localization as p-completed KU-localization); RefinedTraceMethods §2.3 (Segal comparison); the Euler-inversion calculation in this subsection.

### 9.6 Higher semiadditivity and the sharp connectivity bound

Let C be a presentable stable ∞-category and q:A→B a map of spaces whose homotopy fibers are π-finite with homotopy groups zero above degree m. Construct the canonical Hopkins–Lurie norm Nm_q:q_!→q_* between left and right Kan extension along q, inductively in m: for m=−2 it is the inverse of the identification of both functors with pullback along the equivalence q, and in general Nm_q is built from the inverse of the norm of the diagonal A→A×_BA, whose fibers are loop spaces of those of q. Call q C-ambidextrous when every norm in this induction is an equivalence. C is m-semiadditive when every such map with fibers truncated at m is C-ambidextrous, and ∞-semiadditive when it is m-semiadditive for every m. For q:BG→* and a finite group G, Nm_q is identified with BordismFormalGroups F6.5’s finite-group norm under the equivalence of Fun(BG,C) with coherent G-objects; that comparison is part of this target, and the finite-group norm keeps its owner. In an m-semiadditively symmetric monoidal C, a π-finite space A truncated at m has a cardinality |A|∈π₀End(1_C), the composite of the unit of q*, the inverse norm and the counit. (csy, Definitions 3.1.5 and 3.1.10, pp.33–34; csy line 1632 and line 1692; the cardinality |A|, p.80; csy line 3898).

Prove that for every n≥1 the category Sp_T(n) of T(n)-local spectra and the category of K(n)-local modules over a Morava E-theory E_n of height n are ∞-semiadditive; the rational category Sp_ℚ is ∞-semiadditive by averaging, and it is the p-local height-zero case. Sp_T(0) on all spectra, with T(0)=S[1/p], is not 1-semiadditive, because primes q≠p are not inverted there. (csy, Theorem 5.3.1, p.79; csy line 3882).

Consequently, for every n≥0 and every map f:A→B of spaces whose homotopy fibers are π-finite and n-connected, Σ∞_+f is a T(n)-equivalence, with Hℚ in place of T(0) at n=0. For every localization L of p-local spectra with L(F(n+1))=0 for a finite type-(n+1) spectrum F(n+1), the map L(Σ∞_+f) is an equivalence. (csy, Theorem 5.3.5 and Corollary 5.3.7, pp.80–81; csy line 3930 and line 3970).

Define a weak ring as a spectrum R with maps η:S→R and μ:R⊗R→R such that μ∘(η⊗id_R) is the unit identification S⊗R→R; no associativity and no right unit law are imposed. For every n≥0 and every nonzero p-local weak ring R the following are equivalent: F(n+1)⊗R=0 for some finite type-(n+1) spectrum F(n+1); Σ∞K(C_p,n+1)⊗R=0; K(j)⊗R=0 for every n<j≤∞, including K(∞)=H𝔽_p. For every p-local spectrum E, Σ∞K(C_p,n+1)⊗E=0 is equivalent to Σ∞_+g⊗E being an equivalence for every map g of π-finite spaces that induces an equivalence on n-th Postnikov sections. (csy, Definition 5.1.4, p.73; Theorem 5.4.4 and Remark 5.4.5, pp.83–84; csy line 3616, line 4036 and line 4060).

The sharp connectivity theorem: in §6.3 and §6.4 the integer m can be taken to be n+1, for every n≥1 and every p. Thus every (n+1)-connective pointed space F with π_kF⊗ℤ[1/p]=0 for k≥2 and vanishing v_i-periodic homotopy for 1≤i≤n has L_n^(p,f)-acyclic reduced suspension spectrum; the map statement of §6.3 holds for (n+1)-connective maps; and Σ∞Ω∞ preserves (n+1)-connective L_n^(p,f)-equivalences. (lmmt, Remark 2.12, p.10; lmmt line 406; csy, Theorem E, p.5; csy line 173).

The construction has the following API.

- Ambidexterity is stable under base change and composition, and a map is ambidextrous when each of its fibers is; for C m-semiadditive, the norms of maps with fibers truncated at m are natural in C along functors preserving the relevant limits and colimits.

- A colimit-preserving symmetric monoidal functor between m-semiadditive categories preserves cardinalities. In Sp_T(n), |B^kC_p| is invertible for every k≥n≥1.

- If a space X has K(n)_1(X)=0 and K(n)_0(X) of finite dimension d over K(n)_0=𝔽_p, then X is dualizable in K(n)-local E_n-modules with dimension d (csy, Lemma 5.1.7, p.73; csy line 3639). For X=B^kC_p the dimension is p^(binom(n,k)), for every k≥0.

- A colimit-preserving symmetric monoidal functor from a 1-semiadditive presentably symmetric monoidal stable p-local category C to such a category D, which detects invertibility on π₀ of units and sends the spaces B^kC_p to objects of rational nonzero dimension, makes C and D ∞-semiadditive.

*Proof route.* Construct the inductive norms, their base change and composition laws, and cardinalities in the generality of local systems valued in an ∞-category with the relevant limits and colimits. Prove the bootstrap theorem: under the three hypotheses just listed, an induction on k shows that |B^kC_p| has rational nonzero image and that C is (k+1)-semiadditive, using the semiadditive power operation on π₀End(1_C) (csy, §4 and Theorem 4.3.10, pp.68–69; csy line 3445). Apply it to E_n[−]:Sp_T(n)→K(n)-local E_n-modules, X↦L_(K(n))(E_n⊗X). Its hypotheses are: 1-semiadditivity of Sp_T(n), which is §9.3 together with the identification of canonical and finite-group norms; detection of invertibility, from nil-conservativity of L_(K(n)) on Sp_T(n) (support of T(n) equal to {n}, §3.2(c)) and conservativity of E_n⊗(−) on K(n)-local spectra (csy, Proposition 5.1.15 and Corollary 5.1.17, pp.76–77; csy line 3753 and line 3773); and the dimension formula, from the Ravenel–Wilson computation that K(n)_*(K(ℤ/p,k)) is even and of rank p^(binom(n,k)) over K(n)_* (csy, Corollary 5.1.9, p.74; csy line 3655, which quotes Ravenel–Wilson Theorem 9.2). The Ravenel–Wilson computation for all 0≤n<∞ and k≥0 is a target of this subsection. For the T(n)-equivalence, reduce to B=* by the fiberwise Kan-extension formula of §6.2, then induct up the Postnikov tower of the π-finite n-connected space A. Groups of order prime to p contribute nothing p-locally. Each layer B^kC_p with k>n is handled by the cardinality criterion for connected ambidextrous spaces together with invertibility of |B^(k−1)C_p| (csy, Proposition 3.1.18, p.37, and Lemma 5.3.4, p.80; csy line 1909 and line 3923). For a localization L killing F(n+1), L factors through the p-local finite localization L_n^f, which is localization at T(0)⊕⋯⊕T(n) (BordismFormalGroups F6.3). In the weak-ring criterion, the first condition implies the second by applying the localization statement to K(C_p,n+1)→*. The second implies the third: if K(j)⊗R≠0 for some j>n, then K(j)-local spectra are R-local (csy, Lemma 5.1.12, p.75; csy line 3705), so K(j)⊗Σ∞K(C_p,n+1) is R-local and R-acyclic, hence zero; this contradicts Ravenel–Wilson for finite j, since binom(j,n+1)≥1, and contradicts H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p for j=∞. The third implies the first: choose F(n+1) a weak ring; F(n+1)⊗R is a weak ring with empty Morava support, so it is zero by the weak-ring nilpotence theorem derived from smash nilpotence (csy, Theorem 5.1.14, p.76; csy line 3731). For the sharp bound, given F as stated, let m be the integer of §6.3 and assume m>n+1. The cover F⟨m⟩→F is a v_i-periodic equivalence by §3.2(b), so F⟨m⟩ satisfies the hypotheses of §6.3 and is T(i)-acyclic for 1≤i≤n. By §6.2, Σ∞_+F→Σ∞_+τ_≤(m−1)F is a T(i)-equivalence. The truncation has finitely many nonzero homotopy groups, all p-primary torsion and in degrees k≥n+1>i. Each K(π_k,k) is the filtered colimit of K(A,k) over finite subgroups A, and K(A,k)→* has π-finite (k−1)-connected fiber with k−1≥i. So the T(n)-equivalence theorem at height i, filtered colimits and §6.2 up the Postnikov tower give T(i)⊗Σ∞F=0. S[1/p]-acyclicity is as in §6.3. The map statement and §6.4 then follow by their proofs in Layer 6 with m=n+1.

**Checks.**

- Sp_(p) is not 1-semiadditive: for the trivial C_p-action on H𝔽_p, π_k(H𝔽_p^tC_p) is the Tate cohomology Ĥ^(−k)(C_p;𝔽_p)=𝔽_p in every degree, so the norm for BC_p→* is not invertible. In Sp_ℚ the C_p-norm on Hℚ is multiplication by p on π₀, which is invertible.

- The dimension of BC_p in K(n)-local E_n-modules is p^n: E_n^0(BC_p)=E_n^0[[z]]/[p](z) is free of rank p^n by Weierstrass preparation, giving p and p² at heights 1 and 2. At n=k=2 the formula p^(binom(n,k)) gives p, whereas the plausible alternative p^(nk) gives p⁴. For k>n it gives 1, matching the vanishing reduced K(n)-homology of K(ℤ/p,k); p^(nk) would contradict it.

- At n=1 the map BC_p→* has π-finite but only 0-connected fiber, and K(1)⊗Σ∞BC_p≠0 because K(1)^*(BC_p) has rank p>1; so the n-connectivity hypothesis cannot be weakened to (n−1)-connectivity. The 1-connected K(C_p,2)→* has rank p^(binom(1,2))=1, so its reduced K(1)-homology is 0, as the theorem predicts.

- For R=H𝔽_p, all finite K(j)⊗R vanish, but K(∞)⊗R≠0 and H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p. Omitting j=∞ from the weak-ring criterion would incorrectly force the latter group to be zero.

- For Q_i of §3.3 with 1≤i≤n, K(j)⊗Q_i=0 for j>n including ∞, while K(i)⊗Q_i≠0; the criterion gives Q_i⊗Σ∞K(C_p,n+1)=0. For R=Hℚ at n=0, F(1)⊗R=0 with F(1)=S/p, H̃_*(BC_p;ℚ)=0 and K(j)⊗Hℚ=0 for 1≤j≤∞, so all three conditions hold.

- At n=1 the sharp bound is m=2. K(ℤ/p,2) is 2-connective, bounded and p-torsion, hence T(1)-acyclic; BC_p=K(ℤ/p,1) is bounded and p-torsion with zero periodic groups but only 1-connective, and T(1)⊗Σ∞BC_p≠0 because ⟨K(1)⟩≤⟨T(1)⟩. So m=n+1 cannot be lowered to n.

*Needs:* §9.3 (telescopic Tate vanishing, giving 1-semiadditivity) and §9.1 (localized norms); §3.2 (support of T(n), cover invariance); §3.3 (the unital telescope model, for the Check); §6.2 (fiberwise comparison) and §6.3–§6.4 (the integer m and the Layer 6 proofs), for the sharp bound; §7.1 and EllipticCohomology E2 (Morava E-theory at every height); BordismFormalGroups F1/F5 (p-series and Weierstrass preparation), F6.1 (Bousfield localization), F6.2 (smash nilpotence with the H𝔽_p endpoint), F6.3 (type, periodicity and finite localization) and F6.5 (finite-group norms, coherent local systems and pointwise Kan extensions); StableHomotopyKTheory §3.18 (Postnikov towers); the inductive norms, bootstrap theorem, dimension formula and Ravenel–Wilson computation constructed in this subsection.

### Examples

For the trivial C₂-action on Hℤ, π_n(Hℤ^tC₂) is the Tate cohomology Ĥ^(−n)(C₂;ℤ): ℤ/2 for even n and 0 for odd n. The Tate spectrum is a sum of shifted copies of H𝔽₂, so S[1/2] and every T(i) with i≥1 annihilate it although it is nonzero. Hℤ is not L_n^(p,f)-local for any n at p=2, its localization being Hℤ[1/2], so this nonzero Tate spectrum does not conflict with §9.4. (cm-tate, Definition 2.2, p.2; cm-tate line 70.)

### Dependencies

BordismFormalGroups F6.1 (exact homological localization) and F6.5 (Borel norm, Tate cofiber and lax monoidal module structure). §9.1 (localized norms); BordismFormalGroups F6.5 (transfer, module action and subgroup functoriality); the cyclic Kahn–Priddy section and prime-order reduction constructed in this subsection. §9.2 (transfer criterion, Kahn–Priddy and prime-order reduction); §5.2 (Bousfield–Kuhn with suspension shift); §9.1 (localized cofiber comparison). §9.3 (telescopic Tate vanishing); §4.1–§4.3 (finite towers and kernels); BordismFormalGroups F6.3/F6.5 (finite dualizability and Tate module action); the raw-telescope Tate lemma and lower-locality argument of this subsection. §9.3 (localized Tate vanishing); §8.3 (height-one class equality); GeneralizedCohomology G5.4 (oriented KU); BordismFormalGroups F3 (Adams splitting of ku_(p) with its Bott action) and F6.5 (E(n)-locality of Landweber-exact theories and the K(n)-localization formula), or RefinedTraceMethods §6.8 (K(1)-localization as p-completed KU-localization); RefinedTraceMethods §2.3 (Segal comparison); the Euler-inversion calculation in this subsection. §9.3 (telescopic Tate vanishing, giving 1-semiadditivity) and §9.1 (localized norms); §3.2 (support of T(n), cover invariance); §3.3 (the unital telescope model, for the Check); §6.2 (fiberwise comparison) and §6.3–§6.4 (the integer m and the Layer 6 proofs), for the sharp bound; §7.1 and EllipticCohomology E2 (Morava E-theory at every height); BordismFormalGroups F1/F5 (p-series and Weierstrass preparation), F6.1 (Bousfield localization), F6.2 (smash nilpotence with the H𝔽_p endpoint), F6.3 (type, periodicity and finite localization) and F6.5 (finite-group norms, coherent local systems and pointwise Kan extensions); StableHomotopyKTheory §3.18 (Postnikov towers); the inductive norms, bootstrap theorem, dimension formula and Ravenel–Wilson computation constructed in this subsection.

## Layer 10: Commutative rings and chromatic height

### 10.1 Morava power operations

Define a Dₚ-algebra to be a spectrum R with η:S→R and μ:R⊗R→R that is unital, associative and commutative in the homotopy category, together with θ:(R^⊗p)_hC_p→R. The cyclic group permutes the factors; the composite R^⊗p→(R^⊗p)_hC_p→R must be the iterated product. Require also θ∘(η^⊗p)_hC_p=η∘ε_S as maps (S^⊗p)_hC_p→R, where ε_S:(S^⊗p)_hC_p→S is the sphere’s extended multiplication. This last square fixes the unit, beyond merely fixing the underlying p-fold product. Every E∞ ring and every H∞ ring supplies such data. (hahn, Definition 1.2 and its following paragraph, p.1; hahn line 22).

The construction has the following API.

- Forgetting Dₚ data gives a homotopy-commutative unital magma, so §3.3 applies.

- The chosen θ gives the weight-p operation on π₀ by applying cyclic extended powers to a representative S→R. Its unit square gives P(1)=1, and P(0)=0.

- An E∞ ring supplies θ by restriction of its extended multiplication, compatibly with its unit and products.

**Checks.**

- Retain only the Dₚ data of H𝔽_p. Then P(0)=0, P(1)=1, and K(0)⊗H𝔽_p=K(1)⊗H𝔽_p=0, although H𝔽_p≠0.

- A zero θ on nonzero H𝔽_p gives P(1)=0≠1 and violates the unit square.

- For r≥1, K(r−1)⊗K(r)=0 and K(r)⊗K(r)≠0. Thus a chosen bare multiplication on K(r) cannot be promoted to these Dₚ data, by §10.2; the cyclic factorization hypothesis is substantive.

For height-(h+1) Morava E-theory E with h≥0 and π₀E=W(𝔽_(p^(h+1)))[[u₁,…,u_h]], define a K(h+1)-local Dₚ-E-algebra as a K(h+1)-local E-module R with unit E→R and product R⊗_E R→R forming a commutative associative algebra in the homotopy category of E-modules, and an E-linear factorization θ_E:(R^⊗_E p)_hC_p→R of the p-fold product. This relative definition has exactly Definition 3.1’s data; it does not add an E∞ structure or a separate relative unit square. Construct P:π₀R→R⁰(BC_p) using (E^⊗_E p)_hC_p→(R^⊗_E p)_hC_p→R on a class E→R. For 1≤k<h, after reducing by I_(k+1)=(p,u₁,…,u_k), define g_(k+1) by [p](z)=z^(p^(k+1))g_(k+1)(z). If x maps to zero in π₀ of R/(p,u₁,…,u_k), then P(x) maps to zero in π₀ of R^BC_p/(p,u₁,…,u_k,g_(k+1)). These are iterated module cofibers, not ordinary ring quotients for arbitrary R. For R=E with its E∞ operation, regular even coefficients give the quotient ring operation used in the valuation calculation; its transfer generator is [p](z)/z. Prove the k=0 Bockstein case separately when used. (hahn, Definition 3.1, Example 3.2 and Theorem 3.3, p.5; hahn line 187 and line 198; §2, pp.3–4; Theorem 1.6, p.2; Definition 4.1, p.8).

The construction has the following API.

- A class x induces the weight-p extended-power class P(x), with P(0)=0.

- For an absolute Dₚ-algebra A, L_(K(h+1))(E⊗A) has the displayed relative structure. For a coherent E∞ E-algebra, the operation preserves unit and multiplication and is additive modulo the transfer ideal; these E∞ laws are retained as consequences.

- The general relative operation has the module-cofiber zero-detection property just stated. In the regular even E∞ coefficient case it gives the corresponding ring quotient operation; compatibility with the chosen Morava coordinate is explicit.

*Proof route.* Apply the chosen θ_E to the cyclic extended power of a class. Compute the coefficient transfer ideal from the oriented p-series. Prove the invariant-ideal divisibility and the equivariant Bockstein section after the g_(k+1) quotient. This proves zero-detection on iterated module cofibers at the relative Dₚ hypotheses; only regular even coefficients identify those cofibers with ordinary quotient rings. Establish k=0 separately with the first Bockstein. The height-one case h=0 in §10.2 uses the Dₚ form of the characteristic-p May-nilpotence argument instead (hahn, Remark 1.5 and footnote 1, p.2; hahn line 43 and line 87).

**Checks.**

- For R=E with its supplied E∞ operation, P(1)=1 and P(xy)=P(x)P(y).

- For the zero relative E-algebra, π₀R=π₀(R^BC_p)=0 and P is the zero map, with 1=0. For R=E at p=2, changing the relative factorization by multiplication with 1+z still restricts to the original product at z=0, but sends 1 to 1+z≠1. Definition 3.1 alone therefore does not impose the absolute unit square. The E∞ specialization uses the specified coherent factorization.

- For the coherent E∞ specialization, P(1)=1 and P(0)=0; the unquotiented cross term in P(1+1) is a transfer, not declared 0. At p=2 and h=2, so that π₀E=W(𝔽₈)[[u₁,u₂]] and E has height 3, the 2-series modulo 2 is u₁z²+_F u₂z⁴+_F z⁸ in the chosen p-typical normalization; g₂=[2](z)/z⁴ exists only modulo (2,u₁), the case k=1, where its leading coefficient is u₂. The form u₁z²+_F z⁴ is the h=1 series, for which the range 1≤k<h is empty.

For h≥1 let E be the height-(h+1) Morava E-theory of the Honda formal group over 𝔽_(p^(h+1)), with its E∞ structure and trivial C_p-action, a fixed p-typical complex orientation BP→E sending v_i to u_iu^(1−pⁱ), and z∈E⁰(BC_p) equal to u⁻¹ times the Euler class of the standard complex representation of C_p, so that E⁰(BC_p)=E⁰[[z]]/[p](z) and π₀E^tC_p=z⁻¹E⁰(BC_p). Define the Tate-valued Frobenius ϕ:E→E^tC_p as AInfCohomology §AI.7.2’s Tate diagonal E→(E^⊗p)^tC_p followed by the Tate construction of the C_p-equivariant p-fold multiplication of E; it is an E∞ ring map, and on π₀ it is P followed by inversion of z, so that composite is a ring map although P is not additive. Prove the following valuation descent. (hahn, Remark 2.2, Definitions 2.3–2.4 and Lemma 2.5, pp.3–4; hahn line 131, line 136 and line 148; §4, Propositions 4.2, 4.3 and 4.5 and Corollaries 4.5.1–4.5.3, pp.8–10; hahn line 347, line 356, line 366, line 390, line 394 and line 415).

- For 0≤k≤h, ϕ(u_k)≡ϕ(u^(pᵏ−1))u_k/u^(pᵏ−1) modulo (p,u₁,…,u_(k−1)) in z⁻¹E⁰(BC_p).

- There is an H∞ ring map MUP→E from periodic complex bordism. If u is the image of the degree −2 periodicity generator under such a map, then ϕ(u)=u/(z·[2](z)⋯[p−1](z)), that is, u^p divided by the Euler class of the reduced complex regular representation of C_p. This is the theorem of Ando, generalized by Zhu, used in hahn line 380; an orientation that is only a homotopy ring map supplies no such formula.

- Weierstrass preparation gives a monic g(z)∈𝔽_p[[u_h]][z] of degree p^(h+1)−pʰ, congruent to z^(p^(h+1)−pʰ) modulo u_h and with constant term divisible by u_h but not u_h², such that E⁰(BC_p)/(p,u₁,…,u_(h−1),g_h(z))=𝔽_p[[u_h]][z]/(g(z)). This ring is a discrete valuation ring with uniformizer z.

- Normalize both valuations by val(u_h)=1, so val(z)=1/(p^(h+1)−pʰ). Then val(P(u_h))=(p−1)/(p^(h+1)−pʰ)=p^(−h), and every nonzero x∈𝔽_p[[u_h]] of positive valuation has val(P(x))<val(x).

- Coefficient extraction: for a K(h+1)-local Dₚ-E-algebra R and x∈E⁰ of positive valuation in E⁰/(p,…,u_(h−1))=𝔽_p[[u_h]] whose image in π₀(R/(p,…,u_(h−1))) is 0, write the image of P(x) as Σ_(j<p^(h+1)−pʰ) a_jz^j with a_j∈𝔽_p[[u_h]]. Some a_j has valuation below that of x and maps to 0 in π₀(R/(p,…,u_(h−1))). Consequently, if some x with nonzero image in 𝔽_p[[u_h]] maps to 0 there, then 1=0 in π₀(R/(p,…,u_(h−1))) and R≃0.

*Proof route.* For the congruence, compose BP⊗BP→E⊗E with the canonical map on the first factor and ϕ on the second; v_k goes to the images of η_L(v_k) and η_R(v_k), which agree modulo I_k in BP_*BP. Construct MUP as the commutative Thom ring spectrum of the coherent symmetric diagram of virtual complex bundles of every virtual dimension, extending the commutative Thom model of MU, so π_*MUP=π_*MU[u^(±1)] with |u|=−2. Construct the H∞ orientation by verifying, for a suitable coordinate of the Honda universal deformation, the norm-coherence condition comparing the total power operation with the quotient isogenies by subgroups of order p; then compute ϕ(u) from the multiplicativity of Thom classes under the H∞ structure. The valuation of ϕ(u)/u is −(p−1)/(p^(h+1)−pʰ) because each [k](z), 1≤k≤p−1, has the valuation of z. The congruence with k=h gives val ϕ(u_h)=1+(pʰ−1)·val(ϕ(u)/u)=p^(−h). Any x is a unit times a power of u_h, and P of a unit is a unit because P is multiplicative with P(1)=1. For coefficient extraction, the general relative zero-detection above at k=h−1, or the k=0 Bockstein case at h=1, kills the image of P(x) in R⁰(BC_p)/(p,…,u_(h−1),g_h(z)); realize the coordinate functional dual to z^j as an E-module map on the finite free E-module E^(BC_p) and apply it. Finally K(h+1)-locality of R and 1=0 in R/(p,…,u_(h−1)) force R≃0.

**Checks.**

- At p=2 and h=1, g has degree 2 and val(z)=1/2; ϕ(u)/u=1/z has valuation −1/2, and ϕ(u₁)=u₁/z has valuation 1/2=2^(−1). At p=3 and h=1, g has degree 6, val(z)=1/6, ϕ(u)/u=1/(z·[2](z)) has valuation −1/3, and ϕ(u₁)=u₁(ϕ(u)/u)² has valuation 1/3=3^(−1).

- If ϕ(u) were u, as for an operation ignoring the Euler class, ϕ(u_h) would have valuation 1, equal to that of u_h, and the descent would stall. For a second periodicity generator u′=wu with w∈(π₀E)^×, P(w) is a unit, so ϕ(u′)/u′ has the same valuation as ϕ(u)/u: the H∞ orientation fixes a generator for which the Euler-class formula holds, not the valuation.

- At h=1 the quotient ring 𝔽_p[[u₁]][z]/(g(z)) has residue field 𝔽_p and rank p²−p over 𝔽_p[[u₁]], so the coefficient sum has p²−p terms; at p=2 they are a₀+a₁z.

*Needs:* §7.1 (Morava realization in every finite height); BordismFormalGroups F6.5 (cyclic extended powers, transfers and Borel Tate constructions); BordismFormalGroups F1/F5 (p-series, height ideals, Weierstrass preparation and the Honda deformation) and F2–F3 (MU, BP, orientation coordinates and BP_*BP); GeneralizedCohomology G2 (spectral and E-module tensor, E∞ specialization and iterated module cofibers) and G5.3–G5.4 (coherent symmetric bundle diagrams and the commutative Thom model of MU); AInfCohomology §AI.7.2 (spectral Tate diagonal); the absolute and relative Dₚ structures, the Tate-valued Frobenius, MUP, the H∞ orientation and the valuation descent constructed in this subsection.

### 10.2 Hahn’s acyclicity theorem

For a Dₚ-algebra R and h≥0, K(h)⊗R=0 implies K(h+1)⊗R=0. Consequently T(h)⊗R=0 implies T(h+1)⊗R=0 for h≥0, with T(0)=S[1/p]. Every E∞ ring satisfies these conclusions. For h≥1 translate by §3.3’s homotopy-unital comparison; at h=0 use S[1/p]-acyclicity⇒Hℚ-acyclicity. (hahn, Theorems 1.1 and 1.3, p.1; hahn line 19 and line 35; §4, Propositions 4.2–4.5 and Theorem 4.6, pp.8–10; hahn line 422).

*Proof route.* Replace R by L_(K(h+1))(E_(h+1)⊗R), with the relative Dₚ structure from §10.1. For h≥1, K(h)-acyclicity makes a power of u_h zero modulo (p,u₁,…,u_(h−1)); §10.1’s valuation descent, which uses the H∞ orientation’s Euler-class formula and coefficient extraction, lowers the valuation of an annihilated element until 1 vanishes. Local completeness then forces this algebra to be 0. For h=0 use the Dₚ form of characteristic-p May nilpotence. Translate positive heights through §3.3 and the bottom height through S[1/p]-acyclicity⇒Hℚ-acyclicity.

**Checks.**

- The h=0 implication uses only the retained Dₚ data of H𝔽_p, which is nonzero but acyclic at all finite Morava heights.

- For H𝔽_p, K(0)∧R=0 and K(1)∧R=0 although R≠0. For K(h) at h≥1, K(h−1)∧K(h)=0 but K(h)∧K(h)≠0, showing the conclusion fails for a mere associative ring.

*Needs:* §10.1 (quotient operations, the Tate-valued Frobenius, the H∞ orientation and its Euler-class formula, valuation descent with coefficient extraction, and the h=0 case); §3.3 (ring acyclicity); §7.1 (Morava coefficients); BordismFormalGroups F5 (Weierstrass and regular coefficient comparisons).

### 10.3 Chromatic height of a commutative ring

For an E∞ ring R define ht_p(R)=inf{n∈ℤ | n≥−1 and T(n+1)⊗R=0}, valued in {−1,0,1,…,∞}; an empty set has infimum ∞. Hahn’s theorem makes the vanishing heights an upper interval. This definition uses T(0)=S[1/p] at the bottom, even for a ring not p-local; it differs from geometric height of an oriented formal group. (lmmt, Introduction, chromatic height discussion, pp.3–4; lmmt line 153; hahn, Theorem 1.1, p.1; hahn line 19).

The construction has the following API.

- For n≥−1, ht_p(R)≤n iff T(n+1)⊗R=0.

- An E∞ map R→S implies ht_p(S)≤ht_p(R).

- The height is ∞ iff every finite-height telescope has nonzero tensor with R.

- Height −1 is T(0)-acyclicity, not a criterion that R itself is zero.

*Proof route.* Use the well-order of integers at least −1 and the upward-closed vanishing set. Obtain threshold characterizations and monotonicity under E∞ maps from the induced module action.

**Checks.**

- ht_p(H𝔽_p)=−1 despite H𝔽_p≠0.

- ht_p(Hℚ)=0.

- For q≠p, ht_p(H𝔽_q)=0 with this all-spectra convention, although its p-localization is zero.

- ht_p(0)=−1, ht_p(H𝔽_p)=−1, ht_p(Hℚ)=0 and ht_p(H𝔽_q)=0 for q≠p. The last two have nonzero T(0)-smash and zero T(1)-smash, so the threshold is exactly 0.

*Needs:* §10.2 (Hahn upward acyclicity); §4.1 (all-spectra T(0) convention); GeneralizedCohomology G2 (module actions along E∞ maps).

### 10.4 Tate height converse

For a Dₚ-algebra R with trivial C_p-action and i≥0, K(i)-acyclicity of R^tC_p implies K(i+1)-acyclicity of R. Consequently, if L_(T(i))(R^tC_p)=0 then L_(T(j))R=0 for every j≥i+1. This includes every E∞ ring with trivial action. The intermediate statement needs less: for a K(i+1)-local homotopy E_(i+1)-algebra M, meaning a unital associative E-algebra in the homotopy category, K(i)-acyclicity of M^tC_p implies K(i)-acyclicity of M, with no Dₚ structure on M needed. (hahn, Corollary 4.6.1 and Proposition 4.7, pp.9–10; hahn line 432 and line 442; cmnn, Theorem 4.6 and Lemma 4.7, pp.19–20; cmnn line 827).

*Proof route.* For i≥1 compute E_(i+1)⁰(BC_p) by Weierstrass preparation, prove finite freeness and E^tC_p⊗_E M≃M^tC_p for trivial-action K(i+1)-local E-modules. After quotienting by (p,u₁,…,u_(i−1)) and inverting u_i, identify a nonzero faithfully flat algebra over k((u_i)); this proves the homotopy-E-algebra intermediate comparison. Apply it to L_(K(i+1))(E⊗R), whose Tate object receives a homotopy-unital action from R^tC_p. The action and unit retract transfer K(i)-acyclicity to that object without requiring a coherent module structure on R. Use §10.2 to get K(i+1)-acyclicity of R, iterate it, and apply §3.3 for the positive-height telescopic conclusions. For i=0, S[1/p]-acyclicity of R^tC_p implies rational acyclicity; use the rational Euler-inversion comparison, with no negative-index u-parameter or ideal.

**Checks.**

- For R=Hℚ the C_p Tate spectrum is 0, and all T(j)∧R are 0 for j≥1. For R=KU_p^∧, L_T(1)(R^tC_p)=0 and T(2)∧R=0, but T(1)∧R≠0; the conclusion cannot start at j=i.

- After forgetting H𝔽_p to its Dₚ data, its trivial-action Tate spectrum still has H𝔽_p-module structure, so K(i)⊗(H𝔽_p)^tC_p=0 for every finite i; the conclusion gives K(i+1)⊗H𝔽_p=0. The zero homotopy E-algebra has M=M^tC_p=0, while for M=E_(i+1) both K(i)⊗M and K(i)⊗M^tC_p are nonzero, including the rational case i=0.

*Needs:* §10.1–§10.2 (power operations and Hahn); §3.3 (positive-height ring acyclicity); §7.1 (E_(i+1)); §9.1 (Tate base change); the faithfully flat coefficient calculation of this subsection.

### Examples

For R=Hℤ_(p), T(0)⊗R=Hℚ≠0 and T(1)⊗R=0, so ht_p(Hℤ_(p))=0. For R=KU_p^∧, T(1)⊗R≠0 because K(1)⊗KU≠0 and §3.3 applies to this ring, while T(2)⊗R=0 because K(2)⊗KU=0, so ht_p(KU_p^∧)=1; it agrees with the geometric height one of its multiplicative formal group. (lmmt, Introduction, p.3; lmmt line 153.)

### Dependencies

§7.1 (Morava realization in every finite height); BordismFormalGroups F6.5 (cyclic extended powers, transfers and Borel Tate constructions); BordismFormalGroups F1/F5 (p-series, height ideals, Weierstrass preparation and the Honda deformation) and F2–F3 (MU, BP, orientation coordinates and BP_*BP); GeneralizedCohomology G2 (spectral and E-module tensor, E∞ specialization and iterated module cofibers) and G5.3–G5.4 (coherent symmetric bundle diagrams and the commutative Thom model of MU); AInfCohomology §AI.7.2 (spectral Tate diagonal); the absolute and relative Dₚ structures, the Tate-valued Frobenius, MUP, the H∞ orientation and the valuation descent constructed in this subsection. §10.1 (quotient operations, the Tate-valued Frobenius, the H∞ orientation and its Euler-class formula, valuation descent with coefficient extraction, and the h=0 case); §3.3 (ring acyclicity); §7.1 (Morava coefficients); BordismFormalGroups F5 (Weierstrass and regular coefficient comparisons). §10.2 (Hahn upward acyclicity); §4.1 (all-spectra T(0) convention); GeneralizedCohomology G2 (module actions along E∞ maps). §10.1–§10.2 (power operations and Hahn); §3.3 (positive-height ring acyclicity); §7.1 (E_(i+1)); §9.1 (Tate base change); the faithfully flat coefficient calculation of this subsection.

## Layer 11: Real topological K-theory

### 11.1 Real Bott coefficients

For every prime p and n≥1, the supplied multiplicative connective-cover map ko→KO is a T(n)-equivalence. For every associative ko-algebra A, the induced map A→A[β⁻¹] is also a T(n)-equivalence, where β is the image of the degree-eight real Bott class and inversion is derived localization over ko. Retain the supplied coefficient ring ℤ[η,α,β]/(2η,η³,ηα,α²−4β) only as its normalization, with degrees 1,4,8; these coefficient and real Bott constructions keep their owners. (abs, Theorems 6.9 and 11.5, pp.15–16,28–29; locator-only, uncertified; lmmt, Corollary 4.19 proof, p.21; lmmt line 878).

*Proof route.* The fiber of ko→KO is bounded above; positive-height periodic homotopy is insensitive to that fiber. Then use A[β⁻¹]≃A⊗_koKO and smash the relative tensor comparison with T(n). Real Bott and the Clifford coefficient ring are inputs, rather than additional constructions.

**Checks.**

- At degree four the relation is α²=4β, not α²=β.

- The connective-cover assertion uses n≥1; rationalization detects the negative KO groups.

- α²=4β gives complexification (2b²)²=4b⁴ on both sides; α²=β would give 4b⁴=b⁴ over ℤ, which is false. Rational π_−8ko=0 and π_−8KO=ℚ after rationalization, so height 0 inversion is not an equivalence.

*Needs:* GeneralizedCohomology G5.4 (ko→KO and E∞ Bott inversion); HomotopySpheres §4B (real Bott theorem); TopologicalKTheory T7 (Clifford-module coefficients); §3.2 (positive-height connective-cover invariance); GeneralizedCohomology G2 (relative tensor base change).

### Examples

For real topological K-theory, π₀ko=π₀KO=ℤ, π₁ko=π₂ko=ℤ/2 and π₃ko=0; π₈KO=ℤ generated by β. Under complexification β maps to b⁴, which has degree 8. (abs, Proposition 6.8, Theorems 6.9 and 11.5, pp.15–16,28–29; locator-only, uncertified; lmmt, Corollary 4.19 and proof, p.21; lmmt line 876).

**Checks.**

- π₀ko=π₀KO=ℤ, with rank giving the coefficient identification.

- π₁ko=π₂ko=ℤ/2 and π₃ko=0; replacing ko by complex ku fails this test.

- β has degree eight, while the imported complex Bott class has degree two.

### Dependencies

GeneralizedCohomology G5.4 (ko→KO and E∞ Bott inversion); HomotopySpheres §4B (real Bott theorem); TopologicalKTheory T7 (Clifford-module coefficients); §3.2 (positive-height connective-cover invariance); GeneralizedCohomology G2 (relative tensor base change).

## Layer 12: Topological modular forms

### 12.1 Affineness of elliptic spectral geometry

For X=M̄_ell or M_ell equipped with Otop, global sections give a symmetric monoidal equivalence QCoh(X,Otop)≃Mod_(Γ(X,Otop)). In particular Γ on these quasicoherent spectral modules preserves all colimits. Tensoring a fixed spectrum V with a quasicoherent Otop-module is quasicoherent, and V⊗Γ(M)≃Γ(V⊗M). This theorem is specific to these spectral stacks; it is not ordinary affineness of the underlying algebraic moduli stack. (mm, Theorem 7.2, pp.35–37; mm line 1729; lmmt, Corollary 4.21 proof, p.22; lmmt line 914).

*Proof route.* Prove 0-affineness for the smooth and compactified elliptic spectral stacks by the formal-group moduli comparison and the Mathew–Meier descent argument. Identify the inverse of global sections as extension of scalars along the section algebra. The equivalence is symmetric monoidal and preserves colimits, so tensoring with any spectrum V gives the stated projection comparison for quasicoherent spectral modules.

**Checks.**

- T(2)⊗Tmf≃Γ(T(2)⊗Otop) follows for this quasicoherent module.

- For an affine chart Spec A, Γ(O⊗V)=A⊗V. For V=0 both sides are 0; for V=S both are Γ(O); for V=S∨ΣS both are Γ(O)∨ΣΓ(O). Arbitrary sheaves are excluded by quasicoherence.

*Needs:* EllipticCohomology E1–E3 (the two spectral stacks and Otop); gap:spectral-ringed-sites; §8.1 (height-local module comparison); the elliptic 0-affineness argument in this subsection.

### 12.2 Chromatic bounds for modular forms

For each prime, Tmf_(p) and TMF_(p) are L₂-local. The maps tmf→Tmf are T(n)-equivalences for all n≥1, both spectra are T(n)-acyclic for n≥3, and Tmf→TMF is a T(2)-equivalence. Consequently tmf→TMF→L_(K(2))TMF are T(2)-equivalences. These statements concern the input spectra; their algebraic K-theory consequences stay with the purity consumer. (lmmt, Corollary 4.21 proof, p.22; lmmt line 904; behrens, Propositions 1.6.8 and 1.6.12; chromatic fracture, pp.29–32; behrens line 1160 and line 1183).

*Proof route.* On each affine chart the formal group has geometric height at most two, including the height-one nodal boundary; apply finite-height locality and take the descent limit. Use connective-cover invariance at positive heights. For Tmf→TMF commute T(2) with global sections by affineness. Height-two support lies in the smooth open, so Δ inversion is already an equivalence on T(2)-localized sections. Apply the comparison between T(2) and K(2) on L₂-local spectra. Prove this support assertion on each chart: the discriminant-zero locus is nodal of formal height 1, so its T(2)-localized contribution is zero; apply the actual surviving discriminant localization to the quasicoherent module and then global sections.

**Checks.**

- For n≥3, T(n)∧Tmf=0 and T(n)∧tmf=0. At height 2, inversion of Δ²⁴ gives the same localization on both sides; at height 0 the connective cover loses negative rational modular-form classes.

*Needs:* EllipticCohomology E3–E4 (tmf→Tmf→TMF and actual Δ²⁴ inversion); §12.1 (spectral affineness); §8.1–§8.2 (height locality and restricted telescope comparison); §3.2 (connective-cover invariance); ModularCurves §7E (formal-height strata).

### 12.3 Full-level Galois extensions

For a finite group G, a faithful G-Galois extension A→B of E∞ rings consists of a coherent G-action by A-algebra maps such that A→B^hG and B⊗_A B→∏_G B are equivalences, and tensoring with B is conservative on A-modules. For every integer N≥1, use the supplied smooth full-level stack M_ell(N) over ℤ[1/N], classifying an elliptic curve and an ordered basis of its N-torsion, and put TMF(N)=Γ(M_ell(N),Otop). Prove that TMF[1/N]→TMF(N) is a faithful GL₂(ℤ/Nℤ)-Galois extension. The cover is a finite étale torsor of stacks for every N; its source is an affine scheme for N≥3, while N=1,2 retain their automorphisms. The right row-vector action on bases induces the left action g(b)=ρ_g^*(b) on sections. No Weil-pairing value is fixed. (mm, Definitions 7.3–7.4 and Theorem 7.6, pp.37–38; mm line 1757, line 1764 and line 1801).

The construction has the following API.

- A is recovered as B^hG with its actual coherent action.

- B⊗_A B identifies with the product indexed by G via b₁⊗b₂↦(b₁g(b₂))_g.

- If B⊗_A M=0 then M=0.

- Localization of the elliptic torsor and section rings gives the specified prime-local extension.

This notion of faithful spectral Galois extension is used with the actual base and target algebras and their coherent action; the two displayed comparison maps and conservativity are independent requirements.

*Proof route.* Take Otop sections on the finite étale full-level cover of M_ell[1/N] and identify the Čech nerve with the GL₂(ℤ/Nℤ)-torsor. Use spectral affineness and finite étale module base change to identify the two Galois comparisons and reflect zero modules. Apply stack descent on affine charts also at N=1,2; no scheme hypothesis is needed there. Keep the determinant components of the group action. Cover-surjectivity reflects the zero module, giving faithfulness.

**Checks.**

- For a trivial finite torsor the extension is A→∏_G A and is faithful.

- The zero A-algebra cannot be faithful unless A is zero.

- For N=3 at p=2 the group has order 48, not 24, and the cover is étale because 3 is invertible.

- N=1 gives the identity TMF→TMF and the trivial group of order 1. N=2 gives GL₂(𝔽₂)≃S₃, of order (4−1)(4−2)=6; the automorphism −1 of a generic elliptic curve fixes its 2-torsion basis, so this level object remains a stack. N=3 gives order (9−1)(9−3)=48, and N=5 gives (25−1)(25−5)=480. At N=2 the base is ℤ[1/2]; at N=3 it is ℤ[1/3], whose 2-localization is the input of §12.4. (mm, Example 7.5, p.37; mm line 1776).

- At N=3 let g and h be the upper and lower unipotent matrices with off-diagonal entry 1. Then ((P,Q)g)h=(2P+Q,P+Q), whereas ((P,Q)h)g=(P+Q,P+2Q); pullback reverses map composition and gives the left action on sections used in b₁g(b₂). The matrix diag(−1,1) changes the Weil pairing ζ to ζ⁻¹, so fixing ζ would discard determinant components.

- For G=C₂ and B=A×A, B⊗_A B=A⁴=∏_G B and B^hG=A. For B=0,A=Hℤ, the map M↦B⊗_AM kills Hℤ≠0, so it is not conservative. |GL₂(𝔽₃)|=(9−1)(9−3)=48.

- For the trivial S₃-torsor, B=∏_(S₃)A has 6 factors, B⊗_A B has 36 factors and ∏_(S₃)B has 36 factors. Homotopy fixed points recover A and projection to one factor makes base change conservative.

*Needs:* EllipticCohomology E1/E3/E6 (smooth level stacks, Γ(N) sheaves, sections and deck-group descent for all N≥1); ModularCurves §3D (naive level comparison with N inverted), §4C (level-three torsor) and §5B (ordered-basis schemes and their right action for N≥3); §12.1 (spectral affineness and finite étale module base change).

### 12.4 Supersingular Morava comparison

At p=2, L_(K(2))TMF(3)≃E(𝔽₄,Ĉ) for a supersingular elliptic curve with a chosen full level-three marking, equivariantly for the induced GL₂(𝔽₃) action, and L_(K(2))TMF≃E₂^hGL₂(𝔽₃). At p=3, L_(K(2))TMF≃E₂^hG₂₄, where G₂₄ is the automorphism group of the supersingular pair over 𝔽₃, including the order-two residue-field Galois factor. Here |Aut(C/𝔽₉)|=12 and the extended group has order 24. Choices of curve and marking give compatible equivalences, not an unmarked canonical coefficient-coordinate identification. (behrens, §1.6, Proposition 1.6.12, pp.30–31; behrens line 1160; lmmt, Corollary 4.21 proof, p.22; lmmt line 925).

*Proof route.* Identify the formal completion of the supersingular elliptic moduli stack with the quotient of its Lubin–Tate deformation space by the extended automorphism group, using the Serre–Tate comparison of ModularCurves §7F. At two, full level three rigidifies the supersingular object to one formal deformation chart with residue field 𝔽₄. Apply Otop realization and finite-group descent; prove base change on the marked formal chart, retain the residue-field automorphism in its action, and identify the actual descent maps.

**Checks.**

- At two the unmarked extended automorphism group has order 48.

- At three dropping Gal(𝔽₉/𝔽₃) changes the homotopy fixed-point spectrum.

- At 2, the geometric automorphism order 24 times residue degree 2 gives 48. At 3, geometric order 12 times residue degree 2 gives 24. Omitting the residue involution divides each required group order by 2.

*Needs:* EllipticCohomology E1–E3/E6 (formal supersingular charts and level sheaves); ModularCurves §7F (Serre–Tate comparison) and §4C (ordered level-three marking); §7.1–§7.2 (marked realization and finite actions); §12.3 at N=3 and p=2 (Galois descent).

### Examples

For elliptic cohomology theories, for an ordinary elliptic fiber the height is 1 and for a supersingular fiber it is 2. The additive law over 𝔽_p has infinite height and cannot be the completion of a smooth elliptic curve. (behrens, Definition 1.2.11, Remark 1.2.12 and Corollary 1.2.15, p.7; behrens line 233).

**Checks.**

- An ordinary geometric fiber has formal height one.

- A supersingular fiber has formal height two by ModularCurves 7E.

- An even-periodic ring with additive characteristic-p law cannot be elliptic cohomology of a smooth elliptic curve.

For the topological structure sheaf, at a nodal one-gon the identity formal group is multiplicative of height 1; at a supersingular smooth fiber it has height 2. A descent class of bidegree (s,2r) contributes degree 2r−s, which is odd when s is odd. (goerss, Theorem 1.2, pp.224–225; goerss line 152; mm, Theorem 7.1, p.35; mm line 1682).

**Checks.**

- The smooth affine restriction yields the elliptic cohomology triple, including its formal comparison.

- The nodal boundary is retained on M̄_ell but excluded on M_ell.

- Even homotopy sheaves do not force Tmf to have no odd homotopy, because higher étale cohomology contributes.

For topological modular forms, π_−1tmf=0 by the connective cover; Tmf retains negative degrees and TMF inverts the cusp discriminant. At 2, Δ has weight 12 and spectral degree 24, but the integral uniform lift is Δ²⁴ in degree 576. (lmmt, §4.3 preceding Corollary 4.21, p.22; lmmt line 890; behrens, §1.3, pp.9–13; behrens line 455; §1.6, pp.31–32; behrens line 1183).

**Checks.**

- tmf has no negative homotopy groups by construction.

- Tmf uses the compactified stack, whereas TMF discards the nodal boundary.

- At primes two and three no degree-24 Bott class is assumed solely from the algebraic modular form Δ.

For discriminant localization, weight(Δ²⁴)=12·24=288 and spectral degree is 2·288=576; at 2 the smaller surviving Δ⁸ has degree 192 and at 3 Δ³ has degree 72. The common exponent 24 is divisible by 8 and 3. (behrens, §1.3, p.13; behrens line 457; §1.5, Theorem 1.5.6, p.23; behrens line 845; lmmt, §4.3 preceding Corollary 4.21 and its proof, p.22; lmmt line 890).

**Checks.**

- At two the unpowered algebraic Δ is not assumed to be a degree-24 homotopy class.

- The chosen uniform class has degree 24·24=576 and its inversion agrees with the global periodic TMF presentation, before prime localization.

### Dependencies

EllipticCohomology E1–E3 (the two spectral stacks and Otop); gap:spectral-ringed-sites; §8.1 (height-local module comparison); the elliptic 0-affineness argument in this subsection. EllipticCohomology E3–E4 (tmf→Tmf→TMF and actual Δ²⁴ inversion); §12.1 (spectral affineness); §8.1–§8.2 (height locality and restricted telescope comparison); §3.2 (connective-cover invariance); ModularCurves §7E (formal-height strata). EllipticCohomology E1/E3/E6 (smooth level stacks, Γ(N) sheaves, sections and deck-group descent for all N≥1); ModularCurves §3D (naive level comparison with N inverted), §4C (level-three torsor) and §5B (ordered-basis schemes and their right action for N≥3); §12.1 (spectral affineness and finite étale module base change). EllipticCohomology E1–E3/E6 (formal supersingular charts and level sheaves); ModularCurves §7F (Serre–Tate comparison) and §4C (ordered level-three marking); §7.1–§7.2 (marked realization and finite actions); §12.3 at N=3 and p=2 (Galois descent).

## Layer 13: James filtrations and Thom spectra

### 13.1 Units and Thom spectra

For an E∞ ring R, use EllipticCohomology E5’s units spectrum gl₁(R): GL₁R=Ω∞gl₁(R) is the union of the unit components in Ω∞R with its multiplicative group-like E∞ structure, and BGL₁R=Ω∞Σgl₁(R). Identify BGL₁R with the ∞-groupoid of R-lines equivalent to R, giving a functor BGL₁R→Mod_R. For f:X→BGL₁R, define Mf=colim_X L_f in Mod_R. For n≥1, a based n-fold loop map yields an E_n R-algebra structure on Mf by the monoidal Thom construction. Preserve the actual twist and coherent multiplicative data. (thom, Definition 3.1 and Corollary 3.2, p.10; Theorem 3.5 and Corollary 3.9, p.11; Lemma 3.15 and Proposition 3.16, pp.13–14; thom line 400; akq, §2.1, p.5; akq line 186).

The construction has the following API.

- The map to BGL₁R supplies a functor X→Mod_R whose values are free rank-one R-lines up to equivalence.

- R-linear maps out of Mf are coherent compatible sections of maps out of its classified lines.

- An E∞ map R→R′ carries Mf to the Thom R′-module of the transported line system.

- For a coherent n-fold loop input the Thom module has the corresponding E_n algebra structure.

- For R=S and a based loop map f, Mf with its E₁ structure is identified with EllipticCohomology E5’s E₁ Thom refinement of the corresponding loop-multiplicative spherical-fibration diagram, and through E5 with GeneralizedCohomology G5.3’s bundle-diagram Thom spectrum.

*Proof route.* Identify GL₁R with the automorphism space of R in Mod_R and deloop, using E5’s gl₁(R) for the infinite loop structure. Construct its functor to Mod_R with value an R-line and identify maps out of its colimit with coherent cocones. Prove monoidal-colimit compatibility for a specified n-fold loop map, giving the E_n R-algebra and its orientation universal property. For R=S and loop maps, compare the colimit with E5’s E₁ Thom refinement through their common universal property. This extends vector-bundle Thom spectra to arbitrary R-line local systems.

**Checks.**

- For X=* and its trivial line, Mf≃R.

- For a trivial map on X, Mf≃R⊗Σ∞_+X.

- GL₁H𝔽_p has discrete component group 𝔽_p^×; it is not the full additive infinite loop space of H𝔽_p.

- For X=* and the trivial line, Mf=R; for a trivial line on {a,b}, Mf=R⊕R. GL₁H𝔽₂ has one component while Ω∞H𝔽₂ has two; GL₁H𝔽₃ has two unit components, excluding 0.

*Needs:* EllipticCohomology E5 (units spectrum gl₁(R) and the E₁ Thom refinement with its G5.3 comparison); GeneralizedCohomology G2 (E∞ rings, module categories and monoidal colimits); BordismFormalGroups F6.5 (coherent local systems and monoidal rectification).

### 13.2 Hopkins–Mahowald Thom theorem

Let (S³)_p^∧ be the p-completion of the nilpotent space S³ and let f_p:Ω²(S³)_p^∧→BGL₁(S_p^∧) be the E₂ map extending the class 1−p∈π₁BGL₁(S_p^∧)=ℤ_p^× in the p-complete convention. Its p-complete Thom E₂ ring is H𝔽_p. Set C_p=fib((S³)_p^∧→K(ℤ_p,3)), with the map inducing the identity on π₃. Restriction along Ω²C_p gives the p-complete Thom E₂ ring Hℤ_p. Here C_p is the fiber killing homotopy through degree 3 (the cover indexed 4 under these conventions); using an uncompleted S³ with target K(ℤ_p,3) would give π₂=ℤ_p/ℤ instead. Thom tensor products and colimits in these assertions are taken in the p-complete symmetric monoidal category. (thom, Theorems 5.1 and 5.7, pp.19–22; thom line 768).

*Proof route.* Construct nilpotent p-completion of the source space and compare fib((S³)_p^∧→K(ℤ_p,3)) with the completion of fib(S³→K(ℤ,3)). Apply the Thom universal property to identify the first Thom ring with the versal E₂ algebra killing p. Compute its mod-p homology and Dyer–Lashof operations and prove the map to H𝔽_p is an equivalence. For the connected-cover variant use the intermediate S¹ Thom construction and its characteristic-p quotient to obtain Hℤ_p. Every tensor and colimit in this comparison is taken in p-complete spectra.

**Checks.**

- At p=2 the selected unit is −1.

- The H𝔽_p Thom ring has π₀=𝔽_p, while the connected-cover integral variant has π₀=ℤ_p.

- The completed-source cover C_p has π_i=0 for i≤3. The fiber of the uncompleted-domain map S³→K(ℤ_p,3) fails this check in degree two.

- At 2, 1−p=−1 is a unit. π₀ of the two Thom rings is 𝔽_p and ℤ_p. For completed-domain C_p, π₃ and π₂ are both 0 since ℤ_p→ℤ_p is id; for the uncompleted domain, coker(ℤ→ℤ_p)=ℤ_p/ℤ occurs in π₂.

*Needs:* §13.1 (units, multiplicative Thom colimits and their universal property); GeneralizedCohomology G3.9 (spectral p-completion); StableHomotopyKTheory §3.18 (Postnikov sections) and GeneralizedCohomology G2.10 (homotopy-fiber exact sequence) with AlgebraicTopology Stage 8 (Eilenberg–Mac Lane classifying maps), for the connected covers; the nilpotent space-completion and free E₂ operation calculation in this subsection.

### 13.3 James-filtered Thom spectra

For m≥0 restrict f_p along ΩJ_(p^m−1)S²→Ω²S³→Ω²(S³)_p^∧ and denote the resulting p-complete E₁ Thom ring by y(m). All colimits in this family are colimits in p-complete spectra, formed by completing ordinary spectral colimits. Then y(0)=S_p^∧, there are E₁ maps y(m)→y(m+1), and colim_m y(m)≃H𝔽_p. For m≥1, π₀y(m)=𝔽_p. For every prime p and m≥1 put Z_p(m)=fib(J_(p^m−1)S²→K(ℤ,2)), where the map induces the identity on π₂. Restrict f_p along ΩZ_p(m)→ΩJ_(p^m−1)S² to define the p-complete Thom E₁ ring z_p(m). These E₁ rings have compatible maps z_p(m)→z_p(m+1) and z_p(m)→y(m), with π₀z_p(m)=ℤ_p and colim_m z_p(m)≃Hℤ_p in p-complete spectra. The inner fiber is the connected cover indexed 3. The all-prime integral extension is a target here (lmmt, Remark 4.17 and the paragraph preceding Corollary 4.18, p.21; lmmt line 864 and line 867); at p=2 it recovers the construction in akq. (lmmt, Thom construction preceding Lemma 4.15, p.20; lmmt line 834; akq, Construction 2.1 and Lemma 2.2, pp.5–6; akq line 218 and line 236).

The construction has the following API.

- James inclusions induce E₁ maps compatible with the maps to the colimit Thom ring.

- The y(0) object is S_p^∧ by the trivial Thom-line computation.

- For m≥1, π₀y(m)=𝔽_p; the completed integral family has π₀z_p(m)=ℤ_p.

- The z_p(m)→y(m) square agrees with Hℤ_p→H𝔽_p after passing to the colimit.

*Proof route.* Restrict the specified unit-classifying map along the looped finite James inclusions before taking the Thom colimit. Their connectivity proves the filtered loop comparison, and monoidal Thom functoriality gives the E₁ transition maps. Compute π₀ at the first nontrivial stage and carry it through the tower. For z_p(m) at every prime, compare the integral degree-two Postnikov fiber before and after nilpotent completion. Complete the ambient filtered colimit; do not interchange this completion with arbitrary operations without that comparison.

**Checks.**

- m=0 uses J₀ and gives S_p^∧; it does not have π₀=𝔽_p.

- At p=2,m=1 the finite stage is J₁S²=S².

- At p=3,m=1, the index is 3−1=2, π₀z₃(1)=ℤ₃ and π₀y(1)=𝔽₃; the integral object therefore differs from y(1). At p=3,m=2 the index is 9−1=8.

- p^0−1=0 gives y(0)=S_p^∧ and π₀=ℤ_p; at 2,m=1 the index is 1 and y(1) has π₀=𝔽₂. The integral z₂(1) has π₀=ℤ₂. The fiber of J₁S²→K(ℤ,2) kills π₂, so it is the cover indexed 3 in these conventions.

*Needs:* HomotopySpheres §3B (James filtration and connected equivalence); §13.1–§13.2 (actual classifying map, completed Thom theorem and nilpotent source-space completion); StableHomotopyKTheory §3.18 (Postnikov section defining the cover) and GeneralizedCohomology G2.10 (homotopy-fiber exact sequence computing its homotopy).

### 13.4 Chromatic acyclicity of Thom spectra

For m≥1, y(m) is L_(m−1)^(p,f)-acyclic: T(i)⊗y(m)=0 for 0≤i<m. For every prime p, z_p(m) is K(i)-acyclic and hence T(i)-acyclic for 1≤i<m; π₀z_p(m)⊗ℚ=ℚ_p≠0, so do not add i=0 to that range. (lmmt, Lemma 4.15, Remark 4.17 and the paragraph before Corollary 4.18, p.21; lmmt line 848 and line 867, for the all-prime extension; Corollary 4.18 proof and akq, Proposition 2.22, p.15; akq line 632).

*Proof route.* For y(m), π₀=𝔽_p and the unital connective ring action makes p zero on all homotopy groups, so p-inversion is 0. At 2 compute the dual Steenrod comodule and Margolis homology of the specified Thom family and use the localized Adams spectral sequence of Angelini-Knoll–Quigley Proposition 2.22. At odd p construct the dual Steenrod comodules for both y(m) and the integral fiber family z_p(m), and prove convergent Adams vanishing lines for their finite type-i smashes, with slope 1/(2p^m−2). Compare with the slope 1/(2p^i−2) of v_i for 1≤i<m. This forces v_i-torsion. For the completed family prove the comparison with the ordinary-source model is an S/p-equivalence, so positive-height telescope homology agrees; handle p-inversion of y(m) separately by its coefficient action. Preserve π₀z_p(m)⊗ℚ=ℚ_p in the integral family; no claim at i=0 is made for it.

**Checks.**

- At m=1, y(1) is p-inversion acyclic.

- The stated z_p(m) range is empty at m=1 and excludes rational acyclicity.

- At m=1 the y-range is {0}, and π₀y(1)=𝔽_p forces y(1)[1/p]=0. The z-range 1≤i<1 is empty, and π₀z_p(1)⊗ℚ=ℚ_p≠0. At p=3,m=2, the index is 8 and the positive z₃-range is exactly {1}; at p=2 the indices 1 and 3 recover the prime-two cases.

- The slope denominator is 2p^m−2≥2 for p prime and m≥1; at (p,m)=(2,1) it is 2 and at (3,1) it is 4. A v_i slope is used only for i≥1. The degree-zero v₀=p case is the separate p-inversion argument, not division by |v₀|=0.

*Needs:* §13.3 (completed y(m), all-prime z_p(m) and coefficient comparisons); §3.3 (ring acyclicity); BordismFormalGroups F6.3 (v_i detection); the Margolis-homology and localized Adams vanishing-line calculations in this subsection.

### 13.5 Acyclicity under the James splitting

Let W be a connected pointed CW space and E any spectrum. If E⊗Σ∞W=0 then E⊗Σ∞ΩΣW=0. In particular, for n≥1 and E=T(n)∨T(n−1), a connected finite p-local complex of type m>n meets this hypothesis; for n=1 its reduced rational triviality and p-locality also imply S[1/p]-acyclicity. This is the stable input for the corresponding Waldhausen A-theory purity application; no A-theory comparison is re-proved here. (lmmt, Corollary 4.14 proof, p.20; lmmt line 823).

*Proof route.* Smash the stable James splitting with E. Every positive smash power of W is E-acyclic because Σ∞(W^∧k)≃Σ∞W⊗Σ∞W^∧(k−1) and tensoring is associative. Tensor and coproduct commute; all terms of the wedge vanish. No property of E is used.

**Checks.**

- The wedge starts at k=1, so no sphere summand invalidates the vanishing.

- For E=T(n)∨T(n−1) with n=1 the lower detector is S[1/p], with its specified convention.

- For E=Hℚ and W=K(ℤ/p,1), the reduced rational homology of W is zero, so Hℚ⊗Σ∞W=0, and the conclusion gives Hℚ⊗Σ∞ΩΣW=0, as the rational Bott–Samelson tensor algebra on the zero module confirms; this E is not a telescope.

- For W=*, all positive smash powers have zero reduced suspension. For W=S², the wedge has cells in degrees 2,4,6,… and no degree 0 sphere. Adding a spurious r=0 term contributes E≠0 and would refute the vanishing argument.

*Needs:* gap:stable-james-splitting (HomotopySpheres §3B); §3.2 (telescope/type orthogonality, for the T(n)∨T(n−1) instance); GeneralizedCohomology G2 (tensor and coproduct comparison).

### Examples

For the James construction, J₀S²=*; J₁S²=S²; J₂S² has reduced cells in degrees2 and 4. For S⁰, π₀J∞S⁰=ℕ whereas π₀ΩS¹=ℤ, so the disconnected comparison fails. (lmmt, Corollary 4.14 proof and following Thom-spectrum construction, p.20; lmmt line 826 and line 834; akq, §2.1, p.5; akq line 205).

**Checks.**

- J₀W=* has zero reduced suspension spectrum.

- For W=S², the filtration adds one cell in each even dimension through 2r.

- For W=S⁰ the connected-space comparison fails: the free monoid is not the full loop group of S¹.

### Dependencies

EllipticCohomology E5 (units spectrum gl₁(R) and the E₁ Thom refinement with its G5.3 comparison); GeneralizedCohomology G2 (E∞ rings, module categories and monoidal colimits); BordismFormalGroups F6.5 (coherent local systems and monoidal rectification). §13.1 (units, multiplicative Thom colimits and their universal property); GeneralizedCohomology G3.9 (spectral p-completion); StableHomotopyKTheory §3.18 (Postnikov sections) and GeneralizedCohomology G2.10 (homotopy-fiber exact sequence) with AlgebraicTopology Stage 8 (Eilenberg–Mac Lane classifying maps), for the connected covers; the nilpotent space-completion and free E₂ operation calculation in this subsection. HomotopySpheres §3B (James filtration and connected equivalence); §13.1–§13.2 (actual classifying map, completed Thom theorem and nilpotent source-space completion); StableHomotopyKTheory §3.18 (Postnikov section defining the cover) and GeneralizedCohomology G2.10 (homotopy-fiber exact sequence computing its homotopy). §13.3 (completed y(m), all-prime z_p(m) and coefficient comparisons); §3.3 (ring acyclicity); BordismFormalGroups F6.3 (v_i detection); the Margolis-homology and localized Adams vanishing-line calculations in this subsection. gap:stable-james-splitting (HomotopySpheres §3B); §3.2 (telescope/type orthogonality, for the T(n)∨T(n−1) instance); GeneralizedCohomology G2 (tensor and coproduct comparison).

## Downstream consumers

The chromatic purity and redshift applications in GeneralAlgebraicKTheoryPartII consume the finite-local, ring-acyclicity, Tate and input-spectrum comparisons. The periodic detection and height interfaces also support chromatic trace applications. Waldhausen A-theory applications use §13.5’s reduced James acyclicity. ChromaticHomotopyTheory, Part II uses these interfaces together with chromatic purity and redshift for its higher-height separation target, specified in Scope and ownership.

## Worked examples

For q≠p, multiplication by p is invertible on S/q, so S[1/p]∧S/q=S/q. Rationalization instead gives 0. For a p-local X, every q≠p is invertible already and then p-inversion gives X⊗Hℚ. Thus the two finite towers agree exactly on the stated p-local domain. (lmmt, Definition 2.5 and the consequences of Lemma 2.8, pp.8–9; lmmt line 322.)

For an additive law over a characteristic-p field, [p](X)=pX=0. For the native multiplicative law, [p](X)=(1+X)^p−1=X^p. At 2 these are 0 and X², and at 3 they are 0 and X³. They distinguish infinite height from height 1 on the actual formal-law carriers. A rescaling with nonunit derivative is not a coordinate isomorphism. (behrens, §1.5, p.21; behrens line 766.)

For trivial-action completed KU at 2, Euler inversion imposes 2+z=0 and z invertible, yielding ℚ₂. At 3 it imposes z²+3z+3=0 and z invertible, yielding the ramified field ℚ₃(ζ₃). Its uniformizer is ζ₃−1, whose square is −3ζ₃. This proves that inverting that element in the integer ring inverts 3; the spectral Euler-inversion theorem is the additional target of §9.5. (cm-tate, Remark 2.8, p.4; cm-tate line 129, for nonzero lower-height Tate; the displayed field calculation is the oriented specialization proved in §9.5.)

For real Bott coefficients, complexification sends α to 2b² and β to b⁴, so α²=4β becomes 4b⁴=4b⁴. The alternative α²=β would give 4=1 after canceling the nonzero Bott unit over ℤ. Rational π_−8 distinguishes ko and KO, whereas their positive-height periodic groups agree. (abs, Theorems 6.9 and 11.5, pp.15–16,28–29, locator-only, uncertified; lmmt, Corollary 4.19 proof, p.21; lmmt line 878.)

For the reflection mapping torus of S¹, fiber monodromy on H₁ is −1. Its cellular differential is 1−(−1)=2; the kernel is 0 and cokernel is ℤ/2. Together with the base class this gives H₁=ℤ⊕ℤ/2 and H₂=0. Constant transport would instead produce H₁=ℤ² and H₂=ℤ. This is the two-term witness fixing the Serre local-system convention in §6.1. (lmmt, Proposition 2.11(ii) proof, p.10; lmmt line 398; the integral calculation is the example of §6.1.)

For the completed-domain fiber of (S³)_p^∧→K(ℤ_p,3), the degree-three map is id:ℤ_p→ℤ_p, hence its kernel and cokernel are 0. With uncompleted domain the cokernel is ℤ_p/ℤ in degree 2. For the finite James stage, the map J₁S²→K(ℤ,2) is an isomorphism on π₂, so its fiber kills π₂ and is indexed by 3 under the cover convention here. (thom, Theorem 5.7 and preceding fiber sequence, pp.21–22; thom line 837.)

## References

The keys below identify the cited editions and versions. Source line numbers refer to their numbered text extractions; theorem, section and page locators identify the same passages independently. Locator-only sources are marked explicitly.

- **lmmt** — Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme, [Purity in chromatically localized algebraic K-theory](https://arxiv.org/abs/2001.10425v5), 2020. Introduction, pp.3–4, for the commutative-ring height convention.; §2.1–2.2, pp.6–10; Remark 3.9, pp.15–16; §4.2, pp.19–21; §4.3 and Corollary 4.21 with proof, pp.21–22.
- **hs** — Michael J. Hopkins and Jeffrey H. Smith, [Nilpotence and stable homotopy theory II](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), 1998. Theorems 3,7,9,11, pp.2–6; preliminaries, p.9; §1.1–1.4, pp.10–14; Lemma 2.1 and §2.1–2.2, pp.15–19; Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21.
- **ravenel** — Douglas C. Ravenel, [Localization with respect to certain periodic homology theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), 1984. §2, definitions and Theorem 2.1 with proof, pp.360–363.
- **kuhn-guide** — Nicholas J. Kuhn, [A guide to telescopic functors](https://arxiv.org/abs/0802.0510v1), 2008. Theorem 1.1, pp.3–4; §2.3, pp.7–9; §3.1 and Lemma 3.1, pp.9–11; §5, Theorem 5.2 and Lemmas 5.4–5.5, pp.15–18.
- **kuhn-tate** — Nicholas J. Kuhn, [Tate cohomology and periodic localization of polynomial functors](https://arxiv.org/abs/math/0307173v1), 2003. Introduction, Theorem 1.5 and Corollaries 1.6–1.7, manuscript pp.4–6; §4 and Lemma 4.1, pp.15–17.
- **cm-tate** — Dustin Clausen, Akhil Mathew, [A short proof of telescopic Tate vanishing](https://arxiv.org/abs/1608.02063v2), 2016. Entire paper, pp.1–4; Proposition 2.3, Lemma 2.4, Theorems 2.5–2.6 and Corollary 2.7.
- **hahn** — Jeremy Hahn, [On the Bousfield classes of H∞-ring spectra](https://arxiv.org/abs/1612.04386v2), 2016. §1–2, pp.1–4, including Definition 1.2 and Theorem 1.3, p.1; §3, Definition 3.1 and Theorem 3.3, p.5, Bockstein section Lemma 3.7, pp.6–7, and proof pp.7–8; §2, Remark 2.2, Definitions 2.3–2.4 and Lemma 2.5, pp.3–4, for the Tate-valued Frobenius; §4, Propositions 4.2–4.5 with the H∞ orientation used in the proof of Proposition 4.5, Corollaries 4.5.1–4.5.3, Corollary 4.6.1 and Proposition 4.7, pp.8–10.
- **cmnn** — Dustin Clausen, Akhil Mathew, Niko Naumann, Justin Noel, [Descent and vanishing in chromatic algebraic K-theory via group actions](https://arxiv.org/abs/2011.08233v2), 2020. §4.2, Theorem 4.6 and Lemma 4.7, manuscript pp.19–20. The numbering differs from the Lemma 4.5 cited in LMMT. Introduction, p.3, and Theorem 4.10 proof, p.21, for the finite-local blueshift input.
- **csy** — Shachar Carmeli, Tomer M. Schlank, Lior Yanovski, [Ambidexterity in Chromatic Homotopy Theory](https://arxiv.org/abs/1811.02057v3), 2018. Introduction, Theorem E, p.5; §3.1, Definitions 3.1.5 and 3.1.10, pp.33–34, and Proposition 3.1.18, p.37; §4, Theorem 4.3.10, pp.68–69; §5.1, Definition 5.1.4 and Lemma 5.1.7, p.73, Corollary 5.1.9, p.74, Lemma 5.1.12, p.75, Theorem 5.1.14 and Proposition 5.1.15, p.76, Corollary 5.1.17, p.77; §5.3, Theorem 5.3.1, p.79, Lemma 5.3.4 and Theorem 5.3.5, p.80, Corollary 5.3.7, p.81; §5.4, Theorem 5.4.4 and Remark 5.4.5, pp.83–84.
- **bhm** — Tobias Barthel, Gijs Heuts, Lennart Meier, [A Whitehead theorem for periodic homotopy groups](https://arxiv.org/abs/1811.04030v2), 2018. §3, Theorem 3.1, p.5, and Lemmas 3.2–3.3, p.6; Lemma 3.5, p.6.
- **mm** — Akhil Mathew, Lennart Meier, [Affineness and chromatic homotopy theory](https://arxiv.org/abs/1311.0514v5), 2013. §4, Theorems 4.5–4.7 and Corollary 4.8, pp.26–27; §7, Theorems 7.1–7.2, pp.35–37, and Theorem 7.6, p.38.
- **behrens** — Mark Behrens, [Topological modular and automorphic forms](https://arxiv.org/abs/1901.07990v2), 2019. §1.2, pp.4–8; Theorem 1.3.2, pp.9–10; §1.3 discriminant localization, p.13; §1.4 permanent cycles, pp.16,21; §1.5, pp.21,23; §1.6 chromatic localizations, pp.27–32; Theorem 1.7.6, pp.33–34.
- **goerss** — Paul G. Goerss, [Topological modular forms [after Hopkins, Miller, and Lurie]](https://numdam.org/item/AST_2010__332__221_0.pdf), 2010. Theorem 1.2 and Definition 1.3, pp.224–225; §3.3 and Theorem 3.6, pp.238–239.
- **abs** — M.F. Atiyah, R. Bott, A. Shapiro, [Clifford modules](https://doi.org/10.1016/0040-9383(64)90003-5), 1964. §6, Propositions 6.8 and Theorem 6.9, pp.15–16; §11, Theorem 11.5, pp.28–29 Locator-only, uncertified.
- **thom** — Omar Antolín-Camarena, Tobias Barthel, [A simple universal property of Thom ring spectra](https://arxiv.org/abs/1411.7988v4), 2014. §3, Definition 3.1/Corollary 3.2, p.10; Theorem 3.5/Corollary 3.9, p.11; Lemma 3.15 and Proposition 3.16, pp.13–14; §5, Theorem 5.1, pp.19–20, and Theorem 5.7, pp.21–22.
- **akq** — Gabriel Angelini-Knoll, J. D. Quigley, [A homological approach to chromatic complexity of algebraic K-theory](https://arxiv.org/abs/1908.09164v3), 2019. §2.1, Construction 2.1 and Lemma 2.2, pp.5–6; Proposition 2.22 and its proof, p.15.
- **bhls** — Robert Burklund, Jeremy Hahn, Ishan Levy, Tomer M. Schlank, [K-theoretic counterexamples to Ravenel's telescope conjecture](https://arxiv.org/abs/2310.17459v1), 2023. Introduction, Theorem A and the three localization categories, pp.2–5; Definitions 4.1 and 4.2, p.37; Corollary 4.33, pp.51–52; Theorem 5.4, pp.53–54; Theorems 6.1–6.2 and Corollary 6.3, pp.66–67; Theorem 6.25, pp.73–74.

- **greenlees-sadofsky** — J. P. C. Greenlees and Hal Sadofsky, [The Tate spectrum of v_n-periodic complex oriented theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/greenlees-sadofsky.pdf), 1996. Corollary 2.4, p.400, and Corollary 1.4, p.395, with proof p.402; greenlees-sadofsky line 343 and line 413.
- **hesselholt-ku** — Jonas McCandless, [Topological Hochschild homology of E∞-rings](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/hesselholt-scholze.pdf), in Arbeitsgemeinschaft: Topological Cyclic Homology, Oberwolfach Report 15/2018, pp.838–845, especially p.844; hesselholt-ku line 1658. The KU calculation is for uncompleted KU; §9.5 proves the completed comparison through the oriented Tate tower.

- **miller** — Haynes R. Miller, [On relations between Adams spectral sequences, with an application to the stable homotopy of a Moore space](https://math.mit.edu/~hrm/papers/miller-relations-between-adams-spectral-sequences.pdf), 1981. Theorem 4.11 and Corollary 4.12, pp.294–295, for the odd-prime height-one calculation.
- **mahowald** — Mark Mahowald, [bo-resolutions](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mahowald-bo.pdf), 1981. Theorem 6.3, p.382, read with the correction below.
- **mahowald-addendum** — Mark Mahowald, [An addendum to: bo-resolutions](https://msp.org/pjm/1984/111-1/pjm-v111-n1-p10-s.pdf), 1984. §1, pp.117–118 (corrected Theorem 1.1(c)); §2, pp.118–119 (corrected proof of Theorem 6.3); §3, pp.119–123 (vanishing line).

- **hahn-wilson** — Jeremy Hahn and Dylan Wilson, [Redshift and multiplication for truncated Brown–Peterson spectra](https://arxiv.org/abs/2012.00864v5), 2022. Theorem B and its following corollary, p.3; Corollary 5.0.2 with proof, p.40. Numbering is that of arXiv v5; the trace factors through the nonzero height-(h+1) detector used by the BHLS supplier contract.
