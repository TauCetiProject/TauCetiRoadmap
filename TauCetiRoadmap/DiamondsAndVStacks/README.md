# Roadmap: diamonds and v-stacks

**Summary.** Diamonds let perfectoid covers be used to study spaces that are not themselves
perfectoid. This roadmap builds their foundations on Tau Ceti's perfectoid spaces and
AdicSpacesPartII's spectral and topos foundations: spectral quotients, bounded pro-objects,
cohomology of coherent topoi, size bounds and the v-site forms of stacks and site cohomology (D0);
the totally and strictly totally disconnected perfectoid spaces, w-localisation and the universally
open strictly totally disconnected cover (D1); the pro-étale and v-topologies with descent and
acyclicity of `O` and `O⁺` (D2); effective descent and the classes of morphisms of v-stacks (D3);
diamonds, small v-sheaves and small v-stacks with their underlying spaces and proper maps (D4);
spatial v-sheaves and diamonds, limits, presentations, relative representability and the Berkovich
(maximal Hausdorff) quotient (D5); and the diamondification `Y ↦ Y^◇` of analytic and integral
pre-adic spaces (D6). The end results are the étale-site identification `Y_ét ≃ Y^◇_ét` for an
analytic adic space `Y` over `Spa ℤ_p` ([ECD] Theorem 1.5), the descent theorem `H⁰_v(X, O) = R`,
`H^{>0}_v(X, O) = 0` on affinoid perfectoid `X = Spa(R, R⁺)` with the subcanonicity of the v-site
([ECD] Theorem 1.2), and full faithfulness of diamondification on seminormal rigid spaces over a
fixed field. They feed the étale cohomology of diamonds and the six operations.

In more detail, this roadmap constructs the ordinary sheaf and groupoid-valued stack foundations,
develops spatial geometry, and relates analytic and integral pre-adic spaces to v-sheaves. From the
spectral topology, pro-categories and ordinary coherent topoi it builds the disconnected perfectoid
covers (totally and strictly totally disconnected spaces, w-localisation, the universally open
strictly totally disconnected cover of an affinoid perfectoid space), the pro-étale and v-topologies
with their descent and acyclicity theorems, effective descent for the morphism classes used in the
quotient presentations, diamonds and small v-stacks with an atlas-independent underlying space and
proper maps, spatial v-sheaves and spatial diamonds with their limits, presentations, relative
representability and Hausdorff reduction, and finally the diamondification `X ↦ X^◇` of analytic and
integral pre-adic spaces with the identification of étale sites

```text
X_ét ≃ X^◇_ét      (X an analytic adic space over Spa ℤ_p),
```

and the full faithfulness of diamondification on seminormal rigid spaces over a fixed field. These
are the geometric inputs for the étale cohomology of diamonds, the six operations, and the diamond
descriptions of period spaces and Shimura varieties.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| D0 | Spectral geometry, size bounds, ordinary coherent sites and stacks | spectral quotients and submersions; Hochster realisation; bounded pro-objects; cohomology of algebraic and coherent topoi; cutoff cardinals; the v-site forms of stackification, 2-fibre products and quotient stacks |
| D1 | Disconnected perfectoid covers | Fargues' criterion, affinoidness, w-localisation, universally open strictly totally disconnected covers, topological classification and integral flatness |
| D2 | Pro-étale and v-sites | small sheaves, subcanonicity, descent and acyclicity of functions, vector bundles |
| D3 | Effective descent and morphisms of stacks | affinoid and separated pro-étale descent, étale and quasi-pro-étale classes, immersions, separatedness by a closed-immersion diagonal, torsors |
| D4 | Quotients and underlying spaces | diamonds, small v-sheaves and v-stacks, geometric point criteria, topological quotients, proper maps |
| D5 | Spatial geometry | spatial v-sheaves and diamonds, permanence and limits, universally open presentations, relative representability, Berkovich spectra and Hausdorff reduction |
| D6 | Diamondification | analytic diamonds and their étale sites; integral pre-adic v-sheaves, their smallness, and seminormal rigid full faithfulness |

The four foundation strands of D0 (spectral topology, quotients and limits, ordinary sites and
cohomology, size bounds and stacks) can be developed separately; their interfaces meet before the
geometric descent arguments of D1–D3 use them.

## Scope and ownership

The roadmap owns, layer by layer:

- D0: local spectrality of perfectoid spaces, the Hochster dual and the profinite space of
  connected components; quotients by pro-constructible equivalence relations, spectral submersions
  and their limits, bounded pro-objects, ordinal assembly of cofiltered limits, Hochster
  realisation, and Hausdorff quotients of profinite sets by closed equivalence relations;
  filtered-colimit cohomology on qcqs objects of algebraic topoi, flasque constant sheaves on
  irreducible spaces, cohomology of limits of coherent topoi and ordinary sheaves on profinite
  sets; cutoff cardinals and the cardinality of a completion with a bounded dense subset, whose
  bound is PerfectoidSpaces' `completion_cardinality_bound`; the v-site specialisations of
  stackification, 2-fibre products and quotient stacks, whose generic constructions on an
  arbitrary site are SchemeAndStackFoundations §§1.18 and 1.21. AdicSpacesPartII R0.0 and
  R0.19.1–R0.19.10 supply the generic locally spectral, constructible, limit, pro-category and
  topos APIs used here. The roadmap extends Mathlib's `SpectralSpace`, `IsSpectralMap` and Tau
  Ceti's `IsProConstructible` without competing versions of these predicates.
- D1: totally disconnected and strictly totally disconnected perfectoid spaces, Fargues'
  characterisation of spectral spaces all of whose open covers split, connected components and
  affinoidness, pro-constructible generalising subsets, automatic flatness over a totally
  disconnected base, w-local and w-strictly local perfectoid spaces, the w-localisation functor and
  its pro-étale presentation, the universally open affinoid pro-étale strictly totally disconnected
  cover, and the classification of perfectoid spaces pro-étale over a strictly totally disconnected
  base by spectral data.
- D2: the big and small pro-étale sites and the v-site, cutoff independence and small sheaves,
  algebraicity of the categories of small sheaves, the comparison of pro-étale and étale sites with
  the structure sheaves, subcanonicity of the pro-étale and v-sites, `O` and `O⁺` as v-sheaves,
  higher v-acyclicity and almost acyclicity on affinoid perfectoid spaces, pro-étale and v vector
  bundles (the pro-étale and v steps of the comparison).
- D3: the prestacks of perfectoid spaces over a base and full faithfulness of v-descent for
  morphisms, effective v-descent for affinoid perfectoid spaces over a totally disconnected base and
  for separated pro-étale perfectoid spaces over a strictly totally disconnected base, separated
  étale and finite étale perfectoid spaces as v-stacks, étale, finite étale and quasi-pro-étale
  morphisms of pro-étale stacks with their comparison to the perfectoid notions, quasicompact
  injections, open and closed immersions, separated maps (by a closed-immersion diagonal) and
  `0`-truncated maps, v-local tests of these classes on the target, and the diamond-specific
  statements about torsors under a locally profinite group (representability and the pro-étale
  presentation).
- D4: diamonds and pro-étale equivalence relations, quotients and independence of the atlas, the
  quasi-pro-étale criterion, diamonds as v-sheaves, the underlying topological space and the
  open-subfunctor correspondence, compact Hausdorff spaces as diamonds, small v-sheaves and small
  v-stacks with their underlying spaces, fibre products and surjectivity, isomorphism and
  injectivity criteria on geometric points, small quotients of v-sheaves, and proper maps of
  v-stacks (D4.11).
- D5: spatial and locally spatial small v-sheaves, and spatial diamonds as the diamonds among them,
  quasicompact injections and finite étale maps into spatial objects, cofiltered limits of diamonds
  and small v-sheaves with finite-stage étale comparisons and explicit size bounds, the universally
  open strictly totally disconnected presentation of a spatial diamond, quasi-pro-étale maps into
  locally spatial diamonds, the two-out-of-three property, local structure of étale maps,
  localisation of a spatial diamond, locally closed generalising subdiamonds, profinite products and
  closed projection, spatial v-sheaves with enough quasi-pro-étale points, maps representable in
  (locally) spatial diamonds with their three descent statements, the Berkovich spectrum of a
  complete Tate ring and the maximal Hausdorff quotient of `Spa` and of a small v-sheaf, the
  representable map of a qcqs separated diamond to its maximal Hausdorff quotient, and
  components of restricted group quotients.
- D6: `Spd ℤ_p` and `Spd(A, A⁺)` by marked untilts, descent of marked untilts along a v-cover,
  `Spd(A, A⁺)` as a spatial diamond with `|Spd(A, A⁺)| = |Spa(A, A⁺)|`, gluing `Spd` along rational
  subsets and the diamond of an analytic adic space, the identification of étale sites, the integral
  pre-adic v-sheaf with its smallness, its Galois quotient and its topological comparison, the
  seminormal structure-sheaf comparison `O_X ≅ ν_*Ô_X`, and seminormal full faithfulness. Integral
  symmetric powers are outside this scope; smallness of analytic Tate-pair diamonds follows from the
  atlas in D6.3, and smallness of the integral `X^◇` is D6.6.

PerfectoidSpaces (imported) owns perfectoid Tate rings and spaces (`Perfd` and `Perf` as full
subcategories of Tau Ceti's `PreAdicSpace`, cut out by `isPerfectoidSpace`, which includes the sheaf
condition on the structure presheaf), tilting, marked untilts and their classification by primitive
Witt-vector elements (layer P1), rational-affinoid geometry, completed residue fields, completed
tensor products, integral elements and almost acyclicity (layer P2), almost purity and étale descent
of vector bundles (layer P3, with P3.19), morphisms, immersions, separatedness, valuative criteria
and completed base change (layer P4), the finite-stage étale comparison and the cardinal bounds of
limits (layer P5) and the pro-étale morphisms with their stability, affinoid pro-étale objects as
pro-objects, `κ`-small perfectoid spaces, products with profinite sets and bounded pro-objects
(layer P6); its layer P0 owns almost algebra, its ideals and almost descent, and its P7.11 uses the
same compact-open covering condition as the v-precoverage defined here (D2.2). D1 imports the
perfectoid pro-étale morphism calculus from P6; D2 constructs topologies on that category and does
not define the morphisms themselves. AdicEtaleGeometry owns the analytic/étale finite-projective
comparison and the adic étale calculus (layer A1, with the pro-étale site of an analytic adic space
in A1.12) — for locally noetherian adic spaces, [Huber96] Definition 1.6.5, p. 78, gives the
infinitesimal lifting definition with local finite presentation; Proposition 1.6.7(i), (ii), (iv),
(v), p. 79, gives open immersions, composition, base change and locality — and the finite étale
torsor towers, completed self-products and finite étale descent (A4.2–A4.5, A4.7). PerfectoidSpaces
P1.32 and P6.15–P6.17 supply perfectoid completion and the perfectoid torsor presentation; D6 uses
that presentation to prove the geometric quotient and comparison. PerfectoidSpaces layer P6 also
owns the product `X × S` of an affinoid perfectoid space with a profinite set (`prodProfinite`),
which D1, D3 and D4 use through the identification with `S̲ × X`. PerfectoidSpaces P7.16 supplies
the basis of affinoid perfectoid objects in the pro-étale site of a rigid space. PerfectoidTowers
P9.8 and P9.12 consume D2.9 and D6.9 for tower descent of vector bundles and functions over a
seminormal base.

SchemeAndStackFoundations owns the generic site constructions, implemented once on an arbitrary site
`(C, J)` from Mathlib's `Pseudofunctor.IsStack`, `CategoricalPullback` and `Sheaf.H`, with its fppf
stacks of schemes and the v-stacks here as two specialisations: stackification, the 2-Yoneda lemma
and 2-fibre products (§1.18), quotient stacks of groupoids (§1.21), higher direct images and the
Leray and Čech spectral sequences with Leray's acyclicity theorem (§§2.1–2.2), sheaf torsors and
their classes `NonabelianH1` (§2.3, with geometric torsors in §1.15), and Čech vanishing for flasque
sheaves together with filtered-colimit cohomology on coherent sites (§2.5). D0.18–D0.19, D0.25–D0.26
and D3.10 are their v-site specialisations and state the comparison with the generic carrier; this
roadmap builds no second stackification, torsor-class or spectral-sequence construction, and
D0.20–D0.21 use §2.5's flasque vanishing and §2.2's Leray sequence with the hypotheses stated there.
Separated algebraic stacks in that roadmap have proper diagonal (§1.20), a different condition from
the closed-immersion diagonal of D3.8. AdicSpacesPartII layer R0 supplies the affinoid and étale
calculus of Huber pairs with the Tate norm of a ring of definition; layer R1 supplies fixed-field
rigid spaces. AdicSpacesPartIII layer R2 treats formal schemes, generic fibres and Hasse domains;
and layer R3 supplies the Gel'fand spectrum of a Banach ring with Berkovich's formula for the
spectral seminorm; D5 defines normalized continuous seminorms and identifies them with the
normalized bounded spectrum for a Tate norm of radius `1/2`, then adds the quotient map from `Spa`
with its identification as the maximal Hausdorff quotient, and the extension from affinoids to small
v-sheaves. The flat-cover refinement over a strictly henselian local ring used in the perfectoid
ball argument is a lemma stated inside D3.2; D6.9 constructs the seminormalisation functor of rigid
spaces with its universal property and proves the seminormal structure-sheaf comparison.
ResolutionOfSingularitiesCharacteristicZero owns characteristic-zero resolution and its field,
formal and regular-morphism comparisons. D6.9 consumes its `resolution_affinoid`, `qeResolution`
and `qeResolution_regularFunctorial`; it owns the relative analytification and proper-surjective
comparison, smooth completed-function recovery and seminormal analytic compatible-section descent.
D6.9 is the single owner of the shared affine seminormality, subintegrality and seminormal-reflection API:
the square–cube criterion, normal-domain and product comparisons, and the seminormalization of
rings with its subintegral unit and restriction compatibility. Factorization-system applications
consume this predicate and reflection and own their factorization-specific characterizations and
consequences; alternative square–cube conventions use variable exchange, and alternative
presentations of the reflection are identified with each other, uniquely and compatibly with their
units, by `subintegral_lift` and `subintegral_bijective_of_seminormal`.

General canonical compactification (Scholze's §18) belongs to the étale cohomology of diamonds that
imports this roadmap; D3 proves only the elementary special construction needed for its descent
argument, D4.11 defines proper maps of v-stacks ([ECD] Definition 18.1) without it, and D5
establishes the early minimal-plus-ring extension used in its spatial reduction directly from its
earlier inputs. Ordinary profinite sheaves and ordinary ultrafilter stalks belong to D0.
The comparison of integral pre-adic diamondification with the
adic-coefficient functors of schemes and integral divisor geometry consume D6 and are not targets
here.

Tau Ceti already has, and this roadmap uses without restating: the pro-constructible calculus and
the spectrality of pro-constructible subspaces (`TauCeti.IsProConstructible`,
`TauCeti.IsProConstructible.spectralSpace`,
`TauCeti.IsSpectralMap.continuous_constructibleTopology`), the patch criterion for spectrality
(`TauCeti.spectralSpace_of_isClopen_generateFrom`), the spectrality of `Spv`, `Cont` and `Spa`
(`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; AdicSpaces layers 1–2), the
Huber pairs, rational subsets and adic structure presheaf of AdicSpaces layers 2–3, and the pre-adic
spaces `PreAdicSpace` with their underlying-space functor `PreAdicSpace.forgetToTop` and sheaf
condition `PreAdicSpace.isSheafy`. The targets of D0 on locally spectral spaces and maps and the
Hochster dual say in one clause how they extend Mathlib's `SpectralSpace`, `IsSpectralMap` and
`WithConstructibleTopology`.

The following results are supplied by the libraries or roadmaps in Exact supplier contracts:

- the quotient-map criterion for a continuous surjection from a quasicompact space onto a compact
  Hausdorff space ([ECD] Lem. 2.6) — Mathlib `Topology.IsQuotientMap.of_surjective_continuous`
  (compact source, Hausdorff target), equivalently `Continuous.isClosedMap` with
  `Topology.IsClosedMap.isQuotientMap`;
- the spectrality of the inclusion of an open subset of a spectral space exactly when the subset is
  quasicompact — Mathlib `IsRetrocompact_iff_isSpectralMap_subtypeVal` with
  `QuasiSeparatedSpace.isRetrocompact_iff_isCompact`;
- the profinite presentation of a compact Hausdorff space by the Stone–Čech compactification of its
  underlying discrete set, with its surjectivity, quotient-map and coequalizer properties and the
  closedness and total disconnectedness of the induced relation — Mathlib
  `CompHaus.projectivePresentation`, `CompHaus.epi_iff_surjective`, `CompHaus.effectiveEpi_tfae`,
  `isClosed_eq`;
- higher direct images, the Čech-to-derived and Leray spectral sequences, Leray's acyclicity theorem
  and the acyclic-basis comparison — SchemeAndStackFoundations §§2.1–2.2 (targets
  `cech_to_cohomology`, `leray_spectral_sequence` there);
- Čech vanishing for flasque sheaves — SchemeAndStackFoundations §2.5
  (`flasque_cech_vanishing`); acyclicity of a flasque sheaf of abelian groups on a space — Tau Ceti
  `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`;
- cohomology commuting with filtered colimits on a coherent site — SchemeAndStackFoundations §2.5
  (`cohomology_filtered_colimits`);
- sheaf torsors and their classes `NonabelianH1` on a site — SchemeAndStackFoundations §2.3, with
  geometric torsors over schemes in §1.15;
- stackification with its universal property, the 2-Yoneda lemma and 2-fibre products (§1.18), and
  quotient stacks of groupoid objects (§1.21), on an arbitrary site `(C, J)`, with the fppf stacks
  of schemes (`stackification`, `twoFiberProduct`, `quotientStack` and `actionQuotient` there) and
  the v-stacks of D0.25–D0.26 as specialisations — SchemeAndStackFoundations;
- representability of a presheaf — Mathlib `CategoryTheory.Functor.IsRepresentable`; a morphism
  property tested on base changes to representables, with its stability under base change and
  composition and its agreement with the absolute property on maps of representables — Mathlib
  `CategoryTheory.MorphismProperty.presheaf` (`MorphismProperty.relative` along `yoneda`) with
  `relative_isStableUnderBaseChange`, `isMultiplicative` and `relative_map_iff`;
- the presheaf `T̲ : X ↦ C(|X|, T)` of a topological space and its functoriality in `T` — Mathlib
  `ContinuousMap.yonedaPresheaf`, with its sheaf condition for singleton covers
  `equalizerCondition_yonedaPresheaf`;
- the product of an affinoid perfectoid space with a profinite set,
  `S̲ × Spa(R, R⁺) = Spa(C⁰(S, R), C⁰(S, R⁺))` — PerfectoidSpaces layer P6 (its targets
  `PerfectoidSpace.prodProfinite` and `PerfectoidSpace.globalSections`, with Check
  `prodProfinite_Zp_sections`);
- the Gel'fand spectrum of a Banach ring with its compactness, Hausdorffness and functoriality, and
  Berkovich's formula for the spectral seminorm — AdicSpacesPartIII layer R3
  (*gelfand-spectrum-banach-ring*);
- the universal Hausdorff quotient of a topological space — Mathlib `T2Quotient` with
  `T2Quotient.lift`;
- the existence of a height-one vertical generisation of every point of `Spa(A, A⁺)` for a Tate ring
  `A` — Tau Ceti `TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`
  with `TauCeti.ValuationSpectrum.isAnalyticPoint_of_isTateRing`;
- the orbit relation and orbit space of a group action — Mathlib `MulAction.orbitRel` and
  `MulAction.orbitRel.Quotient`;
- the basis of affinoid perfectoid objects of the pro-étale site of a rigid space — PerfectoidSpaces
  P7.16, with the pro-étale site of AdicEtaleGeometry A1.12; PerfectoidTowers' function descent
  `O_Y = (h_* O_{X_∞})^G` over a seminormal rigid base (P9.12, *function-descent-seminormal-base*)
  is the tower specialisation of the seminormal comparison of D6.9 and consumes it.

## Conventions

Fix a prime `p`. `Perfd` denotes perfectoid spaces of all characteristics; `Perf` is its
characteristic-`p` subcategory. D1–D3 use `Perfd` where appropriate. From D4 onwards diamonds and
v-stacks are on `Perf`. PerfectoidSpaces' `Perfd p` and `Perf p` are full subcategories of Tau
Ceti's `PreAdicSpace`; sheafiness of the structure presheaf is part of PerfectoidSpaces'
`isPerfectoidSpace`, so no separate subcategory of sheafy perfectoid spaces is introduced here. A
superscript `♯` denotes a marked untilt and `♭` its tilt. Marking includes the identification
`(X♯)♭ ≅ X`; all morphisms of marked untilts respect this identification. `PreAdic.Spd p R` is the
value of `PreAdic.geometricDiamond p` on the spectrum of a complete Huber pair `R : CAff`, including
its nonanalytic points. `Perf.Spd p R` is this same definition restricted by `[IsTateRing R.A]`;
`Perf.SpdZp p` evaluates it at `(ℤ_p, ℤ_p)`. The carriers are absolute; analytic comparisons in D6.4
additionally require a structural morphism to `Spa(ℤ_p, ℤ_p)`.

The size convention is cardinal cutoffs inside fixed ambient Lean universes. In `Suggested.lean` the
statements of D1–D2 are universe-polymorphic over PerfectoidSpaces' `Perfd.{u} p`, and `κ`-smallness
is PerfectoidSpaces' `IsKappaSmall`. The suggested carriers of the README-only targets of D1–D6 are
the following. `Geometry.Affinoid p c` has rings in `Type`, the ring universe of
AdicEtaleGeometry's `CAff`, and enters `PerfectoidSpace.Perfd.{1} p` through the universe lift
`Geometry.Affinoid.ulift`. `Geometry.HasAffinoidCharts p c` selects the objects of `Perfd.{1} p`
covered by open subspaces isomorphic to spectra of such lifts, and `Geometry.Spaces p c : Type 2` is
`ULiftHom.{2}` of this full subcategory. `ULiftHom` lifts morphisms to `Type 2` and leaves the
objects unchanged, so the size of the objects is fixed by the chart condition: points form a
`Type 1` set covered by opens with `Small.{0}` points and chart rings, `Type 1`-indexed disjoint
unions stay inside, and a perfectoid space in `Perfd.{1} p` with an affinoid ring that is not
`Small.{0}` is excluded (D1.11). For `κ : Cardinal.{1}`, `Geometry.Perfdκ p false κ` and
`Geometry.Perfdκ p true κ` are the full subcategories defined by `PerfectoidSpace.IsKappaSmall p κ`
after `Geometry.toPerfectoid`: the underlying points and every open affinoid chart ring have
cardinality below `κ` ([ECD] Definition 4.2, p. 20). `ULiftHom` changes no cardinal bound on these
objects. The big pro-étale and v-topologies restrict to these subcategories in D2.1–D2.2; D2.3 uses
`IsCutoffCardinal` from D0.23 for change of cutoff. The small pro-étale site `X_proét,κ` is the full
subcategory of pro-étale arrows to `X` whose sources satisfy the same bound, with `X` itself assumed
`κ`-small in the comparison theorem. `Geometry.VSheaf p = Sheaf (Geometry.vTopology p) (Type 2)` is
the ambient sheaf category. `Geometry.CutoffSheaves` selects sheaves recovered from some cutoff by
the pullback–restriction counit; this realizes the filtered union of cutoff sheaf categories in
D2.3, with `Type 2` coefficients throughout. The ambient site is small in universe 2; statements
excluding essential smallness refer to lower universes, as specified in D2.2. No universe lift
replaces a cutoff. Limits in D5.3 additionally require a presentation whose total arrow type is
`Small.{0}` in the ring universe of the charts. This condition is independent of a bound below
`κ : Cardinal.{1}`; the latter alone does not keep a geometric limit charted. “Small v-sheaf”
still means `Perf.IsSmallVSheaf`: an epimorphic cover by a sheaf represented by a perfectoid space ([ECD] Definition 12.1, p. 69). Taking values in `Type 2` alone
does not impose this condition. A v-sheaf is `κ`-small if it receives a surjection from a perfectoid
space that is `κ`-small in the sense of PerfectoidSpaces `IsKappaSmall`.

Geometric diamonds use the v-convention:
`Perf.Diamond (Geometry.vTopology p) (Geometry.proet p true)` is a predicate on `Geometry.VSheaf p`,
with presentations formed by v-sheafifying the presheaf quotient. The pro-étale definition in [ECD]
Definition 11.1 is equivalent by `Perf.Diamond.proEtale_quotient_comparison` (D4.4): the pro-étale
and v-sheafifications agree compatibly with their quotient maps. The pro-étale topology here is
`Perfd.proEtaleTopology (Geometry.space p true) (Geometry.proet p true)` on the same category
`Geometry.Perf p`.

"qc" means quasicompact, "qs" quasiseparated, and "qcqs" both. For ordinary sheaves the object and
morphism notions of D0 are used separately. For a map of stacks, qs requires a diagonal that is both
qc and qs, since that diagonal need not be injective. An object being qc does not automatically mean
that its map to the final object is qc. Topological surjectivity means surjectivity of the
underlying spaces; sheaf or stack surjectivity means local lifting on the relevant site. The
converse from the first to the second needs the stated qc hypothesis.

The notation `x ⤳ y` means that `y` is a specialisation of `x`. A generalising subset contains every
generalisation of its points. Localisation at `y` has the generalisations of `y` as its underlying
space. A continuous map of locally spectral spaces is compared through the local condition
`IsLocallySpectralMap` of AdicSpacesPartII R0.0, tested on pairs of spectral opens rather than by
imposing global compactness on the source; `IsSpectralMap` always means Mathlib's global condition
(preimages of quasicompact opens are quasicompact). A totally disconnected perfectoid space has
split open covers; its underlying topological space can have nontrivial specialisation chains.
Strict total disconnectedness requires split étale covers and algebraically closed component fields.

Étale and quasi-pro-étale maps of stacks include local separatedness ([ECD] Convention 10.2). Finite
étale maps are automatically separated. Fibre products of stacks are 2-fibre products, with an
isomorphism between the two images as part of each object. Quotient stacks retain automorphisms;
their sheaves of isomorphism classes are taken only after stackification. Perfectoid
representability is tested in the particular morphism definitions that require it, rather than
imposed on arbitrary diamond maps. Separated maps of v-stacks have closed-immersion diagonal (D3.8)
and proper maps are qc, separated and universally closed (D4.11); neither is the algebraic-stack
notion of SchemeAndStackFoundations §1.20.

Cohomology in D0 and in the Hausdorff comparison of D5 is ordinary abelian sheaf cohomology. `Hⁿ` is
Mathlib's Ext-based `Sheaf.H`; its Čech complexes, spectral sequences, Grothendieck abelian
categories and enough injectives are imported. Almost vanishing of integral structure sheaves is
distinct from actual vanishing, and is never upgraded to vanishing. The analytic étale-site
equivalence in D6 is an equivalence of the étale categories, while full faithfulness of
diamondification requires a seminormal rigid source over a fixed field.

Each target below is written with its hypotheses in the sentence, its source locator in parentheses
(short keys are resolved in the References), its API as named lemmas and its unit tests as `Checks`,
which specify both the expected behaviour and the cases a definition must distinguish. The suggested
geometric carriers `Geometry.VSheaf`, `Geometry.FieldPoint`, `Perf.SpdZp` and `Rigid.Space` are the
setting of the perfectoid and rigid Checks; they are specified in this README only. Existing
definitions retain their library namespaces. Subsections are numbered by layer and target (`D1.1`,
`D1.2`, …; the label `DM.N` is also cited as `M.N` or `§M.N`), and later targets, other roadmaps and
the docstrings of `Suggested.lean` refer to them by these numbers.

## Exact supplier contracts

The pinned-declaration table lists Mathlib and Tau Ceti declarations used by `Suggested.lean` or
cited by the targets. The sibling-interface table lists roadmap prototypes; importing their
`Suggested.lean` files supplies interfaces with suggested proofs. The remaining tables and
paragraphs record the full supplier contracts. Names attributed to PerfectoidSpaces,
AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIII, SchemeAndStackFoundations and
ResolutionOfSingularitiesCharacteristicZero are targets of those roadmaps under their suggested
names; and the names of this roadmap's own carriers and
theorems (`Geometry.*`, `Perf.*`, `Perfd.*`, `PreAdic.*`, `Rigid.*`, `Stack.*`, `Topos.*` and the
like) are suggested names for targets specified in this README only. The generic qcqs predicates and
their stability API use `TauCetiRoadmap.AdicSpacesPartII.Topos` (AdicSpacesPartII R0.19.10); local
`Topos.*` names specify the cohomology and torsor comparisons of D0.18 and D0.21.

### Pinned Mathlib/Tau Ceti declarations

| Object | Declaration at the pins | Layers |
| --- | --- | --- |
| Spectral spaces and maps | Mathlib `SpectralSpace`, `IsSpectralMap`, `QuasiSeparatedSpace`, `PrespectralSpace`, `GeneralizingMap` | D0–D1 |
| Sierpiński space | Mathlib `sierpinskiSpace` on `Prop`, open point `True` | D0–D1, D5 |
| Constructible topology | Mathlib `constructibleTopology`, `WithConstructibleTopology`, `compactSpace_withConstructibleTopology` | D0 |
| Pro-constructible sets | Tau Ceti `IsProConstructible`, `IsProConstructible.spectralSpace`, `IsProConstructible.isCompact`, `IsSpectralMap.continuous_constructibleTopology` | D0–D1 |
| Quotients and components | Mathlib `IsQuotientMap`, `Topology.IsQuotientMap.of_surjective_continuous`, `Continuous.isClosedMap`, `Quotient.compactSpace`, `ConnectedComponents.totallyDisconnectedSpace`, `T2Quotient`, `MulAction.orbitRel` | D0, D5 |
| Spectra, pro-objects, presentations | Mathlib `PrimeSpectrum`, `Ind`, `IsCofiltered.cofilteredClosure`, `CompHaus.projectivePresentation`, `Filter.Product` | D0 |
| Size | Mathlib `Cardinal.IsStrongLimit`, `Cardinal.beth` | D0–D2, D5–D6 |
| Sites and cohomology | Mathlib `Precoverage.toGrothendieck`, `GrothendieckTopology.Subcanonical`, `Presheaf.IsSheaf`, `Sheaf.H`, `constantSheaf`, `TopCat.Presheaf.IsFlasque`; Tau Ceti `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` | D0, D2 |
| Stacks and representability | Mathlib `Pseudofunctor.DescentData`, `Pseudofunctor.IsStack`, `CategoricalPullback`, `Functor.IsRepresentable`, `MorphismProperty.presheaf` | D0, D3–D5 |
| Covers and continuous maps | Mathlib `IsCompactOpenCovered`, `AlgebraicGeometry.QuasiCompactCover`, `ContinuousMap.yonedaPresheaf`, `equalizerCondition_yonedaPresheaf` | D2–D3 |
| Pre-adic spaces | Tau Ceti `PreAdicSpace`, `PreAdicSpace.isSheafy`, `PreAdicSpace.forgetToTop`, `presentationLimitPreAdicSpace`; Mathlib `PresheafedSpace.Γ` | D1–D2 |
| Huber pairs and `Spa` | Tau Ceti `Pair`, `IsTateRing`, `IsPseudoUniformizer`, `spa`, `ValuationSpectrum.comap`, `spectralSpace_spa_of_pairOfDefinition`, `spaCompletionHomeomorph`, `IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic` | D1, D5–D6 |
| Flatness and seminorms | Mathlib `RingHom.Flat`, `RingHom.FaithfullyFlat`, `Ideal.quotientMap`, `MulRingSeminorm`, `IsNonarchimedean` | D1, D5 |

### Sibling roadmap prototype interfaces

| Object | Supplier interface | Layers |
| --- | --- | --- |
| Size | PerfectoidSpaces `completion_cardinality_bound`, `IsKappaSmall`, `IsUniformlyKappaSmall`, `HasKappaSmallPresentation`, `ProKappa` | D0–D2, D5–D6 |
| Perfectoid spaces | PerfectoidSpaces `Perfd`, `Perf`, `InCharP`, `isPerfectoidSpace`, `isAffinoidPerfectoid`, `IsPerfectoidTateRing`, `hasPullbacks` | D1–D2 |
| Perfectoid fields in Checks | PerfectoidSpaces `padicCyclotomic`, `isPerfectoidField_padicCyclotomic`, `isPerfectoidField_of_isAlgClosed` | D1 |
| Gel'fand spectrum | AdicSpacesPartIII `Huber.GelfandSpectrum` | D5 |
| Adic étale morphism classes | AdicEtaleGeometry `AdicSpace.IsEtaleLocalDescription`, `AdicSpace.IsFiniteEtale` (declared in AdicEtaleGeometry's `Suggested.lean`) | D6 |

| Generic input | Supplier roadmap and section | Contract used here |
| --- | --- | --- |
| Locally spectral spaces and maps | AdicSpacesPartII R0.0 | `IsLocallySpectralSpace`, `IsLocallySpectralMap` and their spectral comparisons; D0.1 applies them to perfectoid spaces. |
| Constructible topology, pro-constructible subsets and closure | AdicSpacesPartII R0.19.1–R0.19.3 | Profiniteness, spectral images, the specialization-closure and generalizing-subset formulas. |
| Generalizing quotient maps | AdicSpacesPartII R0.19.4 | `isQuotientMap_of_generalizingMap`. |
| Spectral limits and finite-stage opens | AdicSpacesPartII R0.19.5–R0.19.8 | Spectrality and projections, detection of spectral and generalizing maps, Tate-pair spectra and finite-stage opens. |
| Generic pro-objects and spectral spaces | AdicSpacesPartII R0.19.9 | `TauCetiRoadmap.AdicSpacesPartII.Pro`, its Hom and limit APIs, and the finite-T₀ spectral equivalence. |
| Quasicompact and quasiseparated objects; algebraic topoi | AdicSpacesPartII R0.19.10 | `TauCetiRoadmap.AdicSpacesPartII.Topos.IsQuasicompact`, `IsQuasiseparated`, `Hom.IsQuasicompact`, `Hom.IsQuasiseparated` and `IsAlgebraic`, including their stability API. |

The geometric predicates of the README-only targets are specialisations of relative predicates on a
site, as follows; all names in the next two tables are suggested names. In `Suggested.lean`, total
disconnectedness is stated directly as `isTotallyDisconnected` (qcqs with `OpenCoversSplit`) on Tau
Ceti's `PreAdicSpace`.

| Geometric predicate (suggested) | Defining relative predicate (suggested) | Specialization |
| --- | --- | --- |
| `Geometry.totallyDisconnected`, `Geometry.strictlyDisconnected` | `IsTotallyDisconnectedPerfectoid`, `IsStrictlyTotallyDisconnected`, `coverSplits` | `Geometry.Spaces p c`, its valuation-space functor, and its open or étale covering topology; the coproduct index universe is 1. |
| `Geometry.sheafClosed`, `Geometry.separated`, `Geometry.locallySeparated`, `Geometry.quasiProEtale`, `Geometry.sheafEtale` | `Perfd.Stack.IsClosedImmersion`, `IsSeparated`, `IsLocallySeparated`, `IsQuasiProEtale`, `IsEtale` | `Geometry.vTopology p`, with the geometric open, closed, pro-étale and étale morphism classes and the Layer D1 covering topologies. |


The following local contracts supply the indicated Checks and specializations. Names are relative to
`TauCetiRoadmap.DiamondsAndVStacks`; Check labels locate anonymous examples. All are specified in
this README only, in the subsection given in the last column.

| Use | Local supplier (suggested) | Subsection |
|---|---|---|
| `inverse_patch_unchanged` | `Spectral.inverseTopology_constructible` | D0.5 |
| Continuous-map descent, including `J = Perfd.vTopology sp` | `underlineSheaf.isVSheaf`; covering sieves and point-surjective pullbacks (the perfectoid instance is the Lean theorem `isSheaf_yonedaPresheaf`) | D3.10 |
| `cutoff_zero` | `definition_IsCutoffCardinal_2` | D0.23 |
| `clopen_nonterminal_constant` | `definition_DisjointDescent_3` | D0.22 |
| `stalk_empty_factor` | `definition_UltrafilterStalk_2` | D0.22 |
| `zero_truncated_identity` | `definition_IsZeroTruncated_2` | D3.8 |
| `injection_discrete_iff` | `definition_IsInjection_1` | D3.8 |
| `wl_empty` | `definition_WLocalization_2` | D1.8 |
| `wl_map_swap` | `definition_map_1` | D1.8 |

The generic Check aliases below use the supplier's namespace and section.

| Use | Supplier roadmap and section | Supplier Check |
| --- | --- | --- |
| `s0_25_already_a_stack` | SchemeAndStackFoundations §1.18 | `Stack.stackification_of_isStack` |
| `s0_25_sheafification_agreement` | SchemeAndStackFoundations §1.18 | `Stack.stackificationDiscreteEquiv` |
| `s0_26_pair_groupoid`, `s0_26_trivial_groupoid` | SchemeAndStackFoundations §1.21 | the equivalence `R ≃ X ×_{[X/R]} X` of `Stack.quotient` |
| `disjoint_union_of_spectral_is_locally_spectral_not_spectral` | AdicSpacesPartII R0.0 | `definition_IsLocallySpectralSpace_1` (a Lean example) |
| `algebraic_discrete_infinite`, `algebraic_point`, `nonalgebraic_real_line` | AdicSpacesPartII R0.19.10 | `definition_IsAlgebraic_1`, `_2`, `_3` |
| `qc_identity_noncompact` | AdicSpacesPartII R0.19.10 | `Topos_Hom_IsQuasicompact_noncompact_identity` |
| `qc_empty` | AdicSpacesPartII R0.19.10 | `definition_IsQuasicompact_2` |
| `qs_identity` | AdicSpacesPartII R0.19.10 | `Topos_Hom_IsQuasiseparated_identity` |

### Local affine inputs

D6.9 owns the public ring theory used by its rigid constructions. The names below are in
`TauCetiRoadmap.DiamondsAndVStacks`, with `Affine.normal_finiteProduct` in its `Affine`
namespace. `IsSeminormalRing`, `IsSubintegral`, `subintegral_lift`,
`subintegral_bijective_of_seminormal` and `exists_seminormalization` have signatures in
`Suggested.lean`; the other contracts are README targets of D6.9 with the suggested names given.

| Contract | Local target | Use |
| --- | --- | --- |
| seminormal-ring | `IsSeminormalRing` and its unique-lifting characterisation | Reducedness and square–cube lifting on every affine open in `Rigid.IsSeminormal`. |
| normal-ring-check | seminormality of integrally closed domains and of products, `Affine.normal_finiteProduct` | Normal domain charts and their finite products in `rigid_seminormal_normal`. |
| compatible-branch-rings | seminormality of the equalizer `f.eqLocus g` | Seminormality of branch functions with matching values in a reduced ring, including the node of D6.9. |
| seminormalization-ring | `exists_seminormalization`, `subintegral_lift`, `subintegral_bijective_of_seminormal`; the README targets `snRing`, `snMap`, `snRing_seminormal`, `sn_lift`, `sn_compare` | Existence of a seminormal subintegral extension with its universal property and uniqueness up to unique isomorphism, and the constructed ring reflection, used to construct `Rigid.seminormalization`. |
| subintegral-unit | `IsSubintegral`, `subintegral_lift`, `subintegral_bijective_of_seminormal`; the README targets `snMap_subintegral`, `snMap_isIntegral`, `snMap_fieldPoints` | Subintegral maps, unique extension into seminormal rings, and bijectivity with seminormal source and reduced target; the unit is subintegral. |
| fixed-rings-and-restriction | the README targets `snMap_bijective`, `snRing_localization` | Fixed seminormal rings and compatibility with principal affine restriction; rigid rational restriction is the analytic statement of D6.9. |

### From Mathlib

Mathlib supplies the general identities used to compute the Checks:
`CategoryTheory.Limits.limit.lift_π` and `CategoryTheory.Limits.limit.hom_ext` in
`Mathlib/CategoryTheory/Limits/HasLimits.lean`, `specializes_iff_mem_closure` in
`Mathlib/Topology/Inseparable.lean`, `Topology.IsQuotientMap.id` in
`Mathlib/Topology/Maps/Basic.lean`, and `CategoryTheory.Presheaf.isSheaf_bot` in
`Mathlib/CategoryTheory/Sites/Sheaf.lean`. These are library contracts; the Checks evaluate the
pro-object maps, two-point topologies, quotient fibres and geometric sites used here.
`AddCommGrpCat.FilteredColimits.forget_preservesFilteredColimits` in
`Mathlib/Algebra/Category/Grp/FilteredColimits.lean` supplies the underlying-set colimit theorem.
`TopCat.sheafToType` in `Mathlib/Topology/Sheaves/SheafOfFunctions.lean` supplies the sheaf of all
Boolean functions used to compute proper clopen restriction. `ZMod.castHom` in
`Mathlib/Data/ZMod/Basic.lean` supplies the reductions in AdicSpacesPartII R0.19.9's
`Pro.residueSystem`.

| Supplier | Exact file and locator | Contract used |
|---|---|---|
| `IsCompactOpenCovered.of_finite_of_isSpectralMap` | `Mathlib/Topology/Sets/CompactOpenCovered.lean:155` | A finite family of spectral maps whose ranges cover a compact open makes it compact-open covered. The reverse implication of `singleton_mem_vPrecoverage_iff_surjective` applies this to a singleton and packages the result in `vPrecoverage`. Target quasiseparatedness is used in the reverse implication; the forward implication uses quasicompact open neighbourhoods of target points. |
| `IsCompactOpenCovered.of_isOpenMap` | `Mathlib/Topology/Sets/CompactOpenCovered.lean:164` | Continuous open maps from prespectral spaces compact-open cover each compact open contained in the union of their ranges. `Perfd.analyticCover` packages this result in `Perfd.proEtalePrecoverage`, with every arrow in the supplied morphism class `proet`; the target needs no spectrality hypothesis. |
| `TopologicalSpace.Clopens.toOpens`, `Monotone.functor`, `CategoryTheory.Functor.whiskeringLeft`, `CategoryTheory.ObjectProperty.lift`, `CategoryTheory.Functor.asEquivalence` | `Mathlib/Topology/Sets/Closeds.lean:332`; `Mathlib/CategoryTheory/Category/Preorder.lean:156`; `Mathlib/CategoryTheory/Whiskering.lean:77`; `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:159`; `Mathlib/CategoryTheory/Equivalence.lean:638` | Inclusion of clopens into opens, precomposition of presheaves and natural transformations, lifting to a full subcategory, and packaging an equivalence. D0.22 supplies the finite-disjoint-descent property and the equivalence assertion for this restriction functor. |
| `CategoryTheory.Limits.CategoricalPullback`, `CategoricalPullback.Hom`, its `Category` instance | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`, `:99`, `:111` | Objects `(fst, snd, iso)` and pairs of arrows satisfying `F.map fst ≫ y.iso.hom = x.iso.hom ≫ G.map snd`; these are the fibre carriers in D0.26 and the codomain of `Perfd.Stack.pointDiagonal` in D3.8. |
| `CategoryTheory.Limits.CategoricalPullback.π₁`, `.π₂`, `.catCommSq`, `.functorEquiv` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:140`, `:146`, `:153`, `:353` | Fibre projections, their comparison isomorphism and the equivalence between functors into the pullback and commutative squares with an invertible comparison. |
| `CategoryTheory.Limits.CatCospanTransform`, `CategoricalPullback.CatCommSqOver.transform` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/CatCospanTransform.lean:48`; `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:471` | Transport of a pullback cone along the three restriction functors and the pseudonaturality isomorphisms. |
| `CategoryTheory.Limits.CategoricalPullback.mkIso`, `CategoryTheory.Cat.Hom.isoMk`, `CategoryTheory.Discrete.functor` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:159`; `Mathlib/CategoryTheory/Category/Cat.lean:166`; `Mathlib/CategoryTheory/Discrete/Basic.lean:196` | Build pullback isomorphisms from their two components, turn natural isomorphisms into 2-cells of `Cat`, and include the discrete objects into a category. |
| `CategoryTheory.LocallyDiscrete.mkPseudofunctor`, `CategoryTheory.Pseudofunctor.StrongTrans` | `Mathlib/CategoryTheory/Bicategory/Functor/LocallyDiscrete.lean:165`; `Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean:57` | Identity and composition constraints and strong naturality constraints are specified isomorphisms, with separate coherence equations. |
| `CategoryTheory.Pseudofunctor.StrongTrans.Modification` | `Mathlib/CategoryTheory/Bicategory/Modification/Pseudo.lean:51` | Modifications between strong transformations, the 2-cells in the descent equivalence `Stack.quotient_descent` of D0.26. |
| `CategoryTheory.Pseudofunctor.DescentData` | `Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59` | Descent for a family of arrows to one site object. The descent data of `Stack.quotient_descent` in D0.26 are instead taken along a groupoid of sheaves, including its nontrivial stabilizers. |


The 2-fibre product of SchemeAndStackFoundations §1.18, written `Stack.twoFibreProduct` in D0.26,
assembles these categorical pullbacks into a prestack; its construction is that roadmap's. The
category-level pullback and its universal property are supplied by Mathlib.

`Ideal.quotientMap` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` supplies the scalar map
between the integral reductions in D1.6. `CategoryTheory.Over.post` in
`Mathlib/CategoryTheory/Comma/Over/Basic.lean` supplies the functor on slices in D1.11. The
assertions added to these supplier constructions are geometric flatness and the two classification
equivalences, respectively.

`CategoryTheory.MorphismProperty.multiplicativeClosure` in
`Mathlib/CategoryTheory/MorphismProperty/Composition.lean` supplies finite composites for D5.4.
`CategoryTheory.Limits.limit.post` in `Mathlib/CategoryTheory/Limits/HasLimits.lean` supplies the
canonical realization comparison in D5.3. `TopCat.Sheaf.pullback` in
`Mathlib/Topology/Sheaves/Functors.lean`, `DerivedCategory.Plus.Q` in
`Mathlib/Algebra/Homology/DerivedCategory/Plus.lean`, and `CategoryTheory.Sheaf.H` in
`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` supply the constructions used in D5.15;
the diamond-specific full faithfulness and cohomology comparison are the additional assertions here.

`Field.absoluteGaloisGroup` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` supplies the
automorphisms of the algebraic closure with the Krull topology. `ContinuousMap.yonedaPresheaf` in
`Mathlib/Topology/Category/TopCat/Yoneda.lean` supplies their continuous-function presheaf. D6.7
equips that presheaf with v-descent and constructs its action on the integral `Spd` carrier.


`CategoryTheory.sheafifyLift` and `CategoryTheory.toSheafify_sheafifyLift` in
`Mathlib/CategoryTheory/Sites/Sheafification.lean` supply the canonical map from the
image-constrained sheafification into its base in D5.8–D5.9. The equation on the sheafification unit
fixes that map; its unique image-factorization property is the additional statement here.
`isClosedMap_snd_of_compactSpace` in `Mathlib/Topology/Maps/Proper/Basic.lean` supplies the
compact-factor projection theorem in D5.10.

`CategoryTheory.Over.pullback`, `Over.pullbackId` and `Over.pullbackComp` in
`Mathlib/CategoryTheory/Comma/Over/Pullback.lean` supply restriction and its coherence isomorphisms
for D3.1. `CategoryTheory.overEquivOfIsInitial` in
`Mathlib/CategoryTheory/Comma/Over/StrictInitial.lean` identifies its empty-base fibre.
`CategoryTheory.Pseudofunctor.fullyFaithfulToDescentData` in
`Mathlib/CategoryTheory/Sites/Descent/DescentData.lean` supplies the comparison functor's full
faithfulness once the geometric prestack is proved to be a prestack; it is not restated.
`Perfd.slicePrestack` adds the contravariant pseudofunctor of actual slice pullbacks, whereas
`Over.mapFunctor` is covariant postcomposition and `GrothendieckTopology.pseudofunctorOver` in
`Mathlib/CategoryTheory/Sites/PseudofunctorSheafOver.lean` has sheaves on slices as fibres.

`Geometry.descentObject_fullyFaithful` specializes the supplied descent comparison to
the four geometric full subcategories; the additional effectivity assertions are
`Geometry.affinoid_effectiveDescent`, `Geometry.separatedProEtale_effectiveDescent` and
`Geometry.etale_effectiveDescent`. `CategoryTheory.Limits.coequalizer.desc` in
`Mathlib/CategoryTheory/Limits/Shapes/Equalizers.lean` supplies the quotient construction in
`Geometry.Torsor.levelSpace`; the new content is its perfectoid representability and its
étale, finite étale and limit properties. The fppf refinement uses `HenselianLocalRing` in
`Mathlib/RingTheory/Henselian.lean`, `IsSepClosed` in `Mathlib/FieldTheory/IsSepClosed.lean`,
and the scheme morphism classes `Flat`, `LocallyOfFinitePresentation` and `Surjective`
in `Mathlib/AlgebraicGeometry/Morphisms/{Flat,FinitePresentation,UnderlyingMap}.lean`.

`IsCompactOpenCovered` in `Mathlib/Topology/Sets/CompactOpenCovered.lean` is the finite compact-open
image condition used in D2.1–D2.2. Its `empty`, `iff_of_unique`, `id_iff_isOpen_and_isCompact`,
`of_isOpenMap` and `of_finite_of_isSpectralMap` give the empty, identity, open-map and spectral-map
cases. `AlgebraicGeometry.QuasiCompactCover` and
`AlgebraicGeometry.QuasiCompactCover.isCompactOpenCovered_of_isCompact` in
`Mathlib/AlgebraicGeometry/Cover/QuasiCompact.lean` identify the same condition for schemes;
`AlgebraicGeometry.Scheme.qcPrecoverage` in `Mathlib/AlgebraicGeometry/Sites/QuasiCompact.lean` and
`AlgebraicGeometry.Scheme.proetalePrecoverage` in `Mathlib/AlgebraicGeometry/Sites/Proetale.lean`
are the scheme suppliers.


`Continuous.connectedComponentsMap`, `Continuous.connectedComponentsMap_mk` and
`Continuous.connectedComponentsMap_continuous` in
`Mathlib/Topology/Connected/TotallyDisconnected.lean` supply the map on component quotients in
D1.11. `DisconnectedTopology.ComponentPullback` uses this map in its fibre-product equation; it does
not introduce another component functor.

`CategoryTheory.Functor.Elements.π`, `CategoryTheory.NatTrans.mapElements` and
`CategoryTheory.Functor.Elements.isInitialYonedaObj` in `Mathlib/CategoryTheory/Elements.lean`,
together with `CategoryTheory.Limits.colimit`, `colimit.ι` and `colimit.desc` in
`Mathlib/CategoryTheory/Limits/HasLimits.lean`, supply D4.5's intrinsic realization diagram and
colimit. `CategoryTheory.Functor.leftKanExtension` and `Functor.leftKanExtensionUnit` in
`Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean`, applied along
`CategoryTheory.uliftYoneda`, supply its presheaf formulation.
`CategoryTheory.Presheaf.restrictedULiftYoneda`, `Presheaf.uliftYonedaAdjunction`,
`Presheaf.preservesColimitsOfSize_leftKanExtension` and `Presheaf.isIso_of_isLeftKanExtension` in
`Mathlib/CategoryTheory/Limits/Presheaf.lean` supply the right adjoint, adjunction, colimit
preservation and invertibility of the Kan-extension unit. The representable comparison uses that
unit isomorphism, with the natural ULift identification. `ContinuousMap.yonedaPresheaf` in
`Mathlib/Topology/Category/TopCat/Yoneda.lean` is the unlifted continuous-map presheaf; the
additional assertion in D4.5 restricts this adjunction to sheaves under continuous-map descent.
`CategoryTheory.Adjunction.leftAdjoint_preservesColimits` in
`Mathlib/CategoryTheory/Adjunction/Limits.lean` and `CategoryTheory.Limits.PreservesCoequalizer.iso`
and `Limits.isColimitCoforkMapOfIsColimit` in
`Mathlib/CategoryTheory/Limits/Preserves/Shapes/Equalizers.lean` supply the coequalizer comparisons.
`CategoryTheory.isRegularEpiCategory_sheaf` in `Mathlib/CategoryTheory/Sites/RegularEpi.lean` makes
sheaf epimorphisms regular; `CategoryTheory.IsRegularEpi.isColimit` in
`Mathlib/CategoryTheory/Limits/Shapes/RegularMono.lean` supplies their coforks.
`CategoryTheory.sheafificationIso` in `Mathlib/CategoryTheory/Sites/Sheafification.lean` fixes the
atlas map of D4.1. `TopCat.isQuotientMap_of_isColimit_cofork` in
`Mathlib/Topology/Category/TopCat/Limits/Pullbacks.lean` supplies the quotient-map step; D4.5
applies it to the cofork preserved by the sheaf realization adjunction. `CategoryTheory.typeToCat`
in `Mathlib/CategoryTheory/Category/Cat.lean` and `CategoryTheory.Functor.toPseudofunctor'` in
`Mathlib/CategoryTheory/Bicategory/Functor/LocallyDiscrete.lean` supply the discrete prestack
`(P ⋙ typeToCat).toPseudofunctor'`; no additional discrete-prestack definition is needed.
`CategoryTheory.Functor.IsPreFibered.pullbackObj`, `pullbackMap` and `pullbackObj_proj` in
`Mathlib/CategoryTheory/FiberedCategory/Fibered.lean` supply the chosen Cartesian lifts used in
D6.6. `CategoryTheory.Limits.lim`, `limit.π`, `limit.lift` and `limit.isLimit` in
`Mathlib/CategoryTheory/Limits/HasLimits.lean` supply flattening for each fixed cofiltered diagram
of pro-objects in AdicSpacesPartII R0.19.9.


`SpectralSpace`, `IsSpectralMap`, `WithConstructibleTopology` with
`compactSpace_withConstructibleTopology` and
`constructibleTopology_eq_generateFrom_isConstructible`, `GeneralizingMap`,
`Topology.IsOpenEmbedding.spectralSpace` (which needs a compact ambient space and is applied to the
quasicompact opens of a spectral cover), `PrespectralSpace.of_isOpenCover`,
`quasiSober_of_open_cover`, `T0Space.of_open_cover`, `QuasiSeparatedSpace`,
`IsRetrocompact_iff_isSpectralMap_subtypeVal`, `QuasiSeparatedSpace.isRetrocompact_iff_isCompact`,
`TotallySeparatedSpace.totallyDisconnectedSpace`, `Quotient.compactSpace`,
`ConnectedComponents.totallyDisconnectedSpace`, `Continuous.isClosedMap`,
`Topology.IsClosedMap.isQuotientMap`, `Specialization`, `PrimeSpectrum`, `Ind` (the ind-completion,
carrying pro-categories as `(Ind Cᵒᵖ)ᵒᵖ`), `IsCofiltered.cofilteredClosure`, `Stonean` and
`CompHaus.projectivePresentation` with `CompHaus.epi_iff_surjective` and
`CompHaus.effectiveEpi_tfae`, `isClosed_eq`, `Profinite`, `TopCat.Presheaf.IsFlasque`,
`Filter.Product`, `TopCat.Presheaf.isIso_of_stalkFunctor_map_iso`, the descent API
`Pseudofunctor.IsStack` and `DescentData`, Grothendieck topologies and sheaves with `Sheaf.H`
(Ext-based cohomology), Grothendieck abelian categories with enough injectives,
`CategoryTheory.Functor.IsRepresentable`, `CategoryTheory.MorphismProperty.presheaf` with
`relative_isStableUnderBaseChange`, `relative_map_iff` and `isMultiplicative`,
`ContinuousMap.yonedaPresheaf` with `equalizerCondition_yonedaPresheaf`, `MulRingSeminorm`,
`Valuation.RankOne.hom`, `T2Quotient` with `T2Quotient.lift`, `MulAction.orbitRel` and
`MulAction.orbitRel.Quotient`, `Cardinal.IsStrongLimit` and `Cardinal.IsRegular`, and the bicategory
of pseudofunctors (`CategoryTheory.Bicategory`, `Pseudofunctor.StrongTrans`).

The opposite-category instance
`CategoryTheory.Limits.has_cofiltered_limits_op_of_has_filtered_colimits` in
`Mathlib/CategoryTheory/Limits/Shapes/Opposites/Filtered.lean` supplies cofiltered limits of `Pro C`
from the filtered-colimit instance of `Ind Cᵒᵖ`; the carrier identification is definitional and
needs no equivalence wrapper.

`CategoryTheory.Grpd`, `Grpd.objects` and `Grpd.forgetToCat` in
`Mathlib/CategoryTheory/Groupoid/Grpd/Basic.lean` carry the objectwise groupoids in D0.26.
`Filter.Product` in `Mathlib/Order/Filter/Germ/Basic.lean` is the quotient of the full dependent
product; the inhabited-factor hypothesis in D0.22 is needed for its comparison with stalks.

`CategoryTheory.ActionCategory` in `Mathlib/CategoryTheory/Action.lean` supplies the
action groupoid, including its actual action-labelled arrows.

`CategoryTheory.isomorphismClasses` and `CategoryTheory.isIsomorphicSetoid` in
`Mathlib/CategoryTheory/IsomorphismClasses.lean` supply the quotient by isomorphism; the
pseudofunctor construction in D0.26 adds restrictions and the stackification-unit comparison.

`CategoryTheory.Over.forgetCocone` in
`Mathlib/CategoryTheory/Comma/Over/Basic.lean` and `CategoryTheory.Limits.Cocone.whisker`
in `Mathlib/CategoryTheory/Limits/Cones.lean` supply the affinoid-open cocone of
`Geometry.tilt_affinoidOpen_isColimit` on the full subcategory selected by `CategoryTheory.ObjectProperty.ι` in
`Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`.

| Completed residue-field input | Declaration and file | Contract |
|---|---|---|
| Valuation on a residue field | `TauCeti.ValuationSpectrum.residueFieldValuation` in `TauCeti/AlgebraicGeometry/AdicSpace/ResidueField/Basic.lean:96` | Extends a point's valuation from the quotient by its support to its fraction field. D1.7 completes this valued field on each open affinoid chart of `Geometry.Spaces`. |
| Perfectoid completed residue fields | The perfectoid completed residue field statement of PerfectoidSpaces P2.5, *completed-residue-fields*: `Perfectoid.CompletedResidue`; the perfectoidness clause is prose there | Supplies the perfectoid interpretation of the same valued-field completion for perfectoid pairs; D1.7 adds the w-strict locality predicate on `Geometry.Spaces`. |

| Layer D6 input | Declaration and file | Contract |
|---|---|---|
| Completion of the p-adic rationals | `Padic.withValRingEquiv`, `Padic.withValUniformEquiv`, `Padic.withValUniformEquiv_norm_le_one_iff` in `Mathlib/NumberTheory/Padics/WithVal.lean` | Identifies the completion of `WithVal (Rat.padicValuation p)` with `ℚ_[p]` and its integral elements with `ℤ_[p]`; D6.3 adds restriction on marked-map v-sheaves. |
| Representable geometric properties | `CategoryTheory.MorphismProperty.presheaf` in `Mathlib/CategoryTheory/MorphismProperty/Representable.lean` | Applied to `Geometry.openImm p true`, this tests representability and geometric openness after each perfectoid base change; D4.5 and D5.1 compare it with the intrinsic sectionwise predicate. |
| Subobjects modulo isomorphism | `CategoryTheory.Subobject`, `Subobject.arrow`, `Subobject.mk_eq_mk_of_comm` in `Mathlib/CategoryTheory/Subobject/Basic.lean` | Monomorphisms into a fixed object modulo isomorphism over that object; `openSubfunctorEquiv` restricts this supplied quotient to geometric open immersions. |

### From Tau Ceti

| Layer D6 input | Compiled declaration and file | Contract |
|---|---|---|
| Integral base is not Tate | `TauCeti.Huber.PadicInt.not_isTateRing` in `TauCeti/RingTheory/Huber/Padic/Basic.lean` | `ℤ_[p]` has no topologically nilpotent unit. D6.1 uses this theorem to exclude the integral pair from `Perf.Spd`; `PreAdic.Spd` still defines its integral v-sheaf. |
| Completion of an adic spectrum | `TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, `spaCompletionHomeomorph_apply` in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Completion/Homeomorph.lean` | Pullback along completion identifies `Spa(Â, Â⁺)` with `Spa(A, A⁺)`; `Â⁺` is `completionPlus A⁺`, the closure of the image. D6.3 adds the comparison of marked-untilt mapping functors. |


`TauCeti.IsProConstructible` with `TauCeti.IsProConstructible.spectralSpace`, `.preimage`,
`.isCompact`, `.isSpectralMap_subtypeVal`, `.mem_of_isGenericPoint`, `.prod` and `.pi`,
`TauCeti.isSpectralMap_eval`, `TauCeti.IsSpectralMap.continuous_constructibleTopology`,
`TauCeti.spectralSpace_of_isClopen_generateFrom`,
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`,
`TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`,
`TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`,
`TauCeti.ValuationSpectrum.isAnalyticPoint_of_isTateRing`,
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, `TauCeti.ValuationSpectrum.spa`,
`rationalSubset`, `Huber.Pair` and `Huber.IsTateRing`.

`TauCeti.ValuationSpectrum.spa` is defined in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean`, and
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean` takes a
`TauCeti.Huber.PairOfDefinition A` and a subring `Aplus`; the hypotheses on `A` are a
commutative ring, a topology and `IsTopologicalRing A`.
`TauCeti.Huber.Pair` and `TauCeti.Huber.Pair.Hom` in
`TauCeti/RingTheory/Huber/Pair.lean` supply the plus subring and the continuous
ring maps preserving it.

For `Geometry.exists_wedhornComparison`, `TauCeti.WedhornPreAdicSpace` in
`TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/LocallyAffinoid.lean` is the full subcategory of
locally affinoid valued presheafed spaces with adapted structure presheaf.
`TauCeti.PreAdicSpace.forgetToTop` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Hom.lean`
forgets that structure. `TauCeti.PreAdicSpace.IsOpenImmersion.isoRestrict` in
`TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/OpenImmersion.lean` identifies an open immersion
with the restriction to its image. These describe the comparison target; D6.6 uses the Yoneda-adic
maps specified below.

`TauCeti.ValuationSpectrum.isAnalyticPoint_iff_not_le_supp_of_isAdic` and
`TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean` supply the support criterion and rational
cover of the analytic locus. D6.7 uses them on the Yoneda-adic carrier and identifies the resulting
sub-v-sheaf under `PreAdic.pointMap`. `TauCeti.Huber.IsTopologicallyFiniteType` in
`TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean` supplies the local finite type condition for
`Rigid.Space`.

### From TauCetiRoadmap.AdicSpaces

AdicSpaces layers 1–2: the spectrality of `Spv`, `Cont` and `Spa`; AdicSpaces layers 2–3: Huber
pairs, rational subsets and the adic structure presheaf.

### From TauCetiRoadmap.PerfectoidSpaces

| Layer D2 input | PerfectoidSpaces supplier (a target unless it is in the first table) | Use here |
|---|---|---|
| Perfectoid disc and Gauss valuation | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.discPair` (the P4 disc-pair target), `Perfectoid.perfectedTateAlgebra`, `Perfectoid.perfectedTateAlgebra.rootX`, `gaussPoint` | The disc Checks in D0.1, D1.1, D1.10, D2.1, D2.4, D2.8, D3.2, D3.3 and D3.8 use the supplied ring, plus ring and coordinate valuations on `Geometry.Affinoid`. |
| Completed cyclotomic field | `TauCetiRoadmap.PerfectoidSpaces.Perfectoid.padicCyclotomic`, `isPerfectoidField_padicCyclotomic` | `s1_4_cyclotomic_field_is_not` uses this actual field with its power-bounded plus ring. |
| Global functions and integral functions | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.globalSections`, `globalPlus`, `globalPullback`, `globalPullback_chart`; the plus-ring clause of the pullback is this README's `Geometry.globalPullback_plus` (D2.6) | `Geometry.toPerfectoid` retains the underlying perfectoid space; `Geometry.ORing` and `Geometry.OplusRing` assemble these supplied rings into presheaves on the category with lifted Hom types. |
| Cardinal bounds | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsKappaSmall`, `IsKappaSmall.mono` (PerfectoidSpaces `Suggested.lean`, P6 global cardinal predicates) | `Geometry.Perfdκ` is their full subcategory on `Geometry.Spaces`; no second smallness predicate is introduced. |
| Affinoid functions | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.globalSectionsAffinoidEquiv_spec` | The affinoid and cohomological comparisons in D2.7 use the supplied section ring and its chosen plus subring. |

Mathlib's `CategoryTheory.IsCardinalFiltered` in
`Mathlib/CategoryTheory/Presentable/IsCardinalFiltered.lean` supplies the `ω₁`-filtered hypothesis
of `Geometry.cutoff_of_omegaOne_colimits`. Mathlib's
`CategoryTheory.Functor.sheafAdjunctionContinuous` in `Mathlib/CategoryTheory/Sites/Pullback.lean`,
`CategoryTheory.Sheaf.cohomologyPresheafFunctor` in
`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`, and
`SheafOfModules.IsLocallyFree` and `SheafOfModules.IsFiniteType` in
`Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` and `Generators.lean` supply the
adjunction, cohomology, and bundle predicates. Layer D2 adds their geometric comparison theorems on
the perfectoid sites.

`Geometry.Affinoid p c` adds only the characteristic selector to `Perfectoid.PairCat p`, with rings
in `Type`. Its `A`, `P` and `toCAff` projections expose the supplied ring, plus ring and complete
Huber pair; `Geometry.Affinoid.ulift` transports it to `Perfectoid.PairCat.{1} p`.
`Geometry.Spaces p c` is `ULiftHom.{2}` of the full subcategory of `PerfectoidSpace.Perfd.{1} p` on
`Geometry.HasAffinoidCharts p c` (D1.11); for `c = true` its objects lie in
`PerfectoidSpace.Perf.{1} p`. `Geometry.toPerfectoid` forgets the chart condition, the
characteristic and the Hom lift. The following are PerfectoidSpaces roadmap interfaces and
targets (names relative to `TauCetiRoadmap.PerfectoidSpaces`); their category prototypes are
provided by that roadmap's `Suggested.lean`.

| Geometric input | Exact supplier | Local use |
|---|---|---|
| Perfectoid pairs | `Perfectoid.PairCat`, `Perfectoid.tiltFunctor` with `Pair.tilt` and `Pair.tiltHom` (P1.6), `Perfectoid.tilt.charP` (`(p : R♭) = 0` by `CharP.cast_eq_zero`; the tilt of the zero ring is zero) | `Geometry.Affinoid` retains the supplied pair and adds `c = true → (p : R) = 0`; `Geometry.tiltAffinoid` uses its supplied tilt. |
| Perfectoid categories | `PerfectoidSpace.isPerfectoidSpace`, `PerfectoidSpace.Perfd`, `PerfectoidSpace.InCharP`, `PerfectoidSpace.Perf` | `Geometry.Spaces` is the Hom lift of their full subcategory in universe 1 on `Geometry.HasAffinoidCharts`. The empty space belongs to both characteristic conventions. |
| Affinoid spectra and maps | `PerfectoidSpace.ofPair`, `PerfectoidSpace.spaFunctor` | `Geometry.affine` and `Geometry.affineMap` apply these constructions to `Geometry.Affinoid.ulift`, followed by the characteristic inclusion and Hom lift. |
| Fibre products | `PerfectoidSpace.hasPullbacks` | `Geometry.hasAffinoidCharts_pullback` keeps the supplied fibre product of charted objects charted, and `Geometry.hasPullbacks false` transports the instance through `ULiftHom.down`; the characteristic-p case restricts to `PerfectoidSpace.Perf`. |
| Finite étale and étale maps | `Perfectoid.Pair.IsFiniteEtale`, `PerfectoidSpace.IsFiniteEtale`, `PerfectoidSpace.IsEtale`, `PerfectoidSpace.finiteEtale_spa_iff` (P3, ECD 6.2) | `Geometry.finiteEtalePair_iff` identifies the pair predicate with geometric finite étaleness on the lifted affine carriers. `Geometry.finiteEtalePair` uses the pair predicate, including its module topology and integral closure; `Geometry.etale` pulls back the supplied geometric predicate along `Geometry.toPerfectoid`. |
| Global tilting | `PerfectoidSpace.tiltFunctor` (codomain `PerfectoidSpace.Perf`, which carries the characteristic-`p` clause), `PerfectoidSpace.tiltSpaIso`, `PerfectoidSpace.tiltSpaIso_naturality` | `Geometry.tilt` lifts the supplied functor with characteristic-p codomain; `Geometry.tiltAffineIso` and `Geometry.tilt_affine_naturality` transport the supplied affine comparison and its naturality. |

`PerfectoidSpace.IsTildeLimit_affinoid` supplies the diagram laws, compatible
limit topology and dense union of function rings in `Geometry.ProEtalePresentation`.
`Geometry.tilt_openImm` and `Geometry.tilt_affinoidOpen_isColimit` state the
open-immersion and canonical affinoid-gluing contracts on the lifted categories.

| Layer D6 input | Declaration and file | Contract |
|---|---|---|
| Valuation tilting | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.spaTiltHomeomorph` (PerfectoidSpaces P2 target; its forward map is `spaTilt`) | Identifies the valuation spectra of a perfectoid pair and its tilt. `Perf.Spd.space` uses its inverse to recover the valuation of the untilt. |
| Global tilting topology | `TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.tiltHomeomorph` with its naturality clause, and `tiltHomeomorph_spa` (PerfectoidSpaces P2 targets) | `Geometry.tilt_space` states their naturality and affine normalization on this file's `Geometry.Spaces` carrier with lifted Hom types and the supplied `InCharP` condition. |

Layer P0: almost algebra, its ideals and almost descent. Layer P1: tilting, marked untilts and their
classification by primitive Witt-vector elements. Layer P2: rational-affinoid geometry, completed
residue fields, completed tensor products, integral elements and almost acyclicity, with the tilting
equivalence of P2.12. Layer P3: almost purity, with the étale descent of vector bundles of P3.19.
Layer P4: morphisms, valuative criteria and completed base change. Layer P5: the finite-stage étale
comparison and the cardinal bounds of limits (P5.6–P5.7). Layer P6: pro-étale morphisms and their
stability (P6.13 for base change), affinoid pro-étale objects as pro-objects and the affinoid
pro-étale presentations of P6.9–P6.10, `κ`-small perfectoid spaces (P6.1–P6.4), and the product
`X × S` of an affinoid perfectoid space with a profinite set (`PerfectoidSpace.prodProfinite`,
`fibreProdProfinite`, with Check `prodProfinite_Zp_sections`). PerfectoidSpaces P7.16 supplies the
affinoid perfectoid basis of the pro-étale site of a rigid space used in D2.9 and D6.9.
PerfectoidSpaces P1.32 and P6.15–P6.17 supply perfectoid completion, continuous function rings and
the perfectoid torsor presentation used in D6. PerfectoidTowers P9.8 and P9.12 consume D2.9 and D6.9
for their tower specialisations.

`TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p` and its characteristic-`p` subcategory
`Perf p` are full subcategories of Tau Ceti's `PreAdicSpace`; this is the carrier of the D1–D2
statements of `Suggested.lean`. In the suggested carrier of the README-only targets,
`Geometry.Perfd p` and `Geometry.Perf p` are the Hom-universe lifts of the full subcategories of
`Perfd.{1} p` and `Perf.{1} p` on `Geometry.HasAffinoidCharts` (D1.11). `Geometry.space p c` is
`PreAdicSpace.forgetToTop` applied after `Geometry.toPerfectoid` and the inclusion of `Perfd.{1} p`
into `PreAdicSpace.{1}`, followed by the topological universe lift to `TopCat.{2}`.
`Geometry.inclusion` glues the Yoneda spectra of the charts in AdicEtaleGeometry's Yoneda-adic
spaces `AdicEtaleGeometry.YonedaAdicSpace` (a target of its §A1.16), and
`Geometry.exists_wedhornComparison` below identifies the result with the perfectoid Yoneda-adic
spaces; through it `YonedaAdicSpace.space` and `YonedaAdicSpace.space_charts` describe the same
underlying spaces and charts. `Geometry.tilt` is the lift of `PerfectoidSpace.tiltFunctor p`, which
preserves the chart condition by `Geometry.hasAffinoidCharts_tilt`. Its affine comparison is
`Geometry.tiltAffineIso`, with naturality `Geometry.tilt_affine_naturality`; its open gluing is
stated by `Geometry.tilt_openImm` and `Geometry.tilt_affinoidOpen_isColimit`.

For a prime `p` and either value of `c`, send `X : Geometry.Spaces p c` to the colimit in
`Sheaf CAff.ratTopology (Type 1)` of the Yoneda spectra `YonedaAdicSpace.ofSpaY R.toCAff`, indexed
by the pairs of `R : Geometry.Affinoid p c` and an open immersion to `X` from the spectrum of the
lift of `R`, with the maps over `X` induced by pair maps. This index category lies in `Type 1`, and
the formula is AdicEtaleGeometry's gluing formula for `YonedaAdicSpace.ofAdicSpace` applied to
charts with rings in `Type`. `Geometry.exists_wedhornComparison` states that each such colimit is a
Yoneda-adic space whose chart maps are open immersions, so that the construction corestricts to a
functor to `YonedaAdicSpace`; `Geometry.inclusion p` is its Hom lift to `Geometry.PreAdic` on
`Geometry.Perfd p`, and its restriction to `Geometry.Perf p` is the case `c = true`. The theorem
further states that this functor is fully faithful; that its essential image is the full
subcategory of `YonedaAdicSpace` on the objects covered by open immersions from
`YonedaAdicSpace.ofSpaY R.toCAff` with `R : Geometry.Affinoid p c`; that it sends the spectrum of
the lift of `R` to `YonedaAdicSpace.ofSpaY R.toCAff`; that it carries `Geometry.space p c` naturally
to `YonedaAdicSpace.space` up to the universe lifts; and that it preserves and reflects open
immersions. A quasi-inverse on this image, followed by the inclusion of `Perfd.{1} p` into
`TauCeti.WedhornPreAdicSpace` (perfectoid spaces are sheafy with a basis of affinoid opens, so
`PreAdicSpace.isPreAdic_of_isSheafy` applies), is then the comparison of the perfectoid Yoneda-adic
category with Wedhorn's pre-adic spaces: a fully faithful functor, with a natural isomorphism of
underlying-space functors and equivalence of the open-immersion predicates, whose essential image
is exactly the class of `Geometry.HasAffinoidCharts p c` objects. Essential surjectivity holds
onto this class only, not onto `Perfd.{1} p`; the one-point spectrum of a perfectoid field in
`Type 1` that is not `Small.{0}` lies outside it (`wedhornComparison_large_field`, D1.11). Thus open
restrictions agree through `PreAdicSpace.IsOpenImmersion.isoRestrict`. The natural homeomorphism
from the compared tilt to the compared original space is fixed on every perfectoid affinoid by the
inverse of `PerfectoidSpace.spaTiltHomeomorph`, using `Geometry.tiltAffineIso` and
`Geometry.affinePoint`. This
combines the sheafy affine description of [Berkeley] Proposition 3.2.2, p. 20, the Yoneda comparison
of Proposition 3.5.3, p. 24, and perfectoid sheafiness and tilting in [ECD] Theorem 3.18 and
Definition 3.19, p. 18; the size bound on chart points uses [ECD] Proposition 4.4 with proof,
pp. 20–21. The target concerns the perfectoid test categories of D6.6;
`Geometry.PreAdic` itself is the lifted Yoneda-adic category, including nonanalytic targets in
[Berkeley] Lemma 18.1.1. The geometric specialization of D4.5 and D5.1 additionally requires
field-valued points and the open-subfunctor comparison of [ECD] Proposition 11.13, Definition 11.14
and Proposition 11.15.

| Layer D6 input | PerfectoidSpaces target | Contract |
|---|---|---|
| Perfectoid closed disc | `Perfectoid.perfectedTateAlgebra`, `Perfectoid.perfectedTateAlgebra.isPerfectoidTateRing` | P1 supplies the complete Tate algebra with compatible roots of one variable; equip it with its power-bounded plus ring to specialize `perfectoid_disc`. |
| Valuation tilting | `PerfectoidSpace.spaTiltHomeomorph` | P2 identifies the spectra of a perfectoid pair and its tilt; `PreAdic.diamond_space` uses its inverse on marked affine points. |

### From TauCetiRoadmap.AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIII and SchemeAndStackFoundations

`CAff`, `YonedaAdicSpace`, `YonedaAdicSpace.ofSpaY`,
`YonedaAdicSpace.spaYFunctor`, `YonedaAdicSpace.space`, `YonedaAdicSpace.space_ofSpaY` and
`YonedaAdicSpace.IsOpenImmersion`, targets of AdicEtaleGeometry §A1.16, supply complete pairs, their
spectra, valuation topology and geometric open immersions. These carriers include nonnoetherian
integral pairs and their mapping spaces. `YonedaAdicSpace.isAnalyticPoint_ofSpaY_iff`, a target of
the same subsection, identifies open Tate charts with the valuation analytic locus through
`space_ofSpaY`.

| Geometric input | AdicEtaleGeometry target | Contract |
|---|---|---|
| Adic and pre-adic carriers | `CAff`, `YonedaAdicSpace` | Complete Huber pairs and sheaves on their rational site glued from open affine spectra; `Geometry.PreAdic` lifts the Hom types of `YonedaAdicSpace`. |
| Affinoid charts and maps of pairs | `YonedaAdicSpace.ofSpaY`, `YonedaAdicSpace.spaYFunctor`, `YonedaAdicSpace.space_ofSpaY`, `YonedaAdicSpace.space_ofSpaY_naturality` | Charts have the lifted valuation spectrum of the specified plus ring; pair maps act by valuation pullback. |
| Underlying pre-adic spaces and open immersions | `YonedaAdicSpace.space`, `YonedaAdicSpace.IsOpenImmersion`, `YonedaAdicSpace.space_charts` | For `X : Geometry.PreAdic` and `f : X ⟶ Y`, the space is `space.obj X.objDown` and the map is `space.map f.down`. Openness is `IsOpenImmersion f.down.hom`. These are the geometric maps used in D6.6. |


| Layer D6 input | AdicEtaleGeometry target | Contract |
|---|---|---|
| Analytic Yoneda-adic sites | `YonedaAdicSpace.smallEtale`, `YonedaAdicSpace.smallFiniteEtale`, `YonedaAdicSpace.smallEtaleTopology`, `YonedaAdicSpace.smallFiniteEtaleTopology` | Full categories of locally open–finite étale–open maps and finite étale maps over the given space; covering families are jointly surjective. D6.5 compares these with the diamond sites. |
| Analytic Yoneda-adic morphism classes | `YonedaAdicSpace.IsEtaleLocalDescription`, `YonedaAdicSpace.IsFiniteEtale` | Both source and target are analytic; finite étale charts use the entire inverse image and its integral plus ring. These definitions belong to A1; AdicEtaleGeometry's `Suggested.lean` declares them on Tau Ceti adic spaces as `AdicSpace.IsEtaleLocalDescription` and `AdicSpace.IsFiniteEtale`. |

For the locally noetherian adic étale site, [Huber96] §2.1, p. 109, takes étale maps to `X`
and jointly surjective families. Definition 1.6.5, p. 78, requires local finite presentation and
unique lifting across square-zero thickenings; Proposition 1.6.7, p. 79, supplies the stability
properties. Proposition 2.1.4, p. 111, compares the rigid and adic **topoi**; it does not identify
the categories of all admissible rigid opens and all adic opens. The general Tate and perfectoid
extensions used below are the ECD contracts supplied by AdicEtaleGeometry and PerfectoidSpaces.


AdicEtaleGeometry layer A1: the analytic/étale finite-projective comparison and the adic étale
calculus, with the pro-étale site in A1.12; A4.2–A4.5 and A4.7: finite étale torsor towers,
completion, self-products and effective finite étale descent. PerfectoidSpaces P1.32 and P6.15–P6.17
supply perfectoid completion, continuous function rings and perfectoid presentations.
AdicSpacesPartII layer R0: the affinoid and étale calculus of Huber pairs and the Tate norm
`tateNorm` of a ring of definition; layer R1 (§R1.1): fixed-field rigid spaces. AdicSpacesPartII
R0.18 and R0.19.2 supply spectral images of pro-constructible subsets, including the quasi-compact
locally spectral form, with pro-constructibility tested on spectral opens. Its R0.0 and
R0.19.1–R0.19.10 supply the generic spectral, pro-category and topos contracts listed above.
AdicSpacesPartIII layer R2: formal schemes, generic fibres and Hasse domains, including flat
topologically finite type algebras (§R2.1) and the specialisation map (§R2.4); layer R3: the
Gel'fand spectrum `GelfandSpectrum` of a Banach ring with its compactness, Hausdorffness and
functoriality (the induced map `M(B) → M(A)`) and Berkovich's maximum formula for the spectral
seminorm (*gelfand-spectrum-banach-ring*). SchemeAndStackFoundations specifies the following
supplier targets in its `README.md`. The table identifies each specification by section and target
name; `cohomology_filtered_colimits` denotes the coherent-site contract in its §2.5.
SchemeAndStackFoundations owns these generic site constructions on an arbitrary site `(C, J)`, and
D0.18–D0.19, D0.25–D0.26 and D3.10 are their v-site specialisations, stated as comparisons. No
import from the scheme roadmap is required by the statements of `Suggested.lean`.

| Supplier section in SchemeAndStackFoundations | Target names | Form | Contract used here |
|---|---|---|---|
| §1.18, Stacks in groupoids, stackification, the 2-Yoneda lemma and 2-fibre products | `Stack.stackification`, `Stack.twoFibreProduct` (generic); `stackification`, `twoFiberProduct` (fppf) | Specification | Implemented once on an arbitrary site `(C, J)`; the groupoid-valued fppf stacks on `Scheme.{u}` and the v-stacks of D0.25–D0.26 are its specialisations. |
| §1.21, Quotient stacks, line bundles with a section, root stacks | `Stack.quotient` (generic); `quotientStack`, `actionQuotient` (fppf) | Specification | Quotients of groupoid objects and group actions on an arbitrary site; D0.26 is the specialisation to `(Perf, v)`. |
| §§2.1–2.2, Higher direct images, Leray and Čech spectral sequences | `leray_spectral_sequence`, `cech_to_cohomology` | Specification | Higher direct images, the spectral sequences, their relative and edge-map statements, and Leray's acyclicity comparison; D0.19 states the comparison for the sites of layer D2. |
| §2.3, Sheaf torsors and torsor classes (§1.15 for geometric torsors over schemes) | `NonabelianH1` | Specification | Torsor classes on a site; D0.18, D0.25 and D3.10 take their torsor classes here. |
| §2.5, Slice sites, Godement resolutions, flasque sheaves, Grothendieck vanishing, filtered colimits | `flasque_cech_vanishing`, `cohomology_filtered_colimits` | Specification | Higher Čech vanishing for flasque abelian sheaves on spaces and filtered-colimit compatibility on coherent sites; used in D0.18–D0.21. |
| §1.20, Algebraic stacks and separatedness | — | Not used | Separatedness there asks for a proper diagonal; separatedness here is the closed-immersion diagonal of D3.8. |

ResolutionOfSingularitiesCharacteristicZero supplies the algebraic resolution inputs to D6.9.
The analytic comparisons and compatible-section descent are targets here.

| Resolution input | Supplier section and target names | Contract used here |
|---|---|---|
| Strong resolution and regular pullback | ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6, `qeResolution`, `qeResolution_regularFunctorial` | Projective birational regular-source modifications of reduced noetherian quasi-excellent ℚ-schemes, preserving the entire regular locus; resolving sequences commute with regular pullback after empty steps are omitted. |
| Field and formal comparisons | ResolutionOfSingularitiesCharacteristicZero §§7.1–7.4 and 7.8, `fieldResolution_regularPullback`, `qeLocalFormalReduction`, `supportedFormalTower_algebraizes`, `thickFibre_resolutionComparison`, `resolution_field` | Field resolving towers and their regular pullbacks; formal completion, supported-tower algebraization and independence of algebraization for rig-regular locally principal formal varieties. |
| Affinoid resolution | ResolutionOfSingularitiesCharacteristicZero §7.8, `resolution_affinoid` | For reduced characteristic-zero affinoid A, a projective birational modification of `Spec A` with regular source, isomorphic over its entire regular locus; D6.9 proves its relative analytic comparison. |

| Spectrum input | Declaration and supplier | Contract |
|---|---|---|
| Tate norm | `TauCetiRoadmap.AdicSpacesPartII.Huber.TateNormDatum`, `Huber.tateNorm` (AdicSpacesPartII R0 targets) | R0 specifies the ring of definition, the pseudouniformizer and the radius. D5.13 uses radius `1/2`. |
| Bounded spectrum | `TauCetiRoadmap.AdicSpacesPartIII.Huber.GelfandSpectrum` and the continuous map `M(B) → M(A)` of *gelfand-spectrum-banach-ring* (AdicSpacesPartIII R3.9; `Huber.GelfandSpectrum` is a prototype in that roadmap's `Suggested.lean`, and the induced map is a README target with no Lean name) | R3 defines the subtype of `MulRingSeminorm R` bounded by a positive constant times the given norm, with pointwise topology. D5.13 identifies its normalized subspace with continuous normalized seminorms when the norm is `tateNorm d`. |

The representable sheaf and its maps are `CategoryTheory.GrothendieckTopology.yoneda`
(`Mathlib/CategoryTheory/Sites/Canonical.lean`); the geometric assertion retained here is that these
sheaves are diamonds when identity maps belong to the supplied pro-étale class. The
all-representable definitions of open immersion and finite étale map use
`CategoryTheory.MorphismProperty.presheaf` directly
(`Mathlib/CategoryTheory/MorphismProperty/Representable.lean`). `CategoryTheory.Ind.lim` and the
filtered-colimit and colimit instances for `Ind`
(`Mathlib/CategoryTheory/Limits/Indization/Category.lean`), together with
`CategoryTheory.Limits.hasFiniteLimits_opposite` (`Mathlib/CategoryTheory/Limits/Opposites.lean`),
supply the corresponding pro-category limits. The reflexive equivalence with `(Ind Cᵒᵖ)ᵒᵖ` is
definitional. AdicSpacesPartIII layer F0 supplies the formal spectrum and the associated pre-adic
space of a formal scheme, used in D6.6.

`CategoryTheory.Limits.HasCoproducts`, `Sigma.ι`, `Sigma.desc` and `coproductUniqueIso_inv` in
`Mathlib/CategoryTheory/Limits/Shapes/Products.lean` supply the disjoint-union universal property
and the singleton comparison. `Geometry.hasCoproducts` supplies Type 1 indexed coproducts on this
file's charted `Geometry.Spaces p c`. PerfectoidSpaces' `sigmaPoints`, with its Checks
`sigmaPoints_empty`, `sigmaPoints_singleton` and `sigmaPoints_two_components` (P6.4), concerns
Type 0 indexed families on `PerfectoidSpace.Perfd p`; the carrier and index universe differ here.

The Layer D0 comparisons also use the following exact suppliers. The bounded pro-category,
topos-limit presentation and torsor-class functor add the stated geometric conditions and canonical
comparisons to these carriers.

| Interface | Supplier | Use here |
| --- | --- | --- |
| Ext and its action under exact functors | `CategoryTheory.Abelian.extFunctor`, `CategoryTheory.Abelian.Ext.mapExactFunctor`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` and `Map.lean` | Cohomology on qcqs sheaves and the canonical coherent-limit comparison. |
| One-cover nonabelian Čech classes | `CategoryTheory.PresheafOfGroups.H1`, `Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean` | This supplier fixes a covering family; SchemeAndStackFoundations §2.3's `NonabelianH1`, written `Topos.groupH1` in D0.18, instead takes torsor classes on the whole site through stackification. |
| Equivalences of pseudofunctors | `CategoryTheory.Bicategory.Equivalence`, `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean` | The quotient atlas relation is a stack equivalence, with inverse and modifications. |
| Coherent and noninvertible sections | `CategoryTheory.Pseudofunctor.StrongTrans`, `CategoryTheory.Oplax.OplaxTrans`, `Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean` and `Oplax.lean` | Cartesian direct-image sections specify the limit; oplax sections specify compatible coefficient systems. |

The rational-space Checks in D2.1 use `Rat.interior_compact_eq_empty`
(`Mathlib/Topology/Instances/RatLemmas.lean`) and `IsCompactOpenCovered.empty`
(`Mathlib/Topology/Sets/CompactOpenCovered.lean`) directly. The first forces every compact open of
`ℚ` to be empty; the second supplies its finite image witness.

## How to read the build

`Suggested.lean` carries the targets that can be stated against Mathlib, Tau Ceti and
PerfectoidSpaces as they stand: the spectral topology and submersions of D0 with the cutoff
cardinals and the flasque constant sheaf, the disconnected perfectoid spaces and split-cover
cohomology of D1 with automatic flatness, the v-topology on PerfectoidSpaces' `Perfd p` with
v-descent, the degree-zero comparison and affinoid acyclicity of `O` on the `κ`-small v-site, and
v-descent of continuous maps (D2–D3), the Berkovich spectrum and the component formula of D5, and
seminormality, subintegrality and the existence of seminormalizations for rings (D6.9). Each subsection ends with a `Lean:` line that names the declarations carrying it, or states that the subsection is
specified in the README only (no Lean declaration). Every other declaration name of this roadmap in
the text — the suggested definitions and lemmas, and the carriers `Geometry.*`, `Perf.*`, `Perfd.*`,
`PreAdic.*`, `Rigid.*`, `Stack.*`, `Topos.*`, `Pro.*`, `Cofiltered.*`, `ClopenSheaves.*`,
`DisconnectedTopology.*` and the like — is a suggested name for a target specified in the README
only. The constructions that are formalisation targets in their own right (pro-étale morphisms and
sites, stacks, diamonds, their underlying spaces, spatial diamonds, marked untilts and `Spd`) are
not in the Lean file.

Check labels `sM_N_case` identify the Checks of subsection DM.N; labels of the form
`definition_Name_k`, and the other backticked labels in Check lists, identify the Checks of a
definition target. Checks specify mathematical acceptance cases in prose. The `Lean:` lines
identify milestone signatures and the three proved examples in `Suggested.lean`; the size
obstructions used in D3–D5 are README boundary statements. Italic slug labels such as
(*spectral-quotient-criterion*) name targets for citation from other roadmaps; they are labels of this README and of the roadmaps that cite them. The
geometric examples use `Geometry.Affinoid`, `Geometry.Spaces`, `Geometry.VSheaf` and
`Geometry.VStack`, including their valuation spectra and slice categories.

D0 uses the spectral, pro-category and ordinary-topos APIs of AdicSpacesPartII R0.0 and R0.19 to
develop spectral geometry, cohomology, size bounds and the v-site forms of stackification and
quotient stacks. These specialise SchemeAndStackFoundations' generic constructions. D1 applies it to
perfectoid spaces to produce the disconnected covers on which every later descent argument is run.
D2 puts the pro-étale and v-topologies on perfectoid spaces and proves the sheaf and acyclicity
theorems for `O` and `O⁺`. D3 proves effective descent for the morphism classes of the quotient
presentations and defines the classes of morphisms of pro-étale stacks. D4 defines diamonds, small
v-sheaves and small v-stacks with their underlying spaces, and proper maps. D5 develops spatial
geometry: permanence, limits, presentations, local structure, relative representability and the
Hausdorff reduction through Berkovich spaces. D6 closes with the diamondification of analytic and
integral pre-adic spaces and the étale-site comparison. Each layer's subsections are in thematic
order, which within D0 is not the dependency order: D0.5 and D0.6 use AdicSpacesPartII R0.19.9's
pro-category equivalence, and D0.18 uses the Čech-to-cohomology comparison cited in D0.19. A
target's `*Needs:*` clause names the targets, the layers of other roadmaps and the library
declarations it rests on.

## Layer D0: spectral, categorical and size foundations

The layer uses AdicSpacesPartII R0.0 and R0.19 for generic locally spectral spaces, constructible
topology, spectral limits, pro-categories and qcqs objects of topoi. Its spectral strand develops
inverse topology, connected components, spectral quotients and submersions, Hochster realization and
profinite presentations of compact Hausdorff spaces. Its ordinary-site strand develops
filtered-colimit cohomology, flasque constant sheaves, cohomology of limits of coherent topoi and
sheaves on profinite sets. Cutoff cardinals, completion bounds and bounded pro-objects control the
size of sites. The stack strand specializes the generic constructions of SchemeAndStackFoundations
§§1.18 and 1.21 to the v-site.

### D0.1 Local spectrality of perfectoid spaces

Every perfectoid space is locally spectral, and a qcqs perfectoid space is spectral, using
AdicSpacesPartII R0.0's `IsLocallySpectralSpace` and its spectral comparison. The affinoid charts
are spectral by Tau Ceti's `spectralSpace_spa_of_pairOfDefinition`. *Needs:* AdicSpacesPartII R0.0;
PerfectoidSpaces P2 (affinoid charts and their gluing).

**Checks.**

- `s0_1_qcqs_affinoid_is_spectral` — An affinoid perfectoid `Spa(A, A⁺)` is spectral, hence
  locally spectral.
- `s0_4_not_pro_constructible_fails` (non-example) — On the perfectoid closed unit disc over `C`,
  the rank-one locus is generalizing and dense but is not an intersection of quasicompact opens.
  The generalizing-subset formula of AdicSpacesPartII R0.19.3 requires pro-constructibility.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.5 The inverse topology

**Hochster dual topology.** (*inverse-spectral-topology*) Let `X` and `Y` be spectral. The inverse
topology on `X` is generated by the complements of the quasicompact opens of `X`. Define
`inverseTopology` as this topology; prove `spectralSpace_inverseTopology` (the inverse topology on a
spectral space is spectral, and `x` specializes to `y` in the inverse topology iff `y` specializes
to `x` in the original topology) and `Spectral.inverseTopology_inverse` (applying the operation
twice recovers the original topology); prove also that the inverse topology has the same
constructible topology as the original and that a map `X → Y` is spectral for the original
topologies iff it is spectral for the inverse topologies ([Hoc69] Proposition 8, p. 52, the
source of these properties; [KL15] §8.1, Def. 8.1.4, p. 157, whose final sentence names this other
spectral topology after Hochster and which separately specifies the patch topology). The named comparisons are `Spectral.inverseTopology_constructible` and
`Spectral.inverseTopology_map`. *Needs:* AdicSpacesPartII R0.19.9 and AdicSpacesPartII R0.19.1.

**Checks.**

- `s0_5_inverse_discrete_finite` — a finite discrete space is unchanged by passing to the inverse
  topology.
- `s0_5_inverse_sierpinski` — on the two-point Sierpiński space the open singleton switches points:
  for `X = Spec` of a discrete valuation ring with quasicompact opens `∅`, `{η}`, `X`, the inverse
  topology is generated by `X`, `{s}`, `∅`, so `{s}` becomes open and `{η}` closed, and `η ⤳ s` in
  `X` becomes `s ⤳ η` in the inverse topology, the computed instance of the specialization clause of
  `spectralSpace_inverseTopology`.
- `s0_5_inverse_patch_unchanged` — `Spectral.inverseTopology_constructible` identifies the
  constructible topology of the inverse topology with that of the original.
- `s0_5_inverse_point_and_empty` — In the inverse Sierpiński topology the closure of `{false}` is the whole space and the closure of `{true}` is `{true}`.
- `s0_5_inverse_not_spectral_without_compactness` (non-example) — on the discrete space `ℕ` the
  quasicompact opens are the finite sets, so the inverse topology is the cofinite topology, which is
  not sober (`ℕ` is an irreducible closed set without a generic point):
  `spectralSpace_inverseTopology` needs `X` spectral, not merely locally spectral.

**`inverseTopology`.** Duality reverses the two-point specialization order.

**Checks.**

- `definition_inverseTopology_1` — On the two-point chain the dual opens are ∅, {false}, and the
  whole set.
- `definition_inverseTopology_2` — Duality fixes the discrete two-point topology but changes the Sierpiński topology.
- `definition_inverseTopology_3` — Duality on the two-point chain is not the discrete patch
  topology.

**Checks.**

- `s0_5_inverse_sierpinski_closed_point` — The closed singleton of the Sierpiński space becomes open
  in the inverse topology.

Lean: `inverseTopology`, `spectralSpace_inverseTopology`, `Spectral.inverseTopology_inverse`,
`Spectral.inverseTopology_constructible` and `Spectral.inverseTopology_map`. The Checks are
specified in prose.

### D0.6 The profinite space of connected components

**Profinite connected-component space.** (*spectral-components-profinite*) Let `X` be spectral.
Prove `t2Space_connectedComponents`: `ConnectedComponents X` with the quotient topology is
Hausdorff, hence profinite — its compactness and total disconnectedness are Mathlib's instances
`Quotient.compactSpace` and `ConnectedComponents.totallyDisconnectedSpace`, while Mathlib's
`ConnectedComponents.t2` needs `X` Hausdorff, which a spectral space is not — that its clopens
correspond exactly to the clopens of `X`, and that the component of `x` is the intersection of all
clopen neighbourhoods of `x` ([ECD] §7, proof of Lem. 7.2, connected-components paragraph, pp.
29–30, which uses this profiniteness input without stating it). *Needs:* AdicSpacesPartII R0.19.9
and AdicSpacesPartII R0.19.1; Mathlib `ConnectedComponents`, `Quotient.compactSpace`,
`ConnectedComponents.totallyDisconnectedSpace`.

**Checks.**

- `s0_6_connected_space` (degenerate case) — for a nonempty connected spectral space, such as `Spec` of a
  discrete valuation ring or a point, `ConnectedComponents X` is a point; for the empty space it is
  empty.
- `s0_6_finite_product_of_fields` — for `X = Spec(F_1 × ⋯ × F_n)`, `n` discrete points,
  `ConnectedComponents X = X`; for `X = Spec` of a product of countably many fields, `X` is the
  Stone–Čech compactification of `ℕ`, already profinite and totally disconnected, and
  `ConnectedComponents X = X`.
- `s0_6_clopens_of_x_not_of_patch` (non-example) — the clopens of `X` are strictly fewer than the clopens
  of `X_cons` in general (for the Sierpiński space the former are `∅`, `X`, the latter all four
  subsets), so the correspondence is with the clopens of `X`, not with constructible sets.

`spectralComponentClopens` is the order equivalence on clopens, fixed as inverse image along
`ConnectedComponents.mk` by `spectralComponentClopens_apply`. `spectral_connectedComponent` states
the intersection formula. `eq_sInter_of_isProConstructible_of_stableUnderGeneralization` in
AdicSpacesPartII R0.19.3 supplies the dual closure corollary with both pro-constructibility and
stability under generalization as hypotheses.

**`spectralComponentClopens`.** Clopens of the component quotient pull back along the component projection.

**Checks.**

- `definition_spectralComponentClopens_1` — The clopen component singleton of a discrete two-point
  space pulls back to the same singleton.
- `definition_spectralComponentClopens_2` — The empty clopen pulls back to the empty set.
- `definition_spectralComponentClopens_3` — On discrete Bool the singleton component false pulls back to {false}, excluding transposition of the two components.

Lean: `t2Space_connectedComponents`. The rest of this subsection is specified in the README only (no
Lean declaration).

### D0.8 Quotients by pro-constructible equivalence relations

**Quotients by pro-constructible equivalence relations are T0, with invariant neighbourhoods.**
(*pro-constructible-equivalence-relation*) Let `X` be a quasiseparated locally spectral space and
`R ⊆ X × X` a pro-constructible equivalence relation whose two projections `s, t : R → X` are
quasicompact and generalizing. Prove `proConstructibleEquivalenceRelation` (README only): the
quotient space `X/R` is T0, and for every quasicompact open `W ⊆ X` there is an open `R`-invariant
subset `U` with `W ⊆ U ⊆ E′`, where `E′` is an `R`-invariant intersection of a nonempty family of
quasicompact open subsets ([ECD] §2, Lem. 2.7, p. 11). Precisely: for `E = t(s⁻¹(W))` choose a
quasicompact open `W′ ⊇ E`; the invariant neighbourhood lies in `E′ = t(s⁻¹(W′))`, and containment
in `E` itself is not available — ECD’s statement already leaves this invariant intersection
unspecified. Its proof distinguishes the auxiliary saturation `E` from the larger `E′` used in the
conclusion ([ECD] §2, proof of Lem. 2.7, p. 12). The construction removes from `X` the closure of
`t(s⁻¹(X ∖ W′))`; the generalizing projections make that closure invariant, the inclusions
`W ⊆ U ⊆ W′ ⊆ E′` give the required neighbourhood, and separating distinct orbits gives T0. The
hypotheses do not make `X/R` spectral: by [ECD] Rem. 2.8 any compact Hausdorff space is such a
quotient of a profinite set, which is why spectrality needs the additional basis condition of D0.9;
for `X` profinite and `R` the graph of a free finite group action, on the other hand, `X/R` is
profinite. The scheme-theoretic counterparts of the invariant-neighbourhood argument are [Stacks
quotient spaces] §39.19, Lemmas 39.19.3–39.19.4 (Tags 0APA–0APB); the flat-scheme argument there
does not replace ECD's generalizing topological hypotheses. *Needs:* AdicSpacesPartII R0.19.3,
AdicSpacesPartII R0.19.2 and AdicSpacesPartII R0.19.4; Mathlib `GeneralizingMap`, `T0Space`,
`Topology.IsQuotientMap`.

**Checks.**

- `s0_8_saturation_need_not_be_open` (non-example for the naive `E = t(s⁻¹(W))` form) — an invariant open
  `U` with `W ⊆ U ⊆ E = t(s⁻¹(W))` forces `U = E`, since `U` invariant and `W ⊆ U` give `E ⊆ U`; so
  the `E` form asserts that saturations of quasicompact opens are open, which fails: for
  `X = {0} ∪ {1/n : n ≥ 1}` profinite, `R` the closed relation identifying `0` with `1` only, and
  `W = {1}`, the saturation `E = {0, 1}` is not open (`0` is not isolated). The `E′` form holds
  there with `W′ = {0, 1} ∪ {1/n : n ≥ N}`, `U = W′ = E′`.
- `s0_8_trivial_and_total_relation` (degenerate cases) — for `R` the diagonal, pro-constructible since
  `X_cons` is Hausdorff, with identity projections, `X/R = X` is T0; for `R = X × X` on a spectral
  `X` the projections are quasicompact and generalizing, `X/R` is empty when `X = ∅` and a
  point when `X` is nonempty, and `U = E′ = W′ = X`. Both quotients are spectral; in the empty
  case the basis `{∅}` has empty inverse image.
- `s0_8_free_finite_action` — for `X` profinite and `R` the graph of a free action of a finite group,
  `X/R` is profinite.
- `s0_8_compact_hausdorff_quotient` (non-example for spectrality) — the Stone–Čech presentation of
  D0.16 of a compact Hausdorff `Y` satisfies the hypotheses with `X` profinite and `X/R = Y`, which
  is not spectral unless `Y` is profinite.

- `s0_8_global_quasicompactness_needed` (non-example) — for discrete `X = ℕ` and the total relation,
  both projections are open, generalizing and locally spectral. They are not quasicompact: the fibre
  over a singleton is `ℕ`. The quotient is a point with noncompact inverse image. The Lean example
  of AdicSpacesPartII R0.0 with `Prod.fst : ℕ × ℕ → ℕ` distinguishes the local and the global spectral-map
  conditions.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.9 Spectral and locally spectral quotients

**When a quotient by a pro-constructible equivalence relation is spectral, and the open case.**
(*spectral-quotient-criterion*) Let `X` be spectral and `R ⊆ X × X` a pro-constructible equivalence
relation with generalizing projections, and suppose the quotient topology on `X/R` has a basis of
open subsets whose inverse images under `q : X → X/R` are quasicompact. Prove
`spectralSpace_quotient`: `X/R` is spectral and `q` is spectral and generalizing ([ECD] §2, Lem. 2.9
with proof, pp. 12–13). The local version is `spectralSpace_quotient_of_isOpenMap` (README only):
under the quasiseparated, locally spectral and quasicompact-projection hypotheses of D0.8, if
`R → X` is open then `X/R` is locally spectral and quasiseparated and `q` is open, qcqs and locally
spectral in the sense of AdicSpacesPartII R0.0, hence, being quasicompact, also `IsSpectralMap`
([ECD] §2, Lem. 2.10 with proof, p. 13), the form used in [ECD] §§11 and 13 — in Prop. 11.24 and
Cor. 11.28 to show that `|Y|` is spectral for a spatial diamond. The basis hypothesis of the first
statement is not automatic, and the openness hypothesis of the second is what every later geometric
application verifies; neither can be dropped, since pro-constructibility and generalizing
projections alone do not make the quotient spectral: with `X` the Stone–Čech compactification of a
compact Hausdorff space `Y` viewed as a discrete set, `X` is profinite, `X → Y` is a continuous
surjection and the induced `R` is closed, hence profinite, yet `Y` is an arbitrary compact Hausdorff
space ([ECD] §2, Rem. 2.8, p. 12). *Needs:* D0.8 and AdicSpacesPartII R0.19.1; Mathlib
`SpectralSpace`, `QuasiSeparatedSpace`, `IsSpectralMap`.

**Checks.**

- `s0_9_diagonal_relation` (degenerate case) — for `R` the diagonal the basis hypothesis is the basis of
  quasicompact opens of `X`, the quotient is `X` and `q` is the identity; the projections are open,
  so the second statement applies as well.
- `s0_9_total_relation` (degenerate case) — for `R = X × X`, the quotient is empty when `X = ∅`
  and a point when `X` is nonempty. The basis is `{∅}` in the empty case, with empty inverse image,
  and `{point}` in the nonempty case, with inverse image `X`. Both quotients are spectral, and
  `q` is spectral, generalizing and open.
- `s0_9_stone_cech_quotient` (non-example) — for `X = β(Y_disc)`, `Y = [0,1]`, and `R = X ×_Y X`, the
  quotient is not spectral. Every proper nonempty open interval of `Y` has noncompact preimage: a
  compact preimage would have compact, hence closed, image. The only compact opens of `Y` are `∅`
  and `Y`, so they cannot form a basis.

Lean: `spectralSpace_quotient`. The rest of this subsection is specified in the README only (no Lean
declaration).

### D0.11 Spectral submersions

**Spectral submersions.** (*spectral-submersion*) Let `X` and `Y` be spectral. A spectral submersion
is a surjective spectral map `f : X → Y` such that for every subset `U ⊆ Y`, if `f⁻¹(U)` is
quasicompact open then `U` is open; this is weaker than an ordinary submersion, Mathlib's
`Topology.IsQuotientMap`. Define `IsSpectralSubmersion` by surjectivity, spectrality and this
descent of quasicompact openness; prove `IsSpectralSubmersion.iff_constructible` (it suffices to
test constructible `U`; surjectivity and compactness of the constructible topology then also give
quasicompactness of `U`) and `IsSpectralSubmersion.comp` (composites of spectral submersions are
spectral submersions) ([Arc] §2, Def. 2.14 and Rem. 2.15, p. 12, which give the qc-open and
constructible criteria and make no arbitrary-open quotient claim). *Needs:* AdicSpacesPartII
R0.19.1; Mathlib `IsSpectralMap`, `Topology.IsQuotientMap`.

**Checks.**

- `s0_11_spectral_submersion_identity` — the identity on every spectral space is a spectral submersion.
- `s0_11_quotient_map` — a surjective spectral quotient map is a spectral submersion: its descent
  clause is the quotient property restricted to sets with quasicompact open preimage.
- `s0_11_spectral_submersion_generalizing` — a surjective generalizing spectral map is a spectral
  submersion.
- `s0_11_spectral_submersion_not_arbitrary_quotient` (non-example) — the inverse-limit map of [Arc] Rem.
  2.18 is a spectral submersion and fails to be an ordinary quotient map.
- `s0_11_not_surjective` (non-example) — the generic-point inclusion `{η} → {η,s}` is spectral but fails
  surjectivity and descent of openness: `{s}` has empty, hence quasicompact open, preimage and is
  not open.
- `s0_11_patch_identity` (non-example) — for `X = Spec` of a discrete valuation ring the identity
  `X_cons → X` is a bijective spectral map and not a spectral submersion: `{s}` has quasicompact
  open preimage in the discrete `X_cons` and is not open in `X`.
- `s0_11_constructible_test_is_exhaustive` — if `f⁻¹(U)` is quasicompact open for a surjective spectral
  `f` then `U = f(f⁻¹(U))` and `Y ∖ U = f(X ∖ f⁻¹(U))` are both closed in `Y_cons`, so `U` is
  constructible: the restriction to constructible `U` in `IsSpectralSubmersion.iff_constructible`
  loses nothing.

**`IsSpectralSubmersion`.** A spectral submersion detects openness by inverse image.

**Checks.**

- `definition_IsSpectralSubmersion_1` — The projection from a discrete two-point space to a point is
  a spectral submersion.
- `definition_IsSpectralSubmersion_2` — The map from a point to `true` in discrete Bool fails surjectivity and is not a spectral submersion.
- `definition_IsSpectralSubmersion_3` — The identity from the discrete two-point space to the
  two-point chain is not a spectral submersion.

Lean: `IsSpectralSubmersion`, `IsSpectralSubmersion.iff_constructible` and
`IsSpectralSubmersion.comp`. The Checks are specified in prose.

### D0.12 Limits of spectral submersions

**Limits of spectral submersions.** (*spectral-submersions-under-limits*) Let `f_i : X_i → Y_i` be a
morphism of small cofiltered diagrams of spectral spaces with spectral transition maps. Prove
`isSpectralSubmersion_limMap`: if every `f_i` is a spectral submersion then `lim f_i` is a spectral
submersion ([Arc] §2, Lem. 2.17, pp. 12–13). The source states this for qcqs schemes with affine
transition maps; the topological statement is proved by the same argument — compactness of the
constructible topology and descent of quasicompact openness to a finite index — not by restatement.
The argument: surjectivity of the limit follows from the fibres `f_i⁻¹(y_i)` being nonempty and
closed in `(X_i)_cons`, so their cofiltered limit is nonempty; if `f⁻¹(U)` is quasicompact open in
`X = lim X_i` then it is the pullback of a quasicompact open `V_i ⊆ X_i`, and `U`, being
constructible in `Y` by the argument of D0.11, is the pullback of a constructible `W_j ⊆ Y_j`; the
two constructible sets `V_k` and `f_k⁻¹(W_k)` of `X_k` have the same pullback to `X`, so they agree
on some `X_{k′}`, where `f_{k′}` being a spectral submersion makes `W_{k′}` open, hence `U` open.
The ordinary quotient-map property is not preserved: [Arc] §2, Rem. 2.18, pp. 13–14 supplies an
inverse system of ordinary submersions whose limit is not a submersion. *Needs:* D0.11 and
AdicSpacesPartII R0.19.6.

**Checks.**

- `s0_12_single_object` (degenerate case) — over a one-object index category the statement is that `f_i`
  is a spectral submersion.
- `s0_12_constant_system` — for constant systems with identity transitions the limit map is `f` itself.
- `s0_12_identity_system` — The identity on the constant Boolean tower limit fixes two distinct points; a constant map on that limit is not a spectral submersion.
- `s0_12_quotient_not_preserved` (non-example) — the system of [Arc] Rem. 2.18 consists of ordinary
  quotient maps whose limit is a spectral submersion but not a quotient map, so the conclusion
  cannot be strengthened to `Topology.IsQuotientMap`.

Lean: `isSpectralSubmersion_limMap`, on small cofiltered diagrams in Mathlib's `TopCat`, with
spectral transition maps.

### D0.13 Bounded pro-objects

The generic pro-category, its double-limit Hom formula, cofiltered limits and the equivalence of
spectral spaces with pro-objects in finite T₀ spaces are supplied by AdicSpacesPartII R0.19.9.
Suggested names `Pro.bounded` and `Pro.bounded_mk` below are relative to this roadmap.
PerfectoidSpaces P6.10 supplies the bounded pro-category: its `Suggested.lean` defines
`HasKappaSmallPresentation κ Z` (a cofiltered presentation of the pro-object `Z` of `(Ind Cᵒᵖ)ᵒᵖ`
with fewer than `κ` arrows, all arrows counted) and `PerfectoidSpace.ProKappa κ C`, the full
subcategory `Pro_κ(C)`, with `HasKappaSmallPresentation.of_diagram`. `Pro.bounded κ C`, if the name
is wanted here, is an abbreviation of `PerfectoidSpace.ProKappa κ C` and `Pro.bounded_mk` is
`HasKappaSmallPresentation.of_diagram`; no second presentation predicate or bounded pro-category is
defined. Bounding objects as well as arrows adds nothing: `i ↦ (i, i, 𝟙 i)` injects the objects into
the total arrow type, so fewer than `κ` arrows (with the universe lift of the supplier's statement)
already bounds the objects. The definition makes sense for any cardinal, while its cutoff-cardinal
applications take `IsCutoffCardinal κ`. PerfectoidSpaces P6.12 supplies `proFlatten`,
`proFlatten_adjunction` and `proFlatten_obj` for the bounded perfectoid applications; these use the
same generic pro-category carrier. *Needs:* AdicSpacesPartII R0.19.9; PerfectoidSpaces P6.10–P6.12;
D0.23 for cutoff applications.

**`Pro.bounded` — Checks.**

- `bounded_finite_constant` — a constant finite-set pro-object has a presentation with fewer
  than `ℵ₀` objects and arrows, including the empty finite set.
- `bounded_zero` — the bound zero admits no presentation.
- `bounded_one` — the strict bound one also admits no presentation: a cofiltered category
  has an object and its identity arrow.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.14 Ordinal assembly of cofiltered limits

**Ordinal assembly of cofiltered limits.** (*ordinal-assembly-of-cofiltered-diagrams*) Let `I` be a
small cofiltered category with a chosen enumeration of its objects and arrows. If `I` has
uncountably many objects and arrows, of cardinality `λ`, prove that `I` is an increasing union of
cofiltered subcategories `I_α` (`α < λ`), each of cardinality at most `max(ℵ₀, |α|)`, obtained by
closing the enumeration under identities, compositions and finite cones — subcategories, not
necessarily full ones. For a countable cofiltered category construct instead a cofinal sequence of
cone choices. For any diagram `F` with the indicated limits prove `lim_I F ≅ lim_α lim_{I_α} F`.
This is cardinal induction via ordinal chains of subdiagrams, not the false claim that every
cofiltered category admits a cofinal ordinal chain: the chain of subcategories is not claimed to be
cofinal in `I`. Closing under finite cones includes equalizers of parallel arrows as well as cones
over pairs of objects, and the closure is iterated countably many times at each step to keep the
cardinal bound. The closure of a chosen family of objects and arrows under finite cones and
equalizers to a small cofiltered subcategory is Mathlib's `IsCofiltered.cofilteredClosure` with
`small_fullSubcategory_cofilteredClosure` and `SmallCofilteredIntermediate`; the cardinal bound, the
ordinal chain and the limit comparison are new. Define `Cofiltered.ordinalAssembly` as the
enumerated increasing family of small cofiltered subcategories covering all objects and arrows;
prove `Cofiltered.ordinalAssembly_cardinal` (for an uncountable well-ordered index whose
proper initial segments have smaller cardinality, the number of objects plus arrows at stage `a`
is at most `max(ℵ₀, |Iio a|)` and strictly less than the index cardinality, without a regularity
hypothesis) and `Cofiltered.ordinalAssemblyIsLimit` (the limit over `I` is the ordinal limit of
the subdiagram limits) ([ECD] §11, proofs of Lem. 11.22 and Prop. 11.23, pp. 63–64; [ECD] §12, proof
of Lem. 12.17, pp. 73–74; the source compresses these reductions to ordinal diagrams, and the
explicit derivation by unions of cofiltered subcategories is given here). *Needs:* Mathlib
`CategoryTheory.IsCofiltered`, `IsCofiltered.cofilteredClosure`, `CategoryTheory.Limits.HasLimits`,
`Ordinal`.

**Checks.**

- `s0_14_ordinal_countable_sequence` — The chosen sequence on `ℕᵒᵖ` takes stage two to two, distinct from its value at stage zero.
- `s0_14_ordinal_terminal_diagram` — For a cofiltered ambient category, the assembly cone of the constant Boolean diagram has a two-element vertex.
- `ordinalAssemblyIsLimit_point` — a cone over the constant point diagram has a unique lift to the ambient limit.
- `ordinalAssemblyIsLimit_residue_leg` — for the residue tower `ℤ/2ⁿ`, the identity assembly has the identity restriction leg, and the limiting-cone lift fixes it.
- `s0_14_ordinal_union_cones` — For the cone of constant Boolean sections on every stage, the specified limiting lift has ambient coordinate `true` on `true` and `false` on `false`.

The suggested Lean carrier `Cofiltered.Assembly` records faithful inclusions injective on objects,
transition functors commuting with those inclusions, identity and composition equations, coverage of
every ambient object and arrow, and the bound on the sum of object and arrow cardinalities.
`Cofiltered.ordinalAssembly` constructs it for an uncountable well-ordered index whose proper
initial segments have smaller cardinality; `Cofiltered.countableSequence` handles the countable
case. `stageLimits_map_π` specifies each transition on cone legs, and `ordinalAssemblyIsLimit`
proves that `assemblyCone`, with legs `limit.pre`, is limiting.

**`Assembly`.** The stages cover objects and arrows and fit together by inclusion.

**Checks.**

- `definition_Assembly_1` — A singleton cofiltered category has an assembly indexed by one stage.
- `definition_Assembly_2` — For the opposite of the ordinal `ω₁`, the family whose every stage is
  the whole category covers all objects and arrows but violates the cardinality bound at the first
  stage, which allows at most `ℵ₀` objects and arrows.
- `definition_Assembly_3` — Two disconnected objects cannot be covered by a single cofiltered stage.

**`Cofiltered.countableSequence`.** An initial sequence must reach arbitrarily late stages; on the reversed natural-number category, `Cofiltered.countableSequence_nat` fixes the choice to the identity sequence.

**Checks.**

- `Cofiltered_countableSequence_unbounded` — For the reversed natural numbers, every stage `m` is
  the value of the selected sequence at some index; the eventually constant sequence `n ↦ min n 5`
  fails this.
- `Cofiltered_countableSequence_two` — For the reversed natural numbers, the selected sequence takes
  stage 2 to 2, whereas the also unbounded sequence `n ↦ ⌊n/2⌋` takes it to 1.
- `Cofiltered_countableSequence_one_not_zero` — Stage 1 is not 0, excluding the constant zero sequence.

**`Cofiltered.stageLimits`.** The stage-limit transition restricts a compatible family without changing its values.

**Checks.**

- `Cofiltered_stageLimits_bool_card` — A constant Bool diagram has a two-element limit at every cofiltered stage.
- `Cofiltered_stageLimits_point_unique` — A constant point diagram has a unique limit at each stage.
- `Cofiltered_stageLimits_true_not_false` — A restriction transition cannot turn a true coordinate into false.

**`Cofiltered.assemblyCone`.** The assembly cone restricts the ambient compatible family to each stage.

**Checks.**

- `Cofiltered_assemblyCone_coordinate_two` — A coordinate with value 2 in the ambient constant-natural-number limit still has value 2 after restriction.
- `Cofiltered_assemblyCone_point_coordinate` — For a constant point diagram every restricted coordinate is the unique point.
- `Cofiltered_assemblyCone_true_not_false` — Restriction does not change an ambient true coordinate to false.

**`Cofiltered.ordinalAssembly`.** When the original category and its arrows are countable, choose the whole category at each stage; the general construction still closes the enumeration under finite cones.

**Checks.**

- `Cofiltered_ordinalAssembly_naturals_identity` — For the reversed natural-number tower every stage inclusion is the identity functor.
- `Cofiltered_ordinalAssembly_terminal_identity` — The terminal category is retained unchanged at every stage.
- `Cofiltered_ordinalAssembly_naturals_not_constant` — The inclusion for the natural-number tower is not the constant functor at zero.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.15 Hochster realization

**Hochster realization: every spectral space is the prime spectrum of a ring.**
(*hochster-realization*) Let `X` be a topological space. Prove that the following are equivalent:
`X` is spectral; there is a commutative ring `A` with `X` homeomorphic to `Spec A`; `X` is an
inverse limit of finite T0 spaces ([ECD] §2, Thm 2.2, p. 10, stated there without proof and
attributed to Hochster). Mathlib's spectral-space instance on `Spec A` gives one implication; the
inverse-limit implication is the cheap one and is shared with AdicSpacesPartII R0.19.9; the
ring-realization direction is a separate construction that exhibits an actual commutative ring and
identifies its primes and topology, not a representation axiom — the finite-T0 presentation alone
does not furnish that ring, and finite commutative rings, whose spectra are discrete, cannot realize
arbitrary finite T0 spaces. The construction produces `Spec` of a field as a point and `Spec` of a
discrete valuation ring as the Sierpiński space, and the two-point non-discrete space is realized by
no finite ring. ECD uses the theorem only through the equivalence with `Pro(finite T0 spaces)`, so
the inverse-limit half alone already serves [ECD] §§7–13. The equivalence of the first two
conditions is `spectralSpace_iff_nonempty_homeomorph_primeSpectrum`. *Needs:* AdicSpacesPartII
R0.19.9; Mathlib `PrimeSpectrum`, `SpectralSpace`, `PrimeSpectrum.comap`,
`PrimeSpectrum.localization_comap_range`.

**Checks.**

- `s0_15_empty_and_point` (degenerate cases) — the empty space is `Spec` of the zero ring and a point is
  `Spec` of a field.
- `s0_15_sierpinski` — the Sierpiński space is `Spec` of a discrete valuation ring (generic point open);
  it is realized by no finite ring, since a finite ring is Artinian and its spectrum is discrete.
- `s0_15_two_point_discrete` — the two-point discrete space is `Spec(k × k)`; the inverse-limit
  presentation of a finite T0 space is the constant one.
- `s0_15_inverse_limit_does_not_give_the_ring` (non-example) — the presentation of `X` as `lim X_i` of
  finite T0 spaces does not produce a ring with spectrum `X` by taking `Spec` of a limit of rings,
  since `Spec` does not commute with limits of rings: `lim Spec(ℤ/pⁱℤ)` is a point while `Spec(ℤ_p)`
  has two points.

**`HochsterRealization`.** The realization identifies the entire prime spectrum with the input topology.

**Checks.**

- `definition_HochsterRealization_1` — For ℤₚ the prime spectrum has two points and gives a
  realization of itself.
- `definition_HochsterRealization_2` — Every realization of the empty space uses the zero ring.
- `definition_HochsterRealization_3` — A finite ring cannot realize the two-point specialization
  chain.

**`hochsterRealization`.** Any choice of realization must preserve the spectrum, including its specialization order.

**Checks.**

- `definition_hochsterRealization_1` — The chosen realization of the point is the two-element field, with its cardinality computed.
- `definition_hochsterRealization_2` — The chosen realization of the empty space is the zero ring.
- `definition_hochsterRealization_3` — The point is not realized by the three-element field under this choice; the bare existence contract would allow it.

Lean: `spectralSpace_iff_nonempty_homeomorph_primeSpectrum`. The Checks are specified in prose;
the remaining constructions are specified in the README only.

### D0.16 Profinite presentations of compact Hausdorff spaces

**Profinite presentations of compact Hausdorff spaces and extremally disconnected covers.**
(*profinite-presentation-of-compact-hausdorff*) Let `T` be compact Hausdorff. Its presentation by a
profinite set is Mathlib's `CompHaus.projectivePresentation T`: the Stone–Čech compactification
`Ultrafilter T` of the underlying discrete set of `T`, extremally disconnected (`Stonean`, hence
profinite through `CompHaus.toProfinite`), with an epimorphism `S → T`, surjective by
`CompHaus.epi_iff_surjective`, a quotient map by `Continuous.isClosedMap` with
`Topology.IsClosedMap.isQuotientMap`, and an effective epimorphism by `CompHaus.effectiveEpi_tfae`,
so that `T` is the coequalizer of the two projections of `S ×_T S` in compact Hausdorff spaces; the
induced equivalence relation `S ×_T S = {(s, s') | f s = f s'}` is closed in `S × S` by
`isClosed_eq` because `T` is Hausdorff, and totally disconnected as a subspace of a product of
profinite sets, hence profinite. Consequently every compact Hausdorff space is a quotient of a
profinite set by a profinite equivalence relation ([ECD] §2, Rem. 2.8, p. 12; [ECD] §11, Ex. 11.12,
p. 58, where the same construction embeds compact Hausdorff spaces into diamonds); none of this is
restated. Prove the converse, `t2Space_quotient_of_isClosed`: the quotient of a compact Hausdorff
space, in particular of a profinite set, by a closed equivalence relation is Hausdorff, hence
compact Hausdorff — compactness is Mathlib's `Quotient.compactSpace`, and the Hausdorffness of the
quotient is the one lemma of this subsection (Mathlib's `t2Space_iff_of_isOpenQuotientMap` needs an
open quotient map, which the projection to the quotient need not be, and `T2Quotient` is the
universal Hausdorff quotient, not this criterion). *Needs:* Mathlib
`CompHaus.projectivePresentation`, `CompHaus.epi_iff_surjective`, `CompHaus.effectiveEpi_tfae`,
`CompHaus.toProfinite`, `Continuous.isClosedMap`, `Topology.IsClosedMap.isQuotientMap`,
`isClosed_eq`, `Quotient.compactSpace`, `Profinite`.

**Checks.**

- `s0_16_interval` — the unit interval `[0, 1]` is the quotient of the profinite set
  `Ultrafilter [0, 1]` by the closed relation `S ×_T S`, and `t2Space_quotient_of_isClosed` makes
  the quotient the compact Hausdorff space `[0, 1]`.
- `s0_16_not_every_quotient_is_profinite` (non-example) — the quotient of a profinite set by a closed
  equivalence relation is in general only compact Hausdorff. For the binary-expansion surjection
  from the Cantor space `{0, 1}^ℕ` onto `[0, 1]`, the kernel relation is closed in the profinite
  product, hence is itself profinite. Its quotient `[0, 1]` is connected with distinct endpoints,
  so is not profinite ([ECD] Rem. 2.8).
- `s0_16_empty_and_point` (degenerate cases) — the quotient of the empty profinite set by the empty
  relation is `∅`, and the quotient of a point by the diagonal is a point; both are compact
  Hausdorff.
- `s0_16_closed_relation_needed` (non-example) — `ℤ_p` modulo the orbit relation of translation by
  `ℤ`, which is not closed since `ℤ` is dense in `ℤ_p`, is an indiscrete space with uncountably many
  points (the dense-orbit computation of D5.16), so not Hausdorff: closedness of the relation cannot
  be dropped.

Lean: `t2Space_quotient_of_isClosed`; the Check `s0_16_closed_relation_needed` is specified in prose.
The remaining constructions are specified in the README only.

### D0.18 Filtered colimits and cohomology on algebraic topoi

**Filtered colimits of abelian sheaves and their cohomology on an algebraic topos.**
(*filtered-colimits-and-cohomology-on-coherent-sites*) This is the algebraic-topos case of
SchemeAndStackFoundations §2.5, which owns the theorem that cohomology on a coherent site commutes
with filtered colimits (its target `cohomology_filtered_colimits`, Stacks 0737); the theorem is
consumed here and not reproved. Comparison: let `(C, J)` be a site with a generating full
subcategory of qcqs objects stable under fibre products whose maps to the terminal object are
quasiseparated, so that its category of sheaves is algebraic (AdicSpacesPartII R0.19.10); it is the
topos of sheaves on the site of those generating objects with finite covering families, a coherent
site in the sense of §2.5. Prove that for a filtered diagram of abelian sheaves `F_j` the colimit is
computed sectionwise on qcqs objects, and that for every qcqs object `X` and every `i` the natural
map `colim_j Hⁱ(X, F_j) → Hⁱ(X, colim_j F_j)` is §2.5's isomorphism; the same holds for sheaves of
sets in degree 0 and for sheaves of groups in degrees 0 and 1, the degree-one torsor classes being
those of SchemeAndStackFoundations §2.3 (`NonabelianH1`) ([ECD] §8, proof of Prop. 8.2, pp. 39–40,
the exact form and degree ranges ECD needs, and the mechanism by which Prop. 8.2 shows that
cohomology does not depend on the cutoff cardinal; [SGA 4 VI] Exp. VI §5, Cor. 5.2 and Lem. 5.4,
transcription pp. 167–168 (PDF pp. 173–174), the original marginal pagination being separate, where
the result is proved by finite-cover Čech acyclicity and exact filtered colimits and not asserted
for every topological site). Both hypotheses on `X` are needed: quasicompactness for degree zero —
an infinite disjoint union of points is a non-example — and quasiseparatedness to control the Čech
terms, which is why the Čech-to-cohomology spectral sequence of SchemeAndStackFoundations §2.2
(`cech_to_cohomology`, cited in D0.19) is an input ([ECD] §8, proof of Prop. 8.2, p. 40). On a
coherent site — every object qcqs, finite coverings cofinal — the abelian statement in every degree
is SchemeAndStackFoundations §2.5; it is used here with the hypothesis that the site has a
generating full subcategory of qcqs objects stable under fibre products, and the content of this
subsection is the reduction of the qcqs objects of an algebraic topos to that coherent generating
site, together with the sectionwise-colimit clause and the set- and group-valued low-degree clauses.
Mathlib has the abelian structure on sheaves, exactness of sheafification and the Ext-theoretic
definition of sheaf cohomology. The coherent-site comparison is the supplier target
`cohomology_filtered_colimits` in SchemeAndStackFoundations §2.5. Its algebraic-topos consequence on
arbitrary qcqs sheaves is `Topos.cohomology_preservesFilteredColimits`: use Mathlib's
`Abelian.extFunctor` from the free abelian sheaf generated by `X`. This states preservation by the
cohomology functor, hence invertibility of the canonical colimit comparison in every degree.
`Topos.abelianSections_preservesFilteredColimits` gives the abelian sectionwise clause using
`preadditiveCoyoneda` from the same free abelian sheaf;
`Topos.groupSections_preservesFilteredColimits` gives the group-valued degree-zero clause after
forgetting to sets. All three require `TauCetiRoadmap.AdicSpacesPartII.Topos.IsAlgebraic J` and
object quasicompactness and quasiseparatedness of `X`, not merely a quasicompact map to the terminal
object. Abelian statements assume sheafification, and cohomology also assumes `HasExt`. For degree
one, `Topos.groupH1_preservesFilteredColimits` uses the torsor classes `Topos.groupH1 J X` under the
same geometric hypotheses; these are §2.3's `NonabelianH1` of the site, and no second torsor-class
construction is made here. On an algebraic topos they are computed as follows, which is the
description the Checks use. `Topos.classifyingPrestack J G` is the prestack of one-object groupoids
of the sections of `G`, and `Topos.classifyingMap J f` is given by the homomorphisms on their
arrows; `Topos.classifyingMap_naturality` fixes the restriction constraint as the identity. The
functor `Topos.groupH1 J X` takes isomorphism classes of maps from the discrete stack of `X` to the
stackification of this prestack, stackification being that of SchemeAndStackFoundations §1.18
(D0.25). Its coefficient maps are extension of structure group: `Topos.groupH1_map` identifies them
with postcomposition by any map of classifying stacks compatible with the stackification units. Thus
the comparison uses the induced maps, not an arbitrary bijection of the torsor-class sets. The
non-surjective direct-sum-to-product Check below records why quasicompactness is necessary. *Needs:*
AdicSpacesPartII R0.19.10; SchemeAndStackFoundations §2.5 (`cohomology_filtered_colimits`), §2.3
(`NonabelianH1`) and §2.2 (`cech_to_cohomology`); Mathlib `CategoryTheory.sheafIsAbelian`,
`CategoryTheory.presheafToSheaf`, `CategoryTheory.Sheaf.cohomologyPresheaf`,
`CategoryTheory.IsFiltered`, `CategoryTheory.Limits.HasFilteredColimits`.

**Checks.**

- `s0_18_infinite_disjoint_union_of_points` (non-example) — on the discrete space `ℕ`, which is not
  quasicompact, take the filtered system of sheaves `F_j` with `F_j(n) = ℤ` for `n ≤ j` and `0`
  otherwise, with the evident inclusions: `colim_j H⁰(ℕ, F_j) = ⊕_ℕ ℤ` and
  `H⁰(ℕ, colim_j F_j) = ∏_ℕ ℤ`, and the comparison map is the non-surjective inclusion `⊕ ℤ → ∏ ℤ`;
  the degree-zero statement fails without quasicompactness.
- `s0_18_Sheaf_H_prime_point_zmod_two` — For the constant `ℤ/2ℤ` sheaf on a point, `H⁰` has two
  elements over the whole space and one over the empty open.
- `s0_18_Sheaf_H_prime_empty_subsingleton` — For every abelian sheaf `F` and degree `i`,
  `Hⁱ(∅, F)` is the zero group.
- `s0_18_spectral_space` — for sheaves on a spectral space every quasicompact open is qcqs and the
  terminal object is qcqs, so the comparison holds for `Hⁱ(U, −)` on every quasicompact open `U`.

`Topos.sections_preservesFilteredColimits` states the set-valued sectionwise comparison as
preservation of filtered colimits by `Hom(X, −)` for a qcqs object of an algebraic sheaf topos.

**`Topos.classifyingPrestack` — Checks.**

- `classifyingPrestack_automorphisms` — the automorphisms of its sole object over `U`
  are the elements of `G(U)`.
- `classifyingPrestack_one_object` — every fibre has exactly one object, even for the trivial group.
- `classifyingPrestack_nontrivial` — a nontrivial section group gives nontrivial automorphisms;
  the one-object groupoid is not made discrete.

**`Topos.classifyingMap` — Checks.**

- `classifyingMap_element` — an arrow `g` maps to `f_U(g)`.
- `classifyingMap_identity` — the identity homomorphism induces the identity fibre functor.
- `classifyingMap_nontrivial` — an element with nonidentity image does not map to an identity arrow.

**`Topos.groupH1` — Checks.**

- `groupH1_point` — a group sheaf on the point site has exactly one torsor class over the point.
- `groupH1_empty` — over the initial sheaf there is exactly one torsor class.
- `groupH1_circle` — the constant group `ℤ/2ℤ` on the circle has two torsor classes, so
  stackification is essential even though every fibre of the classifying prestack has one object.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.19 Čech-to-derived, Leray and the acyclic-basis comparison

**Čech-to-derived, Leray and the acyclic-basis comparison on the sites of D2.** The Čech-to-derived
spectral sequence of a cover of an object with coefficients in an abelian sheaf, the higher direct
images and the Leray spectral sequence `H^p(X, R^q f_* F) ⇒ H^{p+q}(Y, F)` of a morphism of topoi
with its bounded-below relative form, and the comparison of Čech cohomology on a basis of acyclic
objects with sheaf cohomology are SchemeAndStackFoundations §§2.1–2.2 (`cech_to_cohomology`, [Stacks
Leray] §21.10, Tag 03AV, Lemmas 21.10.1–21.10.7 and Leray's acyclicity theorem;
`leray_spectral_sequence`, [Stacks Leray] Lem. 21.14.5 (0732) and Lem. 21.14.7 (0734)), stated there
for sites in general although that roadmap's standing conventions are schemes with the fppf
topology; they are used here on the sites of D2 — the big pro-étale and v-sites on `Perfd` and the
small pro-étale site of a perfectoid space — with the hypotheses of [ECD] §8: a cover of an object
and an abelian sheaf for the Čech sequence; a morphism of topoi, whose exact inverse image makes the
direct image preserve injectives (a continuous site functor alone is insufficient), for Leray; and
for the acyclic-basis comparison a basis `B` on which `F` is acyclic, with cofinal covering
refinements whose finite Čech fibre products lie in `B`. Closure under fibre products of diagrams
within a generating subcategory does not ensure this condition over an arbitrary target ([ECD]
§8, Prop. 8.3, p. 41, Prop. 8.5(iii) and its proof, pp. 41–42, and proof of Prop. 8.8, p. 43).
Comparison: the maps used in D2 (`ν : X_proét → X_ét`, the passage
from the v-site to the pro-étale site, change of cutoff) are morphisms of sites with exact inverse
image, so §2.1's higher direct images and §2.2's spectral sequences apply to them without change.
Owned here is the basis verification on the D2 sites sliced over an affinoid perfectoid `X₀`:
covers of affinoid objects admit affinoid refinements, and finite fibre products of these affinoids
over their affinoid target remain affinoid. The supplied acyclic-basis comparison applies on these
slices once D2.5 and D2.8 give acyclicity for `O` and almost acyclicity for `O⁺`, the latter in the
almost category for a pseudouniformizer on `X₀`. For an arbitrary perfectoid target, use the general
Čech-to-derived spectral sequence with all its intersection terms; those terms can be nonaffinoid,
so their higher cohomology cannot be discarded merely because the covering charts are affinoid
([Stacks Leray] Tags 03AV, 0732, 0734). Nothing else is
restated here; D0.18, D0.21, D2.3, D2.5, D2.8 and D5.15 cite those supplier targets of
SchemeAndStackFoundations §§2.1–2.2 through this subsection.

**Checks.**

- `s0_19_affinoid_basis` — over an affinoid perfectoid `X₀`, an affinoid covering refinement has
  affinoid finite Čech terms, satisfying the geometric hypotheses of the acyclic-basis comparison.
- `s0_19_affinoid_acyclic_terms` — for an affinoid cover of an affinoid target, D2.5 and D2.8 make the
  positive-degree cohomology of every Čech term vanish for `O` and almost vanish for `O⁺`; the
  comparison computes target cohomology in the respective coefficient categories.
- `s0_19_nonaffinoid_overlap` — glue two perfectoid closed discs along their open unit disc
  `W = {|T| < 1}`. The two affinoid charts cover the resulting perfectoid space, but their
  intersection is the non-quasicompact `W` of D2.4, hence is not affinoid. The general spectral
  sequence includes `H^q(W, F)`; affinoid acyclicity alone does not eliminate these terms.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.20 Flasque constant sheaves

**Flasque constant sheaves.** (*constant-sheaf-on-irreducible-space*) Let `X` be an irreducible
topological space and `A` an abelian group. Prove that the constant sheaf `A_X` has sections `A` on
every nonempty open and the zero group on the empty open, and that all restriction maps are
surjective, so `A_X` is flasque in the sense of Mathlib's `TopCat.Presheaf.IsFlasque` ([Stacks
constant sheaves] proof of Lem. 20.20.2, Tag 02UW); the vanishing `Hⁱ(X, A_X) = 0` for `i > 0`
then follows from Tau Ceti's `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, the acyclicity of
every flasque sheaf of abelian groups on a space, and Čech vanishing for flasque sheaves is the
supplier target in SchemeAndStackFoundations §2.5 (`flasque_cech_vanishing`); neither
is restated: the Lean statement `isFlasque_constantSheaf` carries the flasqueness clause, and the
vanishing clause is only its composite with that Tau Ceti lemma. A spectral space with a generic
point is such an `X`, which is how the fibres with a generic point in [ECD] 13.13 are handled.
Irreducibility is used for the value `A` on nonempty opens: every nonempty open of an irreducible
space is connected. `constantSheaf_sections_of_irreducibleSpace` states the abelian-group
isomorphism on each nonempty open; `isZero_constantSheaf_empty` states that the empty-open value is
zero, for every space. Both use Mathlib's constant sheaf and assume its sheafification instance.
`isFlasque_constantSheaf` is the flasqueness theorem. *Needs:* Mathlib `TopCat.Presheaf.IsFlasque`,
`CategoryTheory.Sheaf.cohomologyPresheaf`; Tau Ceti
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

**Checks.**

- `s0_20_spec_dvr` — for `X = Spec` of a discrete valuation ring the sections are `A` on `{η}` and on `X`,
  `0` on `∅`, the restriction `A_X(X) → A_X({η})` is the identity, and `Hⁱ(X, A_X) = 0` for `i > 0`.
- `s0_20_two_point_discrete` (non-example for the value) — on the two-point discrete space, which is not
  irreducible, `A_X(X) = A × A`; for `A = ℤ`, the map from constant values `A → A × A` misses `(0,1)`;
  the sheaf is still flasque and acyclic, so flasqueness does not need irreducibility, but the value
  `A` on every nonempty open does.
- `s0_20_circle` (non-example for flasqueness) — on the circle `S¹` the constant sheaf `ℤ` is not flasque
  (the restriction from `S¹` to the disjoint union of two arcs is `ℤ → ℤ × ℤ`, not surjective) and
  `H¹(S¹, ℤ) = ℤ ≠ 0`: both conclusions fail without irreducibility.
- `s0_20_zero_group` (degenerate case) — for `A = 0` the sheaf is the zero sheaf on every space and the
  statement is trivially true, so the non-examples use `A ≠ 0`.

Lean: `isFlasque_constantSheaf`. The rest of this subsection is specified in the README only (no
Lean declaration).

### D0.21 Cohomology of limits of coherent topoi

**Cohomology of limits of coherent topoi.** (*coherent-topos-limit-cohomology*) Let `(E_i)` be a
small cofiltered diagram of coherent topoi with coherent transition morphisms, `E` its topos limit
and `p_i : E → E_i` the projections. Fix `i` and an abelian sheaf `F_i` on `E_i`, and put
`F = p_i^* F_i`. Prove that for every `n ≥ 0` the canonical map
`colim_{j → i} Hⁿ(E_j, p_{ji}^* F_i) → Hⁿ(E, F)` is an isomorphism, and more generally the same for
compatible filtered systems of sheaves ([SGA 4 VI] Exp. VI §8.7.1 (hypotheses), Theorem 8.7.3 and
Corollary 8.7.7, transcription pp. 223–225 (PDF pp. 229–231), the original marginal pagination being
separate; the hypotheses are exactly those of 8.7.1–8.7.7, and no theorem about arbitrary topos
limits is asserted). Coherence supplies the filtered-colimit compatibility of derived direct images
that VI 8.7.1 requires. The consumer is [ECD] §14, proof of Prop. 14.9, p. 86. *Needs:*
AdicSpacesPartII R0.19.10 and D0.18; SchemeAndStackFoundations §2.2 (`leray_spectral_sequence`,
cited in D0.19).

Use `Topos.CoherentToposLimit` to specify the limit on abelian sheaves. Its pseudofunctor records
direct images, with stage equivalences to `Sheaf J_i AddCommGrpCat`. Each transition has an exact
left adjoint induced by a left exact left adjoint on set sheaves that preserves qcqs objects. Each
stage satisfies `TauCetiRoadmap.AdicSpacesPartII.Topos.IsAlgebraic`, with qcqs terminal object.
`Topos.directImageSections` is the category of pseudonatural sections of this diagram;
`Topos.directImageEvaluation` evaluates a section at one stage. An equivalence from the abelian
sheaves of the limit site to these sections fixes the limit, and adjunctions to evaluation fix its
projection inverse images. This description is SGA 4 VI Thm. 8.2.9 and Rem. 8.2.10, transcription
pp. 204–206 (PDF pp. 210–212). The integral constant-sheaf isomorphisms and their compatibility with
the projection composition isomorphisms specify the maps on Ext.

Prove `Topos.coherent_limit_cohomology`. A compatible coefficient system is an oplax
section of the direct-image diagram; its naturality maps, transported through the
transition adjunctions, specify the coefficient transition maps. The diagram of their
pullbacks to the limit and the diagram of stage cohomology must use these maps.
The theorem supplies a colimit cone whose vertex is isomorphic to the cohomology of
the colimit coefficient sheaf, with every leg equal to pullback on Ext followed by
the coefficient colimit inclusion. It assumes sheafification and `HasExt` at the stages
and the limit. The fixed-stage formula is its application to `Over i` and the inverse
images of `F_i`; the general formula allows noninvertible coefficient transition maps.
The coherent case uses SGA 4 VI 8.7.8, transcription p. 226 (PDF p. 232), in addition
to §8.7.1, Theorem 8.7.3 and Corollary 8.7.7.

**`Topos.directImageSections` — Checks.**

- `directImageSections_point` — a one-stage diagram with discrete Boolean fibre has section
  category equivalent to that fibre.
- `directImageSections_empty` — a one-stage diagram with empty fibre has no section.
- `directImageSections_automorphisms` — a one-stage integer groupoid retains its automorphisms
  in the section category; sections are not just isomorphism classes.

**`Topos.directImageEvaluation` — Checks.**

- `directImageEvaluation_value` — evaluation takes the section's specified object at the stage.
- `directImageEvaluation_identity` — evaluation sends an identity modification to the identity.
- `directImageEvaluation_distinct` — modifications with different components at a stage remain
  different after evaluating there.

**`Topos.CoherentToposLimit` — Checks.**

- `CoherentToposLimit_point` — the constant one-stage diagram of the point topos is admitted.
- `CoherentToposLimit_empty` — the one-stage empty-space topos is admitted, with zero abelian sheaves.
- `CoherentToposLimit_noncoherent` — the topos of the real line is excluded already by the
  stage algebraicity requirement.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.22 Ordinary sheaves on profinite sets

**Ordinary sheaves on profinite sets.** (*ordinary-sheaves-on-profinite-sets*) Let `S` be a
profinite set and take ordinary `Set`- or `Ab`-valued coefficients. Prove that sheaves on `S` are
equivalent to contravariant functors on the Boolean algebra of clopens of `S` sending the empty set
to the terminal object and finite disjoint unions to products. For `S = βI` with `I` discrete,
clopens identify with subsets of `I`; for a family of sets or abelian groups `A_i` the sheaf
`J ↦ ∏_{i ∈ J} A_i` has stalk at an ultrafilter `U` equal to `colim_{J ∈ U} ∏_{i ∈ J} A_i`, the
ordinary ultraproduct of partial sections. For sets with every factor inhabited, or for abelian
groups, this is Mathlib's `Filter.Product U A`; the inhabitedness hypothesis cannot be omitted for
sets. Stalk isomorphisms detect sheaf isomorphisms, which on a space is Mathlib's
`TopCat.Presheaf.isIso_of_stalkFunctor_map_iso` — the clopen-functor description of sheaves on one
profinite set is the new content ([Arc] §3, Prop. 3.10, Ex. 3.12, Constr. 3.13, Lem. 3.14 and Def.
3.15, pp. 18–20, specialised to ordinary `Set`/`Ab`: Construction 3.13 gives the ultrafilter stalk
formula, and Example 3.12 and Definition 3.15 identify the product sheaf and the ultraproduct). No
infinity-categorical extension or hypercompletion theorem is asserted; ordinary stalk conservativity
needs no hypercompletion input. *Needs:* D0.16; Mathlib `StoneCech`, `Profinite`,
`CategoryTheory.Sheaf`, `Filter.Product`, `TopCat.Presheaf.isIso_of_stalkFunctor_map_iso`.

**Checks.**

- `s0_22_finite_discrete` (degenerate case) — for `S` finite discrete the clopens are all subsets, the
  functors are determined by their values on singletons, and sheaves are families of sets or abelian
  groups indexed by `S`; for `S` a point a sheaf is a single set or group, and for `S = ∅` the only
  sheaf is the terminal one.
- `s0_22_principal_ultrafilter` — for `S = βI` and `U` the principal ultrafilter at `i ∈ I`, the stalk of
  `J ↦ ∏_{j ∈ J} A_j` is `colim_{J ∋ i} ∏_{j ∈ J} A_j = A_i`, the ordinary ultraproduct along a
  principal ultrafilter being the factor itself.
- `s0_22_nonprincipal_ultrafilter` (non-example for the naive stalk) — for `A_j = ℤ/jℤ` and `U` a
  nonprincipal ultrafilter on `I = ℕ_{≥ 1}` the stalk is the ultraproduct `∏_U ℤ/jℤ`, which is
  uncountable and in particular is not any single `A_j`.

**Clopen and ultrafilter interfaces.** `ClopenSheaves.DisjointDescent` requires a terminal
value at the empty clopen and an isomorphism from the value on a disjoint union to the product,
using the two restriction maps. `ClopenSheaves.equivalence` identifies these functors with
ordinary sheaves, for sets or abelian groups, through `ClopenSheaves.functor`;
`equivalenceObjIso` compares evaluation on the same clopen viewed as an open. `PartialSection` consists of an ultrafilter-large domain and
values on that domain; `partialSectionSetoid` identifies sections agreeing on an ultrafilter-large
subset, and `UltrafilterStalk` is its quotient. `productPresheaf` takes an open of `βI` to the
product over principal points it contains, with restriction by forgetting factors.
`productPresheaf_isSheaf` and `ultrafilterStalkEquiv` supply the sheaf and its stalk comparison;
`ultrafilterStalkEquivProduct` assumes every factor inhabited. These are the ordinary
set-valued form of [Arc] Construction 3.13; abelian groups are automatically inhabited.

**Checks.**

- `clopen_empty` — the constant singleton functor satisfies finite disjoint descent.
- `clopen_nonterminal_constant` — the constant two-element functor fails already at the empty
  clopen, including when the underlying profinite space is empty.
- `finite_discrete` (the example `s0_22_finite_discrete`) — on a finite discrete space, sheaves of sets are precisely families of
  sets; the comparison is the category of functors from the discrete index category.
- `stalk_empty_away` — over the principal ultrafilter at `true` on `Bool`, the family with
  singleton factor at `true` and empty factor at `false` has a nonempty stalk; its full-product
  `Filter.Product` is empty.
- `stalk_empty_factor` — the same family's stalk at `false` is empty.
- `stalk_constant_point` — a family of singleton sets has a singleton stalk at every ultrafilter.

**`DisjointDescent`.** The empty clopen value participates in finite disjoint descent.

**Checks.**

- `definition_DisjointDescent_1` — The constant singleton presheaf on the discrete two-point
  profinite space satisfies disjoint descent.
- `definition_DisjointDescent_2` — The constant singleton presheaf satisfies disjoint descent even
  on the empty profinite space.
- `definition_DisjointDescent_3` — The constant two-element presheaf fails the empty-value
  condition.

**`PartialSection`.** Partial sections may omit empty factors away from the ultrafilter.

**Checks.**

- `definition_PartialSection_1` — At the principal ultrafilter at true, a singleton domain supports
  a section even when the false factor is empty.
- `definition_PartialSection_2` — At a principal point, an empty selected factor forbids every
  partial section.
- `definition_PartialSection_3` — The domain cannot be empty, even for the singleton family.

**`partialSectionSetoid`.** Germ equality ignores values away from the ultrafilter.

**Checks.**

- `definition_partialSectionSetoid_1` — At the principal ultrafilter at true, sections on the full
  two-point set agree exactly when their true values agree.
- `definition_partialSectionSetoid_2` — For singleton factors all partial sections have the same
  germ.
- `definition_partialSectionSetoid_3` — The constant false and constant true sections have distinct
  germs at a principal ultrafilter.

**`UltrafilterStalk`.** The stalk is formed from partial sections, including empty factors.

**Checks.**

- `definition_UltrafilterStalk_1` — The Boolean family at a principal ultrafilter has precisely two
  germs.
- `definition_UltrafilterStalk_2` — An empty selected factor gives an empty stalk.
- `definition_UltrafilterStalk_3` — An empty unselected factor does not make the stalk empty; the
  selected singleton gives one germ.

**`productPresheaf`.** Sections are products over the principal points in the open.

**Checks.**

- `definition_productPresheaf_1` — Two Boolean factors have four global sections.
- `definition_productPresheaf_2` — The empty open has exactly one section even for empty factors.
- `definition_productPresheaf_3` — An empty factor prevents a global section.

**`ClopenSheaves.ultrafilterStalkEquivProduct`.** The comparison extends a partial section without changing its ultrafilter germ.
For every index type `I`, ultrafilter `U`, family `A` with every `A i` nonempty,
and total section `f : ∀ i, A i`, `ClopenSheaves.ultrafilterStalkEquivProduct_total`
requires that the class of `(univ, f)` maps to the `Filter.Product U A` class of `f`.
Every partial section extends to a total section under these hypotheses, so this equation
determines the comparison also at nonprincipal ultrafilters ([Arc] §3, Construction 3.13,
p. 19, specialised to sets).

**Checks.**

- `ClopenSheaves_ultrafilterStalkEquivProduct_total_section` — A total Bool-valued section at the principal ultrafilter true maps to its full-product class.
- `ClopenSheaves_ultrafilterStalkEquivProduct_point_true` — With a one-point index and two-element fibre, the constant true section maps to the true product class.
- `ClopenSheaves_ultrafilterStalkEquivProduct_true_not_false` — At the principal ultrafilter true, the identity Bool section does not map to the constant false class.
- `ultrafilterStalkEquivProduct_natural_sequence` — For every ultrafilter on `ℕ`, including
  nonprincipal ones, the section `n ↦ n` maps to its own full-product class.

**`ClopenSheaves.ultrafilterStalkEquiv`.** The stalk comparison sends the germ of a product section to its partial-section class.
For every family `A : I → Type u`, ultrafilter `U`, open neighbourhood `V` of `U`,
and `s : (productPresheaf A).obj (op V)`, `ClopenSheaves.ultrafilterStalkEquiv_germ`
requires that `germ V U h s` maps to the class of `s` on `{i | pure i ∈ V}`.
This domain belongs to `U` by Mathlib's `Ultrafilter.tendsto_pure_self`; no factor
outside it needs to be inhabited. The equation fixes the comparison on every germ
([Arc] §3, Example 3.12 and Construction 3.13, p. 19, specialised to sets).

**Checks.**

- `ultrafilterStalkEquiv_bool_germ` — At the principal ultrafilter true, a global Bool section gives that section’s partial germ.
- `ultrafilterStalkEquiv_point_true` — With one index and a two-element fibre, the germ of true is the true partial-section class.
- `ultrafilterStalkEquiv_true_not_false` — At the principal ultrafilter true, the identity Bool section does not map to the false germ.
- `ultrafilterStalkEquiv_large_subset` — For any `J ∈ U`, the germ on the basic clopen
  `{F | J ∈ F}` maps to the partial section on `J`, even when factors outside `J` are empty.

**`ClopenSheaves.functor`.** For a profinite `S` and a coefficient category `A` with finite
products, restrict a sheaf by precomposition with the opposite of the inclusion
`Clopens.toOpens`. On sheaf morphisms use the same precomposition of natural transformations.
The resulting presheaf satisfies `DisjointDescent`. For `A` equivalent to `Type u` or
`AddCommGrpCat.{u}`, `ClopenSheaves.functor_isEquivalence` states that this specified functor
is an equivalence ([Arc] §3, Proposition 3.10, pp. 18–19, ordinary coefficients).

**Checks.**

- `functor_value` — Evaluation at every clopen is definitionally evaluation at its underlying open.
- `functor_restriction` — For every inclusion `U ≤ V`, the map from sections on `V` to sections
  on `U` is the original sheaf restriction, including restriction to the empty clopen.
- `functor_morphism` — The component of a restricted sheaf morphism at `U` is its original
  component at `U.toOpens`; sections cannot be permuted independently of that morphism.

**`ClopenSheaves.equivalence`.** Package `ClopenSheaves.functor` using
`Functor.asEquivalence` and `ClopenSheaves.functor_isEquivalence`. The forward functor is
restriction to the clopen basis, with the same values, restriction maps and morphism components.
`ClopenSheaves.equivalence_obj_eq` records its definitional equality on values for every
clopen of a profinite `S`, with finite products in `A` and the same coefficient hypothesis
([Arc] §3, Proposition 3.10).

**Checks.**

- `ClopenSheaves_equivalence_bool_sections` — A two-element set of sections on U is evaluated at that same U, with the resulting cardinality two.
- `ClopenSheaves_equivalence_empty_clopen` — Restriction on the empty clopen keeps the original empty-open value and its unique section.
- `ClopenSheaves_equivalence_bool_not_subsingleton` — A clopen with two sections cannot be evaluated as a singleton, excluding evaluation at the empty open.

**`ClopenSheaves.equivalenceObjIso`.** The comparison is transport along literal equality of the restricted values; no permutation of sections is inserted.

**Checks.**

- `equivalenceObjIso_restricted_true` — For the sheaf of Boolean functions on discrete Bool, restrict the identity section to `{true}`; the comparison evaluates it to `true`.
- `equivalenceObjIso_distinct_global_equal_restrictions` — The identity section and constant `true` section are distinct globally but restrict equally to `{true}`; the comparison of the identity section at `false` is `false`.
- `equivalenceObjIso_restricted_not_false` — The identity section restricted to `{true}` and carried through the comparison is different from the constant `false` section.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.23 Cutoff cardinals

The size strand supplies the cutoff cardinals that bound every change of site in the roadmap and the
cardinality bound on completions that keeps perfectoid rings below the cutoff.

**Existence of a cofinal class of cutoff cardinals.** (*cutoff-cardinal*) Prove
`exists_isCutoffCardinal_gt`: there is a
cofinal class of uncountable cardinals `κ` such that: for all cardinals `λ < κ` one has `2^λ < κ`,
so `κ` is a strong limit; for every countable sequence of cardinals below `κ` the supremum is below
`κ`, so the cofinality of `κ` is larger than `ω`; and for all `λ < κ` there is a strong limit
cardinal `κ_λ < κ` whose cofinality is larger than `λ`. The `κ_λ` are then cofinal in `κ`, since
`κ_λ ≥ cof(κ_λ) > λ` ([ECD] §4, Lem. 4.1 with proof, pp. 19–20). No large-cardinal axiom and no
universe is used: the proof is a transfinite construction of the beth hierarchy inside ZFC. The
third clause is what makes bounded unions of bounded families admissible and is the clause [ECD]
Lem. 11.22 and Lem. 12.17 use to bound limits; the second is not automatic, since `ℶ_ω` is a strong
limit of cofinality `ω` and fails it; `ℶ_ω` also fails the third clause for every infinite
`λ < ℶ_ω`, because the only strong limit cardinal below `ℶ_ω` is `ℵ₀` (each `ℶ_{n+1} = 2^{ℶ_n}` is
not a strong limit), whose cofinality `ℵ₀` is not larger than `λ`. An example of a cutoff cardinal
is `ℶ_δ` for `δ = sup_{ν < ω₁} δ_ν`, where `δ_{ν+1}` is a limit ordinal above `δ_ν` of cofinality
`(ℶ_{δ_ν})⁺`: it is a strong limit of cofinality `ω₁`, and for `λ < ℶ_{δ_ν}` the strong limit
`ℶ_{δ_{ν+1}} < ℶ_δ` has cofinality `(ℶ_{δ_ν})⁺ > λ`. The working form, which is how every later
smallness argument uses the lemma, is ECD's: one may always take power sets and countable unions,
and any construction taking fewer than `κ` steps on objects of size uniformly bounded below `κ`
stays below `κ` ([ECD] §4, discussion after Lem. 4.1, pp. 19–20). *Needs:* Mathlib `Cardinal`,
`Cardinal.mk`, `Cardinal.IsStrongLimit`, `Ordinal`, `Cardinal.beth`, `Ordinal.cof`.

**Checks.**

- `s0_23_cutoff_zero` — `0` fails the uncountability clause.
- `s0_23_cutoff_aleph_zero` — `ℵ₀` is strong limit but fails the two uncountability clauses.
- `s0_23_beth_omega_is_not_a_cutoff` — `ℶ_ω` has cofinality `ω`; the only infinite strong limit
  below it is `ℵ₀`, so it also fails the inner-cofinality requirement.

**`IsCutoffCardinal`.** The cutoff condition includes its cofinality and power-growth requirements.

**Checks.**

- `definition_IsCutoffCardinal_1` — Starting with beth at omega-one, iterate κ ↦ beth at the initial ordinal of successor κ, taking suprema at limits. The value at omega-one satisfies the cutoff predicate.
- `definition_IsCutoffCardinal_2` — Zero is not a cutoff.
- `definition_IsCutoffCardinal_3` — The uncountable strong limit beth-omega fails the cofinality clause; this excludes the strong-limit-only alternative.

Lean: `IsCutoffCardinal` and `exists_isCutoffCardinal_gt`, with a proved example excluding `ℵ₀`.
The remaining Checks and constructions are specified in the README only.

### D0.24 Cardinality of a completion

**Cardinality of a completion with a bounded dense subset.** (*completion-cardinality-bound*) Let
`κ` satisfy `Cardinal.IsStrongLimit κ` and let `λ` be an infinite cardinal with `λ < κ`. A Hausdorff
first-countable topological group with a dense subset `A` of cardinality at most `λ` has separated
completion of cardinality at most `λ^ℵ₀ ≤ 2^λ < κ`, each point being the limit of a sequence in `A`
([ECD] §4, Rem. 4.3, p. 20, the counting argument in conditional form). The first inequality
`|Ĝ| ≤ λ^ℵ₀` is PerfectoidSpaces `completion_cardinality_bound` (for a Hausdorff first-countable
uniform additive group with a dense subset of size `≤ λ`, `λ` infinite), cited here and not
restated; the remaining inequalities are cardinal arithmetic. The strong-limit hypothesis supplies
`2^λ < κ`; no cofinality condition is needed, and `ℵ₀ ≤ λ < κ` already forces `κ` to be uncountable.
Finite `λ` is handled separately — a finite dense subset of a Hausdorff space is closed — and no
bound `λ^ℵ₀ ≤ 2^λ` is used for arbitrary finite `λ`, where it is false. First countability cannot be
dropped: for `G = ℤ` with the Bohr topology, which is Hausdorff and not first countable, `A = ℤ` is
dense with `λ = ℵ₀`, while the completion is the Bohr compactification of cardinality
`2^{2^{ℵ₀}} > 2^{ℵ₀} = λ^{ℵ₀}`. An empty dense subset occurs only for `G = ∅`, which is not a group,
so `A` is nonempty and the hypothesis `|A| ≤ λ` with `λ` infinite is never vacuous. For `λ = ℵ₀` the
bound reads `|Ĝ| ≤ 2^{ℵ₀}`, as for `G = ℚ` with `Ĝ = ℝ`. ECD applies this with `A` a perfectoid Tate
ring and `A_0` a dense subalgebra; that application belongs to layer D2, to D6.6 and to
PerfectoidSpaces layer P6, not here. *Needs:* D0.23; PerfectoidSpaces
`completion_cardinality_bound`; Mathlib `Cardinal`, `Cardinal.power_le_power_left`,
`UniformSpace.Completion`, `FirstCountableTopology`, `Cardinal.IsStrongLimit`.

**Checks.**

- `s0_24_card_completion_le_beth_omega` — the same bound holds for `κ = ℶ_ω`, a strong
  limit of countable cofinality, for every infinite `λ < ℶ_ω` and every such dense subset.
- `s0_24_completion_rationals` — the completion of `ℚ` has cardinality `2^ℵ₀`, attaining the
  countable-dense-subset bound.
- `s0_24_completion_finite` — a finite Hausdorff uniform group is already complete; completion
  preserves its cardinality.
- `s0_24_finite_exponent_bound_fails` — The completion of `ℚ` has cardinality `|ℚ|^ℵ₀` and exceeds `|ℚ|²`. This tests the exponent on an actual completion with a countable dense subset.
- `s0_24_bohr_topology_is_not_first_countable` — the topology on `ℤ` induced by all characters
  to the circle is not first countable.

Lean: none in this roadmap; the bound `|Ĝ| ≤ λ^ℵ₀` is PerfectoidSpaces
`completion_cardinality_bound`. The rest of this subsection is specified in the README only (no Lean
declaration).

### D0.25 Stackification

The stack strand specialises SchemeAndStackFoundations' 2-categorical constructions —
stackification, 2-fibre products and quotients of groupoid objects, on Mathlib's pseudofunctor
carrier — to the v-site, keeping the sheaf of isomorphism classes apart from the stack itself.

**Stackification of a category-valued prestack and its universal property, on the v-site.**
(*general-site-stackification*) Stackification of a prestack on a site `(C, J)`, with its universal
property and the 2-Yoneda lemma, is SchemeAndStackFoundations §1.18, whose target
`Stack.stackification J F` is commissioned there for any small site `(C, J)` and any
category-valued pseudofunctor `F` (not only groupoid-valued, and not assumed a prestack in
Mathlib's sense), with the unit `Stack.toStackification`, `Stack.isStack_stackification`,
`Stack.stackificationUniversal` (strong transformations and modifications),
`Stack.stackification_of_isStack` and `Stack.stackificationDiscreteEquiv`, from Mathlib's
`DescentData`/`IsPrestack`/`IsStack` carrier ([Stacks stackification] Tag 02ZP, Lem. 8.9.1, and
§8.8, Tag 02ZM, Lemmas 8.8.1–8.8.3); its groupoid-valued fppf `stackification` on `Scheme.{u}` and
the v-stacks here are two specialisations, and this subsection constructs nothing new. The names
`Stack.stackification`, `Stack.toStackification`, `Stack.isStack_stackification`,
`Stack.stackificationUniversal`, `Stack.stackification_of_isStack` and
`Stack.stackificationDiscreteEquiv` used below are §1.18's exports evaluated at `(Perfd, v)`,
`(Perf, v)` or the big pro-étale site, not local declarations. It records the contract that the v-site specialisation must
satisfy on `(Perfd, v)` and `(Perf, v)` (D2.2) and on the big pro-étale site of D2.1, with the
suggested names used in its Checks for §1.18's generic construction. Let `C : Type u` have
`Category.{u} C`, let `J : GrothendieckTopology C`, and let `F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat.{u, u}`
be any category-valued pseudofunctor. Here "prestack" does not require Mathlib's `IsPrestack`, the
condition that the Hom presheaves are sheaves, which the first step of the construction produces.
Both stackification and its universal property are asserted for every such `F`; groupoid-valued
prestacks are included as a special case. `Stack.stackification` is the associated stack for the
topology `J` and `Stack.toStackification` the canonical map; the properties consumed are
`Stack.isStack_stackification` (it is a stack in the sense of Mathlib's `IsStack`),
`Stack.stackificationUniversal` (for every stack `G`, composition with the canonical map is an
equivalence of the categories of morphisms, with strong transformations and modifications, from the
stackification to `G` and from `F` to `G` — a 2-categorical universal property, not a bijection),
`Stack.stackification_of_isStack` (a stack is its own stackification) and
`Stack.stackificationDiscreteEquiv` (on a discrete prestack coming from a presheaf of sets,
stackification is Mathlib's sheafification `presheafToSheaf`), by the construction of [Stacks
stackification] §§8.8–8.9 — Hom-sheafification followed by adjoining the descent objects — on
`(C, J)` ([ECD] §9, Def. 9.1, p. 44, ECD's definition of descent data and of being a stack, which
the universal property is universal for; [Stacks stackification] Tags 02ZM, 02ZP). Comparison
statements: a v-stack is a `Pseudofunctor.IsStack` for the v-topology, and §1.18's stackification on
that site is the v-stackification used in D3–D6; a stack is its own stackification and a discrete
prestack stackifies to the v-sheafification. For the prestack of torsors under a sheaf of groups the
stackification is the stack of torsors. Its isomorphism classes on `X` are nonabelian `H¹(X, G)`,
SchemeAndStackFoundations §2.3's `NonabelianH1` for the v-site; this presheaf need not be a sheaf,
and its sheafification is terminal because torsors are locally trivial. *Needs:*
SchemeAndStackFoundations §§1.18 and 2.3; Mathlib `CategoryTheory.Pseudofunctor.DescentData`,
`CategoryTheory.Pseudofunctor.IsPrestack`, `CategoryTheory.Pseudofunctor.IsStack`,
`CategoryTheory.Pseudofunctor.toDescentData`, `CategoryTheory.Pseudofunctor.sheafHom`,
`CategoryTheory.presheafToSheaf`, `CategoryTheory.Pseudofunctor`, `CategoryTheory.Groupoid`,
`CategoryTheory.Pseudofunctor.StrongTrans`, `CategoryTheory.Pseudofunctor.StrongTrans.Modification`.

**Checks.**

- `s0_25_discrete_restriction` (computation) — `(P ⋙ typeToCat).toPseudofunctor'` sends a restriction `f` and
  an object `x` to `P(f)(x)`, using Mathlib `typeToCat` and `Functor.toPseudofunctor'`.
- `s0_25_discrete_empty` (degenerate) — the empty constant presheaf has empty discrete fibres.
- `s0_25_discrete_two_points` (non-example) — the constant two-element presheaf has two discrete
  objects in each fibre; it is not the terminal prestack.

- `s0_25_sheafification_agreement` — `Stack.stackificationDiscreteEquiv` supplies the equivalence
  between the stackification of a discrete prestack and Mathlib's `presheafToSheaf`.
- `s0_25_already_a_stack` — if `F` is a stack the unit is an equivalence (the degenerate case).
- `s0_25_classifying_stack_has_automorphisms` (non-example) — the stackification of the one-object
  groupoid prestack with automorphism sheaf a nontrivial `G` is `BG`; it retains `G` as the
  automorphisms of the trivial torsor, which the sheaf of isomorphism classes would erase.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D0.26 2-fibre products and quotient stacks

**Two-fibre products of stacks and quotients of groupoid objects, on the v-site.**
(*groupoid-quotients-and-two-fibre-products*) The 2-fibre product of stacks with its 2-universal
property is SchemeAndStackFoundations §1.18 (`Stack.twoFibreProduct` with `.fst`, `.snd`, `.iso`
and `.lift`, objectwise Mathlib's `CategoricalPullback`), and the quotient stack `[X/R]` of a
groupoid object in sheaves, the stackification of the objectwise groupoid with objects `X(T)` and
arrows `R(T)`, is its §1.21 (`Stack.quotient J (X, R)` with `.π : X → [X/R]`, the equivalence
`R ≃ X ×_{[X/R]} X`, `.desc` and the sheaf of isomorphism classes); both are commissioned there on
an arbitrary site, and `twoFiberProduct`, `quotientStack` and `actionQuotient` there are the fppf
instances on `Scheme.{u}`. This subsection constructs neither and states their specialisation to
the v-sites `(Perfd, v)` and `(Perf, v)` of D2.2. For maps of v-stacks `G₁ → G₃ ← G₂`,
`Stack.twoFibreProduct` on `(Perf, v)` is a v-stack, its value on `X` is the category of triples
`(a, b, φ)` with `φ` an isomorphism of the images of `a` and `b` in `G₃(X)`, it is
groupoid-valued when the inputs are, and it is the 2-fibre product used in D3–D5. For a groupoid
object `(X, R)` in v-sheaves on `Perf`, with source and target `s, t : R → X`, prove on
`(Perf, v)`: (i) `R ≃ X ×_{[X/R]} X` through `Stack.quotient.π` ([ECD] Proposition 11.3(ii),
p. 54, the abstract form instantiated in layer D4); (ii) the sheaf of isomorphism classes of
`[X/R]` is the v-sheafification of the presheaf quotient `X/R`, and `[X/R]` is a v-sheaf exactly
when every stabiliser is trivial (`Stack.quotient_isSheaf_iff`); (iii) for every category-valued
v-stack `G`, restriction along `Stack.quotient.π` is an equivalence from maps `[X/R] → G`, with
modifications, to descent data for `G` along the groupoid `(X, R)`: objects of `G(X)` with
isomorphisms over `R` satisfying the cocycle condition (`Stack.quotient_descent`; [ECD]
Proposition 11.3(iii), p. 54; [Stacks stackification] Tags 044U and 04MA for the 2-coequaliser
property). Statements (ii) and (iii) are this roadmap's v-site targets; §1.21 states the
isomorphism-class sheaf and `.desc` for groupoid-valued targets. The atlas relation is recovered
before isomorphism classes are sheafified, so the trivial torsor of `BG` keeps `G` as its
automorphism group ([Stacks stackification] Tags 02ZL, 044O, 04M9, 04Y1; [ECD] §12, Def. 12.4 and
Prop. 12.3, pp. 69–70, which presuppose 2-fibre products of v-stacks and the quotient
presentation). *Needs:* D0.25; SchemeAndStackFoundations §§1.18 and 1.21; D2.2; Mathlib
`CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.Limits.CategoricalPullback`.

**Checks.**

- `s0_26_free_discrete_quotient` — for `R` the graph of a free action of a discrete group `G` on
  `X`, the quotient stack is the sheaf quotient `X/G`; on the point site Mathlib
  `ActionCategory G X` stackifies to the discrete orbit set.
- `s0_26_classifying_stack` (non-example) — for `X` the final object and `R = G` a sheaf of
  nontrivial groups, the quotient is `BG`, which is not a sheaf and has automorphism sheaf `G` at
  the trivial torsor; at other torsors it is the corresponding inner form. This separates the
  quotient stack from its isomorphism-class sheaf and tests the stabiliser clause of (ii).
- `s0_26_strict_pullback_is_wrong` (non-example) — the strict fibre product of categories differs
  from the 2-fibre product already for two points mapping to the same object of a groupoid with a
  nontrivial automorphism.
- `s0_26_interval_not_groupoid` — on the point site with only identity covers, take `G₁ = [1]`, the
  category `0 → 1`, and `G₂ = G₃ = 1`. The 2-fibre product is equivalent to `[1]` and keeps its
  noninvertible arrow, so the 2-fibre product of category-valued stacks need not be
  groupoid-valued ([Stacks stackification] Tag 02X9).
- `s0_26_trivial_groupoid` (degenerate case) — for `R = X` with `s = t = id` the quotient stack is
  `X` itself, all stabilisers being trivial.
- `s0_26_pair_groupoid` — for `R = X × X` with the two projections, the stabilisers are trivial and
  the quotient stack is the sheaf image of `X → *`, terminal exactly when `X → *` is an epimorphism;
  `R ≃ X ×_{[X/R]} X` reads `X × X = X ×_* X`.
- `s0_26_descent_stabilizer` — for the one-object groupoid of `ℤ` and `G` the constant stack of
  the one-object groupoid of `ℤ`, a descent datum may send the generator to a nonidentity
  automorphism; maps `Bℤ → G` are not determined by their value on objects.

`Stack.isoClasses` applies Mathlib's `isomorphismClasses` to the fibres of a prestack; D4.8
sheafifies it for small v-stacks.

**`Stack.isoClasses`.** Taking isomorphism classes identifies isomorphic objects while retaining
distinct discrete points.

**Checks.**

- `definition_isoClasses_1` — A constant discrete two-point prestack has two classes in every fibre.
- `definition_isoClasses_2` — A constant one-object groupoid prestack with automorphism group `ℤ`
  has one class, although the prestack is not discrete.
- `definition_isoClasses_3` — A constant connected two-object pair groupoid has only one class, not
  two.

**`booleanRestriction`.** On the two-object chain, take Bool at each object and negation as the
restriction along the proper arrow. Identity restrictions remain identities. Its discrete prestack
supplies the changing sections in the diagonal Checks of D3.8.

**Checks.**

- `booleanRestriction_true` — The proper restriction sends `true` to `false`.
- `booleanRestriction_false` — The proper restriction sends `false` to `true`.
- `booleanRestriction_identity` — The two identity restrictions fix `true` and `false`, respectively;
  the constant restriction to `false` fails the second Check.

Lean: none; the stack constructions are SchemeAndStackFoundations' and their v-site
specialisations are specified in the README only.

### Examples

The checks of this layer use the spectral examples supplied by AdicSpacesPartII R0.0 and
R0.19.1–R0.19.10. `Spa(A, A⁺)` of a Huber pair with a pair of definition is spectral, an infinite
disjoint union of nonempty spectral spaces is locally spectral but not spectral, and a
non-quasicompact open inclusion is continuous but not spectral. For `X = Spec A` with `A` a product
of countably many fields, the constructible topology on `X` is the Stone space of the Boolean
algebra of subsets of the index set, and `X` is not discrete. The image of `Spa(K, O_K)` in
`Spa(K, K⁺)` is the rank-one point, pro-constructible and generalizing, not closed when `K⁺ ≠ O_K`,
open for `K⁺` of rank two (the Sierpiński space) and not open only when `K⁺/√(ϖK⁺)` has no
height-one prime, while the rank-one points of a spectral space need not form a pro-constructible
subset. The empty space and a point are spectral; `Spec` of a discrete valuation ring has discrete
constructible topology and its Hochster dual makes the closed point open; the identity `X_cons → X`
is a bijective spectral map that is neither generalizing, nor a quotient map, nor a spectral
submersion. The saturation `{0, 1}` of `{1}` under the relation identifying `0` and `1` on
`{0} ∪ {1/n}` is not open, which is why the invariant neighbourhood of D0.8 is bounded by `E′` and
not by `E`. In sheaves on discrete `ℕ` the comparison `⊕_ℕ ℤ → ∏_ℕ ℤ` is not surjective, on the
circle the constant sheaf `ℤ` is not flasque and has `H¹ = ℤ`, the Bohr completion of `ℤ` has
cardinality `2^{2^{ℵ₀}}`, and `ℶ_ω` fails both the cofinality clause and the third clause of the
cutoff definition. For a single point, the closure of a pro-constructible set is the closure of a
point in a sober space. The inverse topology fixes a finite discrete space, switches the points of
the Sierpiński space and leaves the constructible topology unchanged. A bijective continuous
spectral map that is not generalizing need not be a homeomorphism. For `X` profinite and `R` the
graph of a free finite group action, `X/R` is profinite, whereas the Stone–Čech compactification of
the discrete set underlying any compact Hausdorff `Y` presents `Y` as a quotient of a profinite set
by a profinite equivalence relation, so neither D0.8 nor D0.9 can conclude spectrality without its
extra hypothesis. `Spa` of an inverse limit of affinoid perfectoid spaces has the inverse limit of
the underlying spaces as underlying space. The inverse-limit map of [Arc] Rem. 2.18 is a spectral
submersion but not an ordinary quotient map. `Pro(finite sets)` is the profinite sets, the identity
of `ℤ_p` lives in `lim_j colim_i Hom` of the system `ℤ/pⁿℤ` but not in `colim_i lim_j Hom`, and
`Spec` of a field and of a discrete valuation ring are the point and the Sierpiński space, the
latter realized by no finite ring. The unit interval is a quotient of a profinite set by a closed
profinite equivalence relation whose quotient is not profinite. For sheaves on `Perfd` the final
object is not quasiseparated, and in sheaves on discrete `ℕ` the terminal object is not quasicompact
although its identity is a quasicompact morphism. An infinite disjoint union of points violates the
filtered-colimit comparison without quasicompactness. `ℶ_ω` is a strong limit of cofinality `ω` and
so is not a cutoff cardinal. Without first countability the completion bound fails. The
stackification of a discrete prestack is the sheafification, `BG` keeps `G` as automorphisms of the
trivial torsor, and a free discrete action has the sheaf quotient as its quotient stack. `ℤ_p`
modulo translation by `ℤ` is a non-Hausdorff quotient of a profinite set by a relation that is not
closed.

The proved D0 example in `Suggested.lean` excludes `ℵ₀` from the cutoff cardinals. The generic
locally spectral, constructible-topology, closure and generalizing quotient-map Checks are supplied
by AdicSpacesPartII R0.0 and R0.19.1–R0.19.4.

### Dependencies

Mathlib and Tau Ceti as listed in the supplier contracts: the spectral-space, constructible-topology
and specialization API, `GeneralizingMap`, `Topology.IsQuotientMap`, `Continuous.isClosedMap` with
`Topology.IsClosedMap.isQuotientMap`, `StoneCech`, `Stonean`, `CompHaus` with
`CompHaus.projectivePresentation` and `Profinite` with `Profinite.asLimit`, `ConnectedComponents`,
`Specialization`, `CategoryTheory.Ind`, `IsCofiltered.cofilteredClosure`, cofiltered and filtered
(co)limits, `Ordinal` and `Cardinal` with `Cardinal.beth`, `Cardinal.IsStrongLimit` and
`Ordinal.cof`, `UniformSpace.Completion`, `TopCat.Presheaf.IsFlasque`, `Filter.Product`, the sheaf,
coherent-topology and sheaf-cohomology API, and the pseudofunctor descent API `DescentData`,
`IsPrestack`, `IsStack`, `toDescentData`, `sheafHom`, `StrongTrans` and `Modification`; from Tau
Ceti, `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`,
`TauCeti.ValuationSpectrum.isProConstructible_val_preimage_spa`, `TauCeti.IsProConstructible` with
`.mem_of_isGenericPoint`, `.prod` and `.pi`, `TauCeti.isSpectralMap_eval`,
`TauCeti.IsSpectralMap.continuous_constructibleTopology` and
`TauCeti.Topology.subsingleton_H_succ_of_isFlasque`. AdicSpacesPartII R0.0 and R0.19.1–R0.19.10
supply the generic spectral, pro-category and qcqs topos inputs. PerfectoidSpaces P6.10–P6.12 supply
bounded pro-objects and their flattening for D0.13; D0.23 supplies its cutoff-cardinal hypotheses.
D0.16 feeds D0.22, and D0.23 feeds D0.24. D0.25 feeds D0.26. SchemeAndStackFoundations supplies the
generic site constructions and cohomology contracts of which D0.18–D0.21 and D0.25–D0.26 use the
v-site forms: §§1.18 and 1.21 (D0.25–D0.26), §§2.1–2.2 (D0.19, and through it D0.18 and D0.21), §2.3
(D0.18, D0.25) and §2.5 (D0.18, D0.20); no subsection here builds a second copy of them. D0.25–D0.26
are stated on the sites of D2.1–D2.2, which do not use them. The application of D0.24 to perfectoid
Tate rings is made in layer D2, in D6.6 and in PerfectoidSpaces layer P6, whose
`completion_cardinality_bound` is the bound itself.

## Layer D1: disconnected perfectoid spaces

Disconnected covers turn perfectoid geometry into valuation-field components indexed by profinite
parameter spaces. The layer defines the totally disconnected and the strictly totally disconnected
perfectoid spaces, proves Fargues' characterisation of the spectral spaces whose open covers split,
describes the connected components of the disconnected spaces as valuation spectra `Spa(K, K⁺)` of
perfectoid fields and shows such spaces are affinoid, identifies pro-constructible generalizing
subsets as affinoid perfectoid subspaces, proves the automatic flatness of integral rings modulo a
pseudouniformizer over a totally disconnected base, constructs the w-localization `X ↦ X^wl` with
its pro-étale presentation and, separately, the universally open affinoid pro-étale strictly totally
disconnected cover `X̃ → X` of an affinoid perfectoid space, and classifies the pro-étale perfectoid
spaces over a strictly totally disconnected base by spectral data on the underlying topological
spaces. It works with the perfectoid spaces, completed residue fields, affinoid limits and pro-étale
morphisms supplied by PerfectoidSpaces layers P2, P4, P5 and P6. In `Suggested.lean` the topological
conditions are stated on Tau Ceti's `PreAdicSpace` and the perfectoid statements on
PerfectoidSpaces' `Perfd p`; for the README-only targets the suggested geometric category is the Hom
lift of the full subcategory of `PerfectoidSpace.Perfd.{1} p`, or of `PerfectoidSpace.Perf.{1} p` in
characteristic `p`, on the objects covered by `Geometry.Affinoid` charts
(`Geometry.HasAffinoidCharts`, D1.11); étaleness is the pullback of `PerfectoidSpace.IsEtale p`
along `Geometry.toPerfectoid`. The cutoff categories use `PerfectoidSpace.IsKappaSmall p κ` on these
same objects. Total disconnectedness and strict
total disconnectedness are separate predicates, and universal openness is obtained from a cover
construction distinct from the w-localization, which is not universally open.

### D1.1 Totally disconnected perfectoid spaces

The first four targets define the two disconnectedness predicates, prove the characterisation of
split covers on spectral spaces, and describe the connected components of a disconnected space as
valuation spectra of perfectoid fields.

**Totally disconnected perfectoid spaces.** (*totally-disconnected-perfectoid-space*) A perfectoid
space `X` is totally disconnected when it is quasicompact and quasiseparated and every open cover of
`X` splits, that is, for every open cover `{U_i}` of `X` the map `⊔_i U_i → X` admits a section.
These are the perfectoid analogues of profinite sets. The name refers to the connected components of
`|X|`, which are the fibres of the projection to the profinite set `π₀(X)` and are of the form
`Spa(K, K⁺)`; it does not say that `|X|` is a totally disconnected topological space. The qcqs
hypothesis is part of the definition: without quasicompactness the splitting condition is satisfied
by every discrete space, such as an infinite disjoint union of points, which is not quasicompact,
and the structure theory fails. The condition is on open covers, not on étale covers; the étale
version is strict total disconnectedness (D1.4, [ECD] Def. 7.15), which is strictly stronger. Define
`Geometry.totallyDisconnected p c` on `X : Geometry.Spaces p c` as
`IsTotallyDisconnectedPerfectoid (Geometry.space p c) Jopen X`, where
`Jopen = Perfd.proEtaleTopology (Geometry.space p c) (Geometry.openImm p c)`. Thus the relative
definition supplies the geometric predicate itself (qcqs and split open covers), and
`Geometry.totallyDisconnected_iff` is definitional. Prove `IsTotallyDisconnectedPerfectoid.qcqs` (a
totally disconnected perfectoid space is quasicompact and quasiseparated, and every finite
intersection of compact opens is compact, including the empty intersection),
`IsTotallyDisconnectedPerfectoid.splitting` (for a covering family `f_i : U_i → X` and every
`g : Y → X`, a lift `l : Y → ⨿ U_i` with `l ≫ desc f = g`; `g = id_X` gives a section),
`IsTotallyDisconnectedPerfectoid.isClosed` (the topological condition passes to closed subsets of
`|X|`: a closed subset of a component `Spa(K, K⁺)`, a chain of specializations, is either empty or a
final segment with a unique closed point, so every open cover of the closed subset splits by D1.2; a
closed subset is not in general a perfectoid subspace, and the perfectoid structure is asserted only
for the pro-constructible generalizing subsets of D1.5) ([ECD] §7, Def. 7.1, p. 29). The component
projection to the profinite set `π₀(X)`, the description of its fibres as `Spa(K, K⁺)`, the converse
characterisation and affinoidness are the statements of D1.3 and are not listed here. *Needs:*
AdicSpacesPartII R0.0; D1.2; PerfectoidSpaces layer P2 (perfectoid spaces and glued tilting);
Mathlib `SpectralSpace`, `ConnectedComponents`, `Profinite`.

**Checks.**

- `s1_1_point` — `Spa(K, K⁺)` with `K` a perfectoid field and `K⁺` an open bounded valuation subring is
  totally disconnected, and connected: it is its own unique component.
- `s1_1_finite_disjoint_union` (degenerate case and non-example) — a finite disjoint union of totally
  disconnected perfectoid spaces is totally disconnected; a disjoint union with infinitely many
  nonempty summands is not quasicompact and hence not totally disconnected. An infinitely indexed
  union of empty summands is empty, and finitely many nonempty summands still give a
  quasicompact union.
- `s1_1_perfectoid_ball_is_not` (non-example) — the perfectoid closed unit disc over an algebraically
  closed `C` is qcqs but not totally disconnected: it is connected with more than one closed point.
- `s1_1_agrees_with_profinite` (compatibility) — for `X = S × Spa(C, O_C)` with `S` profinite, `X` is
  totally disconnected and `π₀(X) = S`; a definition that does not recover `S` is wrong.
- `s1_1_rank_two_point` (the name warning, computed) — for `C⁺ ⊂ C` an open bounded valuation
  subring of rank two, `|Spa(C, C⁺)|` is the Sierpiński space: the rank-one point `η` is open and
  generalizes the closed rank-two point `s`. The space is connected, qcqs, and every open cover
  contains the member `X` itself (the only open containing `s`), so every open cover splits: it is
  totally disconnected with a single component that is not a point and carries a specialization; for
  `C` algebraically closed it is also strictly totally disconnected (D1.4).
- `s1_1_empty_space` (degenerate case) — the empty perfectoid space `Spa(0, 0)` is qcqs, the empty cover
  splits, `π₀ = ∅`, and it is affinoid; it is totally and strictly totally disconnected.

The topological splitting predicate is `OpenCoversSplit`, using a choice of cover
member whose fibres are open. Its three additional Checks are independent of a
perfectoid presentation:

- `open_covers_empty` — the empty cover of the empty space has its unique section.
- `open_covers_profinite` — every open cover of a profinite space has a clopen
  partition subordinate to it, so it splits.
- `open_covers_two_closed_points` — on a connected space with distinct closed
  points `x,y`, the cover by their complements has no section: a continuous choice
  would be constant, but neither complement covers the space.

**`qcqs`.** Quasicompactness and quasiseparatedness refer to the supplied underlying space.

**Checks.**

- `definition_qcqs_1` — The discrete two-point space is qcqs.
- `definition_qcqs_2` — The empty space is qcqs.
- `definition_qcqs_3` — Discrete ℕ is quasiseparated but fails qcqs.

**`OpenCoversSplit`.** A splitting chooses a covering member locally constantly.

**Checks.**

- `definition_OpenCoversSplit_1` — Every open cover of the two-point chain splits, although the
  space is connected.
- `definition_OpenCoversSplit_2` — The empty cover of the empty space splits.
- `definition_OpenCoversSplit_3` — The real line has nonsplitting open covers, for example the
  overlapping half-lines.

**`coverSplits`.** Splitting requires an actual section of the coproduct map.

**Checks.**

- `definition_coverSplits_1` — For the topology with only maximal covering sieves, every cover of
  the two-point space splits.
- `definition_coverSplits_2` — The empty space has split covers even for the topology in which all
  sieves cover.
- `definition_coverSplits_3` — A point fails the all-sieves topology: its empty cover has no
  section.

The same `coverSplits` is tested on `Geometry.Spaces p c` with its actual open and
étale topologies ([ECD] Definition 7.1 and Proposition 7.16, pp. 29 and 36):

- `coverSplits_perfectoid_field_open` — Open covers of `Spa(K, K⁺)` split for a
  perfectoid field with its chosen open bounded valuation subring.
- `coverSplits_perfectoid_empty_etale` — Every étale cover of `Spa(0, 0)` splits,
  including the empty cover.
- `coverSplits_perfectoid_nonclosed_etale` — A perfectoid field that is not
  algebraically closed has a nonsplit finite étale cover, so its étale-cover
  splitting predicate fails even though its open-cover predicate holds.

**`IsTotallyDisconnectedPerfectoid`.** The relative predicate requires both compactness and splitting for its specified topology.

**Checks.**

- `definition_IsTotallyDisconnectedPerfectoid_1` — With the identity space functor and minimal
  topology, the discrete two-point object satisfies the predicate.
- `definition_IsTotallyDisconnectedPerfectoid_2` — The empty object satisfies the predicate even for
  the maximal topology.
- `definition_IsTotallyDisconnectedPerfectoid_3` — A point fails for the maximal topology despite
  being qcqs.

**Checks.**

- `finite_disjoint_union` — Discrete ℕ has split open covers but is not compact; splitting alone does not imply the qcqs condition.

Lean: `OpenCoversSplit` and `isTotallyDisconnected` (quasicompact, quasiseparated, with split open
covers, on Tau Ceti's `PreAdicSpace`). The Checks and remaining constructions are specified in
the README only.

### D1.2 Fargues' characterisation of split covers

**Fargues' characterisation of spectral spaces all of whose open covers split.**
(*split-cover-characterisation*) Let `X` be a spectral space. Prove `splitCoverCharacterisation`
(its part (i) ⇔ (ii) is also `openCoversSplit_iff`): the following are
equivalent: (i) every open cover of `X` splits; (ii) every connected component of `X` has a unique
closed point; (iii) the global-sections functor on set-valued sheaves sends epimorphisms to
surjections; (iv) the global-sections functor on abelian sheaves is exact; (v) every abelian sheaf
`F` has `H^i(X, F) = 0` for `i > 0`; (vi) every abelian sheaf `F` has `H^1(X, F) = 0`. The
equivalence of (iii)–(vi) is formal; the substance is (i) ⟺ (ii) and (iv) ⟹ (i). The proof uses that
every nonempty spectral space has at least one closed point, by Zorn's lemma and the nonemptiness of
cofiltered limits of nonempty spectral spaces ([ECD] §7, remark before the proof of Lem. 7.2, p.
30). The set-valued condition is the epimorphism condition (iii) and nothing stronger: for the
two-point discrete space `1 ⊔ 1`, global sections is the product functor `Set × Set → Set`, which
does not preserve binary coproducts (`Γ(1 ⊔ 1)` has four elements and `Γ(1) ⊔ Γ(1)` two) although
every open cover splits, so the preservation of all finite colimits written in [ECD] Lem. 7.2(iii)
is not asserted; the epimorphism criterion and the abelian exactness criterion both hold there
([ECD] §7, Lem. 7.2 with proof, pp. 29–30). For `X = Spa(K, K⁺)` the unique closed point of the
single component is the one given by `K⁺` itself, and the conclusion is the vanishing of sheaf
cohomology used throughout [ECD] §§8–9; condition (vi) alone is the form in which the condition is
checked in practice. *Needs:* AdicSpacesPartII R0.19.1; D0.6; Mathlib `SpectralSpace`,
`CategoryTheory.Sheaf.cohomologyPresheaf`, `ConnectedComponents`, `Profinite`.

The abelian exactness clause is expressed by surjectivity on global sections of
every epimorphism of abelian sheaves. Global sections is already left exact, so
this specifies exactness without adding a preservation-of-coproducts assertion.

**Checks.**

- `two_point_discrete` — On the discrete two-point space, global sections of the coproduct of two terminal sheaves have four elements, whereas the coproduct of their global sections has two.
- `set_valued_criterion_on_every_space` — On any topological space, open covers split exactly when every epimorphism of set-valued sheaves is surjective on global sections.

- `empty_spectral_space` — every open cover of the empty space has its unique section; its
  abelian sheaf category is trivial, so all six conditions hold.

Lean: `splitCoverCharacterisation` states all six conditions on Mathlib's sheaf and cohomology
carriers, with sheafification and Ext hypotheses; `openCoversSplit_iff` states (i) ⇔ (ii).

### D1.3 Connected components and affinoidness

**Connected components of a totally disconnected perfectoid space, and affinoidness.**
(*components-of-totally-disconnected*) Let `X` be a totally disconnected perfectoid space. Construct
the continuous component projection `X → π₀(X)` and prove that `π₀(X)` is profinite; prove that
every fibre of this projection is a valuation spectrum `Spa(K, K⁺)` with `K` a perfectoid field and
`K⁺ ⊂ K` a valuation subring that is open and bounded. Conversely, a qcqs perfectoid space all of
whose connected components have this form is totally disconnected, so the component description
characterises total disconnectedness among qcqs perfectoid spaces; the converse needs the hypothesis
on all components, and a qcqs perfectoid space with some component of this form need not be totally
disconnected ([ECD] §7, Lem. 7.3 with proof, pp. 30–31). Prove additionally that every totally
disconnected perfectoid space `X` is affinoid, by the quasicompactness argument of the source ([ECD]
§7, Lem. 7.5 with proof, p. 31); this is what lets every later argument write `X = Spa(R, R⁺)`.
These statements are `IsTotallyDisconnectedPerfectoid.pi0`,
`IsTotallyDisconnectedPerfectoid.fibre_eq_spa`, `IsTotallyDisconnectedPerfectoid.of_components` and
`IsTotallyDisconnectedPerfectoid.isAffinoid` (suggested names; the affinoidness statement is the
Lean theorem `isAffinoidPerfectoid_of_isTotallyDisconnected`, for `X : Perfd p` whose underlying
pre-adic space is `isTotallyDisconnected`), with hypothesis `Geometry.totallyDisconnected p c X` for
`X : Geometry.Spaces p c`; the converse takes `qcqs (Geometry.space p c) X` and a
`Geometry.ComponentModel p X z` for every component `z`. This is definitionally the open-cover
predicate of D1.1. For `Spa(K, K⁺)` the space is its own unique component; for `X = S × Spa(C, O_C)`
the projection is the first projection. *Needs:* D1.2; AdicSpacesPartII R0.19.1; D0.6;
PerfectoidSpaces layer P2 (perfectoid spaces and glued tilting; completed residue fields);
PerfectoidSpaces layer P4 (the injection of residue-field points); Mathlib `ConnectedComponents`,
`Profinite`, `SpectralSpace`.

Lean: `isAffinoidPerfectoid_of_isTotallyDisconnected` ([ECD] Lemma 7.5), with
`t2Space_connectedComponents` of D0.6. The rest of this subsection is specified in the README only
(no Lean declaration).

### D1.4 Strictly totally disconnected perfectoid spaces

**Strictly totally disconnected perfectoid spaces.** (*strictly-totally-disconnected*) A perfectoid
space `X` is strictly totally disconnected when it is qcqs and every étale cover of `X` splits.
Among qcqs perfectoid spaces this is equivalent to the component description: every connected
component is `Spa(C, C⁺)` with `C` an algebraically closed perfectoid field and `C⁺ ⊂ C` an open
bounded valuation subring. The condition is on étale covers rather than open covers; it implies
total disconnectedness and is strictly stronger. The characterisation uses that finite étale covers
of `Spa(K, K⁺)` come from finite extensions of `K`, so that all of them split exactly when `K` is
algebraically closed. Define `Geometry.strictlyDisconnected p c X` as
`IsStrictlyTotallyDisconnected (Geometry.space p c) Jet X`, where
`Jet = Perfd.proEtaleTopology (Geometry.space p c) (Geometry.etale p c)`.
`Geometry.strictlyDisconnected_iff` is the definitional identification with this relative predicate
(qcqs and split étale covers). Prove `IsStrictlyTotallyDisconnected.isTotallyDisconnected` (a
strictly totally disconnected space is totally disconnected),
`IsStrictlyTotallyDisconnected.component_eq` (every connected component is `Spa(C, C⁺)` with `C`
algebraically closed), `IsStrictlyTotallyDisconnected.of_components` (conversely, this condition on
the components implies strict total disconnectedness), `IsStrictlyTotallyDisconnected.isClosed` (the
topological condition passes to closed subsets of `|X|`, as in D1.1, and the perfectoid predicate
passes to pro-constructible generalizing subsets: by D1.5 such a subset is affinoid perfectoid with
components the generalizing subsets `Spa(C, C⁺_𝔭)` of the components `Spa(C, C⁺)`, and `C` stays
algebraically closed) and `IsStrictlyTotallyDisconnected.splitting_etale` (for an étale covering
family `f_i : U_i → X`, every map `g : Y → X` lifts through `⨿ U_i → X`; the identity gives a
section) ([ECD] §7, Def. 7.15 and Prop. 7.16 with proof, p. 36). *Needs:* D1.3; D1.1;
PerfectoidSpaces layer P5 (finite-stage descent of qcqs étale objects); PerfectoidSpaces layer P3
(étale-site tilting and étale almost acyclicity); PerfectoidSpaces layer P2 (completed residue
fields); PerfectoidSpaces layer P6 (`prodProfinite`); Mathlib `ConnectedComponents`.

**Checks.**

- `s1_4_algebraically_closed_point` — `Spa(C, C⁺)` with `C` algebraically closed is strictly totally
  disconnected.
- `s1_4_cyclotomic_field_is_not` (non-example) — `Spa(K, K⁺)` with `K` perfectoid but not algebraically
  closed, for instance the completed cyclotomic field `K = ℚ_p(ζ_{p^∞})^∧` with `K⁺ = O_K`, is
  totally disconnected and not strictly totally disconnected: the two classes differ.
- `s1_4_finite_disjoint_union` (degenerate case) — a finite disjoint union of strictly totally
  disconnected spaces is strictly totally disconnected.
- `s1_4_profinite_times_point` — `S × Spa(C, O_C)`, the affinoid perfectoid space
  `Spa(C⁰(S, C), C⁰(S, O_C))` of PerfectoidSpaces layer P6 (`prodProfinite`), with `S` profinite and
  `C` algebraically closed is strictly totally disconnected; this is the shape of the fibres
  produced in D1.10 ([ECD] Lem. 7.19).

**`IsStrictlyTotallyDisconnected`.** For relative topologies `Jopen ≤ Jet`,
`IsStrictlyTotallyDisconnected.of_le` sends strict disconnectedness for `Jet` to
`IsTotallyDisconnectedPerfectoid` for `Jopen`; the direction follows from inclusion of
covering sieves. On `Geometry.Spaces p c`, `Geometry.openTopology_le_etaleTopology`
provides this inclusion for open and étale covers, and the two geometric comparison
statements `Geometry.strictlyDisconnected_iff` and `Geometry.totallyDisconnected_iff`
give `IsStrictlyTotallyDisconnected.isTotallyDisconnected`
([ECD] Definitions 6.2(ii), 7.1 and 7.15, pp. 26, 29 and 36).

**Checks.**

- `definition_IsStrictlyTotallyDisconnected_1` — With the identity space functor and minimal
  topology, a discrete two-point object satisfies the predicate.
- `definition_IsStrictlyTotallyDisconnected_2` — The empty object satisfies it for the maximal
  topology.
- `definition_IsStrictlyTotallyDisconnected_3` — A point fails for the maximal topology: the empty
  cover cannot split.
- `IsStrictlyTotallyDisconnected_topology_direction` — A point splits all covers for
  the minimal topology but fails for the maximal topology. Thus inclusion of topologies
  gives the implication from the finer topology to the coarser one only.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D1.5 Pro-constructible generalizing subsets

The next two targets are the valuative and the algebraic inputs of the descent theory: a
pro-constructible generalizing subset of a totally disconnected space is itself an affinoid
perfectoid space, and the integral rings modulo a pseudouniformizer are automatically flat over such
a base.

**Pro-constructible generalizing subsets of a totally disconnected space are affinoid perfectoid.**
(*pro-constructible-generalizing-subsets-are-affinoid*) Let `X` be a totally disconnected perfectoid
space and `U ⊂ |X|` a pro-constructible generalizing subset. Then `U` is an intersection of subsets
of the form `{|f| ≤ 1}` with `f ∈ H⁰(X, O_X)`. Consequently `U` carries a natural structure of
affinoid perfectoid space, which is again totally disconnected: a finite intersection of sets
`{|f| ≤ 1}` inside an affinoid perfectoid space is a rational subset, and an infinite intersection
is a cofiltered limit of affinoid perfectoid spaces, hence affinoid perfectoid. In particular every
quasicompact open subset of `X` is affinoid ([ECD] §7, Lem. 7.6 and Rem. 7.7 with proof, pp. 31–32).
The generalizing hypothesis is essential: a pro-constructible subset that is not generalizing is not
of this form. The quasicompact-open consequence enters almost every later argument, and the lemma
itself is the input to D1.10 and to the spatial arguments of the later layers ([ECD] Lem. 7.19,
Prop. 10.5, Prop. 11.30 and Prop. 13.12). *Needs:* AdicSpacesPartII R0.19.2; D1.3; PerfectoidSpaces
layer P2 (rational localization of perfectoid affinoids); PerfectoidSpaces layer P5 (cofiltered
limits of affinoid perfectoid spaces); Mathlib `Topology.IsConstructible`,
`StableUnderGeneralization`.

**Checks.**

- `s1_5_whole_and_empty` (degenerate cases) — `U = X` is `{|1| ≤ 1}` and `U = ∅` is `{|ϖ⁻¹| ≤ 1}` for a
  pseudouniformizer `ϖ`, a unit of `R` with `|ϖ⁻¹| > 1` at every point; both are rational subsets
  and affinoid, the second being `Spa(0, 0)`.
- `s1_5_rank_one_point_of_component` — for `X = Spa(K, K⁺)` of rank two, `U = {η}` is open, hence
  pro-constructible and generalizing, and `U = {|f| ≤ 1}` for `f = g⁻¹` with `g` a lift of a nonzero
  element of the height-one prime of `K⁺/√(ϖK⁺)`: `|f|_η ≤ 1` since `|g|_η = 1` at the rank-one
  point, while `|f|_s > 1` since `|g|_s < 1`; the result is `Spa(K, O_K)`.
- `s1_5_closed_point_is_not_generalizing` (non-example) — in the same space `U = {s}` is closed, hence
  pro-constructible, and not generalizing; every set `{|f| ≤ 1}` containing `s` contains `η`, so
  `{s}` is not an intersection of such sets, and the generalizing hypothesis cannot be dropped.
- `s1_5_quasicompact_open` — a quasicompact open subset of a totally disconnected `X` is constructible
  and generalizing, hence affinoid; a non-quasicompact open subset, such as the complement of a
  non-isolated point of `π₀(X)` pulled back to `X`, is not covered by the statement and is not
  affinoid.

The two-point topological calculations have separate Checks:

- `closed_point_not_generalizing_topology` — `{false}` in the Sierpiński
  topology is pro-constructible but not generalizing.
- `generic_point_generalizing_topology` — `{true}` is open, pro-constructible
  and generalizing.

The geometric Checks `s1_5_rank_one_point_of_component` and
`s1_5_closed_point_is_not_generalizing` additionally require the rank-two valuation
spectrum, its comparison with this topology, and the rational subset defined by
`g⁻¹`. The affinoid-subspace target includes the structure sheaf on that subset.

On `Geometry.Spaces p c`, `Perfectoid.proConstructibleGeneralizing` includes an affinoid
source, an embedding with image exactly `U`, and unique factorization of every perfectoid map
whose image lies in `U`. It also preserves strict total disconnectedness when the base is
strictly totally disconnected. `Perfectoid.proConstructibleGeneralizing_inequalities` states the
intersection description on the actual valuation spectrum of `R`.
`Perfectoid.quasicompactOpen_isAffinoid` states the open-subspace consequence, assuming a
geometric open immersion and a quasicompact source ([ECD] Lemma 7.6 and Remark 7.7, pp. 31–32).

Lean: none; this subsection, including the two-point topological Checks, is specified in the
README only (no Lean declaration).

### D1.6 Automatic flatness

**Automatic flatness over a totally disconnected base.** (*automatic-flatness*) Let `X = Spa(R, R⁺)`
be a totally disconnected perfectoid space (affinoid by D1.3), `Y = Spa(S, S⁺)` an affinoid
perfectoid space and `f : Y → X` any morphism, with no hypothesis on `f` beyond that. For every
pseudouniformizer `ϖ ∈ R`, the reduction `S⁺/ϖ` of the integral-ring map is a flat `R⁺/ϖ`-algebra.
If moreover the underlying map `|f| : |Y| → |X|` is surjective, then `S⁺/ϖ` is faithfully flat over
`R⁺/ϖ`; faithful flatness needs surjectivity of `|f|`, not surjectivity on `Spec`. The statement
concerns the integral rings modulo a pseudouniformizer over this base: it says nothing about `R → S`
and does not assert flatness for arbitrary morphisms of perfectoid rings ([ECD] §7, Prop. 7.23 with
proof, pp. 38–39). The proof reduces componentwise to valuation rings through the component
structure of D1.3: torsion-freeness over a valuation domain gives flatness by the Bézout-domain
criterion, and faithful flatness is tested at maximal ideals using the topological surjectivity and
the residue-field fibres, the last step being the identification of the points of `Spa(K, K⁺)` with
`Spec(K⁺/ϖ)` for `K` a perfectoid field with `K⁺` an open bounded valuation subring ([ECD] §7, proof
of Prop. 7.23, p. 38). Every v-descent statement of this roadmap rests on this result (it is the
input to [ECD] Thm 8.7, Prop. 8.8 and Prop. 9.3). *Needs:* D1.3; PerfectoidSpaces layer P2
(perfectoid spaces and glued tilting; completed residue fields); PerfectoidSpaces layer P4 (the
injection of residue-field points); Mathlib `Module.Flat`, `Module.FaithfullyFlat`,
`ValuationSubring`, `PrimeSpectrum.comap_surjective_of_faithfullyFlat`,
`Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`.

**Checks.**

- `s1_6_identity` (degenerate case) — for `f` the identity of `X`, `S⁺/ϖ = R⁺/ϖ` is faithfully flat over
  itself.
- `s1_6_empty_source` (degenerate case and non-example) — for `Y = ∅`, `S = 0` and `S⁺/ϖ = 0` is flat
  over `R⁺/ϖ`; it is faithfully flat only when `X = ∅` as well, which is exactly when `|f|` is
  surjective.
- `s1_6_point_over_point` — for `X = Spa(K, K⁺)` and `Y = Spa(L, L⁺)` with `L/K` an extension of
  perfectoid fields and `L⁺ ∩ K = K⁺`, `L⁺` is torsion-free over the valuation ring `K⁺`, hence
  flat, and flatness passes to the reduction `K⁺/ϖ → L⁺/ϖ`; `|f|` is surjective (the chain
  `Spec(L⁺/ϖ)` maps onto the chain `Spec(K⁺/ϖ)`), so it is faithfully flat.
- `s1_6_spec_surjectivity_is_not_the_hypothesis` — the points of `Spa(K, K⁺)` are the primes of `K⁺`
  containing `√(ϖK⁺)`, that is `Spec(K⁺/ϖ)`, with the rank-one point as generic point; this is the
  identification used at the maximal ideals, and the hypothesis is surjectivity of `|f|` on these
  spaces.

The suggested geometric statements are `Perfectoid.integralReduction_flat` and
`Perfectoid.integralReduction_faithfullyFlat`. They take `R S : Geometry.Affinoid p c`, the
Huber-pair map `f : R.toCAff ⟶ S.toCAff`, total disconnectedness of `Geometry.affine p R`, and
`ϖ : R.P.plus` whose image in `R.A` is a pseudouniformizer. The scalar action on the target quotient
is induced by the restriction of this same `f` to the plus rings, followed by `Ideal.quotientMap`;
faithful flatness additionally assumes surjectivity of `Geometry.space.map (Geometry.affineMap p f)`
([ECD] Proposition 7.23, pp. 38–39). In `Suggested.lean` the two statements are
`flat_quotientMap_of_openCoversSplit` and `faithfullyFlat_quotientMap_of_openCoversSplit`, for
complete Hausdorff Tate rings `R` and `S` that are perfectoid (`IsPerfectoidTateRing`) with Tau Ceti
pairs `PR` and `PS`: total disconnectedness of `Spa(R, R⁺)` is the splitting
`OpenCoversSplit (spa PR.plus)` of its open covers, the map is a continuous `φ : R →+* S` carrying
`R⁺` into `S⁺`, `ϖ ∈ R⁺` is a pseudouniformizer, and the conclusion is (faithful) flatness of
`Ideal.quotientMap` from `R⁺/ϖ` to `S⁺/ϖ`; faithful flatness assumes that every point of
`Spa(R, R⁺)` is the image of a point of `Spa(S, S⁺)`.

Lean: `flat_quotientMap_of_openCoversSplit` and `faithfullyFlat_quotientMap_of_openCoversSplit`. The
rest of this subsection is specified in the README only (no Lean declaration).

### D1.7 w-local and w-strictly local perfectoid spaces

The w-localization and the universally open cover are the two constructions that produce
disconnected covers of an arbitrary affinoid perfectoid space. The first produces w-local spaces;
w-strict locality also requires algebraically closed completed residue fields.

**w-local and w-strictly local perfectoid spaces.** (*w-local-and-w-strictly-local*) A perfectoid
space `X` is w-local when its underlying topological space is a w-local spectral space, that is,
when `X` is qcqs, every open cover of `X` splits, and the subset `Xᶜ ⊂ |X|` of closed points is
closed. The extra condition over total disconnectedness is exactly the closedness of the set of
closed points, so a w-local perfectoid space is totally disconnected. A perfectoid space is
w-strictly local when it is w-local and for every `x ∈ X` the completed residue field `K(x)` is
algebraically closed; a w-strictly local space is strictly totally disconnected. D1.8 supplies
w-locality. W-strict locality requires the additional algebraic-closedness condition on completed
residue fields; the geometric arguments after D1.8 use the two disconnectedness predicates
([ECD] §7, Def. 7.4, p. 31; [ECD] §7, Def. 7.17 and the remark before it, p. 36). Define `IsWLocalSpace` as the predicate that a space is spectral, that
every open cover splits and that the set of closed points is closed, `IsWLocalPerfectoid` as the
predicate `IsWLocalPerfectoid (Geometry.space p c) X` on `X : Geometry.Spaces p c`, and
`IsWStrictlyLocalPerfectoid p X` as the predicate that `X` is w-local and all of its completed
residue fields are algebraically closed; prove `IsWLocalPerfectoid.isTotallyDisconnected` (a w-local
perfectoid space is totally disconnected), `IsWLocalPerfectoid.isClosed_closedPoints` (the set of
closed points is closed and its restriction of `ConnectedComponents.mk` is a homeomorphism to
`ConnectedComponents |X|`; [BS15] Lemma 2.1.4, p. 6; its topological half is the Lean theorem
`IsWLocalSpace.isHomeomorph_connectedComponentsMk`) and
`IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected` (a w-strictly local space is strictly
totally disconnected). *Needs:* D1.1; D1.4; PerfectoidSpaces layer P2 (completed residue fields);
Mathlib `SpectralSpace`, `IsClosed`.

**Checks.**

- `s1_7_w_local_implies_totally_disconnected` — every w-local perfectoid space is totally disconnected.
- `s1_7_totally_disconnected_not_w_local` (non-example) — a totally disconnected perfectoid space
  whose set of closed points is not closed is not w-local, so the two predicates must not be defeq.
  A computed instance: let `S = {0} ∪ {1/n : n ≥ 1}`, `Y = S × Spa(C, C⁺)` with `C⁺` of rank two, so
  each component is the Sierpiński space `{η, s}`, and let `Z ⊂ |Y|` be `(S × {η}) ∪ {(0, s)}`. `Z`
  is closed in the constructible topology `S × {η, s}_disc` and generalizing, so by D1.5 it is a
  totally disconnected affinoid perfectoid space; its closed points are `(1/n, η)` and `(0, s)`, and
  their set is not closed, since every neighbourhood of `(0, η)` in `Z` contains `(1/n, η)` for
  large `n`.
- `s1_7_one_closed_point` (degenerate case) — `Spa(K, K⁺)` for a perfectoid field `K` and any open
  bounded valuation subring `K⁺` has a single closed point, the valuation with ring `K⁺`; the set of
  closed points is a singleton, hence closed, and the space is w-local.
- `s1_7_w_localization_is_w_local` — `X^wl` is w-local for every qcqs perfectoid `X` (the construction
  test; for `X` affinoid perfectoid, `X^wl` is w-local by construction, and this is the only source
  of w-local examples used later).
- `s1_7_w_strictly_local_of_algebraically_closed` (degenerate case) — for `C` algebraically closed,
  `Spa(C, C⁺)` is w-strictly local (the one-component case).
- `s1_7_w_localization_not_w_strict` (non-example) — let
  `K = completion(⋃ₙ 𝔽_p((t^{1/pⁿ})))` for prime `p`. This rank-one perfectoid field has residue
  field `𝔽_p`. A root of `zᵖ − z − 1` would have absolute value `1`, and its reduction would
  satisfy `0 = 1` in `𝔽_p`, so `K` is not algebraically closed. The one-point space
  `Spa(K, O_K)` and its completed structure sheaf are unchanged by w-localization; its
  w-localization is w-local and fails w-strict locality.

The topological predicate `IsWLocalSpace` also has the following Checks, in addition to
`one_closed_point` and `totally_disconnected_not_w_local`:

- `w_local_empty` — the empty spectral space is w-local; no closed point is
  required in an empty component quotient.
- `w_local_profinite` — a profinite space is w-local: its components and closed
  points are singletons and the closed-point locus is the whole space.

**`IsWLocalSpace`.** The closed-point locus must itself be closed.

**Checks.**

- `definition_IsWLocalSpace_1` — The two-point chain is w-local, with closed point false.
- `definition_IsWLocalSpace_2` — The empty space is w-local.
- `definition_IsWLocalSpace_3` — Discrete ℕ is not w-local despite having one closed point per
  component.

**`IsWLocalPerfectoid`.** The relative predicate applies w-locality to the underlying space.

**Checks.**

- `definition_IsWLocalPerfectoid_1` — With the identity space functor, the two-point chain is
  w-local.
- `definition_IsWLocalPerfectoid_2` — With the identity space functor, the empty object is w-local.
- `definition_IsWLocalPerfectoid_3` — With the identity space functor, discrete ℕ is not w-local.

**`IsWStrictlyLocalPerfectoid`.** On `X : Geometry.Spaces p c`, require w-locality
and algebraic closedness of
`UniformSpace.Completion (WithVal (TauCeti.ValuationSpectrum.residueFieldValuation x.val))`
for every point `x` of every perfectoid affinoid open chart `Geometry.affine p R → X`.
This is the completed residue field of the valuation at `x`. Quantifying over all charts
expresses the pointwise condition without choosing a chart or an unrelated field assignment; every
point lies in such a chart because the objects of `Geometry.Spaces p c` satisfy
`Geometry.HasAffinoidCharts p c` (D1.11).
PerfectoidSpaces layer P2 supplies its interpretation as a perfectoid completed residue field
([ECD] Definition 7.17, p. 36).

**Checks.**

- `definition_IsWStrictlyLocalPerfectoid_1`,
  `IsWStrictlyLocalPerfectoid_algebraically_closed_field` — For
  `K : Geometry.FieldPoint p c` with `IsAlgClosed K.A`, `Spa(K, K⁺)` is w-strictly local.
- `definition_IsWStrictlyLocalPerfectoid_2`, `IsWStrictlyLocalPerfectoid_empty` —
  An empty perfectoid space is w-strictly local; its open charts have no points.
- `definition_IsWStrictlyLocalPerfectoid_3`,
  `IsWStrictlyLocalPerfectoid_nonclosed_field` — For a perfectoid field `K` whose
  underlying field is not algebraically closed, `Spa(K, K⁺)` is w-local but not
  w-strictly local. Its completed residue fields are `K` itself.

`IsWLocalPerfectoid.isTotallyDisconnected` specializes the topological predicate to
`Geometry.Spaces p c`. `IsWStrictlyLocalPerfectoid.isStrictlyTotallyDisconnected`
requires only `IsWStrictlyLocalPerfectoid p X` and concludes geometric strict total
disconnectedness. The completed residue fields already belong to the charts of `X`
([ECD] Definition 7.17 and Proposition 7.16, p. 36).

Lean: `IsWLocalSpace` and `IsWLocalSpace.isHomeomorph_connectedComponentsMk`. The Checks and
remaining constructions are specified in the README only.

### D1.8 The w-localization functor

**The w-localization functor and its pro-étale presentation.** (*w-localization*) The inclusion of
the category of w-local perfectoid spaces with w-local maps (maps carrying closed points to closed
points) into the category of qcqs perfectoid spaces admits a right adjoint `X ↦ X^wl`, and the
adjunction map `X^wl → X` is pro-étale. If `X` is affinoid then `X^wl → X` is an inverse limit of
surjective maps of the form `⊔_i U_i → X` with `{U_i}` a finite family of rational subsets, and in
particular affinoid pro-étale. The underlying space `|X^wl|` is the w-localization of the spectral
space `|X|`: `π₀(X^wl) = |X|_cons` is `|X|` with the constructible topology, the component over
`x ∈ |X|` is the localization `X_x`, which consists of the generalizations of `x`, and the points of
`X^wl` are the pairs `(x, y)` with `y` a generalization of `x`; `O⁺` on `X^wl` is the `ϖ`-adic
completion of the pullback of `O⁺_X`. The source writes "left adjoint", but its final-object
universal property and the counit `X^wl → X` have the right-adjoint direction. The inclusion of
w-local spaces with w-local maps is not full, and no counit isomorphism for every already-w-local
`X` is asserted ([ECD] §7, Prop. 7.12 with proof, pp. 34–35; [ECD] §7, proof of Lem. 7.13, p. 34).
The affinoid case is constructed first, by limits of finite disjoint rational covers with `O⁺`
completed in the pseudouniformizer topology, and the general qcqs case is glued from it by
compatibility with open subspaces ([ECD] §7, Lem. 7.14 with proof, pp. 35–36); on the topological
side the right adjoint is constructed on finite T0 spaces as the disjoint union of the
generalization sets `X_x` and extended over cofiltered presentations, and w-local maps preserve
closed points ([BS15] §2.1, Def. 2.1.1, Lem. 2.1.4, Lem. 2.1.9–2.1.10 and Rem. 2.1.11, pp. 6–8). The
construction is not universally open, as the source states explicitly, which is why the separate
cover of D1.9 ([ECD] Lem. 7.18) exists. Define `Perfectoid.wLocalization` as the w-localization
`X^wl` of a qcqs perfectoid space and `Perfectoid.wLocalization.toBase` as the adjunction map
`X^wl → X`; prove `Perfectoid.wLocalization.isWLocal` (`X^wl` is w-local),
`Perfectoid.wLocalization.adjunction` (`Hom_wlocal(W, X^wl) ≅ Hom_qcqs(W, X)`, naturally in `W`,
with counit `X^wl → X`; the left-hand functor forgets the restriction to w-local maps),
`Perfectoid.wLocalization.isProEtale` (the adjunction map is pro-étale, and affinoid pro-étale when
`X` is affinoid), `Perfectoid.wLocalization.pi0` (`π₀(X^wl)` is `|X|` with the constructible
topology, and the component over `x` is the localization of `|X|` at `x`),
`Perfectoid.wLocalization.isOpenEmbedding` (for `U ⊂ X` a quasicompact open subset, `U^wl → X^wl` is
a quasicompact open embedding, and quasicompact open covers induce open covers) and
`Perfectoid.wLocalization.surjective` (the adjunction map is surjective, hence a v-cover). *Needs:*
AdicSpacesPartII R0.19.4; AdicSpacesPartII R0.19.6; D1.7; D0.6; AdicSpacesPartII R0.19.9;
PerfectoidSpaces layer P5 (cofiltered limits of affinoid perfectoid spaces); PerfectoidSpaces layer
P2 (rational localization of perfectoid affinoids); Mathlib `SpectralSpace`,
`WithConstructibleTopology`, `UniformSpace.Completion`.

**Checks.**

- `s1_8_already_w_local` (non-example) — for the one-point space `Spa(C, O_C)` the counit is an
  isomorphism; already-w-local spaces with more than one specialization point need not have this
  property, which is consistent with a right adjoint whose left adjoint, the inclusion, is not full:
  the map `Spa(C, O_C) → Spa(C, C⁺)` onto the rank-one point of a rank-two `Spa(C, C⁺)` is a map of
  w-local spaces that sends the closed point to a non-closed point, so it is not w-local.
- `s1_8_point_with_valuation_ring` (non-example, computed) — for the one-point space `Spa(C, O_C)` the
  w-localization is the same point. For `X = Spa(C, C⁺)` with `C⁺` of rank two, `|X| = {η, s}` is
  w-local, `π₀(X^wl) = |X|_cons` is the two-point discrete space, the component over `s` is
  `X_s = Spa(C, C⁺)` (both points generalize `s`) and the component over `η` is `X_η = Spa(C, O_C)`,
  so `X^wl = Spa(C, C⁺) ⊔ Spa(C, O_C)` has three points `(s, s)`, `(s, η)`, `(η, η)` and the counit
  `X^wl → X` is two-to-one over `η`: not an isomorphism although `X` is w-local.
- `s1_8_pi0_is_constructible_topology` (non-example) — `π₀(X^wl)` is `|X|` with its constructible
  topology; a construction that returns `|X|` with its own topology is wrong.
- `s1_8_not_universally_open` (non-example) — `X^wl → X` is not universally open in general, so it
  must not be confused with the cover of D1.9 ([ECD] Lem. 7.18).

The topological model `DisconnectedTopology.WLocalization X` is the subspace
`{(x,y) ∈ X_cons × X | y ⤳ x}`. Its counit `toBase` is the second projection and
its `componentLabel` is the first. `pi0_mk` fixes the homeomorphism
`ConnectedComponents (WLocalization X) ≃ₜ X_cons` on every point, and
`componentFibre_apply` fixes the homeomorphism from the fibre over `x` to its
set of generalizations by `((x,y), proof) ↦ y`. Here `x ⤳ y` means that `y` is a
specialization of `x`. These equations fix both the topology and the direction.
`IsWLocalMap` requires a spectral map carrying closed points to closed points;
`universal` requires a unique such lift of each spectral `W → X` from a w-local
spectral space. The characteristic equations and universal property are the
spectral-space construction of [BS15] Lemma 2.1.10 and [ECD] Lemmas 7.13–7.14.
The functorial map is `(x,y) ↦ (f(x),f(y))`; `map_id`, `map_comp` and
`toBase_naturality` specify its functor laws and compatibility with the counit.
`map_openEmbedding` states compatibility with quasi-compact open inclusions.

**Checks.**

- `wl_map_swap` — on discrete Bool the nonidentity permutation swaps both
  diagonal pairs, hence swaps their images under the counit.
- `wl_map_collapse` — the map from the Sierpiński space to a point collapses
  all three specialization pairs; the induced map is not injective.
- `wl_map_empty` — the unique map of empty spaces induces the bijection of
  their empty w-localizations.
- `wl_label_point` — the only component fibre over a point has one point.
- `wl_label_generic` — the component labelled by the generic Sierpiński point
  has one point, since that point has no proper generalization.
- `wl_label_closed` — the component labelled by the closed Sierpiński point
  has both points. These are the opposite fibre counts to the counit, so the
  two projections cannot be interchanged.
- `wl_empty` — the specialization-pair space of the empty space is empty.
- `w_map_identity` — the identity of every topological space is a w-local map.
- `w_map_closed_point` — the map from a point to the closed point of the
  Sierpiński space is w-local.
- `w_map_generic_point` — the map from a point to its open point is spectral but is
  not w-local. Both source and target are w-local.
- `wl_three_points` — the Sierpiński space gives three pairs, with
  fibres of sizes two over `η` and one over `s`.
- `wl_two_components` — its component quotient has two points and
  is not homeomorphic to the original Sierpiński space.
- `wl_spec_int_not_open` — for `X = Spec ℤ`, the component label `(2)` is an
  open singleton in `X_cons`; its inverse image in `X^wl` is open, but its
  image `{(0),(2)}` under `toBase` is not Zariski open. Thus even openness
  fails for this spectral-space counit.

The perfectoid counterparts of these topological calculations require the
perfectoid space with its completed structure sheaf, the comparison of its
underlying space with this specialization-pair model, and its pro-étale counit.
The geometric targets above include those constructions; the topological
calculations do not identify a perfectoid space from its point set alone.

**`WLocalization`.** The specialization-pair space remembers both endpoints.

**Checks.**

- `definition_WLocalization_1` — The two-point chain has three specialization pairs.
- `definition_WLocalization_2` — The localization of the empty space is empty.
- `definition_WLocalization_3` — The two-point chain localization is not Hausdorff; taking the patch
  alone loses a specialization.

**`toBase`.** The counit selects the generalizing endpoint.

**Checks.**

- `definition_toBase_1` — On the two-point chain, the fibre over the generic point has two elements.
- `definition_toBase_2` — On the two-point chain, the fibre over the closed point has one element;
  the specialization endpoint would give two.
- `definition_toBase_3` — The counit for the two-point chain is not injective.

**`componentLabel`.** The label selects the specialization endpoint.

**Checks.**

- `definition_componentLabel_1` — On the two-point chain, the fibre labelled by the closed point has
  two elements.
- `definition_componentLabel_2` — For a point the component label is bijective.
- `definition_componentLabel_3` — On the two-point chain the label and counit differ at a
  specialization pair.

**`IsWLocalMap`.** A w-local map must preserve closed points as well as being spectral.

**Checks.**

- `definition_IsWLocalMap_1` — The inclusion of the closed point into the two-point chain is
  w-local.
- `definition_IsWLocalMap_2` — The identity of a point is w-local.
- `definition_IsWLocalMap_3` — The inclusion of the generic point is spectral but is not w-local.

**`pi0`.** The component comparison remembers the closed endpoint of each specialization pair.

**Checks.**

- `definition_pi0_1` — On the two-point chain, the component containing the diagonal point labelled false maps to false.
- `definition_pi0_2` — On a point the unique component is sent to the unique patch point.
- `definition_pi0_3` — On discrete Bool the component labelled true maps to true, excluding the transposition of component labels.

**`componentFibre`.** The fibre identifies with the generalizations of the label, retaining the second coordinate.

**Checks.**

- `definition_componentFibre_1` — In the fibre labelled by the closed point of the two-point chain, the diagonal closed point maps to false.
- `definition_componentFibre_2` — For a point the fibre comparison sends the unique pair to the
  unique point.
- `definition_componentFibre_3` — In the indiscrete two-point space, the fibre over false sends the point with second coordinate true to true, excluding the transposition homeomorphism.

**`map`.** The induced map sends both endpoints through the given continuous map.

**Checks.**

- `definition_map_1` — For the discrete two-point space, the swap switches the generalizing
  coordinate.
- `definition_map_2` — The identity on a point fixes its unique specialization pair.
- `definition_map_3` — Collapsing the discrete two-point space gives a noninjective map of
  w-localizations.

The geometric `Perfectoid.wLocalization` and `Perfectoid.wLocalization.toBase` take a space
`X : Geometry.Spaces p c` and its `qcqs` proof. The theorem
`Perfectoid.wLocalization.adjunction` expresses the Hom bijection by a unique lift that is
spectral and carries closed points to closed points. `Perfectoid.wLocalization.map` and
`Perfectoid.wLocalization.map_spec` specify functoriality and naturality of the counit on
spectral maps. The theorem `Perfectoid.wLocalization.pi0` also identifies the entire underlying
space with `DisconnectedTopology.WLocalization`, compatibly with the counit; the geometric
object carries the perfectoid structure. `Perfectoid.wLocalization.isOpenEmbedding` includes
the image as the union of components labelled by the given quasicompact open
([ECD] Proposition 7.12 and Lemma 7.14, pp. 34–36).

**Geometric construction Checks.** Each name labels a suggested Lean `example` (README only).

- `wLocalization_empty` — the empty base has empty w-localization.
- `wLocalization_hausdorff` — a qcqs base with Hausdorff underlying space is unchanged up to isomorphism.
- `wLocalization_chain` — a strict specialization gives a noninjective counit.
- `toBase_empty` — the counit over the empty base is an isomorphism.
- `toBase_point` — the counit of a one-point field spectrum is an isomorphism.
- `toBase_chain` — the counit over a space with a strict specialization is not an isomorphism.
- `map_identity` — the identity induces the identity on w-localization.
- `map_empty` — a map with empty source induces an injective underlying map.
- `map_collapse` — a noninjective spectral map induces a noninjective map of w-localizations.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D1.9 The universally open strictly totally disconnected cover

**Every affinoid perfectoid space has a universally open affinoid pro-étale strictly totally
disconnected cover.** (*universally-open-std-cover*) Let `X` be an affinoid perfectoid space. Then
there is an affinoid perfectoid space `X̃` with an affinoid pro-étale, surjective and universally
open map `X̃ → X` such that `X̃` is strictly totally disconnected. If `κ` is a cutoff cardinal in
the sense of [ECD] Lem. 4.1 and `X` is `κ`-small, then `X̃` may be taken `κ`-small. The construction
differs from the w-localization of D1.8 precisely in that it is universally open, which the
w-localization is not ([ECD] §7, Lem. 7.18 with proof, pp. 36–37; [ECD] §7, remark before Lem. 7.18,
p. 36). The construction forms simultaneous refinements of the affinoid étale covers of `X`, that
is, the limit `X_∞` over finite products of all affinoid étale surjections onto `X`, which is
already universally open; it iterates this countably and uses finite-stage descent to split the
covers on the resulting limit; and it tracks the number of covers and the cardinality of the
completed ring at each step. The cardinality count uses that the set of isomorphism classes of
affinoid étale surjections onto `X` has cardinality less than `κ`; the countable iteration uses that
countable unions of cardinals less than `κ` are less than `κ`, which is the second clause (countable
suprema) of the cutoff-cardinal theorem of D0.23, and the affinoid approximation of PerfectoidSpaces
layer P6 for the finite-stage descent. The construction uses the `κ`-small-space and approximation
interfaces of PerfectoidSpaces layer P6 and does not redefine pro-étale morphisms. Define
`Perfectoid.stdCover` as, for an affinoid perfectoid `X`, a strictly totally disconnected affinoid
perfectoid space `X̃` over `X`, and `Perfectoid.stdCover.oneStep` as the single step `X_∞`, the
limit over finite products of all affinoid étale surjections, which is already universally open;
prove `Perfectoid.stdCover.isProEtale` (the structure map is affinoid pro-étale),
`Perfectoid.stdCover.surjective` (the structure map is surjective, hence a v-cover),
`Perfectoid.stdCover.universallyOpen` (the structure map is universally open),
`Perfectoid.stdCover.isStrictlyTotallyDisconnected` (`X̃` is strictly totally disconnected) and
`Perfectoid.stdCover.small` (if `X` is `κ`-small then `X̃` may be chosen `κ`-small, for `κ` a cutoff
cardinal). The map is surjective and universally open, and therefore a v-cover that stays a v-cover
after base change, which is what the later descent arguments need ([ECD] Prop. 9.7 and Prop. 11.24)
and the w-localization does not supply; in the strictly totally disconnected case D1.10 then gives
that a quasicompact separated map over `X̃` is affinoid pro-étale when its rank-one fibres satisfy
the profinite-fibre criterion of D1.10. *Needs:* D0.23; D0.24; D1.4; PerfectoidSpaces layer P5
(cofiltered limits of affinoid perfectoid spaces; finite-stage descent of qcqs étale objects);
PerfectoidSpaces layer P6 (`κ`-small perfectoid spaces and affinoid approximation); Mathlib
`Cardinal`.

**Checks.**

- `s1_9_already_std` (degenerate case) — if `X` is already strictly totally disconnected, the identity
  `X → X` is such a cover.
- `s1_9_universally_open` (non-example) — the cover is universally open, unlike the w-localization; a
  construction that produces `X^wl` is wrong.
- `s1_9_point` — for `X = Spa(C, C⁺)` with `C` algebraically closed, the identity is an admissible
  universally open strictly totally disconnected cover.
- `s1_9_smallness` — for `X` `κ`-small the cover `X̃` is `κ`-small, so the construction stays inside the
  `κ`-small site.
- `s1_9_empty_space` (degenerate case) — for `X = ∅` there are no affinoid étale surjections onto `X`
  other than `∅ → ∅`, every step of the construction is empty, and `X̃ = ∅ → ∅` is affinoid
  pro-étale, surjective, universally open and strictly totally disconnected.

`Perfectoid.stdCover` and `Perfectoid.stdCover.oneStep` return a perfectoid affinoid pair
and its Huber-pair map from the specified base. `Perfectoid.stdCover.oneStep_limit` characterizes
the one-step object as the product in the geometric slice of one representative of every
surjective affinoid étale map. This is equivalently the inverse limit of their finite products.
`Perfectoid.stdCover.oneStep_cover` gives affinoid pro-étaleness, surjectivity and openness after
every perfectoid base change. The theorem `Perfectoid.stdCover.small` gives a choice for each
cutoff `κ` with `Cardinal.mk R.A < κ`; it bounds the chosen source ring by the same `κ`,
rather than imposing a bound on every possible cover ([ECD] Lemma 7.18, pp. 36–37).

`Geometry.affinoidProet` means that global affinoid charts identify the map with a Huber-pair
map admitting `Geometry.ProEtalePresentation`. Both charts and their commuting square are
part of the condition ([ECD] Definition 7.8, p. 32).

**Geometric construction Checks.**

- `affinoidProet_identity` — the identity of an affinoid has a constant presentation.
- `affinoidProet_empty` — the map from the zero affinoid to any affinoid is affinoid pro-étale.
- `affinoidProet_infinite_discrete` — an infinite discrete source cannot be affinoid pro-étale.
- `stdCover_empty` — the chosen cover of the zero affinoid has empty spectrum.
- `stdCover_nonempty` — a nonempty base has a nonempty cover.
- `stdCover_nonclosed_field` — over a field that is not algebraically closed, the cover is not an isomorphism.
- `oneStep_empty` — the one-step refinement of the zero affinoid has empty spectrum.
- `oneStep_nonempty` — the one-step refinement of a nonempty affinoid is nonempty.
- `oneStep_nonsplit_cover` — a nonsplit surjective affinoid étale cover prevents the one-step map from being an isomorphism.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D1.10 Pro-étale maps over a strictly totally disconnected base

The last two targets classify the pro-étale perfectoid spaces over a strictly totally disconnected
base: first by their fibres over the rank-one points, then by spectral data on the underlying
topological spaces.

**Quasicompact separated maps to a strictly totally disconnected base are pro-étale iff their
rank-one fibres are profinite.** (*pro-etale-maps-over-std-base*) Let `X` be a strictly totally
disconnected perfectoid space and `f : Y → X` a quasicompact separated morphism of perfectoid
spaces. Then `f` is pro-étale if and only if for every rank-one point `x = Spa(C, O_C)` of `X` there
is a profinite set `S_x` with `Y_x ≅ x × S_x`, where `x × S` is the product of the affinoid
perfectoid space `x` with the profinite set `S` of PerfectoidSpaces layer P6 (`prodProfinite`, the
limit of the `x × S_i` over a presentation of `S` as a cofiltered limit of finite sets `S_i`). In
that case `Y` is strictly totally disconnected and `Y → X` is affinoid pro-étale. The separatedness
hypothesis holds automatically when `Y` is affinoid, since every morphism between affinoid
perfectoid spaces is separated; without separatedness the conclusion fails, as [ECD] Rem. 7.21
records on the topological side ([ECD] §7, Lem. 7.19 with proof, p. 37). For `X = Spa(C, O_C)` the
affinoid pro-étale spaces over `X` are exactly the `X × S` with `S` profinite, the base case
recorded in [ECD] after Def. 7.8; the lemma is the engine of the topological classification of D1.11
and of the later spatial results ([ECD] Prop. 11.30). *Needs:* D1.4; D1.5; AdicSpacesPartII R0.19.2;
PerfectoidSpaces layer P4 (the valuative criterion for separatedness; morphisms of affinoid
perfectoid spaces are separated); PerfectoidSpaces layer P6 (`prodProfinite`); Mathlib `Profinite`.

**Checks.**

- `s1_10_identity` (degenerate case) — the identity of `X` is quasicompact and separated, every fibre
  `Y_x = x` is `x × S_x` with `S_x` a point, and the identity is affinoid pro-étale.
- `s1_10_disc_is_not_pro_etale` (non-example) — for an algebraically closed perfectoid field `C`,
  put `X = Spa(C, O_C)` and `Y = 𝔹 = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)`.
  The structural morphism `Y → X` is quasicompact and separated, and
  the fibre over the unique point is the disc, which is connected with more than one point and so is
  not `x × S` for any profinite `S`; the map is not pro-étale, as the criterion predicts.
- `s1_10_absolute_product_not_quasicompact` — If `C` has characteristic `p`, the absolute
  product `X × 𝔹` has an increasing open cover
  `U_N = {|ϖ₁|^N ≤ |ϖ₂|, |ϖ₂|^N ≤ |ϖ₁|}`, `N ≥ 1`, for a pseudouniformiser `ϖ`.
  The coefficient maps `id` and `c ↦ c^{p^k}`, with every disc coordinate sent to zero,
  give a point outside `U_N` whenever `p^k > N`. Thus this absolute product is not
  quasicompact (PerfectoidSpaces P2.18; [ECD] proof of Proposition 11.4, p. 55).
- `s1_10_profinite_fibre` — for `Y = X × S` with `S` profinite and `X = Spa(C, O_C)` the fibre is `x × S`
  and the map is affinoid pro-étale, the base case of [ECD] after Def. 7.8.
- `s1_10_infinite_disjoint_union` (non-example for the hypothesis) — `Y = ⊔_ℕ X → X = Spa(C, O_C)` is
  pro-étale with fibre `x × ℕ`, `ℕ` discrete and not profinite; it is not quasicompact, so the
  statement does not apply, and the profinite conclusion for the fibre is what quasicompactness
  buys.
- `s1_10_empty_source` (degenerate case) — `Y = ∅ → X` is quasicompact, separated and pro-étale with all
  fibres `x × ∅`, and `∅` is profinite.

`Perfectoid.proEtale_iff_profiniteFibres` is the geometric criterion on
`Geometry.Spaces p c`. Quasicompactness is expressed by `IsSpectralMap` on the underlying map,
and separatedness by `Geometry.closedImm` of its diagonal. The rank-one tests are maps from
algebraically closed `Geometry.FieldPoint`s whose plus ring is the power-bounded subring.
The product `x × S` is specified intrinsically: maps from each perfectoid `T` into the fibre
are uniquely a map `T → x` together with a continuous map `|T| → S`. This is the universal
property of PerfectoidSpaces P6 `prodProfinite`, and quantifying over field extensions makes
the criterion independent of the chosen representative of a rank-one point.
`Perfectoid.proEtale_strictlyDisconnected` gives strict total disconnectedness of the source
and affinoid pro-étaleness under the same quasicompactness and separatedness hypotheses
([ECD] Lemma 7.19, p. 37).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D1.11 Topological classification of pro-étale maps

**Perfectoid spaces pro-étale over a strictly totally disconnected space are classified by spectral
data.** (*topological-classification-of-pro-etale-maps*) Let `T` be a spectral space every connected
component of which is a totally ordered chain of specializations. A spectral map `S → T` with `S`
spectral is affinoid pro-étale when `S → T ×_{π₀(T)} π₀(S)` is a pro-constructible generalizing
embedding. A map `S → T` from a locally spectral space `S` that is locally spectral in the sense of
AdicSpacesPartII R0.0 (`IsLocallySpectralMap`: its restriction between any spectral open subspaces
is spectral, as in [ECD] Def. 2.1) is pro-étale when `S` has an open cover by spectral subspaces on
which the map is affinoid pro-étale; `S` itself is not required to be quasicompact ([ECD] §7, Def.
7.20, second clause, and Rem. 7.21, p. 38). If `S` is spectral and `S → T` is pro-étale, it need not
be affinoid pro-étale: the analogue of the separatedness condition can fail, which is the content of
[ECD] Rem. 7.21. For `X` a strictly totally disconnected perfectoid space, the functor `Y ↦ |Y|`
induces an equivalence between the affinoid pro-étale perfectoid spaces over `X` and the affinoid
pro-étale spectral maps to `|X|`, and an equivalence between arbitrary pro-étale perfectoid spaces
over `X` and the pro-étale maps to `|X|` from locally spectral spaces, locally spectral in the sense
of AdicSpacesPartII R0.0; for a cutoff cardinal `κ` and a `κ`-small base `X`, the `κ`-small versions
of both equivalences use the same cutoff cardinal `κ` on the perfectoid spaces and on the
topological sources. The inverse functor equips a spectral map `S → |X|` with the `ϖ`-adic
completion of the pullback of `O⁺_X` and with the valuations pulled back from `X`, which is what
makes it land in perfectoid spaces, and glues on spectral opens ([ECD] §7, Cor. 7.22 with proof, p.
38). For `X = Spa(C, O_C)` with `C` algebraically closed, affinoid pro-étale objects correspond to
profinite sets. Arbitrary pro-étale objects correspond to spaces covered by open profinite
subspaces, with no global Hausdorffness hypothesis. The term locally profinite here includes
Hausdorffness; such spaces form the Hausdorff full subcategory of this unrestricted topological
category. Restricting the geometric category to separated pro-étale maps `Y → X` gives precisely
this subcategory: on the open product charts, the geometric diagonal has the topological diagonal
as underlying map (PerfectoidSpaces P4.19 and P6.8). The infinite disjoint union of copies of `X`
corresponds to the infinite discrete locally profinite set `ℕ` and is pro-étale but neither
affinoid nor profinite. The classification
reduces descent of étale maps to a purely topological statement about local isomorphisms
([ECD] Prop. 9.7). *Needs:* D1.10; D1.5;
AdicSpacesPartII R0.0; D0.6; PerfectoidSpaces P4.19, P6.7–P6.8;
Mathlib `SpectralSpace`, `IsSpectralMap`, `Profinite`,
`UniformSpace.Completion`.

**Checks.**

- `s1_11_identity` (degenerate case) — for `S = T` the map `T → T ×_{π₀(T)} π₀(T) = T` is the identity, a
  pro-constructible generalizing embedding, so the identity is affinoid pro-étale.
- `s1_11_profinite_over_a_point` — for `T` a point, `T ×_{π₀(T)} π₀(S) = π₀(S)` and `S → π₀(S)` is
  an embedding exactly when `S` is profinite; affinoid pro-étale spectral maps to a point are the
  profinite sets, matching D1.10.
- `s1_11_generalizing_subset_of_a_chain` — for `T = {η, s}` the Sierpiński chain and `S = {η}`, the map
  `S → T ×_{π₀(T)} π₀(S) = T` is the open embedding `{η} → T`, pro-constructible and generalizing,
  so it is affinoid pro-étale; for `S = {s}` the embedding is closed and not generalizing, so it is
  not.
- `s1_11_locally_profinite` (non-example for affinoidness) — the infinite discrete `ℕ` over a point is
  pro-étale (an open cover by points, each affinoid pro-étale) but not affinoid pro-étale, since `ℕ`
  is not spectral; it is the underlying space of `⊔_ℕ Spa(C, O_C)`.
- `s1_11_doubled_limit` (non-example for Hausdorffness) — let `S = OnePoint ℕ = ℕ ∪ {∞}` with
  its profinite one-point compactification topology, and glue two copies along the open `ℕ`.
  The resulting `T = S₊ ⊔_ℕ S₋` has two open profinite charts and is quasicompact, but every pair
  of neighbourhoods of `∞₊` and `∞₋` meets on a cofinite tail. It is not Hausdorff; the charts'
  intersection `ℕ` is not quasicompact. Gluing `X × S₊` and `X × S₋` along `X × ℕ` gives a
  perfectoid space pro-étale over `X = Spa(C, O_C)` with underlying space `T`, by PerfectoidSpaces
  P6.7 and P6.8. It belongs to the unrestricted classification and fails the Hausdorff condition.

The geometric equivalences are `Perfectoid.affinoidProEtale_equivalence` and
`Perfectoid.proEtale_equivalence`, for `X : Geometry.Spaces p c` with
`Geometry.strictlyDisconnected p c X`. Their signatures include a natural isomorphism to
`Over.post (Geometry.space p c)`, fixing the underlying-space functor on objects and morphisms.
The topological categories are the corresponding full subcategories of
`DisconnectedTopology.AffinoidOver` and `DisconnectedTopology.ProEtaleOver`; the latter and
`Perfectoid.proEtale_equivalence` impose no `T2Space` hypothesis on the source. At the fixed
universes of `Geometry`, affinoid sources have `Small.{0}` underlying sets, while general
sources have `Small.{1}` underlying sets and an open cover by `Small.{0}` subspaces. These
are the point-set forms of `Geometry.HasAffinoidCharts`: chart points form `Small.{0}` sets by
`Geometry.hasAffinoidCharts_iff_small`, and the converse for these pro-étale sources is supplied by
`Perfectoid.proEtaleInverse_small` below. The canonical map of an affinoid source into
`|X| ×_{π₀(X)} π₀(S)` identifies it with its pro-constructible generalizing image, which can be a
proper subset. The inverse equips that image, identified with `S`, with
`O⁺_S = (g⁻¹O⁺_X)^∧_ϖ` and `O_S = O⁺_S[1/ϖ]`, retaining the point valuations pulled back from
`X`. It then resizes the resulting pair, rather than replacing the image by the component fibre
product. The `TopCat.{2}` lift does not enlarge the geometric objects ([ECD] Definition 7.20 and
Corollary 7.22, p. 38; Remark 4.3 and Proposition 4.4, pp. 20–21).

**Resizing the pro-étale inverse on its image.** For prime `p`, either characteristic selector `c`,
a strictly totally disconnected `X : Geometry.Spaces p c`, and an affinoid pro-étale spectral map
`g : S → |X|` with `Small.{0} S`, prove `Perfectoid.proEtaleInverse_small`: the section ring of the
inverse construction above is `Small.{0}`, its spectrum is charted, and its underlying-space
comparison is the specified identification with `S` over `|X|`. The resized pair maps to the
unresized inverse by an isomorphism compatible with sections, point valuations and maps over `X`.
For locally pro-étale `S` with `Small.{1} S` and an open cover by `Small.{0}` affinoid pro-étale spectral subspaces,
apply this assertion on the cover and glue the same comparison.

The bound uses D1.3 to make `X` affinoid and `Geometry.hasAffinoidCharts_iff_small` to resize its
ring. The profinite component space of `S` is `Small.{0}`. Construct `X × π₀(S)` as the limit of
finite disjoint unions of `X` over its finite clopen partitions; its ring is a completed filtered
colimit of finite products of the resized ring. There are `Small.{0}` many partitions, so the
colimit and its `ϖ`-adic completion remain `Small.{0}`. The component-agreement subspace and then
the image of `S` are pro-constructible generalizing subsets. D1.5 constructs their rings from
rational localizations and completed colimits indexed by finite sets of inequalities in the resized
ambient ring. These index sets and localizations are `Small.{0}`; completion is bounded by sequences
in a dense ring (D0.24), and inversion of `ϖ` uses countably many powers. The resulting structure is
the completed pullback with its valuations in the proof of [ECD] Corollary 7.22. This proves the
bound on the actual image ([ECD] Lemma 7.6, pp. 31–32; Definition 7.20 and Corollary 7.22 with
proof, p. 38; Remark 4.3, p. 20). *Needs:* AdicSpacesPartII R0.19.5–R0.19.8; D1.3; D1.5; D0.24;
PerfectoidSpaces P2 (rational localization), P5.1–P5.4 (completed colimits and spectral limits);
`Geometry.hasAffinoidCharts_iff_small`.

**Checks.**

- `proEtaleInverse_small_identity` — For `g = id` the resized inverse is `X`, with the identity on
  valuations and sections; the component image is the whole fibre product.
- `proEtaleInverse_small_profinite` — Over `Spa(C, O_C)` with `C : Type` algebraically closed,
  a profinite `S : Type` gives the lift of `(C⁰(S, C), C⁰(S, O_C))`, with evaluations as valuations.
- `proEtaleInverse_small_rank_two` — For a small algebraically closed perfectoid field `C` and a
  rank-two plus ring `C⁺`, apply both restricted equivalences and their resizing comparison to
  `{η} → |Spa(C, C⁺)|`. The inverse is the generic-point open `Spa(C, O_C)` and its plus ring is
  `O_C`; the component fibre product is the two-point base. The comparison preserves the
  generic-point inclusion and does not acquire the closed point.

`Perfectoid.proEtale_cardinal_iff` identifies the restrictions to a cutoff: for a strictly
totally disconnected affinoid base `R` with `Cardinal.mk R.A < κ`, where `κ` is a cutoff,
a pro-étale source has fewer than `κ` points and all its affinoid open rings have cardinality
less than `κ` exactly when its underlying space has fewer than `κ` points. Thus both
equivalences restrict using the same `κ` ([ECD] Corollary 7.22, p. 38).

The precise topological predicates are `DisconnectedTopology.IsAffinoidProEtale`
and `DisconnectedTopology.IsProEtale`. For a continuous map `f : S → T`,
`ComponentPullback f` is the subspace of `T × ConnectedComponents S` where the
components agree under Mathlib's `Continuous.connectedComponentsMap`.
`componentMap f` is the canonical map `s ↦ (f(s), [s])`.
The affinoid predicate includes spectrality of both spaces and a spectral map,
and requires this specified map to be an embedding with pro-constructible,
generalizing image. The local predicate explicitly includes local spectrality
of `S` and a cover by open subspaces satisfying the affinoid predicate. The
categories `AffinoidOver T` and `ProEtaleOver T` are the corresponding full
subcategories of Mathlib's `Over T`, with all continuous maps over `T` as
morphisms. These predicates are defined for arbitrary `T`; the equivalence
with perfectoid spaces has the chain-component and strictly totally disconnected
base hypotheses stated above ([ECD] Definition 7.20 and Corollary 7.22, p. 38).

**Checks.**

- `component_pullback_empty` — an empty source gives an empty component fibre product.
- `component_pullback_point` — over a point the component fibre product is
  homeomorphic to `ConnectedComponents S`.
- `component_pullback_identity` — for the identity of `T` it is homeomorphic to `T`.
- `component_map_empty` — the canonical map on the empty source is bijective.
- `component_map_identity` — the canonical map for the identity is bijective.
- `component_map_point` — for the map from the Sierpiński space to a point,
  the canonical map collapses its two points, so it is not injective.
- `proetale_empty_source` — the empty space over a point satisfies both predicates.
- `closed_point_not_proetale` — a point mapping to the closed point of the
  Sierpiński space fails even the local predicate. It has no smaller nonempty
  open neighbourhood on which the image could become generalizing.

The `s1_11_identity`, `s1_11_profinite_over_a_point`, `s1_11_generalizing_subset_of_a_chain`, and
`s1_11_locally_profinite` Checks above test these same predicates directly. In particular,
`ℕ → *` passes the local predicate and fails the affinoid predicate. The topological
comparison does not construct the perfectoid inverse functor: that functor must
also build the completed pullback of `O⁺` and its point valuations.

**`ComponentPullback`.** The target is the fibre product with the component quotient.

**Checks.**

- `definition_ComponentPullback_1` — For the map from a two-point discrete space to a point, the
  pullback has two points.
- `definition_ComponentPullback_2` — For the empty source the pullback is empty.
- `definition_ComponentPullback_3` — For the two-point chain mapping to a point, the pullback is a
  singleton, not the chain.

**`componentMap`.** The canonical map retains the image and connected component.

**Checks.**

- `definition_componentMap_1` — Over a point, the component map of the discrete two-point space is
  bijective.
- `definition_componentMap_2` — The component map of the identity of a point is bijective.
- `definition_componentMap_3` — The component map from the two-point chain to a point identifies its
  two points.

**`IsAffinoidProEtale`.** The affine predicate requires a spectral source and a generalizing image.

**Checks.**

- `definition_IsAffinoidProEtale_1` — A discrete two-point space over a point is affinoid pro-étale.
- `definition_IsAffinoidProEtale_2` — The empty space over a point is affinoid pro-étale.
- `definition_IsAffinoidProEtale_3` — The closed-point inclusion in the two-point chain fails the
  generalizing-image condition.

**`IsProEtale`.** The local predicate permits an infinite disjoint union of affine pieces.

**Checks.**

- `definition_IsProEtale_1` — Discrete ℕ over a point is pro-étale.
- `definition_IsProEtale_2` — The empty space over a point is pro-étale.
- `definition_IsProEtale_3` — The closed-point inclusion in the two-point chain is not pro-étale.

**`AffinoidOver`.** The affinoid slice remembers the quasi-compact spectral source.

**Checks.**

- `definition_AffinoidOver_1` — The discrete two-point space over a point is an affinoid pro-étale
  object.
- `definition_AffinoidOver_2` — The empty space over a point is an object.
- `definition_AffinoidOver_3` — Discrete ℕ over a point is not an affinoid object.

**`ProEtaleOver`.** The local slice allows a noncompact union of pro-étale opens.

**Checks.**

- `definition_ProEtaleOver_1` — Discrete ℕ over a point is pro-étale.
- `definition_ProEtaleOver_2` — The empty space over a point is pro-étale.
- `definition_ProEtaleOver_3` — The real line over a point is not pro-étale: it is not locally
  spectral.

**Perfectoid geometric carriers.** `Geometry.Affinoid p c` extends the supplied
`Perfectoid.PairCat p`, with rings in `Type`, by `(p : A) = 0` when `c = true`.
`Geometry.Affinoid.ulift p c : Geometry.Affinoid p c ⥤ Perfectoid.PairCat.{1} p` replaces the ring
`A` by `ULift.{1} A`, with the ring, uniform structure and plus ring transported along the
continuous ring isomorphism `ULift.down` (Mathlib `ULift.uniformSpace`, `ULift.instCompleteSpace`
and the `IsTopologicalRing (ULift R)` instance), and conjugates pair maps by `ULift.up` and
`ULift.down`. It is fully faithful, and an object of `PairCat.{1} p` lies in its essential image
exactly when its ring `A` satisfies `Small.{0} A ∧ (c = true → (p : A) = 0)`: the structure
and characteristic condition then transport to `Shrink.{0} A`. For `c = false` the criterion
is just `Small.{0} A`.
`Geometry.HasAffinoidCharts p c` is the property of `X : PerfectoidSpace.Perfd.{1} p` that every
point has an open neighbourhood `U` for which `X.obj.restrict U.isOpenEmbedding` is isomorphic in
`PreAdicSpace.{1}` to `PerfectoidSpace.ofPair p` of the lift of some `R : Geometry.Affinoid p c`.
`Geometry.Spaces p c` is `ULiftHom.{2}` of its full subcategory, `Geometry.Perfd p` and
`Geometry.Perf p` are the values at `false` and `true`, and `Geometry.toPerfectoid` forgets the
chart condition and the Hom lift. `Geometry.affine p R` is `PerfectoidSpace.ofPair p` of the lift of
`R`, charted by its identity, and `Geometry.affineMap` applies `PerfectoidSpace.spaFunctor` to
lifted pair maps; `Geometry.space` retains the supplier's topology ([ECD] Definitions 3.1 and 3.19,
p. 18; Definition 4.2 and Proposition 4.4, pp. 20–21). For prime `p`, either characteristic
selector, and every pair map `f`, `Geometry.toPerfectoid_affineMap` identifies the forgotten
`Geometry.affineMap p f` with `PerfectoidSpace.spaFunctor.map` of the opposite of the lifted pair
map. Thus both objects and arrows come from the supplied perfectoid category.

**Closure and resizing of the charted carrier.** For a prime `p`, prove
`Geometry.hasAffinoidCharts_iff_small`: `X : PerfectoidSpace.Perfd.{1} p` satisfies
`Geometry.HasAffinoidCharts p false` exactly when the section ring of every affinoid perfectoid open
of `X` is `Small.{0}`, and the points of every such open then form a `Small.{0}` set. The forward
direction is the argument of [ECD] Proposition 4.4: an affinoid open is covered by finitely many
rational subsets of charts, whose rings are completed localizations of `Small.{0}` Tate rings and so
`Small.{0}` by [ECD] Remark 4.3 and D0.24; its ring embeds into their product, and the points of
`Spa(A, A⁺)` embed into the binary relations on `A`. Conversely, the section ring of an affinoid
perfectoid neighbourhood recovers its pair by `PerfectoidSpace.globalSectionsAffinoidEquiv_spec`,
and a `Small.{0}` pair is a lift. Prove also `Geometry.hasAffinoidCharts_true_iff` (the `true`
property is `PerfectoidSpace.InCharP` together with the `false` property: sections over every open
embed into a product of rational localizations of charts), `Geometry.hasAffinoidCharts_restrict`
(open subspaces of charted objects are charted: rational subsets of a chart form a basis and are
again charts, by the rational localization of perfectoid pairs in `Type`),
`Geometry.hasAffinoidCharts_pullback` (the fibre product of `PerfectoidSpace.hasPullbacks` of
charted objects is charted: it is covered by the spectra of the completed tensor products
`Perfectoid.PairCat.tensorPair` of charts, whose rings are `Small.{0}`),
`Geometry.hasAffinoidCharts_tilt` (`X` is charted with `c = false` exactly when its image under
`PerfectoidSpace.tiltFunctor p` is charted with `c = true`: tilting identifies the affinoid
perfectoid opens of `X` and `X♭`, `PerfectoidSpace.tiltSpaIso` identifies the tilt of a chart with
the spectrum of the lift of `Geometry.tiltAffinoid R`, and for a perfectoid Tate ring `A` the set
`A♭` embeds into `A^ℕ` while `A` is a quotient of a localization of `W(A♭⁺)`; so the untilts of
charted spaces, including the spaces over a fixed untilt in [ECD] Corollary 3.20, stay in the
carrier) and `Geometry.hasAffinoidCharts_of_etale` (for either `c`, the source of a morphism of
`Perfd.{1} p` satisfying `PerfectoidSpace.IsEtale p` with charted target is charted: locally it is
an open subspace of a finite étale `Spa(S, S⁺)` over a chart, and `S` is a finite module over a
`Small.{0}` ring). Disjoint unions indexed in `Type 1` are `Geometry.hasCoproducts` below. Pro-étale
sources are not preserved (`hasAffinoidCharts_proEtale_large_profinite`), so the pro-étale and
v-sites of D2 are formed on `Geometry.Spaces`, whose fibre products are those of
`Geometry.hasAffinoidCharts_pullback` ([ECD] Definition 4.2, Remark 4.3 and Proposition 4.4 with
proof, pp. 20–21; Theorem 3.18, Definition 3.19 and Corollary 3.20, pp. 18–19; Theorem 6.1 and
Definition 6.2, p. 26; [Sch12] §6, Prop. 6.18 with proof, p. 38). *Needs:* D0.24; PerfectoidSpaces
layers P1–P3; Mathlib `ULift`, `Shrink`, `Small`.

**Checks.**

- `hasAffinoidCharts_coproduct_large` — The disjoint union, indexed by `Type`, of copies of the
  spectrum of the lift of an algebraically closed perfectoid field pair `(C, O_C)` with `C : Type`
  is charted, although its set of points is not `Small.{0}`: the condition is local.
- `hasAffinoidCharts_proEtale_large_profinite` (non-example) — Let `S` be the profinite space
  `Type → Bool` and `X` the spectrum of the lift of `(C, O_C)`. `PerfectoidSpace.prodProfinite`
  gives `X × S̲` in `Perfd.{1} p`, affinoid pro-étale over `X`, and it is not charted: it is
  quasicompact, so finitely many charts would make its point set `S` `Small.{0}`, contradicting
  `not_small_type`. This is the ambient perfectoid limit excluded by
  `s5_3_large_index_not_chart_small` in D5.3.
- `hasAffinoidCharts_pullback_affine` — Over a third chart, the fibre product of two charts is the
  spectrum of the lift of their completed tensor product formed in `Type`.
- `hasAffinoidCharts_tilt_affine` — The tilt of the spectrum of the lift of `R` is the spectrum of
  the lift of `Geometry.tiltAffinoid R`.
- `hasAffinoidCharts_etale_large_fibre` — For `X` the spectrum of the lift of `(C, O_C)`, the fold
  map to `X` from the disjoint union of copies of `X` indexed by `Type` is étale, a local
  isomorphism, with a fibre that is not `Small.{0}`; its source is charted, since the étale clause
  is local on the source, unlike the pro-étale counterexample.

For a prime `p` and either value of `c`, `Geometry.hasCoproducts` gives
`HasCoproducts.{1} (Geometry.Spaces p c)`: the disjoint union in `PreAdicSpace.{1}` of a
`Type 1`-indexed family of charted perfectoid spaces is charted, each summand chart remaining an
open chart. `Geometry.space_coproduct` identifies the valuation topology of each
Type 1 indexed coproduct with the topological disjoint union and sends each
summand point to the specified `Sigma.ι` image ([Berkeley] Definition 3.4.1,
p. 22; [ECD] Definition 3.19, p. 18). The abstract `coverSplits`, disconnectedness
and sheaf-morphism predicates keep the coproduct index universe independent of
the Hom universe. Here it is 1, although `ULiftHom` makes morphisms live in
universe 2; lifting morphisms does not enlarge the geometric point sets.

**`Geometry.hasCoproducts` — Checks.**

- `hasCoproducts_empty` — An empty indexed union has no valuation points.
- `hasCoproducts_singleton` — The inclusion of the sole summand is an isomorphism.
- `hasCoproducts_distinct_summands` — Points in the two summands of a binary union remain distinct.

`Geometry.finiteEtalePair` is `Perfectoid.Pair.IsFiniteEtale`: a finite étale
algebra with its natural module topology and the integral closure of the source
plus ring. `Geometry.etale` is the transported `PerfectoidSpace.IsEtale`, locally
an open immersion followed by a finite étale map ([ECD] Definition 6.2).
For prime `p`, either characteristic selector and any morphism of the selected
perfectoid pairs, `Geometry.finiteEtalePair_iff` identifies this affine condition
with `PerfectoidSpace.IsFiniteEtale` on the image of `Geometry.affineMap` under
`Geometry.toPerfectoid`; it applies `PerfectoidSpace.finiteEtale_spa_iff`.
The étale agreement holds definitionally for every geometric morphism.
`Geometry.ProEtalePresentation` includes the compatible filtered system of étale affinoids,
its valuation-space limit, and density of the union of the function rings;
`Geometry.proet` requires such presentations locally on source and target
([ECD] Definition 7.8; [Berkeley] Definition 2.4.1).

`Geometry.totallyDisconnected` and `Geometry.strictlyDisconnected` specialize
`IsTotallyDisconnectedPerfectoid` and `IsStrictlyTotallyDisconnected` directly.
For any `X : Geometry.Spaces p c`, `Geometry.totallyDisconnected_iff` and
`Geometry.strictlyDisconnected_iff` express these definitional identifications.
`Geometry.totallyDisconnected_iff_surjective` characterizes total disconnectedness
as qcqs together with splitting of every surjective local open isomorphism to `X`;
`Geometry.strictlyDisconnected_iff_surjective` characterizes strict total disconnectedness
as qcqs together with splitting of every surjective étale map to `X`.
The open and étale topologies are respectively `Perfd.proEtaleTopology
(Geometry.space p c) (Geometry.openImm p c)` and the same construction with
`Geometry.etale p c`. For these open morphism classes, the finite compact-open
image condition is equivalent to joint surjectivity. Disjoint unions turn
Type 1 indexed covering families into single maps; local charts refine a
surjective local open isomorphism to an open cover. Thus splitting the single
maps is equivalent to `coverSplits` for the indicated topology
([ECD] Definition 7.1, p. 29; Definition 7.15, p. 36).

`Geometry.FieldPoint` adds the field condition and a valuation plus ring to an affinoid,
using the inherited ring structure. `Geometry.ComponentModel` identifies a component with
such a field spectrum through a universal geometric inclusion, whose image is exactly
the fibre of the connected-component quotient. Its algebraically closed variant is the
strictly disconnected case ([ECD] Definition 7.1, Lemma 7.3 and Proposition 7.16).

**Geometric carrier Checks.** The following contracts specialize the definitions to
`Geometry.Perf`, `Geometry.Perfd` and the supplied Yoneda-adic spaces.

**`Geometry.Affinoid` — Checks.**

- `perfectoid_pair_reduced` — A perfectoid pair has reduced underlying ring.
- `perfectoid_zero_pair` — The zero ring gives the empty perfectoid affinoid, in either characteristic convention.
- `perfectoid_char_p_excludes_char_zero` — A nonzero characteristic-p affinoid cannot carry characteristic zero.

**`Geometry.Affinoid.A` — Checks.**

- `Affinoid_A_char_p` — The characteristic-p selector makes p vanish in the supplied ring.
- `Affinoid_A_zero` — A zero supplied ring still has zero equal to one after projection.
- `Affinoid_A_nonzero` — A nonzero supplied ring retains distinct zero and one.

**`Geometry.Affinoid.P` — Checks.** The projection retains the chosen ring of integral elements
([ECD] §3, paragraph on rings of integral elements before Definition 3.1, p. 14).

- `Affinoid_P_rank_two` — Let `C` be a perfectoid field whose residue field `k` has a nontrivial
  rank-one valuation ring `V`. Put `C⁺ = {x ∈ O_C | x̄ ∈ V}`, a proper rank-two plus ring.
  Both `1` and a pseudouniformizer `ϖ` belong to `P = C⁺`: their residues are `1` and `0`.
- `Affinoid_P_proper` — Choose `a ∈ k` outside `V` and a unit `u ∈ O_C` lifting `a`.
  Then `u` is power-bounded but does not belong to `P = C⁺`; replacing `P` by `O_C` fails.
- `Affinoid_P_maximal` — For the maximal-plus pair `(C, O_C)`, `P = O_C`, including the same `u`.
- `Affinoid_P_zero` — The plus subring of a zero pair is the whole ring.

**`Geometry.Affinoid.toCAff` — Checks.**

- `Affinoid_toCAff_plus` — Forgetting perfectoidness retains the exact plus subring.
- `Affinoid_toCAff_zero` — The zero pair remains zero as a complete Huber pair.
- `Affinoid_toCAff_nonzero` — Forgetting perfectoidness does not collapse a nonzero ring.

**`Geometry.Affinoid.ulift` — Checks.**

- `Affinoid_ulift_down` — `ULift.down` is a continuous ring isomorphism from the lifted ring onto
  the supplied ring, carrying the lifted plus ring onto the supplied plus ring.
- `Affinoid_ulift_homs` — Pair maps between two lifts are exactly the conjugates of pair maps by
  `ULift.up` and `ULift.down`; distinct pair maps have distinct lifts.
- `Affinoid_ulift_zero` — The zero pair lifts to the zero pair, whose spectrum is empty.
- `Affinoid_ulift_cyclotomic_selector` (non-example) — The lift of the
  `Perfectoid.padicCyclotomic p` pair is in the essential image for `false` and outside it for
  `true`: its ring is `Small.{0}` but `(p : ULift.{1} (Perfectoid.padicCyclotomic p)) ≠ 0`
  ([ECD] Example 3.4(i), pp. 14–15).

**`Geometry.HasAffinoidCharts` — Checks.**

- `HasAffinoidCharts_affine` — The spectrum of the lift of any `R : Geometry.Affinoid p c` has the
  property, with the whole space as its chart.
- `HasAffinoidCharts_empty` — The empty perfectoid space has the property for both selectors; no
  point needs a chart.
- `HasAffinoidCharts_large_field` (non-example) — Let `K : Type 1` be a perfectoid field that is not
  `Small.{0}`, for instance the completed perfection of `k((t))` for `k` the perfect closure of
  `𝔽_p(X_i : i ∈ Type)`. Then `Spa(K, K°)` is an object of `PerfectoidSpace.Perfd.{1} p` and of
  `Perf.{1} p` without the property for either selector. It has one point, so a chart around it is
  the whole space, and `PerfectoidSpace.globalSectionsAffinoidEquiv_spec` would make `K` isomorphic
  to `ULift.{1}` of a ring in `Type`.
- `HasAffinoidCharts_cyclotomic_selector` (non-example) — The spectrum of the lift of
  `Perfectoid.padicCyclotomic` with its power-bounded plus ring has the property for `false` and
  not for `true`, since `p ≠ 0` in its ring.

**`PerfectoidSpace.IsPerfectoidSpace` and `PerfectoidSpace.InCharP` — Checks.**

- `perfectoid_affine_chart` — A perfectoid affinoid is covered by its identity chart.
- `perfectoid_empty_space` — The empty adic space satisfies the atlas condition.
- `perfectoid_characteristic_detected` — A nonzero value of p on an affinoid excludes a characteristic-p perfectoid atlas.

**`Geometry.Spaces` — Checks.**

- `Spaces_all_characteristics` — The false selector gives exactly the Hom lift of the full subcategory of supplied `Perfd.{1}` on `Geometry.HasAffinoidCharts p false`.
- `Spaces_characteristic_p` — The true selector gives exactly the Hom lift of the charted objects of supplied `Perf.{1}`, a full subcategory of the false selector.
- `Spaces_characteristic_required` — Every object selected by true satisfies the supplied `InCharP` predicate after forgetting the lift.

**`Geometry.exists_wedhornComparison` — Checks.**

- `wedhornComparison_affinoid` — On `Geometry.affine p R` the functor gives
  `YonedaAdicSpace.ofSpaY R.toCAff`, and its underlying-space isomorphism there pulls valuations
  back along `ULift.up`, after the universe lifts of `YonedaAdicSpace.space_ofSpaY`.
- `wedhornComparison_empty` — The empty perfectoid space goes to the initial Yoneda-adic sheaf, the
  spectrum of the zero pair.
- `wedhornComparison_large_field` (non-example) — `Spa(K, K°)` of `HasAffinoidCharts_large_field`
  is a Wedhorn pre-adic space outside the essential image: full faithfulness of the comparison does
  not reach it.

**`Geometry.space` — Checks.**

- `space_affine_compact` — The valuation topology of a perfectoid affinoid is compact.
- `space_zero_pair_empty` — The zero pair has no valuation points.
- `space_field_nonempty` — A perfectoid field gives a nonempty underlying space.

**`Geometry.affine` — Checks.**

- `affine_maps_recover_pair_maps` — Maps between affine objects recover precisely the continuous plus-preserving ring maps, contravariantly.
- `affine_zero_initial` — The affine zero pair is initial among perfectoid spaces.
- `affine_distinct_ring_maps` — Distinct pair maps remain distinct geometric maps.

**`Geometry.affineMap` — Checks.**

- `affine_map_composition_order` — The composite reverses the order of two ring maps.
- `affine_map_identity` — The identity ring map induces the identity geometric map.
- `affine_map_valuation_pullback` — At a valuation the geometric map is the supplied Spa comap, with no permutation of points.

**`Geometry.finiteEtalePair` — Checks.**

- `finite_etale_identity` — The identity pair map is finite étale, including the plus-ring condition.
- `finite_etale_empty_target` — A map to the zero pair represents the empty finite étale cover.
- `finite_etale_excludes_infinite_fibre` — An infinite valuation fibre excludes finite étaleness.
- `finiteEtalePair_iff_all_characteristics` — With selector false, the affine predicate is equivalent to the supplied geometric finite étale predicate.
- `finiteEtalePair_iff_characteristic_p` — The same equivalence holds in the characteristic-p full subcategory, with its extra inclusion on arrows.

**`Geometry.etale` — Checks.**

- `etale_open_chart` — An open immersion of perfectoid spaces is étale.
- `etale_empty_source` — A morphism from the empty perfectoid space is étale.
- `etale_excludes_nonopen_image` — A nonopen image excludes étaleness.
- `etale_supplier_agreement` — For either selector, every geometric arrow has exactly the supplier's étale predicate after forgetting the Hom lift.

**`Geometry.ProEtalePresentation` — Checks.**

- `proet_presentation_constant` — A finite étale map has its constant inverse-system presentation.
- `proet_presentation_identity` — The identity is presented on the one-object filtered category.
- `proet_presentation_nonempty_index` — The empty index cannot describe an affinoid pro-étale presentation.

**`Geometry.proet` — Checks.**

- `proet_etale_map` — Every geometric étale map is pro-étale.
- `proet_identity` — The identity perfectoid map is pro-étale.
- `proet_algebraically_closed_field` — Over an algebraically closed perfectoid field, a pro-étale map from a field has no proper field extension.

**`Geometry.totallyDisconnected` — Checks.**

- `disconnected_field_spectrum` — A perfectoid field spectrum is totally disconnected, including nonmaximal plus rings.
- `disconnected_empty` — The empty perfectoid affinoid is totally disconnected.
- `disconnected_infinite_discrete_obstruction` — An infinite discrete perfectoid space fails the required quasicompactness.

**`Geometry.strictlyDisconnected` — Checks.**

- `strictly_disconnected_closed_field` — An algebraically closed perfectoid field is strictly totally disconnected.
- `strictly_disconnected_empty` — The empty affinoid is strictly totally disconnected.
- `strictly_disconnected_field_obstruction` — A field that is not algebraically closed is not strictly totally disconnected.

**`Geometry.FieldPoint` — Checks.**

- `field_point_inverse` — Every nonzero field element has its inverse in the same inherited ring.
- `field_point_zero_not_unit` — Zero is not a unit; the zero affinoid cannot be a field point.
- `field_point_unique_closed_point` — The chosen valuation subring determines a unique closed point of its spectrum.

**`Geometry.ComponentModel` — Checks.**

- `component_model_field` — A field spectrum represents its only connected component.
- `component_model_mono` — The universal component inclusion is a geometric monomorphism.
- `component_model_distinct_disjoint` — Distinct component models have disjoint images.

**Checks.**

- `component_map_coordinates` — For a continuous map f and a point s, the component comparison has coordinates f(s) and the connected component of s.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### Examples

The worked examples of this layer are the checks above and the acceptance cases of the theorems: the
one-component space `Spa(K, K⁺)` of a perfectoid field, which is totally disconnected, connected,
and has the unique closed point given by `K⁺`; the finite disjoint unions, with the infinite
disjoint union as the non-quasicompact non-example; the perfectoid closed unit disc, qcqs but
connected with many closed points; the product `S × Spa(C, O_C)` of a profinite set with a geometric
point, whose component projection is the first projection and which is strictly totally disconnected
when `C` is algebraically closed; the two-point discrete space, on which every open cover splits
while global sections `Set × Set → Set` does not preserve binary coproducts; the completed
cyclotomic field `Spa(ℚ_p(ζ_{p^∞})^∧, O)`, totally disconnected but not strictly so; the
identification of the points of `Spa(K, K⁺)` with `Spec(K⁺/ϖ)` in the faithful-flatness argument;
the rank-two `Spa(C, C⁺)`, a Sierpiński space which is connected, totally disconnected and strictly
so for `C` algebraically closed, whose closed point is pro-constructible but not generalizing and
whose open point is `{|g⁻¹| ≤ 1}`; the totally disconnected `Z ⊂ S × Spa(C, C⁺)` whose closed points
are not closed; the one-point space `Spa(C, O_C)`, on which the w-localization counit is an
isomorphism, against the rank-two `Spa(C, C⁺)`, whose w-localization is `Spa(C, C⁺) ⊔ Spa(C, O_C)`
with a two-to-one counit over the rank-one point; `π₀(X^wl) = |X|_cons` rather than `|X|`; the
identity cover of an already strictly totally disconnected space; the base case that the affinoid
pro-étale spaces over `Spa(C, O_C)` are the `Spa(C, O_C) × S` with `S` profinite; and the infinite
disjoint union of copies of `Spa(C, O_C)`, pro-étale but neither affinoid nor profinite.

The splitting and w-locality Checks are specified in prose.

### Dependencies

Layer D0: locally spectral spaces and locally spectral maps (AdicSpacesPartII R0.0), the profinite
constructible topology (AdicSpacesPartII R0.19.1), pro-constructible subsets (AdicSpacesPartII
R0.19.2), the profinite space of connected components (D0.6), surjective generalizing spectral maps
as quotient maps (AdicSpacesPartII R0.19.4), cofiltered limits of spectral spaces (AdicSpacesPartII
R0.19.6), spectral spaces as the pro-category of finite T0 spaces (AdicSpacesPartII R0.19.9), cutoff
cardinals (D0.23) and the cardinality bound for completions (D0.24). PerfectoidSpaces layer P2
(perfectoid spaces and glued tilting, completed residue fields, rational localization of perfectoid
affinoids), layer P3 (étale-site tilting and étale almost acyclicity), layer P4 (the injection of
residue-field points, the valuative criterion for separatedness, separatedness of morphisms of
affinoid perfectoid spaces), layer P5 (cofiltered limits of affinoid perfectoid spaces, finite-stage
descent of qcqs étale objects) and layer P6 (pro-étale morphisms, `κ`-small perfectoid spaces,
affinoid approximation and the product `X × S` with a profinite set). Mathlib `SpectralSpace`,
`IsSpectralMap`, `ConnectedComponents`, `Profinite`, `WithConstructibleTopology`,
`Topology.IsConstructible`, `StableUnderGeneralization`, `IsClosed`, `UniformSpace.Completion`,
`Cardinal`, `CategoryTheory.Sheaf.cohomologyPresheaf`, `Module.Flat`, `Module.FaithfullyFlat`,
`Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, `ValuationSubring` and
`PrimeSpectrum.comap_surjective_of_faithfullyFlat`.

## Layer D2: the pro-étale and v-topologies

The layer builds the Grothendieck topologies of the theory and proves the first descent statements
on them. It constructs the big pro-étale site on the category `Perfd` of perfectoid spaces and on
its `κ`-small subcategory `Geometry.Perfdκ p false κ`, the small pro-étale site `X_proet` of a
perfectoid space and the v-site, using the covering condition with its finite-quasicompact-image
clause and the pro-étale morphism calculus of PerfectoidSpaces layer P6. The affinoid perfectoid
spaces are the finite covering basis that drives smallness and cohomology: cohomology is shown to be
independent of the cutoff cardinal, the categories of small sheaves are defined and shown to be
algebraic, the pro-étale site is compared with the étale site, the structure sheaves `O` and `O⁺`
are shown to be small pro-étale and then v-sheaves with both topologies subcanonical, and `O` is
v-acyclic and `O⁺` almost v-acyclic on affinoid perfectoid spaces. The pro-étale comparison precedes
v-descent, and the automatic flatness over the disconnected bases of layer D1 supplies the v-Čech
arguments. The layer closes with the comparison of finite locally free modules across the analytic,
étale, pro-étale and v-sites.

### D2.1 The big pro-étale site of perfectoid spaces

The first four targets build the sites and establish smallness and algebraicity of their sheaf
categories.

**The big pro-étale site of perfectoid spaces.** (*big-pro-etale-site*) Let `Perfd` be the category
of perfectoid spaces and `Geometry.Perfdκ p false κ` the full subcategory of `κ`-small ones. The big pro-étale site is
the Grothendieck topology on `Perfd`, respectively `Geometry.Perfdκ p false κ`, in which a family `{f_i : Y_i → X}` is
a covering if all `f_i` are pro-étale and for every quasicompact open `U ⊂ X` there are a finite
subset `J` of the index set and quasicompact opens `V_i ⊂ Y_i` for `i ∈ J` with
`U = ⋃_{i∈J} f_i(V_i)`. The quasicompactness condition is the one that appears in the definition of
the fpqc topology for schemes; point-surjectivity of an unrestricted family is not the definition.
The covering condition has two parts and both are needed: pro-étaleness of each member, and the
finite-quasicompact-image condition. Joint point-surjectivity alone also survives composition
and base change, but gives a different coverage: it does not supply the finite refinements used
in the cohomology arguments. Pro-étale morphisms of perfectoid spaces, their stability under
composition and base change and the pro-category equivalence come from PerfectoidSpaces layer P6;
the site is built on that imported calculus. Define `Perfd.proEtalePrecoverage` as the precoverage
on `Perfd` whose members are the pro-étale families satisfying the finite quasicompact image
condition, and `Perfd.proEtaleTopology` as the Grothendieck topology it generates; prove
`Geometry.proEtalePrecoverage_isStableUnderBaseChange` (coverings are stable under base change),
`Perfd.proEtalePrecoverage.isStableUnderComposition` (coverings are stable under composition),
`Perfd.proEtaleTopology_le_of_analytic` (analytic and étale covers are pro-étale covers, so the
analytic and étale topologies are coarser), `Geometry.proEtaleCover_refineAffinoid` (every pro-étale
covering is refined by one all of whose members are affinoid perfectoid),
`Geometry.proEtaleTopology_small` (the topology restricts to `Geometry.Perfdκ p false κ` and the inclusion is a
continuous functor of sites) and `Perfd.mem_proEtaleCover_iff` (membership is the conjunction of
pro-étaleness and the quasicompact image condition) ([ECD] §8, Def. 8.1(i), p. 39; [ECD] §8, remark
after Def. 8.1, p. 39, which draws the comparison with the fpqc condition and is the reason
Mathlib's quasi-compact precoverage for schemes is the right model). *Needs:* Mathlib
`CategoryTheory.GrothendieckTopology`, `CategoryTheory.Pretopology`, `CategoryTheory.Precoverage`,
`AlgebraicGeometry.Scheme.qcPrecoverage`, `AlgebraicGeometry.Scheme.proetalePrecoverage`;
PerfectoidSpaces layer P2 (perfectoid spaces and glued tilting); PerfectoidSpaces layer P6
(pro-étale maps, pro-étale stability and limits, `κ`-small perfectoid spaces).

**Checks.**

- `s2_1_single_surjective_pro_etale` (characterisation) — a surjective pro-étale map of qcqs perfectoid
  spaces is a covering.
- `s2_1_analytic_cover` (degenerate case) — a jointly surjective family of open immersions is a covering.
- `s2_1_point_surjective_is_not_enough` (non-example) — a pro-étale family that is surjective on points
  but for which no finite subfamily covers a given quasicompact open by images of quasicompact opens
  is not a covering. For an infinite profinite set `S` and an algebraically closed perfectoid field
  `C`, the point inclusions into `S̲ × Spa(C, O_C)` are such a family: each member has one-point
  image, and a finite union of those images cannot cover `S`.
- `s2_1_matches_scheme_condition` (library agreement) — for a scheme pre-zero-hypercover `E`,
  `QuasiCompactCover E` is equivalent to every compact open being `IsCompactOpenCovered` by `E.f`.
  Both site constructions use this same topological predicate; the equivalence follows from
  Mathlib's affine-basis criterion.
- `s2_1_empty_space` (degenerate case) — for `X = ∅` the only quasicompact open is `∅`, so the empty
  family is a pro-étale covering of `∅` (take `J = ∅`); for `X ≠ ∅` the empty family is not a
  covering, since a nonempty quasicompact open `U` exists (`|X|` is locally spectral) and the empty
  union is not `U`. Here local spectrality is supplied by the perfectoid underlying-space functor
  `Geometry.space`, as stated by `Geometry.space_locallySpectral`. The general definitions
  `vPrecoverage` (in `Suggested.lean`) and `Perfd.proEtalePrecoverage` impose no local spectrality
  hypothesis on an arbitrary functor `sp : C ⥤ TopCat`.
- `s2_1_rational_compact_open_empty` — every compact open of `ℚ` is empty, by
  `Rat.interior_compact_eq_empty`.
- `s2_1_vPrecoverage_rational_empty_cover` (non-example) — on `C = Discrete PUnit` with
  `sp` constant at `TopCat.of ℚ`, the empty presieve satisfies the v-precoverage condition
  although the underlying space is nonempty.
- `s2_1_proEtalePrecoverage_rational_empty_cover` (non-example) — for the same constant functor,
  the empty presieve satisfies the pro-étale precoverage condition for every supplied morphism
  class `proet`, including the empty class. The condition on its members is vacuous.
- `s2_1_analytic_cover_needs_refinement` (computation) — on the perfectoid closed disc `X`, the rational
  subsets `V₁ = {|T| ≤ |ϖ|}` and `V₂ = {|T| ≥ |ϖ|}` cover `X` and themselves provide the finite
  quasicompact witnesses. The residue-class open discs `{|T−a| < 1}`, `a ∈ K°`, do not cover `X`:
  they omit its Gauss point. Refining these subsets cannot make them a cover.

- `s2_1_infinite_profinite_point_family` (computation) — the maps `* → S` indexed by the points of an
  infinite profinite `S` are jointly surjective, but their finite images cannot compact-open cover
  `S`. This is the underlying-space calculation for the preceding perfectoid example.
- `s2_1_finite_profinite_point_family` (computation) — for finite profinite `S`, the same point family
  compact-open covers `S`, including `S = ∅`.
- `s2_1_empty_pro_etale_precoverage` (degenerate case) — the empty presieve covers an empty object.
- `s2_1_identity_pro_etale_precoverage` (degenerate case) — the singleton identity presieve covers.
- `s2_1_empty_pro_etale_topology` (generated topology) — the empty sieve covers an empty object in the
  generated pro-étale topology.

Use `IsCompactOpenCovered` directly in the precoverage definitions, quantified over compact opens;
no second definition of the finite image condition is needed. `Perfd.mem_proEtaleCover_iff`
specifies membership for a given arrow family, so changing its indexing does not change whether
it covers. Its general topological signatures use a functor to `TopCat`; the specialization to
perfectoid spaces uses `Geometry.Spaces p c`, `Geometry.space p c` and
`Geometry.proet p c`. Their perfectoid open affinoid charts are the spectra
`Geometry.affine p R` of `R : Geometry.Affinoid p c`, with `R.toCAff` in AdicEtaleGeometry's `CAff`;
by `Geometry.hasAffinoidCharts_restrict` they form a basis of every object. The perfectoid-disc and
field-extension Checks use these geometric carriers alongside the profinite calculations above.
For prime `p`, either characteristic convention `c`, and every `X : Geometry.Spaces p c`,
`Geometry.space_locallySpectral` states that `(Geometry.space p c).obj X` is locally spectral.
Its open spectral charts are these affinoid charts: their spaces are valuation spectra, spectral
by `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` in
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean`. Thus the nonempty-space assertion
in `s2_1_empty_space` applies to the geometric sites; the rational Checks show why it does not
extend to every underlying-space functor.

**`proEtalePrecoverage`.** Covering requires both the compact-open image condition and membership in the chosen morphism class.

**Checks.**

- `definition_proEtalePrecoverage_1` — For the constant one-point space functor and all morphisms
  allowed, 0→1 is a cover.
- `definition_proEtalePrecoverage_2` — The empty family covers an empty underlying space even when
  no morphism is allowed.
- `definition_proEtalePrecoverage_3` — With no allowed morphisms, the identity family of a point is
  not a cover.

**`proEtaleTopology`.** The generated topology depends on which arrows are allowed, even for the same spaces.

**Checks.**

- `definition_proEtaleTopology_1` — Allowing every arrow on the two-object test site makes 0→1
  cover.
- `definition_proEtaleTopology_2` — With empty underlying spaces even the empty family covers,
  giving the maximal topology.
- `definition_proEtaleTopology_3` — With no allowed arrows and one-point spaces the generated
  topology is minimal, so 0→1 does not cover.

`Geometry.proEtalePrecoverage_isStableUnderBaseChange` and
`Geometry.proEtaleCover_refineAffinoid` state base change and affinoid refinement
on `Geometry.Spaces p c`, with prime `p` and either characteristic convention; the base change uses
the fibre products of `Geometry.hasAffinoidCharts_pullback`, and the refining members are charts
`Geometry.affine p R`.
`Geometry.proEtaleTopology_small` identifies the covering topology on
`Geometry.Perfdκ p c κ` with the restricted topology and proves continuity of its
inclusion, for `IsCutoffCardinal κ` ([ECD] Definition 8.1, p. 39, and Proposition 8.2,
pp. 39–40). These statements use `Geometry.Spaces p c`.

**`Geometry.toPerfectoid` — Checks.**

- `toPerfectoid_affine` — An affinoid is sent to `PerfectoidSpace.ofPair p` of its lift.
- `toPerfectoid_identity` — The identity map remains the identity.
- `toPerfectoid_distinct` — Distinct geometric maps remain distinct after forgetting the lift.

**`Geometry.Perfdκ` — Checks.**

- `Perfdκ_affine` — An affinoid whose ring has cardinality below a cutoff belongs to the subcategory.
- `Perfdκ_empty` — An empty space belongs whenever `1 < κ`.
- `Perfdκ_large_affine` — An affinoid whose ring has cardinality at least the cutoff is excluded.

Lean: none for the pro-étale site; the covering-family Checks are specified in prose.

### D2.2 The small pro-étale site and the v-site

**The small pro-étale site of a perfectoid space, and the v-site.**
(*small-pro-etale-site-and-v-site*) For a perfectoid space `X`, the pro-étale site `X_proet` is the
Grothendieck topology on the category of perfectoid spaces pro-étale over `X`, with the same
coverings as in the big site; there is a `κ`-small variant. The v-site is the Grothendieck topology
on `Perfd`, respectively `Geometry.Perfdκ p false κ`, in which a family `{f_i : Y_i → X}` is a
covering if for every quasicompact open `U ⊂ X` there are a finite subset `J` and quasicompact opens
`V_i ⊂ Y_i` for `i ∈ J` with `U = ⋃_{i∈J} f_i(V_i)`; no condition at all is placed on the maps
themselves. The v-covering condition is the pro-étale one with the pro-étaleness dropped, and this
is the only difference. The v-site over `X` uses the entire slice, rather than a class of pro-étale
arrows. On the fixed carriers the slice is a small category in universe 2; for nonempty `X`, it is
not essentially small in universe 0, as disjoint unions over `X` have unbounded cardinality there.
The empty base is exceptional, since only the empty space maps to it. This is the universe-relative
interpretation of [ECD]'s size warning; the cutoff slices of D2.3 impose actual cardinal bounds.
Define `vPrecoverage` as the precoverage given by the finite quasicompact image condition alone, for
any category with an underlying-space functor `F : C ⥤ TopCat`, `Perfd.vTopology F` as the topology
it generates, `vTopology` as the v-topology on PerfectoidSpaces' `Perfd p` (the topology generated
by `vPrecoverage` for the underlying-space functor `perfdToTop`) and `Perfectoid.proEtaleSite` as
the small pro-étale site of a perfectoid space `X`; prove `Perfd.proEtaleTopology_le_vTopology`
(every pro-étale cover is a v-cover), `singleton_mem_vPrecoverage_iff_surjective` (a map `f : Y → X`
from a quasicompact to a quasiseparated perfectoid space is a v-cover exactly when it is surjective
on points: for a v-cover, each `x ∈ X` has a quasicompact open neighbourhood `U` by local
spectrality, and the covering condition on `U` gives a preimage of `x`. Thus `f` is surjective,
and `X` is quasicompact as the continuous image of `Y`. Conversely,
the locally spectral nature of adic morphisms, together with quasicompactness of `Y` and
quasiseparatedness of `X`, makes `f` quasicompact, so for a quasicompact open `U ⊂ X` the
quasicompact open `f⁻¹(U)` has image `U`),
`Geometry.vPrecoverage_isStableUnderBaseChange` and `Perfd.isStableUnderComposition_vPrecoverage`
(v-coverings are stable under base change and composition),
`Perfectoid.proEtaleSite.hasFiniteLimits` (the small pro-étale site has finite limits: identities
give its terminal object, base change and composition give products, and diagonal stability gives
equalizers) and `Geometry.vTopology_small` (the v-topology restricts to `Geometry.Perfdκ p false κ`
compatibly with the inclusion) ([ECD] §8, Def. 8.1(ii) and (iii), p. 39; [ECD] §8, remark after Def.
8.1, p. 39). The surjectivity criterion for maps of affinoid perfectoid spaces is the one used in
[ECD] Lem. 11.11, Lem. 12.5 and Lem. 12.11; the quasiseparatedness of the target is where the "iff"
uses the qcqs hypothesis. `Perfectoid.proEtaleSite` is the category of objects pro-étale over `X`.
Define `Perfectoid.proEtaleSite.topology` by restricting the big pro-étale topology along its
inclusion. *Needs:* Mathlib `CategoryTheory.GrothendieckTopology`, `CategoryTheory.Pretopology`,
`CategoryTheory.Over`, `AlgebraicGeometry.Scheme.qcPrecoverage`; D2.1; PerfectoidSpaces layer P6
(pro-étale maps, pro-étale stability and limits, `κ`-small perfectoid spaces).

**Checks.**

- `s2_2_surjection_is_v_cover` (characterisation) — a surjective map of affinoid perfectoid spaces is a
  v-cover.
- `s2_2_pro_etale_is_v` (non-example) — every pro-étale cover is a v-cover. For a proper extension of
  complete algebraically closed perfectoid fields `C ⊊ C′`, the map `Spa(C′,O_C′) → Spa(C,O_C)` is a
  v-cover and is not pro-étale, by the geometric-fibre classification. An infinite disjoint union of
  residue-field points need not be a v-cover: its quasicompact opens have finite image.
- `s2_2_no_small_v_site` (size obstruction) — for nonempty `X`, the unrestricted slice contains
  disjoint unions with cardinalities unbounded in universe 0, so the suggested Lean Check states
  `¬ EssentiallySmall.{0} (Over X)`. It does not exclude smallness in universe 2. For `X = ∅` the
  slice is equivalent to the terminal category; its empty covering makes its sheaf category
  degenerate. A cutoff bounds the objects in either case.
- `s2_2_empty_cover` (characterisation) — the empty family covers the empty perfectoid space and nothing
  else: for `X = ∅` every quasicompact open is `∅`, the empty union; for `X ≠ ∅` a nonempty
  quasicompact open `U` exists and the empty union is not `U`. In particular the empty family is a
  v-cover of `∅` for the same reason that it is a pro-étale cover of `∅`. For any map `Y → ∅`,
  necessarily `Y = ∅`; its singleton family is also a v-cover, and pointwise surjectivity in the
  singleton criterion is vacuous.
- `s2_2_identity_cover` (degenerate case) — `{id : X → X}` is a v-cover and a pro-étale cover of every
  `X` (`J = {∗}`, `V = U`), and the topology generated solely by identity coverings is the trivial
  one; every presheaf satisfies the sheaf condition for it.
- `s2_2_one_point_affinoid` (computation) — for `X = Spa(C, O_C)` with `C` algebraically closed, `|X|` is
  one point, so a family is a v-cover exactly when some member is nonempty, and
  `Spa(C', O_{C'}) → X` for any complete algebraically closed `C' ⊇ C` is a v-cover that is a
  pro-étale cover only when `C' = C`.

- `s2_2_empty_v_topology` (generated topology) — the empty sieve covers the empty object in the
  generated v-topology.
- `s2_2_identity_topology` — When every object has empty underlying space, the v-topology admits empty covers; the constant Boolean presheaf fails its sheaf condition.
- `s2_2_small_site_identity` (degenerate case) — `id_X` is an object of `X_proet`.
- `s2_2_small_site_excludes_non_pro_etale` (non-example) — an arrow that is not pro-étale cannot be
  an object of `X_proet`.
- `s2_2_small_site_over_base` (computed triangle) — a morphism from `U → X` to `V → X` is a map
  `f : U → V` satisfying `f ≫ (V → X) = (U → X)`; a map with a different composite is excluded.

`Perfectoid.proEtaleSite.inclusion` is the full-subcategory inclusion followed by `Over.forget X`;
`Perfectoid.proEtaleSite.topology` is Mathlib's restricted topology along this functor.
`singleton_mem_vPrecoverage_iff_surjective` states the singleton criterion on perfectoid spaces,
with a quasicompact source and a quasiseparated target; its reverse implication applies Mathlib's
`IsCompactOpenCovered.of_finite_of_isSpectralMap` to the singleton family. `Perfd.analyticCover`
assumes `[∀ i, PrespectralSpace (sp.obj (U i))]`, open underlying maps, joint surjectivity and
membership of every arrow in `proet`. Continuity comes from `sp.map` in `TopCat`;
`IsCompactOpenCovered.of_isOpenMap` then supplies the compact-open image condition. Both suppliers
are located in the table above. The `s2_1_analytic_cover` Check specializes this to open embeddings
with prespectral sources. Neither criterion treats an arbitrary continuous map as spectral.

**`vPrecoverage`.** The finite compact-open image condition is stronger than pointwise covering.

**Checks.**

- `definition_vPrecoverage_1` — For the constant one-point space functor on the two-element chain,
  the singleton arrow 0→1 is a cover.
- `definition_vPrecoverage_2` — The empty presieve covers an object with empty underlying space.
- `definition_vPrecoverage_3` — The empty presieve does not cover a point.

**`Perfd.vTopology`.** The generated topology `(vPrecoverage F).toGrothendieck` retains the proper
covering arrow in the two-object test site; on PerfectoidSpaces' `Perfd p` with `F = perfdToTop` it
is the Lean `vTopology`.

**Checks.**

- `definition_vTopology_1` — The arrow 0→1 generates a covering sieve for the constant one-point
  space functor.
- `definition_vTopology_2` — When every underlying space is empty every sieve covers.
- `definition_vTopology_3` — For the constant one-point space functor the empty sieve at 1 is not
  covering.

**`proEtaleSite`.** Objects are actual arrows to the base satisfying the selected property.

**Checks.**

- `definition_proEtaleSite_1` — Allowing all arrows over 1 in the two-element chain gives two
  objects.
- `definition_proEtaleSite_2` — Allowing no arrows gives an empty site, even over a nonempty base.
- `definition_proEtaleSite_3` — Over 0 there is no object with source 1, even when every morphism is
  allowed.

**`proEtaleSite.inclusion`.** The inclusion sends an arrow over the base to its source.

**Checks.**

- `definition_proEtaleSite_inclusion_1` — In the slice of the three-element chain over `2`, the objects `0 → 2` and `1 → 2` have included values `0` and `1`.
- `definition_proEtaleSite_inclusion_2` — The arrow between those two slice objects maps to `0 → 1`, which is not an isomorphism.
- `definition_proEtaleSite_inclusion_3` — Those two included objects remain distinct, and the value at `1 → 2` differs from the base `2`.

**`Perfectoid.proEtaleSite.topology`.** The small topology is induced from compact-open coverage on the big site. The two-object chain with constant point realization separates this topology from the trivial topology.

**Checks.**

- `Perfectoid_proEtaleSite_topology_chain_cover` — Over the terminal element of the two-object chain, the proper arrow from 0 is a cover.
- `Perfectoid_proEtaleSite_topology_empty_cover` — With empty underlying spaces the empty sieve covers every object of this small site.
- `Perfectoid_proEtaleSite_topology_point_empty_not_cover` — With constant one-point underlying spaces the empty sieve does not cover the identity object.

`Geometry.vPrecoverage_isStableUnderBaseChange` proves base change on
`Geometry.Spaces p c`. For a cutoff cardinal, `Geometry.vTopology_small` identifies
the restricted topology with the one generated by the same geometric covering
condition on `Geometry.Perfdκ`, and proves continuity of the inclusion ([ECD]
Definition 8.1, p. 39; Proposition 8.2, pp. 39–40).

**Checks.**

- `Perfd.vPrecoverage_not_le_proEtalePrecoverage` — A singleton family satisfying the compact-open image condition whose arrow is outside the selected pro-étale class is a v-cover but not a pro-étale cover.

Lean: `vPrecoverage`, `perfdToTop`, `vTopology` and `singleton_mem_vPrecoverage_iff_surjective`.
The Checks and remaining constructions are specified in the README only.

### D2.3 Cutoff independence and small sheaves

**Cohomology does not depend on the cutoff cardinal, and small sheaves.** (*cutoff-independence*)
Let `κ ≤ κ'` be cutoff cardinals in the sense of [ECD] 4.1 (uncountable strong limit cardinals of
uncountable cofinality with the cofinality clause (iii) of [ECD] Lem. 4.1) and `X` a `κ`-small
perfectoid space. The category `Geometry.Perfdκ p false κ` allows arbitrary characteristic; use
`true` for characteristic `p`. `X_proet,κ` is the full subcategory of
`Perfectoid.proEtaleSite (Geometry.proet p c) X` whose source belongs to `Geometry.Perfdκ p c κ`,
with the restricted topology, as in `Geometry.cutoff_smallProEtale`. Thus `X` is also `κ'`-small and
the inclusion `c : X_proet,κ → X_proet,κ'` is a continuous functor of sites. The pullback functor
`c^*` from sheaves on `X_proet,κ` to sheaves on `X_proet,κ'` is fully faithful and preserves
cohomology: for every sheaf `F` of sets the unit `F → c_* c^* F` is an isomorphism; for every sheaf
of groups `F` the unit is an isomorphism and in addition `R¹c_* c^* F = 0` (the nonabelian `R¹`, a
sheaf of pointed sets); for every abelian sheaf `F` the unit is an isomorphism and
`R^i c_* c^* F = 0` for all `i ≥ 1`. There is no "degree zero" vanishing:
`R⁰c_* c^* F = c_* c^* F ≅ F`, and the degree-zero content is the unit isomorphism itself. The same
holds for pro-étale or v-cohomology on `Geometry.Perfdκ p false κ` and on its slices. The statement
is for `κ ≤ κ'` with a `κ`-small base: a smaller cutoff `λ` need not contain `X`. The category of
`λ`-small arrows over `X` still exists, but need not contain `id_X`, and the stated comparison
theorem does not apply to it. Consequently the category of small sheaves is defined as the filtered
colimit over all `κ` of the sheaf categories on the `κ`-small sites, and a sheaf commuting with
`ω₁`-filtered colimits of affinoid perfectoid pairs — for every `ω₁`-filtered diagram of affinoid
perfectoid pairs `(R_i, R_i⁺)` with completed colimit `(R, R⁺)` the map
`colim_i F(Spa(R_i, R_i⁺)) → F(Spa(R, R⁺))` is a bijection — comes by pullback from the `κ`-small
site for every uncountable cutoff `κ`, hence is small; this is the criterion used in practice, and
`O` and `O⁺` satisfy it by the limit description of affinoid perfectoid spaces. Smallness matters
because the cutoff construction records which ambient sheaves arise from a bounded site. The ambient
site is small in universe 2 and its `Type 2`-valued sheaves are generated under universe-2 colimits
by representables; that fact alone does not assert recovery from a cardinal cutoff. The
filtered-colimit description uses fully faithful pullbacks between cutoff categories, with fixed
coefficient universe. The proof compares size-bounded affinoid bases by approximating larger covers
by smaller ones; the split strictly totally disconnected refinements give the unit and
higher-direct-image assertions; for the change-of-cutoff pullback, `κ ≤ κ'` and the `κ`-smallness of
`X` identify the larger-cutoff cohomology with the smaller-cutoff cohomology ([ECD] §8, Prop. 8.2
with proof, pp. 39–40; [ECD] §8, after Prop. 8.2, p. 40, for the practical smallness criterion).
*Needs:* Mathlib `CategoryTheory.Sheaf`, `CategoryTheory.presheafToSheaf`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.IsFiltered`; D0.23; D0.18;
SchemeAndStackFoundations §2.2 (`cech_to_cohomology`, cited in D0.19); D2.1; D2.2; PerfectoidSpaces
layer P5 (cofiltered limits of affinoid perfectoid spaces); PerfectoidSpaces layer P6 (pro-étale
maps, pro-étale stability and limits, `κ`-small perfectoid spaces).

**Checks.**

- `s2_3_cutoff_equal` (degenerate case) — for `κ = κ'` the functor `c` is the identity, the unit is the
  identity and all `R^i c_* c^* F`, `i ≥ 1`, are `0`.
- `s2_3_degree_clause` (non-example) — for a nonzero abelian sheaf `F`, `R⁰ c_* c^* F ≅ F ≠ 0`; vanishing
  is asserted only in positive degrees. For a sheaf of sets the assertion is that the unit is an
  isomorphism.
- `s2_3_smaller_cutoff` (non-example) — for `λ < κ` and `X` `κ`-small but not `λ`-small (for instance
  `|X|` of cardinality at least `λ`), the object `X` is absent from `Geometry.Perfdκ p false λ`.
  The bounded-source category over `X` exists, but lacks `id_X`; the hypotheses
  of the small-site comparison theorem are not satisfied.
- `s2_3_representable_is_small` (characterisation) — for a `κ`-small perfectoid space `X`, the
  representable sheaf is `κ`-small in the cutoff sense of [ECD] Proposition 8.2. An arbitrary
  affinoid perfectoid ring is not finitely presented; no finite-presentation argument or `ω₁` bound
  is asserted for its mapping functor.

`Geometry.cutoffInclusion` is the full inclusion on the supplied cardinal bounds.
For cutoffs `κ ≤ κ'`, `Geometry.cutoffInclusion_continuous` proves continuity for
both topologies. `Geometry.cutoff_unit`, `Geometry.cutoff_group_unit`, and
`Geometry.cutoff_abelian` give the set, group, and abelian adjunction units; the
abelian statement also gives positive higher-direct-image vanishing.
`Geometry.cutoff_torsor_local_section` expresses the nonabelian degree-one assertion:
a torsor under a pulled-back group has local sections already on the smaller site.
`Geometry.cutoff_slice_unit`, `Geometry.cutoff_slice_abelian`, and
`Geometry.cutoff_slice_group` give the corresponding assertions on slices.
The slice and small-site statements take continuity of the indicated inclusion
as an explicit hypothesis for their sheaf adjunctions.
`Geometry.cutoff_smallProEtale` and `Geometry.cutoff_smallProEtale_group` give them
on the small pro-étale site of a `κ`-small base. `Geometry.structure_cutoff_small` states that
both function sheaves are recovered from every cutoff by the adjunction counit
([ECD] Proposition 8.2, pp. 39–40; Proposition 8.5, pp. 41–42; Theorem 8.7, p. 43).

`Geometry.cutoff_ambient_continuous` supplies the inclusion into the ambient site
for either topology and either characteristic convention. `Geometry.CutoffSheaves`
is the full subcategory defined by invertibility of the counit for some cutoff;
`Geometry.cutoffSheaves_essentialImage` identifies it with the union of the
essential images of cutoff pullbacks. Together with `Geometry.cutoff_unit`, this
is the fully faithful filtered-union description of small sheaves in fixed universes
([ECD] discussion following Proposition 8.2, p. 40).

`Geometry.cutoff_of_omegaOne_colimits` states the practical criterion on the same
carriers: assume `F` carries every universe-1 `ω₁`-filtered colimit in
`(Geometry.Spaces p c)ᵒᵖ` with affinoid stages and affinoid colimit to a colimit
of sets. These are the inverse limits of affinoid spaces associated with the
completed colimits of pairs above. Then the cutoff pullback–restriction counit
is invertible for every cutoff cardinal, for either topology.
`Geometry.representable_cutoff_small` gives this counit statement for the v-sheaf
represented by `X : Geometry.Perfdκ p true κ`, without assuming that its mapping
functor preserves `ω₁`-filtered colimits ([ECD] Proposition 8.2 and the following
discussion, pp. 39–40).

**`Geometry.CutoffSheaves` — Checks.**

- `CutoffSheaves_initial` — The initial sheaf lies in the cutoff subcategory.
- `CutoffSheaves_representable` — Every characteristic-`p` perfectoid space represents
  an object of the cutoff subcategory for the v-topology.
- `CutoffSheaves_countable_coproduct` — A countable family of cutoff sheaves, whose
  bounds may vary, has its ambient coproduct in the cutoff subcategory.

**`Geometry.cutoffInclusion` — Checks.**

- `cutoffInclusion_object` — Enlarging the cutoff retains the geometric object.
- `cutoffInclusion_equal` — Equal cutoffs give the identity functor.
- `cutoffInclusion_distinct` — The inclusion does not identify distinct arrows.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D2.4 Algebraicity of the small-sheaf topoi

**The categories of small sheaves on `Perfd` and on a pro-étale site are algebraic.**
(*perfectoid-sheaf-topoi-are-algebraic*) The categories of small sheaves on `Perfd` for either the
big pro-étale or the v-topology, and the category of small sheaves on `X_proet` for a perfectoid
space `X`, are algebraic in the sense of SGA 4 VI: in all cases a basis of qcqs objects stable under
fibre products is given by the affinoid perfectoid spaces. Algebraicity ([ECD] p. 40, after Prop.
8.2) asks for three things, each of which is a statement to be proved here since [ECD] proves none
of them: (a) the affinoid perfectoid spaces generate the category of small sheaves under colimits
and are stable under fibre products — the fibre product `Spa(S, S⁺) ×_{Spa(R, R⁺)} Spa(T, T⁺)` is
`Spa` of the completed tensor product, affinoid perfectoid by PerfectoidSpaces layer P2; (b) each
affinoid perfectoid `X` is quasicompact and quasiseparated as an object: a jointly surjective family
of sheaves over `X` is refined by a v-cover, which has a finite subfamily covering `X` by the finite
quasicompact image condition, and for quasicompact `Y, Z → X` the fibre product `Y ×_X Z` is
quasicompact; (c) the map `X → ∗` is quasiseparated, that is the diagonal `X → X × X` is
quasicompact — for an affinoid perfectoid `Y` with two maps `a, b : Y → X` the pullback of the
diagonal is the equalizer of `a` and `b`, which for `X = Spa(R, R⁺)` is the locus
`{y : a^*(r) = b^*(r) for all r ∈ R}`, a Zariski closed subset of `Y` cut out by the ideal generated
by the `a^*(r) − b^*(r)`, and the perfectoid space carried by a Zariski closed subset of an affinoid
perfectoid space is affinoid perfectoid ([ECD] §5, Def. 5.7 and Thm 5.8; PerfectoidSpaces layer P4,
*universal-perfectoid-zariski-closed* and *diagonal-of-perfectoid-map*), hence quasicompact. The
product `X × X` in (c) is the absolute product in `Perfd` (no base), which is why (c) is not a
formal consequence of (b). Moreover a perfectoid space `X` is quasicompact, respectively
quasiseparated, in any of these settings if and only if `|X|` is quasicompact, respectively
quasiseparated; for `X` affinoid perfectoid, `X` is quasicompact and quasiseparated as a v-sheaf,
which is what makes the Čech arguments finite. For a map of stacks on such a site,
quasiseparatedness means that the diagonal is quasicompact and quasiseparated, which for stacks is
not automatic since the diagonal need not be injective; this convention enters every
quasiseparatedness statement about stacks in layers D3 to D6. The final object of the *big* v-topoi
of `Perfd` and `Perf` is not quasiseparated (the standing counterexample: take
`Y = Z = Spa(𝔽_p((t^{1/p^∞}))^, 𝔽_p[[t^{1/p^∞}]]^)`. Both are quasicompact, but their absolute
product is the perfectoid punctured open unit disc over `Y` ([ECD] proof of Proposition 11.4). The
annuli `|ϖ|^n ≤ |t| ≤ |ϖ|^{1/n}`, `n ≥ 1`, cover that disc with no finite subcover); for the small
site `X_proet` of a qcqs perfectoid `X` the terminal object is represented by `id_X` and is qcqs
(`X = Spa(C, O_C)` is the control), so the warning is about the big topoi only. Object-level and
map-level quasicompactness are kept apart as in the object and morphism distinction of
AdicSpacesPartII R0.19.10: `X` quasiseparated implies `X → ∗` quasiseparated, and when the terminal
object is quasicompact, `X → ∗` quasicompact implies `X` quasicompact; the object and morphism
predicates are not interchangeable. [ECD] leaves the proof to the reader; the content is the
verification (a)–(c) of the axioms of an algebraic topos for the affinoid basis ([ECD] §8, Prop.
8.3, p. 41; [ECD] §8, Convention 8.4, p. 41). *Needs:* Mathlib `CategoryTheory.Sheaf`,
`CategoryTheory.Precoherent`; AdicSpacesPartII R0.19.10; D2.1; D2.2; D2.3; PerfectoidSpaces layer P2
(fibre products of perfectoid spaces); PerfectoidSpaces layer P4 (Zariski closed subsets of affinoid
perfectoid spaces are affinoid perfectoid).

**Checks.**

- `s0_17_final_object_not_quasiseparated` (non-example) — The terminal sheaf on `Perfd` is not
  quasiseparated: the two quasicompact perfectoid points of the punctured-disc computation have
  non-quasicompact absolute product. Object quasiseparatedness differs from quasiseparatedness
  of the identity map, as in AdicSpacesPartII R0.19.10.


- `s2_4_affinoid_is_qcqs` (characterisation) — an affinoid perfectoid space is quasicompact and
  quasiseparated as a v-sheaf, and `|X|` is a spectral space.
- `s2_4_small_site_terminal_qcqs` (control) — for `X = Spa(C, O_C)`, the terminal object of the
  small pro-étale topos `X_proet` is `id_X`, quasicompact and quasiseparated; the big-site warning
  below does not apply to small sites of qcqs perfectoid spaces.
- `s2_4_final_object_not_quasiseparated` (non-example) — the terminal sheaf on the big site `Perfd` is
  not quasiseparated: the two quasicompact perfectoid points of the punctured-disc computation in D2.4
  have non-quasicompact absolute product. This distinguishes object quasiseparatedness from
  quasiseparatedness of the identity map of the terminal object.
- `s2_4_empty_space` (degenerate case) — `∅` is qcqs, and the empty family covers it, as does any family
  consisting of empty affinoids; `|∅|` is quasicompact and quasiseparated.
- `s2_4_non_quasicompact_space` (non-example) — the open unit disc `{|T| < 1}` in the perfectoid closed
  disc is a perfectoid space with `|X|` not quasicompact, so `X` is not quasicompact as a v-sheaf.

`Geometry.vTopology_isAlgebraic` is the algebraicity assertion on `Geometry.vTopology p`.
`Geometry.proEtaleTopology_isAlgebraic` and `Geometry.proEtaleSite_isAlgebraic` give
the big and small pro-étale assertions in either characteristic convention.
`Geometry.affine_isQcqs` states both predicates for the represented affinoid in
`Geometry.VSheaf p`; `Geometry.yoneda_isQuasicompact_iff` and
`Geometry.yoneda_isQuasiseparated_iff` identify them with the underlying topological
predicates for every `Geometry.Perf p` ([ECD] Proposition 8.3, p. 41).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D2.5 Pro-étale and étale comparison and the structure sheaves

The remaining targets prove descent of the structure sheaves and of vector bundles: the comparison
with the étale site, subcanonicity of both topologies, v-descent of functions and v-acyclicity.

**Comparison of the pro-étale and étale sites, and the structure sheaves on the pro-étale site.**
(*pro-etale-etale-comparison-and-structure-sheaves*) Let `X` be a perfectoid space and
`ν : X_proet → X_et` the natural map of sites. For every sheaf `F` on `X_et` the adjunction map
`F → ν_* ν^* F` is an isomorphism, and for `F` abelian `R^i ν_* ν^* F = 0` for `i ≥ 1`. For an
affinoid pro-étale `Y = lim_i Y_i` over an affinoid open `X₀ ⊂ X` the natural map
`colim_i F(Y_i) → (ν^* F)(Y)` is an isomorphism. The presheaves `O` and `O⁺` on `X_proet` are small
sheaves, and for `X` affinoid perfectoid `H^i(X_proet, O) = 0` for `i > 0` and `H^i(X_proet, O⁺)` is
almost zero for `i > 0`, that is killed by `R°°` for `X = Spa(R, R⁺)`. The affinoid case is the
substance and the general case is local. The vanishing for `O⁺` is asserted only up to almost zero:
it is inherited from the almost acyclicity of `O⁺` on affinoid perfectoid spaces for the étale site,
supplied by PerfectoidSpaces layers P2 and P3, which this target transports to the pro-étale site,
and the proof gives nothing more, because its integral input — the comparison of `O⁺(Y)/ϖ ⊗ O⁺(Y)/ϖ`
with `O⁺(Y ×_X Y)/ϖ` — is only an almost isomorphism (PerfectoidSpaces layer P3: for the degree-`ℓ`
cyclic cover `Spa(L) → Spa(K)` there, `L° ⊗_{K°} L° ⊊ (L°)^ℓ`). The exact statement with "almost"
dropped is not claimed; it is also not refuted by that example, since for the cyclic tame cover the
Čech cohomology of `O⁺` is `H^i(ℤ/ℓ, L°)`, and `H¹(ℤ/ℓ, L°) = 0` exactly (see the Checks of D2.8),
so a failure of exact vanishing would have to come from a wildly ramified cover ([ECD] §8, Prop. 8.5
with proof, pp. 41–42; [ECD] §8, proof of Prop. 8.5, p. 42, for the smallness argument). *Needs:*
Mathlib `CategoryTheory.Functor.sheafPushforwardContinuous`,
`CategoryTheory.Sheaf.cohomologyPresheaf`; D2.2; D2.3; SchemeAndStackFoundations §2.2
(`cech_to_cohomology`, `leray_spectral_sequence`, cited in D0.19); PerfectoidSpaces layer P3
(étale-site tilting and étale almost acyclicity); PerfectoidSpaces layer P2 (the sheaf theorem and
almost acyclicity); PerfectoidSpaces layer P5 (finite-stage descent of qcqs étale objects);
PerfectoidSpaces layer P0 (almost modules over a perfectoid base); PerfectoidSpaces layer P6
(pro-étale maps, pro-étale stability and limits, `κ`-small perfectoid spaces).

**Checks.**

- `s2_5_geometric_point` (degenerate case) — for `X = Spa(C, O_C)`, `C` algebraically closed, `X_et`
  is the site of disjoint unions of copies of the point, so `ν_* ν^* F = F` for every `F` and
  `H^i(X_proet, O) = H^i(X_proet, O⁺) = 0` for `i > 0` exactly, not only almost: the objects of
  `X_proet` are locally `X × S` for profinite sets `S` (D1.10), written `S̲ × X` as in D3.10,
  `O⁺(S̲ × X) = C(S, O_C)`, and for a surjection `S' → S` of profinite sets the Čech complex of
  `C(−, O_C)` is the limit over `n` of the Čech complexes of `C(−, O_C/ϖⁿ)`, each a filtered colimit
  of Čech complexes of surjections of finite sets, which split; the transition maps are surjective,
  so the limit is exact as well.
- `s2_5_pro_etale_stage` (computation) — for `Y = lim_n Spa(K_n, K_n⁺)` over `X₀ = Spa(K, K⁺)`, `K_n`
  finite étale over `K`, and `F` the constant sheaf `ℤ`, `(ν^* F)(Y) = colim_n ℤ^{π₀(Spa K_n)}`, the
  locally constant functions on the profinite set `lim_n π₀(Spa K_n)`.
- `s2_5_almost_only` (non-example) — the exact vanishing of `H^i(X_proet, O⁺)` is not claimed; the proof
  passes through `(O⁺/ϖ)^a` and inverts almost isomorphisms that are not isomorphisms
  (PerfectoidSpaces layer P3, `L° ⊗_{K°} L° ⊊ (L°)^ℓ`).

`Geometry.nuInclusion` includes the étale objects over a fixed `Geometry.Spaces p c`
object into its pro-étale objects. `Geometry.nuInclusion_continuous`, `Geometry.nu_unit`,
and `Geometry.nu_abelian` state continuity, the set-valued unit isomorphism, and the
abelian unit and positive higher-direct-image assertions.
`Geometry.nu_sections` specifies the actual colimit comparison induced by that unit
on an affinoid pro-étale limit of affinoid étale objects ([ECD] Proposition 8.5(i–ii),
pp. 41–42). `Geometry.smallProEtale_structure_isSheaf` supplies both structure sheaves;
`Geometry.smallProEtale_structure_cohomology` identifies their small-site cohomology
with the big-site cohomology. `Geometry.O_proEtale_H0`, `Geometry.Oplus_proEtale_H0`,
`Geometry.O_proEtale_acyclic`, and `Geometry.Oplus_proEtale_almost_acyclic` give the
exact degree-zero identifications, positive rational vanishing, and positive integral
almost vanishing for affinoids ([ECD] Proposition 8.5(iii), pp. 41–42; Corollary 8.6, p. 42).
The cohomology signatures use `HasExt` at the indicated coefficient universe.

**`Geometry.nuInclusion` — Checks.**

- `nuInclusion_object` — The map to the base is retained.
- `nuInclusion_identity` — The identity arrow is retained.
- `nuInclusion_distinct` — Two different maps of étale objects remain different.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D2.6 The structure sheaves on the big pro-étale site

**The structure sheaves on the big pro-étale site.** (*subcanonicity-of-the-pro-etale-topology*) On
the big pro-étale site, both assignments `X ↦ O_X(X)` and `X ↦ O⁺_X(X)` are small sheaves; the
reduction to the small site uses that a cover in the big site is also a cover in the small pro-étale
site of its target ([ECD] §8, Cor. 8.6 with proof, p. 42). That representable presheaves
`Y ↦ Hom(Y, X)` are small pro-étale sheaves — subcanonicity of the big pro-étale topology — is the
pro-étale case of the v-subcanonicity of D2.7, every pro-étale cover being a v-cover
(`proEtaleTopology_le_vTopology`), and is stated and proved there, not here. Subcanonicity is what
makes a perfectoid space and the sheaf it represents interchangeable, as [ECD] does from §10 onwards
without further comment. *Needs:* D2.5; D2.1.

**Checks.**

- `s2_6_empty_cover` (degenerate case) — for `Y = ∅` with its empty cover, `O(∅) = O⁺(∅) = 0` and the
  sheaf condition is the equalizer of the empty product, also `0`.
- `s2_6_big_cover_is_small_cover` (characterisation) — a pro-étale cover `{Y_i → Y}` of the big site
  is a cover in `Y_proet`, so the sheaf condition for `O` on the big site is the sheaf condition of
  D2.5 on each small site; a cover of the big site whose members are not pro-étale over `Y` does not
  occur, which is what makes the reduction exhaustive.
- `s2_6_pro_etale_only` (non-example of the method) — the sheaf property proved here uses only
  pro-étale covers; the v-sheaf property of `O` and `O⁺` and subcanonicity are D2.7 and need the
  flatness input of D1.6, which this target does not use.

`Geometry.ORing` and `Geometry.OplusRing` are the supplied global section and plus
rings, with pullback along geometric maps; their underlying set presheaves are
`Geometry.O` and `Geometry.Oplus : (Geometry.Spaces p c)ᵒᵖ ⥤ Type 2`. The pullback of plus
rings is `Geometry.globalPullback_plus` (README only): for a morphism `f : Y ⟶ X` of
`PerfectoidSpace.Perfd p` and `s ∈ globalPlus X`, `globalPullback f s ∈ globalPlus Y`: at `y ∈ Y`,
`|(globalPullback f s)(y)| = |s(f(y))| ≤ 1`, because the stalk map of a morphism of pre-adic spaces
pulls the valuation at `y` back to the valuation at `f(y)`, up to equivalence.
`Geometry.O_isSheaf_proEtale` and `Geometry.Oplus_isSheaf_proEtale` assert the big
pro-étale sheaf conditions ([ECD] Corollary 8.6, p. 42).

**`Geometry.ORing` — Checks.**

- `ORing_affine` — On `Spa(R, R⁺)`, the section ring is identified with `R`.
- `ORing_empty` — The value on an empty perfectoid space is a singleton.
- `ORing_nonzero` — An affinoid with nonzero ring has a nontrivial value.

**`Geometry.OplusRing` — Checks.**

- `OplusRing_affine` — On `Spa(R, R⁺)`, the plus ring is identified with `R⁺`.
- `OplusRing_empty` — The value on an empty perfectoid space is a singleton.
- `OplusRing_nonzero` — An affinoid with nonzero ring has a nontrivial value.

**`Geometry.O` — Checks.**

- `O_affine` — On `Spa(R, R⁺)`, the set of functions is identified with `R`.
- `O_empty` — The value on an empty perfectoid space is a singleton.
- `O_nonzero` — An affinoid with nonzero ring has a nontrivial value.

**`Geometry.Oplus` — Checks.**

- `Oplus_affine` — On `Spa(R, R⁺)`, the set of integral functions is identified with `R⁺`.
- `Oplus_empty` — The value on an empty perfectoid space is a singleton.
- `Oplus_nonzero` — An affinoid with nonzero ring has a nontrivial value.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D2.7 v-descent of functions

**`O` and `O⁺` are v-sheaves and the v-site is subcanonical.** (*v-descent-of-functions*) The
presheaves `O` and `O⁺` on the v-site are small sheaves, and the v-site is subcanonical: for every
perfectoid space `X` the functor `Y ↦ Hom(Y, X)` is a small v-sheaf. In degree zero this is Theorem
1.2 of the introduction of [ECD]: for any affinoid perfectoid `X = Spa(R, R⁺)`, `H⁰_v(X, O_X) = R`
and `H⁰_v(X, O⁺_X) = R⁺`. Since `O⁺ ⊂ O` is the subpresheaf of functions of absolute value at most
`1`, and that condition may be checked after a v-cover, it is enough to prove that `O` is a v-sheaf.
Separatedness of `O` is immediate because `O(X)` injects into the product of the completed residue
fields. For the gluing, refine an affinoid v-cover over a totally disconnected base and use the
faithful flatness of `S⁺/ϖ` over `R⁺/ϖ` (D1.6) to obtain the integral Čech exactness modulo `ϖ`;
pass to the completed integral rings by the almost-exactness comparison of PerfectoidSpaces layer
P2, the almost identification of `S⁺/ϖ ⊗ S⁺/ϖ` with `T⁺/ϖ` that [ECD] compresses being the integral
tensor comparison of [Sch12]; invert `ϖ` for `O`, and check the plus condition by valuations. For a
general affinoid `X`, first use a disconnected pro-étale cover. Subcanonicity follows by
reconstructing maps from compatible functions and valuations ([ECD] §8, Thm 8.7 with proof, p. 43;
[ECD] §8, proof of Thm 8.7, p. 43, the one step where automatic flatness enters; [Sch12] §6, Prop.
6.18 with proof, p. 38). The flatness of `S⁺/ϖ` over `R⁺/ϖ` is faithful because `f` is surjective;
without surjectivity the equalizer statement fails (for `Y = ∅ → X ≠ ∅`, `O(Y) = 0` and the
equalizer is `0 ≠ R`), which is why the finite quasicompact image condition, not merely
pro-étaleness or flatness, is the covering condition. *Needs:* Mathlib
`CategoryTheory.GrothendieckTopology.Subcanonical`, `Module.FaithfullyFlat`; D1.6; D1.8; D2.6; D2.2;
PerfectoidSpaces layer P0 (almost modules over a perfectoid base); PerfectoidSpaces layer P2 (the
completed-tensor plus-ring almost formula).

**Checks.**

- `s2_7_degree_zero` (characterisation) — for `X = Spa(R, R⁺)` affinoid perfectoid, `H⁰_v(X, O) = R` and
  `H⁰_v(X, O⁺) = R⁺` exactly (not almost): `O⁺` is the equalizer in `O`, and the plus condition
  `|g| ≤ 1` is checked at the points of `X`, all of which are hit by a v-cover.
- `s2_7_finite_galois_cover` (computation) — for `Y = Spa(L, L°) → X = Spa(K, K°)` with `L/K` finite
  Galois of perfectoid fields with group `G`, `Y ×_X Y = Y × G`, and the v-sheaf condition for `O`
  reads `K = L^G`, Galois theory; for `O⁺` it reads `K° = (L°)^G`, true since `K° = K ∩ L°`.
- `s2_7_glue_maps_to_affinoid` (characterisation) — for `X = Spa(R, R⁺)` affinoid and a v-cover
  `{Y_i → Y}`, maps `g_i : Y_i → X` agreeing on `Y_i ×_Y Y_j` are maps of pairs
  `(R, R⁺) → (O(Y_i), O⁺(Y_i))` agreeing on overlaps, which glue to `(R, R⁺) → (O(Y), O⁺(Y))`
  because `O` and `O⁺` are v-sheaves; the glued map `|Y| → |X|` is continuous because `∐|Y_i| → |Y|`
  is a quotient map (AdicSpacesPartII R0.19.4). For a pro-étale cover this is the subcanonicity of the big pro-étale
  site, which D2.6 leaves to this target.
- `s2_7_point_separatedness` (characterisation) — `O(X) → ∏_{x ∈ X} K(x)^` is injective because a
  function vanishing at every point of an affinoid perfectoid `Spa(R, R⁺)` with `R` uniform is `0`
  (`R` is reduced and the spectral seminorm is a norm); separatedness of `O` is exactly this.
- `s2_7_not_sheaf_without_image_condition` (non-example) — for the family `{∅ → X}` with `X ≠ ∅`, which
  is pro-étale and flat but not a covering, the equalizer of `O(∅) ⇉ O(∅ ×_X ∅)` is `0 ≠ O(X)`.
- `structurePresheaf_empty` (degenerate case) — on a perfectoid space with `IsEmpty X.obj` the value
  of `structurePresheaf` is a subsingleton ring: the top open of `X` is the empty open, whose
  sections are terminal by the sheaf condition.
- Global-function pullback — for `f : Y ⟶ X` the map of `structurePresheaf` is the
  global-sections pullback `O_X(X) → O_Y(Y)` of `f`, so the presheaf is not constant in
  `X`.

`Geometry.O_isSheaf_v` and `Geometry.Oplus_isSheaf_v` prove ring-valued v-descent;
`Geometry.O_isSheaf` and `Geometry.Oplus_isSheaf` give the set-valued statements.
`Geometry.O_affine` and `Geometry.Oplus_affine` recover the affinoid rings exactly;
`Geometry.O_v_H0` and `Geometry.Oplus_v_H0` identify their degree-zero additive cohomology.
`Geometry.vSubcanonical` is the named subcanonicity theorem on `Geometry.vTopology p`; the instance
uses this theorem. `Geometry.subcanonical` states v and pro-étale subcanonicity in either
characteristic convention ([ECD] Theorem 8.7, p. 43; Theorem 1.2, p. 3). In `Suggested.lean`,
`structurePresheaf` is the ring-valued presheaf `X ↦ O_X(X)` on PerfectoidSpaces' `Perfd p`, built
from Mathlib's `PresheafedSpace.Γ`; `isSheaf_structurePresheaf` is its v-sheaf property and
`vTopology_subcanonical` the subcanonicity of `vTopology p`. Cohomology is taken on the small
site, as in [ECD] Theorem 1.2 and Proposition 8.8: `PerfdKappa p κ` is the full subcategory of
`Perfd p` cut out by PerfectoidSpaces' `IsKappaSmall p κ` and `vTopologyKappa p κ` the topology
generated on it by `vPrecoverage`. For a cutoff cardinal `κ` (D0.23),
`isSheaf_additiveStructurePresheaf` is the abelian v-descent of the restricted structure presheaf
and `additiveStructureSheaf` the resulting sheaf; `structureSheaf_v_H0` identifies its objectwise
degree-zero cohomology `Sheaf.H'` with the additive group of global functions. Both cohomology
statements assume that `PerfdKappa p κ` is essentially small in universe `u`, which holds because
a `κ`-small space is glued from fewer than `κ` affinoid pieces with rings of cardinality below `κ`
([ECD] Definition 4.2 and Proposition 4.4, p. 20; cutoff independence is [ECD] Proposition 8.2,
pp. 39–40), and from which Mathlib's `hasSheafifyEssentiallySmallSite`
supplies sheafification through a small model, and Ext in universe `u + 1`. The big site
`Perfd p` has no such sheafification for `AddCommGrpCat.{u}`: its covering sieves are not
`u`-small. The statements for `O⁺` and the pro-étale site are specified in the README only.

Lean: `structurePresheaf`, `isSheaf_structurePresheaf`, `vTopology_subcanonical`, `PerfdKappa`,
`vTopologyKappa`, the sheafification instance on an essentially small `PerfdKappa p κ`,
`isSheaf_additiveStructurePresheaf`, `additiveStructureSheaf` and `structureSheaf_v_H0`, with the
proved empty-space example `structurePresheaf_empty`. The other Checks and constructions are specified in the README only.

### D2.8 Higher v-acyclicity

**Higher v-acyclicity and almost acyclicity on affinoid perfectoid spaces.** (*higher-v-acyclicity*)
Let `X` be an affinoid perfectoid space. Then `H^i_v(X, O) = 0` for `i > 0`, and `H^i_v(X, O⁺)` is
almost zero for `i > 0`. Together with the v-sheaf property of D2.7 this is Theorem 1.2 of the
introduction of [ECD]: v-cohomology of `O` on an affinoid perfectoid space is concentrated in degree
zero, where it is `R`, and v-cohomology of `O⁺` is almost concentrated in degree zero, where it is
`R⁺`. No total disconnectedness is assumed in the statement, only in the first step of the proof,
and the vanishing for `O⁺` is asserted only up to almost zero (killed by `R°°`), which is what the
proof gives; exact vanishing is not claimed. The passage from reduction modulo `ϖ` to the completed
Čech complex uses a bounded-below, degreewise `ϖ`-torsion-free comparison from PerfectoidSpaces
layer P2, proved degree by degree with Milnor exact sequences and products of almost-zero groups,
controlling both `lim` and `lim¹`; the bounded-complex version alone does not justify this step.
Pro-étale disconnected refinements and the acyclic-basis comparison of SchemeAndStackFoundations
§2.2 (`cech_to_cohomology`, cited in D0.19) then extend the result to all affinoid perfectoid `X`;
the Čech-to-sheaf cohomology spectral sequence is used twice ([ECD] §8, Prop. 8.8 with proof, p. 43;
[ECD] §1, Thm 1.2, p. 3, the packaged form that this target and D2.7 together prove). *Needs:*
Mathlib `CategoryTheory.Sheaf.cohomologyPresheaf`; D1.6; D1.8; SchemeAndStackFoundations §2.2
(`cech_to_cohomology`, cited in D0.19); D2.7; D2.5; PerfectoidSpaces layer P0 (almost modules over a
perfectoid base); PerfectoidSpaces layer P2; D0.18; D2.4.

**Checks.**

- `s2_8_geometric_point` (degenerate case) — for `X = Spa(C, O_C)`, `C` algebraically closed, the
  pro-étale cohomology of `O` and `O⁺` vanishes exactly in degrees `i > 0` (Checks of D2.5); the
  v-cohomology is the content of this target and is only asserted almost for `O⁺`.
- `s2_8_tame_cyclic_cover_is_exact` (computation, control for "almost") — let `K` be a
  characteristic-zero perfectoid field of residue characteristic `p` with algebraically closed
  residue field, `ℓ ≠ p` a prime, and assume `|p|^{1/ℓ} ∉ |K^×|`. Put `L = K(p^{1/ℓ})` and
  `G = ℤ/ℓ`; Hensel lifting supplies the `ℓ`-th roots of unity. Then
  `Y = Spa(L, L°) → X = Spa(K, K°)` is a v-cover, `Y ×_X Y = Y × G`, and the Čech complex of `O⁺` is
  the inhomogeneous cochain complex of `G` on `L°`, so
  `Ȟ¹(Y/X, O⁺) = H¹(ℤ/ℓ, L°) = ker(Tr_{L/K}|_{L°}) / (σ − 1)L°`. Since `|p|^{1/ℓ} ∉ |K^×|`, an
  element `x = Σ_{i<ℓ} a_i p^{i/ℓ}` (`a_i ∈ K`) has `|x| = max_i |a_i| |p|^{i/ℓ}`, so `x ∈ L°` iff
  `|a_i p^{i/ℓ}| ≤ 1` for all `i`; `ker Tr ∩ L° = {x : a_0 = 0}`; and
  `(σ − 1)(Σ a_i p^{i/ℓ}) = Σ_{i ≥ 1} a_i (ζ^i − 1) p^{i/ℓ}` with `|ζ^i − 1| = 1` for `0 < i < ℓ`
  (`ℓ ≠ p`), so `(σ − 1)L° = ker Tr ∩ L°` and `H¹(ℤ/ℓ, L°) = 0` exactly, although
  `L° ⊗_{K°} L° ⊊ (L°)^ℓ`. So the almost-isomorphism defect of the integral tensor comparison does
  not by itself produce a nonzero `H¹_v(X, O⁺)`; the exact statement is neither claimed nor refuted
  here, and a witness of non-exactness would have to be a wildly ramified cover.
- `s2_8_empty_space` (degenerate case) — `X = ∅ = Spa(0, 0)`: all cohomology groups are `0`.
- `s2_8_not_for_non_affinoid` (non-example of the hypothesis) — for the perfectoid open unit disc
  `X = {|T| < 1}` (not quasicompact), `H¹_v(X, O)` is not claimed to vanish; the affinoid hypothesis
  is what makes the Čech argument finite.

`Geometry.O_v_acyclic` gives exact vanishing in positive degrees.
`Geometry.integralScalar` is multiplication by a global integral function on the
slice over its domain. `Geometry.Oplus_v_almost_acyclic` states that its induced map
on positive cohomology is zero when the function is topologically nilpotent on every
affinoid chart. On `Spa(R, R⁺)` this is annihilation by `R°°`, not exact vanishing of
the group. Both statements assume an affinoid and `0 < n`, with `HasExt` at the
specified universe ([ECD] Proposition 8.8, p. 43).

**`Geometry.integralScalar` — Checks.**

- `integralScalar_one` — Multiplication by one is the identity.
- `integralScalar_zero` — Multiplication by zero is the zero natural transformation.
- `integralScalar_detects_function` — Distinct functions give distinct transformations,
  detected by the unit section at the identity object of the slice.

Lean: `structureSheaf_v_acyclic`, for a cutoff cardinal `κ`, an essentially small
`PerfdKappa p κ` and an affinoid `X : PerfdKappa p κ`, states exact positive-degree vanishing for
`additiveStructureSheaf` on `vTopologyKappa p κ` using Mathlib's objectwise `Sheaf.H'`.
The integral almost-vanishing statement requires the integral sheaf and its scalar action and is
specified in the README only.

### D2.9 Pro-étale and v vector bundles

**Pro-étale and v vector bundles.** (*vector-bundles-across-pro-etale-and-v-sites*) For a perfectoid
space `X`, pullback gives equivalences between the categories of finite locally free `O_X`-modules
on its analytic site, on its étale site, on its small pro-étale site with the completed structure
sheaf, on the corresponding big pro-étale site and on `Perfd/X` with the v-topology. On an affinoid
perfectoid `Spa(R, R⁺)` these are the finite projective `R`-modules ([KL16] Theorem 3.5.8, p. 76;
[Berkeley] Lemma 17.1.8, pp. 150–151). The analytic and étale step, that finite projective
`R`-modules are the finite locally free `O_{X_ét}`-modules, is PerfectoidSpaces P3.19 and is
consumed here, not restated. Owned here are the pro-étale step, over the affinoid pro-étale
presentations of PerfectoidSpaces P6.9–P6.10, and the v step, from v-descent and v-acyclicity of `O`
(D2.7–D2.8). For a rigid variety `X/K` over a complete extension of `ℚ_p`, the comparison among the
pro-étale versions and the v-site of perfectoid spaces over `X` with completed `O` also holds
([Heuer] §2.1, pp. 5–6), using only that affinoid perfectoid objects form a basis of its pro-étale
site (AdicEtaleGeometry A1.12, PerfectoidSpaces P7.16). No descent along a Galois tower is used: the
descent of finite locally free modules and their morphisms along one pro-étale tower with perfectoid
limit, PerfectoidTowers P9.8 (*descent-of-finite-locally-free-modules*), is the specialisation of
this comparison to a tower and is a consumer. The statement does not assert that every v-vector
bundle on a general rigid `X` comes from an analytic `O_X`-vector bundle. The pro-étale sites carry
their completed structure sheaves, and the v-objects over a rigid `X` are perfectoid spaces mapping
directly to `X`; no diamond functor enters the construction. The substantive v-descent step is
convergent matrix descent: find a stable integral lattice and, locally, a basis for which the two
pullback bases differ by a matrix congruent to `1` modulo topological nilpotents, first over
perfectoid fields and then spread out; use the higher v-acyclicity of D2.8 to correct the matrix
successively, verify convergence in the completed tensor products, and prove effectivity. Ordinary
faithfully flat module descent does not replace this completed-cover argument ([KL16] §3.5, Thm
3.5.8 with proof, p. 76; [Heuer] §2.1, site conventions and the citation of [KL16] Thm 3.5.8, pp.
5–6, which distinguish the rigid pro-étale and v-site use from the perfectoid analytic-site
comparison). *Needs:* D2.2; D2.7; D2.8; PerfectoidSpaces P3.19 (étale descent of vector bundles) and
P6.9–P6.10 (affinoid pro-étale presentations); AdicEtaleGeometry A1.12 (the pro-étale site of a
rigid space); PerfectoidSpaces P7.16 (the affinoid perfectoid basis, rigid case only; the basis is
for a locally noetherian rigid base over a complete extension of `ℚ_p`).

**Checks.**

- `s2_9_rank_zero` (degenerate case) — the zero module is finite locally free of rank `0` on every one of
  the five sites and is sent to the zero module by every pullback; on `Spa(R, R⁺)` it is the zero
  `R`-module. For `X = ∅` every `O_X`-module is `0`, all five categories are the terminal category
  and the equivalences are the identity.
- `s2_9_affinoid_trivial_bundle` (computation) — on `Spa(R, R⁺)` the free module `O^n` on the
  analytic site pulls back to `O_v^n`, and `H⁰_v(X, O^n) = R^n` by D2.7, so the pullback is fully
  faithful on free modules by `Hom(O^m, O^n) = M_{n×m}(R)` on both sides.
- `s2_9_v_descent_is_not_module_descent` (non-example of the method) — for a v-cover `Y → X` of
  affinoids, `O(Y)` need not be faithfully flat over `O(X)` (D1.6 gives flatness only modulo `ϖ` and
  only over a totally disconnected base), so Grothendieck's faithfully flat descent of modules does
  not apply as stated; the convergent matrix argument replaces it.
- `s2_9_rigid_not_claimed` (non-example of the scope) — for a rigid variety `X/K` the comparison asserted
  is between the pro-étale and v versions only; no claim is made that a v-vector bundle on `X` comes
  from `X_an`, and [Heuer] is cited for the site conventions, not for such a claim.

`Geometry.VectorBundles p X t` uses Mathlib's finite-type and locally-free predicates
on the geometric ringed sites: `t = 0, 1, 2, 3, 4` denotes analytic, étale, small
pro-étale, big pro-étale, and v, respectively. The first three use the corresponding
full subcategories of spaces over `X`; the last two use all spaces over `X`, with
their respective topologies. All coefficients are the actual global function rings.
`Geometry.vectorBundles_equivalent` states equivalence of the five categories for
perfectoid `X`. `Geometry.vectorBundles_restriction` fixes the comparison: its inverse
is restriction of module presheaves, naturally in the bundle, so the equivalence is
induced by the geometric pullback. `Geometry.vectorBundles_affine` identifies any
of the categories with finite projective `R`-modules when `X = Geometry.affine p R`
([KL16] Theorem 3.5.8, p. 76).

`Rigid.VectorBundles p X v` uses perfectoid spaces mapping to the actual rigid space, via
`CostructuredArrow (Geometry.inclusion p) X.obj.left`, with completed function rings.
`Rigid.vectorBundles_proEtale_v` identifies the big pro-étale and v categories by restriction
inverse to pullback ([Heuer] §2.1, pp. 5–6; [KL16] Theorem 3.5.8, p. 76). The comparison with the
rigid small pro-étale site uses only the affinoid perfectoid basis of PerfectoidSpaces P7.16, as
specified above; PerfectoidTowers P9.8 is its tower specialisation and a consumer.

**`Rigid.VectorBundles` — Checks.** ([Heuer] §2.1, pp. 5–6; [KL16] Theorem 3.5.8, p. 76.)

- `Rigid_VectorBundles_rank_zero` — Both sites contain the zero bundle.
- `Rigid_VectorBundles_empty` — Every bundle over an empty rigid base is zero.
- `Rigid_VectorBundles_rank_one_nonzero` — A nonempty rigid base has a nonzero bundle
  on both sites.
- `Rigid_VectorBundles_infinite_rank_excluded` — On `Spa(C, O_C)` for a perfectoid field `C` over `ℚ_p`, the module
  sheaf `⊕ₙ O` is excluded: its fibre is an infinite-dimensional `C`-vector space, so it is not
  of finite type.
- `Rigid_VectorBundles_torsion_excluded` — On the rigid closed disc over such a `C`, the cyclic sheaf `O/(T)`
  is of finite type but its analytic stalk at the origin is not free: it is nonzero and
  annihilated by the nonzerodivisor `T`. On an affinoid perfectoid chart containing the origin,
  the analytic–v comparison excludes its pullback from the vector-bundle category as well.

**`Geometry.VectorBundles` — Checks.** ([KL16] Theorem 3.5.8, p. 76.)

- `VectorBundles_rank_zero` — Every site contains a zero bundle.
- `VectorBundles_empty` — Every bundle on the empty space is zero.
- `VectorBundles_rank_one_nonzero` — A nonzero affinoid has a nonzero bundle on each site.
- `VectorBundles_infinite_rank_excluded` — On `Spa(C, O_C)` for a perfectoid field `C`, the module
  sheaf `⊕ₙ O` is excluded: its fibre is an infinite-dimensional `C`-vector space, so it is not
  of finite type.
- `VectorBundles_torsion_excluded` — On the perfectoid closed disc over `C`, the cyclic sheaf `O/(T)`
  is of finite type but its analytic stalk at the origin is not free: it is nonzero and
  annihilated by the nonzerodivisor `T`. On an affinoid perfectoid chart containing the origin,
  the analytic–v comparison excludes its pullback from the vector-bundle category as well.

The infinite-rank and torsion exclusions, together with the zero and empty controls, are
anonymous example targets on the ringed-site carriers `Geometry.VectorBundles` and
`Rigid.VectorBundles` when those carriers are constructed ([KL16] Theorem 3.5.8, p. 76).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### Examples

The worked examples of this layer are the checks above and the acceptance cases of the theorems: a
single surjective pro-étale map of qcqs perfectoid spaces as a pro-étale covering; a jointly
surjective family of open immersions as a covering, and a point-surjective pro-étale family failing
the finite quasicompact image condition as a non-covering; the agreement of the image condition with
Mathlib's quasi-compact cover condition for schemes; a surjective map of affinoid perfectoid spaces
as a v-cover, the criterion of [ECD] Lem. 12.11, p. 72 (and the proof of Lem. 12.5); a proper extension
of algebraically closed perfectoid fields, a v-cover that is not pro-étale; the refused small
v-site; the empty family covering only the empty space; `O` and `O⁺` as small sheaves by commutation
with `ω₁`-filtered colimits of affinoid perfectoid rings; the non-quasiseparated final object of the
v-topos of `Perfd` (the non-quasicompact absolute self-product of
`Spa(𝔽_p((t^{1/p^∞}))^, 𝔽_p[[t^{1/p^∞}]]^)` in [ECD] Proposition 11.4) against the qcqs affinoid
perfectoid spaces; the almost vanishing of `H^i(X, O⁺)`, `i > 0`, transported from the étale to the
pro-étale site, with the exact vanishing not claimed and the tame cyclic cover `Spa L → Spa K`,
whose `O⁺`-Čech `H¹` is `H¹(ℤ/ℓ, L°) = 0`, as the control showing that the almost-isomorphism defect
`L° ⊗_{K°} L° ⊊ (L°)^ℓ` does not by itself produce non-exactness; the geometric point `Spa(C, O_C)`,
where everything vanishes exactly; and `H⁰_v(Spa(R, R⁺), O) = R`, `H⁰_v(Spa(R, R⁺), O⁺) = R⁺` with
the higher v-cohomology of `O` zero and that of `O⁺` almost zero, the content of [ECD] Thm 1.2; and
the rank-`0` bundle and the empty space as the degenerate cases of the vector bundle comparison.

The proved D2 example in `Suggested.lean` shows that global functions on an empty perfectoid
space form a subsingleton ring.

### Dependencies

Layer D0: surjective generalizing spectral maps as quotient maps (AdicSpacesPartII R0.19.4),
quasicompact and quasiseparated objects and morphisms in a topos and algebraic topoi
(AdicSpacesPartII R0.19.10), filtered colimits of abelian sheaves and their cohomology on an
algebraic topos (D0.18), the Čech-to-derived and Leray spectral sequences and the acyclic-basis
comparison cited in D0.19 from SchemeAndStackFoundations §2.2, and the cofinal class of cutoff
cardinals (D0.23). Layer D1: automatic flatness over a totally disconnected base (D1.6) and the
w-localization functor with its pro-étale presentation (D1.8). PerfectoidSpaces layer P0 (almost
modules over a perfectoid base), layer P2 (perfectoid spaces and glued tilting, fibre products of
perfectoid spaces, the sheaf theorem and almost acyclicity, the completed-tensor plus-ring almost
formula), layer P3 (étale-site tilting and étale almost acyclicity), layer P5 (cofiltered limits of
affinoid perfectoid spaces, finite-stage descent of qcqs étale objects) and layer P6 (pro-étale
maps, pro-étale stability and limits, `κ`-small perfectoid spaces), in D2.9 specifically P3.19 and
P6.9–P6.10; AdicEtaleGeometry A1.12 and PerfectoidSpaces P7.16 (D2.9, rigid case only; with a
locally noetherian rigid base over a complete extension of `ℚ_p`). Mathlib
`CategoryTheory.GrothendieckTopology`, `CategoryTheory.Pretopology`, `CategoryTheory.Precoverage`,
`CategoryTheory.Over`, `CategoryTheory.Sheaf`, `CategoryTheory.presheafToSheaf`,
`CategoryTheory.Functor.sheafPushforwardContinuous`, `CategoryTheory.IsFiltered`,
`CategoryTheory.Precoherent`, `CategoryTheory.GrothendieckTopology.Subcanonical`,
`CategoryTheory.Sheaf.cohomologyPresheaf`, `AlgebraicGeometry.Scheme.qcPrecoverage`,
`AlgebraicGeometry.Scheme.proetalePrecoverage` and `Module.FaithfullyFlat`. PerfectoidSpaces layer
P3 (the tame cyclic cover with `L° ⊗_{K°} L° ⊊ (L°)^ℓ`) and layer P4 (Zariski closed subsets of
affinoid perfectoid spaces, the diagonal of a map of perfectoid spaces) are used in the Checks of
D2.4, D2.5 and D2.8.

## Layer D3: effective descent and morphisms of stacks

Subcanonicity of the v-site gives descent of morphisms at once; descent of objects requires the
reconstruction of both the perfectoid algebra and its ring of integral elements, and is proved here
for affinoid perfectoid spaces over a totally disconnected base, for separated pro-étale perfectoid
spaces over a strictly totally disconnected base, and for separated étale and finite étale
perfectoid spaces over every base. The layer then defines the classes of morphisms of pro-étale
stacks — quasi-pro-étale, étale, finite étale, open and closed immersions, separated and 0-truncated
maps — by their pullbacks to perfectoid test spaces, shows that sub-v-sheaves of a totally
disconnected space are ind-representable, proves the target-local criteria of D3.9, with
separatedness for étale and quasi-pro-étale descent, and constructs torsors under a locally
profinite group with their pro-étale presentation as an inverse limit of separated étale level
spaces. The descent theorems justify the target-local morphism tests; those tests are never used to
prove their own descent inputs.

### D3.1 Full faithfulness of v-descent for morphisms

The first five targets establish effectivity of descent: full faithfulness in general, the
set-theoretic criterion that descends the ring of integral elements, and the three effectivity
theorems.

**The prestacks of perfectoid spaces over a base, and full faithfulness of v-descent for
morphisms.** (*descent-prestacks-of-perfectoid-spaces*) Let `F` be the prestack on the category of
perfectoid spaces sending a perfectoid base `X` to the category `F(X)` of perfectoid spaces and all
morphisms over `X`, and let `Y → X` be a v-cover. Restriction along the cover induces a fully
faithful functor `F(X) → F(Y/X)` into the category of descent data of [ECD] Def. 9.1: compatible
morphisms on the cover descend uniquely, that is, for `X₁`, `X₂` perfectoid over `X` a morphism
`X₁ → X₂` over `X` is the same as a morphism after base change to `Y` whose two pullbacks to
`Y ×_X Y` agree. The same full-faithfulness statement holds after restricting the objects to each of
four classes — affinoid perfectoid, separated pro-étale perfectoid, separated étale perfectoid and
finite étale perfectoid spaces over `X` — and these four restrictions are the prestacks whose
effectivity the following targets study. The only input is subcanonicity of the v-site (D2.7); no
restriction on the v-cover or on the spaces is needed. Essential surjectivity is not asserted in
this generality: the following targets prove it for the four restrictions, under the base hypotheses
stated there, and nothing is claimed about effectivity outside them. The abstract notion of descent
data and the assertion that a stack has an equivalence onto its category of descent data are
Mathlib's descent API, instantiated here on the geometric prestacks ([ECD] §9, Def. 9.1, p. 44;
[ECD] §9, Lem. 9.2 with proof, p. 44). *Needs:* Mathlib `CategoryTheory.Pseudofunctor.DescentData`,
`CategoryTheory.Pseudofunctor.IsPrestack`, `CategoryTheory.Pseudofunctor.toDescentData`,
`CategoryTheory.Pseudofunctor.sheafHom`; D2.7; D0.25.

**Checks.**

- `s3_1_identity_cover` (degenerate case) — for the v-cover `id : X → X`, `Y ×_X Y ≅ X`, a descent datum
  is an object of `F(X)` with the identity isomorphism, and `F(X) → F(X/X)` is an equivalence of
  categories for every prestack `F`.
- `s3_1_glue_morphisms` (characterisation) — for `X₁, X₂` perfectoid over `X` and `Y → X` a v-cover,
  a morphism `X₁ ×_X Y → X₂ ×_X Y` over `Y` whose two pullbacks to `Y ×_X Y` agree comes from a
  unique morphism `X₁ → X₂` over `X`: `Hom(−, X₂)` is a v-sheaf (D2.7) and `X₁ ×_X Y → X₁` is a
  v-cover.
- `s3_1_empty_cover` (degenerate case) — the empty family is a v-cover only of `X = ∅` (D2.2), where
  `F(∅)` is the groupoid of perfectoid spaces over `∅`, that is of `∅` itself, and `F(∅/∅)` is the
  terminal groupoid, so full faithfulness holds and is an equivalence.
- `s3_1_effectivity_not_claimed` (scope) — for a general v-cover `Y → X` and `Ỹ → Y` a perfectoid
  space with descent datum, the descended v-sheaf `Ỹ/(Ỹ ×_X Y)` exists (D4) but is not asserted to
  be a perfectoid space; D3.3–D3.5 give the cases in which it is.

`Perfd.slicePrestack` uses `CategoryTheory.Over` with all morphisms and `Over.pullback`
on restrictions. `slicePrestack_isPrestack` assumes pullbacks and a subcanonical topology.
Mathlib's `fullyFaithfulToDescentData` then supplies full faithfulness on a covering family.
The groupoid version is the core of each fibre; it does not discard the all-morphism statement.

- `slice_identity_cover` — restriction along the identity is an equivalence of slice categories.
- `slice_empty_base` — over a strict initial object the slice is equivalent to the terminal category.
- `slice_pullback_object` — restricting `Z → X` along `Y → X` gives the second projection
  `Z ×_X Y → Y`, fixing the variance and projection convention.
- `slice_all_morphisms` — in sets over a point, a constant endomorphism of the two-element set
  is a morphism which is not invertible; the all-morphism prestack is not a groupoid.

The perfectoid specialization requires the perfectoid category, its pullbacks and its subcanonical
v-topology. A generic slice does not supply any of the four geometric object predicates.

**`slicePrestack`.** The slice contains objects over the base; restriction changes them by pullback.

**Checks.**

- `definition_slicePrestack_1` — For the two-element chain, the slice over 1 has exactly two
  objects.
- `definition_slicePrestack_2` — The slice over 0 in the two-element chain has one object.
- `definition_slicePrestack_3` — Restriction from the slice over 1 to that over 0 identifies the two
  objects, so is not injective on objects.

`Geometry.descentObject` selects the four full subcategories of `Over (Geometry.Perf p)`:
index 0 means affinoid source, 1 separated pro-étale, 2 separated étale, and 3 finite étale.
`Geometry.descentObject_fullyFaithful` restricts the actual slice descent comparison to each
class and asserts full faithfulness for every covering family ([ECD] Lemma 9.2, p. 44).
For the affinoid prestack, bases and covering objects are affinoid; the restriction of the
all-morphism comparison itself makes sense over any base. Morphisms in the comparison are
all morphisms over the base, so the equivalence on cores follows as well.

**Checks.**

- `descentObject_affine_identity` — an affinoid identity belongs to all four classes.
- `descentObject_nonseparated` — a map with nonclosed diagonal belongs to neither separated class.
- `descentObject_nonclosed_open` — a nonclosed open immersion is separated étale but not finite étale.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.2 Descended subsets cut out by functions

**A subset whose preimage is cut out by functions is itself cut out by functions.**
(*descended-subsets-are-cut-out-by-functions*) Let `X = Spa(R, R⁺)` be a totally disconnected
affinoid perfectoid space, `X̃ = Spa(R̃, R̃⁺)` an affinoid perfectoid space over `X` and `A ⊂ |X̃|`
a subset. Suppose there is a surjection of affinoid perfectoid spaces `Y = Spa(S, S⁺) → X` such that
the preimage `B` of `A` in `|Ỹ|`, where `Ỹ = X̃ ×_X Y = Spa(S̃, S̃⁺)`, is an intersection of subsets
of the form `{|g| ≤ 1}` with `g ∈ S̃`. Then `A` itself is an intersection of subsets `{|f| ≤ 1}`
with `f ∈ R̃`. The hypothesis is total disconnectedness of `X`, and the conclusion is about the ring
`R̃`, not about `R̃⁺`. The proof has three reduction steps, each a separate argument: to `X`
connected (D1.3); then to an algebraically closed residue field, which is where the characteristic
polynomial appears and why a finite free algebra is used rather than a general finite one; and
finally the argument on the perfectoid ball ([ECD] §9, Lem. 9.4 with proof, pp. 45–46). Prove
alongside it the point-lifting result: for `C` an algebraically closed nonarchimedean field with an
open bounded valuation subring `C⁺ ⊂ C` and `V` an open subset of the Tate ball
`Spa(C⟨T₁, …, T_d⟩, C⁺⟨T₁, …, T_d⟩)` (the ordinary Tate algebra, not its perfectoid completion) that
maps onto `Spa(C, C⁺)`, there is a section `Spa(C, C⁺) → V`, so `V` has a `(C, C⁺)`-point. One
reduces to `V` rational: the closed point `s` of `Spa(C, C⁺)` has no open neighbourhood other than
the whole space, so any rational `V' ⊂ V` containing a point over `s` has pro-constructible
generalizing image containing `s`, hence all of `Spa(C, C⁺)`. The proof of Lem. 9.4 applies this to
a rational subset `V` of the perfectoid ball `Spa(C⟨T_{ij}^{1/p^∞}⟩, C⁺⟨T_{ij}^{1/p^∞}⟩)`: `V` is
the preimage of a rational subset `V_n` of the finite-level Tate ball in the coordinates
`T_{ij}^{1/pⁿ}` (rational subsets come from a finite level of the tower), `V_n` still maps onto
`Spa(C, C⁺)`, and a `(C, C⁺)`-point `(t_{ij})` of `V_n` lifts to `V` by choosing compatible
`p`-power roots of the `t_{ij}` in `C⁺`, which exist since `C` is algebraically closed and `C⁺` is
integrally closed. The proof of the Tate-ball case passes to the formal scheme `Spf O⁺(V)`, which is
flat and topologically of finite type, hence of finite presentation, over `Spf C⁺` — this is where
the Tate ball and not the perfectoid ball is needed: the flat-cover refinement lemma of this
subsection, `exists_finiteLocallyFree_refinement`, refines a finitely presented faithfully flat
cover of the spectrum of a strictly henselian local ring by a surjective finite locally free one: an
fppf covering of any scheme is dominated, after an étale covering of the base, by a surjective
finite locally free morphism ([Stacks fppf domination] Lem. 37.48.1, Tag 0DET; used in Lem. 37.48.2,
Tag 05WN), and over a strictly henselian local ring the étale covering has a section (strict
henselianity alone does not split arbitrary finite flat covers, which is why the étale step precedes
the finite locally free one); over `C⁺/C⁰⁰` the fraction field is algebraically closed; a generic
section extends by properness; and AdicSpacesPartIII §R2.1 supplies the finite-presentation result
for flat topologically finite type formal algebras over complete valuation rings of arbitrary
height, with the specialisation map of §R2.4 lifting the required field-valued point to an
`O_C`-valued point: `X(C⁺) = X(O_C) ×_{X(K)} X(R)` for `R = C⁺/C°°` with fraction field
`K = O_C/C°°`, and `X(O_C) → X(K)` is surjective by properness over the valuation ring `O_C` of a
quasi-projective closure ([ECD] §9, Lem. 9.5 with proof, pp. 46–47). *Needs:* Mathlib
`ValuationSubring`, `LinearMap.charpoly`, `Module.Free`, `IsAlgClosed`; D1.5; AdicSpacesPartII
R0.19.2; D1.3; PerfectoidSpaces layer P2 (rational localization of perfectoid affinoids);
AdicSpacesPartIII §R2.1 (*flat-tft-is-tfp*) and §R2.4 (*specialisation-map*).

**Checks.**

- `s3_2_trivial_cover` (degenerate case) — for `Y = X` (the identity cover) the hypothesis says `A` is an
  intersection of sets `{|g| ≤ 1}`, `g ∈ R̃`, and the conclusion is the hypothesis.
- `s3_2_rank_one_base` (degenerate case) — for `X = Spa(C, O_C)` a point (totally disconnected) and
  `X̃ = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)`, the subset `A = {|T| ≤ 1}` is cut out by `g = T` already
  and the lemma is vacuous; for `A = {|T| ≤ |ϖ|}` with `ϖ ≠ 0`, `g = T/ϖ ∈ R̃` cuts it out, so
  "`|f| ≤ 1`" conditions include all rational "`|f| ≤ |g|`" conditions with `g` a unit.
- `s3_2_open_disc_not_cut_out` (non-example of the shape) — the open unit disc `{|T| < 1}` in the closed
  disc `X̃ = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)` over `X = Spa(C, O_C)` is not an intersection of
  sets `{|f| ≤ 1}`, `f ∈ C⟨T^{1/p^∞}⟩`: the Gauss norm `|f|(η)` is the supremum of `|f|` over the
  open disc, so `|f| ≤ 1` on `{|T| < 1}` forces `|f(η)| ≤ 1`, and every such intersection contains
  the Gauss point `η`, which has `|T|(η) = 1`. The lemma concerns intersections of sets `{|f| ≤ 1}`
  only.
- `s3_2_section_lemma_point` (computation) — `d = 0`: `V ⊂ Spa(C, C⁺)` open and surjective onto
  `Spa(C, C⁺)` forces `V = Spa(C, C⁺)`, and the section is the identity. For `d = 1`, `C⁺ = O_C` and
  `V = {|T| ≤ |ϖ|} ∪ {|T| ≥ 1}` (a disjoint union of two rational subsets, surjective onto the
  point), the section `T ↦ 0` lands in the first piece; `V = {|T − a| ≥ 1 for all a ∈ O_C}`, the
  Gauss point alone, is not open and is excluded by the hypothesis.
- `s3_2_tate_ball_only` (non-example of the method) — for the perfectoid ball `O⁺(V)` is not
  topologically of finite type over `C⁺`, so `Spf O⁺(V) → Spf C⁺` is not of finite presentation and
  the flat-cover refinement lemma does not apply; the reduction to a finite level of the tower above
  is what makes the perfectoid case follow.

The geometric Checks of D3.2 require the ordinary and perfectoid Tate balls as adic spaces, their
coordinate valuations, rational restriction maps and Gauss points, together with affinoid perfectoid
fibre products. A valuation inequality over a ring alone does not identify the required subset or
its descended image. Here the open unit disc means the union `⋃_{n ≥ 1} {|T^n| ≤ |ϖ|}` for a fixed
pseudouniformizer `ϖ`; the notation `{|T| < 1}` denotes this analytic open, including its
higher-rank points. The Checks of D2.4, D2.8 and D3.2 use this union. The ordinary
ball in `s3_2_section_lemma_point` is specified by its universal property among complete Huber
pairs, and `s3_2_tate_ball_only` uses the integral ring of the supplied `PerfectoidSpace.discPair`.

`Geometry.inequalities_descend` states Lemma 9.4 on four actual perfectoid pairs with
an `IsPullback` square, a surjective map of affinoid spectra, and a totally disconnected base.
Its conclusion uses functions of the descended affinoid. `Geometry.tateBall_open_section`
states Lemma 9.5 for an algebraically closed `Geometry.FieldPoint p c`, in either characteristic
convention, and an ordinary finite-dimensional Tate ball in `CAff`. The ball is specified by
its integral coordinates and the universal property for maps to complete Huber pairs; this
retains the chosen plus ring and distinguishes it from a ball with all power roots adjoined.
The open subset must surject onto the field spectrum; the conclusion is a section of the
structural map whose image lies in that open ([ECD] Lemmas 9.4–9.5, pp. 45–47).

`Geometry.exists_finiteLocallyFree_refinement` uses a henselian local ring with separably
closed residue field and a surjective flat morphism locally of finite presentation to its
spectrum. It produces a finite free faithfully flat algebra and a factorization through the
cover. The étale-then-finite-locally-free refinement is [Stacks fppf domination]
Lemma 37.48.1, Tag 0DET; strict henselianity splits the étale step. Lemma 37.48.2,
Tag 05WN, uses this refinement to obtain its two finite-locally-free stages.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.3 Effective descent for affinoid perfectoid spaces

**Reconstruction of the descended almost perfectoid algebra over a totally disconnected base.**
(*totally-disconnected-mod-varpi-reconstruction*) Let `(R, R⁺)` be a totally disconnected
perfectoid pair. Choose compatible roots of a pseudouniformizer `ϖ ∈ R⁺` with `ϖ^p ∣ p` in
`R⁺`, and use the almost ideal generated by the `ϖ^{1/pⁿ}`. Let `B` be an almost
`R⁺/ϖ`-algebra, flat over `(R⁺/ϖ)^a`, with the semilinear Frobenius
`B/ϖ^{1/p} → B` an isomorphism. Construct a perfectoid `R`-algebra `R̃` and an isomorphism
`(R̃°/ϖ)^a ≅ B`, uniquely and functorially, including its specified `R`-algebra structure.
The complete integral lift is `ϖ`-torsion-free on almost elements, almost flat, and
`ϖ`-adically complete, with Frobenius `A/ϖ^{1/p} ≅ A/ϖ`; recover `R̃` by inverting `ϖ`.
Prove that for a perfectoid map `(R, R⁺) → (S, S⁺)`, reduction of
`R̃ ⊗̂_R S` identifies with `B ⊗^a_{(R⁺/ϖ)^a} (S⁺/ϖ)^a`, naturally in both maps and
algebras. This is the totally disconnected extension of [Sch12] Definition 5.1(iii) and
Theorem 5.2, pp. 21–22, required by [ECD] Proposition 9.3 with proof, p. 44.

For the algebra obtained by almost faithfully flat descent in D3.3, establish flatness and
the Frobenius isomorphism before applying reconstruction. The field-component description
of D1.3 and its completed-limit comparison reduce these assertions and the integral lifting
argument to the field case; the componentwise lifts must be compatible over clopen restrictions,
and their completed gluing must recover the given reduction and almost elements. The field-scope
reconstruction of PerfectoidSpaces P1.26/P1.28 supplies these component calculations; the gluing,
general-base reconstruction and base-change comparison are targets here. Write the reconstruction
as `Geometry.reconstructAlmostPerfectoid`, with its reduction comparison
`Geometry.reconstructAlmostPerfectoid_mod` and completed-base-change comparison
`Geometry.reconstructAlmostPerfectoid_baseChange`. *Needs:* D1.3; D1.6; PerfectoidSpaces P0
(almost faithfully flat descent and almost deformation theory), P1.26/P1.28 (field-scope flat
lifting and the almost-integral dictionary), P2 (completed tensor products), P5 (completed limits).

**Checks.**

- `reconstructAlmostPerfectoid_field` — For `R = K` with maximal plus ring, the construction is
  the field equivalence of PerfectoidSpaces P1.28, including the prescribed reduction map.
- `reconstructAlmostPerfectoid_two_components` — For `R = K₁ × K₂` with product maximal plus
  ring and `ϖ = (ϖ₁, ϖ₂)`, reconstruction of `B₁ × B₂` is the product of the two field lifts;
  the base idempotents remain distinct, and projection base change returns each factor.
- `reconstructAlmostPerfectoid_frobenius_needed` — Over a characteristic-p perfectoid field `K`,
  the flat almost algebra `(K°/ϖ)^a[T]` fails the Frobenius isomorphism: the class of `T` is
  not in its image. It is excluded even though it is flat.
- `reconstructAlmostPerfectoid_empty` — Over the zero pair the only algebra and its reconstructed
  Tate ring are zero; the associated affinoid is empty.

**Effective v-descent for affinoid perfectoid spaces over a totally disconnected base.**
(*effective-descent-affinoid-over-totally-disconnected*) For affinoid perfectoid `X` write `F(X)`
for the groupoid of affinoid perfectoid spaces over `X`. Let `X` be totally disconnected and `Y → X`
a v-cover with `Y` affinoid perfectoid. Then restriction `F(X) → F(Y/X)` is an equivalence of
categories. Both hypotheses are used: total disconnectedness of `X` gives the automatic flatness of
D1.6, and affinoidness of `Y` gives the almost faithfully flat descent of algebras. Effectivity
requires the reconstruction of the Tate ring together with its ring of integral elements; a descent
theorem for functions alone does not establish the equivalence, and the descended object must
reproduce both `R̃` and `R̃⁺`. The proof descends the almost algebra modulo a pseudouniformizer and
reconstructs a perfectoid Tate algebra with compatible completed base change, through
`Geometry.reconstructAlmostPerfectoid` and its completed-base-change comparison, with flatness
and the Frobenius isomorphism established as above; the ring of integral elements is descended in a separate step, through the criterion of D3.2 on subsets cut out by
`|f| ≤ 1` ([ECD] §9, Prop. 9.3 with proof, p. 44; [ECD] §9, proof of Prop. 9.3, p. 44, the step
descending the integral subring). Effectivity is not claimed without the totally disconnected
hypothesis on the base — the proof uses it through D1.6 and [ECD] gives no counterexample — and for
non-affinoid `Y` the statement proved is the separated pro-étale one of D3.4. *Needs:* Mathlib
`Module.FaithfullyFlat`; D1.6; D1.1; D3.1; D3.2; PerfectoidSpaces layer P0 (almost modules over a
perfectoid base; almost faithfully flat descent); the reconstruction target above;
PerfectoidSpaces layer P1 (the tilting equivalence and the explicit tilt).

**Checks.**

- `s3_3_identity_cover` (degenerate case) — for `Y = X` the functor `F(X) → F(X/X)` is an equivalence of
  groupoids and the descended pair is `(R̃, R̃⁺)` itself.
- `s3_3_finite_etale_galois_descent` (computation) — for `X = Spa(C, O_C)` (a point, totally
  disconnected) and `Y = X` there is nothing to descend; for `X = Spa(K, O_K)` with `K` a perfectoid
  field with algebraically closed residue field but `K` not algebraically closed — still totally
  disconnected, `|X|` a point — and `Y = Spa(L, O_L)` for `L/K` finite Galois with group `G`, a
  descent datum on `Ỹ = Spa(S̃, S̃⁺)` over `Y` is a semilinear `G`-action (`Y ×_X Y = Y × G` since
  `L ⊗_K L ≅ ∏_{g ∈ G} L`), `R̃ = S̃^G` by Galois descent, and `R̃⁺ = (S̃⁺)^G`, is cut out in
  `Spa(R̃, R̃⁺_min)` by the conditions `|f| ≤ 1`, `f ∈ (S̃⁺)^G`; here `O_L` is faithfully flat over
  `O_K` outright (torsion-free over a valuation ring, and local), so the almost-mathematics step of
  the general proof is not visible.
- `s3_3_both_rings_needed` (characterisation) — the descended object is a pair `(R̃, R̃⁺)`: the ring
  `R̃` is determined by faithfully flat descent of `(S̃⁺/ϖ)^a` and untilting, and `R̃⁺` by D3.2; the
  minimal choice `R̃⁺_min` (the integral closure of `R⁺ + R̃°°`) is in general strictly smaller than
  `R̃⁺`, which is why a second step is needed.
- `s3_3_base_hypothesis` (scope) — for a base that is not totally disconnected (the perfectoid
  closed disc, `|X|` not profinite in the constructible-component sense of D1.1) the statement is
  not claimed; `S⁺/ϖ` need not be flat over `R⁺/ϖ`.

The Checks of D3.3 require the affinoid perfectoid pair category, the core of its slice, its
v-descent comparison, and the completed base-change comparison for both rings of the pair. Fixed
subrings by themselves do not identify the descended adic object.

`Geometry.affinoid_effectiveDescent` takes an affinoid cover of a totally disconnected
affinoid base and a Mathlib descent datum whose object is affinoid. It produces an affinoid
object in the actual perfectoid slice and an isomorphism from its canonical descent datum to
the given datum ([ECD] Proposition 9.3, p. 44). Together with
`Geometry.descentObject_fullyFaithful`, this states the equivalence, including the maps of
complete Huber pairs and hence their plus rings.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.4 Effective descent for separated pro-étale perfectoid spaces

**Effective v-descent for separated pro-étale perfectoid spaces over a strictly totally disconnected
base.** (*effective-descent-separated-pro-etale*) For each perfectoid space `X` let `F(X)` be the
groupoid of separated pro-étale perfectoid spaces over `X`. Let `X` be strictly totally disconnected
and `Y → X` any v-cover. Then `F(X) → F(Y/X)` is an equivalence of categories: under this base
hypothesis the restriction functor is essentially surjective as well as fully faithful. The
separatedness assumption on the pro-étale objects is a hypothesis of the proof, which [ECD]
introduces explicitly ("we will however need to make a separatedness assumption"); it is used to see
that the image `R' ⊂ |Ỹ| × |Ỹ|` of the equivalence relation `Ỹ ×_X Y` is pro-constructible, through
the quasicompactness of `W ×_X Y ∩ Y ×_X W` for quasicompact opens `W ⊂ Ỹ`. The statement without
separatedness is not claimed, and no counterexample is asserted. One may assume `Y` strictly totally
disconnected as well, by refining along the universally open cover of D1.9. The proof uses the
classification of D1.11 of pro-étale perfectoid spaces over the strictly totally disconnected base,
descends the profinite component parameter and its pro-constructible generalizing image (D0.8, D0.9,
D1.5), and applies the criterion of D3.2, through D3.3, to recover the perfectoid structure ([ECD]
§9, Prop. 9.6 with proof, p. 47). The elementary special construction that [ECD] Lem. 9.9 uses is
proved in D3.5 directly and does not assume the general canonical compactification theorem of [ECD]
18.6. This is the target that makes the quasi-pro-étaleness of an atlas ([ECD] Prop. 11.3(iv)) work.
*Needs:* D0.8; D0.9; D1.11; D1.4; D1.5; D3.3; D3.1.

**Checks.**

- `s3_4_identity_cover` (degenerate case) — for `Y = X` every descent datum is effective trivially.
- `s3_4_affinoid_objects` (characterisation) — for `Ỹ → Y` affinoid pro-étale (separated, since maps
  of affinoid perfectoid spaces are separated, PerfectoidSpaces layer P4) the conclusion is D3.3
  applied to `Ỹ`, with the base strictly totally disconnected, hence totally disconnected.
- `s3_4_profinite_set_over_point` (degenerate case) — for `X = Spa(C, O_C)` and
  `Y = Spa(C', O_{C'}) → X` a v-cover by a larger complete algebraically closed field, the
  quasicompact separated pro-étale objects over `Y` are the `S̲ × Y` with `S` profinite (D1.11), and
  `S̲ × Y` with the descent datum pulled back from `S̲ × X` descends to `S̲ × X`; the content of the
  target is for descent data not of this form, whose descended space is again of the form `S'̲ × X`
  since `X` is strictly totally disconnected and D1.11 applies to it.
- `s3_4_separatedness_is_used` (scope) — a pro-étale `Ỹ → Y` that is not separated (for instance the disc
  `Y ⊔_U Y → Y` glued along a nonclosed rational open `U ⊊ Y`, such as
  `U = {|T| ≤ |ϖ|}` in the perfectoid closed disc, which is étale and surjective but has non-closed
  diagonal) is outside the statement; nothing is claimed about it.
- `s3_4_empty_gluing_open` (control) — for `U = ∅` and nonempty affinoid `Y`, the fold
  `Y ⊔ Y → Y` is finite étale with open-and-closed diagonal, hence separated. Rationality of the
  gluing open alone does not give a nonseparated example.

The Checks of D3.4 require separated pro-étale objects in the actual perfectoid slice and its
descent comparison, including the profinite product with a geometric point. An arbitrary category
with a supplied pro-étale predicate does not express these examples.

`Geometry.separatedProEtale_effectiveDescent` uses a strictly totally disconnected base
and a v-covering family. Every object of the datum must satisfy both separatedness and
pro-étaleness. The descended slice object satisfies both conditions, with an isomorphism of
its canonical descent datum to the original one ([ECD] Proposition 9.6, p. 47).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.5 Separated étale and finite étale perfectoid spaces form v-stacks

**Separated étale and finite étale perfectoid spaces form v-stacks.**
(*etale-and-finite-etale-are-v-stacks*) The prestack sending a perfectoid space `X` to the groupoid
of separated étale perfectoid spaces over `X` is a stack for the v-topology, and so is the prestack
sending `X` to the groupoid of finite étale perfectoid spaces over `X`: effective v-descent holds
for both groupoids over every perfectoid base. The étale case needs separatedness, as in the
pro-étale case; the finite étale case does not, because finite étale maps are automatically
separated ([ECD] §9, Prop. 9.7 with proof, pp. 47–48). The last step uses the compactification
lemma: for `X = Spa(K, K⁺)` with `K` a perfectoid field and `K⁺ ⊂ K` open, bounded and integrally
closed, every quasicompact separated étale `Y → X` factors functorially as a quasicompact open
immersion into a finite étale `Ȳ → X`; this is a special case of the canonical compactification of
[ECD] 18.6 and is proved here on its own ([ECD] §9, Lem. 9.9, p. 49). The stack assertions give
local criteria for morphisms, packaged as the v-local nature of the three classes of maps: for
`f : Y → X` a map of perfectoid spaces and `X̃ → X` a v-cover with pullback `f̃`, if `f̃` is étale
then `f` is étale; if `f̃` is finite étale then `f` is finite étale; and if `X` is strictly totally
disconnected and `f̃` is pro-étale then `f` is pro-étale ([ECD] §9, Cor. 9.11, p. 49). No
separatedness of `f` is assumed in these three implications, and none is needed: étaleness and
pro-étaleness are local on the source, so after making the target affinoid, `Y` may be replaced by
an open affinoid, over which `f` is separated; finite étale maps are separated; the hypothesis is on
the descended *objects* of the stacks, not on the map being tested. The argument first works locally
on the target with `X` affinoid, then locally on the source with `Y` affinoid; maps between these
affinoids are separated. These three implications are the representable case of the v-local tests of
D3.9 and the inputs of its proof, which does not restate them; they are what make the definitions of
D3.6 work. *Needs:* Mathlib `CategoryTheory.Pseudofunctor.IsStack`; D3.4; D1.9; D1.11; D0.9;
AdicSpacesPartII R0.19.4; PerfectoidSpaces layer P5 (finite-stage descent of qcqs étale objects);
PerfectoidSpaces layer P3 (the almost purity theorem).

**Checks.**

- `s3_5_identity_cover` (degenerate case) — descent along `id : X → X` is trivially effective for both
  stacks.
- `s3_5_compactification_point` (computation) — for `X = Spa(K, K⁺)` with `K⁺` of rank two and `Y = X°`
  the open subset `Spa(K, O_K)` (quasicompact open, étale, separated), `Ȳ = X` with `Y ↪ Ȳ` the open
  immersion and `Ȳ → X` the identity, finite étale of degree `1`; for `K⁺ = O_K` the lemma is the
  statement that a quasicompact separated étale `Y → Spa(K, O_K)` is finite étale, since
  `|Spa(K, O_K)|` is a point and `Y` is a finite disjoint union of `Spa(L, O_L)`.
- `s3_5_finite_etale_needs_no_separatedness` (characterisation) — the diagonal of a finite étale map of
  perfectoid spaces is an open and closed immersion (PerfectoidSpaces layer P3), so the finite étale
  prestack carries no separatedness clause.
- `s3_5_corollary_without_separatedness` (characterisation) — after restricting to an affinoid open
  of `X`, write `Y = ∐_i U_i` locally on the source with each `U_i` affinoid. Each `U_i → X`
  is separated, and étaleness is local on source and target, so the separated descent theorem
  gives Cor. 9.11(ii). The arbitrary v-cover may first be refined by affinoid perfectoid spaces;
  its fibre products with the `U_i` over the affinoid base are affinoid.

The geometric Checks of D3.5 require the separated étale and finite étale slice groupoids and the
functorial compactification over a perfectoid field pair, including the rank-two to rank-one open
immersion.

`Geometry.etale_effectiveDescent` asserts essential surjectivity of the slice comparison
for class 2 (separated étale) and class 3 (finite étale), over every perfectoid base and every
v-covering family; `Geometry.descentObject_fullyFaithful` supplies full faithfulness
([ECD] Proposition 9.7, pp. 47–48). `Geometry.etale_finiteCompactification` assumes a
quasicompact separated étale object over an affinoid perfectoid field pair. Its finite étale
compactification contains the given object as a quasicompact open and is initial among
finite étale factorizations, specifying functoriality ([ECD] Lemma 9.9, p. 49).
`Geometry.etale_of_vCover` gives all three implications of Corollary 9.11 (p. 49), with
strict total disconnectedness only in the pro-étale clause and no separatedness hypothesis
on the map being tested.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.6 Étale, finite étale and quasi-pro-étale morphisms of stacks

The relative predicates in `Perfd.Stack` take maps of set-valued sheaves `F G : Sheaf J (Type u)`,
including pro-étale sheaves. The geometric stack targets in D3.6–D3.9 take
`F G : Geometry.VStack p`, for a prime `p`: their underlying objects are
`LocallyDiscrete (Geometry.Perf p)ᵒᵖ ⥤ᵖ Cat.{2, 2}`, with groupoid fibres and v-descent, on
characteristic-`p` perfectoid spaces. All names below are relative to
`TauCetiRoadmap.DiamondsAndVStacks`. Their target-local tests are those of D3.9, including
separatedness for étale and quasi-pro-étale descent.

**Étale, finite étale and quasi-pro-étale morphisms of v-stacks.**
(*etale-and-quasi-pro-etale-morphisms-of-stacks*) Let `f : Y' → Y` be a map of `Geometry.VStack p`.
The map is locally separated when `Y'` has an open cover on which `f` becomes separated. It is
quasi-pro-étale if it is locally separated and for every strictly totally disconnected perfectoid
space `X` with a map `X → Y` the pullback `Y' ×_Y X` is representable by a perfectoid space and
`Y' ×_Y X → X` is pro-étale; étale if it is locally separated and for every perfectoid space `X`
with a map `X → Y` the pullback is representable and étale over `X`; finite étale if for every
perfectoid space `X` with a map `X → Y` the pullback is representable and finite étale over `X`. The
étale and finite étale tests for sheaves use Mathlib's `MorphismProperty.presheaf`
(`MorphismProperty.relative` along `yoneda`) for the étale, respectively finite étale, property of
perfectoid spaces, and the quasi-pro-étale test is the same relative notion with the test objects
restricted to strictly totally disconnected spaces; representability of a presheaf is Mathlib's
`Functor.IsRepresentable`. Local separatedness is part of the definition of étale and
quasi-pro-étale maps, not a consequence: [ECD] Convention 10.2 makes it a standing convention
because otherwise a slightly different definition would be wanted; it is not imposed on finite étale
maps, which are automatically separated. Representability by perfectoid spaces belongs to these
three morphism tests only; it is not a condition on every morphism of diamonds. A map is
automatically locally separated when `Y'` is a perfectoid space and `Y` is a v-sheaf. On maps of
`Sheaf J (Type u)`, `Perfd.Stack.IsLocallySeparated` requires an effective-epimorphic open cover of
the source on which the map is separated; `Perfd.Stack.IsQuasiProEtale` includes this condition and
tests representable pro-étale pullbacks to strictly totally disconnected objects;
`Perfd.Stack.IsEtale` includes local separatedness and tests étale pullbacks to every representable.
Their geometric specializations on `Geometry.VSheaf p` are `Geometry.locallySeparated`,
`Geometry.quasiProEtale` and `Geometry.sheafEtale`, whose bodies apply those relative definitions at
`Geometry.vTopology p`, using the open and étale topologies of D1.1 and D1.4. For `f : F ⟶ G`
between v-stacks, use `Geometry.StackProperty p Q f` with `Q = Geometry.locallySeparated p`,
`Geometry.quasiProEtale p` or `Geometry.sheafEtale p`, respectively. This requires every perfectoid
2-base change to be equivalent over its base to a v-sheaf map satisfying `Q`. For sheaves, use
`finiteEtale.presheaf` directly for representable finite étale pullbacks; for stacks define
`Geometry.IsFiniteEtale` by the same representable-pullback condition. Finite étale maps are
automatically separated ([ECD] §10, Def. 10.1 and Conv. 10.2, pp. 49–50). Prove
`Perfd.Stack.isQuasiProEtale_comp` (if `f` and `g` satisfy
`Geometry.StackProperty p (Geometry.quasiProEtale p)`, then so does `f ≫ g`),
`Perfd.Stack.isQuasiProEtale_of_comp` (if `g` and `f ≫ g` satisfy it, then so does `f`) and
`Perfd.Stack.isQuasiProEtale_pullback` (if `f` satisfies it, so does
`Geometry.stackPullbackSnd p f g` for every `g` with the same target).
`Geometry.etale_stack_operations` and `Geometry.etale_stack_pullback` give the étale and finite
étale counterparts. On `Geometry.VSheaf p`, `Perfd.Stack.isQuasiProEtale_comp_sheaf`,
`Perfd.Stack.isQuasiProEtale_of_comp_sheaf` and `Perfd.Stack.isQuasiProEtale_pullback_sheaf` state
these three implications for `Geometry.quasiProEtale p`, using ordinary composition and pullbacks.
For representable sheaf properties, Mathlib supplies `relative_isStableUnderBaseChange` and
`isMultiplicative`. [ECD] Prop. 10.4 gives composition, this cancellation property and base change
for all three classes, while the remaining two-out-of-three statement, deducing the property of `g`
from that of `f` and the composite, needs extra hypotheses and is [ECD] Prop. 11.30. Prove
`Perfd.Stack.isQuasiProEtale_iff_isProEtale` (the third comparison target below: for a map of
perfectoid spaces over a strictly totally disconnected base, quasi-pro-étale is equivalent to
pro-étale: for `X` strictly totally disconnected a map of perfectoid spaces is pro-étale exactly
when the corresponding map of v-sheaves is quasi-pro-étale) and
`Perfd.Stack.isEtale_iff_of_perfectoid` (for a map of characteristic-`p` perfectoid spaces,
`Geometry.sheafEtale` on its Yoneda map is equivalent to `Geometry.etale p true`, hence to the
imported `PerfectoidSpace.IsEtale p` after `Geometry.toPerfectoid`; the finite étale comparison uses
Mathlib's `relative_map_iff` and, on affinoids, `Geometry.finiteEtalePair_iff` for the imported
`PerfectoidSpace.IsFiniteEtale p`) ([ECD] §10, Prop. 10.3 and Prop. 10.4, p. 50). *Needs:* Mathlib
`CategoryTheory.Sheaf`, `CategoryTheory.MorphismProperty`,
`CategoryTheory.MorphismProperty.presheaf`, `CategoryTheory.Functor.IsRepresentable`; D1.4; D2.1;
D3.5; PerfectoidSpaces layer P6 (pro-étale maps, pro-étale stability and limits, `κ`-small
perfectoid spaces), specifically P6.13 (base change of pro-étale maps).

**Checks.**

- `s3_6_pro_etale_of_perfectoid_spaces` (characterisation) — a pro-étale map of perfectoid spaces is
  quasi-pro-étale (it is locally separated, being a map from a perfectoid space to a v-sheaf, and
  pro-étale maps are stable under base change); [ECD] states that the converse need not hold over a
  general base, by analogy with weakly étale versus pro-étale maps of schemes, and gives no example;
  none is asserted here. Over a strictly totally disconnected base the converse holds
  (`isQuasiProEtale_iff_isProEtale`).
- `s3_6_trivial_cases` (degenerate cases) — the identity is quasi-pro-étale, étale and finite étale;
  `∅ → Y` is all three (its pullbacks are `∅ → X`, finite étale of degree `0`); for `Y` a perfectoid
  space and `Y' = Y`, the predicates reduce to those of PerfectoidSpaces layer P3 and P6 by
  `isEtale_iff_of_perfectoid`.
- `s3_6_locally_separated_is_automatic_for_spaces` (characterisation) — for `Y'` a perfectoid space and
  `Y` a v-sheaf, `f` is locally separated: an open affinoid `U ⊂ Y'` has `U → U ×_Y U ⊂ U × U` a
  closed immersion, since the diagonal of an affinoid perfectoid space is Zariski closed
  (PerfectoidSpaces layer P4, *diagonal-of-perfectoid-map*). So the clause has content only for maps
  between stacks, and a non-locally-separated map necessarily has a non-representable source.
- `s3_6_open_immersion` (degenerate cases) — an open immersion is étale, and a finite disjoint union of
  isomorphisms is finite étale.
- `s3_6_locally_separated_is_needed` — for a morphism failing local separatedness, both the étale and the
  quasi-pro-étale predicate are false even when their other pullback conditions are postulated; this
  checks that Convention 10.2 is present in each predicate and asserts no unsupported geometric
  quotient example. A map that is not locally separated: `BG̲ → ∗` for `G` a nontrivial profinite
  group, whose only open substacks are `∅` and `BG̲` (an open substack pulls back to an open of the
  atlas `∗`) and whose diagonal pulls back along `X → BG̲ × BG̲` to an `Isom` of torsors, a
  `G̲`-torsor over `X` and not a closed immersion; its pullbacks to perfectoid spaces are the
  non-representable `BG̲ × X`, so it also fails the representability clause, and the test therefore
  postulates the other conditions rather than exhibiting them.
- `s3_6_agrees_with_absolute_notion` — for a map of perfectoid spaces the predicates agree with the usual
  étale and finite étale notions of [ECD] §6.

For a map `f : X' → X` of perfectoid spaces, viewed as a map of the represented v-sheaves, the three
classes compare with the perfectoid notions in three different ways, stated as three targets.

**Étale and finite étale on representables.** `f` is étale (respectively finite étale) as a map of
perfectoid spaces iff the induced map of v-sheaves is étale (respectively finite étale) in the sense
above, with no hypothesis on `X` ([ECD] Proposition 10.3, first sentence, p. 50). This is
`Perfd.Stack.isEtale_iff_of_perfectoid` with its finite étale companion.

**Pro-étale implies quasi-pro-étale.** If `f` is pro-étale, the induced map of v-sheaves is
quasi-pro-étale, for every perfectoid `X`: its pullbacks to strictly totally disconnected spaces are
pro-étale by base change (PerfectoidSpaces P6.13) and it is locally separated ([ECD] paragraph
before Proposition 10.3, p. 50). The converse is not asserted in this generality; this is the Check
`s3_6_pro_etale_of_perfectoid_spaces`.

**Quasi-pro-étale over a strictly totally disconnected target.** If `X` is strictly totally
disconnected (D1.4), then `f` is pro-étale iff the induced map is quasi-pro-étale ([ECD] Proposition
10.3, second sentence, p. 50). The hypothesis on `X` belongs to the statement, as in the pro-étale
clause of D3.5; this is `Perfd.Stack.isQuasiProEtale_iff_isProEtale`. Checks: the identity of a
strictly totally disconnected `X`; over `X = Spa(C, C⁺)`, `X × S → X` for profinite `S` is both;
étale maps are pro-étale, hence quasi-pro-étale over any `X`.

The geometric Checks of D3.6 use the perfectoid Yoneda functor and the comparison between geometric
and representable-pullback morphism classes. The relative sheaf Checks below use
`Perfd.Stack.IsQuasiProEtale` and `Perfd.Stack.IsEtale`; the stack statements use
`Geometry.StackProperty` on the groupoid-valued carrier specified above.

The following relative morphism Checks use `C = Type`, the minimal topology `J = ⊥`, and the
constant one-point space functor. Open and closed immersions are monomorphisms; étale and pro-étale
maps are all maps. Every set is a totally and strictly totally disconnected test object for these
choices. The category of sets supplies small coproducts by `inferInstance`; its object and Hom
universes are independent in the suggested Lean signatures. All maps below are represented via
`J.yoneda`, including the empty set and empty fibres. Here `y(∅)` has one section on the empty test
object, whereas the constantly empty presheaf has none. The negative controls explicitly change a
supplied morphism class.

**`Perfd.Stack.IsQuasiProEtale`.** With the set-site choices above, the fold and the point inclusion are quasi-pro-étale; restricting the pro-étale class to monomorphisms excludes the fold.

**Checks.**

- `Perfd_Stack_IsQuasiProEtale_bool_negation` — The represented Boolean permutation passes with monomorphisms as the immersion classes.
- `Perfd_Stack_IsQuasiProEtale_empty_identity` — The identity of the represented empty set passes; its section over the empty set is unique.
- `Perfd_Stack_IsQuasiProEtale_bool_projection` — The two-point fold passes; its diagonal is injective and all its set-theoretic pullbacks are representable.
- `Perfd_Stack_IsQuasiProEtale_point_inclusion` — The one-point inclusion into two points passes, including the empty fibre over the other point.
- `Perfd_Stack_IsQuasiProEtale_fold_restricted_class_fails` — Restricting the supplied pro-étale class to monomorphisms excludes the fold, although it remains locally separated.

**`Perfd.Stack.IsEtale`.** With the same set-site choices, the fold and the point inclusion are étale; restricting the étale class to monomorphisms excludes the fold.

**Checks.**

- `Perfd_Stack_IsEtale_bool_negation` — The represented Boolean permutation passes with monomorphisms as the immersion classes.
- `Perfd_Stack_IsEtale_empty_identity` — The identity of the represented empty set passes; its section over the empty set is unique.
- `Perfd_Stack_IsEtale_bool_projection` — The two-point fold passes; its diagonal is injective and all its set-theoretic pullbacks are representable.
- `Perfd_Stack_IsEtale_point_inclusion` — The one-point inclusion into two points passes, including the empty fibre over the other point.
- `Perfd_Stack_IsEtale_fold_restricted_class_fails` — Restricting the supplied étale class to monomorphisms excludes the fold, although it remains locally separated.

`Geometry.IsFiniteEtale` is the finite étale predicate on `Geometry.VStack p`, using
`StackProperty` and the affinoid-pair test `sheafFiniteEtale`. `Geometry.etale_stack_operations`
states composition and first-factor cancellation for étale and finite étale maps;
`Geometry.etale_stack_pullback` gives their stability under 2-base change
([ECD] Proposition 10.4, p. 50). `Geometry.finiteEtale_stack_separated` asserts the automatic
separatedness of finite étale stack morphisms ([ECD] Definition 10.1(iii), p. 50).

**Checks.**

- `IsFiniteEtale_identity` — identities of arbitrary stacks are finite étale.
- `IsFiniteEtale_empty` — the empty sheaf over any sheaf is finite étale, of degree zero.
- `IsFiniteEtale_nonclosed_open` — a nonclosed perfectoid open immersion fails the finite étale test.

**Checks.**

- `Perfd.Stack.isFiniteEtale_id` — The identity of a sheaf satisfies representable finite étaleness when the selected finite étale class is multiplicative and respects isomorphisms.
- `Perfd.Stack.isEtale_id` — The identity is étale when the open immersion and étale classes are multiplicative and respect isomorphisms, and every identity is a closed immersion.
- `Perfd.Stack.not_isEtale_of_not_isLocallySeparated` — A sheaf morphism that is not locally separated is neither étale nor quasi-pro-étale.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.7 Sub-v-sheaves of a totally disconnected space

**Sub-v-sheaves of a totally disconnected space are ind-representable, and quasicompact
injections.** (*sub-v-sheaves-of-totally-disconnected-spaces*) Let `X` be a totally disconnected
perfectoid space and `Y ⊂ X` a sub-v-sheaf, with no representability assumed on `Y`. Then `Y` is
ind-representable: it is the filtered colimit of the `Y_i ⊂ Y ⊂ X` that are pro-constructible
generalizing subsets of `X`, each of which is affinoid pro-étale over `X` by D1.5 ([ECD] §10, Prop.
10.5 with proof, pp. 50–51). Consequently a quasicompact injection `f : Y' → Y` of v-stacks is
quasi-pro-étale, and for every totally disconnected perfectoid space `X` over `Y` the fibre product
`Y' ×_Y X` is represented by a pro-constructible generalizing subset of `X`; quasicompactness of the
injection is what passes from ind-representable to representable ([ECD] §10, Cor. 10.6 with proof,
p. 51). The hypothesis on `X` is used, through D1.5, to make the image of an affinoid `Z → Y ⊂ X` —
a pro-constructible generalizing subset of `|X|` — an affinoid perfectoid space over which `Z` is a
v-cover; for `X` not totally disconnected the statement is not claimed, and [ECD] gives no
counterexample (for the perfectoid closed disc the images of points and the Gauss point are still
perfectoid subspaces, so a counterexample, if any, is not a single point). The corollary is how
closed immersions and separatedness become quasi-pro-étale notions in D3.8, and it is applied again
in [ECD] Prop. 11.10 and Prop. 11.20. *Needs:* Mathlib `Topology.IsConstructible`,
`StableUnderGeneralization`; D1.5; AdicSpacesPartII R0.19.2; D3.6; D2.7.

**Checks.**

- `s3_7_whole_and_empty` (degenerate cases) — `Y = X` is the colimit of the single term `X` (`|X|` is
  pro-constructible and generalizing in itself), and `Y = ∅` is represented by the empty subset (a
  one-object filtered presentation).
- `s3_7_point_of_totally_disconnected` (computation) — for `X` totally disconnected and `x ∈ X` a
  rank-one point, the sub-v-sheaf `Y = im(Spa(K(x)^, K(x)^⁺) → X)` is represented by the
  pro-constructible generalizing subset `{x}`, affinoid perfectoid by D1.5, so a quasicompact
  injection with image a point is quasi-pro-étale.
- `s3_7_quasicompactness_needed` (non-example of the corollary's hypothesis) — for
  `X = S̲ × Spa(C, O_C)` with `S` an infinite profinite set (totally disconnected, D1.1) and
  `Y' ⊂ X` the sub-v-sheaf `∐_{s ∈ S} {s} × Spa(C, O_C)` (the union of the closed points, each a
  pro-constructible generalizing subset), `Y' → X` is an injection, ind-representable as the
  proposition says, and represented by the disjoint union of these perfectoid points, which is not
  quasicompact. Consequently `Y' → X` is not quasicompact and Cor. 10.6 does not apply; the
  quasicompactness hypothesis is what passes from the filtered colimit to a single term.

The Checks of D3.7 require the perfectoid subspace attached to a pro-constructible generalizing
subset and its functor to the slice of v-sheaves. The filtered diagram and its colimit comparison
must use those inclusions.

`Geometry.subSheaf_indRepresentable` produces a filtered diagram in the perfectoid slice
and a colimit cocone in `Geometry.VSheaf p`, identified with the given sub-v-sheaf over its
totally disconnected base. Each stage is an affinoid pro-étale embedded subspace with
pro-constructible generalizing image ([ECD] Proposition 10.5, pp. 50–51).
`Geometry.quasicompactInjection_quasiProEtale` asserts the quasi-pro-étale conclusion for
quasicompact injections of `Geometry.VStack p`.
`Geometry.quasicompactInjection_representable` identifies a quasicompact sub-v-sheaf over a
totally disconnected base with one affinoid subspace, and
`Geometry.quasicompactInjection_stackRepresentable` gives the same identification for every
totally disconnected test of a stack injection, by a fibrewise equivalence over the test base
([ECD] Corollary 10.6, p. 51).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.8 Immersions, separated maps and 0-truncated maps

**Open and closed immersions, separated maps and 0-truncated maps of v-stacks.**
(*immersions-separatedness-and-truncatedness*) Let `f : Y' → Y` be a map of `Geometry.VStack p`,
with `p` prime as in D3.6. It is an open immersion if for every perfectoid space `X` over `Y` the
pullback `Y' ×_Y X → X` is representable by an open immersion; a closed immersion if for every
totally disconnected perfectoid space `X` over `Y` the pullback is representable by a closed
immersion; separated if its diagonal `Y' → Y' ×_Y Y'` is a closed immersion; 0-truncated if for
every perfectoid `X` the functor of groupoids `Y'(X) → Y(X)` is faithful. A v-stack `Y` is separated
if `Y → *` is separated, for `*` the final object. Closed immersions are tested only on totally
disconnected bases, because it is there that sub-v-sheaves are ind-representable (D3.7).
0-truncatedness is equivalent to asking that `Y' ×_Y X` is a sheaf for all `X`, and to asking that
the diagonal of `f` is an injection; separated maps are 0-truncated. The absolute notion needs care
and differs from quasiseparatedness of the object: `Y` separated does not imply `Y` quasiseparated,
and [ECD] Rem. 10.8 asserts the existence of some characteristic-`p` perfectoid `X` for which
`X/φ^ℤ` is separated but not quasiseparated — not for every `X`, since the empty `X` already rules
that out ([ECD] §10, Def. 10.7 and Rem. 10.8, p. 51). This separatedness, by a closed-immersion
diagonal, is not the separatedness of algebraic stacks in SchemeAndStackFoundations §1.20, which
asks for a proper diagonal, and the two are not identified. For sheaves use `openImm.presheaf`
directly. For stacks define `Geometry.IsOpenImmersion` by representable open-immersion pullbacks.
`Perfd.Stack.IsClosedImmersion` and `Perfd.Stack.IsSeparated` are relative predicates on maps of
`Sheaf J (Type u)`: the first tests representable closed-immersion pullbacks over totally
disconnected objects, and the second applies it to the sheaf diagonal. On geometric v-sheaves these
are definitionally `Geometry.sheafClosed` and `Geometry.separated`, using
`Geometry.closedImm p true` and the open-cover topology of D1.1. For `f : F ⟶ G` between v-stacks,
the closed and separated predicates are `Geometry.StackProperty p (Geometry.sheafClosed p) f` and
`Geometry.StackProperty p (Geometry.separated p) f`. `Perfd.Stack.IsZeroTruncated` and
`Perfd.Stack.IsInjection` are defined directly on transformations of `LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat` by
faithful and fully faithful fibre functors, respectively. Prove
`Perfd.Stack.isZeroTruncated_iff_diagonal_injection` (faithfulness is equivalent to full
faithfulness of the specified stack diagonal; on groupoid-valued stacks this is also equivalent to
the fibres `Y' ×_Y X` being sheaves), `Perfd.Stack.isSeparated_iff_valuative` (a map of v-stacks is
separated if and only if it is 0-truncated, quasiseparated as a morphism, and satisfies uniqueness
for every diagram `Spa(K, O_K) → Y′` over `Spa(K, K⁺) → Y`, where `K` is a perfectoid field and `K⁺`
is an open bounded valuation subring; uniqueness is up to the unique compatible isomorphism, as in
[ECD] 10.9), `Geometry.isSeparated_uniqueness_general_pair` (the variant of the criterion for a
general perfectoid Tate pair, [ECD] 10.10), `Perfd.Stack.isSeparated_comp` (separated stack maps
compose), `Geometry.immersion_stack_comp` and `Geometry.immersion_stack_pullback` (composition of
open and closed immersions, and base change for all four classes; `Perfd.Stack.isZeroTruncated_comp`
supplies composition for 0-truncated maps). For open immersions of sheaves, tested on all
representables, base change and the agreement below are Mathlib's `relative_isStableUnderBaseChange`
and `relative_map_iff` for `MorphismProperty.presheaf`. Prove
`Perfd.Stack.isSeparated_of_perfectoid` (for a map of perfectoid spaces the notions agree with those
of PerfectoidSpaces layer P4) ([ECD] §10, Prop. 10.9 and Prop. 10.10, pp. 51–52). The valuative
criterion is the tool by which separatedness is checked in [ECD] §§11–15. *Needs:* Mathlib
`CategoryTheory.Sheaf`, `CategoryTheory.Functor.Faithful`; D3.7; D3.6; D1.1; PerfectoidSpaces layer
P4 (the valuative criterion for separatedness; maps of affinoid perfectoid spaces are separated).

**Checks.**

- `s3_8_open_immersion_of_perfectoid_spaces` — an open immersion of perfectoid spaces is an open
  immersion of v-sheaves, and conversely.
- `s3_8_separated_not_quasiseparated` (non-example) — there exists a characteristic-`p` perfectoid `X`
  for which `X/φ^ℤ` is separated and not quasiseparated, as in [ECD] Rem. 10.8; the test
  instantiates a suitable nonempty `X` and does not quantify universally over `X`, the empty `X`
  being the negative check against asserting non-quasiseparatedness for every `X`.
- `s3_8_classifying_stack_not_zero_truncated` (non-example, the degenerate stack case) — the classifying
  stack of a nontrivial locally profinite group is not 0-truncated.
- `s3_8_valuative_criterion` — for a quasiseparated map of perfectoid spaces, separatedness is
  equivalent to uniqueness in the field-valued diagrams above. The 0-truncated clause is
  automatic for representable sheaves; quasiseparatedness is retained, matching [ECD]
  Proposition 10.9 and PerfectoidSpaces layer P4.
- `s3_8_trivial_group_zero_truncated` (degenerate case) — `B1̲ = ∗` is 0-truncated and separated; a sheaf
  (0-truncated stack) `Y` has `Y → ∗` 0-truncated, and the diagonal of a map of sheaves is always an
  injection, so 0-truncatedness is automatic for maps of v-sheaves and is a condition on stacks
  only.
- `s3_8_affinoid_is_separated` (characterisation) — a map of affinoid perfectoid spaces is separated
  (PerfectoidSpaces layer P4), so for `Y' → Y` with `Y'` and `Y` affinoid the predicate holds; the
  open immersion `{|T| < 1} → Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩)` is separated as well (the diagonal
  of an open immersion is an isomorphism), while the non-separated map is the doubled disc
  `X ⊔_U X → X` for a nonclosed rational `U ⊊ X`, whose diagonal has non-closed image.
- `s3_8_valuative_witness` (computation) — for
  `f : Y' = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) → Y = Spa(C, O_C)`, a perfectoid field `K ⊇ C` and a
  point `Spa(K, O_K) → Y'`, given by compatible values `T^{1/p^n} ↦ t_n ∈ O_K`, with `t = t_0`, an
  extension to `Spa(K, K⁺)` is a map of pairs `(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) → (K, K⁺)` restricting
  to the given one, so the ring map is already determined and the extension exists iff `t ∈ K⁺`: at
  most one dotted arrow, which is the criterion, and `f` is separated. For the doubled disc
  `Y'' = Y' ⊔_U Y' → Y` with `U = {|T| ≤ |ϖ|}`, let `η` be the Gauss point of radius `|ϖ|` (a
  rank-one point of `U`), `K` its completed residue field, and `K⁺ ⊊ O_K` the valuation ring of its
  rank-two specialization `η⁺` at which `|T| = |ϖ|⁺ > |ϖ|`, so `η⁺ ∉ U`. The point
  `Spa(K, O_K) → Y''` given by `η` is unique (`U` is not doubled), but it has two extensions to
  `Spa(K, K⁺)`, the two copies of `η⁺`; so `Y'' → Y` fails the criterion and is not separated, as
  its diagonal has non-closed image.
- `s3_8_finite_classifying_stack_not_separated` (non-example, against SchemeAndStackFoundations
  §1.20) — for a finite nontrivial group `G`, the diagonal of `B G̲ → *` is finite étale, so proper,
  yet it is not a closed immersion, so `B G̲ → *` is not separated here.

The categorical definitions in `Perfd.Stack.IsZeroTruncated` and `IsInjection` use faithful and
fully faithful fibre functors, respectively. `pointDiagonal` sends an arrow `m` to `(m,m)`;
`diagonal` assembles these functors into the coherent map to the 2-fibre product from D0.26.
`isZeroTruncated_iff_diagonal_injection` concerns this specified map. The composition, first-factor
cancellation and 2-pullback theorems are stated for `IsZeroTruncated`.

- `zero_truncated_identity` — every identity map of stacks is 0-truncated, including an identity
  on a stack with nontrivial automorphisms.
- `zero_truncated_discrete_source` — a map from a discrete prestack is 0-truncated; this includes
  maps of sheaves and the empty sheaf.
- `zero_truncated_automorphism_obstruction` — if one nonidentity automorphism maps to the identity,
  the map is not 0-truncated. In `BG̲ → *`, any nonidentity element acting on the trivial torsor
  supplies this obstruction.
- `injection_identity` — the identity on any stack is an injection.
- `injection_discrete_iff` — on discrete fibres injection is precisely injectivity on objects;
  the two-element set mapping to a point is 0-truncated but is not an injection.
- `injection_missing_arrow` — two source objects with no arrow between them whose images admit
  an arrow obstruct an injection, even if faithfulness holds.
- `injection_collapses_two_points` — over a nonempty test category, the map from the constant
  two-element discrete prestack to the terminal prestack is 0-truncated and is not an injection.
- `diagonal_automorphism_obstruction` — a nonidentity automorphism killed by a map prevents its
  diagonal from being an injection.
- `diagonal_two_arrows` — a pair `(m,n)` with equal images lies in the image of the diagonal on
  arrows exactly when `m = n`. This computes both directions of the diagonal criterion.
- `diagonal_empty` — the self-fibre product of an empty category over any category is empty.
- `diagonal_group` — for the one-object groupoid of `G` mapping to a point, the diagonal is full
  exactly when `G` is trivial; `G = ℤ/2` is the two-arrow negative control.
- `diagonal_restriction` — the component of the stack diagonal has identity comparison at each object.
- `diagonal_identity_stack` — the diagonal of the identity on any stack is an injection.
- `diagonal_discrete_stack` — the diagonal of a map with discrete source fibres is an injection,
  even when the map on objects is not injective.

The geometric immersion and valuative Checks require the perfectoid Yoneda functor, closed
immersions on actual perfectoid spaces, and the maps of Huber pairs `(K,K⁺) → (K,O_K)` and
`(R,R⁺) → (R,R°)` with their induced maps of adic spaces. The categorical diagonal does not
supply these geometric maps or their valuative comparison.

**`Perfd.Stack.IsZeroTruncated`.** Faithfulness allows a map to identify objects, but cannot kill a nontrivial automorphism.

**Checks.**

- `definition_IsZeroTruncated_1` — The map from two discrete points to one point is 0-truncated.
- `definition_IsZeroTruncated_2` — The identity of every prestack is 0-truncated.
- `definition_IsZeroTruncated_3` — Killing a nonidentity automorphism prevents 0-truncatedness.

**`Perfd.Stack.IsInjection`.** Full faithfulness on discrete fibres is injectivity on their objects.

**Checks.**

- `definition_IsInjection_1` — For discrete-valued prestacks the predicate is exactly objectwise
  injectivity.
- `definition_IsInjection_2` — The identity of every prestack is an injection.
- `definition_IsInjection_3` — Collapsing two discrete points to one is not an injection although it
  is faithful.

**`Perfd.Stack.pointDiagonal`.** This functor lands in Mathlib’s `CategoricalPullback f f`, uses the identity comparison and repeats the same arrow.

**Checks.**

- `definition_pointDiagonal_1` — For the discrete Boolean category mapping to a point, the diagonal images of `true` and `false` are distinct and have no arrow between them.
- `definition_pointDiagonal_2` — For the one-object groupoid `ℤ/3ℤ` mapping to a point, the diagonal sends the arrow `1` to the pair `(1,1)`.
- `definition_pointDiagonal_3` — The self-pullback over a point has the arrow `(1,2)`, which cannot be the image of any arrow under that diagonal.

**`Perfd.Stack.diagonal`.** The diagonal repeats its source section in both factors.
Its restriction constraint is built by `CategoricalPullback.mkIso` from two
`Iso.refl` components. The comparison isomorphism of a restricted diagonal object
reduces to the identity by cancellation of `f.naturality` with its inverse;
that equality is propositional, so the whole constraint is a pointwise identity
pair rather than a definitionally reflexive isomorphism of functors.

**Checks.**

- `diagonal_naturality_hom` — Both coordinates of the forward naturality component are identity arrows, by `rfl`.
- `diagonal_naturality_inv` — Both coordinates of the inverse component are identity arrows, by `rfl`.

- `Perfd_Stack_diagonal_restricted_bool_pair` — Restricting the diagonal of `true` along the proper arrow of `booleanRestriction` gives `(false,false)`.
- `Perfd_Stack_diagonal_restricted_pair_no_map` — That restricted diagonal object has no arrow to the diagonal of `true` in the target fibre.
- `Perfd_Stack_diagonal_restriction_changes_value` — The restricted diagonal equals the diagonal of `false` and differs from the diagonal of `true`.

**`Perfd.Stack.IsClosedImmersion`.** Use the represented sets and morphism classes specified in
D3.6. The closed immersion condition detects injectivity, so Boolean negation passes and the fold
fails.

**Checks.**

- `Perfd_Stack_IsClosedImmersion_bool_negation` — The represented Boolean permutation passes with monomorphisms as the immersion classes.
- `Perfd_Stack_IsClosedImmersion_empty_identity` — The identity of the represented empty set passes; its section over the empty set is unique.
- `Perfd_Stack_IsClosedImmersion_bool_projection_failure` — The two-point fold fails: its fibre over the point has two elements, so the represented map is not a monomorphism.

**`Perfd.Stack.IsSeparated`.** Use the set-site choices of D3.6. The fold has an injective diagonal;
restricting closed immersions to isomorphisms detects that this diagonal is not surjective.

**Checks.**

- `Perfd_Stack_IsSeparated_point_inclusion` — The one-point inclusion into two points passes, including the empty fibre over the other point.
- `Perfd_Stack_IsSeparated_empty_identity` — The identity of the represented empty set passes; its section over the empty set is unique.
- `Perfd_Stack_IsSeparated_bool_projection` — The two-point fold passes; its diagonal is injective and all its set-theoretic pullbacks are representable.
- `Perfd_Stack_IsSeparated_fold_restricted_class_fails` — The fold fails if closed immersions are restricted to isomorphisms: its diagonal misses the unequal pairs.

**`Perfd.Stack.IsLocallySeparated`.** Use the set-site choices of D3.6. The singleton identity cover
witnesses local separatedness of the fold. Restricting both immersion classes to isomorphisms makes
the condition fail.

**Checks.**

- `Perfd_Stack_IsLocallySeparated_point_inclusion` — The one-point inclusion into two points passes, including the empty fibre over the other point.
- `Perfd_Stack_IsLocallySeparated_empty_identity` — The identity of the represented empty set passes; its section over the empty set is unique.
- `Perfd_Stack_IsLocallySeparated_bool_projection` — The two-point fold passes; its diagonal is injective and all its set-theoretic pullbacks are representable.
- `Perfd_Stack_IsLocallySeparated_fold_isomorphism_class_failure` — With both immersion classes restricted to isomorphisms, an open cover cannot make the fold separated.

`Geometry.IsOpenImmersion` tests stack morphisms on representable perfectoid bases.
`Geometry.immersion_stack_comp` states composition for open and closed immersions;
`Geometry.immersion_stack_pullback` states 2-base-change stability for open immersions,
closed immersions, separated maps and 0-truncated maps ([ECD] Definition 10.7 and
Remark 10.8, p. 51). `Geometry.isSeparated_uniqueness_general_pair` assumes a separated
stack map and a map of perfectoid pairs that is a topological ring isomorphism on Tate rings,
with maximal plus ring on the target pair. Two lifts with compatible isomorphisms after
restriction and in the target stack have a unique compatible arrow. This is uniqueness up
to unique isomorphism for `(R,R⁺) → (R,R°)` ([ECD] Proposition 10.10, p. 52).

**Checks.**

- `IsOpenImmersion_identity` — the identity of any stack is an open immersion.
- `IsOpenImmersion_empty` — the empty sheaf is open in every sheaf.
- `IsOpenImmersion_noninjective` — failure of full faithfulness on one fibre rules out an open immersion.

**Checks.**

- `Perfd.Stack.isSeparated_id` — The identity of a sheaf is separated when every identity in the test category is a closed immersion.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.9 v-local nature of the morphism classes

**The classes of morphisms may be checked v-locally on the target.**
(*v-local-nature-of-morphism-classes*) Let `f : Y' → Y` be a map of v-stacks, `g : Ỹ → Y` a
surjective map of v-stacks and `f̃ : Y' ×_Y Ỹ → Ỹ` the pullback of `f`. If `f̃` is quasicompact,
respectively quasiseparated, then so is `f`; if `f̃` is an open, respectively closed, immersion then
so is `f`; if `f̃` is separated then so is `f`; if `f̃` is finite étale then so is `f`; if `f̃` is
separated and étale then `f` is separated and étale; if `f̃` is separated and quasi-pro-étale then
`f` is separated and quasi-pro-étale. The last two statements carry separatedness because the
descent theorems D3.4 and D3.5 that prove them are for separated objects; the corresponding
statements without separatedness are not claimed, and no counterexample is asserted, exactly as for
D3.4. Every "if" here is one-directional as stated; the converses ("if `f` is finite étale then so
is `f̃`", and likewise for the other classes) hold by stability under base change (D3.6 and D3.8)
and are not the content. For the quasi-pro-étale statement one reduces to a strictly totally
disconnected test space `X`, for the étale statement to an arbitrary perfectoid `X` ([ECD] §10,
Prop. 10.11 with proof, pp. 52–53). The representable case — `f` a map of perfectoid spaces, with
étaleness, finite étaleness and, over a strictly totally disconnected base, pro-étaleness descending
along a v-cover ([ECD] Cor. 9.11) — is stated in D3.5 and is the input of the proof here, not
restated. This is the statement that makes the definitions of D3.6 and D3.8 checkable in practice;
it is used in D3.10 and in [ECD] Prop. 11.3, Prop. 11.8 and Prop. 11.15. *Needs:* D3.5; D3.4; D3.7;
D3.8; AdicSpacesPartII R0.19.4; D2.2.

**Checks.**

- `s3_9_identity_cover` (degenerate case) — for `g = id`, `f̃ = f` and every clause is a tautology.
- `s3_9_open_immersion_descends` (computation) — for `X` affinoid, `X̃ → X` a v-cover and `Y' ⊂ X` a
  subsheaf whose pullback to `X̃` is an open `Ũ ⊂ X̃`, the set `Ũ` is the preimage of its image
  `U ⊂ |X|`, which is open because `|X̃| → |X|` is a quotient map (AdicSpacesPartII R0.19.4), and `Y' = U`.
- `s3_9_separatedness_in_iv_v` (scope) — for `f̃` étale but not separated (a doubled affinoid over
  `X̃` with descent datum) the statement makes no claim; the descended v-sheaf exists (D4) and is
  étale over `X` in the sense of D3.6 only if it is representable, which is not asserted.

The geometric Checks of D3.9 require the v-stack 2-fibre product and the actual open, closed,
separated, finite étale and quasi-pro-étale predicates; the quotient-map calculation alone does not
construct the descended open immersion.

`Geometry.morphismClasses_vLocal` states all eight implications on `Geometry.VStack p`
using the actual stack 2-pullback and local essential surjectivity of the covering map:
quasicompact, quasiseparated, open, closed, separated, finite étale, separated étale and
separated quasi-pro-étale descend. The last two clauses retain separatedness
([ECD] Proposition 10.11, pp. 52–53).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D3.10 Locally profinite torsors

The last target is the first use of the morphism classes: torsors under a locally profinite group,
with the v-sheaf attached to a topological space as the bridge from topology to v-sheaves.

**Torsors under a locally profinite group and their pro-étale presentation.**
(*locally-profinite-torsors*) For a topological space `T` let `T̲` be the v-sheaf sending a
perfectoid space `X` to the set of continuous maps `|X| → T` ([ECD] §10, before Def. 10.12, p. 53).
Let `G` be a locally profinite group. A `G̲`-torsor is a map `f : X̃ → X` of v-stacks with an action
of `G̲` on `X̃` over `X` such that v-locally on `X` there is a `G̲`-equivariant isomorphism
`X̃ ≅ G̲ × X` ([ECD] §10, Def. 10.12, p. 53). The torsor notion and its classes are not constructed
here: over a v-sheaf `Y`, a `G̲`-torsor is a torsor under the sheaf of groups `G̲` on the site
`(Perf/Y, v)` in the sense of SchemeAndStackFoundations §2.3, so its isomorphism classes form §2.3's
`NonabelianH1` of that site, and §1.15's fppf torsors over schemes are the other specialisation of
the same notion. For the following geometric conclusions take `G : Type` and `X : Geometry.Perf p`,
the charted carrier of D1.11. Then `X̃` is representable by a space in `Geometry.Perf p` — a
theorem, not part of the definition — and `X̃ → X` is pro-étale, universally open and a v-cover; for
every open subgroup `K ⊂ G` the pushout `X̃_K` of `X̃` along the discrete `G`-set `G/K` is separated
étale over `X`; for `K' ⊂ K` of finite index the transition map `X̃_{K'} → X̃_K` is finite étale;
and `X̃` is the inverse limit of the `X̃_K` over the open subgroups `K` ([ECD] §10, Lem. 10.13 with
proof, pp. 53–54). The functor `T ↦ T̲` is used again for the compact Hausdorff diamonds of layer D4
and for the Berkovich quotient of layer D5. For `G : ProfiniteGrp.{0}` and `X = Spa(C, O_C)` with
`C : Type` algebraically closed, a `G̲`-torsor is `X × S̲` for `S : Profinite.{0}` with a free
transitive `G`-action, which is the shape appearing in the proofs of [ECD] Prop. 11.26 and Prop.
13.12; the classifying stack of `GL_n(ℚ_p)` from the introduction of [ECD] is `[*/G̲]`, whose atlas
`* → BG̲` is a `G̲`-torsor. The presheaf `T̲ : X ↦ C(|X|, T)` is Mathlib's
`ContinuousMap.yonedaPresheaf` for the underlying-space functor `Perfd → TopCat`, functorial in `T`
by whiskering with `ContinuousMap.comp`; neither is restated. Prove `underlineSheaf.isVSheaf` for a
small category `C` with pullbacks, a functor `sp : C ⥤ TopCat`, any Grothendieck topology `J`, and
any topological space `T`. Its hypotheses are that every `J`-covering sieve induces a quotient map
from the coproduct of the underlying spaces of all its arrows, and that
`|U ×_X V| → |U| ×_{|X|} |V|` is surjective for every pair of arrows to `X`. The conclusion is the
sheaf condition for `ContinuousMap.yonedaPresheaf sp T`. Specializing this single theorem to
`J = Perfd.vTopology sp` gives `T̲`; in `Suggested.lean` this instance is `isSheaf_yonedaPresheaf`:
for every topological space `T`, `ContinuousMap.yonedaPresheaf (perfdToTop p) T` is a sheaf for
`vTopology p`. A quotient-map hypothesis for every covering family implies the sieve hypothesis by
indexing the family by the arrows of the sieve. Mathlib's `equalizerCondition_yonedaPresheaf` treats
singleton descent under the stronger assumption that the underlying-space functor preserves the
relevant pullbacks; the theorem here uses only surjectivity on pairs of points and covers with
arbitrary index sets. For `S : Profinite.{0}` and a perfectoid pair with `R : Type`, the v-sheaf
`S̲ × Spa(R, R⁺)` is the charted affinoid perfectoid space `Spa(C⁰(S, R), C⁰(S, R⁺))` of
PerfectoidSpaces layer P6 (`prodProfinite`, [ECD] Ex. 11.12); only the identification as v-sheaves
is used here. Define `IsTorsor` as the predicate that `f` is a `G̲`-torsor, by v-local triviality
(the torsor notion of SchemeAndStackFoundations §2.3 on the v-site). With `G : Type` and
`X : Geometry.Perf p`, prove `Torsor.representable` (a `G̲`-torsor over `X` is representable in
`Geometry.Perf p`) and `Torsor.isProEtale` (it is pro-étale, universally open and a v-cover); define
`Torsor.levelSpace` as the pushout `X̃_K` along `G/K` for `K` an open subgroup, separated étale over
`X`; prove `Torsor.levelSpace_finiteEtale` (for `K' ⊂ K` of finite index the transition map is
finite étale) and `Torsor.asLimit` (`X̃` is the inverse limit of the `X̃_K` over the open subgroups
`K`). These geometric level-space and limit assertions carry the same `G : Type` and charted-base
hypotheses. For a compact open subgroup `H ⊂ G`, the open normal subgroups of `H` and their finite
quotients give a `Small.{0}` inverse system of finite étale levels over `X̃_H`. Its affinoid limits
have `Small.{0}` coefficient rings; gluing them constructs the charted representing space. The
ordered open subgroups of `G` also have `Small.{0}` total arrow type. *Needs:* Mathlib
`ContinuousMap`, `ContinuousMap.yonedaPresheaf`, `equalizerCondition_yonedaPresheaf`,
`ProfiniteGrp`, `TotallyDisconnectedSpace`; D3.9; D3.6; D2.2; AdicSpacesPartII R0.19.4; D1.11;
PerfectoidSpaces P5.3 (affinoid limits formed with `Small.{0}` diagrams); SchemeAndStackFoundations
§§1.15 and 2.3; PerfectoidSpaces layer P6 (`prodProfinite`).

**Checks.**

- `s3_10_split_torsor` (degenerate case) — for `G : Type` locally profinite and
  `X : Geometry.Perf p`, `G̲ × X` is a charted `G̲`-torsor over `X`, and its level spaces are
  disjoint unions of copies of `X`.
- `s3_10_finite_group` — for `G : Type` finite, a `G̲`-torsor is a finite étale Galois cover with
  group `G`; a definition that does not recover this is wrong.
- `s3_10_profinite_over_geometric_point` — for `X = Spa(C, O_C)` with `C : Type` algebraically
  closed and `G : ProfiniteGrp.{0}`, a torsor is `X × S̲` for `S : Profinite.{0}` with a free
  transitive `G`-action.
- `s3_10_not_etale` (non-example) — for `G : ProfiniteGrp.{0}` infinite and
  `X : Geometry.Perf p` nonempty, the torsor `X̃ → X` is
  pro-étale and not étale, separating the two classes: already the split torsor `G̲ × X → X` is not
  étale, since its fibre over a point `Spa(C, O_C) → X` is `G̲ × Spa(C, O_C)`, a profinite set of
  points, while an étale map has discrete fibres over a geometric point. For `X = ∅` every map to
  `X` is étale and the non-example needs `X ≠ ∅`.
- `s3_10_trivial_group` (degenerate case) — for `G = 1`, `G̲ = ∗`, a `G̲`-torsor is a map `X̃ → X`
  that is v-locally an isomorphism, hence an isomorphism (`Hom(−, X)` is a v-sheaf, D2.7); the only
  open subgroup is `K = 1`, `X̃_K = X̃ = X`, and the inverse limit is `X`.
- `s3_10_v_sheaf_inputs` (characterisation) — the two topological inputs of
  `underlineSheaf.isVSheaf` hold for perfectoid spaces: a v-cover is surjective and `|∐U_i| → |X|`
  is a quotient map by the finite quasicompact image condition and AdicSpacesPartII R0.19.4, and points of `|U ×_X V|`
  surject onto `|U| ×_{|X|} |V|` (PerfectoidSpaces layer P4, *fibre-product-points-surjective*).
  Without the first input the sheaf condition fails for a non-quotient surjection (continuous maps
  out of the coarser topology are fewer).
- `s3_10_large_group_not_representable` (non-example) — Put `I = ℕ × Type`,
  `G = I → ZMod 2` with the compact product topology, and `P = Spa(C, O_C)` for an algebraically
  closed characteristic-p perfectoid field `C : Type`. The split torsor `G̲ × h_P → h_P`
  is not representable over `P` in `Geometry.Perf p`. If a representing space had an affinoid
  open `V` containing the zero section, the set `B ⊆ G` of `P`-sections factoring through `V`
  would be `Small.{0}`, by the small pair-map description of `Hom_P(P, V)`. Each block subgroup
  supported on `{n} × Type` is not `Small.{0}`. Choose `g_n` in that block outside `B`.
  Coordinatewise `g_n → 0`, giving a continuous `h : OnePoint ℕ → G`. The charted test object
  `P × underline(OnePoint ℕ)` would map to the representing space with inverse image of `V`
  exactly `{∞}`, which is not open. This excludes every charted representing space, although
  the ambient profinite product exists in `Perfd.{1} p`. The boundary statement
  `s3_10_large_group_escape` is the continuous escape from any small `B` containing zero.

The torsor Checks require the sheaf of continuous maps, a group action over the base with local equivariant trivializations, the associated `G/K`-spaces and their adic realization. A torsor of sets alone does not express the claimed pro-étale or étale morphism.

**Geometric sheaf and stack morphisms.** `Geometry.closedImm` is a monomorphism with
closed embedded image in the valuation topology ([ECD] Definition 5.6).
`Geometry.sheafClosed` tests this after all totally disconnected perfectoid base changes;
`Geometry.separated` applies it to the diagonal, and `Geometry.locallySeparated` requires
an effective open cover of the source by separated maps. `Geometry.quasiProEtale` tests
pro-étale representability after strictly totally disconnected base changes, with local
separatedness included; `Geometry.sheafEtale` tests the geometric étale class on all
representables ([ECD] Definition 10.1, Convention 10.2 and Definition 10.7).

For every morphism of `Geometry.VSheaf p`, `Geometry.sheafClosed_iff`, `Geometry.separated_iff`,
`Geometry.locallySeparated_iff`, `Geometry.quasiProEtale_iff` and `Geometry.sheafEtale_iff` are
definitional identifications with `Perfd.Stack.IsClosedImmersion`, `IsSeparated`,
`IsLocallySeparated`, `IsQuasiProEtale` and `IsEtale`, respectively, specialized to
`Geometry.space`, `Geometry.vTopology` and the geometric open, closed, étale and pro-étale classes.
The open and étale test topologies are those specified in Layer D1; closed tests use total
disconnectedness, quasi-pro-étale tests use strict total disconnectedness, and étale tests use every
representable ([ECD] Definition 10.1 and Convention 10.2, pp. 49–50; Definition 10.7, p. 51).
`Geometry.openImm_presheaf_iff` supplies the open-cover comparison: for any map of these v-sheaves,
the open-subobject condition on realization is equivalent to `(Geometry.openImm p true).presheaf`
([ECD] Proposition 12.9, p. 71). For every `f : F ⟶ G` of `Geometry.VSheaf p`,
`Geometry.locallySeparated_iff_openCover` therefore characterizes local separatedness by a Type 2
indexed effective open cover of `F` whose composites with `f` are separated, with openness expressed
by `Perf.VSheaf.IsOpenImmersion` ([ECD] Convention 10.2, p. 50; Proposition 12.9, p. 71). For every
map of characteristic-p perfectoid spaces, `Geometry.closedImm_iff` identifies geometric closed
immersions with the abstract closed-immersion predicate on its Yoneda map ([ECD] Definition 5.6, p.
24; Remark 10.8, p. 51). The geometric definitions use this one family of splitting and morphism
predicates throughout Layers D1–D6. The field, empty-space and non-example Checks below therefore
test the relative predicates on the perfectoid site as well.

`Geometry.VStack` consists of groupoid-valued pseudofunctors satisfying v-descent on
`Geometry.Perf p`. `Geometry.StackProperty` compares each perfectoid base change with a discrete
v-sheaf by an objectwise equivalence of the full two-fibre product, over the test object.
`Geometry.stackPullback` retains the comparison isomorphism. `Geometry.maximalField` replaces `K⁺`
with `K°` in the same complete field, and `Geometry.maximalMap` is induced by its identity ring map.
`Geometry.valuativeRestriction` uses this map and the pseudonaturality isomorphism to land in the
two-fibre product. The stack criterion `Perfd.Stack.isSeparated_iff_valuative` includes
quasiseparatedness, 0-truncatedness and full faithfulness of this functor; its `_sheaf` version is
the injectivity criterion ([ECD] Proposition 10.9). The composition, cancellation and base-change
targets in D3.6 use these fixed geometric classes ([ECD] Proposition 10.4).

**Geometric carrier Checks.** The following contracts specialize the definitions to
`Geometry.Perf`, `Geometry.Perfd` and the supplied Yoneda-adic spaces.

**`Geometry.closedImm` — Checks.**

- `closed_immersion_identity` — The identity is a closed immersion.
- `closed_immersion_clopen` — An open immersion with closed image is also closed.
- `closed_immersion_two_points` — Identifying two distinct points rules out a closed immersion.

**`Geometry.sheafClosed` — Checks.**

- `sheaf_closed_identity` — The identity v-sheaf map is closed.
- `sheaf_closed_representable` — A geometric closed immersion induces a closed immersion of v-sheaves.
- `sheaf_closed_section_obstruction` — A closed immersion cannot identify distinct sections on a test perfectoid.

**`Geometry.separated` — Checks.**

- `separated_monomorphism` — Every monomorphism of v-sheaves is separated.
- `separated_affine_map` — Every morphism of perfectoid affinoids is separated.
- `separated_quasiseparated_obstruction` — Failure of quasiseparatedness excludes separatedness.

**`Geometry.locallySeparated` — Checks.**

- `locally_separated_identity` — The identity admits its one-member separated open cover.
- `locally_separated_perfectoid_map` — Every map of perfectoid spaces is locally separated.
- `locally_separated_open_restriction` — Restricting a locally separated map to an open subsheaf preserves the property.

**`Geometry.quasiProEtale` — Checks.**

- `quasi_proet_identity` — The identity v-sheaf map is quasi-pro-étale.
- `quasi_proet_open_perfectoid` — A perfectoid open immersion induces a quasi-pro-étale map.
- `quasi_proet_field_extension_obstruction` — A proper field extension of an algebraically closed perfectoid field cannot be quasi-pro-étale.

**`Geometry.sheafEtale` — Checks.**

- `sheaf_etale_identity` — The identity v-sheaf map is étale.
- `sheaf_etale_open_perfectoid` — An open immersion of perfectoid spaces gives an étale v-sheaf map.
- `sheaf_etale_nonopen_image` — The geometric nonopen-image obstruction survives Yoneda.

**`Geometry.maximalField` — Checks.**

- `maximal_field_single_point` — Replacing the plus ring by the power-bounded ring leaves exactly one valuation point.
- `maximal_field_idempotent` — A second maximal-plus replacement changes no Huber pair.
- `maximal_field_removes_refinement` — A non-power-bounded-complete choice of plus ring changes under maximal replacement.

**`Geometry.maximalMap` — Checks.**

- `maximal_map_monomorphism` — The maximal-plus inclusion is a geometric monomorphism.
- `maximal_map_trivial_refinement` — If the original plus ring is already maximal, the map is an isomorphism.
- `maximal_map_not_surjective` — If the original field spectrum has distinct points, the maximal-plus map is not surjective.

**`Geometry.VStack` — Checks.**

- `vstack_discrete_sheaf` — A v-sheaf gives its discrete groupoid-valued v-stack.
- `vstack_empty_fibre` — The initial v-sheaf has empty fibres on nonempty test perfectoids, also as a stack.
- `vstack_noninvertible_category_obstruction` — The category with one noninvertible arrow cannot be a fibre of a v-stack.

**`Geometry.StackProperty` — Checks.**

- `stack_property_identity` — The identity stack map is geometrically étale.
- `stack_property_equivalence_detection` — Representable testing of isomorphisms detects objectwise equivalences of stacks.
- `stack_property_inertia_obstruction` — A map with nontrivial relative inertia cannot be represented by a sheaf after all perfectoid tests.

**`Geometry.stackPullback` — Checks.**

- `stack_pullback_comparison_objects` — The pullback over two identities retains both objects of a chosen isomorphism.
- `stack_pullback_identity_fibre` — The pullback over two identities is equivalent to the original fibre.
- `stack_pullback_remembers_automorphism` — A nonidentity comparison automorphism is retained in the two-fibre product.

**`Geometry.valuativeRestriction` — Checks.**

- `valuative_restriction_identity` — For the identity stack map, valuative restriction is an equivalence.
- `valuative_restriction_maximal_plus` — When the plus ring is already maximal, the valuative test is an equivalence for every map.
- `valuative_restriction_two_arrows` — Two distinct arrows with equal restrictions and equal images in the target obstruct faithfulness.

`Geometry.IsTorsor` says that a map of v-stacks admits a coherent torsor structure:
it is a 2-pullback of the universal map `* → BG`, where `BG` is the stackification of the
continuous group sheaf. Thus the classification includes v-local triviality and the action.
For maps of v-sheaves, `Geometry.Torsor` records a natural action of the continuous group
sections, invariance over the base, local sections, and simple transitivity on each nonempty
fibre. `Geometry.isTorsor_sheaf_iff` identifies existence of such an action with
`Geometry.IsTorsor` ([ECD] Definition 10.12, p. 53).

For a Hausdorff locally compact totally disconnected group `G : Type` and a base
`X : Geometry.Perf p`, `Geometry.Torsor.representable`
identifies a torsor over `X` with a space in `Geometry.Perf p`, by an equivalence over
the base; `Geometry.Torsor.isProEtale` states that its representing morphism is pro-étale,
universally open and a v-cover. `Geometry.Torsor.levelSpace` is the diagram over the ordered
open subgroups: its value is the sheaf coequalizer of the subgroup action and projection,
over the original base. For a left action on the torsor, the contracted-product convention
uses the corresponding right action `x · g = g⁻¹ • x`; its associated `G/K` bundle is the
quotient by the left `K` action. `Geometry.Torsor.levelSpace_quotient` characterizes the
natural quotient maps by their invariant-map universal property.
`Geometry.Torsor.levelSpace_representable` identifies each level over a perfectoid base
with a separated étale perfectoid space; `Geometry.Torsor.levelSpace_finiteEtale` handles
finite-index inclusions of open subgroups. The representing levels and transition maps carry
the same `G : Type` and charted-base hypotheses. `Geometry.Torsor.asLimit` supplies the limit cone
over the base, whose legs are invariant epimorphisms from the torsor
([ECD] Lemma 10.13, pp. 53–54).
The abstract `Geometry.IsTorsor`, `Geometry.Torsor`, subgroup coequalizers and stackification
allow larger-universe groups; the `G : Type` bound belongs to their geometric representability,
morphism-class and limit applications.

**Checks.**

- `IsTorsor_trivial_group` — a torsor for the trivial group is a fibrewise equivalence of stacks.
- `IsTorsor_split` — the projection `G̲ × B → B` admits its translation torsor structure.
- `IsTorsor_not_surjective` — a map without local lifts cannot admit a torsor structure.
- `Torsor_trivial_group` — a sheaf map admits a trivial-group torsor structure exactly when it is an isomorphism.
- `Torsor_empty` — the identity of the empty sheaf admits a torsor structure for every group.
- `Torsor_no_stabilizer` — a nonidentity continuous group section fixes no torsor section.
- `Torsor.levelSpace_top` — quotienting by the whole group recovers the base.
- `Torsor.levelSpace_discrete_bottom` — for a discrete group, the trivial-subgroup level recovers the torsor.
- `Torsor.levelSpace_empty` — every level of an empty torsor is empty.

**Checks.**

- `Perfd.underlineSheaf_punit_unique` — Continuous maps from any test space to a one-point space form a singleton.
- `Perfd.underlineSheaf_empty_isEmpty` — A nonempty test space has no continuous map to the empty space.
- `Perfd.underlineSheaf_empty_of_isEmpty` — Continuous maps from an empty test space to the empty space form a singleton.
- `Perfd.underlineSheaf_not_sheaf_without_quotient` — If a test arrow induces a continuous bijection that is not a quotient map, continuous maps into its source fail descent for that singleton family.

Lean: `isSheaf_yonedaPresheaf` (the v-sheaf property of `T̲` on PerfectoidSpaces' `Perfd p`). The
rest of this subsection, including the topological boundary statement `s3_10_large_group_escape`,
is specified in the README only.

### Examples

The worked examples of this layer are the checks above together with the acceptance cases of the
descent theorems: the gluing of a morphism `X₁ → X₂` along a v-cover `Y → X` from a morphism over
`Y` with agreeing pullbacks to `Y ×_X Y`, with no assertion of essential surjectivity for the
unrestricted prestack; the section of the rational subset of the
ordinary Tate ball in [ECD] Lemma 9.5, used after the finite-level reduction; the descended affinoid object over a totally
disconnected base reproducing both `R̃` and `R̃⁺`; the separated pro-étale descent
theorem with its strictly totally disconnected base hypothesis; the compactification `Y ⊂ Ȳ` of a quasicompact separated étale `Y → Spa(K, K⁺)`; the
pro-étale map of perfectoid spaces that is quasi-pro-étale, the open immersion as an étale map and
the finite disjoint union of isomorphisms as a finite étale map, the map failing local separatedness
that no predicate accepts, and the agreement with the absolute étale notions; the sub-v-sheaf of a
totally disconnected space as a filtered colimit of pro-constructible generalizing subsets, against
a base that is not totally disconnected; the open immersion of perfectoid spaces as an open
immersion of v-sheaves, the nonempty characteristic-`p` perfectoid `X` with `X/φ^ℤ` separated but
not quasiseparated against the empty `X`, the classifying stack of a nontrivial locally profinite
group that is not 0-truncated, and the valuative criterion for maps of perfectoid spaces; and the
split torsor `G̲ × X`, the finite étale Galois cover from a finite `G`, the torsor `X × S̲` over a
geometric point from a profinite `G`, and the pro-étale but not étale torsor from an infinite
profinite `G`.

In `Suggested.lean`, `isSheaf_yonedaPresheaf` states the v-sheaf property of `T̲`. The size
obstruction `s3_10_large_group_escape` of D3.10 and the geometric Checks, which need the perfectoid
morphism classes, are specified in the README only.

### Dependencies

Layer D0: pro-constructible subsets (AdicSpacesPartII R0.19.2), surjective generalizing spectral
maps as quotient maps (AdicSpacesPartII R0.19.4), quotients by pro-constructible equivalence
relations (D0.8, D0.9) and the v-site stackification of D0.25 (SchemeAndStackFoundations §1.18).
Layer D1: totally disconnected perfectoid spaces (D1.1), their connected components and affinoidness
(D1.3), strictly totally disconnected perfectoid spaces (D1.4), pro-constructible generalizing
subsets as affinoid perfectoid spaces (D1.5), automatic flatness (D1.6), the universally open
affinoid pro-étale strictly totally disconnected cover (D1.9) and the classification of pro-étale
perfectoid spaces over a strictly totally disconnected base (D1.11). Layer D2: the big pro-étale
site (D2.1), the small pro-étale site and the v-site (D2.2) and the subcanonicity of the v-site with
`O` and `O⁺` as v-sheaves (D2.7). PerfectoidSpaces layer P0 (almost modules over a perfectoid base,
almost faithfully flat descent), layer P1 (the tilting equivalence and the explicit tilt), layer P2
(rational localization of perfectoid affinoids), layer P3 (the almost purity theorem), layer P4 (the
valuative criterion for separatedness, separatedness of maps of affinoid perfectoid spaces), layer
P5 (finite-stage descent of qcqs étale objects) and layer P6 (pro-étale maps, pro-étale stability
and limits, `κ`-small perfectoid spaces, the product with a profinite set), in D3.6 specifically
P6.13. SchemeAndStackFoundations §§1.15 and 2.3 (D3.10). The flat-cover refinement over a strictly
henselian local ring is the lemma of D3.2 ([Stacks fppf domination] Tag 05WN); AdicSpacesPartIII
§R2.1 (*flat-tft-is-tfp*) and §R2.4 (*specialisation-map*). Mathlib
`CategoryTheory.Pseudofunctor.DescentData`, `CategoryTheory.Pseudofunctor.IsPrestack`,
`CategoryTheory.Pseudofunctor.toDescentData`, `CategoryTheory.Pseudofunctor.sheafHom`,
`CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.Sheaf`, `CategoryTheory.MorphismProperty`
with `CategoryTheory.MorphismProperty.presheaf`, `CategoryTheory.Functor.IsRepresentable`,
`ContinuousMap.yonedaPresheaf`, `CategoryTheory.Functor.Faithful`, `ValuationSubring`,
`LinearMap.charpoly`, `Module.Free`, `IsAlgClosed`, `Module.FaithfullyFlat`,
`Topology.IsConstructible`, `StableUnderGeneralization`, `ContinuousMap`, `ProfiniteGrp` and
`TotallyDisconnectedSpace`.

## Layer D4: diamonds and small v-stacks

The layer passes to characteristic `p` and constructs the quotient of a perfectoid space by a
pro-étale equivalence relation as an actual sheaf quotient. A chosen atlas is a presentation, not
additional structure on the resulting diamond: the quotient is shown independent of the atlas, the
atlas map is shown quasi-pro-étale, diamonds are characterised as the pro-étale sheaves with a
surjective quasi-pro-étale atlas, and the pro-étale quotient is shown to agree with the v-quotient.
The geometric declarations use this v-sheaf realization. The underlying topological space is then
constructed from a presentation, compared across presentations and shown to classify open subobjects
before it is used, in layer D5, to define spatiality; the compact Hausdorff diamonds
`T̲ × Spa(K, O_K)` show that this space need not be spectral. The layer closes with small v-sheaves
and small v-stacks, which retain their 2-categorical relations: their underlying spaces, open
substacks and fibre products, the comparison of sheaf-theoretic and topological surjectivity, the
isomorphism and injectivity criteria on geometric points, the quotient of a small v-sheaf by a
locally profinite group, and proper maps of v-stacks. Throughout, `Perf` is the full subcategory of
perfectoid spaces of characteristic `p` with its pro-étale and v-topologies, and for a topological
space `T` the sheaf `T̲` sends a perfectoid space `X` to the continuous maps `|X| → T`. Write `K₀`
for the completion of `⋃ₙ 𝔽_p((t^{1/pⁿ}))`, with its rank-one valuation; every occurrence of
`Spa(K₀, O_{K₀})` uses this complete field.

### D4.1 Diamonds and pro-étale equivalence relations

The first four targets define diamonds as sheaf quotients of perfectoid spaces by pro-étale
equivalence relations, prove that the quotient is independent of the atlas and that the atlas map is
quasi-pro-étale, characterise diamonds by surjective quasi-pro-étale atlases, and prove v-descent
for the pro-étale quotient, identifying it with the quotient in the v-convention.

**Diamonds and pro-étale equivalence relations.** (*diamond*) From here on, and in every later
layer, the base category is `Perf`, the full subcategory of perfectoid spaces of characteristic `p`;
general analytic adic spaces over `ℤ_p` enter only through layer D6. A pro-étale equivalence
relation on a perfectoid space `X` in `Perf` is a representable equivalence relation `R ⊂ X × X` —
representability of a presheaf being Mathlib's `Functor.IsRepresentable` — whose two projections
`s, t : R → X` are pro-étale. In the geometric v-convention, a diamond is a v-sheaf `Y` on `Perf`
that admits a v-sheaf-quotient presentation `Y ≅ X/R` with `X` a perfectoid space and `R ⊂ X × X` a
pro-étale equivalence relation. `R` is required to be representable and its projections pro-étale;
nothing is assumed about the diagonal of `Y`, and in particular its representability by a perfectoid
space is not imposed, because, as [ECD] states when making the definition, there is no good notion
of relatively representable morphism of perfectoid spaces. Define `Perf` as the full subcategory of
perfectoid spaces of characteristic `p` with its pro-étale and v-topologies,
`Perf.IsProEtaleEquivRel` as the predicate that a representable equivalence relation on a perfectoid
space has pro-étale projections, and `Perf.Diamond` as the predicate on a v-sheaf on `Perf` that it
admits a presentation as such a quotient; construct `J.yoneda.obj` (the representable sheaf of a
characteristic `p` perfectoid space `X`; it is a diamond with `R = X` the diagonal and `s = t = id`,
which uses only that identities are pro-étale) and `Perf.Diamond.presentation` (a chosen
presentation `Y = X/R` together with the maps `X → Y` and `R → X × X`); prove `Perf.Diamond.isSmall`
(every diamond is a small sheaf), `Perf.Diamond.relation_eq` (for a presentation, the map
`R → X ×_Y X` induced by `(s, t)` is an isomorphism; this needs only that `R ⇉ X` is an equivalence
relation on a representable, equivalence relations in a topos being effective, and not that `s`, `t`
are pro-étale) and `Perf.Diamond.quasiProEtale_atlas`: for every `F : Geometry.VSheaf p` and every
`P : Perf.Diamond.Presentation Jv proetGeom F`, the specified map `P.atlas Jv proetGeom` is an
epimorphism of v-sheaves and is `Geometry.quasiProEtale p`. Here `p` is prime,
`Jv = Geometry.vTopology p` and `proetGeom = Geometry.proet p true`; the presentation supplies the
diamond hypothesis ([ECD] Definitions 11.1–11.2, p. 54, and Proposition 11.3(ii), (iv), pp. 54–55).
In the suggested Lean form the definitions `Perf.IsProEtaleEquivRel`, `Perf.Diamond` and
`Perf.IsSmallVSheaf` are stated for a supplied category `C` and an underlying-space functor, a
supplied Grothendieck topology `J` and a supplied morphism property `proet`. The geometric instance
uses `Geometry.Perf p`, `Geometry.vTopology p` and `Geometry.proet p true`; `Perf.IsSmallVSheaf`
also uses this v-topology. The pro-étale quotient of [ECD] Definition 11.1 is recovered by the
comparison theorem in D4.4, which identifies the two sheafifications of
`coequalizer (yoneda.map s) (yoneda.map t)` and preserves their quotient maps. *Needs:* Mathlib
`CategoryTheory.Sheaf`, `CategoryTheory.GrothendieckTopology`,
`CategoryTheory.Functor.IsRepresentable`; D2.1; D2.3; D3.6; PerfectoidSpaces layer P1 (perfectoid
Tate rings and algebras); PerfectoidSpaces layer P2 (fibre products of perfectoid spaces).

**Checks.**

- `representable` (degenerate case) — a characteristic `p` perfectoid space `X` is a diamond, with
  `R` the diagonal `X → X × X`.
- `profinite_quotient` (characterisation) — for `S` profinite with a free action of a finite group
  `G`, the quotient of `S̲ × Spa(C, O_C)` by `G` is a diamond which is a perfectoid space.
- `compact_hausdorff` (non-example) — for `T : CompHaus.{0}`, `T̲ × Spa(K, O_K)` is a diamond
  whose underlying space is `T`, which is not spectral in general; this is a required test of the
  layer.
- `not_every_v_sheaf` (non-example) — not every v-sheaf is a diamond; the definition is not weakened
  to "a v-sheaf with a surjection from a perfectoid space", since that is the definition of a small
  v-sheaf (D4.7).
- `total_relation` (non-example) — for `X = Spa(K₀, O_{K₀})` the total relation `R = X × X` is
  representable and an equivalence relation, but its projection `X × X → X` is the perfectoid
  punctured open unit disc over `X` ([ECD] proof of Prop. 11.4), whose Gauss point has a
  transcendental completed residue field, so it is not pro-étale; the quotient `X/(X × X)` is the
  final sheaf `*`, which is not a diamond: for any nonempty perfectoid atlas of `*`, its
  self-product has relative transcendental points, whereas a pro-étale map over a
  perfectoid field is built from completed ind-finite étale extensions. Testing the displayed `X`
  alone only excludes that particular atlas. The pro-étale condition on `s`, `t` is not redundant.

The equivalence-relation clauses and the quotient carrier have the following separate Checks.
They apply on any subcanonical site, and therefore also after specialization to `Perf`.

- `relation_diagonal` — `s = t = id_X` satisfies the relation axioms when identities are pro-étale.
- `relation_missing_reflexivity` — if there is no map `X → R`, the identity of `X` cannot
  be related to itself; the proposed relation fails even if both projections are allowed.
- `relation_duplicate_arrows` — distinct arrows into `R` with the same endpoints violate
  joint monicity. A groupoid with stabilizers cannot be substituted for an equivalence relation.
- `total_relation_categorical` — for `R = X × X` all relation axioms except the two
  pro-étale conditions hold. This computes the categorical part of `total_relation`.
- `diamond_empty` — the representable of the initial perfectoid space is a diamond.
- `diamond_no_proet_id` — if the supplied morphism class is empty, even a representable
  sheaf fails the quotient definition. This detects omission of the pro-étale conditions.
- `presentation_atlas_epi` — the atlas of a quotient presentation is an epimorphism.
- `presentation_atlas_equalizes` — its two composites from the relation coincide.
- `presentation_atlas_detects_maps` — two maps out of the quotient agreeing on the atlas coincide.
  Together these test `Presentation`, its chosen constructor `presentation`, and its atlas map.
- `quasiProEtale_atlas_two_presentations` — for any two presentations of the same geometric
  v-sheaf, both specified atlas maps are epimorphisms and quasi-pro-étale.
- `quasiProEtale_atlas_exists` — choosing a presentation of a diamond recovers the existence
  of a representable quasi-pro-étale epimorphism.

The carrier is `Geometry.Perf p = Geometry.Spaces p true`, the Hom-universe lift of the objects of
`PerfectoidSpace.Perf.{1} p` covered by `Geometry.Affinoid p true` charts
(`Geometry.HasAffinoidCharts`, D1.11), with `R.toCAff` in AdicEtaleGeometry's `CAff`. Through
`Geometry.exists_wedhornComparison`, `YonedaAdicSpace.space_ofSpaY` identifies the chart spaces with
lifted valuation spectra. The perfectoid
ring condition comes from `PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing`; the site uses
`Geometry.proet p true` and D2.1–D2.2.

**`Diamond`.** The quotient requires both a representable atlas and the specified pro-étale relation.

**Checks.**

- `Diamond_point_site_singleton` — The singleton sheaf on the point test site is a diamond when every
  morphism is allowed.
- `Diamond_point_site_empty` — The empty sheaf on that site has no atlas and is not a diamond.
- `Diamond_point_site_no_proetale_maps` — Even the singleton sheaf fails when the pro-étale class is empty.

**`IsProEtaleEquivRel`.** The two legs must define a jointly monic equivalence relation, as well as being pro-étale.

**Checks.**

- `IsProEtaleEquivRel_nonreflexive` — The graph of Boolean negation is jointly monic and has a map from the base to the relation, but fails reflexivity.
- `IsProEtaleEquivRel_nonsymmetric` — The order relation on three points is reflexive and transitive but not symmetric.
- `IsProEtaleEquivRel_nontransitive` — The relation of distance at most one on three points is reflexive and symmetric but not transitive: 0 is related to 1 and 1 to 2, but 0 is not related to 2.

**`Perf.Diamond.Presentation.atlas`.** The atlas is the specified quotient map transported by the inverse of the presentation identification.

**Checks.**

- `Perf_Diamond_Presentation_atlas_quotient_comparison` — Transporting the atlas back to the sheafified coequalizer returns the canonical quotient map.
- `Perf_Diamond_Presentation_atlas_equal_legs_iso` — For a diagonal presentation the specified atlas is an isomorphism.
- `Perf_Diamond_Presentation_atlas_distinct_map` — Any map whose transport differs from the canonical quotient is not the atlas; arbitrary atlas automorphisms are excluded.

**`Perf.Diamond.Presentation`.** A presentation includes the actual sheaf quotient identification, not only an atlas and relation.

For any category `C`, Grothendieck topology `J`, morphism property `proet` and
`F : Sheaf J (Type u)`, `Perf.Diamond.nonempty_presentation` proves
`Diamond J proet F ↔ Nonempty (Presentation J proet F)`. This simply packages the quotient data in
the definition; it requires no subcanonicity or restriction on the objects of `C` ([ECD] Definition
11.1, p. 54, with the topology comparison in D4.4). Use `Classical.choice` on this existence
statement wherever a presentation is needed.

**Checks.**

- `Perf_Diamond_Presentation_diagonal_relation` — The diagonal relation presents a representable, with its two relation maps equal to the identity.
- `Perf_Diamond_Presentation_point_site_singleton` — On the one-object point site the singleton sheaf admits a presentation.
- `Perf_Diamond_Presentation_point_site_bool_failure` — The two-point sheaf has no presentation on the one-object point site, whose relation and atlas are both singletons.

**`Perf.Diamond.presentation`.** For `hF : Diamond J proet F`, this is exactly
`Classical.choice ((Perf.Diamond.nonempty_presentation J proet F).mp hF)`.
The choice need not select the diagonal presentation of a representable. The
following Checks assert existence of a normalized diagonal presentation, on any
subcanonical site whose morphism property `proet` is multiplicative.

**Checks.**

- `Perf_Diamond_presentation_representable_diagonal` — A representable admits a presentation with itself as both atlas and relation, with identity legs.
- `Perf_Diamond_presentation_representable_atlas` — A representable admits a presentation whose atlas map is the identity after transport along the equality of atlas objects.
- `Perf_Diamond_presentation_atlas_not_automorphism` — For a represented object having a nonidentity automorphism, there exists a presentation whose atlas, after transport, differs from that automorphism.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.2 Quotients by pro-étale equivalence relations

**Quotients by pro-étale equivalence relations, independence of the atlas, and quasi-pro-étaleness
of the atlas.** (*quotient-presentations-of-diamonds*) Let `X` be in `Perf` and `R ⊂ X × X` a
pro-étale equivalence relation. Prove that the quotient sheaf `Y = X/R` is a diamond; that the
natural map `R → X ×_Y X` of sheaves on `Perf` is an isomorphism; that for any pro-étale cover
`X̃ → X` by a perfectoid space the induced relation `R̃ = R ×_{X × X} (X̃ × X̃)` on `X̃` is again a
pro-étale equivalence relation and `X̃/R̃ → Y` is an isomorphism; and that the map `X → Y` is
quasi-pro-étale ([ECD] §11, Prop. 11.3 with proof, pp. 54–55). The last statement is the substantial
one: it needs the effective descent of separated pro-étale perfectoid spaces over a strictly totally
disconnected base (D3.4), and one first replaces `X` by a disjoint union of affinoid opens, which
makes `s` and `t` separated. The independence of the atlas is what makes `|Y|` and all later
invariants well defined. Immediately after, prove that binary products and fibre products exist in
the category of diamonds, by choosing compatible presentations and using that the diagonal of a
representable map is pro-étale ([ECD] §11, Prop. 11.4 with proof, p. 55). *Needs:* D4.1; D3.4; D3.9;
D3.6; D0.26; PerfectoidSpaces layer P2 (fibre products of perfectoid spaces); PerfectoidSpaces layer
P6 (pro-étale maps, pro-étale stability and limits, `κ`-small perfectoid spaces).

`Perf.Diamond.Presentation.atlas_quasiProEtale` applies to the specified
presentation atlas, as the quasi-pro-étale conclusion of `Perf.Diamond.quasiProEtale_atlas`
([ECD] Proposition 11.3(iv), pp. 54–55).
`Perf.Diamond.prod` and `Perf.Diamond.fibreProduct` assert closure on
`Geometry.VSheaf p`, with diamond hypotheses on both factors and, for the
fibre product, on the base ([ECD] Proposition 11.4, p. 55).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.3 The atlas characterisation of diamonds

**A pro-étale sheaf is a diamond exactly when it admits a surjective quasi-pro-étale map from a
perfectoid space.** (*atlas-characterisation-of-diamonds*) Let `Y` be a pro-étale sheaf on `Perf`.
Prove that `Y` is a diamond if and only if there is a surjective quasi-pro-étale morphism
`q : X → Y` from a perfectoid space `X`, surjective as a map of sheaves. If `X` is a disjoint union
of strictly totally disconnected spaces, then the kernel relation `R = X ×_Y X ⊂ X × X` is a
pro-étale equivalence relation and the sheaf quotient `X/R` recovers `Y` ([ECD] §11, Prop. 11.5 with
proof, p. 56). The atlas may always be taken to be a disjoint union of strictly totally disconnected
perfectoid spaces (D1.4), which is the form in which every later argument uses it. Deduce three
closure statements: if there is a surjective quasi-pro-étale map `Y' → Y` with `Y'` a diamond, then
`Y` is a diamond; if `f : Y' → Y` is quasi-pro-étale and `Y` is a diamond, then `Y'` is a diamond;
and if `X` is a diamond with an equivalence relation `R` whose projections are quasi-pro-étale, then
`X/R` is a diamond ([ECD] §11, Props. 11.6, 11.7 and 11.8, p. 56). In the last statement `R` is only
assumed to be a pro-étale sheaf; it is automatically a diamond because `s` is quasi-pro-étale. A
v-sheaf is already a pro-étale sheaf, so the criterion also applies to a v-sheaf with a surjective
quasi-pro-étale atlas. The spatial recognition theorem [ECD] Thm 12.18, proved in layer D5, has
different hypotheses and does not replace this specialization. *Needs:* D4.2; D4.1; D3.6; D3.9;
D1.4.

`Perf.Diamond.iff_quasiProEtale_atlas` states the criterion on `Geometry.VSheaf p`:
the atlas map is both `Epi` and `Geometry.quasiProEtale p`.
`Perf.Diamond.exists_strict_atlas` supplies a presentation whose atlas is a coproduct
of strictly totally disconnected perfectoids. `Perf.Diamond.atlas_kernel` identifies
the represented kernel relation and its coequalizer over a strictly totally disconnected
atlas. The three closure statements are `Perf.Diamond.of_quasiProEtale_surjection`,
`Perf.Diamond.of_quasiProEtale`, and `Perf.Diamond.quotient_quasiProEtale`;
the last requires jointly monic legs and an equivalence relation on every test space
([ECD] Propositions 11.5–11.8, p. 56).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.4 Diamonds are v-sheaves

**Diamonds are sheaves for the v-topology.** (*diamonds-are-v-sheaves*) Let `Y` be the pro-étale
sheaf quotient of a perfectoid space by a represented pro-étale equivalence relation. Prove that `Y`
is a sheaf for the v-topology and agrees with the v-sheaf quotient, compatibly with the quotient map
([ECD] §11, Prop. 11.9 with proof, pp. 56–57). This identifies the pro-étale definition with the
v-convention of D4.1. The proof follows Gabber's descent argument, and the presentation may be taken
with `X` a disjoint union of totally disconnected perfectoid spaces; it is this statement that
allows every later construction to be verified v-locally. Prove moreover that if `f : Y' → Y` is an
injection of v-sheaves and `Y` is a diamond, then `Y'` is a diamond; and that a quasicompact
quasiseparated map `f : Y → X` of diamonds is an isomorphism if and only if
`f(K, K⁺) : Y(K, K⁺) → X(K, K⁺)` is a bijection for every algebraically closed perfectoid field `K`
with an open and bounded valuation subring `K⁺ ⊂ K` ([ECD] §11, Prop. 11.10 and Lem. 11.11, p. 57).
In the isomorphism criterion the quasicompactness hypothesis cannot be dropped: for `C` an
algebraically closed perfectoid field of characteristic `p`, the map
`⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)` from the disjoint union of the fibres over the points
of `ℤ_p` is an injection of diamonds (locally constant functions into continuous ones), pro-étale,
quasiseparated, bijective on `(K, K⁺)`-points for every perfectoid field `K` (`|Spa(K, K⁺)|` is
connected, so on both sides these points are `ℤ_p × Hom(Spa(K, K⁺), Spa(C, O_C))`), and not an
isomorphism, since the identity of `ℤ_p` is a continuous function `|ℤ_p̲ × Spa(C, O_C)| → ℤ_p` that
is not locally constant; it is not quasicompact. The criterion quantifies over algebraically closed
`K` only, which is a weaker requirement than a bijection on all `(K, K⁺)`-points. This criterion is
the one applied in [ECD] Lem. 11.27, Prop. 11.30, Lem. 12.5 and Prop. 13.12. *Needs:* D4.3; D3.4;
D3.7; D2.7; D1.5; PerfectoidSpaces layer P4 (the valuative criterion for separatedness,
separatedness of maps of affinoid perfectoid spaces).

**Checks.**

- `not_quasicompact` (non-example) — `⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)` is bijective on
  `(K, K⁺)`-points for every perfectoid field `K` and is not an isomorphism; the quasicompactness
  hypothesis of the isomorphism criterion is what excludes it.
- `identity` (degenerate case) — the identity of a diamond is qcqs and bijective on all points, and
  is an isomorphism.

- `connected_maps_to_zp` — a continuous map from a nonempty connected topological
  space to `ℤ_p` is constant.
- `zp_identity_not_locally_constant` — the identity of `ℤ_p` is not locally constant.

These two topological calculations supply parts of `not_quasicompact`. Its geometric
example constructs the map from the coproduct of represented field points to
`Geometry.topologicalSheaf ℤ_p × Spa(C, O_C)` and tests its field sections,
noninvertibility and failure of quasicompactness.

`Perf.Diamond.proEtale_quotient_isVSheaf` asserts v-descent for the pro-étale
sheafification of the presented quotient; v-descent is not an input.
For `X, R : Geometry.Perf p` and `s, t : R → X` satisfying
`Perf.IsProEtaleEquivRel (Geometry.proet p true) X R s t`,
`Perf.Diamond.proEtale_quotient_comparison` identifies the pro-étale and
v-sheafifications of the presheaf coequalizer. Its isomorphism is between underlying
presheaves and carries the pro-étale sheafification unit to the v-sheafification unit.
Thus the identification preserves the specified atlas map as well as all sections
([ECD] Proposition 11.9, pp. 56–57).

**Comparison Checks.**

- `proEtale_quotient_comparison_diagonal` — For `s = t = id`, the pro-étale quotient
  is the represented v-sheaf, and the composite from the atlas is the identity.
- `proEtale_quotient_comparison_empty` — The diagonal relation on the initial
  perfectoid space gives the initial sheaf in both topologies.
- `proEtale_quotient_comparison_sections` — On every perfectoid test space the two
  quotients have bijective sections, carrying the image of each presheaf quotient
  section to its image under the other sheafification unit.

`Perf.Diamond.of_mono` handles sub-v-sheaves.
`Perf.Diamond.isIso_iff_fieldPoints` retains both quasicompactness and
quasiseparatedness and tests `Geometry.FieldPoint p true` with `IsAlgClosed K.A`
([ECD] Proposition 11.9, pp. 56–57; Proposition 11.10 and Lemma 11.11, p. 57).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.5 The underlying topological space of a diamond

The next two targets construct the underlying topological space of a diamond, prove that it is
independent of the presentation and classifies open subfunctors, and embed the compact Hausdorff
spaces fully faithfully into diamonds, exhibiting underlying spaces that are not spectral.

**The underlying topological space of a diamond and the open-subfunctor correspondence.**
(*underlying-topological-space*) Let `Y` be a diamond with a presentation `Y = X/R`. Prove that
there is a canonical bijection between `|X|/|R|` and the set of equivalence classes of maps
`Spa(K, K⁺) → Y`, where `K` runs over perfectoid fields with an open and bounded valuation subring
`K⁺`, two maps being equivalent if they are dominated by a third through surjective maps. Domination
is an equivalence relation: the proof uses common perfectoid-field refinements and the surjectivity
of a fibre product of surjections of such spectra. The quotient topology induced on this set by the
surjection `|X| → |Y|` is independent of the presentation, which is proved by comparing two
presentations through a third, and `|Y|` with that topology is the underlying topological space of
`Y` ([ECD] §11, Prop. 11.13 and Def. 11.14, pp. 59–60). Equality of the point sets alone does not
give a presentation-independent topology; the comparison of atlases through a third atlas and the
descent of opens along the quotient topology are both needed. Prove that any open subfunctor of `Y`
is a diamond, that `U ↦ |U|` is a bijection between open immersions into `Y` and open subsets of
`|Y|`, and that a surjection of diamonds induces a quotient map on underlying spaces ([ECD] §11,
Prop. 11.15 with proof, p. 60). Define `Perf.Diamond.space` as the underlying topological space
`|Y|` of a diamond `Y`; prove `Perf.Diamond.space_eq_quotient` (for any presentation `Y = X/R`,
`|Y|` is the quotient `|X|/|R|` with the quotient topology), `Perf.Diamond.space_eq_points` (`|Y|`
is in canonical bijection with the equivalence classes of maps `Spa(K, K⁺) → Y`),
`Perf.Diamond.spaceFunctor` (`Y ↦ |Y|` is a functor to topological spaces, immediate from the
construction), `Perf.Diamond.openSubfunctorEquiv` (open immersions into `Y` correspond bijectively
to open subsets of `|Y|`), `Perf.Diamond.isQuotientMap_of_surjective` (a surjection of diamonds
induces a quotient map of underlying spaces), `Perf.Diamond.space_of_perfectoid` (for a perfectoid
space the construction returns the usual underlying topological space) and
`Perf.Diamond.isOpenImmersion_iff` (for a map between diamonds, the sectionwise open condition is
equivalent to `(Geometry.openImm p true).presheaf f.hom`, the representable base-change condition of
[ECD] Definition 10.7(i), p. 51). *Needs:* D4.1; D4.2; AdicSpacesPartII R0.19.4; D3.9; D2.2;
PerfectoidSpaces layer P2 (completed residue fields); PerfectoidSpaces layer P4 (the injection of
residue-field points).

The intrinsic construction in `Perf.Diamond.space` is the colimit of
`(Functor.Elements.π Y.obj).leftOp ⋙ sp`: its objects are all sections on perfectoid
test spaces, and its arrows are restrictions of sections. Thus neither its point set
nor its topology requires choosing a presentation. `spaceι` sends a point of a test
space with a section into that colimit; `spaceι_restrict` fixes the restriction equation.
`spaceMap_ι` fixes postcomposition on these generators, and `spaceFunctor` gives functoriality.
The comparison `space_of_perfectoid_ι` sends a pair `(f : T → X, t ∈ |T|)` to `|f|(t)`;
it is the inverse of the Yoneda Kan-extension unit, after identifying ordinary and
ULift representables. For any small category `C`, topology `J` and functor
`sp : C ⥤ TopCat`, `Perf.Diamond.spaceFunctor_leftKanExtension` identifies
`spaceFunctor sp J` with `sheafToPresheaf J (Type u) ⋙
uliftYoneda.leftKanExtension sp`; no subcanonicity or descent is needed for this
identification (Mathlib `CategoryTheory/Limits/Presheaf.lean`,
`Presheaf.uliftYonedaAdjunction`).

For a supplied small site the precise descent hypothesis of `space_eq_quotient` is that
`X ↦ C(|X|, T)` is a sheaf for every topological space `T`.
`Perf.Diamond.restrictedULiftYoneda_isSheaf` transports that hypothesis across the
natural identification with `Presheaf.restrictedULiftYoneda sp T`, and
`restrictedYonedaSheaf sp J hcont` regards this functor as sheaf-valued.
`Perf.Diamond.spaceFunctor_adjunction` states that `spaceFunctor sp J` is left
adjoint to this specified right adjoint. `Perf.Diamond.spaceFunctor_preservesColimits`
then applies Mathlib's `Adjunction.leftAdjoint_preservesColimits`; neither theorem
requires subcanonicity (same presheaf supplier and
`CategoryTheory/Adjunction/Limits.lean`).

For a presentation `P` on a subcanonical site,
`Perf.Diamond.presentationSpace_isColimit` identifies the explicit quotient of
`|P.X|` by the generated point relation with the coequalizer of the realized
representable maps. Its quotient projection first applies `space_of_perfectoid`;
this fixes the orientation and topology ([ECD] Definition 11.14, and the quotient
universal property). Under `hcont`, `space_eq_quotient` follows by preserving the
atlas cofork of `Presentation.atlas_isColimit` and comparing these two colimits.
`space_eq_quotient_mk` identifies its value on every atlas point with the
specified atlas section. `presentationComparison` compares any two atlases through this
same space and satisfies the identity and cocycle equations. On the geometric site,
`Geometry.continuousMap_isSheaf` supplies `hcont` for every `T : TopCat.{2}`
([ECD] Propositions 11.13 and 12.7).
`isQuotientMap_of_surjective` applies the same preservation theorem to the
regular-epimorphism cofork of a sheaf surjection, followed by Mathlib's
`TopCat.isQuotientMap_of_isColimit_cofork`. `openSubfunctor` consists of sections whose entire images lie in the given
open subset; `openSubfunctor_isSheaf` gives its descent under the same hypothesis.
The comparison with field-valued points and the equivalence with *geometric* open immersions
use the perfectoid field pairs and the open-immersion comparison of PerfectoidSpaces P2/P4.

**Checks.**

- `presentation_empty` (degenerate) — the quotient of an empty atlas is empty.
- `presentation_nonempty` (non-example) — a nonempty atlas cannot have an empty quotient.
- `presentation_diagonal` (computation) — if the relation identifies each point only with
  itself, the quotient is homeomorphic to the atlas. The categorical construction
  `Perf.Diamond.presentationSpace` takes the presentation explicitly; identifying different
  presentations uses the perfectoid geometry of this section.

- `perfectoid_space` (characterisation) — for `Y` a perfectoid space, `|Y|` is the underlying
  topological space of `Y`.
- `compact_hausdorff` (non-example) — for `Y = T̲ × Spa(K, O_K)` with `T : CompHaus.{0}`,
  `|Y| = T`; in particular `|Y|` need not be spectral, the required non-example.
- `independent_of_presentation` (compatibility) — two presentations of the same diamond give the
  same topology; a construction whose topology depends on the atlas is wrong. For `Y = Spa(C, O_C)`
  the presentations `Y = Y/Y` (diagonal relation) and `Y = (ℤ_p̲ × Y)/(ℤ_p̲ × ℤ_p̲ × Y)` (atlas
  `Spa(C⁰(ℤ_p, C), C⁰(ℤ_p, O_C))` with underlying space `ℤ_p`, total relation) both return the
  one-point space.
- `open_subfunctors` (degenerate case) — open subfunctors of a perfectoid space correspond to open
  subsets of its underlying space, matching the classical statement. The formal membership
  test says that the ordinary underlying map has image in the corresponding open subset.

Further Checks fix the intrinsic construction and its comparison maps.

- `presentation_total` — a total relation gives a quotient with at most one point.
  Nonemptiness is tested separately by `presentation_nonempty`.
- `realization_empty` — a presheaf with no sections on any test object has empty realization.
  The geometric empty sheaf can have a section on the empty test space; its empty-space
  computation is instead `quotient_empty` below.
- `realization_two_points` — distinct points of a representable remain distinct after realization.
- `realization_restriction` — a section restricted along `f` induces its original map composed with `|f|`.
- `realization_identity` — the identity sheaf map induces the identity continuous map.
- `realization_composition` — postcomposition by `f` and then `g` induces `|g| ∘ |f|`.
- `realization_map_representable` — the image of a representable point under the realized
  Yoneda map of `f` is exactly `|f|(x)`.
- `quotient_empty` — with continuous-map descent, an empty atlas gives empty intrinsic space.
- `quotient_total` — a nonempty total point relation gives intrinsic space homeomorphic to a point.
- `quotient_diagonal` — a diagonal point relation gives intrinsic space homeomorphic to the atlas.
- `presentation_comparison_self` — comparing an atlas with itself gives the identity.
- `presentation_comparison_cocycle` — comparison through a third atlas equals direct comparison.
- `open_whole` — the full open subset gives the full subfunctor.
- `open_empty_nonempty_test` — the empty open admits no section from a nonempty test space.

The field-valued equivalence relation in `space_eq_points`, the realization of the specific
`ℤ_p` atlas in `independent_of_presentation`, and the `compact_hausdorff` Check use
perfectoid field spectra and the profinite-product comparison. Their categorical counterparts
above do not replace those geometric constructions.

**`pointSetoid`.** The generated relation identifies the endpoints of relation points and no more.

**Checks.**

- `definition_pointSetoid_1` — A total point relation on a nonempty atlas gives exactly one
  equivalence class.
- `definition_pointSetoid_2` — An empty atlas gives no classes.
- `definition_pointSetoid_3` — A diagonal point relation never identifies distinct atlas points.

**`presentationSpace`.** The presentation topology is the topological quotient of the atlas relation.

**Checks.**

- `definition_presentationSpace_1` — For a diagonal relation on a two-point atlas the quotient has
  exactly two points.
- `definition_presentationSpace_2` — An empty atlas gives an empty presentation space.
- `definition_presentationSpace_3` — For a nonempty atlas with total relation the quotient is not
  empty, and has only one point.

**`space`.** Intrinsic realization uses every section and its restriction maps.

**Checks.**

- `definition_space_1` — The two-element sheaf on the point test site realizes to a two-point space.
- `definition_space_2` — The empty sheaf on that site has empty realization.
- `definition_space_3` — The realization of the countable constant sheaf on that site is not
  compact.

**`Perf.Diamond.spaceι`.** Representable sections retain their points in the intrinsic realization.

**Checks.**

- `Perf_Diamond_spaceι_representable_image` — For a represented arrow sending x to y, its section at x equals the identity section at y.
- `Perf_Diamond_spaceι_empty_test_space` — For an empty test space every section has empty image.
- `Perf_Diamond_spaceι_distinct_points` — Distinct points of a representable remain distinct under its identity section; a constant realization map fails.

**`Perf.Diamond.spaceMap`.** The realization of a representable morphism carries each point to its image.

**Checks.**

- `Perf_Diamond_spaceMap_representable_image` — If a representable morphism sends x to y, realization sends the identity-section point x to the identity-section point y.
- `spaceMap_empty_source` — A morphism from an empty realization has empty image.
- `Perf_Diamond_spaceMap_moving_point` — If a representable endomorphism moves x, its realization moves the represented point x.

**`Perf.Diamond.spaceFunctor`.** The realization functor keeps the section labels on the point site.

**Checks.**

- `Perf_Diamond_spaceFunctor_bool_card` — The constant Bool sheaf on the point site realizes as a two-element space.
- `Perf_Diamond_spaceFunctor_empty` — The empty sheaf on the point site realizes as the empty space.
- `Perf_Diamond_spaceFunctor_bool_transposition` — The Bool transposition induces a nonidentity map, excluding a functor that fixes every point.

**`Perf.Diamond.restrictedYonedaSheaf`.** Under `hcont`, its sections on `X` are
ULift continuous maps `|X| → T`; a map `T → U` acts by postcomposition.

**Checks.**

- `restrictedYonedaSheaf_postcomposition` — A section `g : |X| → T` is sent by
  `f : T → U` to `g ≫ f`, fixing the covariant direction.
- `restrictedYonedaSheaf_empty_source` — On an empty test space there is exactly
  one section for every target, including the empty target.
- `restrictedYonedaSheaf_empty_target` — On a nonempty test space there are no
  sections with empty target.

**`Perf.Diamond.space_of_perfectoid`.** The representable comparison is evaluation on points.

**Checks.**

- `space_of_perfectoid_section_value` — A represented section sending x to y is evaluated as y.
- `space_of_perfectoid_empty` — The representable comparison makes the realization empty when the represented space is empty.
- `space_of_perfectoid_distinct_points` — For distinct points x and y the comparison does not send the identity-section point x to y.

**`Perf.Diamond.openSubfunctor`.** The open subfunctor is determined by the images of sections.

**Checks.**

- `Perf_Diamond_openSubfunctor_identity_section_iff_whole` — For a representable, the identity section belongs to an open subfunctor exactly when that open is the whole realization.
- `openSubfunctor_intersection` — Intersecting two opens intersects their subfunctors, testing the condition on the entire image of each section.
- `openSubfunctor_empty_test` — On an empty test space every section belongs to the subfunctor of the empty open.

**`Perf.Diamond.space_eq_quotient`.** The homeomorphism is fixed by evaluating the atlas at each point. The Checks use a one-object site with Boolean underlying space, its represented sheaf, and the diagonal presentation. The presentation isomorphism comes from the canonical coequalizer projection, so the two Boolean labels are fixed.

**Checks.**

- `Perf_Diamond_space_eq_quotient_false_value` — On the one-object site with the discrete Boolean underlying space and its explicit diagonal presentation, the quotient comparison followed by the representable comparison sends the class of `false` to `false`.
- `Perf_Diamond_space_eq_quotient_true_value_and_card` — For that diagonal presentation, the class of `true` maps to `true` and the quotient has exactly two points.
- `Perf_Diamond_space_eq_quotient_distinct_values` — The images of the Boolean classes `false` and `true` under that comparison are distinct.

**`Perf.Diamond.presentationComparison`.** Two presentations are compared through their specified atlas evaluations in the intrinsic space.

**Checks.**

- `presentationComparison_equal_evaluations` — Representatives with equal atlas evaluations are identified by the comparison.
- `presentationComparison_self` — Comparing a presentation with itself fixes every quotient point.
- `presentationComparison_distinct_evaluations` — Representatives with distinct atlas evaluations cannot be identified.

`Perf.Diamond.of_openSubfunctor` supplies the diamond assertion for every open
immersion into a diamond. For a diamond `F`, `Perf.Diamond.openSubfunctorEquiv`
identifies `Opens (Geometry.realized p F)` with the subtype of `Subobject F` whose
representative arrow satisfies `(Geometry.openImm p true).presheaf`. Here `Subobject`
means monomorphisms modulo isomorphism over `F`. The forward arrow has topological
image exactly the given open, and its image on every test object's sections equals
`Perf.Diamond.openSubfunctor sp Jv F U` ([ECD] Proposition 11.15, p. 60).
`Perf.IsSmallVSheaf.openSubfunctorEquiv` states these same two equations assuming
`Perf.IsSmallVSheaf Jv F` ([ECD] Proposition 12.9, p. 71).

**Checks.**

- `openSubfunctorEquiv_whole` — The whole space corresponds to an isomorphism onto `F`.
- `openSubfunctorEquiv_empty` — The empty open corresponds to the initial sheaf and has empty image.
- `openSubfunctorEquiv_distinct_opens` — Distinct opens give distinct classes of geometric open immersions over `F`.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.6 Compact Hausdorff spaces as diamonds

**Compact Hausdorff spaces embed fully faithfully into diamonds.** (*compact-hausdorff-diamonds*)
Fix a perfectoid field `K : Type` of characteristic `p`. Prove that the functor sending
`T : CompHaus.{0}` to `T̲ × Spa(K, O_K)` is a fully faithful functor from `CompHaus.{0}` to
diamonds over `Spa(K, O_K)`; full faithfulness uses that every surjection of compact Hausdorff
spaces is a quotient map (Mathlib `Continuous.isClosedMap` with
`Topology.IsClosedMap.isQuotientMap`), and the presentation comes from the profinite cover
`CompHaus.projectivePresentation T` with its closed relation (D0.16). Both the presentation
`S` and its relation `S ×_T S` lie in `Profinite.{0}`; their continuous-function rings over `K`
are in `Type`, so the resulting atlas and relation lie in `Geometry.Perf p`. For `S : Profinite.{0}`,
`S̲ × Spa(K, O_K)` is the affinoid perfectoid space `Spa(C⁰(S, K), C⁰(S, O_K))` of PerfectoidSpaces
layer P6 (`PerfectoidSpace.prodProfinite` and `PerfectoidSpace.globalSections`, with Check
`prodProfinite_Zp_sections` for the sections), identified with the product of v-sheaves through
D3.10; that identification is the computational content ([ECD] §11, Ex. 11.12 with proof, pp. 58–59;
[ECD] §11, Ex. 11.12, p. 58). The degenerate cases are the empty space (`∅̲ × Spa(K, O_K)` is the
empty diamond, since `C⁰(|X|, ∅)` is empty for `X ≠ ∅`), a point (`Spa(K, O_K)` itself) and a finite
set with `n` points (`C⁰(T, K) = K^n`, so `n` copies of `Spa(K, O_K)`); the Cantor set is profinite
and gives an affinoid perfectoid space. Full faithfulness on a point reads
`Hom_{Spa(K, O_K)}(Spa(K, O_K), T̲ × Spa(K, O_K)) = C⁰(pt, T) = T`. The underlying topological space
of `T̲ × Spa(K, O_K)` is `T`, so it can be far from spectral: for `T` the unit interval, which is
connected and Hausdorff and so not spectral (a Hausdorff spectral space is profinite), this is a
diamond whose underlying space is not spectral. This is one of the required tests of the layer; it
is what shows that the underlying space of a diamond need not be spectral, and it is why spatiality
(layer D5) is a genuine restriction. *Needs:* D0.16; D4.1; D4.2; D3.10; D4.5; PerfectoidSpaces layer
P5 (cofiltered limits of affinoid perfectoid spaces); PerfectoidSpaces layer P6 (`prodProfinite`);
Mathlib `Continuous.isClosedMap`, `Topology.IsClosedMap.isQuotientMap`.

**Checks.**

- `compHaus_empty` — the empty object of `CompHaus.{0}` gives the empty diamond and empty
  realization.
- `compHaus_point` — a one-point object gives `Spa(K, O_K)` and its one-point realization;
  morphisms from it recover the points of the target compact Hausdorff space.
- `compHaus_profinite` — for `S : Profinite.{0}`, the atlas is
  `Spa(C⁰(S, K), C⁰(S, O_K))`, with the original topology on `S`; this includes the Cantor set.
- `interval_not_spectral` — the unit interval is not spectral. This checks the topological
  obstruction in `compact_hausdorff`; constructing its associated diamond requires
  `CompHaus.projectivePresentation`, perfectoid profinite products, and the quotient comparison.
- `compHaus_large_cube_topology` (non-example) — Let `T = Type → ZMod 2` with its compact
  product topology and `A = {t : T | Small.{0} {i : Type // t i ≠ 0}}`.
  The set `A` is dense, since it contains finite-support points, and proper, since it excludes
  the all-ones point, so it is not closed. For every continuous `h : S → T` with `S : Type`,
  let `J` be the union of the supports of `h(s)` for `s ∈ h⁻¹(A)`. This union is `Small.{0}`,
  and `h⁻¹(A) = h⁻¹({t | support(t) ⊆ J})` is closed. Checking on small open charts gives
  the same conclusion for every `S = |X|` with `X : Geometry.Perf p`. For
  `P = Spa(C, O_C)` with `C : Type` algebraically closed of characteristic `p`, the canonical
  evaluation map `q : |T̲ × h_P| → T` therefore has closed inverse image of `A`, by the final
  topology of realization. Constant sections hit every point of `T`; nevertheless `q` cannot
  be a homeomorphism. The boundary statements `compHaus_large_cube_dense`,
  `compHaus_large_cube_not_closed` and `compHaus_large_cube_small_preimage` are the three
  topological facts used here.

`Perf.Diamond.compHaus_embedding` asserts a fully faithful functor from
`CompHaus.{0}` to the slice of `Geometry.VSheaf p` over the represented
`Spa(K, O_K)`, with object formula `T̲ × Spa(K, O_K)` and diamond image.
For the same `K : Type` and `T : CompHaus.{0}`, `Perf.Diamond.compHaus_space` gives the
homeomorphism to `T`, normalized by
evaluation of the continuous-map coordinate on every test-space section
([ECD] Example 11.12, pp. 58–59; Example 11.16, p. 60). The continuous-map sheaf for a
larger-universe compact Hausdorff space is still defined by D3.10.
`Geometry.maximalField` supplies `O_K` even
when the input field pair has a smaller plus ring.

Lean: none; the boundary topology, the geometric embedding and the space comparison are specified
in the README only.

### D4.7 Small v-sheaves and small v-stacks

The remaining four targets define small v-sheaves and small v-stacks, construct their underlying
spaces and open substacks, compare sheaf-theoretic and topological surjectivity, prove the
isomorphism and injectivity criteria on geometric points, and treat quotients of small v-sheaves by
locally profinite groups.

**Small v-sheaves and small v-stacks.** (*small-v-sheaves-and-small-v-stacks*) A small v-sheaf is a
v-sheaf `Y` on `Perf` for which there is a map of v-sheaves `X → Y` from a perfectoid space `X` that
is surjective in v-sheaves. A small v-stack is a v-stack `Y` on `Perf` for which there is a
surjective map of v-stacks `X → Y` from a perfectoid space `X` such that the kernel 2-fibre product
`R = X ×_Y X` is a small v-sheaf; the smallness condition on `R` is what makes the notion
manageable, since without it the 2-fibre product could fail to be small ([ECD] §12, Def. 12.1, Rem.
12.2 and Def. 12.4, pp. 69–70). Prove that every diamond is a small v-sheaf, that a v-sheaf
receiving a surjection from a diamond is small, and that every quasicompact v-sheaf, and more
generally every qcqs v-stack, is small: a quasicompact object is covered by the disjoint union of
all maps from perfectoid spaces, from which a finite subcover is extracted. Not every small v-sheaf
is a diamond; the criterion is [ECD] Thm 12.18 in layer D5. Prove also the presentation statement
that makes the definition usable: for a surjection `X → Y` from a diamond `X` onto a v-sheaf `Y`,
the relation `R = X ×_Y X` is a diamond and `Y = X/R` ([ECD] §12, Prop. 12.3 with proof, p. 70).
Define `Perf.IsSmallVSheaf` as the predicate that a v-sheaf admits a surjection from a perfectoid
space and `Perf.IsSmallVStack` as the predicate that a v-stack admits a surjection from a perfectoid
space whose diagonal fibre product is a small v-sheaf; construct `Perf.Diamond.isSmall` (every
diamond is a small v-sheaf), `Perf.IsSmallVSheaf.ofSurjectionFromDiamond` (a v-sheaf with a
surjection from a diamond is small) and `Perf.IsSmallVStack.ofQuasicompact` (every quasicompact
v-sheaf, and every qcqs v-stack, is small); prove `Perf.IsSmallVSheaf.relation_isDiamond` (for a
surjection from a diamond, the relation is a diamond and the quotient is the given sheaf),
`Perf.IsSmallVSheaf.relation_locallySpatial` (with spatiality in the sense of D5.1, if the sheaf is
quasiseparated and the atlas locally spatial then the relation is locally spatial; if the sheaf is
qcqs and the atlas spatial then the relation is spatial) and `Perf.IsSmallVStack.fibreProduct`
(small v-stacks are stable under 2-fibre products). *Needs:* D4.4; D4.1; D2.2; D0.26;
AdicSpacesPartII R0.19.10; D3.10.

**Checks.**

- `diamond` (degenerate case) — every diamond is a small v-sheaf.
- `classifying_stack` (non-example) — the classifying stack `BG` of a nontrivial locally profinite
  group `G : Type` over a charted geometric point is a small v-stack that is not a v-sheaf;
  for trivial `G` it is the base sheaf.
- `quasicompact_is_small` (characterisation) — a quasicompact v-sheaf is small without any further
  hypothesis.

`Perf.IsSmallVStack` uses Mathlib pseudofunctors and `IsStack`, requires groupoid fibres,
and gives a representable atlas that is locally essentially surjective. Its relation is the
actual `Stack.twoFibreProduct q q`, equivalent by a strong natural transformation to the
discrete prestack of a small sheaf. Objectwise cardinality alone cannot express this condition.
`Perf.IsStackSurjective` specifies local lifting up to isomorphism on a covering sieve.

The sheaf and stack definitions also have these Checks.

- `small_representable` — the identity is an atlas of a representable sheaf.
- `small_epi_quotient` — a sheaf coequalizer of two maps to a representable is small.
- `small_no_atlas` — a sheaf receiving no maps from any representable cannot be small.
- `stack_surjective_identity` — every object lifts along the identity map of a stack.
- `stack_surjective_empty_target` — an empty target makes the local lifting requirement vacuous.
- `stack_surjective_empty_source` — a target object cannot lift from an empty source
  when the empty sieve does not cover that test object.
- `small_stack_representable` — a representable sheaf viewed as a discrete stack is small.
- `small_stack_no_test_objects` — on the empty category even the terminal stack has no
  representable atlas. This tests the supplied-site generality, not the perfectoid site.
- `small_stack_noninvertible_arrow` — a fibre with a noninvertible arrow is not a small
  v-stack, regardless of any proposed atlas.

`Geometry.classifyingGroupoid B G` is the trivial action groupoid over the v-sheaf `B`:
on a perfectoid test space `X`, its objects are sections of `B` and its automorphisms
are continuous maps `|X| → G`. Restrictions precompose both entries. Its stack quotient
is the classifying stack over `B` ([ECD] Definition 12.4, p. 70; §10 torsors).

**Checks.**

- `classifyingGroupoid_automorphisms` — Automorphisms of a fixed object are exactly continuous maps into `G`.
- `classifyingGroupoid_trivial` — The trivial group gives the discrete groupoid of sections of `B`.
- `classifyingGroupoid_empty` — A test space with no section of `B` has no objects in this groupoid.

The `classifying_stack` Check uses `Geometry.classifyingGroupoid` over the represented field point
`Spa(C, O_C)` with `C : Type` and locally profinite `G : Type`, and asserts smallness of its stack
quotient. Its atlas relation is `G̲ × Spa(C, O_C)`, represented by the charted product of D3.10.
`quasicompact_is_small` applies the finite-subcover condition of AdicSpacesPartII R0.19.10 on the
perfectoid site.

**`IsSmallVSheaf`.** On the point test site a single representable atlas has only one section.

**Checks.**

- `IsSmallVSheaf_point_site_singleton` — The singleton sheaf is small.
- `IsSmallVSheaf_point_site_empty` — The empty sheaf has no representable atlas on this site.
- `IsSmallVSheaf_point_site_two_points` — The two-element sheaf cannot be covered by the single-point
  representable.

**`Perf.IsStackSurjective`.** Local essential surjectivity reduces to surjectivity of sets for discrete stacks on the point site.

**Checks.**

- `Perf_IsStackSurjective_bool_to_point` — The map from the discrete two-point stack to the point is locally essentially surjective.
- `Perf_IsStackSurjective_empty_identity` — The identity of the empty discrete stack is locally essentially surjective.
- `Perf_IsStackSurjective_point_to_bool_failure` — A single point cannot cover a discrete two-point stack on this site.

**`Perf.IsSmallVStack`.** A representable atlas is required, with a small sheaf for its entire kernel groupoid. On the point site the only available representable atlas is a singleton.

**Checks.**

- `Perf_IsSmallVStack_indiscrete_bool` — The indiscrete groupoid with two isomorphic objects is small on the point site; counting objects instead of isomorphism classes would reject it.
- `Perf_IsSmallVStack_point` — The terminal discrete stack is small on the point site.
- `Perf_IsSmallVStack_discrete_bool_failure` — The discrete two-point stack is not small on the point site: no singleton atlas covers both classes.

`Perf.Diamond.isSmall` is the diamond-to-small-sheaf theorem.
`Perf.IsSmallVSheaf.ofSurjectionFromDiamond` composes a diamond atlas with the
specified epimorphism; `Perf.IsSmallVSheaf.ofQuasicompact` supplies the finite-cover
case ([ECD] Remark 12.2, pp. 69–70).
`Perf.IsSmallVStack.ofQuasicompact` requires quasicompactness of the sheaf of local
isomorphism classes and qcqs relations between every pair of affinoid tests.
`Perf.IsSmallVStack.ofQuasicompact_sheaf` needs only quasicompactness of the sheaf
([ECD] Definition 12.4, p. 70; Convention 8.4, p. 41).
`Perf.IsSmallVStack.fibreProduct` takes three small `Geometry.VStack p` objects and
their two maps to the base ([ECD] Proposition 12.10, p. 71).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.8 Underlying spaces and surjectivity for small v-stacks

**Underlying spaces, open sub-v-stacks, fibre products, and surjectivity versus topological
surjectivity.** (*spaces-and-surjectivity-for-small-v-stacks*) Let `Y` be a small v-stack with a
presentation `Y = X/R`, where `X` is a diamond, `R` is a small v-sheaf and `R̃ → R` is a surjection
from a diamond; the small relation `R` is resolved by the diamond atlas `R̃` before its topological
quotient is taken. Prove that there is a canonical bijection between `|X|/|R̃|` and the set of maps
`Spa(K, K⁺) → Y` modulo the domination relation of D4.5, and that the quotient topology is
independent of the presentation; this defines `|Y|`. The two-step presentation is genuine: one may
also define `|Y|` first for small v-sheaves and then for stacks, and the two agree because
`|R̃| → |R|` is surjective. Prove that open sub-v-stacks of `Y` correspond bijectively to open
subsets of `|Y|`, and that a surjection of small v-stacks induces a quotient map of spaces. Prove
that fibre products of small v-stacks are small v-stacks and that the map from the space of the
fibre product to the fibre product of the spaces is surjective, rather than a homeomorphism: for
`X = Spa(K₀, O_{K₀})`, `X × X` is the perfectoid punctured open unit disc over `X` ([ECD] proof of
Prop. 11.4), so `|X × X| → |X| × |X|` is a surjection onto a point with an infinite fibre ([ECD]
§12, Prop. 12.7, Def. 12.8, Prop. 12.9 and Prop. 12.10, pp. 70–71). Finally, prove that if `f` is a
surjection of v-stacks then `|f|` is surjective, and conversely that if `f` is quasicompact and
`|f|` is surjective then `f` is a surjection of v-stacks; the converse rests on local lifting from
geometric points, and the quasicompactness hypothesis is kept wherever it is applied ([ECD] §12,
Lem. 12.11 with proof, p. 72; footnote 2 on p. 71, introducing this result, credits David Hansen for
discussions of the two notions of surjectivity). Without the quasicompactness hypothesis the
converse fails: a quasi-pro-étale map from a perfectoid space that is surjective on underlying
spaces need not be a surjection of v-sheaves, because it need not be quasicompact ([ECD] Rem. 12.19,
p. 75); this is the required non-example, and the map `⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)`
of D4.4 is an instance: pro-étale, bijective on underlying spaces, not quasicompact, and not a
surjection of v-sheaves, since every quasicompact open of the source has finite image in `ℤ_p` and
so no quasicompact open maps onto the quasicompact target, as a v-cover would require. *Needs:*
D4.7; D4.5; AdicSpacesPartII R0.19.10; D3.9; D2.2; D0.26.

The geometric topology and fibre-product targets use the two-stage atlas `R̃ → R ⇉ X` and the
groupoid-valued field-point carrier. The Check `surjective_on_points_not_v_surjective` tests the
coproduct map of v-sheaves from D4.4. The Check `fibre_product_space` realizes the sheaf product of
represented field spectra and tests surjectivity and noninjectivity of its map to the product of
their spaces.

**Checks.**

- `surjective_on_points_not_v_surjective` (non-example) —
  `⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)` is surjective on underlying spaces and not a
  surjection of v-sheaves; it is not quasicompact.
- `fibre_product_space` (computation) — for `X = Spa(K₀, O_{K₀})`, `|X × X| → |X| × |X|` is
  surjective onto a point and not injective.

- `finite_image_not_surjective` — no finite subset of `ℤ_p` equals the whole space.
  This tests the finite-image obstruction, not the construction of the geometric map.

`Geometry.stackRealized` realizes the sheafification of `Stack.isoClasses`;
`Geometry.stackRealizedMap` is induced by the given strong transformation.
`Geometry.stackFieldRelation_equivalence` proves common field domination is an
equivalence relation. `Perf.IsSmallVStack.space_eq_points` fixes the bijection on
closed points of field spectra. `Perf.IsSmallVStack.space_eq_quotient` uses a diamond
atlas and a diamond surjection onto its actual kernel 2-fibre product; its
homeomorphism is fixed on every atlas point ([ECD] Proposition 12.7 and Definition
12.8, pp. 70–71).
`Perf.IsSmallVStack.openSubstackEquiv` classifies open substacks up to equivalence
over the base and proves their maps of spaces are open embeddings.
`Perf.IsSmallVStack.isQuotientMap_of_surjective` gives a quotient map for every
stack surjection. `Perf.IsSmallVStack.fibreProduct_points` lifts every compatible
pair of points, with all three stacks small ([ECD] Propositions 12.9–12.10, p. 71).
`Perf.IsSmallVStack.surjective_iff` gives the converse to topological surjectivity
under `Geometry.stackQuasicompact` ([ECD] Lemma 12.11, p. 72).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.9 Isomorphism and injectivity criteria on geometric points

**Isomorphism and injectivity criteria on geometric points.**
(*isomorphism-criteria-for-v-sheaves-and-stacks*) Let `f : Y' → Y` be a quasicompact quasiseparated
map of v-stacks, quasiseparatedness of a map of stacks being meant in the sense of [ECD] Convention
8.4 (AdicSpacesPartII R0.19.10). Prove that `f` is an isomorphism if and only if for every
algebraically closed perfectoid field `K` with an open and bounded valuation subring `K⁺` the map
`f(K, K⁺) : Y'(K, K⁺) → Y(K, K⁺)` is an equivalence of groupoids ([ECD] §12, Lem. 12.5 with proof,
p. 70). This criterion is the tool by which almost every identification of [ECD] §§11–15 is proved,
and it is the analogue for v-stacks of the criterion of [ECD] Prop. 5.3 for perfectoid spaces, which
PerfectoidSpaces layer P4 supplies; the quasicompactness hypothesis is not redundant, by the witness
`⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)` of D4.4. Separately, let `f : Y' → Y` be a map of
small v-sheaves that is either qcqs or between locally spatial v-sheaves. Prove that the following
are equivalent: `f` is an injective map of v-sheaves; `f(K, K⁺)` is injective for all perfectoid
fields `K` with an open and bounded valuation subring `K⁺`; `|f|` is injective and `f` is final
among maps from small v-sheaves whose underlying spaces factor continuously through `|Y'|`,
equivalently `Y' ≅ Y ×_{|Y|̲} |Y'|̲`, the fibre product of `Y` with the sheaf `|Y'|̲` over the sheaf
`|Y|̲` attached to the topological spaces `|Y'|` and `|Y|` ([ECD] §12, Prop. 12.15 with proof, pp.
72–73). The last identification is the form used in [ECD] Prop. 11.20 and Prop. 13.12. *Needs:*
D4.4; D4.7; D4.8; D3.7; D3.10; PerfectoidSpaces layer P4 (the valuative criterion for separatedness,
separatedness of maps of affinoid perfectoid spaces).

`Perf.VStack.isEquivalence_iff_fieldPoints` requires
`Geometry.stackQuasicompact` and `Geometry.stackQuasiseparated`; its conclusion
compares equivalences on all test spaces with equivalences on algebraically closed
`Geometry.FieldPoint p true`. `Perf.VSheaf.isIso_iff_fieldPoints` is its sheaf
form ([ECD] Lemma 12.5 and Remark 12.6, p. 70).
`Perf.IsSmallVSheaf.mono_iff_fieldPoints` gives both the all-field and
algebraically closed-field formulations of injectivity.
`Perf.IsSmallVSheaf.mono_iff_final` states topological injectivity and unique
lifting of every continuous factorization from a small v-sheaf. Both theorems
retain the disjunction: the map is qcqs, or both sheaves are locally spatial
([ECD] Proposition 12.15, pp. 72–73).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.10 Small quotients of v-sheaves

**Small quotients of v-sheaves.** (*small-quotients-and-underlying-spaces*) Let `F` be a small
v-sheaf with a continuous sheaf action of `G̲` for a locally profinite group `G : Type`. Prove that the
v-sheaf quotient `Q = F/G̲` is small and that `|Q|` is homeomorphic to `|F|/G` with the quotient
topology ([GLX] §3, Lem. 3.2, first assertion, pp. 16–17). The relation of the quotient is
`F × G̲ → F × F`, `(x, g) ↦ (x, gx)`, which is injective exactly when the action is free; when
`F = X` is a perfectoid space and the action is free, `X × G̲ ⇉ X` is a pro-étale equivalence
relation (`X × G̲ → X` is pro-étale for `G` locally profinite) and `Q = X/G̲` is a diamond by D4.2,
and when `F` is a diamond with a free action, `Q` is a diamond by the quasi-pro-étale criterion of
D4.3 ([ECD] Prop. 11.8). Smallness follows from composing an atlas of `F` with the quotient
epimorphism (`Perf.IsSmallVSheaf.of_epi`). In [GLX] Lemma 3.2 (v3, p. 16; proof pp. 16–17), the
hypotheses are (1) a locally profinite group `K`, (2) small v-sheaves `F` and `G`, and (3) an action
of `K̲` on `F` with `G = F/K̲`. Its first conclusion identifies the underlying quotient topology;
smallness of `G` is a hypothesis there. Its second conclusion asserts `π₀(G) = π₀(F)/K`, with `π₀`
defined immediately above as connected components with the quotient topology. The `dense_orbits`
Check satisfies (1)–(3): the discrete group `ℤ` is locally profinite, and both `F` and its free
quotient are diamonds, hence small. It disproves that second conclusion. The component formula in
D5.16 therefore includes an additional separation hypothesis. *Needs:* D3.10; D4.7; D4.8; D4.2.

`Perf.Diamond.coequalizerSpace` and `coequalizerSpace_π` identify the realization of a specified
sheaf coequalizer with the topological coequalizer and fix the map on generators. Under the
continuous-map descent hypothesis of D4.5, `coequalizerSpace` is Mathlib's
`PreservesCoequalizer.iso` in the inverse direction, using `spaceFunctor_preservesColimits`;
`coequalizerSpace_π` fixes its value on quotient points. For a sheaf action, the remaining geometric
identification is that the images of the action relation are exactly the pairs `(x, gx)`; this uses
the product-with-`G̲` comparison of D3.10.

**Checks.**

- `quotient_two_point_swap` — on the one-object site with the trivial topology, the sheaf
  coequalizer of identity and swap on `Bool` realizes to one point. This computes the
  nontrivial finite orbit relation.
- `quotient_empty_sheaf` — on that site the coequalizer of the two identities on the empty
  sheaf has empty realization.
- `trivial_group` (degenerate case) — for `G` trivial, `Q = F` and `|Q| = |F|`; for a trivial action
  of any `G`, the coequaliser of two equal maps is again `Q = F`, and `|F|/G = |F|`.
- `dense_orbits` (computation) — for `C` an algebraically closed perfectoid field of characteristic
  `p`, `F = ℤ_p̲ × Spa(C, O_C)` with the discrete group `G = ℤ` acting by translation: the action is
  free, `Q` is a diamond, `|Q| = ℤ_p/ℤ` with the quotient topology, which is indiscrete (a nonempty
  saturated open contains a ball, its complement is a closed union of dense cosets, hence empty) and
  not `T0`, while `π₀(Q)` is a point and `π₀(F)/G = ℤ_p/ℤ` is uncountable; `Q` is quasicompact but
  not quasiseparated.

- `dense_orbits_topology` — the only open subsets of the quotient `ℤ_p/ℤ` are empty
  and full; this computes its topology without assuming a component formula.

The `trivial_group` Check is stated for the sheaf coequalizer of the two equal projections
`H × F → F`, and thus applies to any trivial sheaf action. The geometric `dense_orbits` Check uses a
continuous *sheaf* action and its sheaf coequalizer; the suggested Lean orbit-space computation in
`dense_orbits_topology` only checks the indiscrete topology. The action groupoid, quotient-to-orbit
comparison and geometric quasicompactness and non-quasiseparatedness statements are part of this
target.

**`Perf.Diamond.coequalizerSpace`.** The comparison is fixed on the image of every point of the source of the quotient. The Checks use the constant Boolean sheaf on the point site, comparing identity with negation and with itself.

**Checks.**

- `Perf_Diamond_coequalizerSpace_bool_transposition` — On the point site, the coequalizer of identity and negation on the Boolean sheaf identifies `false` and `true`; its realization has one point.
- `Perf_Diamond_coequalizerSpace_identity_retains_points` — The coequalizer of two identities on the Boolean sheaf has two points, and the comparison keeps their images distinct.
- `Perf_Diamond_coequalizerSpace_distinct_generator` — For the two identity arrows on the Boolean sheaf, the comparison sends the class of `false` to a point different from the topological class of `true`.

`Perf.IsSmallVSheaf.action_quotient` takes a small `Geometry.VSheaf p`, a locally
compact Hausdorff totally disconnected topological group `G : Type`, and a sheaf action whose
section maps are actions of continuous group-valued functions. It gives smallness
of the sheaf coequalizer and a homeomorphism to the orbit space. The induced group
action is fixed on section generators, and the homeomorphism takes the sheaf
quotient of each point to its orbit ([GLX] Lemma 3.2, first assertion, pp. 16–17;
smallness also uses [ECD] Remark 12.2).

**`Geometry.topologicalSheaf` — Checks.** The continuous-map sheaf uses
`ContinuousMap.yonedaPresheaf` and geometric v-descent ([ECD] §10, before Def. 10.12, p. 53).

- `topologicalSheaf_point` — The one-point target has exactly one section on every test.
- `topologicalSheaf_empty` — The empty target has no sections on a nonempty test.
- `topologicalSheaf_two_constants` — The two constant Boolean functions remain distinct on a nonempty test.

**`Geometry.sheafStack` — Checks.** A v-sheaf gives a discrete stack with its original sections.

- `sheafStack_sections` — Each fibre is equivalent to the discrete category of sections.
- `sheafStack_empty` — An empty section set gives an empty fibre.
- `sheafStack_distinct` — Distinct sections are not isomorphic.

**`Geometry.sheafStackMap` — Checks.** A sheaf map acts on the same sections in the discrete stack.

- `sheafStackMap_section` — Its value is the supplied section map.
- `sheafStackMap_identity` — Identity maps fix sections.
- `sheafStackMap_distinct` — A section different from the prescribed image cannot be its value.

**`Geometry.stackQuasicompact` — Checks.** After each affinoid base change, the sheaf
of local isomorphism classes is quasicompact ([ECD] §8, pp. 40–41).

- `stackQuasicompact_identity` — Every stack identity is quasicompact.
- `stackQuasicompact_sheaf` — On sheaf maps this agrees with `TauCetiRoadmap.AdicSpacesPartII.Topos.Hom.IsQuasicompact`.
- `stackQuasicompact_noncompact_fibre` — A nonquasicompact affinoid pullback rules it out.

**`Geometry.stackQuasiseparated` — Checks.** Both the diagonal and its diagonal
are quasicompact ([ECD] Convention 8.4, p. 41).

- `stackQuasiseparated_identity` — Stack identities satisfy the condition.
- `stackQuasiseparated_sheaf` — On sheaf maps this agrees with `TauCetiRoadmap.AdicSpacesPartII.Topos.Hom.IsQuasiseparated`.
- `stackQuasiseparated_double_diagonal` — A nonquasicompact double diagonal is an obstruction even if the first diagonal is quasicompact.

**`Geometry.stackRealized` — Checks.** Realization uses the sheaf of local
isomorphism classes ([ECD] Proposition 12.7 and Definition 12.8, pp. 70–71).

- `stackRealized_sheaf` — A discrete sheaf stack has the sheaf's underlying space.
- `stackRealized_empty` — The initial sheaf has empty realization.
- `stackRealized_two_points` — The product of the two-point sheaf with `Spa(K, O_K)` has exactly two points.

**`Geometry.stackRealizedMap` — Checks.** The map comes from the components of the strong transformation.

- `stackRealizedMap_identity` — Identities induce identities on spaces.
- `stackRealizedMap_composition` — Composition induces composition on spaces.
- `stackRealizedMap_empty_source` — An empty source cannot map surjectively onto a nonempty space.

**`Geometry.stackFieldRelation` — Checks.** Objects become isomorphic after common
field extensions surjective on spectra; plus rings are retained ([ECD] Proposition 12.7, pp. 70–71).

- `stackFieldRelation_identity` — Each field object is related to itself.
- `stackFieldRelation_isomorphic` — Isomorphic objects over the same field give the same point.
- `stackFieldRelation_sheaf` — For discrete stacks this is exactly the sheaf field relation.


**Geometric point realization.** `Geometry.VSheaf` uses the v-topology of the actual
perfectoid category; `Geometry.realized` and `Geometry.realizedMap` specialize the
category-of-elements realization. `Geometry.affinePoint` is its affine valuation-space
comparison, obtained from `YonedaAdicSpace.space_ofSpaY` through the underlying-space isomorphism
of `Geometry.exists_wedhornComparison` by changing universe lifts.
`Geometry.affinePoint_naturality` describes every pair map. For prime `p`, either
characteristic convention, and `K : Geometry.FieldPoint p c`,
`Geometry.affinePoint_closed_point` identifies the valuation at any closed point:
`|a(x)| ≤ 1` exactly when `a ∈ K⁺` ([ECD] §5, Example 5.2, pp. 21–22).
`Geometry.FieldSection` consists of a complete perfectoid field pair and a section.
`Geometry.fieldRelation` identifies sections after extension to a common field with
surjective maps of field spectra. `Geometry.fieldSetoid` and `Geometry.Points` form the
resulting quotient. Surjectivity prevents a strict generalization from being identified
with its specialization; field automorphisms still identify reparametrizations of the same
geometric point ([ECD] Proposition 11.13 and Definition 11.14).
`Perf.Diamond.space_eq_points` fixes the comparison on the closed point of each field
spectrum. `Geometry.continuousMap_isSheaf` supplies continuous-map descent for the atlas
quotient comparison ([ECD] Propositions 11.13 and 12.7). In
`Perf.IsSmallVSheaf.relation_locallySpatial`, the base v-sheaf is quasiseparated and the
atlas is locally spatial ([ECD] Proposition 12.3).

**Geometric carrier Checks.** The following contracts specialize the definitions to
`Geometry.Perf`, `Geometry.Perfd` and the supplied Yoneda-adic spaces.

**`Geometry.fieldRelation` — Checks.**

- `field_relation_identity` — A section agrees with itself over the unchanged field.
- `field_relation_surjective_extension` — Pullback along a surjective field-spectrum extension preserves the point class.
- `field_relation_field_automorphism` — Reparametrizing a field-valued section by a field automorphism does not change its point class.

**`Geometry.fieldSetoid` — Checks.**

- `field_quotient_extension` — A surjective field extension has the same quotient class.
- `field_quotient_no_empty_sections` — A sheaf with no field-valued sections has an empty point quotient.
- `field_quotient_distinct_geometric_points` — Sections whose closed points have distinct images in the geometric realization remain distinct in the quotient.

**`Geometry.affinePoint` — Checks.**

- `affine_point_map_normalization` — The affine homeomorphism commutes with valuation pullback.
- `affine_point_zero_spectrum` — On the zero pair, the affine space is empty and the range of `affinePoint` is empty.
- `affine_point_separates_valuations` — Supplier coordinates send a valuation `x` to `x`; a different valuation `y` does not map to `x`.
- `affinePoint_closed_point_value` — At a closed point of a perfectoid field spectrum, the valuation unit ball is exactly the chosen plus ring.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D4.11 Proper maps of v-stacks

**Proper maps of v-stacks.** A map `f : Y' → Y` of v-stacks is proper if it is quasicompact,
separated in the sense of D3.8 (its diagonal is a closed immersion) and universally closed: for
every small v-sheaf `X → Y` the map `|Y' ×_Y X| → |X|` of underlying spaces (D4.8) is closed, which
may be tested on strictly totally disconnected perfectoid `X` ([ECD] Definition 18.1, p. 101). This
is the convention used by D5.10 and D6.7; it is not the properness of algebraic stacks in
SchemeAndStackFoundations §1.20, and neither the six operations nor the canonical compactification
is needed for it. Prove: closed immersions are proper; proper maps compose and are stable under base
change; `f` is proper iff it is 0-truncated, quasicompact and quasiseparated, and every map
`Spa(K, K⁺) → Y` together with a lift of its restriction to `Spa(K, O_K)` admits a unique lift
([ECD] Remark 18.2, Proposition 18.3, p. 101); for `G : ProfiniteGrp.{0}` with a continuous sheaf
action of `G̲` on a small v-sheaf `X`, the quotient map `X → X/G̲` is quasicompact and universally
closed ([Berkeley] proof of Lemma 18.1.2, p. 162). The group lies in the ring universe of the
charts, as in D3.10 and D4.10; a bound below a cutoff in `Cardinal.{1}` alone does not imply this
hypothesis. *Needs:* D3.8; D4.7; D4.8; D4.10.

**Checks.**

- `s4_11_identity_and_closed_immersion` — identities and closed immersions are proper.
- `s4_11_rank_two_open_point` (non-example) — for `K⁺` of rank two, the open immersion
  `Spa(K, O_K) → Spa(K, K⁺)` is quasicompact and separated but not proper: its image is the open
  point, which is not closed, and the identity of `Spa(K, K⁺)` has no lift through it, so the
  valuative criterion fails as well.
- `s4_11_discrete_naturals` (non-example) — `ℕ̲ × S → S` for discrete `ℕ` and nonempty `S` is
  separated and not quasicompact, hence not proper (D5.10).
- `s4_11_charted_profinite_translation` — for `G : ProfiniteGrp.{0}` and
  `P = Spa(C, O_C)` with `C : Type` algebraically closed and perfectoid of characteristic `p`,
  translation on `G̲ × h_P` has quotient `h_P`. Its projection is quasicompact and universally
  closed, including for infinite `G`; the source is the charted affinoid product of D3.10.
- `s4_11_large_profinite_quotient` (non-example) — let `G = Type → ZMod 2` with its compact
  product topology and take `P` as above. Translation on `F = G̲ × h_P` is a free continuous
  sheaf action with quotient `h_P`. The charted affinoid products `A̲ × P`, for all closed
  `Small.{0}` subsets `A ⊆ G`, jointly cover `F`: a continuous map from an affinoid test has
  small compact image in the Hausdorff group `G`. Their `Type 1`-indexed disjoint union is a
  charted perfectoid atlas, so `F` is a small v-sheaf. No finite subfamily is epimorphic:
  its union is still `Small.{0}` and misses an element of `G`, whose constant section over
  `P` cannot lift even v-locally. Thus `F` is not quasicompact and `F → h_P` is not
  quasicompact, as in D5.3's large-index Check. The boundary statement
  `s4_11_large_profinite_quotient` is the finite-union obstruction.

Lean: none; the boundary statement and the geometric statements are specified in the README only.

### Examples

The worked examples of this layer are the checks above: a characteristic `p` perfectoid space as a
diamond with the diagonal relation; the quotient of `S̲ × Spa(C, O_C)` by a free action of a finite
group on the profinite set `S`, a diamond that is a perfectoid space; the compact Hausdorff diamonds
`T̲ × Spa(K, O_K)` for `T : CompHaus.{0}` with underlying space `T`, not spectral for `T` the
unit interval, and `S̲ × Spa(K, O_K) = Spa(C⁰(S, K), C⁰(S, O_K))` for `S : Profinite.{0}`;
the refusal to define diamonds as
v-sheaves with a perfectoid surjection, which are the small v-sheaves; the independence of the
underlying space from the presentation and the classical open-subset correspondence for a perfectoid
space; the classifying stack `BG` of a nontrivial locally profinite `G : Type` as a small v-stack that is
not a v-sheaf; a quasicompact v-sheaf as small with no further hypothesis; a quasi-pro-étale map
from a perfectoid space that is surjective on underlying spaces without being a surjection of
v-sheaves, the non-example for the quasicompactness hypothesis of [ECD] Lem. 12.11, realised by
`⊔_{n ∈ ℤ_p} Spa(C, O_C) → ℤ_p̲ × Spa(C, O_C)`, which is also the witness that the isomorphism
criteria of D4.4 and D4.9 need quasicompactness; the total relation `X × X` on
`X = Spa(K₀, O_{K₀})`, which is not pro-étale and whose quotient `*` is not a diamond; the two
presentations of `Spa(C, O_C)` with the same one-point space; and the quotient of
`ℤ_p̲ × Spa(C, O_C)` by the translation action of `ℤ`, a diamond whose underlying space `ℤ_p/ℤ` is
indiscrete; and, for proper maps, the closed immersions against the rank-two open immersion
`Spa(K, O_K) → Spa(K, K⁺)` and the non-quasicompact `ℕ̲ × S → S`.

The three `compHaus_large_cube_dense`, `compHaus_large_cube_not_closed` and
`compHaus_large_cube_small_preimage` boundary statements and `s4_11_large_profinite_quotient` are
the size obstructions on pinned topological carriers. They and the diamond statements, which
require the pro-étale morphisms of PerfectoidSpaces P6, are specified in the README only.

### Dependencies

Layer D0: surjective generalizing spectral maps as quotient maps (AdicSpacesPartII R0.19.4),
profinite presentations of compact Hausdorff spaces and extremally disconnected covers (D0.16),
quasicompact and quasiseparated objects and morphisms in a topos and algebraic topoi
(AdicSpacesPartII R0.19.10) and 2-fibre products of stacks and quotients of groupoid objects
(D0.26). Layer D1: strictly totally disconnected perfectoid spaces (D1.4) and pro-constructible
generalizing subsets of a totally disconnected space as affinoid perfectoid spaces (D1.5). Layer D2:
the big pro-étale site of perfectoid spaces (D2.1), the small pro-étale site and the v-site (D2.2),
cutoff independence and small sheaves (D2.3) and v-descent of functions (D2.7). Layer D3: effective
v-descent for separated pro-étale perfectoid spaces over a strictly totally disconnected base
(D3.4), étale, finite étale and quasi-pro-étale morphisms of pro-étale stacks (D3.6),
ind-representability of sub-v-sheaves of a totally disconnected space and quasicompact injections
(D3.7), v-local checking of the morphism classes on the target (D3.9) and torsors under a locally
profinite group with their pro-étale presentation (D3.10). PerfectoidSpaces layer P1 (perfectoid
Tate rings and algebras), layer P2 (fibre products of perfectoid spaces, completed residue fields),
layer P4 (the injection of residue-field points, the valuative criterion for separatedness,
separatedness of maps of affinoid perfectoid spaces), layer P5 (cofiltered limits of affinoid
perfectoid spaces) and layer P6 (pro-étale maps, pro-étale stability and limits, `κ`-small
perfectoid spaces, the product with a profinite set). Mathlib `CategoryTheory.Sheaf`,
`CategoryTheory.GrothendieckTopology`, `CategoryTheory.Functor.IsRepresentable`,
`Continuous.isClosedMap` and `Topology.IsClosedMap.isQuotientMap`. Proper maps (D4.11) use the
separated maps of D3.8 and the underlying spaces of D4.8.

## Layer D5: spatial geometry and Hausdorff reduction

The layer builds the spatial part of the theory of diamonds and the Hausdorff reduction of the
non-spatial part. It first defines spatial and locally spatial small v-sheaves, with the spatial
diamonds as the diamonds among them, and proves the permanence of these notions under quasicompact
injections and finite étale maps; it then constructs cofiltered limits of diamonds and of small
v-sheaves with their finite-stage étale comparisons, and from these the universally open strictly
totally disconnected presentation of a spatial diamond with its converse, which in turn gives
quasi-pro-étale and fibre-product permanence. On this basis it proves the two-out-of-three property
for quasi-pro-étale maps, the local structure of étale maps of locally spatial diamonds, the
localization of a spatial diamond at a point, the locally closed generalizing subdiamonds, profinite
products, and the criterion that a spatial v-sheaf with enough quasi-pro-étale points is a spatial
diamond. The early localization at a point needed for finite étale permanence is distinct from the
later inverse-limit localization, which rests on the limit theorem whose proof already needs finite
étale permanence. The layer then turns to relative representability in diamonds and in (locally)
spatial diamonds, the Berkovich spectrum of a complete Tate ring, built here before it is extended
to small v-sheaves, the maximal Hausdorff quotient of a small v-sheaf, and the representability of a
qcqs separated diamond over its maximal Hausdorff quotient together with the cohomology
comparison; relative representability and Hausdorff reduction use the ordinary sheaf theory of layer
D0. It closes with the component formula for restricted group quotients.

### D5.1 Spatial v-sheaves and spatial diamonds

For site-level constructions, use the intrinsic realization `Perf.Diamond.spaceFunctor` of D4.5,
formed from the spaces of test objects and their sections. `Perf.VSheaf.IsOpenImmersion` requires
monicity and an open subset whose image condition characterizes the sections that lift uniquely.
Thus neither the sheaf-space functor nor the open-immersion predicate is an independent parameter.
The geometric instance is `Geometry.Perf p`, the charted characteristic-`p` perfectoid spaces,
which `Geometry.exists_wedhornComparison` identifies with the perfectoid open-chart subcategory of
the supplied Yoneda-adic spaces. `Geometry.vTopology p` uses its actual valuation-space functor. For maps between
diamonds, `Perf.Diamond.isOpenImmersion_iff` equates the sectionwise predicate with
`(Geometry.openImm p true).presheaf f.hom`: each pullback to a perfectoid test object is represented
by a geometric open immersion. For maps between small v-sheaves,
`Perf.IsSmallVSheaf.isOpenImmersion_iff` gives the same equivalence ([ECD] Definition 10.7(i), p.
51; Propositions 11.15, p. 60, and 12.9, p. 71). `isSpatial_of_perfectoid` identifies spatiality of
a representable with qcqs of its perfectoid space. The field-spectrum and perfectoid-chart Checks
use these geometric carriers; the one-object-site Checks test the general definitions.

**Checks.**

- `isOpenImmersion_iff_identity` — The identity of a small v-sheaf satisfies both open-immersion predicates.
- `isOpenImmersion_iff_empty` — The map from the initial sheaf to a small v-sheaf satisfies both predicates.
- `isOpenImmersion_iff_duplicate_sections` — A map identifying distinct sections fails both predicates, regardless of its topological image.

The first two subsections establish spatiality, quasicompact injections and finite étale permanence.

**Spatial and locally spatial v-sheaves.** (*spatial-diamond*) A small v-sheaf `Y` (D4.7) is spatial
if it is quasicompact and quasiseparated in the sheaf-theoretic sense and `|Y|` (D4.8) admits a
basis of open subsets given by the images `|U|` of quasicompact open subfunctors `U ⊆ Y`; `Y` is
locally spatial if it is small and admits a cover by spatial open subfunctors ([ECD] Definition
12.12, p. 72; [Berkeley] Definition 17.3.1, pp. 152–153). The definition asks for no diamond
structure, and a spatial v-sheaf is not assumed to be a diamond; D5.11 is the criterion for that.
The condition is on the quasicompact open subfunctors and not only on the topology of `|Y|`:
spectrality of the underlying space alone does not define spatiality, and the basis must consist of
qc open subfunctors with qc and qs in the sheaf-theoretic sense. Quasicompactness and
quasiseparatedness are meant in the topos sense of AdicSpacesPartII R0.19.10, applied to the v-topos
of `Perf`. Prove ([ECD] Propositions 12.13–12.14, p. 72): for `Y` spatial (respectively locally
spatial), `|Y|` is spectral (respectively locally spectral), quasicompact open subfunctors are
spatial (respectively open subfunctors are locally spatial), `Y` is quasicompact, respectively
quasiseparated, exactly when `|Y|` is, and for every map `Y' → Y` of locally spatial v-sheaves the
map `|Y'| → |Y|` is locally spectral (`IsLocallySpectralMap`, AdicSpacesPartII R0.0) and
generalising, so the generalisations of a point form a chain; it is `IsSpectralMap` when `Y'` and
`Y` are spatial, by AdicSpacesPartII R0.0, and not in general.

**Spatial and locally spatial diamonds.** A diamond is (locally) spatial if it is a (locally)
spatial v-sheaf. Prove that this agrees with [ECD] Definition 11.17, p. 61, where the basis is
formed by quasicompact open subdiamonds: open subfunctors of a diamond are diamonds (D4.4), so the
two bases coincide. The diamond statements of [ECD] Propositions 11.18–11.19, pp. 61–62, are then
the cases of the previous paragraph. Every perfectoid space is locally spatial, and it is spatial
exactly when it is qcqs. Define `Perf.VSheaf.IsSpatial` as smallness, qcqs and the basis condition
for a v-sheaf, together with `Perf.VSheaf.IsLocallySpatial`, which includes smallness and a spatial
open cover; then define `Perf.Diamond.IsSpatial` as the predicate on a diamond that it is a spatial
v-sheaf, and `Perf.Diamond.IsLocallySpatial` as the predicate that `Y` is a diamond and has an open
cover by spatial diamonds; prove `Perf.Diamond.IsSpatial.spectralSpace` (`|Y|` is a spectral space,
and locally spectral in the locally spatial case), `Perf.Diamond.IsSpatial.quasicompactOpen` (a
quasicompact open subfunctor of a spatial diamond is spatial),
`Perf.Diamond.IsLocallySpatial.isLocallySpectralMap` (for `Y'` locally spatial over `Y`, the induced
map `|Y'| → |Y|` is locally spectral and generalizing in the sense of AdicSpacesPartII R0.0, and
`IsSpectralMap` when both are spatial), `Perf.Diamond.IsLocallySpatial.qcqs_iff` (`Y` is
quasicompact, respectively quasiseparated, exactly when `|Y|` is),
`Perf.Diamond.isSpatial_of_perfectoid` (a perfectoid space is locally spatial, and spatial exactly
when qcqs) and `Perf.Diamond.IsLocallySpatial.generalizations_totallyOrdered` (the set of
generalizations of a point of `|Y|` is totally ordered). The suggested Lean predicate
`Perf.Diamond.IsSpatial` is the conjunction of `Diamond` with `Perf.VSheaf.IsSpatial`, and
`Perf.VSheaf.IsSpatial` is the conjunction of smallness, quasicompactness, quasiseparatedness and
the basis condition, so no spatial object fails quasiseparatedness: that is part of the definition,
not a theorem ([ECD] §11, Def. 11.17, p. 61, the definition, with the remark following it for
perfectoid spaces; [ECD] §11, Prop. 11.18 and Prop. 11.19, pp. 61–62, the spectrality,
open-subfunctor, spectral-map, qcqs and totally-ordered-generalizations statements; [ECD] §12, Def.
12.12 and Prop. 12.13, p. 72, the v-sheaf version, which carries no diamond structure; D5.11 is the
criterion for a spatial v-sheaf to be a diamond). *Needs:* D4.5; D4.1; D4.4; D4.7; D4.8;
AdicSpacesPartII R0.19.10; AdicSpacesPartII R0.0; D0.9; D4.6.

**Checks.**

- `qcqs_perfectoid` (degenerate cases) — a qcqs perfectoid space is a spatial diamond; a
  non-quasicompact one is locally spatial and not spatial.
- `compact_hausdorff_not_spatial` (non-example) — `T̲ × Spa(K, O_K)` for `T : CompHaus.{0}` and
  not profinite is qcqs and not spatial; this is the non-example separating the notions.
- `space_is_spectral` (non-example) — spatiality implies spectrality of `|Y|`; the required basis
  consists of qc open subfunctors, not merely arbitrary topological opens, so a definition asking
  only that `|Y|` be spectral is wrong.
- `open_subfunctor` (characterisation) — quasicompact open subfunctors of a spatial diamond are
  spatial, and the `|U|` form a basis.
- `empty_and_point` (degenerate) — the empty diamond is spatial (qcqs, and `|∅| = ∅` has the basis
  `{∅}` given by the quasicompact open `∅ ↪ ∅`); `Spa(C, C⁺)` is spatial for every open and bounded
  valuation subring `C⁺ ⊂ C`, with `|Spa(C, C⁺)|` the chain of prime ideals of `C⁺` containing the
  ideal of topologically nilpotent elements, and its generalizations are totally ordered as the
  definition requires.
- `frobenius_quotient_not_spatial` (non-example) — for a perfectoid field `K` of characteristic `p`,
  the quotient of `Spa(K, O_K)` by the powers of Frobenius has one point and is not quasiseparated,
  hence not spatial ([Berkeley] Example 17.3.3, p. 153).
- `local_predicate_for_maps` — for `f : ⊔_ℕ Spa(C, O_C) → Spa(C, O_C)`, `|f|` is the map from
  discrete `ℕ` to a point, locally spectral and not `IsSpectralMap`, so the local predicate is the
  right one for maps of locally spatial v-sheaves.

The following additional Checks use the one-object discrete category, its trivial topology,
and the one-point underlying test space. Its sheaves are sets and their realizations are discrete.
This category has no empty test object and no two-point test object, so a single representable
atlas exists precisely for a singleton sheaf.

- `open_identity` — the identity has the whole open as its sectionwise image.
- `open_iso` — an isomorphism also has the whole open and unique lifts.
- `open_duplicate_section` — two distinct sections with the same image exclude an open immersion.
- `spatial_finite_set_site` — a finite set gives a spatial sheaf exactly when it is equivalent to
  `PUnit`: finiteness supplies qcqs and a singleton-open basis, but only a singleton has an atlas.
- `spatial_empty_set_site` — the empty sheaf is not spatial: its realization is empty, but it has
  no representable atlas on this site.
- `spatial_infinite_set_site` — the sheaf `ℕ` is not spatial: its singleton cover has no finite subcover.
- `local_vsheaf_point` — the singleton is small and locally spatial.
- `local_vsheaf_empty_has_no_atlas` — the empty sheaf fails the smallness clause on this site.
- `local_vsheaf_two_has_no_atlas` — the two-element sheaf also fails that clause, although its
  singleton opens form a spatial cover.
- `spatial_diamond_point` — when every test morphism is pro-étale, the representable point is spatial.
- `spatial_diamond_two_no_atlas` — the two-element sheaf has no single representable quotient atlas,
  so it is neither a diamond nor a spatial v-sheaf on this site, despite being qcqs with a
  singleton-open basis.
- `spatial_diamond_no_proet` — an empty pro-étale morphism class excludes every diamond presentation.
- `locally_spatial_two` — a cover by spatial points does not make the two-element sheaf a diamond on the point site.
- `locally_spatial_naturals` — the natural-number sheaf has a spatial-point cover but is not a diamond on the point site.
- `locally_spatial_empty` — the empty sheaf has an empty cover but no representable diamond atlas on the point site.

**`IsSpatial`.** Spatiality combines smallness, qcqs and a basis of quasi-compact open subobjects.
Smallness is explicit for a supplied site: topos-theoretic quasicompactness alone need not supply
a representable atlas. On the perfectoid v-site this agrees with [ECD] Def. 12.12, p. 72;
Remark 12.2, pp. 69–70, supplies smallness from quasicompactness there.

**Checks.**

- `definition_VSheaf_IsSpatial_1` — The singleton sheaf on the point test site is spatial.
- `VSheaf_IsSpatial_empty_realization` — With the underlying-space functor constantly empty, the singleton sheaf is spatial; its smallness and qcqs conditions still concern the sheaf.
- `VSheaf_IsSpatial_missing_basis` — With constant discrete Bool as test space, the singleton sheaf has an atlas but is not spatial: section images cannot supply a basis containing either singleton open.

**`IsLocallySpatial`.** The v-sheaf predicate includes a smallness condition as well as spatial open charts.

**Checks.**

- `VSheaf_IsLocallySpatial_empty_realization` — The singleton sheaf with empty test space is covered by its spatial identity chart.
- `VSheaf_IsLocallySpatial_indiscrete_realization` — The singleton sheaf with indiscrete Bool as test space is locally spatial: the whole image is a basis, so the categorical predicate does not impose T₀ on an arbitrary realization functor.
- `VSheaf_IsLocallySpatial_missing_basis` — With discrete Bool as test space, the singleton sheaf has no spatial open cover; smallness alone does not suffice.

**`IsSpatial`.** A spatial diamond must have a pro-étale quotient presentation as well as a spatial underlying v-sheaf.

**Checks.**

- `Diamond_IsSpatial_empty_realization` — The singleton sheaf has a diagonal diamond presentation and is spatial even when the test space is empty.
- `definition_Diamond_IsSpatial_2` — The empty sheaf on the one-object point site is not spatial because it has no
  quotient atlas.
- `definition_Diamond_IsSpatial_3` — The singleton sheaf on the one-object point site fails spatial diamondhood when no arrow is
  pro-étale.

**`IsLocallySpatial`.** Diamondhood and an effective open cover by spatial diamonds are both required; the cover may be infinite.
On `Geometry.Perf p`, `Perf.Diamond.of_openCover` says that an effective family of open immersions with diamond sources has a diamond target ([ECD] Proposition 11.6, p. 56).

**Checks.**

- `Diamond_IsLocallySpatial_missing_basis` — With discrete Bool as test space, the natural-number sheaf has no spatial open charts covering its sections; the open-basis condition cannot be discarded.
- `Diamond_IsLocallySpatial_empty_realization` — The singleton sheaf with empty test space has a spatial identity chart when every arrow is allowed.
- `definition_Diamond_IsLocallySpatial_3` — With no pro-étale arrows the singleton sheaf admits no
  spatial cover.

**`Perf.VSheaf.IsOpenImmersion`.** On the point site realization is discrete, so open immersions distinguish inclusions from maps which identify sections.

**Checks.**

- `Perf_VSheaf_IsOpenImmersion_point_inclusion` — The inclusion of one point in two discrete points is an open immersion.
- `Perf_VSheaf_IsOpenImmersion_empty_inclusion` — The empty subsheaf is open in the two-point sheaf.
- `Perf_VSheaf_IsOpenImmersion_bool_projection_failure` — The projection from two points to one is not an open immersion despite its open image.

`Perf.Diamond.IsLocallySpatial.locallySpectral` states the locally spectral conclusion on
`Geometry.VSheaf p`. Together with `Perf.Diamond.IsSpatial.spectralSpace`,
`Perf.Diamond.IsSpatial.quasicompactOpen` and `Perf.Diamond.IsLocallySpatial.isLocallySpectralMap`,
it uses the actual perfectoid v-site; the last statement assumes both source and target locally
spatial ([ECD] 11.18–11.19, pp. 61–62).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.2 Quasicompact injections and finite étale permanence

**Quasicompact injections and finite étale maps into a (locally) spatial object.**
(*injection-and-finite-etale-permanence*) Let `Y` be a locally spatial diamond and `f : Y' → Y` a
quasicompact injection of v-sheaves. Then `Y'` is a locally spatial diamond, `|Y'| ⊂ |Y|` is
pro-constructible and generalizing with the subspace topology, and `Y'` is the sub-v-sheaf of `Y` of
maps whose underlying image lies in `|Y'|`, the image-constrained sub-v-sheaf construction, which
D5.9 studies for locally closed generalizing subsets and which [ECD] writes `Y ×_{|Y|} |Y'|`; no
underlined space of the locally spectral space `|Y|` is involved. If instead `Y` is a (locally)
spatial diamond and `Y' → Y` is a finite étale map of pro-étale sheaves, then `Y'` is a (locally)
spatial diamond; the same holds with "diamond" replaced by "v-sheaf" and `Y` spatial. The hypothesis
that `Y` is locally spatial is used: spatiality is not automatic for a quasicompact injection into a
non-spatial diamond, and in the injection case quasicompactness of `f` is needed. The finite étale
statement is proved by a local analysis of `|Y'|` as a tree over `|Y|` and does not use the
universally open presentation, which is why it precedes it; it is what makes the étale covers used
in the universally open presentation spatial. The v-sheaf version of the finite étale statement,
[ECD] Lem. 12.16, has the identical proof and is needed before the criterion of D5.11 identifies the
two notions. Finite étale permanence needs an early localization at a point, ahead of the spatial
limit theorem: intersect the qc open neighbourhoods of the point as a sub-v-sheaf and show that its
pullback to a strictly totally disconnected atlas is the pro-constructible generalizing perfectoid
subspace of that atlas; prove the finite étale spectral-tree argument there and spread it out to a
qc neighbourhood. The later inverse-limit localization of D5.8 uses the spatial limit theorem, whose
proof already needs finite étale permanence, so it cannot serve as this earlier input ([ECD] §11,
Prop. 11.20 with proof, p. 62, the injection case; [ECD] §11, Lem. 11.21 and §12, Lem. 12.16, pp.
62, 73, the finite étale case and its v-sheaf analogue, whose proof [ECD] repeats verbatim).
*Needs:* D5.1; D3.7; D4.9; D1.5; D4.3; D0.9; AdicSpacesPartII R0.19.2.

`Perf.Diamond.quasicompactInjection` states all four conclusions for a monomorphism
with quasicompact fibres over a locally spatial diamond: local spatiality, an embedding
with pro-constructible generalizing image, and unique factorization of precisely the
maps whose image lies there. `Perf.Diamond.finiteEtale_spatial` gives both the spatial
and locally spatial finite étale assertions; `Perf.VSheaf.finiteEtale_spatial` gives the
spatial v-sheaf assertion ([ECD] 11.20–11.21 and 12.16, pp. 62–63, 73).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.3 Cofiltered limits and finite-stage étale comparisons

The next three subsections construct spatial limits and universally open presentations and use them
to prove quasi-pro-étale permanence.

**Cofiltered limits of diamonds and of small v-sheaves, and finite-stage étale comparisons.**
(*limits-and-finite-stage-comparisons*) Let `(Y_i)` be a cofiltered inverse system of diamonds with
qcqs transition maps, indexed by a cofiltered category `I` whose total arrow type `Arrow I`
(equivalently `Σ i j : I, i ⟶ j`) is `Small.{0}`, and `Y` its ambient v-sheaf limit. The hypothesis
allows reindexing by a category with objects and morphisms in `Type`, even when `I` was given in a
larger universe. Then `Y` is a diamond, `|Y| → lim |Y_i|` is a continuous bijection, and the maps
`Y → Y_i` are qcqs; if all `Y_i` are (locally) spatial then so is `Y`, and `|Y| → lim |Y_i|` is a
homeomorphism. The size of the limit, with explicit bounds on the index category and the stages, is
the separate target below; it uses the third clause of the cutoff cardinal theorem of D0.23, not
merely the strong-limit condition. For a cofiltered system of qcqs diamonds, base change gives
equivalences from the 2-colimit of the categories of finite étale, of qcqs étale, and of
quasicompact separated étale objects over the `Y_i` to the corresponding categories over `Y`; in
these étale statements all maps are locally separated by [ECD] Convention 10.2, which is what makes
the reduction to the quasicompact separated case possible. The same statements hold for small
v-sheaves, where they are [ECD] Lem. 12.17 and are proved the same way with spatial diamonds in
place of strictly totally disconnected spaces. The proof of the limit statement uses ordinal chains
of cofiltered subdiagrams for the cardinal induction, with a countable cofinal sequence in the
countable case. For the finite-stage equivalences one proves essential surjectivity and descent of
morphisms, then passes from finite étale and qc separated étale objects to qcqs étale objects by
finite open gluing. These comparisons are what make the iterated constructions of the universally
open presentation (D5.4) and of the spatial v-sheaf criterion (D5.11) terminate ([ECD] §11, Lem.
11.22 with proof, pp. 63–64, the limit statement with its smallness clause; [ECD] §11, Prop. 11.23
and Lem. 12.17, pp. 64, 73–74, the finite-stage comparisons in the diamond and in the small v-sheaf
case). *Needs:* D5.1; D5.2; AdicSpacesPartII R0.19.6; D0.23; D3.5; D4.7; PerfectoidSpaces layer P5
(finite-stage descent of qcqs étale objects); D0.14.

**Checks.**

- `constant_system` (degenerate) — for the constant system `Y_i = Y₀` with identity transition maps,
  the limit is `Y₀`, `|Y₀| → lim |Y_i| = |Y₀|` is the identity, and the finite-stage comparisons are
  identities.
- `empty_diagram` (non-example) — the empty category is not cofiltered. Its limit among v-sheaves is
  the terminal sheaf `Spd 𝔽_p`, which is not a diamond and is not quasiseparated (D2.4), despite
  having one underlying point. Thus neither the diamond nor the spatial limit assertion extends to
  empty diagrams.
- `profinite_fibre` (computation) — for `Y_i = S_i̲ × Spa(C, O_C)` along a cofiltered system of
  finite sets `S_i` indexed by `I : Type` with `SmallCategory I`, with limit `S`, the limit is
  `S̲ × Spa(C, O_C)` and `|Y| = S = lim S_i`.

**Size of the limit.** Let `κ` be a cutoff cardinal (`IsCutoffCardinal`, D0.23) and call a v-sheaf
`κ'`-small if it receives a surjection from a charted perfectoid space satisfying PerfectoidSpaces
`IsKappaSmall κ'`. In addition to `Small.{0} (Arrow I)` and the qcqs transition hypotheses above,
assume (a) the index category has fewer than `κ` arrows, the count of
PerfectoidSpaces `HasKappaSmallPresentation`; and (b) one cardinal `κ' < κ`, the same for all `i`,
has every `Y_i` `κ'`-small. Then `Y` is `κ`-small, at the same cutoff `κ` ([ECD] Lemma 11.22, last
assertion and its proof, p. 63; Lemma 12.17, p. 73). The estimate for the limit of the chosen covers
is PerfectoidSpaces P5.7 (fewer than `λ < κ` arrows and stages bounded by a strong limit below `κ`
give a `κ`-small limit), and the cutoff property supplies a strong limit in `[κ', κ)` of cofinality
above `λ`; this is where the third clause of the cutoff cardinal theorem of D0.23 is used, not
merely the strong-limit condition. Hypothesis (b) is a bound uniform in `i`: PerfectoidSpaces
`IsUniformlyKappaSmall` bounds one space, and a stagewise `IsKappaSmall κ` for every `i` does not
suffice. When the index category has fewer than `cf κ` arrows, (b) follows as soon as every `Y_i`
receives a surjection from a uniformly `κ`-small perfectoid space (`IsUniformlyKappaSmall κ`), for
instance a quasicompact `κ`-small one (PerfectoidSpaces P6.2).

**Checks.** For the first two cardinal controls take `κ = Cardinal.lift κ₀` for a cutoff
`κ₀ : Cardinal.{0}`, and all sets and indexing categories in the chart universe `Type`.

- `s5_3_many_finite_stages` (control for (a)) — over a perfectoid field `K` with `#K < κ`, let `J`
  run through the finite subsets of a set `I` with `#I ≥ κ` and put `Y_J = {0,1}^J × Spa(K, O_K)`, a
  finite disjoint union of copies of `Spa(K, O_K)`, with finite étale transitions; (b) holds and (a)
  fails, and the limit `{0,1}^I × Spa(K, O_K)` has `2^{#I} > κ` points, so it is not `κ`-small.
- `s5_3_nonuniform_stages` (control for (b)) — for singular `κ` with `cf κ = ω₁`, choose sets `I_α`,
  `α < ω₁`, with `#I_α` cofinal in `κ`, and index by the finite subsets `J` of `ω₁` the stages
  `{0,1}^{⊔_{α ∈ J} I_α} × Spa(K, O_K)`; each stage is `κ`-small and (a) holds, but (b) fails, and
  the limit has `2^κ` points.
- `s5_3_large_index_not_chart_small` (control for the lower universe) — Let `I = Type`,
  `P = Spa(C, O_C)` for a small algebraically closed characteristic-`p` perfectoid field, and
  `Y_J = P × underline(Bool^J)` for finite `J ⊆ I`. Each stage is charted and spatial, with finite
  étale transitions. A sufficiently large cutoff `κ : Cardinal.{1}` satisfies (a) and (b), but
  the total arrow type is not `Small.{0}`. The ambient sheaf limit is
  `F = P × underline(Type → Bool)`. It is not quasicompact on the charted site: the maps
  `P × A̲ → F` over all closed profinite `Small.{0}` subsets `A` are jointly epimorphic, since
  an affinoid test has small compact image in the profinite factor. No finite subfamily is
  epimorphic, since its union is still small and omits a point with a constant section.
  Thus `F` is not spatial and `F → P` is not qc. Its ambient perfectoid realization is precisely
  D1.11's `hasAffinoidCharts_proEtale_large_profinite`, which lies outside `Geometry.Spaces`.

**Charted affinoid limits.** For prime `p`, either `c`, a cofiltered diagram of affinoid perfectoid
spaces in `Perfd.{1} p` with charted stages and `Small.{0} (Arrow I)`, prove
`Geometry.hasAffinoidCharts_cofilteredLimit`: the supplier's affinoid limit is charted, and its
resized spectrum represents the limit of the stage representables on `Geometry.Spaces p c`. Choose a
stage and a pseudouniformizer there, and use its images on the cofiltered tail. After resizing the
index and stage pairs, the filtered colimit of their integral rings is `Small.{0}`; its `ϖ`-adic
completion and inversion remain small by the sequence bound of D0.24. PerfectoidSpaces P5.1–P5.4 and
AdicSpacesPartII R0.19.5–R0.19.8 supply the pair, its limit property, its topology and finite-stage
opens; D1.11's carrier resizing transports that limit to the charted category. Products used in the
proof of D5.3 are limits over finite subsets of a `Small.{0}` family, and the ordinal subdiagrams of
D0.14 and their countable cofinal sequences also have `Small.{0}` total arrow types. Apply this
bridge to the affinoid covers and relations in [ECD] Lemma 11.22 and Lemma 12.17, rather than
transporting unrestricted `Perfd.{1}` limits ([ECD] Proposition 6.5, p. 29; Lemma 11.22 with proof,
pp. 63–64; Lemma 12.17 with proof, pp. 73–74). *Needs:* D0.14; D0.24; D1.11; PerfectoidSpaces
P5.1–P5.4; AdicSpacesPartII R0.19.5–R0.19.8.

**Checks.**

- `chartedLimit_constant` — A constant diagram on the lift of a small perfectoid pair returns that
  chart, with the identity section map.
- `chartedLimit_boolean_Type` — For `I : Type`, the finite products `P × underline(Bool^J)` have
  charted limit `P × underline(I → Bool)` with the finite-coordinate projections.
- `chartedLimit_boolean_large` — For `I = Type`, the same construction in `Perfd.{1}` is excluded
  by the arrow hypothesis and gives the non-charted object of D1.11's large-profinite Check.

**Smallness of finite-subset indices.** Prove `small_finset_arrow_iff`: for `I : Type u`, the
reverse-inclusion category `(Finset I)ᵒᵖ` has `Small.{0}` total arrow type exactly when
`Small.{0} I`. Finite subsets and inclusion witnesses preserve smallness, and singleton identity
arrows inject `I` into that arrow type. This is the lower-universe condition for the product
construction of [ECD] proof of Proposition 11.24, p. 65; the size notion is Mathlib
`Small` (`Mathlib/Logic/Small/Defs.lean`).

**Checks.**

- `small_finset_arrow_empty` — The reverse-inclusion category on `Finset Empty` has just one
  object and one arrow, and is `Small.{0}`.
- `small_finset_arrow_nat` — Finite subsets of `ℕ` and their inclusion arrows are `Small.{0}`.
- `small_finset_arrow_type` — Finite subsets of `Type` have a total arrow type that is not
  `Small.{0}`, by `not_small_type` and the singleton injection.

`Perf.Diamond.cofilteredLimit` and `Perf.VSheaf.cofilteredLimit` use a small
cofiltered category with `Small.{0} (Arrow I)` and qcqs transition maps. Their comparison is
the canonical `limit.post` map, and their projection maps are `limit.π`; local spatiality makes
that comparison a homeomorphism, and spatial stages give a spatial limit.
`Perf.VSheaf.cofilteredLimit_qcqs` gives the qcqs conclusion. The cutoff refinement
`Perf.VSheaf.cofilteredLimit_small` carries the same `Small.{0} (Arrow I)` hypothesis, bounds
both the objects and arrows of the index category below `κ` and bounds all stage atlases by a single `μ < κ`. An atlas bound
means that its point set and every open affinoid chart's ring have cardinality below
the bound, as in [ECD] 4.2; it is stated directly on `Geometry.Perf p`.

`Perf.VSheaf.etaleLimit_objects`, `Perf.VSheaf.etaleLimit_morphisms` and
`Perf.VSheaf.etaleLimit_equality` give the three parts of the finite-stage equivalence
for qcqs bases: objects descend, morphisms descend after refinement, and equalities
hold after refinement. The morphism class is exactly one of finite étale, qcqs étale,
or quasicompact separated étale. All isomorphisms are over the base; the morphism
comparisons also commute with the original finite-stage objects. These statements
apply to qcqs diamonds and qcqs small v-sheaves with `Small.{0} (Arrow I)`
([ECD] 11.22–11.23 and 12.17, pp. 63–64, 73–74).

Lean: none; `small_finset_arrow_iff` with its three Checks and the geometric limit statements are
specified in the README only.

### D5.4 The universally open strictly totally disconnected presentation

**The universally open strictly totally disconnected presentation of a spatial diamond, and its
converse.** (*universally-open-presentation*) Write `E` for the class of étale maps that are
composites of quasicompact open immersions and finite étale maps. Let `Y` be a spatial diamond. Then
there is a strictly totally disconnected perfectoid space `X` with a surjective and universally open
quasi-pro-étale map `X → Y` which can be written as a cofiltered inverse limit of maps in `E`; if
`κ` is a cutoff cardinal and `Y` is `κ`-small, `X` may be taken `κ`-small, at the same `κ`, with the
conventions of D5.3. At every step `Perf.VSheaf.etalePresentationIndex_small` below supplies a
`Small.{0}` set of representatives for the relevant surjective étale covers. Its finite-subset
category satisfies D5.3's lower-universe hypothesis by `small_finset_arrow_iff`; the countable
iteration has that property too. The descent-data count also gives fewer than `κ` representatives
and a common atlas bound `κ' < κ` for all finite products, so D5.3(a) and (b) hold. The countable
iteration stays below `κ` because `cf κ > ω` ([ECD] proof of Proposition 11.24, p. 65). Conversely, if `Y` is a qcqs diamond
admitting a surjective and universally open quasi-pro-étale map from a perfectoid space, then `Y` is spatial;
more generally the converse holds with the source a (locally) spatial diamond. The class `E` is not
the class of all étale maps but exactly the class produced by the local structure theorem (D5.7),
and this is what makes the cardinality count work. The construction rests on the splitting
criterion: a spatial diamond all of whose surjective covers in `E` split is a strictly totally
disconnected perfectoid space, and a spatial diamond all of whose connected components are affinoid
perfectoid spaces is an affinoid perfectoid space. The proof splits the covers in `E`, identifies
the resulting limit with a strictly totally disconnected perfectoid space and recovers its
perfectoid algebra by the same general-base reconstruction input as layer D3; universal openness and
the open case of the spectral quotient criterion of D0.9 prove the converse. The construction is the
diamond analogue of the cover of [ECD] 7.18 and has the same universal openness, which is what
distinguishes it from a w-localization. The presentation precedes quasi-pro-étale permanence (D5.5)
in the build ([ECD] §11, Prop. 11.24 with proof, p. 65, the statement and its converse; [ECD] §11,
Prop. 11.26 and Lem. 11.27, pp. 65–67, the two results the construction terminates in). *Needs:*
D5.1; D5.3; D0.9; D1.9; D1.4; D0.23; D4.4; D3.10; PerfectoidSpaces P5.7, P6.1–P6.2 and P6.10.

The local-structure input can be constructed in the order D5.3 → D5.8 → D5.7 → D5.4, since
D5.8 does not use the presentation theorem.

**Checks.**

- `point` (degenerate) — for `Y = Spa(C, C⁺)` with `C` algebraically closed the identity is a
  presentation (`Y` is itself strictly totally disconnected); for `Y = Spa(K, O_K)` with `K` a
  perfectoid field with completed algebraic closure `C`, the presentation is `Spa(C, O_C) → Y`, the
  inverse limit of the finite étale maps `Spa(L, O_L) → Y` over finite extensions `L/K`, which is
  surjective and universally open and uses only the finite étale members of `E`.
- `converse_needs_universally_open` (non-example) — the identity `Y → Y` for the non-spatial qcqs
  diamond `Y = T̲ × Spa(K, O_K)` of D5.1 is quasi-pro-étale, surjective and universally open but has
  a non-perfectoid, non-spatial source, so the converse does not apply; the converse with a
  perfectoid source is what forces `|Y|` spectral.
- `universallyOpenPresentation_chart_small` — The finite-subset index over the small set of
  covers of a spatial `Y`, and the countable iteration, satisfy `Small.{0}` on total arrows;
  D5.3's large Boolean-product diagram cannot replace either index.

**Lower-universe presentation indices.** For a spatial v-sheaf `Y` on `Geometry.Perf p`, prove
`Perf.VSheaf.etalePresentationIndex_small`: the isomorphism classes over `Y` of surjective maps
in `E` admit a `Small.{0}` representative set. Their finite products over `Y`, and the countable
iteration of the construction, admit cofiltered presentations with `Small.{0}` total arrow types.
This applies both to spatial diamonds and to spatial v-sheaves satisfying D5.11's pointwise
hypothesis; no diamond conclusion is assumed in the latter application.

Use smallness and quasicompactness of `Y` to choose a finite union of charted affinoids surjecting
onto `Y`, hence a charted affinoid atlas `A → Y`. Quasiseparatedness makes `A ×_Y A` qcqs, and
D4.7 supplies a finite affinoid atlas `B → A ×_Y A`. Both section rings are `Small.{0}` by D1.11.
Over `A`, qcqs étale objects have finite descriptions by finite étale algebras, rational opens
and finite gluing, using D3.5 and the perfectoid local description of étaleness. Algebra
presentations, rational inequalities and maps between these descriptions are coded by small
sets of coefficients. Descent isomorphisms are determined after pullback to `B` (D3.5);
the cocycle and surjectivity conditions select subsets of this small set of codes. Thus the
representative set is `Small.{0}`. Finite subsets and countable compositions preserve that
bound. If `Y` is `κ`-small, choose `A` `κ`-small. For the cardinal estimate, descent
isomorphisms are determined on geometric fibres over the points of `A ×_Y A`, whose point set
injects into that of `A × A`; qc étale fibres are finite. The coefficient and fibre counts,
with the strong-limit and completion estimates, bound the representatives below `κ` and bound
all finite-product atlases by one `κ' < κ`; no `κ`-bound on the chosen relation atlas `B` is
needed. Repeat the small-set argument on each new spatial stage. `Geometry.hasAffinoidCharts_cofilteredLimit` keeps the perfectoid limits and the final
reconstruction charted ([ECD] proof of Proposition 11.24, p. 65; Theorem 12.18 and
Proposition 12.20, pp. 75–76; Remark 12.2 and Proposition 12.3, pp. 69–70).
*Needs:* D1.11; D3.5; D4.7; D5.2; D5.3; PerfectoidSpaces P6.2.

**Checks.**

- `presentationIndex_point` — For `Spa(C, O_C)` with small algebraically closed `C`, all relevant
  surjective covers split; their finite descriptions form a small set and the presentation can
  be the identity.
- `presentationIndex_field` — For a small perfectoid field `K`, finite extensions and their maps
  have small coefficient codes; the completed algebraic closure used in the point presentation
  stays in `Type`.
- `presentationIndex_large_boolean` — D5.3's sheaf `P × underline(Type → Bool)` is not spatial;
  its finite-coordinate system cannot satisfy this target's spatial-base hypothesis or its
  lower-universe conclusion, even at an enlarged cutoff.

`Perf.Diamond.universallyOpenPresentation` places the cofiltered diagram in the
slice over `Y`, with `Small.{0}` total arrow type, so its limit identifies the presentation map
itself. Its stage maps
belong to Mathlib's `MorphismProperty.multiplicativeClosure` of quasicompact open
immersions and finite étale maps. `Perf.Diamond.universallyOpenPresentation_small`
retains that lower-universe condition as well as the cutoff bound on points and all open
affinoid chart rings.
`Perf.Diamond.strictlyDisconnected_of_splitting` tests exactly the surjective maps
in this class. `Perf.VSheaf.affinoid_of_components` applies to every spatial v-sheaf,
hence in particular to a spatial diamond; its component is the image-constrained
subsheaf over a fibre of `ConnectedComponents.mk` ([ECD] 11.24, 11.26–11.27 and
12.21, pp. 65–67, 76).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.5 Quasi-pro-étale and fibre-product permanence

**Quasi-pro-étale maps into a locally spatial diamond, and fibre products.**
(*quasi-pro-etale-and-fibre-product-permanence*) Let `Y` be a locally spatial diamond and `Y' → Y` a
quasi-pro-étale map of pro-étale sheaves, which by [ECD] Convention 10.2 is locally separated. Then
`Y'` is a locally spatial diamond. A fibre product of (locally) spatial diamonds is (locally)
spatial. More generally, if `Y` is a qcqs diamond admitting a surjective universally open
quasi-pro-étale map from a (locally) spatial diamond, then `Y` is spatial. The proofs use the
universally open strictly totally disconnected presentation of D5.4, which is why these statements
come after it and not with the injection and finite étale cases of D5.2. The last statement is [ECD]
Rem. 11.25 and is the form in which the converse of the presentation theorem is applied; it is
recorded as part of the statement because every later application uses it in that generality, and
the first statement applied to an atlas is what shows that a diamond quasi-pro-étale over a locally
spatial diamond has the expected geometry ([ECD] §11, Cor. 11.28 and Cor. 11.29 with proofs, pp.
67–68, the two statements; [ECD] §11, Rem. 11.25, p. 65, the general form of the converse used
throughout §12 and §13). *Needs:* D5.4; D5.2; D0.9; D4.3; D3.6; D5.1.

`Perf.Diamond.locallySpatial_of_quasiProEtale` gives quasi-pro-étale permanence.
`Perf.Diamond.spatial_pullback` assumes that all three objects of the diagram are
spatial, or all three locally spatial. `Perf.Diamond.spatial_of_universallyOpen`
requires a qcqs diamond target and an epimorphic quasi-pro-étale map from a locally
spatial diamond whose every base change is open ([ECD] 11.25, 11.28–11.29,
pp. 65, 67–68).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.6 The two-out-of-three property

The next six subsections give the local geometry of locally spatial diamonds and the geometric point
criteria.

**The two-out-of-three property for quasi-pro-étale, étale and finite étale maps.**
(*two-out-of-three-for-quasi-pro-etale*) Let `f : Y₁ → Y₂` and `g : Y₂ → Y₃` be maps of locally
spatial diamonds with composite `h = g ∘ f`. Assume `f` is quasi-pro-étale and surjective, `h` is
quasi-pro-étale, and `g` is separated. Then `g` is quasi-pro-étale. If moreover `f` and `h` are both
étale, then `g` is étale; if both are finite étale, then `g` is finite étale. All three hypotheses
on `f`, `g` and `h` are needed, and the separatedness of `g` cannot be dropped: by [ECD] Convention
10.2 a quasi-pro-étale map is locally separated, and the non-example in the Checks is a map `g` of
spatial diamonds, with `f` a quasi-pro-étale surjection and `h` pro-étale, which is not locally
separated at one point. The proof is a careful reduction to the case of a connected strictly totally
disconnected base. The statement is used in the fibre criterion of D5.12 to characterise
quasi-pro-étale maps by their geometric fibres ([ECD] §11, Prop. 11.30 with proof, pp. 68–69).
*Needs:* D5.5; D5.4; D4.4; D3.8; D1.10; D1.5; PerfectoidSpaces layer P4 (residue-field point
injection).

**Checks.**

- `identity` (degenerate) — with `f = id` the conclusion is the hypothesis on `h`; with `g = id` it
  is trivial; with `h = id` the surjection `f` has the retraction `g`, so `f` is injective as well,
  hence an isomorphism, and `g = f⁻¹`.
- `finite_doubling` (compatibility) — for `Y₃ = Spa(C, C⁺)` with `C⁺` of rank two, points `η ⤳ s`,
  `Y₂ = Y₃ ⊔_{η} Y₃` the closed point doubled, `Y₁ = Y₃ ⊔ Y₃` and `g` the fold map: `g` is étale and
  not separated (its diagonal has image `{(η, η), (s₁, s₁), (s₂, s₂)}`, not closed in
  `Y₂ ×_{Y₃} Y₂`), and the conclusion holds because `g` is locally separated; separatedness of `g`
  is sufficient, not necessary.
- `separatedness_needed` (non-example) — with `Y₃` as above, `ℕ̄ = ℕ ∪ {∞}` and `Y₁ = ℕ̲̄ × Y₃`, let
  `E ⊂ Y₁ ×_{Y₃} Y₁` be the sub-v-sheaf of maps with image in `E₀ = (ℕ̄ × ℕ̄ × {η}) ∪ (Δ × {η, s})`,
  which is the intersection of the quasicompact opens `(ℕ̄ × ℕ̄ × {η}) ∪ (D_k × {η, s})` for clopens
  `D_k ↓ Δ`, hence an affinoid perfectoid space pro-étale over `Y₁`, and an equivalence relation.
  Then `Y₂ = Y₁/E` is a spatial diamond with `|Y₂| = {η̄} ∪ ℕ̄`, `η̄` generic and the opens
  `{η̄} ∪ W` for `W ⊂ ℕ̄` open; `f : Y₁ → Y₂` is a quasi-pro-étale surjection and `h : Y₁ → Y₃` is
  pro-étale, but every open neighbourhood `{η̄} ∪ W` of `s_∞` has infinite `W`, and the diagonal of
  `Y₂[W]` over `Y₃` has image `(ℕ̄ × ℕ̄ × {η}) ∪ (Δ_W × {s})`, whose closure contains `(m, n, s)`
  for `m ≠ n` in `W`; so `g` is not locally separated at `s_∞` and not quasi-pro-étale.

`Perf.Diamond.quasiProEtale_cancel` is the geometric cancellation statement on
three locally spatial v-sheaves, with the epimorphism hypothesis on `f` and
separatedness on `g`; it includes the étale and finite étale refinements
([ECD] 11.30, pp. 68–69).

**Check.** `quasiProEtale_cancel_identity` verifies all three morphism classes for
the identity of a geometric v-sheaf.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.7 Local structure of étale maps

**Local structure of étale maps of locally spatial diamonds.** (*local-structure-of-etale-maps*) Let
`f : Y' → Y` be an étale map of locally spatial diamonds. Then for every point `y'` of `|Y'|` with
image `y`, there are open neighbourhoods `V'` of `y'` in `Y'` and `V` of `y` in `Y` containing
`f(V')` such that the restriction of `f` to `V'` factors as a quasicompact open immersion `V' ↪ W`
followed by a finite étale map `W → V`. This generalizes the local structure theorem for étale maps
of perfectoid spaces, [ECD] Def. 6.2(ii), and by [ECD] Convention 10.2 the map `f` is locally
separated, which is necessary since the factorization forces the restriction to be separated. The
conclusion is local on both source and target; no global factorization is claimed. This is the
statement that makes the class `E` used in the universally open presentation of D5.4 the right one
([ECD] §11, Lem. 11.31 with proof, p. 69). *Needs:* D5.1; D5.3; D3.5; D3.6; D3.8; D4.5; D5.8.

`Perf.Diamond.etale_localStructure` quantifies over every point of the source and
returns open maps `U → Y'`, `V → Y`, a quasicompact open immersion `U → W`, and a
finite étale map `W → V`, with the equality of their composites to `Y`. Membership
of the chosen point in the image of `U` makes the neighborhood condition explicit
([ECD] 11.31, p. 69).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.8 Localization of a spatial diamond

**Localization of a spatial diamond.** (*localization-at-a-point*) Let `Y` be a spatial diamond and
`y ∈ |Y|`. Let `Y_y` be the inverse limit, along the inclusions, of all qc open subdiamonds `U ⊂ Y`
containing `y`. It is spatial; `|Y_y|` is the generalization set of `y` with the induced topology,
and its map to `Y` is a qc injection. Morphisms whose underlying image is contained in that
generalization set factor uniquely through `Y_y`. This is a diamond localization, built as the
spatial inverse limit of qc open neighbourhoods by the limit theorem of D5.3: a charted affinoid
atlas surjecting onto `Y` gives a `Small.{0}` point set for `|Y|`, so its set of qc opens and their
inclusion arrows is `Small.{0}`. This is not a new
definition of a local ring nor the topological localization of layer D0. The generalization set of
`y` is pro-constructible and generalizing but need not be locally closed, so the theorem of D5.9
does not apply to it; spatiality comes from the limit theorem. Define `Perf.Diamond.localization` as
the sub-v-sheaf of maps with image in the generalization set `Perf.Diamond.generalizationSet` of `y`
(the maps `T → Y` whose image consists of generalizations of `y`; `Perf.Diamond.localization_lift`
identifies the unique lift through the canonical inclusion), prove
`Perf.Diamond.localization_isLimit` (it is the inverse limit of the qc open neighbourhoods of `y`,
hence spatial) and `Perf.Diamond.localization_space` (the underlying space is the set of
generalizations of `y`), and define `Perf.Diamond.localization_toBase` as its canonical qc injection
into `Y` ([ECD] §11, proof of Lem. 11.31, p. 69, the diamond localization actually used in the
proof; its inverse-limit construction is justified by [ECD] §11, Lem. 11.22, and the induced
topology by [ECD] Proposition 11.20, p. 62). *Needs:* D5.3; D5.1; D3.7; no input from D5.4's
presentation theorem.

**Checks.**

- `localization_closed_point_chain` (computation) — in a valuation-field diamond with one closed
  point, localization at that closed point is the whole diamond.
- `localization_generic_point_chain` (computation) — localization at a maximal generalization has
  only its generalizations, not all its specializations; a construction returning the closure of the
  point is wrong.
- `localization_open_compatibility` (compatibility) — localizing an open neighbourhood `U` of `y` at
  `y` gives the same `Y_y`.
- `gauss_point_not_locally_closed` (non-example for D5.9, computation) — in the perfectoid closed
  disc over `C`, the generalization set of the Gauss point `η` is `{η}`, which is not locally
  closed: every open neighbourhood of `η` is a union of rational subsets `{|f_i| ≤ |g| ≠ 0}`, each
  of which excludes only finitely many of the infinitely many type-5 specializations `η_a^-`,
  `a ∈ k̄`, so `{η}` is not open in its closure. `Y_η`, the limit of the rational neighbourhoods of
  `η`, is still spatial with `|Y_η| = {η}`.

For the intrinsic site realization, image descent assumes that `T ↦ C(|T|, Z)` is a sheaf for every
topological space `Z`. Under this hypothesis `localization_lift` is an if-and-only-if statement
about the actual composite with `localization_toBase`. The following Checks concern this
construction; the geometric chain and Gauss-point Checks additionally need the valuation-field and
perfectoid-disc carriers described in D5.1.

- `localization_all_generalize` — if every point generalizes `y`, the localization is the original
  sheaf, not merely a sheaf with the same underlying point set.
- `generalization_t1` — in a T1 realization the generalization set is the singleton `{y}`.
- `generalization_proper_chain` — if distinct `x ⤳ y` lie in a T0 realization, `x` lies in the
  generalization set of `y`, while `y` does not lie in that of `x`.
- `generalization_chain_topology` — on the Sierpiński space `Prop`, the generalizations of `False`
  are all points, and those of `True` are just `True`.

**`Perf.Diamond.generalizationSet`.** The specialization direction selects generalizations of the specified point.

**Checks.**

- `generalizationSet_sierpinski_closed_point` — Under a homeomorphism with the Sierpiński chain, all points generalize the closed point.
- `generalizationSet_singleton` — On a one-point realization the generalization set is the whole space.
- `generalizationSet_sierpinski_generic_point` — In that two-point chain the closed point is absent from the generalizations of the generic point.

**`Perf.Diamond.localization`.** Localization retains the points generalizing the selected point, with its canonical map to the original sheaf.
The point-site Checks use `C = Discrete PUnit` and `J = ⊥`.

**Checks.**

- `Perf_Diamond_localization_bool_singleton` — Localizing the discrete two-point sheaf at either point gives exactly one section.
- `Perf_Diamond_localization_point_unique` — The localization of a one-point represented sheaf has a unique section.
- `Perf_Diamond_localization_bool_not_two_points` — Localizing two discrete points does not retain both sections.

**`Perf.Diamond.localization_toBase`.** Localization retains the points generalizing the selected point, with its canonical map to the original sheaf.

**Checks.**

- `Perf_Diamond_localization_toBase_singleton_image` — On the point site the localization map has image exactly the chosen point.
- `Perf_Diamond_localization_toBase_all_generalizations_iso` — If all points generalize y, the canonical localization map is an isomorphism.
- `Perf_Diamond_localization_toBase_bool_not_surjective` — For a two-point discrete sheaf the localization map is not surjective on points.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.9 Locally closed generalizing subdiamonds

**Locally closed generalizing subdiamonds.** (*locally-closed-generalizing-subdiamond*) Let `Y` be a
locally spatial diamond and `D ⊂ |Y|` a locally closed subset stable under generalization, meaning
closed under generalizations in `|Y|` and not under specializations. The sub-v-sheaf `Y_D` consists
of the maps `T → Y` whose underlying image is contained in `D`. It is a locally spatial diamond, its
underlying space is `D` with the subspace topology, and it represents this factorization condition;
this is the sub-v-sheaf and factorization condition used by [HK], not an arbitrary closed-subset
representability assertion. Define `Perf.Diamond.generalizingSubdiamond` as the sub-v-sheaf of maps
whose images lie in `D`; prove `Perf.Diamond.generalizingSubdiamond_space` (its underlying space is
`D` with its induced topology) and `Perf.Diamond.generalizingSubdiamond_lift` (a map factors
uniquely through `Y_D` precisely when its underlying image lies in `D`) ([ECD] Proposition 11.20, p.
62, for the subspace topology, applied locally; [HK] §2.1, the locally closed generalizing
subdiamond construction and its proof, p. 14). *Needs:* D1.5; D5.2; D5.1; D4.5.

**Checks.**

- `generalizing_subdiamond_whole` — On the point site with the Boolean sheaf, the canonical whole-subset inclusion evaluates the negated constant-false generator to the constant-true section; these two sections are distinct.
- `generalizing_subdiamond_open` (compatibility) — for open `D` it is the open subdiamond of D4.5.
- `generalizing_subdiamond_empty` (degenerate) — `D = ∅` gives the empty diamond.
- `generalizing_subdiamond_direction` (non-example, computed) — for `Y = Spa(C, C⁺)` with `C⁺` of
  rank two and `s` its closed point, `D = {s}` is not generalizing and the theorem does not apply;
  the construction still makes sense and gives `Y_{{s}} = ∅`, because every map `T → Y` from a
  perfectoid space has generalizing underlying map (D5.1), so a nonempty image contains `η`; thus
  `|Y_{{s}}| = ∅ ≠ D`, and `generalizingSubdiamond_space` fails without the hypothesis.

The site construction uses `imagePresheafToBase`, evaluation at the identity of a test object, and
`generalizingSubdiamond_toBase`, its Mathlib `sheafifyLift`. `imagePresheaf_isSheaf` assumes
continuous-map descent as in D5.8; `generalizingSubdiamond_mono` states monicity of the canonical
inclusion, and `generalizingSubdiamond_lift` characterizes its unique lifts for maps from any sheaf.
Geometric spatiality and the subspace comparison also require the perfectoid-site instance and its
generalizing-map comparison, not merely this sheafification construction.

- `image_whole_sections` — the whole subset gives a bijection on every test-object evaluation.
- `image_empty_nonempty_test` — the empty subset has no sections on a nonempty test space.
- `image_empty_empty_test` — on an empty test space the empty-image condition imposes no restriction;
  this distinguishes the empty geometric sheaf from an everywhere-empty presheaf.
- `image_inclusion_on_generators` — the sheafification unit followed by the inclusion is evaluation
  at the identity, fixing the actual map into the base.
- `generalizing_direction_topology` — the closed singleton in the Sierpiński space is not
  generalizing; the geometric empty-subdiamond assertion above additionally uses generalizing maps.

**`Perf.Diamond.imagePresheaf`.** The image condition cuts out maps from representables before sheafification.

**Checks.**

- `Perf_Diamond_imagePresheaf_whole_sections` — For the whole subset, sections over X are in bijection with the original sections over X.
- `Perf_Diamond_imagePresheaf_empty_representable` — For an empty represented space, the empty image condition admits the identity map.
- `imagePresheaf_proper_subset` — On the one-object site with discrete Bool as test space, the proper subset consisting of false is nonempty but contains the image of no represented endomorphism. Intersecting the image is insufficient.

**`Perf.Diamond.imagePresheafToBase`.** Evaluation identifies a represented map with its section.

**Checks.**

- `Perf_Diamond_imagePresheafToBase_evaluation` — On the whole image condition, a represented map evaluates to its value at the identity.
- `Perf_Diamond_imagePresheafToBase_identity` — The identity represented map evaluates to the identity section.
- `Perf_Diamond_imagePresheafToBase_distinct_endomorphisms` — Distinct represented endomorphisms have different evaluation sections.

**`Perf.Diamond.generalizingSubdiamond_whole`.** The whole-space isomorphism uses the canonical inclusion as its forward map.

**Checks.**

- `Perf_Diamond_generalizingSubdiamond_whole_evaluation` — On a generator it evaluates the represented map at the identity.
- `Perf_Diamond_generalizingSubdiamond_whole_identity` — The generator of the identity represented map goes to the identity section.
- `Perf_Diamond_generalizingSubdiamond_whole_nonidentity` — A nonidentity represented endomorphism does not map to the identity section.

**`Perf.Diamond.generalizingSubdiamond_toBase`.** The inclusion carries each image-constrained represented map to its evaluated section.

**Checks.**

- `Perf_Diamond_generalizingSubdiamond_toBase_evaluation` — A whole-image generator associated to f maps to f evaluated at the identity.
- `Perf_Diamond_generalizingSubdiamond_toBase_identity` — The identity generator maps to the identity section.
- `Perf_Diamond_generalizingSubdiamond_toBase_nonidentity` — A nonidentity represented endomorphism does not map to the identity section.

**`Perf.Diamond.generalizingSubdiamond`.** Sheafification retains image-constrained sections when
continuous maps descend. The whole-subset and empty-subset Checks use the same bottom topology on
`Discrete PUnit` as in D5.8.

**Checks.**

- `Perf_Diamond_generalizingSubdiamond_whole_bool_card` — For the whole subset on the point site, a Bool sheaf still has two sections.
- `Perf_Diamond_generalizingSubdiamond_empty_bool_value` — The empty subset on the point site yields an empty value.
- `Perf_Diamond_generalizingSubdiamond_proper_subset_not_surjective` — Assuming continuous-map descent, a point outside the subset witnesses failure of surjectivity for the realization of `generalizingSubdiamond_toBase`.

**Checks.**

- `generalizing_singleton_obstruction` — In a T₀ space, a point with a distinct generalization does not form a generalizing singleton.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.10 Profinite products and closed projection

**Profinite products and closed projection.** (*profinite-products-of-locally-spatial-diamonds*) Let
`P : Profinite.{0}` be a profinite set in the chart universe and `S` a locally spatial diamond.
Then `P̲ × S` is locally spatial and `|P̲ × S| ≅ P × |S|`. The projection `P̲ × S → S` is qc, separated and universally closed, that is,
proper in the sense of D4.11; hence it sends closed subsets to closed subsets after any locally
spatial base change. Compactness of `P` is essential for closedness of the projection. The proof in
[HK] uses `|P̲ × S| = P × |S|` for `P = P V_k(ℚ_p)` and projections from the compact-open subsets
`K_i`; here the general profinite-product input is proved with the spatial limit theorem of D5.3
with the `Small.{0}` category of finite clopen partitions of `P`. The large profinite factor in
`s5_3_large_index_not_chart_small` is excluded from this contract
([HK] proof of Prop. 9.3.4, printed p. 60). *Needs:* D5.3; D4.6; D3.8.

**Checks.**

- `empty_profinite` (degenerate) — for `P = ∅`, `P̲ × S = ∅`, `|∅| = ∅ × |S|`, and the projection
  `∅ → S` is quasicompact, separated and universally closed.
- `finite_set` (computation) — for `P` finite with `n` elements, `P̲ × S = S ⊔ ⋯ ⊔ S` (`n` copies)
  and `|P̲ × S| = P × |S|` is the disjoint union of `n` copies of `|S|`.
- `discrete_not_closed` (non-example) — for the discrete set `P = ℕ` (not compact, not profinite)
  and `S` the perfectoid closed disc over `C`, `P̲ × S = ⊔_n S` and the subset `⊔_n cl{a_n}`, for
  classical points `a_n` converging to a classical point `a`, is closed, while its image
  `⋃_n cl{a_n}` is not: `a` lies in its closure and is not a specialization of any `a_n`.

Two separate topological controls are `compact_projection_topology`, supplied by Mathlib's
`isClosedMap_snd_of_compactSpace`, and `discrete_projection_topology`, the failure of closedness
for `ℕ × ℝ → ℝ`. They test compactness in the projection argument. The geometric Checks above
also require the profinite product of a perfectoid space and the perfectoid disc.

`Perf.Diamond.profiniteProduct` states local spatiality and a homeomorphism whose
second coordinate is the geometric projection and whose first coordinate evaluates
the continuous-map section on every perfectoid test. `Perf.Diamond.profiniteProjection`
states quasicompactness, separatedness, and closedness after every v-sheaf base
change ([HK] proof of 9.3.4, pp. 59–60).

**Checks.**

- `profiniteProduct_empty` — an empty profinite factor gives the initial geometric v-sheaf.
- `profiniteProduct_two_points` — two discrete points times `Spa(K, O_K)` has exactly two points.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.11 The spatial v-sheaf criterion

**A spatial v-sheaf with enough quasi-pro-étale points is a spatial diamond.**
(*spatial-v-sheaf-criterion*) Let `Y` be a spatial v-sheaf in the sense of D5.1, with no diamond
structure assumed, such that there is a perfectoid space `X` with a quasi-pro-étale map `f : X → Y`
for which `|f| : |X| → |Y|` is surjective. Then `Y` is a spatial diamond ([ECD] Theorem 12.18,
Remark 12.19, p. 75; [Berkeley] Theorem 17.3.9, p. 154). Sheaf surjectivity of `f` is not required:
`f` is not assumed quasicompact, so the quasicompact surjectivity criterion of D4.8 ([ECD] Lem.
12.11) does not apply and `f` need not be a surjection of v-sheaves; the conclusion is not built
into D5.1. Equivalently, for every `y ∈ |Y|` there is a quasi-pro-étale map `Spa(C, C⁺) → Y` with
`C` algebraically closed having `y` in its image, so the condition is only a condition on the points
of `Y`. The proof needs the analogues for spatial v-sheaves of finite étale permanence (D5.2) and of
the limit theorem (D5.3), which is why those are stated separately, and terminates in the two
generalizations [ECD] Prop. 12.20 and Lem. 12.21, its inputs: a spatial v-sheaf with the pointwise
hypothesis all of whose relevant étale covers — the surjective composites of quasicompact open
immersions and finite étale maps — split is a strictly totally disconnected perfectoid space, and a
spatial v-sheaf all of whose connected components are affinoid perfectoid is affinoid perfectoid.
This theorem is what shows, throughout later work, that concrete functors are diamonds without
exhibiting an atlas. At each iteration the relevant covers have a `Small.{0}` representative set
by `Perf.VSheaf.etalePresentationIndex_small` (D5.4), applied to the spatial v-sheaf before it is
known to be a diamond. Finite-subset indices and the countable iteration therefore meet D5.3's
`Small.{0}` arrow condition, and `Geometry.hasAffinoidCharts_cofilteredLimit` keeps the
reconstructed perfectoid space charted ([ECD] §12, Thm 12.18 and Rem. 12.19 with proof, p. 75,
the statement and [ECD]'s own emphasis that the hypothesis is only about points; [ECD] §12, Prop. 12.20 and Lem.
12.21, pp. 75–76, the two auxiliary results the proof terminates in). *Needs:* D5.1; D5.4; D5.2;
D5.3; D4.3; D4.7; D4.8; D3.10; D0.23.

**Checks.**

- `empty` (degenerate) — the empty v-sheaf is spatial, `X = ∅` satisfies the hypothesis vacuously,
  and the empty diamond is the conclusion.
- `final_object` (non-example for spatiality) — the terminal v-sheaf `Spd 𝔽_p` has one underlying
  point, but is not quasiseparated by D2.4 and hence is not spatial. It does not satisfy the
  hypotheses of the spatial v-sheaf criterion.
- `perfectoid_point` (compatibility) — for `Y = Spa(K, O_K)` with `K` a perfectoid field,
  `Spa(C, O_C) → Y` for the completed algebraic closure `C` is quasi-pro-étale with surjective
  underlying map, and `Y` is a spatial diamond, as it must be.
- `qcqs_perfectoid_identity` — for a qcqs perfectoid `Y` take `f` the identity.
- `non_qc_point_cover` — for spatial `Y` with infinitely many points, the disjoint union of one
  nonempty quasi-pro-étale field-spectrum map for each point satisfies the pointwise hypothesis.
  Its source has infinitely many nonempty open summands and is not quasicompact; since `Y` is
  quasicompact, the map is not quasicompact. For `Y = Spa(C, O_C)` with `C` algebraically closed,
  the identity is the one-summand point cover and is quasicompact.

`Perf.VSheaf.spatialDiamond_of_points` assumes spatiality of the v-sheaf and a
quasi-pro-étale map from a perfectoid whose realization is surjective.
`Perf.VSheaf.spatialDiamond_iff_fieldPoints` states the equivalent criterion using
algebraically closed perfectoid fields with their chosen plus rings.
`Perf.VSheaf.strictlyDisconnected_of_splitting` adds splitting of the surjective
composites of qc open immersions and finite étale maps and concludes strict total
disconnectedness. Neither statement replaces point-surjectivity by a sheaf
epimorphism ([ECD] 12.18–12.20, pp. 75–76).

**Checks.**

- `spatialCriterion_empty` — the initial geometric v-sheaf is a spatial diamond.
- `spatialCriterion_terminal` — the terminal geometric v-sheaf is not spatial.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.12 Relative representability

The next four subsections treat relative representability and Hausdorff reduction.

**Maps representable in diamonds and in (locally) spatial diamonds.** (*relative-representability*)
A map `f : Y' → Y` of v-stacks is representable in diamonds if for every diamond `X` with a map
`X → Y` the fibre product `Y' ×_Y X` is a diamond; it is representable in (locally) spatial diamonds
if for every (locally) spatial diamond `X` over `Y` the fibre product is a (locally) spatial
diamond. For a map of diamonds that is representable in (locally) spatial diamonds one says simply
that it is a (locally) spatial map. A map is representable in spatial diamonds exactly when it is
representable in locally spatial diamonds and qcqs. All these notions are examples of 0-truncated
maps. Over a diamond (respectively locally spatial diamond) `Y`, `f` is representable in diamonds
(respectively locally spatial diamonds) iff `Y'` is one, and representability in locally spatial
diamonds implies representability in diamonds ([ECD] Propositions 13.2(i)–(ii), 13.4(i)–(iii), pp.
76–77). The three classes are stable under base change, and they descend, with different locality
conditions stated as the three descent targets after the Checks: for a surjection of pro-étale
stacks on the target, representability in diamonds descends, and representability in locally spatial
diamonds descends when `f` is in addition quasiseparated; for a surjection of v-stacks, the locally
spatial descent assertion assumes `f` already representable in diamonds and quasiseparated. The
pro-étale and the v-locality conditions are therefore different, and since these are the notions in
which the six-operations formalism is indexed, their exact form matters. [ECD] Lem. 13.5 is
included: a quasiseparated small v-sheaf over an underlined profinite set `S̲` is locally spatial if
its fibres are locally spatial and it has a surjective qcqs map from a locally spatial diamond. A
separated map is quasi-pro-étale exactly when it is representable in locally spatial diamonds and
its fibres at `Spa(C, O_C)`, for algebraically closed `C`, are pro-étale; this geometric fibre
criterion is the practical test for quasi-pro-étaleness and is where the two-out-of-three property
of D5.6 enters. Define `Perf.Stack.RepresentableInDiamonds` as the predicate that all fibre products
over diamonds are diamonds, `Perf.Stack.RepresentableInLocallySpatialDiamonds` as the corresponding
predicate for locally spatial diamonds and `Perf.Stack.RepresentableInSpatialDiamonds` as the
corresponding predicate for spatial diamonds; prove `Perf.Stack.representableInSpatial_iff`
(representability in spatial diamonds is representability in locally spatial diamonds together with
qcqs), `Perf.Stack.representable_pullback` (the three classes are stable under base change),
`Perf.Stack.representable_of_pullback` (the three descent statements, with their different
surjectivity and quasiseparatedness hypotheses), `Perf.Stack.isQuasiProEtale_iff_fibres` (a
separated map is quasi-pro-étale exactly when it is representable in locally spatial diamonds with
pro-étale geometric fibres) and `Perf.Stack.representable_isZeroTruncated` (all three classes
consist of 0-truncated maps). The three predicates on maps of v-sheaves (`Sheaf J (Type u)`) are
accompanied by `Perf.Stack.StackRepresentableInDiamonds`,
`StackRepresentableInLocallySpatialDiamonds` and `StackRepresentableInSpatialDiamonds` on strong
maps of category-valued pseudofunctors. Their common `RepresentableBy` construction requires an
actual sheaf in the specified class and a strong transformation to the entire 2-fibre product, with
an equivalence on every fibre. `representableBy_pullback` and `representableBy_comp` state
2-base-change stability and composition for an arbitrary class of testing sheaves;
`representable_pullback` specializes the first to all three classes. On a subcanonical site,
`representable_isZeroTruncated` assumes that the class contains every representable and that the
source has groupoid fibres. These precise hypotheses suffice to detect relative automorphisms. For
diamonds `representableInDiamonds_isZeroTruncated` instead assumes only that identity maps of test
objects are pro-étale, so their diagonal presentations make them diamonds. Locally spatial and
spatial testing classes still require the geometric supply of spatial tests or spatial covers. For
v-stacks impose the stack condition and groupoid fibres; the descent statements and fibre criterion
concern this general form ([ECD] §13, Def. 13.1, Def. 13.3 and Prop. 13.4, pp. 76–77, the
definitions and the descent statements of Props. 13.2 and 13.4; [ECD] §13, Prop. 13.6 with proof,
pp. 78–79, the fibre criterion, which [ECD] attributes to Fargues). *Needs:* D5.1; D5.5; D4.3; D4.7;
D3.6; D5.6; D3.8.

**Checks.**

- `diamond_base` (degenerate) — for `Y` a diamond, `f` is representable in diamonds exactly when
  `Y'` is a diamond; for `Y` a locally spatial diamond, `f` is representable in locally spatial
  diamonds exactly when `Y'` is a locally spatial diamond ([ECD] Prop. 13.2(i), 13.4(ii)). The
  locally spatial clause needs `Y` locally spatial: for `Y = Y' = T̲ × Spa(K, O_K)` with
  `T = [0, 1]` and `f = id`, `f` is representable in locally spatial diamonds (`X ×_Y Y = X`) while
  `Y'` is not locally spatial.
- `quasi_pro_etale` (characterisation) — a quasi-pro-étale map of locally spatial diamonds is
  representable in locally spatial diamonds.
- `disc_not_quasi_pro_etale` (non-example for the fibre criterion) — the perfectoid closed disc
  `𝔹 → P := Spa(C, O_C)` is separated and representable in locally spatial diamonds (for a
  locally spatial `X → P`, its base change is `𝔹 ×_P X`, locally spatial by D5.5), but its fibre at
  the geometric point `P` is `𝔹` itself, not pro-étale, so it is not quasi-pro-étale: the fibre
  condition is the one that fails, and both directions of the "exactly when" are used.
- `disc_relative_base_change` (boundary) — for `X = P` with its identity map, `𝔹 ×_P P ≅ 𝔹`.
  In characteristic `p`, the test object `P` maps to the absolute product `𝔹 × P` by applying
  Frobenius to the disc's coefficients, sending its variable and all compatible roots to zero,
  and using the identity on the second factor. The two coefficient maps are Frobenius and the
  identity, which differ on a topologically nilpotent unit of `C`, so this section does not
  factor through `𝔹 ×_P P`.
- `not_representable_in_perfectoid_spaces` (non-example) — a morphism of diamonds need not be
  representable in perfectoid spaces; a definition imposing that is wrong.
- `classifying_stack` (characterisation) — the map from a charted geometric point to the classifying
  stack of a locally profinite group `G : Type` is representable in locally spatial diamonds and
  quasi-pro-étale, by D3.10 with its charted-base hypothesis.

In the next three targets `Ỹ → Y` is a map of v-stacks and `f̃ : Y' ×_Y Ỹ → Ỹ` the base change of
`f`.

**Diamond representability descends along pro-étale surjections.** If `Ỹ → Y` is surjective as a map
of pro-étale stacks, that is for the pro-étale topology, and `f̃` is representable in diamonds, then
so is `f` ([ECD] Proposition 13.2(iii), p. 77).

**Locally spatial representability descends along pro-étale surjections.** If `Ỹ → Y` is surjective
as a map of pro-étale stacks, `f` (not only `f̃`) is quasiseparated and `f̃` is representable in
locally spatial diamonds, then so is `f` ([ECD] Proposition 13.4(iv), p. 77).

**Locally spatial representability descends along v-surjections, given diamonds.** If `Ỹ → Y` is
only a surjection of v-stacks, `f` is already representable in diamonds and quasiseparated, and `f̃`
is representable in locally spatial diamonds, then `f` is representable in locally spatial diamonds
([ECD] Proposition 13.4(v), p. 77, with Lemma 13.5, p. 78). The diamond representability of `f` is a
hypothesis here: no descent of diamond representability along v-surjections is asserted.

**Checks.**

- `s5_12_v_surjection_not_pro_etale` — for algebraically closed `C ⊊ C'`,
  `Spa(C', O_{C'}) → Spa(C, O_C)` is a v-surjection that is not surjective for the pro-étale
  topology: a lift over a pro-étale cover `S × Spa(C, O_C)`, `S` profinite and nonempty, would give
  a continuous `C`-embedding `C' → C`. So along it only the third form applies.
- `s5_12_trivial_cover` (degenerate) — for `Ỹ = Y` all three descent statements are trivial.

For each of the three sheaf predicates, the additional Checks
`representable_diamond_identity`, `representable_locally_spatial_identity`,
`representable_spatial_identity` give identity base changes; the corresponding `_iso` Checks
give an arbitrary isomorphism; and the corresponding `_base_obstruction` Checks exclude a map
whose base has the specified property but whose source does not, by testing against the identity
of the base. These are tests of the categorical definitions, independent of geometric permanence.
For `RepresentableBy`, `stack_relative_identity` computes the identity 2-pullback,
`stack_relative_no_tests` checks the vacuous case of an empty test class, and
`stack_relative_automorphism_obstruction` excludes a relative fibre with a nonidentity endomorphism:
an equivalence with a discrete sheaf fibre cannot retain that endomorphism.

**`Perf.Stack.RepresentableInDiamonds`.** The relative predicate tests fibres over objects of its designated class. On the one-object point site with the maximal pro-étale class, that class of diamonds consists of singleton sheaves.

**Checks.**

- `RepresentableInDiamonds_point_site_negation` — A map of two-point sheaves acting by Boolean negation is representable; each tested fibre has one element.
- `RepresentableInDiamonds_point_site_empty_identity` — The identity of the empty sheaf is representable even though the empty sheaf has no representable atlas on this point site.
- `RepresentableInDiamonds_point_site_two_point_fibre` — A two-element fibre over the point fails the predicate; surjectivity alone does not suffice.

**`Perf.Stack.RepresentableInLocallySpatialDiamonds`.** The relative predicate tests base changes
along locally spatial diamonds ([ECD] Definition 13.3, p. 76). On the one-object site
`C = Discrete PUnit`, with `J = ⊥`, `proet = ⊤` and `sp` constant at the one-point space,
the diamonds, locally spatial diamonds and spatial diamonds are precisely the singleton sheaves.
A cover by singleton spatial opens supplies no representable quotient atlas for a sheaf with
two sections, infinitely many sections or no sections. The relative predicate therefore requires
each fibre over a singleton test to be a singleton. These Checks use the categorical predicates
of D5.1 and D5.12.

**Checks.**

- `Perf_Stack_RepresentableInLocallySpatialDiamonds_bool_negation` — A map of two-point sheaves acting by Boolean negation is representable; each tested fibre has one element.
- `Perf_Stack_RepresentableInLocallySpatialDiamonds_empty_identity` — The identity of the empty sheaf is representable even though the empty sheaf has no representable atlas on this point site.
- `Perf_Stack_RepresentableInLocallySpatialDiamonds_bool_fibre` — A map `f : F → G` with
  `F(*) ≃ Bool` and `G(*) ≃ PUnit` fails representability in locally spatial diamonds.
  Pullback along the identity of the singleton spatial diamond gives `F`, which has no
  representable diamond atlas. Its singleton spatial open cover does not satisfy diamondhood.

**`Perf.Stack.RepresentableInSpatialDiamonds`.** The relative predicate tests fibres over objects of its designated class. On the one-object point site with the maximal pro-étale class, that class of diamonds consists of singleton sheaves.

**Checks.**

- `Perf_Stack_RepresentableInSpatialDiamonds_bool_negation` — A map of two-point sheaves acting by Boolean negation is representable; each tested fibre has one element.
- `Perf_Stack_RepresentableInSpatialDiamonds_empty_identity` — The identity of the empty sheaf is representable even though the empty sheaf has no representable atlas on this point site.
- `Perf_Stack_RepresentableInSpatialDiamonds_bool_fibre_failure` — A two-element fibre over the point fails the predicate; surjectivity alone does not suffice.

**`Perf.Stack.RepresentableBy`.** The testing predicate is applied to the whole kernel groupoid, including automorphisms.

**Checks.**

- `Perf_Stack_RepresentableBy_discrete_sheaves` — A map between discrete stacks is representable by sheaves when every sheaf is admitted.
- `RepresentableBy_empty_sheaf_tests` — Testing the two-point-to-point map against empty sheaves gives empty fibres. This is a nonempty testing class, unlike the predicate False.
- `Perf_Stack_RepresentableBy_integer_stabilizer_failure` — The classifying stack of the integer group over the point is not representable by a sheaf.

**`Perf.Stack.StackRepresentableInDiamonds`.** The stack predicate retains the entire fibre groupoid while testing against the stated class of diamonds.

**Checks.**

- `StackRepresentableInDiamonds_point_site_identity` — The identity of the discrete two-point stack is representable; its fibres over point tests are singletons.
- `StackRepresentableInDiamonds_point_site_empty_identity` — The identity of the empty stack is representable, though its source has no point-site atlas.
- `StackRepresentableInDiamonds_point_site_two_point_fibre` — A two-point fibre over the point is excluded on the point site, where diamond presentations have singleton quotients.

**`Perf.Stack.StackRepresentableInLocallySpatialDiamonds`.** The stack predicate retains the entire
fibre groupoid while testing against locally spatial diamonds ([ECD] Definition 13.3, p. 76).
On the point site above, that testing class consists of singleton sheaves, as for the sheaf predicate.

**Checks.**

- `Perf_Stack_StackRepresentableInLocallySpatialDiamonds_bool_identity` — The identity of the discrete two-point stack is representable; its fibres over point tests are singletons.
- `Perf_Stack_StackRepresentableInLocallySpatialDiamonds_empty_identity` — The identity of the empty stack is representable, though its source has no point-site atlas.
- `Perf_Stack_StackRepresentableInLocallySpatialDiamonds_bool_fibre` — On `C = Discrete PUnit`, with
  `J = ⊥`, `proet = ⊤` and `sp` constant at the one-point space, the map from the discrete
  `Bool` stack to the discrete `PUnit` stack fails representability in locally spatial diamonds.
  Its 2-pullback along the identity of the singleton spatial diamond is the discrete Boolean
  sheaf. Trivial automorphisms make it a sheaf but do not give it a diamond atlas; its two
  singleton spatial opens do not supply the diamondhood required by D5.1.

**`Perf.Stack.StackRepresentableInSpatialDiamonds`.** The stack predicate retains the entire fibre groupoid while testing against the stated class of diamonds.

**Checks.**

- `Perf_Stack_StackRepresentableInSpatialDiamonds_bool_identity` — The identity of the discrete two-point stack is representable; its fibres over point tests are singletons.
- `Perf_Stack_StackRepresentableInSpatialDiamonds_empty_identity` — The identity of the empty stack is representable, though its source has no point-site atlas.
- `Perf_Stack_StackRepresentableInSpatialDiamonds_bool_fibre_failure` — A two-point fibre over the point is excluded on the point site, where diamond presentations have singleton quotients.

On `Geometry.VSheaf p`, `Perf.Stack.representableInSpatial_iff` uses topos-theoretic
qcqs. `Perf.Stack.representable_of_pullback` uses local surjectivity for the
pro-étale topology: diamond representability descends without a qs hypothesis,
and locally spatial representability descends with qs.
`Perf.Stack.representable_of_vPullback` uses a v-epimorphism and additionally assumes
diamond representability and qs of the original map. The separate hypotheses are
those of [ECD] 13.2(iii) and 13.4(iv)–(v), p. 77.
`Perf.Stack.isQuasiProEtale_iff_fibres` assumes separatedness and tests every
algebraically closed perfectoid field with its maximal plus ring; the fibre is
isomorphic over that field spectrum to an actual pro-étale perfectoid space
([ECD] 13.6, p. 78). `Perf.VSheaf.locallySpatial_of_profinite_fibres` states 13.5:
a qs small v-sheaf over an underlined profinite set has locally spatial fibres
and a surjective qcqs locally spatial cover ([ECD] pp. 78–79).

`Geometry.profiniteFibre p P F f s` is the pullback of `f : F → P̲` along the constant section `s`. Thus its sections are exactly the sections of `F` mapping to the constant function `s`; `Perf.VSheaf.locallySpatial_of_profinite_fibres` tests local spatiality on these fibres ([ECD] Lemma 13.5, pp. 78–79).

**Checks.**

- `profiniteFibre_point` — the fibre over the one-point base is the original sheaf.
- `profiniteFibre_identity` — each fibre of the identity of `P̲` is terminal.
- `profiniteFibre_distinct` — a constant map has initial fibre at a different point.

**Checks.**

- `representable_diamond_iso` — Every isomorphism of sheaves is representable in diamonds.
- `representable_diamond_base_obstruction` — A map to a diamond from a sheaf that is not a diamond is not representable in diamonds.
- `representable_locally_spatial_iso` — Every isomorphism of sheaves is representable in locally spatial diamonds.
- `representable_locally_spatial_base_obstruction` — A map to a locally spatial diamond from a sheaf that is not locally spatial is not representable in locally spatial diamonds.
- `representable_spatial_iso` — Every isomorphism of sheaves is representable in spatial diamonds.
- `representable_spatial_base_obstruction` — A map to a spatial diamond from a sheaf that is not spatial is not representable in spatial diamonds.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.13 The Berkovich spectrum of a complete Tate ring

**The Berkovich spectrum of a complete Tate ring and the maximal Hausdorff quotient of `Spa`.**
(*berkovich-spectrum-of-a-complete-tate-ring*) Let `R` be a complete Tate ring with a ring of
definition `R₀` and `ϖ ∈ R₀` a topologically nilpotent unit of `R`. The Gel'fand spectrum
`M(R, ‖·‖)` of bounded multiplicative seminorms for the Banach norm `tateNorm d` of `(R₀, ϖ)` with
radius `d.r = 1/2` (AdicSpacesPartII layer R0), with the topology of pointwise convergence, its
compactness and Hausdorffness, its contravariant functoriality `M(B) → M(A)` along bounded ring
maps and Berkovich's maximum formula for the spectral seminorm are AdicSpacesPartIII layer R3
(*gelfand-spectrum-banach-ring*), and none of it is restated; a continuous multiplicative seminorm
normalized by `|ϖ| = 1/2` is bounded by the corresponding Tate norm. Continuity alone does not imply
boundedness for a fixed Banach norm: on `ℚ_p`, the continuous powers `|·|_p^s`, `s ≠ 1`, are not
bounded by a constant times `|·|_p`. This subsection adds the Tate normalisation and the comparison
with `Spa`. Define `BerkovichSpectrum R ϖ` to consist of continuous nonarchimedean
`MulRingSeminorm R` with `α(ϖ) = 1/2`, with the pointwise topology (in `Suggested.lean`,
`BerkovichSpectrum` with its topology instance). For a Tate norm datum `d` with `(d.ϖ : R) = ϖ` and
`d.r = 1/2`, every point satisfies `α(x) ≤ tateNorm d x` for every `x`; and, for a multiplicative
seminorm with this normalization, continuity is equivalent to
`∃ C > 0, ∀ x, α(x) ≤ C * tateNorm d x` (both statements README only). Both statements assume
`IsTopologicalRing R`; the Tate datum supplies the ring of definition and the topologically
nilpotent unit. The Gel'fand comparison (README only) is a homeomorphism to
`{α ∈ M(R, tateNorm d) | α(ϖ) = 1/2}` preserving every evaluation. Its suggested Lean statement
spells out the bounded-seminorm subtype and its induced evaluation topology. For a normed ring with
`‖x‖ = tateNorm d x`, this is R3's `Huber.GelfandSpectrum R` restricted to `α(ϖ) = 1/2`. The
comparison follows from the Tate norm construction in [KL15] Remark 2.4.4, p. 38, and the evaluation
topology of [ECD] Definition 13.7, p. 79. The normalized subspace is closed, so it is compact
Hausdorff when `R` is complete. It gives one representative of each class of continuous
multiplicative seminorms under positive exponents. The Lean carrier `BerkovichSpectrum` is defined
for any topological commutative ring `R` and any `ϖ`, is empty for `ϖ = 0` and for `ϖ = 1` when
`R ≠ 0`, and the Tate hypotheses enter only in the theorems. Completeness is not needed: a
continuous seminorm kills the closure of `0`, so the normalised spectrum of `R` is that of `R̂`, and
the statements need only `R` Hausdorff and Tate; the Lean theorem
`nonempty_t2Quotient_spa_homeomorph` assumes `R` complete and Hausdorff, as [ECD] does. For a second
topologically nilpotent unit `ϖ'`, raising each seminorm to the exponent `s = log 2 / (−log |ϖ'|)`,
which is defined and positive because `0 < |ϖ'| < 1` (`ϖ'` is a unit, so `|ϖ'| ≠ 0`; it is
topologically nilpotent and `|·|` is continuous, so `|ϖ'| < 1`), renormalises `|ϖ'|` to `1/2` and is
a homeomorphism between the two subspaces, so `BerkovichSpectrum R ϖ` is canonically independent of
`ϖ`; the same rescaling after R3's induced map of Gel'fand spectra makes the normalised spectrum
contravariantly functorial along continuous ring maps of Tate rings, which is the functoriality that
D5.14 extends. For an open and integrally closed subring `R⁺ ⊂ R°`, every point of `Spa(R, R⁺)` has
a unique rank-one generalisation: existence is Tau Ceti's
`TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`, a height-one
vertical generisation of a continuous analytic point in `Spa(R, R⁺)` for `R⁺` inside the
power-bounded elements, every point of `Spa` of a Tate ring being analytic
(`isAnalyticPoint_of_isTateRing`); the height-one valuation becomes a real multiplicative seminorm
through Mathlib's `Valuation.RankOne.hom`; uniqueness is proved here. Sending a point to the
normalised seminorm of that generalisation is a continuous surjection
`Spa(R, R⁺) → BerkovichSpectrum R ϖ`, continuous because the value of `|f|` at the rank-one
generalisation of `x` is determined by the rational subsets containing `x`, surjective because a
continuous rank-one valuation is `≤ 1` on the power-bounded elements and hence on `R⁺`, and a
quotient map by Mathlib's `Continuous.isClosedMap` with `Topology.IsClosedMap.isQuotientMap`, the
source being quasicompact (Tau Ceti's `spectralSpace_spa_of_pairOfDefinition`) and the target
compact Hausdorff. It identifies `BerkovichSpectrum R ϖ` with the maximal Hausdorff quotient of
`Spa(R, R⁺)`, Mathlib's `T2Quotient (Spa(R, R⁺))`: each fibre of the surjection is the set of
specialisations of one rank-one point, so every continuous map from `Spa(R, R⁺)` to a Hausdorff
space factors uniquely through it (`T2Quotient.lift`, `continuous_lift`, `lift_mk`, `unique_lift`).
Neither the spectrum nor the quotient depends on `R⁺`: the rank-one points of `Spa(R, R⁺)` are the
same for every `R⁺`. Sending a seminorm to the corresponding rank-one point is a section of sets,
not asserted to be continuous. [ECD] states the result for affinoid perfectoid spaces; its argument
uses only that `R` is Tate, and the general form is what D5.14 extends to small v-sheaves. Define
`BerkovichSpectrum.changeNormalization` as the canonical homeomorphism between the spectra
normalised at two topologically nilpotent units, `BerkovichSpectrum.ofSpa` as the continuous
surjection `Spa(R, R⁺) → BerkovichSpectrum R ϖ` sending a point to its rank-one generalisation and
`BerkovichSpectrum.toSpa` as the set-theoretic section of `ofSpa` selecting the rank-one point of a
seminorm; prove that the rank-one generalisation of a point of `Spa(R, R⁺)` exists and is unique,
that `ofSpa` is natural in `(R, R⁺)` with respect to R3's induced map of Gel'fand spectra followed
by `changeNormalization` (a map of adic spectra sends the rank-one generalisation to the rank-one
generalisation), that `ofSpa` is a quotient map, these three README only, and
`nonempty_t2Quotient_spa_homeomorph` (`BerkovichSpectrum R ϖ` is compact Hausdorff and
`T2Quotient (Spa(R, R⁺)) ≃ₜ BerkovichSpectrum R ϖ`, the universal property) ([ECD] §13, Def. 13.7,
Rem. 13.8 and Prop. 13.9 with proof, p. 79). *Needs:* AdicSpacesPartIII layer R3
(*gelfand-spectrum-banach-ring*: `GelfandSpectrum`, its compactness and Hausdorffness, and the
induced map `M(B) → M(A)`) and AdicSpacesPartII layer R0 (`tateNorm`); Mathlib `MulRingSeminorm`,
`IsTopologicallyNilpotent`, `Valuation.RankOne.hom`, `Continuous.isClosedMap`,
`Topology.IsClosedMap.isQuotientMap`, `T2Quotient`, `T2Quotient.lift`; Tau Ceti
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`,
`TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`,
`TauCeti.ValuationSpectrum.isAnalyticPoint_of_isTateRing`.

**Checks.**

- `s5_13_tateNorm_square` — Under the comparison hypotheses, a normalized point takes `ϖ²` to `1/4`,
  bounded by `tateNorm d (ϖ²)`.
- `s5_13_tateNorm_inverse` — Under the same hypotheses, it takes `ϖ⁻¹` to `2`, bounded by its Tate
  norm; this checks the direction of the bound on values larger than one.
- `s5_13_tateNorm_zero_ring` — On a subsingleton ring, both the continuous normalized carrier and
  the bounded normalized subtype are empty.

- `normalization_identity` (computation) — at `t = 1/2`, the exponent `log 2 / (−log t)` is `1`. The
  suggested value formula for `changeNormalization` fixes the homeomorphism on every seminorm and
  every ring element, not only its source and target.

- `not_injective_on_spa` (non-example) — a rank-two point of `Spa(K⟨T⟩, O_K⟨T⟩)` and its rank-one
  generalization have the same image in `M(K⟨T⟩)`, so `ofSpa` is not injective; a construction that
  returns `Spa` itself, which is not Hausdorff, is wrong.
- `normalization_square` (computation) — for `ϖ' = ϖ²`, `|ϖ²| = 1/4` and the exponent is
  `s = log 2 / log 4 = 1/2`: the change-of-normalization map sends `|·|` to `|·|^{1/2}`.
- `padic_field` (computation) — `M(ℚ_p)` is a single point (AdicSpacesPartIII layer R3,
  `GelfandSpectrum.test_padic`), and at `ϖ = p` the normalised spectrum's point is
  `|·|_p^{log 2 / log p}`: the continuous absolute value `|·|_p^s` has `|p| = 1/2` exactly for
  `s = log 2 / log p`, which fixes the representative.
- `zero_ring` (degenerate) — for `R = 0` (a complete Tate ring under the convention that `ϖ = 0 = 1`
  is a topologically nilpotent unit of the zero ring) the Gel'fand spectrum is empty
  (AdicSpacesPartIII layer R3, `GelfandSpectrum.test_zero_ring`), so the normalised subspace is
  empty, `Spa(R, R⁺) = ∅`, and `∅ → ∅` is a quotient map onto the compact Hausdorff empty space;
  Mathlib's `MulRingSeminorm` has no inhabitant on the zero ring, so the Lean carrier is empty as
  well.
- `degenerate_normalizer` (non-example) — the nonzero nilpotent `ε` in `DualNumber ℚ₂` has seminorm zero, so `BerkovichSpectrum (DualNumber ℚ₂) ε` is empty. For `ϖ = 1`, `|1| = 1 ≠ 1/2` and the carrier is empty; for
  `ϖ` a unit with `|ϖ| = 1` at every continuous seminorm (a unit of a ring of definition) it is
  empty as well; the hypothesis that `ϖ` is a topologically nilpotent unit is what makes `M(R)`
  nonempty for `R ≠ 0` and the exponent of `changeNormalization` defined.
- `rank_two_point` (computation) — for `K` a perfectoid field and `K⁺ ⊂ O_K` an open valuation
  subring of rank two, `Spa(K, K⁺) = {η ⤳ s}` is the Sierpiński space, `M(K)` is a point, and the
  quotient `Spa(K, K⁺) → M(K)` sends both points to the absolute value of `K`; the quotient of
  `Spa(K, O_K) = {η}` is the same point, so shrinking `K⁺` from `O_K` to a rank-two ring adds the
  specialization `s` to `Spa` and changes nothing in `M(K)`.
- `section_not_continuous_disc` (computation) — for the disc `K⟨T⟩` with Gauss point `η`, the
  rational subset `U = {|T| = 1} = {|T| ≤ |1|, |1| ≤ |T|}` is open in `Spa(K⟨T⟩, O_K⟨T⟩)` and
  contains `η`, but `toSpa⁻¹(U) = U ∩ M(K⟨T⟩)` is not open in `M(K⟨T⟩)`: the type-2 points
  `η_{0,r}`, `r → 1⁻`, have `|T| = r < 1` and converge to `η` in the pointwise topology. So the
  section is not continuous, as [ECD] Prop. 13.9 warns.

- `archimedean_empty` (non-example) — for every `ϖ`, `BerkovichSpectrum ℝ ϖ` is empty: a continuous
  nonarchimedean multiplicative seminorm on `ℝ` would satisfy `α(1/n) ≥ 1` for all `n` while
  `1/n → 0`; the nonarchimedean clause excludes archimedean rings before any normalization question
  arises.

`BerkovichSpectrum.comap` is the continuous pullback map for a continuous ring homomorphism
`f : R → S` with `f(ϖ) = ψ`; `comap_apply` fixes its value to `α(f(r))`. For a general map of Tate
rings, first normalize the target at `f(ϖ)` and use `changeNormalization` to compare it with its
chosen normalization. `BerkovichSpectrum.nonarchimedean` (README only) gives the strong triangle
inequality under the open adic ring-of-definition hypotheses, identifying the carrier of continuous
seminorms with the nonarchimedean carrier of [ECD] Definition 13.7, which is the one the Lean
`BerkovichSpectrum` uses.

- `spectrum_comap_identity` — pullback by the identity fixes every normalized seminorm.
- `spectrum_comap_composition` — pullback by `g ∘ f` equals pullback by `g` followed by `f`.
- `spectrum_comap_normalizer` — the pulled-back seminorm takes `ϖ²` to `1/4`.
- `normalization_identity_map` — changing from `ϖ` to itself fixes the actual seminorm.
- `normalization_square_map` — changing from `ϖ` to `ϖ²` sends every value to its square root.
- `nilpotents` — every normalized seminorm on the dual numbers over `ℚ_p` kills the square-zero
  element, since the square of its value is zero.

**`BerkovichSpectrum`.** Points are continuous multiplicative seminorms with a fixed normalization.

**Checks.**

- `s5_13_product_fields` — A product of two p-adic fields, normalized at (p,p), has exactly two
  seminorms, distinguished by its idempotents.
- `definition_BerkovichSpectrum_2` — Zero cannot be a normalizer.
- `definition_BerkovichSpectrum_3` — One cannot be a normalizer, despite being nonzero in a field.

**`BerkovichSpectrum.changeNormalization`.** Renormalizing at the square of the Tate unit takes the square root of every seminorm value.

**Checks.**

- `s5_13_changeNormalization_square_root_value` — Normalizing at ϖ² gives the value √(1/2) at ϖ.
- `changeNormalization_cube` — Normalizing at ϖ³ gives value (1/2)^(2/3) at ϖ², distinguishing the general exponent rule from a square-root rule.
- `s5_13_changeNormalization_square_root_not_half` — After normalizing at ϖ² the value at ϖ is not
  1/2; leaving seminorm values unchanged fails.

**`BerkovichSpectrum.comap`.** Pullback evaluates the target seminorm after the specified ring homomorphism.

**Checks.**

- `s5_13_comap_first_idempotent_one` — For the first projection of a product of p-adic fields, the
  idempotent (1,0) has value one.
- `comap_second_projection` — Pullback along the second projection kills (1,0) and takes (0,1) to one; the selected component matters.
- `s5_13_comap_second_idempotent_zero` — For that same first projection, (0,1) has value zero,
  excluding the second projection.

The rank-one generalization target uses the concrete carrier
`TauCeti.ValuationSpectrum.spa P.plus` for `P : TauCeti.Huber.Pair A` and
`TauCeti.Huber.IsTateRing A`. Its characterization is `∃! y, Nonempty
(Valuation.RankOne y.val.valuation) ∧ y ⤳ x`, with the generalization on the left.
The rank-one step in the proof of [ECD] Proposition 13.9, p. 79, applies here using
Tate analyticity and the height-one vertical generalization of Wedhorn Remark 7.42(2).
The latter is supplied by
`TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`;
uniqueness and the comparison with the normalized real seminorm remain separate assertions.

**`BerkovichSpectrum.ofSpa`.** The continuous map on the actual Huber-pair adic spectrum sends a point to its normalized rank-one generalization. `ofSpa_le_iff` characterizes comparisons of all seminorm values, not just the value on the normalizing unit.

**Checks.**

- `s5_13_ofSpa_idempotent_one` — For a nonzero idempotent at x, the output seminorm has value one on
  that idempotent. On a product of two Tate fields this computes the selected component.
- `s5_13_ofSpa_normalized_point` — On a rank-one point with already normalized seminorm α, the map
  returns α itself.
- `s5_13_ofSpa_idempotent_zero` — If x kills an idempotent, its image has value zero there and
  cannot equal a seminorm taking value one there; a constant or component-swapped map fails.

The section `toSpa` is fixed by the right-inverse equation with `ofSpa` and the rank-one image
condition, and the homeomorphism from `T2Quotient (spa P.plus)` is fixed by requiring its composite
with `T2Quotient.mk` to equal `ofSpa` (both README only; the Lean theorem
`nonempty_t2Quotient_spa_homeomorph` asserts that such a homeomorphism exists). Both use the given
Tate Huber pair and pseudouniformizer, and impose no continuity on `toSpa` ([ECD] 13.9, p. 79).

**`BerkovichSpectrum.toSpa` — Checks.**

- `toSpa_rankOne` — applying the section after `ofSpa` fixes a rank-one point.
- `toSpa_zeroRing` — its image is empty for the zero ring.
- `toSpa_strictSpecialization` — a point with a strict generalization cannot be selected.

**The homeomorphism `T2Quotient (spa P.plus) ≃ₜ BerkovichSpectrum R ϖ` — Checks.**

- `t2QuotientHomeomorph_specializations` — a specialization pair has equal images.
- `t2QuotientHomeomorph_zeroRing` — the quotient of the zero-ring spectrum is empty.
- `t2QuotientHomeomorph_distinctSeminorms` — distinct seminorms have distinct inverse images.

Lean: `BerkovichSpectrum` with its topology instance, and `nonempty_t2Quotient_spa_homeomorph`,
with the proved empty-spectrum example `definition_BerkovichSpectrum_2` at the degenerate
normalizer `ϖ = 0`. The other Checks and constructions are specified in the README only.

### D5.14 The Berkovich space of a small v-sheaf

**The Berkovich space and the maximal Hausdorff quotient of a small v-sheaf.**
(*berkovich-quotient*) Take the Berkovich spectrum `M(R)` of a complete Tate ring from D5.13, with
its normalization `|ϖ| = 1/2`, its change-of-normalization homeomorphisms and the maximal Hausdorff
quotient `Spa(R, R⁺) → M(R)`. The affinoid-perfectoid functor `Spd(R, R⁺) ↦ M(R)` extends to small
v-sheaves by left Kan extension through perfectoid atlases: `B(Y) = |Y|_B = colim_{X → Y} M(O(X))`
over affinoid perfectoid `X`. The extension preserves colimits and comes with a continuous map
`|Y| → |Y|_B`. For qcqs v-sheaves this is the maximal Hausdorff quotient and `|Y|_B` is compact
Hausdorff; the identification writes such a v-sheaf as a quotient of spatial diamonds and uses that
quotients of compact Hausdorff spaces by closed equivalence relations are compact Hausdorff; here
the relation is the compact image of the compact Hausdorff relation space. `|X|_B` is canonically
independent of the choice of `ϖ`. The section `|Y|_B → |Y|` selecting maximal generalizations is a
section of sets and need not be continuous; [ECD] states this explicitly and it is not strengthened.
This subsection proves [ECD] Props. 13.10–13.11; the seminorm spectrum and the affinoid
maximal-Hausdorff theorem are D5.13. The classical affine comparison in ClassicalAdicEtaleCohomology
§3.1 uses the same AdicSpacesPartIII R3.9 Gel'fand spectrum. On a strict affinoid over a complete
nontrivially rank-one valued `ℤ_p`-field, normalizing its seminorms as in D5.13 identifies the
classical quotient map with `BerkovichSpectrum.ofSpa`. Through D6.4's underlying-space
homeomorphism, this is also the affine specialization of `Perf.berkovich`; both maps send a
valuation to its normalized rank-one generalization. Define `Perf.berkovich` as the functor
`Y ↦ |Y|_B` from small v-sheaves to topological spaces and `Perf.berkovich_section` as the
set-theoretic section `|Y|_B → |Y|` with `q ∘ s = id`, which need not be continuous and is
continuous in the profinite and single-point cases; prove `Perf.berkovich_affinoid` (for a complete
perfectoid Tate pair `(R, R⁺)`, `B(Spd(R, R⁺))` is the normalised spectrum `BerkovichSpectrum R ϖ`
of D5.13; its independence of the pseudouniformizer is D5.13's `changeNormalization` and is not
restated), `Perf.berkovich_compactHausdorff` (for `Y` qcqs, `|Y|_B` is compact Hausdorff),
`Perf.berkovich_isQuotientMap` (`|Y| → |Y|_B` is a continuous quotient map),
`Perf.berkovich_universal` (for qcqs `Y`, `|Y|_B` is Hausdorff and every continuous map from `|Y|`
to a Hausdorff space factors uniquely through it) and `Perf.berkovich_preservesColimits` (the
functor preserves colimits, which is how it is extended from affinoids) ([ECD] §13, Def. 13.7, Rem.
13.8 and Prop. 13.9, p. 79, the definition and its basic properties, including the warning on the
section; [ECD] §13, Prop. 13.10 and Prop. 13.11, pp. 79–80, the extension to small v-sheaves and the
qcqs statement). *Needs:* AdicSpacesPartII R0.19.4; D0.16; D4.5; D5.1; D4.7; D3.10; PerfectoidSpaces
layer P2 (perfectoid spaces and glued tilting); D5.13.

**Checks.**

- `point` (degenerate) — for `X = Spa(C, C⁺)`, `|X|_B` is a point.
- `disc` (characterisation) — for an affinoid perfectoid disc with ring `R`, `B(X) = M(R)` as in
  D5.13; no identification with the spectrum of the ordinary rigid disc is asserted.
- `section_not_continuous` (non-example) — the maximal-generalization section is a set section with
  `q ∘ s = id`; continuity is not part of its specification, and a construction asserting it is
  wrong: the disc computation `section_not_continuous_disc` of D5.13 is the witness.
- `empty_and_final` (degenerate) — `|∅|_B = ∅` (the empty colimit), and for the final v-sheaf
  `|Spd 𝔽_p|_B = M(C)/M(Spa(C, O_C) × Spa(C, O_C))` is a point, as is `|Spd 𝔽_p|`.
- `open_disc` (characterisation) — for the open unit disc `𝔻 = ⋃_n 𝔹_n` (not quasicompact),
  `|𝔻|_B = colim_n M(O(𝔹_n))` is the open Berkovich disc with the union topology; `|𝔻| → |𝔻|_B` is
  still a quotient map ([ECD] Prop. 13.10 asks nothing of `Y`), and the compact Hausdorff conclusion
  is the one that needs qcqs.
- `compact_hausdorff_diamond` (characterisation) — for `Y = T̲ × Spa(K, O_K)` with
  `T : CompHaus.{0}`, `|Y|_B = T`.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D5.15 Reduction to spatial diamonds and the Hausdorff cohomology comparison

**Extension to the minimal-plus quotient.** (*minimal-plus-quotient-extension*) Let `C` be an
algebraically closed nonarchimedean perfectoid field of characteristic `p`, and let a profinite
group `G` act continuously and faithfully on `C` by field automorphisms. Let `C⁺min` be the
integral closure of
`𝔽_p + C°°` in `C`. For every totally disconnected `X = Spa(R, R⁺)` of characteristic `p`,
put `X° = Spa(R, R°)`. Construct `Perf.minimalPlusQuotientExtension`, a natural bijection

```text
Hom(X°, Spa(C, O_C)/G) ≃ Hom(X, Spa(C, C⁺min)/G).
```

Restriction to `X°` is its inverse, using the inclusion of the rank-one quotient into the
minimal-plus quotient. Require compatibility with pullback along every map of totally
disconnected test spaces; thus every rank-one map has a unique extension with its specified
restriction. This is the special extension used in [ECD] Proposition 13.12, pp. 80–81,
proved directly from the pair-map calculation in Proposition 18.7(iv) and its proof, pp. 104–105.

For the affine calculation, any continuous map `C → R` sends `C°°` into `R°°` and sends
`𝔽_p` into `R⁺`; integral closure therefore puts its image of `C⁺min` in `R⁺`.
Conversely it sends `O_C` into `R°`. For the quotient, express its profinite `G`-torsors
as compatible finite étale torsors, extend them from `X°` using the finite étale pair
comparison, and form their affinoid inverse limit. Extend the equivariant pair maps by
this calculation and descend; uniqueness on maps and on the torsor descent diagrams gives
uniqueness and naturality on the quotient. *Needs:* D3.10 (profinite torsors); D3.5 (finite étale
descent); D1.3; PerfectoidSpaces P3 (finite étale algebras and their integral plus rings), P5
(affinoid limits); D4.2 (quotient diamonds).

**Checks.**

- `minimalPlusQuotientExtension_trivial_group` — For `G = 1`, a map on `X°` extends by the same
  continuous ring homomorphism `C → R`; no extra choice of a plus-ring homomorphism occurs.
- `minimalPlusQuotientExtension_rank_two` — For `X = Spa(C, C⁺)` with a rank-two plus ring
  and `G = 1`, the identity on `Spa(C, O_C)` extends to the inclusion into
  `Spa(C, C⁺min)` since `C⁺min ⊆ C⁺`. It also specifies the image of the closed rank-two point.
- `minimalPlusQuotientExtension_empty` — The empty test space has exactly one map on either side.
- `minimalPlusQuotientExtension_finite_torsor` — For an open normal subgroup `H ⊆ G`, the finite
  `G/H`-torsor stage of a quotient map extends with its degree `|G/H|` and action unchanged;
  extension is compatible with transition maps as `H` shrinks.

**A qcqs separated diamond maps representably to its maximal Hausdorff quotient, and the cohomology
comparison.** (*reduction-to-spatial-and-hausdorff-cohomology*) Let `Y` be a quasicompact,
object-level quasiseparated diamond, separated over the terminal v-sheaf. Object quasiseparatedness
is the topos condition of AdicSpacesPartII R0.19.10 and is required independently of separatedness
in D3.8 ([ECD] Remark 10.8, p. 51). Then `|Y|_B` is compact Hausdorff by D5.14, and the map from `Y`
to its underlined space is representable in locally spatial diamonds; a qcqs separated diamond
differs from a locally spatial one only through a map to a compact Hausdorff space, which is what
lets every later argument assume spatiality after such a map. Moreover, for `f : |Y| → |Y|_B` the
pullback `f^*` induces a fully faithful functor from `D⁺(|Y|_B, ℤ)` to `D⁺(|Y|, ℤ)`, so that
`H^i(|Y|_B, F) ≅ H^i(|Y|, f^* F)` for every abelian sheaf `F` on `|Y|_B`. This cohomological
assertion is [ECD] 13.13 and is proved with the ordinary sheaf cohomology of layer D0, not with the
later diamond coefficient category; it is the ordinary sheaf-theoretic input to the study of
canonical compactifications, which are not assumed to remain spatial, which is why this non-spatial
geometry is needed. For the geometric representability, the proof constructs `Ȳ` by the early
extension from the rank-one locus into `Spa(C, C⁺_min)/G`, where `C⁺_min` is the integral closure of
`𝔽_p + C°°`; the natural bijection `Perf.minimalPlusQuotientExtension` above supplies existence and
restriction compatibility before the separatedness criterion is used to prove injectivity. For the
cohomological assertion, ordinary proper base change and closed-neighbourhood continuity are
established for pullbacks of arbitrary abelian sheaves on `|Y|_B` and every degree on this
valuative, possibly non-spatial source; irreducible-fibre acyclicity and the coherent-topos limit
theorem alone do not provide the comparison, and both inputs precede the cohomological comparison
([ECD] §13, Prop. 13.12 with proof, pp. 80–81, the first half, with the construction of `Ȳ`; [ECD]
§13, Prop. 13.13 with proof, p. 81, the cohomological comparison). *Needs:*
*minimal-plus-quotient-extension*; D5.14; D5.12; D5.5; D5.4; D3.10; D3.8; SchemeAndStackFoundations
§2.2 (`cech_to_cohomology`, `leray_spectral_sequence`, cited in D0.19); AdicSpacesPartII R0.19.3;
D0.20; D5.8; PerfectoidSpaces layer P4 (residue-field point injection).

**Checks.**

- `rank_two_point` (computation) — for `Y = Spa(C, C⁺)` with `C⁺` of rank two, `|Y| = {η ⤳ s}`,
  `|Y|_B` is a point, so `|Y|_B̲` is the final v-sheaf `Spd 𝔽_p`, the map `Y → Spd 𝔽_p` is the
  structure map, and it is representable in locally spatial diamonds because `Y` is spatial and
  the absolute product `X × Y` is locally spatial for locally spatial `X`, by the absolute-product
  permanence statement *locally-spatial-absolute-product* below (D5.5's `spatial_pullback` needs
  a locally spatial base and does not apply over the final v-sheaf, which is not a diamond); for
  the comparison,
  `Γ(|Y|, f^*F) = (f^*F)_s = F_{pt}` because `|Y|` is the only open neighbourhood of `s`, and `Γ` is
  the exact stalk functor at `s`, so `H^i(|Y|, f^*F) = 0 = H^i(pt, F)` for `i > 0`.
- `spatial_case` (degenerate) — for `Y` spatial, `Y → |Y|_B̲` is representable in locally spatial
  diamonds: for a locally spatial `X → |Y|_B̲`, `X ×_{|Y|_B̲} Y` is the equality locus of the two
  maps `X × Y ⇉ |Y|_B̲` inside the absolute product `X × Y`, which is locally spatial by
  *locally-spatial-absolute-product*; that locus is the preimage of the diagonal of the compact
  Hausdorff `|Y|_B`, a closed subset, under the continuous map `|X × Y| → |Y|_B × |Y|_B`, hence a
  closed immersion into a locally spatial diamond, hence locally spatial (D5.5's closed-immersion
  permanence). D5.5's `spatial_pullback` is not invoked, since `|Y|_B̲` is not a diamond.
- `fibre_is_a_closure` (characterisation) — the fibre `f⁻¹(y)` of `|Y| → |Y|_B` is the closure of
  one rank-one point `ỹ ∈ |Y|` for qcqs separated `Y`, an irreducible space with that generic point.
  Constant-sheaf acyclicity is the fibre calculation; the comparison additionally uses the
  proper-base-change and continuity inputs specified above.
- `frobenius_twisted_dense_orbit_quotient` (non-example for object quasiseparatedness) — let
  `K₀` be the completed perfection of `𝔽_p((t))`, `P = Spa(K₀, K₀°)`, `S = ℤ_p`, and
  `X = P × S̲`, affinoid perfectoid by PerfectoidSpaces P6.8. Let the discrete group `ℤ` act
  by `n · (x, s) = (φⁿ(x), s + n)`, with `φ` absolute Frobenius. The free action has relation
  `R = ⨿_{n∈ℤ} X` with pro-étale projections, so `Y = X/ℤ̲` is a quasicompact diamond (D4.2).
  In `P × P`, with pseudouniformizers `t, u`, the annuli
  `U_N = {|t|^N ≤ |u|, |u|^N ≤ |t|}` cover the product. The graph of `φⁿ` meets `U_N` only
  when `1/N ≤ pⁿ ≤ N`. The action graphs in `X × X` are therefore locally finite, disjoint
  closed immersions, using also the closed translation graphs in `S × S`. Thus
  `R → X × X` is a closed immersion and `Y` is separated by D3.9. It is not object-level
  quasiseparated, since `X ×_Y X = R` is not quasicompact (AdicSpacesPartII R0.19.10). D5.13 gives `B(X) = S`;
  Frobenius fixes the Berkovich point of `P`, and D5.14's ordinary topological colimits give
  `B(Y) = ℤ_p/ℤ`. D4.10 also gives `|Y| = ℤ_p/ℤ`, with the same quotient topology. This
  quotient has more than one point and is indiscrete: any nonempty closed saturated subset of
  `ℤ_p` contains a dense integer orbit, so it is all of `ℤ_p`. In particular `B(Y)` fails `T₀`
  and Hausdorffness, while the fibres of `|Y| → B(Y)` are singletons whose closures are the
  whole space; `padicInteger_denseOrbitQuotient` is this topological calculation.
  This distinguishes D5.14's colimit from the maximal Hausdorff quotient, a point in this example
  ([ECD] Remark 10.8, p. 51; Propositions 13.10–13.11, pp. 79–80; D4.10).

**Absolute products of locally spatial diamonds and fibre products over underlined compact
Hausdorff spaces.** (*locally-spatial-absolute-product*) Prove that the absolute product `X × Y`
(over the terminal v-sheaf `Spd 𝔽_p`, which is *not* a diamond, D5.3) of two locally spatial
diamonds is a locally spatial diamond: it is the diamond `X × Y` of D4.2 ([ECD] Proposition 11.4,
p. 55), with the atlas built from D5.4's affinoid perfectoid presentations over spatial opens of
the factors, locally spatial because a product of two affinoid perfectoid spaces is perfectoid
and the quasi-pro-étale permanence of D5.5 applies chart by chart
([Ked21] Lemma 10.2(a), printed pp. 1229–1230; the perfectoid-product construction is
Lemma 9.3(a), printed p. 1227). It is *not* asserted, and is false, that the absolute
product of two spatial diamonds is spatial: object-level quasi-compactness of the factors does
not give quasi-compactness of their product over the non-quasiseparated terminal object (D2.4),
and the relative statement of D5.5 (`spatial_pullback`, [ECD] Cor. 11.29, p. 67) requires a spatial
*base*, which the terminal v-sheaf is not. Prove also that for a compact Hausdorff space `T` and
maps `X → T̲`, `Y → T̲` from locally spatial diamonds, `X ×_{T̲} Y` is the closed sub-v-sheaf of
`X × Y` cut out by the preimage of the diagonal of `T` under `|X × Y| → T × T`, hence a locally
spatial diamond by closed-immersion permanence (D5.5) — this needs only local spatiality of the
absolute product, and it is the base-change statement that the representability proof of [ECD]
13.12 uses for the map to `|Y|_B̲`; an underlined compact Hausdorff space is never identified with
a locally spatial diamond. *Needs:* D4.2; D5.5; D5.4; D5.3; D2.4; D0.9; D3.8.

**Checks.**

- Non-example (spatial factors, non-spatial product): for the one-point affinoid perfectoid
  `P = Spa(K_0, K_0°)`, `K_0` the completed perfection of `𝔽_p((t))`, a spatial diamond, the
  absolute product `P × P` is the perfectoid punctured open unit disc over the first factor
  (parameter `u` the image of the second factor's `t`; [ECD] proof of Prop. 11.4, p. 55; the
  computation of D2.4 and D4.8), exhausted by the rational annuli
  `U_n = {|t|^n ≤ |u|, |u|^n ≤ |t|}` with no finite subcover (the `K_0`-point `u = t^{N+1}` lies
  outside `U_1, …, U_N`), so it is locally spatial but not quasi-compact, hence not spatial.
- Positive distinction: `P ×_P P ≅ P` is spatial (relative product over a spatial base, D5.5), while
  `P × P` is not; the product with the empty diamond is empty, hence spatial.
- The terminal object `Spd 𝔽_p` is a v-sheaf and not a diamond, consistently with D2.4, D4.8 and
  D5.3's empty-diagram warning.

**Topological proper base change for the Hausdorff quotient.**
(*hausdorff-quotient-proper-base-change*) Let `Y` be a quasicompact, object-level quasiseparated
diamond separated over the terminal v-sheaf, `|Y|` its underlying space — quasi-compact, possibly
non-Hausdorff and *not assumed spectral* (the interval diamond below has `|Y| ≅ [0, 1]`, which is
not spectral, D4.6) — `|Y|_B` its maximal Hausdorff quotient (compact Hausdorff by the qcqs
hypothesis, D5.14) and `q : |Y| → |Y|_B` the continuous quotient surjection. It is closed because a
closed subset of the quasicompact source has quasicompact image in the Hausdorff target. Its fibres
are the closures of single rank-one points (`fibre_is_a_closure`), each a spectral space with a
unique generic point. Prove, for every abelian sheaf `G` on `|Y|_B` and every `i ≥ 0`, the
comparison `(R^i q_* q^{-1}G)_b ≅ H^i(q^{-1}(b), q^{-1}G|_{q^{-1}(b)})` (this
pulled-back-coefficient form is what `Perf.berkovich_derived_fullyFaithful` needs; the same
statement for an arbitrary abelian sheaf `F` on `|Y|` is asserted only if proved in the same
generality), by the closed-neighbourhood route: the closed neighbourhoods `K` of `b` in `|Y|_B` with
`b ∈ int(K)` are cofinal among the neighbourhoods of `b` (compact Hausdorff), their inverse images
`q^{-1}(K)`, closed since `q` is continuous, are cofinal among the neighbourhoods of the fibre
`q^{-1}(b)` because `q` is closed, and `q^{-1}(b) = ⋂_K q^{-1}(K)`; the cohomological continuity
statement to prove is `colim_K H^i(q^{-1}(K), q^{-1}G) ≅ H^i(q^{-1}(b), q^{-1}G)` for this
cofiltered system of closed subsets of the quasi-compact space `|Y|` (stated and proved here for the
quotient maps of qcqs separated diamonds, by the quasi-compactness of `|Y|` and the pulled-back
coefficients, which are constant along the fibres; no spectrality of `|Y|` is used, and the spectral
space of the argument is the *fibre*, as in [ECD] §13, proof of Prop. 13.13, p. 81). With the fibre
acyclicity of `fibre_is_a_closure` this gives `R^i q_* q^{-1} G = 0` for `i > 0` and
`q_* q^{-1} G = G`, hence the comparison of *reduction-to-spatial-and-hausdorff-cohomology*; D0.19's
Čech/Leray statements supply the spectral sequence only, and no later diamond proper-base-change
theorem is used. *Needs:* AdicSpacesPartII R0.19.3; D0.19; D0.20; D4.6; D5.14.

**Checks.**

- Non-spectral source: for `T = [0, 1]` and a characteristic-`p` perfectoid field `C`,
  `Y = T̲ × Spa(C, O_C)` is a qcqs separated diamond (D4.6, [ECD] Ex. 11.12): a profinite
  presentation `S → T` has closed profinite relation `S ×_T S`, so the perfectoid atlas and
  its relation are quasicompact; separatedness follows from the closed diagonals of `T` and
  `Spa(C, O_C)`. Its underlying space `|Y| ≅ T` is Hausdorff, so `|Y|_B = T`, `q = id_T` and
  the comparison is the identity; `T` is not
  spectral (`interval_not_spectral`), so a proof assuming an ambient spectral source would exclude
  this permitted input.
- Non-Hausdorff source: for `Y = Spa(C, C⁺)` with `C⁺` of rank two (`rank_two_point`), `|Y| = {η ⤳ s}`
  is not Hausdorff, `|Y|_B` is a point, the fibre is the whole two-point space with generic point
  `η`, and the comparison reduces to the stalk at `s`; a proof imposing Hausdorffness on the source
  would exclude this input. Both Checks reach the stalk comparison, not only the acyclicity of an
  isolated fibre.
- Failure without object quasiseparatedness: `frobenius_twisted_dense_orbit_quotient` has
  `|Y| = B(Y) = ℤ_p/ℤ`, indiscrete with multiple points. Its quotient fibres are singletons,
  but every point has the whole space as its closure. Thus compact Hausdorffness and the
  spectral closure-fibre description require the object quasiseparatedness hypothesis even
  when `Y` is quasicompact and separated.

`Perf.berkovich_representable` specifies the map to the underlined Berkovich
space by its value on every test section. It assumes a quasicompact, object-level quasiseparated
diamond separated over the terminal v-sheaf and concludes locally spatial representability
([ECD] 13.12, pp. 80–81). With the same geometric hypotheses,
`Perf.berkovich_derived_fullyFaithful` gives a fully faithful functor on
`DerivedCategory.Plus`, identified by its localization square with degreewise
`TopCat.Sheaf.pullback`. `Perf.berkovich_cohomology` compares Mathlib's `Sheaf.H`
in every nonnegative degree for every abelian sheaf. `HasDerivedCategory` and
`HasExt` specify the universes of the standard categorical constructions
([ECD] 13.13, p. 81).

Lean: none; the topological calculation `padicInteger_denseOrbitQuotient` in
`frobenius_twisted_dense_orbit_quotient` and the geometric reduction, closure-fibre and cohomology
statements are specified in the README only.

### D5.16 Components of restricted group quotients

The last subsection gives the component formula for group quotients.

**Components of restricted group quotients.** (*components-of-restricted-quotients*) Let a
topological group `G` act continuously on a topological space `X`, and give both orbit spaces their
quotient topologies. Connected components of `X` map into connected components of the orbit space,
giving the canonical map of sets `B := (ConnectedComponents X)/G → ConnectedComponents (X/G)`. If
`B` is totally disconnected, this map is a bijection of sets: total disconnectedness of the
component-orbit space prevents distinct orbits from acquiring a new connected union. A sufficient
condition is that the `G`-invariant clopens of `X` separate distinct `G`-orbits of components. In
particular, for `X` spectral and `G` profinite with continuous action, `B` is profinite and the
formula holds; this specialization uses invariant clopens and compactness. For a locally spatial
diamond torsor `F → Y` under the noncompact `G(ℚ_p)` or `Γ_K` with connected base `Y`, the desired
conclusion in the period-space applications of [GLX] is transitivity on `π₀(F)`; this requires
verifying the separation hypothesis or an independent geometric transitivity proof, and the
profinite corollary does not establish it. [GLX] Lemma 3.2 (v3, p. 16) assumes a locally profinite
acting group, small source and quotient v-sheaves, and the sheaf quotient identity, as specified in
D4.10. Under precisely those hypotheses its second conclusion, the component formula, is false: the
dense-orbit example in the Checks has a discrete locally profinite acting group and both sheaves are
diamonds. The component assertion holds with the total-disconnectedness hypothesis stated here. The
restricted statement is true because the continuous `G`-invariant map `X → B` factors through a
continuous map `X/G → B`, which is constant on connected components of `X/G` when `B` is totally
disconnected; the invariant-clopen condition gives clopens of `B` separating its points; and for `X`
spectral and `G` profinite the stabilizer of a clopen is open in `G`, so the intersection of its
finitely many translates is an invariant clopen separating two disjoint compact orbits. The orbit
space of `X` is Mathlib's `MulAction.orbitRel.Quotient G X`, the quotient by
`MulAction.orbitRel G X`, with its quotient topology; it is not redefined. Define
`componentOrbitSpace G X` as the quotient of `ConnectedComponents X` by the orbit relation
`componentOrbitRel` (transitive because each `g` carries components onto components; it is
`MulAction.orbitRel` for the induced action of `G` on `ConnectedComponents X` once that action is
defined), with the quotient topology; prove `ComponentsOfRestrictedQuotients` (the bijection of sets
under the total-disconnectedness hypothesis), `componentOrbitSpace_totallyDisconnected_of_clopens`
(the separating invariant-clopen criterion) and `componentOrbitSpace_profinite` (compactness,
Hausdorffness and total disconnectedness for a compact topological group acting on a spectral space)
([GLX] §3, Lem. 3.2, pp. 16–17; [GLX] §3, Prop. 3.12, p. 24; [GLX] §6, Prop. 6.6(2), p. 45, and Lem.
6.12, p. 50, the uses). In `Suggested.lean`, `connectedComponents_mk_quotient_eq_iff` states the
case of a compact group acting on a spectral space pointwise: two points have the same component in
the orbit space iff one lies in the component of a translate of the other. *Needs:* D0.6; D4.10;
Mathlib `MulAction.orbitRel`, `MulAction.orbitRel.Quotient`.

**Checks.**

- `component_orbits_empty` (degenerate) — the space of component orbits of the empty space is
  empty, for every continuous group action.
- `component_orbits_connected` (computation) — a nonempty connected space has one component
  orbit. `ComponentsOfRestrictedQuotients_mk` fixes the comparison on the class of every point.
- `component_orbits_totally_disconnected` (agreement) — when `X` is totally disconnected,
  taking component orbits is the ordinary orbit quotient `MulAction.orbitRel.Quotient G X`,
  with its quotient topology. Compactness of `G` is not needed for this identification.


- `dense_orbits` (non-example, computed) — `X = ℤ_p`, `G = ℤ` acting by translation: `π₀(X) = ℤ_p`,
  and a nonempty `ℤ`-invariant open subset of `ℤ_p` contains some ball `a + p^n ℤ_p` and hence
  `ℤ + a + p^n ℤ_p = ℤ_p`; so `B = X/G = ℤ_p/ℤ` is indiscrete with uncountably many points,
  connected and not totally disconnected, `ConnectedComponents (X/G)` is one point, and
  `B → ConnectedComponents (X/G)` is not injective. The same with `X = ℤ̲_p × Spa(C, O_C)` is the
  dense-orbit quotient diamond satisfying the hypotheses of [GLX] Lemma 3.2 (v3, p. 16)
  and disproving its second conclusion.
- `two_point_compactification` (non-example, computed) — `X = ℤ̄ = {−∞} ∪ ℤ ∪ {+∞}` profinite, hence
  spectral, `G = ℤ` acting by translation and fixing `±∞`: `X/G` has three points `[ℤ], [−∞], [+∞]`
  with opens `∅, {[ℤ]}, {[ℤ], [−∞]}, {[ℤ], [+∞]}, X/G`, so it is connected, `B = X/G` has three
  points, and the map is `3 → 1`; spectrality of `X` alone is not enough, the compactness of `G` is
  used.
- `profinite_action` (positive control) — `X = ℤ_p`, `G = ℤ_p` acting by translation: `B = X/G` is a
  point, `X/G` is a point, and the formula holds; `X = S` profinite with `G` finite acting by
  permutations: `B = S/G` is profinite and equals `ConnectedComponents (S/G)`.
- `trivial_group` (degenerate) — for `G = 1` the map is the identity of `ConnectedComponents X`, and
  `B = ConnectedComponents X` is totally disconnected by D0.6 when `X` is spectral.

The orbit-relation Checks `component_relation_connected` and `component_relation_discrete` compute
the total relation for a nonempty connected space and the ordinary point-orbit relation for a
totally disconnected space. Together with `trivial_group` they pin `componentOrbitRel` and
`ComponentOrbitSetoid`; the empty, connected and totally disconnected quotient Checks above pin
`componentOrbitSpace`. In `two_point_compactification`, use `WithBot (WithTop ℤ)` with its order
topology and the translation action fixing both endpoints. This Check fixes that
action on every integer and both endpoints and computes three component orbits and a connected orbit
space.

**`componentOrbitRel`.** The relation concerns translates of components, not equality of components.

**Checks.**

- `definition_componentOrbitRel_1` — Translation of a discrete group on itself relates every two
  components.
- `definition_componentOrbitRel_2` — For a trivial group on a connected space every pair of
  components is related.
- `definition_componentOrbitRel_3` — For a trivial group distinct components remain unrelated.

**`ComponentOrbitSetoid`.** For a group `G` with a topology acting continuously on `X`,
the setoid quotients by the induced action on connected components. Its signature requires
`[ContinuousSMul G X]`: continuity ensures that each group element carries a connected
component onto a connected component, which makes `componentOrbitRel` transitive.

**Checks.**

- `componentOrbitRel_discontinuous_not_transitive` (non-example) — Give `Bool × Bool` the
  partition topology with components `{(false,false)}`, `{(false,true), (true,false)}` and
  `{(true,true)}`. The discrete group `Equiv.Perm Bool` acts on the second coordinate.
  Its nonidentity element swaps the first two points and the last two points. The component
  relation relates the first component to the middle and the middle to the last, but not the
  first to the last. This action is discontinuous, so it cannot define `ComponentOrbitSetoid`.
- `definition_ComponentOrbitSetoid_1` — Translation of the discrete integers identifies all
  component classes.
- `definition_ComponentOrbitSetoid_2` — For a connected space the quotient of the setoid has one
  element.
- `definition_ComponentOrbitSetoid_3` — For a trivial group distinct components define distinct
  quotient classes.

**`componentOrbitSpace`.** The quotient is taken after connected components, with the quotient topology.

`componentOrbitSpace_discrete` states that for a group `G` with a topology acting continuously
on a discrete space `X`, the component-orbit quotient is discrete. It uses Mathlib's
`ConnectedComponents` topology (`Topology/Connected/LocallyConnected.lean`) and the quotient
topology: the preimage of every subset is open. This supplies total disconnectedness for the
finite discrete actions in the following Checks.

**Checks.**

- `definition_componentOrbitSpace_1` — A group acting on itself by translation has a one-element
  component-orbit space.
- `componentOrbitSpace_trivial_action` — The trivial group acting on discrete Bool has exactly two component orbits.
- `definition_componentOrbitSpace_3` — For a trivial group and distinct components the
  component-orbit space is not a singleton.

**`ComponentsOfRestrictedQuotients`.** The comparison is induced by the orbit projection on points.

**Checks.**

- `ComponentsOfRestrictedQuotients_regular_zmod_two` — For the regular action of the two-element group on itself, the classes of zero and one have the same image and the orbit space has one connected component.
- `ComponentsOfRestrictedQuotients_trivial_bool_action` — For the trivial group acting on discrete `Bool`, the comparison has distinct values on `false` and `true`, and the orbit space has two connected components.
- `ComponentsOfRestrictedQuotients_false_not_true_orbit` — For the trivial action on discrete `Bool`, the comparison does not send the component of `false` to the component of the orbit of `true`.

**Berkovich realization on the geometric site.** `Geometry.SmallVSheaf` is the full
subcategory cut out by the small-v-sheaf predicate, and `Geometry.represented` embeds
perfectoid representables. `Perf.berkovich` is the colimit extension from perfectoid
affinoids; `Perf.berkovichQuotient` is its natural continuous quotient map.
`Perf.berkovich_affinoid` identifies this map with the normalized rank-one seminorm
map, through `Geometry.affinePoint`. `Perf.berkovich_section` is the set-theoretic
section selecting the maximal generalization; its retraction equation, generalization
condition and naturality are `berkovich_section_spec` and `berkovich_section_naturality`
([ECD] Propositions 13.9–13.10). The Hausdorff and universal-factorization targets
assume qcqs ([ECD] Proposition 13.11).

The localization and locally closed generalizing-subdiamond comparisons are on this
same site. Their homeomorphisms commute with the specified inclusion into the base.
`Perf.Diamond.localization_isLimit` states the universal cone property over every
quasicompact open neighbourhood and the spatiality of the result ([ECD] Lemma 11.22
and the proof of Lemma 11.31).

**`Perf.berkovich` — Checks.**

- `berkovich_field_singleton` — A perfectoid field has a one-point Berkovich space, independently of its plus ring.
- `berkovich_empty_affinoid` — The zero perfectoid pair has empty Berkovich space.
- `berkovich_affinoid_hausdorff` — The affine Berkovich space is Hausdorff, even when the valuation spectrum is not.

**`Perf.berkovichQuotient` — Checks.**

- `berkovich_quotient_field_constant` — The quotient for a field sends all valuation refinements to the same point.
- `berkovich_quotient_t1_bijection` — When the realization is T₁, the quotient is bijective.
- `berkovich_quotient_noninjective_field` — Two distinct valuation refinements of one field show that the quotient need not be injective.

**`Perf.berkovich_section` — Checks.**

- `berkovich_section_injective` — The set-theoretic section is injective.
- `berkovich_section_t1_inverse` — On a T₁ realization the section also satisfies the other inverse equation.
- `berkovich_section_rejects_nonmaximal` — For a qcqs sheaf the section never chooses a point admitting a strict generalization.

Lean: `connectedComponents_mk_quotient_eq_iff`. The README calculation
`padicInteger_denseOrbitQuotient` shows that compactness of the group cannot be dropped; the rest
of this subsection is specified in the README only.

### Examples

The worked examples of this layer are the checks above and the acceptance cases of the theorems: a
qcqs perfectoid space as a spatial diamond and a non-quasicompact one as locally spatial but not
spatial; `T̲ × Spa(K, O_K)` for `T : CompHaus.{0}` not profinite, a qcqs diamond that is not
spatial, and the same space with `|Y|_B = T` as its Berkovich space; spectrality of `|Y|` against
the requirement of a basis of qc open subfunctors; the quasicompact injection into a non-spatial
diamond for which spatiality fails; the finite étale covers in the class `E` made spatial by finite
étale permanence; the splitting criterion for covers in `E` and the affinoid-components criterion
that the universally open presentation terminates in; the non-separated `g` for which
two-out-of-three fails; the valuation-field diamond with one closed point, whose localization at
that point is everything, against localization at a maximal generalization; the whole, open and
empty generalizing subdiamonds and the non-generalizing closed point of a specialization chain; a
diamond `Y` as base of a map representable in diamonds exactly when the source is a diamond, a
quasi-pro-étale map of locally spatial diamonds, a morphism of diamonds not representable in
perfectoid spaces, and the charted geometric point of the classifying stack of a locally profinite
`G : Type`; a
rank-two point and its rank-one generalization with the same image in the normalised Berkovich
spectrum, and the change of normalization `ϖ' = ϖ²`; `|Spa(C, C⁺)|_B` a point, the affinoid
perfectoid disc, and the set-theoretic maximal-generalization section that is not continuous. The
degenerate and negative instances are also recorded as checks: the empty diamond and `Spa(C, C⁺)` as
spatial diamonds; the empty diagram, whose limit `Spd 𝔽_p` is a non-quasiseparated v-sheaf that is
not a diamond; the presentations of `Spa(C, C⁺)` and `Spa(K, O_K)`; the finite doubling of a closed
point, for which two-out-of-three holds without separatedness, against the `ℕ̄`-fold doubling
`Y₁/E`, for which it fails; the Gauss point, whose generalization set is not locally closed;
`Y_{{s}} = ∅` for the closed point of a rank-two `Spa(C, C⁺)`; the empty and finite profinite sets
and the discrete `ℕ` whose projection is not closed; the identity of `T̲ × Spa(K, O_K)` and the
closed disc over a point for the two representability checks; `M(ℚ_p)` at `ϖ = p`, the zero ring,
the normalizers `ϖ = 0, 1`, the rank-two `Spa(K, K⁺)` with its unchanged quotient, and the rational
subset `{|T| = 1}` on which the section fails to be continuous; the open disc and `Spd 𝔽_p` for the
Berkovich space; the rank-two point for the cohomology comparison; and, for restricted quotients,
`ℤ` acting on `ℤ_p` with dense orbits, `ℤ` acting on its two-point compactification, and the
profinite positive controls. Further: the quotient of `Spa(K, O_K)` by the powers of Frobenius, one
point and not quasiseparated; `⊔_ℕ Spa(C, O_C) → Spa(C, O_C)`, locally spectral on spaces and not
`IsSpectralMap`; the lower-universe and two cardinal controls of D5.3; and
`Spa(C', O_{C'}) → Spa(C, O_C)`, a v-surjection along which only the third descent statement of D5.12 applies.

The proved D5 example in `Suggested.lean` excludes the degenerate normalizer `ϖ = 0`.
`padicInteger_denseOrbitQuotient` is the connected orbit-space boundary for noncompact `ℤ`.

### Dependencies

Layer D0: locally spectral spaces and locally spectral maps (AdicSpacesPartII R0.0),
pro-constructible subsets (AdicSpacesPartII R0.19.2), the closure of a pro-constructible subset as
its set of specializations (AdicSpacesPartII R0.19.3), the profinite connected-component space
(D0.6), surjective generalizing spectral maps as quotient maps (AdicSpacesPartII R0.19.4), the
spectral quotient criterion and its open case (D0.9), cofiltered inverse limits of spectral spaces
(AdicSpacesPartII R0.19.6), ordinal assembly of cofiltered limits (D0.14), profinite presentations
of compact Hausdorff spaces (D0.16), quasicompact and quasiseparated objects and morphisms in a
topos and algebraic topoi (AdicSpacesPartII R0.19.10), the Čech-to-derived and Leray spectral
sequences and the acyclic-basis comparison cited in D0.19 from SchemeAndStackFoundations §2.2,
flasque constant sheaves (D0.20) and the cofinal class of cutoff cardinals (D0.23). Layer D1:
strictly totally disconnected perfectoid spaces (D1.4), pro-constructible generalizing subsets of a
totally disconnected space (D1.5), the universally open affinoid pro-étale strictly totally
disconnected cover (D1.9) and the profinite rank-one fibre criterion for pro-étaleness (D1.10).
Layer D3: separated étale and finite étale perfectoid spaces as v-stacks (D3.5), étale, finite étale
and quasi-pro-étale morphisms of pro-étale stacks (D3.6), sub-v-sheaves of a totally disconnected
space and quasicompact injections (D3.7), open and closed immersions, separated maps and 0-truncated
maps (D3.8) and torsors under a locally profinite group (D3.10). Layer D4: diamonds and pro-étale
equivalence relations (D4.1), the atlas criterion for diamonds (D4.3), diamonds as v-sheaves (D4.4),
the underlying space of a diamond and the open-subfunctor correspondence (D4.5), compact Hausdorff
spaces as diamonds (D4.6), small v-sheaves and small v-stacks (D4.7), underlying spaces of small
v-stacks (D4.8), isomorphism and injectivity criteria on geometric points (D4.9), small quotients of
v-sheaves (D4.10) and proper maps (D4.11). PerfectoidSpaces layer P2 (perfectoid spaces and glued
tilting), layer P4 (residue-field point injection) and layer P5 (finite-stage descent of qcqs étale
objects), with P5.7, P6.1–P6.2 and P6.10 in D5.3–D5.4. AdicSpacesPartII layer R0 (`tateNorm`) and
AdicSpacesPartIII layer R3 (the Gel'fand spectrum of a Banach ring, *gelfand-spectrum-banach-ring*).
Mathlib `MulRingSeminorm`, `IsTopologicallyNilpotent`, `IsAdic`, `Valuation.RankOne.hom`,
`Continuous.isClosedMap`, `Topology.IsClosedMap.isQuotientMap`, `T2Quotient`, `MulAction.orbitRel`
and `MulAction.orbitRel.Quotient`; Tau Ceti
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`,
`TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic` and
`TauCeti.ValuationSpectrum.isAnalyticPoint_of_isTateRing`.

## Layer D6: analytic and integral diamondification

The layer attaches v-sheaves on `Perf` to adic spaces. Marked untilts provide the mapping functors:
`Spd ℤ_p` is the functor of marked untilts, `Spd(A, A⁺)` for a Tate `ℤ_p`-pair adds a continuous map
of pairs, and the uniqueness of a marked untilt descended along a v-cover is what makes these
functors sheaves rather than stacks. A finite étale torsor tower with perfectoid completion,
supplied by PerfectoidSpaces P6.16–P6.17 from AdicEtaleGeometry A4.3–A4.5 and A4.7 after the
separated completion of the Tate pair, presents `Spd(A, A⁺)` as a spatial diamond with underlying
space `|Spa(A, A⁺)|`; `Spd` of a rational localisation is the corresponding open subfunctor, so the
construction glues to the diamond `Y^◇` of every analytic adic space `Y` over `ℤ_p`, a locally
spatial diamond with `|Y^◇| = |Y|` whose étale and finite étale sites are those of `Y`. The broader
integral pre-adic mapping functor produces small v-sheaves for arbitrary pre-adic spaces over
`Spa(ℤ_p, ℤ_p)`, retains the special fibre, recovers the analytic construction on the analytic
locus, has a Galois quotient description for `Spd O_K`, and has a point map that is a continuous
surjection but, off the analytic locus, not a homeomorphism in general. The final rigid comparison
fixes a base field `K/ℚ_p` and assumes seminormality on the source: diamondification is fully
faithful on seminormal rigid `K`-varieties over `Spd K`, and nothing stronger is claimed for
analytic adic spaces in general.

### D6.1 `Spd ℤ_p` and `Spd(A, A⁺)` by marked untilts

The first five targets build the analytic theory: the marked-untilt functors, descent of untilts
along a v-cover, the spatial-diamond presentation of `Spd(A, A⁺)`, gluing along rational subsets to
the diamond of an analytic adic space, and the comparison of étale sites.

**`Spd ℤ_p` and `Spd(A, A⁺)` by marked untilts.** (*spd-of-a-tate-pair*) Let `Spd ℤ_p` be the
functor on `Perf` sending `X` to the set of isomorphism classes of pairs `(X♯, ι)` where `X♯` is a
perfectoid space and `ι` is an identification of the tilt of `X♯` with `X`. For a Tate `ℤ_p`-algebra
`A` with an open and integrally closed subring `A⁺ ⊂ A`, let `Spd(A, A⁺)` send `X` to the set of
isomorphism classes of pairs consisting of such an `(X♯, ι)` together with a continuous map of pairs
`(A, A⁺) → (O(X♯), O⁺(X♯))`. Both are v-sheaves. Marked untilts have no automorphisms, which is what
makes these functors and not stacks. Functoriality is not formal: for `f : X' → X` and an untilt
`X♯` of `X`, one defines `(X')♯` using that perfectoid spaces over `X♯` are equivalent to perfectoid
spaces over its tilt, the slice equivalence of PerfectoidSpaces layer P2, and the absence of
automorphisms of the pair `(X♯, ι)` follows from the same equivalence. The v-sheaf property of
`Spd(A, A⁺)` follows from that of `Spd ℤ_p` together with the v-sheaf property of `O` and `O⁺`. A
Tate pair satisfies the extra `IsTateRing` hypothesis of `Perf.Spd`, while a formal base such as
`(ℤ_p, ℤ_p)` uses `PreAdic.Spd` directly. Both use the same marked-map construction of D6.6. Define
`Perf.SpdZp` by evaluating `PreAdic.Spd` at `(ℤ_p, ℤ_p)` and `Perf.Spd` by restricting `PreAdic.Spd`
to complete Tate pairs. The named theorems `Perf.SpdZp.isVSheaf` and `Perf.Spd.isVSheaf` extract the
sheaf property of these objects, supplied by `PreAdic.diamond_isVSheaf`. Prove `Perf.SpdZp.isVSheaf`
(`Spd ℤ_p` is a v-sheaf), `Perf.SpdZp.noAutomorphisms` (a marked untilt has no nontrivial
automorphisms, so the functor is set-valued), `Perf.Spd.isVSheaf` (`Spd(A, A⁺)` is a v-sheaf),
`Perf.Spd.functorial` (`(A, A⁺) ↦ Spd(A, A⁺)` is a contravariant functor on Tate `ℤ_p`-pairs),
`Perf.Spd.ofPerfectoid` (for a perfectoid pair, `Spd(A, A⁺)` is represented by `Spa` of the tilt,
which is the slice equivalence again) and `Perf.Spd.rationalSubset` (for `U` a rational subset of
`Spa(A, A⁺)`, `Spd(O(U), O⁺(U)) → Spd(A, A⁺)` is the open subfunctor attached to `U`).
`Spd ℚ_p = Spd(ℚ_p, ℤ_p)` is a diamond (D6.3) that is not representable; it is the basic example of
a diamond that is not a perfectoid space. `Spd ℤ_p` itself is a v-sheaf that is not a diamond: its
closed subfunctor `Spd 𝔽_p` of untilts with `p = 0` is the final sheaf `*`, which is not a diamond
(`total_relation` in D4.1), and an injection of v-sheaves into a diamond is a diamond (D4.4). Its
analytic locus, the open subfunctor where `p` is invertible, is `Spd ℚ_p`. For a point
`Spa(C♭, O_{C♭})`, with `C` algebraically closed of characteristic zero, the identity untilt `C♭`
and the marked untilt `C` are distinct: an isomorphism would identify fields of different
characteristics. No cardinality classification of the other untilts is used. Smallness of the
Tate-pair functor `Spd(A, A⁺)` follows from the perfectoid atlas of [ECD] Proposition 15.4 and
Definition 12.1; neither Lemma 15.1 nor [Berkeley] Lemma 18.1.1 states an integral smallness
assertion, and the smallness of the integral `X^◇` is the separate target of D6.6. A fixed
characteristic-zero point together with a characteristic-`p` point is not an atlas of `Spd ℤ_p`: a
v-cover must induce a quotient map on underlying spaces, whereas these two discrete strata do not
recover the specialization from the generic to the closed point. ([ECD] §15, Lem. 15.1 with proof,
pp. 89–90; [ECD] §15, proof of Lem. 15.1, p. 89, for the absence of automorphisms; [ECD] §15, Lem.
15.2 with proof, p. 90, for the perfectoid case). *Needs:* Mathlib `WittVector`; D2.7; D2.8; D4.1;
D4.4; PerfectoidSpaces layer P1 (Fontaine's `θ` and the primitive kernel, untilts classified by
primitive ideals, the tilt of a perfectoid Tate ring); PerfectoidSpaces layer P2 (perfectoid spaces
and glued tilting); PerfectoidSpaces layer P0 (almost modules over a perfectoid base);
PerfectoidSpaces P6.16–P6.17 (perfectoid cover presentation); AdicEtaleGeometry A4.5 (finite étale
effective descent along a tower); AdicEtaleGeometry layer A1 (the generalised étale site, the finite
étale site, Yoneda and adic fibre products).

**Checks.**

- `perfectoid_pair` — For a perfectoid field with power-bounded plus ring, the realization of `Spd` has exactly one point, whose singleton is closed.
- `spd_qp` (non-example) — `Spd ℚ_p` is a v-sheaf that is not representable by a perfectoid space, a
  distinction the construction must detect.
- `no_automorphisms` (non-example) — the groupoid of marked untilts of a fixed `X` is discrete; a
  construction producing a nontrivial automorphism group is wrong.
- `formal_base_excluded` / `Spd_formal_base_excluded` (non-example) — the supplied theorem
  `TauCeti.Huber.PadicInt.not_isTateRing` rules out the Tate-ring hypothesis required by
  `Perf.Spd` for `(ℤ_p, ℤ_p)`. Its integral v-sheaf is `Perf.SpdZp`, defined using `PreAdic.Spd`.
- `Spd_integral_agreement` (agreement) — on a complete Tate pair, `Perf.Spd` equals
  `PreAdic.Spd` by definition.
- `Spd_perfectoid_pair` — For the zero perfectoid pair, both the realization of `Spd` and the underlying space of its affine tilt are empty.
- `Spd_zero_pair` (degenerate case) — for a complete Tate pair with zero underlying ring,
  `Perf.Spd` is the initial v-sheaf.
- `SpdZp_integral_pair` (agreement) — for any Huber pair on `ℤ_[p]` whose plus subring is `⊤`,
  `PreAdic.Spd` equals `Perf.SpdZp`.
- `point_diamond` (degenerate case) — for `C` algebraically closed of characteristic `0`,
  `Spd(C, O_C)` is the one-point perfectoid space `Spa(C♭, O_{C♭})`, the tilt point.
- `spd_zp_not_diamond` (non-example) — `Spd ℤ_p` is a v-sheaf with analytic locus `Spd ℚ_p`
  and closed complement `Spd 𝔽_p = *`; it is not a diamond, since `*` is not and sub-v-sheaves of
  diamonds are diamonds; a construction that produces a diamond presentation of `Spd ℤ_p` is wrong.
- `untilts_of_a_point` (computation) — the identity untilt `C♭` and the characteristic-zero
  untilt `C` give two distinct classes; their fields cannot be isomorphic because `p = 0` in one
  and `p ≠ 0` in the other.
- `two_piece_atlas_fails` (non-example) — the map from the discrete union of the generic and special
  points to the two-point space `|Spd ℤ_p|` is a continuous bijection but is not a quotient map: the
  inverse image of the closed singleton is open although that singleton is not open. This excludes
  the two fixed-untilt points as a v-cover of `Spd ℤ_p`: a continuous bijection alone does not
  satisfy the quotient-topology condition. The two-point convention has `true` generic and `false`
  closed, as in AdicSpacesPartII R0.0.

Marked untilts are objects of `Geometry.Perfd p` equipped with an identification of
their image under `Geometry.tilt p` with the given object of `Geometry.Perf p`.
Restriction of a marked untilt along a morphism is given by a Cartesian lift.
`Perf.SpdZp p` is `PreAdic.Spd p` of the integral p-adic integer pair;
`Perf.Spd p R` restricts `PreAdic.Spd p R` to complete pairs with
`TauCeti.Huber.IsTateRing R.A`. The underlying two-point space of `Perf.SpdZp p`
retains the nonanalytic closed point. The characteristic argument in `untilts_of_a_point`
and the quotient-topology argument in `two_piece_atlas_fails` give the corresponding
algebraic and topological controls.

`Perf.SpdZp.noAutomorphisms` uses `PreAdic.MarkedMap` with the geometric tilting and
inclusion functors: an isomorphism of its untilt that fixes the marking equals the identity,
even without assuming compatibility with its map to the target. This is the rigidity argument
in [ECD] Lemma 15.1, p. 89. `Perf.Spd.functorial` specifies the functor on complete Huber
pairs by its objects and its maps: a pair morphism acts through its affine-spectrum map and
postcomposition of marked maps. Restricting it to Tate pairs gives the stated contravariance.
`Perf.Spd.ofPerfectoid` identifies a perfectoid pair's v-sheaf with the represented affine
tilt ([ECD] Lemma 15.2, p. 90). For a rational localization of complete Tate pairs with
topologically nilpotent `p`, `Perf.Spd.rationalSubset` asserts both `VSheaf.IsOpenImmersion`
and the sectionwise image criterion: a marked affine map factors through it exactly when its
valuation image lies in that rational subset. It combines `PreAdic.diamond_rationalOpen`
with the open-immersion assertion ([ECD], discussion before Definition 15.5, p. 91).

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.2 Descent of marked untilts along a v-cover

**Descent of marked untilts along a v-cover.** (*untilt-descent-along-v-covers*) Let
`X = Spa(R, R⁺)` be an affinoid perfectoid space of characteristic `p`, `Y = Spa(S, S⁺) → X` a
v-cover, and `Y♯ = Spa(S♯, S♯⁺)` an untilt of `Y` such that the two induced untilts of
`Z = Y ×_X Y = Spa(T, T⁺)` agree. Then there is a unique untilt `X♯ = Spa(R♯, R♯⁺)` of `X` whose
pullback to `Y` is `Y♯`. Concretely `R♯ = W(R⁺)/ξ` with `ϖ♯` inverted, for a primitive element `ξ`
of `W(R⁺)`, and `R♯⁺` is determined by `R⁺`. The v-cover may be taken affinoid by the
quasicompactness condition of the v-topology. After replacing `ϖ` by a `p`-power root so that
`θ([ϖ])` divides `p` in `S♯⁺`, the element `ξ` is primitive of degree one and congruent to `p`
modulo `[ϖ]`, `ξ ≡ p mod [ϖ]`; the identification of the kernel as generated by such a `ξ` is the
untilt classification supplied by PerfectoidSpaces layer P1. The convention is pinned by
`R = 𝔽_p((t^{1/p^∞}))^`, `R⁺ = 𝔽_p[[t^{1/p^∞}]]^`, the tilt of `ℚ_p(p^{1/p^∞})^` with
`t = p♭ = (p, p^{1/p}, …)`: here `θ([t]) = p`, `ξ = p − [t]` satisfies `θ(ξ) = 0` and
`ξ ≡ p mod [t]`, and `R♯ = (W(R⁺)/ξ)[1/[t]] = ℚ_p(p^{1/p^∞})^`. In Witt coordinates `p − [ϖ]` has
zeroth coefficient `−ϖ` and first coefficient `1` for `p` odd and `1 + ϖ²` for `p = 2` (from the
ghost identity `(p − ϖ)^p + p c₁ = p − ϖ^p`), a unit in both cases because `ϖ` is topologically
nilpotent, which is the degree-one condition. The proof classifies untilts by primitive degree-one
Witt-vector elements, compares their generators on the two pullbacks to the Čech overlap `Z`, and
descends the compatible primitive ideal; it reconstructs the untilt ring and its integral subring
with the classification of PerfectoidSpaces layers P1 and P2 and the v-descent of functions of D2.7,
and proves uniqueness as a marked untilt. The higher v-cohomology of `O⁺` vanishes only almost
([ECD] Thm 8.7), so the inductive step on `W(R⁺)/[ϖ]^n` is an almost statement and the argument
passes through the almost category; the exact descent of `O` and `O⁺` (D2.7) is used only for `H⁰`.
The uniqueness of the untilt is what makes `Spd ℤ_p` a sheaf and not a stack, and is what glues
`Spd(A, A⁺)` in D6.4 ([ECD] §15, proof of Lem. 15.1, pp. 89–90, the start of the computation; [ECD]
§15, proof of Lem. 15.1, p. 90, its conclusion). *Needs:* Mathlib `WittVector`; D2.7; D2.8;
PerfectoidSpaces layer P1 (Fontaine's `θ` and the primitive kernel, untilts classified by primitive
ideals); PerfectoidSpaces layer P0 (almost modules over a perfectoid base); PerfectoidSpaces
P6.16–P6.17 (perfectoid cover presentation); AdicEtaleGeometry A4.5 (finite étale effective descent
along a tower); AdicEtaleGeometry layer A1 (the generalised étale site, the finite étale site,
Yoneda and adic fibre products).

`Perf.SpdZp.untiltDescent` takes two characteristic-`p` affinoids, a single-map v-cover
between their `Geometry.affine` spaces, and an untilt in `Geometry.Affinoid p false` of
the covering space. Its compatibility hypothesis identifies the two Cartesian lifts to
the Čech overlap through their markings. It produces an affinoid untilt of the base and
a Cartesian map from the covering untilt whose tilt is the given cover, so its pullback
recovers the specified marked untilt.
`Perf.SpdZp.untiltDescent_unique` compares any two such descents by a unique isomorphism
preserving both the marking and the map from the covering untilt. These are the existence
and uniqueness assertions of [ECD] Lemma 15.1's proof, pp. 89–90; uniqueness is up to
isomorphism, rather than equality of affinoid presentations.

**Checks.**

- `xi_witness` (convention) — for the tilt `R` of `ℚ_p(p^{1/p^∞})^` and `t = p♭`, `ξ = p − [t]` has
  `θ(ξ) = 0` and `ξ ≡ p mod [t]`; the Witt coefficients of `p − [ϖ]` are `(−ϖ, 1, …)` for `p` odd
  and `(−ϖ, 1 + ϖ², …)` for `p = 2`; an element congruent to `p` modulo `[ϖ]` only after multiplying
  by `[ϖ]⁻¹`, which does not exist in `W(R⁺)`, is not what the classification produces.
- `trivial_cover` (degenerate case) — for `Y = X` the identity cover, the descended untilt is `Y♯`
  itself and uniqueness is the absence of automorphisms of marked untilts (D6.1).

The `trivial_cover` Check uses the geometric tilting functor: the identity on the covering
untilt satisfies the descent equation for the identity cover, and the only isomorphism
preserving its marking is the identity. The Witt-coordinate examples express the coefficient
and congruence parts of
`xi_witness`; Fontaine's map on the indicated completed field is additionally required
for its kernel and reconstruction assertions.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.3 `Spd(A, A⁺)` is a spatial diamond

**`Spd(A, A⁺)` is a spatial diamond with `|Spd(A, A⁺)| = |Spa(A, A⁺)|`.**
(*spd-is-a-spatial-diamond*) Let `A` be a Tate `ℤ_p`-algebra with an open and integrally closed
subring `A⁺ ⊂ A`. First replace this pair by its separated completion `(Â, Â⁺)`, where `Â⁺` is the
closure of the image of `A⁺`. Continuous maps into the complete rings of sections of an untilt
extend uniquely across `A → Â`, and the extension preserves the plus rings because the target plus
ring is closed. Thus restriction gives a natural isomorphism
`Perf.Spd.completion : Spd(Â, Â⁺) ≅ Spd(A, A⁺)`. The underlying adic spectra agree by
`TauCeti.ValuationSpectrum.spaCompletionHomeomorph` (Wedhorn, *Adic Spaces*, Proposition 7.48; its
plus-ring comparison is Lemma 7.47). Apply PerfectoidSpaces P6.16–P6.17 to the **complete** Tate
algebra `Â`; the tower below is over `Â`, with `A` denoting `Â` throughout its construction. This
retains the conclusion for the original, possibly non-complete pair through the two comparison maps.
Choose a cofiltered inverse system of finite groups `G_i` with surjective transition maps and a
compatible filtered direct system of finite étale `G_i`-torsors `A → A_i` such that `A_∞` has no
nonsplit finite étale covers, with `A_i⁺` the integral closure of `A⁺` and `A_∞⁺` the closure of the
colimit inside the uniform completion. Then `Spd(A_i, A_i⁺) → Spd(A, A⁺)` is a `G_i`-torsor of
v-sheaves, `Spd` of the completion of `A_∞` is the inverse limit and is a `G̲`-torsor over
`Spd(A, A⁺)` for `G` the limit of the `G_i`, and it is an affinoid perfectoid space. Hence
`Spd(A, A⁺)` is a spatial diamond with `|Spd(A, A⁺)| = |Spa(A, A⁺)|`. The existence of the tower
with perfectoid completion is [ECD] Lem. 15.3 and is supplied by PerfectoidSpaces P1.32 and
P6.16–P6.17; the `G_i`-torsor statement uses the finite étale descent theorem for Tate rings, [ECD]
Thm 6.1. The proof takes the torsor tower and its perfectoid completion from PerfectoidSpaces P1.32
and P6.16, proves the finite-group and profinite-group torsor identifications with the descent
theorem of D3.10 and the untilt functors of D6.1, uses the completed perfectoid atlas as the diamond
presentation, compares its topological quotient with `Spa(A, A⁺)`, and establishes spatiality with
the universally open presentation of D5.4 and the limit comparisons of D5.3. Here the complete Tate
ring is in `Type`; AdicEtaleGeometry A4.3's `FiniteEtaleTorsorTower A` has its directed index in
that same universe. Its opposite has `Small.{0}` total arrow type, as do the finite-subset and
countable iterations used to build it. Thus all these uses of D5.3 meet its lower-universe
condition, and their completed pairs are charted. The limit group is `G : ProfiniteGrp.{0}`, since
it is a closed subgroup of the `Type`-indexed product of the finite `G_i`; the uses of D3.10
therefore carry its group-size hypothesis. For `(A, A⁺)` perfectoid the statement reduces to [ECD]
Lem. 15.2. The identification of the underlying space is the reason the functor preserves all
topological information, and is what the étale-site comparison of D6.5 uses ([ECD] §15, Lem. 15.3
with proof, p. 90, for the tower; [ECD] §15, Prop. 15.4 with proof, pp. 90–91, for the statement).
*Needs:* Mathlib `ProfiniteGrp`; D6.1; D5.4; D3.10; D5.3; D5.1; D4.5; PerfectoidSpaces layer P1
(perfectoid Tate rings and algebras); PerfectoidSpaces layer P5 (cofiltered limits of affinoid
perfectoid spaces); PerfectoidSpaces P6.16–P6.17 (perfectoid cover presentation); AdicEtaleGeometry
A4.5 (finite étale effective descent along a tower); AdicEtaleGeometry layer A1 (the generalised
étale site, the finite étale site, Yoneda and adic fibre products).

`Perf.Spd.pair p P` defines this functor for any Tate Huber pair `P : Huber.Pair A`, without
completeness or separatedness assumptions. A `Perf.Spd.MarkedPairMap` consists of an
untilt `U`, an identification of its tilt with the test space, and continuous pair maps
`P → R.P` for every perfectoid affinoid chart `Spa(R) → U`, compatible with pullback.
These compatible maps express a map into `(O(U), O⁺(U))`; continuity and preservation of
integral sections are tested on the charts. `Perf.Spd.markedPairSetoid` identifies two
such objects exactly when an isomorphism of untilts preserves their markings and their
maps on every chart. `Perf.Spd.pairPresheaf` pulls back along the Cartesian lifts of
`Geometry.tilt`; `Perf.Spd.pairPresheaf_isSheaf` proves v-descent, using descent of marked
untilts and sections ([ECD] Lemma 15.1, pp. 89–90). `Perf.Spd.restriction` is
contravariant in continuous pair maps and acts by precomposition on every chart.

For complete Hausdorff Tate pairs, `Perf.Spd.pair_complete` identifies this construction
with the existing `Perf.Spd = PreAdic.Spd`, with the comparison specified on marked
representatives and on every affinoid chart ([ECD] Lemma 15.1, pp. 89–90).
`Perf.Spd.isSpatial` and `Perf.Spd.space` state the spatiality and homeomorphism targets
for `R : CAff` with a Tate ring and topologically nilpotent `p`; on a complete ring this
is the continuous `ℤ_p`-algebra condition. The latter gives
`realized p (Perf.Spd p R) ≃ₜ ULift (spa R.P.plus)` and fixes its value on an affine
marked untilt: use `Geometry.affinePoint` on the tilted chart, the inverse of
`PerfectoidSpace.spaTiltHomeomorph`, then pull the valuation back along the given pair
map. Thus the homeomorphism records the given map of pairs ([ECD] Proposition 15.4,
pp. 90–91).

`Perf.Spd.completion` states that restriction along `A → Completion A` is an
isomorphism, with plus ring exactly `TauCeti.ValuationSpectrum.completionPlus P.plus`.
It applies to all Tate pairs, including non-Hausdorff ones. For topologically nilpotent
`p`, `Perf.Spd.completion_space` asserts spatiality of the original marked-map sheaf
and a commuting square between its realization, the completed realization, and
`TauCeti.ValuationSpectrum.spaCompletionHomeomorph`. The square uses the same
restriction morphism as `Perf.Spd.completion` (Wedhorn, Lemma 7.47 and Proposition
7.48; [ECD] Proposition 15.4, pp. 90–91).

For prime `p`, `Perf.Spd.padicRational_isTateRing` states that
`WithVal (Rat.padicValuation p)` is a Tate ring. Its valuation ring with ideal `(p)` is a
pair of definition and `p` is a topologically nilpotent unit. The carrier is Mathlib's
`WithVal`; the Tate condition is `TauCeti.Huber.IsTateRing` in
`TauCeti/RingTheory/Huber/Basic.lean`. This gives the uncompleted rational-field input to
the completion comparison above.

**Checks.**

- `MarkedPairMap_affine` (computation) — a continuous pair map into an affinoid
  perfectoid pair gives a marked map on its tilt, and evaluation on the identity chart
  recovers the original pair map and the canonical marking.
- `MarkedPairMap_plus` (agreement) — an element of the source plus ring maps into the
  plus ring on every untilt chart.
- `MarkedPairMap_zero_source` (non-example) — a marked map from the zero ring has no
  chart with a nonzero affinoid ring.
- `markedPairSetoid_refl` (degenerate) — the identity isomorphism identifies a marked
  map with itself.
- `markedPairSetoid_change_untilt` (agreement) — transporting both the marking and
  chart maps along an isomorphism of untilts leaves the equivalence class unchanged.
- `markedPairSetoid_distinct_maps` (non-example) — with the untilt and marking fixed,
  different pair maps on one chart give different classes; marked untilts are rigid.
- `pairPresheaf_quotient` (agreement) — two representatives give the same section
  exactly when they are related by `markedPairSetoid`.
- `pairPresheaf_empty_untilt` (degenerate) — the empty test space has exactly one section.
- `pairPresheaf_zero_source` (non-example) — the zero pair has no section on a nonempty
  test space, including a perfectoid field point.
- `pair_complete_agreement` (agreement) — on complete Tate pairs, the marked-map sheaf
  is isomorphic to `Perf.Spd` on `CAff`.
- `pair_perfectoid` (computation) — for a perfectoid pair, it is represented by its tilt.
- `pair_zero` (degenerate) — the zero pair gives the initial v-sheaf.
- `restriction_identity` (degenerate) — the identity pair map induces the identity.
- `restriction_composition` (convention) — for `P → Q → T`, restriction is the composite
  `Spd(T) → Spd(Q) → Spd(P)` in that order.
- `restriction_plus_value` (computation) — on each marked representative, restriction
  retains the untilt and marking and precomposes every chart map with the given map.
- `completion_already_complete` (agreement) — for a complete separated Tate pair,
  the completion comparison is inverse to the map induced by the completion isomorphism.
- `completion_dense_pair` (computation) — completing `ℚ` with its `p`-adic topology and
  plus ring `{x : ℚ | |x|ₚ ≤ 1}` gives `(ℚ_p, ℤ_p)`; restriction induces
  `Spd(ℚ_p, ℤ_p) ≅ Spd(ℚ, ℚ ∩ ℤ_p)`. The example uses
  `WithVal (Rat.padicValuation p)` and `Padic.withValRingEquiv`; it also identifies the
  image of `completionPlus` with `PadicInt.subring p`.
- `completion_zero_pair` (degenerate) — completion of the zero pair is the zero pair;
  its Spd is the empty sheaf, since a unital map from the zero ring to a nonzero
  perfectoid affinoid cannot exist.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.4 Gluing `Spd` along rational subsets and the diamond of an analytic adic space

`Geometry.PreAdic` is the absolute Yoneda-adic carrier, and `Geometry.analytic` means that Tate
affinoid neighbourhoods cover it. Neither includes a base condition. In D6.4, D6.5 and D6.8, “over
ℤ_p” means a morphism to `ULiftHom.objUp (YonedaAdicSpace.ofSpaY (CAff.of Zp))`, for
`Zp : TauCeti.Huber.Pair ℤ_[p]` with `Zp.plus = ⊤`, using the usual p-adic topology. This hypothesis
is separate from analyticity. On complete Tate affinoids the corresponding ring condition is
topological nilpotence of `p`; characteristic `p` is allowed ([ECD] §15, Definition 15.5 and Lemma
15.6, p. 91).

**Gluing `Spd` along rational subsets and the diamond of an analytic adic space.**
(*gluing-and-the-diamond-functor*) Let `(A, A⁺)` be a complete Tate pair in which `p` is
topologically nilpotent. If `U` is a rational open subset of `Spa(A, A⁺)` then
`Spd(O(U), O⁺(U)) → Spd(A, A⁺)` is the open subfunctor corresponding to `U` under the identification
of the underlying spaces of D6.3. Consequently the functor `(A, A⁺) ↦ Spd(A, A⁺)` glues: for `Y` an
analytic adic space over `ℤ_p` the diamond associated with `Y` is the v-sheaf `Y^◇` sending `X` in
`Perf` to the set of isomorphism classes of triples `((X♯, ι), f : X♯ → Y)` where `X♯` is a
perfectoid space with an identification `ι` of its tilt with `X`. The construction is functorial in
`Y`, compatible with restriction to open subspaces, with the relevant fibre products, and with the
tilt on perfectoid spaces. `Y` is required to be an analytic adic space over `ℤ_p`; the construction
works in the generality of adic spaces as defined with a structure presheaf that need not be a
sheaf, provided the space is analytic. The gluing step is the identification of `Spd` of a rational
localisation with an open subfunctor, which rests on the identification of underlying spaces. Define
`PreAdic.geometricDiamond` as the functor on `Geometry.PreAdic` whose sections are these marked
maps. `PreAdic.diamond_affinoid` identifies its affinoid value with `PreAdic.Spd`;
`PreAdic.diamond_functorial` states its identity and composition laws.
`PreAdic.diamond_openImmersion` sends open immersions to open subfunctors, and
`PreAdic.diamond_rationalOpen` identifies the rational subfunctor on marked affine sections: a map
from an affine untilt factors through it exactly when its valuation image lies in the specified
rational subset. These statements use [ECD] Definition 15.5 and the preceding rational-gluing
discussion, p. 91. `PreAdic.diamond_perfectoid` identifies the value on any `Geometry.Perfd p` with
the sheaf represented by `Geometry.tilt p` ([ECD] Lemma 15.2, p. 90, and open gluing).
`PreAdic.diamond_fibreProduct` sends an existing `IsPullback` square of analytic `Geometry.PreAdic`
objects to an `IsPullback` square of v-sheaves; its base object carries a morphism to
`Spa(ℤ_p, ℤ_p)`. This follows from the marked-map description in [ECD] Definition 15.5, p. 91, by
matching the untilts over their common image. `PreAdic.diamond_space` gives the homeomorphism
`realized p ((PreAdic.geometricDiamond p).obj Y) ≃ₜ YonedaAdicSpace.space.obj Y.objDown`.
`PreAdic.diamond_analytic` supplies local spatiality and open-affinoid gluing. Both take
`analytic Y`, a Huber pair `Zp` on `ℤ_[p]` with `Zp.plus = ⊤`, and an actual morphism from `Y` to
its Yoneda-adic spectrum ([ECD] Lemma 15.6, p. 91). The homeomorphism is fixed on points: for an
affine perfectoid untilt `T`, its canonical tilt marking, and `f : T → Y`, first apply the inverse
of `PerfectoidSpace.spaTiltHomeomorph` to the tilted valuation, then map the resulting point along
`YonedaAdicSpace.space.map f`. The `Geometry.affinePoint` comparison accounts for the universe
lifts. This specifies the homeomorphism on all affine marked representatives.
`PreAdic.diamond_finiteEtale` handles complete Tate pairs with topologically nilpotent `p`, finite
étale ring map and the integral closure as the target plus ring; its conclusion is
`Geometry.sheafFiniteEtale` for the induced diamond map ([ECD] Lemma 15.6, p. 91). *Needs:* D6.3;
D6.1; D4.5; D3.8; D5.1; PerfectoidSpaces layer P2 (rational localisation of perfectoid affinoids,
perfectoid spaces and glued tilting); PerfectoidSpaces P6.16–P6.17 (perfectoid cover presentation);
AdicEtaleGeometry A4.5 (finite étale effective descent along a tower); AdicEtaleGeometry layer A1
(the generalised étale site, the finite étale site, Yoneda and adic fibre products).

**Checks.**

- `spd_qp` (computation) — `Spd(ℚ_p, ℤ_p)` has exactly one realization point and its only open sets are the empty and whole sets.
- `rigid_disc` (characterisation) — the diamond of the rigid analytic closed unit disc over `ℚ_p` is
  a locally spatial diamond with the same underlying space.
- `perfectoid_disc` (degenerate case) — for the perfectoid closed unit disc the construction returns
  its tilt.
- `finite_etale_cover_and_rational_open` (computation) — the diagonal map `ℚ_p → ℚ_p × ℚ_p` gives a finite étale diamond map with two points in each fibre. The first projection is the rational localization at `(1,0)`; its open diamond image has a one-point complement.

The `spd_qp` example uses a pair on `ℚ_[p]` with plus ring `PadicInt.subring p`.
The `rigid_disc` example uses the one-variable `Huber.weightedRestrictedSubring`
with weight `{1}`, its power-bounded plus ring, local spatiality and the
underlying-space homeomorphism. The `perfectoid_disc` example uses `PerfectoidSpace.discPair p K π` for a
characteristic-zero perfectoid field `K` with compatible pseudouniformizer roots `π`.
Its algebra is `Perfectoid.perfectedTateAlgebra p π Unit`, with the power-bounded
plus ring. The Check `perfectoid_affinoid` gives the general affine comparison. The
finite étale and rational-open example uses the full product of the two integral
plus rings and computes the rational localization with numerator `1` and denominator `(1,0)`.

- `diamond_fibreProduct_identity` (degenerate) — the identity square remains a
  pullback square, with the same four induced arrows.
- `diamond_space_empty` (degenerate) — an empty adic space over `ℤ_p` has empty
  diamond realization.
- `diamond_space_affine_point` (convention) — the identity marked map of a
  perfectoid affinoid sends a tilted valuation to its inverse tilt, with the
  universe lifts removed. This fixes the direction of the homeomorphism.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.5 The étale-site comparison

**The diamond of an analytic adic space is locally spatial and its étale and finite étale sites
agree.** (*etale-site-comparison*) Let `Y` be an analytic adic space over `ℤ_p`. Then `Y^◇` is a
locally spatial diamond with `|Y^◇| = |Y|`. Moreover there are equivalences of sites between the
étale site of `Y^◇` and the étale site of `Y`, and between their finite étale sites. Full
faithfulness and essential surjectivity on the étale categories are proved separately, from the
perfectoid torsor atlas of D6.3, the local structure of étale maps of D5.7, the finite-stage
comparisons of D5.3 and the torsor descent of D3.10. On each affinoid chart the tower index is
`Small.{0}` by D6.3, so the finite-stage comparisons carry D5.3's required arrow bound. The
statement about sites is about the categories of étale objects, not about the functor `Y ↦ Y^◇`
being fully faithful: it is an equivalence of étale categories on the already constructed diamond,
it is not full faithfulness of the diamond functor on all analytic adic spaces, and it is not the
derived left-completion comparison of the étale cohomology of diamonds. Packaged, this is Theorem
1.5 of the introduction of [ECD]: there is a natural functor from analytic adic spaces over `ℤ_p` to
locally spatial diamonds, `Y ↦ Y^◇`, satisfying the étale-site equivalence; the cases that exercise
it are `Spd ℚ_p`, a rigid analytic disc, a perfectoid disc, a finite étale cover and a rational
open, the checks of D6.1 and D6.4 ([ECD] §15, Lem. 15.6 with proof, p. 91; [ECD] §1, Thm 1.5, p. 4,
the packaged form). *Needs:* D6.4; D6.3; D5.7; D5.3; D3.10; D4.5; PerfectoidSpaces layer P3
(étale-site tilting and étale almost acyclicity); PerfectoidSpaces P6.16–P6.17 (perfectoid cover
presentation); AdicEtaleGeometry A4.5 (finite étale effective descent along a tower);
AdicEtaleGeometry layer A1 (the generalised étale site, the finite étale site, Yoneda and adic fibre
products).

On the diamond side, `Geometry.etaleSite p F` is the full subcategory of `Over F`
selected by `Geometry.sheafEtale`; `Geometry.finiteEtaleSite p F` uses
`Geometry.sheafFiniteEtale`. The latter tests every map from a perfectoid affinoid:
the fibre product must be an affinoid finite étale algebra with the integral closure
as its plus ring, with the comparison isomorphism over the test object.
`Geometry.sheafFiniteEtale_affine` identifies this condition on maps of represented
perfectoid affinoids with `Geometry.finiteEtalePair` ([ECD] Definition 6.2(i), p. 26,
and Proposition 10.3, p. 50). `Geometry.sheafFiniteEtale_isEtale` says that a
finite étale map of v-sheaves is étale, including local separatedness
([ECD] Definition 10.1(ii)–(iii), p. 50).
For locally spatial `F`, `Geometry.etaleTopology` and `Geometry.finiteEtaleTopology`
use jointly surjective families on the underlying spaces; the étale convention is
[ECD] Definition 14.1(i), p. 81, and the finite étale comparison is Lemma 15.6, p. 91.

The two comparison targets are `PreAdic.diamond_etale_equivalence` and
`PreAdic.diamond_finiteEtale_equivalence`. Each takes `X : Geometry.PreAdic`,
`hX : Geometry.analytic X`, the supplier hypothesis
`hXa : YonedaAdicSpace.IsAnalytic X.objDown`, a pair `Zp : TauCeti.Huber.Pair ℤ_[p]` with
`Zp.plus = ⊤`, and a morphism
`X ⟶ ULiftHom.objUp (YonedaAdicSpace.ofSpaY (CAff.of Zp))`.
Analyticity alone does not imply these comparisons: the structure map is required
in both signatures. Their equivalences have the following respective types:

```lean
Geometry.etaleSite p ((PreAdic.geometricDiamond p).obj X) ≌
  YonedaAdicSpace.smallEtale X.objDown
Geometry.finiteEtaleSite p ((PreAdic.geometricDiamond p).obj X) ≌
  YonedaAdicSpace.smallFiniteEtale X.objDown
```

Require the inverse functor, followed by the inclusion into the diamond slice, to
be naturally isomorphic to A1's forgetful functor followed by
`Over.post (ULiftHom.up ⋙ PreAdic.geometricDiamond p)`. Require that inverse to
preserve and reflect jointly surjective covering families, including the empty
family. These clauses fix the action on maps and the topology of the sites
([ECD] Lemma 15.6, p. 91; Theorem 1.5, p. 4).

**Checks.**

- `diamond_etale_equivalence_identity`, `diamond_finiteEtale_equivalence_identity` — the inverse comparison sends the identity object to the identity diamond over the base.
- `diamond_etale_equivalence_empty`, `diamond_finiteEtale_equivalence_empty` — an empty adic object maps to a diamond object covered by the empty sieve.
- `sheafFiniteEtale_identity`, `etaleSite_identity`, `finiteEtaleSite_identity` —
  every identity is finite étale and gives an object of both sites.
- `sheafFiniteEtale_empty`, `etaleSite_empty`, `finiteEtaleSite_empty` —
  the map from the initial v-sheaf to any base is finite étale and belongs to both sites;
  no surjectivity is required of a site object.
- `sheafFiniteEtale_nonclosed_open`, `finiteEtaleSite_nonclosed_open` —
  an open immersion of perfectoid spaces with nonclosed image is not finite étale,
  and its represented morphism does not belong to the finite étale site.
- `etaleSite_not_locallySeparated` — a morphism that is not locally separated
  does not give an étale-site object.
- `etaleTopology_identity`, `finiteEtaleTopology_identity` — the singleton identity
  generates a covering sieve.
- `etaleTopology_empty`, `finiteEtaleTopology_empty` — the empty sieve covers
  an object with empty underlying space.
- `etaleTopology_nonempty`, `finiteEtaleTopology_nonempty` — the empty sieve does
  not cover an object with a specified point.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.6 Pre-adic diamondification

The next three targets build the integral theory: the v-sheaf of an arbitrary pre-adic space over
`Spa(ℤ_p, ℤ_p)`, its Galois quotient description for rings of integers, and the topology of its
underlying space.

**Pre-adic diamondification.** (*pre-adic-diamondification*) Fix a prime `p`. For any pre-adic space
`X` over `Spa(ℤ_p, ℤ_p)`, define `X^◇` on characteristic-`p` perfectoid `S` by isomorphism classes
of marked untilts `(S♯, ι : (S♯)♭ ≅ S)` over `ℤ_p` together with a morphism `S♯ → X`. Morphisms pull
back marked untilts. It is a v-sheaf; `X` need not be analytic or Tate and `X^◇` need not be a
diamond. For every complete Huber pair `(A, A⁺)` over `ℤ_p` this gives `Spd(A, A⁺)`; on formal
schemes the construction is applied to their associated pre-adic space with its full integral locus,
not only the analytic generic fibre. The pre-adic spaces are those over `Spa(ℤ_p, ℤ_p)`, including
nonanalytic loci; the marked untilts are those of PerfectoidSpaces layers P1 and P2; pair morphisms
preserve `A⁺` and are continuous. AdicEtaleGeometry §A1.16 supplies `CAff`, `YonedaAdicSpace` and
`YonedaAdicSpace.ofSpaY`, including complete nonnoetherian integral pairs such as `(O_C, O_C)`,
gluing, and maps from perfectoid untilts. `Geometry.PreAdic` is the lifted Yoneda-adic category. The
v-sheaf property is the v-descent of marked untilts of D6.2 applied to the mapping functor; D6.4
uses the same `PreAdic.geometricDiamond` on analytic objects. Define `PreAdic.diamond` as the
v-sheaf of isomorphism classes of marked untilts with a map to `X`, and `PreAdic.Spd` as the v-sheaf
of an arbitrary complete Huber pair over `ℤ_p`; prove `PreAdic.diamond_map` (a pre-adic morphism
induces a v-sheaf morphism, respecting identities and composition), `PreAdic.diamond_isVSheaf` (the
mapping presheaf satisfies v-descent), `PreAdic.diamond_analytic` (for analytic `X` with a
structural map to `Spa(ℤ_p, ℤ_p)`, `PreAdic.geometricDiamond p` is locally spatial at `X` and
preserves colimit cocones of complete Tate affinoids mapping openly into `X`, as in D6.4) and
`PreAdic.diamond_formal`: for a formal affine `(A,A)` over `Spa(ℤ_p,ℤ_p)` with finitely generated
ideal of definition `I`, its analytic locus `i : U ↪ Spa^Y(A,A)` gives the locally spatial diamond
`U^◇`. The induced map into `Spd(A,A)` is an open immersion with image `pointMap⁻¹(|U|)`; a section
lifts uniquely precisely when its point image lies there. The point map of `U^◇` is a homeomorphism
to `|U|`. This is the analytic diamondification of D6.4 ([Berkeley] Lem. 18.1.1, p. 161, Prop.
18.2.2, p. 162, and Prop. 10.3.7, p. 80). The marked-map presheaf `PreAdic.diamond` is stated for
supplied categories `C`, `P`, `A` with a fibered tilting functor `P ⥤ C` and an inclusion `P ⥤ A`;
restriction uses Mathlib's Cartesian lift of `S' → S ← U♭`, and its map to `X` is the lifted map
followed by `U → X`. Isomorphic lift choices determine the same quotient class; characteristic-`p`
perfectoid spaces, perfectoid spaces over `ℤ_p` with the tilt, and pre-adic spaces over
`Spa(ℤ_p, ℤ_p)` give the geometric instance. `PreAdic.diamond_isVSheaf` asserts its v-sheaf property
under these geometric hypotheses, by Lemma 18.1.1. *Needs:* D6.2; D2.7; PerfectoidSpaces layer P1
(marked untilts); PerfectoidSpaces layer P2 (the tilting slice equivalence); AdicSpacesPartIII layer
F0 (the formal spectrum); AdicEtaleGeometry §A1.16 (the complete-pair and Yoneda-adic carriers);
Mathlib `CategoryTheory.Functor.IsFibered`.

**Checks.**

- `marked_map_postcomposition` — In the one-object category of Boolean endomorphisms, postcomposition by negation takes the identity-marked constant-false map to the identity-marked constant-true map.
- `marked_map_identity_tilt` (agreement) — when tilt and inclusion are both identity functors,
  marked-map classes from `S` to `X` are `Hom(S,X)`, via `(U,ι,h) ↦ ι⁻¹ ≫ h`.
- `marked_map_empty` (degenerate) — an empty untilt category has no marked maps.
- `marked_map_marking` (non-example) — isomorphic underlying objects whose markings cannot
  be identified do not define the same marked map.
- `marked_map_identity` (degenerate relation) — every marked map is related to itself by the
  identity isomorphism.
- `marked_map_identity_relation` — For Boolean endomorphisms, a negation marking leaves the constant-false class unchanged, but changes the class of the identity arrow.

- `marked_map_empty_target` (degenerate) — for identity tilt and inclusion, a target
  receiving no arrow from `S` has no marked-map classes from `S`.
- `marked_map_two_arrows` (computation) — identity tilt identifies marked-map classes
  with arrows even when there are exactly two arrows; distinct arrows remain distinct.
- `marked_map_map_identity` (agreement) — an identity of target spaces induces the
  identity of the marked-map presheaf.
- `marked_map_map_composition` (computation) — two successive postcompositions act by
  their composite, with the same order `h ≫ f ≫ g`.
- `marked_map_map_collapse` — In the Boolean endomorphism category, the constant-false and constant-true marked classes are distinct; postcomposition by the constant-false map identifies them.
- `marked_map_restriction` (computation) — with identity tilt and inclusion, restriction
  along `g : T → S` sends the arrow `h : S → X` to `g ≫ h`.
- `marked_map_quotient_empty` (degenerate) — an empty untilt category makes every value
  of the presheaf empty, as well as the unquotiented marked-map carrier.
- `marked_map_quotient_distinct` (non-example) — with identity tilt and inclusion, triples
  with distinct composites `ι⁻¹ ≫ h` have distinct quotient classes.

- `integral_spd_oe` (compatibility) — for a finite extension `E/ℚ_p`, `Spd O_E` is `Spd(O_E, O_E)`,
  retaining the special-fibre locus.
- `integral_spd_oc` (compatibility) — for a complete algebraically closed extension `C/ℚ_p`,
  `Spd O_C` is `Spd(O_C, O_C)`, not `Spd(C, O_C)`.
- `integral_pair_variants` (characterisation) — for `R` a complete adic ring with ideal of
  definition generated by `ϖ`, assume `R[1/ϖ]` is a complete Tate ring and its integral closure `R⁺`
  of `R` is open and complete for the `ϖ`-adic topology. Then `Spd(R, R)` and `Spd(R⁺, R⁺)` use the
  two different complete integral rings and their own continuous maps; both contain
  `Spd(R[1/ϖ], R⁺)` as the open subfunctor `{ϖ ≠ 0}` and neither is silently replaced by it (the
  non-example a Tate-only construction would produce): for `R = ℤ_p`, `Spd(ℤ_p, ℤ_p)` has the
  nonempty closed subfunctor `Spd 𝔽_p` and `Spd(ℚ_p, ℤ_p)` does not.
- `integral_formal_affine` (computation) — the integral v-sheaf of `Spf A` is `Spd(A, A)`.
- `special_point_not_diamond` (non-example) — for `X = Spa(𝔽_p, 𝔽_p)`, `X^◇` is the final v-sheaf
  `*`, which is small and not a diamond (`total_relation` in D4.1); the construction is not required
  to produce diamonds.

**Smallness of `X^◇`.** For every pre-adic space `X` over `Spa(ℤ_p, ℤ_p)`, `X^◇` is a small v-sheaf
in the sense of [ECD] Definition 12.1, so `|X^◇|` is the underlying space of D4.8; this is the
carrier used in D6.7–D6.8, analytic or not. Size bound for affinoid `X = Spa(A, A⁺)`: put
`μ = (#A + ℵ₀)^{ℵ₀}`. Every map `S → X^◇` from an affinoid perfectoid `S` factors through an
affinoid perfectoid `S₀` whose untilt has ring of size at most `μ`, namely the tilt of the closed
perfectoid subring of `O(S♯)` generated by the image of `A` and a pseudouniformiser, with integral
elements cut out by `O⁺(S♯)` (the closure argument of PerfectoidSpaces P5.6 run on a generating set
of size `#A + ℵ₀`, with D0.24 for the completion, and the tilting equivalence of PerfectoidSpaces
P2.12). Consequently the disjoint union of representatives of all isomorphism classes of maps
`S₀ → X^◇` of this size surjects onto `X^◇`; for a cutoff `κ > #A` there are fewer than `κ` of them,
each of size bounded independently of the class, so the union is uniformly `κ`-small
(PerfectoidSpaces `IsUniformlyKappaSmall`, P6.2, P6.4). For general `X` the `U^◇` of an affinoid
open cover are open subfunctors covering `X^◇` ([Berkeley] proof of Lemma 18.1.1, p. 161).
[Berkeley] treats `X^◇` as a small v-sheaf (Propositions 18.3.1, 18.4.1, pp. 163, 167) without a
numbered statement; the factorisation is the argument of [ECD] proof of Proposition 8.2 and the
remark after it, pp. 39–40. *Needs:* D0.23; D0.24; D4.7; D4.8; PerfectoidSpaces P2.12, P5.6, P6.2
and P6.4.

**Checks.**

- `s6_6_special_point_small` — for `X = Spa(𝔽_p, 𝔽_p)`, `X^◇` is the terminal sheaf `Spd 𝔽_p` and is
  the image of `Spa(𝔽_p((t^{1/p^∞}))^)` alone, every affinoid perfectoid `Spa(R, R⁺)` mapping to it
  by `t ↦ ϖ`.
- `s6_6_analytic_case` — for analytic `X` the statement follows from D6.5 and D4.7, diamonds being
  small.

`PreAdic.identityTiltEquiv` fixes the identity-tilt comparison by
`[(U,ι,h)] ↦ ι⁻¹ ≫ h`; the empty-target, two-arrow and distinct-class Checks test it.
`PreAdic.Spd` takes an actual complete Huber pair. `Geometry.FormalAffine` retains its
finitely generated ideal of definition and the equality `A⁺ = A`.
`PreAdic.formal_analyticLocus` constructs an analytic open immersion whose image is
the union of all open Tate affinoid charts; its hypotheses are exactly those of
`Geometry.FormalAffine` ([Berkeley] Prop. 4.3.1(2) and Def. 4.3.2, pp. 32–33).
The supplier `YonedaAdicSpace.isAnalyticPoint_ofSpaY_iff`, together with its specified
`YonedaAdicSpace.space_ofSpaY`, identifies this locus with `{x | I ⊈ supp(x)}`.
`PreAdic.diamond_formal` takes such an immersion, with its analytic, open-immersion
and image hypotheses, and a morphism from `Spa^Y(A,A)` to the full integral pair on
`ℤ_[p]`. It identifies the analytic open subfunctor as described above.

`PreAdic.diamond_formal_complement` takes the same locus immersion and constructs a
discrete complete pair `Q` with full plus ring and a ring equivalence `A/I ≃ Q`.
Its pair map `q : A → Q` is required to be that equivalence composed with the quotient
map. The induced monomorphism `Spd Q → Spd(A,A)` has image the complement of `|U^◇|`;
a section lifts uniquely exactly when its point image avoids `|U^◇|`. Thus the
closed complement is `(Spa(A/I,A/I))^◇`, as a sub-v-sheaf. This statement needs no
additional base morphism. It follows from the marked-untilt construction, reducedness
of perfectoid untilts, and the ideal support criterion ([Berkeley] §18.1, p. 161,
and Prop. 4.3.1(2), pp. 32–33).

`PreAdic.diamond_formal_powerSeries` assumes a ring equivalence
`A ≃ ℤ_p⟦T⟧` carrying `I` to `(p,T)`; the `I`-adic hypothesis fixes the topology.
It computes the analytic valuation locus as `{p ≠ 0} ∪ {T ≠ 0}` and asserts a point
with `p = 0`, `T ≠ 0`. The affinoid supplier comparison identifies this with `|U|`;
`PreAdic.diamond_formal` then identifies its inverse image under `PreAdic.pointMap`.
Hence the analytic locus contains the generic fibre and is strictly larger in this example ([Berkeley] §4.2, pp. 29–32).
General formal spectra use this affine construction and the open gluing in
`PreAdic.geometricDiamond`.
`PreAdic.diamond_formal_powerSeries_realized` states the resulting equality inside
`realized (Spd A)`: the image of the analytic open is the inverse image under
`PreAdic.pointMap` of `{p ≠ 0} ∪ {T ≠ 0}`, transported through
`YonedaAdicSpace.space_ofSpaY`. It takes the same analytic-open immersion and
locus hypotheses as `diamond_formal`, the `(p,T)` ideal equation, and the map to
`Spa(ℤ_p, ℤ_p)` (Berkeley Proposition 4.3.1 and §18.2).

**Checks.**

- `diamond_formal_zero_ideal` — For `I = 0`, the analytic valuation locus is empty;
  the quotient `A/I` is the whole discrete ring.
- `diamond_formal_principal` — For `I = (p)`, the analytic valuation locus is exactly
  `{p ≠ 0}`, including the integral pair on `ℤ_p`.
- `diamond_formal_powerSeries_boundary` — For `A ≃ ℤ_p⟦T⟧`, `I = (p,T)`, the
  analytic valuation locus contains a characteristic-`p` point, so it cannot be only
  the generic fibre.

**`MarkedMap`.** The marking is retained as data before taking isomorphism classes.

**Checks.**

- `definition_MarkedMap_1` — For identity tilt on a discrete two-point category, marked maps at an
  object have exactly one element.
- `MarkedMap_missing_marking` — An inhabited untilt category still supplies no marked map at true when its tilt is constantly false in the discrete Boolean category.
- `definition_MarkedMap_3` — For identity tilt on a discrete two-point category there are no marked
  maps between distinct objects.

**`markedMapRel`.** Isomorphism must preserve the transported arrow to the target.

**Checks.**

- `definition_markedMapRel_1` — For identity tilt, arbitrary markings give the same relation exactly
  when their transported arrows agree.
- `definition_markedMapRel_2` — The identity marking and identity target arrow are related to
  themselves.
- `definition_markedMapRel_3` — Distinct arrows with the same identity marking are unrelated.

**`markedMapSetoid`.** The quotient identifies markings only through a compatible untilt isomorphism.

**Checks.**

- `markedMapSetoid_changed_marking` — Changing both the marking and the target arrow by Boolean negation leaves the marked isomorphism class unchanged; equality of raw arrows would fail.
- `definition_markedMapSetoid_2` — An empty untilt category has an empty quotient.
- `definition_markedMapSetoid_3` — Different arrows with the identity marking survive as distinct
  quotient classes.

**`diamond`.** The presheaf is evaluated on quotient classes of marked maps.

`PreAdic.identity_isFibered` gives Cartesian lifts for the identity functor on every
category. `PreAdic.discreteTarget_isFibered` gives them for every functor from a category to
`Discrete B`, for any type `B`: arrows in the target are identities, so identity arrows
supply the lifts. Both use Mathlib's `Functor.IsFibered` and its Cartesian-lift definition
in `CategoryTheory/FiberedCategory/Fibered.lean` (SGA 1 VI 6.1).

**Checks.**

- `definition_diamond_1` — For identity tilt and a two-arrow Hom set, the value has two elements.
- `diamond_missing_tilt_fibre` — For the constant-false tilt from the one-object category to discrete Bool, diamondification is empty at true and inhabited at false. The untilt category itself is nonempty.
- `definition_diamond_3` — Distinct target arrows are not identified by identity-tilt
  diamondification.

**`diamond_map`.** Postcomposition preserves the untilt and its marking.

**Checks.**

- `definition_diamond_map_1` — Postcomposing two distinct arrows that a map coequalizes produces the
  same quotient class.
- `definition_diamond_map_2` — Identity postcomposition fixes every marked class.
- `definition_diamond_map_3` — If two distinct arrows are coequalized, the induced map on classes is
  not injective.

**`identityTiltEquiv`.** The equivalence transports along the inverse marking.

**Checks.**

- `definition_identityTiltEquiv_1` — An identity-marked arrow is sent to that arrow.
- `definition_identityTiltEquiv_2` — The identity-marked identity map is sent to the identity.
- `definition_identityTiltEquiv_3` — For a nonidentity automorphism used as marking, the value is
  not the untransported identity arrow.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.7 The integral Galois quotient

**Integral Galois quotient.** (*integral-galois-quotient*) Let `K : Type` be a complete nonarchimedean
field with a nontrivial rank-one valuation in which `p` is topologically nilpotent, `C : Type` a completed
algebraic closure and `G_K = Gal(K^sep/K)` in `ProfiniteGrp.{0}`. Then `Spd O_C → Spd O_K` is a
v-cover, proper in the sense of D4.11 (separated since source and target are, quasicompact and
universally closed as a quotient map by the profinite group `G_K`), and `(Spd O_C)/G̲_K ≅ Spd O_K`.
This is a quotient in v-sheaves. It does not assert a `G_K`-torsor on the integral special fibre or
an integral perfectoid atlas. Over the generic fibre the map is the `G̲_K`-torsor
`Spd C = Spa(C♭, O_{C♭}) → Spd K` of D6.3. In characteristic zero, over the closed point `Spd k` of
`Spd O_K`, `k` the residue field of `K`, the fibre is `Spd k̄` with `k̄` the residue field of `C` (a
continuous map `O_C → O⁺(S)` into a reduced characteristic-`p` ring factors through `O_C/m_C = k̄`),
on which `G_K` acts through `Gal(k̄/k)` with the inertia group as stabiliser, and
`Spd k̄ ×_{Spd k} Spd k̄ = Spd k̄ × Gal(k̄/k)̲`, not `Spd k̄ × G̲_K`; so the analytic Galois torsor
statement does not extend unchanged to the integral locus, while the quotient statement does. For
`K = C` the Galois group is trivial and the statement is the identity of `Spd O_C`. The proof
establishes the proper v-cover and the effective quotient through the integral mapping functor of
D6.6, with profinite products and the closed projection of D5.10 ([Berkeley] Lecture 18, §18.1, Lem.
18.1.2 and proof, pp. 161–162 (PDF pp. 171–172), which proves that `Spd O_C → Spd O_K` is a proper
v-cover inducing `Spd O_C/G_K ≅ Spd O_K`, properness being separatedness together with
quasicompactness and universal closedness of `X → X/G` for `G : ProfiniteGrp.{0}`). *Needs:* D6.6;
D5.10; D4.11.

**Checks.**

- `integral_galois_action_order` (convention) — for ring automorphisms `g` and `h`,
  `(f ∘ h⁻¹) ∘ g⁻¹ = f ∘ (gh)⁻¹`, fixing the order of the left action.
- `trivial_galois_group` (degenerate case) — for `K = C` algebraically closed, `G_K = 1`,
  `Spd O_C → Spd O_C` is the identity, a proper v-cover, and the quotient by the trivial group is
  `Spd O_C`.
- `special_fibre_not_torsor` (non-example) — for `K = ℚ_p`, the fibre of `Spd O_C → Spd ℤ_p` over
  `Spd 𝔽_p` is `Spd 𝔽̄_p → Spd 𝔽_p`, on which the inertia group `I_{ℚ_p}` acts trivially; the
  quotient `Spd 𝔽̄_p/Gal(𝔽̄_p/𝔽_p) = Spd 𝔽_p` holds and the torsor statement fails.

`PreAdic.integral_galois_quotient` states the proper v-cover and quotient on
`Geometry.VSheaf p`. Its fields `K` and `C` are complete nontrivially normed
ultrametric fields, `C` is algebraically closed, the embedding `K → C` is isometric,
and `p` is topologically nilpotent in `K`. A dense `K`-algebra embedding
`AlgebraicClosure K → C` specifies the completed algebraic closure. The supplied
complete pairs `OK` and `OC` have full plus rings; open ring embeddings identify
their underlying rings with the norm unit balls in `K` and `C`. The pair map
`r : OK → OC` must commute with these embeddings and `K → C`.

`PreAdic.galoisSheaf p K` is the sheaf `S ↦ C(|S|, Field.absoluteGaloisGroup K)`.
The theorem constructs its action `α : G̲_K × Spd OC → Spd OC` together with the
continuous extensions of Galois automorphisms to `C`. For a constant `g`, the left
action on a ring map `f` is `f ∘ g⁻¹`; the sectionwise multiplication law fixes the
order. The identity law follows by taking `g = 1` in this formula. The coequalizer
isomorphism satisfies `coequalizer.π α prod.snd ≫ e.hom = Spd(r)`, fixing its map
to the base. Properness is stated as separatedness, quasicompactness and closedness
on realizations after every v-sheaf base change; `Epi Spd(r)` expresses the v-cover.
These are the claims of [Berkeley] Lemma 18.1.2 and its proof, pp. 161–162.
The geometric Check `special_fibre_not_torsor` identifies the residue-field square
as a pullback of v-sheaves. It exhibits a nonidentity Galois automorphism whose
continuous extension fixes that entire special fibre; the ring-map Check records
the residue-field factorization used in this description.

**Checks for `PreAdic.galoisSheaf`.**

- `galoisSheaf_restriction` — restriction along `S → T` precomposes the continuous
  Galois-valued function with `|S| → |T|`.
- `galoisSheaf_empty` — an empty test space has exactly one section.
- `galoisSheaf_distinct_constants` — two different Galois elements give distinct
  constant sections on a test space with a specified point.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.8 Topology of pre-adic diamondification

**Topology of pre-adic diamondification.** (*pre-adic-topological-comparison*) Here `|X^◇|` is the
underlying space of the small v-sheaf `X^◇` (D6.6, D4.8), with no analyticity assumed. For a
pre-adic space `X` over `Spa ℤ_p`, the point map `|X^◇| → |X|` is a continuous surjection, induced
by `|S| = |S♯| → |X|` for every `S → X^◇`. If `X` is analytic it is a homeomorphism, by the
identification `|Y^◇| = |Y|` of D6.4. Analyticity is sufficient and not necessary: for
`X = Spa(ℤ_p, ℤ_p)`, which is not analytic, both spaces are the two-point Sierpiński space with open
generic point, `|Spd ℤ_p|` being the generic point `|Spd ℚ_p|` (one point, D6.3) and the closed
point `|Spd 𝔽_p| = |*|` (one point, the quotient of `|Spa(𝔽_p((t^{1/p^∞})))|` by the total
relation), and the map is a homeomorphism. For general nonanalytic `X` it need not be a
homeomorphism: for `X = Spa(𝔽_p[t], 𝔽_p[t])`, the subfunctor `U ⊂ X^◇` of maps `t ↦ f` with `f`
topologically nilpotent is open (on `Spa(R, R⁺)` it is the union of the rational subsets
`{|t^n| ≤ |ϖ|}`), after base change to a nonarchimedean field it is the open unit disc in the closed
unit disc, and it does not arise from an open subscheme of `X` ([Berkeley] Ex. 18.2.1); it is not
the preimage of any subset of `|X|` either, since the points `t ↦ u` of `Spa(K, K°)` and `t ↦ w` of
`Spa(K', K'⁺)`, for `K = 𝔽_p((u^{1/p^∞}))^`, `K' = (𝔽_p((u))(w))^{perf,^}` with the rank-two
valuation ring `K'⁺` composed from the `u`-adic valuation and the `w`-adic valuation on the residue
field, have the same image in `|X|`, the `t`-adic valuation on `𝔽_p[t]`, while `u ∈ K°°` and
`w ∉ K'°°`. The homeomorphism statement carries exactly the analytic qualification ([Berkeley]
Lecture 18, §18.2, Ex. 18.2.1 and Prop. 18.2.2, p. 162 (PDF p. 172)). *Needs:* D6.6; D4.8; D6.4.

**Checks.**

- `spa_zp_homeomorphism` — For `Spd ℤ_p`, compute the three open sets and the strict specialization from generic to closed point; the canonical point map separates these points and preserves their specialization.
- `extra_open_not_pulled_back` (non-example) — for `X = Spa(𝔽_p[t], 𝔽_p[t])`, the open subfunctor
  `{t topologically nilpotent}` of `X^◇` contains the point `t ↦ u` of `Spa(K, K°)` and not the
  point `t ↦ w` of `Spa(K', K'⁺)` above, which have the same image in `|X|`; `|X^◇| → |X|` is not a
  homeomorphism.

`PreAdic.pointMap p X` is a `ContinuousMap` from
`Geometry.realized p ((PreAdic.geometricDiamond p).obj X)` to
`YonedaAdicSpace.space.obj X.objDown`. The two spaces live in different
universes; using `ContinuousMap` retains the unlifted pre-adic target.
`PreAdic.pointMap_affine` fixes its value on
each marked affine untilt by the inverse valuation-tilting homeomorphism followed
by the map to `X`. `PreAdic.pointMap_natural` gives the commuting square for every
pre-adic morphism, and `PreAdic.pointMap_continuous` records continuity.
`PreAdic.pointMap_surjective` takes a pair on `ℤ_[p]` with full plus ring and a
map from `X` to its spectrum; `PreAdic.pointMap_analytic` additionally assumes
`Geometry.analytic X` and asserts that this same map is a homeomorphism
([Berkeley] Proposition 18.2.2, p. 162).

`PreAdic.pointMap_spaZp` asserts the homeomorphism and cardinality two for the
full integral pair on `ℤ_[p]`. `PreAdic.pointMap_polynomial` takes a discrete
complete pair `R` with full plus ring and a ring isomorphism
`R.A ≃+* Polynomial (ZMod p)`. It constructs an open subset `U` of its realization:
the entire image of a marked affine map lies in `U` exactly when the coordinate
image is topologically nilpotent. It also gives two points with the same image
under `pointMap`, one in `U` and one outside. Thus `U` is not the inverse image of
any subset of the pre-adic space. This strengthens the failure to come from an
open subscheme in [Berkeley] Example 18.2.1, p. 162, using the two valuations
described above.

`PreAdic.no_baseMap_other_prime` states the obstruction for
`Spa(ℚ_ℓ, ℤ_ℓ)` when `ℓ ≠ p`: it admits no morphism to `Spa(ℤ_p, ℤ_p)`.
Indeed `p` has ℓ-adic norm one, whereas a continuous structure map would send the
topologically nilpotent element `p` to `p`. This explains the base hypothesis in
[Berkeley] Proposition 18.2.2, p. 162. Moreover, any nonempty perfectoid untilt
mapping to this spectrum would make `ℓ` topologically nilpotent while its inverse,
coming from `ℤ_p`, remains power bounded; this is impossible. Thus its
characteristic-`p` diamond has empty realization although its adic spectrum is nonempty.
The marked-map functor and `PreAdic.diamond_isVSheaf` are defined on the absolute
carrier; v-descent alone gives no surjectivity or topology comparison there.

**Checks for `PreAdic.pointMap`.**

- `pointMap_affine_identity` — the identity marked affine map sends a tilted
  valuation to its inverse tilt, with the universe lifts removed.
- `pointMap_empty` — an empty pre-adic target gives empty image.
- `pointMap_other_prime` — for primes `ℓ ≠ p`, the realization of
  `Spa(ℚ_ℓ, ℤ_ℓ)^◇` is empty, its adic target is nonempty, and the point map is
  not surjective.
- `pointMap_matching_prime` — for `Spa(ℚ_p, ℤ_p)`, `p` is topologically nilpotent
  and the point map is a homeomorphism.
- `pointMap_characteristic_p` — any complete pair of characteristic `p` has
  topologically nilpotent `p = 0`, admits a map to `Spa(ℤ_p, ℤ_p)`, and has a
  surjective point map, without an analyticity assumption.
- `pointMap_spa_zp` — For the full integral pair on `ℤ_p`, the realization has points `η ≠ s`, open sets exactly `∅`, `{η}`, and the whole space, and `η` specializes to `s` but not conversely. The point map has distinct images and preserves that specialization.
- `pointMap_extra_open` — the Check `extra_open_not_pulled_back` records the open
  subset which is not the preimage of any subset, and failure of the point map
  to be a homeomorphism.

Lean: none; this subsection is specified in the README only (no Lean declaration).

### D6.9 Seminormal rigid full faithfulness

The closing targets are the seminormal structure-sheaf comparison and the one full-faithfulness
statement of the roadmap, over a fixed base field and with a seminormal source.

**Variety resolution with regular-morphism compatibility.** Use
ResolutionOfSingularitiesCharacteristicZero §7.8's `resolution_field` for reduced schemes that
are finite disjoint unions of finite-type schemes over characteristic-zero fields, and §7.1's
`fieldResolution_regularPullback` for the field-tower comparison. The supplied finite blowup
towers have regular centres disjoint from the inverse image of the original regular locus and
regular final source. The comparison identifies the tower pulled back along any regular
morphism with the supplied field tower on its source, after empty-centre steps are removed.
A regular morphism is flat with geometrically regular fibres; it need not be of finite type or
preserve a chosen ground field ([Temkin-resolution] Theorem 2.3.5, p. 14;
[BMT-resolution] Theorem 1.1, pp. 1–2).
*Needs:* ResolutionOfSingularitiesCharacteristicZero §§7.1 and 7.8
(`fieldResolution_regularPullback`, `resolution_field`).

**Checks.**

- `s6_9_variety_regular` — A regular variety, including the empty scheme, has an empty tower.
- `s6_9_variety_node` — Resolving `Spec ℚ[u,v]/(uv)` separates the two branches; resolving
  its disjoint union with a smooth component leaves that component unchanged.
- `s6_9_variety_generic_fibre` — Pullback from `Spec ℚ[s,u,v]/(uv)` to
  `Spec ℚ(s)[u,v]/(uv)` gives the same branch separation. This generic-fibre embedding
  is regular and is not of finite type.

**Formal comparison for resolution.** Use
ResolutionOfSingularitiesCharacteristicZero §§7.2–7.4's `qeLocalFormalReduction`,
`supportedFormalTower_algebraizes` and `thickFibre_resolutionComparison` on that supplier's
formal-completion systems. For finite disjoint unions of rig-regular characteristic-zero formal
varieties with a specified invertible ideal of definition `I`, the supplied comparison
identifies the completed field resolving tower independently of the algebraization, field of
definition and parameter generator. It is compatible with regular morphisms of pairs satisfying
`I' = I O_{X'}`. The supplier's rig-regular condition requires the singularity ideal to contain
a power of an ideal of definition; regularity of a formal morphism is tested on affine adic
charts ([Temkin-resolution] §§2.4.9–2.4.11, p. 15, and Theorem 3.1.5, p. 18).
*Needs:* ResolutionOfSingularitiesCharacteristicZero §§7.1–7.4
(`fieldResolution_regularPullback`, `qeLocalFormalReduction`,
`supportedFormalTower_algebraizes`, `thickFibre_resolutionComparison`).

**Checks.**

- `s6_9_formal_regular` — The regular formal disc `Spf k[[t]]` has an empty tower.
- `s6_9_formal_cusp` — For `char(k) = 0`, the principal formal cusp
  `Spf k[[t,u]]/(u² − t³)`, with ideal of definition `(t)`, is rig-regular and its
  resolution is `Spf k[[s]]`, with `t = s²` and `u = s³`.
- `s6_9_formal_not_rig_regular` — In `Spf k[[t]]⟨u,v⟩/(uv)` the singularity persists
  after inverting `t`; its singular locus is not supported on the closed fibre, so the
  formal-variety comparison does not apply to it.

**Characteristic-zero resolution prerequisite.** Consume
ResolutionOfSingularitiesCharacteristicZero §7.5's `qeResolution`: every reduced noetherian
quasi-excellent `ℚ`-scheme `S` has a finite blowup tower with regular centres avoiding the inverse
image of `Reg(S)`, regular final source `Y₀`, and projective birational composite
`f₀ : Y₀ → S` isomorphic over the entire `Reg(S)`. Its §7.6 `qeResolution_regularFunctorial`
supplies compatibility with every regular morphism after empty steps are removed. No finite-type
or finite-dimensional hypothesis on `S` is imposed ([Temkin-resolution] Theorem 1.2.1, pp. 2–3).

For `S = Spec A` with `A` a reduced `K`-affinoid algebra and `K ⊇ ℚ_p` complete, use
ResolutionOfSingularitiesCharacteristicZero §7.8's `resolution_affinoid` to choose `f₀`.
D6.9 proves the analytic comparison: the relative analytification
`Y = Y₀ ×_{Spec A} Spa(A, A°)` is smooth over `K`, and its map
`f : Y → Spa(A, A°)` is proper and surjective, and is an isomorphism over the smooth locus of
the target ([KL16] Remark 8.1.2, p. 159). For smoothness, use RigidAnalyticGeometry §8.1's
relative completed-local-ring comparison: at classical points the completed local rings of `Y`
agree with those of `Y₀` at the corresponding closed points. Their regularity and
characteristic zero give analytic smoothness. Relative
analytification preserves the supplied properness, surjectivity and isomorphism over the regular
locus. This uses finite type over `A`, without treating `A` as an ordinary finite-type
`K`-algebra.
*Needs:* ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 and 7.8
(`qeResolution`, `qeResolution_regularFunctorial`, `resolution_affinoid`);
AdicSpacesPartII R1 (*scheme-fibre-product-analytification*, *analytification-surjective*,
*analytification-separated-proper*); RigidAnalyticGeometry §§1.1–1.2 and 8.1 (classical residue
fields, excellence and relative completed local rings, on main);
AdicSpacesPartIII R3.7, *proper-gaga*.

**Checks.**

- `s6_9_resolution_smooth` — the identity is a resolution of a smooth affinoid.
- `s6_9_resolution_node` — the normalization of `K⟨u,v⟩/(uv)` is the disjoint union of its two
  smooth branches and is an isomorphism away from the node.
- `s6_9_resolution_cusp` — the normalization of `K⟨t²,t³⟩` is the smooth disc; existence of a
  smooth modification alone imposes no seminormality on the target.
- `s6_9_resolution_complete_node` — `Spec ℚ[[u,v]]/(uv)` is quasi-excellent and its
  normalization is `Spec(ℚ[[u]] × ℚ[[v]])`, a regular projective modification. The base
  is not of finite type over `ℚ`, so finite-type resolution alone does not supply it.
- `s6_9_resolution_higher_dimension` — For every `d ≥ 0`, resolving
  `Spec K⟨u,v,z₁,…,z_d⟩/(uv)` gives two regular branches. Their analytifications are smooth
  `(d + 1)`-dimensional polydiscs; the affinoid application is not restricted to curves.
- `s6_9_resolution_nonreduced` — `Spec ℚ[ε]/(ε²)` has no regular scheme birational to it
  through a morphism that is an isomorphism over a dense open; reducedness cannot be omitted
  from this projective birational conclusion.

**Smooth completed-function recovery.** For a smooth rigid space `X` over a complete
nonarchimedean field `K ⊇ ℚ_p`, prove `O_X ≅ ν_*Ô_X`, with the natural topologies on affinoid
sections. D6.9 owns the following calculations as well as their passage to this comparison
([KL16] Theorem 8.2.3, first two paragraphs of the proof, p. 163):

- Over a perfectoid field containing all p-power roots of unity, take a smooth affinoid chart
  étale over a d-dimensional torus and its restricted coordinate-root tower. Prove that its
  completed ring `A∞` is perfectoid and identify its pro-étale Čech objects with continuous
  functions on powers of the coordinate-root group `Γ = ℤ_p^d`. Prove the topological equality
  `A = A∞^Γ`, and identify these invariants
  with `H⁰(X_proét, Ô_X)`. Rational restriction and étale localization give the smooth comparison
  over that field ([KL16] Remark 8.1.1, p. 158, Theorem 7.1.9, p. 149, and Proposition
  5.7.14(b), p. 132). PerfectoidSpaces P7.16 supplies the perfectoid basis and the root objects;
  the invariant calculation and completed-function recovery are targets here.
- For arbitrary `K`, put `C = completion(K̄)` and let `C₂` be the uniform completion of
  `C ⊗_K C`. Prove `C^{G_K} = K` and the completed scalar Čech equalizer
  `0 → K → C ⇉ C₂` ([KL16] Proposition 8.2.1, p. 162). For a smooth affinoid algebra `A`,
  prove the topological equalizer `0 → A → A ⊗̂_K C ⇉ A ⊗̂_K C₂` and its identification
  with the two restriction maps on completed pro-étale sections. Completed tensoring preserves
  the kernel of the difference of the scalar maps by [KL15] Lemma 2.2.9(b), p. 31 (the Banach
  kernel statement cited as Lemma 2.2.10(b) in [KL16]). This descends the smooth comparison
  to `K`, naturally under rigid pullback.

*Needs:* AdicEtaleGeometry A1.12 (the site, base change and `ν`); PerfectoidSpaces P7.16
(the basis, completed pairs and coordinate-root objects); D2.7 (v-descent of functions);
AdicSpacesPartII R0–R1 (affinoid tensor products and smooth torus charts). The toric and scalar
calculations in this target are independent of PerfectoidTowers P9.12.

**Checks.**

- `s6_9_toric_invariants` — for an algebraically closed complete `C ⊇ ℚ_p`, on `C⟨T±¹⟩` the
  invariants of `C⟨T±¹/p^∞⟩` under the coordinate-root action are exactly `C⟨T±¹⟩`.
- `s6_9_scalar_point` — for `X = Spa(K, O_K)`, the scalar equalizer recovers `K`, even when
  `K` is not perfectoid.
- `s6_9_smooth_disc` — the two annular charts with coordinates `T` and `T − 1` recover
  `K⟨T⟩`; the disc coordinate need not be invertible globally.

**Seminormal analytic compatible-section descent.** Let `K ⊇ ℚ_p` be complete and `A` a
seminormal `K`-affinoid algebra. Put `X = Spa(A, A°)` and choose the projective resolution
`f₀ : Y₀ → Spec A` above. Write `Y = Y₀^an`, `R₀ = (Y₀ ×_{Spec A} Y₀)_red`,
`R = R₀^an = (Y ×_X Y)_red`, and let `r : R → X` and `p₁,p₂ : R ⇉ Y` be the induced maps.
Prove the equalizer of sheaves on `X`
`O_X ≅ Eq(f_*O_Y ⇉ r_*O_R)`, with the arrows induced by `p₁,p₂`, and prove its topological
version on every affinoid open of `X` ([KL16] Proposition 1.4.22, p. 23, for the
compatible-section interpretation of h-descent; AdicSpacesPartIII R3.7, *proper-gaga*, relative
coherent direct-image comparison). Reduction of the overlap is part of the statement; replacing
`R` by its finite seminormalization gives the same equalizer, since `O_R → O_{R^sn}` is injective.

The algebraic argument uses the finite `A`-algebra
`E = Eq(Γ(Y₀,O) ⇉ Γ(R₀,O))`. Proper coherent direct images and noetherianity make it finite;
`A → E` is injective and `E` is reduced. SchemeAndStackFoundations §4.9's
`stein_factorization` makes `Y₀ → Spec Γ(Y₀,O)` surjective. The ring `Γ(Y₀,O)` is integral
over `E`, so lying over shows that every geometric point of `Spec E` lifts to `Y₀`. Over each geometric point of `Spec A`, the two projections from `R₀`
force any two such lifts to have the same value for every element of `E`. Thus `Spec E → Spec A`
is finite, surjective and universally injective; its residue extensions are purely inseparable,
hence trivial in characteristic zero. Apply D6.9's `subintegral_bijective_of_seminormal` to
`A → E`. This proves `E = A` without a separate algebraic h-descent prerequisite. Relative
proper GAGA for `f₀` and `R₀ → Spec A`, including compatibility of coherent kernels and
analytification with reduction and fibre products, transports this equalizer to `X`. Rational
restriction gives the sheaf statement; the finite-module topologies give the asserted
homeomorphism.

For the completed-section bridge, prove that `O_Z → ν_*Ô_Z` is injective for every reduced rigid
`K`-space `Z`: on affinoids, evaluate at completed algebraic closures of classical residue fields
and use the Jacobson property and reducedness. If `s ∈ H⁰(X_proét, Ô_X)`, its pullback to `Y`
corresponds to `b ∈ O_Y(Y)` by smooth completed-function recovery. The two pullbacks of `b` to
`R` agree in the completed sheaf by functoriality and hence agree in `O_R(R)` by that injection.
The equalizer gives a unique `a ∈ A`. Establish also that `f^◇ : Y^◇ → X^◇` is a v-cover:
after every perfectoid test map its proper surjective pullback admits a v-cover by affinoid
perfectoid spaces, using the proper valuative criterion ([KL16] Remark 8.1.2, p. 159).
D2.7 then identifies `s` with `a`. For the topology, the inverse section map factors through
`O_Y(Y)` with its finite `A`-module topology; smooth completed-function recovery and the closed
equalizer above make this inverse continuous. The forward map is continuous by construction.
No smoothness or seminormality of `R` is assumed.
*Needs:* the resolution prerequisite and smooth completed-function recovery above; D2.7;
D6.4–D6.5; the local subintegral and seminormalization targets below;
SchemeAndStackFoundations §4.9 (finite Stein factor and proper coherent direct images);
AdicSpacesPartIII R3.3 (coherent kernels) and R3.7, *proper-gaga*;
RigidAnalyticGeometry §§1.1–1.2 (Jacobson property, finite residue fields and affinoid excellence,
on main); AdicSpacesPartII R1 (analytification and the proper valuative criterion);
AdicEtaleGeometry A1.12;
PerfectoidSpaces P7.16.

**Checks.**

- `s6_9_node_compatible_sections` — for `A = K⟨u,v⟩/(uv)` and
  `B = K⟨u⟩ × K⟨v⟩`, the normalization is proper with smooth source, and
  `A = {(g,h) ∈ B : g(0) = h(0)}`. This ring is seminormal by square–cube lifting in its
  normal branches and uniqueness of the common lift of their constant terms. The two cross-branch
  points of `R` impose that equality. The section `(1,0) ∈ B` fails it and does not descend;
  `f_*O_Y` itself is strictly larger than `O_X`.
- `s6_9_cusp_overlap_reduction` — for `A = K⟨t²,t³⟩` and its normalization `B = K⟨t⟩`,
  `(B ⊗_A B)_red = B`, with the same two maps from `B`. Their equalizer is `B`, not `A`;
  the seminormality hypothesis is essential, and the finite compatible-function algebra is
  precisely the seminormalization in this example.
- `s6_9_descent_smooth_identity` — for a smooth `X` and `f = id_X`, the overlap and its two
  projections are `X ⇉ X`, and compatible-section descent is the identity on functions.

**Seminormal structure-sheaf comparison.** For `K/ℚ_p` complete and `X` a seminormal rigid space
over `K`, the map `O_X → ν_*Ô_X` to the completed structure sheaf of the pro-étale site of `X` is an
isomorphism; on an affinoid `X` this says that `O_X(X)` maps homeomorphically onto the sections over
`X^◇` of the sheaf `T ↦ O(T♯)` ([KL16] Theorem 8.2.3, pp. 162–163; [Berkeley] proof of
Proposition 10.2.3, p. 78; [HK] §2.2, p. 15). This comparison is owned here: smooth
completed-function recovery and seminormal analytic compatible-section descent above supply its
local proof, followed by gluing. AdicEtaleGeometry A1.12 supplies the pro-étale site, and
PerfectoidSpaces P7.16 supplies its affinoid perfectoid basis.
PerfectoidTowers P9.12 is a consumer: function
descent (`O_Y = (h_* O_{X_∞})^G` over a seminormal rigid base,
*function-descent-seminormal-base*) is its specialization to a tower. Independence
from that target retains the toric invariant calculation and completed scalar Čech descent above.
Seminormality of a ring and of a rigid space, and the seminormalisation as a universal homeomorphism
terminal among seminormal spaces over `X`, are those of [KL16] Definition 1.4.1, p. 19, and Remark
3.7.3, p. 80. *Needs:* D6.4; D6.5; AdicEtaleGeometry A1.12; PerfectoidSpaces P7.16;
smooth completed-function recovery and seminormal analytic compatible-section descent above;
the local affine seminormality predicate and geometric comparison below (seminormal-ring).

**Checks.**

- `s6_9_cusp_extra_function` — for the cusp `K⟨t², t³⟩`, which is not seminormal, `t` is a section
  of `ν_*Ô` not in `O`, since the normalisation `K⟨t⟩` has the same diamond.
- `s6_9_seminormal_node_recovery` — the node recovers pairs of branch functions with equal
  constants; `(1,0)` is excluded by completed-section compatibility.
- `s6_9_field_recovery` — for `X = Spa(K, O_K)`, the comparison recovers `K` with its given
  topology and agrees with the scalar calculation above.

**Seminormal rigid full faithfulness.** (*seminormal-rigid-full-faithfulness*) Fix a complete
nonarchimedean field `K` over `ℚ_p`. If `X` is a seminormal rigid `K`-variety and `Y` any rigid
`K`-variety, then `Hom_K(X, Y) → Hom_{Spd K}(X^◇, Y^◇)` is bijective. Diamondification factors
through seminormalisation, so its restriction to seminormal rigid `K`-varieties is fully faithful.
All maps are over the fixed base `Spd K`; both Hom sets are kept over the fixed `K`, respectively
`Spd K`. No full faithfulness on all analytic adic spaces is asserted, and seminormality of the
source cannot be dropped: for the cuspidal affinoid curve `X = Spa(A, A°)`, `A = K⟨x, y⟩/(y² − x³)`,
with normalisation `X̃ = Spa(K⟨t⟩, K°⟨t⟩)`, `t ↦ (t², t³)`, the map `X̃ → X` is a universal
homeomorphism and `X̃^◇ → X^◇` is an isomorphism, so `Hom_{Spd K}(X^◇, X̃^◇)` contains the inverse
of that isomorphism, which is not induced by any `K`-morphism `X → X̃`: such a morphism would be an
element `a ∈ A°` with `a² = x` and `a³ = y`, that is `t ∈ A`, and `A ⊂ K⟨t⟩` is the closed
subalgebra of series with no linear term. Seminormality of the target is not required. The proof
takes two inputs: the seminormalisation `X^sn → X` of a rigid `K`-variety, a universal homeomorphism
with the universal property for maps from seminormal spaces, constructed below from [KL16] Remark
3.7.3; and the seminormal structure-sheaf comparison `O_X ≅ ν_* Ô_X` of the previous target, owned
here. For affinoid `Y` full faithfulness is that comparison, and the general case reduces to it
through the identification `|X^◇| = |X|` of D6.5. It recovers morphisms locally from completed
structural functions using the vector-bundle comparison of D2.9 and the étale-site comparison of
D6.5, compares plus rings, and glues; the geometric result factors through seminormalisation
([Berkeley] Lecture 10, §10.2, Prop. 10.2.3 and proof, p. 78 (PDF p. 88), which needs a fixed rigid
base and seminormality; [KL16] Thm 8.2.3, p. 162, proof p. 163, which recovers `O_X` from the
completed pro-étale structural sheaf, with its analytic hypothesis supplied by AdicSpacesPartII
layer R0, and which is not the perfectoid-affinoid Rem. 3.7.7; [HK] §2.2, rigid-analytic diamond
conventions and seminormal full faithfulness, p. 15). *Needs:* D6.4; D6.5; D2.9; the seminormal
structure-sheaf comparison above (AdicEtaleGeometry A1.12; PerfectoidSpaces P7.16, the affinoid
perfectoid basis); AdicSpacesPartII layer R0 (affinoid algebras and étale morphisms of Huber pairs);
the seminormalisation construction below ([KL16] Remark 3.7.3), with D6.9's local affine targets
(seminormal-ring, normal-ring-check, seminormalization-ring, subintegral-unit and
fixed-rings-and-restriction).

`Rigid.Base p` is a complete Tate field with a continuous embedding of `ℚ_p` and maximal
plus ring. `Rigid.Space p K` is the full subcategory of Yoneda-adic spaces over this base
covered by spectra of topologically finite type `K`-algebras with their power-bounded plus
rings. Each chart equation identifies its structural map with the supplied `K`-algebra map.
This is the adic realization of the fixed-field `TauCetiRoadmap.AdicSpacesPartII.RigidSpace`
carrier in AdicSpacesPartII §R1.1; §R1.7 specifies the rigid–adic comparison.
`Rigid.IsReducedSpace` tests reducedness on affine opens.

**Affine seminormality predicate.** For any commutative ring `A`, define
`IsSeminormalRing A` by reducedness and unique square–cube lifting: whenever
`x² = y³`, there is a unique `z` with `x = z³` and `y = z²`. Swapping `x` and `y`
gives the convention `x³ = y²`, `x = z²`, `y = z³` in Stacks Tag 0EUL.
Prove the unique-lifting characterisation: the unique-lifting clause alone is equivalent to
this predicate on arbitrary commutative rings. Indeed, equal squares and
cubes give a nilpotent difference, while uniqueness over `(0, 0)` excludes nonzero square-zero
elements ([KL16] Definition 1.4.1, p. 19; [Stacks seminormalization] Tags 0EUL and 0EUQ).
This is the affine predicate used on every rigid affine open (seminormal-ring).

**Checks.**

- `affine_seminormal_field` — `ℚ` satisfies the criterion: if `y ≠ 0`, its lift is `x/y`;
  if `y = 0`, reducedness forces `x = 0`.
- `affine_seminormal_nilpotent` — `ℤ/4` fails reducedness; the distinct elements `0` and `2`
  have the same square and cube.
- `affine_seminormal_cusp` — for every field `k`, `k[t²,t³]` is reduced but not
  seminormal: `t³` and `t²` have no common square–cube root in this subring of `k[t]`.

**Normal domains and products.** For a commutative domain `A` integrally closed in its fraction
field, prove that `A` satisfies `IsSeminormalRing`. For `y ≠ 0` the candidate `x/y`
is integral, being a root of `T² − y`, and hence lies in `A`; treat `y = 0` separately.
Prove that `A × B` satisfies `IsSeminormalRing` iff both factors do, for two arbitrary
commutative rings `A` and `B`; iteration gives
finite products, including the zero ring as the empty product ([KL16] Remark 1.4.2, p. 20;
Definition 1.4.1 applied componentwise). These results and the finite decomposition below supply
normal-ring-check on every normal affinoid open.

**Checks.**

- `affine_normal_integers` — `ℤ` is admitted by integral closedness; no field hypothesis is needed.
- `affine_normal_product` — `ℚ × ℚ` is seminormal although it is not a domain; each component
  supplies its own lift.
- `affine_product_bad_factor` — `ℚ × ℤ/4` fails the criterion, witnessed in its second factor.

**Seminormality of equalizers.** For seminormal `A`, reduced `B` and ring maps
`f,g : A →+* B`, prove that Mathlib's subring `f.eqLocus g` satisfies `IsSeminormalRing`.
The unique square–cube root in `A` lies in the equalizer because its images in the reduced ring
`B` have equal squares and cubes and therefore coincide ([KL16] Definition 1.4.1, p. 19;
[Stacks seminormalization] Tag 0EUL). This supplies the branch-matching argument in
`s6_9_node_compatible_sections`, with `A` the product of the two normal branch rings and `B = K`.

**Checks.**

- `affine_equalizer_identity` — the equalizer of two identity maps on `ℚ` is seminormal.
- `affine_equalizer_node` — for any field `k`, the equalizer of the constant-term maps from
  `k[U] × k[V]` to `k` is seminormal, and `(1,0)` fails its defining condition.
- `affine_equalizer_nonreduced_codomain` — the maps `ℚ[t] ⇉ ℚ[ε]/(ε²)` sending `t` to `ε`
  and `0` have equalizer `ℚ[t²,t³]`, which is not seminormal. Reducedness of `B` cannot be omitted.

**Finite decomposition for normal noetherian rings.** Prove `Affine.normal_finiteProduct`:
if a commutative noetherian ring `A` has normal-domain localizations at every prime, then
`A ≅ ∏ᵢ Bᵢ` for finitely many integrally closed domains `Bᵢ`. Allow no factors for the zero ring.
Apply this to normal affinoid function rings before using the domain and product results above
([Stacks normal rings] Tag 030C; noetherianity gives finitely many minimal primes, and
normality gives reducedness).

**Checks.**

- `affine_normal_decomposition_empty` — the zero ring has no primes and the empty decomposition.
- `affine_normal_decomposition_domain` — `ℤ` has the single normal-domain factor `ℤ`.
- `affine_normal_decomposition_disconnected` — `ℚ × ℚ` has two factors; a single domain cannot
  supply its nontrivial idempotent.

**Subintegral maps and seminormal lifting.** Define `IsSubintegral f` for a map
`f : R →+* S` of arbitrary commutative rings by integrality, bijectivity of
`Spec S → Spec R`, and bijectivity of each induced residue-field map
`κ(f⁻¹(q)) → κ(q)`. These conditions also identify its spectrum map as a universal
homeomorphism with unchanged residue fields ([KL16] Lemma 1.4.5, p. 20).
Prove `subintegral_lift`: for every seminormal commutative ring `T` and map
`g : R →+* T`, there is a unique `l : S →+* T` with `l ∘ f = g`.
For injective `f`, the square–cube adjunction description in [Stacks seminormalization]
Tag 0CND extends maps one element at a time; for general `f`, first pass to reductions,
since its kernel is nil and maps to reduced rings kill nilpotents. Prove
`subintegral_bijective_of_seminormal`: if `R` is seminormal, `S` is reduced and `f`
is subintegral, then `f` is bijective ([Stacks seminormalization] Tag 0H3G,
applied to affine schemes). Reducedness of `S` is required. These are public ring-level
statements used by subintegral-unit and seminormalization-ring.

**Checks.**

- `subintegral_cusp` — for any field `k`, the inclusion `k[t²,t³] → k[t]` is
  subintegral: it adjoins an element whose square and cube are already present.
- `subintegral_nonreduced_target` — `ℚ → ℚ[ε]/(ε²)` is subintegral with seminormal
  source but is not bijective; the target fails reducedness.
- `subintegral_nilpotent_quotient` — `ℤ/4 → 𝔽₂` is subintegral, and every map from
  `ℤ/4` to a seminormal ring factors uniquely through this quotient.

**Affine seminormalization and its universal property.** For every commutative ring `A`, construct
the seminormalization `snRing A`, with its commutative ring structure, and the unit
`snMap A : A →+* snRing A`, as a ring constructed from `A` (the final object among maps out of
`A` inducing a universal homeomorphism on spectra and isomorphisms on residue fields,
[Stacks seminormalization] Tag 0EUR(3); for arbitrary `A` the construction first removes
nilpotents), not as a choice from an existence statement. The existence milestone `exists_seminormalization` states that a commutative
ring `A : Type u` admits a subintegral map to a seminormal ring in `CommRingCat.{u}`; with
`subintegral_lift` and `subintegral_bijective_of_seminormal` it already gives the universal
property and the uniqueness of the reflection up to unique isomorphism, without a chosen carrier.
Prove `snRing_seminormal` and
`sn_lift`: for every seminormal commutative ring `B` and homomorphism `f : A →+* B`,
there is a unique `g : snRing A →+* B` with `g ∘ snMap A = f`.
This gives the ring reflection, its functoriality and the unique maps needed for gluing,
with identity and composition laws obtained from uniqueness ([KL16] Definition 1.4.1, p. 19,
affine form of its adjunction; [Stacks seminormalization] Tag 0EUR(3)–(4)).
This supplies seminormalization-ring.

**Checks.**

- `affine_sn_nilpotents` — the seminormalization of `ℤ/4` is `𝔽₂`; every map from `ℤ/4` into a
  seminormal ring kills `2` and factors uniquely through this quotient.
- `affine_sn_cusp` — for every field `k`, the non-seminormal cusp `k[t²,t³]` has
  seminormalization `k[t]`, compatibly with the inclusion; a map into a seminormal ring
  extends uniquely by sending `t` to the common square–cube root. This includes `k = 𝔽₂`
  and `k = 𝔽₃`, where no division by `2` or `3` is available.
- `affine_sn_target_hypothesis` — for the cusp ring `A`, the identity `A → A` has no extension
  `ℚ[t] → A`. The target seminormality hypothesis on `sn_lift` is essential.

**Subintegral affine unit.** For every commutative ring `A`, prove
`snMap_subintegral : IsSubintegral (snMap A)`, as well as `snMap_isIntegral` and
`snMap_fieldPoints`: precomposition with the unit is a bijection
`Hom(snRing A, K) → Hom(A, K)` for every field `K`, including imperfect fields.
Together these say that the spectrum of the unit is a universal homeomorphism and induces
isomorphisms on residue fields. To recover the latter assertion, test a point in its own residue
field; integrality and uniqueness of field-valued lifts identify its sole preimage and residue
field ([KL16] Lemma 1.4.5, p. 20; [Stacks seminormalization] Tag 0EUR(3)).
This supplies subintegral-unit, without a general factorization-system construction.

**Checks.**

- `affine_sn_empty_points` — the zero ring and its seminormalization have no field-valued points.
- `affine_sn_cusp_residue` — the cusp unit has a single point above the origin and the residue
  field remains `ℚ`; its effect is on functions, not on the residue field.
- `affine_sn_inseparable_boundary` — for `k = 𝔽_p(s)`, adjoining `s^(1/p)` gives an integral
  universal homeomorphism on spectra but fails the `k`-valued lifting test. Universal
  homeomorphism alone does not give the residue-field clause of this target.

**Unique comparison of seminormal reflections.** Prove `sn_compare`: for a
subintegral map `f : A →+* B` with seminormal `B`, there is a unique ring isomorphism
`e : snRing A ≃+* B` with `e ∘ snMap A = f`. Thus every seminormal subintegral
extension realizes the same reflection, with its unit fixed. Apply `subintegral_lift`
in both directions and use uniqueness to identify the composites with the identities
([Stacks seminormalization] Tags 0EUR(3)–(4), 0H3G).

**Checks.**

- `sn_compare_identity` — for a seminormal field and its identity unit, the comparison
  is the inverse of `snMap`; it is unique over the field.
- `sn_compare_cusp` — `k[t²,t³] → k[t]` gives the unique comparison with `k[t]`
  over the cusp for every field `k`, using the normal-domain criterion for `k[t]`.
- `sn_compare_reduction` — `ℤ/4 → 𝔽₂` gives the unique comparison with `𝔽₂`;
  reducedness of the source is unnecessary.

**Fixed rings and principal restriction.** Prove `snMap_bijective` for every seminormal
commutative ring `A`. Prove `snRing_localization`: for any `f ∈ A`, the canonical
comparison `(A_f)^sn ≅ (A^sn)_{η(f)}` is a ring isomorphism intertwining the two units from `A`,
where `η = snMap A`. These results give idempotence and the algebraic restriction
comparisons; compatibility with rational affinoid restriction is the separate analytic assertion
below ([Stacks seminormalization] Tags 0EUR(4), 0EUM and 0EUS, restricted to principal opens;
[KL16] Definition 1.4.1, p. 19). This supplies fixed-rings-and-restriction.

**Checks.**

- `affine_sn_fixed` — a field and a finite product of fields are fixed, as is the zero ring.
- `affine_sn_idempotent` — the unit on `snRing A` is bijective for every `A`, even if
  `A` has nilpotents.
- `affine_sn_principal_cusp` — for `A = ℚ[t²,t³]` and `f = t²`, both sides are
  `ℚ[t,t⁻¹]`: after inversion, `t = t³/t²` already belongs to `A_f`. At `f = 0`, both sides
  are the zero ring, the ring of the empty affine open.

**`Rigid.IsSeminormal`.** Every affine function ring satisfies the local
`IsSeminormalRing`. The geometric comparison identifies this all-affine-opens condition
with reducedness and existence of square–cube lifts, and establishes rational restriction
compatibility and rigid gluing; reducedness makes such a lift unique ([KL16] Definition 1.4.1,
p. 19, Proposition 3.7.2 and Remark 3.7.3, p. 80).

`Rigid.reduction` and `Rigid.reduction_toBase` satisfy `Rigid.reduction_universal`:
composition gives unique lifts from reduced rigid spaces. `Rigid.IsFinite` uses finite
maps of affine function rings and a cartesian chart square. Theorems
`Rigid.seminormalization_finite` and `Rigid.seminormalization_universalHomeomorphism`
assert finiteness and the homeomorphism after every rigid base change, with the
homeomorphism equal to the base-change projection. `Rigid.seminormalization_open`
is an isomorphism over the chosen open subspace. `Rigid.diamond` lands in the category
over the fixed `PreAdic.Spd p K.toCAff`; `Rigid.diamond_seminormalization` sends the
universal map to an isomorphism. `Rigid.diamond_hom_bijective` requires a seminormal
source and allows any rigid target ([Berkeley] Proposition 10.2.3 and its preceding
construction; [KL16] Remark 3.7.3).

Define `Rigid.seminormalization X` by first reducing a rigid `K`-variety `X` and then applying the
right adjoint of [KL16], *Relative p-adic Hodge theory, II: Imperfect period rings*, Remark 3.7.3,
p. 80 (with the scheme construction of [KL16] §1.4). Construct `Rigid.seminormalization_toBase` as
the finite universal homeomorphism `X^sn → X`; prove `Rigid.seminormalization_homEquiv`: for
seminormal rigid `T`, composition with this map is a bijection `Hom_K(T,X^sn) ≃ Hom_K(T,X)`. Thus it
is terminal among seminormal rigid spaces over `X`. Prove `Rigid.seminormalization_id` for
seminormal `X` and compatibility with restriction to affinoid opens. Theorem 3.7.4 of [KL16] proves
seminormality of perfectoid rings; it is not the adjunction statement. The affine algebra inputs
are the public targets `snRing`, `snMap`, `sn_lift`, `sn_compare`,
`snMap_subintegral`, `snMap_isIntegral`, `snMap_fieldPoints` and `snMap_bijective` above.
The ring unit reverses direction under `Spec`. For a reduced affinoid algebra its
seminormalization is a finite subalgebra of its finite normalization (affinoid algebras are
excellent); equip it with its finite-module topology. Establish the finite affinoid realization,
compatibility with rational affinoid restriction ([KL16] Proposition 3.7.2 and Remark 3.7.3),
and rigid gluing before deducing `Rigid.seminormalization_id`. Algebraic principal localization
alone does not assert this analytic restriction theorem.

**Checks.**

- `seminormalization_empty` (degenerate) — the empty rigid space is unchanged.
- `seminormalization_cusp` (computation) — the cusp has seminormalization `Spa(K⟨t⟩)`; `t²` and `t³`
  belong to its ring while `t` does not belong to the cusp ring.
- `seminormalization_normal` (agreement) — a normal rigid space, in particular the closed disc, is
  unchanged.

- `smooth_source` (degenerate case) — a smooth rigid `K`-variety, such as the closed unit disc, is
  normal and hence seminormal, so `Hom_K(X, Y) → Hom_{Spd K}(X^◇, Y^◇)` is bijective for every rigid
  `Y`; for `X = Y = Spa(K, O_K)` both sides are a point.
- `cusp_not_full` (non-example) — for the cuspidal affinoid curve `X = Spa(K⟨x, y⟩/(y² − x³))` with
  normalisation `X̃ = Spa(K⟨t⟩)`, `Hom_K(X, X̃) → Hom_{Spd K}(X^◇, X̃^◇)` is not surjective: the
  inverse of `X̃^◇ ≅ X^◇` is not induced by a morphism, since `t ∉ K⟨t², t³⟩`; seminormality of the
  source cannot be dropped.

These Checks use `Rigid.Space`, `Rigid.IsSeminormal` and the specified seminormalization
map. For the cusp the source is reduced: this qualification matters when asserting that
its inverse diamond map has no rigid lift. `rigid_diamond_nonseminormal_not_full`
states the reduced nonseminormal obstruction over `Spd K`; the polynomial Check
`cusp_not_full` computes the missing parameter that violates the square-cube criterion.

**Geometric diamondification contracts.** `Geometry.tiltAffinoid` uses
`Perfectoid.tiltFunctor` on the pair through `Pair.tilt` and `Pair.tiltHom`; `Geometry.tilt` lifts `PerfectoidSpace.tiltFunctor`. For a prime `p`, `Geometry.tiltAffineIso` and
`Geometry.tilt_affine_naturality` identify `Geometry.tilt` on affinoids and their maps.
For prime `p`, `Geometry.tilt_toPerfectoid` identifies the whole composite
`Geometry.tilt p ⋙ Geometry.toPerfectoid p true` with
`Geometry.toPerfectoid p false ⋙ PerfectoidSpace.tiltFunctor p`, including its
action on every morphism ([ECD] Theorem 3.18 and the gluing paragraph after
Definition 3.19, p. 18).
`Geometry.tilt_space` supplies natural homeomorphisms `|X♭| ≃ₜ |X|` for every
`X : Geometry.Perfd p`. In `Geometry.affinePoint` coordinates, their affine values
are the inverse of `PerfectoidSpace.spaTiltHomeomorph`, after `tiltAffineIso`
([ECD] Theorem 3.12, p. 17; gluing after Definition 3.19, p. 18).
`Geometry.tilt_openImm` sends every open immersion between perfectoid spaces to an
open immersion. For every `X : Geometry.Perfd p`,
`Geometry.tilt_affinoidOpen_isColimit` uses the full subcategory of `Over X` consisting
of open immersions with affinoid source, and the cocone whose legs are those immersions.
It asserts both that this cocone has colimit `X` and that its image under tilting has
colimit `(Geometry.tilt p).obj X`. The indexing category retains all maps over `X`,
so compatibility includes affinoid opens inside overlaps; neither colimit is assumed.
This specifies the global gluing even for non-affinoid `X` ([ECD] Theorem 3.18 and the
paragraph after Definition 3.19, p. 18; Corollary 3.20, p. 19).
`Geometry.inclusion` is the chart-gluing functor specified with
`Geometry.exists_wedhornComparison`. `Geometry.PreAdic` uses the supplied
Yoneda-adic carrier without a chosen base. `Geometry.analytic` means an open cover
by Tate affinoids; the maps to `Spa(ℤ_p, ℤ_p)` in the comparison theorems impose the
base condition separately.
`Geometry.FormalAffine` retains a finitely generated ideal of definition and full plus
ring. `PreAdic.geometricDiamond` is the marked-untilt quotient with the v-descent theorem
`PreAdic.diamond_isVSheaf`; `PreAdic.Spd` is its value on a complete Huber-pair spectrum
([Berkeley] Lemma 18.1.1). `PreAdic.diamond_analytic`, with an actual morphism to `Spa(ℤ_p, ℤ_p)`, asserts local spatiality and
preservation of the colimit of an open affine analytic presentation ([ECD] Lemma 15.6).
`PreAdic.diamond_formal` identifies the analytic open by the inverse image under
`PreAdic.pointMap`; `PreAdic.diamond_formal_complement` identifies its complement with
the discrete quotient's diamondification ([Berkeley] §18.1 and Prop. 18.2.2).

**`Geometry.tiltAffinoid` — Checks.**

- `tilt_affinoid_characteristic_p` — The supplied affine tilt has characteristic p.
- `tilt_affinoid_zero` — Tilting preserves the zero perfectoid pair.
- `tilt_affinoid_char_p_agreement` — In characteristic p, the tilted underlying ring is isomorphic to the original ring.

**`Geometry.tilt` — Checks.**

- `tilt_toPerfectoid_objects` — Forgetting the characteristic-p certificate recovers the supplied tilt of every object.
- `tilt_toPerfectoid_maps` — Forgetting the Hom lift recovers the supplied tilt of every arrow.
- `tilt_topology` — Tilting preserves the underlying valuation topology.
- `tilt_empty_space` — An empty perfectoid space remains empty after tilting.
- `tilt_open_immersion_detection` — Tilting both preserves and detects open immersions.
- `tilt_gluing_extension` — Maps from tilted affinoid opens to any characteristic-`p` perfectoid space, compatible with every map over `X`, extend uniquely to the tilt of `X`.
- `tilt_gluing_detects_distinct` — Two different maps from the tilt of any perfectoid space differ on a tilted affinoid open.
- `tilt_empty_unique_map` — The tilt of an empty space has exactly one map to every characteristic-`p` perfectoid space.

**`Geometry.tiltAffineIso` — Checks.**

- `tilt_affine_comparison_maps` — For the product of two copies of a perfectoid field with maximal plus ring, conjugating the tilted factor swap by the affine comparison acts without fixed points on a two-point space.
- `tilt_affine_comparison_identity` — On that product of two perfectoid fields, the conjugated tilted identity has exactly two fixed points.
- `tilt_affine_comparison_distinct_maps` — For two pair maps whose tilts differ, transport through the affine comparison sends every tilted valuation to the tilt of its pullback; the transported maps remain distinct.

**`Geometry.inclusion` — Checks.**

- `inclusion_affine_object` — On affinoids the inclusion retains the supplied complete Huber-pair spectrum.
- `inclusion_identity` — The geometric inclusion sends the identity to the pre-adic identity.
- `inclusion_faithful` — Distinct perfectoid maps are not identified by the pre-adic inclusion.

**`Geometry.analytic` — Checks.**

- `analytic_tate_affine` — The spectrum of a complete Tate pair is analytic.
- `analytic_empty` — An empty pre-adic space is analytic.
- `analytic_other_prime` — For `ℓ ≠ p`, `Spa(ℚ_ℓ, ℤ_ℓ)` is analytic, but
  `‖p‖_ℓ = 1`, so `p` is not topologically nilpotent. This separates absolute
  analyticity from the base hypothesis in the diamond comparisons.
- `analytic_integral_base_obstruction` — The p-adic integer pair retains a nonanalytic closed point.

**`Geometry.FormalAffine` — Checks.**

- `formal_affine_integral_maps` — A pair map into an integral formal affine sends every source element into the target plus ring.
- `formal_affine_zp` — The p-adic integer pair carries its principal ideal-of-definition formal structure.
- `formal_affine_nonzero_not_tate` — A nonzero integral formal affine is not itself a Tate pair.

**`PreAdic.geometricDiamond` — Checks.**

- `geometric_diamond_perfectoid` — The diamond of the product of two copies of a perfectoid field, each with maximal plus ring, has exactly two realization points.
- `geometric_diamond_identity` — The identity pre-adic map acts as the identity on marked-untilt classes.
- `geometric_diamond_open_map` — An open pre-adic immersion induces an open immersion of v-sheaves.

**`PreAdic.Spd` — Checks.**

- `spd_perfectoid_pair` — For the product of two copies of a perfectoid field with maximal plus ring, the factor swap on Spd has no fixed realization point.
- `spd_zero_pair` — The zero pair gives the initial v-sheaf.
- `spd_zp_two_points` — In the realization of the full pair on `ℤ_p`, the generic singleton has closure the whole space and the distinct closed singleton has closure itself.

**`Perf.SpdZp` — Checks.**

- `spdzp_char_p_section` — Every characteristic-p test space has its characteristic-p untilt section of the integral base.
- `spdzp_two_points` — The realization of `SpdZp` has one connected component, while its constructible topology has two connected components.
- `spdzp_not_hausdorff` — The generic point specializes to the closed point; the integral base is not Hausdorff.

**`Rigid.Base` — Checks.**

- `rigid_base_char_zero` — The specified embedding of Qp forces characteristic zero.
- `rigid_base_qp` — The p-adic field itself is an allowed rigid base.
- `rigid_base_p_not_zero` — The prime p is nonzero in every rigid base; characteristic-p fields are excluded.

**`Rigid.IsRigid` — Checks.**

- `rigid_identity_base` — The identity space over the base field is rigid.
- `rigid_empty_space` — The empty space over a rigid base satisfies the finite type atlas condition.
- `rigid_implies_analytic` — The finite type atlas over an analytic field excludes nonanalytic points.

**`Rigid.IsReducedSpace` — Checks.**

- `rigid_reduced_normal` — Normal affine function rings imply that the rigid space is reduced.
- `rigid_reduced_empty` — The empty rigid space is reduced.
- `rigid_reduced_nilpotent_obstruction` — A nonzero square-zero function on an affine open excludes reducedness.

**`Rigid.IsSeminormal` — Checks.**

- `rigid_seminormal_normal` — Normal affine function rings satisfy the square-cube criterion.
- `rigid_seminormal_empty` — The empty rigid space is seminormal.
- `rigid_seminormal_missing_cusp_parameter` — Compatible square and cube functions without a common root on an affine open obstruct seminormality.

**`Rigid.reduction` — Checks.**

- `rigid_reduction_reduced` — A reduced rigid space is isomorphic to its reduction over the base.
- `rigid_reduction_empty` — Reduction preserves the empty rigid space.
- `rigid_reduction_idempotent` — A second reduction is isomorphic to the first.

**`Rigid.reduction_toBase` — Checks.**

- `rigid_reduction_map_isomorphism` — On a reduced space the specified reduction map is itself an isomorphism.
- `rigid_reduction_map_mono` — The reduction map is a monomorphism, retaining the nilpotent quotient direction.
- `rigid_reduction_nonreduced_not_iso` — A nonreduced rigid space cannot have an isomorphic reduction map.

**`Rigid.seminormalization` — Checks.**

- `rigid_seminormalization_empty` — Seminormalization preserves the empty rigid space.
- `rigid_seminormalization_reduction` — Reducing before seminormalizing yields the same rigid space over the fixed field.
- `rigid_seminormalization_idempotent` — A second seminormalization is isomorphic to the first.

**`Rigid.seminormalization_toBase` — Checks.**

- `rigid_seminormalization_map_id` — For the rigid base-field spectrum with its identity structure map, seminormalization has one point and its structural map has a one-point fibre.
- `rigid_seminormalization_map_surjective` — The universal map is surjective on valuation points.
- `rigid_seminormalization_map_no_section` — A nonseminormal space admits no section of its seminormalization map.

**`Rigid.seminormalization_homEquiv` — Checks.**

- `rigid_seminormal_hom_identity` — The identity of the seminormalization maps to the universal map.
- `rigid_seminormal_hom_empty` — From an empty rigid source both Hom sets are singletons.
- `rigid_seminormal_hom_distinct` — Distinct lifts from a seminormal source remain distinct after composition with the universal map.

**`Rigid.IsFinite` — Checks.**

- `rigid_finite_identity` — The identity rigid morphism is finite.
- `rigid_finite_empty` — A morphism with empty source is finite.
- `rigid_finite_infinite_fibre_obstruction` — An infinite point fibre excludes a finite rigid morphism.

**`Rigid.diamond` — Checks.**

- `rigid_diamond_identity` — The identity retains the structural map to Spd of the base field.
- `rigid_diamond_reduction` — Reduction induces an isomorphism over Spd of the base field.
- `rigid_diamond_nonseminormal_not_full` — For a reduced nonseminormal rigid space the inverse diamond of its seminormalization map has no rigid lift.

Lean: `IsSeminormalRing`, `IsSubintegral`, `subintegral_lift`,
`subintegral_bijective_of_seminormal` and `exists_seminormalization`. The unique-lifting,
normal-domain, product, equalizer and normal-decomposition statements, the seminormalization
`snRing` with its unit `snMap` and the statements about them, and the rigid geometric targets are
specified in the README only.

### Examples

The worked examples of this layer are the checks above and the acceptance cases of the theorems:
`Spd(A, A⁺)` as `Spa` of the tilt for `(A, A⁺)` perfectoid, the content of [ECD] Lem. 15.2, to which
the spatial-diamond theorem reduces in that case; `Spd ℚ_p` as a v-sheaf that is not a perfectoid
space and as the diamond of `Spa(ℚ_p, ℤ_p)`; the discrete groupoid of marked untilts of a fixed `X`
and the refused formal base `(ℤ_p, ℤ_p)`; the rigid analytic closed unit disc over `ℚ_p` as a
locally spatial diamond with the same underlying space and the perfectoid closed unit disc going to
its tilt; a finite étale cover and a rational open of an affinoid going to a finite étale map and an
open immersion of diamonds, the five cases [ECD] lists for Thm 1.5; the integral v-sheaves
`Spd O_E`, `Spd O_C` and `Spd(A, A)` for `Spf A`, retaining the special fibre, against the analytic
`Spd(C, O_C)` and `Spd(R[1/ϖ], R⁺)`; the
Galois quotient `(Spd O_C)/G̲_K ≅ Spd O_K` as a sheaf quotient and not a torsor, with the special
fibre `Spd 𝔽̄_p → Spd 𝔽_p` on which inertia acts trivially and the trivial-group case `K = C`; the
extra opens of [Berkeley] Ex. 18.2.1 on a nonanalytic diamondification, with the two points of `X^◇`
that the open `{t topologically nilpotent}` separates and `|X|` does not, against `Spa(ℤ_p, ℤ_p)`,
not analytic, for which `|Spd ℤ_p| → |Spa ℤ_p|` is a homeomorphism of two-point spaces; the tilt
point `Spd(C, O_C) = Spa(C♭, O_{C♭})`; `Spd ℤ_p` as a v-sheaf that is not a diamond, with
the two distinct marked untilts `C♭` and `C` of `Spa(C♭, O_{C♭})`; the convention `ξ = p − [p♭]` for
`ℚ_p(p^{1/p^∞})^`; and the cuspidal curve on which the seminormal full faithfulness fails. Applying
the diamond functor to the Fargues–Fontaine adic curve is the subject of the FarguesFontaineDiamonds
roadmap and needs nothing from the coefficient theory.

None of these is in `Suggested.lean`: marked untilts need the tilting equivalence of
PerfectoidSpaces P1–P2, which is a formalisation target there.

### Dependencies

Layer D2: `O` and `O⁺` as v-sheaves and subcanonicity of the v-site (D2.7), higher v-acyclicity
(D2.8) and pro-étale and v vector bundles (D2.9). Layer D3: open and closed immersions, separated
and `0`-truncated maps (D3.8) and torsors under a locally profinite group with their pro-étale
presentation (D3.10). Layer D4: diamonds and pro-étale equivalence relations (D4.1), diamonds as
v-sheaves (D4.4), the underlying topological space and the open-subfunctor correspondence (D4.5),
small v-sheaves (D4.7), underlying spaces, open sub-v-stacks, fibre products and surjectivity for
small v-stacks (D4.8), small quotients of v-sheaves (D4.10) and proper maps (D4.11). Layer D5:
spatial and locally spatial v-sheaves and diamonds (D5.1), cofiltered limits of diamonds and
finite-stage étale comparisons (D5.3), the universally open strictly totally disconnected
presentation of a spatial diamond (D5.4), local structure of étale maps (D5.7) and profinite
products and closed projection (D5.10). Layer D0: cutoff cardinals and the completion bound
(D0.23–D0.24, for D6.6). PerfectoidSpaces layer P0 (almost modules over a perfectoid base), layer P1
(Fontaine's `θ` and the primitive kernel, untilts classified by primitive ideals, the tilt of a
perfectoid Tate ring, perfectoid Tate rings and algebras, marked untilts), layer P2 (perfectoid
spaces and glued tilting, rational localisation of perfectoid affinoids, the tilting slice
equivalence), layer P3 (étale-site tilting and étale almost acyclicity) and layer P5 (cofiltered
limits of affinoid perfectoid spaces), with P2.12, P5.6, P6.2 and P6.4 in D6.6; PerfectoidSpaces
P7.16 (D6.9, the affinoid perfectoid basis over a locally noetherian rigid base);
D6.9 owns smooth completed-function recovery, its toric invariant and completed scalar Čech
calculations, seminormal analytic compatible-section descent, and the relative analytification
and proper-surjective comparison for the resolution supplied by
ResolutionOfSingularitiesCharacteristicZero §7.8 (`resolution_affinoid`). Its §§7.5–7.6
(`qeResolution`, `qeResolution_regularFunctorial`) supply the general quasi-excellent theorem
and regular-morphism compatibility; §§7.1–7.4 supply the field and formal comparisons of D6.9.
SchemeAndStackFoundations §4.9 supplies the finite Stein factor and proper coherent direct images.
AdicSpacesPartIII R3.3 and R3.7 supply
coherent kernels and relative proper GAGA. RigidAnalyticGeometry §§1.1–1.2 on main supplies
affinoid excellence, Jacobson and residue-field properties; AdicSpacesPartII R1 supplies
analytification and the proper valuative criterion. AdicEtaleGeometry layer A1 (the generalised étale site, the finite étale site, Yoneda and adic fibre products, with
the pro-étale site A1.12 in D6.9), A4.3–A4.5 and A4.7 (torsor towers, completion and finite étale
effective descent); PerfectoidSpaces P1.32 and P6.15–P6.17 (perfectoid completion and torsor
presentations); AdicSpacesPartIII layer F0 (the formal spectrum), AdicSpacesPartII layer R0
(affinoid algebras and étale morphisms of Huber pairs) and layer R1 (fixed-field rigid spaces);
AdicEtaleGeometry §A1.16 (`CAff` and `YonedaAdicSpace` for integral pre-adic mapping spaces); the
seminormalisation construction of D6.9 ([KL16] Remark 3.7.3). Mathlib `WittVector`, `ProfiniteGrp`
and `CategoryTheory.Functor.IsFibered`; Tau Ceti `spaCompletionHomeomorph`.

## Downstream consumers

DiamondEtaleCohomology consumes the whole roadmap: the spectral and coherent-topos
foundations of D0, the disconnected covers of D1, the pro-étale and v-sites with their descent and
acyclicity theorems of D2, the morphism classes and effective descent of D3, the quotients,
underlying spaces and proper maps of D4, the spatial geometry and Hausdorff reduction of D5 and the
diamondification with its étale-site comparison of D6, and it adds the general canonical
compactification and the derived left-completion comparison that D3 and D6 leave to it. The six
operations and the diamond descriptions of period spaces and Shimura varieties consume D4–D6 through
that cohomology, and the FarguesFontaineDiamonds roadmap applies the diamond functor of D6 to the
Fargues–Fontaine curve. PerfectoidTowers is a consumer, by subsection: its P8 uses D2, D4, D5 and
D6.4 for quotients and spatial presentations, and its P9 uses D2.5, D2.9, D3.10 and D6.9, with P9.8
and P9.12 the tower specialisations of D2.9 and of D6.9's seminormal comparison. D2.9 and D6.9 use
the rigid pro-étale basis of PerfectoidSpaces P7.16. AdicEtaleGeometry A4.2–A4.5 and A4.7 and
PerfectoidSpaces P6.15–P6.17 supply the presentations used in D6. For both
EnhancedDerivedSheaves and DiamondEtaleCohomology, the generic qcqs and algebraic-topos input is
AdicSpacesPartII R0.19.10, “Quasicompact and quasiseparated objects; algebraic topoi”. The generic
filtered-colimit cohomology theorem is SchemeAndStackFoundations §2.5's
`cohomology_filtered_colimits`; D0.18, “Filtered colimits and cohomology on algebraic topoi”,
supplies the algebraic-topos comparison with that theorem. The adic-coefficient roadmap
compares the integral pre-adic diamondification of D6 with the adic-coefficient functors of schemes,
while the relative Fargues–Fontaine roadmap may use the integral v-sheaves of D6. Smallness for
integral symmetric powers requires an additional atlas theorem and is not supplied here.

## References

Page numbers are those of the linked manuscripts, rather than a different journal layout. For SGA 4,
use the transcription page numbers with the PDF positions stated beside them; its original marginal
pagination is a separate numbering. Stacks Project references use stable tags and lemma numbers
instead of pages.

- [ECD] Peter Scholze, Etale cohomology of diamonds. https://arxiv.org/pdf/1709.07343v4.
  arXiv:1709.07343v4, manuscript dated 15 April 2026; printed pp. 1–168.
- [Berkeley] Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry.
  https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf. author manuscript dated 27 March 2020;
  printed lecture pagination.
- [Ked21] Kiran S. Kedlaya, Simple connectivity of Fargues–Fontaine curves.
  https://www.numdam.org/item/10.5802/ahl.101.pdf. Annales Henri Lebesgue 4 (2021),
  printed pp. 1203–1233; Lemmas 9.3(a) and 10.2(a).
- [Arc] Bhargav Bhatt and Akhil Mathew, The arc-topology. https://arxiv.org/pdf/1807.04725v4.
  arXiv:1807.04725v4.
- [Hoc69] Melvin Hochster, Prime ideal structure in commutative rings.
  https://doi.org/10.1090/S0002-9947-1969-0251026-X. Trans. Amer. Math. Soc. 142 (1969), 43–60;
  Proposition 8.
- [KL15] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: foundations.
  https://arxiv.org/pdf/1301.0792. arXiv:1301.0792, author version of Astérisque 371 (2015).
- [KL16] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory II: imperfect period rings.
  https://arxiv.org/pdf/1602.06899. arXiv:1602.06899, author manuscript.
- [Temkin-resolution] Michael Temkin, Functorial desingularization of quasi-excellent schemes in
  characteristic zero: the non-embedded case. https://arxiv.org/pdf/0904.1592v2.
  Theorems 1.2.1, 2.3.5, 3.1.5 and 3.4.1; §§2–4.
- [BMT-resolution] Edward Bierstone, Pierre D. Milman and Michael Temkin, Q-universal
  desingularization. https://arxiv.org/pdf/0905.3580v1.
  Theorems 1.1–1.2 and 6.1, Addendum 6.1 and §7.
- [Heuer] Ben Heuer, A p-adic Simpson correspondence for smooth proper rigid varieties.
  https://arxiv.org/pdf/2307.01303. arXiv:2307.01303v3; used for the site conventions and
  attribution of the vector-bundle comparison.
- [HK] Sean Howe and Christian Klevdal, Admissible pairs and p-adic Hodge structures II: the
  bi-analytic Ax-Lindemann theorem. https://arxiv.org/pdf/2308.11064v2. arXiv:2308.11064v2.
- [GLX] Ian Gleason, Dong Gyu Lim and Yujie Xu, The connected components of affine Deligne–Lusztig
  varieties. https://arxiv.org/pdf/2208.07195v3. arXiv:2208.07195v3, 10 November 2025.
- [Sch12] Peter Scholze, Perfectoid spaces. https://arxiv.org/pdf/1111.4914. arXiv:1111.4914, author
  manuscript.
- [SGA 4 VI] Alexander Grothendieck and Jean-Louis Verdier, Théorie des topos et cohomologie étale
  des schémas, Tome 2, Exposé VI. https://pi.math.cornell.edu/~dkmiller/bin/sga4-2.pdf. freely
  hosted French transcription; Exposé VI numbering.
- [Stacks normal rings] The Stacks Project Authors, Stacks Project: normal rings.
  https://stacks.math.columbia.edu/tag/030C. Finite decomposition, with its reducedness and
  finite-minimal-prime hypotheses.
- [Stacks seminormalization] The Stacks Project Authors, Stacks Project: absolute weak
  normalization and seminormalization. https://stacks.math.columbia.edu/tag/0EUK.
  Tags 0EUL, 0EUQ, 0EUR, 0EUM, 0EUS, 0CND (subintegral extensions) and
  0H3G (reduced subintegral maps over a seminormal base); only the seminormalization
  statements are used here.
- [Stacks quotient spaces] The Stacks Project Authors, Stacks Project: quotient spaces.
  https://stacks.math.columbia.edu/tag/0APA. Stable section and tag numbering.
- [Stacks constant sheaves] The Stacks Project Authors, Stacks Project: cohomology of sheaves.
  https://stacks.math.columbia.edu/tag/02UW. Stable section and tag numbering.
- [Stacks stackification] The Stacks Project Authors, Stacks Project: stackification and quotient
  stacks. https://stacks.math.columbia.edu/tag/02ZM. Stable section and tag numbering.
- [BS15] Bhargav Bhatt and Peter Scholze, The pro-étale topology for schemes.
  https://people.mpim-bonn.mpg.de/scholze/proetale.pdf. author-hosted manuscript, with its own
  printed pagination.
- [Stacks Leray] The Stacks Project Authors, Stacks Project: Leray spectral sequence.
  https://stacks.math.columbia.edu/tag/072X. Stable section and tag numbering.
- [Stacks fppf domination] The Stacks Project Authors, Stacks Project: more on morphisms, dominating
  fppf coverings by finite locally free morphisms. Lemma 37.48.1,
  https://stacks.math.columbia.edu/tag/0DET, and Lemma 37.48.2,
  https://stacks.math.columbia.edu/tag/05WN. Stable
  section and tag numbering.
- [Huber96] R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*,
  Aspects of Mathematics E30, Vieweg, 1996; Definition 1.6.5, p. 78,
  Proposition 1.6.7, p. 79, §2.1, p. 109 (adic étale site), and
  Proposition 2.1.4, p. 111 (rigid–adic topos comparison).
