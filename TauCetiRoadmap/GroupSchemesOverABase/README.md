# Roadmap: group schemes over a base (multiplicative type, smooth and reductive group schemes)

**Summary.** This roadmap builds the relative theory of group schemes of SGA 3 that lies between
finite flat group schemes and abelian schemes: diagonalizable groups and groups of multiplicative
type over an arbitrary base scheme, their character sheaves, isotriviality and splitting, rigidity,
density of torsion and the representability of their Hom schemes; centralizers, normalizers and
maximal tori of smooth affine group schemes; the structure of a smooth connected group over a field
(Chevalley's theorem and the affinization) and the ranks it defines, as functions on the base of a
smooth group scheme, with their specialization inequalities; reductive group schemes over an
arbitrary base, their étale-local splitting, root data, the isomorphism and existence theorems,
automorphism schemes and forms; Borel subgroups, the scheme of Borel subgroups and its Picard group;
and the Steinberg map `G → T/W`, the regular locus, the Steinberg cross-section, the
Grothendieck–Springer space, the Picard groups of `G` and `G^reg`, and the theorem that the
Steinberg map has no simultaneous resolution without base change along `T → T/W`.

Tau Ceti already has the field theory (groups of multiplicative type, tori, reductive groups,
Borel subgroups and maximal tori over a field) and, over an affine base `Spec R`, the definitions of
a reductive Hopf algebra, a Borel subgroup, a split maximal torus and a pinning. Over a base it has
the definition of a group object and the finite locally free theory. This roadmap is the relative
theory that the [reductive-groups roadmap](../ReductiveGroups/README.md) names in its Layer 8 as
"relative theory over a base". Suggested home: `TauCeti/AlgebraicGeometry/GroupScheme/`, with
subdirectories `Diagonalizable/`, `MultiplicativeType/`, `MaximalTorus/`, `Rank/`, `Reductive/`,
`Borel/` and `Steinberg/`.

| Layer | Title | Headline targets |
| --- | --- | --- |
| GS0 | Carriers over a base | `baseChange`, `geometricFiber`, `identityComponent`, `hopfSpec` comparison |
| GS1 | Diagonalizable groups over a base | `diagonalizable`, `diagonalizableHomEquiv`, `smooth_rootsOfUnity_iff`, `exact_diagonalizable` |
| GS2 | Multiplicative type and tori | `IsMultiplicativeType`, `characterSheaf`, `multiplicativeTypeEquiv`, `IsTorus.isotrivial_of_normal`, `nodalCurve_not_isotrivial` |
| GS3 | Rigidity, density, Hom schemes, centralizers | `hom_eq_of_eq_fibre`, `torsion_schematicallyDense`, `homFunctor_representable`, `centralizer_smooth`, `normalizer_quotient_etale` |
| GS4 | Smooth groups over a field and their ranks | `quotient_exists`, `chevalley`, `affinization`, `rankInvariants` |
| GS5 | Smooth group schemes over a base | `maximalTorus_etaleLocally_iff`, `torusScheme_smooth`, `rank_specialization`, `affine_rank_semicontinuous` |
| GS6 | Reductive group schemes | `IsReductive`, `IsSplit`, `rootDatum`, `split_etaleLocally`, `isomorphism_theorem`, `existence_theorem`, `aut_exact`, `forms_equiv_H1` |
| GS7 | Borel subgroups and `Bor` | `borScheme`, `abstractTorus`, `weylGroupScheme`, `lineBundle`, `pic_flag`, `ample_iff` |
| GS8 | Steinberg map and Grothendieck–Springer | `steinbergMap`, `regularLocus`, `steinbergSection`, `grothendieckSpringer`, `pic_group`, `no_simultaneous_resolution` |

## Scope and boundaries

**Owned here.** Over a base scheme `S`: diagonalizable groups `D_S(M)` and groups of multiplicative
type of finite type over `S` (`M` finitely generated); tori; character and cocharacter sheaves;
isotriviality; Hom schemes out of multiplicative-type groups; centralizers and normalizers of
multiplicative-type subgroups; identity components over a base; maximal tori, Cartan subgroups and
the scheme of maximal tori; quotients of a group scheme of finite type over a field by a closed
subgroup; Chevalley's structure theorem and the affinization over a field for every smooth connected
group; the rank invariants of smooth group schemes over a base and their specialization
inequalities; reductive group schemes over any base, split groups, root data over a base, the
isomorphism and existence theorems over any base, automorphism schemes and forms; Borel subgroups
over a base, the scheme `Bor(G)`, the abstract torus and Weyl group scheme, the line bundles `𝓛(λ)`
on `Bor` and Picard groups of `Bor`, `G` and `G^reg`; the Steinberg map, the regular locus, the
Steinberg cross-section, the universal centralizer and the Grothendieck–Springer space.

**Owned elsewhere and consumed, never rebuilt.**

- [ReductiveGroups](../ReductiveGroups/README.md) owns affine algebraic groups over a field:
  Hopf algebras and functors of points (Layer 0), Lie algebras (Layer 2), subgroups, quotients and
  identity components of affine groups (Layer 3), multiplicative type and tori over a field
  (Layer 4), unipotent radicals (Layer 5), reductive and semisimple groups (Layer 6), the structure
  theory and root datum over a field (Layer 7), the classification over a field (Layer 8). Its
  "relative theory over a base" of Layer 8 is this roadmap; its pseudo-reductive groups are not.
- ChevalleyGroups (`TauCetiRoadmap/ChevalleyGroups/README.md`) owns the simply connected
  Chevalley–Demazure group schemes `G_sc(t)` over `ℤ`, their root subgroups, flatness and smoothness
  (its C4) and Chevalley's comparison theorem over `ℤ` (its C6). GS6 uses them as the split forms
  that every reductive group scheme is étale-locally isomorphic to.
- ReductiveGroupsPartII (`TauCetiRoadmap/ReductiveGroupsPartII/README.md`) owns smooth affine and
  reductive models over a discrete valuation ring, Bruhat–Tits and parahoric group schemes, Néron
  models of tori and Weil restriction of affine schemes (its RG2.0a, RG2.3). GS6 proves that its
  `SmoothModel.IsReductive` is `IsReductive` over a discrete valuation ring.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
  (`TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`) owns finite locally free
  group schemes, including finite ones of multiplicative type and their rigidity (its R07.1.4),
  `p`-divisible groups and Dieudonné theory. GS2 proves that a finite locally free group of
  multiplicative type in its sense is one here; nothing finite is redeveloped.
- NeronModelsAndSemistableAbelianVarieties
  (`TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`) owns Néron models and the
  Chevalley decomposition of the commutative identity fibre of a Néron model over a perfect field
  (its §2.3). GS4 proves Chevalley's theorem for every smooth connected group over a perfect field;
  that §2.3 is its commutative case.
- AbelianSchemesAndArithmeticModuli (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`)
  owns abelian schemes, their duals, rigidity, Albanese and Néron–Severi. GS4 and GS5 consume
  abelian varieties and abelian schemes from it and from Tau Ceti's
  `TauCeti.AlgebraicGeometry.AbelianVariety`.
- [ModularCurves](../ModularCurves/README.md) Layers 0B–0F own the convention `GrpObj (Over.mk f)`,
  finite locally free group schemes, affine quotients by finite locally free equivalence relations
  (0C), finite étale schemes and Galois sets (0D), effective fppf descent (0E) and Hom schemes along
  finite locally free maps (0F).
- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) owns group algebraic spaces
  (§1.13), torsors and their classes (§1.15), twisting (§1.16), quotient predicates and Artin's
  bootstrap (§1.17), first cohomology of sheaves of groups (§2.3), the sheaves `𝔾_a`, `𝔾_m`, `μ_n`
  on the big sites (§2.9), Hilbert 90 `H¹(X_ét, 𝔾_m) ≅ Pic(X)` (§2.11) and reflexive sheaves with
  Hartogs extension (§0.6). The Picard group of a scheme is Tau Ceti's
  `TauCeti.AlgebraicGeometry.LineBundleClass` (JacobianChallenge Layer A).
- The root-systems roadmap (`TauCetiRoadmap/RepresentationTheory/RootSystems`) owns Dynkin types,
  the weight lattice and Coxeter combinatorics of abstract root systems.

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
6. **Roots and Borel subgroups.** For a split maximal torus `T` of `G` and a Borel subgroup
   `B ⊇ T`, the positive roots `Φ⁺(B)` are the roots whose root spaces lie in `Lie(B)`, as in Tau
   Ceti's `SplitMaximalTorus.IsPositiveRoot`. The line bundle `𝓛(λ)` on `G/B` for
   `λ ∈ X*(T)` is the sheaf of functions `f` on the preimage of an open with
   `f(gb) = λ(b)⁻¹ f(g)` (Jantzen, I.5.8 and II.2.1). With this sign and `B` containing the
   positive root groups, `𝓛(-ϖ)` for `G = SL₂` is `O(1)` on `ℙ¹`: the ample cone is the strictly
   antidominant weights. Both signs are fixed here and every Picard statement below uses them.
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
- **GS0.4 Identity component over a base.** For `G` smooth and of finite presentation over `S`,
  the union of the identity components of the fibres is open in `G` and is an open subgroup scheme
  `G⁰`, smooth with connected fibres, compatible with base change (SGA 3, Exp. VI_B, 3.10).
  Over a field it agrees with Tau Ceti's identity component.

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
  `multiplicativeTypeCommHopfAlgProperty` and `torusCommHopfAlgProperty` (`_iff` lemmas), and a
  finite locally free group of multiplicative type of FiniteFlatGroups R07.1 satisfies
  `IsMultiplicativeType`.
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
- **GS2.5 Isotriviality.** `H` is *isotrivial* if it becomes diagonalizable after a finite étale
  surjective base change `S′ → S`, equivalently if `X*(H)` becomes constant on such an `S′`. Every
  group of multiplicative type of finite type over a locally noetherian normal scheme is
  isotrivial (SGA 3, Exp. X, 5.16).
- **GS2.6 A non-isotrivial torus.** Over the nodal cubic curve over a field, the rank-2 torus
  obtained by gluing `𝔾_m²` over the normalization along the two preimages of the node by the
  automorphism of `ℤ²` with matrix `[[1, 1], [0, 1]]` is a torus that is not isotrivial
  (SGA 3, Exp. X, §1). Prove that the gluing gives a torus and that no finite étale surjective
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
  `G(S) → G(S₀)` (SGA 3, Exp. IX, §3). For `G` of multiplicative type the lift is unique.
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
multiplicative type, not about subtori of a non-commutative group.

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
  perfect fields. The NeronModels §2.3 decomposition is this theorem for commutative `G`; prove
  `chevalley_comm` identifying the two.
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
multiplicative reduction (NeronModels §2.6) has `ρ_ab` dropping from `1` to `0` and `ρ_r`
rising from `0` to `1`, so `ρ_r` alone is not semicontinuous outside the affine case.

## Layer GS6: reductive group schemes

- **GS6.1 Definition.** `IsReductive G`: `G` is affine and smooth over `S`, and every geometric
  fibre is connected reductive (SGA 3, Exp. XIX, 2.7; Conrad, Def. 3.1.1). Prove
  `isReductive_hopfSpec_iff` against `reductiveCommHopfAlgPropertyOver` over `Spec R`, and against
  ReductiveGroupsPartII's `SmoothModel.IsReductive` over a discrete valuation ring. Semisimple and
  adjoint: fibres semisimple, resp. with trivial centre.
- **GS6.2 Maximal tori.** Prove that `ρ_r` is locally constant on `S` for reductive `G`, so `G` has a
  maximal torus étale-locally (GS5.2; SGA 3, Exp. XIX, 6.1), and `Z_G(T) = T` for every maximal
  torus `T`.
- **GS6.3 Roots and split groups.** For a maximal torus `T`, the adjoint action decomposes
  `Lie(G)` étale-locally into `Lie(T)` and rank-one root spaces. `IsSplit (G, T)`: `T` is split,
  each root is a constant character `α ∈ X*(T)`, and each root space is free of rank one
  (SGA 3, Exp. XXII, 1.13). Construct the root datum `rootDatum G T : RootDatum Φ X*(T) X_*(T)`
  with the coroots from the root subgroups `U_α ≅ 𝔾_a` and the rank-one subgroups `Z_G(ker α)`;
  over a field it agrees with ReductiveGroups Layer 7. Over a connected `Spec R`, a split pair with
  a choice of root vectors gives Tau Ceti's `Pinning`.
- **GS6.4 Étale-local splitting.** Every reductive group scheme is split étale-locally on `S`
  (SGA 3, Exp. XXII, 2.3). The root datum of `G_x` is locally constant in `x`: the *type* of `G`.
- **GS6.5 Isomorphism theorem.** For `S` nonempty and pinned split `(G, T, B, (X_α))`,
  `(G′, T′, B′, (X′_α))`, every isomorphism of based root data comes from a unique pinned
  isomorphism `G′ ≅ G`; more generally isogenies of root data induce central isogenies
  (SGA 3, Exp. XXIII, 4.1; Conrad, §6.1). Over `ℤ` for simply connected data this is
  ChevalleyGroups C6.
- **GS6.6 Existence theorem.** For every reduced root datum `R = (X, Φ, X^∨, Φ^∨)` there is a
  split reductive group scheme over `ℤ` with root datum `R`, hence over every `S` by base change
  (SGA 3, Exp. XXV, 1.1). Construct it as `(G_sc(t) × D(X/(X ∩ ℚΦ))) / K`, with `G_sc(t)` from
  ChevalleyGroups for the Dynkin type `t` of `Φ`, and `K` the finite diagonalizable central
  subgroup whose character group is the cokernel of the injection
  `X → P ⊕ X/(X ∩ ℚΦ)`, `x ↦ ((⟨x, α_i^∨⟩)_i, x mod ℚΦ)`; the quotient is the affine quotient of
  ModularCurves 0C. Prove its root datum is `R`. For split `G`, the central isogeny to the split
  group of the adjoint root datum has kernel the centre `Z(G)`, a closed subgroup of multiplicative
  type, and represents the fppf quotient `G/Z(G) = G^ad`; by GS6.4 and descent (ModularCurves 0E)
  the centre and `G^ad` exist for every reductive `G`.
- **GS6.7 Automorphisms and forms.** For split `G` pinned by `E`, `Aut_{S-gr}(G)` is represented
  by a smooth separated `S`-group, and `1 → G^ad → Aut(G) → Out(G) → 1` is exact with
  `Out(G)` the constant group of automorphisms of the based root datum, split by the pinning
  (SGA 3, Exp. XXIV, 1.3; Conrad, §7.1). Reductive `S`-groups étale-locally isomorphic to `G`
  correspond bijectively to `H¹_ét(S, Aut(G))` by twisting (SchemeAndStackFoundations §§1.15–1.16,
  2.3); quasi-split forms correspond to `H¹_ét(S, Out(G))`.

**Checks.** `GL_n`, `SL_n`, `PGL_n`, `Sp_{2n}` over `ℤ` and `𝔾_m^r` are reductive and split;
the kernel of the norm `R_{ℤ[i,1/2]/ℤ[1/2]} 𝔾_m → 𝔾_m` (ReductiveGroupsPartII RG2.0a) is a
non-split torus over `ℤ[1/2]`; the smooth
affine group `G^(p)` of GS5 is not reductive over `ℤ_p`, its special fibre being `𝔾_a`.

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
- **GS7.4 Line bundles.** For split `(G, T)` with `T ⊆ B` and `λ ∈ X*(T)`, `𝓛(λ)` on `G/B` as in
  Convention 6, `𝓛(λ + μ) ≅ 𝓛(λ) ⊗ 𝓛(μ)`, and `𝓛(χ|_T)` is trivial for `χ ∈ X*(G)`. Over a field,
  `H⁰(G/B, 𝓛(λ)) ≠ 0` iff `λ` is antidominant for `Φ⁺(B)`, and `𝓛(λ)` is ample iff
  `⟨λ, α^∨⟩ < 0` for every simple root `α` (Jantzen, II.2.6 and II.4.4, translated through
  Convention 6). Over `S`, `𝓛(λ)` is relatively ample iff it is ample on every fibre.
- **GS7.5 Picard groups over a field.** For `G` connected reductive over an algebraically closed
  field and `T ⊆ B`: `0 → X*(G) → X*(T) → Pic(G/B) → Pic(G) → 0` is exact, `Pic(G/B)` is free
  with basis the Schubert divisors `D_α` (`α` simple) and is identified with `P`, and
  `Pic(G) ≅ P / X*(T_der)` is finite, zero iff the derived group is simply connected
  (Popov 1974, §4; Sansuc 1981, §6). Here `X*(T) → Pic(G/B)` is `λ ↦ 𝓛(λ)`, and under the basis
  `O(D_α)` it is `λ ↦ (−⟨λ, α^∨⟩)_α`, with `D_α` the closure of `U⁻ s_α B/B`. For split `G` over
  any field the same holds.
- **GS7.6 Picard group of `Bor` over a base.** For `S` locally noetherian, normal and connected and
  `(G, T, B)` split, `Pic(S) ⊕ ℤ^Δ → Pic(G/B)`, `(M, (n_α)) ↦ π*M ⊗ O(Σ n_α D_α)`, is an
  isomorphism. Prove it from the big cell `U⁻ ≅ U⁻B/B ⊆ G/B`, an affine space over `S` whose
  Picard group is `Pic(S)` for normal `S`, whose complement is `⋃ D_α`, and the `D_α` as relative
  effective Cartier divisors. With GS7.4, `λ ↦ 𝓛(λ)` induces `X*(T)/X*(G) ≅ X*(T_der) ↪ P ≅ ℤ^Δ`.

**Checks.** For `SL₂`, `Bor = ℙ¹`, `𝓛(-ϖ) = O(1)`, `Pic(SL₂) = 0`; for `PGL₂`,
`Pic(PGL₂) = ℤ/2`; for `GL_n`, `Pic(G/B) ≅ ℤ^{n−1}` and `Pic(GL_n) = 0`.

## Layer GS8: the Steinberg map and the Grothendieck–Springer space

Here `(G, T)` is split reductive over `S` with derived group simply connected and `W` its Weyl
group.

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
- **GS8.4 Steinberg cross-section.** With a pinning and an ordering of the simple roots,
  `C = ∏ᵢ U_{αᵢ} nᵢ` with `nᵢ ∈ N_G(T)` lifting the simple reflections; `C ⊆ regularLocus G` and
  `steinbergMap|_C : C → T/W` is an isomorphism, so `steinbergSection : T/W → G^reg` is a section
  (Steinberg 1965, §§7–8, over an algebraically closed field; over a base by the fibrewise
  criterion, `C` and `T/W` being smooth over `S`). The action map `G × (T/W) → G^reg`,
  `(g, c) ↦ g σ(c) g⁻¹`, is smooth and surjective, and the universal centralizer
  `Z_G(σ) → T/W` is a smooth commutative group scheme.
- **GS8.5 Grothendieck–Springer.** `G̃ ⊆ G × Bor(G)` is the closed subscheme of pairs `(g, B)`
  with `g ∈ B`. It is smooth over `S`, `G̃ → Bor(G)` is a fibration with fibre `B`, and
  `π : G̃ → G` is projective. `G̃ → T` sends `(g, B)` to the image of `g` in `B/U ≅ T` (GS7.3). The
  square `G̃ → T → T/W`, `G̃ → G → T/W` commutes, `G̃ → G ×_{T/W} T` is projective and birational
  and an isomorphism over `G^reg`, and `G̃ → T` is smooth: `G̃` is a simultaneous resolution of
  `steinbergMap` after base change along `T → T/W` (Slodowy 1980, ch. 4).
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
`{±1}`; `C` is `{[[t, -1], [1, 0]]}`; `G̃ → G` is an isomorphism over `G^reg` and has fibre `ℙ¹`
over `±1`. For `GL_n`, `steinbergSection` is the companion-matrix section.

## Ordering

GS0 → GS1 → GS2 → GS3 is one lane. GS4 depends only on Tau Ceti's field theory and GS0, and runs in
parallel with GS1–GS3. GS5 needs GS3 and GS4. GS6 needs GS3, GS5.2 and ChevalleyGroups; GS7 needs
GS6; GS8 needs GS7. The harder material is GS5.3, GS6.5–GS6.6 and GS8.

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
  VI_B 3.10 (quotients over a field, identity component over a base); Exp. VIII §§1, 3
  (diagonalizable groups); Exp. IX 1.1, §§3–4 (multiplicative type, rigidity, density); Exp. X §1,
  4.5, 5.16, 8.7 (classification, quasi-isotriviality, isotriviality over normal bases, ranks);
  Exp. XI 4.2, §5 (Hom schemes, centralizers, normalizers); Exp. XII §1, 1.7, §7 and Exp. XIV §3
  (maximal tori and ranks); Exp. XV 4.2, 8.19; Exp. XIX 2.7, 6.1; Exp. XXII 1.13, 2.3, §5, 5.8.3;
  Exp. XXIII 4.1; Exp. XXIV 1.3; Exp. XXV 1.1.
- B. Conrad, *Reductive group schemes*, in *Autour des schémas en groupes* I, Panoramas et
  Synthèses 42–43, SMF (2014): Def. 3.1.1, §5.1, §6.1, §7.1, Appendix B.
- B. Conrad, *A modern proof of Chevalley's theorem on algebraic groups*, J. Ramanujan Math. Soc.
  17 (2002), 1–18, Thm. 1.1.
- M. Demazure, P. Gabriel, *Groupes algébriques* I, Masson (1970), III, §3, 5.4 and 8.2.
- R. Steinberg, *Regular elements of semisimple algebraic groups*, Publ. Math. IHÉS 25 (1965),
  49–80, §§6–8.
- P. Slodowy, *Simple singularities and simple algebraic groups*, LNM 815 (1980), ch. 3–4.
- J. C. Jantzen, *Representations of algebraic groups*, 2nd ed., AMS (2003), I.5.8, II.2.1, II.2.6,
  II.4.4.
- N. Bourbaki, *Groupes et algèbres de Lie*, ch. VI, §3, no. 4, Thm. 1.
- V. L. Popov, *Picard groups of homogeneous spaces of linear algebraic groups and one-dimensional
  homogeneous vector bundles*, Math. USSR Izv. 8 (1974), 301–327, §4.
- J.-J. Sansuc, *Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de
  nombres*, J. reine angew. Math. 327 (1981), 12–80, §6.
