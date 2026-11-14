# Roadmap: spectral sequences and convergence

**Summary.** Mathlib's `CategoryTheory.SpectralSequence` records the pages of a spectral sequence
in an abelian category and the isomorphisms identifying the homology of one page with the next;
Mathlib's spectral objects produce such sequences, and the pinned Tau Ceti attaches to a spectral
object indexed by `EInt` its abutment, the filtration of the abutment and the graded pieces, and
builds from them the spectral sequence of a filtered cochain complex. What neither library has is
the common language in which a spectral sequence *converges*: the cycle and boundary towers of an
arbitrary spectral sequence, its limit page, convergence as a structure on a pair (spectral
sequence, filtered abutment) in a prescribed set of total degrees, and the theorems that use this
structure. This roadmap builds that language over an arbitrary abelian category and proves: the
stabilisation theorems for bounded and regular sequences; the comparison theorem; the vanishing,
dimension-count, Euler-characteristic, two-row, two-column, edge-morphism and five-term
consequences; the identification of the towers and of the limit page of the spectral sequence of
a spectral object, with convergence criteria in a range of degrees (Stacks Lemma 24.13 in
spectral-object form) and the convergence of Mathlib's first- and third-quadrant sequences;
convergence of the spectral sequence of a filtered complex in the finite, cohomologically bounded
and exhaustive-bounded-below cases; the spectral sequence of an exact couple, its towers, and its
identification with the spectral sequence of a spectral object; and, in replete abelian
categories (Tau Ceti's `TauCeti.IsReplete`) with countable products and coproducts and exact
sequential colimits, Boardman's conditional-convergence theorems with the whole-plane obstruction
and the complete convergence theorem for filtered complexes.

## Scope and ownership

This roadmap owns:

- the cycle and boundary towers, stabilisation, regularity, coregularity, degeneration and the
  limit page of an arbitrary spectral sequence in Mathlib's carrier;
- bidegree assignments, boundedness, and the Euler characteristic of pages;
- decreasing filtrations as Mathlib filtered objects together with graded pieces, exhaustiveness,
  separation, completeness and finiteness; weak, ordinary and strong convergence in a set of
  total degrees; morphisms of converging spectral sequences; the comparison theorem; the
  consequences listed in Layer 3;
- the towers, limit page and convergence of the spectral sequence of a spectral object indexed
  by `EInt`, including Mathlib's first- and third-quadrant sequences, and the towers of Mathlib's
  sequence of a spectral object indexed by `Fin (l + 1)`;
- the classical indexing of the spectral sequence of a decreasingly filtered cochain complex in an
  arbitrary abelian category, its convergence in the cohomologically bounded and
  degreewise-finite cases, and Weibel's classical convergence theorem in abelian categories with
  exact sequential colimits;
- the spectral sequence of an exact couple in Mathlib's carrier, its towers, and the exact couple
  of a spectral object and of a filtered complex with the identification of spectral sequences;
- lim and lim¹ of towers in abelian categories with countable products, the characterisation of
  repleteness through lim¹ and the Mittag–Leffler vanishing in replete abelian categories,
  Boardman's double-tower sequence, conditional convergence and Boardman's theorems for exact
  couples, and the complete convergence theorem for filtered complexes, in abelian categories.

It leaves to named owners:

- **Mathlib** (at the pin): the carrier `CategoryTheory.SpectralSequence` and its cohomological
  abbreviations, spectral objects and the recipes `coreE₂Cohomological`, `coreE₂CohomologicalNat`,
  `coreE₂CohomologicalFin`, `coreE₂HomologicalNat`, the classes `IsFirstQuadrant` and
  `IsThirdQuadrant`, the mapping-cone spectral object, filtered objects, subobject lattices, the
  Grothendieck axioms and Serre classes.
- **Tau Ceti** (at the pin): the abutment `abutment`, its filtration `abutmentFiltration`, the
  object `EInfty` and its identification with the graded pieces, the stabilisation isomorphism
  `spectralSequencePageXIsoEInfty`, the comparison theorems for spectral objects and for
  finitely filtered complexes, the spectral sequence of an increasing filtration of a cochain
  complex with its first page and first differential, the exhaustive convergence theorems for
  complexes of modules, the row-filtration spectral sequence of a first-quadrant bicomplex, the
  product–difference map of a tower, module towers with lim, lim¹ and Mittag–Leffler
  vanishing, replete categories with the exactness of countable products in a replete abelian
  category and the repleteness of sheaves on a replete topos, and the Euler–Poincaré engine for
  additive invariants. These are consumed as they stand; this roadmap restates none of them.
  Three targets here are kept variants of Tau Ceti theorems: 4.4 and 4.6 replace the vanishing of
  `H^{n−1}(j ≤ ⊤)` and `H^n(j ≤ ⊤)` for large `j` by the condition that `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` be
  an isomorphism, and the comparison theorem of 5.4 holds in every abelian category with exact
  sequential colimits and asks nothing of the graded pieces in the exhaustive direction, where
  Tau Ceti's `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` is
  for complexes of modules whose graded pieces beyond a bound have vanishing cohomology.
- **DGFloer, Layer 1 item 3**: the homological and cohomological adapters for filtered complexes
  of modules over a ring, Weibel's classical convergence theorem 5.5.1(2) and the complete
  convergence theorem 5.5.10 for module complexes. This roadmap's abelian-category theorems
  specialise to these; the specialisation is recorded at 5.4 and 7.5, and the module statements
  are not restated.
  **DGFloer, Layer 1 item 2** owns the Serre spectral sequences.
- **AlgebraicTopology, §6.0**: the restriction towers of singular and cellular cochains of a CW
  pair, and the maps of homotopy limits induced by maps of towers of module complexes whose
  squares commute up to specified homotopies. The module tower algebra it builds on (lim, lim¹,
  the six-term sequence, Mittag–Leffler vanishing, the Milnor sequences) is Tau Ceti's
  `TauCeti.ModuleTower` and `TauCeti.ComplexTower`. Layer 7 here owns lim and lim¹ only in an
  abelian category, states no homotopy limit, and identifies its lim and lim¹ on modules with
  Tau Ceti's (7.1).
- **DerivedModuleAlgebra, §S.1**: the spectral sequence of a first-quadrant double complex in an
  abelian category, with the column filtration of its abutment, edge morphisms and five-term
  sequence; an instance of Layers 3 and 4, recorded in their Examples.
- **StableHomotopyKTheory, §7.22**: bigraded exact couples in an abelian category and their derived
  couples. Layer 6 assembles the iterated derived couples into Mathlib's carrier and proves the
  identifications. **StableHomotopyKTheory, §§7.21 and 7.23–7.26**: filtered spectra, their
  spectral sequences and their convergence, including Boardman's theorem for towers of spectra.
  Two of these are instances of statements here, kept with their owner: §7.23's identification
  of the exact-couple pages of a filtered spectrum with Mathlib's spectral-object pages is, after
  its homological reindexing, 6.3 for its homotopy spectral object, and the abelian-group form of
  §7.26 is 7.4 in `ModuleCat ℤ` once its bidegrees are converted to the cohomological ones of 6.1
  (recorded at 7.4).
- **SchemeAndStackFoundations, §2.2** (Leray and Čech spectral sequences), **ComplexKahlerGeometry,
  K8** (the Frölicher spectral sequence), **HeegaardFloer** and **MorseTheory** (finite filtered
  complexes of modules): instances that stay with their owners.
- **SchemeAndStackFoundations, §2.17**: replete topoi, and *IsReplete.derived_limits* (in a
  replete topos, `R lim` of a tower of abelian sheaves with epimorphic transitions is `lim`, and
  `lim¹ = 0`). The vanishing of `lim¹` there is an instance of 7.2, through Tau Ceti's
  `TauCeti.isReplete_sheaf`.
- **EnhancedDerivedSheaves, E2:towers.1, E2.1 and E2.2**: derived limits of coherent towers,
  countable products in a replete topos, the Milnor sequence and pro-zero vanishing for module
  sheaves on a replete topos. Layer 7 here concerns `lim` and `lim¹` in an abelian category and
  Tau Ceti's repleteness of a category; it states no derived limit.

Multiplicative structures on spectral sequences, the Adams and Atiyah–Hirzebruch spectral
sequences, and spectral sequences in triangulated or stable ∞-categories beyond Mathlib's
`CategoryTheory.Triangulated.SpectralObject` and its image under a homological functor are not
part of this roadmap.

## Conventions

- **Categories.** `C` is an abelian category. Every further hypothesis on `C` is stated at the
  target that uses it: countable products (`HasCountableProducts`), countable coproducts
  (`HasCountableCoproducts`), exact countable products (`CountableAB4Star`), exact sequential
  colimits (`HasColimitsOfShape ℕ C` together with `HasExactColimitsOfShape ℕ C`), and, in Layer
  7, repleteness (Tau Ceti's `TauCeti.IsReplete`), which with countable products gives
  `CountableAB4Star`. No universe or smallness hypothesis is imposed beyond what Mathlib's and
  Tau Ceti's classes carry.
- **Spectral sequences.** A spectral sequence is an object of Mathlib's
  `CategoryTheory.SpectralSequence C c r₀`: pages `E.page r` for `r ≥ r₀`, homological complexes
  of shape `c r` on an index type `κ`, and isomorphisms `E.iso r (r+1) pq` from the homology of
  page `r` at `pq` to the object of page `r + 1` at `pq`. No page below `r₀` is formed; for a
  filtered complex the classical `E₀ = gr K` is the complex whose cohomology is the first page.
- **Cohomological indexing.** In `CohomologicalSpectralSequence C r₀` the differential of page `r`
  goes from `(p, q)` to `(p + r, q + 1 − r)`. Here `p` is the filtration degree and `p + q` the
  total degree. Filtrations are decreasing: `F^{p+1} ⊆ F^p`, `gr^p = F^p / F^{p+1}`. Homological
  and first-quadrant carriers are handled by bidegree assignments (Layer 2), not by a second
  theory.
- **Meets and joins of subobjects.** `Subobject X` is Mathlib's poset of subobjects. The meet of
  a family is its greatest lower bound and the join its least upper bound in that poset. Their
  existence is either a hypothesis or a theorem; it is never assumed silently.
- **Convergence dictionary.** *Weak convergence* means given isomorphisms `β` from the limit page
  to the graded pieces, as in helle-rognes2024 line 94–96, Definition 2.7. stacks-012K "weakly
  converges" (line 3131–3136, Definition 24.9 (1)) asks instead that the canonical comparison of
  its Lemma 24.6 be an isomorphism; for a filtered complex that is the structure of 5.2 whose `β`
  are those comparisons, and it is strictly stronger (5.2, fourth Check). *Convergence* adds that
  each filtration is exhaustive and separated (stacks-012K "abuts"; Helle–Rognes and Boardman
  "converges"). *Strong convergence* adds completeness (Helle–Rognes and Boardman "converges
  strongly"; stacks-012K "converges" additionally requires regularity, which here is a separate
  property of the spectral sequence). Helle–Rognes include exhaustiveness in "converges weakly";
  here it is not included. Helle–Rognes and Boardman call a filtration *complete* when
  `lim¹_p F^p = 0` and *Hausdorff* when its meet `lim_p F^p` is `0` (helle-rognes2024 line 81–84,
  Definition 2.5).
  Here *complete* is the limit-cone condition of 3.1. It implies separated (3.1) and, with
  countable products, `lim¹_p F^p = 0`; under `CountableAB4Star` it is equivalent to Hausdorff
  together with `lim¹_p F^p = 0` (7.1). A filtration with `lim¹_p F^p = 0` and nonzero meet is
  complete in their sense and not in this one.
- **Classical indexing of a filtered complex.** For a decreasing filtration `F^p` of a cochain
  complex `K`, the increasing functor `G_t = F^{−t}` is the filtration that Tau Ceti's
  `CochainComplex.filtrationFunctor` takes. The classical `E_r^{p,q}` is page `r + 1` of
  `CochainComplex.spectralSequence` at the native bidegree `(2p + q + 1, −p − 1)`. This is the
  dictionary of DGFloer, Layer 1 item 3, there for module complexes. *Witness:* for
  `K = (ℤ →(×2) ℤ)` in degrees `0, 1` with `F^0 = K`, `F^1 = K^1`, `F^2 = 0`, the classical
  `E_1^{0,0} = ℤ` and `E_1^{1,0} = ℤ` sit at native `(1, −1)` and `(3, −2)` on page `2`, and the
  native differential `(1, −1) → (3, −2)` is multiplication by `+2`.
- **E₂ indexing of a spectral object.** For a spectral object `X` indexed by `EInt` and Mathlib's
  recipe `coreE₂Cohomological`, the object at `(p, q)` on page `r` is
  `E^{p+q}(q − r + 2 ≤ q ≤ q + 1 ≤ q + r − 1)`. The abutment `H^n = H^n(⊥ ≤ ⊤)` (Tau Ceti
  `abutment`) carries the decreasing filtration `F^p H^n := abutmentFiltration (n − p + 1) n`, so
  that `gr^p H^n ≅ EInfty (n − p) n` sits at `(p, n − p)`. *Witness:* for the complex of the
  previous item, the class `ℤ/2 = H^1` lies at native `(3, −2)`, with `F^3 H^1 = H^1` and
  `F^4 H^1 = 0`. In the classical indexing it is `gr^1 H^1`, so in degree `n` the two indexings
  differ by `n + 1`.
- **Connecting morphisms.** The connecting morphism of a short exact sequence of complexes is
  Mathlib's, without an additional sign. Tau Ceti's `spectralSequence_first_page_d_eq` identifies
  the first differential with it.
- **Towers.** A tower is a functor `ℕᵒᵖ ⥤ C`. lim¹ is the cokernel of Tau Ceti's
  product–difference map `CategoryTheory.Functor.towerDifference` (`1 − s` on `∏ Fₙ`). It is
  defined whenever the product exists, and agrees with the first derived functor of lim only
  under the hypotheses of Layer 7.
- **Exact couples.** Bigraded exact couples `D →i D →j E →k D` with degrees `a, b, c` are those of
  StableHomotopyKTheory §7.22. The cohomological couple of a decreasing filtration has
  `a = (−1, 1)`, `b = (0, 0)` and `c = (1, 0)`, so that `d_r` has degree `c + b − (r − 1)a =
  (r, 1 − r)`. Total degrees: `i` and `j` preserve the total degree and `k` raises it by one. For
  the tower `A_n^s = D^{s, n−s}` in total degree `n`, the limit-page objects of total degree `n`
  converge to the colimit `A_n^{−∞}` but to the limit `A_{n+1}^{+∞}` (7.4). *Witness:* the two
  step couples of 7.4's Checks. In the colimit one `E_∞^{0,0} = ℤ` matches `A_0^{−∞} = ℤ`; in the
  limit one it matches `A_1^{+∞} = ℤ`, while `A_0^{+∞} = 0`.

## Exact supplier contracts

### From Mathlib

- `CategoryTheory.SpectralSequence`, `CategoryTheory.SpectralSequence.Hom`,
  `CategoryTheory.SpectralSequence.pageFunctor`,
  `CategoryTheory.SpectralSequence.pageHomologyNatIso`,
  `CategoryTheory.SpectralSequence.pageXIsoOfEq`, `CategoryTheory.CohomologicalSpectralSequence`,
  `CategoryTheory.E₂CohomologicalSpectralSequence`,
  `CategoryTheory.CohomologicalSpectralSequenceNat`,
  `CategoryTheory.CohomologicalSpectralSequenceFin`, `ComplexShape.up'`,
  `ComplexShape.spectralSequenceNat` and `ComplexShape.spectralSequenceFin`
  (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` and `ComplexShape.lean`). A spectral
  sequence records pages and homology isomorphisms only; no limit page, abutment or convergence
  is recorded.
- `CategoryTheory.Abelian.SpectralObject` with `H`, `δ`, `E`, `cycles`, `opcycles`,
  `CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore`,
  `CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological`, `coreE₂CohomologicalNat`,
  `coreE₂CohomologicalFin`, `coreE₂HomologicalNat`, `HasSpectralSequence`, `IsFirstQuadrant`,
  `IsThirdQuadrant`, `spectralSequence`, `spectralSequencePageXIso`, `isoMapFourδ₁Toδ₀'`,
  `isoMapFourδ₄Toδ₃'`, `SpectralSequenceDataCore.HasFirstPageComputation`,
  `spectralSequenceFirstPageXIso` (`Mathlib/Algebra/Homology/SpectralObject/`). The object
  `E^n(i₀ ≤ i₁ ≤ i₂ ≤ i₃)` is the homology of
  `H^{n−1}(i₂ ≤ i₃) →δ H^n(i₁ ≤ i₂) →δ H^{n+1}(i₀ ≤ i₁)`. The recipe `coreE₂CohomologicalFin l`
  is for spectral objects indexed by `Fin (l + 1)`, with positions `ℤ × Fin l` and indices
  clamped to `0` and `l`; `HasSpectralSequence` is an instance for it and for
  `coreE₂Cohomological`, and a hypothesis for `coreE₂CohomologicalNat` and `coreE₂HomologicalNat`,
  implied by `IsFirstQuadrant` and `IsThirdQuadrant` respectively. `HasFirstPageComputation` is an
  instance for the three recipes on `EInt` only.
- `HomotopyCategory.spectralObjectMappingCone`,
  `CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor`, `EInt`
  (`Mathlib/Order/WithBotTop.lean`).
- `CategoryTheory.FilteredObject`, `CategoryTheory.Filtration`,
  `CategoryTheory.FilteredObject.Hom`, `CategoryTheory.FilteredObject.IsStrictHom`
  (`Mathlib/CategoryTheory/Filtration/Basic.lean`). A filtration indexed by `ℤᵒᵖ` is a decreasing
  family of monomorphisms into the object; exhaustiveness, separation and completeness are not
  part of the definition.
- `CategoryTheory.Subobject`, `Subobject.ofLE`, `Subobject.pullback`, `imageSubobject`,
  `kernelSubobject` (`Mathlib/CategoryTheory/Subobject/`). Arbitrary meets and joins in
  `Subobject X` are provided by Mathlib only under well-poweredness and all small limits or
  coproducts. The countable meets and joins used here are built in Layer 1 from countable
  products and coproducts.
- `HasCountableProducts`, `HasCountableCoproducts`, `CountableAB4Star`, `HasExactColimitsOfShape`,
  `AB5`, `EnoughProjectives`, `IsGrothendieckAbelian`, with the module-category instances `AB5`
  and `AB4Star` for `ModuleCat.{u} R` with `R : Type u` only, and `EnoughProjectives` for
  `ModuleCat.{v} R` under `Small.{v} R`. `CountableAB4Star` follows from `AB4Star` by the
  instance after its definition, and exact sequential colimits follow from `AB5` by the lemma
  `AB5OfSize_shrink`
  (`Mathlib/CategoryTheory/Limits/Shapes/Countable.lean`,
  `Mathlib/CategoryTheory/Limits/HasExactLimitsOfShape.lean`,
  `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean`,
  `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean`,
  `Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean`,
  `Mathlib/Algebra/Category/ModuleCat/AB.lean`,
  `Mathlib/Algebra/Category/ModuleCat/Projective.lean`).
- `ModuleCat.forget_preservesEpimorphisms` (`Mathlib/Algebra/Category/ModuleCat/EpiMono.lean`)
  and the instance, dual to `CategoryTheory.Functor.reflectsMonomorphisms_of_faithful`, by which a
  faithful functor reflects epimorphisms (`Mathlib/CategoryTheory/Functor/EpiMono.lean`): the
  forgetful functor from `ModuleCat.{v} R` to `Type v` preserves and reflects epimorphisms, in
  every universe `v`.
- `CategoryTheory.IsArtinianObject` and
  `CategoryTheory.antitone_chain_condition_of_isArtinianObject`
  (`Mathlib/CategoryTheory/Subobject/ArtinianObject.lean`): an object is Artinian when
  `Subobject X` satisfies the descending chain condition, and every antitone sequence of its
  subobjects is then eventually constant. No length function is part of the definition.
- `CategoryTheory.ObjectProperty.IsSerreClass`
  (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean`), `ComplexShape.EulerCharSigns`,
  `HomologicalComplex.eulerChar`, `HomologicalComplex.homologyEulerChar`
  (`Mathlib/Algebra/Homology/EulerCharacteristic.lean`).
- `CategoryTheory.ObjectProperty.ContainsZero`,
  `CategoryTheory.ObjectProperty.IsClosedUnderKernels`,
  `CategoryTheory.ObjectProperty.IsClosedUnderCokernels` and
  `CategoryTheory.ObjectProperty.IsClosedUnderExtensions`
  (`Mathlib/CategoryTheory/ObjectProperty/ContainsZero.lean`, `Kernels.lean`, `Extensions.lean`).
  Together they make a property of objects a weak Serre class: some zero object has it, it is closed
  under every kernel and cokernel of a morphism between its objects (any limit kernel fork or
  colimit cokernel cofork, so the property is closed under isomorphisms), and under the middle term
  of short exact sequences.
- `HomologicalComplex.dFrom` and `HomologicalComplex.dTo`
  (`Mathlib/Algebra/Homology/HomologicalComplex.lean`): the differentials leaving and entering a
  position, zero when the shape has no relation there; `Int.negOnePow` for signs.
- `CategoryTheory.ComposableArrows.twoδ₂Toδ₁` and, for a spectral object indexed by a preorder,
  `CategoryTheory.Abelian.SpectralObject.mapFourδ₁Toδ₀'`, `mapFourδ₄Toδ₃'`, `isIso_mapFourδ₁Toδ₀'`,
  `isIso_mapFourδ₄Toδ₃'`, `isoMapFourδ₁Toδ₀'` and `isoMapFourδ₄Toδ₃'`
  (`Mathlib/CategoryTheory/ComposableArrows/Two.lean`,
  `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean`): the canonical maps
  `E^n(i₀ ≤ i₂ ≤ i₃ ≤ i₄) → E^n(i₁ ≤ i₂ ≤ i₃ ≤ i₄)` and
  `E^n(i₀ ≤ i₁ ≤ i₂ ≤ i₃) → E^n(i₀ ≤ i₁ ≤ i₂ ≤ i₄)`, isomorphisms when `H^{n+1}(i₀ ≤ i₁)`,
  respectively `H^{n−1}(i₃ ≤ i₄)`, vanishes. The second is also an isomorphism when
  `H^{n−1}(i₂ ≤ i₄) → H^{n−1}(i₃ ≤ i₄)` is zero (`isIso_map_fourδ₄Toδ₃`); the criterion of 4.3 for
  `i₀ = ⊥`, that `H^n(⊥ ≤ i₃) → H^n(⊥ ≤ i₄)` be a monomorphism, is not at the pin.

### From Tau Ceti

- `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`
  (`TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean`): a morphism of spectral sequences
  that is an isomorphism at every position of page `r` is one at every position of every page
  `r' ≥ r`.
- `CategoryTheory.Abelian.SpectralObject.abutment`, `abutmentFiltration`, `abutmentFiltrationι`,
  `abutmentFiltrationMap`, `EInftyIsoCokernel`, `isZero_abutmentFiltration`,
  `isIso_abutmentFiltrationι` (`SpectralObject/Abutment.lean`), and `EInfty`,
  `spectralSequencePageXIsoEInfty` and `coe_le_coe_add_one` (`SpectralObject/Stabilization.lean`).
  For `X` indexed by `EInt`,
  `abutmentFiltration q n` is the image of `H^n(⊥ ≤ q)` in `H^n(⊥ ≤ ⊤)`, increasing in `q`.
  `EInfty q n = E^n(⊥ ≤ q ≤ q + 1 ≤ ⊤)` is the cokernel of the step from `q` to `q + 1`. Page
  objects are identified with `EInfty` when `H^{n+1}(⊥ ≤ q − r + 2)` and `H^{n−1}(q + r − 1 ≤ ⊤)`
  vanish.
- `CategoryTheory.Abelian.SpectralObject.isIso_hom_app_abutment`,
  `CategoryTheory.Abelian.SpectralObject.isIso_hom_app_abutment_of_isIso_page`,
  `spectralSequencePageXMap_comp_pageXIsoEInfty_hom`
  (`SpectralObject/Comparison.lean`), `spectralSequenceMap`, `spectralSequencePageXMap`
  (`SpectralObject/SpectralSequenceMap.lean`), `EMap`, `opcyclesMapOfHom`,
  `isIso_opcyclesMapOfHom_of_isIso` (`SpectralObject/Map.lean`).
- `CochainComplex.spectralObject`, `CochainComplex.spectralObjectMap`,
  `CochainComplex.filtrationFunctor`, `CochainComplex.filtrationFunctorMap`,
  `CochainComplex.spectralSequence`, `CochainComplex.spectralSequenceFirstPageXIsoCokernel`,
  `CochainComplex.spectralObjectHIsoCokernel` (for `f : i ⟶ j` with `F.map f` a monomorphism,
  `H^n(f) ≅ H^n(coker F.map f)`; for the functor of a filtration and `f : ⊥ ⟶ i` this is
  `H^n(G_i)`) and `CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom` (under
  these isomorphisms the maps of the spectral object are the maps induced on cokernels)
  (`SpectralSequence/Filtered/SpectralObject.lean`, `Naturality.lean`);
  `CochainComplex.spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean`);
  `CochainComplex.isZero_spectralObject_H_bot`, `CochainComplex.isZero_spectralObject_H_top`,
  `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (`Filtered/Stabilization.lean`);
  `CochainComplex.filtrationAbutmentIso`,
  `CochainComplex.toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`,
  `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite` (`Filtered/Convergence.lean`);
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page` (`Filtered/Comparison.lean`);
  `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`,
  `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive`,
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`
  (`Filtered/Exhaustive.lean`, complexes of modules only). The filtration there is increasing,
  `ℤ → Subobject K` with `⊥` and `⊤` adjoined at the ends of `EInt`.
- `HomologicalComplex₂.rowFiltrationSpectralSequence`,
  `HomologicalComplex₂.rowFiltrationSpectralSequencePageXIsoEInfty`
  (`SpectralSequence/Bicomplex.lean`).
- `CategoryTheory.Functor.towerDifference`, `CategoryTheory.Functor.towerDifference_naturality`,
  `CategoryTheory.Functor.isLimitConeOfTowerDifference`,
  `CategoryTheory.Functor.IsProZero.isIso_towerDifference`
  (`TauCeti/CategoryTheory/Preadditive/TowerDifference.lean`): the map `1 − s` in a preadditive
  category with the product; its kernel is the limit; for a pro-zero tower it is an isomorphism
  without any exactness hypothesis.
- `TauCeti.IsReplete`, `TauCeti.IsReplete.epi_π_app`, `TauCeti.IsReplete.countableAB4Star`,
  `TauCeti.IsReplete.of_reflectsEpimorphisms`, `TauCeti.isReplete_type`
  (`TauCeti/CategoryTheory/Limits/Replete.lean`), `TauCeti.isReplete_sheaf`
  (`TauCeti/CategoryTheory/Sites/Replete.lean`) and `TauCeti.isReplete_lightCondMod`
  (`TauCeti/Condensed/Light/Replete.lean`). A category is replete when, for every tower
  `F : ℕᵒᵖ ⥤ C` whose transitions are epimorphisms, the projection to `F 0` of every limit cone is
  an epimorphism; every projection is then one (`epi_π_app`). A replete abelian category with
  countable products satisfies `CountableAB4Star` (the instance `countableAB4Star`). Repleteness
  descends along a functor that preserves sequential limits and preserves and reflects
  epimorphisms; `Type u` is replete; sheaves with values in a concrete category on a replete
  topos are replete, under the hypotheses of `isReplete_sheaf`; light condensed modules over a
  ring are replete. The definition says nothing about `lim¹`; 7.2 supplies that.
- `TauCeti.ModuleTower.lim`, `TauCeti.ModuleTower.limOne`, `TauCeti.ModuleTower.IsMittagLeffler`,
  `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`
  (`TauCeti/Algebra/Category/ModuleCat/Tower/`). The Mittag–Leffler condition there is Mathlib's
  `CategoryTheory.Functor.IsMittagLeffler` of the underlying tower of types: for every `n` the
  ranges of the maps `F_k → F_n` are eventually constant.
- `TauCeti.AbelianK0.AdditiveInvariant` (`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`)
  and `HomologicalComplex.sum_negOnePow_X_eq_sum_negOnePow_homology`
  (`TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean`).

### From TauCetiRoadmap.StableHomotopyKTheory

- §7.22: bigraded exact couples `D →i D →j E →k D` in an abelian category, of degrees `a, b, c`,
  exact at each vertex; the derived couple `D′ = im i`, `E′ = H(E, jk)` of degrees `a, b − a, c`;
  and the iterated derived couples, with `d_r` of degree `c + b − (r − 1)a` on page `r ≥ 1`.
  Assumed: the derived couple is again exact, and the homology of `(E, jk)` at a bidegree is the
  homology of the complex of shape `ComplexShape.up' (c + b)` at that bidegree.
- What StableHomotopyKTheory must provide (gap:exact-couple-morphisms): Define morphisms of
  bigraded exact couples of fixed degrees a, b, c in an abelian category (bigraded maps of D and of
  E commuting with i, j and k), with identities and composition, and the morphism of derived
  couples that a morphism induces, functorially, so that it induces a morphism on every page.
  Layer 6 uses it for the functoriality of the spectral sequence of an exact couple (6.1) and of
  the couples of 6.3.
- §7.26 (as an instance only): Boardman's conditional and strong convergence for towers of
  spectra, with abelian-group homotopy.

### From TauCetiRoadmap.DGFloer

- Layer 1 item 3: the classical and complete convergence theorems for filtered complexes of
  modules, and the classical-to-native reindexing. Compared in Checks of Layers 5 and 7, not
  consumed by any proof.

### From TauCetiRoadmap.AlgebraicTopology

- §6.0: restriction towers and the homotopy-square maps of towers of module complexes, built on
  Tau Ceti's `TauCeti.ModuleTower` and `TauCeti.ComplexTower`. Not consumed by any proof here:
  the lim and lim¹ on `ModuleCat R` that 7.1 identifies with Layer 7's are Tau Ceti's (From Tau
  Ceti), the ones §6.0 builds on.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §S.1: the spectral sequence of a first-quadrant double complex `A` in an abelian category, the
  column filtration of `Hⁿ(Tot A)`, the identification `E_∞^{pq} ≅ FᵖH^{p+q}/F^{p+1}H^{p+q}`, the
  stabilisation `E_r^{pq} = E_∞^{pq}` for `r > max(p, q + 1)`, the edge morphisms
  `E₂^{n,0} → Hⁿ(Tot A) → E₂^{0,n}` and the five-term sequence. Compared with Layers 3 and 4 in
  Examples, not consumed by any proof.

## How to read the build

Layer 1 builds, for an arbitrary spectral sequence in Mathlib's carrier, the cycle and boundary
towers inside the first page, stabilisation, and the limit page `Z_∞/B_∞`; this needs no
hypothesis on `C` at stabilising positions and countable products and coproducts in general.
Layer 2 adds bidegree assignments, boundedness with its stabilisation theorems, and the Euler
characteristic of pages. Layer 3 defines filtered abutments and the three convergence
structures in a set of total degrees, and proves the finite-filtration theorems, the comparison
theorem and the standard consequences. Layer 4 identifies the towers of the spectral sequence of
a spectral object indexed by `EInt` as kernels and images of connecting morphisms, compares its
limit page with Tau Ceti's `EInfty`, and proves convergence in a range of degrees, including
Mathlib's quadrant cases. Layer 5 specialises to decreasingly filtered complexes in the
classical indexing: finite, cohomologically bounded and exhaustive-bounded-below filtrations.
Layer 6 puts the spectral sequence of an exact couple into Mathlib's carrier, computes its
towers, and identifies the exact couple of a spectral object and of a filtered complex with
Layers 4 and 5. Layer 7 builds lim and lim¹ in abelian categories, characterises Tau Ceti's
repleteness through lim¹, the hypothesis on `C` under which tower arguments hold, and proves
Boardman's conditional-convergence theorems and the complete convergence theorem.

## Layer 1: cycle and boundary towers and the limit page

### 1.1 Subquotient presentations

Define a *subquotient presentation* of an object `X` inside an object `A` as a pair of subobjects
`B ≤ Z` of `A` together with an isomorphism from the cokernel of `Subobject.ofLE B Z` to `X`.
Construct, for a presentation `(B, Z, e)` of `X` and a pair of subobjects `I ≤ K` of `X`, the
subobjects `B ≤ B′ ≤ Z′ ≤ Z` of `A`: `Z′` is the preimage of `K` and `B′` the preimage of `I`
under the projection from `Z` onto `X`. Construct also a presentation `(B′, Z′)` of the cokernel
of `I ≤ K` (stacks-012K line 2614–2619, the construction of `B₃` and `Z₃` from `d₂`;
helle-rognes2024 line 68–70, proof of Lemma 2.2). *Needs:* Mathlib `Subobject`,
`Subobject.pullback`, `imageSubobject`, `Subobject.ofLE`, cokernels in an abelian category.

- Preimage along the projection is an order isomorphism from `Subobject X` onto the interval
  `[B, Z]` of `Subobject A`, with inverse the image followed by `e`.
- This order isomorphism carries every greatest lower bound and least upper bound that exists on
  one side to one on the other side.
- The presentation of the cokernel of `I ≤ K` is natural: for `I ≤ I′ ≤ K′ ≤ K` it is the
  presentation obtained in two steps.
- For `A = X`, the presentation `(⊥, ⊤, e)` with `e` the canonical identification (the cokernel
  of a morphism out of the zero object `⊥` is its target, and the arrow of `⊤` is an isomorphism)
  is the identity presentation; transport along it is the identity. The two subobjects alone do
  not fix `e` (third Check).

**Checks.**

- In `ModuleCat ℤ`, `A = ℤ`, `B = 4ℤ`, `Z = ℤ`, `X = ℤ/4`: the subobjects `0 ≤ 2ℤ/4ℤ ≤ ℤ/4` go to
  `4ℤ ≤ 2ℤ ≤ ℤ`. A model taking images in `A` instead of preimages would send `2ℤ/4ℤ` to a
  subobject not containing `B`.
- For `X = 0` every presentation has `B = Z`, and the interval is a single point.
- Two presentations of the same `X` inside the same `A` can differ: inside `A = ℤ/4`, both
  `(B, Z) = (0, 2ℤ/4ℤ)` and `(B, Z) = (2ℤ/4ℤ, ℤ/4)` present `ℤ/2`. So the isomorphism `e` and
  the pair `(B, Z)` are data, not determined by `X`.
- *The marking matters for the identity.* Take `A = X = ℤ²`, `B = 0`, `Z = A`, and let `e` be the
  coordinate swap composed with the canonical identification. Preimage along `Z ↠ X` sends the
  axis `ℤ × 0` of `X` to the axis `0 × ℤ` of `A`, whereas transport along the identity
  presentation sends it to `ℤ × 0`. With the canonical `e` each axis is its own preimage.

### 1.2 The cycle and boundary towers

For `E : SpectralSequence C c r₀` and a position `pq : κ`, construct by induction on `r ≥ r₀`
subobjects `Z_r(pq)` and `B_r(pq)` of the first object `(E.page r₀).X pq`, with presentations of
`(E.page r).X pq` by `(B_r(pq), Z_r(pq))`. The start is `B_{r₀} = ⊥`, `Z_{r₀} = ⊤`. In the
inductive step `Z_{r+1}` is the preimage of the kernel of the differential of page `r` leaving
`pq`, and `B_{r+1}` the preimage of the image of the differential of page `r` entering `pq`,
transported by 1.1 and by `E.iso r (r+1) pq` (stacks-012K line 2612–2624, the construction after
Definition 20.1, tag 011N; helle-rognes2024 line 65–70, Lemma 2.2). *Needs:* 1.1; Mathlib
`CategoryTheory.SpectralSequence`, `HomologicalComplex.cycles`, `HomologicalComplex.homology`.

- `B_r ≤ B_{r+1} ≤ Z_{r+1} ≤ Z_r` for all `r ≥ r₀`.
- `Z_{r+1} = Z_r` if and only if the differential of page `r` leaving `pq` is zero, and
  `B_{r+1} = B_r` if and only if the differential of page `r` entering `pq` is zero.
- `(E.page r).X pq` is zero if and only if `Z_r(pq) = B_r(pq)`.
- *Naturality.* For `f : E ⟶ E'`, `Z_r(E, pq)` lies below the pullback of `Z_r(E', pq)` along the
  first-page component of `f`, and the image of `B_r(E, pq)` lies below `B_r(E', pq)`. The map
  induced on the presentations is the page-`r` component of `f`.
- *Rebasing.* For `s ≥ r₀`, the towers of `E` built from page `s` correspond, under the
  presentation of `(E.page s).X pq` and the order isomorphism of 1.1, to the intervals
  `[B_s, Z_r]` and `[B_s, B_r]` for `r ≥ s`.
- Isomorphic spectral sequences have towers corresponding under the first-page isomorphism.

**Checks.**

- If every differential of every page vanishes, `Z_r = ⊤` and `B_r = ⊥` for all `r`.
- In `ModuleCat ℤ`, take the `E₂` cohomological spectral sequence with `E_2^{0,1} = ℤ`,
  `E_2^{2,0} = ℤ`, `d_2 = ×2` between them and every other object zero; its pages from `3` on are
  `E^{0,1} = 0` and `E^{2,0} = ℤ/2`. Then `Z_3(0,1) = 0 = B_3(0,1)`, while `Z_3(2,0) = ℤ` and
  `B_3(2,0) = 2ℤ`. A model with `B_{r+1} := B_r` would give `E_3^{2,0} = ℤ`.
- *Naturality with a nonzero boundary.* Let `E'` have the same objects as the `×2` example and
  `d_2 = ×4`, and map `E → E'` on page `2` by the identity at `(0, 1)` and `×2` at `(2, 0)`; the
  square commutes since `4 · 1 = 2 · 2`, and from page `3` on the map is the induced one,
  `ℤ/2 → ℤ/4`, `[1] ↦ [2]`, at `(2, 0)` and `0 → 0` at `(0, 1)`. On the towers at `(2, 0)`,
  `×2` sends `B_3 = 2ℤ` onto `4ℤ = B′_3` and `Z_3 = ℤ` into `Z′_3 = ℤ`, and the induced map
  `Z_3 / B_3 → Z′_3 / B′_3` is `[1] ↦ [2]`, injective and nonzero, which is the page-`3`
  component. A model of the induced map that is zero on every quotient misses `[2] ≠ 0`.

### 1.3 Stabilisation, regularity and degeneration

Define: `E` *stabilises at `pq` from page `s`* (`s ≥ r₀`) if, for every `r ≥ s`, the
differentials of page `r` leaving and entering `pq` vanish. `E` is *regular at `pq`* if the
leaving differentials vanish for all large `r`, and *coregular at `pq`* if the entering ones do.
`E` *degenerates at page `s`* if every differential of every page `r ≥ s` vanishes. Prove: `E` is
regular at `pq` if and only if `Z_r(pq)` is eventually constant, and coregular if and only if
`B_r(pq)` is eventually constant (stacks-012K line 3120–3125, Lemma 24.8 (1) and (2), tag 0BDV).
If `E` stabilises at `pq` from `s`, the composites of the homology isomorphisms give canonical
isomorphisms `(E.page s).X pq ≅ (E.page r).X pq` for `r ≥ s`. These are compatible with
composition and natural in morphisms of spectral sequences. Degeneration at `s` implies
stabilisation at every position from `s` (stacks-012K line 2634–2637). *Needs:* 1.2; Mathlib
`HomologicalComplex.isoHomologyπ`, `HomologicalComplex.isoHomologyι`.

- Stabilisation from `s` implies stabilisation from every `s′ ≥ s`.
- Regular and coregular at `pq` together imply stabilisation at `pq` from some page.
- An isomorphism of spectral sequences preserves each of the four properties.

**Checks.**

- *Zero differentials on one page do not give degeneration there.* Start at page `1` with `ℤ/2`
  at `(0, 1)` and at `(2, 0)`, zero elsewhere, `d_1 = 0` and `d_2 : E_2^{0,1} → E_2^{2,0}` the
  identity. Then `E_2 = E_1` and `E_3 = 0`: every differential of page `1` vanishes, yet `E` does
  not degenerate at page `1` (nor at `2`), and it degenerates at page `3`. A model of
  degeneration at `s` that asks only for the differentials of page `s` to vanish would accept
  page `1`.
- In the `×2` example of 1.2, `E` stabilises at `(2, 0)` from page `3` and not from page `2`. At
  `(0, 1)` it is coregular from page `2`, since no differential enters, but regular only from
  page `3`, since `d_2` leaves `(0, 1)` nonzero.
- Degeneration at `s` gives `(E.page s).X pq ≅ (E.page r).X pq` for all `r ≥ s` and all `pq`. In
  the `×2` example, degeneration at `3` gives `E_3 = E_r` for all `r ≥ 3`, and degeneration fails
  at `2`.

### 1.4 The limit page

Define the *infinite cycles* `Z_∞(pq)` as the greatest lower bound of `{Z_r(pq) | r ≥ r₀}` in
`Subobject ((E.page r₀).X pq)`, and the *infinite boundaries* `B_∞(pq)` as the least upper bound
of `{B_r(pq)}`. Say `E` *has a limit page at `pq`* when both exist, and define the *limit page*
`E_∞(pq)` as the cokernel of `Subobject.ofLE B_∞ Z_∞` (stacks-012K line 2625–2631, Definition
20.2, tag 011O; helle-rognes2024 line 71–77, Definition 2.3). *Needs:* 1.2, 1.3; Mathlib
`Subobject`, `kernelSubobject`, `imageSubobject`, `HasCountableProducts`,
`HasCountableCoproducts`.

- `B_∞ ≤ Z_∞`, since every `B_r` lies below every `Z_{r′}`.
- *Existence at a stabilising position.* If `E` stabilises at `pq` from `s`, then `Z_∞ = Z_s`,
  `B_∞ = B_s`, and `E_∞(pq) ≅ (E.page s).X pq`, compatibly with the isomorphisms of 1.3. This is
  the stabilised limit; it needs no hypothesis on `C` and does not depend on `s`.
- *Existence in general.* If `C` has countable products, `Z_∞(pq)` exists: it is the kernel
  subobject of the map from `(E.page r₀).X pq` to the product of the cokernels of the `Z_r`. If
  `C` has countable coproducts, `B_∞(pq)` exists: it is the image subobject of the map from the
  coproduct of the `B_r`.
- *Functoriality.* A morphism `f : E ⟶ E'`, where both have limit pages at `pq`, induces
  `E_∞(f, pq)`. The pullback along `f` preserves greatest lower bounds and the image preserves
  least upper bounds, so `f` maps `Z_∞` into `Z_∞'` and `B_∞` into `B_∞'`. The construction is
  functorial and agrees with the page components at stabilising positions.
- *Rebasing.* The limit page computed from the towers built at page `s` is isomorphic to
  `E_∞(pq)`, by 1.1 and 1.2.
- *Vanishing.* If `(E.page r).X pq = 0` for some `r` and the limit page exists, then
  `E_∞(pq) = 0`.

**Checks.**

- In the `×2` example of 1.2, `E_∞^{2,0} = ℤ/2` and `E_∞^{0,1} = 0`.
- The zero spectral sequence has `E_∞ = 0` at every position.
- *A position where no page is the limit.* Fix a prime `ℓ`. In `ModuleCat ℤ`, take the filtered
  complex `K^0 = ℤ →(id) K^1 = ℤ` with `F^p K^0 = ℤ` for `p ≤ 0` and `0` for `p ≥ 1`, and
  `F^p K^1 = ℤ` for `p ≤ 1` and `ℓ^{p−1} ℤ` for `p ≥ 1`. Its spectral sequence (stacks-012K Lemma
  24.2; Layer 5) has `E_1^{0,0} = H^0(gr^0 K) = ℤ` and `E_1^{p,1−p} = H^1(gr^p K) = ℤ/ℓ` for
  `p ≥ 1`. An element `z ∈ ℤ = E_1^{0,0}` survives to page `r + 1` exactly when
  `dz ∈ F^{r+1} K^1 = ℓ^r ℤ`, so `Z_r(0,0) = ℓ^{r−1} ℤ` for `r ≥ 1`, and nothing enters `(0,0)`.
  Hence `Z_∞(0,0) = 0` and `E_∞^{0,0} = 0`, while every `E_r^{0,0} ≅ ℤ` is nonzero. A definition of
  the limit page as "the page from which the object stops changing" has no value here.

### Examples

The `×2` example (towers, stabilisation, limit page) and the filtered complex of the last Check
(a limit page reached by no page) recur in Layers 2–5.

### Dependencies

Mathlib `CategoryTheory.SpectralSequence`, `Subobject` and countable limits. No other roadmap.

## Layer 2: bidegree assignments, boundedness and Euler characteristics of pages

### 2.1 Bidegree assignments

Define a *bidegree assignment* (`BidegreeAssignment`), for the page shapes `c` from page `r₀` of
spectral sequences `E : SpectralSequence C c r₀`, as a pair of functions
`fil, deg : κ → ℤ` and an integer `e` (the page offset) such that `pq ↦ (fil pq, deg pq)` is
injective and, for every `r ≥ r₀` and every relation `(c r).Rel pq pq′`, `deg pq′ = deg pq + 1`
and `fil pq′ = fil pq + r − e`. Register the standard assignments (stacks-012K line 2981–2992,
filtration, complementary and total degree; line 3010–3014, Lemma 24.2, bidegree `(r, −r + 1)`).
*Needs:* Mathlib `ComplexShape.up'`, `ComplexShape.spectralSequenceNat`,
`ComplexShape.spectralSequenceFin`.

- The cohomological carriers `CohomologicalSpectralSequence`, `CohomologicalSpectralSequenceNat`
  and `CohomologicalSpectralSequenceFin` have the assignment `(p, q) ↦ (p, p + q)` with `e = 0`.
- The homological first-quadrant shape `ComplexShape.spectralSequenceNat (−r, r − 1)` of
  `coreE₂HomologicalNat` has the assignment `(p, q) ↦ (−p, −p − q)` with `e = 0`.
- On the native positions of `coreE₂Cohomological` there are two assignments: the E₂ assignment
  `(p, q) ↦ (p, p + q)` with `e = 0`, and the classical filtered-complex assignment
  `(p, q) ↦ (−q − 1, p + q)` with `e = 1`.
- A bidegree assignment transports along isomorphisms of spectral sequences.

**Checks.**

- For the cohomological assignment, the page-`r` relation `(p, q) → (p + r, q + 1 − r)` raises
  deg by `1` and fil by `r`. For the classical assignment on native positions it raises fil
  from `−q − 1` to `−(q + 1 − r) − 1 = fil + r − 1`, so `e = 1`.
- `(p, q) ↦ (q, p + q)` is not an assignment for the cohomological shape: fil changes by
  `1 − r`, not by `r − e` for a fixed `e`. `(p, q) ↦ (p, p)` is not injective.
- On `ℕ × ℕ` with `(p, q) ↦ (p, p + q)`, the image in total degree `n` is `0 ≤ p ≤ n`.

### 2.2 Boundedness and stabilisation

With respect to a bidegree assignment, `E` is *bounded below* if for every `n` there is `β(n)`
with `(E.page r₀).X pq = 0` whenever `deg pq = n` and `fil pq ≥ β(n)`. It is *bounded above* if
there is `α(n)` with vanishing whenever `deg pq = n` and `fil pq ≤ α(n)`, and *bounded* if both
hold (stacks-012K line 3107–3116, Definition 24.7, tag 0BDU, whose boundedness, finiteness in each
total degree, is equivalent to both by Lemma 24.8 (3)). Prove that vanishing at a position
persists to all later pages. Prove: bounded below implies regular at every position; bounded
above implies coregular at every position; bounded implies stabilisation at every position. If
`β` is a bound below and `α` a bound above, a position `pq` of total degree `n` stabilises from
the first page `r ≥ r₀` with `r ≥ β(n + 1) − fil pq + e` and `r ≥ fil pq − α(n − 1) + e`
(stacks-012K line 3120–3130, Lemma 24.8 (3)–(5)). In terms of differentials, which needs no
tower:

- `dFrom_eq_zero_of_boundedBelow`: for a bidegree assignment `A` and a function `β` with
  `(E.page r₀).X pq = 0` whenever `β(deg pq) ≤ fil pq`, the differential leaving `pq`
  (`HomologicalComplex.dFrom`) vanishes on every page `r ≥ r₀` with
  `r ≥ β(deg pq + 1) − fil pq + e`;
- `dTo_eq_zero_of_boundedAbove`: for a function `α` with `(E.page r₀).X pq = 0` whenever
  `fil pq ≤ α(deg pq)`, the differential entering `pq` (`HomologicalComplex.dTo`) vanishes on every
  page `r ≥ r₀` with `r ≥ fil pq − α(deg pq − 1) + e`.

The route: a page-`r` differential leaving `pq` ends at a position of total degree `deg pq + 1`
and filtration degree `fil pq + r − e` (2.1), where the first page, and hence every later page,
vanishes; dually for the entering one. *Needs:* 2.1 and Mathlib `HomologicalComplex.dFrom`,
`HomologicalComplex.dTo` for the two differential statements; 1.2 and 1.3 for regularity and
coregularity; 1.4 for the first-quadrant bullet.

- First quadrant: for an `E₂` cohomological spectral sequence with `E_2^{p,q} = 0` unless
  `p, q ≥ 0`, the sequence is bounded, and `E_r^{p,q} = E_∞^{p,q}` for `r > max(p, q + 1)`.
- If finitely many positions of total degrees `n − 1` and `n + 1` are nonzero on page `r₀`, every
  position `pq` of total degree `n` stabilises. The differential of page `r` leaving `pq` has its
  target at `(fil pq + r − e, n + 1)` and the entering one its source at `(fil pq − r + e, n − 1)`;
  for large `r` both lie outside the finite set of nonzero positions, and vanishing persists to
  later pages. Finiteness in degree `n` alone does not suffice (second Check). If finitely many
  positions are nonzero in every total degree, `E` is bounded (stacks-012K line 3114 and 3126,
  Definition 24.7 (3) and Lemma 24.8 (3)).

**Checks.**

- At `(p, q) = (1, 0)` of a first-quadrant `E₂` sequence: the leaving differential of page `r`
  lands at `q = 1 − r < 0` for `r ≥ 2` and the entering one starts at `p = 1 − r < 0`, so
  `E_2^{1,0} = E_∞^{1,0}`, as `r > max(1, 1)` predicts.
- The filtered complex of the last Check of 1.4 is bounded above but not bounded below in total
  degree `1` (`E_1^{p,1−p} = ℤ/ℓ` for all `p ≥ 1`). It is not regular at `(0, 0)`, consistent with
  the theorem not applying. In total degree `0` its only nonzero first-page position is `(0, 0)`,
  yet `Z_r(0,0) = ℓ^{r−1} ℤ` never stabilises: finiteness in the degree of the position itself is
  not enough, and the finiteness bullet above needs degrees `n − 1` and `n + 1`, where degree `1`
  has infinitely many nonzero positions.
- The zero spectral sequence is bounded.

### 2.3 Euler characteristics of pages

Let `P` be a property of objects of `C` that contains zero and is closed under kernels and
cokernels of morphisms between its objects and under extensions: in Mathlib's terms `P` satisfies
`ObjectProperty.ContainsZero`, `ObjectProperty.IsClosedUnderKernels`,
`ObjectProperty.IsClosedUnderCokernels` and `ObjectProperty.IsClosedUnderExtensions`. This is a
weak Serre class (stacks-012K line 1158–1161, Definition 10.1 (2), tag 02MO, characterised at line
1177–1182, Lemma 10.3, tag 0754); every Mathlib `ObjectProperty.IsSerreClass` is one. Let `v` be a
function from objects of `C` to an abelian group, additive on short exact sequences whose terms
satisfy `P`. Prove (`sum_negOnePow_page_eq_sum_negOnePow_page_add_one`): for every bidegree
assignment `(fil, deg, e)`, if every position of page `r` outside a finite set `s` is zero and
every position in `s` satisfies `P`, the same holds on page `r + 1`, and
`Σ_{pq ∈ s} (−1)^{deg pq} v(E_r(pq)) = Σ_{pq ∈ s} (−1)^{deg pq} v(E_{r+1}(pq))` (stacks-012K line
3185–3195, the page step in the proof of Lemma 24.12, tag 0BDW, which Stacks states for filtered
complexes).
Register the `ComplexShape.EulerCharSigns` instance `(p, q) ↦ (−1)^{p+q}` for the cohomological
page shapes. The route: Tau Ceti's Euler–Poincaré engine is stated for a `CochainComplex A ℤ`
strictly supported in a finite interval, not for a page of shape `ComplexShape.up' (r, 1 − r)` on
`ℤ × ℤ`. Regroup the finitely many nonzero positions by total degree into the `ℤ`-indexed complex
whose degree-`n` term is the finite direct sum of the `E_r(pq)` with `deg pq = n` (in `P` by closure
under extensions), with the differentials of page `r` as components (they raise `deg` by `1` by
2.1). Its cohomology in degree `n` is the direct sum of the homologies of page `r` at those
positions, that is of the `E_{r+1}(pq)`; apply the engine to it, its homology relation holding
because kernels, images and cohomology lie in `P`. Stacks' even–odd argument (stacks-012K line
3185–3191) is an equivalent route. *Needs:* 2.1; Mathlib `ComplexShape.EulerCharSigns`,
`CategoryTheory.Limits.HasFiniteBiproducts`; Tau Ceti
`HomologicalComplex.sum_negOnePow_X_eq_sum_negOnePow_homology`.

- For `C = ModuleCat k` over a field and `v = finrank` on finite-dimensional spaces, the identity
  is Mathlib's `HomologicalComplex.eulerChar` of page `r` equal to its `homologyEulerChar`.
- For `P` everything and `v` a `TauCeti.AbelianK0.AdditiveInvariant`, the hypothesis on `P` is
  vacuous.

**Checks.**

- Finite groups with `v` the length: `E_2^{0,1} = ℤ/4`, `E_2^{2,0} = ℤ/2`, `d_2` surjective. Then
  `E_3^{0,1} = ℤ/2` and `E_3^{2,0} = 0`, and both pages have Euler characteristic
  `−2 + 1 = −1 = −1 + 0`.
- The `×2` example over `ℚ` (`E_2 ⊗ ℚ`) has `−1 + 1 = 0` on page `2` and `0` on page `3`.
- *Additivity on `P` cannot be dropped.* Over a field `k`, let `P` hold of every object of
  `ModuleCat k` (it satisfies the four closure conditions) and `v` the integer-valued
  `Module.finrank`, which is `0` on infinite-dimensional spaces. Take
  `E_2^{0,1} = E_2^{2,0} = k^(ℕ)`, all else zero, and `d_2` the left shift, which is onto with
  kernel `k·e₀`. Page `2` has sum `−0 + 0 = 0`, while page `3` has `E_3^{0,1} = k` and
  `E_3^{2,0} = 0`, with sum `−1 + 0 = −1`. The hypothesis that fails is the
  additivity of `v`: on `0 → k → k^(ℕ) → k^(ℕ) → 0` (first coordinate, then left shift) `finrank`
  gives `0 ≠ 1 + 0`. With `P` the finite-dimensional spaces `finrank` is additive, and this page
  fails instead the hypothesis that its positions in `s` satisfy `P`.

### Examples

First-quadrant `E₂` sequences give the stabilisation bound `r > max(p, q + 1)` used by
DerivedModuleAlgebra §S.1.

### Dependencies

Layer 1; Mathlib complex shapes, `ComplexShape.EulerCharSigns`, Serre classes; Tau Ceti's
Euler–Poincaré engine.

## Layer 3: filtered abutments and convergence

### 3.1 Decreasing filtrations

A decreasingly filtered object is a Mathlib `CategoryTheory.FilteredObject C ℤᵒᵖ`, and a morphism
of filtered objects is a Mathlib `CategoryTheory.FilteredObject.Hom`. Define its graded pieces
`gr^p = F^p / F^{p+1}` as cokernels, functorially, and the predicates (stacks-012K line
2349–2368, Definition 19.1, tag 0121; helle-rognes2024 line 81–84, Definition 2.5):

- *exhaustive*: `⊤` is the least upper bound of the steps in `Subobject X`;
- *separated*: `⊥` is their greatest lower bound;
- *complete*: the cone from `X` to the inverse system `(X / F^p X)_{p ∈ ℤ}` is a limit cone;
- *finite*: `F^a X = X` and `F^b X = 0` for some `a ≤ b`.

*Needs:* Mathlib `CategoryTheory.FilteredObject`, `CategoryTheory.Filtration`, `Subobject`,
`IsLimit`.

- `gr^p` is a functor from filtered objects to `C` for each `p`.
- Finite implies exhaustive, separated and complete.
- *Five-lemma induction.* A morphism of finitely filtered objects that is an isomorphism on every
  `gr^p` is an isomorphism, and so is its restriction to every step.
- Complete implies separated: a subobject below every `F^p X` maps to zero in every `X / F^p X`,
  hence to zero in their limit `X`. The characterisation of completeness through lim¹ is in 7.1.

**Checks.**

- The `ℓ`-adic filtration `F^p = ℓ^p ℤ` (`p ≥ 0`, and `ℤ` for `p ≤ 0`) of `ℤ` is exhaustive and
  separated, but not complete: the limit of `ℤ/ℓ^p` is `ℤ_ℓ ≠ ℤ`. The same filtration of `ℤ_ℓ` is
  complete.
- The constant filtration `F^p = X ≠ 0` is exhaustive and not separated. The zero filtration
  `F^p = 0` of `X ≠ 0` is separated and not exhaustive.
- The filtration `F^0 = ℤ/4`, `F^1 = 2ℤ/4`, `F^2 = 0` of `ℤ/4` is finite, with `gr^0 = gr^1 = ℤ/2`.
  `ℤ/2 ⊕ ℤ/2`, filtered by its first summand, has the same graded pieces and is not isomorphic to
  `ℤ/4`, so the graded pieces do not determine the object.

### 3.2 Convergence structures

Fix `E : SpectralSequence C c r₀`, a bidegree assignment `(fil, deg, e)`, a set `I ⊆ ℤ` of total
degrees and an abutment `H : ℤ → FilteredObject C ℤᵒᵖ`. Define
(helle-rognes2024 line 94–98, Definition 2.7, which it attributes to cartan-eilenberg1956
Ch. XV §2, uncertified; stacks-012K line 3131–3143, Definition 24.9, tag 012U, in its
filtered-complex form, whose isomorphisms are the canonical comparisons of its Lemma 24.6;
weibel1994 Definition 5.2.11, uncertified):

- *weak convergence in `I`*: `E` has a limit page at every position of total degree in `I`. For
  every `n ∈ I` and every `s ∈ ℤ` there is an isomorphism `β : E_∞(pq) ≅ gr^s H^n` when
  `(fil pq, deg pq) = (s, n)`, and `gr^s H^n = 0` when `(s, n)` is not of this form;
- *convergence in `I`*: weak convergence in `I`, with the filtration of `H^n` exhaustive and
  separated for every `n ∈ I`;
- *strong convergence in `I`*: convergence in `I`, with the filtration of `H^n` complete for every
  `n ∈ I`.

Each is a structure carrying the isomorphisms `β`; convergence in all degrees is `I = ℤ`.
*Needs:* 1.4, 2.1, 3.1.

- Strong convergence gives convergence, which gives weak convergence. Each restricts from `I` to
  any `I′ ⊆ I`, and for `I = ∅` each is trivial.
- Each transports along isomorphisms of spectral sequences, along filtered isomorphisms of
  abutments, and along the rebasing of 1.4.
- A converging structure is unchanged by modifying `H^n` for `n ∉ I`.

**Checks.**

- The cohomological spectral sequence starting at page `1` with `E_1^{0,0} = E_1^{1,0} = ℤ`,
  `d_1 = ×2` and every other object zero (the data of the filtered complex `ℤ →(×2) ℤ` of the
  Conventions): `E_2 = E_∞` has `E_∞^{0,0} = 0` and `E_∞^{1,0} = ℤ/2`. With `H^1 = ℤ/2`,
  `F^1 H^1 = H^1`, `F^2 H^1 = 0` and `H^n = 0` for `n ≠ 1`, this is strong convergence in `I = ℤ`.
- The complex `ℤ` in degree `0` with the `ℓ`-adic filtration has `E_1 = E_∞ = ℤ/ℓ` in each
  filtration degree `p ≥ 0`. It converges to `H^0 = ℤ`, but not strongly, since `ℤ` is not
  complete.
- The zero spectral sequence and the abutment `H^0 = ℤ` with constant filtration `F^p = ℤ`
  converge weakly in `{0}`, and do not converge there: weak convergence cannot detect `H^0`.

### 3.3 Morphisms of converging spectral sequences

Define a morphism between weakly converging structures in `I` as a pair `(f, h)` of a Mathlib
`SpectralSequence.Hom` `f : E ⟶ E'` and filtered morphisms `h_n : H^n ⟶ H′^n` such that
`β′ ∘ E_∞(f, pq) = gr^s(h_n) ∘ β` at every position of total degree `n ∈ I`. Prove that these
form a category with forgetful functors to spectral sequences and to families of filtered
objects (stacks-012K line 3055–3061, Lemma 24.4, tag 012O, for filtered complexes). *Needs:*
1.4, 3.1, 3.2.

- Composition and identities are those of the components.
- Restriction of `I` is a functor.

**Checks.**

- *`f` does not determine `h`.* Take the `ℓ`-adic structure of 3.2 (the complex `ℤ` in degree
  `0` with `F^p = ℓ^p ℤ`, so `E_1^{p,−p} = E_∞^{p,−p} = ℤ/ℓ` for `p ≥ 0`, all differentials zero,
  converging to `H^0 = ℤ`), and let `f` be multiplication by `2` on every page. Multiplication by
  an integer `u` is a filtered endomorphism of `ℤ`, and on `gr^p ℤ = ℓ^p ℤ / ℓ^{p+1} ℤ ≅ ℤ/ℓ` it
  induces `u mod ℓ`. So `(f, 2)` and `(f, 2 + ℓ)` are both morphisms, while `(f, 3)` is not,
  since `3 − 2 = 1` is nonzero mod every `ℓ`. The forgetful functor to spectral sequences is not
  faithful.
- For the structure with `E_1^{0,0} = E_∞^{0,0} = ℤ` (all else zero) converging to `H^0 = ℤ` with
  `F^0 = ℤ`, `F^1 = 0`: the pair (`−1` on every page, identity on `H^0`) is not a morphism, since
  `gr^0(id) = 1 ≠ −1 = E_∞(f)`. The compatibility with `β` is a real condition.
- *Weak convergence does not constrain `h`.* For the zero spectral sequence converging weakly in
  `{0}` to `H^0 = ℤ` with the constant filtration `F^p = ℤ` (3.2, third Check), every graded piece
  is `0`, so `f = 0` together with any endomorphism of `ℤ` (each preserves every `F^p = ℤ`) is a
  morphism. This is why the comparison theorem 3.5 needs separation.

### 3.4 Finite filtrations

Prove: weak convergence in degree `n` together with a finite filtration of `H^n` gives strong
convergence in degree `n`. In that case `H^n` has a finite chain of subobjects whose successive
quotients are the `E_∞` at the positions of total degree `n`. `H^n = 0` if all these `E_∞`
vanish. If they all satisfy a weak Serre class `P` as in 2.3, so does `H^n`. If the limit page
at these positions is reached on page `r` and the `E_r` satisfy `P`, so does `H^n`
(stacks-012K line 3152–3174, Lemma 24.11 (2)–(4), tag 012W, in its filtered-complex form;
weibel1994 Definition 5.2.5 and the remark after 5.2.6, uncertified). These clauses are local:
they use convergence in degree `n` only. *Needs:* 3.1, 3.2; 2.3 for the weak Serre classes; for
the Euler identity below also 1.3, 1.4 and 2.2 (degeneration and the stabilised limit page) and
2.3 (the page-step identity).

- *Euler identity.* Suppose `E` converges weakly to `H` in every total degree (`I = ℤ`), every
  `H^n` has a finite filtration, and page `r` has finitely many nonzero positions, all in `P`.
  Then only finitely many `H^n` are nonzero, and
  `Σ_n (−1)^n v(H^n) = Σ_pq (−1)^{deg pq} v(E_r(pq))` (stacks-012K line 3175–3197, Lemma 24.12,
  tag 0BDW, in its filtered-complex form, where the finite filtration of the complex gives
  convergence in every degree by Lemma 24.11). The route: vanishing persists to later pages
  (2.2), so the nonzero positions of every page `r′ ≥ r` lie among those of page `r`. If there
  are none, every page from `r` on is zero. Otherwise let `f₋` and `f₊` be the least and greatest
  filtration degree of a nonzero position of page `r`; for `r′ ≥ r` with `r′ > f₊ − f₋ + e` a
  differential of page `r′` leaving a nonzero position of filtration degree `f` ends in filtration
  degree `f + r′ − e > f₊` (2.1), at a zero object, so every differential of page `r′` vanishes.
  Hence `E` degenerates at `R = max(r, f₊ − f₋ + e + 1)` (1.3) and `E_∞ ≅ E_R` at every
  position (1.4). Iterating 2.3 from page `r` to page `R` equates the page sums. In each degree
  `n` the local clauses give `v(H^n) = Σ_{deg pq = n} v(E_∞(pq))`, and `H^n = 0` when no nonzero
  position has total degree `n`. The filtered-complex form, for a filtration finite in each degree,
  is `sum_negOnePow_homology_eq_sum_negOnePow_page` in 5.3.

**Checks.**

- `H^n = ℤ/4` with `E_∞ = ℤ/2` in two filtration degrees, and `H^n = ℤ/2 ⊕ ℤ/2` with the same
  `E_∞`: both are strongly convergent, so `H^n` is not the direct sum of the `E_∞`.
- If every `E_∞` of total degree `n` is zero and the filtration is finite, `H^n = 0`.
- With `P` the finite abelian groups and `v` the length, `E_∞ = ℤ/2, ℤ/2` gives `v(H^n) = 2` in
  both cases of the first Check.
- *The Euler identity needs convergence in every degree.* Over `ℚ`, with `P` the
  finite-dimensional spaces, `v` the dimension and the standard assignment `(p, q) ↦ (p, p + q)`,
  take the zero spectral sequence and `H^1 = ℚ` with `F^p H^1 = ℚ` for `p ≤ 0` and `0` for
  `p ≥ 1`, all other `H^n = 0`. Every filtration is finite and weak convergence holds in
  `I = {0}`, yet the page sum is `0` and the abutment sum is `−1`: convergence fails in degree `1`,
  where `gr^0 H^1 = ℚ` and `E_∞^{0,1} = 0`. With `ℚ` at `(0, 1)` on every page and zero
  differentials instead, convergence holds in every degree and both sums are `−1`.
- *The Euler identity needs finite filtrations.* The zero spectral sequence with `H^0 = ℚ`
  carrying the constant filtration `F^p = ℚ`, all other `H^n = 0`, converges weakly in every
  degree (all graded pieces vanish), yet the abutment sum is `1` and the page sum is `0`.

### 3.5 The comparison theorem

Let `(f, h)` be a morphism of weakly converging structures in degree `n`, and suppose `f` is an
isomorphism at every position of some page `s ≥ r₀`. Prove:

- `E_∞(f)` is an isomorphism at every position of total degree `n`;
- if the filtrations of `H^n` and `H′^n` are finite, `h_n` is an isomorphism;
- if `C` has exact sequential colimits (`HasColimitsOfShape ℕ C` and
  `HasExactColimitsOfShape ℕ C`) and both structures converge strongly in degree `n`, then `h_n`
  is an isomorphism.

(weibel1994 Theorem 5.2.12 and its proof, uncertified; eilenberg-moore1962 §7, uncertified.) The
route: Tau Ceti's `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le` makes `f` an
isomorphism on all later pages; rebasing (1.4) at page `s` makes the towers correspond, so
`E_∞(f)` is an isomorphism; induction with 3.1 gives isomorphisms on all `F^p / F^{p′}`; in the
complete case pass to the colimit over `p → −∞` (exact sequential colimits make the union of the
steps detect monomorphisms) and then to the limit over `p′ → ∞`. *Needs:* 1.4, 3.1–3.3; Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

- Tau Ceti's `CategoryTheory.Abelian.SpectralObject.isIso_hom_app_abutment_of_isIso_page` is the
  instance for spectral objects with finite filtrations (via Layer 4); 4.6 and 5.4 state the
  instances `isIso_hom_app_abutment_of_hasConvergenceBounds` and
  `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow`.

**Checks.**

- *Finite filtrations, computed.* Let `E` start at page `1` with `ℤ/2` at `(0, n)` and at
  `(1, n − 1)`, zero elsewhere, and all differentials zero, so `E_∞ = E_1`. It converges strongly
  in degree `n` to `ℤ/4` with `F^0 = ℤ/4`, `F^1 = 2ℤ/4ℤ`, `F^2 = 0`, and to `ℤ/2 ⊕ ℤ/2` with
  `F^0` everything, `F^1` the first summand and `F^2 = 0` (3.4, first Check). By the second
  bullet there is no morphism `(id, h)` from the first structure to the second, since `h` would
  be an isomorphism `ℤ/4 ≅ ℤ/2 ⊕ ℤ/2`. Directly: a filtered `h` sends `2 = 2 · 1` to
  `2 h(1) = 0`, so `gr^1(h)` is zero, not the isomorphism that compatibility with `β` requires.
- *Separation is needed.* `E = E′ = 0`, `H^0 = ℤ` with the constant filtration, `H′^0 = 0`,
  `h = 0`: weak convergence holds on both sides and `f` is an isomorphism, but `h` is not.
- *Completeness is needed.* Let `E = E′` have `E_1^{p,−p} = ℤ/ℓ` for `p ≥ 0`, all differentials
  zero, with abutments `ℤ` and `ℤ_ℓ` carrying their `ℓ`-adic filtrations. Then `f = id` and `h` the
  inclusion `ℤ → ℤ_ℓ` form a morphism of converging structures with `f` an isomorphism, but `h` is
  not an isomorphism: `ℤ` is not complete.

### 3.6 Consequences

For an `E₂` cohomological spectral sequence with the standard assignment, prove
(weibel1994 §5.2, the exercises on two-column and two-row spectral sequences, uncertified;
mccleary2001 Ch. 2, uncertified):

- *Vanishing.* Convergence in degree `n` and `E_r^{p,n−p} = 0` for all `p` and some `r` give
  `H^n = 0`.
- *Dimension count.* For `C = ModuleCat k` over a field, with all `E_r^{p,n−p}` finite-dimensional,
  finitely many of them nonzero, and convergence with a finite filtration in degree `n`:
  `dim H^n = Σ_p dim E_∞^{p,n−p} ≤ Σ_p dim E_r^{p,n−p}`. Equality holds if and only if every
  differential of every page `r′ ≥ r` leaving or entering a position of total degree `n`
  vanishes.
- *Two columns.* If `E_2^{p,q} = 0` for `p ∉ {0, 1}`, every `d_r` with `r ≥ 2` vanishes, and
  convergence in degree `n` gives a short exact sequence `0 → E_2^{1,n−1} → H^n → E_2^{0,n} → 0`.
- *Two rows.* If `E_2^{p,q} = 0` for `q ∉ {0, 1}` and the sequence converges in degree `n + 1`,
  then `E_2^{n−1,1} →(d_2) E_2^{n+1,0} → H^{n+1} → E_2^{n,1} →(d_2) E_2^{n+2,0}` is exact: only
  `d_2` is nonzero, `E_∞^{n+1,0}` is its cokernel and `E_∞^{n,1}` its kernel, and convergence in
  degree `n + 1` gives `F^{n+2} H^{n+1} = 0` and `F^n H^{n+1} = H^{n+1}`. The sequences for `n`
  and `n + 1` share the map `E_2^{n,1} → E_2^{n+2,0}`, so convergence in every degree of an
  interval of integers splices them into one exact sequence over that interval, and convergence
  in every degree into the long exact sequence
  `⋯ → E_2^{n+1,0} → H^{n+1} → E_2^{n,1} → E_2^{n+2,0} → H^{n+2} → ⋯`.
- *First quadrant.* If `E_2^{p,q} = 0` for `p < 0` or `q < 0` and the sequence converges in degree
  `n`, the edge morphisms `E_2^{n,0} ↠ E_∞^{n,0} ≅ F^n H^n ↪ H^n` and
  `H^n ↠ H^n / F^1 H^n ≅ E_∞^{0,n} ↪ E_2^{0,n}` exist. Convergence in degrees `1` and `2` gives the
  exact sequence `0 → E_2^{1,0} → H^1 → E_2^{0,1} → E_2^{2,0} → H^2`. For `m ≥ 1`, if moreover
  `E_2^{p,q} = 0` for all `p` and `0 < q < m`, convergence in degrees up to `m + 1` gives
  `E_2^{j,0} ≅ H^j` for `j < m` and the exact sequence
  `0 → E_2^{m,0} → H^m → E_2^{0,m} → E_2^{m+1,0} → H^{m+1}`.

*Needs:* 2.2, 3.2, 3.4.

**Checks.**

- *Two rows.* Pages with `E_2^{0,0} = E_2^{0,1} = E_2^{2,0} = E_2^{2,1} = ℤ`, zero elsewhere, and
  `d_2 : E_2^{0,1} → E_2^{2,0}` an isomorphism. The sequence gives `H^1 = H^2 = 0` and
  `H^0 = H^3 = ℤ`; these are the pages of the Serre spectral sequence of `S¹ → S³ → S²`.
- *Two columns.* `E_2^{1,n−1} = E_2^{0,n} = ℤ/2` is compatible with `H^n = ℤ/4` and with
  `H^n = ℤ/2 ⊕ ℤ/2`; the short exact sequence does not split in general.
- *Five-term bound.* If only `E_2^{0,0} = ℤ` is nonzero, then at `m = 0` both edge morphisms are
  identities, so the extended sequence would fail exactness at `H^0`. This is why `m ≥ 1` is
  required.
- *Dimension count.* The `×2` example of 1.2 tensored with `ℚ` has `d_2` an isomorphism, page
  `3` zero and abutment `0`. The total-degree-`1` sum is `1` on page `2` while `dim H^1 = 0`; the
  inequality is strict because `d_2 ≠ 0`.

### Examples

DerivedModuleAlgebra §S.1's identification of `E_∞` with the graded pieces of the column
filtration and its five-term sequence are the first-quadrant consequences above for double
complexes in an abelian category. The geometric circle method
gives a strong convergence in a range of degrees: browning-sawin2020 line 57–75, Theorem 1.1,
and line 568–587, Theorem 2.7, state a spectral sequence of `ℚ_ℓ`-vector spaces with `E_1`
supported in `0 ≤ m ≤ d`, with differential of bidegree `(r, 1 − r)`, converging to a complex
whose `i`th cohomology is a compactly supported cohomology group only for `i` above an explicit
bound. In this roadmap's terms it is strong convergence in the set `I` of those `i`, with finite
filtrations, to the abutment whose `i`th object is that cohomology group. Every differential of
an odd page vanishes, so the homology of an odd page identifies it with the next page; this does
not assert degeneration (1.3) at an odd page, since later even-page differentials may be nonzero.
For instance, `E_1 = E_2` with `ℤ` at `(0, 1)` and `(2, 0)`, `d_1 = 0` and `d_2` the identity has
every odd differential zero, yet `E_2 ≠ E_3 = 0`, so it does not degenerate at page `1`.

### Dependencies

Layers 1 and 2; Mathlib filtered objects; Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`.

## Layer 4: spectral objects indexed by `EInt`

### 4.1 The towers of the spectral sequence of a spectral object

For a spectral object `X : SpectralObject C EInt`, a position `(p, q)` and `n = p + q`, identify
page `2` at `(p, q)` with `H^n(q ≤ q + 1)` by Mathlib's first-page isomorphism
`spectralSequenceFirstPageXIso`. Prove that for
`r ≥ 2`:

- `Z_r(p, q)` is the kernel of `δ : H^n(q ≤ q + 1) → H^{n+1}(q − r + 2 ≤ q)`, equivalently the
  image of `H^n(q − r + 2 ≤ q + 1) → H^n(q ≤ q + 1)`;
- `B_r(p, q)` is the image of `δ : H^{n−1}(q + 1 ≤ q + r − 1) → H^n(q ≤ q + 1)`, equivalently the
  kernel of `H^n(q ≤ q + 1) → H^n(q ≤ q + r − 1)`;
- the presentation of 1.2 is Mathlib's `spectralSequencePageXIso`, with the four indices
  `q − r + 2 ≤ q ≤ q + 1 ≤ q + r − 1`.

The restricted recipes are stated on their own carriers. Each spectral sequence exists only under
Mathlib's class `HasSpectralSequence` for its recipe, and the towers are those of that sequence:

- *Natural positions.* For `X : SpectralObject C EInt` with
  `X.HasSpectralSequence coreE₂CohomologicalNat` (for instance when `X.IsFirstQuadrant`), at
  `(p, q) ∈ ℕ × ℕ` with `n = p + q`, the formulas above hold. Where the differential of page `r`
  leaving `(p, q)` would leave `ℕ × ℕ`, the class makes `H^{n+1}(q − r + 1 ≤ q − r + 2)` vanish,
  and where the entering one would come from outside, it makes `H^{n−1}(q + r − 1 ≤ q + r)`
  vanish; so the zero differential of the restricted page agrees with the formulas on page
  `r + 1`. The class is a real hypothesis (last Check).
- *Homological natural positions.* For `X : SpectralObject C EInt` with
  `X.HasSpectralSequence coreE₂HomologicalNat` (for instance when `X.IsThirdQuadrant`), at
  `(p, q) ∈ ℕ × ℕ` the cohomological degree is `n = −p − q` and the formulas hold with `q`
  replaced by `−q`: `Z_r(p, q)` is the kernel of
  `δ : H^n(−q ≤ −q + 1) → H^{n+1}(−q − r + 2 ≤ −q)` and `B_r(p, q)` the image of
  `δ : H^{n−1}(−q + 1 ≤ −q + r − 1) → H^n(−q ≤ −q + 1)`.
- *Finitely many rows.* For `l : ℕ` and `X : SpectralObject C (Fin (l + 1))`, for which Mathlib
  supplies `HasSpectralSequence` for `coreE₂CohomologicalFin l`, at `(p, q) : ℤ × Fin l` with
  `n = p + q` (`q` read as its value), the indices are clamped: `i₀ = max(0, q − r + 2)`,
  `i₁ = q`, `i₂ = q + 1` and `i₃ = min(l, q + r − 1)`. Then `Z_r(p, q)` is the kernel of
  `δ : H^n(q ≤ q + 1) → H^{n+1}(i₀ ≤ q)`, equivalently the image of
  `H^n(i₀ ≤ q + 1) → H^n(q ≤ q + 1)`, and `B_r(p, q)` is the image of
  `δ : H^{n−1}(q + 1 ≤ i₃) → H^n(q ≤ q + 1)`, equivalently the kernel of
  `H^n(q ≤ q + 1) → H^n(q ≤ i₃)`. Mathlib's first-page isomorphism needs the class
  `SpectralSequenceDataCore.HasFirstPageComputation`, which the pin supplies for the three
  recipes on `EInt` only. Register it for `coreE₂CohomologicalFin l`: at `r = 2`,
  `i₀ = max(0, q) = q = i₁` and `i₃ = min(l, q + 1) = q + 1 = i₂`, because `q < l`.

(helle-rognes2024 line 291–303, Definition 4.5 and Remark 4.6, and line 334–335, Remark 4.10, for
Cartan–Eilenberg systems.) *Needs:* 1.2; Mathlib `CategoryTheory.Abelian.SpectralObject.E`,
`cycles`, `opcycles`, `spectralSequencePageXIso`, `spectralSequenceFirstPageXIso`,
`coreE₂Cohomological`; for the restricted recipes `coreE₂CohomologicalNat`,
`coreE₂HomologicalNat`, `coreE₂CohomologicalFin`, `HasSpectralSequence`,
`SpectralSequenceDataCore.HasFirstPageComputation`, `IsFirstQuadrant`, `IsThirdQuadrant`.

- `Z_2 = ⊤` and `B_2 = ⊥` for each of the four recipes, because at `r = 2` the indices are
  `q ≤ q ≤ q + 1 ≤ q + 1` (with `−q` in the homological recipe) and `H(i ≤ i) = 0`.
- Naturality in morphisms of spectral objects, through Tau Ceti `spectralSequenceMap` and `EMap`.

**Checks.**

- At `r = 2` the formulas give `⊤` and `⊥`.
- For the complex `ℤ →(×2) ℤ`, at native `(1, −1)`: `Z_3` is the kernel of
  `δ : H^0(−1 ≤ 0) = ℤ → H^1(−2 ≤ −1) = ℤ`, multiplication by `2`, hence `0`.
- *Not the permanent cycles.* Replacing `H^{n+1}(q − r + 2 ≤ q)` by `H^{n+1}(⊥ ≤ q)` gives a
  subobject contained in every `Z_r`, and in general smaller than `Z_∞`; 4.3 says when they
  agree.
- *Clamped indices.* For `l = 2` and `r = 3` the finite recipe gives the indices `(0, 0, 1, 2)` at
  `q = 0` and `(0, 1, 2, 2)` at `q = 1`, all in `Fin 3`; the integer formulas would give
  `(−1, 0, 1, 2)` and `(0, 1, 2, 3)`, which leave `Fin 3`. At `q = 1`, `i₂ = i₃`, so
  `B_3 = ⊥`: nothing enters the top row. For `l = 0` there are no positions.
- *The class is needed on natural positions.* Let `K = (ℤ →(id) ℤ)` in degrees `0, 1`, with the
  increasing filtration `G_t = 0` for `t ≤ 0`, `G_1 = K^1` (the degree-`1` term) and `G_t = K`
  for `t ≥ 2`, and its spectral object (Tau Ceti `CochainComplex.spectralObject`). On the integer
  page `2`, `E_2^{1,0} = H^1(0 ≤ 1) = ℤ`, `E_2^{−1,1} = H^0(1 ≤ 2) = ℤ`, and `d_2` between them is
  the connecting morphism of `0 → K^1 → K → K^0 → 0`, an isomorphism. On `ℕ × ℕ` the source
  `(−1, 1)` is missing, so the page-`2` homology at `(1, 0)` would be `ℤ`, while the recipe's
  page-`3` object there is `E^1(−1 ≤ 0 ≤ 1 ≤ 2) = 0`. Accordingly
  `HasSpectralSequence coreE₂CohomologicalNat` fails (`H^0(1 ≤ 2) ≠ 0`), and so does
  `IsFirstQuadrant` (`H^0(1 ≤ 2)` with `0 < 1`).

### 4.2 The abutment as a decreasingly filtered object

Define, for `X : SpectralObject C EInt` and `n : ℤ`, the filtered object whose underlying object
is Tau Ceti's `abutment X n = H^n(⊥ ≤ ⊤)` and whose `p`th step is
`abutmentFiltration (n − p + 1) n`, embedded by `abutmentFiltrationι`, with transition maps
`abutmentFiltrationMap`. Identify `gr^p` with `EInfty (n − p) n` through `EInftyIsoCokernel`. With
the E₂ assignment `(p, q) ↦ (p, p + q)` of 2.1, the position `(p, n − p)` carries `gr^p H^n`
(helle-rognes2024 line 145–152, Definition 3.6, the filtration of a colimit by images, in its
exact-couple form; Tau Ceti `SpectralObject/Abutment.lean`). *Needs:* 2.1, 3.1; Tau Ceti
`abutment`, `abutmentFiltration`, `abutmentFiltrationι`, `abutmentFiltrationMap`,
`EInftyIsoCokernel`.

- The construction is functorial in `X`, through Tau Ceti `opcyclesMapOfHom`.
- The step `p` is zero when `H^n(⊥ ≤ n − p + 1) = 0` and everything when
  `H^n(n − p + 1 ≤ ⊤) = 0` (Tau Ceti `isZero_abutmentFiltration`, `isIso_abutmentFiltrationι`).

**Checks.**

- For the complex `ℤ →(×2) ℤ`: `F^3 H^1 = abutmentFiltration (−1) 1 = H^1 = ℤ/2` and
  `F^4 H^1 = abutmentFiltration (−2) 1 = 0`, so `gr^3 H^1 = ℤ/2` sits at native `(3, −2)`.
- *The reindexing is needed.* For `ℤ →(×2) ℤ` in degree `1`, `abutmentFiltration p 1` is `0` at
  `p = −2` and `ℤ/2` at `p = −1`. Used unchanged as the `p`th step it is not decreasing
  (`ℤ/2 ⊄ 0`), whereas the step `abutmentFiltration (n − p + 1) n` puts the one nonzero graded
  piece at `p = 3`, as in the first Check. For the zero spectral object both families are
  constantly `0`, so only a nonzero example tells them apart.
- For a first-quadrant `X` (`IsFirstQuadrant`), `F^0 H^n = H^n` and `F^{n+1} H^n = 0`.

### 4.3 The limit page and `EInfty`

For `X : SpectralObject C EInt` and a position `(p, q)` with `n = p + q`, let
`Zᵗ = ker(δ : H^n(q ≤ q + 1) → H^{n+1}(⊥ ≤ q))` and
`Bᵗ = im(δ : H^{n−1}(q + 1 ≤ ⊤) → H^n(q ≤ q + 1))`, so that `EInfty q n ≅ Zᵗ / Bᵗ`. Prove
(stacks-012K line 3072–3106, Lemma 24.6, and line 3144–3151, Lemma 24.10, tags 012Q and 012V, in
filtered-complex form):

- `Zᵗ ≤ Z_r` and `B_r ≤ Bᵗ` for every `r ≥ 2`. When the limit page exists, `Zᵗ ≤ Z_∞`,
  `B_∞ ≤ Bᵗ`, and `EInfty q n` is a subquotient of `E_∞(p, q)`.
- The subquotient is canonical: `Zᵗ / B_∞` is a subobject of `E_∞(p, q)` and maps onto
  `EInfty q n = Zᵗ / Bᵗ`. The inclusion is an isomorphism if and only if `Z_∞ = Zᵗ`, and the
  projection if and only if `B_∞ = Bᵗ`; when both hold, the composite isomorphism
  `E_∞(p, q) ≅ EInfty q n` is the comparison used in 4.4.
- *Cycle side.* If `H^{n+1}(⊥ ≤ i) = 0` for some integer `i ≤ q`, then `Z_r = Zᵗ` for
  `r ≥ q − i + 2`.
- *Boundary side.* If `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` is a monomorphism for some integer `j ≥ q + 1`,
  then `B_r = Bᵗ` for `r ≥ j − q + 1`. The vanishing of `H^{n−1}(j ≤ ⊤)` is a sufficient
  condition.
- *Continuity at `⊤`.* If `C` has sequential colimits (`HasColimitsOfShape ℕ C`) and the canonical
  map `colim_{j ≥ q+1} H^{n−1}(q + 1 ≤ j) → H^{n−1}(q + 1 ≤ ⊤)` is an epimorphism, then `B_∞(p, q)`
  exists and equals `Bᵗ`. The image of the colimit map is the least upper bound of the images of
  the `H^{n−1}(q + 1 ≤ j)`, so they have join `⊤`; `B_{j−q+1}` is the image under `δ` of the
  `j`th of them, by naturality of `δ` in the triple `q ≤ q + 1 ≤ j`, and the image under `δ`
  preserves least upper bounds. No exactness of the colimits is used, and an isomorphism is not
  needed: for the spectral object (Tau Ceti `CochainComplex.spectralObject`) of
  `K = (ℤ →(id) ℤ)` in degrees `n − 2`, `n − 1`, with the increasing filtration `G_j = 0` in degree
  `n − 2` for all finite `j` and `G_j = ℤ` in degree `n − 1` exactly for `j ≥ q + 2`, the map is
  `colim_j H^{n−1}(G_j / G_{q+1}) = ℤ → H^{n−1}(K) = 0`, onto but not injective.
- Under both the cycle-side and boundary-side hypotheses, `E` stabilises at `(p, q)` from page
  `max(q − i + 2, j − q + 1)`. The resulting isomorphism agrees with Tau Ceti's
  `spectralSequencePageXIsoEInfty` whenever the latter's hypotheses hold.

*Needs:* 1.3, 1.4, 4.1, 4.2; Tau Ceti `EInfty`, `spectralSequencePageXIsoEInfty`; Mathlib
spectral-object exact sequences, and `HasColimitsOfShape` for the continuity item.

**Checks.**

- *Boundary side fails.* In `ModuleCat ℤ`, the complex `K^{−1} = ℤ →(id) K^0 = ℤ` with
  `F^p K^0 = ℤ` for `p ≤ 0`, `0` for `p > 0`, and `F^p K^{−1} = 0` for all `p` (not exhaustive).
  Here `E_1^{0,0} = E_∞^{0,0} = ℤ`, but `H^0(K) = 0`. In spectral-object terms
  `H^{−1}(q + 1 ≤ ⊤) = K^{−1} = ℤ` maps onto `E_1^{0,0}`, so `Bᵗ = ℤ ≠ 0 = B_∞`, and weak
  convergence fails.
- In the filtered complex of the last Check of 1.4, `Zᵗ = 0 = Z_∞` although no `Z_r` is `0`. The
  comparison is an isomorphism without stabilisation.
- For the complex `ℤ →(×2) ℤ`, both hypotheses hold with `i = −2`, `j = 0` at native `(3, −2)`,
  and the stabilisation page `max(−2 + 2 + 2, 0 + 2 + 1) = 3` is the page where `E` stops
  changing.

### 4.4 Convergence in a range of degrees

Define: `X : SpectralObject C EInt` has *convergence bounds* `a, b` in degree `n`,
`HasConvergenceBounds X n a b`, when `H^n(⊥ ≤ i) = 0` and `H^{n+1}(⊥ ≤ i) = 0` for every integer
`i ≤ a`, and the map `H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` induced by `j ≤ ⊤` (Mathlib's
`ComposableArrows.twoδ₂Toδ₁`) is an isomorphism for every integer `j ≥ b`. No order between `a`
and `b` is imposed. These are the hypotheses of stacks-012K line 3202–3206, Lemma 24.13, tag 0BK5,
in degree `n`, in spectral-object form.

- Tau Ceti's endpoint vanishing implies it: if `H^m(⊥ ≤ i) = 0` for `m ∈ {n, n + 1}` and `i ≤ a`,
  and `H^m(j ≤ ⊤) = 0` for `m ∈ {n − 1, n}` and `j ≥ b`, then `X` has convergence bounds `a, b` in
  degree `n`, by exactness of `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) → H^n(j ≤ ⊤)`.
- Lowering `a` or raising `b` keeps convergence bounds; so two spectral objects with convergence
  bounds in degree `n` have common ones.
- Convergence bounds transport along isomorphisms of spectral objects.
- A first-quadrant `X` has convergence bounds `min(0, n + 1)` and `n + 1` in every degree `n`
  (4.5).

Let `I ⊆ ℤ` and suppose `X` has convergence bounds in every degree `n ∈ I`. Prove that
`X.spectralSequence coreE₂Cohomological` converges strongly in degrees `I` to the filtered
abutment of 4.2 with the E₂ assignment, through the isomorphisms of 4.3. The filtration of `H^n`
is finite (`F^p = H^n` for `p ≤ n + 1 − b` and `F^p = 0` for `p ≥ n + 1 − a`). Every position
`(p, q)` of total degree `n` stabilises from page `max(2, q − a + 2, b − q + 1)`: from page
`b − a + 1` at most if `a ≤ q < b`, and from page `max(2, q − a + 2)` with zero limit page if
`q ≥ b` (stacks-012K line 3202–3240, Lemma 24.13, tag 0BK5, in its filtered-complex form).
*Needs:* 3.2, 3.4, 4.2, 4.3; Tau Ceti `isZero_abutmentFiltration`, `isIso_abutmentFiltrationι`.

Against the pins this reads `convergence_of_hasConvergenceBounds`: if
`HasConvergenceBounds X n a b`, then `abutmentFiltration i n` is zero for `i ≤ a`,
`abutmentFiltrationι j n` is an isomorphism for `j ≥ b`, and at the position `(n − q, q)`, on every
page `r ≥ 2` with `r ≥ q − a + 2` and `r ≥ b − q + 1`, the canonical maps
`E^n(q − r + 2 ≤ q ≤ q + 1 ≤ q + r − 1) ← E^n(⊥ ≤ q ≤ q + 1 ≤ q + r − 1) → E^n(⊥ ≤ q ≤ q + 1 ≤ ⊤)`
(Mathlib's `mapFourδ₁Toδ₀'` and `mapFourδ₄Toδ₃'`) are isomorphisms and the differentials of page `r`
leaving and entering `(n − q, q)` vanish. The left object is the page object by Mathlib's
`spectralSequencePageXIso`, the right one is Tau Ceti's `EInfty q n`, the graded piece by
`EInftyIsoCokernel`, so this is the stabilisation and the identification of the limit page without
the tower language of Layer 1. The first map is an isomorphism by Mathlib's `isIso_mapFourδ₁Toδ₀'`;
the second by the boundary side of 4.3, the statement that has no counterpart at the pins. *Needs:*
4.3 (cycle and boundary sides); Mathlib `mapFourδ₁Toδ₀'`, `mapFourδ₄Toδ₃'`, `isIso_mapFourδ₁Toδ₀'`,
`HomologicalComplex.dFrom`, `HomologicalComplex.dTo`; Tau Ceti `isZero_abutmentFiltration`,
`coe_le_coe_add_one`.

- Positions `(p, q)` of total degree `n` with `q < a` have zero page-`2` object. For `q ≥ b` the
  page-`2` object need not vanish, since the hypothesis says nothing about degree `n + 1` at
  `⊤`; its classes are killed by leaving differentials.

**Checks.**

- For `ℤ →(×2) ℤ` with its spectral object, `a = −2` and `b = 0` in degree `1`. The filtration of
  `H^1` has `F^p = H^1` for `p ≤ 2` and `F^p = 0` for `p ≥ 4`; the only nonzero graded piece is at
  `p = 3`. Neither bound can be improved: `H^1(⊥ ≤ −1) = H^1(K^1 in degree 1) = ℤ ≠ 0`, and
  `H^1(⊥ ≤ −1) = ℤ → H^1(⊥ ≤ ⊤) = ℤ/2` is the reduction, not an isomorphism. At native `(3, −2)`
  the theorem identifies pages `r ≥ 3` with `ℤ/2`; it says nothing of page `2`, where the entering
  `d_2` is `×2 ≠ 0`.
- *An isomorphism, not a monomorphism, at the top.* For `K = ℤ` in degree `0` with the increasing
  filtration `G_j = 0` for every integer `j`, each `H^0(⊥ ≤ j) = 0 → H^0(⊥ ≤ ⊤) = ℤ` is a
  monomorphism, every page is zero, and every `abutmentFiltration j 0` is zero: the filtration of
  the abutment `ℤ` is not exhaustive. The page identifications of 4.3 survive, the convergence
  does not, and `HasConvergenceBounds` rightly fails. Here `H^{−1}(j ≤ ⊤) = H^{−1}(K / G_j) = 0`
  as well, so the top vanishing that Tau Ceti's `spectralSequencePageXIsoEInfty` assumes does not
  give convergence either.
- *Bounds are degreewise.* For the spectral object of `K = ℤ` in degree `0` with `G_j = 0` for
  every integer `j` (the second Check), `H^1(⊥ ≤ i) = H^2(⊥ ≤ i) = 0` for every integer `i`, and
  `H^1(⊥ ≤ j) = 0 → H^1(⊥ ≤ ⊤) = H^1(K) = 0` is an isomorphism, so `X` has convergence bounds
  `a = b = 0` in degree `1` and converges there to `H^1 = 0`. In degree `0` it has none, the map
  `0 → H^0(K) = ℤ` not being an isomorphism. So the theorem gives convergence in `I = {1}` and
  not in `I = {0, 1}`; a single condition on all degrees at once would lose the first statement.
- *No order between the bounds.* The zero spectral object has convergence bounds `a = 5` and
  `b = 0` in every degree. At `q = 1 ≥ b` the page bound is `max(2, −2, 0) = 2`, while
  `q − a + 2 = −2` is no page; the clause for `q ≥ b` gives `max(2, −2) = 2`. For `ℤ →(×2) ℤ`
  in degree `1` (`a = −2`, `b = 0`) at `q = 0` it gives `max(2, 4) = 4 = max(2, 4, 1)`, and the
  limit page `EInfty 0 1 ≅ gr^1 H^1 = F^1 H^1 / F^2 H^1 = (ℤ/2)/(ℤ/2)` is zero (4.2).
- The non-exhaustive complex of 4.3 violates the hypothesis at `j`: for `j ≥ 0`,
  `H^0(⊥ ≤ j) = H^0(G_j) = ℤ` while `H^0(⊥ ≤ ⊤) = H^0(K) = 0`, so the map is not a monomorphism.
  Its failure of weak convergence shows the hypothesis cannot be dropped.

### 4.5 Mathlib's quadrant spectral sequences converge

Prove: if `X` satisfies `IsFirstQuadrant`, the hypotheses of 4.4 hold in every degree `n` with
`a = min(0, n + 1)` and `b = n + 1`, and `H^n = 0` for `n < 0`. Hence
`X.spectralSequence coreE₂CohomologicalNat` (on `ℕ × ℕ`, with the assignment
`(p, q) ↦ (p, p + q)`) converges strongly in all degrees, with
`F^0 H^n = H^n`, `F^{n+1} H^n = 0` and `E_∞^{p,n−p} ≅ gr^p H^n` for `0 ≤ p ≤ n`. Its page objects
agree with those of `X.spectralSequence coreE₂Cohomological` at positions in `ℕ × ℕ`. If `X`
satisfies `IsThirdQuadrant`, the hypotheses of 4.4 hold in cohomological degree `m` with
`a = min(m, 1)` and `b = 1`. Hence `X.spectralSequence coreE₂HomologicalNat` converges strongly
with the homological assignment `(p, q) ↦ (−p, −p − q)`. The filtration in cohomological degree
`m` is `F^s H^m := abutmentFiltration (m − s + 1) m`, where `s = −p` is the filtration degree, so
that position `(p, q)` carries `EInfty (−q) m` (stacks-012K line 3202–3240, Lemma 24.13, tag
0BK5, in its filtered-complex form, applied through 4.4). *Needs:* 4.4; 3.6 for the
edge-morphism bullet; Mathlib `IsFirstQuadrant`, `IsThirdQuadrant`, `coreE₂CohomologicalNat`,
`coreE₂HomologicalNat`.

- The edge morphisms and five-term sequence of 3.6 apply to every first-quadrant spectral object.

**Checks.**

- `IsFirstQuadrant` gives `H^m(⊥ ≤ i) = 0` for `i ≤ 0`, from Mathlib
  `isZero₁_of_isFirstQuadrant`. The two outer terms of
  `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) → H^n(j ≤ ⊤)` vanish for `j ≥ n + 1`, from
  `isZero₂_of_isFirstQuadrant`.
- In total degree `0` the only position is `(0, 0)`, and `H^0 = E_2^{0,0}`.
- For the third quadrant in cohomological degree `m = −2`: `a = −2`, `b = 1`, and the positions
  are `(p, 2 − p)` for `0 ≤ p ≤ 2`.

### 4.6 Naturality and comparison for spectral objects

Prove that a morphism `φ : X ⟶ Y` of spectral objects indexed by `EInt` induces a morphism of
converging structures (3.3) between the structures of 4.4, built from Tau Ceti
`spectralSequenceMap`, `EMap` and the abutment components `(φ.hom n).app`. Deduce from 3.5 the
comparison theorem `isIso_hom_app_abutment_of_hasConvergenceBounds`: if `X` and `Y` both have
convergence bounds `a, b` in degree `n` (4.4) and the morphism of spectral sequences induced by
`φ` is an isomorphism at every position of some page `r ≥ 2`, then `φ` is an isomorphism on
`H^n(⊥ ≤ ⊤)` (weibel1994 Theorem 5.2.12, uncertified, applied through 3.5). A route that avoids
Layer 3: Tau Ceti's `CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le` makes the page maps
isomorphisms on every later page, `convergence_of_hasConvergenceBounds` and the naturality of
Mathlib's maps `mapFourδ₁Toδ₀'` and `mapFourδ₄Toδ₃'` carry this to every `EInfty q n` with
`a ≤ q < b`, and induction on `q` from `abutmentFiltration a n = 0` to
`abutmentFiltration b n ≅ H^n(⊥ ≤ ⊤)`, with the five lemma on the short exact sequences of
`EInftyIsoCokernel`, gives the statement. *Needs:* 3.3, 3.5, 4.4 for the morphism of converging
structures; 4.4 (`HasConvergenceBounds`, `convergence_of_hasConvergenceBounds`) and Tau Ceti
`CategoryTheory.SpectralSequence.Hom.isIso_hom_f_of_le`, `spectralSequenceMap`, `EMap`,
`opcyclesMapOfHom`, `EInftyIsoCokernel`, `spectralSequencePageXMap_comp_pageXIsoEInfty_hom` for
the comparison theorem.

- The comparison theorem contains Tau Ceti's
  `CategoryTheory.Abelian.SpectralObject.isIso_hom_app_abutment_of_isIso_page` and has a weaker
  hypothesis on the `⊤` side: an isomorphism condition in degree `n`, in place of vanishing in
  degrees `n − 1` and `n`.

**Checks.**

- The identity of `X` induces the identity morphism of converging structures.
- For the spectral objects of two finitely filtered complexes and a filtered quasi-isomorphism,
  the deduced statement is Tau Ceti's
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`.
- The zero morphism to the zero spectral object is a morphism of converging structures.
- *The top condition is needed.* Let `K = (ℤ →(id) ℤ)` in degrees `−1, 0`, with the
  non-exhaustive filtration of 4.3, and `K′ = ℤ` in degree `0` with the same filtration of the
  degree-`0` term; the inclusion `K′ → K` is filtered. Both first pages are `ℤ` at the classical
  position `(0, 0)` and zero elsewhere, so the induced morphism is an isomorphism on every page,
  but `H^0(K′) = ℤ → H^0(K) = 0` is not. The spectral object of `K` violates the top condition:
  `H^0(⊥ ≤ j) = ℤ → H^0(⊥ ≤ ⊤) = 0` for `j ≥ 0`.

### Examples

Tau Ceti's `HomologicalComplex₂.rowFiltrationSpectralSequence` (rows of a first-quadrant
bicomplex) and the spectral sequence of DerivedModuleAlgebra §S.1 converge strongly by 4.4 and
4.5. The convergence structure recovers
`HomologicalComplex₂.rowFiltrationSpectralSequencePageXIsoEInfty` and §S.1's identification of
`E_∞` with the graded pieces of the column filtration.

### Dependencies

Layers 1–3; Mathlib spectral objects and their recipes; Tau Ceti `SpectralObject/` files.

## Layer 5: filtered complexes

### 5.1 The classical spectral sequence of a decreasingly filtered complex

For `K : CochainComplex C ℤ` and an antitone family `F : ℤ → Subobject K` of subcomplexes, put
`G_t := F^{−t}` (monotone). The spectral sequence of `(K, F)` is Tau Ceti's
`CochainComplex.spectralSequence (CochainComplex.filtrationFunctor G _)`, with the classical
bidegree assignment `(a, b) ↦ (−b − 1, a + b)`, `e = 1`, of 2.1. Its classical term `E_r^{p,q}` is
page `r + 1` at `(2p + q + 1, −p − 1)`. Prove: `E_1^{p,q} ≅ H^{p+q}(gr^p K)` (Tau Ceti
`spectralSequenceFirstPageXIsoCokernel`); `d_1` is the connecting morphism of
`0 → gr^{p+1} K → F^p K / F^{p+2} K → gr^p K → 0` (Tau Ceti `spectralSequence_first_page_d_eq`;
stacks-012K line 3038–3054, Lemma 24.3, tag 012N); and filtered morphisms induce morphisms of
spectral sequences (Tau Ceti `filtrationFunctorMap`, `spectralObjectMap`; stacks-012K line
3055–3061, Lemma 24.4, tag 012O). For complexes of modules this is DGFloer Layer 1 item 3's
cohomological reindexing. *Needs:* 2.1; Tau Ceti `CochainComplex.filtrationFunctor`,
`CochainComplex.spectralSequence`, `CochainComplex.spectralSequenceFirstPageXIsoCokernel`,
`CochainComplex.spectralSequence_first_page_d_eq`, `CochainComplex.filtrationFunctorMap`.

- If `d(F^p K) ⊆ F^{p+1} K` for all `p`, then `E_1^{p,q} = gr^p K^{p+q}` and `d_1` is induced by
  `d` (stacks-012K Lemma 24.3 (2)).
- The construction is functorial in filtered morphisms and sends filtered homotopy equivalences
  to isomorphisms from `E_1` on.

**Checks.**

- *Witness.* For `ℤ →(×2) ℤ` with the stupid filtration, `d_1 : E_1^{0,0} → E_1^{1,0}` is `+2`,
  `E_2^{0,0} = 0` and `E_2^{1,0} = ℤ/2`.
- The trivial filtration `F^0 = K`, `F^1 = 0` gives `E_1^{0,q} = H^q(K)` and zero elsewhere, and
  degenerates at `E_1`.
- *The negation is needed.* For the stupid filtration of `ℤ →(×2) ℤ` (`F^0 = K`, `F^1 = K^1`,
  `F^2 = 0`), the family `t ↦ F^t` without negation is not monotone: `0 ≤ 1`, but `F^0 = K` is not
  contained in `F^1 = K^1`, their degree-`0` terms being `ℤ` and `0`. So it is not a filtration
  that `filtrationFunctor` accepts. A family that is both monotone and antitone in `t ∈ ℤ` is
  constant, and for a constant family the two indexings give the same functor.

### 5.2 The induced filtration and the limit page

The induced filtration `F^p H^n(K) = im(H^n(F^p K) → H^n(K))` (stacks-012K line 3062–3071,
Definition 24.5, tag 012P) is the filtered object of 4.2 transported along Tau Ceti's
`filtrationAbutmentIso`, by `toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`, with
the classical index `p` in place of the E₂ index `p + n + 1`. Prove: when the limit page exists
at `(p, n − p)`, the comparison of 4.3 presents `gr^p H^n(K)` as a subquotient of
`E_∞^{p,n−p}`: the inclusion `Zᵗ/B_∞ ↪ E_∞^{p,n−p}` and the projection
`Zᵗ/B_∞ ↠ Zᵗ/Bᵗ ≅ gr^p H^n(K)`. In the classical indexing `Zᵗ` and `Bᵗ` are the images in
`E_1^{p,n−p}` of `Ker(d) ∩ F^p K^n + F^{p+1} K^n` and `Im(d) ∩ F^p K^n + F^{p+1} K^n`. The
inclusion is an isomorphism if and only if (24.6.1) is an equality at `(p, n − p)`, and the
projection if and only if (24.6.2) is. When both are equalities at every position of total
degree in `I`, these comparisons are the `β` of a weak convergence structure in `I` (3.2); this
is stacks-012K's weak convergence (stacks-012K line 3072–3106 and 3131–3151, Lemma 24.6,
Definition 24.9 (1) and Lemma 24.10, tags 012Q, 012U and 012V). *Needs:* 3.2, 4.2, 4.3, 5.1; Tau
Ceti `CochainComplex.filtrationAbutmentIso`,
`CochainComplex.toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom`.

- The induced filtration is functorial in filtered morphisms.

**Checks.**

- For the stupid filtration of `ℤ →(×2) ℤ`: `F^1 H^1 = H^1 = ℤ/2` and `F^2 H^1 = 0`.
- The non-exhaustive complex of 4.3 has `gr^0 H^0 = 0`, a proper subquotient of
  `E_∞^{0,0} = ℤ`.
- For the trivial filtration, `F^0 H^n = H^n` and `F^1 H^n = 0`.
- *The criterion is about the comparison, not about some `β`.* In `ModuleCat ℤ` let
  `K^{−1} = ℤ`, `K^0 = ℤ^(ℕ) ⊕ ℤ`, `d(x) = (0, x)`, `F^p K^0 = K^0` for `p ≤ 0` and `0` for
  `p ≥ 1`, and `F^p K^{−1} = 0` for all `p`. Then `E_1^{0,0} = E_∞^{0,0} = ℤ^(ℕ) ⊕ ℤ`, every
  other `E_1` is `0`, `H^0(K) = ℤ^(ℕ)` with `F^0 H^0 = H^0` and `F^1 H^0 = 0`, and `H^n(K) = 0`
  for `n ≠ 0`. Since `ℤ^(ℕ) ⊕ ℤ ≅ ℤ^(ℕ)`, abstract isomorphisms give a weak, and by 3.4 a
  strong, convergence structure in `I = ℤ`. Yet the comparison at `(0, 0)` is the projection
  `ℤ^(ℕ) ⊕ ℤ ↠ ℤ^(ℕ)` with kernel `0 ⊕ ℤ`: (24.6.2) is strict there (`0 ⊊ 0 ⊕ ℤ`, so
  `B_∞ = 0 ≠ Bᵗ`). A criterion stated for the existence of some `β` would be false.

### 5.3 Convergence under cohomological boundedness

Let `I ⊆ ℤ`. Suppose that for each `n ∈ I` there are integers `p₀`, `p₁` with `H^m(F^s K) = 0` for
`s ≥ p₀` and `m ∈ {n, n + 1}`, and `H^n(F^s K) → H^n(K)` an isomorphism for `s ≤ p₁`. Prove that the
spectral sequence of 5.1 converges strongly in degrees `I` to `H^*(K)` with the induced filtration.
The filtration of `H^n` is finite (`F^{p₁} H^n = H^n`, `F^{p₀} H^n = 0`), and the positions of total
degree `n` stabilise (stacks-012K line 3202–3240, Lemma 24.13, tag 0BK5, which is the case `I = ℤ`).
The route: since `H^m(⊥ ≤ i)` of the spectral object of `G_t = F^{−t}` is `H^m(G_i)` (Tau Ceti
`CochainComplex.spectralObjectHIsoCokernel`), the hypotheses say that the spectral object
`CochainComplex.spectralObject (CochainComplex.filtrationFunctor G hG)` has convergence bounds `−p₀`
and `−p₁` in degree `n` (`HasConvergenceBounds`), and 4.4 applies. Against the pins the first step
reads `hasConvergenceBounds_spectralObject_filtrationFunctor`: for an increasing filtration `G` of
`K` and integers `n`, `a`, `b`, if `H^n(G_i)` and `H^{n+1}(G_i)` vanish for every `i ≤ a` and the
inclusion `G_j → K` induces an isomorphism on `H^n` for every `j ≥ b`, then the spectral object of
`G` has convergence bounds `a`, `b` in degree `n`. The route: `spectralObjectHIsoCokernel` for
`⊥ ≤ i` identifies `H^m(⊥ ≤ i)` with `H^m(G_i)`, the cokernel of the zero map out of `G_⊥ = 0`
being `G_i`, and its naturality
(`CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom`) identifies
`H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤)` with the map induced by `G_j → G_⊤ = K`. *Needs:* 4.4, 5.1, 5.2; Tau Ceti
`CochainComplex.isZero_spectralObject_H_bot`, `CochainComplex.spectralObjectHIsoCokernel`,
`CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom`; for the pinned
statement only 4.4 (`HasConvergenceBounds`) and these Tau Ceti declarations.

- *Degreewise finite filtrations.* If for each `n ∈ I` the filtrations of `K^{n−1}`, `K^n` and
  `K^{n+1}` are finite, the hypotheses hold. The spectral sequence is bounded in total degree `n`
  and converges strongly there (stacks-012K line 3152–3168, Lemma 24.11 (1)–(3), tag 012W). If
  all `E_r^{p,q}` satisfy a weak Serre class `P`, so does `H^n` (Lemma 24.11 (4)).
- Tau Ceti's `filtrationSpectralSequencePageXIsoGradedOfFinite` is the case of a filtration with
  `F^a = ⊥` and `F^b = ⊤` globally.
- *Euler characteristic* (`sum_negOnePow_homology_eq_sum_negOnePow_page`; stacks-012K line
  3175–3197, Lemma 24.12, tag 0BDW). Let the filtration be finite in each degree (in Tau Ceti's
  increasing indexing: for every `m` some stage vanishes in degree `m` and the inclusion of some
  stage is an isomorphism in degree `m`), let `P` be a weak Serre class and `v` additive on short
  exact sequences in `P` (2.3). If on some page `r ≥ 2` of `CochainComplex.spectralSequence` every
  position outside a finite set `s` is zero and every position in `s` satisfies `P`, then every
  `H^n(K)` satisfies `P`, `H^n(K) = 0` unless `n` is the total degree `p + q` of a position of `s`,
  and `Σ_n (−1)^n v(H^n(K)) = Σ_{(p,q) ∈ s} (−1)^{p+q} v(E_r^{p,q})`. Pages and positions are
  Tau Ceti's native ones: native page `r` is the classical `E_{r−1}`, and the classical assignment
  of 2.1 has total degree `p + q` at the native position `(p, q)`. The route: the first bullet
  gives strong convergence with finite filtrations in every degree, and the Euler identity of 3.4
  applies; or, avoiding Layer 3, `convergence_of_hasConvergenceBounds` identifies the stabilised
  pages with the graded pieces and 2.3 (`sum_negOnePow_page_eq_sum_negOnePow_page_add_one`) carries
  the page sums. *Needs:* 2.3, 3.4 and this target's
  first bullet, or 2.3 and 4.4.

**Checks.**

- The stupid filtration of `ℤ →(×2) ℤ` is finite in every degree, and strong convergence in `I = ℤ`
  is the Check of 3.2.
- *Degreewise, not uniformly, finite.* Let `K^m = ℤ` for `m ≥ 0` and `0` otherwise, with `d = 0`,
  and `F^p K^m = ℤ` exactly when `p ≤ m`. Each `K^m` is finitely filtered (the steps are `ℤ` up to
  `p = m` and `0` from `p = m + 1`), but no single `p` has `F^p K = 0`, so Tau Ceti's
  finite-filtration theorem does not apply. Here `gr^p K = ℤ` in degree `p`,
  `E_1^{m,0} = H^m(gr^m K) = ℤ` for `m ≥ 0`, every differential vanishes, and the hypotheses hold in
  degree `n` with `p₁ = n` and `p₀ = n + 2`; for `n ≥ 0` the theorem gives
  `gr^n H^n = ℤ = E_∞^{n,0}`. A zero term `K^m = 0` admits only the zero filtration, which is
  finite, so finiteness on zero terms is never a restriction.
- *The hypothesis in degree `n + 1` is needed.* The filtered complex of the last Check of 1.4 has
  `H^1(F^s K) = H^1(ℓ^{s−1}ℤ in degree 1) = ℓ^{s−1} ℤ ≠ 0` for all `s ≥ 1`. The hypothesis fails
  in degree `n + 1 = 1` for `n = 0`, and `(0, 0)` does not stabilise.
- *Euler characteristic.* For `ℚ →(×2) ℚ` in degrees `0, 1` with the stupid filtration, `P` the
  finite-dimensional spaces and `v` the dimension, native page `2` has `ℚ` at `(1, −1)` and at
  `(3, −2)`, of total degrees `0` and `1`, so the page sum is `1 − 1 = 0`, and `H^0 = H^1 = 0`. Over
  `𝔽₂` the same complex has `d = 0`, page sum `0`, and `H^0 = H^1 = 𝔽₂` with sum `1 − 1 = 0`. With
  the sign `(−1)^p` of the native filtration coordinate in place of `(−1)^{p+q}` the page sum would
  be `−1 − 1 = −2`, which matches neither.
- *The support must be finite.* The degreewise finite complex of the second Check, over `ℚ`, has
  `E_1^{m,0} = ℚ` for every `m ≥ 0`; no finite `s` contains the support, and indeed
  `Σ_n (−1)^n dim H^n` is not a finite sum.

### 5.4 Classical convergence for exhaustive filtrations bounded below

Let `C` have exact sequential colimits. Suppose that for each `n ∈ I` the filtration is
exhaustive on `K^{n−1}` and `K^n` (the steps have least upper bound `⊤`), and bounded below on
`K^n` and `K^{n+1}` (`F^s K^m = 0` for `s ≥ p₀(n)`). Prove that the spectral sequence of 5.1 is
regular at every position of total degree `n`, has a limit page there, and converges strongly in
degrees `I` to `H^*(K)` with the induced filtration (weibel1994 Theorem 5.5.1, uncertified;
stacks-012K line 3202–3210, Lemma 24.13, for the variant with hypotheses on `H^n(F^s K)`). The
route, with `G_t = F^{−t}` as in 5.1: bounded below on `K^{n+1}` gives `Z_r = Zᵗ` for large `r`
(4.3's cycle side), so the sequence is regular there and `Z_∞` exists. `B_∞` exists and equals
`Bᵗ` by 4.3's continuity at `⊤`: exact sequential colimits and exhaustiveness on `K^{n−1}` make
`colim_j (G_j / G_{q+1}) → K / G_{q+1}` an isomorphism in degree `n − 1` and a monomorphism in
degree `n`, hence an isomorphism on cycles in degree `n − 1`; cohomology commutes with exact
sequential colimits, so `colim_j H^{n−1}(G_j / G_{q+1}) → H^{n−1}(K / G_{q+1})` is an epimorphism.
Exhaustiveness on `K^n` makes the induced filtration of `H^n` exhaustive, and bounded below on
`K^n` makes it vanish from `p₀(n)` on. *Needs:* 3.2, 4.3, 5.1, 5.2; Mathlib
`HasExactColimitsOfShape`; Mathlib's `AB5` instance for `ModuleCat` and `AB5OfSize_shrink` for
the module bullet.

- For complexes in `ModuleCat.{u} R` over a ring `R : Type u`, which has exact sequential
  colimits by Mathlib's `AB5` instance and `AB5OfSize_shrink`, the theorem contains DGFloer
  Layer 1 item 3's classical convergence theorem. The exhaustiveness step of the route
  (exhaustiveness on `K^n` alone makes the induced filtration of `H^n` exhaustive) is, for
  complexes of modules, Tau Ceti's `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`.
- *Comparison* (`isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow`; weibel1994
  Theorems 5.2.12 and 5.5.1, uncertified). Let `C` have exact sequential colimits and let `α` be a
  morphism between the functors `CochainComplex.filtrationFunctor` of increasing filtrations
  `F` of `K` and `G` of `L` (5.1). Fix `n`. Suppose that the stage of index `a` of each filtration
  vanishes in degrees `n` and `n + 1` (the decreasing filtrations are bounded below there), and that
  in degrees `n − 1` and `n` the images of the degreewise components of the stages have least upper
  bound `⊤` in `Subobject (K.X m)` and `Subobject (L.X m)` (the filtrations are exhaustive there).
  If the morphism of spectral sequences induced by `α` (Tau Ceti `spectralSequenceMap` of
  `CochainComplex.spectralObjectMap α`) is an isomorphism at every position of some page `r ≥ 2`,
  then `α.app ⊤` induces an isomorphism on `H^n`. The route: both spectral sequences converge
  strongly in degree `n` by the theorem above, and the third bullet of 3.5 applies. No bound is
  asked of the filtrations in the exhaustive direction, unlike Tau Ceti's
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive`. *Needs:* 3.5 and
  this target; Mathlib `HasExactColimitsOfShape`, `imageSubobject`; Tau Ceti
  `CochainComplex.spectralObjectMap`, `spectralSequenceMap`.

