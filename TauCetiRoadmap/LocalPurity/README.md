# Roadmap: finite étale covers of punctured spectra and local purity

**Summary.** This roadmap proves purity for regular local rings (Stacks, Lemma 58.21.3 (0BMA);
SGA 2, Exposé X, Théorème 3.4 (i)): for a regular local ring `A` of dimension `≥ 2`, every finite
étale cover of the punctured spectrum of `A` extends to a finite étale cover of `Spec A`, and every
finite normal torsion-free `A`-algebra that is étale over the punctured spectrum is étale. It then
globalizes: over a Noetherian scheme, a finite étale cover of an open `U` extends across every
point of the complement at which purity holds (Stacks, Lemma 58.21.6 (0EY7)), and over a locally
Noetherian scheme it extends across a complement whose local rings are regular of dimension `≥ 2`
(SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i)). The route is that of Stacks, Sections
58.19–58.21: the anti-equivalence between finite étale covers of the punctured spectrum and finite
normal algebras, completion, full faithfulness of restriction to a hypersurface section, the local
Lefschetz extension theorem (Lemma 58.20.7 (0BLM)), and an induction on the dimension starting
from dimension two. Mathlib supplies schemes, finite and étale morphisms, regular local rings,
depth, adic completion and local cohomology. Tau Ceti supplies finite étale schemes over a base and
their base change, the punctured spectrum of a local ring and the notion of purity, the results on
sections over the punctured spectrum (Stacks, Lemmas 58.20.1 (0BM8) and 58.20.2 (0BLK)), the full
faithfulness half of Lemma 58.20.3 (0BM9), the commutative algebra of the dimension-two case
(miracle flatness, the discriminant criterion, and clause (2) of 0BMA in dimension two), and the
depth, normality and quotients of regular local rings that the induction uses.
SchemeAndStackFoundations supplies henselian pairs, local cohomology, formal completion and limits
of schemes.

