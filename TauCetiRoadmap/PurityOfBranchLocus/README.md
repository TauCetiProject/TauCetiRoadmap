# Roadmap: purity of the branch locus

**Summary.** This roadmap proves Zariski–Nagata purity of the branch locus (Stacks, Lemma 58.21.4
(0BMB); SGA 1, Exposé X, Théorème 3.1): a morphism of locally Noetherian schemes that is
quasi-finite at a point `x` with normal source stalk and regular target stalk of the same dimension
`≥ 1`, and unramified at every codimension-one point specializing to `x`, is étale at `x`. Globally:
a finite dominant, generically étale morphism from a normal integral scheme to a regular one is
étale as soon as it is étale in codimension one. The roadmap also defines the ramification locus,
the non-étale locus and the branch locus of a morphism of schemes, and derives from 0BMB the
classical statement that, under §2.3's hypotheses and when the ramification locus is not all of
the source, the ramification and branch loci are empty or of pure codimension one. The local input
is purity for regular local rings, from [LocalPurity](../LocalPurity/README.md); this roadmap supplies the
pointwise vocabulary in stalk form, the permanence of normality under étale homomorphisms of local
rings, Serre's characterization of regular local rings by finite global dimension and its
consequence that a localization of a regular local ring is regular (Stacks 0AFS), étale localization
of a quasi-finite morphism, and the reduction of 0BMB to the local case. Mathlib has schemes, étale,
unramified and quasi-finite morphisms, their stalk and affine pointwise forms
(`Scheme.Hom.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`), regular local rings,
projective dimension, going down and descent of étaleness along fpqc covers, and the affine loci
`Algebra.unramifiedLocus` and `Algebra.etaleLocus`; it has neither 0BMB, nor localization of regular
local rings, nor étale localization of a quasi-finite morphism, nor a ramification or branch locus
of a morphism of schemes.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-pointwise-notions-and-local-algebra) | Pointwise notions and local algebra | étale and unramified at a point in stalk form, the Stacks forms, normality under étale homomorphisms of local rings, global dimension and localization of regular local rings, the ramification, non-étale and branch loci |
| [1](#layer-1-étale-localization) | Étale localization | elementary étale neighbourhoods making a quasi-finite morphism finite, étaleness is étale local on the source |
| [2](#layer-2-purity-of-the-branch-locus) | Purity of the branch locus | 0BMB in scheme, Stacks and affine forms, the global corollary, purity of the ramification and branch loci in codimension-one form |

```text
Mathlib + Tau Ceti → Layer 0 → Layer 1 → Layer 2
LocalPurity §2.1 (0BMA) ────────────────────→ Layer 2
SchemeAndStackFoundations §§0.17, 4.13 ─────→ Layers 0, 2
ModularCurves §4D (étale invariance) ───────→ Layer 2
```

The end theorems are `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB, §2.1),
`Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2) and
`Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (§2.3).

## Scope and ownership

**This roadmap owns** the stalk forms of "étale at `x`" and "unramified at `x`" and their
equivalence with Stacks' Definitions 29.36.1 (02G4) and 29.37.1 (02GI) and Lemma 29.37.15 (02GU);
the permanence of normality under étale homomorphisms of Noetherian local rings (Étale Morphisms,
Proposition 41.19.7 (025P)); the global dimension of a ring, the Auslander–Buchsbaum formula
(Proposition 10.111.1 (090V)), Serre's characterization of regular local rings by finite global
dimension and the regularity of their localizations (Algebra, Section 10.110: Lemmas 10.109.13
(00O8), 10.106.5 (00NS), 10.106.6 (00NT), 10.104.9 (00NG), Proposition 10.110.1 (00O7), Lemmas
10.110.3 (00OA) and 10.110.4 (00OB), Proposition 10.110.5 (00OC), Lemma 10.110.6 (0AFS));
the ramification, non-étale and branch loci of a morphism of schemes (§0.4) and their
codimension-one purity (§2.3); elementary étale localization of a morphism quasi-finite at a
point (More on Morphisms, Lemma 37.41.1 (02LK)); étaleness is étale local on the source (Descent,
Lemma 35.31.1 (036W)); and purity of the branch locus (Lemma 58.21.4 (0BMB)) with its global
corollary.

**Ordinary-algebra boundary with [EnhancedDerivedSheaves E1.6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/908).**
The two roadmaps share the local-ring domain of 00O7, 00OC and 065T. This §0.3
owns the ordinary local proof chain, including the finite-projective-dimension residue-field
criterion and its equality with the dimension, and the comparison between `globalDimension` and
Mathlib's pointwise `CategoryTheory.HasProjectiveDimensionLE`. E1.6 consumes those results; it
retains the additional bound for **all** modules over a finite-dimensional regular ring (00OE),
and its perfect-algebra and enhanced-derived applications. In particular, E1.6's current
`isRegularLocalRing_of_projectiveDimension_residueField` target is to be supplied by the §0.3
criterion, not independently reproved. The order is ordinary local algebra here, then
LocalPurity §2.1, then branch purity here; E1.6's consumers follow the local algebra without
becoming prerequisites of LocalPurity.

**Owned elsewhere and consumed here.**

- *Purity for regular local rings*: [LocalPurity](../LocalPurity/README.md) §2.1
  (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, Stacks 0BMA (2) with the torsion-free
  correction of LocalPurity Convention 5).
- *Regular local rings*: Mathlib `IsRegularLocalRing`, `IsRegularRing`; Tau Ceti
  `TauCeti.IsRegularLocalRing.isDomain` (00NP), `TauCeti.IsRegularLocalRing.quotient_span_singleton`
  (00NQ for one element) and `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`;
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §4.13 `IsRegular.isNormal`
  (Lemma 10.157.5 (0567)).
- *Depth and Cohen–Macaulay modules*: SchemeAndStackFoundations §0.17 (`IsLocalRing.depth`,
  `depth_le_supportDim` (00LK), `depth_eq_iff_ext`, `depth_quotSMulTop`, `Module.IsCohenMacaulay`,
  `isCohenMacaulay_quotSMulTop_iff`, `Ring.IsCohenMacaulay.of_isRegularRing`).
- *Projective dimension and `Ext`*: Mathlib `CategoryTheory.projectiveDimension`,
  `CategoryTheory.HasProjectiveDimensionLE`, `Ext`, `ModuleCat`.
- *Invariance of regularity and dimension under étale morphisms* (Étale Morphisms, Lemma 41.19.1
  (039S) and Proposition 41.19.4 (025N)): [ModularCurves](../ModularCurves/README.md) §4D, which owns
  the scheme-level API of regular schemes, including its invariance under étale morphisms.
  Tau Ceti already supplies the local ascent input
  `TauCeti.IsRegularLocalRing.of_flat_of_formallyUnramified` for a flat, formally unramified,
  essentially-finite-type local map; reuse it in that scheme-level comparison.
- *Étaleness is fpqc local on the base* (Descent, Lemma 35.23.31 (02VN)): Mathlib's
  `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)`.
- *Going down and the dimension formula*: Mathlib `Algebra.HasGoingDown` (`@[stacks 00H8]`) and the
  `@[stacks 00ON]` dimension formula.
- *Affine étale localization*: Mathlib `Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq`
  (`@[stacks 00UJ]`).

Extension of finite étale covers, ramification in codimension one and Abhyankar's lemma are
[AbhyankarLemma](../AbhyankarLemma/README.md).

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses are written on the statement that uses them.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result with different notions, an accompanying statement in the form of the tag is proved
   equivalent or derived from it; both carry `@[stacks XXXX]`. Targets with no Stacks counterpart
   are marked *API*.
3. **Pointwise notions.** For `f : X ⟶ Y` and `x : X`, the library forms are stalkwise:
   *quasi-finite at `x`* is Mathlib's `f.QuasiFiniteAt x`; *unramified at `x`* is
   `(f.stalkMap x).hom.FormallyUnramified`; *flat at `x`* is `(f.stalkMap x).hom.Flat`. Being étale
   at `x` is stated as the existence of an open neighbourhood, `∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)`,
   with Mathlib's `Etale`. Stacks' forms (Definitions 29.21.1 (01TD), 29.36.1 (02G4), 29.37.1
   (02GI)) are the open-neighbourhood forms: `f` is unramified at `x` iff
   `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)`, and
   quasi-finite at `x` adds `∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f)` to
   `f.QuasiFiniteAt x`. §0.1 proves the two forms equivalent. No new pointwise predicate is
   introduced; §0.4 introduces the loci of these notions as subsets of `X` and `Y`.
4. *Normal* for a local ring is `IsDomain` together with `IsIntegrallyClosed`; the dimension of a
   local ring is `ringKrullDim`; for a prime ideal it is `Ideal.height`.
5. An *étale homomorphism of local rings* `A → B` (Stacks, Definition 41.11.1 (0258)) is written
   in Mathlib's vocabulary as a local homomorphism of Noetherian local rings `A → B` with `B`
   `A`-isomorphic to `Localization.AtPrime 𝔮` for an étale `A`-algebra `C` and a prime `𝔮` of `C`.
6. Names: ring-level statements live in the `Algebra` and `IsLocalRing` namespaces; scheme-level
   statements in `AlgebraicGeometry.Scheme.Hom`. The suggested forms are in
   `TauCetiRoadmap.PurityOfBranchLocus`.

## Layer 0: pointwise notions and local algebra

### 0.1 Stalk forms

For `f : X ⟶ Y` locally of finite type, prove `Scheme.Hom.unramifiedAt_iff_stalkMap`: `f` is
unramified at `x` in Stacks' form (Convention 3) iff `(f.stalkMap x).hom.FormallyUnramified`;
for `f` locally of finite presentation, prove `Scheme.Hom.etaleAt_iff_stalkMap`: `f` is étale at
`x` iff `(f.stalkMap x).hom` is flat and formally unramified (Stacks, Lemma 29.37.15 (02GU), the
equivalence of conditions (1) and (4)). Prove the affine comparison
`Scheme.Hom.etaleAt_spec_iff`: for an `R`-algebra `S` of finite presentation and a prime `𝔮` of
`S`, `Spec S → Spec R` is étale at `𝔮` iff `Algebra.IsEtaleAt R 𝔮`, and likewise for
`Algebra.IsUnramifiedAt` with `S` of finite type. The quasi-finite case is Mathlib's
`Scheme.Hom.QuasiFiniteAt.quasiFiniteAt` and its converse, which is a target here
(`Scheme.Hom.quasiFiniteAt_of_appLE`).
*Needs:* Mathlib `Etale`, `FormallyUnramified`, `LocallyOfFiniteType`, `Scheme.Hom.stalkMap`,
`Scheme.Hom.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`, `Algebra.etaleLocus`,
`Algebra.unramifiedLocus`.

### 0.2 Normality under étale homomorphisms of local rings

For an étale homomorphism of Noetherian local rings `A → B` (Convention 5), prove
`isNormalDomain_iff_of_etale` (Étale Morphisms, Proposition 41.19.7 (025P)): `A` is a normal domain
iff `B` is. The invariance of dimension (039S) and regularity (025N) under étale morphisms is
ModularCurves §4D.
*Needs:* Mathlib `Algebra.Etale`, `Module.FaithfullyFlat`, `IsIntegrallyClosed`;
SchemeAndStackFoundations §§0.17, 4.13 (`isCohenMacaulay_iff_forall_satisfiesSerreS`,
`serre_normality_criterion`); ModularCurves §4D.

### 0.3 Global dimension and localization of regular local rings

Define `globalDimension R : WithBot ℕ∞` as the supremum of `CategoryTheory.projectiveDimension M`
over `M : ModuleCat R` (Stacks, Definition 10.109.10 (00O6)). Match the supremum interface of
mathlib4 #29558, while assigning its implementation here until it is available at the pin.
Prove, each as its tag states it:
`globalDimension_le_iff` (Lemma 10.109.12 (065T)): `globalDimension R ≤ n` iff every finite
`R`-module, iff every cyclic `R`-module, has projective dimension `≤ n`;
`globalDimension_le_iff_hasProjectiveDimensionLE`: `globalDimension R ≤ n` iff every
`M : ModuleCat R` satisfies `CategoryTheory.HasProjectiveDimensionLE M n`. This is the
comparison interface for E1.6's pointwise global-ring bound, not a second dimension notion;
`projectiveDimension_localization_le` and `globalDimension_localization_le` (Lemma 10.109.13
(00O8)): localization does not increase projective or global dimension. For the first statement,
reuse Mathlib's `ModuleCat.projectiveDimension_le_projectiveDimension_of_isLocalizedModule` (and
its bounded predecessor `localizedModule_hasProjectiveDimensionLE`); the global-dimension
inequality remains a target. Derive the Noetherian-local form of
`Module.free_of_quotSMulTop_free` (Lemma 10.106.5 (00NS)) from Mathlib's stronger
`Module.free_quotSMulTop_iff_free` under finite presentation, Jacobson-radical membership and
regularity of the element. Prove `IsRegularLocalRing.free_of_isCohenMacaulay` (Lemma 10.106.6
(00NT)): a **maximal** Cohen–Macaulay module over a regular local ring is free;
`exists_resolution_maximalCohenMacaulay` (Lemma 10.104.9 (00NG)); and
`IsRegularLocalRing.globalDimension_le` (Proposition 10.110.1 (00O7)): over a regular local ring of
dimension `d`, a finite module of depth `e` has a finite free resolution of length `d − e`, so
`globalDimension R ≤ d`. Prove the Auslander–Buchsbaum formula `auslander_buchsbaum` (Proposition
10.111.1 (090V)): for a nonzero finite module `M` of finite projective dimension over a Noetherian
local ring, `projectiveDimension M + IsLocalRing.depth M = IsLocalRing.depth R`. Prove
`projectiveDimension_residueField_ge` (Lemma 10.110.3 (00OA)): `projectiveDimension κ ≥
dim_κ 𝔪/𝔪²` (Koszul complex); `projectiveDimension_residueField_le` (Lemma 10.110.4 (00OB)):
if `κ` has finite projective dimension `n`, then `n ≤ ringKrullDim R` (from `auslander_buchsbaum`
for `M = κ` and `depth_le_supportDim`); and `isRegularLocalRing_tfae` (Proposition 10.110.5 (00OC)):
for a Noetherian local ring, `κ` has finite projective dimension, iff `R` has finite global
dimension, iff `R` is regular, and then `globalDimension R = ringKrullDim R`. Prove
`isRegularLocalRing_iff_finite_globalDimension` and
`IsRegularLocalRing.isRegularLocalRing_localization` (Lemma 10.110.6 (0AFS), both sentences): a
Noetherian local ring is regular iff it has finite global dimension, and the localization of a
regular local ring at a prime is a regular local ring; with it, `isRegularRing_of_isRegularLocalRing`
(*API*): a regular local ring satisfies Mathlib's `IsRegularRing`. Names and shapes follow the
Mathlib vocabulary for projective dimension. Before the global-ring theorem, derive the local
consequence that a regular local ring is Cohen–Macaulay by induction on a regular parameter
sequence, using `TauCeti.IsRegularLocalRing.quotient_span_singleton` and the §0.17 depth/quotient
API; this does not assume `IsRegularRing` of every prime localization. Match the localization
interface proposed in mathlib4 #29802: it has both the concrete `Localization.AtPrime` theorem
and the form for any `S` with `[IsLocalization.AtPrime S p]`. Implement the target here at the
pin rather than waiting for that work.
*Needs:* SchemeAndStackFoundations §0.17 (depth and Cohen–Macaulay API,
`Ring.IsCohenMacaulay.of_isRegularRing`); Tau Ceti `TauCeti.IsRegularLocalRing.quotient_span_singleton`;
Mathlib `CategoryTheory.projectiveDimension`, `CategoryTheory.HasProjectiveDimensionLE`, `Ext`,
`ModuleCat`, `IsRegularLocalRing`, `IsRegularRing`, `IsLocalization.AtPrime`.

**Checks.**
- `globalDimension_field`: a field has global dimension `0`.
- `globalDimension_dualNumbers`: `k[ε]/(ε²)` has infinite global dimension and is not regular.
- `localization_prime_example`: the localization of the regular local ring `k[x, y]_(x, y)` at the
  prime `(x)` is the discrete valuation ring `k[x, y]_(x)`.

### 0.4 The ramification, non-étale and branch loci

For `f : X ⟶ Y`, define three sets, each in the vocabulary of Convention 3:

- `Scheme.Hom.ramificationLocus f : Set X`, the points `x` with `(f.stalkMap x).hom` not formally
  unramified: the points at which `f` is not unramified.
- `Scheme.Hom.nonEtaleLocus f : Set X`, the points `x` with no open `U ∋ x` such that
  `Etale (U.ι ≫ f)`: the complement of the points at which `f` is étale in the sense of Stacks,
  Definition 29.37.1 (02GI).
- `Scheme.Hom.branchLocus f : Set Y`, the image `f '' f.ramificationLocus`: the points of `Y` over
  which `f` is ramified at some point.

*Choice of notions.* A search of the Stacks Project for "branch locus" and "ramification locus"
finds no definition of these sets; the Project uses the terms in two senses. In Section 58.21
(Purity of branch locus), the proof of Lemma 58.21.2 (0BJH) works with the discriminant of a finite
locally free morphism (Discriminants, Section 49.3), a locally principal closed subscheme of `Y`.
Lemma 49.3.1 (0BJF) says only that a finite locally free morphism is étale iff its discriminant is
empty; applied over the opens of `Y`, and with étale equivalent to unramified for flat `f`, it
shows that the points of the discriminant are the `y'` over which `f` is ramified (not unramified,
Definition 29.36.1 (02G4)) at some point. In Sections 58.28 and 58.29, "ramification locus" means the
complement of the étale points: Lemma 58.28.3 (0EA4) assumes étaleness in codimension one, and
Theorem 58.29.3 (0ECD) concerns "the maximal open subscheme where `f` is étale". SGA 1, Exposé X,
Théorème 3.1 takes the set of points where `f` is not étale and notes that under its hypotheses this
is the set where `f` is ramified (SGA 1, I 9.5 (ii)). This roadmap follows Section 58.21 and SGA 1:
`ramificationLocus` is the non-unramified locus, `branchLocus` is its image, and `nonEtaleLocus` is
kept as a separate set; the two loci in `X` coincide under the hypotheses of purity (§2.3,
`ramificationLocus_eq_nonEtaleLocus`) and differ in general (Checks).