**Checks.**

- For `ModuleCat.{u} R` with `R : Type u`, exhaustiveness of a filtration of `K^m` by submodules
  means every element lies in some step, and the exhaustiveness step of the route is then Tau
  Ceti's statement. The theorem asks more: on the `ℓ`-adic filtration of the complex `ℤ` in
  degree `0` the step applies (`F^0 H^0 = H^0`), while the theorem does not, the filtration not
  being bounded below on `K^0`.
- *Exhaustiveness on `K^{n−1}` is needed.* The non-exhaustive complex of 4.3 is bounded below
  and exhaustive on `K^0`, but not on `K^{−1}`, which is `K^{n−1}` for `n = 0`; weak convergence
  fails at `(0, 0)` (`E_∞^{0,0} = ℤ`, `H^0(K) = 0`).
- *Bounded below is needed.* The `ℓ`-adic filtration of the complex `ℤ` in degree `0` is
  exhaustive and not bounded below. The spectral sequence converges but not strongly (3.2).
- *Comparison.* The inclusion `ℤ → ℤ_ℓ` of complexes in degree `0` with their `ℓ`-adic
  filtrations induces the identity of `ℤ/ℓ` at every position of the first page, and is not an
  isomorphism on `H^0`: both filtrations are exhaustive and neither is bounded below, so the
  comparison does not apply. The filtered inclusion of `ℤ` in degree `0` into the non-exhaustive
  complex of 4.3 (the Check of 4.6) is an isomorphism on every page and not on `H^0`; there the
  target is not exhaustive in degree `n − 1 = −1`. For the stupid filtrations of `ℤ →(×2) ℤ` and of
  itself, the identity satisfies every hypothesis with `a = −2`.

