# Roadmap: foundations of adic spaces, part IV — étale sites, families and dagger geometry

**Summary.** This roadmap carries the étale geometry of adic spaces to the settings in which
`p`-adic cohomology and families of modular forms are built. Layer R4 places the étale and corrected
pro-étale sites of AdicEtaleGeometry on locally noetherian analytic adic spaces, proves their
functoriality and slice descriptions there, compares the étale topos of a rigid analytic variety
with that of its adic space (Huber's Proposition 2.1.4) and of a scheme of finite type with that of
its analytification, and defines smooth pairs — a smooth adic space with a strict normal crossings
boundary — with the restriction of both sites to the boundary complement and the functors `j^{-1}`,
`j_*`, `j_!`. Layer R5 develops sousperfectoid rings and spaces (stability under rational
localisation, finite étale maps and Tate algebras, uniformity, sheafiness), proves that the product
of a perfectoid space with a smooth rigid space exists and is sousperfectoid with a tilde-limit
presentation (Birkbeck–Heuer–Williams, Corollaries 3.4–3.5), and builds the coefficient algebras and
sheaves `𝒪_X ⊗̂ R` of Chojecki–Hansen–Johansson with Tate acyclicity, localisation, coherence and
Kiehl's theorem, correcting two of their lemmas. Layer F1 is Grosse-Klönne's dagger geometry:
overconvergent power series, dagger algebras and their completions, weak completions and algebras of
Monsky–Washnitzer type, dagger spaces and their comparison with rigid spaces, and overconvergent de
Rham cohomology with supports and compact supports, ending with Serre and Poincaré duality,
finiteness for smooth quasi-compact dagger spaces (Theorem A), invariance on semistable tubes
(Theorem C), Künneth and the logarithmic complexes of smooth pairs.

| Layer | Title | What it builds |
|---|---|---|
| R4 | Étale and pro-étale sites | the sites of AdicEtaleGeometry A1 on locally noetherian analytic spaces, rigid and algebraic comparisons, smooth pairs, boundary complements |
| R5 | Families and sousperfectoid spaces | sousperfectoid rings and spaces, perfectoid × smooth, tilde-limits, coefficient algebras and sheaves |
| F1 | Dagger geometry and overconvergent de Rham complexes | dagger algebras and spaces, weak completions, de Rham cohomology with supports, duality, finiteness |

```text
AdicSpacesPartII R0–R1, AdicEtaleGeometry A1, SchemeAndStackFoundations SF.4 → R4
R4, AdicSpacesPartII R0, AdicSpacesPartIII F0/R2/R3, AdicEtaleGeometry A1 → R5
AdicSpacesPartII R0–R1, AdicSpacesPartIII R2/R3, R4, SchemeAndStackFoundations SF.0/SF.4 → F1
```

## Scope and ownership

R4 owns the application of AdicEtaleGeometry A1's étale and corrected pro-étale sites to locally
noetherian analytic adic spaces (functoriality of the pro-étale site, compatibility of Scholze's
point morphisms with pullback), Huber's rigid étale site and its comparison, the site morphism
`λ_X : X^ad_ét → X_ét`, smooth pairs with their intrinsic characterisation and analytification, and
the restriction of both sites to a boundary complement. The sites themselves, their base change,
slices, the projection `ν` and geometric points are A1's and are cited. R5 owns sousperfectoid rings
and spaces, perfectoid frames, the product of a perfectoid space with a smooth rigid space, the
intrinsic tilde-limit relation of adic spaces, the coefficient algebras of Chojecki–Hansen–Johansson
(profinite flat modules, small `ℤ_p`-algebras, mixed completed tensor products) and the coefficient
sheaves on affinoid rigid spaces. F1 owns overconvergent power series, dagger algebras, fringe
presentations, dagger tensor products and rational localisation, weak completions and algebras of
Monsky–Washnitzer type, affinoid dagger spaces, dagger spaces with coherent modules and strict
neighbourhoods, the dagger–rigid comparison, overconvergent differentials and de Rham complexes,
supports, compact supports and duality, finiteness, the logarithmic complexes of smooth dagger
pairs, and the Runge factorisation of locally closed immersions of affinoids ([BGR] 7.3.5/1).

AdicSpaces and AdicSpacesPartII own Huber pairs, adic spaces, completed tensor products, fibre
products, Huber's morphism classes, rigid spaces and analytification; AdicSpacesPartIII owns adic
rings, formal schemes, generic fibres, admissible blow-ups, coherent sheaves, Kiehl's theorems and
GAGA; AdicEtaleGeometry owns the perfectoid Tate-ring predicate, strongly sheafy rings, étale
morphisms by local description and the étale, pro-étale and finite étale sites; PerfectoidSpaces
owns perfectoid spaces, almost purity and tilting; SchemeAndStackFoundations owns excellent rings
(SF.0) and strict normal crossings divisors and de Jong's alteration theorem (SF.4). Derived étale
cohomology, comparison theorems and rigid cohomology belong to the étale-cohomology and
rigid-cohomology roadmaps that import this one.

## Conventions

1. Huber rings and pairs, morphisms of pairs, adic spectra and rational subsets are Tau Ceti's;
   complete includes Hausdorff; adic spaces are `TauCeti.AdicSpace` with AdicSpacesPartII's affinoid
   charts and morphism classes.
2. `K` is complete for a nontrivial rank-one nonarchimedean absolute value, `O_K = K°`, `ϖ` a
   pseudouniformiser, `Spa K = Spa(K, K°)`; `O_K` is noetherian only when `K` is discretely valued,
   and no statement assumes this unless it says so.
3. Étale morphisms of non-noetherian analytic spaces are Kedlaya–Liu's local description
   (AdicEtaleGeometry's `IsEtaleLocalDescription`); for locally noetherian targets this is Huber's
   notion.
4. Fibre products exist only under Huber's hypotheses or by an explicit theorem here; `|X ×_Z Y|`
   surjects onto the fibre product of point sets, not injectively.
5. Rigid spaces are Tate's; `X^an` is the rigid and `X^ad` the adic analytification, identified
   through Huber's functor `r`.
6. `|f| ≤ |g|^{a/b}` means `v(f^b) ≤ v(g^a)`.
7. Traces of finite projective modules are AdicSpacesPartIII's `LinearMap.projectiveTrace`, never
   sums over geometric points.
8. `Γ* = √|K^×|` is the divisible hull of the value group, `T_n(ρ) = K⟨ρ^{-1}X_1, …, ρ^{-1}X_n⟩`,
   `T_n = T_n(1)`, `W_n = K⟨X_1, …, X_n⟩†`; a dagger algebra `A` has completion `Â` and integral
   subring `A^int`.

## Exact supplier contracts

| Supplier | Exact file | Contract used |
|---|---|---|
| Mathlib `MvPowerSeries.IsRestricted`, `MvPowerSeries.IsRestricted.subring`, `MvPowerSeries.gaussNorm`, `MvPowerSeries.pderiv` | `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`, `GaussNorm.lean`, `Derivative.lean` | Restricted series at a polyradius, Gauss norms, partial derivatives. |
| Mathlib `KaehlerDifferential`, `Derivation`, `IsRegularRing`, `Algebra.Smooth`, `Algebra.Etale`, `RingHom.Etale`, `Module.FaithfullyFlat`, `AdicCompletion`, `IsAdicComplete`, `LocalizedModule` | `Mathlib/RingTheory/Kaehler/Basic.lean`, `Mathlib/RingTheory/Smooth/Basic.lean`, `Mathlib/RingTheory/Etale/Basic.lean`, `Mathlib/RingTheory/RingHom/Etale.lean`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`, `Mathlib/RingTheory/AdicCompletion/Basic.lean`, `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` | Differentials, regularity, smoothness and étaleness, faithful flatness, adic completions, localisation of modules. |
| Mathlib `AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.Functor.sheafPullback`, `CategoryTheory.Functor.IsDenseSubsite` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`, `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`, `Mathlib/AlgebraicGeometry/Sites/Etale.lean`, `Mathlib/CategoryTheory/Sites/Over.lean`, `Continuous.lean`, `Pullback.lean`, `DenseSubsite/Basic.lean` | Ideal sheaves, smooth schemes, the scheme étale site, slice sites, direct and inverse images, the comparison lemma. |
| Tau Ceti `Huber.IsHuberRing`, `Huber.IsTateRing`, `Huber.PairOfDefinition`, `Huber.IsPseudoUniformizer` | `TauCeti/RingTheory/Huber/Basic.lean:156,192,142,165` | Huber and Tate rings, pairs of definition, pseudouniformisers. |
| Tau Ceti `Huber.Pair`, `Huber.Pair.powerBounded`, `Huber.powerBoundedSubring`, `Huber.IsUniform`, `Huber.IsUniform.isReduced` | `TauCeti/RingTheory/Huber/Pair.lean:138,227`; `PowerBounded.lean:433`; `Uniform.lean:65,162` | Huber pairs, `A°`, uniformity and reducedness of uniform rings. |
| Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`, `Huber.weightedRestrictedSubring`, `Huber.IsStronglyNoetherian`, `Huber.IsTopologicallyFiniteType`, `Huber.IsStrictlyTopologicallyFiniteType` | `TauCeti/RingTheory/Huber/StronglyNoetherian.lean:253,135`; `WeightedRestrictedSeries/Basic.lean:709`; `TopologicallyFiniteType.lean:117,133` | Tate algebras `A⟨T⟩`, strong noetherianness, (strict) topological finite type. |
| Tau Ceti `Huber.PairOfDefinition.HasDenominatorPower`, `completedPlusSubring_le_powerBoundedSubring` | `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:300`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PresentationIndependence.lean:132` | Rational localisation data and its plus ring. |
| Tau Ceti `Huber.IsSheafyRing`, `Huber.IsStablySheafyRing`, `ValuationSpectrum.spa`, `ValuationSpectrum.rationalSubset`, `ValuationSpectrum.closedPolydisc`, `AdicSpace`, `PreAdicSpace.IsOpenImmersion` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/SheafyRing.lean:82,175`; `Spa/Basic.lean:101`; `RationalSubset/Basic.lean:142`; `Polydisc/Basic.lean:72`; `PreAdicSpace/Adic.lean:243`; `OpenImmersion.lean:61` | Sheafy rings, adic spectra, rational subsets, the polydisc, adic spaces and open immersions. |
| Tau Ceti `IsCompactModule`, `MvPowerSeries.IsRestricted.gaussNorm_mul`, `PowerSeries.IsDistinguished`, `PowerSeries.IsDistinguished.existsUnique_mul_add_eq`, `LinearMap.isStrictMap_of_module_finite` | `TauCeti/Topology/Algebra/Module/Compact.lean:294`; `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:241`; `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:122`; `Weierstrass/Division.lean:485`; `TauCeti/RingTheory/Huber/StrictMorphism.lean:60` | Compact modules, multiplicativity of Gauss norms, Weierstrass division at a fixed radius, strictness of finite maps. |
| AdicSpacesPartII `AdicSpace.Affinoid`, `Chart`, `Affinoid.IsInducedBy`, `IsAnalytic`, `IsAdic`, `LocallyOfWeaklyFiniteType`, `Smooth`, `Etale`, `Etale_affinoid`, `TateAlgebra.ofMvPolynomial`, `Huber.Affinoid.supNorm` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Affinoid charts, induced morphisms, Huber's morphism classes, the supremum seminorm; completed tensor products, fibre products, rigid spaces and analytification are its README targets, cited by label. |
| AdicSpacesPartIII `IsAdicRing`, `AdicRing.CompletedTensorProduct`, `LinearMap.projectiveTrace` | `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` | Adic rings, their completed tensor products, traces; formal schemes, generic fibres, coherent sheaves and Kiehl's theorems are its README targets. |
| AdicEtaleGeometry `PerfectoidInput.IsPerfectoidTateRing`, `Huber.IsStronglySheafy`, `Huber.ratLoc`, `AdicSpace.restrict`, `AdicSpace.FibreProduct`, `AdicSpace.IsEtaleLocalDescription`, `AdicSpace.IsLocallyNoetherianAnalytic`, `AdicSpace.GeometricPoint` | `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | The perfectoid predicate, strong sheafiness, completed rational localisation, open subspaces, fibre products, étale morphisms; the sites are its README targets. |

## How to read the build

`Suggested.lean` states the parts that are a few lines over the pinned carriers: strict normal
crossings charts of rings, of complete affinoid algebras and of smooth schemes (R4); perfectoid
frames, sousperfectoid rings and spaces, BHW's product, tilde-limits, profinite flat modules, small
`ℤ_p`-algebras and the integral mixed completed tensor product (R5); `W_n`, dagger algebras and
their completions, the integral Monsky–Washnitzer algebra, weak completions, algebras of MW-type and
the universally finite differentials with the dagger Poincaré lemma in low degree (F1). Everything
else — the sites, smooth pairs as global objects, the boundary-complement functors, coefficient
sheaves, dagger spaces and their cohomology — is stated here only. Each target is one paragraph: the
statement with hypotheses and source locator, the discriminating Checks, and a Lean note when a
declaration carries it.

## Layer R4: étale and pro-étale sites

R4 works on locally noetherian analytic adic spaces — among them `r(X)` for a rigid variety and
`X^ad` for a scheme locally of finite type over `K` — where AdicEtaleGeometry A1's sites apply with
Huber's étale morphisms. It builds no second site; derived functors and comparison theorems for
cohomology belong to the étale-cohomology roadmaps.

### R4.1 the étale site on the analytic carriers

**The étale site on locally noetherian analytic spaces.** (*etale-site-on-analytic-carriers*) For a
locally noetherian analytic adic space `X` (*locally-noetherian-adic-space*, AdicSpacesPartII R0),
`X_ét` is A1's small étale site (*etale-site*): adic spaces étale over `X` with jointly surjective
coverings; here étale in Huber's sense (*differentials-unramified-smooth-etale*; [Huber96] Def.
1.6.5) agrees with A1's local description (*etale-morphisms-local-description-and-comparison*,
through Huber's Lemma 2.2.8, *etale-local-open-finite-etale-factorisation*). Open subspaces are
objects and open covers are coverings; Huber's strongly surjective rigid coverings are not used
([Huber96] §2.1, p. 109; [KL15] §8.2, Def. 8.2.16, p. 162). For sousperfectoid carriers the site is
A1's local-description site (*sousperfectoid-etale-stability*). Checks: on the closed disc the
rational cover `{|T| ≤ |ϖ|}`, `{|ϖ| ≤ |T|}` is a covering; `T ↦ S²` is étale over `{|T| = 1}`
exactly when `2 ∈ K^×` (Jacobian `2S`; `K = ℚ_2` allowed) and nowhere in characteristic `2`, and
never at `T = 0`; for `X = ∅` the site has one object covered by the empty family.

### R4.2 functoriality and slices

**Base change defines a morphism of étale sites.** (*etale-site-functoriality*) For a morphism
`f : X → Y` of locally noetherian analytic spaces (automatically adic, *adic-morphism*), the
base-change functor `V ↦ V ×_Y X`, the site morphism `f_ét`, the direct image
`(f_*F)(V) = F(V ×_Y X)`, its left adjoint `f^{-1}` and `(g ∘ f)_* ≅ g_* f_*` are A1's
(*etale-site*); the fibre products exist and joint surjectivity is preserved by AdicSpacesPartII R0
(*fibre-products-existence*, *smooth-etale-base-change*, *fibre-product-points*; [Huber96] Cor.
1.2.3, p. 49). Checks: for the inclusion `j` of a rational subset, `j^{-1}F(W) = F(W)`; for
`f = r(φ)` this is Huber's rigid site morphism ([Huber96] (2.1.3), pp. 110–111).

**The étale site of an étale `X`-space is the slice.** (*etale-slice-site*) For `u : U → X` in
`X_ét` the equivalence `U_ét ≃ X_ét/U` identifying the étale topology of `U` with Mathlib's
`CategoryTheory.GrothendieckTopology.over`, under which `u^{-1}` is the `overPullback`, is A1's
*slice-site*, applied here using *etale-smooth-composition* and *etale-smooth-cancellation*
([Huber96] §2.1, p. 109). Checks: `U = X` gives the identity; `U = ∅` gives the one-object site; for
`U = X ⊔ X`, sheaves on `U_ét` are pairs of sheaves on `X_ét`.

### R4.3 the pro-étale site and ν

**The corrected pro-étale site and `ν`.** (*proetale-site-on-analytic-carriers*) For `X` locally
noetherian analytic (Scholze's standing hypothesis, [Scholze13] §3, before Def. 3.3, p. 13),
`X_proét` — pro-étale objects of `pro-(X_ét)` with the coverings of the erratum, factoring as a
transfinite composite of pullbacks of finite étale surjections followed by an étale map ([Scholze13]
Def. 3.9, p. 15; [Scholze-Err] item (1)) — and `ν_X : X_proét → X_ét` from the fully faithful
constant functor ([Scholze13] before Lem. 3.16, p. 19) are A1's (*pro-etale-site-corrected*,
*corrected-covers-pretopology*, *proetale-projection-nu*); [Scholze13] Prop. 3.7(i), Cor. 3.8 and
the deleted last sentence of Prop. 3.13 are not used. Checks: for `X = Spa(k, k°)` the
pro-finite-étale objects form the site of profinite `Gal(k^sep/k)`-sets with the corrected
coverings; an open surjection of profinite sets need not split ([RZ] Ex. 5.6.9); `X_proét` is not
Mathlib's `AlgebraicGeometry.Scheme.proetaleTopology`.

**Functoriality of the pro-étale site.** (*proetale-site-functoriality*) For any morphism
`f : X → Y` of locally noetherian analytic spaces, `f* : lim V_j ↦ lim (V_j ×_Y X)` is well defined
on pro-étale objects ([Scholze13] Lem. 3.10(i), p. 15), preserves finite limits and corrected
coverings, defines `f_proét : X_proét → Y_proét` with `ν_Y ∘ f_proét ≅ f_ét ∘ ν_X` (from
`c_X ∘ f* ≅ f* ∘ c_Y`) and `(g ∘ f)_proét ≅ g_proét ∘ f_proét` ([Scholze13] after Prop. 3.12, p.
18); `f*` of a cofiltered presentation is the levelwise base change with the same index category.
[Scholze13] Cor. 3.17(ii) needs qcqs `f` and is not asserted for boundary complements. Checks: the
identity gives the identity functor; for `L = ℚ_p(√p)` and `K_i = ℚ_p(p^{1/2^i})`,
`f*(lim Spa K_i) = (lim Spa K_i) ⊔ (lim Spa K_i)` (every `p`), matching [Scholze13] Prop. 3.15; over
`ℚ_2`, the self-pullback of `Spa ℚ_2(√2)` has two points.

**The pro-étale site of an étale object is the slice.** (*proetale-slice-open-subspace*) For
`U ∈ X_ét`, in particular an open `j : U → X`, the equivalence `U_proét ≃ X_proét/U` compatible with
`ν` and with *etale-slice-site* is A1's *proetale-slice* ([Scholze13] Lem. 3.10(iii), p. 15; Prop.
3.15, p. 19, for the pro-finite-étale model), applied here to boundary complements.

