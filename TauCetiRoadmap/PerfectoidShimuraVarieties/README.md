# Roadmap: Shimura towers and perfectoid representability

**Summary.** Starting with canonical models at finite level, construct the infinite p-level Shimura diamonds, identify the Siegel, Hodge-type and pre-abelian towers represented by perfectoid spaces, and construct the Hodge–Tate period maps and coefficient torsors on the appropriate towers. The end results are Scholze’s Siegel and image-compactified Hodge-type theorems, Hansen–Johansson’s genuine minimal and pre-abelian representability theorems, and the toroidal and abelian-type period-map comparisons. The open tower, the image compactification and the genuine minimal compactification have different proofs and are kept distinct.

## Scope and ownership

This roadmap owns the perfectoid representability arguments and their applications to Shimura towers. ShimuraData supplies the data and algebraic flags; ShimuraVarieties supplies finite canonical models and their maps; ShimuraCompactifications supplies finite-level boundary geometry and cone-compatible compactifications. AdicSpaces and AdicSpacesPartII supply analytification and adic foundations. PerfectoidSpaces supplies perfectoid rings, tilting, tilde-limits and closed-locus comparison; PerfectoidQuotients supplies general quotient foundations; DiamondsAndVStacks supplies the sheaf and diamond categories and their limits. The existing TauCetiRoadmap AdicSpaces, AnalyticToricGeometry, AlgebraicVectorBundles and ProfiniteArithmetic provide their general foundations. Those theories are imported here.

General Huber-pair spectra and adic gluing are supplied by AdicSpaces Layers 0–5; regular-cone analytic charts, fan gluing and boundary strata to AnalyticToricGeometry Layers 2–5; finite locally free sheaves, polynomial operations and total-space equivalences to AlgebraicVectorBundles L0B–L2B; and the generic profinite completion, powers and continuous automorphisms to ProfiniteArithmetic Layers 0–2. The matrix adjugate and its anti-multiplicativity are supplied by `TauCeti.adjugateGL` and `TauCeti.adjugateGL_mul` in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Adjugate.lean`, at the pins. The Hilbert constructions here add the moduli interpretation, polarization action, target-generator dependence and descent across the three towers.

The arbitrary-data coefficient group in Layer 6 is the rank-removing quotient `G^r` of §6.1a. The quotient `G^c` supplied by ShimuraData §4.9 and AutomorphicBundles B0.1 is identified with it under the CM-split-centre hypothesis. Section 6.1a owns the general quotient, its effective-central-kernel theorem and the pullback of canonical principal and logarithmic models from the quotient datum.

HodgeTateAndCanonicalSubgroups §§2.1–2.3 owns the finite p-level towers, their right and prime-to-p translations, and the infinite open/minimal limit v-sheaves. Its §§2.12–2.13 supplies the open period map and Levi/bundle pullback. Layer 3 identifies their analytic incarnation on the perfectoid representative and extends them to the stated compactifications. ReductiveGroups Layers 7–8, ShimuraData §§3.7–3.9 and AutomorphicBundles §§B0.3–B0.5 supply the representable flags and universal parabolic/Levi torsors. HodgeTateAndCanonicalSubgroups §§3.3–3.8, 4.1–4.7 supplies canonical subgroups, quotient radii and canonical–anticanonical comparison; its Layers 6–8 supplies log foundations and the Hodge-type finite-level logarithmic comparison with the central-cocharacter Tate twist; §6.1a here owns the arbitrary-data canonical association. Layer 1 identifies AutomorphicBundles B3.HT’s shared Siegel construction with the finite-level towers and cyclotomic conventions here; Layer 6 owns the tower triviality/log-to-v bridge.

AutomorphicBundles §§B3.HT.2–B3.HT.3 supplies the Hasse charts, characteristic-p Hebbarkeitssatz, good triples, finite-cover stability and normalized traces used in §§1.3–1.22. Its §§B3.HT.4–B3.HT.6 supplies the Siegel minimal and toroidal towers and the closed Hodge-type toroidal towers. The identifications here preserve their finite-level moduli spaces, completed rings, boundary ideals and period maps. Pre-abelian representability in Layer 4 supplies no period map for arbitrary pre-abelian data. The minimal period map in Layer 6 is for abelian type. General toroidal towers are diamonds; perfectoid toroidal representability is asserted only in the Siegel case and for the specified Hodge-type cone decompositions.

## Conventions

Fix a rational prime `p`, tame level `K^p` and, unless a result specifies another base, a complete algebraically closed extension `C/ℚ_p` with an embedding of the reflex field and its fixed untilt. Index by compact open `K_p`, with transition maps from smaller to larger subgroups. A cofinal family has a containment witness for every open level. A descending family of closed subgroups inside one compact group with trivial intersection is cofinal by compactness; trivial intersection without those hypotheses is not a substitute for a witness.

Right tower translations satisfy `T_(gh)=T_h∘T_g`, so their permutation homomorphism uses the opposite group. The arithmetic central kernel can remain nontrivial at neat finite level. The effective deck group divides out its actual closure. Coefficient descent also requires that kernel to act trivially on fibres. A full tower, its neutral-component tower and a tower retaining a moduli rigidification are different objects. An infinite fixed-pairing fibre is closed; the profinite family of such fibres need not consist of open components.

For integral `GSp`, write `c` for the similitude multiplier. The group `Γ₀(p^m)` has lower-left block zero and `c=1` modulo `p^m`. Its determinant is `c^g`, so determinant-one congruence is weaker in genus greater than one. The group `Γ₁` fixes both diagonal blocks, and `Γ` fixes the whole matrix. At `m=0` all three are the full integral group. Put `U_0=ℤ_p^×` and `U_m=ker(ℤ_p^×→(ℤ/p^m)^×)` for `m≥1`. The strict Iwahori has diagonal reduction and `c=1` modulo `p; Γ₁` instead permits upper unipotents.

Use the right flag quotient `FL=P_μ\G`. The Siegel cocharacter `μ(t)=diag(1_g,t1_g)` gives the lower-block parabolic `B=0`. Inversion transports `G/P` to `P\G`. The graph chart has row frame `(1,Z)`, symmetric `Z`, and column kernel `(−Z;1)`. For `γ=(A B;C D)`, the frame factor is A+ZC and the transformed coordinate is `(A+ZC)⁻¹(B+ZD)`. The W-dual frame carries the additional `c(γ)⁻¹` factor. A chosen Tate generator requires the corresponding transported linearization. Distance domains are neighbourhoods of every integral matrix, rather than only a disc about zero. In strict-depth groups a valuation bound `>m` means membership for some positive epsilon in depth `m+`epsilon.

At a changed p-level, retain the actual cusp lattice: smoothness of a fan in the base lattice does not imply smoothness in that changed lattice. Use compatible fs logarithmic Kummer charts. A finite toroidal quotient can ramify at the boundary despite being Galois and étale on the interior. Normalization, Zariski closure and integral plus-ring completion are separate operations and require their stated comparison inputs.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations supply only the stated portions.

- `mathlib:CategoryTheory.Functor` (module `Mathlib/CategoryTheory/Functor/Basic.lean`): Functors between categories; the p-level tower is a functor from the poset of compact open subgroups of `G(ℚ_p)`.
- `mathlib:CategoryTheory.IsCofiltered` (module `Mathlib/CategoryTheory/Filtered/Basic.lean`): Cofiltered categories; the compact open subgroups of `G(ℚ_p)` under inclusion form a cofiltered poset, the index category of the towers.
- `mathlib:CategoryTheory.Limits.limit` (module `Mathlib/CategoryTheory/Limits/HasLimits.lean`): The chosen limit of a functor under `[HasLimit F]`. This does not establish existence of limits in v-sheaves; DiamondsAndVStacks D5 supplies that existence.
- `mathlib:CongruenceSubgroup.Gamma` (module `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): The principal congruence subgroup `Γ(N)` of `SL(2, ℤ)`, the kernel of reduction modulo `N`; compared with `Γ(pᵐ) ⊆ GL_2(ℤ_p)` in the `g = 1` test.
- `mathlib:CongruenceSubgroup.Gamma0` (module `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): `Γ₀(N) ⊆ SL(2, ℤ)`: lower-left entry `≡ 0 mod N`.
- `mathlib:CongruenceSubgroup.Gamma1` (module `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): `Γ₁(N) ⊆ SL(2, ℤ): a ≡ d ≡ 1` and `c ≡ 0 mod N` (`Gamma1_mem`), the same orientation as Scholze's `Γ₁(pᵐ)`.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (module `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`): The finite adele ring of a Dedekind domain as a restricted product of completions; `G(𝔸_f)` and its prime-to-p part are formed from it.
- `mathlib:Matrix.GeneralLinearGroup` (module `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): `GL n R` as the units of the matrix ring; `GSp_2g` is defined as a subgroup of it.
- `mathlib:Matrix.J` (module `Mathlib/LinearAlgebra/SymplecticGroup.lean`): The matrix `J = fromBlocks 0 (−1) 1 0` of the standard symplectic form (the negative of Scholze's form).
- `mathlib:Matrix.det` (module `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): The determinant; `det(A + ZC)` in the strict-Iwahori bound.
- `mathlib:Matrix.fromBlocks` (module `Mathlib/Data/Matrix/Block.lean`): Block matrices `(A B; C D)`; the graph-chart computation `(1 Z)·(A B; C D)`.
- `mathlib:Matrix.symplecticGroup` (module `Mathlib/LinearAlgebra/SymplecticGroup.lean`): The submonoid of matrices A with `A J Aᵀ = J` (similitude factor 1); `GSp_2g` with similitude 1 is this group.
- `mathlib:Module.Grassmannian` (module `Mathlib/RingTheory/Grassmannian.lean`): The structure of submodules with finite projective quotient of constant `rank k` (rankAtStalk), extending Submodule. It supplies a module-valued carrier, not a Grassmannian scheme or the Lagrangian closed subscheme; those geometric constructions are imported from ShimuraData D3.
- `mathlib:MonoidHom.ker` (module `Mathlib/Algebra/Group/Subgroup/Ker.lean`): The kernel of a group homomorphism as a subgroup; effective deck groups are quotients by the kernel of the action.
- `mathlib:MulAction.stabilizer` (module `Mathlib/GroupTheory/GroupAction/Defs.lean`): The stabilizer subgroup of a point; the stabiliser of the neutral component.
- `mathlib:MulAction.toPermHom` (module `Mathlib/Algebra/Group/Action/End.lean`): The permutation homomorphism for a left group action. For the right translation law `T_(gh)=T_h∘T_g`, use the opposite group before taking this homomorphism and its kernel.
- `mathlib:NumberField.RingOfIntegers` (module `Mathlib/NumberTheory/NumberField/Basic.lean`): The ring of integers `𝒪_F` of a number field, the coefficient ring of Hilbert–Blumenthal abelian varieties and of `Res_{𝒪_F/ℤ}ℙ¹`.
- `mathlib:PadicInt` (module `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The p-adic integers `ℤ_[p]`; level groups are subgroups of `GSp_2g(ℤ_p)`.
- `mathlib:Subgroup.topologicalClosure` (module `Mathlib/Topology/Algebra/Group/Subgroup.lean`): The closure of a subgroup of a topological group as a subgroup; the kernel `Z_{K^p}` is the closure of the rational central elements.
- `mathlib:frobenius` (module `Mathlib/Algebra/CharP/Lemmas.lean`): The ring homomorphism `x ↦ x^p` for a commutative semiring with ExpChar `R` p. It supplies scalar Frobenius, not geometric relative Frobenius or its twists; the latter are imported from the finite-level geometry supplier.
- `tauceti:TauCeti.exists_continuous_section` (module `TauCeti/Topology/Algebra/Group/Profinite/Section.lean`): For a closed subgroup `H` of a compact totally disconnected topological group `G`, the quotient map `G → G/H` has a continuous section sending the identity coset to 1 (Ribes–Zalesskii, Proposition 2.2.2); used for `ℤ_p^× ⊆ 𝒪_p^×` to split the contracted product `X ×^{ℤ_p^×} 𝒪_p^×`.

- `tauceti:TauCeti.adjugateGL` and `TauCeti.adjugateGL_mul` (module `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Adjugate.lean`): the adjugate on `GL` and its reversed product law, used directly for the Hilbert level action. Mathlib's `Matrix.det` is the alternating-pairing coordinate; no separate determinant definition is needed.

### From ShimuraData and ShimuraVarieties

ShimuraVarieties §§P.1–P.5 supplies pure and connected data, components, Hodge cocharacters, reflex fields, levels and basic moduli. ShimuraData §§3.7–3.10, 3.14–3.18 supplies filtration parabolics, reflex-field compact duals, Kostant representatives and integral Bruhat/Schubert loci; §§4.1–4.2 supplies pre-abelian type and the Hodge/abelian/pre-abelian implications; §4.6 supplies connected-to-full lifts. Its §§4.8–4.9 supplies Lovering's reflex-torus datum, centre and Levi identities. Hilbert data are §§5.3–5.4, with the trace embedding in HilbertModularVarietiesAndShimuraCurves §H0.0.

ShimuraVarieties §§0.1–0.6, 1.1, 1.4 supplies arithmetic stabilizers, effective actions, neat sublevels, component formulas, analytic points and translations; §§2.5–2.9 supplies Baily–Borel models and finite level maps. Canonical models are §§6.1–6.7 (Hodge inheritance, connected/full reconstruction, abelian existence) and §7.14 (general existence). Its §§8.1–8.8 supplies algebraic towers, translations, finite maps, datum functoriality and reciprocity on components; §§8.10–8.13, 8.16, 8.18–8.23 supplies full modular levels, determinant pairings and their fixed fibres, row-basis conventions, compact models, minimal descent, finite minimal extensions, Tate cusps, compatibility of correspondences and general-data towers. Model uniqueness is §4.12. All finite-level embedding claims are consumed through these suppliers; the targets here concern their perfectoid limits.

### From ShimuraCompactifications

ShimuraCompactifications §§C2.8, C2.general.1 supplies the minimal boundary map and general toroidal canonical models; §§C3.1–C3.4, C3.general.1 supplies refinements, level/datum maps, Hecke spans, independence and their general descent. The actual cusp lattices control admissibility at every level. Integral toroidal and minimal models, properness, the ample Hodge line and higher-level normalization are §§C5.3, C5.5, C5.16–C5.20. Hilbert ordinary polarization quotients and modular formal cusp comparison are §§C6.47, C6.50–C6.52. The additional full-level boundary and cofinal closed Hodge-embedding contracts are below.

### From adic geometry

AdicSpaces Layers 0–5 supplies spectra and gluing. AdicSpacesPartII §§R1.3–R1.4 supplies functorial analytification and compatibility with finite, étale and smooth maps. AdicSpacesPartIII §§R2.4–R2.5, R2.10 supplies specialization, generic fibres, admissible blow-ups, fractional Hasse domains and their transitions; §R3.8 supplies finite locally free analytic traces, transitivity, scalar base change and the finite étale trace pairing. These are morphism and sheaf contracts, beyond geometric points.

### From DiamondsAndVStacks

DiamondsAndVStacks §§D4.4–D4.6, D4.9 supplies v-sheaves, underlying spaces, compact Hausdorff diamonds and geometric-point isomorphism criteria; §§D5.1, D5.3 supplies spatiality and qcqs cofiltered limits with finite-stage comparisons. Its §§D6.4–D6.5 supplies analytic diamondification, gluing and the étale-site comparison with the untilt/base fixed. Maps between perfectoid representatives lift uniquely; maps to the smooth analytic flag use its actual functor on perfectoid tests, rather than full faithfulness for arbitrary analytic spaces.

### From PerfectoidSpaces and PerfectoidTowers

PerfectoidSpaces §§P0.5–P0.7 supplies almost modules, exact limits/colimits and monoidal almost isomorphisms; §§P1.31–P1.32 supplies the cyclotomic perfectoid field. Its §§P2.2–P2.3, P2.7, P2.9–P2.10, P2.17 supplies tilting, rational localization, integral almost acyclicity, affinoid bases and fibre products over analytic bases; §§P3.9–P3.13 supplies finite étale tilting and almost purity. Strongly Zariski closed immersions, their base change and tilting are §§P4.12–P4.15, P4.21. Limits, finite-stage finite étale approximation and profinite products are §§P5.3, P5.9, P6.8. The tilde-limit, good affinoid, Frobenius-tower, cofinality, uniqueness, represented-functor, gluing/base-change and perfectoid-tower interfaces are §§P7.2, P7.4–P7.6, P7.9–P7.14.

PerfectoidTowers §§P8.2, P8.7–P8.8, P8.10, P8.12, P8.14–P8.21 supplies invariant spectra, affinoid and covered quotients, rigid quotients, free finite-action torsors, Zariski embeddings, analytic separation, integral extensions, good towers and their finite quotients, and closed loci in towers. In particular finite towers over perfectoid towers use §P8.18; their good-tower refinements and finite-stage affinoid bases use §§P8.19–P8.20, and closed-subvariety pullbacks use §P8.21. Its §P8.18 also supplies the universal perfectoidization of integral extensions, including the completed generic pair and its universal property on perfectoid test pairs (Bhatt–Scholze Theorems 1.17(1), 10.11; Hansen–Johansson Lemmas 5.9–5.10).

PerfectoidQuotients §2.1 supplies characteristic-p quotient/radical perfectoidization. Integral-extension perfectoidization is PerfectoidTowers §P8.18; strong Zariski closedness is PerfectoidSpaces §P4.15.

### From HodgeTateAndCanonicalSubgroups

HodgeTateAndCanonicalSubgroups §§2.1–2.3 supplies `ShimuraTower.pLevel`, `pLevelMin`, `toMin`, transition laws, `translate`, `primeToPHecke`, `quotientAction`, `infiniteLevel`, `infiniteLevelMin`, projections, evaluation on perfectoid tests, topology and cofinal reindexing. The open projection at neat level is separated quasi-pro-étale and becomes affinoid pro-étale over strictly totally disconnected perfectoid tests. The full C-linear tower and fixed-pairing cyclotomic fibre are compared in §1.2. Sources: [Milne] §5, Theorem 5.28 and Remark 5.29, pp.64–65; [Diamonds] Lemma 11.22, p.63. The `GL₂` neat principal transition degree at `m≥1` is `p⁴`; for `(G_m,{Nm})` at full tame level the infinite component set is `ℤ_p^×/{±1}`. A positive-dimensional constant tower has no perfectoid representative.

Its §§0.5, 0.14–0.16, 0.18 supplies Fargues's cokernel bound, semi-abelian Hasse sections, ordinary loci, minimal extension and Raynaud filtration; §§2.5–2.10, 2.12–2.13 supplies absolute/relative Hodge–Tate sequences, flag points, parabolic reductions, the cyclotomically twisted Levi comparison and open-limit period/bundle pullback. Canonical-subgroup rigidity, existence, functoriality, quotient radii and canonical–anticanonical comparisons are §§3.3–3.8, 4.1, 4.3, 4.6–4.7; full-level Igusa comparison and modified models are §§5.2, 5.5–5.6. Log fs products, Kummer maps, boundary extensions, corrected pro-Kummer sites and perfectoid charts/bases are §§6.6, 6.12, 6.18–6.23, 6.27, 6.29. For Hodge-type data, canonical log systems, their period comparison, lattice filtration, parabolic reduction, cyclotomic Levi torsor and agreement with the open construction are §§7.29–7.30, 7.32, 7.34–7.36; the general logarithmic functors are §§7.24, 7.26. The canonical association for arbitrary pure data is §6.1a here. Retain the algebraizable finite-field family, radius endpoints, ramified generators, boundary and `p=2` qualifications of each input.

### From AutomorphicBundles and ReductiveGroups

ReductiveGroups Layers 7–8 supplies representable parabolic quotients, Levi subgroups and homogeneous torsors; ShimuraData §§3.7–3.9 and AutomorphicBundles §§B0.3–B0.5 identifies them with the reflex-field Hodge flag and its opposite/right-coset convention. This is the geometric supplier of the flag. AutomorphicBundles §§B0.1–B0.2 supplies the central split quotient and ineffective-fibre descent; §§B1.2–B1.7, B1.9 supplies absolute Hodge tensors, their descended frames, filtration reductions, Hodge and abelian canonical principal bundles and embedding independence; §B1.general.4 supplies general principal models. Its §§B2.1–B2.2, B2.6, B2.9 supplies automorphic coefficients, filtered de Rham coefficients and the Siegel tautological sequence. Canonical/subcanonical extensions and general boundary functoriality are §§B3.2–B3.4, B3.general.1, B3.general.3. The classical Tate normalization, `GL₂` Hodge line, split and unsplit Hilbert coefficients are §§B4.21, B4.10, B4.12, B4.14. Ramified-boundary torsor descent retains the separate contract below.

The shared Hodge–Tate contracts are consumed as follows.

| AutomorphicBundles supplier | Interface in this roadmap |
| --- | --- |
| §§B3.HT.2–B3.HT.3 | §§1.3–1.22: the same Hasse blow-up rings, anticanonical Frobenius charts, good triples, boundary ideals and normalized traces. |
| §B3.HT.4 | §§1.23–1.28: the same represented minimal Siegel tower, affinoid charts and period map. |
| §B3.HT.5 | §1.29: the same modified toroidal charts and induced-fan Siegel tower. |
| §B3.HT.6 | §3.8(c): the same closed Hodge-type toroidal tower and tensor-defined flag map. |
| §B3.HT.7 with §B0.3 | §§3.6, 3.8(c): the rational Levi comparison with the opposite/dual identification and central-cocharacter Tate twist. |

Each identification is the identity on the supplied finite-level moduli system. On affine charts it identifies the completed integral rings and their boundary ideals, commutes with restriction and level maps, and induces the identity on the represented limit functor. The cyclotomic presentation retains its fixed Weil-pairing system; §1.2 restores every similitude component of the full tower over `C`. Group and Galois maps retain the resulting semilinear action. Genuine-minimal, pre-abelian and general-data extensions belong to Layers 2, 4 and 6 here.

ReductiveGroupsPartII §§RG2.1.2–RG2.1.3 supplies rational root data and valued commutator estimates. Layer 6 constructs the specialized analytic-depth groups and tubes. Rational nonsplit compact subgroups cannot be factored for an arbitrary splitting-field parabolic merely by regrouping split roots.

### From finite moduli and general foundations

PELModuli §§M5.1–M5.2, M2.8–M2.9 supplies principally polarized Siegel moduli of every genus, universal abelian schemes, levels and good-reduction models. HilbertModularVarietiesAndShimuraCurves §§H1.8–H1.9, H3.1–H3.8, H4.1–H4.19, H5.1 supplies the linearized pairing, polarization quotients, finite geometric/intermediate/arithmetic levels, effective torsors, stable connected-unit limit and `F=ℚ` comparison; the precise consumed contracts are below. SchemeAndStackFoundations §§0.6, 2.1, 4.13 supplies coherent Hartogs, higher direct images and Serre normality; its Layers 1–2 supplies quotient sheaves/stacks, effective actions and descent in the stated topology. It supplies no finite-étale descent theorem across a ramified coarse quotient. AnalyticToricGeometry Layers 2–5 supplies regular cones, analytic toric charts, fan gluing and strata; AlgebraicVectorBundles Layers L0B–L2B supplies finite locally free sheaves and polynomial/total-space operations; ProfiniteArithmetic Layers 0–2 supplies completion, powers and continuous automorphisms.

### Application-specific geometric comparisons

The comparisons in this subsection are local targets in the indicated application sections. The supplier sections cited here provide their finite-level foundations.

Using ShimuraCompactifications §§C5.16–C5.20, prove in §1.22: At level `K^pΓ(pᵐ)` over `ℚ` for the Siegel datum (`K^p` contained in a level-N subgroup, `N ≥ 3` prime to `p`): the description of the boundary strata of the minimal compactification `X*_{Γ(pᵐ)}` and of the map `X*_{Γ(pᵐ)} → X*_{Γ₁(pᵐ)}` on them through lower-genus Siegel spaces (Faltings–Chai `V`, Theorem 2.5(4)–(6), pp. 152–153, at full principal level; Pilloni–Stroh Théorème A.11, p. 27), with the constancy of inertia along each stratum, as used in [Scholze] Lemma 3.2.35. The integral minimal and toroidal compactifications at good level are cited from the interfaces ShimuraCompactifications §C5.16, ShimuraCompactifications §C5.17, ShimuraCompactifications §C5.3, ShimuraCompactifications §C5.5 and ShimuraCompactifications §C5.19–C5.20.

This is consumed by §1.22.

AutomorphicBundles §B3.HT.6 supplies the closed Hodge-type toroidal embeddings over the finite models of ShimuraCompactifications §C3.general.1. Use a strictly compatible smooth projective Hodge/Siegel fan pair at an initial principal level, with trivial effective cone stabilizers, and induce both fans at deeper levels. The embeddings identify the reduced boundary ideals and commute with level maps and the maps to the minimal models. Their perfectoid closed limits and tensor-defined period maps are the objects compared in §3.8(c) (Lan, Closed immersions of toroidal compactifications of Shimura varieties, Propositions 4.9–4.10 and 6.1, author PDF pp. 14, 18–20).

This is consumed by §3.8.

From ShimuraVarieties Layer 2: Baily–Borel compactifications `Sh*_Γ(G, X⁺)` of connected Shimura varieties `Γ\X⁺` for every arithmetic `Γ ⊆ G(ℚ)_+` (also non-congruence and with torsion), over `ℂ`: normal projective, finite maps `Sh*_{Γ₁} → Sh*_{Γ₂}` for `Γ₁ ⊆ Γ₂` of finite index, the identification `Sh*_{Γ₁}/(Γ₂/Γ₁) ≅ Sh*_{Γ₂}` for `Γ₁` normal in `Γ₂`, and the finite maps for `G → G^ad` sending `(G(ℚ)_+ ∩ K)\X⁺` to `π(Γ)\X⁺` ([HJ] §5.3, Propositions 5.18–5.19).

This is consumed by §4.1, §4.3, §4.4.

From ShimuraData Layer 4: Connected Shimura data `(G, X⁺)` (Deligne's conditions on a semisimple `G` and a `G^ad(ℝ)⁺`-orbit) with the connected data `(G^der, X⁺), (G^ad, X⁺)` attached to a Shimura datum, and the pre-abelian notion for connected data: `(G, X⁺)` is of pre-abelian type if `(G^ad, X⁺) ≅ (G̃^ad, X̃⁺)` for a Hodge-type datum (Hansen–Johansson Definition 4.1, after Moonen 2.10), agreeing with ShimuraData §4.1 for full data.

This is consumed by §4.1, §4.5.

From ShimuraVarieties Layer 8: For a closed embedding of Shimura data `ι: (G, X) ↪ (G′, X′)` and `K = K′ ∩ G(𝔸_f)`: the extension `Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗ E` of the canonical-model map to minimal compactifications is finite, and maps the boundary to the boundary and the interior to the interior (used without reference by Scholze §4.1 and Hansen–Johansson Proposition 5.14).

This is consumed by §2.1.

From HilbertModularVarietiesAndShimuraCurves H1: For Hilbert–Blumenthal abelian varieties with `𝔠`-polarization: the `𝒪_F`-linearised Weil pairing `ẽ_n: A[pⁿ] × A^∨[pⁿ] → 𝔡⁻¹ ⊗ μ_{pⁿ}` with `e_{pⁿ} = Tr ∘ ẽ_n`, and the choice of a generator `β` of `𝔠𝔡⁻¹(1)` with its change-of-choice law (Birkbeck–Heuer–Williams Definitions 5.6–5.7).

This is consumed by §5.6.

From HilbertModularVarietiesAndShimuraCurves H3: The unit group `Δ(N) = 𝒪_F^{×,+}/((1 + N𝒪_F)^×)²` and the finite polarization quotient from the `G*`-variety (fixed polarization module) to the arithmetic G-variety, its `Δ(N)`-torsor over the quotient stack and its coarse torsor on the action-free locus, the maps attached to changing `𝔠` by isogenies (Birkbeck–Heuer–Williams Proposition 8.4 and Lemma 8.22).

This is consumed by §5.4, §5.7, §5.9.

From HilbertModularVarietiesAndShimuraCurves H4: At finite p-level: the `G*`, intermediate (G-level with fixed `G*`-polarization) and arithmetic `G` Hilbert varieties at levels `Γ*(pⁿ), Γ(pⁿ), Γ₀(pⁿ)` with the maps `β₁, β₂`; the level-structure action through `γ^∨ = det(γ)γ⁻¹` and the polarization action; the Weil-pairing components `(𝒪_F/pⁿ)^×` and `U_n`; the finite geometric/intermediate frame torsors under `Γ̄₀(p^m, pⁿ)`; the arithmetic, diagonal and polarization torsors over quotient stacks under `P̄Γ₀(p^m, pⁿ) = Γ̄₀/Z_n (Z_n = (1 + N𝒪_F)^×/(1 + pⁿN𝒪_F)^×), Ē(p^m, pⁿ), Δ(pⁿN)` and, on paired components, `Δ_n(N)`, with coarse torsors only on the respective action-free loci (the diagonal requires a free Ē-action) (Birkbeck–Heuer–Williams Lemmas 8.5–8.19, with the corrected stabilisation argument for `Δ_n(N)` when `p = 2`).

This is consumed by §5.4, §5.5, §5.6, §5.7, §5.8.

From HilbertModularVarietiesAndShimuraCurves H5: For `F = ℚ`: the identification of both Hilbert groups with `GL₂` and of the Hilbert moduli and level structures (`μ_N`-structures on `A, Γ(pⁿ)`-structures on `A^∨`) with the modular-curve ones of the full-level modular curves, with the sign conventions of the Weil pairing matched.

This is consumed by §5.1, §5.11.

From ShimuraData Layer 4: For an abelian-type datum and a Hodge-type central derived cover, construct Lovering’s auxiliary `B₁ = G₁ ×_{G₁^ab} Res_{E/ℚ}G_m` with the specified reflex-norm map, Shimura cocharacter, maps to `G₁` and `G` (through `B`), and common adjoint flag variety. Use its `Z_s, G^c` and Levi fibre-product identities in their stated range; §6.5 proves the corresponding identities for §6.1a’s rank-removing quotient. A lift through a fixed central isogeny alone does not supply these statements.

This is consumed by §6.4, §6.5, §6.6, §6.9.

Using AutomorphicBundles §§B3.general.1–B3.general.3, prove in §6.9: Prove descent of the pushed-out canonical de Rham/Levi torsor under the finite toroidal quotient in Boxer–Pilloni Theorem 4.4.43(5), arXiv v1 pp. 80–81, and Remark 4.6.6, pp. 89–90: identify boundary inertia on compatible toric charts, prove its action on the pushed-out fibres is trivial, and descend as an étale torsor; compare the logarithmic Hodge–Tate torsor. Coordinate the finite ramified quotient hypotheses with ShimuraCompactifications C3.general.

This is consumed by §6.9.

From DiamondsAndVStacks D6: Provide the fully faithful perfectoid-space-to-diamond functor with the analytic base/untilt fixed, so a map between diamonds represented by perfectoid spaces over `C` lifts uniquely to an analytic morphism. The general analytic diamond-functor statement does not imply full faithfulness for all analytic adic spaces. For Layer 3 also identify maps from a perfectoid space over `C` to the smooth analytic flag with maps to its diamond on perfectoid tests, using the flag’s actual analytic functor of points; full faithfulness between two perfectoid objects alone does not supply a nonperfectoid target.

This is consumed by §2.8, §3.5.

From ReductiveGroups Layers 7–8: Provide the reflex-field representable homogeneous Hodge–Tate flag `P_μ\G`, the universal parabolic torsor, its Levi quotient `U_P\G` and associated-bundle universal properties, including analytification and the inversion/opposite-parabolic dictionary. Coordinate with AutomorphicBundles B0. This is the generic interface required by the T2/open-tower suppliers; use it for the open-limit construction and its analytic comparison in Layer 3.

This is consumed by §3.1.

## How to read the build

Layer 0 fixes finite towers, right actions, central kernels and infinite diamonds. Layer 0.general adds arbitrary-data and toroidal diamonds. Layer 1 identifies the supplied perfectoid Siegel tower, anticanonical Frobenius tower, boundary extension and flag charts with the tower conventions here. Layer 2 separates the Hodge-type open, image and genuine minimal constructions. Layer 3 gives the analytic period map, coefficient comparisons and compactified extensions. Layer 4 proves pre-abelian representability through connected and adjoint descent. Layer 5 identifies the modular and three Hilbert towers and their pairing and level actions. Layer 6 constructs the general toroidal map and abelian-type descent, and the analytic Bruhat domains used for Levi reductions and Hecke correspondences.

`Suggested.lean` contains no headline theorem signatures at the pins. The Siegel, Hodge-type and pre-abelian representability theorems, Hilbert tower comparisons, and toroidal and abelian-type period-map theorems require Shimura models and towers, perfectoid spaces, diamonds, geometric Hodge–Tate filtrations and coefficient torsors. These objects are absent from the pinned libraries. Tau Ceti's adic spaces and Mathlib's module-valued Grassmannians and period rings supply foundations for their construction. The Lean names below specify mathematical target interfaces to be built; they do not denote declarations in `Suggested.lean`.

## Layer 0: finite and infinite towers

### 0.1 The level subgroups `Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ)` of `GSp_2g(ℤ_p)`

Define `GSp.gsp` as a subgroup of `Matrix.GeneralLinearGroup (g ⊕ g) R` for a commutative ring `R` and finite nonempty `g`, and `GSp.similitude` as its multiplier homomorphism. Specialization to `R = ℤ_p` gives reduction and the congruence subgroups below. These subgroup constructions and their API include the genus-one form identity `γJγᵀ = det(γ)J`. The arithmetic statements require `g ≥ 1` and `p` prime.

Let `g ≥ 1`, let `J = Matrix.J = (0 −1_g; 1_g 0)` be Mathlib's symplectic matrix on `ℤ_p^{2g}` (Scholze's form is `−J`; the similitude group and the level groups below do not depend on this sign), and let `GSp_2g(ℤ_p) = {γ ∈ GL_2g(ℤ_p) : γJγᵗ = c(γ)J for some c(γ) ∈ ℤ_p^×}` (equivalently `γᵗJγ = c(γ)J`; for `c = 1` this is Mathlib's `Matrix.symplecticGroup`), with similitude character `c : GSp_2g → G_m` and blocks of size `g × g`. For `m ≥ 1` put `Γ(pᵐ) = {γ ∈ GSp_2g(ℤ_p) : γ ≡ 1 mod pᵐ}, Γ₁(pᵐ) = {γ : γ ≡ (1 ∗; 0 1) mod pᵐ}`, and `Γ₀(pᵐ) = {γ : γ ≡ (∗ ∗; 0 ∗) mod pᵐ and c(γ) ≡ 1 mod pᵐ}`. Then `Γ(pᵐ) ⊆ Γ₁(pᵐ) ⊆ Γ₀(pᵐ) ⊆ GSp_2g(ℤ_p)` are compact open subgroups, `Γ(pᵐ)` is normal in `GSp_2g(ℤ_p), Γ₁(pᵐ)` is normal in `Γ₀(pᵐ)` with `Γ₀(pᵐ)/Γ₁(pᵐ) ≅ GL_g(ℤ/pᵐ)` through the upper-left block, and `Γ₀(pᵐ)/Γ(pᵐ)` is the group of block upper-triangular matrices in `GSp_2g(ℤ/pᵐ)` with similitude 1. The family `(Γ(pᵐ))_m` is cofinal among compact open subgroups of `GSp_2g(ℚ_p)`; the families `(Γ₀(pᵐ))_m` and `(Γ₁(pᵐ))_m` are not, and their intersections `Γ₀(p^∞) = ⋂_m Γ₀(pᵐ), Γ₁(p^∞) = ⋂_m Γ₁(pᵐ)` are closed subgroups that are not open.

The similitude condition in `Γ₀(pᵐ)` is `c(γ) ≡ 1 mod pᵐ`. The published Definition 3.1.1 prints `det γ ≡ 1 mod pᵐ`; since `det γ = c(γ)^g`, the printed condition is weaker for `g > 1` (it allows `c(γ) ∈ μ_g(ℤ/pᵐ)`) and does not give the stated field of definition `ℚ(ζ_{pᵐ})` of `X*_{Γ₀(pᵐ)}`.

For `g = 1, GSp_2 = GL_2, c = det`, and `Γ₀(pᵐ)` here is `{(a b; c d) ∈ GL_2(ℤ_p) : c ≡ 0, ad − bc ≡ 1 mod pᵐ}`, which differs from the classical `Γ₀(pᵐ)` of `GL_2(ℤ_p)` by the determinant condition.

For multiplier images at level zero, write `U_0 = ℤ_p^×` and `U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×)` for `m ≥ 1`; thus `U_m = 1 + pᵐℤ_p` only for `m ≥ 1`.

The conditions are preserved by products and inverses because reduction `mod pᵐ` is a group homomorphism `GSp_2g(ℤ_p) → GSp_2g(ℤ/pᵐ)` and the subsets defined modulo `pᵐ` (block upper-triangular, unipotent block upper-triangular, identity, similitude 1) are subgroups of `GSp_2g(ℤ/pᵐ)`; each is the preimage of a subgroup of a finite group, hence compact open. `Γ(pᵐ)` is the kernel of reduction, hence normal. The map `Γ₀(pᵐ) → GL_g(ℤ/pᵐ), γ ↦` upper-left block `mod pᵐ`, is a homomorphism on block upper-triangular matrices with kernel `Γ₁(pᵐ)` (for a symplectic similitude with `c ≡ 1` and lower-left block 0, the lower-right block is `(Aᵗ)⁻¹ mod pᵐ`, so `A ≡ 1` forces `D ≡ 1`). Cofinality: reduction modulo `pᵐ` gives a neighbourhood basis of 1 in the matrix topology on `GSp_2g(ℤ_p)`. For every open subgroup `U`, choose `m` such that `Γ(pᵐ) ⊆ U`. Since `GSp_2g(ℤ_p)` is compact open in `GSp_2g(ℚ_p)`, intersect any compact open subgroup of `GSp_2g(ℚ_p)` with it and use the same witness. This supplies PerfectoidSpaces §P7.9, rather than just the equality of the intersection with {1}. Non-cofinality: `Γ₁(pᵐ) ⊇ {(1 B; 0 1) : B symmetric with entries in ℤ_p}` for all `m`, so `⋂_m Γ₁(pᵐ) ≠ {1}` and no `Γ₁(pᵐ)` lies in `Γ(p)`; the same holds for `Γ₀`.

([Scholze], §3.1, Definition 3.1.1 and the sentences after it, p. 971.) The three level groups and the nonstandard similitude condition, corrected to `c(γ) ≡ 1`.

Define `GSp.reduce g p m` by applying `PadicInt.toZModPow m` entrywise to the underlying matrix; its intended codomain is `Matrix (g ⊕ g) (g ⊕ g)` (ZMod `(p^m)`). Prove preservation of identity and products and compatibility as `m` decreases. Define `GSp.unitReductionKernel p m` as the subgroup of units with reduction 1. The multiplier API includes `GSp.similitude_spec` (the defining form identity), identity and multiplication laws, and the identity multiplier in residue characteristic two.

The subgroup API is `GSp.levelGamma`, `GSp.levelGamma1`, `GSp.levelGamma0`; `GSp.levelGamma_le_levelGamma1` gives their inclusions and depth monotonicity, `GSp.levelGamma_normal` their stated normalities, `GSp.levelGamma0QuotGamma1` the upper-left-block quotient, `GSp.levelGamma_cofinal` the open-subgroup containment witnesses, `GSp.similitude_levelGamma0` the two multiplier images `U_m`, and `GSp.levelGamma_genusOne` the `GL₂/SL₂` congruence comparison.

**Checks.**

- `levelGamma_index_g1`: For `g = 1, m = 1: [GL_2(ℤ_p) : Γ(p)] = (p² − 1)(p² − p), [Γ₀(p) : Γ₁(p)] = p − 1, [Γ₁(p) : Γ(p)] =` p.
- `levelGamma0_similitude_not_det`: For `g = 2, p` odd and `m = 1`, the element `γ = diag(1, 1, −1, −1)` of `GSp_4(ℤ_p)` has `c(γ) = −1` and `det γ = 1`: it satisfies the printed condition `det γ ≡ 1 mod p` but not `c(γ) ≡ 1 mod p`, so it lies in the printed `Γ₀(p)` and not in `Γ₀(p)`.
- `levelGamma_inter_SL2Z`: For `g = 1`, inside `GL_2(ℤ_p) ⊇ SL_2(ℤ): Γ(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma (pᵐ), Γ₁(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma1 (pᵐ)` and `Γ₀(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma0 (pᵐ)` (Mathlib; Gamma1 is the condition `a ≡ d ≡ 1, c ≡ 0` modulo `pᵐ`).
- `levelGamma1_not_cofinal`: The matrix `(1 B; 0 1)` with `B = 1_g` lies in `Γ₁(pᵐ)` for every `m` but not in `Γ(p)`: the `Γ₁`-family is not cofinal.
- `levelGamma_m_zero`: For `m = 0` all three groups are `GSp_2g(ℤ_p)`, reduction lands in the zero matrix ring, and the unit reduction kernel is all of `ℤ_p^×`. At `m=1` the identity reduces to the identity; a principal-level element reduces to it while the upper unipotent with a unit off-diagonal entry does not.

`c(Γ(pᵐ)) = c(Γ₀(pᵐ)) = U_m`, where `U_0 = ℤ_p^×` and `U_m = 1 + pᵐℤ_p` for `m ≥ 1`.

*Needs:* `mathlib:Matrix.J`; `mathlib:Matrix.symplecticGroup`; `mathlib:Matrix.GeneralLinearGroup`; `mathlib:PadicInt`; `mathlib:CongruenceSubgroup.Gamma`; `mathlib:CongruenceSubgroup.Gamma1`; `mathlib:CongruenceSubgroup.Gamma0`; PerfectoidSpaces §P7.9.

### 0.2 Perfectoid representatives of a tower

Let `(Y_i)_{i∈I}` be a cofiltered system of analytic adic spaces over `Spa(C, O_C)` with qcqs transition maps (for instance a p-level tower `S_{K^pK_p}` or `S*_{K^pK_p}`, or a subsystem of opens). A perfectoid representative of `(Y_i)` is a perfectoid space `Y` over `Spa(C, O_C)` with a compatible family of maps `φ_i: Y → Y_i` such that `Y ~ lim_i Y_i` in the sense of PerfectoidSpaces §P7.2 (Scholze–Weinstein Definition 2.4.1). The tilde-limit induces an isomorphism `Y^◇ → lim_i Y_i^◇` of v-sheaves. Conversely, for finite transition maps, a perfectoid space representing the diamond limit gives a tilde-limit only if the completed finite-level affinoid uniformizations are perfectoid, as in PerfectoidSpaces §P7.11’s `represented_uniformization_density_iff`. A finite-level affinoid basis alone supplies no density assertion. A perfectoid representative is unique up to unique isomorphism compatible with the `φ_i`, represents `lim_i Hom(−, Y_i)` on perfectoid spaces, and is functorial in morphisms of systems (PerfectoidSpaces §P7.10). The tower has a perfectoid representative when this cone satisfies both the underlying-space limit and affinoid density conditions. Bare perfectoid representability of the diamond limit is a separate assertion, used in §2.5.

The density condition is part of the definition. Under the additional perfectoid-uniformization hypothesis, PerfectoidSpaces §P7.11 identifies the completed affinoid uniformization with the given perfectoid chart and proves density; its part (iii) supplies only the finite-level affinoid basis and underlying-space comparison.

Over a non-perfectoid base (for instance `ℚ_p` or `E_v`) one first base changes to `C`; descent is a separate statement.

Definition; uniqueness, representability and functoriality are PerfectoidSpaces §P7.10. The diamond comparison and the converse with perfectoid completed uniformizations are PerfectoidSpaces §P7.11, with the finite-level affinoid basis of PerfectoidTowers §P8.19.

([SW], §2.4, Definition 2.4.1 and Proposition 2.4.5, pp. 19–21.)

The API is `ShimuraTower.PerfectoidRepresentative` for the specified cone/tilde-limit; .diamondIso, .unique and .lift for its diamond comparison, unique cone isomorphism and universal factorization; .map for functoriality with identity/composition laws; .ofDiamondIso for the converse under finite transition maps and perfectoid completed finite-level affinoid uniformizations; and `ShimuraTower.IsPerfectoidTower` for existence, invariant under cofinal reindexing.

**Checks.**

- `representative_frobenius_P1`: The tower `ℙ¹_C ← ℙ¹_C ← ⋯` with `T ↦ T^p` has the perfectoid projective line as representative.
- `representative_constant_tower`: The constant tower `Y_i = ℙ¹_C` (identity maps) has no perfectoid representative, although its diamond limit `(ℙ¹_C)^◇` is a spatial diamond: being a diamond is not perfectoidness.
- `representative_compatible_tilde`: If `Y` is a representative, then `Y^◇ → lim Y_i^◇` is an isomorphism (PerfectoidSpaces §P7.11 (i)).
- A constant `ℙ¹_K` tower over a perfectoid field of characteristic `p` has its completed perfection as represented diamond limit, but its ordinary finite-level functions miss `T^(1/p)` on a perfected disc. The density condition fails (PerfectoidTowers §P8.19).
- `representative_perfectoid_constant`: A constant tower with a perfectoid space `Y_0` (identity transition maps) has `Y_0` as its representative.

`𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C`, Scholze's perfectoid space over `ℚ_p^cycl` base changed along `ℚ_p → C` (a profinite family indexed by `ℤ_p^×` of `𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C` after fixing `ℚ_p^cycl → C`), is a perfectoid representative of the Siegel tower `(S*_{K^pΓ(pᵐ)})_m` (Layer 1); `𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C` alone represents the limit of the finite-level clopen parts with similitude root `ζ_{pᵐ}`; this infinite fixed-pairing fibre is closed and generally not open (§1.2).

*Needs:* HodgeTateAndCanonicalSubgroups §2.3; PerfectoidSpaces §§P7.2, P7.10, P7.11, P7.4; PerfectoidTowers §P8.19.

### 0.3 Effective deck groups: the kernel of the action on the tower

In the situation of HodgeTateAndCanonicalSubgroups §2.1 and HodgeTateAndCanonicalSubgroups §2.2, let `Z` be the centre of `G` and put `Z(ℚ)_{K^p} := {z ∈ Z(ℚ) : z^p ∈ K^p}`, where `z^p ∈ Z(𝔸_f^p)` is the prime-to-p component, and `Z_{K^p} :=` the closure in `G(ℚ_p)` of the image of `Z(ℚ)_{K^p}` under `z ↦ z_p`. Then: (i) the kernel of the right action of `G(ℚ_p)` on `lim_{K_p} S_{K^pK_p}(C)`, equivalently on `|S^◇_{K^p,∞}|` and on `S^◇_{K^p,∞}`, is `Z_{K^p} = G(ℚ_p) ∩ cl(Z(ℚ)K^p)`, the closure taken in `G(𝔸_f)`; (ii) for `K'_p ⊆ K_p` normal, the kernel of the action of `K_p/K'_p` on `S_{K^pK'_p}` is the image of `(Z(ℚ) ∩ K^pK_p)_p` in `K_p/K'_p`, and `S_{K^pK_p} = S_{K^pK'_p}/(K_p/K'_p)`; if `K^pK_p` is neat, `S_{K^pK'_p} → S_{K^pK_p}` is a finite étale Galois cover with group `K_p/(K'_p · (Z(ℚ) ∩ K^pK_p)_p)`; (iii) for `K^pK_p` neat, `S^◇_{K^p,∞} → S^◇_{K^pK_p}` is a pro-étale torsor under the profinite group `K_p/Z_{K^pK_p}`, where `Z_{K^pK_p} = Z_{K^p} ∩ K_p` is the closure of `(Z(ℚ) ∩ K^pK_p)_p`. In particular the tower is a `K_p`-torsor exactly when `Z(ℚ) ∩ K^pK_p = {1}`, which holds for `GL_2` and `GSp_2g` at level `K^p ⊆ K(N)^p` with `N ≥ 3`, and fails for Hilbert data, where `Z(ℚ) ∩ K^pK_p` contains a finite-index subgroup of the units `≡ 1 mod N` of a totally real field `F ≠ ℚ` and `Z_{K^pK_p}` is a nontrivial closed subgroup of `𝒪_{F,p}^×`.

`D` pure Shimura datum with the tower of HodgeTateAndCanonicalSubgroups §2.1; `G(ℚ_p)` embedded in `G(𝔸_f)` with trivial prime-to-p component.

Neatness of `K^pK_p` is used only for freeness (finite étaleness and torsor statements), not for the kernel computation.

Equality with the kernel on C-points is justified at each finite level: the translations are analytifications of algebraic maps over the canonical-model field, and equality of those maps can be checked after faithful base change to `ℂ` and on its closed points. Passing through the reduced finite levels gives equality on the tower. No assertion that arbitrary qcqs diamond maps are determined by one fixed field of points is used.

A rational central `z` with `z^p∈K^p` fixes `[x,a]`, and continuity makes its p-adic closure act trivially. Conversely, Baire category applied to the countably many `q∈G(ℚ)` identifying a translation with the identity gives one `q` fixing an open subset of `X`, hence all `X`. Its adjoint image centralizes all `h(𝕊)`. On every noncompact real simple factor, the conjugates of `h(𝕊)` generate a Zariski-dense normal subgroup by SV1–SV2, so that projection of `q̄` is trivial. SV3 gives a noncompact real place in each rational simple factor `Res_{F/ℚ}H″`; injectivity `H″(F)→H″(F_v)` then gives `q̄=1` even when compact real factors occur. Thus the kernel is `G(ℚ_p)∩cl(Z(ℚ)K^p)`. Since `K^p` is open, a sequence `z_nk_n` tending to a p-component eventually has `z_n^p∈K^p`; this identifies that intersection with `Z_{K^p}`. The finite-level calculation gives (ii), with freeness at neat level from ShimuraVarieties §§0.4, 8.3; passing to the limit gives (iii).

([Milne], §5, 'Passage to the limit', the paragraph before Theorem 5.28 and Theorem 5.28, p. 65.) The closure of the rational centre is what the limit of the tower sees; the p-level kernel is computed from it.

([Milne], §5, 'Passage to the limit', Theorem 5.28 and Remark 5.29, pp. 64–65.) Remark 5.29: the inverse system, the right action `T(gh) = T(h) ∘ T(g)`, and `S_K = S_{K'}/(K/K')` for `K'` normal in `K`.

`GSp_2g` with `K^p = K(N)^p, N ≥ 3` (equality is needed: for `p = 7` and `K^p = K(9)^p ⊆ K(3)^p, 7 ≡ 1 mod 3` but `7 ∉ Z(ℚ)_{K^p}`): `Z(ℚ)_{K^p} = {±pᵏ : ±pᵏ ≡ 1 mod N}`, so `Z_{K^p}` is the infinite cyclic group generated by `εp^f`, where `f` is the order of `p` in `(ℤ/N)^×/{±1}` and `ε = ±1` with `εp^f ≡ 1 mod N`; it is discrete and meets `GSp_2g(ℤ_p)` trivially, so the Siegel tower over `GSp_2g(ℤ_p)`-level is a `GSp_2g(ℤ_p)`-torsor while the central element `εp^f` acts trivially on the whole tower.

Hilbert modular datum `G = Res_{F/ℚ} GL_2` with `K = K(N): Z(ℚ) ∩ K = 𝒪_F^× ∩ (1 + N𝒪_F)`, an infinite group when `[F : ℚ] > 1`; its closure in `𝒪_{F,p}^×` is the nontrivial kernel, the source of the separate polarization statements in Layer 5.

The effective deck groups of Layer 0 require the central-kernel calculation before a torsor statement can be made. In [BHW] §§2–5, the Hilbert towers are torsors only after quotienting by the closure of units. In Layer 5, the full-tower profinite polarization torsor and the different finite torsor on connected components. A central element may act nontrivially on coefficients although it acts trivially on the tower.

*Needs:* `mathlib:Subgroup.topologicalClosure`; `mathlib:MonoidHom.ker`; `mathlib:IsDedekindDomain.FiniteAdeleRing`; HodgeTateAndCanonicalSubgroups §§2.2, 2.3; ShimuraVarieties §§8.3, 0.4; DiamondsAndVStacks §D4.9.

### 0.4 Connected components of the infinite-level tower

In the situation of HodgeTateAndCanonicalSubgroups §2.3, assume `G^der` simply connected and put `T = G/G^der, ν: G → T, T(ℚ)^† = ν(G(ℚ)_+)`. Then `π₀(S^{*◇}_{K^p,∞}) = π₀(S^◇_{K^p,∞}) = lim_{K_p} π₀(S_{K^pK_p}) = lim_{K_p} T(ℚ)^†\T(𝔸_f)/ν(K^pK_p)`, a profinite set (finite at each level). The right action of `G(ℚ_p)` on `π₀` is through `ν: G(ℚ_p) → T(ℚ_p)` acting by translation; every compact open `K_p` acts with finitely many orbits, and the stabiliser of the neutral component (the image of `X⁺ × {1}`) is `K_p ∩ ν⁻¹(cl(T(ℚ)^† ν(K^p)) ∩ T(ℚ_p))`. The minimal compactification does not change components: `π₀ S_{K^pK_p} → π₀ S*_{K^pK_p}` is a bijection because `S*_{K^pK_p}` is normal and `S_{K^pK_p}` is dense in it.

`G^der` simply connected is needed for the abelianised formula (ShimuraVarieties §0.6). Without it the formula fails in both directions: for `G = PGL_2 (T = 1)` the formula's set is a point, while `π₀` at level `K(5)` is `ℚ_{>0}\𝔸_f^×/((𝔸_f^×)² det K(5)) = (ℤ/5)^×/((ℤ/5)^×)²`, of order 2. In general `π₀(S_{K^pK_p}) = G(ℚ)_+\G(𝔸_f)/K^pK_p`, a finite set (ShimuraVarieties §0.5), so `π₀` of the infinite-level tower is `lim_{K_p} G(ℚ)_+\G(𝔸_f)/K^pK_p` and the finiteness of `K_p`-orbits still holds.

`π₀` of a spatial diamond is the profinite set of connected components of its spectral space (ECD §11).

Finite level: `π₀(S_{K^pK_p}(ℂ)) ≅ T(ℚ)^†\T(𝔸_f)/ν(K^pK_p)` by ShimuraVarieties §0.6, and analytification does not change `π₀` (connected components of a normal variety and of its analytification agree). Normality of `S*_{K^pK_p}` and density of the open part give the bijection on `π₀` (Hansen–Johansson §5.3 conventions). Limits: `|S^{*◇}_{K^p,∞}| = lim |S*_{K^pK_p}|` is a cofiltered limit of spectral spaces along spectral maps, so `π₀` commutes with the limit (a cofiltered limit of nonempty compact Hausdorff spaces is nonempty, applied to fibres). The action on `π₀` at finite level is translation by `ν(g)` (ShimuraVarieties §8.7); finiteness of each level gives finitely many `K_p`-orbits.

([Milne], §5, Theorem 5.17, p. 59.)

([HJ], §5.3, conventions, p. 35.)

`GL_2, K^p = K(N)^p` with `N ≥ 3` prime to `p: π₀` at level `K^pK(pᵐ)` is `ℚ_{>0}\𝔸_f^×/det(K^pK(pᵐ)) = (ℤ/Npᵐ)^×`, so `π₀` of the infinite-level tower is `lim_m (ℤ/Npᵐ)^× = ℤ_p^× × (ℤ/N)^×`, with `K_p = GL_2(ℤ_p)` acting through `det` by multiplication on the first factor: one orbit per class in `(ℤ/N)^×`.

Siegel: the same with `ν` the similitude factor; the Weil pairing identifies `π₀` at level `Γ(pᵐ)K^p` with primitive `Npᵐ-th` roots of unity.

*Needs:* HodgeTateAndCanonicalSubgroups §§2.3, 2.2; ShimuraVarieties §§0.6, 0.5, 8.7; DiamondsAndVStacks §D5.3.

### 0.5 The neutral-component tower and its symmetry group

In the situation of HodgeTateAndCanonicalSubgroups §2.1, fix a connected component `X⁺` of `X` and for `K_p ∈ CO_p` let `Γ(K^pK_p) := G(ℚ)_+ ∩ K^pK_p` (`G(ℚ)_+` the stabiliser of `X⁺`). The neutral-component tower is `K_p ↦ S⁰_{K^pK_p} := (Γ(K^pK_p)\X⁺)^{an}` over `C`, the connected component of `S_{K^pK_p}` containing the image of `X⁺ × {1}` (ShimuraVarieties §0.5), with `S*⁰_{K^pK_p}` its Zariski closure in `S*_{K^pK_p}` (normal, connected), and `S^{0◇}_{K^p,∞} := lim_{K_p} S⁰^◇_{K^pK_p}, S^{*0◇}_{K^p,∞}` likewise. Its symmetry group is the closure `Γ̄_{K^p}` of `Γ_{K^p} := G(ℚ)_+ ∩ K^pG(ℚ_p)` in `G(ℚ_p)`, acting through `T_g` on the tower; for `K'_p ⊆ K_p` normal, the deck group of `S⁰_{K^pK'_p} → S⁰_{K^pK_p}` is the image of `Γ(K^pK_p)` in `K_p/K'_p`, i.e. `(Γ̄_{K^p} ∩ K_p)/(Γ̄_{K^p} ∩ K'_p)` modulo the kernel of §0.3, a subgroup of `K_p/K'_p` that is in general proper. The full tower is recovered from neutral towers at conjugate tame levels: for each of the finitely many `K_p`-orbits `O` on `π₀(S^◇_{K^p,∞})` choose `a_O = (a_O^p, a_{O,p}) ∈ G(𝔸_f)` such that the component `C_O` through the image of `X⁺ × {a_O}` lies in `O`, and let `Stab_O ⊆ K_p` be its stabiliser. Then `T_{a_{O,p}} ∘ T_{a_O^p}` (a prime-to-p Hecke translation followed by a p-adic translation) is an isomorphism `S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ≅ C_O`, transporting the `Stab_O`-action to the action of `a_{O,p}Stab_Oa_{O,p}⁻¹` on the neutral tower at tame level `a_O^pK^p(a_O^p)⁻¹`, and `S^◇_{K^p,∞} ≅ ∐_O (S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ×^{Stab_O} K_p)`, compatibly with the `K_p`-action ([HJ] proof of Proposition 5.16: each component is isomorphic to a neutral component at a conjugate tame level, not in general to the one at `K^p`). When `G^der` is simply connected and `K^pK_p` is small, the neutral component at each level is the fibre over the class of 1 of the component map of ShimuraVarieties §8.7 (Milne, Theorem 5.17); for `GL_2` it is the fixed-Weil-pairing curve of ShimuraVarieties §8.12, and a compatible system `ζ` of primitive `Npᵐ-th` roots of unity singles out a connected component of the infinite-level tower. For a connected Shimura datum `(G, X⁺)`, an arithmetic subgroup `Γ ⊆ G(ℚ)_+` and `K_p ⊆ G(ℚ_p)` compact open, put `Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p) = {γ ∈ Γ : γ ∈ K_p in G(ℚ_p)}`, an arithmetic subgroup of finite index in `Γ`; the connected tower is `K_p ↦ X*_{Γ∩K_p}(G, X⁺)`, the analytified minimal compactification over `C` of `(Γ ∩ K_p)\X⁺`, and `X*_{Γ,∞}(G, X⁺) := lim_{K_p} X*_{Γ∩K_p}(G, X⁺)^◇`. This is the reading of §4.1: Hansen–Johansson's Definition 5.17 takes `Γ ⊆ G^ad(ℚ)^+` but intersects with `K_p ⊆ G(ℚ_p)`, which is consistent only for `G = G^ad`, where the two readings coincide; the proof of their Proposition 5.18 uses `Γ ⊆ G(ℚ)_+`.

`Γ(K^pK_p)` arithmetic; neatness for freeness of finite levels.

The symmetry group of the neutral tower is `Γ̄_{K^p}`, not `G(ℚ_p)`: elements of `G(ℚ_p)` outside the stabiliser of the neutral component move it to another component.

Finite level: ShimuraVarieties §0.5 identifies the component over `[1]` with `Γ(K^pK_p)\X⁺`; its algebraic structure and closure in `S*` come from the canonical model and its minimal compactification (normal, so the closure of a component is a component). The level maps restrict to the neutral components because they fix the class of 1; the deck group computation is that of §0.3 restricted to `γ ∈ Γ(K^pK_p)` (`γ` acts on `Γ(K^pK'_p)\X⁺` by `x ↦ γ⁻¹x`, matching `T_γ` under `[x, 1] ↦ [x, γ]`). Induction: §0.4 (and ShimuraVarieties §0.5 when `G^der` is not simply connected) gives finitely many `K_p`-orbits on `π₀`, each open and closed. For `a = (a^p, a_p)`, the prime-to-p translation `T_{a^p}` (HodgeTateAndCanonicalSubgroups §2.2) maps the neutral component `[x, 1]` of the tower at tame level `a^pK^p(a^p)⁻¹` to the component `[x, a^p]` of the tower at tame level `K^p`, and `T_{a_p}` then moves it to `[x, a]`; since `T_k ∘ T_{a_p} = T_{a_pk} = T_{a_p} ∘ T_{a_pka_p⁻¹}` by the right-action law `T_{gh} = T_h ∘ T_g`, and prime-to-p translations commute with the `T_g`, the stabiliser transports as stated. The part of `S^◇_{K^p,∞}` over an orbit `O` is then `C_O ×^{Stab_O} K_p`.

([Milne], §5, Lemma 5.13, p. 57.)

([HJ], §5.3, Proposition 5.16 and the sentence after it, p. 36.)

([HJ], §5.3, proof of Proposition 5.16, (2) implies (1), p. 36.) Finitely many `K_p`-orbits on `π₀`; the same paragraph identifies each component with a neutral component tower at a conjugate tame level `gK^pg⁻¹, g ∈ G(𝔸_f^p)`.

([HJ], §5.3, the sentence after Definition 5.17, p. 36.)

The API is `ShimuraTower.neutralComponent`, `ShimuraTower.neutralComponent.toFull`, `ShimuraTower.neutralSymmetry`, `ShimuraTower.neutralDeckGroup`, `ShimuraTower.fullOfNeutral`, `ShimuraTower.connectedDatumTower` and `ShimuraTower.neutralComponent_isConnected`: respectively the tower of finite-level clopen neutral components (its infinite component is closed), its inclusion, completed symmetry, effective finite deck groups, reconstruction over finitely many component orbits at conjugate tame levels, the arithmetic connected-datum tower, and normal connected closures with dense interior.

**Checks.**

- `neutral_deck_gl2`: For `GL_2, K^p = K(N)^p, N ≥ 3, m ≥ 1`: the deck group of `S⁰_{K^pK(pᵐ⁺¹)} → S⁰_{K^pK(pᵐ)}` is the kernel of `SL_2(ℤ/pᵐ⁺¹) → SL_2(ℤ/pᵐ)`, of order `p³`, while that of the full tower is of order `p⁴`.
- `neutral_full_comparison_count`: `π₀(S_{K^pK_p}) = π₀(S^◇_{K^p,∞})/K_p`, so fullOfNeutral has exactly one induced piece per connected component of `S_{K^pK_p}`. For `GL_2, K^p = K(N)^p (N ≥ 3)` and `K_p = K(pᵐ), m ≥ 1`: the `K(pᵐ)`-orbits on `π₀(S^◇_{K^p,∞}) = (ℤ/N)^× × ℤ_p^×` are the cosets of `det K(pᵐ) = 1 + pᵐℤ_p` in the second factor; there are `φ(Npᵐ)` of them, matching the `φ(Npᵐ)` components of `S_{K^pK(pᵐ)}`, and each stabiliser is `K(pᵐ) ∩ SL_2(ℤ_p)`.
- `neutral_tower_torus`: For a torus datum `(T, {h}): X⁺ = X` is a point and `G(ℚ)_+ = T(ℚ)`, so every `S⁰_{K^pK_p}` is one point and `S^{0◇}_{K^p,∞} = Spd C`. The group `Γ(K^pK_p) = T(ℚ) ∩ K^pK_p` need not be finite (for `T = Res_{F/ℚ}G_m` with `F` real quadratic it contains a finite-index subgroup of `𝒪_F^×`), and its image in `K_p/K'_p` can be nontrivial; but it lies in the kernel of §0.3 `(Z = T)`, so neutralDeckGroup is trivial.
- `neutral_symmetry_not_Gp`: For `GL_2`, the element `diag(1, u)` with `u ∈ ℤ_p^×` not in the closure of `ℚ_{>0} p^ℤ`-type determinants does not preserve the neutral component of the infinite-level tower: the neutral tower is not stable under all of `K_p`.

`GL_2, K^p = K(N)^p` with `N ≥ 3` prime to `p: Γ_{K^p} = {γ ∈ GL_2(ℤ[1/p]) : det γ ∈ p^ℤ, γ ≡ 1 mod N}, Γ(K^pK(pᵐ)) = Γ(Npᵐ)`, so the neutral tower at levels `K(pᵐ)` is the tower of curves `Γ(Npᵐ)\ℍ`, and the deck group of `Γ(Npᵐ)\ℍ → Γ(N)\ℍ` is the image of `Γ(N)` in `GL_2(ℤ/pᵐ)`, which is `SL_2(ℤ/pᵐ)` by strong approximation for `SL_2` (`−1 ∉ Γ(N)` since `N ≥ 3`), not `GL_2(ℤ/pᵐ)`.

For a Hilbert datum the deck groups on neutral components are the images of the totally positive-determinant subgroups; their quotient by the closure of units is the finite torsor statement of Layer 5.

*Needs:* §0.3; §0.4; `mathlib:MulAction.stabilizer`; `mathlib:Subgroup.topologicalClosure`; HodgeTateAndCanonicalSubgroups §§2.1, 2.2, 2.3; ShimuraVarieties §§0.5, 6.3, 8.7, 8.12.

### 0.6 Towers retaining a moduli rigidification

In the situation of HodgeTateAndCanonicalSubgroups §2.1, a rigidified tower over `(S_{K^pK_p})_{K_p}` (or over an open and closed subtower of it stable under the action below) consists of: a cofiltered system `(M_{K_p})_{K_p}` of separated rigid analytic spaces locally of finite type over `C` with finite transition maps, indexed by `CO_p` or by a cofinal level family with a cofinality witness (PerfectoidSpaces §P7.9); a pro-system of finite groups `(Δ_{K_p})_{K_p}`, with transition homomorphisms `Δ_{K'_p} → Δ_{K_p}` for `K'_p ⊆ K_p, Δ_{K_p}` acting on `M_{K_p}` so that the transition maps `M_{K'_p} → M_{K_p}` are equivariant along `Δ_{K'_p} → Δ_{K_p}`; finite `Δ_{K_p}`-invariant maps `q_{K_p}: M_{K_p} → S_{K^pK_p}` compatible with the transition maps, each inducing an isomorphism `M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p}` (categorical quotient of a finite group action; PerfectoidTowers §P8.16); and a right action of a locally profinite group `H` on the system `(M_{K_p})` normalising the `Δ_{K_p}` and lifting, through a continuous homomorphism `H → G(ℚ_p)`, the action of HodgeTateAndCanonicalSubgroups §2.2. Put `Δ_∞ := lim_{K_p} Δ_{K_p}`, a profinite group acting on `M^◇_∞ := lim_{K_p} M^◇_{K_p}`. The orders of the `Δ_{K_p}` may grow without bound with the level; a single finite group `Δ` is the special case of a constant pro-system. If `Δ_{K_p}` acts freely on `M_{K_p}` for every `K_p`, each `q_{K_p}` is a finite étale `Δ_{K_p}`-torsor and `M^◇_∞ → S^◇_{K^p,∞}` is a pro-étale `Δ_∞`-torsor of diamonds. If the pro-system is constant `(Δ_{K_p} = Δ)` and `(M_{K_p})` is a good tower, `M^◇_∞/Δ ≅ S^◇_{K^p,∞}` without any freeness, by PerfectoidTowers §P8.20. The effective deck groups of `M` and of `S` differ: the kernel of the H-action on `M^◇_∞` is computed separately from §0.3 and need not contain the preimage of `Z_{K^p}`.

Each `Δ_{K_p}` is finite and the quotients are categorical quotients of rigid spaces (P8), not quotients of moduli functors; `Δ_∞` is profinite and in general infinite.

The basic example (Birkbeck–Heuer–Williams §8.2): for the Hilbert datum `G = Res_{F/ℚ}GL_2` with tame level `μ_N (N ≥ 4)` and a polarization module `𝔠`, the hybrid spaces `X_{Γ(pⁿ)}` (`G*`-polarization `λ` fixed, G-level structure `α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ]`) over the arithmetic spaces `X_{G,Γ(pⁿ)}`, with `Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)²` acting through the polarization action (BHW Lemma 8.16(1)); the order of `Δ(pⁿN)` is unbounded in `n` when `[F : ℚ] > 1` (for `F = ℚ` it is 1), and `Δ_∞ = Δ(p^∞N)` (Layer 5). These are finite coarse quotients at every level; their stack atlases are torsors, and their coarse maps are torsors only where the polarization action is free (H3.6, H4.6, H4.12). The whole-space infinite-level torsor uses the cofinal projectively neat levels of §5.7. The `G*`-tower `X_{Γ*(pⁿ)}` is not an example at full level: its map to `X_{G,Γ(pⁿ)}` is not surjective, and `𝒪_F^{×,+}` no longer acts on it by changing the polarization (BHW p. 33).

Apply the separated qcqs finite-quotient results of PerfectoidTowers P8 locally on `Δ`-stable qcqs opens: for an affinoid open of `S_{K^pK_p}`, its preimage under the finite `q_{K_p}` is qcqs and `Δ`-stable. The full nonproper modular or Hilbert analytic variety need not be quasi-compact. Quotients and torsors glue over these opens; inverse-limit surjectivity is checked over the inverse image of a fixed finite-level affinoid.

Work on the inverse image of a fixed finite-level affinoid, where the finite maps give qcqs stable opens. Torsor statement: a free action of a finite group on a separated rigid space has a finite étale quotient map which is a torsor (PerfectoidTowers §P8.12), so `M_{K_p} × Δ_{K_p} ≅ M_{K_p} ×_{S_{K^pK_p}} M_{K_p}` compatibly in `K_p`. Cofiltered limits of v-sheaves commute with fibre products, so `M^◇_∞ × Δ_∞ ≅ M^◇_∞ ×_{S^◇_{K^p,∞}} M^◇_∞`, where `M^◇_∞ × Δ_∞ = lim_{K_p} M^◇_{K_p} × Δ_{K_p}`. The map `M^◇_∞ → S^◇_{K^p,∞}` is pro-étale as a cofiltered limit of finite étale maps. For a compatible target point, the nonempty finite-level fibres over it are compact in the constructible topology and have the finite intersection property, so their inverse limit is nonempty. This proves surjectivity locally on those qcqs opens (DiamondsAndVStacks §D5.3). Constant pro-system without freeness: PerfectoidTowers §P8.20 gives `M^◇_∞/Δ ≅ lim_{K_p} (M_{K_p}/Δ)^◇ = S^◇_{K^p,∞}`.

([BHW], §8, Proposition 8.4, p. 32.)

([BHW], §8.2.4, Lemma 8.16(1), p. 35.)

([BHW], §8.2, p. 33.)

The API is `ShimuraTower.Rigidified` with .quotientIso, .infiniteLevel, .`isTorsor_of_free, .quotient_infiniteLevel` and .trivial. These give, respectively, the compatible finite quotient comparisons, the limit with its `Δ_∞`-action, the free-level pro-étale torsor, the constant-`Δ` good-tower quotient comparison, and the case `Δ_{K_p}=1`. The pro-system may have unbounded orders.

**Checks.**

- `rigidified_trivial_delta`: With `Δ_{K_p} = 1` for every `K_p: M = S, Δ_∞ = 1` and the quotient isomorphisms are identities.
- `rigidified_hilbert_delta_order`: For the Hilbert hybrid tower with `F = ℚ(√5), N = 4` and `p` odd: `𝒪_F^{×,+} = ⟨ε²⟩` with `ε = (1+√5)/2` of norm `−1`, and `−1` is not a power of `ε` modulo 4, so `𝒪_F^× ∩ (1 + 4pⁿ𝒪_F) = ⟨ε^{k_n}⟩` with `k_n` the order of `ε` in `(𝒪_F/4pⁿ)^×`, and `|Δ_{K(pⁿ)}| = |Δ(4pⁿ)| = [⟨ε²⟩ : ⟨ε^{2k_n}⟩] = k_n`. At `n = 0` (the coarse quotient `X → X_G` of BHW Proposition 8.4) `k_0 = 6`, since `ε` has order 6 in `(𝒪_F/4)^×`, so `|Δ(4)| = 6`; and `k_n` is unbounded in `n`, so no single finite group serves at every level.
- `rigidified_not_shimura_kernel`: For the Hilbert hybrid tower with `[F : ℚ] ≥ 2`, take `η ∈ (1 + N𝒪_F)^×` with `η ≠ 1` and `g = diag(η, η) ∈ H = GL_2(𝒪_p)`. Then `g` acts trivially on every `X_{G,Γ(pⁿ)}` (it lies in the central subgroup `Z_n` of BHW Definition 8.17, which acts trivially by Proposition 8.18(3); equivalently in `Z_{K^p}` of §0.3). On the hybrid tower it acts as the polarization action of `η⁻²` (`g^∨ = g` and BHW Lemma 8.12), which is a nontrivial element of `Δ(pⁿN)` for `n` large (`η² ∈ ((1 + pⁿN𝒪_F)^×)²` would force `η ≡ 1 mod pⁿN`, as `N ≥ 3`) and acts freely at the sufficiently deep levels of §5.7. So the kernel of the H-action on `M^◇_∞` does not contain the preimage of `Z_{K^p}`.
- `rigidified_nonproper_locality`: For a rigid tame modular curve, the open analytic curve is not quasi-compact: cusp annuli have arbitrarily small nonzero `q`. Finite quotient and torsor arguments therefore use the inverse images of finite-level affinoids, rather than assuming the whole rigidified space is qcqs.

Hilbert: the hybrid tower `(X_{𝔠,Γ(pⁿ)} ⊗ C)_{n≥0}` over the open and closed subtower `(X_{G,𝔠,Γ(pⁿ)} ⊗ C)_{n≥0}` of the G-Shimura tower lying over `[𝔠] ∈ Cl⁺(F)`, with finite quotient groups `Δ_{K(pⁿ)} = Δ(pⁿN)`, free at sufficiently deep projectively neat p-levels, so that §5.7 gives a whole-space pro-étale `Δ(p^∞N)`-torsor at infinite level (Layer 5 §5.7; BHW Proposition 8.21(3)). The lifted action is that of `H = GL_2(𝒪_p) ⊆ G(ℚ_p)` through `x·g := g^∨·x`, where `g^∨ = det(g)g⁻¹` and `g^∨·x` is BHW's level-structure action.

Layer 0 distinguishes the full tower, a connected-component tower, and a tower retaining a moduli rigidification. In [BHW] §§2, 5, 8, the geometric (fixed polarization), hybrid and arithmetic Hilbert towers related by the unit quotients `Δ(pⁿN)`. In Layer 5, comparison of the geometric, intermediate and arithmetic Hilbert towers and the profinite polarization torsor.

*Needs:* §0.3; HodgeTateAndCanonicalSubgroups §§2.1, 2.3; PerfectoidTowers §§P8.16, P8.12, P8.20, P8.19; PerfectoidSpaces §P7.9; DiamondsAndVStacks §D5.3.

### Examples

For `g=1` and depth one the principal-level index is `|GL₂(𝔽_p)|=(p²−1)(p²−p)`, while the two intervening indices are `p−1` and p. In genus two `diag(1,1,−1,−1)` has determinant 1 and multiplier `−1`. These computations distinguish the three levels and the cyclotomic fibre. A constant tower of finite C-points is perfectoid; a constant positive-dimensional smooth modular curve is not.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 0.general: general-data and toroidal diamonds

### 0.general.1 The toroidal tower diamond with cone-compatible deck actions

Let `D` be a pure Shimura datum, `K^p ⊆ G(𝔸_f^p)` neat, `K_p ∈ CO_p` and `Σ` a `K^pK_p`-admissible projective cone decomposition (ShimuraCompactifications C0–`C3.general`). Smoothness of `Σ` is not assumed: it is relative to the lattices `U(ℚ) ∩ K`, which shrink when `K_p` shrinks, so a `Σ` that is smooth at level `K^pK_p` need not be smooth at level `K^pK'_p`. For `K'_p ⊆ K_p, Σ` is `K^pK'_p`-admissible, and the toroidal compactifications `S^tor_{K^pK'_p,Σ}` over `C` (analytified base changes of the canonical models of ShimuraCompactifications `C2.general`) with the proper transition maps `S^tor_{K^pK''_p,Σ} → S^tor_{K^pK'_p,Σ}` of ShimuraCompactifications `C3.general` form a tower with the same `Σ` at every level. Put `S^{tor◇}_{K^p,Σ,∞} := lim_{K'_p ⊆ K_p} (S^tor_{K^pK'_p,Σ})^◇`, a spatial diamond with `|S^{tor◇}_{K^p,Σ,∞}| ≅ lim |S^tor_{K^pK'_p,Σ}|`, containing `S^◇_{K^p,∞}` as the open complement of the boundary and mapping to `S^{*◇}_{K^p,∞}`. Deck actions: `K_p` acts on the tower (`k ∈ K_p` preserves `Σ` because `Σ` is `K_p`-stable), compatibly with the action on `S^◇_{K^p,∞}`; an element `g ∈ G(ℚ_p)` outside `K_p` maps the tower for `Σ` to the tower for `gΣ`, and two cone decompositions are compared through a common refinement `Σ''` and the proper refinement maps, which are isomorphisms over `S^◇_{K^p,∞}`. Hecke correspondences for `g ∈ G(ℚ_p)` are formed on a common refinement of `Σ` and `gΣ`.

Neat `K^p; Σ` admissible at level `K^pK_p`, so admissible at all smaller levels; no single `Σ` admits every Hecke correspondence (ShimuraCompactifications C3).

The same `Σ` is used at every level of the tower (Boxer–Pilloni 2026, §3.3; Pilloni–Stroh Théorème 0.4 for the Siegel case).

Finite levels and the transition maps for fixed `Σ` are supplied by ShimuraCompactifications `C2.general`/`C3.general` (supplier contract). Spatiality and the topological comparison follow from DiamondsAndVStacks §D5.3 since the `S^tor` are proper, hence qcqs, and the transition maps proper. The open tower is the preimage of the complement of the boundary at each level, so `S^◇_{K^p,∞}` is an open subdiamond; the maps `S^tor → S*` at each level give the map of limits. Deck actions and Hecke correspondences are the limits of the finite-level maps of ShimuraCompactifications C3 with common refinements; refinement maps are isomorphisms over the open part, so the comparison is canonical there.

([BPS], §3.3, p. 34.)

([PS], Appendice A, Remarque A.13, PDF p. 27.) The comparison that Pilloni–Stroh leave open concerns the generic fibre of the limit of formal toroidal models, not the limit of the rigid toroidal compactifications.

The API is `ShimuraTower.toroidal`, `ShimuraTower.toroidalInfiniteLevel`, .isSpatial, .openEmbedding, .toMin, .deck, .refine and .translate: the fixed-cone system and diamond limit, spatiality, the boundary-complement inclusion, the minimal map, the `K_p`-action, refinement maps with identity/composition, and translations to `gΣ` with comparison on common refinements.

**Checks.**

- `toroidal_g1_equals_minimal`: For the modular-curve datum the toroidal tower diamond equals `S^{*◇}_{K^p,∞}`.
- `toroidal_refinement_iso_open`: For a refinement `Σ''` of `Σ` the map of toroidal diamonds is an isomorphism over `S^◇_{K^p,∞}` and, for a genuine star subdivision introducing a new ray in a two-dimensional boundary cone, it is not an isomorphism over the affected boundary stratum (the toric chart map is a blow-up).
- `toroidal_single_level`: Restricted to the one-element family `{K_p}`, the limit is `(S^tor_{K^pK_p,Σ})^◇`.
- `toroidal_hecke_needs_refinement`: Use the genus-two perfect-cone fan at the standard Siegel cusp and `p = 2`. Put `γ = diag(2, 1, 1, 2)`, with multiplier 2 and `A = diag(2,1)`. On the cusp cone `γ` acts by `Q ↦ AQAᵀ/2`. The cone generated by `e₁e₁ᵀ, e₂e₂ᵀ` and `(e₁−e₂)(e₁−e₂)ᵀ` is sent to a cone containing both axis rays and the ray `(2e₁−e₂)(2e₁−e₂)ᵀ`. The only maximal perfect cones containing both axis rays have third ray `(e₁±e₂)(e₁±e₂)ᵀ`; neither contains this image ray (its off-diagonal magnitude is 2 while its second diagonal entry is 1). Thus `γΣ` does not refine `Σ`. A common refinement gives the Hecke span. The scalar cusp dilation `diag(p,p,1,1)` preserves every fan and is not a counterexample.

Siegel datum: by Pilloni–Stroh, Théorème 0.4, there is a perfectoid space `X(p^∞)^{tor−mod} ~ lim X(pⁿ)^tor`, so the toroidal tower diamond with fixed `Σ` has a perfectoid representative (Layer 1). Their Remarque A.13 concerns another object, the generic fibre of the limit of the formal toroidal models, which they do not identify with `X(p^∞)^{tor−mod}`; the diamond limit here is the limit of the rigid toroidal compactifications.

*Needs:* HodgeTateAndCanonicalSubgroups §§2.1–2.3; ShimuraCompactifications §§C2.general.1, C2.8, C3.1, C3.2, C3.3, C3.4, C3.general.1; DiamondsAndVStacks §D5.3.

### Examples

At a genus-two cusp the ray generated by `(e₁+e₂)²` belongs to the usual perfect cone. The Hecke change `diag(p,1)` sends it to `(pe₁+e₂)²`, whose matrix has entries `(p²,p; p,1)`; it violates `c≥|b|` for that cone when `p>1`. The cone must be refined. In genus one the toroidal and minimal compactifications agree.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 1: the Siegel construction

### 1.1 The Siegel spaces of the construction: integral models, Hasse domains and finite-level adic spaces

Fix `g ≥ 1, p` and `K^p` as in the hypotheses. Let `X = X_{g,K^p}` be the moduli scheme over `ℤ_(p)` of principally polarized abelian schemes of dimension `g` with level-`K^p` structure (PELModuli §M5.1–M5.2), `X*` its minimal compactification over `ℤ_(p)` with ample line bundle `ω` (Faltings–Chai; ShimuraCompactifications C5), normal with normal geometric fibres and boundary of codimension `g`, and `X* = Proj ⊕_k H⁰(X, ω^{⊗k})` when `g ≥ 2`. Let `𝔛 ⊆ 𝔛*` be the p-adic completions of `X ⊗ ℤ_p^cycl ⊆ X* ⊗ ℤ_p^cycl, 𝔄 → 𝔛` the universal abelian scheme, and `Ha ∈ H⁰(X*_{𝔽_p}, ω^{⊗(p−1)})` the Hasse invariant (HodgeTateAndCanonicalSubgroups T0). For `0 ≤ ε < 1`, the Hasse domain `𝔛*(ε) → 𝔛*` is the formal model of AdicSpacesPartIII §R2.10 for `(𝔛*, ω, Ha)`: it represents pairs `(f, u)` with `u·Ha(f̄) = p^ε` modulo `u ~ u(1 + p^{1−ε}h)`, locally `Spf((R ⊗̂ ℤ_p^cycl)⟨u⟩/(uH̃a − p^ε))`; it is an open formal subscheme of an admissible blow-up of `𝔛*` (not itself an admissible blow-up), and `𝔛(ε), 𝔄(ε)` are its pullbacks, with generic fibre `𝒳*(ε) = {|Ha| ≥ |p|^ε}`. For `K_p ⊆ GSp_2g(ℤ_p)` compact open with `c(K_p) = U_m` (as for `Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ)`), `X*_{K_pK^p}` (the minimal compactification of the level-`K_pK^p` Siegel variety, the normalisation of `X*` in `X_{K_pK^p}`) lives over `ℚ(ζ_{pᵐ})` through the similitude factor (the Weil pairing), and `𝒳*_{K_p}` is the adic space over `Spa(ℚ_p^cycl, ℤ_p^cycl)` of its base change along `ℚ(ζ_{pᵐ}) → ℚ_p^cycl` for a fixed compatible system `(ζ_{pⁿ})_n` of p-power roots of unity (the tautological `ζ_{pᵐ} ∈ ℚ_p^cycl` matched with the root `ζ_{pᵐ} ∈ 𝒪(X*_{K_pK^p})` given by the similitude factor, i.e. the Weil pairing of the level structure: `𝒳*_{K_p}` is the fixed-similitude part); `𝒳_{K_p} ⊆ 𝒳*_{K_p}` the preimage of `𝒳` (the good-reduction locus, not the open Shimura variety), `𝒵_{K_p}` the boundary, and `𝒳*_{K_p}(ε)` the preimage of `𝒳*(ε)`. Relation with the Layer 0 tower: for a complete algebraically closed `C ⊇ ℚ_p^cycl` and `S*_{K^pK_p} = (X*_{K_pK^p} ⊗_ℚ C)^{ad}` (HodgeTateAndCanonicalSubgroups §2.1 for the Siegel datum), `S*_{K^pK_p} = ⊔_{a ∈ (ℤ/pᵐ)^×} 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C`, where one chooses a lift `ã ∈ ℤ_p^×` of each residue unit a and uses `σ_ã(ζ_{pⁿ}) = ζ_{pⁿ}^ã`; the base change is independent of this lift because the finite-level model descends to `ℚ_p(ζ_{pᵐ})`; so `𝒳*_{K_p} ⊗_{ℚ_p^cycl} C` is the open and closed part of `S*_{K^pK_p}` on which the Weil-pairing root equals the fixed `ζ_{pᵐ}`, and it is all of `S*_{K^pK_p}` exactly when `(ℤ/pᵐ)^×` is trivial, namely `m = 0` or `(p, m) = (2, 1)`. The comparison at all levels `K′_p ⊆ GSp_2g(ℚ_p)`, at infinite level and for the group actions is §1.2.

Siegel setting of Scholze §3: `g ≥ 1, p` prime, `K^p ⊆ GSp_2g(𝔸_f^p)` contained in `{γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N}` for some `N ≥ 3` prime to `p; ℚ_p^cycl` the completion of `ℚ_p(μ_{p^∞})` with ring of integers `ℤ_p^cycl; p^ε ∈ ℤ_p^cycl` a chosen element of valuation `ε`.

`𝒳_{K_p}` is the locus of good reduction (the preimage of `𝒳 = 𝔛_η`), which is strictly smaller than the analytification of the open Shimura variety `X_{K_pK^p}`; the boundary `𝒵_{K_p}` is the preimage of the boundary of `𝒳*`.

Here `U_0 = ℤ_p^×` and `U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p` for `m ≥ 1`. The formula `1 + ℤ_p` is not used as a unit subgroup.

Siegel moduli and the integral minimal compactification are imported (PELModuli §M5.1–M5.2; ShimuraCompactifications §C5.16, ShimuraCompactifications §C5.17, ShimuraCompactifications §C5.3 and ShimuraCompactifications §C5.5), with ampleness of `ω` and normality of geometric fibres. The Hasse invariant on `X_{𝔽_p}` extends to `X*_{𝔽_p}` by Hartogs for `g ≥ 2` (boundary of codimension `g ≥ 2`) and by inspection at the cusps for `g = 1` (supplier contract with HodgeTateAndCanonicalSubgroups T0). Apply AdicSpacesPartIII §R2.10 to `(𝔛*, ω, Ha)` over `ℤ_p^cycl`, which contains `p^ε` for `ε ∈ ℤ[1/p]·(1/(p−1))`; flatness of the local charts uses that the image of `H̃a` in `R/p` is a nonzerodivisor (Lemma 3.2.10). Finite levels: `X*_{K_pK^p}` is the level-`K_pK^p` member of the algebraic Siegel tower of Layer 0; it lives over `ℚ(ζ_{pᵐ})` through the root `ζ_{pᵐ} := e(η(e_1), η(e_{g+1}))^{p^{n−m}}` of a level structure `η: (ℤ/pⁿ)^{2g} ≅ A[pⁿ]` at a level `Γ(pⁿ) ⊆ K_p`, which is `K_p`-invariant because `c(K_p) ⊆ U_m`. Since the cyclotomic polynomial `Φ_{pᵐ}` is irreducible over `ℚ, ℚ(ζ_{pᵐ}) ⊗_ℚ C ≅ ∏_{a ∈ (ℤ/pᵐ)^×} C (ζ_{pᵐ} ⊗ 1 ↦ (ζ_{pᵐ}^a)_a)`, which gives the decomposition of `S*_{K^pK_p}` after analytification.

([Scholze], §3.1, pp. 970–971, and §3.2.2, Definition 3.2.12 and Lemma 3.2.13, pp. 983–984.)

([Scholze], §3.2.2, p. 983.) `𝒳*_{K_p}` is the base change along `ℚ(ζ_{pᵐ}) → ℚ_p^cycl` matching the tautological `ζ_{pᵐ}` with the similitude root.

The API is `SiegelTorsion.integralMin` (with `ω` and `Ha`), `SiegelTorsion.hasseDomain` and .`hasseDomain_generic`, `SiegelTorsion.finiteLevel`, .`finiteLevel_hasse, .finiteLevel_eq_tower` and .`hasseDomain_mono`. They record the specified formal models, Hasse generic fibre, cyclotomic finite levels, their Hasse pullbacks, full-tower decomposition into similitude-root components, and inclusions for `ε′≤ε` with compatible transitions.

**Checks.**

- `hasseDomain_zero_ordinary`: `𝒳*(0) = {|Ha| = 1}` is the tube of the ordinary locus of `X*_{𝔽_p}`; for `g = 1` it contains every cusp.
- `goodReduction_ne_open`: For `g = 1, K_p = Γ(p)` and a supersingular point, its preimage in `𝒳_{Γ(p)}` is nonempty, but a point of the open modular curve with multiplicative reduction lies in the open Shimura variety and not in `𝒳_{Γ(p)}: 𝒳_{K_p}` is the good-reduction locus, not `X_{K_pK^p}^{an}`.
- `hasseDomain_not_blowup`: `𝔛*(ε) → 𝔛*` is not proper for `ε > 0` (its generic fibre is the proper open subset `{|Ha| ≥ |p|^ε}`), so it is not an admissible blow-up, only an open subscheme of one.
- `finiteLevel_trivial_level`: For `K_p = GSp_2g(ℤ_p), 𝒳*_{K_p}` is the generic fibre of `𝔛*` and `𝒳_{K_p} = 𝒳`.
- `finiteLevel_fixed_similitude_g1`: For `g = 1, K^p = K(N)^p (N ≥ 3)` and `K_p = Γ(pᵐ)` with `m ≥ 1, S*_{K^pK_p}` has `φ(N)φ(pᵐ)` connected components, while `𝒳*_{Γ(pᵐ)} ⊗_{ℚ_p^cycl} C` has `φ(N)`: those on which the Weil pairing at `p` is `ζ_{pᵐ}`. For `p = 3, m = 1` this is a proper clopen part, whereas for `p = 2, m = 1` the residue-unit group is trivial and it is the whole space. These two cases distinguish the definitions.

`𝒳*(ε') ⊆ 𝒳*(ε)` for `ε' ≤ ε`, by AdicSpacesPartIII §R2.10.

*Needs:* §0.1; PELModuli §M5.1–M5.2; ShimuraCompactifications §§C5.16, C5.17, C5.3, C5.5; AdicSpacesPartIII §R2.10; HodgeTateAndCanonicalSubgroups §§2.1, 0.14, 0.15, 0.16.

### 1.2 Scholze's fixed-similitude Siegel spaces over `ℚ_p^cycl` and the Layer 0 Siegel tower over `C`

Let `K^p` be as in §1.1 and let `S_{K^pK′_p} ⊆ S*_{K^pK′_p}` (`K′_p ⊆ GSp_2g(ℚ_p)` compact open) be the open and minimally compactified p-level towers of HodgeTateAndCanonicalSubgroups §2.1 for the Siegel datum (reflex field `ℚ`) over a complete algebraically closed `C`, with the C-linear right action `T_γ` of HodgeTateAndCanonicalSubgroups §2.2 and HodgeTateAndCanonicalSubgroups §2.3 (iv); fix an embedding `ℚ_p^cycl ⊆ C`, so that the compatible system `ζ = (ζ_{pⁿ})_n` of §1.1 lies in `C`. For a point with level structure `α: T_pA ≅ ℤ_p^{2g}` (a symplectic similitude), its Weil-pairing root `w ∈ ℤ_p^×` is defined by `e(α⁻¹x, α⁻¹y) = ζ^{w·⟨x, y⟩}` (⟨ , ⟩ the standard symplectic form, `⟨e_i, e_{g+i}⟩ = 1`); at a level `K′_p` with `c(K′_p) ⊆ U_m, w mod pᵐ` is locally constant, and `w: |S^{*◇}_{K^p,∞}| → ℤ_p^×` is continuous and factors through `π₀` (§0.4). For `a ∈ ℤ_p^×` let `σ_a ∈ Gal(ℚ_p^cycl/ℚ_p)` be the automorphism with `σ_a(ζ_{pⁿ}) = ζ_{pⁿ}^a`, and for `γ ∈ GSp_2g(ℚ_p)` put `u(γ) := c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^×`. Then: (i) (finite level) for `K_p ⊆ GSp_2g(ℤ_p)` compact open with `c(K_p) = U_m (m ≥ 0), S*_{K^pK_p} = ⊔_{a ∈ (ℤ/pᵐ)^×} {w ≡ a mod pᵐ}` with `{w ≡ a} ≅ 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_ã} C` for any lift `ã ∈ ℤ_p^×` of a (the finite-level model descends to `ℚ_p(ζ_{pᵐ})`, so the result does not depend on the lift); in particular `𝒳*_{K_p} ⊗_{ℚ_p^cycl} C` is the open and closed part `{w ≡ 1 mod pᵐ}` of `S*_{K^pK_p}`, equal to `S*_{K^pK_p}` exactly when `m = 0` or `(p, m) = (2, 1)`; likewise for the open parts `𝒳*_{K_p} ∖ 𝒵_{K_p}` and `S_{K^pK_p}` and for the boundaries. (ii) (infinite level) For every perfectoid field `L ⊇ ℚ_p^cycl, Spa(ℚ_p^cycl) ×_{Spa ℚ_p} Spa(L) ≅ ℤ_p^× × Spa(L) = Spa(C⁰(ℤ_p^×, L), C⁰(ℤ_p^×, 𝒪_L))`, the point `a ∈ ℤ_p^×` corresponding to `ℚ_p^cycl →σ_a ℚ_p^cycl ⊆ L`, and `lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd ℚ_p} Spd L ≅ lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ L)^{ad◇}`; for `L = C` this is `S^{*◇}_{K^p,∞} = lim_{K′_p} S*^◇_{K^pK′_p}` (`Γ(pᵐ)` cofinal), and its part `{w = 1}` is `lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd ℚ_p^cycl} Spd C`. Hence, once `𝒳*_{Γ(p^∞)} ~ lim_m 𝒳*_{Γ(pᵐ)}` exists as a perfectoid space over `ℚ_p^cycl` (§1.26): `S^{*◇}_{K^p,∞} ≅ (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C)^◇ = (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C))^◇`; the perfectoid space `𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C` is a perfectoid representative (§0.2) of the Siegel tower `(S*_{K^pK′_p})_{K′_p ⊆ GSp_2g(ℚ_p)}`; and `𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C` is its closed fixed-pairing fibre `{w = 1}`, generally not open, not the whole tower (`π₀` differs by the factor `ℤ_p^×`); likewise for the complements of the boundaries. (iii) (actions, all levels) Under (ii) the C-linear right action of `GSp_2g(ℚ_p)` on `S^{*◇}_{K^p,∞}` is the base change of the `ℚ_p`-linear right action on `lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad◇} ≅ lim_m 𝒳*^◇_{Γ(pᵐ)}` by the translations of ShimuraVarieties §8.2 (Scholze's `GSp_2g(ℚ_p)`-action), and `w(x·γ) = u(γ)·w(x)`; equivalently, for the structure map `s` to `Spd ℚ_p^cycl, T_γ^* ∘ s^* = s^* ∘ σ_{u(γ)}`, so `γ` acts `ℚ_p^cycl`-linearly iff `c(γ) ∈ p^ℤ`. For every compact open `K′_p ⊆ GSp_2g(ℚ_p), ((𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)}) ×_{Spa ℚ_p} Spa C)^◇ → S^◇_{K^pK′_p}` is a pro-étale `K′_p`-torsor; if `K′_p ⊆ GSp_2g(ℤ_p)` with `c(K′_p) = U_m`, the stabiliser of the part `{w = 1}` in `K′_p` is `K′_p ∩ ker c`, and the restriction of this torsor to `{w = 1}` is a `(K′_p ∩ ker c)`-torsor over `(𝒳*_{K′_p} ∖ 𝒵_{K′_p}) ⊗_{ℚ_p^cycl} C`.

`C` is complete and algebraically closed with a fixed embedding `ℚ_p^cycl ⊆ C` (equivalently a compatible system of p-power roots of unity in `C`); `L` in (ii) is any perfectoid field containing `ℚ_p^cycl`, for instance Heuer's base field `K`.

Conventions: the right action `x·γ` is `α ↦ γ⁻¹ ∘ α` on `α: V_pA ≅ ℚ_p^{2g}`, i.e. `η ↦ η ∘ γ` on `η = α⁻¹`, which is Layer 0's `T_γ ([x, a] ↦ [x, aγ])`; the Weil pairing is normalised by `e(α⁻¹e_i, α⁻¹e_{g+i}) = ζ` on the fixed-similitude part.

The finite-level decomposition follows from `ℚ(ζ_{pᵐ}) ⊗_ℚ C ≅ ∏_{a∈(ℤ/pᵐ)^×} C`; the a-piece is the `σ_ã`-base change of `𝒳*_{K_p}`, for a lift `ã∈ℤ_p^×`. It respects the open part and boundary. Since `Spd ℚ_p^cycl = lim_m Spd ℚ_p(ζ_{pᵐ})` and `ℚ_p(ζ_{pᵐ}) ⊗_{ℚ_p} L ≅ ∏_{(ℤ/pᵐ)^×} L`, the base product is `ℤ_p^× × Spd L`, represented by `Spa(C⁰(ℤ_p^×,L),C⁰(ℤ_p^×,𝒪_L))`. Total ramification at `p` identifies the finite `ℚ_p`-base changes with the cyclotomic finite levels; taking limits and base change gives (ii), using principal-level cofinality (§0.1). The fibre `w=1` is the fixed-pairing part. In the perfectoid case, represented-functor comparison and fibre products give the claimed representative. For (iii), `e(ηγx,ηγy)=ζ^{c(γ)⟨x,y⟩}`; for nonintegral `γ` rescale the polarization on the isogenous lattice by `p^{−v_p(c(γ))}`. Thus `w(x·γ)=u(γ)w(x)`, with `p·1` and `diag(p·1_g,1_g)` preserving `w`. Neat tame level gives `Z(ℚ)∩K^pK′_p={±1}∩(1+Nℤ)={1}`. The stabilizer of `w=1` is `K′_p∩ker c`. These comparisons use PerfectoidSpaces §§P1.31–P1.32, P2.17, P7.9, P7.11; DiamondsAndVStacks §§D4.6, D5.3; and HodgeTateAndCanonicalSubgroups §§2.1–2.3.

([Scholze], §3.2.2, p. 983.) The fixed-similitude spaces over `ℚ_p^cycl` and the spaces over `ℚ_p` have the same inverse limit; (ii) makes this precise.

([Scholze], §3.2.2, footnote 10, p. 983.) The `ℚ_p^cycl`-spaces see only the similitude-1 part; (iii) identifies the `K′_p ∩ ker c` torsor.

([Scholze], §3.1, footnote 7, p. 971.) The `GSp_2g(ℚ_p)`-action is semilinear over `ℚ_p^cycl`, through `u(γ)`.

([Scholze], §4.1, proof of Theorem 4.1.1, p. 1019.)

`g = 1, K^p = K(N)^p (N ≥ 3)` and `K_p = Γ(pᵐ)` with `m ≥ 1: S*_{K^pΓ(pᵐ)}` has `φ(N)φ(pᵐ)` connected components (HodgeTateAndCanonicalSubgroups §2.1, test `pLevel_gl2_full_level`) and `𝒳*_{Γ(pᵐ)} ⊗_{ℚ_p^cycl} C` is the union of the `φ(N)` of them with `w ≡ 1 mod pᵐ`.

`g = 1, K^p = K(N)^p: π₀(S^{*◇}_{K^p,∞}) = ℤ_p^× × (ℤ/N)^×` (Layer 0 §0.4), `w` factors through the projection to `ℤ_p^×` (up to the inversion fixed by the reciprocity convention of ShimuraVarieties §8.7), and `π₀(𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C) ≅ (ℤ/N)^×`.

For `γ = diag(1_g, a·1_g)` with `a ∈ ℤ_p^×, c(γ) = a` and the action of `γ` on Scholze's `𝒳*_{Γ(p^∞)}` covers `σ_a` on `ℚ_p^cycl`; for `γ = p·1_{2g}` or `diag(p·1_g, 1_g), u(γ) = 1` and `γ` acts `ℚ_p^cycl`-linearly.

*Needs:* §1.1; §0.2; §0.3; §0.4; §0.1; HodgeTateAndCanonicalSubgroups §§2.1, 2.2, 2.3; PELModuli §M5.1–M5.2; ShimuraVarieties §§8.2, 8.7; PerfectoidSpaces §§P1.31–P1.32, P7.11, P7.9, P2.17; DiamondsAndVStacks §§D4.6, D5.3.

### 1.3 Scholze's Hebbarkeitssatz for affinoid perfectoid spaces in characteristic `p`

Let `K` be a perfectoid field of characteristic `p, t ∈ 𝔪_K` nonzero, `X = Spa(R, R⁺)` an affinoid perfectoid space over `K, I ⊆ R` an ideal, `I⁺ = I ∩ R⁺, I^{+1/p^∞} ⊆ R⁺` the ideal of elements some p-power of which lies in `I⁺`, and `Z = V(I) ⊆ X`. Then (i) there is an isomorphism of almost `𝒪_K`-modules `Hom_{R⁺}(I^{+1/p^∞}, R⁺/t)^a ≅ H⁰(X ∖ Z, 𝒪⁺_X/t)^a`, compatible, at every `x ∈ X ∖ Z` with completed residue field `k(x)`, with evaluation `H⁰(X ∖ Z, 𝒪⁺_X/t)^a → 𝒪_{k(x)}^a/t`; and (ii) for a map `R → R′` of perfectoid K-algebras and `I′ = IR′`, the map `I^{+1/p^∞} ⊗_{R⁺} R′⁺ → I′^{+1/p^∞}` is an almost isomorphism.

`K` perfectoid of characteristic `p`; almost mathematics with respect to `𝔪_K`.

Use AutomorphicBundles §B3.HT.3’s root-ideal extension interface, with its evaluation at completed residue fields. The displayed `Hom` and base-change maps are those underlying that interface, in the characteristic-p notation here.

([Scholze], §2.3.1, Lemma 2.3.1, Proposition 2.3.2 and Remark 2.3.3, pp. 958–961.) Statement and proof of the almost isomorphism between `Hom` out of the p-root closure of `I⁺` and sections modulo `t` off `V(I)`, with the stalk computation and the evaluation compatibility.

([Scholze], §2.3.1, Lemma 2.3.4, pp. 961–962.)

For `Z = ∅ (I = R)` both sides of (i) are `(R⁺/t)^a`.

In the setting of §1.4, (i) gives the usual extension statement `H⁰(X, 𝒪⁺/t)^a ≅ H⁰(X ∖ Z, 𝒪⁺/t)^a`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; PerfectoidSpaces §§P0.5, P0.7, P2.3, P2.7, P2.9–P2.10.

### 1.4 The Hebbarkeitssatz on the perfected Hasse locus of a normal variety with a resolution

Let `A₀` be a normal integral finitely generated `𝔽_p`-algebra such that `Spec A₀` admits a resolution of singularities (a proper birational `T → Spec A₀` with `T` smooth over `𝔽_p`), `0 ≠ f ∈ A₀, K =` the completion of `⋃_r 𝔽_p((t^{1/p^r})), S = A₀^{1/p^∞} ⊗̂_{𝔽_p} K` with `S⁺ = A₀^{1/p^∞} ⊗̂_{𝔽_p} 𝒪_K, Y = Spa(S, S⁺), X = {y ∈ Y : |f(y)| ≥ |t|}` with `(R, R⁺) = (𝒪_Y(X), 𝒪⁺_Y(X))`, and `0 ≠ I₀ ⊆ A₀` an ideal with `Z = V(I₀R) ⊆ X`. Then `H⁰(X, 𝒪⁺_X/t)^a → H⁰(X ∖ Z, 𝒪⁺_X/t)^a` is an isomorphism of almost `𝒪_K`-modules. The key input is: for `0 ≠ f, g ∈ A₀` the maps `A₀^{1/p^∞} → Hom(g^{1/p^∞}A₀^{1/p^∞}, A₀^{1/p^∞})` and `A₀^{1/p^∞}/f → Hom(g^{1/p^∞}A₀^{1/p^∞}, A₀^{1/p^∞}/f)` are almost isomorphisms for the ideal generated by all `f^{1/p^m}`; the first is an isomorphism and the second injective without any resolution hypothesis.

`A₀` normal, integral, of finite type over `𝔽_p`, with a resolution of singularities; in the Siegel application `Spec A₀` is an open of the minimal compactification `X* ⊗ 𝔽_p, f` is the Hasse invariant, `I₀` the boundary ideal, and the resolution is a smooth toroidal compactification.

No codimension condition on `V(I₀)` is needed here; codimension at least two enters only in the §1.5 injectivity of §1.6.

This is the perfected Hasse-chart extension input of AutomorphicBundles §B3.HT.3. Identify `A₀`, its resolution, `f`, the boundary ideal and the completed Huber pair with the supplied chart; its root-ideal comparison gives the displayed restriction map.

([Scholze], §2.3.2, Corollary 2.3.5 and its proof, pp. 962–963.) The extension isomorphism on the locus `|f| ≥ |t|` of the perfected variety, assuming a resolution of singularities.

([Scholze], §2.3.2, Lemma 2.3.6, Remark 2.3.7 and the proof of Lemma 2.3.6, pp. 963–966.) The two almost isomorphisms for `Hom` out of `g^{1/p^∞}A₀^{1/p^∞}`, the first proved by valuations and the second through the resolution.

For `I₀ = A₀ (Z = ∅)` the statement is the identity.

For `A₀ = 𝔽_p[x, y], f = 1` and `I₀ = (x, y)`, it says that bounded functions modulo `t` on the perfectoid punctured affinoid plane extend across the origin.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.3; SchemeAndStackFoundations §§4.13, 2.1; PerfectoidSpaces §P0.5.

### 1.5 Good triples: affinoid perfectoid spaces with a Hebbarkeitssatz relative to a boundary and a good-reduction locus

Let `K` be a perfectoid field (of any characteristic) and `t ∈ K` with `|p| ≤ |t| < 1, t ≠ 0`. A triple `(X, Z, U)` of an affinoid perfectoid space `X` over `K`, a closed subset `Z ⊆ X` and a quasi-compact open subset `U ⊆ X ∖ Z` is good if the restriction maps give an isomorphism `H⁰(X, 𝒪⁺_X/t)^a ≅ H⁰(X ∖ Z, 𝒪⁺_X/t)^a` and an injection `H⁰(X ∖ Z, 𝒪⁺_X/t)^a ↪ H⁰(U, 𝒪⁺_U/t)^a` of almost `𝒪_K`-modules. Goodness does not depend on `t`, is compatible with tilting, and for a good triple the same two statements hold for every `t ∈ 𝒪_K`, including `t = 0`: bounded functions on `X ∖ Z` extend uniquely to `X` and are determined by their restriction to `U`.

In the Siegel application `X` is an affinoid open of a perfectoid minimal compactification, `Z` its boundary and `U` its good-reduction locus.

Use the good-triple predicate and scalar-independence, tilting and bounded-extension theorems of AutomorphicBundles §B3.HT.3. `GoodTriple` and its API below denote that same predicate and those theorems. Restriction to `U` and the boundary complement uses the same opens under the chart identification; the `t=0` assertion retains the supplied passage through all scalar reductions.

([Scholze], §2.3.3, Definition 2.3.8 and the paragraph after it, pp. 966–967.) The definition of good triples, independence of `t`, compatibility with tilting and the `t = 0` consequence for bounded functions.

The API is `GoodTriple`, `GoodTriple.indep_t`, .`tilt_iff, .extend_bounded, .of_hasse_chart, .finite_normal_cover` and .limit: the stated predicate, parameter independence, tilting equivalence, `t=0` extension/injectivity, and the three stability theorems of §1.6. The cover theorem retains normality, étaleness off the boundary and absence of components over it; the limit theorem retains surjective transitions.

**Checks.**

- `goodTriple_empty_boundary`: For any affinoid perfectoid `X`, the triple `(X, ∅, X)` is good.
- `goodTriple_empty_open`: For `X` nonempty, `(X, ∅, ∅)` is not good: `H⁰(X, 𝒪⁺/t)^a = (R⁺/t)^a` is not almost zero, so it does not inject into `H⁰(∅, 𝒪⁺/t)^a = 0`.
- `goodTriple_codimension_one_fails`: For `A₀ = 𝔽_p[x], f = x` and `J = (x)` (so `V(J)` has codimension one), with `R₀ = (A₀ ⊗̂ K)⟨u⟩/(ux − t)` and `U₀ = {|x| = 1}`: the function `u` has `|u| = |t|` on `U` but `|u| = 1` where `|x| = |t|`, so it is zero in `H⁰(U, 𝒪⁺/t)^a` and not almost zero in `H⁰(X, 𝒪⁺/t)^a`; the perfected triple is not good.
- `goodTriple_tilt`: `(X, Z, U)` is good if and only if `(X♭, Z♭, U♭)` is good, where ♭ is the tilting equivalence of PerfectoidSpaces P2.

A good triple with `U = X ∖ Z` gives Riemann's extension for bounded functions across `Z`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; PerfectoidSpaces §§P2.9–P2.10, P2.2, P2.7, P0.5.

### 1.6 Good triples: the base case and stability under finite normal covers, limits and field extension

Let `K` be a perfectoid field of characteristic `p, R₀` a reduced topologically finitely generated Tate K-algebra, `X₀ = Spa(R₀, R₀°), X` its completed perfection (an affinoid perfectoid space), `I₀ ⊆ R₀` an ideal with `Z₀ = V(I₀), Z` its preimage, and `U₀ ⊆ X₀ ∖ Z₀` a quasi-compact open with preimage `U`. (a) Base case: if `A₀` is normal of finite type over `𝔽_p` with a resolution of singularities, `f ∈ A₀` is a nonzerodivisor, `R₀ = (A₀ ⊗̂_{𝔽_p} K)⟨u⟩/(uf − t), I₀ = JR₀` for an ideal `J ⊆ A₀` with `V(J) ⊆ Spec A₀` of codimension `≥ 2` and `U₀ = {x : |g(x)| = 1 for some g ∈ J}`, then `(X, Z, U)` is good for `K` the completion of any algebraic extension of the completed perfectoid field `̂(⋃_r 𝔽_p((t^{1/p^r})))`. (b) Finite normal covers: if `(X, Z, U)` is good, `R₀` is normal, `V(I₀) ⊆ Spec R₀` has codimension `≥ 2`, and `R₀′` is a finite normal `R₀`-algebra étale outside `V(I₀)` with no irreducible component of `Spec R₀′` mapping into `V(I₀)`, then (i) the trace map `R₀′ → Hom_{R₀}(R₀′, R₀)` is an isomorphism (self-duality, without asserting that `R₀′` is projective over a singular `R₀`), (ii) its perfection `R′° ⊗_{R°} R′° → R°` is almost perfect, (iii) `H⁰(V′, 𝒪⁺/t)^a ≅ Hom_{R°/t}(R′°/t, H⁰(V, 𝒪⁺/t))^a` for every open `V ⊆ X` with preimage `V′`, (iv) the triple `(X′, Z′, U′)` is good, and (v) if `X′ → X` is surjective then `H⁰(X, 𝒪⁺/t) → H⁰(X′, 𝒪⁺/t) ∩ H⁰(U, 𝒪⁺/t)` is an almost isomorphism. (c) Limits: for a filtered system of such covers `R₀^{`(i)} with surjective transition maps `X^{`(i)`} → X^{(j)}`, the inverse limit `X̃` in perfectoid spaces with the preimages `Z̃, Ũ` is good. The same preservation of goodness holds for a globally finite étale `R₀`-algebra without the codimension-two condition: its finite projective trace duality is global. This is the version used for the genus-one `Γ₁` cover.

(a) uses the codimension-two condition only for the injectivity into `U`: it needs depth `≥ 1` of `A₀/f` at points of `V(J)`, which follows from Serre's criterion for the normal ring `A₀`.

(b), (c): `K` of characteristic `p`; transfer to characteristic 0 is by tilting (§1.5).

Use AutomorphicBundles §B3.HT.3’s stability package on these identical Hasse charts and normal finite covers. The chart, trace-duality and limit assertions below are its interfaces, with the codimension, no-boundary-component and surjectivity hypotheses retained. The genus-one globally finite étale case uses global projective trace duality, without a codimension-two assumption.

([Scholze], §2.3.3, Lemma 2.3.9 and its proof, pp. 967–968.) Goodness of the perfected Hasse chart triple when the boundary has codimension at least two, using depth of `A₀` and `A₀/f`.

([Scholze], §2.3.3, Lemma 2.3.10 (i)–(v) and its proof, pp. 968–969.)

([Scholze], §2.3.3, Lemma 2.3.11 and Corollary 2.3.12 with proofs, pp. 969–970.) Goodness of inverse limits along surjective transition maps and the extension to completed algebraic extensions of the base field.

For `A₀ = 𝔽_p[x, y], f = y` and `J = (x, y)`, (a) recovers the elementary Hartogs-type statement of Scholze Remark 3.2.11 in characteristic p.

`goodTriple_codimension_one_fails` of §1.5 shows that the codimension condition of (a) cannot be dropped.

For a globally finite étale cover of a good triple with empty boundary, goodness is preserved even in dimension one; trace self-duality does not require removing a codimension-two subset in this case.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.5; §1.4; SchemeAndStackFoundations §§4.13, 0.6; AdicSpacesPartIII §R3.8; PerfectoidSpaces §§P3.13, P7.14.

### 1.7 Hartogs extension on the Hasse blow-up `Spf((R ⊗̂ ℤ_p^cycl)⟨u⟩/(fu − p^ε))`

(i) Classical algebraic Hartogs: for a normal noetherian ring `R` and a subset `Z ⊆ Spec R` everywhere of codimension `≥ 2, R = H⁰(Spec R ∖ Z, 𝒪)`. (ii) Let `R` be a topologically finitely generated flat p-adically complete `ℤ_p`-algebra with `R̄ = R/p` normal, `f ∈ R` with image `f̄ ∈ R̄` a nonzerodivisor, `0 ≤ ε ≤ 1`, and `S = (R ⊗̂_{ℤ_p} ℤ_p^cycl)⟨u⟩/(fu − p^ε)`. Then `S` is a flat p-adically complete `ℤ_p^cycl`-algebra in which `u` is a nonzerodivisor, and for a closed subset `Y ⊆ Spec R̄` of codimension `≥ 2` with preimage `Z ⊆ Spf S` and complement `U, H⁰(U, 𝒪_{Spf S}) = H⁰(Spf S, 𝒪_{Spf S}) = S`.

`p^ε ∈ ℤ_p^cycl` denotes an element of valuation `ε` (`ε` of the form `a/((p − 1)p^n)`).

In the Siegel application `R` is an affine chart of the integral minimal compactification, `f` a lift of the Hasse invariant and `Y` the boundary, of codimension `≥ 2` in the special fibre when `g ≥ 2`.

The finite-level Hartogs input is supplied by AutomorphicBundles §B3.HT.2, using SchemeAndStackFoundations §§0.6, 4.13. Identify its local blow-up ring with this `S`, including the completed cyclotomic base, chosen `p^ε`, Hodge trivialization and removed boundary.

([Scholze], §3.2.2, Proposition 3.2.9, p. 980.)

([Scholze], §3.2.2, Lemma 3.2.10, Remark 3.2.11 and the proof of Lemma 3.2.10, pp. 981–983.) Hartogs on the Hasse blow-up of a flat p-adic algebra with normal special fibre, with the illustration by the bidisc.

For `R = ℤ_p⟨T₁, T₂⟩, f = T₂, ε = 1` and `Y = {T₁ = T₂ = 0}` this is the rigid-analytic Hartogs statement of Scholze Remark 3.2.11: functions on `{|t₁| = 1 or |t₂| = 1}` inside `{|t₁| ≤ 1, |p| ≤ |t₂| ≤ 1}` extend uniquely.

At `ε = 0` and `f = 1, u = 1, S` is the original scalar-extended p-adic ring, whereas the u-adic completion is zero. Hartogs still holds by the ordinary localization argument; this rules out using that completion uniformly in `ε`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; SchemeAndStackFoundations §§4.13, 0.6.

### 1.8 The Frobenius diagram modulo `p` on Hasse domains

Let `0 ≤ ε < 1`. The relative Frobenius maps of `𝔄(p⁻¹ε)/p, 𝔛(p⁻¹ε)/p` and `𝔛*(p⁻¹ε)/p` over `ℤ_p^cycl/p`, followed by the natural isomorphisms `(𝔜(p⁻¹ε)/p)^{(p)} ≅ 𝔜(ε)/p (𝔜 = 𝔄, 𝔛, 𝔛*)`, form a natural commutative diagram `F: 𝔄(p⁻¹ε)/p → 𝔄(ε)/p` over `F: 𝔛(p⁻¹ε)/p → 𝔛(ε)/p` over `F: 𝔛*(p⁻¹ε)/p → 𝔛*(ε)`/p.

`0 ≤ ε < 1`.

Use AutomorphicBundles §B3.HT.2’s Frobenius-chart transition, with the same Hasse domain and fractional-power relation. The relative Frobenius diagram is transported along the identity on the finite-level moduli and universal family.

([Scholze], §3.2.2, Lemma 3.2.14, pp. 984–985.)

For `ε = 0` it is the relative Frobenius of the ordinary locus modulo p.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.1; `mathlib:frobenius`; AdicSpacesPartIII §R2.10.

### 1.9 Trace estimates for Frobenius-type extensions on Hasse domains

(i) (Lemma 3.2.21) Let `R` be a p-adically complete flat `ℤ_p`-algebra, `Y_1`, `…, Y_n ∈ R, P_1, …, P_n ∈ R⟨X_1, …, X_n⟩` topologically nilpotent and `S = R⟨X⟩/(X_i^p − Y_i − P_i)`. Then `S` is finite free over `R` with basis `X^{i} (0 ≤ i_j ≤ p − 1)`, and `tr_{S/R}(S) ⊆ Iⁿ` for `I = (p, I_1, …, I_n), I_i` the ideal generated by the coefficients of `P_i`. (ii) (Corollary 3.2.22) Let `R` be a p-adically complete `ℤ_p`-algebra topologically of finite type and formally smooth of dimension `n, f ∈ R` with `f̄ ∈ R/p` a nonzerodivisor, `R_ε = (R ⊗̂_{ℤ_p} ℤ_p^cycl)⟨u_ε⟩/(f u_ε − p^ε)` for `0 ≤ ε < 1`, and `φ: R_ε → R_{ε/p}` a `ℤ_p^cycl`-algebra map that is, modulo `p^{1−ε}`, Frobenius on `R̄` and `u_ε ↦ u_{ε/p}^`p. If `ε < 1/2` then `φ[1/p]` is finite flat, indeed finite free of `rank p^n` locally on `Spf R`, and the trace `tr: R_{ε/p}[1/p] → R_ε[1/p]` maps `R_{ε/p}` into `p^{n−(2n+1)ε} R_ε`.

As stated; the trace is the trace of a finite locally free algebra (AdicSpacesPartIII §R3.8).

`ε < 1/2` in (ii).

Use the Frobenius-type trace estimate of AutomorphicBundles §B3.HT.3 on §B3.HT.2’s rings. The trace is the supplied finite locally free trace, with `n` the relative dimension. Its coefficient error in (ii) is `p^{1−2ε}`, giving exactly the displayed integral loss; the ring presentation and radius are unchanged.

([Scholze], §3.2.4, Lemma 3.2.21 and Corollary 3.2.22 with proofs, pp. 991–994.)

([Scholze], §3.2.4, proof of Corollary 3.2.22(ii), p. 994.) The coefficient bound `p^{1−2ε}`, not `p^{1−ε}`.

For `n = 1, R = ℤ_p⟨Y⟩` and `S = R⟨X⟩/(X^p − Y), tr(X^i) = 0` for `0 < i < p` and `tr(1) = p`, so `tr(S) ⊆ (p) = I`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.7; AdicSpacesPartIII §R3.8.

### 1.10 Canonical Frobenius lifts on Hasse domains

Let `0 ≤ ε < 1/2`. There is a unique diagram of p-adic formal schemes `F̃: 𝔄(p⁻¹ε) → 𝔄(ε), 𝔛(p⁻¹ε) → 𝔛(ε), 𝔛*(p⁻¹ε) → 𝔛*(ε)`, compatible with the projections, in which `F̃_𝔄` is an isogeny of principally polarised abelian schemes with level structure over `F̃_𝔛`, that reduces modulo `p^{1−ε}` to the diagram of §1.8 (uniqueness is among the displayed diagrams, including the morphism of abelian schemes and the moduli structures). On `𝔛(p⁻¹ε), F̃` sends A to `A/C`, where `C ⊆ A[p]` is the canonical subgroup of level 1 (it exists because `Ha^p` divides `p^ε` there). The maps `F̃_{𝔛(p⁻¹ε)}` and `F̃_{𝔄(p⁻¹ε)}` are finite, and after inverting `p` they are finite étale of degrees `p^{g(g+1)/2}` and `p^{g(g+1)/2+g}`. No general integral-flatness assertion is made here.

`0 ≤ ε < 1/2` (needed for the strong canonical subgroup of level 1 on `𝔄(p⁻¹ε)`, whose uniqueness gives the uniqueness of the diagram).

Use AutomorphicBundles §B3.HT.2’s canonical quotient/Frobenius diagram. Its subgroup is the shared subgroup of §B3.HT.1, also denoted `TauCeti.HodgeTate.canonicalSubgroup` by HodgeTateAndCanonicalSubgroups. The identification preserves the polarization, tame level and Frobenius congruence. Finite-level Hartogs for `g≥2` and the genus-one Tate cusp charts are part of that supplied extension. The two generic degrees remain those displayed above.

([Scholze], §3.2.2, Theorem `3.2.15(i)` and its proof, pp. 985–987.)

([Scholze], §3.2.2, proof of Theorem `3.2.15(i)`, p. 986.)

For `g = 1` and `ε = 0, F̃` is the classical canonical lift of Frobenius on the ordinary locus, `E ↦ E/C`, of degree `p` on generic fibres.

`F̃ ∘` (inclusion `𝔛(p⁻²ε) ⊆ 𝔛(p⁻¹ε)`) = (inclusion) `∘ F̃` (compatibility with shrinking `ε`).

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.1; §1.8; §1.9; §1.7; HodgeTateAndCanonicalSubgroups §§3.4, 3.6, 3.7, 3.8, 3.3, 4.1, 4.3; AdicSpacesPartIII §R2.10; ShimuraVarieties §8.20.

### 1.11 Anticanonical open immersions into `Γ₀(pᵐ)`-level

Let `0 ≤ ε < 1/2` and `m ≥ 0`. Then `𝔄(p⁻ᵐε) → 𝔛(p⁻ᵐε)` has a canonical subgroup `C_m ⊆ 𝔄(p⁻ᵐε)[pᵐ]` of level `m`, and the pair `(𝒜(p⁻ᵐε)/C_m, 𝒜(p⁻ᵐε)[pᵐ]/C_m)` defines a morphism `𝒳(p⁻ᵐε) → 𝒳_{Γ₀(pᵐ)}` on generic fibres, which extends uniquely to `𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}`; these morphisms are open immersions. For `m ≥ 1` the square with top `𝒳*(p⁻ᵐ⁻¹ε) → 𝒳*_{Γ₀(pᵐ⁺¹)}`, left `(F̃_{𝔛*(p⁻ᵐ⁻¹ε)})^{ad}_η`, right the forgetful map `𝒳*_{Γ₀(pᵐ⁺¹)} → 𝒳*_{Γ₀(pᵐ)}` and bottom `𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}` commutes and is cartesian.

`0 ≤ ε < 1/2`; the left arrow of the square is the extension of `F̃` to the minimal compactification (the published label omits the star).

Use AutomorphicBundles §B3.HT.2’s finite-level anticanonical identification, with the same quotient `A/C_m`, residual level subgroup `A[pᵐ]/C_m`, polarization and minimal boundary. Its transition compatibility identifies the displayed square with the supplied Frobenius/forgetful square, including the genus-one Tate cusp chart.

([Scholze], §3.2.2, Theorem 3.2.15(ii) and its proof, pp. 985–987.)

([Scholze], §3.2.2, proof of Theorem 3.2.15(ii), pp. 987–988.)

([Heuer], §2.5, Proposition 2.22 and its proof, p. 14.)

For `g = 1`, the image of `𝒳(p⁻ᵐε)` is the locus of `(E', D)` with `E' = E/C_m` and `D ∩` (canonical subgroup of `E'`) = 0, i.e. the anticanonical component of the `Γ₀(pᵐ)`-curve over the `ε`-ordinary locus.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.1; §1.10; §1.7; §0.1; HodgeTateAndCanonicalSubgroups §§3.4, 3.6, 3.7, 3.8, 3.3, 4.1, 4.3; ShimuraVarieties §8.20.

### 1.12 The anticanonical locus at `Γ₀(p)`-level

Let `0 ≤ ε < 1/2`. There is a weak canonical subgroup `C ⊆ 𝔄(ε)[p]` of level 1 (the published text says level `p` rather than level 1); write `C` also for its generic fibre, and let `𝒳_{Γ₀(p)}(ε) → 𝒳(ε)` be the pullback of `𝒳_{Γ₀(p)} → 𝒳`. Then the map `𝒳(p⁻¹ε) → 𝒳_{Γ₀(p)}(ε)` of §1.11 and `(F̃_{𝔛(p⁻¹ε)})^{ad}_η: 𝒳(p⁻¹ε) → 𝒳(ε)` form a commutative triangle over `𝒳(ε)`, identifying `𝒳(p⁻¹ε)` with the open and closed subset `𝒳_{Γ₀(p)}(ε)_a ⊆ 𝒳_{Γ₀(p)}(ε)` of those totally isotropic `D ⊆ 𝒜(ε)[p]` of `rank p^g` with `D ∩ C = {0}` ('a' for anticanonical).

`0 ≤ ε < 1/2`.

Use AutomorphicBundles §B3.HT.2’s anticanonical finite-level chart. Its moduli identification is the displayed disjointness condition with the shared weak canonical subgroup of §B3.HT.1, and its map to the base is the same canonical Frobenius quotient. Preserve the clopen decomposition and the complement degree `p^{g(g+1)/2}`.

([Scholze], §3.2.2, Theorem 3.2.15(iii) and Remark 3.2.16, p. 986.)

([Scholze], §3.2.2, proof of Theorem 3.2.15(iii), p. 987.)

For `g = 1, 𝒳_{Γ₀(p)}(ε) → 𝒳(ε)` has degree `p + 1`: the canonical locus `(D = C)` maps isomorphically onto `𝒳(ε)`, and the anticanonical locus `𝒳_{Γ₀(p)}(ε)_a` has degree `p` over `𝒳(ε)` and is isomorphic to `𝒳(p⁻¹ε)` via `(E, D) ↦ E/D`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.11; §1.10; HodgeTateAndCanonicalSubgroups §§3.4, 3.6, 3.7, 3.8, 3.3, 4.1, 4.3.

### 1.13 The anticanonical `Γ₀(pᵐ)`-tower and its affinoidness at deep level

Let `0 ≤ ε < 1/2`. For `m ≥ 1` define `𝒳_{Γ₀(pᵐ)}(ε)_a ⊆ 𝒳_{Γ₀(pᵐ)}(ε)` and `𝒳*_{Γ₀(pᵐ)}(ε)_a ⊆ 𝒳*_{Γ₀(pᵐ)}(ε)` as the images of the open immersions `𝒳(p⁻ᵐε) → 𝒳_{Γ₀(pᵐ)}` and `𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}; 𝒳*_{Γ₀(pᵐ)}(ε)_a` is open and closed in `𝒳*_{Γ₀(pᵐ)}(ε)` and is the preimage of `𝒳*_{Γ₀(p)}(ε)_a`; for `K_p ⊆ Γ₀(p)` put `𝒳*_{K_p}(ε)_a :=` preimage of `𝒳*_{Γ₀(p)}(ε)_a`. The anticanonical tower is `(𝒳*_{Γ₀(pᵐ)}(ε)_a)_{m ≥ 1}` with transition maps the forgetful maps; it has the integral models `𝔛*(p⁻ᵐε)` with transition maps the Frobenius lifts `F̃`, which reduce to relative Frobenius modulo `p^{1−ε}`. For `m` sufficiently large (depending on `ε`), `𝒳*_{Γ₀(pᵐ)}(ε)_a` is affinoid (Lemma 3.2.17).

`0 ≤ ε < 1/2`.

`Γ₀(pᵐ)` with the corrected similitude condition (Layer 0 §0.1).

Identify this tower and its integral models with AutomorphicBundles §B3.HT.2’s anticanonical tower. The identification is the identity on each finite-level moduli space, intertwines the Frobenius and forgetful transitions, and carries the Hasse-line trivializations and boundary ideals to the supplied ones. Deep-level affinoidness is the supplied ample-Hodge-line assertion.

([Scholze], §3.2.2, the paragraphs after Theorem 3.2.15 and Lemma 3.2.17, p. 988.)

The API is `SiegelTorsion.anticanonical`, .`anticanonical_iso_hasse, .anticanonical_isClopen, .anticanonical_integralModel, .anticanonical_isAffinoid` and .`anticanonical_restrict`: the forgetful tower, its Hasse-domain identification, clopenness, integral Frobenius models, deep-level affinoidness and pullback to `K_p⊆Γ₀(p)`.

**Checks.**

- `anticanonical_m1_degree`: For `g = 1, 𝒳_{Γ₀(p)}(ε) → 𝒳(ε)` has degree `p + 1` and its anticanonical part has degree `p`: the canonical part is one sheet.
- `anticanonical_eps_zero`: For `ε = 0` the anticanonical tower lies over the ordinary locus and its integral transition maps are exactly relative Frobenius modulo p.
- `anticanonical_not_full_preimage`: `𝒳_{Γ₀(p)}(ε)_a` is not the whole preimage of `𝒳(ε)`: the locus `D = C` (canonical) is a different open and closed piece.
- `anticanonical_affinoid_of_lift`: If `m ≥ 1` and `Ha^{pᵐ}` lifts to a global section `H̃` of `ω^{⊗pᵐ(p−1)}` over `𝔛*` (for instance when `H¹(X*, ω^{⊗pᵐ(p−1)}) = 0`), then `𝒳*_{Γ₀(pᵐ)}(ε)_a ≅ 𝒳*(p⁻ᵐε) = {|H̃| ≥ |p|^ε}` (using `ε < 1`), which is affinoid because `H̃` is a section of an ample line bundle; a definition not identifying level `m` with the Hasse domain of radius `p⁻ᵐε` fails this.

For `g = 1` and `ε = 0` every level `𝒳*_{Γ₀(pᵐ)}(0)_a` is identified with `𝒳*(0)` (the ordinary locus with its cusps), and the tower is `𝒳*(0) ← 𝒳*(0) ← ⋯` with transition maps the canonical Frobenius lift `E ↦ E/C` of degree `p`; it is not an Igusa tower, whose levels have growing degree over `𝒳(0)`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.11; §1.12; §1.10; §1.1; §0.1; PerfectoidSpaces §P7.5–P7.6.

### 1.14 The anticanonical tower at `Γ₀(p^∞)`-level is perfectoid and its tilt is a perfection

Let `0 ≤ ε < 1/2`. There are unique perfectoid spaces `𝒳_{Γ₀(p^∞)}(ε)_a, 𝒳*_{Γ₀(p^∞)}(ε)_a` and `𝒜_{Γ₀(p^∞)}(ε)_a` over `ℚ_p^cycl` with `𝒳_{Γ₀(p^∞)}(ε)_a ~ lim_m 𝒳_{Γ₀(pᵐ)}(ε)_a` and likewise for the other two (tilde-limits in the sense of PerfectoidSpaces §P7.2). The tilt of `𝒳*_{Γ₀(p^∞)}(ε)_a` is naturally the open subset `𝒳′*^{perf}(ε) ⊆ 𝒳′*^{perf}` where `|Ha| ≥ |t|^ε`, and the tilt of `𝒜_{Γ₀(p^∞)}(ε)_a` is `𝒜′^{perf}(ε)`; here the primed spaces are the Siegel spaces over the completed perfection of `𝔽_p((t^{1/(p−1)}))`, identified with `(ℚ_p^cycl)^♭` after choosing the tilt parameter, `t^♯ = p` up to a unit, and `^{perf}` is the perfection of PerfectoidSpaces §P7.5–P7.6.

`0 ≤ ε < 1/2`; the limit runs over the anticanonical tower, which is not a cofinal level system (`Γ₀(p^∞)` is not open).

Use AutomorphicBundles §B3.HT.2’s represented anticanonical tilde-limit. On every compatible affine sequence, identify its integral ring with the completed direct limit of §1.13’s same finite-level rings. The Frobenius congruence identifies the tilted chart with the displayed characteristic-p perfection; uniqueness and gluing use PerfectoidSpaces §§P7.10–P7.12.

([Scholze], §3.2.3, Definition 3.2.18 and Corollary 3.2.19 with proof, pp. 989–990.)

([Scholze], §3.2.3, Corollary 3.2.19, p. 989.)

For `g = 1` and `ε = 0` this is the perfectoid ordinary locus of the modular curve at `Γ₀(p^∞)`-level, whose tilt is the perfection of the ordinary locus in characteristic p.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.13; PerfectoidSpaces §§P7.13, P7.5–P7.6, P7.12, P7.10.

### 1.15 At `Γ₀(p^∞)`-level the anticanonical piece is affinoid perfectoid with strongly Zariski closed boundary

For `0 ≤ ε < 1/2, 𝒳*_{Γ₀(p^∞)}(ε)_a` is affinoid perfectoid, and its boundary `𝒵_{Γ₀(p^∞)}(ε)_a ⊆ 𝒳*_{Γ₀(p^∞)}(ε)_a` is strongly Zariski closed (PerfectoidSpaces §P4.13: `R → S` surjective, `R⁺ → S⁺` almost surjective, `S⁺` the integral closure of the image).

`0 ≤ ε < 1/2`; strongly Zariski closed with `S⁺` the integral closure of the image of `R⁺`.

Use AutomorphicBundles §B3.HT.2’s affinoid limit and strongly closed boundary. Under §1.14’s completed-ring comparison the boundary ideal is the one from the finite-level system, and the induced plus ring is its supplied integral closure. Tilting and restriction preserve this identification.

([Scholze], §3.2.3, Corollary 3.2.20 with proof, p. 990.)

For `g = 1` the boundary is the finite set of cusps of the perfectoid anticanonical neighbourhood; strong Zariski closedness says the restriction to cusps is almost surjective on plus rings.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.14; PerfectoidSpaces §§P4.13, P4.21, P4.13–P4.15; PerfectoidQuotients §2.1.

### 1.16 Tate's normalized traces on the anticanonical tower

For a finite algebra, the normalized trace is `(dim_K A)⁻¹·Tr_{A/K}`, where `K` is a characteristic-zero field and A is a nonzero finite free commutative K-algebra. Its degree is positive, so its image in `K` is nonzero, and the normalized trace retracts `K → A`. For `A = K` it is the identity; for `A = K × K` it sends `(a, b)` to `(a + b)/2`. The completed tower trace below additionally requires the analytic estimate and passage to the completion.

Fix `0 ≤ ε < 1/2` and let `𝔛_{Γ₀(p^∞)}(ε)_a = lim_m 𝔛(p⁻ᵐε)` over `ℤ_p^cycl` (transition maps the Frobenius lifts `F̃`). For fixed `m` and `m′ ≥ m` the normalized traces `p^{−(m′−m)g(g+1)/2} tr: 𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p]` are compatible in `m′` and define `tr̄_m: colim_{m′} 𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p]`; the image of `colim_{m′} 𝒪_{𝔛(p^{−m′}ε)}` lies in `p^{−C_m}𝒪_{𝔛(p⁻ᵐε)}` with constants `C_m → 0`, so `tr̄_m` extends by continuity to `𝒪_{𝔛_{Γ₀(p^∞)}(ε)_a}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p]`, an `𝒪_{𝔛(p⁻ᵐε)}[1/p]`-linear retraction of the inclusion; and `x = lim_{m→∞} tr̄_m(x)` for every `x`.

`0 ≤ ε < 1/2; g(g+1)/2 = dim` of the Siegel space, so `p^{(m′−m)g(g+1)/2}` is the degree of the transition map on generic fibres.

Use AutomorphicBundles §B3.HT.3’s normalized traces on the same Frobenius tower rings. Their normalization is by the generic degree `p^{g(g+1)/2}` per step; the finite-algebra formula above specifies its algebraic specialization. The completed-ring identification intertwines the trace retractions, their integral bounds `C_m→0` and convergence, so these are the supplied operators themselves.

([Scholze], §3.2.4, Corollary 3.2.23, p. 994.)

The API is `SiegelTorsion.normalizedTrace` with .`normalizedTrace_of_finiteLevel, .normalizedTrace_compat, .normalizedTrace_bound, .normalizedTrace_tendsto` and .`normalizedTrace_linear`: the completed retractions, identity at level `m`, composition for `m′≥m`, the integral estimate with `C_m→0`, convergence to `x`, and continuous linearity over the level-m ring after inverting p.

**Checks.**

- `normalizedTrace_identity_level`: For `x` already at level `m, tr̄_m(x) = x`.
- `normalizedTrace_g1_monomial`: For the toy tower `ℤ_p⟨T^{1/p^∞}⟩` (one Frobenius step `T ↦ T^p, n = 1, ε = 0`), `tr̄_0(T^{a/p^k}) = 0` when `a/p^k ∉ ℤ` and `= T^{a/p^k}` when it is an integer: the normalized trace is the projection onto integral exponents.
- `normalizedTrace_not_unnormalized`: For a strict transition `m′>m` with `g≥1`, the unnormalized trace is not a retraction: `tr(1) = p^{(m′−m)g(g+1)/2} ≠ 1`. For `m′=m` both traces are the identity.
- `normalizedTrace_traceCompatibility`: On the finite transition from level `m′` to `m`, of degree `d = p^{(m′−m)g(g+1)/2}`, the normalized trace is `d⁻¹` times AdicSpacesPartIII §R3.8 after inverting `p`; in particular its value on 1 is 1. The factor is not `p` raised to minus the degree `d`.

For `g = 1` and `ε = 0` every level is `𝔛(0)` (the ordinary locus) and every transition map is the canonical Frobenius lift `φ` of degree `p`, so `tr̄_m(x) = lim_{m′} p^{−(m′−m)} tr_{φ^{m′−m}}(x)`: the normalized trace along the Frobenius tower of `𝔛(0)`, not along an Igusa tower.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.13; §1.9; §1.10; AdicSpacesPartIII §R3.8.

### 1.17 Hartogs extension for finite covers of the anticanonical tower

Assume `g ≥ 2` and `0 ≤ ε < 1/2`. Let `𝒴*_m → 𝒳*_{Γ₀(pᵐ)}(ε)_a` be finite, étale away from the boundary, with `𝒴*_m` normal and no irreducible component mapping into the boundary; let `𝒴_m` be the preimage of `𝒳_{Γ₀(pᵐ)}(ε)_a`, for `m′ ≥ m` let `𝒴*_{m′}` be the normalisation of the pullback to `𝒳*_{Γ₀(p^{m′})}(ε)_a` with `𝒴_{m′} ⊆ 𝒴*_{m′}`, and `𝒴_∞` the pullback of `𝒴_m` to `𝒳_{Γ₀(p^∞)}(ε)_a`. For `m′` large, `𝒴*_{m′} = Spa(S_{m′}, S_{m′}⁺)` with `S_{m′}⁺ = S_{m′}°` is affinoid. Then (i) `S_{m′}⁺ = H⁰(𝒴_{m′}, 𝒪⁺)` for `m′` large; (ii) `colim_{m′} S_{m′}⁺ → H⁰(𝒴_∞, 𝒪⁺)` is injective with dense image, and there are canonical continuous retractions `H⁰(𝒴_∞, 𝒪) → S_{m′}`; (iii) if `S_∞ = H⁰(𝒴_∞, 𝒪)` is a perfectoid `ℚ_p^cycl`-algebra and `𝒴*_∞ = Spa(S_∞, S_∞⁺)` with `S_∞⁺ = S_∞°`, then `𝒴*_∞` is affinoid perfectoid, `𝒴*_∞ ~ lim_{m′} 𝒴*_{m′}`, and `S_∞⁺` is the p-adic completion of `colim_{m′} S_{m′}⁺`.

`g ≥ 2` (boundary of codimension `≥ 2`); `0 ≤ ε < 1/2`.

Apply AutomorphicBundles §B3.HT.3’s boundary-extension and density contracts to these finite normalizations. The comparison preserves the open finite étale covers, their finite-level integral rings and normalized-trace retractions; it identifies the completed ring and boundary ideal in (iii). Normality, no component over the boundary and the stated codimension bound are retained.

([Scholze], §3.2.5, introduction and Lemma 3.2.24 with proof, pp. 995–997.)

Applied to `𝒴*_m = 𝒳*_{Γ₀(pᵐ)}(ε)_a` itself it recovers that `H⁰` of the open good-reduction part computes the affinoid ring of the compactified anticanonical piece.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.16; §1.13; §1.14; §1.7; §1.5; AdicSpacesPartIII §R2.10; PerfectoidSpaces §P7.4.

### 1.18 The `p^m`-torsion of the anticanonical abelian variety at `Γ₀(p^∞)`-level and its tilt

Assume `g ≥ 2` and `0 ≤ ε < 1/2`. Over `𝒳_{Γ₀(pᵐ)}(ε)_a, 𝒜_{Γ₀(pᵐ)}(ε)_a = 𝒜(p⁻ᵐε)` maps by an isogeny with kernel the canonical subgroup `C_m` to the tautological abelian variety `𝒜^t_{Γ₀(pᵐ)}(ε)_a`, and `D_m := 𝒜_{Γ₀(pᵐ)}(ε)_a[pᵐ]/C_m ⊆ 𝒜^t_{Γ₀(pᵐ)}(ε)_a` is finite étale over `𝒳_{Γ₀(pᵐ)}(ε)_a`; let `D_{m,Γ₀(p^∞)}` be its pullback to `𝒳_{Γ₀(p^∞)}(ε)_a`, a perfectoid space. Then (Lemma 3.2.25) `𝒜_{Γ₀(p^∞)}(ε)_a[pᵐ] → D_{m,Γ₀(p^∞)}` is an isomorphism of perfectoid spaces, and (Lemma 3.2.26) the tilt of `D_{m,Γ₀(p^∞)}` is canonically the perfection of `D′_m = 𝒜′(ε)[pᵐ]/C′_m → 𝒳′(ε)`, with `C′_m` the canonical subgroup (kernel of Frobenius) on the characteristic-p side.

`g ≥ 2` is the standing assumption of §3.2.5; `0 ≤ ε < 1/2`.

Use the torsion-cover identification underlying AutomorphicBundles §§B3.HT.2–B3.HT.3’s anticanonical and normal-cover comparison. It uses the same universal abelian family and the quotient by the shared `C_m`. Hence its tilted finite étale algebra is the displayed perfection of `D′_m`, with the same level maps; it does not supply a full torsion basis.

([Scholze], §3.2.5, the paragraphs before Lemma 3.2.25 and Lemmas 3.2.25–3.2.26, pp. 997–998.)

For `g = 1` and `ε = 0, D_m` is the étale quotient `E[pᵐ]/C_m` on the ordinary locus. The inverse Frobenius tower removes the connected canonical torsion and identifies the surviving torsion with this quotient; it does not choose a basis of `C_m` or trivialise all of `E[pᵐ]`.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.14; §1.11; HodgeTateAndCanonicalSubgroups §§3.4, 3.6, 3.7, 3.8, 3.3; PerfectoidSpaces §P7.12.

### 1.19 The characteristic-p Hasse-locus triples are good

Assume `g ≥ 2, 0 ≤ ε < 1/2` and `m ≥ 1`. Let `X^{ord*} ⊆ X* ⊗ 𝔽_p` be the affine locus where `Ha` is invertible, `X^{ord}` its intersection with `X ⊗ 𝔽_p, D_m^{ord} → X^{ord}` the quotient of the `pᵐ`-torsion by its canonical subgroup, `X^{ord}_{Γ₁(pᵐ)} → X^{ord}` the finite scheme of isomorphisms `D_m^{ord} ≅ (ℤ/pᵐ)^g` and `X^{ord*}_{Γ₁(pᵐ)} = Spec H⁰(X^{ord}_{Γ₁(pᵐ)}, 𝒪)` (normal, finite over `X^{ord*}`). Let `𝒳′*_{Γ₁(pᵐ)}(ε)` be the locus `|Ha| ≥ |t|^ε` in the adic space of `X^{ord*}_{Γ₁(pᵐ)} ⊗` the completion of `⋃_r 𝔽_p((t^{1/((p−1)p^r)}))`, with boundary `𝒵′*` and good-reduction part `𝒳′`. Then the triples `(𝒳′*(ε)^{perf}, 𝒵′*(ε)^{perf}, 𝒳′(ε)^{perf})` and `(𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}, 𝒵′*_{Γ₁(pᵐ)}(ε)^{perf}, 𝒳′_{Γ₁(pᵐ)}(ε)^{perf})` are good in the sense of Scholze Definition `2.3.8: H⁰(𝒳′*^{perf}, 𝒪⁺/t)^a ≅ H⁰(𝒳′*^{perf} ∖ 𝒵′*^{perf}, 𝒪⁺/t)^a ↪ H⁰(𝒳′^{perf}, 𝒪⁺/t)^a`.

`g ≥ 2; 0 ≤ ε < 1/2; m ≥ 1`.

Resolution of singularities of `X* ⊗ 𝔽_p`, required by the Hebbarkeitssatz in characteristic `p` (Scholze Lemma 2.3.9), is supplied by a smooth toroidal compactification (Faltings–Chai).

Use AutomorphicBundles §B3.HT.3’s good-triple theorem with the same normal characteristic-p charts, toroidal resolution, Hasse section and boundary ideal, and then its normal finite-cover stability. For `ε>0` this uses the scalar `t^ε`. At `ε=0` use the ordinary localization and a nonzero topologically nilpotent scalar `t`; `t⁰` is not such a scalar.

([Scholze], §3.2.5, proof of Lemma 3.2.27, p. 999.)

([Scholze], §2.3.3, after Definition 2.3.8, p. 967.)

The statement says that bounded functions on the perfected `ε`-Hasse locus extend uniquely across the boundary: the characteristic-p Hebbarkeitssatz in the Siegel instance.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.1; §1.5; §1.6; §1.4; ShimuraCompactifications §§C5.16, C5.3, C5.5; PerfectoidSpaces §P7.5–P7.6.

### 1.20 Tilting the `Γ₁(pᵐ)`-cover of the anticanonical tower

Assume `g ≥ 2, 0 ≤ ε < 1/2, m ≥ 1`, and apply §1.17 to `𝒴*_m = 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a`. Then (Lemma 3.2.29) the tilt of `𝒴_∞` is `𝒳′_{Γ₁(pᵐ)}(ε)^{perf}`; (Lemma 3.2.30) the tilt of `𝒴*_∞ ∖ ∂` is `𝒳′*_{Γ₁(pᵐ)}(ε)^{perf} ∖ ∂` (the published proof writes `𝒴*_m ∖ ∂` for `𝒴*_∞ ∖ ∂`); (Lemma 3.2.31, used here in its bounded form) for perfectoid spaces `𝒳, 𝒴₁, 𝒴₂` over a perfectoid field, finite étale `𝒴_i → 𝒳, f: 𝒴₁ → 𝒴₂` over `𝒳` and an open `𝒰 ⊆ 𝒳` with `H⁰(𝒳, 𝒪⁺) ↪ H⁰(𝒰, 𝒪⁺)` (goodness), if `f` is an isomorphism over `𝒰` then `f` is an isomorphism (the printed hypothesis on `𝒪` is not available on the non-quasicompact complement of the boundary; only idempotents are needed); (Lemma 3.2.32) `S_∞ = H⁰(𝒴_∞, 𝒪)` is perfectoid and the tilt of `𝒴*_∞ = Spa(S_∞, S_∞⁺)` is `𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}`.

`g ≥ 2; 0 ≤ ε < 1/2; m ≥ 1`.

Use AutomorphicBundles §B3.HT.3’s tilted normal-cover and density comparison on the same `Γ₁(pᵐ)` finite-level cover. Under §1.18 the level trivializations give the same tilted finite étale algebra; goodness detects the idempotents and extends bounded sections. Consequently the untilt computes the actual completed level ring `S_∞`, with its boundary ideal, rather than a ring determined only on geometric points.

([Scholze], §3.2.5, Lemmas 3.2.29–3.2.32 with proofs, pp. 999–1000.)

For `g = 1` the `Γ₁`-cover of the ordinary locus is the Igusa tower, whose tilt is the perfection of the characteristic-p Igusa tower.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.17; §1.18; §1.19; PerfectoidSpaces §§P3.10, P3.9.

### 1.21 The anticanonical tower at `Γ₁(pᵐ) ∩ Γ₀(p^∞)` and `Γ₁(p^∞)` levels

Let `0 ≤ ε < 1/2`. For every `m ≥ 1` there is a unique perfectoid space `𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a` over `ℚ_p^cycl` with `𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a ~ lim_{m′} 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a`; it and all `𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a` for `m′` large are affinoid, `colim_{m′} H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a, 𝒪)` has dense image, and with `𝒵` the boundary and `𝒳` the preimage of `𝒳_{Γ₀(p)}(ε)_a` the triple `(𝒳*, 𝒵, 𝒳)` at this level is good (Proposition 3.2.33). The same holds at `Γ₁(p^∞)`-level: `𝒳*_{Γ₁(p^∞)}(ε)_a ~ lim_m 𝒳*_{Γ₁(pᵐ)}(ε)_a` (Proposition 3.2.34). For `g = 1` the same statements follow from the `Γ₀(p^∞)`-level by finite étale base change, since `𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a` is finite étale also over the cusps.

`0 ≤ ε < 1/2`; the `g ≥ 2` argument uses Hartogs; for `g = 1` the source gives only a sketch, completed with finite-level inputs only: Heuer's Lemma 2.23 (on the Tate-curve charts of ShimuraVarieties §8.20) shows that `𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a` is a finite étale `(ℤ/pᵐ)^×`-torsor also over the cusps, split over each anticanonical cusp disc (Heuer's `Γ₀` and `Γ₁` spaces are the base changes of Layer 1's, the determinant condition of Layer 0 §0.1 being absorbed by the fixed `ζ_{pᵐ}`); no infinite-level result of Heuer is used.

Identify these charts with the normal finite-cover limits in AutomorphicBundles §§B3.HT.2–B3.HT.3, on the same mixed `Γ₁`/`Γ₀` finite-level moduli system. Their good triples and integral density are the supplied ones. The full-level carrier is supplied by §B3.HT.4; for genus one retain Heuer’s finite étale cusp comparison, with the fixed pairing component selected as above.

([Scholze], §3.2.5, Propositions 3.2.33–3.2.34 with proofs, pp. 1000–1001.)

([Heuer], §2.6, Lemma 2.23 with proof, pp. 14–15.)

For `g = 1` and `ε = 0` this is the perfectoid ordinary Igusa tower over the ordinary locus with its cusps.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.20; §1.17; §1.19; §1.14; §1.5; §1.6; §0.1; PerfectoidSpaces §§P7.14, P7.12, P3.10; ShimuraVarieties §8.20.

### 1.22 Full `Γ(p^∞)`-level: the anticanonical neighbourhood is affinoid perfectoid with a good boundary triple

Let `0 ≤ ε < 1/2`. (Lemma 3.2.35) For `m ≥ 1, 𝒳*_{Γ(pᵐ)}(ε)_a → 𝒳*_{Γ₁(pᵐ)}(ε)_a` is finite étale. (Theorem 3.2.36) There is a unique perfectoid space `𝒳*_{Γ(p^∞)}(ε)_a` over `ℚ_p^cycl` with `𝒳*_{Γ(p^∞)}(ε)_a ~ lim_m 𝒳*_{Γ(pᵐ)}(ε)_a`; it and all `𝒳*_{Γ(pᵐ)}(ε)_a` for `m` large are affinoid, `colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪)` has dense image and, more precisely, `H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪⁺)` is the p-adic completion of `colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪⁺)` (the form used by §1.28 (i); the source states only density), and with `𝒵_{Γ(p^∞)}(ε)_a` the boundary and `𝒳_{Γ(p^∞)}(ε)_a` the preimage of `𝒳_{Γ₀(p)}(ε)_a` the triple `(𝒳*_{Γ(p^∞)}(ε)_a, 𝒵_{Γ(p^∞)}(ε)_a, 𝒳_{Γ(p^∞)}(ε)_a)` is good: bounded functions extend uniquely from the complement of the boundary.

`0 ≤ ε < 1/2`.

Use AutomorphicBundles §§B3.HT.2–B3.HT.3’s chart, boundary-extension and normalized-trace density interfaces for these actual finite-level rings. The represented full-level anticanonical chart is the one in §B3.HT.4. The comparison identifies its plus ring with the displayed p-adic completion and identifies the boundary ideals and good triples. Retain the full-to-`Γ₁` boundary-inertia input for general `ε`; in genus one the Tate-chart comparison selects the labels `ad≡1` for the fixed-pairing piece.

([Scholze], §3.2.5, after Theorem 3.2.36, p. 1002.)

([Heuer], §2.7, Lemma 2.25 and Proposition 2.26, pp. 15–16.)

A strict and explicit neighbourhood of the ordinary locus in the minimal compactification becomes affinoid perfectoid at infinite level and satisfies the Hebbarkeitssatz with respect to the boundary.

*Needs:* AutomorphicBundles §§B3.HT.2–B3.HT.3; §1.21; §1.5; §1.6; ShimuraCompactifications C5; PerfectoidSpaces §§P3.10, P3.13, P7.12, P5.9; ShimuraVarieties §8.20.

### 1.23 The continuous Hodge–Tate map on the open infinite-level Siegel tower

Put `|𝒳*_{Γ(p^∞)}| := lim_m |𝒳*_{Γ(pᵐ)}|, |𝒵_{Γ(p^∞)}| := lim_m |𝒵_{Γ(pᵐ)}|`, with their continuous `GSp_2g(ℚ_p)`-actions; for a complete nonarchimedean `K` over `ℚ_p^cycl` with open bounded valuation subring `K⁺, 𝒳*_{Γ(p^∞)}(K, K⁺) := lim_m 𝒳*_{Γ(pᵐ)}(K, K⁺)`, and `|𝒳*_{Γ(p^∞)}|` is the (non-filtered) colimit of these sets, each point coming from a unique minimal `(K, K⁺)` (Remark 3.3.3). Let Fl be the flag variety over `ℚ_p` of totally isotropic g-dimensional subspaces of (`ℚ_p^{2g}`, standard symplectic form), the compact dual of the Siegel datum (ShimuraData §3.8–3.9), with its Plücker charts `Fl_J` (HodgeTateAndCanonicalSubgroups T2). There is a `GSp_2g(ℚ_p)`-equivariant continuous map `|π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl|` sending a point given by a principally polarized abelian variety `A/K` with a symplectic similitude `α: T_pA ≅ ℤ_p^{2g}` (compatible with the fixed `ζ_{p^∞}`) to the Hodge–Tate filtration `Lie A ⊗ K(1) ⊆ T_pA ⊗ K ≅ K^{2g}`. Equivariance law: `GSp_2g(ℚ_p)` acts on the tower on the right by `x·γ: α ↦ γ⁻¹ ∘ α` (on `V_pA ≅ ℚ_p^{2g}`; this is Layer 0's right translation `T_γ`, transported by §1.2), and `|π_HT|(x·γ) = γ⁻¹·|π_HT|(x)` for the standard left action of `GSp_2g(ℚ_p)` on `Fl ⊆ Gr(g, ℚ_p^{2g})`; equivalently `|π_HT|` is equivariant for the right action `W·γ := γ⁻¹W` on Fl.

Points outside the boundary have good reduction after a finite extension only on the good-reduction locus; on `|𝒳*| ∖ |𝒵|` the abelian variety may have bad reduction, and the Hodge–Tate filtration is that of the abelian variety over `K` (HodgeTateAndCanonicalSubgroups §§0.18, 2.5–2.6: Scholze Proposition 3.3.1 and the K-rationality of the filtration).

Use AutomorphicBundles §B3.HT.4’s continuous Hodge–Tate map and identify its finite-level point system with the one here. On the open tower it agrees with HodgeTateAndCanonicalSubgroups §2.12’s relative filtration on perfectoid tests. Transport the right action through §1.2, so the same map has the displayed inverse action on flags and the cyclotomic semilinearity.

([Scholze], §3.3.1, Remark 3.3.3 and Lemma 3.3.4 with proof, pp. 1004–1006.)

([Scholze], §3.3.1, Lemma 3.3.4, p. 1004.)

The API is `SiegelTorsion.htMapTop`, .`htMapTop_apply, .htMapTop_continuous, .htMapTop_equivariant` and .`points_infiniteLevel`: the continuous filtration map, its point formula, continuity, right equivariance `W·γ=γ⁻¹W`, and evaluation as the limit of finite-level points with unique minimal field representatives.

**Checks.**

- `htMapTop_ordinary_rational`: For `g = 1` and an ordinary `E` over `𝒪_C, |π_HT|(E, α) ∈ ℙ¹(ℚ_p)`, equal to the line `α(T_p(E[p^∞]^{mult}) ⊗ C)`.
- `htMapTop_supersingular_drinfeld`: For `g = 1` and `E` supersingular, `|π_HT|(E, α) ∉ ℙ¹(ℚ_p)`.
- `htMapTop_tate_curve`: For `g = 1` and the Tate curve `E = T(q)` over `K` with `0 < |q| < 1` (a point of `|𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}|` outside the good-reduction locus) and `α(T_pμ_{p^∞}) = ℤ_p e_1, |π_HT|(E, α) = [1 : 0]`: the Hodge–Tate filtration of `E` is `T_pμ_{p^∞} ⊗ K`, so a definition through good reduction or Néron special fibres misses or misplaces this point.
- `htMapTop_isotropic`: The image lies in the Lagrangian Grassmannian: the Hodge–Tate filtration is totally isotropic for the Weil pairing, so `|π_HT|` lands in `Fl ⊆ Gr(g, 2g)` (Mathlib `Module.Grassmannian` for the ambient Grassmannian).

For `g = 1` and an ordinary elliptic curve `E` with `α` carrying `T_p(E[p^∞]^{mult})` to the line spanned by `e_1, |π_HT|(E, α)` is the `ℚ_p`-rational point [1 : 0] of `ℙ¹`.

For `g = 1` and `E` with supersingular reduction, `|π_HT|(E, α)` is a point of Drinfeld's `Ω = ℙ¹ ∖ ℙ¹(ℚ_p)`.

*Needs:* AutomorphicBundles §B3.HT.4; §1.22; §1.2; `mathlib:Module.Grassmannian`; HodgeTateAndCanonicalSubgroups §§2.3, 2.2, 0.14, 0.15, 0.16, 0.18, 0.5, 2.5, 2.6, 2.7; ShimuraData §3.8–3.9.

### 1.24 The closure of the ordinary locus is the preimage of the `ℚ_p`-rational flags

In `|𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}|`: the preimage of `Fl(ℚ_p)` under `|π_HT|` is the closure of `|𝒳*_{Γ(p^∞)}(0)| ∖ |𝒵_{Γ(p^∞)}(0)|` (Lemma 3.3.6), the closure of a retrocompact open, i.e. its set of specialisations; and the preimage of `Fl_{g+1,…,2g}(ℚ_p)` is the closure of `|𝒳*_{Γ(p^∞)}(0)_a| ∖ |𝒵_{Γ(p^∞)}(0)_a|` (Lemma 3.3.14). The compactified versions (Lemmas 3.3.19–3.3.20) need `π_HT` extended over the boundary and are part of §1.28. Here `Fl_{g+1,…,2g}(ℚ_p)` parametrises the totally isotropic direct summands `M ⊆ ℤ_p^{2g}` with `M ⊕ (ℤ_p^g ⊕ 0) = ℤ_p^{2g}`.

The ordinary/rational correspondence is for the abelian part: at a point of bad reduction the argument applies to the abelian part `B` of the Raynaud extension, with `g` replaced by `g′ = dim B`.

Use AutomorphicBundles §B3.HT.4’s rational-flag/ordinary-locus identification for this same point system and Hasse region. The Raynaud abelian part and toric contribution are retained at bad reduction. The anticanonical component is selected by the stated transversality condition, using the same good triple from §1.22.

([Scholze], §3.3.2, Lemma 3.3.14 with proof, pp. 1010–1011.)

([Scholze], §3.3.1, Lemma 3.3.6 with proof and Remark 3.3.7, pp. 1006–1007.)

For `g = 1: π_HT^{-1}(ℙ¹(ℚ_p))` is the closure of the ordinary locus and `π_HT^{-1}(Ω)` is the supersingular locus.

*Needs:* AutomorphicBundles §B3.HT.4; §1.23; §1.22; §0.1; HodgeTateAndCanonicalSubgroups §§0.18, 0.16.

### 1.25 Finitely many `GSp_2g(ℚ_p)`-translates of a Hasse neighbourhood cover the tower

(Lemma 3.3.8) For `0 < ε < 1` there is an open `U ⊆ Fl` containing `Fl(ℚ_p)` with `|π_HT|⁻¹(U) ⊆ |𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|`. (Lemma 3.3.9) Every open `U ⊆ Fl` containing a `ℚ_p`-rational point satisfies `GSp_2g(ℚ_p)·U = Fl`. (Lemma 3.3.10) For `0 < ε < 1` there are `γ_1, …, γ_k ∈ GSp_2g(ℚ_p)` with `|𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| = ⋃_i γ_i·(|𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|)`. (Lemma 3.3.11) With the same `γ_i, |𝒳*_{Γ(p^∞)}| = ⋃_i γ_i·|𝒳*_{Γ(p^∞)}(ε)|`.

`0 < ε < 1`.

Use AutomorphicBundles §B3.HT.4’s finite translated-chart covering of this same inverse limit, transported through §1.2’s action comparison. Its boundary-inclusive covering and flag contraction supply the displayed statements. The compactness argument applies to the finite compactified levels and the stated good-reduction domains; it requires no quasi-compactness of the entire boundary complement.

([Scholze], §3.3.1, proof of Lemma 3.3.8, p. 1008.)

([Scholze], §3.3.1, Lemmas 3.3.8–3.3.11 with proofs, pp. 1008–1009.)

For `g = 1`, finitely many translates of the `ε`-ordinary locus at infinite level cover the whole perfectoid modular curve, the supersingular disc being moved into the ordinary neighbourhood by elements of `GL_2(ℚ_p)`.

*Needs:* AutomorphicBundles §B3.HT.4; §1.24; §1.23; HodgeTateAndCanonicalSubgroups §§2.2, 0.14, 0.15, 0.16, 0.18, 0.5, 2.5, 2.6, 2.7.

### 1.26 The minimally compactified Siegel tower at `Γ(p^∞)`-level is perfectoid

There is a perfectoid space `𝒳*_{Γ(p^∞)}` over `ℚ_p^cycl` with `𝒳*_{Γ(p^∞)} ~ lim_m 𝒳*_{Γ(pᵐ)}`, unique up to unique isomorphism; for every `0 < ε < 1/2, 𝒳*_{Γ(p^∞)}(ε) = GSp_2g(ℤ_p)·𝒳*_{Γ(p^∞)}(ε)_a` and `𝒳*_{Γ(p^∞)}` is covered by finitely many `GSp_2g(ℚ_p)`-translates of the affinoid perfectoid `𝒳*_{Γ(p^∞)}(ε)_a`. Its boundary `𝒵_{Γ(p^∞)}` carries the induced perfectoid structure. Over `C` (§1.2): `𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C = 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C)` is a perfectoid representative (Layer 0 §0.2) of the Siegel tower `(S*_{K^pK′_p})_{K′_p ⊆ GSp_2g(ℚ_p)}` of Layer 0 over `C`, all similitude components included (`Γ(pᵐ)` cofinal by Layer 0 §0.1), and `𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C` is only its closed fixed-similitude fibre, generally not open.

Identify this space with AutomorphicBundles §B3.HT.4’s minimal Siegel representative by the identity on the finite-level moduli tower. Its anticanonical chart cocycle, completed rings and boundary ideals are those of §§1.13–1.22. The comparison over `C` is §1.2(ii), with principal-level cofinality, and restores the whole profinite family of similitude fibres.

([Scholze], §3.3.2, Corollary 3.3.12 with proof, p. 1009.)

([Scholze], §3.3.1, after Definition 3.3.5, p. 1006.)

For `g = 1` and `K^p = K(N)^p` this is the part of the perfectoid modular curve of tame level `K(N)^p` on which the Weil pairing of `α` is the fixed `ζ_{p^∞}: π₀` of its base change to `C` is `(ℤ/N)^×`, while the Layer 0 tower has `π₀ = ℤ_p^× × (ℤ/N)^×` (§1.2).

*Needs:* AutomorphicBundles §B3.HT.4; §1.25; §1.22; §1.12; §1.13; §1.2; §0.2; §0.1; HodgeTateAndCanonicalSubgroups §§3.4, 3.6, 3.7, 3.8, 3.3; PerfectoidSpaces §§P7.4, P7.12, P7.9, P7.10.

### 1.27 The Siegel Hodge–Tate period map as a map of adic spaces, extended over the boundary

There is a unique map of adic spaces `π_HT: 𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)} → Fl` over `ℚ_p` realising the Hodge–Tate filtration functorially on perfectoid test spaces (and hence inducing `|π_HT|`) (Corollary 3.3.13). For every open `U ⊆ Fl` containing `Fl(ℚ_p)` there is `ε > 0` with `𝒳*_{Γ(p^∞)}(ε) ∖ 𝒵_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U)` (Lemma 3.3.15), and there is `0 < ε < 1/2` with `𝒳*_{Γ(p^∞)}(ε)_a ∖ 𝒵_{Γ(p^∞)}(ε)_a ⊆ π_HT⁻¹(Fl_{g+1,…,2g})` (Lemma 3.3.16). `π_HT` extends uniquely to a `GSp_2g(ℚ_p)`-equivariant map of adic spaces `π_HT: 𝒳*_{Γ(p^∞)} → Fl` (Corollary 3.3.17). The action convention: `GSp_2g(ℚ_p)` acts on `𝒳*_{Γ(p^∞)}` on the right by `x·γ: α ↦ γ⁻¹ ∘ α` (Layer 0's right translations, transported by §1.2; semilinear over `ℚ_p^cycl`), and equivariance means `π_HT(x·γ) = γ⁻¹·π_HT(x)` for the standard left action of `GSp_2g(ℚ_p)` on Fl, equivalently `π_HT(x·γ) = π_HT(x)·γ` for the right action `W·γ := γ⁻¹W`; the conventions of Layer 3 (`FL = P_μ\G, BP`'s `x ↦ x⁻¹`) are compared there.

The extension over the boundary rests on the goodness of the boundary triple (§1.22) and on boundedness of the Plücker coordinates on the anticanonical neighbourhood.

Use AutomorphicBundles §B3.HT.4’s analytic period map and its boundary extension, under §1.26’s representing identification. Equality is equality of the relative filtration maps on perfectoid tests. The supplied extension uses §B3.HT.3’s bounded Plücker coordinates and good triples, and preserves the same flag chart and semilinear right-action convention.

([Scholze], §3.3.2, Corollary 3.3.13, Lemmas 3.3.14–3.3.16 and Corollary 3.3.17 with proofs, pp. 1009–1012.) The boundedness-plus-goodness step extending `π_HT`.

([Scholze], §3.3.2, proof of Corollary 3.3.13, p. 1009.)

The API is `SiegelTorsion.htMap`, .`htMap_top, .htMap_unique, .htMap_equivariant, .htMap_anticanonical` and .`htMap_neighbourhood`: the analytic extension, agreement with the open continuous map, uniqueness from the interior, right equivariance, the anticanonical-chart image, and the neighbourhood containment for each open `U⊇Fl(ℚ_p)`.

**Checks.**

- `htMap_g1_cusps_rational`: For `g = 1`, the image of every cusp of `𝒳*_{Γ(p^∞)}` is a point of `ℙ¹(ℚ_p)`.
- `htMap_anticanonical_chart`: For `g = 1` and small `ε, π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ {|x| ≤ 1}`-type chart `Fl_{2}` of `ℙ¹` (the chart `J = {2}`).
- `htMap_not_finite_level`: `π_HT` does not factor through any finite level `𝒳*_{Γ(pᵐ)}`: the fibres of `𝒳*_{Γ(p^∞)} → 𝒳*_{Γ(pᵐ)}` (a map over `ℚ_p^cycl`) are orbits of `Γ(pᵐ) ∩ Sp_2g(ℤ_p)` (elements with `c ≠ 1` move the structure map to `Spa ℚ_p^cycl`), on which `π_HT` is the nonconstant action `W ↦ γ⁻¹W` on flags.
- `htMap_equivariant_center`: Scalars `z ∈ ℚ_p^× ⊆ GSp_2g(ℚ_p)` act trivially on Fl, so `π_HT` is invariant under the central action.

For `g = 1, π_HT: 𝒳*_{Γ(p^∞)} → ℙ¹` sends cusps to `ℙ¹(ℚ_p)` and the anticanonical neighbourhood into the affinoid where the coordinate `x` is bounded `(Fl_{2})`.

*Needs:* AutomorphicBundles §B3.HT.4; §1.23; §1.24; §1.25; §1.26; §1.22; §1.2; HodgeTateAndCanonicalSubgroups §§2.5, 2.6, 2.7.

### 1.28 Scholze's theorem for Siegel varieties: affinoid perfectoid flag charts and strongly Zariski closed boundary

For every tame level `K^p ⊆ GSp_2g(𝔸_f^p)` contained in `{γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N}` for some `N ≥ 3` prime to `p`, there is a perfectoid space `𝒳*_{Γ(p^∞),K^p}` over `ℚ_p^cycl`, unique up to unique isomorphism, with `𝒳*_{Γ(p^∞),K^p} ~ lim_m 𝒳*_{Γ(pᵐ),K^p}, a GSp_2g(ℚ_p)`-action which does not preserve the structure map to `Spa(ℚ_p^cycl): γ` acts on `ℚ_p^cycl` through the unit part `u(γ) = c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^× ≅ Gal(ℚ_p^cycl/ℚ_p)` of its similitude factor, i.e. the Weil-pairing root of `x·γ` is the `u(γ)-th` power of that of `x`, so exactly the `γ` with `c(γ) ∈ p^ℤ` act `ℚ_p^cycl`-linearly (§1.2 (iii), which also identifies `𝒳*_{Γ(p^∞),K^p} ×_{Spa ℚ_p} Spa C` with a perfectoid representative of the Layer 0 Siegel tower over `C`, compatibly with the actions), and a `GSp_2g(ℚ_p)`-equivariant map of adic spaces `π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl` over `ℚ_p`. (i) For every `J ⊆ {1, …, 2g}` containing exactly one of `i` and `g + i` for each `i` (so that the coordinate g-plane indexed by `J` is Lagrangian; these `2^g` sets give affinoids `Fl_J` covering Fl), the preimage `𝒱_J = π_HT⁻¹(Fl_J) = Spa(R_{J,∞}, R_{J,∞}⁺)` is affinoid perfectoid, is the preimage of an affinoid `𝒱_{J,m} = Spa(R_{J,m}, R_{J,m}⁺) ⊆ 𝒳*_{Γ(pᵐ),K^p}` for all large `m`, and `R_{J,∞}⁺` is the p-adic completion of `colim_m R_{J,m}⁺`. (ii) `𝒵_{Γ(p^∞),K^p} ∩ 𝒱_J ⊆ 𝒱_J` is strongly Zariski closed. (iii) `π_HT⁻¹(Fl(ℚ_p))` is the closure of `𝒳*_{Γ(p^∞),K^p}(0)` and `π_HT⁻¹(Fl_{g+1,…,2g}(ℚ_p))` is the closure of `𝒳*_{Γ(p^∞),K^p}(0)_a` (Lemmas 3.3.19–3.3.20, the compactified versions of §1.24). The published statement of (i) quantifies over all `J` of cardinality `g`; for non-Lagrangian `J, Fl_J` is not of the required form and the proof does not apply.

The `J` in (i) are the `2^g` Lagrangian coordinate subsets.

Use AutomorphicBundles §B3.HT.4’s period-tower and completed-chart contracts under the finite-level identity of §1.26. For the specified Lagrangian `J`, identify the actual affinoids `𝒱_{J,m}`, their completed integral rings `R_{J,∞}⁺` and boundary ideals. The same period map identifies the ordinary and anticanonical closures in (iii); group, Galois and Hecke compatibility are transported through §1.2, retaining cyclotomic semilinearity.

([Scholze], §3.3.3, proof of Theorem `3.3.18(i)`, p. 1014.)

([Scholze], §3.3.3, Lemmas 3.3.19–3.3.20 with proof, p. 1013.)

([Scholze], §3.3.3, Theorem 3.3.18 (existence, (i), (ii)) with proof, pp. 1012–1014.)

([Scholze], §3.1, Theorem 3.1.2 and footnote 7, pp. 971–972.) The `GSp_2g(ℚ_p)`-action is semilinear over `ℚ_p^cycl`.

`g = 1`: the two charts `J = {1}, {2}` of `ℙ¹` have affinoid perfectoid preimages in the perfectoid modular curve, each coming from finite level, and the cusps are strongly Zariski closed in them.

The statement agrees with Theorem 3.1.2 of the source with the `J` restricted to Lagrangian subsets.

*Needs:* AutomorphicBundles §B3.HT.4; §1.26; §1.27; §1.15; §1.24; §1.22; §1.25; §1.2; §0.2; PerfectoidSpaces §§P7.10, P7.4, P4.12–P4.15.

### 1.29 The toroidally compactified Siegel tower with fixed cone decomposition is perfectoid

Let `K^p` be neat (contained in a level-N subgroup, `N≥3` prime to `p`). At an initial principal level `K_p=Γ(p^{n₀})`, choose a complete smooth projective admissible cone decomposition `Σ` with its polarization and trivial effective cone stabilizers. At deeper principal levels induce `Σ` under the cusp-lattice maps, keeping the real cones fixed and inserting no subdivisions. Use the same induced-fan system for the toroidal tower of Layer 0.general §0.general.1. It has a perfectoid representative `S^tor_{K^p,Σ} ~ lim_n S^tor_{K^pΓ(pⁿ),Σ}`, canonically representing the limit over all smaller compact open levels by principal-level cofinality. Its boundary complement is the open perfectoid Siegel tower. The representative is the generic fibre of the limit of the modified formal toroidal models, as in AutomorphicBundles §B3.HT.5; no comparison with the generic fibre of the unmodified formal limit is asserted.

The induced fans use the actual cusp lattices. Their p-power rescalings preserve smoothness and projectivity, and their level transitions are finite flat. A common fan refinement is chosen at the initial level and then induced through a separate tower; the maps between such towers are proper and need not be finite. These are the fan and transition hypotheses of AutomorphicBundles §B3.HT.5. Pilloni–Stroh’s construction is over `ℂ_p`; scalar extension gives the chosen `C`.

Tame level: Pilloni–Stroh's Appendix A is written as if the tame level were `K^p = GSp_2g(∏_{q≠p} ℤ_q)` (to simplify the presentation); for the neat `K^p ⊆ K(N)^p` used here the same local argument is applied to the boundary charts at level `K^p` (ShimuraCompactifications C3, C5), an extension the source leaves to the reader.

Use AutomorphicBundles §B3.HT.5’s modified toroidal charts and represented tilde-limit, with identity on these finite-level toroidal moduli spaces. This identifies the completed chart rings, power-bounded subrings, boundary ideals and gluing maps, including both the lower-genus abelian-base tower and the root-monoid algebra. The map to the minimal tower and its period map are the supplied maps, under §§1.26–1.28; the identification with Layer 0’s diamond is PerfectoidSpaces §P7.11.

([PS], Introduction, Théorème 0.4, PDF p. 2.)

([PS], Appendice A, Corollaire A.19, PDF p. 30.)

([PS], Appendice A, opening paragraph, PDF p. 21.)

([Lan], §6, pp. 18–20, including Proposition 6.1.) Induced-fan level transitions and the toroidal perfectoid limit.

([BPS], §3.3, p. 34.)

For `g = 1` the toroidal and minimal compactifications coincide and the statement is the perfectoid compactified modular curve.

Boxer–Pilloni 2026, §3.3, use this space as `S^tor_{K^p,Σ}` with `S_{K^p}` the open complement of its boundary.

**Checks.**

- At a rank-one cusp the compared completed rings contain every `q^{1/pⁿ}`, with the same boundary ideal; a ring containing only `q` fails the Frobenius comparison.
- At a positive-dimensional boundary stratum both the abelian-base tower and the root-monoid algebra agree with the supplied chart. Perfecting only the torus omits the abelian directions.
- Subdividing the quadrant at `(1,1)` gives a blow-up with exceptional fibre `ℙ¹`. It is a proper refinement map, not a finite level transition in this induced-fan tower.

*Needs:* AutomorphicBundles §B3.HT.5; §1.28; §0.general.1; §0.2; ShimuraCompactifications §§C3.1, C3.2, C5.3, C5.19–C5.20, C5.16; PerfectoidSpaces §§P7.11, P7.9.

### 1.30 The open perfectoid Siegel tower, its right action and its finite-level quotients

Let `𝒳_{Γ(p^∞),K^p} := 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}`, the open perfectoid Siegel tower over `ℚ_p^cycl` with fixed similitude system (the complement of the boundary, not the good-reduction locus `𝒳_{K_p}` of §1.1), with the right action of `GSp_2g(ℚ_p)` of §1.28, semilinear over `ℚ_p^cycl` through `u(γ) = c(γ)p^{−v_p(c(γ))}`. For a compact open `K ⊆ GSp_2g(ℤ_p)` with `c(K) = U_m` containing some `Γ(pⁿ)` (in particular the strict Iwahori level `K_{Iw⁺} := {γ ∈ GSp_2g(ℤ_p) : γ mod p lies in the diagonal torus T(𝔽_p) and c(γ) ≡ 1 mod p}`, the inverse image of the full diagonal torus modulo `p` with similitude 1), let `𝒳^{an}_{K,K^p} := 𝒳*_K ∖ 𝒵_K` (the open Siegel variety at level `KK^p` over `ℚ_p^cycl` with fixed Weil-pairing root `ζ_{pᵐ}`, §1.1) and `K¹ := K ∩ ker c`. An element `k ∈ K` with `c(k) ≠ 1` does not act `ℚ_p^cycl`-linearly (Scholze, footnote 7), so the projection is not a K-torsor over `ℚ_p^cycl`: for `n ≥ m` with `Γ(pⁿ) ⊆ K` the finite-level maps `𝒳^{an}_{Γ(pⁿ),K^p} → 𝒳^{an}_{K,K^p}` are finite étale Galois with group `(K ∩ c⁻¹(1 + pⁿℤ_p))/Γ(pⁿ)`, and `𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p}` is a pro-étale `K¹`-torsor; `𝒳^{an}_{K,K^p}` is the quotient `𝒳_{Γ(p^∞),K^p}/K¹` in the sense that its diamond is the v-sheaf quotient of the diamond of the tower by `K¹`. After base change along `Spa C → Spa ℚ_p` it becomes a K-torsor: `((𝒳_{Γ(p^∞),K^p}) ×_{Spa ℚ_p} Spa C)^◇ ≅ S^◇_{K^p,∞} → S^◇_{K^pK}` is a pro-étale K-torsor (Layer 0 §0.3 (iii); its kernel `Z(ℚ) ∩ K^pK` is trivial because `N ≥ 3`; §1.2), and its restriction to the closed fixed-similitude fibre, generally not open, `𝒳_{Γ(p^∞),K^p} ⊗̂_{ℚ_p^cycl} C` is the `K¹`-torsor over `𝒳^{an}_{K,K^p} ⊗_{ℚ_p^cycl} C`. The strict Iwahori quotient is defined group-theoretically through `K_{Iw⁺}`, not by choosing `g` subgroups of order `p` (those subgroups do not determine the strict Iwahori level).

`K` contains some `Γ(pⁿ)` and has `c(K) = U_m`, so that the level-K space lives over `ℚ(ζ_{pᵐ})` and is base changed to `ℚ_p^cycl` along the fixed `ζ_{pᵐ}`.

Finite levels: for `n ≥ m` with `Γ(pⁿ) ⊆ K` put `K_n := K ∩ c⁻¹(1 + pⁿℤ_p)`. Its elements fix the Weil-pairing root `ζ_{pⁿ}`, so they act `ℚ(ζ_{pⁿ})`-linearly on `X_{Γ(pⁿ)K^p}`, freely by Layer 0 §0.3 (ii) with `Z(ℚ) ∩ K^pK = {1} (N ≥ 3)`; the quotient is `X_{KK^p} ⊗_{ℚ(ζ_{pᵐ})} ℚ(ζ_{pⁿ})`, as `[K : K_n] = [ℚ(ζ_{pⁿ}) : ℚ(ζ_{pᵐ})]`. Base change along `ℚ(ζ_{pⁿ}) → ℚ_p^cycl` gives the finite étale Galois covers with group `K_n/Γ(pⁿ)`, on the open Shimura variety (not only on the good-reduction locus). Limit: `c: Γ(pⁿ) → 1 + pⁿℤ_p` is surjective `(diag(1_g, u·1_g))`, so `lim_n K_n/Γ(pⁿ) = K¹` and `𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p}` is a pro-étale `K¹`-torsor (as in HodgeTateAndCanonicalSubgroups §2.3 (v)); the diamond of `𝒳^{an}_{K,K^p}` is the quotient by `K¹` since a pro-étale torsor is a v-cover. Over `C`: §1.2 (ii)–(iii) and Layer 0 §0.3 (iii); `k ∈ K` maps the part `{w = 1}` to `{w = c(k)}`, so the stabiliser of the fixed-similitude part is `K¹`. The strict Iwahori subgroup is `K_{Iw⁺}` as defined; it contains `Γ(p)` with `K_{Iw⁺}/Γ(p) ≅ T(𝔽_p) ∩ {c = 1}`.

([Scholze], §3.1, Theorem `3.1.2(i)`, p. 971.)

([Scholze], §3.1, footnote 7, p. 971.) Elements with `c ≠ 1` act semilinearly over `ℚ_p^cycl`, so only `K¹` acts by deck transformations.

The API is `SiegelTorsion.openTower` (the boundary complement), `SiegelTorsion.strictIwahori` (diagonal symplectic reduction), .`openTower_torsor, .openTower_quotient` and .`openTower_action`. The last three retain the `K¹=K∩ker c` torsor and diamond quotient over the cyclotomic base, the K-torsor after base change over `ℚ_p` to `C`, and the right action semilinear through `u(γ)`.

**Checks.**

- `strictIwahori_quotient_g1`: For `g = 1, K_{Iw⁺}/Γ(p) ≅ 𝔽_p^×` via `diag(a, a⁻¹) ↦` a.
- `strictIwahori_not_subgroups`: For `g = 2`, prescribing two order-p subgroups (the coordinate lines of the first two basis vectors modulo `p`) defines a level containing non-diagonal unipotent elements modulo `p`, strictly larger than `K_{Iw⁺}`: the group-theoretic definition is required.
- `openTower_trivial_quotient`: For `K = Γ(pⁿ), K¹ = Γ(pⁿ) ∩ Sp_2g(ℤ_p)` and `𝒳_{Γ(p^∞)} → 𝒳_{Γ(pⁿ)}` is a pro-étale `(Γ(pⁿ) ∩ Sp_2g(ℤ_p))`-torsor, not a `Γ(pⁿ)`-torsor over `ℚ_p^cycl: diag(1_g, (1 + pⁿ)·1_g) ∈ Γ(pⁿ)` raises Weil-pairing roots to the power `1 + pⁿ` and so covers the nontrivial automorphism `σ_{1+pⁿ}` of `ℚ_p^cycl`.
- `openTower_kernel_trivial`: After base change to `C, K` acts freely on `S^◇_{K^p,∞}`: the kernel computed by §0.3 is trivial for `N ≥ 3`; hence `K¹` acts freely on `𝒳_{Γ(p^∞),K^p}`.

For `g = 1, K_{Iw⁺} = {(a b; c d) ∈ GL_2(ℤ_p) : b ≡ c ≡ 0, ad ≡ 1 mod p} = Γ₀(p) ∩ Γ⁰(p) ∩ {det ≡ 1 mod p}` (with `det ≡ 1, Γ₁(p) ∩ Γ⁰(p)` would be `Γ(p)`), `K_{Iw⁺}/Γ(p) ≅ {diag(a, a⁻¹)} ≅ 𝔽_p^×`, and `𝒳_{K_{Iw⁺}}` is the base change to `ℚ_p^cycl` of the modular curve of classical level `Γ₀(p) ∩ Γ⁰(p)` (ordered pairs of distinct subgroups of order `p`), the condition `det ≡ 1` being absorbed by the fixed `ζ_p`.

*Needs:* §1.28; §1.2; §1.1; §0.3; §0.1; HodgeTateAndCanonicalSubgroups §2.3.

### 1.31 The perfectoid modular curve at the cusps: Tate-curve parameter spaces at infinite level

Let `g = 1, N ≥ 3` prime to `p, X*` the compactified modular curve over a perfectoid `K ⊇ ℚ_p(μ_{p^∞})` of tame level `Γ^p` with `Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N)`, and `x` a cusp of `X*` with field `L_x` and width `e_x`, with its analytic Tate-curve parameter space `D_x ↪ X*` (the open disc `|q| < 1` with the cusp at `q = 0`; Heuer Lemma 2.9). Let `D_{∞,x}` be the open subspace `|q| < 1` of `Spa(L_x⟨q^{1/p^∞}⟩, 𝒪_{L_x}⟨q^{1/p^∞}⟩)`, a perfectoid tilde-limit of the discs `D_{n,x}` with coordinate `q^{1/pⁿ}`, with `𝒪⁺(D_∞) = 𝒪_L[[q^{1/p^∞}]]` (completed). Here `Γ₀(p^∞)`, the `Γ₁`- and `Γ`-levels and `𝒳*_{Γ(p^∞)}, 𝒳*_{Γ₁(p^∞)}(ε)_a` are Heuer's `GL_2` objects over `K`, with classical level groups and the Weil pairing unrestricted (Heuer Definition `2.7: Γ₀(pᵐ) = {(∗ ∗; c ∗) ∈ GL_2(ℤ_p) : c ≡ 0 mod pᵐ}`, so `Γ₀(p^∞)` is the group of all upper triangular matrices, not Layer 0's `{(a b; 0 a⁻¹)}`). Heuer's `𝒳*_{Γ(p^∞)}` is `𝒳*^{Sch}_{Γ(p^∞)} ×_{Spa ℚ_p} Spa K` for Layer 1's fixed-similitude space `𝒳*^{Sch}_{Γ(p^∞)}` (§1.2 (ii) with `L = K`), a profinite family indexed by `a ∈ ℤ_p^×` of the closed fibres with Weil-pairing root `ζ^a`, rather than a coproduct of open fibres, and `𝒳*^{Sch}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K` is its part a = 1; at the `Γ₀`- and `Γ₁`-levels Heuer's spaces are the base changes to `K` of Layer 1's (the determinant condition being absorbed by the fixed `ζ_{pⁿ}`). Heuer's `GL_2(ℤ_p)`-action is the left action `γ·x = x·γ^∨, γ^∨ = det(γ)γ⁻¹`, i.e. Layer 0's right action by `γ^∨` (Heuer §2.6); it multiplies the Weil-pairing root by `c(γ^∨) = det γ`. Then: (1) there is a Cartesian tower `Γ₀(p^∞) × D_{∞,x} → ℤ_p^× × D_{∞,x} → D_{∞,x} → D_x` over `𝒳*_{Γ(p^∞)}(ε)_a → 𝒳*_{Γ₁(p^∞)}(ε)_a → 𝒳*_{Γ₀(p^∞)}(ε)_a → 𝒳*(ε)`, with `Γ₀(p^∞) =` upper triangular matrices in `GL_2(ℤ_p)` (as a profinite perfectoid space), the top-left map sending `(a b; 0 d)` to `d`; the cusp obtained by specialising at `(a b; 0 d)` corresponds to the basis `(q^{d/p^∞}, ζ_{p^∞}^a q^{−b/p^∞})` of `T_pT(q)`; (2) with the right action of `ℤ_p` on `GL_2(ℤ_p) × D_{∞,x}, (γ, q^{1/pⁿ})·h = (γ(1 0; h 1), q^{1/pⁿ}ζ_{pⁿ}^{h/e_x})`, the quotient `(GL_2(ℤ_p) × D_{∞,x})/ℤ_p` exists as a perfectoid space and there is a Cartesian square with `D_x → X*` whose left map `(GL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*_{Γ(p^∞)}` (Heuer's) is an open immersion, equivariant for left multiplication on the first factor and `γ·x = x·γ^∨`; the point `(γ, q)` has Weil-pairing root `ζ^{det γ}` (for the normalisation `e(α⁻¹e_1, α⁻¹e_2) = ζ` of Heuer Lemma 2.25), so the restriction `(SL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*^{Sch}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K` is an `SL_2(ℤ_p)`-equivariant open immersion into Layer 1's space, `SL_2(ℤ_p)` acting there by `x ↦ x·γ⁻¹`; (3) `π_HT` restricts to the locally constant map `(γ = (a b; c d), q) ↦ (b : d) ∈ ℙ¹(ℤ_p)`. This is the local perfectoid q-disc construction at elliptic cusps that the Siegel argument (Hartogs, codimension `≥ 2`) does not provide for `g = 1`.

`g = 1; K` contains all p-power roots of unity, with a fixed compatible system `ζ_{pⁿ}; 0 ≤ ε` small as in Layer 1.

Scholze does not spell out the `g = 1` compactified case; Heuer's paper supplies it with elementary means instead of the Hebbarkeitssatz.

Tame level: the Tate curve `T(q^{e_x})` with its `Γ^p`-structure over `𝒪_{L_x}((q))` gives the open immersion `D_x ↪ X*` sending the origin to the cusp (Katz–Mazur 8.11.10, cited through Heuer §2.2, Lemma 2.9, pp. 9–10, for the completion along the cusps). Anticanonical `Γ₀(pⁿ)`-level: the canonical subgroup of `T(q)` is `μ_{pⁿ}`, an anticanonical subgroup is generated by a `pⁿ-th` root of `q`, so the cusp chart of `𝒳*_{Γ₀(pⁿ)}(ε)_a` is `D_n` with `D_n → D, q^{1/pⁿ} ↦ q` (Heuer Proposition 3.8); pass to the limit (Lemma 3.4). `Γ₁` and `Γ` levels: trivialise `T_pT(q)` by `(q^{d/p^∞}, ζ^a q^{−b/p^∞})` (Lemmas 3.13–3.16, Theorem 3.17). (2) translate by `GL_2(ℤ_p)` using the `Γ₀(p)`-action on the charts (Proposition 3.19, Theorem 3.22); (3) Proposition 3.20 by Lemma 3.21 (a function constant on points of `D_∞` is constant). Comparison with Layer 1: Heuer's finite levels `X*_{Γ(pⁿ)} ⊗ K` are `⊔_{a ∈ (ℤ/pⁿ)^×} 𝒳*^{Sch}_{Γ(pⁿ)} ⊗_{ℚ_p^cycl, σ_ã} K` for chosen lifts `ã ∈ ℤ_p^×` of the finite residue units a (§1.1), and in the limit §1.2 (ii) with `L = K`. On the charts, the cusp labelled `(a b; 0 d)` has basis `(q^{d/p^∞}, ζ^a q^{−b/p^∞})` with Weil pairing `ζ^{ad} = ζ^{det γ}` (Heuer Theorem 3.17(2)), and `γ·x = x·γ^∨` multiplies the Weil-pairing root by `det γ`, so the part a = 1 is the locus `det γ = 1`.

([Heuer], §1.1, Theorem 1.1, and §3, Lemma 3.4, Proposition 3.8, Theorems 3.17 and 3.22, Proposition 3.20, pp. 2–25.) The boundary of the perfectoid modular curve over a cusp and its Tate-curve neighbourhood.

([Heuer], §2.2, Definition 2.7, p. 8, and §2.6, p. 15.)

([Heuer], §1.1, p. 1.)

The boundary over `x` of Heuer's perfectoid modular curve is the profinite set `GL_2(ℤ_p)/(1 0; ℤ_p 1)`, with the open neighbourhood `(GL_2(ℤ_p) × D_{∞,x})/ℤ_p`; the boundary over `x` of Layer 1's fixed-similitude `𝒳*^{Sch}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K` is `SL_2(ℤ_p)/(1 0; ℤ_p 1)`, with the open neighbourhood `(SL_2(ℤ_p) × D_{∞,x})/ℤ_p`.

*Needs:* §1.28; §1.26; §1.2; §1.1; ShimuraVarieties §8.20; ShimuraCompactifications §C6.50–C6.52; PerfectoidSpaces §§P7.10, P7.14.

### Examples

The elliptic cusp tower has q-roots `q^{1/p^n}`. Over a finite Kummer level of degree `p^r, d⁻¹Tr` kills nonconstant q-root characters and fixes base constants. For epsilon=0 the Hasse chart fu=1 is the ordinary localization; `f=1` makes `u=1` and its u-adic completion zero. This is why the endpoint Hartogs argument is separate. At `p=2` and level `p` the finite pairing parameter is unique, whereas at `p=3` it has two values.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 2: Hodge-type representability

### 2.1 Scholze's image compactification and its relation to the minimal compactification

In the situation of ShimuraVarieties §§6.1–6.2, 8.5, 8.19, for `K ⊆ G(𝔸_f)` the image compactification `X^{*̲}_K` is the universal finite target over which `Sh*_K → Sh*_{K′} ⊗ E` factors for all `K′` with `K = K′ ∩ G(𝔸_f)`: the scheme-theoretic image of `Sh*_K` in `Sh*_{K′} ⊗ E` for every sufficiently small such `K′` (the images stabilise because the subalgebras of the pushforward of `𝒪` form an increasing chain of coherent subalgebras). The tower `(X^{*̲}_K)_K` carries the right action of `G(𝔸_f)`. The finite map `Sh*_K → X^{*̲}_K` is an isomorphism over the open Shimura variety, and `Sh*_K` is the normalisation of `X^{*̲}_K` (`Sh*_K` is normal and the map is finite and birational). The boundary of `X^{*̲}_K` is the preimage of the Siegel boundary. Whether `Sh*_K → X^{*̲}_K` is an isomorphism is not known in general (Scholze, §4.1): `X^{*̲}` is an auxiliary compactification, distinct from the canonical minimal one.

`(G, X)` a Shimura datum of Hodge type in Deligne's setup (ShimuraData §4.2): a closed embedding `ι: (G, X) ↪ (GSp_2g, H_g^±)` into a Siegel datum, fixed once and for all; Scholze's `(G, D) ↪ (Sp_2g, D)` setup is the restriction to a connected component and is not used for statements.

Scholze writes the image compactification with an underlined asterisk; the image of the boundary is Zariski closed.

Noetherianity: the images of `𝒪_{Sh*_{K′}}` in the pushforward of `𝒪_{Sh*_K}` increase as `K′` shrinks and stabilise; the stable value defines `X^{*̲}_K`, independent of `K′` thereafter. Over the open part, `Sh_K → Sh_{K′} ⊗ E` is a closed immersion for small `K′`, so the image compactification contains `Sh_K` as a dense open and the map is an isomorphism there. Normality of `Sh*_K` plus finiteness and birationality identify `Sh*_K` with the normalisation of `X^{*̲}_K` (Pilloni–Stroh state this in §1.21).

([Scholze], §4.1, second and third paragraphs and footnote 16, p. 1018.) The closed-embedding statement is known only for the open varieties, which forces the image compactification.

([HJ], §5.2, remark after Proposition 5.14, p. 34.)

The API is `HodgeTower.imageCompactification`, `HodgeTower.minToImage`, .`minToImage_isNormalization, .minToImage_iso_open, .imageCompactification_boundary` and .`imageCompactification_stable`: the equivariant image tower, compatible finite normalization, its interior isomorphism, boundary intersection and stabilization for sufficiently small ambient level.

**Checks.**

- `imageCompactification_siegel`: For `ι = id, X^{*̲}_K = Sh*_K` and minToImage is the identity.
- `imageCompactification_curve`: For a compact Shimura curve (no boundary) minToImage: `Sh*_K = Sh_K → X^{*̲}_K` is an isomorphism, and for the modular curve with `ι = id` it is the identity of the modular curve's minimal compactification.
- `imageCompactification_not_normal`: The image of a normal projective variety under a finite birational map need not be normal (the cuspidal cubic is the image of `ℙ¹`), so `X^{*̲}_K` is not asserted to be normal and is not identified with `Sh*_K`.
- `imageCompactification_open_compat`: Restricted to the open Shimura variety, `X^{*̲}_K` is `Sh_K`, the Layer 0 tower at level `K`.

For a compact Shimura curve (`G^ad` anisotropic over `ℚ`, so `Sh*_K = Sh_K`) minToImage is an isomorphism, because it is an isomorphism over the open Shimura variety, which is everything; for the modular curve with `ι = id` it is the identity. For a non-identity embedding of the modular curve, cusps may be identified in the image and `X^{*̲}_K` is not known to be normal, so no isomorphism is asserted.

*Needs:* ShimuraVarieties §§8.5, 8.19; ShimuraVarieties §§6.1–6.2, 8.18, 2.5–2.9; HodgeTateAndCanonicalSubgroups §2.1.

### 2.2 The open Hodge-type tower is perfectoid

Let `(G, X)` be of Hodge type with the embedding `ι`, and let `K^p ⊆ G(𝔸_f^p)` be contained in `K′^p ∩ G(𝔸_f^p)` for `K′^p ⊆ GSp_2g(𝔸_f^p)` inside a level-N subgroup with `N ≥ 3` prime to `p`, small enough that the finite levels embed (with tame level chosen to make the finite embeddings closed). Then the open tower `(S_{K^pK_p})_{K_p}` of Layer 0, base changed to `C`, has a perfectoid representative `S_{K^p} ~ lim_{K_p} S_{K^pK_p}` (Layer 0 §0.2), Zariski closed in the open perfectoid Siegel tower; equivalently `S^◇_{K^p,∞}` is representable by a perfectoid space. Remark: Caraiani–Scholze's Theorem 2.1.2 states the open tower over `E_𝔭` (a perfectoid space mapping to `Spa E_𝔭`); that form is not asserted here, since Layer 1 supplies the Siegel tower only over `ℚ_p^cycl` and `C`.

`K^p` sufficiently small in the above sense; Hansen–Johansson (genuine-minimal tower) remove this condition.

The open Siegel tower of Layer 0 over `C` is perfectoid at every level `K′_p ⊆ GSp_2g(ℚ_p)`: §1.30 over `ℚ_p^cycl`, transported to the Layer 0 Siegel tower over `C` (all similitude components, all levels) by §1.2; this interprets Scholze’s base extension and component restriction in the full-similitude tower. For small `K′` the finite levels of the Hodge-type tower are closed subvarieties of the Siegel ones (ShimuraVarieties §§6.1–6.2, 8.5, 8.19); apply PerfectoidTowers §P8.21 (compatible closed subvarieties of a perfectoid tower have a perfectoid, Zariski closed tilde-limit). The level systems: `ι⁻¹` of a cofinal system of Siegel levels is cofinal in `G(ℚ_p)` (PerfectoidSpaces §P7.9).

([CS], §2.1, Theorem 2.1.2 and footnote 8, pp. 11–12.)

([CS], §2.1, Theorem 2.1.2, p. 12.)

For the Siegel datum it is the open perfectoid Siegel tower.

For a unitary PEL datum it is the tower used by Caraiani–Scholze.

*Needs:* ShimuraVarieties §§8.5, 8.19; §1.30; §1.28; §1.2; §0.2; ShimuraVarieties §6.1–6.2; PerfectoidTowers §P8.21; PerfectoidSpaces §P7.9.

### 2.3 Scholze's Hodge-type theorem for the image compactification

In the situation of §2.2 (`K^p` contained in the level-N subgroup of `G′` for some `N ≥ 3` prime to `p`), there is a perfectoid space `𝒳^{*̲}_{K^p}` over `C` with `𝒳^{*̲}_{K^p} ~ lim_{K_p} 𝒳^{*̲}_{K_pK^p}`. (i) For every Lagrangian coordinate subset `J ⊆ {1, …, 2g}`, the preimage `𝒱_J` of the Siegel chart `𝒴*_{K′^p}(J) = π_HT^{Siegel,−1}(Fl_J)` is affinoid perfectoid, `𝒱_J = Spa(R_{J,∞}, R_{J,∞}⁺)`, it is the preimage of an affinoid `𝒱_{J,K_p} ⊆ 𝒳^{*̲}_{K_pK^p}` for all sufficiently small `K_p`, and `R_{J,∞}⁺` is the p-adic completion of `colim_{K_p} R_{J,K_p}⁺`. (ii) The boundary `𝒵_{K^p} ⊆ 𝒳^{*̲}_{K^p}` satisfies: `𝒵_{K^p} ∩ 𝒱_J ⊆ 𝒱_J` is strongly Zariski closed. The structure sheaf is that of the perfectoidization of the Zariski closed loci (PerfectoidTowers §P8.21), not the restriction of the Siegel structure sheaf: the tower is not merely a closed subset of the perfectoid Siegel space.

`K^p` inside the level-N subgroup of `G′(𝔸_f^p), N ≥ 3` prime to `p`; the limit in Scholze's proof runs over `K^p ⊆ K′^p ⊆ G′(𝔸_f^p)` (the published text prints `G(𝔸_f^p)`).

Before (i), prove integral approximation on these image charts, taking `R_{J,K_p}⁺ = R_{J,K_p}^∘` and `R_{J,∞}⁺ = R_{J,∞}^∘`: the finite-level plus rings inject compatibly, for every integer `r≥1` each bounded section modulo `p^r` comes from one of them, and divisibility by `p^r` is detected there. Hence their p-adic completion is `R_{J,∞}⁺`. This is a local target of this section; PerfectoidTowers §P8.21 supplies ordinary-ring density and almost surjectivity, not this exact integral identification.

Use the surjective finite transition maps and surjectivity of the limit projections on these charts to preserve spectral seminorms of finite-level sections. Density gives, for `f∈R_{J,∞}^∘`, an approximation `a∈R_{J,K_p}` with `|f−a|_sup<|p|^r`. Then `|a|_sup≤1`, so `a∈R_{J,K_p}^∘`. If a finite-level section is divisible by `p^r` in the limit plus ring, the same norm comparison makes its quotient by `p^r` bounded at that finite level. This proves both approximation and p-adic saturation; completeness gives the asserted isomorphism.

Siegel case: Layer 1 §1.28 over `ℚ_p^cycl`, transported to the Layer 0 Siegel tower over `C` at all levels `K′_p ⊆ G′(ℚ_p)` and on all similitude components by §1.2 (Scholze’s base extension and component restriction). For `J` Lagrangian, `𝒴*_{K^p}(J) = lim_{K^p ⊆ K′^p} 𝒴*_{K′^p}(J)` is affinoid perfectoid (Layer 1 (i)); the preimage of `X^{*̲}_{K_pK^p} ↪ Sh*_{K′_pK′^p}` is Zariski closed in it; PerfectoidTowers §P8.21 gives an affinoid perfectoid Zariski closed limit with dense image of the finite-level rings and the tilde-limit property, and the strongly Zariski closed boundary by base change (PerfectoidSpaces §P4.12–P4.15, PerfectoidSpaces §P4.15). Glue over `J` by PerfectoidSpaces §P7.12.

([Scholze], §4.1, Theorem 4.1.1 (existence, (i), (ii)) and its proof, pp. 1018–1020.)

([Scholze], §4.1, proof of Theorem 4.1.1, p. 1020.) The boundary statement by pullback.

**Checks.**

- For the identity Siegel embedding the identification recovers §1.28(i), including bounded sections modulo each `p^r`.
- For the constant singleton tower `Spa(C,O_C)` the completion map is the identity. For a genuine zero-dimensional Shimura chart with profinite component set S, the infinite rings are `C⁰(S,C)` and `C⁰(S,O_C)`; locally constant finite-level functions are p-adically dense in the latter. For the CM torus `Res_{ℚ(i)/ℚ}G_m` at `p=5` and principal tame `N≥3`, the p-deck group is `(ℤ₅^×)²`, so the inverse image of a finite-level point is not a singleton (PerfectoidSpaces §§P5.1, P6.8).
- Almost surjectivity alone cannot imply exact approximation modulo `p`: the inclusion of the maximal ideal `𝔪_C` into `O_C` has almost-zero cokernel but misses the class of 1 modulo `p`. The spectral-norm argument above is therefore essential.

*Needs:* §2.1; §1.28; §1.2; §0.2; PerfectoidTowers §P8.21; PerfectoidSpaces §§P4.12–P4.15, P4.15, P7.12, P5.1, P6.8.

### 2.4 The Siegel minimal tower is perfectoid at every tame level

For every compact open `K^p ⊆ GSp_2g(𝔸_f^p)` (no condition at `N`), the minimally compactified Siegel tower `lim_{K_p} 𝒮*^◇_{K^pK_p}` over `C` (the Layer 0 p-level tower of the Siegel datum) is a perfectoid space, covered by finitely many `GSp_2g(ℚ_p)`-translates of affinoid perfectoid subsets `𝒮*_{K^p}(ε)_a ⊆ 𝒮*_{K^p}(ε′)_a (0 < ε < ε′ < 1/2)` with the closure of the first contained in the second, each pulled back from a finite level.

`K^p` arbitrary; choose a normal open `K₁^p ⊆ K^p` inside a level-N subgroup with `N ≥ 3` prime to `p` (ShimuraVarieties §0.3).

For `K₁^p ⊴ K^p` as chosen, Layer 1 §1.28 and §1.26 over `ℚ_p^cycl`, transported to the Layer 0 Siegel tower over `C` at all levels `K_p ⊆ GSp_2g(ℚ_p)` by §1.2, give the perfectoid tower over `C` at level `K₁^p` with the covering by `GSp_2g(ℚ_p)`-translates of anticanonical neighbourhoods, which are stable under the finite group `K^p/K₁^`p. Quotient by `K^p/K₁^p` chartwise: PerfectoidTowers §P8.7 on the invariant affinoid perfectoids (Hansen, Theorem 1.4 in the form planned by P8), and the quotients glue; the quotient commutes with the limit over `K_p` as in PerfectoidTowers §P8.20.

([HJ], §5.2, proof of Proposition 5.14, p. 34.)

For `K^p = GSp_2g(Ẑ^p)` (full tame level, not neat), the minimally compactified tower is perfectoid.

*Needs:* §1.28; §1.26; §1.2; ShimuraVarieties §0.3; PerfectoidTowers §§P8.7, P8.20.

### 2.5 The genuine minimally compactified Hodge-type tower is perfectoid and a good tower

Let `(G, X)` be of Hodge type with reflex field `E, Sh*_K(G, X)` the canonical normal projective minimal compactification over `E` (ShimuraVarieties §8.18), `C` and the embedding `σ: E → C` as in HodgeTateAndCanonicalSubgroups §2.1 (`σ` factors through the completion `E_𝔭` at the place `𝔭 | p` it induces), and `𝒳*_K := S*_K = (Sh*_K(G, X) ⊗_{E,σ} C)^{ad}` the Layer 0 minimally compactified tower over `C`. For any compact open `K^p ⊆ G(𝔸_f^p)`: (a) `𝒳*_{K^p} := lim_{K_p} 𝒳*^◇_{K^pK_p} = S^{*◇}_{K^p,∞}` is a perfectoid space; (c) it is analytically separated; (d) it has two coverings by finitely many open affinoid perfectoids `U_i ⊆ V_i` with the closure of `U_i` in `V_i`, each pulled back from an open affinoid of some `𝒳*_{K^pK_p}`; (e) hence for every cofinal system of `K_p ⊆ G(ℚ_p), (𝒳*_{K^pK_p})_{K_p}` is a good tower over `C` (PerfectoidTowers §P8.19). The identification with the diamond limit is the only limit statement: whether `𝒳*_{K^p} ~ lim 𝒳*_{K^pK_p}` in the sense of Scholze–Weinstein is not known (Boxer–Pilloni §4.4.27). The Hodge–Tate period map on this tower is Layer 3's (§3.8), not part of this theorem. Remark: Hansen–Johansson's Proposition 5.14 states (a)–(e) for the rigid spaces over `E_𝔭` ('good tower (over `E_p`)'); that form is not asserted here, because its proof needs a perfectoid Siegel target over `E_𝔭`, and the Siegel input (§2.4, from Layer 1 over `ℚ_p^cycl` and `C`) supplies one only over `C`; descent from `C` to `E_𝔭` is a separate theorem (HodgeTateAndCanonicalSubgroups §2.1).

`K^p` arbitrary; no hyperspecial or good-reduction hypothesis at p.

The proof uses the perfectoidization of integral algebras (Bhatt–Scholze, Theorem 1.17(1) = 10.11) through PerfectoidTowers §P8.18. This uses the integral map and completed generic pair of that supplier, with its universal property.

Choose `K′^p ⊇ K^p` in `GSp_2g(𝔸_f^p)` and a cofinal chain `K_n ⊆ GSp_2g(ℚ_p)` with `ι⁻¹(K_n)` cofinal in `G(ℚ_p)`. The maps `𝒳*_{K^pι⁻¹(K_n)} → 𝒮*_{K′^pK_n}` over `C` are finite (ShimuraVarieties §§6.1–6.2, 8.5, 8.19, base changed along `σ`; the reflex field of the Siegel datum is `ℚ`), with finite transition maps. The Siegel target tower over `C` is perfectoid at every tame level (§2.4); PerfectoidTowers §P8.18 gives (a) and quasicompactness of `f: 𝒳*_{K^p} → 𝒮*_{K′^p}`. (c): PerfectoidTowers §P8.19. (d): pull back the translates `𝒮*(ε)_a g_i ⊆ 𝒮*(ε′)_a g_i` along `f`; preimages of affinoid perfectoids pulled back from finite level are affinoid perfectoid (PerfectoidTowers §P8.18), and closures pull back into the larger sets. (e): Definition of good tower (PerfectoidTowers §P8.19).

([HJ], §5.2, Proposition 5.14 with proof, pp. 34–35.)

([BP21], §4.4.27, p. 74.) Boxer–Pilloni: the tilde-limit property of the genuine minimal tower is open (the sentence continues with the formula).

For the Siegel datum it is §2.4.

*Needs:* ShimuraVarieties §§8.5, 8.19; §2.1; §2.4; HodgeTateAndCanonicalSubgroups §2.3; ShimuraVarieties §§6.1–6.2, 8.18; PerfectoidTowers §§P8.18, P8.19, P8.15; HodgeTateAndCanonicalSubgroups §2.1.

### 2.6 Good towers at arbitrary (non-product) levels

For `(G, X)` of Hodge type, any compact open `K ⊆ G(𝔸_f)` (not necessarily of the form `K^pK_p`) and any cofinal system of compact open `K_p ⊆ G(ℚ_p)`, the tower `(𝒳*_{K∩K_p})_{K_p}` of Layer 0 minimal compactifications over `C` (through `σ: E → C`) is a good tower over `C`, where `H ∩ K_p := {h ∈ H : h_p ∈ K_p} = H ∩ (G(𝔸_f^p)K_p)`.

Let `K^p` be the image of `K` in `G(𝔸_f^p)`. Then `K ∩ K_p ⊆ K^pK_p` is open of finite index, so the maps `𝒳*_{K∩K_p} → 𝒳*_{K^pK_p}` are finite (ShimuraVarieties §8.19, V2 finite quotients). Apply PerfectoidTowers §P8.18–P8.20 to the good tower of §2.5.

([HJ], §5.2, Corollary 5.15 with proof, p. 35.)

For `K = K^pK_p` it is §2.5 (e).

Hansen–Johansson's Corollary 5.15 states this over `E_𝔭`; as for §2.5, only the form over `C` is asserted.

*Needs:* §2.5; PerfectoidTowers §P8.18–P8.20; ShimuraVarieties §8.19.

### 2.7 Good towers are stable under extension of the base field

Let `K ⊆ L` be complete nonarchimedean fields with `L` perfectoid (for instance `C_p ⊆ C` or `E_𝔭 ⊆ C`), and `(X_i)` a good tower over `K` (PerfectoidTowers §P8.19). Then `(X_i ⊗_K L)` is a good tower over `L`, with limit `(lim X_i^◇) ×_{Spd K} Spd L`; affinoid perfectoid covers pulled back from finite level, and the closure relation `Ū_j ⊆ V_j`, pass to the base change.

Analytifications of projective varieties base change to analytifications of projective varieties; finiteness is preserved.

Condition (1) of a good tower is preserved by base change of projective varieties and finite maps. (2) Both the represented limit and `Spa(L, O_L)` are perfectoid, so their fibre product over `Spa(K, O_K)` is perfectoid (PerfectoidSpaces P2 fibre products over an analytic base), and limits commute with fibre products. (3) Preimages of the `U_j, V_j` are affinoid perfectoid (fibre products of affinoid perfectoids), pulled back from the base-changed finite-level affinoids, and closures map into closures by continuity.

([HJ], §5.3, conventions, p. 35.)

Applied to `C ⊆ C′` (complete algebraically closed) it shows that the good towers of §2.6 over `C′` are the base changes of those over `C`; applied to `E_𝔭 ⊆ C` it would turn Hansen–Johansson's `E_𝔭` form of Corollary 5.15 into the form over `C`, which is the bridge between their §5.2 and §5.3 that the source does not state (the construction here gives the form over `C` directly).

**Checks.**

- The constant good tower `Spa(C_p)` remains the constant good tower `Spa(C)` after a complete algebraically closed extension.
- For the Frobenius tower of `ℙ¹_C`, extension to a complete algebraically closed `C′` preserves the perfected charts and their closure containment.
- Completeness alone is insufficient: the completion of the Gauss-valued field `C_p(T)` has residue field `F̄_p(T)`, whose Frobenius misses `T`. It is not perfectoid, so base change of the constant tower `Spa(C_p)` to this field is not good.

*Needs:* HodgeTateAndCanonicalSubgroups §2.3; PerfectoidTowers §P8.19; PerfectoidSpaces §P2.17.

### 2.8 Comparison of the genuine and image-compactified Hodge-type towers

For `(G, X)` of Hodge type and `K^p` as in §2.3, the finite maps `Sh*_K → X^{*̲}_K` of §2.1 induce a `G(ℚ_p)`-equivariant quasicompact map `𝒳*_{K^p} → 𝒳^{*̲}_{K^p}` of perfectoid spaces over `C`, which is an isomorphism over the open tower `S_{K^p}` (§2.2) and maps boundary to boundary. Whether it is an isomorphism is not known in general and is not asserted.

Take the inverse limit of the compatible finite-level maps in v-sheaves. The two diamonds are represented by perfectoid spaces over `C`, so the map lifts uniquely through the fully faithful perfectoid-space-to-diamond functor with the untilt/base fixed. The qcqs property follows from DiamondsAndVStacks §D5.3. This does not assume that the genuine minimal tower already satisfies a tilde-limit statement. Over the open part the finite-level maps are isomorphisms, so their limit is.

([BP21], §4.4.27, p. 74.)

For the Siegel datum it is the identity.

*Needs:* §2.5; §2.3; §2.1; §2.2; §0.2; DiamondsAndVStacks §D5.3.

### 2.9 Independence of the symplectic embedding

The open perfectoid tower `S_{K^p}` and the genuine minimally compactified perfectoid tower `𝒳*_{K^p}` of a Hodge-type datum, with their `G(ℚ_p)`-actions and their maps to the finite levels, do not depend on the symplectic embedding `ι`: for two embeddings the representatives are canonically isomorphic, compatibly with the cones, because both represent the diamond `lim_{K_p} S^◇_{K^pK_p}` (resp. `lim 𝒳*^◇_{K^pK_p}`) built from the canonical models, which do not involve `ι`. No such statement is made for the image compactification `𝒳^{*̲}_{K^p}`, which depends on `ι` a priori.

The finite-level canonical models and their minimal compactifications are independent of `ι` (ShimuraVarieties V6/V8). A perfectoid representative is unique up to unique isomorphism compatible with the cones (PerfectoidSpaces §P7.10 for the open tower; for the genuine minimal tower, uniqueness of a perfectoid space with given diamond, the diamond functor being fully faithful on perfectoid spaces).

([CS], §2.1, Theorem 2.1.3(1), p. 12.)

For two embeddings differing by an automorphism of the symplectic space, the induced isomorphism is the identity on the towers.

*Needs:* §2.2; §2.5; §0.2; PerfectoidSpaces §P7.10; DiamondsAndVStacks §D6.4.

### Examples

For a real quadratic field `F`, the trace-polarized Hilbert embedding has Humbert surface of discriminant `d_F` as its image in the Siegel threefold. At maximal Siegel level the Galois involution of `F/ℚ` makes this map generically two-to-one; sufficiently small ambient level is essential for a closed immersion. On complex points the supplied map is `[x,a] ↦ [ι(x),ι(a)]` (ShimuraVarieties §§6.1–6.2, 8.5, 8.19; [CS] §2.1, Example 2.1.1, p.11).

With the identity Siegel embedding, the image compactification is the given Siegel compactification and the comparison is the identity. A finite normalization of a nonnormal image is not an isomorphism merely because it is so on the interior. On a positive-dimensional constant curve tower perfectoidness cannot be inferred from diamond representability.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 3: Hodge-type period maps and coefficients

### 3.1 Imported homogeneous flag and Levi torsor: the right-action dictionary

Use ReductiveGroups Layers 7–8, ShimuraData §§3.7–3.9 and AutomorphicBundles §§B0.3–B0.5 for the representable flag and universal parabolic/Levi torsors over the characteristic-zero field `F` defining `μ`; analytify over a p-adic `F`. Fix the dictionary `FL=P_μ\G`, with right G-action, and `gP_μ↦P_μg⁻¹` from the left-action convention. Turn left `M_μ`-multiplication on `U_P\G` into the right torsor action `Ux·m=Um⁻¹x`. Associated `P_μ`-representations use the supplied exact tensor functor, with Levi representations inflated to `P_μ`. For Siegel `μ(t)=diag(I_g,tI_g)`, conjugation sends `(A B;C D)` to `(A t⁻¹B;tC D)`, so `P_μ={B=0}=`Stab`⟨e_{g+1},…,e_{2g}⟩`, opposite to the Hodge parabolic `{C=0}`. The coset `P_μx` is the row space of `x`'s top `g` rows. For a Tate frame `Ψ`, write `W=g(Ψ)⟨e_{g+1},…,e_{2g}⟩=Ψ⁻¹Lie A(1)`; then `π_HT(A,Ψ)=P_μg(Ψ)⁻¹`, whose row space annihilates `W`. The universal P-torsor uses inversion to pass to a right torsor. This is the convention comparison, using the supplied carriers.

`G` reductive, `μ` a cocharacter defined over the base; the Bruhat decomposition and Schubert cells are ShimuraData §3.14.

Import the geometric quotient and torsor universal properties from ReductiveGroups Layers 7–8 and AutomorphicBundles §§B0.3–B0.5; the following group-quotient calculations specify the convention but do not construct a scheme or analytic torsor. `U_{P_μ}` is normal in `P_μ` with quotient `M_μ; P_μ\G` is the quotient of `U_{P_μ}\G` by the free right action of `M_μ`, which is locally trivial because `G → P_μ\G` is (Zariski-locally on the big cell) trivial. Equivariance: right translation by `G` commutes with the left action of `P_μ`. Dictionary: inversion `g ↦ g⁻¹` exchanges `G/P_μ` and `P_μ\G` and left with right actions (AutomorphicBundles §B0.3).

([BP21], §4.4.10, Remark 4.4.11, p. 66.)

([BPS], §3.1, p. 33.)

([BPS], §3.3, Remark 3.3.1, p. 35.)

Consume the supplied flag, Levi torsor and exact tensor associated-bundle functor; construct the convention comparisons `HodgeTate.FL_equivLeftFlag` and `HodgeTate.FL_siegel`. The first is inversion from `G/P_μ` to `P_μ\G`; the second is the specified Siegel row-space/annihilator dictionary. The generic flag and associated-bundle constructions are ReductiveGroups Layers 7–8 and AutomorphicBundles §§B0.3–B0.5.

**Checks.**

- `FL_gl2_P1`: For `GL_2` and `μ(t) = diag(1, t), P_μ` is lower triangular and `FL_{G,μ} ≅ ℙ¹` by `P_μ·x ↦` the line of the first row of `x`; the chart point `P_μ·(1 z; 0 1)` corresponds to the row `(1, z)`, and `g = (a b; c d)` acts on the right by `z ↦ (b + dz)/(a + cz)`, since `(1, z)g = (a + cz)(1, (b + dz)/(a + cz))`; this is the `g = 1` case of §3.4.
- `FL_parabolic_pinned`: For `GL_2` and `μ(t) = diag(t, 1)` the limit parabolic is upper triangular, and `P·x ↦` the line of the first row of `x` is not well defined on `P\GL_2: (1 1; 0 1) ∈ P`, so `P·(1 1; 0 1) = P·1`, but the first rows (1, 1) and (1, 0) span different lines. The pinned `μ(t) = diag(1, t)` is needed for the row-space dictionary.
- `FL_trivial_mu`: For a central cocharacter, `U_P = 1` and `M_μ = G`; the Levi torsor is `G →` point.
- `FL_left_right_inverse`: For a nonnormal parabolic the rule `gP↦Pg` is not well defined. Take `G=GL₂`, `P` lower triangular, `u=(1 0;1 1)` and `w=(0 1;1 0)`: `wP=wuP`, whereas `Pw≠Pwu` because `wuw⁻¹` is a nontrivial upper unipotent. Inversion `gP↦Pg⁻¹` is well defined and sends left translation by `a` to right translation by `a⁻¹`. For central `μ`, both flag quotients are a point and their identity exists.
- `FL_compact_dual`: Over `ℂ, FL_{G,μ}` is the compact dual of ShimuraData §3.8–3.9 after inversion and passage from the Hodge to the opposite parabolic.

For `G = GL_2` and `μ(t) = diag(1, t)` (the `g = 1` case of the pinned Siegel cocharacter): `Ad μ(t)(a b; c d) =` (a `t⁻¹b; tc d`), so `P_μ = {b = 0}` is the lower triangular Borel, the stabiliser of `⟨e_2⟩; FL = ℙ¹` through `P_μ·x ↦` the line of the first row of `x; M_μ = T` the diagonal torus; and `U\GL_2 → ℙ¹` is the `𝔾_m²`-torsor of frames of the tautological flag.

*Needs:* ReductiveGroups Layers 7–8; ShimuraData §§3.8–3.9, 3.14, 3.7; AutomorphicBundles §§B0.3, B0.3–B0.5.

### 3.2 The Siegel period map: tame level, prime-to-p Hecke operators and the right-action normalisation

Let `π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl` be the Siegel Hodge–Tate period map of Layer 1. (iii) For `(K^p)′ ⊆ K^p` (both inside level-N subgroups, `N ≥ 3` prime to `p`), `π_HT` on `𝒳*_{Γ(p^∞),(K^p)′}` is the composite of the projection to `𝒳*_{Γ(p^∞),K^p}` with `π_HT`. (iv) For `γ ∈ GSp_2g(𝔸_f^p)` with `γ⁻¹K^pγ` inside such a subgroup, `π_HT ∘ γ = π_HT`: prime-to-p Hecke operators act trivially on Fl. In BP's convention `FL = P\GSp_2g` with `π_HT(A, Ψ) = P·g(Ψ)⁻¹, π_HT((A, Ψ)f) = π_HT((A, Ψ))·f` for `f ∈ GSp_2g(ℚ_p)`, the right action `(A, Ψ)f = (A, Ψ ∘ f)` on the tower.

Siegel datum; `K^p` as in Layer 1.

(iii) by construction of `π_HT` (the Hodge–Tate filtration does not see the tame level). (iv) by the uniqueness of extensions across the boundary (Layer 1 §1.27) it suffices to check on geometric points outside the boundary, where the Hodge–Tate filtration of `A[p^∞]` depends only on A up to prime-to-p isogeny (Scholze Proposition 3.3.1; HodgeTateAndCanonicalSubgroups T0). Right action: `g(Ψ ∘ f) = f⁻¹g(Ψ)` because `Ψ ∘ f` carries `⟨f⁻¹g(Ψ)e_{g+1}, …⟩` to `Lie A(1)`; hence `P·g(Ψ ∘ f)⁻¹ = P·g(Ψ)⁻¹·f`.

([Scholze], §3.3.3, Theorem 3.3.18(iii)–(iv) with proof, pp. 1012–1014.)

([BPS], §3.3, Remark 3.3.1, p. 35.)

For `g = 1` and `γ = diag(ℓ, 1)` at a prime `ℓ ≠ p`, the Hecke translate of a point `(E, α)` is `(E/C, α′)` with `E → E/C` an `ℓ`-isogeny, and `π_HT` is unchanged.

*Needs:* §1.27; §1.28; §3.1; HodgeTateAndCanonicalSubgroups §0.18.

### 3.3 Siegel case: the tautological bundles pull back to `Lie A` and `ω`

Let `W ⊆ 𝒪_Fl^{2g}` be the universal totally isotropic subbundle and `ω_Fl = (∧^g W)^∨`. (v) Over the open perfectoid Siegel tower `𝒳_{Γ(p^∞),K^p}` there is a natural `GSp_2g(ℚ_p)`-equivariant isomorphism `Lie A ⊗ 𝒪(1) ≅ π_HT^*W`, equivalently `π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨}` through the Hodge–Tate map (the canonical, twist-free form), and `π_HT^*W^∨ ≅ ω_A(−1)`; Scholze states `Lie A ≅ π_HT^*W` after suppressing Tate twists over `ℚ_p^cycl`, i.e. after trivialising `ℤ_p(1)` by the fixed compatible system `ζ_{p^∞}`, a trivialisation that `GSp_2g(ℚ_p)` moves through the similitude character. (vi) Over the whole minimally compactified tower `𝒳*_{Γ(p^∞),K^p}`, with `ω` the Hodge line bundle pulled back from finite level, there is a natural `GSp_2g(ℚ_p)`-equivariant isomorphism `π_HT^*ω_Fl ≅ ω(−g)`, extending the dual top exterior power of (v); both isomorphisms are compatible with change of tame level and prime-to-p Hecke operators.

Siegel datum, `K^p` as in Layer 1.

Fargues' bound (Fargues–Genestier–Lafforgue, Théorème II.1.1) is proved only for `p ≠ 2`; for `p = 2` the integral bound of (vi) comes from the induction on `g`.

The determinant of `π_HT^*W^∨ ≅ ω_A(−1)` is `ω(−g)`. A choice of `ζ` trivializes the Tate line and yields an untwisted underlying-bundle identification; equivariance of that untwisted form requires transporting the linearization, since the action on `ζ` is through the similitude character.

The relative Hodge–Tate filtration identifies `π_HT^*W` with `Lie A(1)`; duality gives (v). After the specified Tate trivialization and transported action, the two integral Hodge-line structures satisfy `p^Cω⁺⊆π_HT^*ω_Fl⁺⊆p^{−C}ω⁺` off the boundary. For odd `p`, Raynaud reduction and Fargues's `p^{1/(p−1)}` cokernel bound give determinant loss `g/(p−1)`. An all-prime alternative uses boundedness on the quasi-compact good-reduction locus and induction through smaller-genus Raynaud periods near the boundary. Embed both line bundles in `j_*j^*ω`. Triviality of the pulled-back integral flag line on an anticanonical chart, equivalence of bounded sections and §1.22's goodness extend the comparison; translates cover the tower. If locally `α(f₁)=hf₂` and `|h|≥|p|^C` off the boundary, the open `|h|≤|p|^{C+1}` lies in the boundary and is empty. This proves invertibility, stronger than a bound only on the interior.

([Scholze], §3.3.3, proof of Theorem 3.3.18(vi), p. 1014.) The integral bound from Proposition 3.3.1 and Fargues' theorem ([30] = Fargues–Genestier–Lafforgue).

([Scholze], §3.3.3, Theorem `3.3.18(v)`–(vi) with proof, pp. 1013–1015.) Alternative to the Fargues input, covering `p = 2`.

([Scholze], §3.3, p. 1003.) Scholze's suppression of Tate twists.

For `g = 1: ω ≅ π_HT^*𝒪(1)` on the perfectoid modular curve, the elliptic statement of §3.10. This uses the quotient-line/BHW linearization transported from the chosen Tate generator; with the raw W-dual linearization the formula is `π_HT^*W^∨ ≅ ω(−1)`, as in (v).

*Needs:* §3.2; §1.27; §1.22; HodgeTateAndCanonicalSubgroups §§2.5, 2.6, 2.7, 0.14, 0.15, 0.16, 0.18, 0.5; AutomorphicBundles §B2.9.

### 3.4 Siegel graph charts, strict-Iwahori stable domains and the Hodge–Tate frame

For a finite matrix index and a commutative ring `R`, the row-graph coordinate is a symmetric matrix `Z`, the quotient frame is the linear map with row matrix `(1, Z)`, the factor of automorphy is `A + ZC`, and the fractional action is `(A + ZC)⁻¹(B + ZD)`. The factor satisfies the composition law, isotropic row graphs are characterized by symmetry, and the quotient frame has negative-graph kernel `{(−Zy,y) : y∈R^g}`. Action and frame identities assume the determinant of `A + ZC` is a unit. The integral determinant congruence is specifically over `ℤ_p`. Pointwise distance domains use a normed field `K` with a normed `ℚ_p`-algebra structure; stability additionally assumes the ultrametric norm, `0 < r ≤ 1`, and the actual strict-Iwahori element of `GSp_2g(ℤ_p)`. Their analytic affinoid realization is part of the target below.

Use §3.1's cocharacter, parabolic and row-space convention. The chart consists of rowspace`(1,Z)=W^⊥, W=`colspace`(−Z;1)`, with `Zᵀ=Z; W` complements the first `g` coordinates. Its integral affinoid is Scholze's `Fl_{g+1,…,2g}`. For `0<r≤1, r∈|p|^ℚ`, define `Fl^×(r)={Zᵀ=Z : dist(Z_ij,ℤ_p)≤r}` as a finite disjoint union of closed polydiscs. Let `K_{Iw⁺}` be §1.30's diagonal symplectic-reduction subgroup. For `γ=(A B;C D)`, require the unit determinant of `J_γ(Z)=A+ZC` wherever the chart action is used; then `Z·γ=J_γ(Z)⁻¹(B+ZD)` is symmetric. On `Fl^×`(1), `J_γ` is integral invertible with determinant congruent to `det A mod p`; each `Fl^×(r)` is `K_{Iw⁺}`-stable. On the open perfectoid tower the frame `s_j(A,Ψ)=HT_A(Ψ(e_j))` of `π_HT^*(𝒪^{2g}/W)=ω_{A^∨}` is dual to `(1,Z)` and satisfies `R_γ^*s=s J_γ`. Principal polarization transports it equivariantly to `ω_A`. Symplectic transport instead gives the frame `s′=⟨e_j,·⟩|_W=∓x_{g+j}|_W` of `π_HT^*W^∨=ω_A(−1)` with law `R_γ^*s′=c(γ)⁻¹s′J_γ`. Here `c(γ)∈1+pℤ_p` need not equal 1. The Weil-pairing Tate generator satisfies `ζ_{Ψ∘γ}=c(γ)ζ_Ψ`; hence `s′⊗ζ_Ψ` has the untwisted law on `ω_A`. A fixed Tate trivialization retains the multiplier factor.

Siegel datum; right action on row vectors (BP26 convention, pinned in §3.1); the formula is re-derived here in one fixed convention because the sources state only `g = 1` ([BHW] Lemmas 2.4, 3.19 and Proposition 3.21) and the Hilbert case (Lemmas 5.29, 5.32).

The downstream coefficient application needs the frame on `π_HT^*W^∨ ≅ h^*ω` with a fixed Tate trivialisation; that form is corrected in (iii) (on `W^∨` itself the first `g` coordinate functions vanish at `Z = 0`, and the transport through the symplectic form costs `c(γ)`).

For `v=(−Zy;y), w=(−Zy′;y′), vᵀJ₀w=yᵀ(Z−Zᵀ)y′` with `J₀=−J`; this detects symmetry. Normalizing the lower Plücker coordinate makes the others ±minors of `Z`, so the integral chart is `|Z_ij|≤1`. Multiplication gives `(1,Z)γ=(A+ZC,B+ZD)`. Since `C≡0 mod p` and `A mod p` is diagonal invertible, `J_γ` is integral invertible. For `Z=Z₀+E, Z₀∈Sym_g(ℤ_p), |E|≤r`, let `M=J_γ(Z), M₀=J_γ(Z₀)`. Then `Z·γ−Z₀·γ=M⁻¹E(D−C(Z₀·γ))`, of norm `≤r`. Apply `γ⁻¹` for equality of domains. A disc only about zero fails the translation test below. Modulo `W, (u;w)≡(u+Zw;0)`, so `γe_j≡Σ_i(J_γ)_ij e_i` and the quotient-frame law follows. Applying this twice gives `J_{γγ′}(Z)=J_γ(Z)J_{γ′}(Z·γ)`. On `W^∨` the structure map is `f↦f∘γ⁻¹; ⟨γv,γw⟩=c(γ)⟨v,w⟩` gives the extra `c(γ)⁻¹`. Finally `⟨v,w⟩ζ_Ψ=e_λ(Ψv,Ψw)` gives the transported Tate-generator law.

([BHW], §2.2, Lemma 2.4, p. 8.)

([BHW], §2.2, Definition 2.2, p. 8.) The `g = 1` stable domain: the distance-to-`ℤ_p` neighbourhood, not a disc.

([BHW], §3.3, Lemma 3.19 and its proof, p. 13.)

([Scholze], §3.3, p. 1008.)

([BPS], §3.3, p. 35.) The Hodge–Tate quotient is `ω_{A^t}`, untwisted.

The API is `HodgeTate.siegelGraphChart`, .`siegelGraphChart_act, .det_factor_isUnit, .siegelGraphChart_stable`, .hodgeFrame, .`hodgeFrame_transform` and .graphDistanceDomain. These are the symmetric row-graph chart and its distance subdomains, fractional action, integral determinant congruence/unit bound, strict-Iwahori stability, untwisted quotient frame, its cocycle and multiplier-twisted W-dual transport, and the pointwise normed-field subset. Analytic realization and pulled-back frames remain geometric targets.

**Checks.**

- `graph_factor_g1`: For `g = 1, γ = (a b; c d)` and the chart point `(1 z): (1 z)γ = (a + zc)(1, (b + zd)/(a + zc))`.
- `graph_factor_identity`: For `γ = 1, A + ZC = 1` and `Z·γ = Z`.
- `graph_factor_cocycle`: For `γ, γ′` with the denominators invertible, (A + ZC) for `γγ′` equals `(A + ZC)·(A′ + (Z·γ)C′)` (matrix identity).
- `graph_unit_needs_iwahori`: For `g = 1, γ = (0 1; 1 0) ∉ K_{Iw⁺}` and `z = 0, A + zC = 0` is not a unit: the bound needs `C ≡ 0 mod` p.
- `graph_domain_not_disc`: For `g = 1` and `0 ≤ r < |p|, γ = (1 p; 0 1) ∈ K_{Iw⁺}` sends `z = 0` to `z·γ = p`, so `{|z| ≤ r}` is not `K_{Iw⁺}`-stable, while `p ∈ ℤ_p` lies in `Fl^×(r) = {dist(z, ℤ_p) ≤ r}`.
- For a nonempty matrix index, in the pointwise distance domain at radius zero, every symmetric matrix over the embedded `ℤ_p` belongs, including every integral unit in genus one. The zero matrix belongs at every nonnegative radius; a negative radius excludes it.
- Over an unramified quadratic extension of `ℚ_p`, a unit whose residue is outside `𝔽_p` has norm one but distance one from `ℤ_p`. For `0≤r<1` it is excluded in genus one, distinguishing distance to the embedded integers from a norm ball.
- `graph_chart_lagrangian`: For `g = 2` and the non-symmetric `Z = (0 1; 0 0), W =` colspace`(−Z; 1_2)` contains `v = (−1, 0, 0, 1)ᵗ` and `w = (0, 0, 1, 0)ᵗ` with `vᵗJw = 1 ≠ 0` for `J = (0 −1_2; 1_2 0)`, so `W` is not Lagrangian: the chart needs `Z = Zᵗ` (in general `vᵗJw = yᵗ(Zᵗ − Z)y′` for `v = (−Zy; y), w = (−Zy′; y′)`).
- For hodgeFrame in genus one over `ℚ`, `Z=0` sends the sum-indexed vector `(1,0)` to 1.
- For every finite matrix index and commutative ring `R`, the quotient frame has `ker(hodgeFrame Z) = {(−Zy,y) : y∈R^g}`. At `Z=2` in genus one over `ℚ`, these are exactly `(-2t,t)` with `t∈ℚ`.
- For hodgeFrame at `Z=2` over `ℚ`, the vector `(3,5)` maps to 13. These frame values and the kernel fix its coefficient order and graph sign.
- `hodge_frame_similitude`: For `γ = diag(1_g, u·1_g)` with `u ∈ 1 + pℤ_p, u ≠ 1` (in `K_{Iw⁺}, c(γ) = u, A + ZC = 1`): `γ^*s = s` but `γ^*s′ = u⁻¹s′`, so a frame of `π_HT^*W^∨` with a fixed Tate trivialisation does not satisfy the law A + ZC.

`g = 1`: our coordinate is `Z = −z` for BHW's `z` (`W = ⟨(−Z, 1)⟩ = ⟨(z, 1)⟩`, BHW's line), and BHW's left action is `γ·x = x·γ^∨` with `γ^∨ = (d −b; −c a)`; the factor A + ZC for `γ^∨` is `d − cZ = cz + d`, recovering `γ^*𝔰 = (c𝔷 + d)𝔰` with `𝔰(E, α) = HT(α(e_1)) = s_1` (BHW (3.4), Lemma 3.19 — whose statement misprints the right-hand side — and Proposition 3.21).

*Needs:* §3.3; §3.1; §1.30; `mathlib:Matrix.fromBlocks`; `mathlib:Matrix.det`; `mathlib:Matrix.J`.

### 3.5 The adic incarnation of T2’s open Hodge-type period map

Let `(G, X)` be of Hodge type, `K^p` sufficiently small, and `S_{K^p}/C` the open perfectoid representative supplied by Layer 2. The v-sheaf map of HodgeTateAndCanonicalSubgroups §2.12 is represented uniquely by an adic morphism `π_HT: S_{K^p} → FL^{an}_{G,μ}`. It inherits T2’s `G(ℚ_p)`-equivariance, prime-to-p Hecke equivariance (trivial action on the flag), embedding independence and geometric-point formula, transported to Layer 0’s right-action convention. Its composite with the Siegel flag embedding equals the Siegel period map. This construction identifies the representing analytic morphism; the construction on the open limit v-sheaf belongs to T2.

`(G, X)` of Hodge type with a fixed embedding into a Siegel datum (ShimuraData §4.2); `P_μ` is the Hodge–Tate parabolic `{g : lim_{t→0} Ad μ(t)g exists}, P_μ^std` the Hodge parabolic, `M_μ = Cent_G(μ)` their common Levi.

`K^p` sufficiently small (Layer 2); the tensors `s_{α,p}` are defined over `E` (Kisin, Deligne absolute Hodge; AutomorphicBundles §B1.2–B1.3).

The open-tower supplier is conditional on the completed relative-filtration transfer of HodgeTateAndCanonicalSubgroups §§2.6, 2.12 and the representable flag/torsor interfaces of ReductiveGroups Layers 7–8 and AutomorphicBundles §§B0.3–B0.5. A geometric-point assignment is insufficient. Fix `C` and the untilt in the fully faithful perfectoid-test description.

Identify `S_{K^p}^◇` with Layer 0’s open limit by Layer 2, then import HodgeTateAndCanonicalSubgroups §2.12. Use the analytic flag’s functor of points on perfectoid tests and the supplied fixed-base perfectoid/analytic Yoneda interface to obtain the unique adic morphism; do not assert full faithfulness for arbitrary analytic adic spaces. Transport T2’s equivariance and embedding independence through this representing identification. Compatibility with the Siegel analytic map follows from the same functorial relative filtration, not merely agreement at classical points.

([CS], §2.1, Theorem 2.1.3(1), p. 12.)

([CS], §2.3, after Lemma 2.3.7, p. 21.)

For the Siegel datum it is the restriction of the Siegel `π_HT` to the open tower.

For a unitary PEL datum it is the period map of Caraiani–Scholze.

*Needs:* §2.2; §2.9; §3.1; §3.2; AutomorphicBundles §§B1.4, B1.2–B1.3; HodgeTateAndCanonicalSubgroups §§2.3, 2.12; DiamondsAndVStacks §D6.4.

### 3.6 The perfectoid incarnation of T2’s Levi and automorphic-bundle pullback

On Layer 2’s open Hodge-type perfectoid representative, import HodgeTateAndCanonicalSubgroups §2.13 and identify it with the pullback along Layer 3’s adic `π_HT`. Thus `M_p ≅ M_dR ×^{μ,ℤ_p^×} ℤ_p(1)`, and an associated irreducible Levi representation `V_κ` of central `μ`-weight `⟨μ,κ⟩` satisfies `f_p(V_κ) ≅ f_∞(V_κ)(⟨μ,κ⟩)`, with the supplier’s Hecke linearizations. These identifications are independent of the Siegel embedding. Choosing a Tate generator gives an untwisted underlying-bundle isomorphism only after transporting its linearization. Layer 3 owns the representing identification and compactified extension, rather than reconstructing T2’s open-tower torsor theorem.

Representations of `P_μ` are inflated from `M_μ` (the opposite parabolic forces this; Caraiani–Scholze Remark 2.1.5).

Pull HodgeTateAndCanonicalSubgroups §2.13 through the Layer 2 representing isomorphism and identify its flag map with §3.5. Its universal parabolic/Levi pullback and associated tensor functor commute with that pullback. Retain HodgeTateAndCanonicalSubgroups §2.10’s central-cocharacter Tate twist. On the toroidal overlap this is AutomorphicBundles §B3.HT.7’s rational comparison: a Hodge `μ`-degree `a` has twist `−a`, while §B0.3’s opposite/dual coefficient identification gives the displayed `⟨μ,κ⟩` convention. The identification includes the dual coefficient, rather than only replacing `μ` by its inverse. Extend to compactifications only in §3.8 with its exact hypotheses.

([CS], §2.1, Theorem 2.1.3(2), p. 12.)

([BP25], §4.4.23, p. 74.) The twisted identification in the authors' manuscript.

([BP25], §4.4, Remark 4.4.12, p. 69.) The sign of the twist on vector bundles: `(π_HT^{tor})^*V_{κ,FL}(−⟨µ, κ⟩) = π^*_{K_p}V_{K^pK_p,κ,Σ}`.

For the modular curve and `V` the standard character of `M_μ = T` giving `ω, f_p(V) = π_HT^*𝒪(1)` and `f_∞(V) = ω`, with the twist of §3.10.

For the Siegel datum and `V = ∧^g` of the standard representation of `GL_g ⊆ M_μ`, it recovers §3.3 (vi).

*Needs:* AutomorphicBundles §§B3.HT.7, B0.3; §3.5; §3.1; AutomorphicBundles §§B2.1–B2.2, B1.5, B4.21, B1.7; HodgeTateAndCanonicalSubgroups §§2.13, 2.10.

### 3.7 Functoriality of the Hodge-type period map in morphisms of Shimura data

Let `f: (G₁, X₁) → (G₂, X₂)` be a morphism of Hodge-type Shimura data, choose cocharacters with `f ∘ μ₁ = μ₂, K₁^p, K₂^p` with `f(K₁^p) ⊆ K₂^p` sufficiently small, and `f̃: S_{K₁^p} → S_{K₂^p}` the induced `G₁(ℚ_p)`-equivariant map of open perfectoid towers (Layer 0 functoriality of canonical models through the diamond limits). Then `π_HT,₂ ∘ f̃ = FL(f) ∘ π_HT,₁`, where `FL(f): FL_{G₁,μ₁} → FL_{G₂,μ₂}` is induced by `f (f(P_{μ₁}) ⊆ P_{μ₂})`. The identity datum morphism gives the identity, and composition is respected.

`(G, X)` of Hodge type with a fixed embedding into a Siegel datum (ShimuraData §4.2); `P_μ` is the Hodge–Tate parabolic `{g : lim_{t→0} Ad μ(t)g exists}, P_μ^std` the Hodge parabolic, `M_μ = Cent_G(μ)` their common Levi. (for both data).

Caraiani–Scholze prove only independence of the Siegel embedding; the general datum-morphism statement is proved here by the same construction.

Choose Siegel embeddings `G₁ ↪ GSp(V₁), G₂ ↪ GSp(V₂)`. (A product embedding of `G₁` into `GSp(V₁) × GSp(V₂)` is not a Siegel datum unless the similitudes agree, `ν₁ = ν₂∘f`, so it is not used.) As in Caraiani–Scholze Lemma 2.3.7: the faithful representation `V₁` of the reductive `G₁` realises `V₂∘f` as `eV₁^⊗` for a `G₁`-invariant idempotent `e` of the tensor algebra `V₁^⊗` (tensors in `V₁, V₁^∨` and Tate twists); `e` is a Hodge tensor, absolute Hodge (AutomorphicBundles §B1.2–B1.3), and its p-adic realisation `e_p` gives `f̃^*(V_{2,p} ⊗ 𝒪̂) ≅ e_p(V_{1,p}^⊗ ⊗ 𝒪̂)`, matching the tensors `s_{α,p}`. `e_p` respects the relative Hodge–Tate filtrations: `e_p` is the image of `e_dR` under the relative p-adic–de Rham comparison, checked at points over number fields by Blasius and propagated because `e_p` and `e_dR` are horizontal (HodgeTateAndCanonicalSubgroups T2). Hence the isomorphism induced by `e_p` maps the pushout of `P_{p,1}` along `f: P_{μ₁} → P_{μ₂}` to `f̃^*P_{p,2}`, compatibly with the canonical sections given by the trivialisations of the Tate modules over the towers; so `π_HT,₂ ∘ f̃ = FL(f) ∘ π_HT,₁` as maps to the sheaf `FL_{G₂,μ₂}`. Identity and composition follow from the functorial tensor-frame construction. Equality is equality of maps to the flag sheaf; it is not inferred from agreement of underlying topological maps or of points over a single fixed field.

([CS], §2.3, Lemma 2.3.7 and the construction of `π_HT, pp. 20–21`.)

([CS], §2.3, proof of Lemma 2.3.7, p. 20.)

For the inclusion of the Siegel datum into itself it is the identity.

For the trace embedding of a Hilbert datum into a Siegel datum it gives the compatibility of hilbert-res-flag with the Siegel map.

*Needs:* §3.5; AutomorphicBundles §§B1.2–B1.3, B1.7; ShimuraVarieties §§8.5, `P.1`; DiamondsAndVStacks §D4.9; HodgeTateAndCanonicalSubgroups §§2.12, 2.9.

### 3.8 The Hodge-type period map on the image and genuine minimal compactifications and on perfect toroidal towers

Let `(G, X)` be of Hodge type. (a) On Scholze's image-compactified tower `𝒳^{*̲}_{K^p}` (Layer 2 §2.3) there is a `G(ℚ_p)`-equivariant map `π_HT: 𝒳^{*̲}_{K^p} → FL_{G,μ}`, pulled back from the Siegel period map through `FL_{G,μ} ↪ FL_{GSp,μ̃}` (Zariski closed); it is affinoid (`FL_{G,μ}` has a cover by affinoids whose preimages are good affinoid perfectoid), compatible with tame level and prime-to-p Hecke operators, and `π_HT^*ω_Fl ≅ ω(−g)` for the fixed Siegel embedding of genus `g` (untwisted after a chosen Tate trivialization with transported linearization) (Scholze Theorem 4.1.1(iii)–(v)). (b) On the genuine minimally compactified tower `𝒳*_{K^p}` (Layer 2 §2.5), `π_HT` is the composite `𝒳*_{K^p} → 𝒳^{*̲}_{K^p} → FL_{G,μ}`. (c) Use AutomorphicBundles §B3.HT.6’s strictly compatible complete smooth projective Hodge/Siegel fan pair `(Σ,Σ̃)` at an initial principal level, with polarization functions and trivial effective cone stabilizers, and induce both fans at every deeper level without inserting subdivisions. Such pairs refine any prescribed finite list at the initial level. Then `𝒳^{tor}_{K^p,Σ} ~ lim 𝒳^{tor}_{K^pK_p,Σ}` is perfectoid with a closed immersion into the Siegel toroidal tower for `Σ̃, π_HT^{tor}` is the composite with the map to the minimal compactification, the pullback of the Levi torsor is `M_dR^{can} ×^{μ,ℤ_p^×} ℤ_p(1)` for the canonical extension `M_dR^{can}` of the Hodge-type de Rham Levi torsor, pulled back from finite level (Boxer–Pilloni Proposition 4.4.29, after Esnault–Harris), and these isomorphisms are compatible with the `G(𝔸_f)`-action on the limit over `K^p` and `Σ`. The three compactified towers are distinct: the auxiliary normalised models of §3.9 are a fourth object, only their generic fibres being minimal compactifications.

(c) uses precisely AutomorphicBundles §B3.HT.6’s induced-fan range. Common refinements are made at the initial level and induced through their own towers. The closed immersion, boundary ideals and finite flat level transitions are part of that supplier contract; a compatible fan map alone does not give them.

Through (b), the genuine tower uses the perfectoidization gap of Layer 2.

(a) The Siegel `π_HT` pulled back to `𝒳^{*̲}_{K^p}` lands in `FL_{G,μ}` over the dense open tower (§3.5); `FL_{G,μ}` is Zariski closed and the perfectoid space is reduced with nowhere dense boundary, so it lands there everywhere (argument as in Scholze Corollary 3.3.17’s uniqueness); the remaining properties pull back from the Siegel case. (b) Compose with Layer 2 §2.8. (c) Identify AutomorphicBundles §B3.HT.6’s represented toroidal limit with this tower by the identity on the same finite-level Hodge-type moduli spaces. On each Siegel chart its completed quotient system, perfectoidization and reduced boundary ideal are the supplied ones. The period map is the same tensor-defined restriction of the Siegel map, agrees with §3.5 on the open and with (b) after passage to the minimal tower, and respects common fan refinements.

The rational Levi comparison here is the pullback of AutomorphicBundles §B3.HT.7’s torsor isomorphism on that same tower, transported through §B0.3’s opposite/dual coefficient identification. Its ringed pro-Kummer realization and descent agree with HodgeTateAndCanonicalSubgroups §7.36 and §3.6 on the open. In Hodge `μ`-degree `a` the twist is `−a`; in the opposite/dual convention used here it is `⟨μ,κ⟩` on `V_κ`. Thus the displayed central-cocharacter Tate torsor and all Galois, level and Hecke linearizations are retained. This comparison is rational, including at `p=2`.

([BP21], §4.4.27, p. 74.)

([BP25], §4.4.25, p. 75.)

([Lan], Propositions 4.9–4.10, p. 14, and §6, Proposition 6.1, pp. 18–20.) Strictly compatible fans and their induced towers.

([Scholze], §4.1, footnote 16, p. 1018.) Scholze leaves the factorisation through the Hodge-type flag variety open; it is supplied by the Zariski-closure argument.

For the Siegel datum, (a) and (b) are Layer 1 §1.27 and (c) is the toroidal Siegel map.

**Checks.**

- For the identity Siegel embedding the finite-level maps, completed chart rings, boundary ideals and period maps are exactly §1.29’s and AutomorphicBundles §B3.HT.5’s.
- A strictly compatible fan pair at each level can still insert the quadrant blow-up between levels. Its exceptional `ℙ¹` shows that strict compatibility alone does not ensure finite transitions; the fans must be induced from the initial pair.
- In Hodge `μ`-degree `a`, tensoring adds `−a` and dualizing reverses its sign. The tensor unit has twist zero; the polarization pairing retains its Tate line under the opposite/dual identification.
- The full tower over `C` includes every similitude fibre. Restriction to the fixed-pairing fibre commutes with the comparison, but that closed fibre is generally not open and its stabilizer acts with the cyclotomic/Tate linearization.

*Needs:* AutomorphicBundles §§B3.HT.6–B3.HT.7, B0.3; §3.5; §3.6; §3.3; §2.3; §2.5; §2.8; §1.29; §1.27; ShimuraCompactifications `C3.general`; ShimuraCompactifications §§C3.2, C3.1, C3.general.1; AutomorphicBundles §§B3.2–B3.4, B3.general.3; PerfectoidTowers §P8.21; HodgeTateAndCanonicalSubgroups §7.36.

### 3.9 Auxiliary normalised formal models with ample Hodge line and Hodge–Tate sections

Siegel case (Pilloni–Stroh, author's version, Théorème 1.22, after Scholze's proof of Theorem 4.3.1, pp. 1029–1030): put `B(g,p) = g/(p − 1)` for odd `p` and `B(g,2) = 2g`; let `n₀` be the least integer `> B(g,p)` (so `n₀ = 2g + 1` if `p = 2`). For `n ≥ n₀` there are normal admissible formal models `𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT}` of the minimal compactification `𝒳(pⁿ)^⋆` of the level-`Γ(pⁿ)K^p` Siegel variety (over `𝒪_{ℂ_p}`), the first a normalised blow-up on which `det ω^{mod}` (the subsheaf of `det ω` generated by `Λ^g HT_n`, with cokernel killed by `p^{g/(p−1)}`, resp. `4^g` for `p = 2`) is invertible, the second covered by the affine formal schemes `Spf H⁰(𝔘_i(pⁿ), 𝒪)` for the Lagrangian Plücker charts `i`; for some `k ≥ 1, det^k ω^{mod}` descends to an ample invertible sheaf on `𝔛(pⁿ)^{⋆−HT}`, and there are sections `t_j` of `det^k ω^{mod}` modulo `p^{n₀−g/(p−1)}` (modulo `p^{n₀−2g}` if `p = 2`) congruent to the k-th powers of the Plücker coordinates of `Λ^g HT`; the transition maps `𝔛(pⁿ)^{⋆−HT} → 𝔛(p^m)^{⋆−HT}` are finite and everything is functorial in `n` and `K^`p. Scholze's own version gives, for each `n`, a level `K_p` and sections modulo `pⁿ`. Hodge type (Pilloni–Stroh Proposition 2.5): the normalisation of the schematic closure of the Hodge-type minimal compactification in the Siegel model, with the same ampleness and sections; the Hilbert–Siegel case is Boxer–Calegari–Gee–Pilloni §6.2.1. These are auxiliary normalised compactifications: only their generic fibres are the canonical minimal compactifications; they carry no semi-abelian scheme, boundary stratification or ordinary locus (Pilloni–Stroh Remarque 1.26). The stronger form used by Pilloni (§12.9.1) and Boxer–Calegari–Gee–Pilloni (§6.2.1), with `det ω^{mod}` itself descending and sections congruent modulo `p^ε` for every `ε > 0` once `n ≥ n(ε)`, is not proved in the cited sources (Pilloni–Stroh Remarque 1.23 states the descent of `det ω^{mod}` without proof); the consumers' arguments go through with a power of `det ω^{mod}` and sections modulo a fixed `p^{ε′}`.

Siegel or Hodge-type (PEL) data; neat tame level; charts indexed by Lagrangian Plücker coordinates only (the published statements use all indices).

The modified-model statement here uses Théorème 1.22 in the linked author version; the theorem numbers in the downstream citations are not used to identify that statement.

Before the `p=2` branch, this roadmap constructs the following integral input. For a normal admissible `O_{C_p}`-algebra `R` and a truncated Barsotti–Tate group `H/R` of level `n>2` and height `h`, with a full frame `H(R)≅(ℤ/2^n)^h`, prove that the cokernel of `HT:H(R)⊗R→ω_{H^D}` is annihilated by every scalar of valuation at least 2, normalized by `v_2(2)=1`. Extend this estimate across normal toroidal boundary charts using the semi-abelian 1-motive and the compatible truncated Hodge–Tate sections. On the normalised minor modification obtain `4ω⊆ω^mod⊆ω` and the surjection modulo `2^{n−2}`. Taking top exterior powers gives `2^{2g}detω⊆detω^mod⊆detω`; descend these determinant sections to the minimal Stein model, giving loss `2g` and `n₀=2g+1`. The modified-model conclusion at 2 carries this local estimate and boundary extension as hypotheses. HodgeTateAndCanonicalSubgroups §§5.5–5.6 supplies only the odd-prime modified lattice and model.

The proof target is the replacement-constant-2 version of [PS] Théorème 1.9, Remarque 1.10 and Lemme 1.12, using HodgeTateAndCanonicalSubgroups §0.5's all-prime integral cokernel estimate on geometric fibres and the normal admissible chart extension of [PS] Remarque 1.11. Prove the relative truncated estimate and its 1-motive boundary extension before applying the minor modification and determinant descent; perfectoid representability alone supplies neither.

Normalise the formal minimal compactification at level `pⁿ` (Pilloni–Stroh §1.1 normalisation, Proposition 1.13); `Λ^g HT_n` generates `det ω^{mod} ⊆ det ω` up to `p^{g/(p−1)}` (Fargues), so `det ω^{mod}` is invertible on the modified model (Corollaire 1.16 for the descent of `ω^{mod}` and the classes `HT(e_i)`). Approximate the infinite-level Plücker sections on the Lagrangian charts by finite-level sections (density from Layer 1 §1.28 (i); Lemma 1.20) and take norms down to level `n₀` (Lemma 1.21), giving the `t_j` for `det^k ω^{mod}`. The affine charts glue to the Stein factorisation of the semi-ample `det^k ω^{mod}`, giving `𝔛(pⁿ)^{⋆−HT}` with `det^k ω^{mod}` ample (Théorème 1.22, Remarque 1.25). Hodge type: pull back along the Siegel embedding and normalise (Proposition 2.5).

([PS], §1.19, Théorème 1.22 and Remarques 1.23–1.26, PDF pp. 8–10.)

([PS], §1.19, Remarque 1.26, PDF p. 10.)

([Pilloni], §12.9.1, p. 81.)

([BCGP], §6.2.1, arXiv pp. 144–145.)

([PS], §1.8, Théorème 1.9 and Remarques 1.10–1.11, p. 5 (author version).) Odd-prime cokernel estimate; the `p = 2` bound is explicitly an unwritten input.

For `g = 1` the Plücker coordinates are `HT(e_1), HT(e_2); 𝔛(pⁿ)^{⋆−HT}` is the Stein factorisation of the semi-ample `det^k ω^{mod}` on `𝔛(pⁿ)^{⋆−mod}`, and the sections `t_1, t_2` have no common zero on `𝔛(pⁿ)^{⋆−HT}` modulo `p^{n₀−g/(p−1)}` (modulo `p^{n₀−2g}` for `p = 2`) (Pilloni–Stroh Remarque 1.25).

The contraction `𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT}` identifies ordinary with non-ordinary points and interior with boundary points (Pilloni–Stroh Remarque 1.26), so `𝔛(pⁿ)^{⋆−HT}` carries no universal semi-abelian scheme and no ordinary locus.

**Checks.**

- At `g=1, p=2`, the determinant loss is 2, so `n₀=3` and the section congruence at the first level is modulo 2.
- At `g=2, p=2`, exterior powers of `4ω⊆ω^mod` give `16detω⊆detω^mod`; `n₀=5`, rather than the level predicted by the odd-prime formula.
- On the ordinary locus the Hodge–Tate image already spans `ω`; the minor modification is the identity and the bound `4ω⊆ω` holds. At a toroidal cusp the estimate must survive the semi-abelian boundary extension before determinant descent.

*Needs:* §1.28; §3.3; AdicSpacesPartIII §R2.5; HodgeTateAndCanonicalSubgroups §§0.5, 0.18, 5.5, 5.6; ShimuraCompactifications §§C5.16–C5.20.

### 3.10 The elliptic period map: quotient-line description, `π_HT^*𝒪(1) = ω` and the automorphy factor `cz + d`

Let `𝒳*_{Γ(p^∞)}` be the perfectoid modular curve (`g = 1` of Layer 1) over a perfectoid `L ⊇ ℚ_p^cycl`, with points (`E, μ_N`-level, `α: ℤ_p² ≅ T_pE`) and BHW's left action `γ·(E, α) = (E, α ∘ γ^∨), γ^∨ = det(γ)γ⁻¹`, i.e. `γ·x = x·γ^∨` for the right action `x·f = (E, α ∘ f)` of Layer 0 (`γ ↦ γ^∨` is an anti-automorphism, `(γδ)^∨ = δ^∨γ^∨`, so it turns the right action into a left action). (i) The C-points of the total space of `𝒪(1)` over `ℙ¹` are pairs `(L, y)` of a line `L ⊆ C²` and `y ∈ C²/L`, and `π_HT^*𝒪(1) ≅ ω` is the quotient-line identification `C²/L ≅ ω_E` through `HT ∘ α (HT: T_pE → ω_E, L = ker(HT ∘ α))`; this form needs no Tate trivialisation. (ii) The section `s: (x : y) ↦` (`C² → C²/⟨(x, y)⟩`, image of (1, 0)) of `𝒪(1)` is nowhere zero off `∞ = (1 : 0)`; for `γ = (a b; c d) ∈ Γ₀(p)` one has `γ^*s = (cz + d)s`, where `z` is the coordinate of `(z : 1)`; hence `𝔰 := π_HT^*s` satisfies `γ^*𝔰 = (c𝔷 + d)𝔰` on the anticanonical locus and `𝔰(E, α) = HT(α(e_1))`. (iii) In Pan's normalisation (`V = ℚ_p²` the standard representation, Tate module `V(1) = V^∨`), the relative Hodge–Tate sequence is `0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0`, the position of `ω⁻¹` defines `π_HT: 𝒳 → ℙ¹`, and the tautological ample `ω_Fl` pulls back to `ω(−1)`. (iv) Unlike the complex case (`γ^*η_can = (cz + d)⁻¹η_can`, trivialising `ω_E`), the p-adic section trivialises `ω_{E^∨}` and transforms with `(cz + d)`.

Modular curve of tame level `K^p ⊆ GL_2(𝔸_f^p)` with `Γ(N), N ≥ 3`, or `Γ₁(N), N ≥ 4`, prime to `p` (BHW), or neat `K^p` (Pan).

The statement of BHW Lemma 3.19 misprints `γ^*s = (cz + d)γ` for `(cz + d)s`.

Import T2’s open-tower map and quotient-bundle identification. This construction identifies its analytic incarnation and the stated convention on Layer 2’s representative; compactified extensions require Layer 3’s extension theorem. (i) is Scholze Theorem 3.3.18(vi) for `g = 1` (§3.3), unwound on points (BHW Lemma 3.17). (ii) The equivariant structure on `𝒪(1)` compatible with BHW's action is `γ ↦ det(γ)⁻¹γ`, so `γ⁻¹` acts by `γ^∨` and `γ^*s(z) = γ^∨(1, 0) = (d, −c) ≡ (cz + d, 0)` modulo `⟨(z, 1)⟩` (BHW Lemma 3.19); `𝔰(x) = HT(α(e_1))` (BHW Proposition 3.21). (iii) Pan §3.1.1 from Scholze, with the Tate twists kept; (iv) BHW Remark 3.23.

([BHW], §3.3, formula (3.2), Lemma 3.17, Definition 3.18, Lemma 3.19, Proposition 3.21, Remark 3.23, pp. 12–14.)

([Pan], §3.1.1, sequence (3.1.1), p. 17.) Pan's twist normalisation.

For `γ = (1 0; p 1) ∈ Γ₀(p), γ^*𝔰 = (p𝔷 + 1)𝔰`, a unit multiple on the anticanonical locus where `|𝔷| ≤ 1`.

The weight-k specialisation: sections of `ω^{⊗k}` on the anticanonical locus are `f𝔰^k` with `γ^*f = (c𝔷 + d)^{−k}f`.

*Needs:* §3.3; §3.1; §1.27; AutomorphicBundles §B4.10; ShimuraVarieties §8.16; HodgeTateAndCanonicalSubgroups §§2.12, 2.13.

### 3.11 The Hecke-equivariant relative Hodge–Tate sequence of the modular curve

On the perfectoid modular curve `𝒳_{K^p}` over `C`, let `D` be the canonical extension of `H¹_dR` of the universal elliptic curve at finite level, with `Fil¹D = ω` and `gr⁰D = ∧²D ⊗ ω⁻¹`. The sequence `0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0` depends on an implicit trivialisation `c ∈ H⁰(∧²D)` (`a GL_2(Ẑ)`-fixed nowhere vanishing section, on which `GL_2(𝔸_f)` acts through `|det|_𝔸⁻¹`) and is not equivariant for the prime-to-p Hecke action; the Hecke-equivariant form is `0 → ∧²D ⊗ ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0` (Pan (4.2.1)). Taking `∧²` gives `𝒪 ≅ (∧²D)⁻¹ ⊗ 𝒪 ⊗ det(1)` with `t = c⁻¹ ⊗ 1 ⊗ b` for a fixed basis `b` of `ℚ_p(1)`, and the identifications (4.2.2)–(4.2.3) of Pan are independent of the trivialisations of `∧²D` and `ℚ_p(1)`. (Pan prints `gr¹D` for the subobject; by his own convention `Fil¹D = ω` it is `gr⁰D`.)

Modular curve, neat tame level; `D` with its Hodge filtration and Kodaira–Spencer isomorphism (AutomorphicBundles B2/B3).

The subobject of the relative Hodge–Tate sequence is identified, Hecke-equivariantly, with `gr⁰` of the de Rham bundle tensored with `𝒪(1)` (Pan's construction in Pan 2022, 4.1.3); the untwisted form chooses `c`. Compute the Hecke action on `c` through the adelic norm of the determinant, and take `∧²`.

([Pan], §4.2.3, sequences (4.2.1)–(4.2.3), p. 38.) The Hecke-equivariant correction.

([Pan], §4.2.3, p. 38.)

Under the choice of `c, (4.2.1)` becomes (3.1.1) of §3.10 (iii).

*Needs:* §3.10; §3.6; AutomorphicBundles §§B3.2–B3.4, B2.6.

### 3.12 The Hilbert period map to `Res_{𝒪_F/ℤ}ℙ¹` and its factors after splitting

Let `F` be totally real of degree `g, G* = Res_{F/ℚ}GL_2 ×_{Res G_m} G_m` the Hodge-type Hilbert datum (ShimuraData §5.4) with its trace-form embedding, and `𝒳_{Γ*(p^∞)}` the open perfectoid Hilbert tower over `L=C` complete algebraically closed, with the fixed embedding `ℚ_p^cycl→C`. (i) The flag variety of `G*` is `Res_{𝒪_F|ℤ}ℙ¹`, the adic analytification of `R ↦ ℙ¹(R ⊗_ℤ 𝒪_F)`, and `π_HT: 𝒳_{Γ*(p^∞)} → Res_{𝒪_F|ℤ}ℙ¹` sends `(A, α: 𝒪_p² ≅ T_pA^∨)` to the `𝒪_p ⊗` C-line given by `0 → Lie(A^∨)`(1) `→ T_pA^∨ ⊗ C → ω_A → 0` (the dual Tate module, unlike the elliptic case). (ii) `ω_{Γ*(p^∞)} = π_HT^*Res_{𝒪_F|ℤ}𝒪(1), Res G_m`-equivariantly, with the section `s = Res s_ell, 𝔰 = π_HT^*s, 𝔰(A, α) = HT_A(α(1, 0))`, and `γ^*𝔰 = (c𝔷 + d)𝔰` for `γ ∈ Γ*₀(p)`, where `c𝔷 + d: Res Ĝ_a → Res Ĝ_m`. (iii) After a complete algebraically closed extension `L′` of `L=C` with the chosen splitting of `F` `(𝒪_F ⊗ L′ = ∏_{v∈Σ} L′, Σ = Hom(𝒪_F, L′)), Res ℙ¹ = (ℙ¹)^Σ, Res 𝒪(1) = ⊕_v π_v^*𝒪(1), s = Σ_v s_v` and the coordinates `z_v` are functions; over `C` the factors depend on the chosen embeddings; without those choices the restriction-of-scalars description is intrinsic. The extension of `π_HT` to the intermediate and arithmetic Hilbert towers of `G = Res_{F/ℚ}GL_2` (through `(x, u) ↦ diag(u, 1)·π_HT(x)` on the span, polarization invariance and descent) is not part of this construction: it is owned by §5.10, which builds on this construction.

Totally real `F, p` arbitrary; `𝒳_{Γ*(p^∞)}` is the open perfectoid tower of the Hodge-type (PEL) datum `G*` (§3.5), with BHW's moduli description `(A, α: 𝒪_p² ≅ T_pA^∨)`.

Import T2’s open-tower map and quotient-bundle identification. This construction identifies its analytic incarnation and the stated convention on Layer 2’s representative; compactified extensions require Layer 3’s extension theorem. (i) Caraiani–Scholze Theorem 2.1.3 for `G*` (§3.5), with the flag variety identified with `Res ℙ¹` through the `𝒪_F`-linear Hodge–Tate filtration (BHW Remark 5.15). (ii) Caraiani–Scholze Theorem 2.1.3(2) in the quotient form (§3.6), fibrewise through `HT: 𝒪_p² ⊗ C → T_pA^∨ ⊗ C → ω_A` (BHW Proposition 5.25, Lemma 5.32); the automorphy factor is checked after extending `L` until `F` splits, where it is the product of elliptic factors (BHW Lemma 5.29). (iii) Base change of `Res` along a splitting field.

([BHW], §5.3, p. 23.)

([BHW], §5.4, Remark 5.21, p. 25.) Components only after splitting.

For `F = ℚ` it is §3.10 (with `T_pA^∨ ≅ T_pA` through the principal polarization).

For `F` real quadratic and `p` split, after base change `Res ℙ¹ = ℙ¹ × ℙ¹` and `𝔰 = 𝔰_1 + 𝔰_2` with each `𝔰_v` transforming by `c_v𝔷_v + d_v`.

*Needs:* §3.5; §3.6; §3.10; §3.7; `mathlib:NumberField.RingOfIntegers`; ShimuraData §5.4; HilbertModularVarietiesAndShimuraCurves §H0.0; AutomorphicBundles §§B4.12, B4.14; HodgeTateAndCanonicalSubgroups §§2.12, 2.13.

### 3.13 A basis of affinoids of the flag variety with affinoid perfectoid preimages from finite level

For the Siegel datum (and, by pullback along §3.8 (a), for Hodge-type data), there is a basis `𝔅` of open affinoid subsets of Fl, stable under finite intersections, such that for every `U ∈ 𝔅` the preimage `V_∞ = π_HT⁻¹(U) ⊆ 𝒳*_{Γ(p^∞)}` is affinoid perfectoid, is the preimage of an affinoid `V_{K_p} ⊆ 𝒳*_{K_pK^p}` for all sufficiently small `K_p`, and `colim_{K_p} H⁰(V_{K_p}, 𝒪) → H⁰(V_∞, 𝒪)` has dense image. For `g = 1` one may take `𝔅 =` finite intersections of rational subsets of `U₁ = {|x| ≤ 1}` and `U₂ = {|x| ≥ 1}`.

Siegel datum with Layer 1's tame level, or Hodge type through the image compactification.

Take `𝔅 =` rational subsets of the Lagrangian charts `Fl_J`; Layer 1 §1.28 (i) gives the charts, and rational subsets of good affinoid perfectoids are good (PerfectoidSpaces §P7.4, Scholze's survey Proposition 2.22(ii)). On overlapping admissible Plücker charts, express chart membership and rational domains by the corresponding finite inequalities between Plücker coordinates. Their finite intersections are rational domains in a containing chart, and their pullbacks are rational domains in good affinoid perfectoids. Use these explicit inequalities to form an intersection-stable basis; separatedness alone does not imply that intersections of affinoids are rational.

([Pan], §3.2.1, pp. 18–19.)

([Scholze], §3.1, Theorem 3.1.2(iii), p. 972.)

For `g = 1` the basis consists of the rational subsets of the two discs of `ℙ¹`, as in Pan §3.2.1.

*Needs:* §1.28; §3.8; PerfectoidSpaces §P7.4.

### Examples

For genus one, `A=a, B=b, C=c, D=d` gives `z·γ=(b+zd)/(a+zc)` and frame factor a+zc. The quotient frame and W-dual frame differ by `c(γ)⁻¹`. At `γ=(0 1;1 0), z=0` the denominator vanishes, so integral-chart stability requires the actual Iwahori hypotheses. A graph neighbourhood includes a small ball about every integral matrix, including 1.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 4: pre-abelian representability

### 4.1 Property `𝒫`: perfectoidness of all minimally compactified towers of a datum

A Shimura datum `(G, X)` satisfies Property `𝒫` if for every compact open `K^p ⊆ G(𝔸_f^p)` the diamond `𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇` over `Spd C` is a perfectoid space; equivalently (§4.2) the neutral-component diamonds `𝒳*_{K^p}(G, X)⁰` are perfectoid for every `K^`p. A connected Shimura datum `(G, X⁺)` satisfies Property `𝒫` if for every arithmetic subgroup `Γ` the diamond `𝒳*_{Γ,∞}(G, X⁺) = lim_{K_p} 𝒳*_{Γ∩K_p}(G, X⁺)^◇` is perfectoid, with `Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p)`. For the connected definition we take `Γ ⊆ G(ℚ)_+` arithmetic with `K_p ⊆ G(ℚ_p)` compact open; for `G` adjoint this coincides with Hansen–Johansson's reading `Γ ⊆ G^ad(ℚ)^+`, and Layer 4 uses their reading only in that case. For `G` semisimple but not adjoint the towers of `Γ` and of its image `π(Γ)` in `G^ad` are in general not isomorphic (§4.3).

Over `C` as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism `ℂ ≅ ℂ_p` to a complete algebraically closed `C ⊇ ℂ_p`; the comparison with the canonical-model formulation over `E ⊆ C` is §4.7.

Hansen–Johansson's Definition 5.17 intersects `Γ ⊆ G^ad(ℚ)^+` with `K_p ⊆ G(ℚ_p)`, which is consistent only for `G = G^ad`; the reading above is the one their Proposition 5.18 uses. A connected Shimura datum here has `G` semisimple, as in Hansen–Johansson §4.1, Remark 4.2, p. 23; it is not an arbitrary reductive group with a positive-dimensional centre.

Definition; the connected towers are those of §0.5 (connectedDatumTower), with minimal compactifications of arithmetic quotients supplied by ShimuraVarieties V2 (supplier contract).

([HJ], §5.3, Proposition 5.16 and Definition 5.17, p. 36.)

([HJ], §5.3, Definition 5.17, p. 36.)

The API is `ShimuraTower.PropertyP`, `ShimuraTower.ConnectedPropertyP`, .`propertyP_iff_neutral, .propertyP_of_adjoint, .propertyP_hodge` and .`propertyP_iso`: full/connected perfectoidness, the neutral-component criterion, adjoint descent, the Hodge case and invariance under isomorphisms of data.

**Checks.**

- `propertyP_siegel`: The Siegel datum `(GSp_2g, H_g^±)` satisfies Property `𝒫`.
- `propertyP_torus`: A torus datum satisfies Property `𝒫`: its towers are profinite sets over `Spd C`, whose diamonds are affinoid perfectoid (DiamondsAndVStacks §D4.6).
- `propertyP_not_open_only`: For `G = GL_2` the diamond `𝒳*_{K^p}(G, X)` is quasicompact (a limit of projective curves, a spatial diamond), while the open tower `𝒳_{K^p}(G, X)` is not quasicompact; Property `𝒫` is the statement about the former.
- `propertyP_level_independent`: Property `𝒫` at one cofinal level family is Property `𝒫` at all (PerfectoidSpaces §P7.9 for diamonds of cofinal subsystems).

The Siegel datum satisfies Property `𝒫` (Layer 2 §2.4).

A Hodge-type datum satisfies Property `𝒫` (Layer 2 §2.5 over `C`, through the identification of the canonical-model towers with the complex towers made in §4.4).

*Needs:* §0.5; §0.4; ShimuraVarieties Layer 2; ShimuraData Layer 4; HodgeTateAndCanonicalSubgroups §2.3; ShimuraVarieties §P.1; ShimuraData §4.1–4.2; PerfectoidSpaces §P7.9.

### 4.2 The full tower is perfectoid iff the neutral-component tower is

For a Shimura datum `(G, X)` over `C`, the following are equivalent: (1) `𝒳*_{K^p}(G, X)` is perfectoid for every `K^p`; (2) `𝒳*_{K^p}(G, X)⁰` is perfectoid for every `K^`p.

`(1 ⇒ 2): 𝒳*_{K^p}(G, X)⁰ = ⋂_{K_p} X_{K_p} = lim_{K_p} X_{K_p}`, where `X_{K_p} ⊆ 𝒳*_{K^p}(G, X)` is the open and closed subfunctor over the finite-level neutral component; it is only closed. For an open affinoid perfectoid `U ⊆ 𝒳*_{K^p}(G, X)`, each `U ∩ X_{K_p}` is open and closed in `U`, hence affinoid perfectoid (cut out by an idempotent), and `U ∩ 𝒳*_{K^p}(G, X)⁰ = lim_{K_p}(U ∩ X_{K_p})` is a cofiltered limit of affinoid perfectoids, hence affinoid perfectoid (PerfectoidSpaces §P5.3: the limit in perfectoid spaces represents the limit functor); varying `U` covers `𝒳*_{K^p}(G, X)⁰` (Hansen–Johansson's argument for Proposition 5.16). `(2 ⇒ 1): π₀(𝒳*_{K^p}(G, X))` is the profinite set `cl(G(ℚ)_+)\G(𝔸_f)/K^p` (§0.4, without the simply connected hypothesis via finiteness of class numbers, Borel); `K_p` acts with finitely many open orbits; each component is the image of a neutral-component tower at a conjugate tame level under `T_{g_p}` and a prime-to-p Hecke translation. Apply PerfectoidTowers §P8.17 (Hansen–Johansson Lemma 5.1) to the spatial diamond `𝒳*_{K^p}(G, X)` with its `K_p`-action.

([HJ], §5.3, Proposition 5.16 with proof, pp. 35–36.)

([HJ], §5.3, proof of Proposition 5.16, p. 36.)

For `GL_2`, both towers are perfectoid (the perfectoid modular curve and its neutral component).

*Needs:* §4.1; §0.4; §0.5; HodgeTateAndCanonicalSubgroups §2.2; PerfectoidTowers §P8.17; PerfectoidSpaces §P5.3; ShimuraVarieties §0.5.

### 4.3 Property `𝒫` descends from the adjoint connected datum

Let `(G, X)` be a Shimura datum or a connected Shimura datum with `G` semisimple. If `(G^ad, X⁺)` satisfies Property `𝒫`, then so does `(G, X)`.

Uses the perfectoidization of integral algebras through PerfectoidTowers §P8.18 (conditional on the integral-algebra perfectoidization input below).

For connected semisimple `G, π` has finite central kernel `Z`. The arithmetic `π(Γ)` and level equality `π(Γ)∩π(K_p)=π(Γ∩Z(ℚ_p)K_p)` give finite comparison maps from the `π(Γ∩K_p)`-tower to the `π(Γ)∩π(K_p)`-tower. The `π(K_p)` are cofinal by openness of `π` on local points. Apply PerfectoidTowers §P8.18 to the perfectoid adjoint target. Equality of these towers is unnecessary and can fail: for `G=SU(2,1)` over `ℚ(i), p≡1 mod 12`, one has `Z(ℚ)=1, Z(ℚ_p)=μ₃`; an arithmetic `Γ` dense in a compact open approaches nonrational central elements, preventing mutual cofinality of the two arithmetic level systems. For a full datum, use §4.2 and choose congruence `Γ` in the adjoint group containing the tame image. The neutral tower with levels `π(G(ℚ)_+∩K^pK_p)` maps finitely to its `Γ∩π(K_p)`-tower (ShimuraVarieties §§2.5–2.9); cofinality and the same finite-tower theorem complete the descent. Arithmeticity of `π(Γ)` uses Platonov–Rapinchuk Theorem 4.1.

([HJ], §5.3, Proposition 5.18 with proof, p. 36.)

([HJ], §5.3, proof of Proposition 5.18, connected case, p. 36.)

For `G = GL_2, (G^ad, X⁺) = (PGL_2, ℍ)` and the statement deduces the perfectoid modular curve from the perfectoid tower of `PGL_2`-congruence quotients of `ℍ`.

*Needs:* §4.1; §4.2; ShimuraVarieties Layer 2; PerfectoidTowers §P8.18; PerfectoidSpaces §P7.9; ShimuraVarieties §0.1.

### 4.4 For a Hodge-type datum, the adjoint connected datum has Property `𝒫`

Let `(G, X)` be a Shimura datum of Hodge type. Then for every arithmetic subgroup `Γ ⊆ G^ad(ℚ)^+`, the diamond `𝒳*_{Γ,∞}(G^ad, X⁺) = lim_{K_p ⊆ G^ad(ℚ_p)} 𝒳*_{Γ∩K_p}(G^ad, X⁺)^◇` over `C` is a perfectoid space.

Uses Layer 2 §2.6 (stated over `C`) and PerfectoidTowers P8 quotients of good towers; through these, the perfectoidization of integral algebras (conditional on the integral-algebra perfectoidization input below).

Base-changing the canonical E-model and its minimal compactification through `E⊂ℂ≅ℂ_p⊂C` identifies the towers and neutral closures with Hansen–Johansson §5.3; this uses ShimuraVarieties §§6.2, 8.18–8.19, rather than §4.7 below. Choose congruence `Γ′=K∩G(ℚ)_+` with `π(Γ′)⊆Γ`, and `Γ″=Γ′∩G^der(ℚ)`. Choose cofinal `K_{p,n}` with derived intersection `K^der_{p,n}, Γ″⊆K^der_{p,0}` and `K^der_{p,0}∩Z_G(ℚ_p)={1}`. Then `π` is injective on `Γ″` and `π(Γ″∩K_{p,n})=π(Γ″)∩π(K^der_{p,n})`. The associated finite tower maps land in §2.6's good tower. Let `Γ‴` be the normal core of `π(Γ″)` in `Γ`. The quotients `Δ_n=(Γ‴∩π(K^der_{p,n}))\ (Γ∩π(K^der_{p,n}))` embed in the fixed finite `Γ/Γ‴` and form decreasing subgroups, hence stabilize. PerfectoidTowers §§P8.18–P8.20 first gives the `Γ‴` good tower and then its perfectoid quotient by the stabilized `Δ`. The `π(K^der_{p,n})` are cofinal because the image of `G^der(ℚ_p)` is open. Every arithmetic `Γ` lies in a congruence `Γ′` (HJ Propositions 2.11, 2.13; Deligne 2.0.14); finite comparison and PerfectoidTowers §P8.18 completes that case. In the published diagram `Γ‴` already lies in the adjoint group.

([HJ], §5.3, Proposition 5.19 with proof (congruence case), pp. 36–37.)

([HJ], §5.3, proof of Proposition 5.19 (arithmetic case), pp. 37–38.)

For the Siegel datum, the adjoint connected datum is `(PGSp_2g, H_g⁺)` and `Γ = PSp_2g(ℤ)`-congruence subgroups: their towers are perfectoid.

*Needs:* §4.3; §2.6; ShimuraVarieties Layer 2; PerfectoidTowers §§P8.18–P8.20, P8.20, P8.18; ShimuraVarieties §§6.2, 8.18, 8.19.

### 4.5 Minimally compactified towers of pre-abelian Shimura data are perfectoid

Let `(G, X)` be a Shimura datum (resp. a connected Shimura datum) of pre-abelian type (ShimuraData §4.1). Then for every compact open `K^p ⊆ G(𝔸_f^p)` the diamond `𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇` over `C` is a perfectoid space (resp. for every arithmetic `Γ` the diamond `𝒳*_{Γ,∞}(G, X⁺)` is perfectoid): pre-abelian data satisfy Property `𝒫`. This is a representability statement only: no Hodge–Tate period map on these towers is asserted (the revised Hansen–Johansson paper removed it; Layer 6 supplies the abelian-type minimal period map separately). The identification is with the diamond limit; a Scholze–Weinstein tilde-limit statement is not asserted (it is not known even for Hodge type, Boxer–Pilloni §4.4.27).

Pre-abelian type: `(G^ad, X⁺) ≅ (G₁^ad, X₁⁺)` for a Hodge-type datum `(G₁, X₁)`; no abelian-type hypothesis is used.

Through Propositions 5.18–5.19, the proof rests on the perfectoidization of integral algebras (conditional on the integral-algebra perfectoidization input below).

Choose a Hodge-type `(G₁, X₁)` with `(G₁^ad, X₁⁺) ≅ (G^ad, X⁺)` (the 'central isogeny' of the source is `G₁^der → G₁^ad ≅ G^ad`). §4.4 gives Property `𝒫` for `(G₁^ad, X₁⁺) = (G^ad, X⁺)`. §4.3 gives Property `𝒫` for `(G, X)`.

([HJ], §5.3, Theorem 5.20 with proof, p. 38.)

([HJ], §1.3, the paragraph after Theorem 1.5, p. 5.)

Abelian-type data (unitary similitude groups, orthogonal groups of signature `(n, 2)` via GSpin) are pre-abelian, so their minimal towers are perfectoid.

For a Hodge-type datum it recovers Layer 2 §2.5 over `C`.

*Needs:* §4.4; §4.3; §4.1; ShimuraData Layer 4; ShimuraData §§4.1, 4.2.

### 4.6 The open pre-abelian tower and the Zariski closed boundary

Let `(G, X)` be of pre-abelian type and `K^p ⊆ G(𝔸_f^p)` compact open, with `𝒳*_{K^p}` the perfectoid space of §4.5. Then: (i) the boundary `𝒵_{K^p} ⊆ 𝒳*_{K^p}`, the preimage of the boundary `∂` of any `𝒳*_{K^pK_p}` with its induced perfectoid structure, is a Zariski closed embedding (PerfectoidTowers §P8.14), independent of `K_p`, and on every affinoid perfectoid open it is strongly Zariski closed; (ii) the open tower `𝒳_{K^p} := 𝒳*_{K^p} ∖ 𝒵_{K^p}` is a perfectoid space with `𝒳_{K^p}^◇ ≅ lim_{K_p} 𝒳_{K^pK_p}^◇` (the open Layer 0 diamond); (iii) both identifications are isomorphisms of diamonds, compatible with the `G(ℚ_p)`-action; no tilde-limit statement is asserted. Hansen–Johansson state the boundary in Theorem 1.5 and invoke its strong Zariski closedness in the proof of Corollary 5.21, p. 38. The finite-level boundary pullback and open-complement argument are supplied explicitly above;

Pre-abelian type.

The reduced boundary of `𝒳*_{K^pK_p}` is a closed subvariety; its pullback to the perfectoid `𝒳*_{K^p}` is a Zariski closed embedding (PerfectoidTowers §P8.21); level maps satisfy `f⁻¹(∂) = ∂` set-theoretically and a Zariski closed perfectoid subspace depends only on its underlying closed subset, so the result is independent of `K_p`. Strong Zariski closedness: every Zariski closed subset of an affinoid perfectoid space is strongly Zariski closed (PerfectoidSpaces §P4.15; Bhatt–Scholze Theorem 7.4 and Remark 7.5, p. 56). Open tower: preimages of interiors under level maps are interiors, so the open subdiamond of HodgeTateAndCanonicalSubgroups §2.3 is the complement of the boundary; an open subspace of a perfectoid space is perfectoid.

([HJ], §1.3, Theorem 1.5, p. 4.) Theorem 1.5 asserts the Zariski closed boundary (the sentence continues with the formula).

([HJ], §5.3, proof of Corollary 5.21, p. 38.) Strong Zariski closedness of the boundary from Bhatt–Scholze.

For the Siegel datum it recovers Layer 1 §1.28 (ii) over `C` for the boundary.

*Needs:* §4.5; HodgeTateAndCanonicalSubgroups §2.3; PerfectoidTowers §§P8.21, P8.14; PerfectoidSpaces §P4.15.

### 4.7 Theorem 1.5 over an arbitrary `C` with `E → C`

Let `(G, X)` be of pre-abelian type with reflex field `E, C/ℚ_p` complete algebraically closed and `E → C` an embedding. Then the tower of adic spaces over `Spa C` of `Sh*_{K^pK_p}(G, X) ⊗_{E} C` (canonical models, ShimuraVarieties §8.18) has perfectoid diamond limit `X*_{K^p} = lim_{K_p} X*^◇_{K^pK_p}` over `Spd C`, with Zariski closed boundary and open complement as in §4.6: this is Hansen–Johansson Theorem 1.5, whose proof in §5.3 works with complex varieties and a fixed `ℂ ≅ ℂ_p`.

Pre-abelian type, so that canonical models and their minimal compactifications over `E` exist (ShimuraVarieties V6, V8).

Choose `ℂ ≅ ℂ_p` extending `E → ℂ_p ⊆ C`; complex conjugation and the choice do not affect the statement.

The canonical models over `E` base changed along `E → ℂ_p ≅ ℂ` are the complex Shimura varieties of §5.3 (canonical model property), compatibly with level maps and minimal compactifications (ShimuraVarieties §8.18, minimal-map-extension). Base change from `ℂ_p` to `C` preserves perfectoidness of the limit (fibre products with `Spd C`; §2.7 for the Hodge-type input). Apply §4.5 and §4.6.

([HJ], §1.3, Theorem 1.5, p. 4.)

([HJ], §5.3, conventions, p. 35.)

For the modular curve and `C = ℂ_p`, it is the perfectoid modular curve over `ℂ_p`.

*Needs:* §4.5; §4.6; §2.7; ShimuraVarieties §§8.18, 8.19, 7.14.

### Examples

For a zero-dimensional torus datum the tower is a profinite family of C-points, hence perfectoid; this tests full Property `P`. For connected Property `P` at dimension zero use the trivial semisimple group, whose arithmetic tower is the constant point `Spa C`. For a nontrivial central derived cover, adjoint arithmetic intersections need finite comparison rather than equality of the two level systems. The fixed finite deck group bounds the normal-core quotients uniformly.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 5: modular and Hilbert towers

### 5.1 The modular-curve tower: comparison with the full-level modular curves, fixed Weil-pairing components and tame level

For `(GL_2, ℍ^±)`, a tame level `K^p` prime to `p` that is the adelic form of one of Heuer's rigidifying tame levels `Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N)`, namely `K^p = K(N)^p` with `N ≥ 3` or `K^p = K₁(N)^p` with `N ≥ 4` (`Γ₁(3)` is not rigidifying: `(−2 1; −3 1) ∈ Γ₁(3)` has order 3), and `K_p = K(pᵐ)`. For `K^p = K(N)^p` the Layer 0 tower over `C` is identified with the analytified full-level modular curves of ShimuraVarieties §8.10 (moduli of `(E, P, Q)` with an ordered full `Npᵐ`-basis), compatibly with level maps and Hecke correspondences (ShimuraVarieties §8.21); for `K₁(N)^p` it is the quotient of the `K(N)^p`-tower by the finite group `K₁(N)^p/K(N)^p` (HodgeTateAndCanonicalSubgroups §2.2). The infinite-level diamond `S^{*◇}_{K^p,∞}` is represented by `𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C`, where `𝒳*_{Γ(p^∞)}` is Scholze's perfectoid modular curve over `ℚ_p^cycl` (Layer 1 with `g = 1`), on which the Weil-pairing root is the fixed compatible system (§1.2); after fixing `ℚ_p^cycl → C` this is `ℤ_p^× × (𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C)`, which is also the `GL_2`-space of Heuer and BHW (moduli of `(E, μ, α)` with `α` unrestricted) taken over `C`, and `𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C` alone is the part over one compatible system `ζ` of p-power roots of unity. The `(R, R⁺)`-points of `S^◇_{K^p,∞}` for perfectoid `(R, R⁺)` over `(C, O_C)` are triples (`E`, tame level, `α: ℤ_p² ≅ T_pE`), with no condition on the Weil pairing of `α`. Under this identification the right translation by `u ∈ GL_2(ℤ_p)` is `α ↦ α ∘ u`, and BHW's left action `γ·α = α ∘ γ^∨` is the right translation by `γ^∨ = det(γ)γ⁻¹`. Components: for `K^p = K(N)^p, π₀` of the infinite-level tower is `lim_m (ℤ/Npᵐ)^× = (ℤ/N)^× × ℤ_p^×`, identified through the Weil pairing with compatible systems of primitive `Npᵐ-th` roots of unity (ShimuraVarieties §8.11) (for `K₁(N)^p` it is `ℤ_p^×`); the fibre over a fixed compatible system `ζ` is the fixed-pairing tower of ShimuraVarieties §8.12 (connected at each level), its deck group over level `K(p)` is the image of `SL_2`-type congruence subgroups, and `GL_2(ℤ_p)` acts on `π₀` through `det`. For `K^p = K(N)^p` the tower is a `GL_2(ℤ_p)`-torsor over the level-`K^pGL_2(ℤ_p)` curve, because `K^pGL_2(ℤ_p)` is neat and `Z(ℚ) ∩ K^pGL_2(ℤ_p) = {1}` (Layer 0 §0.3).

Modular curve; `K^p = K(N)^p` with `N ≥ 3` or `K₁(N)^p` with `N ≥ 4, N` prime to `p` (BHW §2.1 includes `N = 3` for `Γ₁(N)`, but `Γ₁(3)` is not representable); the elliptic Tate module `T_pE` is identified with `T_pE^∨` by the principal polarization with a sign fixed by the Weil pairing convention of V8, matched with the Hilbert convention `α: 𝒪_p² ≅ T_pA^∨` for `F = ℚ`.

Finite levels: ShimuraVarieties §8.10 and ShimuraVarieties §8.13 (right translation by `u` acts on bases by `(P, Q) ↦ (aP + cQ, bP + dQ)`). Infinite level: HodgeTateAndCanonicalSubgroups §2.3 with the Layer 0 perfectoid representative `𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C` given by Layer 1 `(g = 1)` through §1.2; points by HodgeTateAndCanonicalSubgroups §2.3 (iii) and the moduli description at finite level. Components by Layer 0 §0.4 and §0.5 with ShimuraVarieties §8.11; kernel by Layer 0 §0.3.

([BHW], §2.1, p. 7.)

([BHW], §2.1, display (2.1), pp. 7–8.)

([Heuer], §2.1, p. 6.) Heuer works at rigidifying tame levels; `Γ₁(N)` is rigidifying only for `N ≥ 4`.

At level `K(p)`, the fixed-pairing component is `Γ(Np)\ℍ` and the deck group of the level-K`(p²)` cover of it has order `p³`.

*Needs:* §0.2; §0.4; §0.5; §0.3; §1.26; §1.2; HilbertModularVarietiesAndShimuraCurves H5; HodgeTateAndCanonicalSubgroups §§2.1, 2.3, 2.2; ShimuraVarieties §§8.10, 8.13, 8.21, 8.12, 8.11.

### 5.2 Completed cusp charts of the perfectoid modular curve and the action on q-parameters

For a cusp `x` of the compactified modular curve `X*` of a rigidifying tame level `Γ^p` in Heuer's sense (`Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), N ≥ 3` prime to `p`, for instance `Γ(N)` with `N ≥ 3` or `Γ₁(N)` with `N ≥ 4`, but not `Γ₁(3)`, which contains the element `(−2 1; −3 1)` of order 3) with Tate parameter `D_x` and width `e_x`, the cusp chart of Layer 1 §1.31 is identified with the formal Tate-curve neighbourhood of the finite-level comparison (ShimuraVarieties §8.20, ShimuraCompactifications §C6.50–C6.52): at level `Γ₀(pⁿ) ∩` anticanonical, the chart is `D_n` with `q^{1/pⁿ}` the Tate parameter of the anticanonical quotient, and at infinite level `(GL_2(ℤ_p) × D_{∞,x})/ℤ_p`. The action of `Γ₀(p)` on the charts at `Γ₀(p^∞)`-level is through `(Γ₀(p) × D_∞)/pℤ_p = Γ₀(p^∞) × D_∞` with the right action of `h ∈ pℤ_p` by `(γ, q^{1/p^m}) ↦ (γ(1 0; h 1), ζ_{p^m}^{h/e_x} q^{1/p^m})` (Heuer Proposition 3.19), i.e. the lower unipotent `N⁻(pⁿℤ_p)` (not a quotient `Γ₀(pⁿ)/Γ₀(p^∞)`, which is not a group) acts on q-roots by p-power roots of unity, with `ζ` fixed by the Weil pairing; consequently the `Γ₀(pⁿ)`-invariant bounded functions on the chart over `x` are `𝒪_{L_x}[[q^{1/pⁿ}]]` (with the completed bounded-series convention and `L_x` the actual cusp field, including any required tame roots of unity) (BHW Proposition 3.8). The Hodge–Tate period map is locally constant on the charts, `(a b; c d), q ↦ (b : d) ∈ ℙ¹(ℤ_p)`.

Modular curve as in §5.1; the sign of `h` follows Heuer's convention for the right action of the lower unipotent; BHW's adjugate convention exchanges `c` and `−c`.

Identify the finite-level Tate charts (ShimuraVarieties §8.20) with Heuer's `D_{n,x}` through the Tate curve and its canonical subgroup `μ_{pⁿ}`. The `Γ₀(p)`-action and the q-action: Heuer Proposition 3.19 and Theorem 3.22; invariants by Heuer Lemma 3.21-type q-expansion arguments as used in BHW Proposition 3.8.

([Heuer], §3.4, Proposition 3.19, pp. 22–23, and Theorem 3.22, pp. 24–26.)

([BHW], §3.1, proof of Proposition 3.8, pp. 10–11.)

For `n = 1` the `Γ₀(p)`-invariant bounded functions on the chart over `x` are `𝒪_L[ζ_d][[q^{1/p}]] = 𝒪⁺(D_1 × μ_d)`, the bounded functions on the Tate parameter disc of `X*_{Γ₀(p)}(ε)_a`, which strictly contain the pullback `𝒪_L[ζ_d][[q]]` of the bounded functions on the Tate disc of `X*` (the chart of `X*_{Γ₀(p)}(ε)_a` has coordinate `q^{1/p}` and maps to the chart of `X*` by `q^{1/p} ↦ (q^{1/p})^p = q`; BHW proof of Proposition 3.8).

*Needs:* §1.31; §5.1; ShimuraVarieties §8.20; ShimuraCompactifications §C6.50–C6.52.

### 5.3 Modular anticanonical domains, radii and the period coordinate

For the modular curve, the anticanonical tower of Layer 1 `(g = 1)` and BHW's anticanonical locus agree: `𝒳*_{Γ(p^∞)}(ε) = 𝒳*_{Γ(p^∞)}(ε)_c ⊔ 𝒳*_{Γ(p^∞)}(ε)_a` with the anticanonical part the preimage of `{D ∩ H₁ = 0}` at `Γ₀(p)`-level; with the bounds of HodgeTateAndCanonicalSubgroups T4 (for `m ≥ 1, p^{−m} ≤ r < 1` and `0 ≤ ε < 1/(c_p p^m)` for `p ≥ 3`, with `c_p=2` for `p≥5` and `c_p=3` for `p=3`, and `0 ≤ ε ≤ 1/(4p^m)` for `p=2`), `π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ B_r(ℤ_p : 1)`, the union of closed balls of radius `r` around `(a : 1), a ∈ ℤ_p; Γ₀(p)` preserves `B_r(ℤ_p : 1)` with `z ↦ (az + b)/(cz + d)` and `|cz + d| = 1`; and `𝔷 = π_HT^*z, 𝔰 = π_HT^*s` with `𝔰(x) = HT(α(e_1))` (Layer 3 §3.10) satisfy `γ^*𝔰 = (c𝔷 + d)𝔰`. The radius is attached to the rational prime `p` (BHW's Proposition 2.6 is not a special case of their Proposition 5.18 as printed; the T4 bounds are used).

Modular curve; `ε, r` as stated (the canonical-subgroup estimates are owned by HodgeTateAndCanonicalSubgroups T4).

Identify loci by their moduli conditions (Layer 1 §1.12 for `g = 1` and BHW §2.1). Radius inclusion: T4's canonical-subgroup and Hodge–Tate image bounds (supplier contract); off the cusps by the Hodge–Tate cokernel degree, at cusps because cusps are ordinary and map to `ℙ¹(ℚ_p)` (§5.2). Stability and automorphy factor: BHW Lemma `2.4 (|z| ≤ 1, c ∈ pℤ_p, d ∈ ℤ_p^×)` and Layer 3 §3.10.

([BHW], §2.2, Lemma 2.4 and Proposition 2.6, pp. 8–9.) BHW's derivation, corrected to T4's bounds.

([BHW], §2.2, p. 8.)

For `r=1/p` and `p≥5`, `ε=1/(4p)` suffices.

**Checks.**

- At `p≥5, m=1`, the value `1/(4p)` is strictly below `1/(2p)`.
- At `p=3, m=1`, `ε=1/18` is allowed, while the endpoint `1/9` is excluded.
- At `p=2, m=1`, the bound includes `ε=1/8`; this inclusive endpoint does not extend to odd primes.

*Needs:* §5.1; §5.2; §1.12; §3.10; HodgeTateAndCanonicalSubgroups §§4.1, 4.3, 4.6.

### 5.4 The geometric, intermediate and arithmetic Hilbert towers at infinite level

In the setting of the hypotheses, for `n ∈ ℤ_{≥0}` let `X_{Γ*(pⁿ)}` (`G*`-level: `α_n` with similitude in `(ℤ/pⁿ)^×`, relative to a chosen generator `β` of `𝔠𝔡⁻¹(1)`), `X_{Γ(pⁿ)}` (the intermediate space: the `G*`-variety `X` with a full G-level `α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ]`, polarization `λ` fixed) and `X_{G,Γ(pⁿ)}` (the arithmetic G-variety, polarization class `[λ] = 𝒪_F^{×,+}λ`) be the finite-level spaces of HilbertModularVarietiesAndShimuraCurves H3–H4, with maps `X_{Γ*(pⁿ)} →β₁ X_{Γ(pⁿ)} →β₂ X_{G,Γ(pⁿ)}` over `X = X → X_G`. Their infinite-level diamonds `X_{Γ*(p^∞)}, X_{Γ(p^∞)}, X_{G,Γ(p^∞)}` are formed as in HodgeTateAndCanonicalSubgroups §2.3. The hybrid tower `(X_{Γ(pⁿ)})_n` is a Layer 0 rigidified moduli tower over the arithmetic tower `(X_{G,Γ(pⁿ)})_n` with the pro-system of finite groups `Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)²`, whose orders are unbounded in `n` when `[F : ℚ] > 1`, and are all 1 when `F = ℚ` (BHW Lemma 8.16(1)); its whole-space torsor property at infinite level is §5.7. At finite level β₂ is a torsor over its quotient stack; its coarse restriction is a torsor only on the free locus for `Δ(pⁿN)`, including when `n=0`. `X_{Γ*(p^∞)}` is perfectoid by Layer 2 (Hodge type, `G* =` PEL) and `X_{G,Γ(p^∞)}` by Layer 4 (`G` is of abelian type); perfectoidness of `X_{Γ(p^∞)}` is not asserted here, it is proved in §5.5, which depends on this construction. Actions: the level-structure action of `G(ℤ_p) = GL_2(𝒪_p)` on `X_{Γ(p^∞)}` by `α ↦ α ∘ γ^∨` (a pro-étale `G(ℤ_p)`-torsor over `X`), of `G*(ℤ_p)` on `X_{Γ*(p^∞)}`, and the polarization action of `𝒪_F^{×,+}` on `X_{Γ(p^∞)}` by `λ ↦ ηλ`, which factors through `Δ(pⁿN)` at level `n` and through the profinite group `Δ(p^∞N) = lim_n Δ(pⁿN)` at infinite level; `𝒪_F^{×,+}` does not act on `X_{Γ*(pⁿ)}` by changing `λ` (BHW p. 33).

`F` totally real of degree `g` with ring of integers `𝒪_F`, different `𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m`; tame level `μ_N` with `N ≥ 4` prime to `p` and a polarization module `𝔠` (BHW §5.1); `L=C` complete algebraically closed with the fixed embedding `ℚ_p^cycl→C`; throughout §§5.4–5.11 use this base; levels at `p` act on `α: 𝒪_p² ≅ T_pA^∨` by `α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹` (the left action of BHW, equal to the Shimura right translation by `γ^∨` under the identification `λ⁻¹ ∘ (α ⊗ id)`).

Finite levels and maps: HilbertModularVarietiesAndShimuraCurves H4 (supplier contract). Diamond limits as in Layer 0; the rigidified-tower structure with `Δ_{K(pⁿ)} = Δ(pⁿN)` is BHW Lemma 8.16(1) (H4 supplier contract) read in Layer 0 §0.6; `X_{Γ*(p^∞)} ~ lim X_{Γ*(pⁿ)}` by Layer 2 §2.2 for the open PEL datum `G*` (BHW Theorem 5.11(4)); `X_{G,Γ(p^∞)}` by the Layer 4 pre-abelian representability theorem, `G` being of abelian type. The level-structure action is the limit of the finite étale `G(ℤ/pⁿ)`-torsor structures (BHW §8.4.1).

([BHW], §8.2, (8.1), p. 33.)

([BHW], §8.2.1, Definition 8.8, p. 34.)

The API is `HilbertTower.geometric`, .intermediate, .arithmetic, .beta1, .beta2, .levelAction, .polAction and .isPerfectoid. These retain the three specified towers, inclusion of scalar-pairing components, polarization-forgetting map, adjugate left level action, commuting polarization action through `Δ(p^∞N)`, and the geometric/arithmetic perfectoidness assertions; intermediate perfectoidness is §5.5.

**Checks.**

- `three_towers_F_eq_Q`: For `F = ℚ` the three towers and `β₁, β₂` are identities between copies of the modular tower.
- `beta1_not_surjective`: Take `F = ℚ(√5), p = 3` (inert), `n = 1` and tame `μ_N` level with `N ≥ 4` prime to 3, in a fixed polarization component. The Weil-pairing component label of `β₁` lies in `(ℤ/3)^×` inside `(𝒪_F/3)^× ≅ 𝔽₉^×`: its image has order 2 and the target has order 8, so `β₁` misses pairing components. At `n = 0` the residue-unit obstruction is trivial; `[F : ℚ] = 2` alone does not ensure nonsurjectivity at every level.
- `levelAction_adjugate`: For `γ = diag(u, 1), γ^∨ = diag(1, u)`, so the level action of `γ` multiplies the second basis vector by `u`.
- `levelAction_vs_rightTranslation`: The level action of `γ` equals the Layer 0 right translation `T_{γ^∨}` under `α ↔ λ⁻¹ ∘ (α ⊗ id)` (BHW Remark 5.5).

*Needs:* §0.6; §2.2; §2.5; §4.5; HilbertModularVarietiesAndShimuraCurves H4; HilbertModularVarietiesAndShimuraCurves H3; HodgeTateAndCanonicalSubgroups §§2.3, 2.2; ShimuraData §§5.3, 5.4.

### 5.5 The intermediate Hilbert tower as a contracted product: the `ℤ_p^×`-torsor span

In §5.4, let `𝒪_p^×` act on `X_{Γ(p^∞)}` by the level action of `diag(η, 1)`. Then `X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)}, (x, u) ↦ diag(u, 1)·β₁(x)`, is a `ℤ_p^×`-torsor for the antidiagonal action `t·(x, u) = (diag(t, 1)·x, ut⁻¹)`, i.e. `X_{Γ(p^∞)} = X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^×`; in particular `X_{Γ(p^∞)}` is perfectoid. The decomposition `X_{Γ(pⁿ)} = X_{Γ*(pⁿ)} × (𝒪_F/pⁿ)^×/(ℤ/pⁿ)^×` printed by BHW uses a set-theoretic section of `𝒪_p^× → 𝒪_p^×/ℤ_p^×` and is not canonical; the contracted product is.

Finite levels: the finite-level Weil-pairing component map of HilbertModularVarietiesAndShimuraCurves H4 (BHW Lemma 8.10 and Corollary 8.11): `X_{Γ*(pⁿ)} = X_{Γ(pⁿ)} ×_{(𝒪_F/pⁿ)^×} (ℤ/pⁿ)^×` and `(𝒪_F/pⁿ)^× × X_{Γ*(pⁿ)} → X_{Γ(pⁿ)}` is a `(ℤ/pⁿ)^×`-torsor for the antidiagonal action. Pass to the limit: limits of compatible finite torsors are torsors under the profinite limit group (HodgeTateAndCanonicalSubgroups §2.3 (v)), which gives `X_{Γ(p^∞)} = X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^×` as diamonds (BHW Lemma 8.25). Perfectoidness: a quotient of a perfectoid space by a free profinite action need not be perfectoid in general (`ℤ_p` acting on the perfectoid torus by translation), so use a continuous section `s: Q := 𝒪_p^×/ℤ_p^× → 𝒪_p^×` of the quotient map of profinite groups (Ribes–Zalesskii Proposition 2.2.2; `TauCeti.exists_continuous_section`). Then `(x, u) ↦ (diag(u·s(ū)⁻¹, 1)·x, ū)` is invariant under `t·(x, u) = (diag(t, 1)·x, ut⁻¹)` and induces an isomorphism `X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^× ≅ X_{Γ*(p^∞)} × Q`, with inverse `(y, q) ↦ [(y, s(q))]`. The product of a perfectoid space with a profinite set is perfectoid (PerfectoidSpaces §P6.8, glued over an affinoid perfectoid cover of `X_{Γ*(p^∞)}`), so `X_{Γ(p^∞)}` is perfectoid; the isomorphism depends on `s`, the contracted product does not.

([BHW], §8.4.2, Lemma 8.25, p. 39.)

([BHW], §8.2.3, Corollary 8.11, p. 35.)

**Checks.**

- With `𝒪_p^×=ℤ_p^×` (`F=ℚ`) the quotient Q is a point and `[(x,u)]↦diag(u,1)x` identifies the contracted product with the geometric tower.
- In the finite model `A=ℤ/4`, `B=ℤ/2`, with B embedded by `t↦2t` and acting on `Y=ℤ/2` by translation, the relation is `(y,u)∼(y+t,u−2t)`. The invariant coordinate `2y+u` identifies the contracted product with `ℤ/4`; using the same sign on both factors fails over groups of odd order, e.g. `A=B=ℤ/3` with invariant `y+u`.
- A section `s:Q→A` trivializes the product by `[(y,u)]↦(y·(u s(q)⁻¹),q)`. Replacing `s(q)` by `b(q)s(q)` changes the Y-coordinate by `b(q)⁻¹`; the product identification is not canonical. In the finite model, the sections of `ℤ/4→ℤ/2` differing by 2 interchange the two Y-points on that fibre.

*Needs:* §5.4; `tauceti:TauCeti.exists_continuous_section`; HilbertModularVarietiesAndShimuraCurves H4; PerfectoidSpaces §P6.8; HodgeTateAndCanonicalSubgroups §2.3.

### 5.5a Profinite polarization and combined level groups

Before the combined pairing law, construct `Δ(p^∞N)=lim_m Δ(p^mN)`, the closure `Z_∞` of `(1+N𝒪_F)^×` in scalar `𝒪_p^×`, and
`E(pⁿ)=lim_m (Γ̄₀(pⁿ,p^m)×𝒪_F^{×,+})/(1+N𝒪_F)^× ≅ (Γ₀(pⁿ)×Δ(p^∞N))/Z_∞`,
where `z↦(diag(z,z),z²)`. Here `n≥0` or `n=∞` and the finite hybrid groups and polarization groups are those of HilbertModularVarietiesAndShimuraCurves H4. Prove the two presentations, continuity of the actions and of `Δ(p^∞N)→𝒪_p^×`, density of the finite-unit presentation, and the exact sequences `1→Γ₀(pⁿ)→E(pⁿ)→Δ(N)→1` and `1→Δ(p^∞N)→E(pⁿ)→Γ₀(pⁿ)/Z_∞→1`. These are group constructions; the tower torsor identifications are §5.8.

At each finite level the kernel is the diagonal scalar image of `Z_m=(1+N𝒪_F)^×/(1+p^mN𝒪_F)^×`. Take inverse limits of these finite exact sequences; compactness gives surjectivity, and their scalar inverse limit is the indicated closure. The square map on units congruent to 1 modulo `N` has trivial kernel for `N≥3`. This identifies the image in the polarization factor with `ker(Δ(p^∞N)→Δ(N))`, giving the first sequence as well as the second. The finite-level level and polarization actions commute and kill the diagonal scalars, so the limit group acts before any pairing law is imposed.

Sources: [BHW], §8.3, Definition 8.17 and Proposition 8.18, pp.36–37; §8.4.1, Lemma 8.24 and (8.7), p.39.

**Checks.**

- For `F=ℚ` all positive-unit polarization groups and `Z_∞` are trivial; `E(pⁿ)=Γ₀(pⁿ)`.
- A scalar `z` gives determinant `z²` and polarization factor `z²`, so the combined pairing character is 1 on the diagonal kernel.
- For real quadratic `F`, `Z_∞` is the closure of all units congruent to 1 modulo `N`, not just the positive ones; the dense finite-unit presentation need not itself be compact.

*Needs:* §5.4; §5.5; §0.3; HilbertModularVarietiesAndShimuraCurves H4; ProfiniteArithmetic Layers 0–2.

### 5.6 The `𝒪_p^×`-valued Weil pairing of the intermediate Hilbert tower

Over any commutative ring `R`, a level change by `γ ∈ GL₂(R)` precomposes a coefficient matrix `α` with `γ^∨ = det(γ)γ⁻¹`. The determinant `Matrix.det α`, interpreted as the pairing coordinate, scales by `det γ`. Changing the target generator by a unit `u` changes its coefficient `e` to `u⁻¹e`. Thus `diag(a, d)` dualizes to `diag(d, a)`, `diag(2, 3)` over `ℚ` dualizes to `diag(3, 2)`, and changing `β` to `2β` changes the coefficient 6 to 3. The geometric `HilbertTower.weilPairing` below is defined on the intermediate Hilbert moduli tower and has values in `𝒪_p^×`; it uses the actual alternating pairing and a generator `β`.

Choose an `𝒪_p`-generator `β∈𝔠𝔡⁻¹(1)=𝔠𝔡⁻¹⊗T_pμ_{p^∞}`. The linearized finite pairings with `e_{pⁿ}=Tr∘ẽ_n` define `e_{n,β}:X_{Γ(pⁿ)}→(𝒪_F/pⁿ)^×`, hence the profinite perfectoid map `e_β=lim e_{n,β}:X_{Γ(p^∞)}→𝒪_p^×`. For the left level action and positive-unit polarization action, `e_β∘γ=det(γ)e_β, e_β∘η=η⁻¹e_β`. The latter extends through `Δ(p^∞N)`; the inclusion of positive units induces `x↦x̄:Δ(p^∞N)→𝒪_p^×`, since squares of units congruent to `1 mod p^mN` are `1 mod p^m`. Use §5.5a's two equivalent profinite presentations of `E(pⁿ)`, its dense finite-unit subgroup and diagonal scalar closure `Z_∞`. The combined law `e_β∘(γ,x)=det(γ)x̄⁻¹e_β` descends because `(diag(z,z),z²)` contributes `z²z⁻²=1`. For a character `w, w(e_β)` is an integral unit on the anticanonical locus with law `w(x̄⁻¹)w(det γ)w(e_β)`. The fibre over `ℤ_p^×` is `β₁` of the geometric tower. Changing `β` to `uβ` gives `e_{uβ}=u⁻¹e_β` and moves that fibre to `u⁻¹ℤ_p^×`. On the arithmetic tower only its class modulo the closure of positive global units descends; an unquotiented pairing there depends on `λ`.

`β` is an auxiliary choice; the change-of-`β` law (iii) is stated here (BHW do not state it).

Finite levels: the `𝒪_F`-linear Weil pairing (BHW Definitions 5.6–5.7; HilbertModularVarietiesAndShimuraCurves H1/H4) and the computation of BHW Lemma 8.9 (`det γ^∨ = det γ; λ ↦ ηλ` multiplies by `η⁻¹`); pass to the limit (Lemma 8.25). (i) on `E(pⁿ): (γ, x) ∈ Γ₀(pⁿ) × Δ(p^∞N)` acts as the level action of `γ` composed with the polarization action of `x` (which factors through `Δ(pᵐN)` at level `m`, BHW Lemma 8.12 and Lemma 8.16(1)); at finite level `m` the formula is Lemma 8.9 with `x̄ mod p^m`, and it passes to the limit. Use the finite-level kernel and completed group presentation already proved in §5.5a. On `Z_∞` the character is `z²·z⁻² = 1` (Lemma 8.26 on the dense subgroup). (iii) `e_{n,uβ} = u⁻¹e_{n,β}` from the definition through `β⁻¹`; (iv) from (i) for `η`.

([BHW], §8.4.2, Lemma 8.26, p. 39.)

([BHW], §8.2.2, after (8.2), p. 34.)

The API is `HilbertTower.weilPairing`, .`weilPairing_level, .weilPairing_pol, .weilPairing_fibre, .weilPairing_changeGenerator, .weilPairing_E` and .`weilPairing_arith`. They give `e_β` and its `det(γ), η⁻¹` and `u⁻¹` laws, the scalar-unit fibre, the combined `E(pⁿ)`-law `det(γ)x̄⁻¹`, and the arithmetic class modulo the closure of positive global units.

**Checks.**

- Under a change of target generator, the identity unit fixes every coefficient, and every unit fixes the zero coefficient. Over `ℚ`, the unit 2 sends 6 to 3; multiplication by 2 instead gives 12 and fails the generator-change law.
- `weilPairing_F_eq_Q`: For `F = ℚ, e_β` is the `ℤ_p^×`-valued Weil pairing and the polarization action is trivial.
- `weilPairing_diag`: For `γ = diag(u, 1), e_β ∘ γ = u·e_β`.
- `weilPairing_scalar_pol`: For `η ∈ (1 + N𝒪_F)^×`, the polarization action of `η²` equals the level action of `diag(η, η)⁻¹` (BHW Lemma 8.12), consistently with `det(diag(η, η)⁻¹) = η⁻² = (η²)⁻¹`.
- `weilPairing_arith_not_defined`: For `[F : ℚ] ≥ 2` and a totally positive unit `η ≠ 1, e_β` changes by `η⁻¹ ∉ 1` under `λ ↦ ηλ`, so no `𝒪_p^×`-valued map is defined on the arithmetic tower.

*Needs:* §5.4; §5.5; §5.5a; HilbertModularVarietiesAndShimuraCurves H4; HilbertModularVarietiesAndShimuraCurves H1.

### 5.7 The full-tower profinite polarization torsor and the finite torsor on connected components

In §5.4: (1) `β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)}` is a pro-étale torsor under the profinite group `Δ(p^∞N) := lim_n Δ(pⁿN), Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)²`, into which `𝒪_F^{×,+}` embeds densely; (2) on identity components, `X⁰_{Γ(p^∞)} = X⁰_{Γ*(p^∞)} → X⁰_{G,Γ(p^∞)}` is a finite étale torsor under the finite group `Δ_∞(N) := ker(Δ(p^∞N) → 𝒪_p^×)`, the stabiliser of the identity component; for `p` odd `Δ_∞(N) = Δ_n(N) = (1 + pⁿ𝒪_F)^{×,+}/((1 + pⁿN𝒪_F)^×)²` for `n ≫ 0`, while for `p = 2` the transition maps `Δ_{n+1}(N) → Δ_n(N)` need not be injective and `Δ_∞(N)` is only the kernel above (BHW's proof of Lemma 8.20 assumes an injection `Δ_n(N) → Δ(N)` that need not exist). The profinite group on the full tower and the finite group on components are different and both statements are needed.

(1) Finite polarization quotients are torsors over their quotient stacks. Their coarse maps are finite étale torsors only on the loci with trivial geometric stabilizers for `Δ(pⁿN)` (HilbertModularVarietiesAndShimuraCurves §§H3.6, H4.6, H4.12). For the whole-space infinite-level conclusion, prove that a cofinal tail of principal p-levels is projectively neat and that the polarization action there is free. Apply AdelicAlgebraicGroups §4.3's one-prime neatness criterion to a faithful representation of `G^ad`: sufficiently deep principal p-levels act in `1+p^eM_d(ℤ_p)`, with `e≥1` for odd p and `e≥2` for `p=2`. ShimuraVarieties §§P.4, 0.4 supplies finite effective point stabilizers of the arithmetic Hermitian action; projective neatness kills them. An isomorphism between a point and its polarization scaling must therefore be a scalar `v∈𝒪_F^×`. Preservation of the tame marking and full p-level forces `v≡1 mod pⁿN`, so its scaling `v²` is trivial in `Δ(pⁿN)`. Thus every coarse map in this cofinal tail is a finite étale torsor. Apply §0.6's isTorsor_of_free to that tail, using PerfectoidSpaces §P7.9 to retain the full inverse limits and group `Δ(p^∞N)`. (2) On `π₀` the map is `(𝒪_F/pⁿ)^× → U_n = coker(𝒪_F^{×,+} → (𝒪_F/pⁿ)^×)` (BHW Lemma 8.15, with the corrected double-coset argument via Milne 5.17); the stabiliser of the identity component is `Δ_∞(N) = ker(Δ(p^∞N) → 𝒪_p^×)`, finite because units `≡ 1` modulo high powers of `p` are squares of units `≡ 1 mod pⁿN` up to a bounded group; for `p` odd the transition maps are injective (`η ≡ 1 mod pⁿN` and `η² ≡ 1 mod p^{n+1}` force `η ≡ 1 mod p^{n+1}`) and the orders are bounded, giving stabilisation. Perfectoidness of the quotient by the finite group: Layer 4 (PerfectoidTowers §P8.20) or BHW Lemma 8.6.

([BHW], §8.4, Proposition 8.21, pp. 37–38.)

([BHW], §8.4, Proposition 8.21(4), p. 38.)

([Milne], §3, Proposition 3.5 and the definition of neatness, p. 34.) The cofinal projectively neat tail uses AdelicAlgebraicGroups §4.3’s one-prime refinement; finite effective stabilizers use ShimuraVarieties §§P.4, 0.4.

**Checks.**

- At `F=ℚ(√3), N=7, p=5, n=0`, the CM point of HilbertModularVarietiesAndShimuraCurves §H3.3 has order-two polarization inertia: with `S²=3I`, `u=7+4√3` and `f=i(7I+4S)`, one has `f†f=u²` and f fixes the tame marking. The class `[u²]≠1` fixes the coarse point; its quotient-stack atlas is a torsor but the whole coarse quotient is not.
- At sufficiently deep principal p-levels, projective neatness forces any such f to be scalar; the marking and full frame then make its class in `Δ(pⁿN)` trivial. This tests the cofinal-tail hypothesis independently of the tame level. At `p=2` use depth at least two in the faithful adjoint representation: reduction modulo 2 alone retains order-two elements.
- For `F=ℚ`, all polarization groups are trivial, so β₂ is the identity at every level, including zero.

For `F = ℚ(√5), N = 4` and `p` odd: `|Δ(4pⁿ)| = k_n`, the order of `ε = (1+√5)/2` in `(𝒪_F/4pⁿ)^×`, so `Δ(p^∞N)` is infinite, while at `n = 0 |Δ(4)| = 6` (Layer 0 §0.6, test `rigidified_hilbert_delta_order`).

*Needs:* §5.4; §5.5; §5.5a; §0.6; §0.4; §0.5; HilbertModularVarietiesAndShimuraCurves §§H3.3, H3.6, H4.6, H4.12, H4.18; AdelicAlgebraicGroups §4.3; ShimuraVarieties §§P.4, 0.4; PerfectoidSpaces §P7.9; §4.5; PerfectoidTowers §§P8.12, P8.20.

### 5.8 Deck groups of the Hilbert towers at `Γ₀(pⁿ)`-level and the central closure `Z_∞`

For `n ∈ ℤ_{≥0} ∪ {∞}`: (1) `X_{Γ(p^∞)} → X_{Γ₀(pⁿ)}` is a pro-étale torsor under `Γ₀(pⁿ) ⊆ GL_2(𝒪_p)` (for `n = 0`: a `G(ℤ_p)`-torsor over `X`); (2) On the arithmetic action-free coarse locus defined below, `X_{G,Γ(p^∞)} → X_{G,Γ₀(pⁿ)}` is a pro-étale torsor under `PΓ₀(pⁿ) := Γ₀(pⁿ)/Z_∞`, where `Z_∞` is the closure of `(1 + N𝒪_F)^×` (all units `≡ 1 mod N`, embedded as scalars) in `𝒪_p^×` — the Layer 0 kernel `Z_{K^p} ∩ K_p` of the G-tower (Layer 0 §0.3 with `Z = Res_{F/ℚ}G_m`); (3) On the diagonal action-free coarse locus defined below, `X_{Γ(p^∞)} → X_{G,Γ₀(pⁿ)}` is a pro-étale torsor under `E(pⁿ) := lim_m (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞` (`z ↦ (diag(z, z), z²)`; the limit of the finite-level presentations, the group constructed in §5.5a, containing BHW's `(Γ₀(pⁿ) × 𝒪_F^{×,+})/(1 + N𝒪_F)^×` as a dense subgroup), with exact sequences `0 → Γ₀(pⁿ) → E(pⁿ) → Δ(N) → 0` and `0 → Δ(p^∞N) → E(pⁿ) → PΓ₀(pⁿ) → 0`; (4) all statements restrict to the anticanonical loci `(ε)_a` for `n ≥ 1` (not for `n = 0: (ε)_a` is only `Γ₀(p)`-stable), the anticanonical locus being `Δ`-stable because the Hasse invariant does not depend on the polarization. BHW's Lemma 9.2 takes `Z_∞` to be the closure of `(1 + N𝒪_F)^{×,+}` in `'𝒪_p^{×,+}'`; the correct group is the closure of `(1 + N𝒪_F)^×` in `𝒪_p^×`.

At finite levels the arithmetic and diagonal maps are torsors over quotient stacks; their coarse restrictions require respectively free `P̄Γ₀`- and Ē-actions (HilbertModularVarietiesAndShimuraCurves §H4.17). For finite n choose a full level `m≥n` sufficiently deep as in §5.7. Define each coarse target open as the image of the free locus of its respective finite group action at level m, and pull all sources back to that open. Deeper effective full-frame covers are torsors, so these opens are independent of further deepening. For `n=∞` take the inverse limits of these restricted diagrams. The diagonal condition is freeness of the full Ē-action, rather than just its frame subgroup. The first map remains a whole-space coarse frame torsor. Pass to the limit on these opens (HodgeTateAndCanonicalSubgroups §2.3 (v)). Identify `Z_∞` with Layer 0's kernel: `Z(ℚ) = F^×, Z(ℚ) ∩ K = (1 + N𝒪_F)^× ∩ 𝒪_F^×` at full tame level, whose closure in `𝒪_p^×` is `Z_∞` (Layer 0 §0.3). Anticanonical restriction: intersect the respective free opens with `(ε)_a`. The polarization quotient `X_{Γ₀(pⁿ)}(ε)_a → X_{G,Γ₀(pⁿ)}(ε)_a` is a `Δ(N)`-torsor over the quotient stack and a coarse torsor only on its free locus (ShimuraCompactifications §C6.47 supplies the loci; BHW Lemma 8.5 and Remark 8.27 give the polarization action).

([BHW], §8.4.1, Lemma 8.24 and diagram (8.7), p. 39.)

([BHW], §8.3, Definition 8.17, p. 36.)

**Checks.**

- For `F=ℚ`, `Δ=Z_∞=1`; all three maps reduce to the fine modular frame torsor on the whole space.
- The `F=ℚ(√3), N=7, p=5` CM stabilizer in §5.7 excludes its image from the diagonal free locus at `n=0`, even though the hybrid full-frame map is a torsor. The Ē-freeness condition detects this obstruction.
- Quotienting by `Z_∞` removes the ineffective scalars but does not remove non-scalar point stabilizers. Arithmetic coarse torsors require the `P̄Γ₀` free locus in addition to this group quotient.

For `F` real quadratic, `Z_∞` is infinite (the closure of a rank-one group of units), so `X_{G,Γ(p^∞)}` is not a `Γ₀(pⁿ)`-torsor.

*Needs:* §5.4; §5.5a; §5.7; §0.3; HilbertModularVarietiesAndShimuraCurves H4; ShimuraCompactifications §C6.47.

### 5.9 The action of `G(ℚ_p)` on the Hilbert towers and the change of polarization module

The level-structure action of `G(ℤ_p) = GL_2(𝒪_p)` on `X_{Γ(p^∞)}` extends to an action of `G(ℚ_p) = GL_2(F_p)` on the disjoint union `⊔_𝔠 X_{𝔠,Γ(p^∞)}` over polarization modules: for `γ ∈ M_2(𝒪_p) ∩ GL_2(F_p)` (after scaling, a scalar `x` acting by `A ↦ A/A[x]`), with `D = ker`(`γ` on `A[pⁿ]`) for `n ≫ 0` transported through `λ⁻¹ ∘ α, γ` sends `(A, ι, λ, μ_N, α)` to `(A/D, ι′, λ′, μ′_N, α′)`, where `φ: A → A/D` is the quotient isogeny, `λ′` is the unique `𝔠𝔟`-polarization of `A/D` compatible with `λ`, and `α′: 𝒪_p² ≅ T_p(A/D)^∨` is the unique isomorphism with `φ^∨ ∘ α′ = α ∘ γ^∨` (BHW Lemma 8.23; for `γ ∈ GL_2(𝒪_p), φ = id` and `α′ = α ∘ γ^∨`). Equivalently `φ^∨(T_p(A/D)^∨) = α(γ^∨𝒪_p²) ⊆ T_pA^∨`. This is a left action: `γ·(δ·x) = (γδ)·x`. Relative to Layer 0, it lies over the right translation by `γ^∨` on the arithmetic tower, combined with the change of the component of the polarization class; it permutes the `X_{𝔠,Γ(p^∞)}` and does not preserve a fixed `𝔠`.

Compatibility with multiplication is only asserted by BHW (using the characterization by the contravariant Tate-module lattice); it is proved directly below. It cannot be read off from the Layer 0 right translations, because the action lives on `⊔_𝔠 X_{𝔠,Γ(p^∞)}, a Δ(p^∞N)`-torsor over the Shimura tower, not on the Shimura tower itself.

BHW Lemma 8.22 gives the unique `𝔠𝔟`-polarization on `A/D` for `D≅⊕𝒪_F/𝔟_i`. Define `α′` by `φ^∨α′=αγ^∨`; the lattice `φ^∨T_p(A/D)^∨=α(γ^∨𝒪_p²)` determines the p-power isogeny uniquely (Lemma 8.23, whose arrows point up). For successive `δ` then `γ`, the composite lattice is `α(δ^∨γ^∨𝒪_p²)=α((γδ)^∨𝒪_p²)`; the level identity and polarization uniqueness give `γ·(δ·x)=(γδ)·x`. A scalar `x·1₂` has lattice `xT_pA^∨`, so rescaling into integral matrices respects this construction. The arithmetic dictionary is `β₂(γ·x)=T_{γ^∨}β₂(x)`, consistent with the left action because `T_{δ^∨γ^∨}=T_{γ^∨}∘T_{δ^∨}`. The finite isogeny/polarization input is HilbertModularVarietiesAndShimuraCurves §H3.8.

([BHW], §8.4.1, Lemmas 8.22–8.23, pp. 38–39.)

The API is `HilbertTower.qpAction`, .`qpAction_extends, .qpAction_polModule` and .`qpAction_eq_translate`: the rational action on the disjoint union of polarization components, its integral restriction, the change `𝔠↦𝔠𝔟` by the product of kernel elementary divisors, and the right-tower dictionary through `γ^∨`.

**Checks.**

- `qpAction_scalar_p`: `γ = p·1` sends `𝔠` to `p²𝔠`.
- `qpAction_integral`: For `γ ∈ GL_2(𝒪_p), 𝔟 = 𝒪_F` and the action is the level action.
- `qpAction_not_fixed_c`: For `γ = diag(ϖ, 1)` with `ϖ ∈ F_p^× a` local uniformizer of valuation 1 at a non-principal prime `𝔭 | p` and valuation 0 at the other primes above `p`, the polarization module changes to `𝔠𝔭`, in a different narrow class, so the action does not preserve `X_{𝔠,Γ(p^∞)}`.

*Needs:* §5.4; HilbertModularVarietiesAndShimuraCurves H3; HodgeTateAndCanonicalSubgroups §2.2.

### 5.10 Period maps, coefficient trivializations and anticanonical domains across the Hilbert towers

(1) There are Hodge–Tate period maps `X_{Γ*(p^∞)} → X_{Γ(p^∞)} → X_{G,Γ(p^∞)} → Res_{𝒪_F|ℤ}ℙ¹` compatible with `β₁, β₂`: on `X_{Γ(p^∞)}` the map is `(x, u) ↦ diag(u, 1)·π_HT(x)` on the span of §5.5 (BHW's projection onto the `G*`-tower factor is not `ℤ_p^×`-invariant), it equals `(A, α) ↦ α⁻¹(ker HT_A)`, is invariant under the polarization action (which does not change `(A, α)`), and descends along §5.7’s whole-space pro-étale `Δ(p^∞N)`-torsor `β₂`, proved from cofinal projectively neat p-levels, to the arithmetic tower (this construction proves the descent). (2) The coordinate `𝔷 = π_HT^*z`, the section `𝔰 = π_HT^*s` of `ω = π_HT^*Res 𝒪(1)` with `𝔰(A, α) = HT_A(α(1, 0))`, and the automorphy factor `γ^*𝔰 = (c𝔷 + d)𝔰` extend from `X_{Γ*(p^∞)} (γ ∈ Γ*₀(p))` to `X_{Γ(p^∞)} (γ ∈ Γ₀(p) ⊆ GL_2(𝒪_p))`, with `ω` pulled back from `X`. (3) For every rational prime `p` unramified in `F` (including `p = 2, 3`), and for `p` ramified in `F` granted the ramified case of the T4 supplier contract (BHW's proof of Proposition 5.18 uses `P¹(𝒪_p ⊗ 𝒪_C) ≅ P¹(𝒪_C)^Σ`, which holds only for `p` unramified in `F`), and the T4 bounds `(m ≥ 1, p^{−m} ≤ r < 1, 0 ≤ ε < 1/(c_p p^m)` for `p≥3`, `c_p=2` for `p≥5`, `c_p=3` for `p=3`; `0 ≤ ε ≤ 1/(4p^m)` for `p=2`), with one `ε` for all `𝔭 | p` (the total Hasse invariant): `π_HT(X_{Γ*(p^∞)}(ε)_c) ⊆ B_r(1 : p𝒪_p)` and `π_HT(X_{Γ*(p^∞)}(ε)_a) ⊆ B_r(𝒪_p : 1)`, and the same inclusions hold on `X_{Γ(p^∞)}(ε)_a` and `X_{G,Γ(p^∞)}(ε)_a` through (1); the canonical and anticanonical domains and their radii are compatible with the comparisons of §5.4 and §5.7 and with the restrictions of §5.8 to its respective free loci, and the arithmetic unit action and adjugate level convention are preserved.

The radius bounds are HodgeTateAndCanonicalSubgroups T4's (from BHW Proposition 5.18). BHW's proof covers `p` unramified in `F` only: it identifies `π_HT(z)` with a point `(a : b)` of `P¹(𝒪_p ⊗ 𝒪_C) ≅ P¹(𝒪_C)^Σ`, and `𝒪_p ⊗_{ℤ_p} 𝒪_C ≅ 𝒪_C^Σ` requires `𝒪_p` étale over `ℤ_p`. For `p` ramified in `F` the inclusions are an open part of the T4 supplier contract, not a consequence of BHW.

On the geometric tower, a left level change sends `α⁻¹ker HT` to `(γ^∨)⁻¹α⁻¹ker HT`; projectively `(γ^∨)⁻¹=det(γ)⁻¹γ` acts as `γ`. Thus `(x,u)↦diag(u,1)π_HT(x)` is invariant under `(x,u)↦(diag(t,1)x,ut⁻¹)` and descends through §5.5's `ℤ_p^×`-torsor; projection to `x` alone would not descend. At `u=1` this gives `β₁`-compatibility and the formula `(A,α)↦α⁻¹ker HT_A`. The formula ignores polarization, so it descends again through §5.7's whole-space pro-étale `Δ(p^∞N)`-torsor, using its cofinal-tail proof, to the arithmetic tower, compatibly with `β₂`. Finite-level and §5.8 coarse torsor arguments are confined to their free loci; they do not supply this whole-space descent. The quotient-line description `HT_A∘α` likewise ignores `λ`, extending the sections and their BHW Lemma 5.29 automorphy factors. Transport HodgeTateAndCanonicalSubgroups §§4.6–4.7's period inclusions through these maps; the anticanonical locus is a `Δ`-stable preimage.

([BHW], §8.5, Lemma 8.28, pp. 39–40.)

([BHW], §5.3, Proposition 5.18, p. 24.) The image bounds.

([BHW], §5.3, proof of Proposition 5.18, p. 24.)

For `F = ℚ`, (1)–(3) reduce to §5.3.

*Needs:* §5.4; §5.5; §5.7; §5.8; §3.12; HodgeTateAndCanonicalSubgroups §§4.1, 4.3, 4.6, 4.7, 5.2.

### 5.11 The Hilbert towers for `F = ℚ` are the modular tower

For `F = ℚ: G* = G = GL_2, Γ* = Γ, Δ(N) = Δ(p^∞N) = Δ_∞(N) = 1, Z_∞ = 1 (N ≥ 3), Res_{ℤ|ℤ}ℙ¹ = ℙ¹, e_β` is the Weil pairing, and every statement of §5.4 through §5.10 specialises to §5.1, §5.2 and §5.3 after matching tame levels (BHW's `μ_N`-structures `𝔡⁻¹ ⊗ μ_N ↪ A[N]` versus `Γ₁(N)`-structures on `E`, through the principal polarization `E ≅ E^∨` with the sign fixed by the Weil pairing).

`F = ℚ; N ≥ 4` for BHW's `μ_N`-convention.

Specialise each construction (HilbertModularVarietiesAndShimuraCurves H5 identifies the groups and moduli problems with the modular ones). Compare tame levels: `μ_N ↪ E[N]` is a `Γ₁(N)`-type structure on `E^∨ ≅ E`.

([BHW], §5.1.1, Remark 5.5, p. 19.)

The test `three_towers_F_eq_Q` of §5.4.

*Needs:* §5.1; §5.2; §5.3; §5.10; §5.8; HilbertModularVarietiesAndShimuraCurves H5.

### Examples

Over `F=ℚ`, the Hilbert groups are `GL₂` and all three towers reduce to their modular counterparts with the prescribed pairing. For `γ=(a b;c d), γ^∨=(d −b;−c a)`, so precomposition defines the left level action. Changing the polarization by a positive unit rescales the pairing inversely, which forces the unit quotient on the arithmetic tower. The `Q(√5), N=4, p=7` computation below rules out injectivity of every finite `Δ_n(N)` into `Δ(N)`.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Layer 6: general period maps and abelian descent

### 6.0 A covering family of completed toric charts

For the neat toroidal pair of §0.general.1 over `C`, with `Σ` smooth at the base level, choose a finite cover by small étale toric charts: each chart has a chart monoid `P` for the boundary and ordinary smooth coordinates chosen to be units, giving an étale map to a toric chart times a torus. Form `U_a` by adjoining all p-power roots of `P` and of those unit coordinates, and complete. Pull the entire p-level toroidal tower back to `U_a` in the fs log category, and write `V_a=U_a×_X X̃_∞`. Construct their affinoid perfectoid completions, the joint v-cover `⨿_a V̂_a^◇→S^{tor◇}`, and prove that each of these chosen maps is universally open. Rational restrictions of these charts form the covering family used below. Universal openness is asserted for this family, not for every log affinoid perfectoid test object.

Prove openness on these charts by the monoid description. At finite root depth the toric root map and the étale smooth-coordinate map are open after every base change. In a fibre product of two chosen completed charts, compare the exact fs product with the completed analytic product using extension of valuations on the saturated monoid; their valuation spaces agree after all boundary roots are adjoined. Basic opens in the inverse limit descend to finite root depth. Surjectivity of the remaining root transitions makes the image of such a basic open equal to its finite-depth image, hence open. The same calculation after pullback to a chart over a perfectoid test space proves universal openness on underlying diamond spaces. These chart comparisons and the finite-depth image equality are part of this local target, in addition to the log perfectoid existence supplied by HodgeTateAndCanonicalSubgroups §§6.21–6.23, 6.27, 6.29.

Sources: [BP25], §4.4.40 and §4.6.1, pp.80,90; HodgeTateAndCanonicalSubgroups §§6.21–6.23, 6.27, 6.29 (toric perfectoid charts and exact fs products).

**Checks.**

- At a modular cusp, the charts adjoin `q^(1/p^n)` and yield the completed cusp discs; their overlap interiors are the punctured discs and are dense.
- With empty boundary these charts are torus-root pro-étale covers of smooth affinoids; the assertion reduces to openness of their surjective inverse-limit projections.
- For `(G_m,{Nm})`, `p=5`, `K^p=K(3)^p`, `K_p=ℤ_5^×`, the tower over a finite-level C-point is `ℤ_5^××Spd C`. A chosen chart pulled back with the whole tower covers the profinite factor. The map of the single identity lift `Spd C→ℤ_5^××Spd C` has nonopen singleton image and is outside the chosen family.

*Needs:* §0.general.1; §0.3; ShimuraCompactifications §C3.general.1; HodgeTateAndCanonicalSubgroups §§6.6, 6.21–6.23, 6.27, 6.29; DiamondsAndVStacks §§D4.4–D4.6, D4.9.

### 6.1 From the pro-Kummer-étale site of `S^tor_{K,Σ}` to the v-site of the toroidal tower diamond

In the situation of §0.general.1, put `X = S^tor_{K^pK_p,Σ}` with its fs log structure along the boundary and `X_{K′_p} = S^tor_{K^pK′_p,Σ}` for open normal `K′_p ⊆ K_p`. (i) Each `X_{K′_p} → X` is a finite Kummer étale Galois cover for the effective deck group `K_p/(K′_p(K_p ∩ Z_K))`, where `Z_K` is the closure in `G(ℚ_p)` of the arithmetic centre `Z(ℚ) ∩ K`; hence `X̃_∞ := “lim” X_{K′_p}` is an object of `X_prokét` and a pro-finite Kummer étale torsor under `K_p/(K_p ∩ Z_K)`. (ii) For every log affinoid perfectoid object `V` of `X_prokét` over `X̃_∞`, its associated affinoid perfectoid space `V̂` carries a canonical map `V̂^◇ → S^{tor◇}_{K^p,Σ,∞} = lim_{K′_p}(X_{K′_p})^◇`, functorial in `V`. (iii) For the covering family `{U_a → X}` constructed in §6.0, `V_a := U_a ×_X X̃_∞` is log affinoid perfectoid and a finite subfamily of the `V̂_a^◇ → S^{tor◇}_{K^p,Σ,∞}` form a v-cover. (iv) For `V, W` in the chosen family of §6.0, the open subset of `V̂^◇ ×_{S^{tor◇}} Ŵ^◇` lying over the open Shimura variety `S_K` is dense in `|V̂^◇ ×_{S^{tor◇}} Ŵ^◇|`. Consequently, maps `V̂^◇ → Y` to a separated v-sheaf `Y` that agree over `S_K` on all such fibre products descend uniquely to `S^{tor◇}_{K^p,Σ,∞}`.

`(G, X)` a pure Shimura datum, `K = K^pK_p` neat, `Σ` a smooth projective K-admissible cone decomposition at the base level, with the notation of §0.general.1; `C` complete algebraically closed over the reflex field. Deeper levels carry the pulled-back fan and its fs log charts.

Boxer–Pilloni state Theorem 4.4.40 and describe its evaluation on perfectoid tests (§4.6.1). Layer 6 supplies the precise comparison needed to evaluate §6.1a’s parabolic reduction on the toroidal tower diamond; HodgeTateAndCanonicalSubgroups §7.34 supplies its Hodge-type specialization.

Part (iv) carries §6.0’s universal-openness conclusion for the chosen covering charts as an explicit hypothesis. It makes no density assertion for overlaps of arbitrary test objects.

For (i), finite-level cusp-lattice inclusions give finite Kummer étale maps. Uniqueness of extension from the interior identifies their Galois group with the effective group of §0.3; their limit is pro-finite Kummer étale. For (ii), a cofinal presentation `V=lim V_i` gives compatible maps `V̂→V_i→X_{K′_p}`, hence `V̂^◇→S^{tor◇}`. For (iii), use the finite covering family of §6.0. Pulling the tower back to `U_a` gives `V̂_a` as a limit of finite étale covers. For each compatible point `(x_{K′_p})`, choose `u∈|Û_a|` over `x_{K_p}`. The four-point lemma for exact fs products gives nonempty constructibly compact fibres over `(u,x_{K′_p})`; their inverse limit gives a lift to `|V̂_a|`. Thus the finite disjoint union of `V̂_a^◇` surjects on points; it is quasi-compact, and the spatial target is quasi-separated, so it is a v-cover. For (iv), all roots of boundary monomials exist on `V̂`, making its interior dense. Universal openness of the chosen `Ŵ^◇→S^{tor◇}` from §6.0 makes every nonempty open in `V̂^◇×_{S^{tor◇}}Ŵ^◇` meet the interior. Closed equalisers for separated `Y` therefore fill every overlap; the v-sheaf property descends the maps uniquely. Finite Kummer étale openness alone does not establish this universal-openness hypothesis.

([BP25], §4.4.40, the paragraph before Theorem 4.4.40 and the theorem, p. 80.) The toroidal tower diamond as a limit of diamonds and the triviality of the pro-Kummer-étale torsor over it, stated as a consequence of the logarithmic comparison without a proof of the passage to the v-site.

([BP25], §4.6.1, p. 90.) The description of the Hodge–Tate torsor on a perfectoid space over the toroidal tower through étale-local frames and their cocycle, which presupposes this comparison.

For the modular curve (`G = GL₂`, no boundary refinement needed), at a cusp the chosen completed covering charts include the perfectoid discs in the variable `q^{1/∞}` of the Tate-curve tower, and (iii) says the perfectoid cusp discs together with interior affinoid perfectoids v-cover the compactified infinite-level modular curve.

Over the open Shimura variety the comparison reduces to the identification of the pro-étale site of `S_K` with a site of affinoid perfectoid objects over `S^◇_{K^p,∞}` (no log structure).

*Needs:* §6.0; §0.general.1; §0.3; ShimuraCompactifications §C3.general.1; HodgeTateAndCanonicalSubgroups §§6.12, 6.18–6.20, 6.21–6.23, 6.27, 6.29, 6.6; DiamondsAndVStacks §§D4.4, D4.9, D4.5.

### 6.1a Canonical logarithmic association for arbitrary pure data

**Rank-removing coefficient quotient.** For a connected reductive `ℚ`-group G, write `Z=Z(G)°` and construct `rankRemovingQuotient`: the smallest central `ℚ`-subtorus `Z_r(G)⊆Z` for which `Z/Z_r(G)` has equal `ℚ`- and `ℝ`-split ranks, the quotient `q_G:G→G^r=G/Z_r(G)`, and prove that an algebraic representation factors uniquely through `q_G` exactly when `Z_r(G)` acts trivially. The removed subgroup is connected; finite central components are retained. On a finite Galois splitting field with group Δ and complex conjugation c, put `V=X_*(Z)⊗ℚ`, `e_Δ=|Δ|⁻¹Σ_δ δ` and `V₀=ker e_Δ`. The rational cocharacter space of `Z_r(G)` is the Δ-span of `V₀^{c=1}`; take its saturated integral lattice. Prove independence of splitting field, minimality, compatibility with isogenies of centres and products, and `Z_s(G)⊆Z_r(G)` for the supplied largest real-split rational-anisotropic central torus. If Z splits over a CM field, prove `Z_s(G)=Z_r(G)` and identify `G^c≅G^r` with its quotient morphism.

Prove that every arithmetic subgroup of `Z(G)(ℚ)` has finite image in `G^r(ℚ)`, and that this image is trivial for a neat arithmetic subgroup. Consequently `q_G(Z_K)=1` for the closure `Z_K` of `Z(G)(ℚ)∩K` at neat K, including conjugate component levels. Prove the finiteness criterion by decomposing the quotient torus up to isogeny into a rational split torus and a real-anisotropic torus: their arithmetic subgroups are finite, respectively by integral-unit finiteness and compactness with discreteness. Images of arithmetic subgroups under torus quotients remain arithmetic up to commensurability. The remaining central components have finite image. Continuity kills the closure. Thus `K_p/(K_p∩Z_K)→G^r(ℚ_p)` is a well-defined continuous homomorphism, with no assumption that neatness kills the original central units.

For a pure datum `(G,X)`, let `X^r` be the conjugacy class of `q_G∘h`. Prove that `(G^r,X^r)` is pure, its connected centre is CM-split, its weight is rational, and its own `Z_s` is trivial. Indeed, on the quotient of V by the Δ-span above, c acts as `+1` on the Δ-invariants and `−1` on their complement. It therefore commutes with Δ on this quotient, giving a CM splitting field; all real-split cocharacters are rational. The adjoint datum is unchanged. Prove that morphisms of pure data induce the quotient maps used for coefficient transport: the real-split central directions map into the centre of the target by the Cartan condition, and their rational Galois spans map into `Z_r` there. Define `P^r_μ=q_G(P_μ)`, `M^r_μ=q_G(M_μ)=M_μ/(Z_r(G))_F` over a common splitting field F and prove `P_μ\G≅P^r_μ\G^r`. The subtorus removed from the Levi is the one defined over `ℚ` in G, not a rank-removal operation on the split Levi over F.

Sources: [DLLZ], §5.1, p.52 (minimal rank-removing quotient), §5.2, pp.52–55 (effective coefficients); [Milne90], II (2.1.4) and Remark 2.2(d), p.32, III §3, pp.57–58. The cocharacter and arithmetic-kernel comparisons are targets here, using ReductiveGroups Layer 4 and AutomorphicBundles B0.1–B0.2.

**Checks.**

- For `GL₂` and `GSp_{2g}`, `Z_r=Z_s=1`; the quotient preserves the determinant or similitude character.
- For `Res_{F/ℚ}GL₂` with F totally real, `Z_r=Z_s=Res¹_{F/ℚ}G_m`; the quotient kills central congruence units but retains the norm of the central character.
- For `F=ℚ(∛2)`, `T=Res¹_{F/ℚ}G_m` and trivial h, `X_*(T)⊗ℚ` is the irreducible two-dimensional standard `S₃`-module. Thus `Z_s(T)=1`, but `T_ℝ≅Res_{ℂ/ℝ}G_m` has real split rank one and rational split rank zero. Its c-fixed line generates the whole module, so `Z_r(T)=T` and `T^r=1`. The unit `u=∛2−1` has polynomial `u³+3u²+3u−1=0`, norm one and real value strictly between zero and one, hence infinite order. A nontrivial power lies in every sufficiently small congruence level and acts nontrivially on F by multiplication; that representation of `T^c=T` does not descend to the effective tower. It is excluded from `Rep(T^r)`. Both flag varieties are a point, so this failure concerns coefficients, not the flag map.
- For `G=1` both quotients and the effective coefficient group are trivial; the tensor unit survives.

**Canonical principal and logarithmic models for the rank quotient.** Construct `rankQuotientCanonicalModels` for every pure `(G,X)`, neat K and smooth projective toroidal model with normal-crossings boundary. Apply AutomorphicBundles B1.general.4 and B2.general.2 to the datum `(G^r,X^r)`, whose Milne II (2.1) hypotheses and trivial `Z_s` were proved above. Pull its canonical `G^r`-principal bundle, connection and filtration back along the finite-level datum map, after base change from `E(G^r,X^r)` to `E(G,X)`. Identify this pullback with the homogeneous bundle for `Rep(G^r)` on `(G,X)` by complex uniformization and normalized special-point fibres. Prove independence of target level and component choices and compatibility with tensors, level, datum maps and Hecke correspondences.

For compatible toroidal maps on common cone refinements, pull back AutomorphicBundles B3.general.1–B3.general.3 on the quotient datum and identify the result with the zero-exponent logarithmic extension on the source: unipotent monodromy gives nilpotent residues, and ramified Kummer pullback multiplies nilpotent residues by the ramification index without changing their zero exponents. Preserve the filtration, connection, refinement and Hecke transports. This constructs the canonical filtered logarithmic tensor functor `W↦W_dR` and its parabolic and Levi torsors for `Rep(G^r)` on the original datum. When `Z(G)°` is CM-split, identify them with AutomorphicBundles' original `G^c` objects under `G^r≅G^c`. The supplier's canonical-model assertions are used on a datum satisfying their centre hypothesis; the pullback and coefficient identifications on arbitrary `(G,X)` are targets here.

Sources: [DLLZ], Propositions 5.2.10, 5.2.17 and Theorem 5.3.1, pp.54–56; [Milne90], III Theorem 4.3, pp.59–60, V Theorem 6.1, pp.90–91. ComplexComparisonPartII C5.6 supplies regular-singular canonical logarithmic extensions; ShimuraVarieties §8.22 and ShimuraCompactifications C3.general.1 supply the datum maps.

**Checks.**

- On a Hodge-type datum `q_G=id`; the principal, filtered and logarithmic models are the supplied ones, including the standard Siegel coefficient.
- On the cubic norm-one torus with trivial h, only trivial T-representations factor through `T^r=1`; their principal model is the trivial-group torsor over the original zero-dimensional Shimura variety, whose full component set is retained.
- On a boundary disc, `d+N·dq/q` pulls back under `q=t^e` to `d+eN·dt/t`. Nilpotence persists and the canonical extension has the same rank, including when `N≠0`.
- For the Tate character of `G_m`, the quotient is the identity, so its filtration and reflex-norm Galois action remain the Tate ones rather than those of the tensor unit.

Let `(G,X)` be a pure Shimura datum, `K` neat, `k/ℚ_p` a finite extension containing the completed reflex field, and `S^tor_{K,Σ}/k` smooth projective with normal-crossings boundary. First for rational representations and then by scalar extension and idempotent summands for every algebraic `ℚ_p`-representation `W` of `G^r`, construct the canonical Kummer p-adic coefficient `W_p` from the effective tower and identify its logarithmic de Rham realization with the canonical algebraic filtered bundle `W_dR` constructed by `rankQuotientCanonicalModels` above. Prove the filtered horizontal association
`W_p⊗O B_dR,log ≅ W_dR⊗O B_dR,log`,
compatible with tensors, duals, units, level, datum maps and Hecke correspondences, with nilpotent boundary residues. General logarithmic Riemann–Hilbert functors and period sheaves are HodgeTateAndCanonicalSubgroups §§7.24, 7.26; their identification with canonical coefficients for Hodge type is §§7.29–7.30. The arbitrary-data identification is owned here.

The necessary general-data comparison inputs are also targets here, in this order:

1. At a special point `(T,h)→(G,X)`, identify the canonical p-adic and de Rham fibre functors through CM motives, with their tensor and reflex-norm normalization. Use ShimuraVarieties §§4.2–4.8, 5.10–5.11 for special points and CM reciprocity, and the quotient-datum pullback above for the normalized principal model. Construct the CM-motivic comparison for the restrictions of `Rep(G^r)` to the special torus and its compatibility with the Hecke transport of the special point; a family of motives for general G is not assumed.
2. Prove the specialized rigidity inputs of [DLLZ] §5.6: for a `ℚ`-simple simply connected derived group of real rank at least two, the complex monodromy representation arising from the logarithmic p-adic realization extends algebraically after finite index, with the commuting finite quotient of Theorem 5.6.1 retained. In the non-type-A case prove that this finite-index kernel can be killed at a congruence level (§5.6, discussion after (5.6.2)); construct the Piatetski-Shapiro comparison diagrams of Lemma 5.6.7 to identify every simple factor. Treat real-rank-one/type-A factors by the abelian-type reduction of §5.5, not by a rank-one superrigidity assertion. These specialized extension, congruence and comparison-diagram results are local prerequisites of the association target.
3. Normalize the resulting tensor comparison at the special point as in [DLLZ] Proposition 5.4.5 and Lemma 5.4.7, identify it with the canonical principal model over the reflex field, and extend by the nilpotent-residue logarithmic comparison. This proves the canonical association, rather than merely constructing a logarithmic connection.

From the two `B_dR⁺`-lattices of this association construct the Hodge–Tate filtration, prove its parabolic type is the opposite `P^r_μ`, and construct its Levi torsor. The graded comparison is `gr_j(W_p⊗Ô)(j)≅gr^j(W_dR)⊗Ô`; hence the Levi comparison is `M_HT≅M_dR×^{μ,ℤ_p^×}ℤ_p(1)`. Prove that all these comparisons retain the tensor, Hecke and boundary compatibilities above. For nonsmooth deeper toroidal levels, pull back from a smooth neat level on the fs log site; the Kummer pullback comparison supplies compatibility without assuming smoothness of every deeper underlying space.

Sources: [DLLZ], Theorem 5.3.1 and Corollary 5.3.2, pp.56–57; Proposition 5.4.5 and Lemma 5.4.7, §§5.4–5.6, pp.58–66; Theorem 5.6.1 and Lemmas 5.6.5, 5.6.7, pp.64–66. [BP25], §4.4.38–4.4.40, pp.79–80, including the graded Tate twist.

**Checks.**

- On a special torus, each character of the rank quotient has the CM comparison with its prescribed reflex-norm Galois action; an arbitrary scalar normalization fails compatibility with its value on that special fibre.
- The tensor unit has trivial connection, filtration in degree zero and zero residues, and its comparison is the identity.
- For a Tate character the degree-j graded comparison retains `(j)`; deleting it changes the cyclotomic Galois action even on a zero-dimensional Shimura variety.
- For Siegel standard coefficients this is the semi-abelian comparison of HodgeTateAndCanonicalSubgroups §7.30, including the nonzero nilpotent residue at a Tate cusp.
- For a datum with an `E₇` factor the higher-rank branch applies without supplying an abelian family. A real-rank-one factor instead uses the abelian-type branch.
- An algebraic monodromy extension with a commuting finite twist is not yet the canonical comparison: the congruence-level step and special-point normalization must remove that twist compatibly with level.

*Needs:* §0.3; §0.general.1; ShimuraVarieties §§4.2–4.8, 5.10–5.11, 8.22; AutomorphicBundles §§B0.1–B0.2, B1.general.3–B1.general.4, B2.general.2, B3.general.1–B3.general.3 (on the quotient datum); ReductiveGroups Layers 4, 6–8; ComplexComparisonPartII C5.6; ShimuraCompactifications C3.general.1; HodgeTateAndCanonicalSubgroups §§6.18–6.20, 7.24, 7.26, 7.29–7.30, 7.31–7.35.

### 6.2 Evaluating the Hodge–Tate torsor on perfectoid test objects over the toroidal tower diamond

In the situation of §0.general.1 (Layer 0.general) and the canonical logarithmic association of §6.1a: let `P_HT ⊆ G_{pet,p} ×^{G^r(ℚ_p)} G^{r,an}` be the `P^r_μ`-reduction of the pro-Kummer-étale `G^r(ℚ_p)`-torsor over `S^tor_{K,Σ}` given by the logarithmic Hodge–Tate filtration. For every perfectoid space `S` with a map `S → S^{tor◇}_{K^p,Σ,∞}`, there is a `P^{r,an}_μ`-torsor `P_HT(S) ⊆ G^{r,an} × S`, functorial in `S` and compatible with base change, which étale-locally on `S̃ → S` is `P^{r,an}_μ · g_{S̃}` for an element `g_{S̃} ∈ G^{r,an}(S̃)` unique up to left multiplication by `P^{r,an}_μ(S̃)`; the cocycle `p₂^*g · (p₁^*g)⁻¹ ∈ P^r_μ(S̃ ×_S S̃)` describes `P_HT(S)`, and right translation `g_{S̃} ↦ g_{S̃}·q_G(g)` by `g∈G^{an}` carries the embedded reduction `P_HT(S)` to its translate `P_HT(S)·q_G(g)`, inducing an isomorphism of the intrinsic P-torsors. `P_HT(S)` is the preimage in `G^{r,an} × S` of the graph of the induced map `S → FL_{G^r,μ}^◇ = (P^r_μ\G^r)^{an,◇}`. This is the passage from the pro-Kummer-étale site of `S^tor_{K,Σ}` to the v-site of the diamond that Boxer–Pilloni §4.6.1 presuppose and do not prove; it is proved here from §6.1.

`(G, X)` an arbitrary pure Shimura datum (Boxer–Pilloni §4: axioms SV1–SV3), `K = K^pK_p` neat, `Σ` a fixed projective K-admissible cone decomposition, smooth for the base cusp lattice at `K`; at deeper `K^pK′_p ⊆ K` the same fan is pulled back with its changed cusp lattice and fs logarithmic Kummer charts, without asserting smoothness of every underlying deeper-level space, `F/ℚ_p` finite splitting `G` with the chosen embedding of `E(G,X)` in F; use `q_G:G→G^r=G/Z_r(G)` and the images `P^r_μ,M^r_μ` of §6.1a. Its CM-centre comparison identifies these with Boxer–Pilloni’s `G^c,P^c_μ,M^c_μ` when that hypothesis holds; for Hodge type both central subtori are trivial.

The canonical `W_p` systems of §6.1a come from the p-level tower, and their Kummer extensions come from §6.1's toroidal tower by uniqueness of extension (§§6.18–6.20 of that supplier). The effective-central-kernel theorem of §6.1a gives `q_G(Z_K)=1`: the rank-removing quotient has equal rational and real central split ranks, so the arithmetic image is finite, neatness kills that image, and continuity kills its closure. Therefore `G_{pet,p}=X̃_∞×^{K_p/(K_p∩Z_K)}G^r(ℚ_p)` has a tautological trivialization on `X̃_∞`. For log perfectoid `V` over it, the slice site is the pro-étale site of `V̂`. The parabolic reduction constructed in §6.1a is étale-locally `P_μ^{r,an}g`; its class gives `V̂^◇→FL^◇`, compatible with log fibre products. Agreement over the interior and §6.1's density and v-cover statements descend a map `π` on the entire tower. For a perfectoid `S` over the tower, pull back `G^{r,an}→FL` along `π` to define `P_HT(S)`. Smoothness gives étale-local frames and cocycle `p₂^*g(p₁^*g)⁻¹`; pullback gives functoriality. Only maps to the v-sheaf `FL^◇` are descended, without asserting v-descent of arbitrary analytic torsors. Frames differ on the left by `P^r_μ`; right translation preserves the intrinsic torsor through its translated embedding.

([BP21], §4.6.1, pp. 87–88.)

For Hodge-type data with perfect `Σ, P_HT(S)` is the pullback of the Hodge–Tate torsor along a map `S → S^{tor}_{K^p,Σ}` of perfectoid spaces (Layer 3 §3.8 (c)).

*Needs:* §6.1a; §6.1; §0.general.1; §3.1; §0.3; DiamondsAndVStacks §D4.4; AutomorphicBundles §§B0.1, B0.2; HodgeTateAndCanonicalSubgroups §§6.27, 7.30, 7.32, 7.34, 7.35, 7.29, 6.29, 6.18–6.20.

### 6.3 Boxer–Pilloni's theorem: the Hodge–Tate period map on the general toroidal tower diamond

In the situation of §6.2, the pushed-out coefficient torsor `G_{pet,p}` is trivial over the toroidal tower diamond `S^{tor◇}_{K^p,Σ,∞} = lim_{K′_p ⊆ K_p} (S^tor_{K^pK′_p,Σ})^◇` (Layer 0.general §0.general.1), which gives a `K_p`-equivariant map of v-sheaves `π^tor_HT: S^{tor◇}_{K^p,Σ,∞} → FL_{G^r,μ} = P^r_μ\G^r` (right action), sending a test object `S` to the class of `g_S` of §6.2. The pullback along `π^tor_HT` of the `M^r_μ`-torsor `U_{P^r_μ}\G^r → FL` is `M^{an}_HT`, and `M^{an}_HT ≅ (M^{an}_dR ×^{μ, ℤ_p^×} ℤ_p(1)) ×_{S^tor_{K^pK_p,Σ}} S^{tor◇}_{K^p,Σ,∞}`, the pullback from finite level of the canonical extension of the de Rham Levi torsor twisted by the cyclotomic character through `μ` (Boxer–Pilloni Theorem 4.4.40 in the authors' revised form; the arXiv v1 statement omits the twist). On the open subdiamond `S^◇_{K^p,∞}, π^tor_HT` restricts to the Hodge–Tate period map, and for Hodge-type data and perfect `Σ` it is the map of Layer 3 §3.8 (c). No perfectoidness of the toroidal diamond, no affineness of `π^tor_HT` and no factorisation through a minimal compactification are asserted for general data.

Only `K_p` acts on the fixed-`Σ` tower; equivariance for `G(ℚ_p)` is through the Hecke correspondences of §6.15.

The trivialization over the tower uses §6.2: the effective deck group, annihilation of the arithmetic central kernel in `G^r`, and the log-to-v comparison of §6.1, whose density part (iv) uses universal openness of the chosen covering charts of §6.0; the tower is not assumed to be a faithful `K_p`-torsor.

Pull §6.2's flag map and Levi torsor to the tower, using the effective-deck trivialization of `G_{pet,p}`. The finite-level comparison constructed in §6.1a is `M_HT≅M_dR×^{μ,ℤ_p^×}ℤ_p(1)` with canonical extension, rather than an untwisted identification. Its open Hodge-type restriction agrees with the universal-abelian Hodge-tensor construction (HodgeTateAndCanonicalSubgroups §§7.35–7.36), hence with §3.5. For perfect `Σ` it also agrees with §3.8`(c)`: the equaliser in the separated flag diamond is closed and contains the dense interior, so has every point and is the whole diamond. This uses DiamondsAndVStacks §D4.9, beyond full faithfulness only between perfectoid objects.

([BP21], §4.4.38–4.4.40, pp. 77–78.)

([BP25], §4.4.40, Theorem 4.4.40, p. 80.) The twisted torsor identification in the authors' manuscript.

For the Siegel datum and `Σ` in §1.29’s induced-fan range, `π^tor_HT` is that toroidal representative’s map to the minimal tower composed with the minimal `π_HT`.

For a datum of non-abelian type (e.g. with an `E₇` factor) the map exists although no perfectoid representative of the toroidal tower is known.

*Needs:* §6.1a; §6.2; §6.1; §0.general.1; §3.1; §3.5; §3.8; HodgeTateAndCanonicalSubgroups §§2.1–2.3, 7.35, 7.36; AutomorphicBundles §§B3.general.1, B1.general.4 (on the quotient datum via §6.1a); DiamondsAndVStacks §D4.9.

### 6.4 Auxiliary data for an abelian-type datum: the Hodge-type cover and Lovering's `B₁`

For an abelian-type datum use ShimuraData §§4.2, 4.8–4.9's Hodge central derived cover `G₁`, composite reflex field `E`, torus `T=Res_{E/ℚ}G_m`, and distinguished datum `B₁=G₁×_{G₁^ab}T`, with maps through `B` to `G` and common adjoint flag. The new comparison concerns a datum map `g:H→S` inducing `H^ad=S^ad`. At compatible neat `K′,K` and smooth projective `Σ` for `S`, prove that the open map is finite étale, that the induced toroidal map is finite, and, when `g(K′)` is normal in `K`, that neutral components are Galois with group `Δ(K,K′)=Γ_K^ad/Γ_{K′}^ad`; its action extends to the toroidal compactification with quotient the target. Sources: Lovering §§4.6.1–4.6.6, pp.1877–1881, Lemma 3.1.6, p.1857; BP Proposition 4.4.42.

`(G, X)` of abelian type; neat levels; `Σ` smooth projective.

This is not the pre-abelian representability argument of Layer 4: it uses the Hodge cover `G₁` through a central isogeny of derived groups, Lovering's `B₁`, Deligne's reconstruction from connected components and finite quotients.

ShimuraData §§4.8–4.9 supplies `B₁`, its maps and its Milne-quotient coefficient identities; §6.5 gives the rank-quotient identities, and the finite toroidal Galois comparison here uses the same underlying data.

Lovering's construction of `B₁` and of the maps (Lovering §§4.6.1–4.6.6, pp. 1877–1881, and Lemma 3.1.6, p. 1857). Proposition 4.4.42: over `ℂ` both neutral components are `X⁺` modulo arithmetic subgroups of the common adjoint group, of finite index in one another; rational parabolics correspond under `P ↦ g⁻¹(P)` (Harris §2.4), giving finiteness on toroidal charts; normality gives the Galois action.

([BP21], §4.4.41 and Proposition 4.4.42, pp. 78–80.)

Consume the cover, Lovering datum and flag comparisons of ShimuraData §§4.2, 4.8–4.9. Construct `AbelianType.deltaGroup` and `AbelianType.neutral_galois` for the finite quotient of adjoint arithmetic groups and its toroidal Galois action. The coefficient Levi fibre products for `G^r` are proved in §6.5 and compare with ShimuraData §4.9 under the CM-centre hypothesis.

**Checks.**

- `abelian_aux_hodge_trivial`: For the Siegel datum `(GSp_2g, H_g^±)` with `G₁ = G: E = ℚ, T = G_m` and `T → G^ab = G_m` is the identity (the similitude of `μ(z)` is `z`), so `B₁ = G`; for `f = id` and `K′ = K, Δ(K, K) = 1`.
- `abelian_aux_hilbert`: For `G = Res_{F/ℚ}GL_2` and `G₁ = G*` (both with reflex field `ℚ`, so `T = G_m → G₁^ab = G_m` is an isomorphism and `B₁ = G*`), `K = K(N) = {g ≡ 1 mod N}` and `K′ = K ∩ G*(𝔸_f)`: the determinant identifies `Δ(K, K′)` with `(𝒪_F^{×,+} ∩ (1 + N𝒪_F))/(𝒪_F^× ∩ (1 + N𝒪_F))²`, the denominator coming from the scalar matrices in `Γ_K`.
- `abelian_aux_not_preabelian_proof`: A pre-abelian datum that is not of abelian type (an isomorphism of adjoint connected data without a central isogeny of derived groups) has no `B₁` of this form; the construction does not apply.

For `G = Res_{F/ℚ}GL_2` (Hilbert), `G₁ = G*` is a Hodge-type cover and `Δ` is the unit group quotient of Layer 5.

*Needs:* §0.5; ShimuraData §§4.2, 4.6; ShimuraVarieties §6.7; ShimuraCompactifications §§C2.general.1, C3.general.1.

### 6.5 Fibre products of torsors and the de Rham torsor of `B₁`

(i) Let `H₁ → H₂ ← H₃` be smooth affine group schemes over a base `S` with `H₁ → H₂` smooth and surjective (in the application `G₁ → G₁^ab` and `M_{μ_{G₁}} → M^{ab}_μ`), `P_{H_i}` étale torsors and isomorphisms `θ₁: P_{H₁} ×^{H₁} H₂ ≅ P_{H₂}, θ₃: P_{H₃} ×^{H₃} H₂ ≅ P_{H₂}`. Then `P_{H₁} ×_{P_{H₂}} P_{H₃}` is an étale `(H₁ ×_{H₂} H₃)`-torsor (Boxer–Pilloni print `P_{H₁} ×_{P_{H₂}} P_{H₁}`). (ii) In the situation of §6.4, for `K ⊆ B₁(𝔸_f)` and `Σ` for `G₁` there are levels `K₁, K₂, K₃` and maps `π₁: S^tor(B₁)_{K,Σ} → S^tor(G₁)_{K₁,Σ}, π₂: S^tor(B₁)_{K,Σ} → S(T)_{K₂}` over `S(G₁^ab)_{K₃}`, with `M_dR(B₁) ≅ π₁^*M_dR(G₁) ×_{π₃^*M_dR(G₁^ab)} π₂^*M_dR(T)` canonically, and likewise for `M_HT`; with `M^r_{μ_{B₁}} = M_{μ_{G₁}} ×_{(G₁^ab)_F} (T^r)_F`, constructions for `G₁` extend to `B₁` by the trivial construction on the zero-dimensional T-Shimura variety (Principle 4.4.44(1)).

Smooth surjectivity of `H₁ → H₂` is needed: flatness of `H₁ ×_{H₂} H₃` does not suffice (for `H₁ = H₃ = 1, H₂ = G_m` and two different trivialisations `θ₁, θ₃` of `P_{H₂}` the fibre product is the equaliser of two sections, not a torsor). It holds for `G₁ → G₁^ab` (quotient by `G₁^der`) and for `M_{μ_{G₁}} → M^{ab}_μ` (surjective because `M_{μ_{G₁}}` contains the centre).

For the coefficient groups prove `Z_r(B₁)=1×Z_r(T)` and `M^r_{μ_{B₁}}=M_{μ_{G₁}}×_{(G₁^ab)}T^r`, over the common splitting field. Since G₁ is Hodge type, `Z_r(G₁)=Z_r(G₁^ab)=1`; on rational central cocharacter spaces the rank-removal construction of §6.1a is exact by semisimplicity of finite Galois representations in characteristic zero, and `Z_r(T)` maps trivially to `G₁^ab`. This gives the kernel and fibre-product identities. ShimuraData §4.9 supplies their `Z_s` versions; the two identities coincide when the centres are CM-split. The base is `G₁^ab`, rather than the abelianization of the Levi.

(i) Étale-locally choose sections `p₁` of `P_{H₁}` and `p₃` of `P_{H₃}; θ₁(p₁)` and `θ₃(p₃)` differ by a section `h₂` of `H₂`, which lifts étale-locally to `H₁` because `H₁ → H₂` is smooth and surjective; correcting `p₁` by the lift gives a section of the fibre product, on which `H₁ ×_{H₂} H₃` acts simply transitively. For (ii), use the rank-quotient group identity above and §6.1a’s functorial canonical models. With that identity, functoriality gives a morphism of torsors to the fibre product, and the torsor principle in (i) makes it an isomorphism. The group identity does not follow just from the torsor principle.

([BP21], §4.4.42, paragraph before Theorem 4.4.43, p. 80.) The fibre-product torsor (with the misprinted index). [DLLZ], §5.1, p.52 supplies the rank quotient used here; §6.1a’s cocharacter construction gives its fibre-product identity.

([BP21], Principle 4.4.44, p. 82.)

For `H₂=H₃=1` in (i), the fibre product is the original `H₁`-torsor.

**Checks.**

- For the identity diagram `H₁=H₂=H₃=H`, with both comparison maps the identity on the same torsor P, the fibre product is the diagonal P and its group is the diagonal H.
- For constant étale groups `H₁=H₃=ℤ/4`, `H₂=ℤ/2`, both maps reduction, the trivial fibre-product torsor has eight points `(a,b)` with `a≡b mod 2`; the fibre-product group acts freely and transitively by coordinatewise translation. This is a nontrivial smooth-surjective example.
- For `H₁=H₃=1`, `H₂=G_m`, choose the two sections 1 and 2 over `Spec ℚ`; the fibre product is empty. Flatness of its trivial group does not make it a torsor: surjectivity of `H₁→H₂` fails.
- In the Siegel application `G₁^ab=T=G_m` with identity torus map, `B₁=G₁` and the de Rham fibre product is the original Levi torsor.
- In the Hilbert application `G₁=G*`, `G₁^ab=T=G_m` again gives `B₁=G*`; pushing to the full arithmetic G still retains the separate unit quotient of §6.4.
- For a pure torus datum, the group fibre-product construction uses representations of `T^r` on zero-dimensional coefficient torsors. When h gives a Tate character, it retains that character and its cyclotomic twist; the zero dimension does not identify the twisted and untwisted Galois actions.

*Needs:* §6.4; §6.1a; ShimuraData §§4.8–4.9; AutomorphicBundles §§B1.9, B1.6 (for their stated centre hypotheses).

### 6.6 Connected towers of abelian-type data: comparison with the Hodge cover and the descent group `Δ`

In the situation of §6.4: (1) the connected-component towers `lim_K S⁰(B₁)_K` and `lim_K S⁰(G₁)_K` are canonically isomorphic, also for minimal and (compatible) toroidal compactifications; (2) for `K^p ⊆ B₁(𝔸_f^p)` there is `(K^p)′ ⊆ G₁(𝔸_f^p)` with a finite étale Galois map `lim_{K′_p} S⁰(G₁)_{(K^p)′K′_p} → lim_{K_p} S⁰(B₁)_{K^pK_p}`; (3) for `f: B₁ → G` and `K ⊆ G(𝔸_f)` neat there is `K′` with `S⁰(B₁)_{K′} → S⁰(G)_K` finite étale Galois with group `Δ(K, K′)`, and for `K^p` there is `(K′)^p` with `lim_{K′_p} S⁰(B₁)_{(K′)^pK′_p} → lim_{K_p} S⁰(G)_{K^pK_p}` finite étale Galois; (4) Deligne's reconstruction: `S(G, X) = [S⁰(G, X) × 𝒜(G)]/𝒜⁰(G)` with `𝒜(G) = G(𝔸_f)/Z(ℚ)⁻ *_{G(ℚ)_+} G^ad(ℚ)⁺` and `𝒜⁰(G)` the completion of `G^ad(ℚ)⁺` for the congruence topology of `G^der(ℚ)_+`, the same for minimal compactifications; (5) `A⁰(B₁) → A⁰(G)` is a continuous surjection whose kernel `Δ` is profinite, and `S⁰(B₁) → S⁰(G)` is pro-finite-étale Galois with group `Δ`; at fixed levels the finite groups `Δ(K, K′)` of (3) are used, and `Δ = lim Δ(K, K′)`.

`(G, X)` of abelian type with the data of §6.4; neat levels.

Over `ℂ ≅ ℂ_p` from here on, as in Boxer–Pilloni (rationality is not tracked).

(1) Connected components depend only on the connected datum, and `(G₁^der, X₁⁺) = (B₁^der, X_{B₁}⁺)`; the congruence topologies on the adjoint group induced from `H(ℚ)_+` and `H^der(ℚ)_+` coincide (Layer 0 §0.5). (2), (3) At fixed tame level choose a first finite Galois map with deck group `Δ₁` as in Proposition 4.4.42 and the proof of Theorem 4.4.43, arXiv v1 p. 81. Every deeper `Δ_n` embeds into this same `Δ₁` by compatibility of the arithmetic subgroups. The decreasing images therefore stabilize, proving finiteness of the p-level limit at fixed tame level. Merely having injective maps between finite groups would not give a uniform bound. The limit over all adelic levels in (5) is instead profinite. (4) Deligne's §2.1 reconstruction (ShimuraVarieties §6.4); the minimal compactification has the same components and the group actions extend by normality. (5) Mittag-Leffler for the system of finite groups `Δ(K, K′); f⁻¹` of congruence subgroups are congruence, and the kernel of `G^der(ℚ)_+ → G^ad(ℚ)⁺` is finite.

([BP21], Theorem 4.4.43, §4.4.48 and Lemma 4.4.52, pp. 80–85.)

([BP21], §4.4.48, p. 83.)

For `G` of Hodge type with `G₁ = G, B₁^der = G^der`, so `A⁰(B₁) = A⁰(G)` and `Δ` is trivial in (5); (3) reduces to the neutral-component deck groups of Layer 0.

*Needs:* §6.4; §6.5; §0.5; §0.3; ShimuraVarieties §§6.4, 6.3.

### 6.7 Tilde-limits of connected components, finite quotients and induced towers

Let `(X_i)_{i∈I}` be a cofiltered system of separated adic spaces locally of finite type over `Spa(C, O_C)` with finite transition maps, and `X` a perfectoid space with `X ~ lim_i X_i` (PerfectoidSpaces §P7.2), with projections `φ_i`. (i) Components (Boxer–Pilloni Lemma 4.4.6): if every `X_i` has a finite set `Π_i` of connected components and `Π := lim_i Π_i`, then for `e = (e_i) ∈ Π` the subset `X_e := ⋂_i φ_i⁻¹(X_{i,e_i})` underlies a perfectoid space, on every affinoid perfectoid `U ⊆ X` the Zariski-closed subspace cut out by the idempotents `1 − ε_i` of the open and closed subsets `U ∩ φ_i⁻¹(X_{i,e_i})`, and `X_e ~ lim_i X_{i,e_i}`. (ii) Finite quotients (the tilde-limit half of Boxer–Pilloni Lemma 4.4.7): if a finite group `Δ` acts compatibly on the `X_i` and on `X`, and some `X_{i₀}` has a `Δ`-stable cover by pregood affinoids (affinoids `V` whose preimages `φ_{i₀}⁻¹(V)` are good affinoid perfectoids, PerfectoidSpaces §P7.4), then for `i → i₀` the quotients `X_i/Δ` are adic spaces with finite transition maps, `X/Δ` is a perfectoid space covered by the `φ_{i₀}⁻¹(V)/Δ`, and `X/Δ ~ lim_i X_i/Δ`. (iii) Induction (the step of Boxer–Pilloni Lemma 4.4.50): let `H` be a profinite group with a decreasing sequence of open normal subgroups `H_n, ⋂_n H_n = 1, S ⊆ H` a closed subgroup, and `(Y_n)_n` a tower as above with `Y ~ lim_n Y_n` perfectoid, `S` acting compatibly on `Y` and on each `Y_n` through `S/(S ∩ H_n)`; put `X_n := Y_n ×^{S/(S∩H_n)} (H/H_n)`, a finite disjoint union of copies of `Y_n`, and `X := Y ×^S H` for the right action on `Y`, with relation `(y, h) ∼ (y·s, s⁻¹h)`. Then `X` is a perfectoid space, isomorphic to `Y × (S\H)` after choosing a continuous section `σ` of `H → S\H`, and `X ~ lim_n X_n`, compatibly with the right H-actions. The product carries the action transported through this section, not a trivial action on its Y-factor.

`C` complete algebraically closed of characteristic 0 (in (ii) `|Δ|` is invertible, which gives the averaging projector).

In (ii) the `Δ`-stable pregood cover is a hypothesis; the application supplies it.

On a finite-stage good affinoid `U=Spa(A,A⁺)`, component idempotents `ε_i` cut out `U∩X_e` by the ideal generated by `1−ε_i`. The resulting perfectoid quotient `A→A_e` is surjective, has dense finite-stage image and underlying space `lim|U_i∩X_{i,e_i}|`; glue (PerfectoidTowers §P8.21; PerfectoidSpaces §§P4.15, P7.12). For (ii), the cited finite quotient theorems give `X_i/Δ` and `X/Δ`. The map `|X|/Δ→lim|X_i|/Δ` is bijective by inverse limits of nonempty finite orbits, and open by finite-stage descent of invariant opens. Averaging a`↦|Δ|⁻¹Σδa` gives density of `colim A_i^Δ` in `A^Δ` on invariant good affinoids. For (iii), invert the pinned section of `H→H/S` to obtain `σ:H→S\H`. The formulas `[(y,h)]↦(y·(hσ(Sh)⁻¹),Sh)` and `(y,q)↦[(y,σ(q))]` identify the induction with `Y×(S\H)`, hence make it perfectoid. Over `Y_n·h` the fibre is `Y×((S∩H_n)\H_n)` with affinoid ring `C⁰((S∩H_n)\H_n,A)`. Finite clopen partitions and density of finite-stage rings approximate continuous functions; compactness gives the underlying-space limit, and gluing gives the tilde-limit. Left cosets are essential if `S` is not normal.

([BP21], §4.4.1, Lemma 4.4.6, p. 64.)

([BP21], §4.4.1, Lemma 4.4.7 with proof, pp. 64–65.)

([BP21], §4.4.48, proof of Lemma 4.4.50, p. 84.)

For a single connected component (`Π` a point) (i) is the identity, and for `Δ` acting trivially (ii) is the identity.

For the modular curve tower at tame level `K^p` and `H = GL_2(ℤ_p)`, (iii) with `Y` the neutral-component tower and `S` its stabiliser recovers the full perfectoid modular curve from the neutral component when `K^p = GL_2(Ẑ^p)`, where `H` acts transitively on `π₀` through the determinant.

**Checks.**

- Components: for `Π` a point, all idempotents are 1 and `X_e=X`.
- Components: in the constant two-point tower over C, `A=C×C` and `ε=(1,0)` select the first point; quotienting by `1−ε=(0,1)` gives C by the first projection.
- Components: for the tower of finite sets `Π_n=ℤ/p^n` and `X_n=Π_n×Spa C`, a compatible sequence selects one point in `ℤ_p×Spa C`. That component is closed and not open; treating the intersection of clopens as itself clopen fails.
- Finite quotients: a trivial Δ-action leaves the tower and its tilde-limit unchanged.
- Finite quotients: the order-two group swapping the factors of `C×C` has invariants `{(a,a)}`; the quotient of the two-point constant tower is one point, with averaging `(a,b)↦((a+b)/2,(a+b)/2)`.
- Finite quotients: on `ℤ/4` the involution `a↦a+2` has two orbits, separated by reduction modulo 2. The invariant functions form `C×C`, not C; quotients need not be connected.
- Induction: in `H=S₃`, take `S=Stab(0)`, `s=(1 2)` and `h=(0 1)`. Then `S(sh)=Sh`, but `S(hs)≠Sh`. Left cosets are detected by `h⁻¹(0)`; right cosets are detected by `h(0)`. The relation `(y,h)∼(y·s,s⁻¹h)` uses the former.
- Induction: let this S act nontrivially on a two-point Y. With section `σ(S)=1`, right multiplication by s sends `(y,S)` to `(y·s,S)`. The transported action is nontrivial on Y even though the base coset is fixed.
- Induction: for `S=1` the relation is equality, `Y×^S H=Y×H`, and right translation acts on H alone. For `S=H` the identification `[(y,h)]↦y·h` gives back Y with its original action.

*Needs:* `tauceti:TauCeti.exists_continuous_section`; PerfectoidSpaces §§P7.2, P7.4, P7.12, P4.15, P6.8; PerfectoidTowers §§P8.21, P8.10, P8.8, P8.2.

### 6.8 The abelian-type minimal-compactification period map

Let `(G, X)` be of abelian type with auxiliary data `(G₁, X₁), (B₁, X_{B₁})` (§6.4), over `C = ℂ_p` (`ℂ ≅ ℂ_p` fixed). Then: (1) there is a perfectoid space `S̄*(G)_{K^p} ~ lim_{K_p} S*(G)_{K̄^pK_p}` (Boxer–Pilloni's image-type compactification, depending on the Siegel embedding of `G₁`, with finite maps `S*_K → S*_{K̄}` that are isomorphisms away from the boundary) and the perfectoid space `S*(G)_{K^p} = lim_{K_p} S*^◇(G)_{K^pK_p}` (genuine minimal compactifications, perfectoid by Layer 4 §4.5 since abelian type is pre-abelian); (2) there is a `G(ℚ_p)`-equivariant, prime-to-p Hecke-equivariant map `π_HT: S*(G)_{K^p} → S̄*(G)_{K^p} → FL_{G,μ}`; (3) `S̄*(G)_{K^p} → FL_{G,μ}` is affinoid: `FL_{G,μ}` is covered by affinoids whose preimages are good affinoid perfectoid; (4) the maps for `B₁, G₁` and `G` form a commutative diagram over `FL_{G,μ} = FL_{G₁} = FL_{B₁}`, equivariant for `B₁(𝔸_f), G₁(𝔸_f), G(𝔸_f)`. This is a period-map theorem for abelian-type data, proved by the Hodge cover, Lovering's `B₁`, Deligne's reconstruction and finite quotients by the stabilized fixed-tame deck group `Δ_{K^p}`, distinguished from the full adelic profinite `Δ`; it is not the pre-abelian representability proof of Layer 4, and for pre-abelian data that are not of abelian type no minimal period map is asserted.

`(G, X)` of abelian type; over `ℂ_p`.

Finite quotients of tilde-limits use a `Δ`-invariant cover by pregood affinoids, supplied by affineness of the period map for `G₁` and triviality of the `Δ`-action on `FL`.

Start with §3.8's Hodge-type period map for `G₁`. At fixed tame level, §6.6 expresses each `B₁` neutral component as a finite quotient of a `G₁` component. Section 6.7 passes tilde-limits through components and finite quotients with invariant pregood covers, then induces over finitely many `K_p`-orbits on `π₀`. The map `(x,a)↦π_HT(x)·a` on `S̄^{*,0}(G₁)×𝒜(B₁)` descends under `(x,a)·h=(xh,h⁻¹a)` because the Hodge map is right `𝒜⁰`-equivariant. It yields the right `𝒜(B₁)`-equivariant map on the induced quotient. At compatible tame levels, the stabilized finite `Δ_{K^p}` of §6.6 acts trivially on `FL`; affinoid period preimages give its invariant pregood cover. Descend the map to the neutral G-tower, induce to `S̄*(G)`, and compose `S*(G)→S̄*(G)` (BP Lemmas 4.4.50–4.4.51, Proposition 4.4.53).

([BP21], Theorem 4.4.45, Lemmas 4.4.50–4.4.52 and Proposition 4.4.53, pp. 82–85.)

([BP21], §4.4.40, p. 78.) Why the minimal period map is proved only for abelian type.

For `G = Res_{F/ℚ}GL_2` (Hilbert, abelian type) it recovers on the open part the period map of the arithmetic Hilbert tower descended in §5.10 (1).

**Checks.**

- For the identity Hodge cover in the Siegel case, the finite descent group is trivial and the image-compactified period map is §3.8(a), including its affinoid preimages.
- For Hilbert data the map on the arithmetic open tower is §5.10's polarization-invariant map; changing a positive-unit polarization cannot move its flag point. A nontrivial finite descent quotient must identify the corresponding flag values.
- For a torus datum the flag is a point; the construction reconstructs the full profinite component set from neutral components and their stabilizers, without replacing that component set by a point.
- Finite descent requires invariance: on a two-point set interchanged by Δ, a function with values 0 and 1 in a two-point target does not descend. With equal values it does. The trivial Δ-action on FL in this theorem is what makes the descended map well defined.

*Needs:* §6.4; §6.6; §6.5; §6.7; §3.8; §4.5; §0.5; §3.1; PerfectoidTowers §§P8.8, P8.7.

### 6.9 The Levi torsor of an abelian-type datum from its Hodge cover

In the situation of §6.4, for neat `K ⊆ G(𝔸_f), K′ ⊆ B₁(𝔸_f)` with `f(K′)` normal in `K` and `Σ` for `G`: over the neutral toroidal component `S^{tor,0}(G)_{K,Σ}`, the de Rham Levi torsor `M_dR(G, X)` is the quotient by `Δ(K, K′)` of `M_dR(B₁) ×^{M^r_{μ_{B₁}}} M^r_{μ_G}` over `S^{tor,0}(B₁)_{K′,Σ}` (after refining `Σ` so that `S^{tor,0}(B₁)_{K′,Σ} → S^{tor,0}(G)_{K,Σ}` is finite and generically finite étale with group `Δ(K, K′)`), and the same holds for `M_HT` on the towers; with the fibre-product description of §6.5 this expresses `M_HT(G)` through `M_HT(G₁)` and the torus `T`.

Abelian type; the refinement of `Σ` is part of the statement (the source includes a refinement of `Σ`).

The necessary triviality of boundary inertia on the pushed-out torsor is a separate supplier obligation; generic Galoisness alone is insufficient.

Push out `M_dR(B₁)` along `M^r_{μ_{B₁}} → M^r_{μ_G}` (functoriality for `G^r` from §6.1a; comparison with AutomorphicBundles §B1.9 in its stated range). The finite toroidal map can ramify at boundary strata. Descent of a locally free torsor through its coarse finite quotient requires the logarithmic descent theorem and trivial action of boundary inertia on the pushed-out fibres; it cannot be justified by ordinary finite étale torsor descent on the interior. Prove the boundary-inertia theorem here using §6.1a’s canonical logarithmic models and the finite boundary foundations of ShimuraCompactifications `C3.general`; the AutomorphicBundles `B3.general` coefficient comparisons apply on the quotient data and are pulled back as in §6.1a. Then descend `M_dR` and use the logarithmic comparison for `M_HT`.

([BP21], Theorem 4.4.43(5) and Remark 4.6.6, pp. 81, 89–90.)

*Needs:* §6.5; §6.6; §6.3; §6.1a; AutomorphicBundles §B1.9 (in its stated range); ShimuraCompactifications C3.general.1.

### 6.10 Compatibility of the toroidal and minimal period maps for abelian type

For `(G, X)` of abelian type over `ℂ_p`, the composite `S^{tor◇}(G)_{K^p,Σ,∞} → S*(G)_{K^p} → FL_{G,μ}` of the toroidal-to-minimal map with the minimal period map of §6.8 equals `π^tor_HT` of §6.3. Boxer–Pilloni assert this in Theorem 4.4.45 without proof.

Abelian type; `Σ` fixed; the toroidal tower is only a diamond.

On the open subdiamond both maps are the Hodge–Tate period map of the relative Hodge–Tate filtration: for `G₁` by Layer 3 §3.5, transported to `B₁` and `G` through §6.5 and §6.9, compatibly with the descent group `Δ`. Uniqueness: let `Y := S^{tor◇}(G)_{K^p,Σ,∞}`. Because `FL` is separated, the equaliser `Z ⊆ Y` of the two maps `Y → FL^◇` is a closed subdiamond (pullback of the closed diagonal). `|Z|` is closed and contains `|S^◇(G)_{K^p,∞}|`, which is dense in `|Y| = lim_{K′_p} |S^tor_{K^pK′_p,Σ}|` (DiamondsAndVStacks §D4.5): at each level the boundary is nowhere dense, and the projections from the open limit are surjective (the fibres of the finite étale levels are finite and non-empty). Hence `|Z| = |Y|`; a closed immersion of diamonds that is surjective on points is bijective on geometric points, hence an isomorphism (DiamondsAndVStacks §D4.9), so `Z = Y`.

([BP21], Theorem 4.4.45, p. 82.)

For Hodge-type data with perfect `Σ` it is the factorisation in Layer 3 §3.8 (c).

*Needs:* §6.8; §6.3; §6.9; §3.5; DiamondsAndVStacks §§D4.9, D4.5.

### 6.11 Integral structure of the Levi torsor at hyperspecial-type level

Assume `G_{ℚ_p}` quasi-split with a reductive model over `𝒪_F, M^r_μ ⊆ M^{r,an}_μ` the corresponding quasi-compact open subgroup, and `K_p ⊆ G(ℚ_p) ∩ G(𝒪_F)`. Then the étale `M^{r,an}_μ`-torsor `M^{an}_dR` over `S^tor_{K^pK_p,Σ}` (the canonical extension of the de Rham Levi torsor; §6.3) has a reduction to an étale `M^r_μ`-torsor `M_dR` (Boxer–Pilloni Proposition 4.6.3). Over the toroidal tower diamond, `M_HT := M_dR ×^{μ,ℤ_p^×} ℤ_p(1)` is the `M^r_μ`-reduction of `M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1)` given by integral trivialisations (the cyclotomic character through `μ` lands in `M^r_μ` since `μ(ℤ_p^×) ⊆ M_μ(𝒪_F)`). The twist by `ℤ_p(1)` exists only over the tower (`ℤ_p(1)` is pro-étale, not étale, over `S^tor_{K^pK_p,Σ}`), so the descent to finite level is performed on the untwisted `M_dR`.

Abelian type (Boxer–Pilloni §4.5–4.6), quasi-split `G_{ℚ_p}, F` large enough to split `G`.

The descent uses that the étale torsor `M^{an}_dR` is already defined at finite level, because pro-étale descent is not effective in general (Remark 4.6.5).

The quotient used to descend the open reduction is by the effective deck group `K_p/(Z_{K^p} ∩ K_p)`. Compatibility of the `G^r`-torsor with this kernel is the effective-central-kernel theorem of §6.1a, applied in §6.2. All compact and depth subgroups with superscript r in §§6.11–6.15 are their sheaf images under `q_G`; choose the reductive models over F compatibly with this quotient.

On a perfectoid `S` over the tower choose integral `g_{S̃} ∈ G^r(S̃)` (§6.2); the cocycle `p₂^*g_{S̃}·(p₁^*g_{S̃})⁻¹` lies in `P^r_μ(S̃ ×_S S̃)`; its projection to `M^r_μ` defines a reduction `M_HT ⊆ M^{an}_HT` over the tower, functorial in `S`. Untwist: `M_dR := M_HT ×^{μ,ℤ_p^×} ℤ_p(−1)` is an open subset of `M^{an}_dR ×_{S^tor_{K^pK_p,Σ}} S^{tor◇}_{K^p,Σ,∞}`. Right multiplication by `k ∈ K_p ⊆ G(𝒪_F)` replaces `g_{S̃}` by `g_{S̃}q_G(k)` and leaves the cocycle unchanged, so this open is `K_p`-invariant; since `|M^{an}_dR|` is the quotient of the pullback by `K_p`, it descends to an open `M_dR ⊆ M^{an}_dR`. The action map identifies `M^r_μ × M_dR` with `M_dR × M_dR` (checked after pullback), and `M_dR → S^tor_{K^pK_p,Σ}` is smooth and surjective on geometric points, so `M_dR` is an étale torsor.

([BP21], §4.6, Proposition 4.6.3 and Remark 4.6.5, pp. 88–89.)

([BP25], §4.6.2, proof of Proposition 4.6.3, p. 91.) The revised manuscript defines the twisted torsor over perfectoid test objects and untwists before descending.

([BP25], §4.6.2, Remark 4.6.4, pp. 90–91.)

The integral structure is not the one of invariant differentials on an integral model: in the Siegel case (ignoring the centre) `M^{an}_dR` is the torsor of trivialisations of `ω_A`, and a differential is integral for `M_dR` if it lies in the span of the image of the integral Tate module under the Hodge–Tate map (Boxer–Pilloni Remark 4.6.4); for `GL_2` at level `GL_2(ℤ_p)` (ignoring the centre), `M_dR` is the torsor of generators of the `𝒪⁺`-lattice of `ω` spanned by the Hodge–Tate image of `T_pE`.

*Needs:* §6.3; §6.2.

### 6.12 The analytic level groups `G_{m,n}, G¹_{m,n}` of a reductive `𝒪_F`-group and their Iwahori decompositions

Let `F/ℚ_p` be finite and `G` a split reductive group over `𝒪_F` with Borel `B = TU`, opposite Borel `B̄ = TŪ` and roots `Φ = Φ⁺ ⊔ Φ⁻`. Write `𝒢` for the quasi-compact adic space attached to `G` (the generic fibre of its p-adic completion), `Iw = ]B_k[_𝒢` for the Iwahori (the tube of the special fibre of `B`), `𝒰_α ≅` unit ball for the root group of `α, 𝒰°_α` for the tube of the identity, `𝒰_{α,m} = {|u_α| ≤ |p^m|}` and `𝒰°_{α,m} = ⋃_{m′>m} 𝒰_{α,m′}`. For `m, n ∈ ℚ_{≥0}` let `𝒢_{B,m}, 𝒢_{U,m}, 𝒢_{B̄,n}, 𝒢_{Ū,n}` be the affinoid subgroups of elements reducing into `B, U, B̄, Ū` modulo `p^m` (resp. `p^n`), `𝒢°_{B,m} = ⋃_{m′>m} 𝒢_{B,m′}`, and put `𝒢_{m,n} = 𝒢°_{B,m} ∩ 𝒢_{B̄,n}` and `𝒢¹_{m,n} = 𝒢°_{U,m} ∩ 𝒢_{Ū,n}`, together with their partial closures (sets of specialisations). Then: (1) all of these are subgroups of `𝒢^{an}` (as functors on complete Huber pairs), with `𝒢_{0,0} = Iw`; (2) strong Iwahori decomposition: for every ordering of `Φ` the product map `𝒯 × ∏_i 𝒰*_{α_i} → Iw` (with `𝒰*_α = 𝒰_α` for `α ∈ Φ⁺` and `𝒰°_α` for `α ∈ Φ⁻`) is an isomorphism of analytic adic spaces; (3) for `w ∈ W` the product map `(𝒯 ∩ G′) × ∏_{α ∈ w⁻¹Φ⁺} 𝒰*_α × ∏_{α ∈ w⁻¹Φ⁻} 𝒰*_α → G′` is an isomorphism for `G′ = 𝒢_{m,n}` and `𝒢¹_{m,n}`, where `𝒰*_α = 𝒰_{α,n}` for `α ∈ Φ⁺` and `𝒰°_{α,m}` for `α ∈ Φ⁻`; (4) for `m, k ∈ ℚ_{≥0}, 𝒢_{m,0}` normalises `𝒢¹_{m+k,k}`; (5) if `m ≥ n` and `K_p ⊆ G(𝒪_F) ∩ 𝒢_{m−n,0}`, then `K_p` normalises `𝒢¹_{m,n}`, so `K_p𝒢¹_{m,n} = 𝒢¹_{m,n}K_p` is a group. An Iwahori decomposition of `K_p` over `ℚ_p` does not imply that this product is stable under regrouping the individual split roots relative to `P_μ` over `F`; in particular no factorization by its intersections with `P_μ` and `Ū_{P_μ}` is asserted.

`G` split reductive over `𝒪_F` (in the Shimura application `F` splits `G_{ℚ_p}`, and the parabolic `P_μ` contains `B`).

The source leaves the general case of (3) to the reader and proves only `G′ = 𝒢_{0,0}`; the proof route below supplies the general case.

The analytic depth groups and their normalisation are constructed here for the Bruhat tubes and Levi reductions; the algebraic Bruhat cells are supplied by ShimuraData D3.

Reduction kernels, intersections and increasing unions give the subgroup assertions; the pointwise specialization description gives them for partial closures. Complete `G` along `B_k`. The product `𝒯×∏𝒰*_{α_i}→Iw` identifies reduced special fibres with `T_k×∏_{Φ⁺}U_{α,k}=B_k` and tangent spaces by integral Chevalley commutators; formal smoothness gives the formal isomorphism and then (2). In the big cell U×T×Ū`→G`, reduction into `B̄ mod p^n` forces the positive coordinates into radius `|p^n|`, while reduction into `B mod p^{m+}` forces the negative coordinates into the strict radius `|p^m|`. Regrouping by `w⁻¹Φ^±` preserves these bounds: commutators of depths `a,b` have depth `a+b`, with integral constants. Uniqueness comes from (2). For (4), embed `G` in `GL_r` with `B` the intersection with an ambient Borel, using Borel's fixed-point theorem. There `𝒢¹_{m+k,k}=1+p^k Lie_{m,0}` and the matrix order `Lie_{m,0}` is `Ad(𝒢_{m,0})`-stable, so conjugation preserves the subgroup. Rational depths become integral uniformizer depths after finite ramified extension; descend the resulting valuation inequalities. Apply (4) with `m−n,n` for (5): `K_p` normalizes `𝒢¹_{m,n}`. These arguments use ReductiveGroups Layers 7–8 and ReductiveGroupsPartII §§RG2.1.2–RG2.1.3. They do not factor a rational nonsplit subgroup with respect to a parabolic defined only over `F`; the restriction-of-scalars Check disproves that stronger assertion.

([BP25], §3.3.3, Proposition 3.3.4 and its proof, pp. 38–39.) The strong Iwahori decomposition of the analytic Iwahori subgroup for any ordering of the roots, via the formal completion along `B_k`.

([BP25], §3.3.13, Lemma 3.3.14 and Proposition 3.3.15, p. 41.) The groups `G_{m,n}, G¹_{m,n}` and their partial closures, and their Iwahori decompositions; the general case is left to the reader in the source.

([BP25], Lemma 3.3.18 and its proof, p. 42.)

([BP25], §3.3.19, the definition before Lemma 3.3.20, p. 43; §4.6.8, p. 92; proof of Proposition 4.6.12, p. 94; proof of Lemma 4.6.20, p. 98.) The rational Iwahori subgroup `K_{p,m′,b′}` and its normalisation of `𝒢¹_{m,n}`. The split-root regrouping used in the Hecke proof needs an additional argument when the parabolic is not defined over `ℚ_p`; no such regrouping theorem is imported here.

([BP21], §3.3, Proposition 3.3.2, Lemma 3.3.11, Proposition 3.3.12 and Lemma 3.3.15, pp. 37–40.)

The API is `LevelGroup.mk`, .`zero_zero`, .antitone, .iwahoriDecomposition, .normalizes and .`rank_one_points`: the two analytic-depth subgroups with partial closures, `Iw` at (0,0), the inclusions for increasing depths, all the ordered/grouped root-product isomorphisms (2)–(3), normalization of `𝒢¹_{m+k,k}` by `𝒢_{m,0}`, and equality of rank-one points under the stated closures.

**Checks.**

- `levelGroups_zero_zero`: `𝒢_{0,0} = Iw`, the analytic Iwahori subgroup `]B_k[_𝒢`.
- `levelGroups_GL2`: For `GL₂` over `ℤ_p` and `m = n = 1: (a b; c d) ∈ 𝒢_{1,1}(ℚ_p)` iff `a, d ∈ ℤ_p^×, |c| < |p|` (so `c ∈ p²ℤ_p`) and `|b| ≤ |p|`; in `𝒢¹_{1,1}` moreover `a ≡ d ≡ 1 mod p^{1+}`.
- `levelGroups_decomposition_unique`: For `GL₂, w = 1`: every `g ∈ 𝒢_{m,n}` is uniquely `t·(1 b; 0 1)·(1 0; c 1)` with `t` diagonal integral, `|b| ≤ |p^n|` and `|c| < |p^m|`.
- `levelGroups_not_normal`: For `GL₂` and `m > 0` the Iwahori does not normalise `𝒢¹_{m+k,k}: h = (1 0; x 1)` with `|p^m| < |x| < 1` lies in `Iw = 𝒢_{0,0}`, and conjugating `(1 b; 0 1)` with `|b| = |p^k|` gives the matrix `(1 − bx, b; −x²b, 1 + xb)`, whose diagonal entry `1 − bx` has `|bx| > |p^{m+k}|`, so it is not in `𝒢¹_{m+k,k}`; the normaliser statement needs `h ∈ 𝒢_{m,0}`.
- `levelGroups_nonsplit_parabolic_factorization_fails`: Let `L/ℚ_p` be unramified quadratic, `G_{ℚ_p}=Res_{L/ℚ_p}GL₂, F=L, K_p=Iw(GL₂(𝒪_L)), m=n=1, w=1, P=B×GL₂` in `G_F=GL₂×GL₂`, and `H=K_p𝒢¹_{1,1}`. Rational points have the form `(g,σg)`. Modulo `p²`, the two lower-left entries of an element of `H` remain Galois-conjugate, since `𝒢¹_{1,1}` has lower-left entry in `p²`. Each element of `H∩P` has both lower-left entries zero modulo `p²`; the same holds in `H∩(U_-×1)`, because its second matrix is the identity. Their products therefore miss `(u_-(p),u_-(p))∈H`. Thus `H≠(H∩P)(H∩Ū_P)`, despite the rational Iwahori decomposition of `K_p`.

For `G = GL₂, B` upper triangular and `m = n = 1: 𝒢_{1,1}` consists of the integral matrices `(a b; c d)` with `|c| < |p|` and `|b| ≤ |p|`, and `𝒢¹_{1,1}` of those with moreover `a, d ≡ 1` modulo `p^{1+}`; for `ℚ_p`-points this means modulo `p²`.

In Boxer–Pilloni §4.6, Propositions 4.6.9, 4.6.12 and Lemma 4.6.20, the image of `wK_p𝒢¹_{m,n}w⁻¹ ∩ P_μ` in `M_μ` and the unique root-group factorisation used in the Levi reduction and the Hecke step. In §6.13, tubes of Bruhat cells are orbits `P\Pw𝒢_{m,n}`. In §6.15, normality of the analytic level subgroup makes `K_p𝒢¹_{m,n}` a group; the extra factorization used by a conditional double-coset argument is a separate input, not a consequence of this construction.

*Needs:* ReductiveGroups Layers 7–8; ReductiveGroupsPartII §RG2.1.2–RG2.1.3; AdicSpacesPartIII §R2.4; ShimuraData §3.14.

### 6.13 Tubes of Bruhat cells in the analytic flag variety and their description as orbits

In the situation of §6.12, let `P ⊇ B` be a parabolic with Levi `M, FL = P\G, ^MW` the Kostant representatives and, for `w ∈ ^MW, U_w ⊆ FL` the open translate of the big cell with `U_w^{an} ≅ ∏_{α ∈ w⁻¹Φ^{−,M}} 𝒰_α^{an}` through `(u_α) ↦ w∏_α u_α`. Put `]C_{w,k}[ = P\PwIw` (the tube of the Bruhat cell `C_{w,k}` of the special fibre) and, for `m, n ∈ ℚ ∪ {−∞}`, let `]C_{w,k}[_{m,n} ⊆ U_w^{an}` be the image of `w∏_{α ∈ w⁻¹Φ^{−,M} ∩ Φ⁻} 𝒰°_{α,m} × ∏_{α ∈ w⁻¹Φ^{−,M} ∩ Φ⁺} 𝒰_{α,n}` (images in the sheaf-theoretic sense), together with the partial closures obtained from the closed balls and the specialisation closures. Then: (1) for any ordering of the roots, `∏_{α ∈ w⁻¹Φ^{−,M} ∩ Φ⁺} 𝒰_α × ∏_{α ∈ w⁻¹Φ^{−,M} ∩ Φ⁻} 𝒰°_α → ]C_{w,k}[, (u_α) ↦ w∏ u_α`, is an isomorphism; (2) `]C_{w,k}[_{0,0} = ]C_{w,k}[, ]C_{w,k}[_{m,n} = ]C_{w,k}[_{m,0} ∩ ]C_{w,k}[_{0,n}` for `m, n ≥ 0`; (3) orbit description: `]C_{w,k}[_{m,n} = P\Pw𝒢_{m,n} = P\Pw𝒢¹_{m,n}` for `m, n ∈ ℚ_{≥0}`, and likewise for the partial closures; (4) for `m ≥ 0`, a profinite `K_p ⊆ 𝒢_{m,0}` and `s ≥ 0, ]C_{w,k}[_{m+s,s}K_p` is a finite disjoint union of translates `]C_{w,k}[_{m+s,s}h, h ∈ K_p`; (5) consequently `(P^{an} ∩ wK_p𝒢¹_{m,n}w⁻¹)\wK_p𝒢¹_{m,n}w⁻¹·w = ]C_{w,k}[_{m,n}K_p` for `0 ≤ n ≤ m` and `K_p ⊆ 𝒢_{m−n,0}`.

Hypotheses of §6.12; in the Shimura application `P = P_μ, FL = FL_{G,μ}` and `M = M_μ`.

In Boxer–Pilloni's application the unipotent radical of `P` is abelian, so the root groups for `w⁻¹Φ^{−,M}` commute; in general the order does not matter by the commutation lemma used in the source.

(1) Immediate from the strong Iwahori decomposition (§6.12 (2)) and `P ∩ wIww⁻¹`-cancellation: write PwIw `= Pw·∏_{α ∈ w⁻¹Φ^{−,M}} 𝒰*_α` (Boxer–Pilloni Corollary 3.3.7). (2) From the definition by radii. (3) By the Iwahori decomposition of `𝒢_{m,n}` for the grouping `w⁻¹Φ^±` (§6.12 (3)), `w⁻¹Pw ∩ 𝒢_{m,n}` absorbs the factors with `α ∉ w⁻¹Φ^{−,M}`, leaving `w∏_{α ∈ w⁻¹Φ^{−,M}} 𝒰*_α` with the radii of the definition; the same computation applies to `𝒢¹_{m,n}` because the torus and Levi factors are absorbed in `P` (Boxer–Pilloni Corollary 3.3.17). (4) For `h ∈ K_p, ]C_{w,k}[_{m+s,s}h = P\Pw𝒢¹_{m+s,s}h = P\Pwh𝒢¹_{m+s,s}` by (3) and the normalisation §6.12 (4); two such translates are equal or disjoint, and there are finitely many because `𝒢_{m+s,s} ∩ K_p` has finite index in `K_p` (Boxer–Pilloni Lemma 3.3.19). (5) For `0 ≤ n ≤ m, K_p` normalises `𝒢¹_{m,n}` (§6.12 (4) with `K_p ⊆ 𝒢_{m−n,0}`), so `𝒢¹_{m,n}K_p = K_p𝒢¹_{m,n}`, and (3) gives the stated quotient presentation (Boxer–Pilloni, proof of Proposition 4.6.12).

([BP25], §3.3.6, Corollary 3.3.7, p. 39.)

([BP25], §3.3.8, Definition 3.3.10 and Remarks 3.3.11–3.3.12, pp. 39–41.)

([BP25], Corollary 3.3.17 and Lemma 3.3.19 with proofs, pp. 42–43.)

([BP21], §3.3, Corollary 3.3.5, Corollary 3.3.14 and Lemma 3.3.16, pp. 38–41.)

The API is `BruhatTube.mk`, .`prod_iso, .eq_orbit`, .inter, .`translates_finite` and .`quotient_presentation`: the radius tubes/partial closures, root-ball product, both orbit formulas, intersection identity, finite disjoint `K_p`-translates and parabolic-quotient presentation. Each retains the depth and subgroup hypotheses (1)–(5) above.

**Checks.**

- `tubes_zero_zero`: `]C_{w,k}[_{0,0} = ]C_{w,k}[ = P\PwIw`.
- `tubes_quotient_depth_domain`: At `m = n = 0` the quotient presentation is defined for `K_p ⊆ Iw`. At `m = 0, n = 1` it is outside its domain: `𝒢_{m−n,0}` would have negative first depth, whereas §6.12 defines these level groups only for nonnegative depths. Thus a quotient constructor accepting this pair fails the stated normalization contract.
- `tubes_GL2_disc`: For `GL₂` with `P = B` upper triangular and `FL = P\G ≅ ℙ¹` through the second row: for `w = 1, ]C_{1,k}[_{m,n} = {[z : 1] : |z| < |p^m|}`, the open disc of radius `|p^m|` around the base point `P\P = [0 : 1]`; for `w = s` it is the closed disc of radius `|p^n|` around [1 : 0].
- `tubes_orbit`: `]C_{w,k}[_{m,n} = P\Pw𝒢_{m,n} = P\Pw𝒢¹_{m,n}` for all `m, n ≥ 0`.
- `tubes_not_algebraic_cell`: `]C_{w,k}[` is open in `FL^{an}` and is not the analytification of the locally closed Bruhat cell PwB of the generic fibre: for `GL₂, w = 1` it is an open disc, while `P\PB` is the point [0:1] in the fixed second-row convention.

For `G = GL₂, P = B, w = 1: ]C_{1,k}[_{m,n}` is the disc `{|z| < |p^m|}` in the chart `z` of `ℙ¹` around the B-fixed point, independent of `n`.

In Boxer–Pilloni §4.6, Proposition 4.6.12, the Levi torsor is reduced over the preimage of `]C_{w,k}[_{m,n}K_p` under the truncated period map. In §6.14, §6.15, the Bruhat domains on which the reductions and the Hecke double cosets are stated.

*Needs:* §6.12; ShimuraData §§3.14, 3.10, 3.15–3.18; AdicSpacesPartIII §R2.4.

### 6.13a Finite-level truncated period maps and Bruhat domains

For abelian-type data over `C`, construct the continuous map `π_{HT,K_p}:|S*_{K^pK_p}|→|FL_{G,μ}|/K_p` by descent of §6.8's equivariant period map along the effective compact deck quotient. The target is the orbit set with the quotient topology, not an asserted analytic quotient. An open of it is called affinoid or rational precisely when its inverse image in `FL` has that property, as in [BP21] §4.5. Compose with the finite-level toroidal-to-minimal map to define `π^tor_{HT,K_p}`. Prove that for every `K_p`-stable open Bruhat tube `D=]C_{w,k}[_{m,n}K_p` of §6.13 the inverse image of `D/K_p` is an open analytic domain and that its pullback to the infinite toroidal tower is `(π^tor_HT)⁻¹(D)`. Prove continuity, compatibility with change of level, cone refinement, tame maps and both Hecke legs with their translated tube domains. The notation `(π^tor_{HT,K_p})⁻¹(D)` means this inverse image of `D/K_p`.

Finite-level spaces carry the quotient topology from the compact effective deck action on the tower; invariance therefore descends the continuous map. On toroidal towers use the same compact quotient and §6.10 to identify its pullback with §6.3's map. A stable open has open image in the orbit topology, so its inverse image is open in the finite analytic space and carries its canonical open analytic subspace. Prove the same assertion under both Hecke projections on a common cone refinement. Partial closures are used as subsets; they are not claimed open analytic domains.

Source: [BP21], §4.5, definition before Lemma 4.5.1, Theorem 4.5.2, Lemmas 4.5.3–4.5.4 and the final toroidal definition, pp.85–87; [BP25], §4.5, pp.87–89.

**Checks.**

- For central `μ`, the flag and its orbit quotient are a point, and the inverse image of the whole flag is the whole finite-level space.
- For `GL₂` the stable union of translates of an ordinary-type disc pulls back to its usual finite-level open period domain; a single disc which is not `K_p`-stable does not define a subset of the quotient by this formula.
- Under a smaller normal level the inverse image of `D/K_p` is the domain cut out by the same stable D; under a Hecke leg the tube is translated by the same t as the period map, rather than held fixed.

*Needs:* §6.8; §6.10; §6.3; §6.13; §0.3; §0.general.1; ShimuraCompactifications §§C3.3–C3.4, C3.general.1; PerfectoidTowers §§P8.7–P8.8.

### 6.13b The nonsplit Levi image at the identity correspondence

Let `G_{ℚ_p}` be quasi-split, `F/ℚ_p` finite splitting G, `B` a rational Borel contained in `P_μ` over F, and fix the compatible reductive `O_F`-model. Let `w∈^MW`, integers `m′≥1`, `0≤b′≤m′`, and rational depths `m,n≥0`, `0≤m−n≤m′−1`. Define `K_p=K_{p,m′,b′}` as the rational integral elements reducing into B modulo `p^{m′}` and U modulo `p^{b′}`. Define `K_{p,w,M_μ}` as the image of `wK_pw⁻¹∩P_μ` in `M_μ`, and `M¹_{μ,m,n}` as the analytic Levi subgroup reducing into `U_{M_μ}` at strict depth greater than m and into `Ū_{M_μ}` at depth n. Prove the rational-image description of Proposition 4.6.9 and the normalization of Lemma 4.6.11 for these groups. Put `H=wK_p𝒢¹_{m,n}w⁻¹` and `L=K_{p,w,M_μ}M¹_{μ,m,n}`. Prove the identity of images as sheaves of groups on complete Huber pairs over F,
`Im(H∩P_μ→M_μ)=L`.
The image is the sheaf image, so local lifts are allowed. This is the `t=1` part of the Levi-image theorem used in §6.15 and is a separate local target and hypothesis of the reduction in §6.14. Proposition 4.6.9 describes the rational parabolic image and Lemma 4.6.11 proves normalization; neither alone proves this identity for H.

The inclusion `L⊆Im(H∩P_μ)` uses lifts from `wK_pw⁻¹∩P_μ` and from `w𝒢¹_{m,n}w⁻¹∩P_μ`. For the reverse inclusion, establish compatible congruence corrections before projecting to the Levi: if `kn∈P_μ`, with `k∈wK_pw⁻¹` and `n∈w𝒢¹_{m,n}w⁻¹`, prove that the Levi class of `kn` can locally be represented by a rational parabolic factor times an analytic parabolic factor with the same depth bounds. Construct the rational corrections simultaneously on Galois orbits of the split root coordinates, preserving the two congruence conditions on `K_p`; lift successively through the congruence quotients, and prove convergence of the corrections in the completed charts. Prove invariance under the Galois action on the based root datum, including ramified splitting fields, so that the corrected rational factors belong to `G(ℚ_p)`. This congruence-correction statement is part of the image target, not an assumed factorization of H. Projection kills the remaining unipotent discrepancy and gives the reverse inclusion. An arbitrary ordering of split roots in rational K does not give these Galois-compatible corrections.

Sources: [BP25], Proposition 4.6.9, Example 4.6.10, Lemma 4.6.11 and proof of Proposition 4.6.12, pp.92–95; Lemma 4.6.20, p.98. The analytic normalizations are §6.12 here.

**Checks.**

- For split `GL₂`, the identity is the direct diagonal projection of the parabolic matrices in `wK_p𝒢¹_{m,n}w⁻¹`; the analytic diagonal entries have the prescribed strict m-depth.
- For `Res_{L/ℚ_p}GL₂`, L unramified quadratic, `P_μ=B×GL₂`, the rational image retains the conjugacy relations of Example 4.6.10. Replacing it by a product of independent Iwahori groups changes L and fails the identity.
- In §6.12's restriction-of-scalars example, `H≠(H∩P_μ)(H∩Ū_{P_μ})`; the image statement must hold without that factorization. The full Hecke identity at `t=1` reduces to this equality since `L·1·L=L`.

*Needs:* §6.12; §6.13; ReductiveGroupsPartII §§RG2.1.2–RG2.1.3; ShimuraData §3.14.

### 6.14 Reduction of the Levi torsor over Bruhat domains

Assume `G_{ℚ_p}` quasi-split with `P_μ` containing a Borel `B` over `ℚ_p, F/ℚ_p` finite splitting `G` with `μ` over `F`, a reductive `𝒪_F`-model, and `K_p = K_{p,m′,b′}` (the preimage of `B` modulo `p^{m′}` and of `U` modulo `p^{b′}, m′ > 0, m′ ≥ b′ ≥ 0`). For `w ∈ ^MW` let `K_{p,w,M_μ}` be the image of `wK_pw⁻¹ ∩ P_μ` in `M_μ` (it lies in the Iwahori of `M_μ(𝒪_F)` and has an Iwahori decomposition `N × wT_{b′}w⁻¹ × N̄`; Proposition 4.6.9), and for `0 ≤ m − n ≤ m′ − 1` let `M¹_{μ,m,n}` be the elements of `M_μ` reducing to `U_{M_μ}` modulo `p^{m+ε}` for some `ε > 0` (strict valuation greater than `m`) and to `Ū_{M_μ}` modulo `pⁿ; K_{p,w,M_μ}` normalises `M¹_{μ,m,n}` (Lemma 4.6.11). Assume the nonsplit image identity of §6.13b. Then, if `F` is large enough that the composite `Gal(F̄/F) →^{χ_cycl} ℤ_p^× →^{μ} M^{an}_μ` factors through `K_{p,w,M_μ}M¹_{μ,m,n}`, the torsor `M_dR` has, over `(π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p) ⊆ S^tor_{K^pK_p,Σ}`, a reduction `M_{dR,m,n,K_p}` to an étale torsor under `K^r_{p,w,M_μ}M^{1,r}_{μ,m,n}` (Proposition 4.6.12 in the authors' revised form; arXiv v1 reduces `M_HT`); these reductions are compatible in `(m, n, K_p)` (Proposition 4.6.14); for `m = n` the pushout `M_{dR,n,K_p} := M_{dR,n,n,K_p} ×^{K^r_{p,w,M_μ}M^{1,r}_{μ,n,n}} K^r_{p,w,M_μ}M^r_{μ,n}` is a torsor under an affinoid group; and for Hodge-type data with perfect `Σ, M_{dR,n,K_p}` becomes trivial over `Spa(R, R⁺) ×_{S^tor_{K^pK_p,Σ}} S^tor_{K^pK′_p,Σ}` for some `K′_p ⊆ K_p`, a finite flat cover of any pregood affinoid `Spa(R, R⁺)` (Proposition 4.6.15 in the revised manuscript).

Abelian type (the truncated period map `π^tor_{HT,K_p}` of Boxer–Pilloni §4.5 is stated for abelian type), quasi-split `G_{ℚ_p}`.

The tubes `]C_{w,k}[_{m,n} = P\PwG¹_{m,n}` of Bruhat cells, the level groups `G¹_{m,n}` with their Iwahori decompositions and the normalisation lemma (Boxer–Pilloni §3.3: arXiv v1 Corollary 3.3.14 and Lemma 3.3.15, revised manuscript Corollary 3.3.17 and Lemma 3.3.18) are constructed in §6.12 and §6.13; the algebraic cells `C_w` themselves are ShimuraData §3.14.

`]C_{w,k}[_{m,n}K_p = (P^{an}_μ ∩ wK_pG¹_{m,n}w⁻¹)\wK_pG¹_{m,n}w⁻¹·w` (Boxer–Pilloni Corollary 3.3.14 of arXiv v1; §6.13 (5), using that `K_p` normalises `G¹_{m,n}` by §6.12 (4)). For perfectoid `S` over the preimage choose `g_{S̃} ∈ q_G(wG¹_{m,n}K_p)` (§6.2); the cocycle lies in the image of `P_μ ∩ wG¹_{m,n}K_pw⁻¹` in `P^r_μ` and its image in `M^r_μ` lies in `K^r_{p,w,M_μ}M^{1,r}_{μ,m,n}` (the image identity of §6.13b, with normalization from Lemma 4.6.11): a reduction `M_{HT,m,n,K_p}` of `M^{an}_HT` over the preimage in the tower, which is `K_p`-invariant. Before descending, twist by the cyclotomic character through `μ`, which factors through `K_{p,w,M_μ}M¹_{μ,m,n}` by the hypothesis on `F`: this gives a `K_p`-invariant reduction `M_{dR,m,n,K_p}` of `M^{an}_dR` over the tower (`ℤ_p(1)` is only pro-étale over the finite level, so the twisted `M_{HT,m,n,K_p}` itself does not descend). Descend `M_{dR,m,n,K_p}` to `(π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)` as in §6.11, using that `M^{an}_dR` is étale at finite level (Remark 4.6.5). Compatibility and pushout by construction; Proposition 4.6.15 by Elkik approximation of sections of the torsor at finite level.

([BP25], §4.6, Proposition 4.6.12 and its proof, pp. 94–95.)

([BP21], §4.6.8, Proposition 4.6.9 and Example 4.6.10, pp. 90–91.)

For `G = GL_2, w = 1` and `K_p =` Iwahori, `K_{p,1,M_μ} = T(ℤ_p)` and the reduction is the torsor of trivialisations of the canonical-subgroup filtration over the ordinary-type domain.

Example 4.6.10: for `G_{ℚ_p} = Res_{ℚ_{p²}/ℚ_p}GL_2` the projected group `K_{p,1,M_μ}` is the image of `B(ℤ_p)` in `T(ℚ_{p²}) × GL_2(ℚ_{p²})`, not a product Iwahori.

*Needs:* §6.13a; §6.13b; §6.11; §6.3; §6.12; §6.13; §6.2; ShimuraData §§3.14, 3.10, 3.15–3.18.

### 6.15 Hecke correspondences on toroidal towers with common cone refinements

In the situation of §6.3, for `t ∈ G(ℚ_p)` and cone decompositions `Σ, Σ′` for which there is a common refinement `Σ″` of the pullbacks along the two degeneracy maps (any two admissible cone decompositions have a common refinement; ShimuraCompactifications `C3.general`), there is a correspondence `S^tor_{K^pK_p,Σ} ←p₂− S^tor_{K^p(K_p∩tK_pt⁻¹),Σ″} −p₁→ S^tor_{K^pK_p,Σ′}`, a map of pro-Kummer-étale torsors `p₁^*G_{pet,p} → p₂^*G_{pet,p}` locally represented by `q_G(t)`, and the induced map `p₁^*M^{an}_dR → p₂^*M^{an}_dR` of étale torsors, compatible with the period maps of the toroidal tower diamonds and, over the tower, with the Hodge–Tate side through `M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1)`. Bruhat clause: assume moreover `(G, X)` of abelian type, `G_{ℚ_p}` quasi-split, `K_p = K_{p,m′,b′} (m′ > 0, m′ ≥ b′ ≥ 0), 0 ≤ m − n ≤ m′ − 1, F` large enough as in §6.14, `w ∈ ^MW` and `t ∈ T(ℚ_p)`; then over `p₂⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)) ∩ p₁⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p))` the map `p₁^*M^{an}_dR → p₂^*M^{an}_dR`, compared through the reductions `M_{dR,m,n,K_p}` of §6.14, is locally represented by the double coset `K^r_{p,w,M_μ}M^{1,r}_{μ,m,n}·q_G(wtw⁻¹)·K^r_{p,w,M_μ}M^{1,r}_{μ,m,n}` (Boxer–Pilloni Proposition 4.6.19, Lemma 4.6.20). No single `Σ` admits all correspondences.

Boxer–Pilloni state this for abelian type with compatible cone decompositions; the compatibility condition is made explicit here (`Σ″` refines both pullbacks).

The Bruhat clause has the hypotheses of §6.14 (abelian type, quasi-split `G_{ℚ_p}, K_p = K_{p,m′,b′}, F` large), and through it on the tubes and level groups of §6.13 and §6.12.

The general correspondence and `G^r`-torsor map use §6.1a’s coefficient and Hecke comparisons and §6.1’s log-to-v comparison. The final Bruhat double-coset clause is conditional on the additional nonsplit Levi-image input stated below; the source conclusion is retained as a target, not certified by the failed factorization argument.

Use finite-level Hecke maps on common cone refinements and take tower diamonds. In local sections `x₂=x₁q_G(t)`, choose `x_i=x′_iq_G(w)h_i`, with `h_i∈G^{1,r}_{m,n}K_p^r`, so `x′₂=x′₁·q_G(w)h₁q_G(t)h₂⁻¹q_G(w)⁻¹` and this factor lies in `P_μ^{an,r}`; project to the Levi. For the conditional group argument put `H=wK_p𝒢¹_{m,n}w⁻¹, t′=wtw⁻¹∈T⊆P_μ`. Assume both `P`/opposite-unipotent factorizations of `H`, trivial intersection and normalization by `t′`. Writing `k=au, k′=u′a′` gives `kt′k′=at′(t′⁻¹ut′u′)a′`; parabolic membership is equivalent to `u′=t′⁻¹u⁻¹t′`. Thus the factors cancel and `Ht′H∩P_μ=(H∩P_μ)t′(H∩P_μ)`. Its Levi projection, followed by `q_G`, gives the desired image using §6.13b’s identity `Im(H∩P_μ)=K_{p,w,M_μ}M¹_{μ,m,n}`. Rational Iwahori decomposition does not give these factorizations for a nonsplit `H`: §6.12's restriction-of-scalars Check refutes that auxiliary step. The source Levi-image equality itself remains the explicit proof input, without a claimed counterexample.

([BP21], §4.6.18, Proposition 4.6.19 and Lemma 4.6.20, pp. 94–96.)

([BP25], §4.6.18, Proposition 4.6.19 and its proof, pp. 97–98.)

For `GL_2` and `t = diag(p, 1)` it is the `U_p` correspondence on the modular tower, with the period map transforming by `t` on `ℙ¹`.

For the generic cancellation theorem, `t∈P` is indispensable: take `P={1}, Ū=H=G` nontrivial, `k=t⁻¹` and `k′=1`. Its other hypotheses and `ktk′∈P` hold, but the asserted factorization would force `t=1`. The Shimura application has `t′∈T⊆P`.

*Needs:* §6.13a; §6.13b; §6.3; §6.14; §0.general.1; §6.12; §6.13; ShimuraCompactifications §§C3.3, C3.4, C3.general.1; §6.1a; AutomorphicBundles §B3.general.3 (on the quotient data).

### Examples

For the conditional double-coset identity, `t∈P` is essential: `P=1` and `H=`Ubar`=G` with `k=t⁻¹` and `k′=1` contradict the proposed conclusion when `t≠1`. A second control uses `G=Res_{L/ℚ_p}GL₂` for `L/ℚ_p` unramified quadratic, split parabolic `B×GL₂` and rational Iwahori `K_p`. Modulo `p²` the two lower entries in `H=K_p G¹_{1,1}` remain Galois-conjugate. Both `H∩P` and `H∩`Ubar have lower entries zero modulo `p²`, but `H` contains `(u_−(p),u_−(p))`. Thus the needed split-parabolic factorization of `H` fails. This does not refute the actual Levi-image equality with rational `t`; that proof input remains required.

### Dependencies

The exact local prerequisites and supplier sections are the *Needs:* clauses above.

## Conditional proof inputs

The application-specific inputs below are explicit hypotheses of the conclusions that consume them. Each input is also a mathematical target at its indicated local section; the cited finite-level foundations alone do not establish it.

### Boundary strata and finite étaleness in Scholze's Lemma 3.2.35 for general `ε`

For Scholze Lemma 3.2.35, pp. 1001–1002, supply the boundary strata of the full-to-`Γ₁` level map in terms of lower-genus Siegel spaces, constancy of inertia along each stratum and density of its ordinary locus. The `ε=0` moduli argument uses Lagrangian complements and Hartogs; genus one uses Heuer Corollary 3.18 and its cusp charts. These do not supply the general-`ε` boundary argument in higher genus. The strata description is the application-specific boundary contract above (Faltings–Chai `V`, Theorem 2.5(4)–(6), pp. 152–153; Pilloni–Stroh Théorème A.11, p. 27, at full principal level). Prove this constancy for the full-to-`Γ₁` map at general `ε` in §1.22. Generic étaleness alone is insufficient.

This is needed by §1.22.

### Openness of the completed log affinoid perfectoid charts over the toroidal tower diamond

Section 6.0 constructs the finite covering family by adjoining all boundary-monomial and smooth-coordinate p-power roots on small étale toric charts and pulling back the whole p-level tower. Prove universal openness for these completed covering charts using the saturated-monoid valuation comparison and the finite-depth image calculation. Density and descent in §6.1(iv) use only overlaps of this chosen family. A single lift of a point in a profinite tower need not have open image, so the property is not required of arbitrary perfectoid objects over the tower.
This is needed by §6.1, §6.2, §6.3, §6.11.

### Torsor descent through ramified toroidal finite quotients

The finite toroidal map used in §6.9 is Galois and étale on the interior and may ramify on the boundary. Identify the boundary inertia in compatible logarithmic/toric charts and prove that it acts trivially on fibres of the pushed-out canonical Levi torsor. A logarithmic/coarse-quotient descent theorem can then produce the finite-level étale torsor and compare it with the logarithmic Hodge–Tate torsor. Ordinary finite étale descent on the interior is insufficient. This is a target of §6.9 for the `M^r_μ`-torsors of §6.1a, using its pullback of AutomorphicBundles §§B3.general.1–B3.general.3 from the CM-centre quotient data and ShimuraCompactifications §C3.general.1 for the finite boundary foundations.

This is needed by §6.9.

### The `p = 2` truncated-group integral Hodge–Tate estimate for modified formal models

Pilloni–Stroh Théorème 1.9 gives the truncated-group integral Hodge–Tate estimate for `p≥3`. Remarque 1.10 reports the replacement constant 2 at `p=2` without a written proof. Section 3.9 owns the relative truncated estimate with constant 2, its boundary extension, the minor modification and determinant descent with loss `2g`. Its modified-model conclusions using `n₀=2g+1` and exponent `n₀−2g` carry that local input; HodgeTateAndCanonicalSubgroups §§5.5–5.6 supplies only the `p≥3` branch. This input is separate from the all-prime perfectoid representability construction in Layer 1.

This is needed by §3.9.

### Nonsplit Bruhat-domain Levi image in the local Hecke correspondence

Prove Boxer–Pilloni Lemma 4.6.20 for quasi-split `G_{ℚ_p}`, a parabolic `P_μ` defined over a splitting field `F, K_p=K_{p,m′,b′}, 0≤m−n≤m′−1` and `t∈T(ℚ_p): Im((wK_p𝒢¹_{m,n}tK_p𝒢¹_{m,n}w⁻¹)∩P_μ→M_μ)=K_{p,w,M_μ}M¹_{μ,m,n}·wtw⁻¹·K_{p,w,M_μ}M¹_{μ,m,n}`. The proof of Lemma 4.6.20 incorrectly forces the two unipotent factors to vanish separately. Cancellation proves a conditional group lemma, but the needed `P`/opposite-unipotent factorization of `H=wK_p𝒢¹_{m,n}w⁻¹` fails for the restriction-of-scalars example in §6.12. Supply a different Galois-compatible image argument, or state sufficient additional hypotheses and prove the remaining general case separately. No counterexample to the displayed Levi-image equality is claimed.

Its `t=1` specialization is the earlier target §6.13b and is needed already by §6.14. The remaining rational-t image identity is needed by §6.15.

## Downstream consumers

OverconvergentAutomorphicForms uses the perfectoid charts, graph frames, Hilbert comparison and the toroidal Bruhat-domain torsor reductions. HigherHidaAndColemanTheory uses the canonical Frobenius tower, the period-map charts and Hecke-compatible integral reductions. The modular-curve locally analytic theory uses the relative twisted Hodge–Tate sequence and the quotient-line normalization. Their coefficient and action conventions are fixed by Layers 3 and 5.

TorsionCohomologyInfrastructure is a downstream consumer. It imports the Hebbarkeitssatz, good triples and boundary extension (§§1.3–1.7), normalized traces (§1.16), the Hodge-type image-compactified tower and its comparison with the genuine minimal tower (§§2.3, 2.8), the period map (§3.8), and the period-map affinoid basis (§3.13). Its TC.2, §2.1 owns the comparison of fixed-exponent compactly supported completed cohomology with the almost cohomology of the integral boundary ideal on that tower (Scholze, Theorem 4.2.1, pp. 1021–1023), for every exponent `m≥1` and degree `i≥0` under that theorem's Hodge-type embedding and tame-level hypotheses. CompletedCohomologyPartII §8.6 supplies the fixed-exponent cohomology carrier and support convention to that comparison. The geometric inputs exported here are constructed before the comparison.

IgusaVarietiesAndTorsionConcentration is a downstream consumer of the represented towers, their Hodge–Tate maps and the geometric fibres studied at its IG.3. It supplies no input to this roadmap.

## References

- Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals of Mathematics 182 (2015), no. 3, 945–1066, published version (doi:10.4007/annals.2015.182.3.3); printed page numbers 945–1066 and the published (arabic) numbering, e.g. Theorem 3.3.18 = arXiv Theorem III.3.18.
- David Hansen, Christian Johansson, [Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2). arXiv:2011.03951v2, 29 August 2025 (paper dated 1 September 2025; the revised version, from which the Hodge–Tate period map for pre-abelian data was removed); printed page = PDF page.
- Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1). arXiv:1511.02418v1, 8 November 2015 (published in Ann. of Math. 186 (2017), 649–766; preprint numbering used).
- Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, [Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://arxiv.org/abs/1803.05786). Theorem 5.3.1 and §§5.4–5.6, pp.56–66.
- George Boxer, Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/abs/2110.10251v1). arXiv:2110.10251v1, 19 October 2021.
- Christopher Birkbeck, Ben Heuer, Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4). arXiv:1902.03985v4, 10 May 2021 (published in Ann. Inst. Fourier 73 (2023), no. 4, 1709–1794); printed page = PDF page of the arXiv version.
- Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357v2). arXiv:1211.6357v2, 13 April 2013 (published in Camb. J. Math. 1 (2013), 145–237).
- Peter Scholze, [Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343v4). arXiv:1709.07343v4.
- J. S. Milne, [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf). Corrected author revision, 11 March 2018; II (2.1.4), Remark 2.2(d), III Theorem 4.3 and V Theorem 6.1.
- J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf). October 23, 2004; revised September 16, 2017 (numbering unchanged from the published version in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005).
- Lue Pan, [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1). arXiv:2209.06366v1, 14 September 2022 (published in Ann. of Math. 203 (2026), no. 1, 121–281; locators here refer to the arXiv version).
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3). arXiv:1812.09269v3, 28 November 2021 (published in Publ. Math. IHÉS 134 (2021), 153–501; statement numbers agree).
- Vincent Pilloni, Benoît Stroh, [Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Author's version from V. Pilloni's homepage (published in Ann. Math. Québec 40 (2016), 167–202); PDF page numbers.
- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author's version (113 pages, dated 17 June 2019) from V. Pilloni's homepage (published in Duke Math. J. 169 (2020), no. 9, 1647–1807).
- Ben Heuer, [Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1). arXiv:2002.02488v1, 6 February 2020.
- George Boxer, Vincent Pilloni, [Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Authors' manuscript from V. Pilloni's homepage (180 pp., PDF dated 3 March 2025), differs from arXiv v1 by the cyclotomic twists in §4.4 and the renumbering of §4.4.12–4.4.30.
- George Boxer, Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Authors' version from V. Pilloni's homepage (built 5 November 2025, 65 pages; published in Invent. Math. 244 (2026), 45–141); printed page = PDF page.

- Bhargav Bhatt, Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/abs/1905.08229v4). arXiv:1905.08229v4, PDF page numbers; Theorem 1.17(1), p. 9, and Theorem 10.11, p. 82.
- Tom Lovering, [Integral canonical models for automorphic vector bundles of abelian type](https://msp.org/ant/2017/11-8/ant-v11-n8-p03-s.pdf). Algebra & Number Theory 11 (2017), no. 8, 1837–1890; published page numbers.
- Kai-Wen Lan, [Closed immersions of toroidal compactifications of Shimura varieties](https://www.kwlan.org/articles/cpt-tor-imm.pdf). Math. Res. Lett. 29 (2022), no. 2, 487–527; locators use the 21-page author PDF.
- Gerd Faltings, Ching-Li Chai, Degeneration of Abelian Varieties. Ergebnisse der Mathematik und ihrer Grenzgebiete (3), vol. 22, Springer, 1990; V, Theorem 2.5(4)–(6), pp. 152–153.

[Scholze]: https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf
[HJ]: https://arxiv.org/abs/2011.03951v2
[CS]: https://arxiv.org/abs/1511.02418v1
[DLLZ]: https://arxiv.org/abs/1803.05786
[BP21]: https://arxiv.org/abs/2110.10251v1
[BHW]: https://arxiv.org/abs/1902.03985v4
[SW]: https://arxiv.org/abs/1211.6357v2
[Diamonds]: https://arxiv.org/abs/1709.07343v4
[Milne]: https://www.jmilne.org/math/xnotes/svi.pdf
[Milne90]: https://www.jmilne.org/math/xnotes/AA.pdf
[Pan]: https://arxiv.org/abs/2209.06366v1
[BCGP]: https://arxiv.org/abs/1812.09269v3
[PS]: https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf
[Pilloni]: https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf
[Heuer]: https://arxiv.org/abs/2002.02488v1
[BP25]: https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf
[BPS]: https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf
[BS]: https://arxiv.org/abs/1905.08229v4
[Lovering]: https://msp.org/ant/2017/11-8/ant-v11-n8-p03-s.pdf
[Lan]: https://www.kwlan.org/articles/cpt-tor-imm.pdf