### Examples

The skeletal filtration of a cochain complex of sheaves and the column filtration of a
first-quadrant double complex are finite in each degree (5.3). DerivedModuleAlgebra §S.1 is the
double-complex case.

### Dependencies

Layers 1–4; Tau Ceti `SpectralSequence/Filtered/` files; Mathlib exact colimits.

## Layer 6: exact couples

### 6.1 The spectral sequence of an exact couple

Construct the *page shift*: for `E : SpectralSequence C c r₀` and `k : ℤ`, the spectral sequence
with page `r` equal to `E.page (r + k)`, of shapes `r ↦ c (r + k)`, starting at `r₀ − k`. For a
bigraded exact couple of degrees `a, b, c` (StableHomotopyKTheory §7.22), construct its spectral
sequence as an object of `SpectralSequence C (fun r ↦ ComplexShape.up' (c + b − (r − 1) • a)) 1`.
Page `r` is the `E` of the `(r − 1)`-th derived couple with differential `j ∘ k`. The homology
isomorphism is the identification of the next derived couple's `E` with `H(E, jk)`. Morphisms of
exact couples induce morphisms of spectral sequences, functorially (stacks-012K line 2653–2686,
Definition 21.1, Lemma 21.2 and Definition 21.3, tags 011Q–011S; weibel1994 Definitions
5.9.1–5.9.3, uncertified; massey1952, uncertified). *Needs:* StableHomotopyKTheory §7.22, with
gap:exact-couple-morphisms for the functoriality; Mathlib
`CategoryTheory.SpectralSequence`, `ComplexShape.up'`; 2.1 for the bidegree-assignment bullet.