Prove `Scheme.Hom.ramificationLocus_eq_stacks` (accompanying, Definition 29.36.1 (02G4)): for `f`
locally of finite type, `ramificationLocus f` is the set of `x` with no open `U ∋ x` such that
`LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)`; this is §0.1
`unramifiedAt_iff_stalkMap` pointwise. Prove the closedness statements: `isClosed_ramificationLocus`
for `f` locally of finite type (the unramified points form an open set, Stacks, Section 29.36
(02G3), the remark after Definition 29.36.1, with `ramificationLocus_eq_stacks`);
`isClosed_nonEtaleLocus` with no hypothesis (the étale points form an open set by Definition 29.37.1
(02GI)); `ramificationLocus_subset_nonEtaleLocus`; and `isClosed_branchLocus` for `f` finite (a
finite morphism is integral, hence universally closed, Lemma 29.45.7 (01WM)). Prove the affine
comparisons `ramificationLocus_spec`, `nonEtaleLocus_spec` and `branchLocus_spec`: for an
`R`-algebra `S`, with `f = Spec.map (CommRingCat.ofHom (algebraMap R S))`, `f.ramificationLocus =
(Algebra.unramifiedLocus R S)ᶜ`, `f.branchLocus = PrimeSpectrum.comap (algebraMap R S) ''
(Algebra.unramifiedLocus R S)ᶜ`, and, for `S` of finite presentation, `f.nonEtaleLocus =
(Algebra.etaleLocus R S)ᶜ`. The ramification comparison needs no finiteness: `R_𝔭 → S_𝔮` is formally
unramified iff `S_𝔮` is formally unramified over `R`, because `R → R_𝔭` is a localization.
*Needs:* §0.1; Mathlib `Scheme.Hom.stalkMap`, `FormallyUnramified`, `Etale`, `IsFinite`,
`Scheme.Hom.isClosedMap`, `Algebra.unramifiedLocus`, `Algebra.etaleLocus`,
`Algebra.isOpen_unramifiedLocus`, `Algebra.isOpen_etaleLocus`,
`Algebra.basicOpen_subset_etaleLocus_iff_etale`, `PrimeSpectrum.comap`.

