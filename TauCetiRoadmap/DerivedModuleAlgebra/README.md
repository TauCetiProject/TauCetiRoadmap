# Roadmap: derived module algebra

**Summary.** Construct the module algebra underlying cotangent complexes, integral derived powers,
unbounded derived tensor and Hom in `D(R)`, inverse limits and completion. Polynomial laws and divided-power
grading provide the integral power inputs; Koszul complexes control regular quotients and completion.
The resulting theory includes square-zero deformation classes, effectivity of compatible perfect
systems, Matlis duality and convergent first-quadrant double-complex spectral sequences.

## Scope and ownership

This roadmap owns homogeneous and multiplicative polynomial laws, the non-determinant Roby algebra
and augmentation theory, linear-functional Koszul complexes, module K-injective and K-flat models,
simplicial polynomial resolutions, the full cotangent complex and its integral powers, the exactness
of module-derived limits and derived completion, ordinary-module perfectness and finite models, perfect inverse-system
effectivity, and the specified Matlis and spectral-sequence contracts. Objects and comparisons use
Mathlib's carriers and the pinned Tau Ceti APIs. The targets of §§0.DP.1–0.DP.3, the Koszul
complex of §0.K.1 apart from its algebra-map and mapping-cone clauses, the K-injective replacement
functor of §0.I.1, the K-flat replacement of §0.2 with flat terms, Lazard's theorem in §0.2.1, the
Alexander–Whitney maps of §0.2.2, the derived Hom with its cohomology in §1.1.1, the complete
flatness of flat modules in §1.7, and the injective hulls, completion action, finite-length
biduality and Artinian criterion of §1.M.2 are formalised at the pinned Tau Ceti; each such target
names its declarations, and later sections consume them from Tau Ceti (Exact supplier contracts).

The generic algebra of countable module towers `ℕᵒᵖ ⥤ ModuleCat R` over an associative unital ring
is Tau Ceti's (Exact supplier contracts): the difference map, `lim` and `lim¹`, the six-term and
Milnor sequences, Mittag–Leffler vanishing, cofinal reindexing, the homotopy limit as the shifted
cone of the difference map, and the derived limit functor `TauCeti.ModuleTower.derivedLimit` with
its localization comparison, shift isomorphisms and identification with the termwise limit. The
maps of homotopy limits induced by tower maps whose squares commute up to specified homotopies
belong to [AlgebraicTopology](../AlgebraicTopology/README.md) Stage 6, item 0 (*Countable
inverse-system algebra*, its homotopy-commuting product squares). Section 1.1 here owns the
exactness of the derived limit, its cone comparison for chain maps of towers, and its compatibility
with the Milnor, cofinal and homotopy-square maps. Topological tower adapters remain with AlgebraicTopology Stages 2–3 and
Stage 6. Citations of §1.T.1 (*Towers, `lim` and `lim¹`*, with its targets *lim and lim¹ of a tower*, *Mittag-Leffler towers*, *Mittag-Leffler
towers have vanishing lim¹*, *The six-term sequence of lim and lim¹*, *The Milnor sequence for
towers of complexes*) resolve to the Tau Ceti tower declarations listed in Exact supplier contracts.

Other roadmaps cite objects of this roadmap by the Lean names in the left column; each resolves to
the section, or the pinned declaration, in the right column.

| Cited names | Resolve to |
| --- | --- |
| `PD.augmentation`, `PD.augmentationIdeal` | §0.DP.3: Tau Ceti `DividedPowerAlgebra.augmentation` and `DividedPowerAlgebra.augmentationIdeal` |
| `moduleKInjectiveReplacement` | §0.I.1: Tau Ceti `CochainComplex.exists_quasiIso_isKInjective` and `TauCeti.kInjectiveReplacement` |
| `Algebra.CotangentComplex.PolynomialResolution`, `Algebra.CotangentComplex.PolynomialResolution.comparison`, `Algebra.CotangentComplex.PolynomialResolution.toQuasiIso` | §0.1 |
| `DerivedDeRham.derivedTensor`, `derivedTensor_flatModel`, `derivedTensor_triangulated`, `derivedTensor_kFlatColimit`, `derivedTensor_kFlatRealization` | §0.2: the bifunctor, its bounded-above flat model, its exactness, and K-flatness of filtered colimits and of totalizations |
| `DerivedDeRham.leftDerivedNonadditive` | §0.3 |
| `Algebra.CotangentComplex.homologyZeroIso`, `Algebra.CotangentComplex.arrowFunctor`, `arrowResolution`, `resolutionRings`, `resolutionRingMap`, `resolutionRingMap_identity`, `resolutionRingMap_composition`, `resolutionRingMap_zero_target`, `arrowModel`, `arrowModelMap`, `arrowModelMap_tmul`, `termIso`, `face_tmul`, `cotangent_model_test_two_faces` | §0.4: the full cotangent complex, its arrow-category model and its Checks |
| `Algebra.CotangentComplex.SquareZeroExtension`, `Algebra.CotangentComplex.extensionCategory`, `Algebra.CotangentComplex.extensionCategory_zero`, `Algebra.CotangentComplex.extensionCategory_polynomial`, `extensionSetoid`, `Algebra.CotangentComplex.extensionClass`, `Algebra.CotangentComplex.extensionClass_mk`, `Algebra.CotangentComplex.exal_add_representative`, `Algebra.CotangentComplex.morphismObstruction`, `Algebra.CotangentComplex.morphismObstruction_cocycle`, `derivationZero`, `derivationPostcompose` | §0.5 |
| `Algebra.CotangentComplex.extZero`, `Algebra.CotangentComplex.extOne`, `Algebra.CotangentComplex.extensionClass_add`, `Algebra.CotangentComplex.conormalComparison`, `Algebra.CotangentComplex.conormalComparison_extensionClass`, `conormalComparison_zero`, `conormalComparison_identity`, `conormalComparison_zmodNine` | §0.6 |
| `Algebra.CotangentComplex.homologyOneIso` | §0.7 |
| `Algebra.CotangentComplex.transitivityTriangle`, `Algebra.CotangentComplex.transitivityFirst`, `Algebra.CotangentComplex.transitivityFirst_tmul`, `Algebra.CotangentComplex.transitivitySecond`, `Algebra.CotangentComplex.transitivitySecond_apply`, `transitivityFirst_identity`, `transitivityFirst_zero_source`, `transitivityFirst_polynomial`, `transitivitySecond_identity`, `transitivitySecond_zero_target`, `transitivitySecond_regular_quotient` | §0.8 |
| `Algebra.CotangentComplex.diagonalComparison`, `diagonalModel` | §0.9 |
| `Algebra.CotangentComplex.baseChange` | §0.10 |
| `Algebra.CotangentComplex.filteredColimit` | §0.11 |
| `Algebra.CotangentComplex.smooth` | §0.12 |
| `Algebra.CotangentComplex.regularQuotient` | §0.13 |
| `DerivedDeRham.derivedExteriorPower` | §0.14 |
| `Algebra.CotangentComplex.flatDeformation`, `Algebra.CotangentComplex.liftMorphism`, `Algebra.CotangentComplex.kernelExtensionClass`, `Algebra.CotangentComplex.kernelExtensionClass_zero`, `Algebra.CotangentComplex.deformationObstruction`, `Algebra.CotangentComplex.deformationObstruction_zero`, `Algebra.CotangentComplex.derivationEvaluation`, `Algebra.CotangentComplex.derivationEvaluation_differential`, `Algebra.CotangentComplex.derivationEvaluation_zero`, `Algebra.CotangentComplex.transitivityConnecting`, `Algebra.CotangentComplex.transitivityConnecting_triangle`, `Algebra.CotangentComplex.transitivityConnecting_identity_source`, `Algebra.CotangentComplex.transitivityTriangle_cone_sign`, `Algebra.CotangentComplex.polynomialLift_sign`, `Algebra.CotangentComplex.polynomialLift_positive` | §0.25 |
| `DoubleComplex.totalCohomology_of_exact_rows`, `DoubleComplex.edgeBottom`, `DoubleComplex.edgeLeft`, `DoubleComplex.spectralSequence_map` | §S.1: the exact-rows comparison, the edge morphisms and naturality |
| `CompactCoefficients.Tower`, `CompactCoefficients.Tower.toModuleFunctor`, `CompactCoefficients.Tower.limComparison`, `CompactCoefficients.Tower.limOneComparison` | Tau Ceti `TauCeti.ModuleTower` over `ℤ`, with `TauCeti.ModuleTower.lim` and `TauCeti.ModuleTower.limOne` |
| `CompactCoefficients.Tower.lim`, `CompactCoefficients.Tower.limOne`, `CompactCoefficients.Tower.shift`, `ModuleTower.Product`, `ModuleTower.lim`, `ModuleTower.limOne`, `ModuleTower.shift`, `ModuleTower.productMap`, `ModuleTower.limMap`, `ModuleTower.limOneMap` | Tau Ceti `TauCeti.ModuleTower.lim`, `TauCeti.ModuleTower.limOne`, the product `TauCeti.ModuleTower.Product` of the terms, the difference map `TauCeti.ModuleTower.shift` on it, and the maps `TauCeti.ModuleTower.productMap`, `TauCeti.ModuleTower.limMap` and `TauCeti.ModuleTower.limOneMap` induced by a map of towers; over `ℤ` for the `CompactCoefficients` names |
| `CompactCoefficients.Tower.isMittagLeffler_of_finite` | Tau Ceti `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian` (finite abelian groups are Artinian `ℤ`-modules) |
| `DerivedDeRham.derivedLimit` | Tau Ceti `TauCeti.ModuleTower.derivedLimit` |
| `derivedLimit_surjective`, `derivedLimit_milnor`, `limOne_mul_p` | §1.1: the degreewise-surjective model with its Milnor maps, and the multiplication-by-`p` Check |
| `DerivedDeRham.moduleDerivedHom` | Tau Ceti `TauCeti.derivedHom` (§1.1.1) |
| `DerivedDeRham.completionAdjunction` | §1.3, `DerivedDeRham.derivedCompleteness_isRightAdjoint` |
| `DerivedDeRham.completeNakayama` | §1.3, derived Nakayama |
| `DerivedDeRham.koszulCompletionTower` | §1.4 |
| `DerivedDeRham.ordinaryQuotientCompletion` | §1.5 |
| `DerivedDeRham.simplicialRingCompletion`, `ringCompletionUnit` | §1.6 |
| `DerivedDeRham.completeFlatness`, `DerivedDeRham.completeFlatBaseChange` | §1.7 |
| `DerivedDeRham.boundedTorsionCriterion` | §1.8; for modules, `DerivedDeRham.isAdicComplete_of_isCompletelyFlatModule` and `DerivedDeRham.isCompletelyFlatModule_of_isAdicComplete` |
| `DerivedDeRham.completeFlatDescent` | §1.9 |
| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |
| `DerivedDeRham.perfectInverseSystemEffectivity` | §1.E.1 |

The sheaf enhancement, point-site and affine comparisons belong to EnhancedDerivedSheaves
§§0.1–0.3 and E1.F3.H1/E1.8.DMA.1. The DG/module realization, dualizable comparison and traces
belong to EtaleCohomologyFoundations F.10.3: its realization is an equivalence onto the full
subcategory of ordinary perfect module complexes, natural in maps and coefficients and compatible
with shifts, scalar extension, tensor, duals and finite filtrations; on finite-projective
representatives its trace is the alternating termwise trace. KhovanovHomology K5 owns its bounded
projective resolution model over the dual numbers, with quantum gradings, dot actions and the
connected-sum comparison; §0.2 here supplies the comparison with general module-derived tensor.

## Conventions

Rings are commutative except where multiplicative polynomial laws, module K-injective replacements,
the homotopy invariance of levelwise functors in §0.3, generic towers or ordinary-module perfectness
explicitly permit associative unital rings. Complexes
are cohomologically indexed; simplicial or Koszul homological degree `n` becomes cohomological
degree `−n`, and `[1]` shifts a discrete module to degree `−1`. Connective means `D^(≤0)`. Exterior powers impose repeated-factor vanishing even at `2`.
Towers have transitions from `n+1` to `n`, and limits retain their module actions and all connecting maps.
Every derived completion functor and unit carries a finite-generation witness for the ideal.

The section labels identify the mathematical contracts; §0.7 precedes §0.6 in construction order.


## Exact supplier contracts

The tower algebra and the derived limit are Tau Ceti's; the homotopy-square maps of towers are
AlgebraicTopology Stage 6, item 0. Other targets use Mathlib, implemented Tau Ceti APIs and earlier
sections here. Missing constructions specified below are targets in Tau Ceti; adopt Mathlib's design
and declarations as they become available. The README is definitive; `Suggested.lean` states only
the headline theorems that are statable against the pinned libraries, with the few definitions they need.

| Supplier | Exact input |
| --- | --- |
| From TauCetiRoadmap.AlgebraicTopology, Stage 6, item 0 (*Countable inverse-system algebra*) | The maps of homotopy limits induced by maps of towers of complexes whose squares commute up to specified homotopies, with their composition law and the homotopies induced by compatible second homotopies; see the subsection below. Used in §1.1. |
| From Tau Ceti module towers | In `TauCeti.Algebra.Category.ModuleCat.Tower`: `TauCeti.ModuleTower` (`ℕᵒᵖ ⥤ ModuleCat R` over any `[Ring R]`), the product `TauCeti.ModuleTower.Product` of its terms, its difference map `TauCeti.ModuleTower.shift` on that product, `δ(x)_n = x_n − φ_n(x_(n+1))`, with kernel `TauCeti.ModuleTower.lim` and cokernel `TauCeti.ModuleTower.limOne`, the induced maps `TauCeti.ModuleTower.productMap`, `TauCeti.ModuleTower.limMap` and `TauCeti.ModuleTower.limOneMap`; the six-term connecting map `TauCeti.ModuleTower.connecting` with `TauCeti.ModuleTower.exact_limMap_connecting`, `TauCeti.ModuleTower.exact_connecting_limOneMap` and `TauCeti.ModuleTower.connecting_naturality`; `TauCeti.ModuleTower.IsMittagLeffler` with `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`; the Milnor sequences of towers of complexes `TauCeti.ComplexTower` under degreewise surjectivity of the difference map, `TauCeti.ComplexTower.limOneToHomology_injective`, `TauCeti.ComplexTower.exact_limOneToHomology_homologyToLim` and `TauCeti.ComplexTower.homologyToLim_surjective`, natural by `TauCeti.ComplexTower.homologyToLim_naturality` and `TauCeti.ComplexTower.limOneToHomology_naturality`; the cofinal comparisons `TauCeti.ModuleTower.limSubsequenceEquiv`, `TauCeti.ModuleTower.limOneSubsequenceEquiv` and `TauCeti.ComplexTower.limComplexSubsequenceIso`; and, in `Tower.DerivedLimit`, the homotopy limit `TauCeti.ModuleTower.homotopyLimitFunctor`, the derived limit `TauCeti.ModuleTower.derivedLimit` with `TauCeti.ModuleTower.derivedLimitFactors` (`Q ⋙ Rlim ≅ holim ⋙ Q`), its `Functor.CommShift ℤ` instance, the projections `TauCeti.ModuleTower.derivedLimitπ`, the comparison `TauCeti.ModuleTower.homotopyLimitLift` and `TauCeti.ModuleTower.derivedLimitIsoLimComplex` (`Rlim K ≅ lim K` when every term has vanishing `lim¹`). Used in §§1.1–1.6 and 1.9, and through §1.1 in Layer 4. |
| From Mathlib polynomial laws and divided powers | `PolynomialLaw`, its scalar-extension evaluation, identity and composition; `DividedPowerAlgebra`, generators, lift and map, the zero-ideal PD structure and kernel/span APIs, on which the Tau Ceti divided-power declarations below are built. |
| From Tau Ceti polynomial laws and divided powers | In `TauCeti.RingTheory.PolynomialLaw`: `PolynomialLaw.IsHomogeneousOfDegree`, `PolynomialLaw.IsMultiplicative` and `PolynomialLaw.algHomEquiv`. In `TauCeti.RingTheory.DividedPowerAlgebra`: `DividedPowerAlgebra.homogeneousSubmodule`, `DividedPowerAlgebra.mapHomogeneousSubmodule`, `DividedPowerAlgebra.isInternal_homogeneousSubmodule`, the universal law `DividedPowerAlgebra.gamma` with `DividedPowerAlgebra.gamma_toFun_sum_tmul`, `DividedPowerAlgebra.homogeneousLawEquiv`, `DividedPowerAlgebra.baseChangeHomogeneousEquiv`, `DividedPowerAlgebra.homogeneousTensorMap`, `DividedPowerAlgebra.RobyAlgebra` with `DividedPowerAlgebra.RobyAlgebra.algHomEquiv`, `DividedPowerAlgebra.symmetricTensorEquiv`, and the augmentation theory `DividedPowerAlgebra.augmentation`, `DividedPowerAlgebra.augmentationIdeal`, `DividedPowerAlgebra.augmentationIdeal_eq_span`, `DividedPowerAlgebra.augmentationSplitting`, `DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul` and `DividedPowerAlgebra.dp_two_not_mem_span_dp_one`. These formalise §§0.DP.1–0.DP.3. |
| From Tau Ceti replacements, derived Hom and flat modules | `CochainComplex.exists_quasiIso_isKInjective` (`TauCeti.Algebra.Homology.ModuleCat.KInjective`, any `[Ring R]`); the replacement functor `TauCeti.kInjectiveReplacement`, right adjoint to `DerivedCategory.Qh` by `TauCeti.kInjectiveReplacementAdjunction`, and `CochainComplex.IsKInjective.exists_homotopyEquiv` (`TauCeti.Algebra.Homology.DerivedCategory.KInjective`); the derived Hom `TauCeti.derivedHom` with `TauCeti.derivedHomHomologyLinearEquiv` (`TauCeti.Algebra.Homology.DerivedCategory.DerivedHom`); `CochainComplex.IsKFlat` (`TauCeti.Algebra.Homology.Monoidal.KFlat.Basic`) and `CochainComplex.exists_quasiIso_isKFlat_moduleCat` (`TauCeti.Algebra.Homology.ModuleCat.KFlat`); the cell-attachment resolution `CochainComplex.kFlatResolution` built from epimorphisms `E X → X`, with its instances `CochainComplex.kFlatResolution.quasiIso_π`, `CochainComplex.isKFlat_kFlatResolution` and `CochainComplex.preservesFiniteLimits_tensorLeft_kFlatResolution_X` (`TauCeti.Algebra.Homology.Monoidal.KFlat.Resolution`), read through Mathlib's `Module.Flat.iff_preservesFiniteLimits_tensorLeft`; Lazard's theorem `TauCeti.flatModuleFilteredFree` on the filtered category `TauCeti.FiniteFreeOver` (`TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree`, any `[Ring R]`); `ModuleCat.isZero_Tor_succ_of_flat` (`TauCeti.Algebra.Category.ModuleCat.Monoidal.Tor`). These formalise the K-injective replacement of §0.I.1, the derived Hom of §1.1.1 without its tensor adjunction, the K-flat replacement of §0.2 with flat terms, §0.2.1, and, with Mathlib's `Module.Flat.baseChange`, the complete flatness of flat modules in §1.7. |
| From Tau Ceti spectral sequences | The spectral sequence `CochainComplex.spectralSequence` of a filtered cochain complex `CochainComplex.filtrationFunctor`, with its abutment `CochainComplex.filtrationAbutmentIso` and stabilization `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (`TauCeti.Algebra.Homology.SpectralSequence.Filtered`); for a first-quadrant homological bicomplex in `HomologicalComplex₂ C (down ℕ) (down ℕ)`, `HomologicalComplex₂.rowFiltrationSpectralSequence` and `HomologicalComplex₂.columnFiltrationSpectralSequence`, their first pages `HomologicalComplex₂.rowFiltrationSpectralSequenceFirstPageXIso` and `HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`, abutments `HomologicalComplex₂.rowFiltrationAbutmentIso` and `HomologicalComplex₂.columnFiltrationAbutmentIso`, and convergence `HomologicalComplex₂.rowFiltrationSpectralSequencePageXIsoEInfty`, `HomologicalComplex₂.isZero_rowFiltration_abutmentFiltration` and `HomologicalComplex₂.isIso_rowFiltration_abutmentFiltrationι` (`TauCeti.Algebra.Homology.SpectralSequence.Bicomplex`). Consumed in §S.1. |
| From Mathlib exterior powers and regular sequences | `ExteriorAlgebra.exteriorPower`, multilinear generators and maps, `RingTheory.Sequence.IsWeaklyRegular`, `Fintype.linearCombination`; the Koszul complexes below are built on them. |
| From Tau Ceti Koszul complexes | In `TauCeti.RingTheory.KoszulComplex`: the Koszul complex `TauCeti.koszulComplex φ` of a linear functional `φ : M → R`, an `ℕ`-indexed chain complex with terms `⋀ⁿ M` and differential the contraction by `φ`, with its first differential `TauCeti.zeroEquiv_koszulDifferential_zero`, the induced chain maps `TauCeti.koszulComplex.map` (with `TauCeti.koszulComplex.map_id` and `TauCeti.koszulComplex.map_comp`), the null-homotopy `TauCeti.koszulComplex.smulHomotopy` of multiplication by `φ(m)`, the zeroth homology `TauCeti.koszulComplex.homologyZeroEquivSpan` of a finite sequence, the tensor decompositions `TauCeti.koszulComplex.tensorIso` and `TauCeti.koszulComplex.tensorIsoAppend`, and acyclicity for weakly regular sequences `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`. These formalise §0.K.1 apart from its algebra-map and mapping-cone clauses; consumed in §§1.3–1.5. |
| From Tau Ceti simplicial objects | The Alexander–Whitney map `CategoryTheory.SimplicialObject.alexanderWhitney` from the alternating face complex of `X ⊗ Y` to the tensor product of those of `X` and `Y`, natural by `CategoryTheory.SimplicialObject.alexanderWhitney_naturality` (`TauCeti.AlgebraicTopology.SimplicialObject.AlexanderWhitney`); the diagonal `CategoryTheory.SimplicialObject.diag` and the double complex `CategoryTheory.SimplicialObject.doubleComplex` of a bisimplicial object, and the Alexander–Whitney chain map `CategoryTheory.SimplicialObject.diagAlexanderWhitney` from the alternating face complex of the diagonal to the total complex, natural by `CategoryTheory.SimplicialObject.diagAlexanderWhitney_naturality` (`TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial`); the Eilenberg–Zilber theorem for free simplicial modules on simplicial sets, the shuffle map `SSet.shuffle` (`TauCeti.AlgebraicTopology.SimplicialSet.Shuffle`) and the homotopy equivalence `SSet.eilenbergZilberHomotopyEquiv` between the chains of a product and the tensor product of chains (`TauCeti.AlgebraicTopology.SimplicialSet.EilenbergZilber`), which §0.2.2 extends to arbitrary simplicial modules; the symmetric power functor `ModuleCat.symmetricPower.functor` (`TauCeti.Algebra.Category.ModuleCat.SymmetricPower.Basic`). Consumed in §§0.2.2 and 0.17. |
| From Mathlib homological and categorical algebra | Complexes, quasi-isomorphisms, K-injectivity, enough injectives in module categories, `DerivedCategory`, `DerivedCategory.Q`, single and homology functors, Dold–Kan with `AlgebraicTopology.DoldKan.Γ₀`, combinatorial simplicial homotopies `CategoryTheory.SimplicialObject.Homotopy` with `CategoryTheory.SimplicialObject.Homotopy.whiskerRight` (a functor applied levelwise carries homotopies) and `CategoryTheory.SimplicialObject.Homotopy.toChainHomotopy` (the induced chain homotopy of alternating face complexes), used in §0.3, the exterior power functor `ModuleCat.exteriorPower.functor`, augmented simplicial objects, filtered colimits, tensor, Hom and `CategoryTheory.Tor`. §§0.1–0.3 and 1.1.1 construct the derived operations from the Tau Ceti replacements. |
| From Mathlib cotangent and flatness inputs | `Algebra.Extension`, `Algebra.H1Cotangent`, Kähler differentials, Jacobi–Zariski, `Derivation`, `derivationToSquareZeroEquivLift`, `Module.Flat.exists_factorization_of_finitePresentation`, finite free modules, localizations and smoothness. §§0.4–0.17 and 0.25 construct the full complex, powers and deformation theory. |
| From Mathlib towers, completion and spectral objects | Abelian groups, `CategoryTheory.Functor.IsMittagLeffler`, exact products, snake lemma, `AdicCompletion`, spectral objects and `HomologicalComplex₂.total`; §§1.1–1.9, 1.E.0–1.E.1, 1.M.1–1.M.2 and S.1 construct the additional limits, completions, duality and edge maps. |
| From Tau Ceti Artin–Rees | `TauCeti.ArtinRees.exists_controlled_lift` in `TauCeti.RingTheory.Ideal.ArtinRees`: controlled lifts in finite modules over Noetherian rings, used in §1.5 to make higher Koszul homology pro-zero. |
| From Tau Ceti injective envelopes and Matlis duality | `TauCeti.IsInjectiveEnvelope`, `isEssential_range` and `exists_linearEquiv` in `TauCeti.Algebra.Module.Injective.Envelope.Basic`: essential injective embeddings and uniqueness; hull existence `TauCeti.exists_isInjectiveEnvelope` and its form inside a given injective module `TauCeti.exists_isInjectiveEnvelope_submodule` (`TauCeti.Algebra.Module.Injective.Envelope.Existence`); the action `TauCeti.AdicCompletion.torsionModule` of the `I`-adic completion on a module whose elements are killed by powers of `I` (`TauCeti.RingTheory.AdicCompletion.Torsion`); in `TauCeti.RingTheory.MatlisDuality.FiniteLength`, the residue-field duality `TauCeti.residueFieldLinearMapEquiv`, injectivity of evaluation into the double dual for every module `TauCeti.injective_applyₗ_of_injective`, preservation of length `TauCeti.IsInjectiveEnvelope.length_linearMap` and biduality for modules of finite length `TauCeti.IsInjectiveEnvelope.bijective_applyₗ`; and the Artinian criterion `TauCeti.IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap` (`TauCeti.RingTheory.MatlisDuality.Artinian`). Consumed in §§1.M.1–1.M.2. |
| From Tau Ceti pseudo-coherent modules | `TauCeti.Huber.IsPseudoCoherentOver A M m`, existence of a finite free resolution of `M` exact up to length `m` (`TauCeti.Algebra.Module.PseudoCoherent.Basic`, any `[Ring A]`), with `TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing` (finite modules over Noetherian rings, `m = ⊤`) and the resolving chain complex `TauCeti.Huber.IsPseudoCoherentOver.exists_quasiIso_single₀` (`TauCeti.Algebra.Module.PseudoCoherent.ChainComplex`). Consumed in §1.E.0 for modules in degree zero. |

### From TauCetiRoadmap.AlgebraicTopology

[AlgebraicTopology](../AlgebraicTopology/README.md) Stage 6, item 0 (*Countable inverse-system
algebra*) owns the maps of homotopy limits induced by a map of towers of complexes
whose squares commute up to specified homotopies: these cone maps retain the specified square
homotopies in their composition law, and compatible second homotopies induce homotopies between
them. Its statements are consumed as written there and are not repeated here; §1.1 requires the
localization comparison to intertwine them. Their pinned input is Tau Ceti's fibre map of a square
commuting up to a specified homotopy, `CochainComplex.mappingCocone.mapOfHomotopy` with
`CochainComplex.mappingCocone.mapOfHomotopy_comp` and
`CochainComplex.mappingCocone.mapOfHomotopyHomotopy`
(`TauCeti.Algebra.Homology.HomotopyCategory.MappingCocone.Homotopy`). The generic tower algebra,
its Milnor sequences and the derived limit are consumed from Tau Ceti (table above).

## How to read the build

Layers 0–5 follow construction order and retain the section locators used by consumers. Sections 0.DP.1–0.DP.3 and 0.K.1 build the polynomial-law,
divided-power and Koszul inputs; §§0.I.1–0.3 the unbounded module replacements, derived tensor and
non-additive derived functors, with §S.1 supplying the double-complex spectral sequence before the diagonal comparison; §§0.4–0.25 the cotangent complex, its powers and deformation theory.
Sections 1.1–1.9 prove the exactness of the supplied derived limit and build the tensor–Hom
adjunction, derived completeness and the completion reflector, simplicial-algebra completion and
complete flatness; §§1.E.0–1.E.1 perfect
complexes, finite models and effectivity; §§1.M.1–1.M.2 Matlis duality. Each target's *Needs* line names the earlier sections and library
inputs that its statement and route use.

## Layer 0: polynomial laws, divided powers and Koszul complexes

### 0.DP.1 Homogeneous and multiplicative laws

**Homogeneous polynomial laws.** For `A` a commutative ring and `A`-modules `M` and `N`, an
`A`-polynomial law `f : M → N` is a family `f_S : S ⊗_A M → S ⊗_A N` natural in the commutative
`A`-algebra `S`, Mathlib's `PolynomialLaw`; `S` ranges over commutative `A`-algebras in the universe
of `A`, as in Mathlib's `PolynomialLaw`, whose extension to all universes is Mathlib's `toFun`. Such
a law is homogeneous of degree `n` if `f_S(s·x) = s^n·f_S(x)` for every commutative `A`-algebra `S`,
`s ∈ S` and `x ∈ S ⊗_A M`. This homogeneity predicate is Tau Ceti's
`PolynomialLaw.IsHomogeneousOfDegree`. Prove that the zero law is homogeneous of every degree, that
homogeneity of a fixed degree is closed under addition, that composition multiplies degrees, and
that a law has degree one iff it is the base change of a linear map
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1, pp.6–7); Tau Ceti formalises these as
`PolynomialLaw.isHomogeneousOfDegree_zero`, `PolynomialLaw.IsHomogeneousOfDegree.add`,
`PolynomialLaw.IsHomogeneousOfDegree.comp` and `PolynomialLaw.isHomogeneousOfDegree_one_iff`.
*Needs:* Mathlib `PolynomialLaw`, `PolynomialLaw.comp`, `TensorProduct`.

**Checks.**

- The identity law is homogeneous of degree `1`: `id_S(s·x) = s·x` on every scalar extension, so a
  definition demanding `s^n` for some other `n`, or testing only ground points, would misclassify
  the identity.
- Over `𝔽_p`, the degree-`(p+1)` law `(x,y) ↦ x^p y − xy^p` vanishes on all
  `𝔽_p`-points. At `(T,1)` over `𝔽_p[T]` its value is `T^p−T ≠ 0`, so it is not the
  zero law. Testing only `S=A` would miss it.
- The zero law is homogeneous of degree `n` for every `n`, the degenerate case; a definition that
  assigned each law a unique degree would reject it.

**Multiplicative polynomial laws.** For `A`-algebras `R` and `B`, associative and unital but not
necessarily commutative, an `A`-polynomial law `f : R → B` is multiplicative if `f_S(1) = 1` and
`f_S(xy) = f_S(x)f_S(y)` for every commutative `A`-algebra `S` and `x, y ∈ S ⊗_A R`, where the ring
structure on `S ⊗_A R` is Mathlib's `Algebra.TensorProduct` ring structure. Define this multiplicativity predicate and prove that the identity is multiplicative, that multiplicative
laws compose, and that the multiplicative laws of degree one to `A` are the `A`-algebra maps
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1, p.8). Tau Ceti formalises the predicate as
`PolynomialLaw.IsMultiplicative`, with `PolynomialLaw.isMultiplicative_id`,
`PolynomialLaw.IsMultiplicative.comp` and `PolynomialLaw.algHomEquiv`. *Needs:* Mathlib `PolynomialLaw`,
`PolynomialLaw.id`, `PolynomialLaw.comp`, `Algebra.TensorProduct.instRing`.

**Checks.**

- The identity law is multiplicative: `1 ↦ 1` and `xy ↦ xy` on every `S ⊗_A R`, so a definition
  using a wrong ring structure on the tensor product would already fail on the identity.
- The matrix determinant law `M_d(A) → A` is multiplicative, computing `det(XY) = det X · det Y` after
  every scalar extension; a definition that only asked for multiplicativity on `R` itself would
  not be testable against the scalar-extended matrix identity.
- The zero law on a nonzero ring preserves products but sends `1` to `0`; it fails precisely
  the unit condition. Over `ℤ`, `2 • id` fails both the unit and product conditions.

### 0.DP.2 Roby algebras and representability

**Homogeneous divided-power piece.** For an `A`-module `M` and `d ≥ 0`, define `Γ^d_A(M)` as the
`A`-submodule of Mathlib's `DividedPowerAlgebra A M` spanned by the products `∏_j γ_(n_j)(m_j)` with
`∑_j n_j = d`. It is a graded piece of the full commutative algebra, not an algebra under its
degree-adding multiplication. Prove that `γ_d(m)` belongs to `Γ^d_A(M)`, and define the map
`Γ^d(f) : Γ^d_A(M) → Γ^d_A(N)` induced by an `A`-linear `f : M → N`, taking `γ_d(m)` to
`γ_d(f(m))` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1, p.8). Tau Ceti formalises the
piece as `DividedPowerAlgebra.homogeneousSubmodule`, with `DividedPowerAlgebra.dp_mem_homogeneousSubmodule`
and the induced map `DividedPowerAlgebra.mapHomogeneousSubmodule`. *Needs:* Mathlib `DividedPowerAlgebra`,
`DividedPowerAlgebra.dp`.

**Checks.**

- `Γ^0_A(M) ≅ A`, with `γ₀(m) = 1`: the degree-zero piece is spanned by the empty product, so a
  definition whose span omitted the unit would compute `0`.
- `Γ^1_A(M) ≅ M`, and `γ₁` corresponds to the identity: so a definition in which `γ₁` were not
  injective, or `Γ^1` had extra relations, would fail here.
- In the full `Γ_ℤ(ℤ)`, `γ₁(1)² = 2γ₂(1)`, and `γ₂(1)` is a basis of `Γ²_ℤ(ℤ)`: the divided-power
  grading cannot be replaced by an ordinary polynomial grading, which would make `γ₁(1)²` a basis
  and lose the element `γ₂(1)`.

**Direct-sum grading of divided powers.** For any commutative ring `A` and module `M`, prove that
the sum map `⊕_(d≥0) Γ^d_A(M) → Γ_A(M)` is an `A`-linear equivalence, that multiplication maps
degrees `a, b` to `a + b`, and that `γ_d(m)` has degree `d`. The proof gives the polynomial
generators their weight `n` and proves each Roby relation homogeneous; the quotient decomposition
must establish directness as well as generation, and the grading is multiplicative ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250).
Tau Ceti formalises this as `DividedPowerAlgebra.isInternal_homogeneousSubmodule`.
*Needs:* §0.DP.2 / Homogeneous divided-power piece.

**Checks.**

- The degree-zero projection restricts to the identity on the scalar copy of `A` and kills every positive homogeneous piece.
- For `A = ℤ`, `M = ℤ`, the degree-one and degree-two generators lie in distinct direct summands, even though `γ₁(1)² = 2γ₂(1)`.
- Over `F₂`, `γ₁(1)² = 0` while `γ₂(1) ≠ 0`; directness cannot be proved by division by factorials.

**Universal homogeneous polynomial law.** For every `d ≥ 0` and `A`-module `M`, construct the
homogeneous polynomial law `γ^univ_d : M → Γ^d_A(M)` whose value at `∑_j s_j ⊗ m_j` after scalar
extension is

```text
∑_(∑ n_j = d) (∏_j s_j^{n_j}) ⊗ ∏_j γ_(n_j)(m_j).
```

Define `γ^univ_d` as the homogeneous law with ground value `m ↦ γ_d(m)`, and prove that the
ground evaluation of `γ^univ_d` at `m` is `γ_d(m)` and that the coefficient of `∏ T_j^{n_j}` in
`γ^univ_d(∑ T_j m_j)` is `∏ γ_(n_j)(m_j)` ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Proposition IV.1 and Theorem IV.1, pp.265–267).
Tau Ceti formalises the law as `DividedPowerAlgebra.gamma`, with `DividedPowerAlgebra.ground_gamma_apply`
and `DividedPowerAlgebra.gamma_toFun_sum_tmul`. *Needs:*
§0.DP.2 / Direct-sum grading of divided powers; §0.DP.1 / Homogeneous polynomial laws.

**Checks.**

- The degree-zero law is constant `1` in `Γ⁰ ≅ A`, the degenerate case; a construction whose empty
  sum gave `0` would fail.
- Under `Γ¹ ≅ M` it is Mathlib's identity polynomial law, so a construction not agreeing with
  `PolynomialLaw.id` in degree one would be wrong.
- The coefficient of `UV` in `γ²(Ux + Vy)` is `γ₁(x)γ₁(y)`, with no factor `2` inserted: a
  construction modelled on `(Ux + Vy)²/2` would produce a spurious `2`, or fail over `𝔽_2`.

**Roby representability.** For all `A`-modules `M, N` and `d ≥ 0`, prove that composition with
`γ^univ_d` is a natural `A`-linear equivalence between `Hom_A(Γ^d_A(M), N)` and the homogeneous
degree-`d` `A`-polynomial laws `M → N`; no flatness or projectivity of `M` is assumed
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem IV.1 and proof, pp.266–267).
Linearity of postcomposition makes this correspondence linear, and uniqueness of the factorization
on every scalar extension makes it natural. Tau Ceti formalises it as
`DividedPowerAlgebra.homogeneousLawEquiv`, natural by
`DividedPowerAlgebra.homogeneousLawEquiv_symm_comp_mapHomogeneousSubmodule_eq_iff`, with the
representing map computed on products of generators by
`DividedPowerAlgebra.homogeneousLawEquiv_symm_apply_prod_dp`. *Needs:* §0.DP.2 / Universal homogeneous polynomial law.

**Checks.**

- In degree zero, constant laws correspond exactly to maps from `A`.
- In degree one the equivalence is the usual linear-map correspondence.
- For `M = ℤ/2`, degree two has representing module `ℤ/4`; restricting to free source modules would miss this torsion case.
- For the zero module, the empty coefficient sum gives `1 ⊗ 1` in degree zero and `0` in
  every positive degree. Over the zero ring these both equal zero, as do all representing modules.
- Over `F₂`, the degree-three law `x²y − xy²` on `F₂²` has zero ground values but takes
  `(T,1)` to `T² − T ≠ 0` over `F₂[T]`. Its factorizing linear map is therefore nonzero;
  uniqueness tested only on ground values would incorrectly identify it with the zero map.

**Arbitrary base change of divided powers.** For any commutative `A`-algebra `B` and `A`-module `M`,
prove that the canonical map `B ⊗_A Γ^d_A(M) → Γ^d_B(B ⊗_A M)` is a `B`-linear equivalence for
every `d`, taking `1 ⊗ γ_d(m)` to `γ_d(1 ⊗ m)`; flatness of `B` is unnecessary
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem III.3 and proof, pp.261–262).
Tau Ceti formalises it as `DividedPowerAlgebra.baseChangeHomogeneousEquiv`, the restriction of the
algebra isomorphism `DividedPowerAlgebra.baseChangeEquiv`. *Needs:* §0.DP.2 / Roby representability.

**Checks.**

- Base change along the identity is the identity on every homogeneous piece.
- For `ℤ → F₂` and `M = ℤ`, `1 ⊗ γ₂(1)` remains the nonzero generator of the target, despite nonflat base change.
- For `M = 0`, degree zero base-changes to `B` and every positive piece to zero.

**Tensor map for homogeneous divided powers.** For `A`-modules `M, N`, construct the natural
`A`-linear map `Γ^d_A(M) ⊗_A Γ^d_A(N) → Γ^d_A(M ⊗_A N)`, characterized by the polynomial law
`(m, n) ↦ γ_d(m ⊗ n)`, separately homogeneous of degree `d`. Its mixed coefficient formula is
required; no assertion that this map is an isomorphism is made. Define this linear map
`Γ^d(M) ⊗ Γ^d(N) → Γ^d(M ⊗ N)`, and prove that `γ_d(m) ⊗ γ_d(n)` maps to `γ_d(m ⊗ n)` and that it
commutes with `Γ^d(f) ⊗ Γ^d(g)` and `Γ^d(f ⊗ g)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1 and the Roby algebra
structure, p.8; [Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), IV §11, Proposition IV.9 and proof, pp.284–286).
Tau Ceti formalises it as `DividedPowerAlgebra.homogeneousTensorMap`, with
`DividedPowerAlgebra.homogeneousTensorMap_dp_tmul_dp` and `DividedPowerAlgebra.homogeneousTensorMap_comp_map`.
*Needs:* §0.DP.2 / Arbitrary base change of divided powers.

