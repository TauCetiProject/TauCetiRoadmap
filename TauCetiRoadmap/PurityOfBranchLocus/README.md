# Roadmap: purity of the branch locus

**Summary.** This roadmap proves Zariski–Nagata purity of the branch locus (Stacks, Lemma 58.21.4
(0BMB); SGA 1, Exposé X, Théorème 3.1): a morphism of locally Noetherian schemes that is
quasi-finite at a point `x` with normal source stalk and regular target stalk of the same dimension
`≥ 1`, and unramified at every codimension-one point specializing to `x`, is étale at `x`. Globally:
a finite dominant, generically étale morphism from a normal integral scheme to a regular one is
étale as soon as it is étale in codimension one. It derives from 0BMB the classical statement
that, under §2.3's hypotheses and when the ramification locus is not all of the source, the
ramification and branch loci are empty or of pure codimension one; and it proves that being étale
is étale local on the source in the generality of Stacks, Lemma 35.31.1 (036W). Apart from purity
for regular local rings, the material 0BMB rests on is in the pinned libraries and is consumed
(supplier contracts): Mathlib's étale, unramified and quasi-finite morphisms with their stalk and affine
pointwise forms; Tau Ceti's stalk forms of "unramified at `x`" and "étale at `x`", the
ramification, non-étale and branch loci of a morphism of schemes with their closedness, affine
comparisons and equality over a normal base, normality, dimension and regularity along étale
homomorphisms of local rings, elementary étale localization of a quasi-finite point (Stacks
02LK), the dimension equality for quasi-finite dominant morphisms onto a normal scheme, and 0BMB
in dimension one. The local input in dimension `≥ 2` is purity for regular local rings,
[LocalPurity](../LocalPurity/README.md) §2.1. Mathlib has neither 0BMB nor a ramification or
branch locus of a morphism of schemes, and its étale localization of a quasi-finite point,
`AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt`, assumes the morphism separated.