**Checks.**
- `test_ramificationLocus_ne_nonEtaleLocus`: the closed immersion `Spec k ⟶ 𝔸¹_k` at the origin is
  unramified and not flat, so its ramification locus is empty and its non-étale locus is the point.
- `test_ramificationLocus_frobenius`: over a field `k` of characteristic `p > 0`, the relative
  Frobenius `𝔸¹_k ⟶ 𝔸¹_k`, `t ↦ tᵖ`, is finite and dominant between regular integral schemes and its
  ramification locus is all of `𝔸¹_k`; this is why §2.3 assumes the ramification locus is not
  everything.
- `test_branchLocus_square`: over a field of characteristic `≠ 2`, `𝔸² ⟶ 𝔸²`,
  `(x, y) ↦ (u, v) = (x², y)`, has ramification locus `V(x)` and branch locus `V(u)`.

## Layer 1: étale localization

### 1.1 Elementary étale neighbourhoods and étale-local properties

Prove `exists_elementaryEtale_finite_of_isolated` (Stacks, Lemma 37.41.1 (02LK)), with the
elementary étale neighbourhood written as an étale `φ : U ⟶ S` and `u : U` with `φ u = s` and
`φ.residueFieldMap u` an isomorphism: for `f : X ⟶ S` locally of finite type and `x` with
`f.QuasiFiniteAt x` and `f x = s`, there are such `(U, u)` and an open `V` of `pullback f φ` finite
over `U` with a unique point `v` over `u`, mapping to `x`, with `κ(x) ≅ κ(v)`, and the property
persists under further elementary étale neighbourhoods. Mathlib's
`Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq` (00UJ) is its affine input. Prove
`etale_of_etale_comp_surjective` (Stacks, Lemma 35.31.1 (036W)): being étale is étale local on the
source; that is, for an étale surjective `g : X' ⟶ X`, `f` is étale iff `g ≫ f` is.
*Needs:* §0.1; Mathlib `Etale`, `Surjective`, `Scheme.Hom.QuasiFiniteAt`,
`Algebra.exists_etale_isIdempotentElem_forall_liesOver_eq`, `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)`,
`Scheme.Hom.residueFieldMap`.

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
of `x` on which `f` is locally of finite type, with §0.1 translating the hypotheses. Prove the
affine form `Algebra.isEtaleAt_of_purity`: for a Noetherian ring `R`, a finite-type `R`-algebra `S`
and a prime `𝔮` of `S` with `Localization.AtPrime 𝔮` a normal domain,
`Localization.AtPrime (𝔮.under R)` regular, `Algebra.QuasiFiniteAt R 𝔮`,
`𝔮.height = (𝔮.under R).height ≥ 1` and `Algebra.IsUnramifiedAt R 𝔮'` for every prime `𝔮' ≤ 𝔮`
of height one, `Algebra.IsEtaleAt R 𝔮`. The proof follows Stacks: induction on the dimension; the
case of dimension one uses that a regular local ring of dimension one is a discrete valuation ring;
in dimension `≥ 2`, §1.1, §0.2 and ModularCurves §4D reduce to a finite morphism with one point over `y`, base change
to `Spec 𝒪_{Y,y}` reduces to a finite local homomorphism of local rings, going down and the
dimension formula give the induction hypothesis on the punctured spectrum (localizations of a
regular local ring are regular by §0.3 `isRegularLocalRing_localization`), and LocalPurity §2.1
concludes (a normal local domain finite and injective over `A` is torsion free).
*Needs:* §§0.1, 0.2, 0.3, 1.1; LocalPurity §2.1; SchemeAndStackFoundations §4.13
(`IsRegular.isNormal`); ModularCurves §4D (invariance of regularity and dimension under étale
morphisms); Tau Ceti
`TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`; Mathlib
`Scheme.Hom.QuasiFiniteAt`, `Algebra.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.HasGoingDown`,
`Ideal.height`.

