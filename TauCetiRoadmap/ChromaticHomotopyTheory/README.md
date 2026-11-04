# Roadmap: chromatic homotopy theory

**Summary.** Build generalized Serre filtrations, chromatic higher semiadditivity, the nonzero raw Tate spectrum of completed complex K-theory, positive-height real Bott comparisons and faithful full-level modular Galois extensions. These extend the periodic-detection, finite-local and Tate interfaces of GeneralAlgebraicKTheoryPartII and the realizations of EllipticCohomology, at every prime. Higher-height telescope separation is the specified Part II extension.

## Scope and ownership

This roadmap owns the generalized Serre filtration with monodromy and convergence (Layer 3), the completed KU Euler-inversion calculation and the chromatic application of higher semiadditivity (Layer 4), the positive-height real Bott comparison (Layer 5), and the full-level modular Galois theorem for every positive level (Layer 6). The latter extends the level-three Galois contract of EllipticCohomology E6. Generic higher norms and the weak-ring finite-Postnikov criterion retain the BordismFormalGroups F6.5 contract; the sharp connectivity applications retain GeneralAlgebraicKTheoryPartII §§4.15–4.16.

- GeneralAlgebraicKTheoryPartII §§4.2–4.4 own periodic groups, telescope criteria and ring acyclicity; §§4.5–4.9 own all-spectra finite localization, kernels, p-local comparison, fracture and bottom comparison; §§4.10–4.12 own finite telescopic and Bousfield–Kuhn functors and suspension–loop detection, including finite-source compatibility and uniqueness.
- GeneralAlgebraicKTheoryPartII §§4.13–4.16 own connected covers, fiberwise homology, finite nullification, connective vanishing and preservation; §§4.18–4.21 own finite-height locality, restricted telescope comparison, height-one equality and BP support; §§4.22–4.25 own local norms, transfer splitting, telescopic Tate vanishing and raw finite-local blueshift; §§4.26–4.29 own Morava power operations, Hahn acyclicity, ring height and the Tate converse; §§4.30–4.33 own the modular chromatic comparison, Hopkins–Mahowald and filtered Thom families with their acyclicity and the James application. Its §4.20 does not assert the higher-height separation theorem of Part II below.
- EllipticCohomology E2 supplies marked Morava realization and semilinear actions, including the all-height extension in its named contract; E3–E4 supply Otop, tmf, Tmf, TMF and discriminant inversion; its affineness contract supplies the spectral module equivalence. E5 supplies relative Thom colimits and their multiplicative refinements; E6 supplies spectral level stacks. The level-three Galois and the supersingular comparisons at 2 and 3 retain its named contracts.
- GeneralizedCohomology G2–G3 and G5 supply spectra, derived spectral constructions, finite duality and Bott spectra. BordismFormalGroups F1–F3/F5 supply orientations, formal groups and coefficients; F6.1–F6.4 supply p-local localization, nilpotence and periodicity, and F6.5 supplies generic actions, Kan extensions and Tate constructions. Layers 0–2 give convention Checks on these inputs.
- StableHomotopyKTheory §§2.4–2.7 and §3.18 supply fiber transport and Postnikov towers, and §§7.21–7.27 filtered spectral sequences and convergence. AlgebraicTopology Stages 4–5 and 8 supply CW geometry, local coefficients and relative homotopy. Layer 3 adds the spectrum-valued Serre filtration, beyond GeneralAlgebraicKTheoryPartII §4.14's unfiltered homology comparison.
- HomotopySpheres §§3A–3B and §4B supply convenient spaces, James constructions and real Bott periodicity; TopologicalKTheory T7 supplies Clifford coefficients. ModularCurves §§3D, 4B–4C, 5B and 7E–7F supply geometric levels, their actions and formal-height comparisons. EnhancedDerivedSheaves E5 supplies spectral-module descent through its named contract.
- StableHomotopyKTheoryPartII §2.7 owns the sphere Segal comparison, and its §7.2 owns the uncompleted KU Tate coefficients; §4.1 below adds only the completed-input comparison. RefinedTraceMethods §§2.6, 2.9–2.10, 4.9, 4.11 and 6.8 supply THH, TC, K, the trace and the height-one KU-localization comparison.

Mathlib already supplies `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.Point`, `FormalGroup.map`, `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ` and `CategoryTheory.ObjectProperty.isLocal`. Tau Ceti already supplies `WeierstrassCurve.formalGroup`. These are the native algebraic carriers; the ordinary precomposition predicate does not itself construct a spectral reflector. No formal-group point calculation is a substitute for a chromatic headline theorem.

**ChromaticHomotopyTheory, Part II.** The extension starts with higher-height telescope separation, after the supplied periodic, finite-local, Tate and ring-height interfaces and Layers 0–6. It uses the purity and redshift results of GeneralAlgebraicKTheoryPartII §§5.2, 5.5 and 6.5. Its complete separation target and the extra supplier contracts are specified here as the ownership boundary; these are inputs and targets of Part II, not of the layers below.

