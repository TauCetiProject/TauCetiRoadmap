# Roadmap: finite flat group schemes and integral p-adic Hodge theory, part II

**Summary.** This continuation builds integral tensor structures on Dieudonné displays, proves the very-good criteria that make tensor deformation theory work, and constructs adapted ordinary lifts carrying the rational σ-centralizer action. It starts from the p-divisible groups, field Dieudonné theory, height-one Breuil–Kisin classification and integral crystalline comparisons of FiniteFlatGroupsAndIntegralPadicHodgeTheory. Its principal deformation theorem identifies adapted DVR-valued deformations with the local-model quotient of a versal ambient family under the precise infinitesimal compatibility hypothesis. Its ordinary endpoint constructs the lift directly from a central Newton-Levi filtration, without requiring very-goodness, and lifts every rational σ-centralizer element as a self-quasi-isogeny.

## Scope and ownership

This roadmap owns the Zink coefficient construction, invariant frame-pair and tilde algebra, contravariant complete-local display comparison, first-order transport, tensor horizontality, very-good embeddings and their display consequences, adapted deformation and recognition theorems, hyperspecial tensor interfaces, lattice specialization, and the central ordinary lift. FiniteFlatGroupsAndIntegralPadicHodgeTheory stops at its §§R07.4.21 and R07.4.25 height-one classification and integral comparisons; it does not supply the tensor-display deformation theorem developed here. The perfect-ring comparison here extends its §R07.2.10 perfect-field classification to finite projective modules over arbitrary perfect rings. PELModuli §M2.15 owns displays over W(R) and Zink’s BT equivalence with formal p-divisible groups in its stated range. This roadmap owns the Ŵ(R)-frame Dieudonné displays of §0.11 and the anti-equivalence of §0.13 for all p-divisible groups; it uses no comparison along Ŵ(R)→W(R).

The following ownership boundaries determine the direction of supply.

- Finite flat groups, p-divisible groups, Tate modules, perfect-field classification, smooth-base de Jong theory, Breuil–Kisin coefficient rings and their height-one and all-weight functors are stated by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1–R07.1.22, R07.2.10–R07.2.12, R07.2.27 and R07.4.1–R07.4.25. They have no second construction here.
- The crystalline Dieudonné crystal and Grothendieck–Messing equivalence are stated by AbelianSchemesAndArithmeticModuli §A4.CR.7.2. CrystallineCohomology §CR.7.1 supplies the general coefficient calculus.
- General Grassmannians belong to ModularCurves §0G; torsor descent, Hartogs, formal schemes, deformation functors and smooth lifting belong to SchemeAndStackFoundations §§0.6, 1.15, 2.3 and 4.1–4.12. Their tensor-display applications are the targets here.
- ReductiveGroupsPartII §§RG2.1.5, RG2.3.3, RG2.3.5 and RG2.4.3 owns Kottwitz maps, parahorics, full fixers, classical lattice-chain stabilizers, tame hyperspecial lattices and affine Weyl combinatorics. In particular the ordinary-Levi fixer intersection is assigned to that owner through the exact contract below. Layer 3 owns the type-A and Dᴴ scalar enlargements and paired trace/different lattice constructions needed to prove its very-good existence theorems.
- GeometricSatakeAndFusion Layer GS0, §0.31 “Witt affine flags and components” and §0.37 “Bounded admissible affine flag loci”, owns the integral Grassmannian, component labels and v-sheaf local models. Its scheme-representative, normality, good-embedding and tangent extensions used here have the exact supplier contract below. They are geometric inputs, rather than consequences of a smooth integral fixer.
- VectorBundlesAndIsocrystals Layer 6, “Integral group torsors and Frobenius”, states the integral scheme tensor–torsor dictionary. PadicHodgeTheory §5.5 states G-isocrystals, B(G), Newton and Kottwitz invariants, general perfect-residue admissibility and the period-torsor class theorem. The rational tensor-isomorphism torsor for two admissible, conjugate filtrations over a finite extension of ℚ̆_p is a consequence of that theorem and is consumed here; §5.17 reaches residue fields algebraic over 𝔽_p by unramified base change, and the remaining perfect residue fields through the exact supplier contract below (gap:perfect-residue-period-torsor-comparison). These constructions are not repeated.
- The Fontaine PD envelope and absolute period-ring structures belong to DerivedDeRhamCohomology §PD.7 and PadicPeriodRings §§3 and 4.1. This roadmap constructs the relative-cover Frobenius and filtration in §5.2 and the relative p-divisible comparison in §5.5. Only the relative ring constants theorem is a supplier extension.
- ShimuraVarieties §7.0i owns absolute Hodge tensors and their rational family realizations. The rational absolute-Hodge crystalline comparison is the extension in its exact contract below; the local integral p-divisible comparison is owned here. Integral moduli spaces and global tensor extension on them are downstream applications. Lubin–Tate formal modules, local reciprocity through them and quasi-canonical lifts are not constructed here.
- PrismaticCohomologyPartIII §6.0 owns the perfect-base classification of finite locally free commutative group schemes of p-power order by W(O_S)-modules, in its covariant normalization. §0.2 here classifies p-divisible groups over perfect rings in the contravariant normalization; the two agree through H↦H[pⁿ] and Cartier duality, as stated in §0.2.
- AbelianSchemesAndArithmeticModuli §A4.10 owns Serre–Tate coordinates and the canonical lift of an ordinary abelian variety. Layer 6 constructs tensor-adapted ordinary lifts of p-divisible groups; for the empty tensor family and ordinary H₀ its lift is the split extension of the étale part by the multiplicative part.

The ambient Witt operations, divided powers, fraction-field isocrystals, the module-valued Grassmannian functor, module tensor and dual constructions are already in the library, and Tau Ceti has finite locally free commutative group schemes (`TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`). Mathlib's isocrystal class does not impose finite dimensionality by itself. The pinned libraries have no p-divisible groups, no p-divisible-group/display comparison, integral parahoric local-model carrier, very-good embedding or tensor-adapted deformation carrier on which this roadmap's headline theorems can be stated. `Suggested.lean` therefore records those missing signatures in its module documentation, without scalar or matrix substitutes. The README specifies the complete mathematical library.

## Conventions

Let p be a prime. Assume p>2 throughout, except in §§0.2 and 0.5: the perfect-ring Dieudonné anti-equivalence and its height-one shtuka reformulation hold for every prime p, including p=2, because they use the perfect-ring category directly and not the odd-prime complete-local Zink-ring constructions of §§0.1 and 0.13. Layers 0–1 allow any perfect field k of characteristic p. Layers 2–4 and 6 take k=F̄_p. Layer 5 states separately when k is merely perfect, separably closed or finite. These residue hypotheses are part of the individual theorem, including its torsor-triviality conclusion. Complete local rings are nonzero Noetherian rings with the indicated residue field, separated and complete for their maximal-ideal topology. Complete-local maps are continuous local maps over the stated coefficient ring. Perfect rings in the perfect-ring comparison may be disconnected and need not be fields; finite projective ranks are locally constant. No global basis is imposed there.

Put W=W(k), K₀=Frac(W)=W[1/p], and let K/K₀ be finite totally ramified unless a finite residue extension is displayed. Write 𝔖=W[[u]], with φ restricting to Witt σ on W and φ(u)=uᵖ. For a uniformizer π of K, E(u) is its monic Eisenstein polynomial; E(0)/p is a unit. The letter E without an argument denotes a reflex field, π_E its uniformizer, and Ĕ its completed maximal unramified extension with residue k. S denotes the p-completed Eisenstein PD evaluation ring. Ŵ(R) denotes the Zink coefficient ring. These are three different rings; every comparison specifies its scalar map. Numerical free ranks use nonzero coefficient rings and 0≤d≤h; the zero frame has only the zero finite module and its unique tilde comparison, without a numerical rank assertion. A p-frame has φ|I=pφ₁, and “strict” means that φ₁ is preserved without a unit multiplier.

Use contravariant D(H). The Hodge submodule Fil¹ has rank dim(H), whereas its quotient has rank ht(H)−dim(H). Normalize D(ℚ_p/ℤ_p) by F=σ and D(`μ_{p∞}`) by F=pσ. Put L=Hom_ℤp(T_pH,ℤ_p)=T_p(H*)⊗ℤ_p(−1), where H* denotes Cartier dual. Thus D(H*)=D(H)∨(−1). A Tate twist r multiplies crystalline Frobenius by p^(−r) and sends Filⁱ to Filⁱ⁺ʳ. For the ordinary height-two group, the multiplicative line has jump 1 and multiplier p, the étale line has jump 0 and multiplier 1, and dualizing and twisting exchanges them. These two lines fix every sign used below (Kisin17, §1.1.5–1.1.9, pp.7–9; Kisin17 lines 325 and 349).

A Hodge cocharacter μ_y has weights (0,1) in the filtration convention; its local-model label is μ_y⁻¹. In hyperspecial notation μ₀ is the inverse Hodge cocharacter and υ₀=σ(μ₀⁻¹). For GL₂ with F=diag(p,1)σ, Fil¹ is ke₁, μ₀(z)=diag(z⁻¹,1), and p^υ₀=diag(p,1). Translate Hoff's weight-(0,−1) convention through this inverse before comparing filtrations (KPZ26, §§3.1.2 and 5.2, pp.15–16 and 52–54; KPZ26 lines 700 and 2291; Hoff23, Definitions 2.1–2.3, pp.16–17).

Write G for the connected reductive generic group, 𝒢=G̃ for the smooth full integral fixer cut out by the tensors, and 𝒢° for its connected parahoric. Calling 𝒢° a parahoric presupposes that it is a parahoric group scheme of G, as it is when 𝒢 is the Bruhat–Tits stabilizer of a point of B(G,ℚ_p); the identity 𝒢°(Z̆_p)=𝒢(Z̆_p)∩ker κ_G is used only for such stabilizers. Equality of these models is an additional assumption in the parahoric-display and ordinary constructions. The smooth schematic closure of a generic identity component is a separate object in the neutral-closure theorem. A tensor family cuts out its fixer on every coefficient algebra, including nonreduced algebras. Mixed tensors have both covariant and dual factors; an isomorphism acts on a dual factor by its inverse dual. Thus evaluation transports to evaluation: on a two-dimensional module c·id·c⁻¹=id (KPZ26, §5.2, pp.52–54; KPZ26 line 2291).

Always construct the first-order c over R/(m²+pR). On reflex coefficients reduce its source and target further to the same R_G/(m_G²+π_E R_G). In a ramified reflex DVR with p a unit times π_E², the former quotient is O_E/(π_E²) and the latter is k; π_E survives in the first and is zero in the second. Constancy means Ψ̄c=Ψ₀ in that common quotient, relative to the marked module frame (KPZ26, §§5.1.14–5.2.2, pp.51–54; KPZ26 lines 2221 and 2330).

For Kottwitz use positive valuation: κ_Gm(p)=1. Write I for inertia and Γ for the absolute ℚ_p-Galois group; geometric Grassmannian labels lie in π₁(G)_I, and the rational hyperspecial image lies in its σ-invariants. These invariants are distinct from the coinvariant target of the rational period-torsor class. The action in lattice specialization is on L, not on T_pH, so g=p produces pL and its dual Tate lattice p⁻¹T_pH; its crystal coset has valuation 1. A rational centralizer element need not be an integral unit. For the contravariant Dieudonné realization use the right quasi-isogeny action: D(q_g)=g and `q_{gh}=q_h∘q_g`; inversion converts it to a left action. On two étale lines, D(q_g)=g gives T_p(q_g)=gᵗ. For g=[[1,1],[0,1]] and h=[[1,0],[1,1]], T_p(q_h∘q_g)=(gh)ᵗ=[[2,1],[1,1]], whereas (hg)ᵗ=[[1,1],[1,2]]. This fixes the composition order. Fixed finite-rank objects and their mixed tensor constructions live in one universe; representation categories are replaced by a small skeleton before forming their tensor functors. All group schemes and torsors retain their scheme structure and all H¹ of group schemes denotes fppf torsor classes (Kisin17, §§1.2.16–1.2.19, pp.15–16; Kisin17 line 688; KZ25, Theorem 3.4.5, pp.27–28; KZ25 line 1189).

## Exact supplier contracts

### From Mathlib

Use `WittVector` in `Mathlib/RingTheory/WittVector/Defs.lean`, `WittVector.frobenius` and `WittVector.frobeniusEquiv` in `Mathlib/RingTheory/WittVector/Frobenius.lean`, and `WittVector.verschiebung` in `Mathlib/RingTheory/WittVector/Verschiebung.lean`. The ring operations require a prime parameter and a commutative coefficient ring; the Frobenius equivalence requires characteristic p and perfectness. Verschiebung is additive. Its coordinate-shift and injectivity results do not equip a mixed-characteristic complete-local ring with a Zink subring. For perfect-field rational coefficients use `WittVector.Isocrystal` in `Mathlib/RingTheory/WittVector/Isocrystal.lean`, together with explicit finiteness when needed. Use `DividedPowers` in `Mathlib/RingTheory/DividedPowers/Basic.lean` on an explicit ideal. Its scalar axiom is γ_n(ax)=aⁿγ_n(x), with the ideal-membership hypotheses retained. For filtration points use `Module.Grassmannian` and `Module.Grassmannian.functor` in `Mathlib/RingTheory/Grassmannian.lean`: a point of `G(k, M; R)` is a submodule whose quotient is finite projective of constant rank k, so a rank-d direct summand of Λ⊗A, with Λ free of rank h, is a point of `Module.Grassmannian.functor ℤ_p Λ (h−d)` at A. Representability of this functor is not at the pin; ModularCurves §0G constructs the representing scheme. All polynomial, ideal, finite-projective, tensor, dual and matrix operations have their native meanings. For a Noetherian ring B, an element T with (T)⊂Jac(B) and an ideal I, apply `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` in `Mathlib/RingTheory/Filtration.lean` to the finite B-module B/I and the ideal (T): the intersection of the submodules Tⁿ(B/I) is zero, so ∩ₙ(I+TⁿB)=I. Apply `IsLocalization.algebraMap_mem_map_algebraMap_iff` in `Mathlib/RingTheory/Localization/Ideal.lean` with the powers of p: x∈B lies in I·B[1/p] exactly when pⁿx∈I for some n, so I is the contraction of I·B[1/p] when B/I is p-torsion-free. These are the T-adic separatedness and ideal-contraction steps of §4.11; for I=(p) in B=ℤ₃[[T]] the quotient has 3-torsion and the contraction is all of B.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume §§R07.1.6–R07.1.8 and R07.1.22 for the p-divisible carrier, dual Tate pairing, Tate module and generic-fibre full faithfulness; §§R07.2.10–R07.2.12 for contravariant perfect-field Dieudonné theory and its rank-one normalizations; §R07.2.27 for the smooth-base equivalence and `deJongBoundedFormalFunctions`. For a Noetherian normal complete local domain R flat over a complete mixed-characteristic DVR O with perfect residue k and residue field finite over k, apply the latter theorem to Spf R with its maximal-ideal topology. This formal scheme is O-flat and formally normal, and its reduction is of finite type over k. An element s∈R[1/p] is analytic on its generic fibre; its values have norm at most one exactly when ξ(s)∈O_K for every continuous local O-map ξ:R→O_K with K/Frac(O) finite. The bounded-function isomorphism, including injectivity, identifies these elements with R (deJong95, Proposition 7.3.6, pp.89–90 and Theorem 7.4.1, pp.90–91; deJong95 lines 2952 and 2988). Consume §§R07.3.2–R07.3.3 and R07.4.13 for weak admissibility and its realization, with the variance adapter of PadicHodgeTheory §5.5. Consume §R07.4.1 for 𝔖, S and their scalar maps; §§R07.4.16–R07.4.21 for the all-weight tensor functor, height-one category and group equivalence; and §R07.4.25 for the integral φ*𝔐/u, φ*𝔐/E and PD comparisons. The all-weight functor's whole-ring nonexactness is retained. Punctured exactness is the additional application of Layer 4 here.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:perfect-residue-bt-realization): Extend §R07.4.20 from finite extensions of ℚ_p to finite extensions of W(k)[1/p] for arbitrary perfect k, including F̄_p, preserving the contravariant dual-Tate convention and realization up to isogeny.

### From TauCetiRoadmap.PrismaticCohomologyPartIII

Section 6.0, “Perfect-base Dieudonné comparison”, supplies the classification of finite locally free commutative group schemes G of p-power order over a perfect 𝔽_p-scheme by W(O_S)-modules with F and V, in the covariant normalization M(ℤ/pʳ)=W_r with F=p·Frob and M(μ_(pʳ))=W_r with F=Frob, and with M_cov(G)=M_contra(G^D) over perfect fields. It is consumed only by the compatibility statement of §0.2.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Section A4.CR.7.2 supplies the contravariant crystalline Dieudonné crystal, evaluation, Frobenius, Verschiebung, duality with Tate twist −1, the Hodge sequence, and the equivalence between marked group lifts and lifts of the Hodge direct summand across locally PD-nilpotent thickenings. Apply it at all finite complete-local levels before passing to the inverse limit. In these conventions Fil¹ is Lie(H)∨ and has rank dim(H); it is not the Hodge quotient. The witness H=`μ_{p∞}` has Fil¹=D and F=pσ, while H=ℚ_p/ℤ_p has Fil¹=0 and F=σ.

### From TauCetiRoadmap.CrystallineCohomology

Section CR.7.1 supplies finite locally free coefficient evaluation, tensor and dual compatibility, completed crystal systems and their connection; Layer CR.1 supplies the common crystalline sites. Rationalization retains the integral system, and a connection on an arbitrary nonproper formal base is not silently algebraized.

### From TauCetiRoadmap.DerivedDeRhamCohomology and TauCetiRoadmap.PadicPeriodRings

DerivedDeRhamCohomology §PD.7 supplies the completed Fontaine envelope and its comparison `Crystalline.fontaineEnvelope_periodPDEnvelope`; PadicPeriodRings §§3 and 4.1 supplies the O_C envelope, Frobenius and filtered crystalline period rings. The relative Frobenius and PD filtration are constructed in §5.2. Layer 5 supplies the normal geometric-cover input on which they are evaluated. The absolute perfectoid specialization and the relative cover ring remain distinguished.

What PadicPeriodRings must provide (gap:relative-crystalline-constants): For a normal Noetherian integral p-complete p-torsion-free W(k)-algebra R with R/p≠0 and the normal geometric cover of Kisin17 §1.1.15, the relative envelope of DerivedDeRhamCohomology §PD.7, with its induced Witt Frobenius and PD filtration extended by defining Filʳ(A_cris(R)[1/t]) as the union of t⁻ⁿFilʳ⁺ⁿA_cris(R) over n≥0, satisfies the identity that the φ-fixed part of Fil⁰ A_cris(R)[1/t] equals ℚ_p.

This is the relative extension of PadicPeriodRings §4.3’s fundamental identity, a statement about rings independent of p-divisible groups (Kisin17, proof of Lemma 1.1.17, p.11; Kisin17 lines 474–476).

### From TauCetiRoadmap.SchemeAndStackFoundations and TauCetiRoadmap.ModularCurves

SchemeAndStackFoundations §0.6 supplies reflexive extension and Hartogs; §§1.15 and 2.3 supplies geometric and fppf torsors and their common class carrier; §§4.1–4.4 supplies smooth lifting, marked deformation functors and prorepresentability; §§4.7–4.8 supplies formal completion; §4.12 supplies flattening with its stated hypotheses. ModularCurves §0G supplies the relative Grassmannian scheme of locally free quotients of a finite locally free module, with its affine charts and universal quotient; the kernel of the universal quotient is the universal direct summand. These inputs do not identify an unproved tensor-isomorphism functor with a torsor.

What SchemeAndStackFoundations must provide (gap:tensor-isomorphism-flatness-descent): Let A be a henselian local ring, X→Spec A locally of finite presentation, x a point of its closed fibre, and ℱ an O_X-module of finite type; the functor on pointed local A-schemes requiring ℱ after base change to be flat at every closed-fibre point above x is represented by a closed subscheme of Spec A, finitely presented when ℱ is finitely presented, so local maps A→A_i with intersection of kernels zero and flat pullbacks at these points imply ℱ is A-flat at x (RG71, I, Theorem 4.1.2, p.27).

What SchemeAndStackFoundations must provide (gap:formal-dvr-point-detection): For a reduced p-torsion-free complete Noetherian local O_Ĕ-algebra R with residue k, the continuous local maps R→O_K for finite K/Ĕ are jointly injective.

What SchemeAndStackFoundations must provide (gap:punctured-disc-torsor-patching): Let A=O[[u]] for a complete mixed-characteristic DVR O and let f∈A be a non-zero-divisor with (p,f) primary to the closed point; for a smooth affine A-group scheme, a torsor on D(f) and a torsor on the f-adic completion of A[1/p], with an isomorphism over its punctured f-adic completion, glue uniquely up to unique compatible isomorphism to a torsor on Spec A minus the closed point, by formal gluing on D(p) followed by Zariski descent (KP18, proof of Lemma 3.2.6, p.171; KP18 lines 2114–2122).

Flatness uses the local henselian flattening functor, rather than arbitrary separating maps of rings (RG71, I, Theorem 4.1.2, p.27; KP18 lines 2185–2188). Point detection is used in Hoff23 lines 1371–1372; ideal contraction and T-adic separatedness, the remaining inputs of the factorization argument (KP18, proof of Proposition 3.2.17, pp.175–177), are the Mathlib statements of the Mathlib contract. The local-model lifting step of Hoff23 Lemma 2.35 is proved in §4.13, using local-model geometry.

### From TauCetiRoadmap.ReductiveGroupsPartII

Section RG2.1.5 supplies κ_G and π₁; §§RG2.3.3 and RG2.3.5 supplies parahorics, the Kottwitz-kernel fixer characterization, lattice-chain stabilizer schemes and tame hyperspecial realization; §RG2.2.4 (*division-algebra-building*) supplies O_D-chain stabilizers. Section RG2.3.7 supplies connected finite-field Lang vanishing. Section RG2.4.3 supplies translations, affine Weyl length, dominant order and admissible sets. Its translation labelled λ has Kottwitz class −λ and split representative λ(p)⁻¹. Layer 6 uses the same elements with labels t_here^λ=t_RG^(−λ) and Adm_here(μ)=Adm_RG(dom(−μ)); its convention adapter transports Frobenius, Bruhat order and length without altering the positive valuation normalization. The trace/different pairing and scalar enlargements used with these lattices are constructed in §§3.15–3.17.

What ReductiveGroupsPartII must provide (gap:full-fixer-cutting-tensors): For the specified smooth affine full fixer models, provide finite scheme-theoretically cutting mixed tensor families and their base-change identification, for every faithful finite-free realization of these fixers; the ordinary-Levi intersection is the separate contract below.

What ReductiveGroupsPartII must provide (gap:parahoric-disc-purity): For a complete discretely valued field E with perfect residue field k of characteristic p and a parahoric group scheme 𝒫/O_E, every 𝒫-torsor on U=Spec O_E[[z]] minus its closed point extends to Spec O_E[[z]] (Anschuetz22, Proposition 10.3, p.33; Anschuetz22 line 1388).

What ReductiveGroupsPartII must provide (gap:full-fixer-component-reduction): For a complete DVR O with residue field k and a smooth affine O-group 𝒢 with connected reductive generic fibre and quotient sheaf 𝒢/𝒢°≅i_*Γ, where i:Spec k→Spec O and Γ/k is finite étale, a 𝒢-torsor on U=Spec O[[u]] minus its closed point whose induced Γ-torsor on Spec k((u)) is trivial reduces to a 𝒢°-torsor (KP18, (3.2.7)–(3.2.8), p.172; KP18 lines 2127–2135).

What ReductiveGroupsPartII must provide (gap:ordinary-levi-full-fixer): Under the ordinary σ-straight normalization and the assumption that the ambient full fixer equals its connected parahoric, prove that the Newton-Levi model satisfies 𝒨(W)=M(K₀)∩𝒢(W) and that its full fixer equals its connected parahoric.

The purity ring is the one in Anschuetz22, §10 and Proposition 10.3, author p.33; Anschuetz22 lines 1345–1391. A general perfect residue field gives extension, and algebraically closed residue plus smooth lifting gives triviality. The component reduction is the explicit special-fibre component-torsor step of KP18, (3.2.7)–(3.2.8), p.172; KP18 lines 2127–2138. The ordinary-Levi assertion has precisely the hypotheses of KZ25 §3.4.2, pp.26–27; KZ25 lines 1152–1165.