### R4.4 rigid comparison

**The étale topos of a rigid variety is that of its adic space.**
(*etale-site-and-rigid-comparison*) For a rigid analytic variety `X` over `k` (not necessarily
quasi-separated) with adic space `r(X)` (*rigid-adic-comparison-functor*), let `X_ét^rig` be the
rigid varieties étale over `X` (Huber's stalk criterion: flat local maps with `m_{f(y)} O_y = m_y`
and finite separable residue extensions, [Huber96] Def. 1.7.10(i), p. 89) with the strongly
surjective families as coverings. Then `r : X_ét^rig → r(X)_ét` induces an equivalence of topoi
`Sh(r(X)_ét) ≃ Sh(X_ét^rig)`, for sheaves of sets and of algebraic structures ([Huber96] Prop.
2.1.4, p. 111), proved through the dense subsites of quasi-separated objects with Mathlib's
`CategoryTheory.Functor.IsDenseSubsite`, using Huber's étale comparison
*rigid-adic-etale-comparison* ([Huber96] Prop. 1.7.11, p. 89); on affinoids `r(Sp A) = Spa(A, A°)`
with morphisms the maps of complete Huber pairs ([Huber96] (1.1.11), pp. 42–43). Checks: for
`X = Sp k` both topoi are continuous discrete `Gal(k^sep/k)`-sets (infinite disjoint unions
included); empty objects are covered by the empty sieve; the two-piece rational cover of the disc
generates a covering sieve on both sides; the origin `Sp K → Sp K⟨T⟩` and `T ↦ S²` at the origin are
not rigid-étale.

**Strongly surjective families are those with jointly surjective adic image.**
(*rigid-strongly-surjective-covers*) A family of étale maps `U_i → U` of rigid varieties over `X` is
strongly surjective (every quasi-compact admissible open of `U` is the union of the images of
finitely many quasi-compact admissible opens of the `U_i`) iff `r(U_i) → r(U)` is jointly surjective
on adic points ([Huber96] Def. 2.1.1 and Lem. 2.1.2, pp. 109–110), using that `r` commutes with
fibre products and matches quasi-compact admissible opens with quasi-compact opens. Checks: the
two-piece cover `{|T| ≤ |ϖ|}`, `{|ϖ| ≤ |T|}` is strongly surjective; over algebraically closed `k`
the discs `{|T − a| ≤ |ϖ|}`, `a ∈ k°`, cover every rigid point but not strongly, their adic images
missing the Gauss point; over `ℚ_p` they miss the rigid point `T = √p`, since
`|√p − a|² = |a² − p| ≥ p^{-1}` for all `a ∈ ℤ_p` (also `p = 2`); identity families are strongly
surjective, the empty family covers `Sp 0` and not `Sp K`.

### R4.5 analytification

**The site morphism `λ_X : X^ad_ét → X_ét`.** (*analytification-etale-site*) For `X` a scheme
locally of finite type over `k` with analytification `X^ad = X ×_{Spec k} Spa(k, k°)`
(*analytification-functor*, *scheme-fibre-product-analytification*), `X^ad` is locally noetherian
(and locally strongly sheafy) and `U ↦ U^ad = U ×_X X^ad` from Mathlib's
`AlgebraicGeometry.Scheme.smallEtaleTopology` to `X^ad_ét` is well defined (étale analytifies to
étale, [Huber96] Cor. 1.7.3(i), pp. 85–86; *analytification-etale-smooth*), preserves finite limits
(*analytification-fibre-products*) and jointly surjective families ([Huber94] Lem. 3.9(ii), p. 537;
*analytification-points*). It defines `λ_X`, natural in `X` (`λ_Y ∘ f^ad_ét ≅ f_ét ∘ λ_X`; [Huber96]
(0.7.11), p. 30, and (2.1.3), pp. 110–111). Checks: for `X = Spec k`, `λ` is an equivalence; for the
Kummer cover `t ↦ t^n` of `G_m` (`n ∈ k^×`) coverings stay coverings; for `X = 𝔸¹` the open unit
disc, the union of `|T|^{n+1} ≤ |ϖ|`, is an étale object outside the essential image (the condition
`|T| < 1` alone would add points of higher rank).

### R4.6 geometric points and pullback

**Pullback compatibility of Scholze's point morphisms.** (*geometric-points-pullback*) Geometric
points `Spa(C, C⁺) → X` of any rank, fibre functors, stalks, the splitting of étale covers of
`Spa(C, C⁺)` and `(f^{-1}G)_ξ ≅ G_{f∘ξ}` are A1's (*etale-site-and-geometric-points*,
*geometric-point-etale-split*; [Huber96] §2.5, Defs. 2.5.1, 2.5.3, Lem. 2.5.4, pp. 130–131). For
`x ∈ X`, a completed algebraic closure `C_x` of `k(x)^` with a valuation extending `x`, and the
decomposition group `D_x`, A1's point morphism `i_x : Sh(D_x-pfsets) → Sh(X_proét)`
(*proetale-fibre-morphism-of-topoi*) satisfies, for `f : X → Z` locally noetherian analytic and
compatible choices with restriction `g_D : D_x → D_{f(x)}`, the natural isomorphism
`i_x^{-1} ∘ f_proét^{-1} ≅ g_D^{-1} ∘ i_{f(x)}^{-1}`, for points of arbitrary rank, where
restriction along `g_D` is continuous for A1's corrected action site ([Scholze13] Def. 3.4, p. 13,
Prop. 3.13, first sentence, pp. 18–19, with [Scholze-Err] items (1)–(2)); for henselian `k(x)^+`,
`D_x = G_x`. Stalks at geometric points are not conservative on `X_proét` ([Scholze13] Rem. 3.14, p.
19); enough points exist abstractly by Deligne's theorem for qcqs `X` ([Scholze13] Prop. 3.12, p.
18). Checks: the identity gives `id : D_x → D_x`; a finite separable `L/K` restricts along
`G_L → G_K`; over `ℚ((t))` with the composite of the `t`-adic and residual 5-adic valuations,
conjugation `i ↦ −i` moves the integral element `(i − 2)/5` (with `i ≡ 2 mod 5`) to a non-integral
one, so `D_x ≠ G_x`; the countable coproduct of the terminal object over an algebraically closed
point has discrete, non-compact geometric fibre `ℕ`, the two-sheeted split object a fibre of two
points.

### R4.7 smooth pairs

**Smooth pairs.** (*smooth-pair*) A smooth pair over `K` is `(X, D)` with `X` smooth over `Spa K`
(*smooth-morphism*; hence locally noetherian analytic) and `D` a closed adic subspace given by stalk
ideals `I_{D,x} ⊆ 𝒪_{X,x}` (*closed-adic-subspaces-and-embeddings*) such that every point has a
strict normal crossings chart: an affinoid open `V ∋ x` and an étale `h : V → B^n_K` to the closed
polydisc (Tau Ceti `ValuationSpectrum.closedPolydisc`) with `I_D|_V = h^*(T_1 ⋯ T_r)` on every
stalk, as ideals (no radical taken); `r = 0` means `D ∩ V = ∅` and `r` may vary. The boundary
complement is the open `U = X ∖ D` (the unit-ideal locus) with its open immersion `j`, étale by
*open-embedding-etale*. "Strict" means charts on an open cover over `K`; Diao–Lan–Liu–Zhu's normal
crossings divisors (charts étale-locally, [DLLZ-A] §2.3, Ex. 2.3.17, pp. 16–17; [DLLZ-RH] §2.1, Ex.
2.1.2, p. 10) form a weaker class, also after finite extension of `K`. Prove: `I_D` is locally
generated by one non-zero-divisor and is radical; restriction to opens and pullback along étale maps
give smooth pairs with complements the preimages of `U` (ideals extended along stalk maps, [Huber96]
Prop. 1.6.7, p. 79); every smooth pair is a DLLZ normal crossings pair; and the intrinsic form: a
chart exists at `x` iff there are `x_1, …, x_n ∈ 𝒪(V)` with `dx_i` a basis of `Ω¹_{V/K}`
(*smooth-differentials-locally-free*, *smooth-local-structure*) and `I_D|_V = (x_1 ⋯ x_r)`, the
`x_i` (`i ≤ r`) then being part of a regular system of parameters ([Huber96] Prop. 1.6.9(iii), p.
79, Cor. 1.6.10, p. 80). Checks: the model `(B^n_K, V(T_1 ⋯ T_r))` with the identity chart, whose
complement is the locus where every `T_i` (`i ≤ r`) has nonzero valuation; `(X, ∅)` for `X` smooth;
`(B¹, V(T))` has complement `{0 < |T| ≤ 1}`, the increasing union of `{|ϖⁿ| ≤ |T|}`, not
quasi-compact, so `j` is not quasi-compact ([Conrad-AWS] Ex. 2.4.8, pp. 21–22); `D = X` forces
`X = ∅`; three concurrent lines `V(T_1 T_2 (T_1 − T_2))` in `B²` admit no chart at the origin in
every characteristic; over `ℚ_p` (every `p`) `V(T_1² − p T_2²)` is DLLZ (over `ℚ_p(√p)` the
coordinates `T_1 ∓ √p T_2` have Jacobian `2√p`) but not a smooth pair, the germ being irreducible;
for `2 ∈ K^×` and `X = B² × {|S| = 1}`, `D = V(T_1² − S T_2²)` becomes `V(xy)` after the Kummer
cover `S = S'²` (coordinates `T_1 ∓ S'T_2`, `S'`, Jacobian `2S'`), but no finite extension of `K`
gives a chart at the point above the Gauss point, since `S̄` is not a square in `K̃'(S̄)` ([Huber96]
Prop. 1.7.1, pp. 80–81); the doubled origin `(T²)` in `B¹` admits no chart.

**Strict normal crossings charts of rings and affinoids.** (Local form of *smooth-pair*.) For a
field `K` and a `K`-algebra `σ : K → R`, an algebraic chart of an ideal `I ⊆ R` is `r ≤ n` and an
étale `coord : K[T_1, …, T_n] → R` over `K` with `I = (coord(T_1 ⋯ T_r))`; its generator is a
non-zero-divisor and `I` is radical, also for `R = 0` (flatness, and étaleness over the reduced
`K[T]/(T_1 ⋯ T_r)`). For complete `K`, an affinoid chart of `I ⊆ A`, `(A, A⁺)` a complete Huber pair
over `K`, is a morphism of Huber pairs `(K⟨T⟩, K⟨T⟩°) → (A, A⁺)` over `K`, topologically of finite
type and étale in Huber's lifting sense, with `I = (h(T_1 ⋯ T_r))`; again the generator is a
non-zero-divisor and `I` radical, and `v ∈ Spa(A, A⁺)` lies off the boundary iff no `h(T_i)`,
`i ≤ r`, is in its support ([Huber96] §1.1, pp. 38–39). Checks: `n = r = 0` gives generator `1` and
ideal `⊤`; `n = r = 2` gives `T_1T_2`; the zero ideal of a nonzero ring has no chart; three
concurrent lines have no chart on any `D(g)` with `g(0) ≠ 0`, in every characteristic; `V(T^p − a)`
over a field of characteristic `p` is a regular prime divisor without a chart near any of its points
([EGA IV₄] Cor. 17.11.3, p. 84); after `S = S'²` the ideal `(T_1² − S'²T_2²)` has a chart on `D(S')`
iff `2 ≠ 0` (determinant `2S'` of `(u − sv, u + sv)`), and in characteristic `2` it is a doubled
line; `(T²) ⊆ K⟨T⟩` has no affinoid chart. Lean: `SmoothPair.AlgebraicChart`,
`SmoothPair.modelAlgebraicChart`, `SmoothPair.AlgebraicChart.isCartier`, `SmoothPair.AffinoidChart`,
`SmoothPair.AffinoidChart.isCartier`, `SmoothPair.AffinoidChart.mem_complement_iff`; the global
smooth pair is README only.

**Analytification of an algebraic strict normal crossings pair.** (*analytification-of-smooth-pair*)
An algebraic smooth pair over a field `K` is a smooth `K`-scheme `X` with an ideal sheaf `D` having
an algebraic chart on an affine open neighbourhood of every point (relative to `K`: over an
imperfect field regular strata are not enough, as `V(T^p − t)` over `𝔽_p(t)` shows;
SchemeAndStackFoundations SF.4's *strict-normal-crossings* is used with this relative smoothness).
For complete `K`, `(X^ad, D^ad)` is a smooth pair, `(X ∖ D)^ad = X^ad ∖ D^ad` with `j^ad` the
boundary inclusion, and the identification of `X^ad` is over `Spa K` through Part II's
analytification ([Huber96] Cor. 1.7.3, pp. 85–86; [DLLZ-A] §4.6, proof of Lem. 4.6.2, p. 69): the
analytified chart lands in `𝔸^{n,ad}_K` (*analytic-affine-space*), and on `{|x_i| ≤ |ϖ|^{-m}}` the
rescaled `(ϖ^m x_1, …, ϖ^m x_n)` is an étale chart to `B^n_K` pulling `T_1 ⋯ T_r` back to a unit
times `x_1 ⋯ x_r`. Checks: every smooth `X` with `D = ⊤` is a pair; `D = ⊥` forces `X = ∅`, and on
an empty `X` both coincide; `Spec K[T]` with `(T)` analytifies to `(𝔸^{1,ad}, {0})` with complement
`G_m^ad`, restricting on `B¹` to the model pair; `Spec K[T_1, T_2]` with `(T_1 T_2)` gives `G_m²`; a
smooth toroidal compactification of a Shimura variety with relative SNC boundary analytifies to a
smooth pair. Lean: `SmoothPair.AlgebraicSmoothPair`; the analytification is README only.

### R4.8 restriction to the boundary complement

**Restriction of the étale and pro-étale sites to the boundary complement.**
(*boundary-complement-restriction*) For a smooth pair `(X, D)` with complement `j : U → X`: (a) `U`
is an object of `X_ét` and `U_ét ≃ X_ét/U` (*etale-slice-site*), under which `j_ét` is the slice
morphism; (b) with `φ : X_ét/U → X_ét` the forgetful functor, `j^{-1}F = F|_U` is restriction
(`overPullback`), `j_*G(W) = G(W ×_X U)` is `φ.sheafPushforwardCocontinuous`, and for sheaves with a
zero object `j_!` is the sheafified extension by zero `φ.sheafPullback`, with adjunctions
`j_! ⊣ j^{-1} ⊣ j_*` (Mathlib's `sheafAdjunctionContinuous`, `sheafAdjunctionCocontinuous`; the
cocontinuous pushforward is `j_*`, not `j_!`) and `j^{-1} j_* ≅ id ≅ j^{-1} j_!` (`j` a
monomorphism), for sheaves of sets and abelian groups; (c) `U_proét ≃ X_proét/U`
(*proetale-slice-open-subspace*) with `ν_X ∘ j_proét ≅ j_ét ∘ ν_U`, from the constant embedding and
without quasi-compactness of `j` ([DLLZ-A] §2.3, Ex. 2.3.16, p. 16; [Scholze13] Prop. 3.15, p. 19;
[Huber96] §2.1, p. 109). The smooth pair is locally noetherian analytic by smoothness ([Huber96]
Cor. 1.6.10, p. 80), so no further hypothesis is needed for its pro-étale site; derived functors of
`j_!`, `j_*` belong to the étale-cohomology roadmaps. Checks: for `D = ∅` all three functors are the
identity; `U = ∅` occurs only for `X = ∅`, where `Sh(∅_ét)` is terminal; for `(B¹, V(T))` and `Z/n`,
`n ≥ 2`, `H^0(X, j_!Z/n) = 0` and `H^0(X, j_*Z/n) = Z/n` (the origin is in the closure of the
connected `U`); `j` is not quasi-compact, so [Scholze13] Cor. 3.17(ii) does not apply; the annuli
`{|ϖⁿ| ≤ |T|}` cover the punctured disc in both its own site and the slice while no finite subfamily
does.

### Examples

The worked examples are those recorded at the targets: the squaring map `T ↦ S²` over the annulus
and its characteristic-`2` failure; the two-piece cover of the disc against the discs
`{|T − a| ≤ |ϖ|}` missing the Gauss point or the rigid point `√p`; `Spec k` and `G_m` under `λ`; the
quadratic extension `ℚ_2(√2)` under pro-étale base change; the rank-two decomposition group over
`ℚ((t))`; the model pairs, the punctured disc and the non-pairs given by three lines, conjugate
lines over `ℚ_p`, the Gauss-point Kummer example and the doubled origin; and `j_!`, `j_*` of a
constant sheaf on the punctured disc.

### Dependencies

AdicSpacesPartII R0–R1 (locally noetherian analytic spaces, fibre products and their points, étale,
smooth and unramified morphisms with composition, cancellation, base change, local structure,
*etale-flat-unramified* and *smooth-morphism-open*, closed adic subspaces, rigid spaces, `r`,
analytification); AdicEtaleGeometry A1 (the étale and corrected pro-étale sites with base change,
slices and `ν`, local-description étale morphisms, geometric points and point morphisms);
SchemeAndStackFoundations SF.4 (*strict-normal-crossings*); Mathlib's sites, sheaves, adjunctions,
ideal sheaves and the scheme étale site; Tau Ceti `ValuationSpectrum.closedPolydisc`.

## Layer R5: families and sousperfectoid spaces

R5 defines sousperfectoid Tate rings through perfectoid frames and proves the class stable under
rational localisation, finite étale extension and descent, Tate and Laurent algebras; sousperfectoid
pairs are stably uniform, sheafy and strongly sheafy. It defines sousperfectoid adic spaces, proves
étale stability, the stable basis and étale base change along them, constructs the product of a
perfectoid space with a smooth rigid space with its tilde-limit presentation, and builds the
coefficient algebras and sheaves of Chojecki–Hansen–Johansson. The perfectoid predicate throughout
is AdicEtaleGeometry's `PerfectoidInput.IsPerfectoidTateRing` (complete, Hausdorff, uniform, Tate, a
pseudouniformiser with `ϖ^p ∣ p` in `A°`, Frobenius surjective on `A°/p`).

### R5.1 sousperfectoid rings