| Layer | Title | What it delivers |
|---|---|---|
| [1](#layer-1-étale-locality-on-the-source) | Étale locality on the source | being étale is étale local on the source, with no finite-presentation hypothesis |
| [2](#layer-2-purity-of-the-branch-locus) | Purity of the branch locus | 0BMB in scheme, Stacks and affine forms, the global corollary, purity of the ramification and branch loci in codimension-one form |

```text
Mathlib + Tau Ceti ─────────────────→ Layer 1
Mathlib + Tau Ceti ─────────────────→ Layer 2
LocalPurity §2.1 (0BMA) ────────────→ Layer 2
```

The end theorems are `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB, §2.1),
`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2) and
`Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (§2.3).

## Scope and ownership

**This roadmap owns** purity of the branch locus, Stacks, Lemma 58.21.4 (0BMB), in stalk, Stacks
and affine form (§2.1); its global corollary for finite morphisms (§2.2); the codimension-one
purity of the ramification and branch loci in the form of SGA 1, Exposé X, Théorème 3.1 (§2.3);
and Descent, Lemma 35.31.1 (036W), that being étale is étale local on the source, for morphisms
not assumed locally of finite presentation (§1.1).

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier. The declarations are listed under the supplier contracts.

- *Pointwise notions in stalk form*: Tau Ceti proves that "unramified at `x`" and "étale at `x`"
  in the open-neighbourhood forms of Stacks, Definitions 29.36.1 (02G4) and 29.37.1 (02GI), are
  formal unramifiedness, respectively flatness and formal unramifiedness, of the stalk map (Lemma
  29.37.15 (02GU)), with the comparisons on `Spec S → Spec R` and the stalk form of quasi-finiteness
  at a point (Definition 29.21.1 (01TD)).
- *The ramification, non-étale and branch loci* of a morphism of schemes, their closedness, their
  affine comparisons with Mathlib's `Algebra.unramifiedLocus` and `Algebra.etaleLocus`, and the
  equality of the ramification and non-étale loci for a dominant morphism of integral schemes onto
  a locally Noetherian normal scheme (SGA 1, Exposé I, 9.5 (ii)): Tau Ceti.
- *Normality, dimension and regularity along étale homomorphisms of local rings* (Étale Morphisms,
  Proposition 41.19.7 (025P), Lemma 41.19.1 (039S), Proposition 41.19.4 (025N)) and descent of
  regularity along flat local homomorphisms (Algebra, Lemma 10.110.9 (00OF)): Tau Ceti, in ring
  form and on the stalks of an étale morphism.
- *Elementary étale localization of a quasi-finite point* (More on Morphisms, Lemma 37.41.1
  (02LK), with its persistence clause), and 036W for morphisms locally of finite presentation:
  Tau Ceti.
- *The dimension of local rings under quasi-finite dominant morphisms of integral schemes onto a
  normal scheme*: Tau Ceti.
- *Purity in dimension one*, and for finite algebras over a regular local ring of dimension one or
  two: Tau Ceti. §2.1 starts its induction there.
- *Regular local rings, regular and normal schemes*: Mathlib (`IsRegularLocalRing`,
  `IsRegularRing`); Tau Ceti (normal and regular schemes, a regular local ring is a domain (00NP),
  a regular ring (0AFS) and integrally closed (0567), a regular scheme is normal).
- *Purity for regular local rings*: [LocalPurity](../LocalPurity/README.md) §2.1
  (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, Stacks 0BMA (2) with the torsion-free
  correction of LocalPurity Convention 5).

Extension of finite étale covers, ramification in codimension one and Abhyankar's lemma are
[AbhyankarLemma](../AbhyankarLemma/README.md).

**Section ids resolved in the libraries.** The sections below are in the pinned Tau Ceti (paths
under `TauCeti/`); other roadmaps citing them by these ids cite the declarations instead. Layer 2
keeps its numbering.

| Former numbering | Content | Pinned Tau Ceti declarations |
|---|---|---|
| §0.1 | stalk forms of unramified and étale at a point, the `Spec` comparisons, the quasi-finite comparison | `Scheme.Hom.unramifiedAt_iff_stalkMap`, `Scheme.Hom.etaleAt_iff_stalkMap`, `Scheme.Hom.etaleAt_spec_iff`, `Scheme.Hom.unramifiedAt_spec_iff`, `Scheme.Hom.quasiFiniteAt_of_appLE`, `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` (`AlgebraicGeometry/Morphisms/StalkMap.lean`) |
| §0.2 | normality along étale homomorphisms of local rings (025P) | `TauCeti.Algebra.isNormalDomain_iff_of_etale` (`RingTheory/Etale/Normal.lean`) |
| §0.3 | global dimension, the Auslander–Buchsbaum formula, freeness of maximal Cohen–Macaulay modules over regular local rings, minimal finite free resolutions, Serre's characterization of regular local rings and the regularity of their localizations (0AFS) | `TauCeti.globalDimension` (`RingTheory/GlobalDimension.lean`), `ModuleCat.projectiveDimension_add_depth_eq_depth` (`RingTheory/Depth/AuslanderBuchsbaum.lean`), `TauCeti.IsRegularLocalRing.free_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/Free.lean`), `ModuleCat.exists_projectiveResolution_finite_free_minimal` (`Algebra/Category/ModuleCat/Projective/MinimalResolution/ChainComplex.lean`), `TauCeti.isRegularLocalRing_tfae` and `TauCeti.isRegularRing_of_isRegularLocalRing` (`RingTheory/RegularLocalRing/ProjectiveDimension.lean`) |
| §0.4 | the ramification, non-étale and branch loci | `Scheme.Hom.ramificationLocus`, `Scheme.Hom.nonEtaleLocus`, `Scheme.Hom.branchLocus` and their API (`AlgebraicGeometry/Morphisms/RamificationLocus.lean`) |
| §1.1, 02LK | elementary étale localization | `Scheme.Hom.exists_elementaryEtale_finite_of_isolated` (`AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean`), `Scheme.Hom.exists_finite_open_baseChange` (`AlgebraicGeometry/Morphisms/ElementaryEtale/BaseChange.lean`) |

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses are written on the statement that uses them.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result with different notions, an accompanying statement in the form of the tag is derived from
   it; both carry `@[stacks XXXX]`. Targets with no Stacks counterpart are marked *API*.
3. **Pointwise notions.** For `f : X ⟶ Y` and `x : X`, the library forms are stalkwise:
   *quasi-finite at `x`* is Mathlib's `f.QuasiFiniteAt x`; *unramified at `x`* is
   `(f.stalkMap x).hom.FormallyUnramified`; *flat at `x`* is `(f.stalkMap x).hom.Flat`. Being étale
   at `x` is stated as the existence of an open neighbourhood, `∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)`,
   with Mathlib's `Etale`. Stacks' forms (Definitions 29.21.1 (01TD), 29.36.1 (02G4), 29.37.1
   (02GI)) are the open-neighbourhood forms: `f` is unramified at `x` iff
   `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)`, and
   quasi-finite at `x` adds `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f)` to
   `f.QuasiFiniteAt x`. Tau Ceti proves the two forms equivalent (supplier contracts).
4. *Normal* for a local ring is `IsDomain` together with `IsIntegrallyClosed`; a *normal scheme* is
   Tau Ceti's `TauCeti.AlgebraicGeometry.IsNormalScheme` (every local ring normal), a *regular
   scheme* Tau Ceti's `TauCeti.AlgebraicGeometry.IsRegular` (locally Noetherian with regular local
   rings). The dimension of a local ring is `ringKrullDim`; for a prime ideal it is `Ideal.height`.
5. An *étale homomorphism of local rings* `A → B` (Stacks, Definition 41.11.1 (0258)) is written
   in Mathlib's vocabulary as a local homomorphism of Noetherian local rings `A → B` with `B`
   `A`-isomorphic to `Localization.AtPrime 𝔮` for an étale `A`-algebra `C` and a prime `𝔮` of `C`.
   The stalk map at a point of an étale morphism of locally Noetherian schemes is one.
6. **The loci.** The ramification, non-étale and branch loci are Tau Ceti's: for `f : X ⟶ Y`,
   `f.ramificationLocus : Set X` is the set of points at which the stalk map is not formally
   unramified, `f.nonEtaleLocus : Set X` the set of points with no open neighbourhood on which `f`
   is étale, and `f.branchLocus : Set Y` the image `f '' f.ramificationLocus`, the points over
   which `f` is ramified somewhere. The Stacks Project defines none of these sets and uses the
   terms in two senses. In Section 58.21 (Purity of branch locus), the proof of Lemma 58.21.2
   (0BJH) works with the discriminant of a finite locally free morphism (Discriminants, Section
   49.3), a locally principal closed subscheme of `Y`; Lemma 49.3.1 (0BJF) says only that a finite
   locally free morphism is étale iff its discriminant is empty, and applied over the opens of `Y`,
   with étale equivalent to unramified for flat `f`, it shows that the points of the discriminant
   are those over which `f` is ramified at some point. In Sections 58.28 and 58.29, "ramification
   locus" means the complement of the étale points: Lemma 58.28.3 (0EA4) assumes étaleness in
   codimension one, and Theorem 58.29.3 (0ECD) concerns the maximal open subscheme on which `f` is
   étale. SGA 1, Exposé X, Théorème 3.1 takes the set of points at which `f` is not étale and notes
   that under its hypotheses this is the set at which `f` is ramified (SGA 1, I 9.5 (ii)). The
   loci follow Section 58.21 and SGA 1: `ramificationLocus` is the non-unramified locus,
   `branchLocus` its image, and `nonEtaleLocus` a separate set. The two loci in `X` differ in
   general (Layer 2, Examples) and agree under the hypotheses of §2.3.
7. Names: ring-level statements live in the `Algebra` namespace, scheme-level statements in
   `AlgebraicGeometry.Scheme.Hom`. The statements of the acceptance test `Suggested.lean` are in
   `TauCetiRoadmap.PurityOfBranchLocus`.

## Exact supplier contracts

**From Mathlib.**

- `Scheme`, `Scheme.Opens`, `Scheme.Hom.stalkMap`, `genericPoint`, `IsIntegral`,
  `IsLocallyNoetherian` and `LocallyOfFiniteType.isLocallyNoetherian` (a scheme locally of finite
  type over a locally Noetherian scheme is locally Noetherian, `Mathlib/AlgebraicGeometry/Noetherian.lean`),
  and the specialization relation `⤳` on the underlying space.
- The morphism properties `Etale`, `FormallyUnramified`, `LocallyOfFiniteType`,
  `LocallyOfFinitePresentation`, `LocallyQuasiFinite`, `IsFinite`, `IsDominant`, `Surjective`,
  `UniversallyClosed`; a finite morphism is locally quasi-finite, locally of finite type and
  universally closed, and a morphism locally of finite type to a locally Noetherian scheme is locally
  of finite presentation (instances). `FormallyUnramified` is stable under base change
  (`Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean`), and the stalk maps of a formally
  unramified, respectively flat, morphism are formally unramified, respectively flat
  (`FormallyUnramified.stalkMap`, `Flat.stalkMap`).
- Quasi-finiteness at a point `Scheme.Hom.QuasiFiniteAt` (quasi-finiteness of the stalk map).
- The affine pointwise notions `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`, `Algebra.QuasiFiniteAt`
  and `Algebra.isEtaleAt_iff_flat_and_isUnramifiedAt`; the affine loci `Algebra.unramifiedLocus` and
  `Algebra.etaleLocus`.
- `IsRegularLocalRing` (a Noetherian local ring whose maximal ideal needs `ringKrullDim`
  generators), `IsRegularRing` and `IsRegularRing.isRegularLocalRing_localization`
  (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`); `ringKrullDim`, `Ideal.height`,
  `Algebra.HasGoingDown` (with the `@[stacks 00H8]` instance: going down holds for a domain `S`
  integral over an integrally closed domain `R` with `R → S` injective) and the dimension formula
  `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown` (`@[stacks 00ON]`: under going down,
  for `S` Noetherian and `P` over `p`, `ht P = ht p + ht (P S/pS)`).