### From TauCetiRoadmap.GeometricSatakeAndFusion

Consume Layer GS0 §0.31, “Witt affine flags and components”, for geometric component labels π₁(G)_I and residual Frobenius; §0.37, “Bounded admissible affine flag loci”, supplies the integral v-sheaf local model, admissible special fibre and functoriality. Connected parahoric and full-fixer components are different quotients. For G_m, the component of p is 1, and the standard lattice has component 0.

What GeometricSatakeAndFusion must provide (gap:scheme-local-model-representative): For a local-model triple over a p-adic field F satisfying p>2, local abelian type, and essentially tame classical adjoint factors without triality, the normalized flat projective scheme Mloc of KPZ26 (3.2.13), with reduced special fibre and generic flag variety, represents the intrinsic integral v-sheaf local model; retain its functorial adjoint and restriction-of-scalars comparisons (KPZ26, Theorem 3.2.15 and §3.4.2, pp.20 and 28; KPZ26 line 895).

What GeometricSatakeAndFusion must provide (gap:scheme-local-model-hodge-immersion): For a quasi-tame local-model triple with G=∏ᵢ Res_(K_i/F) H_i, each H_i tamely split and classical, p odd, and a Hodge embedding ρ factoring as KPZ26 (3.3.24), some repeated sum ρ^⊕m with m≥1 admits a lattice Λ, a quasi-parahoric 𝒢′ with (𝒢′)°=𝒢°, and a closed local-model immersion into Gr(d,Λ) over the reflex integers, with the specified full-fixer cases of Remark 3.3.26 and the standard division-algebra representations in its proof (KPZ26, Theorem 3.3.25, p.26; KPZ26 lines 1125–1140 and 3100–3106).

What GeometricSatakeAndFusion must provide (gap:schubert-curve-spanned-tangents): For a mod-p abelian-type pair (G,μ) over k with p∤|π₁(Gder)| and no Dᴴ factors, every tangent space of the affine Schubert variety S_μ is spanned by tangent images of smooth formal k[[t]]-curves through that point (KPZ26, Theorem 4.1.6, p.31; KPZ26 lines 1363–1365).

What GeometricSatakeAndFusion must provide (gap:local-model-curve-spanned-tangents): Under the standard assumptions p>2, local abelian type and essentially tame classical adjoint factors, if 𝒢≅Res_(O_K/O_F) ℋ for ℋ/O_K reductive, the tangent spaces of the special-fibre local model are spanned by smooth formal curves at every point of the minimal stratum, and at every point when there are no Dᴴ factors (KPZ26, Theorem 4.4.3, p.47; KPZ26 lines 2049–2055).

The general geometry is consumed with the hypotheses of those four theorems; normality is not deduced from the immersion. The nonexceptional very-good theorem below also keeps its R-smooth centralizer and prime-to-p fundamental-group assumptions (KPZ26, §§3.1–3.4 and 4.1–4.4, pp.15–47; KPZ26 lines 717, 895, 1125, 1363 and 2049).

### From TauCetiRoadmap.VectorBundlesAndIsocrystals and TauCetiRoadmap.PadicHodgeTheory

VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”, supplies finite tensor isocrystals; its Layer 6, “Integral group torsors and Frobenius”, supplies the equivalence between torsors for a smooth affine connected ℤ_p-group on a scheme and exact tensor functors on its finite-free representations. Apply that dictionary on the Dedekind punctured spectrum of 𝔖 to the connected parahoric reduction. Extend its structure group to the full fixer only after the separate component step. This integral contract supplies the coordinate-algebra recognition needed by Layer 4.

PadicHodgeTheory §5.5 supplies tensor G-isocrystals, B(G), ν_b, κ(b), admissibility over complete mixed-characteristic DVR fields with perfect residue, and, for K finite over ℚ̆_p, the period-torsor class determined by b and the cocharacter coinvariant. Therefore, for K/ℚ̆_p finite, two admissible filtrations on the fixed isocrystal with conjugate cocharacters have isomorphic underlying rational tensor fibre functors. For K finite totally ramified over K₀=W(k)[1/p] with k perfect and algebraic over 𝔽_p, the same conclusion follows by unramified base change, proved in §5.17: then W(k̄)=W(𝔽̄_p), so `K̆=K⊗_{K₀}W(k̄)[1/p]` is a field finite over ℚ̆_p, b∈G(K₀) lies in G(ℚ̆_p), the base-changed filtrations are admissible with the same cocharacters, and each crystalline realization keeps its underlying ℚ_p-space on restriction to Γ_K̆, because it is computed in the same B_cris and B_dR. For perfect k not algebraic over 𝔽_p this reduction does not reach the supplier's range: for k an algebraic closure of 𝔽_p(t), k̄=k and K̆=K, whose residue field contains the transcendental t, whereas every finite extension of ℚ̆_p has residue field 𝔽̄_p. That range is the contract below. Apply the comparison to the two p-divisible representations in the isogenous-lift construction. Its rational torsor is neutral; no integral torsor triviality follows without the integral hypotheses (Wintenberger97, Proposition 4.5.3 and its following unnumbered corollary, pp.1331–1332; Wintenberger97 line 1622; Kisin17, proof of Proposition 1.1.19, pp.11–12; Kisin17 line 484).

What PadicHodgeTheory must provide (gap:perfect-residue-period-torsor-comparison): For a perfect field k of characteristic p, K finite totally ramified over K₀=W(k)[1/p], a connected reductive group G over ℚ_p and b∈G(K₀), two admissible G-valued filtrations on the tensor G-isocrystal of b over K whose cocharacters are conjugate over K̄ have tensor-isomorphic underlying ℚ_p-valued fibre functors on Rep_ℚp(G); this is the period-torsor comparison of §5.5 beyond K/ℚ̆_p finite. Its source is stated for an arbitrary algebraically closed residue field, which reaches every perfect k by the unramified base change of §5.17, since the underlying ℚ_p-space of each crystalline realization is computed in the same B_cris and B_dR (Wintenberger97, §0, p.1293, and Proposition 4.5.3 with its following corollary, pp.1331–1332; Wintenberger97 lines 180–186 and 1622; Kisin17, proof of Proposition 1.1.19, pp.11–12; Kisin17 line 503).

### From TauCetiRoadmap.ShimuraVarieties

Section 7.0i supplies absolute Hodge tensors on abelian varieties and the rational compatible realizations of their flat families. For the Hodge-type application below the geometric family and its rational tensor system are inputs.

What ShimuraVarieties must provide (gap:integral-hodge-realization-extension): For a complete mixed-characteristic DVR O_K with perfect residue field and an abelian scheme A/O_K, prove that the rational étale and de Rham realizations of an absolute Hodge tensor of A_K agree under the crystalline–de Rham comparison for H¹(A_K), with mixed tensors, duals and Tate twists; neither the existence of an integral moduli model nor integral tensor extension is an input to this rational comparison.

The local interface uses vanHoften24 §§3.1.5–3.1.7, pp.27–28, and Kisin17 proof of Proposition 1.3.9, p.21; it makes no global component-surjectivity claim. In the nonordinary Levi application the specified M-valued filtration and very-good embedding are explicit hypotheses, rather than consequences of ordinary lifting.

## How to read the build

Layer 0 constructs frame algebra and the invariant tilde functor before displays and their group comparison. Layer 1 constructs canonical relative transport before universality. Layer 2 extends the supplied local-model filtration to tensor torsors and defines very-goodness and adaptedness independently of the desired deformation quotient. Layer 3 proves infinitesimal criteria and then the classical existence cases. Layer 4 uses a very-good embedding to construct a rigid tensor section, prove adapted factorization, and recognize integral étale tensors. Layer 5 isolates hyperspecial, relative-period and specialization interfaces. Layer 6 proves the ordinary normalization and constructs its lift through the central Levi modification; its rational action is proved in the isogeny category. Each target lists its statement inputs and the additional inputs of its indicated proof route.


## Layer 0: frames and contravariant displays


### 0.1 Zink coefficient ring

For a complete Noetherian local ring R with perfect residue field k of characteristic p>2, use the canonical Frobenius-stable subring Ŵ(R) of W(R) whose reduction to W(k) is surjective and whose kernel consists of Witt coordinates tending to zero in the maximal-ideal topology. Its canonical additive splitting is W(k) ⊕ Ŵ(m_R); this does not assume a ring section k→R. Put Î_R=ker(w₀:Ŵ(R)→R). Frobenius and Verschiebung restrict and V:Ŵ(R)→Î_R is an additive bijection. (KPZ26, §5.1, pp.47–48; KPZ26 line 2060).

The API includes the following facts.

- The inclusion into W(R) is an injective ring homomorphism.
- Reduction to W(k) has decaying-coordinate kernel and commutes with φ and V.
- Ŵ(R) identifies with the inverse limit of Ŵ(R/m_Rⁿ).
- V inverse on Î_R is additive and φ-semilinear; φ(a)=p V⁻¹(a) on Î_R.

**Checks.**

- For R=k, Ŵ(R)=W(k), Î_R=VW(k).
- A Witt vector with every coordinate the same nonzero nilpotent ε over k[ε]/ε² is excluded, whereas one with finitely many ε coordinates is allowed.
- R=W(k) is permitted although no characteristic-p ring section k→R exists.

A proof can proceed as follows. Construct first on Artin quotients, identify the decaying-coordinate kernel and pass to the inverse limit. Prove closure under Witt operations and compatibility with the canonical W(k) lift; use the restricted Witt identities, rather than coordinatewise multiplication.