| Layer | Title | What it delivers |
|---|---|---|
| [1](#layer-1-finite-étale-covers-of-punctured-spectra) | Finite étale covers of punctured spectra | the setting of the punctured spectrum, the anti-equivalence with finite normal algebras, completion, restriction to a hypersurface, the local Lefschetz extension theorem |
| [2](#layer-2-local-purity-and-extension) | Local purity and extension | purity for regular local rings, spreading out from a local scheme, extension across points where purity holds and across a regular complement of codimension `≥ 2` |

```text
Mathlib + Tau Ceti → Layer 1 → Layer 2
SchemeAndStackFoundations §§0.14, 2.7, 4.7–4.8 ──→ Layer 1 §§1.3–1.4
SchemeAndStackFoundations §0.9 ──────────────────→ Layer 2 §2.2
```

The end theorems are `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (0BMA, §2.1), `finiteEtale_extend_of_purity`
(0EY7, §2.2) and `finiteEtale_extend_of_regular_codimTwo` (§2.2).

## Scope and ownership

**This roadmap owns** the essential surjectivity half of Stacks, Lemma 58.20.3 (0BM9), with the
correction of Convention 5, and with it the anti-equivalence between finite étale covers of the
punctured spectrum of a Noetherian normal local domain of dimension `≥ 2` and finite normal
torsion-free algebras étale away from the closed point; Stacks, Lemmas 58.19.3 (0BLH), 58.20.4
(0BLL), 58.19.4 (0BLI), 58.17.1 (0EL8), 58.19.6 (0BM6), 58.19.7 (0BLJ), 58.20.6 (0BLS) and 58.20.7
(0BLM), and Algebraic and Formal Geometry, Lemma 52.15.5 (0EKS); purity for regular local rings
of every dimension `≥ 2`, both clauses of Lemma 58.21.3 (0BMA); spreading out from a local scheme
(Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)); the extension result 58.21.6 (0EY7); full
faithfulness of restriction to an open of a locally Noetherian scheme whose local rings off the
open have depth `≥ 2`; and extension across a complement whose local rings are regular of
dimension `≥ 2` (SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i); for a regular scheme,
SGA 1, Exposé X, Corollaire 3.3).

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier. The exact declarations are listed under the supplier contracts.

- *Finite étale schemes, the punctured spectrum and purity for a local ring* (Stacks, Section 58.5
  (0BL6) and Section 58.20 (0BM7)): Tau Ceti, with the restriction functor to the punctured
  spectrum, its faithfulness in positive dimension and its full faithfulness in depth `≥ 2`, and
  the comparison with Mathlib's `(@IsFinite ⊓ @Etale).Over ⊤ S`. §1.1 fixes the notation for them
  and records their behaviour in the degenerate cases.
- *Sections over the punctured spectrum and the first lemmas of Stacks, Section 58.20*: Tau Ceti
  proves Lemma 58.20.1 (0BM8) in affine form, which is all of it, because a scheme finite over
  `Spec A` is affine (Mathlib's `IsFinite` extends `IsAffineHom`); Lemma 58.20.2 (0BLK); and the
  full faithfulness half of Lemma 58.20.3 (0BM9), with torsion freeness.
- *Full faithfulness of restriction over an affine Noetherian base* to an open off which the local
  rings have depth `≥ 2`: Tau Ceti. §2.2 globalizes it.
- *Regular local rings*: Mathlib (`IsRegularLocalRing`, `IsRegularRing`); Tau Ceti (a regular
  local ring is a domain, 00NP; its quotient by an element of `𝔪 ∖ 𝔪²` is regular, 00NQ; it is a
  regular ring, 0AFS; a regular ring is integrally closed, 0567; its depth equals its dimension).
- *Depth, Cohen–Macaulay rings, Serre's criterion*: Mathlib's `IsLocalRing.depth`; Tau Ceti's
  Cohen–Macaulay notions, Serre's criterion (031S) and the depth bound for normal local domains.
- *The commutative algebra of the dimension-two case*: Tau Ceti owns miracle flatness (Algebra,
  Lemma 10.128.1 (00R4)), the discriminant criterion (Discriminants, Lemma 49.3.1 (0BJF), over any
  commutative base, with its fibre and localization forms) and clause (2) of 0BMA in dimension
  two, with torsion freeness. §2.1 starts its induction there.
- *The counterexample of Convention 5* (`A × A/𝔪`): Tau Ceti.
- *Henselian pairs, local cohomology, formal completion, limits of schemes*:
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§0.14, 2.7, 4.7–4.8 and 0.9.

Purity of the branch locus (Stacks 0BMB) and Abhyankar's lemma belong to the roadmaps listed under
Downstream consumers.

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses such as Noetherian, normal and regular are written on the statement
   that uses them, never folded into a definition.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result in a different form, the target cites the tag, carries Mathlib's `@[stacks XXXX]`
   attribute, and says how the two forms correspond; targets with no Stacks counterpart are marked
   *API*. Finite étale schemes over `S` are Tau Ceti's `TauCeti.FiniteEtaleScheme S`, and the
   restriction to an open `U` is `TauCeti.FiniteEtaleScheme.pullback U.ι`; Tau Ceti's
   `TauCeti.FiniteEtaleScheme.equivOver` and `TauCeti.FiniteEtaleScheme.pullbackCompEquivOver`
   transport every statement to Mathlib's `(@IsFinite ⊓ @Etale).Over ⊤ S`.
3. *Normal* is Stacks, Definition 10.37.11 (00GV), written in Mathlib's vocabulary: every
   localization at a prime is a domain and integrally closed,
   `∀ p : Ideal B, p.IsPrime → IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)`.
   For a local ring it is `IsDomain` together with `IsIntegrallyClosed`.
4. The dimension of a local ring `A` is `ringKrullDim A`; its depth is Mathlib's
   `IsLocalRing.depth (ModuleCat.of A A)`, written `depth A` (Stacks, Definition 10.72.1 (00LI)).
   Mathlib defines it by the vanishing of `Ext` groups; for a Noetherian local ring it is the
   supremum of the lengths of `A`-regular sequences in `𝔪`. In Layer 1 and §2.1, `(A, 𝔪)` is a
   Noetherian local ring, `X = Spec A` and `U = X ∖ {𝔪}` is Tau Ceti's
   `TauCeti.IsLocalRing.puncturedSpectrum A`.
5. **Finite normal algebras.** A *finite normal algebra* over a Noetherian local domain `A` is a
   finite `A`-algebra `B` that is normal (Convention 3) **and torsion free as an `A`-module**
   (Mathlib `Module.IsTorsionFree A B`), as in Tau Ceti's
   `TauCeti.IsLocalRing.finiteNormalPuncturedEtale`. Stacks, Lemma 58.20.3 (0BM9) and Lemma 58.21.3
   (0BMA), part (2), state no torsion-freeness condition, and as written both are false: for `A`
   normal local of dimension `≥ 2`, `B = A × A/𝔪` is finite and normal, `Spec B → Spec A` is étale
   over the punctured spectrum (its second factor lies over the closed point), and `B` is not flat
   over `A`; it is not `Γ(V, 𝒪_V)` for any finite étale `V` over the punctured spectrum. Torsion
   freeness removes exactly the factors supported at the closed point, and the Stacks proofs then
   apply unchanged. §1.2 and §2.1 state the corrected forms and record the counterexample as a
   Check.
6. Names: the headline theorems are in `TauCetiRoadmap.LocalPurity`, ring-level ones with the
   prefixes `IsLocalRing.` and `Algebra.`. Targets without a declaration in `Suggested.lean` are
   named in italics.

## Exact supplier contracts

**From Mathlib.**

- `Scheme`, `IsFinite` (which extends `IsAffineHom`, `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`),
  `Etale`, `IsNoetherian` and `IsLocallyNoetherian` (`Mathlib/AlgebraicGeometry/Noetherian.lean`),
  `Scheme.Opens`, `IsAffineOpen`, `MorphismProperty.Over`, `MorphismProperty.Over.pullback`, and
  `Scheme.Cover.glueMorphisms` (`Mathlib/AlgebraicGeometry/Gluing.lean`: morphisms out of the
  members of an open cover that agree on overlaps glue).
- `IsRegularLocalRing` (a Noetherian local ring whose maximal ideal needs `ringKrullDim` generators),
  `IsRegularRing` and `IsRegularLocalRing.of_isRegularRing_of_isLocalRing`
  (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`).
- `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean`), as in Convention 4.
- `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `localCohomology`
  (`Mathlib/Algebra/Homology/LocalCohomology.lean`).
- `Algebra.Etale`, `Algebra.IsEtaleAt` (the localization at the prime is formally étale),
  `Algebra.IsUnramifiedAt`, `Module.IsTorsionFree`, `Algebra.HasGoingDown`, and
  `IsIntegralClosure.finite` (`Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`: the integral
  closure of a Noetherian integrally closed domain in a finite separable extension of its fraction
  field is finite).

**From Tau Ceti.** Paths are under `TauCeti/`.

- `TauCeti.FiniteEtaleScheme S` (`AlgebraicGeometry/FiniteEtale/Basic.lean`): the full
  subcategory of `Over S` on the finite étale morphisms, Stacks' `FÉt_S`; its anti-equivalence
  with finite étale algebras over an affine base,
  `TauCeti.FiniteEtaleScheme.finiteEtaleCommAlgCatOpEquivFiniteEtaleScheme`. Base change
  `TauCeti.FiniteEtaleScheme.pullback` (`AlgebraicGeometry/FiniteEtale/Fiber.lean`). The comparison
  `TauCeti.FiniteEtaleScheme.equivOver` with Mathlib's `(@IsFinite ⊓ @Etale).Over ⊤ S` and its
  compatibility with base change `TauCeti.FiniteEtaleScheme.pullbackCompEquivOver`
  (`AlgebraicGeometry/FiniteEtale/MorphismProperty.lean`).
- `TauCeti.IsLocalRing.puncturedSpectrum` (Stacks 0BM7), with
  `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (for `s ⊆ A` with
  `(Ideal.span s).radical = maximalIdeal A`, the punctured spectrum is the union of the `D(x)`,
  `x ∈ s`), `TauCeti.IsLocalRing.isCompact_puncturedSpectrum` and
  `TauCeti.IsLocalRing.isCompact_puncturedSpectrum_of_fg_maximalIdeal`
  (`AlgebraicGeometry/PuncturedSpectrum.lean`).
