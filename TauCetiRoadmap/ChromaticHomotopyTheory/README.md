# Roadmap: chromatic homotopy theory

**Summary.** Build generalized Serre filtrations, the Hopkins–Lurie higher norms and chromatic higher semiadditivity with the sharp connectivity bound m=n+1 for periodic vanishing, the nonzero raw Tate spectrum of completed complex K-theory and faithful full-level modular Galois extensions. These extend the periodic-detection, finite-local and Tate interfaces of GeneralAlgebraicKTheoryPartII and the realizations of EllipticCohomology, at every prime. Higher-height telescope separation is the specified Part II extension.

## Scope and ownership

This roadmap owns the generalized Serre filtration with monodromy and convergence (Layer 3), the completed KU Euler-inversion calculation, the generic Hopkins–Lurie norms and cardinalities of maps of spaces with the chromatic application of higher semiadditivity, the sharp value m=n+1 of the connectivity bound in periodic vanishing and the weak-ring height criterion (Layer 4), and the full-level modular Galois theorem for every positive level (Layer 5). §4.2 builds the higher norms from the Kan extensions of BordismFormalGroups F6.5 and identifies them for BG→* with the localized finite-group norms of GeneralAlgebraicKTheoryPartII §4.22; neither supplier constructs a norm beyond finite groups. GeneralAlgebraicKTheoryPartII §§4.15–4.16 own connective periodic vanishing and its suspension–loop preservation with an existential bound m; §4.3 below proves that m=n+1 suffices, using §4.2.

- GeneralAlgebraicKTheoryPartII §§4.2–4.4 own periodic groups, telescope criteria and ring acyclicity; §§4.5–4.9 own all-spectra finite localization, kernels, p-local comparison, fracture and bottom comparison; §§4.10–4.12 own finite telescopic and Bousfield–Kuhn functors and suspension–loop detection, including finite-source compatibility and uniqueness.
- GeneralAlgebraicKTheoryPartII §§4.13–4.16 own connected covers, fiberwise homology, finite nullification, connective vanishing and preservation with an existential connectivity bound; §§4.18–4.21 own finite-height locality, restricted telescope comparison, height-one equality and BP support; §§4.22–4.25 own local norms, transfer splitting, telescopic Tate vanishing and raw finite-local blueshift; §§4.26–4.29 own Morava power operations, Hahn acyclicity, ring height and the Tate converse; §4.30 owns the modular chromatic comparison; §4.30a owns the positive-height real Bott comparison, that ko→KO and A→A[b⁻¹]=A⊗_ko KO for every E₁ ko-algebra A, with b the degree-eight real Bott class, are T(n)-equivalences for n≥1; §§4.31–4.33 own Hopkins–Mahowald and filtered Thom families with their acyclicity and the James application, whose stable James splitting that roadmap requests from HomotopySpheres. Its §4.20 does not assert the higher-height separation theorem of Part II below.
- EllipticCohomology E2 supplies marked Morava realization and semilinear actions, including the all-height extension in its named contract; E3–E4 supply Otop, tmf, Tmf, TMF and discriminant inversion; its affineness contract supplies the spectral module equivalence. E5 supplies relative Thom colimits and their multiplicative refinements; E6 supplies spectral level stacks. The faithful GL₂(𝔽₃)-Galois extension TMF[1/3]→TMF(3), which GeneralAlgebraicKTheoryPartII requests from EllipticCohomology E6 for its §8.8, is the case N=3 of §5.1 below; §5.1 proves every level N≥1 by one argument from the level stacks and does not consume that request or the K(2)-local supersingular comparisons at 2 and 3.
- GeneralizedCohomology G2–G3 and G5 supply spectra, derived spectral constructions, finite duality and Bott spectra. BordismFormalGroups F1–F3/F5 supply orientations, formal groups and coefficients; F6.1–F6.4 supply p-local localization, nilpotence and periodicity, and F6.5 supplies generic actions, Kan extensions and Tate constructions. Layers 0–2 give convention Checks on these inputs.
- StableHomotopyKTheory §§2.4–2.7 and §3.18 supply fiber transport and Postnikov towers, and §§7.21–7.27 filtered spectral sequences and convergence. AlgebraicTopology Stages 4–5 and 8 supply CW geometry, local coefficients and relative homotopy. Layer 3 adds the spectrum-valued Serre filtration, beyond GeneralAlgebraicKTheoryPartII §4.14's unfiltered homology comparison.
- ModularCurves §§3D, 4B–4C, 5B and 7E–7F supply geometric levels, their actions and formal-height comparisons. EnhancedDerivedSheaves E5 supplies spectral-module descent through its named contract. DGFloer Layer 1 item 4 supplies Hurewicz modulo a Serre class.
- StableHomotopyKTheoryPartII §2.7 owns the sphere Segal comparison, and its §7.2 owns the uncompleted KU Tate coefficients; §4.1 below adds only the completed-input comparison. RefinedTraceMethods §§2.6, 2.9–2.10, 4.9, 4.11 and 6.8 supply THH, TC, K, the trace and the height-one KU-localization comparison.

