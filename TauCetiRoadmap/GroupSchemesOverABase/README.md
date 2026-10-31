# Roadmap: group schemes over a base (multiplicative type, smooth and reductive group schemes)

**Summary.** This roadmap builds the relative theory of group schemes of SGA 3 that lies between
finite flat group schemes and abelian schemes: diagonalizable groups and groups of multiplicative
type over an arbitrary base scheme, their character sheaves, isotriviality and splitting, rigidity,
density of torsion and the representability of their Hom schemes; centralizers, normalizers and
maximal tori of smooth affine group schemes; the structure of a smooth connected group over a field
(Chevalley's theorem and the affinization) and the ranks it defines, as functions on the base of a
smooth group scheme, with their specialization inequalities; reductive group schemes over an
arbitrary base, their centre and derived group, étale-local splitting, root data, the
identification of pinned split groups with the integral models of ReductiveGroups 9B, automorphism
schemes and forms; Borel subgroups, the scheme of Borel subgroups and its Picard group; and the
Steinberg map `G → T/W`, the regular locus, the Steinberg cross-section of a simply connected
semisimple group, the universal centralizer, the Grothendieck–Springer space, the Picard groups of
`G` and `G^reg`, and the theorem that the Steinberg map has no simultaneous resolution without base
change along `T → T/W`.

Tau Ceti already has the field theory (groups of multiplicative type, tori, reductive groups,
Borel subgroups and maximal tori over a field) and, over an affine base `Spec R`, the definitions of
a reductive Hopf algebra, a Borel subgroup, a split maximal torus and a pinning. Over a base it has
the definition of a group object and the finite locally free theory. This roadmap produces the
relative theory over an arbitrary base scheme; the relative reductive theory over an affine
Noetherian base commissioned in [ReductiveGroups Layer 8](../ReductiveGroups/README.md#layer-8-classification-and-existence)
is its specialization to `S = Spec R` and consumes it, as laid out in *Ownership and consumers*
below. Suggested home: `TauCeti/AlgebraicGeometry/GroupScheme/`, with
subdirectories `Diagonalizable/`, `MultiplicativeType/`, `MaximalTorus/`, `Rank/`, `Reductive/`,
`Borel/` and `Steinberg/`.

| Layer | Title | Headline targets |
| --- | --- | --- |
| GS0 | Carriers over a base | `baseChange`, `geometricFiber`, `identityComponent`, `hopfSpec` comparison |
| GS1 | Diagonalizable groups over a base | `diagonalizable`, `diagonalizableHomEquiv`, `smooth_rootsOfUnity_iff`, `exact_diagonalizable` |
| GS2 | Multiplicative type and tori | `IsMultiplicativeType`, `characterSheaf`, `multiplicativeTypeEquiv`, `IsMultiplicativeType.isotrivial`, `nodalCurve_not_isotrivial` |
| GS3 | Rigidity, density, Hom schemes, centralizers | `hom_eq_of_eq_fibre`, `torsion_schematicallyDense`, `homFunctor_representable`, `centralizer_smooth`, `normalizer_quotient_etale` |
| GS4 | Smooth groups over a field and their ranks | `quotient_exists`, `chevalley`, `affinization`, `rankInvariants` |
| GS5 | Smooth group schemes over a base | `maximalTorus_etaleLocally_iff`, `torusScheme_smooth`, `rank_specialization`, `affine_rank_semicontinuous` |
| GS6 | Reductive group schemes | `IsReductive`, `center`, `derivedSubgroup`, `IsSplit`, `rootDatum`, `split_etaleLocally`, `pinned_iso_model`, `model_isSplit`, `centralQuotient_iso_model`, `aut_exact`, `isomTorsor`, `forms_equiv_H1` |
| GS7 | Borel subgroups and `Bor` | `borScheme`, `abstractTorus`, `weylGroupScheme`, `lineBundle`, `pic_flag`, `ample_iff` |
| GS8 | Steinberg map and Grothendieck–Springer | `steinbergMap`, `regularLocus`, `steinbergSection`, `universalCentralizer`, `grothendieckSpringer`, `pic_group`, `no_simultaneous_resolution` |

## Scope and boundaries

**Owned here.** Over a base scheme `S`: diagonalizable groups `D_S(M)` and groups of multiplicative
type of finite type over `S` (`M` finitely generated); tori; character and cocharacter sheaves;
isotriviality; Hom schemes out of multiplicative-type groups; centralizers and normalizers of
multiplicative-type subgroups; the representability of the identity component of a smooth group
scheme over an arbitrary base; maximal tori, Cartan subgroups and the scheme of maximal tori;
quotients of a group scheme of finite type over a field by a closed subgroup; Chevalley's structure
theorem and the affinization over a field for every smooth connected group; the rank invariants of
smooth group schemes over a base and their specialization inequalities; the relative theory of
reductive group schemes over an arbitrary base (the predicates, centre, derived group, central
isogenies and simply connected and adjoint forms, root data over a base, étale-local splitting, the
identification of every pinned split group with the integral model of ReductiveGroups 9B,
automorphism schemes, `Isom` torsors and forms); Borel subgroups over a base, the scheme `Bor(G)`,
the abstract torus and Weyl group scheme, the relative line bundles `𝓛(λ)` on `Bor` and the Picard
groups of `Bor` over a base, of `G` and of `G^reg`; the Steinberg map, the regular locus, the
Steinberg cross-section for simply connected semisimple groups, the universal centralizer and the
Grothendieck–Springer space.

### Ownership and consumers

Each row names one producer. Where a statement here and one elsewhere touch the same object, the
consumer column names the comparison theorem that connects them; no second carrier is built.

| Subject | Producer | Declarations | Consumer, and the comparison it uses |
| --- | --- | --- | --- |
| Relative reductive group schemes over an arbitrary base: predicates and their invariance, centre, derived group, central isogenies, simply connected and adjoint forms, tori and Borel schemes, root-datum sheaves, étale-local splitting, pinned classification, `Aut`, `Isom` and forms | this roadmap, GS6–GS7 | `IsReductive`, `IsSemisimple`, `center`, `derivedSubgroup`, `simplyConnectedCover`, `adjointQuotient`, `torusScheme`, `borScheme`, `characterSheaf`, `rootDatumSheaf`, `split_etaleLocally`, `pinned_iso_model`, `autScheme`, `isomTorsor`, `forms_equiv_H1` | [ReductiveGroups Layer 8](../ReductiveGroups/README.md#layer-8-classification-and-existence), "Relative reductive groups over an affine Noetherian base": every obligation of that bullet is a GS target at `S = Spec R` (table below), transported by `isReductive_hopfSpec_iff` and the GS0.2 Hopf comparisons |
| Field classification: isomorphism and existence theorems over a field | ReductiveGroups Layer 8, first bullet | (README-only there) | GS6.5–GS6.6 at `S = Spec k` agree with it (`pinned_iso_model_field`); GS6 does not use it as an input |
| The pinned split reductive group `G_R` over `ℤ` for every reduced root datum `R`, central tori and root-free data included; its base change, root subgroup maps `x_α`, pinning, and the pinned isomorphism theorem between these models | [ReductiveGroups 9B](../ReductiveGroups/README.md#9b-pinned-groups-and-their-explicit-carriers) | the Chevalley–Demazure construction of 9B | GS6.5 (`pinned_iso_model`), GS6.6 (`model_isSplit`), GS8.4 (root subgroups and pinning) |
| `G_sc(t)` for a Dynkin type `t`, its realizations and point groups | [ChevalleyGroups](../ChevalleyGroups/README.md), the semisimple specialization of 9B | `DynkinType.chevalleyGroupScheme` | only GS6.6's comparison theorem `centralQuotient_iso_model`; never the source of the integral group |
| Group objects `Grp (Over S)`, finite locally free groups, finite and affine quotients, finite étale schemes, effective fppf descent, finite Hom schemes | [ModularCurves 0B–0F](../ModularCurves/README.md#0b-finite-locally-free-group-schemes-and-cartier-duality) and Mathlib | `GrpObj (Over.mk f)`, 0C affine quotients, 0E descent | every GS construction is on these carriers; GS1.5 compares `D_S(M)` with 0B's Cartier dual of `M_S`, GS6.6 and GS8.1 use 0C's quotients |
| Group algebraic spaces, torsors and classes, twisting, quotient predicates, nonabelian `H¹`, `𝔾_a`, `𝔾_m`, `μ_n` on big sites, Hilbert 90, reflexive sheaves | [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§0.6, 0.9, 1.13, 1.15–1.17, 2.3, 2.9, 2.11, 3.4 | as named there | GS1.4 identifies `D_S(ℤ)`, `D_S(ℤ/n)` with §2.9's sheaves; GS4.1 proves §1.17's quotient predicates; GS6.7 classifies forms in §2.3's `H¹` |
| The fibrewise identity-component subfunctor of a group algebraic space, open over a locally Noetherian base | [AlgebraicModuliForArithmeticGeometry #853, §7.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/61d2065b27e8ffe9670bfd756d46415b465eabad/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#L8835-L8854) | `spaceSectionComponentCriterion` | GS0.4 consumes that subfunctor through the adapter from `Grp (Over S)` to group algebraic spaces (§1.13) and adds its representability by an open smooth subgroup scheme over an arbitrary base for smooth `G` (`identityComponent_toSpace`) |
| Smooth affine and reductive models over a discrete valuation ring, their identity components; Weil restriction and norm tori | [ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md) RG2.3.1, RG2.0a | `IntegralModel.SmoothModel.IsReductive`, `SmoothModel.identityComponent` | `isReductive_iff_smoothModel` (GS6.1) and `identityComponent_smoothModel` (GS0.4); GS2 checks use RG2.0a's norm tori |
| Finite locally free groups of multiplicative type and their rigidity | [FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, R07.1.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0e779dc2121c5f27c054657fc1a7e2b8770b28fe/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#L783-L838) | `multiplicativeTypeRigidity` | `isMultiplicativeType_of_finiteFlat` (GS2.1) and `rigidity_finite_eq` (GS3.1): on finite groups of multiplicative type the GS lift is R07.1.4's |
| Associated lines `L(λ)` on flags over a field, their tensor, base-change and ampleness laws, the fibre-character equivalence, ordinary flag Picard groups and the forgetful map | [SchubertGeometry](../SchubertGeometry/README.md#s3-line-bundles-sections-and-rank-one-push-pull) S3, with S3 and S3P at [#1224](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f356f08f27f03da7c92341afd0ee485bb93934ca/TauCetiRoadmap/SchubertGeometry/README.md#L107-L311) | as named there | GS7.4–GS7.5 consume them over a field, with the convention comparison `lineBundle_eq_schubert`; GS7.6 is the extension over a base |
| `G`-linearized line bundles for an arbitrary action and `Pic^G` | [EquivariantIntersectionTheory #1685, 1.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/5a990c6cdc81f1619e8b064ac268ecb11c42d854/TauCetiRoadmap/EquivariantIntersectionTheory/README.md#L107-L115) | `G`-linearisation, `Pic^G(X)` | the linearization of GS7.4's `𝓛(λ)` is one of these; no separate equivariant-line API |
| Chevalley's theorem for every smooth connected group over a perfect field | this roadmap, GS4.2 | `chevalley` | [NeronModelsAndSemistableAbelianVarieties #852, §2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/753e52a0bf64e28f9d2063241b8d8c6e64e9ede5/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#L1081-L1090), the commutative identity fibre of a Néron model, through `chevalley_comm` |
| Abelian schemes, duals, rigidity, Albanese, Néron–Severi | [AbelianSchemesAndArithmeticModuli #849](https://github.com/TauCetiProject/TauCetiRoadmap/pull/849) and Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety` | as named there | GS4 and GS5 |
| Dynkin types, weight lattice, Coxeter combinatorics | [RootSystems](../RepresentationTheory/RootSystems/README.md) | `DynkinType`, `DynkinType.simplyConnectedRootDatum` | GS6–GS8 |

### What ReductiveGroups Layer 8 consumes

The bullet "Relative reductive groups over an affine Noetherian base" of ReductiveGroups Layer 8
commissions the following, each produced here over an arbitrary base and specialized to
`S = Spec R`; nothing in it is dropped.

| Layer 8 obligation | GS target |
| --- | --- |
| reductive and semisimple predicates on scheme group objects and Hopf presentations | GS6.1 `IsReductive`, `IsSemisimple`; GS0.2 `isReductive_hopfSpec_iff` |
| invariance under isomorphism, base change, products and fpqc descent, with the comparison maps | GS6.1 `isReductive_baseChange`, `isReductive_prod`, `isReductive_of_descent`, with GS0.1's base-change isomorphisms |
| relative centre of multiplicative type, derived subgroup semisimple, smoothness only where it holds | GS6.2 `center`, `derivedSubgroup`; check `center_SL_p_not_smooth` |
| central isogenies, simply connected and adjoint forms, their kernels and base change | GS6.5 isogeny theorem; GS6.6 `simplyConnectedCover`, `adjointQuotient` |
| smooth scheme of maximal tori, smooth projective scheme of Borels, functor-of-points descriptions, étale-local sections | GS5.2 and GS6.3 `torusScheme`; GS7.1–GS7.2 `borScheme` |
| root subgroups and root-space decomposition after an étale splitting; character, cocharacter and root datum as étale locally constant sheaves | GS2.3 `characterSheaf`; GS6.3–GS6.4 `rootDatumSheaf` |
| étale-locally split, identified with a Layer 9 split model with the full root datum | GS6.4 `split_etaleLocally`; GS6.5 `pinned_iso_model` |
| based-root-datum classification of pinned split models over connected bases; isomorphism, base-change and pinning-change equations | GS6.5 `pinned_iso_model`, `pinned_iso_model_baseChange`, `pinningChange` |
| relative subgroup, quotient and multiplicative-type comparisons: fppf coequalizers, effective affine descent, representability, base-change maps | GS1.4, GS2.3, GS3.4–GS3.5 on ModularCurves 0C/0E carriers |
| automorphism sheaf, inner/outer and pinned-automorphism interfaces, the `Isom(G₀, G)` torsor | GS6.7 `autScheme`, `aut_exact`, `isomTorsor` |
| étale forms of `G₀` as torsors under `Aut(G₀)`, inverse functors, nonabelian `H¹` | GS6.7 `forms_equiv_H1` |
| tests: a nonsplit real torus; `SL₂` against `PGL₂` | GS2 and GS6 checks |

ReductiveGroups Layer 9 does not depend on this roadmap (Layer 8 says so: "This relative extension
is not a prerequisite of Layer9").

**Not in scope.** Groups of multiplicative type that are not of finite type (pro-objects such as
`D(ℚ)`), pseudo-reductive and quasi-reductive groups, abelian schemes, Néron models, parahoric
group schemes, and non-affine group algebraic spaces beyond the comparison of GS0.

## Conventions

1. **Group schemes.** A group scheme over `S : Scheme.{u}` is an object of Mathlib's
   `Grp (Over S)` for the cartesian monoidal structure of `Over S` (`AlgebraicGeometry.Pullbacks`
   provides the instance). The structure morphism of `G` is `G.X.hom`, and every property of
   `G` over `S` (affine, smooth, flat, of finite presentation, separated) is Mathlib's morphism
   class on `G.X.hom`: `IsAffineHom`, `Smooth`, `Flat`, `LocallyOfFinitePresentation` together with
   `QuasiCompact` and `QuasiSeparated`, `IsSeparated`.
2. **Base change.** `baseChange f G` for `f : S' ⟶ S` is `(Over.pullback f).mapGrp.obj G`, using
   Mathlib's `Functor.mapGrp` and the braided instance on `Over.pullback`. For `S = Spec R` and
   `G = hopfSpec R H` the comparison with Tau Ceti's `FiniteTypeCommHopfAlgCat.baseChange` is a
   GS0 target, so that Hopf-side and scheme-side base changes agree.
3. **Geometric fibres.** A geometric point of `S` is a morphism `x : Spec Ω ⟶ S` with `Ω` an
   algebraically closed field in universe `u`. The geometric fibre `G_x` is `baseChange x G`. A
   property is *fibrewise* when it is required of `G_x` for every geometric point; every invariant
   of `G_x` used below is proved to depend only on the image point `s ∈ S` (GS0.3).
4. **Topologies.** An fppf cover is a jointly surjective family of flat morphisms locally of finite
   presentation; an étale cover a jointly surjective family of étale morphisms. "Locally" without
   qualification means "after base change to every member of some cover".
5. **Characters.** `X*(H)` is the sheaf `Hom_{S-gr}(H, 𝔾_{m,S})` on the big étale site of `S` and
   `X_*(H) = Hom_{S-gr}(𝔾_{m,S}, H)`. For a finitely generated abelian group `M`, the
   diagonalizable group `D_S(M) = Spec_S O_S[M]` has `X*(D_S(M)) = M_S` (constant sheaf), and a
   homomorphism `φ : M → N` gives `D(φ) : D_S(N) → D_S(M)`. `𝔾_{m,S} = D_S(ℤ)` and
   `μ_{n,S} = D_S(ℤ/n)`.
6. **Roots, Borel subgroups and line bundles.** For a split maximal torus `T` of `G` and a Borel
   subgroup `B ⊇ T`, `Φ(B)` is the set of roots whose root spaces lie in `Lie(B)`, as in Tau
   Ceti's `SplitMaximalTorus.IsPositiveRoot`. A positive system `Φ⁺` fixes `B⁺` with
   `Φ(B⁺) = Φ⁺` and its opposite `B⁻` with `Φ(B⁻) = −Φ⁺`. Flags are `G/B⁻`, as in
   SchubertGeometry (Conventions) and Jantzen (II.1.8). For `λ ∈ X*(T)`, `𝓛(λ) = G ×^{B⁻} λ` is the
   sheaf of functions `f` on preimages of opens with `f(gb) = λ(b)⁻¹ f(g)` for `b ∈ B⁻`
   (Jantzen, I.5.8 and II.2.1), and it is `G`-linearized by `(g·f)(x) = f(g⁻¹x)`. Its fibre
   character at `eB⁻` is `λ`. Its degree on the root curve `C_α = P_α⁻/B⁻ ≅ ℙ¹` is `⟨λ, α^∨⟩`,
   so `𝓛(ϖ) = O(1)` on `SL₂/B⁻ = ℙ¹`. The ample cone is the strictly dominant weights. These
   conventions are SchubertGeometry's, unchanged, and every Picard statement below uses them.
   A Borel subgroup `B` not of the form `B⁻` enters only through `Bor(G) ≅ G/B`. Translation by
   a representative `n₀ ∈ N_G(T)` of the longest element `w₀` gives `G/B⁺ ≅ G/B⁻`,
   `gB⁺ ↦ g n₀⁻¹ B⁻`. It pulls `𝓛(μ)` back to the `B⁺`-line of character `w₀μ`: this is the
   comparison with sources that put the positive root groups in the Borel of the flag
   (`lineBundle_positiveBorel`).
7. **Root data** are Mathlib's `RootDatum ι X₁ X₂` (a `RootPairing` over `ℤ`) with
   `X₁ = X*(T)` and `X₂ = X_*(T)`, finitely generated, and reduced. The weight lattice of the
   simply connected cover of the derived group is `P`, and `X*(T_der) ⊆ P` is the image of
   `X*(T)` under restriction.
8. **Generality.** The base is an arbitrary scheme unless a target names a hypothesis (connected,
   locally noetherian, normal, regular). Groups of multiplicative type are of finite type over the
   base, and reductive group schemes are affine (as in SGA 3, Exp. XIX, 2.7).

## What exists (consume)

- **Mathlib.** `Grp (Over S)`, `GrpObj`, `IsCommMonObj`, `Over.pullback`, `Functor.mapGrp`,
  `Over.grpObjMkPullbackSnd`; `AlgebraicGeometry.hopfSpec` with `hopfSpec.fullyFaithful`
  (`AlgebraicGeometry/Group/Affine.lean`); `smooth_of_grpObj` (`Group/Smooth.lean`);
  `isCommMonObj_of_isProper_of_geometricallyIntegral` (`Group/Abelian.lean`); the morphism classes
  `Smooth`, `Etale`, `Flat`, `IsAffineHom`, `IsFinite`, `IsProper`, `LocallyOfFinitePresentation`,
  `GeometricallyConnected`, `GeometricallyReduced`; `Scheme.Hom.fiber`,
  `Scheme.fromSpecResidueField`, `specULiftZIsTerminal`; `RootPairing`, `RootDatum` and the Weyl
  group of a root pairing (`LinearAlgebra/RootSystem/`).
- **Tau Ceti, over a field.** `multiplicativeTypeCommHopfAlgProperty` and
  `MultiplicativeTypeAffineGroupSchemeCat`, the character lattice and Galois module
  (`Algebra/AlgebraicGroup/MultiplicativeType/`), `torusCommHopfAlgProperty`,
  `splitTorusCommHopfAlgProperty`, `HopfIdeal.IsMaximalTorus` (`Torus/`),
  `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean`), `HopfIdeal.IsBorel` (`Borel/`), unipotent
  and solvable radicals, `TauCeti.AlgebraicGeometry.AbelianVariety`.
- **Tau Ceti, over `Spec R`.** `DiagonalizableGroup.groupScheme` and its fully faithful functor
  over a base with connected spectrum (`DiagonalizableGroup/Scheme/Basic.lean`),
  `reductiveCommHopfAlgPropertyOver` (`Reductive/Over.lean`), `HopfIdeal.IsBorelOver`
  (`Borel/Over.lean`), `SplitMaximalTorus` and `Pinning` over a connected base
  (`Pinning/Basic.lean`), fppf quotient sheaves of affine groups (`Fppf/Quotient/`),
  `AffineGroupSchemeCat`, Cartier duality of finite locally free groups
  (`AlgebraicGeometry/AffineGroupScheme/`), kernels and closed subgroups over a scheme
  (`AlgebraicGeometry/GroupScheme/`).

Over a base the lowest rung is therefore the group object, its base change and the affine-base
Hopf predicates; GS0 connects them.

## Layer GS0: carriers over a base

- **GS0.1 Base change.** `baseChange` as in Convention 2, its functoriality
  (`baseChange_id`, `baseChange_comp` as natural isomorphisms) and the comparison
  `baseChange_hopfSpec`: for `R → R'`, `baseChange (Spec.map _) (hopfSpec R H)` is isomorphic to
  `hopfSpec R' (R' ⊗[R] H)`.
- **GS0.2 Affine base.** For `S = Spec R`, the essential image of `hopfSpec R` is the affine group
  schemes (Tau Ceti `affineGroupSchemeProperty`), and every predicate defined in GS1–GS8 on an
  affine group over `Spec R` comes with an `_iff` lemma against the Tau Ceti Hopf predicate where
  one exists (`reductiveCommHopfAlgPropertyOver`, `IsBorelOver`, `SplitMaximalTorus`).
- **GS0.3 Geometric fibres.** `geometricFiber G x`; for two geometric points over the same
  `s ∈ S`, every dimension and rank of GS4 takes the same value (the invariants are stable under
  extension of algebraically closed fields).
- **GS0.4 Identity component over a base.** The identity component is the fibrewise
  identity-component subfunctor of AlgebraicModuliForArithmeticGeometry §7.9 (#853), applied to
  `G` through the adapter `toGroupAlgebraicSpace : Grp (Over S) ⥤` group algebraic spaces over `S`
  (SchemeAndStackFoundations §1.13); no second neutral-component functor is defined. What is
  added here is the arbitrary base. If `G` is smooth over `S` along its identity section, that
  subfunctor is represented by an open subgroup scheme `G⁰ ⊆ G`, smooth over `S`, quasi-compact
  over `S` and with connected fibres, and its formation commutes with base change
  (`identityComponent_toSpace`; SGA 3, Exp. VI_B, 3.9 and 3.10). No Noetherian hypothesis is
  needed. Over a locally Noetherian base it is the open `P⁰` of `spaceSectionComponentCriterion`
  for `P = toGroupAlgebraicSpace G` (`identityComponent_eq_section`). Over a field it is Tau
  Ceti's identity component. Over a discrete valuation ring, for a smooth affine model with
  connected generic fibre, it is ReductiveGroupsPartII's `SmoothModel.identityComponent`
  (`identityComponent_smoothModel`).

**Checks.** `𝔾_{m,S}` has connected fibres and `G⁰ = G`; for the constant group `(ℤ/2)_S`,
`G⁰` is the identity section; for `μ_{2}` over `ℤ` (not smooth) GS0.4 does not apply, and its
special fibre at `2` is connected while its generic fibre has two components.

## Layer GS1: diagonalizable groups over a base

- **GS1.1 Construction.** `diagonalizable S M := baseChange (S ⟶ Spec ℤ) (D_ℤ(M))`, where
  `D_ℤ(M)` is Tau Ceti's `DiagonalizableGroup.groupScheme` over `ULift ℤ` and `S ⟶ Spec ℤ` is the
  map to the terminal object `specULiftZIsTerminal`; Tau Ceti's `FGCommGrpCat` is written
  multiplicatively, so the additive `M` enters as `Multiplicative M`. It is commutative, affine
  and flat, of finite presentation when `M` is finitely generated, and over `Spec R` it is
  isomorphic to Tau Ceti's `groupScheme R M`.
- **GS1.2 Homomorphisms.** For `S` connected and nonempty,
  `diagonalizableHomEquiv : (D_S(M) ⟶ D_S(N)) ≃ (N →+ M)`; for general `S`, homomorphisms are
  locally constant functions `S → Hom(N, M)` (SGA 3, Exp. VIII, §1; Conrad, Appendix B).
- **GS1.3 Smoothness.** `D_S(M)` is smooth over `S` iff the order of the torsion subgroup of `M`
  is invertible on `S`; it is étale iff moreover `M` is finite. `μ_{p,𝔽_p}` is not smooth.
- **GS1.4 Exactness.** `D_S` turns a short exact sequence `0 → M′ → M → M″ → 0` of finitely
  generated groups into a sequence `1 → D(M″) → D(M) → D(M′) → 1` exact as fppf sheaves, with
  `D(M) → D(M′)` faithfully flat (SGA 3, Exp. VIII, §3). It identifies `D_S(ℤ)` and `D_S(ℤ/n)` with
  the big-site sheaves `𝔾_m` and `μ_n` of SchemeAndStackFoundations §2.9.
- **GS1.5 Cartier duality.** For `M` finite, `D_S(M)` is the Cartier dual of the constant group
  `M_S` in the sense of ModularCurves 0B (Tau Ceti `CartierDuality/Constant.lean`).
- **GS1.6 Torsors.** `H¹_fppf(S, D_S(M))` for `M = ℤ^r ⊕ ⨁ ℤ/nᵢ` is
  `Pic(S)^r × ∏ H¹_fppf(S, μ_{nᵢ})`, by GS1.4 and §2.11 of SchemeAndStackFoundations.

## Layer GS2: groups of multiplicative type and tori

- **GS2.1 Definitions.** `IsMultiplicativeType G`: there is an fppf cover `{Uᵢ → S}` and finitely
  generated `Mᵢ` with `baseChange G ≅ D_{Uᵢ}(Mᵢ)` (SGA 3, Exp. IX, 1.1). `IsTorus G`: the same
  with `Mᵢ` free; `IsSplitTorus G`: `G ≅ D_S(ℤ^r)` globally. Over a field these are Tau Ceti's
  `multiplicativeTypeCommHopfAlgProperty` and `torusCommHopfAlgProperty` (`_iff` lemmas). A
  finite locally free group that is étale locally a product of groups `μ_n`, the finite
  multiplicative type of FiniteFlatGroups R07.1.4 (#879), satisfies `IsMultiplicativeType`
  (`isMultiplicativeType_of_finiteFlat`), and conversely a finite `H` with `IsMultiplicativeType H`
  is of that kind; nothing finite is redeveloped.
- **GS2.2 Quasi-isotriviality.** A group of multiplicative type of finite type is étale-locally
  diagonalizable (SGA 3, Exp. X, Cor. 4.5).
- **GS2.3 Character sheaf and anti-equivalence.** `characterSheaf H` is an étale sheaf locally
  isomorphic to a constant finitely generated group, and `multiplicativeTypeEquiv` is an
  anti-equivalence between groups of multiplicative type over `S` and such sheaves on the small
  étale site, compatible with base change, with inverse `F ↦ D_S(F)` built by étale descent
  (ModularCurves 0E) (SGA 3, Exp. X, §1). For `S` connected, `H` is diagonalizable iff `X*(H)` is
  constant.
- **GS2.4 Galois description over a field.** Over a field `k`, `X*(H)` is the continuous
  `Gal(k^s/k)`-module of Tau Ceti's `MultiplicativeType/GaloisModule.lean`.
- **GS2.5 Isotriviality.** `IsIsotrivial H`: there are a finite étale surjective `S′ → S` and one
  finitely generated `M` with `H_{S′} ≅ D_{S′}(M)` (SGA 3, Exp. IX, 1.1, recalled at the start of
  Exp. X). Over a connected `S` this is equivalent to `X*(H)` becoming constant on such an `S′`.
  *Theorem.* Let `S` be connected, locally noetherian and geometrically unibranch, for instance
  normal. Then every group of multiplicative type of finite type over `S` is isotrivial
  (`IsMultiplicativeType.isotrivial`; SGA 3, Exp. X, 5.16, in the re-edition, which replaces the
  original "normal" by "geometrically unibranch"; its proof begins by reducing to `S` connected,
  where `H` has constant type `M`). Connectedness cannot be dropped from the global statement,
  since `M` is a single group: over a disjoint union of two fields, the torus of rank one on one
  point and rank two on the other is split on each point and not isotrivial. The componentwise
  form holds without it: for `S` locally noetherian and geometrically unibranch, the connected
  components `Sⱼ` are open, `X*(H)` is a locally constant sheaf, and each `H|_{Sⱼ}` is isotrivial,
  of type the stalk of `X*(H)` on `Sⱼ` (`IsMultiplicativeType.isotrivial_component`).
- **GS2.6 A non-isotrivial torus.** Over the nodal cubic curve over a field, the rank-2 torus
  obtained by gluing `𝔾_m²` over the normalization along the two preimages of the node by the
  automorphism of `ℤ²` with matrix `[[1, 1], [0, 1]]` is a torus that is not isotrivial
  (SGA 3, Exp. X, 1.6, built there from the connected étale `ℤ`-torsor over the curve). Prove that the gluing gives a torus and that no finite étale surjective
  base change makes it diagonalizable.
- **GS2.7 Cocharacters, subtori, quotients.** `X_*(T)` is the dual sheaf of `X*(T)` for a torus;
  tori correspond to locally constant sheaves of free modules of finite rank. Subgroups of
  multiplicative type of `H` correspond to quotient sheaves of `X*(H)`, and the quotient of `H` by
  such a subgroup is of multiplicative type with character sheaf the kernel (GS1.4, GS2.3). The
  closed subgroup `H_tor = D(X*(H)/torsion)` is the largest subtorus, and `H/H_tor` is finite of
  multiplicative type with character sheaf the torsion of `X*(H)`.

**Checks.** `D(ℤ/2)` over `ℤ[1/2]` is the constant group `(ℤ/2)`, and over `𝔽₂` it is not
étale; the norm-one torus `R¹_{ℂ/ℝ}𝔾_m` (ReductiveGroupsPartII RG2.0a) is a non-split torus over
`ℝ` with `X* = ℤ` and complex conjugation acting by `-1`.

## Layer GS3: rigidity, density of torsion, Hom schemes, centralizers

- **GS3.1 Infinitesimal rigidity.** For `S₀ ⊆ S` a closed subscheme defined by a nilpotent ideal,
  `H` of multiplicative type and `G` smooth affine over `S`, every homomorphism `H₀ → G₀` lifts to
  `H → G` étale-locally, and two lifts are conjugate by a section of the kernel of
  `G(S) → G(S₀)` (SGA 3, Exp. IX, §3). For `G` of multiplicative type the lift is unique. When
  `H` and `G` are both finite locally free of multiplicative type, this unique lift is the one of
  FiniteFlatGroups R07.1.4 (ii) (#879), obtained there by Cartier duality (`rigidity_finite_eq`).
- **GS3.2 Rigidity along a connected base.** For `S` connected and `H, H′` of multiplicative type,
  two homomorphisms `H → H′` that agree on the fibre over one point `s ∈ S` are equal
  (`hom_eq_of_eq_fibre`). This is the consequence of GS3.4: `Hom_{S-gr}(H, H′)` is étale and
  separated over `S`.
- **GS3.3 Density of torsion.** For `H` of multiplicative type, the family of subgroups `H[n]`
  is schematically dense in `H`, universally (SGA 3, Exp. IX, §4); for a torus the family
  `H[ℓ^k]` is dense for each prime `ℓ`. Hence homomorphisms out of `H` are determined by their
  restrictions to the `H[n]`.
- **GS3.4 Hom schemes.** For `H` of multiplicative type and `G` smooth affine over `S`, the functor
  `Hom_{S-gr}(H, G)` is represented by a smooth separated `S`-scheme (SGA 3, Exp. XI, 4.2); for
  `G` of multiplicative type it is étale, a twisted form of the constant scheme `Hom(X*(G), X*(H))`.
- **GS3.5 Centralizers and normalizers.** For `H ⊆ G` of multiplicative type in `G` smooth affine,
  `Z_G(H)` and `N_G(H)` are represented by closed smooth subgroup schemes, and `N_G(H)/Z_G(H)` is
  represented by an étale separated `S`-group (SGA 3, Exp. XI, §5). For `H` a torus
  and `G` with connected fibres, `Z_G(H)` has connected fibres.

**Checks.** `Hom(𝔾_m, 𝔾_m)` over any connected `S` is `ℤ`; the subtori `t ↦ diag(t, 1)` and
`t ↦ g_a diag(t, 1) g_a⁻¹` of `GL₂` over `𝔸¹ = Spec k[a]`, with `g_a` the upper unitriangular
matrix with entry `a`, agree at `a = 0` and differ: GS3.2 is about homomorphisms into a group of
multiplicative type, not about subtori of a non-commutative group. The obstruction is the torsion
locus: `{g | g² = 1}` in `GL₂` has a 2-dimensional tangent space at `diag(1, −1)`, whereas in a
commutative `G` of finite type `[ℓ]` has differential `ℓ` on `Lie G`, so `G[ℓ^k]` is unramified over
`S[1/ℓ]`.

## Layer GS4: smooth groups over a field and their ranks

Here `k` is a field and `G` a group scheme of finite type over `k`.

- **GS4.1 Quotients.** For a closed subgroup scheme `H ⊆ G` the fppf quotient sheaf `G/H` is
  represented by a scheme of finite type over `k`, `G → G/H` is faithfully flat, and `G/H` is
  quasi-projective; for `H` normal it is a group scheme (SGA 3, Exp. VI_A, 3.2; Demazure–Gabriel,
  III, §3, 5.4). It satisfies the quotient predicates of SchemeAndStackFoundations §1.17, and for
  `G` affine it represents Tau Ceti's fppf quotient sheaf and agrees with ReductiveGroups Layer 3.
- **GS4.2 Chevalley's theorem.** For `k` perfect and `G` smooth connected, there is a unique
  smooth connected affine normal subgroup `L` with `G/L` an abelian variety
  (Conrad, *A modern proof of Chevalley's theorem*, Thm. 1.1). It commutes with extension of
  perfect fields. NeronModels §2.3 (#852) applies it to the commutative identity fibre of a Néron
  model; `chevalley_comm` identifies its decomposition with this theorem, which §2.3 consumes.
- **GS4.3 Affinization.** `O(G)` is a finitely generated Hopf algebra, `G → Spec O(G)` is a
  faithfully flat quotient with kernel `G_ant`, the smallest normal subgroup with affine quotient,
  and `O(G_ant) = k` (Demazure–Gabriel, III, §3, 8.2). Write `G_affq = Spec O(G)`.
- **GS4.4 Rank invariants.** For `G` smooth connected over an algebraically closed `Ω`, with
  Chevalley subgroup `L`, a maximal torus `T` (it lies in `L`), and the radical `R(L)`:
  `dAff = dim L`; `ρ_ab = dim G − dim L`; `ρ_r = dim T`; `ρ_n = dim Z_G(T)`;
  `ρ_n^aff = dim Z_L(T)`; `ρ_u = ρ_n^aff − ρ_r`; `ρ_ss = ` the dimension of a maximal torus of
  `L/R(L)`. Prove independence from the choice of `T` (conjugacy of maximal tori in `L`, Tau Ceti)
  and invariance under extension of `Ω` (GS0.3). For `G` affine, `ρ_ab = 0` and the invariants
  are those of SGA 3, Exp. XII, §1.

**Checks.** For an elliptic curve `ρ_ab = ρ_n = 1` and `dAff = ρ_r = ρ_u = ρ_ss = 0`; for `𝔾_m`,
`ρ_r = ρ_n = 1`, `ρ_u = 0`; for `𝔾_a`, `ρ_r = 0`, `ρ_u = ρ_n = 1`; for `GL_n`, `ρ_r = ρ_n = n`,
`ρ_ss = n − 1`, `ρ_u = 0`.
Over a field of characteristic `0`, a non-split extension `G` of an abelian variety `A` by `𝔾_a`
has `G_affq = 1` while `L = 𝔾_a` (the class in `H¹(A, O_A)` is nonzero), so the affinization and
the Chevalley subgroup differ.

## Layer GS5: smooth group schemes over a base

Here `G` is smooth, separated, of finite presentation over `S`, with connected fibres.

- **GS5.1 Rank functions.** Each invariant of GS4.4 defines a function `S → ℕ` through geometric
  fibres (GS0.3).
- **GS5.2 Maximal tori over a base.** A subtorus `T ⊆ G` is maximal if every geometric fibre
  `T_x` is a maximal torus of `G_x`. For `G` affine: `G` has a maximal torus étale-locally on `S`
  iff `ρ_r` is locally constant (SGA 3, Exp. XII, §1 and Exp. XIV, §3); the functor of maximal
  tori is then represented by a smooth separated `S`-scheme `𝒯or(G)`, and two maximal tori are
  conjugate étale-locally (SGA 3, Exp. XII, §§1, 7).
  `Z_G(T)` is the Cartan subgroup attached to `T`.
- **GS5.3 Specialization inequalities.** For `s` a specialization of `s′` in `S`:
  `ρ_ab(s) ≤ ρ_ab(s′)`, `ρ_ab(s) + ρ_r(s) ≤ ρ_ab(s′) + ρ_r(s′)`, `ρ_ss(s) ≤ ρ_ss(s′)`,
  `ρ_n(s) ≥ ρ_n(s′)`, `ρ_n^aff(s) ≥ ρ_n^aff(s′)`, `ρ_u(s) ≥ ρ_u(s′)`, and `dAff(s) ≥ dAff(s′)`
  (SGA 3, Exp. X, 8.7, referring to Exp. XV, 4.2 and 8.19). Reduce to `S` locally noetherian
  by noetherian approximation (SchemeAndStackFoundations §0.9), then to the spectrum of a discrete
  valuation ring dominating the specialization (EGA II, 7.1.9), then
  prolong torsion of a split maximal torus of the special fibre to finite étale subgroups
  (GS3.3) and take their centralizers (GS3.5); the abelian rank uses the Tate module of the
  abelian quotient (AbelianSchemesAndArithmeticModuli).
- **GS5.4 Semicontinuity in the affine case.** For `G` affine, `ρ_r` is lower semicontinuous and
  `ρ_n` upper semicontinuous as functions on `S` (SGA 3, Exp. XII, 1.7).
- **GS5.5 The affine quotient is not constant along specialization.** Let `A` be an abelian scheme
  over `ℤ_p`, `ω` a basis vector of the free module `H¹(A, O_A)`, and `G` the extension of `A` by
  `𝔾_a` of class `p·ω`. Then `G` is smooth with connected fibres, `(G_η)_affq = 1` at the generic
  point and `(G_s)_affq ≅ 𝔾_a` at the closed point, while `dAff = 1` at both.

**Checks.** The group `G^(λ) = Spec_S O_S[t, (1 + λt)⁻¹]` with law `t₁ + t₂ + λ t₁ t₂`, for
`λ ∈ Γ(S, O_S)`, is smooth affine commutative with connected fibres; `t ↦ 1 + λt` is a
homomorphism to `𝔾_m` that is an isomorphism over `D(λ)`, and the fibre over `V(λ)` is `𝔾_a`.
Over `ℤ_p` with `λ = p`: `ρ_r` drops from `1` to `0` and `ρ_u` rises from `0` to `1`, and `G` has
no maximal torus over `ℤ_p` (GS5.2). The smooth locus of a Weierstrass model with split
multiplicative reduction, the identity component of the Néron model (NeronModels #852, §§2.3
and 2.7), has `ρ_ab` dropping from `1` to `0` and `ρ_r`
rising from `0` to `1`, so `ρ_r` alone is not semicontinuous outside the affine case.

## Layer GS6: reductive group schemes

This layer is the producer of the relative reductive theory; ReductiveGroups Layer 8's relative
bullet consumes it at `S = Spec R` (table in *What ReductiveGroups Layer 8 consumes*). The split
integral models are ReductiveGroups 9B's; nothing here constructs a second one.

- **GS6.1 Definition and invariance.** `IsReductive G`: `G` is affine and smooth over `S`, and
  every geometric fibre is connected reductive (SGA 3, Exp. XIX, 2.7; Conrad, Def. 3.1.1);
  `IsSemisimple G`: moreover the fibres are semisimple. Prove invariance under isomorphism, base
  change (`isReductive_baseChange`, through GS0.1's isomorphisms), finite products
  (`isReductive_prod`) and fpqc descent (`isReductive_of_descent`). Prove
  `isReductive_hopfSpec_iff` against Tau Ceti's `reductiveCommHopfAlgPropertyOver` over `Spec R`,
  and `isReductive_iff_smoothModel` against ReductiveGroupsPartII's
  `IntegralModel.SmoothModel.IsReductive` over a discrete valuation ring.
- **GS6.2 Maximal tori, centre and derived group.** `ρ_r` is locally constant on `S` for
  reductive `G`, so `G` has a maximal torus étale-locally (GS5.2; SGA 3, Exp. XIX, 6.1), and
  `Z_G(T) = T` for every maximal torus `T`. The functor of maximal tori is represented by a smooth
  `S`-scheme `torusScheme G ≅ G/N_G(T)` (Conrad, Thm. 3.2.6). The scheme-theoretic centre
  `center G` is a closed subgroup of multiplicative type, flat over `S`, the kernel of the action
  on `torusScheme G` (Conrad, Thm. 3.3.4). It need not be smooth: `center SL_p = μ_p` is not
  smooth over `𝔽_p` (`center_SL_p_not_smooth`). `derivedSubgroup G` is the unique semisimple
  closed normal subgroup with `G/derivedSubgroup G` a torus; it represents the fppf sheafified
  commutator subfunctor and commutes with base change (Conrad, Thm. 5.3.1).
- **GS6.3 Roots and split groups.** For a maximal torus `T`, the adjoint action decomposes
  `Lie(G)` étale-locally into `Lie(T)` and rank-one root spaces. `IsSplit (G, T)`: `T` is split,
  each root is a constant character `α ∈ X*(T)`, and each root space is free of rank one
  (SGA 3, Exp. XXII, 1.13). Construct the root datum `rootDatum G T : RootDatum Φ X*(T) X_*(T)`
  with the coroots from the root subgroups `U_α ≅ 𝔾_a` and the rank-one subgroups `Z_G(ker α)`;
  over a field it agrees with ReductiveGroups Layer 7. Over a connected `Spec R`, a split pair with
  a choice of root vectors gives Tau Ceti's `Pinning`.
- **GS6.4 Étale-local splitting and the root-datum sheaf.** Every reductive group scheme is split
  étale-locally on `S` (`split_etaleLocally`; SGA 3, Exp. XXII, 2.3). The character and
  cocharacter sheaves of a maximal torus, their perfect pairing, and the roots and coroots descend
  to an étale locally constant sheaf of root data `rootDatumSheaf G T`; the root datum of `G_x` is
  locally constant in `x` and is the *type* of `G`. The full root datum is kept, not only its
  Dynkin diagram.
- **GS6.5 Pinned split groups are the 9B models; isogeny theorem.** Let `S` be nonempty and
  `(G, T, B, (X_α))` pinned split with based root datum `(R, Δ)`. Then there is a unique pinned
  isomorphism from `G` to the base change to `S` of ReductiveGroups 9B's pinned group `G_R`
  (`pinned_iso_model`; SGA 3, Exp. XXIII, 4.1; Conrad, Thm. 6.1.17). With 9B's isomorphism theorem
  for its own models, this gives the equivalence between pinned split reductive `S`-groups and
  based reduced root data, with the base-change equation `pinned_iso_model_baseChange` and the
  change-of-pinning equation `pinningChange` (the action of `(T/Z_G)(S)`). Isogenies of root data
  are induced by isogenies compatible with the splittings, unique up to `(T/Z_G)(S)` (Conrad,
  Thm. 6.1.16 (1); SGA 3, Exp. XXV, 1.1). Over a field this is ReductiveGroups Layer 8's
  isomorphism theorem (`pinned_iso_model_field`).
- **GS6.6 Existence, and the central-quotient comparison.** For every reduced root datum
  `R = (X, Φ, X^∨, Φ^∨)`, central tori and the root-free case `Φ = ∅` included, the split
  reductive group with root datum `R` over `S` is the base change of ReductiveGroups 9B's `G_R`.
  Prove `model_isSplit`: `G_R` satisfies `IsReductive` and `IsSplit` in the sense of GS6.1–GS6.3,
  with `rootDatum` isomorphic to `R` (SGA 3, Exp. XXV, 1.1 and Cor. 1.2; Conrad, Thm. 6.1.16 (2)).
  *Comparison theorem* `centralQuotient_iso_model`: for `t` the Dynkin type of `Φ` and
  `G_sc(t)` ChevalleyGroups' `DynkinType.chevalleyGroupScheme t`,
  `G_R ≅ (G_sc(t) × D(X/(X ∩ ℚΦ))) / K`, where `K` is the finite diagonalizable central subgroup
  whose character group is the cokernel of the injection `X → P ⊕ X/(X ∩ ℚΦ)`,
  `x ↦ ((⟨x, α_i^∨⟩)_i, x mod ℚΦ)`, the quotient being ModularCurves 0C's; it is proved from
  GS6.5's isogeny theorem, not used to construct `G_R`. For `Φ = ∅` it reads `G_R = D(X)`.
  For semisimple `G`, `simplyConnectedCover G → G` is the unique central isogeny from a simply
  connected semisimple group, and `adjointQuotient G = G/center G` is the split group of the
  adjoint root datum when `G` is split (Conrad, Exercise 6.5.2); both exist for every reductive
  `G` by GS6.4 and descent (ModularCurves 0E), commute with base change, and the kernel of the
  first is of multiplicative type.
- **GS6.7 Automorphisms, `Isom` torsors and forms.** For reductive `G`, `Aut_{S-gr}(G)` is
  represented by a smooth separated `S`-group `autScheme G`, and
  `1 → G/center G → Aut(G) → Out(G) → 1` is exact with `Out(G)` étale and locally constant
  (`aut_exact`). For `G` pinned split, `Out(G)` is the constant group of automorphisms of the based
  root datum and the pinning splits the sequence (SGA 3, Exp. XXIV, 1.3; Conrad, Thm. 7.1.9).
  For a fixed split `G₀` and `G` étale-locally isomorphic to it, `isomTorsor G₀ G` is the
  `Aut(G₀)`-torsor `Isom(G₀, G)`. `forms_equiv_H1` is the equivalence between the groupoid of
  such `G` and that of `Aut(G₀)`-torsors, with inverse the twist by effective affine descent
  (SchemeAndStackFoundations §§1.15–1.16, 2.3; ModularCurves 0E), hence a bijection of isomorphism
  classes with `H¹_ét(S, Aut(G₀))`. No global splitting or Borel subgroup is asserted.

**Checks.** `GL_n`, `SL_n`, `PGL_n`, `Sp_{2n}` over `ℤ` and `𝔾_m^r` are reductive and split;
`center SL_n = μ_n` and `center GL_n = 𝔾_m`; `SL₂` and `PGL₂` have the same Dynkin diagram and
different root data, and `simplyConnectedCover PGL₂ = SL₂` with kernel `μ₂`; for `R` root-free
of rank `r`, `G_R = 𝔾_m^r`. The kernel of the norm `R_{ℤ[i,1/2]/ℤ[1/2]} 𝔾_m → 𝔾_m`
(ReductiveGroupsPartII RG2.0a) is a non-split torus over `ℤ[1/2]`, and its fibre over `ℝ` is the
non-split real torus `R¹_{ℂ/ℝ}𝔾_m` of GS2; the smooth affine group `G^(p)` of GS5 is not
reductive over `ℤ_p`, its special fibre being `𝔾_a`.

## Layer GS7: Borel subgroups, the scheme `Bor`, and its Picard group

Here `G` is reductive over `S`.

- **GS7.1 Borel subgroups.** A Borel subgroup is a smooth closed subgroup `B` with every
  geometric fibre a Borel subgroup; comparison with Tau Ceti `IsBorelOver` over `Spec R`.
  Étale-locally on `S` there is a Borel subgroup containing a given maximal torus, two Borel
  subgroups are conjugate étale-locally, and `N_G(B) = B` (SGA 3, Exp. XXII, §5).
- **GS7.2 The scheme of Borel subgroups.** The functor `Bor(G)` of Borel subgroups is represented
  by a smooth projective `S`-scheme, and for a Borel `B`, `G/B ≅ Bor(G)` (SGA 3, Exp. XXII, 5.8.3).
- **GS7.3 Abstract torus and Weyl group.** For a Borel `B` with unipotent radical `U`,
  `B/U` is a torus; the tori `B/U` for varying `B` are identified by canonical isomorphisms
  (conjugation, independent of the conjugating element), so they descend to a torus
  `abstractTorus G` over `S`. `W = N_G(T)/T` is represented by a finite étale `S`-group
  `weylGroupScheme`, and it acts on `abstractTorus G`. For split `(G, T)`, `W` is the constant group
  of the Weyl group of `rootDatum G T` (Mathlib's Weyl group of a root pairing).
- **GS7.4 Line bundles.** For split `(G, T)` with positive system `Φ⁺`, `B⁻ ⊇ T` as in
  Convention 6 and `λ ∈ X*(T)`, construct `lineBundle λ = 𝓛(λ)` on `G/B⁻` over `S` by descent along
  `G → G/B⁻`, with its `G`-linearization in the sense of EquivariantIntersectionTheory 1.1 (#1685):
  `𝓛(λ + μ) ≅ 𝓛(λ) ⊗ 𝓛(μ)`, `𝓛(−λ) ≅ 𝓛(λ)^∨`, compatibility with base change on `S`, and
  `𝓛(χ|_T)` is trivial as a line bundle for `χ ∈ X*(G)`, its linearization being twisted by `χ`.
  Over a field these are SchubertGeometry S3's associated lines, with the same linearization and
  fibre character (`lineBundle_eq_schubert`); the laws above over a field, the fibre-character
  equivalence between `G`-linearized lines on `G/B⁻` and characters of `B⁻`, and the forgetful map
  to the Picard group with kernel the restrictions of `X*(G)`, are consumed from S3 (#1224) and not
  reproved. Over a field, `H⁰(G/B⁻, 𝓛(λ)) ≠ 0` iff `λ` is dominant, and `𝓛(λ)` is ample iff
  `⟨λ, α^∨⟩ > 0` for every simple root `α` (Jantzen, II.2.6 and II.4.4, whose Borel subgroup is
  `B⁻`). What is added here is the base: over `S`, `𝓛(λ)` is relatively ample iff it is ample on
  every fibre, and `lineBundle_positiveBorel` is the comparison of Convention 6 with flags `G/B⁺`.
- **GS7.5 Picard groups over a field.** For `G` connected reductive and split over a field and
  `T ⊆ B⁻`: `0 → X*(G) → X*(T) → Pic(G/B⁻) → Pic(G) → 0` is exact, with `X*(T) → Pic(G/B⁻)` the map
  `λ ↦ 𝓛(λ)` composed with forgetting the linearization (Popov 1974, §4; Sansuc 1981, §6). The
  degrees on the root curves `C_α` give `Pic(G/B⁻) ≅ ℤ^Δ`, under which `𝓛(λ) ↦ (⟨λ, α^∨⟩)_α`;
  this identifies `Pic(G/B⁻)` with the weight lattice `P` of the simply connected cover of the
  derived group, and `Pic(G) ≅ P / X*(T_der)` is finite, zero iff the derived group is simply
  connected. Over `ℂ` this is SchubertGeometry S3P's ordinary flag Picard group (#1224), whose
  degree basis is the same (`pic_flag_eq_schubert`). Let `D_α` be the closure of `B⁺ s_α B⁻/B⁻`,
  the complement of the big cell `U⁺ B⁻/B⁻` being `⋃_α D_α`; then `C_β` meets `D_α` only for
  `β = α`, transversally in the point `s_α B⁻`, so `O(D_α)` has degrees `(δ_{αβ})_β` and is the
  line of the fundamental weight `ϖ_α` under `Pic(G/B⁻) ≅ P`.
- **GS7.6 Picard group of `Bor` over a base.** For `S` locally noetherian, normal and connected and
  `(G, T)` split, `Pic(S) ⊕ ℤ^Δ → Pic(G/B⁻)`, `(M, (n_α)) ↦ π*M ⊗ O(Σ n_α D_α)`, is an
  isomorphism. Prove it from the big cell `U⁺ ≅ U⁺B⁻/B⁻ ⊆ G/B⁻`, an affine space over `S` whose
  Picard group is `Pic(S)` for normal `S`, whose complement is `⋃ D_α`, and the `D_α` as relative
  effective Cartier divisors with irreducible fibres. With GS7.4, `λ ↦ 𝓛(λ)` induces
  `X*(T)/X*(G) ≅ X*(T_der) ↪ P ≅ ℤ^Δ`.

**Checks.** For `SL₂`, `Bor = ℙ¹`, `𝓛(ϖ) = O(1)`, `Pic(SL₂) = 0`, and under the translation of
Convention 6 the `B⁺`-line of character `−ϖ = w₀ϖ` is `O(1)` on `SL₂/B⁺`; for `PGL₂`,
`Pic(PGL₂) = ℤ/2`; for `GL_n`, `Pic(G/B⁻) ≅ ℤ^{n−1}` and `Pic(GL_n) = 0`; for a split torus
`G = T`, `Bor(T) = S` and every `𝓛(λ)` is the trivial line with the linearization `λ`.

## Layer GS8: the Steinberg map and the Grothendieck–Springer space

Here `(G, T)` is split reductive over `S` with derived group simply connected and `W` its Weyl
group. GS8.4 and GS8.4a assume moreover that `G` is semisimple, the setting of Steinberg's
cross-section theorem; with a central torus the product formula of GS8.4 is not a section.

- **GS8.1 The quotient `T/W`.** `T/W = Spec_S (O_T)^W`, the affine quotient of ModularCurves 0C.
  Since `ℤ[X*(T)]^W` is a polynomial ring over `ℤ[X*(G)]` on the orbit sums of fundamental weights
  lifted to `X*(T)` (Bourbaki, Lie VI, §3, no. 4, Thm. 1, for `ℤ[P]^W`), `T/W` is smooth over
  `S` and its formation commutes with base change.
- **GS8.2 The Steinberg map.** Over `ℤ`, restriction `O(G)^G → O(T)^W` is an isomorphism
  (Steinberg 1965, §6, on every geometric fibre, with `ℤ[G]` flat and `ℤ[T]^W` as in GS8.1).
  `steinbergMap : G → T/W` over `S` is its base change, the split `G` being a base change of one
  over `ℤ` (GS6.5, GS6.6). Prove that it is the unique `G`-invariant morphism restricting to the
  quotient map on `T`: the conjugates of the regular semisimple locus of `T` form an open subscheme
  dense in every fibre, hence schematically dense in the flat `G`. For `GL_n` it is the map to the
  coefficients of the characteristic polynomial.
- **GS8.3 Regular locus.** `regularLocus G` is the open subscheme of points `g` of geometric fibres
  with `dim Z_{G_x}(g) = rank`. Its complement has codimension `3` in every geometric fibre of
  positive semisimple rank, `steinbergMap` restricted to it is smooth and surjective, and
  `steinbergMap` is smooth exactly on `regularLocus G` (Steinberg 1965; Slodowy 1980, ch. 3).
- **GS8.4 Steinberg cross-section (semisimple simply connected).** In this item `G` is moreover
  semisimple, hence simply connected, of rank `r`. With the pinning of ReductiveGroups 9B
  (transported by GS6.5), an ordering `α₁, …, α_r` of the simple roots and
  `nᵢ = x_{αᵢ}(1) x_{−αᵢ}(−1) x_{αᵢ}(1) ∈ N_G(T)` lifting the simple reflections, let
  `κ : 𝔸^r_S → G`, `(c₁, …, c_r) ↦ ∏ᵢ x_{αᵢ}(cᵢ) nᵢ`, with image `C = U_{α₁} n₁ ⋯ U_{α_r} n_r`.
  `T/W ≅ 𝔸^r_S` by the fundamental characters (GS8.1), and `steinbergMap ∘ κ : 𝔸^r_S → T/W` is an
  isomorphism. Hence `κ` is a closed immersion (it has a retraction and `G` is separated),
  `C ⊆ regularLocus G`, and `steinbergSection := κ ∘ (steinbergMap ∘ κ)⁻¹ : T/W → G^reg` is a
  section of `steinbergMap`. Over an algebraically closed field this is Steinberg 1965,
  Theorems 1.4, 6.1 (b), 7.1 and 7.9, and a geometric point of `G` is regular iff it is conjugate
  to a point of `C` (Theorem 8.1). Over `S` both sides are flat and of finite presentation, so the
  fibrewise isomorphism criterion (EGA IV₄, 17.9.5; Conrad, Lemma B.3.1) gives the isomorphism. The displayed product is not a section for reductive groups with a
  central torus: for `SL₂ × 𝔾_m`, whose derived group is simply connected, `C` has dimension `1`
  and lies in `SL₂ × {1}`, while `T/W = 𝔸¹ × 𝔾_m` has dimension `2`.
- **GS8.4a Universal centralizer.** For `G` as in GS8.4 let
  `a : G × (T/W) → G^reg`, `(g, c) ↦ g σ(c) g⁻¹` with `σ = steinbergSection`, and let
  `universalCentralizer G ⊆ G × (T/W)` be the closed subgroup scheme over `T/W` of pairs `(g, c)`
  with `g σ(c) g⁻¹ = σ(c)`, with its scheme structure as this equalizer (not its reduction). Then
  `a` is surjective (Steinberg 1965, Theorem 8.1), its fibre over a geometric point `x` is a torsor
  under the scheme-theoretic centralizer `Z_{G_x}(x)`, of dimension `r`, and
  `universalCentralizer G = (G × T/W) ×_{a, G^reg, σ} (T/W)`. Hence the following are equivalent:
  `a` is smooth; `universalCentralizer G → T/W` is smooth; the scheme-theoretic centralizer of
  every regular geometric point of every fibre is smooth (`a_smooth_iff`; flatness of `a` from
  miracle flatness on fibres and the fibrewise flatness criterion, EGA IV₃, 11.3.10). *Theorem*
  `universalCentralizer_smooth_of_charZero`: if `S` is a `ℚ`-scheme these hold, every group
  scheme of finite type over a field of characteristic `0` being smooth (Cartier). No smoothness
  is asserted in positive or mixed characteristic: over a field of characteristic `2`, the
  regular unipotent `u = [[1, 1], [0, 1]] ∈ SL₂` has scheme-theoretic centralizer
  `{[[a, b], [0, a]] : a² = 1}`, whose coordinate ring `k[a, b]/(a² − 1) = k[a, b]/((a − 1)²)`
  has the nonzero nilpotent `a − 1`; so over `𝔽₂`, and over `ℤ`, `a` and
  `universalCentralizer SL₂ → T/W` are not smooth.
- **GS8.5 Grothendieck–Springer.** `G̃ ⊆ G × Bor(G)` is the closed subscheme of pairs `(g, B)`
  with `g ∈ B`. It is smooth over `S`, `G̃ → Bor(G)` is a fibration with fibre `B`, and
  `π : G̃ → G` is projective. `G̃ → T` sends `(g, B)` to the image of `g` in `B/U ≅ T` (GS7.3). The
  square `G̃ → T → T/W`, `G̃ → G → T/W` commutes, and the induced
  `grothendieckSpringer : G̃ → G ×_{T/W} T` is projective and birational and an isomorphism over
  `G^reg`; `π : G̃ → G` itself is not, being of degree `|W|` over the regular semisimple locus.
  `G̃ → T` is smooth: `G̃` is a simultaneous resolution of `steinbergMap` after base change along
  `T → T/W` (Slodowy 1980, ch. 4). Over `G^reg`, the map to `G^reg ×_{T/W} T` is proper and
  quasi-finite (a regular element lies in finitely many Borel subgroups, Steinberg 1965,
  Theorem 1.1), birational, and its target is smooth over `T` by GS8.3, hence normal; Zariski's
  main theorem gives the isomorphism. Over a regular semisimple geometric point the fibre of
  `G ×_{T/W} T` is `|W|` reduced points; over a regular unipotent one it is the non-reduced fibre
  of `T → T/W` over the image of `1`, supported at the unique Borel subgroup containing it.
- **GS8.6 Picard groups of `G̃`, `G` and `G^reg`.** For `S` regular noetherian and connected:
  `Pic(G) → Pic(G^reg)` is an isomorphism (Hartogs extension, SchemeAndStackFoundations §0.6,
  codimension `≥ 2`), and `0 → Pic(S) → Pic(G) → Pic(G_η) → 0` is exact with `G_η` the generic
  fibre, so `Pic(G)/Pic(S) ≅ P/X*(T_der)` is finite by GS7.5. `Pic(G/B) → Pic(G̃)` by pull-back
  along `G̃ → Bor` is an isomorphism, and a line bundle on `Bor` is relatively ample iff its pull-
  back to `G̃` is `π`-ample.
- **GS8.7 No resolution without base change.** For `S` regular noetherian and connected and `G`
  of positive semisimple rank, there is no regular scheme `X̃` with a projective morphism `p : X̃ → G` that
  is an isomorphism over `G^reg`, whose exceptional locus has codimension `≥ 2` in every fibre over
  `S`, and with `steinbergMap ∘ p` smooth. Proof: by GS8.6 `Pic(X̃) = Pic(G^reg)` is finite modulo
  `Pic(S)`, so a power of a `p`-ample bundle is pulled back from `S`, `p` is quasi-finite, hence
  finite and birational onto the normal `G`, hence an isomorphism; but `steinbergMap` is not
  smooth at the identity section (GS8.3).

**Checks.** For `SL₂`, `T/W = 𝔸¹` and `steinbergMap` is the trace; `G^reg` is the complement of
`{±1}`; `C` is `{[[t, -1], [1, 0]]}`. At a regular semisimple `x` (trace `≠ ±2`, eigenvalues
`t ≠ t⁻¹`), the fibre of `G ×_{T/W} T` is the two points `t, t⁻¹`, and `x` lies in the two
Borel subgroups stabilizing its eigenlines: `G̃ → G` has two points over `x`, and
`G̃ → G ×_{T/W} T` is a bijection there. At a regular unipotent `u ≠ 1` (trace `2`), `T → T/W`,
`t ↦ t + t⁻¹`, has fibre `Spec k[t]/(t − 1)²` over `2`, and `u` lies in one Borel subgroup: the
fibre of `G̃` over `u` is that length-two scheme. Over `±1`, which are not regular, the fibre of
`G̃` is `ℙ¹`. `GL_n` is not semisimple and lies outside GS8.4: the map to the coefficients of the
characteristic polynomial, `GL_n → 𝔸^{n−1} × 𝔾_m`, has the companion-matrix section, whose image
consists of regular elements; this is a direct computation (`companion_section`), not an instance
of the product formula of GS8.4.

## Ordering

GS0 → GS1 → GS2 → GS3 is one lane; GS0.4 needs #853 §7.9's component subfunctor. GS4 depends
only on Tau Ceti's field theory and GS0, and runs in parallel with GS1–GS3. GS5 needs GS3 and GS4.
GS6 needs GS3, GS5.2 and ReductiveGroups Layer 9 (9A–9B) for the integral models `G_R`; it does
not need ChevalleyGroups, whose `G_sc(t)` enters only the comparison theorem
`centralQuotient_iso_model` at the end of GS6.6, after GS6.5's isogeny theorem. ReductiveGroups
Layer 9 does not depend on this roadmap, and the relative bullet of ReductiveGroups Layer 8 comes
after GS6–GS7. GS7 needs GS6, SchubertGeometry S3 (and S3P for the comparison over `ℂ`) and
EquivariantIntersectionTheory 1.1; GS8 needs GS7 and 9B's root subgroups. The harder material
is GS5.3, GS6.5 and GS8.

## Provenance

The gap was identified while formalizing Grothendieck's unpublished notes in the Grothendieck
edition (`lean/Grothendieck/Folder72.lean` treats `G^(λ)` in coordinates over a ring;
`Folder90.lean` builds a flat affine group over a Dedekind ring as an explicit Hopf algebra; the
algebra lemmas are in `lean/Grothendieck/Upstream/FlatProdPi.lean` and
`FormallySmoothMapBaseChange.lean`). The notes' statements on semicontinuity of ranks, affine
quotients, rigid subgroups and the Steinberg map are stated against GS3, GS5 and GS7–GS8; the code
is a source of examples, not a specification.

## References

- M. Demazure, A. Grothendieck et al., *Schémas en groupes* (SGA 3), LNM 151–153 (1970);
  re-edition by P. Gille and P. Polo, Documents Mathématiques 7 and 8, SMF (2011): Exp. VI_A 3.2 and
  VI_B 3.9–3.10 (quotients over a field, identity component over a base); Exp. VIII §§1, 3
  (diagonalizable groups); Exp. IX 1.1, §§3–4 (multiplicative type, rigidity, density); Exp. X §1,
  1.6, 4.5, 5.16, 8.7 (classification, a non-isotrivial torus, quasi-isotriviality, isotriviality
  over connected geometrically unibranch bases, ranks);
  Exp. XI 4.2, §5 (Hom schemes, centralizers, normalizers); Exp. XII §1, 1.7, §7 and Exp. XIV §3
  (maximal tori and ranks); Exp. XV 4.2, 8.19; Exp. XIX 2.7, 6.1; Exp. XXII 1.13, 2.3, §5, 5.8.3;
  Exp. XXIII 4.1; Exp. XXIV 1.3; Exp. XXV 1.1 and Cor. 1.2.
- B. Conrad, *Reductive group schemes*, in *Autour des schémas en groupes* I, Panoramas et
  Synthèses 42–43, SMF (2014): Def. 3.1.1, Thm. 3.2.6, Thm. 3.3.4, Thm. 5.3.1, Thm. 6.1.16,
  Thm. 6.1.17, Exercise 6.5.2, Thm. 7.1.9, Appendix B (Lemma B.3.1).
- B. Conrad, *A modern proof of Chevalley's theorem on algebraic groups*, J. Ramanujan Math. Soc.
  17 (2002), 1–18, Thm. 1.1.
- M. Demazure, P. Gabriel, *Groupes algébriques* I, Masson (1970), III, §3, 5.4 and 8.2.
- R. Steinberg, *Regular elements of semisimple algebraic groups*, Publ. Math. IHÉS 25 (1965),
  49–80: Theorems 1.1, 1.3, 1.4, 1.5, 6.1, 7.1, 7.9 and 8.1, all for semisimple groups over an
  algebraically closed field, 1.4, 7.1, 7.9 and 8.1 for simply connected ones.
- A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique* IV, Publ. Math. IHÉS 24, 28,
  32 (1965–1967): 11.3.10 (fibrewise flatness), 17.9.5 (fibrewise isomorphism criterion).
- P. Slodowy, *Simple singularities and simple algebraic groups*, LNM 815 (1980), ch. 3–4.
- J. C. Jantzen, *Representations of algebraic groups*, 2nd ed., AMS (2003), I.5.8, II.1.8, II.2.1,
  II.2.6, II.4.4.
- N. Bourbaki, *Groupes et algèbres de Lie*, ch. VI, §3, no. 4, Thm. 1.
- V. L. Popov, *Picard groups of homogeneous spaces of linear algebraic groups and one-dimensional
  homogeneous vector bundles*, Math. USSR Izv. 8 (1974), 301–327, §4.
- J.-J. Sansuc, *Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de
  nombres*, J. reine angew. Math. 327 (1981), 12–80, §6.
