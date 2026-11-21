<!--tauceti-status:v1 {"roadmap":"PurityOfBranchLocus","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f","ts":"2026-11-18T04:36:49Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 2","remaining":"unconditional 0BMB beyond local dimension two (needs LocalPurity in dimension at least 3), its Stacks and affine forms, the global corollary 2.2, and 2.3","state":"partial"}],"readme_sha":"c4ec4a97a7307d11c374c29b8f601fea4946773cf7811c4280d30c969de44183","roadmap":"PurityOfBranchLocus","to_sha":"bf5b062a82c430e6c3f39b8852bf98ffdcef428f"}-->
# Status: PurityOfBranchLocus

This file documents the status of the PurityOfBranchLocus roadmap up until `bf5b062` (2026-11-18T04:36:49Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap's single layer is partial. Purity of the branch locus (Stacks 0BMB) is proved at the scheme level in local dimension one and two. In every dimension it is reduced to purity for regular local rings, which the library has only in dimension two. The global criterion for finite covers and the codimension-one statements for the loci have not begun.

### Named results

- **Purity of the branch locus in local dimension one or two** — at a quasi-finite point with a normal source stalk and a regular target stalk of dimension one or two, at most that of the source, a morphism unramified at every codimension-one generization is étale on a neighbourhood ([`Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne_of_ringKrullDim_le_two`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/Purity.html#AlgebraicGeometry.Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne_of_ringKrullDim_le_two)).
- **Purity of the branch locus from purity for regular local rings** — the same statement in any dimension d, assuming purity for regular local rings of dimension between two and d ([`Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne_of_purityHolds`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/Purity.html#AlgebraicGeometry.Scheme.Hom.exists_etale_of_formallyUnramified_stalk_codimOne_of_purityHolds)). This is the whole of Stacks' induction, with LocalPurity's input left as a hypothesis.
- **The finite-algebra form** — a finite torsion-free algebra with normal local rings over a Noetherian normal domain, unramified at its height-one primes, is étale once purity holds at the base's localizations of height at least two ([`TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_purityHolds`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/BranchPurity.html#TauCeti.Algebra.etale_of_isUnramifiedAt_height_eq_one_of_purityHolds)).
- **Unramified points are étale over a normal base** — for a dominant, locally finite type morphism of integral schemes onto a normal locally Noetherian scheme, the ramification locus is the non-étale locus (SGA 1 I 9.5, [`Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.html#AlgebraicGeometry.Scheme.Hom.ramificationLocus_eq_nonEtaleLocus)). It is proved without purity, and makes §2.3 a statement about either locus.
- **Serre's characterization of regular local rings** — a Noetherian local ring is regular iff its residue field has finite projective dimension, iff it has finite global dimension ([`TauCeti.isRegularLocalRing_tfae`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.html#TauCeti.isRegularLocalRing_tfae)). Its consequence that localizations of regular local rings are regular (0AFS) carries regularity to the primes in the induction.

### Notable definitions and infrastructure

- **Étale-local models with finite stalk maps** ([`Scheme.Hom.exists_etale_square_finite_stalkMap`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/ElementaryEtale/Stalk.html#AlgebraicGeometry.Scheme.Hom.exists_etale_square_finite_stalkMap)) — built from elementary étale localization (02LK), it replaces a quasi-finite point by a finite one without changing whether the morphism is étale there. This is the step that turns the geometric theorem into the algebraic one.
- **The ramification, non-étale and branch loci** ([`Scheme.Hom.ramificationLocus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.html#AlgebraicGeometry.Scheme.Hom.ramificationLocus), [`Scheme.Hom.branchLocus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.html#AlgebraicGeometry.Scheme.Hom.branchLocus)) — closed under the expected hypotheses, so the codimension-one statements of §2.3 have something to be about.
- **Normality under étale maps** ([`Scheme.Hom.isDomain_and_isIntegrallyClosed_stalk_iff_of_etale`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/Etale/Normal.html#AlgebraicGeometry.Scheme.Hom.isDomain_and_isIntegrallyClosed_stalk_iff_of_etale)) — with the matching statements for regularity and dimension, it carries the hypotheses of 0BMB to the étale-local model.

### Roadmap coverage

The README now has one layer, Layer 2; the pointwise vocabulary, loci and étale localization it rests on are treated as library inputs, and all of them are in place. Layer 2 is partial. In §2.1, 0BMB is proved in local dimension one and two and conditionally in general; its target is stated with the target stalk's dimension at most that of the source, rather than equal. The unconditional statement `exists_etale_of_formallyUnramified_stalk_codimOne`, its Stacks form and its affine form are missing. §2.2 (`etale_of_etaleAt_codimOne`) and §2.3 (the two maximal-locus statements) are untouched apart from the lifting step from a maximal branch point to a maximal ramified point.

## The frontier

- **0BMB in general dimension** — discharge the purity hypothesis of the conditional theorem. The blocker is purity for regular local rings in dimension at least three (LocalPurity §2.1); the library proves it only in dimension two.
- **The global corollary** `etale_of_etaleAt_codimOne` — a finite, dominant, generically étale morphism from a normal to a regular integral scheme is étale iff it is unramified in codimension one. The route is pointwise 0BMB plus the equality of local dimensions. Stated now, it would need either the general theorem or a purity hypothesis, though for bases of dimension at most two the proved case already suffices.
- **Purity of the ramification and branch loci** — `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` and its branch-locus counterpart. The lift from a maximal branch point to a maximal ramified point is proved ([`exists_maximal_ramificationLocus_over_of_maximal_branchLocus`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Morphisms/BranchLocus.html#AlgebraicGeometry.Scheme.Hom.exists_maximal_ramificationLocus_over_of_maximal_branchLocus)); what remains needs 0BMB at the maximal points.
- **The Stacks and affine forms of 0BMB** — `etaleAt_of_unramifiedAt_codimOne` and `Algebra.isEtaleAt_of_purity`. Both should follow formally from the scheme form through the stalk and Spec comparisons, and could be proved now in their conditional or low-dimensional versions.
