# Roadmap: cohomology comparisons, part II — classical syntomic producers and relative open-curve coefficients

**Summary.** Build classical rigid and divided/undivided log-syntomic cohomology from shared rigid, crystalline, de Rham and enhanced derived realizations. Construct period maps with separate exact small-weight and bounded all-weight conclusions, adapters to the shared Hyodo–Kato and rational h-descent realizations, and a relative library of filtered Frobenius connections, strict extensions, open-curve residues and Frobenius-point specialization. The endpoints are the classical comparison interfaces and the absolute syntomic value of a relative extension; symbols, regulators and integration formulas consume these interfaces.

## Scope and ownership

This continues CohomologyComparisons. Its §§1.11,3.7 own the prismatic syntomic coefficient interface and Beilinson square; §§4.2–4.5 own common semistable comparison and normalization; §4.8 owns algebraic h-realizations and their general period comparison; §6.3 owns the relative filtered period adapter. Its §§2.14,6.3 supply absolute and relative algebraic filtered de Rham realizations through `relative-hodge`. This Part II owns classical rigid and divided/undivided logarithmic syntomic producers, their maps to those shared realizations, and the AM relative filtered Frobenius category, strict extensions, evaluation, residues and compatible-point specialization. Classical syntomic h-descent and periods on broader domains enter through the explicit extension contracts below. They do not create a second h-theory here.

CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.5, CR.5.1–CR.5.4 own log geometry, log crystalline coefficients, their differential presentations and completion; §§CR.6.1–CR.6.2 own proper HK cohomology, its Frobenius–monodromy relation, comparison and uniformizer change. Section 5.1 here keeps only transport of those supplied operators into Mathlib's isocrystal carrier. PadicPeriodRings §§3,4.1–4.3 own coefficient period rings, embeddings and fundamental identities. PadicHodgeTheory §§1.1–1.5,2.1–2.4 own the local period-sheaf framework; the chart-level analytic and Galois extensions are spelled out as individual contracts.

PadicDifferentialEquationsAndRigidCohomology §§RD.3.13,RD.3.25,RD.3.28–RD.3.32 own general overconvergent Frobenius connections and change of lift; §§RD.4.5–RD.4.11,RD.4.18,RD.4.23–RD.4.24,RD.4.31 own rigid cohomology, its independence, absolute continuous-form comparison and scalar extension; §RD.5.115 owns liftable proper smooth direct images. Its §§RD.5.107–RD.5.109 supply relative log convergent/crystalline perfectness; its §RD.6.88 supplies the finite-field curve Gysin sequence. The variants here retain algebraic Hodge filtration, strict exactness and relative residue/evaluation, with the stronger domains of the stated contracts. They do not reconstruct those unfiltered theories.

AdicSpacesPartIV §§F1.5,F1.7–F1.9,F1.12,F1.16 own weak completions, dagger geometry, coherent acyclicity, continuous differentials and logarithmic complexes; RigidAnalyticGeometry §§6.1–6.2,7.3–7.4,8.1,8.4 own classical rigid sites, analytification and proper GAGA. Section 6.5 here keeps the relative direct-image edge comparison, rather than a second affinoid coherent-vanishing theorem. EnhancedDerivedSheaves §§0.1–0.4,E2:towers.1,E5:abstract own enhanced fibres, tensors and inverse limits. EtaleCohomologyFoundations §§F.0.3,F.1,F.3a,F.4.1–F.4.5 own Tate sheaves and étale realizations. DerivedModuleAlgebra §0.K.1 owns scalar-sequence Koszul complexes; AInfCohomology §AI.1.7 owns cochain Koszul complexes of commuting module endomorphisms. The arithmetic semidirect-product totalization and its continuous-cohomology comparison enter through `local-period-koszul-resolution`.

Mathlib's mapping cone, semilinear isocrystals, abelian Ext, de Rham period-ring completion carriers and p-adic integer scalar action are already in the library. Tau Ceti's Quillen exact structures, opposite and monoidal exact structures, conflation-exact functors and cone contractibility theorem are already in the library. Their precise declarations are supplier contracts below. Tau Ceti's standard syntomic algebra predicate concerns morphisms and does not provide cohomology. GrothendieckEulerForms Layers 0 and 5 state the general exact-structure and abelian Ext boundaries; general exact-category Yoneda theory enters through `exact-yoneda`, without an abelian instance on FilFMIC.

ColemanIntegration §L3.Fb.1 owns modified syntomic cohomology, its Frobenius-iteration direct limit and its normalized rigid identification; §L3.Fb.2 owns its syntomic Chern character. The rigid syntomic complex of Layer 2 here retains the arithmetic K0-to-K comparison diagram and algebraic Hodge filtration, rather than that modified direct-limit theory. PrismaticCohomologyPartIII §§6.9,6.29–6.32 owns animated and prismatic syntomic cohomology and its étale comparison; the classical complexes here use logarithmic crystalline PD ideals.

PadicHodgeRegulators owns symbol-to-Ext, Milnor relations, tame-symbol comparison and regulator equality. Its AM Theorem 3.7 application keeps W(k), projective log-smooth f:(Y,M)→(Q,L), smooth affine Q with reduced relative simple normal-crossings T, smooth Y with reduced relative simple normal-crossings D, affine S=Q−T and U=Y−(D∪f⁻¹T), both total and relative horizontal boundary conditions, compatible log-Frobenius lifts at every level, all-degree coherent relative rigid cohomology, 0≤n<p−1, and vanishing of H^n and H^(n+1) of the relative log complex ω^(≥n+1) modulo every p^m, m>0. Its sign is (−1)^n. Its curve application keeps p>2, connected fibres, finite étale horizontal boundary and vertical multiplicities prime to p (AM Theorem 3.7 and §4.1, AM line 1185, AM line 1200, AM line 1432, AM line 1445, AM line 1644). These consumer restrictions do not narrow the classical producers. ColemanIntegrationPartII owns integration, index and branch formulas, and EllipticRegulators owns special-value applications.

## Conventions

Let p be prime, V a complete mixed-characteristic (0,p) discrete valuation ring with perfect residue field k, K=Frac(V), K0=Frac(W(k)) and e=[K:K0]. No finiteness of k is assumed. Complete rings are separated. The structural embedding W(k)→V is retained. Canonical log structure on V means the closed-point log structure; X_tr denotes the locus of trivial log structure. The AM horizontal-log pair (Y,D) in 7.4 is instead over trivial-log W(k) and does not add Y0 to D. Adding the vertical log structure changes the syntomic producer, as the weight-one point Check in 7.4 shows. X0 is the special fibre; X_n means reduction modulo p^n, not modulo π^n. Fine, saturated, integral, log-smooth and Cartier-type hypotheses are stated separately at their uses (NN §1.5 and §2.3, NN line 360, NN line 521; CN §1.1.1, CN line 54).

Only the relative AM setting assumes an endomorphism F_V with F_V(x)≡x^p modulo pV and a compatible p-Frobenius σ on B† for S=Spec(B). This is the source’s strong modulo-p condition, not merely reduction modulo the maximal ideal. In a ramified trait it is obstructed: writing p=uπ^e, any such endomorphism sends π to valuation 1, whereas π^p has valuation p, so their difference has valuation 1<e when e>1. The concrete π²=p negative control is attached to 1.1. All-prime ramified classical targets in Layers 2–5 require no such F_V (AM standing assumptions, AM line 117).

Use cochain degrees in ℤ and d of degree +1; A[1]^q=A^(q+1). In explicit fibre coordinates, Fib(f)^q=A^q⊕B^(q−1) and d(a,b)=(da,f(a)−db). Give an explicit coordinate isomorphism to Mathlib’s cone[-1]; do not identify signs by notation. Multiplication 2 on ℚ gives [ℚ —2→ ℚ] in degrees 0,1, and the fibre connecting image of b is (0,b). These witnesses are Checks in 1.4 and 7.5. Products use the cohomological Koszul sign. Statements about products on cohomology do not demand a strictly commutative integral cochain algebra (EN §2.1.2, EN line 219; NN §3.2, NN line 1320).

S_n is EN’s divided fibre; S′_n is its undivided fibre. NN and CN use S_n for the latter. Integral Tate lattices are actual lattices inside ℚ_p(r) and finite coefficients mean L/p^nL. The fundamental-sequence kernel lattice is L_EN(r)=(p^a a!)⁻¹ℤ_p(r), a=floor(r/(p−1)), for every r≥0 (NN line 2324–2326; EN line 306). CN prints p^(−a)ℤ_p(r); §4.1 retains that printed coordinate lattice as L_CN, without asserting a period map into it. At p=2,r=2 its generator differs from the kernel generator by 2; no finite-level inverse is implicit (CN line 67–69, CN line 968–971).

O(m) has Frobenius p^(−m)σ and filtration jump −m. Thus φ(dlog t)=p dlog t and H¹(G_m)=O(−1). HK monodromy has Nφ=pφN and the change from π to πu composes ι_π with exp(log(u)N), on the HK side with a positive sign. On φe0=e0, φe1=p e1, Ne1=e0, changing π sends e1 to e1+log(u)e0, and the lower map in the semistable square is 1−φ/p^(r−1), including 1−pφ at r=0. The HK operator in this sentence is CrystallineCohomology §§CR.6.1–CR.6.2’s positive-Taylor operator N_c. The `rational-descent` contract requests the shared negative evaluation convention; transport to N_base,raw=−N_c and N_base,norm=−N_c/e; its formula exp(−e log(u)N_base,norm) is then exp(log(u)N_c). Section 5.2 supplies the corresponding chain adapter. Residue uses Res_0(dlog t)=1, Res_∞(dlog t)=−1. These are the two-term and curve Checks in 2.3,5.1,5.2,6.6 (AM line 181; HK line 770, HK line 1340; NN line 1366; AM line 595).

Work in fixed object and hom universes, enlarging for sheaves when necessary. Form Yoneda groups through an essentially small model of the exact coefficient category and prove model independence. Scalar extension and comparison maps carry their actual scalar towers. Frobenius-semilinear maps over K0 and F_V-semilinear maps over K become ℚ_p-linear maps when taking syntomic fibres. No K0-linearity is asserted for 1−φ/p^r. Zero modules and empty schemes are allowed; V, K and K0 are nonzero by the field/DVR hypotheses. Coordinate rings of empty charts and weak completions of generic-only components may be zero.

Suggested declaration homes are the ordinary TauCeti cohomology, exact-category and coefficient namespaces.

## Exact supplier contracts

### From Mathlib

The pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

- `CochainComplex.mappingCone` in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean`, with `mappingCone.inl`, `inr`, `fst` and `snd`, supplies the cochain cone. Its source requires a preadditive category and the relevant binary biproducts; the comparison here fixes explicit fibre coordinates (MathlibCone line 61, MathlibCone line 76, MathlibCone line 80, MathlibCone line 84, MathlibCone line 92).
- `WittVector.Isocrystal`, `WittVector.IsocrystalHom` and `WittVector.IsocrystalEquiv` in `Mathlib/RingTheory/WittVector/Isocrystal.lean` supply modules over FractionRing(WittVector p k) with bijective Frobenius-semilinear map, and equivariant linear maps. They require p prime, a characteristic-p perfect domain k. Apply them here with k a perfect field. The one-dimensional classification also needs k algebraically closed and finrank=1; it is not used as a finite-dimensional HK theorem (MathlibPin line 77, MathlibPin line 117, MathlibPin line 136, MathlibPin line 142, MathlibPin line 184).
- `CategoryTheory.HasExt` and `CategoryTheory.Abelian.Ext` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` require an abelian category. They are the compatibility target for the general Yoneda supplier, not a construction of exact-category Ext (MathlibExt line 53, MathlibExt line 59, MathlibExt line 122).
- `BDeRhamPlus R p` and `BDeRham R p` are global declarations in `Mathlib/RingTheory/Perfectoid/BDeRham.lean`. Their binders are `[CommRing R]`, `[Fact p.Prime]`, `[Fact (Not (IsUnit (p : R)))]` and `[IsAdicComplete (Ideal.span {(p : R)}) R]`. They provide the completion and localization carriers; the period-rings contract extends or specializes these carriers with the filtration, comparison and fundamental-sequence API specified in the period-rings contract (MathlibBDeRhamReview line 55, MathlibBDeRhamReview line 79, MathlibBDeRhamReview line 92).

`PadicInt.algebra`, `PadicInt.algebraMap_apply` and `PadicInt.isFractionRing` in `Mathlib/NumberTheory/Padics/PadicIntegers.lean` give the actual ℤ_p-action on ℚ_p for `[Fact p.Prime]` (MathlibPadicLattice line 580–588). The coordinate lattices in §4.1 use `Submodule.span` on these carriers. Coordinate spans use the chosen Tate generator; they do not replace a Tate local system or its Galois action. `LinearEquiv.toSpanNonzeroSingleton` and `Submodule.span_singleton_eq_span_singleton` in `Mathlib/LinearAlgebra/Span/Basic.lean` give generator coordinates and unit invariance (MathlibSpanReview line 241–254, MathlibSpanReview line 895–906). `PadicInt.toZModPow` and `PadicInt.ker_toZModPow` in `Mathlib/NumberTheory/Padics/RingHoms.lean` identify reduction of those coordinates with ℤ_p/(p^n); `ZMod.ringHom_surjective` supplies surjectivity (MathlibPadicReductionReview line 354–355, MathlibPadicReductionReview line 450–464). In the weight-two Check each lattice is identified with ℤ_2 by its nonzero generator, and both reduced lattices are the nonzero model `ZMod 2`; the inclusion has generator coordinate 2, so its induced linear map is zero modulo 2.

`LinearMap.fst`, `LinearMap.snd` and `LinearMap.prod` in `Mathlib/LinearAlgebra/Prod.lean`, on modules over a semiring, give the product maps used by the coordinate witnesses (MathlibLinearProd line 48–104). Their scalar actions, sums and compositions are the ordinary linear-map operations; the coordinate formulas in §§1.4,5.2 select the syntomic differentials and their signs.

### From Tau Ceti

The pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `CochainComplex.mappingCone.nonempty_homotopy_id_zero_of_homotopyEquiv` in `TauCeti/Algebra/Homology/HomotopyCategory/MappingCone.lean` supplies contractibility of the cone of a homotopy equivalence over a preadditive category with a zero object and binary biproducts; it verifies the degenerate fibre comparison (TauCetiCone line 40, TauCetiCone line 53). `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` in `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean` is a flat finite-presentation/fibre-dimension predicate and is a checked ownership boundary, not a cohomological supplier (TauCetiSyntomic line 79, TauCetiSyntomic line 85).

`TauCeti.ExactStructure C` in `TauCeti/CategoryTheory/Exact/ExactStructure.lean` requires `[Category C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]` and bundles a chosen Quillen exact structure. `TauCeti.ExactStructure.IsConflationExact E E' F` in `TauCeti/CategoryTheory/Exact/Functor.lean` requires these additive-category binders on C and D, chosen structures E,E′ and an additive functor F:C⥤D; it asserts preservation of their conflations (TauCetiExactReview line 245–267; TauCetiExactFunctorReview line 68–81). The Ext API in `TauCeti/Algebra/Homology/Ext/Basic.lean` requires `[Abelian C] [HasExt C]`; it cannot instantiate the general Yoneda contract on FilFMIC (TauCetiExtReview line 54).

`TauCeti.ExactStructure.IsMonoidal E` in `TauCeti/CategoryTheory/Exact/Monoidal.lean` has the same additive-category binders together with `[MonoidalCategory C] [MonoidalPreadditive C]`; its fields `isConflationExact_tensorLeft` and `isConflationExact_tensorRight` assert preservation of E-conflations by tensoring with each fixed object (TauCetiExactMonoidal line 48–57). `TauCeti.ExactStructure.op E` in `TauCeti/CategoryTheory/Exact/Opposite.lean` uses the additive-category binders and supplies the opposite exact structure; `op_conflation_op_iff` identifies its conflations with opposites of E-conflations (TauCetiExactOpposite line 150–155, TauCetiExactOpposite line 201–203).

The contracts fix the interfaces consumed by this build. A section citation identifies the owner's mathematical scope. A stronger domain explicitly specified below is an extension requirement on that owner; it is not an assertion that the cited section contains the stronger theorem. The contracts are prerequisites, rather than replacement constructions in these layers.

`TauCeti.ChainComplex.linearYonedaFunctor` in `TauCeti/Algebra/Homology/LinearYoneda.lean` forms Hom cochain complexes in an additive linear category, and `shortExact_map_linearYonedaFunctor` requires degreewise splitting in its abelian context. This is the Hom-complex boundary of `exact-yoneda` (TauCetiLinearYonedaReview line 51–60, TauCetiLinearYonedaReview line 79–105).

### From TauCetiRoadmap.AdicSpacesPartIV

AdicSpacesPartIV §F1.5, §F1.7, §F1.8, §F1.9, §F1.12, §F1.16: Weak completions, dagger coherent modules, strict neighbourhoods, continuous differentials and logarithmic complexes.

### From TauCetiRoadmap.RigidAnalyticGeometry

RigidAnalyticGeometry §6.1, §6.2, §7.3, §7.4, §8.1, §8.4: Classical rigid sites, coherent/proper cohomology, analytification and proper GAGA; not general open-family coherence.

### From TauCetiRoadmap.EnhancedDerivedSheaves

EnhancedDerivedSheaves §§0.1–0.4, §E2:towers.1, §E5:abstract: Enhanced sheaves, coherent homotopy fibres and limits, tensor products and inverse towers.

### From TauCetiRoadmap.EtaleCohomologyFoundations

EtaleCohomologyFoundations §F.0.3, §F.1, §F.4.1–§F.4.5: Tate twists and derived/adic étale realizations; nearby-cycle-inputs, nearby-cycle-cartier and nearby-cycle-graded record the extra contracts.

### From TauCetiRoadmap.DerivedModuleAlgebra

DerivedModuleAlgebra §0.K.1: Scalar-sequence Koszul complexes, their signs, maps and tensor rules.

### From TauCetiRoadmap.AInfCohomology

AInfCohomology §AI.1.7 `Decalage.koszulComplex`: Cochain Koszul complexes of pairwise commuting linear endomorphisms of modules or cochain complexes over a commutative ring, with intertwining maps, exterior signs, iterated-fibre description and comparison with scalar-sequence cochain duals. In the ordered two-variable basis, d⁰(m)=(g₁m,g₂m) and d¹(a,b)=g₁b−g₂a. The Γ′_R directions in contract `local-period-koszul-resolution` use this carrier; the arithmetic Γ_R direction requires its separate twisted totalization (CN §4.2, pp. 39–41, CN line 1824–1942).

