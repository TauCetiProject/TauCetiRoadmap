# Roadmap: finite étale covers of punctured spectra and local purity

**Summary.** This roadmap proves purity for regular local rings (Stacks, Lemma 58.21.3 (0BMA);
SGA 2, Exposé X, Théorème 3.4 (i)): for a regular local ring `A` of dimension `≥ 2`, every finite
étale cover of the punctured spectrum of `A` extends to a finite étale cover of `Spec A`, and every
finite normal torsion-free `A`-algebra that is étale over the punctured spectrum is étale. It then
globalizes: over a Noetherian scheme, a finite étale cover of an open `U` extends across every
point of the complement at which purity holds (Stacks, Lemma 58.21.6 (0EY7)), and over a locally
Noetherian scheme it extends across a complement whose local rings are regular of dimension `≥ 2`
(SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i)). It is built on Tau Ceti's finite étale
schemes, punctured spectra and notion of purity, and on Tau Ceti's dimension-two case of 0BMA. The
route is that of Stacks, Sections 58.19–58.21: the anti-equivalence between finite étale covers of
the punctured spectrum and finite normal algebras, formal glueing of modules along the completion
and the formal-sections comparison, full faithfulness of restriction to a hypersurface section,
the local Lefschetz extension theorem (Lemma 58.20.7 (0BLM)), and an induction on the dimension
starting from dimension two.

[PurityOfBranchLocus](../PurityOfBranchLocus/README.md) consumes §2.1 for Zariski–Nagata purity
of the branch locus (Stacks 0BMB), and [AbhyankarLemma](../AbhyankarLemma/README.md) consumes
§§2.1–2.2 for the extension of covers unramified in codimension one and Abhyankar's lemma for a
regular divisor (Stacks 0EYE–0EYH).