At every prime and every n≥2 there is a T(n)-local spectrum X which is not K(n)-local. More precisely, for every n≥2 and k≥0 use the p-complete associative truncated Brown–Peterson model and coherent Adams ℤ-action of the Part II contract gap:bhls-bp-redshift and set X(p,n,k)=L_(T(n))K(BP⟨n−1⟩^(h pᵏℤ)); prove that X(p,n,k) is not K(n)-local. The model retains its E₁⊗A₂ structure and the specified Adams action. Its cyclotomic non-hyperdescent argument uses GeneralAlgebraicKTheoryPartII §5.5’s purity theorem and §5.2’s high-height cyclotomic trace, the fixed-point trace contract gap:bhls-purity-comparison and the BP-model contract gap:bhls-bp-redshift, in addition to GeneralAlgebraicKTheoryPartII §4.4’s ring-acyclicity result. This is the precise limit of the L_n-local comparison in GeneralAlgebraicKTheoryPartII §4.19. (bhls, Introduction, Theorem A, pp.2–4; bhls line 98).

*Proof route for Part II.* At n≥2 construct the BHLS T(n)-localized algebraic K-theory witness and the Adams-operation homotopy-fixed-point comparison, and prove the cyclotomic non-hyperdescent separating its T(n) and K(n) localizations. The algebraic K-theory, THH, TC and trace carriers are RefinedTraceMethods §§2.6, 2.9, 2.10, 4.9 and 4.11; the coassembly and cyclotomic-completion construction belongs to this target. Let B be the model of gap:bhls-bp-redshift with h=n−1. Its fp-type n−1 makes U⊗B bounded for a type-n U with v_n self-map v, so a power of v is null on U⊗B and B is T(n)-acyclic; so is B^(h pᵏℤ), the fiber of a self-map of B. For a T(n)-acyclic E₁ ring C, L_(T(n−1)∨T(n))C=L_T(n−1)C, so GeneralAlgebraicKTheoryPartII §5.5’s purity theorem gives L_T(n)K(L_T(n−1)C)≃L_T(n)K(C) for C=B and C=B^(h pᵏℤ). GeneralAlgebraicKTheoryPartII §5.2’s high-height trace gives L_T(n)K(B)≃L_T(n)TC(B) and hence its pᵏℤ-homotopy fixed points; gap:bhls-purity-comparison gives the trace for the (−1)-connective ring B^(h pᵏℤ). For any functor F and coherent G-object A, the comparison F(A^hG)→F(A)^hG comes from applying F to the limit cone A^hG→A. The coassembly maps F(B^(h pᵏℤ))→F(B)^(h pᵏℤ) connect the two rows by naturality; they are not asserted to be equivalences. Use gap:bhls-bp-redshift for the height-(n−1) Lichtenbaum–Quillen property, which with fp-type n−1 gives the telescopic asymptotic constancy of the TC coassembly maps for k≫0, and for T(n)⊗TC(BP⟨n−1⟩)≠0. Prove the cyclotomic completion/coassembly theorem using these inputs, retaining every prime and n≥2 (bhls, Corollary 4.33, pp.51–52, Corollary 6.3 and Theorem 6.25, pp.66–67,73–74; bhls line 2227, line 2893 and line 3194).

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

### From TauCetiRoadmap.GeneralizedCohomology

Consume G2’s actual symmetric spectral model, derived monoidal and module categories, commutative rings and algebra localization; G2.10’s mapping-path homotopy fibers and their arbitrary-map exact sequence, including the pointed-set end; G3.4/G3.7/G3.9’s homotopy-colimit, compact-object and integer-localization comparisons, including G3.7’s finite-CW suspension-spectrum mapping formula, which represents a stable map of finite complexes after finitely many suspensions; G3.8’s multiplicative connective covers and spectral Postnikov sections; G4.5’s real, complex and quaternionic orientation data; G5.1’s finite duality and G5.4’s real and complex Bott spectra. In particular retain the unit maps of Bott inversion and connective covers, not just their coefficient groups.

What GeneralizedCohomology must provide (gap:p-local-finite-duality): For every prime p, identify compact p-local spectra with retracts of finite p-local cell spectra, present every p-local spectrum as their filtered colimit, and prove p-local Spanier–Whitehead duality with p-local targets.

### From TauCetiRoadmap.BordismFormalGroups

Consume F1’s multiplication series, morphisms and geometric height, F2’s Quillen comparison and orientation-coordinate convention, F3’s actual BP-module cofibers and their associative-product qualifications, its Adams splitting ku_(p)≃∏_(i=0)^(p−2)Σ^(2i)BP⟨1⟩ at odd p and ku_(2)≃BP⟨1⟩ with the Bott cyclic action between the factors, and F5’s invariant ideals and marked algebraic deformations. F6.1 supplies L_E with its mapping-space universal property, exactness, unit and class comparisons. F6.2–F6.3 supply all-prime nilpotence including the H𝔽_p endpoint, type, thick classification, periodicity, central powers, positive-height telescopes with ⟨K(n)⟩≤⟨T(n)⟩ and choice-independent Bousfield class, and the p-local compactly generated finite quotient with its smashing property and finite-source telescope comparison, used on the associative endomorphism ring in GeneralAlgebraicKTheoryPartII §4.4. F6.3–F6.4 supply the Ravenel class identities, including ⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩, and L_n smashing, including the pro-constancy content of the Adams tower. F6.5 supplies coherent actions, generic transfer/norm and Tate/module naturality, general marked straightening and Kan extensions, the E(n)-locality of Landweber-exact theories whose coefficients vanish modulo I_(n+1), and the formula L_(K(n))X≃holim_i(L_nX∧M_i) for p-local X over F6.3’s cofinal generalized Moore tower M_i. These generic constructions underlie the chromatic applications.