- For `a = (−1, 1)`, `b = (0, 0)`, `c = (1, 0)` the spectral sequence is a
  `CohomologicalSpectralSequence C 1`. For `a = (1, −1)`, `b = (0, 0)`, `c = (−1, 0)` the page
  shapes are homological of degree `(−r, r − 1)`.
- The page shift is an isomorphism of categories, with inverse the shift by `−k`.
- If `(fil, deg, e)` is a bidegree assignment (2.1) for `E`, then `(fil, deg, e − k)` is one for
  the page shift of `E` by `k`: page `r` of the shift carries the relation of page `r + k` of
  `E`, which raises `fil` by `r + k − e = r − (e − k)`.

**Checks.**

- The exact couple with `E = 0` has every `i` an isomorphism and every page zero.
- The couple `D = E = ℤ²`, `i(x, y) = (x, 0)`, `j(x, y) = (y, 0)`, `k(x, y) = (0, y)` (in each
  bidegree) is exact. Here `jk(x, y) = (y, 0)` and `(jk)² = 0`, while `i² = i ≠ 0`; page `2` is
  `ker(jk)/im(jk) = 0` at that bidegree.
- For the cohomological degrees, `d_r` has degree `(1, 0) − (r − 1)(−1, 1) = (r, 1 − r)`. A model
  using `c + b + (r − 1) • a` would give `(2 − r, r − 1)`, not a cohomological shape.