**Sousperfectoid Tate rings and perfectoid frames.** (*sousperfectoid-ring*) Fix a prime `p`. A
perfectoid frame of a topological ring `R` is `(R̃, ι, σ)` with `R̃` a perfectoid Tate ring for `p`,
`ι : R → R̃` a continuous ring map and `σ : R̃ → R` continuous, additive and `R`-linear through `ι`
with `σ ∘ ι = id_R`; `σ` need not be multiplicative nor respect plus rings, and no base field is
fixed. `R` is sousperfectoid if it is a Tate ring with a frame; a Huber pair is sousperfectoid if
its ring is ([HK] §7, Def. 7.1, p. 25; [Berkeley] Def. 6.3.1, p. 47; [BHW] Def. 3.2(1), p. 1724).
Completeness, the Hausdorff property and topological nilpotence of `p` are consequences: `ι` is a
homeomorphism onto the closed subring `ker(id − ι ∘ σ)` (Mathlib
`Function.LeftInverse.isClosedEmbedding`). Prove: perfectoid Tate rings are sousperfectoid with the
identity frame ([Berkeley] Ex. 6.3.2(1)); `R° = ι^{-1}(R̃°)`; sousperfectoid rings are uniform and
reduced (*sousperfectoid-uniform*); the property is invariant under isomorphisms of topological
rings. Checks: `ℚ_p⟨T⟩` is sousperfectoid with frame `ℚ_p^cycl⟨T^{1/p^∞}⟩` but not perfectoid
(Frobenius on `𝔽_p[T]` misses `T`; [Berkeley] Ex. 6.3.2(2)); `ℚ_p⟨X⟩[Q]/(Q²)` is strongly noetherian
and sheafy but not sousperfectoid (not reduced); the zero ring is perfectoid, hence sousperfectoid;
the uncompleted `ℚ_p(ζ_{p^∞})` has no frame; `σ ∘ ι = id` while `ι ∘ σ` is only an idempotent (for
`ℚ_p → ℚ_p^cycl` with Tate's normalised trace, `ι(σ(ζ_{p²})) = 0`; for the diagonal `R → R × R` with
first projection, `ι(σ(1, 0)) = (1, 1)`), and over `R = 0` both composites are identities; in
characteristic `p`, for uniform `A` with finite Frobenius, sousperfectoid means Frobenius splits
`A`-linearly ([HK] Lem. 7.10), so `𝔽_p((t))⟨T⟩` is sousperfectoid. Lean: `Huber.PerfectoidFrame`,
`Huber.PerfectoidFrame.refl`, `Huber.IsSousperfectoid`,
`Huber.IsSousperfectoid.of_isPerfectoidTateRing`,
`Huber.PerfectoidFrame.powerBoundedSubring_eq_comap`, `Huber.IsSousperfectoid.isUniform`,
`Huber.IsSousperfectoid.isReduced`.

### R5.2 stability of the class

**Base change of a frame.** For a frame `(R̃, ι, σ)` of a Tate ring `R` and a continuous map `R → S`
to a complete Tate ring for which the completed tensor product `R̃ ⊗̂_R S` (AdicSpacesPartII R0,
*completed-tensor-product*) is perfectoid, `(R̃ ⊗̂_R S, s ↦ 1 ⊗ s, σ ⊗̂ id)` is a frame of `S`, the
retraction being `x ⊗ s ↦ σ(x)s` on pure tensors ([HK] Rem. 7.2, p. 25); the continuous splitting of
the completed base change is AdicSpacesPartIII R3.5 (*split-injection-completed-base-change*).
Completeness and Hausdorffness of `S` are needed. Checks: `σ_S(x ⊗ 0) = 0`, `σ_S(x ⊗ 1) = σ(x)`,
`σ_S(x ⊗ s + y ⊗ t) = σ(x)s + σ(y)t`.

**Sousperfectoid rings are uniform.** (*sousperfectoid-uniform*) For a sousperfectoid `R` with frame
`(R̃, ι, σ)`, `R° = ι^{-1}(R̃°)` is bounded, so `R` is uniform ([HK] §2, Def. 2.3, p. 3) and, being
Hausdorff Tate, reduced (Tau Ceti `Huber.IsUniform.isReduced`). Checks: `ℚ_p⟨T⟩° = ℤ_p⟨T⟩` is
bounded; `ℚ_p⟨X⟩[Q]/(Q²)` has the unbounded `ℤ_p⟨X⟩ + ℚ_p⟨X⟩Q`. Lean:
`Huber.IsSousperfectoid.isUniform`.

**Rational localisations.** (*sousperfectoid-rational-localisation*) For complete sousperfectoid `R`
and a rational subset `R(T/s)` (`T` finite generating an open ideal), the completed rational
localisation `R⟨T/s⟩` (AdicEtaleGeometry's `Huber.ratLoc`) is sousperfectoid: with a ring of
integral elements of `R̃` containing `ι(R⁺)`, the preimage is `R(ι(T)/ι(s))`, `R̃⟨ι(T)/ι(s)⟩` is
perfectoid ([Berkeley] Thm. 6.2.6, p. 45; [HK] Prop. 3.8, p. 8) and is the base-changed frame
([Berkeley] Prop. 6.3.3(1), p. 47, and its proof, p. 48). Checks: `ℚ_p⟨T^{±1}⟩` with frame
`ℚ_p^cycl⟨T^{±1/p^∞}⟩`; for perfectoid `R` the identity frame. Lean:
`Huber.isSousperfectoid_ratLoc`.

**Finite étale algebras.** (*sousperfectoid-finite-etale*) A finite étale algebra `S` over a
complete sousperfectoid `R`, with its natural topology and plus ring the integral closure of `R⁺`
(AdicEtaleGeometry *finite-etale-affinoid-algebra*), is a complete sousperfectoid Tate ring, with
frame `S → R̃ ⊗_R S` split by `σ ⊗ id` ([Berkeley] Prop. 6.3.3(2), p. 47, through almost purity,
Thm. 7.4.5(1), p. 53; [HK] Lem. 7.5(a), p. 25; [HK] Prop. 2.15(a), p. 5). Checks: `ℚ_p(ζ_p)` with
frame `(ℚ_p^cycl)^{p−1}`; `ℚ_p⟨T^{±1}⟩[T^{1/n}]` for `p ∤ n`. Lean:
`Huber.IsSousperfectoid.finiteEtale`.

**Descent along faithfully flat finite étale maps.** (*sousperfectoid-finite-etale-descent*) If
`R → S` is finite étale and faithfully flat, `R` complete Tate and `S` sousperfectoid, then `R` is
sousperfectoid: compose a frame of `S` with an `R`-linear retraction of `R → S` ([HK] Lem. 7.5(b),
pp. 25–26); in particular for finite Galois covers. Faithful flatness is needed: the projection
`ℚ_p × ℚ_p⟨X⟩[Q]/(Q²) → ℚ_p` is finite étale with sousperfectoid target and non-reduced source.
Lean: `Huber.IsSousperfectoid.of_finiteEtale`.

**Tate algebras.** (*sousperfectoid-rings*) For sousperfectoid `R` and `n ≥ 0`, `R⟨T_1, …, T_n⟩`
(Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`) is sousperfectoid, with frame `R̃⟨T^{1/p^∞}⟩`,
`ι` coefficientwise and `σ` applying `σ` to the coefficients of integral exponents and discarding
the others ([Berkeley] Prop. 6.3.3(3), p. 47; [HK] Lem. 7.3, p. 25). Checks: `n = 0` is trivial;
`L⟨T⟩` for a perfectoid field `L` is the polydisc factor of [BHW] Cor. 3.4; iterating, relative
polydiscs over sousperfectoid spaces are sousperfectoid. Lean:
`Huber.IsSousperfectoid.restrictedMvPowerSeries`.

**Laurent algebras and annuli.** (*sousperfectoid-annulus*) For sousperfectoid `R` with
pseudouniformiser `ϖ` and integers `a ≤ b`, `R⟨T^{±1}⟩` and the annulus ring
`R⟨T/ϖ^a, ϖ^b/T⟩ = 𝒪(W)`, `W = {|ϖ^b| ≤ |T| ≤ |ϖ^a|} = R({ϖ^{b−a}}/S) ⊆ Spa R⟨S⟩` with `T = ϖ^a S`,
are sousperfectoid ([HK] Lem. 7.3, p. 25). Checks: for `ℚ_p`, `ϖ = p`, `(a, b) = (0, 1)` the annulus
is `{|p| ≤ |T| ≤ 1}` with ring `ℚ_p⟨T, p/T⟩`; for `(1, 0)` it is empty, which is why `a ≤ b` pins
the identification with `R({ϖ^{b−a}}/S)`; over a perfectoid field the closed annulus is
sousperfectoid, not perfectoid.

**Finite extensions of `ℚ_p`.** (*sousperfectoid-p-adic-field*) A finite extension `K` of `ℚ_p` is
sousperfectoid: `K → K^cycl` has a continuous `K`-linear retraction (`K` is discretely valued, hence
spherically complete; equivalently Tate's normalised trace), so `(K^cycl, incl, retraction)` is a
frame; hence `K⟨T⟩`, its rational localisations and their finite étale algebras are sousperfectoid
([HK] Rem. 7.8, p. 26; [Berkeley] Ex. 6.3.2(2), p. 47). No "every complete field" is claimed. `K` is
not perfectoid: with `p = uπ^e`, for `e < p` no `ϖ` has `ϖ^p ∣ p`, and for `e ≥ p` Frobenius on
`𝒪_K/p` misses `π`. Checks: for `ℚ_p` the divisibility fails; for `π^p = p` the divisibility holds
and Frobenius fails. Lean: `Huber.IsSousperfectoid.of_finite_padic`.

### R5.3 stable uniformity and sheafiness

**Sousperfectoid pairs are stably uniform.** (*sousperfectoid-stably-uniform*) For `(R, R⁺)` with
`R` complete sousperfectoid, every `𝒪(U) = R⟨T/s⟩` is uniform ([Berkeley] Prop. 6.3.4, p. 48; [HK]
Def. 3.13), by the splitting criterion *stably-uniform-sheafy* (AdicSpacesPartIII R3; [KL15] Rem.
2.8.12) applied to the frame. Checks: every `ℚ_p⟨T⟩⟨f/g⟩` is reduced and uniform ([BHW] Prop. 3.3).
Lean: `Huber.isUniform_ratLoc`.

**Sousperfectoid pairs are sheafy, strongly sheafy and `𝒪`-acyclic.** (*sousperfectoid-sheafy*) For
`R` complete sousperfectoid and any ring of integral elements, `(R, R⁺)` is sheafy,
`H^i(Spa(R, R⁺), 𝒪) = 0` for `i > 0`, and every `R⟨T_1, …, T_n⟩` is sheafy (AdicEtaleGeometry
`Huber.IsStronglySheafy`) ([BHW] §3.1, Prop. 3.3, p. 1724; [HK] Cor. 7.4, p. 25; [HK] Prop. 3.14, p.
9). Checks: `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is sheafy without noetherianity; for nonzero perfectoid `S`,
`Spa(S⟨T⟩, S⁺⟨T⟩)` is sheafy though `S⟨T⟩` is not perfectoid. Lean:
`Huber.IsSousperfectoid.isSheafyRing`; the acyclicity is README only.

### R5.4 sousperfectoid spaces

**Sousperfectoid adic spaces.** (*sousperfectoid-adic-space*) An adic space is sousperfectoid if
every point has an affinoid chart `Spa(R, R⁺)` with `R` sousperfectoid ([BHW] Def. 3.2(3), p. 1724;
[Berkeley] §19.5, p. 179); no base is fixed. Prove: `Spa(R, R⁺)` is sousperfectoid for
sousperfectoid `R`; perfectoid spaces are sousperfectoid; open subspaces are; the sousperfectoid
affinoid opens form a basis; every point is analytic; `𝒪_X(U)` is reduced for every open `U`;
relative polydiscs `𝔹^n_X = X ×_{Spa ℤ_p} Spa ℤ_p⟨T⟩` exist and are locally `Spa R⟨T⟩` (the
finite-type construction of *fibre-product-along-finite-type* with weight `{1}`). Checks: the closed
disc over `ℚ_p`, the empty space and `Spa(ℚ_p, ℤ_p)` are sousperfectoid; `Spa(ℚ_p⟨X⟩[Q]/(Q²))` is an
adic space and not sousperfectoid (a nonzero nilpotent section); a smooth rigid space over a
perfectoid field, such as `𝔹¹_L`, is sousperfectoid and not perfectoid. Lean:
`AdicSpace.IsSousperfectoid`, `AdicSpace.IsSousperfectoid.spa`,
`AdicSpace.IsSousperfectoid.isAnalytic`.

**Étale spaces over sousperfectoid spaces.** (*sousperfectoid-etale-stability*) If `X` is
sousperfectoid and `f : Y → X` is étale in Kedlaya–Liu's sense (AdicEtaleGeometry
`IsEtaleLocalDescription`; [KL15] Def. 8.2.16, p. 162), then `Y` is an adic space and sousperfectoid
([Berkeley] §19.5, p. 179; [BHW] proof of Cor. 3.4, p. 1725). For composites of rational
localisations and finite étale maps the ring itself is sousperfectoid; for general étale maps only
the space is, the ring property not being known to be local ([KL15] Rem. 8.2.18; [HK] Def. 5.1, p.
14). Lean: `AdicSpace.IsSousperfectoid.of_etale`.

**Sousperfectoid affinoids are stably adic.** (*sousperfectoid-stably-adic*) For `X = Spa(R, R⁺)`
with `R` sousperfectoid, let `B_X` be the étale objects generated from the identity by rational
embeddings, finite étale maps (plus rings integral closures) and isomorphisms. Every ring in `B_X`
is sousperfectoid; `B_X` consists of affinoids, covers every étale object by open immersions and is
closed under fibre products over `X`, so it is a stable basis ([KL15] Def. 8.2.19, p. 163; [HK]
proof of Prop. 5.5, p. 15) and, by *stable-basis-etale-vector-bundles*, `H^i(X_ét, 𝒪) = 0` for
`i > 0` and finite projective `R`-modules are the vector bundles on `X_ét` ([KL15] Thm.
8.2.22(c),(d), p. 165; [HK] Prop. 5.8, p. 16). The class of all sousperfectoid affinoid étale
objects is not used, its closure under fibre products being unknown. Checks: the identity and the
split two-point cover of `Spa(ℚ_2, ℤ_2)` belong; the empty finite étale object belongs; the open
unit disc in the closed disc is étale and not in `B_X`; a presentation with a nonzero nilpotent
never belongs.

**Étale base change along sousperfectoid spaces.** (*sousperfectoid-etale-base-change*) For `Z`
sousperfectoid, `W` locally noetherian analytic, `g : Z → W` and `f : Y → W` étale, the fibre
product `Z ×_W Y` exists in adic spaces, is sousperfectoid and étale over `Z`; affinoid-locally, for
`Y'' = Spa(B, B⁺) → Spa(A, A⁺)` finite étale and `Spa(C, C⁺) ⊆ g^{-1}(Spa A)` sousperfectoid,
`C ⊗_A B` is sousperfectoid and `Spa(C ⊗_A B, integral closure of C⁺)` is the piece ([Berkeley]
§7.5, after Def. 7.5.1, p. 55; [KL15] Def. 8.2.16; [BHW] proof of Cor. 3.4, p. 1725). Checks: for
`Y` an open `W' ⊆ W` the product is `g^{-1}(W')`; for `Z = X ×_L 𝔹^n` and `Y → 𝔹^n` étale it is the
BHW product. Lean: `AdicSpace.IsSousperfectoid.exists_fibreProduct_etale`.

### R5.5 perfectoid times smooth

**Perfectoid space times a polydisc.** (*perfectoid-times-polydisc*) For `L` perfectoid and
`X = Spa(S, S⁺)` affinoid perfectoid over `L`, `X ×_L 𝔹^n_L = Spa(S⟨T⟩, S⁺⟨T⟩)` exists, is a
sousperfectoid affinoid, and for `n ≥ 1` and `S ≠ 0` is not perfectoid ([BHW] proof of Cor. 3.4, p.
1725; [Berkeley] Prop. 6.3.3(3)). Checks: `ℚ_p^cycl⟨T⟩` is sousperfectoid with frame
`ℚ_p^cycl⟨T^{1/p^∞}⟩`, not perfectoid; for `S = 0`, `0⟨T⟩ = 0` is perfectoid, so `S ≠ 0` is needed.
Lean: `Huber.not_isPerfectoidTateRing_restrictedMvPowerSeries`.

**The product of a perfectoid space and a smooth rigid space.**
(*perfectoid-times-smooth-fibre-product*) For a perfectoid field `L`, a perfectoid extension `L'`, a
perfectoid space `X` over `L` and `Y` smooth over `Spa L'` (*smooth-morphism*), the fibre product
`X ×_L Y = X ×_{Spa L} Y` exists in adic spaces and is sousperfectoid ([BHW] §3.1, Cor. 3.4, pp.
1724–1725; [BHW] reads "a perfectoid extension `L'` of `L`"). Construction: reduce to `L = L'` and
affinoid perfectoid `X = Spa(S, S⁺)`; on an étale chart `V' → 𝔹^n` of `Y` ([Huber96] Cor. 1.6.10, p.
80) the piece is `Spa(S⟨T⟩) ×_{𝔹^n} V'` (*sousperfectoid-etale-base-change*), and the pieces glue.
With projections, universal property, the base-change isomorphism
`X ×_L Y ≅ (X ×_L Spa L') ×_{L'} Y`, functoriality in `X` and `Y`, compatibility with open
subspaces, and for a chart `U' = Spa(B, B⁺)` (rational localisations and finite étale extensions of
`L'⟨T⟩`) the affinoid `V ×_L U' = Spa(S ⊗̂_L B)`; for affinoid `U'` that is not a chart only
quasi-compactness is asserted. It is not perfectoid in general. Checks: `Y = Spa L'` gives the
perfectoid fibre product and `Y = Spa L` gives `X`; `X = Spa L`, `Y = 𝔹¹_L` gives `𝔹¹_L`, not
perfectoid; an empty factor gives `∅`; points with values in affinoid fields are the fibre product
of point sets. Lean: `AdicSpace.perfectoidTimesSmooth_exists`.

**Products with a smooth space preserve tilde-limits.** (*perfectoid-times-smooth-tilde-limit*) For
`L` perfectoid, a system `(X_n)` of qcqs adic spaces over `L` with adic transition maps, a qcqs
perfectoid `X_∞ ∼ lim X_n` and a qcqs smooth rigid `U` over `L` with each `X_n ×_L U` an adic space,
`X_∞ ×_L U ∼ lim X_n ×_L U` (*tilde-limit-base-change* with `f = X_1 ×_L U → X_1`, locally of weakly
finite type); for non-quasi-compact `U` this holds on each quasi-compact open ([BHW] Cor. 3.5, p.
1725; [Huber96] Rem. 2.4.3(ii), p. 126). Checks: BHW's
`X*_{Γ(p^∞)}(ε)_a ×_L U ∼ lim_n X*_{Γ(p^n)}(ε)_a ×_L U`; `U = Spa L` is the hypothesis.

### R5.6 coefficient algebras

**Profinite flat modules.** (*profinite-flat-module*) Over a DVR `𝒪` with a compact Hausdorff ring
topology (for example `𝒪_E`, `E/ℚ_p` finite, or `𝔽_q[[t]]`), a topological `𝒪`-module is profinite
flat if it is compact, totally disconnected, a topological group with continuous scalar action (Tau
Ceti `IsCompactModule`, which gives Hausdorffness and the linear topology) and flat ([CHJ] §6.1,
Def. 6.1, p. 46). Then open submodules have finite index, `M` is `𝔪`-adically complete and
separated, closed submodules are profinite flat, and `∏_I 𝒪` is profinite flat. Checks:
`ℤ_p[[T_1, …, T_d]]` with the coefficientwise topology; `0` and `𝒪`; `𝒪/ϖ` is not flat, discrete `𝒪`
and `E` are not compact; indiscrete `ℤ_p` is flat and compact but not Hausdorff, hence not profinite
flat. Lean: `Huber.IsProfiniteFlat`, `Huber.IsProfiniteFlat.isAdicComplete`.

**Pseudobases.** (*profinite-flat-pseudobasis*) `M` is profinite flat iff `M ≅ ∏_{i∈I} 𝒪` as
topological modules for some `I` (with `I` in the universe of `M`); the images of the unit vectors
form a pseudobasis and `∏_{i∈J} ϖ^n𝒪 × ∏_{i∉J} 𝒪`, `J` finite, form a basis of neighbourhoods of `0`
([CHJ] Prop. 6.2, p. 46, imported from SGA 3). Checks: `(Tⁿ)` for `𝒪[[T]]`; the empty pseudobasis
for `0`. Lean: `Huber.IsProfiniteFlat.iff_exists_pseudobasis`.

**Small `ℤ_p`-algebras.** (*small-coefficient-algebra*) A small `ℤ_p`-algebra is reduced,
`p`-torsion-free and finite over some `ℤ_p[[X_1, …, X_d]]` ([CHJ] §1.4, p. 7); with the adic
topology of its Jacobson radical it is a profinite flat `ℤ_p`-module, noetherian, semilocal and
`p`-adically complete, and `R/I` is small when reduced and `p`-torsion-free. Checks: `ℤ_p[[ℤ_p^×]]`,
which is `∏_{p−1} ℤ_p[[T]]` for odd `p` and `ℤ_2[x]/(x² − 1)[[T]]` for `p = 2`; `ℤ_p` (`d = 0`);
`ℤ_p[[T]]/(T²)` is not reduced; `𝔽_p[[T]]` has `p`-torsion; `ℚ_p` is not finite (Nakayama). Lean:
`Huber.IsSmallZpAlgebra`, `Huber.IsSmallZpAlgebra.topology`,
`Huber.IsSmallZpAlgebra.isNoetherianRing`, `Huber.IsSmallZpAlgebra.isProfiniteFlat`.

**The mixed completed tensor product.** (*mixed-completed-tensor*) For an `𝒪`-module `X` and a
topological `𝒪`-module `M`, `X ⊗̂ M := lim_N X ⊗_𝒪 M/N` over the open submodules (any cofinal system
gives the same limit for profinite flat `M`), with pure tensors `x ⊗ (m mod N)` and functoriality
`f ⊗ id` ([CHJ] Def. 6.3, p. 46); for a lattice `V° ⊆ V`, `V ⊗̂ M := (V° ⊗̂ M)[1/ϖ]` ([CHJ] Def.
6.6, p. 47). For an `E`-Banach space `V` the lattice is open and bounded and the result is
independent of it; for a Banach algebra `V` and an `𝒪`-algebra `M` with a basis of open ideals
(computed with an open bounded subring and open ideals) it is a ring, a Banach algebra with unit
ball `V° ⊗̂ M`, functorial in bounded maps of `V` and continuous maps of `M`, with `V ⊗̂ 𝒪 = V`; for
`V°`, `M` adic rings it is AdicSpacesPartIII's `AdicRing.CompletedTensorProduct`
(*completed-tensor-product-adic*). Checks: `ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]] = (ℤ_p⟨X⟩[[T]])[1/p]`, the uniformly
bounded series `Σ f_n T^n`; `Σ XⁿTⁿ` is not in the image of the algebraic tensor product
(finite-dimensional coefficient span) and is at sup-distance `1` from it; for `V = ℚ_p⟨X⟩[Q]/(Q²)`
the unbounded lattice of power-bounded elements gives `ℚ_p⟨X⟩ ≠ V`, killing `Q`; for `M ≅ 𝒪^n`,
`V ⊗̂ M = V ⊗ M = V^n`; the unit `1 ⊗ 1`, the cross term `(v ⊗ 1)(1 ⊗ m) = v ⊗ m` and the
coefficient `2` in `(v ⊗ 1 + 1 ⊗ m)²`. Lean: `Huber.IsOpenBoundedLattice`, `Huber.mixedTensorInt`,
`Huber.mixedTensorInt.tmul`, `Huber.mixedTensorInt.map`, `Huber.mixedTensorOfLattice`; the ring and
Banach structures are README only.

**The product formula.** (*mixed-completed-tensor-product-formula*) For `M` profinite flat with
pseudobasis `e : M ≅ ∏_I 𝒪`, `X ⊗̂ M ≅ ∏_{i∈I} X̂` naturally in `X`, `X̂` the `ϖ`-adic completion,
with `x ⊗ m ↦ (e(m)_i x)_i`; for a Banach space `V`, `V ⊗̂ M` is the space of bounded families in
`V` with the sup norm (not the product topology) ([CHJ] Prop. 6.4, p. 46). Checks:
`𝒪⟨Y⟩ ⊗̂ 𝒪[[T]] = 𝒪⟨Y⟩[[T]]`; for finite `I`, `X̂^I`; moving unit vectors converge coordinatewise
but not in sup norm. Lean: `Huber.mixedTensorInt.nonempty_piEquiv`.

**Exactness.** (*mixed-completed-tensor-exactness*) For `M` profinite flat: (1) `− ⊗̂ M` is exact on
short exact sequences of `ϖ`-adically complete separated modules; (2) if `0 → X → Y → Q → 0` is
exact with `X` complete and `ϖ^N Q = 0`, then `Y` is complete and `(X ⊗̂ M)[1/ϖ] ≅ (Y ⊗̂ M)[1/ϖ]`
([CHJ] Cor. 6.5(1),(2), p. 47). Consequently two open bounded lattices `V₀ ⊆ V₁` of a space on which
`ϖ` is bijective, `V₀` complete, give the same `V ⊗̂ M`, compatibly with pure tensors. Checks: for
the incomplete `⊕_ℕ 𝒪` the formula is not `∏_I X`. Lean:
`Huber.mixedTensorInt.exact_of_isAdicComplete`, `Huber.mixedTensorOfLattice.nonempty_equiv`.

**Rational and integral coefficients agree on reduced affinoids.**
(*rational-integral-compatibility*) For `K ⊇ E` complete, `X = Spa(A, A°)` a reduced affinoid rigid
space and `M` profinite flat, for every rational `U` the ring `𝒪_X⁺(U) = 𝒪_X(U)°` is an open bounded
lattice and `(𝒪_X⁺(U) ⊗̂ M)[1/ϖ] → 𝒪_X(U) ⊗̂ M` is an isomorphism compatible with restriction;
`U ↦ 𝒪_X⁺(U) ⊗̂ M` is a sheaf on rational subsets ([CHJ] Cor. 6.5(2), after Def. 6.6, p. 47; §6.3,
after Lem. 6.13, p. 51). For `E = ℚ_p` this is a statement about uniform Tate `ℚ_p`-algebras; a Tate
`ℤ_p`-algebra of characteristic `p` would localise to `0`. Checks: on the closed disc
`(ℤ_p⟨T⟩ ⊗̂ ℤ_p[[S]])[1/p] = ℚ_p⟨T⟩ ⊗̂ ℤ_p[[S]]`; for `ℚ_p⟨X⟩[Q]/(Q²)` it fails.

**Finite projective base change.** (*mixed-tensor-finite-projective-base-change*) For a Banach
`E`-algebra `S`, a finite projective `S`-module `V` (not merely finite), a Banach `S`-module `U` and
`M` profinite flat, `V ⊗_S (U ⊗̂ M) → (V ⊗_S U) ⊗̂ M`, `v ⊗ (u ⊗ m) ↦ (v ⊗ u) ⊗ m`, is an
isomorphism, a ring isomorphism for algebras and `M` with a basis of open ideals ([CHJ] Lem. 6.7,
pp. 47–48). Checks: `S^n ⊗_S (U ⊗̂ M) = (U ⊗̂ M)^n` with the two basis vectors in their own
coordinates; for a finite étale `𝒪(U) → 𝒪(U_n)` at a finite level of a tower, `𝒪(U_n) ⊗̂ R`.

### R5.7 coefficient sheaves

**The coefficient sheaf `ℛ = 𝒪_X ⊗̂ R`.** (*completed-coefficient-sheaf*) For `K` a complete
extension of `ℚ_p`, `X = Spa(A, A°)` affinoid rigid over `K` and `R` small, `ℛ(U) := 𝒪_X(U) ⊗̂ R` on
the site of rational subsets with finite rational covers (computed with any open bounded subring of
`𝒪_X(U)`), with restriction `mixed tensor map ⊗ id`, is a presheaf of Banach `K`-algebras, with
structure maps `𝒪_X → ℛ`, `λ ↦ λ ⊗ 1`, and `R → ℛ(U)`, functorial in `R` and in `X`; for reduced `X`
the integral subsheaf `𝒪_X°(U) ⊗̂ R` has `ℛ = ℛ°[1/p]`; that `ℛ` is a sheaf is
*coefficient-sheaf-tate-acyclicity* ([CHJ] §6.3, p. 50; after Lem. 6.13, p. 51). Checks: for
`R = ℤ_p`, `ℛ = 𝒪_X` (also for non-reduced `X`); for `R = ℤ_p[[T]]` and the disc,
`ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]` and `ℛ({|Y| ≤ |p|}) = 𝒪_K⟨Y/p⟩[[T]][1/p]`; `ℛ(X) ≠ 𝒪(X) ⊗ R` (`Σ YⁿTⁿ`);
for `X = Spa(K⟨Y, Q⟩/(Q²))` the power-bounded unit ball gives the wrong ring `K⟨Y⟩`; for `R = 0`
everything vanishes.

**The localisation functor.** (*coefficient-sheaf-loc*) For rational `U` and a finitely generated
`ℛ(U)`-module `M`, `Loc(M)(V) = ℛ(V) ⊗_{ℛ(U)} M` on rational `V ⊆ U`, with `Γ(U, Loc M) = M` and
`Loc(M)|_V = Loc(ℛ(V) ⊗ M)`. For `K` discretely valued `Loc` is a fully faithful exact functor to
`ℛ|_U`-modules, `Loc(M)` is a sheaf and `Ȟ^i(𝔘, Loc M) = 0 = H^i(U, Loc M)` for `i ≥ 1`; without
discreteness this holds for `M` projective ([CHJ] Def. 6.14, p. 51; Prop. 6.16, p. 52). Checks:
`Loc(ℛ(U)^n) = (ℛ|_U)^n`; for `M = ℛ(U)/(T)` with `R = ℤ_p[[T]]`, `Loc(M) = 𝒪_X` via
`(a ⊗ f) ⊗ [b ⊗ g] ↦ f(0)g(0)·a·b|_V`; for `R = ℤ_p`, `Loc(M)` is the associated sheaf `M̃`
(*associated-module-sheaf*).

**Coherent `ℛ`-modules.** (*coefficient-sheaf-coherent-module*) For `K` discretely valued, a sheaf
of `ℛ|_U`-modules is `𝔘`-coherent if on each member of a finite rational cover `𝔘` it is `Loc` of a
finitely generated module, coherent if this holds for some `𝔘`, and locally projective if the
modules can be taken projective ([CHJ] Def. 6.18, p. 52). `Loc(M)` is coherent; kernels, cokernels
and rational restrictions of coherent sheaves are coherent; locally projective sheaves are coherent.
Checks: a rank-one sheaf glued on the Laurent cover of the disc by a unit of `ℛ(U₁₂)` is coherent
and locally projective; `⊕_ℕ ℛ` on nonempty `X` with `R ≠ 0` is not coherent, and is zero, hence
coherent, for `X = ∅` or `R = 0`.

**`ℛ(U)` is noetherian.** (*coefficient-sheaf-noetherian*) For `K` discretely valued (used for the
noetherianity of `𝒪_K⟨X⟩[[T]]`), `ℛ(U)` is noetherian for every rational `U` ([CHJ] §6.3, Lem.
6.13(1), pp. 50–51; *restricted-power-series-adic*). Checks: `𝒪_K⟨Y⟩[[T]][1/p]` on the disc; for
`K = ℂ_p` the argument does not apply.

**Rational restrictions are flat.** (*coefficient-sheaf-flat-restriction*) For `K` discretely valued
and rational `V ⊆ U`, `ℛ(U) → ℛ(V)` (the mixed tensor map of `A → A⟨T/s⟩` and the identity of `R`)
is flat, with a presentation lattice as unit ball, no reducedness needed ([CHJ] Lem. 6.13(2), pp.
50–51). Checks: `𝒪_K⟨Y⟩[[T]][1/p] → 𝒪_K⟨Y/p⟩[[T]][1/p]`; rational localisations of perfectoid
algebras are not flat in general ([KL15] Rem. 2.7.1).

**Finite rational covers are faithfully flat.** (*coefficient-sheaf-faithfully-flat-cover*) For `K`
discretely valued, every maximal ideal of `ℛ(U)` has residue field finite over `K` (closed points of
Berthelot's generic fibre of `Spf(A₀ ⊗̂ R)`, *berthelot-type-rig-functor-nonnoetherian-base*; [de
Jong95] Lem. 7.1.9), and `ℛ(U) → ∏_i ℛ(U_i)` is faithfully flat for a finite rational cover ([CHJ]
Lem. 6.13(3), pp. 50–51). Checks: the maximal ideals of `𝒪_K⟨Y⟩[[T]][1/p]` are Galois orbits of
`(y, t)` with `|y| ≤ 1`, `|t| < 1`, each contracted from one of the two Laurent pieces; `U = ∅`
gives `0 → 0`.