*Needs:* Mathlib `WittVector`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`.


### 0.2 Dieudonné modules over perfect rings

For a perfect F_p-algebra R and every prime p, including p=2, contravariant Dieudonné theory is an anti-equivalence between p-divisible groups over Spec R and finite projective W(R)-modules M with σ-linear F and σ⁻¹-linear V satisfying FV=VF=p. Equivalently the linearization β:σ*M→M obeys pM⊂β(σ*M)⊂M and becomes an isomorphism after inverting p. Height is locally constant; do not impose a global basis or confuse perfect with a general reduced smooth base. The odd-prime hypothesis of this roadmap is not used: Gabber's theorem is stated for perfect rings at every prime, and Lau's extension of the display theory to p=2 concerns only the complete-local Zink ring (Lau14, Lemma 2.4, p.2216 and Theorem 5.3, p.2243; Lau14 lines 23–26 and 639; vanHoften24, Example 2.2.10, p.14; vanHoften24 line 614).

A proof can proceed as follows. Lemma2.4 identifies the finite-projective Dieudonné and display categories over perfect rings; Gabber’s theorem gives the group. Apply Cartier duality for our convention. Prove local projectivity of the F/V quotients, rather than adding a freeness assumption.

The API includes the following facts.

- Over a perfect field the functor is the contravariant Dieudonné functor of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10, with the rank-one normalizations of its §R07.2.12.
- The height of H at a point of Spec R is the rank of M there; on a disconnected R both are locally constant and need not be constant.
- The linearization β:σ*M→M satisfies pM⊂β(σ*M)⊂M; this height-one bound is the input of §0.5.
- For every n≥1, M/pⁿM with the induced F and V is the contravariant Dieudonné module of H[pⁿ], which is the covariant module of PrismaticCohomologyPartIII §6.0 of the Cartier dual H*[pⁿ].

**Checks.**

- For H=`μ_{p∞}`, M=W(R) with F=pσ and V=σ⁻¹. Modulo pⁿ this is W_n(R) with F=p·Frob, the PrismaticCohomologyPartIII §6.0 module of H*[pⁿ]=ℤ/pⁿ; the covariant module of μ_(pⁿ) itself has F=Frob, so omitting the Cartier dual exchanges the two.
- For H=ℚ_p/ℤ_p, M=W(R) with F=σ and V=pσ⁻¹; F is bijective modulo p, so the Hodge filtration ker(F mod p) is 0, matching dim H=0.
- Over R=𝔽_p×𝔽_p, the p-divisible group equal to `μ_{p∞}` on the first factor and 0 on the second has M=W(𝔽_p)×0, of ranks (1,0); a global-basis requirement would exclude it.

*Needs:* Mathlib `WittVector`; Mathlib `WittVector.frobenius`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10–R07.2.12; PrismaticCohomologyPartIII §6.0.


### 0.3 Display frame

A p-frame in this roadmap is (S,I,φ,φ₁), with S a commutative ring, I an ideal, I+pS⊂Jac(S), φ:S→S lifting p-power Frobenius modulo p, and a φ-semilinear additive map φ₁:I→S whose image generates S and with φ|I=pφ₁. A strict map carries I into I′ and commutes with φ and φ₁. This is the θ=p class of frames; nonstrict crystalline/Breuil frame morphisms are not included in its base-change theorem. (KPZ26, §5.1.1–5.1.2, pp.47–49; KPZ26 line 2073).

The API includes the following facts.

- D_R=(Ŵ(R),Î_R,φ,V⁻¹) is a p-frame.
- Strict maps form a category and induce maps on residue rings S/I.
- For a∈I, φ(a)=pφ₁(a).
- For W(k)[[u]], I=(p), φ(u)=uᵖ and φ₁(pa)=φ(a), obtain a p-frame.
- On a fixed ring S and ideal I, two p-frame structures with the same φ and φ₁ are equal; equality of their axiom proofs is irrelevant.

**Checks.**

- D_k has I=VW(k) and φ₁(Vx)=x.
- φ₁(pu)=uᵖ, not puᵖ.
- A map multiplying divided Frobenius by a unit other than 1 is excluded from strict morphisms.

A proof can proceed as follows. Package the listed axioms and strict morphisms; check composition and identity directly. Construct the Dieudonné–Witt instance using the preceding ring, and the power-series instance separately.

*Needs:* Mathlib `DividedPowers`; §0.1 (zink coefficient ring).


### 0.4 Logarithmic Witt coordinates on a PD kernel

For a surjective Artin local map B→R with perfect residue k and nilpotent PD kernel b compatible with the canonical p-divided powers, construct the logarithmic copy [b] in ker(Ŵ(B)→R) and the additive decomposition `Î_{B/R}=Î_B⊕[b]`. In these coordinates the extension of the divided Frobenius is V⁻¹ on Î_B and zero on [b]. The bracket here denotes PD logarithmic coordinates, not a multiplicative Teichmüller section. (KPZ26, §5.1.1(b), p.48; KPZ26 line 2092; Hoff23, Lemma 1.21, p.13; Hoff23 line 614).

The API includes the following facts.

- Every element of `Î_{B/R}` has a unique sum i+[x], with i∈Î_B and x∈b.
- The extended φ₁(i+[x]) is V⁻¹(i).
- Compatible PD maps preserve the splitting and φ₁.

**Checks.**

- For b=0 one recovers Î_B and V⁻¹.
- For B=k[ε]/ε²→k with trivial higher PD operations, the logarithmic ε direction is killed by φ₁.
- Take p=3, B=𝔽₃[x,y]/(x³,y³)→R=𝔽₃ with b=(x,y) and the divided powers γ₂(x)=x²/2, γ₂(y)=y²/2, γ_n(x)=γ_n(y)=0 for n≥3. Logarithmic coordinates give [x+y]_log=[x]_log+[y]_log. Teichmüller representatives do not: the Witt sum [x]+[y] has first coordinate x+y and second coordinate −x²y−xy², which is nonzero because x²y and xy² are distinct basis monomials, whereas [x+y] has second coordinate 0. A Teichmüller splitting of `Î_{B/R}` is therefore not additive.

A proof can proceed as follows. Use the PD Witt logarithm for nilpotent divided powers; check the formula on finite-coordinate vectors and then the Artin limit. Verify φ=pφ₁, including φ([b])=0 for this relative frame.

*Needs:* §0.1 (zink coefficient ring); Mathlib `DividedPowers`.


### 0.5 Perfect-ring height-one shtuka comparison

Over a perfect F_p-algebra R and for every prime p, including p=2, a finite projective W(R)-module M with F:σ*M→M whose linearization is an isomorphism after inverting p and satisfies pM⊂F(σ*M)⊂M determines V uniquely with FV=VF=p, and conversely. The resulting anti-equivalence with p-divisible groups is the perfect-ring comparison of Layer 0. This is the height-one local GL_n-shtuka interface; the general local-shtuka moduli problem remains with its owner. (Lau14, Lemma 2.4, p.2216; Lau14 line 639; for the F̄_p instances, vanHoften24, Example 2.2.10, p.14; vanHoften24 line 614; Zhu17, §3.2 and proof of Proposition 3.11, pp.461–463; Zhu17 line 2408).

**Checks.**

- For R=F_p and M=Z_p with F=p, the formula gives V=1 and FV=VF=p.
- With F=1 on the same module, V=p; interchanging these two cases reverses the étale and multiplicative normalizations.
- Over 𝔽₂ the multiplicative line has (F,V)=(2,1) and the étale line has (F,V)=(1,2); each satisfies FV=VF=2 and the bound 2M⊂FM⊂M, so the statement is not restricted to odd p. The candidate F=4 on ℤ₂ would need V=1/2, which is not integral, and fails 2M⊂FM.
- The zero module has the unique F,V pair; on F_p×F_p a module of ranks (0,1) remains finite projective without a global rank-one basis.

A proof can proceed as follows. Use that W(R) is p-torsion-free for perfect R and that σ is invertible. Define V=F⁻¹p on the rational module and use the height bound for its integral image, with the correct semilinearity. Invoke the existing perfect-ring anti-equivalence.

*Needs:* §0.2 (dieudonné modules over perfect rings); Mathlib `WittVector`; Mathlib `WittVector.frobenius`.


### 0.6 Normal-decomposable frame pair

Over a p-frame let M be finite free and M₁⊂M satisfy IM⊂M₁ with M=L⊕T and M₁=L⊕IT for finite free summands of specified ranks d and h−d. Morphisms are S-linear maps preserving M₁. Existence of such a normal decomposition is a property; a selected decomposition is a coordinate witness, not invariant data. Record M/M₁ as a free S/I-module of rank h−d when S/I is nonzero. If S is the zero ring, this quotient is zero. (KPZ26, §5.1.2, pp.48–49; KPZ26 line 2101).

The API includes the following facts.

- The inverse image of a rank-d direct summand of M/IM is a pair when a normal splitting exists.
- M/M₁ is finite free over S/I with the indicated rank when S/I is nonzero; the zero-frame quotient is zero.
- In normal coordinates a preserving map has blocks A,B,C,D with C having entries in I.
- Changing the normal decomposition induces the identity on the underlying pair.
- Two morphisms of fixed normal pairs are equal if their underlying S-linear maps on M agree; preserving the distinguished submodule is a property.

**Checks.**

- d=0 gives M₁=IM, not zero.
- d=h gives M₁=M.
- For M=S² and M₁=Se₁⊕Ie₂, a map e₁↦e₂ is excluded when 1∉I.

A proof can proceed as follows. Construct coordinate witnesses from a split filtration modulo I, and prove two witnesses describe the same pair category. A preserving map has lower-left block in I.

*Needs:* §0.3 (display frame).


### 0.7 Relative Dieudonné–Witt frame

For an Artin local PD surjection B→R as in the logarithmic Witt construction, put `D_{B/R}=(Ŵ(B),Î_{B/R},φ,φ₁)`, with φ₁(i+[x])=V⁻¹(i). There are strict frame maps `D_B→D_{B/R}→D_R`. Extend to continuous complete local PD thickenings by compatible Artin quotients when the kernel topology and divided powers satisfy Hoff Notation1.19. (KPZ26, §5.1.1(b), p.48; KPZ26 line 2092; Hoff23, Notation 1.19–Lemma 1.21, pp.13–14; Hoff23 line 614).

The API includes the following facts.

- A compatible nilpotent PD thickening produces the relative frame.
- `D_B→D_{B/R}` is strict with underlying identity on Ŵ(B).
- `D_{B/R}→D_R` is strict and functorial in PD diagrams.

**Checks.**

- B=R gives the absolute frame.
- For k[ε]→k, φ₁ kills the logarithmic ε summand.
- For B=𝔽₃[x]/(x⁴)→R=𝔽₃ with kernel b=(x), divided powers on b would force x³=3!·γ₃(x)=0, but x³≠0 in B; so b carries no divided powers and the construction yields no relative frame. For B=𝔽₃[x]/(x³) the same identity reads 0=0, and γ₂(x)=x²/2=2x² with γ_n=0 for n≥3 is a nilpotent PD structure on (x): the products γ₁(x)γ₂(x)=x³/2 and γ₂(x)² are 0, matching 3γ₃(x)=0 and 6γ₄(x)=0, so `D_{B/R}` exists.

A proof can proceed as follows. Verify the frame axioms in logarithmic coordinates. Establish continuity and inverse-limit compatibility before using complete rings.

*Needs:* §0.3 (display frame); §0.4 (logarithmic witt coordinates on a pd kernel).


### 0.8 Invariant tilde module

Construct τ_F(M,M₁), denoted M̃₁, as a finite free S-module functorial in a normal pair. In normal coordinates it is φ*L⊕φ*T. On a preserving map [[A,B],[C,D]] its matrix is [[φ(A),pφ(B)],[φ₁(C),φ(D)]]. This formula descends through changes of normal decomposition, so the functor does not retain a chosen splitting. (KPZ26, §5.1.2, (5.1.3), pp.48–49; KPZ26 line 2110).

The API includes the following facts.

- Normal coordinates identify τ with φ*L⊕φ*T.
- The displayed four-block formula preserves identities and composition.
- Coordinate changes induce coherent natural isomorphisms, independent of intermediate choices.
- Over a nonzero coefficient ring, the free rank of τ equals the free rank of M; over the zero ring both modules are zero.

**Checks.**

- A map with only upper-right entry b gives pφ(b) there; omitting p fails.
- A lower-left entry Vx over D_R is sent to x, not φ(Vx).
- Over a characteristic-p coefficient quotient, τ remains free even when its comparison to φ*M has kernel.

A proof can proceed as follows. Check composition using φ(C)=pφ₁(C) and semilinearity; coordinate changes therefore give coherent isomorphisms. Glue the coordinate constructions to the pair category. This computation is a proof step, not a second planned matrix theory.

*Needs:* §0.6 (normal-decomposable frame pair).


### 0.9 Strict base change of tilde modules

For every strict p-frame map F→F′ and normal pair P, the canonical map `τ_F(P)⊗_S S′→τ_{F′}(P⊗_S S′)` is an isomorphism natural in P and compatible with successive strict maps and normal-coordinate changes. The induced pair uses the extended filtration, not an unsupported injection M₁⊗S′⊂M⊗S′. (KPZ26, (5.1.4), p.49; KPZ26 line 2133).

A proof can proceed as follows. In normal coordinates both sides are φ′*L′⊕φ′*T′; strictness identifies all four blocks. Check cocycles before removing the coordinates.

The theorem does not apply to the Breuil–Kisin lattice comparison of §2.5, which is not a strict map of p-frames.

**Checks.**

- For the strict reduction D_R→D_(R/m_R²), base change along the nonflat quotient Ŵ(R)→Ŵ(R/m_R²) gives an isomorphism of free modules of rank h; no injectivity of M₁⊗Ŵ(R/m_R²)→M⊗Ŵ(R/m_R²) is used, and the extended filtration replaces it.
- For R→R/m_R³→R/m_R², the composite of the two comparison isomorphisms is the comparison for the composite map.
- For the identity map of frames the comparison is the identity of τ_F(P).

*Needs:* §0.8 (invariant tilde module).


### 0.10 Comparison with Frobenius pullback

There is a natural S-linear map j:M̃₁→φ*M, represented in normal coordinates by diag(1,p). After inverting p it is an isomorphism. If S is p-torsion-free, j is injective and its image is the image of φ*M₁→φ*M. Without that hypothesis retain j as a map; do not identify its domain with its image. (KPZ26, §5.1.7, p.49; KPZ26 line 2157).

The API includes the following facts.

- j has normal matrix diag(1,p).
- j[1/p] is an isomorphism.
- For p-torsion-free S, image(j)=image(φ*M₁→φ*M).

**Checks.**

- For d=0, j is multiplication by p on φ*M.
- For d=h, j is the identity.
- For S=W(k) and d=0 in rank one, j is multiplication by p. Tensoring this module map with k gives the zero map k→k, with nonzero source; this scalar reduction is not a strict frame map W(k)→k, since φ₁(p)=1 cannot descend.

A proof can proceed as follows. Check compatibility with the four-block functor formula. The normal form proves the injection and image statement precisely under p-torsion-freeness.

*Needs:* §0.8 (invariant tilde module).


### 0.11 Contravariant Dieudonné display

A display over D_R is a normal pair (M,M₁) with an isomorphism Ψ:M̃₁→M. Equivalently it has φ-semilinear Φ:M→M and Φ₁:M₁→M with Φ₁(ax)=φ₁(a)Φ(x), Φ|M₁=pΦ₁ and images of Φ₁ generating M. Use the contravariant normalization D(H); rank M is the height of H and rank(M₁/Î_R M) is dim H. Keep this normalization in duality and Hodge cocharacters. (Hoff23, Definition 1.10, p.11; Theorem 1.29 and Remark 1.30, pp.15–16; Hoff23 line 504).

The API includes the following facts.

- An invertible Ψ on τ determines the display maps.
- The Ψ and divided-Frobenius descriptions are equivalent.
- The Cartier-dual display uses the contravariant normalization and the standard Tate pairing.
- A map of underlying normal pairs is a display morphism exactly when its induced tilde map commutes with Ψ. An invertible such pair map is a display isomorphism.

**Checks.**

- For Q_p/Z_p over k, Φ=σ and M₁=pM.
- For `μ_{p∞}`, Φ=pσ and M₁=M.
- The ordinary height-two example has rank M=2 and rank(M₁/ÎM)=1; swapping the two ranks changes dim H.

A proof can proceed as follows. Use a normal decomposition to recover Φ and Φ₁ from Ψ and conversely; show these constructions commute with change of normal decomposition. They do not require an injective j after torsion base change.

*Needs:* §0.8 (invariant tilde module); §0.10 (comparison with frobenius pullback).


### 0.12 Base change of displays

A strict frame map sends (M,M₁,Ψ) to the base-changed pair and Ψ′ obtained using the inverse strict base-change isomorphism for τ. This is functorial on display morphisms and preserves the residual marking. For R→R′ complete local maps inducing perfect residue-field maps, apply the induced strict Zink frame map. (Hoff23, §1.1, pp.8–10; Hoff23 line 368; KPZ26, §5.1.19, p.52; KPZ26 line 2282).

The API includes the following facts.

- A strict map gives a functor on displays.
- Reduction to k gives the marked residual display.
- Two successive base changes agree by the canonical τ isomorphism.

**Checks.**

- Identity base change preserves the given Ψ.
- Reduction R→R/m² is allowed and retains a free tilde module.
- Reduction through R/m³→R/m² agrees with direct reduction.

A proof can proceed as follows. Transport Ψ by the canonical τ comparison. Identity and composition follow from its cocycle; quotient maps need no flatness.

*Needs:* §0.11 (contravariant dieudonné display); §0.9 (strict base change of tilde modules).


### 0.13 Displays and p-divisible groups

For a complete Noetherian local ring R with perfect residue field of characteristic p>2, the contravariant Dieudonné display functor H↦D̂(H) is an anti-equivalence between p-divisible groups over R and Dieudonné displays over D_R. It is compatible with Cartier duality, residue reduction, and the crystalline D(H) over a perfect field. This is an extension of the base roadmap’s field Dieudonné classification, not a second definition of p-divisible groups. (Hoff23, Theorem 1.29 and Remark 1.30, pp.15–16; Hoff23 line 717; Lau14, Corollaries 5.5–5.6, p.2244; Lau14 line 1741).

A proof can proceed as follows. Use Lau’s equivalence over admissible topological rings, then Cartier duality to change from the source covariant normalization. Compare perfect-field evaluations to the imported D(H).

The comparison with the crystalline D(H) is an isomorphism of contravariant functors, not only of isomorphism classes of objects.

**Checks.**

- D̂(ℚ_p/ℤ_p) is M=Ŵ(R) with M₁=Î_R M, Φ=φ and Φ₁=V⁻¹ on Î_R, so rank(M₁/Î_R M)=0=dim H.
- D̂(`μ_{p∞}`) is M=Ŵ(R) with M₁=M, Φ₁=φ and Φ=pφ, so rank(M₁/Î_R M)=1=dim H; exchanging these two normalizations gives the covariant theory.
- For H=`μ_{p∞}`⊕ℚ_p/ℤ_p, the projection H→ℚ_p/ℤ_p is sent to the inclusion of the second summand of D̂(H), so arrows reverse.

*Needs:* §0.11 (contravariant dieudonné display); §0.12 (base change of displays); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10–R07.2.12; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


### Examples

For H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p, use the ordered multiplicative and étale basis. The two Frobenius multipliers are p and 1, the Hodge rank is 1, and j=diag(1,p). Over a p-killed coefficient quotient the second basis vector is in ker(j), while its tilde module remains free of rank 2.


### Dependencies

Mathlib Witt vectors and divided powers; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10–R07.2.12; PrismaticCohomologyPartIII §6.0; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


## Layer 1: canonical transport and universal deformations


### 1.1 Universal marked filtration pair

Let H₀/k have height h and dimension d and choose a residual frame M₀≅Λ⊗W(k). Over the integers O_F of a complete discretely valued extension F/ℚ_p with perfect residue k, let R_GL be the completed local ring of `Gr(d,Λ)_{O_F}` at its residual Hodge point. Set M=Λ⊗Ŵ(R_GL) and let M₁ be the inverse image of the universal rank-d summand. This is a normal pair and represents marked filtration lifts in the chosen module frame; R_GL is noncanonically `O_F[[t₁,…,t_{d(h−d)}]]`. (Hoff23, Construction 1.27, p.15; Hoff23 line 692; KP18, §3.1.8, pp.165–166; KP18 line 1899).

The API includes the following facts.

- Pulling back its pair gives the prescribed filtration.
- Marked filtration lifts correspond to continuous local maps from R_GL.
- The relative tangent space is Hom_k(Fil¹,(M₀⊗k)/Fil¹), where Fil¹⊂M₀⊗k is the residual Hodge subspace of dimension d; it has dimension d(h−d).

**Checks.**

- For h=1,d=0 or1, the parameter ring is O_F.
- For h=2,d=1, the ring is a one-variable formal power-series ring.
- A rank-d filtration gives dim H=d, not h−d.

A proof can proceed as follows. Import the Grassmannian universal summand and its formal completion; the complete-local splitting lifts the residual normal basis. Prove the stated functorial description of its points.

*Needs:* §0.6 (normal-decomposable frame pair); §0.1 (zink coefficient ring); Mathlib `Module.Grassmannian.functor`; SchemeAndStackFoundations §§4.1–4.4 and 4.7–4.8; ModularCurves §0G.


### 1.2 Tilde factorization through an enlarged frame ideal

For frames on the same S with I⊂I′ and φ₁′ extending φ₁, a normal pair P has an induced I′-pair P′, and there is a canonical natural isomorphism `τ_F(P)≅τ_{F′}(P′)`. In the relative PD situation this factors the tilde functor through the relative pair, rather than through the image inside φ*M. (KPZ26, §5.1.8–Lemma 5.1.9, p.50; KPZ26 line 2174).

The API includes the following facts.

- The induced pair and τ isomorphism are functorial.
- The comparison has underlying coefficient-ring identity.
- Successive ideal enlargements give the direct comparison.

**Checks.**

- I=I′ gives identity.
- `D_{k[ε]}→D_{k[ε]/k}` forgets the first-order filtration direction before τ.
- The comparison for a three-ideal chain is independent of the intermediate ideal.

A proof can proceed as follows. Extend a normal decomposition and compare the four blocks. Prove transitivity for I⊂I′⊂I″. Apply this to the relative frame before reducing to the residue frame.

*Needs:* §0.7 (relative dieudonné–witt frame); §0.8 (invariant tilde module).


### 1.3 Canonical first-order comparison

Fix a pair over D_R and a trivialization `M≅M₀⊗_{W(k)}Ŵ(R)` lifting its residual identity. Put a=m_R²+pR. Relative-frame factorization followed by strict base change defines c: `M̃_{0,1}⊗_{W(k)}Ŵ(R/a)≅M̃₁⊗_{Ŵ(R)}Ŵ(R/a)`. It is natural for maps preserving the trivialization. In adapted bases c=[[1,0],[V⁻¹(Z̄),1]]. It makes the Frobenius comparison square commute, but that square does not uniquely determine it. (KPZ26, Lemma 5.1.11, Lemma 5.1.15, Remark 5.1.17 and (5.1.18), pp.50–52; KPZ26 line 2221).

The API includes the following facts.

- The specified frame/trivialization data produce c without a choice of horizontal inverse.
- An adapted graph matrix Z yields lower-left V⁻¹(Z̄).
- Compatible marked local maps pull c back to c′.
- For a⊂b, c base changes to an isomorphism over Ŵ(R/b).

**Checks.**

- For the constant pair in the constant trivialization, c is identity.
- For a rank-one graph direction Z=Vε, c has lower-left ε; identity transport would fail.
- After a p-torsion quotient diag(1,p) has kernel, so a commuting square alone cannot select the lower-left block.

A proof can proceed as follows. Use I′=ker(Ŵ(R/a)→W(k)→k) and the chosen residual-module trivialization; construct c via the split relative frame. Compute the lower-unipotent formula only after constructing it invariantly. Check the base rings on both sides of every comparison.

*Needs:* §1.2 (tilde factorization through an enlarged frame ideal); §0.9 (strict base change of tilde modules); §0.10 (comparison with frobenius pullback).


### 1.4 Canonical rational Witt section

For a complete local p-torsion-free W(k)-algebra A with m_Aᴺ⊂pA for some N, and a marked display deformation, construct the unique Frobenius-equivariant rational section D(H₀)[1/p]→M_A[1/p] reducing to the residual identity. Convergence is measured using the lattice neighborhoods pⁿŴ(A) inside the localization, using this integral lattice; do not use a topology defined by powers of the unit ideal (p) in Ŵ(A)[1/p]. Its specialization to A=O_K yields the filtered K-vector-space identification. (KP18, Lemma 3.1.17 and §3.1.18, pp.169–170; KP18 line 2011; KPZ26, §7.3.1(2), pp.85–86; KPZ26 line 3790).

The API includes the following facts.

- The rational map is φ-equivariant and lifts the identity.
- These conditions determine the section under the contraction hypotheses.
- Evaluation to K agrees with the filtered crystalline comparison of H/O_K.

**Checks.**

- For a constant display the section is the constant embedding.
- Inverting p does not make lattice neighborhoods pⁿŴ(A) equal to the whole underlying additive space.
- For A=O_K the evaluation retains the deformation Hodge filtration rather than the constant residual one.

A proof can proceed as follows. Iterate Frobenius on the maximal-ideal error and use decaying Witt logarithmic coordinates to obtain p-adic lattice convergence for p>2. Uniqueness follows by the same contraction. Identify the evaluation through the Breuil PD comparison, not by equating S and Ŵ(O_K).

*Needs:* §0.11 (contravariant dieudonné display); §0.1 (zink coefficient ring); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25.


### 1.5 Constancy of a display to first order

In a marked module trivialization as above, call Ψ constant modulo a precisely when Ψ̄∘c=Ψ₀⊗1 as maps from `M̃_{0,1}⊗Ŵ(R/a)` to M₀⊗Ŵ(R/a). For an O_Ĕ-local model use a_G=m_G²+π_E R_G and first base change both ends of c along R_G/a→R_G/a_G. Constancy is relative to this marked trivialization; it is not literal equality of arbitrary normal-decomposition matrices. (KPZ26, §5.1.19, p.52 and (5.2.2), pp.53–54; KPZ26 line 2282; Hoff23, Remark 2.37, p.29; Hoff23 line 1378).

The API includes the following facts.

- Constancy is the equation Ψ̄c=Ψ₀.
- A change of marked frame transforms Ψ and c together.
- Constancy descends to larger first-order quotient ideals.

**Checks.**

- When c has lower-left ε, the constant Ψ is Ψ₀c⁻¹, not generally Ψ₀ in that coordinate basis.
- For ramified E the quotient uses π_E, which can kill more than p.
- Reduction to the residue display satisfies the equation identically.

A proof can proceed as follows. Define the equality in the common coefficient ring. Derive its transformation rule under a marked change of trivialization by naturality of c.

*Needs:* §1.3 (canonical first-order comparison); §0.12 (base change of displays).


### 1.6 The rational section preserves lifted tensors

If integral φ-invariant tensors on a deformation reduce to the residual tensors and admit a tensor-preserving integral frame, the canonical rational section carries the residual tensors to those lifted tensors. In particular its induced K-filtration can be tested on the original tensor family. No equality of arbitrary integral lattices follows merely from the rational section. (KP18, Lemma 3.2.13, p.174; KP18 line 2205).

A proof can proceed as follows. Extend the tensor-frame trivialization and use uniqueness of the φ-equivariant rational section on each mixed tensor construction. The identity modulo the maximal ideal fixes the residual values.

*Needs:* §1.4 (canonical rational witt section).


### 1.7 Crystalline deformation of displays

For surjections S→R of complete Noetherian local rings with perfect residue field, equip the kernel with nilpotent divided powers compatible with the canonical p-divided powers and continuous in the sense that they descend through a fundamental system of open quotient ideals. For these thickenings, passing from displays on the relative Dieudonné frame `D_{S/R}` to displays on D_R is an equivalence. Combined with Grothendieck–Messing, lifting a marked display across a nilpotent PD thickening amounts to lifting its Hodge direct summand. Retain the nilpotence, continuity and perfect-residue hypotheses; this is not a claim about arbitrary ideal quotients. (Hoff23, Theorem 1.23 and Proposition 1.26, pp.14–15; Hoff23 line 641).

A proof can proceed as follows. Apply relative-frame crystalline descent, then recover the Hodge lift from the absolute frame pair. Use the imported crystalline site and GM functor, with the contravariant convention checked on the two rank-one displays.

*Needs:* §0.13 (displays and p-divisible groups); §1.2 (tilde factorization through an enlarged frame ideal); AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


### 1.8 Universal display with rigid first order

Over R_GL choose an isomorphism Ψ:M̃₁→M lifting Ψ₀ and constant modulo a=m_GL²+m_F R_GL via c. The resulting marked display is universal for deformations of H₀ over complete local O_F-algebras with residue k. Universality concerns marked display/group deformations, not filtration lifts in an arbitrary unmarked frame. (Hoff23, Construction 1.27 and Theorem 1.28, p.15; Hoff23 line 711; KPZ26, §5.1.19, p.52; KPZ26 line 2282).

A proof can proceed as follows. Lift the prescribed first-order isomorphism using smoothness of GL. GM identifies the tangent map with the Grassmannian tangent isomorphism. Prorepresentability and formal smoothness then show the classifying map is an isomorphism.

*Needs:* §1.1 (universal marked filtration pair); §1.5 (constancy of a display to first order); §1.7 (crystalline deformation of displays).


### Examples

For Z=Vε the canonical comparison is 1+εE₂₁ and its inverse is 1−εE₂₁. Thus Ψ=Ψ₀(1−εE₂₁) satisfies Ψc=Ψ₀. The same two maps must be reduced to Ŵ(R/(m²+π_E R)) before checking this identity over reflex coefficients.


### Dependencies

Layer 0; ModularCurves §0G; SchemeAndStackFoundations §§4.1–4.4 and 4.7–4.8; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25.


## Layer 2: integral tensors and very good embeddings

### 2.0 Rational σ-centralizer

Let G be a connected reductive group over ℚ_p and b∈G(K₀), with k=F̄_p as throughout Layer 2, so that K₀=ℚ̆_p. Use the rational σ-centralizer functor J_b(A)={g∈G(K₀⊗ℚ_p A) : g⁻¹bσ(g)=b} on commutative ℚ_p-algebras A, where σ acts on G(K₀⊗ℚ_p A) through the given ℚ_p-structure of G, as Witt Frobenius on K₀ and as the identity on A; a group given only over K₀ has no such σ. Its multiplication and inverse come from G, and J_b(ℚ_p) is exactly the tensor-preserving automorphism group of the G-isocrystal. Construct its affine reductive ℚ_p-model (KZ25, §3.4.4, p.27; KZ25 line 1183), and prove that the inclusion J_b→G, defined over K₀, identifies J_b with the centralizer M_b of the Newton cocharacter ν_b over K₀, so that J_b is an inner form of M_b (Kisin17, (1.2.12), p.14; Kisin17 line 648). Its source is the fixed G-isocrystal and its target is an affine ℚ_p-group scheme.

The API includes the following facts.

- For every commutative ℚ_p-algebra A, J_b(A) is a subgroup of G(K₀⊗ℚ_p A): if g⁻¹bσ(g)=b and h⁻¹bσ(h)=b then (gh)⁻¹bσ(gh)=b and gbσ(g)⁻¹=b.
- A map of ℚ_p-algebras A→A′ induces a group homomorphism J_b(A)→J_b(A′), functorially.
- For h∈G(K₀), conjugation g↦h⁻¹gh is an isomorphism J_b≅J_(h⁻¹bσ(h)) of ℚ_p-groups.
- J_b(ℚ_p) is the group of tensor-preserving automorphisms of the G-isocrystal (D,bσ).
- J_b is an inner form of M_b, and the inclusion identifies J_b with M_b over K₀.
- For b=σ(ṫ) as in §6.1, J_b(ℚ_p)⊂M(K₀) for the Newton Levi M (KZ25, §3.4.4, p.27; KZ25 line 1188).

**Checks.**

- For G=G_m and b=p, the equation is σ(g)=g and gives ℚ_p×; it is larger than ℤ_p×.
- For b=diag(p,1), the rational centralizer is diagonal, with two ℚ_p× factors; the off-diagonal entries satisfy pσ(x)=x or σ(x)=px and vanish. Here ν_b has slopes (1,0), M_b is the diagonal torus and J_b=M_b is its trivial inner form.
- For b=[[0,1],[p,0]] in GL₂, ν_b is central of slope 1/2, M_b=GL₂, and J_b(ℚ_p) is the unit group of the quaternion division algebra over ℚ_p, a nontrivial inner form of GL₂; reading J_b as the ordinary centralizer of b over ℚ_p would give the torus ℚ_p(√p)×.
- For the rank-zero group, J_b is the trivial group; an arbitrary GL₂ matrix cannot act on a specified tensor isocrystal.
- Let T be the diagonal torus of GL₂ over ℚ_p, a∈`W(𝔽_{p²})` with σ(a)≠a and u=[[1,a],[0,1]], and present T over K₀ as uTu⁻¹, whose points are [[x,a(y−x)],[0,y]]. With σ taken through the ℚ_p-model, σ(u t u⁻¹)=u σ(t) u⁻¹, and b=1 gives J_b(ℚ_p)=uT(ℚ_p)u⁻¹≅(ℚ_p×)². Entrywise Frobenius instead sends u·diag(2,1)·u⁻¹=[[2,−a],[0,1]] to [[2,−σ(a)],[0,1]], which is not of the form [[x,a(y−x)],[0,y]] since −σ(a)≠−a; it does not even preserve the K₀-subgroup.

*Needs:* PadicHodgeTheory §5.5; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”; ReductiveGroupsPartII §RG2.3.3.


### 2.1 Integral tensor and local-model datum

Fix p>2, k=F̄_p, W=W(k), a finite free Z_p-module Λ, and a family s_a in the direct sum of mixed tensor powers of Λ and Λ∨. Require a smooth affine full fixer G̃⊂GL(Λ), with connected reductive generic fibre G, cut out scheme-theoretically by s_a on every Z_p-algebra. Write 𝒢=G̃ for this full fixer and 𝒢° for its connected parahoric subgroup. Call G acceptable when G^ad is a product of restrictions of scalars of adjoint groups that split tamely over their respective fields. A good integral Hodge embedding includes scalars, a minuscule weight-(0,1) conjugacy class and a compatible closed immersion of its supplied flat normal local model into Gr(d,Λ). A point x and a tensor frame D(H₀)≅Λ_W complete the marked datum. For generic-fixer and cocharacter statements retain the full fixer even when 𝒢°≠𝒢. (KPZ26, §5.2, pp.52–54; KPZ26 line 2291; KZ25, §3.2.1–3.2.3, pp.22–23; KZ25 line 969).

The API includes the following facts.

- Mixed tensor degrees include dual factors and transport under finite-free base change.
- For every coefficient algebra A, G̃(A) consists exactly of automorphisms fixing every s_a⊗1.
- The chosen local model and Grassmannian immersion are named data with the stated flatness and normality hypotheses.
- Two cutting families with the same closed group scheme give the same tensor-isomorphism torsors.

**Checks.**

- The empty family has fixer GL(Λ).
- An endomorphism tensor has centralizer as fixer; this does not demand commuting with its values only at geometric points.
- If the integral fixer is disconnected, identifying it with its connected parahoric is rejected.
- The identity in Λ⊗Λ∨ is fixed by every automorphism; treating Λ∨ as another covariant copy fails.

A proof can proceed as follows. Use the scheme stabilizer rather than only its Z_p-points. Import the group scheme and local-model carriers; package their specified embedding as input. The scheme-local-model representative and Hodge-immersion extensions are part of the exact supplier contracts, so this definition does not assert that every parahoric datum has a good embedding.

*Needs:* ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; SchemeAndStackFoundations §§1.15 and 2.3; PadicHodgeTheory §5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10–R07.2.12; gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion; gap:full-fixer-cutting-tensors.


### 2.2 Height-one tensor filtration lattice

For K/W(k)[1/p] finite totally ramified, choose uniformizer π and Eisenstein E(u), and set 𝔖=W(k)[[u]]. A local-model filtration point y over O_K defines a direct summand in D⊗O_K. Its inverse image F in D⊗𝔖 under u↦π is finite free of full rank with E(D⊗𝔖)⊂F⊂D⊗𝔖. Residual tensors define rational tensors in F[1/E]; do not identify F with φ*F or with the tilde module before the relevant comparison. (KP18, Lemma 3.2.6 and its lattice construction, pp.171–172; KP18 line 2103; Hoff23, Lemma 2.7, pp.18–19; Hoff23 line 857).

The API includes the following facts.

- F is the inverse image of Fil¹ under evaluation modulo E.
- E·(D⊗𝔖)⊂F⊂D⊗𝔖.
- A compatible choice of uniformizer and coefficient map transports the elementary modification; comparison maps are explicit.

**Checks.**

- For Fil¹=0, F=E·(D⊗𝔖).
- For full Fil¹, F=D⊗𝔖.
- For a split height-two filtration, F=𝔖e₁⊕E𝔖e₂; replacing E by p changes its O_K quotient.

A proof can proceed as follows. Use the elementary modification associated with the O_K direct summand and a normal basis to prove freeness. The generic local-model orbit gives the cocharacter description after completion at E.

*Needs:* §2.1 (integral tensor and local-model datum); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.1; §0.6 (normal-decomposable frame pair).


### 2.3 Completed orbit deformation ring

For the supplied good embedding and x, let R_G be the completed local ring of `Mloc_{𝒢,μ}` at x after completion of the reflex field’s maximal unramified base to residue k. Let R_E be the corresponding completed Grassmannian ring. The embedding gives a continuous local surjection R_E→R_G; R_G is flat over O_Ĕ and normal, R_G[1/p] is regular, and its filtration map lands in the prescribed generic flag variety. The universal pair on R_E restricts to a pair on R_G. This construction assumes the named local-model geometric inputs and does not prove them by flatness of a universal group. (KPZ26, §5.2.1, pp.52–53; KPZ26 line 2298; KZ25, §§3.2.2–3.2.3, p.22; KZ25 lines 984–990).

The API includes the following facts.

- The local-model immersion induces R_E→R_G.
- The pulled-back pair has underlying module Λ⊗Ŵ(R_G).
- Continuous maps R_G→A classify nearby filtration points lying in the supplied local model.

**Checks.**

- For 𝒢=GL(Λ) and the full Grassmannian, R_G=R_E; at h=2,d=1 this is O_Ĕ[[t]]. Its generic filtration is the graph line spanned by e₁+te₂, rather than the whole projective flag variety before completion.
- A filtration outside the local-model closed subscheme does not correspond to a map from R_G.
- For ramified E the base is O_Ĕ, not W(k) with the ramification of E ignored.

A proof can proceed as follows. Take the indicated completed local rings and pull back the universal summand. Obtain flatness, normality and the orbit description from gap:scheme-local-model-representative, and the specified immersion from gap:scheme-local-model-hodge-immersion; formal completion alone does not establish these properties.

*Needs:* §2.1 (integral tensor and local-model datum); §1.1 (universal marked filtration pair); SchemeAndStackFoundations §§4.1–4.4 and 4.7–4.8; ModularCurves §0G; gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion.


### 2.4 Integral tensors on the filtration lattice

For a good integral Hodge embedding and the height-one lattice F associated with y∈Mloc(O_K), the rational cutting tensors lie in F^⊗ and their isomorphism scheme with (Λ,s_a) over 𝔖 is a trivial 𝒢-torsor, provided the full-fixer/component compatibility and the punctured-spectrum parahoric purity input hold. Under the older KP18 setup one may instead assume the explicit vanishing `H¹(Spec𝔖\{(p,u)},𝒢°)=1` together with its scalar condition and the component reduction of KP18 (3.2.7)–(3.2.8). The modern route uses Anschütz Proposition10.3 in its actual coefficient-ring generality. (KP18, Lemma 3.2.6 and proof, pp.171–172; KP18 line 2107; Hoff23, Lemma 2.7, pp.18–19; Hoff23 line 857; Anschuetz22, Proposition 10.3, p.33; Anschuetz22 line 1388).

A proof can proceed as follows. Construct the G-structure on F[1/E] by its inclusion in the original module. On the E-adic completion of 𝔖[1/p], use the generic cocharacter and its Henselian coefficient section to obtain a second reduction. Glue on the punctured spectrum by the precise Beauville–Laszlo theorem, extend using parahoric purity, and identify the resulting tensor lattice by Hartogs. For the full fixer first kill its component torsor on Spec k((u)), which is already trivial on D(E); then extend the connected parahoric torsor by purity. Trivialize the extended smooth torsor using the algebraically closed residue field. Purity has the exact supplier contract stated above, not an elementary consequence of reductivity.

Distinguish integrality, torsor representability, torsor extension and existence of an integral frame as separate assertions. No theorem here changes an arbitrary full fixer to its connected parahoric.

*Needs:* §2.2 (height-one tensor filtration lattice); SchemeAndStackFoundations §§1.15 and 2.3; ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; gap:parahoric-disc-purity; gap:full-fixer-component-reduction; gap:punctured-disc-torsor-patching.


### 2.5 Breuil–Kisin to tilde lattice comparison

For the preceding O_K filtration lattice F, the map 𝔖→Ŵ(O_K), u↦[π], identifies `Ŵ(O_K)⊗_{φ,𝔖}F` with the tilde module for the corresponding pair. The comparison of Frobenius modifications uses φ(E([π]))=p times a unit in Ŵ(O_K); φ(E([π])) itself is a non-zero-divisor and is not a unit. Transport the integral 𝒢-structure along this isomorphism. (KP18, Lemma 3.2.9 and (3.2.10), pp.172–173; KP18 line 2139; Hoff23, Lemma 2.7, p.18; Hoff23 line 857).

A proof can proceed as follows. Evaluate the Eisenstein polynomial in Ŵ(O_K), apply the divided Frobenius and check its W(k) reduction is a unit. In normal coordinates the scaled E block becomes the p block. State this as a lattice comparison, not as a strict map between incompatible frames.

**Checks.**

- For Fil¹=0 in rank one, F=E(u)𝔖 and the image of `Ŵ(O_K)⊗_{φ,𝔖}F` is φ(E([π]))Ŵ(O_K)=pŴ(O_K), the image of j=p on the tilde module of the pair with d=0.
- For Fil¹ of full rank one, F=𝔖, both sides are Ŵ(O_K) and j is the identity.
- Under reduction Ŵ(O_K)→W(k), [π]↦0, so φ(E([π]))↦σ(E(0)), which is p times a unit; hence φ(E([π])) is not a unit of Ŵ(O_K), and a comparison that divides by it leaves Ŵ(O_K).

*Needs:* §2.4 (integral tensors on the filtration lattice); §0.10 (comparison with frobenius pullback); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25.


### 2.6 Integral tilde tensors and tensor frames

For the universal R_G-pair of a good embedding, the rational tensors s̃_a=φ*(s_a⊗1), viewed using j[1/p], are integral in M̃₁^⊗. Their tensor-isomorphism scheme `T=Isom_{s̃,s}(M̃₁,Λ⊗Ŵ(R_G))` is a trivial 𝒢-torsor, independent of the chosen cutting family. For Z_p coefficients the displayed φ* is harmless notation; for a nontrivial unramified coefficient ring it must remain. The result uses normality of R_G and the named pointwise integrality/flatness descent inputs. (KPZ26, §5.2.1, p.53; KPZ26 line 2317; KP18, Lemma 3.2.6, Lemma 3.2.9 and Corollary 3.2.11, pp.171–173; KP18 line 2170).

A proof can proceed as follows. At the special point use `M̃_{0,1}=gΛ_W` for g∈G(W[1/p]); g fixes the tensors, proving special-fibre integrality. At every DVR-valued point use the preceding lattice comparison. Apply FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27, `deJongBoundedFormalFunctions`, on Spf R_G with its maximal-ideal topology, as specialized in the supplier contract, to the universal rational polynomials in the ghost coordinates of a Witt vector divided by p; their integral values give coordinatewise p-divisibility in Ŵ(R_G), using its inverse-limit description (KP18 lines 2179–2184). Iterate this for the bounded denominators of the finite tensor family. Prove T is finitely presented by its finite tensor equations inside GL_h; Ŵ(R_G) is henselian local by its Artin-limit Zink construction. Choose a point x of its nonempty closed fibre. For every local point map Ŵ(R_G)→Ŵ(O_K), the pullback T is a trivial 𝒢-torsor. The henselian flattening functor at x is a finitely presented closed subscheme; its ideal vanishes under every point map, hence is zero by joint injectivity. Thus T is flat at x. The local ring O_(T,x) is faithfully flat over the local base and gives a point of T; the isomorphism 𝒢×T≅T×T then makes T a 𝒢-torsor by fpqc descent. Trivialize over the henselian local base with algebraically closed residue.

**Checks.**

- In R=O_K, f=p has f/p=1 in Ŵ(R); for f=1 the same putative division has first coefficient 1/p∉O_K and is rejected.
- In R=ℤ_p[[x]], s=x/p is analytic on the open unit disc but fails boundedness at x↦π in O_K with π²=p: with v_K(π)=1, v_K(π/p)=−1. Thus it is absent from both R and the bounded analytic functions; the point x↦0 alone would miss it. In contrast s=1 belongs to R and has norm one at every rigid point.
- For empty tensors T=GL_h is already flat, and its local flattening ideal is zero. The field map ℤ_p→ℚ_p is injective and makes Spec(ℤ_p/p) empty and flat, but is not a local map of pointed local schemes; it cannot be used as a flatness detector at the closed point.

*Needs:* §2.3 (completed orbit deformation ring); §2.5 (breuil–kisin to tilde lattice comparison); SchemeAndStackFoundations §§1.15 and 2.3; §0.10 (comparison with frobenius pullback); SchemeAndStackFoundations §§0.6 and 4.12; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`); gap:tensor-isomorphism-flatness-descent.