- *Sign of the shifted offset.* Shift `X.spectralSequence coreE₂Cohomological` by `k = 1`, so
  that page `r` is native page `r + 1`, starting at `1`, with relation
  `(p, q) → (p + r + 1, q − r)`. The classical assignment of 2.1 (`fil = −q − 1`, `e = 1`) gives
  `fil′ = −(q − r) − 1 = fil + r`, so the shifted offset is `0 = 1 − 1`. A model with offset
  `e + k = 2` would predict a rise of `r − 2`.

### 6.2 The towers of an exact couple

Prove, for the cohomological exact couple: `Z_{r+1}^{s,t}` is the preimage under `k` of the image
of `i^r : D^{s+r+1, t−r} → D^{s+1, t}`, and `B_{r+1}^{s,t}` is the image under `j` of the kernel of
`i^r : D^{s,t} → D^{s−r, t+r}`. The limit page exists when `⋂_r im i^r` and `⋃_r ker i^r` exist,
with `Z_∞ = k^{−1}(⋂_r im i^r)` and `B_∞ = j(⋃_r ker i^r)`. The analogous formulas hold for
general degrees `a, b, c` (stacks-012K line 2687–2703, Lemma 21.4, tag 011T, and the remark
after it; helle-rognes2024 line 136–144, Definition 3.3 and Lemma 3.4, with Remark 3.5).
*Needs:* 1.2, 1.4, 6.1.