**Tate acyclicity.** (*coefficient-sheaf-tate-acyclicity*) For `K` complete over `ℚ_p` (not
necessarily discretely valued), the augmented Čech complex of `ℛ` for every finite rational cover of
a rational `U` is exact, so `ℛ` is a sheaf with `H^i(U, ℛ) = 0` for `i ≥ 1`; the integral Čech
cohomology is bounded `p`-torsion ([CHJ] Prop. 6.15, p. 52); on the étale site acyclicity is
asserted only on a stable basis ([CHJ] Rem. 6.17). Checks: for the disc, `R = ℤ_p[[T]]` and the
Laurent cover `{|Y| ≤ |p|}`, `{|p| ≤ |Y|}` the sequence of `𝒪_K⟨…⟩[[T]][1/p]` is exact; `R = ℤ_p` is
Tate's theorem.

**Local equalizers.** (*coefficient-sheaf-local-equalizer*) For reduced `X` and `M` profinite flat,
the integral and rational diagrams `𝒪_X⁺(U) ⊗̂ M → ∏ 𝒪_X⁺(U_i) ⊗̂ M ⇉ ∏ 𝒪_X⁺(U_i ∩ U_j) ⊗̂ M` (and
with `𝒪_X`) are equalizers ([CHJ] Prop. 6.15 and its proof, p. 52; Cor. 6.5(1)). Checks: `M = ℤ_p`
is the sheaf property of `𝒪⁺`, `𝒪`; uniformly bounded sequences on the two Laurent pieces glue.

**Density of restriction for Laurent covers.** (*coefficient-sheaf-dense-restriction*) For `X`
affinoid rigid, `f ∈ 𝒪(X)`, `X(1/f) = {|f| ≥ 1}` and `X(f, 1/f) = {|f| = 1}`: (1)
`𝒪(X(1/f)) → 𝒪(X(f, 1/f))` has dense image; (2) for `R` finite free over `ℤ_p`,
`ℛ(X(1/f)) → ℛ(X(f, 1/f))` is dense, and for every small `R` it is dense coordinatewise after
choosing a pseudobasis; (3) for an infinite pseudobasis (2) fails in the Banach topology, so [CHJ]
Lem. 6.19(2), p. 53, is false: for `X = Spa ℚ_p⟨x⟩`, `f = x/p`, `R = ℤ_p[[T]]`, `u = x/p`, the
element `Σ uⁿTⁿ` has norm `1` and sup-distance `1` from the image, whose `T^n`-coefficients have
`u^n`-coefficient of size `≤ Cp^{-n}`. Checks: Laurent polynomials in `u` are in the image of
`ℚ_p⟨x, p/x⟩`; `Σ uⁿTⁿ` is in the image from the small disc `X(f)`. The array computation (diagonal
array at distance `1` from the exponentially bounded arrays) is a Lean `example`.

**Kiehl's theorem.** (*coefficient-sheaf-kiehl*) For `K` discretely valued and `F` coherent on `X`:
(a) if `R` is finite free over `ℤ_p`, `F(X)` is finitely generated and `F ≅ Loc(F(X))`
(*tate-kiehl-affinoid* applied to the underlying `𝒪_X`-module); (b) for any small `R`, if
`F ≅ Loc(M)` with `M` finitely generated and `F` locally projective, then `M` is projective (full
faithfulness of `Loc`, finite presentation, descent along the faithfully flat `ℛ(X) → ∏ ℛ(U_i)`;
[CHJ] proof of Thm. 6.20, p. 53). Global generation of every coherent `F` for an infinite
pseudobasis is the open question `F(X)` finite and `F ≅ Loc(F(X))`: [CHJ] Thm. 6.20 states it but
its proof uses the false Lem. 6.19(2). Checks: the zero sheaf; the free sheaf on `ℕ` fails finite
generation but is not coherent.

**Base change to `C`.** (*coefficient-sheaf-base-change*) For `K` discretely valued, `C` the
completed algebraic closure, `f : X_C → X`, `R` small and `M` finitely generated projective over
`ℛ(X)`, `f^{-1}(Loc M) ⊗ ℛ_C ≅ Loc(M ⊗_{ℛ(X)} ℛ_C(X_C))` on the rational site of `X_C`; for `R`
finite free, `ℛ_C(X_C) = ℛ(X) ⊗̂_K C` and `M_C = M ⊗̂_K C` ([CHJ] Lem. 6.21, p. 53; Lem. 6.7). For
an infinite pseudobasis [CHJ] Lem. 6.21 is false: for `X = Spa ℚ_p`, `R = ℤ_p[[T]]`,
`M_C = 𝒪_{ℂ_p}[[T]][1/p]` (the bounded coefficient sequences, by the product formula) strictly
contains `M ⊗̂_{ℚ_p} ℂ_p` (the series whose coefficients modulo every `p^n` span a finitely
generated submodule of `𝒪_{ℂ_p}/p^n`, equivalently whose coefficient sequence is totally bounded):
the series `Σ [ζ_i] T^i`, with Teichmüller lifts of `𝔽_p`-linearly independent `ζ_i ∈ 𝔽̄_p`, lies in
the first and not the second (*affinoid-completed-field-extension*). The unit sequence with
independent residues, which is not totally bounded, is a Lean `example`.