| Layer | Title | What it delivers |
|---|---|---|
| [1](#layer-1-finite-étale-covers-of-punctured-spectra) | Finite étale covers of punctured spectra | the anti-equivalence with finite normal algebras, formal glueing and formal sections, completion, restriction to a hypersurface, the local Lefschetz extension theorem |
| [2](#layer-2-local-purity-and-extension) | Local purity and extension | purity for regular local rings, spreading out from a local scheme, extension across points where purity holds and across a regular complement of codimension `≥ 2` |

```text
Mathlib + Tau Ceti → Layer 1 → Layer 2
SchemeAndStackFoundations §§0.14, 0.17, 2.6, 2.7, 4.7–4.8 ──→ Layer 1
SchemeAndStackFoundations §0.9 ─────────────────────────────→ Layer 2 §2.2
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
(0BLM), and Algebraic and Formal Geometry, Lemma 52.15.5 (0EKS); the inputs of 0BLH and 0EKS:
formal glueing of modules along a flat ring map that is an isomorphism modulo a finitely generated
ideal, with its preservation of finiteness, finite presentation, flatness, finite projectivity and
tensor products (More on Algebra, Remark 15.91.10 (05EL), Proposition 15.91.16 (05ER) and Remark
15.91.20 (05EU), whose projectivity clause is taken for finitely generated modules), the
formal-sections comparison
(Algebraic and Formal Geometry, Lemma 52.12.7 (0EII)) and the completion criterion on finite locally
free modules (Lemma 52.15.1 (0EKP)); purity for regular local rings
of every dimension `≥ 2`, both clauses of Lemma 58.21.3 (0BMA); spreading out from a local scheme
(Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)); the extension result 58.21.6 (0EY7); full
faithfulness of restriction to an open of a locally Noetherian scheme whose complement has depth
`≥ 2`; and extension across a complement whose local rings are regular of dimension `≥ 2` (SGA 2,
Exposé X, Proposition 3.3 with Théorème 3.4 (i); for a regular scheme, SGA 1, Exposé X, Corollaire
3.3).

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier. The declarations are listed under the supplier contracts.

- *Finite étale schemes, the punctured spectrum and purity for a local ring* (Stacks, Section 58.5
  (0BL6) and Section 58.20 (0BM7)): Tau Ceti, with the restriction functor to the punctured
  spectrum, its faithfulness in positive depth, and the comparison with Mathlib's
  `(@IsFinite ⊓ @Etale).Over ⊤ S`. These are the subject of §1.1, which this roadmap therefore
  does not contain.
- *Sections over the punctured spectrum and the first lemmas of Stacks, Section 58.20*: Tau Ceti
  proves Lemma 58.20.1 (0BM8) in affine form, which is all of it, because a scheme finite over
  `Spec A` is affine (Mathlib's `IsFinite` extends `IsAffineHom`); Lemma 58.20.2 (0BLK); and the
  full faithfulness half of Lemma 58.20.3 (0BM9), with torsion freeness.
- *Full faithfulness of restriction over an affine Noetherian base* whose complement has depth
  `≥ 2`: Tau Ceti. §2.2 globalizes it.
- *Regular local rings*: Mathlib (`IsRegularLocalRing`, `IsRegularRing`); Tau Ceti (domain 00NP,
  quotient by a regular parameter 00NQ, a regular local ring is a regular ring 0AFS, integrally
  closed 0567, depth equal to dimension).
- *Depth, Cohen–Macaulay modules and rings, Serre's criterion*: Mathlib's `IsLocalRing.depth`;
  Tau Ceti's Cohen–Macaulay notions and Serre's criterion (031S); the regular-sequence depth of
  SchemeAndStackFoundations §0.17, in which §2.7 there states its vanishing theorem.
- *Normality along étale maps* (Stacks 033C, étale case): Tau Ceti.
- *The torsion lemmas of formal glueing* (More on Algebra, Lemmas 15.91.2 (05E9) and 15.91.3
  (05EC)) and *ampleness of `𝒪_X` on a quasi-affine scheme*: Tau Ceti; quasi-affine schemes:
  Mathlib.
- *The commutative algebra of the dimension-two case*: Tau Ceti owns miracle flatness (Algebra,
  Lemma 10.128.1 (00R4)), the discriminant criterion (Discriminants, Lemma 49.3.1 (0BJF)) and
  clause (2) of 0BMA in dimension two, with torsion freeness. §2.1 starts its induction there.
- *The counterexample of Convention 5* (`A × A/𝔪`): Tau Ceti.
- *Henselian pairs, quasi-coherent cohomology of affine schemes, local cohomology, formal
  completion, limits of schemes*: [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md)
  §§0.14, 2.6, 2.7, 4.7–4.8 and 0.9.
- *Faithfully flat descent of finiteness, finite presentation and flatness of modules*: Mathlib and
  Tau Ceti (supplier contracts).

## Conventions

1. Rings are commutative. Schemes and morphisms are Mathlib's `Scheme` and `Scheme.Hom` in a fixed
   universe `u`. Hypotheses such as Noetherian, normal and regular are written on the statement
   that uses them, never folded into a definition.
2. **Statement form.** Every target is stated in Mathlib's and Tau Ceti's vocabulary, against the
   pinned libraries, and that statement is the target. Where the Stacks Project states the same
   result in a different form, the target cites the tag, carries Mathlib's `@[stacks XXXX]`
   attribute, and says how the two forms correspond; targets with no Stacks counterpart are marked
   *API*. Finite étale schemes over `S` are Tau Ceti's `TauCeti.FiniteEtaleScheme S`, and the
   restriction to an open `U` is `TauCeti.FiniteEtaleScheme.pullback U.ι`.
3. *Normal* is Stacks, Definition 10.37.11 (00GV), written in Mathlib's vocabulary: every
   localization at a prime is a domain and integrally closed,
   `∀ p : Ideal B, p.IsPrime → IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p)`.
   For a local ring it is `IsDomain` together with `IsIntegrallyClosed`.
4. The dimension of a local ring `A` is `ringKrullDim A`; its depth is Mathlib's
   `IsLocalRing.depth (ModuleCat.of A A)`, written `depth A` (Stacks, Definition 10.72.1 (00LI)).
   In Layer 1 and §2.1, `(A, 𝔪)` is a Noetherian local ring, `X = Spec A` and `U = X ∖ {𝔪}` is Tau
   Ceti's `TauCeti.IsLocalRing.puncturedSpectrum A`.
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
  `Scheme.Opens`, `IsAffineOpen`, `MorphismProperty.Over`, `MorphismProperty.Over.pullback`, glueing
  of schemes `Scheme.GlueData` and of morphisms `Scheme.Cover.glueMorphisms`
  (`Mathlib/AlgebraicGeometry/Gluing.lean`).
- `Scheme.IsQuasiAffine` (quasi-compact, with `X → Spec Γ(X, 𝒪_X)` an immersion) and
  `Scheme.IsQuasiAffine.of_isImmersion` (a quasi-compact subscheme of a quasi-affine scheme is
  quasi-affine) (`Mathlib/AlgebraicGeometry/QuasiAffine.lean`).
- `IsRegularLocalRing` (a Noetherian local ring whose maximal ideal needs `ringKrullDim` generators)
  and `IsRegularRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`).
- `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean`): depth with respect to the maximal
  ideal, defined by vanishing of `Ext` as `Ideal.depth` of the maximal ideal; and
  `Ideal.depth_eq_sSup_length_isRegular` (over a Noetherian ring, for a finite module `M` with
  `IM ≠ M`, the depth with respect to `I` is the supremum of the lengths of `M`-regular sequences in
  `I`; for a nonzero finite module over a Noetherian local ring and `I = 𝔪`, Nakayama gives
  `𝔪M ≠ M`).
- `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.pow_smul_top_eq_ker_eval`
  (for `I` finitely generated, `IⁿÂ` is the kernel of `Â → A/Iⁿ`,
  `Mathlib/RingTheory/AdicCompletion/Completeness.lean`),
  `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian` (over a Noetherian ring the
  completion of a finite module `M` is `M ⊗ Â`,
  `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean`), `localCohomology`.
- `Algebra.Etale`, `Algebra.IsEtaleAt`, `Module.IsTorsionFree`, and
  `IsIntegralClosure.finite` (`Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`: the integral
  closure of a Noetherian integrally closed domain in a finite separable extension of its fraction
  field is finite).
- `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat` (`Mathlib/RingTheory/Finiteness/Descent.lean`:
  finiteness descends along a faithfully flat ring map), `Module.Flat.of_flat_tensorProduct`
  (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`: flatness descends along a faithfully flat
  ring map), `Module.Flat.projective_of_finitePresentation`
  (`Mathlib/RingTheory/Flat/EquationalCriterion.lean`: a flat finitely presented module is
  projective) and `Module.finitePresentation_of_projective` (a finite projective module is finitely
  presented).

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
  `x ∈ s`) and `TauCeti.IsLocalRing.isCompact_puncturedSpectrum`
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
  `TauCeti.IsRegularLocalRing.quotient_span_singleton` (00NQ for one generator)
  (`RingTheory/RegularLocalRing/Basic.lean`); the instance
  `TauCeti.isRegularRing_of_isRegularLocalRing` (0AFS: a regular local ring is a regular ring,
  `RingTheory/RegularLocalRing/ProjectiveDimension.lean`); the instance
  `TauCeti.IsRegularRing.isIntegrallyClosed` (0567, `RingTheory/RegularLocalRing/Normal.lean`); and
  `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`RingTheory/RegularLocalRing/CohenMacaulay.lean`).
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
  `TauCeti.Algebra.etale_of_isUnramifiedAt_of_two_le_ringKrullDim` (`RingTheory/Etale/Purity.lean`);
  and `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` (0BMA (2) in dimension two: `B`
  finite, torsion free, normal at its maximal ideals and unramified at every prime not over `𝔪`;
  `RingTheory/RegularLocalRing/Purity.lean`).
- Normality along étale maps: `TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_isIntegrallyClosed`
  and `TauCeti.Algebra.Etale.isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed` (for `R`
  an integrally closed domain and `S` étale over `R`, every localization of `S` at a prime is an
  integrally closed domain; `RingTheory/Etale/Normal.lean`).
- The torsion lemmas of formal glueing, for `R → S` flat with `R/I → S/IS` bijective:
  `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top` (05E9: an `I`-power torsion module
  is unchanged by base change to `S`) and `TauCeti.isBaseChange_of_primaryComponent_eq_top` (05EC:
  an `IS`-power torsion `S`-module is the base change of its underlying `R`-module)
  (`RingTheory/FormalGlueing/Torsion.lean`).
- Descent of finite presentation: `TauCeti.Huber.IsPseudoCoherentOver.of_baseChange` (for `S`
  faithfully flat over `R`, if `S ⊗_R M` is `m`-pseudo-coherent over `S` then `M` is
  `m`-pseudo-coherent over `R`; `Algebra/Module/PseudoCoherent/Descent.lean`) and
  `TauCeti.Huber.IsPseudoCoherentOver.one_iff` (`1`-pseudo-coherent is finitely presented,
  `Algebra/Module/PseudoCoherent/Basic.lean`); together they are Algebra, Lemma 10.83.2 (03C4),
  part (2).
- `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` and
  `TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff` (`𝒪_X` is ample exactly when `X` is
  quasi-affine; `AlgebraicGeometry/LineBundle/Ample.lean`).
- The counterexample of Convention 5, for `A` a local domain that is not a field:
  `TauCeti.IsLocalRing.isEtaleAt_prod_residueField`,
  `TauCeti.IsLocalRing.not_isTorsionFree_prod_residueField`,
  `TauCeti.IsLocalRing.not_flat_prod_residueField` and
  `TauCeti.IsLocalRing.not_etale_prod_residueField` (`RingTheory/Etale/ProdResidueField.lean`).

**From TauCetiRoadmap.SchemeAndStackFoundations.** §0.9 `finite_presentation_limits` (over a
cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps, schemes of
finite presentation, their morphisms and the properties proper, finite, étale and closed immersion
descend to a finite stage); §0.17 `Module.depth` (depth by weakly regular sequences, the depth in
which §2.7 is stated) and `depth_eq_iff_ext` (it is the least degree of a nonzero
`Ext^i(κ, M)`, which is Mathlib's `IsLocalRing.depth`); §0.14
*henselian_finiteEtale_equivalence* (More on Algebra, Lemma 15.13.2 (09ZL): for a henselian pair
`(R, I)`, base change is an equivalence from finite étale `R`-algebras to finite étale
`R/I`-algebras); §2.6 `serre_affineness_criterion`, of which the direction from an affine scheme
to the vanishing of `H^q(X, F)` for `q > 0` and `F` quasi-coherent is used; §2.7
`supports_localization_triangle`, `depth_localCohomology_vanishing`,
`localCohomology_module_comparison` and `localCohomology_flat_baseChange` (for a flat map of
Noetherian rings `A → B`, `B ⊗_A H^q_I(M) ≅ H^q_{IB}(B ⊗_A M)`); §§4.7–4.8 formal completion along
a closed subscheme,
`CoherentFormalModule` (morphisms are compatible families of linear maps) and `completionFunctor`.
Assumed as stated there.

## How to read the build

There is no Layer 0 and no §1.1: the commutative algebra inputs and the punctured spectrum with
its notion of purity are Tau Ceti's (supplier contracts). Layer 1 works over a fixed Noetherian
local ring, except for the general statements on formal glueing, formal sections and completion
that open §1.3: §1.2 completes the anti-equivalence between finite étale covers of the punctured
spectrum and finite normal algebras, §1.3 proves formal glueing of modules and the
formal-sections comparison and with them compares covers of `A`, of its completion and of a
hypersurface section, and §1.4 extends covers from a hypersurface section. Layer 2 proves purity
for regular local rings by induction on the dimension, starting from Tau Ceti's dimension-two
case, and globalizes it over Noetherian and locally Noetherian schemes. Each subsection's *Needs:*
line lists its inputs.

## Layer 1: finite étale covers of punctured spectra

### 1.2 Finite normal algebras

Prove *restrictPuncturedSpec_essSurj* (Stacks, Lemma 58.20.3 (0BM9), the essential surjectivity
half, **with the correction of Convention 5**): for `A` a Noetherian local ring that is an
integrally closed domain of dimension `≥ 2`, the functor
`TauCeti.IsLocalRing.restrictPuncturedSpec A : (FiniteNormalPuncturedEtaleAlg A)ᵒᵖ ⥤ FiniteEtaleScheme U`
is essentially surjective, and a finite étale `V` over `U` is the restriction of
`Spec Γ(V, 𝒪_V)`. With Tau Ceti's `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful` it is
an equivalence *finiteNormalEquiv*, an **anti-equivalence** between finite étale schemes over `U`
and finite normal algebras, whose quasi-inverse is global sections. Moreover, `V` is the
restriction of a finite étale scheme over `X` iff `Γ(V, 𝒪_V)` is étale over `A`: `A` has depth
`≥ 2` by Tau Ceti's depth bound for normal local domains, `Γ(V, 𝒪_V)` is finite over `A` by the
first part, and Tau Ceti's `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale` applies. The
route is that of Stacks: `V` is normal, its local rings being localizations of étale algebras over
the integrally closed domains `A_f` (`TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_isIntegrallyClosed`,
`TauCeti.Algebra.Etale.isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed`), so a
finite disjoint union of integral schemes; for `V` integral its function field `L` is finite
separable over the fraction field of `A`, the integral closure `B'` of `A` in `L` is finite
(`IsIntegralClosure.finite`), torsion free and normal, and agrees with `Γ(V ×_U D(f), 𝒪)` after
inverting each of finitely many generators `f` of `𝔪`, whose principal opens cover `U`
(`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`), so `V` is the restriction of
`Spec B'`; then `B' = Γ(V, 𝒪_V)` by `TauCeti.IsLocalRing.isIso_appTop_pullback_fst_puncturedSpectrum`.
*Needs:* Tau Ceti `TauCeti.IsLocalRing.FiniteNormalPuncturedEtaleAlg`,
`TauCeti.IsLocalRing.restrictPuncturedSpec`, `TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful`,
`TauCeti.IsLocalRing.isIso_appTop_pullback_fst_puncturedSpectrum`,
`TauCeti.IsLocalRing.extends_iff_sections_finiteEtale`, the depth bound
`two_le_depth_of_isIntegrallyClosed`, `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`,
`TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_isIntegrallyClosed`,
`TauCeti.Algebra.Etale.isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed`;
Mathlib `IsIntegralClosure.finite`, `Algebra.IsEtaleAt`.