- The differential `d_{r+1}` sends the class of `x` with `k x = i^r y` to the class of `j y`.

**Checks.**

- For `r = 0`: `Z_1 = k^{−1}(D) = E` and `B_1 = j(ker id) = 0`.
- For the couple `D = ℤ`, `i = ×ℓ`, `E = ℤ/ℓ` (the Bockstein couple of `ℤ`, with `j` the reduction
  and `k = 0`): `ker i^r = 0` and `B_r = 0`. Every `Z_r = E`, so `E_∞ = ℤ/ℓ`.
- *Wrong model.* Taking `Z_{r+1} := k^{−1}(im i^{r+1})` shifts the tower by one page. Take, in
  each bidegree, `D = ℤ/ℓ²`, `i = ×ℓ`, `E = ℤ/ℓ ⊕ ℤ/ℓ`, `j(x) = (x mod ℓ, 0)` and
  `k(a, b) = ℓb`. It is exact: `ker i = ℓℤ/ℓ² = im k`, `ker j = ℓℤ/ℓ² = im i` and
  `ker k = ℤ/ℓ ⊕ 0 = im j`. Here `d_1 = jk = 0` (`jk(a, b) = j(ℓb) = (0, 0)`), so the cycles of
  `d_1` are `E`, and indeed `Z_2 = k^{−1}(im i) = k^{−1}(ℓℤ/ℓ²) = E`. The wrong model gives
  `k^{−1}(im i²) = k^{−1}(0) = ℤ/ℓ ⊕ 0 ⊊ E`.