**Checks.**
- `test_purity_needs_regular`: over a field of characteristic `≠ 2`, the quotient map
  `𝔸² → Spec k[x², xy, y²]` is finite, has normal source and normal non-regular target, is étale
  at every codimension-one point of the source and is not étale at the origin.
- `test_purity_needs_codimOne`: over a field of characteristic `≠ 2`, `𝔸² → 𝔸²`,
  `(x, y) ↦ (x², y)` is finite between regular schemes, ramified along `x = 0`, and not étale at
  the origin.

### 2.2 The global corollary

Prove `Scheme.Hom.etale_of_etaleAt_codimOne` (*API*): a finite dominant morphism `f : X ⟶ Y` from
a normal integral locally Noetherian scheme to a regular integral locally Noetherian scheme that
is **generically étale** is étale iff `(f.stalkMap x).hom` is formally unramified at every point
`x` with `ringKrullDim (X.presheaf.stalk x) = 1`. Generically étale means that the finite extension
of function fields is separable, equivalently that `f` is étale at the generic point of `X`. It
handles the local-dimension-zero point, which 0BMB does not cover; §2.1 applies at the remaining
points after the codimension-one and dimension-equality inputs are supplied. Without this
hypothesis the statement fails for the purely inseparable extension
`𝔽_p(t) ⊂ 𝔽_p(t)[u]/(uᵖ - t)`: both spectra are zero-dimensional, so the codimension-one condition
is vacuous, but the map is not étale.
*Needs:* §2.1.