Apply F6.5’s pointwise comma-category Kan-extension formula and composition theorem to a map f:X→Y of spaces and a spectrum-valued local system D: its left Kan extension at y is the colimit on fib_y(f), and taking the colimit over Y gives colim_XD. The slice is the homotopy fiber because X and Y are groupoids; all comparisons retain their naturality.

What BordismFormalGroups must provide (gap:weak-ring-finite-postnikov): F6.5: For every prime p, n≥0 and nonzero p-local weak ring R with maps η:S→R and μ:R⊗R→R satisfying μ∘(η⊗id_R)=id_R, prove the equivalence of F(n+1)⊗R=0 for some finite type-(n+1) spectrum, Σ∞K(C_p,n+1)⊗R=0, and K(j)⊗R=0 for every j>n including j=∞, together with its equivalent preservation of Σ∞_+f⊗R for every map f of π-finite spaces inducing an equivalence on n-th Postnikov sections, constructing the higher finite-space norms and ambidexterity inputs independently of this roadmap’s telescopic Tate results.

The higher norm contract uses weak m-ambidexterity first: for m=−2, q is an equivalence and the norm is the identity on its inverse functor; for m≥−1, q has m-truncated fibers and its diagonal must be (m−1)-ambidextrous. Only then is Nm_q:q_!→q_* formed from the inverse diagonal norm; m-ambidexterity requires Nm_q itself to be invertible. The supplied comparisons identify finite-group norms, preserve base change and composition, and define cardinalities by unit, inverse norm and counit. These constructions and the weak-ring theorem have no dependency on Layer 4. (csy, Definition 3.1.5, pp.33–34; csy line 1632; Theorem 5.4.4 and Remark 5.4.5, pp.83–84; csy line 4036 and line 4060.)

**Checks.**

- For R=Hℚ, n=0 and F(1)=S/p, F(1)⊗R=0, reduced H_*(BC_p;ℚ)=0, and K(j)⊗R=0 for 1≤j≤∞.
- For R=H𝔽_p, every finite positive K(j) vanishes, but K(∞)⊗R≠0 and H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p; omitting the endpoint would give a false equivalence.
- For the trivial C_p-action on H𝔽_p the norm on π₀ is multiplication by p=0, not invertible. Thus B²C_p→* is excluded from weak 2-ambidexterity in Sp. For an equivalence q the norm is the identity; for a two-point discrete fiber it is the ordinary finite biproduct comparison.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Consume E0.4–E0.5’s stable-category and space-indexed colimit comparison and E5’s stable monoidal enhancements. The spectral elliptic module category has the following additional exact contract, beyond ordinary derived modules on a ringed site.

What EnhancedDerivedSheaves must provide (gap:spectral-ringed-sites): For an algebraic stack with an étale sheaf of E∞ rings, construct quasicoherent spectral modules with affine-chart base change, étale descent, tensoring by spectra and the global-sections adjunction.

### From TauCetiRoadmap.StableHomotopyKTheory

Consume §2.4’s connecting map δ:π_(n+1)B→π_n hofib(f), §2.5’s identification of that connecting map with the boundary of GeneralizedCohomology G2.10’s arbitrary-map homotopy-fiber exact sequence, §2.6’s π₁(B)-action on π₀ of the fiber and §2.7’s transport of homotopy fibers along paths in the base, with its compatibility with δ; none of these needs an NDR hypothesis on a strict fiber inclusion. Consume §3.18’s space Postnikov sections and compatible convergent towers, with the twisted obstruction data of §3.21 for componentwise use; §§7.21–7.27’s coherent filtered spectra, exact couples, homological spectral sequences and their finite-filtration, bounded-below and derived-limit convergence criteria. By §7.24 the homological spectral sequence of an exhaustive filtration that vanishes in sufficiently negative filtration converges strongly, with no boundedness hypothesis on the coefficient spectrum; the lim¹ conditions of §7.26 concern complete towers and cohomological indexing.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stages 4–5’s based Hausdorff CW geometry, cofibrations, cellular and twisted ordinary homology, bundles and fibration comparisons, and Stage 8’s relative homotopy groups and exact sequence of based NDR pairs, Hurewicz, Whitehead and ordinary Eilenberg–Mac Lane representability, with their pair and connectivity hypotheses. Use GeneralizedCohomology G2.10 for the arbitrary-map homotopy-fiber sequence and StableHomotopyKTheory §§2.4–2.7 for its boundary and transport comparisons. Generalized Serre coefficients are constructed in Layer 3, with monodromy retained.

### From TauCetiRoadmap.HomotopySpheres

Consume §3A’s convenient pointed suspension–loop adjunction, Freudenthal bounds for spheres, §3B’s word filtration J_rW, its quotients J_rW/J_(r−1)W≃W^∧r and its connected James equivalence, and §4B’s real Bott theorem. The comparison J∞W≃ΩΣW requires connected W. §3B does not state the stable splitting; it is the following contract, whose reduced wedge begins at r=1.

