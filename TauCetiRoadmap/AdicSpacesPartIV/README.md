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
sheaves `𝒪_X ⊗̂ R` of Chojecki–Hansen–Johansson with Tate acyclicity, localisation and coherence,
Kiehl's theorem for finite free coefficient algebras and projectivity of locally projective
localised modules for every small coefficient algebra, together with counterexamples to two of their
lemmas for coefficient algebras with an infinite pseudobasis. Layer F1 is Grosse-Klönne's dagger
geometry: overconvergent power series, dagger algebras and their completions, weak completions and
algebras of Monsky–Washnitzer type, dagger spaces and their comparison with rigid spaces, the
differential operators and overconvergent de Rham cohomology with supports and compact supports,
ending with Serre and Poincaré duality, invariance on semistable tubes (Theorem C), the logarithmic
complexes of smooth pairs, and finiteness for smooth quasi-compact dagger spaces (Theorem A) with
Künneth, proved from finiteness of Monsky–Washnitzer cohomology and embedded resolution, which these
statements carry as hypotheses.

This roadmap develops the étale and pro-étale sites on analytic carriers, smooth pairs,
sousperfectoid spaces and families, dagger geometry and overconvergent de Rham complexes.
Part IV uses morphisms and analytification from [part II](../AdicSpacesPartII/README.md),
formal models and coherent sheaves from [part III](../AdicSpacesPartIII/README.md), and the
sites of [AdicEtaleGeometry](../AdicEtaleGeometry/README.md).

| Layer | Title | What it builds |
|---|---|---|
| R4 | Étale and pro-étale sites | the sites of AdicEtaleGeometry layer A1 on these carriers (locally noetherian analytic spaces), functoriality, rigid and algebraic comparisons, smooth pairs, boundary complements |
| R5 | Families and sousperfectoid spaces | sousperfectoid rings and spaces, perfectoid × smooth, tilde-limits, coefficient algebras and sheaves |
| F1 | Dagger geometry and overconvergent de Rham complexes | dagger algebras and spaces, weak completions, strict neighbourhoods, differential operators, de Rham complexes and de Rham cohomology with supports, duality, finiteness relative to Monsky–Washnitzer finiteness |

```text
AdicSpacesPartII R0–R1, AdicEtaleGeometry A1, SchemeAndStackFoundations SF.4 → R4
R4, AdicSpacesPartII R0, AdicSpacesPartIII F0/R2/R3, AdicEtaleGeometry A1 → R5.6–R5.8
AdicSpacesPartII R0, AdicSpacesPartIII R3, AdicEtaleGeometry A1, R5.6–R5.8,
  PerfectoidSpaces P1.1/P1.10/P1.30/P1.31/P2.3/P2.9/P2.10/P3.10 → R5.1–R5.5
AdicSpacesPartII R0–R1, AdicSpacesPartIII R2/R3, R4, SchemeAndStackFoundations SF.0/SF.4,
  PerfectoidSpaces P3.1 → F1
```

The arrows run between subsections, not whole roadmaps. R5.6–R5.8 (coefficient algebras and
sheaves, the generic stable-basis results *stable-basis-covering-reduction* and
*stable-basis-etale-vector-bundles*, tilde-limits) use no PerfectoidSpaces target; PerfectoidSpaces
P3.19 uses *stable-basis-etale-vector-bundles*, P6 uses R5.4 and P7.1 uses
*tilde-limits-affinoid-criterion*, and none of the PerfectoidSpaces subsections that R5 uses depends
on R5. F1 uses only PerfectoidSpaces P3.1 (Elkik's approximation theorem), which uses nothing from
this roadmap.

## Scope and ownership

The roadmap owns, layer by layer:

- R4: the étale and pro-étale sites of AdicEtaleGeometry layer A1 placed on the analytic carriers
  of this roadmap. The sites, their base-change functoriality and slices, the projection `ν`,
  geometric points with their stalk compatibility and Scholze's point morphisms are A1's and are
  cited in one sentence each; R4's own targets are the functoriality of the pro-étale site on these
  carriers, the compatibility of `f_proét` with the point morphisms, the rigid comparison, the
  analytification morphism `λ_X`, smooth pairs with their intrinsic characterisation, the
  analytification of strict normal crossings pairs and the restriction to a boundary complement.
  R4 builds no second site.
- R5: sousperfectoid rings and the stability of the class, stable uniformity and sheafiness,
  sousperfectoid spaces, products of perfectoid spaces with smooth rigid spaces, coefficient algebras
  and coefficient sheaves of `p`-adic families, with Kiehl's theorem for finite free coefficient
  algebras and projectivity of locally projective localised modules. Global generation of coherent
  coefficient sheaves for a coefficient algebra with an infinite pseudobasis (finite generation of
  `F(X)` and `F ≅ Loc(F(X))`, the statement of CHJ Theorem 6.20) is not a target of this roadmap.
  The relation `AdicSpace.IsTildeLimit` and its affinoid and base-change
  theorems are stated in R5.8. Perfectoid Tate rings use PerfectoidSpaces P1.1's predicate
  `Perfectoid.IsPerfectoidTateRing` unchanged, and the basis comparison on a stable basis is
  AdicEtaleGeometry layer A1 (*basis-comparison*); R5 states the covering reduction for an
  arbitrary stable class of affinoid objects (*stable-basis-covering-reduction*), the argument of
  A1's *etale-covering-reduction* transported.
- F1: overconvergent power series, dagger algebras, fringe presentations and the fringe topology,
  tensor products and rational localisation, weak completions and algebras of Monsky–Washnitzer
  type, affinoid dagger spaces, dagger spaces with coherent modules and strict neighbourhoods, the
  dagger–rigid comparison, differentials and the overconvergent de Rham complex, the differential
  operators, derived de Rham functor, direct images and algebraic local cohomology that its
  supported cohomology uses, supports, compact support and duality, the logarithmic and
  compact-support complexes of smooth pairs, the Runge factorisation of locally closed immersions of
  affinoids over a rational covering (BGR 7.3.5/1), the algebraisation of smooth affinoids, and the
  finiteness theorems in the form "finiteness of Monsky–Washnitzer cohomology and embedded resolution
  imply finiteness". Those two inputs, (MWF) and (RES) of F1.11, are not targets of this roadmap:
  every statement that uses them carries them as hypotheses. De Jong's strictly semistable
  alteration theorem is SchemeAndStackFoundations layer SF.4 (*semistable-alteration-theorem*),
  cited by F1.


AdicSpaces owns the underlying adic-space foundations. Existing Mathlib and Tau Ceti
APIs are used directly; cited roadmap suppliers own the contracts below. Tau Ceti follows
Mathlib's API decisions and builds every needed target here without waiting for upstream work.

AdicSpaces and AdicSpacesPartII own Huber pairs, adic spaces, completed tensor products, fibre
products, Huber's morphism classes, rigid spaces and analytification; AdicSpacesPartIII owns adic
rings, formal schemes, generic fibres, admissible blow-ups, coherent sheaves, Kiehl's theorems and
GAGA; PerfectoidSpaces P1.1 owns the perfectoid Tate-ring predicate
`Perfectoid.IsPerfectoidTateRing`, which R5 uses unchanged; AdicEtaleGeometry owns strongly sheafy
rings, étale morphisms by local description and the étale, pro-étale and finite étale sites;
PerfectoidSpaces owns perfectoid spaces, perfectoid rational localisation, almost purity, tilting
and Elkik's approximation theorem (P3.1); SchemeAndStackFoundations owns excellent rings (SF.0) and
strict normal crossings divisors and de Jong's alteration theorem (SF.4). Derived étale cohomology,
comparison theorems and rigid cohomology belong to the étale-cohomology and rigid-cohomology
roadmaps that import this one; a proof there of (MWF) that discharges the hypothesis of F1.11 must
not use F1.11.

## Conventions

1. **Huber pairs** are Tau Ceti's `Huber.Pair A`: the plus ring is explicit data. Morphisms are
   `Huber.Pair.Hom` (continuous, carrying `A⁺` into `B⁺`). Pairs of definition are
   `Huber.PairOfDefinition`.
2. **Complete includes Hausdorff**, as in AdicSpaces; every statement about complete rings, modules
   or pairs carries both.
3. **Adic spaces** are the objects of AdicSpaces' category (`TauCeti.AdicSpace`): locally
   `Spa(A, A⁺)` for sheafy complete Huber pairs. A point is *analytic* if it has an open
   neighbourhood whose ring of sections has a topologically nilpotent unit. A Huber ring is *of
   noetherian type* if it has a noetherian ring of definition or is a strongly noetherian Tate ring;
   an adic space is *locally noetherian* if it is locally `Spa` of such a ring.
4. **The base field.** `K` is complete for a nontrivial rank-one nonarchimedean absolute value,
   `O_K = K°`, `ϖ` a pseudouniformiser, `Spa K = Spa(K, K°)`. `O_K` is noetherian exactly when `K` is
   discretely valued; no statement assumes this unless it says so.
5. **Completed tensor products** `B ⊗̂_A C` are formed only along adic structure maps, with the
   topology from rings and ideals of definition, plus ring the integral closure of the image of
   `B⁺ ⊗_{A⁺} C⁺`, then completion. They are neither uniform nor sheafy in general; every fibre
   product carries its own existence and sheafiness hypotheses.
6. **Fibre products** are taken in AdicSpaces' category and exist under Huber's hypotheses (AdicSpacesPartII R0); the
   map from `|X ×_Z Y|` to the fibre product of the underlying sets is surjective, not injective.
7. **Formal schemes** (AdicSpacesPartIII F0) are locally `Spf A` for `A` complete and separated for an adic topology
   with a finitely generated ideal of definition. Admissible formal `O_K`-schemes (AdicSpacesPartIII R2) are
   topologically finitely presented and `ϖ`-torsion-free, and are not noetherian unless `K` is
   discretely valued.
8. **Rigid spaces** are Tate's (AdicSpacesPartII R1). `X^an` is the rigid and `X^ad` the adic analytification; they
   are identified only through Huber's functor `r_K`.
9. **Valuation bounds.** `|f| ≤ |g|^{a/b}` means `v(f^b) ≤ v(g^a)`; no root of `g` in the base field is
   assumed. Tubes and strict Hasse loci are interiors of preimages under specialisation (AdicSpacesPartIII R2).
10. **Coherent and locally free.** Coherent sheaves are defined on locally noetherian adic spaces
    only; vector bundles on every adic space, corresponding to finite projective modules on sheafy
    Tate affinoids.
11. **Traces.** The trace of an endomorphism of a finite projective module is
    `LinearMap.projectiveTrace` (AdicSpacesPartIII R3), through `dualTensorHomEquiv`; Mathlib's `LinearMap.trace` and
    `Algebra.trace` are used only for free modules. A trace is never defined as a sum over geometric
    points.
12. **Names.** Declarations live under `TauCetiRoadmap.AdicSpacesPartIV`, in `Foundations`,
    `AnalyticSites`, `AdicSpace`, `RigidSpace`, `Huber`, `Dagger`, `DaggerSpace` and
    `FormalGeometry`, with coefficient constructions in `RigidSpace.Coefficients`;
    `Suggested.lean` uses `SmoothPair` for the chart-level smooth-pair definitions, `Huber` for
    R5's rings and coefficient algebras, `AdicSpace` for R5's spaces and `Dagger` for F1. The
    perfectoid Tate-ring predicate is PerfectoidSpaces P1.1's
    `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing`, imported unchanged.
13. **Targets.** Each target below is a definition, construction, theorem or comparison, written
    with its hypotheses in the sentence, its source locator in parentheses (short keys are resolved
    in the References), its API as a list of statements and its unit tests as `Checks`. A target
    whose paragraph carries a **Lean:** note is stated in `Suggested.lean` by the declarations named
    there, and a Check marked "(Lean `example`)" is an `example` of that file; every other target,
    API statement and Check is specified by this README only, with no Lean declaration. A target's
    label `(*slug*)` is the name by which later targets and the Lean file refer to it.
14. **Pure dimension.** A smooth space has pure dimension `n` when `dim O_{X,x} = n` at every point;
    statements with a fixed degree shift (`n`, `2n`, `d`) or with `ω_X = Ω^n_X` assume pure
    dimension, and for other smooth spaces they hold on each open and closed pure-dimensional
    part.

## Exact supplier contracts

| Derived support and localization supplier | Exact file | Contract used |
|---|---|---|
| `CategoryTheory.ShortComplex.ShortExact.singleδ` | `Mathlib/Algebra/Homology/DerivedCategory/SingleTriangle.lean` | The connecting arrow of the free-sheaf support sequence. |
| `DerivedCategory.triangleOfSESδ` | `Mathlib/Algebra/Homology/DerivedCategory/ShortExact.lean` | The connecting arrow of the compact logarithmic sequence after extension to integer degrees. |
| `CategoryTheory.Limits.cokernel.map`, `CategoryTheory.Limits.cokernel.π` | `Mathlib/CategoryTheory/Limits/Shapes/Kernels.lean` | Support extension and the map from supported to ordinary cohomology. |

| R4 supplier | Exact file | Contract used |
|---|---|---|
| AdicSpacesPartII R1.1 *rigid-analytic-space* (`Sp A`, the bijection of its points with `Max A`, the empty, one-point and polydisc affinoids) and *affinoid-subdomain*, supplied by RigidAnalyticGeometry §4.2.1–4.2.2 (`RigidAnalyticGeometry.rationalDomain`) through AdicSpacesPartII's R0.9 carrier bridge | `TauCetiRoadmap/AdicSpacesPartII/README.md`; W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean` | The rigid comparison Checks use these empty, field-point and disc affinoids; the bijection of the points of `Sp A` with `Max A` specifies the two rational images in the maximal spectrum. R5 uses the one-dimensional polydisc over `ℚ_p` for its coefficient restriction counterexample. |
| `AlgebraicGeometry.Scheme.IdealSheafData.ofIdealTop`, `subschemeι`; `AlgebraicGeometry.Scheme.basicOpen` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`; `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean`; `Mathlib/AlgebraicGeometry/Scheme.lean` | The origin and two-axis analytification Checks use the actual ideal sheaf, its closed subscheme, and its principal open complement. |
| `TauCeti.PreAdicSpace.IsOpenImmersion.ofRestrict` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/OpenImmersion.lean:71` | Every open restriction inclusion is an open immersion; R4.7 specialises this instance to the boundary complement `j : U → X`. |
| AdicSpacesPartII R1 *rigid-analytification*, *rigid-adic-comparison-functor* (the rigid analytification, Huber's functor `r` and the field affinoid `Spa(K, K°)`); AdicEtaleGeometry A0.6 (the comparison of the complete-pair spectrum with the Part II affinoid spectrum, fixing coefficients) | `TauCetiRoadmap/AdicSpacesPartII/README.md`; `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The analytification of an algebraic smooth pair (*analytification-of-smooth-pair*) retains the structure map of these functors over the field affinoid and transports it through the canonical comparison fixing coefficients to the complete-pair presentation of `Spa(K,K°)`. |
| AdicSpacesPartII R1.2–R1.3 *scheme-fibre-product-analytification*, *analytification-functor* (the relative adic analytification over the stably sheafy field affinoid, on the category of `k`-schemes and its affine schemes) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | R4.5 uses the relative adic analytification over the field affinoid, forgetting only its map to `Spa(k,k°)`. Its scheme category is the category of `k`-schemes of AdicSpacesPartII R1. |
| `CategoryTheory.MorphismProperty.Over.pullback` | `Mathlib/CategoryTheory/MorphismProperty/OverAdjunction.lean` | Scheme étale base change in the naturality of `λ_X` (R4.5); the adic side uses A1's étale base change (*etale-site*). |
| AdicEtaleGeometry A1.6 *etale-site* (the small étale category and its topology); `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.ofRestrict` | `TauCetiRoadmap/AdicEtaleGeometry/README.md`; `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | The target category, its topology, and the open-disc inclusion used by R4.5. |
| AdicEtaleGeometry A1.6 *etale-site* (étale base change `V ↦ V ×_Y X`, its projection and pullback square, continuity, preservation of finite limits, and its compatibility with composition) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A1 owns étale base change, its limiting cone, continuity, finite-limit preservation and composition compatibility. Source and target are locally strongly sheafy. R4 specialises this construction to its carriers. |
| AdicEtaleGeometry A1 *pro-etale-site-corrected*, *corrected-covers-pretopology* (the corrected pro-étale site, its topology, the constant embedding, underlying spaces and cofiltered presentations) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A1 owns the corrected site, the constant embedding, underlying spaces and cofiltered presentations, including the one-stage presentation. R4's pro-étale base change (*proetale-site-functoriality*) applies A1's étale base change levelwise and adds its composition comparison. |
| AdicEtaleGeometry A1's Check objects over `ℚ₂`: the split finite étale object (*etale-site*) and the constant pro-étale object of `ℚ₂(√2)/ℚ₂` (*pro-etale-site-corrected*) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The empty and split finite étale objects over `ℚ₂`, and the constant object for `ℚ₂(√2)/ℚ₂`, supply the base-change Checks. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Etale`, `Smooth`; `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.restrict`, `AdicSpace.ofRestrict`; AdicEtaleGeometry A0 (the spectrum of a complete pair and its coefficient-to-section maps) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The DLLZ normal crossings predicate of R4.7 and the three analytic chart non-examples use these morphism classes, polydisc carriers and coefficient-to-section maps. The Kummer DLLZ Check and the Gauss-point Check extend the polynomial ideal through the open inclusion's stalk maps. The boundary predicate belongs to Part IV. |
| `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.restrict`, `ofRestrict` (same namespace); AdicEtaleGeometry A1.1 *strongly-sheafy-huber-pair* (restriction of local strong sheafiness) and A1's local noetherianity of étale sources | `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCetiRoadmap/AdicEtaleGeometry/README.md` | Open subspaces, their inclusions and local hypotheses. Restricting a smooth pair to an open adds the boundary ideal extended through these stalk maps; pulling a smooth pair back along an étale map uses Part II's `AdicSpace.Etale`. |
| AdicEtaleGeometry A1 *proetale-slice* (the pro-étale slice equivalence, its continuity, its restriction to opens and its compatibility with constant objects) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | Corrected pro-étale slices and their compatibility with constant étale objects. R4 specialises the slice over the constant object of the boundary complement; its comparison `ν_X ∘ j_proét ≅ j_ét ∘ ν_U` uses the compatibility of pro-étale base change with constant objects (*proetale-site-functoriality*). |
| AdicEtaleGeometry A1.6 *etale-site* (inverse and direct image of set-valued étale sheaves with their adjunction) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A1's inverse and direct image on set-valued sheaves with their adjunction. The set-valued `j^{-1}` and `j_*` of R4.8 specialise them to the complement. The direct image is restriction along étale base change; R4 compares both functors with the slice presentation. |
| `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.GeometricPoint`; AdicEtaleGeometry A1.7 *etale-site-and-geometric-points* (decomposition groups and their membership criterion, étale stalk pullback and its value on germs) and A1.15 *proetale-fibre-morphism-of-topoi* (the global pro-étale point inverse images) | `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A1 owns valuation stabilisers, global pro-étale point inverse images and étale stalk pullback. R4.6 adds the comparison of the global pro-étale inverse images under a compatible field and valuation extension. |
| AdicEtaleGeometry A1.7's rank-two valuation Check over `ℚ((t))` (*etale-site-and-geometric-points*) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The rank-two witness over `ℚ((t))`: the point, the embedding of `ℚ((t))(i)`, the element `a = (i − 2)/5`, the conjugation `i ↦ −i`, the integrality of `a` under the embedding, and the facts that `i ≡ 2 mod 5` is the chosen branch while the conjugation moves it. R4.6 uses this witness for its stabiliser Check. |
| `ContAction.res` | `Mathlib/CategoryTheory/Action/Continuous.lean` | Restricts continuous profinite actions along the continuous homomorphism `D_x → D_{f(x)}`. R4.6 proves continuity for A1's corrected action-site topology. |
| `CategoryTheory.Functor.sheafPullbackConstruction.sheafPullback`, `CategoryTheory.Functor.sheafPullbackConstruction.sheafAdjunctionContinuous` | `Mathlib/CategoryTheory/Sites/Pullback.lean` | Sheafification of the left Kan extension and its adjunction to direct image along a continuous site functor; used for both inverse images in the point comparison. |
| `CategoryTheory.MorphismProperty.Over` | `Mathlib/CategoryTheory/MorphismProperty/Comma.lean` | Full over category selected by the rigid stalk criterion; no private category of arrows is needed. |
| `IsLocalRing.ResidueField.map` | `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean` | The residue-field map induced by the local stalk map; its scalar structure is used for finiteness and separability in the rigid étale criterion. |
| `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing` (P1.1) | `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` | The perfectoid target of R5.1's perfectoid frames (`Huber.PerfectoidFrame`: continuous embedding and continuous linear retraction), used throughout R5, including the proper-frame density counterexample and the diagonal/product-frame Check. |
| `TauCeti.Huber.Pair.Hom`, `TauCeti.Huber.Pair.Hom.id`, `TauCeti.Huber.Pair.powerBounded` | `TauCeti/RingTheory/Huber/Pair.lean` | Analytic charts use continuous maps respecting the integral subrings; the identity map defines the analytic model. |
| `RingHom.Etale`, `RingHom.Etale.of_bijective`, `RingHom.Etale.iff_flat_and_formallyUnramified` | `Mathlib/RingTheory/RingHom/Etale.lean` | Étale coordinate maps, the identity chart, and flatness. R4 adds the coordinate-product ideal and its radicality. |
| `Module.Flat.isSMulRegular_of_nonZeroDivisors` | `Mathlib/RingTheory/Flat/TorsionFree.lean` | A regular scalar acts injectively on a flat module; apply to the product of the distinct polynomial coordinates. |
| `AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicGeometry.Scheme.IdealSheafData.ideal_top`, `AlgebraicGeometry.Scheme.IdealSheafData.ideal_bot` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` | Scheme ideal sheaves and the empty/full boundary conventions. R4 adds relative étale charts. |
| `TauCeti.ValuationSpectrum.closedPolydisc`, `TauCeti.ValuationSpectrum.mem_closedPolydisc_iff` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean` | The polydisc as a subset of the valuation spectrum of restricted series. R4 adds the punctured-disc noncompactness statement. |
| `CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.GrothendieckTopology.overPullback` | `Mathlib/CategoryTheory/Sites/Over.lean` | Slice topology and restriction of sheaves; R4 identifies the adic boundary-complement sites with these slices, and R5 uses slices of its finite rational site. |
| AdicEtaleGeometry A1 *slice-site* (the étale slice equivalence, its value on objects and its topology comparison) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A1 owns the étale slice equivalence and its topology comparison. R4.8 specialises it to the open complement, and its equivalence of sheaf categories on the complement uses that comparison. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.QuasiCompact` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | The punctured-disc Checks test compact inverse images of compact target opens with this imported morphism predicate. |
| AdicEtaleGeometry A1.7 *etale-site-and-geometric-points* (the set of geometric lifts of a point of an étale object), *pro-etale-site-corrected* (constant objects and quasi-compactness) and A1's split two-sheeted Check object with its section map | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The fibre Checks use the actual sets of geometric lifts, the corrected site's constant objects, and the split two-sheeted carrier. The countable coproduct is specified by its universal property. |
| `CategoryTheory.Limits.Cofan`, `CategoryTheory.Limits.IsColimit` | `Mathlib/CategoryTheory/Limits/Shapes/Products.lean`; `Mathlib/CategoryTheory/Limits/IsLimit.lean` | The countable-disjoint-union Check includes the coproduct universal property, with the fibre equivalence fixed on each summand. |
| `CategoryTheory.Equivalence.sheafCongr`, `CategoryTheory.Equivalence.toAdjunction`, `CategoryTheory.Adjunction.comp` | `Mathlib/CategoryTheory/Sites/Equivalence.lean`, `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Transport sheaves along the imported site equivalence and compose the resulting adjunctions with the slice adjunctions. |
| `CategoryTheory.Over.iteratedSliceEquiv` | `Mathlib/CategoryTheory/Comma/Over/Basic.lean` | The categorical equivalence of iterated slices; geometric étaleness and the covering comparison are additional inputs. |
| `CategoryTheory.Functor.IsContinuous`, `CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.Adjunction.sheafPushforwardContinuous` | `Mathlib/CategoryTheory/Sites/Continuous.lean` | Restriction along a continuous functor and the induced sheaf adjunction. |
| `CategoryTheory.Functor.sheafPullback`, `CategoryTheory.Functor.sheafAdjunctionContinuous` | `Mathlib/CategoryTheory/Sites/Pullback.lean` | The chosen left adjoint and its canonical adjunction along the forgetful functor from the slice over the complement are R4.8's `j_!` and `j_! ⊣ j^{-1}`, assuming `HasWeakSheafify` on the ambient site with values in `AddCommGrpCat.{1}`. |
| `CategoryTheory.Functor.sheafPushforwardCocontinuous`, `CategoryTheory.Functor.sheafAdjunctionCocontinuous` | `Mathlib/CategoryTheory/Sites/CoverLifting.lean` | The right Kan extension and its canonical adjunction along the forgetful functor from the slice over the complement are used directly as R4.8's `j_*` and `j^{-1} ⊣ j_*`. |
| `CategoryTheory.Functor.IsDenseSubsite`, `CategoryTheory.Functor.IsDenseSubsite.sheafEquiv` | `Mathlib/CategoryTheory/Sites/DenseSubsite/Basic.lean` | The comparison equivalence; R4 proves the rigid–adic geometric hypotheses. |
| `CategoryTheory.Functor.inducedTopology` | `Mathlib/CategoryTheory/Sites/InducedTopology.lean` | The topology induced on the rigid étale category. |
| `CategoryTheory.Functor.sheafInducedTopologyEquivOfIsCoverDense` | `Mathlib/CategoryTheory/Sites/DenseSubsite/InducedTopology.lean` | The equivalence for the cover-dense comparison functor. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology`, `AlgebraicGeometry.Scheme.ofArrows_mem_smallEtaleTopology_iff` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean` | The scheme small étale site and its jointly surjective covering families. |
| `AlgebraicGeometry.Scheme.Etale`, `AlgebraicGeometry.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | The scheme category and morphism class used before analytification. |
| `AlgebraicGeometry.Scheme.proetaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Proetale.lean` | A topology on schemes; it is distinct from the corrected site of pro-objects of étale adic spaces. |

| R5 supplier | Exact file | Contract used |
|---|---|---|
| `Module.Flat.of_flat_tensorProduct`, `Module.Flat.projective_of_finitePresentation` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`; `Mathlib/RingTheory/Flat/EquationalCriterion.lean` | Flatness descends through a faithfully flat algebra, and finitely presented flat modules are projective. The coefficient-specific projectivity statement (b) of *coefficient-sheaf-kiehl* supplies the rational-cover comparison and noetherian finite presentation. |
| `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.IsFiniteEtale`; AdicEtaleGeometry A1.6 *etale-site* (étale objects, rational chart maps and the basic objects of *basis-comparison*) and A1.3 *finite-etale-morphism* (affinoid preimages under finite étale maps) | `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`; `TauCetiRoadmap/AdicEtaleGeometry/README.md` | Étale objects, rational maps and finite étale maps, including their affinoid algebra description. R5's identity-generated class `B_X` (*sousperfectoid-stably-adic*) restricts the initial chart to the identity; A1's basic objects also start from arbitrary affinoid open charts, which does not make their rings sousperfectoid. |
| `Function.LeftInverse.isClosedEmbedding` | `Mathlib/Topology/Separation/Hausdorff.lean` | A continuous retraction exhibits its continuous section as a closed embedding when the ambient space is Hausdorff. Applied to a perfectoid frame; no second closed-embedding theorem is needed. |
| `TauCeti.Huber.IsUniform.isReduced` | `TauCeti/RingTheory/Huber/Uniform.lean` | A Hausdorff uniform Tate ring is reduced. R5 supplies uniformity and Hausdorffness from a frame. |
| `IsLocalizedModule.map`, `LocalizedModule.mk`, `LocalizedModule.mkLinearMap` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` | Localize the specified integral maps. R5 fixes every mixed map on arbitrary localized compatible families, including families outside the algebraic tensor image. |
| `Submodule.mapQ`, `Submodule.liftQ`, `Submodule.Quotient.restrictScalarsEquiv`, `TensorProduct.tensorQuotEquivQuotSMul` | `Mathlib/LinearAlgebra/Quotient/Basic.lean`; `Mathlib/LinearAlgebra/TensorProduct/Quotient.lean` | Induced quotient maps and the canonical identification `X ⊗ (O/J) ≃ X/JX`; R5 uses these directly to specify coefficient covariance and pseudobasis coordinates. |
| `AdicCompletion.eval`, `AdicCompletion.ofLinearEquiv` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Quotient projections of the completion and its canonical equivalence with an adically complete module. The mixed product formula is pinned by these projections. |
| `UniformFun`, `UniformFun.ofFun` | `Mathlib/Topology/UniformSpace/UniformConvergenceTopology.lean` | Functions with the uniformity of uniform convergence. R5 embeds bounded pseudobasis families into this space, using the canonical additive uniformity on the Banach factor. |
| `TauCeti.IsCompactModule`, `TauCeti.IsCompactModule.t2Space`, `TauCeti.IsCompactModule.isLinearTopology` | `TauCeti/Topology/Algebra/Module/Compact.lean` | Compact totally disconnected topological modules with continuous scalar action; Hausdorffness follows, and the linear topology follows over a compact base ring. Profinite flatness adds `Module.Flat`. |
| `TauCeti.PreAdicSpace`, `TauCeti.AdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` | The valued locally ringed carrier and its sheafy locally affinoid full subcategory. Global AdicSpacesPartIII R3 sheaves and morphisms, R5 sousperfectoid spaces, products and tilde-limits are on these carriers. |
| `PresheafOfModules.pushforward₀`, `SheafOfModules.free`, `SheafOfModules.toSheaf` | `Mathlib/Algebra/Category/ModuleCat/Presheaf/Pushforward.lean`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Free.lean`, `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | R5 uses the actual category of module sheaves, restriction to rational slice sites, free module sheaves and their underlying additive sheaves. |
| `CategoryTheory.Sheaf.H'` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` | Positive-degree cohomology on a site; R5 states vanishing for its coefficient and localized module sheaves. |
| `CategoryTheory.cechComplexFunctor` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean` | R5 uses the library alternating Čech complex of the actual rational covering family, with finite products on the slice site. |
| `CategoryTheory.Over.forget`, `CategoryTheory.Over.map` | `Mathlib/CategoryTheory/Comma/Over/Basic.lean` | The rational subdomains of `U` form `Over U`; R5 uses the forgetful and composition functors for localization and its restriction. |

| F1 supplier | Exact file | Contract used |
|---|---|---|
| `MvPowerSeries.IsRestricted`, `MvPowerSeries.IsRestricted.subring` | `Mathlib/RingTheory/MvPowerSeries/Restricted.lean` | Restricted multivariate series; `radiusTate` only adds a `K`-subalgebra view at constant radius. |
| `MvPowerSeries.gaussNorm` | `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean` | Real supremum of weighted coefficients; `radiusGaussNorm` and its value at radius `1` specialise the coefficient norm and constant radius. |
| `MvPowerSeries.IsRestricted.gaussNorm_mul` | `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` | Multiplicativity for positive radii and restricted series. Apply at radius one to elements of `W_n`; no dagger-specific multiplicativity theorem is needed. |
| `Subalgebra.isDomain` | `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean` | A subalgebra of a domain is a domain; apply to `W_n ⊆ K⟦X⟧`. |
| `closure_empty`, `Set.empty_subset` | `Mathlib/Topology/Closure.lean`, `Mathlib/Data/Set/Basic.lean` | The empty closure is empty and lies in every subset; these give the empty case of the strict-neighbourhood closure criterion. |
| `CochainComplex.of`, `CochainComplex.of_d` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` | Construct a cochain complex from specified consecutive differentials and square-zero equations. F1 supplies the exterior derivative. |
| `AdicCompletion.of_injective_iff`, `AdicCompletion.algebraMap_apply` | `Mathlib/RingTheory/AdicCompletion/Basic.lean`, `Mathlib/RingTheory/AdicCompletion/Algebra.lean` | F1 applies the supplied completion kernel criterion to the inclusion of the weak-completion subalgebra. |
| `LinearMap.baseChange`, `LinearMap.baseChange_tmul` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | F1 uses scalar extension of the actual stage module maps in eventual isomorphism and exactness statements. |
| `CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` | F1 states affinoid coherent vanishing for the supplied Ext-defined sheaf cohomology. |
| `Seminorm` | `Mathlib/Analysis/Normed/Module/Seminorm/Basic.lean` | Subadditive homogeneous real seminorms. F1 imposes the ultrametric inequality and stagewise continuity to construct the nonarchimedean locally convex topology. |
| `MvPowerSeries.rename` | `Mathlib/RingTheory/MvPowerSeries/Rename.lean` | Algebra homomorphism renaming variables by a map with finite fibres; F1 uses the two finite block inclusions to write the tensor relation ideal. |
| `exteriorPower.instFinite` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` | Exterior powers of finite modules are finite, so the module fringe topology applies in every de Rham degree. |



### From Mathlib and Tau Ceti

The site, sheaf, cohomology, tensor, power-series and completion APIs in the tables are
used directly. Tau Ceti supplies Huber rings and pairs, weighted restricted series, their
Gauss norms, rational localization, uniform rings and the adic-space carrier.
AdicSpaces layers 0–5 own these foundations and the sheafiness and acyclicity statements.

### From TauCetiRoadmap.AdicEtaleGeometry

AdicEtaleGeometry A1 owns *etale-site*, *pro-etale-site-corrected*, *slice-site*,
*proetale-slice*, geometric points (*etale-site-and-geometric-points*) and the local
comparison (*etale-morphisms-local-description-and-comparison*) consumed by R4.
It also supplies the strongly sheafy predicate (*strongly-sheafy-huber-pair*),
the structure sheaf (*etale-structure-sheaf*), *basis-comparison* and
*etale-covering-reduction* consumed by R5.
The perfectoid input to these signatures is PerfectoidSpaces P1.1's predicate (below);
AdicEtaleGeometry does not own it, and the same predicate is used by the perfectoid frames
in R5.

| Supplier | Exact file | Contract used |
|---|---|---|
| AdicEtaleGeometry A0.6 (the spectrum of a complete pair, its sheafiness, and its canonical isomorphism with the AdicSpacesPartII affinoid spectrum) | `TauCetiRoadmap/AdicEtaleGeometry/README.md` | The complete-pair spectrum is canonically isomorphic to the Part II affinoid spectrum, fixing valuations and coefficient sections. R4 uses this isomorphism in the scalar-map equations for smooth-pair charts. |
| `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.IsEtaleLocalDescription.iff_etale`, `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth` (A1 *etale-morphisms-local-description-and-comparison*) | `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` | With separate locally noetherian analytic hypotheses on source and target, the Part II predicates are equivalent to the Tate-chart conditions, including finite type and infinitesimal lifting. |

R5 proves the perfectoid-frame consequences of rational localization and finite étale
extension directly in `Huber.isSousperfectoid_ratLoc` and
`Huber.IsSousperfectoid.finiteEtale`, using the ring predicate above. PerfectoidSpaces
P1–P3 develop the broader perfectoid and almost-purity APIs. PerfectoidSpaces P2.11–P2.12
supply the global tilting functor
on locally perfectoid spaces, its natural valuation homeomorphism, and the
relative equivalence over each space. On every open, the tilted structure sheaf
is the inverse Frobenius limit: multiplication is coordinatewise, addition is
the limit of the powered sums, and the zeroth coordinate determines valuations.
The identifications commute with restrictions and morphisms (Scholze,
*Perfectoid spaces*, Theorem 6.3 and Proposition 6.17; Berkeley Theorems
6.2.6–6.2.7 and 7.1.4, pp. 45, 49–50).
**Check:** take the tilting functor and its actual structure-sheaf sections on the empty
open of each tilted space. That ring is subsingleton and satisfies `p·1 = 0`,
but not `CharP R p` for prime `p`; thus the sheaf clause asserts `p·1 = 0`, including
on empty opens. The supplied homeomorphism carries the empty
open to the empty open, and every coordinate of its section-comparison map is zero.
`AdicSpace.IsTildeLimit`, `AdicSpace.IsTildeLimit.affinoid` and
`AdicSpace.IsTildeLimit.baseChange`, with the completed-direct-limit criterion of
*tilde-limits-affinoid-criterion*,
in R5.8 supply the tilde-limit relation and its affinoid and base-change contracts.
PerfectoidSpaces P7 applies these contracts to analytic towers.
AdicEtaleGeometry uses PerfectoidSpaces' perfectoid predicate and states its own
frame-free conditions, so its Lean module supplies the sites without importing R5's
API.

### From TauCetiRoadmap.PerfectoidSpaces

| Supplier | Exact file | Contract used |
|---|---|---|
| `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing` (P1.1) | `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` | The perfectoid Tate-ring predicate, used unchanged: on a complete Hausdorff Tate ring, `A°` is bounded and some pseudouniformiser `ϖ ∈ A°` has `ϖ^p ∣ p` with Frobenius `A°/ϖ → A°/ϖ^p` bijective. Perfectoid fields (P1.10), perfected Tate algebras (P1.30), `ℚ_p^cycl` (P1.31), rational localisation of perfectoid pairs (P2.3), affinoid perfectoid and perfectoid spaces (P2.9–P2.10), finite étale algebras over perfectoid rings (P3.10), tilting (P2.11–P2.12) and Elkik's approximation theorem (P3.1) are cited by subsection. |

### From TauCetiRoadmap.SchemeAndStackFoundations

SF.0 supplies *excellent-ring*, *quasi-excellent-ring*, the G-ring definition (*g-ring*)
and *regular-map-completion* for F1. SF.4 supplies *strict-normal-crossings* for R4 and
de Jong's strictly semistable alteration theorem (*semistable-alteration-theorem*) for F1.

| Statement used | Supplier | Contract used |
|---|---|---|
| excellence of rings | SchemeAndStackFoundations SF.0, *excellent-ring* | Noetherian G-rings satisfying J-2 and universal catenarity; used unchanged by *dagger-algebra-excellent*. |

### From TauCetiRoadmap.AdicSpacesPartII

| Supplier target | Exact file | Contract used |
|---|---|---|
| `TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom`, `TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom.continuous`; composition of adic homomorphisms (R0.1 *adic-ring-homomorphism*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | `φ : A → B` is *adic* if there are pairs of definition `(A₀, I)` of `A` and `(B₀, J)` of `B` with `φ(A₀) ⊆ B₀` and `J = φ(I)·B₀` (Huber 1994 §3, Wedhorn Definition 6.23). A class on the ring homomorphism, like Mathlib's `IsLocalHom`. |
| R0.3 *completed-tensor-product* (the tensor topology on `B ⊗_A C`, which is a ring topology, with its basis of neighbourhoods of `0`) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The tensor topology and its separated completion for adic homomorphisms, with the integral plus ring and both coefficient maps. |
| R0.3 *completed-tensor-product-universal-property* (the induced map out of `B ⊗̂_A C` and its composites with the two coefficient maps) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | the continuous homomorphism `B ⊗̂_A C → R` induced by continuous `φ : B → R`, `ψ : C → R` with `φ ∘ f = ψ ∘ g`, into a complete Hausdorff nonarchimedean ring (R0/completed-tensor-product-universal-property). |
| R0.3 *completed-tensor-restricted-power-series* (images of weight families; the identification of `B ⊗̂_A A⟨T⟩_w` with weighted restricted series over `B`, as a homeomorphism) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | along an adic homomorphism, the image of a weight family of finite sets is a weight family; with it the completed tensor product with weighted restricted series is computed. |
| R0.3 *completed-tensor-rational-localisation* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | part (1): for rational subsets `R(T₁/s₁)` of `Spa B` and `R(T₂/s₂)` of `Spa C` (`T_i` generating open ideals), the intersection of their preimages in `Spa(B ⊗̂_A C)` is the rational subset `R(inl(T₁ ∪ {s₁})·inr(T₂ ∪ {s₂}) / inl(s₁)·inr(s₂))`. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart`, `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Affinoid`, `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.HomChart` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Complete sheafy affinoid charts and charts of morphisms. Coefficients and plus rings are `Chart.affinoid.ring` and `Chart.affinoid.pair.plus`; the open immersion is `Chart.ι`, with point and stalk maps from `Chart.ι.hom`. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsAdic` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Adicness is local on affinoid charts. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsLocallyNoetherian`; its noetherian-type affinoid neighbourhoods and their basis (R0.6 *locally-noetherian-adic-space*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Local noetherian type is tested on actual open affinoid presentations. |
| R0.7 *affinoid-fibre-product* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The sheafy completed tensor product represents the affinoid pullback. The comparison fixes the topology, the plus ring and both structural homomorphisms. |
| R0.7 *fibre-products-existence* (the weighted exhaustion) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber96, proof of Proposition 1.2.2, pp. 47–49: enlarging the weights by powers of an ideal of definition constructs the fibre product for an arbitrary base change. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.hasPullback_of_finiteType`; pullbacks along universally closed and universally specializing morphisms (R0.7 *fibre-products-existence*, R0.10 *universally-closed-morphism*, *universally-specializing-morphism*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber 1.2.2, with stable affinoid charts explicitly required. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.exists_pullback_point` and its affinoid core (R0.7 *fibre-product-points*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | affinoid core: for complete Huber pairs and adic `A → B`, `A → C`, every pair of points of `Spa B`, `Spa C` over the same point of `Spa A` comes from a point of `Spa(B ⊗̂_A C)` (via R0/valuation-amalgamation). |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsAdic.baseChange`; base change of local finite type (R0.6 *finite-type-morphism-classes*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Adicness and local finite type are stable under geometric base change. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsClosedImmersion`, `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.HasStablySheafyCharts` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | AdicSpaces §5.1: a closed immersion is affinoid-locally an open quotient homomorphism, with the quotient plus ring and the entire inverse image as source. |
| RigidAnalyticGeometry §2.1.1, §2.1.3 (`RigidAnalyticGeometry.evalNorm`, `RigidAnalyticGeometry.supSeminorm`), read through AdicSpacesPartII's R0.9 carrier bridge; `TauCetiRoadmap.AdicSpacesPartII.Huber.TateAlgebra.ofMvPolynomial`; the Gauss norm of the Tate algebra (R0.9 *tate-algebra-gauss-norm-attained*) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | `∣f(x)∣` for `x ∈ Max A`, the spectral norm of the residue class of `f` in the finite extension `A/x` of `K`. |
| RigidAnalyticGeometry §2.2.1 (`RigidAnalyticGeometry.exists_evalNorm_eq_supSeminorm`), read through AdicSpacesPartII's R0.9 carrier bridge | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | the supremum seminorm is attained at a point of `Max A`. |
| RigidAnalyticGeometry §2.3.1–2.3.2 (`RigidAnalyticGeometry.isBounded_range_pow_iff`, `RigidAnalyticGeometry.isTopologicallyNilpotent_iff`), read as membership in the power-bounded subring and its topologically nilpotent analogue through AdicSpacesPartII's R0.9 carrier bridge (R0.9 *affinoid-power-bounded-iff-sup*) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | `A° = {∣f∣_sup ≤ 1}`, and `A°° = {∣f∣_sup < 1}`. |
| R0.9 *reduced-affinoid-supremum-norm* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | on a reduced `K`-affinoid algebra the supremum norm is equivalent to the residue norm of every presentation, so the algebra is uniform. |
| R0.9 *affinoid-reduction-finite* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | a finite map `φ` of `K`-affinoid algebras maps `A°` into `B°` and `A°°` into `B°°`, and the induced map of reductions `A°/A°° → B°/B°°` is finite (Tau Ceti `topologicallyNilpotentIdeal` is `A°°`). |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsSeparated`; the existence of its diagonal pullback (R0.10 *separated-morphism*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber 1.3.1: local weak finite type and a closed diagonal, with stably sheafy source charts. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsPartiallyProper` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Huber 1.3.3(ii): plus weak finite type, separated, universally specializing. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.IsFinite` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Target-local finiteness includes that a whole inverse image is one affinoid chart. |
| R0.15 *continuous-differentials* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The continuous differential module I/I², with its rational-localization equivalence and the formula d(b) ↦ 1 ⊗ d(b). |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Smooth`, `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Smooth_affinoid` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Smooth morphisms are locally of finite presentation and formally smooth on complete affinoid charts. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Etale.of_isOpenImmersion` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | Open immersions are étale. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Etale.comp`; composition of smooth morphisms (R0.16 *etale-smooth-composition*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Composites of smooth morphisms are smooth, and composites of étale morphisms are étale. |
| R0.16 *etale-smooth-cancellation* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The smooth and étale cancellation criteria for composites retain their source and target finiteness hypotheses. |
| R0.16 *smooth-differentials-locally-free* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber 1.6.9: on a smooth affinoid chart the continuous differential module is finite projective. Its rank can vary between connected components. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Etale.baseChange`; base change of smooth morphisms (R0.16 *smooth-etale-base-change*) | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | Smooth and étale morphisms remain smooth and étale in geometric pullback squares. |
| R0.17 *smooth-local-structure* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber 1.6.10: locally a smooth map factors étale through a weighted polydisc. |
| `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Smooth.isOpenMap` | `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean` | A smooth morphism is open on the underlying topological spaces. |
| RigidAnalyticGeometry §1.4.2–1.4.3, §4.1.1–4.1.4, §4.2.1–4.2.2 (`RigidAnalyticGeometry.AffinoidSubdomain`), read through AdicSpacesPartII's R0.9 carrier bridge (R1.1 *affinoid-subdomain*) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | For a `K`-affinoid algebra `A`, `U ⊆ Max A` is an affinoid subdomain if some `K`-affinoid `A`-algebra `A_U` has `Max A_U → Max A` landing in `U` and represents the `K`-affinoid `A`-algebras `B` with `Max B → Max A` landing in `U`: there is exactly one `A`-algebra map `A_U → B`. |
| RigidAnalyticGeometry §4.6.3 (`RigidAnalyticGeometry.gerritzenGrauert`), read through AdicSpacesPartII's R0.9 carrier bridge; the rational refinement of R1.1 *gerritzen-grauert* | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | for an affinoid subdomain `U`, there is a finite covering of `Max A` by rational subdomains `Vᵢ` such that each `U ∩ Vᵢ` is a rational subdomain of `Max A_{Vᵢ}`. |
| R1.1 *rigid-analytic-space* (rigid spaces, `Sp A` and its locally G-ringed space) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | A rigid space is a locally G-ringed `K`-space with an admissible affinoid atlas. The atlas is a covering sieve, rather than just a covering of its classical points. |
| R1.1 *rigid-analytification* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The rigid representing object for morphisms to a scheme locally of finite type over `K`. Conrad, Irreducible Components, Appendix A.1, p. 32. |
| R1.2 *scheme-fibre-product-analytification* (the mixed fibre product and its functoriality) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | The mixed fibre product represents compatible adic and locally ringed morphisms. Huber 1994, Proposition 3.8. |
| R1.2 *scheme-fibre-product-analytification*, *analytification-points* (analytic lifts of compatible pairs; the map from an affinoid to the spectrum of its ring) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber 1994, 3.9(ii): every compatible pair has an analytic lift. |
| R1.3 *analytification-functor* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Schemes locally of finite type over an affinoid coefficient ring. |
| R1.3 *analytic-affine-space* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | a power series over `K` is restricted for every chart weight `{ϖ^k}` (that is, lies in every `K⟨ϖ^k T⟩`) if and only if it is entire: `∣a_ν∣ r^{∣ν∣} → 0` for every real `r > 0`. |
| R1.4 *analytification-immersions* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Relative analytification preserves open and closed immersions. |
| R1.4 *analytification-fibre-products* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Relative analytification carries scheme pullback squares to geometric pullback squares. |
| R1.4 *analytification-etale-smooth* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Relative analytification preserves étale and smooth morphisms. |
| R1.7 *rigid-adic-comparison-functor* (Huber's functor `r`, the map `ρ` and sections) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber's functor is characterized by its affinoid charts and their gluings. |
| R1.7 *proper-separated-comparisons* | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber96, Remark 1.3.19, with the discrete-valuation caveat kept in the converse. |
| R1.7 *rigid-adic-etale-comparison* (smooth, étale and unramified morphisms under `r`) | `TauCetiRoadmap/AdicSpacesPartII/README.md` | Huber96, Proposition 1.7.11(ii), pp. 89–90: smoothness agrees with the admissible affinoid étale-chart definition on rigid spaces. |
| RigidAnalyticGeometry, *Targets requested by the Tau Ceti AdicSpaces roadmaps*, **AffinoidSubdomain.injective_of_isDomain** (`RigidAnalyticGeometry.AffinoidSubdomain.injective_of_isDomain`), read through AdicSpacesPartII's R0.9 carrier bridge (R1.9) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` and `Suggested.lean`; `TauCetiRoadmap/AdicSpacesPartII/README.md` | for a `K`-affinoid integral domain `A` and a nonempty affinoid subdomain `U ⊆ Max A`, restriction `A → A_U` is injective. |

### From the student roadmaps

| Supplier target | Exact file | Contract used |
|---|---|---|
| RigidAnalyticGeometry §4.4.4, reducedness on affinoid subdomains (no declaration name specified) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` | Rational localisations of reduced `K`-affinoid algebras are reduced; R5.6's *rational-integral-compatibility* proves the comparison with the actual plus ring on this roadmap's side. The roadmap of W. Coram is to be contributed to TauCetiRoadmap ahead of this one. |
| RigidAnalyticGeometry §1.5.1–1.5.2, polyradius Tate algebras and the affinoid criterion (no declaration names specified) | W. Coram's roadmap, `PhD/TauCeti/Roadmaps/RigidAnalyticGeometry/README.md` | The constant-polyradius specialisation supplies the radius pieces and their multiplicative Banach norms, polynomial density and affinoidness for radii in `Γ*`; §1.3.3 identifies the Banach topology with the algebraic carrier's affinoid topology. The roadmap of W. Coram is to be contributed to TauCetiRoadmap ahead of this one. |

#### Local restatements

- `Dagger.radiusTate` restates RigidAnalyticGeometry §1.5.1 at the constant polyradius as a
  `K`-subalgebra of formal series; `Dagger.washnitzerAlgebra`, its variables and its Checks use
  this carrier. The coefficient construction makes sense without completeness of `K`.
- `Dagger.radiusGaussNorm` restates RigidAnalyticGeometry §1.5.1's Gauss-norm function at the
  constant polyradius; `Dagger.isUnit_washnitzerAlgebra_iff` uses its value at radius `1`.
  The norm interpretation is restricted to `T_n(ρ)` for `ρ > 0`.

### From TauCetiRoadmap.AdicSpacesPartIII

| Supplier target | Exact file | Contract used |
|---|---|---|
| F0.1 *restricted-power-series-adic* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | `I·A{T}` is an ideal of definition of `A{T}`, and `A{T} ⧸ I^{n+1}A{T} ≅ (A ⧸ I^{n+1})[T₁,…,T_r]` (EGA 0, 7.5.1). |
| `TauCetiRoadmap.AdicSpacesPartIII.AdicRing.CompletedTensorProduct` | `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` | The adic completion of the algebraic tensor product, with its ideal-adic topology, agrees with Part II’s completed tensor for adic structure maps. |
| R2.1–R2.2 *topologically-finitely-presented-algebra*, *admissible-formal-scheme*, *tfp-locality* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Local topological finite presentation, tested on all affine opens (BL I 1.7). |
| R2.3 *generic-fibre-functor-d* (analytic specialisation data, their precomposition and generic fibre data) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | A continuous ring-sheaf map with integral image, local on integral stalks, and with a nonvanishing topologically nilpotent section at each analytic point. |
| R2.4 *specialisation-map* (the specialisation map on an affine formal scheme and preimages of basic opens) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | ring-level core of the formula for specialisation on `Spf A` and of its identification with the centre: for `φ : A → B` with `φ(A) ⊆ B⁺` and `v ∈ Spa(B, B⁺)` (for `d(Spf A)`: `B = A(1/s)` and `B⁺` the integral closure of `A`), `λ(v) = {a ∈ A : v(φ a) < 1}` is a prime ideal of `A`. |
| R2.5 *admissible-blow-up* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | The admissible blow-up represents maps from admissible formal schemes making the centre invertible. This universal property is in the category over Spf O. |
| R2.2 and R2.9 (Conrad's category `FS_C`, continuous integral maps and their precomposition; *berthelot-type-rig-functor-nonnoetherian-base*) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Conrad, Definition 3.1.1: locally noetherian formal schemes whose reduced structural map is locally of finite type. The structural map need not be adic. |
| R3.1 *associated-module-sheaf* (module sheaves, the associated sheaf `M̃` and its sections on rational subsets) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Module sheaves on the ordinary open site, the coefficient action on sections, and the associated tensor sheaf. |
| R3.1 *tate-acyclicity-finite-modules* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | The sheaf associated with a finite module on a noetherian-type affinoid has zero higher cohomology. |
| R3 *coherent-sheaf* (coherence and the category of coherent sheaves) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Coherence is local association with finite modules on noetherian-type affinoid charts; pullback uses the Part II ring-sheaf morphism. |
| R3.2 *tate-kiehl-affinoid* (the coherent equivalence on an affinoid) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | KL15 2.5.20(b): association and global sections are inverse equivalences. |
| R3.4 *quasi-stein-theorems-a-b* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | Kiehl's Theorem B for the actual sheaf cohomology of coherent modules. |
| R3.5 *locally-free-sheaf* (vector bundles on a sheafy Tate affinoid) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | KL15 2.7.7: finite projective modules are exactly vector bundles on a sheafy Tate affinoid. |
| R3.6 *sheaf-of-continuous-differentials* | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | The coherent sheaf representing continuous relative derivations, its universal derivation and its comparison with affinoid continuous differentials. |
| R3.6 *kiehl-proper-mapping-theorem*, *proper-affinoid-cohomology-finite*, *proper-cohomology-affinoid-subdomain* | `TauCetiRoadmap/AdicSpacesPartIII/README.md`; RigidAnalyticGeometry, *Targets requested by the Tau Ceti AdicSpaces roadmaps*, **kiehlProperMapping**, **proper_cohomology_finite**, **proper_cohomology_affinoidSubdomain** | Coherence and finite cohomology for proper rigid maps, and the canonical algebraic tensor comparison for restriction to an affinoid subdomain. F1.10's *dagger-projection-fringe-comparison* uses these on the rigid product stages and owns the passage to dagger cohomology and the overconvergence of the trace. |
| R3.7 *proper-gaga* (the comparison of coherent higher direct images) and R3.3 *coherent-sheaf-operations* (kernels, cokernels and extensions of coherent sheaves) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` | For proper scheme maps over a strongly noetherian Tate affinoid, the canonical comparison of coherent higher direct images is an isomorphism. |


The formal supplier contracts are AdicSpacesPartIII's, on its formal-scheme and
rigid-space carriers. The generic fibre (R2.3 *generic-fibre-functor-d*) represents continuous
integral specialization maps that are local on integral stalks and make an ideal
of definition invertible locally (Huber96 §1.9, Proposition 1.9.1, pp. 96–97).
The admissible blow-up (R2.5 *admissible-blow-up*) uses a finite-type ideal containing a
power of the base uniformiser locally and is characterized by unique
factorization of maps on which that ideal becomes invertible (BL I Proposition 2.1, p. 299).
Its affine charts are the
uniformiser-adic completions of
`A[T_j]/((a_i T_j − a_j)_j : a_i^∞)`. The overlap with chart `j` is the locus
where `T_j` is a unit. Saturation commutes with flat scalar extension, and the chart of
the completed tensor product is the completed tensor
chart; both maps are fixed on polynomial pure tensors. These statements use
Bosch-Lectures §2.6, Propositions 4, 6–7, pp. 147–150.
**Checks:** in the unit case the chart is `A[T]/(T−1) = A`;
a zero generator makes its chart empty;
in `ℤ[T]`, `T ∉ (2T)` but `2T ∈ (2T)`,
so saturation is necessary.
Berthelot's generic fibre (R2 *berthelot-type-rig-functor-nonnoetherian-base*) uses a noetherian coefficient ring,
a locally noetherian formal scheme with finite-type reduction, and a complete
nonarchimedean coefficient field; its affine representing maps are continuous,
power-bounded, topologically nilpotent on topologically nilpotent elements, and
linear over the coefficient ring (Conrad-MR §3.1, Theorem 3.1.5, pp. 16–17).
As a functor on locally
noetherian formal schemes with locally finite-type reduction it preserves finite
limits, open immersions and open covers. The affine representing equivalences
commute with both formal pullback and rigid precomposition, so the same functor
identifies overlaps and their iterated intersections.

SchemeAndStackFoundations SF.4's strictly semistable pairs (*semistable-alteration-theorem*)
use étale charts over
`O[T₁,…,Tₙ]/(T₁⋯Tᵣ−π)` and a boundary given by distinct coordinates. The branches
through each point belong to distinct global irreducible components.
The alteration theorem used is the proper alteration theorem over a
complete DVR, with a finite local extension of complete DVRs and a dense open
where the alteration is finite (GK02 §3.1 and Theorem 3.3, p. 22; de Jong 6.5).
The nonproper varieties in F1 are placed in proper varieties before applying it,
as in the proof of GK02 Theorem 3.4, pp. 22–23.

**Checks.** The empty scheme with empty boundary is a strictly semistable pair;
so is the trait with its reduced closed point as boundary;
the whole of a nonempty scheme is excluded
as boundary.

The adic morphism contracts use Part II's `AdicSpace.IsAdic`, `IsFinite`,
`LocallyOfFiniteType`, `Etale`, `Smooth`, `IsClosedImmersion`, `IsSeparated` and
`IsPartiallyProper`. Smoothness and étaleness are predicates on Part II's
`HomChart`; their Tate-chart descriptions use the two AdicEtaleGeometry
equivalences above with separate locally noetherian analytic hypotheses.
The closed-immersion and properness contracts retain the affinoid quotient,
finite-type and stably-sheafy hypotheses of R0. Part II's comparisons of
separatedness, properness and partial properness under `r`
(R1.7 *proper-separated-comparisons*) give the rigid comparison; the converses for
properness and partial properness require a
discrete valuation ring of integers (Huber96, Remark 1.3.19).

Part II's *analytification-etale-smooth* compares scheme smoothness with Part II's
`Smooth` on the adic realization; its étale comparison uses A1's unchanged local
description. The openness of smooth morphisms
(`TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Smooth.isOpenMap`, *smooth-morphism-open*)
assumes locally noetherian analytic
source and target separately from smoothness (Huber96, Proposition 1.7.8).

**Checks.** The identity and the empty map are closed immersions, while a split
double cover is not. The identity and the split double cover are separated, while
the disc with doubled origin is not.
Part II's partial-properness Checks compare the identity with the closed and open
discs, whose boundary conditions differ.

For coherent modules, F1 uses AdicSpacesPartIII's Kiehl theorem (*tate-kiehl-affinoid*)
with actual global sections and
the affinoid scalar action. Its quasi-Stein theorem (*quasi-stein-theorems-a-b*)
gives finite generation
on each affinoid stage by global sections and vanishing of positive cohomology
for an admissible exhaustion with dense successive restrictions.
Proper GAGA (*proper-gaga*) gives full faithfulness and essential surjectivity
of analytification pullback on coherent sheaves for a proper scheme over the
complete field (Kiehl-AB; Conrad-RA, Remark A.1.1, pp. 38–39, for proper GAGA),
and the relative comparison for a
proper map of finite-type schemes over the complete field. Its degree-zero map
is the adjoint of pullback of sections, and its equation on injective resolutions
fixes the comparison in all degrees. Each component is an isomorphism on coherent
sheaves. Taking the target to be the ground-field point gives cohomological GAGA
(Conrad-RA (A.1.1), pp. 38–39).

## How to read the build

R4 places AdicEtaleGeometry A1's sites on the analytic carriers of parts II and III.
R5 develops sousperfectoid rings and spaces and the coefficient sheaves of `p`-adic families.
F1 develops dagger geometry and its de Rham complexes, using the morphism, formal and
coherent theories of parts II and III and the smooth pairs of R4.
A target's `*Needs:*` clause names its prerequisites. Within a layer the subsections follow
the mathematics; supporting results shared by several targets may occur in that layer's
last subsections. `Suggested.lean` provides suggested signatures and examples, while this
README is definitive and is not limited to the signatures present in that file.
`Suggested.lean` states the parts that are a few lines over the pinned carriers: strict
normal crossings charts of rings, of complete affinoid algebras and of smooth schemes (R4);
perfectoid frames, sousperfectoid rings and spaces, BHW's product, tilde-limits, profinite
flat modules, small `ℤ_p`-algebras and the integral mixed completed tensor product (R5);
`W_n`, dagger algebras and their completions, the integral Monsky–Washnitzer algebra, weak
completions, algebras of MW-type and the universally finite differentials with the dagger
Poincaré lemma in low degree (F1). A target carried there ends with a **Lean:** note;
everything else — the sites, smooth pairs as global objects, the boundary-complement
functors, coefficient sheaves, dagger spaces and their cohomology, and every named API
statement and Check without such a note — is specified in this README only.

R4's *etale-site-on-analytic-carriers*, *etale-slice-site* and
*proetale-slice-open-subspace* are the applications of A1's *etale-site*, *slice-site* and
*proetale-slice* to these carriers, and each names its A1 supplier.
AdicSpacesPartII's *smooth-morphism-open* covers both the étale openness result and the
openness of smooth morphisms used here.

## Layer R4: étale and pro-étale sites

This layer builds on layers AdicSpacesPartII R0 and AdicSpacesPartII R1 and on AdicEtaleGeometry layer A1. It carries the étale and
pro-étale sites of AdicEtaleGeometry layer A1 onto the carriers of layers AdicSpacesPartII R0 and AdicSpacesPartII R1 — the locally
noetherian analytic adic spaces, among them `r(X_rig)` for a rigid analytic variety and `X^ad` for a
scheme locally of finite type over a complete nonarchimedean field — and proves on them what the
consumers need. The étale site with its base-change morphisms and slices, the corrected pro-étale
site with its slices and the projection `ν : X_proét → X_ét`, and geometric points as points of the
étale site are AdicEtaleGeometry layer A1's and are cited; this layer adds the functoriality of the
corrected pro-étale site, the compatibility of Scholze's point morphisms with pullback, Huber's
equivalence between the étale topos of a rigid analytic variety and that of its adic space,
with the comparison of strongly surjective rigid families and jointly surjective adic families; the
morphism of sites `λ_X : X^ad_ét → X_ét` for a scheme locally of finite type; smooth pairs `(X, D)`
of a smooth adic space with a strict normal crossings divisor, the
analytification of algebraic strict normal crossings pairs, and the restriction of the étale and
pro-étale sites of a smooth pair to the complement of its boundary with the functors `j^{-1}`, `j_*`
and `j_!`. The adic sites are supplied by A1; the rigid étale site is defined here,
and no derived cohomology is defined; comparison
theorems for cohomology and the derived functors of `j_!` and `j_*` belong to the
étale-cohomology roadmaps that import this one.

### R4.1 the étale site on the analytic carriers

**The étale site of AdicEtaleGeometry layer A1 on the analytic carriers of layers AdicSpacesPartII R0 and AdicSpacesPartII R1.**
(*etale-site-on-analytic-carriers*) Let `X` be a locally noetherian analytic adic space
(*locally-noetherian-adic-space*, AdicSpacesPartII layer R0): every point has an open affinoid neighbourhood
`Spa(A, A⁺)` with `A` a strongly noetherian complete Tate ring or with a noetherian ring of
definition, and every point is analytic. This covers `r(X_rig)` for a rigid analytic variety `X_rig`
over a complete nonarchimedean field `k` (*rigid-adic-comparison-functor*, AdicSpacesPartII layer R1) and `X^ad` for a
scheme `X` locally of finite type over `k` (*analytification-functor*, AdicSpacesPartII layer R1). The small étale
site `X_ét` of `X` is AdicEtaleGeometry layer A1 (*etale-site*): A1's small étale category of `X` with the
topology generated by the jointly surjective families, constructed there for locally strongly
sheafy `X` (A1, *strongly-sheafy-huber-pair*, whose examples include the strongly noetherian Tate
rings and the Tate rings with a noetherian ring of definition, and whose convention places the
locally noetherian analytic spaces among the locally strongly sheafy ones); no other étale site is
constructed. It is used here with the hypotheses that `X` is locally noetherian and analytic, where
its objects are the adic spaces étale over `X` in the sense of AdicSpacesPartII layer R0
(*differentials-unramified-smooth-etale*; Huber96 §1.6, Def. 1.6.5): the identification of Huber's
infinitesimal class with A1's local-description class (locally on the source an open immersion, a
finite étale morphism and an open immersion) is A1 (*etale-morphisms-local-description-and-comparison*),
which imports Huber's Lemma 2.2.8 from AdicSpacesPartII layer R0 (*etale-local-open-finite-etale-factorisation*)
(Huber96 §2.2, Lem. 2.2.8; KL15 §8.2, Def. 8.2.16, p. 162). Open subspaces of `X` are objects of
`X_ét` (*open-embedding-etale*, AdicSpacesPartII layer R0) and open covers are étale coverings; only the coverings by
jointly surjective families are used, not Huber's strongly surjective rigid coverings (Huber96 §2.1,
p. 109; KL15 §8.2, after Def. 8.2.19, p. 163). For non-noetherian carriers (sousperfectoid,
perfectoid) the étale site is A1's local-description site and Huber's infinitesimal definition is
not used; the sousperfectoid case is layer R5's (*sousperfectoid-etale-stability*), which cites
this remark. *Needs:* *locally-noetherian-adic-space*,
*differentials-unramified-smooth-etale*, *etale-local-open-finite-etale-factorisation*,
*open-embedding-etale* (AdicSpacesPartII layer R0); AdicEtaleGeometry layer A1 (*etale-site*,
*strongly-sheafy-huber-pair*, *etale-morphisms-local-description-and-comparison*).

### R4.2 functoriality and slices

**Base change defines a morphism of étale sites.** (*etale-site-functoriality*) For a morphism
`f : X → Y` of locally noetherian analytic adic spaces (any morphism of adic spaces, automatically
adic since `Y` is analytic, *adic-morphism*, AdicSpacesPartII layer R0) the base-change functor `f* : Et/Y → Et/X`,
`V ↦ V ×_Y X`, the morphism of sites `f_ét : X_ét → Y_ét` it defines, with `f_*` the
pushforward along base change (`(f_*F)(V) = F(V ×_Y X)`) and its left
adjoint
`f^{-1}`, and the coherence `(g ∘ f)_* ≅ g_* f_*`, are
AdicEtaleGeometry layer A1 (*etale-site*); they are used here on the carriers of
*etale-site-on-analytic-carriers*, where the fibre products exist by AdicSpacesPartII layer R0
(*fibre-products-existence*, *base-change-stability*, *smooth-etale-base-change*) and jointly
surjective families stay jointly surjective after base change by *fibre-product-points* (Huber96
§1.2, Cor. 1.2.3, p. 49; Huber96 §2.1, p. 109). For an open immersion `j : U → X`, `j*V` is the
preimage `V ×_X U` of `U`. The exact A1 contracts are étale base change with its
projection and its pullback square, its continuity and its preservation of finite limits,
its compatibility with composition and with the projections, and the inverse and direct
images of étale sheaves with their adjunction (AdicEtaleGeometry A1, *etale-site*).
Each takes explicit proofs that source and target
are locally strongly sheafy; local noetherian analyticity supplies those proofs.
These general base-change constructions belong to A1. R4 uses them at the indicated
carriers and supplies the rigid comparison and boundary-complement specialisations. *Needs:* *etale-site-on-analytic-carriers*; AdicEtaleGeometry layer A1
(*etale-site*); *fibre-products-existence*, *base-change-stability*, *smooth-etale-base-change*,
*fibre-product-points*, *adic-morphism* (AdicSpacesPartII layer R0).

**The étale site of an étale `X`-space is the slice site.** (*etale-slice-site*) For `X` a
locally noetherian analytic adic space and `u : U → X` an object of `X_ét`, the equivalence
`U_ét ≃ X_ét/U` identifying the étale topology of `U` with the induced topology on the slice
(Mathlib `CategoryTheory.GrothendieckTopology.over`), under which restriction `u^{-1}` is Mathlib's
`CategoryTheory.GrothendieckTopology.overPullback` and `u_*G(W) = G(W ×_X U)`, is AdicEtaleGeometry
layer A1 (*slice-site*) (Mathlib `CategoryTheory.Over.iteratedSliceEquiv`; Huber96 §2.1, p. 109;
KL15 §8.2, after Def. 8.2.19, p. 163); it is used here with `X` locally noetherian analytic, where
`V → X` is étale exactly when `V → U` is (*etale-smooth-composition*, *etale-smooth-cancellation*,
AdicSpacesPartII layer R0). *Needs:* *etale-site-on-analytic-carriers*; *etale-site-functoriality*; AdicEtaleGeometry
layer A1 (*slice-site*); AdicSpacesPartII layer R0 (*etale-smooth-composition*, *etale-smooth-cancellation*); Mathlib
`CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.GrothendieckTopology.overPullback`,
`CategoryTheory.Over.iteratedSliceEquiv`.

### R4.3 the pro-étale site and ν

**The corrected pro-étale site of AdicEtaleGeometry layer A1 on the analytic carriers, and
`ν : X_proét → X_ét`.** (*proetale-site-on-analytic-carriers*) Let `X` be a locally noetherian
analytic adic space as in *etale-site-on-analytic-carriers* (Scholze's standing hypothesis: locally
`Spa(A, A⁺)` with `A` strongly noetherian or with a noetherian ring of definition; étale objects are
then locally connected) (Scholze13 §3, before Def. 3.3, p. 13). The pro-étale site `X_proét` — the
full subcategory of `pro-(X_ét)` on the objects pro-étale over `X`, with the Grothendieck topology
generated by the corrected coverings of the erratum, whose members factor as `U_i → W_i → U`, with the first map a transfinite
composition of pullbacks of finite étale surjections and the second étale (Scholze13 §3, Def. 3.9, p. 15;
Scholze-Err item (1), p. 1) — and the projection `ν_X : X_proét → X_ét` defined by the fully
faithful, finite-limit- and covering-preserving functor `c : X_ét → X_proét` (Scholze13 §3, before
Lem. 3.16, p. 19) are AdicEtaleGeometry layer A1 (*pro-etale-site-corrected*, with the corrected
coverings displayed as A1's pretopology (*corrected-covers-pretopology*), and
*proetale-projection-nu*); they are used here with `X` locally noetherian analytic, which is the
hypothesis under which Scholze13 §3 is stated. The pro-étale site of a perfectoid or general
analytic adic space in the sense of ECD §8 is a different site, which belongs to DiamondsAndVStacks;
no arbitrary open surjection of profinite sets is assumed to split. Proposition 3.7(i) and
Corollary 3.8 (Proposition 3.8 in the erratum), in Scholze13 §3, pp. 14 and 15 respectively,
and the deleted last sentence of Proposition 3.13 are not used. *Needs:*
*etale-site-on-analytic-carriers*; *locally-noetherian-adic-space* (AdicSpacesPartII layer R0); AdicEtaleGeometry
layer A1 (*pro-etale-site-corrected*, *corrected-covers-pretopology*, *proetale-projection-nu*).

**Functoriality of the corrected pro-étale site and compatibility with `ν`.**
(*proetale-site-functoriality*) Let `f : X → Y` be a morphism of locally noetherian analytic adic
spaces, `f` arbitrary (base change of étale objects exists by AdicSpacesPartII layer R0:
*fibre-product-points*, *smooth-etale-base-change*, *finite-morphism*). The functor
`f* : Y_proét → X_proét`, `lim V_j ↦ lim (V_j ×_Y X)`, is well defined (Scholze13 §3, Lem. 3.10(i),
p. 15: base change of pro-étale objects and surjectivity on underlying spaces), preserves finite
limits and corrected coverings, and defines a morphism of sites `f_proét : X_proét → Y_proét`
(Mathlib `CategoryTheory.Functor.IsContinuous` via `CategoryTheory.CoverPreserving`,
`CategoryTheory.compatiblePreservingOfFlat`, `CategoryTheory.flat_of_preservesFiniteLimits` and
`CategoryTheory.Functor.isContinuous_of_coverPreserving`); it satisfies
`ν_Y ∘ f_proét ≅ f_ét ∘ ν_X`, induced by the canonical
isomorphism `c_X ∘ f* ≅ f* ∘ c_Y`, where `f_ét` is the
morphism of *etale-site-functoriality*, and `(g ∘ f)_proét ≅ g_proét ∘ f_proét` (Scholze13 §3, after
Prop. 3.12, p. 18). The étale/pro-étale base change of Scholze13 §3, Cor. 3.17(ii), p. 20, is stated
only for qcqs `f` and is not asserted for the non-quasi-compact boundary-complement inclusion of
*boundary-complement-restriction*.

The functor `f*` is a named functor from A1's corrected site of `Y` to that of `X`, taking
the local noetherian analyticity of `Y` and of `X` as arguments. For these hypotheses it is
continuous for the corrected topology, it preserves finite limits, and it comes with the
natural isomorphism `c_Y ⋙ f* ≅ f*_ét ⋙ c_X` between the two constant embeddings, `f*_ét`
being A1's étale base change; the point and complement
constructions use this same comparison (Scholze13 §3, Lem. 3.10(i), (vii), pp. 15–17, and pp. 18–19).
For every cofiltered étale presentation `P` of `U`, the object `f*U` has a presentation
with the same index category, whose diagram is that of `P` followed by `f*_ét`. This
includes A1's constant presentation, whose
index category has one object. The combined
existence statement holds with this named functor as witness (Scholze13 §3, Lem. 3.10(i),
p. 15, and site functoriality, p. 18).
For composable `f : X → Y` and `g : Y → Z`, with all three spaces locally noetherian
analytic, there is a natural isomorphism `(f ≫ g)* ≅ g* ⋙ f*`.
This is the contravariant functor form of the displayed composition of site
morphisms (Scholze13 §3, after Prop. 3.12, p. 18).

*Needs:* *proetale-site-on-analytic-carriers*;
*etale-site-functoriality*; AdicEtaleGeometry layer A1 (*pro-etale-site-corrected*,
*proetale-projection-nu*); *fibre-product-points*,
*smooth-etale-base-change*, *finite-morphism* (AdicSpacesPartII layer R0); Mathlib
`CategoryTheory.Functor.IsContinuous`, `CategoryTheory.CoverPreserving`,
`CategoryTheory.compatiblePreservingOfFlat`, `CategoryTheory.flat_of_preservesFiniteLimits`,
`CategoryTheory.Functor.isContinuous_of_coverPreserving`.

**The pro-étale site of an open subspace is the slice site.** (*proetale-slice-open-subspace*) For
`X` a locally noetherian analytic adic space and `U ∈ X_ét` — in particular an open subspace
`j : U → X` — the equivalence of sites `U_proét ≃ X_proét/U` for the corrected coverings (the slice
topology being Mathlib `CategoryTheory.GrothendieckTopology.over`), compatible with `ν` and with the
étale slice equivalence of *etale-slice-site*, is AdicEtaleGeometry layer A1 (*proetale-slice*)
(Scholze13 §3, Lem. 3.10(iii), p. 15; Scholze13 §3, Prop. 3.15, p. 19, the model statement for a
pro-finite-étale object); it is used here with `X` locally noetherian analytic, for the
boundary-complement inclusion of *boundary-complement-restriction*. *Needs:*
*proetale-site-on-analytic-carriers*; *etale-slice-site*; AdicEtaleGeometry layer A1
(*proetale-slice*); Mathlib `CategoryTheory.GrothendieckTopology.over`.

### R4.4 rigid comparison

**The étale topos of a rigid analytic variety is the étale topos of its adic space.**
(*etale-site-and-rigid-comparison*) Let `k` be a complete nonarchimedean field and `X` a rigid
analytic variety over `k`, with adic space `r(X)` (*rigid-adic-comparison-functor*, AdicSpacesPartII layer R1). Let
`X_ét^rig` be the rigid étale site: the category of rigid analytic varieties étale over `X`, with
the Grothendieck topology in which a family is a covering exactly when its image under `r` is a
covering of `r(X)_ét` (equivalently, by *rigid-strongly-surjective-covers*, when it is strongly
surjective in the sense of Huber96 §2.1, Def. 2.1.1). Then the functor `r : X_ét^rig → r(X)_ét`
into the étale site of *etale-site-on-analytic-carriers* induces an equivalence of topoi
`ρ_X : Sh(r(X)_ét) ≃ Sh(X_ét^rig)` (Huber96 §2.1, Prop. 2.1.4, p. 111), for sheaves of sets and
hence for sheaves with values in any category of algebraic structures. The hypothesis is that `X`
is any rigid analytic variety, not necessarily quasi-separated: the proof passes through the
quasi-separated étale objects, on which `r` is an equivalence (Huber96 §1.1, (1.1.11), p. 42), and
compares the dense subsites of objects with quasi-separated structure morphism by the comparison
lemma (Huber96 §2.1, proof of Prop. 2.1.4, p. 111; Mathlib `CategoryTheory.Functor.IsDenseSubsite`,
`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `CategoryTheory.Functor.inducedTopology`,
`CategoryTheory.Functor.sheafInducedTopologyEquivOfIsCoverDense`). The rigid category and its étale
morphisms are supplied by AdicSpacesPartII layer R1 (*rigid-adic-comparison-functor*; the étale comparison of Huber
1.7.11, *rigid-adic-etale-comparison*); `r` is fully faithful
(Huber96 §1.1, (1.1.11)(d), p. 42) and commutes with fibre products. The
coverings of `r(X)_ét` are the jointly surjective families of *etale-site-on-analytic-carriers*
(Huber96 §2.1, p. 109). *Needs:* *etale-site-on-analytic-carriers*;
*rigid-strongly-surjective-covers*; *etale-site-functoriality*; *rigid-adic-comparison-functor*,
*rigid-adic-etale-comparison* (AdicSpacesPartII layer R1); AdicEtaleGeometry layer A1
(*etale-site*); Mathlib `CategoryTheory.Functor.IsDenseSubsite`,
`CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`, `CategoryTheory.Functor.inducedTopology`,
`CategoryTheory.Functor.sheafInducedTopologyEquivOfIsCoverDense`.

**Strongly surjective rigid étale families are exactly those with jointly surjective adic image.**
(*rigid-strongly-surjective-covers*) Let `X` be a rigid analytic variety over `k` and
`(f_i : U_i → U)_i` a family of étale morphisms of rigid varieties over `X`, étale in the rigid
sense. Prove that the family is strongly surjective — every quasi-compact admissible open of `U` is
the union of the images of finitely many quasi-compact admissible opens of the `U_i` (Huber96 §2.1,
Def. 2.1.1, p. 109) — if and only if the family `(r(f_i) : r(U_i) → r(U))_i` is jointly surjective
on points of adic spaces, that is, a covering of `r(X)_ét` in the sense of
*etale-site-on-analytic-carriers* (Huber96 §2.1, Def. 2.1.1 and Lem. 2.1.2 with proof,
pp. 109–110, for a family via the disjoint union, with Huber's proof of both directions; Huber96
§2.1, p. 109, for the adic coverings against which Lemma 2.1.2 compares). Here `r` is the functor of
AdicSpacesPartII layer R1: it commutes with fibre products, quasi-compact admissible opens of a quasi-separated `X`
correspond to quasi-compact opens of `r(X)` (Huber96 §1.1, (1.1.11), pp. 42–43), and constructible
subsets of `r(X)` are determined by their rigid points. *Needs:* *rigid-adic-comparison-functor*,
*rigid-adic-etale-comparison* (AdicSpacesPartII layer R1); *etale-site-on-analytic-carriers*; AdicSpacesPartII layer R0
(*fibre-products-existence*).

Use the rigid stalk criterion of Huber96 Def. 1.7.10(i), p. 89, as the definition of a
rigid étale morphism `f`: for every classical point `y`, the induced local ring map
`φ : O_{X,f(y)} → O_{Y,y}` is flat, the ideal equality
`m_{f(y)} O_{Y,y} = m_y` holds, and the induced residue-field extension is finite
and separable. The ideal equality ensures that the whole residual fibre is a field;
finite separability of the residue fields by itself would admit ramification.
This predicate uses AdicSpacesPartII R1's actual locally ringed rigid spaces and germ-induced stalk maps.
Its comparison with the adic étale class remains AdicSpacesPartII R1's *rigid-adic-etale-comparison*.
Use AdicSpacesPartII R1's stability of rigid étale morphisms (*rigid-adic-etale-comparison*)
under
admissible open immersions, composition and arbitrary rigid base change
(Huber96 Props. 1.6.7(i), (ii), (iv) and 1.7.11(i), pp. 79 and 89).

Define the rigid étale category of `X` using Mathlib's `MorphismProperty.Over`: objects
are rigid spaces with an étale map to `X`, and morphisms are all rigid maps over `X`.
Define its topology by the finite-image sieve condition:
for each quasi-compact admissible open `V` of an object `U`, finitely many arrows
`W_i → U` in the sieve and quasi-compact admissible opens `O_i ⊆ W_i` have images
whose union is exactly `V`. Prove that a family generates a covering sieve
if and only if its underlying rigid family is strongly surjective (Huber96 §2.1,
pp. 109–110). The explicit sieve condition determines the topology on every object,
including the empty one.

**Checks for the rigid étale carrier and topology.**

- Rigid étale maps: the identity is étale, every map from `Sp 0` is étale, and the origin
  `Sp K → Sp K⟨T⟩` is not étale. At the origin the residue field is `K`, but
  the stalk quotient by `(T)` is not flat over the disc stalk.
  A ramified origin tests the independent fibre condition: the finite
  flat disc map `T ↦ S²` is not étale at the origin because `(S²) ≠ (S)`, although
  the residue fields there agree. This also excludes the map in characteristic two.
- The rigid étale category: the over category contains the identity and
  the empty space over every `X`; it contains no object whose underlying map is
  that closed origin inclusion.
- The rigid étale topology: two identical copies of an object cover it;
  the empty sieve covers an object with source `Sp 0`; the empty sieve does not
  cover an object with source `Sp K`.

Define strong surjectivity of a family `f` of rigid morphisms to `U` on the rigid carriers of
AdicSpacesPartII R1 by the
finite-image condition above; the definition also makes sense for arbitrary rigid morphisms.
The comparison theorem retains its étale hypothesis. The union is an equality with the
specified admissible open, so images extending outside that open do not satisfy the condition.

**Checks for strongly surjective families.**

- The singleton identity family on any rigid space
  is strongly surjective: each quasi-compact admissible open supplies its own preimage.
- The empty family covers the empty
  rigid affinoid `Sp 0`; every admissible open there is empty.
- The empty family is not strongly
  surjective over `Sp K`, whose nonempty whole space is quasi-compact.
- Two identity maps to the same rigid space
  form a strongly surjective family; the covering condition does not require disjoint images.

### R4.5 analytification

**The morphism of sites `X^ad_ét → X_ét` for a scheme locally of finite type over `k`.**
(*analytification-etale-site*) Let `k` be a complete nontrivially normed nonarchimedean field and `X` a scheme locally
of finite type over `k`, with analytification `X^ad = X ×_{Spec k} Spa(k, k°)`
(*analytification-functor*, AdicSpacesPartII layer R1; the scheme-adic fibre product is Huber94 §3, Prop. 3.8,
p. 536, *scheme-fibre-product-analytification*, AdicSpacesPartII layer R1). Schemes are Mathlib schemes and étale is
taken in Mathlib's sense (Mathlib `AlgebraicGeometry.Etale`); `X^ad` is locally noetherian because
`Spa(k, k°)` is strongly noetherian. Prove that `X^ad` is locally strongly sheafy
without an extra hypothesis on `X` (Huber96 §1.1,
pp. 37–39, and Cor. 1.7.3, pp. 85–86). Here `X^ad` is the value of Part II's
relative analytification over the stably sheafy field affinoid `Spa(k, k°)`
(*analytification-functor*), followed by forgetting the map to `Spa(k, k°)`. Define the
functor on étale objects by applying
this functor to `U → X` and to each arrow over `X`. The domain scheme `U`
has structural map the composite `U → X → Spec k`; its local finite type property follows from
étaleness and that of `X`. Two defining equations give its value on objects, including
the structure arrow to `X^ad`, and on arrows over `X` (Huber96 Cor. 1.7.3(i), pp. 85–86).
The functor `(−)^ad : X_ét → X^ad_ét`, from the small étale
site of `X` (Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology` on the category Mathlib
`AlgebraicGeometry.Scheme.Etale` of schemes étale over `X`) to the étale site of
*etale-site-on-analytic-carriers*, `U ↦ U^ad = U ×_X X^ad`, is well defined — analytification sends
étale morphisms to étale morphisms (Huber96 §1.7, Cor. 1.7.3(i), pp. 85–86;
*analytification-etale-smooth*, AdicSpacesPartII layer R1) — preserves the final object and fibre products
(*analytification-fibre-products*, AdicSpacesPartII layer R1), and sends jointly surjective étale families to jointly
surjective families, because the points of the scheme-adic fibre product surject onto compatible
pairs of points (Huber94 §3, Lem. 3.9(ii), p. 537; *analytification-points*, AdicSpacesPartII layer R1; the
covering families of the small étale site are characterised by Mathlib
`AlgebraicGeometry.Scheme.ofArrows_mem_smallEtaleTopology_iff`). It therefore defines a morphism of
sites `λ_X : X^ad_ét → X_ét`; continuity
and finite-limit preservation are stated for this defined functor (Mathlib `CategoryTheory.Functor.IsContinuous` through
`CategoryTheory.CoverPreserving`, `CategoryTheory.compatiblePreservingOfFlat`,
`CategoryTheory.flat_of_preservesFiniteLimits` and
`CategoryTheory.Functor.isContinuous_of_coverPreserving`, with direct image
`CategoryTheory.Functor.sheafPushforwardContinuous`), natural in `X` for morphisms of schemes
locally of finite type over `k` (`λ_Y ∘ f^ad_ét ≅ f_ét ∘ λ_X`).
The corresponding isomorphism of
functors `(−)^ad_Y ⋙ (f^ad)* ≅ f* ⋙ (−)^ad_X` holds for every
`k`-morphism `f : X → Y`, using Mathlib's scheme pullback and A1's adic pullback.
It follows from the mixed fibre-product universal property; compare Huber96
(0.7.11), p. 30, and (2.1.3), pp. 110–111. Only the site morphism is
constructed here; comparison theorems for cohomology along `λ_X` belong to the étale-cohomology
roadmaps that import this one. *Needs:* *analytification-functor*, *analytification-etale-smooth*,
*scheme-fibre-product-analytification*, *analytification-fibre-products*, *analytification-points*
(AdicSpacesPartII layer R1); *etale-site-on-analytic-carriers*; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`,
`AlgebraicGeometry.Scheme.Etale`, `AlgebraicGeometry.Etale`, `CategoryTheory.Functor.IsContinuous`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.CoverPreserving`,
`CategoryTheory.compatiblePreservingOfFlat`, `CategoryTheory.flat_of_preservesFiniteLimits`,
`CategoryTheory.Functor.isContinuous_of_coverPreserving`,
`AlgebraicGeometry.Scheme.ofArrows_mem_smallEtaleTopology_iff`.

### R4.6 geometric points and pullback

**Pullback compatibility for Scholze’s pro-étale point morphisms.**
(*geometric-points-pullback*) Let `X` be a locally noetherian analytic adic space. Geometric points
`ξ : Spa(C, C⁺) → X` (`C` an algebraically closed complete nonarchimedean field, `C⁺ ⊆ O_C` an open
and bounded valuation subring, of arbitrary rank), the fibre functor `ε_ξ : U ↦ Hom_X(Spa(C, C⁺), U)`
as a point of the site `X_ét` in Mathlib's sense (`CategoryTheory.GrothendieckTopology.Point`) with
stalks `F_ξ = colim F(U)`, the splitting of étale covers of `Spa(C, C⁺)` on which the covering
property rests, and the compatibility `ε_{f∘ξ} ≅ ε_ξ ∘ f*`, hence `(f^{-1}G)_ξ ≅ G_{f∘ξ}`, for a
morphism `f : X → Y` are AdicEtaleGeometry layer A1 (*etale-site-and-geometric-points*, with the
splitting lemma *geometric-point-etale-split* and its non-example of an étale space over
`Spa(C, C⁺)`, `C⁺ ≠ O_C`, that is not a disjoint union of open subspaces); they are used here with
`X` locally noetherian analytic and `f*` the base change of *etale-site-functoriality*
(Huber96 §2.5, Defs. 2.5.1 and 2.5.3, Lem. 2.5.4, pp. 130–131; for the perfectoid
formulation see ECD §14, Prop. 14.3, p. 82, and §7, Prop. 7.16, p. 36). On the pro-étale site of *proetale-site-on-analytic-carriers*, use A1's
*proetale-fibre-morphism-of-topoi* with its valuation stabiliser. For `x ∈ X`, choose
`x̄ = Spa(C_x,C_x⁺) → Y_x = Spa(k(x)^,k(x)^+) → X`, where `C_x` is the completed algebraic
closure and the valuation on `C_x` extends that at `x`. Put
`D_x = Stab_{Gal(k(x)^sep/k(x)^)}(C_x⁺ ∩ k(x)^sep)`. A1 constructs
`i_x : Sh(D_x-pfsets) → Sh(X_proét)` from the profinite geometric fibre on quasi-compact
objects over an affinoid neighbourhood. For a morphism `f : X → Z` of locally noetherian
analytic adic spaces, choose compatible algebraic closures and valuation extensions at
`x` and `f(x)`. Restriction of automorphisms gives `D_x → D_{f(x)}`; denote the resulting
morphism of profinite-action topoi by `g_D`. Prove the natural isomorphism
`i_x^{-1} ∘ f_proét^{-1} ≅ g_D^{-1} ∘ i_{f(x)}^{-1}`,
equivalently `f_proét ∘ i_x ≅ i_{f(x)} ∘ g_D`. This is the pullback compatibility
of A1's fibre construction, including points of arbitrary rank.

The statement asserts the existence of this
natural isomorphism on sheaves of sets in the universe `Type 1`. Its field-pair carriers are
complete pairs `R` and `S` in A1's sense, with field underlying rings and Tate topology, and their
sheafy adic spectra map to `X` and `Z`. A pair morphism `φ : S → R` makes that square
commute. The geometric points `ξ` over `R` and `η` over `S` have dense algebraic-closure
embeddings `ιR` and `ιS` agreeing with their field maps. A continuous map of their
complete field pairs `c : (C_η,C_η⁺) → (C_ξ,C_ξ⁺)` makes the geometric-point square
commute and satisfies `c⁻¹(C_ξ⁺) = C_η⁺`. The algebraic-closure embedding `j` satisfies
`ιR ∘ j = c ∘ ιS`. The continuous homomorphism `r : D_ξ → D_η` is pinned by
`j(r(σ)(a)) = σ(j(a))`; it is the restriction map for these choices. These hypotheses
allow different complete algebraically closed fields and impose no rank bound.

Here `f_proét` comes from the pro-étale base change of *proetale-site-functoriality*,
which applies A1's étale base change to cofiltered
presentations and their morphisms; it is continuous for the corrected topology, and its
restriction to constant objects is A1's étale base change (Scholze13 §3,
Lemma 3.10(i), p. 15, and site functoriality, pp. 18–19).
Restriction of continuous actions along `r` (Mathlib's `ContAction.res r`)
is continuous for A1's corrected action-site topology: restriction retains the
finite pullbacks, finite surjections and towers defining the covers (Scholze13 §3,
Definition 3.4, p. 13, with Scholze-Err item (1), p. 1).
Both inverse images use Mathlib's sheafified left Kan extension. Thus, as a composite of
functors, the comparison reads `f_proét^{-1} ⋙ i_x^{-1} ≅ i_{f(x)}^{-1} ⋙ r^{-1}`, with the
group homomorphism `r` pointing from `D_x` to `D_{f(x)}`.

**Checks for pro-étale base change.**

- Identity: identity base change is naturally isomorphic to the
  identity functor on the corrected site.
- Empty: identity base change of the constant empty étale object
  over A1's field carrier has empty underlying space.
- Two points: identity base change of the split two-point constant
  étale object has exactly two underlying points.
- Quadratic: for A1's quadratic étale object over `ℚ₂`, the self-pullback of
  `Spa(ℚ₂(√2), ℚ₂(√2)°) → Spa(ℚ₂, ℤ₂)` has exactly two underlying points:
  `ℚ₂(√2) ⊗_{ℚ₂} ℚ₂(√2) ≅ ℚ₂(√2) × ℚ₂(√2)`. The input is A1's constant
  pro-object of `ℚ₂(√2)/ℚ₂`, so this also tests one-stage base change.
- Single stage: every constant étale object pulls back with the
  same one-object index category and the levelwise base-changed diagram.

When both `k(x)^+` and `k(f(x))^+` are henselian, `D_x = G_x` and
`D_{f(x)} = G_{f(x)}`; A1 identifies these action sites with `Y_x,profét` and
`Y_{f(x)},profét`. The isomorphism then reads
`i_x^{-1} ∘ f_proét^{-1} ≅ g_profét^{-1} ∘ i_{f(x)}^{-1}` for the induced field-pair map
`g : Y_x → Y_{f(x)}`. Rank-one points satisfy the henselian hypotheses. This is the
field-pair formulation of Scholze13 §3, Prop. 3.13, first sentence, pp. 18–19.
At arbitrary higher rank the full Galois group need not preserve the chosen valuation;
the action-site formulation uses the decomposition group instead.

The comparison is induced on quasi-compact étale stages by
`Hom_X(x̄, V ×_Z X) ≃ Hom_Z(f∘x̄, V)`, then on inverse limits of these finite sets,
and finally on the sheafified colimits defining inverse images. Over the henselian
field-pair sites these colimits have the form `V ↦ colim_{V → W} F(W)` in Scholze13 §3,
Prop. 3.13, pp. 18–19. For general objects a geometric fibre need not be profinite:
the countable disjoint union over an algebraically closed field point has discrete fibre `ℕ`.
The profinite fibre construction therefore uses the quasi-compact site and A1's passage
from affinoid neighbourhoods to the global topos. Stalks at geometric points alone are not conservative on `X_proét`
(Scholze13 §3, Rem. 3.14, p. 19), and the deleted final sentence of Scholze's Proposition 3.13
(enough points given by profinite covers of geometric points) is not used — the deleted point
assertions are not reinstated (Scholze-Err item (2), p. 1). Enough points are available only
abstractly: `X_proét` is coherent when `|X|` is quasi-compact and quasi-separated
(Scholze13 §3, Prop. 3.12, p. 18), and then `Sh(X_proét)` has enough points by Deligne's theorem,
as the erratum states in place of the deleted sentence (Scholze-Err item (2), p. 1); for general
`X` this holds locally, and the profinite `D_x`-action topos is coherent. The
hypotheses are that `X` is locally noetherian analytic and that geometric points are taken in
Huber's sense with arbitrary valuation subring `C⁺`. The conservativity of the family `(ε_ξ)` and
the description of strict localizations are those of AdicEtaleGeometry layer A1 (Huber96 §2.5,
through *etale-site-and-geometric-points*). *Needs:* AdicEtaleGeometry layer A1
(*etale-site-and-geometric-points*, *geometric-point-etale-split*,
*proetale-fibre-morphism-of-topoi*); *etale-site-on-analytic-carriers*; *etale-site-functoriality*;
*proetale-site-on-analytic-carriers*; *proetale-site-functoriality*; Mathlib
`CategoryTheory.GrothendieckTopology.Point`.

**Checks for point pullback.**

- Identity: for the identity map and the same chosen
  geometric point, the comparison identifies `i_x^{-1}` with itself and the group map is
  `id : D_x → D_x`.
- Rank one: for a finite separable extension of complete
  rank-one fields `L/K`, the comparison restricts continuous `G_K`-actions along
  `G_L → G_K`; a split two-point object remains two points with trivial action.
- Rank two: use A1's rank-two valuation witness (*etale-site-and-geometric-points*)
  for the stabiliser obstruction:
  `K = ℚ((t))` with the composite of the `t`-adic and residual 5-adic valuations.
  Choose the prolongation where `i² = -1` has `i ≡ 2 mod 5` and put `a = (i-2)/5`.
  Then `a` is integral, whereas conjugation sends it to a nonintegral element.
  Conjugation therefore lies outside `D_x`; every member of `D_x` preserves
  integrality of `a`, hence the chosen rational condition `|a| ≤ 1`.

These Checks require A1's geometric points, decomposition-group action site, and global
point-topos inverse image together with R4's pro-étale base change. The finite and
countably infinite discrete-fibre examples below only test compactness of those fibres.

### R4.7 smooth pairs

**Smooth pairs: a smooth adic space with a strict normal crossings divisor.** (*smooth-pair*) Let
`K` be a complete nonarchimedean field and `B^n_K := Spa(K⟨T_1, …, T_n⟩, K°⟨T_1, …, T_n⟩)` the
closed unit polydisc (Tau Ceti `TauCeti.ValuationSpectrum.closedPolydisc`). A smooth pair over `K`
is a pair `(X, D)` where `X` is an adic space smooth over `Spa(K, K°)` (*smooth-morphism*, AdicSpacesPartII layer
R0: locally of finite type, hence locally noetherian and analytic, and smooth in the sense of AdicSpacesPartII layer
R0) and `D ⊆ X` is a closed adic subspace with ideal sheaf `I_D ⊆ O_X`
(*closed-adic-subspaces-and-embeddings*, AdicSpacesPartII layer R0) such that every `x ∈ X` has a strict normal
crossings chart: an open neighbourhood `V` of `x`, integers `0 ≤ r ≤ n` and an étale morphism
`h : V → B^n_K` (étale in the sense of AdicSpacesPartII layer R0, *differentials-unramified-smooth-etale*) with
`I_D|_V = h^*(T_1 ⋯ T_r)·O_V`, so `D ∩ V = h^{-1}(V(T_1 ⋯ T_r))`, and `r = 0` means `D ∩ V = ∅`.
Charts are analytic-local on `X` and defined over `K`; `V(f)` denotes `{x : |f(x)| = 0}`. The
boundary complement is the open subspace `U := X ∖ D` with its open immersion `j : U → X`.
"Strict" means that charts exist on an open cover of `X` over `K` itself; the normal crossings
divisors of Diao–Lan–Liu–Zhu (charts étale-locally on `X`; DLLZ-RH §2.1, Ex. 2.1.2, p. 10;
DLLZ-A §2.3, Ex. 2.3.17, pp. 16–17) form the weaker class and are not smooth pairs in this sense
unless charts exist analytic-locally over `K`. The two classes differ even after finite extension
of `K`: at a point `x` with `k(x)` finite over `K` an étale-local chart becomes an analytic-local
chart after a finite separable extension `K'/K` containing the residue fields of the étale
neighbourhood (an étale morphism of analytic adic spaces is an open immersion near a point at
which the residue field does not extend, *etale-local-open-finite-etale-factorisation*, AdicSpacesPartII layer
R0), but at a point whose residue field is transcendental over `K` no finite extension of `K`
suffices (the Gauss-point Check below). `D` is reduced and an effective Cartier
divisor; `D = X` is impossible unless `X = ∅` (the full-boundary Check below). No
condition is imposed on irreducible components, and `r` may vary with `x` (DLLZ-RH §2.1, Ex. 2.1.2, p. 10, the
local charts to the polydisc pulling back the coordinate hyperplanes; DLLZ-A §2.3, Ex. 2.3.16,
p. 16, the boundary complement as the locus where the log structure of the pair is trivial).
Define the structure of a smooth pair over `K` (`X` smooth over
`Spa(K, K°)`, `D ⊆ X` closed, with a strict normal crossings chart at every point) and
the data of a strict normal crossings chart (an open `V`, integers `r ≤ n` and
an étale `h : V → B^n_K` with `I_D|_V` generated by `h^*(T_1 ⋯ T_r)`); define
the boundary complement `U = X ∖ D` as an open adic subspace of `X` and
the open immersion `j : U → X`. For every smooth pair, that `j` is an open immersion
is the direct application of Tau Ceti's `PreAdicSpace.IsOpenImmersion.ofRestrict` to this open
restriction inclusion. Thus `j` is étale by Huber 1.6.7 (*open-embedding-etale*, AdicSpacesPartII layer R0),
so `U` is an object of `X_ét`. Prove the simp lemma `x ∈ U` iff `x ∉ D`.
For every smooth pair `P`, chart `c` of `P`
and point `y` of the affinoid domain of `c`, prove the simp lemma: the image of `y` in `X`
lies in the complement of `P` iff every boundary coordinate
`h^*(T_i)`, `i ≤ r`, lies outside the support of `y`, equivalently
`|T_1 ⋯ T_r(h(y))| ≠ 0`. The chart's stalk-ideal equality connects the global
unit-ideal locus to the affinoid criterion `SmoothPair.AffinoidChart.mem_complement_iff`: the support of the
stalk valuation is its maximal ideal (Huber96 §1.1, pp. 38–39). For `r = 0`
the coordinate condition is vacuous and the whole chart lies in the complement.
Give the constructor of
the trivial pair (for `X` smooth over `K`, the pair `(X, ∅)`) and the model pair
(`(B^n_K, V(T_1 ⋯ T_r))` with the identity chart); prove the functorialities of
restriction (for `W ⊆ X` open, `(W, D ∩ W)` is a smooth pair with complement `U ∩ W`;
charts restrict) and étale pullback (for `g : Y → X` étale, `(Y, g^{-1}D)` is a smooth
pair, with charts `h ∘ g` locally on `Y` after shrinking (*etale-smooth-composition*, AdicSpacesPartII layer R0), and
complement `g^{-1}(U)`). Both constructors retain the structural map to `Spa K`
and extend `D` along the inclusion or `g` on stalks: the ideal at `y` is
the extension of `D_{g(y)}` along the stalk map of `g` at `y`, without taking a radical. Two
theorems
identify their complement opens with the respective inverse images of `U`.
These assertions use the locality and composition properties of étale maps
(Huber96, Proposition 1.6.7(i),(ii),(v), p. 79), together with the local coordinate
charts defining the pair. Prove that `I_D` is locally generated by one
non-zero-divisor, `h^*(T_1 ⋯ T_r)` on a chart, so `D` is an effective Cartier divisor and `D` is
reduced (*etale-flat-unramified*, AdicSpacesPartII layer R0; on affinoid charts this is
`SmoothPair.AffinoidChart.isCartier`), that every smooth pair satisfies the DLLZ normal
crossings predicate defined below
(DLLZ-A §2.3, Ex. 2.3.17, pp. 16–17), and the intrinsic
characterisation (for `X` smooth over `K` of relative dimension `n`
near `x` and `D ⊆ X` a closed adic subspace, a strict normal crossings chart exists at `x` if and
only if there are an open `V ∋ x` and functions `x_1, …, x_n ∈ O_X(V)` with `x_i(x) = 0` for
`i ≤ r` whose differentials `dx_1, …, dx_n` form a basis of `Ω¹_{V/K}` (*smooth-differentials-locally-free*,
*smooth-local-structure*, AdicSpacesPartII layer R0: `(x_1, …, x_n) : V → B^n_K` is then étale after shrinking `V`
and rescaling), such that `I_D|_V = (x_1 ⋯ x_r)`; at such `x` the local ring `O_{X,x}` is regular
and `x_1, …, x_r` are part of a regular system of parameters, each branch `V(x_i)` of `D` through
`x` being a smooth adic subspace; this is the form in which layer F1 transports smooth pairs to
dagger spaces). The global smooth pair is specified in this README only; its chart-level
forms are the algebraic and affinoid charts below, which are in `Suggested.lean`.
*Needs:* *smooth-morphism*,
*closed-adic-subspaces-and-embeddings*, *differentials-unramified-smooth-etale*,
*etale-flat-unramified*, *smooth-local-structure*, *smooth-differentials-locally-free*,
*open-embedding-etale*,
*etale-smooth-composition*, *etale-local-open-finite-etale-factorisation*,
*smooth-morphism-open* (AdicSpacesPartII layer R0); Tau Ceti `TauCeti.ValuationSpectrum.closedPolydisc`.

Define the DLLZ normal crossings predicate on the same adic spaces,
structure morphisms to `Spa K` and stalk ideals as smooth pairs. Require the structure
morphism smooth and, for
every `x ∈ X`, an étale map `g : W → X` whose image contains `x`, integers
`r ≤ n`, and an étale map `h : W → B^n_K` over `Spa K` such that
`g^*D = h^*(T₁⋯T_r)` on every stalk of `W`. Here both pullbacks extend ideals
through the actual stalk ring maps, without taking radicals. The neighbourhood
`W → X` need not be an open immersion. This is the coordinate formulation of
DLLZ-A Example 2.3.17, pp. 16–17, using smooth local coordinates as in Huber96,
Corollary 1.6.10, p. 80.

Prove the positive analytic example:
for every complete nontrivially valued nonarchimedean `K` with `2 ≠ 0`, the
rational open `X = {|S| = 1} ⊂ B³_K = B²_K × B¹_K`, with the stalk ideal
of `T₁² − S T₂²` and its inherited map to `Spa K`, satisfies
the DLLZ predicate. The statement specifies this open by
`R({1}/S)` and uses the canonical map from the Tate algebra to its sections.
The finite étale surjective cover `S = S'²` supplies coordinates
`(T₁ − S'T₂, T₁ + S'T₂, S')`; their product is the pulled-back equation
and their Jacobian determinant is `2S'`. These coordinates are bounded and
étale even when `|2| < 1`; their inverse need not preserve the full unit
polydisc. The criterion is Huber96, Proposition 1.7.1, pp. 80–81.
This supplies the positive DLLZ assertion for the Gauss-point Check
below, alongside the algebraic Kummer chart.

**Checks for the DLLZ predicate.**

- On an empty smooth space even the zero ideal
  satisfies the predicate, since no point requires a chart.
- The two reduced coordinate axes in `B²_K`
  satisfy the predicate in every characteristic.
- The zero ideal on a nonempty space
  never satisfies the predicate: faithful flatness at a lifted point cannot
  turn zero into a regular coordinate-product ideal.
- Squaring the origin ideal on `B¹_K`
  fails the predicate in every characteristic, despite having the same support.

**Checks.**

The following adic Checks use the model pair over a complete nontrivially
normed nonarchimedean field, with the sheafiness of
the base and of the polydisc. Their boundary ideals are generated by the indicated
polynomial sections on every stalk, through A1's identification of coefficients with sections.
The three non-examples assert the existence of the specified point `x` and
that no chart has a domain whose image contains `x`. Thus they exclude every analytic
affinoid chart containing `x`, including rational neighbourhoods. Centring the charts
at `x` is necessary because charts away
from `x` may exist. The coordinate criterion is Huber96, Proposition 1.6.9(iii), p. 79,
and Corollary 1.6.10, p. 80. The algebraic Checks are separate
algebraic shadows on Zariski neighbourhoods; their conclusions alone do not
exclude analytic charts.

- Computation: for `(X, D) = (B^1_K, V(T))` the complement
  `U = {0 < |T| ≤ 1}` equals the increasing union of the rational subsets
  `R(ϖ^n/T) = {|ϖ^n| ≤ |T|}`, `n ≥ 1`, no finite subfamily covers `U`, and so `U` is not
  quasi-compact and `j : U → X` is not a quasi-compact morphism.
  The set-level statement uses any complete Hausdorff
  topological Tate field with its compatible additive uniformity; it asserts that the subset
  of `ValuationSpectrum.closedPolydisc 1 K` on which the coordinate has nonzero valuation
  is not compact. No choice of a real-valued norm is needed for this statement.
  The adic statement uses the model pair with `n = r = 1` and asserts that `j` is not
  quasi-compact in the sense of `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.QuasiCompact`.
  It witnesses failure on the
  compact whole target and gives the increasing compact-open rational exhaustion
  and failure of every finite subcover for each `ϖ` with `0 < ‖ϖ‖ < 1`.
  The statement indexes the annuli by `n + 1`, for `n : ℕ`.
  Rational subsets are quasi-compact opens by Huber96, §1.1, pp. 38–39.
  This is the affinoid-target criterion of Conrad-AWS, Exercise 2.4.8(1)–(2),
  pp. 21–22, expressed with Part II's adic morphism predicate.
- Degenerate: for `X` smooth over `K`, `(X, ∅)` is a smooth
  pair (charts with `r = 0` from *smooth-local-structure*, AdicSpacesPartII layer R0), its complement is `X` and `j`
  is the identity.
- Non-example: `(B^2_K, V(T_1 T_2 (T_1 − T_2)))` is not
  a smooth pair, for every `K` (characteristic `2` included: the three linear forms `T_1`, `T_2`,
  `T_1 − T_2` are pairwise non-proportional over every field). At the origin `0`, a `K`-rational
  point, a chart `h : V → B^n_K` has `h(0)` `K`-rational and induces an isomorphism
  `Ô_{B^n, h(0)} ≅ Ô_{V, 0} = K[[T_1, T_2]]` (étale with trivial residue extension), which forces
  `n = 2`; the pulled-back coordinates `h^*T_i` (`i ≤ r ≤ 2`) are units at `0` or part of a
  regular system of parameters, so the initial form of `h^*(T_1 ⋯ T_r)` is a product of at most
  `2` linearly independent linear forms, while the initial form of `T_1 T_2 (T_1 − T_2)`, the
  generator of the same principal ideal up to a unit, has `3` distinct linear factors.
  The adic statement specifies the origin by `T_1, T_2` lying in the support of `x`
  and excludes every chart centred there. Its separate algebraic shadow excludes an
  algebraic chart (`SmoothPair.AlgebraicChart`)
  on each principal Zariski open containing the origin, in every characteristic (Lean `example`).
  In characteristic two a further Check verifies that
  `T_1 − T_2 = T_1 + T_2`, that the three principal ideals are pairwise distinct,
  and that their product ideal is radical, while no localization `D(g)` containing
  the origin admits an algebraic chart. Thus the obstruction persists for a reduced
  divisor in characteristic two; it is not caused by repeated factors.
- Non-example: over `K = ℚ_p`, every `p` including
  `p = 2`, `D = V(T_1^2 − p T_2^2) ⊂ B^2` is a normal crossings divisor in the sense of
  Diao–Lan–Liu–Zhu: over `K' = ℚ_p(√p)` the map `(x, y) = (T_1 − √p T_2, T_1 + √p T_2)` has
  Jacobian `2√p ≠ 0`, is an open immersion of `B^2_{K'}` onto the rational subset
  `{|x + y| ≤ |2|, |x − y| ≤ |2√p|}` of `B^2_{K'}` (not an automorphism of `B^2_{K'}`: the inverse
  has the non-integral coefficient `1/(2√p)`), hence an étale chart with `xy = T_1^2 − p T_2^2`, and
  `B^2_{K'} → B^2_K` is finite étale surjective. But `(B^2, D)` is not a smooth pair: `p` is not a
  square in `ℚ_p` (`v_p(p) = 1` is odd), so the quadratic form `T_1^2 − p T_2^2` is irreducible over
  `ℚ_p` and the germ of `D` at `0` is irreducible in `ℚ_p[[T_1, T_2]]`, whereas a chart over `ℚ_p`
  would present the generator, of order `2`, as a unit times a product of two regular parameters.
  The adic statement asserts both the DLLZ predicate and the absence of a
  chart centred at the origin, using Huber96, Proposition 1.7.1, pp. 80–81,
  for the étale coordinates. The corresponding algebraic statement
  is the Zariski-local shadow of the obstruction.
- Non-example: for `2 ∈ K^×`, `X = B^2 × A` with
  `A = Spa(K⟨S^{±1}⟩, K°⟨S^{±1}⟩) = {|S| = 1}` and `D = V(T_1^2 − S T_2^2)`: after the Kummer cover
  `A' = {|S'| = 1} → A`, `S ↦ S'^2` (finite étale surjective since `2 ∈ K^×`), `D` becomes `V(xy)`
  for the étale coordinates `x = T_1 − S' T_2`, `y = T_1 + S' T_2`, `S'` of `B^2 × A'` (Jacobian
  `2S'`, a unit), so `D` is a normal crossings divisor in the sense of Diao–Lan–Liu–Zhu. At the
  point above the Gauss point of `A`, this obstruction persists after every finite extension
  `K'/K`: use the Gauss point `η'` of `A_{K'}` and its completed residue field `H(η')`, whose
  residue field is `K̃'(S̄)`. A square root of `S` in `H(η')` would have norm one and reduce to
  a square root of `S̄` in `K̃'(S̄)`, which is impossible. Thus at `(0, 0, η')` the transverse
  equation stays a nonsplit quadratic; an analytic-local chart would split its two tangent
  directions over `H(η')`. This proves that `(X_{K'}, D_{K'})` is not a smooth pair.
  The adic statement takes the actual restriction to `R({1}/S)` and identifies
  its point by `T_1 = T_2 = 0` and the Gauss comparisons
  `|f(S)(x)| ≤ |g(S)(x)| ↔
  ∀ i ∈ f.support, ∃ k ∈ g.support, ‖f.coeff i‖ ≤ ‖g.coeff k‖`,
  for all `f, g : K[S]` (Conrad-AWS, Definition 2.1.2, p. 9).
  Empty supports handle zero polynomials; comparisons in both directions fix
  equality of values as well as their order.
  It then excludes every chart centred at this point of this open space. Since the
  statement quantifies over every such `K`, it applies also to every complete
  finite extension `K'`, with its own Gauss point.
  An algebraic witness makes the analogous
  calculation at `(T_1,T_2)` in `K[T_1,T_2,S]` for every field `K`, including characteristic two.
  The positive Kummer chart requires `2 ≠ 0`: after `S = S'²`, the ideal `(T_1² − S'²T_2²)` has
  the chart `(T_1 − S'T_2, T_1 + S'T_2, S')` on `D(S')` when `2 ≠ 0` (Lean `example`).

- Non-example: `(X, X)` is a smooth pair only for
  `X = ∅`: a chart at `x ∈ X` would have `h^*(T_1 ⋯ T_r) = 0` on `V ∋ x`, so `h(V) ⊆ V(T_1 ⋯ T_r)`,
  but étale morphisms are open (*smooth-morphism-open*, AdicSpacesPartII layer R0, Huber 1.7.8) and
  `V(T_1 ⋯ T_r)` has empty interior in `B^n_K` (for `r = 0` it is empty);
  algebraically, `0` is a non-zero-divisor only in the zero ring. For `(B^1_K, B^1_K)` the
  complement is `∅` and no chart exists at any point.

For any field `K`, define the algebraic chart `SmoothPair.AlgebraicChart K σ I` for a ring map `σ : K → R`
and an ideal `I` of a commutative ring `R`: integers `r ≤ n`, an étale ring map
`coord : K[T_1,…,T_n] → R` with `coord ∘ C = σ`, and
`I = (coord(T_1 ⋯ T_r))`. This is the relative algebraic chart used by
*analytification-of-smooth-pair*. Define the model chart `SmoothPair.modelAlgebraicChart K n r` using the identity
coordinate map. Prove `SmoothPair.AlgebraicChart.isCartier`: its displayed generator is a
non-zero-divisor and `I` is radical, including when `R` is the zero ring. Flatness preserves
the regular generator; the quotient is étale over the reduced coordinate-hyperplane ring.
These are the algebraic chart calculations underlying DLLZ-A §2.3, Ex. 2.3.17, pp. 16–17.
They impose no valuation, completeness or characteristic hypothesis on `K`.
Lean: `SmoothPair.AlgebraicChart`, `SmoothPair.modelAlgebraicChart`,
`SmoothPair.AlgebraicChart.isCartier`.

**Checks for algebraic charts and their identity model.**

- For `n = r = 0`,
  the empty product is `1` and its ideal is `⊤`, so the boundary is empty.
- For `n = r = 1`, the generator is `T_1`, defining the origin.
- For `n = r = 2`, the generator is `T_1 T_2`, defining both axes (Lean `example`).
- Over a nontrivial `R` the ideal `0`
  cannot admit a chart (Lean `example`); in contrast the zero ring has the
  chart with `n = r = 0` and `0 = 1`.
- Kummer coordinates: in the ordered coordinates
  `(x,y) = (u − sv,u + sv)`, `xy = u² − s²v²` and the determinant is `+2s`.
  With `s ≠ 0` this is invertible precisely when `2 ≠ 0` (Lean `example`, on `D(S')`).
  In characteristic two, `(u − sv)²` excludes a chart (Lean `example`).

For a complete nontrivially normed nonarchimedean field `K` with its Tate-ring structure, an affinoid analytic chart
`SmoothPair.AffinoidChart K S I` uses a complete Hausdorff Huber `K`-algebra `A`, a
Huber pair `S` on `A`, and an ideal `I ⊆ A`. Its coordinates form a continuous map of
Huber pairs `(K⟨T_1,…,T_n⟩,K⟨T_1,…,T_n⟩°) → S`, over the given `K`-algebra structure,
topologically of finite type and formally étale in AdicSpacesPartII R0's square-zero lifting sense, with
`I = (h(T_1⋯T_r))`, `r ≤ n`. These are ideal equalities, including nilpotents, not just
equalities of vanishing loci. Huber96 Def. 1.6.5 and Prop. 1.6.7, pp. 78–79, give the
étale condition; DLLZ-A Ex. 2.3.17, pp. 16–17, supplies the coordinate-boundary construction.
The model chart is the identity map of the completed Tate algebra.
Prove `SmoothPair.AffinoidChart.isCartier` (regular generator and radical ideal) and
`SmoothPair.AffinoidChart.mem_complement_iff` (all boundary coordinates have nonzero valuation).
These local charts are used inside the global charts of *smooth-pair*; their domain is affinoid.
Lean: `SmoothPair.AffinoidChart`, `SmoothPair.AffinoidChart.isCartier`,
`SmoothPair.AffinoidChart.mem_complement_iff`.

**Checks for analytic affinoid charts and models.**

- Dimension zero and no boundary coordinates give
  the value `1`; when `r = 0` the complement of the model pair is the whole polydisc,
  in every dimension, with its points identified with the unit-ideal complement in the
  valuation spectrum. In every dimension the identity of the closed polydisc is a chart of
  `(T_1 ⋯ T_r)` (Lean `example`).
- The one-dimensional identity chart gives `T`;
  membership in the complement of the model pair
  is `v(T) ≠ 0`, which excludes `T=0` and includes `T=1`.
- The two-dimensional identity chart gives `T_1T_2`;
  the complement of the model pair is the locus where both coordinates have nonzero valuation. The points `(0,1)`
  and `(1,0)` are excluded and `(1,1)` is included, so replacing the intersection
  by the union fails. The stalk and valuation comparison is Huber96 §1.1,
  pp. 38–39; these Checks also retain the corresponding principal-ideal calculations.
- The zero ideal of a nonzero complete Huber
  `K`-algebra admits no such chart.
- `(T²)` in `K⟨T⟩` admits no chart, in every
  characteristic; a set-theoretic replacement by `(T)` would incorrectly admit it (Lean `example`).

**Analytification of an algebraic strict normal crossings pair is a smooth pair.**
(*analytification-of-smooth-pair*) Let `K` be a complete nonarchimedean field, `X` a scheme smooth
and locally of finite type over `K`, and `D ⊂ X` a strict normal crossings divisor relative to `K`: Zariski-locally on `X` there are étale morphisms `x = (x_1, …, x_n) : V → A^n_K` with
`I_D|_V = (x_1 ⋯ x_r)` as ideal sheaves (so `D ∩ V = V(x_1 ⋯ x_r)` and `D` is reduced, the ideal
`(x_1 ⋯ x_r)` being radical in the étale `K[x]`-algebra `O(V)`). Define
`SmoothPair.AlgebraicSmoothPair K` over any field `K` to consist of a scheme `X`, a smooth structure morphism
`X → Spec K`, an ideal sheaf `D` and a field asserting that every point has an
affine open neighbourhood with an algebraic chart (`SmoothPair.AlgebraicChart`) for that ideal over `K`.
That field is chart data required by the structure. Completeness and the valuation of `K`
enter only through analytification. Here the strata must be smooth over `K`; regularity of
strata alone is insufficient over an imperfect field. For example, over `K = 𝔽_p(t)`,
`V(T^p − t) ⊂ A¹_K` is a regular prime divisor but is not smooth over `K` and admits no such
chart. SchemeAndStackFoundations SF.4's absolute regular-parameter notion is used only with
this additional relative smoothness hypothesis. Prove that `(X^ad, D^ad)` is a smooth pair in the sense
of *smooth-pair*, and `(X ∖ D)^ad = X^ad ∖ D^ad` as open subspaces, with `j^ad` the
boundary-complement inclusion. The isomorphism `e` from the underlying space of the resulting
pair `Q` to `X^ad` must be over
`Spa(K,K°)`: `e ≫ s_X ≫ b` is the structure map of `Q`, where `s_X` is the structure map
retained by the composite of Part II's rigid analytification and Huber's functor `r`
(*rigid-analytification*, *rigid-adic-comparison-functor*), and `b` is A1's canonical
comparison of the field affinoid `Spa(K, K°)` with its complete-pair spectrum.
This canonical comparison fixes the field coefficients. Thus the same `e` cannot
identify a structure map twisted by a field automorphism unless that twist leaves
the displayed composite unchanged (Huber96, Cor. 1.7.3, pp. 85–86).
The analytified coordinates land in `A^{n,ad}_K`
(*analytic-affine-space*, AdicSpacesPartII layer R1), not in `B^n_K`: on the open `{|x_i| ≤ |ϖ|^{−m}, i ≤ n} ⊆ V^ad`
for a fixed `ϖ ∈ K` with `0 < |ϖ| < 1` and `m ≥ 0`, the rescaled map
`(ϖ^m x_1, …, ϖ^m x_n)` is étale to `B^n_K`: compose the analytified étale chart
with the scaling automorphism of `A^{n,ad}_K`, then base change along the open immersion
`B^n_K → A^{n,ad}_K`. The resulting chart pulls `T_1 ⋯ T_r` back to `ϖ^{mr} x_1 ⋯ x_r`, the
generator of `I_{D^ad}` times a unit, and these opens cover `V^ad` since `ϖ` is topologically
nilpotent; these are the charts (Huber96 §1.7, Cor. 1.7.3, pp. 85–86: the analytification functor on
schemes locally of finite type, whose part (i) sends étale morphisms to étale morphisms; DLLZ-A
§4.6, proof of Lem. 4.6.2, p. 69: smooth pairs arising as analytifications of algebraic normal
crossings pairs). Closed and open immersions analytify to closed and open immersions
(*analytification-immersions*, AdicSpacesPartII layer R1), and étale and smooth morphisms analytify to étale and
smooth morphisms (*analytification-etale-smooth*, AdicSpacesPartII layer R1). *Needs:* *smooth-pair*;
SchemeAndStackFoundations layer SF.4 (*strict-normal-crossings*); *analytification-etale-smooth*,
*analytification-immersions*, *analytic-affine-space*, *analytification-functor* (AdicSpacesPartII layer R1); AdicSpacesPartII layer
R0 (*smooth-morphism*, *closed-adic-subspaces-and-embeddings*). Lean: `SmoothPair.AlgebraicSmoothPair`;
the analytification statement is specified in this README only.

**Checks for algebraic smooth pairs.**

- For every smooth `X → Spec K`, the ideal sheaf
  `⊤` gives an algebraic smooth pair with that same structure morphism (Lean `example`).
- If `X` is empty, the ideal sheaf `⊥ = ⊤` also gives a pair.
- For a pair with ideal sheaf `⊥`, the scheme is empty;
  in particular no nonempty smooth scheme has the full boundary (Lean `example`).
- For any field `K` of prime
  characteristic `p`, any `a ∈ K`, any point `x ∈ V(T^p − a)` and every
  `g ∈ K[T]` with `g ∉ x.asIdeal`, the ideal generated by `T^p − a` in
  `K[T][1/g]` admits no relative algebraic chart (Lean `example`). These principal opens form
  a neighbourhood basis, so there is no affine neighbourhood chart at `x`,
  even when the divisor is a regular prime divisor. At `x`, the differential
  of every unit multiple `c(T^p − a)` vanishes; a relative étale coordinate
  on a smooth curve has nonzero differential there (EGA IV₄, Corollary 17.11.3,
  p. 84). Taking `g = 1` includes the whole affine line; taking `a = 0`
  includes the nonreduced divisor `(T^p)`.

### R4.8 restriction to the boundary complement

**Restriction of the étale and pro-étale sites of a smooth pair to its boundary complement.**
(*boundary-complement-restriction*) Let `(X, D)` be a smooth pair over `K` (*smooth-pair*) with
boundary complement `j : U = X ∖ D → X`; only the ordinary (non-logarithmic) sites are restricted
here, for sheaves of sets and of abelian groups, with `j_!` only for sheaves with a zero object
(abelian groups, modules). Construct: (a) `U` as an object of `X_ét` (*open-embedding-etale*, AdicSpacesPartII layer
R0) and the equivalence of sites `U_ét ≃ X_ét/U` (*etale-slice-site*), under which the morphism of
sites `j_ét : U_ét → X_ét` of *etale-site-functoriality* is the slice morphism; (b) the functors on
sheaves of sets and of abelian groups (Mathlib `CategoryTheory.Sheaf`), written in terms of the
forgetful functor `φ : X_ét/U → X_ét` (continuous and cocontinuous for the slice topology) and the
base-change functor `j* : X_ét → U_ét ≃ X_ét/U` (right adjoint to `φ`): `j^{-1}F = F|_U` with
`(j^{-1}F)(V) = F(V)` for `V ∈ U_ét`, which is `φ.sheafPushforwardContinuous` (Mathlib
`CategoryTheory.Functor.sheafPushforwardContinuous`, the `overPullback`); `j_*G` with
`(j_*G)(W) = G(W ×_X U)`, which is `(j*).sheafPushforwardContinuous` and equally
`φ.sheafPushforwardCocontinuous` (Mathlib `CategoryTheory.Functor.sheafPushforwardCocontinuous`,
the right Kan extension along `φ`); and `j_!` (extension by zero for abelian sheaves), the
sheafification of the presheaf `W ↦ G(W)` if `W → X` factors through `U` (uniquely, `j` being a
monomorphism) and `W ↦ 0` otherwise, which is `φ.sheafPullback` (Mathlib
`CategoryTheory.Functor.sheafPullback`, the sheafified left Kan extension along `φ`); with
adjunctions `j_! ⊣ j^{-1}` (Mathlib `CategoryTheory.Functor.sheafAdjunctionContinuous` for `φ`)
and `j^{-1} ⊣ j_*` (Mathlib `CategoryTheory.Functor.sheafAdjunctionCocontinuous` for `φ`, or
`CategoryTheory.Adjunction.sheafPushforwardContinuous` applied to `φ ⊣ j*`) — note that Mathlib's
`sheafPushforwardCocontinuous` is the right adjoint `j_*` of `j^{-1}`, not `j_!` — and canonical
isomorphisms `j^{-1} j_* ≅ id ≅ j^{-1} j_!` (`j` is a monomorphism); (c) the same on the pro-étale sites,
`U_proét ≃ X_proét/U` (*proetale-slice-open-subspace*), with `j_proét` compatible with `ν`:
`ν_X ∘ j_proét` corresponds to `j_ét ∘ ν_U` (*proetale-site-functoriality*). The inclusion `j` is in
general not quasi-compact (for `(B^1, V(T))` the complement is not quasi-compact), so no base-change
or continuity statement requiring a qcqs morphism — such as Scholze13 §3, Cor. 3.17(ii), p. 20,
for `j` — is part of this construction; exactness properties and derived functors of `j_!`, `j_*`
belong to the étale-cohomology roadmaps that import this one. The sources of the construction are
DLLZ-A §2.3, Ex. 2.3.16, p. 16 (the boundary complement as the locus where the log structure of the
pair is trivial) and Scholze13 §3, Prop. 3.15, p. 19 (the model statement that the pro-étale site
of an object is the slice site of the ambient pro-étale site).
Define the boundary complement `U` as an object of `X_ét`, the
equivalence of sites `U_ét ≃ X_ét/U` (identifying
topologies), the morphism of sites `j_ét : U_ét → X_ét` (base change along `j`), and the
functors `j^{-1}` (abelian restriction `Sh(X_ét, Ab) → Sh(X_ét/U, Ab)`), `j_*`
(abelian direct image from the slice to `X_ét`) and `j_!` (extension by zero
from the abelian slice: the sheafification of `W ↦ G(W)` if `W` factors through `U`, `0`
otherwise). The set-valued functors `j^{-1} : Sh(X_ét, Type 1) → Sh(U_ét, Type 1)` and
`j_* : Sh(U_ét, Type 1) → Sh(X_ét, Type 1)` use A1's inverse and direct image.
Construct also the equivalence `U_proét ≃ X_proét/U` for the
corrected pro-étale sites; prove the simp lemma `(j^{-1}F)(V) = F(V.left)`
for `V ∈ X_ét/U`; use Mathlib's adjunctions for
`j^{-1} ⊣ j_*` and for `j_! ⊣ j^{-1}` on abelian sheaves; prove the isomorphisms
`j^{-1} j_* ≅ id` (`j` being a monomorphism) and `j^{-1} j_! ≅ id` on abelian
sheaves, and the compatibility of `ν_X ∘ j_proét` with `j_ét ∘ ν_U`, a
commuting square of site morphisms. The two isomorphisms are stated as
invertibility of the actual adjunction counit and unit,
respectively, together with the existence of natural isomorphisms
`j_* ⋙ j^{-1} ≅ 𝟭` and `j_! ⋙ j^{-1} ≅ 𝟭` on abelian sheaves on the slice.
The restriction formulas on the étale site (Huber96, §2.1, p. 109) and the
monomorphism `j` identify these transformations objectwise; the adjunctions are
those of Mathlib's `Sites/Continuous.lean`,
`Sites/CoverLifting.lean` and `Sites/Pullback.lean` cited above.

For any coefficient category `A`, define the equivalence
`E_A : Sh(X_ét/U, A) ≌ Sh(U_ét, A)` obtained from Mathlib's
`Equivalence.sheafCongr` and A1's topology comparison for the étale slice (*slice-site*).
Its forward functor precomposes with the opposite of the forward functor of `U_ét ≃ X_ét/U`.
Thus the functors on the complement's own site are the composites
`j^{-1} ⋙ E_Ab.functor`, `E_Ab.inverse ⋙ j_*`, and `E_Ab.inverse ⋙ j_!`.
Compute the restriction's value at every `V ∈ U_ét`, and
identify direct-image values at `W ∈ X_ét` with
`G(j_ét(W))`, hence with sections on `W ×_X U`.
State the adjunctions
of these composites; the one for `j_!` carries the same ambient `HasWeakSheafify`
hypothesis as `j_!`. These are formal consequences of the slice comparison
(Huber96, §2.1, p. 109) and Mathlib's `Adjunction.comp` and
`Equivalence.toAdjunction`. On set-valued sheaves, identify
`j^{-1}` with `overPullback` along the complement followed by `E_Type.functor`, and
`j_*` with `E_Type.inverse` followed by the cocontinuous pushforward along the
forgetful functor of the slice over the complement.
State invertibility of A1's actual adjunction counit and
`j_* ⋙ j^{-1} ≅ 𝟭` on set-valued sheaves; the hypothesis is precisely that `P` is a smooth pair,
so its complement inclusion is an open immersion. The source is the same étale
slice construction (Huber96, §2.1, p. 109), with Mathlib's sheaf adjunctions.

A smooth pair has strongly noetherian Tate charts
by smoothness over `K` (Huber96, Corollary 1.6.10, p. 80), so it is locally noetherian
analytic; the complement inherits
the hypothesis from A1's local noetherianity of étale sources. Thus no additional
hypothesis on the pair is needed to form its corrected pro-étale site.
Prove that the induced topology on the slice is the
corrected topology on `U`. Here the source is Scholze13, §3, p. 18 for
functoriality, with Proposition 3.15, p. 19 as the field-extension instance of
the slice construction; the open-subspace version is A1's slice contract.
Precisely, the compatibility with `ν` is the natural isomorphism of site functors
`c_X ⋙ j*_proét ≅ j_ét ⋙ c_U`, in the direction from `X_ét`
to `U_proét`. This is the compatibility with `ν` induced by the constant
embedding (Scholze13, §3, pp. 18–19), and uses the compatibility of pro-étale base change
with constant objects (*proetale-site-functoriality*) without
assuming that `j` is quasi-compact. *Needs:* *smooth-pair*; *etale-site-on-analytic-carriers*;
*etale-site-functoriality*; *etale-slice-site*; *proetale-slice-open-subspace*;
*proetale-site-functoriality*; AdicSpacesPartII layer R0 (*open-embedding-etale*); Mathlib
`CategoryTheory.GrothendieckTopology.over`, `CategoryTheory.GrothendieckTopology.overPullback`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.Sheaf`,
`CategoryTheory.Functor.sheafPushforwardCocontinuous`,
`CategoryTheory.Functor.sheafAdjunctionCocontinuous`, `CategoryTheory.Functor.sheafPullback`,
`CategoryTheory.Functor.sheafAdjunctionContinuous`,
`CategoryTheory.Adjunction.sheafPushforwardContinuous`.

**Checks.**

- Degenerate: if `D = ∅` then `j^{-1}`, `j_*` and
  `j_!` are naturally isomorphic to the identity functor of `Sh(X_ét)`. The other extreme `U = ∅`
  occurs only for `X = ∅` (the full-boundary Check of *smooth-pair*), where `Sh(∅_ét)` is the
  terminal category (the single object `∅` is covered by the empty family, so every sheaf has
  `F(∅)` terminal) and all three functors are the identity of it.
- Computation: for `(B^1, V(T))` and the
  constant sheaf `Z/n` on `U_ét`, `n ≥ 2`, `H^0(X, j_! Z/n) = 0` and `H^0(X, j_* Z/n) = Z/n`: a
  section of `j_! Z/n` over `X` is a section of `Z/n` on `U` whose support is closed in `X`, and a
  nonzero locally constant section on the connected `U` has support `U`, which is not closed in
  `X` since `0` lies in the closure of `U` (every rational neighbourhood `{|T| ≤ |ϖ^n|}` of `0`
  meets `U`), while `H^0(X, j_* Z/n) = H^0(U, Z/n) = Z/n` because `U` is connected. For `n = 1`
  both groups are `0` and the test is vacuous.
- Non-example: for `(B^1, V(T))`, the whole
  target is compact and its inverse image under `j` is not. The Check asserts that `j`
  is not quasi-compact in the sense of `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.QuasiCompact`
  as well as noncompactness of its
  image, so the qcqs hypothesis of the étale/pro-étale base change (Scholze13 §3,
  Cor. 3.17(ii), p. 20) fails for `j`; no isomorphism `ν^* R j_{ét,*} ≅ R j_{proét,*} ν^*` is part
  of the restriction package.
- Compatibility: under `U_ét ≃ X_ét/U`, the
  étale topology of `U` is the slice `(J_X).over U` of the étale topology `J_X` of `X` (Mathlib
  `CategoryTheory.GrothendieckTopology.over`) and `j^{-1}` is
  `CategoryTheory.GrothendieckTopology.overPullback`. The Check asserts equality
  with the induced topology, in addition to continuity, so it fixes both directions
  of the covering comparison (Huber96 §2.1, p. 109).
- Characterisation: for every sheaf `G` on `U_ét`, the counit
  `j^{-1} j_* G → G` is an isomorphism, and the unit `G → j^{-1} j_! G` is an isomorphism.

**Checks for the individual geometric interfaces.** The following tests use the adic
smooth pair, its ideal sheaf, AdicSpacesPartII R0's smooth and étale morphism classes, and A1's sites.
A chart of a smooth pair uses Part II's `AdicSpace.Chart`. It records the scalar map
on the chart's Huber pair, its compatibility with the map to `Spa K` through
A1's comparison of the field affinoid with its complete-pair spectrum, and equality of
boundary ideals on every stalk of
the chart's spectrum. The coefficient map is Part II's `AdicSpace.Affinoid.coeff`, and
the stalk pullback is induced by the chart's open immersion. A smooth pair requires these
charts to cover. The sections of the boundary ideal on an open `U` are given by the equation
`s ∈ I_D(U) ↔ ∀ x ∈ U, germ_x(s) ∈ D_x`. The complement open is the unit-ideal
locus; the complement and `j` are A1's open restriction and its inclusion. The abelian
sheaf functors use the actual slice site and are transported to `U_ét` by
`E_Ab` with values in `AddCommGrpCat.{1}`: `j^{-1}` is Mathlib's `overPullback`, `j_*`
is Mathlib's `Functor.sheafPushforwardCocontinuous` along the forgetful functor of the
slice over the complement, and `j_!` is `Functor.sheafPullback`
along the same functor. The latter requires
`HasWeakSheafify` for the étale topology of `X` with values in `AddCommGrpCat.{1}`;
this hypothesis also accompanies the adjunction `j_! ⊣ j^{-1}`, the isomorphism
`j^{-1} j_! ≅ id`, and
Checks using extension by zero. The two adjunctions are exactly
`Functor.sheafAdjunctionCocontinuous` and `Functor.sheafAdjunctionContinuous`,
respectively, with their specified units, counits and hom-set equivalences
(Mathlib `Sites/CoverLifting.lean` and `Sites/Pullback.lean`). The left adjoint is
canonically isomorphic to the sheafified left Kan extension by Mathlib's
`Functor.sheafPullbackConstruction.sheafPullbackIso` in `Sites/Pullback.lean`.
The geometric complement is that of DLLZ-A Examples 2.3.16–2.3.17, pp. 16–17;
smooth coordinates use Huber96 Corollary 1.6.10.

| Construction | Three discriminating Checks |
|---|---|
| smooth pair | empty ambient admits the unique boundary; the two axes in `B²` form a pair with radical stalk ideals and a nonprime stalk ideal at their intersection; the doubled origin in `B¹` does not. |
| chart of a smooth pair | the identity coordinate chart on the empty-boundary model has `r=0` and unit ideal; `n=r=2` generates `(T₁T₂)`; if a coordinate-ring element is outside the chart ideal, so is its square; thus no chart generates `(T²)` on a disc containing the origin. |
| boundary complement | the complement of `(X,∅)` is `X`; the complement of the origin in `B¹` is the punctured disc; for `(B²,V(T₁T₂))`, both coordinates must have nonzero valuation. |
| inclusion `j` | for empty boundary the inclusion is the identity under the complement identification; empty ambient gives the unique empty endomorphism; the punctured-disc inclusion is not quasi-compact. |
| trivial pair `(X, ∅)` | the field point has empty boundary and full complement; the whole closed disc remains its complement; the empty space gives the empty pair, even though its zero and unit ideals coincide. |
| model pair | `n=r=0` gives the field point with empty boundary; `n=r=1` gives the origin divisor, with a nonunit boundary ideal at a point; `n=r=2` gives the two reduced axes, including in characteristic two. |
| restriction to an open | restriction to the empty open is the empty pair; restriction to `X` recovers the same boundary ideal; restriction to `U=X∖D` has unit boundary ideal and full complement `U`. |
| étale pullback | identity pullback recovers the pair; empty source gives the empty pair; substituting `T=S²` at the origin gives `(S²)`, which is not a smooth-pair boundary and hence shows why the étale hypothesis is necessary. |
| `U` as an object of `X_ét` | empty boundary gives the terminal object of `X_ét`; empty ambient gives the empty étale object; the punctured disc is an object despite being non-quasi-compact. |
| `U_ét ≃ X_ét/U` | `U=X` gives the identity slice equivalence; empty ambient gives the one-object site with the empty covering; the punctured-disc topology is the induced slice topology, with no quasi-compactness condition. |
| `j_ét` | base change sends the final object `X` to `U`; for the model disc and `W={\|T\|=1}`, its pullback is `W` itself; base change sends `X⊔X` to `U⊔U`, preserving the two summands. |
| `E_A` | forward transport evaluates on the forward site equivalence; restriction maps use that same equivalence contravariantly; on empty ambient space every transported set sheaf has exactly one section at every object. |
| set-valued `j^{-1}` | inverse image followed by direct image is the identity for empty boundary; restriction has exactly one section at each object when the ambient space is empty; the constant two-element sheaf restricts to the constant two-element sheaf, assuming `HasSheafify` on both sites. |
| set-valued `j_*` | the same empty-boundary composite is the identity; the direct image of a set sheaf on the empty complement has one section at every ambient object; the constant two-element sheaf on the punctured disc has two global sections after direct image, assuming `HasSheafify` on the complement site. |
| `j^{-1}`, abelian and set-valued | empty boundary gives the identity; every set sheaf restricts to the terminal sheaf on the empty site; the constant `ℤ/2` sheaf on the disc restricts to the constant `ℤ/2` sheaf on its puncture. |
| abelian `j_*` | empty boundary gives the identity; the unique abelian sheaf on the empty source pushes to zero; the constant `ℤ/2` sheaf on the punctured disc has pushforward global sections `ℤ/2`. |
| `j_!` | empty boundary gives the identity; extension of the zero sheaf is zero; the constant `ℤ/2` sheaf on the punctured disc has zero global sections after extension by zero. |
| `U_proét ≃ X_proét/U` | `U=X` gives the identity slice; empty ambient gives empty underlying objects and the empty covering; the corrected coverings on the punctured disc are exactly those of the slice, despite the non-quasi-compact inclusion. |

The empty-space tests
quantify over an empty carrier; the model tests use the complete-pair spectra of Part II's
restricted power-series rings. The doubled-origin pair test states that charts for the
squared origin ideal cannot cover the disc. The empty test for the abelian `j_*` allows every abelian
sheaf on an empty complement, and the empty test for `j_!` takes any zero abelian sheaf
on the slice site, with the displayed weak-sheafification hypothesis.
For restriction to `X`, equality of the ideals is expressed through the canonical
stalk map, so it does not identify different stalk types by fiat.
The ramified pullback test computes the polynomial substitution `T ↦ S²`:
`Ideal.map` sends `(T)` to `(S²)`, and this ideal is not radical over any `K`,
including characteristic two. The boundary test for `j_ét` proves the stronger statement
that the base-change projection is an isomorphism for every étale `W` whose
image lies in `U`; the disc's unit circle is such a `W`.
The two-summand test for `j_ét` expresses the computation as preservation of the
binary coproduct diagram of the final object. For `U_proét ≃ X_proét/U`, the whole-space test
identifies underlying-space functors through the slice equivalence when the
boundary is empty; the empty test also checks that the empty
sieve covers, and the punctured-disc test checks the induced topology
on the punctured disc.

**Checks for the stalk-ideal presentation.**

- For `U` as an étale object, three tests
  identify the isomorphism for empty boundary, the empty étale object, and the
  non-quasi-compact punctured-disc inclusion; the last fixes the
  structure arrow as `j`, asserts étaleness, and rejects Part II's quasi-compactness
  predicate. For `U_ét ≃ X_ét/U`: when the boundary is empty, `j` is identified with the
  isomorphism `U ≅ X`, fixing the structure arrows and all maps
  under natural underlying-space identifications; empty ambient
  gives empty objects with the empty covering; on the punctured disc the test
  identifies the induced topology and tests the concrete annuli
  `|ϖⁿ| ≤ |T|`, `n ∈ ℕ`, for any `0 < ‖ϖ‖ < 1`: their inclusions cover the
  terminal object of the punctured-disc site and its image in the slice, while
  every finite subfamily fails to cover in both sites. The images of these
  inclusions are specified by the valuation inequalities (Huber96 §1.1,
  pp. 38–39, and §2.1, p. 109).
- Charts: three tests check the unit ideal at
  `r=0`, rejection of a nonradical boundary, and the nonprime two-axis ideal with
  `n=r=2`. Differential charts (the intrinsic form of *smooth-pair*):
  two tests distinguish `r=0` from `r>0` at the centre, and a third
  excludes repeated coordinates in a differential basis. Both chart families
  use Part II affinoid coefficient rings and the stalk maps of their open immersions.
- The trivial pair has the unit ideal and
  full complement, and an empty ambient space has empty complement.
  The complement is tested
  on the empty space, for empty boundary (an isomorphism), and at a
  boundary point (excluded); the inclusion `j` is tested in the same three cases.
  The boundary ideal of the trivial pair is the unit ideal on
  each open.

- The boundary ideal is the unit ideal for empty
  boundary and on the empty open. A
  germ outside the boundary ideal has its square outside it too; a doubled
  component fails this test.
- The complement open is the whole space for empty boundary, excludes a boundary point,
  and is empty on the empty space.
- The model pairs distinguish the
  empty product, the origin divisor in one variable, and the nonprime radical ideal
  at the intersection of two axes. The two-axis test requires both coordinates to
  vanish at its witness and the stalk ideal to be proper. Their two germs lie
  outside that ideal, while their product lies inside; hence a point off the
  boundary, whose ideal is `⊤`, cannot witness nonprimeness. Radicality remains
  asserted at every point (the coordinate charts of R4.7).
- For `j_*`: the counit
  isomorphism, the identity for empty boundary, and global sections `ℤ/n` on the
  punctured-disc constant sheaf. For `j_!`: the unit isomorphism, the identity,
  and zero global sections.
  For `j^{-1}`: restriction tested against
  direct image, empty boundary, and the actual slice topology.
- For `j^{-1} ⊣ j_*`, the unit on ambient sheaves, the counit on slice sheaves, and the hom-set
  correspondence agree with Mathlib's cocontinuous adjunction.
  For `j_! ⊣ j^{-1}`, the unit on slice sheaves, the counit on
  ambient sheaves, and the hom-set correspondence agree with Mathlib's continuous
  adjunction. All six equalities hold by definition.

For *analytification-of-smooth-pair*, the three geometric Checks are
the empty pair, the origin and the two axes. The first gives an empty
analytic pair from an empty algebraic pair. The other two use
`Spec K[T]` with ideal `(T)` and `Spec K[T₁,T₂]` with ideal `(T₁T₂)`,
respectively. Mathlib's `IdealSheafData.ofIdealTop` specifies the ideal,
`subschemeι` its closed immersion, and `Scheme.basicOpen` its complement
`G_m` or `G_m²`. Each of these two examples asserts existence of the algebraic smooth pair
with exactly that ideal and structure map, then an analytic smooth pair with
the corresponding stalk kernels, radical boundary ideals, and an isomorphism
from the analytified complement commuting with its inclusion. All three retain
the map to `Spa K` through Part II's analytification and Huber's functor `r`
and A1's comparison of the field affinoid with its complete-pair spectrum. These are
instances of Huber96,
Corollary 1.7.3, pp. 85–86, and of *analytification-of-smooth-pair* above.

For the site constructions of *etale-site-and-rigid-comparison*, an empty Check
verifies empty objects and bottom covering sieves on
both sites; a field Check identifies
the rigid and adic field-point topoi with the small étale topos of `Spec k`,
the field-point Galois topos described below; a rational Check
constructs the two open étale objects with images
`|T| ≤ |ϖ|` and `|ϖ| ≤ |T|` in the closed disc, for `0 < ‖ϖ‖ < 1`, and asserts
that their family and its adic image generate covering sieves. The comparison
functor in the empty and rational Checks induces the rigid topology; in the
rational Check its objects are isomorphic to their imported adic realizations.
These Checks use the actual rigid carriers and Part II's functor `r`,
with local strong sheafiness of the adic target explicit. The locators are
Huber96, Lemma 2.1.2 and Proposition 2.1.4, pp. 109–111.

For pro-étale base change, the identity, empty and quadratic Checks of R4.6
compute the identity functor, the empty pullback, and the
two factors at the one-stage `p = 2`, `K_i = L = ℚ₂(√2)` instance of the
quadratic field-extension example below, on A1's
corrected site, using R4's pro-étale base change functor.
The identity Check also computes the
concrete functor witnessing the combined existence statement of
*proetale-site-functoriality*. For the analytification site
morphism, three Checks compute
the empty site, the field-point equivalence, and the open-disc failure of essential
surjectivity below; the field Check also specialises the continuity and finite-limit
statement of *analytification-etale-site*
to `Spec k`:

- Empty: for an empty scheme `X`,
  every image object is empty and its bottom sieve is covering.
- Field: for `X = Spec k`, the defined
  functor is an equivalence and induces exactly the scheme small étale topology.
- Open disc: in the analytification
  of `Spec k[T]`, choose `ϖ ∈ k` with `0 < ‖ϖ‖ < 1`. The open disc is the union
  of the rational domains `|T|^(n+1) ≤ |ϖ|`, `n ≥ 0`, where both sections are pulled
  back along the scheme projection. Its inclusion is an étale object outside the
  essential image of `(−)^ad`. This union specifies the open disc also
  at points of higher rank; the condition `|T| < 1` alone would include extra points.

### Examples

The worked examples of this layer are the checks above together with the following.

For the étale site (*etale-site-on-analytic-carriers*): Huber's definition on p. 109 — objects
étale over `X`, coverings with `U = ⋃ f_i(U_i)` — agrees on `X = r(X_rig)` and on
`X = X^ad`. On the closed unit disc `X = Spa(K⟨T⟩, K°⟨T⟩)` the rational cover `{|T| ≤ |ϖ|}`,
`{|ϖ| ≤ |T|}` is an étale covering, and for `2 ∈ K^×` (characteristic of `K` not `2`; `K = ℚ_2`
is allowed, the residue characteristic plays no role) the squaring map `Spa K⟨S⟩ → Spa K⟨T⟩`,
`T ↦ S²`, is étale over `{|T| = 1}` — its Jacobian `2S` is a unit of `K⟨S^{±1}⟩` — but not at the
point `T = 0`, where the fibre `Spa K[S]/(S²)` is not reduced, so it is not an object of `Et/X`
while its restriction to the annulus is. Negative control: for `char K = 2` (`K = 𝔽_2((t))`) the
differential `d(S²) = 2S dS = 0` vanishes identically and `T ↦ S²` is étale nowhere, not even over
`{|T| = 1}`. For `X = Spa(K, K°)` with `K` algebraically closed, every
object of `Et/X` is a disjoint union of copies of `X`; for `X = ∅` the category `Et/X` is the single
object `∅`, covered by the empty family.

For base change (*etale-site-functoriality*): for `j : U → X` the inclusion of a rational subset of
an affinoid `X`, `(j_*F)(V) = F(V ∩ preimage of U)` and `j^{-1}F(W) = F(W)` for `W` étale over `U`.
For `f = r(φ)` with `φ` a morphism of rigid varieties, `f_ét` corresponds under
*etale-site-and-rigid-comparison* to the rigid site morphism of Huber96 §2.1, (2.1.3), pp. 110–111.

For the étale slice (*etale-slice-site*): for `U = X` the equivalence is the identity; for `U` an
open subspace, `X_ét/U` is the full subcategory of étale `X`-spaces whose image lies in `U`; for
`U = ∅` both `U_ét` and `X_ét/∅` consist of the single object `∅` (an étale `X`-space with a
morphism to `∅` is empty), and the empty family covers it. For
`U = X ⊔ X` (two copies), `X_ét/U ≃ X_ét × X_ét` and a sheaf on `U_ét` is a pair of sheaves on
`X_ét`.

For the pro-étale site (*proetale-site-on-analytic-carriers*): for `X = Spa(k, k°)` with `k` a
complete nonarchimedean field, `X_proét` restricted to pro-finite-étale objects is the site of
profinite continuous `Gal(k^sep/k)`-sets with coverings restricted as in the erratum (Scholze13 §3,
Prop. 3.5, corrected by Scholze-Err item (1), p. 1). For `char k = 0`, the countable tower
`lim_n Spa k⟨T^{±1/p^n}⟩ → Spa k⟨T^{±1}⟩` (finite étale surjective transition maps) is a covering
exactly as in the 2013 paper. Non-example: an arbitrary open surjection of profinite sets `S → S'`
need not admit a continuous section (Scholze-Err item (1), p. 1, citing RZ, Ex. 5.6.9).
Open surjectivity alone is not the covering criterion used here; coverings use the specified
finite-étale towers. This example makes no assertion about the sieve generated by such a map. Non-example: `X_proét` is not Mathlib `AlgebraicGeometry.Scheme.proetaleTopology`
(weakly étale schemes with fpqc covers): its objects are pro-objects of étale adic spaces.

For pro-étale functoriality (*proetale-site-functoriality*): for `j : U → X` an open immersion,
`j*` is restriction to the preimage of `U`, and `ν_X ∘ j_proét ≅ j_ét ∘ ν_U` as morphisms
`U_proét → X_ét` (the composite `ν_U ∘ j_proét` does not typecheck: `j_proét` lands in `X_proét`
and `ν_U` starts from `U_proét`). For `f : Spa(L, L°) → Spa(K, K°)` with `L/K` finite separable,
`f*` sends the pro-finite-étale object `lim_i Spa(K_i, K_i°)` of a tower of finite separable
extensions `K_i/K` to `lim_i Spa(K_i ⊗_K L, (K_i ⊗_K L)°)`, a pro-object of finite disjoint unions;
computed
for `K = ℚ_p`, `L = ℚ_p(√p)`, `K_i = ℚ_p(p^{1/2^i})` (`i ≥ 1`, Eisenstein, every `p` including
`p = 2`): `K_i ⊗_K L ≅ K_i × K_i` since `L ⊆ K_i`, so
`f*(lim_i Spa K_i) = (lim_i Spa K_i) ⊔ (lim_i Spa K_i)`, matching Scholze13 §3, Prop. 3.15, p. 19
(`X_{L̂,proét} ≃ X_proét/X_L`).

For the pro-étale slice (*proetale-slice-open-subspace*): for `U = X` the equivalence is the
identity. Scholze's Proposition 3.15 (`X_{L,proét} ≃ X_proét/X_L` for a separable field extension)
is the analogous statement for a pro-finite-étale object; here the object is étale.

For the rigid comparison (*etale-site-and-rigid-comparison*): Huber's Proposition 2.1.4 as stated —
for every rigid analytic variety `X` the morphism of topoi `ρ_X` is an equivalence. For `X = Sp k`
the topos of both sites is the classifying topos of `G = Gal(k^sep/k)`, the category of all
continuous discrete `G`-sets (not only the finite ones: an infinite disjoint union of `Sp k_i` is an
étale `X`-variety and `r` of it is an étale `r(X)`-space). Every étale cohomology statement for the
adic space `r(X)` transfers to the rigid étale site, and conversely. The target is the induced equivalence of topoi; Huber proves it by comparing the dense
subsites with quasi-separated structure morphisms.

For strong surjectivity (*rigid-strongly-surjective-covers*): a rigid étale family is a covering of
`X_ét^rig` in the sense of Huber96 §2.1, Def. 2.1.1, iff its adic image is a covering of `r(X)_ét`.
The two-piece cover `{|T| ≤ |ϖ|}`, `{|ϖ| ≤ |T|}` of the closed disc, `ϖ ∈ k` with `0 < |ϖ| < 1`,
is strongly surjective. If `k` is algebraically closed (so the rigid points of the disc are the
elements of `k°` and the residue field is infinite; `k` has no uniformiser, so `ϖ` is any element
with `0 < |ϖ| < 1`), the family of discs `{|T − a| ≤ |ϖ|}`, `a ∈ k°`, covers every rigid point of
the closed disc but is not strongly surjective (finitely many of these discs meet only finitely
many of the infinitely many classes of `k°/{|x| ≤ |ϖ|}`, so the disc is not a finite union of
images of quasi-compact opens of these discs), and correspondingly its adic image misses the Gauss
point `η`, for which `|T − a|(η) = 1 > |ϖ|` for every `a ∈ k°`. For `k` not algebraically closed
the family need not even cover the rigid points: for `k = ℚ_p`, `ϖ = p`, the rigid point
`T = p^{1/2}` (the maximal ideal `(T² − p)` of `ℚ_p⟨T⟩`, residue field `ℚ_p(√p)`) satisfies
`|p^{1/2} − a| ≥ p^{−1/2} > p^{−1} = |p|` for all `a ∈ ℤ_p`: if `|a| < 1` then `|a| ≤ p^{−1} <
p^{−1/2} = |√p|` and `|√p − a| = p^{−1/2}`, and if `|a| = 1` then `|√p − a| = 1`; equivalently
`|√p − a|² = |a² − p| ≥ p^{−1}` in `ℚ_p` itself, since `v_p(a² − p) ∈ {0, 1}`. The computation is
the same for `p = 2` (`|√2 − a| ≥ 2^{−1/2} > 2^{−1}`). A positive control
uses Part II's `Sp A`, the bijection of its points with `Max A`, and its rational
domains (RigidAnalyticGeometry §4.2.1–4.2.2 (`RigidAnalyticGeometry.rationalDomain`), read through AdicSpacesPartII's R0.9 carrier bridge): for every `a₀ ∈ ℤ_p` it supplies the
maximal ideal `(T−a₀)` and an admissible open immersion with image exactly
`|T−a₀| ≤ |p|`, and asserts that this rigid point is in that image. It retains
`|a₀−a₀|=0 ≤ |p|` as the numerical calculation supporting this membership
(Huber96 Def. 2.1.1 and Lem. 2.1.2, pp. 109–110).

For analytification (*analytification-etale-site*): for `X = Spec k` the functor `(−)^ad` is an
equivalence of sites, both `(Spec k)_ét` and `Spa(k, k°)_ét` being the disjoint unions (not
necessarily finite) of spectra of finite separable extensions of `k` with the jointly surjective
coverings, so `λ` is an isomorphism of topoi; the finite étale objects are the finite étale
`k`-algebras. For `X = G_m` and
the Kummer cover `U = G_m`, `t ↦ t^n` (`n` invertible in `k`), `U^ad → G_m^ad` is the analytic
Kummer cover, and the family `{U → G_m}` stays a covering after analytification. `(−)^ad` is not
essentially surjective onto `X^ad_ét`: for `X = A^1` the open unit disc is an object of `X^ad_ét`
not isomorphic to `U^ad` for any étale `U → X`.

For geometric points (*geometric-points-pullback*),
a two-component Check identifies A1's geometric fibre
(that is, the lifts of the chosen geometric point) of A1's split two-sheeted étale object with
`Fin 2`, fixing each inverse image by A1's section map. It asserts cardinality
two, compactness in the discrete fibre topology, and quasi-compactness of the constant
pro-étale object. An infinite-fibre Check supplies a countable
coproduct of the terminal étale object over A1's split base space, including its
`Cofan` universal property. Its discrete geometric fibre is homeomorphic to `ℕ`, with
inverse sending each index to its summand's lift. That fibre is not compact, and the
constant pro-étale object is not quasi-compact (Scholze13 Prop. 3.12(iv) and the
construction in Prop. 3.13, pp. 18–19). Neither computation identifies a
profinite-cover topos with a point.
For `X = Spa(K, K°)` with `K` a complete field
and `ξ : Spa(C, O_C) → X` a completed algebraic closure, `Sh(X_ét)` is equivalent to continuous `Gal(K^sep/K)`-sets; the fibre functor `ε_ξ`
corresponds to forgetting the action. For `f = j : U → X` the
boundary-complement inclusion of a smooth pair and `ξ` a geometric point of `U`,
`(j^{-1}G)_ξ = G_{j∘ξ}`; for `G` a sheaf on `U_ét` and a geometric point `ξ` of `X` not factoring
through `U`, `(j_!G)_ξ = 0`.
Pro-étale non-example: on `X_proét` there are nonzero sheaves all of whose stalks at geometric
points vanish (Scholze13 §3, Rem. 3.14, p. 19), so geometric-point stalks are used only on `X_ét`.
The non-example of an étale space over `Spa(C, C⁺)` with `C⁺ ≠ O_C` that is not a disjoint union
of open subspaces of copies of `Spa(C, C⁺)` is AdicEtaleGeometry layer A1
(*geometric-point-etale-split*).

For smooth pairs (*smooth-pair*): the model pair `(B^n_K, V(T_1 ⋯ T_r))` is a smooth pair with the
identity chart; a smooth pair `(X, ∅)` is the same as a smooth `X`; `(B^1_K, {0})` has complement
the punctured closed disc `{0 < |T| ≤ 1}`, which is not quasi-compact. For the analytified pairs
(*analytification-of-smooth-pair*): for `X = A^1_K` and `D = {0}`, the analytified pair is
`(A^{1,ad}, {0})` with complement `G_m^ad`, and restricted to `B^1` it is the model pair
`(B^1, V(T))`; for `X` a smooth toroidal compactification of a Shimura variety whose boundary `D` has relative strict normal crossings charts, `(X^ad, D^ad)` is a smooth pair whose complement is the
analytified open Shimura variety.

For the boundary-complement restriction (*boundary-complement-restriction*) the worked examples are
the degenerate empty-boundary Check and the computation of `H^0(X, j_!Z/n) = 0` and
`H^0(X, j_*Z/n) = Z/n` on the punctured disc.

### Dependencies

Layers AdicSpacesPartII R0 and AdicSpacesPartII R1 of this roadmap (the locally noetherian analytic carriers, fibre products and their
points, étale, smooth and unramified morphisms with their composition, cancellation, base change
and local structure, closed adic subspaces, the rigid–adic comparison functor `r` with its étale
comparison, and the analytification functor with its compatibilities); AdicEtaleGeometry layer A1
(the étale site with its base change and slices, the corrected pro-étale site with its slices and
the projection `ν`, étale morphisms by local description, strongly sheafy pairs, and geometric
points with the splitting of their étale covers and Scholze's point morphisms `i_x`);
SchemeAndStackFoundations layer SF.4 (strict normal crossings divisors of schemes, for the
comparison in *analytification-of-smooth-pair*); Tau Ceti `TauCeti.ValuationSpectrum.closedPolydisc`;
Mathlib `CategoryTheory.GrothendieckTopology` with `over`, `overPullback` and `Point`,
`CategoryTheory.Functor.IsContinuous`, `CoverPreserving`, `compatiblePreservingOfFlat`,
`flat_of_preservesFiniteLimits`, `isContinuous_of_coverPreserving`, `sheafPushforwardContinuous`
(with the adjunction), `sheafPullback` (with `sheafAdjunctionContinuous`),
`sheafPushforwardCocontinuous`, `sheafAdjunctionCocontinuous`, `CategoryTheory.Sheaf`,
`CategoryTheory.Over.iteratedSliceEquiv`, `CategoryTheory.Functor.IsDenseSubsite` with
`sheafEquiv`, `inducedTopology`, `sheafInducedTopologyEquivOfIsCoverDense`,
`AlgebraicGeometry.Etale`, `AlgebraicGeometry.Scheme.Etale`,
`AlgebraicGeometry.Scheme.smallEtaleTopology`, `AlgebraicGeometry.Scheme.ofArrows_mem_smallEtaleTopology_iff`
and `AlgebraicGeometry.Scheme.proetaleTopology` (as a non-example). The étale-cohomology roadmaps and DiamondsAndVStacks
are consumers and owners of neighbouring material, not inputs.

### R4.9 affinoid equations for adic realization

For a `K`-affinoid algebra `A`, the affinoid pair of `A` has carrier `A` and plus ring `A°`.
The underlying space of Part II's `r(Sp A)` is
`Spa(A,A°)`, and every morphism on these charts is the map of complete
Huber pairs. The adic realization is glued
on admissible affinoid coverings: it sends admissible opens to opens and admissible
coverings to coverings (Huber96 §1.1, (1.1.11), pp. 42–43).
*etale-site-and-rigid-comparison* identifies the induced étale topology and the sheaf
categories; *analytification-etale-site* states the continuous functor on the
small étale sites and its preservation of finite limits.

**Checks.** For the field point, the plus ring is
`{a : k | ‖a‖ ≤ 1}`, and both `Spa(k,k°)` and the adic realization
of `Sp k` have exactly one point, with their comparison isomorphism
(Huber96 Def. 1.1.3, p. 39, and (1.1.11), pp. 42–43). The zero algebra gives
the empty space for both. The disc is distinguished from the point by its nontrivial
point set, for both.

## Layer R5: families and sousperfectoid spaces

This layer builds on layers AdicSpacesPartIII F0, AdicSpacesPartII R0, AdicSpacesPartIII R2 and AdicSpacesPartIII R3, on AdicEtaleGeometry layer A1, and, in R5.1–R5.5 only, on the PerfectoidSpaces subsections listed in the dependency block at the head of this README. It defines sousperfectoid Tate rings
through perfectoid frames and proves the class
stable under rational localisation, finite étale extension, faithfully flat finite étale descent,
Tate and Laurent algebras and annuli, with finite extensions of `ℚ_p` as the basic examples; it
proves sousperfectoid rings uniform — Tau Ceti's `IsUniform.isReduced` gives the reducedness
clause — and sousperfectoid pairs stably uniform, sheafy, strongly sheafy and `𝒪`-acyclic; it
defines sousperfectoid adic spaces, proves that étale spaces over them are sousperfectoid adic
spaces, that they are stably adic, and that étale maps to locally noetherian spaces base change
along them; it constructs the product of a perfectoid space with a smooth rigid space, proves it
sousperfectoid and gives its tilde-limit presentation; and it builds the completed coefficient
algebras of Chojecki–Hansen–Johansson — profinite flat modules, small `ℤ_p`-algebras, the mixed
completed tensor product — and the coefficient sheaves `𝒪_X ⊗̂ R` on affinoid rigid spaces with their
Tate acyclicity, localisation functor, coherent modules, Kiehl theorem for finite free
coefficient algebras with projectivity of locally projective localised modules, base change and
dense-restriction properties. The tilde-limit relation and affinoid criterion in R5.8 give the
tilde-limit presentation of the product. The perfectoid predicate throughout
is PerfectoidSpaces P1.1's `Perfectoid.IsPerfectoidTateRing`: on a complete Hausdorff Tate ring,
`A°` is bounded and some pseudouniformiser `ϖ ∈ A°` has `ϖ^p ∣ p` with Frobenius `A°/ϖ → A°/ϖ^p`
bijective.

### R5.1 sousperfectoid rings

**Sousperfectoid Tate rings and perfectoid frames.** (*sousperfectoid-ring*) Fix a prime `p`
(the Lean declarations `PerfectoidFrame` and `IsSousperfectoid` take any `p : ℕ`). Let
`R` be a complete Hausdorff Tate ring (Tau Ceti `Huber.IsTateRing`) in which `p` is topologically
nilpotent — equivalently, a Tate ring with a continuous ring map `ℤ_p → R`, that is, a complete Tate
`ℤ_p`-algebra. A perfectoid frame for `R` is a triple `(R̃, ι, σ)` consisting of a perfectoid Tate
ring `R̃` satisfying PerfectoidSpaces P1.1's `Perfectoid.IsPerfectoidTateRing p R̃`,
a continuous ring homomorphism `ι : R → R̃`, and a continuous `R`-linear map
`σ : R̃ → R` (`R̃` an `R`-module through `ι`) with `σ ∘ ι = id_R`.
The ring predicate, as P1.1 defines it, is a condition on a complete Hausdorff Tate ring:
`R̃°` is bounded and some pseudouniformiser `ϖ ∈ R̃°` has `ϖ^p ∣ p` with Frobenius
`R̃°/ϖ → R̃°/ϖ^p` bijective; equivalently it includes completeness, Hausdorffness, uniformity,
an explicit prime, a pseudouniformizer with the required divisibility, and surjective
Frobenius modulo `p` (`TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing.iff_frobenius_surjective_modP`;
Berkeley Definition 6.1.1).
`R` is sousperfectoid if it admits a perfectoid frame; a Huber pair `(R, R⁺)` is
sousperfectoid if `R` is. Conventions: `ι` is then injective and a homeomorphism onto the closed
subring `ι(R) = ker(id − ι∘σ)`; `σ` need not be multiplicative and need not map any ring of integral
elements into `R⁺`; no perfectoid base field is fixed, and `R̃` is not required to contain one;
characteristic `p` is allowed, and then `R̃` is a perfect complete Tate ring. In `Huber`, define the
structure `PerfectoidFrame` (a perfectoid frame `(R̃, ι, σ)` for `R`) and the class
`IsSousperfectoid` (`R` is a Tate ring admitting a perfectoid frame); prove that a perfectoid
frame makes `R` sousperfectoid, `IsSousperfectoid.of_isPerfectoidTateRing` (perfectoid Tate rings
are sousperfectoid, with the identity frame `PerfectoidFrame.refl`),
`PerfectoidFrame.powerBoundedSubring_eq_comap` (`a ∈ R°` iff `ι(a) ∈ R̃°`: power-boundedness is detected in the
frame, Tau Ceti `Huber.powerBoundedSubring`), `IsSousperfectoid.isUniform` (sousperfectoid rings are
uniform, *sousperfectoid-uniform*), `IsSousperfectoid.isReduced` (sousperfectoid rings are reduced,
uniform rings being reduced), invariance under isomorphisms of
topological rings, base change of a frame along a map `R → S` of
complete Tate rings whose completed tensor product `R̃ ⊗̂_R S` is perfectoid (R5.2, through
AdicSpacesPartIII R3.5's *split-injection-completed-base-change*), `isSousperfectoid_ratLoc` (rational
localisations of sousperfectoid rings are sousperfectoid, *sousperfectoid-rational-localisation*),
`IsSousperfectoid.finiteEtale` (finite étale algebras over sousperfectoid rings are sousperfectoid,
*sousperfectoid-finite-etale*), `IsSousperfectoid.restrictedMvPowerSeries` (Tate algebras over
sousperfectoid rings are sousperfectoid, *sousperfectoid-rings*), `isUniform_ratLoc`
(sousperfectoid pairs are stably uniform, *sousperfectoid-stably-uniform*) and
`IsSousperfectoid.isSheafyRing` (sousperfectoid pairs are sheafy and strongly sheafy, *sousperfectoid-sheafy*).
The closed-embedding assertion is Mathlib `Function.LeftInverse.isClosedEmbedding` applied to
`σ ∘ ι = id_R` and the continuity of `σ` and of `ι`, using the Hausdorff property of `R̃`
(Berkeley Lecture 6, §6.3, Def. 6.3.1, p. 47; HK §7, Def. 7.1, p. 25 (perfectoid frames); BHW §3.1,
Def. 3.2(1), p. 1724; Berkeley Lecture 6, §6.3, Ex. 6.3.2(1), p. 47 (perfectoid rings are
sousperfectoid with the frame `(R, id, id)`); Berkeley Lecture 6, §6.3, Ex. 6.3.2(2), p. 47
(`ℚ_p⟨T⟩` is sousperfectoid with frame `ℚ_p^cycl⟨T^{1/p^∞}⟩` but not perfectoid)). *Needs:*
PerfectoidSpaces P1.1 (`Perfectoid.IsPerfectoidTateRing`) and P1.31 (`ℚ_p^cycl`); Tau Ceti `Huber.IsTateRing`,
`Huber.IsHuberRing`; Mathlib `ContinuousLinearMap`. Lean: `Huber.PerfectoidFrame`,
`Huber.PerfectoidFrame.refl`, `Huber.IsSousperfectoid`,
`Huber.IsSousperfectoid.of_isPerfectoidTateRing`,
`Huber.PerfectoidFrame.powerBoundedSubring_eq_comap`, `Huber.IsSousperfectoid.isUniform`,
`Huber.IsSousperfectoid.isReduced`.

**Checks.**

- Computation: `ℚ_p⟨T⟩` is sousperfectoid:
  `ι : ℚ_p⟨T⟩ → ℚ_p^cycl⟨T^{1/p^∞}⟩` with `σ` = (the retraction `ℚ_p^cycl → ℚ_p`) applied to the
  coefficients followed by deleting the non-integral exponents is a perfectoid frame (Lean
  `example`, with the following non-example).
- Non-example: `ℚ_p⟨T⟩` is not a
  perfectoid Tate ring: Frobenius on `ℤ_p⟨T⟩/p = 𝔽_p[T]` is not surjective (`T` is not a `p`-th
  power), so "sousperfectoid" is strictly weaker than "perfectoid".
- Non-example: `A = ℚ_p⟨X, Q⟩/(Q²)` is strongly noetherian
  and sheafy (the AdicSpaces layer 4 example) but not sousperfectoid: a sousperfectoid ring is
  uniform, hence reduced, and `Q ≠ 0` is nilpotent. A definition by "sheafy", or by a splitting of
  abstract modules into a non-perfectoid ring, fails this test (Lean `example`).
- Degenerate: `ℚ_p` (the Tate algebra in zero variables) is
  sousperfectoid, with frame `ℚ_p → ℚ_p^cycl` split by a continuous `ℚ_p`-linear retraction
  (*sousperfectoid-p-adic-field*).
- Compatibility: every perfectoid Tate ring in the sense of
  PerfectoidSpaces layer P1 (for example `ℚ_p^cycl`, or `𝔽_p((t^{1/p^∞}))^∧`) is sousperfectoid via
  the identity frame.
- Characterisation: for a uniform complete Tate ring `A` of
  characteristic `p` whose Frobenius is finite, `A` is sousperfectoid iff Frobenius `A → A` splits as
  `A`-modules (HK §7, Lem. 7.10) (Lean `example`); for example `𝔽_p((t))⟨T⟩` is sousperfectoid.
- Degenerate: the zero ring is a perfectoid Tate ring in the sense of
  the P1 structure (`0` is a topologically nilpotent unit, `0^p ∣ p = 0`, Frobenius on `0` is
  surjective), hence sousperfectoid with the identity frame; this is why
  *perfectoid-times-polydisc* needs `S ≠ 0`: `0⟨T⟩ = 0` is perfectoid (Lean `example`).
- Non-example: the uncompleted field `ℚ_p(ζ_{p^∞})` with its
  `p`-adic topology is a Tate ring that admits no perfectoid frame at all: a
  frame `(R̃, ι, σ)` makes `ι` a homeomorphism onto the closed subgroup `ker(id − ι∘σ)` of the
  complete Hausdorff group `R̃`, so a sousperfectoid ring is complete and Hausdorff, which
  `ℚ_p(ζ_{p^∞})` is not (Lean `example`: a sousperfectoid ring is Hausdorff and complete). The class
  `Huber.IsSousperfectoid` therefore omits completeness and
  the Hausdorff property, and omits the topological nilpotence of `p` (which holds in `R̃` since
  `ϖ^p ∣ p` there, and descends along the embedding `ι`): all three are consequences, not
  hypotheses. The same control shows that *split-injection-completed-base-change* cannot produce a
  frame on a non-complete `S`.
- Convention: the identity `σ ∘ ι = id_R` is on `R`;
  on `R̃` the composite `ι ∘ σ` is only an idempotent: for `R = ℚ_p`, `R̃ = ℚ_p^cycl` and
  `σ` = Tate's normalised trace (a continuous `ℚ_p`-linear retraction, `σ = [K_n : ℚ_p]^{-1} Tr`
  on `K_n = ℚ_p(ζ_{p^n})`), `ι(σ(ζ_{p²})) = σ(ζ_{p²}) = 0 ≠ ζ_{p²}` (the primitive `p²`-th roots of
  unity sum to `μ(p²) = 0`), while `σ(ι(1)) = 1`; `ζ_p` is a poorer witness, since for `p = 2`,
  `ζ_2 = −1 ∈ ℚ_2` and `ι(σ(ζ_2)) = ζ_2`. The assertion that the reversed composite
  can fail assumes `R ≠ 0` (Lean `example`: `σ ∘ ι = id`, `ι ∘ σ` is idempotent, and over a nonzero
  `R` it is not the identity for every frame).
- Negative control: for `R = 0` the unital map
  `ι : R → R̃` forces `R̃ = 0`, and both composites are identities. A counterexample to
  the reversed identity cannot be demanded over the zero ring.

### R5.2 stability of the class

**Base change of a frame.** The continuous splitting used here is AdicSpacesPartIII R3.5's
*split-injection-completed-base-change*, which this roadmap cites and does not restate. For a
frame `(R̃, ι, σ)` of a Tate ring `R` and a continuous map `R → S` to a complete Tate ring for
which the completed tensor product `R̃ ⊗̂_R S` (AdicSpacesPartII R0, *completed-tensor-product*)
is perfectoid, `(R̃ ⊗̂_R S, s ↦ 1 ⊗ s, σ ⊗̂ id)` is a frame of `S`, with embedding `s ↦ 1 ⊗ s`
and retraction `x ⊗ s ↦ σ(x)s` on pure tensors (HK Rem. 7.2, p. 25). Completeness and
Hausdorffness of the target are required. Its unit-coefficient, zero-scalar and two-term Checks
are `σ_S(x ⊗ 1) = σ(x)`, `σ_S(x ⊗ 0) = 0` and `σ_S(x ⊗ s + y ⊗ t) = σ(x)s + σ(y)t`.

**Sousperfectoid rings are uniform.** (*sousperfectoid-uniform*) Let `R` be a complete Tate ring
that is sousperfectoid with frame `(R̃, ι, σ)`. Prove that `R° = ι^{-1}(R̃°)` and that `R°` is
bounded, that is, `R` is uniform in the sense of HK Definition 2.3 (AdicSpaces layer 4.2); in
particular `R` is reduced (HK §7, Def. 7.1, p. 25 (sousperfectoid implies uniform via strictness);
HK §2, Def. 2.3, p. 3 (uniformity descends along strict inclusions); HK §2, after Def. 2.3, p. 3
(uniform rings are reduced); Berkeley Lecture 7, introduction, p. 49 (perfectoid Tate rings are
uniform by definition)). As predicted, `ℚ_p⟨T⟩° = ℤ_p⟨T⟩` is bounded, while `ℚ_p⟨X, Q⟩/(Q²)` has
the unbounded power-bounded subring `ℤ_p⟨X⟩ + ℚ_p⟨X⟩Q` and so is not sousperfectoid. *Needs:*
*sousperfectoid-ring*; PerfectoidSpaces P1.1 (`Perfectoid.IsPerfectoidTateRing`); Tau Ceti
`Huber.powerBoundedSubring`, `Huber.IsBounded`, `Huber.IsPowerBounded`.
Lean: `Huber.IsSousperfectoid.isUniform`.

**Rational localisations of sousperfectoid rings are sousperfectoid.** (*sousperfectoid-rational-localisation*) Let `(R, R⁺)` be a Huber pair with `R` sousperfectoid,
`X = Spa(R, R⁺)` and `U = R(T/s) ⊆ X` a rational subset (`T` finite with `T·R = R`). Prove that the
complete Tate ring `𝒪_X(U) = R⟨T/s⟩` (the completed rational localisation of AdicSpaces, Tau Ceti
`Huber.PairOfDefinition.completionLocalization`; AdicEtaleGeometry's `Huber.ratLoc` in Lean) is sousperfectoid. Explicitly: for a frame
`(R̃, ι, σ)` and a ring of integral elements `R̃⁺ ⊆ R̃°` containing `ι(R⁺)` — which can be taken to
be the integral closure in `R̃` of the subring generated by `ι(R⁺)` and the topologically nilpotent
elements `R̃°°`, an open subring contained in `R̃°` — the preimage `Ũ` of `U` in `X̃ = Spa(R̃, R̃⁺)`
is the rational subset `R(ι(T)/ι(s))`, `R̃ ⊗̂_R 𝒪_X(U) ≅ 𝒪_X̃(Ũ) = R̃⟨ι(T)/ι(s)⟩` is perfectoid,
and `(𝒪_X̃(Ũ), ι ⊗̂ id, σ ⊗̂ id)` is a perfectoid frame for `𝒪_X(U)` (Berkeley Lecture 6, §6.3,
Prop. 6.3.3(1), p. 47; Berkeley Lecture 6, proof of Prop. 6.3.3, p. 48 (base change of the frame
along the rational localisation); Berkeley Lecture 6, §6.2, Thm 6.2.6, p. 45 (rational
localisations of perfectoid Tate rings are perfectoid); HK §3, Prop. 3.8, p. 8 (rational
localisations of perfectoid rings, with no base field, are perfectoid)). For `R = ℚ_p⟨T⟩` and
`U = {|T| ≥ 1}`, `𝒪_X(U) = ℚ_p⟨T^{±1}⟩` is sousperfectoid with frame `ℚ_p^cycl⟨T^{±1/p^∞}⟩`; for
`R` perfectoid the statement reduces to the perfectoid case with the identity frame. *Needs:*
*sousperfectoid-ring*; *sousperfectoid-uniform*; *split-injection-completed-base-change*;
*completed-tensor-rational-localisation* (AdicSpacesPartII layer R0); the perfectoid rational-localization argument of PerfectoidSpaces P2.3; Tau Ceti
`Huber.PairOfDefinition.completionLocalization`,
`Huber.PairOfDefinition.existsUnique_continuous_ringHom_completion_locTopology`,
`ValuationSpectrum.spaComap_preimage_rationalSubset`, `ValuationSpectrum.rationalSubset`,
`Huber.IsRingOfIntegralElements`. Lean: `Huber.isSousperfectoid_ratLoc`.

**Finite étale algebras over sousperfectoid rings are sousperfectoid.** (*sousperfectoid-finite-etale*)
Let `R` be sousperfectoid and `S` a finite étale `R`-algebra (Mathlib `Algebra.Etale` and
`Module.Finite`: finite, flat, finitely presented, unramified), with its natural topology as a finite
`R`-module and `S⁺` the integral closure of `R⁺` in `S` (AdicEtaleGeometry layer A1,
*finite-etale-affinoid-algebra*). Prove that `S` is a complete Tate ring and is sousperfectoid, with
frame `S → R̃ ⊗_R S` (`= R̃ ⊗̂_R S`) split by `σ ⊗_R id_S` (Berkeley Lecture 6, §6.3,
Prop. 6.3.3(2), p. 47; Berkeley Lecture 6, proof of Prop. 6.3.3, p. 48 (through almost purity:
finite étale over perfectoid is perfectoid); Berkeley Lecture 7, §7.4, Thm 7.4.5(1), p. 53 (the
almost-purity input); HK §7, Lem. 7.5, p. 25 (finite étale stability and faithfully flat finite
étale descent); HK §2, Prop. 2.15(a), p. 5 (finite étale algebras over perfectoid rings, with no
base field, are perfectoid)). For `R = ℚ_p` and `S = ℚ_p(ζ_p)`, `S` is sousperfectoid with frame
`ℚ_p^cycl ⊗_{ℚ_p} ℚ_p(ζ_p) ≅ (ℚ_p^cycl)^{p−1}`, a finite product of perfectoid fields; for
`R = ℚ_p⟨T^{±1}⟩` and `S = R[T^{1/n}]` with `n` prime to `p`, `S` is sousperfectoid. *Needs:*
*sousperfectoid-ring*; *split-injection-completed-base-change*; AdicEtaleGeometry layer A1
(*finite-etale-affinoid-algebra*); *completed-tensor-product* (AdicSpacesPartII layer R0); the finite étale perfectoid-frame argument of HK Lemma 7.5;
PerfectoidSpaces P3.10;
Mathlib `Algebra.Etale`, `Module.Finite`, `Module.Projective`, `Module.Flat`.
Lean: `Huber.IsSousperfectoid.finiteEtale`.

**Descent of the sousperfectoid property along faithfully flat finite étale maps.** (*sousperfectoid-finite-etale-descent*) Let `R → S` be a finite étale and faithfully flat
homomorphism of complete Tate rings, `S` with its natural topology. Prove that if `S` is
sousperfectoid then so is `R`: for a frame `(S̃, ι_S, σ_S)` of `S` and any `R`-linear retraction
`τ : S → R` of `R → S`, the triple `(S̃, ι_S ∘ (R → S), τ ∘ σ_S)` is a perfectoid frame of `R`
(HK §7, Lem. 7.5, p. 25; HK §7, proof of Lem. 7.5, p. 26 (compose the frame of `B` with a splitting
of `A → B`)). Thus if `R → S` is a finite Galois étale cover and `S` is sousperfectoid then `R` is
sousperfectoid. Faithful flatness is needed: `R = ℚ_p × ℚ_p⟨X, Q⟩/(Q²) → S = ℚ_p`, the projection to
a direct factor, is finite étale but not faithfully flat, `S` is sousperfectoid, and `R` is not,
being non-reduced. *Needs:* *sousperfectoid-ring*; *sousperfectoid-finite-etale*; Mathlib
`Module.Projective`, `Module.Flat`, `Algebra.Etale`. Lean: `Huber.IsSousperfectoid.of_finiteEtale`.

**Tate algebras over sousperfectoid rings are sousperfectoid.** (*sousperfectoid-rings*) Let `R` be
sousperfectoid and `n ≥ 0`. Prove that `R⟨T₁, …, Tₙ⟩` (Tau Ceti
`Huber.restrictedMvPowerSeriesCompletion`) is sousperfectoid: for a frame `(R̃, ι, σ)` of `R`, the
perfectoid Tate ring `R̃⟨T₁^{1/p^∞}, …, Tₙ^{1/p^∞}⟩` — the completion of `R̃[T_i^{1/p^∞}]` for the
topology in which `R̃°[T_i^{1/p^∞}]` is open with its `ϖ`-adic topology — with
`ι⟨T⟩(Σ a_α T^α) = Σ ι(a_α) T^α` and

```text
σ'(Σ_{α ∈ (ℤ[1/p]_{≥0})^n} x_α T^α) = Σ_{α ∈ ℕ^n} σ(x_α) T^α
```

is a perfectoid frame; the case `n = 0` is trivial (Berkeley Lecture 6, §6.3, Prop. 6.3.3(3), p. 47;
Berkeley Lecture 6, proof of Prop. 6.3.3, p. 48 (the frame `R⟨T⟩ → R̃⟨T^{1/p^∞}⟩`); HK §7, Lem. 7.3,
p. 25 (Tate and Laurent algebras over sousperfectoid rings); HK §7, proof of Lem. 7.3, p. 25 (the
splitting of the frame for `A⟨T⟩`)). Parts (1) and (2) of Berkeley's Proposition 6.3.3 are
*sousperfectoid-rational-localisation* and *sousperfectoid-finite-etale*, and Proposition 6.3.4 is
*sousperfectoid-stably-uniform*. Berkeley's Example 6.3.2(2), `ℚ_p⟨T⟩` sousperfectoid with
`R = ℚ_p` and `R̃ = ℚ_p^cycl`, is the case `n = 1`; for a perfectoid field `L`, `L⟨T₁, …, Tₙ⟩` is
sousperfectoid, which is the polydisc factor of BHW Corollary 3.4; iterating,
`R⟨T⟩⟨S⟩ = R⟨T, S⟩` is sousperfectoid, and relative polydiscs `𝔹^n_X` over sousperfectoid `X` are
sousperfectoid (the ambient spaces of ECD 6.4(iv) in AdicEtaleGeometry layer A3). *Needs:*
*sousperfectoid-ring*; *completed-tensor-restricted-power-series* (AdicSpacesPartII layer R0); PerfectoidSpaces P1.1 and P1.30 (perfected Tate algebras); Tau Ceti `Huber.restrictedMvPowerSeriesCompletion`;
Mathlib `ContinuousLinearMap`. Lean: `Huber.IsSousperfectoid.restrictedMvPowerSeries`.

**Laurent algebras and annuli over sousperfectoid rings are sousperfectoid.** (*sousperfectoid-annulus*) Let `R` be sousperfectoid with pseudo-uniformizer `ϖ` and let `a ≤ b` be
integers, so that the annulus is non-empty when `R ≠ 0`; the radii are integral powers of `|ϖ|`.
Prove that `R⟨T^{±1}⟩` and the annulus ring `R⟨T/ϖ^a, ϖ^b/T⟩ := 𝒪(W)` for the rational subset
`W = {|ϖ^b| ≤ |T| ≤ |ϖ^a|}` of `Spa(R⟨S⟩, R⁺⟨S⟩)` with `T = ϖ^a S` are sousperfectoid (HK §7,
Lem. 7.3, p. 25). In `Spa R⟨S⟩` one has `|S| ≤ 1`, so `|T| ≤ |ϖ^a|` is automatic and `W` is the
rational subset `R({ϖ^{b−a}}/S) = {|ϖ^{b−a}| ≤ |S|}` (its weight `ϖ^{b−a}` is a unit, so it
generates the unit ideal and `|S| ≠ 0` is implied). Witness of the convention: for `R = ℚ_p`,
`ϖ = p`, `a = 0`, `b = 1`, `W = {|p| ≤ |T| ≤ 1}` is the closed annulus with `𝒪(W) = ℚ_p⟨T, p/T⟩`;
for `a = 1`, `b = 0` the inequalities `|p^0| ≤ |T| ≤ |p|` have no solution and `W = ∅`, whose ring
`𝒪(∅) = 0` is sousperfectoid for a trivial reason — the hypothesis `a ≤ b` is what makes the
identification of `W` with `R({ϖ^{b−a}}/S)` correct (a formal statement reading the exponent as
`(b − a).toNat` would, for `a > b`, describe the Laurent annulus `R({1}/S)` instead of `∅`).
Over a perfectoid field `L`, the closed annulus `{|ϖ| ≤ |T| ≤ 1}` is a
sousperfectoid, non-perfectoid affinoid. *Needs:* *sousperfectoid-rings*;
*sousperfectoid-rational-localisation*; Tau Ceti `ValuationSpectrum.rationalSubset`.

**Check.** The ambient disc condition
`|S| ≤ 1` is explicit for every valuation of the chosen plus ring. At `(a,b)=(0,1)` rational
membership is then exactly `|p| ≤ |S| ≤ 1`; reversing the exponents would replace `p` by `1`.

**Finite extensions of `ℚ_p` are sousperfectoid.** (*sousperfectoid-p-adic-field*) Let `K` be a
finite extension of `ℚ_p` (discretely valued, so orthonormal bases exist) and `K^cycl` the
completion of `K(μ_{p^∞})`. Prove that `K → K^cycl` admits a continuous `K`-linear retraction, so
that `(K^cycl, inclusion, retraction)` is a perfectoid frame and `K` is sousperfectoid; more
generally `K⟨T₁, …, Tₙ⟩` and every rational localisation and finite étale algebra of it are
sousperfectoid (HK §7, Rem. 7.8, p. 26 (nonarchimedean fields with a perfectoid countable profinite
étale extension are sousperfectoid); Berkeley Lecture 6, §6.3, Ex. 6.3.2(2), p. 47). The
retraction exists because `K` is discretely valued, hence spherically complete, so that the
one-dimensional closed subspace `K ⊆ K^cycl` is complemented (Hahn–Banach; equivalently Tate's
normalised trace); over a non-spherically complete base field a closed line need not be
complemented, which is why no general "every complete field is sousperfectoid" is claimed. Thus
`K` is sousperfectoid but not perfectoid. Write `p = uπ^e` for a uniformizer `π` of `K`.
If `e < p`, no topologically nilpotent `ϖ` satisfies `ϖ^p ∣ p`. If `e ≥ p`, that divisibility
can hold (take `ϖ = π`), but Frobenius on `𝒪_K/p` is not surjective: the class of `π` has
valuation `1`, whereas a nonzero `p`-th power has valuation divisible by `p`, modulo `π^e`.
For `K = ℚ_p`, Frobenius on `𝔽_p` is surjective and the divisibility is the obstruction;
for the totally ramified extension with `π^p = p`, the divisibility holds and Frobenius fails.
These satisfy the perfectoid input predicate by the Frobenius criterion. Every affinoid algebra of the form `K⟨T⟩⟨f/g⟩`, and every
smooth affinoid over `K` that is étale over a polydisc through a composite of rational localisations
and finite étale maps, is sousperfectoid. *Needs:* *sousperfectoid-ring*; *sousperfectoid-rings*;
*sousperfectoid-rational-localisation*; *sousperfectoid-finite-etale*; the Frobenius criterion of PerfectoidSpaces P1.1
(`Perfectoid.IsPerfectoidTateRing.iff_frobenius_surjective_modP`) and `ℚ_p^cycl` (P1.31).
Lean: `Huber.IsSousperfectoid.of_finite_padic`.

### R5.3 stable uniformity and sheafiness

**Sousperfectoid pairs are stably uniform.** (*sousperfectoid-stably-uniform*) Let `(R, R⁺)` be a
Tate Huber pair with `R` complete Tate and sousperfectoid and `R⁺` any ring of integral elements.
That `(R, R⁺)` is stably uniform — for every rational subset `U ⊆ Spa(R, R⁺)`, `𝒪(U)` is uniform
(HK Definition 3.13; AdicSpaces layer 4.2) — is the splitting criterion *stably-uniform-sheafy*
(AdicSpacesPartIII layer R3; KL15 Rem. 2.8.12) applied to the frame map `ι : R → R̃`, `R̃` perfectoid and hence
stably uniform by the perfectoid rational-localization argument, with the retraction `σ` (Berkeley Lecture 6, §6.3,
Prop. 6.3.4, p. 48). BHW's Proposition 3.3 is this statement; on the closed unit disc over `ℚ_p`
it says that every rational localisation `ℚ_p⟨T⟩⟨f/g⟩` is reduced and uniform. *Needs:*
*sousperfectoid-rational-localisation*; *sousperfectoid-uniform*; *stably-uniform-sheafy*
(AdicSpacesPartIII layer R3); the perfectoid rational-localisation argument of PerfectoidSpaces P2.3.
Lean: `Huber.isUniform_ratLoc`.

**Sousperfectoid pairs are sheafy, strongly sheafy and `𝒪`-acyclic.** (*sousperfectoid-sheafy*) Let
`(R, R⁺)` be a Tate Huber pair with `R` sousperfectoid, as in *sousperfectoid-stably-uniform*.
Prove that `(R, R⁺)` is sheafy, so that `Spa(R, R⁺)` is an affinoid adic space in the sense of
AdicSpaces layer 5, that `H^i(Spa(R, R⁺), 𝒪) = 0` for `i > 0`, and that `R` is strongly sheafy:
every `R⟨T₁, …, Tₙ⟩` is sheafy — the predicate `Huber.IsStronglySheafy` of AdicEtaleGeometry
layer A1 (*strongly-sheafy-huber-pair*) (BHW §3.1, Prop. 3.3, p. 1724 (citing Berkeley 6.3.4); HK §7,
Cor. 7.4, p. 25 (strong sheafiness of sousperfectoid rings); HK §3, Prop. 3.14, p. 9
(Buzzard–Verberkmoes–Mihara)). By this route `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is sheafy without using
noetherianity. For nonzero perfectoid `S`, `Spa(S⟨T⟩, S⁺⟨T⟩)` is sheafy although
`S⟨T⟩` is not perfectoid. It can be noetherian: take `S` to be a perfectoid field. *Needs:* *sousperfectoid-stably-uniform*; *sousperfectoid-rings*;
*stably-uniform-sheafy*, *sheafy-cech-acyclicity* (AdicSpacesPartIII layer R3); AdicEtaleGeometry layer A1
(*strongly-sheafy-huber-pair*).

The sheafiness statement supplies the affinoid adic space for any
chosen ring of integral elements, and the strong sheafiness is
A1's predicate; both are `Huber.IsSousperfectoid.isSheafyRing` in Lean. The acyclicity statement
asserts vanishing of the ordinary additive structure-sheaf cohomology in positive
degree, using Mathlib's `Sheaf.H` and its explicit sheafification and Ext assumptions; it is
specified in this README only.

### R5.4 sousperfectoid spaces

**Sousperfectoid adic spaces.** (*sousperfectoid-adic-space*) An adic space `X` (AdicSpaces layer 5:
an object of Huber's category `𝒱` covered by affinoid adic spaces) is sousperfectoid if it admits an
open cover by affinoid adic spaces `Spa(R, R⁺)` with `R` sousperfectoid (*sousperfectoid-ring*);
such `Spa(R, R⁺)` are adic spaces by *sousperfectoid-sheafy*. Equivalently, the open affinoid
subspaces `Spa(R, R⁺) ⊆ X` with `R` sousperfectoid form a basis of the topology of `X`. No base is
fixed; `X` lives over `Spa ℤ_p` because `p` is topologically nilpotent on every chart. A
sousperfectoid space is analytic, its charts being Tate. A morphism of sousperfectoid spaces is a
morphism of adic spaces. In `AdicSpace`, define the predicate `IsSousperfectoid` (`X` admits an open
cover by `Spa(R, R⁺)` with `R` sousperfectoid); prove `IsSousperfectoid.spa` (`Spa(R, R⁺)` is a
sousperfectoid adic space for `R` sousperfectoid), that
perfectoid spaces are sousperfectoid, that open subspaces of
sousperfectoid spaces are sousperfectoid, that the sousperfectoid
affinoid opens form a basis of the topology of `X`, `IsSousperfectoid.isAnalytic` (every point of a
sousperfectoid space is analytic), that `𝒪_X(U)` is reduced for
every open `U`, `IsSousperfectoid.of_etale` (étale over sousperfectoid is sousperfectoid,
*sousperfectoid-etale-stability*), that relative polydiscs exist
(`𝔹^n_X = X ×_{Spa ℤ_p} Spa ℤ_p⟨T₁, …, Tₙ⟩` exists and is sousperfectoid, locally `Spa R⟨T⟩`; on a
chart `Spa(R, R⁺)` the finite-type construction of *fibre-product-along-finite-type*
with `M = {1}` gives `W_m = Spa R⟨T⟩` for every `m`, since `M_{L,m} = {1} ∪ Lᵐ` includes the
weight `1`; hence its union is `Spa R⟨T⟩`. This applies also when `p = 0` or when `p` is a
nonzero nonunit in `R`), that sousperfectoid affinoids are stably adic
(for a sousperfectoid affinoid `Spa(R, R⁺)`, the composites of
rational localisations and finite étale maps over `(R, R⁺)` form a stable basis of its étale site in
the sense of Kedlaya–Liu 8.2.19, so it is stably adic, and `X_ét` is covered by the étale sites of
these affinoid opens, *sousperfectoid-stably-adic*) and `IsSousperfectoid.exists_fibreProduct_etale` (base
change of an étale map to a locally noetherian space along a map from a sousperfectoid space exists
and is sousperfectoid, *sousperfectoid-etale-base-change*) (BHW §3.1, Def. 3.2(3), p. 1724; HK §1,
Introduction, p. 3; Berkeley Appendix to Lecture 19, §19.5, p. 179 (sousperfectoid adic spaces are
locally `Spa` of sousperfectoid rings); BHW §3.1, p. 1724 (why the products must exist as adic
spaces)). Spaces locally admitting charts satisfying the perfectoid input predicate are
sousperfectoid, and so are smooth rigid spaces over a perfectoid field `L` or over a finite
extension `K` of `ℚ_p`. *Needs:* *sousperfectoid-ring*; *sousperfectoid-sheafy*;
*sousperfectoid-rational-localisation*; *affinoid-fibre-product*,
*fibre-product-along-finite-type*, *completed-tensor-restricted-power-series* (AdicSpacesPartII layer R0);
PerfectoidSpaces P2.9–P2.10 (affinoid perfectoid and perfectoid spaces); Tau Ceti
`ValuationSpectrum.spa`. Lean: `AdicSpace.IsSousperfectoid`, `AdicSpace.IsSousperfectoid.spa`,
`AdicSpace.IsSousperfectoid.isAnalytic`.

**Checks.**

- Computation: the closed unit disc
  `Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is a sousperfectoid adic space (Berkeley Lecture 6, §6.3, Ex. 6.3.2(2)).
- Compatibility: every perfectoid space
  (PerfectoidSpaces layer P2) is a sousperfectoid adic space, with charts the affinoid perfectoid
  opens.
- Non-example: `Spa(ℚ_p⟨X, Q⟩/(Q²))` is an adic
  space (strongly noetherian) but not sousperfectoid: sections of `𝒪` over any open of a
  sousperfectoid space are reduced (products and equalizers of reduced rings), while `Q ≠ 0` is
  nilpotent in the global sections.
- Degenerate: the empty adic space and
  `Spa(ℚ_p, ℤ_p)` are sousperfectoid.
- Characterisation: a rigid space
  smooth over a perfectoid field `L` is sousperfectoid (*perfectoid-times-smooth-fibre-product* with
  `X = Spa L`); for example `𝔹¹_L` is sousperfectoid and not perfectoid.

The predicate `AdicSpace.IsSousperfectoid p X` is exactly the existence, at each
point, of a Part II `AdicSpace.Chart` whose coordinate ring is sousperfectoid
and whose open immersion contains that point in its image.
The empty space satisfies this condition (Lean `example`);
a nonzero nilpotent section on any open excludes it (Lean `example`);
the closed disc over `ℚ_p` satisfies it.
Together with the closed-disc and perfectoid Checks above, these distinguish the
local condition from perfectoidness and from merely being analytic.

**Étale spaces over a sousperfectoid space are sousperfectoid adic spaces.** (*sousperfectoid-etale-stability*) Let `X` be a sousperfectoid adic space and `f : Y → X` étale in
the local-description sense of AdicEtaleGeometry layer A1 (Kedlaya–Liu Definition 8.2.16: every
`y ∈ Y` has an open neighbourhood on which `f` factors as an open immersion, a finite étale morphism
and an open immersion, where finite étale means affinoid-locally on the target
`Spa(S, S⁺) → Spa(R, R⁺)` with `R → S` finite étale and `S⁺` the integral closure of `R⁺`); for
locally noetherian targets this is Huber's étale (*differentials-unramified-smooth-etale*, AdicSpacesPartII layer R0;
the comparison with the local description is AdicEtaleGeometry layer A1,
*etale-morphisms-local-description-and-comparison*). Prove that `Y` is an adic space (not
merely a preadic space) and is sousperfectoid. In particular every object of the étale site `X_ét`
is a sousperfectoid adic space, and for a finite étale `R`-algebra `S` over a sousperfectoid `R` and
a composite of rational localisations and finite étale maps `R → S'`, the ring `S'` itself is
sousperfectoid. For a general étale map, sousperfectoidness is a property of the space `Y`, not of a
global ring: `Y` is covered by sousperfectoid affinoids, while the sousperfectoid property of rings
is not known to be of local nature (Berkeley Appendix to Lecture 19, §19.5, p. 179 (étale objects
over a sousperfectoid space are sousperfectoid adic spaces); KL15 §8.2, Def. 8.2.16, p. 162 (étale
morphisms of (pre)adic spaces by local description); KL15 §8.2, Rem. 8.2.18, p. 162 (why a class
stable under finite étale maps is needed); HK §5, Def. 5.1, p. 14 (étale in the naive sense:
locally a composition of rational localisations and finite étale maps); BHW §3.1, proof of
Cor. 3.4, p. 1725 (the étale step, which BHW attribute to 6.3.3(ii), the finite étale case)). Thus
any `Y ∈ X_ét` is itself sousperfectoid and in particular an adic space, and BHW's step "algebras
étale over a sousperfectoid algebra are again sousperfectoid" holds for composites of rational
localisations and finite étale maps and, for general étale maps, in the space-level form above.
*Needs:* *sousperfectoid-adic-space*; *sousperfectoid-finite-etale*;
*sousperfectoid-rational-localisation*; *sousperfectoid-sheafy*; AdicEtaleGeometry layer A1
(*finite-etale-affinoid-algebra*). Lean: `AdicSpace.IsSousperfectoid.of_etale`.

**Sousperfectoid spaces are stably adic.** (*sousperfectoid-stably-adic*) Let `X = Spa(R, R⁺)` with
`R` sousperfectoid, with `X_ét` in the local-description sense of AdicEtaleGeometry layer A1, and
let `B_X` be the class of objects `Y → X` of `X_ét` of the form `Y = Spa(S, S⁺)` with
`(R, R⁺) → (S, S⁺)` a finite composite of rational localisations and finite étale maps, the plus
rings being the integral closures. Prove that every such `S` is sousperfectoid (so `Spa(S, S⁺)` is
an affinoid adic space). Define on A1's small étale category of `X` the class generated by
the identity: start with the identity object up to isomorphism and close under rational
embeddings, finite étale maps and isomorphisms over `X`. This is `B_X`.
Prove that its members are basic objects in the sense of A1's *basis-comparison* for an
affinoid base. A1's class also starts from arbitrary affinoid open charts; those charts are
not additional starting objects of `B_X`. Prove,
for an explicit base `X = Spa(A₀, A₀⁺)` with `A₀` sousperfectoid (`Huber.IsSousperfectoid p A₀`) and
`U ∈ B_X`: for every sheafy complete affinoid presentation
`U ≅ Spa(A, A⁺)`, the ring `A` is sousperfectoid. Rational localisation and finite
étale stability give this assertion (HK Def. 7.1 and Lemma 7.5(a), p. 25); a cover by
sousperfectoid charts alone does not give it, since locality of the ring property is unknown
(HK Def. 7.1, p. 25).
The stable-basis statement says that `B_X` consists of affinoids, covers
every étale object by open immersions, and admits fibre products over `X` within `B_X`;
it also names the local strong-sheafiness supplied by *sousperfectoid-sheafy*.
The constructors include every rational subdomain and finite étale extension of a member.
Thus `B_X` is a stable basis in the sense of Kedlaya–Liu Definition 8.2.19, p. 163,
using the identity-generated basis of HK's proof of Proposition 5.5, p. 15. Consequently, by
*stable-basis-etale-vector-bundles* (Kedlaya–Liu Theorem 8.2.22(c),(d)): for every finite projective
`R`-module `M`, `M̃` is an acyclic sheaf on `B_X`, in particular `H^i(X_ét, 𝒪) = 0` for `i > 0`; and
finite projective `R`-modules are equivalent to finite locally free `𝒪_{X_ét}`-modules. For a
general sousperfectoid adic space these statements hold on every sousperfectoid affinoid open, and
such opens cover `X`. The class of all affinoid objects `Spa(S, S⁺)` of `X_ét` with `S`
sousperfectoid is not used as the basis: its closure under fibre products would need
`S₁ ⊗̂_S S₂` to be sousperfectoid for a general étale `S → S₁`, which is not known. Kedlaya–Liu
define `X_ét` and stable bases for preadic spaces over an analytic field; here, as in Berkeley
§19.5, they are used over `ℤ_p`, the proofs of Kedlaya–Liu 8.2.20–8.2.22 not using the base field
(KL15 §8.2, Def. 8.2.19, p. 163 (stable bases and stably adic spaces); KL15 §8.2, Rem. 8.2.18,
p. 162; HK §1, Introduction, p. 3 (finite étale covers of sousperfectoid spaces); KL15 §8.2, after
Def. 8.2.19, p. 163 (a stable basis must be closed under fibre products, which is why the basis is
the composites of rational localisations and finite étale maps); HK §5, proof of Prop. 5.5, p. 15
(the basis `B_X`); HK §5, Prop. 5.8, p. 16 (étale `𝒪`-acyclicity for strongly sheafy, in
particular sousperfectoid, pairs); KL15 §8.2, Thm 8.2.22(c),(d), p. 165). For `X` affinoid
perfectoid this recovers the stably adic property of perfectoid spaces; as in Berkeley §19.5, vector
bundles on `X_ét` for sousperfectoid `X` are finite projective modules on affinoids, the input to
Tannakian `G`-torsors. *Needs:* *sousperfectoid-etale-stability*; *sousperfectoid-finite-etale*;
*sousperfectoid-rational-localisation*; *sousperfectoid-sheafy*;
*stable-basis-etale-vector-bundles*; *completed-tensor-rational-localisation* (AdicSpacesPartII layer R0);
*sheafy-tate-acyclicity-and-kiehl-gluing*, *finite-projective-etale-descent* (AdicSpacesPartIII layer R3);
AdicEtaleGeometry layer A1 (*basis-comparison*).

**Checks.**

- The identity étale object belongs by the initial
  constructor, including when the base is empty.
- The split two-point cover of `Spa(ℚ₂, ℤ₂)` belongs
  by a finite étale step; it need not be an open immersion.
- The empty finite étale object over `Spa(ℚ₂, ℤ₂)`
  belongs; its coordinate ring is the zero ring.
- The non-quasicompact open unit disc inside the
  closed unit disc is étale but does not belong, since these basic objects are affinoid.
- An affinoid presentation with a nonzero
  nilpotent coordinate cannot belong to `B_X` over a sousperfectoid affinoid base.

**Base change of étale maps to locally noetherian spaces along sousperfectoid spaces.** (*sousperfectoid-etale-base-change*) Let `Z` be a sousperfectoid adic space, possibly non-noetherian. Its charts are stably sheafy; the formula below uses the stably sheafy case of *fibre-products-existence*, rather than requiring the locally noetherian case; let `W` be a locally noetherian analytic adic space (for example a rigid space),
so that étale maps to `W` have the local open-immersion/finite-étale description (Huber Lemma 2.2.8
through AdicEtaleGeometry layer A1); let `g : Z → W` be a morphism and `f : Y → W` étale (AdicSpacesPartII layer R0).
Prove that the fibre product `Z ×_W Y` exists in the category of adic spaces, that the projection
`Z ×_W Y → Z` is étale in the local-description sense of AdicEtaleGeometry layer A1, and that
`Z ×_W Y` is sousperfectoid. Affinoid formula: if `Y' ⊆ Y` is open and `f|_{Y'}` factors as an open
immersion `Y' → Y''` followed by a finite étale morphism `Y'' = Spa(B, B⁺) → W' = Spa(A, A⁺)` onto
an affinoid open `W' ⊆ W` (`A → B` finite étale, `B⁺` the integral closure of `A⁺`; such
factorisations exist locally by Huber Lemma 2.2.8), and `Z' = Spa(C, C⁺) ⊆ g^{-1}(W')` is an
affinoid open with `C` sousperfectoid, then `C ⊗_A B` is sousperfectoid,
`Z' ×_{W'} Y'' = Spa(C ⊗_A B, integral closure of C⁺ in C ⊗_A B)`, and `Z' ×_W Y'` is its open
subspace lying over `Y'` (Berkeley Lecture 7, §7.5, after Def. 7.5.1, p. 55 (Huber-étale maps of
analytic adic spaces are locally an open immersion followed by a finite étale map); KL15 §8.2,
Def. 8.2.16, p. 162; BHW §3.1, proof of Cor. 3.4, p. 1725 (the étale step)). For `W = 𝔹^n_L`,
`Z = X ×_L 𝔹^n` with `X` affinoid perfectoid and `Y → 𝔹^n` étale, `Z ×_W Y = X ×_L Y` is the BHW
product; for `Y = W'` an open subspace of `W`, `Z ×_W Y = g^{-1}(W')`. *Needs:*
*sousperfectoid-etale-stability*; *sousperfectoid-finite-etale*; *sousperfectoid-sheafy*;
AdicEtaleGeometry layer A1 (*finite-etale-affinoid-algebra*);
*completed-tensor-product-universal-property*, *affinoid-fibre-product*,
*locally-noetherian-adic-space*, *differentials-unramified-smooth-etale* (AdicSpacesPartII layer R0); Mathlib
`Algebra.Etale`. Lean: `AdicSpace.IsSousperfectoid.exists_fibreProduct_etale`.

### R5.5 perfectoid times smooth

**Perfectoid space times a polydisc: sousperfectoid, not perfectoid.** (*perfectoid-times-polydisc*)
Let `L` be a perfectoid field, `X = Spa(S, S⁺)` an affinoid perfectoid space over `L` and
`𝔹^n_L = Spa(L⟨T₁, …, Tₙ⟩, 𝒪_L⟨T⟩)`. Prove that the fibre product `X ×_L 𝔹^n_L` exists in adic
spaces and equals `Spa(S⟨T₁, …, Tₙ⟩, S⁺⟨T₁, …, Tₙ⟩)`, which is a sousperfectoid affinoid adic space
(BHW §3.1, proof of Cor. 3.4, p. 1725 (the perfectoid-times-polydisc step); Berkeley Lecture 6,
§6.3, Prop. 6.3.3(3), p. 47), and that for `n ≥ 1` and `S ≠ 0`, `S⟨T₁, …, Tₙ⟩` is not perfectoid
(proved here: `T₁` is not a `p`-th power in `S°⟨T⟩/ϖ` for nonzero `S`, the argument of the
`ℚ_p⟨T⟩` non-example of *sousperfectoid-ring*; Berkeley Lecture 6, §6.3, Ex. 6.3.2(2), p. 47, for
`ℚ_p⟨T⟩`).
Thus `ℚ_p^cycl⟨T⟩` is sousperfectoid and not perfectoid, its perfectoid cover
`ℚ_p^cycl⟨T^{1/p^∞}⟩` being a frame; and a smooth weight disc times a nonempty perfectoid space is not
perfectoid. *Needs:* *sousperfectoid-rings*; *sousperfectoid-sheafy*;
*completed-tensor-restricted-power-series*, *affinoid-fibre-product* (AdicSpacesPartII layer R0); PerfectoidSpaces P1.1, P1.10 and P2.9; Tau Ceti
`ValuationSpectrum.mem_iff_forall_vle_one`, `Huber.restrictedMvPowerSeriesCompletion`.
Lean: `Huber.not_isPerfectoidTateRing_restrictedMvPowerSeries`.

**The product `X ×_L Y` of a perfectoid space and a smooth rigid space.** (*perfectoid-times-smooth-fibre-product*) Let `L` be a perfectoid field, `L'` a perfectoid field
extension of `L` (complete, with `L → L'` continuous; BHW take `L` a perfectoid extension of
`ℚ_p^cyc`, and their printed hypothesis "a perfectoid extension of `L'/L`" means "a perfectoid
extension `L'` of `L`"), `X` a perfectoid space over `L`, arbitrary, and `Y` a rigid space over
`L'` (an adic space locally of topologically finite type over `Spa(L', 𝒪_{L'})`) that is smooth over
`L'` (*smooth-morphism*, AdicSpacesPartII layer R0), so locally étale over polydiscs. Then the fibre product
`X ×_L Y := X ×_{Spa(L, 𝒪_L)} Y` exists in the category of adic spaces and is a sousperfectoid adic
space. Construction: `X ×_L Y = X' ×_{L'} Y` with `X' = X ×_L Spa(L', 𝒪_{L'})` perfectoid; for
affinoid perfectoid `X' = Spa(S, S⁺)` and an open `V' ⊆ Y` with an étale map `h : V' → 𝔹^n_{L'}`
(Huber 1.6.10), `X' ×_{L'} V' = (X' ×_{L'} 𝔹^n_{L'}) ×_{𝔹^n_{L'}} V'` with
`X' ×_{L'} 𝔹^n = Spa(S⟨T₁, …, Tₙ⟩, S⁺⟨T⟩)`; these pieces glue. It is not asserted, and is false in
general, that `X ×_L Y` is perfectoid. Define the adic
space `X ×_L Y` for `X` perfectoid over `L` and `Y` smooth rigid over a perfectoid extension `L'` of
`L`, with its projections `fst` to `X` and `snd` to
`Y`; prove that the square with `fst`, `snd` over
`Spa L` is a pullback in adic spaces; construct the lift of a pair of maps
`T → X`, `T → Y` agreeing over `Spa L`, with its two composition equations and uniqueness;
prove that `X ×_L Y` is a sousperfectoid adic space,
the base change isomorphism `X ×_L Y ≅ (X ×_L Spa L') ×_{L'} Y`,
the polydisc chart (over affinoid perfectoid `Spa(S, S⁺)` and an étale chart
`h : V' → 𝔹^n`, the piece is `(Spa S⟨T⟩) ×_{𝔹^n} V'` with the affinoid formula of
*sousperfectoid-etale-base-change*), functoriality in `X`, for maps of
perfectoid spaces over `L`, and in `Y`, for maps of smooth rigid spaces over `L'`, with
compatibility with identities and composition, the restriction isomorphism (for opens `V ⊆ X`,
`W ⊆ Y`, `V ×_L W` is the open
subspace `fst^{-1}V ∩ snd^{-1}W`) and the sections over affinoids (for affinoid
perfectoid `V = Spa(S, S⁺)` and an affinoid open `U' = Spa(B, B⁺) ⊆ Y` that is a chart: `B` obtained by a finite
composite of rational localisations and finite étale extensions from `L'⟨T₁, …, Tₙ⟩`, so that `S ⊗̂_L B` is sousperfectoid by
*sousperfectoid-rational-localisation* and *sousperfectoid-finite-etale* — `V ×_L U'` is the
affinoid `Spa(S ⊗̂_L B)`, `𝒪(V ×_L U') = S ⊗̂_L B`, and the plus ring is the completed integral
closure; every affinoid open of `Y` is covered by finitely many rational subsets that are charts,
by Huber 1.6.10 and the local structure of étale maps, and for an affinoid open `U'` that is not a
chart only this is asserted: `V ×_L U'` is quasi-compact, covered by the finitely many affinoids
`V ×_L U'_j`, and whether `S ⊗̂_L B` is sheafy, hence whether `V ×_L U'` is affinoid, is not
claimed) (BHW §3.1, Cor. 3.4, p. 1724; BHW §3.1, proof of Cor. 3.4,
p. 1724 (local structure of smooth rigid spaces, Huber 1.6.10; reduction to `L = L'` and affinoid
perfectoid `X`); BHW §3.1, proof of Cor. 3.4, p. 1725 (the perfectoid-times-polydisc step and the
étale step); Huber96 §1.6, Cor. 1.6.10, p. 80 (smooth rigid spaces are locally étale over
polydiscs); BHW §1.5, Notation, p. 1720 (rigid spaces over `L` are adic spaces locally of
topologically finite type)). For `Y = Spa L'`, `X ×_L Spa L'` is the perfectoid fibre product; for
`Y = 𝔹¹_{L'}`, after base extension `X' = X ×_L Spa L'` and restriction to a nonempty
`Spa(S,S⁺) ⊆ X'`, the product is `Spa(S⟨T⟩)`, sousperfectoid and not perfectoid; and by BHW
Corollary 3.5, for `U` smooth over `L`, the anticanonical tower `X*_{Γ(p^∞)}(ε)_a` of BHW §3 times `U` exists as a sousperfectoid adic
space. *Needs:* *perfectoid-times-polydisc*; *sousperfectoid-etale-base-change*;
*sousperfectoid-adic-space*; *smooth-local-structure*, *smooth-morphism*,
*affinoid-fibre-product* (AdicSpacesPartII layer R0); PerfectoidSpaces P1.10 and P2.10; the local completed-tensor and gluing argument of BHW Corollary 3.4.
Lean: `AdicSpace.perfectoidTimesSmooth_exists`.

**Checks.**

- Degenerate: for `Y = Spa(L', 𝒪_{L'})`, `X ×_L Y` is the
  perfectoid fibre product `X ×_L Spa L'` of PerfectoidSpaces layer P2, and for `L' = L` it is `X`.
- Computation: for `X = Spa(S, S⁺)` affinoid perfectoid
  over `L` and `Y = 𝔹^n_L`, `X ×_L Y = Spa(S⟨T₁, …, Tₙ⟩, S⁺⟨T⟩)` with `𝒪(X ×_L Y) = S⟨T⟩`.
- Non-example: for `X = Spa(L, 𝒪_L)` and
  `Y = 𝔹¹_L`, `X ×_L Y = 𝔹¹_L = Spa(L⟨T⟩)` is not a perfectoid space
  (*perfectoid-times-polydisc*): a definition of the product inside the category of perfectoid
  spaces fails.
- Characterisation: for every affinoid field `(C, C⁺)` over
  `L'`, `(X ×_L Y)(C, C⁺) = X(C, C⁺) ×_{Spa(L)(C, C⁺)} Y(C, C⁺)`: the universal property tested on
  points.
- Compatibility: for affinoid perfectoid
  `V = Spa(S, S⁺) ⊆ X` and a chart `U' = Spa(B, B⁺) ⊆ Y` (`B` finite étale over a rational
  localisation of `L'⟨T⟩`), `V ×_L U'` is affinoid with `𝒪(V ×_L U') = S ⊗̂_L B`, the completed
  tensor product of *completed-tensor-product* (AdicSpacesPartII layer R0); for `B = L'⟨T⟩` this is
  the polydisc computation above, and for `B = L'⟨T, p/T⟩` it is `S⟨T, p/T⟩`.
- Degenerate: for `X = ∅` (equivalently `S = 0`),
  `X ×_L Y = ∅`, and for `Y = ∅`, `X ×_L Y = ∅`; both are sousperfectoid (empty cover).

`AdicSpace.perfectoidTimesSmooth_exists` states existence as an A1 `FibreProduct`
(`TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.FibreProduct`),
whose fields include both projections and the limiting cone, together with the
sousperfectoid conclusion. It takes the two perfectoid base fields, their continuous
pair homomorphism, a perfectoid affinoid cover of `X`, and the smooth map from `Y`.
The field-point, empty-factor, and field-valued-point Checks apply to these actual
fibre-product structures.

**Products with a smooth space preserve tilde-limits.** (*perfectoid-times-smooth-tilde-limit*)
For a perfectoid field `L`, an inverse system `(X_n)_{n ≥ 1}` of quasi-compact quasi-separated adic
spaces over `L` with adic transition maps, a quasi-compact quasi-separated perfectoid space `X_∞`
over `L` with `X_∞ ∼ lim_n X_n` (*tilde-limits-affinoid-criterion*), and a quasi-compact
quasi-separated rigid space `U` smooth over `L` such that each `X_n ×_L U` exists as an adic space,
the relation `X_∞ ×_L U ∼ lim_n X_n ×_L U` for the product of
*perfectoid-times-smooth-fibre-product* is the corollary of *tilde-limit-base-change* with
`f = X_1 ×_L U → X_1` (locally of weakly finite type, as a base change of the smooth `U → Spa L`,
*perfectoid-times-smooth-fibre-product*); for `U` not quasi-compact it holds with `U` replaced by
any quasi-compact open `U' ⊆ U` (BHW §3.1, Cor. 3.5, p. 1725; Huber96 §2.4, Rem. 2.4.3(ii),
p. 126). BHW Corollary 3.5 is the case `X*_{Γ(p^∞)}(ε)_a ×_L U ∼ lim_n X*_{Γ(p^n)}(ε)_a ×_L U`; for
`U = Spa L` the statement is the hypothesis. *Needs:* *perfectoid-times-smooth-fibre-product*;
*tilde-limit-base-change*; *tilde-limits-affinoid-criterion*.

### R5.6 coefficient algebras

The low-level inverse limit `mixedTensorInt` is defined for arbitrary modules over a commutative
ring, and `mixedTensorOfLattice` localizes any submodule at the powers of a chosen scalar.
The Banach-space construction `V ⊗̂ M`, specified in this README only, chooses an open bounded
lattice when one exists and otherwise uses the zero
submodule. Its Banach-space API assumes such a lattice exists and that the scalar acts
bijectively. The bounded-family and one-factor equivalences additionally assume a compact
Hausdorff topological DVR and an irreducible uniformizer; the lattice is adically complete.
The ring structure assumes a bounded open subalgebra, invertibility of the scalar on the
Banach algebra, and a coefficient algebra whose topology has a basis of open ideals.


**Profinite flat modules over the ring of integers of a `p`-adic field.** (*profinite-flat-module*)
Let `E` be a finite extension of `ℚ_p` and `𝒪 = 𝒪_E`, a complete discrete valuation ring with
finite residue field, with uniformizer `ϖ`. A topological `𝒪`-module `M` has a topological additive group and jointly continuous scalar
action. It is linear-topological if
`0` has a basis of neighbourhoods consisting of `𝒪`-submodules (Mathlib `IsLinearTopology 𝒪 M`), and
`M` is a profinite flat `𝒪`-module if it is flat over `𝒪` (equivalently `ϖ`-torsion-free),
linear-topological, compact and Hausdorff (CHJ Definition 6.1; CHJ's "compact" includes Hausdorff).
Then the topology of `M` is profinite, every open submodule has finite index, and `M` is
`ϖ`-adically complete and separated. The compact part is Tau Ceti's `IsCompactModule`, which
supplies the Hausdorff property (`IsCompactModule.t2Space`) and the linear topology
(`IsCompactModule.isLinearTopology`, Mathlib's `IsLinearTopology`); this target adds only
flatness over `𝒪`. The Lean
form is stated for any discrete valuation ring `O` carrying a compact Hausdorff ring topology
(which forces the `𝔪`-adic topology, completeness and a finite residue field), so it covers
`𝒪_E` for `E/ℚ_p` finite — the only case the sources use — and also `𝔽_q[[t]]`; all module statements below use this complete-DVR generality; the Banach constructions use
a uniformizer `ϖ` and the fraction field `E`. CHJ supplies the mixed-characteristic case,
and the same finite-quotient and product proof gives the equal-characteristic case. In `Huber`,
define the structure `IsProfiniteFlat` (`M` is a Tau Ceti `IsCompactModule` — compact, totally
disconnected, with continuous scalar action, hence Hausdorff and linear-topological — and flat);
prove that `∏_{i∈I} 𝒪` is profinite flat, `IsProfiniteFlat.iff_exists_pseudobasis` (every
profinite flat `M` is isomorphic to `∏_I 𝒪`, *profinite-flat-pseudobasis*),
that open submodules have finite index,
`IsProfiniteFlat.isAdicComplete` (`M` is `ϖ`-adically complete and separated, Mathlib
`IsAdicComplete`), that closed submodules of profinite flat modules
are profinite flat, and `IsSmallZpAlgebra.isProfiniteFlat` (small `ℤ_p`-algebras are profinite flat
`ℤ_p`-modules, *small-coefficient-algebra*) (CHJ §6.1, Def. 6.1(2), p. 46; CHJ §6.1, Def. 6.1(1),
p. 46 (linear topologies); CHJ §6.1, Prop. 6.2, p. 46 (the structure theorem `M ≅ ∏_I 𝒪` with the
product topology)). `∏_{i∈I} 𝒪` with the product topology is profinite flat for every set `I`, and
`ℤ_p[[T]]` with the `(p, T)`-adic topology is a profinite flat `ℤ_p`-module with pseudobasis
`(T^n)`. *Needs:* Tau Ceti `IsCompactModule`, `IsCompactModule.t2Space`,
`IsCompactModule.isLinearTopology`; Mathlib `Module.Flat`, `IsLinearTopology`, `CompactSpace`,
`T2Space`, `IsAdicComplete`. Lean: `Huber.IsProfiniteFlat`, `Huber.IsProfiniteFlat.isAdicComplete`.

**Checks.**

- Computation: `ℤ_p[[T₁, …, T_d]]` with its
  `(p, T₁, …, T_d)`-adic topology, which is the coefficientwise topology, is a profinite flat
  `ℤ_p`-module (Lean `example`).
- Degenerate: `0` and `𝒪` (with the `ϖ`-adic topology) are
  profinite flat `𝒪`-modules.
- Non-example: `𝒪/ϖ` (finite, discrete) is compact and
  linear-topological but not flat, so not profinite flat; `𝒪` with the discrete topology is flat but
  not compact.
- Non-example: `E` itself is flat and linear-topological but not
  compact, so not profinite flat.
- Non-example: `𝒪` with the indiscrete topology is flat,
  compact and linear-topological (the only neighbourhood of `0` is `𝒪`) but not Hausdorff, so it is
  not profinite flat; it is not isomorphic to `∏_I 𝒪` for any `I`, so a definition without T2 would
  falsify the pseudobasis theorem (Lean `example` for `𝒪 = ℤ_p`).

**Pseudobases of profinite flat modules.** (*profinite-flat-pseudobasis*) Let `𝒪` be a complete DVR
with finite residue field. Prove that a topological `𝒪`-module `M` is profinite flat if and only if
it is isomorphic, as a topological `𝒪`-module, to `∏_{i∈I} 𝒪` with the product topology for some
set `I`, taken in the universe of `M` (with an index type in an unrelated universe the equivalence
fails for large `M`). A family `(e_i)_{i∈I}` realising such an isomorphism is a pseudobasis; the submodules
`M_{J,n} = ∏_{i∈J} ϖ^n 𝒪 e_i × ∏_{i∉J} 𝒪 e_i` (`J` finite, `n ≥ 1`) form a basis of
neighbourhoods of `0` (CHJ §6.1, Prop. 6.2, p. 46; CHJ §6.1, before Prop. 6.2, p. 46 (the structure
theorem is imported from SGA 3)). `M = 𝒪[[T]]` has pseudobasis `(T^n)_n`, and `M = 𝒪^n` has a
finite pseudobasis, and `0` has the empty pseudobasis. *Needs:* *profinite-flat-module*; Mathlib `Module.Flat`, `Profinite`.
Lean: `Huber.IsProfiniteFlat.iff_exists_pseudobasis`.

**Small `ℤ_p`-algebras.** (*small-coefficient-algebra*) A small `ℤ_p`-algebra (CHJ §1.4) is a ring
`R` that is reduced, `p`-torsion-free and finite as an algebra over `ℤ_p[[X₁, …, X_d]]` for some
`d ≥ 0`; `d` is unspecified, and all constructions are independent of the choice of `d` and of the
ideal of definition. It carries its canonical adic profinite topology (the `𝔞`-adic topology for an
ideal of definition `𝔞`, for example the Jacobson radical, independent of choices), for which it is
a profinite flat `ℤ_p`-module (*profinite-flat-module*) and a noetherian semilocal ring, complete
for its `p`-adic topology. In `Huber`, define the structure `IsSmallZpAlgebra` (reduced,
`p`-torsion-free, finite over some `ℤ_p[[X₁, …, X_d]]`) and `IsSmallZpAlgebra.topology` (the
canonical adic profinite topology); prove `IsSmallZpAlgebra.isNoetherianRing` (small algebras are
noetherian), `IsSmallZpAlgebra.isProfiniteFlat` (small algebras are profinite flat `ℤ_p`-modules
and `p`-adically complete), and that
`R/I` is small when it is reduced and `p`-torsion-free, for example
`I` prime with `p ∉ I`
(CHJ §1.4, p. 7 (small `ℤ_p`-algebras; topology of small algebras)). The weight-space algebra
`ℤ_p[[ℤ_p^×]]` is small; for `p` odd it is `≅ ∏_{p−1} ℤ_p[[T]]`, and for `p = 2` it is
`ℤ_2[x]/(x²−1)[[T]]`, reduced and not a product; `ℤ_p` is small with `d = 0`. *Needs:*
*profinite-flat-module*; Mathlib `IsAdicComplete`, `Module.Finite`. Lean: `Huber.IsSmallZpAlgebra`,
`Huber.IsSmallZpAlgebra.topology`, `Huber.IsSmallZpAlgebra.isNoetherianRing`,
`Huber.IsSmallZpAlgebra.isProfiniteFlat`.

**Checks.**

- Computation: `ℤ_p[[ℤ_p^×]]` (the completed group ring) is a
  small `ℤ_p`-algebra, finite over `ℤ_p[[T]]` via `1 + p ↦ 1 + T` for `p` odd.
- Degenerate: `ℤ_p` is small (`d = 0`; Lean `example`, with the last non-example below).
- Non-example: `ℤ_p[[T]]/(T²)` is `p`-torsion-free and finite
  over `ℤ_p[[T]]` but not reduced, so not small (Lean `example`).
- Non-example: `𝔽_p[[T]]` is reduced and finite over `ℤ_p[[T]]` but
  has `p`-torsion, so not small.
- Non-example: `ℚ_p` is reduced and `p`-torsion-free but not
  small: a nonzero finite module `M` over the local ring `ℤ_p[[X₁, …, X_d]]` has `pM ≠ M` by
  Nakayama, while `pℚ_p = ℚ_p`.

**The mixed completed tensor product `V ⊗̂ M`.** (*mixed-completed-tensor*) Let `E` be a finite
extension of `ℚ_p` with `𝒪 = 𝒪_E`, `ϖ` a uniformizer, and `M` a profinite flat `𝒪`-module. For an
`𝒪`-module `X` define `X ⊗̂ M := lim_i (X ⊗_𝒪 M/I_i)`, the limit over any cofinal system `(I_i)` of
open `𝒪`-submodules of `M` (CHJ Definition 6.3; independent of the system). For an `E`-vector
space `V` with an `𝒪`-lattice `V° ⊆ V` (`V°[1/ϖ] = V`) define `V ⊗̂ M := (V° ⊗̂ M)[1/ϖ]` (CHJ
Definition 6.6); for non-Banach `V` the lattice is part of the data and affects the result. When
`V` is an `E`-Banach space, `V°` is always taken open and bounded, and `V ⊗̂ M` is then canonically
independent of `V°`. Suppose `V` is a Banach `E`-algebra and `M` carries an `𝒪`-algebra structure
for which `0` has a basis of open ideals — CHJ call this a "small `𝒪`-algebra" without defining it;
examples are a small `ℤ_p`-algebra when `E = ℚ_p`, or an `𝒪`-algebra that is reduced,
`ϖ`-torsion-free and finite over `𝒪[[X₁, …, X_d]]`. Then choosing `V°` an open bounded subring and
the `I_i` ideals makes `V ⊗̂ M` a ring. It is a Banach `E`-algebra with unit ball `V° ⊗̂ M`, and
with a pseudobasis `(e_i)` of `M` it is, as a Banach space, the space of bounded `I`-indexed
families in `V`. In `Huber`, define `mixedTensorInt` (`X ⊗̂ M := lim_i X ⊗_𝒪 M/I_i` for an
`𝒪`-module `X`), with its pure tensors `mixedTensorInt.tmul` and its functoriality
`mixedTensorInt.map` in the first factor, the open bounded lattices `IsOpenBoundedLattice`,
`mixedTensorOfLattice` (`V ⊗̂ M := (V° ⊗̂ M)[1/ϖ]` for a lattice `V°`),
the Banach construction (for a Banach `E`-space `V`, `V ⊗̂ M` with any open bounded lattice) and
its pure tensors (the canonical bilinear map `V × M → V ⊗̂ M`, `v ⊗ m`, and the map
`V ⊗_𝒪 M → V ⊗̂ M` from the algebraic tensor product; its image is dense for the coordinatewise (product) topology after
choosing a pseudobasis, and need not be dense for the Banach topology when `M` is not finitely generated:
`Σ_n X^n T^n ∈ ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]]` is at sup-distance `1` from the image, since the
`T^n`-coefficients of image elements lie in a finite-dimensional subspace `W`, while the
residue classes of the monomials `X^n` are linearly independent); prove the canonical isomorphism
between the
constructions for two open bounded lattices (for nested lattices `mixedTensorOfLattice.nonempty_equiv`,
*rational-integral-compatibility*),
the ring structure for `V` a Banach `E`-algebra, computed with an open
bounded subring `V°`, and `M` a profinite flat `𝒪`-algebra with a basis of open ideals,
the Banach `E`-space, or algebra, structure with unit ball `V° ⊗̂ M`,
the product formula (with a pseudobasis indexed by `I`, `V ⊗̂ M ≅` bounded families `I → V`;
integrally `mixedTensorInt.nonempty_piEquiv`,
*mixed-completed-tensor-product-formula*), functoriality in continuous
`𝒪`-linear maps of `V`, bounded, and of `M`, continuous, compatible with identities and composition,
`V ⊗̂ 𝒪 ≅ V`, and finite projective base change
(*mixed-tensor-finite-projective-base-change*) (CHJ §6.1, Def. 6.3, p. 46 (the integral mixed
completed tensor product; independence of the neighbourhood system); CHJ §6.1, after Def. 6.3, p. 46
(the ring structure when the coefficient module is a small algebra); CHJ §6.1, Def. 6.6, p. 47 (the
rational mixed completed tensor product `V ⊗̂ M := (V° ⊗̂ M)[1/ϖ]`); CHJ §6.1, after Def. 6.6, p. 47
(Banach case: open bounded lattice, independent of the choice); CHJ §6.1, before Def. 6.6, p. 47
(independence of the unit ball)). `ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]] = (ℤ_p⟨X⟩[[T]])[1/p]` (CHJ, proof of
Lemma 6.13(1)), and `V ⊗̂ 𝒪 = V`. When `V°` is a `ϖ`-adically complete `𝒪`-algebra and `M` a
small `𝒪`-algebra, both adic rings with finitely generated ideals of definition, `V° ⊗̂ M` is the
completed tensor product of adic rings `V° ⊗̂_𝒪 M` of *completed-tensor-product-adic* (AdicSpacesPartIII layer F0),
the adic case of *completed-tensor-product* (AdicSpacesPartII layer R0); the construction here is the one for a
profinite flat module `M` without ring structure. *Needs:* *profinite-flat-module*;
*small-coefficient-algebra*; *completed-tensor-product-adic* (AdicSpacesPartIII layer F0);
Mathlib `TensorProduct`, `IsAdicComplete`. Lean: `Huber.IsOpenBoundedLattice`, `Huber.mixedTensorInt`,
`Huber.mixedTensorInt.tmul`, `Huber.mixedTensorInt.map`, `Huber.mixedTensorOfLattice`; the
Banach, ring and functoriality structures of the rational construction are specified in this README
only.

**Checks.**

- Computation:
  `ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]] ≅ (ℤ_p⟨X⟩[[T]])[1/p]`: power series `Σ f_n T^n` with `f_n ∈ ℚ_p⟨X⟩` uniformly
  bounded. The equivalence sends `(x ⊗ f)/d` to `C(x)·f/d`, with the coefficients
  of `f` included in `ℤ_p⟨X⟩`, for every denominator `d = p^k`.
- Non-example: the algebraic tensor product
  `ℚ_p⟨X⟩ ⊗_{ℤ_p} ℤ_p[[T]] → ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]]` is not surjective: `Σ_n X^n T^n` is not in the
  image, the `T^n`-coefficients of an element of the image lying in a finite-dimensional subspace of
  `ℚ_p⟨X⟩`.
- Non-example: for `V = ℚ_p⟨X, Q⟩/(Q²)` and the unbounded
  lattice `V°` = power-bounded elements `= ℤ_p⟨X⟩ + ℚ_p⟨X⟩Q`, `(V° ⊗̂ ℤ_p)[1/p] = ℚ_p⟨X⟩ ≠ V`: the
  canonical map kills the nonzero element `Q`: `mk(Q ⊗ 1) = 0`. The comparison
  sends `mk(v ⊗ a)` to `a·v₀`, `v₀` the `ℚ_p⟨X⟩`-component of `v = v₀ + v₁Q`, so it retains the
  constant component and loses
  the nilpotent component. This kernel distinguishes it from the identity on `V`
  (CHJ Definition 6.6, p. 47; HK Example 6.10, pp. 18–19).
- Degenerate: `V ⊗̂ 𝒪 = V` canonically (pseudobasis with one element).
- Compatibility: if `M ≅ 𝒪^n` then
  `V ⊗̂ M ≅ V ⊗_𝒪 M` (Mathlib `TensorProduct`) `≅ V^n`; the equivalence sends
  the pure tensor `v ⊗ m` of `V ⊗̂ M` to the algebraic tensor `v ⊗ m`, including ranks zero,
  one and two (CHJ Proposition 6.4 and Definition 6.6, pp. 46–47).

**The product formula `X ⊗̂ M ≅ ∏_I X̂`.** (*mixed-completed-tensor-product-formula*) Let `M` be
profinite flat with pseudobasis `(e_i)_{i∈I}` (*profinite-flat-pseudobasis*). Prove that the
functor `X ↦ X ⊗̂ M` on `𝒪`-modules is isomorphic to `X ↦ ∏_{i∈I} X̂`, where `X̂ = lim_n X/ϖ^n X`
is the `ϖ`-adic completion, and that for a Banach space `V` with open bounded lattice `V°`, `V ⊗̂ M`
is the space of bounded families `(v_i)_{i∈I}` in `V` with the sup norm (CHJ §6.1, Prop. 6.4, p. 46
(the product formula; `X̂` is the `ϖ`-adic completion)). For `M = 𝒪[[T]]` and `X = 𝒪⟨Y⟩`,
`X ⊗̂ M = 𝒪⟨Y⟩[[T]]`; for `I` finite the formula is `X̂^I`. *Needs:* *profinite-flat-pseudobasis*;
*mixed-completed-tensor*; Mathlib `AdicCompletion`. Lean: `Huber.mixedTensorInt.nonempty_piEquiv`
(the integral formula, with `x ⊗ m ↦ (e(m)_i x)_i`).

**Exactness of `− ⊗̂ M`.** (*mixed-completed-tensor-exactness*) Let `M` be profinite flat. Prove
(1) that `X ↦ X ⊗̂ M` is exact on short exact sequences of `ϖ`-adically complete (and separated)
`𝒪`-modules, and (2) that if `0 → X → Y → Q → 0` is exact, `X` is `ϖ`-adically complete and
`ϖ^N Q = 0` for some `N`, then `Y` is `ϖ`-adically complete and
`(X ⊗̂ M)[1/ϖ] → (Y ⊗̂ M)[1/ϖ]` is an isomorphism (CHJ §6.1, Cor. 6.5(1), p. 47 (exactness on
`ϖ`-adically complete modules); CHJ §6.1, Cor. 6.5(2), p. 47 (rational invariance under
bounded-torsion changes of lattice)). Two open bounded lattices `V₀° ⊆ V₁°` of a space on which
`ϖ` acts bijectively, with the smaller lattice `V₀°` `ϖ`-adically complete (the setting of CHJ
Cor. 6.5(2)), give
the same `V ⊗̂ M`, compatibly with pure tensors; for the non-complete `X = ⊕_ℕ 𝒪` the functor is not `∏_I X`. *Needs:*
*mixed-completed-tensor-product-formula*; *mixed-completed-tensor*; Mathlib `IsAdicComplete`.
Lean: `Huber.mixedTensorInt.exact_of_isAdicComplete`, `Huber.mixedTensorOfLattice.nonempty_equiv`.

**Rational and integral coefficient sheaves agree on reduced affinoids:
`𝒪_X ⊗̂ M = (𝒪_X⁺ ⊗̂ M)[1/ϖ]`.** (*rational-integral-compatibility*) Let `K` be a complete
nonarchimedean field containing `E`, `X = Spa(A, A°)` a reduced affinoid rigid space over `K` —
reduced so that `𝒪_X(U)` is uniform and `𝒪_X(U)°` is bounded for all rational `U`, and rigid
meaning `A⁺ = A°`, so that `𝒪_X⁺(U) = 𝒪_X(U)°` — and `M` a profinite flat `𝒪_E`-module. Prove
that for every rational subset `U ⊆ X`, `𝒪_X⁺(U) = 𝒪_X(U)°` is an open bounded lattice of the
Banach space `𝒪_X(U)`, and the natural map `(𝒪_X⁺(U) ⊗̂ M)[1/ϖ] → 𝒪_X(U) ⊗̂ M` is an isomorphism,
compatible with restriction; more generally any two open bounded lattices give canonically
isomorphic `V ⊗̂ M`. The presheaf `U ↦ 𝒪_X⁺(U) ⊗̂ M ≅ ∏_I 𝒪_X⁺(U)` is a sheaf on the rational
subsets of `X`. For non-reduced `X` the power-bounded lattice is unbounded and the formula fails
(CHJ §6.1, Cor. 6.5(2), p. 47; CHJ §6.1, after Def. 6.6, p. 47; CHJ §6.1, before Def. 6.6, p. 47;
CHJ §6.3, after Lem. 6.13, p. 51 (the unit ball chosen in §6.3)). For `X` the closed disc over
`ℚ_p`, `(ℤ_p⟨T⟩ ⊗̂ ℤ_p[[S]])[1/p] = ℚ_p⟨T⟩ ⊗̂ ℤ_p[[S]]`; for `X = Spa(ℚ_p⟨X, Q⟩/(Q²))`,
`(𝒪⁺(X) ⊗̂ ℤ_p)[1/p] = ℚ_p⟨X⟩ ≠ 𝒪(X)`, the unbounded-lattice Check of *mixed-completed-tensor*. *Needs:*
*mixed-completed-tensor*; *mixed-completed-tensor-exactness*;
*mixed-completed-tensor-product-formula*; RigidAnalyticGeometry §4.4.4
(reducedness on rational subdomains);
*reduced-affinoid-supremum-norm* (AdicSpacesPartII layer R0); Tau Ceti `Huber.powerBoundedSubring`.

For a rational `U`, put `(B, B⁺) = (𝒪_X(U), 𝒪_X⁺(U))`; the complete rational
localisation is identified with the rigid subdomain algebra
(AdicSpacesPartII R1.1 *affinoid-subdomain*), to apply RigidAnalyticGeometry §4.4.4.
The plus-ring comparison uses Tau Ceti's `completedPlusSubring_le_powerBoundedSubring` for
`B⁺ ⊆ B°`; prove the reverse inclusion using
`mem_completedPlusSubring_iff_forall_mem_rationalSubset_vle_one` and the integrality of
power-bounded elements over the rational plus-ring generators
(KL15 §2.5, Lemma 2.5.9(d), p. 49).
**Check:** for `A = K⟨x⟩`, `A⁺ = A°` and `U = {|x| ≤ |a|}` with `0 < |a| < 1`, the
actual completed plus ring is `B⁺ = O_K⟨x/a⟩ = B°` in `B = K⟨x/a⟩`.

The named general target above uses `E`, `𝒪_E`, and `ϖ` as specified. Its `E = ℚ_p`
specialization is a linear equivalence in which `V` is a uniform Tate
`ℚ_p`-algebra with continuous structure map and the compatible `ℤ_p`-action, and `M` is a
profinite flat `ℤ_p`-module. An arbitrary Tate `ℤ_p`-algebra is insufficient: in characteristic
`p`, localization at `p` is zero even when `V` is nonzero.
The ring-level module comparison holds for any compact
Hausdorff topological DVR `O`, an irreducible `ϖ`, its fraction field `E`, a uniform Tate
`E`-algebra `V` with continuous `O`-structure map, and a profinite flat `O`-module `M`.
Its equivalence is continuous in both directions and sends the localized integral pure
tensor of `v ∈ V°` and `m` to `v⊗m`. Compatibility across rational opens remains part
of the sheaf-level target above.

**Finite projective base change of mixed tensors.** (*mixed-tensor-finite-projective-base-change*)
Let `S` be a Banach `E`-algebra, `V` a finite projective `S`-module (not merely finite) with its
natural Banach topology, `U` a Banach `S`-module and `M` a profinite flat `𝒪_E`-module. Prove that
the natural map `V ⊗_S (U ⊗̂ M) → (V ⊗_S U) ⊗̂ M` is an isomorphism, and that if `V` and `U` are
Banach `S`-algebras and `M` is an `𝒪_E`-algebra whose topology has a basis of open ideals (CHJ's
"small `𝒪_K`-algebra", for example a small `ℤ_p`-algebra when `E = ℚ_p`), it is a ring isomorphism
(CHJ §6.1, Lem. 6.7, p. 47 (the module statement; the ring version)). For `V = S^n`,
`S^n ⊗_S (U ⊗̂ M) = (U ⊗̂ M)^n`; for a finite étale `S → S'` (for example `𝒪(U) → 𝒪(U_n)` at a
finite level of a tower), `S' ⊗_S (𝒪(U) ⊗̂ R) = 𝒪(U_n) ⊗̂ R`. *Needs:* *mixed-completed-tensor*;
Mathlib `Module.Projective`, `TensorProduct`.

### R5.7 coefficient sheaves

**The coefficient sheaf `ℛ = 𝒪_X ⊗̂ R` on an affinoid rigid space.** (*completed-coefficient-sheaf*)
Let `K` be a complete nonarchimedean field extension of `ℚ_p` (characteristic `0` alone is not
enough), `X = Spa(A, A°)` an affinoid rigid space over `K` (quasi-compact quasi-separated `X` by
gluing on finite covers) and `R` a small `ℤ_p`-algebra (*small-coefficient-algebra*). On the site
of rational subsets of `X` with finite rational covers, define `ℛ(U) := 𝒪_X(U) ⊗̂ R`. This is the
mixed completed tensor over `ℤ_p` of *mixed-completed-tensor*, computed with an open bounded subring
of the Banach `ℚ_p`-algebra `𝒪_X(U)`; by lattice independence the result does not depend on that
choice. Restriction maps are induced by those of `𝒪_X`, which are bounded. Each `ℛ(U)` is a Banach
`K`-algebra and the restriction maps are continuous `K`-algebra maps, so `ℛ` is a presheaf of
Banach `K`-algebras on the rational site. That `ℛ` is a sheaf, with vanishing higher Čech
cohomology, is the separate theorem *coefficient-sheaf-tate-acyclicity*; it then extends to all
quasi-compact opens by finite covers. No discreteness of `K` is needed for the construction; it is
needed for noetherianity, flatness, `Loc` and Kiehl. When `X` is reduced the unit ball of `ℛ(U)`
can be taken to be `𝒪_X°(U) ⊗̂ R` (*rational-integral-compatibility*); for non-reduced `X` it
cannot (the unbounded-lattice Check of *mixed-completed-tensor*). In `RigidSpace.Coefficients`, define
the coefficient sheaf (`ℛ(U) = 𝒪_X(U) ⊗̂ R` on rational subsets), its unit ball (for
reduced `X`, the integral subsheaf `ℛ°(U) = 𝒪_X°(U) ⊗̂ R` with `ℛ = ℛ°[1/p]` on quasi-compact
opens) and its structure maps (`𝒪_X → ℛ`, `λ ↦ λ ⊗ 1`, and
`R → ℛ(U)`, the constant sections); prove that `ℛ` is a sheaf for finite
rational covers (from Tate acyclicity), that `ℛ(U) = 𝒪_X(U) ⊗̂ R`
holds definitionally on objects, that each `ℛ(U)` is a Banach `K`-algebra and the
restrictions are continuous, functoriality in `R`, for maps of small
algebras, and in `X`, for morphisms of affinoid rigid spaces, with preimages of rational subsets,
the product formula (with a pseudobasis of `R`, `ℛ(U) ≅` bounded `I`-families in `𝒪_X(U)`
as Banach spaces), that `ℛ(U)` is noetherian for `K` discretely valued
(*coefficient-sheaf-noetherian*), and that rational restriction maps
are flat for `K` discretely valued (*coefficient-sheaf-flat-restriction*) (CHJ §6.3, p. 50 (the
setting of §6.3; the coefficient sheaf `ℛ = 𝒪_X ⊗̂ R`); CHJ §6.3, after Lem. 6.13, p. 51 (the unit
ball chosen in §6.3)). For `R = ℤ_p`, `ℛ = 𝒪_X`; for `R = ℤ_p[[T]]` and `X` the closed unit disc
over `K`, `ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]`, the power series in `T` whose coefficients are uniformly
bounded elements of `K⟨Y⟩`. *Needs:* *mixed-completed-tensor*;
*mixed-completed-tensor-exactness*; *small-coefficient-algebra*;
*rational-integral-compatibility*; Tau Ceti `ValuationSpectrum.rationalSubset`.

**Checks.**

- Degenerate: for `R = ℤ_p`, `ℛ ≅ 𝒪_X` as presheaves of Banach
  `K`-algebras.
- Computation: for `K` discretely valued, `X` the
  closed unit disc and `R = ℤ_p[[T]]`: `ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]` and, on the rational subset
  `{|Y| ≤ |p|}`, `ℛ = 𝒪_K⟨Y/p⟩[[T]][1/p]`.
- Non-example: `ℛ(X)` is not
  `𝒪(X) ⊗_{ℤ_p} R`: for `X` the disc and `R = ℤ_p[[T]]`, `Σ Y^n T^n ∈ ℛ(X)` is not a finite sum of
  tensors (*mixed-completed-tensor*, its algebraic-span non-example).
- Compatibility: for an affinoid coefficient algebra `S`
  (reduced affinoid over `ℚ_p`) in place of `R`, `𝒪_X ⊗̂_{ℚ_p} S` on rational `U` is
  `𝒪(U ×_{ℚ_p} Spa S)`, the structure sheaf of the product rigid space
  (*affinoid-weight-coefficient-sheaf*).
- Non-example: for `X = Spa(K⟨Y, Q⟩/(Q²))` and `R = ℤ_p`,
  `ℛ(X) = 𝒪(X)` (computed with the bounded lattice `𝒪_K⟨Y, Q⟩/(Q²)`), whereas
  `(𝒪_X°(X) ⊗̂ ℤ_p)[1/p] = K⟨Y⟩`: a definition using the power-bounded elements as unit ball would
  give the wrong ring.

**The localisation functor `Loc` for `ℛ`-modules.** (*coefficient-sheaf-loc*) Let `X` be affinoid
rigid over a complete nonarchimedean extension `K` of `ℚ_p`, `R` small, `U ⊆ X` rational and `M` a
finitely generated `ℛ(U)`-module. `Loc(M)` is the presheaf of `ℛ|_U`-modules
`V ↦ ℛ(V) ⊗_{ℛ(U)} M` on rational `V ⊆ U`. If `K` is discretely valued: `Loc` is a fully faithful
exact functor from finitely generated `ℛ(U)`-modules to `ℛ`-modules on `U`, `Loc(M)` is a sheaf,
and `Ȟ^i(𝔘, Loc(M)) = 0 = H^i(U, Loc(M))` for `i ≥ 1` and every finite rational cover `𝔘`. If `K`
is not discretely valued, `Loc(M)` is still a sheaf with vanishing higher cohomology when `M` is
finitely generated projective. In `RigidSpace.Coefficients`, define `Loc` (`Loc(M)(V) = ℛ(V) ⊗_{ℛ(U)} M`)
as a functor on finitely generated `ℛ(U)`-modules, compatible with identities and composition;
prove the formula `Loc(M)(V) = ℛ(V) ⊗_{ℛ(U)} M`, that `Loc(M)` is a sheaf with
vanishing higher cohomology (for discrete `K` or `M` projective), that `Loc` is
fully faithful and exact for `K` discretely valued,
that `Γ(U, Loc M) = M`, and that `Loc(M)|_V = Loc(ℛ(V) ⊗_{ℛ(U)} M)` (CHJ §6.3, Def. 6.14,
p. 51 (the localisation functor); CHJ §6.3, Prop. 6.16, p. 52 (`Loc` is a full exact embedding; the
projective case without discreteness)). `Loc(ℛ(U)) = ℛ|_U`, and for the Laurent cover of the disc
and `M = ℛ(X)/(T)` with `R = ℤ_p[[T]]`, `Loc(M) = 𝒪_X`. *Needs:*
*coefficient-sheaf-tate-acyclicity*; *coefficient-sheaf-flat-restriction*;
*coefficient-sheaf-noetherian*; *completed-coefficient-sheaf*; Mathlib `Module.Flat`,
`Module.Projective`, `TensorProduct`.

**Checks.**

- Degenerate: `Loc(ℛ(U)^n) ≅ (ℛ|_U)^n`.
- Computation: for `R = ℤ_p[[T]]`, `K` discretely valued and
  `M = ℛ(U)/(T)`: `Loc(M)(V) = 𝒪_X(V)`. Its equivalence evaluates
  `(a ⊗ f) ⊗ [b ⊗ g]` as `f(0)g(0)·a·(b|_V)`. Thus `T` is killed, while
  constants and the geometric restriction are fixed (CHJ Definition 6.14, p. 51).
- Characterisation: for `K` discretely valued,
  `Hom(Loc M, Loc N) = Hom_{ℛ(U)}(M, N)` for finitely generated `M`, `N`.
- Compatibility: for `R = ℤ_p`, `ℛ = 𝒪_X` and `Loc(M)` is the
  associated module sheaf `M̃` of *associated-module-sheaf* (AdicSpacesPartIII layer R3),
  `M̃(V) = M ⊗_{𝒪(U)} 𝒪(V)`.

**Coherent `ℛ`-modules.** (*coefficient-sheaf-coherent-module*) Let `K` be a discretely valued
complete extension of `ℚ_p` (so that `Loc` is exact and fully faithful), `X` affinoid rigid over
`K`, `R` small. For a rational `U ⊆ X` and a finite rational cover `𝔘` of `U`, a sheaf `F` of
`ℛ|_U`-modules is `𝔘`-coherent if for every `U_i ∈ 𝔘` there is a finitely generated
`ℛ(U_i)`-module `M_i` with `F|_{U_i} ≅ Loc(M_i)`. `F` is coherent if it is `𝔘`-coherent for some
finite rational cover `𝔘`. `F` is locally projective if the `M_i` can be chosen projective. In
`RigidSpace.Coefficients`, define the predicates of coherence (`F` is `𝔘`-coherent for some finite
rational cover `𝔘`) and of local projectivity (`F` is `Loc` of projective modules on
some finite rational cover); prove that `Loc(M)` is coherent,
that kernels and cokernels of maps of coherent sheaves are coherent,
that restriction to rational subsets preserves coherence, and
that `F ≅ Loc(F(U))` when `R` is finite free over `ℤ_p`
(*coefficient-sheaf-kiehl* (a)) (CHJ §6.3, Def. 6.18,
p. 52 (coherent `ℛ`-modules; `𝔘`-coherent sheaves)). `Loc(M)` is coherent for every finitely
generated `M`. When `R` is finite free over `ℤ_p`, Kiehl's theorem identifies every coherent
`F` on `U` with `Loc(F(U))` (*coefficient-sheaf-kiehl* (a)). *Needs:* *coefficient-sheaf-loc*.

**Checks.**

- Degenerate: `Loc(M)` is coherent (trivial cover).
- Computation: on the disc with the Laurent cover
  `{|Y| ≤ |p|}`, `{|p| ≤ |Y|}`, gluing `ℛ|_{U₁}` and `ℛ|_{U₂}` along multiplication by a unit
  `u ∈ ℛ(U₁₂)^×` gives a sheaf `F` that is `𝔘`-coherent and locally projective of rank one, without
  using Kiehl; global generation for coefficient algebras with an infinite pseudobasis is not a
  target of this roadmap (*coefficient-sheaf-kiehl*).
- Non-example: the sheaf `⊕_{n ∈ ℕ} ℛ` (countable
  direct sum, sheafified) on nonempty `X` with `R ≠ 0` is not coherent: its stalk at any
  point has infinite rank over the nonzero coefficient stalk. On `X = ∅` or for `R = 0`,
  the same sheaf is zero and coherent.

**`ℛ(U)` is noetherian over a discretely valued base.** (*coefficient-sheaf-noetherian*) Let `K` be
a discretely valued complete extension of `ℚ_p` — discreteness is used for the noetherianity of
`𝒪_K⟨X⟩[[T]]` — `X` affinoid rigid over `K` and `R` a small `ℤ_p`-algebra. Prove that for every
rational `U ⊆ X`, `ℛ(U) = 𝒪_X(U) ⊗̂ R` is a noetherian ring (CHJ §6.3, Lem. 6.13, p. 50
(noetherianity and flatness of restriction); CHJ §6.3, proof of Lem. 6.13(1), p. 51 (noetherianity
of the presentation ring); CHJ §6.3, p. 50 (discreteness of `K` is used for flatness)). For `X` the
disc and `R = ℤ_p[[T]]`, `ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]` is noetherian; for `K = ℂ_p` the ring
`𝒪_{ℂ_p}[[T]][1/p]` is not known to be covered by this argument, so the hypothesis is used.
*Needs:* *completed-coefficient-sheaf*; *mixed-completed-tensor-product-formula*;
*mixed-completed-tensor-exactness*; *restricted-power-series-adic* (AdicSpacesPartIII layer F0); Mathlib
`IsNoetherianRing`, `MvPowerSeries.isNoetherianRing`, `IsLocalization.isNoetherianRing`,
`Ideal.Quotient.isNoetherianRing`; Tau Ceti `Huber.IsTateRing.isOpenMap`.

**Rational restriction maps of `ℛ` are flat.** (*coefficient-sheaf-flat-restriction*) Let `K` be a
discretely valued complete extension of `ℚ_p`, `X` affinoid rigid over `K`, `R` small. Prove that
for rational `V ⊆ U ⊆ X`, the restriction `ℛ(U) → ℛ(V)` is flat; no reducedness is needed once
an open bounded subring `A₀ ⊆ 𝒪_X(U)` (a presentation lattice, `𝒪_X°(U)` when `X` is reduced) is
used as the unit ball (CHJ §6.3, Lem. 6.13(2), pp. 50–51; CHJ §6.3, p. 50 (discreteness of `K` is
used for flatness)). The statement is flatness of the
ring homomorphism whose underlying map is the functoriality map of the mixed completed tensor
product applied to the continuous
`ℤ_p`-linear restriction `A → A⟨T/s⟩` and the identity on `R`, on every mixed tensor.
The restriction is the composite of `A → A[1/s]` with the map to its rational-localization
completion. Agreement on pure tensors alone need not determine this map when the
pseudobasis is infinite. For `U` the disc and `V = {|Y| ≤ |p|}`,
`𝒪_K⟨Y⟩[[T]][1/p] → 𝒪_K⟨Y/p⟩[[T]][1/p]` is flat; rational localisations of perfectoid algebras are
not flat in general (KL15 Rem. 2.7.1), and the flatness here uses noetherianity. *Needs:*
*coefficient-sheaf-noetherian*; *completed-coefficient-sheaf*;
*mixed-completed-tensor-product-formula*; *mixed-completed-tensor-exactness*; Mathlib
`Module.Flat`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`.

**Finite rational covers give faithfully flat maps.** (*coefficient-sheaf-faithfully-flat-cover*)
Let `K` be a discretely valued complete extension of `ℚ_p` (for the flatness of restrictions), `X`
affinoid rigid over `K`, `R` small, `U ⊆ X` rational and `(U_i)` a finite rational cover of `U`.
Prove (1) that every maximal ideal `𝔪` of `ℛ(U)` has residue field `ℛ(U)/𝔪` finite over `K` — for
a presentation lattice `A₀ ⊆ 𝒪_X(U)` (an open bounded subring, `𝒪_X°(U)` when `X` is reduced),
`ℛ(U) = (A₀ ⊗̂ R)[1/p]` and its maximal ideals are the closed points of Berthelot's generic fibre
`Spf(A₀ ⊗̂ R)^{rig}` (*berthelot-type-rig-functor-nonnoetherian-base*, AdicSpacesPartIII layer R2; de Jong 1995,
Lem. 7.1.9, for the finiteness of their residue fields), `A₀ ⊗̂ R` being a `p`-adically complete
noetherian ring finite over `A₀[[X₁, …, X_d]]` — and (2) that `ℛ(U) → ∏_i ℛ(U_i)` is faithfully
flat: it is flat by *coefficient-sheaf-flat-restriction*, and for `𝔪` as in (1) the kernel
`𝔫 = 𝔪 ∩ 𝒪_X(U)` is a maximal ideal of `𝒪_X(U)` with residue field `L' ⊆ ℛ(U)/𝔪` finite over
`K`, that is, a point `x ∈ U`, which lies in some `U_i`; since `𝒪_X(U)/𝔫 → 𝒪_X(U_i)/𝔫𝒪_X(U_i)` is
an isomorphism (the fibre of the rational inclusion `U_i ⊆ U` over `x` is `{x}`), the quotients
`ℛ(U)/𝔫ℛ(U) = L' ⊗̂ R[1/p] = ℛ(U_i)/𝔫ℛ(U_i)` agree by *mixed-completed-tensor-exactness* (2), so
`ℛ(U_i)/𝔪ℛ(U_i) = ℛ(U)/𝔪 ≠ 0` and `𝔪` is the contraction of a maximal ideal of `ℛ(U_i)`
(CHJ §6.3, Lem. 6.13(3), p. 50; CHJ §6.3, proof of Lem. 6.13(3), p. 51 (the faithful flatness
proof passes through Berthelot's generic fibre, which is (1) above)). For the Laurent cover
`{|Y| ≤ |p|}`, `{|p| ≤ |Y|}` of the closed disc and `R = ℤ_p[[T]]`, the maximal ideals of
`𝒪_K⟨Y⟩[[T]][1/p]` are the Galois orbits of points `(y, t)` with `|y| ≤ 1`, `|t| < 1` in `K̄`, and
each is the contraction of a maximal ideal of `𝒪_K⟨Y/p⟩[[T]][1/p]` (if `|y| ≤ |p|`) or of
`𝒪_K⟨Y, p/Y⟩[[T]][1/p]` (if `|y| ≥ |p|`). For the cover of `U` by itself the statement is the
identity; for `U = ∅` both rings are `0` and `0 → 0` is faithfully flat.
*Needs:* *coefficient-sheaf-flat-restriction*; *coefficient-sheaf-tate-acyclicity*;
*completed-coefficient-sheaf*; *mixed-completed-tensor-exactness*; *coefficient-sheaf-noetherian*;
*berthelot-type-rig-functor-nonnoetherian-base* (AdicSpacesPartIII layer R2); Mathlib `Module.Flat`,
`Module.FaithfullyFlat`, `Module.FaithfullyFlat.of_comap_surjective`.

**Tate acyclicity for the coefficient sheaf.** (*coefficient-sheaf-tate-acyclicity*) Let `K` be a
complete nonarchimedean extension of `ℚ_p`, not necessarily discretely valued, `X` affinoid rigid
over `K` and `R` small. Prove that for every rational `U ⊆ X` and every finite rational cover `𝔘`
of `U`, the augmented Čech complex

```text
0 → ℛ(U) → ∏ ℛ(U_i) → ∏ ℛ(U_i ∩ U_j) → ⋯
```

is exact; consequently `ℛ` is a sheaf on the rational site and `H^i(U, ℛ) = 0` for `i ≥ 1`. The
unit balls are open bounded lattices compatible with the restriction maps on the finite Čech nerve:
for reduced `X`, `𝒪_X°(U)`; in general, lattices chosen inductively on the nerve, `𝒪_X°(U)` being
unbounded when `X` is not reduced (*rational-integral-compatibility*). On the étale site, acyclicity is asserted only on the stable basis of
*stable-basis-etale-vector-bundles* (KL15 Theorem 8.2.22(c))
(CHJ §6.3, Prop. 6.15, p. 52; CHJ §6.3, proof of Prop. 6.15, p. 52 (the proof uses the bounded
torsion of the integral Čech cohomology); CHJ §6.3, Rem. 6.17, p. 52 (the étale-site version)). For
`X` the closed disc, `R = ℤ_p[[T]]` and the Laurent cover `{|Y| ≤ |p|}`, `{|p| ≤ |Y|}`,

```text
0 → 𝒪_K⟨Y⟩[[T]][1/p] → 𝒪_K⟨Y/p⟩[[T]][1/p] × 𝒪_K⟨Y, p/Y⟩[[T]][1/p] → 𝒪_K⟨Y/p, p/Y⟩[[T]][1/p] → 0
```

is exact; for `R = ℤ_p` this is Tate's theorem. *Needs:* *completed-coefficient-sheaf*;
*mixed-completed-tensor-product-formula*; *tate-acyclicity-finite-modules*,
*tate-kiehl-affinoid* (AdicSpacesPartIII layer R3); Tau Ceti `Huber.IsTateRing.isStrictMap_of_isClosed_range`;
the comparison of the edges of a Čech double complex (*cech-double-complex-comparison*,
AdicSpacesPartIII layer R3), applied to the rational basis.

**Local equalizers for the integral and rational coefficient sheaves.** (*coefficient-sheaf-local-equalizer*) Let `X` be a reduced affinoid rigid space over a complete
nonarchimedean extension `K` of `ℚ_p` (discreteness is not needed; reducedness is needed for the
integral statement, by *rational-integral-compatibility*), `M` a profinite flat `ℤ_p`-module (for
example a small `ℤ_p`-algebra `R`), `U ⊆ X` rational and `(U_i)` a finite rational cover of `U`.
Prove that

```text
0 → 𝒪_X⁺(U) ⊗̂ M → ∏_i 𝒪_X⁺(U_i) ⊗̂ M ⇉ ∏_{i,j} 𝒪_X⁺(U_i ∩ U_j) ⊗̂ M
0 → 𝒪_X(U) ⊗̂ M → ∏_i 𝒪_X(U_i) ⊗̂ M ⇉ ∏_{i,j} 𝒪_X(U_i ∩ U_j) ⊗̂ M
```

are equalizer diagrams; the integral equalizer holds on the nose, while the higher integral Čech
cohomology is only bounded `p`-torsion (CHJ §6.3, Prop. 6.15, p. 52; CHJ §6.3, proof of Prop. 6.15,
p. 52; CHJ §6.1, Cor. 6.5(1), p. 47). For `M = ℤ_p` these are the sheaf properties of `𝒪⁺` and
`𝒪`; for the Laurent cover `{|Y| ≤ |p|}`, `{|p| ≤ |Y|}` of the closed disc and `M = ℤ_p[[T]]`,
uniformly bounded sequences of functions on the two pieces that agree on the overlap glue to a
uniformly bounded sequence on the disc. *Needs:* *rational-integral-compatibility*;
*coefficient-sheaf-tate-acyclicity*; *mixed-completed-tensor-product-formula*.

**Density of restriction for Laurent covers.** (*coefficient-sheaf-dense-restriction*) Let `X` be
affinoid rigid over a complete nonarchimedean extension `K` of `ℚ_p` (no discreteness needed),
`f ∈ 𝒪_X(X)`, `X(f) = {|f| ≤ 1}`, `X(1/f) = {|f| ≥ 1}`, and `X(f, 1/f)` their intersection. Prove
(1) that the restriction `s₂ : 𝒪_X(X(1/f)) → 𝒪_X(X(f, 1/f))` has dense image; (2) that if `R` is a
small `ℤ_p`-algebra that is finite free as a `ℤ_p`-module (finite pseudobasis), then
`ℛ(X(1/f)) → ℛ(X(f, 1/f))` has dense image for the Banach structure of the target, and that for
every small `R` the image is dense for the coordinatewise topology on bounded `I`-families (after
choosing a pseudobasis); and (3) that for `R` with an infinite pseudobasis (2) fails in general, so
that CHJ Lemma 6.19(2) is false: for `K = ℚ_p`, `X = Spa ℚ_p⟨x⟩`, `f = x/p`, `R = ℤ_p[[T]]`, the
element `Σ_n p^{-n} x^n T^n` of `ℛ(X(f, 1/f))` has norm `1` and distance `1` from the image of
`ℛ(X(1/f))`. The computation: with `u = x/p`, `𝒪(X(f, 1/f)) = ℚ_p⟨u, u^{-1}⟩` with the Gauss norm
in `u`, and `𝒪(X(1/f)) = ℚ_p⟨x, p/x⟩`, whose elements `h = Σ_{k≥0} a_k x^k + Σ_{k≥1} b_k (p/x)^k`
have norm `max(|a_k|, |b_k|)` and restrict to `Σ a_k p^k u^k + Σ b_k u^{-k}`; an element of
`ℛ(X(1/f)) = ℚ_p⟨x, p/x⟩ ⊗̂ ℤ_p[[T]]` is a bounded sequence `(h_n)_n` of such `h`, `|h_n| ≤ C`,
whose `T^n`-coefficient restricts to a series with `u^n`-coefficient `a_{n,n} p^n` of absolute
value `≤ C p^{-n}`; hence `|u^n − h_n|_{X(f,1/f)} ≥ |1 − a_{n,n}p^n| = 1` as soon as `C p^{-n} < 1`,
and the sup-distance from `Σ u^n T^n` to the image is `1`, not `0` (CHJ §6.3, Lem. 6.19(2), p. 53).
Formally the failure is the statement that the restriction map of coefficient sections, for
`R = ℤ_p[[T]]` on the one-dimensional polydisc over `ℚ_p`, with `f = p⁻¹x` and rational domains
specified by `1 ≤ |f|` and `|f| = 1`, does not have dense range. The coefficient ring has its
coefficientwise `(p,T)`-adic topology;
the section rings have the mixed tensor's Banach topology. The statement also supplies a continuous
additive map to bounded positive Laurent coefficient arrays, a target section mapping to the
diagonal array, and the uniform exponential bound on the restriction image.
The array proof step, a Lean `example`, is that
the diagonal array has norm one and is at distance at least one from every exponentially
bounded source array. The inverse image of the open unit ball centered at the diagonal array
under the continuous coefficient map is a nonempty open subset of the target sections disjoint from
the restriction image.
The bounded-family identification used here is CHJ §6.3, p. 51; the refuted density claim is
CHJ §6.3, Lemma 6.19(2), p. 53.
Clause (1) holds for the same `f`: the image of `ℚ_p⟨x, p/x⟩` contains `u^{-k}` and
`u^k = p^{-k} x^k`, hence all Laurent polynomials in `u`. CHJ note that Ardakov–Wadsley §5.3 asserts density
for the other restriction map `s₁ : 𝒪_X(X(f)) → 𝒪_X(X(f, 1/f))`; the correct classical statement
is for `s₂`, as CHJ record. For
`R = ℤ_p[[T]]` the element `Σ p^{-n} x^n T^n` of the example lies in the image of `ℛ(X(f))` (the
small disc), not in the closure of the image of `ℛ(X(1/f))`. *Needs:*
*completed-coefficient-sheaf*; *mixed-completed-tensor-product-formula*; Tau Ceti
`Huber.PairOfDefinition.completionLocalization`.

**Kiehl's theorem for coherent `ℛ`-modules.** (*coefficient-sheaf-kiehl*) Let `K` be a discretely
valued complete extension of `ℚ_p`, `X` affinoid rigid over `K`, `R` small, and `F` a coherent
`ℛ`-module on `X` (*coefficient-sheaf-coherent-module*), coherent for some finite rational cover.
Prove (a): when `R` is finite free as a
`ℤ_p`-module, `F(X)` is finitely generated and `F ≅ Loc(F(X))`. Here `ℛ(U)` is finite free
as an `𝒪_X(U)`-module, so ordinary Kiehl applies to the underlying coherent
`𝒪_X`-module and its coefficient action. Prove (b): for any small `R`,
given a finitely generated `ℛ(X)`-module `M`, an isomorphism `F ≅ Loc(M)` and local
projectivity of `F`, the module `M` is projective. On a finite rational cover with
projective local presentations, full faithfulness of `Loc` identifies
`ℛ(U_i) ⊗_{ℛ(X)} M` with those projective modules. Noetherianity makes `M` finitely
presented, and projectivity descends along the faithfully flat map
`ℛ(X) → ∏_i ℛ(U_i)` (*coefficient-sheaf-faithfully-flat-cover*). This is the last
paragraph of the proof of CHJ §6.3, Thm 6.20, p. 53; it does not require a global-generation
assertion for arbitrary coefficients.

Global generation for an arbitrary coherent `F` over a small `R` with an infinite
pseudobasis — `F(X)` finitely generated and `F ≅ Loc(F(X))` — is not a target of this roadmap.
CHJ §6.3, Thm 6.20, p. 53 states
it, but the preceding proof uses the false Banach-density assertion of Lem. 6.19(2)
(*coefficient-sheaf-dense-restriction* (3)); no independent proof route is supplied, and neither
the density counterexample (*coefficient-sheaf-dense-restriction*) nor the base-change
counterexample (*coefficient-sheaf-base-change*) decides it.
Failure of that premise is not a counterexample to global generation. A consumer that needs
global generation carries it as a hypothesis, as PerfectoidTowers P9 does.
The finite-free assertion uses *tate-kiehl-affinoid*, AdicSpacesPartIII layer R3.
For `R = ℤ_p` this is
Kiehl's theorem for affinoid algebras (*tate-kiehl-affinoid*, AdicSpacesPartIII layer R3); when `R` is finite free
over `ℤ_p`, a line bundle glued on the Laurent cover of the disc from a unit of `ℛ(U₁₂)` is
`Loc` of a projective rank-one `ℛ(X)`-module.
*Needs:* *coefficient-sheaf-coherent-module*; *coefficient-sheaf-loc*;
*coefficient-sheaf-tate-acyclicity*; *coefficient-sheaf-dense-restriction*;
*coefficient-sheaf-faithfully-flat-cover*; *coefficient-sheaf-noetherian*; *tate-kiehl-affinoid*
(AdicSpacesPartIII layer R3); Mathlib `Module.Projective`, `Module.Flat`, `Module.Flat.of_flat_tensorProduct`,
`Module.Flat.projective_of_finitePresentation`.

**Checks.**

- Degenerate: the zero sheaf has zero global sections and is their
  localization, for every small `R`.
- Compatibility: over discretely valued `K`, every coherent sheaf
  satisfies the global-generation conclusion when `R` is finite free over `ℤ_p`, by (a).
- Non-example: on nonempty `X` with `R ≠ 0`, the free coefficient
  sheaf on `ℕ` does not satisfy the global-generation conclusion: its global sections are not
  finitely generated.
  This sheaf is not coherent and gives no counterexample to the coherent question.

**Base change of coefficient sheaves to `C`.** (*coefficient-sheaf-base-change*) Let `K` be a
discretely valued complete extension of `ℚ_p` (so that `Loc` applies on `X`), `C` the completion
of an algebraic closure of `K`, `X` affinoid rigid over `K` with `X_C = X ×_K Spa(C, 𝒪_C)` and
`f : X_C → X`, `R` small with `ℛ_C := 𝒪_{X_C} ⊗̂ R`, and `M` a finitely generated projective
`ℛ(X)`-module. Put `M_C := M ⊗_{ℛ(X)} ℛ_C(X_C)`, a finitely generated projective
`ℛ_C(X_C)`-module; on `X_C`, where `C` is not discretely valued, `Loc(M_C)` is a sheaf because
`M_C` is projective (*coefficient-sheaf-loc*). Prove that
`f^{-1}(Loc(M)) ⊗_{f^{-1}ℛ} ℛ_C ≅ Loc(M_C)` as sheaves of `ℛ_C`-modules on the rational site of
`X_C`, and that if `R` is finite free over `ℤ_p` then `ℛ_C(X_C) = ℛ(X) ⊗̂_K C` and
`M_C ≅ M ⊗̂_K C` (`M` with its canonical Banach topology).
For finite free `R` the section
comparison is fixed by `(a ⊗ r) ⊗ c ↦ (φ(a)c) ⊗ r`, and the
module comparison by `m ⊗ c ↦ c ⊗ m` over the extended coefficient algebra; the
source algebra is Banach and the module has its finite-module topology.
The rational-site
functor and the coefficient-ring map are constructed from the continuous scalar-compatible
affinoid map; their equations use rational inequalities and the mixed pure tensors.
The localisation statement then identifies the projective
localization pullback with algebraic extension along that coefficient map. For `R` with an infinite pseudobasis,
`M_C` is in general neither `M ⊗_K C` nor `M ⊗̂_K C`, so CHJ Lemma 6.21 as printed is false: for
`X = Spa(ℚ_p, ℤ_p)`, `R = ℤ_p[[T]]`, `M = ℛ(X) = ℤ_p[[T]][1/p]`, one has
`M_C = ℛ_C(X_C) = (𝒪_{ℂ_p} ⊗̂ ℤ_p[[T]])[1/p] = 𝒪_{ℂ_p}[[T]][1/p]` (product formula, `∏_ℕ 𝒪_{ℂ_p}`),
while `M ⊗̂_{ℚ_p} ℂ_p = (ℤ_p[[T]] ⊗̂_{ℤ_p} 𝒪_{ℂ_p})[1/p]` with
`ℤ_p[[T]] ⊗̂_{ℤ_p} 𝒪_{ℂ_p} = lim_n (ℤ/p^n)[[T]] ⊗_{ℤ/p^n} 𝒪_{ℂ_p}/p^n`, the power series whose
coefficients modulo `p^n` lie in a finitely generated `ℤ/p^n`-submodule of `𝒪_{ℂ_p}/p^n` for every
`n`; so `Σ_i [ζ_i] T^i`, with `[ζ_i]` Teichmüller lifts of an `𝔽_p`-linearly independent sequence
`ζ_i ∈ 𝔽̄_p`, lies in `M_C` and not in `M ⊗̂_{ℚ_p} ℂ_p`, and `M_C ⊋ M ⊗̂_{ℚ_p} ℂ_p`.
The proof identifies the mixed
tensor with bounded sequences through the power-series coefficient maps, and
the image of the Banach completed
tensor with the sequences whose coefficient range is totally bounded;
the equivalent integral
criterion is finite coefficient span modulo every `p^n`, the quotient scalar
action factoring through `ℤ/p^n`. This is the residue-class form of Mathlib's
`Metric.totallyBounded_iff` (`Mathlib/Topology/MetricSpace/Pseudo/Basic.lean`).
Unit coefficients with
linearly independent residues exist: every nonzero finite `𝔽_p`-linear combination
has norm one (Lean `example`: such a bounded sequence of units, not totally bounded).
Their pairwise distances are one, so the sequence is outside that
image. Thus the comparison between the completed Banach tensor and the
mixed coefficient module is injective and not surjective, with its pure-tensor equation and
scalar actions.
The same formulas apply to every complete algebraically closed normed
extension of `ℚ_p`. This target concerns field extension and projective modules (CHJ §6.3, Lem. 6.21, p. 53;
CHJ §6.1, Lem. 6.7, p. 47). For `M = ℛ(X)`, the base change is `ℛ_C(X_C)` by definition.
*Needs:* *coefficient-sheaf-loc*; *mixed-tensor-finite-projective-base-change*;
*completed-coefficient-sheaf*; *affinoid-completed-field-extension* (AdicSpacesPartIII layer R3); Mathlib
`Module.Projective`, `TensorProduct`.

**Affinoid coefficient algebras: `𝒪_X ⊗̂_{ℚ_p} S` is the structure sheaf of a product.** (*affinoid-weight-coefficient-sheaf*) Let `X` be affinoid rigid over `K ⊇ ℚ_p` and `S` a reduced
affinoid `ℚ_p`-algebra, topologically of finite type. Prove that for rational `U ⊆ X`,
`𝒪_X(U) ⊗̂_{ℚ_p} S` (the completed tensor product of *completed-tensor-product*, AdicSpacesPartII layer R0) is
`𝒪(U ×_{ℚ_p} Spa(S, S°))`, the ring of the affinoid rigid space `U ×_{ℚ_p} Spa S` over `K ⊗̂ S`;
hence Tate acyclicity, `Loc`, coherence and Kiehl for `U ↦ 𝒪_X(U) ⊗̂ S` on rational subsets of `X`
are the statements for the affinoid rigid space `X ×_{ℚ_p} Spa S` restricted to product covers
(*tate-kiehl-affinoid*, AdicSpacesPartIII layer R3) (CHJ §6.3, Rem. 6.22, p. 53 (affinoid weights: the analogues are
classical; affinoid coefficient algebras `S`)). This is a construction over `ℚ_p`, not an instance
of *completed-coefficient-sheaf*: a nonzero affinoid `S` is never a small `ℤ_p`-algebra (it
contains `ℚ_p`, and `pS = S` contradicts Nakayama for a nonzero finite module over
`ℤ_p[[X₁, …, X_d]]`, the `ℚ_p` non-example of *small-coefficient-algebra*). For the trivial weight space `S = ℚ_p`,
`𝒪_X ⊗̂_{ℚ_p} ℚ_p = 𝒪_X` and `U ×_{ℚ_p} Spa ℚ_p = U`; for `S = 0` (reduced, topologically of finite
type) the sheaf is `0` and `Spa 0 = ∅`. Reducedness of `S` is used only so that `S°` is bounded and
`Spa(S, S°)` is the rigid space of `S`; the completed tensor product of two algebras topologically
of finite type is topologically of finite type without it. For `S = ℚ_p⟨T⟩`, a disc of weights,
`𝒪_X ⊗̂ S = 𝒪_{X × 𝔹¹}`; for `S = ℚ_p⟨T⟩` and the Laurent cover `{|Y| ≤ |p|}`, `{|p| ≤ |Y|}` of the
disc `X`, the covers `{U_i × 𝔹¹}` are rational covers of `X × 𝔹¹`, and Tate acyclicity for
`𝒪_X ⊗̂ S` is Tate acyclicity on the bidisc. *Needs:* *completed-tensor-product*,
*affinoid-fibre-product*, *completed-tensor-rational-localisation* (AdicSpacesPartII layer R0); *tate-kiehl-affinoid*
(AdicSpacesPartIII layer R3); *completed-coefficient-sheaf*.

The reduction of étale coverings to rational coverings and surjective finite étale maps is
AdicEtaleGeometry A1, *etale-covering-reduction* (KL15 §8.2, Props. 8.2.20–8.2.21,
pp. 163–164), applied to the stable basis of *sousperfectoid-stably-adic* in the following form.

**Covering reduction on a stable basis.** (*stable-basis-covering-reduction*) Let `X` be locally
strongly sheafy and `B` a class of affinoid objects of `X_ét` that is cover-dense and stable under
rational embeddings and finite étale maps. Prove that the topology induced on `B` by `X_ét` is the
smallest one in which finite jointly surjective families of rational embeddings and single
surjective finite étale maps are coverings: a topology on `B` contains the induced one if and only
if it contains these sieves (KL15 §8.2, Props. 8.2.20–8.2.21, pp. 163–164; dJvP §3.2,
Prop. 3.2.2, p. 23, in the rigid case). This is a wrapper, not a second theorem: AdicEtaleGeometry
A1's *etale-covering-reduction* is stated and proved for an arbitrary cover-dense class of affinoid
objects stable under rational embeddings and finite étale maps, and this target applies it to the
class of *sousperfectoid-stably-adic* objects; it uses no PerfectoidSpaces target. *Needs:* AdicEtaleGeometry layer A1 (*etale-site*,
*etale-covering-reduction*, *strongly-sheafy-huber-pair*).

**Vector bundles on the étale site of an affinoid with a stable basis.** (*stable-basis-etale-vector-bundles*) Let `X = Spa(A, A⁺)` with `(A, A⁺)` a complete Tate sheafy
pair, and let `B` be a stable basis of `X_ét` containing `X` (AdicEtaleGeometry A1,
*basis-comparison*: closed under fibre products, finite étale extensions and rational subdomains). Prove (c) that for every finite
projective `A`-module `M`, the presheaf `M̃`, `Y = Spa(C, C⁺) ↦ M ⊗_A C`, is an acyclic sheaf on
`B`: `H^0(Y, M̃) = M ⊗_A C` and `H^i(Y, M̃) = 0` for `i > 0`, for every `Y ∈ B`; and (d) that
`M ↦ M̃` is an equivalence from finite projective `A`-modules to finite locally free
`𝒪_{X_ét}`-modules, with quasi-inverse `E ↦ E(X)`. The sheaf property of `𝒪` and `𝒪⁺` on `X_ét` is AdicEtaleGeometry A1,
*etale-structure-sheaf*. KL15 Theorem 8.2.22(a) concerns finite projective modules on the
adic and finite étale sites; it is an input to (c), not a statement about `𝒪⁺`. Only finite projective modules are treated,
rational localisation not being flat in general (KL15 §8.2, Thm 8.2.22(c), p. 165 (acyclicity of
`M̃` on a stable basis); KL15 §8.2, Thm 8.2.22(d), p. 165 (étale descent of vector bundles)). For
`M = A`, `H^i(X_ét, 𝒪) = 0` for `i > 0` (HK Proposition 5.8 for strongly sheafy `A`); for `X` a
smooth affinoid over a `p`-adic field, vector bundles on `X_ét` are finite projective
`𝒪(X)`-modules. *Needs:* AdicEtaleGeometry layer A1
(*etale-covering-reduction*, *basis-comparison*, *etale-structure-sheaf*);
*finite-projective-module-acyclicity*, *sheafy-cech-acyclicity*, *finite-projective-etale-descent*,
*sheafy-tate-acyclicity-and-kiehl-gluing* (AdicSpacesPartIII layer R3); Mathlib `Module.Projective`.

**Tilde-limits are stable under base change along morphisms locally of weakly finite type.** (*tilde-limit-base-change*) Let `I` be a cofiltered category with a final object `j`, `(X_i)_{i∈I}`
a system of quasi-compact quasi-separated adic spaces with adic transition morphisms, and `X` a
quasi-compact quasi-separated adic space with compatible adic morphisms `φ_i : X → X_i` such that
`X ∼ lim_i X_i` (Huber Definition 2.4.2; `AdicSpace.IsTildeLimit` in R5.8). Let `f : Y → X_j` be
an adic morphism of quasi-compact quasi-separated adic spaces that is locally of weakly finite type, and
assume that the fibre products `Y ×_{X_j} X` and `Y ×_{X_j} X_i` exist in adic spaces and are
affinoid-locally `Spa` of completed tensor products (*affinoid-fibre-product*, AdicSpacesPartII layer R0); the
existence of the fibre products is a hypothesis, supplied by *fibre-products-existence* (AdicSpacesPartII layer R0)
in the stably sheafy case and by *perfectoid-times-smooth-fibre-product* for perfectoid `X`. Prove
that `Y ×_{X_j} X ∼ lim_i Y ×_{X_j} X_i` (Huber96 §2.4, Rem. 2.4.3(ii), p. 126; Huber96 §2.4, (2.4.1), p. 125 (tilde-limits
are defined for qcqs spaces with adic morphisms)). The case of an étale `f` and a perfectoid
tilde-limit `X` is PerfectoidSpaces layer P7 (P7.12c, Scholze–Weinstein 2013 Prop. 2.4.3); this
target is the case of a morphism locally of weakly finite type over quasi-compact quasi-separated
adic `X`, perfectoid or not. For `Y = X_j` the statement is the hypothesis;
BHW Corollary 3.5 is the case `Y = X_1 ×_L U` for a smooth `U`
(*perfectoid-times-smooth-tilde-limit*). *Needs:* `AdicSpace.IsTildeLimit.affinoid`;
*tilde-limits-affinoid-criterion*; *fibre-products-existence*, *affinoid-fibre-product*,
*base-change-stability* (AdicSpacesPartII layer R0). Lean: `AdicSpace.IsTildeLimit.baseChange`,
with the fibre products given as pullback squares and `f` locally of weakly finite type in the sense
of `TauCetiRoadmap.AdicSpacesPartII.AdicSpace.LocallyOfWeaklyFiniteType`.

**Rational localisations of reduced affinoid algebras are reduced, and preserve `A⁺ = A°`.** (*reduced-affinoid-rational-localisation*) Reducedness of a `K`-affinoid algebra
passes to the algebra of each rational subdomain.
Supplied by RigidAnalyticGeometry §4.4.4 (the roadmap of W. Coram, to be contributed to TauCetiRoadmap ahead of this one).
The supplier states reducedness on rigid affinoid subdomains, so this roadmap identifies their
algebras with the complete rational localisation and proves `B⁺ = B°` for `A⁺ = A°` in
*rational-integral-compatibility* (R5.6).

For `R = ℤ_p`, the compatibility Check of *coefficient-sheaf-loc* includes the sheaf condition for
finite `M` and identifies the local tensors by `a ⊗ m ↦ ε(a) ⊗ m`, where
`ε : 𝒪_X(V) ⊗̂ ℤ_p ≅ 𝒪_X(V)` is the canonical isomorphism.
Together with the value of `Loc` on pure tensors under restriction, this fixes the
associated-sheaf comparison on restrictions.

### R5.8 tilde-limits of adic spaces

**Tilde-limits and the affinoid criterion.** (*tilde-limits-affinoid-criterion*) Huber's relation
`X ∼ lim X_i` — `|X| → lim |X_i|` a homeomorphism, and `X` covered by open affinoids `Spa(A, A⁺)`
in which the colimit of the rings of the affinoid opens of the `X_i` through which they factor is
dense — the affinoid criterion for it (a direct system of complete affinoid rings with compatible
rings and finitely generated ideals of definition has `Spa` of its completed direct limit as the
tilde-limit of its `Spa`'s), and its stability under open immersions and under fibre products with a
fixed space over the system are the contracts of this section: the relation `AdicSpace.IsTildeLimit`,
its affinoid criterion `AdicSpace.IsTildeLimit.affinoid`, the completed-direct-limit criterion
below, and base change `AdicSpace.IsTildeLimit.baseChange` (*tilde-limit-base-change*, stated in
R5.7). The spaces are quasi-compact
and quasi-separated, and transition morphisms are adic; analyticity is not
required. The affinoid proof uses compatible rings of definition and their
finitely generated ideals, with density in the completed direct limit
(Scholze–Weinstein 2013 Definition 2.4.1 and Proposition 2.4.2; Huber96 §2.4,
Definition 2.4.2). PerfectoidSpaces P7 specializes this relation to analytic
towers and is not an input. *Needs:* *affinoid-fibre-product*, *fibre-products-existence*,
*base-change-stability* (AdicSpacesPartII layer R0). Lean: `AdicSpace.IsTildeLimit`,
`AdicSpace.IsTildeLimit.affinoid` (which keeps the point-space homeomorphism as a hypothesis); the
completed-direct-limit criterion is specified in this README only.

The completed-direct-limit criterion is the nonanalytic one. It fixes compatible finite
generators of the ideals of definition,
approximation modulo their powers, finite-stage detection of membership in those
powers, and the closed integral closure defining the plus ring. Its conclusion
includes the point-space homeomorphism; that homeomorphism is not an assumption.

### R5.9 characteristic equations and topology of the auxiliary maps

The characteristic equations below are part of *mixed-completed-tensor* and of the base change
of frames in R5.2 (which uses AdicSpacesPartIII R3.5's *split-injection-completed-base-change*).
For integral tensors, the pure tensor `mixedTensorInt.tmul x m`
has component `x ⊗ (m mod N)` at each open submodule `N`, and
the functoriality map `mixedTensorInt.map f` acts by `f ⊗ id` at every such component. The product
equivalence of `mixedTensorInt.nonempty_piEquiv` takes the `i`-th coordinate of `x ⊗ m` to the
image of `e(m)_i x` in
`X̂`; the completion cannot be omitted when `X` is incomplete. These are the compatible
quotient maps in CHJ Definition 6.3 and Proposition 6.4, p. 46.

For arbitrary modules over a commutative ring and a continuous linear coefficient
map `g : M → M'`, the induced map of mixed tensors in the coefficient variable is defined at an
open submodule `N` of the target using the source component at
`g⁻¹N` and the induced map `M/g⁻¹N → M'/N`. It therefore fixes the image of every
compatible family. For a compact Hausdorff topological DVR `O`, any `O`-module `X`
and a continuous linear pseudobasis equivalence `e : M ≃ O^I`,
coordinate `i` of the product equivalence is fixed modulo `𝔪^n`: use the component
at the open kernel of `M → O → O/𝔪^n`, then apply `id_X ⊗ q` and Mathlib's
`X ⊗ O/𝔪^n ≃ X/𝔪^n X`. This includes `n=0`; for a uniformizer `ϖ`,
`𝔪^n=(ϖ^n)`. These are equations on every element of the limit, as in the proof
of CHJ Proposition 6.4, p. 46.

For `O`-algebras `X,A`, with `A` a topological ring whose open ideals form a
neighbourhood basis, the ring structure of the integral mixed tensor retains the limit's additive
group. Its product and unit are fixed componentwise: at each open ideal `J` they are the product
and unit
of the actual ring `X ⊗_O A/J`. Cofinality of the open ideals determines all
open-submodule components (CHJ Definition 6.3 and the following paragraph, p. 46).
For an open bounded subalgebra `L ⊆ V` and profinite flat coefficient algebra `M`,
the rational product of arbitrary fractions
`z/a` and `t/b` is `(zt)/(ab)` after lattice comparison, and
the rational unit is the image of the integral
unit. The hypotheses on the rational ring remain those of its ring structure in
*mixed-completed-tensor*.

The rational pure tensor clears a denominator in the chosen open bounded lattice and
uses the literal integral tensor as numerator. For an `O`-module `V` admitting
an open bounded lattice and bijective action of `ϖ`, for every exponent `k`
with `ϖ^k v` in that lattice, `v⊗m = (ϖ^k v⊗m)/ϖ^k`.
For profinite flat `M`, the same formula holds using
any open bounded lattice and the lattice change to return to the chosen
carrier. Composition of lattice changes is fixed
on every element; together with the lattice change along an inclusion it fixes comparison
through a common sublattice (CHJ Corollary 6.5(2) and Definition 6.6, p. 47).


The base-changed frame of R5.2 has the actual carrier `R̃ ⊗̂_R S` and inclusion
`s ↦ 1 ⊗ s`; its retraction on pure tensors is
`x ⊗ s ↦ σ(x)s` (HK Remark 7.2, p. 25). Completeness and Hausdorffness of `S`, continuity
of `R → S`, and perfectoidness of this completed tensor remain hypotheses.

For a compact Hausdorff topological DVR `O`, an irreducible uniformizer `ϖ`, and a Banach
module `V` with an open bounded, `ϖ`-adically complete lattice `V₀`, require that the product
equivalence sends `v ⊗ m` to the family `(e(m)_i • v)_i` and that the rank-one equivalence
`V ⊗̂ O ≅ V` sends `v ⊗ a` to `a • v`. The index set of a pseudobasis lies in the universe of `M`
(*profinite-flat-pseudobasis*). The topology of `mixedTensorOfLattice` is generated by translates of
`ϖⁿ` times the image of the integral mixed tensor in its localization;
the Banach construction uses this topology on its chosen lattice. This is the sup topology:
the neighbourhoods of zero are given by the conditions
`∀ i, z_i ∈ ϖⁿV₀`, with one exponent for every coordinate. With a continuous `O`-action
and topological additive-group structure on `V`, the
result is a Hausdorff complete topological `O`-module, and
the rank-one equivalence is a homeomorphism.
The product equivalence identifies the topology with the subspace topology
on bounded families inside Mathlib’s `UniformFun`, not the coordinatewise product.
Here completeness is for the canonical additive uniformity, and the Banach structure
is understood up to equivalent lattice norms, not as a choice of a numerical norm.
These are the bounded-family form of CHJ Proposition 6.4 and Definition 6.6, pp. 46–47.
For profinite flat `M`, every bounded
coordinate is specified: on a fraction `z/ϖ^k` from `V₀ ⊗̂ M`, multiplying its `i`-th coordinate
by `ϖ^k` gives the inverse completion image of the `i`-th coordinate of the integral product
equivalence applied to `z`.
Here `V₀` is adically complete, and the inclusion `V₀ → V` is the actual submodule
inclusion. The rank-one map is identified on every element
with this singleton-coordinate map, for an equivalence `O ≃ O^Unit` whose sole
coordinate is the identity.

The lattice change along an inclusion is localization of the actual integral inclusion map.
Covariance in both inputs is specified on pure tensors, compatibly with identities and
composition, and is continuous for the lattice topology.
Multiplication and the unit are specified on pure tensors.
With a topological ring `V` and continuous `O`-action, the lattice topology makes these
operations continuous.
The rational comparison of *rational-integral-compatibility* preserves the integral pure tensor.
For finite projective base change, the `S`-module structure acts on the
first factor, its restriction of scalars to `O` is the original `O`-action, it preserves the
respective continuity hypotheses (Mathlib `ContinuousConstSMul`, `ContinuousSMul`) of the
original action, and the base-change map takes `v ⊗ (u ⊗ m)` to `(v ⊗ u) ⊗ m`
(CHJ Lemma 6.7, pp. 47–48). For algebra inputs, the source is equipped
with the scalar homomorphism `s ↦ s⊗1`, and the same linear equivalence
preserves products and the unit; hence it is a ring isomorphism. These equations do not assert
Banach density of algebraic
tensors for infinite pseudobases. The lattice change, the rational comparison
and the base-change map are continuous in both directions. For a finite projective
module `V` over `S`, the topology on `V ⊗_S U` is initial for all maps
`φ ⊗ id : V ⊗_S U → U`, `φ ∈ Hom_S(V,S)`; a finite dual basis identifies this with
the topology inherited from a finite direct sum of copies of `U`. The same construction
is used with `U ⊗̂_O M`.

The functoriality map, the module structure, the base-change map and the rational comparison
are given by `IsLocalizedModule.map` on all localized integral elements. Their respective
integral first-factor maps are a continuous linear map `f`, multiplication by
`s`, the map `u ↦ v⊗u` for each fixed projective-factor vector `v`, and the
inclusion of the power-bounded lattice.
For open bounded lattices there is an exponent `k` making
`ϖ^k` times each continuous linear map preserve any specified open bounded
source and target lattices. Each equation identifies `ϖ^k`
times the rational map with localization of this integral map; for functoriality, the
coefficient map is the explicit induced map in the coefficient variable above. The hypotheses
are those of the respective constructions above, and the equations hold for
every such `k` and every localized family `z`. In the base-change equation,
`v⊗z` allows arbitrary `z ∈ U ⊗̂ M`, so algebraic generation in the
finite-projective factor determines the whole source. This is the integral
construction in CHJ Definition 6.6 and the proof of Lemma 6.7, pp. 47–48.
No density in the Banach topology is needed for these characterizations.

**Checks.**

| Construction | Computations |
|---|---|
| base change of a frame | `σ_S(x ⊗ 0)=0`; `σ_S(x ⊗ 1)=σ(x)` after scalar extension; `σ_S(x ⊗ s+y ⊗ t)=σ(x)s+σ(y)t`. |
| lattice change | changing a lattice to itself fixes every localized family; an inclusion takes two integral pure tensors to their actual images, with no scaling; changing from `L` to `ϖL` takes `x⊗m` to the fraction `(ϖx⊗m)/ϖ`, fixing the denominator direction. |
| rational ring structure | `1⊗1=1`; `(v⊗1)(1⊗m)=v⊗m`; `(v⊗1+1⊗m)²=v²⊗1+2(v⊗m)+1⊗m²`, including the coefficient `2`. |
| topology of `mixedTensorOfLattice` | the zero lattice has the unique topology; the construction at scalar `1` has the indiscrete topology; localizing the integral mixed tensor of `ℤ_p` with itself gives the usual topology on `ℚ_p`. The scalar-`1` case is a control of the raw construction, not a DVR uniformizer. |
| Banach structure | the empty pseudobasis has the unique topology; the rank-one map is a homeomorphism to `V`; moving unit vectors converge coordinatewise to zero but do not converge in the mixed tensor's sup topology, over every `ℚ_p`, including `p=2`. |
| product equivalence | the coordinate function on the empty pseudobasis is zero; `v⊗(1)` has coordinate `v`; `v⊗(1,0)+w⊗(0,1)` has coordinates `(v,w)`, fixing their order. |
| functoriality | the identity fixes every compatible family, including nonalgebraic tensors; a zero first map induces zero; twice the identity on the first factor doubles every mixed tensor, also over `ℤ₂`. |
| rational pure tensors | the literal integral numerator is fixed; division by one uniformizer is fixed; the sum of two actual integral tensors is fixed; `0⊗m=0`; the expansion of `(v+w)⊗(m+n)` has the four terms in row order; `Σ XⁿTⁿ` over the `ℚ_p` disc is outside its algebraic span. |
| rank-one equivalence | `v⊗0` maps to zero; `v⊗1` maps to `v`; `v⊗ϖ` maps to `ϖv`, fixing denominator normalization. |
| integral product equivalence | empty product; the image of `x⊗1` is the canonical image of `x` in `X̂`; two coordinate vectors give the two completion images in the stated order. |
| induced map in the coefficient variable | the identity fixes every family; zero kills every family; doubling doubles every family, including over `ℤ₂`. |
| integral ring structure | `1=0` for the zero first factor; the unit projects to the actual quotient unit; the quotient of `(z+t)²` for arbitrary integral families, including its coefficient `2`. |
| `mixedTensorInt.tmul` | zero first factor; the component is Mathlib's tensor `x⊗(a mod N)`; addition of two first-factor elements is computed in each quotient. |
| rational comparison of *rational-integral-compatibility* | zero second factor stays zero; integral constants map to `1⊗m`; the two bounded coefficients map to their sum of rational pure tensors. The unbounded-lattice non-example is that of *mixed-completed-tensor*. |
| module structure over `S` | zero scalar annihilates a pure tensor; the `S`-action of the image of `ϖ` equals the original `O`-action; one scalar acts on each of two first-factor coefficients. |
| finite projective base change | the zero projective module gives the zero map; for the rank-one module `S`, `1⊗(u⊗m)` maps to `(1⊗u)⊗m`; the two standard basis vectors of `S²` remain in their respective coordinates. |

The space-level Checks in R5.4–R5.5 use `TauCeti.AdicSpace`, its affinoid charts and the
perfectoid-space predicate of PerfectoidSpaces P2. The coefficient-sheaf Checks in R5.7
use the rational site with its structure sheaf and restriction maps, and sheaves of modules
over the resulting coefficient presheaf. The integral subsheaf has three further Checks:
for `R=ℤ_p` it is `𝒪_X⁺`; for `R=0` it is zero; on the reduced disc with
`R=ℤ_p[[T]]` it consists of series whose coefficients lie in `𝒪_K⟨Y⟩`.
The structure map sends `1` to `1⊗1`, sends every section to zero for `R=0`, and for
`R=ℤ_p` is the identity, including on the nonreduced dual-number disc. These are
assertions on the rational-site coefficient presheaf, its integral subsheaf and its
structure morphism. The locally projective predicate is tested by the zero sheaf,
a rank-one sheaf glued by a unit on a Laurent overlap, and the failure of finite local
projectivity for the infinite direct sum on nonempty `X` with `R≠0`.

### R5.10 finite rational coefficient site

For a classical `K`-affinoid algebra `A` (AdicSpacesPartII R1), the coefficient constructions of
R5.7 (in the namespace `RigidSpace.Coefficients`) use the existing AdicSpacesPartII R1 rational
domains and their universal coordinate rings. The rational opens are the subsets
`A(f₁/g,…,fₙ/g)` with `(g,f₁,…,fₙ)=A`, ordered by inclusion. The topology consists of sieves
containing a finite family whose union is the domain. In particular, the empty
family covers the empty domain. This is the classical finite rational site in
CHJ §6.3, pp. 50–53. Its comparison with the adic rational site uses the AdicSpacesPartII R1
comparison of rational domains; the global adic-space interfaces in R5.4–R5.8
retain their separate carriers and hypotheses.

The coefficient sections `ℛ(U)` are literally the mixed tensor of the coordinate ring of `U`
with `R`. Here `K` is complete, nontrivially normed and ultrametric, with a
continuous `ℚ_p`-action; `R` is small and carries its canonical topology. The
explicit equality of its topology with `IsSmallZpAlgebra.topology` prevents a
choice of another topology from changing the theorem. The restriction homomorphism
is the functoriality map of the mixed tensor on the coordinate-ring restriction and the
identity of `R`, including on nonalgebraic compatible families. The objects and
maps of the coefficient presheaf are these rings and homomorphisms.
Its sheaf property gives the coefficient sheaf in Mathlib's `Sheaf`
category. Noetherianity of the sections, flatness of restriction and faithful flatness of
finite covers retain discrete valuation of `K` (CHJ Lemma 6.13, pp. 50–51).
Acyclicity states positive-degree vanishing using Mathlib's
`Sheaf.H'`, applied to the underlying additive sheaf of the free rank-one
coefficient module (CHJ Proposition 6.15, p. 52).

For reduced `A`, the plus lattice is the submodule whose underlying set is
the power-bounded subring of the sections; its scalar action is inherited from the
coordinate ring. The integral inclusion is the localization map followed by
the rational comparison of *rational-integral-compatibility*, on the entire integral mixed tensor.
It commutes with the completed map of the actual
power-bounded lattices on every compatible family. The unit ball is its image as a subring;
its statements are the integral
comparison (injectivity of the integral inclusion), naturality under restriction, bounded
denominators (inverting `p` gives `ℛ`) and the integral sheaf property.
The structure map sends `a` to `a⊗1`, with its
restriction equation; the constants map sends `r` to `1⊗r`. The ring equivalence
`ε : 𝒪_X(U) ⊗̂ ℤ_p ≅ 𝒪_X(U)`, with its value on pure tensors and its naturality, gives
contraction to the
structure sheaf even for nonreduced `A` (CHJ Definition 6.6 and the discussion
following it, p. 47; §6.3, p. 51).

`Loc U M` is a `PresheafOfModules` on `Over U`: its value at `V → U` is
`ℛ(V) ⊗_{ℛ(U)} M`. Equations on pure tensors
fix the restriction and module maps, the global-sections
contraction `a⊗m ↦ am`, and the restriction
comparison `a⊗m ↦ a⊗(1⊗m)`. Full faithfulness concerns this tensor
presheaf functor. The sheaf property, acyclicity and Čech acyclicity of `Loc M` require finite
generation
and either discrete valuation of `K` or projectivity of `M`; exactness of `Loc`
requires discrete valuation. The Čech target uses Mathlib’s alternating
`cechComplexFunctor` on the actual finite rational covering family, with
positive-degree homology zero (CHJ Definition 6.14 and Proposition 6.16,
pp. 51–52).

The coherence and local-projectivity predicates quantify over
finite rational covers of the whole affinoid and isomorphisms to `Loc M` in
Mathlib's module-presheaf category. Both require finite generation; the latter
also requires projectivity. Coherence follows from a global finite
localization, and is preserved
under kernels, cokernels and rational restriction over a discrete base.
Local projectivity implies coherence. The finite-free Kiehl statement (a) of
*coefficient-sheaf-kiehl* assumes discrete valuation and
finite freeness of `R` over `ℤ_p`. Its projectivity statement (b) assumes
discrete valuation, a finite module `M`, `F ≅ Loc M` and local projectivity of `F`,
and concludes that `M` is projective. Global generation — finite generation
of global sections and recovery by localization — for arbitrary coherent
sheaves over small `R` with an infinite pseudobasis is not a target (*coefficient-sheaf-kiehl*;
CHJ Theorem 6.20, p. 53), and no general theorem is assumed.

**Checks.** The coordinate, integral and module computations use the same
restriction maps as the constructions above.

| Construction | Checks |
|---|---|
| Rational domains and their coordinate rings | denominator zero with numerator one gives the empty domain; denominator one with no numerators gives the whole domain; disjoint rational domains have empty intersection; the coordinate ring of the empty domain is zero; the whole-domain ring is `A`; restriction preserves the sum of two functions. |
| Finite rational covers | the empty sieve covers the empty domain; the identity covers each domain; the empty sieve cannot cover a nonempty domain. |
| Coefficient sections | sections on the empty domain vanish; `(a+b)⊗(r+s)` has all four summands; contraction gives the original coordinate ring. |
| Restriction | a sum of two tensors restricts in the first factor; restriction to the empty domain is zero; identity restriction fixes every completed tensor. |
| Structure and constant maps | the structure map preserves the unit, is zero for the zero coefficient ring, and is the identity after contraction for `R = ℤ_p`; the constants map sends `0` to zero, is additive on two constants, and preserves the coefficient unit. |
| Power-bounded lattice | every element on the empty domain is bounded; all integral scalar constants lie in the lattice; the scalar `1/p` does not lie in the lattice on a nonzero domain. |
| Integral inclusion | zero, two integral coefficients with their given order, and the unit. |
| Integral subring | contraction identifies it with the power-bounded subring for `R = ℤ_p`; zero coefficients give zero; two copies of `ℤ_p` give the product of the two power-bounded subrings. |
| Localization | localization of free modules of ranks zero, one and two has the same rank on every rational subdomain. |
| Localization on maps | zero, identity and twice the identity, including at `p=2`. |
| Scalar contraction | zero, `1⊗1 ↦ 1`, and `a⊗r+b⊗s ↦ ra+sb`. |
| Global sections of localization | zero, `1⊗m ↦ m`, and `a⊗m+b⊗n ↦ am+bn`. |
| Restriction of localization | zero, `1⊗m ↦ 1⊗(1⊗m)`, and `a⊗m+b⊗n ↦ a⊗(1⊗m)+b⊗(1⊗n)`, fixing the tensor order. |
| Coherence | the zero and free rank-one sheaves are coherent; the free sheaf on `ℕ` fails coherence when `R≠0` and the affinoid has a point. |
| Finite local projectivity | ranks zero and two; the same infinite-rank non-example. |

The disc power-series and glued-line Checks in R5.7 additionally require the
specified power-series coordinate identifications and the sheaf obtained by
Laurent gluing. The product and space Checks require actual adic fibre products,
the perfectoid-space predicate and the P7 tilde-limit relation; none is replaced
by a statement about an arbitrary tensor ring.

### Examples

The following algebraic controls also specify the boundary of the auxiliary constructions.

- The perfectoid predicate is stated for every `p : ℕ`; primality enters only through the
  `[Fact p.Prime]` hypotheses of the theorems that use it (`of_finite_padic`,
  `not_isPerfectoidTateRing_restrictedMvPowerSeries`, `perfectoidTimesSmooth_exists`), and for the
  zero ring the predicate holds for every `p`, including `0` and `1`. In
  `𝔽₂[ε]/(ε²)`, `(a+bε)²=a`, so Frobenius misses `ε`. This is the modulo-`2` obstruction for
  the ramified extension with `π²=2`, where the divisibility condition itself holds.
- For the diagonal inclusion `R → R×R` and first projection,
  build the perfectoid frame `Huber.PerfectoidFrame` over a nonzero perfectoid `R` and evaluate its
  fields: `σ(ι(1))=1`, `ι(σ(1,0))=(1,1)≠(1,0)` and `ι(σ(0,1))=(0,0)`.
  These values pin the direction of the splitting (HK Definition 7.1, p. 25); the reverse
  composite `ι∘σ` is not the identity.
- The zero algebra is small, with its unique topology.
  The canonical topology of `ℤ_p` is the usual `p`-adic topology; that of `ℤ_p[[T]]` is
  the coefficientwise topology, equivalently the `(p,T)`-adic topology on `ℤ_p[[T]]`.
- The zero module has its zero lattice;
  `ℤ_p` is an open bounded lattice in itself for `p`; it is not bounded for the scalar `1`,
  since no power of `1` sends it into `pℤ_p`.
- The integral mixed
  tensor vanishes if either factor vanishes, and `ℤ_p ⊗̂ ℤ_p² = ℤ_p²`.
  The identity, zero and doubling maps give respectively identity,
  zero, and multiplication by `2` on these inverse limits, fixing covariant map direction.
- The zero lattice gives zero;
  localizing at `1` changes nothing; localizing at `0` kills the whole module. The latter two
  are controls for the raw localisation `mixedTensorOfLattice`, not uniformizers of a DVR.
- The Banach mixed tensor vanishes when either factor
  is zero. Together with the degenerate and finite-free Checks of *mixed-completed-tensor* these
  check the chosen-lattice construction at ranks `0`, `1`, and `2`.

The worked examples of this layer are the checks above and the examples recorded at the lemmas:
`ℚ_p⟨T⟩` sousperfectoid with frame `ℚ_p^cycl⟨T^{1/p^∞}⟩` and not perfectoid, against the
non-reduced `ℚ_p⟨X, Q⟩/(Q²)` which is strongly noetherian and sheafy but not sousperfectoid and
has unbounded `A°`; perfectoid rings sousperfectoid with the frame `(R, id, id)`;
`𝔽_p((t))⟨T⟩` sousperfectoid through the splitting of Frobenius; `ℚ_p⟨T^{±1}⟩` with frame
`ℚ_p^cycl⟨T^{±1/p^∞}⟩`; `ℚ_p(ζ_p)` with frame `(ℚ_p^cycl)^{p−1}`; the projection
`ℚ_p × ℚ_p⟨X, Q⟩/(Q²) → ℚ_p` as the finite étale non-faithfully-flat map along which descent
fails; the closed annulus over a perfectoid field as a sousperfectoid non-perfectoid affinoid;
`Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` sheafy without using noetherianity and `Spa(S⟨T⟩, S⁺⟨T⟩)` sheafy for perfectoid
`S ≠ 0` though not perfectoid; the closed unit disc, the empty space, `Spa(ℚ_p, ℤ_p)`
and `𝔹¹_L` as sousperfectoid spaces; `X ×_L 𝔹^n = Spa(S⟨T⟩, S⁺⟨T⟩)` for affinoid perfectoid
`X = Spa(S, S⁺)`, with `𝔹¹_L` itself as the non-perfectoid product; the perfectoid fibre product
`X ×_L Spa L'` as the degenerate case `Y = Spa L'`; BHW's `X*_{Γ(p^∞)}(ε)_a ×_L U ∼ lim_n X*_{Γ(p^n)}(ε)_a ×_L U`; `ℤ_p[[T₁, …, T_d]]` and `∏_I 𝒪` as profinite flat modules against `𝒪/ϖ`,
discrete `𝒪`, `E` and indiscrete `𝒪`; `ℤ_p[[ℤ_p^×]]` as a small algebra, `≅ ∏_{p−1} ℤ_p[[T]]` for
`p` odd, against `ℤ_p[[T]]/(T²)`, `𝔽_p[[T]]` and `ℚ_p`;
`ℚ_p⟨X⟩ ⊗̂ ℤ_p[[T]] = (ℤ_p⟨X⟩[[T]])[1/p]` with `Σ_n X^n T^n` outside the image of the algebraic
tensor product and the unbounded power-bounded lattice of `ℚ_p⟨X, Q⟩/(Q²)` giving the wrong ring;
`ℛ(X) = 𝒪_K⟨Y⟩[[T]][1/p]` on the closed disc with the exact Čech sequence of its Laurent cover,
`Loc(ℛ(X)/(T)) = 𝒪_X`, and the rank-one sheaf glued from a unit of `ℛ(U₁₂)`; the element
`Σ_n p^{-n} x^n T^n` at distance `1` from the image of `ℛ(X(1/f))`, which refutes CHJ Lemma
6.19(2); `M_C = 𝒪_{ℂ_p}[[T]][1/p] ⊋ M ⊗̂_{ℚ_p} ℂ_p`, which refutes CHJ Lemma 6.21 as printed;
`𝒪_X ⊗̂ ℚ_p⟨T⟩ = 𝒪_{X × 𝔹¹}` for an affinoid weight disc; de Jong–van der Put Proposition 3.2.2
as the rigid case of the covering reduction; `K⟨x/p⟩` reduced with `B° = 𝒪_K⟨x/p⟩` against
`K⟨x, q⟩/(q²)`; the degenerate and negative controls — the zero
ring as a perfectoid, hence sousperfectoid, ring; the non-complete `ℚ_p(ζ_{p^∞})` with no frame,
which pins completeness in *split-injection-completed-base-change*; `ι∘σ(ζ_{p²}) = 0 ≠ ζ_{p²}` for
the direction of the splitting; the annulus `{|p| ≤ |T| ≤ 1}` for `(a, b) = (0, 1)` against the
empty annulus for `(a, b) = (1, 0)`; the closed points `(y, t)` of `𝒪_K⟨Y⟩[[T]][1/p]` split by
`|y| ≤ |p|` versus `|y| ≥ |p|`; and `Σ [ζ_i] T^i` as the element of `M_C` outside `M ⊗̂ ℂ_p`.

### Dependencies

AdicSpacesPartII Layer R0 (*completed-tensor-product*, *completed-tensor-product-universal-property*,
*completed-tensor-restricted-power-series*, *completed-tensor-rational-localisation*,
*locally-noetherian-adic-space*, *affinoid-fibre-product*, *fibre-product-along-finite-type*,
*fibre-products-existence*, *base-change-stability*, *adic-ring-homomorphism*,
*reduced-affinoid-supremum-norm*, *smooth-morphism*, *differentials-unramified-smooth-etale*,
*smooth-local-structure*); AdicSpacesPartIII layer R2 (*berthelot-type-rig-functor-nonnoetherian-base*, for the
closed points of the generic fibre in *coefficient-sheaf-faithfully-flat-cover*); AdicSpacesPartIII layer R3
(*associated-module-sheaf*, *tate-acyclicity-finite-modules*, *rational-covering-reduction*,
*cech-acyclicity-simple-laurent-reduction*, *sheafy-cech-acyclicity*, *tate-kiehl-affinoid*,
*sheafy-tate-acyclicity-and-kiehl-gluing*, *finite-projective-module-acyclicity*,
*finite-projective-etale-descent*, *stably-uniform-sheafy*, *affinoid-completed-field-extension*);
AdicSpacesPartIII layer F0 (*restricted-power-series-adic*, *completed-tensor-product-adic*); AdicEtaleGeometry layer
A1 (the étale site in the
local-description sense, *finite-etale-affinoid-algebra*, *strongly-sheafy-huber-pair*,
*basis-comparison*, *etale-covering-reduction*, *etale-structure-sheaf*);
AdicSpacesPartIII layer R3's *cech-double-complex-comparison* (applied to the rational basis).
PerfectoidSpaces, by subsection: R5.1 uses P1.1 (the predicate `Perfectoid.IsPerfectoidTateRing`)
and P1.31; R5.2 uses P1.30, P1.31, P2.3 and P3.10; R5.4 uses P2.10; R5.5 uses P1.10, P1.30 and
P2.9–P2.10. R5.3 uses no PerfectoidSpaces target beyond R5.2's, and R5.6–R5.8 use none: in
particular *stable-basis-covering-reduction*, *stable-basis-etale-vector-bundles* and
*tilde-limits-affinoid-criterion*, which PerfectoidSpaces P3.19 and P7.1 use, rest only on
AdicEtaleGeometry A1, AdicSpacesPartII–III and KL15. R5.8 names PerfectoidSpaces P7 as a
specialisation and does not use it, and in *tilde-limit-base-change* the fibre products are
hypotheses, which *perfectoid-times-smooth-fibre-product* supplies in the BHW case.
The perfectoid-frame stability arguments and tilde-limit contracts are proved in R5;
PerfectoidSpaces applies them.
AdicSpaces layers 4.2 and 5 (uniformity and affinoid adic spaces); Mathlib and Tau Ceti as listed at
the targets (`Huber.IsTateRing`, `Huber.IsHuberRing`, `Huber.powerBoundedSubring`,
`Huber.IsBounded`, `Huber.IsPowerBounded`, `Huber.IsRingOfIntegralElements`,
`Huber.PairOfDefinition.completionLocalization`,
`Huber.PairOfDefinition.existsUnique_continuous_ringHom_completion_locTopology`,
`Huber.restrictedMvPowerSeriesCompletion`, `Huber.IsTateRing.isOpenMap`,
`Huber.IsTateRing.isStrictMap_of_isClosed_range`, `IsCompactModule`, `IsCompactModule.t2Space`,
`IsCompactModule.isLinearTopology`, `completedPlusSubring_le_powerBoundedSubring`,
`mem_completedPlusSubring_iff_forall_mem_rationalSubset_vle_one`, `ValuationSpectrum.spa`,
`ValuationSpectrum.rationalSubset`, `ValuationSpectrum.spaComap_preimage_rationalSubset`,
`ValuationSpectrum.mem_iff_forall_vle_one`; Mathlib `ContinuousLinearMap`, `TensorProduct`,
`UniformSpace.Completion`, `Topology.IsStrictMap`, `Algebra.Etale`, `Module.Finite`,
`Module.Projective`, `Module.Flat`, `Module.FaithfullyFlat`,
`Module.FaithfullyFlat.of_comap_surjective`, `Module.Flat.of_flat_tensorProduct`,
`Module.Flat.projective_of_finitePresentation`, `IsLinearTopology`, `CompactSpace`, `T2Space`,
`Profinite`, `IsAdicComplete`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`,
`IsNoetherianRing`, `MvPowerSeries.isNoetherianRing`, `IsLocalization.isNoetherianRing`,
`Ideal.Quotient.isNoetherianRing`, `IsReduced`, `CategoryTheory.GrothendieckTopology`).

### R5.11 the non-analytic tilde-limit relation

Part II’s `AdicSpace.IsAdic` means that every source point has compatible source and
target affinoid charts whose coordinate homomorphism is adic.
`IsTildeLimit F c` requires a homeomorphism from `c.pt` to the space of compatible
points of `F`, taking each projection to `c.π.app i`, and an affinoid covering of
`c.pt` on which the union of the images of compatible chart homomorphisms is
dense. These are Huber96 Definition 2.4.2's two conditions. The topology on the
space of compatible points is the subspace topology from the product.
`IsTildeLimit.baseChange` states Huber96 Remark 2.4.3(ii), with quasi-compactness,
quasi-separatedness, adic transition maps, local weak finite type, and the actual
pullback squares explicit. The product statement *perfectoid-times-smooth-tilde-limit*
specializes this
to a perfectoid limit and smooth base change between locally noetherian analytic
spaces (BHW Corollary 3.5). These hypotheses are separate from Part II's `Smooth`.
Its perfectoid charts and the affinoid density condition use Part II's `AdicSpace.Chart`,
the coordinate rings of affinoids, `Huber.Pair.Hom` and Part II's `AdicSpace.Affinoid.IsInducedBy`
(a morphism of affinoid spectra induced by a pair homomorphism); the chart equations identify
the actual cone maps. The constant, empty, noninjective and nondense Checks below
use these same carriers.

**Checks.** Identities are adic; the
empty source is included; an affinoid map whose ring map is not
adic is rejected. A constant diagram with identity projections is a tilde-limit (Lean `example`);
so is a diagram of empty spaces; and
a constant diagram whose proposed
limit projection identifies distinct points is rejected (Lean `example`).

A nondense Check tests density independently of the point-space
condition (Huber96 Definition 2.4.2, p. 125). For a prime `p`, take a perfectoid
frame `(R̃, ι, σ)` of `ℚ_p` with nonsurjective embedding `ι`, and suppose
`Spa(R̃, R̃°)` has exactly one point. With sheafy power-bounded pairs and the
pair morphism whose ring map is `ι`, use its spectrum map as the projection of
the constant diagram `Spa(ℚ_p, ℤ_p)` indexed by the one-object category
`Discrete PUnit`. The Check asserts both the compatible point-space
homeomorphism in clause (a) and that this same cone is not a tilde-limit. The completed
cyclotomic field gives such a frame (HK Definition 7.1 and Remark 7.8, pp. 25–26).
Both spaces have one point, so every nonempty affinoid chart is the whole space.
The compatible chart images therefore identify with `ι(ℚ_p)`, a proper closed
subring: it is the equalizer of `id` and `ι ∘ σ` in the Hausdorff frame target.
Thus clause (b) fails on every chart through the point. A ring-level Check
supplies the corresponding nondensity fact.

## Layer F1: dagger geometry and overconvergent de Rham complexes

This layer builds on layers AdicSpacesPartII R0–R1, AdicSpacesPartIII R2–R3 and R4 (and, for Elkik's
approximation theorem only, PerfectoidSpaces P3.1). It develops Grosse-Klönne's rigid spaces with
overconvergent structure sheaf and their de Rham cohomology. It constructs the overconvergent Tate algebras and their
Weierstrass theory; dagger algebras with the comparison to their completions, approximation and
finiteness statements; fringe presentations and the fringe topology; dagger tensor products and
rational localisation; weak completions and algebras of Monsky–Washnitzer type; affinoid dagger
spaces, Tate acyclicity and the G-topology; dagger spaces, coherent modules and strict
neighbourhoods; the dagger–rigid comparison; differentials and the overconvergent de Rham complex;
the differential operators, derived de Rham functor, direct images and algebraic local cohomology
used for supported cohomology; supports, compact support and duality; finiteness (Grosse-Klönne's
Theorems A and C) and Künneth, the finiteness statements carrying finiteness of Monsky–Washnitzer
cohomology (MWF) and embedded resolution (RES) as hypotheses (F1.11);
and the logarithmic and compact-support complexes for smooth pairs. Sheaf cohomology and
hypercohomology are Mathlib's. Throughout, `K` is a field
complete for a nontrivial nonarchimedean absolute value `|.|` of rank one (in Lean
`NontriviallyNormedField K`, `IsUltrametricDist K`, `CompleteSpace K`), `Γ* = √|K^×|` is the
divisible hull of its value group, `T_n = K⟨X_1, …, X_n⟩` is the Tate algebra and `W_n` the
overconvergent Tate algebra; a dagger algebra `A` has completion `Â` and integral subring `A^int`.
The coefficient constructions `radiusTate`, `washnitzerAlgebra` and the integral
power series `O_K[[X]]` also make sense without completeness. Presentation quotients and their algebraic
structure maps are defined under the hypotheses displayed with them; analytic comparison theorems
use completeness. `Omega`, `Omega.d` and the canonical map from Mathlib's Kähler differentials to
`Omega` are defined for arbitrary commutative
base algebras, with finiteness asserted for dagger algebras. The degree-growth weak completion
is defined for any parameter `π ∈ O_K`; assertions requiring a uniformiser state `Irreducible π`.
Outside F1.5, `π ∈ K` denotes a fixed element with `0 < |π| < 1` (a uniformiser when `K` is
discretely valued); in F1.5 it is the uniformiser of the complete discrete valuation ring `O_K`.

### F1.1 overconvergent power series

**Tate algebras of polydiscs of radius `ρ`.** (*radius-tate-algebra-affinoid*) The radius pieces
`T_n(ρ)` for `ρ > 0` are Banach algebras for the multiplicative Gauss norm, with dense polynomials, and are
`K`-affinoid for `ρ ∈ Γ*`.
Supplied by RigidAnalyticGeometry §1.5.1–1.5.2 (the roadmap of W. Coram, to be contributed to TauCetiRoadmap ahead of this one).
This roadmap specialises the student's polyradius to the constant tuple `ρ` and identifies the
supplier's algebraic affinoid carrier with its Gauss-norm Banach topology using
RigidAnalyticGeometry §1.3.3, so a Tate presentation is a strict topological presentation here.

**The Monsky–Washnitzer algebra `W_n = K⟨X_1, …, X_n⟩†` of overconvergent power series.**
(*overconvergent-tate-algebra*) Let `K` be a field complete for a nontrivial nonarchimedean absolute
value `|.|` of rank one (in Lean `NontriviallyNormedField K`, `IsUltrametricDist K`,
`CompleteSpace K`) and `n ∈ ℕ`. Define `W_n = K⟨X_1, …, X_n⟩† := ⋃_{ρ>1} T_n(ρ) ⊆ K[[X_1, …, X_n]]`,
the set of power series `Σ_ν a_ν X^ν` for which there is a real `ρ > 1` with `|a_ν| ρ^{|ν|} → 0`
(equivalently: there are `ρ > 1` and `C ≥ 0` with `|a_ν| ≤ C ρ^{-|ν|}` for all `ν`; equivalently
there is `ρ ∈ Γ*`, `ρ > 1`, such that the series converges at every point `x` of `K_a^n` (`K_a` an
algebraic closure) with `max_i |x_i| ≤ ρ`; convergence only at the `K`-rational points of such a
polydisc does not suffice when `K` is discretely valued and `ρ < |π|^{-1}`, since those points
already lie in the unit polydisc). Because `ρ ↦ T_n(ρ)` is antitone, the union is directed and `W_n`
is a `K`-subalgebra of `K[[X]]`; the union may be taken over `ρ ∈ Γ* ∩ (1, ∞)` but not only over
`ρ ∈ |K^×|`. `W_n ⊆ T_n = T_n(1)`, and `W_n` carries the Gauss norm `|f| = max_ν |a_ν|` restricted
from `T_n`. Convention: the variables are `X_1, …, X_n`, `|ν| = ν_1 + … + ν_n`, and 'overconvergent'
always means 'restricted at some radius strictly bigger than 1'. The radius-`ρ` pieces `T_n(ρ)` are
Mathlib's `MvPowerSeries.IsRestricted.subring`, with Tau Ceti's normed-algebra instances, for the
constant radius; the union over `ρ > 1` is
new. In `Dagger`, define `washnitzerAlgebra` as the `K`-subalgebra
`⨆_{ρ>1} T_n(ρ)` of `MvPowerSeries (Fin n) K`, `T_n(ρ) = radiusTate n K ρ` being
`MvPowerSeries.IsRestricted.subring (fun _ ↦ ρ)` (notation
`K⟨X⟩†`); prove that `f ∈ W_n` iff `f` is restricted at some `ρ > 1`,
`mem_washnitzerAlgebra_iff` (the bound `‖coeff ν f‖ ≤ C ρ^{-|ν|}` for some `ρ > 1` and `C`),
that radii in `Γ*` suffice, that
`T_n(ρ') ≤ T_n(ρ)` for `ρ ≤ ρ'`, that
`W_n ≤ TauCeti.Huber.restrictedMvPowerSeriesSubring n K` with Gauss norms agreeing (in Lean
`washnitzerAlgebra_le_weightedRestrictedSubring`, the restricted series at trivial weights, with
the inclusion `washnitzerAlgebra.toTate` into the completed Tate algebra),
`washnitzerAlgebra.X` (the variables; `MvPolynomial (Fin n) K → W_n` injective with dense image),
that `W_n` is dense in `T_n` with `W_n ≠ T_n` for `n ≥ 1`,
that `W_0 = K`,
`isUnit_washnitzerAlgebra_iff` (unit in `W_n` iff in `T_n` iff `|f − f(0)| < |f(0)|`, where
`f(0)` is the constant coefficient; for `K = ℚ_p`, `f = 1 + pX` is a unit, `|pX| = p^{-1} < 1 = |1|`,
with inverse `Σ_m (−p)^m X^m ∈ T_1(ρ)` for `ρ < p`, while `f = p + X` is not, `|X| = 1 ≥ p^{-1} = |p|`:
it vanishes at `X = −p`; and `0` is not a unit, `|0| < |0|` being false), that
`∂/∂X_i` preserves `W_n`, with the Cauchy estimate for the Hasse derivative
`∂_i^{[j]}(Σ a_ν X^ν) = Σ binom(ν_i, j) a_ν X^{ν − j e_i}`: `|∂_i^{[j]} f|_ρ ≤ ρ^{-j}|f|_ρ` on `T_n(ρ)`,
valid in every characteristic because `|binom(ν_i, j)| ≤ 1`; in characteristic `0`,
`∂_i^{[j]} = (1/j!)∂_i^j`, which is the form in which Grosse-Klönne writes it, and in characteristic
`p` the expression `(1/j!)∂_i^j` is undefined for `j ≥ p` while `∂_i^{[j]}` is not,
that for `char K = 0` the termwise primitive
`Σ a_ν X^ν ↦ Σ a_ν X^{ν + e_i}/(ν_i + 1)` preserves `W_n`, sending `T_n(ρ)` into `T_n(ρ')` for every
`ρ' < ρ`, because `|1/(ν_i + 1)| ≤ (ν_i + 1)^c` for the constant `c ≥ 0` with `|·| = |·|_p^c` on
`ℚ`, `c = 0` when `|·|` is trivial on `ℚ`; the hypothesis `char K = 0` cannot be dropped: in
characteristic `p` the coefficient `1/(ν_i + 1)` is undefined for `ν_i + 1 = p` and `X^{p−1}` has no
primitive at all, since `d(Σ b_m X^m) = Σ m b_m X^{m−1}` has zero coefficient at `X^{p−1}`, and
that `W_{n+1} ≅ W_n⟨X_{n+1}⟩†` (see *dagger-tensor-product*) (GK00 §1, 1.2, p.
3). *Needs:* RigidAnalyticGeometry §1.5.1–1.5.2. Lean: `Dagger.washnitzerAlgebra`,
`Dagger.washnitzerAlgebra.X`, `Dagger.mem_washnitzerAlgebra_iff`,
`Dagger.isUnit_washnitzerAlgebra_iff`, `Dagger.washnitzerAlgebra_le_weightedRestrictedSubring`,
`Dagger.washnitzerAlgebra.toTate`.

**Checks.**

- Computation: for `K = ℚ_p`, `f = Σ_{m≥0} p^m X^m ∈ W_1`:
  it is restricted at every `ρ < p` (`|p^m| ρ^m = (ρ/p)^m → 0`).
- Non-example: for `K = ℚ_p`,
  `g = Σ_{m≥0} p^m X^{p^m} ∈ T_1` but `g ∉ W_1`: for every `ρ > 1`,
  `|p^m| ρ^{p^m} = p^{-m} ρ^{p^m} → ∞`. A definition `W_n := T_n` fails this test (Lean `example`,
  with the preceding computation).
- Characterisation: for `K = ℚ_p`,
  `h = Σ_m p^m X^{2m} ∈ W_1` (restricted at every `ρ < p^{1/2}`) but `h ∉ T_1(p)`
  (`|p^m| p^{2m} = p^m → ∞`); so the union over `ρ ∈ |ℚ_p^×| ∩ (1,∞) = {p, p^2, …}` is strictly
  smaller than `W_1` (Lean `example`).
- Degenerate: `W_0 = K`, and `W_n` contains
  `MvPolynomial (Fin n) K`.
- Compatibility: `W_n ⊆ TauCeti.Huber.restrictedMvPowerSeriesSubring n K`,
  with equality iff `n = 0`.
- Characterisation: for `K = ℚ_p`: `1 + pX` is a unit of `W_1`
  (`|pX| = p^{-1} < 1`) and `p + X` is not (`|X| = 1 ≥ |p|`; it vanishes at `−p`); for `n = 0` the
  criterion reads `0 < |c|`, i.e. `c ≠ 0`.
- Negative control: for `char K = p` and `f = X^p ∈ W_1`:
  `∂^{[p]} f = binom(p, p) = 1`, so `|∂^{[p]} f|_ρ = 1 ≤ ρ^{-p}|X^p|_ρ = 1` holds, while
  `(1/p!)∂^p f` is undefined (`p! = 0` in `K`); the estimate must be stated for the Hasse derivative.
- Negative control: for `char K = p`, `X^{p−1} ∈ W_1`
  has no primitive in `K[[X]]` (`d(X^p) = pX^{p−1} = 0`); the primitive statement needs
  `char K = 0`.

The two-term unit criterion is also checked directly (Lean `example`):
`1+pX` is invertible over `ℚ_p`, while `p+X` has the zero `−p` in the unit disc.

**Weierstrass division and preparation in `W_n`, and distinguishedness after an automorphism.**
(*overconvergent-weierstrass-division*) Let `n ≥ 1`, write `W_n = K⟨Y_1, …, Y_n⟩†` with the Gauss
norms restricted from `T_n`, `T_{n-1}`, and regard `g ∈ W_n` as `g = Σ_{m≥0} g_m Y_n^m` with
`g_m ∈ W_{n-1}`. Call `g` `Y_n`-distinguished of degree `s` if `g_s` is a unit of `W_{n-1}` and
`|g| = |g_s| > |g_m|` for all `m > s`, and call `ω ∈ W_{n-1}[Y_n]` a Weierstrass polynomial if it is
monic with `|ω| = 1`. Prove: (i) (division) if `g` is `Y_n`-distinguished of degree `s`, every
`f ∈ W_n` can be written uniquely as `f = gq + r` with `q ∈ W_n` and `r ∈ W_{n-1}[Y_n]` of degree
`< s`; (ii) (preparation) such `g` is uniquely `e·ω` with `e` a unit of `W_n` and `ω` a Weierstrass
polynomial of degree `s`; (iii) (distinguishedness) for every `0 ≠ f ∈ W_n` there is a `K`-algebra
automorphism `σ` of `W_n` of the form `Y_i ↦ Y_i + Y_n^{c_i}` (`i < n`), `Y_n ↦ Y_n`, with
`c_i ∈ ℕ`, such that `σ(f)` is `Y_n`-distinguished (GK00 §1, 1.3 (i)–(ii) for division and preparation; 1.3 (iv) for the automorphism). The hypothesis `f ≠ 0` in
(iii) cannot be dropped (`0` has no unit coefficient), and the strict inequality `|g_s| > |g_m|` for
`m > s` is what makes the degree unique. At a fixed radius the division and preparation are Tau
Ceti's: `TauCeti.PowerSeries.IsDistinguished` with `IsDistinguished.existsUnique_mul_add_eq` and
`IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq` over any complete ultrametric
`NormedCommRing` with `NormMulClass`, at any radius `c > 0` in the distinguished variable,
whatever the polyradius of the coefficient ring; `restrictedOptionEquiv` iterates the variables at
unit radius. Distinguishedness does not persist to a common radius `ρ > 1` (the `Y + X²` Check
below), so the passage to `W_n` uses unequal radii. Prove further: (iv) (radius selection) if
`g ∈ W_n` is `Y_n`-distinguished of degree `s` and `f ∈ W_n`, there are a polyradius
`r' = (r_1, …, r_{n-1})` and a radius `r_n`, all `> 1`, such that `f` and `g` are restricted at
`(r', r_n)`, `g_s` is a unit of `T_{n-1}(r')`, and `g`, as a series in `Y_n` over `T_{n-1}(r')`
with the Gauss norm `|·|_{r'}`, is distinguished of degree `s` at radius `r_n`:
`|g_m|_{r'} r_n^m ≤ |g_s|_{r'} r_n^s` for `m < s`, strictly for `m > s`. For the proof, by the unit criterion of
*overconvergent-tate-algebra* `g_s = 1 + h` with `|h| < 1` after scaling `g` by a constant; choose
`r_n > 1` inside the convergence radii of `f` and `g` with `|h|_{r_n} < 1` and
`|g_m|_{r_n} r_n^{m−s} < 1` for all `m > s` (Gauss norms at the constant radius `r_n`; the Gauss
norm of a series restricted at some radius `> 1` is continuous in the radius at `1`, and both
quantities are `< 1` there), then `1 < r_i ≤ r_n` with `|g_m|_{r'} ≤ r_n^{s−m}` for the finitely
many `m < s`. (v) (iteration) `T_n(r', r_n) ≅ T_{n-1}(r')⟨Y_n/r_n⟩`, isometric for the Gauss norms,
the polyradius form of `restrictedOptionEquiv`. Division and preparation over `T_{n-1}(r')`
(complete, with multiplicative Gauss norm, RigidAnalyticGeometry §1.5.1) at radius `r_n` then give
`q`, `e`, `e^{-1}` restricted at `(r', r_n)` and `r`, `ω` with coefficients in `T_{n-1}(r')`, hence
all restricted at the common radius `min_i r_i > 1` and so in `W_n`, resp. `W_{n-1}[Y_n]`;
uniqueness in (i)–(ii), and independence of the chosen radii, follow by comparison with the
unit-radius division and preparation over `T_{n-1}` through `restrictedOptionEquiv`, since
`W_n ⊆ T_n`. What (i)–(v) add to the fixed-radius theorems is this radius selection, the
polyradius iteration, the transport to `W_n`, and the automorphism `σ`. Mathlib's
`PowerSeries.exists_isWeierstrassDivision` is the complete-local-ring form and does not apply.
*Needs:* *overconvergent-tate-algebra*; RigidAnalyticGeometry §1.5.1–1.5.2; Tau Ceti
`TauCeti.PowerSeries.IsDistinguished`, `IsDistinguished.existsUnique_mul_add_eq`,
`IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`, `restrictedOptionEquiv`.

**Checks.**

- All coefficients of the zero series are zero.
- A constant has coefficient `c` in degree zero and zero in degree one.
- With the distinguished variable placed at index `0`, as a formal statement does:
  for `Y + X²`, coefficients in `Y` are `g_1 = 1` and `g_0 = X²`. This fixes the permutation
  from the prose convention, which puts `Y` last.
- Equal radii fail: `g = Y + X² ∈ W_2` is `Y`-distinguished of degree `1` at unit radius, but at
  every common radius `ρ > 1`, `|g_0|_ρ = |X²|_ρ = ρ² > ρ = |g_1|_ρ ρ`, so there `g` is
  distinguished of degree `0`, with `g_0 = X²` not a unit of `T_1(ρ)`: no common radius `> 1`
  carries the fixed-radius division by `g`.
- Unequal radii work: for `1 < r_X` and `r_X² ≤ r_Y`, `|X²|_{r_X} = r_X² ≤ r_Y = |g_1|_{r_X} r_Y`, so
  `Y + X²` is distinguished of degree `1` at radius `r_Y` over `T_1(r_X)`, with leading
  coefficient `1`; dividing `f ∈ W_2` by it gives the remainder `f(X, −X²) ∈ W_1` and a quotient in
  `W_2`.
- The zero series is not distinguished of any degree.
- `1` is distinguished of degree zero.
- Over `ℚ_p`, `Y+p` has degree one, `1+pY` has degree zero,
  and `Y−p⁻¹` has degree zero rather than one.
- Computation: for `K = ℚ_p`, `n = 1`, `g = Y + p`: `g_1 = 1` is a
  unit of `W_0 = K`, `|g| = 1 = |g_1| > |g_0| = p^{-1}`, so `g` is `Y`-distinguished of degree `1`,
  `ω = Y + p` is its Weierstrass polynomial, `e = 1`, and the remainder of `f` is `f(−p) ∈ K`.
- Degenerate: `g = 1 + pY` is distinguished of degree `0`
  (`g_0 = 1`, `|g| = 1 > |g_1| = p^{-1}`), hence a unit; division by it has remainder `0` and
  quotient `f g^{-1}`; the Weierstrass polynomial of degree `0` is `ω = 1`.
- Non-example: `g = Y − p^{-1}` is not distinguished of
  degree `1`: `|g| = p > 1 = |g_1|`. It is distinguished of degree `0` (`|g_0| = p = |g| > |g_1|`), so
  it is a unit of `W_1`, as it must be: it has no zero in the unit disc.
- Degenerate: for `n = 1` every `0 ≠ f = Σ a_m Y^m ∈ W_1` is
  already distinguished (`σ = id`, no `c_i`): the largest `s` with `|a_s| = |f|` exists because
  `|a_m| → 0`.

**`W_n` is a noetherian factorial Jacobson ring and every ideal of `W_n` is strictly closed.**
(*overconvergent-tate-algebra-properties*) For `n ∈ ℕ` prove that `W_n` is noetherian, a unique
factorisation domain and a Jacobson ring, with `W_n/m` a finite field extension of `K` for every
maximal ideal `m`; and that every ideal `I ⊆ W_n` is strictly closed for the Gauss norm: `I` is
closed and for every `f ∈ W_n` the residue norm `inf_{g∈I} |f − g|` is attained, so that the residue
seminorm on `W_n/I` is a norm (GK00 §1, 1.4 (1), (3)–(4)). For one variable the ideal theory at any single
radius — `T_1(ρ)` is a principal ideal ring, noetherian, every ideal generated by a monic polynomial
— is Tau Ceti's `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`, `TauCeti.PowerSeries.isNoetherianRing_isRestricted_subring`
and `exists_isMonicOfDegree_span_singleton_eq`; the union `W_n` over radii and `n ≥ 2` are what this
target adds. *Needs:* *overconvergent-weierstrass-division*; *overconvergent-tate-algebra*; Tau
Ceti `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`, `TauCeti.PowerSeries.isNoetherianRing_isRestricted_subring`,
`exists_isMonicOfDegree_span_singleton_eq`. Lean: `Dagger.washnitzerAlgebra.isNoetherianRing`
(noetherian, factorial and Jacobson).

**`W_n → T_n` is faithfully flat, bijective on maximal ideals with equal residue fields, and `W_n`
is regular of dimension `n`.** (*overconvergent-faithful-flatness*) For `n ∈ ℕ` prove: (a) the
inclusion `W_n ⊆ T_n` is faithfully flat; (b) for every maximal ideal `m` of `T_n`, `m ∩ W_n` is a
maximal ideal of `W_n` and `W_n/(m ∩ W_n) → T_n/m` is bijective, and `m ↦ m ∩ W_n` is a bijection
`Max(T_n) → Max(W_n)`; (c) every maximal ideal of `W_n` is generated by polynomials
`p_1, …, p_n ∈ K[Y_1, …, Y_n]` with `p_i` monic in `Y_i`; (d) `W_n` is a regular ring (Mathlib
`IsRegularRing`), equidimensional of Krull dimension `n`, and the maps of completed local rings
`(W_n)^_{m∩W_n} → (T_n)^_m` are isomorphisms (GK00 §1, Prop. 1.5 and its proof). *Needs:*
*overconvergent-tate-algebra-properties*; RigidAnalyticGeometry §1.5.1–1.5.2;
*overconvergent-tate-algebra*. Lean: `Dagger.washnitzerAlgebra.faithfullyFlat`,
`Dagger.washnitzerAlgebra.existsUnique_isMaximal_comap`, `Dagger.washnitzerAlgebra.isRegularRing`.

### F1.2 dagger algebras

**Dagger algebras over a complete nonarchimedean field.** (*dagger-algebra*) Let `K` be a complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2). A `K`-dagger algebra is a
commutative `K`-algebra `A` for which there exist `n ∈ ℕ` and a surjective `K`-algebra homomorphism
`W_n → A` (equivalently `A ≅ W_n/I` for an ideal `I`). A morphism of dagger algebras is a
`K`-algebra homomorphism (no continuity is imposed; it is automatic, see
*dagger-norm-and-continuity*). `Sp(A)` denotes the set of maximal ideals of `A`. Attached data, each
independent of the presentation up to canonical isomorphism: the residue norm class of a
presentation (see *dagger-norm-and-continuity*), the completion `A → Â` (written `A'` by
Grosse-Klönne), `Â = T_n/IT_n`, a `K`-affinoid algebra (see *dagger-completion-comparison*), the
supremum seminorm `|a|_sup = max_{m ∈ Sp(A)} |a mod m|`, and the integral subring
`A^int = {a ∈ A : |a|_sup ≤ 1} = A ∩ (Â)°`, which is the ring of power-bounded elements of `A`. In
`Dagger`, define the class `IsDaggerAlgebra` by
`∃ (n : ℕ) (φ : washnitzerAlgebra n K →ₐ[K] A), Function.Surjective φ`, the completion
`completion` as `Â = T_n/IT_n` for a chosen minimal presentation, with `toCompletion` the map
`τ : A → Â` (`Â` a `K`-affinoid algebra, `TauCeti.Huber.IsStrictlyTopologicallyFiniteType`,
independent of the presentation up to unique isomorphism under `A`), and `intSubring` as
`A^int := τ⁻¹(TauCeti.Huber.powerBoundedSubring Â)`; prove `IsDaggerAlgebra.washnitzerAlgebra`
(`W_n`), `IsDaggerAlgebra.quotient` (`A ⧸ J`), `IsDaggerAlgebra.of_finite` (finite `A`-algebras, see
*dagger-finite-extension*), `IsDaggerAlgebra.isNoetherianRing` (noetherian and Jacobson, with
residue fields finite over `K`: the quotient case of *overconvergent-tate-algebra-properties*),
that `A^int` is the set of power-bounded elements and equals `{|a|_sup ≤ 1}`,
that `A` is a Tate ring and
`(A, A^int)` a Huber pair (`TauCeti.Huber.Pair`) with completion `(Â, Â°)`, that
`|a|_sup ≤ |a|` for every residue norm, that for `char K = 0`
and `A` reduced `|.|_sup` is equivalent to the residue norm, and `completion_washnitzerAlgebra` (the completion of `W_n` is
`T_n = TauCeti.Huber.restrictedMvPowerSeriesCompletion n K`, compatibly with `W_n → T_n`)
(GK00 §1, 1.2, p. 3). *Needs:*
*overconvergent-tate-algebra*; *overconvergent-tate-algebra-properties*;
*affinoid-supremum-seminorm*, *affinoid-power-bounded-iff-sup* (AdicSpacesPartII layer R0).
Lean: `Dagger.IsDaggerAlgebra`, `Dagger.IsDaggerAlgebra.washnitzerAlgebra`,
`Dagger.IsDaggerAlgebra.quotient`, `Dagger.presentationDim`, `Dagger.presentation`,
`Dagger.presentation_surjective`, `Dagger.completion`, `Dagger.toCompletion`, `Dagger.intSubring`,
`Dagger.IsDaggerAlgebra.isNoetherianRing`, `Dagger.completion_washnitzerAlgebra`.

**Checks.**

- Computation: `A = W_2/(X_1X_2 − 1) = K⟨X, X^{-1}⟩†` is a
  dagger algebra; its completion is `T_2/(X_1X_2 − 1) = K⟨X, X^{-1}⟩`, and `1/(X − a) ∈ A` for
  every `a ∈ K` with `|a| < 1` (Lean `example`: `A` is a dagger algebra and `X − a` is a unit).
- Degenerate: `K = W_0` and the zero ring `W_0/(1)` are dagger
  algebras; `Sp(K)` is a point.
- Non-example: `K[X]` is not a dagger algebra: the maximal
  ideals `(X − c)`, `c ∈ K`, give `|X|_sup = ∞`, whereas every dagger algebra has finite supremum
  seminorm. (A definition 'finitely generated `K`-subalgebra of `T_n`' would admit `K[X]`.)
  (Lean `example`.)
- Non-example: `W_1` is a dagger algebra that is not
  complete for its norm: `Σ_{m≤N} p^m X^{p^m}` is Cauchy in `W_1` (`K = ℚ_p`) with limit in
  `T_1 ∖ W_1`; so 'dagger algebra = affinoid algebra' is false.
- Characterisation: `W_n^int = W_n ∩ O_K[[X]]`: a series in `W_n` is
  power-bounded iff all its coefficients lie in `O_K`.
- Compatibility: the completion of `W_n` is (isomorphic to)
  `TauCeti.Huber.restrictedMvPowerSeriesCompletion n K`, compatibly with the inclusions of
  `MvPolynomial (Fin n) K`.

The auxiliary `presentationDim K A` is the least number of variables in a surjective
presentation, and `presentation K A` chooses a surjection at that dimension. This convention
makes the field, disc and dual-number dimensions `0, 1, 1`; the norm topology is independent of the chosen surjection, and the completions agree
canonically under the algebra. It does not identify presentation dimension with Krull
dimension: the dual numbers have Krull dimension zero.

**Noether normalisation for dagger algebras and finiteness of residue fields.**
(*dagger-noether-normalisation*) Let `A` be a `K`-dagger algebra. Prove: (a) if `A ≠ 0` there are
`d ∈ ℕ` and an injective finite `K`-algebra homomorphism `W_d → A` (for `A = 0`, a dagger algebra,
no `K`-algebra map `W_d → 0` is injective, so the hypothesis `A ≠ 0`, in Lean `[Nontrivial A]`,
cannot be dropped; Lean `example`); (b) if the nilradical of an ideal `q ⊆ A` is
a maximal ideal, then `A/q` is finite-dimensional over `K`; in particular `A/m` is a finite field
extension of `K` for every maximal ideal `m` (in Lean part of `IsDaggerAlgebra.isNoetherianRing`); (c) if
`φ : W_n → B` is a finite morphism of dagger
algebras whose kernel contains a Weierstrass polynomial `ω ∈ W_{n-1}[Y_n]`, then `W_{n-1} → B` is
finite (GK00 §1, 1.3 (iii); 1.4 (2)–(3) for (a)–(b)). *Needs:* *overconvergent-weierstrass-division*; *dagger-algebra*;
*overconvergent-faithful-flatness*; *overconvergent-tate-algebra-properties*.
Lean: `Dagger.exists_finite_injective_washnitzer`.

**Residue norms on dagger algebras and automatic continuity of morphisms.**
(*dagger-norm-and-continuity*) Let `A = W_n/I` be a `K`-dagger algebra with a presentation. Prove:
(1) the residue seminorm `|a| = inf{|f| : f ∈ W_n, f ↦ a}` (Gauss norm on `W_n`) is a `K`-algebra
norm on `A`, and the induced map `α : W_n/I → T_n/IT_n` is the completion of `(A, |·|)`, an
isometric embedding with dense image; (2) every `K`-algebra homomorphism `φ : W_n/I → W_m/J` between
dagger algebras, with no continuity assumed, is continuous for the residue norms. Consequently the
residue norms of any two presentations of `A` are equivalent, every dagger algebra carries a
canonical equivalence class of norms (its 'affinoid topology'), and every finite `A`-module `M`
carries a canonical topology, the one induced from the finite `Â`-module `M ⊗_A Â`, for which all
`A`-linear maps of finite modules are continuous (GK00 §1, Prop. 1.6 (1)–(2) and 1.11). *Needs:*
*overconvergent-tate-algebra-properties*; *overconvergent-faithful-flatness*;
*dagger-noether-normalisation*; *overconvergent-tate-algebra*; *dagger-algebra*;
*affinoid-power-bounded-iff-sup* (AdicSpacesPartII layer R0).

**Dagger algebras (and affinoid algebras) are excellent in characteristic 0.**
(*dagger-algebra-excellent*) Excellence is the notion of SchemeAndStackFoundations layer SF.0
(*excellent-ring*: a G-ring that is J-2 and whose finite-type algebras are catenary, the G-ring and
quasi-excellent predicates being SF.0's G-ring definition and *quasi-excellent-ring*), from
which two consequences are used as SF.0 states them: finite-type algebras over an excellent ring are
excellent and, for a local G-ring `A_m`, `A_m` is reduced (resp.
normal) iff its completion is (*regular-map-completion*). What is new here is the excellence of the
two base rings. Prove that for `K` a field complete for a nontrivial nonarchimedean absolute value of
rank one with `char K = 0` (`NontriviallyNormedField K`, `IsUltrametricDist K`, `CompleteSpace K`,
`CharZero K`), `W_n = K⟨X_1, …, X_n⟩†` and `T_n = K⟨X_1, …, X_n⟩` are excellent rings; consequently
(finite-type algebras over excellent rings being excellent) every `K`-dagger algebra and every `K`-affinoid algebra is
excellent, and (by SchemeAndStackFoundations *regular-map-completion*) for `A` a dagger algebra and
`m` a maximal ideal the
local ring `A_m` is reduced (resp. normal) iff its completion is (GK00 §1, proof of Thm 1.7 (3),
p. 5, which uses excellence without proof; Conrad-IC §1.1, p. 3, for the characteristic-0 route,
transposed from `T_n` to `W_n`; characteristic `p` (Kiehl) is excluded). For `K = ℚ_p`, `W_1` is
excellent and the completion of `K⟨X,Y⟩†/(Y^2 − X^3)` at `(X,Y)` is `K[[X,Y]]/(Y^2 − X^3)`, reduced
but not normal, matching the dagger algebra. *Needs:* *overconvergent-faithful-flatness*;
*overconvergent-tate-algebra*; *dagger-algebra*; SchemeAndStackFoundations layer SF.0
(*excellent-ring*, *quasi-excellent-ring*, *regular-map-completion*); Mathlib
`IsRegularRing`.

**A dagger algebra and its completion: faithful flatness, points, completed local rings, reducedness
and regularity, supremum norm.** (*dagger-completion-comparison*) Let `K` be a complete rank-one
nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2) and `A` a `K`-dagger algebra with
completion `τ : A → Â`. Then: (1) `τ` is faithfully flat and `m ↦ τ^{-1}(m)` is a bijection
`Max(Â) → Max(A)` with isomorphic residue fields; (2) for corresponding maximal ideals `τ` induces
isomorphisms of completed local rings `A^_{τ^{-1}m} ≅ Â^_m`; (3) `A` is regular if and only if `Â`
is (regularity of a noetherian local ring is detected on its completion, so this uses only (2)); if
`Â` is reduced (resp. normal) then so is `A` (`A ⊆ Â`, and normality descends along the faithfully
flat `τ`); and, for `char K = 0`, where *dagger-algebra-excellent* supplies the excellence of `W_n`
and `T_n`, if `A` is reduced (resp. normal) then so is `Â`, so that `A` is reduced (resp. normal)
iff `Â` is (Grosse-Klönne's proof, under his hypothesis `char K = 0` or `[K : K^p] < ∞` of
*dagger-approximation*, passes through the excellence of `W_n` and `T_n`; no source states the
forward implication without excellence, and the characteristic-`p` case, which would need Kiehl's
excellence theorem for `T_n` together with the excellence of `W_n`, is not claimed here); (4) under
the same hypothesis `char K = 0`, if `A` is reduced, the supremum seminorm
`|·|_sup` on `A` is a norm lying in the canonical norm class of *dagger-norm-and-continuity* (that
`|·|_sup` is a norm on a reduced `A` needs no hypothesis: `|a|_sup = 0` means `a` lies in every maximal
ideal, hence is nilpotent, `A` being Jacobson; that it is equivalent to the residue norm forces `Â` to
be reduced, since a nilpotent `ε ∈ Â` is a limit of `a_k ∈ A` with `|a_k|_sup → |ε|_sup = 0`, and
equivalence would give `|a_k| → 0`, `ε = 0`). Moreover the completion is
functorial: every morphism `φ : A → B` of dagger algebras extends uniquely to a continuous
`K`-algebra map `φ̂ : Â → B̂`, and `φ ↦ φ̂` is a functor (GK00 §1, Thm 1.7 (1), p. 5). *Needs:*
*overconvergent-faithful-flatness*; *dagger-norm-and-continuity*; *dagger-algebra*;
*reduced-affinoid-supremum-norm* (AdicSpacesPartII layer R0); *dagger-algebra-excellent*.
Lean: `Dagger.completion_isAffinoid` (`Â` is affinoid and `τ` is faithfully flat).

**Dagger algebras are weakly complete; elements of `A^int` with reduction `1` are units.**
(*dagger-weak-completeness*) Let `A` be a `K`-dagger algebra. Prove: (a) `A` is weakly complete: for
all power-bounded `x_1, …, x_n ∈ A` (equivalently `x_i ∈ A^int`) the `K`-algebra map
`K[X_1, …, X_n] → A`, `X_i ↦ x_i`, extends uniquely to a continuous `K`-algebra homomorphism
`W_n → A`; moreover for every `ρ > 1` the composite `T_n(ρ) → T_n → Â` factors through the stage
`A_{ρ'}` of any fringe presentation of `A` (see *fringe-presentation*); (b) if `a ∈ A` is
topologically nilpotent (`|a|_sup < 1`) then `1 − a` is a unit of `A` with inverse `Σ_{k≥0} a^k`; in
particular every element of `A^int` whose image in `A^int/{|·|_sup < 1}` is `1` is a unit; (c) an
element `a ∈ A` is a unit iff its image in `Â` is a unit (`isUnit_iff_isUnit_completion`; GK00 §1,
Thm 1.7(1) (faithful flatness of `τ`, which reflects units); 1.9 for the weak-completeness clauses
(a)–(b)). *Needs:* *dagger-algebra*;
RigidAnalyticGeometry §1.5.1–1.5.2; *dagger-norm-and-continuity*; *dagger-completion-comparison*;
*fringe-morphism-factorisation*; *fringe-presentation*. Lean: `Dagger.isUnit_iff_isUnit_completion`.

**Finite algebras over a dagger algebra are dagger algebras.** (*dagger-finite-extension*) Let `A`
be a `K`-dagger algebra and `A → B` a finite `K`-algebra homomorphism (`B` finitely generated as an
`A`-module). Prove that `B` is a `K`-dagger algebra; more precisely, if `A = W_n/IW_n` and
`B = (W_n/JW_n)[X]/(f)` with `I ⊆ J ⊆ T_n(λ_0)` and `f ∈ T_n(λ_0)[X]` monic with `X` power-bounded
in the finite affinoid algebra `T_n(λ_0)[X]/(J + (f))`, then `B ≅ W_{n+1}/(J + f)W_{n+1}`, and for `1 ≤ λ ≤ λ_0` the stages are
`D_λ = T_n(λ)[X]/(J + f) ≅ T_{n+1}(λ)/(J + f)` (GK00 §1, Lem. 1.10). The construction has two
steps. (i) One generator at a time: for generators `b_1, …, b_m` of `B` as an `A`-module, each
`A_k = A[b_1, …, b_k]` is finite over `A` and generated over `A_{k−1}` by one element, integral
over `A_{k−1}`, so `A_k` is a quotient of `A_{k−1}[X]/(f)` with `f` monic; as quotients of dagger
algebras are dagger algebras, it suffices to treat `A[X]/(f)` with `f` monic. The induction cannot
be skipped: `K[ε, δ]/(ε, δ)²` has dimension `3`, while every subalgebra generated by one element has
dimension at most `2`. (ii) The monic case, with a rescaled generator: write `A = W_n/I`, choose
`λ_0 > 1` with `I` generated in `T_n(λ_0)` and lift `f = X^d + a_1X^{d−1} + … + a_d` with
`a_i ∈ T_n(λ_0)`; pick `c ∈ K^×` with `|c^i a_i| ≤ 1` for the residue norm of the stage
`A_{λ_0} = T_n(λ_0)/I`. Then `Y = cX` is a root of the monic
`g(Y) = Y^d + ca_1Y^{d−1} + … + c^d a_d`, whose coefficients have residue norm `≤ 1 ≤ λ^i` at every
stage `A_λ`, `1 < λ ≤ λ_0`; so `Y` is power-bounded there — the hypothesis on the generator in
the precise statement above — and division by `g` identifies `A_λ[Y]/(g)` with
`A_λ⟨λ^{-1}Y⟩/(g) = T_{n+1}(λ)/(I + g)`. In the colimit `λ → 1`, `A[X]/(f) ≅ W_{n+1}/(I + g)`,
with stages `T_{n+1}(λ)/(I + g)` and generators sent by `X_i ↦ X_i` (`i ≤ n`) and
`X_{n+1} ↦ cX`. *Needs:* *dagger-algebra*;
*fringe-presentation*; RigidAnalyticGeometry §1.5.1–1.5.2. Lean: `Dagger.IsDaggerAlgebra.of_finite`.

**Checks.**

- Non-example (the rescaling is needed): for `A = K` and `0 < |π| < 1`,
  `K[X]/(X − π^{-1}) ≅ K`, but `X − π^{-1} = −π^{-1}(1 − πX)` is a unit of `W_1` (`Σ π^mX^m` is
  restricted at every radius `ρ < |π|^{-1}`), so the unscaled presentation `W_1/(X − π^{-1})` is
  `0` (Lean `example`).
- Computation: with `c = π` the relation becomes `Y − 1` and `W_1/(Y − 1) ≅ K`.
- Positive control: for `X − a` with `|a| ≤ 1` the coefficient is already power-bounded and
  evaluation at `a` gives `W_1/(X − a) ≅ K`, sending `X` to `a` (Lean `example`).
- Non-example (the induction is needed): `K[ε, δ]/(ε, δ)²` is not generated by one element
  (Lean `example`); it is reached from `K` in two steps.

**Finiteness, surjectivity, injectivity and strictness of morphisms of dagger algebras are detected
on completions.** (*dagger-finite-morphism-comparison*) Let `K` be a complete rank-one
nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2) and `φ : A → B` a morphism of `K`-dagger
algebras with completion `φ̂ : Â → B̂`. Then: (a) `φ` is surjective (resp. bijective) iff `φ̂` is;
(b) the following are equivalent: (i) `φ` is finite, (ii) `φ̂` is finite, (iii) the map of
reductions `φ̃ : Ã → B̃` (`R̃ = R°/R°°` for the sup norm) is finite; (c) if `φ` is finite, `φ` is
injective iff `φ̂` is; (d) if `φ` is finite, the norm class on `B` from *dagger-norm-and-continuity*
coincides with the class of `B` as a finite `A`-module, and `Â ⊗_A B → B̂` is an isomorphism; (e) if
`φ` is finite, `φ` and `φ̂` are strict (GK00 §1, Thm 1.12 (b), p. 7); strictness of `φ̂` is Tau
Ceti's `LinearMap.isStrictMap_of_module_finite` (`Â` a complete Tate ring, `B̂` a finite
`Â`-module), and strictness of `φ` itself, `A` and `B` being incomplete, is what (e) adds. *Needs:*
*dagger-finite-extension*; *dagger-completion-comparison*; *dagger-norm-and-continuity*;
*dagger-weak-completeness*; *overconvergent-weierstrass-division*; *affinoid-reduction-finite*
(AdicSpacesPartII layer R0); Tau Ceti `LinearMap.isStrictMap_of_module_finite`.

**Checks.**

- Non-example (finiteness is needed in (e)): `X ↦ πX` on `W_1`, and on `T_1`, is injective but
  not strict, the images `π^mX^m` of the unit-norm `X^m` tending to `0`.
- Positive control: the identity of `W_1` is finite and strict.

**Approximation of solutions and of morphisms from the completion (Bosch's rigid Artin
approximation).** (*dagger-approximation*) Let `K` be a complete rank-one nonarchimedean field (as
in RigidAnalyticGeometry §1.5.1–1.5.2). Assume moreover `char K = 0` or `[K : K^p] < ∞`, the hypothesis
under which Vezzani states the morphism form (Vezzani §2, Prop. 2.8); Grosse-Klönne's 1.13 and 1.15
state none. (1) (Bosch) Let `I ⊆ W_n`, `A = W_n/I ⊆ Â = T_n/IT_n` with a Banach norm `|·|_Â`, and
let `(f_i)_{i∈Λ}` be elements of `A⟨Y_1, …, Y_m⟩† = W_{n+m}/IW_{n+m}`. If there are
`ȳ_1, …, ȳ_m ∈ Â` with `|ȳ_j|_sup ≤ 1` and `f_i(ȳ) = 0` for all `i`, then for every `δ > 0` there
are `y_1, …, y_m ∈ A` with `|y_j|_sup ≤ 1`, `f_i(y) = 0` for all `i`, and `|y − ȳ|_Â < δ`. (2) Let
`p_1 : A_1 → B_1` and `p_2 : A_2 → B_2` be surjective morphisms of dagger algebras, and
`φ_A : Â_1 → Â_2`, `φ_B : B̂_1 → B̂_2` morphisms with `φ_B ∘ p̂_1 = p̂_2 ∘ φ_A`. Then there are
morphisms `γ_A : A_1 → A_2` and `γ_B : B_1 → B_2` with `γ_B ∘ p_1 = p_2 ∘ γ_A`, and for given
`ε > 0` and a Banach norm on `Â_2`, `γ_A` can be chosen with `|γ̂_A − φ_A| < ε`; if `φ_A` is an
isomorphism, `γ_A` can be chosen an isomorphism. In particular two dagger algebras with isomorphic
completions are isomorphic (non-canonically) (GK00 §1, Prop. 1.13, p. 8, for equations; Lem. 1.15, pp. 8–9, for quotient diagrams; Vezzani §2, Prop. 2.8, p. 5, for uniform approximation on the unit ball and the isomorphism clause). *Needs:*
*dagger-finite-morphism-comparison*; *dagger-completion-comparison*; *dagger-algebra*;
*dagger-weak-completeness*.

**Checks.**

- `ℚ` satisfies the characteristic-zero alternative.
- `𝔽_p` has Frobenius degree one.
- `𝔽₂(t)` has Frobenius degree two, although `t` is not
  a square; the hypothesis does not mean perfectness.

**Reduced dagger algebras are integrally closed in their completions; `A` is a domain iff `Â` is.**
(*dagger-domain-and-integral-closure*) Let `A` be a `K`-dagger algebra with completion `Â`. Prove:
(1) if `A` is reduced, `A` is integrally closed in `Â`: every element of `Â` integral over `A` lies
in `A` (deduced from *dagger-approximation* (1), hence under its hypothesis `char K = 0` or
`[K : K^p] < ∞`; Grosse-Klönne states (1) without a field hypothesis, and Vezzani cites
Bosch–Dwork–Robba, Math. Ann. 252 (1979/80), Theorem 2, for it); (2) if `Â` is an integral domain
then so is `A` (a subring of a domain), and, under the hypothesis of (1), if `A` is an integral domain
then so is `Â`, so that `A` is a domain iff `Â` is. The forward direction of (2) depends on (1) and
inherits its hypothesis: with `W_d → A` finite injective (*dagger-noether-normalisation*),
`Â = A ⊗_{W_d} T_d`, and for `A = W_d[Y]/(Y² − g)` with `g ∈ W_d` not a square, `Â` is a domain
exactly when `g` is not a square in `T_d`, which is what (1) for the reduced algebra `W_d` gives (a
square root `h ∈ T_d` of `g` is integral over `W_d`, hence lies in `W_d`) (GK00 §1, Prop. 1.14 (1)).
Degenerate cases: `A = 0` is not a domain and neither is `Â = 0`; `A = K` has `Â = K`. *Needs:*
*dagger-approximation*;
*dagger-finite-extension*; *dagger-finite-morphism-comparison*; *dagger-completion-comparison*;
*dagger-noether-normalisation*.

The completed-local-ring comparison of *dagger-completion-comparison* (2) identifies,
for corresponding maximal ideals `m ⊂ A`, `m' ⊂ Â`, `AdicCompletion m A`
with `AdicCompletion m' Â` and fixes the image of every `a ∈ A` (GK00 Theorem 1.7(2), p. 5).
For a finite `φ : A → B`, the identification `Â ⊗_A B ≅ B̂` of *dagger-finite-morphism-comparison*
(d) sends `a ⊗ b` to `φ̂(a)τ_B(b)`; the strictness in (e) uses the affinoid topologies
on the incomplete dagger algebras (GK00 Theorem 1.12(d)–(e), pp. 7–8).

The polynomial embedding `K[X] → W_n` is injective with dense image for the unit Gauss norm;
termwise primitives are bounded from radius `ρ` to any positive
`σ < ρ` in characteristic zero (the primitive estimate of *overconvergent-tate-algebra*). Every
maximal ideal of `W_n` is generated by
one monic polynomial in each coordinate (*overconvergent-faithful-flatness* (c); GK00
Proposition 1.5, p. 4). The remaining map and topology comparisons of Theorem 1.12
(pp. 7–8) are the bijectivity clause (a) of *dagger-finite-morphism-comparison*, the topology
clause of (d), and the two forms of (b), through the reduction of the completion and through the
reduction of the dagger algebra itself; the last identifies the reduction ideals by
`|a|_sup < 1` and uses the quotient
of the restricted map. The normality comparison of *dagger-completion-comparison* (3) is the
characteristic-zero statement; its faithfully flat descent direction holds without that restriction
(GK00 Theorem 1.7(3) and its proof, p. 5).

Part (1) of *dagger-approximation* is simultaneous equation approximation (GK00 Proposition 1.13,
pp. 8–9), preserving the coefficient copy of `A` and the unit spectral bounds; part (2) is
Lemma 1.15 (pp. 8–9), with uniform approximation on
the unit ball as in Vezzani Proposition 2.8; both require finite Frobenius degree in positive
characteristic. The error is measured by a continuous seminorm on the completion.

### F1.3 fringe presentations and the fringe topology

**Fringe (radius-indexed) presentations of a dagger algebra.** (*fringe-presentation*) Let `K` be a
complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2) and `A` a `K`-dagger
algebra. A fringe presentation of `A` consists of `n ∈ ℕ`, a radius `ρ_0 ∈ Γ*` with `ρ_0 > 1`,
elements `f_1, …, f_r ∈ T_n(ρ_0)`, and a `K`-algebra isomorphism `W_n/(f_1, …, f_r)W_n ≅ A`. For
`ρ ∈ Γ* ∩ (1, ρ_0]` put `A_ρ := T_n(ρ)/(f)T_n(ρ)`, a `K`-affinoid algebra (see
RigidAnalyticGeometry §1.5.1–1.5.2), with transition maps `A_{ρ'} → A_ρ` for `ρ ≤ ρ'` induced by
`T_n(ρ') ⊆ T_n(ρ)`, and put `A_1 := T_n/(f)T_n`. Then `A = colim_{ρ → 1+} A_ρ` as `K`-algebras, and
`A_1 = Â` is the completion. The fringe algebra of the presentation at radius `ρ` is the image
`B_ρ ⊆ A` of `A_ρ` (equivalently of `T_n(ρ)`); `A_ρ → A` need not be injective. Geometrically,
`X_ρ = Sp(A_ρ)` is a decreasing family of affinoids with `⋂_ρ X_ρ = Sp(Â)` and `Sp(Â) ⊆ X_ρ` the
Weierstrass domain `{|X_1|, …, |X_n| ≤ 1}`; this situation is written `Sp(Â) ⊂† X_ρ`. In `Dagger`,
define fringe presentations as a structure (`n`, `ρ_0`, `f : Fin r → T_n(ρ_0)`,
`e : W_n ⧸ Ideal.span (range f) ≃ₐ[K] A`), their stages `A_ρ`,
the transition maps `A_{ρ'} → A_ρ` (with their identity and
composition laws), the compatible maps `A_ρ → A` and
the fringe algebras `B_ρ := range (A_ρ → A)` (`A = ⋃_ρ B_ρ`); prove
that every dagger algebra has one, that
`A = colim_ρ A_ρ` in `K`-algebras, that
`T_n/(f)T_n = Dagger.completion K A` under `A`, that
`Â = A_ρ⟨X_1, …, X_n⟩` (the Tau Ceti rational localisation of `(A_ρ, A_ρ°)` at `T = {X_i}`,
`s = 1`), that morphisms factor through some `B_{ρ'}` (see
*fringe-morphism-factorisation*), that for `A` reduced
`A^+ := colim_ρ (A_ρ)° ⊆ A` is open, bounded and integrally closed, `(A, A^+)` is a Huber pair with
completion `(Â, Â^+)`, `Â^+` the integral closure of `O_K + Â°°`, and `Spa(Â, Â^+)` is the universal
compactification of `Sp Â` and the weak inverse limit of the `Sp(A_ρ)` (Vezzani A.14, A.22), and
that two fringe presentations give cofinal, hence isomorphic, ind-systems
of affinoid algebras under `A` (GK00 §1, Lem. 1.8, p. 6). *Needs:* *dagger-algebra*;
RigidAnalyticGeometry §1.5.1–1.5.2; *overconvergent-tate-algebra-properties*;
*overconvergent-tate-algebra*; *dagger-norm-and-continuity*.

**Checks.**

- Computation: for `A = W_n` with the identity
  presentation, `A_ρ = T_n(ρ)`, the fringe algebras are the `T_n(ρ)`, and `colim_ρ A_ρ = W_n`.
- Degenerate: for `A = K` (`n = 0`, no relations) every `A_ρ`
  is `K` and the only fringe algebra is `K`.
- Non-example: let `0 < |π| < 1` and
  `g = Σ_m π^m X^{2m} = (1−πX²)⁻¹ ∈ W_1`. Present `W_1` using two generators `X, g`,
  with relation `(1−πX_1²)X_2−1`. At an admissible radius
  `|π|⁻¹ᐟ² < ρ < |π|⁻¹` the image of the second coordinate contains `g`, whereas
  `g ∉ T_1(ρ)` because `|π|^m ρ^{2m}` does not tend to zero. Thus the fringe algebra
  differs from that of the identity presentation at the same radius.
- Compatibility: the algebra at radius `1` of any fringe
  presentation of `A` is the completion `Â`, i.e. `T_n/(f) ≅ Dagger.completion A` under `A`.
- Computation: for `A = W_2/(X_1X_2 − 1)`, `X_ρ = Sp(A_ρ)` is
  the annulus `ρ^{-1} ≤ |X| ≤ ρ` and `⋂_ρ X_ρ` is the circle `|X| = 1 = Sp(Â)`.
- Non-example: `A_ρ → A` need not be injective: for
  `c ∈ K` with `1 < |c|` and the presentation `W_1/(X − c)` (relation `X − c ∈ T_1(ρ_0)` for every
  `ρ_0`), `X − c` is a unit of `W_1` (`|X| = 1 < |c|`, *overconvergent-tate-algebra*), so `A = 0`,
  while `A_ρ = T_1(ρ)/(X − c) ≅ K` (evaluation at `c`) for `|c| ≤ ρ ≤ ρ_0` and `A_ρ = 0` for
  `1 < ρ < |c|` (`X − c` is a unit of `T_1(ρ)`, `|X|_ρ = ρ < |c|`); the stages `K` near `ρ_0` map
  non-injectively to `A = 0`, and `colim_{ρ→1+} A_ρ = 0 = A` as it must.

**Morphisms of dagger algebras respect fringe systems (independence of fringe presentations).**
(*fringe-morphism-factorisation*) Let `ψ : A → B` be a morphism of `K`-dagger algebras and choose
fringe presentations `A = W_n/(f_1, …, f_r)` with `f_i ∈ T_n(λ_A)` and `B = W_m/(g_1, …, g_s)` with
`g_j ∈ T_m(λ_B)`, `λ_A, λ_B ∈ Γ*`, `λ_A, λ_B > 1`. Prove that for every `λ ∈ Γ*` with `λ_A ≥ λ > 1`
there is `λ' ∈ Γ*` with `λ_B ≥ λ' > 1` such that `A_λ → A → B` factors through `B_{λ'} → B`.
Consequently every fringe algebra of `A` maps into a fringe algebra of `B`; any finitely many fringe
algebras of `A` (from any presentations) lie in a common fringe algebra; and two fringe
presentations of the same `A` give mutually cofinal ind-systems of affinoid algebras (GK00 §1, Lem.
1.8). *Needs:* *fringe-presentation*; RigidAnalyticGeometry §1.5.1–1.5.2; *dagger-norm-and-continuity*;
*overconvergent-tate-algebra-properties*.

**The fringe (direct limit) topology on dagger algebras and their finite modules.**
(*fringe-topology*) Let `K` be a complete rank-one nonarchimedean field (as in
RigidAnalyticGeometry §1.5.1–1.5.2) and `A` a `K`-dagger algebra. The fringe topology on `A` is the
finest locally `K`-convex topology for which every map `A_ρ → A` of a fringe presentation is
continuous, `A_ρ` carrying its Banach topology; equivalently the direct limit of the intrinsic
Banach topologies of the fringe algebras of `A`. It does not depend on the fringe presentation, is
Hausdorff, is finer than the norm (affinoid) topology of *dagger-norm-and-continuity*, and every
`K`-algebra homomorphism of dagger algebras is continuous for it. A finite `A`-module `M` carries
the fringe topology obtained as the quotient topology from `A^r ↠ M` (equivalently by base extension
from a module over a fringe algebra), independent of choices; `A`-linear maps of finite modules are
continuous. If `K` is spherically complete (nested nonempty closed balls have nonempty
intersection; in particular if `K` is discretely valued), `A` with its fringe
topology is a complete reflexive Hausdorff locally convex `K`-space. In `Dagger`, define
the fringe topology as this `TopologicalSpace` on `A` (the final locally convex topology of the maps
`A_ρ → A`) and the module fringe topology of a finite `A`-module (independent of
the surjection `A^r ↠ M`); prove independence of the presentation, that
morphisms are continuous, that it is finer than the
affinoid topology and Hausdorff, that it makes `A` a topological `K`-algebra,
that it is complete and reflexive for `K` spherically complete, and
that each `A_ρ → A` is continuous, a map to a Banach space being
continuous iff all composites `A_ρ → A → E` are (GK00 §4, 4.2, p. 19). *Needs:*
*fringe-presentation*; *fringe-morphism-factorisation*; *fringe-module-descent*;
*dagger-norm-and-continuity*.

**Checks.**

- Negative control: for an ultrametric
  seminorm `q` continuous on every stage of a fringe presentation, `{q ≤ −1}` is
  not a neighbourhood of zero for the fringe topology, whereas `{q < 1}` is.
  The positive-radius clause tests the topology generated by the stage maps
  (GK00 §4.2, p. 19); negative radii cannot supply nonempty nested balls: the closed ball of
  radius `−1` centred at zero is empty, even over `ℚ_p`, so the nested-ball completeness
  hypothesis quantifies over nonnegative radii, for which each ball is nonempty.
- Degenerate: for `A = K` the fringe topology is the valuation
  topology.
- Non-example: the fringe topology on `W_1` is strictly finer
  than the Gauss-norm topology: over `ℚ_p` the partial sums `g_N = Σ_{m≤N} p^m X^{p^m}` form a
  Gauss-norm Cauchy sequence which is not Cauchy for the fringe topology, as witnessed by the
  fringe-continuous seminorm `q(f) = sup_k |a_k| p^{√k}` (continuous on each `T_1(ρ)`, `ρ > 1`,
  since `p^{√k} = O(ρ^k)`), for which `q(g_N − g_M) → ∞`. Likewise `h_m = p^{⌊√m⌋}X^m → 0` in the
  Gauss norm but `q(h_m) ≥ 1`.
- Computation: for `A = W_1` and `f ∈ T_1(ρ)`, the sequence of
  truncations of `f` converges to `f` in the fringe topology (it converges in `T_1(ρ')` for
  `ρ' < ρ`).
- Compatibility: on each fringe algebra `T_n(ρ)` of `W_n` the
  fringe topology restricts to a topology coarser than the `ρ'`-Gauss norm topology for every
  `ρ' ∈ (1, ρ]` (for `ρ' = 1` the comparison goes the other way) and finer than the Gauss norm
  topology of `T_n`.

**Finite modules and their morphisms descend to a fringe stage.** (*fringe-module-descent*) Let
`ρ_0 ∈ Γ*` with `ρ_0 > 1`, `I ⊆ T_n(ρ_0)` an ideal, `A = W_n/IW_n` and `A_ρ = T_n(ρ)/IT_n(ρ)` for
`ρ ∈ Γ* ∩ (1, ρ_0]`. Prove: (1) for every finite `A`-module `M` there are `ρ`, a finite `A_ρ`-module
`M_ρ` and an isomorphism `M ≅ M_ρ ⊗_{A_ρ} A`; (2) for finite `A_ρ`-modules `M_1, M_2` and an
`A`-linear map `ν : M_1 ⊗_{A_ρ} A → M_2 ⊗_{A_ρ} A` there is, after shrinking `ρ`, a `A_ρ`-linear
`ν_ρ : M_1 → M_2` with `ν = ν_ρ ⊗ A` (after base change to the smaller radius); if `ν` is an
isomorphism, `ν_ρ` can be chosen an isomorphism (GK00 §2, Lem. 2.15 (1) for objects and (2) for morphisms, pp. 12–13). *Needs:*
*fringe-presentation*; *overconvergent-tate-algebra-properties*.

The descended map is specified through its action on
pure tensors and may be chosen invertible when the original map is.
Isomorphisms and exact finite diagrams are detected
at a smaller radius, with injectivity and surjectivity at the endpoints retained.
The comparison maps use the actual quotient stages, without assuming their maps to `A` injective.

For the topology in GK00 §4.2 (p. 19), the topology of a presentation is generated by
translated balls of all ultrametric `K`-seminorms whose pullbacks to every stage are
continuous; a seminorm is continuous for it iff its pullback to every stage is, which is its
universal property.
Here “locally convex” means the nonarchimedean seminorm notion, rather than convexity over
an ordered field. The finite-module topology is the quotient topology for every surjection
`A^n → M`.
The characteristic equations of the transition maps and of the stage maps to `A` identify radius
restriction
and the map through the specified presentation on every series representative; their
identity and composition equations fix the direction of the radius system (GK00 §1.8, p. 6).

### F1.4 tensor products and rational localisation

**The dagger (overconvergent completed) tensor product `A_1 ⊗†_B A_2`.** (*dagger-tensor-product*)
Let `K` be a complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2) and let
`α_1 : B → A_1`, `α_2 : B → A_2` be morphisms of `K`-dagger algebras with surjections
`f_1 : W_{n_1} → A_1`, `f_2 : W_{n_2} → A_2`. Define `A_1 ⊗†_B A_2` as the image of
`W_{n_1+n_2} = K⟨X, Y⟩†` under the continuous map `T_{n_1+n_2} → Â_1 ⊗̂_{B̂} Â_2` into the completed
tensor product of the `K`-affinoid algebras `Â_1`, `Â_2` over `B̂` that sends `X_i ↦ f̂_1(X_i) ⊗ 1`
and `Y_j ↦ 1 ⊗ f̂_2(Y_j)`. It is a `K`-dagger algebra with maps `ι_i : A_i → A_1 ⊗†_B A_2`,
independent of the surjections up to unique isomorphism, and it is the pushout of `α_1, α_2` in the
category of dagger algebras: for morphisms `u_i : A_i → C` with `u_1α_1 = u_2α_2` there is a unique
`u : A_1 ⊗†_B A_2 → C` with `u ι_i = u_i`. Its completion is `Â_1 ⊗̂_{B̂} Â_2`. Equivalently
(Kedlaya06 §2.3, Def. 2.3.8) `A_1 ⊗†_K A_2` is the direct limit of the completed tensor products `B_1 ⊗̂_K B_2` of
fringe algebras `B_i` of `A_i`. Notation: for `λ ∈ Γ*`, `K⟨λ^{-1}Z⟩† := ⋃_{ρ>λ} K⟨ρ^{-1}Z⟩` and
`A⟨λ^{-1}Z⟩† := A ⊗†_K K⟨λ^{-1}Z⟩†`, `A⟨Z⟩† := A⟨1^{-1}Z⟩†`. In `Dagger`, define the dagger
tensor product `A₁ ⊗†[B] A₂` with its inclusions `inl`, `inr` and the induced map
`lift : A₁ ⊗†[B] A₂ →ₐ[K] C`, and the relative overconvergent
polydisc algebra `A⟨λ^{-1}Z_1, …, λ^{-1}Z_m⟩†`; prove `inl ∘ α₁ = inr ∘ α₂`,
`lift u₁ u₂ ∘ inl = u₁` (likewise `inr`),
that maps to a dagger algebra agreeing on `inl`, `inr` are equal, that the completion is
`Â₁ ⊗̂_{B̂} Â₂` (the *completed-tensor-product* of AdicSpacesPartII layer R0 for `K`-affinoid algebras),
that it is `A₁ ⊗[B] A₂` for `A₂` finite over `B` (Mathlib
`Algebra.TensorProduct`), that it is the colimit of `B₁ ⊗̂_K B₂` over fringe algebras,
that `W_n ⊗†_K W_m ≃ W_{n+m}`, functoriality in the diagram, compatible with identities and
composition, and that `A₁ → A₁ ⊗†_K A₂` is flat for `A₁, A₂` of MW-type
(*mw-type-dagger-algebra*), hence reduced (Kedlaya06 Remark 2.3.9 with the reducedness hypothesis of
his errata) (GK00 §1, 1.16, p. 9). *Needs:* *dagger-algebra*; *dagger-weak-completeness*;
*dagger-completion-comparison*; *fringe-morphism-factorisation*; *dagger-finite-extension*;
*completed-tensor-product* (AdicSpacesPartII layer R0).

**Checks.**

- Computation: `K⟨X⟩† ⊗†_K K⟨Y⟩† ≅ K⟨X, Y⟩†` compatibly with
  `X ↦ X ⊗ 1`, `Y ↦ 1 ⊗ Y`.
- Degenerate: `A ⊗†_A A = A` and `A ⊗†_K K = A`.
- Non-example: for `A = W_1 = K⟨X⟩†`, the series
  `f = Σ_ν π^ν X^{ν^2} Z^ν` has coefficients `a_ν = π^ν X^{ν^2} ∈ A` with `|a_ν| ρ^ν → 0` for every
  `ρ < |π|^{-1}`, but `f ∉ A⟨Z⟩† = K⟨X, Z⟩†` (for every `ρ_1 > 1`, `|π|^ν ρ_1^{ν^2} → ∞`). A
  definition `A⟨Z⟩† := {Σ a_ν Z^ν : |a_ν|ρ^ν → 0}` fails this test.
- Compatibility: the completion of `K⟨X⟩† ⊗†_K K⟨Y⟩†` is
  `K⟨X⟩ ⊗̂_K K⟨Y⟩ = K⟨X, Y⟩`, the completed tensor product of Tate algebras.
- Characterisation: for a finite extension `L/K`,
  `W_n ⊗†_K L = W_n ⊗_K L = L⟨X⟩†`.

**Rational localisation `A⟨f/g⟩†` of a dagger algebra and its universal property.**
(*dagger-rational-localisation*) Let `K` be a complete rank-one nonarchimedean field (as in
RigidAnalyticGeometry §1.5.1–1.5.2), `A` a `K`-dagger algebra and `g, f_1, …, f_m ∈ A` without common
zero on `Sp(A)` (equivalently generating the unit ideal). Define
`A⟨f/g⟩† := A⟨X_1, …, X_m⟩†/(gX_i − f_i)_{i≤m}` (`A⟨X⟩†` from *dagger-tensor-product*). The map
`A → A⟨f/g⟩†` is universal among morphisms of dagger algebras `φ : A → C` such that `Sp(φ)` lands in
`R(f/g) := {x ∈ Sp(A) : |f_i(x)| ≤ |g(x)| for all i}`: `φ(g)` is then a unit and `φ` factors
uniquely through `A⟨f/g⟩†`. Special cases: Weierstrass localisations `A⟨f⟩†` (`g = 1`) and Laurent
localisations `A⟨f^{-1}⟩† = A⟨X⟩†/(fX − 1)`. `Sp(A⟨f/g⟩†) = R(f/g)`, the completion of `A⟨f/g⟩†` is
the affinoid rational localisation `Â⟨f/g⟩`, and `A⟨f/g⟩†` depends only on the subset `R(f/g)`, not
on `(f, g)`. In `Dagger`, define the rational localisation as `A⟨X⟩† ⧸ (g X_i − f_i)` for
`Ideal.span (insert g (range f)) = ⊤`, its structure map (`g`
becomes a unit, `f_i/g ↦ X_i`), and the lift, the unique `A⟨f/g⟩† → C` for
`φ : A →ₐ[K] C` with `|φ(f_i)(y)| ≤ |φ(g)(y)|` for every point `y ∈ Sp(C)` and every `i` (the
pointwise condition `Sp(φ)(Sp C) ⊆ R(f/g)`, not an inequality of supremum seminorms: for
`A = W_1`, `f_1 = X`, `g = π`, `C = W_1` and `φ = id`, `|X|_sup = 1 > |π|` fails pointwise at every
point with `|x| > |π|`, and indeed `id` does not factor through `W_1⟨X/π⟩†`), and the Laurent
localisation
`A⟨f^{-1}⟩†` (`m = 1`, `f_1 = 1`, `g = f`); prove
`lift φ ∘ algebraMap = φ` with uniqueness, that the completion is `Â⟨f/g⟩`,
i.e. `TauCeti.Huber.PairOfDefinition.completionLocalization` of `(Â, Â°)` with `T = {f_i}`,
`s = g`, that `Max(A⟨f/g⟩†) ≅ R(f/g)`,
that `A⟨f/g⟩† ≅ A⟨f'/g'⟩†` under `A` when `R(f/g) = R(f'/g')`,
that `A → A⟨f/g⟩†` is flat (`A → Â` and `A⟨f/g⟩† → Â⟨f/g⟩` are faithfully
flat by *dagger-completion-comparison* and `Â → Â⟨f/g⟩` is flat,
`TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`, `Â` being strongly noetherian), and
transitivity and base change along `A → D` (GK00 §1, 1.18, p. 9).
*Needs:* *dagger-tensor-product*; *dagger-algebra*; *dagger-weak-completeness*;
*dagger-completion-comparison*.

**Checks.**

- Computation: `W_1⟨X^{-1}⟩† = K⟨X, X^{-1}⟩†` (series
  `Σ_{m∈ℤ} a_m X^m` with `|a_m| ρ^{|m|} → 0` for some `ρ > 1`), the dagger annulus `|X| = 1`.
- The identity of `W_1` cannot factor through
  the smaller disc `W_1⟨X/π⟩†` when `0 < |π| < 1`.
- Degenerate: for `g = f_1 = 1`, `A⟨f/g⟩† = A`.
- Non-example: `W_1[1/X] ⊊ W_1⟨X^{-1}⟩†`: for `a ∈ K`
  with `0 < |a| < 1`, `1/(X − a) = Σ_k a^k X^{-k-1}` lies in `K⟨X, X^{-1}⟩†` but not in `W_1[1/X]`
  (its pole at `X = a`). A definition by algebraic localisation fails.
- Compatibility: the completion of `W_1⟨X^{-1}⟩†` is
  `K⟨X, X^{-1}⟩`, the Tau Ceti rational localisation of `(K⟨X⟩, K°⟨X⟩)` at `T = {1}`, `s = X`.
- Characterisation: `Max(W_1⟨X/π⟩†)` is the set of Galois
  orbits of points `x` with `|x| ≤ |π|` of the closed unit disc.

In the relation ideal of the dagger tensor product, the two presentation kernels are embedded by
Mathlib's
`MvPowerSeries.rename` on the two variable blocks. The third family of generators consists
of differences of representatives of `α₁(b)` and `α₂(b)`, for every `b ∈ B`.
Two equations fix the two inclusions on those
representatives. The functoriality map is fixed on both factors of a diagram map, with its
identity and composition laws (GK00 §1.16, p. 9).

The completed dagger pushout is identified with
AdicSpacesPartII R0's completed tensor product (*completed-tensor-product*). The identification
sends the product of the two completed inclusions to
the completed pure tensor, fixing both factor maps (GK00 §1.16, p. 9).

### F1.5 weak completions and algebras of Monsky–Washnitzer type

**The integral Monsky–Washnitzer algebra `O_K⟨X_1, …, X_n⟩†` is noetherian.**
(*integral-overconvergent-noetherian*) Prove that for `O_K` a complete discrete valuation ring with
uniformiser `π` and fraction field `K`, `O_K⟨X_1, …, X_n⟩† = W_n ∩ O_K[[X]]` is a noetherian ring
(Kedlaya06 §2.4, after Lem. 2.4.1, the Gröbner-basis route, whose termination argument uses that `K`
is discretely valued; vdP §2, (2.2), p. 36, van der Put's integral Weierstrass theory, from which
"`R⟨X⟩†` noetherian" is deduced). The noetherianity of a general weak completion `S† ≅
O_K⟨X⟩†/I·O_K⟨X⟩†` (*weak-completion-presentation* (b)) is deduced from this statement by passing
to the quotient. For `n = 1`, every ideal of `O_K⟨X⟩†` is finitely
generated, e.g. `(π, X)` and `(X − π)` are, and `O_K⟨X⟩†/(X − π) = O_K`. *Needs:*
*overconvergent-tate-algebra*; Mathlib `IsNoetherianRing`. Lean:
`Dagger.intWashnitzerAlgebra.isNoetherianRing` (for `K` discretely valued with uniformiser `π`).

**The integral Monsky–Washnitzer algebra `O_K⟨X_1, …, X_n⟩† = W_n ∩ O_K[[X]]`.**
(*integral-overconvergent-tate-algebra*) Let `K` be a complete rank-one nonarchimedean field (as in
RigidAnalyticGeometry §1.5.1–1.5.2) and `O_K = {a : |a| ≤ 1}`. Define
`O_K⟨X_1, …, X_n⟩† := W_n ∩ O_K[[X_1, …, X_n]]`, the overconvergent power series with coefficients
in `O_K`; it is `W_n^int` (see *dagger-algebra*). If `O_K` is a discrete valuation ring with
uniformiser `π`, a series `f ∈ O_K[[X]]` lies in `O_K⟨X⟩†` iff there is `c > 0` with
`f = Σ_{j≥0} π^j P_j(X)`, `P_j ∈ O_K[X]`, `deg P_j ≤ c(j+1)` (the Monsky–Washnitzer degree growth
condition), and then `O_K⟨X⟩†` is noetherian, `O_K⟨X⟩†/π^m = O_K[X]/π^m` for all `m`, its `π`-adic
completion is `O_K⟨X⟩ = T_n ∩ O_K[[X]]`, and `O_K⟨X⟩† ⊗_{O_K} K = W_n`. In `Dagger`, define
`intWashnitzerAlgebra` as the subring of `washnitzerAlgebra n K` of series with `O_K`-coefficients
(the intersection of `W_n` with the image of `O_K[[X]]`, `O_K` Tau Ceti's `powerBoundedSubring K`;
notation `O_K⟨X⟩†`); prove that `f ∈ O_K⟨X⟩†` iff `f ∈ W_n` and `‖coeff ν f‖ ≤ 1` for all
`ν`, the degree growth description (`O_K` a DVR),
that `O_K⟨X⟩† = Dagger.intSubring K (washnitzerAlgebra n K)`,
that `O_K⟨X⟩† ⧸ π^m ≃ MvPolynomial (Fin n) (O_K ⧸ π^m)`,
that the `π`-adic completion (Mathlib `AdicCompletion`) is
`O_K⟨X⟩`, `intWashnitzerAlgebra.isNoetherianRing` (`O_K` a DVR),
that `1 + πf` is a unit, so that `π` lies in the Jacobson radical, and
that `O_K⟨X⟩† ⊗_{O_K} K ≃ W_n` (vdP §2, p. 35). *Needs:*
*overconvergent-tate-algebra*; *dagger-algebra*; *dagger-completion-comparison*;
*overconvergent-weierstrass-division*; *overconvergent-faithful-flatness*;
*integral-overconvergent-noetherian*. Lean: `Dagger.intWashnitzerAlgebra`.

**Checks.**

- `0, 1 ∈ O_K`.
- A scalar `π` with `0 < |π| < 1` lies in `O_K`.
- The same scalar has `π⁻¹ ∉ O_K`.
- The zero series has integral coefficients.
- `Σ X^m` has integral coefficients but is not overconvergent.
- The constant `π⁻¹` fails integrality when `0 < |π| < 1`.
- Computation: `Σ_{j≥0} π^j X^j ∈ O_K⟨X⟩†` with
  `P_j = X^j` of degree `j ≤ 1·(j+1)`.
- Degenerate: for `n = 0`, `O_K⟨⟩† = O_K`.
- Non-example: `Σ_j π^j X^{j^2}` lies in the `π`-adic
  completion `O_K⟨X⟩` but not in `O_K⟨X⟩†` (degree `j^2` is not `O(j)`); so '`π`-adic completion'
  is the wrong definition.
- Compatibility: `O_K⟨X⟩†[1/π] = W_n` as subrings of
  `K[[X]]`.

**The Monsky–Washnitzer weak completion `S†` of a finitely generated `O_K`-algebra.**
(*weak-completion*) Let `O_K` be a complete discrete valuation ring with uniformiser `π`, residue
field `k = O_K/π` and fraction field `K` (any characteristic; `K` carries the `π`-adic absolute
value). Let `S` be a finitely generated `O_K`-algebra and `Ŝ = lim_m S/π^mS` its `π`-adic
completion. Choose generators `x_1, …, x_n` of `S`. The weak completion `S† ⊆ Ŝ` is the set of
`z ∈ Ŝ` that can be written `z = Σ_{j≥0} π^j P_j(x_1, …, x_n)` (convergent in `Ŝ`) with
`P_j ∈ O_K[X_1, …, X_n]` of total degree `≤ c(j+1)` for some real `c`; equivalently, `S†` is the
image of `O_K⟨X_1, …, X_n⟩† → Ŝ`, `X_i ↦ x_i`. `S†` is an `O_K`-subalgebra of `Ŝ` containing the
image of `S`, and it does not depend on the choice of generators. The dagger algebra attached to `S`
is `A† := S† ⊗_{O_K} K` (see *weak-completion-generic-fibre*). In `Dagger`, define the `π`-adic
completion `piAdicCompletion π S` (that is, `AdicCompletion (Ideal.span {π}) S`), the
degree-growth set `weakCompletionSet π x` of a finite family `x` in `S`, and `weakCompletion π S`
as `S† : Subalgebra O_K Ŝ`, generated by the degree-growth set of a chosen generating family
(the range of `O_K⟨X⟩† → Ŝ` at that family); `weakCompletion.of` as `S → S†` (injective iff
`⋂_m π^mS = 0`), its composite to `Ŝ` being the adic-completion map (`algebraMap_mem_weakCompletion`);
`weakCompletion.genericFibre` as `A† := S† ⊗_{O_K} K`; the map `S† → T†`
induced by `S → T`, fixed on `S` and compatible with identities and composition; and the unique
extension
`S† → B` of an `O_K`-algebra map `S → B` into a weakly complete finitely generated `O_K`-algebra
(see *weak-completion-universal-property*); prove `coe_weakCompletion` (for every finite
generating family `x`, `S†` is exactly the degree-growth set of `x`: the degree-growth
description, which also shows that the set is already a subalgebra and that `S†` does not depend
on the generators), that `S†` is the range of `O_K⟨X⟩† → Ŝ` for any finite generating family,
that evaluation at `T = a` retracts the map `S† → (S[T])†`, with the evaluations `T ↦ 0`, `T ↦ 1`
induced by
`S[T] → S`, and that `O_K[X_1, …, X_n]† = O_K⟨X_1, …, X_n⟩†` (Kedlaya01
§2, p. 2). *Needs:* *integral-overconvergent-tate-algebra*. Lean: `Dagger.piAdicCompletion`,
`Dagger.weakCompletionSet`, `Dagger.weakCompletion`, `Dagger.coe_weakCompletion`,
`Dagger.algebraMap_mem_weakCompletion`, `Dagger.weakCompletion.of`.

**Checks.**

- Computation: for `S = O_K[z, z^{-1}]`,
  `S† = {Σ_{m∈ℤ} a_m z^m : a_m ∈ O_K, ∃ ε > 0, C, v_π(a_m) ≥ ε|m| − C} = O_K⟨z, w⟩†/(zw − 1)`.
- If the canonical map `S → Ŝ` is surjective, then `S† = Ŝ`.
- Degenerate: if `S` is finite over `O_K` (e.g. `S = O_K` or the
  ring of integers of a finite extension), `S† = Ŝ = S`.
- Non-example: for `S = O_K[X]`, `Σ_j π^j X^{j^2} ∈ Ŝ ∖ S†`;
  and, when `O_K` has mixed characteristic `(0, p)`, the explicitly computed 1-form
  `Σ_n p^n X^{p^n − 1} dX` on `Ŝ` is a limit of exact forms but not exact, whereas on `S†` every
  1-form of `O_K⟨X⟩† ⊗ K` is exact (termwise integration preserves overconvergence because
  `char K = 0`; in characteristic `p`, `X^{p−1}dX` is not exact)
  (see *dagger-polyannulus-de-rham-cohomology*).
- Compatibility: `S† ⊗ K` is a dagger algebra whose
  completion is `Ŝ ⊗ K`; for `S = O_K[X_1, …, X_n]` this is `W_n ⊆ T_n =
restrictedMvPowerSeriesCompletion n K`
  of Tau Ceti.
- Negative control: applying the degree-growth
  construction with parameter `0` gives the entire zero-adic completion, namely `S`;
  with parameter `1` the completion is the zero ring. The comparison with the integral
  Washnitzer algebra and the non-completion example therefore assume `π` irreducible,
  as do the generic-fibre assertions.
- Characterisation: `S†/πS† = S/πS`; for
  `S = O_K[z, z^{-1}, (z^N − 1)^{-1}]` (`p ∤ N`) this is `k[z, z^{-1}, (z^N − 1)^{-1}]`.

**Presentation, noetherianity and reduction of a weak completion.** (*weak-completion-presentation*)
Let `O_K` be a complete discrete valuation ring with uniformiser `π`, residue field `k` and fraction
field `K` (any characteristic) and `S = O_K[X_1, …, X_n]/I` a finitely generated `O_K`-algebra.
Prove: (a) `S† ≅ O_K⟨X⟩†/I·O_K⟨X⟩†` compatibly with `S → S†`; (b) `S†` is noetherian, by (a) from
the case `I = 0`, which is
*integral-overconvergent-noetherian*; (c) `S†/π^mS† ≅ S/π^mS` for all `m ≥ 1`; (d) `π` lies in the
Jacobson radical of `S†`, `S†` is
`π`-adically separated and its `π`-adic completion is `Ŝ`; (e) `S† → Ŝ` is faithfully flat.
The maps in (a) and (d) are fixed on every element of `S` and `S†`, respectively; separatedness and
faithful flatness are separate statements.
Van der Put §2, (2.1)–(2.2), pp. 35–36, supplies the quotient presentation convention and
noetherianity. The completion and faithful-flatness clauses additionally use parameter-adic
separatedness, the quotients in (c), and faithful flatness of noetherian completion when the
parameter lies in the Jacobson radical; they are not all statements of vdP (2.2). *Needs:* *weak-completion*; *integral-overconvergent-tate-algebra*;
*integral-overconvergent-noetherian*. Lean: `Dagger.weakCompletion.isNoetherianRing` ((b) and (c),
for `π` irreducible).

**Weak completeness and the universal property of the weak completion.**
(*weak-completion-universal-property*) Let `O_K` be a complete discrete valuation ring with
uniformiser `π` and fraction field `K` (any characteristic). Call an `O_K`-algebra `B` weakly
complete finitely generated if `B ≅ O_K⟨Y_1, …, Y_m⟩†/J` for some `m` and ideal `J` (vdP §2, (2.1)).
Prove: (a) for
every finitely generated `O_K`-algebra `S`, `S†` is weakly complete finitely generated, and for all
`y_1, …, y_r ∈ S†` the map `O_K[Y_1, …, Y_r] → S†`, `Y_i ↦ y_i`, extends uniquely to `O_K⟨Y⟩† → S†`;
(b) for every weakly complete finitely generated `B` and every `O_K`-algebra homomorphism
`φ : S → B` there is a unique `O_K`-algebra homomorphism `φ† : S† → B` with `φ†|_S = φ`; (c)
consequently `S ↦ S†` is a functor from finitely generated `O_K`-algebras to weakly complete
finitely generated `O_K`-algebras, and restriction along `S → S†` gives the natural bijection
`Hom_{O_K}(S†, B) ≅ Hom_{O_K}(S, B)` of (b) (MW68 §2). In particular, if `S` is `π`-adically
complete and separated (`S → Ŝ` bijective, e.g. `S` finite over `O_K`), then `S† = Ŝ = S`.
*Needs:* *weak-completion-presentation*; *weak-completion*; *integral-overconvergent-tate-algebra*;
*dagger-weak-completeness*. Lean: `Dagger.IsWeaklyCompleteFG`, `Dagger.weakCompletion.existsUnique_lift`.

**Checks.**

- `O_K` is weakly complete finitely generated (zero variables).
- `k = O_K/π` is weakly complete finitely generated but not flat.
- `O_K[X]` is not weakly complete: `1−πX` would have to
  be a unit, whereas its geometric-series inverse is not a polynomial (Lean `example`).

**The generic fibre `S† ⊗ K` of a weak completion is a dagger algebra with completion `Ŝ ⊗ K`.**
(*weak-completion-generic-fibre*) The completion comparison
sends `τ(a ⊗ s)` to `a ⊗ s` in `K ⊗ Ŝ`; the integral map `S† → A†` is specified together with
its injectivity in the flat case.
The presentation `A† ≅ W_n/IW_n` fixes the image
of every polynomial generator. The
power-bounded subring is the weak integral model when that model is flat with reduced
special fibre. The special-fibre comparison is fixed
on the class of every `s ∈ S`. Let `O_K` be a complete discrete valuation ring with uniformiser
`π` and fraction field `K` (any characteristic), `S = O_K[X_1, …, X_n]/I` and `A† := S† ⊗_{O_K} K`.
Prove: (a) `A† ≅ W_n/IW_n` is a `K`-dagger algebra; (b) its completion is `Ŝ ⊗_{O_K} K = T_n/IT_n`;
(c) the image of `S†` lies in `(A†)^int`; if `S` is flat over `O_K` then `S† → A†` is injective, and
if moreover `S/πS` is reduced then `S† = (A†)^int`, i.e. `S†` is exactly the set of elements of `A†`
of supremum norm `≤ 1`; (d) for `S` smooth over `O_K`, `A†` is a dagger algebra of Monsky–Washnitzer
type with reduction `S/πS` (see *mw-type-dagger-algebra*) (GK02 Introduction). *Needs:*
*weak-completion-presentation*; *integral-overconvergent-tate-algebra*; *dagger-algebra*;
*dagger-norm-and-continuity*; *dagger-completion-comparison*. Lean:
`Dagger.weakCompletion.genericFibre`, `Dagger.weakCompletion.isDaggerAlgebra_genericFibre` ((a),
for `O_K` the unit ball of `K`).

**Dagger algebras of Monsky–Washnitzer type.** (*mw-type-dagger-algebra*) Let `O_K` be a complete
discrete valuation ring with uniformiser `π`, residue field `k = O_K/π` and fraction field `K` (any
characteristic; `K` carries the `π`-adic absolute value). A `K`-dagger algebra `A` is of
Monsky–Washnitzer type (MW-type) if `A` is a regular ring and the ring `A^int/πA^int` is a smooth
`k`-algebra (`A^int` = elements of supremum norm `≤ 1`, *dagger-algebra*). Its reduction (special
fibre) is `A^int/πA^int`. The regularity clause is part of the definition: it does not follow from
smoothness of `A^int/πA^int`. In `Dagger`, define `IsMWType` by three fields: `hO` (`O` is the unit
ball of `K`: `‖x‖ ≤ 1` iff `x` lies in the image of `O`), `IsRegularRing A` and
`Algebra.Smooth k (k ⊗_O A^int)`, `k ⊗_O A^int = A^int/πA^int` (in Lean `A^int` enters as the
`O`-algebra generated by `intSubring K A`, which is `A^int` because `O` maps into the unit ball of
`K`), and the reduction `A^int/πA^int`, a smooth finitely generated `k`-algebra.
The integral subalgebra and reduction also make sense for any bounded
map from a DVR `O` to `K`; the theorems identifying this reduction with the spectral reduction,
projectivity, localisation and the Washnitzer example require `O` to be the unit ball of `K` (`hO`,
as in `IsMWType.of_smooth`). Prove
that `A^int/πA^int` equals the reduction `Ã = A^int/{|·|_sup < 1}` (Kedlaya06
Def. 3.2.1), `IsMWType.of_smooth` (for `S` a smooth finitely generated `O_K`-algebra, `S† ⊗ K` is of
MW-type with reduction `S/πS` and integral subring `S†`), that MW-type algebras are
reduced, `IsMWType.projective_differentials` (`Ω^1_{A/K}` is finite projective of rank the relative
dimension of the reduction), that if `f ∈ A^int` has non-nilpotent reduction `f̄`,
`A⟨f^{-1}⟩†` is of MW-type with reduction `(A^int/π)[1/f̄]`, and that `W_n` is of
MW-type with reduction `k[X_1, …, X_n]` (Kedlaya06 §3.2, Def. 3.2.1). *Needs:* *dagger-algebra*;
*weak-completion-generic-fibre*. Lean: `Dagger.IsMWType`, `Dagger.IsMWType.projective_differentials`,
`Dagger.IsMWType.of_smooth`.

**Checks.**

- Computation: `W_n = O_K⟨X⟩† ⊗ K` is of MW-type with reduction
  `k[X_1, …, X_n]`.
- Degenerate: `K = W_0` is of MW-type with reduction `k`.
- Non-example: `A = W_1/(X^2)`: `X` is nilpotent so `X/π^m ∈ A^int`
  for all `m`, hence `A^int/πA^int = k` is smooth, but `A` is not regular; the regularity clause
  (Kedlaya's errata to Definition 3.2.1) excludes it (Lean `example`).
- Non-example: `A = W_1[Y]/(Y^2 − π) = K(√π)⟨X⟩†` is regular and finite
  étale over `W_1` (`char K ≠ 2`, so `Y^2 − π` is separable), but `A^int/πA^int = k[ε, X]/(ε^2)` is
  not reduced, so `A` is not of MW-type over `K`.
- Compatibility: for `A` of MW-type, `Ω^1_{A/K}` is a finite
  projective `A`-module (Mathlib `Module.Projective`).
- Non-example: the identification of the reduction with `A^int/{|·|_sup < 1}` needs MW-type: for
  `A = W_2/(Y^2 − πX)` (regular: `Y^2 − πX ∈ m ∖ m^2` at the origin), `|Y|_sup = |π|^{1/2} < 1` but
  `Y ∉ πA^int` (`|Y/π|_sup = |π|^{-1/2} > 1`), so `{|·|_sup < 1} ≠ πA^int`; consistently `A` is not
  of MW-type, since `Y` is a nonzero nilpotent of `A^int/πA^int` (`Y^2 = πX`). For `A` of MW-type the
  two ideals agree because `A^int/πA^int` is reduced: `|a|_sup < 1` gives `a^N ∈ πA^int` for some
  `N`, hence `a ∈ πA^int`.
- Negative control: when `K = Frac(O)`
  and `O` is its valuation unit ball, `K` is of MW-type and `(π) = K`, but
  its reduction `k ⊗_O K^int` is nonzero and canonically isomorphic to `k`.
  The equivalence sends `1 ⊗ a` to the residue of `a ∈ O`; quotienting the generic
  fibre by `π` would instead give zero (Kedlaya06 Definition 3.2.1, p. 20). In general
  `(a) = A` for nonzero `a ∈ K` in every `K`-algebra `A`, in particular `(π) = A`, so the
  non-membership statement above concerns `πA^int`, not an ideal generated by `π` in `A`.

**Lifting morphisms of smooth reductions to weak completions (van der Put 2.4.4 (ii)).**
(*mw-morphism-lifting*) Let `O_K` be a complete discrete valuation ring of mixed characteristic
`(0, p)` with uniformiser `π`, residue field `k = O_K/π` and fraction field `K` (`K` carries the
`π`-adic absolute value; this is van der Put's standing hypothesis '`K = Qt(R)` of characteristic
0', and the Artin approximation property of `O_K⟨t⟩†` used in the proof is stated in the sources
only in that case). Let `A_0, C_0` be smooth finitely generated `k`-algebras and `A, C` lifts of
them: weakly complete finitely generated `O_K`-algebras, flat over `O_K`, with specified `k`-algebra isomorphisms `A/πA ≅ A_0` and
`C/πC ≅ C_0`. The lift predicate and the lifting theorem require these
identifications to commute with the residue map from `O_K`. Then every `k`-algebra homomorphism `f : A_0 → C_0` lifts to an `O_K`-algebra
homomorphism `F : A → C` (`F mod π = f`). More generally, every `O_K`-algebra homomorphism
`F̂ : A → Ĉ` into the `π`-adic completion can be approximated: for every `m` there is `F : A → C`
with `F ≡ F̂ mod π^m` (vdP §2, (2.4.4) (ii), p. 37). The lifts modulo `π^m` are made over the
truncated bases `O_m = O_K/π^m`, not over `k`: the rings `C/π^mC` are in general not `k`-algebras
(the `ℤ_p` Check below), so formal smoothness of `A_0` over `k` does not apply to them. For
`m ≥ 1` write `A_m = A/π^mA` and `C_m = C/π^mC`. Prove that `A_m` is flat over `O_m` (base change of
the flat `A`) and finitely presented (a quotient of a polynomial ring in finitely many variables over the noetherian
`O_m`),
with fibre `k ⊗_{O_m} A_m ≅ A_0` at the only prime `(π)` of `O_m`, compatibly with the scalars
from `k`; Mathlib's `Algebra.Smooth.of_formallySmooth_fiber` then gives `Algebra.Smooth O_m A_m`
(vdP p. 37; Stacks Tag 031L, Lem. 10.138.12, gives the same by induction on `m` through the
square-zero thickenings `O_{m+1} → O_m`). Starting from `φ_1 = f`
through the identifications `A_1 ≅ A_0` and `C_1 ≅ C_0`, define `φ_{m+1} : A_{m+1} → C_{m+1}` as
the `O_{m+1}`-algebra lift, by `Algebra.FormallySmooth.lift` for `A_{m+1}` over `O_{m+1}`, of the
reduction `A_{m+1} → A_m` followed by `φ_m`, along `C_{m+1} → C_m`, whose kernel `π^mC_{m+1}` has
square zero for `m ≥ 1` (`C_m` is an `O_{m+1}`-algebra through `O_{m+1} → O_m`); prove that
`φ_{m+1}` reduces to `φ_m` modulo `π^m`, so that the `φ_m` form a compatible system with limit an
`O_K`-algebra homomorphism `F̂ : A → Ĉ` reducing to `f`. The passage from `F̂` to a lift into the
weakly complete `C`, rather than into `Ĉ`, is the approximation step (vdP (2.4.3), p. 37), and
both it and the construction of the `φ_m` are what this target adds. *Needs:*
*weak-completion-universal-property*; *weak-completion-presentation*;
*integral-overconvergent-tate-algebra*; Mathlib `Algebra.Smooth.of_formallySmooth_fiber`,
`Algebra.FormallySmooth.lift`, `Algebra.FormallySmooth.comp_surjective`.

**Checks.**

- `O_K` lifts `k`, with its canonical scalar-compatible residue map.
- `O_K⟨X⟩†` lifts `k[X]`.
- `k` itself does not lift `k`: it has nonzero `π`-torsion.
- Base and reduction square: for `O_K = ℤ_p`, `A = ℤ_p⟨T⟩†`, `A_0 = 𝔽_p[T]`, `C = ℤ_p` and
  `f(T) = ā`, the ring `C_2 = ℤ/p²` has no `𝔽_p`-algebra structure (`p·1 ≠ 0`), so formal
  smoothness of `𝔽_p[T]` over `𝔽_p` cannot produce `φ_2`. Instead `A_2 = (ℤ/p²)[T]` is smooth over
  `O_2 = ℤ/p²`, and the `O_2`-algebra lifts of the reduction `A_2 → A_1 = 𝔽_p[T]` followed by `f`
  along `ℤ/p² → 𝔽_p` are
  `T ↦ a mod p²` for the lifts `a ∈ ℤ_p` of `ā`, each reducing to `f`.
- Negative control: for a base lift `O` of
  `k ≅ 𝔽₄`, take the residue identification of the lift. It commutes with scalars;
  composing it with Frobenius does not,
  and no `O`-algebra endomorphism of `O` reduces to that Frobenius under the
  identification (vdP (2.4.4)(ii), p. 37). Frobenius on `𝔽₄` is a ring automorphism but is not
  `𝔽₄`-linear: for a root `a` of `X² + X + 1`, `a² = a + 1 ≠ a`. Arbitrary ring identifications of
  reductions therefore cannot be used in a theorem lifting residue-algebra morphisms.

**The integral subring of a dagger algebra of MW-type is a Monsky–Washnitzer lift.**
(*mw-type-integral-lift*) Prove that for `O_K` a complete discrete valuation ring of mixed
characteristic `(0, p)` with uniformiser `π`, residue field `k` and fraction field `K`, and `A` a
`K`-dagger algebra of MW-type (see *mw-type-dagger-algebra*) with reduction `A_0 = A^int/πA^int`, there
are a smooth finitely generated `O_K`-algebra `S` with `S/πS ≅ A_0` and an isomorphism of
`K`-algebras `A ≅ S† ⊗_{O_K} K` carrying `A^int` onto `S†` (together with `IsMWType.of_smooth` this
characterises the algebras of MW-type); in particular `A^int` is weakly complete
finitely generated and flat over `O_K` (a lift of `A_0`), and two dagger algebras of MW-type with
isomorphic reductions are isomorphic (Kedlaya06 §3.2, after Def. 3.2.1, which asserts that `A^int` is
a Monsky–Washnitzer lift, and the uniqueness consequence). The integral model statement requires
the generic and integral
isomorphisms to commute with `s ↦ 1 ⊗ s`, and requires the special-fibre isomorphism to preserve
residue-field scalars and identify the class of `s` with the reduction of its integral image.
The lift statement asserts weak completeness, flatness, and the
specified reduction of the integral subalgebra. For `A = W_n`: `S = O_K[X_1..X_n]`,
`A^int = O_K⟨X⟩†`; for `A = K⟨X, X^{-1}⟩†`: `S = O_K[X, X^{-1}]`, `A^int = O_K⟨X, X^{-1}⟩†`. *Needs:*
*mw-type-dagger-algebra*; *mw-lift-existence-uniqueness*; *weak-completion-generic-fibre*;
*dagger-approximation*; *dagger-completion-comparison*; Mathlib `Algebra.FormallySmooth`.

**Elkik's lifting and algebraisation of smooth algebras.** (*elkik-lifting-algebraisation*) Let
`(A, J)` be a noetherian henselian pair; here it is applied to `(O_K, πO_K)` for a complete
discrete valuation ring `O_K`. Prove: (a) every smooth `A/J`-algebra is isomorphic to `B/JB` for a
smooth `A`-algebra `B` (Elkik III.4, Thm. 6, p. 580); (b) if `J = aA` is principal, every
topologically finitely generated `Â`-algebra that is formally smooth outside `V(J)` is the `J`-adic
completion of a finitely generated `A`-algebra smooth outside `V(J)` (Elkik III.4, Thm. 7, p. 582,
whose proof uses Elkik's approximation theorem, Thm. 2 bis, which is PerfectoidSpaces P3.1). Part
(a) gives the existence clause of *mw-lift-existence-uniqueness*; part (b) gives the algebraisation
of smooth affinoids, *smooth-affinoid-quasi-algebraic*. *Needs:* PerfectoidSpaces P3.1 (Elkik's
approximation theorem); Mathlib `Algebra.Smooth`, `HenselianRing`.

**Checks.**

- `k[X]` lifts to `O_K[X]`, and `k` lifts to `O_K`.
- `O_K⟨X⟩` is the `π`-adic completion of `O_K[X]`.
- The graph `O_K⟨X, Y⟩/(Y − h)` of a non-polynomial `h ∈ O_K⟨X⟩` is isomorphic to `O_K⟨X⟩`, so it
  is again a completion of `O_K[X]`, although its presentation is not polynomial.

**Existence and uniqueness of dagger algebras of MW-type with a given smooth reduction.**
(*mw-lift-existence-uniqueness*) Let `O_K` be a complete discrete valuation ring of mixed
characteristic `(0, p)` with uniformiser `π`, residue field `k = O_K/π` and fraction field `K` (`K`
carries the `π`-adic absolute value) and `A_0` a smooth finitely generated `k`-algebra. Then (a)
there is a smooth finitely generated `O_K`-algebra `B` with `B/πB ≅ A_0` (Elkik,
*elkik-lifting-algebraisation* (a)); (b) `B†` is a lift
of `A_0` (weakly complete finitely generated, flat over `O_K`, `B†/πB† ≅ A_0`) and `B† ⊗ K` is a
dagger algebra of MW-type with reduction `A_0`; (c) any two lifts of `A_0` are isomorphic as
`O_K`-algebras (non-canonically). That two dagger algebras of MW-type with isomorphic reductions are
isomorphic additionally needs that their integral subrings are lifts (see *mw-type-integral-lift*)
(vdP §2, p. 35, for existence via Elkik, and Thm (2.4.4)(i), p. 37, for uniqueness). *Needs:* *mw-morphism-lifting*; *weak-completion-presentation*;
*weak-completion-generic-fibre*; *mw-type-dagger-algebra*; *elkik-lifting-algebraisation*.

### F1.6 affinoid dagger spaces

**Affinoid subdomains of the maximal spectrum of a dagger algebra.** (*dagger-affinoid-subdomain*)
Let `K` be a complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2), `A` a
`K`-dagger algebra and `X = Sp(A)` its set of maximal ideals. A subset `U ⊆ X` is an affinoid
subdomain if there are a dagger algebra `B = O_X(U)` and a morphism `ι : A → B` with
`Sp(ι)(Sp B) ⊆ U` such that for every dagger algebra `D` the map
`Hom_K(B, D) → {f ∈ Hom_K(A, D) : Sp(f)(Sp D) ⊆ U}`, `g ↦ g ∘ ι`, is bijective. This is the
definition of *affinoid-subdomain* (AdicSpacesPartII layer R1) with the universal property taken in the category of
dagger algebras instead of affinoid algebras; the two notions are compared in
*dagger-affinoid-subdomain-completion*. Then `B` is unique
up to unique isomorphism and `Sp(ι) : Sp(B) → U` is a bijection. Rational subdomains `R(f/g)` with
`O_X(R(f/g)) = A⟨f/g⟩†` (see *dagger-rational-localisation*) and Weierstrass domains (`g = 1`) are
affinoid subdomains; the notion is transitive and stable under base change `A → D`. In `Dagger`,
define the predicate of being an affinoid subdomain on `U : Set (MaximalSpectrum A)`, the
existence of a representing `(B, ι)`, its algebra `O_X(U)` with
`ι_U : A → O_X(U)`, and the lift, the unique `g : O_X(U) → D` with `g ∘ ι_U = f`
when `Sp(f) ⊆ U`, with its uniqueness; prove that `Sp(O_X(U)) → U` is a
bijection, that `R(f/g)` is an affinoid subdomain with algebra `A⟨f/g⟩†`,
transitivity, that `U ∩ V` is one, with algebra
`O(U) ⊗†_A O(V)`, that preimages under `Sp(φ)`, `φ : A → D`, are,
that `U` is a rigid affinoid subdomain of `Sp(Â)` with `O_{Sp Â}(U)`
the completion of `O_X(U)` (see *dagger-affinoid-subdomain-completion*), and
that `ι_U` is flat (for rational `U` by the flatness of rational localisation in
*dagger-rational-localisation*, in
general by *dagger-affinoid-subdomain-completion* and faithful flatness of completions) (GK00 §2,
2.1, p. 9). *Needs:* *dagger-rational-localisation*; *dagger-tensor-product*;
*dagger-noether-normalisation*; *dagger-algebra*.

**Checks.**

- Computation: `U = {|X| ≤ |π|} ⊆ Sp(W_1)` is an affinoid
  subdomain with `O(U) = W_1⟨X/π⟩† ≅ K⟨Y⟩†` (`Y = X/π`).
- Degenerate: `U = Sp(A)` is an affinoid subdomain with
  `O(U) = A` and `ι = id`; `U = ∅` with `O(U) = 0`.
- Non-example: the open disc `{x : |X(x)| < 1} ⊆ Sp(W_1)` is
  not an affinoid subdomain: a representing `B` would have `|X|_sup < 1` on `Sp(B)`, hence
  `|X|_sup ≤ |ε| < 1` for some `ε` by the maximum modulus principle, so `U` would be contained in a
  disc of radius `< 1`.
- Compatibility: for `f₁, …, f_m, g ∈ A` generating
  the unit ideal, the affinoid subdomain `R(f/g) ⊆ Sp(A)` is the set of classical points
  of the Tau Ceti rational subset
  `TauCeti.ValuationSpectrum.rationalSubset Â° {f₁, …, f_m} g` of `Spa(Â, Â°)`.
  The classical valuation restricts to the ordering of the point norm on `A`.
  A further Check identifies its coordinate algebra with
  `A⟨f/g⟩†`, compatibly with the map from `A`.
- Characterisation: `U ⊆ Sp(A)` is an affinoid subdomain with
  algebra `B` iff `A → B` is a morphism inducing a bijection `Sp(B) ≅ U` that is universal for
  `D = A/m^k`, all maximal `m ∈ U` and `k ≥ 1` (the dagger analogue of BGR 7.2.2/1).

**A locally closed immersion of affinoid rigid spaces is Runge over a finite rational covering
(BGR 7.3.5/1).** (*rigid-locally-closed-immersion-runge*) Prove that for `K` a field complete for a
nontrivial nonarchimedean absolute value of rank one and `E → D` a homomorphism of `K`-affinoid
algebras defining a locally closed immersion `Sp(D) → Sp(E)` (bijective onto its image and surjective
on all local rings), there are finitely many rational subdomains `W_1, …, W_s` covering `Sp(E)` such
that each `Sp(D) ×_{Sp E} W_i → W_i` is a Runge immersion, i.e. factors as a closed immersion into a
Weierstrass domain of `W_i` (GK00 §2, proof of Prop. 2.5, p. 10, as quoted from BGR). The inclusion of
the Laurent domain `U = {|X| ≥ |π|} ⊆ Y := Sp(K⟨X⟩)` is an open (hence locally closed) immersion
which is Runge over the rational covering `W_1 = {|X| ≥ |π|^2}`, `W_2 = {|X| ≤ |π|^2}`:
`U ×_Y W_1 = U` is the
Weierstrass domain `{|π/X| ≤ 1}` of `W_1` (`X` is invertible on `W_1`), and `U ×_Y W_2 = ∅` is a
closed immersion. The covering `{|X| ≥ |π|}`, `{|X| ≤ |π|}` does not work: `U ×_Y {|X| ≤ |π|}` is the
circle `{|X| = |π|}` in the disc `{|X| ≤ |π|} ≅ Sp(K⟨Z⟩)` (`Z = X/π`), and a Weierstrass domain
`{|f_i| ≤ 1}` of that disc containing the circle is the whole disc (the Gauss norm of `f_i ∈ K⟨Z⟩`
is its supremum on `|Z| = 1`), while `K⟨Z⟩ → K⟨Z, Z^{-1}⟩` is not surjective, so the circle is not
Runge in the disc. The Gerritzen–Grauert theorem *gerritzen-grauert* (BGR 7.3.5/3) is derived from
this statement in BGR, so it is not an input here. *Needs:* *affinoid-subdomain*.

**Affinoid subdomains, stalks, open immersions and Runge immersions agree with their completions.**
(*dagger-affinoid-subdomain-completion*) Let `A` be a `K`-dagger algebra with completion `Â`,
`X = Sp(A)`, `X' = Sp(Â)`, identified as sets. Prove: (a) if `A → B` defines an affinoid subdomain
`U` of `X`, then `Â → B̂` defines the affinoid subdomain `U` of the rigid affinoid `X'` (GK00 §2.2, p. 10); (b) for
`x ∈ X` put `O_{X,x} = colim O_X(U)` over affinoid subdomains `U ∋ x`; the canonical maps
`O_{X,x} → O_{X',x}` are isomorphisms, hence a morphism of dagger algebras defines an open (resp.
locally closed) immersion iff the associated morphism of affinoid algebras does, and it defines a
Runge immersion (Weierstrass domain followed by a closed immersion) iff its completion does
(GK00 §2.4, p. 10, and the note following Prop. 2.5, p. 11); (c) for
`Â → D` a locally closed immersion of rigid affinoid spaces, *rigid-locally-closed-immersion-runge*
applied to `Â` gives a finite covering `X = ⋃ X_i` by rational subdomains
`X_i = Sp(A⟨f_i/g_i⟩†)`, with `f_i, g_i ∈ A` (by density of `A` in `Â` and the stability of
`R(f/g)` under small perturbation of `f, g`; compare the density argument in the proof of
GK00 Prop. 2.8, p. 11), over which
`Â⟨f_i/g_i⟩ → Â⟨f_i/g_i⟩ ⊗̂_Â D` is a Runge immersion; this is GK00 Prop. 2.5, p. 10.
The affine comparison of (a) is fixed as follows: contraction along
`A → Â` identifies the subset, and the isomorphism
`completion K O_X(U) ≃ O_{Sp(Â)}(U)` intertwines the completed restriction with
`Â → O_{Sp(Â)}(U)`. This compatibility fixes the isomorphism under `Â`.
*Needs:* *dagger-affinoid-subdomain*; *dagger-completion-comparison*; *fringe-presentation*;
*dagger-rational-localisation*; *rigid-locally-closed-immersion-runge*;
*rigid-adic-comparison-functor* (AdicSpacesPartII layer R1).

**Tate acyclicity for dagger algebras.** (*dagger-tate-acyclicity*) Let `K` be a complete rank-one
nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2), `A` a `K`-dagger algebra, `X = Sp(A)`
and `M` any `A`-module. Every finite covering `X = U_1 ∪ … ∪ U_n` by affinoid subdomains is acyclic
for the presheaf `U ↦ O_X(U) ⊗_A M`: the augmented Čech complex
`0 → M → ∏_i O_X(U_i) ⊗_A M → ∏_{i<j} O_X(U_i ∩ U_j) ⊗_A M → …` is exact (GK00 §2, Prop. 2.6, p.
11). *Needs:* *dagger-affinoid-subdomain*; *dagger-affinoid-subdomain-completion*;
*dagger-rational-localisation*; *overconvergent-weierstrass-division*.

**The G-topology of an affinoid dagger space is that of its completion; affinoid subdomains form a
basis.** (*dagger-g-topology*) Let `A` be a `K`-dagger algebra with completion `Â`. Prove: (a) a
morphism `ι : A → B` defines an affinoid subdomain iff `ι̂ : Â → B̂` does — the forward implication
is *dagger-affinoid-subdomain-completion* (a), the converse is what is proved here; if `ι` defines
an open immersion (bijective on local rings), its image is an affinoid subdomain; (b) giving `Sp(A)`
the G-topology induced from the strong G-topology of `Sp(Â)` via `Sp(A) = Sp(Â)`, the affinoid
subdomains of `Sp(A)` form a basis of this G-topology, every admissible covering of an affinoid
subdomain has a finite refinement by affinoid subdomains, and every affinoid subdomain of `Sp(Â)` is
a finite union of affinoid subdomains of `Sp(A)`; (c) in adic terms, every rational subset of
`Spa(Â, Â°)` is `R(f/g)` with `f, g ∈ A`, and every open covering of a quasi-compact open of
`Spa(Â, Â°)` is refined by a finite covering by such rational subsets (GK00 §2, 2.7). *Needs:*
*dagger-tate-acyclicity*; *dagger-affinoid-subdomain-completion*; *dagger-norm-and-continuity*;
*dagger-affinoid-subdomain*; *affinoid-supremum-seminorm* (AdicSpacesPartII layer R0).

The rational-subdomain identification of *dagger-affinoid-subdomain* specifies the
isomorphism under `A`: its composite with the restriction map of the subdomain is
the structure map `A → A⟨f/g⟩†` of *dagger-rational-localisation* (GK00 §2.1–2.2, pp. 9–10).

The transported affinoid site consists of the admissible opens and admissible covers of `Sp A`
with the resulting topology, whose covering sieves are characterised explicitly.
The basis and
finite-refinement properties of (b) are asserted on that site. The structure sheaf, its sections
and their
restrictions are identified with the universal dagger
subdomain algebras (GK00 §2.7 and Propositions 2.6 and 2.8, pp. 11–12).

### F1.7 dagger spaces, coherent modules and strict neighbourhoods

**Dagger spaces (rigid spaces with overconvergent structure sheaf).** (*dagger-space*) Let `K` be a
complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2). Rigid spaces are,
throughout, the quasi-separated Tate rigid-analytic spaces over `K` of *rigid-analytic-space* (AdicSpacesPartII layer
R1) (G-topological spaces locally isomorphic to `Sp(B)` for `K`-affinoid algebras `B`), compared
with adic spaces locally of finite type over `Spa(K, O_K)` by *rigid-adic-comparison-functor* (AdicSpacesPartII layer
R1), under which admissible opens and admissible coverings correspond to opens and open coverings. A
`K`-dagger space is a pair `(X, O†_X)` where `X` is a rigid space over `K` and `O†_X ⊆ O_X` is a
subsheaf of `K`-algebras for the G-topology of `X` such that `X` has an admissible covering by
affinoids `U = Sp(Â_U)` together with dagger algebras `A_U` with completion `Â_U` (a dagger
structure on `U`) for which `O†_X(V) = A_U⟨f/g⟩†` for every rational subdomain `V = R(f/g) ⊆ U` with
`f, g ∈ A_U`. A morphism `(X, O†_X) → (Y, O†_Y)` is a morphism of rigid spaces `φ : X → Y` over `K`
with `φ^♯(O†_Y) ⊆ φ_*O†_X`. The affinoid dagger space of a dagger algebra `A` is
`Sp(A) := (Sp(Â), O†_A)` with `O†_A(R(f/g)) = A⟨f/g⟩†`. This is Grosse-Klönne's definition 2.12
(locally G-ringed spaces with saturated G-topology admitting an admissible covering by affinoid
dagger spaces, *dagger-g-topology*) written, as in Vezzani 2.22, as a rigid space with a subsheaf;
through *rigid-adic-comparison-functor* it is equivalently a quasi-separated adic space locally of
finite type over `Spa(K, O_K)` with a subsheaf `O† ⊆ O` that is locally of the form
`R(f/g) ↦ A⟨f/g⟩†` on rational subsets of `Spa(Â, Â°)`. Dagger spaces are assumed quasi-separated.
Define dagger spaces as this structure (carrier: the rigid spaces of AdicSpacesPartII layer R1, equivalently the adic
spaces of AdicSpaces layer 5), their morphisms (with composition and identities),
`Sp(A)` (with `Γ(Sp A, O†) = A`), the faithful functor
`(X, O†) ↦ X`, Grosse-Klönne's `(·)'` (see *dagger-to-rigid-functor*), open
subspaces, fibre products `X ×_S Y` (glued from `Sp(A_1 ⊗†_B A_2)`, with the universal
property and `(X ×_S Y)' = X' ×_{S'} Y'`), base change `X ×_{Sp K} Sp K'` for `K'/K`
finite, and the closed dagger disc `D = Sp(K⟨X⟩†)` and the open disc
`D^0 = ⋃_{ε ∈ Γ*, ε<1} Sp(K⟨ε^{-1}X⟩†)`; prove
`Hom(Sp B, Sp A) ≅ Hom_K(A, B)`, `O†_{Sp A}(R(f/g)) = A⟨f/g⟩†`,
the equivalence with pairs (adic space locally of finite type over
`Spa(K, O_K)`, subsheaf `O† ⊆ O` locally of the form `R(f/g) ↦ A⟨f/g⟩†`), Vezzani's adic language,
via AdicSpacesPartII layer R1, and that `O†_{X,x} → O_{X,x}` is an isomorphism at classical
points, by *dagger-affinoid-subdomain-completion* (b) (GK00 §2, 2.12, p. 12). *Needs:*
*dagger-rational-localisation*; *dagger-tate-acyclicity*; *dagger-g-topology*;
*dagger-completion-comparison*; *dagger-norm-and-continuity*; *dagger-tensor-product*;
*rigid-analytic-space*, *rigid-adic-comparison-functor* (AdicSpacesPartII layer R1); *fibre-products-existence*
(AdicSpacesPartII layer R0).

**Checks.**

- Computation: `Γ(D, O†) = K⟨X⟩†` for the closed dagger disc
  `D = Sp(K⟨X⟩†)`, while `Γ(D', O) = K⟨X⟩` for the underlying rigid disc.
- Degenerate: `Sp(K)` is a point with `O† = O = K`; `Sp(0)` is empty.
- Non-example: `O_X` itself is not a dagger structure on the
  closed unit disc `X = Spa(K⟨X⟩)`: that would need a dagger algebra `A` with `A → Â` bijective and
  `dim A = 1`, but Noether normalisation `W_1 ↪ A` finite would then force `W_1 → T_1` to be
  bijective, which is false. So 'dagger space = rigid space' is a wrong definition (and it would
  also change de Rham cohomology, *dagger-de-rham-complex*).
- Compatibility: the underlying rigid space of `Sp(A)` is the
  affinoid rigid space `Sp(Â)` of *rigid-analytic-space* (AdicSpacesPartII layer R1), whose adic space is
  `Spa(Â, Â°)` (the Foundations of adic spaces roadmap (AdicSpaces), layer 5).
- Characterisation: morphisms `Sp(W_1) → Sp(W_1)` over `K`
  correspond to power-bounded elements of `W_1`, i.e. to `W_1^int = O_K⟨X⟩†` (Vezzani
  Proposition 2.14).

A dagger space extends the locally G-ringed space of AdicSpacesPartII R1 by an admissible dagger-affinoid
atlas. Its quasi-separatedness axiom requires each pair of charts to intersect in a finite
union of affinoid subdomains. `Sp` is the one-chart construction; an affinoid morphism is
identified with its pullback on global functions. The completion morphism is fixed
on global functions, and the global comparison commutes with morphisms of
locally G-ringed spaces, including their maps on sheaves.

**Coherent modules on dagger spaces.** (*dagger-coherent-module*) Let `X` be a `K`-dagger space. For
an affinoid `X = Sp(A)` and an `A`-module `M`, `M ⊗ O†_X` denotes the sheaf extending
`U ↦ M ⊗_A O†_X(U)` on affinoid subdomains (a sheaf by *dagger-tate-acyclicity*). An `O†_X`-module
`F` is coherent if there are an admissible (open) affinoid covering `X = ⋃ U_i`, `U_i = Sp(A_i)`,
finite `A_i`-modules `M_i` and isomorphisms `F|_{U_i} ≅ M_i ⊗ O†_{U_i}`. Coherent ideals, closed
immersions of dagger spaces (defined by coherent ideals), separated and finite morphisms are defined
as for rigid spaces. Define the functor `M ↦ M ⊗ O†_X` on `Sp(A)`
(exact on all modules, by flatness of affinoid subdomains), coherence of an `O†_X`-module by
the local condition above, and locally free modules of finite rank (coherent,
corresponding on `Sp(A)` to finite projective `A`-modules); prove that `M ⊗ O†_X` is
coherent for `M` finite, that coherent modules form an abelian subcategory closed
under kernels, cokernels, extensions, `⊗` and `Hom`, that `f^*F` is coherent with
`(g ∘ f)^* ≅ f^* g^*`, that coherent ideals `I ⊆ O†_X` correspond to
closed dagger subspaces, locally `Sp(A/I) → Sp(A)`, and that
`F ↦ F' = O_{X'} ⊗ (F(X) ⊗_A Â)` on affinoids, globalised, is a faithful exact functor
`coh(O†_X) → coh(O_{X'})` to the coherent sheaves of *coherent-sheaf* (AdicSpacesPartIII layer R3)
(*dagger-to-rigid-functor*) (GK00 §2, 2.14, p. 12). *Needs:* *dagger-space*;
*dagger-tate-acyclicity*; *dagger-g-topology*; *dagger-affinoid-subdomain*; *coherent-sheaf* (AdicSpacesPartIII layer
R3).

**Checks.**

- Computation: on `X = Sp(W_1)`, `(W_1/(X)) ⊗ O†_X` has stalk `K` at
  the origin and `0` elsewhere.
- Degenerate: the zero module and `O†_X` are coherent.
- Non-example: for the inclusion `j` of the open unit disc `D^0`
  into the closed dagger disc `D`, `j_*O†_{D^0}` is not coherent: its global sections (functions on
  the open disc) are not a finite `W_1`-module.
- Compatibility: for `M` finite over `A`,
  `(M ⊗ O†_{Sp A})' = (M ⊗_A Â) ⊗ O_{Spa Â}`, the coherent sheaf of *coherent-sheaf* (AdicSpacesPartIII layer R3)
  attached to the finite `Â`-module `M ⊗_A Â`.

The module category of a dagger space is Mathlib's `SheafOfModules` over its ring sheaf; coherence
uses its local finite-presentation predicate. The sections of `M ⊗ O†_X` are specified by the
tensor-product description on
subdomains, with its scalar action, restriction, and functoriality. The scalar-compatible
inverse on global sections is fixed
on pure tensors, together with its naturality in the module.

The completed module of an `O†_X`-module is the extension-of-scalars functor left adjoint to direct
image
along the completion ring map; that ring map is the structure-sheaf map of
the completion morphism, with scalars forgotten. Completion takes inverse images
of admissible opens and retains the rigid section rings. For an
affinoid subdomain `U` and finite `M`, the characteristic
section equation is `Γ(U′, (M ⊗ O†_X)′) ≅ O(U′) ⊗_A M`, linearly over
`O(U′)` (GK00 §2.14, p. 12).

**Checks.** The rigid ring sheaf has global rings `K`, zero, and `K⟨T⟩` for the point, the empty
space and the disc.
Completion preserves empty, whole, and proper admissible opens.
The completion ring map is bijective for the point and the empty space, and
for the disc it is not surjective, detecting the extra convergent
functions. The completed module satisfies the local tensor formula on affinoids;
it is the zero sheaf for the zero module and the
rigid structure sheaf for `O†`. The module stalk is the colimit of the actual restriction
diagram over admissible neighbourhoods; it is zero for the zero module,
the ringed-space stalk for `O†`, and for `W₁/(T)`
it is `K` at the origin and zero elsewhere. The open-disc noncoherence
Check states the nonfinite global section module and its consequence for any sheaf
with that global module.

**Coherent modules on affinoid dagger spaces come from finite modules (dagger Kiehl theorem).**
(*dagger-coherent-affinoid-kiehl*) Let `X = Sp(A)` be an affinoid `K`-dagger space and `F` a
coherent `O†_X`-module. Then there are a finite `A`-module `M` and an isomorphism `F ≅ M ⊗ O†_X`;
the functor `M ↦ M ⊗ O†_X` is an equivalence between finite `A`-modules and coherent `O†_X`-modules,
with quasi-inverse `F ↦ Γ(X, F)` (GK00 §2, Thm 2.16, p. 13). *Needs:* *dagger-coherent-module*;
*fringe-module-descent*; *dagger-affinoid-subdomain-completion*; *dagger-tate-acyclicity*;
*tate-kiehl-affinoid* (AdicSpacesPartIII layer R3).

The statement consists of essential surjectivity onto coherent modules, fullness and
faithfulness; the associated
module functor preserves finite limits and finite colimits. Theorem A below expresses global
generation by an epimorphism from a finite free associated sheaf; Theorem B uses
Mathlib's `CategoryTheory.Sheaf.H`, with its sheafification and Ext universe assumptions explicit.

**Theorems A and B for affinoid dagger spaces.** (*dagger-coherent-theorem-b*) Let `X = Sp(A)` be an
affinoid `K`-dagger space and `F` a coherent `O†_X`-module. Then `F` is generated by its global
sections and `H^n(X, F) = 0` for all `n ≥ 1` (GK00 §3, Prop. 3.1, p. 17). *Needs:*
*dagger-coherent-affinoid-kiehl*; *dagger-tate-acyclicity*; *dagger-g-topology*.

**Strict neighbourhoods of affinoids and the cofinal fringe system.** (*strict-neighbourhood*) Let
`K` be a complete rank-one nonarchimedean field (as in RigidAnalyticGeometry §1.5.1–1.5.2), with rigid
spaces and their adic spaces as in *dagger-space* (*rigid-analytic-space* and
*rigid-adic-comparison-functor*, AdicSpacesPartII layer R1). Let `W` be a rigid space and `U ⊆ W` an admissible open
for which the complement `W − U` is admissible open (e.g. `U` an affinoid subdomain or a finite
union of such). An admissible open `V ⊆ W` is a strict neighbourhood of `U` in `W` if `{W − U, V}`
is an admissible covering of `W`; equivalently, in the adic space of `W`, `V` contains the closure
`Ū` of `U` (Vezzani's `U ⋐_W V`). For a fringe presentation, the affinoid `Sp(T_n/IT_n)` is written
`Sp(C) ⊂† Sp(D)` inside `D = T_n(ρ_0)/I` (Grosse-Klönne 2.21), and for dagger spaces
`Sp(A) ⊂† Sp(B)` means `Sp(Â) ⊂† Sp(B̂)`. Cofinality: given `ρ_0 ∈ Γ*`, `ρ_0 > 1`, `I ⊆ T_n(ρ_0)`
and an open immersion `Sp(T_n(ρ_0)/I) → W`, the affinoids `V_ρ = Sp(T_n(ρ)/IT_n(ρ))`,
`ρ ∈ Γ* ∩ (1, ρ_0]`, form a cofinal system of strict neighbourhoods of `V_1 = Sp(T_n/IT_n)` in `W`.
(Strict neighbourhoods of tubes in frames, Berthelot's notion, belong to the rigid-cohomology
roadmap, not to this one.) Define the strict-neighbourhood relation by `{W − U, V}`
being an admissible covering of `W`, and the relation `Sp(A) ⊂† Sp(B)` (a
fringe-type open immersion); prove that `V` is a strict neighbourhood iff `Ū ⊆ V` in the adic
space, stability under intersections and under enlarging `V`,
transitivity through a quasi-compact `V_0` with `Ū ⊆ V_0 ⊆ V`,
that `f^{-1}(V)` is a strict neighbourhood of `f^{-1}(U)` for
`f : W' → W`, that each `V_ρ`, `ρ > 1`, is a strict neighbourhood of
`V_1` and every strict neighbourhood contains some `V_ρ`, and that
`Γ(Sp A, F^†) = colim_V Γ(V, G)` over strict neighbourhoods `V`, for `F` coherent on one (see
*overconvergent-sections-formula*) (GK00 §2, 2.22, p. 15). *Needs:* *fringe-presentation*;
*dagger-space*; *rigid-analytic-space*, *rigid-adic-comparison-functor* (AdicSpacesPartII layer R1).

**Checks.**

- Computation: in `W = {|X| ≤ ρ_0}`, the disc `{|X| ≤ ρ}`
  (`1 < ρ ≤ ρ_0`) is a strict neighbourhood of the closed unit disc `U`.
- Degenerate: `W` is a strict neighbourhood of every
  quasi-compact open `U ⊆ W`; if `U` is also closed (a union of connected components), `U` is a
  strict neighbourhood of itself.
- Degenerate: for `U = ∅` (complement `W`, admissible) every
  admissible open `V ⊆ W`, including `V = ∅`, is a strict neighbourhood of `U`: `{W, V}` is an
  admissible covering of `W`, and the closure of `∅` is `∅ ⊆ V`. For `U = W` (complement `∅`), `V` is
  a strict neighbourhood of `W` iff `V = W`.
- Non-example: the closed unit disc `U` is not a strict
  neighbourhood of itself in `{|X| ≤ ρ_0}`, `ρ_0 > 1`: the closure of `U` contains the rank-two
  point with `|X| = 1^+`, and `{W − U, U}` is not an admissible covering; likewise the open disc
  `{|X| < 1}` is not a strict neighbourhood of the closed disc.
- Compatibility: `V` is a strict neighbourhood of `U` iff
  `U ⋐_W V` in Vezzani's notation (the closure of `U` lies in `V`).
- Characterisation: for `W = {|X| ≤ ρ_0}`, every strict
  neighbourhood of the closed unit disc contains `{|X| ≤ ρ}` for some `ρ > 1`.

For the closure comparison, a point of the adic space of `W` is a completely prime filter of
admissible opens whose primality is tested against every admissible covering sieve.
The topology is generated by the sets `{x | U ∈ x}` for admissible opens `U`.
On `Sp A` this space is `Spa(A,A°)`, and admissible coverings are identified with open coverings.
Thus the
closure in the closure criterion above is the adic closure, not the closure
of the set of classical rigid points (Vezzani Remark 2.7, p. 4).

**Checks.** This space has one point for `K`;
it has no points for the zero algebra;
on the disc it has a strict specialization. The sets attached to `∅` and `W` are the empty and
whole opens; the set attached to the complement `W − U` is the interior of the complement,
explaining the closure
in the strict-neighbourhood criterion. The admissibility of `W − U` is explicit.

**Overconvergent sections are sections extending to a strict neighbourhood.**
(*overconvergent-sections-formula*) Let `X = Sp(A)` be an affinoid `K`-dagger space with an
immersion `X' ⊂† Y` of fringe type (`Y = Sp(T_n(ρ_0)/I)`), `F` a coherent `O†_X`-module and `F'` its
rigid counterpart. Choose a finite-module descent of `F` to a fringe stage, and let `G` be its associated coherent
`O_Y`-module with the induced identification `G|_{X'} ≅ F'` (after shrinking `Y`, by
*fringe-module-descent*). Prove that
`Γ(X, F) = {s ∈ Γ(X', G) : s extends to a strict neighbourhood of X' in Y} = colim_V Γ(V, G)` over
the strict neighbourhoods `V` of `X'` in `Y`; in particular
`Γ(X, O†) = A = colim_ρ Γ(Sp(T_n(ρ)/I), O)` (GK00 §2, 2.23).
The identification with a submodule of `Γ(X', F')` is the one from this descent.
An arbitrary rigid trivialisation need not preserve it: multiplication by a unit of `Â`
outside `A` carries the extendable submodule `A` to a different submodule of `Â`. *Needs:* *strict-neighbourhood*;
*fringe-module-descent*; *dagger-coherent-affinoid-kiehl*; *fringe-presentation*;
*dagger-completion-comparison*; *tate-kiehl-affinoid* (AdicSpacesPartIII layer R3).

**Relative compactness, partially proper and proper morphisms, and Stein spaces for dagger spaces.**
(*dagger-partially-proper*) Let `f : X = Sp(A) → Y = Sp(B)` be a morphism of affinoid `K`-dagger
spaces and `U ⊆ X` an affinoid subdomain. Write `U ⊂⊂_Y X` if there are a surjection
`τ : B⟨X_1, …, X_r⟩† → A` and `ε ∈ Γ*`, `ε < 1`, with `U ⊆ Sp(A⟨τ(X_1)^k/c, …, τ(X_r)^k/c⟩†)` for some `c ∈ K` and `k ≥ 1` such that `|c|^{1/k} = ε` (the dagger rational localisation on `{|τ(X_i)| ≤ ε}`). A
morphism `f : X → Y` of dagger spaces is partially proper if it is separated and there are
admissible affinoid coverings `Y = ⋃ Y_i` and `f^{-1}(Y_i) = ⋃ X_{ij}` such that each `X_{ij}`
satisfies `X_{ij} ⊂⊂_{Y_i} X̃_{ij}` for some admissible open affinoid `X̃_{ij} ⊆ f^{-1}(Y_i)`; `f`
is proper if it is quasi-compact and partially proper. A dagger space `X` is a Stein space if it has
an admissible affinoid covering `X = ⋃_{i∈ℕ} U_i` with `U_i ⊂† U_{i+1}` for all `i` (a Stein
covering). The same definitions apply to rigid spaces; Huber's partial properness is defined in
*partially-proper-morphism* (AdicSpacesPartII layer R0), and the two notions are identified by
*proper-separated-comparisons* (AdicSpacesPartII layer R1), whose converse direction needs `K°` discretely valued
or `f` locally quasi-finite. Define the
relation `U ⊂⊂_Y X`, partial properness (separated with the local `⊂⊂` condition), properness
(quasi-compact and partially proper) and Stein spaces (existence of a Stein covering); prove
that if `f` is partially proper then `f'` is partially proper as a
morphism of rigid, equivalently adic, spaces (Grosse-Klönne 2.25: the dagger-affinoid coverings
and the relations `X_{ij} ⊂⊂_{Y_i} X̃_{ij}`, which only involve points and completions, are
coverings and relations of the completions; the converse — that `f'` partially proper forces `f`
partially proper — is not in the sources and is not claimed: the rigid affinoids witnessing partial
properness of `f'` need not be dagger affinoids of `X`, and only over `Y = Sp(K)` does
*partially-proper-dagger-rigid-equivalence* supply a partially proper dagger structure on a
partially proper rigid space), that compositions and base changes of partially proper morphisms
are partially proper, that
Stein spaces are partially proper over `Sp(K)`, and that the interior `T ∩ (D^0)^m`
of an affinoid `T` with a closed immersion into a polydisc is Stein (GK00 §2, 2.24, p. 15).
*Needs:* *dagger-space*; *dagger-affinoid-subdomain*; *strict-neighbourhood*;
*dagger-completion-comparison*; *dagger-coherent-module*; *partially-proper-morphism*,
*separated-morphism* (AdicSpacesPartII layer R0); *rigid-analytic-space*, *rigid-adic-comparison-functor* (AdicSpacesPartII layer R1).

**Checks.**

- Computation: the open unit disc
  `D^0 = ⋃_{ε ∈ Γ*, ε<1} Sp(K⟨ε^{-1}X⟩†)` is a Stein space: for radii `ε_n ↑ 1` in `Γ*`, the dagger
  discs `U_n = Sp(K⟨ε_n^{-1}X⟩†)` satisfy `U_n ⊂† U_{n+1}`.
- Degenerate: the identity of any dagger space and
  `Sp(K) → Sp(K)` are proper.
- Non-example: the closed dagger disc `D = Sp(K⟨X⟩†)` is
  not partially proper over `Sp(K)`: `D ⊂⊂ D` fails (no `ε < 1` with `D ⊆ {|X| ≤ ε}`);
  correspondingly the rigid closed disc is not partially proper (Vezzani A.2).
- Compatibility: the dagger analytification of a
  separated finite type `K`-scheme is partially proper, and its underlying rigid space is partially
  proper in Huber's sense.

### F1.8 the dagger–rigid comparison

**The comparison functor from dagger spaces to rigid spaces.** (*dagger-to-rigid-functor*) Let `K` be
a field complete for a nontrivial nonarchimedean absolute value of rank one (`NontriviallyNormedField K`,
`IsUltrametricDist K`, `CompleteSpace K`). The functor `(·)' : (X, O†_X) ↦ X` from `K`-dagger spaces to
the quasi-separated rigid-analytic spaces of *rigid-analytic-space*, with the natural inclusion
`ν : O†_X ⊆ O_{X'}` of structure sheaves, is faithful and satisfies: (1) `Sp(A)' = Sp(Â)` for every
dagger algebra `A` (whose adic space is `Spa(Â, Â°)`); (2) `X` is connected (resp. regular) iff
`X'` is, and for `char K = 0`, `X` is normal (resp. reduced) iff `X'` is, by
*dagger-completion-comparison* (3). The backward implications hold in every characteristic.
(3) `X` and `X'` have the same opens and coverings (the same underlying
G-topological space) and `ν` is an isomorphism on local rings at classical points; (4) a morphism
`ρ : X → Y` is a closed immersion (resp. open immersion, locally closed immersion, isomorphism,
quasi-compact, separated) iff `ρ'` is; (5) if `ρ` is finite, so is `ρ'`; (6) if `Y` is a quasialgebraic
rigid space (admissibly covered by opens of analytifications of affine finite type `K`-schemes; e.g. `Y`
smooth), there are an admissible affinoid covering `Y = ⋃ V_i` and affinoid dagger spaces `U_i` with
`U_i' ≅ V_i`, and `U_i` is unique up to (non-canonical) isomorphism (the uniqueness is
*dagger-approximation* (2) and carries its field hypothesis). On coherent modules, `F ↦ F'` (with
`F' = O_{X'} ⊗ (F(X) ⊗_A Â)` on `X = Sp(A)`, glued) is a faithful exact functor
`coh(O†_X) → coh(O_{X'})` with a natural injection of underlying abelian sheaves `F → F'`.
Define the functor from dagger spaces to rigid spaces over `K` forgetting the
overconvergent structure sheaf (identity on morphisms), the injective
map `ν : O†_X → O_{X'}` of sheaves of `K`-algebras, and the faithful exact functor
`F ↦ F'` on coherent modules with its injection `F → F'`; prove faithfulness (a morphism of dagger
spaces is a
morphism of the underlying rigid spaces with `φ^♯(O†_Y) ⊆ φ_*O†_X`),
`(Sp A)' ≅ Sp(Â)`, the six-fold equivalence (4),
the four-fold equivalence (2), (5),
(6), and
`r_K((Sp A)') ≅ Spa(Â, Â°)`, so that the adic space of a dagger affinoid is that of its completion
(GK00 §2, Thm 2.19, p. 14; the coherent comparison functor GK00 §2, 2.20, p. 14). *Needs:*
*dagger-space*; *dagger-coherent-module*; *dagger-completion-comparison*;
*dagger-finite-morphism-comparison*; *dagger-domain-and-integral-closure*;
*dagger-affinoid-subdomain-completion*; *dagger-approximation*; *dagger-rational-localisation*;
*rigid-analytic-space*; *rigid-adic-comparison-functor*; *rigid-analytification*; *coherent-sheaf*;
*tate-kiehl-affinoid*; *gerritzen-grauert*.

**Checks.**

- Computation: for the closed dagger disc `D = Sp(K⟨X⟩†)`, `D'` is the rigid
  closed disc `Sp(K⟨X⟩)` and `Γ(D, O†) = K⟨X⟩† ⊊ K⟨X⟩ = Γ(D', O)`.
- Non-example: `(·)'` is not full on affinoids: for `a ∈ K⟨X⟩ ∖ K⟨X⟩†` with
  `|a| < 1`, `X ↦ X + a` is an automorphism of `D'` that does not preserve `O†` (it sends `X` to an
  element of `T_1 ∖ W_1`); a definition making `(·)'` an equivalence on affinoid dagger spaces fails
  this test.
- Degenerate: `(Sp K)' = Sp K` and `ν : O† → O` is the identity on the
  one-point space.
- Compatibility: for `A = K⟨X⟩†`, `r_K((Sp A)') = Spa(K⟨X⟩, K°⟨X⟩)`,
  the adic closed unit disc of *rigid-adic-comparison-functor*.
- Characterisation: for a classical point `x` of `D`,
  `ν_x : O†_{D,x} → O_{D',x}` is an isomorphism although `Γ(D, O†) → Γ(D', O)` is not surjective.

**On partially proper dagger spaces coherent modules are those of the associated rigid space.**
(*partially-proper-coherent-equivalence*) Let `X` be a partially proper (see *dagger-partially-proper*),
quasi-separated `K`-dagger space. Then the functor `(·)' : coh(O†_X) → coh(O_{X'})` of
*dagger-to-rigid-functor* is an equivalence of categories, and `Γ(X, M) = Γ(X', M')` for every coherent
`O†_X`-module `M` (GK00 §2, Thm 2.26, p. 15; the Stein case and the reduction to Stein spaces in its
proof, p. 16). For the open unit disc `D^0` this says that coherent `O†_{D^0}`-modules are the coherent
modules of the rigid open disc, with `Γ(D^0, O†) = Γ(D^0', O)` the series converging on the open disc,
whereas for the closed disc (not partially proper) `Γ(D, O†) = K⟨X⟩† ≠ K⟨X⟩ = Γ(D', O)`. *Needs:*
*dagger-to-rigid-functor*; *overconvergent-sections-formula*; *dagger-partially-proper*;
*dagger-coherent-affinoid-kiehl*; *strict-neighbourhood*; *coherent-sheaf*.

**Partially proper dagger spaces are equivalent to partially proper rigid spaces.**
(*partially-proper-dagger-rigid-equivalence*) The functor `(·)'` of *dagger-to-rigid-functor*
restricts to an equivalence between the category of `K`-dagger spaces partially proper over `Sp(K)`
(see *dagger-partially-proper*) and the category of partially proper rigid spaces over `K`. In particular
every partially proper rigid space (e.g. every rigid space without boundary, every Stein space, the
analytification of every separated finite type `K`-scheme) carries a dagger structure, unique up to unique
isomorphism (GK00 §2, Thm 2.27, p. 16, with essential surjectivity from its proof; Vezzani §2,
Ex. 2.23). Thus the rigid open unit disc and the rigid affine line `A^{1,an}` have unique dagger
structures, the open dagger disc `D^0` and the dagger affine line, while the rigid closed disc is not
partially proper and its dagger structures are unique only up to non-canonical isomorphism
(see *dagger-approximation*). *Needs:* *partially-proper-coherent-equivalence*; *dagger-partially-proper*;
*dagger-to-rigid-functor*; *overconvergent-sections-formula*; *partially-proper-morphism*;
*rigid-analytic-space*.

**Checks.**

- Degenerate: the equivalence identifies the dagger point `Sp(K)` with the rigid point `Sp(K)`.
- Computation: the rigid open unit disc has the unique partially proper dagger structure `D^0`.
- Non-example: the rigid closed unit disc is not an object of the partially proper subcategory;
  the equivalence does not assert uniqueness of its dagger structure.

**Coherent cohomology of partially proper dagger spaces equals that of the associated rigid space.**
(*dagger-coherent-cohomology-comparison*) Let `X` be a partially proper, quasi-separated `K`-dagger
space and `F` a coherent `O†_X`-module. Then `H^i(X, F) = H^i(X', F')` for all `i ≥ 0`. If `X` is a
Stein space, these groups vanish for `i > 0` (GK00 §3, Thm 3.2, p. 17; the proof uses Kiehl's
Theorem B on the rigid side, *quasi-stein-theorems-a-b*). For `X = D^0` the open unit disc,
`H^i(D^0, O†) = H^i(D^0', O) = 0` for `i > 0`. *Needs:* *partially-proper-coherent-equivalence*;
*dagger-coherent-theorem-b*; *overconvergent-sections-formula*; *dagger-partially-proper*;
*quasi-stein-theorems-a-b*.

**Dagger analytification of separated schemes of finite type.** (*dagger-analytification*) Let `K` be a field
complete for a nontrivial nonarchimedean absolute value of rank one (`NontriviallyNormedField K`,
`IsUltrametricDist K`, `CompleteSpace K`) and `X` a separated `K`-scheme of finite type. Its dagger
analytification `X^†` is the partially proper `K`-dagger space with `(X^†)' = X^an`, the rigid
analytification of *rigid-analytification*, which exists and is unique up to unique isomorphism by
*partially-proper-dagger-rigid-equivalence* because `X^an` is partially proper. `X ↦ X^†` is a functor,
compatible with open and closed immersions and fibre products; for `X` affine with presentation
`K[X_1..X_n]/(f)`, `X^† = ⋃_{ρ ∈ Γ*} Sp(K⟨ρ^{-1}X⟩†/(f))`. For `X` proper, coherent cohomology
satisfies GAGA: `H^i(X, F) ≅ H^i(X^†, F^†)` for coherent `F`. Define
the dagger analytification `X ↦ X^†` from separated finite type `K`-schemes
(Mathlib `AlgebraicGeometry.Scheme` over `Spec K`) to dagger spaces. Its rigid counterpart is the restriction of Part II's
*rigid-analytification* to this domain. Prove that `(X^†)' ≅ X^an` naturally in `X`,
that morphisms between separated finite type `K`-schemes induce morphisms of dagger
analytifications, compatibly with identities and composition, that `X^† → Sp(K)` is partially proper,
that `(A^n)^† = ⋃_{ρ∈Γ*} Sp(K⟨ρ^{-1}X_1, …, ρ^{-1}X_n⟩†)`, with
`Γ((A^n)^†, O†)` the ring of entire series, that
`(X ×_S Y)^† ≅ X^† ×_{S^†} Y^†` for a diagram `X → S ← Y` of separated finite type `K`-schemes,
that open (closed) immersions between such schemes go to open (closed) immersions of dagger spaces,
and GAGA (for `X` proper, `F ↦ F^†` is an equivalence of coherent sheaves and
`H^i(X, F) ≅ H^i(X^†, F^†)`) (GK00 §3, 3.3, p. 18
(definition, construction through the equivalence 2.27, and GAGA); GK02 §0, p. 3). *Needs:*
*partially-proper-dagger-rigid-equivalence*; *dagger-coherent-cohomology-comparison*;
*dagger-partially-proper*; *rigid-analytification*; *rigid-analytic-space*; *proper-gaga*; Mathlib
`AlgebraicGeometry.Scheme`.

**Checks.**

- Computation: `Γ((A^1)^†, O†)` is the ring of series `Σ a_m X^m` with
  `|a_m|ρ^m → 0` for all `ρ > 0` (entire functions).
- Degenerate: `(Spec K)^† = Sp(K)` and `(Spec L)^† = Sp(L)` for a finite
  extension `L/K`.
- Non-example: `(A^1)^†` is not an affinoid dagger space (it is
  not quasi-compact), although `A^1` is affine.
- Negative control: over `K = ℚ_p`, the smooth finite type scheme
  `X = A^1_K ⨿_{G_m,K} A^1_K` with doubled origin is not separated. In `X^an`, the two closed
  unit-disc neighbourhoods of the origins meet in the punctured closed disc, which is not
  quasi-compact: its covering by `|p|^n ≤ |T| ≤ 1`, `n ≥ 1`, has no finite subcover.
  Thus `X^an` is not quasi-separated and cannot be the completion of a partially proper dagger
  space in these categories (Conrad-IC Appendix A.1, p. 32).
- Compatibility: the underlying rigid space of `(A^1)^†` is the rigid
  analytic affine line `A^{1,an}` of *rigid-analytification*.
- Characterisation: `H^1((P^1)^†, O(−2))` is one-dimensional, as for the
  scheme `P^1` (GAGA).

**Identity principle on connected smooth dagger spaces.** (*dagger-identity-principle*) The identity
principle on a `K`-dagger space `X` with `X'` connected and normal (a section of `O†_X`, or of a
locally free `O†_X`-module of finite rank, vanishing on a nonempty open subset vanishes) is the rigid
identity principle *rigid-identity-principle* (AdicSpacesPartII layer R1) on `X'`, transported along
*dagger-to-rigid-functor* (2), (3), which carry connectedness, normality, opens and local rings
between `X` and `X'` (Conrad-IC §2.1, Lem. 2.1.4, p. 12; GK00 §2, Thm 2.19 (2), (3), p. 14); it is
used here for connected smooth dagger spaces and for 1-forms. 
*Needs:* *dagger-to-rigid-functor*; *dagger-space*; *rigid-analytic-space*;
*rigid-identity-principle*.

### F1.9 differentials and the overconvergent de Rham complex

**The module of (universally finite) differentials `Ω^1_A` of a dagger algebra and the exterior
derivative.** (*dagger-differentials*) Let `A` be a `K`-dagger algebra, `K` a field complete for a
nontrivial nonarchimedean absolute value of rank one (`NontriviallyNormedField K`,
`IsUltrametricDist K`, `CompleteSpace K`). The module of differentials of `A` is a finite `A`-module
`Ω^1_A = Ω^1_{A/K}` with a `K`-derivation `d : A → Ω^1_A` that is universal among `K`-derivations of
`A` into finite `A`-modules: every `K`-derivation `D : A → M`, `M` finite, is `u ∘ d` for a unique
`A`-linear `u`. Explicitly, for a presentation `A = W_n/(f_1, …, f_r)`:
`Ω^1_A = (⊕_i A dX_i) / (Σ_j (∂f_k/∂X_j) dX_j)_k` with `d g = Σ_i (∂g/∂X_i) dX_i`. Equivalently
`Ω^1_A = J/J^2` for `J` the kernel of the multiplication `A ⊗†_K A → A` (Kedlaya's module of
continuous differentials, Kedlaya06 §3.1, Def. 3.1.2). Put `Ω^i_A = ⋀^i_A Ω^1_A` with `d` extended by
`d(a db_1 ∧ … ∧ db_i) = da ∧ db_1 ∧ … ∧ db_i`. These sheafify to coherent `O†_X`-modules `Ω^i_X` on
every dagger space `X`, with `(Ω^i_X)' = Ω^i_{X'}`. For a finitely generated algebra `S` over a
complete DVR `O_K` the same construction gives `Ω^1_{S†/O_K}` (van der Put's `D^1`, vdP §2, (2.3),
p. 36), with `Ω^1_{S†/O_K} ⊗ K = Ω^1_{S†⊗K}`. In `Dagger`, define `Omega` as `Ω^1_{A/K}`, the quotient
of Mathlib's `KaehlerDifferential K A` by the intersection of the submodules with finite quotient, and
`Omega.d` as the universal derivation `d : Derivation K A (Ω^1_A)`; prove `Omega.existsUnique_lift`
(`Ω^1_A` is finitely generated, and for
`D : Derivation K A M` with `M` finite there is a unique `A`-linear `u : Ω^1_A → M` with `u ∘ d = D`,
that is, `u (d a) = D a`, two `A`-linear maps out of `Ω^1_A`
agreeing on all `d a` being equal), `Omega.washnitzerBasis`
(`Ω^1_{W_n}` is free on `dX_1, …, dX_n` with `d g = Σ (∂g/∂X_i) dX_i`; Kedlaya06 §3.1, after
Def. 3.1.2), the presentation formula (for `A = W_n/I`, `Ω^1_A ≅ (Ω^1_{W_n} ⊗ A)/(A·dI)`, with its
relations),
`Omega.projective_of_isRegularRing` (for `char K = 0`: if `A` is regular, e.g. of MW-type or with
`Sp(A)` smooth, `Ω^1_A` is finite projective, Mathlib `Module.Projective`; in characteristic `p`
regularity does not suffice — `K = 𝔽_p((t))`, `p` odd, `A = K⟨X, Y⟩†/(Y^p − X^2 − t)` is regular
with `Ω^1_A` of fibre rank 2 at `X = 0`), the canonical
surjection `Ω[A⁄K] → Ω^1_A` from Mathlib's Kähler differentials, compatible with the derivations,
an isomorphism when `A` is finite over
`K`, that `Ω^1_A ⊗_A Â` is the module of continuous differentials of the affinoid
`Â` (*continuous-differentials*), functoriality (`φ : A → B` induces `Ω^1_A → Ω^1_B`, `da ↦ dφ(a)`,
`φ`-linear on `a db` and compatible with identities and composition),
`Ω^1_{A⟨f/g⟩†} ≅ Ω^1_A ⊗_A A⟨f/g⟩†`,
`Ω^1_{A⟨T⟩†/K} ≅ (A⟨T⟩† ⊗_A Ω^1_A) ⊕ A⟨T⟩† dT`, hence
`Ω^q_{A⟨T⟩†} = A⟨T⟩† ⊗ Ω^q_A ⊕ A⟨T⟩† dT ∧ Ω^{q−1}_A`, and that the extension of `d` to
`Ω^•_A = ⋀^•Ω^1_A` satisfies `d ∘ d = 0`. Define the `K`-linear exterior derivatives in each
degree `q` by
`d(a db_1 ∧ … ∧ db_q) = da ∧ db_1 ∧ … ∧ db_q` in every degree, including `q = 0`.
This determines the differential and its graded Leibniz convention (GK00 §4, 4.1, p. 19; GK02 §1,
1.2, p. 5, for the universal property; Kedlaya06 §3.1, after Def. 3.1.2, p. 19, for regular `A`:
regular ⇒ locally free). *Needs:* *overconvergent-tate-algebra*;
*overconvergent-tate-algebra-properties*; *dagger-algebra*; *dagger-tensor-product*;
*dagger-rational-localisation*; *dagger-coherent-module*; *weak-completion-presentation*;
*continuous-differentials*; *sheaf-of-continuous-differentials*; Mathlib `KaehlerDifferential`,
`KaehlerDifferential.D`, `Derivation`, `ExteriorAlgebra.exteriorPower`, `Module.Projective`.
Lean: `Dagger.Omega`, `Dagger.Omega.d`, `Dagger.Omega.existsUnique_lift`, `Dagger.Omega.washnitzerBasis`,
`Dagger.Omega.projective_of_isRegularRing`.

**Checks.**

- Degenerate: `d(c) = 0` for `c ∈ K`.
- Computation: in `W_2`,
  `d(X dY) = dX ∧ dY ≠ 0`; higher differentials cannot all be zero.
- Convention: `d(Y dX) = −dX ∧ dY`.
  Thus the two summands in `d(d(XY)) = d(X dY + Y dX)` cancel, also in characteristic two.
- Computation: for `A = K⟨X, X^{-1}⟩†`, `Ω^1_A` is free of rank 1 on `dX` and
  `d(X^m) = m X^{m−1} dX` for all `m ∈ ℤ`.
- Degenerate: `Ω^1_K = 0`, and `Ω^1_L = 0` for a finite separable extension `L/K`.
- Negative control: in characteristic `2`, let `a` be
  a nonsquare with `0 < |a| < 1`, for example the uniformiser of `𝔽₂((t))`. The dagger
  curve `Y² = a + X³` is regular: at `X = 0` its maximal ideal is generated by `X`,
  and away from `X = 0` the Jacobian has rank one. Its differentials satisfy
  `X² dX = 0`, with nonzero `dX` at that point, so they are not projective. Thus
  the projectivity statement carries the characteristic-zero hypothesis.
- Non-example: if `char K = 0` with residue characteristic `p`, the series
  `exp(λ_1X), …, exp(λ_NX)` with `|λ_i| < |p|^{1/(p−1)}` and `λ_i` linearly independent over `ℚ` lie in
  `W_1` and are algebraically independent over `K(X)`, so Mathlib's `KaehlerDifferential` `Ω[W_1⁄K]`
  has rank `≥ N + 1` over `Frac(W_1)` for every `N` and is not finite; the correct `Ω^1_{W_1}` is
  `W_1 dX`.
- Compatibility: `Ω^1_{W_n} ⊗_{W_n} T_n ≅ ⊕ T_n dX_i`, the continuous
  differentials of the Tate algebra.
- Characterisation: for `A = W_2/(Y^2 − X^3 − 1)`,
  `Ω^1_A = (A dX ⊕ A dY)/(2Y dY − 3X^2 dX)`, projective of rank 1 because `2Y` and `3X^2` generate the
  unit ideal of `A` (`char K ≠ 2, 3`).

**Smooth dagger spaces.** (*dagger-smooth-space*) A `K`-dagger space `X` (`K` a field complete for a
nontrivial nonarchimedean absolute value of rank one: `NontriviallyNormedField K`,
`IsUltrametricDist K`, `CompleteSpace K`) is smooth if its associated rigid space `X'`
(see *rigid-analytic-space*) is smooth over `K`, i.e. its adic space (see *rigid-adic-comparison-functor*) is
smooth over `Spa(K, O_K)` in the sense of *smooth-morphism*. Equivalently: for every affinoid
`Sp(A) ⊆ X`, `A` is regular and `Ω^1_A` is projective of rank equal to the local dimension;
equivalently `X` is locally étale over a dagger polydisc. For smooth `X` the function
`x ↦ dim O_{X,x}` is locally constant and `Ω^1_X` is locally free of that rank. `X` has pure
dimension `n` if
`dim O_{X,x} = n` at every point (GK02 §0, p. 4); disconnected spaces whose pieces all have
dimension `n` are allowed, and then `ω_X := Ω^n_X`, which is defined only for pure dimension. A
smooth `X` is the disjoint union of its open and closed pure-dimensional parts `X_n`; every
statement below with a fixed shift (`n`, `2n`, `d`) or with `ω_X` is made for pure dimension
(Convention 14), and for arbitrary smooth `X` it holds on each `X_n`. The cohomology of `X` is then
assembled from that of the `X_n`: ordinary (de Rham and coherent) cohomology is the product
`∏_n H(X_n)` over the components, and compactly supported cohomology is the direct sum
`⊕_n H_c(X_n)`; the two agree with the sum when only finitely many dimensions occur, for example
for quasi-compact `X`. Define smoothness as the
predicate that the structure morphism of `X'` is smooth, and pure dimension (`dim X = max dim O_{X,x}`;
`X` is pure dimensional if all local dimensions agree); prove that `X` is smooth
iff for all affinoid `Sp(A) ⊆ X`, `A` is regular and `Ω^1_A` is projective of rank the local
dimension, that a smooth `X` is covered by opens étale over dagger polydiscs
(Vezzani §3, Prop. 3.6), that for smooth `X` of pure dimension `n`, `Ω^1_X` is
locally free of rank `n` and `ω_X := Ω^n_X` is invertible, that opens and products of
smooth dagger spaces are smooth, that if `X` is a smooth `K`-scheme, `X^†` is
smooth, and that if `S` is a smooth finitely generated `O_K`-algebra, `O_K` a
DVR, `Sp(S† ⊗ K)` is smooth (GK00 §4, 4.1, p. 19; the equivalence GK02 §1, 1.2, p. 5). *Needs:*
*dagger-space*; *dagger-differentials*; *dagger-completion-comparison*; *dagger-to-rigid-functor*;
*dagger-approximation*; *smooth-morphism*; *smooth-local-structure*; *rigid-adic-comparison-functor*.

**Checks.**

- Computation: the dagger polydisc `Sp(W_n)` is smooth of pure dimension `n`,
  with `Ω^1` free on `dX_1..dX_n`.
- Degenerate: `Sp(K)` is smooth of dimension 0; `Sp(L)` is smooth for `L/K`
  finite separable.
- Non-example: `Sp(K⟨X, Y⟩†/(XY))` is reduced but not smooth (`Ω^1` has rank 2
  at the origin); `Sp(W_1/(X^2))` is not smooth (not reduced).
- Compatibility: `X` is smooth iff `X'` is smooth over `K` in the sense of
  *smooth-morphism*.
- Non-example (pure dimension): `Sp(K × W_1) = Sp K ⨿ Sp W_1` is smooth of Krull dimension `1`
  but not pure-dimensional (Lean `example`: `K × W_1` is a dagger algebra of Krull dimension `1`
  with a factor of dimension `0`). For `char K = 0` it has `H^0_dR = K²`, `H^0_{dR,c} = K` (the
  point) and `H^2_{dR,c} = K` (the disc), so no single shift pairs `H^0_dR` with `H^2_{dR,c}`,
  while the duality holds on each part.
- Positive control: `Sp W_1 ⨿ Sp W_1` is pure of dimension `1`, although it is disconnected.
- Computation (infinitely many components): for `X = ⨿_{n≥0} Sp W_n` over `ℚ_p`,
  `H^0_dR(X) = ∏_n K`, the product and not the direct sum, while `H_{dR,c}(X)` is the direct sum
  of the `H_{dR,c}(Sp W_n)`; product and sum differ because infinitely many components occur.

**The overconvergent de Rham complex of a smooth dagger space, with coefficients in a module with
integrable connection.** (*dagger-de-rham-complex*) Let `X` be a smooth `K`-dagger space (`K` a field
complete for a nontrivial nonarchimedean absolute value of rank one: `NontriviallyNormedField K`,
`IsUltrametricDist K`, `CompleteSpace K`). The de Rham complex `Ω^•_X = (Ω^0_X → Ω^1_X → Ω^2_X → …)`
is the complex of coherent locally free `O†_X`-modules `Ω^i_X = ⋀^i Ω^1_X` with the `K`-linear exterior
derivative `d` (see *dagger-differentials*). More generally, for a coherent `O†_X`-module `E` with an
integrable connection `∇ : E → E ⊗ Ω^1_X` (`K`-linear, `∇(fe) = f∇e + e ⊗ df`, `∇_1 ∘ ∇ = 0`),
`DR(E) = E ⊗ Ω^•_X` with differentials `∇_i`. The de Rham cohomology is the hypercohomology
`H^i_dR(X, E) := H^i(X, DR(E))` on the site of `X`, and `H^i_dR(X) := H^i_dR(X, O†_X)`. For
`X = Sp(A)` affinoid, `H^i_dR(X, E) = H^i(Γ(X, E) ⊗_A Ω^•_A)`. For `X'` the associated rigid space,
`(Ω^i_X)' = Ω^i_{X'}` and `DR(E)' = DR(E')`; but in general `H^i_dR(X) ≠ H^i_dR(X')` (see the checks).
On affinoid algebras, the de Rham complex is built by Mathlib's
`CochainComplex.of` from the exterior powers and the exterior derivatives of
*dagger-differentials*; its degree-zero
cohomology for the zero algebra is zero. The
zero-variable case is `K` in degree zero, while in
characteristic `p`, `X^{p−1}dX` gives nonzero `H¹` and `X^p` is a nonconstant closed function.
Define the de Rham complex `Ω^•_X`, a cochain complex of sheaves of `K`-vector spaces
(Mathlib `CochainComplex`) with terms `Ω^i_X`, modules with integrable connection (a coherent
`O†_X`-module `E` with a `K`-linear `∇` satisfying Leibniz and `∇_1 ∘ ∇ = 0`),
`DR(E)` (with `DR(O†_X, d) = Ω^•_X`),
`H^i_dR(X, E) := H^i(X, DR(E))`, and tensor products, duals and pullbacks
of modules with integrable connection; prove that for `X = Sp(A)`,
`H^i_dR(X, E) = H^i(Γ(X, E) ⊗_A Ω^•_A)`, that `d ∘ d = 0` and
`d(ω ∧ η) = dω ∧ η + (−1)^{deg ω} ω ∧ dη`, that `f : X → Y` induces
`f^* : H^i_dR(Y) → H^i_dR(X)`, with identity and composition laws, that the natural map
`H^i_dR(X, E) → H^i_dR(X', E')` is induced by `ν`, an isomorphism when `X` is partially proper
(*dagger-rigid-de-rham-comparison*), and that (if `char K = 0`,
`H^0_dR(X) = ker(d : O†(X) → Ω^1(X))` is the subalgebra of functions that become locally constant after extension to an algebraic closure of `K`; it equals `L` for `X = Sp(L)` with `L/K` finite separable, and equals `K` for nonempty geometrically connected `X`; in characteristic `p` the kernel contains all `p`-th powers) (GK00 §4, 4.1,
p. 19; de Rham cohomology as hypercohomology GK00 §4, 4.8, p. 21; for affinoid dagger spaces of MW-type
this is Monsky–Washnitzer cohomology, Kedlaya01 §2, p. 3). For `char K = 0` a coherent module with
integrable connection is a left `D_X`-module, and `DR(E)` is the derived de Rham functor of
*dagger-d-modules* applied to it; F1.10 uses that functor on all of `D(D_X)`, whose objects (such as
algebraic local cohomology) need not be coherent. *Needs:* *dagger-differentials*;
*dagger-smooth-space*; *dagger-coherent-module*; *dagger-coherent-theorem-b*;
*dagger-to-rigid-functor*; *dagger-space*; Mathlib `ExteriorAlgebra.exteriorPower`, `CochainComplex`.
Lean: `Dagger.Omega.poincare_washnitzer` (degrees `0` and `1` on the polydisc, the first Check
below); the complex and its cohomology are specified in this README only.

**Checks.**

- Computation: for the closed dagger disc `D = Sp(K⟨X⟩†)` (`char K = 0`):
  `H^0_dR(D) = K` and `H^1_dR(D) = 0`, since every `f dX` with `f ∈ K⟨X⟩†` has the overconvergent
  primitive `Σ a_m X^{m+1}/(m+1)` (see *dagger-polyannulus-de-rham-cohomology*).
- Degenerate: `H^0_dR(Sp K) = K` and `H^i_dR(Sp K) = 0` for `i > 0`; for
  `Sp(L)`, `L/K` finite separable, `H^0_dR = L` (connected, not geometrically connected); for
  `A = 0` the complex is zero and `H^0_dR(∅) = 0`.
- Non-example: for the rigid closed disc `D' = Spa(K⟨X⟩)` over `K = ℚ_p`,
  the form `ω = Σ_n p^n X^{p^n − 1} dX` is not exact (its formal primitive `Σ X^{p^n}` is not in
  `K⟨X⟩`), and `H^1_dR(D')` is infinite-dimensional; `D` and `D'` have the same points, so de Rham
  cohomology is not determined by the underlying point set. A definition `H_dR(X) := H_dR(X')` fails.
- Computation: for the dagger annulus `A = Sp(K⟨X, X^{-1}⟩†)` with
  `char K = 0`: `H^1_dR(A) = K·[dX/X]`.
- Compatibility: for `S` a smooth finitely generated `O_K`-algebra (`O_K` a complete
  DVR of mixed characteristic), `H^i_dR(Sp(S† ⊗ K)) = H^i(Ω^•_{S†⊗K})`, the Monsky–Washnitzer cohomology of `S/πS` (Kedlaya01 §2, p. 3; vdP §2).
- Negative control: in characteristic `p`, `X^{p−1}dX` is not exact on the dagger disc and `X^p`
  is a nonconstant closed function (Lean `example` for the first).

**Differential operators and the derived de Rham functor.** (*dagger-d-modules*) Let
`char K = 0` and `X` a smooth dagger (or rigid) space. Let `I` be the ideal of the diagonal in
`O_{X×X}` and `P^m_X = O_{X×X}/I^{m+1}`, an `O_X`-algebra through the first factor; then
`D_X = colim_m Hom_{O_X}(P^m_X, O_X)` is a sheaf of rings, `O_X` is a left `D_X`-module through the
second factor, and "`D_X`-module" means left module (GK02 §1, 1.1). On an affinoid with étale
coordinates `x_1, …, x_n`, `D_A = ⊕_α A ∂^α` with `∂_i = ∂/∂x_i`, so `D_X` is locally free as a
left and as a right `O_X`-module, and `D_A` is noetherian of cohomological dimension `dim A`
(GK02 1.2). Prove: (a) for pure dimension `n`, `ω_X` is a right `D_X`-module
(`ω·∂ = −Lie_∂ ω`), and `M ↦ ω_X ⊗_{O_X} M`, with inverse `N ↦ Hom_{O_X}(ω_X, N)`, is an
equivalence from left to right `D_X`-modules (GK02 1.3); (b) the Spencer complex
`0 → D_X ⊗ ⋀^n T_X → … → D_X ⊗ T_X → D_X → O_X → 0`, `T_X` the tangent sheaf, is a locally free
resolution, so that `DR(M) := RHom_{D_X}(O_X, M)` on the derived category `D(D_X)` is computed by
`M ⊗ Ω^•_X`, restricts to *dagger-de-rham-complex* on coherent modules with integrable
connection, gives `H^r_dR(X) = H^r(X, DR(O_X))`, and for pure dimension `n` satisfies
`DR(M) ≅ ω_X ⊗^L_{D_X} M[−n]` (GK02 1.5). Characteristic `0` is assumed because in
characteristic `p` the operator `∂^p` kills every `X^m` though the divided power `∂^{[p]}` does
not. *Needs:* *dagger-smooth-space*; *dagger-differentials*; *dagger-de-rham-complex*;
*dagger-coherent-module*; Mathlib `CategoryTheory.Sheaf`, `DerivedCategory`.

**Checks.**

- Computation: on `Sp W_1` the Spencer complex is `D ·∂→ D` (right multiplication by `∂`) with
  cokernel `O`, and `DR(O)` is `W_1 →d W_1 dX`.
- Computation: the right action gives `(g dX)·∂ = −g′ dX`, so `ω ⊗_D O = W_1 dX/{g′ dX}`, which is
  `H^1_dR` in degree `1` after the shift.
- Negative control: in characteristic `p`, `∂^p` kills every `X^m` though `∂^{[p]}` does not.

**Transfer bimodules and direct images.** (*dagger-d-module-direct-image*) Let `char K = 0` and
`f : Z → Y` a morphism of smooth pure-dimensional dagger spaces. Define the transfer bimodules
`D_{Z→Y} = O_Z ⊗_{f^{-1}O_Y} f^{-1}D_Y` and `D_{Y←Z} = ω_{Z/Y} ⊗_{O_Z} D_{Z→Y}`, with
`ω_{Z/Y} = ω_Z ⊗ f^*ω_Y^{⊗−1}` (GK02 §1, 1.1, 1.4); for partially proper `f`, the compactly
supported direct image `f_!F(V) = Γ_c(f^{-1}V/V, F)` (sections whose support is quasi-compact over
every quasi-compact admissible open of `V`, Huber96 5.6 as recalled in GK02 1.6) with its derived
functor `Rf_! : D^+ → D^+`; and `f_+M = Rf_!(D_{Y←Z} ⊗^L_{D_Z} M)` for `M ∈ D^−(D_Z)` when `f` is of
one of the two kinds needed: projections `X × Y → Y` with `X` admissibly covered by finitely many
opens, each Zariski closed in an open polydisc (so that `R^if_!` vanishes above a fixed degree and
`Rf_!` extends to `D^−`), and closed immersions (for which the local structure of `Z` in `Y` is that of
*dagger-tubular-neighbourhood* (a)–(b), as in GK02 §1, proof of Prop. 1.7). For these, prove
`g_+f_+ ≅ (g ∘ f)_+` (GK02 Prop. 1.7); `DR(f_+M)[dim Y] ≅ Rf_! DR(M)[dim Z]` (GK02 1.9(a)); and, for the projection
`p : X × Y → Y`, `Ω^•_{X×Y/Y} ≅ D_{Y←X×Y} ⊗^L_{D_{X×Y}} O_{X×Y}[−dim X]` (GK02 1.5). No other
functor of a six-functor formalism is a target. *Needs:* *dagger-d-modules*;
*dagger-partially-proper*; *dagger-smooth-space*; *dagger-coherent-module*;
*dagger-tubular-neighbourhood*.

**Checks.**

- Degenerate: for `X = Sp K` the projection gives `p_+ = id`.
- Computation: for the origin `s : Sp K → Sp W_1`, `s_+K = D_{X←pt} ≅ D/Dx`, the module
  `K[∂]·δ` with `x·∂^kδ = −k∂^{k−1}δ`, which is supported at the origin and is not a finite
  `W_1`-module.

**De Rham cohomology of dagger polyannuli and the relative Poincaré lemma.**
(*dagger-polyannulus-de-rham-cohomology*) Let `K` be a field of characteristic 0 complete for a
nontrivial nonarchimedean absolute value and `Γ* = √|K^×|`. Prove that (a) for `0 ≤ r ≤ n` and
`μ, γ_i (i ≤ r), δ_i (i ≤ n)` in `Γ*` with `γ_i ≤ δ_i` and `Π_{i≤r} δ_i ≥ μ`, the affinoid dagger space
`V = {x ∈ A^{n,†} : Π_{i≤r}|x_i| ≥ μ, |x_i| ≤ δ_i for all i, |x_i| ≥ γ_i for i ≤ r}` has `H^q_dR(V)`
with `K`-basis the classes of `dX_{i_1}/X_{i_1} ∧ … ∧ dX_{i_q}/X_{i_q}`, `1 ≤ i_1 < … < i_q ≤ r` — in
particular for `r = 0` (a closed dagger polydisc) `H^0_dR(V) = K` and `H^q_dR(V) = 0` for `q > 0` — and
for every smooth dagger space `X` the Künneth maps
`⊕_{q_1+q_2=q} H^{q_1}_dR(X) ⊗_K H^{q_2}_dR(V) → H^q_dR(X × V)` are bijective; (b) the same holds, both
as a dagger space and as a rigid space, for the open version
`V° = {x : Π_{i≤r}|x_i| > μ, |x_i| < δ_i for all i, |x_i| > γ_i for i ≤ r}` under the hypotheses
`γ_i < δ_i` (`i ≤ r`) and `Π_{i≤r} δ_i > μ` (Grosse-Klönne prints `Π δ_i < μ`, which would make `V°`
empty: for `n = r = 1`, `V° = {γ_1 < |x| < δ_1, |x| > μ}` is nonempty iff `max(γ_1, μ) < δ_1`, i.e.
iff `δ_1 > μ` given `γ_1 < δ_1`, whereas `δ_1 < μ` gives `|x| < δ_1 < μ < |x|`; in general
`Π|x_i| < Π δ_i`, so `Π δ_i ≤ μ` forces `V° = ∅`, and `Π δ_i > μ` gives the point with `|x_i|`
slightly below `δ_i`; the same reading fixes the closed version, where `Π δ_i ≥ μ` is exactly the
nonemptiness of `V`, attained at `|x_i| = δ_i`). Conventions: the empty product for `r = 0` is `1`,
so the hypothesis reads `μ ≤ 1` (resp. `μ < 1`) and the conditions on `Π|x_i|` are vacuous; when
`Π δ_i = μ` the closed `V` is the product of the circles `|x_i| = δ_i` (`i ≤ r`) and the discs
`|x_i| ≤ δ_i` (`i > r`), and the basis `dX_I/X_I`, `I ⊆ {1, …, r}`, is that of a product of `r`
circles (GK02 §2, Lem. 2.1 (a), p. 15, for the statement, the polydisc case and the Künneth statement;
the section assumes `K = Frac(R)` for a complete DVR `R` of mixed characteristic `(0, p)`, p. 15, but
the proof uses only `char K = 0` through the polynomial growth of `|1/m|`, which justifies the
characteristic-0 form; Vezzani, Introduction, for why the rigid closed disc behaves differently). Thus
the closed dagger disc has `H^1_dR = 0`, the dagger annulus `γ ≤ |x| ≤ δ` has `H^1_dR = K·dX/X`, the
open rigid annulus `γ < |x| < δ` has `H^1_dR = K·dX/X`, while the closed rigid disc over `K = ℚ_p` has
infinite-dimensional `H^1_dR`. In Lean, `Dagger.Omega.poincare_washnitzer` states the case
`r = 0`, `V = Sp(W_n)`, in degree `0` for every `n` and in degree `1` for `n = 1`, under
`[CharZero K]` only (no discreteness, no residue
characteristic), which is the generality claimed here; the higher degrees, the polyannuli and the
Künneth clause are specified in this README only. *Needs:* *dagger-de-rham-complex*; *dagger-tensor-product*;
*dagger-rational-localisation*; *strict-neighbourhood*; *overconvergent-tate-algebra*;
*dagger-coherent-cohomology-comparison*; *quasi-stein-theorems-a-b*.

**Checks.**

- Computation: for `K = ℚ_p`, `n = 1`, `f = Σ_m p^m X^m ∈ W_1`
  (restricted for `ρ < p`): the primitive `Σ_m p^m X^{m+1}/(m+1)` has `|p^m/(m+1)| ≤ (m+1) p^{-m}`,
  so it is restricted for every `ρ < p` too; `H^1_dR(Sp W_1) = 0`.
- Degenerate: `n = 0`: `W_0 = K`, the complex is `K` in degree `0`,
  `H^0 = K`, `H^q = 0` for `q > 0`; for the zero dagger algebra `A = 0` (`Sp(0) = ∅`, not a polydisc)
  the complex is zero and `H^0_dR = 0 ≠ K`, so `H^0 = K` is a statement about nonempty connected
  spaces.
- Negative control: for `char K = p`, `d : W_1 → W_1 dX` has kernel
  containing `K[X^p] ≠ K` and `X^{p−1}dX` is not exact; both `H^0 = K` and `H^1 = 0` fail, and
  `[CharZero K]` cannot be dropped (Lean `example`).
- Negative control: `n = r = 1`, `γ_1 = 1`, `δ_1 = |π|^{-1}`,
  `μ = |π|^{-2}`: `Π δ_i = |π|^{-1} < μ`, and `V° = {1 < |x| < |π|^{-1}, |x| > |π|^{-2}} = ∅`; with
  `μ = 1 < δ_1` instead, `V°` is the open annulus `1 < |x| < |π|^{-1}` with `H^1_dR = K·dx/x`.
- Non-example: over `K = ℚ_p`, the rigid closed disc has infinite-dimensional `H^1_dR`, so (a)
  fails with `K⟨X⟩` in place of `K⟨X⟩†`. For pairwise disjoint infinite subsets `S_j` of the
  positive integers, the forms `ω_j = Σ_{m∈S_j} p^m X^{p^m−1} dX` belong to `K⟨X⟩dX`.
  Their formal primitives have coefficient `1` at exponents `p^m`, `m ∈ S_j`. Every nonzero
  finite linear combination has a fixed nonzero primitive coefficient on one such infinite
  subset, so its primitive is not restricted. Thus the classes `[ω_j]` are linearly independent.
- Opposite-field computation: for `K = ℚ((t))` with its `t`-adic absolute value, every nonzero
  integer has norm `1`. For `f = Σ_{n≥0} a_n X^n ∈ K⟨X⟩`, the primitive
  `J(f) = Σ_{n≥0} (a_n/(n+1)) X^{n+1}` belongs to `K⟨X⟩` because
  `|a_n/(n+1)| = |a_n| → 0`. Hence the closed rigid disc has `H^1_dR = 0`, as does the dagger
  disc; characteristic zero alone does not give the rigid-disc non-example.

**De Rham cohomology of a smooth partially proper dagger space equals that of its rigid space (and
fails to for affinoids).** (*dagger-rigid-de-rham-comparison*) Let `X` be a smooth partially proper
`K`-dagger space. Then the natural map `H^i_dR(X) → H^i_dR(X')` is an isomorphism for all `i`. The
partial properness hypothesis cannot be dropped: for the closed unit disc over `K = ℚ_p`,
`H^1_dR(D) = 0` while `H^1_dR(D')` is infinite-dimensional, although `D` and `D'`
have the same underlying points and G-topology (GK00 §3, 3.3, p. 18, statement and proof; GK02 §0,
p. 3; the non-example GK02, Introduction, p. 1). For `char K = 0`: for `X = D^0` the open unit disc
(Stein, partially proper), `H^1_dR(D^0) = H^1_dR(D^0') = 0`; for `X = (A^1)^†`, `H^i_dR` agrees with
the rigid (and algebraic) de Rham cohomology of `A^1`. *Needs:* *dagger-de-rham-complex*;
*dagger-coherent-cohomology-comparison*; *dagger-polyannulus-de-rham-cohomology*;
*dagger-partially-proper*; *dagger-smooth-space*.

**De Rham cohomology of a smooth dagger space depends only on its rigid space.**
(*dagger-de-rham-rigid-invariance*) Let `K` be a field of characteristic 0 complete for a nontrivial
nonarchimedean absolute value. Let `X_1, X_2` be smooth `K`-dagger spaces and `φ : X_1' → X_2'` an
isomorphism of the associated rigid spaces (not assumed to preserve `O†`). Then `φ` induces an
isomorphism `φ† : H^*_dR(X_2) → H^*_dR(X_1)`. Grosse-Klönne asserts without proof that `φ ↦ φ†` is
compatible with composition; that compatibility is not part of the statement (GK02 §1, Lem. 1.18,
p. 14, with its proof; the composition assertion GK02 §1, after Lem. 1.18, p. 15). For `X_1 = X_2 = D`
the closed dagger disc and `φ` the rigid automorphism `X ↦ X + a` with `a ∈ K⟨X⟩ ∖ K⟨X⟩†`, `|a| < 1`,
`φ` does not preserve `O†`, yet `φ† : H_dR(D) → H_dR(D)` exists (both are `K` in degree 0); two dagger
structures on the same smooth affinoid rigid space have isomorphic de Rham cohomology. *Needs:*
*dagger-polyannulus-de-rham-cohomology*; *dagger-approximation*; *dagger-de-rham-complex*;
*dagger-tensor-product*; *dagger-to-rigid-functor*; *dagger-finite-morphism-comparison*;
*strict-neighbourhood*.

**Strictness and closed image of de Rham differentials on smooth affinoid and Stein dagger spaces.**
(*dagger-strict-differentials*) Let `K` be discretely valued of characteristic 0; in the affinoid case
let `K` moreover be the fraction field of a complete discrete valuation ring of mixed characteristic
`(0, p)`, which is what the finiteness theorem *dagger-de-rham-finiteness-and-base-change* needs
(the footnote's hypothesis "discretely valued and of characteristic 0" admits residue
characteristic 0, where the finiteness input is not sourced). Prove that for `X` a smooth affinoid
`K`-dagger space or a smooth Stein `K`-dagger space whose de
Rham cohomology groups are finite-dimensional — a hypothesis of this statement, which for affinoid
`X` is supplied by Theorem A (*dagger-de-rham-finiteness-and-base-change*) under (MWF) and (RES) of
F1.11, and holds for example for the interior `X_ρ ∩ {|x_i| < ρ}` of a fringe
stage of a smooth affinoid dagger space, by *dagger-de-rham-finiteness-and-base-change* — every
differential `d^i : Ω^i_X(X) → Ω^{i+1}_X(X)` is strict and has closed image, for the Fréchet topology of
global sections of a Stein space, resp. the fringe topology (see *fringe-topology*) of a finite module over
a dagger algebra (GK00 §4, Lem. 4.7, p. 21, whose hypotheses are present in the arXiv version and
missing in the published one; the footnote to Lem. 4.7, p. 21, records that finiteness is used in the
proof). For `X = Sp(W_1)`, `d : W_1 → W_1 dX` is surjective (see *dagger-polyannulus-de-rham-cohomology*),
in particular strict with closed image; for the rigid disc over `K = ℚ_p`,
`d : K⟨X⟩ → K⟨X⟩dX` has non-closed image
(its closure contains `Σ p^n X^{p^n−1}dX`). For regular `A` the statement is made in degree zero
and, for strictness and closed image, in every
affinoid degree, on the actual exterior powers of `Ω^1_A`. Both forms assume `[CharZero K]`,
discreteness through a pseudo-uniformiser `π`, and residue characteristic `p > 0` through
`‖(p : K)‖ < 1`. The Stein assertion uses the global-sections carrier of the dagger space. *Needs:*
*dagger-de-rham-complex*; *fringe-topology*;
*dagger-partially-proper*; *dagger-de-rham-finiteness-and-base-change*;
*dagger-polyannulus-de-rham-cohomology*; *fringe-presentation*.

### F1.10 supports, compact support and duality

**De Rham cohomology with supports in the complement of an admissible open.**
(*de-rham-cohomology-with-supports*) Let `X` be a smooth `K`-dagger (or rigid) space and `j : U → X`
the inclusion of an admissible open with complement `Y = X − U` (a closed subset, not given a space
structure). For a sheaf `F` on `X` let `Γ_Y(F) = ker(F → j_*j^{-1}F)` and `RΓ_Y` its right derived
functor; for a complex such as `Ω^•_X` define `H^i_Y(X, Ω^•_X) := H^i(X, RΓ_Y Ω^•_X)` (and likewise
`H^i_Y(X, F)` for coherent `F`). There is a distinguished triangle
`RΓ_Y(X, Ω^•) → RΓ(X, Ω^•) → RΓ(U, Ω^•) →`, a Mayer–Vietoris triangle
`RΓ_{Y∩Y'} → RΓ_Y ⊕ RΓ_{Y'} → RΓ_{Y∪Y'} →` when `U ∪ U'` is an admissible covering of an admissible
open, and for `Z ⊆ Y` closed a triangle `RΓ_Z → RΓ_Y → Rj'_*RΓ_{Y−Z}j'^{-1} →` with `j' : X − Z → X`.
Define the groups `H^i_Y(X, Ω^•_X)` for `Y` the complement of an admissible
open, and `H^i_Y(X, F)` for coherent `F`; prove the long exact sequence
`… → H^i_Y(X) → H^i_dR(X) → H^i_dR(X − Y) → H^{i+1}_Y(X) → …`, excision (for an
admissible open `V ⊆ X` containing `Y` such that `{X − Y, V}` is an admissible covering of `X`, i.e. `V`
a strict neighbourhood of `Y`, *strict-neighbourhood*, `H^i_Y(X) ≅ H^i_Y(V)`; without the
admissibility condition this fails: for `Y = V` the closed unit disc in `X_ρ`,
`H^*_Y(V) = H^*_dR(V) = K` in degree 0, whereas `H^*_Y(X_ρ) = K` in degree 2),
the Mayer–Vietoris long exact sequence for `Y ∩ Y'`, `Y`, `Y'`,
`Y ∪ Y'`, the sequence for `Z ⊆ Y` closed,
`… → H^i_Z(X) → H^i_Y(X) → H^i_{Y−Z}(X − Z) → H^{i+1}_Z(X) → …`, functoriality (for
`f : X' → X` with `f^{-1}(Y) ⊆ Y'`, a functorial map `H^i_Y(X) → H^i_{Y'}(X')`), and
`H^i_∅(X) = 0`, `H^i_X(X) = H^i_dR(X)` (GK02 §1, 1.15, p. 11, for the
setting, `Y` as a closed subset, `RΓ_Y` and Mayer–Vietoris; GK00 §4, 4.8, p. 21, for compactly
supported de Rham cohomology as cohomology with supports in `X ⊂ Sp(T_m(ρ)/I)`). *Needs:*
*dagger-de-rham-complex*; *dagger-space*; *dagger-smooth-space*.

**Checks.**

- Computation: for `char K = 0` and `ρ > 1` in `Γ*`, take
  the **dagger** disc `X_ρ = {|x| ≤ ρ}` and support `Y = {|x| ≤ 1}`. Then
  `H^0_Y = H^1_Y = 0` and `H^2_Y = K·dx/x`. In the complement `1 < |x| ≤ ρ`, forms
  overconverge across the outer boundary; termwise integration removes every Laurent
  monomial except `x⁻¹ dx`. This is a dagger calculation. Ordinary rigid de Rham cohomology
  on the closed outer boundary does not have this Poincaré property; the rigid-fringe
  compact-support calculation below instead uses the quotient of Laurent sections.
- Degenerate: `H^i_∅(X, Ω^•) = 0` and `H^i_X(X, Ω^•) = H^i_dR(X)`.
- Non-example: `H^i_Y(X)` is not the de Rham cohomology of
  `Y`: for `char K = 0` and `Y` the closed unit disc in `X_ρ`, `H^0_dR(Y) = K` but `H^0_Y(X_ρ) = 0`.
- Compatibility: for coherent `F`, `H^i_Y(X, F)` is the local
cohomology used by GK00 §4, 4.3 for `H^i_c(X, F)`, and for `i = 0` it is the space of sections
  of `F` supported in `Y`.
- Convention: the connecting map of the cone convention sends two entries `a, b` to `−a − b`.

**Algebraic local cohomology of `D_X`-modules.** (*dagger-algebraic-local-cohomology*) Let
`char K = 0`, `X` a smooth dagger space, `Y ⊆ X` closed with coherent ideal `J`, and `E` a
`D_X`-module (*dagger-d-modules*). Define `Γ*_Y(E) = colim_k Hom_{O_X}(O_X/J^k, E)`, the sections
killed by a power of `J`, and `E(∗Y) = colim_k Hom_{O_X}(J^k, E)`. Prove that both are
`D_X`-modules, although no single `Hom_{O_X}(O_X/J^k, E)` is: an operator of order `≤ m` maps
sections killed by `J^k` to sections killed by `J^{k+m}`, by induction on `m` through the
commutators `[P, f]` for `f ∈ J` (GK02 §1, 1.8, p. 7). Prove further: (a) their derived functors
on `D(D_X)` give triangles `RΓ*_Y K → K → RK(∗Y) →`; since `D_X` is locally free over `O_X`,
injective `D_X`-modules are injective `O_X`-modules, so the underlying `O_X`-modules are
`R^iΓ*_Y E = colim_k Ext^i_{O_X}(O_X/J^k, E)`. With *dagger-d-module-direct-image* (GK02 1.9,
Prop. 1.10): (b) `RΓ*_T(p_+M) ≅ p_+RΓ*_{T_Z}M` for a closed `T ⊆ Y` and `T_Z = T ×_Y Z`; (c)
`RΓ*_{Y_1}RΓ*_{Y_2} ≅ RΓ*_{Y_1∩Y_2}`, with the Mayer–Vietoris triangle; (d)
`RΓ*_Y(O_X) ⊗^L_{O_X} M ≅ RΓ*_Y(M)`; (e) for affinoid `X`, `Y` locally a complete intersection of
pure codimension `d` and `F` a `D_X`-module locally free over `O_X`, `R^iΓ*_Y F = 0` for `i ≠ d`;
(f) for closed immersions `Z ⊆ Y` and `s : Y → X` of codimension `d`, `X`, `Y` smooth and
pure-dimensional, `s_+RΓ*_Z O_Y ≅ RΓ*_Z O_X[d]`. *Needs:* *dagger-d-modules*;
*dagger-d-module-direct-image*; *dagger-coherent-module*; *de-rham-cohomology-with-supports*.

**Checks.**

- Computation: for the origin of `Sp W_1`, `R^1Γ*_0 O = W_1[x^{-1}]/W_1`, which is not a finite
  `W_1`-module (pole orders are unbounded), and `[x^{-1}] ↦ δ` identifies it with
  `s_+K = D/Dx` (`∂^k[x^{-1}] = (−1)^k k![x^{-k−1}]`), which is (f) for a point.
- Computation: for `Y = {x_1 = 0}` in a polydisc, `R^1Γ*_Y O = O[x_1^{-1}]/O` and the other
  `R^iΓ*_Y O` vanish, as (e) predicts.

**Tubular neighbourhoods of smooth closed immersions, locally on affinoid charts, and the local
branches of a strict normal crossings divisor.** (*dagger-tubular-neighbourhood*) Let `K` be a
field complete for a nontrivial nonarchimedean absolute value of rank one and `i : Z → X` a closed
immersion of smooth `K`-dagger spaces with `Z` of pure codimension `d`. Prove that (a) (Kiehl's
tubular neighbourhood theorem, chart by chart) there is an admissible affinoid covering
`(X_j)_j` of `X` and, for every `j` and every `ρ < 1` in `√|K^×|`, an admissible open
neighbourhood `V_{j,ρ}` of `Z_j := Z ∩ X_j` in `X_j` with an isomorphism
`V_{j,ρ} ≅ Z_j × D^d(ρ)`, `D^d(ρ) = {|t_1|, …, |t_d| < ρ}` the open polydisc, under which `i|_{Z_j}`
is the zero section `t = 0` and the projection `V_{j,ρ} → Z_j` restricts to the identity on `Z_j`;
for `ρ' < ρ` the isomorphisms are compatible with `D^d(ρ') ⊆ D^d(ρ)`; and the `V_{j,ρ}`, `ρ < 1`,
are cofinal among the admissible open neighbourhoods of `Z_j` in `X_j` with quasi-compact
complement (Kiehl67 Thm. 1.18, for rigid spaces, transported to dagger spaces along
*dagger-to-rigid-functor* on the fringe stages; GK02 §1, proof of Prop. 1.7, p. 6, and proof of
Prop. 1.16(B), p. 12, where the products are used locally on an admissible covering). (b)
(Local comparison, and its finite global form) (b1) On each chart, for a sheaf `F` on `X`, the
colimit over admissible open neighbourhoods of `Z_j` in `X_j` with quasi-compact complement of
`RΓ(V, F)` is `colim_ρ RΓ(V_{j,ρ}, F)`, by the cofinality in (a); on a finite overlap `X_j ∩ X_k`
the two systems `V_{j,ρ} ∩ X_k` and `V_{k,ρ} ∩ X_j` are mutually cofinal (each contains a member
of the other after shrinking `ρ`), so these chart-local colimits are independent of the chart data
and form, with their restriction maps, a well-defined object on the covering. This sheaf-level
statement holds for every smooth `X` and is what *dagger-local-cohomology-comparison* (b) and the
closed-immersion case of *dagger-d-module-direct-image* consume. (b2) If `X` is quasi-compact,
covered by finitely many `X_j` with quasi-compact pairwise intersections, then the global
colimit `colim_V RΓ(V, F)` over admissible open neighbourhoods `V ⊇ Z` with quasi-compact
complement is computed by the Čech complex of that finite covering with the chart-local colimits
of (b1) on the simplices, since a filtered colimit commutes with the finite products of the Čech
complex and with the cohomology of a bounded-below complex; this finite form is what
*compact-support-log-comparison* consumes (its ambient `X` is proper). (b3) The finite form does
not extend to infinite coverings without a further theorem: for `X = ⨿_{n≥0} D_n` a disjoint
union of closed dagger unit discs over `ℚ_p`, `Z = ⨿_n {0_n}`, and the coherent sheaf `F` with
`F|_{D_n} = O_{D_n}/(t_n − 1)` (a skyscraper at `w_n = 1`), every chart-local colimit vanishes
(small tubes around `0_n` miss `w_n`), so the Čech complex of the chart-local colimits is `0`,
while a neighbourhood `V ⊇ Z` with quasi-compact complement contains all but finitely many of the
`D_n` entirely, so the global degree-`0` colimit is `(∏_n K)/(⊕_n K) ≠ 0`. (c) (Local branches of
an SNC divisor and orientation-aware descent) For a strict normal crossings divisor `D ⊆ X`
(*dagger-snc-divisor*), on a chart `X_j` with `D ∩ X_j = V(x_1 ⋯ x_r)` the branches
`B_{j,1} = V(x_1), …, B_{j,r} = V(x_r)` are the irreducible components of `D` locally at each point
of the chart, so they are determined by `D` up to order *locally*: branch matching between two
charts is defined after a common refinement, at each point of an overlap, and not as a bijection
between the full branch lists of the two charts — branches can disappear on an overlap (for
`D = V(xy)` a chart meeting both axes has two branches, while on the locus `x ≠ 0` only `V(y)`
survives). Use the chart-local branch data, with restrictions deleting branches that miss a
refinement; the full branch set is *not* locally constant on `D` (its cardinality drops from the
node of `V(xy)` to the nearby points `(a, 0)`, `a ≠ 0`), and no global branch sheaf is asserted.
For each `s ≥ 1`, construct `D^{(s)}` by glueing the chart-local disjoint unions of the strata
`D_I = ⋂_{i∈I} B_{j,i}`, `|I| = s`, along the common-refinement branch data: a smooth dagger space
of pure codimension `s` with a finite map `ι_s : D^{(s)} → X` that is *not* a closed immersion in
general (`D^{(1)}` is the normalisation of `D`, `D^{(2)}` the normalisation of the locus of double
points), and the tubular neighbourhoods of (a) are applied to each local immersion `D_I → X_j`.
Let `E_s` be the rank-`s` local system on `D^{(s)}` of the `s` selected branches (of constant
cardinality `s`, so genuinely locally constant there) and `ε_s := ⋀^s K^{E_s}` its orientation
line, a rank-one local system whose transition under a
relabelling of the branches is the sign of the induced permutation. The chart-local complexes
`ι_*Ω^•_{D_I}` of *compact-support-localisation-maps* (a) glue to the complexes
`ι_{s*}(Ω^•_{D^{(s)}} ⊗_K ε_s)` with alternating face maps — signed descent of differential forms
produces forms with coefficients in the orientation system, not the untwisted sheaf
`ι_{s*}Ω^•_{D^{(s)}}`: on two branches, `δ(a, b) = b| − a|` on `O_{B_1} ⊕ O_{B_2} → O_{B_{12}}` has
`δ ∘ τ = −δ` for the swap `τ(a, b) = (b, a)`, so the square commutes only after the target is
multiplied by `−1`, which is exactly the transition of `ε_2` (Deligne71 §3.1.4–3.1.5, pp. 31–32,
the orientation local systems on the normalised multiple intersections). Prove that the resolution
of the cokernel of `Ω^•_X(log D)(−D) → Ω^•_X` by the `ι_{s*}(Ω^•_{D^{(s)}} ⊗ ε_s)`, formed chart by
chart from the smooth branches, descends to a global resolution; that the exact sequence for
removing one smooth branch (*compact-support-localisation-maps* (a)) is a chart-level statement,
a global long exact sequence with `(X, D')` requiring a genuine global decomposition
`D = D_1 + D'` with `D_1` a globally smooth component; that when the global irreducible components
are smooth and globally ordered each `ε_s` is trivialised and the untwisted formula is recovered
(a special case, never imposed on the nodal/self-intersection scope); and that applying (a) and
(b1) to the local immersions `D_I → X_j`, with (b2) when `X` is quasi-compact, computes the
neighbourhood colimit of `Ω^•_X` along `D` compatibly with the localisation maps. No global
product neighbourhood of `Z` in `X` is asserted, and the de Rham assertions of this target and its
Checks are for `char K = 0`, the hypothesis of *dagger-polyannulus-de-rham-cohomology* (the
geometric statements (a), (b1)–(b3) and the branch descent hold for every `K`). *Needs:*
*dagger-smooth-space*; *dagger-coherent-module*; *dagger-to-rigid-functor*; *dagger-snc-divisor*;
*dagger-polyannulus-de-rham-cohomology*; *de-rham-cohomology-with-supports*.

**Checks.**

- Degenerate: for the zero section `Z = {t = 0} ⊆ Z × D^d(1)` of a product with an open polydisc,
  a single tubular trivialisation `V_ρ = Z × D^d(ρ)` with the identity isomorphism suffices (the
  ambient factor is an open polydisc, so this is one trivialisation, not one affinoid chart).
- Computation (`char K = 0`): for a `K`-rational point of the closed dagger disc `D^1`,
  `V_ρ = {|t| < ρ}`, `colim_ρ RΓ(V_ρ, Ω^•) = K` in degree `0` (*dagger-polyannulus-de-rham-cohomology*),
  and the supports sequence gives `H^2_{{0}}(D^1, Ω^•) = K`, the Gysin class of the point. In
  characteristic `p` this fails: `t^p` is a nonconstant closed germ and `t^{p−1}dt` has no
  primitive on any smaller disc.
- Non-example (global product): a hyperplane `H ⊆ (P^n)^†`, `n ≥ 2`, has no admissible open
  neighbourhood isomorphic to `H × D^1(ρ)` with `H` as the zero section, since such an isomorphism
  would trivialise the normal bundle `O_H(1)`, nontrivial for `H = P^{n−1}`, `n ≥ 2` (for `n = 1`
  the hyperplane is a point, its normal bundle is trivial and a disc neighbourhood exists); the
  theorem is local on `(P^n)^†` and the charts `X_j` of (a) may be taken to be the standard
  affinoid charts.
- Non-example (infinite covering): the disjoint union of discs with the skyscraper sheaf of (b3);
  (b2) requires the finite covering.
- Control (local branches): for the analytified nodal cubic `D = V(y^2 − x^2(1 + x))` of
  *dagger-snc-divisor*, `D` is irreducible and singular, `D^{(1)}` is its normalisation (two
  branches `y = ±x√(1 + x)` on the chart `|x| < 1` around the node, one branch elsewhere),
  `D^{(2)}` is the node, and the resolution of the cokernel of `Ω^•(log D)(−D) → Ω^•` is
  `ι_{1*}(Ω^•_{D^{(1)}} ⊗ ε_1) → ι_{2*}(Ω^•_{D^{(2)}} ⊗ ε_2)` with `ε_1` trivial on the
  normalisation and `ε_2` the orientation line of the two branches at the node; no globally smooth
  component is removed first, and the nodal example remains in scope.
- Control (disappearing branch): for `D = V(xy)` in the bidisc, the chart `|x|, |y| ≤ 1` has
  branches `V(x)`, `V(y)` and the sub-chart `|x| = 1` has the single branch `V(y)`; the chart-local
  branch data restricts to the surviving branch and `D^{(2)}` is empty over the sub-chart, so the matching is local and not
  a bijection of the two branch lists.
- Control (two-branch transitions, both degrees): on a chart where exactly two branches `B_1, B_2`
  meet in `B_{12}`, the complex is `O_{B_1} ⊕ O_{B_2} → O_{B_{12}} ⊗ ε_2` and
  `Ω^1_{B_1} ⊕ Ω^1_{B_2} → Ω^1_{B_{12}} ⊗ ε_2` with `δ(a, b) = (b| − a|) ⊗ e_{12}`, `e_{12}` the
  orientation of the ordered pair; the relabelling acts by `τ(a, b) = (b, a)` on the sources and by
  `e_{12} ↦ e_{21} = −e_{12}` on `ε_2`, and `δ ∘ τ = −δ = (−1) ⊗ δ`, so both squares commute, and
  the exterior derivative `d` commutes with them because `d` is `K`-linear and the transitions are
  restrictions and signs. Composition of two relabellings multiplies the signs, and a refinement
  to a sub-chart on which a branch disappears restricts the chart-local branch data, hence `E_s`, to
  the surviving subsets; these are
  the compatibilities the descent needs.

**Local cohomology of the de Rham complex along closed subspaces: algebraic versus topological
supports, Gysin isomorphism and independence of the embedding.** (*dagger-local-cohomology-comparison*)
Let `K` be of characteristic 0 (complete, nonarchimedean), `X` a smooth `K`-dagger space and `Y → X` a
closed immersion with coherent ideal `J`. Let `RΓ*_Y(E) = colim_n RHom_{O_X}(O_X/J^n, E)`, the
derived functor of
`E ↦ colim_n Hom_{O_X}(O_X/J^n, E)` (algebraic local cohomology, *dagger-algebraic-local-cohomology*)
and `DR` the derived de Rham functor on
`D_X`-modules (*dagger-d-modules*; GK02 §1, 1.5). Prove that (a) the
canonical map `RΓ(X, DR(RΓ*_Y O_X)) → RΓ(X, DR(RΓ_Y O_X)) = RΓ_Y(X, Ω^•_X)` is an isomorphism (GK02 §1,
Prop. 1.16 (a), p. 11; the rigid and dagger cases are proved differently, proof p. 12). For an
arbitrary closed `Y`, (a) is stated under the hypothesis (RES) of F1.11: GK02's proof of
Prop. 1.16, part (B), replaces an arbitrary divisor by a normal crossings divisor through the
resolution of GK02 Lem. 0.1 (*dagger-resolution-lemma*). For smooth `Y`, as in (b) below, no
resolution is used, and (a) and (b) need no hypothesis.
The construction consists of the operator sheaf,
its action on `O_X`, and the algebraic support functor with its inclusion into the
identity. On affinoid opens its image consists of sections killed by a power of
`J`; applied to an injective operator-module resolution it gives the `K`-linear
comparison with supported de Rham cohomology. Its equation identifies the map
forgetting support with the map induced by the inclusion of algebraic torsion
into the injective resolution.
The comparison of derived complexes is specified as follows: the map from ideal-power torsion to sections
supported on `Y` is the unique natural transformation commuting with their
inclusions into the identity functor. After right derivation and derived Hom
from the actual operator module `O_X`, its component at `O_X` is invertible.
The equation for compatible maps of support functors specifies support
naturality; the derived functors give independence of injective resolutions
(GK02 1.5, 1.8, 1.16(a), pp. 5, 7, 11–12). In (b)
(Gysin) if `X` is smooth and pure-dimensional and `Y` is smooth of pure codimension `d` in `X`,
`H^i_Y(X, Ω^•_X) ≅ H^{i−2d}_dR(Y)` for all
`i`, from (f) of *dagger-algebraic-local-cohomology* and the compatibility of `DR` with direct
images (*dagger-d-module-direct-image*; GK02 §1, Prop. 1.10, p. 7), the local computation being
made on the chart-local tubular neighbourhoods `Y_j × D^d(ρ)` of *dagger-tubular-neighbourhood*
(a)–(b), the same geometric input as the compact-support comparison. Independence of the embedding and the invariants `h^dR_q` are the
object of *dagger-hdr-embedding-independence*, because they rest on the trace of
*dagger-proper-projection-trace*, which itself uses (b). For `Z` a `K`-rational point of the closed
dagger polydisc `D^n`, `H^{2n}_Z(D^n, Ω^•) ≅ H^0_dR(point) = K` and the other `H^i_Z` vanish (Gysin
with `d = n`). *Needs:* *de-rham-cohomology-with-supports*; *dagger-polyannulus-de-rham-cohomology*;
*dagger-rigid-de-rham-comparison*; *dagger-resolution-lemma* (for arbitrary `Y`, under (RES));
*dagger-smooth-space*; *dagger-algebraic-local-cohomology*; *dagger-d-modules*;
*dagger-d-module-direct-image*;
*dagger-coherent-module*; *quasi-stein-theorems-a-b*.

**Checks.**

- Computation: a rational point of `D^n` has `H^{2n}_Z = K` and no other supported cohomology.
- Computation (the delta module at the origin): with the unshifted convention
  `DR(M) = RHom_{D}(O, M)`, for `M = W_1[x^{-1}]/W_1` the complex `DR(M)` is `M → M dx` in degrees
  `0` and `1`, `[x^{-k}] ↦ −k[x^{-k−1}]dx`, with kernel `0` and cokernel `K·[dx/x]` in degree `1`.
  Since `RΓ*_0 O = M[−1]` (`R^1Γ*_0 O = M`), `DR(RΓ*_0 O) ≃ DR(M)[−1]` has its only cohomology
  `K·[dx/x]` in degree `2`, matching `H^2_0(D, Ω^•) = K` by (a).
- Computation (codimension one): for `Y = {x_1 = 0}` in `Y × D`, the isomorphism
  `H^{i−2}_dR(Y) → H^i_Y` of (b) sends `η` to the class of `η ∧ dx_1/x_1`, with `η` lifted to `Y × D`.

**Relative coherent fringe comparison and overconvergent trace for proper product projections.**
(*dagger-projection-fringe-comparison*) Let `K = Frac(R)` for a complete discrete valuation ring
`R` of mixed characteristic `(0, p)`, `X` a smooth proper `K`-dagger space of pure dimension `n`,
`Y = Sp(A)` a smooth pure-dimensional dagger affinoid, and `p : Z = X × Y → Y` the projection.
This roadmap owns the following subtarget of *dagger-proper-projection-trace*, for
`F^j = Ω^j_{Z/Y}`, `0 ≤ j ≤ n`, with `F^n = ω_{Z/Y}` (GK00 §3, Thm 3.5 and proof, pp. 18–19;
GK02 §1, proof of Prop. 1.11, p. 9).

Choose a fringe presentation `A = colim_{ρ→1+} A_ρ`, `Y_ρ = Sp(A_ρ)`, `Y' = Sp(Â) ⊂† Y_ρ`.
After shrinking the initial radius, take the `Y_ρ` smooth; prove the existence of such a
cofinal system by extending smooth affinoid charts to a fringe stage. Set
`p_ρ : Z_ρ = X' × Y_ρ → Y_ρ` and `F^j_ρ = Ω^j_{Z_ρ/Y_ρ}`. These proper rigid product maps and
their sheaves extend `p'` and `(F^j)'` to a larger rigid base, giving the local extension
hypothesis of GK00 Thm 3.5. Prove, for every `q ≥ 0`, the canonical `A`-linear comparisons
`M^{q,j} := Γ(Y, R^q p_* F^j) ≅ H^q(Z, F^j) ≅ colim_{ρ→1+} H^q(Z_ρ, F^j_ρ)`.
For a fixed sufficiently small initial radius `ρ_0`, put
`M^{q,j}_{ρ_0} = H^q(Z_{ρ_0}, F^j_{ρ_0})`. The rigid proper-cohomology supplier makes this module
finite over `A_{ρ_0}` and identifies each smaller stage with
`A_ρ ⊗_{A_{ρ_0}} M^{q,j}_{ρ_0}`. Prove
`M^{q,j} ≅ A ⊗_{A_{ρ_0}} M^{q,j}_{ρ_0}`, its finiteness over `A`, coherence of `R^q p_* F^j`, and
the completion comparison
`M^{q,j} ⊗_A Â ≅ H^q(X' × Y', (F^j)')`, hence
`(R^q p_* F^j)' ≅ R^q p'_* (F^j)'` as coherent sheaves. In particular `R^q p_* F^j = 0` for
`q > n`. Establish compatibility with shrinking radii, changing fringe presentations, restriction
to dagger affinoid subdomains of `Y`, and the relative exterior derivatives
`F^j → F^{j+1}` as maps linear over the inverse image of `O†_Y`.

For `q = j = n`, construct the rigid stage traces
`t_ρ : H^n(Z_ρ, ω_{Z_ρ/Y_ρ}) → A_ρ` by the residue and Gysin construction of GK02 Prop. 1.11.
Prove they commute with shrinking the stage and with base restriction, annihilate the image of
`H^n(Z_ρ, Ω^{n−1}_{Z_ρ/Y_ρ})`, and commute with differentiation in base coordinates.
For `n = 0` the preceding relative differential has zero source. Their direct limit defines
the `A`-valued map `t : M^{n,n} → A`; prove that its scalar extension to `Â` is the rigid trace
and that it kills the preceding dagger relative differential. The restriction compatibility
glues these maps over every smooth pure-dimensional dagger base to
`R^n p_! ω_{Z/Y} = R^n p_* ω_{Z/Y} → O†_Y`, compatible with the base differential operators.
This is the dagger trace used by *dagger-proper-projection-trace*, including its supported maps,
*dagger-hdr-embedding-independence*, and *dagger-proper-modification-sequence*.
*Needs:* *fringe-presentation*; *fringe-morphism-factorisation*; *fringe-module-descent*;
*overconvergent-sections-formula*; *dagger-coherent-affinoid-kiehl*; *dagger-coherent-theorem-b*;
*dagger-coherent-module*; *dagger-differentials*; *dagger-smooth-space*; *dagger-partially-proper*;
*dagger-d-modules*; *dagger-d-module-direct-image*; *dagger-local-cohomology-comparison* (b);
*kiehl-proper-mapping-theorem*, *proper-affinoid-cohomology-finite*,
*proper-cohomology-affinoid-subdomain* (AdicSpacesPartIII R3.6, supplied by RigidAnalyticGeometry).

**Checks.**

- Degenerate: for `X = Sp(K)`, the comparisons in degree zero are `A = colim_ρ A_ρ` and
  `A ⊗_A Â = Â`, and every stage trace and the dagger trace are identities.
- Computation: for `X = (ℙ¹_K)^†`, `K = ℚ_p`, `A = ℚ_p⟨T⟩†`, the relative residue sends
  `b(T)[dz/z]` to `b(T)` in `A` for every `b(T) ∈ A`, with the ordered two-chart cover of
  *dagger-proper-projection-trace*. Completing gives the rigid trace over `Â = ℚ_p⟨T⟩`.
- Compatibility: restricting the same class to any dagger affinoid subdomain of the base
  restricts its residue `b(T)`; changing or shrinking a fringe model gives the same `A`-valued map.
- Boundary: for `X = (ℙ¹_K)^†` and `Y` the closed dagger disc, `p` is proper while `X × Y`
  is not partially proper over `K`: the closed section `{0} × Y` would otherwise make the
  closed disc partially proper. The relative comparison applies to this base.
- Negative control: for `A = ℚ_p⟨T⟩†`, the series `h(T) = Σ_{m≥1} p^m T^{p^m}` lies in `Â` but
  outside `A`, since `p^{-m}ρ^{p^m}` fails to tend to zero at every `ρ > 1`.
  Multiplication by `h` on `Â` cannot be the completion of an `A`-linear endomorphism of `A`:
  its value at `1` is outside `A`. Trace overconvergence is supplied by the stage traces.

**Trace maps for the projection `X × Y → Y` with `X` smooth and proper.**
(*dagger-proper-projection-trace*) Let `X` be a smooth proper `K`-dagger (resp. rigid) space of pure
dimension `n`, `Y` a smooth pure-dimensional `K`-dagger (resp. rigid) space and `p : Z = X × Y → Y`
the projection. For rigid spaces assume `char K = 0`; for dagger spaces assume moreover `K = Frac(R)`
for a complete discrete valuation ring `R` of mixed characteristic `(0, p)` (GK00 §3, Thm 3.5,
pp. 18–19; the local extension hypothesis is supplied by the product fringe models of
*dagger-projection-fringe-comparison*). Prove that there is a canonical trace map `p_+O_Z[n] → O_Y` of `D_Y`-modules (`D_Y` is the sheaf of differential operators of *dagger-d-modules*, GK02 §1, 1.5, and `p_+` is the direct image of D-modules along the projection of *dagger-d-module-direct-image*, GK02 §1, 1.6), given by a map `R^n p_! ω_{Z/Y} → O_Y` vanishing on the image of `R^n p_! Ω^{n−1}_{Z/Y}` and built on charts `U_J → (D^0)^{n_J}` from the coefficient of `T_1^{-1} ⋯ T_{n_J}^{-1} dT_1 ∧ … ∧ dT_{n_J}` and the Gysin map, and that if moreover `T → Y` and `S → Z ×_Y T = X × T` are closed
immersions, there are canonical trace maps `p_+RΓ*_S O_Z[n] → RΓ*_T O_Y` and
`RΓ(Z, DR(RΓ*_S O_Z))[2n] → RΓ(Y, DR(RΓ*_T O_Y))`, which are isomorphisms if the composite
`S → X × T → T` is an isomorphism (GK02 §1, Prop. 1.11, p. 8, and its proof, p. 9). For `X = Sp(K)`
(`n = 0`), `p = id` and the trace is the identity; for `X = P^1` over `Y = Sp(K)`, the trace
`H^2_dR(P^{1,†}) → K` is the residue isomorphism.
On dagger affinoid bases the trace is the `A`-valued direct limit of the rigid stage traces of
*dagger-projection-fringe-comparison*; its restriction and completed-trace compatibilities glue
the map on `Y` and carry through to the supported trace maps below.
The traces form a single family over
complementary opens `U ⊆ Z`, `V ⊆ Y` with `p⁻¹(V) ⊆ U`. For inclusions
`U₁ ⊆ U₂`, `V₁ ⊆ V₂`, the trace commutes with extension from the smaller
closed supports to the larger ones. Both extension maps are precomposition
with the cokernel maps induced by the inclusions of free constant sheaves for `U₁ ⊆ U₂` and
`V₁ ⊆ V₂`. The family is chosen before the closed immersions and `S → T`;
for every such diagram, its corresponding member is bijective when `S → T`
is an isomorphism (GK02 Prop. 1.11 and proof, pp. 8–10).
*Needs:* *dagger-local-cohomology-comparison*; *dagger-d-module-direct-image*;
*dagger-algebraic-local-cohomology*;
*de-rham-cohomology-with-supports*; *dagger-partially-proper*; *dagger-smooth-space*;
*dagger-projection-fringe-comparison* (for dagger spaces).

**Checks.**

- Degenerate: `X = Sp K` gives the identity.
- Computation (normalisation): for `X = ℙ¹`, `Y = Sp K`, the trace `H^2_dR(ℙ¹) → K` sends the Čech
  class of `dz/z` on `{|z| = 1}`, for the cover `({|z| ≤ 1}, {|z| ≥ 1})` in this order, to
  `1 = Res_0(dz/z)`, the coefficient of `z^{-1}dz`.
- Compatibility: through the Gysin map, the point `S = {0} × Sp K` gives the identity of `K`.
- Computation over an affinoid base: for `X = (ℙ¹_{ℚ_p})^†` and `Y = Sp(ℚ_p⟨T⟩†)`, the relative
  trace sends `b(T)[dz/z]` to `b(T) ∈ ℚ_p⟨T⟩†` and completes to the rigid trace, as in
  *dagger-projection-fringe-comparison*.

**Independence of the embedding for de Rham cohomology with supports, and the invariants `h^dR_q`.**
(*dagger-hdr-embedding-independence*) Let `K = Frac(R)` for a complete discrete valuation ring `R` of
mixed characteristic `(0, p)` (the trace of *dagger-proper-projection-trace* is used for dagger
spaces). Prove that for closed immersions `g_i : Z → Y_i` (`i = 1, 2`) into smooth affinoid
`K`-dagger spaces of pure dimensions `n_i`,
`RΓ(Y_1, DR(RΓ*_Z O_{Y_1}))[2n_1] ≅ RΓ(Y_2, DR(RΓ*_Z O_{Y_2}))[2n_2]`; consequently, for an affinoid
`K`-dagger space `Z` and a closed immersion `Z → Y` into a smooth affinoid dagger space of pure
dimension `n`, the invariant `h^dR_q(Z) := dim_K H^{2n−q}(Y, DR(RΓ*_Z O_Y))`, defined by algebraic
supports, depends only on `Z`; its embedding independence uses the algebraic trace theorem and no
resolution hypothesis (GK02 §1, Cor. 1.12, p. 10, with the trace isomorphism as the key input of
its proof; the definition of `h^dR_q` GK02 §1, 1.13, p. 10). Separately, under (RES) of F1.11,
*dagger-local-cohomology-comparison* (a) identifies it with `dim_K H^{2n−q}_Z(Y, Ω^•_Y)`, the
dimension of de Rham cohomology with topological supports, for arbitrary closed `Z`; for smooth
`Z` that identification is unconditional. The two statements are kept apart: the definition and
its invariance never assume (RES), and the topological reading inherits (RES) wherever it is used.
A finite extension `K'/K` acts on the invariant through base change of the algebraic supports
(`RΓ*_{Z_{K'}} O_{Y_{K'}} = RΓ*_Z O_Y ⊗_K K'`, as `O_X/J^n ⊗_K K'` is the quotient by the
extended ideal power), not through the topological comparison, so no (RES) is needed there
either. For
`Z` a `K`-rational point, `h^dR_0(Z) = 1` and `h^dR_q(Z) = 0` for `q ≠ 0`, whether `Z` is embedded in
`D^1` or in `D^2`; `Z = ∅` gives `h^dR_q = 0`; the disc in itself has `h^dR_2 = 1`. *Needs:*
*dagger-local-cohomology-comparison*; *dagger-proper-projection-trace*;
*dagger-algebraic-local-cohomology*;
*de-rham-cohomology-with-supports*; *dagger-analytification*.

**Compactly supported coherent and de Rham cohomology of affinoid and Stein dagger spaces.**
(*compact-support-de-rham*) Let `K` be a field complete for a nontrivial nonarchimedean absolute value
of rank one (`NontriviallyNormedField K`, `IsUltrametricDist K`, `CompleteSpace K`). Let `X = Sp(A)` be
an affinoid `K`-dagger space with a fringe presentation `A = W_m/IW_m`, `I ⊆ T_m(ρ_0)`, fringe stages
`X_ρ = Sp(T_m(ρ)/IT_m(ρ))`, so `X' ⊂† X_ρ`. For a coherent `O†_X`-module `F` choose (after shrinking
`ρ_0`) a coherent `O_{X_{ρ_0}}`-module `F_{ρ_0}` with `F(X) = colim_ρ F_{ρ_0}(X_ρ)`
(see *fringe-module-descent*) and put `H^i_c(X, F) := H^i_{X}(X_{ρ_0}, F_{ρ_0})`, the cohomology of
`F_{ρ_0}` with supports in the complement of the admissible open `X_{ρ_0} − X'`
(see *de-rham-cohomology-with-supports*). For `X` smooth, `H^i_{dR,c}(X) := H^i_{X}(X_ρ, Ω^•_{X_ρ})`. Both
are independent of `ρ` and of the fringe presentation. For a smooth Stein dagger space `X` with Stein
covering `(U_j)_{j∈ℕ}`, `H^i_c(X, F) := colim_j H^i_{U_j}(U_{j+1}, F)` and
`H^i_{dR,c}(X) := colim_j H^i_{U_j}(U_{j+1}, Ω^•)`, along the extension-by-zero maps. `H^i_c(X, F)`
carries the finest locally convex topology making the boundary maps
`H^{i−1}(X_{ρ_0} − X', F_{ρ_0}) → H^i_c(X, F)` continuous, and a topological `A`-module structure.
Define
`H^i_c(X, F) := H^i_X(X_ρ, F_ρ)` for affinoid `X` with a
fringe presentation and coherent `F`, and `H^i_{dR,c}(X)` for smooth
affinoid `X`, with the colimit version for smooth Stein `X`; prove that
`H^i_c(X, F)` does not depend on `ρ`, on the fringe presentation or on the extension `F_ρ`, by
canonical isomorphisms compatible with composition, the long exact sequence
`… → H^i_{dR,c}(X) → H^i_dR(X_ρ) → H^i_dR(X_ρ − X') → H^{i+1}_{dR,c}(X) → …` (the support triangle on
a fringe stage), extension by zero (for an affinoid subdomain `U ⊆ X` with `U ⊂† X`, a
map `H^i_c(U, F|_U) → H^i_c(X, F)` compatible with composition), vanishing (if `X` is
smooth affinoid of pure dimension `n` and `F` locally free, `H^q_c(X, F) = 0` for `q ≠ n`; hence
`H^{q+n}_{dR,c}(X) = H^q(H^n_c(X, Ω^•_X))`), that `H^i_c(X, F)` is a topological
`A`-module with `A`-linear maps of coherent modules inducing continuous maps, and
the polydisc formula (for `A = K⟨T_1..T_m⟩†`,
`H^m_c(X, ω_X) = {Σ_{μ<0} a_μ T^μ dT : η^{-|μ|}|a_μ| → 0 for every η > 1}`, the series in negative
exponents `μ_i < 0` satisfying the displayed coefficient decay) (GK00 §4, 4.3,
pp. 19–20, for the definition through a fringe presentation and the topology; GK00 §4, 4.8, p. 21, for
`H_{dR,c}`; the Stein version as a colimit GK00 §4, proof of Thm 4.11, p. 22). *Needs:*
*de-rham-cohomology-with-supports*; *fringe-presentation*; *fringe-module-descent*;
*fringe-morphism-factorisation*; *strict-neighbourhood*; *dagger-de-rham-complex*;
*dagger-coherent-module*; *dagger-partially-proper*.

**Checks.**

- Computation: for `char K = 0` and the closed dagger disc `D`:
  `H^0_{dR,c}(D) = H^1_{dR,c}(D) = 0` and `H^2_{dR,c}(D) = K`. Compute using the negative
  Laurent series description: differentiation sends `x^{-m}` to `−m x^{-m−1} dx` for `m ≥ 1`,
  has zero kernel, and misses exactly the residue class `dx/x`. Dividing by `m` preserves
  the condition of convergence for every radius `> 1`. The individual closed rigid fringe
  disc does not satisfy the dagger Poincaré lemma: over `ℚ_p`, at unit radius the form
  `Σ_{r≥1} p^r X^{p^r−1} dX` converges, but its primitive `Σ_{r≥1} X^{p^r}` does not.
- Degenerate: for `X = Sp(K)`: `H^0_{dR,c}(X) = K` and all other groups
  vanish (the fringe stages of `K = W_0` are `Sp(K)` itself, `X_ρ − X' = ∅`, and
  `H^i_X(X_ρ) = H^i_dR(X_ρ)`); for `X = Sp(0) = ∅` or `F = 0` every group is `0`, and the dualities
  of *dagger-serre-duality* and *dagger-poincare-duality* read `0 ≅ Hom(0, K)`.
- Computation: for `char K = 0` and the dagger annulus
  `X = Sp(K⟨x, x^{-1}⟩†)` over a complete discretely valued field of mixed characteristic,
  `H^*_{dR,c}(X) = (0, K, K)`: apply *dagger-poincare-duality* to
  `H^*_dR(X) = (K, K·dx/x)`. This calculation uses the dagger cohomology of `X`.
- Non-example: `H^i_{dR,c}` is not `H^i_dR`: for `char K = 0` and
  the closed dagger disc, `H^0_{dR,c}(D) = 0 ≠ K = H^0_dR(D)`; nor is it the cohomology of `D` with
  supports in `D` inside `D` itself (that is `H_dR(D)`).
- Compatibility: for `X = Sp(W_n)` with fringe stages `V_ρ =
  `Sp(T_n(ρ))`, `H^i_c(X, F)` is the cohomology of the mapping fibre
  `Cone(RΓ(V_ρ,F_ρ) → RΓ(V_ρ − X',F_ρ))[−1]`. For locally free `F` it is concentrated in
  degree `n`; the restriction to the complement requires derived sections.
- Characterisation: for `K` spherically complete (Grosse-Klönne's
standing hypothesis from GK00 §4, 4.2 on) and `A = K⟨T⟩†`, the residue pairing `A × H^1_c(X, ω) →
K`,
  `(Σ b_α T^α, Σ a_μ T^μ dT) ↦ Σ_{α≥0} b_α a_{−α−1}`, is perfect for the topologies of GK00 §4,
4.2–4.3 (GK00 §4, Thm 4.4).
- Non-example (pure dimension): for the mixed-dimensional `X = Sp K ⨿ Sp W_1`,
  `H^0_c(X, O) = K` (the point) and `H^1_c(X, O) ≠ 0` (the disc), so coherent compact support
  is not concentrated in one degree without pure dimension.

The surjective connecting map
from degree `q` cohomology on the fringe complement to degree `q+1` coherent
compact support, for `q ≥ 0`, is specified as coming from the short exact sequence of free
sheaves on the complement and the whole fringe and their cokernel (GK00 4.3,
pp. 19–20). **Check:** it fixes the
Mathlib cone convention: the third triangle map sends two suspended entries
`a,b` to `−a−b`.

**Serre duality for smooth affinoid dagger spaces.** (*dagger-serre-duality*) Let `K` be spherically
complete (complete, nonarchimedean; e.g. discretely valued). Let `X` be a smooth affinoid `K`-dagger
space of pure dimension `d` and `F` a coherent `O†_X`-module; give `Ext^i_{O_X}(F, ω_X)` the fringe
topology and `H^{d−i}_c(X, F)` the topology of *compact-support-de-rham*. Then for `0 ≤ i ≤ d` there is
a pairing `Ext^i_{O_X}(F, ω_X) × H^{d−i}_c(X, F) → K`, functorial in `F`, inducing topological
isomorphisms `Ext^i_{O_X}(F, ω_X) ≅ Hom_{K,cont}(H^{d−i}_c(X, F), K)` and
`H^{d−i}_c(X, F) ≅ Hom_{K,cont}(Ext^i_{O_X}(F, ω_X), K)` (GK00 §4, Thm 4.4, p. 20, with the polydisc
case first and the reduction to the polydisc in its proof; the standing hypothesis GK00 §4, 4.2,
p. 19).
The statement supplies a coefficient-functorial pairing
on the actual supported derived Hom groups, and topologies making its two
transposes strong continuous duality isomorphisms. The Ext group has its
finite-module fringe topology. Coefficient maps on compact support are
postcomposition with the derived associated-sheaf map, whose local equation
is `a ⊗ m ↦ a ⊗ f(m)`; the contravariant Ext map is precomposition with scalar
extension. These maps are continuous and the pairing commutes with them.
For the polydisc, the model of compactly supported cohomology is the negative Laurent coefficient
module
with subexponential growth at every radius `η > 1`. Its topology is generated by the seminorms
`sup_ν |a_ν|η^{−|ν|}`, which give a basis of zero
neighbourhoods. Both strong
topological dualities hold for this model, with the pairing
`Σ_ν b_ν a_ν` and positive coefficient-extraction sign (GK00 4.4, p. 20).

**Checks.** The model recovers `K` in dimension zero;
it contains every finitely supported coefficient
family; it excludes the coefficients `π^{−m}` for
`0 < |π| < 1`. In dimension zero its topology is the field topology;
the single pole of increasing
order tends to zero; a
constant sequence with residue one does not tend to zero.
The pairing with `b+cT` is
`b a₀+c a₁`.
 For `X = D` the closed dagger disc and `F = O`, `Ext^0(O, ω) = K⟨T⟩† dT` is dual to
`H^1_c(D, O)` and conversely; the pairing extracts the coefficient of
`T⁻¹ dT` with positive sign. *Needs:*
*compact-support-de-rham*; *fringe-topology*; *dagger-smooth-space*;
*dagger-coherent-affinoid-kiehl*; *dagger-coherent-module*.

**Poincaré duality for de Rham cohomology of smooth affinoid and smooth Stein dagger spaces.**
(*dagger-poincare-duality*) Let `K` be discretely valued of characteristic 0, and (for the strictness
and finiteness inputs) the fraction field of a complete discrete valuation ring of mixed
characteristic `(0, p)` — hence spherically complete; mixed characteristic is what the finiteness
theorem behind GK00 §4, Lem. 4.7 provides. (a) If `X` is a smooth affinoid `K`-dagger space of pure
dimension
`n` whose de Rham cohomology is finite-dimensional — a hypothesis of this statement, which Theorem A
(*dagger-de-rham-finiteness-and-base-change*) supplies under (MWF) and (RES) of F1.11 — there are
canonical isomorphisms `H^i_dR(X) ≅ Hom_{K,cont}(H^{2n−i}_{dR,c}(X), K)` and
`H^{2n−i}_{dR,c}(X) ≅ Hom_{K,cont}(H^i_dR(X), K)` for `0 ≤ i ≤ 2n`. (b) The same holds for a smooth
Stein `K`-dagger space `X` of pure dimension `n` whose de Rham cohomology is finite-dimensional
(needed for the strictness of its de Rham differentials, *dagger-strict-differentials*: finite
codimension of the image of `d` in the closed subspace `ker d` makes that image closed, and the open
mapping theorem then gives strictness; the reduction to the affine space alone does not). Since these
groups are finite-dimensional (by hypothesis; see *dagger-de-rham-finiteness-and-base-change*) and separated
(see *dagger-strict-differentials*), (a) is a perfect duality of finite-dimensional `K`-vector spaces
(GK00 §4, Thm 4.9, p. 22, for (a), with the structure of its proof; Thm 4.11, p. 22, for (b);
Lem. 4.6, p. 21; the standing hypothesis 4.8, p. 21; the algebraic form 4.10, p. 22). For `X = D` the
closed dagger disc, `H^0_dR = K` is dual to `H^2_{dR,c} = K`, and `H^1_dR = 0 = H^1_{dR,c}`; for the
dagger annulus `|x| = 1`, `H^1_dR = K·dx/x` is dual to `H^1_{dR,c} = K` — both of known finite
cohomology, so these checks need neither (MWF) nor (RES); two cofinal Stein exhaustions give the
same colimit. *Needs:*
*dagger-serre-duality*; *compact-support-de-rham*; *dagger-strict-differentials*;
*dagger-de-rham-finiteness-and-base-change*; *dagger-de-rham-complex*; *dagger-partially-proper*.

In the affinoid case the statement gives both strong
continuous duals, with the finite-dimensional module
topology on each cohomology group; that finite topology on
affinoid de Rham cohomology is the quotient of the subspace topology on closed
forms inside the fringe module of exterior differentials (GK00 4.7, 4.9–4.10,
pp. 21–22). The Stein statement uses an
admissible affinoid exhaustion with relatively compact inclusions and assumes
finite-dimensional de Rham cohomology in every degree. Its compact-support
carrier is the colimit of supported cohomology in the rigid completion;
the maps come from the quotients of the free constant sheaves on complements.
The equation on their quotient projections fixes every transition map.
Excision gives the groups supported in the next affinoid of the exhaustion
(GK00 4.9–4.11, p. 22).
This finite-dimensional
topology is the final topology of the colimit injections from the supported
groups. Two
increasing admissible affinoid exhaustions are cofinal. For their complementary opens,
the continuous linear
equivalence of the two colimits is constructed from the cokernel maps of the free sheaves
on complements. Its equation on every colimit injection makes it independent
of the selected cofinal reindexing (GK00 4.11, p. 22).

### F1.11 finiteness

Where a statement below refers to `R` it is a complete discrete valuation ring of mixed
characteristic `(0, p)` with uniformiser `π`, with `K = Frac(R)` and `k = R/πR`; the other
statements need only `char K = 0`. Two inputs of the finiteness proofs are not targets of this
roadmap; they appear as hypotheses of exactly the statements that use them, and no statement here
asserts them.

- **(MWF)**, finiteness of Monsky–Washnitzer cohomology: for `K` and every finite extension `K_1` of
  `K`, with valuation ring `R_1`, every smooth finitely generated `R_1`-algebra `S` and every `q`,
  `H^q(Ω^•_{A†/K_1})` is finite-dimensional over `K_1`, where `A† = S† ⊗_{R_1} K_1`
  (*weak-completion-generic-fibre*, *dagger-differentials*). Finite extensions are included
  because de Jong's alterations require them. Its known proofs (Berthelot97; Mebkhout97;
  Kedlaya06 Thm. 1.2.1, for any residue field, through rigid cohomology) rest on crystalline
  comparison, `p`-adic differential modules or Frobenius structures, which this roadmap does not
  build, and none uses this subsection.
- **(RES)**, embedded resolution of rigid spaces: for every field `L` of characteristic `0` complete
  for a nontrivial rank-one absolute value, every smooth affinoid rigid space `V` over `L` and every
  nowhere dense closed analytic subspace `W ⊆ V`, there is a proper surjective morphism of rigid
  spaces `h : Ṽ → V` with `Ṽ` smooth, `h^{-1}(W)` with its reduced structure a normal crossings
  divisor, and `h` an isomorphism over `V − W` (BM97 Thm. 1.10, as applied in GK02 §0, proof of
  Lem. 0.1).

The finiteness chain is: (MWF) → *dagger-semistable-tube-finiteness* →
*quasi-algebraic-affinoid-finiteness* (which also uses (RES)) → Theorem A
(*dagger-de-rham-finiteness-and-base-change*, through *dagger-resolution-lemma* and
*smooth-affinoid-quasi-algebraic*) → *dagger-de-rham-kunneth*, and the finiteness hypotheses of
*dagger-strict-differentials* and *dagger-poincare-duality* for affinoids. (RES) enters before
Theorem A: through *dagger-resolution-lemma* it is used by the comparison of algebraic and
topological supports for an arbitrary closed subspace (*dagger-local-cohomology-comparison* (a);
GK02 Prop. 1.16, part (B), replaces an arbitrary divisor by a normal crossings one via Lem. 0.1),
hence by *dagger-proper-modification-sequence* (GK02 Cor. 1.17 uses Prop. 1.16(b)) and by
*quasi-algebraic-affinoid-finiteness* (the proof of GK02 Thm. 3.4 uses both); the smooth-support
calculation, the Gysin isomorphism of *dagger-local-cohomology-comparison* (b), needs neither
hypothesis. The finite étale trace, Theorem C, finite field extensions and the algebraisation of
smooth affinoids use neither hypothesis. A proof of (MWF) that discharges the hypothesis must not
use this subsection.

**Resolution of a closed subspace of a smooth affinoid dagger space to a normal crossings divisor.**
(*dagger-resolution-lemma*) Assume (RES). Prove that for `K` of characteristic 0 (complete, nonarchimedean) and
`Z → X` a nowhere dense closed immersion into a smooth affinoid `K`-dagger space, there is a proper surjective
morphism `g : X̃ → X` of dagger spaces with `X̃` smooth, `g^{-1}(Z)` a divisor with normal crossings
on `X̃` after taking its reduced support, and `g^{-1}(X − Z) → X − Z` an isomorphism (GK02 §0, Lem. 0.1, p. 4, with the rigid
resolution input of Bierstone–Milman, (RES), in its proof). Proof route: descend `X` and `Z` to a
smooth fringe stage `Z_ρ ⊆ X_ρ = Sp(T_n(ρ)/I_ρ)` (*fringe-presentation*), apply (RES) to
`Z_ρ ⊆ X_ρ`, restrict over the partially proper interior `⋃_{ρ′<ρ} Sp(T_n(ρ′)/I_ρ)`, where the
restricted morphism is partially proper and so a morphism of dagger spaces
(*partially-proper-dagger-rigid-equivalence*), and restrict over `X`. For `Z` a `K`-rational point of the closed dagger
disc `X = D`, `g = id` (a point is already a smooth divisor). The hypothesis excludes
`Z = X ≠ ∅`, whose inverse image is the whole source, not an effective Cartier divisor.
For the thickened origin `(X²)`, the reduced inverse image is the origin; multiplicity two
must not be confused with a reduced normal crossings boundary. *Needs:* (RES); *fringe-presentation*;
*partially-proper-dagger-rigid-equivalence*; *dagger-partially-proper*; *dagger-smooth-space*.

**Smooth affinoid dagger spaces are quasi-algebraic.** (*smooth-affinoid-quasi-algebraic*) Prove
that every smooth affinoid dagger space over `K = Frac(R)` is isomorphic to
`Sp(K⟨X_1, …, X_n⟩†/(f_1, …, f_r))` with all `f_j ∈ R[X_1, …, X_n]`: by
*elkik-lifting-algebraisation* (b) for `(R, πR)` the completion is defined by polynomials, and
dagger algebras with isomorphic completions are isomorphic (*dagger-approximation*) (GK02 proofs of
Cor. 3.5 and Thm. 3.6, citing Elkik Thm. 7 and GK00 Lem. 1.15). No finiteness hypothesis is used.
*Needs:* *elkik-lifting-algebraisation*; *dagger-approximation*; *dagger-completion-comparison*;
*dagger-smooth-space*.

**Checks.**

- Degenerate: `Sp W_n` needs no equation.
- Computation: the graph `K⟨X, Y⟩†/(Y − h)` of a non-polynomial `h ∈ W_1` with `|h|_sup ≤ 1` is
  isomorphic to `Sp W_1`, which is defined by no equation.

**Trace on de Rham complexes for finite étale morphisms of smooth dagger spaces.**
(*dagger-finite-etale-trace*) Prove that for `K` of characteristic 0 (complete, nonarchimedean) and
`f : X → Y` a finite étale surjective morphism of smooth `K`-dagger spaces with `Y` irreducible and every connected
component of `X` surjecting onto `Y`, there are an integer `l = deg f ≥ 1` and a morphism of complexes
`t : f_*Ω^•_X → Ω^•_Y` with `t ∘ f^* = l·id`; in particular `f^* : H^i_dR(Y) → H^i_dR(X)` is
injective for all `i`.
The traces form one family of global trace morphisms
of pushed-forward sheaf complexes. Its affinoid section identifications commute
with differentials and restrictions, and trace sends
`b·da₁∧⋯∧da_q` to `Tr(b)·da₁∧⋯∧da_q`. Its composition equation and the
pure-tensor scalar-extension equation for algebra traces specify transitivity
and the affine base-change normalization. The same family includes pullback
on sheaf complexes, fixed on every affinoid chart by pullback of its coefficient
and differentials. For every Cartesian square of smooth spaces, the global
trace commutes with that pullback. Constant local rank `r` gives
`trace ∘ pullback = r·id`, and positive rank makes pullback split injective
as a map of complexes. **Check:** the split two-sheeted trace is `(a,b) ↦ a+b`. Trace itself also exists for degree
zero finite étale maps; the positive-degree assumption is used for injectivity
(GK02 §1, 1.14, pp. 10–11; the finite locally free MW-type version, Kedlaya06 §3.2,
Prop. 3.2.6 (Monsky–Washnitzer 8.3), belongs to the rigid-cohomology roadmap). For the Kummer covering `z ↦ z^N` of the dagger annulus `|z| = 1` (any `N ≥ 1`; it is finite
étale because `N z^{N−1}` is a unit, `char K = 0`): `l = N`, and `f^*` is injective (in fact
bijective) on `H^1_dR = K·dz/z`, multiplication by `N` in the basis `dz/z` (`f^*(dw/w) = N dz/z` for
`w = z^N`); `N ≠ 0` in `K` is what makes `t ∘ f^* = N·id` give injectivity. Surjectivity excludes
`∅ → Sp(K)`: its degree is zero and its pullback on `H^0` is `K → 0`, not injective.
On affinoids `t(b·da_1 ∧ … ∧ da_q) = Tr(b) da_1 ∧ … ∧ da_q` uses AdicSpacesPartIII's
`LinearMap.projectiveTrace` for finite projective modules (Convention 11).
*Needs:* *dagger-de-rham-complex*; *dagger-differentials*; *dagger-smooth-space*;
*dagger-coherent-module*; Mathlib `Algebra.trace`, `Module.Free`.

**Long exact sequence of de Rham cohomology with supports for a proper modification.**
(*dagger-proper-modification-sequence*) Assume (RES): GK02's proof of Cor. 1.17 uses Prop. 1.16(b),
whose arbitrary-support case rests on the resolution of Lem. 0.1 (*dagger-resolution-lemma*). Let
`K` be of characteristic 0 (complete, nonarchimedean); for
dagger spaces assume moreover `K = Frac(R)` for a complete discrete valuation ring `R` of mixed
characteristic `(0, p)`, which the trace of *dagger-proper-projection-trace* needs. Let `f : X' → X`
be a proper morphism of dagger spaces and `Y → X` a closed immersion such that `f` restricts to an
isomorphism `X' − Y' → X − Y`, `Y' = X' ×_X Y`. Let `b : X → Z` be a closed immersion into a smooth
pure-dimensional
dagger space and `a : X' → W'` a locally closed immersion into a smooth proper dagger space of pure
dimension `n`. Prove that `(a, b ∘ f) : X' → Z' := W' × Z` is a closed immersion and that there is a
long exact sequence
`… → H^i_{Y'}(Z', Ω^•) → H^{i−2n}_Y(Z, Ω^•) ⊕ H^i_{X'}(Z', Ω^•) → H^{i−2n}_X(Z, Ω^•) → H^{i+1}_{Y'}(Z', Ω^•) → …`
(GK02 §1, Cor. 1.17, p. 13; the trace map of GK02 §1, Prop. 1.11, p. 8, used in the proof).
The two
support-extension components are specified by the cokernel maps of free sheaves on
complementary opens. For the two compatible traces `t_Y,t_X`, the consecutive
maps are `x ↦ (t_Y x, inclusion x)` and `(y,x) ↦ inclusion y − t_X x`.
**Check:** take
full-support degree-zero cohomology of the dagger point. Support
extension `e` from the actual cokernel map of free sheaves for the identity inclusion
satisfies `e(x)=x`. The maps `r(x)=(e(x),e(x))` and `s(a,b)=e(a)−e(b)` form
an exact sequence with `s` surjective. A nonzero supported class satisfies
`s(x,0)=x` and `s(0,x)=−x≠x`, detecting the sign in the identity-modification
case (GK02 Corollary 1.17 and its proof, p. 13). For `f`
the blow-up of a `K`-rational point `Y` of a smooth affinoid surface `X`, the sequence relates `H_dR`
of `X`, of the exceptional divisor `Y' ≅ P^1` and of `Y`. *Needs:* (RES);
*de-rham-cohomology-with-supports*;
*dagger-local-cohomology-comparison*; *dagger-partially-proper*; *dagger-smooth-space*;
*dagger-proper-projection-trace*.

**De Rham cohomology of tubes in a strictly semistable formal scheme (Grosse-Klönne's Theorem C).**
(*dagger-semistable-tube-invariance*) Let `R` be a complete discrete valuation ring of mixed
characteristic `(0, p)` with uniformiser `π`, `K = Frac(R)` and residue field `k = R/π`. Let `𝔛` be a
strictly semistable formal `R`-scheme — a noetherian `π`-adic formal `R`-scheme with a Zariski
covering by opens `𝔘_i` admitting étale morphisms `𝔘_i → Spf(R⟨X_1..X_n⟩/(X_1⋯X_{r(i)} − π))` — with
closed fibre `𝔛_k = ⋃_{i∈I} Y_i` (irreducible components), `Y_J = ⋂_{i∈J} Y_i`. Let `𝔛^†` be a
`K`-dagger space whose rigid space is the generic fibre `𝔛_K`, and for a subscheme `T ⊆ 𝔛_k` let
`]T[^†_𝔛` be the open dagger subspace of `𝔛^†` with rigid space the tube `]T[_𝔛 = sp^{-1}(T)`. Then
for every nonempty `J ⊆ I` the restriction
`H^*_dR(]Y_J[^†) → H^*_dR(]Y_J − (Y_J ∩ ⋃_{i∈I−J} Y_i)[^†)` is bijective (GK02 §2, Thm 2.4, p. 18; the
definition of strict semistability, with `Z = ∅`, GK02 §2, 2.2, p. 17; the bijectivity statement GK02,
Introduction, Thm C, p. 2; GK05, Introduction, p. 5, for why restriction isomorphisms of this kind
need the dagger setting). For `𝔛 = Spf(R⟨X_1, X_2⟩/(X_1X_2 − π))` (the semistable annulus),
`I = {1, 2}` and `J = {1}`, `H_dR(]Y_1[^†) → H_dR(]Y_1 − Y_{12}[^†)` is bijective (both are `K` in
degree 0 and `K·dlog X_1` in degree 1). *Needs:* *dagger-de-rham-rigid-invariance*;
*dagger-polyannulus-de-rham-cohomology*; *de-rham-cohomology-with-supports*; *dagger-space*;
*dagger-smooth-space*; *admissible-formal-scheme*; *generic-fibre-functor-d*; *specialisation-map*.

**Finiteness of de Rham cohomology of tubes in a quasi-compact strictly semistable formal scheme.**
(*dagger-semistable-tube-finiteness*) Assume (MWF). In the situation of *dagger-semistable-tube-invariance* (`R` a
complete DVR of mixed characteristic, `𝔛` strictly semistable) assume moreover `𝔛` quasi-compact.
Then for every `J ⊆ I` and `q ∈ ℕ`, `dim_K H^q_dR(]Y_J[^†_𝔛) < ∞`, and `dim_K H^q_dR(𝔛^†) < ∞`. The
proof takes as an input the finiteness of Monsky–Washnitzer cohomology of smooth affine `k`-schemes,
which is (MWF) (Berthelot 1997; Mebkhout 1997): by Theorem C and a finite cover,
`]Y_I[^† ≅ Sp(B) × V` with `B = D† ⊗ K` for a smooth `R`-algebra `D` and `V` an open polyannulus,
and Künneth with the polyannulus (*dagger-polyannulus-de-rham-cohomology*) reduces the statement to
(MWF) for `D` (GK02 §2, Thm 2.5 and its proof, pp. 20–21; GK02, Introduction, p. 2). For `𝔛 = Spf(R⟨X_1, X_2⟩/(X_1X_2 − π))`, `H^0_dR(𝔛^†) = K`
and `H^1_dR(𝔛^†) = K·dlog X_1` (the generic fibre is the dagger annulus `|π| ≤ |X_1| ≤ 1`), a
computation that needs no (MWF). *Needs:* (MWF);
*dagger-semistable-tube-invariance*; *dagger-polyannulus-de-rham-cohomology*;
*dagger-de-rham-rigid-invariance*; *weak-completion-generic-fibre*;
*de-rham-cohomology-with-supports*.

**De Rham cohomology of dagger spaces commutes with finite extensions of the base field.**
(*dagger-de-rham-finite-field-extension*) Prove that for `K` complete, nonarchimedean of characteristic
0, `K ⊆ K_1` a finite extension and `X` a smooth `K`-dagger space, `X_1 = X ×_{Sp K} Sp K_1` is a
smooth `K_1`-dagger space and `H^i_dR(X_1/K_1) ≅ H^i_dR(X/K) ⊗_K K_1` for all `i`, so
`dim_K H^i_dR(X/K) = dim_{K_1} H^i_dR(X_1/K_1)`; likewise
`dim_K H^i_Z(X, Ω^•) = dim_{K_1} H^i_{Z_1}(X_1, Ω^•)` for closed subspaces `Z`, so
`h^dR_q(Z, K) = h^dR_q(Z_1, K_1)` (`h^dR_q` as in *dagger-hdr-embedding-independence*, whose
hypothesis — `K` discretely valued of mixed characteristic — this last clause inherits) (GK02 §1, 1.13,
p. 10, where the statement is asserted as clear; base change of dagger spaces GK00 §2, 2.13, p. 12).
`H^1_dR` of the dagger annulus over `K_1` is `K_1·dX/X = (K·dX/X) ⊗_K K_1`. *Needs:*
*dagger-de-rham-complex*; *dagger-differentials*; *dagger-space*;
*de-rham-cohomology-with-supports*; *dagger-local-cohomology-comparison*;
*dagger-hdr-embedding-independence*.

**Finiteness of the de Rham invariants `h^dR_q` of quasi-algebraic affinoid dagger spaces.**
(*quasi-algebraic-affinoid-finiteness*) Assume (MWF) and (RES): the proof of GK02 Thm. 3.4 uses
(MWF) through *dagger-semistable-tube-finiteness* and (RES) through the proper-modification sequence
and the arbitrary-support comparison. Let `R` be a complete discrete valuation ring of mixed
characteristic `(0, p)` with uniformiser `π`, `K = Frac(R)` and residue field `k = R/π`. Prove that for
`H = Sp(K⟨X_1..X_n⟩†/(f_1..f_r))` with `f_j ∈ R[X_1..X_n]` (an affinoid quasi-algebraic dagger space),
`h^dR_q(H) < ∞` for all `q ≥ 0` (`h^dR_q` as in *dagger-hdr-embedding-independence*), by induction on
`dim H` through de Jong's alterations, after a finite extension of `R` — which is why (MWF) covers
finite extensions — the supports sequences, *dagger-finite-etale-trace*,
*dagger-proper-modification-sequence* and *dagger-semistable-tube-finiteness* (GK02 §3, Thm 3.4,
pp. 22–24; de Jong's theorem as used there is GK02 §3, Thm 3.3, p. 22, which is de Jong Thm 6.5, stated
as SchemeAndStackFoundations layer SF.4 (*semistable-alteration-theorem*, with its trait, alteration,
strictly semistable scheme and strictly semistable pair) and used here for `X` integral, separated,
flat and of finite type over the complete discrete valuation ring `R` and `Z ⊊ X` a closed subset
containing the special fibre; the role of alterations GK02, Introduction, p. 2). For
`H = Sp(K⟨X, Y⟩†/(Y^2 − X^3 − X))` with `p` odd, `H` is smooth and is the tube of the affine part
`E_k − {∞}` of the good reduction of the elliptic curve `y^2 = x^3 + x`, so
`h^dR_1(H) = dim H^1_dR(H) = 2g + 1 − 1 = 2` (Monsky–Washnitzer `H^1` of an affine elliptic curve minus
one point). *Needs:* (MWF), (RES); *dagger-local-cohomology-comparison*; *de-rham-cohomology-with-supports*;
*dagger-de-rham-finite-field-extension*; *dagger-finite-etale-trace*;
*dagger-proper-modification-sequence*; *dagger-semistable-tube-finiteness*;
*dagger-analytification*; *dagger-hdr-embedding-independence*; SchemeAndStackFoundations layer
SF.4 (*semistable-alteration-theorem*).

**Finiteness of de Rham cohomology of smooth quasi-compact dagger spaces (Grosse-Klönne's Theorem
A), and base change to finite extensions.** (*dagger-de-rham-finiteness-and-base-change*) Assume
(MWF) and (RES) for the finiteness clause; the base-change clause needs neither. Let `R` be a
complete discrete valuation ring of mixed characteristic `(0, p)` with uniformiser `π`, `K = Frac(R)`
(discretely valued of characteristic 0) and residue field `k = R/π`. Let `X` be a quasi-compact
(quasi-separated) smooth `K`-dagger space, `U ⊆ X` a quasi-compact admissible open subset and
`Z → X` a closed immersion. Then `T = X − (U ∪ Z)` has finite-dimensional de Rham cohomology:
`dim_K H^q_dR(T) < ∞` for all `q`. In particular (`U = ∅`) `dim_K H^q_dR(X − Z) < ∞`, and (`Z = ∅`)
`dim_K H^q_dR(X − U) < ∞`; and for every finite extension `K_1/K`,
`H^q_dR(T_{K_1}/K_1) = H^q_dR(T/K) ⊗_K K_1` (*dagger-de-rham-finite-field-extension*). The finiteness
of Monsky–Washnitzer cohomology, (MWF), enters
through *dagger-semistable-tube-finiteness*. The case `U = ∅` uses *dagger-resolution-lemma* (hence
(RES)), *smooth-affinoid-quasi-algebraic*, *quasi-algebraic-affinoid-finiteness* and the supports
sequence; general `U` adds an induction on dimension with de Jong's alterations, admissible blow-ups
(*admissible-blow-up*), *dagger-proper-modification-sequence* and
*dagger-semistable-tube-finiteness* (GK02, Introduction, Thm A, p. 2; Cor. 3.5 for
`U = ∅` and Thm 3.6 for `Z = ∅`, pp. 24–27; the standing hypothesis — discretely valued, mixed
characteristic — GK02, Introduction, p. 1; GK00 §4, 4.10, p. 22, records the finiteness input with the
same hypothesis). For `X` the closed dagger disc and `U = {|x| ≥ |π|}` (a quasi-compact Laurent
domain), `X − U` is the open disc `{|x| < |π|}`, with `H^0_dR = K` and `H^1_dR = 0`; for `U = ∅` and
`Z = {0}`, `X − Z` is the punctured closed disc with `H^1_dR(X − Z) = K·dx/x`. The finiteness of
rigid cohomology `H^q_rig` of a `k`-scheme of finite type (GK02 Cor. 3.8, via Thm 5.1 of GK00) belongs
to the rigid-cohomology roadmap. *Needs:* (MWF), (RES);
*quasi-algebraic-affinoid-finiteness*; *dagger-resolution-lemma*; *smooth-affinoid-quasi-algebraic*;
*dagger-local-cohomology-comparison*; *de-rham-cohomology-with-supports*;
*dagger-finite-etale-trace*; *dagger-proper-modification-sequence*;
*dagger-semistable-tube-finiteness*; *dagger-approximation*;
*dagger-de-rham-finite-field-extension*; *dagger-analytification*; *admissible-formal-scheme*;
*admissible-blow-up*; SchemeAndStackFoundations layer SF.4 (*semistable-alteration-theorem*).

**Künneth formula for de Rham cohomology of smooth dagger spaces.** (*dagger-de-rham-kunneth*) Let
`K` be the fraction field of a complete discrete valuation ring of mixed characteristic
`(0, p)`, and let `X, Y` be quasi-compact smooth `K`-dagger spaces. Assume (MWF) and (RES); then
their de Rham cohomology is
finite-dimensional by *dagger-de-rham-finiteness-and-base-change*, on affinoid opens as the proof
needs, together with *dagger-strict-differentials*.
Then the cup-product maps `⊕_{p+q=n} H^p_dR(X) ⊗_K H^q_dR(Y) → H^n_dR(X × Y)` are isomorphisms for all
`n` (GK00 §4, Thm 4.12 and its proof, pp. 22–23, restricted here to the quasi-compact
mixed-characteristic case). The algebraic tensor product cannot cover arbitrary disjoint unions:
for `X = Y = ⨿_{i∈ℕ} Sp(K)`, it gives finite-rank matrices inside `K^{ℕ×ℕ}` and misses the
identity matrix. For
`X = Y = D` (closed dagger discs), `H_dR(D × D) = K` in degree 0, matching `K ⊗ K`; for `X = Y` the
dagger annulus, `H^1_dR(X × Y)` is 2-dimensional, spanned by `dX/X` and `dY/Y`, and `H^2` by
`dX/X ∧ dY/Y`. *Needs:* (MWF), (RES); *dagger-de-rham-finiteness-and-base-change*; *dagger-strict-differentials*;
*dagger-tensor-product*; *dagger-differentials*; *dagger-de-rham-complex*; *fringe-topology*;
*de-rham-cohomology-with-supports*.

### F1.12 smooth pairs: logarithmic and compact-support complexes

**Strict normal crossings divisors on smooth dagger spaces (smooth dagger pairs).**
(*dagger-snc-divisor*) Let `X` be a smooth `K`-dagger space (`K` a field complete for a nontrivial
nonarchimedean absolute value of rank one: `NontriviallyNormedField K`, `IsUltrametricDist K`,
`CompleteSpace K`) and `D ⊆ X` a closed dagger subspace (see *dagger-coherent-module*). `D` is a strict
normal crossings divisor if its associated rigid pair `(X', D')` corresponds, under
*rigid-adic-comparison-functor*, to a smooth pair in the sense of *smooth-pair* (`X'` smooth over `K`
with the strict normal crossings divisor `D'`); only this dagger-specific transfer is defined here.
The intrinsic characterisations — every point has an affinoid neighbourhood `Sp(A)` with elements
`x_1, …, x_n ∈ A` such that `dx_1, …, dx_n` is a basis of `Ω^1_A` and `D ∩ Sp(A) = V(x_1⋯x_r)` for
some `r ≤ n` (as a closed subspace); at every point `x ∈ D` the local ring `O_{X,x}` is regular with
a regular system of parameters `x_1..x_d` such that `D` is cut out by `x_1⋯x_r` near `x` and, on a
neighbourhood of `x`, every partial intersection `V(x_{i_1}, …, x_{i_s})`, `i_1 < … < i_s ≤ r`, is
smooth over `K` of pure codimension `s` — are those of
*smooth-pair* (layer R4) for `(X', D')`, transported to `X` along *dagger-to-rigid-functor*, which
identifies the affinoid charts, the differentials and the local rings. The smoothness clause is
relative to `K` and is part of the local-ring criterion: Stacks' regular-parameter definition is
absolute, and over an imperfect `K` a regular parameter can cut out a divisor that is not smooth
over `K` (the inseparable Check below). The pair `(X, D)` is then a
smooth dagger pair; `D` is reduced and an effective Cartier divisor, and locally on an admissible
affinoid covering `D = V(x_1) ∪ … ∪ V(x_r)` with pieces `V(x_i)` smooth over `K` whose partial
intersections are smooth over `K` of the expected codimension. As in *smooth-pair* no condition is imposed on the global
irreducible components: they need not be smooth (e.g. for residue characteristic `≠ 2` the analytified
nodal cubic `V(y^2 − x^2(1 + x)) ⊆ Sp(K⟨x, y⟩†)` is a strict normal crossings divisor in this sense —
at the origin it is `V((y − x√(1+x))(y + x√(1+x)))` with `√(1+x)` analytic on `|x| < 1` — yet it is
irreducible and singular). Define this predicate on closed dagger
subspaces of a smooth dagger space, through the associated rigid pair, the components
(locally on an admissible affinoid covering, the branches `V(x_1), …, V(x_r)` of a chart, each smooth
and an effective Cartier divisor) and the complement `j : X − D → X`; prove
that `D` is SNC iff `(X', D')` is a smooth pair, the existence of
local coordinates `x_1, …, x_n ∈ O(Sp A)` with `dx_i` a basis of `Ω^1_A` and `D = V(x_1⋯x_r)` locally,
that `D` is SNC iff the local-ring criterion above, with its smoothness clause over `K`, holds at
every point of `D` (for the converse, the conormal sequence of the stratum `V(x_1, …, x_r)`, smooth
over `K`, is split exact, so `dx_1, …, dx_r` extend to a basis of `Ω^1` at the point; Stacks Tag
06A6, Lem. 10.138.10, in the algebraic case),
that in a chart the intersections `V(x_{i_1}, …, x_{i_s})` of branches are smooth over `K` of
pure codimension `s` and the remaining branches restrict to a strict normal crossings divisor on
them, that `I_D` is invertible, locally generated by `x_1⋯x_r`,
that for a smooth, separated, finite type `K`-scheme `X` with a divisor `D` that is SNC relative
to `K` in the sense of *analytification-of-smooth-pair* (local branches and all their partial
intersections are smooth over `K` of the expected codimensions), `D^†` is SNC on `X^†` under
*dagger-analytification*, and that restriction to an open subspace and pullback along étale
morphisms are SNC (Stacks Tag 0BI9, Def. 41.21.1, for the local-ring definition and the local
equation `x_1⋯x_r`; Stacks Tag 0BIA, Lem. 41.21.2, applied to the smooth branches and their intersections within each chart; the global irreducible components of the dagger divisor are not required to be smooth; GK02 §0,
Lem. 0.1, p. 4, and GK05, arXiv:1408.3346v1, §4.5 and proof of Lem. 4.6, pp. 23–25, for normal crossings divisors on dagger spaces
and polydiscs). *Needs:* *dagger-smooth-space*; *dagger-coherent-module*; *dagger-to-rigid-functor*;
*dagger-approximation*; *smooth-pair*; *analytification-of-smooth-pair*;
*dagger-analytification*; *rigid-adic-comparison-functor*.

**Checks.**

- Computation: `V(x_1x_2) ⊆ Sp(K⟨x_1, x_2⟩†)` is SNC with components
  `V(x_1)`, `V(x_2)` meeting transversally in the origin.
- Degenerate: `D = ∅` is an SNC divisor on every smooth `X`.
- Algebraic comparison: for every complete nontrivially nonarchimedean `K`, the coordinate
  hyperplane divisor `D = V(T_1⋯T_r) ⊆ A^n_K`, `0 ≤ r ≤ n`, is SNC relative to `K`; its strata
  are affine spaces of codimension equal to the number of intersecting branches. The pair is
  smooth, separated and of finite type, so `(X^†, D^†)` is a smooth dagger pair in every
  characteristic.
- Domain control: over `K = ℚ_p`, the affine line with doubled origin
  `X = A^1_K ⨿_{G_m,K} A^1_K` with empty boundary is an algebraic smooth pair, but is not
  separated. It is outside the algebraic-to-dagger comparison's domain
  (*dagger-analytification*).
- Non-example: `V(x_2^2 − x_1^3)` (a cusp), `V(x_1x_2(x_1 − x_2))` (three
  concurrent lines) and `V(x_1^2)` (non-reduced) are not SNC divisors on the dagger bidisc.
- Non-example (imperfect `K`): for `K = 𝔽_p((t))` and `D = V(T^p − t) ⊆ Sp(K⟨T⟩†)`, `D` is the
  single point with residue field `K(t^{1/p})` (`|t^{1/p}| < 1`), whose maximal ideal is generated
  by `T^p − t`; the local ring there is a discrete valuation ring with uniformiser `T^p − t`, so `D`
  is cut out by a regular system of parameters. Yet `D ≅ Sp K(t^{1/p})` is not smooth over `K` (over
  `K(t^{1/p})` its equation is `(T − t^{1/p})^p`) and `d(T^p − t) = 0` in `Ω^1`, so `D` is not SNC;
  the regular-parameter condition without the smoothness clause would accept it. This is the
  dagger form of the Lean `example` on `V(T^p − a) ⊆ 𝔸¹`. The algebraic divisor
  `V(T^p − t) ⊆ A^1_K` likewise fails the relative SNC hypothesis of the algebraic-to-dagger
  comparison, although `A^1_K` is smooth, separated and of finite type and the divisor satisfies
  the absolute regular-parameter condition.
- Compatibility: `D ⊆ X` is SNC iff `D' ⊆ X'` is an SNC divisor of the
  smooth rigid space `X'` (see *smooth-pair*).

**The logarithmic de Rham complex `Ω^•_X(log D)` along a strict normal crossings divisor.**
(*log-de-rham-complex*) Let `(X, D)` be a smooth `K`-dagger space with a strict normal crossings
divisor (see *dagger-snc-divisor*), `j : X − D → X`. The sheaf `Ω^1_X(log D) ⊆ j_*Ω^1_{X−D}` is the
`O†_X`-submodule generated locally, in coordinates with `D = V(x_1⋯x_r)`, by
`dx_1/x_1, …, dx_r/x_r, dx_{r+1}, …, dx_n`; it is locally free of rank `n` and independent of the
coordinates. `Ω^p_X(log D) := ⋀^p Ω^1_X(log D)`, and the exterior derivative of `j_*Ω^•_{X−D}`
preserves these subsheaves, giving the logarithmic de Rham complex `Ω^•_X(log D)` with
`Ω^•_X ⊆ Ω^•_X(log D) ⊆ j_*Ω^•_{X−D}`. For a smooth component `D_1` of `D` (a closed dagger
subspace smooth over `K` which is a union of irreducible components of `D`) with `D = D_1 + D'` — so that `D'|_{D_1}`
is a strict normal crossings divisor on `D_1` — there is a residue map `Res_{D_1}` and an exact sequence
of complexes `0 → Ω^•_X(log D') → Ω^•_X(log D) → ι_*Ω^•_{D_1}(log D'|_{D_1})[−1] → 0`. Its
hypercohomology is `H^i_dR(X, log D) := H^i(X, Ω^•_X(log D))`, and
`(Ω^•_X(log D))' = Ω^•_{X'}(log D')`. The construction and the residue sequences hold in every
characteristic; the cohomology computations below assume `char K = 0`. Define `Ω^1_X(log D)`, a locally
free subsheaf of `j_*Ω^1_{X−D}`, with `Ω^p_X(log D) = ⋀^p`, the complex `Ω^•_X(log D)` with
`d` restricted from `j_*Ω^•_{X−D}`, the residue
`Res_{D_1} : Ω^•_X(log D) → ι_*Ω^•_{D_1}(log D'|_{D_1})[−1]` for a smooth component `D_1`, and
`H^i_dR(X, log D)`; prove that in coordinates with `D = V(x_1⋯x_r)`,
`dx_1/x_1, …, dx_r/x_r, dx_{r+1}, …, dx_n` is a basis of `Ω^1_X(log D)`, that
`Ω^•_X ⊆ Ω^•_X(log D) ⊆ j_*Ω^•_{X−D}` as maps of complexes, restriction to `X − D` being the
identity of `Ω^•_{X−D}`, that the residue sequence is exact,
that wedge product and `d` satisfy the graded Leibniz rule with
`Res(ω ∧ η) = Res(ω) ∧ η|_{D_1}` for `η` without poles, that a morphism of
smooth pairs `f : (X_1, D_1) → (X, D)` with `f^{-1}(D) ⊆ D_1` induces
`f^* : Ω^•_X(log D) → f_*Ω^•_{X_1}(log D_1)`, that
`(Ω^p_X(log D))' = Ω^p_{X'}(log D')` as coherent modules on the rigid space, and that
`Ω^•_X(log ∅) = Ω^•_X` (Stacks Section 50.15 (Tag 0FMU), Def. 50.15.3, for the log complex
of a smooth divisor; independence of the local equation, proof of Lem. 50.15.2; exterior powers,
Lem. 50.15.4; these Stacks statements concern one smooth divisor. The several-branch construction uses the
same coordinate rule separately for each branch and glues the resulting subsheaves of meromorphic
forms. GK05, arXiv:1408.3346v1, §4.5 and Lem. 4.6, pp. 23–25, for the free basis of `dlog` forms on dagger polydiscs). *Needs:* *dagger-snc-divisor*;
*dagger-de-rham-complex*; *dagger-differentials*; *dagger-to-rigid-functor*; Mathlib
`ExteriorAlgebra.exteriorPower`, `CochainComplex`.

**Checks.**

- Computation: for the closed dagger polydisc `V = Sp(K⟨x_1..x_n⟩†)` and
  `D = V(x_1⋯x_r)` (`char K = 0`), `H^q(V, Ω^•(log D))` has basis the classes
  `dlog x_{i_1} ∧ … ∧ dlog x_{i_q}`, `i_1 < … < i_q ≤ r` (the argument of
  *dagger-polyannulus-de-rham-cohomology* with nonnegative exponents).
- Degenerate: for `D = ∅`, `Ω^•_X(log D) = Ω^•_X` and
  `H^i_dR(X, log ∅) = H^i_dR(X)`.
- Non-example: `dx/x^2` is a section of `j_*Ω^1_{X−D}` (and of
the sheaf `Ω^1_X(∗D)` of forms with arbitrary poles along `D`) but not of `Ω^1_X(log D)` for `D =
{x = 0}`: the log complex is not the complex of forms
  with arbitrary poles.
- Compatibility: in characteristic zero, for the open unit bidisc `U` with `D = V(x_1x_2)` and
  `ω^•_U` the quotient of `Ω^•_U(log D)` by the ideal generated by `dlog(x_1x_2)`, the restriction
  to `U^0 = V(x_1x_2)` has `H^1` one-dimensional, generated by `dlog(x_1)` (GK05, Introduction).
- Characterisation: for `char K = 0` and the divisor `{0}` in the
  closed dagger disc `D`, `Res(dx/x) = 1` and the residue sequence
  `0 → Ω^•_D → Ω^•_D(log {0}) → ι_*K[−1] → 0` gives `H^1(D, log {0}) ≅ K` via the residue (using
  `H^1_dR(D) = 0`); in one variable `x·f′` runs through all `g` with `g(0) = 0`.
- Negative control (characteristic `p`): the computations fail already for `D = ∅`: `X^p` is closed
  and not constant, and `X^{p−1}dX` is closed and not exact (Lean `example` for the latter).

**The boundary-vanishing (compact-support) logarithmic de Rham complex `Ω^•_X(log D)(−D)`.**
(*compact-support-log-complex*) Let `(X, D)` be a smooth `K`-dagger space with a strict normal
crossings divisor and `I_D ⊆ O†_X` its (invertible) ideal. The compact-support logarithmic de Rham
complex is the subcomplex `Ω^•_X(log D)(−D) := I_D · Ω^•_X(log D)` of `Ω^•_X(log D)`; in coordinates
with `D = V(x_1⋯x_r)` it is `x_1⋯x_r·Ω^•_X(log D) ⊆ Ω^•_X` (for `f ∈ I_D`, `df ∈ I_D·Ω¹_X(log D)`:
locally `d(x_1 ⋯ x_r) = x_1 ⋯ x_r Σ_{i≤r} dlog x_i`). Its hypercohomology, ordinary hypercohomology
on the G-topology computed with Mathlib's sheaf cohomology, is the object of this subsection:
`H^i_dR(X, D)_! := H^i(X, Ω^•_X(log D)(−D))`, the de Rham cohomology of the pair with vanishing along
the boundary. There are natural maps `Ω^•_X(log D)(−D) ⊆ Ω^•_X ⊆ Ω^•_X(log D)`, inducing
`H^i_dR(X, D)_! → H^i_dR(X) → H^i_dR(X, log D)`, and on `X − D` the complex restricts to `Ω^•_{X−D}`,
inducing the restriction `H^i_dR(X, D)_! → H^i_dR(X − D)`. For non-proper `X`, `H_dR(X, D)_!` is not
the compactly supported cohomology of `X − D`: for the closed dagger disc and `D = ∅` it is
`H_dR = (K, 0, 0)`, whereas `H_{dR,c} = (0, 0, K)` (*compact-support-de-rham*); the comparison for
proper `X` is *compact-support-log-comparison*.
With coefficients: for a locally free `E` with integrable connection having logarithmic poles along
`D`, `DR_c(E) := I_D·E ⊗ Ω^•_X(log D)`. Define the
subcomplex `I_D · Ω^•_X(log D)`, the groups `H^i_dR(X, D)_!` with the maps
`H^i_dR(X, D)_! → H^i_dR(X) → H^i_dR(X, log D)` and `H^i_dR(X, D)_! → H^i_dR(X − D)`, and `DR_c(E)` for
`E` locally free with an integrable logarithmic connection; prove that
`Ω^•_X(log D)(−D) ⊆ Ω^•_X ⊆ Ω^•_X(log D)` as complexes, that on
`X − D` the complex is `Ω^•_{X−D}`, that locally
`Ω^p_X(log D)(−D)` is free on `x_1⋯x_r dlog x_I ∧ dx_J`, `I ⊆ {1..r}`, `J ⊆ {r+1..n}`,
`|I| + |J| = p`, that a morphism of smooth pairs `f` with
`f^*I_D ⊆ I_{D_1}`, e.g. étale with `f^{-1}D = D_1`, induces
`f^* : Ω^•_X(log D)(−D) → f_*Ω^•_{X_1}(log D_1)(−D_1)`, and that for
`D = ∅`, `Ω^•_X(log ∅)(−∅) = Ω^•_X` (Stacks Section 50.15 (Tag 0FMU), proof of Lem. 50.15.2: forms vanishing on the
boundary are exactly `f·(log forms)`, and Lem. 50.15.2 for the residue sequence; GK00 §5, 5.2, p. 24,
for compact-support variants of dagger de Rham cohomology). *Needs:* *log-de-rham-complex*;
*dagger-snc-divisor*; *dagger-de-rham-complex*; *dagger-coherent-module*.

**Checks.**

- Computation: for `X = (P^1)^†` and `D = {0, ∞}`: `H^0_dR(X, D)_! = 0`,
  `H^1_dR(X, D)_! = K` and `H^2_dR(X, D)_! = K`, by Čech cohomology for the cover
  `({|z| ≤ 1}, {|z| ≥ 1})` (equivalently on `P^1 = U_0 ∪ U_∞` via GAGA,
  *dagger-analytification*); here `Ω^0(log D)(−D) = O(−2)` and `Ω^1(log D)(−D) = Ω^1_{P^1}`, `H^1`
  is the Čech class of the constant `1` in `H^1(O(−D))` on the overlap and `H^2` the class of `dz/z`
  in `H^1(Ω^1)`, with `d(1) = 0`. For `D = {∞}` the same computation gives `(0, 0, K)`.
- Degenerate: for `D = ∅` the complex is `Ω^•_X` and
  `H^i_dR(X, ∅)_! = H^i_dR(X)`.
- Non-example: the naive twist `I_D · Ω^•_X` is not a complex:
  for `D = {x = 0}`, `d(x) = dx ∉ x·Ω^1_X`, while `x·dlog x = dx` lies in `I_D·Ω^1(log D)`. The
  logarithmic forms are needed to get a subcomplex.
- Non-example (not compact support): for the closed dagger disc and `D = ∅`,
  `H_dR(X, ∅)_! = (K, 0, 0)` differs from `H_{dR,c}(X) = (0, 0, K)`.
- Compatibility: the restriction of `Ω^•_X(log D)(−D)` to `X − D`
  equals `Ω^•_{X−D}` (see *dagger-de-rham-complex*).

**Localisation sequences for boundary-vanishing log de Rham complexes and for compactly supported
cohomology.** (*compact-support-localisation-maps*) Let `(X, D)` be a smooth `K`-dagger space with a
strict normal crossings divisor, `D = D_1 + D'` with `D_1` a smooth component and `D'` the union of the
others; write `ι : D_1 → X` and `D'_1 = D' ∩ D_1` (a strict normal crossings divisor on `D_1`). Prove
that (a) restriction of forms gives an exact sequence of complexes
`0 → Ω^•_X(log D)(−D) → Ω^•_X(log D')(−D') → ι_*Ω^•_{D_1}(log D'_1)(−D'_1) → 0`, hence a long exact
localisation sequence `… → H^i_dR(X, D)_! → H^i_dR(X, D')_! → H^i_dR(D_1, D'_1)_! → H^{i+1}_dR(X, D)_! → …`
on the object of *compact-support-log-complex*; for
`D' = ∅` this is `0 → Ω^•_X(log D_1)(−D_1) → Ω^•_X → ι_*Ω^•_{D_1} → 0`; here `D_1` is a smooth
branch on a chart of an admissible affinoid covering (*dagger-snc-divisor*), not a global
irreducible component, which need not be smooth; iterating over the branches of a chart, the
cokernel of `Ω^•(log D)(−D) → Ω^•_X` is resolved on the chart by the complexes `ι_*Ω^•_{D_I}` of the
strata `D_I = ⋂_{i∈I} D_i`, and these descend, by the orientation-aware glueing of
*dagger-tubular-neighbourhood* (c), to the global resolution by `ι_{s*}(Ω^•_{D^{(s)}} ⊗ ε_s)`,
`ε_s` the branch-orientation line; the removal sequence is a chart-level statement, and its
global long exact sequence with `(X, D')` is asserted only for a genuine global decomposition
`D = D_1 + D'` with `D_1` a globally smooth component; and (b) for an admissible open
`U ⊆ X` with complement `Y` and a closed `Z ⊆ Y`, the supports sequence
`… → H^i_Z(X) → H^i_Y(X) → H^i_{Y−Z}(X − Z) → …` (see *de-rham-cohomology-with-supports*) gives, for
an affinoid subdomain `U_0 ⊂† X`, the extension-by-zero map `H^i_{dR,c}(U_0) → H^i_{dR,c}(X)` and
its localisation sequence with the cohomology of the fringe annulus `X' − U_0'` (Stacks Tag 0FMU,
proof of Lem. 50.15.2, for the kernel computation and the surjectivity of the residue/restriction;
GK02 §1, 1.9 (c), p. 7, for local cohomology along intersections of boundary components, and Prop.
1.16 (b), p. 11, for the supports localisation sequence used in (b)). For `X = (P^1)^†`,
`D = {0, ∞}`, `D_1 = {0}`, `D' = {∞}`: `0 → H^0_dR(X, D')_! → H^0(D_1) = K → H^1_dR(X, D)_! → H^1_dR(X, D')_!
→ 0 → H^2_dR(X, D)_! → H^2_dR(X, D')_! → 0`, consistent with `H_dR(X, D)_! = (0, K, K)` and
`H_dR(X, {∞})_! = (0, 0, K)` (the affine line has compactly supported cohomology `K` in degree 2):
the connecting map `H^0_dR({0}) = K → H^1_dR(X, D)_! = K` is an isomorphism.
*Needs:* *compact-support-log-complex*; *log-de-rham-complex*; *dagger-snc-divisor*;
*dagger-tubular-neighbourhood*; *dagger-coherent-module*; *de-rham-cohomology-with-supports*;
*compact-support-de-rham*.

**Checks.**

- Computation (degree by degree on the disc): for `D_1 = {0}`, `D' = ∅`, the sequence of complexes
  is, in degree `0`, `0 → xO → O → K → 0` (evaluation at `0`) and, in degree `1`, `O dx = O dx`.
- Computation: the `(P^1)^†` sequence above, with its connecting isomorphism.

**Comparison with compact supports for a proper ambient space.** (*compact-support-log-comparison*)
This comparison is a construction of this roadmap; GK02 and the Stacks Project are cited only for
its ingredients, and no source states it in the dagger setting. Let `char K = 0`, `K` discretely
valued, `X` a smooth proper dagger space (equivalently rigid space,
*partially-proper-dagger-rigid-equivalence*) of pure dimension `n`, `D` a strict normal crossings
divisor and `U = X − D`, partially proper over `Sp K` as the complement of a Zariski closed
subset. Let `H^i_{dR,c}(U) := H^i(Rp_{U!} Ω^•_U)` with `p_U : U → Sp K` and `Rp_{U!}` of
*dagger-d-module-direct-image*; it agrees with the colimit form of *compact-support-de-rham* when
`U` is Stein. Prove that `H^i_dR(X, D)_! ≅ H^i_{dR,c}(U)`, compatibly with the maps to `H^i_dR(X)`
and with the localisation sequences of *compact-support-localisation-maps*, which become those of
`H_{dR,c}` for `X − D ⊆ X − D'` with closed complement `D_1 − D'`. Proof route: as `X` is
quasi-compact, `Rp_{U!}Ω^•_U` is the colimit, over the admissible open neighbourhoods `V ⊇ D` with
quasi-compact complement, of the cohomology of `X` with supports in `X − V`
(*de-rham-cohomology-with-supports*, with excision); the cokernel of `Ω^•(log D)(−D) → Ω^•_X` is
resolved by the complexes `ι_{s*}(Ω^•_{D^{(s)}} ⊗ ε_s)` of the local branches and their
intersections, with their orientation lines (*compact-support-localisation-maps* (a), descended as
in *dagger-tubular-neighbourhood* (c); the global irreducible components of `D` need not be
smooth), and the colimit over `V` of `RΓ(V, Ω^•_X)` is computed chart by chart on the tubular
neighbourhoods `D_I × D^{|I|}(ρ)` of the local immersions `D_I → X_j` (*dagger-tubular-neighbourhood*
(a)), assembled by the finite Čech form (b2) — `X` is proper, hence quasi-compact with a finite
admissible affinoid covering — after shrinking `ρ` on the finite overlaps (GK02 §1, proof of
Prop. 1.16(B), where the products are local on an admissible covering), the open polydisc contributing `K` in degree `0` by
*dagger-polyannulus-de-rham-cohomology*; the local identifications of the neighbourhood colimit
with the boundary quotient glue to the global comparison and commute with the localisation maps
because both are formed from the same chart-local branch resolution; GK02 §1, 1.6, defines
`Rp_!`, and Stacks Tag 0FMU supplies the residue resolution. *Needs:* *compact-support-log-complex*;
*compact-support-localisation-maps*; *dagger-tubular-neighbourhood*; *compact-support-de-rham*;
*dagger-d-module-direct-image*; *de-rham-cohomology-with-supports*;
*dagger-polyannulus-de-rham-cohomology*; *partially-proper-dagger-rigid-equivalence*.

**Checks.**

- Degenerate: `D = ∅` gives `H_dR(X) = H_{dR,c}(X)` for proper `X`.
- Computation: `(P^1, {0, ∞})` gives `(0, K, K) = H_{dR,c}(G_m)` and `(P^1, {∞})` gives
  `(0, 0, K) = H_{dR,c}(𝔸^1)`, the right sides by Poincaré duality on the Stein spaces `G_m` and
  `𝔸^1` when `K` has mixed characteristic.
- Computation: for a geometrically connected smooth proper curve of genus `g` and a boundary of
  `m ≥ 1` distinct `K`-rational points, both sides are `(0, 2g + m − 1, 1)`; in general `m` is
  replaced by `Σ_{x∈D} [κ(x) : K]`. For `P^1` with one boundary point whose residue field `L` is a
  separable quadratic extension of `K`, `H^1_dR(X, D)_! = L/K` has dimension `1`, not `0`.
- Non-example: the closed disc with `D = ∅` shows that properness is needed
  (*compact-support-log-complex*).

### F1.13 Checks for the algebraic constructions

These Checks supplement those
attached to the definitions above. For a zero algebra, the spectrum is empty; for the dual
numbers, the nilpotent coordinate is nonzero even though every point norm kills it.

- Radius topology: in zero variables the radius topology is the field topology transported by the constant map (any positive radius).
- The inclusion `W_n → T_n`: the inclusion of overconvergent series into the completed Tate algebra is injective.
- The inclusion `W_n → T_n`: over ℚ_p the one-variable completion map is not surjective; the lacunary series Σ p^m X^(p^m) witnesses this.
- Residue norms: for the identity presentation of W₁, the residue norm of X is 1.
- Residue norms: for W₁/(X²), the residue norm of the nonzero nilpotent X is 1.
- Residue norms: the quotient presentation of the zero algebra has residue norm 0 on its unique element.
- Affinoid topology: the canonical affinoid topology on K is its given valuation topology.
- Affinoid topology: the affinoid topology on W₁/(X²) is Hausdorff although its supremum seminorm kills X.
- Affinoid topology: the affinoid topology on W₁ is not discrete: nonzero scalar powers tend to zero.
- Point norms: at every maximal point the value of a scalar is its given absolute value.
- Supremum seminorm: the supremum seminorm of X on the dagger unit disc is 1.
- Supremum seminorm: on W₁/(X²), the supremum seminorm kills X while its quotient norm remains 1.
- Integral subring: every scalar multiple of the nilpotent X in W₁/(X²) is integral, even for scalars of absolute value greater than 1.
- Completion of morphisms: completing the identity of W₁ gives the identity.
- Completion of morphisms: completing the quotient W₁→W₁/(X) sends the completed coordinate to zero.
- Completion of morphisms: the completed quotient by X² retains a nonzero X whose square is zero.
- Presentation topology: every fringe presentation of K induces its valuation topology.
- Presentation topology: for |π|<1, the scalar sequence π^j tends to zero in every presentation topology.
- Presentation topology: for W₁ over ℚ_p every presentation topology differs from the affinoid topology.
- Module fringe topology: the module topology on the rank-one K-module K is its valuation topology.
- Module fringe topology: on K² the module fringe topology is the product topology.
- Module fringe topology: the zero module has the unique topology.
- The overconvergent disc algebra `K⟨λ^{-1}Z⟩†`: radius 1 recovers W_m.
- The overconvergent disc algebra `K⟨λ^{-1}Z⟩†`: with no variables every formal series belongs, at any radius.
- The overconvergent disc algebra `K⟨λ^{-1}Z⟩†`: over ℚ_p the geometric series Σ p^j Z^j is excluded at radius p.
- Its coordinate `Z`: the Gauss norm at a positive radius ρ of the coordinate Z is ρ.
- Its coordinate `Z`: the coordinate Z vanishes at zero, so is not a unit in a positive-radius disc algebra.
- Its coordinate `Z`: for |c| r < 1, the geometric denominator 1−cZ is invertible on the overconvergent disc of positive radius r.
- The relative dagger algebra `A⟨Z⟩†`: adjoining m dagger variables to K gives W_m.
- The relative dagger algebra `A⟨Z⟩†`: adjoining no variables gives A, and its structure map is bijective.
- The relative dagger algebra `A⟨Z⟩†`: adjoining a dagger variable to the zero algebra gives the zero algebra.
- The structure map `A → A⟨Z⟩†`: the structure map A→A⟨Z⟩† is injective, including when A has nilpotents.
- The structure map `A → A⟨Z⟩†`: the new variable in K⟨Z⟩† is outside the image of K.
- The relative coordinate: the relative coordinate over K is not invertible.
- The relative coordinate: over K, 1−cZ is invertible whenever |c|<1.
- Rational relation ideal: with no numerators the relation ideal is zero.
- Rational relation ideal: numerator 1 and denominator 0 generate the unit ideal.
- Rational relation ideal: numerator 0 and denominator 1 impose Z=0, a proper ideal over K.
- Laurent relation ideal: inverting zero imposes the unit ideal.
- Laurent relation ideal: inverting one imposes Z−1; over K this ideal is proper.
- Laurent relation ideal: for 0<|π|<1, the relation πZ−1 is invertible and the Laurent domain is empty.
- Laurent structure map: the Laurent structure map for f=1 is bijective.
- Laurent structure map: localising K at f=0 sends 1 to 0.
- Rational structure map: numerator 1 and denominator 0 give the zero map to the zero algebra.
- Rational domains: the rational domain with numerator 1 and denominator 0 is empty.
- `π`-adic completion: the adic completion of the complete DVR at a uniformiser is the DVR itself.
- The weak-completion set: the constant 1 belongs to the weak-completion set for any finite family, including the empty family.
- The weak-completion set: for the polynomial generator X, the weak-completion set contains the geometric inverse of 1−πX.
- The weak-completion set: for a uniformiser, the single polynomial generator does not generate the entire adic completion under linear degree growth.
- The weak-completion map: the weak-completion map of the complete base DVR is bijective.
- The weak-completion map: for S=O[1/π], the weak-completion map sends 1 to 0 although S is nonzero.
- Functoriality of weak completion: extending the identity of O[X] gives the identity of its weak completion.
- Functoriality of weak completion: the extended evaluation X↦0 sends the weak coordinate to zero.
- Functoriality of weak completion: the extended evaluation X↦1 sends the weak coordinate to one.
- Generic fibre of weak completions: the generic fibre of the weak completion of O is its fraction field.
- Generic fibre of weak completions: the generic fibre of the weak completion of the residue field is zero.
- Kähler differentials to `Ω¹`: over K itself, the canonical map from algebraic differentials is bijective between zero modules.
- Kähler differentials to `Ω¹`: the image of the algebraic differential d(X²) is 2X dX in the finite differential module of W₁.
- Kähler differentials to `Ω¹`: in mixed characteristic, the map from algebraic differentials of W₁ to the universally finite module is not injective.
- Functoriality of `Ω¹`: pulling back differentials by the identity of W₁ gives the identity linear map.
- Functoriality of `Ω¹`: for any dagger-disc endomorphism X↦X², pullback sends dX to 2X dX.
- Functoriality of `Ω¹`: a map W₁→K sends every differential to zero.
- Universal property of `Ω¹`: the zero derivation of W₁ lifts to the zero linear map.
- Universal property of `Ω¹`: lifting the universal derivation of W₁ gives the identity of Ω¹.
- Universal property of `Ω¹`: a derivation with D(X)=1 evaluates d(X²) as 2X under its universal factorisation.
- Integral subalgebra: for A=K, the integral subalgebra has exactly the valuation unit ball as underlying set.
- Integral subalgebra: every scalar multiple of X in W₁/(X²) belongs to the integral subalgebra.
- Integral subalgebra: a scalar of absolute value greater than 1 is excluded from the integral subalgebra of K.
- Reduction of an MW-type algebra: the reduction of the dagger unit annulus is k[x,y]/(xy−1).
- Minimal presentations: the least presentation dimension of K is 0, and its chosen presentation is bijective.
- Minimal presentations: the least presentation dimension of W₁ is 1, and every chosen minimal presentation is bijective.
- Minimal presentations: the dual numbers W₁/(X²) have least presentation dimension 1; their presentation cannot be injective.
- Tensor relation ideal: for K⊗†_K K, the ideal in the minimal zero-variable presentation is zero.
- Tensor relation ideal: a zero factor makes the tensor relation ideal the unit ideal.
- Tensor relation ideal: for W₁⊗†_(W₁)W₁, the ideal in the two-variable minimal presentation is nonzero principal.
- Tensor inclusions: in A⊗†_A A both structure maps are bijective.
- Tensor inclusions: with a zero opposite factor, the structure map from K sends 1 to 0 on either side.
- Fringe stages: a presentation with a relation equal to 1 has the zero algebra at every stage.
- Stage topology: for a zero-variable presentation of K, the stage topology is transported from K along its scalar map.
- Stage topology: a zero stage has the unique topology.
- Stage topology: a nonzero stage is not discrete over the nontrivially valued field.
- Transition maps: for a zero-variable presentation of K, every transition is bijective.
- Transition maps: radius restriction sends the quotient coordinate X_i to the same coordinate at the smaller radius.
- Transition maps: for the zero dagger algebra, a presentation by X−c with |c|>1 has a noninjective transition from a stage containing c to one excluding it.
- Stage maps to `A`: the stage coordinate maps to the coordinate class under the specified presentation isomorphism.
- Stage maps to `A`: for X−c with |c|>1 there is a nonzero stage mapping to the zero dagger algebra.
- Fringe algebras: in a zero-variable presentation of K, the fringe algebra is all of K.
- Fringe algebras: for a one-variable relation-free presentation of W₁, each fixed-radius fringe algebra is proper.
- Affinoid subdomain algebras: the representing algebra of the whole spectrum is A, and its restriction map is bijective.
- Affinoid subdomain algebras: the empty subdomain is represented by the zero algebra; restriction sends 1 to 0.
- Affinoid subdomain algebras: on |X|≤|π| in the unit disc, the representing algebra is W₁ with X restricting to πZ.
- Universal property of affinoid subdomains: factoring the universal restriction through itself gives the identity of its representing algebra.
- Universal property of affinoid subdomains: the factorisation of id_A through the whole-spectrum representative is inverse to restriction.
- Universal property of affinoid subdomains: for an empty subdomain, every admissible factorisation lands in a zero algebra and sends 1 to 0.
- Restriction to an affinoid subdomain: restriction from a subdomain to itself is the identity A-algebra map.
- Restriction to an affinoid subdomain: restriction to the empty subdomain sends 1 to 0.
- Restriction to an affinoid subdomain: for nested closed discs of radii |π|² and |π|, restriction sends the outer normalised coordinate to π times the inner one.
- Universal property of the dagger tensor product: for A⊗†_A A, the lift of the two identity maps is bijective.
- Universal property of the dagger tensor product: on W₁⊗†_K W₁, evaluating the first coordinate at 0 and the second at 1 sends X−Y to −1.
- Universal property of the dagger tensor product: the fold W₁⊗†_K W₁→W₁ is not injective: it identifies the two coordinates.
- Functoriality of the dagger tensor product: the identity diagram on the two dagger discs induces the identity tensor map.
- Functoriality of the dagger tensor product: for two evaluations at 0 and 1, the tensor diagram map sends X−Y to −1.
- Functoriality of the dagger tensor product: changing the sign of the first disc coordinate changes the sign of X−Y to −X−Y, preserving the second factor.
- Universal property of rational localisation: for K⟨Z⟩†/(Z), the lift to K sends the quotient coordinate to 0.
- Universal property of rational localisation: for K⟨Z⟩†/(Z−1), the lift to K sends the quotient coordinate to 1.
- Universal property of rational localisation: for the map of dagger discs X↦πX and the localisation |X|≤|π|, the factorisation sends Z=X/π to X.

The Hasse-derivative bound of *overconvergent-tate-algebra* reads: for `f ∈ T_n(ρ)`,
`ρ > 0` and multi-index `μ`, the coefficients of `D^[μ] f` are
`(∏_i binom(ν_i+μ_i,μ_i)) a_(ν+μ)`, and its radius norm is at most
`ρ^(−|μ|) |f|_ρ`. This formulation is valid in every characteristic; its characteristic-`p`
Check above distinguishes it from dividing an ordinary derivative by `μ!`.

*dagger-tate-acyclicity* states all positive degrees of the augmented Čech exactness
of GK00 Proposition 2.6 (p. 11), for an arbitrary `A`-module and a finite affinoid cover.
Its cochains are products of the actual modules `O(U_(i₀)∩⋯∩U_(i_q)) ⊗_A M`;
its differential is the sum of restrictions with coefficient `(-1)^j` for the face omitting
index `j`. The degree-zero augmentation is its degree-zero case. A sign Check uses the cover with two copies of the whole
spectrum and the sections `1⊗3`, `1⊗7`; its differential is `1⊗(7−3) = 1⊗4`.


### F1.14 Checks for the dagger site and comparison maps

The following computations use the actual dagger algebras, their completed point sets, and
module sheaves on the transported strong Tate site.

- Polynomial generators of maximal ideals: the only maximal ideal of `W₀ = K` is zero; its
  polynomial generating family is empty.
- Polynomial generators of maximal ideals: `(X)` is maximal in `W₁`.
- Primitives at a radius: apply the coefficient formula of the primitive estimate of
  *overconvergent-tate-algebra* (termwise primitives send `T_n(ρ)` into `T_n(σ)` for `σ < ρ`,
  with an operator bound `C`) to `1 ∈ T₁(ρ)`. For `0 < σ < ρ` it gives `X ∈ T₁(σ)`,
  with derivative `1` and radius norm exactly `σ`; the operator bound
  therefore satisfies `σ ≤ C` (the coefficient estimate in Kedlaya06
  Proposition 3.1.4, p. 20).
- Injectivity of the weak-completion map: `O_K → O_K†` is injective.
- Injectivity of the weak-completion map: `O_K[1/π] → O_K[1/π]† = 0` is not injective.
- Injectivity of the weak-completion map: the residue field maps injectively to its weak
  completion, although it is not flat over `O_K`. In general injectivity of `S → S†` is
  equivalent to parameter-adic separatedness of `S` (*weak-completion*).
- Affinoid dagger spaces: the
  bundled field has one maximal point, the zero quotient has none, and `W₁` has Krull dimension one.
- The dagger site: the empty cover covers the empty open;
  the singleton whole-space cover covers an affinoid.
- The dagger site: the open unit disc is
  admissible, but partitioning the closed disc into `|X| < 1` and `|X| = 1` is not an admissible
  cover. Pointwise coverage alone therefore does not define this site.
- The dagger structure sheaf: sections are
  `W₁` on the closed dagger disc, `K` on its rational point, and the zero ring on the empty open.
- Dagger spaces: the space of the zero algebra has no points. Together with
  the field point, the disc and the underlying rigid space of a dagger space, this
  tests the atlas, its sheaf, and its rigid completion.
- Completion: completion gives
  `K`, the one-variable Tate algebra, and the zero ring, respectively.
- Points of the completion: the field
  has a single completed point, the zero algebra has none, and the vanishing of `X` is preserved
  under maximal-ideal contraction. This fixes which point corresponds to the origin.
- Morphisms of affinoid dagger spaces: the origin pulls
  `X` back to zero; the field point has one endomorphism; it has no morphism to the empty space.
- Completion functor `(·)′`: completion is not full,
  is bijective on functions at the field point, and is bijective on the classical stalks of the
  disc despite failing surjectivity on its global functions.
- Associated sheaves: the sheaf associated to `W₁/(X)` has global sections `K`.
- Coherent modules: the associated sheaf of the countably generated free module
  over a nonzero dagger algebra is not coherent.
- Associated sheaves: the zero module gives the zero sheaf, and the rank-one
  free module gives the structure sheaf; both are coherent.
- Strict neighbourhoods: a strict neighbourhood of the entire ambient space
  is the entire space. The empty and whole-neighbourhood cases are tested as well.

- Sections of associated sheaves: local tensor coordinates of every section on the empty
  subdomain are zero.
- Sections of associated sheaves: the global inverse sends `1 ⊗ (3,7)` to `(3,7)`.
- Sections of associated sheaves: the global section corresponding to `1` in
  `W₁/(X)` is nonzero, but all its local tensor sections vanish on `|X| = 1`.
- Global sections of associated sheaves: the inverse section map of the zero associated module
  has value zero on every section.
- Global sections of associated sheaves: the associated swap of two free generators carries
  the global section `(3,7)` to `(7,3)`. Together with the tensor and skyscraper computations,
  this tests the inverse on elements and its compatibility with morphisms.

The disc Checks of *strict-neighbourhood* (larger discs, the disc itself, and the cofinal
fringe system) use the scaled model inside the rigid closed unit disc:
`U = {|T| ≤ |π|}` for `0 < |π| < 1`. The larger discs have `|π| < r ≤ 1`, `r ∈ Γ*`;
scaling `T = πX` gives the formulation above. In particular the boundary partition fails to
be an admissible covering even though it covers every classical point.

### F1.15 characteristic equations for properness and cohomology

Excellence (SchemeAndStackFoundations SF.0, *excellent-ring*) uses Mathlib's completion at the
maximal ideal of each
prime localization. Its formal fibres are geometrically regular after every
finite extension of the residue field, regular loci of finite type algebras are
open, and saturated finite prime chains with equal endpoints have equal lengths.
Noetherianity is included. The excellence of `W_n`, of dagger algebras and of rigid affinoid
algebras carries the characteristic-zero
hypothesis of *dagger-algebra-excellent*.

**Checks.** Every field is excellent;
a nonreduced excellent ring is included; and
a nonnoetherian polynomial ring is rejected.
A noetherian domain is rejected as well: there is a noetherian domain with
two finite saturated prime chains having the same endpoints and unequal lengths.
The source is EGA IV₂, Example 5.6.11, pp. 101–102, whose noetherian local domain
is catenary but not universally catenary; Proposition 5.6.1, pp. 97–98, therefore
gives a noncatenary polynomial algebra over it, still a noetherian domain.
Failure of excellence follows from these chains using the
catenary clause with the ring itself as its finite type algebra. Thus
noetherianity alone cannot satisfy this Check.

Relative compactness of affinoid dagger spaces uses a surjective relative dagger Tate
presentation and
a uniform strict norm bound on its generators over the smaller affinoid.
Partial properness requires separatedness and admissible inner coverings;
properness adds quasi-compactness. Being Stein requires a countable admissible
exhaustion with relatively compact inclusions. The structure map to the point is unique and
is the scalar structure map. These are GK00 §2, 2.24, p. 15.

**Checks.** Relative compactness holds for the
point and for an empty inner domain, and the closed
disc is not relatively compact in itself. Identities are partially proper and proper;
the point is partially proper, proper and Stein;
the closed disc is not partially proper, not proper and not Stein. The empty space is Stein.
The structure map of the point is the identity,
it is the scalar algebra homomorphism, and for the empty space it has
empty image. The open unit disc is Stein.

Smoothness of a dagger space uses local étale coordinates on the rigid completion, equivalent to
smoothness of its structure morphism. Pure dimension `n` is the equality
`ringKrullDim (O_{X,x}) = n` at every classical point.
For smooth `X`, `Ω¹` has a basis of size `n` after localization at each
maximal ideal. A strict normal crossings divisor retains the ideal in every stalk: on an affinoid
coordinate chart it is generated by the product of the boundary coordinates,
whose differentials extend to a basis. Its ideal is radical and Cartier, and it is stable
under étale pullback.

**Checks.** The polydisc is smooth of pure dimension `n`;
the empty space is smooth and of every pure
dimension; the nilpotent origin is not smooth;
the disc does not have pure dimension zero.
The unit ideal is an SNC divisor; so are the two
coordinate axes; multiplicity two is rejected.

Dagger analytification on separated finite type `K`-schemes is a functor, naturally isomorphic
after completion to the restriction of Part II's rigid analytification to those schemes,
with partially proper image, so that it lies in the category where
completion is fully faithful. These properties characterize the functor through
GK00 Theorem 2.27; GK00 §3, 3.3, p. 18 constructs it this way.

**Checks.** The analytification of `Spec K` is `Sp K`; that of the empty scheme has
no points; no affinoid model exists for
the whole affine line. The smooth affine line with doubled origin is excluded: its rigid
analytification is not quasi-separated, as in the negative Check of *dagger-analytification*.

The terms and the differential of the de Rham complex are specified on every dagger affinoid
open. De Rham cohomology is hypercohomology,
expressed as derived Hom from the free rank-one constant sheaf.
For a representable open `U`, `F_U` is the sheafification of the free module on it;
the support constant sheaf of `U` is the cokernel of `F_U → F_X`;
cohomology with support in `X − U` in degree `q` is derived Hom from this cokernel to the
shifted de Rham
complex. Thus its support is `X − U`. The map to ordinary cohomology is precomposition
with the cokernel quotient. The localization sequence computes the open term
as `Hom(single(F_U), Ω_X^•[q])`, identifies it with de Rham cohomology of `V` in degree
`q` for the
open immersion `j : V → X` with image `U`, and uses precomposition with
`single(F_{U→X})` for restriction. Its connecting map is precomposition
with the shifted `ShortComplex.ShortExact.singleδ` of
`F_U → F_X → (support constant sheaf)`; it raises degree by one
(GK02 §1, 1.15, p. 11). The exactness assertions use this ambient derived-Hom
carrier, so the open comparison cannot change the restriction map.
**Checks:** for `U = X` the restriction is the identity;
for `U = ∅` the restriction is zero.
The connecting
arrow of the zero map on two inputs is `−a−b`, fixing Mathlib's cone sign.

**Checks.** The de Rham complex of the point has zero positive terms;
that of the empty space is zero; the disc has nonzero one-forms.
`F_∅` is zero, `F_X` is constant of rank one, and
`F_U` has zero sections on an open disjoint from its support.
Empty support gives zero, both for the support constant sheaf and for cohomology with
support; full support gives ordinary
cohomology; a point gives a nonzero degree-zero
group.

For a finite normed field extension `L/K`, scalar extension of `Sp A` is identified
with `Sp(L ⊗_K A)`, and every map is fixed by
`l ⊗ a ↦ l ⊗ φ(a)`. The cohomology comparison is *dagger-de-rham-finite-field-extension*.

**Checks.** Base change gives the new ground-field point from the point;
it preserves the empty space; it gives the
one-variable dagger algebra over the new field from the disc.

### F1.16 compact supports, logarithmic forms and formal tubes

The rigid de Rham complex has exterior powers of continuous differentials on rigid
affinoid charts; its differential sends `a db₁ ∧ … ∧ db_q` to
`da ∧ db₁ ∧ … ∧ db_q`. Rigid cohomology with support (in the sense of this subsection) is
derived Hom from the cokernel of the
free constant sheaf on an open into the free constant sheaf on the whole space.
Thus the open argument denotes the complement of the support.

**Checks.** The rigid de Rham complex distinguishes a point, the empty space, and nonzero
one-forms on a disc. Rigid cohomology with support vanishes for the empty space and for the
zero sheaf, and is nonzero in degree zero for a point. De Rham cohomology of the point is `K`
in degree
zero, and that of the empty space vanishes. On the closed rigid unit disc over `K = ℚ_p`,
`ω = (Σ_{r≥1} p^r T^{p^r−1}) dT` gives a nonzero class in `H^1_dR`: its coefficients tend to zero,
but every formal primitive is `c + Σ_{r≥1} T^{p^r}`, whose coefficients do not tend to zero,
so no primitive belongs to `ℚ_p⟨T⟩`. The closed dagger disc has `H^1_dR = 0`, as in F1.9
(*dagger-polyannulus-de-rham-cohomology*). The map from cohomology with support to ordinary
cohomology is bijective for full support, zero for empty support, and
nonzero in degree zero for a point.

For a fringe presentation `P` and radius `ρ`, the fringe affinoid retains the
quotient ring `A_ρ` of the stage with its quotient Gauss topology. The fringe inclusion
is induced by `A_ρ → A → Â`, and the fringe exterior is its image complement.
Compact support with coefficients applies rigid cohomology with support to a sheaf
concentrated in degree zero;
compactly supported de Rham cohomology applies it to the rigid de Rham complex. For a descended
finite module `N`, its coefficient sheaf is the rigid associated sheaf of `N`, whose sections on
an affinoid subdomain with ring `B` are `B ⊗ N`; these identifications are fixed
simultaneously by the usual restriction maps.

**Checks.** For the fringe affinoid, the fringe inclusion and the fringe exterior, three triples
of Checks compute a point, the zero ring, and a larger disc with
nonempty exterior. The rigid associated sheaf of the zero module is zero, its global sections
recover the module, and it has zero sections on the empty space. Compact support with
coefficients vanishes for the zero sheaf and for the empty space, whereas for the point it is
`K` in degree
zero. Compactly supported de Rham cohomology vanishes for the empty space, is
concentrated in degree zero for a point, and for the disc is `K` in degree two
and zero in degrees zero and one.

The local logarithmic module lies inside the localization of `Ω_A` at the product of the
boundary parameters. It is generated by regular forms and `dtᵢ/tᵢ`.
The logarithmic de Rham complex has the exterior powers of this module on normal crossings
charts, with the ordinary differential after localization; `Ω¹(log D)` is its
term of degree one, and logarithmic de Rham cohomology is the resulting hypercohomology.
The compact logarithmic complex uses the boundary ideal times each term, and
its hypercohomology is `H_dR(X, D)_!` of *compact-support-log-complex*. The chart condition
requires each
boundary parameter to be prime or a unit in every local ring; replacing two
branches by their product does not satisfy that condition.

**Checks.** The local logarithmic module recovers regular forms for empty boundary, is the free
module generated by `dT/T` on the disc with boundary the origin, and excludes `dT/T²`. The
corresponding Checks for the whole logarithmic complex and for its degree-one term treat the empty
boundary, the point and the disc. Logarithmic cohomology recovers ordinary cohomology for empty
boundary,
computes the field for the point, and gives dimension
`choose r q` in degree `q` for the polydisc with `r` boundary coordinates. Six Checks for the
compact logarithmic complex and its cohomology, for empty boundary, the point and the disc, recover
the empty-boundary complex, the point, and the acyclic disc with its origin as
boundary. The localization statement for the compact logarithmic complex is the short exact
sequence of complexes and the induced long exact sequence of these groups.
Its maps `α` and `β` are postcomposition with `Q(a)[q]` and `Q(b)[q]`,
where `Q` extends to integer degrees and localizes at quasi-isomorphisms.
The third group is computed on `X` using the pushed-forward complex and
identified with `H^q_dR(Z, E)_!`; exactness is stated on that ambient
carrier. The connecting map is postcomposition with
`DerivedCategory.triangleOfSESδ` for the same short exact sequence, shifted
by `q` and identified with degree `q+1`. The local kernel computation is the
boundary-vanishing version of Stacks Tag 0FMU, proof of Lemma 50.15.2.
**Check:** for a split sequence the maps are inclusion
into the first summand and projection onto the second in degrees zero and
one, with zero connecting map.

A strictly semistable formal model requires admissibility and affine charts
étale modulo every power of the uniformiser over
`O[X₁,…,X_n]/(X₁⋯X_r − π)`, with `1 ≤ r ≤ n`.
Its generic fibre is specified by the completed affine coordinate rings
as localizations at `π`, their neighbourhood basis from powers of `π`, and
specialization by the condition that a section has value strictly less than
one. Thus the component-intersection tubes in Theorem C (*dagger-semistable-tube-invariance*)
and in *dagger-semistable-tube-finiteness* are inverse images under this specialization
map, with their actual open immersions into the dagger generic fibre.

**Checks.** The empty model is strictly semistable,
the trait is strictly semistable, and
a model with a nonzero section killed by `π` is excluded.
The empty model has no generic points, a nonempty fibre where `π` maps to zero is
excluded, and the generic fibre of an affine formal model is affinoid.

### Examples

The worked examples of this layer are the checks above together with the following.

On the algebra and space side, the checks of F1.1–F1.7 carry the layer's running examples: the
geometric series and its lacunary non-member in `W_1` against the Tate algebra `T_1`; the Laurent,
polynomial and integral dagger algebras and the complete affinoid algebra that is not one; fringe
presentations and the fringe topology of `W_n`, of a field and of the annulus, with their dependence
on the presentation and their completions; the dagger tensor product against the naive one; rational
localisation to the annulus, whose completion is the Tau Ceti rational localisation of
`(K⟨X⟩, K°⟨X⟩)`; the integral Monsky–Washnitzer algebra and the weak completions of the Laurent ring
and of finite algebras, whose generic fibre is `W_n ⊆ T_n` (Tau Ceti's
`restrictedMvPowerSeriesCompletion n K`); algebras of MW-type with `Ω^1` finite projective and the
non-regular non-example; Weierstrass and rational subdomains whose points are the classical points
of a Tau Ceti rational subset, and the open disc that is not a subdomain; the dagger disc and point
with `O†` not the full sheaf; skyscraper, zero and non-coherent modules; strict neighbourhoods of
discs and the cofinal fringe system; and the open disc as a Stein space against the closed disc,
which is not partially proper.

On the comparison and de Rham side: the closed dagger disc `D` against the rigid disc `D'` — equal
points, G-topology and stalks, `K⟨X⟩† ⊊ K⟨X⟩` on global sections, the automorphism `X ↦ X + a`
that does not preserve `O†`, and, over `K = ℚ_p`, `H^1_dR(D) = 0` against infinite-dimensional
`H^1_dR(D')`; over `K = ℚ((t))` with the `t`-adic absolute value both first cohomology groups
vanish by coefficientwise integration; `(A^1)^†` with
entire functions as global sections and `(P^1)^†` with GAGA; `Ω^1` of the annulus free on `dX`, the
series `exp(λ_iX)` showing Mathlib's Kähler differentials of `W_1` are not finite; de Rham cohomology
of dagger polyannuli with basis the `dlog` forms; supports and compact supports of the closed disc
(`K` in degree 2) and the residue pairing on `K⟨T⟩†`; Serre and Poincaré duality on the disc and the
annulus; the Kummer covering `z ↦ z^N` of the annulus; the semistable annulus
`Spf(R⟨X_1, X_2⟩/(X_1X_2 − π))` for Theorem C and the finiteness theorem; `h^dR_1 = 2` for the
affine elliptic
curve `Y^2 = X^3 + X`; the axes, cusp, three lines and nodal cubic in the bidisc; the log complex of
the polydisc along the coordinate hyperplanes and the residue on the disc; and `(P^1)^†` with
`D = {0, ∞}`, whose cohomology `H_dR(X, D)_!` is `(0, K, K)`, with its localisation sequence.

Further examples recorded at the targets: the mixed-dimensional `Sp K ⨿ Sp W_1`, smooth but not of
pure dimension, and the disjoint union `⨿_{n≥0} Sp W_n`, whose ordinary de Rham cohomology is a
product and whose compactly supported cohomology is a direct sum; the unscaled relation
`X − π^{-1}`, a unit of `W_1`, against the rescaled `Y − 1` and `X − a` with `|a| ≤ 1`, and the
non-monogenic `K[ε, δ]/(ε, δ)²`, reached from `K` in two steps; the delta module
`M = W_1[x^{-1}]/W_1 ≅ D/Dx` at the origin, whose unshifted de Rham complex `M → M dx` has zero
kernel and cokernel `K·[dx/x]` in degree `1`, so that `DR(RΓ*_0 O) ≃ DR(M)[−1]` carries the class
of `dx/x` in degree `2`; the trace `H^2_dR(ℙ¹) → K` normalised by the residue; the closed disc with
`D = ∅`, whose `H_dR(X, D)_! = (K, 0, 0)` is not its compactly supported cohomology `(0, 0, K)`;
and `ℙ¹` with one boundary point of residue degree `2`, where `H^1_dR(X, D)_!` has dimension `1`
because boundary points count with their residue degrees.

### Dependencies

Layers R0–R1 of AdicSpacesPartII, R2–R3 of AdicSpacesPartIII and R4 of this roadmap: from
AdicSpacesPartII R0 the completed tensor product *completed-tensor-product*, fibre
products *fibre-products-existence*, the supremum seminorm and power-bounded elements of affinoid
algebras (*affinoid-supremum-seminorm*, *affinoid-maximum-modulus*,
*affinoid-power-bounded-iff-sup*,
*reduced-affinoid-supremum-norm*, *affinoid-reduction-finite*), separated, partially proper and
smooth morphisms (*separated-morphism*, *partially-proper-morphism*, *smooth-morphism*,
*smooth-local-structure*) and continuous differentials *continuous-differentials*; from AdicSpacesPartII R1 rigid
spaces, affinoid subdomains, Gerritzen–Grauert, analytification, Huber's functor `r_K` and the rigid
identity principle (*rigid-analytic-space*, *affinoid-subdomain*, *gerritzen-grauert*,
*rigid-analytification*, *rigid-adic-comparison-functor*, *proper-separated-comparisons*,
*rigid-identity-principle*); from AdicSpacesPartIII R2
admissible formal schemes, the generic fibre, the specialisation map and admissible blow-ups
(*admissible-formal-scheme*, *generic-fibre-functor-d*, *specialisation-map*, *admissible-blow-up*);
from AdicSpacesPartIII R3 coherent sheaves, Kiehl's theorems, quasi-Stein spaces, the sheaf of
continuous differentials, proper GAGA and traces (*coherent-sheaf*, *tate-kiehl-affinoid*,
*quasi-stein-theorems-a-b*, *sheaf-of-continuous-differentials*, *proper-gaga*); from R4 smooth
pairs *smooth-pair*; from PerfectoidSpaces P3.1 Elkik's approximation theorem, used by
*elkik-lifting-algebraisation*; from
SchemeAndStackFoundations layer SF.4 de Jong's strictly semistable alteration theorem
(*semistable-alteration-theorem*) and from layer SF.0 excellent rings (*excellent-ring*,
*regular-map-completion*). The rigid-cohomology roadmap is a consumer and compatibility reference
only (strict neighbourhoods of tubes in frames, the compact-support complex of affine space, the
MW-type trace, finiteness of rigid cohomology). Mathlib supplies `MvPowerSeries.IsRestricted`,
`Module.Finite`, `Module.Projective`, `Module.Free`, `KaehlerDifferential`, `KaehlerDifferential.D`,
`Derivation`, `ExteriorAlgebra.exteriorPower`, `CochainComplex`, `Algebra.trace`, `IsRegularRing`,
`IsNoetherianRing`, `Algebra.FormallySmooth`, `AlgebraicGeometry.Scheme`. Tau Ceti supplies
`LinearMap.isStrictMap_of_module_finite`, `restrictedMvPowerSeriesCompletion`, the rational
localisation and rational subsets of `(K⟨X⟩, K°⟨X⟩)`. Huber96 5.6 supplies the compactly supported
direct image, defined here in *dagger-d-module-direct-image*. The Runge factorisation of locally
closed immersions (BGR 7.3.5/1) is this layer's own target *rigid-locally-closed-immersion-runge*
(F1.6), proved as in BGR §7.3 from AdicSpacesPartII R1's affinoid subdomains;
*dagger-affinoid-subdomain-completion* uses it.

Two inputs are explicit hypotheses of the statements that use them rather than dependencies:
(MWF), the finiteness of Monsky–Washnitzer cohomology of smooth affine schemes over the residue
fields (proved in Berthelot97 and Mebkhout97 by methods this roadmap does not build), and (RES),
embedded resolution of rigid spaces (BM97 Thm. 1.10, as applied in GK02 Lem. 0.1), both stated at
the head of F1.11. The finiteness chain is (MWF) → *dagger-semistable-tube-finiteness* →
*quasi-algebraic-affinoid-finiteness*, which also uses (RES) → Theorem A
(*dagger-de-rham-finiteness-and-base-change*, through *dagger-resolution-lemma* and the
algebraisation of smooth affinoids) → *dagger-de-rham-kunneth* and the finite-dimensional
dualities (*dagger-strict-differentials* and *dagger-poincare-duality* for affinoids). (RES) is
also a hypothesis of the arbitrary-support case of *dagger-local-cohomology-comparison* (F1.10),
of *dagger-proper-modification-sequence*, and of the statements of F1.11 that depend on them; the
calculation for smooth supports is unconditional.

## Downstream consumers

PerfectoidSpaces P3.19 uses *stable-basis-etale-vector-bundles*, P6 uses R5.4, and P7 uses the
sites and tilde-limit results of R4 and R5, including *tilde-limits-affinoid-criterion* (in P7.1)
and *tilde-limit-base-change*. PerfectoidTowers P9 uses the sites, sousperfectoid products,
profinite flat modules and mixed completed tensor products of R4 and R5 (`Huber.IsProfiniteFlat`,
`Huber.mixedTensorInt`), and conditions its conclusion on the coefficient Kiehl comparison
(*coefficient-sheaf-kiehl*). AdicEtaleGeometry's sousperfectoid hypotheses cite R5's ring theory
and R4's site applications by target.
The étale-cohomology, Shimura-variety, rigid-cohomology and `p`-adic Hodge theory roadmaps
use R4's sites, R5's sousperfectoid spaces and coefficient sheaves, and F1's dagger spaces
and overconvergent de Rham complexes. A proof of (MWF) in the rigid-cohomology roadmap that does
not use F1.11 discharges the hypothesis of F1.11's finiteness statements.

On a reduced rational localization, Tau Ceti's actual `completedPlusSubring` is the
power-bounded subring. On the coefficient sections of the Laurent covering, approximation holds on
finitely many pseudobasis coordinates. The supremum-norm obstruction is an estimate on coefficient
arrays: the diagonal coefficient array for `∑ uⁿTⁿ` has distance at least one from every source
array satisfying the uniform coefficient bound. Transported to the actual coefficient section
rings, this array calculation proves that restriction from the outer annulus to its inner boundary
is not Banach-dense for `ℤ_p[[T]]`.

For a smooth affinoid dagger space, the invariant `h^q_dR` is the common dimension of its supported
de Rham groups over closed polydisc embeddings; it is computed using any smooth affinoid ambient
space of dimension `n` and the shift `2n − q`. Over a complete discretely valued
mixed-characteristic field it is one in degree zero for the point, zero in every degree for the
empty space, and for the disc one in degree two and zero otherwise.

Compact support with coefficients does not depend on the finite fringe model: two models whose
scalar extensions define isomorphic dagger modules give isomorphic groups. The long exact support
sequence uses the quotient map of constant sheaves and restriction along the complementary open;
it applies to coherent compact support and to the rigid de Rham complex.

Local equations fix the differentials of the logarithmic complex and of the compact logarithmic
complex on wedges of exact forms and logarithmic coordinate forms. The compact one differentiates
the boundary product as well as the coefficient, so its connection contains the term
`d(t₁⋯tᵣ)`.

## References

- [EGA IV₂] Alexander Grothendieck, *Éléments de géométrie algébrique IV, seconde partie*, Publ. Math. IHÉS 24 (1965), 5–231; Proposition 5.6.1, pp. 97–98, and Example 5.6.11, pp. 101–102. http://www.numdam.org/item?id=PMIHES_1965__24__5_0
- [Huber94] Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551. https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217
- [Huber96] Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996 (not freely available). https://link.springer.com/book/10.1007/978-3-663-09991-8
- [Wedhorn] Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (14 Oct 2019). https://arxiv.org/abs/1910.05934v1
- [KL15] Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (9 May 2015). https://arxiv.org/abs/1301.0792
- [Berkeley] Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020). https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
- [HK] David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, version dated August 6, 2026. https://kskedlaya.org/papers/criteria.pdf
- [Stacks] The Stacks Project Authors, *The Stacks Project*, cited by tag. https://stacks.math.columbia.edu
- [CHJ] Przemyslaw Chojecki, David Hansen, Christian Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2 (22 Aug 2016), published in Documenta Math. 22 (2017); printed page numbers of the arXiv PDF. https://arxiv.org/abs/1507.04875
- [Scholze13] Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (3 Nov 2012) (Forum Math. Pi 1 (2013)). https://arxiv.org/abs/1205.3463
- [BHW] Christopher Birkbeck, Ben Heuer, Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Annales de l'Institut Fourier 2023. https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf
- [DLLZ-A] Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2 (30 Oct 2022); PDF page = printed page. https://arxiv.org/abs/1912.09836
- [Conrad-MR] Brian Conrad, *Modular curves and rigid-analytic spaces*, Theorem 3.1.5, pp. 16–17. https://math.stanford.edu/~conrad/papers/genpaper.pdf
- [Conrad-AWS] Brian Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 notes, Definition 2.1.2, p. 9, and Exercise 2.4.8, pp. 21–22.
- [Conrad-RA] Brian Conrad, *Relative ampleness in rigid geometry*, Remark A.1.1, pp. 38–39, including the higher-direct-image comparison (A.1.1). https://math.stanford.edu/~conrad/papers/amplepaperfinal.pdf
- [Bosch-Lectures] Siegfried Bosch, *Lectures on Formal and Rigid Geometry*, Münster preprint, §2.6, Propositions 4, 6–7, pp. 147–150. https://www.uni-muenster.de/IVV5WS/WebHop/user/weckerm/heft378.pdf
- [BL I] Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry I. Rigid spaces*, Math. Ann. 295 (1993), 291–317, Proposition 2.1, p. 299. https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295
- [Kiehl-AB] Reinhardt Kiehl, *Theorem A und Theorem B in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967), 256–273. https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002
- [Kiehl67] Reinhardt Kiehl, *Die de Rham Kohomologie algebraischer Mannigfaltigkeiten über einem bewerteten Körper*, Publ. Math. IHÉS 33 (1967), 5–20. http://www.numdam.org/item/PMIHES_1967__33__5_0/
- [Deligne71] Pierre Deligne, *Théorie de Hodge, II*, Publ. Math. IHÉS 40 (1971), 5–57. http://www.numdam.org/item/PMIHES_1971__40__5_0/
- [Conrad-IC] Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf. https://math.stanford.edu/~conrad/papers/irredpaper.pdf
- [GK00] Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (14 Aug 2014), author's version of J. reine angew. Math. 519 (2000) 73–95, with a footnote to Lemma 4.7 correcting the published hypotheses. https://arxiv.org/abs/1408.3329
- [Kedlaya06] Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006) 15–97), with the author's errata file https://kskedlaya.org/papers/finiteness-errata.txt. https://arxiv.org/abs/math/0208027
- [GK02] Elmar Grosse-Klönne, *Finiteness of de Rham cohomology in rigid analysis*, arXiv:1408.3327v1 (author's version of Duke Math. J. 113 (2002)). https://arxiv.org/abs/1408.3327
- [Scholze-Err] Peter Scholze, *Erratum to 'p-adic Hodge theory for rigid-analytic varieties'*, three-page author erratum. https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf
- [DLLZ-RH] Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic Riemann-Hilbert correspondences for rigid varieties*, arXiv:1803.05786v4 (30 Oct 2022), J. Amer. Math. Soc. 36 (2023); PDF page = printed page. https://arxiv.org/abs/1803.05786
- [ECD] Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 Apr 2026); locators give the printed page numbers of the arXiv PDF. https://arxiv.org/abs/1709.07343
- [GK05] Elmar Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel'd's symmetric space*, arXiv:1408.3346v1 (J. Algebraic Geom. 14 (2005) 391–437). https://arxiv.org/abs/1408.3346
- [Vezzani] Alberto Vezzani, *The Monsky–Washnitzer and the overconvergent realizations*, arXiv:1509.01718v2 (Int. Math. Res. Not. IMRN 2018). https://arxiv.org/abs/1509.01718
- [Kedlaya01] Kiran S. Kedlaya, *Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology*, arXiv:math/0105031v2 (J. Ramanujan Math. Soc. 16 (2001) 323–338). https://arxiv.org/abs/math/0105031
- [MW68] Paul Monsky, Gerard Washnitzer, *Formal cohomology: I*, Ann. of Math. (2) 88 (1968), 181–217.
- [vdP] Marius van der Put, *The cohomology of Monsky and Washnitzer*, Mém. Soc. Math. France (N.S.) 23 (1986) 33–59; Numdam edition. http://www.numdam.org/item/MSMF_1986_2_23__33_0/
- [de Jong] A. J. de Jong, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93. http://www.numdam.org/item/PMIHES_1996__83__51_0/
- [Scholze–Weinstein 2013] P. Scholze, J. Weinstein, *Moduli of p-divisible groups*, Camb. J. Math. 1 (2013), 145–237; arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357
- [RZ] Luis Ribes, Pavel Zalesskii, *Profinite Groups*, 2nd ed., Ergebnisse der Mathematik (3) 40, Springer 2010.
- [BGR] S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren der mathematischen Wissenschaften 261, Springer 1984.
- [Berthelot97] Pierre Berthelot, *Finitude et pureté cohomologique en cohomologie rigide*, Invent. Math. 128 (1997), 329–377.
- [Mebkhout97] Zoghman Mebkhout, *Sur le théorème de finitude de la cohomologie p-adique d'une variété affine non singulière*, Amer. J. Math. 119 (1997), 1027–1081.
- [BM97] Edward Bierstone, Pierre D. Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*, Invent. Math. 128 (1997), 207–302.
- [Elkik] Renée Elkik, *Solutions d'équations à coefficients dans un anneau hensélien*, Ann. Sci. ÉNS (4) 6 (1973), 553–603. https://www.numdam.org/item/ASENS_1973_4_6_4_553_0/
- [dJvP] A. J. de Jong, M. van der Put, *Étale cohomology of rigid analytic spaces*, Doc. Math. 1 (1996), 1–56.
- [de Jong95] A. J. de Jong, *Crystalline Dieudonné module theory via formal and rigid geometry*, Publ. Math. IHÉS 82 (1995), 5–96. http://www.numdam.org/item/PMIHES_1995__82__5_0/
- [EGA IV₄] Alexander Grothendieck, *Éléments de géométrie algébrique IV, quatrième partie*, Publ. Math. IHÉS 32 (1967). http://www.numdam.org/item?id=PMIHES_1967__32__5_0
- [Liu] Qing Liu, *Un contre-exemple au « critère cohomologique d'affinoïdicité »*, C. R. Acad. Sci. Paris Sér. I 307 (1988) 83–86 (cited through Conrad-MR as [Liu]).
