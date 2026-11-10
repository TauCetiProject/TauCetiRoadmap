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
normal algebras, completion (by formal glueing of modules, More on Algebra, Proposition 15.91.16
(05ER), and the comparison of sections with formal sections, Algebraic and Formal Geometry, Lemmas
52.12.7 (0EII) and 52.15.1 (0EKP)), full faithfulness of restriction to a hypersurface section,
the local Lefschetz extension theorem (Lemma 58.20.7 (0BLM)), and an induction on the dimension
starting from dimension two. Mathlib supplies schemes, finite and étale morphisms, scheme-theoretic
images, regular local rings, depth, adic completion, local cohomology and faithfully flat descent.
Tau Ceti supplies finite étale schemes over a base and their base change, the punctured spectrum
of a local ring and the notion of purity, the results on sections over the punctured spectrum
(Stacks, Lemmas 58.20.1 (0BM8) and 58.20.2 (0BLK)), the full faithfulness half of Lemma 58.20.3
(0BM9), the commutative algebra of the dimension-two case (miracle flatness, the discriminant
criterion, and clause (2) of 0BMA in dimension two), and the depth, normality and quotients of
regular local rings that the induction uses. SchemeAndStackFoundations supplies henselian pairs,
the cohomology of affine schemes, local cohomology, formal completion and limits of schemes.