What HomotopySpheres must provide (gap:stable-james-splitting): For every path-connected pointed CW complex W, construct a natural equivalence Σ∞ΩΣW≃⋁_(r≥1)Σ∞W^∧r compatible with the word-length filtration J_rW, whose r-th filtration quotient is W^∧r.

### From TauCetiRoadmap.TopologicalKTheory

Consume T7’s Clifford-module coefficient comparison, with α²=4β, complexification α↦2b² and β↦b⁴; T7 and GeneralizedCohomology G5.4 write α, β and the complex Bott class b as a, b and u, in cohomological degrees −4, −8 and −2, so these are their relations a²=4b, c(a)=2u² and c(b)=u⁴. The real Bott theorem itself is HomotopySpheres §4B, and G5.4 supplies the corresponding coherent spectrum models.

### From TauCetiRoadmap.EllipticCohomology

Consume E1’s stable one-pointed genus-one compactification and Hodge line; E2’s height-one/two marked Morava realizations, obstruction machinery and coherent automorphism actions; E3’s Otop sheaf, elliptic formal-group comparison and global spectra tmf→Tmf→TMF; E4’s actual surviving δ=Δ²⁴∈π₅₇₆Tmf with TMF≃Tmf[δ⁻¹]; E5’s units spectrum gl₁(R) of a commutative ring spectrum R in GeneralizedCohomology G2’s model, with Ω∞gl₁(R) the union of unit components of Ω∞R, its Thom-orientation mapping-space description, and its E₁ Thom refinement of loop-multiplicative spherical-fibration diagrams with the comparison to G5.3; E6’s Γ(N) level stacks, sheaf pullbacks and deck-group descent over ℤ[1/N] for every N≥1. Use their smooth restrictions to define TMF(N), retaining stacks at N=1,2; scheme representability is required only at N≥3. Use the all-height realization contract below. The affine chart objects used in Layer 6 retain their formal-group identification, including nodal height 1, and their integral treatment at 2 and 3.

What EllipticCohomology must provide (gap:elliptic-level-three-galois): E6: Supply the faithful GL₂(𝔽₃)-Galois extension TMF[1/3]→TMF(3), with its deck action.

What EllipticCohomology must provide (gap:elliptic-supersingular-at-two): E2: Supply the GL₂(𝔽₃)-equivariant equivalence L_K(2)TMF(3)≃E₂ at p=2 for the supersingular formal group over 𝔽₄, identifying L_K(2)TMF→E₂ with the localized level-three Galois extension.

What EllipticCohomology must provide (gap:elliptic-supersingular-at-three): E2: Supply L_K(2)TMF≃E₂^hG₂₄ at p=3 for the supersingular formal group over 𝔽₉, with G₂₄ the full semilinear automorphism group over 𝔽₃.

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

Consume §§4.2–4.4's all-prime periodic homotopy, telescope support and cover invariance, and ring-acyclicity equivalence; §§4.5–4.9's finite towers with T(0)=S[1/p], compact kernels, p-local comparison, fracture and bottom comparison; §§4.10–4.12's finite telescopic and Bousfield–Kuhn functors, coherent finite-source comparisons, uniqueness and suspension–loop detection; §§4.13–4.16's connected-cover, fiberwise and nullification comparisons, including the sharp bound m=n+1. Consume §§4.18–4.21's finite-height locality, T(n)/K(n) comparison on L_n-local inputs, height-one equality and BP support; §§4.22–4.25's localized norms, transfer splitting, telescopic Tate vanishing and raw finite-local blueshift; §§4.26–4.29's Morava power operations, Hahn theorem, ring height and Tate converse; and §§4.30–4.33's modular and Thom-family comparisons. Keep their hypotheses, units and coherent actions. In particular the positive-height ring-acyclicity comparison does not identify the two localization functors on arbitrary spectra.

For the Honda theory used in §§4.26–4.27, put k=𝔽_(p^(h+1)), h≥1. Its coefficient reduction is k[[u_h]]; in the specified p-typical orientation, [p](z)=z^(pʰ)g_h(z) modulo (p,u₁,…,u_(h−1)). The Weierstrass quotient is E⁰(BC_p)/(p,u₁,…,u_(h−1),g_h(z))≅k[[u_h]][z]/(g(z)), where g is Eisenstein of degree d=p^(h+1)−pʰ. All polynomial coefficients and the coordinate functionals extracting coefficients lie over k[[u_h]]. The quotient has residue field k and val(z)=1/d with val(u_h)=1; the imported valuation descent gives val(P(u_h))=(p−1)/d=p^(−h). (hahn, coefficient convention §2, p.3, hahn line 116; Propositions 4.2–4.5 and Corollary 4.5.2, pp.8–10, hahn line 347 and line 394.)

**Checks.**

- At p=2,h=1 the reduction is 𝔽₄[[u₁]], the quotient has rank 2, residue field of order 4, and val(z)=val(P(u₁))=1/2. Replacing k by 𝔽₂ would give only two residue elements.
- At p=3,h=1 the rank is 6, the residue field is 𝔽₉, val(z)=1/6 and val(P(u₁))=1/3; h=0 is excluded from the strict valuation decrease.
- The supplied Bousfield–Kuhn functor satisfies Φ_nΩ∞T(n)≃L_T(n)T(n)≠0, with the same finite-source uniqueness. At n=1 the sharp bound is 2: K(ℤ/p,2) has reduced T(1)-homology zero, while BC_p has nonzero reduced K(1)-homology and only 1-connectivity.