**Affinoid weights.** (*affinoid-weight-coefficient-sheaf*) For `X` affinoid rigid over `K ⊇ ℚ_p`
and `S` a reduced affinoid `ℚ_p`-algebra, `𝒪_X(U) ⊗̂_{ℚ_p} S = 𝒪(U ×_{ℚ_p} Spa S)`
(*completed-tensor-product*, *affinoid-fibre-product*), so acyclicity, `Loc`, coherence and Kiehl
for `U ↦ 𝒪_X(U) ⊗̂ S` are those of `X ×_{ℚ_p} Spa S` on product covers ([CHJ] Rem. 6.22, p. 53). A
nonzero affinoid `S` is never a small `ℤ_p`-algebra. Checks: `S = ℚ_p` gives `𝒪_X`, `S = 0` gives
`0`, `S = ℚ_p⟨T⟩` gives `𝒪_{X × 𝔹¹}` with Tate acyclicity on the bidisc.

**Covering reduction on a stable basis.** (*stable-basis-covering-reduction*) For a locally strongly
sheafy `X` and a class `B` of affinoid objects of `X_ét` that is cover-dense and stable under
rational embeddings and finite étale maps, the topology induced on `B` by `X_ét` is the smallest one
in which finite jointly surjective families of rational embeddings and single surjective finite
étale maps are coverings: a topology on `B` contains the induced one iff it contains these sieves
([KL15] §8.2, Props. 8.2.20–8.2.21, pp. 163–164; [dJvP] §3.2, Prop. 3.2.2, p. 23, in the rigid
case). This is the argument of AdicEtaleGeometry A1's *etale-covering-reduction* for an arbitrary
stable class, applied to *sousperfectoid-stably-adic*.

**Vector bundles on the étale site of an affinoid with a stable basis.**
(*stable-basis-etale-vector-bundles*) For `X = Spa(A, A⁺)` complete Tate sheafy and a stable basis
`B` of `X_ét` containing `X` (*basis-comparison*): (c) for finite projective `M`,
`M̃ : Y = Spa(C, C⁺) ↦ M ⊗_A C` is an acyclic sheaf on `B`; (d) `M ↦ M̃` is an equivalence onto
finite locally free `𝒪_{X_ét}`-modules with inverse `E ↦ E(X)` ([KL15] Thm. 8.2.22(c),(d), p. 165).
Only finite projective modules are treated, rational localisation not being flat in general. Checks:
`M = A` gives `H^i(X_ét, 𝒪) = 0` for `i > 0` ([HK] Prop. 5.8); vector bundles on a smooth affinoid
over a `p`-adic field are finite projective modules.

**Rational localisations of reduced affinoid algebras.** (*reduced-affinoid-rational-localisation*)
For `(A, A⁺)` with `A` a `K`-affinoid algebra and a rational `U` with `(B, B⁺) = (𝒪(U), 𝒪⁺(U))`: (c)
`A` reduced implies `B` reduced; (d) `A⁺ = A°` implies `B⁺ = B°` ([KL15] §2.5, Lem. 2.5.9(c),(d), p.
49, from [BGR] 7.3.2/10), so `𝒪_X(U)` is uniform (*reduced-affinoid-supremum-norm*). The inclusion
`B⁺ ⊆ B°` is Tau Ceti's `completedPlusSubring_le_powerBoundedSubring`. Checks: `K⟨x⟩ → K⟨x/a⟩` with
`B° = 𝒪_K⟨x/a⟩`; `K⟨x, q⟩/(q²)` gives non-reduced `B` on every nonempty `U`.

### R5.8 tilde-limits of adic spaces

**Tilde-limits and the affinoid criterion.** (*tilde-limits-affinoid-criterion*) For a cone
`X → X_i` over a diagram of adic spaces, `X ∼ lim X_i` if `|X| → lim |X_i|` (compatible families,
subspace of the product) is a homeomorphism compatible with the projections and every point of `X`
has an affinoid chart in which the images of the coordinate rings of charts of the `X_i` through
which it factors are dense ([Huber96] Def. 2.4.2, p. 125); no analyticity is required. Affinoid
criterion: for `X = Spa A`, `X_i = Spa B_i` with coordinate maps `B_i → A` inducing the projections,
the point-space homeomorphism and density of `⋃ im(B_i → A)` give `X ∼ lim X_i`; for a cofiltered
system of complete affinoid rings with compatible rings of definition and finitely generated ideals
of definition, approximation and finite-stage detection modulo powers, and the closed integral
closure as plus ring, `Spa` of the completed direct limit is the tilde-limit, the homeomorphism
being a conclusion ([Scholze–Weinstein 2013] Def. 2.4.1, Prop. 2.4.2). PerfectoidSpaces P7
specialises this to towers. Checks: a constant cofiltered diagram is its own tilde-limit; a
projection identifying distinct points is excluded; for a frame of `ℚ_p` with non-surjective `ι` and
one-point `Spa(R̃)`, the constant diagram `Spa ℚ_p` with cone `Spa(R̃) → Spa ℚ_p` satisfies the
point condition but not density (`ι(ℚ_p)` is a proper closed subring). Lean:
`AdicSpace.IsTildeLimit`, `AdicSpace.IsTildeLimit.affinoid`.

**Tilde-limits and base change.** (*tilde-limit-base-change*) For `I` cofiltered with final object
`j`, qcqs `X_i` with adic transition maps, qcqs `X ∼ lim X_i` with adic projections, and
`f : Y → X_j` qcqs and locally of weakly finite type, if the fibre products `Y ×_{X_j} X` and
`Y ×_{X_j} X_i` exist (by *fibre-products-existence* or *perfectoid-times-smooth-fibre-product*),
then `Y ×_{X_j} X ∼ lim Y ×_{X_j} X_i` ([Huber96] Rem. 2.4.3(ii), p. 126; (2.4.1), p. 125). The
étale case over a perfectoid limit is PerfectoidSpaces P7 ([Scholze–Weinstein 2013] Prop. 2.4.3).
Checks: `Y = X_j` is the hypothesis; [BHW] Cor. 3.5 is `Y = X_1 ×_L U`. Lean:
`AdicSpace.IsTildeLimit.baseChange`.

### Examples

The running examples are recorded at the targets: `ℚ_p⟨T⟩` sousperfectoid and not perfectoid against
the non-reduced `ℚ_p⟨X⟩[Q]/(Q²)`; finite extensions of `ℚ_p` with their ramification obstruction;
the annulus convention `a ≤ b`; `𝔹¹_L` as the non-perfectoid product; profinite flat modules against
`𝒪/ϖ`, discrete, open and indiscrete controls; `ℤ_p[[ℤ_p^×]]` as a small algebra; the mixed tensor
`ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]]` with `Σ XⁿTⁿ`; `ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]` on the disc with its Laurent Čech
sequence; the element `Σ uⁿTⁿ` refuting [CHJ] Lem. 6.19(2) and `Σ [ζ_i]Tⁱ` refuting [CHJ] Lem. 6.21
as printed; the non-dense constant tilde-limit.

### Dependencies

AdicSpacesPartII R0 (completed tensor products with *completed-tensor-rational-localisation* and
*completed-tensor-restricted-power-series*, fibre products, finite-type constructions, smooth
morphisms and their local structure, *reduced-affinoid-supremum-norm*); AdicSpacesPartIII F0 (adic
rings, *restricted-power-series-adic*, *completed-tensor-product-adic*), R2
(*berthelot-type-rig-functor-nonnoetherian-base*) and R3 (*associated-module-sheaf*,
*tate-kiehl-affinoid*, *stably-uniform-sheafy*, *sheafy-cech-acyclicity*,
*finite-projective-etale-descent*, *affinoid-completed-field-extension*); AdicEtaleGeometry A1
(local-description étale morphisms, *finite-etale-affinoid-algebra*, *strongly-sheafy-huber-pair*,
*basis-comparison*, *etale-covering-reduction*, *etale-structure-sheaf*) and the perfectoid
Tate-ring predicate; PerfectoidSpaces P2 (perfectoid spaces) and P7 (towers); Tau Ceti uniform
rings, rational localisation and compact modules; Mathlib adic completions, localised modules and
flatness.

## Layer F1: dagger geometry and overconvergent de Rham complexes

F1 develops Grosse-Klönne's rigid spaces with overconvergent structure sheaf and their de Rham
cohomology. `K` is complete for a nontrivial rank-one nonarchimedean absolute value; `π` is a fixed
element with `0 < |π| < 1` (a uniformiser when `K` is discretely valued), and in F1.5 the
uniformiser of a complete DVR `O_K`. Sheaf cohomology and hypercohomology are Mathlib's.

### F1.1 overconvergent power series

**Tate algebras of polydiscs of radius `ρ`.** (*radius-tate-algebra-affinoid*) For `ρ > 0`,
`T_n(ρ) ⊆ K[[X]]` is the algebra of `Σ a_ν X^ν` with `|a_ν| ρ^{|ν|} → 0` (Mathlib's
`MvPowerSeries.IsRestricted` at the constant radius) with Gauss norm `|f|_ρ = max |a_ν| ρ^{|ν|}`,
multiplicative and complete (Tau Ceti `MvPowerSeries.IsRestricted.gaussNorm_mul`). Prove: (a) for
`ρ ∈ Γ*`, `T_n(ρ)` is `K`-affinoid (strictly topologically of finite type), hence noetherian; (b)
for `ρ' ≥ ρ > 0`, `T_n(ρ') ⊆ T_n(ρ)` is continuous, injective, with `|f|_ρ ≤ |f|_{ρ'}` and dense
image, polynomials being dense ([GK00] §1, 1.1); one variable at radius `1` is Tau Ceti's. The Gauss
norm is meaningful only on `T_n(ρ)` (Mathlib's real supremum is `0` on unbounded families). Checks:
`T_0(ρ) = K`; `1 ∈ Γ*`, `√|c| ∈ Γ*` and nonpositive radii are excluded; over `ℚ_p`, `Σ pᵐXᵐ` has
`|f|_ρ = 1` for `1 ≤ ρ < p` and is not in `T_1(p)`, and `|X|_ρ = ρ`; for `ρ ∉ Γ*`, `T_1(ρ)` is
Banach but not affinoid (the supremum `ρ` of `|X|` on `Max` is not attained,
*affinoid-maximum-modulus*). Lean: `Dagger.radiusTate`, `Dagger.gammaStar`,
`Dagger.radiusGaussNorm`, `Dagger.radiusTate_isNoetherianRing`.

**The Monsky–Washnitzer algebra `W_n`.** (*overconvergent-tate-algebra*)
`W_n = K⟨X_1, …, X_n⟩† := ⋃_{ρ > 1} T_n(ρ)`, the series with `|a_ν| ≤ Cρ^{-|ν|}` for some `ρ > 1`,
`C` (radii in `Γ*` suffice, but not radii in `|K^×|`), a `K`-subalgebra of `T_n` with the restricted
Gauss norm ([GK00] §1, 1.2, p. 3). Prove: `W_0 = K`; polynomials are dense; `W_n` is dense in `T_n`
and `W_n ≠ T_n` for `n ≥ 1`; `f` is a unit iff it is a unit of `T_n` iff `|f − f(0)| < |f(0)|`;
`∂/∂X_i` preserves `W_n` with the Hasse-derivative estimate `|∂_i^{[j]} f|_ρ ≤ ρ^{-j}|f|_ρ` (every
characteristic); in characteristic `0` termwise primitives preserve `W_n`;
`W_{n+1} ≅ W_n⟨X_{n+1}⟩†`. Checks: over `ℚ_p`, `Σ pᵐXᵐ ∈ W_1` (restricted for `ρ < p`), the lacunary
`Σ pᵐX^{pᵐ} ∈ T_1 ∖ W_1`, and `Σ pᵐX^{2m} ∈ W_1` lies in no `T_1(pᵏ)`; `1 + pX` is a unit, `p + X`
is not (zero at `−p`), `0` is not; in characteristic `p`, `(1/p!)∂^p` is undefined while
`∂^{[p]}X^p = 1`, and `X^{p−1}` has no primitive. Lean: `Dagger.washnitzerAlgebra`,
`Dagger.washnitzerAlgebra.X`, `Dagger.mem_washnitzerAlgebra_iff`,
`Dagger.isUnit_washnitzerAlgebra_iff`, `Dagger.washnitzerAlgebra_le_weightedRestrictedSubring`,
`Dagger.washnitzerAlgebra.toTate`.

**Weierstrass division and preparation.** (*overconvergent-weierstrass-division*) Write
`g = Σ g_m Y_n^m ∈ W_n` with `g_m ∈ W_{n−1}`; `g` is distinguished of degree `s` if `g_s` is a unit
and `|g| = |g_s| > |g_m|` for `m > s`. Then (i) every `f ∈ W_n` is uniquely `gq + r` with `q ∈ W_n`
and `r ∈ W_{n−1}[Y_n]` of degree `< s`; (ii) `g = eω` uniquely, `e` a unit, `ω` monic of degree `s`
with `|ω| = 1`; (iii) for `f ≠ 0` some automorphism `Y_i ↦ Y_i + Y_n^{c_i}` (`i < n`) makes `f`
distinguished ([GK00] §1, 1.3(i)–(ii), (iv)). At a fixed radius this is Tau Ceti's
`PowerSeries.IsDistinguished.existsUnique_mul_add_eq`; the persistence to some `ρ > 1` and the
automorphism are new. Checks: `Y + p` has degree `1` with remainder `f(−p)`; `1 + pY` has degree
`0`; `Y − p^{-1}` has degree `0`, a unit; for `n = 1` every nonzero series is distinguished.

**`W_n` is noetherian, factorial and Jacobson.** (*overconvergent-tate-algebra-properties*) `W_n` is
a noetherian unique factorisation domain and a Jacobson ring with residue fields finite over `K`,
and every ideal is strictly closed: closed, with the residue distance attained ([GK00] §1, 1.4(1),
(3)–(4)). The single-radius one-variable theory is Tau Ceti's. Lean:
`Dagger.washnitzerAlgebra.isNoetherianRing`.

**`W_n → T_n` is faithfully flat; `W_n` is regular of dimension `n`.**
(*overconvergent-faithful-flatness*) `W_n ⊆ T_n` is faithfully flat; `m ↦ m ∩ W_n` is a bijection
`Max T_n → Max W_n` with equal residue fields; maximal ideals of `W_n` are generated by polynomials
`p_i` monic in `Y_i`; `W_n` is regular of Krull dimension `n`, with isomorphic completed local rings
([GK00] §1, Prop. 1.5, p. 4). Checks: the only maximal ideal of `W_0` is `0`; `(X)` is maximal in
`W_1`. Lean: `Dagger.washnitzerAlgebra.faithfullyFlat`,
`Dagger.washnitzerAlgebra.existsUnique_isMaximal_comap`, `Dagger.washnitzerAlgebra.isRegularRing`.

### F1.2 dagger algebras

**Dagger algebras.** (*dagger-algebra*) A `K`-dagger algebra is a `K`-algebra with a surjection
`W_n ↠ A`; morphisms are `K`-algebra maps. Its completion `Â = T_n/IT_n` is `K`-affinoid and
independent of the presentation up to unique isomorphism under `A`, and
`A^int = {|a|_sup ≤ 1} = A ∩ Â°` is the ring of power-bounded elements ([GK00] §1, 1.2, p. 3).
Prove: `W_n` and quotients are dagger algebras; dagger algebras are noetherian and Jacobson with
finite residue fields; `(A, A^int)` is a Huber pair with completion `(Â, Â°)`; `|a|_sup ≤ |a|` for
every residue norm, with equivalence for reduced `A` in characteristic `0`; the completion of `W_n`
is Tau Ceti's `restrictedMvPowerSeriesCompletion n K` (*affinoid-supremum-seminorm*,
*affinoid-power-bounded-iff-sup*). Checks: `W_2/(X_1X_2 − 1) = K⟨X, X^{-1}⟩†` with `X − a` a unit
for `|a| < 1`; `K` and `0`; `K[X]` is not a dagger algebra (`|X|_sup = ∞`); `W_1` is not complete
(`Σ_{m≤N} pᵐX^{pᵐ}`); `W_n^int = W_n ∩ O_K[[X]]`; in `W_1/(X²)` the nilpotent `X` has residue norm
`1` and supremum `0`, and all its scalar multiples are integral. The minimal presentation dimension
of `K`, `W_1`, `W_1/(X²)` is `0, 1, 1`. Lean: `Dagger.IsDaggerAlgebra`,
`Dagger.IsDaggerAlgebra.washnitzerAlgebra`, `Dagger.IsDaggerAlgebra.quotient`,
`Dagger.presentationDim`, `Dagger.presentation`, `Dagger.presentation_surjective`,
`Dagger.completion`, `Dagger.toCompletion`, `Dagger.intSubring`,
`Dagger.IsDaggerAlgebra.isNoetherianRing`, `Dagger.completion_washnitzerAlgebra`.

**Noether normalisation.** (*dagger-noether-normalisation*) (a) A nonzero dagger algebra is finite
over an injectively embedded `W_d`; (b) if `√q` is maximal then `A/q` is finite over `K`; (c) a
finite `W_n → B` whose kernel contains a Weierstrass polynomial makes `B` finite over `W_{n−1}`
([GK00] §1, 1.3(iii), 1.4(2)–(3)). Checks: `A ≠ 0` is needed, no map `W_d → 0` being injective.
Lean: `Dagger.exists_finite_injective_washnitzer`.

**Residue norms and automatic continuity.** (*dagger-norm-and-continuity*) For `A = W_n/I` the
residue seminorm is a `K`-algebra norm and `W_n/I → T_n/IT_n` is the completion, isometric with
dense image; every `K`-algebra map of dagger algebras is continuous for residue norms, so all
presentations give equivalent norms and finite modules carry a canonical topology from `M ⊗_A Â`
([GK00] §1, Prop. 1.6(1)–(2), 1.11). Checks: the residue norm of `X` in `W_1` is `1`; on `K` the
topology is the valuation topology; on `W_1` it is not discrete.

**Excellence in characteristic `0`.** (*dagger-algebra-excellent*) For `char K = 0`, `W_n` and `T_n`
are excellent in the sense of SchemeAndStackFoundations SF.0 (*excellent-ring*), hence so is every
dagger and every affinoid algebra, and for a maximal `m` of a dagger algebra `A_m` is reduced (resp.
normal) iff its completion is (*regular-map-completion*) ([GK00] proof of Thm. 1.7(3), p. 5;
[Conrad-IC] §1.1, p. 3); characteristic `p` is not claimed. Checks: the completion of
`K⟨X, Y⟩†/(Y² − X³)` at `(X, Y)` is reduced and not normal; SF.0's predicate excludes a noetherian
non-catenary domain ([EGA IV₂] Ex. 5.6.11 with Prop. 5.6.1).