### From TauCetiRoadmap.CohomologyComparisons

**`rigid-syntomic-etale-period`.** Let p be any prime, k a perfect field of characteristic p, V=W(k), K=Frac(W(k)), Y projective smooth over V, D a relative normal-crossings divisor, M the horizontal log structure from D alone over trivial-log V, and U=Y−D. For every i∈ℤ and r≥0, supply the rational periods H^i_rsyn(U,r)→H^i_et(U_K,ℚ_p(r)) and H^i_log-syn((Y,M),ℚ_p(r))→H^i_et(U_K,ℚ_p(r)), compatible with products and pullback along morphisms of these horizontal-log pairs, and their commutative square under the realization comparison of AM Lemma 3.10, equations (3.10)–(3.12), pp. 29–30 (AM line 1302–1334). Section 4.2 constructs finite-level horizontal-log maps on the larger log-syntomic W(k) domain; the rational comparison square requested here is on these projective pairs. Consume CohomologyComparisons §4.8, classical rational syntomic period extension on this domain. For k=𝔽_p, KLZ Theorem 2.4.2(1) and Remark 2.4.3, pp. 6–7 (KLZ line 291–315) give the smooth-pair period and explain why BesserI Corollary 9.10 cannot supply a period on every smooth quasi-projective V-scheme. AM Lemma 3.10 supplies the horizontal-pair period square over general W(k); the canonical-vertical-log comparisons of 4.3–4.5 concern a different log structure. The rigid-syntomic construction of Layer 2 retains its full smooth separated finite-type V-domain.

**`relative-hodge`.** On the two geometric domains of 6.4, establish the independent algebraic hypotheses of 6.2 on actual algebraic de Rham cohomology, using the proper or logarithmic compactification complex; AM Assumption 2.20 alone gives none of these algebraic finiteness conclusions. For the smooth projective curve X/S with finite étale D of 6.6, require the logarithmic de Rham residue/Gysin sequence to be strict for the Hodge filtration, horizontal, compatible with scalar extension and traces. AM Definition 2.1, Propositions 2.15,2.17,2.18, AM line 131, AM line 510–607. The full-domain datum of 6.1 needs no finiteness theorem. The interface consumed from CohomologyComparisons is: For smooth affine S over an AM base and either projective smooth u or the full good compactification of 6.3, supply finite algebraic H^i_dR, a finite exhaustive separated Hodge filtration with finite locally free graded pieces, integrable Gauss–Manin connection, Griffiths transversality, horizontal comparison and filtered base change for every i≥0; for projective smooth relative curves X/S with finite étale boundary D, supply the strict horizontal filtered logarithmic residue/Gysin sequence with traces and scalar extension. For smooth separated finite-type T over any characteristic-zero field L, supply F^rRΓ_dR(T/L), r∈ℤ, from smooth proper normal-crossings compactifications, with filtered independence, products, finite Čech descent and scalar extension; over L=K this is the absolute specialization S=Spec(V) of the relative realization (BesserI Definition 5.1, BesserI line 648–662). Consume CohomologyComparisons §§2.14,6.3, algebraic relative Hodge and strict residue extension. (AM Definitions 2.1,2.12 and Propositions 2.15,2.17–2.18; AM line 131, AM line 451, AM line 512, AM line 567, AM line 587).

**`rational-descent`.** The h-topology on reduced separated finite-type K-varieties, arithmetic pairs as dense open interiors of reduced proper flat V-models with induced boundary log structure, semistable h-bases, enhanced rational syntomic h-realization and uniqueness, arithmetic and geometric period maps, product compatibility and equivalence after τ≤r for r≥0. The classical-pair comparison for fine log-smooth Cartier-type arithmetic pairs and r≥0 is NN Proposition 3.18, p. 33, NN line 1688–1691. NN Theorem A(1),(4), Proposition 4.6 and Corollary 4.11 are reserved to the base owner. This extension compares its classical producers to that realization; it does not rebuild h-descent or prove a second semistable comparison theorem. The interface consumed from CohomologyComparisons is: For fine log-smooth Cartier-type arithmetic pairs and r≥0, supply the canonical classical-to-h quasi-isomorphism of NN Proposition 3.18; for reduced separated finite-type K-varieties, supply rational syntomic h-descent and the product-compatible arithmetic/geometric τ≤r period comparisons of NN Theorem A(1),(4), Proposition 4.6 and Corollary 4.11. On the shared semistable carrier, supply the identification with the negative normalized convention N_base,norm=−N_c/e and its change law exp(−e log(u)N_base,norm)=exp(log(u)N_c), compatible with φ and the de Rham projection; N_c is the positive-Taylor operator of HK Theorem 5.1 (HK line 1340). Consume CohomologyComparisons §4.8, rational syntomic h-realization extension. (NN Theorem A(1),(4) ownership contract; NN Proposition 3.18, p. 33).

### From TauCetiRoadmap.CrystallineCohomology

**`crystalline-inputs`.** The site carriers include fine, integral and saturated log structures without conflating these conditions; the coefficient assertions below concern log-syntomic X/W(k), including the local presentations used over V. The Frobenius-divisible J^⟨r⟩ and divided Frobenius are constructed in 3.1, not requested here (EN §2.1, pp. 4–5, EN line 150–165, EN line 198–218). The interface consumed from CrystallineCohomology is: For k perfect of characteristic p, V a complete mixed-characteristic DVR with residue k, n≥1 and r∈ℤ, supply fine, integral and fs log-scheme carriers and log-crystalline and log-syntomic sites over W(k), canonical-log V and fine integral log arithmetic pairs, and, for X log-syntomic over W(k), the sheaves O_cr,n=H⁰_cr(X_n,O) and J_n^[r]=H⁰_cr(X_n,J^[r]) with J^[r]=O for r≤0, their Z/p^n-flatness, J_(n+1)^[r]⊗ᴸ_(Z/p^(n+1))Z/p^n≃J_n^[r] (also for O_cr), the Frobenius-compatible equivalence RΓ(X_n,syn,J_n^[r])≃RΓ_cr(X_n/W_n(k),J^[r]), and filtered log-PD de Rham presentations for local exact immersions into log-smooth W(k)-schemes with compatible Frobenius lifts, natural under refinement and étale descent. Consume CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.5, CR.5.2–CR.5.4 and CR.3.2, with the log-syntomic coefficient extension. (EN §2.1 and §2.1.1, pp. 4–5).

**`crystalline-filtered-quotient`.** Arithmetic pairs have dense open K-interior U in reduced proper flat Ubar/V, with its fine integral quasi-coherent boundary log structure. The comparison is of filtered quotients, and does not replace them by unfiltered cohomology (NN line 475–487, NN line 1299–1338). The interface consumed from CrystallineCohomology is: For V a complete mixed-characteristic DVR with perfect residue field k, fine proper log-smooth X over canonical-log V and r≥0, including such arithmetic pairs (U,Ubar), supply the canonical rational equivalence RΓ_cr(X/W(k),O/J^[r])_Q≃RΓ_log-dR(X_K/K)/F^r compatible with the quotient maps, products within each fixed-r quotient and pullback, and for the arithmetic-pair crystalline coefficient complexes supply derived p-completeness and RΓ_cr(J^[r])⊗ᴸZ/p^n≃RΓ_cr(J^[r])_n and RΓ_cr(O)⊗ᴸZ/p^n≃RΓ_cr(O)_n for n≥1. Consume CrystallineCohomology §CR.5.4, filtered quotient and arithmetic-pair reduction extension. (NN Corollary 2.4, p. 10, and §3.2 equation (32), pp. 25–26).

**`hyodo-kato-proper`.** The uniformizer comparison and its change law are on the supplied proper cohomology carrier; HK line 698, HK line 715, HK line 770, HK line 1321, HK line 1340. The interface consumed from CrystallineCohomology is: For proper fine log-smooth X over the canonical log mixed-characteristic DVR V with perfect residue field and Cartier-type special fibre, supply finite-dimensional H^q_HK over K0 with bijective semilinear φ, nilpotent N satisfying Nφ=pφN, and ι_π:H^q_HK⊗K≃H^q_log-dR with ι_(πu)=ι_π∘exp(log(u)N) for every q≥0 and u∈V×. Consume CrystallineCohomology §§CR.6.1–CR.6.2. (HK §§3.2–3.6, pp. 243–246, Theorem 5.1, pp. 262–263).

**`arithmetic-pair-deformation`.** This interface includes NN line 1341–1383 and applies to arithmetic pairs with nonproper interior; the proper cohomology theorem alone supplies no such enhanced triangle. The interface consumed from CrystallineCohomology is: For a fine integral quasi-coherent log arithmetic pair (U,Ubar) log-smooth over canonical log V and of Cartier type, supply enhanced rational RΓ_HK and RΓ_cr over the log PD deformation base, the distinguished N-triangle from absolute to deformation cohomology, and the Frobenius-equivariant section ι_π with its de Rham projection and uniformizer-change coherence used in NN Proposition 3.8. Consume CrystallineCohomology §§CR.6.1–CR.6.2, CR.6.4–CR.6.5, enhanced arithmetic-pair deformation extension. (NN §3.1 and Proposition 3.8, pp. 26–27).

### From TauCetiRoadmap.PadicPeriodRings

**`period-rings`.** Extend or specialize Mathlib BDeRhamPlus R p and BDeRham R p on the binders recorded above (MathlibBDeRhamReview line 55, MathlibBDeRhamReview line 79, MathlibBDeRhamReview line 92). Frobenius on crystalline and semistable rings satisfies φ(t)=pt; monodromy on B_st satisfies Nφ=pφN with the HK convention. No Frobenius or monodromy operator on B_dR is stipulated. The interface consumed from PadicPeriodRings is: For V a complete mixed-characteristic DVR with perfect residue field and the geometric period coefficients over a completed algebraic closure of K=Frac(V), supply A_cris, B_cris, B_st and their comparison embeddings into B_dR, the induced filtrations, t and Tate coordinates, Frobenius on A_cris, B_cris and B_st and monodromy on B_st; supply the Fontaine–Messing coefficient fundamental sequences inducing the divided period map with lattice ℤ_p(r) for 0≤r≤p−2 and the modified period map with lattice L_EN(r) for r≥0 (EN §2.2, p. 7, EN line 299–308). Consume PadicPeriodRings §§3,4.1–4.3, with the integral Fontaine–Messing coefficient sequences. (EN §2.2, p.7, EN line 299–308).

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

**`rigid-realizations`.** Scalar-extension maps retain K0 and K, and Frobenius is semilinear on the K0 realization (BesserI §4, BesserI line 625–636). Algebraic filtered de Rham realizations belong to `relative-hodge`. The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For every separated finite-type k-scheme Z with k perfect of characteristic p and coefficient fields K0=Frac(W(k))⊂K=Frac(V) for a complete mixed-characteristic DVR V, supply functorial enhanced RΓ_rig(Z/K0), RΓ_rig(Z/K), K⊗K0 RΓ_rig(Z/K0)≃RΓ_rig(Z/K), semilinear Frobenius on the K0 complex, products, finite Zariski Čech descent, independence of frames and strict neighbourhoods and finite coefficient-extension/trace comparisons. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.4.5–RD.4.11,RD.4.18,RD.4.23–RD.4.24,RD.4.31,RD.5.99, with enhanced rigid realization and coefficient extension. (BesserI §§4–5, manuscript pp. 9–18).

**`rigid-log-crystalline`.** The log structure is induced by the horizontal divisor alone over trivial-log W(k); canonical vertical log structures are excluded from this contract (AM line 1302–1327). The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For k perfect of characteristic p, Y projective smooth over W(k), D a relative normal-crossings divisor, M its horizontal log structure and U=Y−D, supply the natural Frobenius- and product-compatible equivalence RΓ_log-cr((Y_k,M_k)/W(k))[1/p]≃RΓ_rig(U_k/K0), together with F^rRΓ_log-dR((Y_K0,M_K0)/K0)≃F^rRΓ_dR(U_K0/K0) for every r∈ℤ and compatibility with the de Rham/crystalline specialization maps and finite coefficient extensions. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.4.36–RD.4.38,RD.5.101–RD.5.104, extended to all-dimensional horizontal pairs. (AM Lemma 3.10, equations (3.10)–(3.12), pp. 29–30).

**`relative-rigid-realization`.** The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For a complete mixed-characteristic DVR V with perfect residue field, K=Frac(V), S smooth affine over V and u:U→S smooth quasi-projective, supply the frame-independent relative rigid complex, its identification with Ru_K^an,* j†Ω•_(U_K^an/S_K^an), and its Gauss–Manin connection, natural under morphisms of lifted families; no Frobenius lift is assumed. For any such V, smooth affine Z/V and coherent j†O-module, supply finite coherent models on a cofinal system of affinoid strict neighbourhoods and the derived-colimit comparison with global sections. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.4.23–RD.4.24,RD.5.115, relative realization extension. The construction locator is AM Definition 2.12 and Remark 2.13, pp. 11–12, AM line 451–496; the affine models and derived-colimit argument are AM Lemma 2.19, pp. 14–15, AM line 612–620. The contract explicitly extends beyond AM’s standing Frobenius-lift assumption (AM line 117–120): these realization and coherent-model constructions use no F_V.

**`relative-rigid-coefficients`.** The relative rigid complexes and connection come from `relative-rigid-realization`; this contract adds Frobenius on AM bases before coherence is asserted (AM Definition 2.12 and Remark 2.13, AM line 451–505). No direct-image finiteness follows merely from smoothness. The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B†, supply the horizontal B†_K realization of overconvergent F-isocrystals with continuous connection, its tensor equivalence under change of σ with identity and cocycle laws, and exact pullback for morphisms of smooth affine bases; supply the horizontal Frobenius enhancement of the relative rigid complexes of the `relative-rigid-realization` contract for smooth quasi-projective u:U→S, without a finiteness assertion. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.3.13,RD.3.25,RD.3.28–RD.3.32,RD.4.23–RD.4.24,RD.5.115, with relative frame evaluation. (AM Remark 2.2, pp. 4–5).

**`relative-rigid-projective-finiteness`.** This is the geometric rigid finiteness input invoked in AM line 510–527; algebraic filtered finiteness is a separate contract. The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B† and u:U→S projective smooth, supply coherent R^iu_rig j†O on strict neighbourhoods in every degree i≥0, with base change to closed fibres and finite coefficient extensions, and its connection and Frobenius. Consume PadicDifferentialEquationsAndRigidCohomology §RD.5.115, for the projective smooth liftable families here. (AM Setting 2.14 and Proposition 2.15, pp. 12–13).

**`relative-rigid-log-finiteness`.** AM line 530–585 retains both boundary conditions and log integrality; no finiteness for arbitrary open smooth families is requested. The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B† and the full good compactification of 6.3 (smooth projective ambient V-schemes, both total V-normal-crossings and relative S-normal-crossings boundary, projective log-smooth integral map and Zariski-type base), supply coherent R^iu_rig j†O on strict neighbourhoods for every i≥0 with base change to closed fibres and finite coefficient extensions, connection and Frobenius. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.5.107–RD.5.109, relative overconvergent direct-image extension on the full AM compactification domain. (AM Setting 2.16 and Proposition 2.17, pp. 13–14).

**`rigid-gysin`.** The (−1) twist multiplies Frobenius by p. After geometric splitting, Gysin followed by curve trace sums the boundary coefficients on each geometric component; over k use finite-étale coefficient-field traces. The sequence is compatible with the de Rham residue sequence under comparison and with finite extensions of perfect residue/coefficient fields. Empty D retains H²(U)=H²(X), so the last zero of the affine relative sequence cannot be asserted without its affineness hypothesis. The interface consumed from PadicDifferentialEquationsAndRigidCohomology is: For a smooth projective curve X over a perfect characteristic-p field k, finite étale reduced boundary D and U=X−D, supply the Frobenius-compatible rigid localization sequence 0→H¹_rig(X)→H¹_rig(U)→H⁰_rig(D)(−1)→H²_rig(X)→H²_rig(U)→0 over K0, with residue, Gysin, trace and scalar-extension compatibility; when D meets every geometric component, supply H²_rig(U)=0. Consume PadicDifferentialEquationsAndRigidCohomology §§RD.4.19–RD.4.21,RD.5.88–RD.5.89,RD.6.88, including trace descent and arbitrary perfect residue fields. (AM Proposition 2.18 proof, p. 14, AM line 595–607).

### From TauCetiRoadmap.EtaleCohomologyFoundations

**`nearby-cycle-inputs`.** For log-syntomic X/W(k), put X_η=X[1/p] and U=X_tr∩X_η, with open immersions j_η:X_η→X, j′:U→X_η and j=j_ηj′. Write ε:X_se→X_et, εhat:Xhat_se→X0_et and ε_syn:X_n,syn→X0_et, identifying the étale sites of nilpotent thickenings; i_se and j_se are the formal-closed and generic syntomic-étale maps, a:X_n,syn→Xhat_se and u:U_et→X_η,se are the canonical projections. With a structural V-morphism, X_η identifies with X_K=X×V K since p is a unit times a power of a uniformizer; on the canonical-vertical-log inputs of Layer 4, U=X_tr and j_η=j_K. Without that V-morphism, X×W(k)K is not used as the open generic fibre. EN line 292–300 uses the generic restriction of the trivial-log locus; the two projection comparisons are EN line 313–317 and EN line 336–357. The contract extends EtaleCohomologyFoundations F.1/F.3a. The interface consumed from EtaleCohomologyFoundations is: For log-syntomic X/W(k), its p-adic completion Xhat, n≥1, i:X0→X, X_η=X[1/p], U=X_tr∩X_η, j_η:X_η→X, j′:U→X_η and j=j_ηj′, supply the topoi and maps ε:X_se→X_et, εhat:Xhat_se→X0_et, ε_syn:X_n,syn→X0_et, a:X_n,syn→Xhat_se, u:U_et→X_η,se, i_se:Xhat_se→X_se and j_se:X_η,se→X_se, recollement by formal-closed and generic parts, exact a_* and open extensions j_se! and j_η!, Rεhat_*a_*≃Rε_syn_*, and for Λ=Z/p^n(r) or L_EN(r)/p^n on U with r≥0 supply Rεhat_*i_se*Rj_se*Ru_*Λ≃i*Rj_*Λ and Rε_*j_se!Ru_*Λ≃j_η!Rj′_*Λ naturally under coefficient reduction and compatible base change. Consume EtaleCohomologyFoundations §§F.1,F.3a, syntomic-étale recollement extension. (EN §2.2, pp.7–8; EN line 292–317, EN line 336–357).