| Layer | Title | What it delivers |
|---|---|---|
| [1](#layer-1-finite-étale-covers-of-punctured-spectra) | Finite étale covers of punctured spectra | the setting of the punctured spectrum, the anti-equivalence with finite normal algebras, formal glueing and formal sections, completion, restriction to a hypersurface, the local Lefschetz extension theorem |
| [2](#layer-2-local-purity-and-extension) | Local purity and extension | purity for regular local rings, spreading out from a local scheme, extension across points where purity holds and across a regular complement of codimension `≥ 2` |

```text
Mathlib + Tau Ceti → Layer 1 → Layer 2
SchemeAndStackFoundations §§0.14, 2.6–2.7, 4.7–4.8 ──→ Layer 1 §§1.3–1.4
SchemeAndStackFoundations §0.9 ──────────────────────→ Layer 2 §2.2
```

The end theorems are `IsLocalRing.purityHolds_of_isRegularLocalRing` and
`Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (0BMA, §2.1), `finiteEtale_extend_of_purity`
(0EY7, §2.2) and `finiteEtale_extend_of_regular_codimTwo` (§2.2).

## Scope and ownership

**This roadmap owns** the essential surjectivity half of Stacks, Lemma 58.20.3 (0BM9), with the
correction of Convention 5, and with it the anti-equivalence between finite étale covers of the
punctured spectrum of a Noetherian normal local domain of dimension `≥ 2` and finite normal
torsion-free algebras étale away from the closed point; formal glueing of modules and algebras
along a flat map that is bijective modulo a finitely generated ideal (More on Algebra, Remark
15.91.10 (05EL), Proposition 15.91.16 (05ER) and Remark 15.91.20 (05EU), with its projectivity
clause for finitely generated modules); the comparison of sections with formal sections on the
complement of `V(𝔞)` and the completion criterion on finite locally free modules (Algebraic and
Formal Geometry, Lemmas 52.12.7 (0EII) and 52.15.1 (0EKP)); Stacks, Lemmas 58.19.3 (0BLH), 58.20.4
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
- *Henselian pairs, quasi-coherent cohomology of affine schemes, local cohomology, formal
  completion, limits of schemes*: [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md)
  §§0.14, 2.6, 2.7, 4.7–4.8 and 0.9.

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
   `TauCeti.IsLocalRing.puncturedSpectrum A`; the general statements on formal glueing, formal
   sections and completion in §1.3 are written for a ring `R` that need not be local.
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
  members of an open cover that agree on overlaps glue) and `Scheme.GlueData` (the same file:
  schemes glued along open immersions satisfying the cocycle condition); `Scheme.Opens.stalkIso`
  (`Mathlib/AlgebraicGeometry/Restrict.lean`: the local ring of an open at a point is that of the
  scheme) and `Spec.stalkIso` (`Mathlib/AlgebraicGeometry/AffineScheme.lean`: the stalk of `Spec R`
  at `𝔭` is `R_𝔭`).
- `Scheme.IsQuasiAffine` and `Scheme.IsQuasiAffine.of_isImmersion`
  (`Mathlib/AlgebraicGeometry/QuasiAffine.lean`); `Scheme.Hom.toNormalization`, an open immersion
  into the relative normalization for a morphism that is locally quasi-finite, locally of finite
  type, separated and quasi-compact (Zariski's main theorem,
  `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`); `AlgebraicGeometry.Flat.isQuotientMap_of_surjective`
  (a flat, quasi-compact, surjective morphism is submersive, Stacks 02JY,
  `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`).
- The scheme-theoretic image `Scheme.Hom.image`, cut out by the kernel ideal sheaf `Scheme.Hom.ker`
  (`Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean`), with `Scheme.Hom.support_ker` (for `f`
  quasi-compact, the support of `f.ker` is the closure of the image of `f`) and
  `Scheme.ker_morphismRestrict_ideal` (for `f` quasi-compact and an open `V` of the target, the
  kernel ideal of the restriction of `f` over `V` is that of `f` on `V`)
  (`Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`): together, Morphisms, Lemma 29.6.3 (01R8).
- `IsRegularLocalRing` (a Noetherian local ring whose maximal ideal needs `ringKrullDim` generators)
  and `IsRegularRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`);
  `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_jacobson` (for a Noetherian
  ring and a non-zero-divisor `x` in its Jacobson radical, `dim R ⧸ (x) + 1 = dim R`,
  `Mathlib/RingTheory/KrullDimension/Regular.lean`).
- `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean`), as in Convention 4, defined as
  `Ideal.depth` of the maximal ideal, and `Ideal.depth_eq_sSup_length_isRegular` (the same file: for
  a finite module `M` over a Noetherian ring and an ideal `I` with `IM ≠ M`, the `I`-depth of `M` is
  the supremum of the lengths of `M`-regular sequences in `I`).
- `AdicCompletion`, `AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.pow_smul_top_eq_ker_eval`
  (the kernel of reduction modulo `Iⁿ` is `IⁿÂ`, for `I` finitely generated),
  `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian` (the completion of a finite
  module over a Noetherian ring is its base change to the completion),
  `AdicCompletion.isAdicComplete_of_fg` (the completion of a local ring with finitely generated
  maximal ideal is complete for its maximal ideal), `IsAdicComplete.henselianRing` (an `I`-adically
  complete ring is henselian along `I`, `Mathlib/RingTheory/Henselian.lean`), and `localCohomology`
  (`Mathlib/Algebra/Homology/LocalCohomology.lean`).
- Faithfully flat descent: `Module.FaithfullyFlat.of_flat_of_isLocalHom` (a flat local
  homomorphism of local rings is faithfully flat), `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`
  (`Mathlib/RingTheory/Finiteness/Descent.lean`), `Module.Flat.of_flat_tensorProduct`
  (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`) and
  `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat` (`Mathlib/RingTheory/Etale/Descent.lean`);
  `Module.Flat.projective_of_finitePresentation` and `Module.finitePresentation_of_projective`.
- `Algebra.Etale`, `Algebra.IsEtaleAt` (the localization at the prime is formally étale),
  `Algebra.IsUnramifiedAt`, `Module.IsTorsionFree`, and
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
- The first input of formal glueing, for `R → S` flat with `R/I → S/IS` bijective:
  `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top` (an `I`-power torsion module `M`
  is `S ⊗_R M`, Stacks 05E9) and `TauCeti.isBaseChange_of_primaryComponent_eq_top` (an
  `IS`-power torsion `S`-module is the base change of its underlying `R`-module, 05EC)
  (`RingTheory/FormalGlueing/Torsion.lean`).
- Faithfully flat descent of finite presentation: `TauCeti.Huber.IsPseudoCoherentOver.of_baseChange`
  (`Algebra/Module/PseudoCoherent/Descent.lean`) with `TauCeti.Huber.IsPseudoCoherentOver.one_iff`
  (`1`-pseudocoherent is finitely presented, `Algebra/Module/PseudoCoherent/Basic.lean`).
- Completeness for a principal subideal: `IsAdicComplete.span_singleton_of_mem` (an `I`-adically
  complete module is `(r)`-adically complete for every `r ∈ I`; the principal case of Stacks 090T;
  `RingTheory/AdicCompletion/Principal.lean`).
- Ample line-bundle classes `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` and
  `TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff` (`𝒪_X` is ample iff `X` is
  quasi-affine) (`AlgebraicGeometry/LineBundle/Ample.lean`).

**From TauCetiRoadmap.SchemeAndStackFoundations.** §0.9 `finite_presentation_limits` (over a
cofiltered limit of quasi-compact quasi-separated schemes with affine transition maps, schemes of
finite presentation and their morphisms descend to a finite stage, Limits, Lemma 32.10.1 (01ZM),
and the properties proper, finite, étale and closed immersion of a morphism between them are
inherited from a finite stage, Lemmas 32.13.1 (081F), 32.8.3 (01ZO), 32.8.10 (07RP) and 32.8.5
(01ZP)); §0.14 *henselian_finiteEtale_equivalence* (More on Algebra, Lemma 15.13.2 (09ZL): for a
henselian pair `(R, I)`, base change is an equivalence from finite étale `R`-algebras to finite
étale `R/I`-algebras) and *henselian_pair_characterisations* (for a henselian pair `(R, I)` and a
finite `R`-algebra `S`, idempotents of `S/IS` lift uniquely to `S`); §2.6
`serre_affineness_criterion` (higher quasi-coherent cohomology vanishes on an affine scheme); §2.7
`supports_localization_triangle` (the long exact sequence of cohomology with supports in a closed
subset and of the complementary open), `localCohomology_module_comparison` (for `A` Noetherian,
cohomology of `M~` with supports in `V(I)` is `H^q_I(M)`), *localCohomology_flat_baseChange* (for a
flat map `A → B` of Noetherian rings, `B ⊗_A H^q_I(M) ≅ H^q_{IB}(B ⊗_A M)`) and
`depth_localCohomology_vanishing` (for `A` Noetherian and `M` finite, `H^q_I(M) = 0` for `q` below
the `I`-depth of `M`); §§4.7–4.8 formal completion along a closed subscheme, `CoherentFormalModule`
and `completionFunctor`. Assumed as stated there.

## How to read the build

Layer 1 works over a fixed Noetherian local ring, except for the general statements on formal
glueing, formal sections and completion that open §1.3. §1.1 fixes the punctured spectrum,
restriction to it and the notion of purity, all Tau Ceti's, and records how they behave in the
degenerate cases; §1.2 completes the anti-equivalence between finite étale covers of the punctured
spectrum and finite normal algebras; §1.3 proves formal glueing of modules and the comparison of
sections with formal sections, and with them compares covers of `A`, of its completion and of a
hypersurface section; §1.4 extends covers from a hypersurface section. Layer 2 proves purity for regular local
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

**Formal glueing.** For a ring map `R → S`, elements `f_1, …, f_t ∈ R` and `I = (f_1, …, f_t)`,
define *FormalGlueData* `R S (f_1, …, f_t)`, the category `Glue(R → S, f_1, …, f_t)` of glueing
data (More on Algebra, Remark 15.91.10 (05EL)). An object is an `S`-module `M′`, an
`R_{f_i}`-module `M_i` for each `i`, isomorphisms `α_i : M′_{f_i} → M_i ⊗_R S` of
`S_{f_i}`-modules and isomorphisms `α_{ij} : (M_i)_{f_j} → (M_j)_{f_i}` of `R_{f_i f_j}`-modules,
such that `(α_{ij} ⊗_R S) ∘ α_i = α_j` as maps `M′_{f_i f_j} → (M_j)_{f_i} ⊗_R S` and
`α_{jk} ∘ α_{ij} = α_{ik}` as maps `(M_i)_{f_j f_k} → (M_k)_{f_i f_j}`. A morphism is an
`S`-linear map together with `R_{f_i}`-linear maps commuting with the `α_i` and the `α_{ij}`.
*Can* sends an `R`-module `M` to `(M ⊗_R S, M_{f_i}, can_i, can_{ij})`, with the canonical
isomorphisms; *H⁰* sends an object to the `R`-module of families
`(m′, m_1, …, m_t) ∈ M′ × ∏_i M_i` with `α_i(m′/1) = m_i ⊗ 1` and `α_{ij}(m_i/1) = m_j/1` for all
`i, j`.

- *H⁰* is right adjoint to *Can*, for every ring map `R → S` (More on Algebra, Lemma 15.91.11
  (0H77)).
- For `R → S` flat, *FormalGlueData* `R S (f_1, …, f_t)` is abelian, with kernels and cokernels
  formed componentwise, and *Can* is exact and commutes with all colimits (Lemma 15.91.13 (05EN)).
- For `R → S` flat and `(f_1, …, f_t) = R`, *Can* and *H⁰* are quasi-inverse equivalences (Lemma
  15.91.14 (05EP)): this is Zariski glueing of modules, and the `S`-component is determined by the
  others.

**Checks.**
- For `S = 0`, `t = 1` and `f_1 = 1`, an object is an `R`-module `M_1` together with the zero
  module, `H⁰(0, M_1) = M_1`, and `Can` and `H⁰` are inverse up to isomorphism, as 05EP asserts for
  the unit ideal. A definition of `H⁰` that kept only the `S`-component would give `0` here.
- For `R = ℤ_(p)`, `S = ℤ_p` and `f_1 = p`, the object `(ℤ_p, ℚ, α_1)`, with `α_1` the identity
  of `ℚ ⊗_{ℤ_(p)} ℤ_p = ℚ_p`, has `H⁰ = ℤ_p ∩ ℚ = ℤ_(p)` inside `ℚ_p`, and it is `Can(ℤ_(p))`,
  because `ℤ_(p) ⊗ ℤ_p = ℤ_p` and `ℤ_(p)[1/p] = ℚ`.
- For `R = ℤ`, `S = 0`, `t = 2`, `f_1 = f_2 = 1` and `M_1 = M_2 = ℤ`, the isomorphisms
  `α_{12} = id` and `α_{21} = −1` (with `α_{11}` and `α_{22}` the identity) violate the cocycle
  condition `α_{21} ∘ α_{12} = α_{11}`. The families of their `H⁰` are the pairs `(m, m)` with
  `m = −m`, so `H⁰ = 0`, and no `Can(M)` is isomorphic to them, since an isomorphism `φ` would
  satisfy `φ_2 = φ_1 = −φ_2`. Without the cocycle condition Zariski glueing (05EP) would fail.

Prove *formalGlueing_equiv* (More on Algebra, Proposition 15.91.16 (05ER) and Remark 15.91.20
(05EU)): if `R → S` is flat and `R/I → S/IS` is bijective, then *Can* and *H⁰* are quasi-inverse
equivalences between `R`-modules and *FormalGlueData* `R S (f_1, …, f_t)`; an `R`-module `M` is
finite, finitely presented, flat, or finite projective (finitely generated and projective) iff
`M ⊗_R S` has that property over `S` and every `M_{f_i}` has it over `R_{f_i}`; and both functors
are compatible with tensor products, so that they restrict to equivalences between `R`-algebras and
glueing data of algebras, and between finite `R`-algebras and glueing data of finite algebras. The
route is that of Stacks. `H⁰ ∘ Can ≅ id` is the exactness of the glueing complex
`0 → M → (M ⊗_R S) × ∏_i M_{f_i} → ∏_i (M ⊗_R S)_{f_i} × ∏_{i,j} M_{f_i f_j}` (Lemma 15.91.9
(05EK)), which rests on the invariance of `I`-power torsion modules under base change along `R → S`
(Tau Ceti `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top`, Lemma 15.91.2 (05E9), and
`TauCeti.isBaseChange_of_primaryComponent_eq_top`, Lemma 15.91.3 (05EC)). For `Can ∘ H⁰ ≅ id`, the
comparison map becomes an isomorphism after base change to each `R_{f_i}` (Lemmas 15.91.14 (05EP)
and 15.91.15 (05EQ)), so it is injective with an `IS`-power torsion cokernel, and the extension it
defines descends to `R` (Lemma 15.91.8 (05EG)). Lemmas 15.91.4–15.91.9, 15.91.12 and 15.91.15 are
steps of this target. The property clauses are base change and descent along `R → S × ∏_i R_{f_i}`,
which is faithfully flat: it is flat, and a prime of `R` either misses some `f_i` or contains `I`,
and then lies under a prime of `S` because `S/IS ≅ R/I`. A module over this finite product is
finite, finitely presented or flat iff each component is, so finiteness descends by Mathlib
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, flatness by
`Module.Flat.of_flat_tensorProduct`, and finite presentation by Tau Ceti
`TauCeti.Huber.IsPseudoCoherentOver.of_baseChange` at level `1` with
`TauCeti.Huber.IsPseudoCoherentOver.one_iff` (Algebra, Lemma 10.83.2 (03C4)). A finitely generated
projective module is a flat finitely presented one (`Module.Flat.projective_of_finitePresentation`,
`Module.finitePresentation_of_projective`), so the last clause follows from the others. Remark
15.91.20 asserts the projectivity clause for every module; beyond finitely generated modules it
rests on the descent of projectivity along faithfully flat maps (Algebra, Theorem 10.95.6 (05A9)),
and this target states the finitely generated case, which is the case the routes below use.

**Checks.**
- For `R = k[x]`, `S = k = R/(x)` and `f_1 = x`, the map `R/(x) → S/xS` is bijective but `S` is not
  flat over `R`. Both `(R ⊗_R S)_x = k_x` and `R_x ⊗_R S = k[x, x⁻¹]/(x)` vanish, so
  `H⁰(Can(R)) = k × k[x, x⁻¹]`, which is not `R` (it has nonzero `x`-divisible elements): flatness
  cannot be dropped from *formalGlueing_equiv*.
- For `R = ℤ`, `S = ℚ` and `f_1 = p`, `S` is flat but `R/pR = 𝔽_p → S/pS = 0` is not bijective,
  and `Can(𝔽_p) = (𝔽_p ⊗ ℚ, (𝔽_p)_p) = (0, 0) = Can(0)`: `Can` sends the identity of `𝔽_p` and the
  zero map to the same morphism, so it is not faithful, and the hypothesis on `R/I → S/IS` cannot
  be dropped either.
- For `R = k[x]`, `S = k⟦x⟧` and `f_1 = x`, which satisfy the hypotheses, the module
  `M = k[x]/(x − 1)` has `M ⊗_R S = k⟦x⟧/(x − 1) = 0`, because `x − 1` is a unit of `k⟦x⟧`, and the
  zero module is flat; but `M_x = k[x, x⁻¹]/(x − 1) ≅ k` is a nonzero torsion module over the
  domain `R_x`, hence not flat, and `M` is not flat over `R`. The property clauses need the
  components `M_{f_i}` as well as `M ⊗_R S`.

**Formal sections and completion.** Prove *formalSections_of_localCohomology* (Algebraic and
Formal Geometry, Lemma 52.12.7 (0EII)): for a Noetherian ring `R`, an ideal `𝔞`, an element
`g ∈ 𝔞` and a finite `R`-module `M`, if `R` is `g`-adically complete and `H¹_𝔞(M)` and `H²_𝔞(M)`
are annihilated by a power of `g`, then, with `W = Spec R ∖ V(𝔞)` and `F` the restriction of `M~`
to `W`, the map `Γ(W, F) → lim_n Γ(W, F/gⁿF)` is bijective. Route: the long exact sequence of
SchemeAndStackFoundations §2.7 `supports_localization_triangle` for `V(𝔞) ⊆ Spec R`, with its
supported terms identified with `H^q_𝔞(M)` by §2.7 `localCohomology_module_comparison` and with
`H^q(Spec R, M~) = 0` for `q > 0` on the affine `Spec R` (§2.6 `serre_affineness_criterion`),
gives `H¹(W, F) ≅ H²_𝔞(M)` and an exact sequence `0 → M/H⁰_𝔞(M) → Γ(W, F) → H¹_𝔞(M) → 0`. The
`g`-power torsion of the coherent `F` on the Noetherian `W` is bounded, so `lim_n Γ(W, F/gⁿF)` is
an extension of the `g`-adic Tate module of `H¹(W, F)` by the `g`-adic completion of `Γ(W, F)`
(the degree-zero case of Algebraic and Formal Geometry, Lemma 52.3.2 (0BLD), a step of this
target), and that Tate module vanishes because `H¹(W, F)` is killed by a power of `g`. Finally
`Γ(W, F)` is `g`-adically complete: the finite module `M/H⁰_𝔞(M)` over the complete Noetherian
`R` is complete, its completion being its base change to the complete `R` (Mathlib
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Algebra, Lemma 10.97.1
(00MA)), and completion keeps an extension by a module killed by a power of `g` exact with the
same quotient (Algebra, Lemma 10.96.4 (0BNG), a step of this target).

Prove *completion_fullyFaithful_of_sections* (Algebraic and Formal Geometry, Lemma 52.15.1
(0EKP)): let `X` be a Noetherian scheme and `Y ⊆ X` a closed subscheme with ideal sheaf `𝓘` and
infinitesimal neighbourhoods `Y_n = V(𝓘ⁿ)`, and consider the conditions
(1) `X` is quasi-affine (Mathlib `Scheme.IsQuasiAffine`) and `Γ(X, 𝒪_X) → lim_n Γ(Y_n, 𝒪_{Y_n})`
is bijective; (2) `X` has an ample invertible module `L`
(`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`) with
`Γ(X, L^{⊗m}) → lim_n Γ(Y_n, L^{⊗m}|_{Y_n})` bijective for all `m ≫ 0`; (3) for every finite
locally free `𝒪_X`-module `E`, `Γ(X, E) → lim_n Γ(Y_n, E|_{Y_n})` is bijective; (4) the completion
functor from coherent `𝒪_X`-modules to coherent formal modules on the completion of `X` along `Y`
(SchemeAndStackFoundations §4.8 `completionFunctor`) is fully faithful on finite locally free
modules. Then (1) ⇒ (2) ⇒ (3) ⇒ (4) and (4) ⇒ (3). Route: (1) ⇒ (2) with `L = 𝒪_X`, which is
ample exactly when `X` is quasi-affine (`TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff`).
(2) ⇒ (3) by a universally exact sequence `0 → E → (L^{⊗p})^{⊕r} → (L^{⊗q})^{⊕s}`, obtained by
dualizing surjections from finite sums of negative powers of `L` onto `Hom(E, 𝒪_X)` and onto the
next cokernel, and the limit of its restrictions to the `Y_n`; those surjections are the
implication (1) ⇒ (8) of Properties of Schemes, Proposition 28.27.13 (01Q3), a step of this
target: for `L` ample on the quasi-compact `X`, every quasi-coherent `𝒪_X`-module of finite type
is a quotient of `(L^{⊗−n})^{⊕k}` for some `n > 0` and `k ≥ 0`. (3) ⇒ (4) by applying (3) to
`Hom(G, F)` for finite locally free `F` and `G`: its sections modulo the powers of `𝓘` form the
morphisms between the completions of `G` and `F` (Cohomology of Schemes, Lemma 30.23.5 (0882), a
step of this target). (4) ⇒ (3) by taking `G = 𝒪_X`, since morphisms `𝒪_X → E` are global
sections and morphisms between the completions are elements of `lim_n Γ(Y_n, E|_{Y_n})`.

**Checks.**
- For `R = k⟦x, y, z⟧`, `𝔞 = 𝔪`, `g = z` and `M = R`, the depth is `3`, so
  `H¹_𝔪(R) = H²_𝔪(R) = 0`, and both sides of *formalSections_of_localCohomology* are `R`:
  `Γ(W, 𝒪_W) = R`, and `Γ(W, 𝒪_W/zⁿ) = R/zⁿ` because `R/zⁿ` has depth `2`.
- For `R = k⟦x, y⟧`, `𝔞 = 𝔪`, `g = x` and `M = R`, `R` is complete but no power of `x` kills
  `H²_𝔪(R)`, since `xⁿ · x^(−n−1)y^(−1) = x^(−1)y^(−1) ≠ 0` there. Here `Γ(W, 𝒪_W) = R`, while
  `Γ(W, 𝒪_W/xⁿ) = (R/xⁿ)[1/y]`, so the limit is `k((y))⟦x⟧`, which contains `y⁻¹`: the map is not
  onto, and the local cohomology hypothesis cannot be dropped.
- For `R = k[x, y, z]` localized at `(x, y, z)`, with `𝔞`, `g = z` and `M = R` as in the first
  Check, the local cohomology hypothesis holds but `R` is not `z`-adically complete:
  `Γ(W, 𝒪_W) = R` maps to the `z`-adic completion `lim_n R/zⁿ`, which contains `∑_n z^(n²)`, a
  power series in `z` that is not a rational function, so the map is not onto and completeness
  cannot be dropped.
- For `X = Spec k[x]` and `Y = V(x)`, condition (1) of *completion_fullyFaithful_of_sections*
  fails, since `k[x] → k⟦x⟧` is not onto, and so does (4): multiplication by `1/(1 − x)` on the
  completion of `𝒪_X` comes from no endomorphism of `𝒪_X`. For `X = Spec k⟦x⟧` and the same `Y`,
  (1) holds, and the completion functor is fully faithful on finite free modules `P`, `Q`, because
  `Hom(P, Q)` is `x`-adically complete.

**Completion and hypersurface sections.** Fix `f ∈ 𝔪` and set `X_0 = Spec (A ⧸ Ideal.span {f})`
with punctured spectrum `U_0` (Stacks, Situation 58.19.1 (0BLF)); restriction from finite étale
schemes over `U` to those over `U_0` is base change along `U_0 → U`. Let `Â` be the `𝔪`-adic
completion, `X′ = Spec Â`, and `U′`, `U′_0` the base changes of `U`, `U_0` to `X′`. Prove, each with
the hypotheses and conclusion of its tag: *finite_extend_of_completion* (Lemma 58.19.3 (0BLH)): if
`V → U` is finite and its base change `V′` to `U′` is the restriction of a scheme `Y′` finite over
`X′`, then `V` is the restriction of a scheme `Y` finite over `X` with `Y′ = Y ×_X X′`;
*extends_iff_completion_extends* (Lemma 58.20.4 (0BLL)): a finite étale `V` over `U` is the
restriction of a finite étale scheme over `X` iff `V′` is the restriction of a finite étale scheme
over `X′`; *restrictHypersurface_fullyFaithful_of_completion* (Lemma 58.19.4 (0BLI)): if
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

The routes are those of Stacks. For *finite_extend_of_completion*, apply *formalGlueing_equiv* to
`A → Â`, which is flat (`AdicCompletion.flat_of_isNoetherian`) and bijective modulo `𝔪`
(`AdicCompletion.pow_smul_top_eq_ker_eval`), and to generators `f_1, …, f_t` of `𝔪`, whose basic
opens cover `U` (`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`): the rings of `Y′` and
of the affine schemes `V ×_U D(f_i)`, with the isomorphisms coming from `V′ = Y′ ×_{X′} U′`, form a
glueing datum of finite algebras, and its `H⁰` is a finite `A`-algebra `B` with `Y = Spec B`. For
*extends_iff_completion_extends*, (1) ⇒ (2) is base change; for (2) ⇒ (1),
*finite_extend_of_completion* gives `Y` finite over `X` with `Y′ = Y ×_X X′`, and `Y` is étale over
`X` because its base change along the faithfully flat `A → Â` is (Mathlib
`Module.FaithfullyFlat.of_flat_of_isLocalHom` and
`Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`; Algebra, Lemmas 10.83.2 (03C4) and
10.143.3 (00U2)). For *restrictHypersurface_fullyFaithful_of_completion*, faithfulness follows from
the faithful flatness of `X′ → X`, and since finite étale schemes have an internal hom compatible
with base change (Stacks, Lemma 58.5.4 (0BL7), a step of this target) it suffices to extend a
section `s_0` of `V_0 → U_0`, for `V` finite étale over `U`, to a section of `V → U`. Over `Â` the
hypothesis gives a section `s′` of `V′ → U′` lifting the base change of `s_0`, and
`V′ = s′(U′) ⊔ W′`. The scheme `W′` is quasi-finite and separated over `X′`, so it is a
quasi-compact open subscheme of a scheme `T` finite over `X′` (Zariski's main theorem in the form of
More on Morphisms, Lemma 37.43.3 (05K0), a step of this target; Mathlib's
`Scheme.Hom.toNormalization` is an open immersion into the relative normalization), and the
scheme-theoretic closure `Z′` of `W′` in `T` is finite over `X′` with `Z′ ×_{X′} U′ = W′`, because
`W′`, being finite over `U′`, is closed in `T ×_{X′} U′`, and the scheme-theoretic image of a
quasi-compact morphism restricts on an open to the scheme-theoretic image of the restricted morphism
(Mathlib `Scheme.ker_morphismRestrict_ideal`; Morphisms, Lemma 29.6.3 (01R8)).
*finite_extend_of_completion* applied to
`Y′ = X′ ⊔ Z′` gives `Y = Spec B` finite over `X` with `Y ×_X U = V` and `Y ×_X X′ = Y′`. The
closure of `s_0(U_0)` in `Y ×_X X_0` is open and closed: its preimage in `Y′ ×_{X′} X′_0` is the
closure of the preimage of `s_0(U_0)`, because the scheme-theoretic image of a quasi-compact
morphism has the closure of the image as underlying set (Mathlib `Scheme.Hom.support_ker`; 01R8)
and commutes with flat base change
(Morphisms, Lemma 29.26.16 (081I), a step of this target); that closure is the open and closed
`X′_0` when `U_0` is nonempty and is empty otherwise; and the faithfully flat quasi-compact
`Y′ ×_{X′} X′_0 → Y ×_X X_0` is submersive (Mathlib
`AlgebraicGeometry.Flat.isQuotientMap_of_surjective`; Morphisms, Lemma 29.26.12 (02JY)); its
idempotent in `B/fB` lifts to an idempotent of `B` along the henselian pair `(A, (f))`
(SchemeAndStackFoundations §0.14 *henselian_pair_characterisations*), whose open and closed
subscheme of `Y` maps isomorphically to `X` by faithfully flat descent and gives the section. For
*completion_fullyFaithful_of_localCohomology*, apply (1) ⇒ (4) of
*completion_fullyFaithful_of_sections* to the quasi-affine `Spec R ∖ V(𝔞)`
(`Scheme.IsQuasiAffine.of_isImmersion`) and its closed subscheme cut out by `g`; condition (1) is
*formalSections_of_localCohomology* for `M = R`. For
*restrictHypersurface_fullyFaithful_of_localCohomology*, the hypotheses pass to `Â`: its local
cohomology is the base change of that of `A` (§2.7 *localCohomology_flat_baseChange*); `Â` is
complete for its maximal ideal (Mathlib `AdicCompletion.isAdicComplete_of_fg`), hence `fÂ`-adically
complete (Tau Ceti `IsAdicComplete.span_singleton_of_mem`, the principal case of Algebra, Lemma
10.96.8 (090T)), so `(Â, fÂ)` is a henselian pair
(Mathlib `IsAdicComplete.henselianRing`; More on Algebra, Lemma 15.11.4 (0ALJ)).
*restrictHypersurface_fullyFaithful_of_completion* reduces to `A` complete, and then
*fullyFaithful_of_completion_coherent* for `U ⊇ U_0` with
*completion_fullyFaithful_of_localCohomology* for `R = A`, `𝔞 = 𝔪` and `g = f` gives the claim. For
*restrictHypersurface_fullyFaithful*, `depth A ≥ 3` makes `H¹_𝔪(A)` and `H²_𝔪(A)` vanish (§2.7
`depth_localCohomology_vanishing`, Mathlib's depth along `𝔪` being the supremum of the lengths of
regular sequences in `𝔪` by `Ideal.depth_eq_sSup_length_isRegular`).
*Needs:* Tau Ceti `TauCeti.IsLocalRing.puncturedSpectrum`,
`TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`, `TauCeti.FiniteEtaleScheme.pullback`,
`TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top`,
`TauCeti.isBaseChange_of_primaryComponent_eq_top`,
`TauCeti.Huber.IsPseudoCoherentOver.of_baseChange`, `TauCeti.Huber.IsPseudoCoherentOver.one_iff`,
`TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple`,
`TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff`,
`IsAdicComplete.span_singleton_of_mem`; SchemeAndStackFoundations §0.14 (henselian pairs,
*henselian_pair_characterisations*), §2.6 (`serre_affineness_criterion`), §2.7
(`supports_localization_triangle`, `localCohomology_module_comparison`,
*localCohomology_flat_baseChange*, `depth_localCohomology_vanishing`), §§4.7–4.8 (formal
completion, `CoherentFormalModule`, `completionFunctor`); Mathlib `IsLocalRing.depth`,
`Ideal.depth_eq_sSup_length_isRegular`, `AdicCompletion`,
`AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.pow_smul_top_eq_ker_eval`,
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`,
`AdicCompletion.isAdicComplete_of_fg`, `IsAdicComplete.henselianRing`, `localCohomology`,
`Scheme.IsQuasiAffine`, `Scheme.IsQuasiAffine.of_isImmersion`, `Scheme.Hom.toNormalization`,
`Scheme.Hom.image`, `Scheme.Hom.support_ker`, `Scheme.ker_morphismRestrict_ideal`,
`AlgebraicGeometry.Flat.isQuotientMap_of_surjective`,
`Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `Module.Flat.of_flat_tensorProduct`,
`Module.Flat.projective_of_finitePresentation`, `Module.finitePresentation_of_projective`,
`Module.FaithfullyFlat.of_flat_of_isLocalHom`,
`Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`.

### 1.4 The local Lefschetz extension theorem

Prove *finiteEtale_extend_of_localCohomology* (Stacks, Lemma 58.20.6 (0BLS)): in Situation 58.19.1,
let `V` be finite étale over `U`; if `H¹_𝔪(A)` and `H²_𝔪(A)` are annihilated by a power of `f` and
the restriction of `V` to `U_0` is the restriction of a finite étale `Y_0` over `X_0`, then `V` is
the restriction of a finite étale scheme over `X`. Prove *finiteEtale_extend_of_hypersurface*
(Stacks, Lemma 58.20.7 (0BLM)): the same conclusion with `depth A ≥ 3` in place of the
local-cohomology hypothesis. For 0BLS, reduce to the complete case by
*extends_iff_completion_extends*: the hypotheses pass to `Â`, the local cohomology of `Â` being
the base change of that of `A` (SchemeAndStackFoundations §2.7 *localCohomology_flat_baseChange*)
and `Y_0 ×_{X_0} X′_0` extending the restriction of `V′` to `U′_0`. The pair `(Â, fÂ)` is
henselian, `Â` being `fÂ`-adically complete (§1.3, the route of
*restrictHypersurface_fullyFaithful_of_localCohomology*). Lift `Y_0` along it by
SchemeAndStackFoundations §0.14 *henselian_finiteEtale_equivalence*, and identify the two covers of
`U` by *restrictHypersurface_fullyFaithful_of_localCohomology* (§1.3). For 0BLM, `depth A ≥ 3`
makes `H¹_𝔪(A)` and `H²_𝔪(A)` vanish (SchemeAndStackFoundations §2.7
`depth_localCohomology_vanishing`, with Mathlib's depth along `𝔪` identified with the supremum of
the lengths of regular sequences in `𝔪` by `Ideal.depth_eq_sSup_length_isRegular`), and 0BLS
applies.
*Needs:* §1.3; SchemeAndStackFoundations §0.14 (*henselian_finiteEtale_equivalence*), §2.7
(*localCohomology_flat_baseChange*, `depth_localCohomology_vanishing`); Mathlib
`IsLocalRing.depth`, `Ideal.depth_eq_sSup_length_isRegular`.

### Examples

- For `A = k⟦x, y, z⟧` and `f = z`, `A` is complete, so `(A, (z))` is a henselian pair, and
  `depth A = 3`. Restriction from finite étale covers of `U` to those of `U_0`, the punctured
  spectrum of `k⟦x, y⟧`, is fully faithful (*restrictHypersurface_fullyFaithful*), and a cover of
  `U` whose restriction to `U_0` extends to `Spec k⟦x, y⟧` extends to `Spec A`
  (*finiteEtale_extend_of_hypersurface*).
- For `A` a complete normal local domain of dimension `≥ 3` and `0 ≠ f ∈ 𝔪`, the local-cohomology
  hypothesis of *finiteEtale_extend_of_localCohomology* holds even when `depth A = 2` (Stacks, the
  remark before Lemma 58.20.5 (0EK6)); this is the case 0BLS covers and 0BLM does not.
- For `A = k⟦x, y⟧`, the anti-equivalence of §1.2 sends the cover `U ⊔ U` to `A × A`. For
  `char k ≠ 2`, the restriction of `Spec A[z]/(z² − x)` to `U` is not a finite étale cover of `U`:
  it is étale at every prime not containing `z`, where `x = z²` and the derivative `2z` are units,
  and ramified at the prime `(z)` over the curve `x = 0`, which matches the exclusion of
  `A[z]/(z² − x)` from `FiniteNormalPuncturedEtaleAlg A`. For `char k = 2` the derivative `2z`
  vanishes, so `Ω_{B/A} = B·dz` is nonzero at every prime of `B = A[z]/(z² − x)`, and `B` is étale
  at no prime; it is excluded as well.

### Dependencies

Tau Ceti: finite étale schemes and their base change, the punctured spectrum, restriction and
purity, the sections results (0BM8, 0BLK), the full faithfulness half of 0BM9, the depth bound
for normal local domains, the base change of power-torsion modules along a formal glueing map
(05E9, 05EC), faithfully flat descent of finite presentation, completeness for a principal
subideal, and ample line-bundle classes. Mathlib: integral closure in a finite separable extension,
depth, adic completion, local cohomology, faithfully flat descent of finiteness, flatness and
étaleness, quasi-affine schemes, scheme-theoretic images, submersivity of faithfully flat
quasi-compact morphisms and Zariski's main theorem. SchemeAndStackFoundations §§0.14 (henselian
pairs and their finite étale algebras), 2.6 (cohomology of affine schemes), 2.7 (local cohomology,
its flat base change and its vanishing below the depth) and 4.7–4.8 (formal completion, coherent
formal modules and the completion functor).

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
maximal ideals of `B`, `Algebra.IsUnramifiedAt` at the primes not over `𝔪`) follow from those of
(2). For `d ≥ 3`, an element `f ∈ 𝔪 ∖ 𝔪²` gives `A ⧸ Ideal.span {f}` regular
(`TauCeti.IsRegularLocalRing.quotient_span_singleton`) of dimension `d − 1 ≥ 2`: `f` is a nonzero
element of the domain `A`, hence a non-zero-divisor, and lies in the Jacobson radical `𝔪`, so
`dim A ⧸ Ideal.span {f} + 1 = d`
(`ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_jacobson`); `A` has depth `d ≥ 3`
(`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`); clause (1) for `A ⧸ Ideal.span {f}`, the
induction hypothesis, extends the restriction of a cover `V` of `U` to `U_0`, and
*finiteEtale_extend_of_hypersurface* (§1.4) extends `V`.
*Needs:* §§1.2, 1.4; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.IsLocalRing.restrictPuncturedSpec.fullyFaithful`,
`TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`,
`TauCeti.IsRegularLocalRing.quotient_span_singleton`, `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`,
`TauCeti.IsRegularLocalRing.isDomain`, `TauCeti.isRegularRing_of_isRegularLocalRing`,
`TauCeti.IsRegularRing.isIntegrallyClosed`; Mathlib `IsRegularLocalRing`, `Algebra.Etale`,
`Algebra.IsEtaleAt`, `Algebra.IsUnramifiedAt`,
`ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_jacobson`.

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
the limit of its affine open neighbourhoods `W`. For the given scheme `Y` over `Spec 𝒪_{S,s}` and
its descent `Y_W` to some `W`, the clauses of §0.9 make `Y_W → W` proper, finite or étale when
`Y` is, after shrinking `W`; separatedness follows from the closed-immersion clause applied to the
diagonal `Y_W → Y_W ×_W Y_W`, a morphism between schemes of finite presentation over `W` whose
limit is the diagonal of `Y` (Limits, Lemma 32.8.6 (01ZQ), a step of this target). Each property
then holds over `U` and over `W`, hence over `U ∪ W`, being local on the base. Prove
`finiteEtale_extend_of_purity` (Stacks, Lemma 58.21.6 (0EY7)): for a Noetherian scheme `X` and an
open `U ⊆ X` with `TauCeti.IsLocalRing.PurityHolds 𝒪_{X,x}` for every `x ∉ U`, restriction from
finite étale schemes over `X` to finite étale schemes over `U` is essentially surjective. The proof is Noetherian
induction on the complement: at the generic point `x` of an irreducible component of `X ∖ U`, the
preimage of `U` in `Spec 𝒪_{X,x}` is its punctured spectrum, purity extends the cover there, and
*spread_from_localScheme* extends it to a larger open. Prove *restrictOpen_fullyFaithful_of_depth*
(*API*): for a locally Noetherian scheme `X` and an open `U` with `depth 𝒪_{X,x} ≥ 2` for every
`x ∉ U`, restriction from finite étale schemes over `X` to finite étale schemes over `U` is fully
faithful. Over an affine open `Spec R` this is Tau Ceti's
`TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`, the local ring of the affine open
at a point being that of `X` (`Scheme.Opens.stalkIso`) and the stalk of `Spec R` at `𝔭` being
`R_𝔭` (`Spec.stalkIso`); the uniqueness of extended morphisms makes them agree on overlaps, and
they glue over an affine open cover (`Scheme.Cover.glueMorphisms`). Prove `finiteEtale_extend_of_regular_codimTwo`
(*API*; SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i), the essential surjectivity half of
the equivalence stated there; for `X` regular it is SGA 1, Exposé X, Corollaire 3.3, whose
hypothesis that `X ∖ U` has codimension `≥ 2` makes every local ring along it of dimension `≥ 2`):
for a locally Noetherian scheme `X` and an open `U` such that `𝒪_{X,x}` is a regular local ring of
dimension `≥ 2` for every `x ∉ U`, restriction is essentially surjective. Cover `X` by affine
opens `X_i`, which are Noetherian. On each `X_i` the local rings at the points outside `U` are those
of `X` (`Scheme.Opens.stalkIso`), so purity holds there by
`IsLocalRing.purityHolds_of_isRegularLocalRing`, and `finiteEtale_extend_of_purity` extends the
restriction of a cover `V` of `U` to a finite étale `Y_i` over `X_i`. On `X_i ∩ X_j` the
restrictions of `Y_i` and `Y_j` both extend the restriction of `V`, so they are isomorphic by a
unique isomorphism compatible with those of `V`, by *restrictOpen_fullyFaithful_of_depth*, a
regular local ring of dimension `d` having depth `d`
(`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`); by this uniqueness the isomorphisms satisfy
the cocycle condition, and the `Y_i` glue (Mathlib `Scheme.GlueData`) to a finite étale scheme over
`X` that extends `V`.
*Needs:* §2.1; SchemeAndStackFoundations §0.9; Tau Ceti `TauCeti.IsLocalRing.PurityHolds`,
`TauCeti.FiniteEtaleScheme.pullback`, `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`,
`TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`; Mathlib `IsNoetherian`, `IsLocallyNoetherian`,
`Scheme.Opens`, `IsAffineOpen`, `Scheme.Opens.stalkIso`, `Spec.stalkIso`,
`Scheme.Cover.glueMorphisms`, `Scheme.GlueData`, `IsLocalRing.depth`.

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
affine opens and their stalks, gluing of morphisms and of schemes, and the dimension of the
quotient of a Noetherian ring by a non-zero-divisor in its Jacobson radical.

## Stacks alignment

*Exact*: the tag's hypotheses and conclusion, in Mathlib's vocabulary. *Adapted*: same mathematics
in a different packaging, with the difference stated at the target. *Corrected*: the tag as
written is false and the target adds the missing hypothesis (Convention 5). *API*: no Stacks
counterpart.

| § | Target | Stacks | Class |
| --- | --- | --- | --- |
| 1.2 | *restrictPuncturedSpec_essSurj* | 58.20.3 (0BM9), essential surjectivity | corrected; no dimension bound |
| 1.2 | *finiteNormalEquiv* | 58.20.3 (0BM9) | corrected |
| 1.3 | *FormalGlueData*, *Can*, *H⁰* | 15.91.10 (05EL) | exact |
| 1.3 | *formalGlueing_equiv* | 15.91.16 (05ER), 15.91.20 (05EU) | adapted: the projectivity clause for finitely generated modules |
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
- [AbhyankarLemma](../AbhyankarLemma/README.md) Layer 2 consumes §2.1 and §2.2
  (*spread_from_localScheme*, `finiteEtale_extend_of_purity`, `finiteEtale_extend_of_regular_codimTwo`)
  for the extension of covers unramified or tamely ramified in codimension one and for Abhyankar's
  lemma (Stacks 0EYE–0EYH).
- PurityForFlatCohomology consumes §1.3 (*extends_iff_completion_extends*, and the formal-section
  comparison *formalSections_of_localCohomology*) and §§2.1–2.2.
- CrystallineCohomology consumes §§2.1–2.2 (purity for regular local rings and the extension of
  finite étale covers across points where purity holds).
- EtaleHomotopyTypes consumes §2.2 (*restrictOpen_fullyFaithful_of_depth* and
  `finiteEtale_extend_of_purity`).

## Provenance

This section is secondary; it maps targets to an existing formalization and prescribes nothing.
The repository https://github.com/tdupu/pcfawd-formalization (Apache-2.0; T. Dupuy, T. Tucker,
Z. Wang; Lean 4, Mathlib), built for the "PCF all the way down" theorem, contains a development of
this material. Tau Ceti's modules on the punctured spectrum and on restriction to it and purity
(`AlgebraicGeometry/PuncturedSpectrum.lean`, `AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean`)
record that they are ported from it, at commit `9a20b3f`. The paths in the table are under
`library/Pcf/Stacks/Purity/` at the later commit `d28f90d`.

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

- The Stacks Project, Chapters 10 (Algebra), 15 (More on Algebra), 28 (Properties of Schemes), 29
  (Morphisms of Schemes), 30 (Cohomology of Schemes), 32 (Limits), 37 (More on Morphisms), 49
  (Discriminants), 52 (Algebraic and Formal Geometry) and 58 (Fundamental Groups of Schemes),
  https://stacks.math.columbia.edu.
- A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et
  globaux* (SGA 2), Exposé X: Définitions 3.1–3.2 (pure pairs and pure local rings), Proposition
  3.3 (purity of a pair is purity of the local rings along the closed subset) and Théorème 3.4 (i)
  (a regular Noetherian local ring of dimension `≥ 2` is pure).
- A. Grothendieck, *Revêtements étales et groupe fondamental* (SGA 1), Exposé X: Corollaire 3.2 (a
  local form of clause (2) of 0BMA, stated there as a consequence of the purity theorem and proved
  there only in dimension two) and Corollaire 3.3 (for `X` locally Noetherian regular and `Z`
  closed of codimension `≥ 2`, restriction of étale covers from `X` to `X ∖ Z` is an equivalence).
