# Roadmap: purity of the branch locus

**Summary.** This roadmap proves Zariski–Nagata purity of the branch locus (Stacks, Lemma 58.21.4
(0BMB); SGA 1, Exposé X, Théorème 3.1): a morphism of locally Noetherian schemes that is
quasi-finite at a point `x` with normal source stalk and regular target stalk of the same
dimension `≥ 1`, and unramified at every codimension-one point specializing to `x`, is étale at
`x`. Globally: a finite dominant morphism from a normal integral scheme to a regular one is étale
as soon as it is étale in codimension one. The local input is purity for regular local rings,
from [LocalPurity](../LocalPurity/README.md); this roadmap supplies the pointwise vocabulary in
stalk form, étale localization of a quasi-finite morphism, the permanence of dimension, regularity
and normality under étale homomorphisms of local rings, and the reduction of 0BMB to the local
case. Mathlib has schemes, étale, unramified and quasi-finite morphisms, their stalk and affine
pointwise forms (`Scheme.Hom.QuasiFiniteAt`, `Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`), regular
local rings, going down and descent of étaleness along fpqc covers; it has neither 0BMB nor
étale localization of a quasi-finite morphism.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-pointwise-notions) | Pointwise notions | étale and unramified at a point in stalk form, the Stacks forms, permanence under étale homomorphisms of local rings |
| [1](#layer-1-étale-localization) | Étale localization | elementary étale neighbourhoods making a quasi-finite morphism finite, étaleness is étale local on the source |
| [2](#layer-2-purity-of-the-branch-locus) | Purity of the branch locus | 0BMB in scheme, Stacks and affine forms, the global corollary |

```text
Mathlib + Tau Ceti → Layer 0 → Layer 1 → Layer 2
LocalPurity §2.1 (0BMA) ────────────────────→ Layer 2
SchemeAndStackFoundations §§0.17, 4.13 ─────→ Layers 0, 2
```

The end theorems are `Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB, §2.1)
and `Scheme.Hom.etale_of_etaleAt_codimOne` (§2.2).

## Scope and ownership

**This roadmap owns** the stalk forms of "étale at `x`" and "unramified at `x`" and their
equivalence with Stacks' Definitions 29.36.1 (02G4) and 29.37.1 (02GI) and Lemma 29.37.15 (02GU);
the permanence of dimension, regularity and normality under étale homomorphisms of Noetherian local
rings (Étale Morphisms, Lemma 41.19.1 (039S), Propositions 41.19.4 (025N) and 41.19.7 (025P));
elementary étale localization of a morphism quasi-finite at a point (More on Morphisms, Lemma 37.41.1
(02LK)); étaleness is étale local on the source (Descent, Lemma 35.31.1 (036W)); and purity of the
branch locus (Lemma 58.21.4 (0BMB)) with its global corollary.

**Owned elsewhere and consumed here.**

- *Purity for regular local rings*: [LocalPurity](../LocalPurity/README.md) §2.1
  (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, Stacks 0BMA (2) with the torsion-free
  correction of LocalPurity Convention 5).
- *Regular local rings*: Mathlib `IsRegularLocalRing`; Tau Ceti `TauCeti.IsRegularLocalRing.isDomain`
  (00NP) and `TauCeti.IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one`;
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.17
  `isRegularLocalRing_localization` (Algebra, Lemma 10.110.6 (0AFS)) and §4.13 `IsRegular.isNormal`
  (Lemma 10.157.5 (0567)).
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
   `f.QuasiFiniteAt x`. §0.1 proves the two forms equivalent. No new predicate is introduced.
4. *Normal* for a local ring is `IsDomain` together with `IsIntegrallyClosed`; the dimension of a
   local ring is `ringKrullDim`; for a prime ideal it is `Ideal.height`.
5. An *étale homomorphism of local rings* `A → B` (Stacks, Definition 41.11.1 (0258)) is written
   in Mathlib's vocabulary as a local homomorphism of Noetherian local rings `A → B` with `B`
   `A`-isomorphic to `Localization.AtPrime 𝔮` for an étale `A`-algebra `C` and a prime `𝔮` of `C`.
6. Names: ring-level statements live in the `Algebra` and `IsLocalRing` namespaces; scheme-level
   statements in `AlgebraicGeometry.Scheme.Hom`. The suggested forms are in
   `TauCetiRoadmap.PurityOfBranchLocus`.

## Layer 0: pointwise notions

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

### 0.2 Permanence under étale homomorphisms of local rings

For an étale homomorphism of Noetherian local rings `A → B` (Convention 5), prove
`ringKrullDim_eq_of_etale` (Étale Morphisms, Lemma 41.19.1 (039S)): `ringKrullDim B = ringKrullDim A`;
`isRegularLocalRing_iff_of_etale` (Proposition 41.19.4 (025N)): `IsRegularLocalRing A ↔
IsRegularLocalRing B`; and `isNormalDomain_iff_of_etale` (Proposition 41.19.7 (025P)): `A` is a
normal domain iff `B` is.
*Needs:* Mathlib `Algebra.Etale`, `Module.FaithfullyFlat`, `IsRegularLocalRing`, `ringKrullDim`,
`IsIntegrallyClosed`; SchemeAndStackFoundations §4.13 (`serre_normality_criterion`).

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
in dimension `≥ 2`, §1.1 and §0.2 reduce to a finite morphism with one point over `y`, base change
to `Spec 𝒪_{Y,y}` reduces to a finite local homomorphism of local rings, going down and the
dimension formula give the induction hypothesis on the punctured spectrum (localizations of a
regular local ring are regular by `isRegularLocalRing_localization`), and LocalPurity §2.1
concludes (a normal local domain finite and injective over `A` is torsion free).
*Needs:* §§0.1, 0.2, 1.1; LocalPurity §2.1; SchemeAndStackFoundations §0.17
(`isRegularLocalRing_localization`), §4.13 (`IsRegular.isNormal`); Tau Ceti
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
a normal integral locally Noetherian scheme to a regular integral locally Noetherian scheme is
étale iff `(f.stalkMap x).hom` is formally unramified at every point `x` with
`ringKrullDim (X.presheaf.stalk x) = 1`.
*Needs:* §2.1.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Accompanying*: a Stacks-form
restatement of a target. *API*: no Stacks counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 0.1 | `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap`, `etaleAt_spec_iff` | 29.36.1 (02G4), 29.37.1 (02GI), 29.37.15 (02GU) | equivalence |
| 0.1 | `quasiFiniteAt_of_appLE` | 29.21.1 (01TD) | equivalence |
| 0.2 | `ringKrullDim_eq_of_etale` | 41.19.1 (039S) | exact |
| 0.2 | `isRegularLocalRing_iff_of_etale` | 41.19.4 (025N) | exact |
| 0.2 | `isNormalDomain_iff_of_etale` | 41.19.7 (025P) | exact |
| 1.1 | `exists_elementaryEtale_finite_of_isolated` | 37.41.1 (02LK) | exact |
| 1.1 | `etale_of_etale_comp_surjective` | 35.31.1 (036W) | exact |
| 2.1 | `exists_etale_of_formallyUnramified_stalk_codimOne` | 58.21.4 (0BMB) | exact (stalk form) |
| 2.1 | `etaleAt_of_unramifiedAt_codimOne` | 58.21.4 (0BMB) | accompanying |
| 2.1 | `Algebra.isEtaleAt_of_purity` | 58.21.4 (0BMB) | affine form |
| 2.2 | `etale_of_etaleAt_codimOne` | — | API |

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib, no `sorry`) contains a development of this material, built for the "PCF
all the way down" theorem. Paths are under `lean/Pcf/Stacks/`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 2.1 | `zariskiNagataPurity` (affine), `isStacksEtaleAt_of_zariskiNagataPurity` (Stacks form), `exists_etale_of_zariskiNagataPurity` (scheme form) | `Purity/Tag0BMA.lean`, `Purity/Tag0BMBScheme.lean`, `Purity/Tag0BMBSchemeAPI.lean` |

## References

- The Stacks Project, Chapters 29 (Morphisms), 35 (Descent), 37 (More on Morphisms), 41 (Étale
  Morphisms) and 58 (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X, Théorème 3.1
  (Zariski–Nagata purity).
- O. Zariski, *On the purity of the branch locus of algebraic functions*, Proc. Nat. Acad. Sci.
  U.S.A. 44 (1958), 791–796.
- M. Nagata, *On the purity of branch loci in regular local rings*, Illinois J. Math. 3 (1959).