**Checks.**
- For `A = k⟦x, y⟧`, the algebras `A` and `A × A/𝔪` are finite and
  normal and are étale at every prime not lying over `𝔪`, and both restrict to the trivial cover
  `U → U`; only `A` is torsion free, and `A × A/𝔪` is not flat over `A`. Without torsion freeness
  the sections functor would not be a quasi-inverse.
- For `A = k⟦x, y⟧` and `V = U ⊔ U`, `Γ(V, 𝒪_V) = A × A` (functions
  extend across the closed point, which has depth two), finite étale over `A`, and `V` is the
  restriction of `Spec (A × A)`.
- For the discrete valuation ring `A = ℤ_(p)`, `U = Spec ℚ` and
  `V = Spec ℚ(√p)`, `Γ(V, 𝒪_V) = ℚ(√p)` is not finite over `A`, while `V` is the restriction of
  `Spec ℤ_(p)[√p]`; the dimension bound `≥ 2` is what makes global sections land in finite
  algebras.

### 1.3 Completion and restriction to a hypersurface

**Formal glueing.** For a ring map `R → S`, elements `f_1, …, f_t ∈ R` and `I = (f_1, …, f_t)`,
define *FormalGlueData* `R S (f_1, …, f_t)`, the category `Glue(R → S, f_1, …, f_t)` of glueing
data (More on Algebra, Remark 15.91.10 (05EL)). An object is an `S`-module `M′`, an
`R_{f_i}`-module `M_i` for each `i`, isomorphisms `α_i : M′_{f_i} → M_i ⊗_R S` of
`S_{f_i}`-modules and isomorphisms `α_{ij} : (M_i)_{f_j} → (M_j)_{f_i}` of `R_{f_i f_j}`-modules,
such that `(α_{ij} ⊗ S) ∘ α_i = α_j` as maps `M′_{f_i f_j} → (M_j)_{f_i} ⊗_R S` and
`α_{jk} ∘ α_{ij} = α_{ik}` as maps `(M_i)_{f_j f_k} → (M_k)_{f_i f_j}`. A morphism is an `S`-linear
map together with `R_{f_i}`-linear maps commuting with the `α_i` and the `α_{ij}`.