### 2.3 Purity of the ramification and branch loci

This section derives from 0BMB the classical formulation of SGA 1, Exposé X, Théorème 3.1: for
`f : X → Y` quasi-finite and dominant between integral schemes, `X` normal and `Y` regular and
locally Noetherian, the set of points of `X` where `f` is not étale, if it is not all of `X`, has
codimension one at each of its points (each irreducible component has generic point `z` with
`dim 𝒪_{X,z} = 1`). No Stacks tag states this form; Lemma 58.28.3 (0EA4, purity of ramification
locus, attributed there to Gabber) is a different statement (no quasi-finiteness, étaleness in
codimension one assumed) and is not a target here. Throughout, the hypotheses are: `Y` locally
Noetherian, `X` and `Y` integral, `f` locally of finite type, `LocallyQuasiFinite f`,
`IsDominant f`, every stalk of `X` integrally closed, every stalk of `Y` a regular local ring.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite` (*API*): under these hypotheses
(normality of `X` not needed), `ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk
(f x))` for every `x`. Proof sketch. On affine opens `Spec S → Spec R` with `S` of finite type over
`R`, `x = 𝔮` over `𝔭`, the map `R → S` is injective (`f` dominant, `X` and `Y` integral). By
Zariski's main theorem (Mathlib `Algebra.ZariskisMainProperty.of_finiteType`, Stacks, Theorem
10.123.12 (00Q9)), `S_𝔮` is a localization of the integral closure `R'` of `R` in `S`, a domain
integral over `R`; as `R_𝔭` is a normal domain (SchemeAndStackFoundations §4.13
`IsRegular.isNormal`), going down holds for `R_𝔭 → S_𝔮` (Mathlib `Algebra.HasGoingDown`, Stacks
00H8). The dimension formula under going down (Mathlib `@[stacks 00ON]`) and the zero-dimensional
fibre (`f.QuasiFiniteAt x`) give the equality. The same equality is the transcendence-degree-zero
case of the dimension formula of Stacks, Lemma 29.53.1 (02JU), `Y` being universally catenary
because regular local rings are Cohen–Macaulay (Lemma 10.106.3 (00NQ)) and Noetherian Cohen–Macaulay
rings are universally catenary (Lemma 10.105.9 (00NM)).

