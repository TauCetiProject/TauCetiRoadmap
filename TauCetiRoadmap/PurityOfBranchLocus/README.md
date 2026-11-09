# Roadmap: purity of the branch locus

**Summary.** This roadmap proves Zariski–Nagata purity of the branch locus (Stacks, Lemma 58.21.4
(0BMB); SGA 1, Exposé X, Théorème 3.1): a morphism of locally Noetherian schemes that is
quasi-finite at a point `x` with normal source stalk and regular target stalk of the same dimension
`≥ 1`, and unramified at every codimension-one point specializing to `x`, is étale at `x`. It proves
this in a stalkwise form, in the form of the Stacks tag and in an affine form, and derives two
global consequences: a finite dominant, generically étale morphism from a normal integral scheme to
a regular integral scheme is étale as soon as it is unramified in codimension one; and, for a
dominant locally quasi-finite morphism, locally of finite type, from a normal integral scheme to a
regular integral scheme whose ramification locus is not all of the source, the ramification locus
and the branch locus are empty or of pure codimension one. The local input is purity for regular local
rings, from [LocalPurity](../LocalPurity/README.md) §2.1. Everything else the proofs use is at the
pins: Mathlib has schemes, étale, unramified and quasi-finite morphisms with their stalkwise and
affine pointwise forms, regular local rings, going down and the dimension formula; Tau Ceti has
the equivalence of the stalkwise and Stacks forms of "unramified at `x`" and "étale at `x`", the
ramification, non-étale and branch loci of a morphism of schemes with their closedness and affine
comparisons, the permanence of normality, regularity and dimension along étale maps, elementary
étale localization of a quasi-finite morphism, the equality of local dimensions for a dominant
locally quasi-finite morphism onto a normal scheme, the equality of the ramification and non-étale
loci over a normal base, normal and regular schemes, the homological theory of regular local
rings, and 0BMB for finite algebras over regular local rings of dimension one or two.

| Layer | Title | What it delivers |
|---|---|---|
| [2](#layer-2-purity-of-the-branch-locus) | Purity of the branch locus | 0BMB in stalkwise, Stacks and affine forms, the global corollary, purity of the ramification and branch loci in codimension-one form |

```text
Mathlib + Tau Ceti ─────→ Layer 2
LocalPurity §2.1 (0BMA) → Layer 2 §2.1
```

The end theorems are `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB, §2.1),
`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2) and
`Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (§2.3).

## Scope and ownership

**This roadmap owns** purity of the branch locus (Stacks, Lemma 58.21.4 (0BMB)) in its stalkwise,
Stacks and affine forms (§2.1); its global corollary for finite generically étale morphisms
(§2.2); and the codimension-one purity of the ramification and branch loci of a dominant locally
quasi-finite morphism from a normal integral scheme to a regular integral scheme (SGA 1, Exposé X,
Théorème 3.1; §2.3).

**Owned elsewhere and consumed here.**

- *Purity for regular local rings* (Stacks, Lemma 58.21.3 (0BMA) (2), with the torsion-free
  correction of LocalPurity Convention 5): [LocalPurity](../LocalPurity/README.md) §2.1,
  `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.
- *The pointwise vocabulary and the loci*: Tau Ceti's stalkwise characterizations of unramified,
  étale and quasi-finite points (Stacks 02G4, 02GU, 01TD) and its `Scheme.Hom.ramificationLocus`,
  `Scheme.Hom.nonEtaleLocus` and `Scheme.Hom.branchLocus` with their API, including
  `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` over a normal base (SGA 1, Exposé I, 9.5 (ii)).
- *Étale localization and étale invariance*: Tau Ceti's elementary étale localization of a
  quasi-finite point (Stacks 02LK, with its persistence clause), descent of étaleness along flat
  morphisms (Stacks 036W for `f` locally of finite presentation), normality along étale
  homomorphisms of local rings (Stacks 025P, without Noetherian hypotheses), and the invariance of
  the dimension and the regularity of local rings under étale morphisms (Stacks 039S, 025N).
- *Dimensions of local rings*: Tau Ceti's `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`
  and `Scheme.Hom.ringKrullDim_stalk_eq_of_quasiFiniteAt` (equality of local dimensions for a
  dominant morphism of integral schemes, locally of finite type, quasi-finite at the point, with
  normal target).