- `AlgebraicGeometry.exists_etale_isCompl_of_quasiFiniteAt` (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`):
  for `f` separated and locally of finite type and quasi-finite at `x`, an étale neighbourhood of
  `f x` over which an open and closed part of the fibre product through `x` is finite. Tau Ceti's
  02LK below removes separatedness and adds the residue field and uniqueness clauses.

**From Tau Ceti.** Paths are under `TauCeti/`.

- `AlgebraicGeometry/Morphisms/StalkMap.lean`:
  - `Scheme.Hom.unramifiedAt_iff_stalkMap`: for `f` locally of finite type, `f` is unramified at
    `x` in Stacks' open-neighbourhood form iff `(f.stalkMap x).hom` is formally unramified (02G4);
  - `Scheme.Hom.etaleAt_iff_stalkMap`: for `f` locally of finite presentation, `f` is étale on a
    neighbourhood of `x` iff `(f.stalkMap x).hom` is flat and formally unramified (02GU);
  - `Scheme.Hom.etaleAt_spec_iff` and `Scheme.Hom.unramifiedAt_spec_iff`: `Spec S → Spec R` is étale
    (`S` of finite presentation), respectively unramified (`S` of finite type), at `𝔮` iff
    `Algebra.IsEtaleAt R 𝔮`, respectively `Algebra.IsUnramifiedAt R 𝔮`;
    `Scheme.Hom.quasiFiniteAt_spec_iff`, the same for `Algebra.QuasiFiniteAt`;
    `Scheme.Hom.quasiFiniteAt_of_appLE` and `Scheme.Hom.exists_appLE_quasiFiniteAt_iff` (01TD):
    quasi-finiteness at `x` in Stacks' form is `f.QuasiFiniteAt x` together with local finite type
    near `x`;
  - `Scheme.Hom.flat_stalkMap_of_comp`, `Scheme.Hom.formallyUnramified_stalkMap_of_comp` (for `f`
    and `g ≫ f` locally of finite type) and `Scheme.Hom.exists_etale_of_etale_comp` (for `f` locally
    of finite presentation and `g ≫ f` étale): flatness, formal unramifiedness and étaleness descend
    from `x'` to `g x'` along a morphism `g` whose stalk map at `x'` is flat;
  - `AlgebraicGeometry.Etale.of_comp_surjective`: for `f` locally of finite presentation and `g`
    flat and surjective, if `g ≫ f` is étale then so is `f` (036W for `f` locally of finite
    presentation);
  - `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain`: for `f` locally of
    finite presentation, `𝒪_{Y,f x}` a Dedekind domain and `𝒪_{X,x}` a domain that is not a field,
    a formally unramified stalk map at `x` makes `f` étale near `x` (purity in dimension one);
  - `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_ringKrullDim_le`: for `Y` locally
    Noetherian, `f` locally of finite type and `𝒪_{Y,f x}` a normal domain with
    `dim 𝒪_{Y,f x} ≤ dim 𝒪_{X,x}`, a formally unramified stalk map at `x` makes `f` étale near `x`
    (compare SGA 1, Exposé I, Théorème 9.5 (ii)).
- `AlgebraicGeometry/Morphisms/RamificationLocus.lean`: `Scheme.Hom.ramificationLocus`,
  `Scheme.Hom.nonEtaleLocus` and `Scheme.Hom.branchLocus` (Convention 6);
  `Scheme.Hom.ramificationLocus_eq_setOf_not_exists` (for `f` locally of finite type, the
  ramification locus is the complement of Stacks' unramified points, 02G4) and
  `Scheme.Hom.mem_nonEtaleLocus_iff_stalkMap` (for `f` locally of finite presentation);
  `Scheme.Hom.isClosed_ramificationLocus` (for `f` locally of finite type),
  `Scheme.Hom.isClosed_nonEtaleLocus` (no hypothesis), `Scheme.Hom.isClosed_branchLocus` (for `f`
  universally closed and locally of finite type, in particular finite, 01WM) and
  `Scheme.Hom.ramificationLocus_subset_nonEtaleLocus`; the affine comparisons
  `Scheme.Hom.ramificationLocus_specMap` (`(Algebra.unramifiedLocus R S)ᶜ`, no finiteness),
  `Scheme.Hom.branchLocus_specMap` and `Scheme.Hom.nonEtaleLocus_specMap` (`(Algebra.etaleLocus R S)ᶜ`
  for `S` of finite presentation); and `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`: for `f`
  dominant and locally of finite type between integral schemes, with `Y` locally Noetherian and
  normal, the two loci agree (normality of `X` and quasi-finiteness are not needed).
- `AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean`: `Scheme.Hom.ringKrullDim_stalk_eq_of_quasiFiniteAt`
  (for `f` dominant and locally of finite type between integral schemes, quasi-finite at `x`, with
  `𝒪_{Y,f x}` integrally closed, `dim 𝒪_{X,x} = dim 𝒪_{Y,f x}`) and
  `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (the same at every point, for `f` locally
  quasi-finite onto a normal scheme).
- `AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean`: `Scheme.Hom.exists_elementaryEtale_finite_of_isolated`
  (02LK): for `f : X ⟶ S` locally of finite type and quasi-finite at `x`, there are an étale
  `φ : U ⟶ S` and `u : U` with `φ u = f x` and `κ(f x) ≅ κ(u)`, and an open `V` of `X ×_S U`
  finite over `U` containing a point `v` over `x` and `u` with `κ(x) ≅ κ(v)`, the only point of `V`
  over `u`. `AlgebraicGeometry/Morphisms/ElementaryEtale/BaseChange.lean`:
  `Scheme.Hom.exists_finite_open_baseChange`, the persistence clause.
- `RingTheory/Etale/Normal.lean`: `TauCeti.Algebra.isNormalDomain_iff_of_etale` (025P): for an
  étale homomorphism of local rings `A → B` (Convention 5), `A` is a normal domain iff `B` is; no
  Noetherian hypothesis.
- `AlgebraicGeometry/Morphisms/Etale/Stalk.lean`: `Scheme.Hom.ringKrullDim_stalk_eq_of_etale` (for
  `f` étale and `𝒪_{Y,f x}` Noetherian, `dim 𝒪_{Y,f x} = dim 𝒪_{X,x}`; 039S on stalks), with the ring
  form `TauCeti.ringKrullDim_eq_of_flat_of_map_maximalIdeal_eq` (`RingTheory/KrullDimension/Fiber.lean`).
- `AlgebraicGeometry/Scheme/Regular/LocalRing.lean`: `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`
  (for `f` étale, `𝒪_{Y,f x}` is regular iff `𝒪_{X,x}` is; 025N on stalks), with the ring forms
  `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` and
  `TauCeti.IsRegularLocalRing.of_flat_of_formallyUnramified` (`RingTheory/RegularLocalRing/Flat.lean`);
  `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` (`RingTheory/RegularLocalRing/Descent.lean`,
  00OF: regularity descends along a flat local homomorphism, with no Noetherian hypothesis on the
  source).
- `AlgebraicGeometry/Scheme/Normal.lean`: `TauCeti.AlgebraicGeometry.IsNormalScheme`;
  `AlgebraicGeometry/Scheme/Regular/Scheme.lean`: `TauCeti.AlgebraicGeometry.IsRegular`,
  `TauCeti.AlgebraicGeometry.isRegular_iff_forall_stalk` and the instance
  `TauCeti.AlgebraicGeometry.IsRegular.isNormal`.
- Regular local rings: `TauCeti.IsRegularLocalRing.isDomain` (00NP),
  `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`,
  `TauCeti.isRegularRing_of_isRegularLocalRing` (0AFS, `RingTheory/RegularLocalRing/ProjectiveDimension.lean`;
  with Mathlib's `IsRegularRing.isRegularLocalRing_localization`, every localization of a regular
  local ring at a prime is regular) and `TauCeti.IsRegularRing.isIntegrallyClosed` (0567,
  `RingTheory/RegularLocalRing/Normal.lean`).
- `RingTheory/Unramified/Normal.lean`: `Algebra.IsUnramifiedAt.of_forall_height_eq_one` (for `S`
  integral, torsion free and essentially of finite type over a Noetherian integrally closed domain
  `R` that is not a field, unramified at the primes of height one implies unramified at the primes
  of height at most one) and `Algebra.IsEtaleAt.of_isUnramifiedAt_of_height_le` (for `S` of finite
  type over a Noetherian `R`, unramified at `𝔮` over `𝔭` with `R_𝔭` a normal domain and
  `ht 𝔭 ≤ ht 𝔮`, `S` is étale over `R` at `𝔮`).
- `RingTheory/RegularLocalRing/Purity.lean`: `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two`
  (for `A` regular local of dimension one or two and `B` finite and torsion free over `A` with
  normal localizations at its maximal ideals, unramified at the primes of height one, `B` is étale
  over `A`).

**From [TauCetiRoadmap.LocalPurity](../LocalPurity/README.md).** §2.1
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`: for `A` a regular local ring with
`2 ≤ ringKrullDim A` and `B` a finite, torsion-free `A`-algebra whose localizations at all primes
are normal domains, if `B` is étale over `A` at every prime not lying over the maximal ideal of
`A`, then `B` is étale over `A`.

## How to read the build

There is no Layer 0: the pointwise vocabulary, the three loci and the local algebra along étale
homomorphisms are Tau Ceti's (supplier contracts; the former section ids are resolved under Scope
and ownership). Layer 1 proves that being étale is étale local on the source for morphisms not
assumed locally of finite presentation. Layer 2 proves 0BMB by induction on the dimension, from
Tau Ceti's dimension-one case and LocalPurity §2.1, and derives §2.2 and §2.3 from it. Layer 2
does not use Layer 1: its morphisms are locally of finite presentation, where Tau Ceti's descent
of étaleness applies. Each subsection's *Needs:* line lists its inputs.

## Layer 1: étale locality on the source

### 1.1 Étaleness is étale local on the source

Prove *etale_of_etale_comp_surjective* (Stacks, Descent, Lemma 35.31.1 (036W)): for an étale
surjective `g : X' ⟶ X` and any `f : X ⟶ Y`, `Etale f ↔ Etale (g ≫ f)`. The forward direction is
the stability of `Etale` under composition. For the converse, Tau Ceti's
`AlgebraicGeometry.Etale.of_comp_surjective` applies as soon as `f` is locally of finite
presentation, since `g` is flat and surjective; and local finite presentation descends from
`g ≫ f` to `f`, because it is local in the fppf topology on the source (Descent, Lemma 35.28.1
(036N)) and `{g}` is an fppf covering of `X`.
*Needs:* Mathlib `Etale`, `Surjective`, `LocallyOfFinitePresentation`; Tau Ceti
`AlgebraicGeometry.Etale.of_comp_surjective`.

**Checks.**
- Surjectivity of `g` cannot be dropped: over a field of characteristic `≠ 2`, `f : 𝔸¹ ⟶ 𝔸¹`,
  `t ↦ t²`, has `Ω = k[t]/(2t) ≠ 0` at the origin, so it is not étale there, while its restriction
  to the open immersion `g : D(t) ⟶ 𝔸¹` is étale.
- The identity `g = 𝟙 X` gives the tautology `Etale f ↔ Etale f`; an open cover `g : ∐ Uᵢ ⟶ X`
  gives the Zariski locality of `Etale` on the source, which needs no finite-presentation input.

### Examples

- For a finite Galois extension `L/k` of degree `n`, `g : Spec (L ⊗_k L) ⟶ Spec L` is étale and
  surjective, and `L ⊗_k L ≅ Lⁿ` by `a ⊗ b ↦ (a σ(b))_σ`, so `g ≫ f : ∐ⁿ Spec L ⟶ Spec k` is étale,
  as is `f : Spec L ⟶ Spec k`.

### Dependencies

Mathlib: étale, surjective and locally finitely presented morphisms. Tau Ceti: descent of
étaleness along flat surjections for morphisms locally of finite presentation. Stacks 036N for
the descent of local finite presentation.

## Layer 2: purity of the branch locus

### 2.1 Purity of the branch locus

Prove `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (Stacks, Lemma 58.21.4 (0BMB)):
let `f : X ⟶ Y` be a morphism of locally Noetherian schemes, locally of finite type, `x : X` and
`y = f x`; if `X.presheaf.stalk x` is a normal domain, `Y.presheaf.stalk y` is a regular local
ring, `f.QuasiFiniteAt x`, `ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk y) ≥ 1`,
and `(f.stalkMap x').hom.FormallyUnramified` for every `x' ⤳ x` with
`ringKrullDim (X.presheaf.stalk x') = 1`, then `∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)`. This is
the target. Prove the accompanying Stacks form `Scheme.Hom.etaleAt_of_unramifiedAt_codimOne`, with
`f` not assumed locally of finite type and Stacks' pointwise notions (Convention 3) in the
hypotheses; it follows from the target applied to the restriction of `f` to an open neighbourhood
of `x` on which `f` is locally of finite type, which contains every generization of `x`, with Tau
Ceti's `Scheme.Hom.unramifiedAt_iff_stalkMap` translating the hypotheses. Prove the affine form
`Algebra.isEtaleAt_of_purity`: for a Noetherian ring `R`, a finite-type `R`-algebra `S` and a prime
`𝔮` of `S` with `Localization.AtPrime 𝔮` a normal domain, `Localization.AtPrime (𝔮.under R)`
regular, `Algebra.QuasiFiniteAt R 𝔮`, `𝔮.height = (𝔮.under R).height ≥ 1` and
`Algebra.IsUnramifiedAt R 𝔮'` for every prime `𝔮' ≤ 𝔮` of height one, `Algebra.IsEtaleAt R 𝔮`;
it is the target on `Spec S → Spec R`, through Tau Ceti's `Scheme.Hom.etaleAt_spec_iff`,
`Scheme.Hom.unramifiedAt_spec_iff` and `Scheme.Hom.quasiFiniteAt_spec_iff`.

Proof sketch, following Stacks, by induction on `d = dim 𝒪_{Y,y}`. As `Y` is locally Noetherian,
`f` is locally of finite presentation, so `f` is étale near a point iff its stalk map there is
flat and formally unramified (Tau Ceti `Scheme.Hom.etaleAt_iff_stalkMap`).

- *`d = 1`.* The hypothesis at `x' = x` makes the stalk map at `x` formally unramified,
  `𝒪_{Y,y}` is a discrete valuation ring (Tau Ceti
  `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`) and `𝒪_{X,x}` is a
  domain that is not a field, so Tau Ceti's
  `Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain` concludes.
- *Étale localization, `d ≥ 2`.* Tau Ceti's `Scheme.Hom.exists_elementaryEtale_finite_of_isolated`
  gives an étale `φ : U ⟶ Y`, a point `u` over `y`, and an open `V` of `X ×_Y U`, finite over `U`,
  whose only point over `u` is a point `v` over `x`. The projection `p : V ⟶ X` is étale, so the
  hypotheses pass from `x` to `v` and from `y` to `u`: normality by
  `TauCeti.Algebra.isNormalDomain_iff_of_etale` (the stalk map of `p` at `v`, Convention 5),
  regularity by `Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale` applied to `φ`, the dimensions by
  `Scheme.Hom.ringKrullDim_stalk_eq_of_etale` applied to `p` and to `φ`, and the codimension-one
  hypothesis because `p` maps a codimension-one generization `v'` of `v` to a codimension-one
  generization of `x`, near which `f` is unramified (`Scheme.Hom.unramifiedAt_iff_stalkMap`), and
  formal unramifiedness is stable under base change.
- *The local situation.* Put `A = 𝒪_{U,u}` and `B = 𝒪_{V,v}`. Then `A` is a regular local ring of
  dimension `d`, and `B` is a normal local domain of dimension `d`, finite over `A` because `V` is
  finite over `U` and `v` is its only point over `u`. The kernel `𝔭` of `A → B` is prime with
  `dim A/𝔭 = dim B = dim A`, so `𝔭 = 0` in the Noetherian local domain `A` (Tau Ceti
  `TauCeti.IsRegularLocalRing.isDomain`); hence `B` is torsion free over `A`, and its localizations
  at primes are normal domains. Going down holds for `A → B` (Mathlib `Algebra.HasGoingDown`, `A`
  being integrally closed), so the dimension formula
  `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, whose fibre term vanishes because `B`
  is integral over `A`, gives `ht 𝔮 = ht (𝔮 ∩ A)` for every prime `𝔮` of `B`. The primes of height one of `B` are the codimension-one generizations of `v`,
  so `B` is unramified over `A` at them, hence at its prime of height zero (Tau Ceti
  `Algebra.IsUnramifiedAt.of_forall_height_eq_one`).
- *The punctured spectrum.* Let `𝔮` be a prime of `B` over a non-maximal prime `𝔭` of `A`. If
  `𝔭 = 0`, `B` is étale over `A` at `𝔮` by Tau Ceti's `Algebra.IsEtaleAt.of_isUnramifiedAt_of_height_le`.
  Otherwise `A_𝔭` is a regular local ring (Tau Ceti `TauCeti.isRegularRing_of_isRegularLocalRing`
  with Mathlib `IsRegularRing.isRegularLocalRing_localization`) of dimension `ht 𝔭` with
  `1 ≤ ht 𝔭 < d`, and the affine form in dimension `ht 𝔭` makes `B` étale over `A` at `𝔮`.
- *Conclusion.* LocalPurity §2.1 gives `Algebra.Etale A B` (for `d = 2`, so does Tau Ceti's
  `TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_ringKrullDim_le_two`). So `V ⟶ U` is
  étale near `v` (`Scheme.Hom.etaleAt_iff_stalkMap`), hence so is `V ⟶ Y`, which factors as `p`
  followed by `f`; and étaleness descends along `p` from `v` to `x` (Tau Ceti
  `Scheme.Hom.exists_etale_of_etale_comp`).

*Needs:* Tau Ceti `Scheme.Hom.etaleAt_iff_stalkMap`, `Scheme.Hom.unramifiedAt_iff_stalkMap`,
`Scheme.Hom.etaleAt_spec_iff`, `Scheme.Hom.unramifiedAt_spec_iff`, `Scheme.Hom.quasiFiniteAt_spec_iff`,
`Scheme.Hom.exists_etale_of_formallyUnramified_stalkMap_of_isDedekindDomain`,
`Scheme.Hom.exists_elementaryEtale_finite_of_isolated`, `TauCeti.Algebra.isNormalDomain_iff_of_etale`,
`Scheme.Hom.isRegularLocalRing_stalk_iff_of_etale`, `Scheme.Hom.ringKrullDim_stalk_eq_of_etale`,
`Scheme.Hom.exists_etale_of_etale_comp`, `TauCeti.IsRegularLocalRing.isDomain`,
`TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`,
`TauCeti.isRegularRing_of_isRegularLocalRing`, `Algebra.IsUnramifiedAt.of_forall_height_eq_one`,
`Algebra.IsEtaleAt.of_isUnramifiedAt_of_height_le`; Mathlib `Scheme.Hom.QuasiFiniteAt`,
`Algebra.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`, `Algebra.HasGoingDown`,
`Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, `IsRegularRing.isRegularLocalRing_localization`,
`Ideal.height`; LocalPurity §2.1.

**Checks.**
- Regularity of the target cannot be dropped: over a field of characteristic `≠ 2`, the quotient
  map `𝔸² → Spec k[x², xy, y²]` is finite, has normal source and normal non-regular target, is étale
  at every codimension-one point of the source and is not étale at the origin.
- The codimension-one hypothesis cannot be dropped: over a field of characteristic `≠ 2`,
  `𝔸² → 𝔸²`, `(x, y) ↦ (x², y)` is finite between regular schemes, ramified along `x = 0`, and not
  étale at the origin.
- Equality of the dimensions cannot be dropped: the closed immersion `𝔸¹ → 𝔸²`, `t ↦ (t, 0)`, is
  quasi-finite and unramified, with normal source stalk of dimension `1` and regular target stalk
  of dimension `2` at the origin, and is not flat there (`y` is a non-zero-divisor of
  `k[x, y]_(x, y)` that kills `k[t]_(t)`), so it is not étale.
- Dimension one: for `Spec ℤ[i] → Spec ℤ`, `Ω = ℤ[i]/(2)` is supported at `(1 + i)` alone. At
  `(2 + i)`, over `5`, every hypothesis holds and the map is étale; at `(1 + i)`, over `2`, the
  codimension-one hypothesis fails at the point itself and the map is not étale, since
  `2 = −i(1 + i)²`.

### 2.2 The global corollary

Prove `Scheme.Hom.etale_of_etaleAt_codimOne` (*API*): a finite dominant morphism `f : X ⟶ Y` from
a normal (`TauCeti.AlgebraicGeometry.IsNormalScheme X`) integral locally Noetherian scheme to a
regular (`TauCeti.AlgebraicGeometry.IsRegular Y`) integral scheme that is **generically étale** is
étale iff `(f.stalkMap x).hom` is formally unramified at every point `x` with
`ringKrullDim (X.presheaf.stalk x) = 1`. Generically étale means that the finite extension of
function fields is separable, equivalently that `f` is étale at the generic point of `X`; the
statement writes it as `∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)`, and its conclusion
is `Etale f` iff `(f.stalkMap x).hom.FormallyUnramified` for every `x` with
`ringKrullDim (X.presheaf.stalk x) = 1`. The generic hypothesis handles the point with
zero-dimensional stalk, which 0BMB does not cover; at every other point §2.1 applies: a finite
morphism is locally quasi-finite and locally of finite type, the stalk dimensions agree by Tau
Ceti's `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (`Y` is normal by the instance
`TauCeti.AlgebraicGeometry.IsRegular.isNormal`), and the codimension-one generizations of `x` are
unramified by hypothesis. The converse direction is Mathlib's `FormallyUnramified.stalkMap`.
Without the generic hypothesis the statement fails for the purely inseparable
`𝔽_p(t) ⊂ 𝔽_p(t)[u]/(uᵖ - t)`: both spectra are zero-dimensional, so the codimension-one condition
is vacuous, but the map is not étale. When `X` has dimension `≥ 1` the hypothesis is implied by
the codimension-one condition (unramifiedness at a codimension-one point localizes to the generic
point, where it says that the function field extension is separable); it is kept so that the
statement covers zero-dimensional `X` uniformly.
*Needs:* §2.1; Tau Ceti `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`,
`TauCeti.AlgebraicGeometry.IsNormalScheme`, `TauCeti.AlgebraicGeometry.IsRegular`,
`TauCeti.AlgebraicGeometry.IsRegular.isNormal`; Mathlib `IsFinite`, `IsDominant`, `IsIntegral`,
`genericPoint`, `FormallyUnramified.stalkMap`.

**Checks.**
- The square map `𝔸² → 𝔸²`, `(x, y) ↦ (x², y)`, in characteristic `≠ 2`, is finite, dominant and
  generically étale (`k(x, y)/k(x², y)` is separable of degree `2`); its stalk map at the generic
  point of `V(x)` is not formally unramified, and `f` is not étale: both sides of the equivalence
  are false.
- The relative Frobenius `𝔸¹_k ⟶ 𝔸¹_k`, `t ↦ tᵖ`, in characteristic `p > 0`, is finite and dominant
  between regular integral schemes, and the generic hypothesis fails: `k(t)/k(tᵖ)` is purely
  inseparable, so `f` is not étale at the generic point.

### 2.3 Purity of the ramification and branch loci

This section derives from 0BMB the classical formulation of SGA 1, Exposé X, Théorème 3.1: for
`f : X → Y` quasi-finite and dominant between integral schemes, `X` normal and `Y` regular and
locally Noetherian, the set of points of `X` at which `f` is not étale, if it is not all of `X`,
has codimension one at each of its points (each irreducible component has generic point `z` with
`dim 𝒪_{X,z} = 1`). No Stacks tag states this form; Lemma 58.28.3 (0EA4, purity of ramification
locus, attributed there to Gabber) is a different statement (no quasi-finiteness, étaleness in
codimension one assumed) and is not a target here. Throughout, the hypotheses are: `X` and `Y`
integral, `TauCeti.AlgebraicGeometry.IsNormalScheme X`, `TauCeti.AlgebraicGeometry.IsRegular Y`
(which includes local Noetherianity), `f` locally of finite type, `LocallyQuasiFinite f` and
`IsDominant f`. Under them `X` is locally Noetherian (Mathlib `LocallyOfFiniteType.isLocallyNoetherian`),
Tau Ceti's `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` makes the ramification locus the set
SGA 1 considers, and Tau Ceti's `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` gives
`dim 𝒪_{X,x} = dim 𝒪_{Y,f x}` for every `x`.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` (*API*; SGA 1, X 3.1):
under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every `z ∈ f.ramificationLocus` with no
proper generization in `f.ramificationLocus` has `ringKrullDim (X.presheaf.stalk z) = 1`. Since
the ramification locus is closed (Tau Ceti `Scheme.Hom.isClosed_ramificationLocus`) and `X` is
sober, such `z` are exactly the generic points of its irreducible components. Proof sketch. `z` is
not the generic point `η` of `X`: otherwise the closed set `f.ramificationLocus` contains `η`,
hence is `X`. So `d = dim 𝒪_{X,z} ≥ 1`. Suppose `d ≥ 2`. A codimension-one `x' ⤳ z` is a proper
generization of `z` (dimensions differ), so `x' ∉ f.ramificationLocus` by maximality, and §2.1
(0BMB), with Tau Ceti's dimension equality, makes `f` étale at `z`, contradicting
`z ∈ f.ramificationLocus` (Tau Ceti `Scheme.Hom.ramificationLocus_subset_nonEtaleLocus`). Hence
`d = 1`.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (*API*; the classical purity
of the branch locus): under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every
`w ∈ f.branchLocus` with no proper generization in `f.branchLocus` has
`ringKrullDim (Y.presheaf.stalk w) = 1`. Proof sketch. Write `w = f z` with `z` ramified. The
generizations of `z` are the primes of the Noetherian local ring `𝒪_{X,z}`, so among those in
`f.ramificationLocus` there is one, `z₀`, of least dimension; it has no proper generization in the
ramification locus. Then `f z₀ ⤳ w` and `f z₀ ∈ f.branchLocus`, so `f z₀ = w` by maximality of
`w`, and `dim 𝒪_{Y,w} = dim 𝒪_{X,z₀} = 1` by Tau Ceti's dimension equality and the previous
target. With Tau Ceti's `Scheme.Hom.isClosed_branchLocus`: for `f` finite, under the hypotheses of
this section and `f.ramificationLocus ≠ Set.univ`, the branch locus is a closed subset of `Y` that
is empty or of pure codimension one. (Without `f.ramificationLocus ≠ Set.univ` this fails: the
branch locus of the relative Frobenius of `𝔸¹` (Checks) is all of `𝔸¹`.)
*Needs:* §2.1; Tau Ceti `Scheme.Hom.ramificationLocus`, `Scheme.Hom.branchLocus`,
`Scheme.Hom.isClosed_ramificationLocus`, `Scheme.Hom.ramificationLocus_subset_nonEtaleLocus`,
`Scheme.Hom.isClosed_branchLocus`, `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`,
`Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`, `TauCeti.AlgebraicGeometry.IsNormalScheme`,
`TauCeti.AlgebraicGeometry.IsRegular`; Mathlib `IsIntegral`, `IsDominant`, `LocallyQuasiFinite`,
`LocallyOfFiniteType`, `LocallyOfFiniteType.isLocallyNoetherian`, `ringKrullDim`.

**Checks.**
- The square map: for `𝔸² → 𝔸²`, `(x, y) ↦ (u, v) = (x², y)` in characteristic `≠ 2`, the
  ramification and non-étale loci are both `V(x)` (`Ω = k[x, y]/(2x)`, and `k[x, y]` is free over
  `k[u, v]` on `1, x`), the generic point of `V(x)` has a local ring of dimension `1`, and the branch
  locus `V(u)` is irreducible of codimension one.
- Regularity of the target cannot be dropped: for `𝔸² → Spec k[x², xy, y²]` in characteristic
  `≠ 2`, the ramification locus is the origin, of codimension two.
- The relative Frobenius, which `f.ramificationLocus ≠ Set.univ` excludes: over a field `k` of
  characteristic `p > 0`, `𝔸¹_k ⟶ 𝔸¹_k`, `t ↦ tᵖ`, is finite and dominant between regular integral
  schemes, and its ramification locus, its non-étale locus and its branch locus are all of `𝔸¹_k`
  (`Ω` is `k[t] dt` since `p tᵖ⁻¹ = 0`, the map is flat as `k[t]` is free of rank `p` over `k[tᵖ]`,
  and it is surjective); the only point of the ramification locus with no proper generization in
  it is the generic point, whose local ring has dimension `0`.

### Examples

- The two loci in `X` differ without dominance: the closed immersion `Spec k ⟶ 𝔸¹_k` at the origin
  is unramified and not flat, so its ramification locus is empty and its non-étale locus is the
  point. Its branch locus, the image of the empty ramification locus, is empty although `f` is
  étale nowhere: the image of the non-étale locus, the origin, is not the branch locus.
- For `Spec ℤ[i] → Spec ℤ`, finite and dominant from a normal integral scheme to a regular one, the
  ramification locus is `{(1 + i)}` and the branch locus `{(2)}`; their points have local rings of
  dimension `1`, as §2.3 predicts, and the ramification locus is not everything because
  `ℚ(i)/ℚ` is separable.

### Dependencies

Tau Ceti: the stalk forms and their affine comparisons, the three loci with their closedness and
the equality of the ramification and non-étale loci over a normal base, the dimension equality for
quasi-finite dominant morphisms onto a normal scheme, elementary étale localization, normality,
dimension and regularity along étale morphisms, descent of étaleness along a morphism with flat
stalk map, purity in dimension one and in dimension two, unramifiedness at height zero and étaleness
of unramified points over a normal base of no larger dimension, regular local rings and regular and
normal schemes. Mathlib: quasi-finiteness at a point, the affine pointwise notions, regular local
rings and their localizations, going down and the dimension formula, generic points and finite,
dominant and locally quasi-finite morphisms. LocalPurity §2.1 for purity for regular local rings
in dimension `≥ 2`.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Accompanying*: a Stacks-form
restatement of a target. *API*: no Stacks counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 1.1 | *etale_of_etale_comp_surjective* | 35.31.1 (036W) | exact |
| 2.1 | `exists_etale_of_formallyUnramified_stalk_codimOne` | 58.21.4 (0BMB) | exact (stalk form) |
| 2.1 | `etaleAt_of_unramifiedAt_codimOne` | 58.21.4 (0BMB) | accompanying |
| 2.1 | `Algebra.isEtaleAt_of_purity` | 58.21.4 (0BMB) | affine form |
| 2.2 | `etale_of_etaleAt_codimOne` | — | API |
| 2.3 | `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` | 58.21.4 (0BMB); SGA 1 X 3.1 | API (derived) |

## Downstream consumers

- CrystallineCohomology consumes §§2.1–2.2 for its componentwise branch-purity adapter.
- LefschetzPencilsAndVanishingCycles consumes §§2.1–2.2.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes §§2.1–2.2 (purity for finite normal covers
  of regular bases).

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib, no `sorry`) contains a development of this material, built for the "PCF
all the way down" theorem. Paths are under `library/Pcf/` at commit d28f90d.