**Checks.**

- For `d = 1` the map is the identity on `M ⊗ N` under `Γ¹ ≅ identity`, so a construction with an
  extra scalar or a twist would fail in degree one.
- For `d = 0` it is `A ⊗_A A ≅ A`, the degenerate case; a construction that was not the canonical
  multiplication in degree zero would fail.
- For `d = 2` and `M = N = ℤ`, the basis element `γ₂(1) ⊗ γ₂(1)` maps to `γ₂(1 ⊗ 1)` with
  coefficient `1`: a construction modelled on symmetric tensors `(m^{⊗2}) ⊗ (n^{⊗2}) ↦ (m ⊗ n)^{⊗2}`
  with a divided-power normalisation would insert a factor `2` or `1/2` here.

**Roby algebra of multiplicative laws.** For an associative unital `A`-algebra `R`, equip
`Γ^d_A(R)` with the internal multiplication `Γ^d(R) ⊗ Γ^d(R) → Γ^d(R ⊗ R) → Γ^d(R)`, induced by the
multiplication of `R`, and unit `γ_d(1)`. Prove that algebra maps `Γ^d_A(R) → S` are naturally
equivalent to multiplicative homogeneous degree-`d` polynomial laws `R → S`. The addition and scalar action are those of the homogeneous submodule in Mathlib’s
divided-power algebra; the unit is `gamma d 1` and the scalar map sends `a` to `a • gamma d 1`. This internal algebra
can be noncommutative and is distinct from the graded multiplication on `Γ_A(R)`. Define the
degree-`d` representing module with its internal associative `A`-algebra structure, prove
`γ_d(x) ⋆ γ_d(y) = γ_d(xy)`, with unit `γ_d(1)`, and construct the equivalence between algebra maps
from this internal algebra and the multiplicative degree-`d` laws ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1 and footnote
13, p.8). Tau Ceti formalises it as `DividedPowerAlgebra.RobyAlgebra`, with
`DividedPowerAlgebra.homogeneousMul_dp_dp` and `DividedPowerAlgebra.RobyAlgebra.algHomEquiv`. *Needs:* §0.DP.2 / Tensor map for homogeneous divided powers; §0.DP.1 / Multiplicative polynomial laws.

**Checks.**

- `Γ¹_A(R)` with its internal multiplication is `R` as an `A`-algebra, so an internal product not
  reducing to the multiplication of `R` in degree one would fail.
- For `R = ℤ`, `d = 2`: `γ₂(1) ⋆ γ₂(1) = γ₂(1)`, while the full graded product `γ₂(1)γ₂(1) = 6γ₄(1)`
  is a different operation; a definition that used the graded product of `Γ_A(R)` would compute
  `6γ₄(1)` and leave degree `2`.
- For `R = A` the universal multiplicative law is `a ↦ a^d` and its representing algebra is `A`, so
  a representing algebra larger than `A` in this case would mean spurious generators.

For this equivalence, the three ground-value Checks for `R=S=A` are degree zero
`a↦1`, degree one `a↦a`, and degree two `a↦a²`, for every algebra map from the corresponding
internal algebra. The equivalence is specified by its evaluation on `γ_d`, and the complete
internal product by the tensor map followed by `LinearMap.mul'`.

**Free divided powers and symmetric tensors.** For any free `A`-module `M`, prove that
`Γ^d_A(M) → (M^(⊗d))^(S_d)`, `γ_d(m) ↦ m^(⊗d)`, is an `A`-linear equivalence. The module
comparison is stated with permutation-fixed tensors as the intersection of the
kernels of `reindex σ − id` ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf),
Theorem IV.2 and Proposition IV.5, p.272). Tau Ceti formalises it as
`DividedPowerAlgebra.symmetricTensorEquiv`. *Needs:* §0.DP.2 / Roby algebra of multiplicative laws.

**Checks.**

- In weight zero both sides are `A`, and in weight one the comparison is the identity of `M`.
- For a rank-one module over `F_p`, `γ_p(e)` maps to the nonzero invariant tensor `e^(⊗p)` even though `e^p = 0` in the full divided-power algebra.
- For `M = ℤe ⊕ ℤf`, weight two has basis `γ₂(e)`, `γ₁(e)γ₁(f)`, `γ₂(f)`, sent to `e⊗e`, `e⊗f+f⊗e`, `f⊗f`; averaging by `1/2` gives the wrong integral map.

### 0.DP.3 The divided power algebra and its augmentation ideal

**Augmentation of the divided power algebra.** For a commutative ring `R` and an `R`-module `M`,
with no freeness, finite-generation, characteristic, factorial-invertibility or nilpotence
hypothesis, construct the `R`-algebra homomorphism `ε : Γ_R(M) → R` taking `dp(0, m)` to `1` and
every `dp(n, m)` with `n > 0` to `0`. It is the existing lift `DividedPowerAlgebra.lift` into the
zero ideal of `R`, with its canonical divided powers `dividedPowersBot R`, along the zero linear map
`M → R`.

Tau Ceti formalises the map as this zero-ideal lift, `DividedPowerAlgebra.augmentation`, with
`DividedPowerAlgebra.augmentation_dp`, `DividedPowerAlgebra.augmentation_unique`,
`DividedPowerAlgebra.augmentation_comp_map` and `DividedPowerAlgebra.augmentation_map`
(`TauCeti.RingTheory.DividedPowerAlgebra.Augmentation`). The map and its values on generators and
scalars are also formalised in [AffineCrystalline] as
`AffineCrystalline.Envelope.FreeConstruction.augmentation`, `FreeConstruction.augmentation_apply_dp`
and `FreeConstruction.augmentation_apply_algebraMap`
(`AffineCrystalline/Envelope/FreeConstruction/DPAlgebraAugmentation.lean`), against an earlier
Mathlib, with `R` and `M` in one universe and the map built from its generator values rather than
as the zero-ideal lift.

**API.**

- `ε` equals `DividedPowerAlgebra.lift` of `dividedPowersBot R` along the zero linear map `M → R`.
- `ε(dp(n, m))` is `1` when `n = 0` and `0` otherwise.
- `ε(algebraMap(r)) = r` for every `r ∈ R`.
- For every `R`-linear `f : M → N`, `ε_N ∘ Γ(f) = ε_M`.
- An `R`-algebra homomorphism `Γ_R(M) → R` killing every `dp(n, m)` with `n > 0` equals `ε`.
- For an `R`-algebra `S`, an `S`-module `N` whose `R`-module structure is the restriction of its
  `S`-module structure, and an `R`-linear map `f : M → N`,
  `ε_S(DividedPowerAlgebra.map S f z) = algebraMap R S (ε_R(z))` for every `z ∈ Γ_R(M)`, where
  `ε_R` and `ε_S` are the augmentations of `Γ_R(M)` and `Γ_S(N)`. For `S = R` this is the
  naturality `ε_N ∘ Γ(f) = ε_M` above.