- `TauCeti.IsLocalRing.restrictPunctured` and `TauCeti.IsLocalRing.PurityHolds A`, essential
  surjectivity of restriction to the punctured spectrum (Stacks 0BM7; the definition assumes only
  that `A` is local); `TauCeti.IsLocalRing.restrictPunctured_faithful_iff` (faithful exactly when
  `0 < ringKrullDim A`) and `TauCeti.IsLocalRing.restrictPunctured_faithful_of_one_le_depth`
  (`AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean`).
- `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` (Stacks 0BM8, affine
  form: for `B` Noetherian and integral over `A` with every localization at a maximal ideal of
  depth `≥ 2`, sections of `Spec B` over an open containing every prime not over `𝔪` are those of
  `B`), `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegrallyClosed` and
  `TauCeti.IsLocalRing.isIso_appTop_pullback_fst_puncturedSpectrum` (for `A` a Noetherian
  integrally closed local domain of dimension `≥ 2` and `B` finite, torsion free and normal at its
  maximal ideals, `B` is the ring of functions of the restriction of `Spec B` to the punctured
  spectrum) (`AlgebraicGeometry/PuncturedSpectrum/Sections.lean`).
- `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` (Stacks 0BLK: for `A` Noetherian local of
  depth `≥ 2`, a finite étale `V` over the punctured spectrum extends iff `Γ(V, 𝒪_V)` is finite
  étale over `A`) (`AlgebraicGeometry/FiniteEtale/Extension.lean`).
- `TauCeti.IsLocalRing.finiteNormalPuncturedEtale`, `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg`
  (finite normal torsion-free `A`-algebras étale at every prime not over `𝔪`, all `A`-algebra
  maps), the restriction functor `TauCeti.IsLocalRing.restrictPuncturedSpec` (`A` Noetherian) and
  `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` (Stacks 0BM9, full faithfulness, for `A`
  an integrally closed domain of dimension `≥ 2`) (`AlgebraicGeometry/FiniteEtale/FiniteNormal.lean`).
- `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` (for `R` Noetherian and an open
  `W ⊆ Spec R` with `depth R_𝔭 ≥ 2` at every prime `𝔭 ∉ W`, restriction to `W` is fully faithful)
  and `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepthOfIsLocalRing`
  (`AlgebraicGeometry/FiniteEtale/FullyFaithful.lean`).
- Regular local rings: the instance `TauCeti.IsRegularLocalRing.isDomain` (Stacks 00NP) and
  `TauCeti.IsRegularLocalRing.quotient_span_singleton` (00NQ for one generator: for
  `x ∈ 𝔪 ∖ 𝔪²`, `A ⧸ Ideal.span {x}` is regular) (`RingTheory/RegularLocalRing/Basic.lean`); the
  instance `TauCeti.isRegularRing_of_isRegularLocalRing` (0AFS: a regular local ring is a regular
  ring, `RingTheory/RegularLocalRing/ProjectiveDimension.lean`); the low-priority instance
  `TauCeti.IsRegularRing.isIntegrallyClosed` (0567, `RingTheory/RegularLocalRing/Normal.lean`,
  which must be imported for instance search to find it); and
  `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` and `TauCeti.IsRegularLocalRing.isCohenMacaulay`
  (`RingTheory/RegularLocalRing/CohenMacaulay.lean`).
- The depth bound `two_le_depth_of_isIntegrallyClosed`, declared in the namespace `IsLocalRing` (a
  Noetherian integrally closed local domain of dimension `≥ 2` has depth `≥ 2`,
  `RingTheory/CohenMacaulay/Normal.lean`); Serre's criterion
  `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two`
  (031S, `RingTheory/SerreCondition/Normal.lean`); `Module.IsCohenMacaulay` (00N3,
  `RingTheory/CohenMacaulay/Basic.lean`) and `TauCeti.Ring.IsCohenMacaulay` (0AAH,
  `RingTheory/CohenMacaulay/Ring.lean`).
- The dimension-two case: miracle flatness `TauCeti.Algebra.flat_of_isCohenMacaulay` (00R4; `S`
  need not be finite over `R`), `TauCeti.Algebra.flat_of_normal_dim_two` and
  `TauCeti.Algebra.free_of_normal_dim_two` (`RingTheory/RegularLocalRing/MiracleFlatness.lean`); the
  discriminant criterion `TauCeti.Algebra.etale_iff_traceForm_nondegenerate` (over a field),
  `TauCeti.Algebra.etale_iff_isUnit_discr` (0BJF, affine form over any commutative base) and
  `TauCeti.Algebra.isUnit_discr_localization_iff` (`RingTheory/Etale/Discriminant.lean`);
  `TauCeti.Algebra.etale_of_isUnramifiedAt_of_two_le_ringKrullDim` (a finite flat algebra over a
  Noetherian local ring of dimension `≥ 2`, unramified at every prime not over `𝔪`, is étale;
  `RingTheory/Etale/Purity.lean`); and `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`
  (0BMA (2) in dimension two: `B` finite, torsion free, normal at its maximal ideals and unramified
  at every prime not over `𝔪`; `RingTheory/RegularLocalRing/Purity.lean`).
- The counterexample of Convention 5, for `A` a local domain that is not a field:
  `TauCeti.IsLocalRing.isEtaleAt_prod_residueField`,
  `TauCeti.IsLocalRing.not_isTorsionFree_prod_residueField`,
  `TauCeti.IsLocalRing.not_flat_prod_residueField` and
  `TauCeti.IsLocalRing.not_etale_prod_residueField` (`RingTheory/Etale/ProdResidueField.lean`).