**`nearby-cycle-cartier`.** The residue fibre Y is reduction modulo π; at a ramified base it need not equal X_1, which is reduction modulo p. The Cartier sequence is on Y_et, while the local PD calculation retains the full mod-p thickening. This is a characteristic-p input, not a syntomic period equivalence (TsujiNearby line 1156–1166, TsujiNearby line 1205–1245). The interface consumed from EtaleCohomologyFoundations is: For V a complete mixed-characteristic DVR with perfect residue field k and fine log-smooth X over canonical-log V whose residue fibre Y=X⊗V k is of Cartier type, put ω^q=Ω^q_(Y/s) over the standard residue log point s, Z^q=ker d, B^q=im d and ω_log^q the étale subsheaf generated by wedges of logarithmic differentials, use for every q≥0 the inverse Cartier isomorphism C⁻¹:ω^q≃Z^q/B^q from CrystallineCohomology §CR.5.1 with C⁻¹(a dlog b₁∧⋯∧dlog b_q)=[a^p dlog b₁∧⋯∧dlog b_q] and supply the exact étale sequence 0→ω_log^q→Z^q→Z^q/B^q→0 with last map z↦[z]−C⁻¹(z), the quotient projection minus inverse Cartier restricted to closed forms, as characteristic-p input to the coefficient-level n=1 PD calculation in weights 0≤r≤p−2 and degrees 0≤q≤r. Consume EtaleCohomologyFoundations §F.3a, logarithmic residue Cartier extension. (TsujiNearby Theorems A3–A4, p.563; TsujiNearby line 1211–1245).

**`nearby-cycle-graded`.** W counts horizontal logarithmic poles, with strata the intersections of components of D; the maps are induced by the Fontaine–Messing map and its logarithmic symbols. This supplies only level-one, equal-degree/weight associated-graded maps on a smooth underlying V-scheme with μ_p in K, rather than the full fs comparison of 4.3 (TsujiNearby line 805–820, TsujiNearby line 873–883, TsujiNearby line 892–929). The interface consumed from EtaleCohomologyFoundations is: For a complete mixed-characteristic DVR V with perfect residue field k, μ_p⊂K=Frac(V), X smooth over V, D a relative simple normal-crossings divisor, log structure from D∪X0, i:X0→X, j:X−(D∪X0)→X, n=1 and 0≤q=r≤p−2, supply the filtrations W by number of horizontal logarithmic poles on H^q(S_1(q)) and i*R^qj_*𝔽_p(q) and the isomorphisms gr_v^W H^q(S_1(q))→gr_v^W i*R^qj_*𝔽_p(q) induced by α_1,q for 0≤v≤q, compatible with residue maps to the codimension-v boundary strata and with products. Consume EtaleCohomologyFoundations §F.3a, logarithmic pole-filtration extension. (TsujiNearby Lemmas 4.3–4.4 and proof of Theorem 4.2, pp.551–555; TsujiNearby line 805–929).

### From TauCetiRoadmap.PadicHodgeTheory

**`local-period-fundamental-sequences`.** The interface consumed from PadicHodgeTheory is: On the completed étale semistable charts with horizontal boundary of CN §2.2.2, require the Artin–Schreier exact sequences of CN Lemma 2.23(i) for v>0; the p^r-exact crystalline sequence and the p^(4r)-exact annular sequence of Lemma 2.23(ii)–(iii), with their stated Tate lattices and 0<u≤1≤v in (iii); and the continuous sections of their surjections. For S=R_PD or R^[u,v] of CN §2.6, a p-adically complete filtered O_F-algebra Λ and a continuous injective filtered map S→Λ, require F^rΛ→F^rΩ•_(S_Λ^s/Λ) to be a p^s-quasi-isomorphism for s≥0, where S_Λ^s is the p-adically completed log-PD envelope with partial powers of level s. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 2.23, pp.23–24, CN line 973–980; Lemma 2.37, pp.28–29, CN line 1234–1239).

**`local-period-pd-radius`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural p^(6r)-quasi-isomorphisms Kum(R_PD,r)→Kum(R^[u],r) for 1/(p−1)≤u≤1 and Kum(R^[u′],r)→Kum(R^[u],r) for u′≤u≤pu′ of Proposition 3.3. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Proposition 3.3, p. 32, CN line 1453–1456).

**`local-period-annulus-entry`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the τ≤r comparison Kum(R^[u],r)→Kum(R^[u,v],r) for pu≤v with the p-power cohomology error bound of Corollary 3.9. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Corollary 3.9, p. 34, CN line 1545–1548).

**`local-period-frobenius-change`.** The zigzag uses the filtered PD Poincaré maps of Lemma 3.11; at p=2 its dimension dependence is retained. The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the 2^(2(d+1))-quasi-isomorphism zigzag between Kum(R^[u,v],r) and Cycl(R^[u,v],r) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 as in Proposition 3.10. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Proposition 3.10 and Lemma 3.11, pp. 34–35, CN line 1569–1588).

**`local-period-lie`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the τ≤r comparisons Kos(φ,Lie Γ_R,A^[u,v]_R(r))→Kos(φ,∂,F^rA^[u,v]_R) with p^(40r) error and their mod-p^n versions with p^(80r) error for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 4.4, p. 43, CN line 1998–2001).

**`local-period-lazard`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural Lazard quasi-isomorphism Kos(φ,Γ_R,A^[u,v]_R(r))→Kos(φ,Lie Γ_R,A^[u,v]_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Proposition 4.5, pp. 43–44, CN line 2055–2057).

**`local-period-annulus-change`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural quasi-isomorphism Kos(φ,Γ_R,A^(0,v]+_R(r))→Kos(φ,Γ_R,A^[u,v]_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 4.8, p. 45, CN line 2148–2150).

**`local-period-phi-psi`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural p^(p+7)-quasi-isomorphism Kos(φ,Γ_R,S(r))→Kos(ψ,Γ_R,S(r)) for S=A_R or A^(0,v]+_R with u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 and the shifted lattice in the ψ-complex prescribed before Lemma 4.10. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 4.10, p. 46, CN line 2176–2187).

**`local-period-disk-change`.**  The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural quasi-isomorphism Kos(ψ,Γ_R,A^(0,v]+_R(r))→Kos(ψ,Γ_R,A_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 with the shifted ψ-lattice of Lemma 4.12. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 4.12, p. 47, CN line 2249–2255).

**`local-period-koszul-resolution`.** The interface consumed from PadicHodgeTheory is: On the completed étale semistable charts with horizontal boundary of CN §2.2.2 over the standing mixed-characteristic DVR, with enough roots of unity in the sense of CN §2.2.1, r≥0 and n≥1, for the chart group Γ_R and period modules M=S(r), with S=A_R, A_R^[u,v] or A_R^(0,v]+ and their finite reductions, supply the twisted arithmetic-direction Koszul totalization and the natural quasi-isomorphism λ:Kos(Γ_R,M)≃RΓ_cont(Γ_R,M), compatible with coefficient maps, Frobenius and reduction, using AInfCohomology §AI.1.7 `Decalage.koszulComplex` for the commuting Γ′_R directions, and the resulting comparison of the Frobenius fibres Kos(φ,Γ_R,S(r)) with Fib(1−φ:RΓ_cont(Γ_R,S(r))→RΓ_cont(Γ_R,S′(r))), where S′ is the Frobenius target of CN §4.3 and 1 denotes coefficient restriction. Its API includes the twisted totalization, λ, coefficient and reduction naturality, and the Frobenius-fibre comparison (CN §4.2, pp. 39–41, CN line 1824–1942; §4.3, CN line 1943–1954).

**`local-period-galois`.** These are intermediate cohomology comparisons, not the syntomic period theorem; the Koszul-to-continuous comparison is the separate `local-period-koszul-resolution` contract. The interface consumed from PadicHodgeTheory is: For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the Artin–Schreier fibre identification with RΓ_cont(G_R,ℤ_p(r)), the inflation/completion comparisons through the toric tower and the decompletion quasi-isomorphism of Proposition 4.13(i)–(iii). Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Proposition 4.13, p. 48, CN line 2267–2277).

**`local-period-approximation`.**  The interface consumed from PadicHodgeTheory is: For rings R of CN (5.3), their henselizations at (p), or the completed charts of §2.2.2 over the mixed-characteristic DVR, with the indicated boundary, supply the identification of the boundary-unramified maximal extension with that obtained after adjoining all roots of boundary coordinates in Lemma 5.8(i), and, for R the henselization of a chart of (5.3), the natural isomorphism G_Rhat→G_R of Lemma 5.8(ii). Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 5.8, pp. 55–56, CN line 2659–2674).

**`local-period-kpi1`.**  The interface consumed from PadicHodgeTheory is: For a completed semistable chart Rhat with normal-crossings horizontal boundary over the mixed-characteristic DVR and n≥1, supply the isomorphism from continuous fundamental-group cohomology to étale cohomology for every locally constant constructible p^n-torsion sheaf on the trivial-log locus Sp(Rhat[1/p])_tr of §5.1.4 (equivalently every positive-degree class dies on a finite étale cover). Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN §5.1.4, p. 56, CN line 2704–2725).

**`local-period-etale-gaga`.**  The interface consumed from PadicHodgeTheory is: For R the henselization at (p) of a semistable chart of CN (5.3), with its horizontal normal-crossings boundary, r≥0 and n≥1, supply the natural cohomology isomorphism between (Spec R)_tr and Sp(Rhat[1/p])_tr with Z/p^n(r)′ coefficients used as g in diagram (5.6). Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN §5.1.5, p. 57, diagram (5.6), CN line 2620–2635, CN line 2728–2746).

**`local-period-descent`.**  The interface consumed from PadicHodgeTheory is: For a semistable chart R as in CN (5.3), r≥0 and a finite Galois extension K1/K of relative ramification index e1 with Galois group G, supply the natural p^(c r e1)-quasi-isomorphism RΓ_syn(R,r)→RΓ(G,RΓ_syn(R⊗O_K O_K1,r)) for a universal c, and after derived reduction modulo p^n a p^(2c r e1) bound. Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension. (CN Lemma 5.9, pp. 57–58, CN line 2747–2762).

### From TauCetiRoadmap.GrothendieckEulerForms

**`exact-yoneda`.** Use the pinned TauCeti.ExactStructure and TauCeti.ExactStructure.IsConflationExact carriers with their additive-category binders (TauCetiExactReview line 245–246; TauCetiExactFunctorReview line 68–81). No enough-injectives or abelian hypothesis on FilFMIC is assumed; the pinned Tau Ceti Ext API still requires [Abelian C] and [HasExt C] (TauCetiExtReview line 54). The interface consumed from GrothendieckEulerForms is: For a ring R and an essentially small R-linear additive category C with chosen TauCeti.ExactStructure C, supply Ext^i_E(X,Y) for all i≥0 as admissible i-extensions modulo zigzags (Ext⁰=Hom), with Baer addition, R-module operations, splicing, pullback/pushout, naturality for R-linear functors satisfying TauCeti.ExactStructure.IsConflationExact and canonical agreement with Mathlib Abelian.Ext with its HasExt instance for the canonical abelian exact structure, and under TauCeti.ExactStructure.IsMonoidal with Mathlib SymmetricCategory and R-bilinearity supply external extension products and unit-source cups with associativity and graded symmetry. Consume GrothendieckEulerForms Layer 5, exact-category Yoneda extension of its abelian Ext interface. (AM line 186–217; Buhler Definition 2.1 and §12, Buhler line 195, Buhler line 2215).

### Affine overconvergent coefficient vanishing

AdicSpacesPartIV §F1.7 `dagger-coherent-affinoid-kiehl` and `dagger-coherent-theorem-b`, §F1.7 `strict-neighbourhood` and `overconvergent-sections-formula`, together with contract `relative-rigid-realization`, supply finite coherent models on cofinal affinoid neighbourhoods. For every complete mixed-characteristic DVR V with perfect residue field, smooth affine Z/V and coherent j†O_(Z_K^an)-module M, without assuming F_V, consume H^j(Z_K^an,M)=0 for j>0 through that strict-neighbourhood comparison. The finite-neighbourhood and derived-colimit comparisons must be made before applying affinoid vanishing; source acyclicity alone does not prove vanishing of higher direct images. The coherent corollary in §6.5 uses this to verify the all-degree higher-cohomology vanishing hypothesis (AM Lemma 2.19 with its affine proof domain, AM line 609–620; Remark 2.21(3), AM line 639–645).

## How to read the build

Layer 1 constructs the exact coefficient category, its connection fibre and extension evaluation. Layer 2 assembles rigid syntomic cohomology on its natural fields. Layer 3 separates divided and undivided log-syntomic coefficients before gluing and completion. Layer 4 constructs their period maps and proves distinct exact and bounded conclusions. Layer 5 supplies adapters to the imported HK and rational h-realizations. Layer 6 promotes relative geometric data on explicit admissible domains and gives residue and extension projections. Layer 7 specializes those extensions at Frobenius-compatible points and identifies their absolute log/rigid syntomic values. Within a layer, subsections are in build order. Each paragraph fixes its hypotheses and locator, its API, a proof dependency chain and discriminating Checks. The base’s general comparison theory is a supplier contract, not another implementation of these layers.

The headline theorems are injective extension evaluation (§1.6), the unramified rigid fibre (§2.3), local log-PD realization and gluing (§3.4), exact small-weight and bounded all-weight period comparisons with étale gluing (§§4.3–4.5), the semistable and h-realization adapters (§§5.2–5.3), the geometric filtered realizations, continuous-form comparison and residue sequence (§§6.4–6.6), and specialization, log/rigid comparison and absolute extension evaluation (§§7.3–7.5). `Suggested.lean` states the headline theorems expressible against the pinned APIs. Each of these headlines needs geometric realization or coefficient carriers absent at those pins, as its module docstring specifies; the API and coordinate Checks below remain the mathematical specification.

## Layer 1: Filtered Frobenius connections and extension evaluation

### 1.1 Coefficient objects and morphisms

Define FilFMIC(S,σ) as the category with objects (H_dR,H_rig,c,∇,F,Φ): coherent B_K- and B†_K-modules, c:H_dR⊗B_K B†_K≃H_rig, an integrable algebraic connection on H_dR, a finite exhaustive separated descending integer filtration with finite locally free graded pieces satisfying ∇F^j⊆Ω¹⊗F^(j−1), and a horizontal B†_K-linear isomorphism Φ:σ*H_rig≃H_rig. The induced connection on H_rig uses continuous differentials. Morphisms are pairs of linear maps preserving c, connection, filtration and Φ. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†. (AM, Definition 2.1 and Remark 2.2, pp. 3–4; AM line 117, AM line 131, AM line 155).

- The displayed geometric data and verified axioms construct an object.
- Two morphisms with equal de Rham and rigid component maps are equal.
- Identify this category with filtered connections fibred over connections against overconvergent Frobenius connections.
- Give additive realization functors and their coefficient-extension comparison; the de Rham realization is faithful, since c determines the rigid component. The rigid realization need not be faithful on generic-only components.

Use the supplied coefficient/connection realization and form the fibre product category. Composition is componentwise; compatibility and horizontality are preserved by it. Local freeness of the finite filtration makes the underlying algebraic module finite projective on S_K.

*Needs:* AdicSpacesPartIV §F1.5; AdicSpacesPartIV §F1.9; contract `relative-rigid-coefficients`.

**Checks.**

- Both modules zero, the unique connection and finite zero filtration give the zero object; Φ:0≃0 is invertible.
- Rank one with c natural, ∇=d, F⁰=B_K, F¹=0, Φ=σ is an object; its constant horizontal section 1 is fixed.
- Over V[t,t⁻¹] with σ(t)=t^p, trivial ∇ and Φ(e)=t e fail horizontality since ∇Φ(e)=dt⊗e≠0. Invertibility alone must not admit this datum.
- For V=ℤ_p[π] with π²=p, a ring endomorphism fixing p sends π to valuation 1, while π^p has valuation at least 2. Their difference cannot lie in pV=(π²). Thus the required p-Frobenius modulo p does not exist, including at p=2. This base is admitted in the classical layers, not as an AM base.
- For S=Spec(K) as a smooth affine V-scheme, B†=0. The datum H_dR=K,H_rig=0 with the unit filtration is admitted, and its identity is nonzero on de Rham realization but zero on rigid realization. Only the de Rham realization is asserted faithful.

### 1.2 Tensor operations, Tate twists and transport

On FilFMIC define direct sums, tensor with the convolution filtration and tensor connection, the tensor unit, and duals with their dual filtration and inverse-transpose Frobenius. For every integer m define O_S(m) by Φ=p^(−m)σ and F^(−m)=B_K, F^(−m+1)=0. A morphism g:S′→S of smooth affine V-schemes induces a tensor pullback. Change of compatible Frobenius lift σ→σ′ gives tensor equivalences satisfying identity and cocycle laws; no equation gσ′=σg is required when pullback is defined through isocrystals. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; S′ is smooth affine and carries a compatible Frobenius lift. (AM, Remark 2.2, Definition 2.3 and (2.1), pp. 4–5; AM line 164, AM line 171, AM line 181, AM line 206).

- O(a)⊗O(b)≃O(a+b), with Φ=p^(−a−b)σ and the stated filtration.
- Pullbacks compose up to the canonical tensor natural isomorphism; identity pullback is identity.
- The equivalences for σ,σ′,σ″ compose canonically and preserve the de Rham component.
- The evaluation and coevaluation are horizontal, filtered and Frobenius compatible and satisfy the triangle identities.

Tensor and dualize finite projective realizations; use the isocrystal realization equivalence for Frobenius transport. The scalar p is nonzero in K, hence invertible; negative twists use integer powers only in characteristic zero.

*Needs:* §1.1; contract `relative-rigid-coefficients`.

**Checks.**

- O(1) has F⁰=0, F⁻¹=B_K and Φ=p⁻¹σ; the opposite exponent is rejected.
- O(1)⊗O(−1)≃O(0), and a zero factor gives zero.
- Identity base map and unchanged σ give the identity on every component, not an extra scalar automorphism.

### 1.3 Strict exactness and Yoneda functoriality

Equip FilFMIC with a `TauCeti.ExactStructure` whose conflations 0→H′→H→H″→0 are exact on F^j of the de Rham realization for every j∈ℤ. Compare with strict exactness and the induced rigid exact sequence. Prove `TauCeti.ExactStructure.IsMonoidal` for this exact structure and the symmetric ℚ_p-bilinear tensor of 1.2. Duality from `TauCeti.ExactStructure.op` and the pullbacks and equivalences of 1.2 satisfy `TauCeti.ExactStructure.IsConflationExact`. On the supplied general Yoneda construction export Ext^i(H,H′) for i≥0, Baer addition, ℚ_p-linearity, splicing, pushout, pullback and coefficient-category naturality. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; use an essentially small model, with Ext transported back independently of the model. (AM, Exact structure and Yoneda groups, p. 5; AM line 186–217; Buhler Definition 2.1, p. 5, Buhler line 195).