*Proof sketch.* Use `dividedPowersBot R`, the zero `R`-linear map `M → R` and its range
containment in the zero ideal as the inputs of `DividedPowerAlgebra.lift`. Use
`DividedPowerAlgebra.lift_apply_dp`, the degree-zero divided-power axiom and
`DividedPowers.dpow_eval_zero` in positive degree to compute `ε` on every generator. The
algebra-homomorphism structure gives `ε(algebraMap(r)) = r`. For naturality and uniqueness use
`DividedPowerAlgebra.algHom_ext` on all `dp(n, m)`, splitting `n = 0` from `n > 0`. The free-module
augmentation is described in [Stacks §23.5, Tag 07H4](https://stacks.math.columbia.edu/tag/07H4).
For arbitrary modules the lift argument above uses the general Roby algebra
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* Mathlib
`dividedPowersBot`; Mathlib `DividedPowerAlgebra.lift`; Mathlib `DividedPowerAlgebra.lift_apply_dp`;
Mathlib `DividedPowers.dpow_eval_zero`; Mathlib `DividedPowerAlgebra.algHom_ext`; Mathlib
`DividedPowerAlgebra.dp_zero`; Mathlib `DividedPowerAlgebra.map_apply_dp`; Mathlib
`DividedPowerAlgebra.map`; Mathlib `DividedPowers.RatAlgebra.dividedPowers`; Mathlib
`DividedPowerAlgebra`.

**Checks.**

- For every `m`, `ε(3 + dp(2, m)) = 3`, including in characteristic two and for torsion modules.
- For every `m ∈ M`, `ε(dp(1, m)) = 0`; that is, `ε ∘ embed = 0`, where `embed : M → Γ_R(M)` is
  `m ↦ dp(1, m)`.
- For `R = M = ℚ`, the lift of the canonical divided powers `x ↦ xⁿ/n!` on the unit ideal of `ℚ`
  along the identity `ℚ → ℚ` sends `dp(2, 1)` to `1/2`, whereas `ε(dp(2, 1)) = 0`; so `ε` is not
  this lift.
- `ε(dp(0, m)) = 1` for every `m`, including `m = 0`, and `ε(dp(n, m)) = 0` for every `n > 0`.
- `ε(algebraMap(r)) = r` for every `r ∈ R`, so `ε` is surjective.

**Augmentation ideal.** For a commutative ring `R` and an `R`-module `M`, with no freeness,
finite-generation, characteristic, factorial-invertibility or nilpotence hypothesis, define
`Γ_R(M)₊` as the kernel `RingHom.ker ε` of the augmentation, an ideal of `Γ_R(M)`. Membership means
`ε(z) = 0`. In positive degree `dp(n, m)` belongs to this ideal, and a scalar belongs exactly when
it is zero.

Tau Ceti formalises the ideal in this kernel form as `DividedPowerAlgebra.augmentationIdeal`, with
`DividedPowerAlgebra.mem_augmentationIdeal`, `DividedPowerAlgebra.dp_mem_augmentationIdeal`,
`DividedPowerAlgebra.algebraMap_mem_augmentationIdeal_iff` and
`DividedPowerAlgebra.map_mem_augmentationIdeal`. In [AffineCrystalline], against an earlier
Mathlib, the ideal is introduced as the span `FreeConstruction.positiveIdeal` of the positive-degree
generators, and the generator membership above is `FreeConstruction.dp_mem_positiveIdeal` together
with `FreeConstruction.positiveIdeal_le_augmentation_ker`
(`AffineCrystalline/Envelope/FreeConstruction/DPAlgebraAugmentation.lean`, same hypotheses).

**API.**

- `Γ_R(M)₊ = RingHom.ker ε`.
- `z ∈ Γ_R(M)₊` if and only if `ε(z) = 0`.
- For `n ≠ 0`, `dp(n, m) ∈ Γ_R(M)₊`.
- `algebraMap(r) ∈ Γ_R(M)₊` if and only if `r = 0`.
- For an `R`-algebra `S`, an `S`-module `N` whose `R`-module structure is the restriction of its
  `S`-module structure, and an `R`-linear map `f : M → N`, `DividedPowerAlgebra.map S f` carries
  `Γ_R(M)₊` into `Γ_S(N)₊`. In particular `Γ(f)(Γ_R(M)₊) ⊂ Γ_R(N)₊` for every `R`-linear
  `f : M → N`.

*Proof sketch.* Apply `RingHom.ker` to `ε` and use `RingHom.mem_ker` for membership. The generator
and scalar assertions follow from the computed values of `ε`. Properness over a nonzero ring follows
because `ε(1) = 1`. The free-module kernel is described in
[Stacks §23.5, Tag 07H4](https://stacks.math.columbia.edu/tag/07H4). The preceding kernel argument
proves the arbitrary-module version from Roby's presentation
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation of the divided power algebra*; Mathlib `RingHom.ker`; Mathlib `RingHom.mem_ker`; Mathlib `DividedPowerAlgebra.map`.

**Checks.**

- `dp(2, m)` belongs to `Γ_R(M)₊` for every `m`.
- `1` does not belong to `Γ_ℤ(ℤ)₊`.
- For `R = M = F₂`, `dp(2, 1)` belongs to `Γ_R(M)₊` but not to the ideal generated by the elements
  `dp(1, m)`, `m ∈ M`.
- For `R = M = ℤ`, neither `1` nor any `dp(0, m)` belongs, and every positive divided-power
  generator does.

**Positive-degree remainder.** For a commutative ring `R` and an `R`-module `M`, with no freeness,
finite-generation, characteristic, factorial-invertibility or nilpotence hypothesis, prove that for
every `z ∈ Γ_R(M)` the remainder `z − algebraMap(ε(z))` belongs to the ideal `H` generated by all
`dp(n, m)` with `n > 0` and `m ∈ M`.

This is Tau Ceti's `DividedPowerAlgebra.sub_algebraMap_augmentation_mem_span`, and, against an
earlier Mathlib, `FreeConstruction.sub_augmentation_mem_positiveIdeal` in [AffineCrystalline]
(`AffineCrystalline/Envelope/FreeConstruction/DPAlgebraAugmentation.lean`), with `H` the span
`FreeConstruction.positiveIdeal` and the same hypotheses.

*Proof sketch.* Apply `DividedPowerAlgebra.induction_on` to the predicate that
`z − algebraMap(ε(z))` lies in `H`. For a scalar the remainder is zero. For a sum it is the sum of
the two remainders. For `z · dp(0, m)`, `DividedPowerAlgebra.dp_zero` reduces to the induction
hypothesis. For `z · dp(n, m)` with `n > 0`, the augmentation is zero and `dp(n, m)` is one of the
generators of `H`, so closure of the ideal under multiplication proves membership. The free-module
calculation appears in the proof of
[Stacks Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). The induction above
proves it for arbitrary modules using Roby's generators and relations
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation of the divided power algebra*; Mathlib
`DividedPowerAlgebra.induction_on`; Mathlib `DividedPowerAlgebra.dp_zero`; Mathlib
`Ideal.subset_span`.

**Checks.**

- For `M = 0`, every element is a scalar and its remainder vanishes.
- For `z = 3 + dp(2, m) · dp(1, m′)`, `ε(z) = 3` and `z − 3 = dp(2, m) · dp(1, m′)` is a multiple of
  the generator `dp(2, m)`.
- For a scalar `z = algebraMap(r)` the remainder is `0`.

**Positive-degree generators of the augmentation ideal.** For a commutative ring `R` and an
`R`-module `M`, with no freeness, finite-generation, characteristic, factorial-invertibility or
nilpotence hypothesis, prove that `Γ_R(M)₊` is exactly the ideal generated by
`{dp(n, m) | n > 0, m ∈ M}`; the degree-zero generators are excluded.

This is Tau Ceti's `DividedPowerAlgebra.augmentationIdeal_eq_span`, whose generators are the
`dp(n, m)` with `n ≠ 0`. With the two sides in the other order it is
`FreeConstruction.positiveIdeal_eq_augmentation_ker` in [AffineCrystalline]
(`AffineCrystalline/Envelope/FreeConstruction/DPAlgebraAugmentation.lean`), under the same
hypotheses and against an earlier Mathlib.

*Proof sketch.* Every listed generator has augmentation zero, so `Ideal.span_le` gives
`H ⊆ RingHom.ker ε`. If `ε(z) = 0`, the positive-degree remainder gives `z − algebraMap(0) = z ∈ H`,
proving the reverse inclusion. The free-module generators occur in the proof of
[Stacks Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). For arbitrary modules,
the two inclusions above use the general Roby algebra
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation ideal*; §0.DP.3 / *Positive-degree remainder*;
Mathlib `Ideal.span_le`.

**Checks.**

- For `M = 0`, every positive generator is zero, and the augmentation ideal is zero.
- For `R = M = ℤ` the ideal is proper: the element `1 = dp(0, m)` is not in it.
- The degree-one elements `dp(1, m)` do not suffice as generators: in `Γ_{F₂}(F₂)`, `dp(2, 1)` is
  not in the ideal they generate.

**Scalar and augmentation splitting.** For a commutative ring `R` and an `R`-module `M`, with no
freeness, finite-generation, characteristic, factorial-invertibility or nilpotence hypothesis,
construct the `R`-linear equivalence `Γ_R(M) ≃ R × Γ_R(M)₊` given by
`z ↦ (ε(z), z − algebraMap(ε(z)))`, with inverse `(r, u) ↦ algebraMap(r) + u`. The second
coordinate uses the kernel-membership proof. It is an equivalence of `R`-modules only:
multiplication on the two summands has cross terms. This is Tau Ceti's
`DividedPowerAlgebra.augmentationSplitting`.

**API.**

- The first coordinate of the image of `z` is `ε(z)`.
- The underlying algebra element of the second coordinate is `z − algebraMap(ε(z))`.
- The inverse sends `(r, u)` to `algebraMap(r) + u`.

*Proof sketch.* Augment the remainder: `ε(z) − ε(algebraMap(ε(z))) = 0`; this gives the subtype
membership proof. Both coordinate functions and the proposed inverse are `R`-linear by the algebra
maps and the submodule structure. Substitute each composite: cancellation gives `z` in one
direction, and `ε(u) = 0` gives `(r, u)` in the other. Package the linear maps with
`LinearEquiv.ofLinearMap`. The free-module scalar splitting is given by the degree-zero summand in
[Stacks §23.5, Tag 07H4](https://stacks.math.columbia.edu/tag/07H4). The inverse formulas above
prove the arbitrary-module splitting on Roby's algebra
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation of the divided power algebra*; §0.DP.3 / *Augmentation ideal*; Mathlib `LinearEquiv.ofLinearMap`.

**Checks.**

- Every scalar `r` maps to `(r, 0)`.
- Every `u ∈ Γ_R(M)₊` maps to `(0, u)`.
- For `r ∈ R` and `u ∈ Γ_R(M)₊`, `algebraMap(r) + u` maps to `(r, u)`.
- `3 + dp(2, m)` maps to `(3, dp(2, m))`.

**Remainder of an extended base ideal.** For a commutative ring `R`, an `R`-module `M` and an ideal
`I ⊂ R`, with no freeness, finite-generation, characteristic, factorial-invertibility or
nilpotence hypothesis, put `IΓ = I.map (algebraMap R Γ_R(M))`. Prove that for every `z ∈ IΓ` the
remainder `z − algebraMap(ε(z))` lies in `IΓ · Γ_R(M)₊`. This is Tau Ceti's
`DividedPowerAlgebra.sub_algebraMap_augmentation_mem_map_mul`.

*Proof sketch.* The definition of `Ideal.map` and the finite-span criterion express `z` as a finite
sum `Σ_j b_j · algebraMap(a_j)` with `a_j ∈ I` and `b_j ∈ Γ_R(M)`; no injectivity, flatness or basis
is used. The augmentation is `Σ_j ε(b_j) a_j`. Subtract its scalar image and distribute to obtain
`Σ_j (b_j − algebraMap(ε(b_j))) · algebraMap(a_j)`. Each first factor lies in `Γ_R(M)₊` by the
augmentation calculation, and each second factor lies in `IΓ`. Membership in an ideal product and
closure under finite sums give the result. For free modules, compare the ideal calculation in the
proof of [Stacks Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). The finite-sum
argument above proves the arbitrary-module assertion on the general Roby algebra
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation of the divided power algebra*; §0.DP.3 / *Augmentation ideal*; Mathlib `Ideal.map`; Mathlib `Ideal.mem_map_of_mem`; Mathlib
`Finsupp.mem_ideal_span_range_iff_exists_finsupp`; Mathlib `Ideal.mul_mem_mul`.

**Checks.**

- For `I = R`, the assertion gives membership of every remainder in the augmentation ideal,
  including over torsion rings.
- For `I = 0`, `z = 0` and the remainder `0` lies in the zero ideal.
- For `R = M = ℤ`, `I = (2)` and `z = 2 · (1 + dp(1, 1))`, `ε(z) = 2` and `z − 2 = 2 · dp(1, 1)` lies
  in `IΓ · Γ_R(M)₊`.

**Base ideal and augmentation intersection.** For a commutative ring `R`, an `R`-module `M` and
every ideal `I ⊂ R`, with no flatness, freeness or other hypothesis, prove the equality of ideals
`IΓ ∩ Γ_R(M)₊ = IΓ · Γ_R(M)₊` in `Γ_R(M)`. This is Tau Ceti's
`DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul`.

*Proof sketch.* The ideal product is contained in the intersection by `Ideal.mul_le_inf`. For `z` in
the intersection, `ε(z) = 0`, and the preceding base-ideal remainder statement gives
`z ∈ IΓ · Γ_R(M)₊`, proving the reverse inclusion. The free-module equality occurs in the proof of
[Stacks Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). The containment argument
above extends it to arbitrary modules using Roby's algebra
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *Augmentation ideal*; §0.DP.3 / *Remainder of an extended base ideal*; Mathlib `Ideal.mul_le_inf`.

**Checks.**

- For `R = M = ℤ` and `I = (2)`, the scalar `2` belongs to the extended base ideal but not to the
  augmentation ideal; it is excluded from both sides of the equality.
- For `I = 0` both sides are `0`; for `I = R` both sides are `Γ_R(M)₊`.
- For `R = M = ℤ` and `I = (2)`, the element `2 · dp(1, 1)` lies in both sides.

**A degree-two detector in characteristic two.** Let `F₂ = ZMod 2`, let
`B = TrivSqZeroExt(F₂, F₂)` be the trivial square-zero extension of `F₂` by itself, and write
`inr(a) = (0, a)`. Prove that there is an `F₂`-algebra homomorphism `f : Γ_{F₂}(F₂) → B` with
`f(dp(0, a)) = 1`, `f(dp(2, a)) = inr(a)` and `f(dp(n, a)) = 0` for every `n` other than `0` and `2`.
This is Tau Ceti's `DividedPowerAlgebra.exists_algHom_trivSqZeroExt_dp`.

*Proof sketch.* Use `DividedPowerAlgebra.lift'` for the displayed generator family; this is an
ordinary algebra homomorphism, not a divided-power morphism. The degree-zero relation is immediate.
Scalar homogeneity in degree two uses `r² = r` for `r ∈ F₂`; all other positive degrees are zero.
For the product relation, an index zero is immediate. When both indices are positive, the only
possibly nonzero left side is `inr(a)² = 0`, and the only possibly nonzero target degree is
`1 + 1 = 2`, whose coefficient `choose(2, 1) = 2` vanishes in `F₂`. For the additive relation,
degree zero gives `1` and degree two gives `inr(a + b) = inr(a) + inr(b)`; the only other possible
convolution term is in degree four, `inr(a) · inr(b) = 0`. All remaining terms vanish. Apply
`DividedPowerAlgebra.lift'_apply_dp` for the stated formula. For the free-module divided-power
relations see [Stacks §23.5, Tag 07H4](https://stacks.math.columbia.edu/tag/07H4) and
[Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). The detector argument above
uses Roby's generator presentation
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* Mathlib `DividedPowerAlgebra.lift'`; Mathlib
`DividedPowerAlgebra.lift'_apply_dp`; Mathlib `TrivSqZeroExt.inr`; Mathlib
`TrivSqZeroExt.inr_mul_inr`; Mathlib `ZMod.natCast_self`.

**Checks.**

- The degree-zero generator maps to the unit and the degree-four generator maps to zero; the map is
  an algebra homomorphism that does not preserve the canonical divided powers.
- `f(dp(1, a)) = 0` for every `a ∈ F₂`, and `f(dp(2, 1)) = inr(1) ≠ 0`.
- `f(dp(2, 1))² = 0`, in agreement with `dp(2, 1)² = 6 · dp(4, 1) = 0` in characteristic two.

**Degree one does not generate the augmentation ideal.** With `F₂ = ZMod 2` and
`embed(a) = dp(1, a)`, prove that in `Γ_{F₂}(F₂)` the element `dp(2, 1)` is not in the ordinary ideal
generated by `{embed(a) | a ∈ F₂}`. This is Tau Ceti's
`DividedPowerAlgebra.dp_two_not_mem_span_dp_one`.

*Proof sketch.* Take the preceding algebra homomorphism `f` to the square-zero extension. Every
`embed(a) = dp(1, a)` maps to zero, so the ideal they generate lies in the kernel of `f` by
`Ideal.span_le`. The image of `dp(2, 1)` is `inr(1)`, which is nonzero by
`TrivSqZeroExt.inr_injective` and `1 ≠ 0` in `F₂`, so kernel membership rules out membership in the
degree-one ideal. For the free-module divided-power relations see
[Stacks §23.5, Tag 07H4](https://stacks.math.columbia.edu/tag/07H4) and
[Lemma 23.5.1, Tag 07H5](https://stacks.math.columbia.edu/tag/07H5). The detector argument above
uses Roby's generator presentation
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250). *Needs:* §0.DP.3 / *A degree-two detector in characteristic two*; Mathlib
`DividedPowerAlgebra.embed_def`; Mathlib `RingHom.mem_ker`; Mathlib `Ideal.span_le`; Mathlib
`TrivSqZeroExt.inr_injective`.

**Checks.**

- For the zero module the augmentation ideal is zero, so the failure needs the nonzero
  characteristic-two generator.
- In `F₂⟨x⟩` one has `x · x^[n] = (n + 1) · x^[n+1]`, so the ideal `(x)` is spanned by the `x^[m]`
  with `m` odd and does not contain `x^[2]`.
- Over `ℚ` the degree-one elements do generate: `dp(2, m) = ½ · dp(1, m)²` in `Γ_ℚ(M)`.

### 0.K.1 Koszul complex of a finite sequence

**Koszul complex of a finite sequence.** For a commutative ring `A` and `x = (x₁, …, xₙ)` in `A`,
define `K(x)`, the exterior algebra `⋀(Aⁿ)` with the degree `−1` derivation
determined by `e_i ↦ x_i`, as a nonnegative chain complex with `K(x)_k = ⋀^k Aⁿ`. Prove
that its first differential is `d₁(v) = ∑ x_i v_i`, that
`H₀(K(x)) = A/(x)`, that `K(x, y) ≅ K(x) ⊗_A K(y)` for concatenated
sequences, functoriality in the sequence (a linear map `g : Aⁿ → A^{n′}` with
`x′ ∘ g = x` induces a chain map `K(x) → K(x′)`), and that
if `x` is weakly regular, `H_k(K(x)) = 0` for `k > 0`, so `K(x) → A/(x)` is a finite free
resolution ([Stacks](https://stacks.math.columbia.edu), Definitions 15.29.1–15.29.2 (tags 0622, 0623), Lemma 15.29.3
(tag 0624), Lemma 15.29.12 (tag 0664) and Lemma 15.31.2 (tag 062F)). Tau Ceti formalises all of
these as `TauCeti.koszulComplex` of the functional `Fintype.linearCombination R x` on `Rⁿ`: the first
differential is `TauCeti.zeroEquiv_koszulDifferential_zero`, the zeroth homology
`TauCeti.koszulComplex.homologyZeroEquivSpan`, the concatenation isomorphism
`TauCeti.koszulComplex.tensorIsoAppend`, functoriality `TauCeti.koszulComplex.map`, and acyclicity
`TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`. *Needs:* Tau Ceti `TauCeti.koszulComplex` and the
declarations just named; Mathlib `ExteriorAlgebra`, `exteriorPower.map`,
`RingTheory.Sequence.IsWeaklyRegular`.

**Koszul complex of a linear functional.** For an `A`-module `M` and an `A`-linear functional
`φ : M → A`, define `K(φ)` as the exterior algebra `⋀(M)`, graded by `K(φ)_k = ⋀^k M`, with the
unique degree `−1` derivation `d` extending `φ` on `⋀^1 M = M`: on wedges,
`d(m₁ ∧ ⋯ ∧ m_k) = ∑_i (−1)^(i+1) φ(m_i) m₁ ∧ ⋯ ∧ m̂_i ∧ ⋯ ∧ m_k`. Prove that `d² = 0`; that an
`A`-linear map `g : M → M′` with `φ′ ∘ g = φ` induces a map of differential graded algebras
`K(φ) → K(φ′)`, functorially in `g`, acting in degree `k` as `⋀^k g`; that the finite-sequence
complex `K(x)` above is `K(φ)` for `M = Aⁿ` and `φ(v) = ∑ x_i v_i`, so its differential on
wedges and its induced maps are those of this construction; that for every `m ∈ M`, exterior
multiplication by `m` is a degree-raising homotopy between multiplication by `φ(m)` and zero,
`d(m ∧ v) + m ∧ d(v) = φ(m) v`, so every element of the image of `φ` annihilates the Koszul
homology; and that for `φ′ = φ ⊕ (y·) : M ⊕ A → A` the complex `K(φ′)` is the mapping cone of
multiplication by `y` on `K(φ)`, which with the tensor identification
`K(x, y) ≅ K(x) ⊗_A K(y)` uses the sign `d(v ⊗ w) = dv ⊗ w + (−1)^deg(v) v ⊗ dw`
([Stacks](https://stacks.math.columbia.edu), Definition 15.29.1 (tag 0622), Lemma 15.29.3
(tag 0624), Lemma 15.29.5 (tag 0626), Lemma 15.29.7 (tag 0628) and Lemma 15.29.12 (tag 0664)).
Tau Ceti formalises the complex `TauCeti.koszulComplex φ` with this differential (contraction by
`φ`), the identity `d² = 0`, the chain maps `TauCeti.koszulComplex.map` induced by `g` with
`φ′ ∘ g = φ` and acting in degree `k` as `⋀^k g`, the homotopy `TauCeti.koszulComplex.smulHomotopy`,
and the tensor decomposition `TauCeti.koszulComplex.tensorIso` for `φ ⊕ ψ` on `M × N`, with the sign
above. This section adds that the induced maps are maps of differential graded algebras for the
wedge product, and the mapping-cone identification of `K(φ ⊕ (y·))`.
*Needs:* Tau Ceti `TauCeti.koszulComplex`, `TauCeti.koszulComplex.map`,
`TauCeti.koszulComplex.smulHomotopy` and `TauCeti.koszulComplex.tensorIso`; Mathlib `ExteriorAlgebra`,
`ExteriorAlgebra.exteriorPower`, `exteriorPower.map`, `CochainComplex.mappingCone`; the
finite-sequence complex of this section.

**Checks.**

- `K(x)` for a single element is `A --x→ A` in degrees `1, 0`: the one-variable exterior algebra
  has two terms and the differential is multiplication by `x`, so a definition with the wrong
  degree convention or sign would fail here.
- `K` of the empty sequence is `A` in degree `0`: the degenerate case, which a definition that
  required at least one generator would not produce.
- Over `ℤ`, `K(2)` has `H₁ = 0` while `K(0)` has `H₁ = ℤ`; over `ℤ/4`, `K(2)` has `H₁ ≅ ℤ/2`, so
  acyclicity needs regularity: a definition asserting acyclicity without the weak-regularity
  hypothesis would be refuted by `ℤ/4`.

### Examples

For `R = ℤ` and `M = ℤ`, `γ₁(1)² = 2γ₂(1)`; over `𝔽₂` the square is zero while `γ₂(1)` is
nonzero. For a prime `p`, the Koszul complex of `(p)` is `[ℤ →p ℤ]`, with `H⁰ = ℤ/p` and `H⁻¹ = 0`.

### Dependencies

Mathlib polynomial laws, divided powers, ideal spans and kernels, trivial square-zero extensions,
exterior powers, mapping cones and regular sequences; Tau Ceti polynomial laws, divided powers and
Koszul complexes.

## Layer 1: replacements, tensor products and simplicial comparisons

### 0.I.1 K-injective and K-flat replacements — point-site K-injective clause

**Module K-injective replacements.** For any ring `R`, every possibly unbounded complex of
`R`-modules has a quasi-isomorphism into a K-injective complex, Tau Ceti's
`CochainComplex.exists_quasiIso_isKInjective`. For every abelian category with such replacements
they assemble into the functor `TauCeti.kInjectiveReplacement` from the derived category to the
homotopy category, right adjoint to `DerivedCategory.Qh` (`TauCeti.kInjectiveReplacementAdjunction`),
and two replacements of one complex are homotopy equivalent
(`CochainComplex.IsKInjective.exists_homotopyEquiv`). A bounded-below complex of injective modules is
K-injective. K-injectivity is Mathlib's `CochainComplex.IsKInjective`, the condition that every map
from an acyclic complex is null-homotopic. Prove the compatibility of the derived functors induced
by these replacements with the bounded-below injective construction. This is the module
construction used by downstream point-site comparisons.

(Stacks, Theorem 19.12.6, Tag 079P, and Cohomology on Sites, §21.19
*Cohomology of unbounded complexes*; for bounded-below injectives use Mathlib's existing K-injective API.)

*Needs:* Tau Ceti `CochainComplex.exists_quasiIso_isKInjective`, `TauCeti.kInjectiveReplacement`
and `CochainComplex.IsKInjective.exists_homotopyEquiv`; Mathlib's complexes, `ModuleCat`,
`CochainComplex.IsKInjective` and enough injectives for modules.

**Checks.**

- A bounded-below injective resolution computes the same derived Hom as an unbounded replacement
  on the bounded-below subcategory.
- An acyclic input has acyclic replacement and represents the zero derived object.
- Over `ℤ`, the replacement of `ℤ[0]` gives `H¹ RHom_ℤ(ℤ/p,ℤ) = ℤ/p` for prime `p`; using the
  unreplaced target misses this extension class.
- A quasi-isomorphism between K-injective replacements is a homotopy equivalence, and applying
  Hom from any complex preserves that equivalence.

### 0.1 Simplicial polynomial resolutions

For a ring map `A → B`, a *polynomial resolution* of B over A
is an augmented simplicial commutative `A`-algebra `ε : P• → B` with every `P_n` a polynomial
`A`-algebra on a specified set of variables, such that `ε` is a trivial Kan fibration of simplicial
sets; equivalently `ε` is a quasi-isomorphism on alternating face complexes, or a homotopy equivalence
of simplicial sets ([StacksCt] Remark 5.5, Tag 08QI, p.9). The *standard resolution* is the comonad resolution of the free-polynomial /
forgetful adjunction, `P_0 = A[B]`, `P_(n+1) = A[P_n]` ([StacksCt] Definition 3.1, Tag 08PM, p.2);
it is a polynomial resolution, carries an extra degeneracy after forgetting to sets, and is functorial
in commutative squares `(A → B) → (A′ → B′)`. For any functor `F` from polynomial `A`-algebras over
`B` to complexes of abelian groups (or of `A`-modules), the complexes `F(P•)` and `F(Q•)` of two
polynomial resolutions are canonically quasi-isomorphic after totalization: this is the value
`Lπ_!F` of [StacksCt] Lemmas 4.1–4.3 and 5.6–5.7 (Tags 08PS–08PU, 08QJ, 08QK, pp.4–10), computed by
any resolution (Remark 5.5). Use the projective presheaves represented by the polynomial algebras
`P_n` on the category of polynomial `A`-algebras over `B`: the augmentation gives an exact
resolution after evaluation on each object, by the trivial Kan fibration condition. Applying the
derived-colimit construction gives the identification with `Lπ_!F`, functorially in `F`.
This comparison takes place in the derived category of the values of `F`.

*Needs:* Mathlib `SimplicialObject.Augmented`, `SimplicialObject.Augmented.ExtraDegeneracy`,
`AlgebraicTopology.alternatingFaceMapComplex`, `MvPolynomial`.

Prove the following laws.

- the comonad resolution is a polynomial resolution,
  functorial in commutative squares of ring maps, with identity and composition laws.
- for any two polynomial resolutions of
  `B` over `A` and each functor `F` above, the totalized complexes are canonically isomorphic in the
  derived category through their common identification with `Lπ_!F` (Tags 08PS–08PU, 08QI).
- the augmentation `P• → B` is a
  quasi-isomorphism of alternating face complexes of `A`-modules.

**Checks.**

- for `A → A`, the constant simplicial algebra `A` is a polynomial
  resolution on the empty set of variables; its `F`-complex and that of the standard resolution
  have the canonical derived-category comparison through `Lπ_!F`.
- for `B = A[t]`, applying `F` to the constant resolution `A[t]` and
  to the standard resolution gives the same object `Lπ_!F` in the derived category.
- for a nonzero ring `A`, the constant simplicial algebra
  `A[t]`, augmented to `B = A[t]/(t²)` by the quotient map, is degreewise polynomial and surjective onto `B`, but its
  alternating face complex is quasi-isomorphic to `A[t][0]`; the augmentation is not a
  quasi-isomorphism, so it is not a resolution.

### 0.2 Derived tensor products on module derived categories

For a ring `R`, every complex of `R`-modules admits a K-flat resolution, a bounded-above complex of flat
modules is K-flat, and the termwise tensor product with a K-flat complex sends quasi-isomorphisms to
quasi-isomorphisms ([StacksMA] Definition 15.60.1, Lemmas 15.60.7, 15.60.10, 15.60.12; Tags 06XZ, 064K,
06Y4, 064L, pp.144–147). K-flat complexes are closed under shifts and cones and under filtered colimits
([StacksMA] Lemmas 15.60.5 and 15.60.8, Tags 06Y2, 06Y3). Define
`D(R) ⥤ D(R) ⥤ D(R)` as the derived tensor product of [StacksMA]
Definition 15.60.13 (Tag 064M), computed by `Tot(K• ⊗_R L•)` with `K•` K-flat; and derived extension of
scalars along `R → R′` as `− ⊗^L_R R′`.

This construction covers arbitrary, possibly unbounded complexes over arbitrary commutative rings.

K-flatness is Tau Ceti's `CochainComplex.IsKFlat`: tensoring with every acyclic cochain complex
is acyclic, with no boundedness condition. Every complex receives a quasi-isomorphism from a K-flat
complex, Tau Ceti's `CochainComplex.exists_quasiIso_isKFlat_moduleCat`, and the complex can be chosen
flat in every degree ([StacksMA] Lemma 15.60.10, Tag 06Y4): Tau Ceti's
`CochainComplex.kFlatResolution`, built by attaching cells along the free covers
`(X →₀ R) → X`, is quasi-isomorphic to `K` (`CochainComplex.kFlatResolution.quasiIso_π`), K-flat
(`CochainComplex.isKFlat_kFlatResolution`) and flat in every degree
(`CochainComplex.preservesFiniteLimits_tensorLeft_kFlatResolution_X`, which is flatness by Mathlib's
`Module.Flat.iff_preservesFiniteLimits_tensorLeft`). The bi-infinite ℤ/4 example below excludes termwise flatness as a substitute for K-flatness.

*Needs:* Tau Ceti `CochainComplex.IsKFlat`, `CochainComplex.exists_quasiIso_isKFlat_moduleCat` and `CochainComplex.kFlatResolution` with its three instances above; Mathlib `DerivedCategory`, `HomologicalComplex`, `ModuleCat`, tensor products, exact filtered colimits and localization of complexes.

Prove the following laws.

- for a bounded-above complex `P•` of flat modules,
  `P• ⊗^L L ≅ Tot(P• ⊗ L•)` naturally.
- the bifunctor is exact in each variable, symmetric
  monoidal with unit `R[0]`.
- a filtered colimit of K-flat complexes is K-flat, and a shift or cone of
  K-flat complexes is K-flat.
- the direct-sum totalization of a bicomplex whose columns sit in
  nonpositive simplicial degrees and are K-flat is K-flat. It is the colimit of the totalizations of
  its first `n` columns, each an iterated cone of shifted columns.

KhovanovHomology K5 consumes this bifunctor over `W = DualNumber R`, for commutative `R`.
Its bounded-above projective/K-projective resolution model is naturally identified with the
restriction of `derivedTensor W`: bounded-above projective complexes are K-flat, and the
comparison is characterized by the specified augmentation quasi-isomorphisms. Require naturality
in both inputs and compatibility with changes of resolutions, units, associativity and symmetry.
The bounded finite-free filtration, quantum grading, dot actions and connected-sum comparison
belong to K5. This is the bounded-projective specialization of the flat-model comparison
([StacksMA], Tags 064K, 064L, 064M), with the same monoidal comparison maps.

**Checks.**

- The zero complex is K-flat: tensoring it with an acyclic complex gives zero.
- The complex R[0] is K-flat: tensoring with it preserves the acyclic complex itself.
- `R[0] ⊗^L M ≅ M`.
- For `W = DualNumber R`, after forgetting quantum degrees, two crossing-free based unknots give
  `W[0] ⊗^L_W W[0] ≅ W[0]`. K5's augmentation comparison is multiplication `W ⊗_W W → W`.
  Restoring `C(unknot) = W⟨1⟩` gives `(W⟨1⟩ ⊗_W W⟨1⟩)⟨−1⟩ ≅ W⟨1⟩`, the connected-sum map.
  The zero bounded-free factor gives zero on both sides.
- `F_p ⊗^L_ℤ F_p` has `H^0 = F_p` and `H^−1 = F_p`, computed from the flat
  model `[ℤ →p ℤ]`; the underived tensor product loses `H^−1`.
- for a flat module `M` and any module `N`, `M ⊗^L N` is
  concentrated in degree zero.
- over `ℤ/4` the acyclic complex `⋯ → ℤ/4 --2→ ℤ/4 --2→ ℤ/4 → ⋯`
  of free modules is not K-flat. Its termwise tensor with `F₂` has zero differentials and cohomology
  `F₂` in every degree, while its derived tensor with `F₂` is zero. Termwise flatness of an unbounded
  complex does not compute `⊗^L`.

### 0.2.1 Flat modules as filtered colimits of finite free modules

**Flat modules as colimits of finite free modules.** For a ring `R` and a module `M` with
`Module.Flat R M`, give a small filtered category `J`, a diagram `P : J ⥤ ModuleCat R` of finite
free modules, a cocone with maps `P_j → M`, and a proof that this cocone is colimiting. The
transition maps need not be injective. This is Tau Ceti's `TauCeti.flatModuleFilteredFree`, over
any ring: `J` is the category `TauCeti.FiniteFreeOver R M` of linear maps `Rⁿ → M`, filtered when
`M` is flat, and the tautological cocone is colimiting.
Use `Module.Flat.exists_factorization_of_finitePresentation` to factor finite presentations through
finite free modules and to equalize finite relations in this diagram. This presentation supplies
the reductions to finite free modules in §§0.14–0.16 and the filtered-colimit extension in §0.3.

[StacksAlg], Theorem 10.81.4 (Lazard's theorem), Tag 058G, with Lemma 10.81.2, Tag 058E.

*Needs:* Tau Ceti `TauCeti.flatModuleFilteredFree`; Mathlib `Module.Flat.exists_factorization_of_finitePresentation`, `Module.Free`,
`Module.Finite`, `ModuleCat`, filtered categories, cocones and colimits.

**Checks.**

- for `M = R^n`, the one-object diagram with identity cocone is
  a finite free presentation, including `n = 0`.
- `ℚ` over `ℤ` is the filtered colimit of copies of `ℤ` indexed
  by positive denominators ordered by divisibility; the map from denominator `d` to `e` is
  multiplication by `e/d`, and its cocone sends `a` to `a/d`.
- `ℤ/2` is excluded: multiplication by `2` is injective on `ℤ`
  but becomes zero on the nonzero module `ℤ/2`. It cannot be a filtered colimit of finite free
  `ℤ`-modules, since tensor and filtered colimits preserve this injection.

### S.1 The spectral sequence of a first-quadrant double complex

**The spectral sequence of a first-quadrant double complex.** Let `A^{••}` be a first-quadrant
double complex of abelian groups (or of modules over a ring): `A^{pq} = 0` for `p < 0` or `q < 0`,
with anticommuting differentials `d′` (in `p`) and `d″` (in `q`). The column filtration
`FᵖTotⁿ = ⊕_{i≥p} A^{i,n−i}` of the total complex is biregular and gives a cohomological spectral
sequence

```text
E₂^{pq} = H^p_I(H^q_{II}(A)) ⇒ Eⁿ = Hⁿ(Tot A).
```

It converges: `E_r^{pq} = E_∞^{pq}` for `r > max(p, q + 1)`, and
`E_∞^{pq} ≅ FᵖE^{p+q}/F^{p+1}E^{p+q}`. It has edge morphisms `E₂^{n,0} → Eⁿ → E₂^{0,n}` and the
five-term exact sequence

```text
0 → E₂^{1,0} → E¹ → E₂^{0,1} → E₂^{2,0} → E².
```

For an integer `n ≥ 1`, if `E₂^{pq} = 0` for every `p ≥ 0` and `0 < q < n`, then
`E₂^{m,0} ≅ Eᵐ` for `m < n` and
`0 → E₂^{n,0} → Eⁿ → E₂^{0,n} → E₂^{n+1,0} → E^{n+1}` is exact. If every row
`A^{0q} → A^{1q} → ⋯` is exact in positive degrees, then
`Eⁿ = Hⁿ(ker(A^{0•} → A^{1•}))`. The pinned Tau Ceti supplies the spectral sequence of a filtered
cochain complex with its abutment and stabilization, and, for first-quadrant homological
bicomplexes, the row- and column-filtration spectral sequences with their first pages and their
convergence to the homology of the total complex (Exact supplier contracts). This section adds the
identification of the second page with iterated cohomology, the stabilization bound in the classical
numbering, the edge morphisms, the five-term and extended sequences, the exact-rows comparison and
naturality. In the homological form the second-page identification is the headline
`DerivedDeRham.nonempty_bicomplexSecondPageIso`: in Tau Ceti's column-filtration spectral sequence,
whose first page carries Mathlib's number `2`, the page numbered `3` is the classical `E²`, and its
object at `(−k − 2p, p)` is `H_p` of the complex `t ↦ H_k(C_(t,•))` of vertical homologies.

**Homological form.** For a first-quadrant chain double complex `C_(p,q)`, the same
filtered-complex construction uses the increasing column filtration
`F_p Tot_n = ⊕_(i≤p) C_(i,n−i)`. It gives `E¹_(p,q) = H_q(C_(p,•))`,
`E²_(p,q) = H_p(H_q(C))` and `d_r : E^r_(p,q) → E^r_(p−r,q+r−1)`, abutting to
`H_(p+q)(Tot C)` with `E^∞_(p,q) ≅ F_p H_(p+q) / F_(p−1) H_(p+q)` and stabilization
for `r > max(p, q+1)`. Both filtrations are finite in each total degree. For commuting
horizontal and vertical chain differentials, use total differential `d_h + (−1)^p d_v`;
reindexing total degree `n` to cohomological degree `−n` retains this differential and the
increasing filtration. This is the homological form used in §§0.2.2 and 0.9, rather than an
identification of a first-quadrant chain complex with a first-quadrant cochain complex.

**API.**

- the `E₂` spectral sequence of a first-quadrant double complex,
  from Tau Ceti's spectral sequence of the column filtration.
- `E₂^{pq} ≅ H^p_I(H^q_{II}(A))`; in the homological form, `DerivedDeRham.nonempty_bicomplexSecondPageIso`.
- the column filtration `FᵖHⁿ(Tot A)`.
- `E_∞^{pq} ≅ FᵖH^{p+q}/F^{p+1}H^{p+q}`.
- `E_r^{pq} = E_∞^{pq}` for `r > max(p, q + 1)`.
- `E₂^{n,0} → Hⁿ(Tot A)`.
- `Hⁿ(Tot A) → E₂^{0,n}`.
- the five-term exact sequence (NSW (2.1.1)).
- with the explicit hypothesis `1 ≤ n`, vanishing
  `E₂^{pq}` for all `p ≥ 0` and `0 < q < n` gives the extended sequence (NSW (2.1.2)).
- exact rows give
  `Hⁿ(Tot A) = Hⁿ(ker(A^{0•} → A^{1•}))` (NSW (2.2.4)).
- naturality in the double complex, in both homological and cohomological indexing.

*Proof sketch.* Tau Ceti's spectral sequence of a filtered cochain complex,
`CochainComplex.spectralSequence` of `CochainComplex.filtrationFunctor`, is built from Mathlib's
mapping-cone spectral object (`HomotopyCategory.spectralObjectMappingCone`) and the homology functor
(`Triangulated.SpectralObject.mapHomologicalFunctor`). Apply it to the column filtration of
`Tot A`, reindexed to an increasing filtration: its abutment is `Hⁿ(Tot A)` by
`CochainComplex.filtrationAbutmentIso`, and since the filtration is finite in each degree,
`CochainComplex.filtrationSpectralSequencePageXIsoEInfty` identifies the stable pages with the
graded pieces. The first-quadrant condition (`Abelian.SpectralObject.IsFirstQuadrant`) holds
because `A^{pq} = 0` outside the quadrant. For the homological form use
`HomologicalComplex₂.columnFiltrationSpectralSequence`, whose first page is the vertical homology
(`HomologicalComplex₂.columnFiltrationSpectralSequenceFirstPageXIso`) and whose abutment is the
homology of the total complex (`HomologicalComplex₂.columnFiltrationAbutmentIso`).
Identify `E₂^{pq}` with `H^p_I(H^q_{II}(A))`: the `E₁` page is the vertical cohomology and `d₁` is
induced by `d′` (NSW (2.2.1)). Convergence: the filtration is finite in each degree, so the pages
stabilise for `r > max(p, q + 1)` and `E_∞` is the associated graded of `Hⁿ(Tot A)`. The edge
morphisms and the five-term sequence come from the definition of the filtration (NSW (2.1.1),
(2.1.2)); the exact-rows statement from the transposed double complex (NSW (2.2.4)). The source's
anticommuting differentials become the commuting differentials of Mathlib's `HomologicalComplex₂`
after a sign depending on the degree; its totalisation uses `ComplexShape.TensorSigns`, and the
pages and edge maps are transported through the same convention ([Neukirch–Schmidt–Wingberg,
*Cohomology of Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf),
Chapter II, §1, Proposition 2.1.1, printed p. 99 (PDF p. 116); [Neukirch–Schmidt–Wingberg,
*Cohomology of Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf),
Chapter II, §2, Lemma 2.2.4, printed p. 105 (PDF p. 122)). *Needs:* Tau Ceti
`CochainComplex.spectralSequence`, `CochainComplex.filtrationAbutmentIso`,
`CochainComplex.filtrationSpectralSequencePageXIsoEInfty`,
`HomologicalComplex₂.columnFiltrationSpectralSequence` and
`HomologicalComplex₂.columnFiltrationAbutmentIso`; Mathlib
`HomotopyCategory.spectralObjectMappingCone`; Mathlib
`CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor`; Mathlib
`CategoryTheory.Abelian.SpectralObject.IsFirstQuadrant`; Mathlib
`CategoryTheory.Abelian.SpectralObject.coreE₂CohomologicalNat`; Mathlib
`CategoryTheory.Abelian.SpectralObject.spectralSequence`; Mathlib `HomologicalComplex₂.total`.

The acyclic-assembly lemmas of [AffineCrystalline], `RawBi.augRowι_quasiIso` and
`RawBi.augColι_quasiIso` (`AffineCrystalline/Homology/TotM.lean`: an augmentation into the total
complex is a quasi-isomorphism when the augmented columns, respectively rows, are exact) and
`RawBi.totMap_quasiIso` (`AffineCrystalline/Homology/TotQuasiIso.lean`: columnwise
quasi-isomorphisms induce a quasi-isomorphism of total complexes), are proved for that
development's own first-quadrant bicomplex structure `RawBi`, so they inform the proof of
the exact-rows comparison while the statements here stay on Mathlib's
`HomologicalComplex₂`.

**Checks.**

- if `A^{pq} = 0` for `q > 0`, then `E₂^{p0} = Hᵖ(A^{•0}) = Hᵖ(Tot A)` and all
  differentials vanish.
- if `A^{pq} = 0` for `p > 0`, then `E₂^{0q} = H^q(A^{0•}) = H^q(Tot A)`.
- `A^{00} = A^{10} = ℤ` with `d′ = id` and all other terms `0`: `E₂ = 0` and
  `H(Tot A) = 0`.
- `H⁰(Tot A) = E₂^{00}` for every first-quadrant double complex.
- The bound `n ≥ 1` is necessary: if only `A^{00} = ℤ` is nonzero, then at `n = 0` both
  edge maps `E₂^{00} → H⁰(Tot A) → E₂^{00}` are identities. Their composite is nonzero,
  so the extended sequence would fail exactness despite the empty row-vanishing condition.
- The abutment filtration is pinned: for a single row (`q = 0`) it is `FⁿHⁿ = Hⁿ`,
  `F^{n+1}Hⁿ = 0`; for a single column (`p = 0`) it is `F⁰Hⁿ = Hⁿ`, `F¹Hⁿ = 0`.
- For a commutative coefficient ring `R`, take generators `a, b, c, e` in bidegrees
  `(0,1), (1,0), (1,1), (2,0)` with `d′a = c`, `d″b = c`, `d′b = e` and other maps zero.
  The anticommuting cochain total differential from `(a,b)` to `(c,e)` is
  `[[1,1],[0,1]]`, so total cohomology is zero. Vertical cohomology leaves `R` at `(0,1)`
  and `(2,0)`; `d₂[a] = [−e]`, since `d(a−b) = −e`. Thus `E₃ = 0 = E_∞`, over both
  `ℤ` and `F₂`, whereas the two nonzero `E₂` terms alone would give a false abutment.
- Put the same four generators and anticommuting maps in homological bidegrees
  `(2,0), (1,1), (1,0), (0,1)`, respectively. The same matrix has zero total homology,
  and `d₂[a] = [−e]` goes from `(2,0)` to `(0,1)`. Thus the incoming differential at
  `(0,1)` can still be nonzero on page two; the bound `r > max(p, q+1)` retains it.
- In homological indexing a single row has `F_(n−1) H_n = 0`, `F_n H_n = H_n`, while
  a single column has `F_−1 H_n = 0`, `F_0 H_n = H_n`; the successive quotients recover
  the sole nonzero `E^∞` term. A chain map `R →id R` in degrees `1,0` has both
  `E² = 0` and `H_*(Tot) = 0`, also after cochain reindexing to degrees `−1,0`.

### 0.2.2 Simplicial module tensor and diagonal comparisons

**Simplicial module tensor comparison.** Tau Ceti proves the Eilenberg–Zilber theorem for the free
simplicial modules on simplicial sets: for simplicial sets `K, L` and coefficient objects `R, S`, its
shuffle map `SSet.shuffle` and its Alexander–Whitney map are inverse chain homotopy equivalences
between the chains of `K × L` with coefficients `R ⊗ S` and the tensor product of the chains of `K`
and of `L` (`SSet.eilenbergZilberHomotopyEquiv`), with the same bidegree-`(1,1)` shuffle signs as
below. This section extends it to arbitrary simplicial modules. For simplicial modules `X, Y` over a commutative ring
`A`, construct the natural shuffle map and prove that it and Tau Ceti's natural Alexander–Whitney map
`CategoryTheory.SimplicialObject.alexanderWhitney` are inverse chain homotopy equivalences
`Tot_⊕(s(X) ⊗_A s(Y)) ≃ s(X ⊗_A Y)`. Here `s` is Mathlib's alternating-face complex,
`(X ⊗_A Y)_n = X_n ⊗_A Y_n`, and the total differential on bidegree `(p,q)` is
`d_h + (−1)^p d_v`. Reindex degree `n` as `−n` using
`ComplexShape.embeddingDownNat`; this gives the cochain differential
`d(x ⊗ y) = dx ⊗ y + (−1)^deg(x) x ⊗ dy`. The maps and homotopies exist without flatness.
If both simplicial modules are degreewise flat, their associated cochain complexes are bounded
above and K-flat, so the shuffle identifies the left side with §0.2's
`s(X) ⊗^L_A s(Y)`.

Require naturality in both variables, agreement with normalized Moore complexes under Mathlib's
normalization homotopy equivalence, and compatibility with scalar extension `A → B`.
For arbitrary scalar extension, the derived identification uses degreewise-flat models; it does
not identify an arbitrary underived scalar extension with derived base change. The shuffle
comparisons preserve the tensor unit, associativity and Koszul symmetry in the homotopy category,
hence in `D(A)`. These identities give the graded multiplications in §§0.14–0.16 and their scalar
change laws. ([Stacks](https://stacks.math.columbia.edu/tag/08QD), Remark 21.39.11; [DoldPuppe],
§2, Theorems 2.9 and 2.15, pp.213–217.)

*Needs:* §0.2 (K-flat models and derived tensor); Tau Ceti
`CategoryTheory.SimplicialObject.alexanderWhitney` and
`CategoryTheory.SimplicialObject.alexanderWhitney_naturality`; as a proof route by acyclic models
on the standard simplices, Tau Ceti `SSet.shuffle` and `SSet.eilenbergZilberHomotopyEquiv`;
Mathlib's alternating-face and
normalized Moore complexes, their homotopy equivalence, module tensor products and
`HomologicalComplex.tensorObj`.

`DerivedDeRham.simplicialTensorComparison` states existence of a single family of native
`HomotopyEquiv` values on the alternating-face complexes whose inverse is Tau Ceti's
Alexander–Whitney map, so the inverse is natural by `CategoryTheory.SimplicialObject.alexanderWhitney_naturality`;
the forward maps are natural in both variables. Its degree-zero shuffle is the identity and its
bidegree-(1,1) component is the signed two-shuffle formula below.

**Checks.**

- For constant simplicial flat modules `P, Q`, the comparison induces `P ⊗_A Q` in degree zero;
  for `P = A` this is the tensor unit map, including `Q = 0`.
- If `X, Y` are the Dold–Kan objects of `A[1]`, the shuffle of their degree-one generators is
  `s₁x ⊗ s₀y − s₀x ⊗ s₁y`. Interchanging the factors acts by `−1` on `H^−2 ≅ A`;
  over `F₂` the two signs agree without dividing by `2`.
- For a simplicial free resolution `X` of `ℤ/2`, `s(X ⊗_ℤ X)` has `H^0 = H^−1 = ℤ/2`.
  The constant simplicial module `ℤ/2` instead has levelwise tensor with itself concentrated
  in degree zero after realization; the derived identification requires flat models.

**Bisimplicial module diagonal comparison.** For any bisimplicial `A`-module `Z`, prove that
Tau Ceti's Alexander–Whitney map `CategoryTheory.SimplicialObject.diagAlexanderWhitney` from
`s(diag Z)` to `Tot_⊕(s_h s_v Z)` is a chain homotopy equivalence; this is the headline
`DerivedDeRham.bisimplicialDiagonalComparison`. Its homotopy inverse is the shuffle map constructed
here. Here
`(diag Z)_n = Z_(n,n)` with face maps applying the same face in both directions (Tau Ceti's
`CategoryTheory.SimplicialObject.diag`), and `s_h s_v Z` is Tau Ceti's
`CategoryTheory.SimplicialObject.doubleComplex`, with horizontal (outer) degree `p`, vertical (inner)
degree `q`, total degree `p+q` and differential `d_h + (−1)^p d_v`; then use the same cochain
reindexing as above. The Alexander–Whitney map is natural in `Z`
(`CategoryTheory.SimplicialObject.diagAlexanderWhitney_naturality`); construct the natural shuffle
map. No flatness is needed for this additive comparison. Require naturality, scalar extension,
compatibility with the tensor comparison for `Z_(p,q) = X_p ⊗_A Y_q`, and agreement in the
homotopy category of the two successive comparisons for a trisimplicial module.
Thus the first-quadrant spectral sequence of the double complex abuts to diagonal homology,
with the same filtration transported along this comparison.
([DoldPuppe], §2, Theorems 2.9 and 2.15 and Remark 2.16, pp.213–218.)

*Needs:* Tau Ceti `CategoryTheory.SimplicialObject.diag`,
`CategoryTheory.SimplicialObject.doubleComplex` and
`CategoryTheory.SimplicialObject.diagAlexanderWhitney`; Mathlib `SimplicialObject`, alternating-face
complexes and `HomologicalComplex₂.total`;
§0.2.2 / Simplicial module tensor comparison for its tensor compatibility;
§S.1 (homological spectral sequence, convergence and abutment filtration).

**Checks.**

- A constant bisimplicial module `P` has diagonal and total homology `P` in degree zero and zero
  in all positive homological degrees, although the unnormalized complexes have higher terms.
- For a bisimplicial module constant in the vertical direction, the comparison agrees up to
  homotopy with the augmentation of that constant direction and recovers `s_h Z`.
- For `Z_(p,q) = X_p ⊗_A Y_q` with normalized `X` and `Y` equal to `A[1]`, both sides have
  homology `A` in degree two. Transposition of the two directions contributes the sign `−1`.

### 0.3 Derived functors of non-additive functors

Let `R → R′` be a ring map and `F` a functor from all projective `R`-modules to `R′`-modules,
not necessarily additive. A functor given only on finite projectives must first be extended by
filtered colimits to all projectives, using §0.2.1. For a connective complex `M ∈ D^(≤0)(R)` choose
a projective resolution, pass through the Dold–Kan correspondence to a simplicial projective module `X•`, and
define `LF(M) = N(F(X•))`, the alternating face complex of the levelwise application. Two projective
simplicial resolutions are homotopy equivalent and `F` preserves simplicial homotopies, so `LF` is a
well-defined functor `D^(≤0)(R) → D^(≤0)(R′)` ([DoldPuppe] §4, 4.1–4.6, pp.227–229, with 1.15 for
homotopies and §3 for the Dold–Kan correspondence; [StacksSimp] Remark 14.26.4). Mathlib supplies
the second step: a combinatorial simplicial homotopy `CategoryTheory.SimplicialObject.Homotopy` is
carried by any functor applied levelwise (`CategoryTheory.SimplicialObject.Homotopy.whiskerRight`)
and induces a chain homotopy of alternating face complexes
(`CategoryTheory.SimplicialObject.Homotopy.toChainHomotopy`). The first step, that a weak
equivalence of degreewise projective simplicial modules is a simplicial homotopy equivalence, comes
from the Dold–Kan correspondence of homotopies ([DoldPuppe] Satz 3.31, p.225). Together they give
the headline `DerivedDeRham.quasiIso_whiskering_of_projective`: for associative unital rings `R` and
`R′`, a functor `F` from `R`-modules to `R′`-modules, not necessarily additive, and a map `f : X → Y`
of simplicial `R`-modules that are projective in every degree and whose alternating face complexes
are quasi-isomorphic through `f`, the levelwise map `F(f)` is again a quasi-isomorphism of
alternating face complexes ([DoldPuppe] 4.4–4.6, p.228, with Satz 1.15, p.209). Only the values of
`F` on the projective terms and on maps between them enter, so the same statement holds for a
functor defined on projective modules only. If `F` is additive,
`LF` is the classical left derived functor ([DoldPuppe] 4.7, p.228). If `F` commutes with filtered
colimits of projective modules, so does `LF`. When `F` is obtained from its restriction to finite
projective modules by filtered colimits, `LF` is the sifted-colimit extension of its values on finite
free modules. [SAG] Proposition 25.2.1.2 and Corollary 25.2.1.3, pp.1698–1699, give this
∞-categorical formulation for ring-module pairs; the strict model above uses simplicial modules.
An arbitrary functor on all projective modules need not have this colimit property.

*Needs:* §0.2.1 (Flat modules as filtered colimits of finite free modules) (for the finite-projective
extension); Mathlib `AlgebraicTopology.DoldKan`, `AlgebraicTopology.alternatingFaceMapComplex`,
`CategoryTheory.SimplicialObject.Homotopy`, `CategoryTheory.SimplicialObject.Homotopy.whiskerRight`,
`CategoryTheory.SimplicialObject.Homotopy.toChainHomotopy`, `DerivedCategory`.

Prove the following laws.

- the construction is functorial in `M` and in natural
  transformations of `F`, and independent of the resolution up to unique isomorphism in `D(R′)`.
- agreement with the classical derived functor for
  additive `F`.
- for a projective module `M` in degree zero,
  `LF(M) ≅ F(M)[0]`.

**Checks.**

- for `F = id`, `LF(M) ≅ M`.
- for `F(X) = X ⊗_R X` and `R = ℤ`, `M = ℤ/2`, `LF(M)` has nonzero
  `H^−1`, so it is not the underived value `(ℤ/2) ⊗ (ℤ/2)` in degree zero.
- the augmentation from the Dold–Kan object of `[ℤ --2→ ℤ]` to the constant simplicial module
  `ℤ/2` is a quasi-isomorphism whose target is not projective. Under `F(X) = X ⊗_ℤ X` the source
  has `H^−1 = Tor₁(ℤ/2, ℤ/2) = ℤ/2` by the shuffle comparison of §0.2.2, the target has `H^−1 = 0`,
  so the levelwise map is not a quasi-isomorphism: the invariance needs projective terms on both
  sides.
- for the constant functor `F(X) = R′`, `LF(M) ≅ R′[0]` for every
  connective `M`, including `M = 0`; a construction through chain complexes rather than simplicial
  modules would not apply to this non-additive functor.
- for `V = ⊕_(n∈ℕ) F₂` in degree zero, no finite projective
  `P₀` can surject onto `V`. Its constant simplicial resolution is projective of infinite rank;
  functors initially defined on finite projectives use their filtered-colimit extension on it.
  The algebraic double-dual functor `F(W) = W**` agrees naturally with the identity on finite free
  `F₂`-modules, but `LF(V) = V**[0]` and the evaluation map `V → V**` is not surjective. Thus this
  `F` differs from the filtered-colimit extension of its finite free values, whose derived functor
  is the identity.

### Examples

For a prime `p`, the free resolution `[ℤ →p ℤ]` gives `ℤ/p ⊗^L ℤ/p` with cohomology `ℤ/p` in
degrees `0` and `−1`. The two degree-one shuffle generators have coefficients `+1` and `−1`.

### Dependencies

Layer 0 and Mathlib complexes, K-injectivity, Dold–Kan, augmented simplicial objects with extra
degeneracies, polynomial rings, combinatorial simplicial homotopies and their chain homotopies,
tensor products, filtered colimits, spectral objects, homology, mapping cones and double-complex
totalization; Tau Ceti K-injective and K-flat replacements, Lazard's theorem, the Alexander–Whitney
maps of simplicial and bisimplicial objects, the shuffle map and the Eilenberg–Zilber homotopy
equivalence for simplicial sets, and the spectral sequences of filtered complexes and of
first-quadrant bicomplexes.

## Layer 2: cotangent calculus, integral powers and deformations

### 0.4 The full cotangent complex

For a ring map `A → B`, define the connective `B`-module complex `L_(B/A) ∈ D(B)` as the alternating face complex of `Ω¹_(P•/A) ⊗_(P•) B` for the
standard resolution `P• → B`, with simplicial degree `n` placed in cohomological degree `−n`
([StacksCt] Definition 3.2, Tag 08PN, p.3). Any polynomial resolution computes it, naturally and
coherently in comparison maps ([StacksCt] Lemmas 4.3–4.7 and Remark 5.5; Tags 08PU, 08QE–08QH, 08QI,
pp.5–9). Commutative squares `(A → B) → (A′ → B′)` induce `L_(B/A) ⊗^L_B B′ → L_(B′/A′)`. The full
object retains all negative cohomology. The intended signature is

```lean
Algebra.CotangentComplex (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    DerivedCategory (ModuleCat.{u} B)
```

Construct the simplicial `B`-module with terms `B ⊗_(P_n) Ω_(P_n/A)` and its scalar-extension face maps,
its alternating-face complex and its cochain model in nonpositive degrees before `DerivedCategory.Q`.
([BL22], Appendix B, Construction B.1 and Remark B.2, pp.225–226, treat the same object.)

*Needs:* §0.1 (Simplicial polynomial resolutions); §0.2 (Derived tensor products on module derived categories); Mathlib `KaehlerDifferential.D`, `DerivedCategory`, `DerivedCategory.Q`,
`DerivedCategory.singleFunctor`, `DerivedCategory.homologyFunctor`.

Prove the following laws.

- every commutative square `(A → B) → (A′ → B′)` gives
  `L_(B/A) ⊗^L_B B′ → L_(B′/A′)`, with identity and composition laws; on the model it sends
  `t ⊗ dx` to `b(t) ⊗ d(a(x))`. Together these form a functor on the
  arrow category of commutative rings, retaining every cohomological degree.
- every polynomial resolution gives the differential model,
  naturally and coherently in comparison maps.
- `H⁰L_(B/A) ≃ KaehlerDifferential A B`, preserving the
  universal derivation ([StacksCt] Lemma 92.4.5, Tag 08QF).

**Checks.**

- `L_(A/A) = 0`.
- `L_(A[t]/A) ≃ A[t]·dt` in degree 0.
- for `k` a field of characteristic different from 2 and
  `B = k[ε]/ε²`, `L_(B/k)` is `[B → B·dε]` in degrees `−1, 0` with map multiplication by `2ε`;
  `H^−1` is nonzero.
- in characteristic 2 the same regular presentation has zero
  differential: both `H^−1` and `H⁰` are `B`. This pins the derivative `2ε` and prevents an
  invertibility-of-2 assumption from entering the integral construction.
- homological degrees `0, 1, 2` of the simplicial model are placed in
  cohomological degrees `0, −1, −2`; for `ℤ → ℤ/2`, `H⁰ = 0` but `H^−1 ≅ ℤ/2`, which excludes a
  construction that keeps only Kähler differentials.

For the arrow-category model, take the underlying simplicial rings of each standard
resolution. A commutative square induces a map of these rings respecting augmentation and base
scalars, hence a semilinear chain map between the differential models. For base map `a` and target
map `b`, this map takes `t ⊗ dx` to `b(t) ⊗ d(a_P(x))`, where `a_P` is the induced map of resolution
rings. These comparisons retain the full complex, with no truncation.

[StacksCt], Lemma 3.4, Tag 08S9, p.3; Lemmas 92.4.5–92.4.7, Tags 08QF–08QH.
The downstream consumer PerfectoidSpaces §P0.19 uses this precise model contract.

**Checks.**

- Identity and composite squares induce the identity and composite resolution maps; the square
  with zero target induces the augmentation to the zero ring.
- The identity ring map has zero cotangent complex; a polynomial ring has its free module of
  differentials in degree zero; `ℤ → ℤ/2` has `H⁻¹ = ℤ/2`. All arrow-model comparisons retain
  these values.
- the first alternating differential is `d₀ − d₁`,
  so on `x + y` it is `d₀x − d₁x + d₀y − d₁y`.

### 0.5 Square-zero extensions and their classes

For `A → B` and a `B`-module `M`, define a square-zero extension of B by M over A: an
`A`-algebra surjection `B′ → B` with a specified injective additive identification of `M` with its
kernel, whose products vanish and whose `B`-action on the kernel is the given one. The trivial
extension `B ⊕ M` has multiplication `(b,m)(b′,m′) = (bb′, bm′ + b′m)` and is split. Define
the isomorphism relation (isomorphism of `A`-algebras compatible with the projection and the kernel
identification) and `Exal_A(B, M)` as its quotient, an abelian group under Baer sum, with the class
the extension class of an extension. For an `A`-algebra map `f : T → B` and an extension of `B` by `M`,
the morphism obstruction is the class of the pullback extension of `T`. Derivations `A`-linear from `B`
to `M` are the sections of the trivial extension, and `Der_A(B,M)` is the set of such sections
([StacksDefos] §2, Lemmas 2.1–2.3 and Remark 2.4, Tags 08S5, 08S7, 0GPT, 0GPU, pp.2–4; Mathlib
`derivationToSquareZeroEquivLift`).

*Needs:* Mathlib `Algebra.Extension`, `Derivation`, `derivationToSquareZeroEquivLift`.

Prove the following laws.

- `B ⊕ M` has projection to `B` and zero section, with
  square-zero augmentation ideal `M`.
- `A`-derivations `B → M` are in bijection with
  `A`-algebra sections of `B ⊕ M → B`, the zero derivation corresponding to the
  zero section.
- a `B`-linear map `M → N` induces
  `Der_A(B, M) → Der_A(B, N)` and `Exal_A(B, M) → Exal_A(B, N)` (pushout of extensions), preserving the
  zero derivation and the split class.
- the class of an extension is its morphism obstruction for the identity map, normalized on a
  lift of the degree-zero polynomial resolution by subtracting the two lifted faces in the order
  `d₀ − d₁`.

**Checks.**

- `Der_A(A, M) = 0` and `Exal_A(A, M) = 0`.
- for `B = A[t]`, derivations are determined by `δ(t) ∈ M`, freely.
- for discrete `M`, a section sends `t²` to `(t², 2tδ(t))`;
  replacing the square-zero product by a product ring fails.
- `ℤ/4 → ℤ/2` with kernel `2ℤ/4 ≅ ℤ/2` has no ring section and a nonzero
  class, and so does `ℤ/9 → ℤ/3`; the rational dual numbers give the zero class.

Give the square-zero extensions their category: morphisms are algebra maps over the base and quotient that preserve the identified kernel.
Categorical isomorphisms give exactly the isomorphism relation. For two representatives `E, F`,
construct their Baer sum from
`E ×_B F` by quotienting the antidiagonal kernel `(i_E(m), −i_F(m))`. The image of
`(i_E(m), i_F(n))` is the kernel element `m + n`. Units, inverses and associativity
are induced by the split extension, kernel negation and the iterated fibre product.

[GR], §§2.5.4–2.5.7, p.30, in the classical setup; [StacksDefos], Remark 2.4, Tag 0GPU.

**Checks.**

- zero kernel forces an invertible projection and a unique arrow
  between any two extensions.
- extensions of `ℚ` over itself split, and an automorphism
  fixing quotient and kernel is the identity.
- `ℚ[X] ⊕ εℚ[X]` has the nonidentity automorphism
  `a + εb ↦ a + ε(b + a′)`, which fixes the quotient and kernel.
- the sum of two copies of `ℤ/4 → F₂` has zero class,
  although either summand has nonzero class; the antidiagonal quotient is essential.

### 0.7 Degree zero and the naive cotangent complex

For `A → B`, `H⁰L_(B/A) ≃ Ω¹_(B/A)`. If `P → B` is a polynomial presentation with kernel `J`,
`τ_(≥−1)L_(B/A)` is represented by `[J/J² → Ω¹_(P/A) ⊗_P B]` in degrees `−1, 0`. Its `H^−1` agrees
with the pinned `Algebra.H1Cotangent`; the displayed two-term complex is not the full cotangent complex
for an arbitrary quotient. `τ_(≥−2)L_(B/A)` is the Lichtenbaum–Schlessinger complex
`[Rel/TrivRel → F ⊗_P B → Ω_(P/A) ⊗_P B]` of a free presentation `F → J` with relation module `Rel`
and Koszul relations `TrivRel` ([StacksCt] Lemma 13.3, Tag 09CG, p.26).

[StacksCt], Lemma 92.4.5, Tag 08QF; Lemmas 11.2 and 11.3, Tags 08RA, 08RB, p.21.

*Needs:* §0.4 (The full cotangent complex); Mathlib `Algebra.Extension.cotangentComplex`,
`Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`,
`Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`.

**Checks.**

- For the identity map, both the naive truncation and the Lichtenbaum–Schlessinger truncation vanish.
- For `ℤ → ℤ/p`, the naive complex has the single nonzero term `ℤ/p` in degree `−1`.
- For `k[x,y]/(x,y)²` over a field `k`, `H^−2(L) ≅ k`; replacing the full object by its naive truncation loses this class.

### 0.6 The cotangent universal property

For `A → B` and a `B`-module `M`, there are natural bijections
`Hom_(D(B))(L_(B/A), M[0]) ≃ Der_A(B, M)` and
`Hom_(D(B))(L_(B/A), M[1]) ≃ Exal_A(B, M)`, the latter sending
precisely the split extensions to zero, and `Hom_(D(B))(L_(B/A), M[−n]) = 0` for `n > 0`. They are
natural in `M` and compatible with commutative squares. The first uses `H⁰L = Ω`; the second the
identification of the naive cotangent complex with `τ_(≥−1)L` and `Exal = Ext¹(NL, M)`
([StacksCt] Lemma 92.4.5, Tag 08QF, and Lemma 11.3, Tag 08RB, p.21;
[StacksDefos] Lemma 2.3, Tag 0GPT, p.4;
for the derivation-space form, [Bhatt12] Remark 6.6 and equivalence (6), p.25, with trivial
monoids).

*Needs:* §0.4 (The full cotangent complex); §0.5 (Square-zero extensions and their classes);
§0.7 (Degree zero and the naive cotangent complex);
Mathlib `derivationToSquareZeroEquivLift`, `CategoryTheory.Abelian.Ext`.

**Checks.**

- for `A → A` all three groups vanish.
- for `A[t]`, `Hom(L, M) ≅ M` and `Exal = 0`.
- for `ℤ → ℤ/p` and `M = ℤ/p`, `Hom(L, M) = 0` and `Exal ≅ ℤ/p`,
  realized by `ℤ/p² → ℤ/p`.

The classifier is additive: it identifies
Baer sum with addition of derived classes under the degree-one classifier. For a surjection `R → T`
with kernel `I`, construct the conormal comparison
`Ext¹_T(L_(T/R), M) ≃ Hom_T(I/I², M)`, using the naive truncation of 0.7. The conormal class formula sends the class of an
extension `E` to the map taking `r mod I²` to the unique `m` whose kernel inclusion
is the image of `r` under `R → E`. This pins the cocycle and kernel signs.

[GR], Theorem 2.5.30, p.34, Lemma 3.2.1 and (3.2.2), p.41, in the classical setup;
[StacksCt], Lemma 11.3, Tag 08RB.

**Checks.**

- the zero class gives the zero kernel map.
- the map for `R → R` has zero source and target.
- for `ℤ/9 → F₃` as an extension over `ℤ`, with kernel
  inclusion `1 ↦ 3`, the conormal class `3 mod 9` maps to `1 mod 3`; the negative
  extension class maps it to `2 mod 3`.
- the class of `ℤ/9 → F₃` has order three; doubling it
  is its negative and summing three representatives gives the split class.

### 0.8 The cotangent transitivity triangle

For composable ring maps `A → B → C` there is a natural distinguished triangle
`L_(B/A) ⊗^L_B C → L_(C/A) → L_(C/B) → (L_(B/A) ⊗^L_B C)[1]` in `D(C)`. Its first two arrows are
images under `DerivedCategory.Q` of chain maps, the first and second transitivity maps, induced by
the squares `(A → B) → (A → C)` and `(A → C) → (B → C)`; only the
connecting arrow is chosen. On low-degree homology the middle maps are
`Algebra.H1Cotangent.δ`, with exactness given by `Algebra.H1Cotangent.exact_map_δ` and
`Algebra.H1Cotangent.exact_δ_mapBaseChange`. The left term remains
`H^−1(L_(B/A) ⊗^L_B C)` for general maps. If `C` is flat over `B`, it identifies with
`C ⊗_B Algebra.H1Cotangent A B`, and the preceding exactness agrees with
`Algebra.H1Cotangent.exact_liftBaseChange_map_of_flat`.

[StacksCt], §7, Proposition 7.4; Tag 08QX, p.16 (construction pp.13–16).

*Needs:* §0.4 (The full cotangent complex); §0.6 (The cotangent universal property); §0.2 (Derived tensor products on module derived categories).

**Checks.**

- if `A = B`, the first transitivity map is zero and the second arrow
  is an isomorphism.
- if `B = C`, the second transitivity map is zero.
- for `ℤ → ℤ → ℤ/3`, the second transitivity map is nonzero on
  `H^−1 = ℤ/3`.

Specify both transitivity arrows before localization.
The first takes `c ⊗ x` to `c` times the image of `x` under the arrow-model map; the
second is that functorial map for the square with target ring fixed.

**Checks.**

- when `B → C` is the identity, the first arrow is invertible;
  for `A = B` its source is zero.
- for `ℚ → ℚ[X] → ℚ[X]`, the first arrow is nonzero
  on `dX`.
- The second arrow is the identity for `A = B`, the zero map
  for `B = C`, and the nonzero map on `H^−1` of `ℤ → ℤ → F₃`, respectively.

### 0.9 The cotangent complex of a map of simplicial rings and the diagonal comparison

For a map of simplicial commutative rings `R• → S•`, define the bisimplicial model by applying 0.4
levelwise, and its diagonal complex `L^Δ`, with the spectral sequence
`E¹_(i,j) = H_j(L_(S_i/R_i)) ⇒ H_(i+j)(L^Δ)` (homological indexing) and differential of bidegree
`(−r, r−1)`. For a polynomial resolution `S• → S` and `R• = S• ×_S R`, and more generally for maps of
simplicial rings resolving `R → S`, `L_(S/R) ≃ L^Δ`. For the derived pushout `P• ⊗_A A′` of a polynomial
resolution `P• → B` along `A → A′`, its cotangent complex over `A′` is the diagonal model of
`Ω_(P•/A) ⊗_A A′`. The diagonal model is a simplicial `S•`-module with levelwise free terms. Its derived
statements are made in `D(A)`, after realization, for a ring `A` mapping to `R•` as a constant
simplicial ring, and, when `S• → S` is a weak equivalence onto a discrete ring, in `D(S)` through the
levelwise base change `L^Δ ⊗_(S•) S`. The statements of this subsection assert only levelwise
module structure over a nondiscrete simplicial ring. Downstream consumers use separate simplicial-module adapters for deformation theory.

[GR], Proposition 8.1.7 and its proof, pp.219–220; [IllusieCC], Chapter II, 1.2.6.2 (as used in
[GR] loc. cit.); [BMS19], §2, pp.212–216.

*Needs:* §0.4 (The full cotangent complex); §0.1 (Simplicial polynomial resolutions);
§0.2.2 / Bisimplicial module diagonal comparison;
§S.1 (homological spectral sequence, convergence and abutment filtration); Mathlib `SimplicialObject`.

The spectral sequence first abuts to the direct-sum total complex; §0.2.2 identifies that
complex with the diagonal model, after restricting to the constant coefficient ring as above.

**Checks.**

- for constant simplicial rings the diagonal model is the cotangent complex
  of 0.4.
- for `R• = S•`, `L^Δ = 0`.
- for the constant map `ℤ → ℤ/2`, `H_1(L^Δ) ≅ ℤ/2`, so totalization
  is not replaced by taking only degreewise differentials.

### 0.10 Derived base change of the cotangent complex

For a commutative square with `B′ = B ⊗_A A′` and `Tor_i^A(B, A′) = 0` for `i > 0`,
`L_(B′/A′) ≃ L_(B/A) ⊗^L_B B′` naturally. Without Tor independence the same formula holds for the
derived pushout `P• ⊗_A A′` of a polynomial resolution, by 0.9; the degree-zero pushout need not
satisfy it.

[StacksCt], §6, Tag 08QL, pp.11–12, constructs the functorial map for any commutative
square; Lemma 6.2, Tag 08QQ, p.12, makes its derived scalar extension an isomorphism
under Tor independence.

*Needs:* §0.4 (The full cotangent complex); §0.2 (Derived tensor products on module derived categories);
§0.9 (simplicial cotangent complexes and the derived-pushout comparison).

**Checks.**

- For `A′ = A`, base change is the identity on the full cotangent complex.
- For `ℤ → ℤ[X]` and `A′ = F₂`, the comparison sends `dX` to `dX` and is invertible.
- For `A = ℤ`, `B = A′ = F_p`, the ordinary pushout has `L_(F_p/F_p) = 0`, whereas `L_(F_p/ℤ) ⊗^L_(F_p) F_p = F_p[1]`; Tor independence fails.

### 0.11 Localization and filtered colimits of cotangent complexes

For a ring `B` and multiplicative set `S`, `L_(S⁻¹B/B) = 0` and `L_(S⁻¹B/A) ≃ L_(B/A) ⊗^L_B S⁻¹B`.
Cotangent complexes commute with filtered colimits of ring maps: if `A_i → B_i` is a directed system
with colimit `A → B`, `L_(B/A) ≃ colim_i (L_(B_i/A_i) ⊗^L_(B_i) B)`, through the canonical diagram of
models with both source and target varying.

[StacksCt], §3, Lemma 3.4 (Tag 08S9), and §8, Lemmas 8.1 and 8.6 (Tags 08QZ, 08SF), pp.3, 17–19.

*Needs:* §0.4 (The full cotangent complex); §0.8 (The cotangent transitivity triangle); §0.10 (Derived base change of the cotangent complex).

**Checks.**

- Localizing at `1` gives the identity comparison and relative cotangent zero.
- For `ℤ[X] → ℤ[X,X⁻¹]`, the comparison retains the free generator `dX`; the relative complex vanishes.
- The filtered union of finite polynomial rings `A[X₁,…,X_n]` gives `A[X₁,X₂,…]` with differential module the direct sum on all `dX_i`, rather than a product.

### 0.12 The smooth cotangent computation

For a smooth finitely presented ring map `A → B`, `L_(B/A) ≃ Ω¹_(B/A)[0]`, where `Ω¹` is finite
projective. For an étale map it vanishes. Polynomial rings on arbitrary sets have a free differential
module in degree zero without a finiteness claim.

[StacksCt], §9, Lemma 9.1 (Tag 08R5), using §8, Lemma 8.4 (Tag 08R2) for étale maps, pp.18–19;
for polynomial rings, §4, Lemma 4.7 (Tag 08QH), p.6.

*Needs:* §0.4 (The full cotangent complex); §0.10 (Derived base change of the cotangent complex);
§0.11 (Localization and filtered colimits of cotangent complexes).

**Checks.**

- The polynomial algebra on no variables has zero cotangent complex.
- For `A[X]`, the generator `dX` is nonzero when `A` is nonzero, and no negative cohomology survives.
- For `k[ε]/ε²` over a field, the nonzero degree `−1` term excludes the smooth formula; in characteristic two the differential is zero.

### 0.13 Regular quotients and two-term models

If `J ⊂ P` is generated by a finite regular sequence `f₁, …, f_r` and `B = P/J`, then
`L_(B/P) ≃ (J/J²)[1]`, with `J/J²` free on the classes of the `f_i`. If `P` is smooth over `A`,
`L_(B/A)` is the two-term complex `[J/J² → Ω¹_(P/A) ⊗_P B]` with `f_i ↦ df_i` in degrees `−1, 0`.
Flatness of `B` over `A` is not needed for this computation.

[StacksCt], §14, Lemma 14.2 and Proposition 14.4; Tags 08SJ, 08SL, pp.29–31.

*Needs:* §0.4 (The full cotangent complex); §0.8 (The cotangent transitivity triangle); §0.12 (The smooth cotangent computation); §0.K.1 (Koszul resolution of a
regular sequence).

**Checks.**

- For the empty regular sequence, the relative quotient complex is zero.
- For `(p) ⊂ ℤ`, the complex is `F_p[1]`, so the quotient need not be flat over the base.
- For `k[X]/(X²)`, the two-term differential is multiplication by `2X`, and it vanishes in characteristic two.

### 0.14 Derived exterior powers

For a ring `B` and a connective `M ∈ D^(≤0)(B)` define `L∧^n_B(M)`, `n ≥ 0`, as the derived functor (0.3) of the exterior power `∧^n_B` on projective modules. It
is a connective `B`-module complex with base change and graded multiplication. For a flat discrete
`M` it agrees with the ordinary exterior power (the tensor quotient by alternating relations,
including tensors with two equal factors), and the exterior operation imposes `x ∧ x = 0` even at `2`. [SAG] Construction 25.2.2.2, p.1700, is the
same functor in the ∞-categorical language, with the alternating quotient in place of its
signed-coinvariant description; [BL22] Construction B.1 and Remark B.5, pp.225–226, specialize it to cotangent complexes.

[SAG], Construction 25.2.2.2, Proposition 25.2.3.1, Corollaries 25.2.3.2–25.2.3.3 and Proposition
25.2.3.4(2) with proofs, pp.1700–1704; [DoldPuppe] §4, pp.227–230. The signed-coinvariant
descriptions in [SAG] Construction 25.2.2.2 and Proposition 25.2.3.4(2), pp.1700, 1703,
are used with the alternating quotient: signed permutations alone do not kill repeated factors.

*Needs:* §0.3 (Derived functors of non-additive functors); §0.2.1 (Flat modules as filtered colimits of finite free modules);
§0.2.2 / Simplicial module tensor comparison (graded multiplication and scalar change); Mathlib `ExteriorAlgebra.exteriorPower`,
`exteriorPower.ιMulti`.

Prove the following laws.

- `L∧⁰_B(M) ≃ B` naturally.
- `L∧¹_B(M) ≃ M`.
- `L∧ⁿ_B(M) ⊗^L_B B′ ≃ L∧ⁿ_(B′)(M ⊗^L_B B′)` ([SAG] Proposition 25.2.3.1).
- for flat discrete `M`, `L∧ⁿ_B(M)` is the ordinary exterior power in degree
  zero ([SAG] Corollary 25.2.3.3 and Proposition 25.2.3.4(2); Lazard's theorem [StacksAlg] Theorem
  10.81.4, Tag 058G, implemented as `TauCeti.flatModuleFilteredFree`, reduces to finite free modules).

**Checks.**

- `L∧⁰_B(0) = B` and `L∧ⁿ_B(0) = 0` for `n > 0`.
- for the flat rank-one `B`-module `Be`, `L∧²(Be) = 0`,
  including `B = F₂`. Signed coinvariants instead give `F₂` over `F₂` and `ℤ/2` over `ℤ`.
- for a nonzero ring `B`, flat `M = B` and `n ≥ 0`,
  the Dold–Kan model of `M[1]` (the simplicial module with `B^k` in level `k`) gives
  `H^−n(L∧ⁿ(M[1])) ≅ Γⁿ(M)`, nonzero, so positive powers of a shifted line are nonzero.

### 0.15 Derived symmetric powers

For a ring `B` and connective `M`, define `LSym^n_B(M)`,
`n ≥ 0`, as the derived functor (0.3) of the symmetric power on projective modules. It is a
connective `B`-module complex with base change and graded multiplication; for a flat discrete `M` it
is the ordinary symmetric power.

[SAG], Construction 25.2.2.1, Proposition 25.2.3.1 and Proposition 25.2.3.4(1) with proofs,
pp.1699–1704; [DoldPuppe] §4, Example 4.10, pp.229–230.

*Needs:* §0.3 (Derived functors of non-additive functors); §0.2.1 (Flat modules as filtered colimits of finite free modules);
§0.2.2 / Simplicial module tensor comparison (graded multiplication and scalar change).

Prove the following laws.

- `LSym⁰_B(M) ≃ B` naturally.
- `LSym¹_B(M) ≃ M`.
- `LSymⁿ_B(M) ⊗^L_B B′ ≃ LSymⁿ_(B′)(M ⊗^L_B B′)`.
- for flat discrete `M`, `LSymⁿ_B(M)` is the ordinary symmetric power in degree
  zero, using `TauCeti.flatModuleFilteredFree` and filtered-colimit compatibility.

**Checks.**

- `LSym⁰_B(0) = B` and `LSymⁿ_B(0) = 0` for `n > 0`.
- for the flat rank-one `ℤ`-module `ℤe`, `LSym²` is free of
  rank one on `e²`; its coefficient map is quadratic.
- over `F₂`, `Sym²(F₂e)` is generated by `e²`,
  whereas the square of `e` in the divided power algebra is zero.

### 0.16 Derived divided powers

For a ring `B` and connective `M`, define `LΓ^n_B(M)`,
`n ≥ 0`, as the derived functor (0.3) of the homogeneous divided-power piece `Γ^n_B` of
§0.DP.2 on projective modules. It is a connective `B`-module complex
with base change and graded multiplication. For a flat discrete `M` it is the module of
`Σ_n`-invariant tensors in `M^(⊗n)`, which is `Γ^n_B(M)` for flat `M` (§0.DP.2 for free modules, and `TauCeti.flatModuleFilteredFree` for the filtered-colimit reduction).

[SAG], Construction 25.2.2.3, Remark 25.2.2.4, Proposition 25.2.3.1 and Proposition 25.2.3.4(3) with
proofs, pp.1700–1704; [DoldPuppe] §4, Example 4.13 and (4.14), p.230.

*Needs:* §0.3 (Derived functors of non-additive functors); §0.2.1 (Flat modules as filtered colimits of finite free modules); §0.DP.2;
§0.DP.3; §0.2.2 / Simplicial module tensor comparison (graded multiplication and scalar change);
Mathlib `DividedPowerAlgebra`.

Prove the following laws.

- `LΓ⁰_B(M) ≃ B` naturally.
- `LΓ¹_B(M) ≃ M`.
- `LΓⁿ_B(M) ⊗^L_B B′ ≃ LΓⁿ_(B′)(M ⊗^L_B B′)`.
- for flat discrete `M`, `LΓⁿ_B(M)` is the ordinary divided power in degree
  zero, using `TauCeti.flatModuleFilteredFree` and filtered-colimit compatibility.

**Checks.**

- `LΓ⁰_B(0) = B` and `LΓⁿ_B(0) = 0` for `n > 0`.
- for the flat rank-one `ℤ`-module `ℤe`, `LΓ²` is free of rank
  one on `γ₂(e)`, and `e·e = 2γ₂(e)`.
- over `F_p`, `γ_p(e)` in `Γ(F_p e)` is nonzero
  although `e^p = p!γ_p(e) = 0`.

### 0.17 Exterior powers of a triangle and décalage

For a short exact sequence `0 → K → L → M → 0` of projective modules, `∧ⁿL` has the finite
filtration `F^j = image(∧^j K ⊗ ∧^(n−j) L)`, `0 ≤ j ≤ n`, with graded pieces
`∧^j K ⊗ ∧^(n−j) M`. Every fibre sequence `K → L → M` of connective complexes is represented by a
degreewise split short exact sequence of simplicial projective modules, so applying this filtration
levelwise gives a natural finite filtration of `L∧ⁿL` of length `n+1` with graded pieces
`L∧^j K ⊗^L L∧^(n−j) M`, multiplicative for the weight grading. For connective `M` there are the
décalage equivalences `LSymⁿ(M[1]) ≃ (L∧ⁿM)[n]` and `L∧ⁿ(M[1]) ≃ (LΓⁿM)[n]`; for a flat discrete
module `N` over a commutative ring `R` they read `L∧ⁿ(N[1]) ≃ Γⁿ(N)[n]` and
`LSymⁿ(N[1]) ≃ (∧ⁿN)[n]`, by the flat-module laws of §§0.14 and 0.16.

For flat `N` both are stated on the strict model: let `X = Γ₀(N[1])` be Mathlib's Dold–Kan
simplicial module (`AlgebraicTopology.DoldKan.Γ₀`) of `N` placed in homological degree one, a finite
sum of copies of `N` in each level. The headline `DerivedDeRham.exteriorPower_decalage` says that
the alternating face complex of the levelwise exterior power `∧ⁿX` (Mathlib's
`ModuleCat.exteriorPower.functor`) has homology `Γⁿ_R(N)`, Tau Ceti's
`DividedPowerAlgebra.homogeneousSubmodule`, in homological degree `n` and zero in every other
degree. The headline `DerivedDeRham.symmetricPower_decalage` says that the alternating face complex
of the levelwise symmetric power `Symⁿ X` (Tau Ceti's `ModuleCat.symmetricPower.functor`) has
homology `∧ⁿ_R N` in degree `n` and zero elsewhere. These three functors commute with filtered
colimits, so by Lazard's theorem (§0.2.1) the levelwise values on this degreewise flat model
compute the derived functors of §§0.14–0.16, by §0.3 on the finite free terms.

[DM], Lemma 3.3 and its proof, pp.21–22 (the filtration for a short exact sequence of projective
modules and its levelwise application to cotangent complexes); [SAG], Proposition 25.2.4.2 (Illusie)
with its proof, pp.1704–1707 (the Koszul filtrations `F_i`, `G_i` and the décalage equivalences);
[Bhatt12], Proposition 3.22 and Remark 3.43, pp.11–12, 18, for the uses below.

*Needs:* §0.14 (Derived exterior powers); §0.15 (Derived symmetric powers); §0.16 (Derived divided powers);
§0.3 (Derived functors of non-additive functors); §0.2.2 / Simplicial module tensor comparison;
for the flat-module headlines, §0.2.1, Mathlib `AlgebraicTopology.DoldKan.Γ₀` and
`ModuleCat.exteriorPower.functor`, and Tau Ceti `ModuleCat.symmetricPower.functor` and
`DividedPowerAlgebra.homogeneousSubmodule`.

For simplicial projective representatives `X, Y` of `K, M`, the levelwise graded piece is
`s(∧^j X ⊗_B ∧^(n−j) Y)`. The exterior powers of these projective modules are projective;
§0.2.2 identifies this complex with `L∧^j K ⊗^L_B L∧^(n−j) M`. Its natural and monoidal
compatibilities identify the products on the filtration and on its graded pieces.

**Checks.**

- if `K = 0`, the filtration has the single piece `L∧ⁿM`; if `M = 0`,
  the single piece `L∧ⁿK`.
- for `L = K ⊕ M` with `K = Be`, `M = Bf` free of rank one and `n = 2`,
  the graded pieces are `∧²K = 0`, `K ⊗ M ≅ B(e ∧ f)` and `∧²M = 0`, matching `∧²(B²) ≅ B`.
- for `N = ℤ` and `n = 2`, `L∧²(ℤ[1]) ≃ Γ²(ℤ)[2] ≅ ℤ[2]` is nonzero, whereas the
  ordinary exterior square of a rank-one module is zero; over `F₂` the same holds with `γ₂` surviving.
- on the strict model with `N = R` and `n = 2`, the normalized complex of `∧²X` is `R` in
  homological degree two alone (the cross-effect `R ⊗ R`, since `∧²R = 0` in degree one), matching
  `Γ²(R) = R·γ₂(e)`. That of `Sym²X` is `R → R` in degrees two and one with a unit as differential
  (on the bar model of `X`, `e₁e₂ ↦ −e²`), so it is acyclic, matching `∧²R = 0`, although
  `Sym²R = R` is nonzero in degree one. For `n = 0` both complexes are `R` in degree zero, `Γ⁰` and
  `∧⁰`; for `N = 0` and `n ≥ 1` both vanish, as do `Γⁿ(0)` and `∧ⁿ0`.
- flatness cannot be dropped from the strict statement. For `N = ℤ/2` over `ℤ` and `n = 2`, the
  levelwise `∧²_ℤ` of the model is `∧²_(F₂)` of the `F₂`-model, whose homology is
  `Γ²_(F₂)(F₂) = F₂` in degree two. But `Γ²_ℤ(ℤ/2) ≅ ℤ/4`, generated by `γ₂(1)` with
  `1·1 = 2γ₂(1) ≠ 0` and `4γ₂(1) = γ₂(2) = 0`.

### 0.25 Cotangent obstruction theory for square-zero lifts

Let `A′ → A` be a square-zero extension with ideal `J` and let `B` be an `A`-algebra and `N` a
`B`-module with an `A`-linear `c : J → N`. There is a canonical obstruction in `Ext²_B(L_(B/A), N)` to a
square-zero `A′`-algebra extension `B′ → B` with kernel identified with `N` and inducing `c`; if one
exists, the isomorphism classes form a torsor under `Ext¹` and automorphisms are `Ext⁰` ([StacksCt]
Lemma 16.1, Tag 08SP, p.31). This holds for every `A`-linear `c`. The flat specialization requires the
canonical map: let `B` be flat over `A`, `N = J ⊗_A B` and `c(j) = j ⊗ 1`. Then a solution `B′` is flat
over `A′` with `B′ ⊗_(A′) A ≃ B`. Indeed `JB′` is the `B`-submodule of `N` generated by `c(J)`, which is
all of `N`, so `B′/JB′ = B` is flat over `A`. Moreover `J ⊗_(A′) B′ = J ⊗_A B → JB′ = N` is the
identity, so `Tor₁^(A′)(A, B′) = 0` and the nilpotent flatness criterion applies ([StacksAlg] Lemma
10.99.8, Tag 051C, pp.233–234). The argument uses only that the map `J ⊗_A B → N` induced by `c` is an
isomorphism; an abstract isomorphism of the kernel with `J ⊗_A B` does not give the Tor vanishing
(the zero-kernel-map Check below). For a square-zero extension `T′ → T` of `A`-algebras with kernel `J` and
an `A`-map `f : B → T`, the obstruction to lifting `f` to `T′` lies in `Ext¹_B(L_(B/A), J)` and lifts
form a torsor under `Ext⁰` ([StacksDefos] Lemma 2.1, Tag 08S5, p.2, with `H⁰L = Ω`). For smooth `B/A`,
finite projectivity of `L` in degree zero makes square-zero algebra deformations exist in a single
isomorphism class, with automorphism group `Ext⁰_B(L_(B/A), N)`. Morphism lifts exist and form the
torsor under `Der_A(B,J)`; this torsor can have more than one element.

[StacksCt], §16, Lemma 16.1 (Tag 08SP), and its ringed-space version §21, Lemma 21.1 (Tag 08UZ),
pp.31–32, 37–38; [StacksAlg] Lemma 10.99.8 (Tag 051C).

*Needs:* §0.6 (The cotangent universal property); §0.8 (The cotangent transitivity triangle);
§0.12 (The smooth cotangent computation); Mathlib `Module.Flat`.

**Checks.**

- in the flat specialization, the identity base extension has `J = 0`
  and `N = J ⊗_A B = 0`, so the obstruction vanishes and the lift is `B`. In the arbitrary-`c`
  problem with `A′ = A = B = ℤ`, `N = ℤ` and `c = 0`, a solution is `ℤ[ε]/ε²`, with nonzero kernel.
- a polynomial algebra lifts uniquely up to isomorphism; its obstruction
  group `Ext²(Ω[0], N)` vanishes.
- For `A = T = k`, `B = k[x]` and `T′ = k[ε]/ε²`, the map `x ↦ 0` has distinct lifts
  `x ↦ 0` and `x ↦ ε`. Their difference is the derivation `x ↦ ε`; the automorphisms of `T′`
  fixing its identified kernel and quotient are `Der_k(k,k) = 0`.
- the lift's kernel must be `J ⊗_A B`; for `A′ = ℤ/4 → A = ℤ/2` and
  `B = F₂[t]`, the lift `ℤ/4[t]` has kernel `2ℤ/4[t] ≅ F₂[t]`, while the extension of `B` by the
  unrelated module `0` is not a lift.
- for `A′ = ℤ/4`, `A = B = F₂`, `J = N = F₂` and `c = 0`, the ring
  `B′ = F₂[ε]/ε²`, a `ℤ/4`-algebra through `F₂`, solves the arbitrary-`c` problem: its kernel is `F₂ε ≅ N`
  and it induces `c = 0`. But `2B′ = 0`, so `JB′ = 0`, `B′/JB′ = B′ ≠ B` and `B′` is not flat over `ℤ/4`.
  The flat specialization needs the canonical `c`.

For a square-zero extension `E : A′ → A` with kernel `J` and an `A`-algebra `B`, construct
the transitivity connecting map for `A′ → A → B`. The triangle compatibility law fixes the first two arrows as
the first and second transitivity maps; the connecting map uses Mathlib’s cone triangle
with minus projection onto the shifted source. For the specified `c : J → N`,
the kernel-extension class is the scalar-adjoint derived class of
`E` pushed out along `c`; on the degree-one conormal it is `c`. In the flat case it sends
`j` to `1 ⊗ j` in `B ⊗_A J`, with the given kernel inclusion retained.
Define the deformation obstruction as the composite of
the transitivity connecting map with this class shifted by one and the canonical
`N[1][1] ≃ N[2]`. This is the class governing the extension problem above.

Construct evaluation on differentials from a degree-zero derived
cotangent morphism to its derivation on `H⁰L = Ω`. The evaluation formula evaluates on `dx` as `δ(x)`.
The automorphism comparison for a flat lift uses
`h − id = kernel inclusion ∘ δ ∘ reduction`; composition corresponds to addition and
inversion to negation. Compute the polynomial lift formula for
`ℚ[ε]/ε²[X]`: translation `h_a(X) = X + aε` has derivation `δ(X) = a`,
`δ(X²) = 2aX`, and for every polynomial `P`, the included value of `δ(P mod ε)`
is `h_a(P) − P`.

[GR], Theorem 2.5.32, p.35, (3.2.7)–(3.2.10) and Corollary 3.2.11, pp.41–42,
in the classical setup; [StacksCt] Tag 08SP; Mathlib
`CochainComplex.mappingCone.inl_v_triangle_mor₃_f` for the cone sign.
The downstream consumer PerfectoidSpaces §P0.22 uses these normalized ordinary laws.

**Checks.**

- an identity leg gives zero; for
  `k[x]/(x³) → k[x]/(x²) → k` over a field `k`, both maps are quotient maps and the first
  kernel `(x²)` is square-zero. The connecting map surjects from `H^−2 L_(k/(k[x]/(x²)))`
  onto `H^−1(L_((k[x]/(x²))/(k[x]/(x³))) ⊗^L k) ≅ k`: the next conormal map sends
  `x²` to zero in `(x)/(x²)`. Thus the connecting map is nonzero.
- the cone triangle of `0 : ℚ[0] → ℚ[0]` sends its
  degree-`−1` generator to `−1` in the shifted source `ℚ[1]`.
- zero kernel gives zero, the extension with
  `A = B` and nonzero identified kernel gives its identity conormal map, and faithfully
  flat scalar extension preserves that nonzero class.
- zero kernel, a split base extension and a smooth
  polynomial algebra give zero obstruction, respectively. For a split base extension
  its kernel-extension class over the upper base can still be nonzero.
- zero class evaluates to zero, every derivation vanishes
  on base scalars, and a nonzero degree-zero class gives a nonzero derivation.
- `h_1(X) − X = ε`, the inverse has difference `−ε`, and `h_a ∘ h_b = h_(a+b)`.
  Over `ℚ` the positive and negative classes differ.

### Examples

For `A → A[x]`, the cotangent complex is `A[x] dx` in degree zero. For a prime `p` and `ℤ → ℤ/p`, it
is `(ℤ/p)[1]`. These put smooth differentials and the conormal class in different degrees.

### Dependencies

Layers 0–1 and Mathlib differentials, algebra extensions, derivations, `Ext`, flat modules, derived
categories, simplicial objects, Dold–Kan, exterior powers and divided-power algebras; Tau Ceti
symmetric powers
(`ModuleCat.symmetricPower.functor`) and homogeneous divided powers
(`DividedPowerAlgebra.homogeneousSubmodule`).

## Layer 3: derived limits, Hom and completion

### 1.1 Derived limits of towers

For an associative unital ring `A`, the derived limit is Tau Ceti's
`TauCeti.ModuleTower.derivedLimit A : DerivedCategory (ℕᵒᵖ ⥤ ModuleCat A) ⥤ D(A)`, the descent
through quasi-isomorphisms of the homotopy limit `TauCeti.ModuleTower.homotopyLimitFunctor`,
`holim K = Cone(δ)[−1]` for the difference map `δ` on the product complex of a complex of strict
towers of left modules. The pinned library supplies its localization comparison
`TauCeti.ModuleTower.derivedLimitFactors : Q ⋙ Rlim ≅ holim ⋙ Q`, its integer-shift isomorphisms
(a `Functor.CommShift ℤ` instance compatible with `derivedLimitFactors`), the projections
`TauCeti.ModuleTower.derivedLimitπ`, compatible with the transitions, and
`TauCeti.ModuleTower.derivedLimitIsoLimComplex`, which identifies `Rlim K` with the termwise limit
complex when every term of `K` has vanishing `lim¹`.

**Exactness of the derived limit.** Prove that `TauCeti.ModuleTower.derivedLimit A`, with these
shift isomorphisms, is a triangulated functor: it sends distinguished triangles of the derived
category of strict towers, with their global connecting morphisms, to distinguished triangles of
`D(A)`. This is the headline `DerivedDeRham.derivedLimit_isTriangulated`, for every associative
unital ring and every choice of universes for the two derived categories. For a chain map of
complexes of strict towers, compare the localized homotopy limit of its mapping cone with the
mapping cone of the induced map on derived limits, compatibly with the inclusions and projections.
A sequence of triangles distinguished only at each level does not suffice. One route: every
distinguished triangle of the derived category of towers is isomorphic to the image of the
mapping-cone triangle of a chain map `f` (Mathlib `DerivedCategory.mem_distTriang_iff`); the cone
comparison identifies the homotopy limit of that triangle with the mapping-cone triangle of
`holim(f)`, which is distinguished in `D(A)`. The third maps agree because the shift isomorphisms
of `holim` are those for which the projection `holim K → ∏ K_n` commutes with the shifts without a
sign. On complexes whose terms have vanishing `lim¹` the same shift isomorphisms are those of the
termwise limit, since the comparison `TauCeti.ModuleTower.homotopyLimitLift : lim K → holim K` has
the inclusion of the limit and zero as its two components.

**Compatibility with the tower maps.** Prove that the localization comparison intertwines the
projections, the six-term boundaries `TauCeti.ModuleTower.connecting`, the integer-graded Milnor
injection and projection of `TauCeti.ComplexTower`, read through the exchange of towers of
complexes with complexes of towers, the cofinal comparisons `TauCeti.ModuleTower.limSubsequenceEquiv`,
`TauCeti.ModuleTower.limOneSubsequenceEquiv` and `TauCeti.ComplexTower.limComplexSubsequenceIso`, and
the homotopy-square maps of AlgebraicTopology Stage 6, item 0. A degreewise-surjective replacement
gives the ordinary-limit model, with the same Milnor maps. Its left term remains lim¹ of the
preceding cohomology tower unless that tower is Mittag–Leffler; surjectivity of the transitions of
complexes does not imply this condition on cohomology. A tower of objects in `D(A)` alone is not a strict derived diagram.

The Čech computation of derived limits is formalised in [AffineCrystalline] for module-valued
diagrams on a category carrying Čech nerve data (`CechNerveData` in
`AffineCrystalline/Cohomology/Cech.lean`: a cosimplicial object `X` with
`Hom(X[n], Z) ≃ S(Z)^(n+1)` for nonempty sets `S(Z)`), where `rightDerivedLimIsoCech`
(`AffineCrystalline/Cohomology/CechDerived.lean`) identifies `Rⁿlim F` with
`Hⁿ(F(X[0]) → F(X[1]) → ⋯)`; `ℕᵒᵖ` has no initial object and so carries no such data, and the
towers, Milnor sequences and Mittag-Leffler criteria of this section lie outside it.

[StacksMA], §15.89, Lemmas 15.89.1, 15.89.3–15.89.4, Remark 15.89.10 and Lemmas 15.89.11–15.89.12;
Tags 091D, 0CQD, 0CQE, 091J, 091K, 091L, pp.238–242.

*Needs:* Tau Ceti `TauCeti.ModuleTower.derivedLimit`, `TauCeti.ModuleTower.derivedLimitFactors`,
`TauCeti.ModuleTower.homotopyLimitLift` and `TauCeti.ModuleTower.derivedLimitIsoLimComplex`, and the
six-term, Milnor and cofinal declarations of `TauCeti.ModuleTower` and `TauCeti.ComplexTower`
(Exact supplier contracts); AlgebraicTopology Stage 6, item 0 (the homotopy-square maps, for their
compatibility only); Mathlib `DerivedCategory`, `DerivedCategory.mem_distTriang_iff`,
`HomologicalComplex`, `CochainComplex`, localization, mapping cones and
`CategoryTheory.Functor.IsTriangulated`.

The API of the derived limit added here:

- `DerivedDeRham.derivedLimit_isTriangulated`: with its pinned shift isomorphisms the derived limit
  preserves distinguished triangles of the derived category of strict towers, including their
  global connecting morphisms.
- For a chain map of complexes of strict towers, the derived limit of its mapping cone is the
  mapping cone of the induced map on derived limits, compatibly with inclusions and projections.
- On a degreewise-surjective model its cohomology sequence is the integer-graded Milnor sequence of
  Tau Ceti's towers of complexes, with both maps retained.
- The localization comparison intertwines the six-term boundaries, the cofinal comparisons and the
  specified homotopy-square maps.

**Checks.**

- for a constant system `K`, `Rlim K_n ≅ K`.
- The mapping-cone triangle of the identity on any strict tower maps to the identity triangle
  of its derived limit, with zero third vertex; this tests the cone and shift comparisons.
- For the constant tower `K_n = ℤ[0]` with identity transitions, `derivedLimitIsoLimComplex`
  identifies both `Rlim(K[1])` and `(Rlim K)[1]` with `ℤ[1]`, and the shift isomorphism of the
  derived limit becomes the identity of `ℤ[1]`. A shift structure twisted by `−1` gives `−1` here,
  and with it the image of a distinguished triangle would carry the negated third map.
- Let `k` be a nonzero field, `V = ⊕_(m≥0) k`, `A_n = ⊕_(m≥n) k`, `B_n = V` and
  `C_n = k^n`, with tail inclusions, identity transitions and last-coordinate projections.
  Tail inclusion and first-`n`-coordinate projection give `A → B → C`.
  The diagram `A[0] → B[0] → C[0] → A[1]` with globally zero final arrow evaluates to a
  split distinguished triangle at every level. Its derived-limit image is not distinguished:
  its zero boundary would force the finite-support inclusion `⊕ k → ∏ k` to be surjective,
  whereas the all-ones sequence is outside its image. Levelwise distinguishedness does not
  satisfy the hypothesis of the exactness statement.
- For the same towers, the canonical triangle of `0 → A → B → C → 0` is distinguished in
  the derived category of towers. Its global connecting morphism is nonzero although each
  evaluation vanishes. The derived-limit boundary is the quotient
  `∏ k → (∏ k)/(⊕ k) ≅ lim¹ A`, up to the fixed cone sign, and `lim A = 0`.
- For a prime `p`, removing `r` initial levels of the multiplication-by-`p` tower on `ℤ` induces the inverse of
  multiplication by `p^r` on `ℤ_p/ℤ`, under the convergent-sum identifications: the tail sum is
  `(Σ pⁿa_n − Σ_(n<r) pⁿa_n)/p^r`. This tests the direction of the cofinal comparison.
- From the constant tower `ℤ[0]` to the tower `ℤ[1]` with multiplication-by-three transitions,
  take zero product maps and `h(x)_n = x₀` for even `n`, zero for odd `n`. The differentials
  vanish, so this is a square homotopy. The induced fibre map on `H⁰` sends `1` to
  `[Σ 3^(2m)] = [−1/8] ≠ 0` in `ℤ₃/ℤ`. Dropping the specified homotopy loses this map.
- for a prime `p` and `K_n = ℤ/p^n` with the reductions, `Rlim = ℤ_p` in degree zero.
- for a prime `p` and `K_n = ℤ` with transition maps multiplication by `p`,
  `lim = 0` and `lim¹ = ℤ_p/ℤ ≠ 0`, so `H¹(Rlim) ≠ 0`; the underived limit loses it.
- For a prime `p` and `K_n = [ℤ → ℤ/p^(n+1)]` in degrees `0, 1`, the transitions are degreewise
  surjective but `H⁰(K_n) = p^(n+1)ℤ` with inclusions is not Mittag-Leffler; the supplied Milnor injection identifies
  `H¹(Rlim K_n) = ℤ_p/ℤ` even though every `H¹(K_n)` vanishes.

### 1.1.1 Unbounded module derived Hom

**Unbounded module derived Hom.** For a commutative ring `A` and arbitrary `L, M ∈ D(A)`, the
derived Hom functor is Tau Ceti's `TauCeti.derivedHom A (ModuleCat A) : D(A)ᵒᵖ ⥤ D(A) ⥤ D(A)`, the
`A`-linear Hom complex, with its product totalization, between the K-injective replacements of
§0.I.1, functorial in both inputs. For every integer `n`, `TauCeti.derivedHomHomologyLinearEquiv`
identifies `H⁰(RHom_A(L,M)[n]) = Hⁿ(RHom_A(L,M))` with `Hom_(D(A))(L,M[n])` as `A`-modules,
naturally in `L` and `M`. Construct the tensor–Hom adjunction, comparing its tensor with §0.2:
`Hom_(D(A))(K, RHom_A(L,M)) ≃ Hom_(D(A))(K ⊗^L_A L, M)`, naturally in all three inputs.
Neither boundedness nor perfectness of `L` is required.

[StacksMA], §15.75, Tag 0A5W, equations 15.75.0.1–15.75.0.2 (Tags 0A63–0A64), and Lemma 15.75.1,
Tag 0A65; [StacksSites], §21.35, *Internal hom in the derived category*.

*Needs:* Tau Ceti `TauCeti.derivedHom` and `TauCeti.derivedHomHomologyLinearEquiv`; §0.2 (module
derived tensor); §1.1 (module limits for the nonperfect Check); Mathlib `ModuleCat`, Hom complexes,
`DerivedCategory` and localization.

**Checks.**

- `RHom_A(A[0],M) ≃ M`, with evaluation the identity under the tensor unit.
- for `L = ℤ/p`, `M = ℤ` and prime `p`, `H⁰ RHom_ℤ(L,M) = 0` and
  `H¹ RHom_ℤ(L,M) = ℤ/p`; the shift formula detects the degree-one extension class.
- for `L = ℤ[1/p]`, `M = ℤ` and prime `p`, the multiplication-by-p
  tower gives `H⁰ RHom_ℤ(L,M) = 0` and `H¹ RHom_ℤ(L,M) = ℤ_p/ℤ` by §1.1. This nonperfect first
  argument has a nonzero derived Hom although its ordinary Hom vanishes.

### 1.2 Derived ideal completeness

Let `I = (f₁, …, f_r) ⊂ A` be finitely generated. A complex `M ∈ D(A)` is derived `I`-complete if
`RHom_A(A[1/f_i], M) = 0` for each `i`, equivalently `Hom_(D(A))(A[1/f][n], M) = 0` for every integer
`n` and every `f ∈ I`. This depends only on `√I` and is equivalent to each `H^j(M)` being a derived
`I`-complete module. Completeness is a homotopical condition, not ordinary separatedness.

[StacksMA], §15.93, Lemmas 15.93.1–15.93.3, Definition 15.93.4 and Proposition 15.93.5; Tags 091P,
091Q, 091R, 091S, 091T, pp.261–263.

*Needs:* Mathlib `DerivedCategory`, `Localization.Away`; §1.1.1 (Unbounded module derived Hom);
§1.1 (Derived limits of towers);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences).

Lean: `DerivedDeRham.derivedCompleteness` (stated in `Suggested.lean` as vanishing of all morphisms
from the shifted localizations).
For `A : Type u`, the prototypes use `ModuleCat.{u} A` and the local instance `moduleDerived`
of `HasDerivedCategory.{u+1}`. The abbreviations `DerivedDeRham.D`, `DerivedDeRham.mod0` and
`DerivedDeRham.H` denote the derived category, placement in degree zero and cohomology;
`DerivedDeRham.isDerivedComplete_triangle` gives the shift and triangle part of
the closure laws below. These, the reflector statement of §1.3 and the module statements of
§§1.7–1.8 carry the same arbitrary universe `u`.

Prove the following laws.

- `DerivedDeRham.isDerivedCompleteGenerators`: the condition is RHom-vanishing for any finite generating set of `I`.
- `DerivedDeRham.isDerivedCompleteRadical`: if `√I = √J`, `I`-complete and `J`-complete objects coincide;
  neither this law nor the cohomology criterion needs finite generation of the ideal.
- `DerivedDeRham.isDerivedCompleteCohomology`: `M` is `I`-complete iff every `H^j(M)` is derived `I`-complete.
- derived `I`-complete objects are closed under derived limits (1.1),
  products, shifts and cones in `D(A)`.

**Checks.**

- for `I = 0`, every complex is derived complete.
- for `I = A`, only the zero object is complete.
- for a prime `p`, over `A = ℤ` with `I = (p)`, `ℤ_p` is derived p-complete,
  while `ℚ_p` is not: the map `ℤ[1/p] → ℚ_p` sending `1` to `1` gives a nonzero degree-zero class
  in `RHom_ℤ(ℤ[1/p], ℚ_p)`.

### 1.3 The derived completion reflector

For finitely generated `I ⊂ A` construct `Λ_I : D(A) → D(A)`, the completion reflector, with
natural unit `η_M : M → Λ_I M`, the completion unit, left adjoint to the inclusion of derived
`I`-complete objects. For `I = (f_i)`, put `C_I = ⊗_i [A → A[1/f_i]]` in cochain degrees `0, 1` and
`Λ_I M = RHom_A(C_I, M)`; equivalently the derived limit of Koszul quotients. It is exact,
independent of generators and idempotent. As a functor into the complete category it preserves
every categorical colimit that exists in its source. Derived
Nakayama: if `M` is complete and `M ⊗^L_A A/I = 0` then `M = 0`. The existence of the left adjoint
is the headline `DerivedDeRham.derivedCompleteness_isRightAdjoint`: for finitely generated `I` the
inclusion `ObjectProperty.ι (derivedCompleteness A I)` of the full subcategory of derived
`I`-complete objects into `D(A)` is a right adjoint ([StacksMA] Lemma 15.93.10, Tag 091V, p.264).
The intended Lean signatures of the functor and its unit are

```lean
DerivedDeRham.derivedCompletion (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A)
DerivedDeRham.completionUnit (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    𝟭 _ ⟶ DerivedDeRham.derivedCompletion A I hI
```

[StacksMA], §15.93, Lemmas 15.93.10, 15.93.18, 15.93.20 and 15.93.21; Tags 091V, 0920, 0G1U, 0AAJ,
pp.264, 267–268.

*Needs:* §1.2 (Derived ideal completeness); §1.1.1 (Unbounded module derived Hom);
§1.1 (Derived limits of towers);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences);
§0.K.1 (Koszul complexes); §0.2 (Derived tensor products on module derived categories); Mathlib `PadicInt`.

Every completion functor, unit and law below carries the finite-generation witness `hI : I.FG`;
changing that witness gives the same functor and unit.

Prove the following laws.

- `DerivedDeRham.derivedCompleteness_isRightAdjoint`: for finitely generated `I`, the inclusion of
  the derived `I`-complete objects into `D(A)` has a left adjoint.
- `η_M` is the universal map from `M` to an `I`-complete object.
- `Hom(Λ_I M, N) ≃ Hom(M, N)`, naturally for complete `N`.
- `Λ_IΛ_I M ≃ Λ_I M`, compatibly with both units.
- a complete `M` with `M ⊗^L_A A/I = 0` vanishes.
- for a finitely generated ideal `I`, `Λ_I M` is derived `I`-complete.
- for a small ordinary diagram
  `F : J ⥤ ObjectProperty.FullSubcategory (derivedCompleteness A I)`, let `ι` be the
  full-subcategory inclusion `ObjectProperty.ι (derivedCompleteness A I)`.
  Require `HasColimit (F ⋙ ι)`. Then `F` has a colimit in the complete category, and its image
  under `ι` is naturally isomorphic to `Λ_I(colimit (F ⋙ ι))`, with cocone maps
  `F(j) → colimit (F ⋙ ι) → Λ_I(colimit (F ⋙ ι))`. This follows by the reflector adjunction.
  No existence of arbitrary categorical colimits in `D(A)` is asserted, and the diagram is
  not a homotopy-coherent diagram in an enhancement.

**Checks.**

- `Λ_(p)ℤ ≃ ℤ_p` in degree 0.
- `Λ_(p)ℤ[1/p] = 0`, although `ℤ[1/p]` is nonzero.
- `Λ_(p)(ℤ/p^m) ≃ ℤ/p^m` for `m ≥ 1`.
- At `I = A` the complete objects are the zero objects, since `Hom(A[n], M) = H^(−n)(M)`; the left
  adjoint is the zero functor. At `I = 0` every object is complete and the left adjoint is the
  identity. A definition testing only `n = 0` would admit `ℤ[−1]`, `ℤ` in cohomological degree
  one, as `ℤ`-complete at `I = ℤ`: every `Hom(ℤ[1/f], ℤ[−1])` is a negative Ext group and
  vanishes, while `f = 1`, `n = −1` gives `Hom(ℤ[−1], ℤ[−1]) = ℤ`. The shift `ℤ[1]` is no witness:
  at `f = 2` already `Hom(ℤ[1/2], ℤ[1]) = Ext¹(ℤ[1/2], ℤ) = ℤ_2/ℤ ≠ 0` (§1.1.1).
- For `I = 0` all objects are complete, but multiplication by two on `ℤ[0]` has no categorical
  cokernel in `D(ℤ)`. A cokernel would be an epimorphism, hence split in a triangulated category;
  its target would be a summand of `ℤ[0]`. Since `End(ℤ[0]) = ℤ`, its only summands are zero
  and itself. Annihilating two forces the zero summand, contradicting the nonzero reduction
  `ℤ[0] → (ℤ/2)[0]`. The mapping cone does not satisfy the cokernel universal property.

### 1.4 The derived Koszul completion tower

For `M ∈ D(A)`, `I = (f₁, …, f_r)`, `Λ_I M ≃ Rlim_n(M ⊗^L_A K_A(f₁^n, …, f_r^n))`, with the
quotient-direction transition induced by `e_i ↦ f_i e_i` and the identity in degree zero. These are
derived Koszul quotients. Replacing them by ordinary `A/I^n` for an arbitrary ring is invalid.

[StacksMA], Lemma 15.93.18; Tag 0920, pp.266–267.

*Needs:* §0.K.1 (Koszul complexes, cohomologically reindexed);
§1.3 (The derived completion reflector); §1.1 (Derived limits of towers);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences).

**Checks.**

- For an empty sequence, completion at the zero ideal returns `M`.
- For `(p)` over `ℤ`, the map from `K(p^(n+1))` to `K(p^n)` is multiplication by `p` in degree `−1` and identity in degree zero.
- For `(0)` over a nonzero ring, each Koszul quotient has an extra degree `−1` term but its transition there is zero; the derived limit is `M`, not `M ⊕ M[1]`.

### 1.5 When ordinary quotient towers compute completion

For finite `I` generated by a regular sequence, `Λ_I M ≃ Rlim_n(M ⊗^L_A A/I^n)`, using the cofinal
ideals `(f₁^n, …, f_r^n)`. The same comparison holds for every `M ∈ D(A)` when `A` is Noetherian: the
pro-objects `{K(f₁^n, …, f_r^n)}` and `{A/(f₁^n, …, f_r^n)}` of `D(A)` are isomorphic because the
Koszul homology in negative degrees is pro-zero by Artin–Rees ([StacksMA] Lemma 15.96.1 and
Proposition 15.96.2, Tags 0921, 0922, pp.275–276, with the ordinary Artin–Rees lemma
[StacksAlg] Lemma 10.51.2). For principal `I = (f)`, it holds for every complex `M` when `A` has
bounded `f`-power torsion ([StacksMA] Lemmas 15.95.1–15.95.2, Tags 091X, 0923, pp.271–272). For a
Noetherian `A`, the derived completion of a complex with finitely generated cohomology has as
cohomology the `I`-adic completions of its cohomology modules ([StacksMA] Lemma 15.96.4, Tag 0A06).
Without these hypotheses use the Koszul tower.

[StacksMA], §15.95 Lemmas 15.95.1–15.95.2 and Examples 15.95.3–15.95.4, §15.96 Lemmas 15.96.1–15.96.4;
Tags 091X, 0923, 09AT, 0G3F, 0921, 0922, 0EET, 0A06, pp.271–277; [Prisms], §1.2 Footnote 5, pp.10–11.

*Needs:* §1.4 (The derived Koszul completion tower); §0.K.1; Tau
Ceti `TauCeti.ArtinRees.exists_controlled_lift`; §1.1 (Derived limits of towers);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences).

**Checks.**

- for `(p) ⊂ ℤ` the ordinary quotient tower gives `ℤ_p`.
- for `A = k[x,y]/(xy)` and `I = (x, y)`, the ordinary tower computes
  `Λ_I A = k[[x,y]]/(xy)` in degree zero, although `(x, y)` is not generated by a regular sequence.
- for a prime `p`, put `R = ℤ_p`, `T = ℚ_p/R`,
  `A = R ⋉ T` with square-zero second summand, `I = (p)` and `C = Λ_I(A[0]) ∈ D(A)`.
  Give `R` the quotient `A`-action. Since `p^n T = T`, the ordinary quotient tower gives `R[0]`,
  whereas `H^−1(C) ≅ R`, `H⁰(C) ≅ R` as `A`-modules and all other cohomology vanishes.
  Indeed the Koszul tower has `H^−1 = T[p^n]` with multiplication-by-`p` transitions and
  `H⁰ = R/p^n` with reduction transitions; both are surjective, so §1.1 gives these limits.
  After restriction along `R → A`, `Res^A_R C ≅ R[1] ⊕ R[0]` in `D(R)` ([StacksMA] §15.96,
  opening paragraph, Tag 0BKH, with this scalar restriction). This follows from `A = R ⊕ T`
  as `R`-modules and completion of the triangle `R → ℚ_p → T`, giving `Λ_(p)^R T ≅ R[1]`.
  The completion object and its unit remain in `D(A)`; bounded torsion fails.
- For the same `A` and `C`, `Hom_(D(A))(C, R[1]) = 0` although `H^−1(C) ≅ R ≠ 0`.
  The telescope difference map on `∏ R` is bijective, with inverse
  `b ↦ (∑_(j≥0) p^j b_(n+j))_n`, so `R[1]` is derived complete over `A` (Tag 091P).
  The adjunction (Tag 091V) identifies this Hom with `Ext¹_A(A,R) = 0`.
  Thus the truncation triangle `R[1] → C → R[0] → R[2]` is nonsplit in `D(A)`:
  an `A`-linear splitting would give a nonzero projection to `R[1]`.

### 1.6 Completion of simplicial commutative algebras

**Homotopical category of simplicial algebras.** For a commutative ring `A`, put
`S_A = SimplicialObject (CommAlgCat A)`, with strict simplicial algebra maps, and let `W` consist
of maps inducing quasi-isomorphisms on the associated `A`-module cochain complexes, reindexed as
in §0.2.2. Define `H_A = S_A[W⁻¹]` using Mathlib's `MorphismProperty.Localization` and write
`q : S_A → H_A` for its localization functor. Construct the induced underlying-module functor
`U : H_A → D(A)` and the natural comparison between `q ⋙ U` and the associated-module complex
followed by `DerivedCategory.Q`. Prove that `U` has connective image: `H^i(U B) = 0` for `i > 0`.
For a finitely generated ideal `I ⊂ A`, call `B ∈ H_A` complete precisely when
`derivedCompleteness A I (U B)` holds. This algebra localization and its adapters are targets here;
the generic localization construction is Mathlib's.

[StacksCt], Definition 92.3.1 and Remark 92.5.5, Tags 08PM and 08QI; [Prisms], §1.2, pp.10–12;
Mathlib `CategoryTheory/Localization/Construction.lean` and `Algebra/Category/CommAlgCat/Basic.lean`.
*Needs:* §0.1 (Simplicial polynomial resolutions); §0.2.2 (Simplicial module comparisons);
§1.2 (Derived ideal completeness); Mathlib `CommAlgCat`, `MorphismProperty.Localization`.

**Checks.**

- A constant algebra `B` has `U(q B) ≅ B[0]`; positive cohomology vanishes.
- The augmentation of every polynomial resolution `P• → B` becomes an isomorphism in `H_A`,
  with its prescribed underlying quasi-isomorphism in `D(A)`.
- At `I = 0` every object of `H_A` is complete; at `I = A` completeness means `U B = 0`.

**Strict completion models and descent.** Fix finite `I = (f₁, …, f_r) ⊂ A` and put
`R = ℤ[x₁, …, x_r]`, acting on `A` by `x_i ↦ f_i`. For `n ≥ 1`, choose compatible simplicial
polynomial resolutions `Q•^(n) → R/(x₁^n, …, x_r^n)` over `R`, with transitions surjective in
every simplicial degree. The standard resolutions of §0.1 give such a tower. For `B• ∈ S_A`,
form the tower `T(B•)_n = B• ⊗_R Q•^(n)` and its levelwise inverse limit
`L_model(B•) ∈ S_A`, retaining its strict algebra unit `B• → L_model(B•)`.
The associated module complex of each stage represents the derived Koszul quotient, and the
surjective transitions identify the module complex of the strict limit with its derived limit.

Prove that this model functor preserves `W`. For any two such resolution towers for the same
generating tuple, construct zigzags of algebra maps between their towers, over the quotient
tower and under constant `R`, through towers with degreewise surjective transitions. Require
weak equivalences at every stage and prove that the induced limit comparisons belong to `W`. The comparisons after tensoring with `B•` must also
be stagewise weak equivalences; degreewise polynomial resolutions have bounded-above flat
associated complexes, so §§0.2–0.2.2 supply the module tensor comparisons used in this proof.
Give these zigzags naturally in `B•` in the algebra-diagram category
`Fun(ℕᵒᵖ, S_A)`, compatibly with transition maps, quotient augmentations and units. Use the
localization of this diagram category at stagewise weak equivalences for their inverses;
an arbitrary diagram in `H_A` is not substituted for the strict tower. Require compatibility
with identity comparisons and composites. Thus the localized model and unit are independent
of the polynomial-resolution/tower choices by algebra comparisons.

Construct the descended endofunctor `L_I : H_A → H_A`,
the algebra completion functor, and a natural isomorphism
`q(L_model B•) ≅ L_I(q B•)` carrying the localized strict unit to its descended unit.
Every functor and law carries `hI : I.FG`. Independence of the finite generating tuple is the
unit-compatible algebra isomorphism characterized by the universal property below.

[Prisms], §1.2 and Footnote 6, pp.10–11; [StacksCt], Tags 08PM and 08QI;
[StacksMA], Tag 0920 for the underlying module limit.
*Needs:* the homotopical category above; §0.1; §§0.2–0.2.2; §1.1 (Derived limits of towers);
§1.3 (The derived completion reflector); §1.4 (The derived Koszul completion tower);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences).

**Checks.**

- A weak equivalence `B• → C•` induces weak equivalences of the Koszul towers and their strict
  limits, giving an isomorphism `L_I(q B•) ≅ L_I(q C•)` in `H_A`.
- Comparing a resolution tower with itself gives the identity in the localized algebra-diagram
  category, and its limit comparison fixes the unit.
- For the zero ideal the empty generating tuple returns `B•`. The tuple `(0)` instead has an
  extra degree `−1` module term at each Koszul stage with zero transitions there. Its completion
  is isomorphic to `q B•` in `H_A`; no stagewise equivalence with the empty-tuple tower is asserted.

**Algebra completion reflector.** Construct the natural algebra unit
`η : id_(H_A) → L_I` and prove that `L_I B` is complete for every `B ∈ H_A`. Construct the natural
unit-compatible isomorphism `α_B : U(L_I B) ≅ Λ_I(U B)` in `D(A)`, including all negative cochain
degrees. Its unit equation is `U(η_B) ≫ α_B.hom = completionUnit_(U B)`.
For every complete `C ∈ H_A`, prove that precomposition with `η_B` is a bijection
`Hom_(H_A)(L_I B, C) ≃ Hom_(H_A)(B, C)`, naturally in `B` and in complete `C`.
This is an adjunction for algebra maps in `H_A`.

Prove the following laws, with `hI : I.FG` throughout.

- the algebra unit `η` is natural and is represented by the strict model unit through the
  localization comparison for units.
- the natural isomorphism `α : L_I ⋙ U ≅ U ⋙ Λ_I` satisfies the unit equation
  `U(η_B) ≫ α_B.hom = completionUnit_(U B)` above.
- for any `f : B → C` in `H_A`,
  `f ≫ η_C = η_B ≫ L_I(f)`; the underlying completed map agrees with module completion via `α`.
- `derivedCompleteness A I (U(L_I B))` for every `B`.
- for complete `C`, the algebra-map bijection `Hom_(H_A)(L_I B, C) ≃ Hom_(H_A)(B, C)` is
  precomposition with the unit, `g ↦ η_B ≫ g`.
- `η_C` is an isomorphism for complete `C`. In particular,
  `L_I(η_B) = η_(L_I B)` and its inverse gives `L_I L_I B ≅ L_I B` naturally in `H_A`.

[Prisms], §1.2 and Footnote 6, pp.10–11, for completion of simplicial algebras;
[StacksMA], Tags 091V and 0920, for the module unit and adjunction underneath.
*Needs:* strict completion models and descent above; §1.2; §1.3; §1.4.

**Checks.**

- the p-completion of constant `ℤ` is isomorphic in `H_ℤ` to constant
  `ℤ_p`, compatibly with the algebra unit and its underlying module unit.
- the `(p, d)`-completion of constant `ℤ[d]` is isomorphic in `H_(ℤ[d])`
  to constant `ℤ_p[[d]]`, with both generators retained.
- at the unit ideal, `L_I B ≅ q(0)` in `H_A`. This is a localized
  isomorphism, and does not assert a strict isomorphism of levelwise-limit models with zero.
- For nonzero `A`, let `P• → 0` be its standard polynomial resolution of the zero `A`-algebra
  (Tags 08PM, 08QI). Its module complex is acyclic, so it is complete at `I = A`, but
  `P_0 = A[underlying(0)] ≅ A[t] ≠ 0`. There is exactly one strict map from constant `A` to
  `P•`, and no strict unital map from constant zero to `P•`: degree zero would give `0 → A[t]`.
  Thus `Hom_(S_A)(0, P•)` is empty while `Hom_(S_A)(A, P•)` is a singleton. In `H_A` the
  augmentation identifies `P•` with zero, and both Hom sets into `q P•` are singletons, as
  the algebra adjunction requires.

### 1.7 Complete flatness and complete faithful flatness

For finite `I ⊂ A`, an object `M ∈ D(A)` is `I`-completely flat when `M ⊗^L_A A/I` is a flat
`A/I`-module in degree zero, equivalently `M ⊗^L_A N` is discrete for every `I`-power-torsion
`A`-module `N`. It is `I`-completely faithfully flat if that reduction is faithfully flat. The
predicate itself does not require `M` to be complete. Define finite `I`-complete Tor-amplitude `[a, b]`
using the derived reduction and all discrete `A/I`-modules. For a discrete module `M` the condition
reads `Tor_n^A(M, A/I) = 0` for `n > 0` and `M/IM` flat over `A/I`; this module form is stated in
`Suggested.lean` with Mathlib's `CategoryTheory.Tor`.

[Prisms], §1.2, p.11, treats finitely generated ideals. [BMS19], Definition 4.1, p.220,
uses the p-complete framework; Lemmas 4.4–4.5 give completion and base change, while
Lemmas 4.6–4.7 and Corollary 4.8, pp.221–223, give the bounded-p-torsion consequences
used in §1.8. The discrete-module definition applies to any ideal `I`, without finite
generation. Every flat `A`-module is `I`-completely flat for arbitrary `I`: positive `Tor` against
`A/I` vanishes by Tau Ceti's `ModuleCat.isZero_Tor_succ_of_flat`, and `(A/I) ⊗_A M` is flat over
`A/I` by Mathlib's `Module.Flat.baseChange`.

*Needs:* §0.2 (Derived tensor products on module derived categories); §1.2 (Derived ideal completeness); Mathlib `CategoryTheory.Tor`, `Module.Flat`, `Module.Flat.baseChange`; Tau Ceti `ModuleCat.isZero_Tor_succ_of_flat`.

Lean: `DerivedDeRham.IsCompletelyFlatModule` is defined in `Suggested.lean`; the general derived
predicate uses the tensor product of §0.2.

Prove the following laws.

- complete flatness is equivalent to flat discrete derived reduction.
- the derived `I`-completion of a flat `A`-module is `I`-completely flat.
- derived base change followed by completion preserves complete flatness
  and complete faithful flatness.
- amplitude `[a, b]` means every derived tensor with a discrete `A/I`-module has
  cohomology in `[a, b]`.

**Checks.**

- for a prime `p`, `ℤ` as a `ℤ`-module is p-completely flat but is not derived
  p-complete.
- `ℤ_p` is p-completely faithfully flat over `ℤ`.
- `F_p` is not p-completely flat over `ℤ`: `F_p ⊗^L_ℤ F_p` has a
  nonzero degree `−1` term. The analogous `ℤ_p` calculation has the same obstruction.

### 1.8 Bounded torsion and complete Tor-amplitude

Assume `A` has bounded p-power torsion. If `M` is derived p-complete and has p-complete Tor-amplitude
`[a, b]`, then `M` has ordinary cohomological amplitude `[a, b]`. Bounded p-power torsion in every
cohomology group does not follow from this finite amplitude assumption. The bounded-torsion conclusion
below is restricted to the p-completely flat case `[a, b] = [0, 0]`: a derived p-complete,
p-completely flat `M` is an ordinary p-adically complete bounded-torsion module with `M/p^n` flat over
`A/p^n` for every `n ≥ 1`, and the multiplication map `M ⊗_A A[p^n] → M[p^n]` is an isomorphism.
Conversely a classically p-adically complete module with bounded p-power torsion whose reductions
`M/p^nM` are flat over `A/p^n` for every `n ≥ 1` is p-completely flat. For a module `M` in degree
zero these are the headlines `DerivedDeRham.isAdicComplete_of_isCompletelyFlatModule` and
`DerivedDeRham.isCompletelyFlatModule_of_isAdicComplete`, with complete flatness the predicate
`DerivedDeRham.IsCompletelyFlatModule` of §1.7 for `I = (p)` and bounded p-power torsion the
existence of `c` with `p^n x = 0 ⇒ p^c x = 0` for all `n`.

[BMS19], Lemmas 4.6–4.7 and Corollary 4.8, pp.221–223.

*Needs:* §1.2 (Derived ideal completeness); §1.3 (The derived completion reflector); §1.7 (Complete flatness and complete faithful flatness); §1.4 (The derived Koszul completion tower); §1.5 (the bounded-torsion comparison of ordinary and derived quotient towers); Mathlib `IsAdicComplete`, `Submodule.torsionBy`, `CategoryTheory.Tor`.

**Checks.**

- Over `ℤ_p`, `ℤ_p[1]` has complete Tor-amplitude `[−1,−1]`, fixing the shift convention.
- For `A = ℤ_p`, the derived p-complete module `∏_(n≥1) ℤ/p^n` has ordinary amplitude `[0,0]` and p-complete Tor-amplitude contained in `[−1,0]`, but unbounded p-torsion; finite amplitude alone gives no bounded-torsion conclusion.
- For `A = ℤ_p`, the complete flat module `ℤ_p` is torsion-free and all its reductions are flat over `ℤ/p^n`, whereas `F_p` has nonzero `Tor₁(F_p,F_p)` and is excluded.
- Over `A = ℤ/4` with `p = 2`, the module `ℤ/2` is complete with bounded torsion and `M/2M = ℤ/2`
  is flat over `ℤ/2`, but `M/4M = ℤ/2` is not flat over `ℤ/4`, and indeed
  `Tor₁^(ℤ/4)(ℤ/2, ℤ/2) = ℤ/2 ≠ 0`: flatness of every reduction `M/p^nM`, not only of `M/pM`, is
  needed in the converse. For `M = ℤ/4` itself every hypothesis holds, and `M ⊗ A[2] → M[2]` sends
  `1 ⊗ 2` to `2`, an isomorphism `ℤ/2 ≅ 2ℤ/4`.

### 1.9 Complete faithful-flat module descent

Let `A → B` be a p-completely faithfully flat map of ordinary p-complete rings with bounded p-power
torsion. For derived p-complete `M`, the augmentation `M → Tot((M ⊗^L_A B•)^∧_p)` is an equivalence,
where `B•` is the p-completed Čech nerve and `Tot` is the product totalization of the cosimplicial
complex. Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base
change. These statements concern Čech descent; hyperdescent is not asserted.

[BMS19], Theorem 3.1 with assertion (1) of its proof and Remark 3.2, pp.217–218; Lemmas 4.4 and
4.5(2), pp.220–221; Corollary 4.8(3) and Remark 4.9, p.223.

*Needs:* §1.3 (The derived completion reflector); §1.7 (Complete flatness and complete faithful flatness); §1.8 (Bounded torsion and complete Tor-amplitude); §1.1 (Derived limits of towers);
Tau Ceti `TauCeti.ComplexTower` (Milnor sequences).

**Checks.**

- For the identity faithfully flat map the completed Čech totalization is `M`.
- For `ℤ_p → ℤ_p × ℤ_p`, the Čech complex splits and recovers every derived p-complete `M`.
- For `ℤ_p → F_p`, faithful ordinary reduction modulo p does not suffice: the nonzero `Tor₁^ℤ_p(F_p,F_p)` violates complete flatness.

### Examples

For a prime `p`, the multiplication-by-`p` tower has `H⁰(Rlim) = 0` and `H¹(Rlim) = ℤ_p/ℤ`. For
`I = 0` every complex is complete; for `I = (1)` only the zero derived object is complete.

### Dependencies

Layer 1, the Koszul complex of Layer 0, Tau Ceti's module towers, derived limit, derived Hom and
`Tor` of flat modules, AlgebraicTopology Stage 6 item 0 for the homotopy-square maps, Mathlib
derived categories, localization, `Tor`, flat base change, adic completeness, `p`-adic integers and
commutative algebras, and Tau Ceti Artin–Rees for the Noetherian comparison.

## Layer 4: perfect complexes, finite models and effectivity

### 1.E.0 Finite models and the effectivity interfaces

**Perfect module complexes and finite models.** Define `DerivedDeRham.IsPerfect A K` by the
existence of a bounded complex of finite projective left `A`-modules representing `K ∈ D(A)`,
for every associative unital ring `A`. This is the single ordinary-module predicate.
The elementary finite-model and closure API belongs here. Expose the same predicate under the
perfect-complex namespace used by the trace consumer.

For unital rings define `IsPseudoCoherent A K` by a bounded-above finite-free representative.
The bounded-above finite-projective formulation is equivalent, by successively adjoining
finite-projective complements. For a module `M` in degree zero, `IsPseudoCoherent A M[0]` holds
exactly when `M` has an infinite resolution by finite free modules, which is Tau Ceti's
`TauCeti.Huber.IsPseudoCoherentOver A M ⊤`; in one direction
`TauCeti.Huber.IsPseudoCoherentOver.exists_quasiIso_single₀` supplies the representing complex,
reindexed to nonpositive cohomological degrees ([StacksMA], Lemma 15.66.4(4), Tag 064T, p.162). Define Tor amplitude `[a, b]` for `K` over commutative `A` by vanishing of `H^i(K ⊗^L_A N[0])` for every `A`-module `N`
and `i ∉ [a, b]`. Provide invariance under isomorphisms, closure of perfect complexes under shifts
and the third vertex of distinguished triangles, and closure under retracts, for unital rings.
For commutative rings provide arbitrary derived scalar change and a finite Tor interval for
every perfect complex. A perfect complex is pseudo-coherent; it need not have
a bounded finite-free representative. For bounded-above finite-free complexes, supply
the finite-free base-change comparison: ordinary termwise scalar extension represents derived base change,
naturally in complex maps and in compositions of ring maps.
([StacksMA], Definition 15.76.1, Tag 0657; Lemmas 15.76.2 and 15.76.4, Tags 0658 and 066R;
Lemma 15.76.5, Tag 066S; Definition 15.66.1, Tag 064Q; §15.68, Tag 0651;
the general-ring closure laws follow from finite-projective representatives and their retracts.)

*Needs:* §0.2 (derived tensor and scalar extension); Mathlib `Module.Projective`, `Module.Free`,
`Module.Finite`, complexes and `DerivedCategory.Q`; Tau Ceti `TauCeti.Huber.IsPseudoCoherentOver`
with `TauCeti.Huber.IsPseudoCoherentOver.exists_quasiIso_single₀` for modules in degree zero.

*Lean:* `Suggested.lean` declares `DerivedDeRham.IsPerfect`,
`IsPseudoCoherent`, `IsFiniteFreeModel A P b` (finite freeness in every degree and vanishing above
`b`), `complexBaseChange` (Mathlib's termwise `ModuleCat.extendScalars` functor) and the closure
theorems `isPerfect_retract`, `isPerfect_shift`, `isPerfect_triangle` and
`isPerfect_isPseudoCoherent`.

**Checks.**

- Over any unital ring a finite projective left module in degree zero is perfect, as are its
  shifts and retracts. Over a commutative ring it has Tor amplitude `[0,0]`; its shift
  by `[1]` has amplitude `[−1,−1]`. The zero complex admits every Tor interval.
- Over `A = k × k`, the summand `eA`, `e = (1,0)`, is perfect. It has no bounded finite-free
  representative: its Euler ranks on the two components differ. The bounded-above free resolution
  with differentials alternating `1−e` and `e` does represent it.
- The perfect `ℤ`-complex `[ℤ --2→ ℤ]` in degrees `[−1,0]` base-changes to `[F₂ --0→ F₂]`;
  base change must retain the negative cohomology.

**Compatible finite-free models.** Let `A_(n+1) → A_n` be surjective maps of commutative rings
with locally nilpotent kernels. A compatible perfect system consists of perfect `M_n ∈ D(A_n)` and
specified isomorphisms `M_(n+1) ⊗^L_(A_(n+1)) A_n ≅ M_n`; their adjoints
are the given transition maps. For commutative rings the kernel
condition is equivalently that each of its elements is nilpotent; each finitely generated
subideal is then nilpotent. Construct compatible finite-free models: bounded-above complexes `P_n` of
finite free `A_n`-modules, all zero above one bound, isomorphisms `P_n ≅ M_n` in `D(A_n)`,
and isomorphisms of complexes `P_(n+1) ⊗_(A_(n+1)) A_n ≅ P_n` compatible with the specified
derived reductions. Their adjoints are actual semilinear chain maps representing the original
transitions. Include the perfect-input lifting theorem: for a surjection `R → S` with locally
nilpotent kernel, a perfect `K ∈ D(R)` and any bounded-above finite-free representative `E` of
`K ⊗^L_R S`, lift `E`, together with its specified derived identification, to such a representative
over `R`. Finite stably free lifting applies because `1 + ker(R → S)` consists of units.
The lifts can be equipped with compatible bases in each degree, of the ranks of `P_0`.
([StacksMA], Lemma 15.77.5, Tag 0BCB; the all-perfect specialization of Lemma 15.99.1 and its
proof, Tag 0CQF.)

*Needs:* §1.E.0 / Perfect module complexes and finite models; Mathlib's finite free modules,
Nakayama's lemma, module scalar extension and complexes.

**Checks.**

- Constant rings and a constant bounded finite-free complex admit identical models and identity
  reduction isomorphisms, including the zero complex.
- For constant `A = k × k` and `M_n = eA`, the alternating free resolution above gives compatible
  bounded-above models. Requiring bounded finite-free models would exclude this perfect system.
- Over `A_n = k[t]/(t^(n+1))`, the complexes `[A_n --t→ A_n]` themselves are models with a common
  bound and strict reduction isomorphisms. Replacing them by their cohomology modules loses this
  compatibility of differentials.

**Strict towers and finite-model limits.** For a surjective ring tower with locally nilpotent
transition kernels, `A = lim A_n` and a compatible finite-free model, restrict its semilinear chain maps along the compatible projections `π_n : A → A_n` to form a
strict tower of `A`-complexes. Its image belongs to
`DerivedCategory (ℕᵒᵖ ⥤ ModuleCat A)`. Evaluation gives the original restricted `M_n`, with
commuting transition squares in `D(A)`. This is a chosen derived-diagram lift; a tower of objects
in `D(A)` is not identified with the derived category of strict towers.

Construct the termwise limit complex. Compatible bases identify each
term with a finite free `A`-module of the corresponding rank at stage zero. The complex is bounded
above, and its ordinary reductions are isomorphic as complexes to `P_n`, compatibly with the
projections and transition maps. Thus it is pseudo-coherent and computes its derived reductions.
Prove the limit comparison: §1.1's derived limit of this strict tower is represented
by the termwise limit, and its fibre triangle for `1−shift` identifies these projections.
Prove the reduction comparison and the model identification with these identifications.

Replacement comparisons and naturality are in the derived category of varying-ring diagrams
`D(Mod(ℕ,(A_n)))`, followed by restriction to the derived category of strict `A`-towers.
Use Mathlib's `PresheafOfModules` for the ring presheaf on `ℕ` defined by `(A_n)`; construct
the induced derived evaluation and restriction functors from its semilinear module diagrams.
A morphism there induces the corresponding maps on derived limits, reductions and fibre triangles; an isomorphism there
induces isomorphisms of these data. For replacements use zigzags of levelwise quasi-isomorphisms
of strict diagrams. A bare family of commuting squares in the categories `D(A_n)` does not specify
such a derived-diagram morphism. For perfect systems the compatible finite-free models supply
the lift of Tag 091I. No canonical functor on naive towers in `D(A)` is asserted.
([StacksMA], Lemmas 15.89.1 and 15.89.5, Tags 091D and 091I; Remark 15.89.10, Tag 091J;
Lemma 15.99.1 and its proof, Tag 0CQF.)

*Needs:* §1.E.0 / Compatible finite-free models; §1.1 (derived limits on strict towers);
Mathlib's module diagram categories, complexes, localization and ring inverse limits.

*Lean:* `Suggested.lean` declares `DerivedDeRham.IsRingTowerLimit`, the universal property of the
specified ring projections.

**Checks.**

- On a constant strict tower with identity maps, evaluation of the termwise limit is the identity
  of its complex; the fibre description gives the same projections.
- For `A_n = k[t]/(t^(n+1))` and `P_n = A_n[0]`, compatible bases give the limit `k[[t]][0]`,
  with its actual quotient projections.
- Adding a compatible contractible finite-free disk to each model gives an isomorphism of
  derived diagrams, and hence the same limit and derived reductions. The disk need not have
  zero terms, so comparisons are not equalities of chosen complexes.

**Residue-field Tor criterion for the limit.** For a pseudo-coherent `K ∈ D(A)`, prove that a
uniform interval `[a,b]` containing the cohomology of `K ⊗^L_A κ(m)` for every maximal ideal `m`
implies that `K` has a finite-projective representative supported in `[a,b]`. In a surjective ring
tower with locally nilpotent transition kernels, prove `ringTowerLimit_jacobson`: an element of
`A = lim A_n` whose image in `A_0` is a unit is a unit. Hence `ker(A → A_0)` is in the Jacobson
radical and every residue field of `A` factors through `A_0`. The reduction comparison above and
a Tor interval for the perfect `M_0` give the required uniform interval for the limit.
([StacksMA], Lemmas 15.79.2 and 15.76.2, Tags 068V and 0658; proof of Lemma 15.99.3, Tag 0CQG.)

*Needs:* §1.E.0 / Perfect module complexes and finite models; §1.E.0 / Strict towers and finite-model
limits; Mathlib's Jacobson radical, residue fields and nilpotent elements.

*Lean:* `Suggested.lean` declares `DerivedDeRham.pseudoCoherent_residueCriterion`, stated on a
bounded-above finite-free model `P` of `K`, whose residue fibres are the termwise reductions
`P ⊗_A κ(m)`, and `ringTowerLimit_jacobson`.

**Checks.**

- A bounded finite-projective complex supported in `[a,b]` satisfies this residue-field criterion
  and is recovered with that same support bound.
- For `A = k[ε]/(ε²)`, the module `k` is pseudo-coherent, as is every finite module over a
  Noetherian ring (`TauCeti.Huber.IsPseudoCoherentOver.of_isNoetherianRing`; [StacksMA],
  Lemma 15.66.17(3), Tag 066E), but its derived tensor with the residue field has nonzero
  cohomology in every nonpositive degree. It has no finite Tor interval.
- For `[k[[t]] --t→ k[[t]]]`, the residue fibre is `[k --0→ k]` in `[−1,0]`; the criterion keeps
  degree `−1` even though the original complex has zero `H^−1`.

### 1.E.1 Effectivity of compatible perfect systems

Prove effectivity of compatible perfect systems. Let `A = lim A_n` for an inverse sequence of rings with
surjective transitions `A_(n+1) → A_n` whose kernels are locally nilpotent. Let `M_n` be perfect
complexes in `D(A_n)`, with maps `M_(n+1) → M_n` in `D(A_(n+1))` inducing the specified
isomorphisms `M_(n+1) ⊗^L_(A_(n+1)) A_n → M_n`. For any compatible finite-free lift from §1.E.0,
restrict its strict tower along `A → A_n` and form `M = Rlim M_n` in `D(A)`. Then `M` is perfect,
and the canonical maps `M ⊗^L_A A_n → M_n` are isomorphisms for all `n`. Its projections and
comparison maps retain the transition maps of the given tower.

Here every M_n is perfect; ordinary tensor compatibility of cohomology modules does not replace derived compatibility. Locally nilpotent transition kernels need not be nilpotent.

([Stacks](https://stacks.math.columbia.edu/tag/0CQG), Lemma 15.99.3, the alternative with every finite-stage complex perfect.)

*Needs:* §0.2 (derived module categories and derived tensor); §1.1 (derived limits);
§1.E.0 (perfect complexes, compatible finite-free models, strict-tower limit and reduction
comparisons, and the residue-field Tor criterion). Downstream consumers use this ring-complex
effectivity theorem for proper-support existence.

Choose the compatible finite-free models of §1.E.0, and apply §1.1 to their restricted strict
tower, with its exact products and fibre of `1−shift`. The termwise finite-free limit computes
this object and its derived reductions. Since the kernel of `A → A_0` is in the Jacobson radical,
the Tor interval of `M_0` bounds all residue fibres of the limit. The residue-field criterion
then gives a bounded finite-projective representative. The theorem holds for every such chosen
model; its comparisons are natural for morphisms in the derived-diagram category specified in
§1.E.0. They retain the given transition maps.

**Checks.**

- a constant ring and perfect complex with identity transitions are recovered by their derived limit.
- for `A_n = k[t]/(t^n)` and `M_n = A_n` in degree zero, the limit is `k[[t]]` in degree zero and
  its derived reductions recover `M_n`.
- for a field `k`, `n ≥ 1`, `A_n = k[t]/(t^n)` and
  `M_n = [A_n --t→ A_n]` in `[−1,0]`, the limit is `[k[[t]] --t→ k[[t]]]` and its derived
  reductions are `M_n`. Here `H^−1(M_n) = (t^(n−1)) ≅ k`, with zero transition maps, whereas
  `H^−1(M) = 0`. In particular `H^−1(M) ⊗ A_n = 0` does not recover `H^−1(M_n)`;
  derived reduction of the whole complex does.
- let `B = k[x₁, x₂, …]/(x_i² : i ≥ 1)` and `I = (x₁, x₂, …)`. `I` is locally nilpotent but
  `I^r ≠ 0` for every `r`. The tower `A₁ = B/I = k`, `A_n = B` for `n ≥ 2`, with `M_n = A_n`,
  satisfies the hypotheses and has limit `B`; globally nilpotent kernels would exclude it.

### Examples

For a prime `p`, the compatible rank-one models over `ℤ/pⁿ` give `ℤ_p[0]`. The resolution
`[ℤ →p ℤ]` is perfect with residue `Tor` in degrees `−1` and `0`.

### Dependencies

Layers 1 and 3; Mathlib finite free and projective modules, Nakayama's lemma, scalar extension,
Jacobson radicals, nilpotent elements, ring inverse limits and derived categories; Tau Ceti
pseudo-coherent modules and their resolving complexes.

## Layer 5: Matlis duality

### 1.M.1 Matlis duality for arithmetic coefficients

**Matlis duality for arithmetic coefficients.** Let `R` be a complete Noetherian local ring with
maximal ideal `𝔪` and finite residue field `k`, and fix an injective hull `E_R(k)` of `k`: an
injective `R`-module containing `k` as an essential submodule (an arbitrary injective module
containing `k` does not give biduality). The functor `D(M) = Hom_R(M, E_R(k))` is contravariant and
exact; it exchanges finitely generated `R`-modules with Artinian (cofinite-type) `R`-modules, and
the evaluation map `M → D(D(M))` is an isomorphism for `M` in either class. Finitely generated
modules carry their `𝔪`-adic topology and cofinite-type modules the discrete topology. For a module
with a continuous action of a group `G`, `D(M)` carries the contragredient action
`(gφ)(m) = φ(g⁻¹m)`, and evaluation, reduction modulo `𝔪ⁿ` and passage to inverse and direct limits
are `G`-equivariant. Applied termwise, `D` gives Matlis duality on complexes, and the biduality map
is a quasi-isomorphism for complexes whose cohomology is of finite type or of cofinite type.
Outside these classes, evaluation biduality can fail, as in the infinite-dimensional field Check.
The module biduality is stated in `Suggested.lean` in §1.M.2 for an arbitrary residue field; the
finite-residue-field case here is its specialisation.
Downstream consumers construct the comparison with normalized dualizing complexes and local cohomology.

*Proof sketch.* The module-level inputs are at the pinned Tau Ceti: an essential injective hull of
`k` inside any injective module containing it (`TauCeti.exists_isInjectiveEnvelope_submodule`), the
residue-field duality `D(k) ≅ k` (`TauCeti.residueFieldLinearMapEquiv`), injectivity of evaluation
`M → D(D(M))` for every module `M` (`TauCeti.injective_applyₗ_of_injective`), preservation of length
by `D` (`TauCeti.IsInjectiveEnvelope.length_linearMap`) and biduality for modules of finite length
(`TauCeti.IsInjectiveEnvelope.bijective_applyₗ`). Exactness of `D` is injectivity of `E_R(k)`.
Completeness of `R` and the compatible reductions modulo `𝔪ⁿ` give the anti-equivalence between
finite-type and cofinite-type modules and its equivariant form, and termwise application gives the
complex form. ([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf),
§§2.2–2.3, pp. 51–53; §3.1, pp. 75–76.) *Needs:* Tau Ceti
`TauCeti.exists_isInjectiveEnvelope_submodule`, `TauCeti.residueFieldLinearMapEquiv`,
`TauCeti.injective_applyₗ_of_injective`, `TauCeti.IsInjectiveEnvelope.length_linearMap` and
`TauCeti.IsInjectiveEnvelope.bijective_applyₗ`; Mathlib `DerivedCategory`; Mathlib `CategoryTheory.IsGrothendieckAbelian.enoughInjectives`.

**Checks.**

- For `R = ℤ_p`, `E_R(k) = ℚ_p/ℤ_p`, `D(ℤ_p^r) = (ℚ_p/ℤ_p)^r` and `D((ℚ_p/ℤ_p)^r) = ℤ_p^r`: a
  lattice is dual to a cofinite-type module and conversely.
  The supporting lemma is that, for a DVR `A` complete for its maximal ideal and fraction field
  `K`, every `A`-linear map `f : K → K/A` has the form `f(x) = cx mod A` for a unique `c ∈ K`.
  For a uniformizer `ϖ`, choose lifts `b_n ∈ K` of `f(ϖ⁻ⁿ)`; linearity gives
  `ϖb_(n+1) − b_n ∈ A`, so the successive differences of `ϖⁿb_n` lie in `ϖⁿA`.
  Completeness sums these differences to an element `c ∈ b_0 + A` with
  `c − ϖⁿb_n ∈ ϖⁿA`, which gives the formula on every `aϖ⁻ⁿ ∈ K`.
  Uniqueness follows because `(c − c′)K ⊆ A` forces `c = c′`.
  Applying this to an endomorphism of `K/A` composed with `K → K/A` gives `cA ⊆ A`,
  hence `c ∈ A`; multiplication therefore identifies `D(K/A) ≅ A`, and additivity on
  finite sums gives `D((K/A)^r) ≅ A^r`, with `D = Hom_A(−, K/A)`.
  Specializing to `A = ℤ_p`, `K = ℚ_p` gives the asserted dual of the cofinite-type module.
  Completeness is essential: for a non-complete DVR `R` with fraction field `K`, the
  endomorphism ring of `K/R` is `R̂`, as in §1.M.2 (Stacks, Lemma 47.7.5, tag 08Z6).
- For `R = ℤ_p` and `E = ℚ_p/ℤ_p`, the module `R ⊕ E` is neither finite nor Artinian, but
  `D(R ⊕ E) ≅ E ⊕ R` and evaluation is an isomorphism, by additivity of `D` on finite sums.
- `D(k) = Hom_R(k, E_R(k)) = k` (the socle of `E_R(k)`; `TauCeti.residueFieldLinearMapEquiv`), and
  `k → D(D(k))` is an isomorphism; by induction on length every module of finite length is
  canonically bidual. An injective module containing `k` but larger than its hull, such as
  `E_R(k) ⊕ E_R(k)`, has `Hom_R(k, −) = k²`, so `D(k)` would have length two.
- For `R = k` (so `E_R(k) = k`) and `M = ⊕_ℕ k`, which is neither finitely generated nor Artinian,
  `D(M) = ∏_ℕ k` and `M → D(D(M))` is injective (as for every module, by
  `TauCeti.injective_applyₗ_of_injective`) but not surjective.

### 1.M.2 Matlis duality and completion inputs

**Matlis duality and completion inputs.** For a Noetherian local ring with arbitrary residue
field, Tau Ceti formalises an injective hull `E` of `κ`, obtained by maximal essential extensions
inside injective modules (`TauCeti.exists_isInjectiveEnvelope`, unique by
`TauCeti.IsInjectiveEnvelope` and its uniqueness API), the canonical `R̂`-action on every module
whose elements are killed by powers of `𝔪`, in particular on `E`
(`TauCeti.AdicCompletion.torsionModule`), injectivity of evaluation `M → Hom_R(Hom_R(M, E), E)`
for every module (`TauCeti.injective_applyₗ_of_injective`), preservation of length by Matlis
duality (`TauCeti.IsInjectiveEnvelope.length_linearMap`), evaluation biduality for modules of
finite length (`TauCeti.IsInjectiveEnvelope.bijective_applyₗ`), and the criterion that a module whose Matlis dual
is finite over `R̂` is Artinian, with no torsion hypothesis on the module
(`TauCeti.IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap`). Construct the exact
duality between Artinian `R`-modules and finite `R̂`-modules and prove evaluation biduality on both
classes. Construct the completion adjunction
`Hom_{R̂}(N̂,E) ≅ Hom_R(N,E)` for finite `N`, using
`AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` for `N̂ ≅ R̂ ⊗_R N`.
§1.M.1 gives the complete finite-residue-field case; this target
constructs the general residue-field and completion inputs. `Suggested.lean` declares
`Matlis.biduality_of_finite` and `Matlis.biduality_of_artinian`: for `R` Noetherian local and
complete for its maximal ideal, an injective envelope `e : κ → E` in the sense of
`TauCeti.IsInjectiveEnvelope`, and `M` finite, respectively Artinian, the dual `Hom_R(M, E)` is
Artinian, respectively finite, and evaluation `M → Hom_R(Hom_R(M, E), E)` is bijective; no
finiteness of the residue field is assumed (Stacks, Proposition 47.7.8, tag 08Z9; §47.7, tag 08Z1,
especially Remark 47.7.9.) The injectivity half of both bijections is
`TauCeti.injective_applyₗ_of_injective`; the content of the two headlines is surjectivity and the
finiteness, respectively Artinian, property of the dual. *Needs:* Mathlib enough injectives in `ModuleCat`, `AdicCompletion`;
Tau Ceti `TauCeti.Algebra.Module.Injective.Envelope.Basic`, `TauCeti.exists_isInjectiveEnvelope`,
`TauCeti.AdicCompletion.torsionModule`, `TauCeti.injective_applyₗ_of_injective`,
`TauCeti.IsInjectiveEnvelope.length_linearMap`, `TauCeti.IsInjectiveEnvelope.bijective_applyₗ` and
`TauCeti.IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap`; §1.M.1
(*Matlis duality for arithmetic coefficients*, the complete finite-residue-field case).

**Checks.**

- For `R = k` with `k = ℚ`, `E = k` and biduality holds for finite-dimensional vector spaces;
  finiteness of the residue field is unnecessary.
- For `R = k[x]_{(x)}`, `E = k(x)/R` has the canonical `k⟦x⟧`-action: on an element killed
  by `xⁿ`, only the class of a power series modulo `xⁿ` matters.
- For that DVR, `D(E) = R̂` and `Hom_{R̂}(R̂,E) = E`; algebraic `Hom_R(R̂,E)` is larger,
  so the adjunction uses completion-linear Hom.

### Examples

For a field `k`, the hull is `k` and finite-dimensional double duality is evaluation. For a complete
discrete valuation ring `O` that is not a field, with fraction field `K`, the hull is `K/O` and its
dual is `O`.

### Dependencies

Mathlib module Hom, Noetherian and Artinian modules, adic completion, enough injectives and derived
categories; Tau Ceti essential injective envelopes, their existence, the completion action on
torsion modules, residue-field duality, injectivity of evaluation into the double dual,
preservation of length, finite-length biduality and the Artinian criterion.

## Downstream consumers

The downstream consumers are EnhancedDerivedSheaves, EtaleCohomologyFoundations, PadicPeriodRings,
DerivedDeRhamCohomology, CrystallineCohomology, PerfectoidSpaces, ArithmeticGaloisDuality,
IntegralHeckeAndGaloisDeterminants, AlgebraicModuliForArithmeticGeometry,
DeformationAndDerivedPatchingAlgebraPartII, ClassicalAdicEtaleCohomology,
ArithmeticLocallySymmetricSpaces and KhovanovHomology. Sheaf enhancement,
point-site identification and the affine/Spec comparison use the scope contracts above. Arithmetic
cochains, determinants, crystalline sites and period rings use these general module constructions.

## References

Source locators above use the cited edition’s page numbering. Stacks tags identify the statements
independently of chapter numbering; the chapter PDFs use chapter-local pages. [BMS19] uses published
IHÉS pages and [SAG] the February 2018 edition. Integral powers use
the author corrections [IllusieI] and [IllusieII].

- **AffineCrystalline**: Marco D'Addezio, *Affine crystalline cohomology and de Rham cohomology in
  Lean 4*. Version 1.0.0, https://github.com/daddeziomath/affine-crystalline, DOI
  10.5281/zenodo.23573534. Lean 4 formalisation built on Mathlib, Apache-2.0.
- **BL22**: Bhargav Bhatt and Jacob Lurie, *Absolute prismatic cohomology*. arXiv:2201.06120v1.
- **BMS19**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and
  integral p-adic Hodge theory*. Publ. Math. IHÉS 129 (2019), 199–310.
- **Bhatt12**: Bhargav Bhatt, *p-adic derived de Rham cohomology*. arXiv:1204.6560v1, 30 April 2012.
- **DM**: Bjørn Ian Dundas and Matthew Morrow, *Finite generation and continuity of topological Hochschild
  and cyclic homology*. arXiv:1403.0534v1.
- **DoldPuppe**: Albrecht Dold and Dieter Puppe, *Homologie nicht-additiver Funktoren. Anwendungen*.
  Ann. Inst. Fourier 11 (1961), 201–312.
- **GR**: Ofer Gabber and Lorenzo Ramero, *Almost ring theory*. LNM 1800 (2003); arXiv:math/0201175v3.
- **IllusieCC**: Luc Illusie, *Complexe cotangent et déformations I*. LNM 239 (1971).
- **IllusieI**: Luc Illusie, *Errata: Complexe cotangent et déformations I*. Author erratum.
- **IllusieII**: Luc Illusie, *Errata: Complexe cotangent et déformations II*. Author erratum.
- **Prisms**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4.
- **SAG**: Jacob Lurie, *Spectral Algebraic Geometry*. Version of February 2018, §25.2.
- **StacksAlg**: The Stacks Project Authors, *Commutative Algebra* (Chapter 10).
- **StacksCt**: The Stacks Project Authors, *The Cotangent Complex* (Chapter 92).
- **StacksDefos**: The Stacks Project Authors, *Deformation Theory* (Chapter 91).
- **StacksMA**: The Stacks Project Authors, *More on Algebra* (Chapter 15).
- **StacksSimp**: The Stacks Project Authors, *Simplicial Methods* (Chapter 14).
- **StacksSites**: The Stacks Project Authors, *Cohomology on Sites* (Chapter 21), §21.35 *Internal hom in the derived category*.

[AffineCrystalline]: https://github.com/daddeziomath/affine-crystalline
[BL22]: https://arxiv.org/pdf/2201.06120v1
[BMS19]: https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf
[Bhatt12]: https://arxiv.org/pdf/1204.6560v1
[DM]: https://arxiv.org/pdf/1403.0534v1
[DoldPuppe]: http://www.numdam.org/item/AIF_1961__11__201_0/
[GR]: https://arxiv.org/abs/math/0201175
[IllusieCC]: https://doi.org/10.1007/BFb0059052
[IllusieI]: https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf
[IllusieII]: https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf
[Prisms]: https://arxiv.org/pdf/1905.08229v4
[SAG]: https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf
[StacksAlg]: https://stacks.math.columbia.edu/download/algebra.pdf
[StacksCt]: https://stacks.math.columbia.edu/download/cotangent.pdf
[StacksDefos]: https://stacks.math.columbia.edu/download/defos.pdf
[StacksMA]: https://stacks.math.columbia.edu/download/more-algebra.pdf
[StacksSimp]: https://stacks.math.columbia.edu/download/simplicial.pdf
[StacksSites]: https://stacks.math.columbia.edu/tag/08J7