**A dagger algebra and its completion.** (*dagger-completion-comparison*) (1) `A → Â` is faithfully
flat and bijective on maximal ideals with equal residue fields; (2) completed local rings agree; (3)
`A` is regular iff `Â` is; `Â` reduced (normal) implies `A` reduced (normal), and conversely for
`char K = 0`; (4) for `char K = 0` and `A` reduced, `|·|_sup` is a norm in the canonical class;
completion is functorial ([GK00] §1, Thm. 1.7(1)–(3), p. 5). Checks: completing `W_1 → W_1/(X)`
kills the coordinate; completing `W_1/(X²)` keeps a nonzero `X` with `X² = 0`. Lean:
`Dagger.completion_isAffinoid`.

**Weak completeness.** (*dagger-weak-completeness*) (a) For power-bounded `x_1, …, x_n ∈ A`,
`X_i ↦ x_i` extends uniquely to a continuous `W_n → A`, factoring through a fringe stage at every
radius; (b) `1 − a` is a unit for `|a|_sup < 1`; (c) `a` is a unit iff its image in `Â` is ([GK00]
§1, 1.9). Lean: `Dagger.isUnit_iff_isUnit_completion`.

**Finite extensions.** (*dagger-finite-extension*) A finite `A`-algebra `B` is a dagger algebra;
with `A = W_n/I`, `B = (W_n/J)[X]/(f)`, `B ≅ W_{n+1}/(J + f)` with stages `T_{n+1}(λ)/(J + f)`
([GK00] §1, Lem. 1.10). Lean: `Dagger.IsDaggerAlgebra.of_finite`.