- A short sequence is a conflation exactly when each F^j sequence is exact.
- The tensor of 1.2 preserves conflations on both sides, giving TauCeti.ExactStructure.IsMonoidal for this exact structure.
- Conflation-exact functors induce maps on all Yoneda groups, commuting with splicing and Baer addition.
- Ext⁰ is Hom and split 1-extensions represent zero.
- Changing the small model induces canonical group isomorphisms preserving representatives.
- The biexact tensor product gives Ext^i(O,H)×Ext^j(O,H′)→Ext^(i+j)(O,H⊗H′) for i,j≥0, compatible with associativity, the unit and the Koszul symmetry.

Check the Quillen axioms by filtered module pushouts/pullbacks and locally split graded pieces, transporting the rigid component along c; use the coefficient exactness contract. Apply general exact-category Yoneda theory, rather than Mathlib HasExt on a category without an abelian structure. Biexact tensor gives the external extension product; pull back along O≃O⊗O for the unit-source cup.

*Needs:* §1.1; §1.2; Tau Ceti `TauCeti.ExactStructure` and `TauCeti.ExactStructure.IsConflationExact`; Tau Ceti `TauCeti.ExactStructure.IsMonoidal`; Tau Ceti `TauCeti.ExactStructure.op`; contract `exact-yoneda`; contract `relative-rigid-coefficients`.

**Checks.**

- 0→H→H⊕O→O→0 is exact on each filtration step and has Yoneda class zero.
- Ext¹(O,0)=0 and Ext⁰(O,O) is the actual filtered horizontal Frobenius-compatible endomorphism group.
- At Spec(ℤ_p), take A with F⁰A=K and B with F⁰B=0, F⁻¹B=K, both Φ=σ. The identity B→A is a morphism but not an isomorphism or a strict admissible map; its inverse does not preserve F⁰. Underlying-module exactness must not define conflations.

### 1.4 The coefficient mapping fibre

For H∈FilFMIC set A_H^j=Ω^j_(B_K/K)⊗F^(−j)H_dR and B_H^j=Ω^j_(B†_K/K)⊗H_rig for j≥0, zero otherwise. Their differential sends ω⊗h to dω⊗h+(−1)^jω∧∇h. Define S_σ(H)=Fib(1−Φ:A_H→B_H), where Φ includes σ on forms and c identifies the coefficients. This is a functor to complexes of ℚ_p-vector spaces, exact on conflations. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; Ω on B† uses the supplied continuous differential module. (AM, Definition 2.4 and (2.2), pp. 6–7; AM line 224, AM line 249, AM line 258).

- Fib(f)^j=A^j⊕B^(j−1) and d(a,b)=(da,f(a)−db), with an explicit isomorphism to the supplied cone[-1].
- The differential squares to zero by integrability, horizontality and transversality.
- Morphisms act componentwise and yield a fibre triangle natural in H.
- A conflation gives a degreewise short exact sequence of coefficient fibre complexes.
- Construct the natural homotopy-coherent pairing S(H)⊗S(H′)→S(H⊗H′) from the two multiplicative maps 1 and Φ, giving the unit and graded symmetry on cohomology.

Use the degreewise fibre coordinate map (a,b)↦(d_Aa,f(a)−d_Bb) for ℚ-linear d_A:A^q→A^(q+1), d_B:B^(q−1)→B^q and f:A^q→B^q, on the underlying vector spaces of the supplied cone (AM line 255–258; MathlibCone line 61–92). Its coordinate API is:

- The first component is d_Aa and the second is f(a)−d_Bb.
- The map preserves addition of coordinate pairs.
- The map commutes with multiplication by every ℚ-scalar.
- The zero pair maps to the zero pair.

Griffiths transversality makes A a subcomplex, integrability gives d²=0, and Frobenius horizontality gives a chain map. Apply the enhanced fibre construction and strict exactness termwise. Compare the chosen coordinates to Mathlib mappingCone rather than redefine cones. The identity 1−Φ on a tensor product decomposes into the two tensor maps, giving the standard fibre pairing; its homotopies give the unit and symmetry on cohomology.

*Needs:* §1.1; §1.3; EnhancedDerivedSheaves §§0.1–0.4; Mathlib `CochainComplex.mappingCone`.

**Checks.**

- At k=𝔽_p, S(O(0)) is [ℚ_p —0→ ℚ_p] in degrees 0,1; both cohomology groups are ℚ_p. The degree-zero class 1 is the cup unit.
- At the same point S(O(1)) is ℚ_p in degree 1, since F⁰O(1)=0. It is not the fibre of 1−p⁻¹ on all of K.
- S(0)=0. The two-term fibre of multiplication 2 on ℚ is [ℚ —2→ ℚ], with d(a)=(0,2a), the second component carrying +f(a); it is acyclic since 2 is invertible in ℚ.

**Checks for the fibre coordinates.**

- With d_A=0, d_B=id and f=2 on ℚ, the input (1,0) maps to (0,2). Negating f would give (0,−2).
- For the same coordinate maps, (0,1) maps to (0,−1). Forgetting the shift sign would give (0,1).
- With d_A=id, d_B=2·id and f=3·id on ℚ, the input (2,5) maps to (2,−4). Deleting d_A would give (0,−4).

### 1.5 Evaluation of extensions

For every i≥0 and H∈FilFMIC construct the ℚ_p-linear map u_i:Ext^i(O_S,H)→H^i(S_σ(H)). For an admissible i-extension, apply S_σ and send 1∈H⁰(S_σ(O_S)) to its iterated connecting image. At i=0 it sends f:O_S→H to the class f(1). Prove independence of the extension representative, additivity, pushout/pullback naturality and compatibility with the de Rham projection to H^i(A_H). Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†. (AM, Equations (2.3)–(2.7), pp. 6–7; AM line 229, AM line 258, AM line 266).

- u_i sends a representative to δ(1), with connecting maps in extension order.
- Base pullback, coefficient morphisms and change-of-σ realization commute with u_i.
- Projection to A_H agrees with evaluation after forgetting Φ.
- For i,j≥0, u_(i+j)(E cup E′)=u_i(E) cup u_j(E′), using the extension cup of §1.3 and the fibre pairing of §1.4 with their actual coefficient tensor.

Degreewise exactness gives connecting maps. Naturality under extension diagrams gives descent through zigzags, and the diagonal/codiagonal definition of Baer sum proves additivity. The class of 1 is used even on disconnected S; no assertion H⁰(S(O))=ℚ_p is needed. Tensor the representative extensions and compare their connecting maps in the resulting bicomplex to prove the cup identity, including the cochain sign.

*Needs:* §1.3; §1.4; contract `exact-yoneda`.

**Checks.**

- At Spec(ℤ_p), Hom(O,O(1))=0 because F⁰O(1)=0, whereas Hom(O,O(0))=ℚ_p is identified by u_0 with the horizontal Φ-fixed part of F⁰O(0). Frobenius compatibility alone also forces Hom(O,O(1))=0: a=p⁻¹a implies a=0. To test filtration separately, take the rank-one object T with c=id, ∇=0, Φ=1, F⁰T=0 and F⁻¹T=ℚ_p. Then Hom_FilFMIC(O,T)=0, while forgetting filtration gives Hom(O,T)=ℚ_p; the scalar identity fails precisely filtration preservation (AM line 152–154, AM line 181–184).
- Every split 1-extension evaluates to zero.
- Over Spec(ℤ_p), extension with basis h,e, F⁰M=M, ∇=0, Φh=h, Φe=e−h gives u_1=(0,h) in coker(1−Φ on H)=ℚ_p. This is nonzero; it detects reversal of 1−Φ.

### 1.6 Canonical representatives and the two projections

If F⁰H_dR=0, u_1 is injective. For every conflation 0→H→M→O_S→0 there is a unique e∈F⁰M_dR mapping to 1. Under c its class is (∇e,(1−Φ)e); it satisfies d∇e=0 and (1−Φ)∇e=d((1−Φ)e). Thus define δ(E)=∇e and R_σ(E)=(1−Φ)e without a quotient ambiguity. δ is unchanged by Frobenius-lift transport. Under the identified underlying extension and filtered lift e, R_σ′−R_σ=(Φ_σ−Φ_σ′)e, where Φ_σ′ is the transported Frobenius from the supplied isocrystal equivalence. No σ-independence of R is asserted. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; F⁰H_dR=0. (AM, Lemma 2.5, (2.10) and (2.22), pp. 7–8,19; AM line 283, AM line 289, AM line 795, AM line 808).

- Strict exactness identifies F⁰M_dR with B_K, so the lift is unique.
- A zero representative yields a horizontal Φ-fixed filtered splitting; a splitting yields zero.
- The first component lies in Ω¹⊗F⁻¹H_dR and equals the de Rham evaluation.
- The second component lies in H_rig and satisfies dR_σ=(1−Φ)δ.

Since F⁰H=0, the degree-zero source A_H is zero. A zero degree-one class is then the zero pair, not merely an arbitrary coboundary. Its lift is a filtered horizontal Frobenius-fixed splitting. This target uses no Milnor-symbol construction.

*Needs:* §1.4; §1.5.

**Checks.**

- In H⊕O the lift e=(0,1) gives δ=0 and R_σ=0.
- For H=O(1) at Spec(ℤ_p), Φe=e+a h gives (∇e,(1−Φ)e)=(0,−a h). The sign must be negative.
- For H=O(0) at the same point, lifts of 1 in a split extension differ by c h. Therefore unique-lift coordinate projections are not exported without F⁰H=0.

### Examples

At S=Spec(ℤ_p), compute Tate objects and split and nonsplit extensions. Over the dagger affine line test horizontality and change of Frobenius lift.

### Dependencies

Tau Ceti exact structures and conflation-exact functors; AdicSpacesPartIV §§F1.5, F1.7–F1.9; EnhancedDerivedSheaves §§0.1–0.4; contracts relative-rigid-coefficients and exact-yoneda. Every contract is used on its stated domain.

## Layer 2: Rigid syntomic assembly on natural coefficient fields

### 2.1 The de Rham-to-rigid diagram

For smooth separated finite-type X/V construct, on the imported realization carriers, the natural map sp_X:RΓ_dR(X_K/K)→RΓ_rig(X_k/K), its composites sp_r from F^rRΓ_dR, and its compatibility with pullback, finite field extension and products. Retain the scalar-extension map bc:A=RΓ_rig(X_k/K0)→C=RΓ_rig(X_k/K) and σ-semilinear φ on A. Choices of algebraic compactification, rigid frame and resolution yield coherently equivalent diagrams, not additional intrinsic structure on X. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0. (BesserI, §5 and §4.22, manuscript pp. 16–18; BesserI line 625, BesserI line 648, BesserI line 663).

- For f:Y→X, f*_rig sp_X=sp_Y f*_dR, with the coherent comparison on resolutions.
- sp_(r+1) factors through the filtration map F^(r+1)→F^r.
- sp_(r+s)(a∪b)=sp_r(a)∪sp_s(b).

Pass from logarithmic algebraic forms on a smooth proper generic-fibre compactification to analytic forms, then to the tube of the special fibre and overconvergent forms. Use the supplied independence and common-refinement comparisons. No new rigid cohomology realization or compactification-existence theorem is built here.

*Needs:* contract `rigid-realizations`; contract `relative-hodge`; AdicSpacesPartIV §F1.7; RigidAnalyticGeometry §8.1; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- For Spec(V), sp in degree zero is id_K and bc is K0→K.
- For the empty scheme every realization and map is zero.
- For Spec(K) regarded as a smooth finite-type V-scheme, sp:K→0 in degree zero is not an equivalence. No equivalence is attached to general smooth open X.

### 2.2 The rigid syntomic fibre

Define the rigid syntomic complex by RΓ_rsyn(X,r)=Fib(f_r:A⊕F^rRΓ_dR(X_K/K)→A⊕C) in enhanced ℚ_p-complexes, where f_r(a,b)=((1−p^(−r)φ)a,bc(a)−sp_r(b)). Define H^q_rsyn(X,r)=H^q of this fibre for q∈ℤ. This is contravariant in smooth separated finite-type X/V and independent of all presentations. The Frobenius part is ℚ_p-linear; it is not generally K0-linear. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0. (BesserI, Definition 6.1, Proposition 6.3 and its cone description, manuscript pp. 19–20; BesserI line 704, BesserI line 712, BesserI line 741).

- The fibre has its two projections and null-homotopies for f_r, and satisfies the enhanced fibre universal property.
- Pullback preserves both component projections and composes coherently.
- A refinement of presentation induces an equivalence commuting with all component maps.
- Take cohomology as ℚ_p-vector spaces, with no artificial K0-linearity requirement.

Apply the enhanced fibre construction to the actual diagram in 2.1. Forgetting enhancements recovers Besser’s iterated cone via the two cone projections. All maps are formed in ℚ_p-complexes so σ-semilinearity causes no invalid scalar-linear morphism.

*Needs:* §2.1; contract `relative-hodge`; EnhancedDerivedSheaves §§0.1–0.4; Mathlib `CochainComplex.mappingCone`.

**Checks.**

- For V=ℤ_p and r=0, f(a,b)=(0,a−b). Thus H⁰=ℚ_p on the diagonal, H¹=ℚ_p on the first target component, and all other groups vanish.
- For V=ℤ_p and r>0, F^rRΓ_dR=0 and f(a)=((1−p^(−r))a,a); H⁰=0 and H¹=ℚ_p. This retains the two different target components.
- If X_k is empty, the fibre is F^rRΓ_dR(X_K), rather than zero.

### 2.3 Exact sequence, descent, products and the unramified presentation

The fibre triangle of 2.2 gives, for every q∈ℤ, the long exact sequence with middle map H^q(A⊕F^rRΓ_dR)→H^q(A⊕C) induced by f_r. Finite Zariski Čech covers give descent. Construct associative unital graded-commutative products H^i_rsyn(X,r)×H^j_rsyn(X,s)→H^(i+j)_rsyn(X,r+s), compatible with both realization maps and pullback. If K=K0, identify RΓ_rsyn(X,r) with Fib((1−p^(−r)φ)sp_r:F^rRΓ_dR→RΓ_rig(X_k/K)), without assuming sp is invertible. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r,s≥0; the last equivalence assumes K=K0. (BesserI, Propositions 6.2–6.3, Definition 6.5 and Remark 8.7(3), manuscript pp. 19–20,28; BesserI line 719, BesserI line 727, BesserI line 752, BesserI line 1073).

- Every kernel equals the image of the preceding arrow, with the connecting map induced by the fixed fibre coordinates.
- products carry the Koszul sign (−1)^(ij).
- The pullback to a finite Čech nerve is an equivalence.
- Eliminate the equation a=sp_r(b) in the second component of f_r to obtain the single fibre.

Use exactness of the cohomology functor on the fibre triangle. Descent is checked on A,F^rDR,C. Products come from the multiplicative comparison diagram and the standard homotopy product on a fibre of 1−φ_r; pass to cohomology for graded commutativity. The unramified equivalence splits off the contractible identity component while retaining sp as a map.

*Needs:* §2.2; EnhancedDerivedSheaves §E5:abstract; contract `rigid-realizations`; contract `relative-hodge`.

**Checks.**

- At Spec(ℤ_p), r=0, the single fibre [ℚ_p —0→ ℚ_p] gives the groups of 2.2.
- For t on G_m and σ(t)=t^p, φ(dlog t)=p dlog t; in weight 1, (1−φ/p)dlog t=0. A twist p instead of p⁻¹ fails.
- Cohomology of the empty scheme is zero and every product involving it vanishes.

### Examples

Use a point, the generic-fibre-only smooth V-scheme Spec(K), and G_m with its logarithmic differential. Keep A over K0 and the fibre over ℚ_p.

### Dependencies

AdicSpacesPartIV §§F1.5–F1.9; RigidAnalyticGeometry §§8.1,8.4; EnhancedDerivedSheaves §§0.1–0.4; contracts rigid-realizations and relative-hodge. Every contract is used on its stated domain.

## Layer 3: Divided and undivided log-syntomic complexes

### 3.1 Divisibility before finite-level reduction

For a log-syntomic X/W(k), n≥1 and r≥0 define J_n^⟨r⟩ using a level n+s, s≥r, by the Frobenius-divisibility submodule M_(n+s,r) of J_(n+s)^[r] on which φ lands in p^r O_cr,n+s, followed by reduction as M_(n+s,r)/p^n M_(n+s,r). Its higher-level inclusion followed by reduction induces the natural coefficient-comparison map c_(n,r):J_n^⟨r⟩→J_n^[r]. Construct φ_r:J_n^⟨r⟩→O_cr,n by division at that higher level. Prove auxiliary-level independence, Z/p^n-flatness, reduction J_(n+1)^⟨r⟩⊗Z/p^n≃J_n^⟨r⟩, and the canonical identification with J_n^[r] via c_(n,r) for 0≤r≤p−1. For j≤0 use J^[j]=O_cr and the source’s compatible degree conventions in PD de Rham presentations. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X is log-syntomic over W(k); n≥1; r≥0; s≥r. (EN, §2.1 and §2.1.1, pp. 4–5; EN line 158, EN line 165, EN line 198).

- The maps from larger s identify the reduced divisibility modules and φ_r.
- Reduction in n commutes with divided Frobenius and c_(n,r).
- For 0≤r≤p−1, c_(n,r) is an isomorphism identifying J_n^⟨r⟩ with J_n^[r].
- On a divisible lift x, p^r times its divided image is φ(x), with independence proved using the higher level, not inferred from this equation modulo p^n alone.

Use the supplied flat crystalline coefficient sheaves and their higher-level Frobenius divisibility. Compare all choices after passing to a common higher level and reducing. The PD valuation estimate gives the small-weight equality. These are filtered coefficient constructions, not inversion of p in Z/p^n.

*Needs:* contract `crystalline-inputs`.

**Checks.**

- At r=0, J_n^⟨0⟩=O_cr,n and φ_0=φ.
- At p=2,r=1, the small-weight equality J^⟨1⟩=J^[1] applies even though the exact period theorem of 4.3 has range r≤0.
- In Z/p, multiplication by p kills both 0 and 1. Thus the equation p y=0 does not define a unique divided image; a definition using arbitrary division modulo p is rejected.

### 3.2 Two integral fibres on their sites