- *Can* sends an `R`-module `M` to `(M ⊗_R S, M_{f_i}, can_i, can_{ij})`, with the canonical
  isomorphisms. *H⁰* sends an object to the `R`-module of families `(m′, m_i) ∈ M′ × ∏_i M_i` with
  `α_i(m′/1) = m_i ⊗ 1` and `α_{ij}(m_i/1) = m_j/1` for all `i, j`. `H⁰` is right adjoint to `Can`
  (More on Algebra, Lemma 15.91.11 (0H77)).
- For `R → S` flat, *FormalGlueData* is abelian, with kernels and cokernels computed componentwise,
  and `Can` is exact and commutes with all colimits (Lemma 15.91.13 (05EN)).
- If `(f_1, …, f_t) = R`, then for every flat `R → S` the functors `Can` and `H⁰` are quasi-inverse
  equivalences (Lemma 15.91.14 (05EP)): this is Zariski glueing of modules, and the
  `S`-component is determined by the others.

**Checks.**
- For `S = 0` and `t = 1`, `f_1 = 1`, an object is an `R`-module `M_1` together with the zero
  module, and `Can` and `H⁰` are the identity of `R`-modules up to isomorphism: when `I` is the unit
  ideal the `S`-component carries no information.
- For `R = ℤ_(p)`, `S = ℤ_p` and `f_1 = p`, the object `(ℤ_p, ℚ, α_1)`, with `α_1` the identity of
  `ℚ_p = ℚ ⊗_{ℤ_(p)} ℤ_p`, has `H⁰ = ℤ_p ∩ ℚ = ℤ_(p)` inside `ℚ_p`, and it is `Can(ℤ_(p))`.
- For `R = k[x]`, `S = k = R/(x)` and `f_1 = x`, the map `R/(x) → S/xS` is bijective but `S` is not
  flat over `R`. Both `(R ⊗_R S)_x = k_x` and `R_x ⊗_R S = k[x, x⁻¹]/(x)` vanish, so
  `H⁰(Can(R)) = k × k[x, x⁻¹]`, which is not `R`: flatness cannot be dropped from
  *formalGlueing_equiv*.
- For `R = ℤ`, `S = ℚ` and `f_1 = p`, `S` is flat but `R/pR = 𝔽_p → S/pS = 0` is not bijective,
  and `Can(𝔽_p) = 0 = Can(0)` because `𝔽_p ⊗ ℚ = 0` and `(𝔽_p)_p = 0`: `Can` is not faithful, so the
  hypothesis on `R/I → S/IS` cannot be dropped either.
- For `R = k[x]`, `S = k⟦x⟧` and `f_1 = x`, which satisfy the hypotheses of *formalGlueing_equiv*,
  the module `M = k[x]/(x − 1)` has `M ⊗_R S = k⟦x⟧/(x − 1) = 0`, because `x − 1` is a unit of
  `k⟦x⟧`, and the zero module is finite projective over `S`; but `M_x = k[x, x⁻¹]/(x − 1) ≅ k` is a
  nonzero torsion module over the domain `R_x`, hence not projective, and `M` is not projective
  over `R`. The property clauses need the components `M_{f_i}` as well as `M ⊗_R S`.