### 2.7 First-order tensor horizontality

Set a_G=m_G²+π_E R_G. For a 𝒢-invariant t∈Λ^⊗ let t̃=φ*(t⊗1) in the integral tilde tensor module. Call it horizontal at x if c(t̃₀⊗1)=t̃⊗1 over Ŵ(R_G/a_G), with c base-changed on both sides from the comparison modulo m_G²+pR_G. This first-order display condition is distinct from an unspecified integrable connection on all of Spec R_G. (KPZ26, §5.2.2, (5.2.2), pp.53–54; KPZ26 line 2330).

The API includes the following facts.

- Horizontality is precisely c(t̃₀)=t̃ in the indicated quotient.
- A compatible marked local-model map preserves horizontality.
- Horizontal tensors are closed under sums in a fixed degree, products, dual contractions and invariant linear operations.

**Checks.**

- The identity endomorphism is horizontal by functoriality of c.
- As a test of the transport equation on an ambient module, take A=k[ε]/ε², c=1+εE₂₁ and t₀=t=E₁₁ in End_A(A²). Then ct₀c⁻¹=t+εE₂₁≠t, although the tensors agree after reduction to k. This tests detection of first-order transport; it does not assert that these data form a good local-model tensor datum.
- Take k=F̄₃, Λ=ℤ₃², the diagonal torus cut out by the projector E₁₁ and μ_y(z)=diag(z,1). Its local model is a single point, so R_G=W(k), a_G=(3), Ŵ(R_G/a_G)=W(k) and c is the identity; the non-scalar invariant E₁₁ is horizontal. The matrix E₂₁ is not an admissible input: diag(2,1)·E₂₁·diag(1/2,1)=(1/2)E₂₁, and 1/2≡2≢1 modulo 3, so it is not torus-invariant and horizontality is not defined for it.

A proof can proceed as follows. Define the equality in the mixed tensor algebra of the tilde module; tensor transport includes inverse dual maps. Naturality follows from the canonical construction of c.

*Needs:* §2.6 (integral tilde tensors and tensor frames); §1.3 (canonical first-order comparison).


### 2.8 Dieudonné display with parahoric structure

In this node require 𝒢=𝒢° to be the connected parahoric, with Hoff’s local-model embedding hypotheses. For the local-model datum and a complete Noetherian local O_Ĕ-algebra R with residue k, a Dieudonné (𝒢,μ)-pair is a 𝒢-torsor P over Ŵ(R) and a 𝒢-equivariant map P_R→Mloc. Its associated normal pair has a canonical tilde 𝒢-torsor P̃, obtained by integral tensor extension, not by naively tensoring φ₁ on arbitrary mixed tensors. A Dieudonné (𝒢,μ)-display is (P,q,Ψ:P̃≅P), with Ψ a 𝒢-torsor isomorphism. Translate Hoff’s weights (0,−1) to the inverse cocharacter of our weight-(0,1) filtration convention. (Hoff23, Definitions 2.3 and 2.11, Proposition 2.6 and Remark 2.9, pp.17–20; Hoff23 line 796).

The API includes the following facts.

- Forget Ψ to obtain a 𝒢-pair and hence a normal pair.
- A faithful integral embedding gives the underlying Dieudonné display.
- Compatible complete local maps pull back P,q and Ψ, using the canonical tilde comparison.
- A compatible local-model group immersion induces a change-of-group functor on displays.

**Checks.**

- For 𝒢=GL_h and its Grassmannian, recover ordinary displays of type (h,d).
- For 𝒢=GL₂ and R=k[ε] with ε²=0, p·Ŵ(m_R)=0, because p=VF on W(R) and F raises coordinates to the p-th power, which kills every coordinate in kε; hence Ŵ(R)[1/p]=W(k)[1/p]. The torsor isomorphisms Ψ₀ and Ψ₀(1+[ε]E₂₁), with [ε]²=[ε²]=0, are distinct over Ŵ(R) but have the same rationalization. So Ψ is part of the data of the display and is not recovered from rational Frobenius.
- For an endomorphism-cut group, Ψ must commute with the induced endomorphisms of the pair and tilde pair.

A proof can proceed as follows. Construct the tilde torsor by the universal local-model pair and descent; use the DVR tensor extension plus flat normal input, then extend to torsion rings through suitable lifts. Show uniqueness and independence of the good embedding under the stated local-model compatibility. Arbitrary invariant higher tensors do not carry a direct φ₁ formula.

*Needs:* §2.6 (integral tilde tensors and tensor frames); §2.4 (integral tensors on the filtration lattice); §0.11 (contravariant dieudonné display); SchemeAndStackFoundations §§1.15 and 2.3.


### 2.9 Adapted p-divisible deformation

Fix a marked H₀/k with φ-invariant integral tensors in Fil⁰ and integral type (Λ,s_a), and a Hodge cocharacter μ_y from a local-model lift. For finite K/Ĕ, a marked lift H/O_K is (𝒢,μ_y)-adapted if the tensors lift to integral φ-invariant tensors of its Dieudonné display over Ŵ(O_K), admit a tensor-preserving integral frame lifting the marked residual one, and its generic Hodge filtration under the canonical rational section is induced by a G-valued cocharacter conjugate to μ_y. Keep the inverse convention when expressing this using the orbit local model `Mloc_{G,μ_y⁻¹}`. (KZ25, Definition 3.2.4, pp.22–23; KZ25 line 998; KP18, Proposition 3.2.17, pp.175–177 (antecedent integral tensors and filtration conditions); KP18 line 2279).

The API includes the following facts.

- An adapted lift supplies the integral φ-invariant tensors and marked frame.
- Its generic filtration lies in the specified G-conjugacy class.
- Finite extensions of K preserve adaptedness with the transported marking.
- Equivalent integral cutting families give the same property.

**Checks.**

- For empty tensors, adaptedness reduces to the usual prescribed height/dimension deformation type.
- Let H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p carry the diagonal-torus type cut out by E₁₁, with μ_y(z)=diag(z,1). A lift whose generic Hodge line is K(e₁+te₂) with t∈m_K nonzero is not adapted: E₁₁(e₁+te₂)=e₁∉K(e₁+te₂), so E₁₁ is not in Fil⁰ and the line is not induced by a torus cocharacter. The split lift, t=0, has E₁₁e₁=e₁∈Ke₁ and is adapted.
- For `μ_{p∞}`, Fil¹ is the whole rank-one module; changing μ_y to its inverse changes the local-model convention and must be recorded.

A proof can proceed as follows. Package the integral lift, frame and generic filtration condition together. Compare with the torsor and Breuil-PD versions via the named integral comparisons, rather than defining adaptedness to mean factorization through the desired quotient.

*Needs:* §2.1 (integral tensor and local-model datum); §1.4 (canonical rational witt section); §1.6 (the rational section preserves lifted tensors); §0.13 (displays and p-divisible groups).


### 2.10 Very good integral Hodge embedding

A supplied good integral Hodge embedding is very good at x if one scheme-theoretically cutting tensor family is horizontal there. Equivalently c is an isomorphism of the associated 𝒢-torsors over Ŵ(R_G/a_G). Say very good at all points when this holds for every geometric special-fibre x. Very-goodness at one point does not by itself give this all-points condition. The existence of integral tensor frames on each side does not by itself imply that c preserves them. (KPZ26, Definition 5.2.5, p.54; KPZ26 line 2345).

The API includes the following facts.

- A cutting family is horizontal iff c is a 𝒢-torsor isomorphism.
- A globally very-good embedding specializes to a very-good embedding at every x.
- A marked change of coordinates transports the condition and preserves its truth value.

**Checks.**

- For GL with empty cutting family, every good embedding is very good.
- Two integral 𝒢-torsors with a GL isomorphism not preserving a defining endomorphism fail the condition.
- For the diagonal torus on ℤ₃² cut out by E₁₁ with μ_y(z)=diag(z,1), c=id fixes E₁₁. The basis swap w transports the marking, cocharacter and tensor to w, diag(1,z) and E₂₂, and c=id fixes E₂₂, so the condition is preserved. Composing the marking with w while keeping the tensor E₁₁ on Λ is not a marked datum: the frame must carry the crystalline tensor E₁₁ to the Λ-tensor, and wE₁₁w⁻¹=E₂₂≠E₁₁, the two projectors differing on e₁.

A proof can proceed as follows. Use the tensor-isomorphism torsors to identify tensor preservation with reduction of the structure group. The independent-family theorem below makes this invariant under replacing the cutting family.

*Needs:* §2.7 (first-order tensor horizontality); §2.1 (integral tensor and local-model datum).


### 2.11 Independence of the defining tensors

If one cutting family for a good embedding is horizontal at x, then every 𝒢-invariant mixed tensor is horizontal there. Consequently all cutting families define the same very-good condition, and the tensor-frame torsor used in that condition is independent of the presentation. (KPZ26, Lemma 5.2.3, p.54; KPZ26 line 2341).

A proof can proceed as follows. A 𝒢-torsor isomorphism acts trivially on every invariant tensor in its associated mixed tensor bundles. This uses the scheme-theoretic stabilizer, not only pointwise group equality.

*Needs:* §2.10 (very good integral hodge embedding); §2.6 (integral tilde tensors and tensor frames).


### 2.12 Unramified coefficient detection

For a good Z_p embedding and O=W(F_q) a finite unramified extension, extend scalars and the reflex field to their compositum. The original embedding is very good at x if and only if its O-version is very good at the corresponding point. Use φ*(s⊗1) for the coefficient-twisted tilde tensors and faithfully flat descent of their equality. (KPZ26, §5.2.6–Lemma 5.2.7, p.54; KPZ26 line 2358).

A proof can proceed as follows. Compare the two completed local models after the reflex-ring base change, use strict base change of τ and the natural first-order c, then descend equality by faithful flatness. Do not identify the coefficient Frobenius with the identity.

*Needs:* §2.10 (very good integral hodge embedding); §0.9 (strict base change of tilde modules).


### 2.13 Very-good periodic lattice-chain embedding

For a periodic Z_p-lattice chain L in V, a determining segment has r≥1 lattices and total module `tot(L)=⊕_{i=1}^r Λ_i` in `V^{⊕r}`. A good embedding into GL(L) is very good at x when its diagonal representation on tot(L) is very good there. The group-scheme lattice-chain stabilizer and its transition maps are supplied by ReductiveGroupsPartII §RG2.3. A chain may be selfdual as an indexed chain without every individual lattice being selfdual. (KPZ26, §5.2.4, p.54; §6.1.1, p.62; KPZ26 line 2345).

The API includes the following facts.

- A segment gives the indicated finite direct sum and diagonal action.
- The chain condition is the total-representation condition.
- Changing the determining segment preserves very-goodness by the periodic lattice isomorphisms and isomorphic-sum criterion.

**Checks.**

- A one-step chain reduces to its single integral representation.
- Replacing Λ_i by the periodic copies pΛ_i yields an isomorphic segment representation and the same condition.
- A paired chain `Λ_i⊕Λ_{−i}^⊥` can be selfdual without Λ_i=Λ_i^⊥; requiring equality of every lattice is too strong.

A proof can proceed as follows. Use a determining segment to define the property. Segment independence is proved in §3.12, after the isomorphic-sum criterion.

*Needs:* ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §2.10 (very good integral hodge embedding).


### Examples

For the split height-two filtration the Eisenstein modification is 𝔖e₁⊕E(u)𝔖e₂. The tensor e₁⊗e₁∨ gives the corresponding idempotent. The identity tensor transports by c and c⁻¹ to itself, while E₁₁ transports by 1+εE₂₁ to E₁₁+εE₂₁. These values distinguish an invariant evaluation tensor from an arbitrary constant matrix.


### Dependencies