Define the divided and undivided log-syntomic complexes as follows. S_n(r)=Fib(1−φ_r:J_n^⟨r⟩→O_cr,n) and S′_n(r)=Fib(p^r−φ:J_n^[r]→O_cr,n) on the log-syntomic site. On the étale site use their derived pushforward Rε_* and name the comparison explicitly. For every q∈ℤ give the corresponding crystalline long exact sequences, with J^⟨r⟩ for the divided version and J^[r] for the undivided version. On the syntomic site identify the divided fibre with the kernel sheaf using surjectivity; that identification is not silently transported to the étale site. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X is log-syntomic over W(k); n≥1; r≥0. (EN, §2.1, equation (2.1), pp. 4–5; EN line 158, EN line 169, EN line 178, EN line 196).

- S_n(r) is the enhanced fibre with its natural projection and null-homotopy.
- S′_n(r) is the fibre of the stated undivided map.
- Derived global sections agree with the crystalline coefficient fibre through the supplied realization.
- Construct the transition maps in n and their compatible fibre triangles.

Apply the enhanced fibre and derived pushforward. The crystalline realization contract identifies RΓ of coefficient sheaves with crystalline complexes; the cohomology triangle gives exactness. Only on the syntomic site use surjectivity of 1−φ_r to replace the fibre by its kernel.

*Needs:* §3.1; contract `crystalline-inputs`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- S_n(0)=S′_n(0)=Fib(1−φ:O_cr,n→O_cr,n).
- For zero endomorphism f:A[0]→B[0], the fibre has H⁰=A and H¹=B. Ordinary kernels would lose B.
- On the empty log scheme both derived global section complexes are zero.

### 3.3 Error maps and multiplicative structure

Construct ω_r:S′_n(r)→S_n(r) from (p^r,id) on source and target coefficients and τ_r:S_n(r)→S′_n(r) from (c_(n,r),p^r). The source-coefficient map p^r:J_n^[r]→J_n^⟨r⟩ is induced by multiplication at the higher level; c_(n,r) need not be monic after reduction. Their composites are multiplication by p^r; on cohomology kernels and cokernels are annihilated by p^r. Construct the PD cup products in weights r,s≥0 for both families, compatible with crystalline products, transition maps and ω. Retain the source’s warning that τ has no general multiplicativity contract; no algebra-map instance for τ is exported. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X log-syntomic over W(k); n≥1; r,s≥0. (EN, §§2.1–2.1.2, pp. 5–6; EN line 193, EN line 219, EN line 243).

- τ_rω_r=p^r id and ω_rτ_r=p^r id.
- Every kernel and cokernel of H^q(ω_r), and of H^q(τ_r), is killed by p^r.
- ω_(r+s)(a∪b)=ω_r(a)∪ω_s(b).
- Cup products commute with reduction n+1→n and with PD realization.

Verify each chain square before passing to the fibres. The two composite identities imply the kernel/cokernel bounds by elementary module algebra. Use the explicit PD fibre products of EN §2.1.2 and descend them to the étale site; assert only the supplied multiplicative comparison for ω.

*Needs:* §3.2; EnhancedDerivedSheaves §E5:abstract.

**Checks.**

- ω_0 and τ_0 are identity maps, and the error exponent is zero.
- In the module reduction model J=Z/8 and M=2J, M/2M≃𝔽_2 has nonzero class [2], while J/2J≃𝔽_2 and the induced map sends [2] to [0]. Thus a higher-level inclusion need not remain injective after reducing each module by its own multiple of p. With J=Z/27 and M=3J, the nonzero class [3] likewise maps to [0] modulo 3.
- On the model module Z/p², the map multiplication p has kernel and cokernel killed by p but is not invertible. A killed-error assertion must not generate an integral equivalence.
- The weight-zero unit acts as identity; odd degree classes use the cochain Koszul sign, including at p=2 without division by 2.

### 3.4 Local PD presentations, gluing and rational fibres

For an étale-local exact log immersion into a log-smooth W(k)-scheme with compatible Frobenius lifts, identify S_n(r),S′_n(r) with the corresponding log-PD-envelope de Rham fibres, using J^⟨r−j⟩ or J^[r−j] in degree j and the total Frobenius on forms. Prove independence of immersion and lifts and coherent gluing. For every log-syntomic X/W(k) of 3.2 define RΓ_syn(X,r)=Rlim_n RΓ(X_et,S′_n(r)), its divided analogue RΓ_syn,div(X,r)=Rlim_n RΓ(X_et,S_n(r)), and their rationalizations by tensoring with ℚ_p; S_n and S′_n on X_et mean their derived pushforwards from 3.2. Write RΓ_log-syn(X,ℚ_p(r)) for the rational undivided complex. For an arithmetic pair (U,Ubar) log-smooth over canonical-log V, apply this construction to its boundary-log model. On this arithmetic-pair domain construct the rational equivalence to Fib((1−φ/p^r,can):RΓ_cr,Q→RΓ_cr,Q⊕RΓ_dR/F^r), using the filtered crystalline/de Rham quotient comparison. Both integral families become equivalent after rationalization via ω and τ, with the required p^r rescaling visible. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); n≥1; r≥0; Completed and rational complexes are defined for every log-syntomic X/W(k) as in 3.2; the NN reduction and quotient-fibre assertions retain their arithmetic-pair hypotheses; An arithmetic pair is a dense open K-variety inside a reduced proper flat V-scheme, with fine integral quasi-coherent boundary log structure; Log-smoothness and the existence of local exact log-PD presentations are retained. (EN, §2.1.1, p. 5, EN line 198–218; NN §3.2, equation (32), pp. 25–26, NN line 1299, NN line 1323).

- The local de Rham fibre computes the derived sheaf fibre on its stated site.
- Common log-PD refinements commute with Frobenius and give equivalences satisfying cocycle laws.
- On the NN arithmetic-pair domain, the completed complex reduces derivedly to the n-th complex.
- On the NN arithmetic-pair domain, the second target component is the derived quotient RΓ_dR/F^r, with its canonical quotient map.

Use the filtered log-crystalline Poincaré lemma on each presentation, compare via products of ambient embeddings and descend using enhanced coherences. Rlim commutes with finite fibres on the full log-syntomic domain. On the NN arithmetic-pair domain derived reduction is the crystalline reduction theorem in the contract; rationally identify the filtered ideal fibre with the fibre of (1−φ_r,can) and apply the supplied filtered de Rham quotient equivalence.

*Needs:* §3.2; §3.3; contract `crystalline-inputs`; contract `rational-descent`; EnhancedDerivedSheaves §E2:towers.1; contract `crystalline-filtered-quotient`.

**Checks.**

- F⁰RΓ_dR=RΓ_dR on these de Rham complexes, so the rational presentation at r=0 has zero quotient component.
- After tensoring ℚ_p, p^r is invertible, so ω is an equivalence with inverse p^(−r)τ; τ alone is not claimed to be its inverse.
- For A_n=⊕_(j≥n) 𝔽_p (n≥0) with inclusion transitions, lim A_n=0 but H¹(Rlim A_n)=lim¹ A_n≃(∏_(j≥0) 𝔽_p)/(⊕_(j≥0) 𝔽_p)≠0; the class of (1,1,…) is nonzero. Indeed, 0→A_n→B→C_n→0 with constant B=⊕_(j≥0) 𝔽_p and C_n=⊕_(j<n) 𝔽_p gives lim C_n=∏ 𝔽_p and lim¹ B=lim¹ C_n=0, since both latter towers are Mittag–Leffler. Replacing Rlim by lim would erase this H¹ (StacksRlim, Tag 07KV, Lemmas 15.88.1–15.88.2, StacksRlim line 10638–10675).
- For X=Spec(ℤ_p) with trivial log structure, r=0 and k=𝔽_p, the divided and undivided towers are [Z/p^n —0→ Z/p^n], with surjective reduction maps. Their completed complexes are [ℤ_p —0→ ℤ_p] and their rationalizations have H⁰=H¹=ℚ_p. This horizontal-log carrier is defined without imposing a vertical boundary.

### Examples

At weight zero the two constructions coincide. At p=2 keep every nonnegative weight while exact-range results remain separate. Track reduction n+1→n before rationalization.

### Dependencies

CrystallineCohomology through contracts crystalline-inputs and crystalline-filtered-quotient; EnhancedDerivedSheaves §§0.1–0.4 and E2:towers.1; Layer 2 for comparison vocabulary. Every contract is used on its stated domain.

## Layer 4: Classical period maps and their precise ranges

### 4.1 Ordinary and modified Tate lattices

For r≥0 let L(r)=ℤ_p(r), a=floor(r/(p−1)), b=r−(p−1)a, so 0≤b<p−1. Define L_EN(r)=(p^a a!)⁻¹L(r), the fundamental-sequence kernel lattice for every r≥0, and L_CN(r)=p^(−a)L(r), CN’s printed coordinate lattice. No period map into L_CN is asserted. These are lattices inside ℚ_p(r), and their mod-p^n versions are L/p^nL, not subgroups obtained by dividing elements in Z/p^n. Construct inclusions and scalar-coordinate isomorphisms. Then L_EN=(a!)⁻¹L_CN and the inclusion L_CN→L_EN has cokernel killed by p^v_p(a!). Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0; n≥1; the denominator p^a a! is nonzero because p is prime and the ambient field has characteristic zero. (EN, §2.2, p. 7, EN line 299–308; NN §4.1, p. 44, NN line 2324; CN §§1.1.1,2.4.3, pp. 2,23, CN line 67, CN line 968).

- Give the actual lattice inclusions and their induced maps after reduction, recording that reduction of an inclusion need not be injective.
- Relative to t_EN=t/(p^a a!), the ordinary generator t has coordinate p^a a!, not 1.
- The coordinate inclusion sends the printed CN generator to a! times the EN kernel generator; it is only a lattice map.
- For prime p and weights r,s≥0, ordinary Tate-line multiplication restricts to the EN and floor-normalized CN lattice products; the CN coordinate variant for other exponents requires a_(r+s)≥a_r+a_s.
- For maps of modules, composing a map whose kernel/cokernel is killed by p^A with a lattice inclusion of cokernel exponent p^B gives a bound p^(A+B) on kernel/cokernel; the reduced inclusion has kernel and cokernel killed by p^B as well. This is pure module algebra, not a period-bound transport.

After choosing a generator of the ordinary Tate line, realize L_EN(r) as the ℤ_p-submodule of ℚ_p spanned by (p^a a!)⁻¹, with a=floor(r/(p−1)), and the CN coordinate lattice at exponent a as the span of (p^a)⁻¹. The latter span is defined for every a≥0; CN's printed weight-r lattice uses the floor exponent. These coordinate spans inherit the lattice API above (EN line 306; CN line 968–979):

- At weight zero both spans are generated by 1.
- At the floor exponent the CN span is contained in the EN span.
- The CN generator equals a! times the EN generator for every prime p and r≥0.
- The inclusion induces the coefficient-reduction maps, which need not be injective.

The Checks below compute weight zero, factorial and unit effects, coefficient reduction and a failed product in these coordinate spans.

All lattices are actual scalar multiples of the same rank-one ℚ_p-local system. Compute inclusions in generator coordinates and use the p-adic valuation of factorials for error transport. Use the unique Euclidean decomposition 0≤b<p−1. The kernel is the EN/NN factorial lattice (NN line 2324–2326; EN line 306). With the floor exponent, CN’s recalled global kernel sequence is correct only when a! is a p-adic unit, equivalently a≤p−1; its printed inclusive endpoint also needs the floor choice (CN line 968–971). For products, a_(r+s)≥a_r+a_s makes ordinary multiplication L_CN(r)⊗L_CN(s)→L_CN(r+s) integral; floor exponents satisfy this inequality. For EN, writing a_(r+s)=a_r+a_s+c with c∈{0,1}, the generator product has integral coordinate p^c a_(r+s)!/(a_r!a_s!). Thus both coefficient products are actual lattice maps (CN line 968–971; EN line 306).

*Needs:* EtaleCohomologyFoundations §F.0.3; EtaleCohomologyFoundations §F.4.1–§F.4.5.

**Checks.**

- At r=0, a=b=0. Both modified lattices equal ℤ_p and the inclusion is identity.
- For p=2,r=2, t²/8=γ₂(t/2) lies in F²A_cr and satisfies φ(t²/8)=4·t²/8. The kernel is L_EN=(1/8)ℤ_2(2); CN’s printed L_CN=(1/4)ℤ_2(2) is strictly smaller and misses this element (NN line 2324–2326; EN line 306; CN line 968–971). Its inclusion has coordinate 2. In generator coordinates both quotients modulo 2 are ℤ_2/2ℤ_2=𝔽_2; the induced map is x↦2x=0 while the generator class in each quotient is nonzero. The same coordinate calculation applies to the inclusion ℤ_2→(1/2)ℤ_2, without assigning both exponents to one weight.
- At r=p−1, t^(p−1)/p lies in F^(p−1)A_cr and satisfies φ(x)=p^(p−1)x. The floor lattice is p⁻¹ℤ_p(p−1); the smaller lattice ℤ_p(p−1) allowed by the printed inclusive endpoint misses this kernel element. This concerns the recalled global kernel sequence; CN Lemma 2.23(ii) on chart coefficients asserts only p^r-exactness (CN line 968–977; EN line 306).
- At p=3,r=4, a=2 and L_EN(4) is spanned by 1/18, but equals L_CN(4), spanned by 1/9: 2 is a 3-adic unit. A nontrivial factorial need not make the inclusion strict (MathlibPadicLattice line 317–319, MathlibPadicLattice line 389; MathlibSpanReview line 241–254).
- At p=2, two weight-one floor generators multiply to 1/4, the weight-two floor generator. Replacing the weight-two exponent by 1 would put the target at (1/2)ℤ_2, which does not contain 1/4; arbitrary exponent choices do not support the product.

### 4.2 Period morphisms and their targets

Let k be a perfect field of characteristic p, X a log-scheme log-syntomic over W(k), i:X0→X, X_η=X[1/p], U=X_tr∩X_η, j_η:X_η→X, j′:U→X_η and j=j_ηj′. For n≥1 and 0≤r≤p−2 construct the divided map α_n,r:S_n(r)→i*Rj_*(Z/p^n(r)). For every r≥0 construct the modified-lattice divided map α̃_n,r:S_n(r)→i*Rj_*(L_EN(r)/p^n) and its composite with ω, α′_n,r:S′_n(r)→i*Rj_*(L_EN(r)/p^n). These constructions include trivial-log and horizontal-log inputs over W(k); no structural V-morphism or canonical vertical log structure is required. All maps are natural in X and n and compatible with cup products through the EN kernel-lattice products of 4.1. The exact and bounded conclusions of 4.3–4.5 retain their stronger geometric hypotheses. (EN, §2.2 and §2.2.1, pp. 7–8; EN line 278–308, EN line 311–317, EN line 326–329; CN §5.1.2, p. 54, CN line 2587).

- Coefficient reduction and the transition maps of S,S′ commute with α,α′.
- The undivided EN map is the modified divided map composed with ω.
- The cup square commutes with the actual EN kernel-lattice products of 4.1.
- The target is on X0_et; global sections use RΓ(X0,i*Rj_*−).

Apply the filtered crystalline Poincaré lemma and the Fontaine–Messing coefficient fundamental sequences on the syntomic-étale site of the log-syntomic X/W(k), then push to X0_et using the supplied projection comparisons. Construct the modified map before using ω. Period-ring multiplication proves the cup square.

*Needs:* §3.3; §3.4; §4.1; contract `period-rings`; contract `local-period-fundamental-sequences`; contract `nearby-cycle-inputs`.

**Checks.**

- At r=0, ω=id and the modified and ordinary lattices agree, so both period constructions coincide.
- The weight-zero syntomic unit maps to 1 in nearby cycles.
- For canonical-log X=Spec(ℤ_p), r=0, the nearby-cycle target has an H¹ contribution from ramified characters of G_Qp: the ramified summand of the cyclotomic ℤ_p-extension gives a nonzero class in H¹(I_Qp,Z/p^n) fixed by the residue action. A constant closed-point sheaf has no such geometric H¹ stalk. Thus nearby cycles cannot be replaced by that constant sheaf (EN line 292–317).
- For trivial-log X=Spec(ℤ_p), admitted by this construction, X_tr=Spec(ℤ_p) but X_η=U=Spec(ℚ_p) and j′ is identity. The identity of X cannot factor through X_η, since p would become invertible in ℤ_p. After equipping the point with canonical vertical log structure, X_tr=U=Spec(ℚ_p), as in the canonical-vertical-log comparison domain of 4.3–4.5. Thus j must be defined from U, not from X_tr alone (EN line 292–300).

### 4.3 Exact divided comparison

For X fine saturated log-smooth over V with canonical log structure, n≥1 and 0≤r≤p−2, the divided α induces an equivalence S_n(r)≃τ≤r i*Rj_*Z/p^n(r) on X0_et, and S_n(r) has no cohomology sheaves above r. Exactness is asserted for the divided complex and ordinary Tate lattice in this range only. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X fine saturated and log-smooth over V with canonical log structure; n≥1; 0≤r≤p−2. (EN, Proposition 2.1 and Theorem 2.2, pp. 5,7; EN line 186, EN line 318).

- The source equals its τ≤r truncation.
- The equivalence is the map of 4.2 and respects reduction and products whenever all involved weights are in range.

Use the exact sequence 0→ω_log^q→Z^q→Z^q/B^q→0 with map z↦[z]−C⁻¹(z), and the boundary-stratum symbol calculations with the filtered PD presentation to prove the level-one, equal-degree/weight comparison on smooth normal-crossings charts. Products with the degree-zero twist classes give q≤r; the tame degree-(p−1) descent removes the μ_p assumption, and coefficient exact triangles give all n≥1. For general fs log-smooth X, prove invariance under the toric log blow-ups and use proper base change and the one-dimensional-fibre stalk induction of TsujiNearby Lemmas 3.2 and 5.2 to reduce to those charts, then glue. The local PD degree calculation gives vanishing above r (EN Proposition 2.1). These reductions are proof obligations of this target; no full small-weight period equivalence is a supplier premise (TsujiNearby §4 proof of Theorem 4.2, pp. 554–555, and §5 proof of Theorem 5.1, pp. 558–561; TsujiNearby line 892–940, TsujiNearby line 1074–1140).

*Needs:* §4.2; contract `nearby-cycle-inputs`; contract `crystalline-inputs`; contract `nearby-cycle-cartier`; contract `nearby-cycle-graded`.

**Checks.**