**Morphisms are detected on completions.** (*dagger-finite-morphism-comparison*) For `φ : A → B`:
(a) `φ` is surjective (bijective) iff `φ̂` is; (b) `φ` finite ⟺ `φ̂` finite ⟺ the reduction `Ã → B̃`
finite (*affinoid-reduction-finite*); (c) for finite `φ`, injectivity is detected on `φ̂`; (d) then
the norm of `B` is its finite-module norm and `Â ⊗_A B ≅ B̂`; (e) `φ` and `φ̂` are strict ([GK00]
§1, Thm. 1.12, pp. 7–8; strictness of `φ̂` is Tau Ceti's `LinearMap.isStrictMap_of_module_finite`).

**Approximation.** (*dagger-approximation*) Assume `char K = 0` or `[K : K^p] < ∞`. (1) Solutions in
the unit ball of `Â` of equations from `A⟨Y⟩†` are approximated by solutions in `A`; (2) maps of
completed surjections lift to maps of dagger algebras approximating them, isomorphisms to
isomorphisms; so dagger algebras with isomorphic completions are isomorphic ([GK00] §1, Prop. 1.13,
Lem. 1.15, pp. 8–9; [Vezzani] §2, Prop. 2.8, p. 5). Checks: `ℚ` and `𝔽_p` satisfy the hypothesis,
and `𝔽_2(t)` does with `[K : K²] = 2` though imperfect.

**Integral closure and domains.** (*dagger-domain-and-integral-closure*) Under the hypothesis of
*dagger-approximation*: (1) a reduced `A` is integrally closed in `Â`; (2) `A` is a domain iff `Â`
is (`⇐` always) ([GK00] §1, Prop. 1.14(1)). Checks: `W_d[Y]/(Y² − g)`; `A = 0` and `A = K`.

### F1.3 fringe presentations and the fringe topology

**Fringe presentations.** (*fringe-presentation*) A fringe presentation of `A` is `n`, `ρ_0 ∈ Γ*`,
`ρ_0 > 1`, `f_1, …, f_r ∈ T_n(ρ_0)` and `W_n/(f) ≅ A`; for `ρ ∈ Γ* ∩ (1, ρ_0]` the stages
`A_ρ = T_n(ρ)/(f)` with transition maps have `A = colim A_ρ`, `A_1 = Â`, `Sp Â = ⋂ Sp A_ρ` (a
Weierstrass domain in each); fringe algebras are the images of the stages. Every dagger algebra has
one, two of them are cofinal, and for reduced `A`, `A⁺ = colim A_ρ°` gives a Huber pair whose
completion is the universal compactification of `Sp Â` ([GK00] §1, Lem. 1.8, p. 6; [Vezzani] A.14,
A.22). Checks: `W_n` has stages `T_n(ρ)`; `K` has stages `K`; with generators `X` and
`g = (1 − πX²)^{-1}` of `W_1` the fringe algebra at `|π|^{-1/2} < ρ < |π|^{-1}` contains
`g ∉ T_1(ρ)`; the stages of the annulus are `ρ^{-1} ≤ |X| ≤ ρ`; for `X − c`, `|c| > 1`, `A = 0`
while stages near `ρ_0` are `K`.

**Morphisms respect fringe systems.** (*fringe-morphism-factorisation*) For `ψ : A → B` and fringe
presentations, each `A_λ → B` factors through some `B_{λ'}`; finitely many fringe algebras lie in a
common one, and two presentations give cofinal ind-systems ([GK00] §1, Lem. 1.8).

**The fringe topology.** (*fringe-topology*) The finest nonarchimedean locally convex topology
making all `A_ρ → A` continuous; independent of the presentation, Hausdorff, finer than the affinoid
topology, making all morphisms continuous, extended to finite modules by quotients; for spherically
complete `K` it is complete and reflexive ([GK00] §4, 4.2, p. 19). Checks: on `K` the valuation
topology; on `W_1` strictly finer than the Gauss norm (`Σ_{m≤N} pᵐX^{pᵐ}` is not Cauchy for
`q(f) = sup |a_k| p^{√k}`); truncations of `f ∈ T_1(ρ)` converge.

**Descent to a fringe stage.** (*fringe-module-descent*) Finite `A`-modules and their maps descend
to some stage `A_ρ` (isomorphisms to isomorphisms), and isomorphy and exactness are detected at a
smaller radius ([GK00] §2, Lem. 2.15(1)–(2), pp. 12–13).

### F1.4 tensor products and rational localisation

**The dagger tensor product.** (*dagger-tensor-product*) For `B → A_1`, `B → A_2`, `A_1 ⊗†_B A_2` is
the image of `W_{n_1+n_2}` in `Â_1 ⊗̂_{B̂} Â_2`: a dagger algebra, the pushout in dagger algebras,
with completion `Â_1 ⊗̂_{B̂} Â_2`, equal to `A_1 ⊗_B A_2` when `A_2` is finite over `B`, the colimit
of completed tensor products of fringe algebras ([Kedlaya06] §2.3, Def. 2.3.8), with
`W_n ⊗†_K W_m = W_{n+m}`, and `A_1 → A_1 ⊗†_K A_2` flat for MW-type factors ([Kedlaya06] Rem. 2.3.9
with its errata) ([GK00] §1, 1.16, p. 9). Notation `A⟨λ^{-1}Z⟩† = A ⊗†_K K⟨λ^{-1}Z⟩†`. Checks:
`A ⊗†_A A = A`; `Σ π^ν X^{ν²} Z^ν` has coefficients decaying at each fixed radius but is not in
`K⟨X, Z⟩†`, so the naive definition fails; `W_n ⊗†_K L = L⟨X⟩†` for finite `L/K`; the fold
`W_1 ⊗† W_1 → W_1` identifies the coordinates.

**Rational localisation.** (*dagger-rational-localisation*) For `g, f_1, …, f_m ∈ A` generating the
unit ideal, `A⟨f/g⟩† = A⟨X⟩†/(gX_i − f_i)` is universal among `φ : A → C` with
`|φ(f_i)(y)| ≤ |φ(g)(y)|` at every point `y ∈ Sp C` (pointwise, not via supremum norms); its points
are `R(f/g)`, its completion is the affinoid localisation `Â⟨f/g⟩`, it depends only on `R(f/g)`, is
flat over `A` and is transitive ([GK00] §1, 1.18, p. 9). Checks: `W_1⟨X^{-1}⟩† = K⟨X, X^{-1}⟩†`,
with completion Tau Ceti's rational localisation of `(K⟨X⟩, K°⟨X⟩)`; `1/(X − a)`, `0 < |a| < 1`, is
in it but not in `W_1[1/X]`; the identity of `W_1` does not factor through `W_1⟨X/π⟩†`;
`g = f_1 = 1` gives `A`; `πZ − 1` is invertible over `K`, an empty Laurent domain.

### F1.5 weak completions and algebras of Monsky–Washnitzer type

**The integral Monsky–Washnitzer algebra.** (*integral-overconvergent-tate-algebra*)
`O_K⟨X⟩† := W_n ∩ O_K[[X]] = W_n^int`; for `O_K` a DVR, `f ∈ O_K⟨X⟩†` iff `f = Σ π^j P_j` with
`P_j ∈ O_K[X]` of degree `≤ c(j + 1)`; then `O_K⟨X⟩†/πᵐ = (O_K/πᵐ)[X]`, its `π`-adic completion is
`O_K⟨X⟩`, `1 + πf` is a unit, and `O_K⟨X⟩† ⊗ K = W_n` ([vdP] §2, p. 35). Checks:
`Σ π^jX^j ∈ O_K⟨X⟩†`; `n = 0` gives `O_K`; `Σ π^jX^{j²}` is in the completion but not in `O_K⟨X⟩†`;
`Σ Xᵐ` has integral coefficients and is not overconvergent; `π^{-1} ∉ O_K`. Lean:
`Dagger.intWashnitzerAlgebra`.

**`O_K⟨X⟩†` is noetherian.** (*integral-overconvergent-noetherian*) For a complete DVR `O_K`,
`O_K⟨X_1, …, X_n⟩†` is noetherian ([Kedlaya06] §2.4, after Lem. 2.4.1; [vdP] §2, (2.2), p. 36); weak
completions inherit this by passing to quotients. Checks: `(π, X)` and `(X − π)` are finitely
generated with `O_K⟨X⟩†/(X − π) = O_K`. Lean: `Dagger.intWashnitzerAlgebra.isNoetherianRing`.

**Weak completion.** (*weak-completion*) For `O_K` a complete DVR (any characteristic) and `S` a
finitely generated `O_K`-algebra with generators `x`, `S† ⊆ Ŝ = lim S/π^mS` is the set of
`Σ π^j P_j(x)` with `deg P_j ≤ c(j + 1)`, the image of `O_K⟨X⟩† → Ŝ`; it is a subalgebra containing
`S`, independent of the generators, functorial, with `O_K[X]† = O_K⟨X⟩†` and `S → S†` injective iff
`⋂ π^mS = 0` ([Kedlaya01] §2, p. 2). Checks: `O_K[z, z^{-1}]† = O_K⟨z, w⟩†/(zw − 1)`; for `S` finite
over `O_K`, `S† = Ŝ = S`; `Σ π^jX^{j²} ∈ Ŝ ∖ S†`; in mixed characteristic `Σ pⁿX^{pⁿ−1}dX` is a
limit of exact forms on `Ŝ` but not exact, while on `S† ⊗ K` every `1`-form is exact; the parameter
`0` gives `S` and `1` gives `0`, so uniformiser assertions assume `π` irreducible; `O[1/π]† = 0`.
Lean: `Dagger.piAdicCompletion`, `Dagger.weakCompletionSet`, `Dagger.weakCompletion`,
`Dagger.coe_weakCompletion`, `Dagger.algebraMap_mem_weakCompletion`, `Dagger.weakCompletion.of`.

**Presentation and noetherianity.** (*weak-completion-presentation*) For `S = O_K[X]/I`: (a)
`S† ≅ O_K⟨X⟩†/I`; (b) `S†` is noetherian; (c) `S†/π^mS† ≅ S/π^mS`; (d) `π` is in the Jacobson
radical, `S†` is `π`-adically separated with completion `Ŝ`; (e) `S† → Ŝ` is faithfully flat ([vdP]
§2, (2.1)–(2.2), pp. 35–36). Lean: `Dagger.weakCompletion.isNoetherianRing`.

**Universal property.** (*weak-completion-universal-property*) `B` is weakly complete finitely
generated if `B ≅ O_K⟨Y⟩†/J`. `S†` is such, and every `O_K`-algebra map `S → B` into such `B`
extends uniquely to `S†`, so `S ↦ S†` is a functor and left adjoint ([vdP] §2, (2.1)). Checks: `O_K`
and `k` are weakly complete; `O_K[X]` is not (`1 − πX` is not a unit). Lean:
`Dagger.IsWeaklyCompleteFG`, `Dagger.weakCompletion.existsUnique_lift`.

**The generic fibre is a dagger algebra.** (*weak-completion-generic-fibre*) For `S = O_K[X]/I`,
`A† = S† ⊗ K ≅ W_n/I` is a dagger algebra with completion `Ŝ ⊗ K`; the image of `S†` lies in
`(A†)^int`, `S† → A†` is injective for flat `S`, and `S† = (A†)^int` if moreover `S/πS` is reduced;
for smooth `S`, `A†` is of MW-type with reduction `S/πS` ([GK02] Introduction). Checks: `O_K` gives
`K`; the residue field gives `0`. Lean: `Dagger.weakCompletion.genericFibre`,
`Dagger.weakCompletion.isDaggerAlgebra_genericFibre`.

**Dagger algebras of Monsky–Washnitzer type.** (*mw-type-dagger-algebra*) `A` is of MW-type if it is
regular and `A^int/πA^int` is a smooth `k`-algebra (regularity is part of the definition, per
[Kedlaya06] Def. 3.2.1 with its errata). Then the reduction equals `A^int/{|·|_sup < 1}`, `A` is
reduced, `Ω¹_A` is finite projective of rank the dimension of the reduction, Laurent localisations
at elements with non-nilpotent reduction are of MW-type, `W_n` has reduction `k[X]`, and `S† ⊗ K` is
of MW-type for smooth `S` ([Kedlaya06] §3.2, Def. 3.2.1). Checks: `K` has reduction `k`; the annulus
has reduction `k[x, y]/(xy − 1)`; `W_1/(X²)` has reduction `k` but is not regular; `W_1[Y]/(Y² − π)`
is regular with non-reduced reduction `k[ε, X]/(ε²)`; `W_2/(Y² − πX)` has `|Y|_sup < 1` but
`Y ∉ πA^int`, consistent with not being MW-type. Lean: `Dagger.IsMWType`,
`Dagger.IsMWType.projective_differentials`, `Dagger.IsMWType.of_smooth`.

**Lifting morphisms of smooth reductions.** (*mw-morphism-lifting*) For `O_K` of mixed
characteristic `(0, p)` and flat weakly complete lifts `A`, `C` of smooth `k`-algebras `A_0`, `C_0`
(with scalar-compatible identifications `A/π ≅ A_0`), every `k`-map `A_0 → C_0` lifts to `A → C`,
and maps `A → Ĉ` are approximated modulo every `π^m` ([vdP] §2, (2.4.4)(ii), p. 37); the level-wise
lifts are Mathlib's `Algebra.FormallySmooth.lift`. Checks: `O_K` lifts `k`, `O_K⟨X⟩†` lifts `k[X]`,
`k` does not lift `k`; composing the identification with Frobenius of `𝔽_4` breaks scalar
compatibility.

**The integral subring of an MW-type algebra is a lift.** (*mw-type-integral-lift*) For mixed
characteristic `O_K` and `A` of MW-type there are a smooth finitely generated `O_K`-algebra `S` with
`S/πS ≅ A_0` and `A ≅ S† ⊗ K` carrying `A^int` onto `S†`, compatibly with the structure maps; so `A`
is of MW-type iff it is `S† ⊗ K` for smooth `S`, and MW-type algebras with isomorphic reductions are
isomorphic ([Kedlaya06] §3.2, after Def. 3.2.1). Checks: `W_n` with `S = O_K[X]`; `K⟨X, X^{-1}⟩†`
with `S = O_K[X, X^{-1}]`.

**Existence and uniqueness of lifts.** (*mw-lift-existence-uniqueness*) For mixed characteristic
`O_K` and smooth `A_0`: a smooth `B` with `B/πB ≅ A_0` exists (Elkik), `B†` is a lift and `B† ⊗ K`
is of MW-type, and two lifts are isomorphic ([vdP] §2, p. 35, and Thm. (2.4.4)(i), p. 37).

### F1.6 affinoid dagger spaces

**Affinoid subdomains of a dagger algebra.** (*dagger-affinoid-subdomain*) `U ⊆ Sp A` is an affinoid
subdomain if some `A → B` with image in `U` is universal among dagger algebras `D` with
`Sp D → Sp A` landing in `U` (*affinoid-subdomain* with dagger algebras). Then `B` is unique,
`Sp B → U` is bijective, rational and Weierstrass domains qualify with `B = A⟨f/g⟩†`, and the notion
is transitive, stable under intersection (`O(U) ⊗†_A O(V)`), preimage and flat ([GK00] §2, 2.1, p.
9). Checks: `{|X| ≤ |π|} ⊆ Sp W_1` with `W_1⟨X/π⟩† ≅ K⟨Y⟩†`; `Sp A` and `∅`; the open disc is not an
affinoid subdomain (maximum modulus); rational domains are the classical points of Tau Ceti's
`ValuationSpectrum.rationalSubset` of `Spa(Â, Â°)`; the dagger analogue of BGR 7.2.2/1 via `A/m^k`.

**Runge immersions.** (*rigid-locally-closed-immersion-runge*) A locally closed immersion of
affinoid rigid spaces `Sp D → Sp E` becomes, over a finite rational covering of `Sp E`, a closed
immersion into a Weierstrass domain ([BGR] 7.3.5/1, as used in [GK00] §2, proof of Prop. 2.5, p.
10). Gerritzen–Grauert is derived from it in [BGR], so it is not an input. Checks:
`{|X| ≥ |π|} ⊆ Sp K⟨X⟩` is Runge over `{|X| ≥ |π|²}`, `{|X| ≤ |π|²}` but not over `{|X| ≥ |π|}`,
`{|X| ≤ |π|}` (the circle is not Runge in its disc).

**Comparison with completions.** (*dagger-affinoid-subdomain-completion*) (a) If `A → B` defines
`U`, `Â → B̂` defines `U` in `Sp Â`; (b) local rings of `Sp A` and `Sp Â` agree, so open, locally
closed and Runge immersions are detected on completions; (c) a locally closed immersion of `Sp Â` is
Runge over a finite rational covering with `f_i, g_i ∈ A` ([GK00] §2, 2.2, 2.4, Prop. 2.5, pp.
10–11).

**Tate acyclicity.** (*dagger-tate-acyclicity*) For any `A`-module `M` and a finite cover of `Sp A`
by affinoid subdomains, the augmented Čech complex of `U ↦ O(U) ⊗_A M` is exact ([GK00] §2, Prop.
2.6, p. 11). Checks: for the cover by two copies of `Sp A` the differential sends `(1⊗3, 1⊗7)` to
`1⊗4`.

**The G-topology.** (*dagger-g-topology*) `A → B` defines an affinoid subdomain iff `Â → B̂` does;
with the G-topology of `Sp Â`, affinoid subdomains of `Sp A` form a basis, admissible coverings of
affinoid subdomains have finite affinoid refinements, and rational subsets of `Spa(Â, Â°)` are
`R(f/g)` with `f, g ∈ A` ([GK00] §2, 2.7). Checks: the empty cover covers `∅`; the open unit disc is
admissible but `{|X| < 1}`, `{|X| = 1}` is not an admissible cover of the closed disc; sections on
the disc, its rational point and `∅` are `W_1`, `K`, `0`.

### F1.7 dagger spaces, coherent modules and strict neighbourhoods

**Dagger spaces.** (*dagger-space*) A `K`-dagger space is a quasi-separated rigid space `X`
(*rigid-analytic-space*) with a subsheaf `O†_X ⊆ O_X` such that `X` has an admissible affinoid cover
by `Sp Â_U` with dagger algebras `A_U` and `O†(R(f/g)) = A_U⟨f/g⟩†`; morphisms are rigid morphisms
with `φ^♯(O†) ⊆ φ_*O†` ([GK00] §2, 2.12, p. 12, in the form of [Vezzani] 2.22). Equivalently a
quasi-separated adic space locally of finite type over `Spa K` with such a subsheaf
(*rigid-adic-comparison-functor*). Constructions: `Sp A` with `Γ(Sp A, O†) = A` and
`Hom(Sp B, Sp A) = Hom_K(A, B)`, open subspaces, fibre products glued from `Sp(A_1 ⊗†_B A_2)`,
finite base change, the closed disc `Sp K⟨X⟩†` and the open disc `⋃_{ε<1} Sp K⟨ε^{-1}X⟩†`;
`O†_x → O_x` is an isomorphism at classical points. Checks: `Γ(D, O†) = K⟨X⟩† ⊊ K⟨X⟩`; `Sp K` is a
point and `Sp 0` empty; `O_X` itself is not a dagger structure on the disc (Noether normalisation
would make `W_1 → T_1` bijective); endomorphisms of `Sp W_1` are elements of `O_K⟨X⟩†` ([Vezzani]
Prop. 2.14).

**Coherent modules.** (*dagger-coherent-module*) `M ⊗ O†` on `Sp A` (exact); `F` is coherent if
locally `M_i ⊗ O†` with `M_i` finite; coherent modules form an abelian category closed under
extensions, `⊗`, `Hom` and pullback; coherent ideals are closed dagger subspaces;
`F ↦ F' = O_{X'} ⊗ F` is a faithful exact functor to coherent sheaves of the rigid space
(*coherent-sheaf*) ([GK00] §2, 2.14, p. 12). Checks: `W_1/(X) ⊗ O†` is the skyscraper `K` at the
origin; `0` and `O†`; `j_*O†_{D^0}` on the closed disc and `⊕_ℕ O†` are not coherent;
`(M ⊗ O†)' = (M ⊗_A Â) ⊗ O`.

**Dagger Kiehl.** (*dagger-coherent-affinoid-kiehl*) On `Sp A`, `M ↦ M ⊗ O†` is an equivalence from
finite `A`-modules to coherent `O†`-modules with inverse `Γ` ([GK00] §2, Thm. 2.16, p. 13).

**Theorems A and B.** (*dagger-coherent-theorem-b*) Coherent modules on `Sp A` are globally
generated with `H^n = 0` for `n ≥ 1` ([GK00] §3, Prop. 3.1, p. 17).

**Strict neighbourhoods.** (*strict-neighbourhood*) For `U ⊆ W` admissible with admissible
complement, `V` is a strict neighbourhood if `{W − U, V}` is an admissible covering, equivalently
`Ū ⊆ V` in the adic space ([Vezzani] Rem. 2.7, p. 4); `Sp A ⊂† Sp B` means `Sp Â ⊂† Sp B̂`. Strict
neighbourhoods are stable under intersection, enlargement, preimage and transitive through
quasi-compact intermediates, and for a fringe presentation `Sp(T_n(ρ)/I)`, `ρ > 1`, are cofinal
among strict neighbourhoods of `Sp(T_n/I)` ([GK00] §2, 2.21–2.22, p. 15). Strict neighbourhoods of
tubes belong to rigid cohomology. Checks: `{|X| ≤ ρ}` around the unit disc; `W` around any
quasi-compact `U`; for `U = ∅` every `V`, for `U = W` only `W`; the closed unit disc is not a strict
neighbourhood of itself (the rank-two point `|X| = 1⁺`).

**Overconvergent sections.** (*overconvergent-sections-formula*) For `X = Sp A` with `X' ⊂† Y` of
fringe type and `F` coherent descended to `G` on `Y`, `Γ(X, F) = colim_V Γ(V, G)` over strict
neighbourhoods, in particular `A = colim_ρ Γ(Sp(T_n(ρ)/I), O)` ([GK00] §2, 2.23); the identification
is the one from the descent, not any rigid trivialisation.

**Partially proper, proper and Stein.** (*dagger-partially-proper*) `U ⊂⊂_Y X` if `U` lies in
`{|τ(X_i)| ≤ ε}` for a presentation `τ : B⟨X⟩† ↠ A` and `ε ∈ Γ*`, `ε < 1`; `f` is partially proper
if separated with such relatively compact local coverings, proper if moreover quasi-compact; `X` is
Stein if it has an admissible exhaustion `U_i ⊂† U_{i+1}` ([GK00] §2, 2.24, p. 15). Partially proper
dagger morphisms have partially proper rigid underlying morphisms (*partially-proper-morphism*,
*proper-separated-comparisons*; the converse is not claimed), compositions and base changes are
partially proper, Stein spaces are partially proper, interiors `T ∩ (D^0)^m` are Stein. Checks: the
open disc is Stein; identities and `Sp K` are proper; the closed disc is not partially proper
([Vezzani] A.2); dagger analytifications of `K`-schemes are partially proper.

### F1.8 the dagger–rigid comparison

**The comparison functor.** (*dagger-to-rigid-functor*) `(X, O†) ↦ X` is faithful with
`ν : O† ⊆ O_{X'}`, `(Sp A)' = Sp Â` with adic space `Spa(Â, Â°)`; `X` and `X'` have the same
G-topology and local rings at classical points; connectedness and regularity (and for `char K = 0`
normality and reducedness) agree; closed, open and locally closed immersions, isomorphisms,
quasi-compactness and separatedness are detected on `(·)'`, finiteness is preserved; quasialgebraic
rigid spaces have local dagger models unique up to isomorphism ([GK00] §2, Thm. 2.19, 2.20, p. 14).
Checks: `X ↦ X + a` with `a ∈ K⟨X⟩ ∖ K⟨X⟩†`, `|a| < 1`, is a rigid automorphism of the disc not
preserving `O†`, so `(·)'` is not full; `ν` is bijective on stalks of the disc though not on global
sections.

**Coherent modules on partially proper spaces.** (*partially-proper-coherent-equivalence*) For `X`
partially proper and quasi-separated, `(·)'` is an equivalence on coherent modules with
`Γ(X, M) = Γ(X', M')` ([GK00] §2, Thm. 2.26, pp. 15–16). Checks: the open disc, against the closed
disc where `K⟨X⟩† ≠ K⟨X⟩`.

**Partially proper dagger spaces are partially proper rigid spaces.**
(*partially-proper-dagger-rigid-equivalence*) `(·)'` is an equivalence between dagger spaces
partially proper over `Sp K` and partially proper rigid spaces ([GK00] §2, Thm. 2.27, p. 16;
[Vezzani] Ex. 2.23). Checks: the open disc and `𝔸^{1,an}` have unique dagger structures; the closed
disc does not (only up to non-canonical isomorphism).

**Coherent cohomology.** (*dagger-coherent-cohomology-comparison*) For `X` partially proper and `F`
coherent, `H^i(X, F) = H^i(X', F')`, vanishing for `i > 0` on Stein spaces ([GK00] §3, Thm. 3.2, p.
17; *quasi-stein-theorems-a-b*). Checks: `H^i(D^0, O†) = 0`.

**Dagger analytification.** (*dagger-analytification*) For `X` of finite type over `K`, `X^†` is the
partially proper dagger space with `(X^†)' = X^an` (*rigid-analytification*), functorial, compatible
with immersions and fibre products, `X^† = ⋃_ρ Sp(K⟨ρ^{-1}X⟩†/(f))` for affine `X`, with GAGA for
proper `X` (*proper-gaga*) ([GK00] §3, 3.3, p. 18; [GK02] §0, p. 3). Checks: `Γ((𝔸¹)^†, O†)` are the
entire series; `(Spec L)^† = Sp L`; `(𝔸¹)^†` is not affinoid; `H^1((ℙ¹)^†, O(−2))` is
one-dimensional.

**Identity principle.** (*dagger-identity-principle*) On a dagger space with `X'` connected and
normal, a section of `O†` or of a locally free module vanishing on a nonempty open vanishes, by
*rigid-identity-principle* transported along `(·)'` ([Conrad-IC] §2.1, Lem. 2.1.4, p. 12; [GK00]
Thm. 2.19(2)–(3)).

### F1.9 differentials and the overconvergent de Rham complex

**Differentials of a dagger algebra.** (*dagger-differentials*) `Ω¹_A` is the finite `A`-module with
universal `K`-derivation among derivations into finite modules: Mathlib's `KaehlerDifferential`
modulo the submodules with finite quotient; for `A = W_n/(f)`, `Ω¹_A = ⊕ A dX_i/(Σ ∂f_k/∂X_j dX_j)`,
equivalently `J/J²` for the diagonal of `A ⊗†_K A` ([Kedlaya06] §3.1, Def. 3.1.2); `Ω^i = ⋀^i Ω¹`
with `d(a db_1 ∧ … ∧ db_q) = da ∧ db_1 ∧ … ∧ db_q`, `d ∘ d = 0`; compatible with completion
(*continuous-differentials*), rational localisation and `A⟨T⟩†`; projective for regular `A` in
characteristic `0` ([GK00] §4, 4.1, p. 19; [GK02] §1, 1.2, p. 5). Checks: `d(c) = 0`; in `W_2`,
`d(X dY) = dX ∧ dY` and `d(Y dX) = −dX ∧ dY`; `Ω¹` of the annulus is free on `dX`; `Ω¹_L = 0` for
finite separable `L/K`; for `char K = 0` with residue characteristic `p`, `exp(λ_i X)` with
`|λ_i| < |p|^{1/(p−1)}` and `λ_i` independent over `ℚ` make Mathlib's `KaehlerDifferential` of `W_1`
non-finite; for `A = W_2/(Y² − X³ − 1)` (`char K ≠ 2, 3`) `Ω¹_A` is projective of rank `1`; in
characteristic `2` the regular curve `Y² = a + X³` (`a` a nonsquare) has non-projective `Ω¹`. Lean:
`Dagger.Omega`, `Dagger.Omega.d`, `Dagger.Omega.existsUnique_lift`, `Dagger.Omega.washnitzerBasis`,
`Dagger.Omega.projective_of_isRegularRing`.

**Smooth dagger spaces.** (*dagger-smooth-space*) `X` is smooth if `X'` is smooth over `K`
(*smooth-morphism*), equivalently every affinoid `Sp A` has `A` regular with `Ω¹_A` projective of
rank the local dimension, equivalently locally étale over dagger polydiscs ([Vezzani] §3, Prop.
3.6); then `Ω¹_X` is locally free of rank `n` and `ω_X = Ω^n_X`; opens, products, `X^†` for smooth
`X` and `Sp(S† ⊗ K)` for smooth `S` are smooth ([GK00] §4, 4.1, p. 19; [GK02] §1, 1.2, p. 5).
Checks: `Sp W_n` is smooth of dimension `n`; `Sp K` and `Sp L`; `Sp(K⟨X, Y⟩†/(XY))` and
`Sp(W_1/(X²))` are not.

**The de Rham complex.** (*dagger-de-rham-complex*) For smooth `X` and a coherent module with
integrable connection `(E, ∇)`, `DR(E) = E ⊗ Ω^•_X`, `H^i_dR(X, E) = H^i(X, DR(E))`; on affinoids
this is the cohomology of `Γ(E) ⊗ Ω^•_A`; `DR(E)' = DR(E')`, but `H_dR(X) ≠ H_dR(X')` in general;
with tensor products, pullbacks and the map to `H_dR(X', E')` ([GK00] §4, 4.1, 4.8, pp. 19, 21; for
MW-type affinoids this is Monsky–Washnitzer cohomology, [Kedlaya01] §2, p. 3). For `char K = 0`,
`H^0_dR(X)` is the functions that become locally constant over `K̄` (`K` for geometrically connected
`X`, `L` for `Sp L`). Checks: for the closed dagger disc `H^0 = K`, `H^1 = 0`; for the rigid disc
over `K ⊇ ℚ_p`, `Σ pⁿX^{pⁿ−1}dX` is not exact and `H^1_dR` is infinite-dimensional; the dagger
annulus has `H^1 = K·dX/X`; `Sp 0` has `H^0 = 0`; in characteristic `p`, `X^{p−1}dX` gives `H^1 ≠ 0`
and `X^p` is closed. Lean: `Dagger.Omega.poincare_washnitzer` (degrees `0` and `1` on the polydisc);
the complex and its cohomology are README only.

**Polyannuli and the relative Poincaré lemma.** (*dagger-polyannulus-de-rham-cohomology*) For
`char K = 0`, `0 ≤ r ≤ n` and `μ, γ_i, δ_i ∈ Γ*` with `γ_i ≤ δ_i` and `∏_{i≤r} δ_i ≥ μ`, the dagger
polyannulus `V = {∏_{i≤r}|x_i| ≥ μ, |x_i| ≤ δ_i, |x_i| ≥ γ_i (i ≤ r)}` has `H^q_dR(V)` with basis
`dlog x_{i_1} ∧ … ∧ dlog x_{i_q}`, `i_1 < … < i_q ≤ r`, and Künneth with any smooth `X` is
bijective; the same holds for the open version with strict inequalities and `∏ δ_i > μ` (the printed
`∏ δ_i < μ` would make it empty), as dagger and as rigid spaces ([GK02] §2, Lem. 2.1(a), p. 15; the
proof uses only `char K = 0`). Checks: `r = 0` gives `H^0 = K`, `H^{>0} = 0`; over `ℚ_p` the
primitive of `Σ pᵐXᵐ` stays overconvergent (`|pᵐ/(m+1)| ≤ (m+1)p^{-m}`); `n = 0` gives `K`; in
characteristic `p` both clauses fail; `γ = 1`, `δ = |π|^{-1}`, `μ = |π|^{-2}` gives `V° = ∅`. Lean:
`Dagger.Omega.poincare_washnitzer` (the polydisc in degrees `0` and `1`); the rest README only.

**Comparison for partially proper spaces.** (*dagger-rigid-de-rham-comparison*) For smooth partially
proper `X`, `H^i_dR(X) ≅ H^i_dR(X')`; partial properness is needed (the closed disc) ([GK00] §3,
3.3, p. 18; [GK02] §0, p. 3, and Introduction, p. 1). Checks: `H^1_dR(D^0) = 0` on both sides;
`(𝔸¹)^†` agrees with algebraic de Rham cohomology.

**Invariance under rigid isomorphisms.** (*dagger-de-rham-rigid-invariance*) For `char K = 0` and
smooth `X_1, X_2`, an isomorphism `X_1' ≅ X_2'` of rigid spaces induces `H^*_dR(X_2) ≅ H^*_dR(X_1)`;
compatibility with composition is not claimed ([GK02] §1, Lem. 1.18 and its proof, pp. 14–15).
Checks: `X ↦ X + a` on the disc.

**Strict differentials.** (*dagger-strict-differentials*) For `K = Frac(R)`, `R` a complete DVR of
mixed characteristic, and `X` smooth affinoid (or smooth Stein with finite-dimensional de Rham
cohomology), every `d^i` on global forms is strict with closed image for the fringe (resp. Fréchet)
topology ([GK00] §4, Lem. 4.7, p. 21, with its footnote). Checks: `d : W_1 → W_1 dX` is surjective;
on the rigid disc the image of `d` is not closed.

### F1.10 supports, compact support and duality

**De Rham cohomology with supports.** (*de-rham-cohomology-with-supports*) For smooth `X`, an
admissible open `U` and `Y = X − U`, `Γ_Y(F) = ker(F → j_*j^{-1}F)` and
`H^i_Y(X, Ω^•) = H^i(X, RΓ_Y Ω^•)`, with the triangle `RΓ_Y → RΓ → RΓ(U) →`, Mayer–Vietoris, the
nested triangle for `Z ⊆ Y`, functoriality, `H_∅ = 0`, `H_X = H_dR`, and excision for strict
neighbourhoods of `Y` (which fails without admissibility) ([GK02] §1, 1.15, p. 11; [GK00] §4, 4.8,
p. 21). Checks: for `char K = 0`, the unit disc `Y` in `X_ρ = {|x| ≤ ρ}` has `H^0_Y = H^1_Y = 0` and
`H^2_Y = K·dx/x`, while `H^0_dR(Y) = K`, so `H_Y(X)` is not the cohomology of `Y`; the connecting
map of the cone convention sends two entries `a, b` to `−a − b`.

**Algebraic local cohomology, Gysin.** (*dagger-local-cohomology-comparison*) For `char K = 0`,
smooth `X` and a closed `Y` with coherent ideal `J`: (a) with `RΓ*_Y E = colim RHom(O/J^n, E)` on
`D_X`-modules, `RΓ(X, DR(RΓ*_Y O)) → RΓ_Y(X, Ω^•)` is an isomorphism ([GK02] §1, 1.5, 1.8, Prop.
1.16(a), pp. 5, 7, 11–12); (b) for `Y` smooth of pure codimension `d`,
`H^i_Y(X, Ω^•) ≅ H^{i−2d}_dR(Y)` ([GK02] Prop. 1.10, p. 7). Checks: a rational point of `D^n` has
`H^{2n}_Z = K` and no other.

**Trace for `X × Y → Y`.** (*dagger-proper-projection-trace*) For `X` smooth proper of dimension `n`
and `Y` smooth (rigid: `char K = 0`; dagger: `K = Frac(R)` mixed characteristic), there is a trace
`p_+ O_Z[n] → O_Y` and traces on supported complexes, isomorphisms when `S → X × T → T` is an
isomorphism ([GK02] §1, Prop. 1.11 and proof, pp. 8–10). Checks: `X = Sp K` gives the identity; for
`ℙ¹` the trace on `H^2` is the residue.

**Independence of the embedding.** (*dagger-hdr-embedding-independence*) For `K = Frac(R)` mixed
characteristic and closed immersions `Z → Y_i` into smooth affinoids of dimensions `n_i`,
`RΓ(Y_1, DR(RΓ*_Z O))[2n_1] ≅ RΓ(Y_2, DR(RΓ*_Z O))[2n_2]`, so `h^dR_q(Z) := dim H^{2n−q}_Z(Y, Ω^•)`
depends only on `Z` ([GK02] §1, Cor. 1.12, 1.13, p. 10). Checks: a rational point has `h_0 = 1`,
`h_q = 0` otherwise, in `D¹` and in `D²`; `∅` gives `0`; the disc in itself has `h_2 = 1`.

**Compact supports.** (*compact-support-de-rham*) For `X = Sp A` with fringe stages `X_ρ` and `F`
coherent descended to `F_{ρ_0}`, `H^i_c(X, F) := H^i_X(X_{ρ_0}, F_{ρ_0})` and
`H^i_{dR,c}(X) := H^i_X(X_ρ, Ω^•)`, independent of choices, with the support long exact sequence,
extension by zero for `U ⊂† X`, vanishing outside degree `n` for locally free `F` on smooth `X`, a
topological `A`-module structure, and the colimit version on Stein spaces; for `A = K⟨T⟩†`,
`H^m_c(ω)` is the negative-exponent series with `η^{-|μ|}|a_μ| → 0` for every `η > 1` ([GK00] §4,
4.3, 4.8, pp. 19–21; proof of Thm. 4.11, p. 22). Checks: for `char K = 0` the closed dagger disc has
`H_{dR,c} = (0, 0, K)` (`d` on negative Laurent series misses exactly `dx/x`), while a single rigid
fringe disc has no dagger Poincaré lemma; `Sp K` has `K` in degree `0`; the annulus has `(0, K, K)`;
`H_{dR,c}(D) ≠ H_dR(D)`.

**Serre duality.** (*dagger-serre-duality*) For `K` spherically complete and smooth affinoid `X` of
dimension `d`, `F` coherent: functorial perfect pairings `Ext^i(F, ω_X) × H^{d−i}_c(X, F) → K` with
topological isomorphisms to continuous duals ([GK00] §4, Thm. 4.4, p. 20; 4.2, p. 19). Checks: on
the disc `K⟨T⟩† dT` is dual to `H^1_c(D, O)` by extracting the coefficient of `T^{-1}dT` with
positive sign (`b + cT` pairs to `ba_0 + ca_1`); the single pole of growing order tends to zero, the
constant residue does not; `K` in dimension `0`.

**Poincaré duality.** (*dagger-poincare-duality*) For `K = Frac(R)` mixed characteristic: (a) for
`X` smooth affinoid of dimension `n`, `H^i_dR(X) ≅ Hom_cont(H^{2n−i}_{dR,c}(X), K)` and conversely,
a perfect duality of finite-dimensional spaces; (b) the same for smooth Stein `X` with
finite-dimensional de Rham cohomology ([GK00] §4, Thms. 4.9, 4.11, Lem. 4.6, 4.8, 4.10, pp. 21–22).
Checks: the disc (`K` against `K` in degree `2`); the annulus (`K·dx/x` against `K`); two cofinal
Stein exhaustions give the same colimit.

### F1.11 finiteness

**Resolution.** (*dagger-resolution-lemma*) For `char K = 0` and a nowhere dense closed `Z` in
smooth affinoid `X`, there is a proper surjective `g : X̃ → X` with `X̃` smooth, `g^{-1}(Z)`
(reduced) a normal crossings divisor and `g` an isomorphism off `Z` ([GK02] §0, Lem. 0.1, p. 4,
through Bierstone–Milman). Checks: a rational point of the disc needs `g = id`; `Z = X ≠ ∅` is
excluded; the thickened origin reduces to the origin.

**Finite étale trace.** (*dagger-finite-etale-trace*) For `char K = 0` and `f : X → Y` finite étale
surjective of smooth spaces, `Y` irreducible and each component of `X` surjecting, there is
`t : f_*Ω^•_X → Ω^•_Y` with `t ∘ f^* = deg f · id`, so `f^*` on `H_dR` is injective ([GK02] §1,
1.14, pp. 10–11; on affinoids `t(b·da_1 ∧ … ∧ da_q) = Tr(b) da_1 ∧ … ∧ da_q`, with
AdicSpacesPartIII's `LinearMap.projectiveTrace`). Checks: the Kummer cover `z ↦ z^N` of the annulus
acts by `N` on `dz/z`; the split two-sheeted trace is `(a, b) ↦ a + b`; `∅ → Sp K` is excluded.

**Proper modification sequence.** (*dagger-proper-modification-sequence*) For `char K = 0` (dagger:
`K = Frac(R)` mixed), `f : X' → X` proper and an isomorphism off a closed `Y`, with closed `X → Z`
smooth and `X' → W'` into smooth proper `W'` of dimension `n`, there is a long exact sequence
`… → H^i_{Y'}(Z') → H^{i−2n}_Y(Z) ⊕ H^i_{X'}(Z') → H^{i−2n}_X(Z) → …` with maps
`x ↦ (t_Y x, incl x)` and `(y, x) ↦ incl y − t_X x` ([GK02] §1, Cor. 1.17, p. 13). Checks: the
identity modification of a point (`s(0, x) = −x`); the blow-up of a point of a surface.

**Theorem C.** (*dagger-semistable-tube-invariance*) For `R` mixed characteristic and `𝔛` strictly
semistable (étale locally over `R⟨X⟩/(X_1 ⋯ X_r − π)`, *admissible-formal-scheme*,
*generic-fibre-functor-d*, *specialisation-map*) with components `Y_i`, restriction
`H_dR(]Y_J[^†) → H_dR(]Y_J − ⋃_{i∉J} Y_i[^†)` is bijective for nonempty `J` ([GK02] §2, 2.2, Thm.
2.4, pp. 17–18; Introduction, Thm. C). Checks: the semistable annulus with both sides
`(K, K·dlog X_1)`.

**Finiteness on semistable tubes.** (*dagger-semistable-tube-finiteness*) For quasi-compact `𝔛`,
`H^q_dR(]Y_J[^†)` and `H^q_dR(𝔛^†)` are finite-dimensional, using finiteness of Monsky–Washnitzer
cohomology (Berthelot, Mebkhout 1997) ([GK02] §2, Thm. 2.5, pp. 20–21). Checks: the semistable
annulus has `(K, K·dlog X_1)`.

**Finite field extensions.** (*dagger-de-rham-finite-field-extension*) For `char K = 0`, `K_1/K`
finite and smooth `X`, `H^i_dR(X_{K_1}/K_1) ≅ H^i_dR(X/K) ⊗_K K_1`, likewise with supports, so
`h^dR_q` is invariant (under the mixed-characteristic hypothesis of
*dagger-hdr-embedding-independence*) ([GK02] §1, 1.13, p. 10; [GK00] §2, 2.13, p. 12). Checks: the
annulus over `K_1`.

**Quasi-algebraic affinoids.** (*quasi-algebraic-affinoid-finiteness*) For `R` mixed characteristic
and `H = Sp(K⟨X⟩†/(f))` with `f_j ∈ R[X]`, `h^dR_q(H) < ∞`, using de Jong's alterations
(SchemeAndStackFoundations SF.4, *semistable-alteration-theorem*; [de Jong] Thm. 6.5) ([GK02] §3,
Thms. 3.3–3.4, p. 22). Checks: for odd `p`, `Y² = X³ + X` gives `h_1 = 2`.

**Theorem A.** (*dagger-de-rham-finiteness-and-base-change*) For `R` mixed characteristic, `X`
smooth quasi-compact, `U` quasi-compact admissible open and `Z` closed, `T = X − (U ∪ Z)` has
finite-dimensional `H^q_dR(T)` with `H^q_dR(T_{K_1}) = H^q_dR(T) ⊗ K_1` ([GK02] Introduction, Thm.
A, p. 2; Cor. 3.5, Thm. 3.6, p. 23; [GK00] §4, 4.10, p. 22; through admissible blow-ups,
*admissible-blow-up*, and de Jong's alterations); finiteness of rigid cohomology of `k`-schemes
belongs to the rigid-cohomology roadmap. Checks: the closed disc minus `{|x| ≥ |π|}` is the open
disc (`K`, `0`); the punctured disc has `H^1 = K·dx/x`.

**Künneth.** (*dagger-de-rham-kunneth*) For `R` mixed characteristic and `X, Y` quasi-compact
smooth, `⊕_{p+q=n} H^p_dR(X) ⊗ H^q_dR(Y) → H^n_dR(X × Y)` is an isomorphism ([GK00] §4, Thm. 4.12,
pp. 22–23). Checks: two discs give `K`; two annuli give `H^1` of dimension `2` and
`H^2 = K·dlog X ∧ dlog Y`; for `⨿_ℕ Sp K` the algebraic tensor product misses the identity matrix,
which is why quasi-compactness is assumed.

### F1.12 smooth pairs: logarithmic and compact-support complexes

**Strict normal crossings divisors on dagger spaces.** (*dagger-snc-divisor*) For smooth `X`, a
closed dagger subspace `D` is a strict normal crossings divisor if `(X', D')` is a smooth pair
(*smooth-pair*); equivalently locally `D = V(x_1 ⋯ x_r)` with `dx_1, …, dx_n` a basis of `Ω¹_A`, the
branches and their intersections smooth of the expected codimension; global components need not be
smooth; stable under restriction, étale pullback and analytification ([Stacks] Tag 0BI9, Def.
41.21.1, Tag 0BIA; [GK02] §0, Lem. 0.1; [GK05] §4.5, Lem. 4.6, pp. 23–25). Checks: the axes
`V(x_1x_2)`; `∅`; the cusp, three concurrent lines and `V(x_1²)` are not; for residue characteristic
`≠ 2` the nodal cubic `V(y² − x²(1 + x))` is SNC though irreducible and singular.

**The logarithmic de Rham complex.** (*log-de-rham-complex*) `Ω¹_X(log D) ⊆ j_*Ω¹_{X−D}` is locally
free on `dx_1/x_1, …, dx_r/x_r, dx_{r+1}, …, dx_n`; `Ω^•_X(log D)` is a complex with
`Ω^• ⊆ Ω^•(log D) ⊆ j_*Ω^•_{X−D}`, residue sequences
`0 → Ω^•(log D') → Ω^•(log D) → ι_*Ω^•_{D_1}(log D'|_{D_1})[−1] → 0` for a smooth component `D_1`,
pullbacks and `(Ω^•(log D))' = Ω^•_{X'}(log D')` ([Stacks] Tag 0FMU, Def. 50.15.3, Lem. 50.15.2,
50.15.4; [GK05] §4.5, Lem. 4.6). Checks: on the polydisc with `D = V(x_1 ⋯ x_r)` the classes
`dlog x_I`, `I ⊆ {1, …, r}`, form a basis; `D = ∅` gives `Ω^•`; `dx/x²` is not logarithmic;
`Res(dx/x) = 1` and `H^1(D, log{0}) ≅ K`; [GK05]'s monodromy example on the open bidisc.

**The compact-support logarithmic complex.** (*compact-support-log-complex*)
`Ω^•_X(log D)(−D) = I_D·Ω^•_X(log D) ⊆ Ω^•_X`, locally free on `x_1 ⋯ x_r dlog x_I ∧ dx_J`, with
`H^i_{dR,c}(X, D) → H^i_dR(X) → H^i_dR(X, log D)`, restriction `Ω^•_{X−D}` off `D`, pullbacks and
coefficients in log connections ([Stacks] Tag 0FMU, proof of Lem. 50.15.2; [GK00] §5, 5.2, p. 24).
Checks: `(ℙ¹)^†` with `D = {0, ∞}` has `(0, K, K)`; `D = ∅` gives `Ω^•`; the naive `I_D·Ω^•` is not
a complex (`d(x) = dx ∉ xΩ¹`).

**Localisation sequences.** (*compact-support-localisation-maps*) For `D = D_1 + D'` with `D_1`
smooth, `0 → Ω^•(log D)(−D) → Ω^•(log D')(−D') → ι_*Ω^•_{D_1}(log D'_1)(−D'_1) → 0` is exact, giving
the long exact sequence of `H_{dR,c}`; and for `U_0 ⊂† X` the supports sequence gives extension by
zero `H_{dR,c}(U_0) → H_{dR,c}(X)` with its localisation sequence ([Stacks] Tag 0FMU; [GK02] §1,
1.9(c), Prop. 1.16(b), pp. 7, 11). Checks: `(ℙ¹)^†`, `D_1 = {0}`, `D' = {∞}` against
`H_c(𝔸¹) = (0, 0, K)`; the split case has zero connecting map.

### Examples

The running examples are recorded at the targets: `Σ pᵐXᵐ` against the lacunary `Σ pᵐX^{pᵐ}` and
`Σ pᵐX^{2m}`; the Laurent, polynomial and dual-number dagger algebras; fringe presentations of
`W_n`, `K` and the annulus and their dependence on the presentation; the naive tensor product; the
dagger annulus as a rational localisation; weak completions of Laurent and finite algebras; MW-type
and its non-examples; the closed dagger disc against the rigid disc (`H^1_dR = 0` against
infinite-dimensional, `K⟨X⟩† ⊊ K⟨X⟩`, the automorphism `X ↦ X + a`); the open disc as Stein;
`(𝔸¹)^†` and `(ℙ¹)^†`; compact supports and duality on the disc and the annulus; the semistable
annulus; the affine elliptic curve `Y² = X³ + X`; the log complex of the polydisc and of
`(ℙ¹, {0, ∞})`.

### Dependencies

AdicSpacesPartII R0 (completed tensor products, fibre products, supremum seminorms and power-bounded
elements of affinoid algebras, separated, partially proper and smooth morphisms, continuous
differentials, *separated-morphism*) and R1 (rigid spaces, affinoid subdomains, *gerritzen-grauert*,
analytification, `r`, the identity principle); AdicSpacesPartIII R2 (admissible formal schemes,
generic fibres, specialisation, *admissible-blow-up*) and R3 (coherent sheaves, Kiehl's theorems,
quasi-Stein spaces, *sheaf-of-continuous-differentials*, GAGA, traces); R4 (*smooth-pair*);
SchemeAndStackFoundations SF.0 (*excellent-ring*, *regular-map-completion*) and SF.4
(*semistable-alteration-theorem*). External inputs taken as stated: finiteness of Monsky–Washnitzer
cohomology (Berthelot, Mebkhout 1997), Bierstone–Milman resolution, and [BGR] 7.3.5/1.

## Downstream consumers

PerfectoidSpaces P7 and PerfectoidTowers P9 use R5's sousperfectoid spaces, stable bases
(*stable-basis-etale-vector-bundles*), tilde-limits (*tilde-limit-base-change*), profinite flat
modules and mixed completed tensor products; AdicEtaleGeometry cites R5's sousperfectoid rings and
R4's site applications. The étale-cohomology, Shimura-variety, rigid-cohomology and `p`-adic Hodge
theory roadmaps use R4's sites, R5's coefficient sheaves and F1's dagger spaces and overconvergent
de Rham complexes.

## References

- [BGR] S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261, Springer 1984.
- [Berkeley] P. Scholze, J. Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020). https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
- [BHW] C. Birkbeck, B. Heuer, C. Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Ann. Inst. Fourier (2023). https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf
- [CHJ] P. Chojecki, D. Hansen, C. Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2 (Doc. Math. 22 (2017)); page numbers of the arXiv PDF. https://arxiv.org/abs/1507.04875
- [Conrad-AWS] B. Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 notes.
- [Conrad-IC] B. Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999). https://math.stanford.edu/~conrad/papers/irredpaper.pdf
- [de Jong] A. J. de Jong, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93. http://www.numdam.org/item/PMIHES_1996__83__51_0/
- [de Jong95] A. J. de Jong, *Crystalline Dieudonné module theory via formal and rigid geometry*, Publ. Math. IHÉS 82 (1995), 5–96. http://www.numdam.org/item/PMIHES_1995__82__5_0/
- [dJvP] A. J. de Jong, M. van der Put, *Étale cohomology of rigid analytic spaces*, Doc. Math. 1 (1996), 1–56.
- [DLLZ-A] H. Diao, K.-W. Lan, R. Liu, X. Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2. https://arxiv.org/abs/1912.09836
- [DLLZ-RH] H. Diao, K.-W. Lan, R. Liu, X. Zhu, *Logarithmic Riemann–Hilbert correspondences for rigid varieties*, arXiv:1803.05786v4 (J. Amer. Math. Soc. 36 (2023)). https://arxiv.org/abs/1803.05786
- [EGA IV₂] A. Grothendieck, *Éléments de géométrie algébrique IV, seconde partie*, Publ. Math. IHÉS 24 (1965). http://www.numdam.org/item?id=PMIHES_1965__24__5_0
- [EGA IV₄] A. Grothendieck, *Éléments de géométrie algébrique IV, quatrième partie*, Publ. Math. IHÉS 32 (1967). http://www.numdam.org/item?id=PMIHES_1967__32__5_0
- [GK00] E. Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (J. reine angew. Math. 519 (2000)). https://arxiv.org/abs/1408.3329
- [GK02] E. Grosse-Klönne, *Finiteness of de Rham cohomology in rigid analysis*, arXiv:1408.3327v1 (Duke Math. J. 113 (2002)). https://arxiv.org/abs/1408.3327
- [GK05] E. Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel'd's symmetric space*, arXiv:1408.3346v1 (J. Algebraic Geom. 14 (2005)). https://arxiv.org/abs/1408.3346
- [HK] D. Hansen, K. S. Kedlaya, *Sheafiness criteria for Huber rings*, version of August 6, 2026. https://kskedlaya.org/papers/criteria.pdf
- [Huber94] R. Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551.
- [Huber96] R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996.
- [Kedlaya01] K. S. Kedlaya, *Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology*, arXiv:math/0105031v2. https://arxiv.org/abs/math/0105031
- [Kedlaya06] K. S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006)), with the author's errata. https://arxiv.org/abs/math/0208027
- [KL15] K. S. Kedlaya, R. Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5. https://arxiv.org/abs/1301.0792
- [RZ] L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Springer 2010.
- [Scholze13] P. Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (Forum Math. Pi 1 (2013)). https://arxiv.org/abs/1205.3463
- [Scholze-Err] P. Scholze, *Erratum to "p-adic Hodge theory for rigid-analytic varieties"*. https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf
- [Scholze–Weinstein 2013] P. Scholze, J. Weinstein, *Moduli of p-divisible groups*, Camb. J. Math. 1 (2013); arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357
- [Stacks] The Stacks Project Authors, *The Stacks Project*, cited by tag. https://stacks.math.columbia.edu
- [vdP] M. van der Put, *The cohomology of Monsky and Washnitzer*, Mém. Soc. Math. France 23 (1986), 33–59. http://www.numdam.org/item/MSMF_1986_2_23__33_0/
- [Vezzani] A. Vezzani, *The Monsky–Washnitzer and the overconvergent realizations*, arXiv:1509.01718v2 (IMRN 2018). https://arxiv.org/abs/1509.01718