The following contracts apply only to ChromaticHomotopyTheory, Part II.

The Part II extension uses GeneralAlgebraicKTheoryPartII §5.5’s chromatic purity theorem: for every E₁ ring A and n≥1, the localization A→L_(T(n−1)∨T(n))A induces L_T(n)K(A)≃L_T(n)K(L_(T(n−1)∨T(n))A), with T(0)=S[1/p]. It also uses §5.2’s high-height cyclotomic trace: for every E₁ ring A and n≥2, the maps K(A)←K(τ_≥0A)→TC(τ_≥0A) are T(n)-equivalences. For a connective T(h+1)-acyclic E₁ ring A, h≥1, these two theorems give the connective comparisons L_T(h+1)K(L_T(h)A)≃L_T(h+1)K(A)≃L_T(h+1)TC(A) of bhls Theorem 6.1 (bhls line 2876), because L_(T(h)∨T(h+1))A=L_T(h)A for such A; purity applies equally to the nonconnective fixed-point ring. The higher-height separation target requires in addition the following contracts from §5.2 (the trace for fixed-point rings) and §6.5 (BP-specific redshift). The BP-specific assertion is stronger than the general E∞-ring height bound; it requires the indicated associative model.

What GeneralAlgebraicKTheoryPartII must provide (gap:bhls-purity-comparison): §5.2: For every prime p, h≥1 and connective E₁ ring A with coherent ℤ-action, prove that the cyclotomic trace K(A^(hℤ))→TC(A^(hℤ)) of the possibly (−1)-connective homotopy fixed-point ring becomes an equivalence after L_T(h+1), naturally in A, using Levy’s theorem that every truncating invariant inverts the map of ℤ-homotopy fixed points induced by a 1-connective ℤ-equivariant map of connective E₁ rings; applied to the restricted actions it covers A^(h pᵏℤ) for every k≥0. (bhls, Theorem 6.2 and Corollary 6.3 with proof, pp.66–67; bhls line 2886 and line 2906).

What GeneralAlgebraicKTheoryPartII must provide (gap:bhls-bp-redshift): §6.5: For every prime p and h≥1, provide a p-complete associative BP⟨h⟩ model of fp-type h (for every finite p-local type-(h+1) spectrum U, U⊗BP⟨h⟩ has finitely many nonzero homotopy groups, each finite) with the E₁⊗A₂ structure and locally unipotent coherent Adams ℤ-action of bhls Theorem 5.4, its height-h Lichtenbaum–Quillen property (THH is bounded below and V⊗THH is bounded in the cyclotomic t-structure for every finite p-local type-(h+2) spectrum V), and T(h+1)⊗TC(BP⟨h⟩)≠0, with no restriction on p or h. (bhls, Definitions 4.1 and 4.2, p.37; Theorem 5.4, pp.53–54, and Theorem 6.25 proof, pp.73–74; bhls line 1596, line 2300 and line 3217; hahn-wilson, Theorem B and its following corollary, p.3, and Corollary 5.0.2 with proof, p.40; hahn-wilson line 93 and line 1422).

## How to read the build

Layers 0–2 pin the supplied finite, oriented and nilpotence conventions. Layer 3 constructs the generalized Serre filtration. Layer 4 treats the raw KU Tate spectrum and higher semiadditivity using the supplied finite-group and generic higher norms. Layer 5 proves the real Bott consequence, and Layer 6 extends level-three spectral Galois descent to every positive level. The separate Part II target combines the chromatic suppliers with purity and BP-model redshift. `README.md` is the roadmap; `Suggested.lean` states only headline theorems expressible on the pinned APIs.

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

Use the Hopkins–Lurie norms and cardinalities of BordismFormalGroups F6.5, with the domain specified in gap:weak-ring-finite-postnikov in Exact supplier contracts. For a presentable stable ∞-category C, a map q:A→B with m-truncated π-finite fibers is weakly m-C-ambidextrous only when its diagonal is (m−1)-C-ambidextrous (with equivalences as the m=−2 base case). Its canonical norm Nm_q:q_!→q_* is defined only on this domain; m-C-ambidexterity additionally requires that norm to be invertible. C is m-semiadditive when every map with m-truncated π-finite fibers is C-ambidextrous, and ∞-semiadditive when this holds for every m. For an ambidextrous space A in a compatibly symmetric monoidal C, |A|∈π₀End(1_C) is the composite of the unit, inverse norm and counit for A→*. (csy, Definitions 3.1.5 and 3.1.10, pp.33–34; csy line 1632 and line 1692; cardinality, p.80; csy line 3898).

Prove that for every n≥1 the category Sp_T(n) of T(n)-local spectra and the category of K(n)-local modules over a Morava E-theory E_n of height n are ∞-semiadditive; the rational category Sp_ℚ is ∞-semiadditive by averaging, and it is the p-local height-zero case. Sp_T(0) on all spectra, with T(0)=S[1/p], is not 1-semiadditive, because primes q≠p are not inverted there. (csy, Theorem 5.3.1, p.79; csy line 3882).