Prove *formalGlueing_equiv* (More on Algebra, Proposition 15.91.16 (05ER) and Remark 15.91.20
(05EU)): if `R → S` is flat and `R/I → S/IS` is bijective, then `Can` and `H⁰` are quasi-inverse
equivalences between `R`-modules and *FormalGlueData* `R S (f_1, …, f_t)`; an `R`-module `M` is
finite, finitely presented, flat, or finite projective (finitely generated and projective) iff
`M ⊗_R S` has that property over `S` and every `M_{f_i}` has it over `R_{f_i}`; and both functors
are compatible with tensor products, so they restrict to equivalences between `R`-algebras and
glueing data of algebras, and between finite `R`-algebras and glueing data of finite algebras. The
route is that of Stacks. `H⁰ ∘ Can ≅ id` is the exactness of the glueing complex
`0 → M → (M ⊗_R S) × ∏_i M_{f_i} → ∏_i (M ⊗_R S)_{f_i} × ∏_{i,j} M_{f_i f_j}` (Lemma 15.91.9
(05EK)), which rests on the invariance of `I`-power torsion under base change along `R → S` (Tau
Ceti `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top`, 05E9, and
`TauCeti.isBaseChange_of_primaryComponent_eq_top`, 05EC). For `Can ∘ H⁰ ≅ id`, the comparison map
becomes an isomorphism after base change to each `R_{f_i}` (Lemmas 15.91.14 (05EP) and 15.91.15
(05EQ)), so it is injective with cokernel an `IS`-power torsion `S`-module, and the extension it
defines descends to `R` (Lemma 15.91.8 (05EG)). Lemmas 15.91.4–15.91.9 and Lemma 15.91.15 (05EQ),
whose proof Stacks omits, are steps of this target. The property clauses are ascent by base change
and descent along `R → S × ∏_i R_{f_i}`, which is faithfully flat: it is flat, and a prime of `R`
either misses some `f_i` or contains `I` and then comes from `S/IS ≅ R/I`. A module over this finite
product is finite, finitely presented or flat iff each component is, so finiteness descends by
Mathlib `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, flatness by
`Module.Flat.of_flat_tensorProduct`, and finite presentation by Tau Ceti
`TauCeti.Huber.IsPseudoCoherentOver.of_baseChange` at level `1` with
`TauCeti.Huber.IsPseudoCoherentOver.one_iff` (Algebra, Lemma 10.83.2 (03C4)). A finite projective
module is the same as a flat finitely presented one (`Module.Flat.projective_of_finitePresentation`,
`Module.finitePresentation_of_projective`), so the last clause follows from the two before it.
Remark 15.91.20 asserts the projectivity clause for every module; for modules that are not finitely
generated it rests on the descent of projectivity along faithfully flat maps (Algebra, Theorem
10.95.6 (05A9)), and the target states the finitely generated case.

**Formal sections and completion.** Prove *formalSections_of_localCohomology* (Algebraic and
Formal Geometry, Lemma 52.12.7 (0EII)): for a Noetherian ring `R`, an ideal `𝔞`, an element
`g ∈ 𝔞` and a finite `R`-module `M`, if `R` is `g`-adically complete and `H¹_𝔞(M)` and `H²_𝔞(M)`
are annihilated by a power of `g`, then with `W = Spec R ∖ V(𝔞)` the map
`Γ(W, M~) → lim_n Γ(W, M~/gⁿM~)` is bijective. Route: for `F = M~|_W`, `H¹(W, F) ≅ H²_𝔞(M)` and
there is an exact sequence `0 → M/H⁰_𝔞(M) → Γ(W, F) → H¹_𝔞(M) → 0`: the long exact sequence of
SchemeAndStackFoundations §2.7 `supports_localization_triangle` for `V(𝔞) ⊆ Spec R`, with its
supported terms identified with `H^q_𝔞(M)` by §2.7 `localCohomology_module_comparison`, and with
`Γ(Spec R, M~) = M` and `H¹(Spec R, M~) = H²(Spec R, M~) = 0` because `Spec R` is affine
(SchemeAndStackFoundations §2.6 `serre_affineness_criterion`). The `g`-power torsion of the
coherent `F` on the Noetherian `W` is bounded, so `lim_n Γ(W, F/gⁿF)` is an extension of the `g`-adic Tate module of `H¹(W, F)` by the `g`-adic
completion of `Γ(W, F)` (the degree-zero case of Algebraic and Formal Geometry, Lemma 52.3.2
(0BLD), a step of this target); that Tate module vanishes because `H¹(W, F)` is killed by a power
of `g`. Finally `Γ(W, F)` is `g`-adically complete, being an extension of a module killed by a
power of `g` by the finite module `M/H⁰_𝔞(M)`. That finite module is complete, its completion being
its base change to the complete `R` (Mathlib
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Algebra, Lemma 10.97.1
(00MA)), and completion keeps such an extension exact with the same quotient (Algebra, Lemma
10.96.4 (0BNG), a step of this target).

Prove *completion_fullyFaithful_of_sections* (Algebraic and Formal Geometry, Lemma 52.15.1
(0EKP)): let `X` be a Noetherian scheme and `Y ⊆ X` a closed subscheme with ideal sheaf `𝓘` and
infinitesimal neighbourhoods `Y_n = V(𝓘ⁿ)`, and consider the conditions
(1) `X` is quasi-affine (`Scheme.IsQuasiAffine`) and `Γ(X, 𝒪_X) → lim_n Γ(Y_n, 𝒪_{Y_n})` is
bijective; (2) `X` has an ample invertible module `L`
(`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`) with
`Γ(X, L^{⊗m}) → lim_n Γ(Y_n, L^{⊗m}|_{Y_n})` bijective for all `m ≫ 0`; (3) for every finite
locally free `𝒪_X`-module `E`, `Γ(X, E) → lim_n Γ(Y_n, E|_{Y_n})` is bijective; (4) the completion
functor from coherent `𝒪_X`-modules to coherent formal modules on the completion of `X` along `Y`
(SchemeAndStackFoundations §4.8 `completionFunctor`) is fully faithful on finite locally free
modules. Then (1) ⇒ (2) ⇒ (3) and (3) ⇔ (4). Route: (1) ⇒ (2) with `L = 𝒪_X`, which is ample
exactly when `X` is quasi-affine (`TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff`);
(2) ⇒ (3) by a universally exact sequence `0 → E → (L^{⊗p})^{⊕r} → (L^{⊗q})^{⊕s}`, obtained by
dualizing surjections from sums of negative powers of `L` onto `Hom(E, 𝒪_X)` and onto the next
cokernel, and the limit of its restrictions to the `Y_n`. Those surjections are the implication
(1) ⇒ (8) of Properties of Schemes, Proposition 28.27.13 (01Q3), a step of this target: for `L`
ample on the Noetherian `X`, every coherent `𝒪_X`-module is a quotient of `(L^{⊗−n})^{⊕k}` for some
`n > 0` and `k`. Its route covers `X` by finitely many affine `X_s`, `s` a section of a positive
power of `L` (the definition `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`), generates the
module on each `X_s` by finitely many sections, and multiplies these by a power of `s` to extend
them to global sections of a twist by a power of `L` (Lemma 28.18.2 (01PW), `X` being
quasi-compact and quasi-separated). (3) ⇒ (4) by applying (3) to `Hom(G, F)` for finite locally
free `F` and `G`: morphisms of coherent formal modules are compatible families of maps
(SchemeAndStackFoundations §4.8), and for `G` finite locally free
`Hom(G, F)|_{Y_n} = Hom(G|_{Y_n}, F|_{Y_n})`, so they form `lim_n Γ(Y_n, Hom(G, F)|_{Y_n})` (the
locally free case of Cohomology of Schemes, Lemma 30.23.5 (0882)). (4) ⇒ (3) by taking
`G = 𝒪_X`, since morphisms `𝒪_X → E` are global sections and morphisms of the completions are
elements of `lim_n Γ(Y_n, E|_{Y_n})`.

**Checks.**
- For `R = k⟦x, y, z⟧`, `𝔞 = 𝔪`, `g = z` and `M = R`, the depth is `3`, so `H¹_𝔪(R) = H²_𝔪(R) = 0`,
  and both sides of *formalSections_of_localCohomology* are `R`: `Γ(W, 𝒪_W) = R` and
  `Γ(W, 𝒪_W/zⁿ) = R/zⁿ`, because `R/zⁿ` has depth `2`.
- For `R = k[x, y, z]_{(x, y, z)}` with the same `𝔞`, `g` and `M`, the local cohomology hypothesis
  holds but `R` is not `z`-adically complete: `Γ(W, 𝒪_W) = R` maps to the `z`-adic completion of
  `R`, injectively and not onto, so completeness cannot be dropped.
- For `R = k⟦x, y⟧`, `𝔞 = 𝔪`, `g = x` and `M = R`, `R` is complete but no power of `x` kills
  `H²_𝔪(R)` (`xⁿ · x^{−n−1}y^{−1} = x^{−1}y^{−1} ≠ 0`); `Γ(W, 𝒪_W) = R`, while
  `Γ(W, 𝒪_W/xⁿ) = (R/xⁿ)[1/y]`, so the limit is the `x`-adic completion of `R[1/y]`, which contains
  `y⁻¹`: the local cohomology hypothesis cannot be dropped.
- For `X = Spec k[x]` and `Y = V(x)`, condition (1) fails (`k[x] → k⟦x⟧` is not onto), and so does
  (4): multiplication by `1/(1 − x)` on the completion of `𝒪_X` comes from no endomorphism of `𝒪_X`.
  For `X = Spec k⟦x⟧` and the same `Y`, (1) holds, and the completion functor is fully faithful
  on finite free modules `P`, `Q`, because `Hom(P, Q)` is `x`-adically complete.

**Completion and hypersurface sections.** Fix `f ∈ 𝔪` and set `X_0 = Spec (A ⧸ Ideal.span {f})`
with punctured spectrum `U_0` (Stacks, Situation 58.19.1 (0BLF)); restriction from finite étale
schemes over `U` to those over `U_0` is base change along `U_0 → U`. Let `Â` be the `𝔪`-adic
completion and `U′`, `U′_0` the base changes of `U`, `U_0` to `Spec Â`. Prove, each with the
hypotheses and conclusion of its tag: *finite_extend_of_completion* (Lemma 58.19.3 (0BLH)): if
`V → U` is finite and its base change `V′` to `U′` is the restriction of a scheme `Y′` finite over
`Spec Â`, then `V` is the restriction of a scheme `Y` finite over `X` with `Y′ = Y ×_X Spec Â`;
*extends_iff_completion_extends* (Lemma 58.20.4 (0BLL)): a finite étale `V` over `U` is the
restriction of a finite étale scheme over `X` iff `V′` is the restriction of a finite étale scheme
over `Spec Â`; *restrictHypersurface_fullyFaithful_of_completion* (Lemma 58.19.4 (0BLI)): if
`(A, (f))` is a henselian pair and restriction from `U′` to `U′_0` is fully faithful, then so is
restriction from `U` to `U_0`; *fullyFaithful_of_completion_coherent* (Lemma 58.17.1 (0EL8)): for a
Noetherian scheme and a closed subscheme along which completion is fully faithful on finite locally
free coherent modules, restriction of finite étale schemes to the closed subscheme is fully
faithful; *completion_fullyFaithful_of_localCohomology* (Algebraic and Formal Geometry, Lemma
52.15.5 (0EKS)): for a Noetherian ring `R`, `g ∈ 𝔞 ⊆ R`, `R` `g`-adically complete and `H¹_𝔞(R)`,
`H²_𝔞(R)` annihilated by a power of `g`, completion along `V(g)` is fully faithful on finite locally
free coherent modules on `Spec R ∖ V(𝔞)`; *restrictHypersurface_fullyFaithful_of_localCohomology*
(Lemma 58.19.6 (0BM6)): if `H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f` and
`(A, (f))` is a henselian pair, then restriction from finite étale schemes over `U` to finite
étale schemes over `U_0` is fully faithful; and *restrictHypersurface_fullyFaithful* (Lemma 58.19.7
(0BLJ)): the same for `depth A ≥ 3` and `(A, (f))` a henselian pair.

For *finite_extend_of_completion*, apply *formalGlueing_equiv* to `A → Â`, which is flat
(`AdicCompletion.flat_of_isNoetherian`) and bijective modulo `𝔪`
(`AdicCompletion.pow_smul_top_eq_ker_eval`), and to generators `f_1, …, f_t` of `𝔪`, whose
principal opens cover `U` (`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`): the rings
of `Y′` and of the affine schemes `V ×_U D(f_i)` form a glueing datum of finite algebras, and its
`H⁰` is a finite `A`-algebra `B` with `Y = Spec B`. For *completion_fullyFaithful_of_localCohomology*,
apply (1) ⇒ (4) of *completion_fullyFaithful_of_sections* to the quasi-affine
`Spec R ∖ V(𝔞)` (`Scheme.IsQuasiAffine.of_isImmersion`) and its closed subscheme cut out by `g`;
condition (1) is *formalSections_of_localCohomology* for `M = R`. For
*restrictHypersurface_fullyFaithful_of_localCohomology*, the hypotheses pass to `Â` (§2.7
`localCohomology_flat_baseChange`), *restrictHypersurface_fullyFaithful_of_completion* reduces to
`A` complete, and then *fullyFaithful_of_completion_coherent* for `U ⊇ U_0` with
*completion_fullyFaithful_of_localCohomology* for `𝔞 = 𝔪` and `g = f` gives the claim. For
*restrictHypersurface_fullyFaithful*, `depth A ≥ 3` makes `H¹_𝔪(A)` and `H²_𝔪(A)` vanish (§2.7
`depth_localCohomology_vanishing`, after §0.17 `depth_eq_iff_ext` identifies Mathlib's depth with
the depth of §2.7).
*Needs:* Tau Ceti `TauCeti.IsLocalRing.puncturedSpectrum`,
`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`, `TauCeti.FiniteEtaleScheme.pullback`,
`TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top`,
`TauCeti.isBaseChange_of_primaryComponent_eq_top`,
`TauCeti.Huber.IsPseudoCoherentOver.of_baseChange`, `TauCeti.Huber.IsPseudoCoherentOver.one_iff`,
`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`,
`TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff`; SchemeAndStackFoundations §0.14
(henselian pairs), §0.17 (`depth_eq_iff_ext`), §2.6 (`serre_affineness_criterion`, vanishing of
higher quasi-coherent cohomology on an affine scheme), §2.7 (`supports_localization_triangle`,
`depth_localCohomology_vanishing`, `localCohomology_module_comparison`,
`localCohomology_flat_baseChange`), §§4.7–4.8 (formal completion, `CoherentFormalModule`,
`completionFunctor`); Mathlib `IsLocalRing.depth`, `AdicCompletion`,
`AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.pow_smul_top_eq_ker_eval`,
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`, `localCohomology`,
`Scheme.IsQuasiAffine`, `Scheme.IsQuasiAffine.of_isImmersion`,
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `Module.Flat.of_flat_tensorProduct`,
`Module.Flat.projective_of_finitePresentation`, `Module.finitePresentation_of_projective`.

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
`depth_localCohomology_vanishing`, stated for the depth of §0.17, which `depth_eq_iff_ext`
identifies with Mathlib's `IsLocalRing.depth`), and 0BLS applies.
*Needs:* §1.3; SchemeAndStackFoundations §0.14 (*henselian_finiteEtale_equivalence*), §0.17
(`depth_eq_iff_ext`), §2.7 (`depth_localCohomology_vanishing`); Mathlib `IsLocalRing.depth`.