Prove `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` (*API*; SGA 1, I 9.5 (ii) in this setting):
under the hypotheses, `f.ramificationLocus = f.nonEtaleLocus`. Proof sketch. `⊆` is
`ramificationLocus_subset_nonEtaleLocus`. Conversely let `x` be unramified. If `x` is the generic
point, `f x` is the generic point of `Y` (dominance) and the stalk map is a formally unramified
homomorphism of fields, which is flat, so §0.1 `etaleAt_iff_stalkMap` gives étaleness at `x` (`f`
is locally of finite presentation since `Y` is locally Noetherian). Otherwise
`dim 𝒪_{X,x} ≥ 1`; by `isClosed_ramificationLocus` every generization of `x` is unramified, in
particular every codimension-one `x' ⤳ x`; with `ringKrullDim_stalk_eq_of_locallyQuasiFinite`
for the equality of dimensions, §2.1 (0BMB) gives étaleness at `x`. (A route avoiding 0BMB is
SGA 1, I 9.5 (ii): over a normal local ring, an injective unramified local homomorphism essentially
of finite type is étale; the stalk maps are injective because `f` is dominant and `X`, `Y` are
integral.)

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` (*API*; SGA 1, X 3.1):
under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every `z ∈ f.ramificationLocus` with no
proper generization in `f.ramificationLocus` has `ringKrullDim (X.presheaf.stalk z) = 1`. Since
the ramification locus is closed (§0.4) and `X` is sober, such `z` are exactly the generic points
of its irreducible components. Proof sketch. `z` is not the generic point `η` of `X`: otherwise
the closed set `f.ramificationLocus` contains `η`, hence is `X`. So `d = dim 𝒪_{X,z} ≥ 1`. Suppose
`d ≥ 2`. A codimension-one `x' ⤳ z` is a proper generization of `z` (dimensions differ), so
`x' ∉ f.ramificationLocus` by maximality, and §2.1 (0BMB), with
`ringKrullDim_stalk_eq_of_locallyQuasiFinite`, makes `f` étale at `z`, contradicting
`z ∈ f.ramificationLocus`. Hence `d = 1`.