**From TauCetiRoadmap.SchemeAndStackFoundations.** §0.9 `finite_presentation_limits` (over a
cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps, schemes of
finite presentation, their morphisms and the properties finite and étale descend to a finite
stage); §0.14 *henselian_finiteEtale_equivalence* (More on Algebra, Lemma 15.13.2 (09ZL): for a
henselian pair `(R, I)`, base change is an equivalence from finite étale `R`-algebras to finite
étale `R/I`-algebras); §2.7 `depth_localCohomology_vanishing` (for `A` Noetherian and `M` finite,
`H^q_I(M) = 0` for `q` below the `I`-depth of `M`) and `localCohomology_module_comparison`;
§§4.7–4.8 formal completion along a closed subscheme and `CoherentFormalModule`. Assumed as stated
there.

## How to read the build

Layer 1 works over a fixed Noetherian local ring. §1.1 fixes the punctured spectrum, restriction
to it and the notion of purity, all Tau Ceti's, and records how they behave in the degenerate
cases; §1.2 completes the anti-equivalence between finite étale covers of the punctured spectrum
and finite normal algebras; §1.3 compares covers of `A`, of its completion and of a hypersurface
section; §1.4 extends covers from a hypersurface section. Layer 2 proves purity for regular local
rings by induction on the dimension, starting from Tau Ceti's dimension-two case, and globalizes it
over Noetherian and locally Noetherian schemes. The commutative algebra the induction uses
(miracle flatness, the discriminant criterion, depth and normality of regular local rings) is Tau
Ceti's and forms no layer here. Each subsection's *Needs:* line lists its inputs, so that a target
proved by another route is not blocked behind an unrelated section.

## Layer 1: finite étale covers of punctured spectra

### 1.1 The punctured spectrum and purity for a local ring

For a local ring `A`, `U` is `TauCeti.IsLocalRing.puncturedSpectrum A`, the complement of
`IsLocalRing.closedPoint A` in `Spec A` (Stacks, Section 58.20 (0BM7)). Restriction from finite
étale schemes over `X` to finite étale schemes over `U` is `TauCeti.IsLocalRing.restrictPunctured A`,
base change along the inclusion of `U`; a finite étale `V` over `U` *extends* if it lies in the
essential image of restriction; and *purity holds for `A`* is `TauCeti.IsLocalRing.PurityHolds A`,
essential surjectivity of restriction. The definition assumes only that `A` is local; Stacks
assumes `A` Noetherian, and every statement of this roadmap that uses purity is about a Noetherian
local ring. For `A` Noetherian, `U` is quasi-compact and is the union of the basic opens `D(x)` for
`x` in any set whose span has radical `𝔪`; restriction is faithful exactly when `dim A > 0`, and
fully faithful when `depth A ≥ 2`, in which case purity for `A` makes restriction an equivalence
(SGA 2, Exposé X, Définitions 3.1–3.2, where such an `A` is called *pur*).
*Needs:* Tau Ceti `TauCeti.IsLocalRing.puncturedSpectrum`,
`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`,
`TauCeti.IsLocalRing.isCompact_puncturedSpectrum_of_fg_maximalIdeal`,
`TauCeti.IsLocalRing.restrictPunctured`, `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.IsLocalRing.restrictPunctured_faithful_iff`,
`TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepthOfIsLocalRing`; Mathlib
`IsLocalRing.closedPoint`, `IsLocalRing.depth`.