- At p=2 the range contains r=0 and excludes r=1; no positive-weight exact theorem follows from this statement.
- At p=3, r=0,1 are admitted and r=2 is excluded.
- For r>0 the identities τω=ωτ=p^r do not let this equivalence transfer to S′ integrally.
- On the residue chart Y=G_m over 𝔽_p, inverse Cartier sends t dlog t to [t^p dlog t]≠0 in Z¹/B¹, whereas [t dlog t]=[dt]=0; replacing its Frobenius-semilinear coefficient rule by the identity would fail. This is a residue-fibre calculation, even when X_1 is a thicker mod-p fibre over ramified V.
- On Y=A¹_𝔽_p over the standard residue log point, q=r=0 gives B⁰=0, Z⁰=𝔽_p[t^p] and z↦z−z^p with target Z⁰. The element t has dt≠0, so it is excluded from this target and would obstruct surjectivity onto ω⁰/B⁰. For the admitted target t^p, adjoining u with u−u^p=t gives an étale cover (derivative 1); z=u^p is closed and z−z^p=t^p. Thus exactness is étale-local, not surjectivity on affine global sections; the calculation includes p=2.

### 4.4 All weights and bounded error

Assume X is étale locally a CN semistable chart, including base changes of semistable models: étale over V[x₁^±1,…,x_a^±1,x_(a+1),…,x_d,x_(d+1)]/(x_(d+1)x_(a+1)…x_(a+b)−π^h), 1≤h≤e, with log structure from special fibre and x_(a+b+1)…x_d=0. For all n≥1,r≥0 and 0≤q≤r, H^q(α′_n,r):H^q(S′_n(r))→i*R^qj_*(L_EN(r)/p^n) has kernel and cokernel killed by p^A for an integer A=A(e,p,r) independent of n and X. Separately, if K has enough roots in the CN sense, there is a universal N and c_p (also depending on chart dimension d at p=2) giving p^(Nr+c_p). Here enough roots means δ_K+[K:F_i]<e/(2p), F_i=K0(ζ_(p^i)), i maximal with ζ_(p^i)∈K, and δ_K=e v_p(Different(K/F_i)), with v_p(p)=1. The target is the factorial kernel lattice of EN Theorem 2.3, which restates CN’s bound with this lattice (EN line 306, EN line 326–335). Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); e=[K:K0] and π is a uniformizer; X has the stated semistable/base-change charts and log boundary; n≥1; r≥0; 0≤q≤r; the refined bound additionally assumes the stated different inequality. (CN, §2.2.1, Theorem 1.1 and §5.1.2, pp. 2,10,54; CN line 70, CN line 78, CN line 413, CN line 422, CN line 2600; EN Theorem 2.3, EN line 330–335 for the kernel-lattice target).

- Quantifiers are ∃A(e,p,r), ∀X,n,q≤r; the constant is not chosen separately for each n or X.
- Keep the universal linear-in-r exponent separately from the ramified descent bound. The uniformity in e is the statement of CN Theorem 1.1(ii) and EN Theorem 2.3 (CN line 83–84; EN line 334–335); CN Theorem 5.4(ii) states the weaker K-dependent version (CN line 2605–2606). No factorial error is added to either bound.

Use CN’s chart syntomic/PD realization, the separately specified local-period convergence, Frobenius-change, Lie, Lazard and twisted Koszul-to-continuous-cohomology contracts, and the continuous Galois realization to obtain the local Lazard comparison. The period-ring Poincaré lemma compares that map to the Fontaine–Messing map (CN Theorems 4.14 and 4.16). Approximation, K(π,1) and rigid étale comparison transfer it to nearby cycles. Cyclotomic extension and ramified descent give A(e,p,r); with enough roots retain Nr+c_p instead. The intermediate estimates and comparison sections are separate supplier requirements; the desired period bound is not one of their premises.

*Needs:* §4.2; §4.1; contract `local-period-fundamental-sequences`; contract `local-period-pd-radius`; contract `local-period-annulus-entry`; contract `local-period-frobenius-change`; contract `local-period-lie`; contract `local-period-lazard`; contract `local-period-annulus-change`; contract `local-period-phi-psi`; contract `local-period-disk-change`; contract `local-period-galois`; contract `local-period-approximation`; contract `local-period-kpi1`; contract `local-period-etale-gaga`; contract `local-period-descent`; contract `period-rings`; contract `local-period-koszul-resolution`; AInfCohomology §AI.1.7; DerivedModuleAlgebra §0.K.1.

**Checks.**

- A chart xy=π^h with h>1 in a ramified base change is admitted; replacing h by 1 globally would lose a source case.
- At p=2,r=1 this gives a bounded comparison in q=0,1 and keeps dimension dependence in c_2.
- No claim is made about q>r; a p-power bound at each finite level is not an integral equivalence, even if rationalization kills its errors.
- For the supplied commuting cochain carrier on ℤ, g₁=2 and g₂=3 give d⁰(1)=(2,3), d¹(1,0)=−3, d¹(0,1)=2 and d¹d⁰(1)=6−6=0. The same cancellation holds after reduction modulo 2 or 3; with no directions the complex is M[0], and with one identity direction it is acyclic.
- The arithmetic semidirect direction need not commute with Γ′_R: on ℚ_p² take γ₁=1+E₁₂ and γ₀=diag(c,1), where c=1+p for odd p and c=5 for p=2. Then γ₀γ₁γ₀⁻¹=γ₁^c and [γ₀−1,γ₁−1]=(c−1)E₁₂≠0. An ordinary two-operator exterior differential would square on e₂ to (c−1)e₁≠0. The twisted totalization and its continuous-cohomology comparison remain separate requirements of `local-period-koszul-resolution`.

### 4.5 Syntomic-étale objects on X

Let j_K:X_K→X and j′:X_tr→X_K, so j=j_Kj′. For every r≥0 glue S_n(r) and S′_n(r), respectively, to Rj′_*(L_EN(r)/p^n) using the modified divided and undivided maps of 4.2, obtaining E_n(r),E′_n(r) on X_et. For 0≤r≤p−2 identify the first construction with ordinary-lattice gluing because a=0. Their triangles have first term j_K!Rj′_* of the corresponding lattice, middle term E or E′, and third term i_*S or i_*S′. Construct maps to Rj_* of the generic lattice. Prove τ≤rE_n(r)≃τ≤rRj_*Z/p^n(r) in the divided exact range; on the semistable chart domain, H^q(E′_n(r))→R^qj_*(L_EN/p^n) has kernel and cokernel killed by p^A for 0≤q≤r, with A=A(e,p,r) from 4.4; with enough roots use Nr+c_p. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X fine saturated log-smooth over canonical log V; n≥1; r≥0; the ordinary-lattice divided identification and exact conclusion use r≤p−2; the bounded conclusion assumes the semistable chart domain of 4.4. (EN, §2.2.2, equations (2.6)–(2.7), Theorem 2.5, pp. 8–9; EN line 336, EN line 351, EN line 360).

- i*E=S, j_K*E=Rj′_* of the generic lattice, with the specified attachment map.
- The recollement fibre construction yields the displayed distinguished triangle and is unique with its gluing data.
- Restriction of the period map to the closed part is α; on the open part it is identity.
- The truncated triangles give the exact divided comparison. For the undivided map, exact closed and open restriction detect its cohomology kernel and cokernel: both vanish on X_K and restrict to those of α′ on X0. Hence the exponent is A (or Nr+c_p) without doubling (EN line 380–386).

Form the enhanced recollement pullback of the closed fibre and open direct image over nearby cycles. Its localization triangle has exact open extension. Compare it to the localization triangle for Rj_*; the open map is identity and the closed map is 4.3 or 4.4. Apply cohomological exactness for the exact comparison, retaining truncation. For the error bound, use exact restriction: a sheaf supported on X0 is i_* of its closed restriction, so the same annihilator works globally.

*Needs:* §4.2; §4.3; §4.4; contract `nearby-cycle-inputs`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- Restricting E′ to X_K returns Rj′_*L_EN/p^n; it is the lattice itself when j′ is identity.
- With no closed part the gluing gives only the open direct image, rather than a zero syntomic sheaf on X.
- At weight zero the closed and open units glue to the unit and its period image is 1.

### Examples

Use p=2,r=0 for exact comparison, p=2,r=1 for the bounded result, and a ramified chart xy=π^h with horizontal boundary. Compute every lattice rescaling before quoting an error exponent.

### Dependencies

Layers 2–3; EtaleCohomologyFoundations §§F.0.3,F.1,F.4.1–F.4.5; contracts period-rings, local-period-fundamental-sequences, nearby-cycle-inputs, nearby-cycle-cartier, nearby-cycle-graded, local-period-pd-radius, local-period-annulus-entry, local-period-frobenius-change, local-period-lie, local-period-lazard, local-period-annulus-change, local-period-phi-psi, local-period-disk-change, local-period-galois, local-period-approximation, local-period-kpi1, local-period-etale-gaga, local-period-descent, local-period-koszul-resolution; AInfCohomology §AI.1.7; DerivedModuleAlgebra §0.K.1. Every contract is used on its stated domain.

## Layer 5: Semistable and rational descent adapters

### 5.1 Hyodo–Kato data on the shared carriers

Construct the Hyodo–Kato isocrystal adapter for proper fine log-smooth X over canonical log V with Cartier-type special fibre, q≥0. On the supplied D^q=H^q_HK(X0), transport its actual bijective σ-semilinear φ into `WittVector.Isocrystal p k`. Retain its K0-linear nilpotent N and its supplied ι_π:D^q⊗K0 K≃H^q_log-dR(X_K/K), with the positive-Taylor convention of §5.2. The adapter is the same cohomology module with its existing Frobenius, rather than an independently selected isocrystal (HK §§3.2–3.6, pp.243–246, Theorem 5.1, pp.262–263; HK line 698, HK line 715, HK line 740, HK line 770, HK line 1321, HK line 1335; MathlibPin line 117).


- Its semilinear equivalence is the transported φ on that same D^q, and its equivariant morphisms are the supplied cohomological pullbacks.

Use the proper HK supplier theorem for the cohomology and uniformizer comparison; transport its Frobenius equivalence into the existing Mathlib class. The counterexample is HK’s own obstruction to omitting Cartier type.

*Needs:* contract `hyodo-kato-proper`; Mathlib `WittVector.Isocrystal`.

**Checks.**

- For the good-reduction point D=K0, φ=σ and N=0; every ι_π is the same.
- On D=ℚ_p e0⊕ℚ_p e1, φe0=e0, φe1=p e1, Ne1=e0, Ne0=0, Nφe1=p e0. Uniformizer change sends e1 to e1+log(u)e0 before ι_π.
- For p∤m and m>1, the log chart 1↦m on Spec(k[t]/t^m) is log-smooth but not Cartier type; φ(t)=t^p on its rational crystalline H⁰ is not bijective for every such m>1 (HK (3.3), HK line 738–739). It cannot supply an Isocrystal instance.

### 5.2 The semistable total fibre and its adapter

For an arithmetic pair (U,Ubar) log-smooth over canonical log V and of Cartier type, set D=RΓ_HK,Q and E=RΓ_dR/F^r. Define C_st(D,r,ι_π) as the total homotopy fibre of the square with top (1−φ/p^r,ι_π):D→D⊕E, left N:D→D, right (N,0):D⊕E→D and bottom 1−φ/p^(r−1):D→D. Construct the canonical equivalence RΓ_syn,Q(U,Ubar,r)≃C_st(D,r,ι_π), natural in the pair and compatible with products and the supplied uniformizer-change comparison. For degree-zero realizations its three terms are D, D⊕E⊕D, D with differentials x↦((1−φ/p^r)x,ι_πx,Nx) and (a,b,c)↦Na−(1−φ/p^(r−1))c. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); (U,Ubar) is an arithmetic pair with fine integral quasi-coherent log structure, log-smooth over canonical log V and of Cartier type; r≥0; π is a uniformizer; ι_π is supplied enhanced comparison data. (NN, §3.2 and Proposition 3.8, pp. 26–27; NN line 1341, NN line 1366, NN line 1384, NN line 1387).

- N(1−φ/p^r)=(1−φ/p^(r−1))N; give the coherence used by the enhanced square.
- The total fibre is the iterated enhanced fibre with its square projections and homotopies.
- The comparison is induced by the log deformation N-triangle and ι_π, rather than selected as an arbitrary isomorphism.
- Changing π gives the comparison through the imported HK change law, preserving its de Rham projection.

For degree-zero realizations, use the displayed differentials D0:D→D⊕E⊕D and D1:D⊕E⊕D→D on ℚ-vector spaces D,E with ℚ-linear φ,N and ι; restricting the arithmetic maps to ℚ supplies these carriers. The exponents are the integers −r and 1−r, even for r=0 (NN line 1366–1384). Their coordinate API is:

- D0(x)=((1−φ/p^r)x,ιx,Nx) and D1(a,b,c)=Na−(1−φ/p^(r−1))c.
- Both maps preserve addition.
- Both maps commute with every ℚ-scalar.
- Both maps send zero to zero.
- For prime p and Nφ=pφN, D1(D0(x))=0 for every x. This identity needs no finiteness, invertibility or nilpotence; those geometric hypotheses belong to the supplied realization and comparison.

Construct the base-convention chain adapter with N_b=−N_c/e on the same D and with the same φ and ι, where e≥1 is the ramification index. Its chain map in degrees 0,1,2 is respectively identity, (a,b,c)↦(a,b,−c/e), and multiplication by −1/e. Prove it is an equivalence, natural in the realization, and preserves the de Rham component. The shared-carrier convention requested in contract `rational-descent` is N_base,norm=−N_c/e, with change law exp(−e log(u)N_base,norm). In this convention, exp(−e log(u)N_b)=exp(log(u)N_c). Prove the two chain-map squares for (identity, diag(1,1,−1/e), −1/e) on ℚ-vector spaces for all p,r,e∈ℕ, including p=0 and e=0 with the field convention 0⁻¹=0; the chain equivalence requires e≠0, explicitly as e≥1 above. This scalar-coordinate theorem fixes the sign and scaling of the adapter (HK Theorem 5.1, HK line 1340; NN §3.2, NN line 1366–1384; contract `rational-descent`).

The relation Nφ=pφN makes the square commute. Apply the supplied log deformation N-triangle to the rational fibre of 3.4 and compare the deformation complex with HK by its Frobenius-equivariant section. NN Proposition 3.8’s kernel/cokernel argument identifies the resulting iterated fibres. Proper 5.1 is only the cohomology witness; the enhanced arithmetic-pair input is a separate required contract.

*Needs:* §3.4; §5.1; contract `arithmetic-pair-deformation`; contract `hyodo-kato-proper`; contract `rational-descent`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- On the two-dimensional datum of 5.1, N(1−φ/p^r)e1=(1−p^(1−r))e0, agreeing with the lower map on Ne1. Reusing 1−φ/p^r below fails. At p=2, D1(2,0)(e1,0,0)=e0 and D1(2,0)(0,0,e0)=e0, while D1(2,1)(0,0,e1)=e1. These separately detect the N term, subtraction sign and lower exponent.
- At r=0 the lower exponent is −1, so the lower map is 1−pφ; on φ=diag(1,2), Ne1=e0, the upper image of e1 at r=0 is (−e1,e1,e0), and D1 of this image is −e0+e0=0; no natural-number subtraction may replace it by 1−φ.
- If D=E=0 the total fibre is zero; its three-term differential squares to zero for every valid (φ,N,ι) datum.

**Checks for the coordinate adapter.**

- At p=2,r=0,e=2, take φ=diag(1,2), N_c e1=e0 and ι=id. The classical D0(e1) is (−e1,e1,e0), whereas the transported D0(e1) is (−e1,e1,−e0/2). Their D1 values are both zero, but on the independent input (e1,0,0), classical D1=e0 and transported D1=−e0/2. A sign-only adapter would give −e0 instead of −e0/2.
- If N_c=0, transport leaves the actual Frobenius and de Rham maps fixed. On the third and last terms it still scales by −1/e; it is a chain equivalence, rather than equality of presentations.
- At e=0 the two differential-commutation identities still hold: on the rank-two datum above D0(e1)=(−e1,e1,0) after scaling N to zero, and D1(−e1,e1,0)=0. The equivalence excludes e=0: its third degree-one summand and degree-two term would be sent to zero, which is not invertible on a nonzero D.

### 5.3 Compatibility with rational h-descent

For an arithmetic pair as in 5.2 with interior U, identify the classical rational syntomic complex of 3.4 with the base-owned h-realization RΓ_syn(U_h,r). For every reduced separated finite-type K-variety X and r≥0, transport the base’s functorial arithmetic and geometric product-compatible period maps and its equivalences τ≤rRΓ_syn(X_h,r)≃τ≤rRΓ_et(X,ℚ_p(r)) and τ≤rRΓ_syn(X_Kbar,h,r)≃τ≤rRΓ_et(X_Kbar,ℚ_p(r)). These are exports of the base theorem through named classical adapters, with all comparison squares specified. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0; Classical-pair statements retain fine integral quasi-coherent log structure, log smoothness and Cartier type; the classical map is the one induced by the base h-realization on its log-smooth Cartier-type arithmetic pairs. (NN, Proposition 3.18, p. 33, NN line 1688–1691 for the classical-pair map; Theorem A(1),(4), Proposition 4.6 and Corollary 4.11, pp. 2,46,53, NN line 78, NN line 85, NN line 93, NN line 2400, NN line 2778 for the period comparisons).

- The classical-to-h map commutes with product, pullback and the semistable fibre projections.
- The transported arithmetic period is the base period on the common realization.
- Geometric base extension and G_K-action commute with the transported period.

Use uniqueness of the base’s h-descent extension to identify the classical-pair map, checking the semistable presentation and product on the h-basis. Transport the base’s period squares through that equivalence. The h-descent theorem, semistable comparison theorem and its geometric counterpart are imports, not new proof targets.

*Needs:* §3.4; §5.2; contract `rational-descent`; contract `rigid-realizations`.

**Checks.**

- Changing a presentation by its identity induces identity on the h-realization and on both period maps.
- At p=2 any r≥0 is permitted rationally; the integral exact range is not reused.
- At r=0 only τ≤0 is exported. Tensoring with ℚ_p does not itself provide a comparison in all degrees.

### Examples

The two-dimensional (φ,N) witness fixes the twist and uniformizer sign. Compare only rationally with the base h-realization, with both arithmetic and geometric targets truncated.

### Dependencies

Layer 3; contracts hyodo-kato-proper, arithmetic-pair-deformation, crystalline-inputs, period-rings and rational-descent; EnhancedDerivedSheaves §§0.1–0.4. Every contract is used on its stated domain.

## Layer 6: Relative realizations and open-curve residues

### 6.1 Relative cohomology before promotion