- *Normal and regular schemes, regular local rings*: Tau Ceti's
  `TauCeti.AlgebraicGeometry.IsNormalScheme`, `TauCeti.AlgebraicGeometry.IsRegular`, the instance
  `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (Stacks 0569), Serre's characterization of
  regular local rings by finite global dimension (Stacks 00OC), both sentences of Stacks 0AFS (the
  second as the instance making a regular local ring Mathlib's `IsRegularRing`), the instance
  making a regular ring integrally closed, and the dimension-one and dimension-two cases of 0BMB.
- *Descent of étaleness along fpqc covers* (Descent, Lemma 35.23.31 (02VN)), *going down* (Algebra,
  Proposition 10.38.7 (00H8)) and *the dimension formula* (Lemma 10.112.7 (00ON)): Mathlib.

The exact declarations, files and hypotheses are in the supplier contracts. Sections of this
roadmap whose targets are at the Tau Ceti pin are cited by their former numbers elsewhere; they
resolve as follows (paths under `TauCeti/`).

| Former section | Content | Owner at the pins |
|---|---|---|
| §0.1 | stalk forms of "unramified at `x`" and "étale at `x`", affine comparisons, quasi-finiteness from an affine chart | Tau Ceti `AlgebraicGeometry.Scheme.Hom.unramifiedAt_iff_stalkMap`, `Scheme.Hom.etaleAt_iff_stalkMap`, `Scheme.Hom.etaleAt_spec_iff`, `Scheme.Hom.unramifiedAt_spec_iff`, `Scheme.Hom.quasiFiniteAt_of_appLE`, `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` (`AlgebraicGeometry/Morphisms/StalkMap.lean`) |
| §0.2 | normality under étale homomorphisms of local rings (025P) | Tau Ceti `TauCeti.Algebra.isNormalDomain_iff_of_etale` (`RingTheory/Etale/Normal.lean`) |
| §0.3 | global dimension, Auslander–Buchsbaum, Serre's characterization of regular local rings, 0AFS | Tau Ceti, by target in the next table |
| §0.4 | the ramification, non-étale and branch loci and their API | Tau Ceti `AlgebraicGeometry/Morphisms/RamificationLocus.lean` |
| §1.1 | elementary étale neighbourhoods (02LK), étaleness étale local on the source (036W, used here for `f` locally of finite presentation) | Tau Ceti `Scheme.Hom.exists_elementaryEtale_finite_of_isolated` (`AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean`), `Scheme.Hom.exists_finite_open_baseChange` (`…/ElementaryEtale/BaseChange.lean`), `AlgebraicGeometry.Etale.of_comp_surjective` (`AlgebraicGeometry/Morphisms/StalkMap.lean`) |

The targets formerly stated in §0.3 and §2.3 resolve to these declarations (paths under
`TauCeti/`).

| Former target | Tau Ceti declaration |
|---|---|
| *globalDimension* (00O6) | `TauCeti.globalDimension` (`RingTheory/GlobalDimension.lean`) |
| *globalDimension_le_iff* (065T) | `TauCeti.globalDimension_le_tfae` (`RingTheory/GlobalDimension.lean`) |
| *globalDimension_le_iff_hasProjectiveDimensionLE* | `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE` (`RingTheory/GlobalDimension.lean`) |
| *globalDimension_localization_le* (00O8) | `Submonoid.globalDimension_localization_le` (`RingTheory/GlobalDimension.lean`) |
| *projectiveDimension_localization_le* (00O8) | Mathlib's `ModuleCat.projectiveDimension_le_projectiveDimension_of_isLocalizedModule` |
| *Module.free_of_quotSMulTop_free* (00NS) | Mathlib's `Module.free_quotSMulTop_iff_free`, for `M` finitely presented and `x` an `M`-regular element of the Jacobson radical |
| *exists_resolution_maximalCohenMacaulay* (00NG) | `TauCeti.exists_resolution_maximalCohenMacaulay` (`RingTheory/CohenMacaulay/Resolution.lean`) |
| *auslander_buchsbaum* (090V) | `ModuleCat.projectiveDimension_add_depth_eq_depth` (`RingTheory/Depth/AuslanderBuchsbaum.lean`) |
| *IsRegularLocalRing.free_of_isCohenMacaulay* (00NT) | `TauCeti.IsRegularLocalRing.free_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/Free.lean`) |
| *IsRegularLocalRing.globalDimension_le* (00O7) | `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *projectiveDimension_residueField_ge* (00OA) | `TauCeti.finrank_cotangentSpace_le_projectiveDimension_quotient_maximalIdeal` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *projectiveDimension_residueField_le* (00OB) | `IsLocalRing.projectiveDimension_quotient_maximalIdeal_le_ringKrullDim` (`RingTheory/Depth/AuslanderBuchsbaum.lean`) |
| *isRegularLocalRing_tfae* (00OC) | `TauCeti.isRegularLocalRing_tfae` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *isRegularLocalRing_of_projectiveDimension_residueField* (00OC) | `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE`, with the residue field as `Shrink (R ⧸ maximalIdeal R)` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *isRegularLocalRing_iff_finite_globalDimension* (0AFS, first sentence) | `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *IsRegularLocalRing.isRegularLocalRing_localization* (0AFS, second sentence) | the instance `TauCeti.isRegularRing_of_isRegularLocalRing` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) with Mathlib's `IsRegularRing.isRegularLocalRing_localization` |
| *isRegularRing_of_isRegularLocalRing* | the instance `TauCeti.isRegularRing_of_isRegularLocalRing` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| *ringKrullDim_stalk_eq_of_locallyQuasiFinite* (§2.3) | `AlgebraicGeometry.Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean`) |
| *ramificationLocus_eq_nonEtaleLocus* (§2.3) | `AlgebraicGeometry.Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` (`AlgebraicGeometry/Morphisms/RamificationLocus.lean`) |

Extension of finite étale covers, ramification in codimension one and Abhyankar's lemma are
[AbhyankarLemma](../AbhyankarLemma/README.md). Purity of the ramification locus without
quasi-finiteness, for morphisms étale in codimension one (Stacks, Lemma 58.28.3 (0EA4), attributed
there to Gabber), is not a target here; nor is Stacks 036W for `f` not locally of finite
presentation, which no statement here uses.

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses are written on the statement that uses them.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result with different notions, an accompanying statement in the form of the tag is derived from
   it; both carry `@[stacks XXXX]`. Targets with no Stacks counterpart are marked *API*.
3. **Pointwise notions.** For `f : X ⟶ Y` and `x : X`: *quasi-finite at `x`* is Mathlib's
   `f.QuasiFiniteAt x`; *unramified at `x`* is `(f.stalkMap x).hom.FormallyUnramified`; *étale at
   `x`* is `∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)`. Stacks' forms (Definitions 29.21.1 (01TD),
   29.36.1 (02G4), 29.37.1 (02GI)) are the open-neighbourhood forms: unramified at `x` is
   `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)`, and
   quasi-finite at `x` adds `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f)` to
   `f.QuasiFiniteAt x`. Tau Ceti proves the forms equivalent (supplier contracts).
4. **Normal and regular.** A local ring is *normal* when it is a domain and integrally closed
   (`IsDomain` and `IsIntegrallyClosed`). A scheme is normal when every local ring is
   (`TauCeti.AlgebraicGeometry.IsNormalScheme`), and regular when it is locally Noetherian with
   regular local rings (`TauCeti.AlgebraicGeometry.IsRegular`). In Lean these two classes are
   written fully qualified, or under `open TauCeti.AlgebraicGeometry`: a bare `IsRegular` is
   Mathlib's predicate on elements of a monoid. The dimension of a local ring is `ringKrullDim`;
   for a prime ideal it is `Ideal.height`.
5. **The loci.** The ramification locus of `f` is Tau Ceti's `f.ramificationLocus`, the points at
   which `f` is not unramified; the non-étale locus `f.nonEtaleLocus` is the complement of the
   points at which `f` is étale; the branch locus `f.branchLocus` is the image of the ramification
   locus. The Stacks Project defines none of these sets and uses "ramification locus" in two senses:
   in Section 58.21 the proof of Lemma 58.21.2 (0BJH) works with the discriminant of a finite
   locally free morphism, whose points are, by Discriminants, Lemma 49.3.1 (0BJF), the points of
   `Y` over which `f` is ramified at some point; in Sections 58.28 and 58.29 (Lemma 58.28.3 (0EA4),
   Theorem 58.29.3 (0ECD)) it means the complement of the étale points. SGA 1, Exposé X,
   Théorème 3.1 takes the points where `f` is not étale and notes that under its hypotheses these
   are the points where `f` is ramified. The two loci in `X` differ in general (the closed immersion
   of the origin into `𝔸¹_k` is unramified and not flat) and agree over a normal base (Tau Ceti
   `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`), so §2.3 states purity for the ramification
   locus and for its image.
6. Names: ring-level statements live in the `Algebra` namespace, scheme-level statements in
   `AlgebraicGeometry.Scheme.Hom`; the acceptance file `Suggested.lean` states them in
   `TauCetiRoadmap.PurityOfBranchLocus`.

## Exact supplier contracts

**From Mathlib.**

- `Scheme`, `Scheme.Hom.stalkMap`, `Scheme.Opens.ι`, `IsLocallyNoetherian`, `IsIntegral`,
  `genericPoint`, `IsDominant` (`Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean`),
  `IsFinite` (`Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`), `LocallyOfFiniteType`,
  `LocallyOfFinitePresentation`, `Etale`, `FormallyUnramified`, `LocallyQuasiFinite` (defined by
  quasi-finiteness of the ring maps between affine opens; it does not include finite type) and
  `Scheme.Hom.QuasiFiniteAt`, with `Scheme.Hom.quasiFiniteAt` (a locally quasi-finite morphism is
  quasi-finite at every point) (`Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean`).
- `AlgebraicGeometry.FormallyUnramified.stalkMap`: the stalk maps of a formally unramified
  morphism are formally unramified (`Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean`).
- `LocallyOfFiniteType.isLocallyNoetherian`: a scheme locally of finite type over a locally
  Noetherian scheme is locally Noetherian (`Mathlib/AlgebraicGeometry/Noetherian.lean`).
- The instance `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)` (Stacks 02VN,
  `Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean`).
- `IsRegularLocalRing` and `IsRegularRing`, with the field `IsRegularRing.isRegularLocalRing_localization`
  (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`); `ringKrullDim`, `Ideal.height`.