### 6.3 Exact couples of spectral objects and filtered complexes

For `X : SpectralObject C EInt`, define the exact couple with `E(p, q) := H^{p+q}(q ≤ q + 1)` and
`D(p, q) := H^{p+q}(⊥ ≤ q + 1)`. Here `i` is induced by `q + 1 ≤ q + 2`, `j` by
`(⊥ ≤ q + 1) → (q ≤ q + 1)`, and `k = δ : H^n(q ≤ q + 1) → H^{n+1}(⊥ ≤ q)`. The degrees are
`a = (−1, 1)`, `b = (0, 0)` and `c = (2, −1)`, and exactness comes from the spectral object's long
exact sequences. Prove that its spectral sequence is isomorphic, compatibly with differentials and
with the towers of 4.1 and 6.2, to the page shift by one of
`X.spectralSequence coreE₂Cohomological`: page `r` of the couple is native page `r + 1`. For a
decreasingly filtered complex, the exact couple `D^{s,t} = H^{s+t}(F^s K)`,
`E^{s,t} = H^{s+t}(gr^s K)` in the cohomological degrees is, through Tau Ceti's
`CochainComplex.spectralObject`, the couple of the spectral object. Its spectral sequence is the
classical one of 5.1 (weibel1994 5.9.4 and the discussion after it, uncertified; stacks-012K line
2834–2905, §23, tags 012B–012D, via differential objects). *Needs:* 4.1, 5.1, 6.1, 6.2;
StableHomotopyKTheory §7.22; Tau Ceti `CochainComplex.spectralObject`.

- The construction is functorial in morphisms of spectral objects and of filtered complexes.

**Checks.**

- The degree of `d_r` on the couple is `(2, −1) + (r − 1)(1, −1) = (r + 1, −r)`, the shape of
  native page `r + 1`.
- For `ℤ →(×2) ℤ`, the couple's `d_1 = j ∘ k` from `E(1, −1) = ℤ` to `E(3, −2) = ℤ` is `×2`.
- In total degree `1` for `ℤ →(×2) ℤ`, the tower `A^p = D(p, 1 − p) = H^1(⊥ ≤ 2 − p)` is `0` for
  `p ≥ 4`, `ℤ` at `p = 3` and `ℤ/2` for `p ≤ 2`, the transition `A^3 → A^2` being the reduction
  `ℤ → ℤ/2`. Its colimit is `H^1(K) = ℤ/2` and its limit is `0`. The images give `F^p H^1 = H^1`
  for `p ≤ 3` and `0` for `p ≥ 4`, the filtration of 4.2.
- *`k` cannot be dropped.* Replacing `k = δ` by zero keeps `i` and `j` but breaks exactness at
  `E`. At native `(1, −1)`, `E = H^0(−1 ≤ 0) = ℤ` while `j` comes from
  `D(1, −1) = H^0(⊥ ≤ 0) = H^0(K) = 0`, so `ker k = ℤ ≠ 0 = im j`.

### Examples

The skeletal filtration of a CW complex and the coniveau filtration produce exact couples of this
kind in StableHomotopyKTheory, SchemeKTheoryOperations and AlgebraicTopology. Layer 6 identifies
their spectral sequences with those of the corresponding filtered complexes or spectral objects.

### Dependencies

Layers 1, 2, 4 and 5; StableHomotopyKTheory §7.22.

## Layer 7: towers and conditional convergence

### 7.1 lim and lim¹ in an abelian category

For a tower `F : ℕᵒᵖ ⥤ C` in an abelian category with countable products, define `lim F` and
`lim¹ F` as the kernel and the cokernel of Tau Ceti's `CategoryTheory.Functor.towerDifference`.
Identify `lim F` with the categorical limit by `isLimitConeOfTowerDifference` (weibel1994 §3.5,
the definition of lim¹ for towers, uncertified; helle-rognes2024 line 71–84, where Rlim is
used). Prove:

- functoriality, through `towerDifference_naturality`;
- under `CountableAB4Star`, the six-term exact sequence
  `0 → lim F′ → lim F → lim F″ → lim¹ F′ → lim¹ F → lim¹ F″ → 0` for every levelwise short exact
  sequence of towers;
- invariance under passage to a cofinal subsequence and under pro-isomorphism (in any additive
  category with the products and with the kernel and cokernel of the product–difference maps,
  which lim and lim¹ need to be defined);
- pro-zero towers have `lim = lim¹ = 0`, from `IsProZero.isIso_towerDifference`;
- *completeness through lim¹*: for a decreasingly filtered object `X` (3.1), let `lim¹_p F^p X`
  be lim¹ of the tower `n ↦ F^n X` (`n ∈ ℕ`; the indices `p ≥ 0` are cofinal in `ℤ`, so
  completeness may be tested on them). A complete filtration is separated and has
  `lim¹_p F^p X = 0`. Under `CountableAB4Star`, a separated filtration with `lim¹_p F^p X = 0` is
  complete (helle-rognes2024 line 85–93, the step `F_jG ≅ lim_i F_jG / F_iG` in the proof of
  Lemma 2.6, for graded modules). For the first claim, the partial sums `σ_n = Σ_{k<n} π_k`,
  each followed by `F^k X → X`, give `σ : ∏_n F^n X → ∏_n X` with `(1 − s) ∘ σ` equal to minus
  the inclusion. The image of `σ` in `∏_n X / F^n X` lies in the limit, completeness lifts it to
  `c : ∏_n F^n X → X`, and `Δ ∘ c − σ`, with `Δ : X → ∏_n X` the diagonal, factors through
  `∏_n F^n X` as a section of `1 − s`. For the converse, the six-term sequence of
  `0 → F^n X → X → X / F^n X → 0`, where the constant tower has `lim = X` and `lim¹ = 0` (the
  partial sums split its `1 − s`), reads
  `0 → lim_n F^n X → X → lim_n X / F^n X → lim¹_n F^n X → 0`, and `lim_n F^n X` is the meet of
  the steps.

*Needs:* 3.1; Tau Ceti `CategoryTheory.Functor.towerDifference`,
`CategoryTheory.Functor.isLimitConeOfTowerDifference`,
`CategoryTheory.Functor.IsProZero.isIso_towerDifference`; Mathlib `HasCountableProducts`,
`CountableAB4Star`.

- On `ModuleCat R`, lim and lim¹ are Tau Ceti's `TauCeti.ModuleTower.lim` and
  `TauCeti.ModuleTower.limOne`, on which AlgebraicTopology §6.0 builds.

**Checks.**

- The constant tower with identity transitions has `lim = A` and `lim¹ = 0`.
- The tower `ℤ ← ℤ ← ⋯` with transitions `×ℓ` has `lim = 0` and `lim¹ ≅ ℤ_ℓ / ℤ ≠ 0`.
- The tower `ℤ/ℓ` with zero transitions is pro-zero, so `lim = lim¹ = 0`. It is Mittag–Leffler
  although its transitions are not surjective.
- *Completeness through lim¹.* The `ℓ`-adic filtration of `ℤ` (3.1) is separated, and its tower
  `ℓ^n ℤ` with inclusions is the tower `×ℓ` on `ℤ` (divide by `ℓ^n`), so
  `lim¹_p F^p ℤ ≅ ℤ_ℓ / ℤ ≠ 0` and the filtration is not complete. On `ℤ_ℓ` the six-term sequence
  is `0 → 0 → ℤ_ℓ → lim_n ℤ_ℓ / ℓ^n ℤ_ℓ → lim¹ → 0` with an isomorphism in the middle, so
  `lim¹ = 0` and the filtration is complete. The constant filtration `F^p = X ≠ 0` has
  `lim¹ = 0` and is not complete: separation cannot be dropped from the converse.

### 7.2 Epimorphic towers and the Mittag–Leffler condition

Let `C` be an abelian category with countable products. `C` is *replete* when it satisfies Tau
Ceti's `TauCeti.IsReplete`: for every tower whose transitions are epimorphisms, every projection
of every limit cone is an epimorphism (`TauCeti.IsReplete.epi_π_app`; bhatt-scholze2015 line
701–702, Definition 3.1.1, for topoi). A replete `C` has exact countable products, by Tau Ceti's
instance `TauCeti.IsReplete.countableAB4Star`. Prove
(`isReplete_iff_countableAB4Star_and_epi_towerDifference`): `C` is replete if and only if it
satisfies `CountableAB4Star` and every tower with epimorphic transitions has `lim¹ = 0` in the
sense of 7.1, that is, its product–difference map `CategoryTheory.Functor.towerDifference` is an
epimorphism. The implication from repleteness is, for a replete topos, bhatt-scholze2015 line
750–753, Proposition 3.1.9 (countable products are exact), and line 755–770, Proposition 3.1.10
(for abelian sheaves with epimorphic transitions `lim ≃ R lim`, so `lim¹ = 0`); the source states
no converse, which is proved here by the route below.
The route from repleteness to `lim¹ = 0`: for a tower `f_n : F_{n+1} → F_n` of epimorphisms put
`T = ∏_k F_k` and `P_n = F_n ⊕ T`, with transitions `(a, t) ↦ (f_n a + π_n t, t)`; each is
`f_n ⊕ 1` followed by a shear automorphism, so an epimorphism. The cone `∏_n F_n → P_n`,
`x ↦ (π_n x, (1 − s) x)`, is a limit cone: a compatible family `(x_n, t)` satisfies
`x_n − f_n x_{n+1} = π_n t`, that is `(1 − s) x = t`. Repleteness makes its projection
`(π_0, 1 − s)` to `P_0`, and hence `1 − s`, an epimorphism. The converse route: the kernels
`K_n` of the composites `F_n → F_0` form a tower with epimorphic transitions (snake lemma), and
the six-term sequence of 7.1 for `0 → K → F → F_0 → 0`, with `F_0` the constant tower, makes
`lim F → F_0` an epimorphism. Prove also that every category with enough projectives is replete,
with no hypothesis on limits, since repleteness speaks only of the limit cones that exist: lift
an epimorphism `P → F_0` out of a projective object recursively along the transitions; the
resulting cone factors it through the cone point of any limit cone, whose projection to `F_0` is
therefore an epimorphism.

Define: a tower `F : ℕᵒᵖ ⥤ C` in an abelian category is *Mittag–Leffler* (`IsMittagLeffler`)
when for every `n` there is `m ≥ n` such that for every `k ≥ m` the image of `F_k → F_n` (as an
`imageSubobject` of `F_n`) is the image of `F_m → F_n` (stacks-012K line 3715–3719, Definition
31.2, tag 02N0, stated there in an abelian category).