For smooth quasi-projective u:U→S on an AM base and i≥0, assemble H^i(U/S)=(H^i_dR(U_K/S_K),H^i_rig(U_k/S_k),c,∇,Φ,F). The first module is Γ(S_K,R^iu_K*Ω•_(U_K/S_K)); the second is Γ(S_K^an,R^iu_rig j†O), with relative continuous differential realization on frames. Construct c by algebraic-to-analytic adjunction and restriction to overconvergent forms. Give the Gauss–Manin and Hodge maps and the Frobenius structure from the rigid realization. This datum is defined without asserting coherence or invertibility of c in an arbitrary open family. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u is smooth quasi-projective; i≥0. (AM, Definition 2.12 and Remark 2.13, pp. 11–12; AM line 451, AM line 463, AM line 478).

- c is the displayed adjunction/restriction map, B†_K-linear after scalar extension.
- The frame description and the lifted U^an relative-overconvergent description agree.
- Morphisms of families induce the realization maps and commute with c,∇,F,Φ wherever their base-change comparison is defined.

Use the supplied algebraic and rigid relative derived pushforwards and take H^i. The map c is constructed before any bijectivity theorem. Adjoint pullback to analytification followed by j† produces it; the frame-independence theorem identifies the two rigid descriptions.

*Needs:* §2.1; contract `relative-rigid-realization`; contract `relative-rigid-coefficients`; RigidAnalyticGeometry §8.1; AdicSpacesPartIV §F1.9.

**Checks.**

- For u=id_S, H⁰=(B_K,B†_K,c,d,σ,F⁰=all,F¹=0) and H^i=0 for i>0.
- For U empty every cohomology datum is zero.
- For P¹_S, H⁰=O_S, H¹=0, H²=O_S(−1); the H² Frobenius is p times the base Frobenius, not p⁻¹.

### 6.2 The admissibility interface

Assume u:U→S is smooth quasi-projective on an AM base, every R^iu_rig j†O is coherent over j†O_(S_K^an), and every c_i:H^i_dR⊗B†_K→H^i_rig is bijective. Independently assume the algebraic finiteness, Hodge-filtration and connection hypotheses below on the actual modules of 6.1. Then promote these data to FilFMIC(S,σ), with horizontal invertible Φ supplied by the rigid realization. Prove naturality in family morphisms and in base changes for which the actual relative cohomology maps are isomorphisms respecting the Hodge filtration. AM Assumption 2.20 supplies only the rigid coherence and comparison conditions; it does not imply the independent algebraic hypotheses. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u smooth quasi-projective; For every i≥0 the stated relative rigid sheaf is coherent and c_i is bijective; For every i≥0, the actual module H^i_dR(U_K/S_K) of 6.1 is finite over B_K, its actual Hodge filtration is finite exhaustive separated with finite locally free graded pieces, its Gauss–Manin connection is integrable and satisfies Griffiths transversality, and c_i identifies its induced continuous connection with the rigid connection. (AM, Definition 2.1, Remark 2.13, Assumption 2.20 and Remark 2.21, pp. 3–4,12,15; AM line 131, AM line 497, AM line 502, AM line 627).

- Forgetting the promoted object returns the constructed datum of 6.1.
- When the actual base-change maps on both realizations are isomorphisms that identify the Hodge filtrations and respect the connections and Frobenius, they give an isomorphism in FilFMIC.
- The coefficient object is uniquely determined by the datum and its verified properties; no Frobenius is chosen independently of rigid cohomology.

Affine overconvergent coherence gives finite B†_K-modules. Use the independent finiteness and filtered-connection hypotheses on the actual algebraic modules; bijectivity of c identifies their scalar extensions and connections with the rigid modules. The rigid coefficient realization supplies horizontal invertible Frobenius. Verify 1.1 directly. No descent of algebraic finiteness through B_K→B†_K is used.

*Needs:* §1.1; §6.1; contract `relative-rigid-coefficients`.

**Checks.**

- Promotion of H⁰(S/S) agrees with O_S and its exact filtration.
- A vanishing cohomology datum promotes to the zero object, including in degrees above a known cohomological bound.
- A formal tuple with c=0 between nonzero rank-one modules cannot be promoted; a non-locally-free Hodge graded piece also fails the explicit filtered-realization contract.
- For every prime p, V=ℤ_p, S=Spec(V[t]), σ(t)=t^p and U=D(pt−1), one has U_k=S_k and all-degree coherent rigid cohomology with bijective c_i. In degree zero H_dR=ℚ_p[t,(pt−1)⁻¹], while H_rig=B†_K since (1−pt)⁻¹=Σ_(j≥0)p^j t^j converges on some radius 1<ρ<p. The algebraic module is not finite: finitely many fractions have a bounded pole order at t=1/p, but its inverse powers have unbounded pole order. Thus 6.1 applies and 6.2 does not; nonempty special fibre and rigid coherence do not repair algebraic finiteness.


### 6.3 The full compactification setting

Define a good compactification of u to mean the existence of smooth projective V-schemes Sbar,Xbar, S=Spec(B) open in Sbar with relative simple normal-crossings complement T, a projective extension fbar:Xbar→Sbar, a horizontal relative normal-crossings divisor D_h on Xbar/V and vertical divisor D_v=fbar⁻¹(T), such that D_h∪D_v is relative normal-crossings over V, X=fbar⁻¹(S), D=D_h∩X is relative normal-crossings over S, U=X−D, and (Xbar,D_h∪D_v)→(Sbar,T) is log-smooth and integral with the base of Zariski type. The witnesses are presentation data; no boundary splitting or restriction on p is imposed. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u:U→S smooth quasi-projective; all identifications commute with u. (AM, Setting 2.16, pp. 13–14; AM line 530–558).

- The stated diagrams, boundary identities and geometric hypotheses construct a witness.
- Isomorphic compactification diagrams transport witnesses and induce the same interior u.
- Whenever the intrinsic datum satisfies 6.2, its coefficient object uses the realizations of 6.1, so two compactification witnesses induce the same promoted object.
- Over S the vertical divisor disappears and the horizontal boundary is D with its relative S-normal-crossings property.

Use the imported scheme/log-divisor vocabulary and store precisely the geometric presentation required in AM Setting 2.16. Invariance under isomorphisms follows from its geometric predicates. The independence API refers to the intrinsic cohomology datum; it asserts no existence of a good compactification for every u.

*Needs:* contract `crystalline-inputs`; contract `relative-rigid-coefficients`; AdicSpacesPartIV §F1.12.

**Checks.**

- Take S=A¹_V, Sbar=P¹_V, Xbar=P¹_V×P¹_V over the first factor, T=∞, D_h the second-factor sections 0,∞. Then D_v is the fibre over ∞ and U=A¹_V×G_m,V satisfies every clause.
- With no horizontal boundary in the same example and a fixed smooth projective fibre, the interior family is projective smooth; empty divisors are allowed.
- The horizontal sections x=0 and x=t over A¹_V collide at t=0. Their union is not a relative normal-crossings divisor over S there, even if the total-space crossing is normal. This does not give a good compactification witness for that S.

### 6.4 Projective smooth and good-compactification families

For every i≥0, prove coherence of R^iu_rig j†O and bijectivity of c_i in each of two domains: (a) u is projective smooth; (b) u admits a good compactification as in 6.3. In each domain also establish finiteness of the actual algebraic de Rham modules, a finite exhaustive separated Hodge filtration with finite locally free graded pieces, integrable Gauss–Manin connection with Griffiths transversality, horizontal comparison and filtered base change. These independent algebraic conclusions, together with the rigid conclusions, give the FilFMIC object of 6.2. Keep log integrality, Zariski type and both the total and relative boundary hypotheses in (b). Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; Either u is projective smooth or u has a good compactification as in 6.3; i≥0. (AM, Setting 2.14 and Propositions 2.15,2.17, pp. 12–14; AM line 510, AM line 512, AM line 567).

- The projective-smooth domain satisfies AM Assumption 2.20 and all independent algebraic hypotheses of 6.2 in every degree.
- The full good-compactification domain satisfies AM Assumption 2.20 and all independent algebraic hypotheses of 6.2 in every degree.
- The invertible c_i commutes with connection, filtration maps and Frobenius on the rigid side.

Apply relative-rigid-projective-finiteness in (a) and relative-rigid-log-finiteness in (b). Independently apply relative-hodge to the proper de Rham or compactification log-de Rham complex to obtain algebraic finiteness and all filtered-connection hypotheses of 6.2. With coherence established in all degrees, use geometric base change and the absolute/logarithmic comparison to prove c_i invertible and horizontal. Then apply 6.2; rigid coherence supplies no substitute for algebraic finiteness.

*Needs:* §6.1; §6.2; §6.3; contract `relative-rigid-coefficients`; contract `relative-rigid-projective-finiteness`; contract `relative-rigid-log-finiteness`; contract `relative-hodge`; contract `rigid-realizations`; RigidAnalyticGeometry §8.4.

**Checks.**

- For a constant smooth projective geometrically connected genus-g curve, ranks are 1,2g,1 in degrees 0,1,2, including g=0.
- The compactification in 6.3 gives H⁰=O and H¹=O(−1); its H¹ Frobenius multiplies dlog x by p.
- The geometric statements admit p=2. A ramified V without a p-Frobenius modulo p is excluded from the AM relative setting, while the classical log/rigid producers still admit it. The Frobenius hypothesis is not vacuous notation.

### 6.5 Relative continuous-differential cohomology

For a smooth morphism U=Spec(A)→S=Spec(B) of smooth affine V-schemes such that H^j(S_K^an,R^iu_rig j†O)=0 for every i≥0 and j>0, identify H^i_rig(U_k/S_k) with H^i(Ω•_(A†_K/B†_K)) naturally and compatibly with the supplied connection; Frobenius compatibility is asserted only with the AM lifts. No affine acyclicity statement is applied to a proper positive-genus curve. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); U and S are smooth affine and H^j(S_K^an,R^iu_rig j†O)=0 for all i≥0,j>0; Frobenius compatibility additionally uses the AM lifts. (AM, Lemma 2.19 and Remark 2.21(3), pp. 14–15; AM line 609, AM line 612, AM line 639).

The comparison is the edge map from global relative continuous forms to the relative rigid realization. Prove that under the same smooth affine hypotheses, if all R^iu_rig j†O are coherent, the affine coefficient-vanishing contract verifies the preceding hypothesis, so the same comparison is an isomorphism in every degree. Its connection and conditional Frobenius compatibility are those of the general map (AM Remark 2.21(3), AM line 639–645).

For the general theorem apply affine coefficient vanishing on U to each coherent relative differential sheaf, and the assumed higher-cohomology vanishing on S to the relative rigid cohomology sheaves. The two hypercohomology spectral sequences identify the edge with the continuous-differential comparison. For the coherent corollary, affine coefficient vanishing on S supplies that extra vanishing; no coherence of relative cohomology sheaves is needed in the general statement.

*Needs:* AdicSpacesPartIV §F1.7 `dagger-coherent-theorem-b` and `overconvergent-sections-formula`; contract `relative-rigid-realization`; contract `relative-rigid-coefficients` for conditional Frobenius compatibility; AdicSpacesPartIV §F1.7; AdicSpacesPartIV §F1.9; RigidAnalyticGeometry §7.3; EnhancedDerivedSheaves §§0.1–0.4; the general theorem uses the displayed all-degree acyclicity hypothesis, and the coherent corollary additionally uses affine coefficient vanishing on S.

**Checks.**

- For A=V[t], S=Spec(V), the dagger complex has H⁰=K and H¹=0, since overconvergent integration remains overconvergent.
- For A=V[t,t⁻¹], H¹=K dlog t. Replacing dagger forms by only exact forms would erase this class.
- For V=ℤ_2[π]/(π²−2), S=Spec(V[t]) and U=S×A¹, relative dagger forms give H⁰=B†_K and H^i=0 for i>0, with the usual connection. The realization and comparison apply although §1.1 excludes an AM Frobenius lift on V; no Frobenius compatibility is asserted for this base.
- For an elliptic curve E/V, H¹(E_K^an,O)=K. The unrestricted smooth-scheme wording of AM Lemma 2.19 would be false; its affine-embedding proof supplies the affine theorem used here.

### 6.6 Residues without a split-boundary hypothesis

Let U and S be smooth affine over an AM base, u:U→S smooth of relative dimension one with connected fibres, X→S a projective smooth compactification and D=X−U finite étale over S. Assume all hypotheses of 6.2 for U/S, including algebraic finiteness and the actual filtered-realization hypotheses independently of rigid coherence and bijectivity of c. Construct the exact sequence 0→H¹(X/S)→H¹(U/S)→Res H⁰(D/S)(−1)→Gys H²(X/S)→0 in FilFMIC, with Res filtered, horizontal and Frobenius compatible. Construct induced maps Ext^i(O_S,H¹(U/S)(m))→Ext^i(O_S,H⁰(D/S)(m−1)) for every i≥0,m∈ℤ, commuting with u_i and coefficient pullback. D is a finite étale scheme, not a list of S-rational sections. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; U and S smooth affine; u smooth of relative dimension one with connected fibres; X/S projective smooth; U⊂X; D finite étale; U/S satisfies all hypotheses of 6.2, including the independent algebraic finiteness, Hodge-filtration and connection conditions. (AM, Proposition 2.18 and the residue interface in Lemma 4.2, pp. 14,33; AM line 587, AM line 595, AM line 1483).

- The residue of (dt/t)⊗h along a local boundary parameter is h, with the corresponding Tate shift.
- Exactness holds on every filtration step and the rigid comparison, not only after forgetting the filtration.
- Res φ=φ_(H⁰D(−1)) Res, so the target Frobenius has the extra factor p.
- Pushout of an admissible extension along Res defines the Ext map and commutes with evaluation.

Use the logarithmic de Rham residue/Gysin sequence and its strictness from relative-hodge; proper-smooth X and finite-étale D use 6.4. Identify the rigid sequence via c and flat scalar extension; check Frobenius on the absolute fibres using `rigid-gysin`, with H²(U)=0 supplied by the affine curve hypothesis. Descend finite étale boundary data, retaining its entire cohomology module and trace. Apply coefficient pushout in Yoneda Ext and naturality of 1.5; symbol residue identities remain consumers’ theorems.

*Needs:* §6.2; §6.4; §1.3; §1.5; contract `relative-hodge`; contract `relative-rigid-coefficients`; contract `rigid-gysin`.

**Checks.**

- For P¹−{0,∞}, Res(dlog t)=(1,−1) in O²(−1); Gys is the sum, hence the composite is zero.
- Over ℤ_2 take D⊂P¹ given by t²+t+1, an unramified quadratic étale divisor. H⁰(D) has rank 2, Gys is its field trace, and H¹(P¹−D) is rank-one trace-zero part with twist (−1); Frobenius acts by −2. A boundary indexed by rational sections would miss it.
- A nonempty smooth projective curve X/S with D empty has nonzero H². It does not satisfy the affine U curve hypotheses, so 0→H¹X→H¹X→0→H²X→0 is not exported as exact.
- For X=P¹_k and D empty, U=X has H²_rig(U)=K0(−1); the general rigid localization sequence retains H²_rig(X)→H²_rig(U) as identity. This proper curve is excluded by the affine U/S hypothesis of the short relative sequence.

### 6.7 Geometric extension projections

For a smooth affine u:U→S satisfying all hypotheses of 6.2, including its independent algebraic conditions, and n≥0 with F^(n+1)H^n_dR=0, set H=H^n(U/S)(n+1). Export δ:Ext¹(O,H)→Ω¹_BK⊗F^nH^n_dR and R_σ:Ext¹(O,H)→B†_K⊗H^n_dR as the canonical components of 1.6. They satisfy dδ=0 and (1−Φ_(n+1))δ=dR_σ. For the setting of AM §2.7 additionally retain F^(n+1)H^(n+1)_dR=0; it is an application hypothesis, not a condition on the general coefficient construction. The maps commute with residue and filtered base change when the cohomology comparisons are defined. Assume p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; U and S affine; u smooth; all hypotheses of 6.2 hold, including its independent algebraic finiteness, Hodge-filtration and connection conditions; n≥0; F^(n+1)H^n_dR=0; the AM §2.7 application also assumes F^(n+1)H^(n+1)_dR=0. (AM, §2.7, equation (2.22), p. 19; AM line 795, AM line 799, AM line 808).

- δ is the algebraic connection component of the unique filtered lift.
- R_σ is the overconvergent (1−Φ) component, with the Frobenius acting also on base forms.
- After the Tate shift of 6.6, the two components commute with the coefficient residue map.
- δ transports identically on the de Rham side; R changes through the supplied lift-change equivalence.

Substitute the Tate filtration in 1.6 and use the cohomology object of 6.2. F⁰H=F^(n+1)H^n=0 removes the coboundary ambiguity. Horizontality, strictness and the Tate shift in 6.6 prove residue compatibility. The extra vanishing in AM §2.7 is retained only for that geometric application, and symbols are not defined here.

*Needs:* §1.6; §6.2; §6.5; §6.6.

**Checks.**

- A split geometric extension has δ=0 and R_σ=0.
- For U=G_m/S, n=1, H¹(U/S)(2)=O(1), so F⁰=0 and the residue extension lands in H⁰(D/S)(1), not twist (2).
- For n=0, H=H⁰(U/S)(1); the construction uses weight 1 with no sign reversal. No artificial n≥1 restriction is introduced.

### Examples

For P¹/S compute H⁰=O, H¹=0 and H²=O(−1). For G_m/S compute the residues of dlog t. A nonsplit quadratic étale boundary tests descent of the residue target.

### Dependencies

Layer 1; Layer 2 comparison diagram; AdicSpacesPartIV §§F1.5,F1.7–F1.9; RigidAnalyticGeometry §§7.3–7.4,8.1,8.4; contracts relative-rigid-realization, relative-rigid-coefficients, relative-rigid-projective-finiteness, relative-rigid-log-finiteness, relative-hodge, rigid-gysin and rigid-realizations. Every contract is used on its stated domain.

## Layer 7: Frobenius-point specialization and absolute evaluation

### 7.1 Frobenius-compatible lifts of residue points

Let V=W(k), k perfect, Z=Spec(C) smooth affine over W(k), and (σ_m) a compatible system of p-Frobenius lifts on C/p^m extending Witt Frobenius F_W. For every a∈Z(k) construct the unique W(k)-point P_a lifting a such that P_a∘σ=F_W∘P_a on the p-adic completion, equivalently at every finite level. Give reduction, naturality for Frobenius-compatible morphisms and uniqueness APIs. This is not a choice of an arbitrary analytic lift. Here p prime; k perfect of characteristic p; V=W(k); Z smooth affine over W(k); Compatible σ_m exist for all m≥1. (AM, Lemma 3.8, pp. 28–29; AM line 1229–1287).