Layers 0–1; ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; PadicHodgeTheory §5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`); the scheme-local-model, purity and flatness supplier contracts.


## Layer 3: very-good criteria and existence theorems


### 3.1 Integral tensors along a formal curve

Let a:Spec k[[u]]→Mloc pass through x. In S=W(k)[[u]] form M_S=Λ⊗S and the inverse image `M_{S,1}` of the induced filtration modulo p. Then pM_S⊂`M_{S,1}`⊂M_S, `M_{S,1}` is finite free, and the invariant tensors in its rationalization lie in `M_{S,1}`^⊗. This is the p-frame curve lattice; it is not the Eisenstein modification for an arbitrary ramified O_K. (KPZ26, Lemma 5.3.13, pp.57–58; KPZ26 line 2514).

A proof can proceed as follows. Over W(K), K an algebraic closure of k((u)), the local-model lattice is gΛ with g∈G(W(K)[1/p]), so invariant tensors are integral there. In the common fraction object use W(k)[[u]][1/p]∩W(K)=W(k)[[u]] coefficientwise. Flatness of the quotient filtration proves the elementary-modification freeness.

*Needs:* §2.6 (integral tilde tensors and tensor frames); §0.3 (display frame); §2.1 (integral tensor and local-model datum).


### 3.2 Invariant endomorphisms are horizontal

For a good integral embedding, every 𝒢-fixed endomorphism t of Λ preserves the universal filtration pair and its induced tilde endomorphism is horizontal under c at each point. This is special to functorial endomorphisms; arbitrary higher tensors require the integral torsor argument. (KPZ26, Lemma 5.3.2, pp.54–55; KPZ26 line 2374).

A proof can proceed as follows. The generic cocharacter commutes with t, so t preserves the generic universal filtration. The flat local-model closure extends preservation integrally. Apply naturality of τ and c to the resulting pair endomorphism.

*Needs:* §2.7 (first-order tensor horizontality); §1.3 (canonical first-order comparison).


### 3.3 Curvewise horizontality of the canonical comparison

For a special-fibre tangent vector v at x that is the first jet of a k[[u]]-curve, the pullback of c to Ŵ(k[ε]/ε²) preserves the cutting tilde tensors. One does not assume every tangent vector individually lifts to a curve. The statement compares the canonical relative-frame c, not an arbitrary map satisfying its Frobenius square. (KPZ26, Proof of Proposition 5.3.11, (5.3.12)–(5.3.14), pp.56–60; KPZ26 line 2458).

A proof can proceed as follows. Compare the p-frame W(k)[[u]] with its dual-number p-frame and enlarged relative (p,ε)-frame, where φ(ε)=φ₁(ε)=0. The rational comparison preserves tensors; integrality and p-torsion-freeness give the integral equality. Strict maps to the Zink frames identify this with canonical c. Do not deduce integral equality in a torsion ring solely from rational equality.

*Needs:* §3.1 (integral tensors along a formal curve); §1.3 (canonical first-order comparison); §0.9 (strict base change of tilde modules).


### 3.4 Products preserve very-goodness

For groups 𝒢₁,…,𝒢_r with good embeddings on Λ₁,…,Λ_r, the product 𝒢₁×⋯×𝒢_r acting on Λ₁⊕⋯⊕Λ_r is good, and it is very good at (x₁,…,x_r) whenever the i-th embedding is very good at x_i for every i; in particular it is very good at all points when every factor is. Its local model is the product for the product cocharacter class. This concerns the product group, rather than the diagonal image of one group in two unrelated representations. (KPZ26, Lemma 5.3.9, p.56; KPZ26 line 2444).

A proof can proceed as follows. The product universal pair decomposes; τ and c respect this decomposition, so c=c₁⊕⋯⊕c_r. The summand idempotents are endomorphisms and are horizontal by §3.2, and the i-th cutting family is horizontal at (x₁,…,x_r) exactly when it is horizontal at x_i (KPZ26, proof of Lemma 5.3.9; KPZ26 lines 2449–2453).

**Checks.**

- For 𝒢₁=𝒢₂=G_m on ℤ₃ with weight one, the product G_m² on ℤ₃² has a one-point local model, c=1⊕1, and is very good at its unique point.
- For r=1 the statement is the hypothesis on the single factor.
- The diagonal G_m acting on ℤ₃⊕ℤ₃ is not the product group; it is reached from the product by §3.8, as in §3.10.

*Needs:* §2.10 (very good integral hodge embedding); §2.6 (integral tilde tensors and tensor frames); §3.2 (invariant endomorphisms are horizontal).


### 3.5 Very-goodness for the generic neutral closure

Let 𝒢 be smooth affine of finite type over Z_p, with reductive generic neutral group G°. Assume its schematic closure 𝒢⁰ in 𝒢 is a smooth stabilizer scheme, μ is minuscule on G°, and the induced 𝒢⁰ embedding is good over its reflex base E°; μ factors through G° because G_m is connected. If the canonical c on this local model preserves a family cutting out 𝒢, the induced 𝒢⁰ embedding is very good. 𝒢⁰ denotes this smooth schematic closure, not an unproved equality with the fibrewise identity component. (KPZ26, §5.3.19–Proposition 5.3.20, pp.61–62; KPZ26 lines 2663–2672).

A proof can proceed as follows. Induce the relevant tensor torsors from 𝒢⁰ to 𝒢 and compare them over the 𝒢⁰ local model after the reflex-field extension. Over the square-zero Zink kernel, smoothness and equality of generic dimensions identify the two congruence kernels. The comparison point therefore lies in 𝒢⁰.

The reflex field E° of the G°-conjugacy class of μ contains the reflex field E of its G-conjugacy class. Smoothness of the schematic closure 𝒢⁰ is a hypothesis; it does not follow from connectedness of G°.

*Needs:* §2.10 (very good integral hodge embedding); §2.6 (integral tilde tensors and tensor frames); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27 (`deJongBoundedFormalFunctions`); gap:tensor-isomorphism-flatness-descent.


### 3.6 Very-goodness descends to a summand

Let Λ=Λ₁⊕Λ₂ with compatible local-model representations, with the representation on Λ₁ good. If the diagonal representation on Λ is good and very good at x, then the good representation on Λ₁ is very good at x. The projection idempotent and inclusions define pair maps, so c restricts to the first tilde summand. (KPZ26, Lemma 5.3.7(a), p.55; KPZ26 line 2407).

A proof can proceed as follows. Compare the local-model filtrations under direct sum, then use the idempotent to split τ and c. Tensor-family independence tests the induced first-summand tensors.

*Needs:* §2.10 (very good integral hodge embedding); §3.2 (invariant endomorphisms are horizontal).


### 3.7 Curve-spanned tangent criterion

If a good embedding’s special-fibre tangent space at x is spanned by images of tangent spaces of maps Spec k[[u]]→Mloc through x, the embedding is very good at x. In particular a smooth special-fibre point is very good. The hypothesis is linear spanning by curve directions, not that every tangent direction has a prescribed simultaneous formal lift. (KPZ26, Proposition 5.3.11 and Corollary 5.3.16, pp.56–60; KPZ26 line 2458).

A proof can proceed as follows. The curve directions inject the cotangent m/(m²,π_E) into the product of their one-dimensional jet quotients. Zink logarithmic coordinates on a square-zero p-killed ideal are the direct sum of that ideal, so these jets detect the difference c(s̃₀)−s̃. Apply the previous curvewise lemma. Use the supplied smooth-point formal coordinates for the corollary.

*Needs:* §3.3 (curvewise horizontality of the canonical comparison); §2.10 (very good integral hodge embedding).


### 3.8 Endomorphism and centralizer criterion

A good embedding cut out scheme-theoretically by endomorphisms is very good at every point. More generally, if 𝒢⊂𝒢′⊂GL(Λ), the composite and 𝒢′ embeddings are good, and 𝒢 is the intersection of 𝒢′ with the centralizers of specified endomorphisms, very-goodness of 𝒢′ at the image of x implies very-goodness of 𝒢 at x. (KPZ26, Corollaries 5.3.3–5.3.4, p.55; KPZ26 line 2386).

A proof can proceed as follows. Use the preceding lemma for the new endomorphism equations; the old equations are preserved by the very-good 𝒢′ comparison. Their union cuts out the scheme-theoretic intersection.

Require both good local-model immersions and scheme-theoretic intersection; group equality on Q_p-points is insufficient.

*Needs:* §3.2 (invariant endomorphisms are horizontal); §2.11 (independence of the defining tensors).


### 3.9 Arithmetic-curve criterion

A good embedding is very good at x if its mod-π_E tangent space is spanned by the tangent images of maps Spec O_K→Mloc through x, with K/Ĕ finite. Each source tangent is taken modulo its induced O_Ĕ structure. This arithmetic variant uses the height-one Breuil–Kisin lattice comparison, whose frame map is nonstrict; strict-frame base change alone cannot prove it. (KPZ26, §5.3.17–Proposition 5.3.18, pp.60–61; KPZ26 line 2643).

A proof can proceed as follows. Repeat cotangent detection for the arithmetic-curve jets. Compare the Eisenstein-frame modification with the p-frame after its explicit divided-Frobenius scaling, then use integral tensor preservation. Keep the nonstrict scaling as part of the comparison rather than invoking §0.9. This is a separate proof from the smooth formal-curve criterion.

*Needs:* §3.7 (curve-spanned tangent criterion); §2.5 (breuil–kisin to tilde lattice comparison); §1.3 (canonical first-order comparison).


### 3.10 Isomorphic copies preserve very-goodness

If Λ₁≅Λ₂ intertwines the integral group action and local-model cocharacter types, and the first good representation is very good at x, then so is the second and their diagonal sum. More generally, let n≥1 and let Λ₁,…,Λ_n be representations of 𝒢 with isomorphisms h_i:Λ₁≅Λ_i (h₁ the identity), each intertwining the group action and the local-model cocharacter types; if Λ₁ is good and very good at x, the diagonal sum Λ₁⊕⋯⊕Λ_n is good and very good at x. The hypothesis n≥1 is needed: the empty sum is the zero representation, which is not faithful. This theorem makes no assertion for the diagonal sum of two unrelated very-good representations of the same group. (KPZ26, Lemma 5.3.7(b) and Remark 5.3.8, pp.55–56; KPZ26 lines 2412 and 2439).

**Checks.**

- For p=3, 𝒢=G_m and Λ=ℤ₃ with its weight-one action, zero copies give Λ⁰=0 and GL(0)={1}: the units 1 and −1 of ℤ₃ have the same image, the kernel is G_m, and the map is not a closed immersion. A statement allowing n=0 is false here.
- In the same example n=1 gives a↦a and n=2 gives a↦diag(a,a), both with trivial kernel. With h₂ the identity, diag(a,b) commutes with the endomorphism carrying the first block to the second iff a=b, so the intertwiner equation cuts the diagonal G_m out of G_m×G_m.
- The weight-one and weight-(−1) actions of G_m on ℤ₃ admit no intertwining isomorphism, since a≠a⁻¹ for a=2; their diagonal sum a↦diag(a,a⁻¹) is not covered by this theorem.

A proof can proceed as follows. Transfer tensors across the intertwiners. For n≥1 the product 𝒢ⁿ on Λ₁⊕⋯⊕Λ_n, with the product cocharacter type, is good and very good at (x,…,x) by the product criterion, and the diagonal map of local models is a closed immersion into the product of Grassmannians, hence into Gr(nd,Λ₁⊕⋯⊕Λ_n). The diagonal 𝒢 is the scheme-theoretic intersection of 𝒢ⁿ with the centralizers of the n−1 endomorphisms carrying the first block to the i-th by h_i: an element (g₁,…,g_n) commutes with such an endomorphism iff ρ_i(g_i)h_i=h_iρ₁(g₁), iff g_i=g₁. Apply the centralizer criterion. For n=2 this is KPZ26 Lemma 5.3.7(b).

*Needs:* §2.10 (very good integral hodge embedding); §3.4 (products preserve very-goodness); §3.8 (endomorphism and centralizer criterion).


### 3.11 Standard wild type-A representations

For K/Q_p finite, a central division K-algebra D and m≥1, put G=`Res_{K/Q_p}GL_m(D)`, with standard representation on D^m or its specified opposite-dual representation. Every building point has a right-O_D periodic chain realizing its fixer; for the weight-(0,1) Hodge cocharacter types of this standard representation, the resulting good integral embedding is very good at all points. This includes p|ind(D) for these representations and does not cover arbitrary central quotients or other fundamental-weight representations. (KPZ26, §6.3.1–Proposition 6.3.2 and Remark 6.3.3, pp.70–71; good-embedding input Theorem 3.3.25, p.26; KPZ26 line 3097).

A proof can proceed as follows. Import the O_D-chain stabilizer from ReductiveGroupsPartII §RG2.2.4 (*division-algebra-building*) and the stated good local-model immersion from gap:scheme-local-model-hodge-immersion. The standard integral group is cut out by the right-O_D endomorphisms, so apply the endomorphism criterion. The opposite action is the contragredient action, with its matching cocharacter sign.

*Needs:* ReductiveGroupsPartII §RG2.2.4 (*division-algebra-building*); §3.8 (endomorphism and centralizer criterion); gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion.


### 3.12 Independence of the determining segment

Very-goodness of a periodic chain embedding is independent of its determining segment. Adding complete periodic repeats only adds isomorphic representations; removing them uses summand descent. Shifting the segment uses the periodicity isomorphisms of its lattices. All comparisons retain the chain’s transition maps and the induced local-model good embedding. (KPZ26, §5.2.4 and Lemma 5.3.7, pp.54–56; KPZ26 lines 2345 and 2412).

A proof can proceed as follows. Place two determining segments in a common finite repeated segment. Use the periodic lattice scaling isomorphisms, then the two established very-goodness criteria. This supplies the segment API promised in Layer 2.

*Needs:* §2.13 (very-good periodic lattice-chain embedding); §3.10 (isomorphic copies preserve very-goodness); §3.6 (very-goodness descends to a summand).


### 3.13 Very-good chains in the nonexceptional cases

Let (G,{μ},𝒢) satisfy p>2, local abelian type, and essentially tame classical adjoint factors, excluding triality. Assume (NE): no Dᴴ factor and no type-A adjoint factor `Res_{F/Q_p}PGL_m(D)` with p dividing ind(D). Let 𝒢 be the stabilizer of a point generic in its facet, let the centralizer of a maximal Q̆_p-split torus be R-smooth, and let p∤|π₁(Gder)|. Suppose `G⊂G′=∏Res_{F_i/Q_p}H_i` with equal derived groups, each H_i tamely split over F_i, and faithful minuscule representations ρ_i whose total ρ′ and restriction ρ are Hodge embeddings. There is a periodic Z_p-chain L in V such that the extension to GL(L), equivalently `ρ^{⊕r}` on tot(L), is good and very good at every local-model point. (KPZ26, Standard assumptions 3.1.5, p.16; Theorem 6.1.1, pp.62–65; KPZ26 line 2710).

A proof can proceed as follows. Import the tame hyperspecial realization, fixed-point models, lattice-chain stabilizers and total-lattice direct-summand statements supplied by ReductiveGroupsPartII §RG2.3.5. Use the supplied local-model adjoint/restriction comparison and curve-spanned tangent theorem for the split classical model to get very-goodness of the ambient restriction-of-scalars embedding. Cut G out by endomorphisms; use summand descent and unramified detection to obtain the required total representation. The tangent inputs are gap:schubert-curve-spanned-tangents and gap:local-model-curve-spanned-tangents.

Retain the Q̆_p-split-torus R-smoothness hypothesis and every representation condition; do not assert this for all wild type-A central quotients.

*Needs:* ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §3.7 (curve-spanned tangent criterion); §3.8 (endomorphism and centralizer criterion); §3.6 (very-goodness descends to a summand); §2.12 (unramified coefficient detection); §3.12 (independence of the determining segment); gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion; gap:schubert-curve-spanned-tangents; gap:local-model-curve-spanned-tangents.


### 3.14 Very-good Dᴴ PEL representations

For the Dᴴ case n≥4 over K/Q_p, use `G=Res_{K/Q_p}GO⁺(V,h)`, or `G=Res_{K/ℚ_p}GU⁺(T,φ)` with anti-Hermitian φ. In the orthogonal case let dim_K V=2n and let V₀ be a nonzero even-dimensional K-space with perfect alternating form S₀, using ψ(v₀⊗v,w₀⊗w)=S₀(v₀,w₀)h(v,w). In the quaternionic case let T be a left D-module of rank n with a nondegenerate anti-Hermitian form and let T₀ be a nonzero finite free right D-module with nondegenerate Hermitian form φ₀, using the alternating form ψ(t₀⊗t,t₀′⊗t′)=Trd_D/K(φ₀(t₀′,t₀)φ(t,t′)). For these PEL representations, a fixer at a point generic in its facet admits a periodic selfdual chain giving a very-good integral embedding at every point. Require Dᴴ Hodge type: on each absolute simple factor the adjoint cocharacter is trivial or of one of the two spin-node types, and the displayed representation is a local Hodge embedding. Use the trace/different form after restriction of scalars. (KPZ26, §6.2.1–Theorem 6.2.3, pp.67–69; KPZ26 line 2999).

**Checks.**

- In the division quaternion algebra over ℚ₃ with i²=−1 and j²=3, set φ(t,t′)=ti t̄′ and φ₀(x,y)=x̄y. The balanced presentations i⊗1 and 1⊗i, paired with 1⊗1, both give reduced trace −2. Reversing the φ₀ arguments gives +2 and −2, so that expression does not descend to the tensor product.
- For V₀=K² with S₀(e₁,e₂)=1 and h(v,w)=1, the split pairing gives ψ(e₁⊗v,e₂⊗w)=1 and the reverse −1.
- Zero multiplicity gives the zero representation, which is not a faithful Hodge embedding of these nontrivial groups; nonzero PEL multiplicity is a hypothesis.

A proof can proceed as follows. Import ReductiveGroupsPartII §RG2.3.5’s GO⁺ lattice rescaling, Γ-stable selfdual lattice and quaternionic Morita/hermitian-basis reductions. Reduce repeated copies by the isomorphic-sum and summand criteria. The ambient restriction-of-scalars GSp embedding is very good by the nonexceptional theorem applied to GSp. Cut out GO by its endomorphism equations inside GSp, then pass to the smooth generic-neutral GO⁺ closure. Apply the fixed-point, total-lattice summand and unramified descent argument as in Theorem6.2.3. These are display consequences of the imported algebraic lattices.

The RG supplier owns the algebraic lattice theorem. Verify connected-closure and pairing assumptions before invoking §3.5.

*Needs:* ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §3.5 (very-goodness for the generic neutral closure); §3.8 (endomorphism and centralizer criterion); §2.12 (unramified coefficient detection); §3.13 (very-good chains in the nonexceptional cases); §3.10 (isomorphic copies preserve very-goodness); §3.6 (very-goodness descends to a summand); gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion; gap:full-fixer-cutting-tensors.


### 3.15 Symplectic type-A central enlargement

Let V=D^m and V̄=(Dopp)^m be the paired standard and opposite-dual modules. On W=V⊕V̄ use the alternating trace form ψ(x,y)=Σ_i Trd_(D×Dopp)/K(ξτ(x_i)y_i), where τ interchanges the two factors, ξ=(a,−a) and a∈K×; use Tr_(K/ℚ_p)(δ_K⁻¹ψ) for the ℚ_p-pairing, with δ_K generating the different. For the group G₁ generated by diagonal GL_m(D) and the two scalar factors, its representation and any s≥1 isomorphic copies have periodic selfdual chains with very-good embeddings. The paired chain has terms `Λ_i⊕(Λ_{−i})^⊥`; an arbitrary term Λ_i⊕Λ_i^⊥ need not form the required indexed selfdual chain. (KPZ26, §6.3.4–Corollary 6.3.5, p.71; KPZ26 line 3133).

The API includes the following facts.

- The formula defines a nondegenerate alternating K-form on V⊕V̄, and its trace/different form is a nondegenerate ℚ_p-form.
- Prove G₁=(G×G)∩GSp(W,ψ), as subgroup schemes, for the two standard/opposite actions.
- For an increasing indexed periodic chain (Λ_i) in V, define Λ_i^♯ in V̄ by integral cross-pairing. The terms Λ_i⊕Λ_(−i)^♯ form an increasing periodic chain and their ψ-duals have index −i.

**Checks.**

- For D=K, m=1 and ξ=(1,−1), ψ((v,f),(w,g))=fw−vg. Thus ψ((1,0),(0,1))=−1 and the reverse is 1.
- For Λ_i=p⁻ⁱℤ_pe, Λ_i^♯=p^iℤ_pf. The correctly indexed pair is p⁻ⁱ(ℤ_pe⊕ℤ_pf), whose dual is its term of index −i. The same-index pairs at i=0,1 are ℤ_p² and p⁻¹ℤ_pe⊕pℤ_pf; neither contains the other.
- For D=K and m=2, (1,diag(1,2)) lies in GL₂×GL₂ but has cross-pairing multipliers 1 and 2, hence is excluded by the GSp intersection, including at p=3.

A proof can proceed as follows. Construct the form, its cross-dual lattices and the indexed paired chain directly from the supplied O_D-chain and trace duality (KPZ26, §6.3.4 and proof of Corollary 6.3.5, p.71; KPZ26 lines 3115–3145). The two standard representations give a very-good product embedding by A-standard and the product criterion. Check G₁=(G×G)∩GSp scheme-theoretically. The ambient GSp embedding is very good by the nonexceptional theorem applied to GSp. The union of the product and GSp cutting families is horizontal and defines this intersection. Apply isomorphic sums for s copies. Endomorphism equations alone do not impose the alternating similitude condition.

*Needs:* §3.11 (standard wild type-a representations); §3.10 (isomorphic copies preserve very-goodness); §3.8 (endomorphism and centralizer criterion); ReductiveGroupsPartII §§RG2.2.4 and RG2.3.5; §3.4 (products preserve very-goodness); §3.13 (very-good chains in the nonexceptional cases); gap:full-fixer-cutting-tensors.


### 3.16 Very-good chains with a perfect pairing

In the nonexceptional setting suppose the H_i representations have perfect alternating F_i-pairings ψ_i and ρ(G) lies in the symplectic similitude group for `ψ=Σ_i Tr_{F_i/Q_p}(δ_i⁻¹ψ_i)`, where δ_i generates the different. The chain L can be chosen so that L, its ψ-dual L∨, and the specified paired chain L⊕L∨ have very-good total representations; the paired chain is selfdual with its required indexing. This is a theorem about this controlled dual construction, not a general rule for arbitrary sums of two good representations. (KPZ26, Theorem 6.1.9 and its proof, pp.66–67; KPZ26 line 2900).

**Checks.**

- With no field extension and δ=1, the dual of O_K e⊕O_K f for ψ(e,f)=1 is the same lattice; the different formula reduces to ordinary duality.
- For the tame quadratic L=ℚ_p(π), π²=p, p>2, δ=2π and ψ(e,f)=1, take M=πO_L e⊕O_L f. Then M^Γ=pℤ_pe⊕ℤ_pf has dual ℤ_pe⊕p⁻¹ℤ_pf. The O_L-dual M^♯ is O_L e⊕π⁻¹O_L f, and (δ⁻¹M^♯)^Γ has exactly the same two summands. Omitting δ⁻¹ gives ℤ_pe⊕ℤ_pf and fails.
- At Λ_i=p⁻ⁱℤ_p² the pairing dual is Λ_(−i); increasing both members of a pair by the same inverse-index rule preserves inclusion, whereas pairing Λ_i with Λ_i^∨ reverses its second inclusion.

A proof can proceed as follows. Starting from the Γ-stable hyperspecial lattices, prove the required tame descent duality: for a finite tame Galois extension L/K, a Γ-stable O_L-lattice M in a semilinear space with a descended nondegenerate K-pairing, (M^Γ)^∨=(δ_(L/K)⁻¹M^♯)^Γ, where ♯ is the O_L-pairing dual and ∨ the O_K-pairing dual. Use trace duality and the integral averaging map, available because the ramification index is prime to p, after separating the unramified part. Construct the paired ambient lattices using this equality (KPZ26, proof of Theorem 6.1.9, p.66; KPZ26 lines 2909–2916). Apply very-goodness to the paired ambient construction, then descend to the required summands. Keep the trace/different normalization and the chain duality indexing.

A lattice dual here is with respect to ψ; it is not the abstract linear-module dual without the pairing identification.

*Needs:* §3.13 (very-good chains in the nonexceptional cases); §3.10 (isomorphic copies preserve very-goodness); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5.


### 3.17 Dᴴ central enlargement with very-good chains

In the orthogonal case use V₀=K² and let K××K× scale its two coordinate lines separately; in the quaternionic case use T₀=D, choose an unramified quadratic L/K embedded in D, and let L× act on the left of T₀. Let G₁′ be the subgroup generated by GO⁺ or GU⁺ and these scalar actions and let σ₁ be its tautological representation. With G₁=Res_K/ℚp G₁′ and with weight-zero and weight-one spaces of equal dimensions, every s≥1 copies of σ₁ at a generic-facet fixer admit a periodic selfdual chain with very-good integral embedding. Construct this algebraic enlargement as well as its chain; the balanced scalar weights are hypotheses on the Hodge type; do not replace it by an arbitrary central extension of a Dᴴ group. (KPZ26, §6.2.8–Corollary 6.2.10, pp.69–70; KPZ26 line 3058).

The API includes the following facts.

- In the split orthogonal case, the map GO⁺(V,h)×G_m²→GL(V⊕V) sends (g,a,b) to diag(ag,bg); its scheme image is G₁′.
- In the quaternionic case left multiplication by L× on D commutes with its right D-action, hence defines the stated action on D⊗_D T.
- After the unramified quadratic splitting and Morita identification, the quaternionic enlargement becomes the orthogonal one; on selfdual split lattices its integral model is (GO⁺×GO⁺)∩GSp for the cross alternating pairing.

**Checks.**

- In the split case diag(a·1,b·1) has alternating similitude factor ab; a≠b is allowed and is absent from the diagonal copy of GO⁺.
- For h the standard split form on K²ⁿ, the pair (1,g) with g noncentral in SO(h) belongs to GO⁺×GO⁺, but h(v,gw) is not a scalar multiple of h(v,w), so it fails the GSp intersection.
- For l∈L×, l(xd)=(lx)d on T₀=D, so the action is balanced on D⊗_D T; right multiplication by a noncentral l would not commute with every right d-action.

A proof can proceed as follows. Build the two scalar actions and the generated groups as in KPZ26 §6.2.8, pp.69–70 (KPZ26 lines 3040–3051); after splitting use the supplied classical selfdual lattices from ReductiveGroupsPartII §RG2.3.5 and prove the displayed scheme intersection. From D-PEL and summand descent obtain the very-good single GO⁺ representation, then use the product criterion for GO⁺×GO⁺. Its scheme-theoretic intersection with the ambient GSp is the required enlarged group. The GSp embedding is very good by the nonexceptional theorem applied to GSp. The union of the two cutting tensor families is horizontal and cuts out the intersection. Descend as in D-PEL and use isomorphic sums for s copies; keep the balanced Hodge weights.

*Needs:* §3.14 (very-good dᴴ pel representations); §3.10 (isomorphic copies preserve very-goodness); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §3.4 (products preserve very-goodness); §3.6 (very-goodness descends to a summand); §3.13 (very-good chains in the nonexceptional cases); gap:full-fixer-cutting-tensors.


### Examples

For the nodal special fibre xy=0, the two coordinate curves have derivatives e₁ and e₂ and span its two-dimensional tangent space, although no curve has derivative e₁+e₂. The centralizer of E₁₁ in GL₂ is the diagonal torus; the first-order matrix 1+εE₂₁ fails its defining equation by εE₂₁.


### Dependencies

Layers 0–2; ReductiveGroupsPartII §RG2.3.5; gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion; gap:schubert-curve-spanned-tangents; gap:local-model-curve-spanned-tangents.


## Layer 4: adapted deformations and integral recognition


### 4.1 Exactness of the integral functor on the punctured disc

For the imported crystalline-lattice functor T↦𝔐(T) over 𝔖, restriction to `U=Spec𝔖\{(p,u)}` is an exact faithful tensor functor on finite free integral representations in its stated range. Its rational and integral specialization maps are those of the base roadmap. Do not promote this assertion to exactness on all of Spec𝔖 for arbitrary crystalline lattices. (KP18, Theorem 3.3.2 and its opening discussion, pp.177–178; KP18 line 2359).

A proof can proceed as follows. Use the imported fully faithful tensor functor and the exactness theorem on the punctured spectrum, checked after its height-one localizations. Record the exact structure needed by the Tannakian torsor construction rather than assuming whole-ring exactness.

A nonexact sequence at the closed point is not ruled out by this export; each specialization agrees with the imported functor.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; SchemeAndStackFoundations §§1.15 and 2.3.


### 4.2 The crystalline Galois image has trivial Kottwitz invariant

Let k be algebraically closed, K/W(k)[1/p] finite, and L a crystalline lattice with Γ_K-invariant tensors cutting out a smooth integral group 𝒢 with connected reductive generic G. The associated representation Γ_K→𝒢(Z_p)⊂G(Q_p) has image in ker κ_G, for the Kottwitz homomorphism over the completed maximal unramified field. If moreover 𝒢=𝒢_z is the Bruhat–Tits stabilizer of a point z of B(G,ℚ_p), then 𝒢°(Z̆_p)=𝒢(Z̆_p)∩ker κ_G places the image in 𝒢°(Z_p). Without the stabilizer hypothesis this second conclusion fails. Let 𝒢 be the dilatation of GL₂/ℤ_p along the special-fibre subgroup H={diag(a,b): a^(p−1)=b^(p−1)}, whose identity component is the scalars and whose component group is μ_(p−1). The dilatation is not a closed subgroup of GL₂ over ℤ_p, but it is a closed subgroup of GL(Λ′) for a Γ_K-stable lattice Λ′ in a tensor construction of V=ℚ_p⊕ℚ_p(1); being flat with reductive generic fibre, it is the full fixer of a finite tensor family there (the fixer lemma invoked in KP18, §4.1.7, p.184; KP18 line 2582). The image diag(1,χ_cyc) of Γ_K has determinant in ℤ_p^×, so κ_G vanishes on it, but its reduction diag(1,ζ) with ζ^(p−1)=1, ζ≠1, lies outside the identity component. (KP18, §3.3.3–Proposition 3.3.4 and proof of Corollary 3.3.6, pp.178–180; KP18 lines 2398 and 2430).

A proof can proceed as follows. Use functoriality of κ_G and the crystalline representation’s tensor module to reduce the character/cocharacter obstruction. For 𝒢=𝒢_z apply the fixer characterization of ReductiveGroupsPartII §RG2.3.3 (*parahoric-kottwitz-characterization*), 𝒢°_z(Z̆_p)=Fix(z)∩ker κ_G, to deduce the connected-parahoric image. This is where disconnected integral fixers require extra bookkeeping.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16; ReductiveGroupsPartII §RG2.1.5; ReductiveGroupsPartII §RG2.3.3.


### 4.3 Tensor frames for crystalline lattices

For a crystalline Γ_K-lattice L and invariant cutting tensors with smooth full fixer 𝒢 and connected reductive generic G, suppose the image lies in 𝒢°(Z_p) and H¹(U,𝒢°)=1 for `U=Spec𝔖\{(p,u)}`. Then 𝔐(L) has an integral tensor-preserving frame L⊗𝔖≅𝔐(L). Modern parahoric purity supplies the vanishing for the connected parahoric in its coefficient-ring range; the tame/no-E₈ conditions of KP18 Corollary3.3.6 are a valid older sufficient case, not hypotheses silently needed in KZ25. (KP18, Lemma 3.3.5 and Corollary 3.3.6, pp.179–180; KP18 line 2404; KZ25, Proposition 3.3.2, p.25; KZ25 line 1083; Anschuetz22, Proposition 10.3, p.33; Anschuetz22 line 1388).

A proof can proceed as follows. Apply the Dedekind-base integral Tannakian torsor theorem to the exact faithful tensor functor on U, using finite-rank stable pieces of the group coordinate algebra. Kill its connected-parahoric torsor by the stated H¹ vanishing, then extend the tensor frame through the puncture by Hartogs for finite free modules. Tannakian representability and purity have separate exact supplier contracts.

*Needs:* §4.1 (exactness of the integral functor on the punctured disc); §4.2 (the crystalline galois image has trivial kottwitz invariant); SchemeAndStackFoundations §§1.15 and 2.3; ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; SchemeAndStackFoundations §0.6; VectorBundlesAndIsocrystals Layer 6, “Integral group torsors and Frobenius”; gap:parahoric-disc-purity.


### 4.4 Integral crystalline and Witt tensor comparison

Let H/O_K be p-divisible, L=Hom_Zp(T_pH,Z_p)=T_p(H*)⊗Z_p(−1), and let Γ_K-invariant tensors in L^⊗ have the specified smooth full-fixer type with connected reductive generic fibre. Under the tensor-frame hypotheses just stated, their crystalline comparison images lie in D(H₀)(W)^⊗, lift canonically to φ-invariant tensors in D̂(H)(Ŵ(O_K))^⊗, and lie in Fil⁰ after evaluation to O_K. A tensor-preserving integral frame identifies D̂(H) with L⊗Ŵ(O_K) and its reduction with L⊗W. The word dual always means the linear dual L here. (KZ25, Proposition 3.3.2(1), p.25; KZ25 line 1083; KP18, Proposition 3.3.8, p.180; KP18 line 2439).

A proof can proceed as follows. Apply the imported Breuil–Kisin functor to tensor maps from the unit, use its integral tensor frame and the φ-pullback/Witt comparison. Full faithfulness and the de Rham specialization give φ-invariance and Fil⁰. Reduce to W and compare to the canonical rational section.

**Checks.**

- For H=`μ_{p∞}`, L=Hom(ℤ_p(1),ℤ_p)=ℤ_p(−1); the twist −1 multiplies crystalline Frobenius by p, matching D(`μ_{p∞}`) with F=pσ. Using T_p(H*)=ℤ_p without the twist gives Frobenius 1, the étale normalization.
- For H=ℚ_p/ℤ_p, L=ℤ_p with trivial action and Frobenius 1, matching F=σ.

*Needs:* §4.3 (tensor frames for crystalline lattices); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; §1.6 (the rational section preserves lifted tensors).


### 4.5 Tensor Hodge filtrations and residual lifts

In the integral crystalline-tensor setting over O_K, the generic Hodge filtration is induced by a cocharacter of G_K. There is a representative μ_y defined over K whose induced filtration on D(H₀)⊗K extends to an integral direct-summand filtration on D(H₀)⊗O_K lifting the special Hodge filtration, and the canonical generic filtration is G(K)-conjugate to that representative. Its geometric conjugacy class has a reflex field E/K₀ contained in a field of definition; μ_y need not be defined over K₀=W(k)[1/p]. No integral G(O_K)-conjugacy of the canonical generic filtration is asserted. (KZ25, Proposition 3.3.2(2), p.25; KZ25 line 1088; KP18, Corollary 3.3.10, pp.180–181 and §3.2.5 footnote 4, pp.170–171; KP18 line 2461).

A proof can proceed as follows. Split the filtered fibre functor on the tensor category generated by the representation over K. An integral tensor frame lifting the identity on the special fibre transports the actual Hodge direct summand to D(H₀)⊗O_K. The rational comparison differs from that frame by G(K), giving the stated conjugacy. The splitting cocharacter of `G_{K₀}` is defined over K; its conjugacy class may have a ramified reflex field.

Export both the generic conjugacy and the integral residual-filtration lift; neither is shorthand for the other.

*Needs:* §4.4 (integral crystalline and witt tensor comparison); §2.1 (integral tensor and local-model datum); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.17–R07.4.21.


### 4.6 A tensor-preserving first-order rigid section

Assume the tensor datum’s local-model acceptability and good-embedding conditions, and very-goodness at x. There is a section Ψ_G:M̃₁≅M of the tensor-frame torsor on Ŵ(R_G) with Ψ̄_Gc=Ψ₀ over Ŵ(R_G/a_G). It extends to a GL section Ψ_E over R_E with the same first-order condition. Its R_G-restriction preserves every invariant tensor. The choices of lifts are not asserted to be canonical. (KZ25, §§3.2.5–3.2.6, pp.23–24, especially the proof of Proposition 3.2.7, p.24; KZ25 lines 1055–1063; KP18, §3.2.12, pp.173–174 (requires the correction in KPZ26 §5.2 and §7.1.4(1), p.73); KP18 line 2189).

The API includes the following facts.

- Produce Ψ_G with a recorded first-order value.
- Produce Ψ_E reducing to Ψ_G and satisfying the same c-equation.
- The chosen Ψ_G carries all invariant tilde tensors to their constant tensors.

**Checks.**

- Without tensor compatibility of c the prescribed reduced section need not lie in the 𝒢-torsor.
- For empty tensors this is the ordinary first-order rigid GL lift.
- Two allowable lifts may differ by a 𝒢 congruence element; the construction is existence with specified reduction, not uniqueness.

A proof can proceed as follows. Very-goodness makes Ψ₀c⁻¹ a point of the reduced 𝒢-torsor. Smoothness and complete-local lifting extend it to Ψ_G. Extend across the ambient closed immersion using the GL torsor, respecting its prescribed first-order reduction.

*Needs:* §2.10 (very good integral hodge embedding); §2.6 (integral tilde tensors and tensor frames); §1.5 (constancy of a display to first order); SchemeAndStackFoundations §§1.15 and 2.3; SchemeAndStackFoundations §4.1.


### 4.7 Hoff’s infinitesimal compatibility condition

For the same good integral embedding, identify the underlying module comparison of Hoff Lemma1.21 over Ŵ(R_G/a_G) with the canonical c used here, after inverting the cocharacter sign convention. Hoff Assumption2.28 is exactly the assertion that this comparison preserves the 𝒢 structures. Under the integral tensor-torsor identification, it is equivalent to very-goodness at x. It is an explicit condition on the embedding, not a consequence of naming a G-display. (Hoff23, Assumption 2.28 and Remark 2.29, pp.24–25; Hoff23 line 1192; KPZ26, Definition 5.2.5, p.54; KPZ26 line 2347).

A proof can proceed as follows. Compare both maps through the relative-frame construction, including their first-order quotient and marked module trivialization. Use tensor-family independence to translate compatibility with the structure group into the cutting tensor equations.

*Needs:* §2.8 (dieudonné display with parahoric structure); §2.10 (very good integral hodge embedding); §1.3 (canonical first-order comparison).


### 4.8 Tangent lifting at a DVR point

For the chosen universal ambient marked deformation over R_E and a continuous local point ξ:R_E→O_K, lifts ξ_ε:R_E→O_K[ε]/ε² are in bijection with marked deformation classes of H_ξ over O_K[ε], with its fixed reduction to O_K. The induced identification of tangent modules is O_K-linear. This uses universality and the marking; it is not a bijection between arbitrary unmarked filtration coordinates. (KP18, Lemma 3.1.15 and §3.1.14, pp.168–169; KP18 line 1980).

A proof can proceed as follows. Apply the universal deformation functor and rigidification over nilpotent PD thickenings. GM identifies its tangent module with lifts of the Hodge summand; verify compatibility with the prescribed ξ and its complete-local topology.

*Needs:* §1.8 (universal display with rigid first order); §1.7 (crystalline deformation of displays).


### 4.9 Interpolation of two tensor displays

Suppose two marked adapted displays over O_K have identified underlying tensor filtration pairs and the same residual display. For S=O_K[[T]], the surjection S→O_K×_k O_K sending T↦(0,π_K) lifts their two Ψ maps to a tensor-preserving Ψ_S. It gives an interpolating marked display with the required two endpoint specializations. Surjectivity is onto the fibre product, not onto O_K×O_K. (KP18, Proof of Proposition 3.2.17, pp.176–177; KP18 line 2290; Hoff23, Lemma 2.34, p.28; Hoff23 line 1317).

The API includes the following facts.

- Produce Ψ_S with endpoints Ψ and Ψ′ after the stated identification of pairs.
- Evaluation at T=0 and T=π_K returns the two marked displays.
- The universal ambient display classifies the interpolating family by a continuous map R_E→S.

**Checks.**

- Displays with incompatible residual Ψ cannot define a point over O_K×_k O_K.
- For identical endpoint Ψ the constant display is an allowed interpolation.
- The pair (0,1) does not belong to O_K×_k O_K, so the endpoint map is not claimed surjective onto the unrestricted product.

A proof can proceed as follows. Check the coefficient and Zink-Witt fibre-product surjections. Smoothness of the tensor-isomorphism torsor lifts its point along their complete-local kernel. Use ambient universality to lift the interpolation to a map R_E→S.

*Needs:* §4.6 (a tensor-preserving first-order rigid section); §2.6 (integral tilde tensors and tensor frames); §0.12 (base change of displays).


### 4.10 Four infinitesimal adaptedness criteria

Assume (A) the local-model triple is acceptable and of local Hodge type, (B) the specified good local integral Hodge embedding of the full fixer, and (C) very-goodness of that embedding at the marked point x. These are the conditions (A)–(C) of KZ25 §3.2.5 (KZ25 lines 1011–1019), and the letters keep this meaning throughout §§4.10–4.12 and §6.6. With the tensor section of §4.6, let ξ:R_G→O_K and a marked O_K[ε]-display deformation of H_ξ be given. The following are equivalent: one ambient lift representing it factors through R_G; every such ambient lift factors through R_G; the canonical rationally transported tensors lie in Fil⁰; and those transported tensors are integral φ-invariant Fil⁰ tensors. The integral condition includes the marked integral tensor type. The tangent modules satisfying these conditions have rank dim(G/(G∩P_ξ)). (KP18, Lemma 3.2.14, (3.2.16) and proof, pp.174–175; KP18 line 2217).

A proof can proceed as follows. GM represents the deformation by a filtration graph. Strictness of morphisms of weakly admissible tensor modules identifies the rational Fil⁰ constraint with Lie G+Lie P_ξ. Compare the two free O_K tangent modules using ambient universality. Their injection and equal ranks give a finite torsion cokernel, not automatically an isomorphism. Scale ε by a suitable pⁿ to put the class in the image; factorization for the original class follows by the injective map O_K[ε]→O_K[ε], ε↦pⁿε and the closed equations.

Do not infer equality of integral tangent lattices from equal ranks alone; retain the scaling argument and p-torsion-free coefficient ring.

*Needs:* §4.8 (tangent lifting at a dvr point); §4.6 (a tensor-preserving first-order rigid section); §1.6 (the rational section preserves lifted tensors); §1.7 (crystalline deformation of displays); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.17–R07.4.21.


### 4.11 Adapted DVR points factor through the local-model quotient

Under (A)–(C) of §4.10, normality and generic regularity of R_G, every continuous local map ξ:R_E→O_K whose induced deformation is (𝒢,μ_y)-adapted factors through R_G. Thus factorization is independent of the ambient coordinate map inducing the marked deformation. The converse follows by the tensor-preserving display section. The proof requires the named formal-completion and point-detection inputs and the Mathlib separatedness and contraction statements; they are not supplied merely by smoothness of the group. (KP18, Proposition 3.2.17, pp.175–177; KP18 line 2279; KZ25, Proposition 3.2.7, pp.24–25; KZ25 line 1046).

A proof can proceed as follows. After a finite scalar extension and a marked 𝒢 frame change, identify the two O_K filtration points. Interpolate their Ψ maps over O_K[[T]]. Put n_y=ker(y:R_G→O_K) for the chosen reference filtration point. For I_n=ker(R_E→S/Tⁿ), J_G=ker(R_E→R_G), and J_Gⁿ=ker(R_E→(R_G/n_yⁿ)[1/p]), apply the tangent criterion to the indicated common quotients. Over the fraction field the relevant descending finite-dimensional tangent subspaces stabilize. Generic regularity turns their equality into the needed completed-ideal containment. Contract through the p-torsion-free quotients, obtain J_G⊂I_n for every n and use ∩I_n=ker(R_E→S). Specialization at the second endpoint gives factorization.

Regularity of R_G[1/p] turns equality of tangent spaces into the completed-ideal containment; finite dimensionality of the tangent spaces gives the stabilization; p-torsion-freeness of the quotients gives the contraction, by `IsLocalization.algebraMap_mem_map_algebraMap_iff`; T-adic separatedness gives ∩ₙI_n=ker(R_E→S), by `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson`.

*Needs:* §4.10 (four infinitesimal adaptedness criteria); §4.9 (interpolation of two tensor displays); §1.6 (the rational section preserves lifted tensors); §2.3 (completed orbit deformation ring); SchemeAndStackFoundations §§4.1–4.4 and 4.7–4.8; ModularCurves §0G; Mathlib `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` and `IsLocalization.algebraMap_mem_map_algebraMap_iff`; gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion; gap:formal-dvr-point-detection.


### 4.12 Versal adapted deformation theorem

Under (A)–(C) of §4.10, the ambient deformation over R_E obtained from a first-order rigid tensor section is versal. For every finite K/Ĕ and every local ξ:R_E→O_K, its deformation is (G̃,μ_y)-adapted if and only if ξ factors through R_G. It is this chosen quotient inside a versal ambient family, not an assertion that any good embedding automatically represents a tensor deformation problem. (KZ25, Proposition 3.2.7, pp.24–25; KZ25 line 1046; KPZ26, §7.1.3, pp.72–74; KPZ26 line 3191). The letters (A)–(C) at that KPZ26 locator name the global level structure, R-smoothness with p∤|π₁(G_der)| and a very good Hodge embedding of its Theorem 7.1.3 (KPZ26 lines 3177–3179); they are not the three conditions used here.

A proof can proceed as follows. Apply the universal display theorem to Ψ_E. Its restriction to R_G has integral invariant tensors and generic cocharacter type; the reverse direction is the preceding factorization theorem with the canonical relative-frame c of §1.3.

*Needs:* §4.6 (a tensor-preserving first-order rigid section); §1.8 (universal display with rigid first order); §4.11 (adapted dvr points factor through the local-model quotient).


### 4.13 Universal marked parahoric display

For Hoff’s parahoric local-model datum, assume the integral Hodge embedding conditions, the residual marked 𝒢-display and Assumption2.28 (equivalently very-goodness via the preceding comparison). The chosen first-order rigid 𝒢-display over R_G represents the functor of isomorphism classes of its marked deformations, on complete Noetherian local O_Ĕ-algebras with residue k, and prove the corresponding rigidity of marked morphisms. The associated map to ordinary display deformations has the local-model quotient image. This does not assert a representation theorem for all parahorics without the infinitesimal compatibility hypothesis. (Hoff23, Construction 2.27 and Theorem 2.36, pp.24–29; Hoff23 line 1346).

A proof can proceed as follows. First prove equality of DVR-valued points using interpolation. For an arbitrary marked display over R, first lift its pair to a reduced p-torsion-free complete local base R′ using flatness and formal reducedness of the local model. Adjoin finitely many formal variables so that R′→R is surjective; smoothness of the tilde tensor-isomorphism torsor lifts Ψ to Ψ′. This proves the reduced-base lifting step here (Hoff23, Lemma 2.35, p.28; Hoff23 lines 1338–1345). Detect the lifted deformation by DVR points and descend the unique G-structure. Use gap:formal-dvr-point-detection for the reduced-point step.

**Checks.**

- For GL₂ with h=2,d=1 the reduced lifting base is O_Ĕ[[t]], and its quotient t↦0 returns the original constant pair.
- A deformation over k[ε]/ε² is tested after lifting to O_Ĕ[[t]] with t↦ε; its nilpotent ε is invisible to every map from k[ε]/ε² to O_K. Reduced-base lifting is therefore necessary before point detection.
- In O_K[[T]], the series T^m lies in (T^n) exactly when m≥n, so ∩ₙ(T^n)=0; separatedness retains the second interpolation endpoint.

*Needs:* §4.7 (hoff’s infinitesimal compatibility condition); §4.6 (a tensor-preserving first-order rigid section); §4.9 (interpolation of two tensor displays); §4.11 (adapted dvr points factor through the local-model quotient); §2.8 (dieudonné display with parahoric structure); gap:formal-dvr-point-detection; gap:scheme-local-model-representative.


### 4.14 Recognition from integral étale tensors

In the versal adapted setup, let H′/O_K be a marked deformation whose generic Hodge filtration has the prescribed G-conjugacy type. Suppose there are Γ_K-invariant tensors in (T_pH′∨)^⊗ corresponding to the residual crystalline tensors and that their integral tensor type is isomorphic to the fixed (Λ,s_a) type. Then H′ is adapted and every ambient map inducing it factors through R_G. The integral-type assumption ensures the new stabilizer satisfies the tensor comparison hypotheses; rational comparison alone does not provide it. (KZ25, Proposition 3.3.4, p.25; KZ25 line 1106; KP18, Proposition 3.3.13, pp.181–182; KP18 line 2493).

A proof can proceed as follows. Transport the integral group hypotheses along the assumed type isomorphism, apply integral crystalline tensor comparison and the independently given generic type, then the adapted factorization theorem. This retains the extra hypothesis missing from the rational-only recognition criterion.

*Needs:* §4.4 (integral crystalline and witt tensor comparison); §4.5 (tensor hodge filtrations and residual lifts); §4.12 (versal adapted deformation theorem).


### Examples

At a height-two ordinary point the ambient tangent module has rank 1. Imposing the split endomorphism projector leaves tangent rank 0. The scalar endomorphism ε↦pⁿε is injective over O_K[ε], and is zero on the ε-direction over k[ε]; the factorization argument uses the former ring.


### Dependencies

Layers 0–3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3 and R07.4.16–R07.4.25; VectorBundlesAndIsocrystals Layer 6, “Integral group torsors and Frobenius”; SchemeAndStackFoundations §§0.6, 4.1 and 4.7–4.8; the purity and point-detection contracts.


## Layer 5: hyperspecial comparisons and lattice specialization


### 5.1 Hyperspecial Breuil–Kisin tensor frames

Let k be perfect, K/W(k)[1/p] finite totally ramified, and L a crystalline Z_p-lattice with invariant tensors cutting out a reductive group over Z_p. Their images cut out a reductive group on the imported module 𝔐(L) for every such k. A tensor-preserving frame L⊗𝔖≅𝔐(L) exists if k is separably closed, or if k is finite and the integral group is connected. These additional residue-field hypotheses also accompany the resulting integral W-frame; they are not needed just for reductivity. (Kisin17, Theorem 1.1.4 and Corollary 1.1.7, pp.7–8; Kisin17 line 295).

A proof can proceed as follows. Use the imported crystalline-lattice functor and integral reductive tensor-descent theorem. Trivialize its reductive torsor by strict henselianity in the first case and the finite-field connected-group vanishing in the second. Compare φ*𝔐/u with the contravariant crystal.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; ReductiveGroupsPartII §§RG2.3.3, RG2.3.5 and RG2.3.7; SchemeAndStackFoundations §§1.15 and 2.3; VectorBundlesAndIsocrystals Layer 6, “Integral group torsors and Frobenius”.


### 5.2 Relative evaluation of the crystalline period construction

Let R be a normal Noetherian integral p-adically complete p-torsion-free W(k)-algebra with R/p nonzero. In a chosen algebraic closure of Frac R take the directed union R̄ of its normalizations in finite extensions étale over R[1/p], and let R̂̄ be its p-adic completion. Apply DerivedDeRhamCohomology §PD.7 to R̂̄ to obtain θ and A_cris(R). The notation A_cris(R) here includes the chosen geometric cover; it does not construct a second PD envelope or assert its absolute perfect-field properties for arbitrary R. (Kisin17, §1.1.15, p.10; Kisin17 line 447).

The API includes the following facts.

- The coefficient ring is the existing Fontaine-envelope applied to R̂̄.
- Extend Witt Frobenius uniquely to φ:A_cris(R)→A_cris(R) using the completed initial property on the canonical PD ideal J containing p. For x∈ker θ, write φ(x)=xᵖ+py; in the envelope xᵖ=p!γ_p(x), so φ(x)∈pA_cris(R)⊂J.
- Define Filʳ for r≥1 as the p-adic closure of the r-th divided-power ideal generated by ker θ, and Filʳ=A_cris(R) for r≤0. This uses ker θ, not the larger ideal J containing p.
- Automorphisms of the chosen geometric cover commute with θ, φ and the PD operations and preserve this filtration.
- A compatible map of geometric cover systems induces the crystalline coefficient specialization.

**Checks.**

- For R=W(k), use the completed algebraic integral closure before applying the envelope; do not replace it by W(k) itself.
- Changing the geometric closure transports the construction by an isomorphism, with the expected conjugacy of the Galois action.
- A nonnormal coefficient algebra does not satisfy this input specification without first replacing its cover construction.
- For R=W(k), its cover completes to O_C; φ agrees with PadicPeriodRings §4.1 under DerivedDeRhamCohomology §PD.7’s envelope comparison, and φ(t)=pt.
- With compatible roots of p, x=[p♭]−p has θ(x)=0 but θ(φ(x))=pᵖ−p≠0. Thus φ does not preserve ker θ; the PD ideal J containing p is essential.
- Fil⁰=A_cris(R) and Fil¹=ker θ_cris in this setting; θ_cris(p)=p≠0 excludes p from Fil¹, although p∈J.

A proof can proceed as follows. Build the normal-cover system and its compatible Galois action, check the hypotheses making θ onto in this setting, and evaluate the existing Fontaine-envelope construction. Use DerivedDeRhamCohomology §PD.7’s completed initial property to extend Witt Frobenius into (A_cris(R),J); uniqueness gives Galois and specialization compatibility. Its PD-power construction supplies the filtration. Extend that filtration to the t-localization by the displayed shift convention.

*Needs:* DerivedDeRhamCohomology §PD.7, especially `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope`; PadicPeriodRings §§3 and 4.1; Mathlib `WittVector.frobenius`; SchemeAndStackFoundations §§0.6 and 4.12; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


### 5.3 Weak admissibility of the toral filtration

For the fixed tensor G-isocrystal (D,δσ), let T⊂J_δ be a maximal ℚ_p-torus and let μ_T be a T-cocharacter geometrically conjugate to the given inverse Hodge type. Require its Galois average in X_*(T)⊗ℚ, computed over a finite splitting field, to equal ν_δ⁻¹. Its inverse defines a weakly admissible filtration over a field of definition; the imported weak-admissible-to-admissible theorem makes it admissible. This statement retains the embedding in the σ-centralizer and the average equality, rather than asserting that an arbitrary toral Hodge filtration is admissible. (Kisin17, Proof of Theorem 2.2.3, p.32 (citing Rapoport–Zink Proposition 1.21); Kisin17 line 1455).

A proof can proceed as follows. Reduce the degree and subobject inequalities to the torus weights and Newton average in the stated centralizer setting. Prove the degree equality and every Frobenius-stable subobject inequality in this normalization; the criterion is RZ96, Proposition 1.21, in the form applied in Kisin17, proof of Theorem 2.2.3, p.32.

*Needs:* PadicHodgeTheory §5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.13; the torus and Newton-average hypotheses of the toral filtration theorem.


### 5.4 Hyperspecial adapted lift

For H₀/k with φ-invariant tensors in D₀=D(H₀)(W), reductive fixer G_W, and Hodge filtration given by μ₀⁻¹, an adapted lift H/O_K has φ-invariant tensors in D(H)(S)^⊗ lifting the given ones, whose schematic fixer is reductive over S and whose images lie in Fil⁰ over O_K. Here S is the imported p-completed Eisenstein PD ring, not 𝔖. The unique rational φ-equivariant identification with D₀⊗S[1/p] takes the residual tensors to the lifted tensors. (Kisin17, §1.1.5–1.1.9, pp.7–9; Kisin17 line 349).

The API includes the following facts.

- The lifted tensors are integral in the S-crystal and φ-invariant.
- Their Fil⁰ condition is the tensor condition for a filtration induced by a G_K-cocharacter conjugate to μ₀⁻¹.
- For a common integral tensor type, the PD formulation and §2.9 agree via the imported crystal/Witt comparison.

**Checks.**

- Without cutting tensors this is an ordinary lift with the given Hodge type.
- An element integral only after inverting E(u) in 𝔖 does not qualify as an integral S-crystal tensor.
- For `μ_{p∞}` use T_p(H)∨=Z_p(−1), matching contravariant D(H); omitting the Cartier-dual twist gives the wrong comparison.

A proof can proceed as follows. Form the tensor condition on the imported PD crystal, then use rational crystalline rigidity to compare its special fibre. Filtration splitting in Rep(G) gives generic G-conjugacy of the lifting cocharacter.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; §2.1 (integral tensor and local-model datum).


### 5.5 Relative comparison for p-divisible coefficients

For a p-divisible group H/R, with R and its geometric cover as in §5.2, the natural map `T_pH⊗A_cris(R)→Hom_{A_cris(R)}(D(H)(A_cris(R)),A_cris(R))` is an isomorphism after inverting the standard period t. State naturality, tensor compatibility and the linear-dual variance. Here T_pH is the geometric Tate module on the chosen cover and Hom uses the contravariant crystal. (Kisin17, (1.1.16) and proof of Lemma 1.1.17, pp.10–11; Kisin17 line 456).

**Checks.**

- For H=ℚ_p/ℤ_p, evaluation of the identity Tate vector gives the identity on A_cris(R); the map is already an integral isomorphism.
- For H=`μ_{p∞}`, a compatible Tate generator maps to t times a unit in a crystalline basis. Since θ_cris(t)=0 and the target of θ_cris is nonzero, t is not a unit; t-inversion is necessary.
- For the zero p-divisible group both sides are zero and the comparison is their unique isomorphism; on the ordinary product the matrix is diag(t,1), up to units.

A proof can proceed as follows. A compatible system of torsion points is a homomorphism ℚ_p/ℤ_p→H over the cover. Contravariant crystal evaluation and D(ℚ_p/ℤ_p)(A_cris(R))=A_cris(R) give the displayed map. Construct the corresponding map for H* and pair them using Cartier duality. Their composites are multiplication by t under the Tate pairing, so t-inversion gives the inverse. Functorial evaluation gives the tensor, filtration and Galois compatibilities (Kisin17 lines 455–462).

*Needs:* §5.2 (relative evaluation of the crystalline period construction); AbelianSchemesAndArithmeticModuli §A4.CR.7.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.6–R07.1.8.


### 5.6 Hodge cocharacter and Frobenius double coset

Suppose a Z_p tensor lattice U identifies with D₀ over W, the fixer is reductive and φ=bσ preserves the tensor family. The special Hodge filtration is induced by a G_W-cocharacter μ₀⁻¹ and, putting υ₀=σ(μ₀⁻¹), one may choose its lift so that `b=h·p^{υ₀}` with h∈G(W). In particular `b∈G(W)p^{υ₀}G(W)`. The stronger one-sided form is needed for the explicit lift; an arbitrary representative of the conjugacy class need not satisfy it. (Kisin17, Lemma 1.1.12 and proof, p.9; Kisin17 line 391).

A proof can proceed as follows. Identify Fil¹D₀(k) with the kernel of the reduced Frobenius, lift its parabolic and cocharacter over W, and compare the two height-one lattices. Choose the lifted cocharacter in this factorization, rather than fixing an unrelated μ₀ in advance.

*Needs:* §5.4 (hyperspecial adapted lift); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §0.2 (dieudonné modules over perfect rings).


### 5.7 Explicit height-one adapted lift

In the preceding Z_p-framed setting put 𝔐=σ⁻¹*D₀⊗_W𝔖, identify φ*𝔐 with D₀⊗𝔖 and identify 𝔐 with φ*𝔐 using U. For μ=μ₀ over 𝔖 and c=σ⁻¹(b)μ₀(E(0))∈G(W), give 𝔐 Frobenius matrix c μ⁻¹(E(u)). It is height one, its residual crystal is D₀, its S-filtration is induced by μ⁻¹, and the imported equivalence produces an adapted p-divisible lift over every such O_K. The tensor sections are the constant U-tensors. (Kisin17, Proof of Proposition 1.1.13, pp.9–10; Kisin17 line 433).

The API includes the following facts.

- The matrix is c μ⁻¹(E(u)), with c defined above.
- φ*𝔐/u identifies with D₀ with its given Frobenius and tensors.
- The corresponding H/O_K is hyperspecial-adapted and has the prescribed generic filtration type.

**Checks.**

- The weight-zero rank-one case gives invertible Frobenius.
- The rank-one Hodge-weight-one case has cokernel killed by E(u), not Frobenius invertible over 𝔖.
- Replacing μ₀(E(0)) by μ₀(p) without its unit correction can change the residual φ-module; test with E(0)=ap and a≠1.

A proof can proceed as follows. The one-sided factorization and E(0)/p∈W× give c integral. The two Hodge weights ensure the cokernel is killed by E(u). Check residual Frobenius in the σ⁻¹ pullback convention and transfer the module through the existing height-one equivalence.

*Needs:* §5.6 (hodge cocharacter and frobenius double coset); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.1.


### 5.8 Frobenius pullback makes the lattice connection integral

Let R be a smooth integral F̄_p-algebra with the frame ℛ of Kisin17 §1.4.5, and g∈G(ℛ[1/p]) with g⁻¹bσ(g)∈G(ℛ)p^υG(ℛ). For sufficiently large n, on the σⁿ-twisted base R_n the lattice g(D₀⊗ℛ_n), interpreted through that twist, is stable under F,V and ∇=1⊗d. It therefore comes from a p-divisible group over R_n with a quasi-isogeny to the constant group and the specified conjugate Hodge filtration. (Kisin17, §1.4.5 and Lemma 1.4.6, pp.24–25; Kisin17 line 1072).

A proof can proceed as follows. Bound denominators of g⁻¹dg by p^r. Frobenius sends differentials into pΩ, so its n-th pullback makes the connection integral. The double coset gives F,V stability and the filtration. Invoke the existing smooth-base Dieudonné equivalence, rather than re-plan it.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27; §5.6 (hodge cocharacter and frobenius double coset); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


### 5.9 A correctly framed hyperspecial Dieudonné datum

Over k=F̄_p let Λ be a faithful reductive tensor lattice and b∈G(W[1/p]) with pΛ_W⊂bΛ_W⊂Λ_W. Define D=Λ_W with F=bσ and V=pF⁻¹; its Hodge filtration is ker(F modulo p), equivalently the reduction of σ⁻¹(b⁻¹)pΛ_W. The perfect-field anti-equivalence realizes it by a p-divisible H₀ with this marked crystal. A prescribed μ-filtration can be included only when it equals that computed filtration in the chosen frame; a double coset for b alone does not force that equality. Isomorphisms preserve the marking. (Zhu17, §3.2, pp.460–461; Zhu17 line 2298; KZ25, §3.4.1, pp.25–26; KZ25 lines 1115–1140).

The API includes the following facts.

- The bounded b defines the marked p-divisible group through its F,V module.
- The inverse-image Hodge lattice is σ⁻¹(b⁻¹)pΛ_W.
- A specified μ-filtration belongs to the same framing exactly under the displayed Hodge-lattice equality.

**Checks.**

- b=1 has zero Fil¹.
- b=p has full Fil¹.
- Conjugating diag(p,1) by a basis change can move Fil¹; fixing the original coordinate line while changing b fails unless the compatibility is rechecked.

A proof can proceed as follows. Verify the height-one F,V relations, apply the contravariant equivalence, and compute its Hodge lattice from F. State separately the compatibility needed for an independently specified cocharacter filtration. The marking and the Hodge lattice are required together.

*Needs:* §0.2 (dieudonné modules over perfect rings); §2.1 (integral tensor and local-model datum); §5.6 (hodge cocharacter and frobenius double coset).


### 5.10 Horizontal Fil⁰ deformation locus

In the hyperspecial ambient deformation ring R and reductive quotient R_G, complete R[1/p] and R_G[1/p] at the common deformation origin to A and A_G. Construct the universal integrable connection on the ambient Dieudonné module over R, with connection form in Lie(GL(D))⊗Ω¹_R/W in the marked frame, and parallel transport the crystalline tensors from their value at the origin to sections σ_a on A. On the tensor-adapted quotient R_G, its pullback in the tensor frame has coefficients in Lie(G); the iterative construction there uses stability of Lie(G) after inverting p under Frobenius conjugation h↦φhφ⁻¹ (Kisin17, Errata E.1, p.96; Kisin17 lines 4253–4258). Let A′_G be the largest closed formal subscheme of Spf A on which every σ_a lies in Fil⁰. This is a quotient of the rational completion, not an integral quotient defined by assumed convergent coordinates. (Kisin17, Errata E.1–E.3, p.96; Kisin17 line 4253).

The API includes the following facts.

- Each σ_a is horizontal and has its specified value at the origin.
- The Fil⁰ coefficient ideal defines A′_G.
- A continuous A-map to a formal test algebra factors through A′_G exactly when all transported tensors are Fil⁰.

**Checks.**

- The origin factors through A′_G.
- No tensors impose the zero ideal and A′_G=A.
- For R=W[[t]], φ(t)=tᵖ, Fil¹=Re₁, G the diagonal torus fixing E₁₁, and F(t)=(1+tE₂₁)diag(p,1), write ∇=d+N(t)dt. Horizontality gives dF+NF=Fφ(N)p t^(p−1)dt, so N(0)=−E₂₁ and [N(0),E₁₁]=−E₂₁≠0: the ambient coefficient is outside Lie(G). The formal solution is N(t)=−(Σ_(r≥0) t^(pʳ−1))E₂₁. On A=K₀[[t]], the transported tensor is E₁₁+h(t)E₂₁ with h(t)=Σ_(r≥0) t^(pʳ)/pʳ and linear coefficient 1. It preserves Fil¹ exactly when h=0, and (h)=(t). On the adapted quotient t=0, dt pulls back to zero, the connection form is zero and E₁₁ is horizontal.

A proof can proceed as follows. Construct the ambient connection by crystalline evaluation. Its rational construction can also use iteration in the Frobenius-stable Lie algebra Lie(GL(D[1/p])). Formal characteristic-zero integration gives its parallel sections on A. Apply the iteration separately on R_G in Lie(G) after inverting p, retaining Frobenius-conjugation stability; identify the result with the pulled-back connection by Frobenius horizontality and uniqueness. Express their images in the finite locally free quotient by Fil⁰ and take the closed ideal of their coefficients.

*Needs:* §5.4 (hyperspecial adapted lift); §1.6 (the rational section preserves lifted tensors); SchemeAndStackFoundations §§4.1–4.4 and 4.7–4.8; ModularCurves §0G; AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.1.


### 5.11 Equality of the horizontal Fil⁰ locus and the adapted locus

With the universal connection of §5.10, A′_G=A_G. The ambient connection has coefficients in Lie(GL(D)); its restriction to R_G in the tensor frame has coefficients in Lie(G), using the Frobenius-stability hypothesis of Kisin17 E.1. Consequently σ_a restricted to A_G equals s_a⊗1. The restricted assertion, together with the G-valued Hodge filtration, gives the inclusion Spf A_G⊂Spf A′_G. This equality is over the rational completed rings just defined. (Kisin17, Errata E.1 and Lemma E.3, p.96; Kisin17 line 4263).

A proof can proceed as follows. The restricted connection makes the constant tensors horizontal and gives a surjection A′_G→A_G. For the reverse inclusion, use Frobenius-compatible dual-number maps to identify the tensor-locus tangent space with the G-orbit tangent space; formal regularity of A_G and that tangent calculation give equality. Track the augmentation used for completion.

*Needs:* §5.10 (horizontal fil⁰ deformation locus); §4.10 (four infinitesimal adaptedness criteria).


### 5.12 Formally smooth hyperspecial adapted deformation space

For H₀ and reductive crystalline tensor data as in the hyperspecial definition, the universal marked deformation ring R has a quotient R_G formally smooth over W. For every finite totally ramified K/W[1/p], a W-map R→O_K factors through R_G exactly when its lift is adapted. Its relative dimension is `dim G/P_{μ₀}`. Use the horizontal Fil⁰ locus equality of §5.11, or the very-good smooth local-model argument after identifying its conventions. (Kisin17, Proposition 1.1.10, p.9 and Errata E.2–E.4, p.96; Kisin17 line 386).

A proof can proceed as follows. The reductive flag variety gives a smooth local-model quotient. On rational completions use A′_G=A_G and horizontality of φ-invariant tensors, then descend the factorization to the p-torsion-free integral quotient. The connection argument uses Lie(GL(D)) on the ambient ring and Lie(G) only on the adapted quotient, with Frobenius-conjugation stability after inverting p.

*Needs:* §5.11 (equality of the horizontal Fil⁰ locus and the adapted locus); §4.11 (adapted dvr points factor through the local-model quotient); §3.7 (curve-spanned tangent criterion); §5.4 (hyperspecial adapted lift).


### 5.13 Étale tensors in the hyperspecial universal family

Assume the relative comparison and constants theorem, and the parallel integral crystalline tensors on the universal family over R_G. They determine rational invariant étale tensor sections on Spec R_G[1/p] whose pullbacks at each DVR-valued point are the usual comparison tensors. Their integral tensor type is constant on the connected family once it is checked at the explicit adapted lift, so the sections are integral with that type throughout. (Kisin17, Lemma 1.1.17, pp.10–11 and proof of Proposition 1.1.13, pp.9–10; Kisin17 line 463).

The API includes the following facts.

- Produce the rational étale tensor sections from the parallel crystalline sections.
- Their pullback at R_G→O_K is the B_cris comparison tensor.
- One integral frame of the connected tensor local system propagates its integral tensor type.

**Checks.**

- Specialization at §5.7 recovers its constant lattice tensors.
- For a disconnected base one point cannot control the integral type on a different component.
- The tensor local system is formed from Hom(T_pH,Z_p), consistent with the displayed comparison map.

A proof can proceed as follows. Transport the horizontal φ-invariant Fil⁰ tensors through the relative comparison; the constants theorem descends them to Q_p-local-system sections. Test their integral lattice at the explicit lift and use the connected étale-local tensor sheaf to propagate the integral type.

*Needs:* §5.5 (relative comparison for p-divisible coefficients); §5.12 (formally smooth hyperspecial adapted deformation space); §5.7 (explicit height-one adapted lift); §5.11 (equality of the horizontal Fil⁰ locus and the adapted locus); SchemeAndStackFoundations §§1.15 and 2.3; gap:relative-crystalline-constants.


### 5.14 Hyperspecial étale recognition

Under the residue-field hypotheses for integral hyperspecial frames and the Z_p tensor datum, a marked lift is hyperspecial-adapted if and only if its comparison tensors are integral étale tensors of that fixed reductive integral type. In that case D(H₀)(W)≅T_pH∨⊗W carries the tensors to each other. The fixed integral type and the frame hypotheses are retained explicitly; the tensor algebra is formed on the linear dual L=Hom_ℤp(T_pH,ℤ_p), including its covariant and dual factors. (Kisin17, Proposition 1.1.13 and (1.1.14), pp.9–10; Kisin17 line 410).

A proof can proceed as follows. For an adapted lift use the universal tensor sections; for the converse use the integral tensor comparison, then the adapted factorization of §4.11. The W-frame is obtained using the stated residue-field torsor triviality.

*Needs:* §5.13 (étale tensors in the hyperspecial universal family); §5.1 (hyperspecial breuil–kisin tensor frames); §4.14 (recognition from integral étale tensors); §5.4 (hyperspecial adapted lift).


### 5.15 Comparison with geometric realization tensors

Let S be a given normal flat Hodge-type integral model, for example the normalization of the closure in a Siegel model, and A/S its pulled-back abelian scheme. Fix the mixed tensors cutting out its integral Hodge embedding. Assume their generic étale realizations are integral of the smooth full-fixer type of §4.4, and their de Rham realizations extend over S. At every O_K-valued point in the tensor-frame residue-field range of §4.3, the p-adic comparison identifies its integral generic étale tensors with the de Rham tensors and the residual contravariant crystalline tensors. The local p-divisible assertions are §4.4 and §5.13. The existence of S and global extension of its tensors remain downstream inputs; the supplier contract is only the rational absolute-Hodge comparison on the given abelian scheme, which does not consume §4.12. (vanHoften24, §3.1.5–3.1.7, pp.27–28; vanHoften24 line 1190; Kisin17, proof of Proposition 1.3.9, p.21; Kisin17 line 953).

A proof can proceed as follows. Import the geometric family and its Hodge tensors, compare their generic realization maps, and specialize its p-divisible crystal using the stated integral comparison. Use the rational absolute-Hodge comparison and §4.4 to identify the residual integral tensor images; §5.13 supplies the local universal-family compatibility.

*Needs:* §4.4 (integral crystalline and witt tensor comparison); §5.13 (étale tensors in the hyperspecial universal family); ShimuraVarieties §7.0i; gap:integral-hodge-realization-extension.


### 5.16 Specialization of a tensor-compatible Tate lattice

For an adapted H/O_K with k=F̄_p and a fixed tensor W-frame, let g∈G(Q_p). Let L=Hom_Zp(T_pH,Z_p), with G acting on L. After a finite extension making gL Galois-stable, form the isogenous p-divisible group with dual Tate lattice gL (its Tate lattice is (gL)∨), form its Breuil–Kisin lattice, and reduce at u=0. The inverse notation on Tate modules is interpreted via this dual action. This gives g₀G(W)∈G(W[1/p])/G(W), depending only on gG(Z_p). Changing the initial W-frame changes the map by left multiplication by G(W). The output is a rational-lattice coset; g₀ is not required to lie in G(W). (Kisin17, §1.2.16–Lemma 1.2.18, pp.15–16; Kisin17 line 688).

The API includes the following facts.

- Produce the rational crystal lattice coset attached to gG(Z_p).
- Right G(Z_p)-equivalent g give the same output coset.
- Changing the W-frame left-translates all outputs by its element of G(W).

**Checks.**

- The identity Tate lattice specializes to the residual crystal lattice.
- For g=p in G_m, the output has the same nonzero valuation; it cannot be represented by an integral unit.
- Replacing g by gh with h∈G(Z_p) does not change the lattice or output coset.

A proof can proceed as follows. An open stabilizer of the finite-index lattice gives the finite field extension. Apply the existing integral classification and tensor frame, then specialize its matrix. Show independence from further extensions and from right multiplication by G(Z_p).

*Needs:* §5.14 (hyperspecial étale recognition); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; §5.1 (hyperspecial breuil–kisin tensor frames).


### 5.17 An admissible filtration produces an adapted isogenous lift

In the hyperspecial Z_p-framed setting and its integral-frame residue-field range, let μ be a G_K-cocharacter conjugate to μ₀ whose inverse induces an admissible filtration on D₀⊗K. There are a finite K′/K with residue k′, a lift H′/O_K′ and a quasi-isogeny over k′ identifying its rational crystal with D₀ and its filtration with μ⁻¹. The new integral lattice is gD₀ with g∈G(W(k′)[1/p]), and g⁻¹bσ(g) lies in `G(W(k′))p^{υ₀}G(W(k′))`. H′ is adapted for the conjugated integral fixer. The original integral lattice need not remain fixed. (Kisin17, Proposition 1.1.19 and proof, pp.11–12; Kisin17 line 484).

The API includes the following facts.

- Produce K′, H′ and the quasi-isogeny with the specified filtration.
- The chosen crystal lattice is gD₀ for g over W(k′)[1/p].
- The integral tensors cut out `gG_{W(k′)}g⁻¹` on this lattice.

**Checks.**

- For the explicit reference filtration one may take its adapted lift and the identity quasi-isogeny.
- A p-power isogeny may change the integral lattice; requiring g∈G(W(k′)) loses such examples.
- A ramified finite extension may be insufficient to trivialize all required integral tensor data; retain the finite extension and its residue k′.
- For k=𝔽₃, K=ℚ₃, G=G_m, b=3 and μ(z)=z⁻¹, the inverse μ⁻¹(z)=z is the weight-one Hodge cocharacter and induces the jump-one filtration Fil¹=D₀⊗K on the multiplicative line, with t_H=t_N=1. The base change is K̆=ℚ̆₃ with the same b and μ, and κ(b)−(μ⁻¹)^natural=1−1=0 there. Both jump-one lines with Frobenius 3σ realize one-dimensional ℚ₃-spaces, isomorphic as fibre functors; the comparison never treats ℚ̆₃ as a subfield of ℚ₃. With μ(z)=z instead, μ⁻¹ induces the filtration with jump −1, t_H=−1≠1=t_N, which is not admissible and is excluded by the hypothesis.
- For k an algebraic closure of 𝔽₃(t) and K=K₀=W(k)[1/3], k̄=k and K̆=K; its residue field contains the transcendental element t, whereas every finite extension of ℚ̆₃ has residue field 𝔽̄₃. So K̆ is outside the K/ℚ̆_p-finite theorem, and the isomorphism of the two fibre functors over this K is the perfect-residue period-torsor supplier contract; a route asserting that K̆ is always finite over ℚ̆_p is wrong.

A proof can proceed as follows. Use the imported weight-[0,1] admissible-to-p-divisible realization. Compare the rational tensor representations by the neutral torsor above. When k is algebraic over 𝔽_p, first base change from K to `K̆=K⊗_{K₀}W(k̄)[1/p]`: here W(k̄)=W(𝔽̄_p), and K̆ is a finite totally ramified extension of ℚ̆_p since the Eisenstein polynomial of π stays Eisenstein over W(k̄). The ℚ_p-space `(B_cris⊗_{K₀}D)^{φ=1}∩Fil⁰(B_dR⊗_K D_K)` equals its K̆ counterpart, tensor-compatibly, so the two underlying fibre functors on Rep_ℚp(G) are the restricted ones and PadicHodgeTheory §5.5 applies at K̆. When k is separably closed but not algebraic over 𝔽_p, K̆=K is not finite over ℚ̆_p, and the isomorphism of the two fibre functors is the supplier contract gap:perfect-residue-period-torsor-comparison, whose source is stated for every algebraically closed residue field. Then choose an integral lattice after finite extension, and read its crystal as gD₀. The height-one Hodge bound gives the double coset. Extension of the base realization theorem from finite Q_p-extensions to the perfect-residue range is the supplier contract gap:perfect-residue-bt-realization.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20 and its perfect-residue supplier contract; PadicHodgeTheory §5.5, period-torsor class and neutrality; gap:perfect-residue-period-torsor-comparison; §5.1 (hyperspecial breuil–kisin tensor frames); §5.6 (hodge cocharacter and frobenius double coset).


### 5.18 Hodge bound and Kottwitz invariant under specialization

For the specialization map just defined, g₀ belongs to `X_{υ₀}(b)`, and κ_G(g₀)=κ_G(g) in (π₁(G)_I)^σ (equal to π₁(G)^Γ for this unramified ℤ_p-model). The coset is defined up to the previously stated frame change, which has zero Kottwitz invariant. The Frobenius bound is read with υ₀=σ(μ₀⁻¹). (Kisin17, Lemma 1.2.18 and proof, pp.15–16; Kisin17 line 697).

A proof can proceed as follows. Height one gives the required Frobenius double coset. For this pair of Breuil–Kisin lattices choose the tensor-compatible comparison g̃∈G(𝔖[1/p]); its u=0 specialization represents σ⁻¹(g₀), and its étale period specialization represents g. Prove equality of the two components of this family using the supplied Grassmannian component maps. The comparison is taken in G(𝔖[1/p]), since the scalar p has no inverse over 𝔖. Evaluate both using the positive valuation normalization. This is a component comparison for this family; it is not inferred merely from equality of dimensions or from connectedness of an unrelated space.

*Needs:* §5.16 (specialization of a tensor-compatible tate lattice); §5.6 (hodge cocharacter and frobenius double coset); ReductiveGroupsPartII §RG2.1.5; GeometricSatakeAndFusion Layer GS0 §0.31, “Witt affine flags and components”.


### 5.19 Specialization through a quotient with central Galois image

Let f:G_Zp→H_Zp be a surjection of reductive groups in the preceding setting. If the quotient Galois representation has image in Z_H(Q_p), the tensor W-frame can be chosen so that f(g) and f(g₀) define the same H(W[1/p])/H(W) coset for every g∈G(Q_p). This conclusion concerns a suitable common frame and quotient cosets, not equality of arbitrarily selected matrices. (Kisin17, Lemma 1.2.19, p.16; Kisin17 line 722).

A proof can proceed as follows. Apply the integral unramified period comparison to the quotient tensor representations. Centrality removes the conjugation ambiguity; choose the common frame there and descend its coset identity.

*Needs:* §5.18 (hodge bound and kottwitz invariant under specialization); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16; ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5.


### Examples

For G_m and g=p acting on the linear dual Tate lattice, the specialized crystal lattice is pW and has Kottwitz value 1. For E(u)=u−p the rank-one multiplicative Frobenius is −E(u), whose value at u=0 is p; the étale Frobenius is 1. Both computations use the same dual-lattice and positive-valuation conventions.


### Dependencies

Layers 0–4; DerivedDeRhamCohomology §PD.7; PadicPeriodRings §§3 and 4.1; CrystallineCohomology §CR.7.1; PadicHodgeTheory §5.5; GeometricSatakeAndFusion Layer GS0 §0.31; the relative-constants, perfect-residue and rational absolute-Hodge comparison contracts.


## Layer 6: ordinary lifts and the rational centralizer action

Use the following convention adapter for the affine Weyl objects of ReductiveGroupsPartII §RG2.4.3. Relabel the same translation element by t_here^λ=t_RG^(−λ); for a split cocharacter its representative is λ(p), so its Kottwitz class is the image of λ. Keep the same affine Weyl elements, base alcove and parahoric subgroups. Transport Frobenius, Bruhat order and length through this identification: σ(t_here^λ)=t_here^(σλ), w≤_here v if and only if w≤_RG v for the identified elements, and ℓ_here(w)=ℓ_RG(w). Define Adm_here(μ)=Adm_RG(dom(−μ)), equivalently the lower set with endpoints t_here^(uμ) for u in the finite Weyl group; take its image in the parahoric double-coset space when required. Here dom uses the supplier’s chosen chamber, and −μ can be used directly if no dominant label is required. Thus σ-straightness is transported with the actual Frobenius action; negation is a change of translation labels, with no assertion that negating labels preserves Bruhat order at a fixed label. All ordinary translations and admissible sets in this layer use this adapter, independently of the inverse Hodge label for the filtration local model (KZ25, §§2.1–2.2 and §3.4.1–3.4.3, pp.7–10 and 25–27; KZ25 lines 336, 389 and 1133–1176).

### 6.0 Ordinary integral σ-conjugacy normalization

Before choosing the ordinary tensor datum, prove the following normalization. If the μ-ordinary class with ν=μ^⋄ exists and c lies both in that class and in the union of parahoric double cosets indexed by Adm_here(μ), then c is integrally σ-conjugate to a lift of a σ-straight translation t_here^(μ′), with μ′ in the finite Weyl orbit of μ. Here σ-straight means ℓ(wσ(w)⋯σⁿ⁻¹(w))=nℓ(w) for every n≥1. For a dominant lift μ̃ and wμ=μ′, the cocharacter wμ̃ is central in the Newton Levi of this translation. Existence of the class is a hypothesis for a nonsplit inner form (KZ25, Definition 2.2.4, Lemmas 2.1.7, 2.1.9 and 2.2.6, Proposition 2.3.3, pp.8–12; KZ25 lines 336, 369, 437 and 526).

A proof route establishes within this normalization theorem the integral reduction to a minimal Iwahori Bruhat representative, the existence of a σ-straight representative below its admissible index, and the single integral σ-orbit property of a straight Iwahori double coset. The ordinary equality ν=μ^⋄ forces the length to equal the translation length; the admissible inequality then forces that index to be a translation. These are group-theoretic subtargets of the normalization, independent of display universality (KZ25, proof of Proposition 2.3.3, p.12; KZ25 lines 533–544).

**Checks.**

- For G_m and μ=1, t_here¹=t_RG^(−1) is represented by p, has κ=ν=1 and satisfies pW⊂pW⊂W. The unadapted t_RG¹ is represented by p⁻¹, has κ=ν=−1 and fails p⁻¹W⊂W.
- In GL₂ with μ=(1,0), t_here^(1,0) is represented by diag(p,1), has determinant valuation 1, Hodge rank 1, length 1 and ordinary Newton slopes (1,0). Its Newton Levi is G_m×G_m and μ is central there. The unadapted diag(p⁻¹,1) has determinant valuation −1 and fails bW²⊂W²; dom(−μ)=(0,−1) gives the supplier label for the adapted admissible set.
- Slopes (1/2,1/2) have Newton average different from (1,0), so the supersingular class fails the ordinary hypothesis.
- For a torus, length is zero and every translation has ℓ(wσ(w))=0=2ℓ(w); the ordinary-class existence condition still remains. For an unramified rank-two torus with σ interchanging the split factors, λ=(1,0) gives σλ=(0,1) and t_here^λ σ(t_here^λ)=t_here^(1,1), with valuation vector (1,1). For the trivial group and μ=0 the adapted translation, its Frobenius and its square are the identity, with length and Kottwitz value zero and admissible set {1}.

*Needs:* PadicHodgeTheory §5.5; ReductiveGroupsPartII §RG2.4.3 (affine Weyl group, length and admissible set through this layer’s adapter); §2.0 (rational σ-centralizer).


### 6.1 Ordinary tensor datum

Take k=F̄_p, p>2 and the acceptable good tensor local-model datum of Layer 2, now requiring that the full fixer equals the connected parahoric. Normalize its σ-conjugacy class to b=σ(ṫ_here^(μ′)), where t_here^(μ′) is σ-straight and σ⁻¹(b) is μ_y-ordinary with its double-coset index in Adm_here(μ_y). Let M be the Newton Levi and choose the central M-cocharacter λ̃ lifting the special Hodge filtration with the normalization established in the ordinary normalization above. Its field of definition is retained as part of the datum. Very-goodness is not an extra hypothesis for the explicit ordinary construction. (KZ25, §3.4.1–3.4.2, pp.25–27; KZ25 line 1115).

The API includes the following facts.

- M is the centralizer of the Newton cocharacter in the supplied G-isocrystal theory.
- λ̃ is central in M, with the specified Hodge and field-of-definition conditions.
- Forgetting the ordinary normalization returns the marked tensor local-model datum.

**Checks.**

- For the height-two ordinary group b=σ(diag(p,1))=diag(p,1), M is the diagonal Levi, the slopes are 1 and 0, and the Hodge lattice is diag(1,p)W², reducing to ke₁.
- A height-two supersingular group is not μ-ordinary for the ordinary GL₂ Hodge type.
- A disconnected full fixer cannot be silently substituted for the connected parahoric required here.

A proof can proceed as follows. Use the ordinary class and integral conjugacy theorem of this layer, together with the supplied tensor Newton cocharacter; retain the existence condition ν=μ^⋄ for the ordinary class.

*Needs:* §2.1 (integral tensor and local-model datum); PadicHodgeTheory §5.5; ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; §6.0 (ordinary integral σ-conjugacy normalization); gap:full-fixer-cutting-tensors.


### 6.2 Central Hodge filtration in the ordinary Levi

In the ordinary normalization the special Hodge filtration lifts to an M-valued cocharacter λ̃ central in M, G-conjugate to the prescribed Hodge cocharacter. It is defined over a finite extension of the completed reflex base. For the toral local model of this central type, its chosen point yields an M-invariant direct-summand filtration after every allowed O_K extension. (KZ25, Lemma 3.4.3, p.27; KZ25 line 1168).

A proof can proceed as follows. Import the σ-straight Levi normalization and its central cocharacter. Use the one-point generic torus orbit and its flat closure to lift the special filtration. The central local-model point uses gap:scheme-local-model-representative.

*Needs:* §6.1 (ordinary tensor datum); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5; gap:ordinary-levi-full-fixer; gap:scheme-local-model-representative; gap:scheme-local-model-hodge-immersion.


### 6.3 Central ordinary Breuil–Kisin lift

Let K/K₀ be finite and contain the field of definition of λ̃. Put 𝔐=σ⁻¹*D₀⊗𝔖 and identify φ*𝔐 with D₀⊗𝔖 using the fixed ℤ_p tensor frame. Let F⊂φ*𝔐 be the inverse image of the central λ̃ Hodge summand modulo E(u), and let D₁⊂D₀ be the inverse image of its special filtration. Choose a tensor isomorphism Θ:F→φ*𝔐 lifting σ⁻¹(b/p):D₁→σ⁻¹*D₀, with the target identified by the frame. Multiplication by c_E=pE(u)/E(0) maps φ*𝔐 into F. Compose this multiplication with Θ and the frame identification φ*𝔐→𝔐 to obtain the linearized Frobenius. It has E-height at most one, specializes to (D₀,bσ) on φ*𝔐/u, preserves the Levi tensors, and realizes the central Hodge filtration. The resulting p-divisible group is an adapted ordinary lift. (KZ25, Theorem 3.4.5 and proof, pp.27–28; KZ25 line 1189; Zhou20, §4.6, proof of Proposition 4.8, pp.14–15; Zhou20 line 598).

The API includes the following facts.

- F is the inverse image of the central Hodge filtration modulo E(u).
- The tensor-preserving φ-linear map has height one and prescribed residual bσ.
- The imported classification yields the adapted lift and its chosen special-fibre identification.

**Checks.**

- The slope-zero factor has invertible Frobenius.
- The slope-one factor has the E(u) factor and correct Hodge summand.
- If λ̃ is not central in M, the assertion that every M-endomorphism preserves the modification fails, so the construction cannot be used unchanged.
- For E(0)=ap with a a unit, c_E=E(u)/a and c_E(0)=p; using E(u) alone gives ap at u=0 and changes the residual Frobenius.

A proof can proceed as follows. The elementary modification tensor torsor for M is trivial by the parahoric purity contract. Its u=0 point is the displayed σ⁻¹(b/p) map; scalar containment makes it tensor preserving. Smoothness lifts that specified point to Θ. Since E(0)/p is a unit, c_E is a unit times E(u), with c_E(0)=p. Thus its image lies in F and E(u) annihilates the Frobenius cokernel. Centrality of λ̃ makes every rational Newton-Levi endomorphism preserve the filtration. Apply the height-one classification and the canonical rational section to identify adaptedness.

*Needs:* §6.2 (central hodge filtration in the ordinary levi); ReductiveGroupsPartII §RG2.3.3 and the ordinary-Levi supplier contract; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.25; §2.2 (height-one tensor filtration lattice); §2.4 (integral tensors on the filtration lattice); gap:parahoric-disc-purity.


### 6.4 Existence of the adapted ordinary lift

For an ordinary tensor datum with assumptions (A) acceptable local model, (B) good embedding, and full fixer equal to its connected parahoric, every finite K/W(k)[1/p] containing the field of definition of λ̃ admits a (𝒢,μ_y)-adapted lift of H₀. No very-goodness hypothesis is imposed: this is the explicit central construction, not an application of the versal theorem with assumption (C) dropped. (KZ25, Theorem 3.4.5 and proof, pp.27–28; KZ25 line 1189).

A proof can proceed as follows. Check that the lift’s integral φ-invariant tensors and generic filtration satisfy exactly the independently stated adaptedness definition. Preserve the chosen field of definition and the special-fibre marking.

*Needs:* §6.3 (central ordinary breuil–kisin lift); §2.9 (adapted p-divisible deformation).


### 6.5 Rational σ-centralizer action on the ordinary lift

The explicit ordinary adapted lift can be chosen so that every element of J_b(Q_p), the σ-centralizer of b, lifts to a self-quasi-isogeny over O_K with its prescribed special-fibre action. These lifts preserve the contravariant right-action law `q_{gh}=q_h∘q_g`; inversion gives the left-action form. The assertion is in the isogeny category. It does not assert integral automorphisms for all of J_b(Q_p), a unique lift, or an action on an arbitrary adapted deformation. (KZ25, Theorem 3.4.5 and proof, pp.27–28; KZ25 line 1183).

A proof can proceed as follows. The basic M-isocrystal identifies J_b with the relevant inner form of M. Its rational endomorphisms preserve the central λ̃ filtration, hence the height-one module after inverting p. Full faithfulness of the integral classification up to isogeny transfers them to quasi-isogenies of the lift.

**Checks.**

- For H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p and the central element p∈J_b(ℚ_p), the lift is multiplication by p, an isogeny of height 2 with D(q_p)=p; it is not an automorphism, since p is not a unit of W.
- For g,h∈J_b(ℚ_p), D(q_h∘q_g)=D(q_g)D(q_h)=gh=D(q_(gh)) because D is contravariant, so the lifts satisfy q_(gh)=q_h∘q_g.
- For b=diag(p,1), J_b(ℚ_p)=(ℚ_p×)² acts on the two lines separately; an off-diagonal element of GL₂(ℚ_p) is not in J_b(ℚ_p) and is not lifted.

*Needs:* §6.4 (existence of the adapted ordinary lift); §6.3 (central ordinary breuil–kisin lift); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.10–R07.2.12; §2.0 (rational σ-centralizer).


### 6.6 Adapted lift compatible with a specified Levi filtration

Let M⊂G be a reductive subgroup containing b, whose fixer intersection is the specified parahoric, and suppose the special Hodge filtration lifts to an M-valued cocharacter G-conjugate to μ_y. If its M-embedding has the very-good infinitesimal compatibility of §4.7 and the tensor-frame hypotheses, an M-adapted lift is also G-adapted and its étale tensors extend the G-tensor family. This supplies the p-divisible input used by van Hoften; existence of that M-filtration and any global component-surjectivity theorem are separate inputs. (Zhou20, Author arXiv v 2, §5.5, pp.18–19; Zhou20 line 753; vanHoften24, AppendixA.4.3, pp.64–65; vanHoften24 line 2799).

A proof can proceed as follows. Enlarge the invariant tensor family to cut out M. Apply §4.12 under (A)–(C) of §4.10 for M, compare the M and G local-model filtration maps, and forget the extra tensors. This retains the filtration assumption in Zhou; the general basic-Levi application cannot be inferred just from the μ-ordinary case.

*Needs:* §4.12 (versal adapted deformation theorem); §4.4 (integral crystalline and witt tensor comparison); §4.14 (recognition from integral étale tensors); ReductiveGroupsPartII §§RG2.3.3 and RG2.3.5.


### Examples

For H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p and E(u)=u−p, the central construction gives the two Frobenius multipliers −E(u) and 1 after a compatible choice of Θ. Their residual multipliers are p and 1. The element p of J_b(ℚ_p) acts as a quasi-isogeny of height 2, while its inverse is not an integral automorphism.


### Dependencies

Layers 0–2 and 4–5; ReductiveGroupsPartII §§RG2.1.5, RG2.3.3, RG2.3.5 and RG2.4.3; PadicHodgeTheory §5.5; the ordinary-Levi and purity contracts. The explicit ordinary lift uses no very-goodness hypothesis.

## Downstream consumers

The tensor-display deformation and ordinary-lift theorems supply Hodge-type integral moduli and the local p-divisible input to canonical-lift applications. The rational σ-centralizer construction, ordinary normalization and Breuil–Kisin component comparison supply subsequent Newton and local-shtuka developments. These consumers receive the explicit good, very-good, connected-fixer, integral-type and field-of-definition hypotheses of the relevant theorem. The ordinary theorem supplies no nonordinary Levi-filtration existence result.

## Worked examples

For M=Se₁⊕Se₂ and M₁=Se₁⊕Ie₂, preservation forces the lower-left matrix coefficient into I. The tilde map sends the upper-right coefficient b to pφ(b) and a lower-left Vε to ε. On dual numbers the graph Z=Vε therefore gives c=1+εE₂₁. In characteristic p, diag(1,p) sends e₂ to zero, so the comparison square cannot recover this lower-left coefficient. It is recovered by relative-frame factorization (KPZ26, (5.1.3), Lemma 5.1.15 and (5.1.18), pp.48–52; KPZ26 lines 2124 and 2227).

For H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p in that order, the slopes are 1 and 0 and Fil¹ is the multiplicative line. The Eisenstein modification is 𝔖e₁⊕E(u)𝔖e₂. Its central diagonal Levi preserves the filtration, producing an adapted ordinary lift. The element p in J_b(ℚ_p) lifts as a self-quasi-isogeny; multiplication by p is not an integral unit automorphism of this nonzero group. The dual Tate lattice and twist convention give F=pσ on the multiplicative factor and σ on the étale factor (KZ25, Theorem 3.4.5, pp.27–28; KZ25 line 1189; Kisin17, §1.1.5–1.1.9, pp.7–9; Kisin17 line 325).

For G_m a change of the linear dual Tate lattice by p specializes to the crystal lattice pW, hence κ=1 at both ends. Requiring the specializing matrix to lie in G(W) would give κ=0 and contradict this example. For GL₂, take b=diag(p,1) and the permutation interchanging e₁ and e₂. Conjugating b by that permutation changes the Hodge kernel from ke₁ to ke₂. The Frobenius double coset still has elementary divisors (p,1); it cannot fix a separately chosen coordinate Hodge line (Kisin17, Lemmas 1.1.12 and 1.2.18, pp.9 and 15–16; Kisin17 lines 405 and 697; KZ25, §3.4.1, p.26; KZ25 line 1139).

For a ramified reflex DVR with p=aπ_E², a∈O_E×, the quotients by m²+p and by m²+π_E are respectively O_E/(π_E²) and k. The element π_E is nonzero in the first and zero in the second. Reducing just one side of c to the second quotient does not even give an equality in one module. Reducing both sides gives the first-order tensor equation c(s̃₀)=s̃ over Ŵ(k) in this example (KPZ26, (5.2.2), pp.53–54; KPZ26 line 2330).

## References

All statements are in the conventions above. The locators specify the editions used; a locator of the form `<key> line N` refers to the line-numbered text extraction of the edition listed under that key.

- **KPZ26.** Mark Kisin, Georgios Pappas and Rong Zhou, [Integral models of Shimura varieties with parahoric level structure, II](https://doi.org/10.1017/fmp.2026.10031), Forum of Mathematics, Pi 14 (2026), e14, 89-page published version. §§3.1–3.4, 4.1–4.4, 5.1–5.3, 6.1–6.3, 7.1.3–7.1.6 and 7.3.1–7.3.2.
- **KP18.** Mark Kisin and Georgios Pappas, [Integral models of Shimura varieties with parahoric level structure](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf), Publications Mathématiques de l'IHÉS 128 (2018), 121–218. §§3.1–3.3, pp.162–182, and §4.1.7, p.184, with the relative-frame construction and very-good hypothesis of KPZ26.
- **KZ25.** Mark Kisin and Rong Zhou, [Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/abs/2103.09945v2), arXiv v2, 7 October 2024, 63 pages; published Annals of Mathematics 202 (2025). The locators here are v2 §§2.1–2.3 and 3.1–3.4, including Definition 3.2.4, Proposition 3.2.7, Lemma 3.4.3 and Theorem 3.4.5.
- **Kisin17.** Mark Kisin, [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), author version dated 27 August 2016, 99 pages; Journal of the American Mathematical Society 30 (2017), 819–914. Author §§1.1–1.2, 1.3.9, 1.4.5–1.4.6, proof of Theorem 2.2.3 and Errata E.1–E.4, p.96.
- **Zhu17.** Xinwen Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Annals of Mathematics 185 (2017), 403–492. §3.2 and proof of Proposition 3.11, pp.460–463.
- **vanHoften24.** Pol van Hoften, [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf), Forum of Mathematics, Pi 12 (2024), e20, published 67-page version. Example 2.2.10, p.14; §§3.1.5–3.1.7, pp.27–28; Appendix A.4.3, pp.64–65.
- **Hoff23.** Manuel Hoff, [On parahoric (G,μ)-displays](https://arxiv.org/abs/2311.00127v1), arXiv v1 (2023), 37 pages. §§1.1–1.5, 2.1 and 2.3, especially Assumption 2.28 and Theorem 2.36.
- **Lau14.** Eike Lau, [Relations between Dieudonné displays and crystalline Dieudonné theory](https://msp.org/ant/2014/8-9/ant-v8-n9-p04-p.pdf), Algebra & Number Theory 8 (2014), 2201–2262. Abstract, p.2201; Lemma 2.4, p.2216; Theorem 5.3 and Corollaries 5.5–5.6, pp.2243–2244.
- **Anschuetz22.** Johannes Anschütz, [Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/abs/1804.06356v2), arXiv v2, 21 October 2020; Journal für die reine und angewandte Mathematik 783 (2022), 227–268. Proposition 10.3 and proof, author p.33.
- **Wintenberger97.** Jean-Pierre Wintenberger, [Propriétés du groupe tannakien des structures de Hodge p-adiques et torseur entre cohomologies cristalline et étale](https://aif.centre-mersenne.org/item/10.5802/aif.1600.pdf), Annales de l'Institut Fourier 47 (1997), 1289–1334. §0, p.1293; §4.5.2, Proposition 4.5.3 and its following unnumbered corollary, pp.1330–1332.
- **Zhou20.** Rong Zhou, [Mod p isogeny classes on Shimura varieties with parahoric level structure](https://arxiv.org/abs/1707.09685v2), arXiv v2, February 2018; published 2020. The locators here use v2 §4.6, proof of Proposition 4.8, pp.14–15, and §5.5, pp.18–19. The M-valued filtration hypothesis is retained.
- **RG71.** Michel Raynaud and Laurent Gruson, [Critères de platitude et de projectivité. Techniques de platification d’un module](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0013/PPN356556735_0013.pdf), Inventiones Mathematicae 13 (1971), 1–89. I, Theorem 4.1.2, p.27.
- **deJong95.** A. Johan de Jong, [Crystalline Dieudonné module theory via formal and rigid geometry](https://www.numdam.org/item/PMIHES_1995__82__5_0/), Publications Mathématiques de l’IHÉS 82 (1995), 5–96. Proposition 7.3.6, pp.89–90.
- **RZ96.** Michael Rapoport and Thomas Zink, [Period Spaces for p-divisible Groups](https://doi.org/10.1515/9781400882601), Annals of Mathematics Studies 141 (1996), Proposition 1.21, the toral criterion of §5.3, as applied in Kisin17, proof of Theorem 2.2.3, p.32 (Kisin17 line 1455).