Mathlib already supplies `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.Point`, `FormalGroup.map`, `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ` and `CategoryTheory.ObjectProperty.isLocal`. Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower` of abelian groups annihilated by some power of a fixed integer. These are the native algebraic carriers; the ordinary precomposition predicate does not itself construct a spectral reflector. Tau Ceti’s `TauCeti.SymmetricSpectrum` is the point-set category of symmetric spectra of pointed simplicial sets, without stable homotopy groups or stable equivalences, so it does not carry the chromatic statements here. No formal-group point calculation is a substitute for a chromatic headline theorem.

**ChromaticHomotopyTheory, Part II.** The extension starts with higher-height telescope separation, after the supplied periodic, finite-local, Tate and ring-height interfaces and Layers 0–5. It uses GeneralAlgebraicKTheoryPartII §5.5’s chromatic purity theorem, §5.2’s high-height cyclotomic trace and §4.4’s ring-acyclicity comparison. Its separation target and its two further inputs, the fixed-point trace comparison and the BP model theorem stated below, are specified here as the ownership boundary: all three are targets of Part II, not of the layers below and not of any supplier. GeneralAlgebraicKTheoryPartII §5.2 concerns K(A)←K(τ≥0A)→TC(τ≥0A) and §6.5 concerns E∞ rings, so neither states these two inputs.

At every prime and every n≥2 there is a T(n)-local spectrum X which is not K(n)-local. More precisely, for every n≥2 and k≥0 use the p-complete associative truncated Brown–Peterson model and coherent Adams ℤ-action of the BP model theorem below and set X(p,n,k)=L_(T(n))K(BP⟨n−1⟩^(h pᵏℤ)); prove that X(p,n,k) is not K(n)-local. The model retains its E₁⊗A₂ structure and the specified Adams action. Its cyclotomic non-hyperdescent argument uses GeneralAlgebraicKTheoryPartII §5.5’s purity theorem and §5.2’s high-height cyclotomic trace, the fixed-point trace comparison and the BP model theorem below, in addition to GeneralAlgebraicKTheoryPartII §4.4’s ring-acyclicity result. This is the precise limit of the L_n-local comparison in GeneralAlgebraicKTheoryPartII §4.19. (bhls, Introduction, Theorem A, pp.2–4; bhls line 98).

*Proof route for Part II.* At n≥2 construct the BHLS T(n)-localized algebraic K-theory witness and the Adams-operation homotopy-fixed-point comparison, and prove the cyclotomic non-hyperdescent separating its T(n) and K(n) localizations. The algebraic K-theory, THH, TC and trace carriers are RefinedTraceMethods §§2.6, 2.9, 2.10, 4.9 and 4.11; the coassembly and cyclotomic-completion construction belongs to this target. Let B be the model of the BP model theorem with h=n−1. Its fp-type n−1 makes U⊗B bounded for a type-n U with v_n self-map v, so a power of v is null on U⊗B and B is T(n)-acyclic; so is B^(h pᵏℤ), the fiber of a self-map of B. For a T(n)-acyclic E₁ ring C, L_(T(n−1)∨T(n))C=L_T(n−1)C, so GeneralAlgebraicKTheoryPartII §5.5’s purity theorem gives L_T(n)K(L_T(n−1)C)≃L_T(n)K(C) for C=B and C=B^(h pᵏℤ). GeneralAlgebraicKTheoryPartII §5.2’s high-height trace gives L_T(n)K(B)≃L_T(n)TC(B) and hence its pᵏℤ-homotopy fixed points; the fixed-point trace comparison gives the trace for the (−1)-connective ring B^(h pᵏℤ). For any functor F and coherent G-object A, the comparison F(A^hG)→F(A)^hG comes from applying F to the limit cone A^hG→A. The coassembly maps F(B^(h pᵏℤ))→F(B)^(h pᵏℤ) connect the two rows by naturality; they are not asserted to be equivalences. Use the BP model theorem for the height-(n−1) Lichtenbaum–Quillen property, which with fp-type n−1 gives the telescopic asymptotic constancy of the TC coassembly maps for k≫0, and for T(n)⊗TC(BP⟨n−1⟩)≠0. Prove the cyclotomic completion/coassembly theorem using these inputs, retaining every prime and n≥2 (bhls, Corollary 4.33, pp.51–52, Corollary 6.3 and Theorem 6.25, pp.66–67,73–74; bhls line 2227, line 2893 and line 3194).

*Fixed-point trace comparison (Part II).* For every prime p, h≥1 and connective E₁ ring A with a coherent ℤ-action, the cyclotomic trace K(A^(hℤ))→TC(A^(hℤ)) of the homotopy fixed-point ring, which is (−1)-connective, becomes an equivalence after L_T(h+1), naturally in A; applied to the restricted actions it covers A^(h pᵏℤ) for every k≥0. Route: by the Dundas–Goodwillie–McCarthy theorem (RefinedTraceMethods §4.17) the T(h+1)-localized fiber of the trace is a truncating invariant. Levy’s theorem, that every truncating invariant inverts the map of ℤ-homotopy fixed points induced by a 1-connective ℤ-equivariant map of connective E₁ rings, is part of this target; applied to A→π₀A it identifies that fiber for A^(hℤ) with the fiber for (π₀A)^(hℤ), an algebra over Hℤ, which Mitchell vanishing (GeneralAlgebraicKTheoryPartII §4.45) kills at height h+1≥2. (bhls, Theorem 6.2 and Corollary 6.3 with proof, pp.66–67; bhls line 2886 and line 2906.)

*BP model theorem (Part II).* For every prime p and h≥1 there is a p-complete associative BP⟨h⟩ model of fp-type h (for every finite p-local type-(h+1) spectrum U, U⊗BP⟨h⟩ has finitely many nonzero homotopy groups, each finite) with the E₁⊗A₂ structure and locally unipotent coherent Adams ℤ-action of bhls Theorem 5.4, which has the height-h Lichtenbaum–Quillen property (THH is bounded below and V⊗THH is bounded in the cyclotomic t-structure for every finite p-local type-(h+2) spectrum V) and satisfies T(h+1)⊗TC(BP⟨h⟩)≠0, with no restriction on p or h. This BP-specific statement is stronger than GeneralAlgebraicKTheoryPartII §6.5’s E∞-ring height bound, since it concerns the indicated associative model. (bhls, Definitions 4.1 and 4.2, p.37; Theorem 5.4, pp.53–54, and Theorem 6.25 proof, pp.73–74; bhls line 1596, line 2300 and line 3217; hahn-wilson, Theorem B and its following corollary, p.3, and Corollary 5.0.2 with proof, p.40; hahn-wilson line 93 and line 1422.)

**Checks for Part II.**

- At p=2,n=2,k=0, the Adams action fixes π₀BP⟨1⟩=ℤ₂. Since ℤ has cohomological dimension 1, π_−1(BP⟨1⟩^hℤ)=H¹(ℤ;ℤ₂)=ℤ₂. Thus this trace input is not connective. The separation proof also needs T(2)⊗TC(BP⟨1⟩)≠0: if it were 0, a thick-subcategory argument starting from it would detect no nonzero coassembly fiber.

- At height one the two acyclic classes agree; for each p and n≥2 the BHLS witness has L_T(n)X=X and L_K(n)X≠X. For a ring, acyclicity comparison concerns zero localizations and does not identify these two nonzero outputs.

- For a T(n)-acyclic E₁ ring C and n≥2, L_(T(n−1)∨T(n))C=L_T(n−1)C: the ring L_T(n−1)C is L_(n−1)^(p,f)-local, hence T(n)-acyclic because that localization is smashing and kills finite type-n spectra (GeneralAlgebraicKTheoryPartII §4.6), so C→L_T(n−1)C is a T(n−1)∨T(n)-equivalence with local target. For C=Hℤ_p at n=2 both sides are 0, since the bounded spectrum Hℤ_p is T(1)- and T(2)-acyclic, and purity gives L_T(2)K(ℤ_p)=L_T(2)K(0)=0. The K(2)-local Lubin–Tate ring E₂ is not T(2)-acyclic: L_(T(1)∨T(2))E₂=E₂, while π₀L_T(1)E₂ is the p-completion of W(𝔽_(p²))((u₁)), not W(𝔽_(p²))[[u₁]]. The acyclicity hypothesis cannot be dropped.

- The fp-type index of the BP model is h, not h−1. At p=2 and h=1 take ku_2^∧, a form of BP⟨1⟩ with v₁ the Bott class, and U the cofiber of the degree-8 Adams map Σ⁸S/2→S/2, a type-2 complex; this map induces multiplication by v₁⁴ on ku_*(S/2)=𝔽₂[v₁], so π_*(U⊗ku_2^∧)=𝔽₂[v₁]/(v₁⁴) is 𝔽₂ in degrees 0, 2, 4 and 6 and zero elsewhere. For the type-1 complex S/2, π_*(S/2⊗ku_2^∧)=𝔽₂[v₁] is nonzero in every even degree ≥0, so fp-type 0 fails.

## Conventions

Fix a prime p. The auxiliary letter q also denotes a prime; impose q≠p wherever displayed, while the relative-fiber Checks explicitly allow q=p. Work in explicitly fixed nested universes: spaces and diagram index sets are small in the first universe, spectra and their presentable categories in the next; finite spectra are essentially small. Include comparison along universe enlargement. Tensor products, mapping objects, fibers, cofibers and (co)limits are derived. S is the integral sphere, 0 the zero spectrum and Σ∞ the reduced suspension spectrum of a pointed space; a subscript + adds a disjoint basepoint. Homotopy and homology have integer homological grading, π_kΣX=π_(k−1)X, while Eʳ(X)=[Σ∞X,ΣʳE]. The symmetry on degrees a,b has sign (−1)^(ab). In the cofiber triangle X→Y→C→ΣX the boundary lowers homological degree by one.

Finite p-local means compact in Sp_(p), including retracts of finite p-local sphere-cell spectra. A p-local dual has tensor–Hom comparison only against a p-local target. Set K(0)=Hℚ and K(∞)=H𝔽_p. For n≥1 use the supplied type-n self-map telescope T(n), retaining its chosen source when discussing periodic groups; only its Bousfield class is choice independent. Set T(0)=S[1/p] on all spectra. Write L_n=L_(K(0)∨⋯∨K(n)), L_n^f=L_(Hℚ∨T(1)∨⋯∨T(n)) and L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). Their bottom terms differ on all spectra. The Bousfield order ⟨E⟩≤⟨F⟩ means that every F-acyclic spectrum is E-acyclic.

An m-connective space has π_i=0 for i<m, including the appropriate component condition, so it is (m−1)-connected. A map is m-connective when all its homotopy fibers are m-connective; it induces isomorphisms in degrees below m and a surjection in degree m. For r≥1, X⟨r⟩=fib(X→τ_≤(r−1)X). In particular the fiber of a simply connected space’s degree-two Postnikov section is X⟨3⟩. Space Postnikov sections are taken componentwise and retain fundamental-group transport; only the trivial-action stages are treated as principal fibrations.

Use geometric formal-group height only at characteristic-p field points, with height∞ for the zero p-series and height 0 when p is invertible. A geometric height bound is uniform over all points. It is distinct from the ring height of GeneralAlgebraicKTheoryPartII §4.28. Graded p-typical coefficients use v₀=p and |v_i|=2(pⁱ−1); fix Hazewinkel generators and the supplied coordinate conversions. For Morava E-theory write π_*E=π₀E[u,u⁻¹] with |u|=−2 after choosing a trivialization (behrens, §1.6, p.28; behrens line 1024). EllipticCohomology E2 writes the height-one and height-two periodic coefficients with a generator of degree +2; that generator is u⁻¹ here, and ψ_(−1) at height one sends both u and u⁻¹ to their negatives. For elliptic sheaves π_(2r)Otop=ωʳ; weight 12 for Δ therefore gives spectral degree 24, and Δ²⁴ has degree 576. Even periodicity on a chart includes a degree-two unit after trivializing its line and does not assert even global homotopy.

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

Use `AddCommGrpCat.isKilledBySomePower` from `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean`: for a natural number d, the abelian groups M with (d^k)·M=0 for some k, with its instance of Mathlib's `CategoryTheory.ObjectProperty.IsSerreClass` (zero object and closure under subobjects, quotients and extensions). §4.3 uses d=p. The groups annihilated by one fixed power of p do not form a Serre class, since they are not closed under extensions.

### From TauCetiRoadmap.GeneralizedCohomology

Consume G2’s actual symmetric spectral model, derived monoidal and module categories, commutative rings and algebra localization; G2.10’s mapping-path homotopy fibers and their arbitrary-map exact sequence, including the pointed-set end; G3.4/G3.7/G3.9’s homotopy-colimit, compact-object and integer-localization comparisons, including G3.7’s finite-CW suspension-spectrum mapping formula, which represents a stable map of finite complexes after finitely many suspensions; G3.8’s multiplicative connective covers and spectral Postnikov sections; G4.5’s real, complex and quaternionic orientation data; G5.1’s finite duality and G5.4’s real and complex Bott spectra. In particular retain the unit maps of Bott inversion and connective covers, not just their coefficient groups.

What GeneralizedCohomology must provide (gap:p-local-finite-duality): For every prime p, identify compact p-local spectra with retracts of finite p-local cell spectra, present every p-local spectrum as their filtered colimit, and prove p-local Spanier–Whitehead duality with p-local targets.

### From TauCetiRoadmap.BordismFormalGroups

Consume F1’s multiplication series, morphisms and geometric height, F2’s Quillen comparison and orientation-coordinate convention, F3’s actual BP-module cofibers and their associative-product qualifications, its Adams splitting ku_(p)≃∏_(i=0)^(p−2)Σ^(2i)BP⟨1⟩ at odd p and ku_(2)≃BP⟨1⟩ with the Bott cyclic action between the factors, and F5’s invariant ideals and marked algebraic deformations. F6.1 supplies L_E with its mapping-space universal property, exactness, unit and class comparisons. F6.2–F6.3 supply all-prime nilpotence including the H𝔽_p endpoint, type, thick classification, periodicity, central powers, positive-height telescopes with ⟨K(n)⟩≤⟨T(n)⟩ and choice-independent Bousfield class, and the p-local compactly generated finite quotient with its smashing property and finite-source telescope comparison, used on the associative endomorphism ring in GeneralAlgebraicKTheoryPartII §4.4. F6.3–F6.4 supply the Ravenel class identities, including ⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩, and L_n smashing, including the pro-constancy content of the Adams tower. F6.5 supplies coherent actions, generic transfer/norm and Tate/module naturality, general marked straightening and Kan extensions, the E(n)-locality of Landweber-exact theories whose coefficients vanish modulo I_(n+1), and the formula L_(K(n))X≃holim_i(L_nX∧M_i) for p-local X over F6.3’s cofinal generalized Moore tower M_i. These generic constructions underlie the chromatic applications.

Apply F6.5’s pointwise comma-category Kan-extension formula and composition theorem to a map f:X→Y of spaces and a spectrum-valued local system D: its left Kan extension at y is the colimit on fib_y(f), and taking the colimit over Y gives colim_XD. The slice is the homotopy fiber because X and Y are groupoids; all comparisons retain their naturality. §4.2 applies the same pointwise formula, and its dual for right Kan extensions, to local systems valued in any ∞-category C admitting the colimits or limits indexed by the homotopy fibers, to prove the Beck–Chevalley condition for pullback squares of spaces on which it builds the higher norms.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Consume E0.4–E0.5’s stable-category and space-indexed colimit comparison, E3’s coherent mates and Beck–Chevalley transformations of adjunctions, which give the base-change comparisons and the mates defining the norms of §4.2 (their invertibility for pullback squares of spaces is proved there), and E5’s stable monoidal enhancements. The spectral elliptic module category has the following additional exact contract, beyond ordinary derived modules on a ringed site.

What EnhancedDerivedSheaves must provide (gap:spectral-ringed-sites): For an algebraic stack with an étale sheaf of E∞ rings, construct quasicoherent spectral modules with affine-chart base change, étale descent, tensoring by spectra and the global-sections adjunction.

### From TauCetiRoadmap.StableHomotopyKTheory

Consume §2.4’s connecting map δ:π_(n+1)B→π_n hofib(f), §2.5’s identification of that connecting map with the boundary of GeneralizedCohomology G2.10’s arbitrary-map homotopy-fiber exact sequence, §2.6’s π₁(B)-action on π₀ of the fiber and §2.7’s transport of homotopy fibers along paths in the base, with its compatibility with δ; none of these needs an NDR hypothesis on a strict fiber inclusion. Consume §3.18’s space Postnikov sections and compatible convergent towers, with the twisted obstruction data of §3.21 for componentwise use; §§7.21–7.27’s coherent filtered spectra, exact couples, homological spectral sequences and their finite-filtration, bounded-below and derived-limit convergence criteria. By §7.24 the homological spectral sequence of an exhaustive filtration that vanishes in sufficiently negative filtration converges strongly, with no boundedness hypothesis on the coefficient spectrum; the lim¹ conditions of §7.26 concern complete towers and cohomological indexing.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stages 4–5’s based Hausdorff CW geometry, cofibrations, cellular and twisted ordinary homology, bundles and fibration comparisons, and Stage 8’s relative homotopy groups and exact sequence of based NDR pairs, Hurewicz, Whitehead and ordinary Eilenberg–Mac Lane representability, with their pair and connectivity hypotheses. Use GeneralizedCohomology G2.10 for the arbitrary-map homotopy-fiber sequence and StableHomotopyKTheory §§2.4–2.7 for its boundary and transport comparisons. Generalized Serre coefficients are constructed in Layer 3, with monodromy retained.

### From TauCetiRoadmap.DGFloer

Consume Layer 1 item 4’s Hurewicz theorem modulo a Serre class for simply connected spaces, applied in §4.3 to Tau Ceti's class `AddCommGrpCat.isKilledBySomePower` at d=p.

### From TauCetiRoadmap.EllipticCohomology

Consume E1’s stable one-pointed genus-one compactification and Hodge line; E2’s height-one/two marked Morava realizations, obstruction machinery and coherent automorphism actions; E3’s Otop sheaf, elliptic formal-group comparison and global spectra tmf→Tmf→TMF; E4’s actual surviving δ=Δ²⁴∈π₅₇₆Tmf with TMF≃Tmf[δ⁻¹]; E5’s units spectrum gl₁(R) of a commutative ring spectrum R in GeneralizedCohomology G2’s model, with Ω∞gl₁(R) the union of unit components of Ω∞R, its Thom-orientation mapping-space description, and its E₁ Thom refinement of loop-multiplicative spherical-fibration diagrams with the comparison to G5.3; E6’s Γ(N) level stacks, sheaf pullbacks and deck-group descent over ℤ[1/N] for every N≥1. Use their smooth restrictions to define TMF(N), retaining stacks at N=1,2; scheme representability is required only at N≥3. Use the all-height realization contract below. The affine chart objects used in Layer 5 retain their formal-group identification, including nodal height 1, and their integral treatment at 2 and 3. Layer 5 proves the faithful Galois property of TMF[1/N]→TMF(N) for every N≥1, so no level-three Galois extension is consumed here.

What EllipticCohomology must provide (gap:elliptic-spectral-affineness): Prove the symmetric monoidal equivalence QCoh(X,Otop)≃Mod_(Γ(X,Otop)) for X=M̄_ell and M_ell, including colimit preservation of global sections and compatibility with tensoring by every spectrum.

What EllipticCohomology must provide (gap:all-height-morava-realization): Extend the marked Goerss–Hopkins–Miller realization and coherent semilinear automorphism action to every finite height h≥1 over every perfect characteristic-p field, preserving the universal formal-group map and the chosen deformation identification.

### From TauCetiRoadmap.ModularCurves

Consume §3D’s naive–Drinfeld comparison where N is invertible, §4B’s smooth Weierstrass presentation and effective descent, §4C’s full ordered level-three torsor over ℤ[1/3], and §5B’s full ordered-basis schemes for N≥3, right row-vector GL₂(ℤ/Nℤ)-action and Weil-pairing determinant law. The small-level stacks come from EllipticCohomology E1/E6, not §5B’s scheme assertion. Consume §7E’s p-divisible groups, connected p-divisible comparison and ordinary/supersingular formal heights, and §7F’s Serre–Tate equivalence and universal deformation of the supersingular p-divisible group. No primitive N-th root is fixed in the full-level problem; for N=3 at 2 the deck group is GL₂(𝔽₃), of order 48.

### From TauCetiRoadmap.RefinedTraceMethods

Consume §2.6’s THH of E₁-rings with its circle action and cyclotomic Frobenius; §2.9’s TC; §2.10’s THH of small stable ∞-categories with THH(Perf(A))≃THH(A); §4.9’s connective and nonconnective K-theory of small stable ∞-categories, applied to Perf(A), the compact objects of the module category of an associative ring spectrum A (GeneralizedCohomology G2; EnhancedDerivedSheaves E5:presentability.1); §4.11’s natural cyclotomic trace K(A)→TC(A); and §6.8’s formula L_(K(1))X≃(L_(KU)X)_p^∧. The height-one localization comparison is used in §4.1.

### From TauCetiRoadmap.StableHomotopyKTheoryPartII

Consume §2.7's finite-type generalized Segal theorem at B=S: the Tate diagonal identifies S^tC_p with S_p^∧ for the trivial action. The sphere is bounded below and degreewise finite type over 𝔽_p; π₀S^tC_p=ℤ_p and its negative homotopy groups vanish. This is the sphere comparison used in §4.1, not just Tate p-completeness.

Consume §7.2's Tate coefficients of KU with trivial C_p-action, uncompleted, in the coordinate x=L−1: π₀KU^tC_p=ℚ_p(ζ_p), rational and even periodic. §4.1 proves the completed-input comparison with the same oriented tower and compares its result with this calculation.

### From TauCetiRoadmap.GeneralAlgebraicKTheoryPartII

Consume §§4.2–4.4's all-prime periodic homotopy, telescope support and cover invariance, and ring-acyclicity equivalence; §§4.5–4.9's finite towers with T(0)=S[1/p], compact kernels, p-local comparison, fracture and bottom comparison; §§4.10–4.12's finite telescopic and Bousfield–Kuhn functors, coherent finite-source comparisons, uniqueness and suspension–loop detection; §§4.13–4.16's connected-cover, fiberwise and nullification comparisons with their existential connectivity bound m≥n+1, whose sharp value m=n+1 is §4.3 below. Consume §§4.18–4.21's finite-height locality, T(n)/K(n) comparison on L_n-local inputs, height-one equality and BP support; §§4.22–4.25's localized norms, transfer splitting, telescopic Tate vanishing and raw finite-local blueshift; §§4.26–4.29's Morava power operations, Hahn theorem, ring height and Tate converse; and §§4.30–4.33's modular and Thom-family comparisons. Keep their hypotheses, units and coherent actions. In particular the positive-height ring-acyclicity comparison does not identify the two localization functors on arbitrary spectra.

For the Honda theory used in §§4.26–4.27, put k=𝔽_(p^(h+1)), h≥1. Its coefficient reduction is k[[u_h]]; in the specified p-typical orientation, [p](z)=z^(pʰ)g_h(z) modulo (p,u₁,…,u_(h−1)). The Weierstrass quotient is E⁰(BC_p)/(p,u₁,…,u_(h−1),g_h(z))≅k[[u_h]][z]/(g(z)), where g is Eisenstein of degree d=p^(h+1)−pʰ. All polynomial coefficients and the coordinate functionals extracting coefficients lie over k[[u_h]]. The quotient has residue field k and val(z)=1/d with val(u_h)=1; the imported valuation descent gives val(P(u_h))=(p−1)/d=p^(−h). (hahn, coefficient convention §2, p.3, hahn line 116; Propositions 4.2–4.5 and Corollary 4.5.2, pp.8–10, hahn line 347 and line 394.)

**Checks.**

- At p=2,h=1 the reduction is 𝔽₄[[u₁]], the quotient has rank 2, residue field of order 4, and val(z)=val(P(u₁))=1/2. Replacing k by 𝔽₂ would give only two residue elements.
- At p=3,h=1 the rank is 6, the residue field is 𝔽₉, val(z)=1/6 and val(P(u₁))=1/3; h=0 is excluded from the strict valuation decrease.
- The supplied Bousfield–Kuhn functor satisfies Φ_nΩ∞T(n)≃L_T(n)T(n)≠0, with the same finite-source uniqueness.

The following consumption applies only to ChromaticHomotopyTheory, Part II.

The Part II extension uses GeneralAlgebraicKTheoryPartII §5.5’s chromatic purity theorem: for every E₁ ring A and n≥1, the localization A→L_(T(n−1)∨T(n))A induces L_T(n)K(A)≃L_T(n)K(L_(T(n−1)∨T(n))A), with T(0)=S[1/p]. It also uses §5.2’s high-height cyclotomic trace: for every E₁ ring A and n≥2, the maps K(A)←K(τ_≥0A)→TC(τ_≥0A) are T(n)-equivalences. For a connective T(h+1)-acyclic E₁ ring A, h≥1, these two theorems give the connective comparisons L_T(h+1)K(L_T(h)A)≃L_T(h+1)K(A)≃L_T(h+1)TC(A) of bhls Theorem 6.1 (bhls line 2876), because L_(T(h)∨T(h+1))A=L_T(h)A for such A; purity applies equally to the nonconnective fixed-point ring. The trace for the (−1)-connective fixed-point rings and the BP-specific model are not part of this consumption: they are the fixed-point trace comparison and the BP model theorem of Part II in Scope and ownership.

## How to read the build

Layers 0–2 pin the supplied finite, oriented and nilpotence conventions. Layer 3 constructs the generalized Serre filtration. Layer 4 treats the raw KU Tate spectrum, constructs the Hopkins–Lurie higher norms and cardinalities from the supplied Kan extensions and compares them with the supplied finite-group norms, proves higher semiadditivity of the chromatic categories, and derives from it the sharp connectivity bound in periodic vanishing and the weak-ring height criterion. Layer 5 proves faithful spectral Galois descent along full level structures of every positive level. The separate Part II target combines the chromatic suppliers and purity with its own fixed-point trace comparison and BP model theorem. `README.md` is the roadmap; `Suggested.lean` states only headline theorems expressible on the pinned APIs.

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

## Layer 3: Generalized Serre theory

### 3.1 Generalized Serre filtration

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

### Examples

For the reflection mapping torus, the two-term differential is 1−(−1)=2, so H₂=0 and H₁=ℤ⊕ℤ/2; trivial transport would give H₂=ℤ and H₁=ℤ².

### Dependencies

StableHomotopyKTheory §§7.21–7.24; AlgebraicTopology Stages 4–5; GeneralizedCohomology G2.

## Layer 4: Raw Tate spectra and higher semiadditivity

### 4.1 Nonzero raw Tate spectra

For the trivial C_p-action on KU_p^∧, identify π₀((KU_p^∧)^tC_p) with ℚ_p(ζ_p), including ℚ₂ at p=2. This is nonzero, whereas its T(1)-localization vanishes. Compare the specified trivial-action sphere Tate spectrum with S_p^∧ through StableHomotopyKTheoryPartII §2.7’s Segal comparison: the sphere is not a T(n)-local input to the telescopic vanishing theorem. (greenlees-sadofsky, Corollary 2.4, p.400; greenlees-sadofsky line 343; hesselholt-ku, p.844; hesselholt-ku line 1658; cm-tate, Remark 2.8, p.4; cm-tate line 129).

*Proof route.* Apply the cyclic Tate comparison with the inverse Thom tower of the faithful complex line, and prove its completed KU Euler-inversion identification, with the inverse-limit and periodicity convergence conditions. Compare with the uncompleted KU formula of StableHomotopyKTheoryPartII §7.2, in the same coordinate z=L−1, and of hesselholt-ku line 1658; the completed comparison is proved using the same oriented tower, rather than assuming Tate commutes with completion. In KU⁰(BC_p) the relation is (1+z)^p−1=0. After inverting z it becomes ((1+z)^p−1)/z=0. Weierstrass preparation identifies the resulting quotient with ℤ_p[ζ_p][1/(ζ_p−1)]=ℚ_p(ζ_p). Establish the K(1)-locality of KU_p^∧ before invoking telescopic vanishing: inverting the Bott class in BordismFormalGroups F3’s Adams splitting gives KU_(p)≃∏_(i=0)^(p−2)Σ^(2i)E(1) at odd p and KU_(2)≃E(1); E(1) is E(1)-local by F6.5, being Landweber exact with E(1)_*/(p,v₁)=0; and F6.5’s formula at n=1, whose type-one tower is cofinal with the Moore spectra S/pⁱ, identifies L_(K(1))KU_(p) with holim_i KU/pⁱ=KU_p^∧. RefinedTraceMethods §6.8’s formula L_(K(1))X≃(L_(KU)X)_p^∧, applied to X=KU, gives the same conclusion directly. Use the Segal comparison only for the separate sphere example.

**Checks.**

- At p=2 the displayed field is nonzero.

- After T(1)-localization the KU example vanishes, agreeing with Kuhn’s theorem.

- At p=2, ((1+z)²−1)/z=2+z, so z=−2 and inverting z gives ℚ₂. At p=3 the equation is z²+3z+3=0, an Eisenstein polynomial, and the result is ℚ₃(ζ₃). Both are nonzero; their positive finite-height localizations are 0.

*Needs:* GeneralAlgebraicKTheoryPartII §4.24 (localized Tate vanishing); GeneralAlgebraicKTheoryPartII §4.20 (height-one class equality); GeneralizedCohomology G5.4 (oriented KU); BordismFormalGroups F3 (Adams splitting of ku_(p) with its Bott action) and F6.5 (E(n)-locality of Landweber-exact theories and the K(n)-localization formula), or RefinedTraceMethods §6.8 (K(1)-localization as p-completed KU-localization); StableHomotopyKTheoryPartII §2.7 (Segal comparison) and §7.2 (uncompleted KU Tate coefficients); the Euler-inversion calculation in this subsection.

### 4.2 Higher semiadditivity of chromatic local categories

Construct the Hopkins–Lurie norms and cardinalities. For an ∞-category C and a map of spaces q:A→B, write q^* for restriction of C-valued local systems and q_!, q_* for its left and right Kan extensions. For m≥−2 a space is m-finite when it is m-truncated with finitely many components and finite homotopy groups at every basepoint, and π-finite when it is m-finite for some m; a map of spaces is m-truncated, m-finite or π-finite when all its homotopy fibers are. First prove the Beck–Chevalley condition: for a map s:B′→B with pullback q′:A′→B′ of q and projection s′:A′→A, the canonical map q′_!s′^*→s^*q_! is an equivalence when C admits the colimits indexed by the homotopy fibers of q, and the canonical map s^*q_*→q′_*s′^* is an equivalence when C admits the corresponding limits (csy, Lemma 3.1.2, p.32; csy line 1597). Then define, by induction on m≥−2, when q is weakly m-C-ambidextrous and its canonical norm Nm_q:q_!→q_*. For m=−2, q is an equivalence and Nm_q is the identity of an inverse of q^*, which is both a left and a right adjoint of q^*. For m≥−1, q must be m-truncated, C must admit the colimits and limits indexed by its homotopy fibers, and the diagonal δ:A→A×_B A, which is (m−1)-truncated, must be (m−1)-C-ambidextrous; with pr₁,pr₂ the two projections of A×_B A, Nm_q is the mate under q^*⊣q_* of the composite q^*q_!≃(pr₂)_!pr₁^*→(pr₂)_!δ_!δ^*pr₁^*≃id, whose first map is the Beck–Chevalley equivalence, whose second is the wrong-way unit id→δ_*δ^*≃δ_!δ^* formed with the inverse of Nm_δ, and whose last uses pr₁δ=pr₂δ=id_A. The map q is m-C-ambidextrous when it is weakly m-C-ambidextrous and Nm_q is invertible, and C-ambidextrous when this holds for some m. C is m-semiadditive when it admits the colimits and limits indexed by m-finite spaces and every m-finite map of spaces is C-ambidextrous, and ∞-semiadditive when it is m-semiadditive for every m. (csy, Definitions 3.1.3 and 3.1.5, pp.32–33, and Definition 3.1.10, p.34; csy line 1603, line 1632 and line 1692.)

For a C-ambidextrous q and local systems X,Y on B, integration along q sends a map f:q^*X→q^*Y to the composite X→q_*q^*X→q_*q^*Y→q_!q^*Y→Y of the unit of q^*⊣q_*, q_*f, the inverse of Nm_q and the counit of q_!⊣q^*. The cardinality |q|_X:X→X is the integral of the identity of q^*X. For a space A whose map A→* is C-ambidextrous and a symmetric monoidal C with unit 1_C, the cardinality |A|∈π₀End(1_C) is |A→*| at 1_C. (csy, Definitions 2.1.11 and 2.1.13, p.17; csy line 672 and line 682.)

Prove that for every n≥1 the category Sp_T(n) of T(n)-local spectra and the category of K(n)-local modules over a Morava E-theory E_n of height n are ∞-semiadditive; the rational category Sp_ℚ is ∞-semiadditive by averaging, and it is the p-local height-zero case. Sp_T(0) on all spectra, with T(0)=S[1/p], is not 1-semiadditive, because primes q≠p are not inverted there. (csy, Theorem 5.3.1, p.79; csy line 3882).

Consequently, for every n≥0 and every map f:A→B of spaces whose homotopy fibers are π-finite and n-connected, Σ∞_+f is a T(n)-equivalence, with Hℚ in place of T(0) at n=0. For every localization L of p-local spectra with L(F(n+1))=0 for a finite type-(n+1) spectrum F(n+1), the map L(Σ∞_+f) is an equivalence. (csy, Theorem 5.3.5 and Corollary 5.3.7, pp.80–81; csy line 3930 and line 3970).

The construction has the following API.

- The canonical norm of an m-truncated map does not depend on the m≥−2 used to define it (csy, p.33, after Definition 3.1.5; csy line 1645).

- An equivalence of spaces is C-ambidextrous with the identity norm. If q:A→B and p:B→Z are (weakly) C-ambidextrous, so is pq, and its canonical norm is the composite of those of q and p. The base change of a (weakly) C-ambidextrous map along any map of spaces is (weakly) C-ambidextrous, and the base-change square carries the norm of q to that of its pullback. (csy, Proposition 3.1.9, p.34; csy line 1673.)

- For a functor F:C→D preserving the colimits indexed by (m−1)-finite spaces and an m-finite map q that is (weakly) C-ambidextrous and (weakly) D-ambidextrous, F carries the canonical norm of q in C to that in D (csy, Theorem 3.2.3, p.39; csy line 2000).

- For a spectrum E and a finite group G, the map BG→* is weakly 1-Sp_E-ambidextrous, and its canonical norm on a local system X:BG→Sp_E is the localized norm L_E(X_hG)→X^hG of GeneralAlgebraicKTheoryPartII §4.22. Thus BG→* is Sp_E-ambidextrous exactly when L_E(X^tG)=0 for every such X. (csy, Introduction, p.9; csy line 336.)

- A colimit-preserving symmetric monoidal functor between m-semiadditive categories preserves cardinalities. In Sp_T(n), |B^kC_p| is invertible for every k≥n≥1.

- For n≥1 choose E_n with perfect residue field k and let κ_n=E_n/(p,u₁,…,u_(n−1)) be its 2-periodic residue theory, with π_*κ_n=k[w,w⁻¹] and |w|=2, where w=u⁻¹ in Conventions. If a space X has κ_(n),1(X)=0 and dim_k κ_(n),0(X)=d<∞ (unreduced homology), then L_K(n)(E_n⊗Σ∞_+X) is dualizable of categorical dimension d (csy, Lemma 5.1.7, p.73; csy line 3639). The residue theory uses the regular coefficient-cofiber construction of BordismFormalGroups F3 and the marked realization of EllipticCohomology E2; it does not change the period 2(pⁿ−1) convention for K(n). For X=B^rC_p the dimension is p^(binom(n,r)), for every r≥0.

- A colimit-preserving symmetric monoidal functor from a 1-semiadditive presentably symmetric monoidal stable p-local category C to such a category D, which detects invertibility on π₀ of units and sends the spaces B^kC_p to objects of rational nonzero dimension, makes C and D ∞-semiadditive.

*Proof route.* Form the Beck–Chevalley maps and the mates as the coherent mates of EnhancedDerivedSheaves E3, and prove the Beck–Chevalley lemma from the pointwise Kan-extension formula of BordismFormalGroups F6.5 evaluated on homotopy fibers, as in Exact supplier contracts. Construct the canonical norms by induction on m, and prove independence of m, the identity, composition and base-change laws and the functoriality statement by the same induction (csy, Proposition 3.1.9, p.34, and Theorem 3.2.3, p.39; csy line 1673 and line 2000). For BG→* in Sp_E, the diagonal has finite discrete fibers G and Sp_E is stable, so the diagonal is Sp_E-ambidextrous with norm the comparison of finite sums and products and integration over a finite set is summation (csy, Example 3.1.12, p.35; csy line 1705); unwinding the diagonally induced norm through the pointwise formulas gives the localized norm of GeneralAlgebraicKTheoryPartII §4.22. Prove the bootstrap theorem: under the three hypotheses just listed, an induction on k shows that |B^kC_p| has rational nonzero image and that C is (k+1)-semiadditive, using the semiadditive power operation on π₀End(1_C) (csy, §4 and Theorem 4.3.10, pp.68–69; csy line 3445). Apply it to E_n[−]:Sp_T(n)→K(n)-local E_n-modules, X↦L_(K(n))(E_n⊗X). Its hypotheses are: 1-semiadditivity of Sp_T(n), which is GeneralAlgebraicKTheoryPartII §4.24 together with the identification of canonical and finite-group norms; detection of invertibility, from nil-conservativity of L_(K(n)) on Sp_T(n) (support of T(n) equal to {n}, GeneralAlgebraicKTheoryPartII §4.3) and conservativity of E_n⊗(−) on K(n)-local spectra (csy, Proposition 5.1.15 and Corollary 5.1.17, pp.76–77; csy line 3753 and line 3773); and the dimension formula, from the Ravenel–Wilson computation that κ_(n),*(K(ℤ/p,k)) is even and of rank p^(binom(n,k)) over κ_(n),* (csy, Corollary 5.1.9, p.74; csy line 3655, which quotes Ravenel–Wilson Theorem 9.2). The Ravenel–Wilson computation for n≥1 and k≥0, together with the rational computation at n=0 (rank p for k=0 and rank 1 for k≥1), is a target of this subsection. For the T(n)-equivalence, reduce to B=* by the fiberwise Kan-extension formula of GeneralAlgebraicKTheoryPartII §4.14, then induct up the Postnikov tower of the π-finite n-connected space A. Groups of order prime to p contribute nothing p-locally. Each layer B^kC_p with k>n is handled by the cardinality criterion for connected ambidextrous spaces together with invertibility of |B^(k−1)C_p| (csy, Proposition 3.1.18, p.37, and Lemma 5.3.4, p.80; csy line 1909 and line 3923). For a localization L killing F(n+1), L factors through the p-local finite localization L_n^f, which is localization at T(0)⊕⋯⊕T(n) (BordismFormalGroups F6.3).

**Checks.**

- For the two-point space {a,b}→* in a stable C, the map is 0-truncated, its diagonal is an inclusion of components, and the canonical norm X⊕X→X×X is the identity matrix, so |{a,b}|=id+id=2. The all-ones matrix, a plausible alternative, is not invertible and would make even finite sets non-ambidextrous.

- In Sp_ℚ the norm of BC_p→* on the unit with trivial action is multiplication by p on π₀=ℚ, so |BC_p|=p⁻¹ on π₀ of the unit; a cardinality formed with the norm in place of its inverse would give p.

- For trivial C₂ acting on Hℤ in Sp the canonical norm of BC₂→* is multiplication by 2 on π₀=ℤ, with cokernel ℤ/2=π₀(Hℤ^tC₂), agreeing with the Layer 4 Examples; a norm that were the identity on π₀ would give π₀(Hℤ^tC₂)=0. For an equivalence q the canonical norm is the identity.

- Sp_(p) is not 1-semiadditive: for the trivial C_p-action on H𝔽_p, π_k(H𝔽_p^tC_p) is the Tate cohomology Ĥ^(−k)(C_p;𝔽_p)=𝔽_p in every degree, so the norm for BC_p→* is not invertible: on π₀ of trivial H𝔽_p coefficients it is p=0. The diagonal of B²C_p→* has fiber BC_p; consequently B²C_p→* is not weakly 2-ambidextrous in Sp or Sp_(p), and its higher norm cannot be constructed by this induction there. In Sp_ℚ the C_p-norm on Hℚ is multiplication by p on π₀, which is invertible.

- The dimension of BC_p in K(n)-local E_n-modules is p^n: E_n^0(BC_p)=E_n^0[[z]]/[p](z) is free of rank p^n by Weierstrass preparation, giving p and p² at heights 1 and 2. At n=k=2 the formula p^(binom(n,k)) gives p, whereas the plausible alternative p^(nk) gives p⁴. For k>n it gives 1, matching the vanishing reduced K(n)-homology of K(ℤ/p,k); p^(nk) would contradict it.

- At n=1 the map BC_p→* has π-finite but only 0-connected fiber, and K(1)⊗Σ∞BC_p≠0 because K(1)^*(BC_p) has rank p>1; so the n-connectivity hypothesis cannot be weakened to (n−1)-connectivity. The 1-connected K(C_p,2)→* has rank p^(binom(1,2))=1, so its reduced K(1)-homology is 0, as the theorem predicts.

- For X=S² at p=2,n=2 with k=𝔽₄, κ_(2),0(S²)=k² and κ_(2),1(S²)=0. Thus E₂⊗Σ∞_+S²≃E₂⊕Σ²E₂ has dimension 2. In contrast the convention K(2)_*=𝔽₂[v₂,v₂⁻¹], |v₂|=6 gives K(2)_0(S²)=𝔽₂ and K(2)_1(S²)=0, which would incorrectly predict dimension 1. At p=3,n=1 the period-four theory likewise gives degree-zero dimension 1 while κ_(1),0(S²)=k² and the module dimension is 2.

- For X=* the residue homology has dimension 1 and the module is E_n; for X=∅ both are zero. For S¹, κ_(n),1(S¹)=k≠0, so the evenness hypothesis excludes the false positive dimension 1 (the categorical dimension of E_n⊕ΣE_n is 0).

*Needs:* GeneralAlgebraicKTheoryPartII §§4.3–4.4 (telescope support and ring acyclicity), §4.14 (fiberwise comparison) and §§4.22–4.24 (localized norms and telescopic Tate vanishing); EllipticCohomology E2 with gap:all-height-morava-realization; BordismFormalGroups F1/F3/F5 (p-series, regular residue cofibers and Weierstrass preparation), F6.2–F6.3 (nilpotence, type and finite localization), and F6.5 (finite-group norms, coherent local systems, and Kan extensions with their pointwise formula and composition); EnhancedDerivedSheaves E3 (coherent mates); StableHomotopyKTheory §3.18 (Postnikov towers); the Beck–Chevalley lemma, canonical norms, cardinalities, bootstrap, dimension formula and Ravenel–Wilson computation in this subsection.

### 4.3 The sharp connectivity bound in periodic vanishing

GeneralAlgebraicKTheoryPartII §§4.15–4.16 give, for each n≥1, an existential connectivity bound m≥n+1. Prove that m=n+1 suffices, at every prime p and every n≥1:

- if X is an (n+1)-connective pointed space whose v_i-periodic homotopy groups vanish for 0≤i≤n, with the height-zero groups π_*(X)[1/p] of GeneralAlgebraicKTheoryPartII §4.2, then Σ∞X is L_n^(p,f)-acyclic;
- an (n+1)-connective map of spaces which is a v_i-periodic equivalence for every 0≤i≤n, at every choice of basepoints, induces L_n^(p,f)-equivalences on Σ∞_+ and, for every choice of basepoints, on Σ∞;
- Σ∞Ω∞ preserves (n+1)-connective L_n^(p,f)-equivalences of spectra.

The value n+1 cannot be lowered: K(ℤ/p,n) is n-connective and its periodic groups vanish at every height 0≤i≤n, but its reduced K(n)-homology has rank p−1, so Σ∞K(ℤ/p,n) is not T(n)-acyclic. (lmmt, Remark 2.12, p.10; lmmt line 406; csy, Theorem 5.3.5, p.80; csy line 3930.)

*Proof route.* For the first assertion let m be the bound of GeneralAlgebraicKTheoryPartII §4.15. The Postnikov map X→τ_≤(m−1)X has m-connective fibers X⟨m⟩, and both ends have vanishing periodic groups at heights 0 through n: the target is bounded, and its p-inverted groups are those of X in degrees below m. So §4.15's map statement makes Σ∞X→Σ∞τ_≤(m−1)X an L_n^(p,f)-equivalence. The space F=τ_≤(m−1)X is simply connected, with p-primary torsion homotopy groups in degrees n+1 through m−1. Induct up its Postnikov tower (StableHomotopyKTheory §3.18) with the fiberwise comparison of GeneralAlgebraicKTheoryPartII §4.14. Each layer is K(A,k) with k≥n+1 and A a p-primary torsion abelian group, the filtered colimit of the K(A_α,k) over the finite subgroups A_α of A, and homology commutes with that colimit (GeneralizedCohomology G3.7). For 1≤i≤n and finite A_α, the map K(A_α,k)→* has π-finite (k−1)-connected fiber with k−1≥n≥i, so §4.2 above makes Σ∞K(A_α,k) T(i)-acyclic. At i=0, Hurewicz modulo the Serre class `AddCommGrpCat.isKilledBySomePower` at d=p (DGFloer Layer 1 item 4), applied to the simply connected spaces K(A_α,k) and their suspensions, shows that the stable homotopy groups of Σ∞K(A_α,k) are annihilated by powers of p, so S[1/p]⊗Σ∞K(A_α,k)=0. The second and third assertions follow from the first by the proofs of GeneralAlgebraicKTheoryPartII §§4.15–4.16 with m=n+1: every homotopy fiber of a map as in the second assertion satisfies the first, and for spectra apply the second to Ω∞ of the map, whose periodic groups agree with the stable ones (GeneralAlgebraicKTheoryPartII §4.2). For the lower bound use the Ravenel–Wilson computation of §4.2 at k=n and BordismFormalGroups F6.3's ⟨K(n)⟩≤⟨T(n)⟩.

**Checks.**

- At n=1 the bound is 2. K(ℤ/p,2) is 2-connective and bounded, with p-torsion homotopy, so Σ∞K(ℤ/p,2) is L_1^(p,f)-acyclic. BC_p=K(ℤ/p,1) satisfies every hypothesis except 2-connectivity, and K(1)^*(BC_p) has rank p, so its reduced K(1)-homology has rank p−1≥1 and Σ∞BC_p is not T(1)-acyclic.
- The height-zero hypothesis uses the global convention T(0)=S[1/p]. For a prime q≠p, Σ∞K(ℤ/q,n+1) is T(i)-acyclic for 1≤i≤n, since its stable homotopy is q-primary torsion and T(i) is p-local, but π_(n+1)[1/p]=ℤ/q≠0 and H̃_(n+1)(K(ℤ/q,n+1);ℤ[1/p])=ℤ/q, so it is not S[1/p]-acyclic. With Hℚ in place of S[1/p], as in L_n^f, it would be acyclic.
- For the third assertion, Σ^(n+1)H𝔽_p→0 is an (n+1)-connective L_n^(p,f)-equivalence and Σ∞Ω∞ turns it into Σ∞K(ℤ/p,n+1)→0, an L_n^(p,f)-equivalence by the first assertion. The n-connective Σ^nH𝔽_p→0 is also an L_n^(p,f)-equivalence, but it gives Σ∞K(ℤ/p,n)→0, which is not a T(n)-equivalence.
- For X=K(ℤ/p^∞,n+1), whose homotopy group is p-primary torsion but infinite, the filtered colimit of the K(ℤ/pʳ,n+1) gives L_n^(p,f)Σ∞X=0; a version restricted to finite homotopy groups would not reach it.

*Needs:* GeneralAlgebraicKTheoryPartII §4.2 (periodic homotopy groups and their height-zero convention), §4.14 (fiberwise comparison) and §§4.15–4.16 (existential bound, map and suspension–loop statements); §4.2 above (π-finite comparison and the Ravenel–Wilson computation); BordismFormalGroups F6.3 (⟨K(n)⟩≤⟨T(n)⟩); StableHomotopyKTheory §3.18 (Postnikov towers); GeneralizedCohomology G3.7 (homology and filtered colimits); DGFloer Layer 1 item 4 (Hurewicz modulo a Serre class).

### 4.4 The weak-ring height criterion

A weak ring is a spectrum R with maps η:S→R and μ:R⊗R→R such that μ∘(η⊗id_R) is homotopic to id_R; no associativity and no second unit law is required. Every homotopy ring spectrum is a weak ring, and the tensor product of two weak rings is one. For every prime p, every n≥0 and every nonzero p-local weak ring R, prove that the following are equivalent:

- F(n+1)⊗R=0 for some finite p-local spectrum F(n+1) of type n+1;
- Σ∞K(C_p,n+1)⊗R=0;
- K(j)⊗R=0 for every j with n<j≤∞, including K(∞)=H𝔽_p;
- for every map f of π-finite spaces inducing an equivalence on n-th Postnikov sections, Σ∞_+f⊗R is an equivalence.

(csy, Definition 5.1.4, p.73; csy line 3616; Theorem 5.4.4 and Remark 5.4.5, pp.83–84; csy line 4036 and line 4060.)

*Proof route.* The first condition gives the second by the localization statement of §4.2 above, applied to L_R, which kills F(n+1), and to K(C_p,n+1)→*, whose fiber is π-finite and n-connected. For the second implies the third, suppose K(j)⊗R≠0 for some n<j≤∞. Since K(j)⊗X is a sum of shifts of K(j) for every X, every K(j)-module is then R-local (csy, Lemma 5.1.12, p.75; csy line 3705). So K(j)⊗Σ∞K(C_p,n+1) is R-local; it is nonzero by the Ravenel–Wilson computation of §4.2 for finite j and by H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p for j=∞; yet its R-localization vanishes because L_R(Σ∞K(C_p,n+1))=0. For the third implies the first, take F(n+1) to be a homotopy ring, for instance DV⊗V for a finite type-(n+1) complex V. Then F(n+1)⊗R is a weak ring whose Morava support {n+1,…,∞}∩{0,…,n} is empty, and the nilpotence theorem of BordismFormalGroups F6.2, applied to its unit, shows that a weak ring killed by K(j) for every 0≤j≤∞ is zero (csy, Theorem 5.1.14, p.76; csy line 3731). The fourth condition gives the second for K(C_p,n+1)→*. Conversely, compare A and B with their common n-th Postnikov section: both comparison maps have π-finite n-connected fibers. Induct up the Postnikov towers of those fibers with the fiberwise comparison of GeneralAlgebraicKTheoryPartII §4.14. The path fibrations K(C_p,k)→*→K(C_p,k+1) carry the vanishing from k=n+1 to every k≥n+1, and layers of order prime to p contribute nothing p-locally.

**Checks.**

- For R=Hℚ and n=0, with F(1)=S/p: F(1)⊗R=0, the reduced rational homology of BC_p is 0, and K(j)⊗Hℚ=0 for 1≤j≤∞; all four conditions hold.
- For R=H𝔽_p and every n, K(j)⊗R=0 for every finite j>n but K(∞)⊗R≠0, and H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p≠0. Omitting j=∞ from the third condition would make it hold while the second fails.
- For 1≤i≤n and R=T(i), the telescope of a homotopy ring of type i, the support is {i}, so the third condition holds and the criterion gives T(i)⊗Σ∞K(C_p,n+1)=0, the same Eilenberg–Mac Lane vanishing that §4.3 obtains directly from §4.2.
- The weak-ring hypothesis cannot be dropped. The Brown–Comenetz dual I_(ℚ/ℤ) of the sphere has empty Morava support, so it satisfies the third condition for every n. But F(n+1)⊗I_(ℚ/ℤ) is the Brown–Comenetz dual of the nonzero finite spectrum DF(n+1), which is nonzero. (csy, Example 5.1.13(4), p.76; csy line 3726.)

*Needs:* §4.2 above (localization statement and Ravenel–Wilson computation); BordismFormalGroups F6.2 (nilpotence theorem including the H𝔽_p endpoint) and F6.3 (type and Morava support of finite complexes and telescopes); GeneralAlgebraicKTheoryPartII §4.14 (fiberwise comparison); StableHomotopyKTheory §3.18 (Postnikov towers).

### Examples

For trivial C₂ on Hℤ, π_j(Hℤ^tC₂)=ℤ/2 for even j and 0 for odd j. In contrast the sphere Segal comparison has π₀=ℤ₂ and no negative homotopy. The KU₂^∧ example has π₀=ℚ₂, yet its T(1)-localization is zero. (cm-tate, Definition 2.2, p.2, cm-tate line 70; StableHomotopyKTheoryPartII §2.7.)

### Dependencies

GeneralAlgebraicKTheoryPartII §§4.2–4.4, 4.14–4.16 and 4.20–4.24; GeneralizedCohomology G3.7 and G5.4; BordismFormalGroups F1/F3/F5/F6; EnhancedDerivedSheaves E3; EllipticCohomology E2 with gap:all-height-morava-realization; StableHomotopyKTheory §3.18; StableHomotopyKTheoryPartII §§2.7 and 7.2; RefinedTraceMethods §6.8; DGFloer Layer 1 item 4.

## Layer 5: Full-level spectral Galois extensions

### 5.1 Full-level Galois extensions

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

- N=1 gives the identity TMF→TMF and the trivial group of order 1. N=2 gives GL₂(𝔽₂)≃S₃, of order (4−1)(4−2)=6; the automorphism −1 of a generic elliptic curve fixes its 2-torsion basis, so this level object remains a stack. N=3 gives order (9−1)(9−3)=48, and N=5 gives (25−1)(25−5)=480. At N=2 the base is ℤ[1/2] and ℤ[1/2]⊗ℤ_(2)=ℚ, so 2-localizing the level-two extension rationalizes it; at N=3 the base is ℤ[1/3] and ℤ[1/3]⊗ℤ_(2)=ℤ_(2), so the level-three extension survives 2-localization integrally. (mm, Example 7.5, p.37; mm line 1776).

- At N=3 let g and h be the upper and lower unipotent matrices with off-diagonal entry 1. Then ((P,Q)g)h=(2P+Q,P+Q), whereas ((P,Q)h)g=(P+Q,P+2Q); pullback reverses map composition and gives the left action on sections used in b₁g(b₂). The matrix diag(−1,1) changes the Weil pairing ζ to ζ⁻¹, so fixing ζ would discard determinant components.

- For G=C₂ and B=A×A, B⊗_A B=A⁴=∏_G B and B^hG=A. For B=0,A=Hℤ, the map M↦B⊗_AM kills Hℤ≠0, so it is not conservative. |GL₂(𝔽₃)|=(9−1)(9−3)=48.

- For the trivial S₃-torsor, B=∏_(S₃)A has 6 factors, B⊗_A B has 36 factors and ∏_(S₃)B has 36 factors. Homotopy fixed points recover A and projection to one factor makes base change conservative.

*Needs:* EllipticCohomology E1/E3/E6 (smooth level stacks, Γ(N) sheaves, sections and deck-group descent for all N≥1); ModularCurves §3D (naive level comparison with N inverted), §4C (level-three torsor) and §5B (ordered-basis schemes and their right action for N≥3); EllipticCohomology gap:elliptic-spectral-affineness and EnhancedDerivedSheaves gap:spectral-ringed-sites.

### Examples

At N=1 the Galois group is trivial and the extension is the identity. At N=2 its order is 6 and the level object remains a stack; at N=3 its order is 48. In the p=2 supersingular specialization the order 48 includes the residue-field involution, while at p=3, where level three is not available, the extended automorphism group of the supersingular curve over 𝔽₉ has order 24=12·2. (mm, Example 7.5 and Theorem 7.6, pp.37–38, mm line 1776 and line 1801; behrens, Proposition 1.6.12, pp.30–31, behrens line 1160.)

### Dependencies

EllipticCohomology E1/E3/E6 and gap:elliptic-spectral-affineness; EnhancedDerivedSheaves E5 with gap:spectral-ringed-sites; ModularCurves §§3D, 4C and 5B.

## Downstream consumers

ChromaticHomotopyTheory, Part II uses the chromatic suppliers, purity and its own fixed-point trace comparison and BP model theorem for its higher-height separation target. The generalized Serre filtration supports periodic-space comparisons, the sharp connectivity bound gives the optimal connectivity in periodic vanishing and suspension–loop preservation, and the full-level spectral Galois theorem supplies modular descent at arbitrary level without excluding the small-level stack cases.

## References

The keys below identify the cited editions and versions. Source line numbers refer to their numbered text extractions; theorem, section and page locators identify the same passages independently.

- **lmmt** — Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme, [Purity in chromatically localized algebraic K-theory](https://arxiv.org/abs/2001.10425v5), 2020. Introduction, pp.3–4, for the commutative-ring height convention.; §2.1–2.2, pp.6–10; Remark 3.9, pp.15–16; §4.2, pp.19–21; §4.3 and Corollary 4.21 with proof, pp.21–22.
- **hs** — Michael J. Hopkins and Jeffrey H. Smith, [Nilpotence and stable homotopy theory II](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf), 1998. Theorems 3,7,9,11, pp.2–6; preliminaries, p.9; §1.1–1.4, pp.10–14; Lemma 2.1 and §2.1–2.2, pp.15–19; Lemmas 3.5–3.6 and Corollaries 3.7–3.8, p.21.
- **ravenel** — Douglas C. Ravenel, [Localization with respect to certain periodic homology theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf), 1984. §2, definitions and Theorem 2.1 with proof, pp.360–363.
- **cm-tate** — Dustin Clausen, Akhil Mathew, [A short proof of telescopic Tate vanishing](https://arxiv.org/abs/1608.02063v2), 2016. Entire paper, pp.1–4; Proposition 2.3, Lemma 2.4, Theorems 2.5–2.6 and Corollary 2.7.
- **hahn** — Jeremy Hahn, [On the Bousfield classes of H∞-ring spectra](https://arxiv.org/abs/1612.04386v2), 2016. §1–2, pp.1–4, including Definition 1.2 and Theorem 1.3, p.1; §3, Definition 3.1 and Theorem 3.3, p.5, Bockstein section Lemma 3.7, pp.6–7, and proof pp.7–8; §2, Remark 2.2, Definitions 2.3–2.4 and Lemma 2.5, pp.3–4, for the Tate-valued Frobenius; §4, Propositions 4.2–4.5 with the H∞ orientation used in the proof of Proposition 4.5, Corollaries 4.5.1–4.5.3, Corollary 4.6.1 and Proposition 4.7, pp.8–10.
- **csy** — Shachar Carmeli, Tomer M. Schlank, Lior Yanovski, [Ambidexterity in Chromatic Homotopy Theory](https://arxiv.org/abs/1811.02057v3), 2018. Introduction, p.9; §2.1, Definitions 2.1.11 and 2.1.13, p.17; §3.1, Lemma 3.1.2 and Definition 3.1.3, p.32, Definition 3.1.5, p.33, Proposition 3.1.9 and Definition 3.1.10, p.34, Example 3.1.12, p.35, and Proposition 3.1.18, p.37; §3.2, Theorem 3.2.3, p.39; §4, Theorem 4.3.10, pp.68–69; §5.1, Definition 5.1.4 and Lemma 5.1.7, p.73, Corollary 5.1.9, p.74, Lemma 5.1.12, p.75, Example 5.1.13, Theorem 5.1.14 and Proposition 5.1.15, p.76, Corollary 5.1.17, p.77; §5.3, Theorem 5.3.1, p.79, Lemma 5.3.4 and Theorem 5.3.5, p.80, Corollary 5.3.7, p.81; §5.4, Theorem 5.4.4 and Remark 5.4.5, pp.83–84.
- **bhm** — Tobias Barthel, Gijs Heuts, Lennart Meier, [A Whitehead theorem for periodic homotopy groups](https://arxiv.org/abs/1811.04030v2), 2018. §3, Theorem 3.1, p.5, and Lemmas 3.2–3.3, p.6; Lemma 3.5, p.6.
- **mm** — Akhil Mathew, Lennart Meier, [Affineness and chromatic homotopy theory](https://arxiv.org/abs/1311.0514v5), 2013. §4, Theorems 4.5–4.7 and Corollary 4.8, pp.26–27; §7, Theorems 7.1–7.2, pp.35–37, and Theorem 7.6, p.38.
- **behrens** — Mark Behrens, [Topological modular and automorphic forms](https://arxiv.org/abs/1901.07990v2), 2019. §1.2, pp.4–8; Theorem 1.3.2, pp.9–10; §1.3 discriminant localization, p.13; §1.4 permanent cycles, pp.16,21; §1.5, pp.21,23; §1.6 chromatic localizations, pp.27–32; Theorem 1.7.6, pp.33–34.
- **goerss** — Paul G. Goerss, [Topological modular forms [after Hopkins, Miller, and Lurie]](https://numdam.org/item/AST_2010__332__221_0.pdf), 2010. Theorem 1.2 and Definition 1.3, pp.224–225; §3.3 and Theorem 3.6, pp.238–239.
- **bhls** — Robert Burklund, Jeremy Hahn, Ishan Levy, Tomer M. Schlank, [K-theoretic counterexamples to Ravenel's telescope conjecture](https://arxiv.org/abs/2310.17459v1), 2023. Introduction, Theorem A and the three localization categories, pp.2–5; Definitions 4.1 and 4.2, p.37; Corollary 4.33, pp.51–52; Theorem 5.4, pp.53–54; Theorems 6.1–6.2 and Corollary 6.3, pp.66–67; Theorem 6.25, pp.73–74.
- **greenlees-sadofsky** — J. P. C. Greenlees and Hal Sadofsky, [The Tate spectrum of v_n-periodic complex oriented theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/greenlees-sadofsky.pdf), 1996. Corollary 2.4, p.400, and Corollary 1.4, p.395, with proof p.402; greenlees-sadofsky line 343 and line 413.
- **hesselholt-ku** — Jonas McCandless, [Topological Hochschild homology of E∞-rings](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/hesselholt-scholze.pdf), in Arbeitsgemeinschaft: Topological Cyclic Homology, Oberwolfach Report 15/2018, pp.838–845, especially p.844; hesselholt-ku line 1658. The KU calculation is for uncompleted KU; §4.1 proves the completed comparison through the oriented Tate tower.
- **hahn-wilson** — Jeremy Hahn and Dylan Wilson, [Redshift and multiplication for truncated Brown–Peterson spectra](https://arxiv.org/abs/2012.00864v5), 2022. Theorem B and its following corollary, p.3; Corollary 5.0.2 with proof, p.40. Numbering is that of arXiv v5; the trace factors through the nonzero height-(h+1) detector used by the BP model theorem of Part II.