Prove `Scheme.Hom.ringKrullDim_stalk_eq_one_of_maximal_branchLocus` (*API*; the classical purity
of the branch locus): under the hypotheses and `f.ramificationLocus ≠ Set.univ`, every
`w ∈ f.branchLocus` with no proper generization in `f.branchLocus` has
`ringKrullDim (Y.presheaf.stalk w) = 1`. Proof sketch. Write `w = f z` with `z` ramified. The
generizations of `z` are the primes of the Noetherian local ring `𝒪_{X,z}`, so among those in
`f.ramificationLocus` there is one, `z₀`, of least dimension; it has no proper generization in the
ramification locus. Then `f z₀ ⤳ w` and `f z₀ ∈ f.branchLocus`, so `f z₀ = w` by maximality of
`w`, and `dim 𝒪_{Y,w} = dim 𝒪_{X,z₀} = 1` by `ringKrullDim_stalk_eq_of_locallyQuasiFinite` and the
previous target. With `isClosed_branchLocus`: for `f` finite, under the hypotheses of this
section and `f.ramificationLocus ≠ Set.univ`, the branch locus is a closed subset of `Y` that is
empty or of pure codimension one. (Without `f.ramificationLocus ≠ Set.univ` this fails: the branch
locus of the relative Frobenius of `𝔸¹`, `test_ramificationLocus_frobenius`, is all of `𝔸¹`.)
*Needs:* §§0.1, 0.4, 2.1; Mathlib `IsIntegral`, `IsDominant`, `LocallyQuasiFinite`,
`LocallyOfFiniteType`, `IsLocallyNoetherian`, `IsRegularLocalRing`, `IsIntegrallyClosed`,
`ringKrullDim`, `Specializes`, `Algebra.ZariskisMainProperty.of_finiteType`,
`Algebra.HasGoingDown`, the `@[stacks 00ON]` dimension formula; SchemeAndStackFoundations §4.13
(`IsRegular.isNormal`).

**Checks.**
- `test_purity_branchLocus_square`: for `𝔸² → 𝔸²`, `(x, y) ↦ (u, v) = (x², y)` in
  characteristic `≠ 2`, the ramification and non-étale loci are both `V(x)` and the branch locus
  `V(u)` is irreducible of codimension one.
- `test_purity_branchLocus_needs_regular`: for `𝔸² → Spec k[x², xy, y²]` in characteristic `≠ 2`,
  the ramification locus is the origin, of codimension two, so the regularity of `Y` cannot be
  dropped.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Accompanying*: a Stacks-form