- `Algebra.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`, `Algebra.Etale`,
  `Algebra.FiniteType`.
- `Algebra.HasGoingDown` and its instance for an integral extension of an integrally closed domain
  by a domain (`@[stacks 00H8]`, `Mathlib/RingTheory/IntegralClosure/GoingDown.lean`), and the
  dimension formula under going down `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`
  (`@[stacks 00ON]`, `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean`).
- `Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq` (`@[stacks 00UJ]`,
  `Mathlib/RingTheory/Etale/QuasiFinite.lean`), the affine input of Tau Ceti's 02LK.

**From Tau Ceti.** Paths are under `TauCeti/`. All the declarations below are proved at the pin.

- *Stalk forms* (`AlgebraicGeometry/Morphisms/StalkMap.lean`), in `AlgebraicGeometry.Scheme.Hom`:
  `unramifiedAt_iff_stalkMap` (for `f` locally of finite type, Stacks' "unramified at `x`" iff the
  stalk map is formally unramified; 02G4); `etaleAt_iff_stalkMap` (for `f` locally of finite
  presentation, étale at `x` iff the stalk map is flat and formally unramified; 02GU (1) ⇔ (4));
  `etaleAt_spec_iff` and `unramifiedAt_spec_iff` (on `Spec S ⟶ Spec R`, with `Algebra.IsEtaleAt` and
  `Algebra.IsUnramifiedAt`); `quasiFiniteAt_spec_iff` (on `Spec S ⟶ Spec R`, with
  `Algebra.QuasiFiniteAt`); `quasiFiniteAt_of_appLE` and `exists_appLE_quasiFiniteAt_iff`
  (Stacks' quasi-finiteness at `x` iff local finite type near `x` and `f.QuasiFiniteAt x`; 01TD).
  In `AlgebraicGeometry`: `formallyUnramified_stalkMap_specMap_iff` (on `Spec S ⟶ Spec R`, the
  stalk map at `𝔮` is formally unramified iff `Algebra.IsUnramifiedAt R 𝔮`).
- *Purity in dimensions one and two and the unramified-over-normal criterion* (the same file):
  `exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain` (`f` locally of finite
  presentation, the local ring at `x` a domain and not a field, the local ring at `f x` a Dedekind
  domain, the stalk map formally unramified: `f` is étale at `x`);
  `exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le` (`Y` locally Noetherian, `f`
  locally of finite type, the local ring at `f x` a normal domain of dimension at most that at `x`,
  the stalk map formally unramified: `f` is étale at `x`; SGA 1, Exposé I, 9.5 (ii));
  `exists_etale_of_etale_comp` (`f` locally of finite presentation, `g ≫ f` étale and `g` flat at
  `x'`: `f` is étale at `g x'`); and `AlgebraicGeometry.Etale.of_comp_surjective` (`f` locally of
  finite presentation, `g` flat and surjective, `g ≫ f` étale: `f` is étale; 036W for such `f`).
  In `RingTheory/RegularLocalRing/Purity.lean`:
  `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two` (a finite
  torsion-free algebra over a regular local ring of dimension one or two, normal at its maximal
  ideals and unramified at its primes of height one, is étale; 0BMB in that case).
- *Elementary étale localization* (02LK): `Scheme.Hom.exists_elementaryEtale_finite_of_isolated`
  (`AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean`; `f` locally of finite type and
  quasi-finite at `x`: an étale `φ : U ⟶ Y` and `u` over `f x` with trivial residue field
  extension, and an open `V` of `X ×_Y U`, finite over `U`, whose only point `v` over `u` maps to
  `x` with trivial residue field extension) and its persistence clause
  `Scheme.Hom.exists_finite_open_baseChange` (`…/ElementaryEtale/BaseChange.lean`).
- *Étale invariance*: `TauCeti.Algebra.isNormalDomain_iff_of_etale` (`RingTheory/Etale/Normal.lean`;
  for a local homomorphism `A → B` with `B ≅ C_𝔮`, `C` étale over `A` and `A` local, `A` is a normal
  domain iff `B` is; 025P without Noetherian hypotheses); `Scheme.Hom.ringKrullDim_stalk_eq_of_etale`
  (`AlgebraicGeometry/Morphisms/Etale/Stalk.lean`; `f` étale and the local ring at `f x`
  Noetherian; 039S at stalks); `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`
  (`AlgebraicGeometry/Scheme/Regular/LocalRing.lean`; `f` étale; 025N at stalks).
- *Dimensions of local rings* (`AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean`):
  `Scheme.Hom.ringKrullDim_stalk_eq_of_quasiFiniteAt` (`X`, `Y` integral, `f` dominant and locally
  of finite type, quasi-finite at `x`, the local ring at `f x` integrally closed:
  `dim 𝒪_{X,x} = dim 𝒪_{Y,f x}`) and `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`
  (the same for `f` locally quasi-finite and `Y` normal, at every point).
- *The loci* (`AlgebraicGeometry/Morphisms/RamificationLocus.lean`), in
  `AlgebraicGeometry.Scheme.Hom`: `ramificationLocus`, `nonEtaleLocus`, `branchLocus` (Convention 5);
  `ramificationLocus_eq_setOf_not_exists` (for `f` locally of finite type, the complement of the
  points with an open neighbourhood on which `f` is unramified in Stacks' sense; 02G4);
  `isClosed_ramificationLocus` (`f` locally of finite type), `isClosed_nonEtaleLocus` (no
  hypothesis), `ramificationLocus_subset_nonEtaleLocus`, `isClosed_branchLocus` (`f` universally
  closed and locally of finite type, in particular finite; 01WM);
  `ramificationLocus_eq_nonEtaleLocus` (`Y` locally Noetherian and normal, `X`, `Y` integral, `f`
  dominant and locally of finite type; normality of `X` and quasi-finiteness are not needed); the
  affine comparisons `ramificationLocus_specMap`, `branchLocus_specMap` and `nonEtaleLocus_specMap`
  (the last for `S` of finite presentation) with `Algebra.unramifiedLocus` and `Algebra.etaleLocus`.
- *Normal and regular schemes*: `TauCeti.AlgebraicGeometry.IsNormalScheme`
  (`AlgebraicGeometry/Scheme/Normal.lean`; every local ring a domain and integrally closed; 033I),
  `TauCeti.AlgebraicGeometry.IsRegular` (`AlgebraicGeometry/Scheme/Regular/Scheme.lean`; extends
  `IsLocallyNoetherian`, every local ring regular; 02IT) and its instance
  `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (0569).
- *Regular local rings*: `TauCeti.IsRegularLocalRing.isDomain` (instance),
  `TauCeti.IsRegularRing.isIntegrallyClosed` (instance, `RingTheory/RegularLocalRing/Normal.lean`),
  `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`
  (`RingTheory/RegularLocalRing/Basic.lean`); `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE`
  (00OC), `TauCeti.isRegularLocalRing_iff_globalDimension_lt_top` (0AFS, first sentence) and the
  instance `TauCeti.isRegularRing_of_isRegularLocalRing` (0AFS, second sentence)
  (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`); with Mathlib's
  `IsRegularRing.isRegularLocalRing_localization` the last makes every localization of a regular
  local ring at a prime a regular local ring.

**From TauCetiRoadmap.LocalPurity.** §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`:
for `A` regular local of dimension `≥ 2` and `B` a finite `A`-algebra that is torsion free and
normal, with `Algebra.IsEtaleAt A 𝔮` for every prime `𝔮` of `B` not lying over the maximal ideal
of `A`, `Algebra.Etale A B` (Stacks 0BMA (2) with the torsion-free correction). Only this clause is
consumed.

## How to read the build

The roadmap has one layer, numbered 2 so that citations of its sections keep their numbers; the
pointwise vocabulary, the loci and étale localization on which it rests are Tau Ceti's and form no
layer here. §2.1 proves 0BMB by induction on the dimension: the dimension-one case is Tau Ceti's,
and in higher dimension Tau Ceti's elementary étale localization and étale invariance reduce to a
finite local homomorphism of local rings, where the induction hypothesis on the punctured spectrum
and LocalPurity §2.1 conclude. §2.2 and §2.3 apply 0BMB pointwise, with Tau Ceti's equality of local
dimensions supplying its dimension hypothesis. Each *Needs:* line lists the inputs of its statement
and route, so that a target proved by another route is not blocked behind an unrelated one.

## Layer 2: purity of the branch locus

### 2.1 Purity of the branch locus

Prove `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (Stacks, Lemma 58.21.4
(0BMB)): let `f : X ⟶ Y` be a morphism of locally Noetherian schemes, locally of finite type,
`x : X` and `y = f x`; if `X.presheaf.stalk x` is a normal domain, `Y.presheaf.stalk y` is a regular
local ring, `f.QuasiFiniteAt x`, `ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk y)`,
`1 ≤ ringKrullDim (X.presheaf.stalk x)`, and `(f.stalkMap x').hom.FormallyUnramified` for every
`x' ⤳ x` with `ringKrullDim (X.presheaf.stalk x') = 1`, then `∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)`.
This is the target. Prove the accompanying Stacks form
`Scheme.Hom.etaleAt_of_unramifiedAt_codimOne`, with `f` not assumed locally of finite type and
Stacks' pointwise notions (Convention 3) in the hypotheses on quasi-finiteness at `x` and
unramifiedness at `x'`; it follows from the target applied to the restriction of `f` to an open
neighbourhood of `x` on which `f` is locally of finite type, with Tau Ceti's
`Scheme.Hom.unramifiedAt_iff_stalkMap` translating the hypotheses. Prove the affine form
`Algebra.isEtaleAt_of_purity`: for a Noetherian ring `R`, a finite-type `R`-algebra `S` and a prime
`𝔮` of `S` with `Localization.AtPrime 𝔮` a normal domain, `Localization.AtPrime (𝔮.under R)`
regular, `Algebra.QuasiFiniteAt R 𝔮`, `𝔮.height = (𝔮.under R).height`, `1 ≤ 𝔮.height` and
`Algebra.IsUnramifiedAt R 𝔮'` for every prime `𝔮' ≤ 𝔮` of height one, `Algebra.IsEtaleAt R 𝔮`; it
is the target for `Spec S ⟶ Spec R` (`S` is finitely presented over the Noetherian `R`, and the
specializations of `𝔮` are the primes `𝔮' ≤ 𝔮`), through Tau Ceti's `Scheme.Hom.etaleAt_spec_iff`,
`Scheme.Hom.quasiFiniteAt_spec_iff` and `AlgebraicGeometry.formallyUnramified_stalkMap_specMap_iff`.

*Route* (Stacks' proof). Induction on `d = dim 𝒪_{X,x}`; `f` is locally of finite presentation,
being locally of finite type over a locally Noetherian scheme. For `d = 1`, `x ⤳ x` itself has
dimension one, so the stalk map at `x` is formally unramified, and Tau Ceti's
`Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le` (normal base of the
same dimension) concludes; equivalently, `𝒪_{Y,y}` is a discrete valuation ring
(`TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`) and
`Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain` applies. For `d ≥ 2`:
Tau Ceti's `Scheme.Hom.exists_elementaryEtale_finite_of_isolated` (02LK) gives an étale
neighbourhood `(U, u)` of `y` and an open `V` of `X ×_Y U` finite over `U` with `v` the only point
over `u`; the projection `V → X` is étale, so the hypotheses pass to `(V, v)` over `(U, u)`:
regularity by `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`, dimensions by
`Scheme.Hom.ringKrullDim_stalk_eq_of_etale`, normality by `TauCeti.Algebra.isNormalDomain_iff_of_etale`,
and unramifiedness at codimension-one generizations by base change. If `V → U` is étale at `v`,
then `f` is étale at `x` by Tau Ceti's `Scheme.Hom.exists_etale_of_etale_comp` applied to the étale
projection `V → X`. Base change along `Spec 𝒪_{U,u} → U` reduces to a finite local homomorphism
`A → B` of Noetherian local rings with `A` regular, `B` a normal domain and `dim B = dim A = d`; it
is injective (a nonzero kernel would lower the dimension, `A` being a domain), so `B` is torsion
free over `A` and going down holds (Mathlib's 00H8 instance; `A` is an integrally closed domain by
Tau Ceti's instances `TauCeti.IsRegularLocalRing.isDomain`,
`TauCeti.isRegularRing_of_isRegularLocalRing` and `TauCeti.IsRegularRing.isIntegrallyClosed`).
Let `𝔮` be a prime of `B` other than the maximal ideal. If `𝔮 ≠ 0`, then `B_𝔮` is a normal domain,
`A_{𝔮 ∩ A}` is regular (Tau Ceti's 0AFS instance `TauCeti.isRegularRing_of_isRegularLocalRing` with
Mathlib's `IsRegularRing.isRegularLocalRing_localization`), their dimensions agree and lie in
`[1, d)` (going down and Mathlib's 00ON dimension formula, the fibres of `A → B` being finite), and
the height-one primes below `𝔮` are among those below the maximal ideal, so the induction
hypothesis makes `A → B` étale at `𝔮`. If `𝔮 = 0`, the induction hypothesis does not apply
(dimension zero); instead `𝔮` is a generization of a prime of height one (`d ≥ 2`), at which `A → B`
is unramified, the unramified points form an open set (Tau Ceti's
`Scheme.Hom.isClosed_ramificationLocus`), so `A → B` is unramified at `0`, and a formally
unramified extension of fields essentially of finite type is étale. LocalPurity §2.1 then makes
`A → B` étale. For `d = 2` the last step is also Tau Ceti's
`TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two`.
*Needs:* LocalPurity §2.1; Tau Ceti `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le`,
`Scheme.Hom.exists_elementaryEtale_finite_of_isolated`, `Scheme.Hom.exists_etale_of_etale_comp`,
`Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`, `Scheme.Hom.ringKrullDim_stalk_eq_of_etale`,
`TauCeti.Algebra.isNormalDomain_iff_of_etale`, `TauCeti.IsRegularLocalRing.isDomain`,
`TauCeti.isRegularRing_of_isRegularLocalRing`, `TauCeti.IsRegularRing.isIntegrallyClosed`,
`TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`,
`Scheme.Hom.isClosed_ramificationLocus`, and for the two accompanying forms
`Scheme.Hom.unramifiedAt_iff_stalkMap`, `Scheme.Hom.etaleAt_spec_iff`,
`Scheme.Hom.quasiFiniteAt_spec_iff`, `AlgebraicGeometry.formallyUnramified_stalkMap_specMap_iff`;
Mathlib
`Scheme.Hom.QuasiFiniteAt`, `Algebra.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`,
`Algebra.HasGoingDown`, `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`,
`IsRegularRing.isRegularLocalRing_localization`.

**Checks.**
- The squaring map `𝔸¹_k → 𝔸¹_k`, `t ↦ t²`, over a field of characteristic `≠ 2`: at `t = 1` every
  hypothesis holds (`dim = 1` on both sides, the stalk map is unramified because `2t` is a unit
  there) and the map is étale there; at `t = 0` the stalk map is not formally unramified
  (`Ω = k[t]dt/(2t dt)` is nonzero at the origin), the codimension-one hypothesis fails at the
  point itself, and the map is not étale. A version of the target asking unramifiedness only at
  proper generizations would wrongly make it étale at the origin.
- The quotient map `𝔸² → Spec k[x², xy, y²]` over a field of characteristic `≠ 2` is finite, has
  normal source and normal non-regular target of dimension two, and is étale at every point other
  than the origin (the involution `(x, y) ↦ (−x, −y)` acts freely there), in particular at every
  codimension-one point; it is not étale at the origin, so regularity of `𝒪_{Y,y}` cannot be
  weakened to normality.
- `𝔸² → 𝔸²`, `(x, y) ↦ (x², y)`, over a field of characteristic `≠ 2` is finite between regular
  schemes, ramified at the generic point of `x = 0` (a codimension-one generization of the origin)
  and not étale at the origin: the codimension-one hypothesis cannot be dropped.
- A field extension `Spec L → Spec K` has `dim = 0` on both sides and is excluded by `1 ≤ dim`;
  without that bound the purely inseparable `𝔽_p(t^{1/p})/𝔽_p(t)` would satisfy every other
  hypothesis vacuously and is not étale.

### 2.2 The global corollary

Prove `Scheme.Hom.etale_of_etaleAt_codimOne` (*API*): let `X` and `Y` be integral schemes, `X`
normal (`TauCeti.AlgebraicGeometry.IsNormalScheme X`) and `Y` regular
(`TauCeti.AlgebraicGeometry.IsRegular Y`), and let `f : X ⟶ Y` be finite and dominant and
**generically étale**: `∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)`, equivalently the finite
extension of function fields is separable. Then `Etale f` iff `(f.stalkMap x).hom.FormallyUnramified`
for every `x : X` with `ringKrullDim (X.presheaf.stalk x) = 1`. `X` is locally Noetherian, being
finite over `Y`.

*Route.* The "only if" direction is Mathlib's `AlgebraicGeometry.FormallyUnramified.stalkMap` for
the formally unramified `f`. For "if", `Etale f` is checked at every point. At the generic point of
`X` it is the generic étaleness hypothesis; it is the only point with local dimension zero, which
0BMB does not cover. At any other point `x`, `dim 𝒪_{X,x} ≥ 1`; a finite morphism is locally of
finite type and locally quasi-finite, so `f` is quasi-finite at `x`, `X` is locally Noetherian, and
Tau Ceti's `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (for the normal scheme `Y`,
through `TauCeti.AlgebraicGeometry.IsRegular.isNormal`) gives `dim 𝒪_{X,x} = dim 𝒪_{Y,f x}`;
§2.1 then makes `f` étale at `x`, the codimension-one hypothesis being the right-hand side.
Without generic étaleness the statement fails: for the purely inseparable extension
`𝔽_p(t) ⊂ 𝔽_p(t)[u]/(uᵖ − t)` both spectra are points of dimension zero, the right-hand side holds
vacuously, and the map is not étale.
*Needs:* §2.1; Tau Ceti `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`,
`TauCeti.AlgebraicGeometry.IsNormalScheme`, `TauCeti.AlgebraicGeometry.IsRegular`,
`TauCeti.AlgebraicGeometry.IsRegular.isNormal`; Mathlib `IsFinite`, `IsDominant`, `IsIntegral`,
`genericPoint`, `Etale`, `AlgebraicGeometry.FormallyUnramified.stalkMap`, `Scheme.Hom.quasiFiniteAt`,
`LocallyOfFiniteType.isLocallyNoetherian`.

**Checks.**
- For the purely inseparable extension `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)` the generic étaleness
  hypothesis fails (the only open containing the generic point is the whole point, and the map is
  not étale), so the statement says nothing; with that hypothesis dropped, the right-hand side
  would hold vacuously and the left-hand side fail.
- For `𝔸² → 𝔸²`, `(x, y) ↦ (x², y)` in characteristic `≠ 2`, the map is étale on `x ≠ 0`, which
  contains the generic point; both sides are false, the right-hand side at the generic point of
  `x = 0`, whose local ring has dimension one and where `Ω_{X/Y}` is nonzero.
- For the quotient map `𝔸² → Spec k[x², xy, y²]` in characteristic `≠ 2` the target is not regular:
  the generic étaleness hypothesis and the right-hand side hold and the map is not étale at the
  origin, so regularity of `Y` cannot be weakened to normality.
- For `f = 𝟙 Y` both sides hold.

### 2.3 Purity of the ramification and branch loci

This section derives from 0BMB the classical formulation of SGA 1, Exposé X, Théorème 3.1: for
`f : X → Y` quasi-finite and dominant between integral schemes, `X` normal and `Y` regular and
locally Noetherian, the set of points of `X` where `f` is not étale, if it is not all of `X`, has
codimension one at each of its points (each irreducible component has generic point `z` with
`dim 𝒪_{X,z} = 1`). No Stacks tag states this form. Throughout, the hypotheses are: `X` and `Y`
integral, `TauCeti.AlgebraicGeometry.IsNormalScheme X`, `TauCeti.AlgebraicGeometry.IsRegular Y`,
`LocallyOfFiniteType f`, `LocallyQuasiFinite f` and `IsDominant f`. Under them the ramification
locus is the non-étale locus (Tau Ceti `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`), so the
statements below are SGA 1's theorem for either set.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` (*API*; SGA 1, X 3.1):
under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every `z ∈ f.ramificationLocus` with no
proper generization in `f.ramificationLocus` has `ringKrullDim (X.presheaf.stalk z) = 1`. Since the
ramification locus is closed (Tau Ceti `Scheme.Hom.isClosed_ramificationLocus`) and `X` is sober,
such `z` are exactly the generic points of its irreducible components. *Route.* `z` is not the
generic point `η` of `X`: otherwise the closed set `f.ramificationLocus` contains `η`, hence is `X`.
So `d = dim 𝒪_{X,z} ≥ 1`. Suppose `d ≥ 2`. A codimension-one `x' ⤳ z` is a proper generization of
`z` (the dimensions differ), so `x' ∉ f.ramificationLocus` by maximality; with
`Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` for the equality of dimensions and `X`
locally Noetherian (finite type over `Y`), §2.1 makes `f` étale at `z`, so unramified at `z`
(`Scheme.Hom.ramificationLocus_subset_nonEtaleLocus`), contradicting `z ∈ f.ramificationLocus`.
Hence `d = 1`.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (*API*; the classical purity
of the branch locus): under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every
`w ∈ f.branchLocus` with no proper generization in `f.branchLocus` has
`ringKrullDim (Y.presheaf.stalk w) = 1`. *Route.* Write `w = f z` with `z` ramified. The
generizations of `z` correspond to the primes of the Noetherian local ring `𝒪_{X,z}`, so among
those in `f.ramificationLocus` there is one, `z₀`, of least dimension; it has no proper generization
in the ramification locus. Then `f z₀ ⤳ w` and `f z₀ ∈ f.branchLocus`, so `f z₀ = w` by maximality
of `w`, and `dim 𝒪_{Y,w} = dim 𝒪_{X,z₀} = 1` by `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`
and the previous target. With Tau Ceti's `Scheme.Hom.isClosed_branchLocus`: for `f` finite, under
the hypotheses of this section and `f.ramificationLocus ≠ Set.univ`, the branch locus is a closed
subset of `Y` that is empty or of pure codimension one.
*Needs:* §2.1; Tau Ceti `Scheme.Hom.ramificationLocus`, `Scheme.Hom.branchLocus`,
`Scheme.Hom.isClosed_ramificationLocus`, `Scheme.Hom.ramificationLocus_subset_nonEtaleLocus`,
`Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`, `TauCeti.AlgebraicGeometry.IsNormalScheme`,
`TauCeti.AlgebraicGeometry.IsRegular`, `TauCeti.AlgebraicGeometry.IsRegular.isNormal`; Mathlib
`IsIntegral`, `IsDominant`, `LocallyQuasiFinite`, `LocallyOfFiniteType`, `Scheme.Hom.quasiFiniteAt`,
`LocallyOfFiniteType.isLocallyNoetherian`, `ringKrullDim`, `Specializes`.

**Checks.**
- For `𝔸² → 𝔸²`, `(x, y) ↦ (u, v) = (x², y)` in characteristic `≠ 2`, the ramification locus is
  `V(x)` and the branch locus is `V(u)`; their generic points are the only points without proper
  generization in them, and the local rings there have dimension one, as both targets say.
- For `𝔸² → Spec k[x², xy, y²]` in characteristic `≠ 2` the ramification locus is the origin,
  whose local ring has dimension two: regularity of `Y` cannot be dropped from either target.
- For the relative Frobenius `𝔸¹_k → 𝔸¹_k`, `t ↦ tᵖ`, over a field of characteristic `p > 0`, the
  map is finite and dominant between regular integral schemes and its ramification locus is all of
  `𝔸¹_k`; the only point of that locus without proper generization in it is the generic point, of
  dimension zero. The
  hypothesis `f.ramificationLocus ≠ Set.univ` excludes it, and without it both targets would be
  false.
- For a finite separable extension of fields, or any étale `f`, both loci are empty and the targets
  hold vacuously.

### Examples

- For `f : 𝔸²_k → 𝔸²_k`, `(x, y) ↦ (u, v) = (xⁿ, yⁿ)` with `n ≥ 2` invertible in `k`, `f` is finite
  and dominant between regular integral schemes, étale exactly off the two axes (the Jacobian
  `n² xⁿ⁻¹ yⁿ⁻¹` is a unit there), and generically étale. Its ramification locus is `V(xy)`, the
  union of the two axes, whose points without proper generization in it are the generic points of
  the axes, of local dimension one; the branch locus is `V(uv)`, likewise of pure codimension one
  (§2.3). The origin lies in the ramification locus without being maximal in it. §2.2 says that `f`
  is not étale, since it is ramified at the generic points of the axes.
- For `Spec ℤ[i] → Spec ℤ`, finite and dominant between regular schemes of dimension one and étale
  at the generic point, `Ω_{ℤ[i]/ℤ} ≅ ℤ[i]/(2i)` is supported at the prime `(1 + i)`, so the
  ramification locus is `{(1 + i)}` and the branch locus is `{(2)}`, each of local dimension one, as
  §2.3 says; §2.2 says that the map is not étale, since it is ramified at the codimension-one point
  `(1 + i)`.
- For `f : 𝔸³_k → 𝔸³_k`, `(x, y, z) ↦ (x², y, z)` in characteristic `≠ 2`, at the closed point
  `P = (1, 0, 0)` the local rings have dimension three, `f` is quasi-finite, and every
  codimension-one generization of `P` lies in the open set `x ≠ 0`, where `2x` is a unit and `f` is
  unramified; §2.1 makes `f` étale at `P`. At the origin the codimension-one generization given by
  the generic point of the plane `x = 0` is ramified, so §2.1 does not apply, and `f` is indeed not
  étale there.

### Dependencies

LocalPurity §2.1 (0BMA (2)). Tau Ceti: the stalk forms of unramified and étale points, the
dimension-one criteria, elementary étale localization, descent of étaleness along flat morphisms,
étale invariance of normality, dimension and regularity, the equality of local dimensions for
dominant locally quasi-finite morphisms, the loci and their API, normal and regular schemes, and
0AFS. Mathlib: schemes and their morphism classes, quasi-finiteness at a point, regular local
rings, going down and the dimension formula.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Accompanying*: a Stacks-form
restatement of a target. *API*: no Stacks counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 2.1 | `exists_etale_of_formallyUnramified_stalk_codimOne` | 58.21.4 (0BMB) | exact (stalk form) |
| 2.1 | `etaleAt_of_unramifiedAt_codimOne` | 58.21.4 (0BMB) | accompanying |
| 2.1 | `isEtaleAt_of_purity` | 58.21.4 (0BMB) | affine form |
| 2.2 | `etale_of_etaleAt_codimOne` | — | API |
| 2.3 | `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` | 58.21.4 (0BMB); SGA 1 X 3.1 | API (derived) |

## Downstream consumers

- [AbhyankarLemma](../AbhyankarLemma/README.md) §3.3 cites this roadmap's former §0.3 for 0AFS,
  which is Tau Ceti's `TauCeti.isRegularRing_of_isRegularLocalRing` (table in Scope and ownership).
- [LocalPurity](../LocalPurity/README.md) names this roadmap as the consumer of its §2.1.
- CrystallineCohomology consumes §§2.1–2.2 for its componentwise branch-purity adapter, and the
  stalk form of unramifiedness, Tau Ceti's `Scheme.Hom.unramifiedAt_iff_stalkMap`.
- LefschetzPencilsAndVanishingCycles consumes §§2.1–2.2 (branch purity and the global corollary).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes §§2.1–2.2 (purity for finite normal covers
  of regular bases).
- ArtinAlgebras, AdicCoefficientsAndComparisonsPartII, DeformationAndDerivedPatchingAlgebra and
  EnhancedDerivedSheaves cite the former §0.3 for global dimension, the Auslander–Buchsbaum formula,
  freeness of maximal Cohen–Macaulay modules and Serre's characterization; these are the Tau Ceti
  declarations of the table in Scope and ownership.

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib) contains a development of this material, built for the "PCF all the way
down" theorem. Paths are under `lean/Pcf/` at commit `9a20b3f351446d64e6015d704198bc71c7002008`,
the commit that Tau Ceti's `RamificationLocus.lean` cites; later commits move them under
`library/Pcf/`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 2.1 | `Pcf.Stacks.zariskiNagataPurity` (affine), `Pcf.Stacks.isStacksEtaleAt_of_zariskiNagataPurity` (Stacks form), `Pcf.Stacks.exists_etale_of_zariskiNagataPurity` (scheme form) | `Stacks/Purity/Tag0BMA.lean`, `Stacks/Purity/Tag0BMBScheme.lean`, `Stacks/Purity/Tag0BMBSchemeAPI.lean` |

## References

- The Stacks Project, Chapters 10 (Algebra), 28 (Properties of Schemes), 29 (Morphisms), 35
  (Descent), 37 (More on Morphisms), 41 (Étale Morphisms), 49 (Discriminants and Differents) and 58
  (Fundamental Groups of Schemes), https://stacks.math.columbia.edu; Lemma 58.21.4 (0BMB) for §2.1.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Théorème 3.1
  (Zariski–Nagata purity, printed p. 212) and Exposé I, Théorème 9.5.
- O. Zariski, *On the purity of the branch locus of algebraic functions*, Proc. Nat. Acad. Sci.
  U.S.A. 44 (1958), 791–796.
- M. Nagata, *On the purity of branch loci in regular local rings*, Illinois J. Math. 3 (1959).