### Examples

- For `A = k⟦x, y, z⟧` and `f = z`, `A = k⟦x, y⟧⟦z⟧` is `z`-adically complete, so `(A, (z))` is a
  henselian pair, and `depth A = 3`, so `H¹_𝔪(A) = H²_𝔪(A) = 0`. Restriction from finite étale
  schemes over `U` to those over `U_0`, the punctured spectrum of `k⟦x, y⟧`, is fully faithful
  (*restrictHypersurface_fullyFaithful*), and a cover of `U` whose restriction to `U_0` extends to
  `Spec k⟦x, y⟧` extends to `Spec A` (*finiteEtale_extend_of_hypersurface*).
- For `A = k⟦x, y⟧` and `f = xy`, the pair `(A, (xy))` is henselian since `A` is complete, but
  `depth A = 2` and no power of `xy` kills `H²_𝔪(A)`:
  `(xy)ⁿ · x^{−n−1}y^{−n−1} = x^{−1}y^{−1} ≠ 0`. The conclusion of 0BM6 and 0BLJ fails as well:
  `U` is irreducible, since `A` is a domain, while `U_0 = Spec k((x)) ⊔ Spec k((y))` is the two
  generic points of the branches `y = 0` and `x = 0`. So `Hom_U(U, U ⊔ U)` has `2` elements and
  `Hom_{U_0}(U_0, U_0 ⊔ U_0)` has `4`, and restriction is not full: neither the depth bound nor
  the local cohomology hypothesis can be dropped.