- P_a modulo p equals a.
- At every m, P_aσ_m=F_WP_a.
- Any W(k)-point with the same reduction and these equations equals P_a.
- A morphism commuting with the σ_m carries P_a to the lift of its residue point.

Use formal smoothness for successive lifting and the contraction of F_W⁻¹σ on lifts modulo p^m: the next value depends only on the previous reduction. Uniqueness follows at every finite level, and p-adic completeness produces a W(k)-point. This is a mathematical existence proof, not an algorithm target.

*Needs:* AdicSpacesPartIV §F1.5; contract `relative-rigid-coefficients`.

**Checks.**

- For Z=A¹_W and σ(t)=t^p, P_0(t)=0.
- For the same σ, P_a(t)=[a], since F_W[a]=[a]^p; P_1(t)=1.
- Over ℤ_p, t↦p lifts the residue point 0 but is not compatible with σ(t)=t^p because p^p≠p. With σ(t)=t^p+p the compatible lift of 0 is instead congruent to p modulo p².

### 7.2 Detection by lifts over an algebraically closed residue field

Let k be algebraically closed of characteristic p, C smooth affine over W(k), and M finite locally free over C_hat[1/p]. Choose for every a∈Spec(C/p)(k) any W(k)-point P_a lifting a. If x∈M has zero image in M⊗_(C_hat[1/p]),P_a Frac(W(k)) for every a, then x=0. Frobenius compatibility is unnecessary for this detection theorem; the canonical lifts of 7.1 are one allowed choice. Here p prime; k algebraically closed of characteristic p; C smooth affine over W(k); C_hat its p-adic completion; M finite locally free over C_hat[1/p]; One lifting P_a is specified for every k-point. (AM, Lemma 3.9, p. 29; AM line 1289–1301).

- Two sections agreeing at all P_a are equal, by applying detection to their difference.
- The zero-rank case is included.
- The conclusion holds for any such system of lifts, not only a chosen Frobenius system.

Embed the finite projective module as a direct summand of a finite free module. For a nonzero coordinate clear p-denominators and divide by its largest common p-power; its reduction modulo p is nonzero. Vanishing at all residue points contradicts the Nullstellensatz for the reduced smooth special fibre. If the special fibre is empty, C_hat=0 and the conclusion is the zero-module case.

*Needs:* RigidAnalyticGeometry §7.3; AdicSpacesPartIV §F1.5.

**Checks.**

- For M=0 the only section is zero, so no nonzero-rank hypothesis is introduced.
- For M=C_hat[1/p], x=1 evaluates to 1 at every existing residue lift and is not detected as zero on nonempty Spec(C/p).
- For k=𝔽_p, C=W(k)[t], the nonzero section t^p−t vanishes at every Teichmüller lift of the finitely many 𝔽_p-points. Algebraic closedness cannot be omitted.

### 7.3 Specializing extensions and their representatives

On the W(k) base of 7.1, suppose σ comes from the fixed overconvergent lift defining FilFMIC. Pullback along P_a, extending continuously to C_hat and its generic fibre, carries any admissible extension E of O by H to its absolute coefficient extension and carries u_i(E) to u_i(P_a*E). For F⁰H=0 the unique filtered lift specializes, so dP_a(δ(E))=δ(P_a*E)=0 (pullback as a differential form, not merely tensor evaluation in the cotangent fibre) and R_σ(E)|P_a=R_(F_W)(P_a*E). Use the pullback on connection complexes and its completion map. The formula compares actual extensions; it is not an assertion about arbitrary unrelated tuples. Assume the hypotheses of 7.1 and the overconvergent σ of 1.1; H∈FilFMIC(Z,σ); E is an admissible extension; For representative formulas F⁰H_dR=0. (AM, Pullback (2.1), Lemma 2.5 and proof of Theorem 3.7, pp. 5,7,30–31; AM line 206, AM line 283, AM line 1352–1364).

- The specialization square for u_i commutes for every i≥0.
- The unique F⁰ lift of 1 pulls back to the unique F⁰ lift of 1.
- The Frobenius equation P_aσ=F_WP_a identifies (1−Φ)e after pullback with its absolute representative.

Apply conflation-exact pullback and the naturality of the connecting maps defining u_i. Uniqueness of the filtered lift identifies its pullback. The Frobenius-compatibility equation of P_a is essential in the second component; extension to the completed generic base is the supplied continuous pullback map.

*Needs:* §1.2; §1.5; §1.6; §7.1; contract `relative-rigid-coefficients`.

**Checks.**

- The split extension remains split, and its R-value is zero at every compatible point.
- For Z=Spec(W(k)), specialization is identity on the extension and on R.
- For σ(t)=t^p on ℤ_p[t], evaluation at t=p does not commute with Frobenius. The formula obtained by simply substituting t=p into (1−Φ)e is not an absolute F_W-Frobenius extension representative.

### 7.4 Absolute log-syntomic and rigid syntomic comparison

Let Y be smooth projective over W(k), D a relative normal-crossings divisor, M the horizontal log structure induced by D alone, over W(k) with trivial log structure, and U=Y−D. For every r≥0 construct RΓ_log-syn((Y,M),ℚ_p(r))≃RΓ_rsyn(U,r), inducing the AM cohomology comparison in every degree. Identify both with the fibre of F^rRΓ_log-dR(Y_K,M_K)→RΓ_log-cr(Y_k,M_k) with arrow (1−φ/p^r) composed with the de Rham/crystalline map. Prove compatibility with products, pullback of such pairs and the étale period maps: the horizontal-log and rigid periods supplied by `rigid-syntomic-etale-period` on exactly these projective W(k)-pairs. No regulator or symbol map is a premise. Here p prime; k perfect of characteristic p; V=W(k); Y/W(k) projective smooth; D relative normal-crossings; U=Y−D; the log structure is from D alone, not D∪Y0; r≥0. (AM, Lemma 3.10, equations (3.10)–(3.12), pp. 29–30; AM line 1302, AM line 1314, AM line 1327; BesserI Remark 8.7(3), BesserI line 1073).

- The equivalence is induced by filtered log/algebraic de Rham and log-crystalline/rigid realization comparisons.
- The cup square commutes with weight addition.
- The two period maps to generic-fibre étale cohomology commute through this equivalence.

Use RΓ_log-syn((Y,M),ℚ_p(r)) on the full log-syntomic domain of 3.4 and its local PD presentations, then apply the supplied filtered log de Rham/algebraic de Rham and relative log-crystalline/rigid comparisons to the two single-fibre presentations. This does not use the canonical-vertical-log arithmetic-pair C_st presentation. Since V=W(k), 2.3 applies without changing base fields. The multiplicative realization diagram induces the fibre equivalence, and the period square supplied by `rigid-syntomic-etale-period` identifies its composite with the horizontal-log period on this pair. The regulator square in AM Lemma 3.10 is a downstream application, not needed for this construction.

*Needs:* §2.3; §3.2; §3.4; contract `rigid-realizations`; contract `relative-hodge`; contract `rigid-log-crystalline`; contract `rigid-syntomic-etale-period`.

**Checks.**

- For Y=Spec(W(k)), D empty, r=0 the comparison identifies the same fibre of 1−φ on K0.
- For Y=P¹_W,D={0,∞}, it identifies dlog t and its Frobenius p dlog t in the two realizations.
- For j:Spec(ℚ_p)→Spec(ℤ_p), weight 1 gives H¹_rsyn(Spec(ℤ_p),1)=ℚ_p but RΓ_rsyn(Spec(ℚ_p),1)=0, while j_K=id. A period natural for this j would force the point period to vanish, contrary to its injection with image H¹_f(ℚ_p,ℚ_p(1)) (KLZ line 275–280). This j is outside the projective-pair period contract; Layer 2 still admits both schemes.
- For p=3 and L=ℚ_3(√2) viewed over ℤ_3, the empty special fibre gives H⁰_rsyn(Spec(L),0)=L while H⁰_et(Spec(L),ℚ_3)=ℚ_3. A normalized product-compatible period would give a unital ℚ_3-algebra map L→ℚ_3, forcing a root of x²−2; reduction modulo 3 has square values 0,1, so no such root exists. Spec(L) is also outside the projective-pair period contract.
- For Y=Spec(ℤ_p), D empty and r=1, the horizontal-log/rigid fibre has H¹=ℚ_p. Adding the canonical vertical log gives the C_st point complex ℚ_p→ℚ_p³→ℚ_p, with first differential ((1−p⁻¹)x,x,0) and second differential zero, so H¹=ℚ_p². These two log structures cannot share an equivalence.

### 7.5 The absolute target of relative evaluation

In 7.4 fix n≥0 and r=n+1. Assume H^n(F^rRΓ_dR(U_K))=H^(n+1)(F^rRΓ_dR(U_K))=0, and assume the geometric coefficient H=H^n(U/W(k))(r) of 6.2 has F⁰=0. The connecting map identifies H^n_rig(U_k/K0) with H^(n+1)_rsyn(U,r). Compose R_(F_W):Ext¹(O,H)→H^n_rig with this connecting isomorphism, and with 7.4, to define the absolute extension value in H^(n+1)_log-syn((Y,M),ℚ_p(r)). For a family and compatible point whose fibre satisfies these hypotheses, this value equals the image of R_σ(E)|P_a under the same connecting map. Products and period compatibility are those of the comparison maps; no equality of symbol-defined regulators is asserted. Assume the hypotheses of 7.4; n≥0; r=n+1; H^n(F^rRΓ_dR)=H^(n+1)(F^rRΓ_dR)=0 as filtered-complex hypercohomology; H^n(U/W(k))(r) is a coefficient object with F⁰=0; the family specialization statement retains all hypotheses of 6.2, including its independent algebraic conditions, filtered base-change isomorphisms and the compatible point of 7.3. (AM, Lemma 3.10 and proof of Theorem 3.7, pp. 30–31; AM line 1352, AM line 1379–1400; BesserI Proposition 6.3, BesserI line 727).

- The connecting class of b is represented by (0,b) in the chosen fibre, fixing its positive sign.
- Coefficient base change and Frobenius-compatible specialization commute with the value.
- Applying the log or rigid period map of the projective W(k)-pair contract gives the same étale class.

Use the long exact sequence for the unramified single fibre of 2.3. The two explicit hypercohomology vanishings make the connecting map an isomorphism. Apply 1.6 for the remainder, 7.3 for specialization and 7.4 for the absolute log target. This fixes only the fibre sign; the (−1)^n in the AM symbol comparison belongs to the regulator consumer.

*Needs:* §6.7; §7.3; §7.4; §2.3; contract `rigid-syntomic-etale-period`.

**Checks.**

- For a smooth curve with a good W(k) normal-crossings compactification, n=1,r=2 gives F²Ω•=0. Thus H²_rsyn(U,2)≃H¹_rig(U); the value is the connecting image of R, with no extra negative sign introduced here.
- A split extension has absolute extension value zero.
- If H^(n+1)(F^rRΓ_dR) is nonzero, the fibre exact sequence has a further filtered contribution; the connecting map need not be surjective and no inverse is exported.

### Examples

Teichmüller points, a rank-zero module and the polynomial t^p−t distinguish the point-lifting and point-detection hypotheses. On a curve, the weight-two absolute fibre identifies with H¹_rig.

### Dependencies

Layers 1–6; AdicSpacesPartIV §§F1.5,F1.9; contracts rigid-realizations, rigid-log-crystalline, relative-hodge, relative-rigid-coefficients and rigid-syntomic-etale-period. Every contract is used on its stated domain.

## Downstream consumers

- **PadicHodgeRegulators**: Rigid/log syntomic producers, period maps, exact-category extension evaluation, geometric coefficient objects, residue and specialization maps. Owns all symbol/regulator constructions, the AM (−1)^n symbol comparison and its restricted hypotheses.
- **EllipticRegulators**: Absolute syntomic targets and relative open-curve residues/evaluation, via regulator producers; no reverse dependency.

The direction of supply is the named suppliers → CohomologyComparisonsPartII → regulator consumers. ColemanIntegrationPartII §§3.0c,3.1a,7.0 constructs its curve, index and Tate-chart bridges on the common rigid realizations; those interfaces and this roadmap’s syntomic values meet in regulator applications. Its integration theory requires no construction from this Part II. The classical curve comparison and residue interfaces keep nonsplit finite étale boundaries; scalar-extension and trace comparisons of the imported realizations remain explicit base contracts. No integration pairing, regulator or special-value theorem is silently added to those contracts.

## References

All mathematical statements and proof descriptions are paraphrases. Locators refer to the versions below. The source identifiers below also label the line-numbered source locators used throughout the roadmap.

- **BesserI** — Amnon Besser, *Syntomic regulators and p-adic integration I: Rigid syntomic regulators* (2000), manuscript version, §§4–6, Remark 8.7(3) and Corollary 9.10, manuscript pp. 9–20,28,32. BesserI line 328, BesserI line 405, BesserI line 491, BesserI line 500, BesserI line 648, BesserI line 712, BesserI line 719, BesserI line 727, BesserI line 752, BesserI line 1073, BesserI line 1209–1216. The fibre diagram uses Definition 6.1 and the cone description in Proposition 6.3, with the compatible single-fibre convention of AM equations (3.11)–(3.12).
- **KLZ** — Guido Kings, David Loeffler and Sarah Livia Zerbes, *Rankin–Eisenstein classes for modular forms*, [arXiv:1501.03289v2](https://arxiv.org/abs/1501.03289v2), Theorem 2.4.2(1) and Remark 2.4.3, pp. 6–7, KLZ line 275–315. These are the locators in the arXiv v2 text; the smooth-pair comparison there is over ℤ_p. The general W(k) horizontal-pair comparison used here is AM Lemma 3.10.
- **EN** — Veronika Ertl and Wiesława Nizioł, *Syntomic cohomology and p-adic motivic cohomology*, [arXiv:1603.01705v2](https://arxiv.org/abs/1603.01705v2), §§2.1–2.2, Proposition 2.1, Theorems 2.2,2.3 and 2.5, pp. 4–9; EN line 158, EN line 193, EN line 243, EN line 306, EN line 318, EN line 326–335, EN line 360. Its motivic comparisons are outside this producer.
- **CN** — Pierre Colmez and Wiesława Nizioł, *Syntomic complexes and p-adic nearby cycles*, [arXiv:1505.06471v4](https://arxiv.org/abs/1505.06471v4), §1.1.1/Theorem 1.1, §2.2.1, §2.4.3/Lemma 2.23, §2.6.2/Lemma 2.37, Theorems 4.14/4.16 and §5.1, pp. 2,10,23–24,28–29,49–57; CN line 67, CN line 78, CN line 422, CN line 968, CN line 1234–1239, CN line 2305, CN line 2384, CN line 2664. The bound retained here is the v4 statement including its p=2 qualification, not the shorter EN summary.
- **HK** — Osamu Hyodo and Kazuya Kato, *Semi-stable reduction and crystalline cohomology with logarithmic poles*, Astérisque 223 (1994), Exposé V, 221–268, [Numdam open text](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §§3.2–3.6 and Theorem 5.1; HK line 698, HK line 715, HK line 730, HK line 770, HK line 1321, HK line 1340.
- **NN** — Jan Nekovář and Wiesława Nizioł, *Syntomic cohomology and regulators for varieties over p-adic fields*, [arXiv:1309.7620v5](https://arxiv.org/abs/1309.7620v5), Theorem A(1),(4), §3.2/equation (32), Propositions 3.8 and 3.18 (p. 33, NN line 1688–1691), §4.1, Proposition 4.6, Corollary 4.11; NN line 85, NN line 93, NN line 1299, NN line 1387, NN line 2324, NN line 2400, NN line 2778. Cite this version’s numbering; no conversion to published pagination is assumed.
- **AM** — Masanori Asakura and Kazuaki Miyatani, *Milnor K-theory, F-isocrystals and Syntomic Regulators*, [arXiv:2007.14255v2](https://arxiv.org/abs/2007.14255v2), Definitions 2.1,2.3,2.4,2.12; Lemma 2.5; Propositions 2.15,2.17–2.18; Lemma 2.19 with its affine proof domain; equation (2.22); Lemmas 3.8–3.10; Theorem 3.7 and §4.1 only for consumer compatibility contracts. AM line 117, AM line 131, AM line 181, AM line 249, AM line 283, AM line 451, AM line 512, AM line 567, AM line 587, AM line 609, AM line 808, AM line 1229, AM line 1289, AM line 1302. The Frobenius datum is a module isomorphism; a coefficient module is not required to be an algebra.
- **Buhler** — Theo Bühler, *Exact Categories*, [arXiv:0811.1480v2](https://arxiv.org/abs/0811.1480v2), Definition 2.1, p. 5, Buhler line 195; §12, pp. 42–48, Buhler line 2215, for exact-category proof context. This is not an assertion that an enough-projectives construction covers every coefficient category.
- **TsujiNearby** — Takeshi Tsuji, *On p-adic nearby cycles of log smooth families*, Bulletin de la Société Mathématique de France 128 (2000), 529–575, [Numdam open text](https://www.numdam.org/article/BSMF_2000__128_4_529_0.pdf), Theorems A3–A4, p. 563; Lemmas 4.3–4.4, pp. 551–553; proof of Theorem 4.2, pp. 554–555; Lemmas 3.2 and 5.2, pp. 547,555–557; proof of Theorem 5.1, pp. 558–561; Proposition A15, p. 570. TsujiNearby line 679, TsujiNearby line 805, TsujiNearby line 873, TsujiNearby line 892, TsujiNearby line 954, TsujiNearby line 1074, TsujiNearby line 1211, TsujiNearby line 1231, TsujiNearby line 1442.
- **StacksRlim** — The Stacks Project authors, *More on Algebra*, [Tag 07KV](https://stacks.math.columbia.edu/tag/07KV), Lemmas 15.88.1–15.88.2 and the two-term derived-limit construction; StacksRlim line 10638–10675.
- **MathlibSpanReview**, **MathlibPadicReductionReview**, **MathlibPadicLattice**, **MathlibLinearProd**, **TauCetiLinearYonedaReview**, **MathlibPin**, **MathlibCone**, **MathlibExt**, **MathlibBDeRhamReview**, **TauCetiCone**, **TauCetiSyntomic**, **TauCetiExactReview**, **TauCetiExactFunctorReview**, **TauCetiExactMonoidal**, **TauCetiExactOpposite**, **TauCetiExtReview** — the pinned open Lean files and declarations listed in the exact supplier contracts; The Mathlib files are at [the Mathlib pin](https://github.com/leanprover-community/mathlib4/tree/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib) and the Tau Ceti files at [the Tau Ceti pin](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti). Code is provenance for existing carriers, not the mathematical specification of new comparison theorems.