Consequently, for every n≥0 and every map f:A→B of spaces whose homotopy fibers are π-finite and n-connected, Σ∞_+f is a T(n)-equivalence, with Hℚ in place of T(0) at n=0. For every localization L of p-local spectra with L(F(n+1))=0 for a finite type-(n+1) spectrum F(n+1), the map L(Σ∞_+f) is an equivalence. (csy, Theorem 5.3.5 and Corollary 5.3.7, pp.80–81; csy line 3930 and line 3970).

The construction has the following API.

- The supplied base-change, composition and fiberwise ambidexterity comparisons apply to these chromatic categories, retaining naturality along functors preserving the relevant limits and colimits.

- A colimit-preserving symmetric monoidal functor between m-semiadditive categories preserves cardinalities. In Sp_T(n), |B^kC_p| is invertible for every k≥n≥1.

- For n≥1 choose E_n with perfect residue field k and let κ_n=E_n/(p,u₁,…,u_(n−1)) be its 2-periodic residue theory, with π_*κ_n=k[w,w⁻¹] and |w|=2, where w=u⁻¹ in Conventions. If a space X has κ_(n),1(X)=0 and dim_k κ_(n),0(X)=d<∞ (unreduced homology), then L_K(n)(E_n⊗Σ∞_+X) is dualizable of categorical dimension d (csy, Lemma 5.1.7, p.73; csy line 3639). The residue theory uses the regular coefficient-cofiber construction of BordismFormalGroups F3 and the marked realization of EllipticCohomology E2; it does not change the period 2(pⁿ−1) convention for K(n). For X=B^rC_p the dimension is p^(binom(n,r)), for every r≥0.

- A colimit-preserving symmetric monoidal functor from a 1-semiadditive presentably symmetric monoidal stable p-local category C to such a category D, which detects invertibility on π₀ of units and sends the spaces B^kC_p to objects of rational nonzero dimension, makes C and D ∞-semiadditive.

*Proof route.* Apply the supplied inductive norms, base-change and composition laws, and cardinalities. Prove the bootstrap theorem: under the three hypotheses just listed, an induction on k shows that |B^kC_p| has rational nonzero image and that C is (k+1)-semiadditive, using the semiadditive power operation on π₀End(1_C) (csy, §4 and Theorem 4.3.10, pp.68–69; csy line 3445). Apply it to E_n[−]:Sp_T(n)→K(n)-local E_n-modules, X↦L_(K(n))(E_n⊗X). Its hypotheses are: 1-semiadditivity of Sp_T(n), which is GeneralAlgebraicKTheoryPartII §4.24 together with the identification of canonical and finite-group norms; detection of invertibility, from nil-conservativity of L_(K(n)) on Sp_T(n) (support of T(n) equal to {n}, GeneralAlgebraicKTheoryPartII §4.3) and conservativity of E_n⊗(−) on K(n)-local spectra (csy, Proposition 5.1.15 and Corollary 5.1.17, pp.76–77; csy line 3753 and line 3773); and the dimension formula, from the Ravenel–Wilson computation that κ_(n),*(K(ℤ/p,k)) is even and of rank p^(binom(n,k)) over κ_(n),* (csy, Corollary 5.1.9, p.74; csy line 3655, which quotes Ravenel–Wilson Theorem 9.2). The Ravenel–Wilson computation for n≥1 and k≥0, together with the rational computation at n=0 (rank p for k=0 and rank 1 for k≥1), is a target of this subsection. For the T(n)-equivalence, reduce to B=* by the fiberwise Kan-extension formula of GeneralAlgebraicKTheoryPartII §4.14, then induct up the Postnikov tower of the π-finite n-connected space A. Groups of order prime to p contribute nothing p-locally. Each layer B^kC_p with k>n is handled by the cardinality criterion for connected ambidextrous spaces together with invertibility of |B^(k−1)C_p| (csy, Proposition 3.1.18, p.37, and Lemma 5.3.4, p.80; csy line 1909 and line 3923). For a localization L killing F(n+1), L factors through the p-local finite localization L_n^f, which is localization at T(0)⊕⋯⊕T(n) (BordismFormalGroups F6.3).

**Checks.**

- Sp_(p) is not 1-semiadditive: for the trivial C_p-action on H𝔽_p, π_k(H𝔽_p^tC_p) is the Tate cohomology Ĥ^(−k)(C_p;𝔽_p)=𝔽_p in every degree, so the norm for BC_p→* is not invertible: on π₀ of trivial H𝔽_p coefficients it is p=0. The diagonal of B²C_p→* has fiber BC_p; consequently B²C_p→* is not weakly 2-ambidextrous in Sp or Sp_(p), and its higher norm cannot be constructed by this induction there. In Sp_ℚ the C_p-norm on Hℚ is multiplication by p on π₀, which is invertible.

- The dimension of BC_p in K(n)-local E_n-modules is p^n: E_n^0(BC_p)=E_n^0[[z]]/[p](z) is free of rank p^n by Weierstrass preparation, giving p and p² at heights 1 and 2. At n=k=2 the formula p^(binom(n,k)) gives p, whereas the plausible alternative p^(nk) gives p⁴. For k>n it gives 1, matching the vanishing reduced K(n)-homology of K(ℤ/p,k); p^(nk) would contradict it.