- For `A = k⟦x, y⟧` and `f = x`, `(A, (x))` is henselian and `xⁿ · x^{−n−1}y^{−1} = x^{−1}y^{−1} ≠ 0`
  in `H²_𝔪(A)`, so 0BM6's hypothesis fails. Its conclusion still holds: by purity in dimension two
  and because `A` is henselian, finite étale schemes over `U` are those of finite étale
  `k`-algebras, and base change from `k` to `U_0 = Spec k((y))` is fully faithful on them because
  `k` is algebraically closed in `k((y))`. The hypothesis is sufficient, not necessary.
- For `A = k[x, y]_{(x, y)}` and the generators `x, y` of `𝔪`, the glueing datum of `V = U` in
  *finite_extend_of_completion* has `H⁰ = Â ∩ A_x ∩ A_y = A`, the intersection taken in `Â_{xy}`,
  so `Y = X`.

### Dependencies

Tau Ceti: finite étale schemes and their base change, the punctured spectrum and its cover by
principal opens, restriction and purity, the sections results (0BM8, 0BLK), the full faithfulness
half of 0BM9, the depth bound for normal local domains, normality along étale maps, the torsion
lemmas of formal glueing (05E9, 05EC), descent of finite presentation along faithfully flat maps
and ampleness of `𝒪_X` on quasi-affine schemes. Mathlib: integral closure in a finite separable
extension, étale algebras, depth, adic completion with its flatness, its quotients and its value on
finite modules, local cohomology, quasi-affine schemes, descent of finiteness and flatness along
faithfully flat maps, and finite projective modules as the flat finitely presented ones.
SchemeAndStackFoundations §§0.14 (henselian pairs and their finite étale algebras), 0.17 (depth by
regular sequences and its `Ext` description), 2.6 (vanishing of higher quasi-coherent cohomology on
affine schemes), 2.7 (local cohomology, its comparison with cohomology with supports, flat base
change and vanishing below the depth) and 4.7–4.8 (formal completion, coherent formal modules and
the completion functor).

## Layer 2: local purity and extension

### 2.1 Purity for regular local rings

Prove `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (Stacks, Lemma 58.21.3 (0BMA)): for `A`
regular local of dimension `d ≥ 2`, (1) `TauCeti.IsLocalRing.PurityHolds A`; (2) **with the
correction of Convention 5**, every finite `A`-algebra `B` that is torsion free and normal, with
`Algebra.IsEtaleAt A 𝔮` for every prime `𝔮` of `B` not lying over `𝔪`, satisfies
`Algebra.Etale A B`. The proof is by induction on `d`, as in Stacks. A regular local ring is an
integrally closed domain (the Tau Ceti instances `TauCeti.IsRegularLocalRing.isDomain`,
`TauCeti.isRegularRing_of_isRegularLocalRing` and `TauCeti.IsRegularRing.isIntegrallyClosed`), so
(1) and (2) are equivalent by *finiteNormalEquiv* (§1.2) and its final clause. For `d = 2`, (2) is
Tau Ceti's `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`, whose hypotheses
(normality at the maximal ideals of `B`, unramifiedness away from `𝔪`) follow from those of (2).
For `d ≥ 3`, an element `f ∈ 𝔪 ∖ 𝔪²` gives `A ⧸ Ideal.span {f}` regular of dimension `d − 1`
(`TauCeti.IsRegularLocalRing.quotient_span_singleton`); `A` has depth `d ≥ 3`
(`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`); the induction hypothesis (1) for
`A ⧸ Ideal.span {f}` extends the restriction of a cover `V` of `U` to `U_0`, and
*finiteEtale_extend_of_hypersurface* (§1.4) extends `V`.
*Needs:* §§1.2, 1.4; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`,
`TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`,
`TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.isRegularRing_of_isRegularLocalRing`,
`TauCeti.IsRegularRing.isIntegrallyClosed`; Mathlib `IsRegularLocalRing`, `Algebra.Etale`,
`Algebra.IsEtaleAt`.

**Checks.**
- For `A = k⟦x, y⟧` and `B = A × A/𝔪`, `B` is finite and
  normal, étale at every prime not lying over `𝔪`, and not étale over `A`; it is excluded by
  torsion freeness.
- Over a field `k` of characteristic `≠ 2`, for
  `A = k[x², xy, y²]` localized at the origin, the cover given by `k[x, y]` localized at the origin
  is finite étale over the punctured spectrum and does not extend to a finite étale cover of
  `Spec A`; so purity fails for this normal, non-regular local ring of dimension two.
- For `A = ℤ_(p)` (`d = 1`) and `B = ℤ_(p)[√p]`, `B` is a discrete
  valuation ring (`x² − p` is Eisenstein), finite and torsion free over `A`, and étale over the
  punctured spectrum `Spec ℚ` since `ℚ(√p)/ℚ` is separable; the discriminant of the basis `1, √p`
  is `4p`, not a unit, so `B` is not étale over `A` and the bound `d ≥ 2` cannot be lowered.

### 2.2 Spreading out and extension across points where purity holds