- A tower whose transitions are epimorphisms is Mittag–Leffler, with `m = n`.
- A pro-zero tower (Tau Ceti's `CategoryTheory.Functor.IsProZero`) is Mittag–Leffler: the images
  of `F_k → F_n` are zero for large `k`.
- A tower of Artinian objects is Mittag–Leffler: for fixed `n` the images of `F_k → F_n` form a
  descending chain in `Subobject F_n`.
- A quotient tower of a Mittag–Leffler tower is Mittag–Leffler, since the image of a composite
  with an epimorphism is the image of the image (stacks-012K line 3731, Lemma 31.3 (2), for
  abelian groups).
- The stable images `F′_n = im(F_m → F_n)` form a subtower with epimorphic transitions, and the
  quotient `F/F′` is pro-zero.
- On `ModuleCat R` the condition is Tau Ceti's `TauCeti.ModuleTower.IsMittagLeffler`: image
  subobjects are ranges, and Mathlib's eventual-range condition on the tower of types asks the
  same.

In a replete `C` with countable products, a Mittag–Leffler tower has `lim¹ = 0`
(`epi_towerDifference_of_isMittagLeffler`), and a short exact sequence of towers with Mittag–Leffler
first term gives a short exact sequence of limits (stacks-012K line 3725–3735, Lemma 31.3, tag 02N1,
for abelian groups). The route: the stable images form an epimorphic subtower with pro-zero
quotient, and 7.1 applies with the vanishing just proved. stacks-012K line 3720–3724 records
Neeman's theorem that in an abelian category with exact products the Mittag–Leffler condition alone
does not force `lim¹ = 0`; by the statement above such a category is not replete, so repleteness is
a hypothesis beyond `CountableAB4Star`. *Needs:* 7.1; Tau Ceti `TauCeti.IsReplete`,
`TauCeti.IsReplete.epi_π_app`, `TauCeti.IsReplete.countableAB4Star`,
`CategoryTheory.Functor.towerDifference`, `CategoryTheory.Functor.IsProZero`; Mathlib
`HasCountableProducts`, `CountableAB4Star`, `imageSubobject`, `EnoughProjectives`; for the module
bullet Tau Ceti `TauCeti.IsReplete.of_reflectsEpimorphisms`, `TauCeti.isReplete_type`, Mathlib
`ModuleCat.forget_preservesEpimorphisms` and Mathlib's `EnoughProjectives` instance for `ModuleCat`;
1.2 and Mathlib `IsArtinianObject` for the cycle-tower bullet.

- `ModuleCat.{v} R` is replete for every ring `R` and every universe `v`: the forgetful functor
  to `Type v` is faithful, preserves limits and preserves epimorphisms
  (`ModuleCat.forget_preservesEpimorphisms`), and `Type v` is replete (`TauCeti.isReplete_type`),
  so `TauCeti.IsReplete.of_reflectsEpimorphisms` applies. When `Small.{v} R` the enough-projectives
  statement gives it as well, through Mathlib's `EnoughProjectives` instance. Countable products
  of modules are then exact by `TauCeti.IsReplete.countableAB4Star`, in every universe.
- The cycle tower `r ↦ Z_r(pq)` of 1.2 at a position whose first-page object
  `(E.page r₀).X pq` is Artinian (descending chains of subobjects stabilise; every object of
  finite length is Artinian) is eventually constant, hence Mittag–Leffler. Its `lim¹` vanishes
  by 7.1, the tower being constant on a cofinal subsequence.

**Checks.**

- The tower `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n` in `ModuleCat ℤ` has `lim = ℤ_ℓ`, `lim¹ = 0`, and the projection
  `ℤ_ℓ → ℤ/ℓ^n` is surjective. As the route predicts, `1 − s` is onto `∏_n ℤ/ℓ^n`: for `y` in the
  product put `x_0 = 0` and choose `x_{n+1}` lifting `x_n − y_n`.
- The tower `×ℓ` on `ℤ` has non-epimorphic transitions, so repleteness says nothing about it. It
  is not Mittag–Leffler, and its `lim¹ ≅ ℤ_ℓ/ℤ ≠ 0`.
- In `ModuleCat ℤ`, a tower of finite groups is Mittag–Leffler. Tau Ceti's
  `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` agrees with the theorem here.
- *Mittag–Leffler without epimorphisms.* The tower `ℤ/ℓ` with zero transitions is Mittag–Leffler
  with `m = n + 1` (the images of `F_k → F_n` are `0` for `k > n`), and its `lim¹` is `0`; a model
  of the condition asking the transitions to be eventually epimorphisms rejects it. In the tower
  `×ℓ` on `ℤ` the images `ℓ^{k−n} ℤ` of `F_k → F_n` decrease strictly with `k`, so no `m` works for
  any `n`.
- *Light condensed modules.* Tau Ceti's `TauCeti.isReplete_lightCondMod` makes light condensed
  modules over a ring replete, so by the characterisation every tower of them with epimorphic
  transitions has `lim¹ = 0`, although their epimorphisms are only locally surjective.
- *A non-replete category.* Discrete modules over the profinite group `Gal(ℚ̄/ℚ)` form an abelian
  category with countable products (the smooth vectors of the product). The tower
  `μ_{ℓ^{n+1}} → μ_{ℓ^n}` of `ℓ`-th power maps has epimorphic transitions, and its limit is the
  module of smooth vectors of `ℤ_ℓ(1)`, which is `0`: an open subgroup contains some `g` whose
  cyclotomic character `χ(g)` is not `1`, and `(χ(g) − 1) x = 0` forces `x = 0` in `ℤ_ℓ`. The
  projections `0 → μ_{ℓ^n}` are not epimorphisms, so the category is not replete;
  SchemeAndStackFoundations §2.17 records the same tower for étale sheaves on `Spec ℚ`.

### 7.3 Boardman's double-tower sequence

Let `(A^s)_{s∈ℤ}` with `i : A^{s+1} → A^s` be a sequence in an abelian category with countable
products and `CountableAB4Star`. Put `Im^r A^s = im(i^r : A^{s+r} → A^s)`,
`Q^s = lim_r Im^r A^s` and `RQ^s = lim¹_r Im^r A^s`. Prove that the sequence
`0 → lim¹_s Q^s → lim¹_s A^s → lim_s RQ^s → 0` is exact, with limits as `s → +∞`
(helle-rognes2024 line 225–229, the sequence (3.1), citing boardman1999 3.4(b), uncertified).
The route: the bi-indexed system `(Im^r A^s)_{r,s}` is pro-isomorphic along the diagonal to
`(A^s)`. Its lim¹ is the first cohomology of the two-by-two double complex of products, whose
column filtration gives the short exact sequence; only the exactness of countable products is
used. *Needs:* 7.1; Tau Ceti `TauCeti.IsReplete.epi_π_app` for the epimorphic-limit bullet.

- If `C` is replete (7.2) and every `Q^{s+1} → Q^s` is an epimorphism, then every
  `lim_s Q^s → Q^s` is an epimorphism: this is `TauCeti.IsReplete.epi_π_app` for the tower
  `m ↦ Q^{s+m}`, whose limit is `lim_s Q^s` (helle-rognes2024 line 213–214, Lemma 3.15 (c)).

**Checks.**

- The constant sequence `A^s = ℤ`, `i = id`: `Im^r = ℤ`, `Q = ℤ`, `RQ = 0`, and all three terms are
  `0`.
- `A^s = ℤ`, `i = ×ℓ`: `Im^r A^s = ℓ^r ℤ`, `Q^s = 0` and `RQ^s = lim¹_r ℓ^r ℤ ≅ ℤ_ℓ / ℤ`. The
  transition `RQ^{s+1} → RQ^s` is multiplication by `ℓ`, an isomorphism of `ℤ_ℓ/ℤ` (`ℤ_ℓ = ℓℤ_ℓ + ℤ`
  and `1/ℓ ∉ ℤ_ℓ`). The sequence reads `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0`, with
  `lim¹_s A^s = ℤ_ℓ/ℤ` (7.1).
- A sequence that is zero for large `s` has all three terms zero.

### 7.4 Conditional convergence and Boardman's theorems

Let `C` be abelian with countable products and coproducts, exact sequential colimits, and
replete (7.2); countable products are then exact (`TauCeti.IsReplete.countableAB4Star`) and
every tower with epimorphic transitions has `lim¹ = 0` (7.2). For a cohomological exact couple
(6.1) and a total degree `n`, put `A_n^s = D^{s, n−s}`, with `i : A_n^{s+1} → A_n^s`, and
`Im^r A_n^s` as in 7.3. Define (helle-rognes2024 line 145–156, Definitions 3.6 and 3.7, citing
boardman1999 Definition 5.10; line 71–80, Definition 2.3 and Remark 2.4; line 169–178,
Definition 3.11, citing boardman1999 §§3 and 8, uncertified):

- `A_n^{−∞} = colim_{s→−∞} A_n^s`, filtered by `F^s = im(A_n^s → A_n^{−∞})`;
- `A_n^{+∞} = lim_{s→+∞} A_n^s` and `RA_n^{+∞} = lim¹_{s→+∞} A_n^s`, with `A_n^{+∞}` filtered by
  `F^s = ker(A_n^{+∞} → A_n^s)`;
- *conditional convergence to the colimit*: `A_n^{+∞} = 0` and `RA_n^{+∞} = 0` for every `n`;
  *conditional convergence to the limit*: `A_n^{−∞} = 0` for every `n`;
- `RE_∞(s, t) = lim¹_r Z_r(s, t)`;
- the *whole-plane obstruction*
  `W^n = colim_{s→−∞} lim¹_r (ker(A_n^s → A_n^{−∞}) ∩ Im^r A_n^s)`.

*Degrees.* `j : D^{s,t} → E^{s,t}` preserves the total degree and `k : E^{s,t} → D^{s+1,t}` raises
it by one. The limit-page objects of total degree `n` are therefore compared, through `j`, with
the colimit of the tower in the same total degree `n`, but, through `k`, with the limit of the
tower in total degree `n + 1` (helle-rognes2024 line 237–245, proof of Theorem 3.10, where the
graded pieces of the limit are identified through `γ`, which is `k` here; by line 113–114,
Definition 3.1, `γ` may have nonzero internal degree).

Prove (helle-rognes2024 line 163–168, Theorems 3.9 and 3.10, citing boardman1999 8.10 and 8.13,
uncertified, in the indexing `s ↦ −s`; and line 185–247 for Lemmas 3.13–3.15 and the proofs):

- if the couple converges conditionally to the colimit and `RE_∞ = 0`, the spectral sequence
  converges weakly in each total degree `n` to `A_n^{−∞}`, the filtration of `A_n^{−∞}` is
  exhaustive and has `lim¹_s F^s = 0` (complete in the sense of helle-rognes2024 Definition 2.5;
  complete in the sense of 3.1 if and only if `W^n = 0`), and the meet `F^{+∞} = lim_s F^s` is
  isomorphic to `W^n`;
- if the couple converges conditionally to the limit and `RE_∞ = 0` at the positions of total
  degree `n`, the spectral sequence converges strongly in total degree `n` to
  `H^n := A_{n+1}^{+∞}`, filtered by `F^s H^n = ker(A_{n+1}^{+∞} → A_{n+1}^s)`: `k` induces
  `E_∞^{s,n−s} ≅ F^s H^n / F^{s+1} H^n`. Moreover `RA_{n+1}^{+∞} ≅ W^{n+1}`. As an abutment in the
  sense of 3.2, with the assignment `(s, t) ↦ (s, s + t)` and `e = 0`, this is the family
  `n ↦ A_{n+1}^{+∞}`;
- *Half-plane criteria.* If `E_1^{s,·} = 0` in total degrees `n − 1` and `n` for all `s < s₀`,
  then `W^n = 0`, because `i : A_n^{s+1} → A_n^s` is an isomorphism for `s < s₀`, so
  `A_n^s → A_n^{−∞}` is an isomorphism for `s ≤ s₀`. With conditional convergence to the
  colimit and `RE_∞ = 0`, the convergence to `A_n^{−∞}` is strong in degree `n`. If
  `E_1^{s,·} = 0` in total degrees `n` and `n + 1` for all `s > s₁`, then
  `i : A_{n+1}^{s+1} → A_{n+1}^s` is an isomorphism for `s > s₁`, so for every `s` the tower
  `r ↦ Im^r A_{n+1}^s` is eventually constant; by 6.2 so are the cycle towers `Z_r` at the
  positions of total degree `n`, whence `RE_∞ = 0` there and `RA_{n+1}^{+∞} = W^{n+1} = 0`. With
  conditional convergence to the limit, the second theorem then gives strong convergence in total
  degree `n` to `A_{n+1}^{+∞}` with no hypothesis on `RE_∞` (helle-rognes2024 line 13–25,
  summarising boardman1999 Theorems 7.1 and 8.2, uncertified).
- A regular position has `RE_∞ = 0` (helle-rognes2024 line 78–80, Remark 2.4).

*Needs:* 1.4, 3.2, 6.1, 6.2, 7.1–7.3; Tau Ceti `TauCeti.IsReplete`,
`TauCeti.IsReplete.countableAB4Star`; Mathlib's `AB5` instance for `ModuleCat` and
`AB5OfSize_shrink` for the module bullet.

- On `ModuleCat.{u} R` with `R : Type u`, which satisfies the hypotheses on `C` (replete by 7.2,
  and Mathlib's `AB5` instance with `AB5OfSize_shrink` for sequential colimits), these are
  Helle–Rognes's statements for graded modules, and on abelian groups the algebraic content of
  StableHomotopyKTheory §7.26.

**Checks.**

- The zero exact couple has `A_n^{±∞} = RA_n^{+∞} = RE_∞ = W^n = 0` and converges to `0`.
- The couple with `D = ℤ` in every bidegree, `i = id` and `E = 0` has zero pages and
  `RE_∞ = W^n = 0`, but `A_n^{+∞} = A_n^{−∞} = ℤ`. It satisfies neither conditional-convergence
  hypothesis, so zero pages do not force a zero target.
- *Limit step couple: the abutment sits one degree up.* Let `D^{s,1−s} = ℤ` for `s ≥ 1` and `D = 0`
  in every other bidegree, with `i` the identity between nonzero terms; let `E^{0,0} = ℤ` and
  `E = 0` elsewhere, `j = 0`, and `k : E^{0,0} → D^{1,0}` the identity. The couple is exact (at
  `D^{1,0}`, `ker(i : D^{1,0} → D^{0,1} = 0) = ℤ = im k`; at `E^{0,0}`, `ker k = 0 = im j`;
  elsewhere `i` is an isomorphism between nonzero terms or a map between zero objects). Every
  `A_m^{−∞}` is `0`, so the couple converges conditionally to the limit; every differential is zero
  and every cycle tower constant, so `E_∞^{0,0} = ℤ` is the only nonzero limit-page object and
  `RE_∞ = 0`. Here `A_0^{+∞} = 0` and `A_1^{+∞} = ℤ`. With `H^0 = A_1^{+∞}`,
  `F^s H^0 = ker(ℤ → A_1^s)` is `ℤ` for `s ≤ 0` and `0` for `s ≥ 1`, so `gr^0 H^0 = ℤ = E_∞^{0,0}`,
  as the second theorem says; a model with `H^n = A_n^{+∞}` would give `gr^0 H^0 = 0 ≠ ℤ`. The
  half-plane criterion applies with `n = 0`, `s₁ = 0`, and `RA_1^{+∞} = W^1 = 0`.
- *Colimit step couple: no shift.* Let `D^{s,−s} = ℤ` for `s ≤ 0` and `D = 0` in every other
  bidegree, with `i` the identity between nonzero terms; let `E^{0,0} = ℤ` and `E = 0` elsewhere,
  `j : D^{0,0} → E^{0,0}` the identity, and `k = 0`. The couple is exact (at `D^{0,0}`,
  `ker j = 0 = im i` since `D^{1,−1} = 0`; at `E^{0,0}`, `ker k = ℤ = im j`). Every `A_m^{+∞}` and
  `RA_m^{+∞}` is `0`, so it converges conditionally to the colimit, all differentials vanish, and
  `A_0^{−∞} = ℤ` with `F^s = ℤ` for `s ≤ 0` and `0` for `s ≥ 1`: `gr^0 A_0^{−∞} = ℤ = E_∞^{0,0}`
  in the same total degree. Every `A_0^s → A_0^{−∞}` is injective, so `W^0 = 0` and the
  convergence is strong.
- If every first-page object has finite length, the cycle towers are Mittag–Leffler and
  `RE_∞ = 0` (7.2). The conditional-convergence and `W` hypotheses remain.
- *A nonzero whole-plane obstruction* (helle-rognes2024 line 943–967, Example 8.1, in the
  indexing `s ↦ −s`). In `ModuleCat k` over a field `k`, let `D^{s,t} = A_0^s = ∏_{i ≥ |s|} k`
  when `s + t = 0` and `0` otherwise, with `i : A_0^{s+1} → A_0^s` the inclusion for `s ≥ 0` and
  the projection for `s < 0`. Exactness forces `E_1^{s,−s} = coker(i) = k` for `s ≥ 0`,
  `E_1^{s,−1−s} = ker(i) = k` for `s < 0`, and `E_1 = 0` elsewhere; `d_{2m−1}` maps
  `E^{−m, m−1}` isomorphically onto `E^{m−1, 1−m}` for `m ≥ 1` (6.2: `Z_r(−m, m−1)` is everything
  for `r ≤ 2m − 1` and `0` from `2m` on), so `E_∞ = 0` and every cycle tower is eventually
  constant, `RE_∞ = 0`. In total degree `0`, `A_0^{+∞} = ⋂_s ∏_{i ≥ s} k = 0` and
  `RA_0^{+∞} = 0` (`A_0^0 → lim_s A_0^0 / A_0^s = ∏ k` is the identity), so the couple converges
  conditionally to the colimit. `A_0^{−∞} = ∏ k / ⨁ k`, and every `A_0^s → A_0^{−∞}` is onto, so
  `F^s = A_0^{−∞}` for all `s`:
  `gr^s = 0 = E_∞`, the filtration is exhaustive with `lim¹_s F^s = 0`, and its meet is
  `∏ k / ⨁ k`. Directly, for `s = −m` and `r ≥ 2m`, `ker(A_0^{−m} → A_0^{−∞}) ∩ Im^r A_0^{−m}`
  is `⨁_{i ≥ r−m} k`, whose `lim¹_r` is `∏_{i ≥ m} k / ⨁_{i ≥ m} k`, so `W^0 ≅ ∏ k / ⨁ k ≠ 0`,
  as the first theorem says. The spectral sequence converges weakly to `A_0^{−∞}` but does not
  converge (the filtration is not separated), so it is not strongly convergent. A model with
  `W := 0` contradicts `F^{+∞} ≅ W^0`. Neither half-plane criterion applies in total degree `0`:
  `E_1` is nonzero in total degree `−1` for every `s < 0` and in total degree `0` for every
  `s ≥ 0`.

### 7.5 Complete convergence for filtered complexes

Let `C` be as in 7.4. For a decreasingly filtered complex `K`, suppose the filtration is
exhaustive in every degree and complete in every degree, in the sense of 3.1 applied to
`K^m / F^p K^m` (`K^m ≅ lim_p K^m / F^p K^m`), and suppose the spectral sequence of 5.1 is regular.
Prove that it converges weakly to `H^*(K)` with the induced filtration, which is exhaustive with
`lim¹_p F^p H^n = 0`, and that the separation defect `⋂_p F^p H^n` is `W^n`; so the induced
filtration is separated, and then complete in the sense of 3.1, if and only if `W^n = 0`. If
moreover, for each `n`, `E_1^{p,n−p} = 0` for `p` below some bound in total degrees `n − 1` and
`n`, then `W^n = 0` (7.4, half-plane criteria) and the convergence is strong (weibel1994 Theorem
5.5.10, uncertified; eilenberg-moore1962 §7, uncertified). The route: completeness gives
`lim_s F^s K^m = lim¹_s F^s K^m = 0` (7.1, completeness through lim¹). `1 − s` is then an
isomorphism on `∏_s F^s K`, so `lim_s H^n(F^s K) = lim¹_s H^n(F^s K) = 0`, which is
conditional convergence to the colimit for the couple of 6.3. Exhaustiveness and exact
sequential colimits give `A_n^{−∞} = H^n(K)`, and 7.4's first theorem applies, in the same
total degree `n`. *Needs:* 5.1, 5.2, 6.3, 7.1, 7.2, 7.4.

- For `ModuleCat.{u} R` with `R : Type u` this contains DGFloer Layer 1 item 3's complete
  convergence theorem for module complexes.

**Checks.**

- The `ℓ`-adic filtration of the complex `ℤ_ℓ` in degree `0` is complete and exhaustive, with
  `E_1 = E_∞ = ℤ/ℓ` in filtration degrees `p ≥ 0`. The convergence to `H^0 = ℤ_ℓ` is strong.
- The `ℓ`-adic filtration of `ℤ` is exhaustive and not complete, and strong convergence fails
  (3.2). The completeness hypothesis cannot be dropped.
- *Filtrations concentrated in the first quadrant.* Let `F^0 K = K` and `F^{m+1} K^m = 0` for
  every `m` (which forces `K^m = 0` for `m < 0`). Then `gr^p K^m ≠ 0` only for `0 ≤ p ≤ m`, so
  `E_1^{p,q} = 0` unless `p, q ≥ 0`. The filtration is finite in each degree, hence exhaustive and
  complete; the spectral sequence is bounded (`β(n) = n + 1`, `α(n) = −1`), hence regular (2.2);
  and `E_1^{p,n−p} = 0` for `p < 0`. The theorem gives strong convergence, as does 5.3 with
  `p₁ = 0` and `p₀ = n + 2`. For `K^m = ℤ` (`m ≥ 0`), `d = 0`, `F^p K^m = ℤ` exactly when
  `p ≤ m` (the second Check of 5.3), both give `gr^n H^n = ℤ = E_∞^{n,0}` for `n ≥ 0`. Vanishing
  of `E_1` outside the first quadrant alone is not enough: the constant filtration `F^p K^0 = ℤ`
  of `ℤ` in degree `0` has `E_1 = 0` and `H^0 = ℤ`; it is exhaustive and not complete, and 5.3's
  hypothesis fails.

### Examples

Towers of finite groups (Mittag–Leffler, hence `RE_∞ = 0`), the Bockstein couple of `ℤ`, and the
`ℓ`-adic filtrations of `ℤ` and `ℤ_ℓ` recur in the Checks.

### Dependencies

Layers 1, 3, 5 and 6; Tau Ceti `TowerDifference.lean`, `Replete.lean` and module towers; Mathlib
Grothendieck axioms and `EnoughProjectives`.

## Downstream consumers

- **SchemeKTheoryOperations**: the coniveau exact couple and its finite convergence (Layers 3, 6).
- **ArithmeticGaloisDuality**, **LefschetzPencilsAndVanishingCycles**,
  **ClassicalAdicEtaleCohomology**, **WeightsInEtaleCohomology**, **CrystallineCohomology**,
  **DerivedDeRhamCohomology**, **PadicDifferentialEquationsAndRigidCohomology**,
  **ArithmeticLocallySymmetricSpaces**, **EtaleDualityAndPerverseSheaves**: first-quadrant and
  finite-filtration convergence, `E₂ = E_∞` and dimension counts (Layers 3–5).
- **DGFloerPartII**, **AlgebraicTopologyPartII**, **StableHomotopyKTheoryPartII**,
  **ChromaticHomotopyTheory**, **EtaleHomotopyTypes**: convergence in a range of degrees,
  comparison and conditional convergence (Layers 3, 4, 7).

## References

- stacks-012K: The Stacks Project Authors, *The Stacks Project*, chapter Homological Algebra,
  §§10, 19–24 and 31 (tags 02MO, 0754, 011N, 011O, 011Q–011T, 0121, 012B–012D, 012L–012W,
  0BDU–0BDW, 0BK5, 02N0, 02N1).
- helle-rognes2024: G. O. Helle, J. Rognes, *Boardman's whole-plane obstruction group for
  Cartan–Eilenberg systems*, Documenta Math. 24 (2019), 1855–1878; Lemmas 2.2, 2.6, 3.4,
  3.13–3.15, Definitions 2.3, 2.5, 2.7, 3.1, 3.3, 3.6, 3.7, 3.11, 4.5, Remarks 2.4, 3.5, 4.6, 4.10,
  the sequence (3.1), Theorems 3.9, 3.10, Example 8.1. Line locators refer to the authors' draft
  dated 2 February 2018, whose numbering of these items agrees with the published version.
- bhatt-scholze2015: B. Bhatt, P. Scholze, *The pro-étale topology for schemes*, Astérisque 369
  (2015); arXiv 1309.1198v2, Definition 3.1.1 and Propositions 3.1.9 and 3.1.10.
- browning-sawin2020: T. Browning, W. Sawin, *A geometric version of the circle method*, Ann. of
  Math. 191 (2020); arXiv 1711.10451v3, Theorems 1.1 and 2.7.
- weibel1994: C. A. Weibel, *An Introduction to Homological Algebra*, §§3.5, 5.2, 5.5, 5.9
  (uncertified).
- boardman1999: J. M. Boardman, *Conditionally convergent spectral sequences*, Contemp. Math. 239,
  3.4(b), Definition 5.10, Theorems 7.1, 8.2, 8.10, 8.13 (uncertified).
- eilenberg-moore1962: S. Eilenberg, J. C. Moore, *Limits and spectral sequences*, Topology 1,
  §7 (uncertified).
- mccleary2001: J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., Ch. 2
  (uncertified).
- massey1952: W. S. Massey, *Exact couples in algebraic topology* (uncertified).
- cartan-eilenberg1956: H. Cartan, S. Eilenberg, *Homological Algebra*, Ch. XV §2 (uncertified).