- At n=1 the map BC_p→* has π-finite but only 0-connected fiber, and K(1)⊗Σ∞BC_p≠0 because K(1)^*(BC_p) has rank p>1; so the n-connectivity hypothesis cannot be weakened to (n−1)-connectivity. The 1-connected K(C_p,2)→* has rank p^(binom(1,2))=1, so its reduced K(1)-homology is 0, as the theorem predicts.

- For X=S² at p=2,n=2 with k=𝔽₄, κ_(2),0(S²)=k² and κ_(2),1(S²)=0. Thus E₂⊗Σ∞_+S²≃E₂⊕Σ²E₂ has dimension 2. In contrast the convention K(2)_*=𝔽₂[v₂,v₂⁻¹], |v₂|=6 gives K(2)_0(S²)=𝔽₂ and K(2)_1(S²)=0, which would incorrectly predict dimension 1. At p=3,n=1 the period-four theory likewise gives degree-zero dimension 1 while κ_(1),0(S²)=k² and the module dimension is 2.

- For X=* the residue homology has dimension 1 and the module is E_n; for X=∅ both are zero. For S¹, κ_(n),1(S¹)=k≠0, so the evenness hypothesis excludes the false positive dimension 1 (the categorical dimension of E_n⊕ΣE_n is 0).

*Needs:* GeneralAlgebraicKTheoryPartII §§4.3–4.4 (telescope support and ring acyclicity), §4.14 (fiberwise comparison) and §§4.22–4.24 (localized norms and telescopic Tate vanishing); EllipticCohomology E2 with gap:all-height-morava-realization; BordismFormalGroups F1/F3/F5 (p-series, regular residue cofibers and Weierstrass preparation), F6.2–F6.3 (nilpotence, type and finite localization), and F6.5 with gap:weak-ring-finite-postnikov (generic norms, cardinalities, coherent local systems and Kan extensions); StableHomotopyKTheory §3.18 (Postnikov towers); the bootstrap, dimension formula and Ravenel–Wilson computation in this subsection.

### Examples

For trivial C₂ on Hℤ, π_j(Hℤ^tC₂)=ℤ/2 for even j and 0 for odd j. In contrast the sphere Segal comparison has π₀=ℤ₂ and no negative homotopy. The KU₂^∧ example has π₀=ℚ₂, yet its T(1)-localization is zero. (cm-tate, Definition 2.2, p.2, cm-tate line 70; StableHomotopyKTheoryPartII §2.7.)

### Dependencies

GeneralAlgebraicKTheoryPartII §§4.3–4.4, 4.14 and 4.20–4.24; GeneralizedCohomology G5.4; BordismFormalGroups F1/F3/F5/F6 with gap:weak-ring-finite-postnikov; EllipticCohomology E2 with gap:all-height-morava-realization; StableHomotopyKTheory §3.18; StableHomotopyKTheoryPartII §§2.7 and 7.2; RefinedTraceMethods §6.8.

## Layer 5: Real topological K-theory

### 5.1 Real Bott coefficients

For every prime p and n≥1, the supplied multiplicative connective-cover map ko→KO is a T(n)-equivalence. For every associative ko-algebra A, the induced map A→A[β⁻¹] is also a T(n)-equivalence, where β is the image of the degree-eight real Bott class and inversion is derived localization over ko. Retain the supplied coefficient ring ℤ[η,α,β]/(2η,η³,ηα,α²−4β) only as its normalization, with degrees 1,4,8; these coefficient and real Bott constructions keep their owners. (abs, Theorems 6.9 and 11.5, pp.15–16,28–29; locator-only, uncertified; lmmt, Corollary 4.19 proof, p.21; lmmt line 878).

*Proof route.* The fiber of ko→KO is bounded above; positive-height periodic homotopy is insensitive to that fiber. Then use A[β⁻¹]≃A⊗_koKO and smash the relative tensor comparison with T(n). Real Bott and the Clifford coefficient ring are inputs, rather than additional constructions.

**Checks.**

- At degree four the relation is α²=4β, not α²=β.

- The connective-cover assertion uses n≥1; rationalization detects the negative KO groups.

- α²=4β gives complexification (2b²)²=4b⁴ on both sides; α²=β would give 4b⁴=b⁴ over ℤ, which is false. Rational π_−8ko=0 and π_−8KO=ℚ after rationalization, so height 0 inversion is not an equivalence.

*Needs:* GeneralizedCohomology G5.4 (ko→KO and E∞ Bott inversion); HomotopySpheres §4B (real Bott theorem); TopologicalKTheory T7 (Clifford-module coefficients); GeneralAlgebraicKTheoryPartII §4.3 (positive-height connective-cover invariance); GeneralizedCohomology G2 (relative tensor base change).

### Examples

For real topological K-theory, π₀ko=π₀KO=ℤ, π₁ko=π₂ko=ℤ/2 and π₃ko=0; π₈KO=ℤ generated by β. Under complexification β maps to b⁴, which has degree 8. (abs, Proposition 6.8, Theorems 6.9 and 11.5, pp.15–16,28–29; locator-only, uncertified; lmmt, Corollary 4.19 and proof, p.21; lmmt line 876).

**Checks.**

- π₀ko=π₀KO=ℤ, with rank giving the coefficient identification.