Prove *spread_from_localScheme* (Limits, Lemmas 32.20.3 (0BQ5) and 32.20.4 (0EY3)): for a scheme
`S`, a retrocompact open `U ⊆ S` and `s ∉ U`, with `V = Spec 𝒪_{S,s} ×_S U`, finitely presented
schemes over `U` and over `Spec 𝒪_{S,s}` whose restrictions to `V` are isomorphic glue to a finitely
presented scheme over an open `U' ⊇ U ∪ {s}`, uniquely up to shrinking `U'`; and if both are
separated, proper, finite or étale, the glued scheme has the same property after shrinking `U'`.
The proof glues relative schemes over `U` and an affine open neighbourhood `W` of `s` along
`U ∩ W` (Mathlib `Scheme.GlueData`), and applies SchemeAndStackFoundations §0.9
`finite_presentation_limits` to `Spec 𝒪_{S,s}` as the limit of the affine open neighbourhoods `W`
(Limits, proof of 0BQ5). Properness, finiteness and étaleness descend by §0.9; separatedness
descends by applying its closed-immersion clause to the diagonal, a morphism between schemes of
finite presentation (Limits, Lemma 32.8.6 (01ZQ)). Prove `finiteEtale_extend_of_purity`
(Stacks, Lemma 58.21.6 (0EY7)): for a Noetherian scheme `X` and an open `U ⊆ X` with
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
the equivalence stated there; for `X` regular this is SGA 1, Exposé X, Corollaire 3.3, whose
hypothesis that `X ∖ U` has codimension `≥ 2` makes every local ring along it of dimension `≥ 2`): for a locally Noetherian scheme `X` and an open `U` such that `𝒪_{X,x}`
is a regular local ring of dimension `≥ 2` for every `x ∉ U`, restriction is essentially surjective.
On each affine open it is `finiteEtale_extend_of_purity` with
`IsLocalRing.purityHolds_of_isRegularLocalRing`; on overlaps the local extensions are identified by
unique isomorphisms by *restrictOpen_fullyFaithful_of_depth*, since a regular local ring of
dimension `d` has depth `d` (`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`), and they glue to
a scheme over `X` (`Scheme.GlueData`), finite étale because both properties are local on `X`.
*Needs:* §2.1; SchemeAndStackFoundations §0.9; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.FiniteEtaleScheme.pullback`, `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`,
`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`; Mathlib `IsNoetherian`, `IsLocallyNoetherian`,
`Scheme.Opens`, `IsAffineOpen`, `Scheme.GlueData`, `Scheme.Cover.glueMorphisms`, `IsLocalRing.depth`.

**Checks.**
- For `X = Spec ℤ_(p)` and `U` its generic point, purity fails at the
  closed point (the cover `Spec ℚ(√p)` of `U` has the ramified normalization `ℤ_(p)[√p]`), and the
  cover does not extend; the purity hypothesis at the points outside `U` cannot be dropped.
- For `X = 𝔸²_k` and `U = 𝔸²_k ∖ {0}`, the local ring at the origin is
  regular of dimension two, so every finite étale cover of `U` extends to `X`; `U` and `X` have
  the same finite étale covers.
- For `U = X`, restriction is the identity up to the isomorphism
  `Y ×_X X ≅ Y`, and both extension statements hold with no hypothesis on points.

### Examples

- For `A = k⟦x, y, z⟧` the induction of §2.1 runs once: with `f = z ∈ 𝔪 ∖ 𝔪²`,
  `A ⧸ Ideal.span {z} = k⟦x, y⟧` is regular of dimension two, where purity is Tau Ceti's base case,
  and `depth A = 3`, so *finiteEtale_extend_of_hypersurface* extends every finite étale cover of the
  punctured spectrum of `A` (Layer 1, first example).
- For `X = 𝔸³_k` and `U = X ∖ L` with `L` a line, the local ring of `X` at the generic point of `L`
  is regular of dimension two and at each closed point of `L` regular of dimension three, so every
  finite étale cover of `U` extends to `X` (`finiteEtale_extend_of_regular_codimTwo`).
- For `X = 𝔸²_k` with `char k ≠ 2` and `U = D(x)`, the cover of `U` given by `t² = x` is finite étale
  and does not extend: its normalization over `X` is ramified along `x = 0`. The local ring of `X`
  at the generic point of that line has dimension one, so neither extension theorem applies.
- The Checks of §§2.1–2.2 give the failures in dimension one and for a non-regular normal local ring
  of dimension two, and the case `U = X`.

### Dependencies

Layer 1 (§§1.2 and 1.4). Tau Ceti: purity for a local ring, base change of finite étale schemes,
full faithfulness of restriction over an affine Noetherian base, the dimension-two case of 0BMA and
the facts on regular local rings listed in the supplier contracts. SchemeAndStackFoundations §0.9
(finitely presented schemes and morphisms over a limit, and the descent of proper, finite, étale
and closed immersion, the last applied to diagonals). Mathlib: Noetherian and locally Noetherian
schemes, affine opens, glueing of schemes and of morphisms, regular local rings and étale algebras.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Adapted*: the tag in a
different packaging or for a narrower class of inputs, with the difference stated at the target
and in the table. *Corrected*: the tag as
written is false and the target adds the missing hypothesis (Convention 5). *API*: no Stacks
counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 1.2 | *restrictPuncturedSpec_essSurj*, *finiteNormalEquiv* | 58.20.3 (0BM9) | corrected |
| 1.3 | *FormalGlueData*, *formalGlueing_equiv* | 15.91.10 (05EL), 15.91.16 (05ER) | exact |
| 1.3 | *formalGlueing_equiv*, property and tensor clauses | 15.91.20 (05EU) | adapted: projectivity for finitely generated modules |
| 1.3 | *formalSections_of_localCohomology* | 52.12.7 (0EII) | exact |
| 1.3 | *completion_fullyFaithful_of_sections* | 52.15.1 (0EKP) | exact |
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
- [AbhyankarLemma](../AbhyankarLemma/README.md) Layer 2 consumes §2.1
  (`IsLocalRing.purityHolds_of_isRegularLocalRing`) and §2.2 (*spread_from_localScheme*,
  `finiteEtale_extend_of_purity`, `finiteEtale_extend_of_regular_codimTwo`).
- PurityForFlatCohomology consumes §1.3 (*extends_iff_completion_extends*, and
  *formalSections_of_localCohomology* as the formal-section comparison on punctured spectra) and
  §§2.1–2.2.

## References

- The Stacks Project, Chapters 10 (Algebra), 15 (More on Algebra), 28 (Properties of Schemes),
  30 (Cohomology of Schemes), 32 (Limits), 49 (Discriminants), 52 (Algebraic and Formal Geometry)
  and 58 (Fundamental Groups of Schemes), https://stacks.math.columbia.edu.
- A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et
  globaux* (SGA 2), Exposé X: Définitions 3.1–3.2 (pure pairs and pure local rings), Proposition
  3.3 (purity of a pair is purity of the local rings along the closed subset) and Théorème 3.4 (i)
  (a regular Noetherian local ring of dimension `≥ 2` is pure).
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X: Théorème 3.1
  (Zariski–Nagata purity, recalled there without proof, p. 212), Corollaire 3.2 (its local form and
  a local form of clause (2) of 0BMA, proved there when `dim A = 2`: depth `≥ 2` makes `B` free over
  `A`, and the discriminant then cuts out the ramification locus) and Corollaire 3.3 (for `X`
  locally Noetherian regular and `Z` closed of codimension `≥ 2`, restriction of étale covers from
  `X` to `X ∖ Z` is an equivalence, p. 213).