**Checks.**
- For `A` a field, `U` is empty, the only finite étale scheme over `U` is empty, and purity holds;
  restriction is not faithful, since the two projections `A × A → A` give distinct morphisms of
  finite étale schemes over `Spec A` that agree over `U`. A definition of purity as an equivalence
  of categories (SGA 2's *pur*) would fail here, so the two notions differ in dimension zero.
- For `A = ℤ_(p)` with `p` odd, `U = Spec ℚ`, and `V = Spec ℚ(√p)` does not extend: an extension
  would be `Spec C` with `C` finite étale over `A`, hence a normal domain, finite over `A`, with
  fraction field `ℚ(√p)`, so `C = ℤ_(p)[√p]`; the discriminant of the basis `1, √p` is `4p`, not a
  unit of `A`, so `C` is not étale. Purity fails for this regular local ring of dimension one, and
  the bound `dim ≥ 2` of §2.1 cannot be lowered.
- For `A = k⟦x, y⟧`, `U = D(x) ∪ D(y)` is quasi-compact but not affine: `Γ(U, 𝒪_U) = A` because
  `depth A = 2`, so an affine `U` would be `Spec A`, which contains the closed point. A model of the
  punctured spectrum by the spectrum of its ring of functions would get this wrong.

### 1.2 Finite normal algebras

Prove *restrictPuncturedSpec_essSurj* (Stacks, Lemma 58.20.3 (0BM9), the essential surjectivity
half, **with the correction of Convention 5**): for `A` a Noetherian local ring that is an
integrally closed domain, the functor
`TauCeti.IsLocalRing.restrictPuncturedSpec A : (FiniteNormalPuncturedEtaleAlg A)ᵒᵖ ⥤ FiniteEtaleScheme U`
is essentially surjective. Stacks assumes `dim A ≥ 2` for the whole lemma; this half uses no bound
on the dimension (for `dim A = 0`, `U` is empty; for `dim A = 1`, see the Checks). Prove
*finiteNormalEquiv*: for such `A` of dimension `≥ 2`, the functor is an equivalence, by Tau Ceti's
`TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful`. It is an **anti-equivalence** between
finite étale schemes over `U` and finite normal algebras, since global sections reverses arrows,
and its quasi-inverse is global sections: a finite étale `V` over `U` is the restriction of
`Spec Γ(V, 𝒪_V)`, because the restriction of `Spec B` has `B` as its ring of functions
(`TauCeti.IsLocalRing.isIso_appTop_pullback_fst_puncturedSpectrum`). Moreover, `V` extends iff
`Γ(V, 𝒪_V)` is étale over `A`: `A` has depth `≥ 2` by Tau Ceti's depth bound for normal local
domains, `Γ(V, 𝒪_V)` is finite over `A` by the first part, and Tau Ceti's
`TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` applies. The route to essential
surjectivity is that of Stacks: `V` is normal, being étale over the normal `U`, so a finite
disjoint union of integral schemes, and the empty `V` is the restriction of `Spec 0`; for `V`
integral, its function field `L` is finite separable over the fraction field `K` of `A` (its
generic fibre is finite étale over `K`); the integral closure `B'` of `A` in `L` is finite
(`IsIntegralClosure.finite`), torsion free and normal; and for `0 ≠ f ∈ 𝔪`, `B'_f` is the ring
of functions on `V ×_U D(f)`, which is a normal domain finite over `A_f` with fraction field `L`.
As these `D(f)` cover `U` (`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`), `V` is the
restriction of `Spec B'`, and `B'` is étale over `A` at every prime not over `𝔪`.
*Needs:* Tau Ceti `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg`,
`TauCeti.IsLocalRing.restrictPuncturedSpec`, `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful`,
`TauCeti.IsLocalRing.isIso_appTop_pullback_fst_puncturedSpectrum`,
`TauCeti.IsLocalRing.extends_iff_sections_finiteEtale`,
`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`, the depth bound
`two_le_depth_of_isIntegrallyClosed`; Mathlib `IsIntegralClosure.finite`, `Algebra.IsEtaleAt`.

**Checks.**
- For `A = k⟦x, y⟧`, `A × A` is finite, torsion free, normal and étale over `A`, so it lies in
  `FiniteNormalPuncturedEtaleAlg A`; it restricts to `V = U ⊔ U`, and `Γ(V, 𝒪_V) = A × A`, since
  functions extend across the closed point, of depth two. So `V` is the restriction of
  `Spec Γ(V, 𝒪_V)` and extends.
- For `A = k⟦x, y⟧` with `char k ≠ 2`, `B = A[z]/(z² − x) ≅ k⟦z, y⟧` is finite, torsion free and
  normal, and its fraction field is separable over that of `A`, but `B` is excluded: at the prime
  `(z)`, which lies over `(x) ≠ 𝔪`, the maximal ideal of `A_(x)` generates `(z²)`, so `B` is
  ramified there. A definition asking only that `B` be generically étale over `A` would admit it.
- For `A = k⟦x, y⟧`, `A × A/𝔪` is finite and normal and is étale at every prime not over `𝔪`, but
  it is not torsion free and is excluded. It restricts to the trivial cover `U → U`, as `A` does,
  although `A × A/𝔪 ≇ A`; without torsion freeness restriction would not reflect isomorphisms and
  global sections would not be a quasi-inverse. It is not flat over `A`.
- For the discrete valuation ring `A = ℤ_(p)`, `p` odd, `U = Spec ℚ` and `V = Spec ℚ(√p)`: `V` is
  the restriction of `Spec ℤ_(p)[√p]`, an object of `FiniteNormalPuncturedEtaleAlg A` (a discrete
  valuation ring, since `x² − p` is Eisenstein), as essential surjectivity asserts in every
  dimension; but `Γ(V, 𝒪_V) = ℚ(√p)` is not finite over `A`, so global sections is a quasi-inverse
  only in dimension `≥ 2`.

### 1.3 Completion and restriction to a hypersurface

Fix `f ∈ 𝔪` and set `X_0 = Spec (A ⧸ Ideal.span {f})` with punctured spectrum `U_0` (Stacks,
Situation 58.19.1 (0BLF)); restriction from finite étale schemes over `U` to those over `U_0` is
base change along `U_0 → U`. Prove, each with the hypotheses and conclusion of its tag:
*finite_extend_of_completion* (Lemma 58.19.3 (0BLH)): with `Â` the `𝔪`-adic completion and `U′`,
`V′` the base changes to `Spec Â`, if `V → U` is finite and `V′` is the restriction of a scheme
`Y′` finite over `Spec Â`, then `V` is the restriction of a scheme `Y` finite over `X` with
`Y′ = Y ×_X Spec Â`; *extends_iff_completion_extends* (Lemma 58.20.4 (0BLL)): a finite étale `V`
over `U` is the restriction of a finite étale scheme over `X` iff `V′` is the restriction of a
finite étale scheme over `Spec Â`; *restrictHypersurface_fullyFaithful_of_completion* (Lemma
58.19.4 (0BLI)): if `(A, (f))` is a henselian pair and restriction from `U′` to `U′_0` over
`Spec Â` is fully faithful, then so is restriction from `U` to `U_0`;
*fullyFaithful_of_completion_coherent* (Lemma 58.17.1 (0EL8)): for a Noetherian scheme and a closed
subscheme along which completion is fully faithful on finite locally free coherent modules,
restriction of finite étale schemes to the closed subscheme is fully faithful;
*completion_fullyFaithful_of_localCohomology* (Algebraic and Formal Geometry, Lemma 52.15.5
(0EKS)): for `A` Noetherian and `f`-adically complete, `f ∈ 𝔞` and `H¹_𝔞(A)`, `H²_𝔞(A)`
annihilated by a power of `f`, completion along `f` is fully faithful on finite locally free
coherent modules on `Spec A ∖ V(𝔞)`; *restrictHypersurface_fullyFaithful_of_localCohomology*
(Lemma 58.19.6 (0BM6)): if `H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f` and
`(A, (f))` is a henselian pair, then restriction from finite étale schemes over `U` to finite
étale schemes over `U_0` is fully faithful; and *restrictHypersurface_fullyFaithful* (Lemma 58.19.7
(0BLJ)): the same for `depth A ≥ 3` and `(A, (f))` a henselian pair.
For *finite_extend_of_completion*, specialize formal module gluing along `A → Â` and a finite
principal-open cover of `U` (More on Algebra, Proposition 15.91.16 (05ER)); its monoidal and
finiteness preservation (Remark 15.91.20 (05EU)) descends the algebra structure and finite
module. The target here is the finite-morphism specialization, not a second general gluing
theory. For *completion_fullyFaithful_of_localCohomology*, use formal-section comparison (Algebraic
and Formal Geometry, Lemma 52.12.7 (0EII)) and its finite-locally-free completion criterion
(Lemma 52.15.1 (0EKP)); the §2.7 local-cohomology API supplies the vanishing hypotheses. For
*restrictHypersurface_fullyFaithful_of_localCohomology*, reduce to `A` complete by
*restrictHypersurface_fullyFaithful_of_completion* and combine 0EL8 with 0EKS; for
*restrictHypersurface_fullyFaithful*, `depth A ≥ 3` makes `H¹_𝔪(A)` and `H²_𝔪(A)` vanish.
*Needs:* Tau Ceti `TauCeti.IsLocalRing.puncturedSpectrum`, `TauCeti.FiniteEtaleScheme.pullback`;
SchemeAndStackFoundations §0.14 (henselian pairs), §2.7 (`depth_localCohomology_vanishing`,
`localCohomology_module_comparison`), §§4.7–4.8 (formal completion, `CoherentFormalModule`);
Mathlib `IsLocalRing.depth`, `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`,
`localCohomology`.

### 1.4 The local Lefschetz extension theorem

Prove *finiteEtale_extend_of_localCohomology* (Stacks, Lemma 58.20.6 (0BLS)): in Situation 58.19.1,
let `V` be finite étale over `U`; if `H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f` and
the restriction of `V` to `U_0` is the restriction of a finite étale `Y_0` over `X_0`, then `V` is
the restriction of a finite étale scheme over `X`. Prove *finiteEtale_extend_of_hypersurface*
(Stacks, Lemma 58.20.7 (0BLM)): the same conclusion with `depth A ≥ 3` in place of the
local-cohomology hypothesis. For 0BLS, reduce to the complete case by
*extends_iff_completion_extends*, lift `Y_0` along the henselian pair `(Â, fÂ)` by
SchemeAndStackFoundations §0.14 *henselian_finiteEtale_equivalence*, and identify the two covers of
`U` by *restrictHypersurface_fullyFaithful_of_localCohomology* (§1.3). For 0BLM, `depth A ≥ 3`
makes `H¹_𝔪(A)` and `H²_𝔪(A)` vanish (SchemeAndStackFoundations §2.7
`depth_localCohomology_vanishing`), and 0BLS applies.
*Needs:* §1.3; SchemeAndStackFoundations §§0.14, 2.7; Mathlib `IsLocalRing.depth`.

### Examples

- For `A = k⟦x, y, z⟧` and `f = z`, `A` is complete, so `(A, (z))` is a henselian pair, and
  `depth A = 3`. Restriction from finite étale covers of `U` to those of `U_0`, the punctured
  spectrum of `k⟦x, y⟧`, is fully faithful (*restrictHypersurface_fullyFaithful*), and a cover of
  `U` whose restriction to `U_0` extends to `Spec k⟦x, y⟧` extends to `Spec A`
  (*finiteEtale_extend_of_hypersurface*).
- For `A` a complete normal local domain of dimension `≥ 3` and `0 ≠ f ∈ 𝔪`, the hypotheses of
  *finiteEtale_extend_of_localCohomology* hold even when `depth A = 2` (Stacks, the remark before
  Lemma 58.20.5 (0EK6)); this is the case 0BLS covers and 0BLM does not.
- For `A = k⟦x, y⟧`, the anti-equivalence of §1.2 sends the cover `U ⊔ U` to `A × A`. The
  restriction of `Spec A[z]/(z² − x)` to `U` is not a finite étale cover of `U`, being ramified
  along the curve `x = 0`, which matches the exclusion of `A[z]/(z² − x)` from
  `FiniteNormalPuncturedEtaleAlg A`.

### Dependencies

Tau Ceti: finite étale schemes and their base change, the punctured spectrum, restriction and
purity, the sections results (0BM8, 0BLK), the full faithfulness half of 0BM9 and the depth bound
for normal local domains. Mathlib: integral closure in a finite separable extension, depth, adic
completion and local cohomology. SchemeAndStackFoundations §§0.14 (henselian pairs and their finite
étale algebras), 2.7 (local cohomology and its vanishing below the depth) and 4.7–4.8 (formal
completion and coherent formal modules).

## Layer 2: local purity and extension

### 2.1 Purity for regular local rings

Prove `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (Stacks, Lemma 58.21.3 (0BMA); clause (1) is
SGA 2, Exposé X, Théorème 3.4 (i)): for `A` regular local of dimension `d ≥ 2`, (1)
`TauCeti.IsLocalRing.PurityHolds A`; (2) **with the correction of Convention 5**, every finite
`A`-algebra `B` that is torsion free and normal, with `Algebra.IsEtaleAt A 𝔮` for every prime `𝔮`
of `B` not lying over `𝔪`, satisfies `Algebra.Etale A B`. SGA 1, Exposé X, Corollaire 3.2 is the
form of clause (2) for a local `B` quasi-finite over `A`, which applies to the localizations of `B`
at its maximal ideals; it is stated there as a form of the purity theorem and proved there only
for `d = 2`.
A regular local ring is an integrally closed domain (the Tau Ceti instances
`TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.isRegularRing_of_isRegularLocalRing` and
`TauCeti.IsRegularRing.isIntegrallyClosed`), so for each `d` the two clauses are equivalent:
(2) ⇒ (1) because a finite étale `V` over `U` is the restriction of `Spec B` for a finite normal
`B` (*restrictPuncturedSpec_essSurj*, §1.2), which is étale by (2), so `Spec B` extends `V`; and
(1) ⇒ (2) because the restriction of `Spec B` extends by (1) to `Spec C` with `C` finite étale,
hence finite normal and torsion free, and Tau Ceti's
`TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` gives `B ≅ C`. The proof is by
induction on `d`, as in Stacks. For `d = 2`, (2) is Tau Ceti's
`TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`, whose hypotheses (normality at the
maximal ideals of `B`, unramifiedness at the primes not over `𝔪`) follow from those of (2). For
`d ≥ 3`, an element `f ∈ 𝔪 ∖ 𝔪²` gives `A ⧸ Ideal.span {f}` regular of dimension `d − 1 ≥ 2`
(`TauCeti.IsRegularLocalRing.quotient_span_singleton`); `A` has depth `d ≥ 3`
(`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`); clause (1) for `A ⧸ Ideal.span {f}`, the
induction hypothesis, extends the restriction of a cover `V` of `U` to `U_0`, and
*finiteEtale_extend_of_hypersurface* (§1.4) extends `V`.
*Needs:* §§1.2, 1.4; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful`,
`TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`,
`TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`,
`TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.isRegularRing_of_isRegularLocalRing`,
`TauCeti.IsRegularRing.isIntegrallyClosed`; Mathlib `IsRegularLocalRing`, `Algebra.Etale`,
`Algebra.IsEtaleAt`.

**Checks.**
- For `A = k⟦x, y⟧` and `B = A × A/𝔪`, `B` is finite and normal, étale at every prime not lying
  over `𝔪`, and not étale over `A`; clause (2) excludes it by torsion freeness, and without that
  hypothesis clause (2) would be false.
- Over a field `k` of characteristic `≠ 2`, for `A = k[x², xy, y²]` localized at the origin, the
  cover given by `k[x, y]` localized at the origin is finite étale over the punctured spectrum
  (the involution `(x, y) ↦ (−x, −y)` acts freely off the origin) and does not extend to a finite
  étale cover of `Spec A`; so purity fails for this normal, non-regular local ring of dimension
  two, and regularity cannot be weakened to normality.
- For `A = ℤ_(p)` (`d = 1`) and `B = ℤ_(p)[√p]`, `B` is a discrete valuation ring (`x² − p` is
  Eisenstein), finite and torsion free over `A`, and étale over the punctured spectrum `Spec ℚ`
  since `ℚ(√p)/ℚ` is separable; the discriminant of the basis `1, √p` is `4p`, not a unit, so `B` is
  not étale over `A` and the bound `d ≥ 2` cannot be lowered in clause (2) either.

### 2.2 Spreading out and extension across points where purity holds

Prove *spread_from_localScheme* (Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)): for a scheme
`S`, a retrocompact open `U ⊆ S` and `s ∉ U`, with `V = Spec 𝒪_{S,s} ×_S U`, finitely presented
schemes over `U` and over `Spec 𝒪_{S,s}` whose restrictions to `V` are isomorphic glue to a finitely
presented scheme over an open `U' ⊇ U ∪ {s}`, uniquely up to shrinking `U'`; and if both are
separated, proper, finite or étale, the glued scheme has the same property after shrinking `U'`.
The proof applies SchemeAndStackFoundations §0.9 `finite_presentation_limits` to `Spec 𝒪_{S,s}` as
the limit of its affine open neighbourhoods. Prove `finiteEtale_extend_of_purity` (Stacks, Lemma
58.21.6 (0EY7)): for a Noetherian scheme `X` and an open `U ⊆ X` with
`TauCeti.IsLocalRing.PurityHolds 𝒪_{X,x}` for every `x ∉ U`, restriction from finite étale schemes
over `X` to finite étale schemes over `U` is essentially surjective. The proof is Noetherian
induction on the complement: at the generic point `x` of an irreducible component of `X ∖ U`, the
preimage of `U` in `Spec 𝒪_{X,x}` is its punctured spectrum, purity extends the cover there, and
*spread_from_localScheme* extends it to a larger open. Prove *restrictOpen_fullyFaithful_of_depth*
(*API*): for a locally Noetherian scheme `X` and an open `U` with `depth 𝒪_{X,x} ≥ 2` for every
`x ∉ U`, restriction from finite étale schemes over `X` to finite étale schemes over `U` is fully
faithful. Over an affine open `Spec R` this is Tau Ceti's
`TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`, the stalk of `Spec R` at `𝔭` being
`R_𝔭`; the uniqueness of extended morphisms makes them agree on overlaps, and they glue over an
affine open cover (`Scheme.Cover.glueMorphisms`). Prove `finiteEtale_extend_of_regular_codimTwo`
(*API*; SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i), the essential surjectivity half of
the equivalence stated there; for `X` regular it is SGA 1, Exposé X, Corollaire 3.3, whose
hypothesis that `X ∖ U` has codimension `≥ 2` makes every local ring along it of dimension `≥ 2`):
for a locally Noetherian scheme `X` and an open `U` such that `𝒪_{X,x}` is a regular local ring of
dimension `≥ 2` for every `x ∉ U`, restriction is essentially surjective. On each affine open it is
`finiteEtale_extend_of_purity` with `IsLocalRing.purityHolds_of_isRegularLocalRing`, and the local
extensions glue by *restrictOpen_fullyFaithful_of_depth*, since a regular local ring of dimension
`d` has depth `d` (`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`).
*Needs:* §2.1; SchemeAndStackFoundations §0.9; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.FiniteEtaleScheme.pullback`, `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`,
`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`; Mathlib `IsNoetherian`, `IsLocallyNoetherian`,
`Scheme.Opens`, `IsAffineOpen`, `Scheme.Cover.glueMorphisms`, `IsLocalRing.depth`.

**Checks.**
- For `X = Spec ℤ_(p)` and `U` its generic point, purity fails at the closed point (the cover
  `Spec ℚ(√p)` of `U` has the ramified normalization `ℤ_(p)[√p]`), and the cover does not extend;
  the purity hypothesis at the points outside `U` cannot be dropped.
- For `X = 𝔸²_k` and `U = 𝔸²_k ∖ {0}`, the local ring at the origin is regular of dimension two, so
  every finite étale cover of `U` extends to `X`; with the full faithfulness of
  *restrictOpen_fullyFaithful_of_depth*, `U` and `X` have equivalent categories of finite étale
  covers.
- For `U = X`, restriction is the identity up to the isomorphism `Y ×_X X ≅ Y`, and both
  extension statements hold with no hypothesis on points.

### Examples

- For `A = k⟦x, y, z⟧` the induction of §2.1 runs once: with `f = z`, `A ⧸ Ideal.span {z} = k⟦x, y⟧`
  is regular of dimension two, where purity is the base case, and `depth A = 3`, so
  *finiteEtale_extend_of_hypersurface* extends every finite étale cover of the punctured spectrum
  of `A`.
- For `X = 𝔸³_k` and `U = X ∖ L` with `L` a line, the local ring of `X` at the generic point of `L`
  is regular of dimension two and at a closed point of `L` regular of dimension three, so every
  finite étale cover of `U` extends to `X` (`finiteEtale_extend_of_regular_codimTwo`).
- For `X = 𝔸²_k` with `char k ≠ 2` and `U` the complement of the line `x = 0`, the cover of `U`
  given by `t² = x` is finite étale and does not extend: its normalization over `X` is ramified
  along `x = 0`. The local ring of `X` at the generic point of that line has dimension one, so
  neither extension theorem applies.

### Dependencies

Layer 1 (§§1.2 and 1.4). Tau Ceti: purity for a local ring, base change of finite étale schemes,
full faithfulness of restriction over an affine Noetherian base, the dimension-two case of 0BMA
and the facts on regular local rings listed in the supplier contracts. SchemeAndStackFoundations
§0.9 (finitely presented schemes over a limit). Mathlib: Noetherian and locally Noetherian schemes,
affine opens and gluing of morphisms.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Adapted*: same mathematics
in a different packaging, with the difference stated at the target. *Corrected*: the tag as
written is false and the target adds the missing hypothesis (Convention 5). *API*: no Stacks
counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 1.2 | *restrictPuncturedSpec_essSurj* | 58.20.3 (0BM9), essential surjectivity | corrected; no dimension bound |
| 1.2 | *finiteNormalEquiv* | 58.20.3 (0BM9) | corrected |
| 1.3 | Situation | 58.19.1 (0BLF) | exact |
| 1.3 | *finite_extend_of_completion* | 58.19.3 (0BLH) | exact |
| 1.3 | *extends_iff_completion_extends* | 58.20.4 (0BLL) | exact |
| 1.3 | *restrictHypersurface_fullyFaithful_of_completion* | 58.19.4 (0BLI) | exact |
| 1.3 | *fullyFaithful_of_completion_coherent* | 58.17.1 (0EL8) | exact |
| 1.3 | *completion_fullyFaithful_of_localCohomology* | 52.15.5 (0EKS) | exact |
| 1.3 | *restrictHypersurface_fullyFaithful_of_localCohomology* | 58.19.6 (0BM6) | exact |
| 1.3 | *restrictHypersurface_fullyFaithful* | 58.19.7 (0BLJ) | exact |
| 1.4 | *finiteEtale_extend_of_localCohomology* | 58.20.6 (0BLS) | exact |
| 1.4 | *finiteEtale_extend_of_hypersurface* | 58.20.7 (0BLM) | exact |
| 2.1 | `IsLocalRing.purityHolds_of_isRegularLocalRing` | 58.21.3 (0BMA) (1) | exact |
| 2.1 | `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | 58.21.3 (0BMA) (2) | corrected, affine |
| 2.2 | *spread_from_localScheme* | 32.20.3 (0BQ5), 32.20.4 (0EY3) | exact |
| 2.2 | `finiteEtale_extend_of_purity` | 58.21.6 (0EY7) | exact |
| 2.2 | *restrictOpen_fullyFaithful_of_depth*, `finiteEtale_extend_of_regular_codimTwo` | — | API |