- π₁ko=π₂ko=ℤ/2 and π₃ko=0; replacing ko by complex ku fails this test.

- β has degree eight, while the imported complex Bott class has degree two.

### Dependencies

GeneralizedCohomology G5.4 (ko→KO and E∞ Bott inversion); HomotopySpheres §4B (real Bott theorem); TopologicalKTheory T7 (Clifford-module coefficients); GeneralAlgebraicKTheoryPartII §4.3 (positive-height connective-cover invariance); GeneralizedCohomology G2 (relative tensor base change).

## Layer 6: Full-level spectral Galois extensions

### 6.1 Full-level Galois extensions

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

- N=1 gives the identity TMF→TMF and the trivial group of order 1. N=2 gives GL₂(𝔽₂)≃S₃, of order (4−1)(4−2)=6; the automorphism −1 of a generic elliptic curve fixes its 2-torsion basis, so this level object remains a stack. N=3 gives order (9−1)(9−3)=48, and N=5 gives (25−1)(25−5)=480. At N=2 the base is ℤ[1/2]; at N=3 it is ℤ[1/3], whose 2-localization is the input of EllipticCohomology gap:elliptic-supersingular-at-two. (mm, Example 7.5, p.37; mm line 1776).

- At N=3 let g and h be the upper and lower unipotent matrices with off-diagonal entry 1. Then ((P,Q)g)h=(2P+Q,P+Q), whereas ((P,Q)h)g=(P+Q,P+2Q); pullback reverses map composition and gives the left action on sections used in b₁g(b₂). The matrix diag(−1,1) changes the Weil pairing ζ to ζ⁻¹, so fixing ζ would discard determinant components.

- For G=C₂ and B=A×A, B⊗_A B=A⁴=∏_G B and B^hG=A. For B=0,A=Hℤ, the map M↦B⊗_AM kills Hℤ≠0, so it is not conservative. |GL₂(𝔽₃)|=(9−1)(9−3)=48.

- For the trivial S₃-torsor, B=∏_(S₃)A has 6 factors, B⊗_A B has 36 factors and ∏_(S₃)B has 36 factors. Homotopy fixed points recover A and projection to one factor makes base change conservative.

*Needs:* EllipticCohomology E1/E3/E6 (smooth level stacks, Γ(N) sheaves, sections and deck-group descent for all N≥1); ModularCurves §3D (naive level comparison with N inverted), §4C (level-three torsor) and §5B (ordered-basis schemes and their right action for N≥3); EllipticCohomology gap:elliptic-spectral-affineness and EnhancedDerivedSheaves gap:spectral-ringed-sites.

### Examples

At N=1 the Galois group is trivial and the extension is the identity. At N=2 its order is 6 and the level object remains a stack; at N=3 its order is 48. In the p=2 supersingular specialization the order 48 includes the residue-field involution, while at p=3 the supplied extended group has order 24=12·2. (mm, Example 7.5 and Theorem 7.6, pp.37–38, mm line 1776 and line 1801; behrens, Proposition 1.6.12, pp.30–31, behrens line 1160.)

### Dependencies

EllipticCohomology E1/E3/E6 and gap:elliptic-spectral-affineness; EnhancedDerivedSheaves E5 with gap:spectral-ringed-sites; ModularCurves §§3D, 4C and 5B.

## Downstream consumers

ChromaticHomotopyTheory, Part II uses the chromatic suppliers and the purity and BP-model contracts for its higher-height separation target. The generalized Serre filtration supports periodic-space comparisons, and the full-level spectral Galois theorem supplies modular descent at arbitrary level without excluding the small-level stack cases.

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
- **hesselholt-ku** — Jonas McCandless, [Topological Hochschild homology of E∞-rings](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/hesselholt-scholze.pdf), in Arbeitsgemeinschaft: Topological Cyclic Homology, Oberwolfach Report 15/2018, pp.838–845, especially p.844; hesselholt-ku line 1658. The KU calculation is for uncompleted KU; §4.1 proves the completed comparison through the oriented Tate tower.

- **miller** — Haynes R. Miller, [On relations between Adams spectral sequences, with an application to the stable homotopy of a Moore space](https://math.mit.edu/~hrm/papers/miller-relations-between-adams-spectral-sequences.pdf), 1981. Theorem 4.11 and Corollary 4.12, pp.294–295, for the odd-prime height-one calculation.
- **mahowald** — Mark Mahowald, [bo-resolutions](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mahowald-bo.pdf), 1981. Theorem 6.3, p.382, read with the correction below.
- **mahowald-addendum** — Mark Mahowald, [An addendum to: bo-resolutions](https://msp.org/pjm/1984/111-1/pjm-v111-n1-p10-s.pdf), 1984. §1, pp.117–118 (corrected Theorem 1.1(c)); §2, pp.118–119 (corrected proof of Theorem 6.3); §3, pp.119–123 (vanishing line).

- **hahn-wilson** — Jeremy Hahn and Dylan Wilson, [Redshift and multiplication for truncated Brown–Peterson spectra](https://arxiv.org/abs/2012.00864v5), 2022. Theorem B and its following corollary, p.3; Corollary 5.0.2 with proof, p.40. Numbering is that of arXiv v5; the trace factors through the nonzero height-(h+1) detector used by the BHLS supplier contract.