| § | Existing declarations | Files |
| --- | --- | --- |
| 2.1 | `Pcf.Stacks.zariskiNagataPurity` (affine), `Pcf.Stacks.isStacksEtaleAt_of_zariskiNagataPurity` (Stacks form), `Pcf.Stacks.exists_etale_of_zariskiNagataPurity` (scheme form) | `Stacks/Purity/Tag0BMA.lean`, `Stacks/Purity/Tag0BMBScheme.lean`, `Stacks/Purity/Tag0BMBSchemeAPI.lean` |
| 2.3 | `Pcf.codim_eq_one_of_algebra` (codimension-one purity of the non-étale locus of `Spec S`, with the local form of 0BMB taken as a hypothesis) | `NonEtaleLocus.lean` |

## References

- The Stacks Project, Chapters 10 (Algebra), 29 (Morphisms), 35 (Descent), 37 (More on Morphisms),
  41 (Étale Morphisms), 49 (Discriminants and Differents) and 58 (Fundamental Groups of Schemes),
  https://stacks.math.columbia.edu.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Théorème 3.1
  (Zariski–Nagata purity) and Exposé I, Théorème 9.5.
- O. Zariski, *On the purity of the branch locus of algebraic functions*, Proc. Nat. Acad. Sci.
  U.S.A. 44 (1958), 791–796.
- M. Nagata, *On the purity of branch loci in regular local rings*, Illinois J. Math. 3 (1959).