restatement of a target. *API*: no Stacks counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 0.1 | `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap`, `etaleAt_spec_iff` | 29.36.1 (02G4), 29.37.1 (02GI), 29.37.15 (02GU) | equivalence |
| 0.1 | `quasiFiniteAt_of_appLE` | 29.21.1 (01TD) | equivalence |
| 0.2 | `isNormalDomain_iff_of_etale` | 41.19.7 (025P) | exact |
| 0.3 | `globalDimension` | 10.109.10 (00O6) | exact |
| 0.3 | `globalDimension_le_iff` | 10.109.12 (065T) | exact |
| 0.3 | `globalDimension_le_iff_hasProjectiveDimensionLE` | 10.109.10 (00O6) | comparison API for #908 E1.6 |
| 0.3 | `projectiveDimension_localization_le`, `globalDimension_localization_le` | 10.109.13 (00O8) | exact |
| 0.3 | `Module.free_of_quotSMulTop_free` | 10.106.5 (00NS) | exact |
| 0.3 | `IsRegularLocalRing.free_of_isCohenMacaulay` | 10.106.6 (00NT) | exact |
| 0.3 | `exists_resolution_maximalCohenMacaulay` | 10.104.9 (00NG) | exact |
| 0.3 | `IsRegularLocalRing.globalDimension_le` | 10.110.1 (00O7) | exact |
| 0.3 | `auslander_buchsbaum` | 10.111.1 (090V) | exact |
| 0.3 | `projectiveDimension_residueField_ge` | 10.110.3 (00OA) | exact |
| 0.3 | `projectiveDimension_residueField_le` | 10.110.4 (00OB) | exact |
| 0.3 | `isRegularLocalRing_tfae` | 10.110.5 (00OC) | exact |
| 0.3 | `isRegularLocalRing_iff_finite_globalDimension`, `isRegularLocalRing_localization` | 10.110.6 (0AFS) | exact |
| 0.3 | `isRegularRing_of_isRegularLocalRing` | — | API |
| 0.4 | `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | 29.36.1 (02G4), 29.37.1 (02GI); usage in 58.21.2 (0BJH), 58.28.3 (0EA4), 58.29.3 (0ECD) | definitions (no Stacks definition) |
| 0.4 | `ramificationLocus_eq_stacks` | 29.36.1 (02G4) | accompanying |
| 0.4 | `isClosed_ramificationLocus` | Section 29.36 (02G3), remark after 29.36.1 | API |
| 0.4 | `isClosed_nonEtaleLocus` | 29.37.1 (02GI) | API |
| 0.4 | `ramificationLocus_subset_nonEtaleLocus` | — | API |
| 0.4 | `isClosed_branchLocus` | 29.45.7 (01WM) | API |
| 0.4 | `ramificationLocus_spec`, `nonEtaleLocus_spec`, `branchLocus_spec` | — | API (Mathlib comparison) |
| 1.1 | `exists_elementaryEtale_finite_of_isolated` | 37.41.1 (02LK) | exact |
| 1.1 | `etale_of_etale_comp_surjective` | 35.31.1 (036W) | exact |
| 2.1 | `exists_etale_of_formallyUnramified_stalk_codimOne` | 58.21.4 (0BMB) | exact (stalk form) |
| 2.1 | `etaleAt_of_unramifiedAt_codimOne` | 58.21.4 (0BMB) | accompanying |
| 2.1 | `Algebra.isEtaleAt_of_purity` | 58.21.4 (0BMB) | affine form |
| 2.2 | `etale_of_etaleAt_codimOne` | — | API |
| 2.3 | `ringKrullDim_stalk_eq_of_locallyQuasiFinite` | 10.123.12 (00Q9), 10.38.7 (00H8), 10.112.7 (00ON); also 29.53.1 (02JU) with 00NQ, 00NM | API (derived) |
| 2.3 | `ramificationLocus_eq_nonEtaleLocus` | 58.21.4 (0BMB); SGA 1 I 9.5 (ii) | API (derived) |
| 2.3 | `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` | 58.21.4 (0BMB); SGA 1 X 3.1 | API (derived) |

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib, no `sorry`) contains a development of this material, built for the "PCF
all the way down" theorem. Paths are under `lean/Pcf/`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 2.1 | `zariskiNagataPurity` (affine), `isStacksEtaleAt_of_zariskiNagataPurity` (Stacks form), `exists_etale_of_zariskiNagataPurity` (scheme form) | `Stacks/Purity/Tag0BMA.lean`, `Stacks/Purity/Tag0BMBScheme.lean`, `Stacks/Purity/Tag0BMBSchemeAPI.lean` |
| 0.4, 2.3 | `Pcf.nonEtaleLocus` (affine only: `(Algebra.etaleLocus R S)ᶜ`), `Pcf.isClosed_nonEtaleLocus`, `Pcf.codim_eq_one_of_algebra` (codimension-one purity of the non-étale locus of `Spec S`, with the local form of 0BMB taken as a hypothesis) | `NonEtaleLocus.lean` |

## References

- The Stacks Project, Chapters 10 (Algebra), 29 (Morphisms), 35 (Descent), 37 (More on Morphisms),
  41 (Étale Morphisms), 49 (Discriminants and Differents) and 58 (Fundamental Groups of Schemes),
  https://stacks.math.columbia.edu.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Théorème 3.1
  (Zariski–Nagata purity) and Exposé I, Théorème 9.5.
- O. Zariski, *On the purity of the branch locus of algebraic functions*, Proc. Nat. Acad. Sci.
  U.S.A. 44 (1958), 791–796.
- M. Nagata, *On the purity of branch loci in regular local rings*, Illinois J. Math. 3 (1959).