## Downstream consumers

- [PurityOfBranchLocus](../PurityOfBranchLocus/README.md) §2.1 consumes §2.1
  (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`) for purity of the branch locus (Stacks
  0BMB).
- [AbhyankarLemma](../AbhyankarLemma/README.md) Layer 2 consumes §2.1 and §2.2
  (*spread_from_localScheme*, `finiteEtale_extend_of_purity`, `finiteEtale_extend_of_regular_codimTwo`)
  for the extension of covers unramified or tamely ramified in codimension one and for Abhyankar's
  lemma (Stacks 0EYE–0EYH).
- PurityForFlatCohomology consumes §1.3 (*extends_iff_completion_extends*) and §§2.1–2.2.

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib), built for the "PCF all the way down" theorem, contains a development of
this material; Tau Ceti's punctured spectrum, purity, sections and full faithfulness modules are
ported from it. Paths are under `library/Pcf/Stacks/Purity/` at commit `d28f90d`.

| § | Existing declarations | Files |
| --- | --- | --- |
| 1.2 | `finiteNormalAlgebraToPuncturedCover_essSurj`, `puncturedFiniteEtaleCoverEquivalence` (0BM9) | `Tag0BM9Equivalence.lean` |
| 1.4 | 0BLM for complete regular local rings | `HypersurfaceLiftingComplete.lean` |
| 2.1 | `puncturedSpectrumPurity_of_isRegularLocalRing`, `finiteNormalPuncturedEtalePurity_of_isRegularLocalRing` (0BMA, (2) corrected) | `Tag0BMA.lean`, `Tag0BMAClauses.lean` |

Its proof of 0BMA differs from Stacks': it proves clause (1) for complete regular local rings by
induction on the dimension, with an elementary formal lifting in place of the local-cohomology
argument behind 0BLM (0BM6, 0EKS), and passes from `A` to its completion by a Hartogs and
faithfully flat descent argument in place of 0BLL and 0BLH.

## References

- The Stacks Project, Chapters 10 (Algebra), 15 (More on Algebra), 32 (Limits), 49 (Discriminants),
  52 (Algebraic and Formal Geometry) and 58 (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et
  globaux* (SGA 2), Exposé X: Définitions 3.1–3.2 (pure pairs and pure local rings), Proposition
  3.3 (purity of a pair is purity of the local rings along the closed subset) and Théorème 3.4 (i)
  (a regular Noetherian local ring of dimension `≥ 2` is pure).
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X: Corollaire 3.2 (a
  local form of clause (2) of 0BMA, stated there as a consequence of the purity theorem and proved
  there only in dimension two) and Corollaire 3.3 (for `X` locally Noetherian regular and `Z`
  closed of codimension `≥ 2`, restriction of étale covers from `X` to `X ∖ Z` is an equivalence).
