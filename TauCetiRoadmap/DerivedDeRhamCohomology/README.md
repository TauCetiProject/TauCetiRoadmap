# Roadmap: derived de Rham cohomology

**Summary.** This roadmap constructs the ordinary algebraic de Rham complex `DeRham.complex`
on Mathlib's Kähler and exterior-power carriers and derived de Rham cohomology with its Hodge
and conjugate filtrations. It develops André–Quillen criteria, filtered completion, divided powers
and PD envelopes, derived Cartier theory, quasisyntomic descent, proper smooth control and the
derived description of Fontaine's period rings `A_cris` and `B_dR⁺`. Its logarithmic period
calculation constructs the canonical comparison data and identifies Fontaine's map `ε ↦ log [ε]`.
The module cotangent, power and completion operations are supplied by DerivedModuleAlgebra.

Derived de Rham cohomology extends differential algebra to singular rings. Its cotangent and power
operations record relations that ordinary differential modules lose. In characteristic p the
conjugate filtration links these operations to Cartier theory; under precise flatness and
complete-intersection hypotheses the resulting complex recovers crystalline cohomology. Completion
and descent then make these constructions usable on p-adic formal schemes and in period
comparisons. The main sources are Bhatt's *p-adic derived de Rham cohomology* [Bhatt12],
Bhatt–Morrow–Scholze's *Topological Hochschild homology and integral p-adic Hodge theory* [BMS19],
the appendices of Bhatt–Lurie's *Absolute prismatic cohomology* [BL22], Koshikawa–Yao's
*Logarithmic prismatic cohomology II* [KY], the Stacks Project chapters on the cotangent complex and
derived completion, and Lurie's *Spectral Algebraic Geometry* §25.2 [SAG] for derived power
functors.

Every derived object of this roadmap has an explicit strict model: a simplicial polynomial resolution,
the alternating face complex of a simplicial module, the direct-sum or product totalization of a
bicomplex, a diagram of complexes indexed by `ℤᵒᵖ`, or an inverse limit of a tower of complexes.
Statements are made in Mathlib's `DerivedCategory` of the relevant abelian category. Affine
multiplicative structure is the strict commutative differential graded algebra structure of the model
(the shuffle product of 2.22). Global objects (Čech totalizations over schemes, formal schemes and
quasisyntomic sites, and crystalline cohomology) carry cup products instead: maps `K ⊗^L_A K → K` in
`D(A)`, with filtered versions in `DF(A)`, that are associative, unital and graded-commutative in the
derived category. This is the form of the ringed-site cup product ([StacksSites] §21.33, Lemmas
21.33.1–21.33.3; Tags 0FPK, 0FPL, 0FPM) used by CrystallineCohomology *Crystalline cup products*
(`Crystalline.crysCup_unit`, `Crystalline.crysCup_assoc`, `Crystalline.crysCup_graded_comm`). The
Alexander–Whitney product on the totalization of a cosimplicial commutative dg algebra is not strictly
commutative, so no strict global dg algebra is asserted; 5.8 states the adapter from the affine models
to the cup-product target. The [suggested Lean file](Suggested.lean) states the p-basis theorem,
Bhatt's flatness criteria, Ext in the category of complexes, canonical divided powers on an augmentation ideal,
and universal PD envelope existence and its regular-immersion presentation. Its module docstring
identifies the missing objects needed to state the derived, descent and period headline results;
every construction is specified by the owning roadmap.

## Scope and ownership

This roadmap owns André–Quillen homology and its local complete-intersection and regularity
criteria; algebraization, simplicial square-zero lifting and the adic perfect-system adapter;
filtered derived categories, completion, completed tensor products and the Beilinson t-structure;
divided powers, relative PD polynomial algebras, regular envelopes, their completions and `A_cris`;
the ordinary algebraic de Rham complex with its differential-symbol presentation, pullback and
universal property; derived de Rham with its Hodge and conjugate filtrations, completions and
base-linear sheaf realizations; derived Cartier theory, PD conjugate filtrations, quasisyntomic
sites and descent, period-ring descriptions and proper smooth control. Section 6.20 owns the shared
free-prelog, Gabber log cotangent and log derived de Rham constructors and their canonical period
specialization used by §6.21.

It uses, without restating:

- **DGAInfinity** Layer 1 for unital cochain DG algebras, DG algebra morphisms, tensor products
  and their Koszul signs; strict affine models use this carrier with the graded-commutativity
  and odd-square-zero predicates of 2.21.
- **EnhancedDerivedSheaves** §§0.1–0.3 for `ClassicalDerived.enhancedCategory`,
  `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom` and `ClassicalDerived.inverseLimits`
  on small ringed sites. EnhancedDerivedSheaves §E1.F3.H1 identifies module derived Hom with
  the point-site enhancement, and §E1.8.DMA.1 supplies the affine tensor comparison;
  §5.8 here supplies the base-linear sheaf and filtration adapters.
- **EnhancedDerivedSheaves** §E1.4 for `enhancedPullback` and `enhancedPushforward` on ringed topoi,
  used for the base-linear sheaf realization of §5.8.
- **PadicPeriodRings** §§1.1–1.5 for `padicComplexGaloisAction`, `padicComplex_fixed_eq`,
  `tate_H0_padicComplex_twist` and *The de Rham period rings* for finite extensions of `ℚ_p`.
  **PadicPeriodRings** §2 supplies `PadicFieldCompletion` and
  `tateSen_H0` for arbitrary perfect residue fields, and §4.1 `generalBasePeriodRings`
  supplies their period structures. Sections 5.11 and 5.14 identify these supplied interfaces with
  the period setup; §§5.12–5.15 supply the derived-de-Rham/PD-filtered `A_cris` comparison
  and its `Fil²` vanishing consequence. Its §3 `periodPDEnvelope` owns the ordinary principal
  envelope and completed carrier on `O_C`; §PD.7 identifies the general envelope with that
  carrier, and §5.13 identifies the two maps into its §4.1 de Rham period carrier.
- **DerivedModuleAlgebra** §1.T.1 / *lim and lim¹ of a tower*, *The six-term sequence of lim
  and lim¹*, *The Milnor sequence for towers of complexes* and *Mittag-Leffler towers have
  vanishing lim¹* for the tower calculations underlying DerivedModuleAlgebra §1.1.
- **DerivedModuleAlgebra** §§0.DP.2–0.DP.3 supplies the homogeneous divided-power grading,
  base change, augmentation and base-ideal intersection. Layer PD here supplies divided powers
  on generators and compatible sums, principal and flat extension, weighted filtrations,
  relative PD polynomial algebras, regular envelopes, their completions and `A_cris`.
- **PerfectoidSpaces** for integral perfectoid rings `IsIntegralPerfectoid` (§P1.24) and their
  comparison with perfectoid Tate rings (§P1.25), Fontaine's `θ` and its principal primitive kernel
  (§P1.17–§P1.18), perfectoid fields (§P1.10–§P1.11), and
  `isPerfectoidField_of_isAlgClosed` (§P3.7) for complete algebraically closed nontrivially valued
  fields of residue characteristic `p`. Its §P4.15.1
  `semiperfectoidFiniteIdealDescent` supplies module models over simplicial bases for 1.11.1,
  using DerivedModuleAlgebra §§0.1–0.4, 0.14 and 1.1–1.9.
- **SchemeAndStackFoundations** for the derived categories of quasi-coherent complexes on schemes
  (§2.18), used for cotangent powers and Hodge graded pieces, Néron–Popescu desingularization (§0.15)
  and the formal spectrum of an adic ring with its
  adic thickening systems (§4.7).
- **DerivedModuleAlgebra** for the Koszul complex of a finite sequence with its tensor
  formula and regular-sequence resolution (§0.K.1) and for the homogeneous pieces `Γ^d` of Mathlib's
  divided power algebra with their base change (§0.DP.2).
- **EnhancedDerivedSheaves** §E1.9 (`perfect_proper_pushforward`) for perfectness and
  arbitrary base change of proper finitely presented pushforward of target-flat finitely presented
  modules, and DerivedModuleAlgebra §1.E.1
  `perfectInverseSystemEffectivity` for compatible perfect systems; 1.13 supplies its adic adapter.
- Mathlib and Tau Ceti for the carriers listed under *Exact supplier contracts*.

Boundaries with neighbouring roadmaps:

- DerivedModuleAlgebra §§0.1–0.17, 0.25 and 1.1–1.9 owns module derived tensor, the full
  cotangent complex `Algebra.CotangentComplex`, its square-zero obstruction class, integral
  derived powers, module limits, ideal completion and complete flatness. SchemeAndStackFoundations
  §4.6 uses that full cotangent API alongside its naive cotangent complex. PerfectoidSpaces
  §§P0.19–P0.24 uses the same API for its almost and semiperfectoid specializations.
- CrystallineCohomology §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.5, CR.DDR.5.8–CR.DDR.5.10,
  CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 and CR.DDR.6.1–CR.DDR.6.20 owns crystalline
  comparisons, derived de Rham–Witt theory and logarithmic applications of the shared constructors
  of §6.20, including derivation and extension classifiers, log crystalline comparison and log descent.
  It consumes the de Rham, Cartier, descent and PD algebra here, including the raw lci scheme
  interface of §5.8.1. The restricted period-envelope calculation of §5.12 and the logarithmic
  period adapter of §6.20 are owned here. CrystallineCohomology §§CR.DDR.6.1–CR.DDR.6.2,
  CR.DDR.6.4–CR.DDR.6.5, CR.DDR.6.7 and CR.DDR.6.9–CR.DDR.6.10 use §6.20's public
  constructors and exported laws; their additional general crystalline and logarithmic results
  remain in CrystallineCohomology.
- DifferentialGeometry, Layers 0–6, constructs differential forms on smooth real manifolds; Layer 2
  here constructs algebraic Kähler forms over arbitrary commutative rings. AlgebraicVectorBundles,
  Layer 0, supplies ordinary sheaf tensor, dual and exterior operations; the derived cotangent powers
  here retain negative cohomology and integral divided-power behaviour.
- The Rees algebra of an ideal, `TauCeti.RingTheory.ReesAlgebra.Grading`, is a graded algebra
  attached to an ideal; the Rees description of 1.14 is an equivalence of filtered and graded
  derived categories for arbitrary filtrations, with derived quotient by `t`.
- Prismatic cohomology, `A_inf`-cohomology, Breuil–Kisin modules, the rational period rings beyond
  `B_dR⁺` and `B_dR`, and comparison theorems with étale cohomology are outside this roadmap; they
  are built on it.

## Conventions

Rings are commutative and unital. Unless stated otherwise `A → B` is a map of ordinary rings; a map of
simplicial commutative rings is a map in `SimplicialObject CommRingCat`. In ordinary differential
algebra, `A → B` is a specified algebra structure, `Ω¹` means `KaehlerDifferential A B`, and `Ωⁿ` means
`exteriorPower B n (KaehlerDifferential A B)` (Mathlib's `ExteriorAlgebra.exteriorPower`). Wedge
products use the existing exterior-algebra grading. The differential is **A-linear**. The modules of
forms are `B`-modules, but the de Rham complex is a complex of `A`-modules: its differential generally
fails `B`-linearity. Base-change tensors of that complex use the base ring.

Complexes use cohomological degrees. A simplicial degree `n` contributes cohomological degree `−n`
through the alternating face complex; a connective complex has nonpositive cohomology. For a module
`N` in degree zero, `N[1]` lies in degree `−1`. Derived exterior powers are unshifted power functors.
The de Rham weight shift is written separately: `gr_H^i dR` and `gr_i^conj dR` involve `L∧^i L[−i]`.
Thus the shifted conormal of a regular quotient produces divided powers in degree zero after the
shifts cancel.

`D(A)` is Mathlib's `DerivedCategory (ModuleCat A)` with its standard `HasDerivedCategory` instance.
`M ⊗^L_A N` is the derived tensor product of DerivedModuleAlgebra §0.2, computed by the termwise
tensor product of a K-flat representative with any representative. Cotangent models
(DerivedModuleAlgebra §0.4) are bounded-above complexes of free modules, hence K-flat. De Rham
models are in general unbounded above: for `F_p[x_1, x_2, …]` over `F_p` the cohomology is nonzero
in every degree `≥ 0`. Their K-flatness is proved separately: the polynomial de Rham complex in
finitely many variables is a bounded complex of free modules, arbitrary polynomial algebras are
filtered colimits of these (2.20), and realizations of K-flat columns are K-flat
(DerivedModuleAlgebra §0.2, 2.22). Termwise flatness of an unbounded complex is never used in place
of K-flatness. Completed models (Hodge and p-completions, product totalizations) are not asserted to
be K-flat; a completed tensor is the completion of the derived tensor of uncompleted models. General
algebra pushouts are derived and are modelled by simplicial polynomial resolutions: `B ⊗^L_A C` is
the simplicial commutative ring `P• ⊗_A C` for a simplicial polynomial resolution `P• → B`. An
ordinary tensor computes it only under Tor independence. The naive two-term cotangent complex is a
truncation and cannot detect all negative cohomology of a non-lci quotient.

`dR` denotes the **direct-sum** totalization of the bicomplex of de Rham complexes of a polynomial
resolution. The decreasing Hodge filtration is `F_H^i`, with `gr_H^i = cofib(F_H^(i+1) → F_H^i)`.
Hodge completion is the derived inverse limit of the Hodge quotients and corresponds to product
totalization. Derived p-completion `Λ_p` is a different reflection, computed by a derived quotient
tower in its bounded-torsion range. Both completions are specified whenever both occur. Rational
uncompleted `dR` is the base ring; rational smooth ordinary de Rham cohomology is recovered by Hodge
completion. Nilpotent-p smooth comparison has its own hypotheses.

Tower limits use the module adapter of DerivedModuleAlgebra §1.1 and the facts supplied by
DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*, with the indexing and
scalar conventions of DerivedModuleAlgebra §1.1; their cohomology retains `lim¹` until its vanishing
hypothesis is verified.

Filtered objects are diagrams `F^(i+1) → F^i` of complexes indexed by `ℤᵒᵖ`; the filtered derived
category is `DF(A) = DerivedCategory (ℤᵒᵖ ⥤ ModuleCat A)` (Bhatt, Remark 2.4, p.5, for the
increasing case). The conjugate filtration is increasing, starts with `Fil_−1 = 0`, and has
`gr_i = cofib(Fil_(i−1) → Fil_i)`. Its affine uncompleted exhaustiveness does not give unconditional
convergence after a global totalization or completion. Every spectral-sequence or
colimit/totalization exchange below retains its connectivity, finite-contribution or derived-limit
condition. Complete filtered objects use completed Day convolution, not tensor products of
equal-index levels.

Complete flatness is a derived-reduction condition; completeness of the object is a separate
assumption. Flatness, faithful flatness, projectivity, finite projectivity, perfectness and almost
perfectness are used in their respective ranges. Tor amplitude alone supplies no finiteness. A
proper smooth perfect-complex result supplies no finite-projectivity statement for its individual
cohomology modules.

A sheaf condition on a category of rings is a Čech condition on strict models: a functor `F` from
rings to complexes (or to filtered complexes) satisfies descent for a cover `A → S` when
`F(A) → Tot(F(S•))` is a quasi-isomorphism, where `S•` is the (completed) Čech nerve and `Tot` is the
product totalization of the cosimplicial complex. Unfolding from a basis is defined by the same
totalization.

Log cotangent means **Gabber's** complex. The ordinary-log-differential and Olsson comparisons keep
the integral and log-smooth hypotheses. Homological log flatness is the homotopy-pushout criterion
and differs from Kato log flatness. General prelog QSyn and QRSP objects need not have integral
monoids; integrality and Cartier type enter explicitly in the smooth and crystalline applications.
Logification of cotangent complexes and invariance of uncompleted log de Rham cohomology have
different ranges.

Lean names below are the intended Tau Ceti declarations. `DeRham.*` names live in the ordinary
de Rham namespace, `DerivedDeRham.*` names in the derived namespace, and the cotangent complex is
`Algebra.CotangentComplex`, the name under which SchemeAndStackFoundations §4.6 and PerfectoidSpaces
§P0.19 cite it.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3`)

- Homological algebra: `DerivedCategory`, `DerivedCategory.Q`, `DerivedCategory.singleFunctor`,
  `DerivedCategory.homologyFunctor`, `HasDerivedCategory.standard`, `CochainComplex.of`,
  `HomologicalComplex`, the triangulated structure and t-structure of `DerivedCategory`,
  `CategoryTheory.Abelian.Ext`, and `CategoryTheory.Tor` for module categories. These are the
  carriers of every derived statement; DerivedModuleAlgebra §0.2 constructs the module derived tensor, and DerivedModuleAlgebra §1.1 constructs
  the module derived limit using the DerivedModuleAlgebra §1.T.1 tower contracts below.
- Simplicial algebra: `CategoryTheory.SimplicialObject`, `CategoryTheory.SimplicialObject.Augmented`,
  `CategoryTheory.SimplicialObject.Augmented.ExtraDegeneracy`,
  `AlgebraicTopology.alternatingFaceMapComplex` and the Dold–Kan correspondence
  `AlgebraicTopology.DoldKan`.
- Differentials and cotangent truncations: `KaehlerDifferential`, `KaehlerDifferential.D`,
  `KaehlerDifferential.kerTotal`, `KaehlerDifferential.quotKerTotalEquiv`,
  `KaehlerDifferential.span_range_derivation`, `KaehlerDifferential.polynomialEquiv_D`,
  `KaehlerDifferential.mvPolynomialBasis`, `KaehlerDifferential.map`, `Derivation.leibniz`,
  `Derivation.leibniz_pow`, `Derivation.map_algebraMap`, `Derivation.map_one_eq_zero`,
  `derivationToSquareZeroEquivLift`, `Algebra.Extension.cotangentComplex`,
  `Algebra.Extension.toKaehler`, `Algebra.Extension.exact_cotangentComplex_toKaehler`,
  `Algebra.H1Cotangent`, `Algebra.Generators.equivH1Cotangent`.
- Exterior algebra: `ExteriorAlgebra`, `ExteriorAlgebra.exteriorPower` (notation `⋀[B]^n`),
  `exteriorPower.ιMulti`, `exteriorPower.ιMulti_span_of_span`, `exteriorPower.zeroEquiv`,
  `exteriorPower.oneEquiv`, `exteriorPower.presentation`, `exteriorPower.alternatingMapLinearEquiv`,
  `ExteriorAlgebra.gradedAlgebra`, `AlternatingMap.map_eq_zero_of_eq`, `AlternatingMap.map_swap`,
  `Finsupp.linearCombination`, `Submodule.liftQ`, `Module.Presentation.restrictScalars`.
- Commutative algebra: `IsAdicComplete`, `AdicCompletion`, `RingTheory.Sequence.IsRegular`,
  `RingTheory.Sequence.IsWeaklyRegular`, `Ideal.ofList`, `Module.Flat`, `Module.FaithfullyFlat`,
  `Algebra.Smooth`, `Localization.Away`, `LaurentPolynomial`, `MvPolynomial`, `Polynomial`.
- p-adic and perfectoid carriers: `PadicInt`, `Padic`, `ZMod`, `frobenius`, `WittVector`,
  `WittVector.teichmuller`, `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`,
  `WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta`, `fontaineThetaInvertP`,
  `BDeRhamPlus` (the `ker θ[1/p]`-adic completion of `𝕎(R♭)[1/p]`) and `BDeRham`; `A_inf(R)` means
  `WittVector p (PreTilt R p)`.
- Divided powers: `DividedPowers`, `DividedPowerAlgebra`, `DividedPowerAlgebra.dp`.
- Geometry: `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Smooth`,
  `AlgebraicGeometry.LocallyOfFinitePresentation`, `AlgebraicGeometry.Scheme.smallEtaleTopology`.
- Galois actions: `AlgEquiv` acting on rings of integers, and `Field.absoluteGaloisGroup`.

For the ordinary de Rham differential, consult [StacksDR], §10.132, pp.334–336, and [StacksExterior],
Lemma 10.13.4, p.28. [Riou] is an independent direct-presentation design for the same complex
proposed for Mathlib; follow its mathematical shape and adopt its API if Mathlib incorporates it.

### From Tau Ceti (pinned at `a91d3aa`)

- `KaehlerDifferential.mapSemilinear` and `KaehlerDifferential.mapSemilinear_D`
  (`TauCeti.RingTheory.Kaehler.MapSemilinear`): the weight-one semilinear pullback of Kähler
  differentials, extended to all exterior degrees in 2.13.
- `TauCeti.ArtinRees.exists_controlled_lift` (`TauCeti.RingTheory.Ideal.ArtinRees`): the ordinary
  Artin–Rees control used in DerivedModuleAlgebra §1.4's Noetherian completion comparison.
- `reesAlgebra.grade`, `reesAlgebra.gradedAlgebra`, `reesAlgebra.gradeZeroEquiv`
  (`TauCeti.RingTheory.ReesAlgebra.Grading`): the ideal Rees algebra, distinguished from 1.14.

### From TauCetiRoadmap roadmaps

| Supplier | Interface used here |
|---|---|
| [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) §§0.1–0.17, 0.25, 1.1–1.9 | Simplicial polynomial resolutions, K-flat module derived tensor, the cotangent complex and its deformation theory, integral derived powers, module derived limits, ideal completion, Koszul completion towers, complete flatness and module descent. |
| EnhancedDerivedSheaves §§E1.F3.H1, E1.8.DMA.1 | Point-site derived-Hom comparison and ordinary affine comparison of module derived tensor. |
| [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) §§0.1–0.3 | `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements` and `ClassicalDerived.tensorHom` supply unbounded localization, K-injective/K-flat replacements and tensor–Hom adjunction on small ringed sites. Section 5.8 uses `ClassicalDerived.inverseLimits` for sheaf towers, retaining derived products. EnhancedDerivedSheaves §E1.F3.H1 supplies the point-site derived-Hom comparison, and §E1.8.DMA.1 supplies affine tensor comparison. |
| [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) §E1.4 | `enhancedPullback` and `enhancedPushforward` supply ringed inverse/direct image, adjunction and composition. Section 5.8 transports these to the base coefficient sheaf and its filtered diagrams. |
| [PadicPeriodRings](../PadicPeriodRings/README.md) §§1.1–1.5 | For finite `K/ℚ_p`, `padicComplexGaloisAction`, `padicComplex_fixed_eq`, `tate_H0_padicComplex_twist` and *The de Rham period rings*: the continuous Galois action, fixed field and nonzero-twist invariants, and the `BDeRhamPlus`/`BDeRham` DVR, residue and graded-twist structure. Sections 5.11, 5.14 and 5.15 use these on their finite-local-field domain and compare their structures with the derived/PD-filtered `A_cris` description of §§5.12–5.13. |
| [PadicPeriodRings](../PadicPeriodRings/README.md) §2, §4.1 | `PadicFieldCompletion` and `tateSen_H0` supply the completion of the algebraic closure, its continuous action and Tate-twist invariants for complete discretely valued characteristic-zero fields with arbitrary perfect residue field. `generalBasePeriodRings` supplies the period structures and their agreement with its specializations to finite extensions `K/ℚ_p`. Sections 5.11 and 5.14 identify these with Mathlib's period carriers; §5.15 derives the `Fil² A_cris` vanishing from these inputs and §§5.12–5.14. |
| [PadicPeriodRings](../PadicPeriodRings/README.md) §3 | `periodPDEnvelope`: the ordinary principal envelope on `O_C`, its presentation in `A_inf[1/p]`, p-adic completion, initial properties, `θ_cris`, logarithm and functorial maps. Section PD.7 identifies its general envelope specialization with these supplied objects and maps; §5.13 identifies the derived period map with the supplied §4.1 map. |
| [DGAInfinity](../DGAInfinity/README.md) Layer 1 | Unital cochain DG algebras, DG morphisms, tensor products, units and Koszul signs. Section 2.21 defines strict graded commutativity and odd-square-zero conditions on this carrier; §§2.22 and 2.27 use its strict affine models. |
| [PerfectoidSpaces](../PerfectoidSpaces/README.md) §P4.15.1 | `semiperfectoidFiniteIdealDescent` supplies derived module models over simplicial commutative bases, their derived tensors, mapping complexes and compatible Koszul systems. Section 1.11.1 uses this adapter for connective square-zero kernels. Its module inputs are DerivedModuleAlgebra §§0.1–0.4, 0.14 and 1.1–1.9. |
| [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) §1.E.1 | `perfectInverseSystemEffectivity`: compatible perfect complexes over a surjective ring tower with locally nilpotent kernels have a perfect derived limit with the specified derived reductions (Stacks Tag 0CQG). Section 1.13 derives finite-stage perfectness from `K₁` by nilpotent lifting and adds derived completeness and pseudo-coherence. |
| [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) §1.T.1 / *lim and lim¹ of a tower*, *Mittag-Leffler towers*, *Mittag-Leffler towers have vanishing lim¹*, *The six-term sequence of lim and lim¹*, *The Milnor sequence for towers of complexes* | `CompactCoefficients.Tower.lim` and `CompactCoefficients.Tower.limOne` are the kernel and cokernel of `Tower.shift` on `ℕ`-indexed abelian-group towers; the six-term sequence is natural for levelwise short exact sequences, and Milnor applies to degreewise-surjective cochain-complex towers. Mittag-Leffler means eventual stabilization of transition images and kills `lim¹`; surjective or finite group towers satisfy it. DerivedModuleAlgebra §1.1 retains the induced module action and constructs the module derived-limit functor. |
| [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) §0.DP.3 | The divided power algebra `Γ_A(M)`, its augmentation, its augmentation ideal and its intersection with a base ideal. |
| DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.5 | Divided powers from identities on generators, gluing and extension, the divided power filtration, canonical powers on `(p)` including `p = 2`, and relative PD polynomial algebras. |
| DerivedDeRhamCohomology §PD.6 | Divided power envelopes relative to a PD base with their filtered universal maps, envelopes of regular immersions, flat base change, and completed envelopes; in particular the explicit regular envelopes, tensor discreteness, flatness and reduction of [Bhatt12], Lemmas 3.37–3.38, pp.16–17. |
| DerivedDeRhamCohomology §PD.7; [PadicPeriodRings](../PadicPeriodRings/README.md) §3 | The `A_cris(R)` envelope for general rings and `θ_cris`, with `Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_theta`, `Crystalline.fontaineEnvelope_identify`, `Crystalline.fontaineEnvelope_map`. On `O_C`, `Crystalline.fontaineEnvelope_periodPDEnvelope` identifies them with PadicPeriodRings §3's principal envelope, presentation, p-adic completion and `θ_cris` by their initial properties. |
| [PerfectoidSpaces](../PerfectoidSpaces/README.md) §§P1.10–P1.11, P3.7 | Perfectoid fields (§§P1.10–P1.11); `isPerfectoidField_of_isAlgClosed` (§P3.7) makes a complete algebraically closed nontrivially valued nonarchimedean field of residue characteristic `p` perfectoid. |
| PerfectoidSpaces §P1.17–§P1.18 | Fontaine's `θ : W(S♭⁺) → S⁺` for a perfectoid Tate pair, its surjectivity, and its kernel generated by a primitive nonzerodivisor `ξ`; for `ℂ_p`, `ker θ = (p − [p♭])`. |
| PerfectoidSpaces §P1.24–§P1.25 | `IsIntegralPerfectoid` (BMS Definition 3.5) with the Frobenius criterion of [BMS] Lemma 3.10 and the examples `ℤ_p^cycl`, `𝒪_{ℂ_p}` and the p-adic completion of `ℤ_p^cycl[T^{1/p^∞}]`. |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §0.15 | Néron–Popescu desingularization: a regular map of Noetherian rings is a filtered colimit of smooth algebras ([Stacks] Tag 07GB). |
| SchemeAndStackFoundations §2.18 | `Coherent.DQCoh`, `Coherent.DQCoh.affineEquiv`, `derivedTensor`, `totalDirectImage`, `torIndependent_baseChange` for cotangent powers and Hodge graded pieces. The full base-linear de Rham complex uses the ringed-site realization of 5.8. |
| SchemeAndStackFoundations §4.7 | `Formal.AdicRing`, `Formal.AdicThickeningSystem` and `Spf A` as the system `Spec(A/I^(n+1))`, with morphisms of adic rings. |
| [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md) §0.K.1 | The Koszul complex `K(x)` of a finite sequence (exterior-algebra terms, `d₁(v) = Σ x_i v_i`, `H₀ = A/(x)`), its tensor formula `K(x,y) ≅ K(x) ⊗ K(y)`, functoriality, and the regular-sequence resolution. Here it is reindexed from homological degree `n` to cohomological degree `−n`: for the empty sequence it is `A`, for `(p)` over `ℤ` it resolves `F_p`, and for `(0)` it has `A` in degrees `−1` and `0`. |
| DerivedModuleAlgebra §0.DP.2 | The homogeneous piece `Γ^d_A(M)` of Mathlib's `DividedPowerAlgebra`, its functoriality and arbitrary base change, and `Γ^d ≅ TSym^d` for free modules. |
| [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) §E1.9 | `perfect_proper_pushforward`: for a finitely presented morphism `f : X → Y` of algebraic spaces, `E` perfect on `X` and a bounded complex `G•` of finitely presented `O_X`-modules, termwise flat over `Y` with support proper over `Y`, `Rf_*(E ⊗^L G•)` is perfect and its formation commutes with every base change `Y′ → Y`, with no Noetherian hypothesis on `Y`. 5.23 uses the case `E = O_X`, `G• = Ω^i_(X_n/A_n)` of a proper smooth scheme over `A_n`, which is [StacksPerfect] Lemma 36.30.4(2) (Tag 0B91). |

## How to read the build

The layers follow the construction order. DerivedModuleAlgebra supplies the module prefix. Layer 0
develops André–Quillen criteria and p-bases. Layer 1 develops algebraization, filtered categories
and geometric completion estimates. Layer PD constructs divided powers, regular envelopes and
`A_cris`. Layers 2–3 construct ordinary and derived differential algebra, their filtrations, Cartier
theory and smooth comparisons. Layer 4 computes PD conjugate filtrations and the torsion boundary.
Layer 5 constructs quasisyntomic covers and descent, base-linear scheme realization, period
descriptions and proper smooth control. Layer 6 proves the logarithmic period formula from explicit
comparison data.

Construct §3.3 before §3.2 and §2.28 before §3.6.1, which uses §§3.3–3.6. Before §1.12, use
PerfectoidSpaces §P4.15.1 and construct §1.11.1; its module inputs are in DerivedModuleAlgebra
§§0.1–0.4, 0.14 and 1.1–1.9. The dual-number Check in §2.25 states the filtered regular-envelope
comparison it assumes.

Within a layer, each subsection names its target, states it with its hypotheses and source, lists
its API as named laws, and gives discriminating **Checks**. *Needs* lists the earlier subsections
and suppliers a target uses; references to earlier subsections of this roadmap are by layer and
title. A source paragraph placed under a group heading applies to every subsection of that group.

## Layer 0: André–Quillen criteria and local differential algebra

### 0.18 André–Quillen homology

For a ring map `A → B`, a `B`-module `N` and `n ≥ 0`, define
`D_n(B|A, N) = H^−n(L_(B/A) ⊗^L_B N)`, computed as the homology of the simplicial module
`Ω_(P•/A) ⊗_(P•) N` for a polynomial resolution. Coefficients are derived-tensored, even when the
cotangent module has a two-term presentation. Transitivity gives the homological long exact sequence.

[Iyengar], §§4–5 definitions and §8.10–8.14 applications, pp.211–217, 228–229.

*Needs:* DerivedModuleAlgebra §0.4 The full cotangent complex; DerivedModuleAlgebra §0.8 The
cotangent transitivity triangle; DerivedModuleAlgebra §0.2 Derived tensor products on module derived
categories.

Lean: `DerivedDeRham.andreQuillenHomology`.

Prove the following named laws.

- `andreQuillenZero`: `D₀(B|A, N) ≃ Ω¹_(B/A) ⊗_B N`.
- `andreQuillenCoefficients`: a `B`-linear coefficient map induces natural maps on `D_n`.
- `andreQuillenTransitivity`: the cotangent transitivity triangle induces the exact sequence of `D_n`
  with the appropriate scalar extensions.

**Checks.**

- `test_aq_polynomial`: `D₀(A[t]|A, N) ≃ N` and `D_n = 0` for `n > 0`.
- `test_aq_regular_quotient`: `D₁(F_p|ℤ, F_p) ≃ F_p` and `D_n = 0` for `n ≠ 1`.
- `test_aq_nonregular_local`: for `A = k[ε]/ε²` and its residue field `k`, `D₂(k|A, k) ≃ k`; `A` is
  not regular.

### 0.19 Cohen factorizations and the vanishing theorems

For a local homomorphism `φ : (R, 𝔪) → (S, 𝔫)` of Noetherian local rings, the composite
`R → Ŝ` with the completion of `S` factors as `R → R′ → Ŝ` with `R → R′` flat, `R′` complete,
`R′/𝔪R′` regular and `R′ → Ŝ` surjective (a *Cohen factorization*). `φ` is *complete intersection at
𝔫* if in some (equivalently every) Cohen factorization the kernel of `R′ → Ŝ` is generated by a
regular sequence; a homomorphism of Noetherian rings is *l.c.i.* if it is c.i. at every prime of `S`.
Prove: `φ` is c.i. at `𝔫` iff `D₂(S|R, ℓ) = 0` for the residue field `ℓ`, and then `D_n(S|R, ℓ) = 0`
for `n ≥ 2`; a homomorphism of Noetherian rings is l.c.i. iff `D₂(S|R, −) = 0` iff
`fd_S L_(S/R) ≤ 1`; if `φ` is locally of finite flat dimension, it is l.c.i. iff `fd_S L_(S/R)` is
finite; for flat `φ`, it is l.c.i. iff its fibres are complete intersections; for regular `R`, `φ` is
l.c.i. iff `S` is l.c.i.

[AFH94], Theorem (1.1), as stated in [Avramov] p.458 (existence of Cohen factorizations); [Avramov],
Definition before (1.2), Theorems (1.1)–(1.3), Remarks (1.6), Lemma (1.7), Proposition (1.8), (5.1)
and (5.2) with proofs, pp.458–461, 481; [Iyengar], Theorems 8.4–8.5 and Propositions 8.12, 8.14,
pp.226–229.

*Needs:* Layer 0: André–Quillen homology; DerivedModuleAlgebra §0.13 Regular quotients and two-term
models; DerivedModuleAlgebra §0.8 The cotangent transitivity triangle; Mathlib `AdicCompletion`,
`IsLocalRing`, `Module.Flat`.

Lean: `DerivedDeRham.cohenFactorization`, `DerivedDeRham.secondVanishing`,
`DerivedDeRham.quillenConjecture`.

**Checks.**

- `test_cohen_factorization_surjective`: for a surjection of complete local rings the factorization
  with `R′ = R` exists, and c.i. means the kernel is generated by a regular sequence.
- `test_cohen_factorization_dual_numbers`: `k → k[ε]/ε²` is c.i. (kernel `(t²)` of `k[[t]] → k[ε]/ε²`)
  and `D₂ = 0`; `k → k[x,y]/(x,y)²` is not, and `D₂(S|k, k) ≠ 0`.
- `test_cohen_factorization_regular_base`: `ℤ → ℤ_p` is flat with regular fibres, so l.c.i., with
  `D₂ = 0`, although `ℤ_p` is not of finite type over `ℤ`.

### 0.20 The finite-presentation lci amplitude criterion

For a flat finitely presented map `A → B` of rings, `A → B` is a local complete intersection map
(locally a Koszul-regular quotient of a polynomial algebra, [StacksMA] Definition 15.34.2, Tag 07D0)
if and only if `L_(B/A)` is perfect of Tor amplitude `[−1, 0]`. The forward direction holds without
flatness ([StacksCt] Proposition 14.4, Tag 08SL, p.30). For the converse: for every map `A → k` to a
field, the fibre `S = B ⊗_A k` has `L_(S/k) ≃ L_(B/A) ⊗^L_B S` by Tor-independent base change
(DerivedModuleAlgebra §0.10), hence `D₂(S|k, −) = 0`; by Avramov's Second Vanishing Theorem the map
`k → S` of Noetherian rings is l.c.i., and since `k` is regular, `S` is an l.c.i. ring ([Avramov]
Theorem (1.2) and (5.1), pp.459, 481); a finite type `k`-algebra all of whose local rings are
complete intersections is a local complete intersection over `k` ([StacksAlg] Lemmas 10.135.4,
10.135.8–10.135.9, Tags 00SC, 00SG, 00SH, pp.351–353). So `A → B` is flat, of finite presentation
and has lci fibres, that is, syntomic ([StacksAlg] Definition 10.136.1, Tag 00SL), and syntomic maps
are exactly the flat lci maps ([StacksMA] Lemma 15.34.5, Tag 07D3, p.87). No converse is asserted
for maps that are not flat and finitely presented.

*Needs:* DerivedModuleAlgebra §0.13 Regular quotients and two-term models; DerivedModuleAlgebra §0.7
Degree zero and the naive cotangent complex; DerivedModuleAlgebra §0.10 Derived base change of the
cotangent complex; Layer 0: André–Quillen homology; Layer 0: Cohen factorizations and the vanishing
theorems.

Lean: `DerivedDeRham.lciAmplitude`.

**Checks.**

- `test_lci_amplitude_smooth`: the identity and a polynomial algebra are lci with `L` projective in
  degree zero.
- `test_lci_amplitude_hypersurface`: `k → k[t]/(t²)` is flat, finitely presented and lci, with `L` the
  two-term complex `[B → B dt]`, map `2t`.
- `test_lci_amplitude_square_zero`: `k → k[x,y]/(x,y)²` is flat and finitely presented but not lci:
  the Lichtenbaum–Schlessinger complex of DerivedModuleAlgebra §0.7 for the generators `x², xy, y²` gives `H^−2(L) ≅ k`, so
  `L` is not of amplitude `[−1, 0]`.

### 0.21 Avramov's absolute complete-intersection criterion

For a Noetherian ring `A`, `A` is locally a complete-intersection ring (each completed local ring is a
quotient of a regular local ring by a regular sequence) if and only if `L_(A/ℤ)` has Tor-amplitude
`[−1, 0]`. This is the absolute Noetherian criterion, without a finite-presentation hypothesis over
`ℤ`: apply 0.19 to the regular base `ℤ` ([Avramov] (5.1) and Theorem (1.2)).

[BMS19], Theorem 4.13, p.224; [Avramov], Theorem (1.2), Proposition (1.8) and (5.1), pp.459–461, 481.

*Needs:* Layer 0: André–Quillen homology; Layer 0: Cohen factorizations and the vanishing theorems;
DerivedModuleAlgebra §0.8 The cotangent transitivity triangle.

Lean: `DerivedDeRham.absoluteCompleteIntersection`.

### 0.22 André's regularity criterion and the cotangent injection test

For a Noetherian local ring `(A, 𝔪, k)`, `A` is regular iff `D₂(k|A, k) = 0`, and `A` is a complete
intersection iff `D₃(k|A, k) = 0`. Regularity is also equivalent to injectivity of
`H^−1(L_(A/ℤ) ⊗^L_A k) → H^−1(L_(k/ℤ))`. Indeed, `L_(k/ℤ)` has amplitude `[−1, 0]`, so the
transitivity sequence identifies the kernel of this map with `D₂(k|A, k)`. This uses the full
cotangent complex and holds for every Noetherian local ring.

[Iyengar], Theorems 8.4–8.5 and Propositions 8.12, 8.14 with proofs, pp.226–229; [BM], Lemma 4.18 and
proof, pp.18–19 (the transitivity argument, together with André's criterion, gives the injection
test without the c.i. hypothesis in that lemma).

*Needs:* Layer 0: André–Quillen homology; Layer 0: Cohen factorizations and the vanishing theorems;
DerivedModuleAlgebra §0.8 The cotangent transitivity triangle.

Lean: `DerivedDeRham.andreRegularity`.

**Checks.**

- `test_andre_regular`: for `A = ℤ_p`, `k = F_p`, the injection test holds and `D₂(k|A,k) = 0`.
- `test_andre_dual_numbers`: for `A = k[ε]/ε²`, `D₂(k|A,k) ≅ k`, so the cotangent map is not
  injective, including in characteristic 2.
- `test_andre_nonci`: for `A = F_p[x,y]/(x,y)²`, the cotangent map is not injective; this
  Noetherian local ring is neither regular nor a complete intersection.

### 0.23 p-bases and the dimension of differentials

For a field `k` of characteristic `p` with finite degree `[k : k^p] = p^r`, a p-basis `b₁, …, b_r`
gives a basis `db₁, …, db_r` of `Ω¹_(k/F_p)`, so `dim_k Ω¹_(k/F_p) = r = log_p [k : k^p]`. A p-basis
means the p-monomials `∏ b_i^(e_i)`, `0 ≤ e_i < p`, form a `k^p`-basis; arbitrary transcendence bases
are not substituted.

[CMM], §5.1, Footnote 10, p.39; Matsumura,
*Commutative ring theory*, second edition, §26.

*Needs:* Mathlib `KaehlerDifferential.D`, `frobenius`.

Lean: `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis`. The latter states the
p-basis theorem in `Suggested.lean` on Mathlib's Kähler differential module.

**Checks.**

- `test_pbasis_perfect`: for a perfect field the empty family is a p-basis and `Ω¹ = 0`.
- `test_pbasis_rational_function`: for `F_p(t)` the single element `t` is a p-basis, `[F_p(t) :
  F_p(t^p)] = p`, and `dt` spans `Ω¹`, including `p = 2`.
- `test_pbasis_transcendence_not_enough`: for `k = F_p(t)`, `{t^p}` is a transcendence basis of `k`
  over `F_p` but not a p-basis (`t^p ∈ k^p`), and `d(t^p) = 0`.

### 0.24 F-finiteness and almost perfect cotangent complexes

For a Noetherian `F_p`-algebra `S` whose Frobenius is finite, `L_(S/F_p)` is almost perfect: each
`H^−n L_(S/F_p)` is a finite `S-module` (bounded above with finitely generated cohomology; over a
Noetherian ring equivalently a bounded-above resolution by finite projectives; it is not bounded or
perfect in general). Conversely, if `L_(S/F_p)` is almost perfect then every residue field `κ` of `S`
is F-finite: `Ω¹_(κ/F_p)` is a quotient of `Ω¹_(S/F_p) ⊗_S κ` by the transitivity sequence of
`F_p → S → κ` (with `Ω_(κ/S) = 0`), hence finite-dimensional, and 0.23 identifies its dimension with
`log_p [κ : κ^p]`.

[DM], Theorem 3.6 with Lemma 3.3 and proof, pp.21–24; [CMM], Definition 5.1 and the paragraph
following it, p.38; [BM], the discussion preceding Corollary 4.20, p.20.

*Needs:* DerivedModuleAlgebra §0.4 The full cotangent complex; DerivedModuleAlgebra §0.8 The
cotangent transitivity triangle; DerivedModuleAlgebra §0.17 Exterior powers of a triangle and
décalage; Layer 0: p-bases and the dimension of differentials.

Lean: `DerivedDeRham.fFiniteCotangent`.

**Checks.**

- `test_f_finite_perfect`: `F_p` and every perfect field have `L = 0`.
- `test_f_finite_polynomial`: `F_p[t]` has `L = F_p[t] dt` and finite Frobenius.
- `test_f_finite_residue`: for `S = F_p(t)`, `L ≅ Ω¹ = S dt`, finite, and `[S : S^p] = p`.

### Examples

The identity map has zero cotangent complex. A polynomial line has one degree-zero generator. The
hypersurface `k[ε]/ε²` has differential `2ε`; at characteristic 2 the map is zero and both cotangent
degrees survive. Weight zero of every power is the base ring, including the zero module. The
square-zero quotient `k[x,y]/(x,y)²` has `H^−2(L) ≅ k` (from the Lichtenbaum–Schlessinger
description of DerivedModuleAlgebra §0.7). The extension `ℤ/4 → ℤ/2` is the nonsplit class of
`ℤ/2[1] = L_(F₂/ℤ)` against `F₂`.

### Dependencies

DerivedModuleAlgebra §§0.1–0.17 supplies resolutions, module tensor, cotangent complexes and
integral powers. Mathlib supplies Kähler differentials and Frobenius. The local criteria use
§§0.18–0.24 here.

## Layer 1: Completion and filtered modules

DerivedModuleAlgebra §§1.1–1.9 supplies module limits, completion and complete flatness. This layer
develops algebraization, filtered objects and geometric completion estimates.

### 1.10 Bhatt's ordinary flatness criterion

Let `A` be Noetherian, `π ∈ A`, and suppose `A` and an `A`-algebra `B` are `π`-torsion-free and
classically `π`-adically complete. If `A/π → B/π` is flat, then `A → B` is flat; if it is faithfully
flat, then `A → B` is faithfully flat. This is the Noetherian algebra criterion of Bhatt's
Proposition 5.1, not a general identification of complete flatness and ordinary flatness.

[BhattDS], Proposition 5.1 and proof, pp.8–9.

*Needs:* DerivedModuleAlgebra §1.7 Complete flatness and complete faithful flatness;
DerivedModuleAlgebra §1.5 When ordinary quotient towers compute completion.

Lean: `DerivedDeRham.ordinaryFlatnessFromCompleteFlatness`,
`DerivedDeRham.ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness`. Both criteria are stated
in `Suggested.lean` with the Noetherian, nonzerodivisor and classical completeness hypotheses.

### 1.11 Quotient completeness under a nonzerodivisor condition

Let `N` be an `A`-module, `f, g ∈ A`. If `N` is derived `f`-complete then so is `N/gN`. If moreover `N`
is classically `f`-adically complete and `f` acts injectively on `N/gN`, then `N/gN` is classically
`f`-adically complete: `f`-separatedness follows from injectivity and derived completeness. No claim
that every quotient of a classically complete module is separated is made.

For the derived assertion, [StacksMA], Lemma 15.93.1, Tag 091P: the cone of `g : N → N` is
derived `f`-complete, and its degree-zero cohomology is `N/gN`; derived completeness passes to
cohomology. For the classical assertion, [BMaEtAl], Lemma 2.8 and proof, p.14.

*Needs:* DerivedModuleAlgebra §1.2 Derived ideal completeness.

Lean: `DerivedDeRham.quotientCompleteness`, `DerivedDeRham.quotientClassicalCompleteness`.

### 1.11.1 Square-zero lifting over simplicial bases

Using PerfectoidSpaces §P4.15.1 `semiperfectoidFiniteIdealDescent`'s module models, construct
`DerivedDeRham.simplicialSquareZeroLifting`. A connective module complex `M` over a simplicial
commutative ring `B` defines a split simplicial square-zero algebra `B ⊕ M`; a derived square-zero
extension is the homotopy pullback of its zero section and a derived derivation into `B ⊕ M[1]`.
Retain the identified homotopy fibre `M`, its `B`-action and the extension class; arbitrary
surjections are not square-zero extensions. For an `E`-algebra map `T → B` and a derived square-zero
extension of `E`-algebras `B′ → B` with identified connective `B`-module kernel `M`, construct the
lifting obstruction in `Ext¹_B(L_(T/E) ⊗^L_T B, M)`. Its vanishing gives lifts, with their homotopy
fibre described by the mapping complex from `L_(T/E) ⊗^L_T B` to `M`. For a derived square-zero base
extension `E′ → E` with kernel `J`, an `E`-algebra `T`, a connective `T`-module `M` and a specified
derived `E`-linear kernel map `J → Res^T_E M`, construct the obstruction in `Ext²_T(L_(T/E), M)`,
the `Ext¹` class torsor and the `Ext⁰` automorphism comparison, retaining that kernel map as in
DerivedModuleAlgebra §0.25.

If the relevant cotangent module is finite projective over the simplicial base, meaning
its derived reduction to `π₀` is finite projective in degree zero, and `M` is connective,
the positive Ext obstruction groups vanish. In particular compatible smooth algebras and
an isomorphism between their reductions lift through the bounded connective square-zero
kernels of the Koszul and Postnikov towers in [Prisms] Footnote 6. For étale algebras the
cotangent module is zero and the lift space is contractible. Derived mapping spaces retain
higher automorphisms; uniqueness of a chosen smooth lift is not asserted.

[Prisms], §1.2, Footnote 6, pp.10–11 (the finite-projective Ext vanishing and compatible
lifting argument); [Bhatt12], Remark 6.6 and equivalence (6), pp.25–26, with trivial monoids;
[StacksCt], Lemma 16.1, Tag 08SP, for the ordinary specialization.

*Needs:* PerfectoidSpaces §P4.15.1 `semiperfectoidFiniteIdealDescent` (simplicial-module, derived
tensor and mapping-complex models); DerivedModuleAlgebra §0.9 The cotangent complex of a map of
simplicial rings and the diagonal comparison; DerivedModuleAlgebra §0.25 Cotangent obstruction
theory for square-zero lifts; DerivedModuleAlgebra §0.12 The smooth cotangent computation;
DerivedModuleAlgebra §1.4 The derived Koszul completion tower; DerivedModuleAlgebra §1.6 Completion
of simplicial commutative algebras.

**Checks.**

- `test_simplicial_lift_polynomial`: a map from `E[x]` lifts along a square-zero extension
  by lifting its coordinate. For a discrete kernel `M`, differences of lifts are exactly `M`.
- `test_simplicial_lift_negative_kernel`: for a field `k`, the map `k[x] → k`, `x ↦ 0`,
  and split extension `k ⊕ k[1] → k` give cotangent module `k[0]` and kernel `M = k[1]`. `Ext¹_k(k, M) = 0`, while the lift mapping space has `π₁ = k`.
  Discrete kernels alone lose this homotopy.
- `test_simplicial_lift_nonsmooth`: the identity map `F₂ → F₂` over `ℤ` does not lift
  to `ℤ/4`; its obstruction is the nonzero class in
  `Ext¹_(F₂)(L_(F₂/ℤ), F₂) = F₂`. The finite-projective degree-zero hypothesis fails.

### 1.12 Elkik algebraization of completely smooth and étale algebras

For a ring `A`, finitely generated `I ⊂ A` and a derived `I`-complete simplicial commutative
`A`-algebra `R`, if `R ⊗^L_A A/I` is a discrete smooth (respectively étale) `A/I`-algebra, then `R` is
the derived `I`-completion of a smooth (respectively étale) ordinary `A`-algebra `R′`. Conversely such
completions are completely smooth (respectively étale). No Noetherian hypothesis is imposed in the
deformation-theoretic proof of [Prisms] Footnote 6.

[Prisms], §1.2 Footnote 6 and Lemma 2.18 usage, pp.10–11, 17; [StacksSmoothing], Proposition 16.3.2,
Tag 07M8, pp.5–6.

*Needs:* DerivedModuleAlgebra §1.6 Completion of simplicial commutative algebras;
DerivedModuleAlgebra §1.7 Complete flatness and complete faithful flatness; DerivedModuleAlgebra
§1.4 The derived Koszul completion tower; DerivedModuleAlgebra §0.25 Cotangent obstruction theory
for square-zero lifts; DerivedModuleAlgebra §0.12 The smooth cotangent computation; Layer 1:
Square-zero lifting over simplicial bases; PerfectoidSpaces §P4.15.1
`semiperfectoidFiniteIdealDescent` (simplicial-module adapter).

Lean: `DerivedDeRham.completelySmoothAlgebraization`.

### 1.13 Effectivity of compatible perfect systems

Let `A` be `I`-adically complete for a finitely generated `I`, and let `K_n ∈ D(A/I^n)` with maps
`K_(n+1) → K_n` inducing `K_(n+1) ⊗^L_(A/I^(n+1)) A/I^n ≃ K_n`. Use DerivedModuleAlgebra §1.E.1
`perfectInverseSystemEffectivity` for the perfect-system theorem. Its adic adapter
`DerivedDeRham.perfectSystemEffective` first deduces perfectness of every `K_n` from `K₁` by lifting
across the nilpotent kernels `A/I^(n+1) → A/I^n`. If `K₁` is perfect, then `K = Rlim K_n` is
perfect, derived `I`-complete, and `K ⊗^L_A A/I^n ≃ K_n` for all `n`; if `K₁` is only
pseudo-coherent, this roadmap constructs the extension giving pseudo-coherent, derived `I`-complete
`K` with the same reductions (Stacks Tags 09AV–09AW). Perfectness of each `K_n` alone, without the
compatible reductions, does not suffice.

[StacksMA], §15.99, Lemmas 15.99.1–15.99.4; Tags 0CQF, 09AV, 0CQG, 09AW, pp.287–288.

*Needs:* DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The
Milnor sequence for towers of complexes*; DerivedModuleAlgebra §1.2 Derived ideal completeness;
DerivedModuleAlgebra §0.2 Derived tensor products on module derived categories; DerivedModuleAlgebra
§1.E.1 `perfectInverseSystemEffectivity` (perfect-system owner and compatible reductions);
[StacksMA] Lemmas 15.99.1–15.99.4 for nilpotent lifting, derived completeness and the
pseudo-coherent extension.

Lean: `DerivedDeRham.perfectSystemEffective` (adic specialization and extensions).

**Checks.**

- `test_perfect_system_constant`: for `K_n = (A/I^n)[0]`, `K = A[0]`.
- `test_perfect_system_shift`: for `K_n = (A/I^n)[1] ⊕ (A/I^n)[0]` the limit is `A[1] ⊕ A[0]`, perfect
  of amplitude `[−1, 0]`.
- `test_perfect_system_incompatible`: the system `K_n = (ℤ/p^n)^(⊕n)` over `ℤ_p` with projection
  transitions has perfect terms but `K_(n+1) ⊗ ℤ/p^n ≇ K_n`, and its limit is not perfect (it has
  infinite rank modulo p); the compatibility hypothesis cannot be dropped.

*Filtered modules, Rees objects and tensor.*

Filtrations are diagrams of complexes indexed by `ℤᵒᵖ`, localized at levelwise quasi-isomorphisms.
Their reflection and monoidal structure retain the underlying object, cofibres, shifts and universal
properties.

### 1.14 Filtered derived categories

For a ring `A` define `DF(A) = DerivedCategory (ℤᵒᵖ ⥤ ModuleCat A)`, the derived category of
`ℤᵒᵖ`-indexed diagrams `F^(i+1) → F^i` of `A`-modules, `DerivedDeRham.FilteredDerived`. A filtered
object has underlying object `colim_(i→−∞) F^i` (a filtered colimit, computed levelwise), and
`gr^i F = cofib(F^(i+1) → F^i)`. Filtration shifts satisfy `(F{n})^i = F^(i+n)`. Increasing
filtrations are reindexed explicitly. A diagram in the triangulated category `D(A)` does not encode the
same data: maps in `DF(A)` are maps of diagrams up to levelwise quasi-isomorphism, with all
commutativity data.

[BMS19], §5.1, p.233, with `gr^i = cofib(F^(i+1) → F^i)`; [GP], Definitions 2.1–2.3, pp.5–7, reindexed
by `i ↦ −i`; [Bhatt12], Remark 2.4, p.5, for the derived category of the functor category as the model.

*Needs:* Mathlib `DerivedCategory`, `CategoryTheory.Functor` categories, `HasDerivedCategory.standard`.

Lean: `DerivedDeRham.filteredModules`.

Prove the following named laws.

- `filtrationAt`: evaluation `F ↦ F^i` is exact.
- `associatedGraded`: `gr^i F = cofib(F^(i+1) → F^i)`.
- `filteredShift`: `F{n}` has `i`-th value `F^(i+n)` and shifts the graded pieces by the same
  convention.
- `filteredMapExt`: a map of filtered objects is an equivalence iff every evaluation is an
  equivalence.

**Checks.**

- `test_filtered_step`: for the step filtration `F^i = M` for `i ≤ 0` and `0` for `i > 0`, `gr⁰ = M`
  and all other graded pieces vanish.
- `test_filtered_constant`: a nonzero constant filtration has every graded piece zero although its
  underlying object is nonzero.
- `test_filtered_shift`: for the preceding step `F`, `F{1}` has its sole graded piece in index `−1`.
- `test_filtered_noninjective_transition`: for a nonzero ring `A`, take `F¹ = A[0]`,
  `F⁰ = 0` and every other term zero. Then `gr⁰F = A[1]` has nonzero `H^−1`, whereas
  the ordinary cokernel of the zero transition `F¹ → F⁰` is zero.

### 1.15 Completion of a filtered object

A filtered object `F` is complete when `Rlim_(i→+∞) F^i = 0`. Its reflection is
`(F^∧)^i = cofib(Rlim_j F^j → F^i)`; its underlying object is `Rlim_i(cofib(F^i → F))`, where
`F = colim_(i→−∞) F^i`. Completion leaves every `gr^i` unchanged and `gr` is conservative on complete
filtrations. Colimits in complete filtered modules are formed by completing colimits in `DF(A)`.
Classical separatedness alone does not imply this completeness.

[GP], Definition 2.8, Lemma 2.9, Proposition 2.14, Lemma 2.15, pp.6–7; [BMS19], Lemma 5.2,
pp.233–234.

*Needs:* Layer 1: Filtered derived categories; DerivedModuleAlgebra §1.1 Derived limits of towers;
DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*.

Lean: `DerivedDeRham.filteredCompletion`.

Prove the following named laws.

- `filteredCompletionUnit`: `F → F^∧` is universal among maps to complete filtered objects.
- `filteredCompletionGraded`: `gr^i F ≃ gr^i(F^∧)` for every `i`.
- `filteredCompletionIdempotent`: `(F^∧)^∧ ≃ F^∧`.
- `gradedDetectsComplete`: a map between complete filtered objects is an equivalence exactly when all
  its graded maps are equivalences.

**Checks.**

- `test_filtered_complete_step`: the step filtration of an object is already complete.
- `test_filtered_complete_constant`: the completion of a nonzero constant filtration is zero.
- `test_filtered_separated_boundary`: the `t`-adic filtration of `k[t]` is classically separated; its
  completed underlying object is `k[[t]]`, so it is not complete as a filtered object.
- `test_bdr_p_inverted_inside`: for a prime `p`, the discrete tower `M_n = ℤ_p[t]/(t^n)` has
  `(Rlim_n M_n)[1/p] = ℤ_p[[t]][1/p]`, whereas `Rlim_n(M_n[1/p]) = ℚ_p[[t]]`. Its transition maps
  are surjective, so both derived limits are discrete by DerivedModuleAlgebra §1.1. The natural map is injective with image
  the series whose coefficients have a common bound on their p-power denominators. The series
  `Σ_(n≥0) p^(−n)t^n` has no such bound: for any `N`, its coefficient in degree `N+1`, multiplied by
  `p^N`, is `1/p ∉ ℤ_p`. Thus inversion does not commute with this completion.

### 1.16 The Rees description of filtered modules

For a filtered object `F`, define its Rees graded `A[t]`-module with `deg(t) = 1` by degree `−i` term
`F^i` and `t`-action the transition `F^i → F^(i−1)`. This yields a symmetric monoidal equivalence
`DF(A) ≃ D_gr(A[t])` with the derived category of graded `A[t]`-modules. Derived quotient by `t` has
degree `−i` term `gr^i F`. The underlying object `colim_(i→−∞) F^i` is the degree-zero component of the
graded localization at `t`, equivalently the specialization `t = 1` (`t − 1` acts injectively on every
graded module, so this specialization is underived). Inverting `t` and forgetting the grading gives a
Laurent-graded module instead. Filtered completeness corresponds to derived `t`-completeness in the
graded category; it is not completeness of the ungraded direct sum.

[FGauges], §2.2.1, Proposition 2.2.6 and inverse, Remark 2.2.7, pp.13–17.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object;
DerivedModuleAlgebra §0.2 Derived tensor products on module derived categories.

Lean: `DerivedDeRham.reesDescription`.

**Checks.**

- `test_rees_step`: the step filtration at `0` of `A` is the graded `A[t]`-module `A[t]` with `F^i` in
  degree `−i`.
- `test_rees_quotient`: setting `t = 1` gives the underlying `A`; derived `t = 0` gives `gr`,
  including a Tor term when `t` is not regular on the Rees module.
- `test_rees_underlying_not_laurent`: for a nonzero ring `A`, the step filtration has Rees
  module `A[t]`. Its graded localization at `t` is `A[t, t⁻¹]`, whose degree-zero component is the underlying `A`; the ungraded module
  `A[t, t⁻¹]` is not `A`.
- `test_rees_not_ideal_rees_algebra`: the filtration `F^i = M` for `i ≤ 0` of an arbitrary module `M`
  has Rees module `M[t]`, which is not the Rees algebra of any ideal when `M` is not an ideal of `A`.

### 1.17 Completed filtered tensor products

Define `(F ⊗_fil G)^n = colim_(i+j≥n)(F^i ⊗^L_A G^j)` by Day convolution. On complete filtered objects
use `F ⊗̂_fil G = (F ⊗_fil G)^∧`. These form a symmetric monoidal structure;
`gr^n(F ⊗̂_fil G) ≃ ⊕_(i+j=n) gr^i F ⊗^L_A gr^j G`. The tensor unit is the step filtration of `A`.
Complete filtered algebras and their modules use this tensor, not the levelwise tensor.

[GP], §2.23, Theorem 2.25, Proposition 2.26, pp.9–10; [BMS19], §5.1 and Lemma 5.2, pp.233–234.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object;
DerivedModuleAlgebra §0.2 Derived tensor products on module derived categories.

Lean: `DerivedDeRham.completedFilteredTensor`.

Prove the following named laws.

- `filteredTensorAt`: the `n`-th term is the colimit over `i + j ≥ n` before completion.
- `filteredTensorGraded`: the `n`-th graded piece is the direct sum of tensor products with `i + j = n`.
- `filteredTensorUnit`: the step filtration of `A` is the tensor unit.
- `filteredTensorSteps`: the tensor of steps in weights `i, j` is the step of the module tensor in
  weight `i + j`.

**Checks.**

- `test_filtered_tensor_unit`: tensor with the step filtration of `A` returns `F`.
- `test_filtered_tensor_two_steps`: two filtrations with sole graded pieces `A` in weight 1 have tensor
  with sole graded piece `A` in weight 2.
- `test_filtered_tensor_derived`: for step filtrations of `F_p` over `ℤ_p`, the tensor has the degree
  `−1` Tor term of `F_p ⊗^L_(ℤ_p) F_p`, so the ordinary module tensor is wrong.

*The Beilinson heart and limit estimates.*

The heart consists of actual complexes, including nonzero acyclic ones. It therefore has a different
Ext calculation from the localized derived category. Connectivity estimates justify the particular
limit exchanges needed in descent.

### 1.18 The Beilinson t-structure

`DF(A)` has the Beilinson t-structure with `DF^(≤0)_Beil = {F : gr^i F ∈ D^(≤i)(A) for all i}` and
`DF^(≥0)_Beil = {F : F^i ∈ D^(≥i)(A) for all i}`. On complete filtered objects the latter can equivalently
be tested on `gr^i F ∈ D^(≥i)`. These conventions use cohomological grading and decreasing
filtrations.

[BMS19], Theorem 5.4, pp.234–235; [BL22], Appendix D, Definition D.3, Proposition D.4 and Remark D.6,
pp.229–230.

*Needs:* Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object; Mathlib
`DerivedCategory` t-structures.

Lean: `DerivedDeRham.beilinsonTStructure`.

**Checks.**

- `test_beilinson_weight_zero`: `A` in weight zero (the step filtration) lies in the heart in degree 0.
- `test_beilinson_weight_one`: the step filtration of `A` placed in weight 1 lies in the heart only
  after the shift `A[−1]`, i.e. its graded piece is in cochain degree 1.
- `test_beilinson_zero`: the zero object satisfies both bounds, and a nonzero object concentrated in
  `gr^0` in cochain degree 1 is not in `DF^(≤0)_Beil`.

### 1.19 The Beilinson heart is the category of complexes

The Beilinson heart is equivalent to the abelian category `Ch(A)` of unbounded cochain complexes. A
complex `M•` maps to its stupid filtration `F^i = M^(≥i)` with `gr^i F = M^i[−i]`. Conversely
`H^i(gr^i F)` are its terms, and the connecting maps of adjacent cofibres give a differential squaring
to zero. Acyclic complexes can be nonzero in this heart.

[BMS19], Theorem 5.4(3) and proof, pp.234–237 (Remark 5.5 concerns décalage); [BL22], Appendix D,
Example D.8, pp.230–231.

*Needs:* Layer 1: The Beilinson t-structure; Layer 1: Filtered derived categories; Mathlib
`CochainComplex.of`.

Lean: `DerivedDeRham.beilinsonHeart`.

**Checks.**

- `test_heart_single_term`: for a field `k`, the stupid filtration of `k[0]` recovers
  the complex with sole term `k` in degree zero.
- `test_heart_identity_differential`: for a field `k`, the stupid filtration of
  `[k --id→ k]` in degrees `0, 1` recovers the identity differential. Its heart object
  is nonzero although its underlying object of `D(k)` is zero.
- `test_heart_zero_differential`: for a field `k`, `[k --0→ k]` in degrees `0, 1`
  has the same graded modules, but its recovered connecting differential is zero.
  Its heart object is not isomorphic to that of the identity-differential complex.

### 1.20 Ext groups in the category of complexes

For ordinary `A`-modules `M, N` regarded as cochain complexes in degree zero and integers `i ≥ 0`, `c`,
`Ext^i_(Ch(A))(M, N[c]) = 0` if `c > 0`, while for `c ≤ 0` it is naturally `Ext^(i+c)_A(M, N)`, with
negative-degree Ext defined to be zero. This is [BMS19] Proposition 5.6; it is not an Ext computation in
`D(A)` after quotienting acyclic complexes.

[BMS19], Proposition 5.6 and proof, pp.237–238, with the cohomological Ext indexing above.

*Needs:* Layer 1: The Beilinson heart is the category of complexes; Layer 1: The Beilinson
t-structure; Mathlib `CategoryTheory.Abelian.Ext`.

Lean: `DerivedDeRham.complexHeartExt` states the full formula in `Suggested.lean`, including
both vanishing ranges, using Ext in Mathlib's abelian category of cochain complexes.

**Checks.**

- `test_heart_ext_identity_extension`: for a field `k`, `i = 1`, `c = −1`,
  `Ext¹_(Ch(k))(k, k[−1]) = Hom_k(k, k) = k`, witnessed by the two-term complex `[k → k]` with identity
  differential, a nonzero object of `Ch(k)` that is zero in `D(k)`.
- `test_heart_ext_positive_shift`: for `c = 1`, the group vanishes.
- `test_heart_ext_negative_total`: for `i + c < 0`, the group vanishes by convention.

### 1.21 The weak Postnikov tower lemma

Let `S` be a ring and let `(K_n)` be a weak Postnikov tower of connective objects of `D(S)`: the fibre
of `K_(n+1) → K_n` is `n`-connected in homological grading, and `K = Rlim_n K_n`. For an exact functor
`F : D(S) → D(S′)` that is right t-exact (it preserves connective objects), `(F(K_n))` is a weak
Postnikov tower and the canonical map `F(K) → Rlim_n F(K_n)` is an equivalence. The uniform
connectivity of the fibres is essential; right t-exactness does not assert preservation of every
inverse limit.

[BMS19], Lemma 3.3 and proof, pp.217–218.

*Needs:* DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The
Milnor sequence for towers of complexes*; Mathlib `DerivedCategory` t-structures.

Lean: `DerivedDeRham.weakPostnikovTowers`.

### 1.22 Valid exchanges of completion and derived operations

Derived ideal and filtered completion are exact and commute with limits on complete objects through
their reflector descriptions. A perfect `A`-complex `P` satisfies `P ⊗^L_A Λ_I M ≃ Λ_I(P ⊗^L_A M)`.
A filtered colimit in the complete category is completed after the raw colimit. For a uniformly
cohomologically bounded-below cosimplicial diagram, filtered colimits commute with its product
totalization degreewise; the connectivity bound is necessary. The Milnor sequence supplied by
DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*, through
DerivedModuleAlgebra §1.1's module adapter, retains `lim¹`; vanishing under a cohomology
Mittag-Leffler hypothesis is supplied by DerivedModuleAlgebra §1.T.1 / *Mittag-Leffler towers have
vanishing lim¹*.

[StacksMA], §§15.93, 15.95 and 15.96, pp.261–277; [BMS19], Example 5.12 and Lemma 3.3, pp.217–218,
240; [GP], Lemma 2.9 and Proposition 2.14, pp.6–7.

*Needs:* DerivedModuleAlgebra §1.3 The derived completion reflector; Layer 1: Completion of a
filtered object; Layer 1: Completed filtered tensor products; DerivedModuleAlgebra §1.1 Derived
limits of towers; DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*.

Lean: `DerivedDeRham.completionExchanges`.

### 1.23 The quasisyntomic cotangent condition

Fix a prime `p`. A quasisyntomic ring `A` is ordinary p-adically complete, has bounded p-power torsion,
and has `L_(A/ℤ) ⊗^L_A A/p` of Tor amplitude `[−1, 0]`. Independently of absolute object membership, for p-complete rings `A, B` with bounded
p-power torsion, `A → B` is a relative quasisyntomic map when it is p-completely flat and `L_(B/A) ⊗^L_B B/p` has Tor amplitude `[−1, 0]`; a cover is
p-completely faithfully flat. In these conditions `A/p` and `B/p` are ordinary quotient rings, while
the displayed module tensors are derived. The absolute condition and the morphism condition are kept
distinct.

[BMS19], Definitions 4.1 and 4.10, Remark 4.11, Example 4.12, Lemmas 4.15–4.17; pp.220, 223–225.

*Needs:* DerivedModuleAlgebra §0.4 The full cotangent complex; Layer 0: Avramov's absolute
complete-intersection criterion; DerivedModuleAlgebra §1.7 Complete flatness and complete faithful
flatness; DerivedModuleAlgebra §1.8 Bounded torsion and complete Tor-amplitude; Mathlib
`IsAdicComplete`.

Lean: `DerivedDeRham.quasisyntomicCondition`.

Prove the following named laws.

- `quasisyntomicCover`: a quasisyntomic map is a cover precisely when its mod-p map is faithfully
  flat.
- `quasisyntomicComp`: composites and p-completed base changes of quasisyntomic maps are quasisyntomic,
  with bounded-torsion hypotheses inherited from the objects.
- `quasisyntomicNoetherianLci`: a p-complete Noetherian lci ring is a quasisyntomic object by Avramov's
  criterion and bounded torsion.
- `quasisyntomicRelative`: for a map between quasisyntomic objects, quasisyntomicity means both
  p-complete flatness and Tor-amplitude `[−1, 0]` of the relative cotangent complex after derived
  reduction mod p. Object membership is a separate hypothesis; [BMS19] Definition 4.10 and Lemma 4.16
  govern maps and their composition and base change.

**Checks.**

- `test_qsyn_zp`: `ℤ_p` is quasisyntomic.
- `test_qsyn_fp_map_boundary`: `F_p` is a quasisyntomic object, but both `ℤ → F_p` and `ℤ_p → F_p` fail
  p-complete flatness: derived tensor with `F_p` has a nonzero `Tor₁ = F_p`. Hence `ℤ_p → F_p` is not a
  quasisyntomic map. The absolute `ℤ` formulation and the completed `ℤ_p` formulation give the same
  object condition.
- `test_qsyn_smooth`: a p-completed smooth finitely presented algebra over a bounded-torsion
  quasisyntomic base gives a quasisyntomic map.

### Examples

The zero ideal makes every complex complete, whereas the unit ideal admits only the zero complete
complex. `ℤ` is p-completely flat but is not p-complete; `F_p` as a `ℤ`-module fails complete
flatness because `Tor₁` is nonzero. The filtered step in weight one fixes the Rees degree `−1` and
the direction of multiplication by `t`. The tower `ℤ ←p ℤ ←p ⋯` has zero limit and nonzero `lim¹`,
supplied by DerivedModuleAlgebra §1.T.1 / *lim and lim¹ of a tower*.

### Dependencies

Layer 0 here supplies Avramov's criterion; DerivedModuleAlgebra §§0.2, 0.4–0.17, 0.25, 0.K.1,
1.1–1.9 supplies cotangent, tensor, deformation and completion inputs; Tau Ceti Artin–Rees; Mathlib
derived categories and adic completion. The quasisyntomic condition uses DerivedModuleAlgebra
§§1.7–1.8 for complete flatness and bounded torsion. The tower kernels, cokernels and connecting
maps are supplied by DerivedModuleAlgebra §1.T.1 / *lim and lim¹ of a tower* and *The six-term
sequence of lim and lim¹*; the module adapter of DerivedModuleAlgebra §1.1 uses the sequence
supplied by DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes* and the
vanishing criterion supplied by DerivedModuleAlgebra §1.T.1 / *Mittag-Leffler towers have vanishing
lim¹*.

## Layer PD: Divided powers and universal thickenings

This layer builds divided powers from identities on generators, glues them on compatible sums
of ideals, and extends them along principal ideals, flat maps and localizations. It supplies the
weighted divided power filtration, PD nilpotence, compatibility with a base, relative divided
power polynomial algebras, universal PD envelopes, their regular-immersion calculations and their
p-adic completions. It ends with `A_cris` of a p-adically complete ring. The carriers are Mathlib's
`DividedPowers`, `DividedPowerAlgebra` and `WittVector`.

*Needs:* DerivedModuleAlgebra §§0.DP.2–0.DP.3 (grading, base change, augmentation and its
intersection with a base ideal), §0.K.1 (Koszul complexes), §§1.1–1.5 (module limits and
completion); Layers 0–1 here (derived modules and filtered objects).

### PD.1 Divided powers from identities on generators, and gluing on sums

**Additive divided-power candidates.** For an ideal `I⊂A`, an additive divided-power candidate
consists of maps `δₙ:A→A`, `n≥0`, zero outside `I`, such that for all `x,y∈I` and `a∈A`: `δ₀(x)=1`, `δ₁(x)=x`,
`δₙ(x)∈I` for `n>0`, `δₙ(x+y)=Σᵢ₊ⱼ₌ₙδᵢ(x)δⱼ(y)`, and `δₙ(ax)=aⁿδₙ(x)`. The multiplication and iteration
identities are not assumed. Every divided power structure on `I` is an additive candidate with the
same operations.

*Hypotheses.* `A` is a commutative ring and `I⊂A` is an ideal. The operations `δₙ`, `n≥0`, are maps `A→A` that
vanish outside `I` in every degree, including degree 0; this is the convention of Mathlib's
`DividedPowers`.

The API:

- `PD.AdditivePowers.ofDividedPowers`: Every existing PD structure gives its additive candidate
  without changing any operation.
- `PD.AdditivePowers.ofDividedPowers_dpow`: The candidate operation obtained from `γ` is exactly `γₙ` on
  every element, including outside `I`.
- `PD.AdditivePowers.ext`: Candidates with equal operations on `I` coincide.

*Proof sketch.* Collect precisely axioms (1),(3),(4) and ideal membership from Stacks 23.2.4. Use
total functions with the same outside-ideal convention as the existing `DividedPowers` structure.
([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.4 (tag 07GP),
statement, hypothesis (a); Definition 23.2.1 (tag 07GL), axioms (1), (3), (4).) *Needs:* Mathlib
`DividedPowers`; Tau Ceti `TauCeti.Associative.dividedPower`; Tau Ceti
`TauCeti.Associative.dividedPower_eq_dpow`.

**Checks.**

- `test_candidate_zero_index`: For every additive candidate `δ` on `I`: `δ₀(0)=1`.
- `test_candidate_positive_at_zero`: For every additive candidate `δ` on `I`: `δ₂(0)=0`.
- `test_candidate_rational`: For a commutative `ℚ`-algebra `R`, an ideal `I` of `R`, a divided power
  structure `γ` on `I`, `x∈I` and `n≥0`: the candidate of `γ` has value `TauCeti.Associative.dividedPower n x=(n!)⁻¹·xⁿ` at `x`. Instance: `R=ℚ[X]`, `I=(X)`, `x=X`.
- `test_candidate_not_pd`: On `A=𝔽₂[ε]/(ε²)` with `I=(ε)`, the maps with `δ₀=1`, `δ₁=δ₃=id` and `δₙ=0` for `n=2`
  and `n≥4` on `I`, and `δₙ=0` outside `I` for all `n`, form an additive candidate on `I`, and
  `δ₁(ε)·δ₂(ε)=0≠ε=3·δ₃(ε)`. So an additive candidate need not satisfy the multiplication identity.
- `test_candidate_outside`: For every additive candidate `δ` on `I` and every `x∉I`: `δ₀(x)=0`.
- Every divided power structure `γ` on `I` gives a candidate with the same operations.

**The multiplication identity is stable under sums.** For an additive candidate `δ`, suppose the
identities `δₘ(z)δₙ(z)=choose(m+n,m)δₘ₊ₙ(z)` hold for every `m,n` at each of `x,y∈I`. They then hold at
`x+y`.

*Hypotheses.* `A` is a commutative ring, `I⊂A` an ideal and `δ` an additive candidate on `I`. `x,y∈I`, and
`δₘ(z)δₙ(z)=choose(m+n,m)·δₘ₊ₙ(z)` holds for all `m,n≥0` at `z=x` and at `z=y`.

*Proof sketch.* Expand both operations at `x+y` by the addition law and rearrange the finite
four-index sum. Apply the multiplication identity separately at `x` and `y`. For fixed exponents
`a+b=m+n`, the resulting coefficient is the Vandermonde sum `Σ choose(a,i)choose(b,m−i)=choose(m+n,m)`.
This is an identity of natural integers before casting to `A`; the source also checks its coefficients
in `ℚ[X,Y]`. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.4
(tag 07GP), proof, paragraph "Proof of `(2)` for `x + y`".) *Needs:* *Additive divided-power
candidates*; Mathlib `Nat.add_choose_eq`.

**Checks.**

- For `m=n=1`: from `x²=2δ₂(x)` and `y²=2δ₂(y)` the lemma gives `(x+y)²=2δ₂(x+y)=2δ₂(x)+2xy+2δ₂(y)`.
- The coefficient identity is Vandermonde's `Σᵢchoose(a,i)·choose(b,m−i)=choose(a+b,m)`; for `a=b=m=1`
  it reads `1+1=2`.

- For `m=0` and `x+y∈I`, `δ₀(x+y)δₙ(x+y)=δₙ(x+y)`, with coefficient `choose(n,0)=1`.

**The iteration identity is stable under sums.** For an additive candidate `δ` satisfying the
multiplication identity on all `I`, suppose `δₘ(δₙ(z))=uniformBell(m,n)δₘₙ(z)` for all `m` and `n>0` at
`x,y∈I`. It holds at `x+y`.

*Hypotheses.* `A` is a commutative ring, `I⊂A` an ideal and `δ` an additive candidate on `I` such that
`δₘ(z)δₙ(z)=choose(m+n,m)·δₘ₊ₙ(z)` for all `m,n≥0` and all `z∈I`. `x,y∈I`, and
`δₘ(δₙ(z))=uniformBell(m,n)·δₘₙ(z)` holds for all `m≥0` and all `n>0` at `z=x` and at `z=y`.

*Proof sketch.* Expand `δₙ(x+y)` by the addition law, then expand `δₘ` of that finite sum by
`DividedPowers.dpow_sum'` applied to the candidate. The positive inner degree ensures every summand is
in `I`. Apply scalar homogeneity to `δₖ(δᵢ(x)δⱼ(y))`; use iteration at `x` if `i>0` and at `y` if `i=0`. Reduce
repeated products using the multiplication identity. Collect coefficients of `δₐ(x)δᵦ(y)`, `a+b=mn`.
Verify their universal integer values by the same calculation in `ℚ[X,Y]` with its divided power
structure `fⁿ/n!` on `(X,Y)` (`DividedPowers.RatAlgebra.dividedPowers`), where these divided monomials are
linearly independent. The coefficient is `uniformBell(m,n)`. No injection of `A` into a rational algebra
is assumed. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.4
(tag 07GP), proof, paragraph "Proof of (5) for `x + y`".) *Needs:* *Additive divided-power
candidates*; Mathlib `DividedPowers.dpow_sum'`; Mathlib `MvPolynomial.basisMonomials`; Mathlib
`DividedPowers.RatAlgebra.dividedPowers`.

**Checks.**

- For `m=n=2`: `δ₂(δ₂(x+y))=3δ₄(x+y)`; the coefficient of `δ₂(x)δ₂(y)` on the left is 2, from
  `δ₂(xy)=y²δ₂(x)=2δ₂(y)δ₂(x)`, plus 1, from the cross term `δ₂(x)·δ₂(y)`, and `uniformBell(2,2)=3`.
- For `n=1` the conclusion is `δₘ(δ₁(z))=δₘ(z)`, and `uniformBell(m,1)=1`.

- For `m=0` and `n>0`, `δ₀(δₙ(x+y))=1`, since `δₙ(x+y)∈I` and `uniformBell(0,n)=1`.

**Divided powers from identities on generators.** Let `δ` be an additive candidate on `I` and `S⊂A` with
`I=span(S)`. If multiplication and positive-inner-index iteration hold at every `s∈S`, construct the
existing `DividedPowers I` with operation `δ`. No freeness, factorial invertibility, or nilpotence is
required.

*Hypotheses.* `A` is a commutative ring, `I⊂A` an ideal, `δ` an additive candidate on `I` and `S⊂A` a subset
with `I=span(S)`. For every `s∈S`: `δₘ(s)δₙ(s)=choose(m+n,m)·δₘ₊ₙ(s)` for all `m,n≥0`, and
`δₘ(δₙ(s))=uniformBell(m,n)·δₘₙ(s)` for all `m≥0` and all `n>0`.

The API:

- `PD.AdditivePowers.toDividedPowers_dpow`: The result uses `δₙ` exactly on all `A`.
- `PD.AdditivePowers.toDividedPowers_unique`: Every PD structure with these candidate operations
  equals the constructed structure.
- `PD.AdditivePowers.toDividedPowers_generators`: Different generating sets and valid identity
  proofs yield the same structure.

*Proof sketch.* Propagate multiplication from `S` to its scalar multiples using homogeneity; use
multiplication-addition and induction on ideal span to obtain the identity everywhere. Propagate
iteration under scalar multiplication using homogeneity twice. Apply iteration-addition and span
induction to obtain the iteration identity on all `I`. Fill exactly the two missing fields of
`DividedPowers`. The underlying operations are unchanged. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.4 (tag 07GP),
statement.) *Needs:* §PD.1 *Additive divided-power candidates*; *The multiplication identity is stable
under sums*; §PD.1 *The iteration identity is stable under sums*; Mathlib `DividedPowers`.

**Checks.**

- `test_generators_degree_two`: For `x,y∈I` the constructed structure `θ` satisfies
  `θ₂(x+y)=δ₂(x)+x·y+δ₂(y)`.
- `test_generators_outside`: For `x∉I` the constructed structure `θ` satisfies `θ₀(x)=0`.
- `test_generators_inner_one`: For `x∈I` and every `n≥0` the constructed structure `θ` satisfies
  `θₙ(θ₁(x))=δₙ(x)`.
- `test_generators_roundtrip`: For every divided power structure `γ` on `I`: the structure constructed
  from the candidate of `γ` with `S=I` (the hypotheses on generators being the axioms of `γ`) is equal to
  `γ`.
- `test_generators_hypothesis_needed`: On `A=𝔽₂[ε]/(ε²)` with `I=(ε)` and `S={ε}`: the additive candidate
  with `δ₀=1`, `δ₁=δ₃=id` and `δₙ=0` for `n=2` and `n≥4` has `δ₁(ε)·δ₂(ε)=0≠3·δ₃(ε)=ε`, so the multiplication
  hypothesis fails at the generator `ε`, and no divided power structure on `I` has these operations.

**Convolution of two divided-power systems.** For `γ` on `I` and `ε` on `J` define `Cₙ(x,y)=Σᵢ₊ⱼ₌ₙγᵢ(x)εⱼ(y)`.
Its gluing interpretation uses `x∈I` and `y∈J`; outside these domains it is simply the displayed total
function.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`. `n≥0`, and `x,y∈A` are arbitrary; `γ` and `ε` vanish outside their ideals in
every degree.

The API:

- `C` is the antidiagonal sum of the two systems.
- Exchanging the two ideals and elements leaves `C` unchanged.
- For `n>0`, `Cₙ(x,y)` lies in `I+J` when `x∈I` and `y∈J`.
- For all `x,y∈A` and `n≥0`, `Cₙ(x,y)` is the `n`-th coefficient of the
  product of power series (`DividedPowers.exp γ x)·(DividedPowers.exp ε y`), where `DividedPowers.exp γ x=Σₙγₙ(x)Tⁿ`.

*Proof sketch.* Use the finite antidiagonal sum in `A`. Record the quadratic mixed term `x y`
explicitly; there is no binomial coefficient on it. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.5 (tag 07GQ), proof,
second paragraph, the display defining `ε_n`.) *Needs:* Mathlib `DividedPowers`; Mathlib
`DividedPowers.exp`.

**Checks.**

- `test_convolution_zero`: `C₀(0,0)=1`.
- `test_convolution_quadratic`: For `x∈I` and `y∈J`: `C₂(x,y)=γ₂(x)+xy+ε₂(y)`.
- `test_convolution_same`: For `I=J`, `γ=ε` and `x,y∈I`: `Cₙ(x,y)=γₙ(x+y)` for every `n≥0`.
- `Cₙ(x,y)` is the coefficient of `Tⁿ` in the product of the power series `Σγᵢ(x)Tⁱ` and `Σεⱼ(y)Tʲ`.

**Convolution is independent of the decomposition.** If `γₙ(w)=εₙ(w)` for every `n` and `w∈I∩J`, then
`Cₙ(x,y)=Cₙ(x′,y′)` whenever `x,x′∈I`, `y,y′∈J` and `x+y=x′+y′`.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`, with `γₙ(w)=εₙ(w)` for every `n≥0` and every `w∈I∩J`. `x,x′∈I` and `y,y′∈J`
satisfy `x+y=x′+y′`; `n≥0`.

*Proof sketch.* Set `w=x−x′=y′−y`; it lies in `I∩J`. Write `exp_γ(x)` for the power series `Σγᵢ(x)Tⁱ` (`DividedPowers.exp`). By `DividedPowers.exp_add` on `I`, `exp_γ(x)=exp_γ(x′)·exp_γ(w)`; by hypothesis
`exp_γ(w)=exp_ε(w)`; by `DividedPowers.exp_add` on `J`, `exp_ε(w)·exp_ε(y)=exp_ε(y′)`. Hence
`exp_γ(x)·exp_ε(y)=exp_γ(x′)·exp_ε(y′)`, and comparing `n`-th coefficients gives `Cₙ(x,y)=Cₙ(x′,y′)`. In
finite sums this is the source's regrouping of `Σγᵢ′(x′)γₗ(w)εⱼ(y)`. This proves equality in `A`,
without assuming `I∩J=IJ`. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra,
Lemma 23.2.5 (tag 07GQ), proof, second paragraph, the well-definedness computation.) *Needs:*
§PD.1 *Convolution of two divided-power systems*; Mathlib `DividedPowers`; Mathlib `DividedPowers.exp`;
Mathlib `DividedPowers.exp_add`.

**Checks.**

- For `I=J` and `γ=ε` both sides equal `γₙ(x+y)`.
- The hypothesis is needed: in `ℤ/4` with `I=J=(2)`, take `γ` the canonical divided powers `(γ₂(2)=2)` and `ε`
  the square-zero structure `(ε₂(2)=0)`; then `2+0=0+2`, but `C₂(2,0)=2` and `C₂(0,2)=0`.

- For `n=1` both decompositions give `C₁(x,y)=x+y=x′+y′`.

**The candidate on the sum of compatible ideals.** Assume `γ` and `ε` agree on `I∩J`. Define an additive
candidate on `I+J` by `δₙ(z)=Cₙ(x,y)` for any decomposition `z=x+y` with `x∈I,y∈J`, and zero outside `I+J`.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`, with `γₙ(w)=εₙ(w)` for every `n≥0` and every `w∈I∩J`.

The API:

- For `x∈I`, `y∈J` and every `n≥0`: `δₙ(x+y)=Cₙ(x,y)`.
- For `x∈I` and every `n≥0`: `δₙ(x)=γₙ(x)`.
- For `y∈J` and every `n≥0`: `δₙ(y)=εₙ(y)`.

*Proof sketch.* Use membership in `I+J` to choose a decomposition; sum-independence removes the
choice. Membership and degrees zero/one follow termwise. For homogeneity choose `ax,ay` as the
decomposition of `az`. For addition choose `(x+x′)+(y+y′)`, expand both factors and reindex the finite
four-index sum; this gives the candidate addition law. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.5 (tag 07GQ), proof,
from "Hence, we have defined maps" to the verification of properties (1), (3) and (4).) *Needs:*
§PD.1 *Additive divided-power candidates*; §PD.1 *Convolution of two divided-power systems*; *Convolution is
independent of the decomposition*.

**Checks.**

- `test_supCandidate_zero`: `δ₀(0)=1`.
- `test_supCandidate_mixed`: For `x∈I` and `y∈J`: `δ₂(x+y)=γ₂(x)+xy+ε₂(y)`.
- `test_supCandidate_outside`: For `x∉I+J`: `δ₀(x)=0`.
- For `J=0` the candidate on `I+0=I` is the candidate of `γ`.

**The sum candidate extends both structures.** The sum candidate agrees with `γ` on `I` and with `ε` on `J`,
in every degree.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`, with `γₙ(w)=εₙ(w)` for every `n≥0` and every `w∈I∩J`.

*Proof sketch.* Choose `x=x+0` or `y=0+y` and use the positive-degree vanishing at zero. For degree zero
use `γ₀(0)=ε₀(0)=1`. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma
23.2.5 (tag 07GQ), proof, the sentence after the well-definedness computation.) *Needs:* *The
candidate on the sum of compatible ideals*; §PD.1 *Convolution of two divided-power systems*; Mathlib
`DividedPowers.dpow_eval_zero`.

**Checks.**

- At 0 both restrictions give 1 in degree 0 and 0 in every positive degree.
- For `w∈I∩J` the two restrictions give `γₙ(w)` and `εₙ(w)`, which are equal by hypothesis.

- For `J=0`, the restriction on `I` is `γ` in every degree; no extra mixed term survives.

**Divided powers on a compatible sum of ideals.** For PD structures `γ` on `I` and `ε` on `J` that agree on
`I∩J`, construct the unique PD structure on `I+J` restricting to both.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`, with `γₙ(w)=εₙ(w)` for every `n≥0` and every `w∈I∩J`.

The API:

- For `x∈I`, `y∈J` and every `n≥0`, the glued operation at `x+y` is `Cₙ(x,y)`.
- The identity ring map from `(A,I,γ)` to the glued PD ring is a PD morphism.
- The identity ring map from `(A,J,ε)` to the glued PD ring is a PD morphism.
- Let `g:A→C` be a ring map and `κ` a divided power structure on an ideal `K`
  of `C`. Then `g` is a PD morphism from `I+J` with the glued structure to `(K,κ)` if and only if `g` is a PD
  morphism from `(I,γ)` to `(K,κ)` and from `(J,ε)` to `(K,κ)`.

*Proof sketch.* Apply the generator criterion to the sum candidate and generating set `I∪J`. Use
sum-restrictions to transfer multiplication and iteration from `γ` or `ε` to each generator. For
iteration, the inner positive divided power stays in the corresponding ideal. Uniqueness: two
divided power structures on `I+J` that restrict to `γ` on `I` and to `ε` on `J` agree on the generating set
`I∪J`, so they are equal by `DividedPowers.dpow_eq_from_gens`. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.5 (tag 07GQ),
statement, part (2).) *Needs:* §PD.1 *Divided powers from identities on generators*; *The candidate on the
sum of compatible ideals*; §PD.1 *The sum candidate extends both structures*; Mathlib
`DividedPowers.dpow_eq_from_gens`; Mathlib `DividedPowers.IsDPMorphism`; Mathlib
`DividedPowers.IsDPMorphism.on_span`.

**Checks.**

- `test_sup_same`: For `J=I` and `ε=γ`: the glued operation on `I+I=I` equals `γₙ(x)` for every `n≥0` and
  every `x∈A`.
- `test_sup_zero_ideal`: For `J=0` with the divided power structure `dividedPowersBot A`: the glued
  operation equals `γₙ(x)` for every `n≥0` and every `x∈I`.
- `test_sup_quadratic`: For `x∈I` and `y∈J`: the glued operation in degree 2 at `x+y` is `γ₂(x)+xy+ε₂(y)`.
- The case used in the proof of Stacks Lemma 23.5.1: on `A⟨x⟩` the structures on `I·A⟨x⟩` and on `A⟨x⟩₊`
  glue to one on `I·A⟨x⟩+A⟨x⟩₊`.
- Gluing `γ` with itself returns `γ`, and gluing `γ` with the zero ideal returns `γ`.
- In `ℤ/4` with `I=J=(2)`, the canonical structure `(γ₂(2)=2)` and the square-zero structure (operation 0
  in degree 2) do not agree on `I∩J`, and no divided power structure on `(2)` restricts to both.

**Existence and uniqueness of the glued divided powers.** (1) Assume `γ` and `ε` agree on `I∩J` in every
degree. A divided power structure `θ` on `I+J` satisfies `θₙ=γₙ` on `I` and `θₙ=εₙ` on `J` for all `n` if and only
if `θ` is the glued structure of compatible-sum. (2) A divided power structure on `I+J` restricting to `γ`
on `I` and to `ε` on `J` exists if and only if `γₙ(w)=εₙ(w)` for all `n≥0` and all `w∈I∩J`; it is then unique.

Uniqueness is Mathlib's `DividedPowers.dpow_eq_from_gens` applied to the generating set `I ∪ J`.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J`; `γ` is a divided power structure on `I` and `ε`
a divided power structure on `J`. In part (1), `γₙ(w)=εₙ(w)` for every `n≥0` and every `w∈I∩J`; in part (2)
no agreement is assumed.

*Proof sketch.* Necessity is equality of the two restrictions at every element of the intersection.
Sufficiency is compatible-sum. For uniqueness, the addition law evaluates `θₙ(x+y)` as `Cₙ(x,y)`, which
also computes the glued operation; use `DividedPowers.ext`. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.5 (tag 07GQ),
statement, part (2), and last paragraph of the proof.) *Needs:* *Divided powers on a compatible sum
of ideals*; §PD.1 *Convolution of two divided-power systems*; Mathlib `DividedPowers.ext`.

**Checks.**

- If `I=J`, existence forces `γ=ε`.
- In `ℤ/4` with `I=J=(2)`: the canonical structure `(γ₂(2)=2)` and the square-zero structure (operation 0
  in degree 2) are two divided power structures on `(2)`, and no divided power structure on `(2)`
  restricts to both.

- For `J=0` there is exactly one common extension, namely `γ` on `I+0=I`.

**Gluing when intersection equals product.** If `I∩J=IJ`, then every divided power structure `γ` on `I`
and every divided power structure `ε` on `J` agree in every degree at every element of `I∩J`. Consequently
the glued structure of compatible-sum on `I+J` is defined for every such pair, and it is the unique
divided power structure on `I+J` restricting to `γ` on `I` and to `ε` on `J`.

*Hypotheses.* `A` is a commutative ring with ideals `I` and `J` such that `I∩J=IJ`; `γ` is a divided power
structure on `I` and `ε` a divided power structure on `J`.

*Proof sketch.* Rewrite `I∩J` as the ideal product `IJ` and apply `DividedPowers.coincide_on_smul`: two
divided power structures agree at every element of the product of their ideals. The glued structure
and its uniqueness are compatible-sum and sum-universal-property applied to this agreement. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.2.5 (tag 07GQ),
statement, parts (1) and (2); combined in this way in the proof of Lemma 23.5.1 (tag 07H5).)
*Needs:* §PD.1 *Existence and uniqueness of the glued divided powers*; *Divided powers on a compatible sum
of ideals*; Mathlib `DividedPowers.coincide_on_smul`.

**Checks.**

- In `Γ_R(M)` one has `IΓ∩Γ_R(M)₊=IΓ·Γ_R(M)₊` (gamma-base-ideal-intersection), so any divided power
  structures on `IΓ` and on `Γ_R(M)₊` agree on the intersection and glue.
- The hypothesis cannot be dropped: in `ℤ/4` with `I=J=(2)`, `I∩J=(2)` and `IJ=0`, and the canonical
  structure `(γ₂(2)=2)` and the square-zero structure (operation 0 in degree 2) differ at 2.

- For `J=0`, `I∩J=IJ=0` and the resulting glued structure on `I` is `γ`.


### PD.2 Extension along principal ideals, flat maps and localisation

**Uniqueness of extension to the generated ideal.** Let `f:A→B` and let `θ,θ′` be PD structures on
`IB=I.map(f)`. If `f` is a PD morphism from `γ` to both, then `θ=θ′`. No flatness or injectivity of `f` is
needed.

*Hypotheses.* `A` and `B` are commutative rings, `f:A→B` a ring map, `I⊂A` an ideal and `γ` a divided power
structure on `I`; `IB=I.map(f)` is the ideal of `B` generated by `f(I)`. `θ` and `θ′` are divided power
structures on `IB`, and `f` is a PD morphism from `(I,γ)` to `(IB,θ)` and to `(IB,θ′)`.

*Proof sketch.* Apply `DividedPowers.le_equalizer_of_isDPMorphism` with `K=IB`: every element of `IB` lies
in the ideal on which `θ` and `θ′` have equal operations. By `DividedPowers.mem_dpEqualizer_iff`, `θ` and `θ′`
have the same operation at every element of `IB` in every degree; conclude `θ=θ′` by `DividedPowers.ext`.
([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.4.2 (tag 07H1),
statement, first assertion, and first paragraph of the proof.) *Needs:* Mathlib
`DividedPowers.le_equalizer_of_isDPMorphism`; Mathlib `DividedPowers.mem_dpEqualizer_iff`; Mathlib
`DividedPowers.ext`; Mathlib `DividedPowers.IsDPMorphism`.

**Checks.**

- On `ℤ/4` the ideal `(2)` carries two divided power structures, one with `γ₂(2)=2` and the square-zero
  one with `γ₂(2)=0`; only the first makes `ℤ₂→ℤ/4` a PD morphism from `PadicInt.dividedPowers 2`, because
  the image of `γ₂(2)=2` is 2. So the uniqueness is of extensions of a fixed `γ`, not of divided power
  structures on `IB`.
- For `f=id`: a divided power structure `θ` on `I` with `θₙ=γₙ` on `I` for all `n` is `γ`.

- For `I=0`, `IB=0` and the only extension is `dividedPowersBot B`, even if `f` is neither injective nor flat.

**The principal extension formula is well defined.** If `I=(x)`, `γ` is a PD structure on `I` and `f:A→B`,
then `bⁿf(γₙ(x))=cⁿf(γₙ(x))` whenever `bf(x)=cf(x)`, for all `n≥0`.

*Hypotheses.* `A` and `B` are commutative rings, `f:A→B` a ring map, `x∈A`, `I=(x)` and `γ` a divided power
structure on `I`. `b,c∈B` with `b·f(x)=c·f(x)`; `n≥0`.

*Proof sketch.* At `n=0` both expressions equal one. For `n>0`, `γₙ(x)` lies in `(x)`; write `γₙ(x)=a x`. The
hypothesis says `(b−c)f(x)=0`. The polynomial `bⁿ−cⁿ` is divisible by `b−c`. Multiplying by `f(a)f(x)`
proves the claimed equality. This argument uses principal membership rather than division by `n!`, and
applies even when `f` has a kernel. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power
Algebra, Lemma 23.4.2 (tag 07H1), proof, second paragraph, the well-definedness computation for
`I=(x)`.) *Needs:* Mathlib `DividedPowers`.

**Checks.**

- `A=ℤ₂` with `PadicInt.dividedPowers 2`, `x=2`, `B=ℤ/4`, `b=1`, `c=3`: `b·2=c·2` in `ℤ/4`, and `b²·γ₂(2)=2` and
  `c²·γ₂(2)=18=2` in `ℤ/4`.
- For `n=0` both sides are 1.

- For `n=1`, the asserted equality is `bf(x)=cf(x)`, exactly the hypothesis.

**Extension of divided powers on a principal ideal.** For `I=(x)` and any ring map `f:A→B`, construct `γᴮ`
on `IB` by `γᴮₙ(bf(x))=bⁿf(γₙ(x))`, zero outside `IB`. It is the unique extension of `γ`; no flatness
hypothesis is imposed.

*Hypotheses.* `A` and `B` are commutative rings and `f:A→B` is any ring map. `x∈A`, `I=(x)`, and `γ` is a
divided power structure on `I`; `IB` is the ideal of `B` generated by `f(x)`.

The API:

- For every `b∈B` and every `n≥0`: `γᴮₙ(b·f(x))=bⁿ·f(γₙ(x))`.
- `f` is a PD morphism from `(I,γ)` to `(IB,γᴮ)`.
- If `I=(x)` and `I=(y)`, the structures on `IB` constructed
  from the generator `x` and from the generator `y` are equal.

*Proof sketch.* Every element of `IB` is bf(x); use principal-independence to descend the displayed
formula. For addition expand `(b+c)ⁿ` and use the multiplication identity for `γ` at `x`. Degrees
zero/one, ideal membership, scalar homogeneity and multiplication follow directly. For iteration
with `n>0` write `γₙ(x)=a x`. Then `γᴮₘ(γᴮₙ(bf(x)))=bⁿᵐ f(aᵐγₘ(x))`; apply homogeneity and the source
iteration identity to `a x`. For any `y∈I` write `y=a x` to verify the PD-morphism condition for `f`.
Uniqueness is extension-uniqueness. ([Stacks Project](https://stacks.math.columbia.edu), Divided
Power Algebra, Lemma 23.4.2 (tag 07H1), statement, condition (2), and proof, second paragraph.)
*Needs:* §PD.2 *The principal extension formula is well defined*; *Uniqueness of extension to the
generated ideal*; Mathlib `DividedPowers`; Mathlib `PadicInt.dividedPowers`.

**Checks.**

- `test_principal_identity`: For `B=A` and `f=id`: `γᴮₙ(z)=γₙ(z)` for every `z∈I` and every `n≥0`.
- `test_principal_zero`: For `I=0`, `x=0` and `γ=dividedPowersBot A`: `γᴮₙ(0)` equals the value at 0 of
  `dividedPowersBot B` in degree `n`, that is 1 for `n=0` and 0 for `n>0`.
- `test_principal_quadratic`: For every `b∈B`: `γᴮ₂(b·f(x))=b²·f(γ₂(x))`.
- `test_principal_p_two`: For `A=B=ℤ₂`, `f=id`, `x=2` and `γ=PadicInt.dividedPowers 2`: `γᴮ₂(2)=2`.
- Along `ℤ₂→ℤ/4` with `x=2` and `γ=PadicInt.dividedPowers 2` the extension has `γᴮ₂(2)=2`, `γᴮ₃(2)=0` and
  `γᴮ₄(2)=2` in `ℤ/4`, a ring in which `2ⁿ/n!` cannot be formed by division.
- Along the identity the extension is `γ`.

**The scalar-extension coefficient formula.** For `f:A→B`, `γ` on `I`, a finite list `x₁,…,xᵣ` in `A` and
coefficients `bᵢ∈B`, define `Eₙ(b,x)=Σₑ₁₊⋯₊ₑᵣ₌ₙ ∏ᵢ bᵢᵉⁱ f(γₑⁱ(xᵢ))`. It is a total finite formula. Its
PD interpretation assumes every `xᵢ∈I`. For `r=0` it is one at `n=0` and zero otherwise.

*Hypotheses.* `A` and `B` are commutative rings, `f:A→B` a ring map, `I⊂A` an ideal and `γ` a divided power
structure on `I`. `r≥0`, `n≥0`, `x₁,…,xᵣ∈A` and `b₁,…,bᵣ∈B`. The formula is defined for all `xᵢ∈A`; it computes
divided powers only when every `xᵢ` lies in `I`.

The API:

- `Eₙ` is the multiset-indexed finite sum without multinomial
  coefficients.
- For `r=1`, every `b∈B`, every `x∈A` and every `n≥0`: `Eₙ(b,x)=bⁿ·f(γₙ(x))`.
- For `n>0` and `xᵢ∈I` the coefficient lies in `IB`.
- If `θ` is a divided power structure on `IB` and `f` is a
  PD morphism from `(I,γ)` to `(IB,θ)`, then for all `x₁,…,xᵣ∈I`, all `b₁,…,bᵣ∈B` and all `n≥0`:
  `θₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x)`.

*Proof sketch.* Represent multiindices of total weight `n` by multisets of cardinality `n` on `Fin r`;
their multiplicities are the exponents. Take the finite product in `B` and sum over these multisets.
Each multiindex appears exactly once; there is no multinomial coefficient. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.4.2 (tag 07H1), proof,
flat case, first display.) *Needs:* Mathlib `DividedPowers`; Mathlib `DividedPowers.dpow_sum`;
Mathlib `DividedPowers.IsDPMorphism`.

**Checks.**

- `test_coefficient_empty_zero`: For `r=0`: `E₀=1`.
- `test_coefficient_empty_positive`: For `r=0`: `E₁=0`.
- `test_coefficient_quadratic`: For `r=2`, `x₀,x₁∈I` and `b₀,b₁∈B`:
  `E₂(b,x)=b₀²·f(γ₂(x₀))+b₀b₁·f(x₀x₁)+b₁²·f(γ₂(x₁))`.

**Invariance under a finite scalar substitution.** Let `aᵢⱼ∈A`, `cⱼ∈B` and `xᵢ∈I`. Put `bᵢ=Σⱼf(aᵢⱼ)cⱼ` and
`yⱼ=Σᵢaᵢⱼxᵢ`. Then `Eₙ(b,x)=Eₙ(c,y)` for every `n`, without a flatness assumption.

*Hypotheses.* `A` and `B` are commutative rings, `f:A→B` a ring map, `I⊂A` an ideal and `γ` a divided power
structure on `I`. `x₁,…,xᵣ∈I`, `aᵢⱼ∈A` for `1≤i≤r` and `1≤j≤s`, `c₁,…,cₛ∈B`; `bᵢ=Σⱼf(aᵢⱼ)cⱼ` and `yⱼ=Σᵢaᵢⱼxᵢ`; `n≥0`.

*Proof sketch.* Expand `γ_d(yⱼ)` by `DividedPowers.dpow_sum` and homogeneity: `γ_d(Σᵢaᵢⱼxᵢ)` is the sum,
over `(m₁ⱼ,…,mᵣⱼ)` of total `d`, of `∏ᵢaᵢⱼ^{mᵢⱼ}γ_{mᵢⱼ}(xᵢ)`. Expand each power `bᵢ^e=(Σⱼf(aᵢⱼ)cⱼ)^e` by the
multinomial theorem (`Finset.sum_pow_eq_sum_piAntidiag`). Both sides become sums over matrices `m=(mᵢⱼ)`
of non-negative integers with total sum `n`. On the right, reduce `∏ⱼγ_{mᵢⱼ}(xᵢ)` to
`multinomial(mᵢ₁,…,mᵢₛ)·γ_{eᵢ}(xᵢ)`, `eᵢ=Σⱼmᵢⱼ`, by `DividedPowers.prod_dpow`. For every matrix `m` both
sides have the coefficient `∏ᵢmultinomial(mᵢ₁,…,mᵢₛ)` on `∏ᵢⱼ(f(aᵢⱼ)cⱼ)^{mᵢⱼ}·∏ᵢf(γ_{eᵢ}(xᵢ))`: on the
left from the multinomial theorem, on the right from `prod_dpow`. The two sums agree term by term.
([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.4.2 (tag 07H1),
proof, flat case, the claim introduced by "Next suppose that".) *Needs:* *The scalar-extension
coefficient formula*; Mathlib `DividedPowers`; Mathlib `DividedPowers.dpow_sum`; Mathlib
`DividedPowers.prod_dpow`; Mathlib `Finset.sum_pow_eq_sum_piAntidiag`.

**Checks.**

- For `r=1`, `s=2`: `(f(a₁)c₁+f(a₂)c₂)ⁿ·f(γₙ(x))=Σ_{d₁+d₂=n}c₁^{d₁}c₂^{d₂}·f(γ_{d₁}(a₁x)γ_{d₂}(a₂x))`,
  which is the binomial theorem together with `γ_{d₁}(x)γ_{d₂}(x)=choose(n,d₁)·γₙ(x)`.
- For `r=2`, `s=1`: `Σ_{e₁+e₂=n}(f(a₁)c)^{e₁}(f(a₂)c)^{e₂}·f(γ_{e₁}(x₁)γ_{e₂}(x₂))=cⁿ·f(γₙ(a₁x₁+a₂x₂))`,
  which is the addition law of `γ`.

- For `n=1` both coefficient expressions equal `Σᵢⱼf(aᵢⱼ)cⱼf(xᵢ)`; the substitution preserves the linear term.

**Independence of the expression over a flat algebra.** For a flat `A`-algebra `B` and `xᵢ,x′ⱼ∈I`,
equality `Σbᵢxᵢ=Σb′ⱼx′ⱼ` in `B` implies `Eₙ(b,x)=Eₙ(b′,x′)` for every `n`.

*Hypotheses.* `A` is a commutative ring, `B` a flat commutative `A`-algebra with structure map `f:A→B`, `I⊂A`
an ideal and `γ` a divided power structure on `I`; `IB` is the ideal of `B` generated by `f(I)`.
`x₁,…,xᵣ,x′₁,…,x′ₛ∈I` and `b₁,…,bᵣ,b′₁,…,b′ₛ∈B` with `Σᵢbᵢf(xᵢ)=Σⱼb′ⱼf(x′ⱼ)` in `B`; `n≥0`.

*Proof sketch.* Apply the equational criterion of flatness
(`Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`) to the combined relation with coefficients `xᵢ`
and `−x′ⱼ`, and module elements `bᵢ` and `b′ⱼ`. It expresses both coefficient families in common elements
`cₖ` with matrices `aᵢₖ,a′ⱼₖ`. For each `k` the relation gives `Σaᵢₖxᵢ=Σa′ⱼₖx′ⱼ` inside `A`. These common
elements lie in `I`. Apply coefficient-substitution to both sides. They become the same coefficient
formula on the common list. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power
Algebra, Lemma 23.4.2 (tag 07H1), proof, flat case, footnote.) *Needs:* *Invariance under a finite
scalar substitution*; Mathlib `Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`.

**Checks.**

- Flatness cannot be dropped: for `A=𝔽₂⟨t⟩` with `I=A₊` and its divided powers `(γ₂(t)=t^[2])` and
  `B=A/(t)`, the element `t` maps to 0 but `t^[2]` does not, because the ideal `(t)` is spanned by the `t^[m]`
  with `m` odd; so `E₂(1;t)≠0=E₂` of the empty presentation of 0.
- For `B=A` and `f=id` both sides are `γₙ(Σbᵢxᵢ)`, by the addition and homogeneity laws of `γ`.

- For `n=1`, `E₁(b,x)=Σᵢbᵢf(xᵢ)`, so equality is exactly equality of the two presentations.

**The additive candidate on a flat extension.** For `B` flat over `A`, define the candidate on `IB` by
`δₙ(z)=Eₙ(b,x)` for any finite presentation `z=Σbᵢ·f(xᵢ)` with `xᵢ∈I` and `bᵢ∈B`; set it to zero outside `IB`.

*Hypotheses.* `A` is a commutative ring, `B` a flat commutative `A`-algebra with structure map `f:A→B`, `I⊂A`
an ideal and `γ` a divided power structure on `I`; `IB` is the ideal of `B` generated by `f(I)`.

The API:

- For `x₁,…,xᵣ∈I`, `b₁,…,bᵣ∈B` and `n≥0`: `δₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x)`.
- For `x∈I` and every `n≥0`: `δₙ(f(x))=f(γₙ(x))`.
- For `z∉IB` and every `n≥0`: `δₙ(z)=0`.

*Proof sketch.* Membership in the generated ideal supplies a finite presentation.
Flat-presentation-independence proves choice independence. At `n=0`, every `γ₀(xᵢ)=1` so the sole
zero-weight multiindex gives one. At `n=1` the coefficient is `z`; positive coefficients lie in `IB`.
Concatenate two presentations to prove addition: splitting a multiset between the two disjoint
finite index sets gives the antidiagonal sum. For homogeneity multiply each `bᵢ` by `a`; total weight `n`
gives the factor `aⁿ`. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra,
Lemma 23.4.2 (tag 07H1), proof, flat case, last paragraph.) *Needs:* *Additive divided-power
candidates*; §PD.2 *The scalar-extension coefficient formula*; *Independence of the expression over a flat
algebra*.

**Checks.**

- `test_flatCandidate_zero`: `δ₀(0)=1`.
- `test_flatCandidate_scalar`: For `b∈B`, `x∈I` and `n≥0`: `δₙ(b·f(x))=bⁿ·f(γₙ(x))`.
- `test_flatCandidate_quadratic`: For `x,y∈I`: `δ₂(f(x)+f(y))=f(γ₂(x)+xy+γ₂(y))`.
- For `B=A` and `f=id` the candidate is the candidate of `γ`.

**The flat candidate preserves the base operations.** For `x∈I` and every `n`, the flat candidate has
`δₙ(f(x))=f(γₙ(x))`. In particular multiplication and iteration hold on the generating subset `f(I)` of
`IB`.

*Hypotheses.* `A` is a commutative ring, `B` a flat commutative `A`-algebra with structure map `f:A→B`, `I⊂A`
an ideal and `γ` a divided power structure on `I`; `IB` is the ideal of `B` generated by `f(I)`. `x∈I` and `n≥0`.

*Proof sketch.* Use the singleton presentation `f(x)=1·f(x)` in the flat-candidate formula. For
multiplication apply `f` to the corresponding `γ` identity. For iteration with positive inner degree,
`γₙ(x)` is again in `I` so apply the formula twice. ([Stacks Project](https://stacks.math.columbia.edu),
Divided Power Algebra, Lemma 23.4.2 (tag 07H1), proof, flat case, last paragraph.) *Needs:* *The
additive candidate on a flat extension*; §PD.2 *The scalar-extension coefficient formula*; Mathlib
`DividedPowers`.

**Checks.**

- `δₙ(f(0))` is 1 for `n=0` and 0 for `n>0`.
- For `x∈I`: `δ₂(f(x))·δ₁(f(x))=3·δ₃(f(x))`, the image of `γ₂(x)γ₁(x)=3γ₃(x)`.

- For `x∈I` and `n=1`, `δ₁(f(x))=f(x)`, so the candidate preserves the base linear term.

**Flat extension of divided powers.** If `B` is a flat `A`-algebra, construct the unique PD structure `γᴮ`
on `IB` for which `A→B` is a PD morphism. Its operation on a finite expression `Σᵢbᵢ·f(xᵢ)` with `xᵢ∈I` and
`bᵢ∈B` is `Eₙ(b,x)`.

*Hypotheses.* `A` is a commutative ring, `B` a flat commutative `A`-algebra with structure map `f:A→B`, `I⊂A`
an ideal and `γ` a divided power structure on `I`; `IB` is the ideal of `B` generated by `f(I)`.

The API:

- For `x₁,…,xᵣ∈I`, `b₁,…,bᵣ∈B` and `n≥0`: `γᴮₙ(Σᵢbᵢ·f(xᵢ))=Eₙ(b,x)`.
- `f` is a PD morphism from `(I,γ)` to `(IB,γᴮ)`.
- If `θ` is a divided power structure on `IB` and `f` is a PD morphism from `(I,γ)`
  to `(IB,θ)`, then `θ=γᴮ`.
- Let `g:B→C` be a ring map and `κ` a divided power structure on an
  ideal `K` of `C`. Then `g` is a PD morphism from `(IB,γᴮ)` to `(K,κ)` if and only if `g∘f` is a PD morphism
  from `(I,γ)` to `(K,κ)`.
- Let `B` be a flat `A`-algebra and `C` a flat `B`-algebra. Then `C` is a flat
  `A`-algebra, `(IB)C=IC`, and the extension of `γᴮ` along `B→C` is equal to the extension of `γ` along `A→C`.
- If the structure map `f:A→B` is bijective, with associated ring
  isomorphism `e`, then `γᴮ` is `DividedPowers.ofRingEquiv` applied to `γ` along `e`: `γᴮₙ(e(x))=e(γₙ(x))` for
  all `x∈A` and all `n≥0`.

*Proof sketch.* The image of `I` generates `IB`. Apply the generator criterion to the flat candidate
using this generating set. Flat-candidate-base transfers the multiplication and iteration identities
on generators from `γ`. Apply extension-uniqueness to identify all possible extensions. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Lemma 23.4.2 (tag 07H1),
statement, condition (3), and proof, flat case.) *Needs:* *Divided powers from identities on
generators*; §PD.2 *The additive candidate on a flat extension*; *The flat candidate preserves the base
operations*; §PD.2 *Uniqueness of extension to the generated ideal*; Mathlib `DividedPowers.IsDPMorphism`;
Mathlib `DividedPowers.IsDPMorphism.of_comp`; Mathlib `DividedPowers.ofRingEquiv`.

**Checks.**

- `test_flat_identity`: For `B=A` and `f=id`: `γᴮₙ(x)=γₙ(x)` for every `n≥0` and every `x∈A`.
- `test_flat_principal`: If `I=(x)`, then `γᴮ` is equal to the principal extension of `γ` along `f`
  constructed from the generator `x`.
- `test_flat_quadratic`: For `b,c∈B` and `x,y∈I`: `γᴮ₂(b·f(x)+c·f(y))=b²·f(γ₂(x))+bc·f(xy)+c²·f(γ₂(y))`.
- `test_flat_equiv`: For a ring isomorphism `e:A→B`, taken as the structure map of the flat `A`-algebra
  `B`: `γᴮₙ(e(x))=e(γₙ(x))` for every `x∈A` and every `n≥0`; for `x∉I` both sides are 0.
- For `A=ℤ_p`, `I=(p)` with `PadicInt.dividedPowers p` and `B=ℤ_p[T]`: `γᴮₙ(p·g)=(pⁿ/n!)·gⁿ` for every
  `g∈ℤ_p[T]`.
- Along a ring isomorphism the extension is Mathlib's `DividedPowers.ofRingEquiv`.
- When `I` is principal the extension equals the principal extension.

**The base map preserves flatly extended divided powers.** The algebra map `A→B` is a PD morphism, `DividedPowers.IsDPMorphism`, from
`(I,γ)` to `(IB,γᴮ)`. Consequently it evaluates `γᴮₙ` on every base image in all degrees.

*Hypotheses.* `A` is a commutative ring, `B` a flat commutative `A`-algebra with structure map `f:A→B`, `I⊂A`
an ideal and `γ` a divided power structure on `I`; `IB` is the ideal of `B` generated by `f(I)`.

*Proof sketch.* The extended ideal condition is equality by definition. Use flat-candidate-base and
the unchanged-operation API of the generator criterion. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Definition 23.4.1 (tag 07H0),
applied to the extension of Lemma 23.4.2 (tag 07H1), condition (3).) *Needs:* *Flat extension of
divided powers*; §PD.2 *The flat candidate preserves the base operations*; *Divided powers from identities
on generators*.

**Checks.**

- For `x∈I` and every `n`: `γᴮₙ(f(x))=f(γₙ(x))`; in particular `γᴮ₀(f(x))=1`.
- For `B=A` and `f=id` the statement is that the identity is a PD morphism of `(I,γ)`.

- For `I=0` the base map is a PD morphism between zero PD ideals, including degree zero at 0.

**Divided powers after localization.** Let `S⊂A` be multiplicative, `B=S⁻¹A` and `γ` on `I`. The unique
extension to `IB` exists by flatness, and `γᴮₙ(x/s)=γₙ(x)/sⁿ` for `x∈I`, `s∈S`, `n≥0`.

*Hypotheses.* `A` is a commutative ring, `S⊂A` a multiplicative subset, `B` a localization of `A` at `S`, `I⊂A`
an ideal and `γ` a divided power structure on `I`. `x∈I`, `s∈S` and `n≥0`.

*Proof sketch.* `B` is flat over `A` by `IsLocalization.flat`, so flat-extension applies. Write
`x/s=(1/s)f(x)`. Apply scalar homogeneity and flat-extension-map. The displayed denominator is `sⁿ`,
including denominator one in degree zero. ([Stacks Project](https://stacks.math.columbia.edu),
Divided Power Algebra, Lemma 23.4.2 (tag 07H1), statement, condition (3).) *Needs:* *Flat extension
of divided powers*; §PD.2 *The base map preserves flatly extended divided powers*; Mathlib
`IsLocalization.flat`; Mathlib `DividedPowers`; Mathlib `IsLocalization.mk'`.

**Checks.**

- For `n=0`, `x=0` and `s=1` both sides are 1.
- For `A=ℤ₂` with `PadicInt.dividedPowers 2` on `I=(2)` and `S` the powers of 2: `B=ℚ₂`, `IB` is the unit ideal,
  and `γᴮₙ(x/2ᵏ)=γₙ(x)/2^{kn}=(x/2ᵏ)ⁿ/n!`, the only divided power structure on an ideal of a
  `ℚ`-algebra.
- When `I` is principal, `γᴮ` is the principal extension of `γ` along `A→S⁻¹A`.

### PD.4 The divided power filtration and PD nilpotence

**Divided power filtration.** For `n≥0` define `Fⁿ_γI`, also denoted `I^[n]`, as the ideal generated by
all finite products `γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ)`, where `xⱼ∈I`, `eⱼ≥0` and `∑eⱼ≥n`. Include the empty product
with total degree zero. Thus the convention at `n=0` is intrinsic to the same formula. The carrier is
`Ideal R` and the operations are those of the given `DividedPowers I`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `n` and the weights `e_j` are natural numbers, the `x_j` are elements of `I`, and the
empty product (value 1, weight 0) is allowed.

The API:

- For any ideal `K` of `R`, `Fⁿ_γI⊆K` if and only if every finite weighted
  product of total degree at least `n` belongs to `K`.
- For `xⱼ∈I` and natural weights `eⱼ` whose sum is at least `n`, the
  product `∏ⱼγ_(eⱼ)(xⱼ)` belongs to `Fⁿ_γI`, including the empty word when `n=0`.
- For `x∈I` and `n≥0`, `γ_n(x)` belongs to `Fⁿ_γI`.
- If `I=Ideal.span(S)`, then `Fⁿ_γI` is the ideal generated by the
  finite products `∏_j γ_(e_j)(s_j)` with `s_j∈S` and `Σ_j e_j≥n`.

*Proof sketch.* Let `W_n` be the set of all products `γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ)` over finite lists of pairs
`(e_j,x_j)` with `x_j∈I` and `Σe_j≥n`. Put `Fⁿ_γI=Ideal.span(W_n)`. `Ideal.span_le` gives the containment
criterion `Fⁿ_γI⊆K ⇔ W_n⊆K`; `Ideal.subset_span` gives membership of every word; the one-term list `(n,x)`
gives `γ_n(x)∈Fⁿ_γI`. A factor of weight 0 equals `γ₀(x)=1` and can be deleted without changing the
product or the total weight. Generators: if `I=Ideal.span(S)`, expand each factor `γ_e(x)` with `x=Σa_i s_i` by `DividedPowers.dpow_sum` and the scalar rule `γ_e(a s)=a^e γ_e(s)` into an `R`-combination of
products of `γ_(e′)(s)`, `s∈S`, of the same total weight; hence `Fⁿ_γI` is generated by the words with all
`x_j∈S`. Examples: for the zero ideal a word of positive weight has a factor `γ_e(0)` with `e>0`, which is
0 (`DividedPowers.dpow_eval_zero`). In `ℤ₂`, `PadicInt.coe_dpow_eq` gives `γ₂(2)=2²/2!=2`, and `2∉(2)²=(4)` by
`Ideal.span_singleton_pow`, `PadicInt.mem_span_pow_iff_le_valuation` and `PadicInt.valuation_p`. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.6 (07HQ), unnumbered
paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).) *Needs:* Mathlib `DividedPowers`;
Mathlib `Ideal.span`; Mathlib `Ideal.span_le`; Mathlib `Ideal.subset_span`; Mathlib
`dividedPowersBot`; Mathlib `DividedPowers.dpow_eval_zero`; Mathlib `DividedPowers.dpow_sum`;
Mathlib `PadicInt.dividedPowers`; Mathlib `PadicInt.coe_dpow_eq`; Mathlib `PadicInt.valuation_p`;
Mathlib `PadicInt.mem_span_pow_iff_le_valuation`; Mathlib `Ideal.span_singleton_pow`.

**Checks.**

- `pd_filtration_empty_word`: For the zero ideal with the divided power structure `dividedPowersBot`,
  `F⁰(0)=R`: the empty word supplies 1.
- `pd_filtration_zero_ideal`: For the zero ideal with `dividedPowersBot` and every `n>0`, `Fⁿ(0)=0`,
  because a word of positive total weight has a positive-weight factor evaluated at zero.
- `pd_filtration_two_adic_counterexample`: For `R=ℤ₂`, `I=(2)` and the canonical `PadicInt.dividedPowers 2`, the element 2 lies in `F²I` but not in `I²`. Indeed `γ₂(2)=2` and `v₂(2)=1<2`.
- `pd_filtration_two_adic_constant`: For `R=ℤ₂`, `I=(2)` and `γ=PadicInt.dividedPowers 2`: `Fⁿ_γI=(2)` for
  every `n≥1`.
- `F⁰_γI=R` and `F¹_γI=I` for every `(I,γ)`; for the zero ideal `Fⁿ=0` for all `n≥1`.
- For `I=(2)⊂ℤ₂` with the divided powers `PadicInt.dividedPowers 2`: `γ₂(2)=2` lies in `F²` but not in
  `I²=(4)`; more precisely `Fⁿ=(2)` for every `n≥1`, because `γ_(2^a)(2)=2^(2^a)/(2^a)!` has 2-adic
  valuation 1.

**Zeroth divided power filtration step.** For every divided-power ideal `(I,γ)`, `F⁰_γI=R`, as an
equality of ideals.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`).

*Proof sketch.* The empty list has weight zero and product 1, so `Ideal.subset_span` puts 1 in `F⁰_γI`.
Apply `Ideal.eq_top_iff_one`. This proof also covers the zero ring. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.6 (07HQ), unnumbered
paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).) *Needs:* §PD.4 *Divided power filtration*;
Mathlib `Ideal.subset_span`; Mathlib `Ideal.eq_top_iff_one`.

**Checks.**

- For the zero ideal of a non-zero ring `R`: `F⁰=R≠0`, while `Fⁿ=0` for `n≥1`.

- For `R=ℚ[x]` and `I=(x)`, the empty word puts 1 in `F⁰` even though `1∉I`.

- For the zero ring, `F⁰` is its unit ideal, which also equals its zero ideal.

**First divided power filtration step.** For every divided-power ideal `(I,γ)`, `F¹_γI=I`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`).

*Proof sketch.* A list of total weight at least one has a term with `eⱼ>0`. The field
`DividedPowers.dpow_mem` puts `γ_(eⱼ)(xⱼ)` in `I`, and multiplying by the other factors stays in `I`. Apply
`Ideal.span_le`. For `x∈I` the singleton list `(1,x)` generates `γ₁(x)=x`, by `DividedPowers.dpow_one` and
`Ideal.subset_span`. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).)
*Needs:* §PD.4 *Divided power filtration*; Mathlib `DividedPowers`; Mathlib `Ideal.span_le`; Mathlib
`Ideal.subset_span`.

**Checks.**

- For `I=(2)⊂ℤ₂` with its canonical divided powers `F¹=(2)`; for the zero ideal `F¹=0`.

- For `R=ℚ[x]` and `I=(x)`, `F¹=(x)`; the scalar 1 is outside `F¹`.

- For a rational algebra and the unit ideal with its rational divided powers, `F¹=R`.

**Decreasing divided power filtration.** The function `n↦Fⁿ_γI` is antitone: if `n≤m`, then `Fᵐ_γI⊆Fⁿ_γI`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`).

*Proof sketch.* A word of total weight at least `m` also has total weight at least `n`. Apply
`Ideal.span_mono` to the inclusion of generating sets. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.6 (07HQ), unnumbered
paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).) *Needs:* §PD.4 *Divided power filtration*;
Mathlib `Ideal.span_mono`.

**Checks.**

- For `I=(2)⊂ℤ₂`: `F⁰=ℤ₂⊋F¹=(2)`, and `Fⁿ=(2)` for all `n≥1`, so the filtration need not be strictly
  decreasing.
- For the zero ideal: `F⁰=R⊇F¹=0`.

- For `R=ℚ[x]` and `I=(x)`, `F²=(x²)⊊F¹=(x)`, so a reverse inclusion would fail.

**Multiplicativity of divided power filtration.** For all `m,n≥0`, `(Fᵐ_γI)(Fⁿ_γI)⊆F^(m+n)_γI`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `m` and `n` are natural numbers.

*Proof sketch.* Use `Ideal.span_mul_span` to reduce the product of generated ideals to pairwise
products of generating words. Concatenate the two finite lists. Its total weight is the sum of the
weights and its value is the product of the two values. `Ideal.subset_span` puts this concatenated
word in `F^(m+n)_γI`; `Ideal.span_le` completes the inclusion. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.6 (07HQ), unnumbered
paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).) *Needs:* §PD.4 *Divided power filtration*;
Mathlib `Ideal.span_mul_span`; Mathlib `Ideal.span_le`; Mathlib `Ideal.subset_span`.

**Checks.**

- For `I=(2)⊂ℤ₂` with its canonical divided powers: `F¹·F¹=(4)⊊F²=(2)`, so the inclusion can be strict.

- When `m=0`, `F⁰Fⁿ=RFⁿ=Fⁿ`, so the inclusion is equality.

- For `R=ℚ[x]` and `I=(x)`, `FᵐFⁿ=(x^(m+n))=F^(m+n)`.

**Ordinary powers inside divided powers.** For every `n≥0`, `Iⁿ⊆Fⁿ_γI`, with the usual ideal power on
the left.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`).

*Proof sketch.* Induct on `n`. The base case is `pdFiltration_zero` and `I⁰=R`. For the successor multiply
the induction inclusion by `I=F¹_γI` using `pdFiltration_one`. Apply pdFiltration_mul and the ordinary
ideal-power recursion. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).)
*Needs:* §PD.4 *Zeroth divided power filtration step*; §PD.4 *First divided power filtration step*;
§PD.4 *Multiplicativity of divided power filtration*.

**Checks.**

- For the canonical divided powers on `(2)` in `ℤ₂` the `n=2` inclusion is strict.

- At `n=0` both ideals are `R`, including for the zero ideal.

- For `R=ℚ[x]` and `I=(x)`, the inclusion at `n=2` is equality `(x²)=F²`.

**Divided power maps preserve filtration.** Let `f:R→S` be a ring homomorphism, `J` an ideal of `S` and `δ`
a divided-power structure on `J`. If `f` is a divided-power morphism from `(I,γ)` to `(J,δ)`, then
`f(Fⁿ_γI)S⊆Fⁿ_δJ` for every `n≥0`, where the left side is `Ideal.map`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `S` is a commutative ring, `J` an ideal of `S` and `δ` a divided power structure on `J`;
`f:R→S` is a ring homomorphism that is a divided power morphism from `(I,γ)` to `(J,δ)`
(`DividedPowers.IsDPMorphism γ δ f`).

*Proof sketch.* Use `Ideal.map_span` and `Ideal.span_le` to test images of generating words. The
defining ideal-containment condition sends every `xⱼ∈I` into `J`. `DividedPowers.IsDPMorphism.map_dpow`
and multiplicativity of `f` identify the image with the word of the same weights in `J`. Apply
`Ideal.subset_span`. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).)
*Needs:* §PD.4 *Divided power filtration*; Mathlib `DividedPowers.IsDPMorphism`; Mathlib
`DividedPowers.IsDPMorphism.map_dpow`; Mathlib `Ideal.map_span`; Mathlib `Ideal.span_le`; Mathlib
`Ideal.subset_span`.

**Checks.**

- For the identity of `R` viewed as a divided power morphism from `(0,dividedPowersBot)` to `(I,γ)`, the
  inclusion reads `Fⁿ(0)=0⊆Fⁿ_γI` for `n≥1`; it is strict for `n=1` when `I≠0`.

- For the identity PD morphism of `(I,γ)`, the image of `Fⁿ` is exactly `Fⁿ` for every `n`.

- At `n=0`, any unital PD ring map sends the unit ideal to the unit ideal.

**Divided power filtrations under ideal-generating maps.** Let `f:(R,I,γ)→(S,J,δ)` be a divided power
morphism with `I.map(f)=J`. Then `(Fⁿ_γI).map(f)=Fⁿ_δJ` for every `n≥0`. The ring map need not be
surjective.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `S` is a commutative ring, `J` an ideal of `S` and `δ` a divided power structure on `J`;
`f:R→S` is a ring homomorphism that is a divided power morphism from `(I,γ)` to `(J,δ)`
(`DividedPowers.IsDPMorphism γ δ f`). `I.map(f)=J`; no surjectivity hypothesis on `f`.

*Proof sketch.* The inclusion from left to right is pd-filtration-map. Every `y∈J` is a finite sum `Σ a_i f(x_i)`, with `a_i∈S` and `x_i∈I`. Apply the divided-power addition and scalar axioms to `δ_e(y)`: its
summands are products `∏ a_i^{e_i} f(γ_{e_i}(x_i))` with `Σ e_i=e`. Terms of exponent zero contribute 1.
Expand every factor of a generating word of `Fⁿ_δJ` in this way. Each resulting summand is an
`S`-multiple of the image of a word in the `γ_{e_i}(x_i)`, of the same total weight `≥n`. Thus it belongs
to `Ideal.map f (Fⁿ_γI)`. `Ideal.span_le` gives the reverse inclusion; degree zero is immediate.
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.6 (07HQ),
unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).) *Needs:* *Divided power
maps preserve filtration*; Mathlib `DividedPowers.IsDPMorphism.map_dpow`; Mathlib `Ideal.map_span`;
Mathlib `Ideal.span_le`; Mathlib `Ideal.subset_span`.

**Checks.**

- For the quotient map `ℤ₂→ℤ/4` and the canonical divided powers on `(2)`, with the induced ones on
  `(2)⊂ℤ/4`: the image of `Fⁿ((2))=(2)` is `(2)=Fⁿ((2)⊂ℤ/4)` for all `n≥1`.
- The hypothesis `I.map(f)=J` is needed: for the identity of `R` from `(0,dividedPowersBot)` to `(I,γ)` with
  `I≠0` the image of `F¹(0)=0` is not `F¹_γI=I`.
- For the non-surjective inclusion `ℤ_(p)→ℤ_(p)[t]` and the canonical divided powers on `(p)`, the image
  ideal of every PD filtration level equals that level on `(p)⊂ℤ_(p)[t]`; the coefficients `t` in sums
  are handled by the scalar axiom.

**Rational divided powers equal ordinary powers.** If `R` is a `ℚ`-algebra, then for every ideal `I`,
every divided-power structure `γ` on `I` and `n≥0`, `Fⁿ_γI=Iⁿ`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `R` is a `ℚ`-algebra.

*Proof sketch.* For `x∈I`, `DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul` gives `γ_e(x)=(1/e!)xᵉ`,
including `e=0`. By `Ideal.pow_mem_pow`, `xᵉ` belongs to `Iᵉ`. Multiplication by the rational scalar
preserves that ideal. Induction on word length places each product of weight `w` in Iʷ. For `w≥n`,
`Ideal.pow_le_pow_right` gives `Iʷ⊆Iⁿ`. `Ideal.span_le` yields `Fⁿ_γI⊆Iⁿ`. The reverse inclusion is
pd-filtration-ordinary-powers. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3
(07HT).) *Needs:* §PD.4 *Ordinary powers inside divided powers*; Mathlib
`DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul`; Mathlib `Ideal.pow_mem_pow`; Mathlib
`Ideal.pow_le_pow_right`; Mathlib `Ideal.span_le`.

**Checks.**

- For `R=ℚ[x]`, `I=(x)`: `Fⁿ_γI=(xⁿ)`.
- For `I=(2)⊂ℤ₂`, which is not a `ℚ`-algebra, `F²=(2)≠I²=(4)`.

- For `I=0` over a nonzero rational algebra, `F⁰=R` and `Fⁿ=0` for `n>0`, matching the ordinary powers.

**PD-nilpotent divided power ideals and ordinary nilpotence.** A divided power ideal `(I,γ)` of a
commutative ring `R` is PD-nilpotent if `Fⁿ_γI=0` for some `n≥1`. Relation to the ordinary notions of
Mathlib: PD-nilpotent `⇒ IsNilpotent I` (`Iᴺ=0` for some `N`; `N=n` works because `Iⁿ⊆Fⁿ_γI`) `⇒ I≤nilradical R`
(every element of `I` is nilpotent). Neither implication is an equivalence: `(2)⊂ℤ/4` with the divided
powers induced from `ℤ₂` satisfies `(2)²=0` and is not PD-nilpotent; the augmentation ideal of `𝔽_p⟨x⟩`
lies in the nilradical (`y^p=p!·γ_p(y)=0`) and is not nilpotent. If `p` is a prime that is nilpotent in
`R/I`, then `I≤nilradical R` if and only if `p` is nilpotent in `R`.

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). In the last sentence `p` is a prime number and some power of `p` lies in `I`.

The API:

- `Crystalline.pdNilpotent_iff`: PD nilpotent iff `FⁿI=0` for some `n>0`.
- `Crystalline.pdNilpotent_ordinary`: If `Fⁿ_γI=0` with `n≥1` then `Iⁿ=0`; in particular a PD-nilpotent
  ideal `I` satisfies `IsNilpotent I`.
- `Crystalline.pdNilpotent_map`: If `f:R→S` is a surjective divided power morphism from `(I,γ)` to `(J,δ)`
  with `I.map(f)=J` and `(I,γ)` is PD-nilpotent, then `(J,δ)` is PD-nilpotent.
- `Crystalline.pdIdeal_le_nilradical_iff`: Let `(I,γ)` be a divided power ideal of `R` and `p` a prime
  nilpotent in `R/I`. Then `I≤nilradical R` if and only if `p` is nilpotent in `R`.

*Proof sketch.* Define `IsPDNilpotent γ` as: there is `n≥1` with `Fⁿ_γI=0`. If `Fⁿ_γI=0` then `Iⁿ⊆Fⁿ_γI=0`
(pd-filtration-ordinary-powers), so `IsNilpotent I`. If `Iᴺ=0` then `xᴺ=0` for `x∈I`, so `I≤nilradical R`.
Criterion. Let `p^r∈I`. If `p^N=0` in `R`, then for `x∈I`, `x^(pN)=(pN)!·γ_(pN)(x)=0`
(`DividedPowers.factorial_mul_dpow_eq_pow`; `p^N` divides `(pN)!`), so `I≤nilradical R`. Conversely, if
`I≤nilradical R` then `p^r` is nilpotent, hence so is `p`. Examples. On `(2)⊂ℤ/4` the divided powers induced
from `PadicInt.dividedPowers 2` have `γ_(2^a)(2)=2` for all `a≥0`, because the 2-adic valuation of `2ⁿ/n!`
is the binary digit sum of `n`; so no `Fⁿ` vanishes although `(2)²=0`. In `𝔽_p⟨x⟩` the product
`x^[1]·x^[p]⋯x^[p^k]` is a unit multiple of `x^[1+p+…+p^k]` for every `k`, so no power of the augmentation
ideal vanishes. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section
60.5 (07HL): Definition 60.5.2 (07HM) and the sentence after it; Section 60.7 (07I1): the
observation before Situation 60.7.5 (07MF); [Stacks Project](https://stacks.math.columbia.edu),
Divided Power Algebra, Section 23.2, Lemma 23.2.6 (tag 07GR) with proof.) *Needs:* *Divided power
filtration*; §PD.4 *Ordinary powers inside divided powers*; *Divided power filtrations under
ideal-generating maps*; §PD.4 *Rational divided powers equal ordinary powers*; Mathlib
`PadicInt.dividedPowers`; Mathlib `IsNilpotent`; Mathlib `nilradical`; Mathlib
`DividedPowers.factorial_mul_dpow_eq_pow`; Mathlib `DividedPowers.OfSquareZero.dividedPowers`.

**Checks.**

- `test_nilpotent_zero`: The zero PD ideal is PD nilpotent with bound1.
- `test_nilpotent_q`: For a rational algebra PD nilpotence equals ordinary ideal nilpotence.
- `test_nilpotent_two`: In `ℤ/4` with the canonical 2-PD structure, `(2)²=0` but `γ_(2^a)(2)` is twice an
  odd unit for every `a≥0`, so the PD ideal is not PD nilpotent.
- `test_nilpotent_two_structures`: On the ideal `(2)` of `ℤ/4`, which has square zero, the divided power
  structure with `γ_n=0` for `n≥2` (`DividedPowers.OfSquareZero.dividedPowers`) is PD-nilpotent with `F²=0`,
  whereas the structure induced from `ℤ₂`, with `γ₂(2)=2`, is not PD-nilpotent.
- `test_nilpotent_mod_p_power`: For `e≥1` and the divided powers on `(p)⊂ℤ/p^e` induced from the
  canonical ones on `(p)⊂ℤ_(p)`: the ideal is PD-nilpotent if and only if `p` is odd or `e=1`.

### PD.5 Compatibility with a base, canonical divided powers and square-zero thickenings

**Canonical divided powers on the ideal generated by `p`.** Let `p` be a prime and `A` a commutative ring
in which every integer not divisible by `p` is invertible; equivalently, `A` is a `ℤ₍p₎`-algebra, in a
unique way. Construct the divided power structure `γ` on the ideal `pA` with `γₙ(p·a)=cₙ·aⁿ` for all `a∈A`
and `n≥0`, where `c₀=1` and, for `n≥1`, `cₙ` is the image in `A` of `pⁿ/n!`, an element of `pℤ₍p₎`. It is the
unique extension to `pA` of the divided power structure `x↦xⁿ/n!` on `pℤ₍p₎`, and the only divided power
structure on `pA` with `γₙ(p)=cₙ` for all `n≥1`. Every ring map between two such rings is a PD morphism
for these structures, and for `A=ℤ_p` the structure is `PadicInt.dividedPowers p`. The prime `p=2` is
included, and nothing is assumed about p-torsion in `A`.

*Hypotheses.* `p` is a prime number. `A` is a commutative ring in which every integer not divisible by `p`
is invertible. `A` may have p-torsion, and `p` may be nilpotent or zero in `A`; `A` need not be flat over
`ℤ₍p₎`.

The API:

- For all `a∈A` and `n≥0`: `γₙ(p·a)=cₙ·aⁿ`, where `c₀=1` and `cₙ` is the image in `A`
  of `pⁿ/n!∈ℤ₍p₎` for `n≥1`. In particular `γₙ(p)=cₙ`.
- For a prime `p` and `n≥1`, the rational number `pⁿ/n!` lies in `pℤ₍p₎`:
  the p-adic valuation of `n!` is less than `n`. Consequently `cₙ∈pA` for `n≥1`.
- If `θ` is a divided power structure on `pA` with `θₙ(p)=cₙ` for all `n≥1`, then
  `θ=γ`. In particular `γ` is the only divided power structure on `pA` for which `ℤ₍p₎→A` is a PD morphism
  from the structure `x↦xⁿ/n!` on `pℤ₍p₎`.
- Every ring map `g:A→A′` between commutative rings in which the
  integers not divisible by `p` are invertible is a PD morphism from `(pA,γ)` to `(pA′,γ′)`.
- For `A=ℤ_p` the structure `γ` on `pℤ_p` is `PadicInt.dividedPowers p`.

*Proof sketch.* For `n≥1` the p-adic valuation of `n!` is less than `n` (`padicValNat_factorial_lt_of_ne_zero`), so `pⁿ/n!` lies in `pℤ₍p₎`. On `ℤ₍p₎`, the localization of `ℤ` at the
prime ideal `(p)` (`Localization.AtPrime`), which embeds in `ℚ`, define the divided power structure on
`pℤ₍p₎` by `γₙ(x)=xⁿ/n!`: apply `DividedPowers.ofInjective` to `ℤ₍p₎→ℚ` and to
`DividedPowers.RatAlgebra.dividedPowers` on the unit ideal of `ℚ`; for `x=p·a` the required element is
`(pⁿ/n!)·aⁿ`, which lies in `pℤ₍p₎` for `n≥1` by step 1. This is the construction of
`PadicInt.dividedPowers` with `ℤ₍p₎` in place of `ℤ_p`. The hypothesis on `A` gives the unique ring map
`f:ℤ₍p₎→A` (`IsLocalization.lift`), and the ideal of `A` generated by `f(pℤ₍p₎)` is `pA`. Apply
principal-extension with `x=p`: the result is `γₙ(b·p)=bⁿ·f(pⁿ/n!)` for `b∈A`. This is case (2) of Stacks
Lemma 23.4.2, which needs no flatness; `A` need not be flat over `ℤ₍p₎`, for example `A=ℤ/p²`. Uniqueness
of the extension is extension-uniqueness. Two divided power structures on `pA=span{p}` with the same
values at `p` are equal by `DividedPowers.dpow_eq_from_gens`. For a ring map `g:A→A′` between two such
rings, `g∘f=f′` by the uniqueness of the map from `ℤ₍p₎`, the ideal generated by `g(pA)` is `pA′`, and
`g(γₙ(p·a))=g(a)ⁿ·f′(pⁿ/n!)=γ′ₙ(p·g(a))`; so `g` is a PD morphism. For `A=ℤ_p`, `PadicInt.dividedPowers p`
is a divided power structure on `pℤ_p` whose value at `p` in degree `n` is `pⁿ/n!` (`PadicInt.coe_dpow_eq`),
so it equals `γ` by step 4. ([Stacks Project](https://stacks.math.columbia.edu), Divided Power
Algebra, Example 23.2.3 (tag 07GN).) *Needs:* §PD.2 *Extension of divided powers on a principal ideal*;
§PD.2 *Uniqueness of extension to the generated ideal*; Mathlib `padicValNat_factorial_lt_of_ne_zero`;
Mathlib `Localization.AtPrime`; Mathlib `IsLocalization.lift`; Mathlib `DividedPowers.ofInjective`;
Mathlib `DividedPowers.RatAlgebra.dividedPowers`; Mathlib `DividedPowers.dpow_eq_from_gens`; Mathlib
`DividedPowers.IsDPMorphism`; Mathlib `PadicInt.dividedPowers`; Mathlib `PadicInt.coe_dpow_eq`;
Mathlib `DividedPowers.OfSquareZero.dividedPowers`; Mathlib `dividedPowersBot`.

**Checks.**

- `test_canonicalP_two_mod_four`: `p=2`, `A=ℤ/4`: `γ₂(2)=2`, `γ₃(2)=0` and `γ₄(2)=2`.
- `test_canonicalP_not_squareZero`: `p=2`, `A=ℤ/4`: the ideal `(2)` has square zero, and `γ` is not
  `DividedPowers.OfSquareZero.dividedPowers` on `(2)`: that structure has operation 0 in degree 2 at the
  element 2, whereas `γ₂(2)=2`.
- `test_canonicalP_mod_p_sq`: `p` odd, `A=ℤ/p²` (the ring `W₂(𝔽_p)`): `γₙ(p)=0` for every `n≥2`, and `γ` is
  `DividedPowers.OfSquareZero.dividedPowers` on `(p)`.
- `test_canonicalP_three`: `p=3`, `A=ℤ/27`: `γ₂(3)=18`, `γ₃(3)=18` and `γ₄(3)=0`.
- `test_canonicalP_char_p`: If `p=0` in `A`, for example `A=𝔽_p`, then `pA=0` and `γ=dividedPowersBot A`.
- `p=2`, `A=ℤ/4`: `γ₂(2)=2`, `γ₃(2)=0` and `γ₄(2)=2`; this is not the square-zero structure on `(2)`, whose
  operations of degree at least 2 vanish.
- `A=𝔽_p`: `pA=0` and `γ` is the divided power structure of the zero ideal.

**Compatibility of divided powers with a base.** Let `(A,I,γ)` and `(B,J,δ)` be divided power rings and
`φ:A→B` a ring map (`I` need not map into `J`). `δ` is compatible with `γ` if there is a divided power
structure `γ̄` on the ideal `J+IB` such that `φ` is a divided power morphism `(I,γ)→(J+IB,γ̄)` and the
identity of `B` is a divided power morphism `(J,δ)→(J+IB,γ̄)`.

*Hypotheses.* `(A,I,γ)` and `(B,J,δ)` are divided power rings; `φ:A→B` is a ring homomorphism.

The API:

- `Crystalline.IsCompatibleWith.unique`: If `δ` is compatible with `γ`, the divided power structure `γ̄`
  on `J+IB` of the definition is unique.
- `Crystalline.isCompatibleWith_iff_isDPMorphism`: If `IB⊆J`, then `δ` is compatible with `γ` if and only
  if `φ` is a divided power morphism from `(I,γ)` to `(J,δ)`.
- `Crystalline.isCompatibleWith_iff_extends_agree`: `δ` is compatible with `γ` if and only if `γ` extends
  to a divided power structure `γ_B` on `IB` (`φ` a divided power morphism `(I,γ)→(IB,γ_B)`) and `γ_B` and `δ`
  agree on `IB∩J`.
- `Crystalline.isCompatibleWith_of_inf_eq_mul`: If `γ` extends to `IB` and `IB∩J=IB·J`, then `δ` is
  compatible with `γ`.
- `Crystalline.isCompatibleWith_bot`: Every divided power structure `δ` on every ideal `J` of `B` is
  compatible with the trivial structure on the zero ideal of `A`.

*Proof sketch.* State the predicate as the existence of a divided power structure `γ̄` on `J+IB` with
`DividedPowers.IsDPMorphism γ γ̄ φ` and `DividedPowers.IsDPMorphism δ γ̄` (identity of `B`). `γ̄` is unique:
`J+IB` is generated by `J∪φ(I)`, on which `γ̄` is prescribed (`DividedPowers.dpow_eq_from_gens`). Equivalent
form: `γ̄` restricts to `δ` on `J` and, `IB` being stable under `γ̄` by the sum and scalar rules, to an
extension of `γ` on `IB`; conversely an extension of `γ` to `IB` that agrees with `δ` on `IB∩J` glues with `δ`
(compatible-sum). If `IB∩J=IB·J` the agreement is automatic (`DividedPowers.coincide_on_smul`). ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.4 (07HJ), Definition
60.4.1 (tag 07HK) and the last paragraph of the section.) *Needs:* *Divided powers on a compatible
sum of ideals*; Mathlib `DividedPowers`; Mathlib `DividedPowers.IsDPMorphism`; Mathlib
`DividedPowers.dpow_eq_from_gens`; Mathlib `DividedPowers.coincide_on_smul`; Mathlib
`DividedPowers.OfSquareZero.dividedPowers`.

**Checks.**

- `test_isCompatibleWith_zero_base`: For `I=0` every `(B,J,δ)` is compatible with `γ`, and `γ̄=δ`.
- `test_isCompatibleWith_Z4`: For `(A,I,γ)=(ℤ_(2),(2),canonical)`, `B=ℤ/4` and `J=(2)`: the divided power
  structure with `δ₂(2)=2` is compatible with `γ`; the one with `δ₂(2)=0` (`DividedPowers.OfSquareZero.dividedPowers`) is not.
- `test_isCompatibleWith_sqZero`: For a divided power ring `(A,I,γ)`, an `A`-module `M` and `B=A⊕M`: the
  square-zero structure on `J=M` (`δ_n=0` for `n≥2`) is compatible with `γ`, and `γ̄` is the structure of
  pd-square-zero-extension on `I⊕M`.
- If `IB⊆J`, `δ` is compatible with `γ` exactly when `A→B` is a divided power morphism `(I,γ)→(J,δ)`.

**Canonical divided powers on the augmentation ideal.** For a commutative ring `A` and an `A`-module `M`,
let `Γ_A(M)=DividedPowerAlgebra A M` and `Γ⁺` its augmentation ideal, the ideal generated by the
`dp_n(m)`, `n≥1`. There is a unique divided power structure `δ` on `Γ⁺` with `δ_n(dp₁(m))=dp_n(m)` for all `n≥0`
and `m∈M`; it satisfies `δ_n(dp_k(m))=uniformBell(n,k)·dp_(nk)(m)` for `k≥1`, where
`uniformBell(n,k)=(nk)!/(n!(k!)ⁿ)`. For every `A`-algebra `C` with a divided power ideal `(K,ε)` and every
`A`-linear map `g:M→C` with values in `K`, the algebra map `DividedPowerAlgebra.lift ε g:Γ_A(M)→C` is a
divided power morphism `(Γ⁺,δ)→(K,ε)`, and it is the only `A`-algebra map `Γ_A(M)→C` that is a divided
power morphism and sends `dp₁(m)` to `g(m)` for all `m`.

`Suggested.lean` declares `PD.existsUnique_dividedPowers_augmentationIdeal`.

*Hypotheses.* `A` is a commutative ring and `M` an `A`-module; no freeness, finiteness or torsion
hypothesis. For the universal property: `C` is a commutative `A`-algebra, `K` an ideal of `C` with a divided
power structure `ε`, and `g:M→C` is `A`-linear with `g(M)⊆K`.

The API:

- `Crystalline.gammaPD_generator`: `δ_n(dp₁(m))=dp_n(m)` for `m∈M`.
- `Crystalline.gammaPD_lift`: For an `A`-algebra `C` with a divided power ideal `(K,ε)` and an `A`-linear
  map `g:M→C` with `g(M)⊆K` there is a unique `A`-algebra map `Γ_A(M)→C` that is a divided power morphism
  `(Γ⁺,δ)→(K,ε)` and sends `dp₁(m)` to `g(m)`; it is `DividedPowerAlgebra.lift ε g`.
- `Crystalline.gammaPD_map`: For an `A`-linear map `f:M→N`, `DividedPowerAlgebra.map A f:Γ_A(M)→Γ_A(N)` is
  a divided power morphism for the canonical divided powers on the augmentation ideals.
- `Crystalline.gammaPD_unique`: A divided power structure `δ′` on `Γ⁺` with `δ′_n(dp₁(m))=dp_n(m)` for all
  `n≥1` and `m∈M` is equal to `δ`.
- `Crystalline.gammaPD_dp`: `δ_n(dp_k(m))=uniformBell(n,k)·dp_(nk)(m)` for all `n≥0`, `k≥1` and `m∈M`.

*Proof sketch.* Free case, basis. Let `M=A^(W)` with basis `(e_w)`. The divided monomials `x^[e]=∏_w dp_(e_w)(e_w)`, `e:W→₀ℕ`, span `Γ_A(M)` (`DividedPowerAlgebra.submodule_span_prod_dp_eq_top`). They are
linearly independent: on the free module `⊕_e A·y^[e]` put the product `y^[e]y^[f]=∏_w binom(e_w+f_w,e_w)·y^[e+f]`; `DividedPowerAlgebra.lift'` applied to `(n,Σa_w e_w)↦Σ_(|e|=n)∏_w a_w^(e_w)·y^[e]` (its four relations are the multinomial and Vandermonde identities) gives an algebra
map sending `x^[e]` to `y^[e]`. Free case, divided powers. For `e≠0` and `k≥0` put `c(k,e)=(1/k!)·∏_w (k·e_w)!/(e_w!)^k`, an integer, and define on `Γ⁺=⊕_(e≠0)A·x^[e]` the maps `δ_n(Σa_e x^[e])=Σ_(Σn_e=n)∏_e a_e^(n_e)·c(n_e,e)·x^[n_e·e]`. They satisfy `δ₁=id`, `δ_n(ay)=aⁿδ_n(y)` and the
addition rule, and the multiplication and iteration identities hold at the generators `x^[e]`; all of
these reduce to identities between integers, valid because `x^[e]↦∏_w x_w^(e_w)/e_w!` embeds the case
`A=ℤ` into `ℚ[x_w]`. Apply generator-criterion with the generating set `{x^[e]:e≠0}`. For `m=Σa_w e_w`,
`δ_n(dp₁(m))=dp_n(m)` by `DividedPowerAlgebra.dp_sum_smul`. General case, kernel. Choose a surjection
`π:F→M` from a free module, with kernel `N`. `Γ_A(π):Γ_A(F)→Γ_A(M)` is surjective
(`DividedPowerAlgebra.lift_surjective`) and its kernel is the ideal `𝔞` generated by the `dp_n(k)`, `k∈N`,
`n≥1`: these lie in the kernel, and conversely `(n,m)↦dp_n(m̃)` mod `𝔞`, for any lift `m̃` of `m`, is well
defined because `dp_n(m̃+k)=Σ_(i+j=n)dp_i(m̃)dp_j(k)≡dp_n(m̃)`, satisfies the relations of
`DividedPowerAlgebra.lift'`, and gives a map `Γ_A(M)→Γ_A(F)/𝔞` inverse to the map induced by `Γ_A(π)`.
General case, descent. `𝔞⊆Γ_A(F)⁺` is a sub-PD ideal by `DividedPowers.span_isSubDPIdeal_iff`, since
`δ_m(dp_n(k))=δ_m(δ_n(dp₁(k)))=uniformBell(m,n)·dp_(mn)(k)∈𝔞`.
`DividedPowers.Quotient.OfSurjective.dividedPowers` gives divided powers on the image `Γ_A(M)⁺` of
`Γ_A(F)⁺` with `δ_n(dp₁(m))=dp_n(m)`. Uniqueness: `Γ⁺` is generated by the `dp_k(m)`, `k≥1`
(gamma-augmentation-ideal-generators), on which `δ` is forced by the iteration rule; apply
`DividedPowers.dpow_eq_from_gens`. Universal property. lift `ε g` sends `dp_n(m)` to `ε_n(g(m))` (`DividedPowerAlgebra.lift_apply_dp`), hence `Γ⁺` into `K`, and commutes with the divided powers on the
generators `dp_k(m)`, `k≥1`, by the iteration rule in both rings; `DividedPowers.IsDPMorphism.on_span`
extends this to `Γ⁺`. A divided power `A`-algebra map `h` with `h(dp₁(m))=g(m)` has `h(dp_n(m))=ε_n(g(m))`, so
`h=lift ε g` by `DividedPowerAlgebra.lift_unique`. ([Stacks Project](https://stacks.math.columbia.edu),
Divided Power Algebra, Section 23.5 (07H4), Lemma 23.5.1 (07H5) with proof and Remark 23.5.2
(07H6).) *Needs:* DerivedModuleAlgebra §0.DP.3 *Augmentation ideal*; §PD.1 *Divided powers from
identities on generators*; DerivedModuleAlgebra §0.DP.3 *Positive-degree generators of the
augmentation ideal*; Mathlib `DividedPowerAlgebra.lift`; Mathlib `DividedPowerAlgebra.lift'`;
Mathlib `DividedPowerAlgebra.lift_apply_dp`; Mathlib `DividedPowerAlgebra.lift_unique`; Mathlib
`DividedPowerAlgebra.lift_surjective`; Mathlib `DividedPowerAlgebra.submodule_span_prod_dp_eq_top`;
Mathlib `DividedPowerAlgebra.dp_sum_smul`; Mathlib `DividedPowers.span_isSubDPIdeal_iff`; Mathlib
`DividedPowers.Quotient.OfSurjective.dividedPowers`; Mathlib `DividedPowers.dpow_eq_from_gens`;
Mathlib `DividedPowers.IsDPMorphism.on_span`; Mathlib `DividedPowerAlgebra.map`.

**Checks.**

- `test_gammaPD_zero`: For `M=0`, `Γ⁺=0` and its PD structure is the zero-ideal structure.
- `test_gammaPD_free_generator`: In `Γ_A(A)`, `δ₂(dp₁(1))=dp₂(1)`, while `dp₁(1)²=2dp₂(1)`.
- `test_gammaPD_F2`: Over `𝔽₂` the free rank-one generator has square zero but its second divided
  power is nonzero.
- `test_gammaPD_torsion_module`: In `Γ_ℤ(ℤ/2)`: `dp₂(1)` has additive order 4, `dp₁(1)` has order 2,
  `δ₂(dp₁(1))=dp₂(1)` and `dp₁(1)²=2·dp₂(1)≠0`.
- A torsion ring where division by `n!` is invalid: for `M=A=𝔽_p`, `Γ_A(A)=𝔽_p⟨x⟩` with `x=dp₁(1)`;
  `x^p=p!·dp_p(1)=0` and `δ_p(x)=dp_p(1)≠0`, so `δ_p(x)` is not `x^p/p!`.

**Relative divided power polynomial algebras.** Let `(A,I,γ)` be a divided power ring and `W` a set. Put
`A⟨x_w:w∈W⟩=Γ_A(A^(W))` (`DividedPowerAlgebra A` (`W →₀ A`)) and `x_w^[n]=dp_n(e_w)`. (1) The divided
monomials `x^[e]=∏_w x_w^[e_w]`, `e:W→₀ℕ`, form an `A`-basis, with `x^[e]x^[f]=(∏_w binom(e_w+f_w,e_w))·x^[e+f]`. (2) On the ideal `J=IA⟨x_w⟩+A⟨x_w⟩₊`, where `A⟨x_w⟩₊` is the augmentation
ideal, there is a unique divided power structure `δ` such that `δ_n(x_w)=x_w^[n]` for all `n` and `w`, and
`A→A⟨x_w⟩` is a divided power morphism `(I,γ)→(J,δ)`. (3) For every divided power ring `(C,K,ε)`, a
divided power morphism `(A⟨x_w⟩,J,δ)→(C,K,ε)` is the same as a divided power morphism
`φ:(A,I,γ)→(C,K,ε)` together with a family `(k_w)` of elements of `K`; the morphism acts by `φ` on
coefficients and sends `x^[e]` to `∏_w ε_(e_w)(k_w)`.

*Hypotheses.* `(A,I,γ)` is a divided power ring (`A` commutative) and `W` is an arbitrary set. For the
universal property `(C,K,ε)` is an arbitrary divided power ring.

The API:

- `Crystalline.pdPolynomial_basis`: The finite-support divided monomials give an `A`-basis.
- `Crystalline.pdPolynomial_lift`: For a divided power ring `(C,K,ε)`, a divided power morphism
  `φ:(A,I,γ)→(C,K,ε)` and elements `k_w∈K (w∈W)` there is a unique divided power morphism
  `(A⟨x_w⟩,J,δ)→(C,K,ε)` extending `φ` with `x_w↦k_w`; it sends `x^[e]` to `∏_w ε_(e_w)(k_w)`.
- `Crystalline.pdPolynomial_monomial_mul`: `x^[e]·x^[f]=(∏_w binom(e_w+f_w,e_w))·x^[e+f]` for
  `e,f:W→₀ℕ`.
- `Crystalline.pdPolynomial_algebraMap_isDPMorphism`: The structure map `A→A⟨x_w⟩` is a divided power
  morphism from `(I,γ)` to `(J,δ)`.
- `Crystalline.pdPolynomial_dpow_var`: `δ_n(x_w)=x_w^[n]` for all `n≥0` and `w∈W`.
- `Crystalline.pdPolynomial_dpow_unique`: A divided power structure `δ′` on `J` such that
  `δ′_n(x_w)=x_w^[n]` for all `n`, `w` and such that `A→A⟨x_w⟩` is a divided power morphism `(I,γ)→(J,δ′)` is
  equal to `δ`.

*Proof sketch.* Take the homogeneous grading and the free-module divided-monomial basis from
DerivedModuleAlgebra §0.DP.2 (degree, grading, graded multiplication, base change of degrees, the
comparison with symmetric tensors). Sum the homogeneous bases over degrees to obtain the basis
indexed by `W→₀N`. Its product formula is the existing `dp` multiplication relation. This target adds
the relative PD base ideal and its universal property; it does not plan a second general `Γ` grading
or tensor-symmetry theory. Existence of `δ`. `A⟨x_w⟩` is a free `A`-module, hence flat
(`Module.Flat.of_free`), so `γ` extends uniquely to `IA⟨x_w⟩` (flat-extension). The augmentation ideal
carries its canonical divided powers (gamma-canonical-pd). By gamma-base-ideal-intersection,
`IA⟨x_w⟩∩A⟨x_w⟩₊=IA⟨x_w⟩·A⟨x_w⟩₊`, so the two structures glue uniquely to `δ` on `J`
(product-intersection-gluing); `δ_n(x_w)=δ_n(dp₁(e_w))=dp_n(e_w)`. Uniqueness of `δ`. `J` is generated by
the image of `I` and the `x_w^[k]`, `k≥1`; a structure with the two properties is determined on these (by
`γ`, and by `δ_n(x_w^[k])=uniformBell(n,k)·x_w^[nk]`); apply `DividedPowers.dpow_eq_from_gens`. Universal
property. Given `φ` and `(k_w)`, view `C` as an `A`-algebra by `φ` and let `g:A^(W)→C` be the linear map
`e_w↦k_w`. `DividedPowerAlgebra.lift ε g` is a divided power morphism on `A⟨x_w⟩₊` (gamma-canonical-pd)
and on `IA⟨x_w⟩` (because `φ` is one and the structure there is the extension of `γ`), hence on `J` (`DividedPowers.IsDPMorphism.on_span`); it sends `x^[e]` to `∏_w ε_(e_w)(k_w)`. Conversely a divided power
morphism restricts to `φ` on `A` and is determined by the images `k_w` of the `x_w`. ([Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Section 23.5 (07H4): Lemma 23.5.1
(07H5) with proof, Remark 23.5.2 (07H6).) *Needs:* *Canonical divided powers on the augmentation
ideal*; §PD.2 *Flat extension of divided powers*; *Base ideal and augmentation intersection*; §PD.1
*Gluing when intersection equals product*; TauCetiRoadmap DerivedModuleAlgebra §0.DP.2 (the grading
`Γ_A(M) = ⊕ Γ^d_A(M)`, arbitrary base change of `Γ^d`, and `Γ^d ≅ TSym^d` for free modules); Mathlib
`Module.Flat.of_free`; Mathlib `DividedPowerAlgebra.lift`; Mathlib `DividedPowerAlgebra.lift'`;
Mathlib `DividedPowerAlgebra.submodule_span_prod_dp_eq_top`; Mathlib
`DividedPowers.dpow_eq_from_gens`; Mathlib `DividedPowers.IsDPMorphism.on_span`; Mathlib
`DividedPowerAlgebra`.

**Checks.**

- `test_pdPolynomial_no_variables`: With `W` empty the relative PD algebra is `(A,I,γ)`.
- `test_pdPolynomial_two`: `x^[1]x^[1]=2x^[2]` over `ℤ`, and `x^[2]` remains a nonzero basis vector over
  `𝔽₂`.
- `test_pdPolynomial_eval`: For a divided power morphism `g:(A⟨x_w⟩,J,δ)→(C,K,ε)` and `w∈W`:
  `g(x_w^[n])=ε_n(g(x_w))` for all `n≥0`.
- `test_pdPolynomial_base_gluing`: For `(A,I,γ)=(ℤ_(p),(p),canonical)` and one variable `x`:
  `δ₂(p+x)=γ₂(p)+p·x+x^[2]` in `ℤ_(p)⟨x⟩`.
- A torsion ring where division by `n!` is invalid: for `A=𝔽_p`, `I=0` and one variable, `𝔽_p⟨x⟩` has basis
  `x^[n]`, `n≥0`, with `x^p=0` and `x^[p]≠0`; the divided power ideal is spanned by the `x^[n]`, `n≥1`.

**Divided powers on a square-zero extension.** Let `(A,I,γ)` be a divided power ring and `M` an
`A`-module. On the trivial square-zero extension `B=A⊕M` (`TrivSqZeroExt A M`; `M·M=0`) the ideal `J=I⊕M`
carries the divided power structure `δ` with `δ₀=1` and `δ_n(x+z)=γ_n(x)+γ_(n−1)(x)·z` for `n≥1`, `x∈I`, `z∈M`.
The inclusion `A→B` is a divided power morphism `(I,γ)→(J,δ)`.

*Hypotheses.* `(A,I,γ)` is a divided power ring (`A` commutative) and `M` an `A`-module. `B=A⊕M` has the
multiplication `(a,m)(a′,m′)=(aa′,am′+a′m)`.

The API:

- `Crystalline.pdSqZeroExt_dpow`: `δ_n(x+z)=γ_n(x)+γ_(n−1)(x)·z` for `n≥1`, `x∈I`, `z∈M`.
- `Crystalline.pdSqZeroExt_dpow_inr`: `δ₁(z)=z` and `δ_n(z)=0` for `z∈M` and `n≥2`.
- `Crystalline.pdSqZeroExt_inl_isDPMorphism`: The inclusion `A→A⊕M` is a divided power morphism from
  `(I,γ)` to `(I⊕M,δ)`.
- `Crystalline.pdSqZeroExt_fst_isDPMorphism`: The projection `A⊕M→A` is a divided power morphism from
  `(I⊕M,δ)` to `(I,γ)`.
- `Crystalline.pdSqZeroExt_map`: An `A`-linear map `u:M→N` induces a divided power morphism `A⊕M→A⊕N`,
  `a+m↦a+u(m)`, compatible with composition and identities.
- `Crystalline.pdSqZeroExt_derivation_iff`: Let `A₀→A` be a ring map and `θ:A→M` an `A₀-derivation`. The
  ring map `A→A⊕M`, `a↦a+θ(a)`, is a divided power morphism from `(I,γ)` to `(I⊕M,δ)` if and only if
  `θ(γ_n(x))=γ_(n−1)(x)·θ(x)` for all `x∈I` and `n≥1`.

*Proof sketch.* `δ₁` is the identity and `δ_n(J)⊆J` by the formula. Scalar rule: for `b=a+m` and `y=x+z`,
`b·y=ax+(az+xm)`, `bⁿ=aⁿ+n·aⁿ⁻¹m`, and `δ_n(by)=bⁿδ_n(y)` reduces to `n·γ_n(x)=x·γ_(n−1)(x)`. Multiplication
rule: `δ_n(y)δ_m(y)=γ_n(x)γ_m(x)+(γ_n(x)γ_(m−1)(x)+γ_(n−1)(x)γ_m(x))z`, and
`binom(n+m−1,n)+binom(n+m−1,m)=binom(n+m,n)`. Iteration rule:
`δ_n(δ_m(y))=γ_n(γ_m(x))+γ_(n−1)(γ_m(x))γ_(m−1)(x)z`, and
`uniformBell(n−1,m)·binom(nm−1,m−1)=uniformBell(n,m)`. Addition rule: compare the coefficients of 1, `z`
and `z′` in `δ_n(x+x′+z+z′)` and in `Σ_i δ_i(x+z)δ_(n−i)(x′+z′)`, using the addition rule for `γ`. The
inclusion and the projection are divided power morphisms by the formula (`z=0`, respectively
forgetting `z`). ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section
60.3, Lemma 60.3.1 (tag 07HH) with proof.) *Needs:* Mathlib `DividedPowers`; Mathlib
`DividedPowers.IsDPMorphism`; Mathlib `TrivSqZeroExt`.

**Checks.**

- `test_pdSqZeroExt_zero_module`: For `M=0` the divided power ring `(A⊕0,I⊕0,δ)` is `(A,I,γ)`.
- `test_pdSqZeroExt_dpow_two`: `δ₂(x+z)=γ₂(x)+x·z` for `x∈I`, `z∈M`, and `2·δ₂(x+z)=(x+z)²`.
- `test_pdSqZeroExt_F2`: For `A=𝔽₂`, `I=0` and `M=𝔽₂`, so that `B=𝔽₂[ε]/(ε²)` and `J=(ε)`: the structure `δ` has
  `δ₂(ε)=0`. The ideal `(ε)` carries a second divided power structure `δ′`, with `δ′_n(ε)=ε` when `n` is a
  power of 2 and `δ′_n(ε)=0` for the other `n≥2`; `δ′` is not `δ`.
- For `A=ℤ_(p)`, `I=(p)` with its canonical divided powers and `M=A`: `δ_p(p+z)=p^p/p!+(p^(p−1)/(p−1)!)·z`.
- For `I=0` the structure on `J=M` is `δ_n(z)=0` for `n≥2`, the divided powers of an ideal of square zero.

**Divided powers on a second-order thickening.** Let `(A,I,γ)` be a PD ring, `M` and `N` `A`-modules and
`q:M×M→N` an `A`-bilinear map. Let `B=A⊕M⊕N` with multiplication
`(x,z,w)(x′,z′,w′)=(xx′,xz′+x′z,xw′+x′w+q(z,z′)+q(z′,z))` and `J=I⊕M⊕N`. Then
`δ_n(x,z,w)=(γ_n(x),γ_{n−1}(x)z,γ_{n−1}(x)w+γ_{n−2}(x)q(z,z))`, for `(x,z,w)∈J` and `n≥1`, with the
conventions `γ₀=1` and `γ₋₁=0`, is a PD structure on `J`, and `A→B` is a PD homomorphism `(A,I,γ)→(B,J,δ)`
(Stacks Lemma 60.3.2). For `N=0` this is the PD structure on `A⊕M` of *Divided powers on a square-zero
extension*.

*Hypotheses.* `(A,I,γ)` is a PD ring; `M` and `N` are `A`-modules; `q:M×M→N` is `A`-bilinear, not assumed
symmetric. The formula uses `γ₀(x)=1` and `γ₋₁(x)=0`, so `δ₁(x,z,w)=(x,z,w)`.

*Proof sketch.* `B` is a commutative ring: the product is symmetric because `q(z,z′)+q(z′,z)` is, and
associative because every product of three elements of `M⊕N` has zero component in `M` and component in
`N` determined by `A`-bilinearity. Each axiom involves finitely many elements, so it is enough to prove
it for `A₀=ℤ⟨s,s′⟩` with free modules `M₀`, `N₀` and the universal bilinear map, where everything is
torsion free; there it suffices that `n!·δ_n(x,z,w)=(x,z,w)ⁿ`, and by induction
`(x,z,w)ⁿ=(xⁿ,nxⁿ⁻¹z,nxⁿ⁻¹w+n(n−1)xⁿ⁻²q(z,z))` (proof of Stacks Lemma 60.3.2). ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.3, Lemma 60.3.2 (tag
07HI) with proof.) *Needs:* §PD.5 *Divided powers on a square-zero extension*; *Relative divided power
polynomial algebras*; Mathlib `DividedPowers`; Mathlib `DividedPowers.IsDPMorphism`; Mathlib
`DividedPowers.ofInjective`; Mathlib `DividedPowers.RatAlgebra.dividedPowers`.

**Checks.**

- For `N=0` the formula is `δ_n(x,z)=(γ_n(x),γ_{n−1}(x)z)`, the structure of *Divided powers on a
  square-zero extension*.
- For `A=ℤ`, `I=0`, `M=N=ℤ` and `q(z,z′)=zz′`: `B=ℤ⊕ℤε⊕ℤη` with `ε=(0,1,0)`, `η=(0,0,1)`, `ε²=(0,0,2)=2η` and
  `εη=η²=0` (the subring `ℤ[ε]≅ℤ[ε]/(ε³)` has index 2 in `B` and does not contain `η`), and `δ₂(ε)=η`, so
  `2·δ₂(ε)=ε²`.
- For `A=𝔽₂`, `I=0`, `M=𝔽₂²`, `N=𝔽₂` and `q((a,b),(c,d))=ad`, let `e₁,e₂` be the
  two `M`-basis vectors and `η` the `N`-basis vector. Then `δ₂(e₁)=δ₂(e₂)=0`,
  `δ₂(e₁+e₂)=η` and `e₁e₂=η`; this distinguishes a nonsymmetric `q` from a square-zero product.

### PD.6 Divided power envelopes

**Universal base-compatible divided power envelope.** Let `(A,I,γ)` be a divided power ring, `B` an
`A`-algebra and `J` an ideal of `B` with `IB⊆J`. There is a divided power ring `(D,J̄,γ̄)` with a divided
power morphism `(A,I,γ)→(D,J̄,γ̄)` and an `A`-algebra map `B→D` sending `J` into `J̄` such that, for every
divided power ring `(C,K,ε)` with a divided power morphism `(A,I,γ)→(C,K,ε)`, composition with `B→D` is a
bijection from the divided power morphisms `(D,J̄,γ̄)→(C,K,ε)` over `(A,I,γ)` to the `A`-algebra maps `B→C`
sending `J` into `K`. It is unique up to unique isomorphism and is called the divided power envelope
`D_(B,γ)(J)` of `J` in `B` relative to `(A,I,γ)`. The map `B/J→D/J̄` induced by `B→D` is an isomorphism.

`Suggested.lean` declares `PD.IsPDEnvelope`, `PD.exists_isPDEnvelope`.

*Hypotheses.* `(A,I,γ)` is a divided power ring, `B` a commutative `A`-algebra with structure map `φ`, and `J`
an ideal of `B` with `IB⊆J`. The targets of the universal property are divided power rings `(C,K,ε)`
together with a divided power morphism `(A,I,γ)→(C,K,ε)`.

The API:

- `Crystalline.PDEnvelope.lift`: For a divided power ring `(C,K,ε)` with a divided power morphism from
  `(A,I,γ)` and an `A`-algebra map `f:B→C` with `f(J)⊆K` there is a unique divided power morphism
  `g:(D,J̄,γ̄)→(C,K,ε)` of `A`-algebras with `g∘(B→D)=f`.
- `Crystalline.PDEnvelope.quotient`: `D/J̄≅B/J` compatibly with `B`.
- `Crystalline.PDEnvelope.map`: Let `(A,I,γ)→(A′,I′,γ′)` be a divided power morphism, `B→B′` a ring map
  over `A→A′`, and `J⊆B`, `J′⊆B′` ideals with `IB⊆J`, `I′B′⊆J′` and `JB′⊆J′`. There is a unique divided power
  morphism `D_(B,γ)(J)→D_(B′,γ′)(J′)` compatible with `B→B′`; these maps are compatible with
  composition, and the identity induces the identity.
- `Crystalline.PDEnvelope.span_dpow_image`: The elements `γ̄_n(x)`, `n≥1`, `x` in the image of `J`, generate
  `J̄` as an ideal of `D` and generate `D` as a `B`-algebra.
- `Crystalline.PDEnvelope.presentation`: Let `(B,I,γ)` be a divided power ring, `J` an ideal with `I⊆J⊆B`
  and `(f_t)_(t∈T)` elements of `J` with `J=I+(f_t)`. The divided power morphism
  `Ψ:(B⟨x_t⟩,IB⟨x_t⟩+B⟨x_t⟩₊,δ)→D_(B,γ)(J)` with `x_t↦(image of f_t)` is surjective, and its kernel is
  the ideal generated by the `x_t−f_t` and the `δ_n(Σ_t r_t x_t−r₀)`, `n≥1`, for all `r₀∈I` and finitely
  supported `(r_t)∈B^(T)` with `Σ_t r_t f_t=r₀`.
- `Crystalline.PDEnvelope.compatible_lift`: Let `J₀` be any ideal of `B`, `D=D_(B,γ)(J₀+IB)` with divided
  power ideal `J̄`, and `J̄₀⊆J̄` the sub-PD ideal generated by the image of `J₀`. Then `J̄=J̄₀+ID`, the
  divided powers of `J̄₀` are compatible with `γ`, and for every `A`-algebra `C` with a divided power ideal
  `(K,ε)` compatible with `γ` and every `A`-algebra map `f:B→C` with `f(J₀)⊆K` there is a unique `A`-algebra map
  `g:D→C` with `g∘(B→D)=f` that is a divided power morphism `(J̄₀,γ̄)→(K,ε)`.
- `Crystalline.PDEnvelope.eq_of_isCompatible`: Let `J₀` be an ideal of `B` and `(D₀,J̄₀,δ₀)` the envelope
  of `J₀` in `B` relative to the trivial divided power structure on the zero ideal of `A`. If `δ₀` is
  compatible with `γ`, with glued structure `γ̄` on `J̄₀+ID₀`, then `(D₀,J̄₀+ID₀,γ̄)` is the envelope
  `D_(B,γ)(J₀+IB)`: the canonical map `D₀→D_(B,γ)(J₀+IB)` is an isomorphism of `B`-algebras. The
  hypothesis holds if `γ` extends to `ID₀` and `ID₀∩J̄₀=ID₀·J̄₀`; for `(A,I,γ)=(ℤ_(p),(p),canonical)` this
  is the case when `B/J₀` is p-torsion-free, and when `B` is a `ℤ/p^n`-algebra with `B/J₀` flat over `ℤ/p^n`.

*Proof sketch.* Construction. Let `Γ=Γ_B(J)` be the divided power algebra of the `B`-module `J` with its
canonical divided powers on `Γ⁺` (gamma-canonical-pd). Let `𝔎` be the smallest ideal of `Γ` that contains
`dp₁(j)−j` for `j∈J` and `dp_n(φ(a))−φ(γ_n(a))` for `a∈I`, `n≥1`, and whose intersection with `Γ⁺` is a sub-PD
ideal of `Γ⁺`; it exists because an intersection of ideals with these properties has them and `Γ` itself
has them. Put `D=Γ/𝔎`, let `J̄` be the image of `Γ⁺` and `γ̄` the quotient divided powers
(`DividedPowers.Quotient.dividedPowers`). The map `B→D` sends `j∈J` to the class of `dp₁(j)`, which lies in
`J̄`. `A→D` is a divided power morphism: for `a∈I`, `φ(a)∈J` because `IB⊆J`, and
`γ̄_n(φ(a))=dp_n(φ(a))=φ(γ_n(a))` in `D`. Universal property. Given `(C,K,ε)` over `(A,I,γ)` and an
`A`-algebra map `ψ:B→C` with `ψ(J)⊆K`, gamma-canonical-pd gives the unique divided power `B`-algebra map
`g:Γ→C` with `g(dp₁(j))=ψ(j)`. Its kernel contains both families of relations and meets `Γ⁺` in a sub-PD
ideal (`DividedPowers.isSubDPIdeal_ker`), hence contains `𝔎`; so `g` factors through `D`. Uniqueness holds
because `D` is generated as a `B`-algebra by the `γ̄_n` of the images of elements of `J`. Quotient. With
`ε_Γ:Γ→B` the augmentation, `D/J̄=Γ/(𝔎+Γ⁺)=B/ε_Γ(𝔎)`. `ε_Γ(𝔎)` contains `J` (image of `dp₁(j)−j`). Conversely
`𝔎⊆ε_Γ⁻¹(J)=JΓ+Γ⁺`, because this ideal contains the relations `(φ(γ_n(a))∈IB⊆J)` and meets `Γ⁺` in `Γ⁺`.
Hence `D/J̄=B/J`. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section
60.2 (07H7): Lemma 60.2.1 (07H8), Definition 60.2.2 (07H9) and the properties listed after it;
presentation: Lemma 60.2.4 (07HC).) *Needs:* §PD.5 *Canonical divided powers on the augmentation
ideal*; DerivedModuleAlgebra §0.DP.3 *Augmentation of the divided power algebra*;
DerivedModuleAlgebra §0.DP.3 *Augmentation ideal*; *Relative divided power polynomial algebras*;
§PD.5 *Compatibility of divided powers with a base*; *Gluing when intersection equals product*;
Mathlib `DividedPowers.Quotient.dividedPowers`; Mathlib `DividedPowers.isSubDPIdeal_ker`; Mathlib
`DividedPowers.IsDPMorphism.on_span`; Mathlib `DividedPowerAlgebra`.

**Checks.**

- `test_envelope_zero`: If `I=J=0`, `D=B` with zero PD ideal.
- `test_envelope_existing`: If `(B,J,δ)` is a divided power ring and `A→B` is a divided power morphism
  `(I,γ)→(J,δ)`, there is a divided power morphism `r:D_(B,γ)(J)→B` with `r∘(B→D)=id_B`; in particular `B→D`
  is injective.
- `test_envelope_Fp_t`: For `A=𝔽_p`, `I=0`, `B=𝔽_p[t]`, `J=(t)`: `D=𝔽_p⟨t⟩` and `t^p=0` in `D`, so `B→D` is not
  injective.
- `test_envelope_truncated`: For `A=𝔽_p`, `I=0`, `B=𝔽_p[t]/(t^p)` and `J=(t)` with the divided powers
  `γ_n(t)=tⁿ/n!` for `n<p` and `γ_n(t)=0` for `n≥p`: `D_B(J)=𝔽_p⟨t⟩`, and the retraction `D→B` kills `t^[n]` for
  `n≥p`; so `D≠B` although `J` has divided powers.
- `test_envelope_two_bases`: For `B=ℤ_(p)` and `J=(p)`: relative to `(ℤ_(p),(p),canonical)` the envelope
  is `ℤ_(p)`; relative to the trivial base `(ℤ_(p),0)` it is `ℤ_(p)⟨x⟩/(x−p)`, in which the class of
  `x^[p]−p^p/p!` is non-zero and killed by `p`.

**Compatible-base envelopes with fixed quotient.** Let `(A,I,γ)` be a PD ring, `B` a commutative
`A`-algebra and `J⊂B` any ideal. Assume `γ` extends to `I(B/J)`. There is a `B`-algebra `D` with PD ideal
`(K,δ)`, `J` mapping into `K`, `δ` compatible with `γ` and `B/J≅D/K`. Its universal property tests all
`A`-algebras `C` with a PD ideal `(L,ε)` compatible with `γ`: every `A`-algebra map `B→C` carrying `J` into `L`
factors uniquely through a PD `A`-algebra map `(D,K,δ)→(C,L,ε)`. `K` need not contain `ID`; the powers on
`K` and `ID` have a common extension on `K+ID`.

*Hypotheses.* The base powers extend to the image ideal `I(B/J)`; neither `IB⊆J` nor extension to `B`
is required. Compatibility of each test ideal with `γ` is part of the universal property.

The API:

- `Crystalline.compatiblePDEnvelope.lift`: Maps carrying `J` into a compatible PD test ideal have the
  unique factorization above.
- `Crystalline.compatiblePDEnvelope.quotient`: The induced map `B/J→D/K` is an isomorphism.
- `Crystalline.compatiblePDEnvelope.containing_base`: If `IB⊆J`, this is the universal
  base-compatible envelope, with `K` its full PD ideal.

*Proof sketch.* Use `Crystalline.PDEnvelope.compatible_lift`: form the envelope `D` of `J+IB` over
`(A,I,γ)`, and let `K` be the sub-PD ideal generated by the image of `J`. Its restricted powers are
compatible with `γ` and have the required universal property. The relative PD-polynomial
presentation of the preceding target imposes the base-compatibility relations. Modulo `K` all
positive divided powers of `J` vanish, so `B/J→D/K` is surjective. Apply the universal property to
`C=B/J` with zero PD ideal, which is compatible because `γ` extends to `I(B/J)`. The resulting map
`D→B/J` kills `K` and gives a left inverse to that surjection, hence the quotient isomorphism.
(Berthelot, *Cohomologie cristalline des schémas de caractéristique `p>0`*, I.2.4.3(iii), as
identified in [Du–Moon–Shimizu, *On log crystalline higher direct
image*](https://arxiv.org/abs/2603.00559v1), Theorem 2.1(1)–(2) and footnote 2, pp.5–6;
[Stacks Project](https://stacks.math.columbia.edu/tag/07HK), Definition 60.4.1, for compatibility.)
*Needs:* §PD.6 *Universal base-compatible divided power envelope*;
§PD.5 *Compatibility of divided powers with a base*; §PD.5 *Relative divided power polynomial algebras*;
Mathlib `DividedPowers.SubDPIdeal` and `DividedPowers.Quotient.dividedPowers`.

**Checks.**

- `compatible_identity`: For `B=A=ℤ/4`, `J=0` and the canonical powers on `I=(2)`, `D=A` and `K=0`;
  `ID=(2)` is not contained in `K`. The zero PD ideal is compatible with the base powers, but the
  identity is not a PD morphism from `(I,γ)` to `(0,0)`, since 2 does not map to zero.
- `compatible_zero_base`: For `A=𝔽_p`, `I=0`, `B=𝔽_p[t]`, `J=(t)`, `D=𝔽_p⟨t⟩` with its augmentation
  ideal `K` and `D/K=𝔽_p`. The map sends `t` to `dp₁(1)` and the canonical powers satisfy
  `δ_n(dp₁(a))=dp_n(a)`.
- `compatible_truncated`: For `B=𝔽_p[t]/(t^p)`, `J=(t)` and the truncated divided powers of
  `test_envelope_truncated`, the identity of `B` is not a compatible-base envelope over
  `(𝔽_p,0)`: the universal envelope still has the nonzero generator `t^[p]`.
- `compatible_containing_base`: For `B=A=ℤ/4`, `I=J=(2)` with canonical base powers, `D=A`,
  `K=(2)` and `D/K=𝔽₂`, agreeing with the preceding envelope.

**Pushouts of divided power rings.** The category of PD rings, with objects the triples `(A,I,γ)` and
morphisms the PD homomorphisms, has all colimits (Stacks, Divided Power Algebra, Lemma 23.3.4). Let
`(B,J,δ)←(A,I,γ)→(B′,J′,δ′)` be PD homomorphisms and `(B″,J″,δ″)` their pushout. Then (1)
`B″/J″=B/J⊗_{A/I}B′/J′`; (2) the map `φ:B⊗_AB′→B″` is surjective; (3) `φ` maps `J⊗_AB′+B⊗_AJ′` onto `J″`
(Remark 23.3.5). The map `φ` need not be an isomorphism: the forgetful functor `(A,I,γ)↦A` does not
commute with colimits (Remark 23.3.6).

*Hypotheses.* `(A,I,γ)`, `(B,J,δ)` and `(B′,J′,δ′)` are PD rings, with PD homomorphisms from the first to
the other two.

*Proof sketch.* For a small diagram of PD rings, take its underlying commutative-ring colimit `R`
using Mathlib `CommRingCat.Colimits.hasColimits_commRingCat`. Let `J⊂R` be the ideal generated by the
images of all source PD ideals. Form the envelope `D_R(J)` over the PD base `(ℤ,0)` by *Universal
base-compatible divided power envelope*. For every source object `i`, `x∈I_i` and `n≥1` impose
`γ_D,n(image(x))−image(γ_i,n(x))=0`. These relations lie in the envelope PD ideal. Take their PD-ideal
closure with `DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span` and quotient using
`DividedPowers.Quotient.dividedPowers`. The quotient carries a PD cocone. Any PD cocone first induces
`R→C`, then extends uniquely to `D` by the envelope property; it kills the relations and their PD
closure, so factors uniquely through the quotient. This gives all small colimits without a
representability criterion. For a pushout, test the universal property on `(C,0)` to identify `B″/J″`
with `B/J⊗_(A/I)B′/J′`. The image of `B⊗_A B′` in `B″` and the ideal generated there by images of `J,J′` are
stable under all divided powers: expand sums and use `γ_n(ax)=a^nγ_n(x)`, with the source PD
compatibility on each generator. This image PD subring is itself a cocone; the pushout property
forces its inclusion into `B″` to be an isomorphism. Thus the tensor map is surjective and its ideal
image is `J″`, as in Stacks Remark 23.3.5. ([Stacks Project](https://stacks.math.columbia.edu),
Divided Power Algebra, §23.3, Lemma 23.3.4 and Remarks 23.3.5–23.3.6; [Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.2, Lemma 60.2.1 (tag 07H8),
universal envelope construction.) *Needs:* §PD.6 *Universal base-compatible divided power envelope*;
Mathlib `DividedPowers`; Mathlib `DividedPowers.IsDPMorphism`; Mathlib
`CommRingCat.Colimits.hasColimits_commRingCat`; Mathlib
`DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span`; Mathlib
`DividedPowers.Quotient.dividedPowers`.

**Checks.**

- For `(A,I,γ)=(ℤ,0,∅)` and `B=B′=ℤ/4` with `J=J′=(2)`, `δ₂(2)=2` and `δ′₂(2)=0`: the pushout is `(𝔽₂,0,∅)`,
  because `2=δ₂(2)=δ′₂(2)=0` in it, whereas `ℤ/4⊗_ℤℤ/4=ℤ/4` (Remark 23.3.6).
- A pushout whose second leg is the identity of `(A,I,γ)` is `(B,J,δ)`, with its original powers.
- With all three PD ideals zero, the pushout is the ordinary tensor product `B⊗_A B′` with zero
  PD ideal; no additional divided-power relations change its ring.

**Envelope quotient and transitivity.** (1) Quotients. Let `(A,I,γ)` be a divided power ring, `φ:B′→B` a
surjection of `A`-algebras with kernel `K`, `J` an ideal of `B` with `IB⊆J` and `J′=φ⁻¹(J)`. Write
`(D′,J̄′,γ̄′)=D_(B′,γ)(J′)`. The divided power morphism `D′→D_(B,γ)(J)` induced by `φ` is surjective, and
its kernel is the ideal `K′` generated by the `γ̄′_n(k)`, `n≥1`, `k` in the image of `K`; `K′` is a sub-PD ideal
of `J̄′` and `D_(B,γ)(J)=(D′/K′,J̄′/K′,γ̄′)`. Consequently, for ideals `K⊆L⊆J′` of `B′`, the envelope of
`J′/L` in `B′/L` is the quotient of the envelope of `J′/K` in `B′/K` by the ideal generated by the divided
powers of the image of `L`. (2) Change of base. If `A→A′` is a ring map such that `γ` extends to a divided
power structure `γ′` on `IA′`, `B` is an `A′`-algebra and `J` an ideal of `B` with `IB⊆J`, then
`D_(B,γ)(J)=D_(B,γ′)(J)`: the two universal properties coincide. (3) Envelope over an envelope. Let `A″`
be an `A`-algebra, `J″` an ideal of `A″` with `IA″⊆J″` and `(A′,I′,γ′)=D_(A″,γ)(J″)`. Let `B″` be an `A″`-algebra
and `J` an ideal of `B″` with `J″B″⊆J`. Then the canonical divided power morphism
`D_(B″,γ)(J)→D_(B″⊗_(A″)A′,γ′)(J̃)`, where `J̃` is the ideal generated by the images of `J` and of `I′`, is
an isomorphism.

*Hypotheses.* `(A,I,γ)` is a divided power ring; all rings are commutative. (1): `φ:B′→B` is a
surjective `A`-algebra map with kernel `K`; `J` is an ideal of `B` with `IB⊆J` and `J′` its preimage
(equivalently `K⊆J′` and `J=φ(J′)`); in the last sentence `K⊆L⊆J′`. (2): `γ′` is a divided power structure
on `IA′` for which `A→A′` is a divided power morphism `(I,γ)→(IA′,γ′)`; `B` is an `A′`-algebra and `J` an ideal
of `B` with `IB⊆J`. (3): `(A′,I′,γ′)` is the divided power envelope of `J″` in `A″` relative to `(A,I,γ)`; `B″` is
an `A″`-algebra and `J` an ideal of `B″` containing `J″B″`.

*Proof sketch.* (1) The map `D′→D=D_(B,γ)(J)` exists by the universal property of `D′`. It is surjective
because `D` is generated as a `B`-algebra by the `γ̄_n` of the image of `J` (`PDEnvelope.span_dpow_image`) and
`J′→J` is surjective. Being a divided power morphism, it kills `γ̄′_n(k)` for `k∈K` and `n≥1`. `K′` is the
carrier of the sub-PD ideal generated by the image of `K` (`DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span`), so `D′/K′` carries the quotient divided powers
(`DividedPowers.Quotient.dividedPowers`). `B′→D′/K′` kills `K` (take `n=1`), hence factors through `B` and
sends `J` into `J̄′/K′`; the universal property of `D` gives `D→D′/K′`, inverse to `D′/K′→D`. The sentence
about `K⊆L` is (1) applied to `B′→B′/K` and to `B′→B′/L`. (2) Let `C` be an `A′`-algebra with a divided power
ideal `(K,ε)`. If `A→C` is a divided power morphism for `γ`, then `A′→C` is one for `γ′`: `γ′_n(Σa′_i y_i)=Σ_(Σn_i=n)∏a′_i^(n_i)γ_(n_i)(y_i)` for `y_i∈I` (API item `dpow_sum_mul_map_eq_extensionCoefficient`
of §PD.2 *The scalar-extension coefficient formula*; `γ′` is unique by *Uniqueness of extension to the
generated ideal*), and `ε` obeys the same sum and scalar rules. The converse is composition. So the
two envelopes corepresent the same functor. (3) Let `(C,K,ε)` be a divided power ring over `(A,I,γ)` and
`ψ:B″→C` an `A`-algebra map with `ψ(J)⊆K`. Its restriction to `A″` sends `J″` into `K` and extends uniquely to a
divided power morphism `α:A′→C`; then `(C,K,ε)` is a divided power ring over `(A′,I′,γ′)` and
`ψ⊗α:B″⊗_(A″)A′→C` sends `J̃` into `K`. Conversely restrict along `B″→B″⊗_(A″)A′`, using that `A→A′` is a
divided power morphism. The two assignments are inverse to each other, so both sides corepresent the
same functor. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section
60.2 (07H7), Lemma 60.2.3 (tag 07HB) with proof; [Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, Section 60.2, paragraph between Lemma 60.2.3 (07HB) and Lemma 60.2.4
(07HC).) *Needs:* §PD.6 *Universal base-compatible divided power envelope*; *Uniqueness of extension to
the generated ideal*; §PD.2 *The scalar-extension coefficient formula*; Mathlib
`DividedPowers.Quotient.dividedPowers`; Mathlib
`DividedPowers.SubDPIdeal.span_carrier_eq_dpow_span`.

**Checks.**

- (1) For `A=𝔽_p`, `I=0`, `B′=𝔽_p[t]→B=𝔽_p[t]/(t^p)`, `J′=(t)`: the image of `t^p` in `D′=𝔽_p⟨t⟩` is `p!·t^[p]=0`,
  so `K′=0` and `D_B((t))=𝔽_p⟨t⟩`: the envelope does not see the relation `t^p=0`.
- (1) For a `ℤ_(p)`-algebra `A`, the base `(ℤ_(p),(p),canonical)`, an ideal `J⊇pA` and `K=pA`: `K′=pD` because
  `γ̄_n(pa)=aⁿ·(pⁿ/n!)∈pD`; hence `D_(A/p)(J/pA)=D_A(J)/pD`.
- (2) needs `γ′` to be an extension of `γ`: for `A=𝔽_p`, `I=0` and `A′=B=𝔽_p[t]/(t^p)` with `I′=J=(t)` and
  `γ′_n(t)=tⁿ/n! (n<p)`, 0 `(n≥p)`, `D_(B,γ′)(J)=B` but `D_(B,0)(J)=𝔽_p⟨t⟩`.

**Exact base change of divided power envelopes.** (1) Let `(A,I,γ)` be a divided power ring and `B→B′` a
homomorphism of `A`-algebras such that `B/IB→B′/IB′` is flat and `Tor₁^B(B′,B/IB)=0` (equivalently, `IB⊗_B B′→B′` is injective). Then for every ideal `J` of `B` with `IB⊆J` the canonical map `D_(B,γ)(J)⊗_B B′→D_(B′,γ)(JB′)` is an isomorphism. (2) Let `(B,I,γ)→(B′,I′,γ′)` be a homomorphism of divided power
rings and `I⊆J⊆B`, `I′⊆J′⊆B′` ideals such that `B/I→B′/I′` is flat and `J′=JB′+I′`. Then the canonical map
`D_(B,γ)(J)⊗_B B′→D_(B′,γ′)(J′)` is an isomorphism. In both cases the canonical map is the `B′`-linear
extension of the divided power morphism between the envelopes given by `PDEnvelope.map`.

*Hypotheses.* (1): `(A,I,γ)` is a divided power ring; `B→B′` is a map of `A`-algebras; `B/IB→B′/IB′` is
flat; `Tor₁^B(B′,B/IB)=0`; `J` is an ideal of `B` with `IB⊆J`. (2): `(B,I,γ)→(B′,I′,γ′)` is a divided power
morphism; `I⊆J⊆B` and `I′⊆J′⊆B′` are ideals; `B/I→B′/I′` is flat; `J′=JB′+I′`.

*Proof sketch.* (1) It suffices to put divided powers, compatible with those of `D=D_(B,γ)(J)`, on the
ideal generated by `J̄` in `D⊗_B B′`; the universal property of `D_(B′,γ)(JB′)` then gives the inverse of
the canonical map. Choose a polynomial `B`-algebra `P` with a surjection `P→B′`, with kernel `𝔞`. `D→D⊗_B P`
is flat, so `γ̄` extends to the ideal generated by `J̄` in `D⊗_B P` (flat-extension). `Tor₁^B(B′,B/IB)=0`
gives `𝔞∩IP=I𝔞`, and flatness of `B′/IB′` over `B/IB` then gives that `B/J⊗_B 𝔞→B/J⊗_B P` is injective;
hence the kernel of `D⊗_B P→D⊗_B B′` meets `J̄⊗_B P` in the image of `J̄⊗_B 𝔞`. That image is generated by
the elements `f⊗a` (`f∈J̄`, `a∈𝔞`), and `γ̄_n(f⊗a)=γ̄_n(f)⊗aⁿ` lies in it; so it is a sub-PD ideal
(`DividedPowers.span_isSubDPIdeal_iff`) and the divided powers descend to `D⊗_B B′` (`DividedPowers.Quotient.OfSurjective.dividedPowers`). (2) Choose `f_t∈J` generating `J` modulo `I` and
write `D=B⟨x_t⟩/K` by `PDEnvelope.presentation`. Then `D⊗_B B′=B′⟨x_t⟩/K′` with `K′` generated by the images
of the generators of `K`, and the images `f′_t` of the `f_t` generate `J′` modulo `I′` because `J′=JB′+I′`. It
remains to show `δ′_n(Σ_t r′_t x_t−r′₀)∈K′` for every relation `Σ_t r′_t f′_t=r′₀∈I′` over `B′` and `n≥1`.
By the equational criterion for the flat map `B/I→B′/I′` (`Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`) there are relations `Σ_t r_(jt)f_t=r_(j0)∈I` over
`B` and elements `c_j∈B′` with `i′_t=r′_t−Σ_j c_j r_(jt)∈I′`. Then `Σ_t r′_t x_t−r′₀=Σ_t i′_t(x_t−f′_t)+Σ_j c_j(Σ_t r_(jt)x_t−r_(j0))`; expanding `δ′_n` by the sum and scalar rules, every term has a factor
`δ′_m(i′_t(x_t−f′_t))=(x_t−f′_t)^m·γ′_m(i′_t)` or `δ_m(Σ_t r_(jt)x_t−r_(j0))` with `m≥1`, and both lie in
`K′`. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.2
(07H7), Lemma 60.2.6 (tag 07HD) with proof; [Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, Section 60.2, Lemma 60.2.7 (tag 07HE) with proof.) *Needs:* *Universal
base-compatible divided power envelope*; §PD.5 *Relative divided power polynomial algebras*; *Flat
extension of divided powers*; Mathlib `Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`; Mathlib
`DividedPowers.span_isSubDPIdeal_iff`; Mathlib `DividedPowers.Quotient.OfSurjective.dividedPowers`.

**Checks.**

- Flat case: for `B′=B[y]` the canonical map `D_(B,γ)(J)[y]→D_(B[y],γ)(JB[y])` is an isomorphism.
- Hypothesis (1) is needed: for `A=ℤ_(p)`, `I=0`, `B=ℤ_(p)→B′=𝔽_p` and `J=(p)`, `D_B(J)=ℤ_(p)⟨x⟩/(x−p)`, so
  `D_B(J)⊗_B B′=𝔽_p⟨x⟩/(x)` has `𝔽_p`-basis `x^[pj]`, `j≥0`, whereas `D_(B′)(JB′)=D_(𝔽_p)(0)=𝔽_p`; here
  `B/IB→B′/IB′` is not flat.

- For `B′=B` with its identity map, the canonical envelope base-change map is the identity in both assertions.

**Localization of divided power envelopes.** Let `(A,I,γ)` be a divided power ring, `B` an `A`-algebra, `J`
an ideal of `B` with `IB⊆J` and `S⊆B` a multiplicative subset. Write `(D,J̄,γ̄)=D_(B,γ)(J)`. Then
`S⁻¹D=S⁻¹B⊗_B D`, with the divided powers `γ̄_n(x/s)=γ̄_n(x)/sⁿ` (`x∈J̄`, `s∈S`) on `S⁻¹J̄`, is the divided
power envelope of `S⁻¹J` in `S⁻¹B` relative to `(A,I,γ)`: the canonical map `S⁻¹B⊗_B D_(B,γ)(J)→D_(S⁻¹B,γ)(S⁻¹J)` is an isomorphism. If `T⊆A` is a multiplicative subset whose image in `B`
lies in `S` and `γ_T` denotes the extension of `γ` to `T⁻¹I⊆T⁻¹A`, the same ring is also the envelope of
`S⁻¹J` relative to `(T⁻¹A,T⁻¹I,γ_T)`.

*Hypotheses.* `(A,I,γ)` is a divided power ring, `B` a commutative `A`-algebra, `J` an ideal of `B` with `IB⊆J`,
and `S` a multiplicative subset of `B`. In the last sentence `T` is a multiplicative subset of `A` whose
image in `B` is contained in `S`.

*Proof sketch.* localization-formula, applied to `(D,J̄,γ̄)` and the image of `S`, gives the divided
power structure on `S⁻¹J̄` with `γ̄_n(x/s)=γ̄_n(x)/sⁿ`, and `D→S⁻¹D` is a divided power morphism. So
`(S⁻¹D,S⁻¹J̄)` is a divided power ring over `(A,I,γ)` receiving `S⁻¹B`, and `S⁻¹J` maps into `S⁻¹J̄`.
Universal property. For a divided power ring `(C,K,ε)` over `(A,I,γ)`, an `A`-algebra map `S⁻¹B→C` sending
`S⁻¹J` into `K` is a map `B→C` sending `J` into `K` and `S` to units, that is a divided power morphism `g:D→C`
sending `S` to units, that is a ring map `S⁻¹D→C` whose restriction to `D` is a divided power morphism;
such a map is a divided power morphism on `S⁻¹J̄` because `ε_n(g(x)/g(s))=g(s)^(−n)·ε_n(g(x))`.
Alternatively `B→S⁻¹B` is flat (`IsLocalization.flat`), so the hypotheses of envelope-base-change (1)
hold. The last sentence is envelope-quotient-transitivity (2) for `A→T⁻¹A`. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.2 (07H7), the
paragraph before Lemma 60.2.6 (07HD), and Lemma 60.2.6.) *Needs:* *Universal base-compatible divided
power envelope*; §PD.2 *Divided powers after localization*; *Exact base change of divided power
envelopes*; §PD.6 *Envelope quotient and transitivity*; Mathlib `IsLocalization.flat`.

**Checks.**

- For `A=𝔽_p`, `I=0`, `B=𝔽_p[t]`, `J=(t)` and `S` the powers of `t`: `S⁻¹D_B(J)=𝔽_p⟨t⟩[1/t]=0` because `t^p=0` in
  `𝔽_p⟨t⟩`, and `D_(𝔽_p[t,1/t])((1))=0` because `1=1^p=p!·γ_p(1)=0`.
- If `S` consists of units of `B`, both sides are `D_(B,γ)(J)`.

- For `A=B=ℚ[t]`, `I=0`, `J=(t)` and `S` generated by `t`, the localized envelope is `ℚ[t,1/t]` with its rational powers on the unit ideal.

**Étale extension of PD envelopes.** Let `(A,I,γ)` be a PD ring, `P` an `A`-algebra, `J⊂P` an ideal
containing `IP`, and `P→P′` an étale map. Put `J′=JP′`. Then `D_(P′,γ)(J′)≅P′⊗_P D_(P,γ)(J)`, with the
divided powers extended from `D` along the flat map, compatibly with the quotient `P′/J′`. The
construction commutes with composition and localisation. At compatible finite p-power quotients the
same statement holds; the completed version is the inverse limit of these isomorphisms, without
replacing completed tensor product by ordinary tensor product.

*Hypotheses.* The base divided powers extend compatibly to each envelope; `P→P′` is étale, hence flat.
For the completed statement use the finite quotients on which the given divided powers descend.

*Proof sketch.* Extend the divided powers of `D` to `P′⊗_P D` by flat-extension. Its quotient by the
image PD ideal is `P′/J′`. For every compatible PD target `C` receiving `P′` with `J′` mapping to its PD
ideal, the `P`-map gives `D→C`; together with `P′→C` it gives a unique map `P′⊗_P D→C`. The flat-extension
uniqueness shows this is a PD morphism, so it has the envelope universal property. Localisation and
composition follow from uniqueness. Apply the argument at finite levels and then take the inverse
limit for the completed statement. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.2, Lemma 60.2.6 (07HD), base-change proof; [Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, §23.4, Lemma 23.4.2 (07H1),
flat-extension case.) *Needs:* §PD.6 *Universal base-compatible divided power envelope*; *Flat extension
of divided powers*; §PD.2 *Uniqueness of extension to the generated ideal*; *Exact base change of divided
power envelopes*; Mathlib `Algebra.Etale`.

**Checks.**

- For `P′=P[1/f]`, the envelope of `JP′` is `D[1/f]` with its extended divided powers.
- For `P′=P` the map is the identity.
- Completed base change is stated levelwise and uses the completed tensor product.

**Divided power envelopes after adjoining variables.** Let `(A,I,γ)` be a divided power ring, `B` an
`A`-algebra, `J` an ideal of `B` with `IB⊆J`, and `W` a set. Write `(D,J̄,γ̄)=D_(B,γ)(J)`. Then the divided
power envelope of the ideal `JB[x_w]+(x_w:w∈W)` of the polynomial ring `B[x_w:w∈W]`, relative to
`(A,I,γ)`, is the divided power polynomial algebra `D⟨x_w:w∈W⟩` over the divided power ring `(D,J̄,γ̄)`,
with divided power ideal `J̄·D⟨x_w⟩+D⟨x_w⟩₊` on Mathlib’s `DividedPowerAlgebra` and the ring map `B[x_w]→D⟨x_w⟩` extending `B→D` and sending
`x_w` to `x_w`: the canonical divided power morphism `D_(B[x_w],γ)(JB[x_w]+(x_w))→D⟨x_w⟩` is an
isomorphism.

*Hypotheses.* `(A,I,γ)` is a divided power ring, `B` a commutative `A`-algebra and `J` an ideal of `B` with
`IB⊆J`. `W` is an arbitrary set of variables.

*Proof sketch.* For a divided power ring `(C,K,ε)` over `(A,I,γ)`, pd-polynomial applied to the divided
power ring `(D,J̄,γ̄)` identifies divided power morphisms `D⟨x_w⟩→C` over `(A,I,γ)` with pairs `(g,(k_w))`
of a divided power morphism `g:D→C` and elements `k_w∈K`. pd-envelope identifies such `g` with `A`-algebra
maps `f:B→C` with `f(J)⊆K`. A pair `(f,(k_w))` is the same as an `A`-algebra map `B[x_w]→C` sending
`JB[x_w]+(x_w)` into `K`. Hence `D⟨x_w⟩`, with the map from `B[x_w]`, has the universal property of the
envelope of `JB[x_w]+(x_w)`, and the canonical map is an isomorphism. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, Section 60.2 (07H7), Lemma
60.2.5 (tag 07KE) with proof.) *Needs:* §PD.6 *Universal base-compatible divided power envelope*;
§PD.5 *Relative divided power polynomial algebras*.

**Checks.**

- For `B=A=𝔽_p`, `I=J=0` and one variable `t`: `D_(𝔽_p[t])((t))=𝔽_p⟨t⟩`, in which `t^p=p!·t^[p]=0`.
- For `(A,I,γ)=(ℤ_(p),(p),canonical)`, `B=A`, `J=(p)` and one variable `t`: `D_(ℤ_(p)[t],γ)((p,t))=ℤ_(p)⟨t⟩`
  with divided power ideal `(p)+(t^[n]:n≥1)`.

- With `W` empty the canonical isomorphism is `D_(B,γ)(J)≅D` and preserves the original PD ideal.

**Divided power stability of the weighted filtration.** For `n≥1`, `m≥1` and `x∈Fⁿ_γI`: `γ_m(x)∈F^(mn)_γI`.
In particular `Fⁿ_γI (n≥1)` is a sub-PD ideal of `(I,γ)` (`DividedPowers.IsSubDPIdeal`), and `γ` induces a
divided power structure on the image of `I` in `R/Fⁿ_γI` (`DividedPowers.Quotient.dividedPowers`).

*Hypotheses.* `R` is a commutative ring, `I` an ideal of `R` and `γ` a divided power structure on `I` (`γ : DividedPowers I`). `m≥1` and `n≥1` are natural numbers.

*Proof sketch.* Words. Let `w=∏_j γ_(e_j)(x_j)` be a generating word with `Σe_j≥n≥1` and pick `t` with
`e_t≥1`. Writing `w=u·γ_(e_t)(x_t)`, the scalar rule and the iteration rule give
`γ_m(w)=u^m·uniformBell(m,e_t)·γ_(m·e_t)(x_t)`, and `u^m` is an integer multiple of
`∏_(j≠t)γ_(m·e_j)(x_j)` by the multiplication rule. So `γ_m(w)` is a multiple of a word of weight
`m·Σe_j≥mn`. Span. `γ_m(a·x)=a^m·γ_m(x)`, `γ_m(0)=0`, and `γ_m(x+y)=Σ_(i+j=m)γ_i(x)γ_j(y)` lies in
`Σ_(i+j=m)F^(in)·F^(jn)⊆F^(mn)` by pd-filtration-mul once the claim is known for `x` and `y` and all
smaller indices `(γ₀=1∈F⁰)`. Induct over the span `Fⁿ_γI=Ideal.span(W_n)`, for all `m≥1` simultaneously.
Consequences. `Fⁿ_γI⊆F¹_γI=I` (pd-filtration-antitone, pd-filtration-one) and
`γ_m(Fⁿ_γI)⊆F^(mn)_γI⊆Fⁿ_γI`, so `Fⁿ_γI` is a sub-PD ideal; `DividedPowers.Quotient.dividedPowers` applies
with `Fⁿ_γI∩I=Fⁿ_γI`. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
Section 60.6 (07HQ), unnumbered paragraph between Lemma 60.6.2 (07HS) and Lemma 60.6.3 (07HT).)
*Needs:* §PD.4 *Divided power filtration*; §PD.4 *First divided power filtration step*; *Decreasing divided
power filtration*; §PD.4 *Multiplicativity of divided power filtration*; Mathlib `DividedPowers`; Mathlib
`DividedPowers.IsSubDPIdeal`; Mathlib `DividedPowers.Quotient.dividedPowers`.

**Checks.**

- In `ℤ₂` with the canonical divided powers on `(2)`: `Fⁿ=(2)` for all `n≥1`, and `γ_m` maps `(2)` into
  `(2)=F^(mn)`.
- For `x∈I` and `m,n≥1`: `γ_m(γ_n(x))=uniformBell(m,n)·γ_(mn)(x)` lies in `F^(mn)_γI`.

- For `R=ℚ[t]` and `I=(t)`, `γ₂(t²)=t⁴/2` lies in `F⁴=(t⁴)`, with `n=m=2`.

**Envelopes of regular immersions.** For elements `f₁,…,f_r` of a ring, the Koszul relations are the
elements `f_j e_i−f_i e_j` of its `r`-th power. (0) General divided power base. Let `(B,I,γ)` be a divided
power ring, `f₁,…,f_r∈B` and `J=I+(f₁,…,f_r)`. Assume `(K)`: every `(r_t)∈B^r` with `Σ_t r_t f_t∈I` is
congruent modulo `I·B^r` to a `B`-linear combination of Koszul relations. Then the surjection
`Ψ:B⟨x₁,…,x_r⟩→D_(B,γ)(J)`, `x_t↦f_t`, of `PDEnvelope.presentation` has kernel `(x₁−f₁,…,x_r−f_r)`:
`D_(B,γ)(J)=B⟨x₁,…,x_r⟩/(x_t−f_t)`, with divided power ideal generated by `I` and the `x_t^[n]`, `n≥1`. For
`r=1`, `(K)` says that `f₁` is a non-zero-divisor on `B/I`; in general `(K)` holds when the images of `f₁,…,f_r`
in `B/I` form a regular sequence, or a Koszul-regular one. (1) Characteristic `p` (Bhatt, Lemma 3.37).
Let `A` be an `𝔽_p`-algebra and `f₁,…,f_r` a regular sequence in `A`, `I=(f₁,…,f_r)`, with the trivial divided
power base; for `(b)`, `(c)` and the Tor statement in `(d)` assume moreover that each `f_t` is a
non-zero-divisor on `A` (automatic when `A` is Noetherian local; without it `D_A((f_t))` is a proper
quotient of `A⟨x_t⟩/(x_t−f_t)` in general, and `(b)`, `(c)`, `(d)` hold for the rings `A⟨x_t⟩/(x_t−f_t)` in
place of `D_A((f_t))`). Then (a) `D_A(I)=A⟨x₁,…,x_r⟩/(x_t−f_t)`; `(b)` the natural map `⊗_A D_A((f_t))→D_A(I)` from the tensor product of the principal envelopes `D_A((f_t))=A⟨x_t⟩/(x_t−f_t)` is
an isomorphism; (c) `D_A((f_t))` is a free `A/(f_t^p)`-module on the `γ_(jp)(f_t)`, `j≥0`, so `D_A(I)` is a
free `A/(f₁^p,…,f_r^p)`-module on the products `∏_t γ_(j_t p)(f_t)`, `j₁,…,j_r≥0`; (d) `x₁−f₁,…,x_r−f_r` is
a regular sequence on `A⟨x₁,…,x_r⟩=⊗_A A⟨x_t⟩`, so the Koszul complex on it is a resolution of `D_A(I)`
by free `A`-modules and the derived tensor product `⊗^L_A D_A((f_t))` is `D_A(I)` in degree 0
(`Tor_k^A(D_A((f₁,…,f_(t−1))),D_A((f_t)))=0` for `k>0`). (2) Flat `ℤ/p^n`-algebras (Bhatt, Lemma 3.38).
Let `A` be a flat `ℤ/p^n`-algebra, `f₁,…,f_r` a regular sequence in `A` with `A/I` flat over `ℤ/p^n`,
`I=(f₁,…,f_r)`, and `D=D_(A,γ)(I+pA)` the envelope relative to `(ℤ_(p),(p),γ)`, `γ` the canonical divided
powers on `(p)`. Then `D=A⟨x₁,…,x_r⟩/(x_t−f_t)`, it coincides with the envelope of `I` over the trivial
base, `D` is flat over `ℤ/p^n`, and `D/pD=D_(A/p)((I+pA)/pA)`, the envelope of the image of `I` in the
`𝔽_p`-algebra `A/p`.

`Suggested.lean` states the presentation in (0) as `PD.regularImmersionEnvelope`, using
`PD.regularEnvelopeRelations` for the ideal `(x₁−f₁,…,x_r−f_r)` on Mathlib's divided-power algebra.
The hypothesis is exactly `(K)`, over an arbitrary divided power base.

*Hypotheses.* (0): `(B,I,γ)` is a divided power ring, `f₁,…,f_r∈B`, and `(K)` holds: if `Σ_t r_t f_t∈I` with
`r_t∈B`, then `(r_t)−Σ_(i<j)c_(ij)(f_j e_i−f_i e_j)∈I^r` for some `c_(ij)∈B`. (1): `p` is a prime, `A` an
`𝔽_p`-algebra and `f₁,…,f_r` a regular sequence in `A` (`RingTheory.Sequence.IsRegular A [f₁,…,f_r]`; only
weak regularity is used); the divided power base is `(𝔽_p,0)`. For (1)(b), (1)(c) and the Tor
statement of (1)(d) each `f_t` is moreover a non-zero-divisor on `A`. (2): `p` is a prime, `n≥1`, `A` a flat
`ℤ/p^n`-algebra, `f₁,…,f_r` a regular sequence in `A` and `A/(f₁,…,f_r)` flat over `ℤ/p^n`; the divided power
base is `(ℤ_(p),(p),γ)` with the canonical divided powers.

*Proof sketch.* (0) By `PDEnvelope.presentation` the kernel of `Ψ` is generated by the `x_t−f_t` and the
`δ_n(Σ_t r_t x_t−r₀)`, `n≥1`, for relations `Σ_t r_t f_t=r₀∈I`. By `(K)` write `r_t=k_t+i_t` with `i_t∈I` and
(`k_t)=Σ_(i<j)c_(ij)(f_j e_i−f_i e_j`). Then `Σ_t k_t f_t=0`, `r₀=Σ_t i_t f_t` and `Σ_t r_t x_t−r₀=Σ_(i<j)c_(ij)(f_j x_i−f_i x_j)+Σ_t i_t(x_t−f_t)`, a sum of elements of the divided power ideal
`IB⟨x⟩+B⟨x⟩₊`. `δ_n` of this sum is a sum of products of `δ_m` of the summands, each product having a
factor with `m≥1`. `δ_m(i_t(x_t−f_t))=(x_t−f_t)^m·γ_m(i_t)` lies in `𝔟=(x₁−f₁,…,x_r−f_r)`. `δ_m(f_j x_i−f_i x_j)=Σ_(a+b=m)(−1)^b f_j^a f_i^b x_i^[a]x_j^[b]`; modulo `𝔟` replace `f_i,f_j` by `x_i,x_j` and use
`x^b·x^[a]=(m!/a!)·x^[m]` to get `m!·x_i^[m]x_j^[m]·Σ_b(−1)^b binom(m,b)=0` for `m≥1` (the computation in
the proof of Bhatt's Lemma 3.37). Hence the kernel of `Ψ` is `𝔟`. (1)(a) is (0) for `(A,0)`; `(K)` is the
statement that the relations among the members of a regular sequence are generated by the Koszul
relations. (b) `A⟨x₁,…,x_r⟩=⊗_A A⟨x_t⟩` by the divided monomial bases (pd-polynomial), and the tensor
product is right exact. (1)(c) `𝔽_p⟨t⟩` is free over `𝔽_p[t]/(t^p)` on the `t^[jp]`:
`t^a·t^[jp]=a!·binom(a+jp,a)·t^[a+jp]` with `binom(a+jp,a)≡1` mod `p` for `0≤a<p` (`Choose.choose_modEq_choose_mod_mul_choose_div_nat`), and `t^p=p!·t^[p]=0`. `𝔽_p[t]⟨x⟩/(x−t)` and `𝔽_p⟨t⟩`
are both the envelope of `(t)` in `𝔽_p[t]` (by (0) and by envelope-add-variables); base change along
`𝔽_p[t]→A`, `t↦f_t`, gives `A⟨x_t⟩/(x_t−f_t)=⊕_j A/(f_t^p)·γ_(jp)(f_t)`. The identification with the
actual principal envelope uses the additional assumption that `f_t` is a non-zero-divisor on `A`.
Without that assumption this argument establishes the module basis for the presentation ring only.
(1)(d) `x₁−f₁` is a non-zero-divisor on `A⟨x₁,…,x_r⟩` because `f₁` is one on `A` (compare coefficients of
`x₁^[n]`). By `(c)` the quotient is `⊕_j (A/f₁^p)⟨x₂,…,x_r⟩`, on which `x₂−f₂` is a non-zero-divisor because
`f₂` is one on `A/(f₁^p)`; continue, using that `f₁^p,…,f_(t−1)^p,f_t` is a regular sequence. The Koszul
complex of a regular sequence is a resolution. Raising members of a weakly regular sequence to
positive powers preserves weak regularity. At step `t` use this with `f₁^p,…,f_(t−1)^p,f_t`; the Koszul
resolution is DerivedModuleAlgebra §0.K.1, and the statement on powers is part of this target. The
two-term resolution for each actual principal envelope also uses the added non-zero-divisor
assumption on `A`. Tensoring these free resolutions yields the Koszul resolution on all `x_t−f_t`, so
its concentration in degree zero proves the asserted Tor vanishing. (2) Each `A/(f₁,…,f_i)` has a
finite resolution by flat `ℤ/p^n`-modules (`A` is flat and the sequence regular), hence is flat; so
`f₁,…,f_r` stays a regular sequence on `A/p`. Let `D₀=D_(A,0)(I)=A⟨x⟩/(x_t−f_t)` by (0), with divided
power ideal `J̄₀` and `D₀/J̄₀=A/I`. Flatness of `A/I` gives `pD₀∩J̄₀=pJ̄₀`, so the divided powers of `J̄₀` and
the canonical ones on `pD₀` glue and `D₀=D` (`PDEnvelope.eq_of_isCompatible`). Flatness of `D`. For `r=1`, `x−f`
is a non-zero-divisor on the flat module `A⟨x⟩`, so `D` has a two-term flat resolution and is flat. For
`r>1` induct, replacing `A` by `A₁=A⟨x₁⟩/(x₁−f₁)`: `f₂,…,f_r` is regular on `A₁/p=⊕_j (A/p)/(f₁^p)·γ_(jp)(f₁)`
by (1)(c) over `A/p`, hence on the flat `ℤ/p^n`-module `A₁`. Reduction. envelope-quotient-transitivity (1)
with kernel `pA` gives `D_(A/p)((I+pA)/pA)=D/K′` with `K′` generated by the `γ̄_n(pa)=aⁿ·γ_n(p)∈pD`, so
`K′=pD`. For a flat `ℤ/pⁿ`-module, an endomorphism injective modulo `p` is injective with flat cokernel
(induction on `n`); this algebra step and the reduction of the PD relations by Koszul syzygies under
condition `(K)` are part of this target, with Koszul exactness for weakly regular sequences from
TauCetiRoadmap DerivedModuleAlgebra §0.K.1. ([Bhatt, *p-adic derived de Rham
cohomology*](https://arxiv.org/abs/1204.6560), Section 3.3, Lemma 3.37 with proof, p.16; [Bhatt,
*p-adic derived de Rham cohomology*](https://arxiv.org/abs/1204.6560), Section 3.3, Lemma 3.38:
statement p.16, proof p.17; [Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, Section 60.24, Remark 60.24.9 (tag 07MU), hint.) *Needs:* *Universal base-compatible
divided power envelope*; §PD.5 *Relative divided power polynomial algebras*; *Envelope quotient and
transitivity*; §PD.6 *Divided power envelopes after adjoining variables*; *Compatibility of divided
powers with a base*; §PD.5 *Canonical divided powers on the ideal generated by `p`*; TauCetiRoadmap
DerivedModuleAlgebra §0.K.1 (*Koszul complexes*); DerivedModuleAlgebra §§1.2–1.5; Mathlib
`RingTheory.Sequence.IsRegular`; Mathlib `Choose.choose_modEq_choose_mod_mul_choose_div_nat`.

**Checks.**

- Regular principal ideal: for `A=𝔽_p[t]` and `f=t`, `D_A((t))=𝔽_p⟨t⟩` is free over `𝔽_p[t]/(t^p)` on the
  `t^[jp]`, `j≥0`, and `t^p=0` in it.
- For `A=(ℤ/p^n)[t]` and `f=t`, relative to `(ℤ_(p),(p),γ)`: `D=(ℤ/p^n)⟨t⟩`, flat over `ℤ/p^n`, with
  `D/pD=𝔽_p⟨t⟩`.
- (0) with `r=1` over a general base: for a divided power ring `(D,J̄,γ̄)` and `λ∈D`, the monic polynomial
  `z^p−λ` is a non-zero-divisor on `(D/J̄)[z]`, and `D_(D[z],γ̄)(J̄D[z]+(z^p−λ))=D[z]⟨ξ⟩/(ξ−(z^p−λ))`, the
  ring of Stacks Lemma 60.25.3 before completion.

**Completed PD envelopes and the derived-completion comparison.** Let `p` be a prime and `(D,J̄,γ̄)` a
divided power ring in which `p` is nilpotent in `D/J̄`; this holds for an envelope `D=D_(B,γ)(J)` whenever
`p` is nilpotent in `B/J`. Let `D^=lim_e D/p^eD` be the p-adic completion (`AdicCompletion (p) D`). Then:
(1) `D^→D/J̄` is surjective and its kernel `J̄^` is the p-adic completion of `J̄`; (2) each `γ̄_n` is
continuous for the p-adic topology of `J̄` and extends uniquely to maps `γ̄^_n:J̄^→J̄^`, which form a
divided power structure on `J̄^`, and `D→D^` is a divided power morphism; (3) if `D` is a `ℤ_(p)`-algebra
and `p^t∈J̄`, then for every `e>t` the ideal `p^eD⊆J̄` is a sub-PD ideal and
`(D^,J̄^,γ̄^)=lim_e(D/p^eD,J̄/p^eD,γ̄)` as divided power rings. Relation with derived completion: if `D`
has bounded p-power torsion, the derived p-completion of `D` is `D^` placed in degree 0; if `D` is
p-torsion-free, `D⊗^L_ℤ ℤ/p^e=D/p^eD` for all `e≥1`.

*Hypotheses.* `p` is a prime; `(D,J̄,γ̄)` is a divided power ring with `p^t∈J̄` for some `t≥1` (`p` is
nilpotent in `D/J̄`). (3): every integer prime to `p` is invertible in `D`. Derived statements: `D` has
bounded p-power torsion (`D[p^∞]=D[p^N]` for some `N`), respectively `D` is p-torsion-free.

The API:

- `Crystalline.completedEnvelope_reduction`: For p-torsionfree `D`, `LΛ_p(D)⊗^L ℤ/p^e≅D/p^e`.
- `Crystalline.completedEnvelope_lift`: Let `(C,K,ε)` be a divided power ring with `C` p-adically
  complete and separated and `K` p-adically closed. Every divided power morphism `(D,J̄,γ̄)→(C,K,ε)`
  extends uniquely to a divided power morphism `(D^,J̄^,γ̄^)→(C,K,ε)`. In particular this applies when
  `p` is nilpotent in `C/K`, since then `K` contains a power of `p` and is open and closed.
- `Crystalline.completedEnvelope_functorial`: A divided power morphism `f:(D,J̄,γ̄)→(D′,J̄′,γ̄′)`
  between divided power rings with `p` nilpotent in `D/J̄` and in `D′/J̄′` induces a divided power
  morphism `f^:(D^,J̄^,γ̄^)→(D′^,J̄′^,γ̄′^)` extending `f`; `(g∘f)^=g^∘f^` and `id^=id`.
- `Crystalline.completedEnvelope_mod_pow`: Let `(A,I,γ)` be a divided power ring with `A` a
  `ℤ_(p)`-algebra, `A→C` a ring map with `IC=0` and `p^t·C=0`, `P→C` a surjection of `A`-algebras with kernel `J`
  and `D=D_(P,γ)(J)`. For `e≥1` let `D_e=D_(P/p^eP,γ)(J_e)`, `J_e` the image of `J`. Then for every `e>t`:
  `D^/p^eD^=D/p^eD=D_e` as divided power rings.
- `Crystalline.completedEnvelope_eq_limit`: In the situation of `completedEnvelope_mod_pow`,
  `(D^,J̄^,γ̄^)=lim_e(D_e,J̄_e,γ̄)` in the category of divided power rings.

*Proof sketch.* Let `p^t∈J̄`. `D^→D/J̄` is the composite `D^→D/p^tD→D/J̄`, hence surjective;
`p^eJ̄⊆p^eD∩J̄⊆p^(e−t)J̄` for `e≥t` shows that its kernel is the p-adic completion of `J̄`. For `x,y∈J̄`,
`γ̄_n(x+p^e y)=Σ_(i+j=n)p^(je)γ̄_i(x)γ̄_j(y)≡γ̄_n(x)` modulo `p^eJ̄`; so `γ̄_n` induces compatible maps
`J̄/p^eJ̄→J̄/p^eJ̄` and a map `γ̄^_n` on `J̄^`, and the axioms pass to the limit. If `D` is a `ℤ_(p)`-algebra
and `e>t`: for `n≥2`, `γ̄_n(p^e a)=pⁿ·γ̄_n(p^(e−1)a)=(pⁿ/n!)·p^(n(e−1))·aⁿ∈p^eD`, because `pⁿ/n!∈ℤ_(p)` and
`n(e−1)≥e`. So `p^eD` is a sub-PD ideal, `D/p^eD` inherits divided powers
(`DividedPowers.Quotient.dividedPowers`), and `(D^,J̄^,γ̄^)` is their limit. Derived completion. For a
ring `D` with bounded p-power torsion the derived p-completion is `Rlim_e D/p^eD` (comparison of derived
completion with the tower of ordinary quotients, DerivedModuleAlgebra §§1.2–1.5); the tower has
surjective transition maps, so this is `D^` in degree 0. For p-torsion-free `D`, multiplication by `p^e`
is injective, so `D⊗^L_ℤ ℤ/p^e=D/p^eD`. For the extension property, the completion universal property
gives the ring map. Closedness of `K` ensures that it carries `J̄^` into `K`. Continuity of each divided
power and density then give the PD identities. The hypothesis `p` nilpotent in `C/K` is a sufficient
special case, not necessary. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, Section 60.5 (07HL): Remark 60.5.4 (07KH) and Lemma 60.5.5 (07KG) with proof; [Stacks
Project](https://stacks.math.columbia.edu), Divided Power Algebra, Section 23.4, Lemma 23.4.5 (tag
07KD) with proof.) *Needs:* §PD.6 *Universal base-compatible divided power envelope*;
DerivedModuleAlgebra §1.3 (*The derived completion reflector*); DerivedModuleAlgebra §1.5 (*When
ordinary quotient towers compute completion*); DerivedModuleAlgebra §1.1 (`derivedLimit_surjective`,
the surjective module tower); Mathlib `AdicCompletion`; Mathlib
`DividedPowers.Quotient.dividedPowers`.

**Checks.**

- `test_completedEnvelope_Zp`: For `(D,J̄,γ̄)=(ℤ_(p),(p),canonical)`, `p` is nilpotent in `D/J̄=𝔽_p` and
  the completed divided power ring `(D^,J̄^,γ̄^)` is (`ℤ_p,(p),PadicInt.dividedPowers p`), for every
  prime `p` including `p=2`.
- `test_completedEnvelope_modp`: A p-killed envelope has derived completion equal to itself in
  degree0.
- `test_completedEnvelope_p2`: In `ℤ₂` with the canonical divided powers on `(2)`: `γ_(2^a)(2)` is 2 times
  a unit for every `a≥0`, so `γ_n(2)` does not tend to 0 and `Fⁿ((2))=(2)` for all `n≥1`; in `ℤ_p` with `p` odd,
  `γ_n(p)→0` and the intersection of the `Fⁿ((p))` is 0.
- For `P=ℤ_(p)[t]→𝔽_p (t↦0)`, `J=(p,t)`, relative to `(ℤ_(p),(p),γ)`: `D=ℤ_(p)⟨t⟩`; `D^` is its p-adic
  completion, `J̄^` the closure of `(p)+(t^[n]:n≥1)`, and `D^/p^eD^=(ℤ/p^e)⟨t⟩=D_((ℤ/p^e)[t],γ)((p,t))`
  for every `e≥2`.

### PD.7 The crystalline period ring

**The crystalline period ring `A_cris` of a p-adically complete ring.** Let `p` be a prime and `R` a
commutative ring that is p-adically complete and in which `p` is not a unit. Let `R♭=PreTilt R p` be the
perfection of `R/p`, `A=𝕎(R♭)` its ring of Witt vectors (a p-torsion-free, p-adically complete ring with
`A/p=R♭`) and `θ=WittVector.fontaineTheta R p:A→R` Fontaine's map, the ring homomorphism with `θ([x])=x^♯`
on Teichmüller representatives; `θ` is surjective when Frobenius is surjective on `R/p`. Write `γ` for the
canonical divided powers on `(p)`, in `A` and in `R`. (a) Definition. `D(R)=D_(A,γ)(ker θ+pA)` is the
divided power envelope of `ker θ+pA` relative to `(A,pA,γ)` (equivalently relative to `(ℤ_p,(p),γ)`), with
divided power ideal `J̄∋p`, and `A_cris(R)` is the p-adic completion of `D(R)`, with the divided powers on
the closure `J̄^` of `J̄` given by completed-envelope. `(b)` Comparison of bases. If `A/ker θ` is
p-torsion-free (for instance if `R` is), the canonical map `D_(A,0)(ker θ)→D(R)` from the envelope of
`ker θ` over the trivial divided power base is an isomorphism of `A`-algebras; under it `J̄=J̄₀+pD(R)`,
where `J̄₀` is the divided power ideal of `D_(A,0)(ker θ)`. `(c)` Principal case. Assume `ker θ` is
generated by an element `ξ` whose image in `A/p=R♭` is a non-zero-divisor (so that `(p,ξ)` is a regular
sequence in `A`). Then `D(R)=A⟨x⟩/(x−ξ)` is p-torsion-free and equals the subring `A[ξⁿ/n!:n≥0]` of `A[1/p] (x^[n]↦ξⁿ/n!)`; `A_cris(R)` is its p-adic completion and is p-torsion-free. For `R=O_C`, this is the
presentation and completion supplied by PadicPeriodRings §3, under the specialization below.
`(d)` Maps. `θ` extends
uniquely to a divided power morphism `θ_cris:(A_cris(R),J̄^)→(R,pR,γ)`; it kills `γ_n(x)` for `x∈ker θ`
and `n≥1`, and if `θ` is surjective and `R` is p-torsion-free it is surjective with kernel the closure of
`J̄₀`. For a perfect ring `k` of characteristic `p` and a ring map `π:R→k`, the map `A→𝕎(k)` induced on Witt
vectors by `R♭→R/p→k` (zeroth coefficient followed by `π`) sends `ker θ+pA` into `p𝕎(k)` and extends
uniquely to a divided power morphism `(A_cris(R),J̄^)→(𝕎(k),p𝕎(k),γ)`.

*Hypotheses.* `p` is a prime; `R` is a commutative ring, p-adically complete (`IsAdicComplete (p) R`), and
`p` is not a unit of `R`. `(b)`: `𝕎(R♭)/ker θ` is p-torsion-free. `(c)`: `ker θ=(ξ)` and the image of `ξ` in
`𝕎(R♭)/p=R♭` is a non-zero-divisor. `(d)`, second map: `k` is a perfect ring of characteristic `p` and `π:R→k`
a ring homomorphism.

The API:

- `Crystalline.fontaineEnvelope_initial`: Let `(C,K,ε)` be a divided power ring with `C` p-adically
  complete and separated, `p∈K` and `ε_n(p)=pⁿ/n!` for all `n`. Every ring map `f:𝕎(R♭)→C` with `f(ker θ)⊆K`
  extends uniquely to a divided power morphism `(A_cris(R),J̄^)→(C,K,ε)`. On `O_C` this agrees with
  PadicPeriodRings §3's completed initial property under `Crystalline.fontaineEnvelope_periodPDEnvelope`.
- `Crystalline.fontaineEnvelope_theta`: `θ_cris:(A_cris(R),J̄^)→(R,pR,γ)` is the unique divided power
  morphism restricting to `θ` on `𝕎(R♭)`; `θ_cris(γ_n(x))=0` for `x∈ker θ` and `n≥1`. If `θ` is surjective and `R`
  is p-torsion-free, `θ_cris` is surjective and its kernel is the closure of the sub-PD ideal
  generated by `ker θ`. On `O_C` it is PadicPeriodRings §3's `θ_cris` under the same identification.
- `Crystalline.fontaineEnvelope_identify`: In the principal case `(c)`, the p-adic completion of the
  subring `𝕎(R♭)[ξⁿ/n!:n≥0]` of `𝕎(R♭)[1/p]` is isomorphic to `A_cris(R)` as a `𝕎(R♭)`-algebra, by the
  completion of the isomorphism `𝕎(R♭)⟨x⟩/(x−ξ)→𝕎(R♭)[ξⁿ/n!]`, `x^[n]↦ξⁿ/n!`; both rings are
  p-torsion-free. On `O_C` use PadicPeriodRings §3's presentation, embedding and completion,
  transported by `Crystalline.fontaineEnvelope_periodPDEnvelope`.
- `Crystalline.fontaineEnvelope_eq_trivialBase`: If `𝕎(R♭)/ker θ` is p-torsion-free, the canonical map
  `D_(𝕎(R♭),0)(ker θ)→D(R)` is an isomorphism of `𝕎(R♭)`-algebras, and the divided power ideal of `D(R)`
  is `J̄₀+pD(R)`.
- `Crystalline.fontaineEnvelope_wittResidue`: For a perfect ring `k` of characteristic `p` and a ring
  map `π:R→k`, the map `𝕎(R♭)→𝕎(k)` induced by `R♭→R/p→k` sends `ker θ+(p)` into `p𝕎(k)` and extends uniquely
  to a divided power morphism `(A_cris(R),J̄^)→(𝕎(k),p𝕎(k),γ)`.
- `Crystalline.fontaineEnvelope_map`: A ring homomorphism `f:R→R′` between p-adically complete rings
  in which `p` is not a unit induces `𝕎(f♭):𝕎(R♭)→𝕎(R′♭)` with `θ′∘𝕎(f♭)=f∘θ` and a divided power morphism
  `A_cris(f):A_cris(R)→A_cris(R′)` with `θ′_cris∘A_cris(f)=f∘θ_cris`; `A_cris(g∘f)=A_cris(g)∘A_cris(f)`
  and `A_cris(id)=id`.

*Proof sketch.* (a) `R♭` is a perfect ring of characteristic `p`, so `A=𝕎(R♭)` is p-torsion-free
(`WittVector.eq_zero_of_p_mul_eq_zero`) and p-adically complete (`WittVector.isAdicCompleteIdealSpanP`).
Integers prime to `p` are units in `A` and in `R`, so `(p)` carries its canonical divided powers in both
(canonical-p-divided-powers). Form `D(R)` by pd-envelope; since `p∈J̄`, `p` is nilpotent in `D(R)/J̄` and
completed-envelope gives the divided powers on `J̄^`. `(b)` Let `D₀=D_(A,0)(ker θ)` with divided power
ideal `J̄₀`. `D₀/J̄₀=A/ker θ` is p-torsion-free, so `pD₀∩J̄₀=pJ̄₀=(pD₀)·J̄₀`. Hence the divided powers of
`J̄₀` are compatible with `γ` (product-intersection-gluing, compatible-divided-powers), and `(D₀,J̄₀+pD₀)`
is the envelope of `ker θ+pA` relative to `(A,pA,γ)` (`PDEnvelope.eq_of_isCompatible`). (c) `ξ` is a
non-zero-divisor in `A`: if `ξa=0` then `a∈pA` because `ξ` is a non-zero-divisor modulo `p`, `a=pa₁` with `ξa₁=0`,
and so `a∈∩pⁿA=0`. `A/ξ` is p-torsion-free: `pa=ξb` implies `b∈pA`, `b=pb₁` and `a=ξb₁`. By regular-envelope (0)
with `r=1` over `(A,0)`, `D₀=A⟨x⟩/(x−ξ)`. `x−ξ` is a non-zero-divisor on `A⟨x⟩` and on `(A/p)⟨x⟩` (compare
coefficients of `x^[n]`), so `D₀` is p-torsion-free; `D₀[1/p]=A[1/p]⟨x⟩/(x−ξ)=A[1/p]` identifies `D₀` with
`A[ξⁿ/n!]`. Apply `(b)`. The p-adic completion of a p-torsion-free ring is p-torsion-free. (d) `(R,pR,γ)`
is a divided power ring over `(A,pA,γ)` through `θ`, and `θ(ker θ+pA)⊆pR`. pd-envelope gives a divided
power morphism `D(R)→R`, and `completedEnvelope_lift` extends it to `A_cris(R)`, since `R` is p-adically
complete and `R/pR` is killed by `p`. It kills `γ_n(x)` for `x∈ker θ` because `γ_n(0)=0`. If `R` is
p-torsion-free and `θ` is surjective, the p-adic completion of `0→J̄₀→D₀→R→0` is exact
`(p^eD₀∩J̄₀=p^eJ̄₀)` and `R` is complete. Witt map. Let `w=WittVector.map(π̄∘coeff₀):A→𝕎(k)`, where
`coeff₀:R♭→R/p` and `π̄:R/p→k` is induced by `π`. For `x∈ker θ`, `WittVector.mk_fontaineTheta` gives
`coeff₀(x₀)=θ(x)` mod `p=0`, so `w(x)` has zeroth coefficient 0 and lies in `p𝕎(k)` (`WittVector.mem_span_p_iff_coeff_zero_eq_zero`). `(𝕎(k),p𝕎(k),γ)` is a divided power ring over `(A,pA,γ)`
and `𝕎(k)` is p-adically complete (`WittVector.isAdicCompleteIdealSpanP`); conclude as for `θ`.
Functoriality. A ring map `f:R→R′` induces `R/p→R′/p`, `f♭:R♭→R′♭` on perfections and `𝕎(f♭)`. Both `θ′∘𝕎(f♭)`
and `f∘θ` send `[x]` to `f(x^♯)=(f♭x)^♯` (`WittVector.fontaineTheta_teichmuller`; the untilt is a limit of
`p^n`-th powers of lifts and `f` is p-adically continuous), so they agree modulo every power of `p` (`WittVector.eq_of_apply_teichmuller_eq`) and are equal. Hence `𝕎(f♭)` maps `ker θ+pA` into `ker θ′+pA′` and
induces divided power morphisms `D(R)→D(R′)` and `A_cris(R)→A_cris(R′)`. Clause `(c)` needs `ker θ`
principal on a non-zero-divisor modulo `p`; for `R = S⁺` with (`S`, `S⁺`) a perfectoid Tate pair and `S⁺`
p-torsion-free (for instance `O_C`) this is PerfectoidSpaces §P1.18, and for other integral
perfectoid rings it is kept as the stated hypothesis. ([Bhatt, *p-adic derived de Rham
cohomology*](https://arxiv.org/abs/1204.6560), Section 9, Proposition 9.9 (statement), p.35;
[Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), Section 3.3, Definition
3.22(i), p.27.) *Needs:* §PD.6 *Universal base-compatible divided power envelope*; *Completed PD envelopes
and the derived-completion comparison*; §PD.5 *Canonical divided powers on the ideal generated by `p`*;
§PD.5 *Compatibility of divided powers with a base*; §PD.1 *Gluing when intersection equals product*; *Envelopes
of regular immersions*; Mathlib `PreTilt`; Mathlib `WittVector.fontaineTheta`; Mathlib
`WittVector.fontaineTheta_teichmuller`; Mathlib `WittVector.mk_fontaineTheta`; Mathlib
`surjective_fontaineTheta`; Mathlib `WittVector.eq_zero_of_p_mul_eq_zero`; Mathlib
`WittVector.isAdicCompleteIdealSpanP`; Mathlib `WittVector.mem_span_p_iff_coeff_zero_eq_zero`;
Mathlib `WittVector.map`; Mathlib `WittVector.eq_of_apply_teichmuller_eq`.

**Checks.**

- `test_fontaineEnvelope_theta`: For `x∈ker θ` and `n≥1`: `θ_cris(γ_n(x))=0` in `R`; and
  `θ_cris(γ_n(p))=pⁿ/n!`.
- `test_fontaineEnvelope_identity`: For `R=ℤ_p`: `R♭=𝔽_p`, `𝕎(R♭)=ℤ_p`, `θ` is the identity, `ker θ=0`, and
  `A_cris(ℤ_p)=ℤ_p` with divided power ideal `(p)`, its canonical divided powers and `θ_cris` the
  identity.
- `test_fontaineEnvelope_p2`: For `p=2`: in `A_cris(ℤ₂)=ℤ₂` the divided powers `γ_(2^a)(2)` have 2-adic
  valuation 1 for every `a≥0`, so `γ_n(2)` does not tend to 0; for odd `p`, `γ_n(p)→0` in `A_cris(ℤ_p)`.
- `test_fontaineEnvelope_mod_p`: In the principal case `(c)`: `ξ^p∈pA_cris(R)`, and `A_cris(R)/p` is a
  free `R♭/(ξ̄^p)`-module on the classes of the `γ_(jp)(ξ)`, `j≥0`; in particular the kernel of
  `R♭=𝕎(R♭)/p→A_cris(R)/p` is `(ξ̄^p)`.

**Specialization to the ordinary period envelope.** Let `C` be a complete algebraically closed
nonarchimedean field of characteristic zero and residue characteristic `p`, and let `O_C` be its
valuation ring. Use PerfectoidSpaces §§P1.17–P1.18 to identify `A_inf` and `θ` with the data of
PadicPeriodRings §3 `periodPDEnvelope`. Its principal envelope, presentation
`A_inf⟨x⟩/(x−ξ) ≃ A_inf[ξⁿ/n!:n≥0]`, p-torsion-freeness, separated p-adic completion and
`θ_cris` are supplied by that section. Construct
`Crystalline.fontaineEnvelope_periodPDEnvelope`: the unique `A_inf`-algebra isomorphism from
`D(O_C)` to that ordinary principal envelope, and its extension between their separated p-adic
completions. Construct the maps in both directions by their base-compatible PD universal
properties; uniqueness makes their composites identities. The isomorphisms preserve the full
PD ideal `J = J₀ + pD`, its powers, and separately the small ideal `J₀` generated by `ker θ`
and its PD filtration, including their closures after completion. Thus they preserve the Hodge
filtration coming from `J₀`; its first quotient is `O_C`, whereas the quotient by `J` is `O_C/p`.
The presentation comparison sends `x^[n]` to the supplied `ξⁿ/n!`; its completion identifies
`Crystalline.fontaineEnvelope_identify` on `O_C` with PadicPeriodRings §3's completed presentation.

Prove compatibility with the `A_inf` structure map, `θ_cris`, every divided power, the
ordinary completion maps, and functorial maps of Fontaine data. The completed isomorphism carries
each convergent logarithm of §5.11 to the same series in the supplied carrier. For the period
setup of §5.11 it also intertwines the supplied Witt Frobenius and `G_K` actions by uniqueness on
the uncompleted envelope and continuity. Section 5.13 compares the maps from these carriers to
`B_dR⁺`.

*Source:* [Bhatt12], Proposition 9.9, p.35; [Fon94], Theorem 2.2.1 and §§2.3.1–2.3.4,
pp.76–79; Stacks, Lemma 60.2.1, Tag 07H8 (the envelope universal property).
*Needs:* §PD.7 `Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_identify`
and `Crystalline.fontaineEnvelope_eq_trivialBase`; §PD.6 completed-envelope lift and uniqueness;
PerfectoidSpaces §§P1.17–P1.18; PadicPeriodRings §3 `periodPDEnvelope` and §4.1
`generalBasePeriodRings` for the actions.

**Checks.**

- `test_period_envelope_theta`: both composites from `A_inf` are `θ`, and the two completed
  `θ_cris` maps agree, with quotient `O_C`, including `p = 2`.
- `test_period_envelope_generator`: replacing `ξ` by `uξ`, `u ∈ A_infˣ`, gives the same
  comparison fixing `A_inf`; the images of all `γ_n(ξ)` agree before and after completion.
- `test_period_envelope_log`: for a nontrivial compatible root system the two p-adically
  convergent logarithms agree term by term and in their limits, also at `p = 2`.

## Layer 2: Ordinary and derived de Rham cohomology

*Presenting differential forms.*

Use the existing forms, and present them as `A`-modules so that coefficient differentiation is
scalar-correct. The quotient presentation proves both surjectivity and the whole kernel, including
degree zero and strict alternation in characteristic two. The carriers are the abbreviations
`DeRham.Forms A B n = exteriorPower B n (KaehlerDifferential A B)` (an `A`-module by restriction of
scalars), `DeRham.Symbols A B n = (B × (Fin n → B)) →₀ A`, the basis symbol `DeRham.sym A B n c v`,
the elementary form `DeRham.elementary A B n c v = c • ιMulti (D v₁, …, D vₙ)`, the wedge product
`DeRham.wedge` of the graded exterior algebra and `DeRham.zeroForm`.

Sources for this group: [StacksDR], Section 10.132, the construction before Lemma 10.132.1, pp.334–336
of Commutative Algebra; [Riou], proposed `Mathlib/RingTheory/DeRham/Basic.lean`, `presentationDifferentialsDown` through
`deRhamComplex`, lines 285–432.

**Checks.**

- `test_wedge_scalar`: `(DeRham.wedge A B (DeRham.zeroForm A B b) y).val = b • y.val`.
- `test_wedge_orientation`: over `ℤ[X,Y]`, `dX ∧ dY = −dY ∧ dX` and `dX ∧ dY ≠ 0`.
- `test_wedge_char_two`: over `F₂[X]`, `dX ∧ dX = 0`.

### 2.1 Relations for ordinary differential symbols

Let `Sₙ` be the free `A`-module on pairs `(c, v)` with `c ∈ B` and `v : {1, …, n} → B`, written
`[c; v]`. Define `Rₙ ⊂ Sₙ`, `DeRham.symbolRelations A B n`, as the `A`-span of six families
(`DeRham.relationSet`): `[c+e; v] − [c; v] − [e; v]`; `[ac; v] − a[c; v]` for `a ∈ A`; slot additivity
`[c; v(i↦x+y)] − [c; v(i↦x)] − [c; v(i↦y)]`; slot Leibniz `[c; v(i↦xy)] − [cx; v(i↦y)] − [cy; v(i↦x)]`;
`[c; v(i↦a)]` for `a ∈ A`; and `[c; v]` when `v_i = v_j` with `i ≠ j`. There is no `B`-linearity
requirement in the coefficient before applying `d`.

*Needs:* Mathlib `KaehlerDifferential.kerTotal`, `exteriorPower.presentation`.

Prove the following named laws.

- `symbolRelations_eq_span`: `Rₙ` is exactly the `A`-span of the six displayed relation families
  by definition.
- `symbolRelations_coeff_add`: coefficient additivity belongs to `Rₙ`.
- `symbolRelations_slot_mul`: the slot Leibniz relation belongs to `Rₙ` for every slot.

**Checks.**

- `test_relations_degree_zero`: over `ℤ`, `[0; ()]` belongs to `R₀` and `[1; ()]` does not. The
  quotient has its nonzero degree-zero unit.
- `test_relations_constant_slot`: a differential slot filled with an element from `A` is zero in the
  quotient; over `ℤ[X]`, `[1; X]` is not a relation, since `dX` is nonzero. Taking every symbol as a
  relation fails.
- `test_relations_diagonal_char_two`: over `F₂`, the diagonal degree-two symbol is itself a relation,
  not merely twice that symbol.

### 2.2 Evaluation of differential symbols

Define `qₙ : Sₙ → Ωⁿ`, `DeRham.symbolMap`, as the `A`-linear map `[c; v] ↦ c·Dv₁ ∧ … ∧ Dvₙ` (a
`Finsupp.linearCombination`). In degree zero it sends `[c; ()]` to `c` under `Ω⁰ ≃ B`.

*Needs:* Mathlib `Finsupp.linearCombination`, `KaehlerDifferential.D`, `exteriorPower.ιMulti`,
`exteriorPower.zeroEquiv`.

Prove the following named laws.

- `symbolMap_single`: `qₙ([c; v]) = c Dv₁ ∧ … ∧ Dvₙ`.
- `symbolMap_add`: `qₙ` is additive.
- `symbolMap_smul`: for `a ∈ A`, `qₙ(a s) = a qₙ(s)`.

**Checks.**

- `test_symbolMap_zero_degree`: evaluation in weight zero agrees with the existing `zeroEquiv`.
- `test_symbolMap_one_degree`: evaluation in weight one agrees with `c` times the universal
  derivation.
- `test_symbolMap_repeated`: the image of `[c; x, x]` is zero in every characteristic.
- `test_symbolMap_two_variables`: over `ℤ[X,Y]`, `q₂([1;X,Y]) = dX ∧ dY ≠ 0`. The
  polynomial differential basis identifies this with the basis of the rank-one exterior square.

### 2.3 Differential symbols generate all forms

The map `qₙ` is surjective for every `n ≥ 0`; equivalently the forms `c Dv₁ ∧ … ∧ Dvₙ` span `Ωⁿ` as an
`A`-module.

*Needs:* Layer 2: Evaluation of differential symbols; Mathlib `KaehlerDifferential.span_range_derivation`,
`exteriorPower.ιMulti_span_of_span`, `exteriorPower.zeroEquiv`.

Lean: `DeRham.symbolMap_surjective`.

### 2.4 The differential-symbol presentation

For every `n`, `ker(qₙ) = Rₙ`. Thus `Sₙ/Rₙ` is canonically `Ωⁿ` as an `A`-module, including `n = 0`.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Evaluation of differential
symbols; Layer 2: Differential symbols generate all forms; Mathlib
`KaehlerDifferential.quotKerTotalEquiv`, `exteriorPower.presentation`, `Submodule.liftQ`,
`Module.Presentation.restrictScalars`.

Lean: `DeRham.symbolRelations_ker`.

*Constructing the differential.*

Descend the free-symbol rule by checking each relation, then prove uniqueness, square-zero and the
graded product identity. The leading differentiated coefficient is the first wedge slot. Sources as
for the preceding group.

### 2.5 Differentiating a free differential symbol

Define `δₙ : Sₙ → Ωⁿ⁺¹`, `DeRham.freeDifferential`, as the `A`-linear map
`[c; v] ↦ Dc ∧ Dv₁ ∧ … ∧ Dvₙ`. This uses the coefficient as the first slot, with positive sign.

*Needs:* Mathlib `Finsupp.linearCombination`, `KaehlerDifferential.D`, `exteriorPower.ιMulti`.

Prove the following named laws.

- `freeDifferential_single`: `δₙ([c; v]) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`.
- `freeDifferential_add`: the free differential preserves sums.
- `freeDifferential_smul`: the free differential is `A`-linear on free-module coefficients.

**Checks.**

- `test_freeDifferential_unit`: symbols with coefficient one have zero differential.
- `test_freeDifferential_zero_degree`: in weight zero the free differential agrees with `D` after
  `oneEquiv`.
- `test_freeDifferential_diagonal`: `δ₁([x; x]) = Dx ∧ Dx = 0`, while over `ℤ[X,Y]`,
  `δ₁([X; Y]) = dX ∧ dY ≠ 0`. This also detects a zero differential in positive weights and fixes the
  positive leading-slot sign.

### 2.6 The free differential kills every relation

For every `n`, `Rₙ ⊂ ker(δₙ)`, so `δₙ` depends only on the represented ordinary form.

*Needs:* Layer 2: Relations for ordinary differential symbols; Layer 2: Differentiating a free
differential symbol; Mathlib `Derivation.leibniz`, `Derivation.map_algebraMap`,
`AlternatingMap.map_eq_zero_of_eq`, `AlternatingMap.map_swap`.

Lean: `DeRham.freeDifferential_relations`.

### 2.7 The ordinary de Rham differential

For every `n ≥ 0` define `dₙ : Ωⁿ → Ωⁿ⁺¹`, `DeRham.d A B n`, `A`-linear, as the descent of `δₙ` along
`qₙ` (by 2.4 and 2.6). It is characterized by `dₙ(c Dv₁ ∧ … ∧ Dvₙ) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`; this
elementary-form rule also determines the map uniquely. The scalar ring is `A`; in general `d` is not
`B`-linear. The intended Lean signature is

```lean
DeRham.d (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] (n : ℕ) :
    DeRham.Forms A B n →ₗ[A] DeRham.Forms A B (n + 1)
```

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: The free differential kills every
relation; Layer 2: Differential symbols generate all forms; Mathlib `Submodule.liftQ`,
`exteriorPower.oneEquiv`, `KaehlerDifferential.polynomialEquiv_D`, `Polynomial.derivative_X`,
`KaehlerDifferential.mvPolynomialBasis`.

Prove the following named laws.

- `d_add`: `dₙ(α + β) = dₙα + dₙβ`.
- `d_base_smul`: for `a ∈ A`, `dₙ(aα) = a dₙα`.
- `d_zero_degree`: transport `d₀` along `Ω⁰ ≃ B` and `Ω¹ ≃ Ω` to recover the pinned universal
  derivation.

**Checks.**

- `test_d_base_constant`: the differential of the image of a base-ring constant is zero.
- `test_d_polynomial_X`: the differential of `X` in `ℤ[X]` over `ℤ` is nonzero, so the zero operator
  fails.
- `test_d_polynomial_X_char_two`: the differential of `X` in `F₂[X]` over `F₂` is still nonzero.
- `test_d_two_variables`: in `ℤ[X,Y]`, `d(X dY) = dX ∧ dY` and this two-form is nonzero. This detects a
  zero positive-degree differential and fixes the leading-slot sign.

### 2.8 Differential of an elementary form

`dₙ(c Dv₁ ∧ … ∧ Dvₙ) = Dc ∧ Dv₁ ∧ … ∧ Dvₙ`, for every `n` including zero.

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: Evaluation of differential symbols;
Layer 2: Differentiating a free differential symbol.

Lean: `DeRham.d_elementary`.

### 2.9 Uniqueness from elementary forms

An `A`-linear map `Ωⁿ → Ωⁿ⁺¹` satisfying the displayed elementary-form rule equals `dₙ`.

*Needs:* Layer 2: Differential symbols generate all forms; Layer 2: Differential of an elementary form.

Lean: `DeRham.d_unique`.

### 2.10 The de Rham differential squares to zero

For every `n`, `dₙ₊₁ ∘ dₙ = 0` as an `A`-linear map `Ωⁿ → Ωⁿ⁺²`.

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms;
Mathlib `Derivation.map_one_eq_zero`.

Lean: `DeRham.d_squared`.

### 2.11 The graded Leibniz identity

For `α ∈ Ωᵐ` and `β ∈ Ωⁿ`, `d(α ∧ β) = dα ∧ β + (−1)ᵐ α ∧ dβ`. The product is the existing graded
multiplication of the exterior algebra.

*Needs:* Layer 2: Differential of an elementary form; Layer 2: Differential symbols generate all forms;
Mathlib `Derivation.leibniz`, `ExteriorAlgebra.gradedAlgebra`, `AlternatingMap.map_swap`.

Lean: `DeRham.d_leibniz`.

### 2.12 The ordinary algebraic de Rham complex

Define `Ω•_(B/A)`, `DeRham.complex A B`, as the nonnegative cochain complex of `A`-modules with degree
`n` object `Ωⁿ` and differential `dₙ` (built with `CochainComplex.of` from 2.10). Its multiplication is
the existing wedge product and satisfies the graded Leibniz identity. This is the ordinary complex, not
a derived smooth comparison in characteristic zero. The intended Lean signature is

```lean
DeRham.complex (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    CochainComplex (ModuleCat.{u} A) ℕ
```

*Needs:* Layer 2: The ordinary de Rham differential; Layer 2: The de Rham differential squares to
zero; Layer 2: The graded Leibniz identity; Mathlib `CochainComplex.of`.

Prove the following named laws.

- `complex_d_apply`: the adjacent differential of `Ω•` is `dₙ`.
- `complex_d_nonadjacent`: every nonadjacent differential is zero.
- `complex_X`: the object in degree `n` is the existing module `Ωⁿ`, restricted to `A`.

**Checks.**

- `test_complex_degree_zero`: the first arrow agrees with the universal derivation after the existing
  degree-one equivalence.
- `test_complex_two_steps`: the first two arrows compose to zero on each `b`.
- `test_complex_base_ring`: over `A → A` the first differential is zero.
- `test_complex_positive_differential`: over `ℤ[X,Y]`, the degree-one differential sends
  `X dY` to `dX ∧ dY ≠ 0`.

*Pullback and the ordinary universal property.*

Extend the existing semilinear Kähler map to exterior powers. The resulting complex maps and
differential-algebra universal property are the functorial input for polynomial realization.

### 2.13 Pullback of ordinary differential forms

For an `A`-algebra homomorphism `f : B → C`, extend the pinned `KaehlerDifferential.mapSemilinear` to
`f`-semilinear maps `f*ₙ : Ωⁿ_(B/A) → Ωⁿ_(C/A)`, `DeRham.pullback f n`. On elementary forms,
`c Dv₁ ∧ … ∧ Dvₙ` maps to `f(c) D(fv₁) ∧ … ∧ D(fvₙ)`; the elementary-form rule determines the pullback
uniquely. In degree zero, pullback identifies with `f`. These maps are `A`-linear as well, but in general are not
`B`-linear for an unrelated `B`-action on `C`. The intended Lean signature is

```lean
DeRham.pullback {A B C : Type u} [CommRing A] [CommRing B] [CommRing C] [Algebra A B]
    [Algebra A C] (f : B →ₐ[A] C) (n : ℕ) :
    DeRham.Forms A B n →ₛₗ[f.toRingHom] DeRham.Forms A C n
```

[StacksDR], Section 10.132, construction before Lemma 10.132.1, pp.334–336; [Riou], lines 285–432.

*Needs:* Tau Ceti `KaehlerDifferential.mapSemilinear`, `KaehlerDifferential.mapSemilinear_D`; Mathlib
`exteriorPower.alternatingMapLinearEquiv`.

Prove the following named laws.

- `pullback_smul`: pullback is `f`-semilinear in `B`-scalars.
- `pullback_base_smul`: pullback is linear in `A`-scalars.
- `pullback_add`: pullback preserves sums of forms.

**Checks.**

- `test_pullback_zero_degree`: degree-zero pullback agrees with `f` under the existing zero
  equivalence.
- `test_pullback_one_degree`: degree-one pullback agrees with the pinned Kähler `mapSemilinear`.
- `test_pullback_identity_two`: the identity fixes an arbitrary degree-two form.

### 2.14 Pullback on elementary differential forms

Pullback sends `c Dv₁ ∧ … ∧ Dvₙ` to `f(c) D(fv₁) ∧ … ∧ D(fvₙ)`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Tau Ceti `KaehlerDifferential.mapSemilinear_D`.

Lean: `DeRham.pullback_elementary`.

### 2.15 Pullback commutes with the differential

For every `A`-algebra map `f : B → C` and `n`, `f*ₙ₊₁(dₙω) = dₙ(f*ₙω)`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential of an elementary form;
Layer 2: Differential symbols generate all forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_d`.

### 2.16 Pullback preserves wedge products

For every `A`-algebra homomorphism `f`, `f*(α ∧ β) = f*α ∧ f*β`, with the existing exterior products.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Mathlib `ExteriorAlgebra.gradedAlgebra`; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_wedge`.

### 2.17 Identity pullback

For every `n`, pullback along `id_B` is the identity on `Ωⁿ`.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_id`.

### 2.18 Composition of pullbacks

For `f : B → C` and `g : C → E` of `A`-algebras, pullback along `g ∘ f` equals `g* ∘ f*` in every
degree.

*Needs:* Layer 2: Pullback of ordinary differential forms; Layer 2: Differential symbols generate all
forms; Layer 2: Pullback on elementary differential forms.

Lean: `DeRham.pullback_comp`.

### 2.19 The functorial map of ordinary de Rham complexes

An `A`-algebra homomorphism `f : B → C` induces a morphism `Ω•_(B/A) → Ω•_(C/A)` in
`CochainComplex (ModuleCat A) ℕ`, `DeRham.complexMap f`, whose degree-`n` map is `f*ₙ`. These maps
preserve identities, composition and wedge multiplication.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: Pullback commutes with the
differential; Layer 2: Pullback preserves wedge products; Layer 2: Identity pullback; Layer 2:
Composition of pullbacks.

Prove the following named laws.

- `complexMap_apply`: the degree-`n` component is `pullback f n`.
- `complexMap_id`: the complex map of `id` is the identity.
- `complexMap_comp`: the complex map of `g ∘ f` is the categorical composite of the two complex maps.

**Checks.**

- `test_complexMap_constant`: in degree zero, the complex map takes `b` to `f(b)`.
- `test_complexMap_identity`: the identity map of `B` induces the identity in degree one.
- `test_complexMap_d`: the degree-one image of `db` is `d(fb)`.

### 2.20 Ordinary polynomial base change and Künneth

For an ordinary base square `A → A′`, `B′ = B ⊗_A A′`, the ordinary differential graded de Rham
algebra satisfies `Ω•_(B/A) ⊗_A A′ ≃ Ω•_(B′/A′)`, with its ordinary tensor and Hodge filtration; in
each degree this is the linear equivalence `A′ ⊗_A Ωⁿ_(B/A) ≃ Ωⁿ_(B′/A′)`. For polynomial `A`-algebras
`B, C`, `Ω•_(B ⊗_A C/A) ≃ Ω•_(B/A) ⊗_A Ω•_(C/A)`,
including the signed differential and degree-sum filtration. In the polynomial case these complexes
are K-flat: in finitely many variables `Ω•` is a bounded complex of free `A`-modules, and in general
it is the filtered colimit of these over finite sets of variables, K-flat by
`derivedTensor_kFlatColimit` (DerivedModuleAlgebra §0.2). So the derived tensor computes the same
object. Termwise flatness alone would not suffice, since with infinitely many variables these
complexes are unbounded above. The ordinary formula does not justify replacing a derived algebra
pushout by an ordinary pushout outside Tor independence.

[Bhatt12], Proposition 2.7 proof, p.6.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary de
Rham complexes; Layer 2: The graded Leibniz identity; Layer 2: Pullback of ordinary differential
forms; DerivedModuleAlgebra §0.2 Derived tensor products on module derived categories; Mathlib
`KaehlerDifferential.D`.

Lean: `DerivedDeRham.ordinaryBaseChangeKunneth`.

**Checks.**

- `test_ordinary_base_change_degree_zero`: for `n = 0` the equivalence is `A′ ⊗_A B ≃ B′`.
- `test_ordinary_base_change_line`: for `B = A[t]`, `Ω¹_(B′/A′) = A′[t] dt`.
- `test_ordinary_kunneth_sign`: for `B = A[t]`, `C = A[u]`, the differential of `dt ⊗ u` is
  `−dt ⊗ du`, matching `d(u dt) = du ∧ dt = −dt ∧ du` in `Ω²_(A[t,u]/A)`.

### 2.21 The universal differential graded algebra

For an `A`-algebra `B`, `Ω•_(B/A)` is initial among nonnegatively graded strictly graded-commutative
differential graded `A`-algebras `D` with odd squares zero and an `A`-algebra map `B → D⁰`. The unique
dg map sends `b` to its degree-zero image and `db` to its differential, hence `b₀ db₁ ∧ … ∧ db_n` to
`f(b₀) d f(b₁) … d f(b_n)`. The odd-square condition is part of the target even in characteristic 2. Use DGAInfinity
Layer 1’s unital cochain DG-algebra carrier and DG morphisms. Define strict graded
commutativity on its homogeneous elements by `xy = (−1)^(ij) yx` in degrees `i, j`,
and odd-square-zero by `x² = 0` in odd degrees. Its tensor product supplies the Koszul
signs. These predicates and morphisms are used in the strict affine models throughout
§§2.22, 2.25 and 2.27; realization retains the model’s differential and multiplication.

[Prisms], §4, construction of the Hodge–Tate map after Lemma 4.10, pp.39–40; [StacksDR], Section
10.132, pp.334–336.

*Needs:* Layer 2: The differential-symbol presentation; Layer 2: Differential of an elementary form;
Layer 2: The de Rham differential squares to zero; Layer 2: The graded Leibniz identity; Layer 2: The
ordinary algebraic de Rham complex; DGAInfinity Layer 1 (unital cochain DG algebras,
DG morphisms and tensor signs).

Lean: `DerivedDeRham.ordinaryDeRhamUniversalProperty`.

**Checks.**

- `test_universal_dga_identity`: the identity of `Ω•_(B/A)` is the map attached to `B → Ω⁰`.
- `test_universal_dga_zero`: for the zero dg algebra the unique map is zero.
- `test_universal_dga_odd_square`: over `F₂`, let `D = F₂[t, e]` with `e` in degree 1, `dt = e`,
  `de = 0`; it is graded-commutative (signs are trivial) with `e² ≠ 0`. The map `F₂[t] → D⁰` has no
  extension to `Ω•_(F₂[t]/F₂)`, since `(dt)² = 0` would map to `e²`; this is why the universal property
  is stated among algebras with odd squares zero.

*Polynomial realization and the Hodge filtration.*

Realize the ordinary de Rham functor on polynomial resolutions, with the multiplicative structure of
the shuffle product and the comparison maps of DerivedModuleAlgebra §0.1.

### 2.22 De Rham cohomology from polynomial resolutions

For a ring map `A → B`, define `dR_(B/A)`, `DerivedDeRham.ofPolynomialResolution A B`, as the
direct-sum totalization `|Ω•_(P•/A)|` of the bicomplex of de Rham complexes of the standard
resolution `P• → B` (simplicial degree `n` in cohomological degree `−n`), with its decreasing Hodge
filtration `Fil_H^i = |Ω^(≥i)_(P•/A)|`, an object of `DF(A)`. The Eilenberg–Zilber shuffle product
makes it a strictly graded-commutative differential graded `A`-algebra with multiplicative Hodge
filtration. It is natural in commutative squares of ring maps. Any polynomial resolution computes it
up to canonical filtered quasi-isomorphism of dg algebras: each `|Ω^(<i)|`, each `|Ω^i|` and each
conjugate stage `|τ^(≤i)Ω•|` is the value on `P•` of a functor of polynomial algebras over `B` with
values in complexes, so DerivedModuleAlgebra §0.1 identifies its values on any two resolutions, and
the direct-sum totalization is the filtered colimit of the conjugate stages ([Bhatt12] Proposition
2.3 and its proof, p.5). No Hodge completeness is imposed; the completion is a separate reflection.
The construction is not the ordinary smooth de Rham complex over every base. The intended Lean
signature is

```lean
DerivedDeRham.ofPolynomialResolution (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    DerivedCategory (ℤᵒᵖ ⥤ ModuleCat.{u} A)
```

with the dg-algebra structure carried by the strict model.

[Bhatt12], Definition 2.1, its explanatory paragraph, Remarks 2.2 and 2.4 and Proposition 2.3,
pp.5–6; [StacksCt], Remark 5.5 and Lemmas 5.6–5.7, Tags 08QI, 08QJ, 08QK, pp.9–10; [DoldPuppe] §2
(the generalized Eilenberg–Zilber theorem), pp.211–219.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 2: The functorial map of ordinary de
Rham complexes; Layer 2: Ordinary polynomial base change and Künneth; DerivedModuleAlgebra §0.1
Simplicial polynomial resolutions; DerivedModuleAlgebra §0.2 Derived tensor products on module
derived categories; Layer 1: Filtered derived categories; DGAInfinity Layer 1 (DG algebras, DG
morphisms and signed tensor products).

Prove the following named laws.

- `map`: a morphism of `A`-algebras induces a map of the Hodge-filtered derived de Rham dg algebras,
  with identity and composition laws.
- `resolutionEquiv`: two polynomial resolutions of `B` give quasi-isomorphic Hodge-filtered dg
  algebras; the comparison respects the augmentation and is the one induced by any map of
  resolutions over `B`.
- `hodgeFiltration`: `Fil_H^i` is the realization of the subcomplex of polynomial forms of degrees at
  least `i`, with decreasing transition maps and multiplication `Fil_H^i ⊗ Fil_H^j → Fil_H^(i+j)`.
- `kFlatModel`: `dR_(B/A)`, each `Fil_H^i`, each quotient `|Ω^(<i)_(P•/A)|` and each `|Ω^i_(P•/A)|` are
  K-flat complexes of `A`-modules. Their columns are K-flat by 2.20, and realization preserves K-flatness
  (`derivedTensor_kFlatRealization`, DerivedModuleAlgebra §0.2). Derived tensors of these objects are computed termwise.

**Checks.**

- `test_identity_algebra`: for `A → A`, `dR_(A/A)` is `A` concentrated in degree zero.
- `test_hodge_zero_quotient`: for an `A`-algebra `B`, the degree-zero Hodge quotient `gr_H^0 dR_(B/A)` is
  `B` in degree zero.
- `test_rational_laurent_boundary`: for `ℚ → ℚ[t, t⁻¹]`, uncompleted `dR` is `ℚ`, whereas ordinary
  degree-one de Rham cohomology is `ℚ·dt/t`. The unrestricted uncompleted smooth comparison fails.
- `test_derham_unbounded_above`: for `B = F_p[x_1, x_2, …]` over `F_p` the constant resolution gives
  `dR_(B/F_p) = Ω•_(B/F_p)`, and `H^i ≠ 0` for every `i ≥ 0`: the closed form
  `x_1^(p−1) ⋯ x_i^(p−1) dx_1 ∧ ⋯ ∧ dx_i` is not exact, since `x^(p−1) dx ∉ d(F_p[x])` (`d(x^n) =
  n x^(n−1) dx` vanishes for `n = p`) and the polynomial Künneth formula of 2.20 applies. So `dR` has
  no bounded-above representative, and its K-flatness comes from the colimit over finitely many
  variables.

### 2.23 Derived base change and Künneth

There are natural equivalences `dR_((B ⊗^L_A C)/A) ≃ dR_(B/A) ⊗^L_A dR_(C/A)` and
`dR_(B/A) ⊗^L_A C ≃ dR_((B ⊗^L_A C)/C)`, where `B ⊗^L_A C` is the simplicial ring `P• ⊗_A Q•` of polynomial
resolutions and `dR` of a simplicial ring is computed on the diagonal. All tensor products are derived.

[Bhatt12], Proposition 2.7 and proof, p.6.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Ordinary polynomial base
change and Künneth; DerivedModuleAlgebra §0.2 Derived tensor products on module derived categories;
DerivedModuleAlgebra §0.9 The cotangent complex of a map of simplicial rings and the diagonal
comparison.

Lean: `DerivedDeRham.baseChangeKunneth`.

**Checks.**

- `test_kunneth_identity`: for `C = A`, both equivalences are the identity of `dR_(B/A)`.
- `test_kunneth_polynomial`: for `B = A[t]`, `C = A[u]`, the Künneth map is the ordinary
  `Ω•_(A[t,u]/A) ≃ Ω•_(A[t]/A) ⊗ Ω•_(A[u]/A)` with the signed differential.
- `test_kunneth_tor`: for `A = ℤ`, `B = C = F_p`, `B ⊗^L_ℤ C` has `π₁ = F_p`, so the ordinary pushout
  `F_p` cannot be used: `dR_(F_p/ℤ) ⊗^L_ℤ F_p` has nonzero `H^−1`.

### 2.24 Hodge graded pieces of derived de Rham

For `A → B`, `gr_H^i dR_(B/A) ≃ L∧^i_B L_(B/A)[−i]` naturally as `B`-modules for every `i ≥ 0`. The
degree-zero quotient is `B`. Proof: `gr_H^i` is the realization of `Ω^i_(P•/A)`, the value on `P•`
of the functor `P ↦ Ω^i_(P/A)`; [StacksCt] Lemma 5.6 (Tag 08QJ) replaces it by `Ω^i_(P•/A) ⊗_(P•) B
= ∧^i_B(Ω_(P•/A) ⊗_(P•) B)`, the levelwise exterior power of the simplicial free `B`-module that
models `L_(B/A)`, which is `L∧^i L_(B/A)` by DerivedModuleAlgebra §§0.3, 0.14. The differential of
the filtered algebra induces the universal derivation on the first Hodge boundary; the full de Rham
differential is formed before realization, not defined only on cotangent homology.

[BL22], Appendix E, Construction E.2, pp.232–233; [StacksCt] Lemmas 5.6–5.7, Tags 08QJ, 08QK,
pp.9–10.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; DerivedModuleAlgebra §0.4 The full
cotangent complex; DerivedModuleAlgebra §0.14 Derived exterior powers; DerivedModuleAlgebra §0.1
Simplicial polynomial resolutions; Layer 1: Filtered derived categories.

Lean: `DerivedDeRham.hodgeGradedPieces`.

**Checks.**

- `test_hodge_graded_identity`: for `A → A`, `gr^0 = A` and `gr^i = 0` for `i > 0`.
- `test_hodge_graded_line`: for `A[t]`, `gr^1 = A[t] dt [−1]`, in cohomological degree 1.
- `test_hodge_graded_regular_quotient`: for `A → A/(f)` with `f` regular, `L = (f)/(f²)[1]` and
  `gr^i = Γ^i((f)/(f²))` in degree zero, by DerivedModuleAlgebra §0.17.

### 2.25 Hodge-completed derived de Rham

Define `dR^hc_(B/A) = Rlim_i(dR_(B/A)/Fil_H^i)`, `DerivedDeRham.hodgeCompletedDerham`, with its complete
decreasing filtration as the Layer 1 reflection of the Hodge-filtered object; on the strict model it is
the product totalization. The natural `dR → dR^hc` map is universal among maps to complete
Hodge-filtered objects and leaves every graded piece `L∧^i L_(B/A)[−i]` unchanged. Hodge completion and
p-completion are different operations.

[BL22], Appendix E, Construction E.14 and Remark E.15, p.235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge graded pieces of
derived de Rham; Layer 1: Completion of a filtered object; Layer 1: Completed filtered tensor
products; DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The
Milnor sequence for towers of complexes*; DGAInfinity Layer 1 (strict DG models and morphisms).

Prove the following named laws.

- `hodgeCompletionMap`: the canonical filtered algebra map `dR → dR^hc` is the Layer 1 reflection
  unit.
- `hodgeCompletionGraded`: `gr_H^i dR^hc ≃ L∧^i L_(B/A)[−i]`.
- `hodgeCompletionUniversal`: maps to complete Hodge-filtered dg algebras factor uniquely through
  `dR^hc`.
- `hodgeCompletionFunctorial`: the unit and completion are natural in commutative base squares, with
  completed base-change comparisons under the separate stated hypotheses.

**Checks.**

- `test_hodge_complete_base`: `dR^hc_(A/A) = A`.
- `test_hodge_complete_rational_laurent`: for `ℚ[t, t⁻¹]/ℚ`, the completed complex is ordinary
  de Rham, with `H¹ = ℚ·dt/t`, whereas uncompleted `dR = ℚ`.
- `test_hodge_complete_dual_numbers`: for `R = F₂[t]/t²`, assume a filtered equivalence
  between `dR_(R/F₂)` and the de Rham complex of the regular PD envelope
  `D = D_(F₂[t])((t²))`, compatible with the PD filtration and its completion. Write `u_j = γ_(2^j)(t²)`, `j ≥ 1`. Its degree-zero ring is
  `F₂[t, u₁, u₂, …]/(t⁴, u₁², u₂², …)`, and `d(u_j) = 0`. The Hodge completion contains the closed class
  `Σ_(j≥1) u_j`, whose terms have weights `2^j`; it has no representative in `D`, where every element
  is a finite polynomial. Thus `H⁰(dR) → H⁰(dR^hc)` is not surjective. The comparison hypothesis is the regular-envelope model of [Bhatt12],
  Theorem 3.27, pp.13, 16–19, owned by CrystallineCohomology §§CR.DDR.4.3, CR.DDR.5.9;
  the Check proves the completion calculation under that hypothesis.

### 2.26 p-completed derived de Rham

For `A → B` define `dR̂_(B/A) = Λ_(p) dR_(B/A) = Rlim_n(dR_(B/A) ⊗^L_ℤ ℤ/p^n)`,
`DerivedDeRham.pCompletedDerham`. Apply p-completion to every Hodge filtration term, and use completed
tensor for its multiplication. A p-completed increasing conjugate diagram is not automatically
exhaustive before a bounded-connectivity argument. For maps of p-completely flat bounded-torsion
algebras the mod-p computation uses the ordinary reductions; general reductions are simplicial.

[Bhatt12], Definition 8.1, Lemmas 8.2–8.3, pp.31–32; [BL22], Appendix E, Construction E.3 and Remark
E.4, p.233.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; DerivedModuleAlgebra §1.3 The
derived completion reflector; DerivedModuleAlgebra §1.5 When ordinary quotient towers compute
completion; Layer 1: Completed filtered tensor products; DerivedModuleAlgebra §1.1 Derived limits of
towers; DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*.

Prove the following named laws.

- `pCompletedDeRhamMod`: the reduction of `dR̂` modulo `p^n` is the derived de Rham reduction,
  compatibly in `n`.
- `pCompletedDeRhamInputs`: completing `A` and `B` at `p` does not change the p-completed de Rham
  construction with the derived base-change conventions.
- `pCompletedDeRhamKunneth`: the base-change and Künneth comparison uses p-completed derived tensor and
  derived pushouts.
- `pHodgeCompletionCommute`: applying p-completion and Hodge completion in either order gives the same
  quotient-limit object, since the relevant completion functors commute with limits.

**Checks.**

- `test_p_derham_identity`: for `A = A`, `dR̂_(A/A)` is `Λ_p A`.
- `test_p_derham_inverted`: for `ℚ_p → ℚ_p`, p-completed de Rham is zero, while Hodge-completed de Rham
  is `ℚ_p`.
- `test_p_derham_fp_over_zp`: for `F_p/ℤ_p`, `dR̂` is the p-completed PD two-term model of Layer 4,
  retaining the extra completed torsion summands in `H⁰` and the two-term differential; it is not
  `ℤ_p`.

### 2.27 The de Rham algebra of a completely smooth formal algebra

Let `A` be p-complete with bounded p-power torsion and `B` a p-completely smooth p-complete
`A`-algebra. Define continuous differentials `Ω̂¹_(B/A) = L̂_(B/A)` in degree zero, finite projective
over `B`; define `Ω̂^n = ∧^n_B Ω̂¹` and the continuous differential by `d(b₀ db₁ ∧ … ∧ db_n) =
db₀ ∧ … ∧ db_n`. These form the p-complete ordinary de Rham dg algebra,
`DerivedDeRham.formalOrdinaryDerham`. Its universal property is among termwise p-complete strictly
graded-commutative `A`-dg algebras with odd squares zero, continuous differential and a continuous map
`B → D⁰`.

[Prisms], §1.2; §4 Hodge–Tate universal map after Lemma 4.10, pp.10–11, 39–40.

*Needs:* Layer 1: Elkik algebraization of completely smooth and étale algebras; DerivedModuleAlgebra
§1.7 Complete flatness and complete faithful flatness; DerivedModuleAlgebra §0.12 The smooth
cotangent computation; Layer 2: The universal differential graded algebra; Layer 2: The ordinary
algebraic de Rham complex; SchemeAndStackFoundations §4.7 (`Formal.AdicRing`, `Spf`); DGAInfinity
Layer 1 (strict DG models and morphisms).

Prove the following named laws.

- `continuousDerivation`: the continuous derivation `B → Ω̂¹` agrees with the completed polynomial
  universal derivation.
- `formalDeRhamUniversal`: a continuous degree-zero map into the stated dg target extends uniquely by
  `b₀db₁…db_n ↦ f(b₀) df(b₁) … df(b_n)`.
- `formalDeRhamMap`: continuous maps of completely smooth formal algebras induce the differential-algebra
  pullback.
- `formalDeRhamReduction`: modulo `p^n` this is the ordinary smooth de Rham algebra of the
  corresponding finite reduction.

**Checks.**

- `test_formal_derham_base`: for `B = A`, `Ω̂¹ = 0` and the complex is `A`.
- `test_formal_derham_coordinate`: for `B = ℤ_p⟨t⟩`, `d(t) = dt` generates the finite projective
  continuous differential module.
- `test_formal_derham_char_two_square`: over a 2-complete base, `(dt)² = 0` in the exterior dg algebra;
  mere graded commutativity is insufficient.

### 2.28 Derived de Rham transitivity filtrations

For `A → B → C` construct the base-forms filtration on `dR_(C/A)`, whose weight-`i` graded term is
`dR_(C/B) ⊗^L_B L∧^i_B L_(B/A)[−i]`. Its boundary maps encode the Gauss–Manin connection; it does not
canonically split. The relative conjugate filtration is constructed in §3.6.1.

[Bhatt12], Proposition 3.22 and Remark 3.23, pp.11–12; [BL22], Appendix E, Construction E.2,
pp.232–233.

*Needs:* DerivedModuleAlgebra §0.8 The cotangent transitivity triangle; DerivedModuleAlgebra §0.17
Exterior powers of a triangle and décalage; Layer 2: De Rham cohomology from polynomial resolutions;
Layer 2: Ordinary polynomial base change and Künneth; Layer 1: Filtered derived categories; Layer 1:
Valid exchanges of completion and derived operations.

Lean: `DerivedDeRham.deRhamTransitivity`.

**Checks.**

- `test_transitivity_filtration_base`: for `A = B`, the filtration reduces to `dR_(C/B)` in weight 0.
- `test_transitivity_filtration_top`: for `B = C`, it reduces to the Hodge filtration of `dR_(B/A)`
  with `dR_(B/B) = B`.
- `test_transitivity_filtration_polynomial`: for `A → A[t] → A[t,u]`, the filtration is the `t`-form
  degree filtration, with the Gauss–Manin differential and no canonical splitting of the complex of
  `A`-modules.

### 2.29 Hodge pieces of a singular hypersurface

For `k = F_p` and `B = k[t]/(t²)`, the full cotangent complex is `[B e --2t→ B dt]` in degrees `−1, 0`.
Thus `gr_H¹ dR_(B/k) = L_(B/k)[−1]` has `B e` in degree zero and `B dt` in degree one. Its higher Hodge
pieces are the derived exterior powers of this two-term complex, with divided powers of the degree `−1`
generator. For `p = 2` the displayed differential vanishes; replacing `L` by `Ω¹` loses the nonzero
degree-zero Hodge-weight-one term. This is a singular lci algebra, distinguished from the non-lci
square-zero example.

[Bhatt12], §3.3, regular quotient computations and Lemma 3.42, pp.17–18.

*Needs:* DerivedModuleAlgebra §0.13 Regular quotients and two-term models; DerivedModuleAlgebra
§0.14 Derived exterior powers; DerivedModuleAlgebra §0.16 Derived divided powers;
DerivedModuleAlgebra §0.17 Exterior powers of a triangle and décalage; Layer 2: Hodge graded pieces
of derived de Rham.

Lean: `DerivedDeRham.singularHypersurfaceHodge`.

**Checks.**

- `test_hypersurface_weight_one`: `gr_H¹` has `H⁰ = ker(2t : Be → Bdt)` and `H¹ = B dt/(2t)`; at `p = 2`
  both are `B`.
- `test_hypersurface_weight_two`: by DerivedModuleAlgebra §0.17, `gr_H²` is built from `Γ²(Be)` in degree zero and
  `Be ⊗ Bdt` in degree one, with connecting map `γ₂(e) ↦ 2t e ⊗ dt`; so `H⁰(gr_H²)` contains
  `t γ₂(e) ≠ 0` at every `p`, and is all of `Γ²(Be)` when `p = 2`.
- `test_hypersurface_not_omega`: `Ω²_(B/k) = 0` while `gr_H²` is nonzero.

### Examples

For a polynomial coordinate `t`, `d(t²) = 2t dt`; at characteristic 2 it is zero although `dt` is
nonzero. The two-coordinate formula `d(x dy) = dx ∧ dy` and `dy ∧ dx = −dx ∧ dy` fixes the graded sign
without dividing by 2. The rational Laurent line has the ordinary class `dt/t`, while its uncompleted
derived de Rham object is `ℚ`. The characteristic-2 PD example above distinguishes Hodge completion
from separatedness.

### Dependencies

Layers 0–1 supply cotangent powers, resolutions, completion and complete filtered tensor. Mathlib and
Tau Ceti supply the Kähler, exterior and pullback carriers. Scheme realization is constructed after
descent in Layer 5.

## Layer 3: Conjugate filtration and Cartier theory

Use the characteristic-p conjugate filtration to construct Cartier theory and the Frobenius-lift
splitting. These then give the singular and rational-completion boundary examples and the smooth
comparisons.

### 3.1 Frobenius-linear ordinary differential

Let `p` be prime and `A → B` a map of characteristic-p commutative rings. For every `b ∈ B` and
`ω ∈ Ωⁿ_(B/A)`, `dₙ(bᵖω) = bᵖ dₙω`. Thus the ordinary differential is linear for the `B`-action through
Frobenius, the algebraic input to the `B^(1)`-action.

[Bhatt12], Notation 3.1, final paragraph, p.6.

*Needs:* Layer 2: The graded Leibniz identity; Mathlib `Derivation.leibniz_pow`.

Lean: `DeRham.d_frobenius_smul`.

**Checks.**

- `test_frobenius_linear_cube`: for `F_p[t]`, `d(t^p · t) = t^p dt`; at `p = 2`, `d(t³) = t² dt`.
- `test_frobenius_linear_kills_pth_power`: `d(t^p) = 0` while `t^p ≠ 0`.
- `test_frobenius_not_b_linear`: `d(t · t) = 2t dt ≠ t dt` for `p ≠ 2`, so `d` is not `B`-linear for the
  ordinary action.

### 3.2 The conjugate filtration

Construct `Fil_i^conj dR_(B/A) = |τ^(≤i) Ω•_(P•/A)|` for `i ≥ 0`,
`DerivedDeRham.conjugateFiltration`, with `Fil_−1 = 0`, natural increasing maps, and `colim_i
Fil_i^conj ≃ dR_(B/A)`. Its graded piece is `|H^i(Ω•_(P•/A))|[−i]`. The filtration is multiplicative
and, over `F_p`, each stage is levelwise a module over the simplicial ring `P•^(1)` of 3.3; an
exhaustive direct-sum realization is not a completed or global convergence assertion. Here `P• → B`
is any polynomial resolution; independence of the resolution is DerivedModuleAlgebra §0.1 applied to
the functors `P ↦ τ^(≤i) Ω•_(P/A)`. As an increasing filtration it is an object of `DF(A)` after the
reindexing `i ↦ −i`. Spectral-sequence applications keep the bounded-below increasing filtration and
the further convergence hypotheses stated below.

[Bhatt12], Proposition 2.3, proof and Remark 2.4, p.5.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 1: Filtered derived
categories; DerivedModuleAlgebra §0.1 Simplicial polynomial resolutions; Layer 3: The derived
Frobenius twist (constructed before this subsection).

Prove the following named laws.

- `conjugateAt`: the `i`-th stage is `|τ^(≤i) Ω•_(P•/A)|`, with the canonical maps from truncation.
- `conjugateInclusion`: the map from stage `i` to stage `j` for `i ≤ j` is induced by cohomological
  truncation; the maps compose and are natural in `A → B`.
- `conjugateColimit`: the filtered colimit over `i ≥ 0` of these stages is `dR_(B/A)`. This is an
  uncompleted exhaustiveness assertion.

**Checks.**

- `test_conjugate_identity`: for `A → A`, stage zero is `A` and every positive graded piece is zero.
- `test_conjugate_weight_zero`: the zeroth graded piece is `|H⁰(Ω•_(P•/A))|`, with no cohomological
  shift.
- `test_conjugate_rational`: for `ℚ → ℚ[t]`, every positive conjugate graded piece vanishes and stage
  zero is `ℚ`.

### 3.3 The derived Frobenius twist

For `A → B` of `F_p`-algebras define `B^(1) = B ⊗^L_(A, Frob_A) A`, `DerivedDeRham.frobeniusTwist`, the
simplicial commutative ring `P•^(1) = P• ⊗_(A, Frob_A) A` for a polynomial resolution, together with the
relative Frobenius `B^(1) → B`. On the model, `|Ω•_(P•/A)|` and its conjugate stages are levelwise
modules over `P•^(1)`, acting through relative Frobenius (3.1). The ordinary Frobenius twist computes this
pushout when `Tor_i^A(B, Frob_*A) = 0` for every `i > 0`. Without Tor independence the twist retains its
higher homotopy.

The Frobenius-twist comparisons use the strict-model convention of DerivedModuleAlgebra §0.9; the
simplicial-module adapter used for deformation theory in 1.11.1 is not required for these
comparisons. The derived statements of this layer are `A`-linear, in `D(A)`, together with the
levelwise `P•^(1)`-linearity of their strict models. When `B^(1)` is discrete, `P•^(1) → B^(1)` is a
polynomial resolution of `B^(1)` over `A`, and the same statements hold `B^(1)`-linearly in
`D(B^(1))` through the levelwise base change to `B^(1)`. Downstream uses of `B^(1)`-linearity in a
derived category are limited to this discrete case.

[Bhatt12], Notation 3.1 and following paragraph, p.6; [Bhatt12], Proposition 3.5 statement, p.7.

*Needs:* DerivedModuleAlgebra §0.1 Simplicial polynomial resolutions; DerivedModuleAlgebra §0.9 The
cotangent complex of a map of simplicial rings and the diagonal comparison.

Prove the following named laws.

- `relativeFrobenius`: the canonical map `B ⊗^L_(A,Frob_A) A → B` is induced at polynomial level by
  `b ⊗ a ↦ bᵖ f(a)`.
- `twistMap`: a map `B → C` of `A`-algebras induces `B^(1) → C^(1)` and a commuting square with the two
  relative Frobenius maps.
- `twistUnderived`: if `Tor_i^A(B, Frob_*A) = 0` for all `i > 0`, the derived twist agrees with the
  ordinary tensor-product twist, compatibly with relative Frobenius.

**Checks.**

- `test_twist_base`: for `B = A`, `B^(1) = A ⊗^L_(A,Frob_A) A` is canonically `A` and the relative
  Frobenius is the identity under this identification.
- `test_twist_polynomial`: for `B = F_p[t]` over `F_p`, the derived twist is the ordinary polynomial
  algebra and relative Frobenius sends its coordinate `t` to `tᵖ`.
- `test_twist_no_underived_shortcut`: let `A = F_p[ε]/ε²` and `B = F_p`. `Tor₁^A(B, Frob_*A)` is nonzero
  (indeed isomorphic to `Frob_*A` with `ε` acting by zero); therefore `B^(1)` has nonzero `π₁` and cannot
  be replaced by its ordinary tensor product.

*Cartier isomorphisms and convergence.*

First calculate inverse Cartier on polynomial generators, then extend it to derived graded pieces and
smooth algebras. The graded identification is canonical; spectral-sequence convergence needs its own
estimate.

### 3.4 The polynomial Cartier map

For a polynomial algebra `F` over an `F_p`-algebra `A`, construct the canonical isomorphism of
`F^(1)`-modules `C⁻¹ : ∧^k Ω¹_(F^(1)/A) ≃ H^k(Ω•_(F/A))` for every `k`, extending to a graded
`F^(1)`-algebra isomorphism `⊕_k Ω^k_(F^(1)/A)[−k] → ⊕_k H^k(Ω•_(F/A))[−k]`. In one variable, applying the
source recipe with the lift `t ↦ t^p` gives `dt ↦ [t^(p−1) dt]` in degree one; that formula is a
consequence of the recipe and is not displayed in the source. The canonical assertion is on
cohomology; a chain-level splitting obtained from a lift may depend on choices.

[Bhatt12], Theorem 3.2, proof and Remark 3.3, p.7.

*Needs:* Layer 2: The ordinary algebraic de Rham complex; Layer 3: The derived Frobenius twist; Layer 2:
The graded Leibniz identity.

Lean: `DerivedDeRham.polynomialCartier`.

**Checks.**

- `test_cartier_weight_zero`: in weight 0, `C⁻¹` sends `t^(1)` to the class of `tᵖ`.
- `test_cartier_line`: `C⁻¹(dt^(1)) = [t^(p−1) dt]`; at `p = 2` this is `[t dt] ≠ 0`.
- `test_cartier_two_variables`: in two variables `C⁻¹(dx^(1) ∧ dy^(1)) = [x^(p−1) y^(p−1) dx ∧ dy]`,
  preserving the order of the generators.

### 3.5 Derived Cartier graded pieces

For every map `A → B` of `F_p`-algebras, `gr^conj_i dR_(B/A) ≃ L∧^i L_(B^(1)/A)[−i]` naturally in
`D(A)`. Here `L∧^i L_(B^(1)/A)` denotes the realization in `D(A)` of the levelwise exterior powers
`∧^i_(P•^(1)) Ω¹_(P•^(1)/A)` of the diagonal model (DerivedModuleAlgebra §0.9) of the cotangent
complex of `A → P•^(1)`. By base change (DerivedModuleAlgebra §0.10, DerivedModuleAlgebra §0.14) it
is `(L∧^i_B L_(B/A)) ⊗^L_(A, Frob_A) A`. The levelwise Cartier isomorphisms `H^i(Ω•_(P_n/A)) ≅
Ω^i_(P_n^(1)/A)` (3.4) are `P_n^(1)`-linear. When `B^(1)` is discrete (3.3) the identification holds
in `D(B^(1))`, with the derived exterior power over `B^(1)` of `L_(B^(1)/A)`. The exterior power and
Frobenius twist are derived.

[Bhatt12], Proposition 3.5 and proof, p.7.

*Needs:* Layer 3: The conjugate filtration; Layer 3: The derived Frobenius twist; Layer 3: The
polynomial Cartier map; DerivedModuleAlgebra §0.4 The full cotangent complex; DerivedModuleAlgebra
§0.14 Derived exterior powers; DerivedModuleAlgebra §0.9 The cotangent complex of a map of
simplicial rings and the diagonal comparison.

Lean: `DerivedDeRham.conjugateGradedCartier`.

**Checks.**

- `test_cartier_graded_zero`: `gr_0^conj = B^(1)` (`i = 0`).
- `test_cartier_graded_line`: for a polynomial line, `gr_1^conj = Ω¹_(B^(1)/A)[−1]`.
- `test_cartier_graded_shifted_conormal`: for `L = N[1]` with `N` flat, `L∧^i L[−i] = Γ^i N` in degree
  zero; shifting only one side of the Cartier map gives the wrong degree.
- `test_cartier_graded_nondiscrete_twist`: for `A = F_p[ε]/ε²` and `B = F_p`, `gr_0^conj = B^(1)` as an
  object of `D(A)` has `H^−1 ≅ Tor₁^A(F_p, Frob_*A) ≠ 0` (3.3). The `A`-linear formula keeps this term;
  replacing `B^(1)` by `π₀B^(1)` would lose it.

### 3.6 The classical smooth Cartier isomorphism

For any `F_p`-algebra `A` and a smooth `A`-algebra `B`, inverse Cartier gives
`∧^i_(B^(1)) Ω¹_(B^(1)/A) ≃ H^i(Ω•_(B/A))` as `B^(1)`-modules and graded algebras. The ordinary Frobenius
twist suffices because `B/A` is flat. Over an arbitrary characteristic-p field this is the relative
Cartier theorem, including imperfect fields and the relative twist.

[Bhatt12], Theorem 3.2 and Remark 3.4 with proof, p.7.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: The derived Frobenius twist;
DerivedModuleAlgebra §0.12 The smooth cotangent computation; DerivedModuleAlgebra §0.10 Derived base
change of the cotangent complex; Layer 2: Ordinary polynomial base change and Künneth.

Lean: `DerivedDeRham.smoothCartier`.

**Checks.**

- `test_smooth_cartier_line`: `F_p[t]` has `H⁰ = F_p[t^p]` and `H¹ = F_p[t^p] t^(p−1) dt`.
- `test_smooth_cartier_two`: at `p = 2`, `[t dt] ≠ 0` in `H¹`.
- `test_smooth_cartier_etale`: an étale algebra has no positive forms and `H⁰ = B^(1) = B`.

### 3.6.1 Relative conjugate transitivity

For composable `F_p`-algebras, [Bhatt12] Proposition 3.22 gives an
increasing relative conjugate filtration. It is built levelwise on a polynomial resolution `P•` of `B`
and a termwise polynomial `P•`-algebra resolution `Q•` of `C` (the proof of [Bhatt12] Proposition 3.22),
with the classical Katz transitivity for smooth maps. Its `gr_n` is, in `D(A)`, the realization of the
levelwise complexes `Ω•_(P_k/A) ⊗_(P_k^(1)) Frob_A^*(∧^n Ω¹_(Q_k/P_k)[−n])`, with
`P_k^(1) = P_k ⊗_(A, Frob_A) A` and `Frob_A^*` the extension along `P_k → P_k^(1)`, `x ↦ x ⊗ 1`. This
uses the Frobenius-descent connection. When `B^(1)` is discrete (3.3) the graded piece is
`dR_(B/A) ⊗^L_(B^(1)) Frob_A^*(Res^C_B(L∧^n_C L_(C/B)[−n]))`, with `Frob_A^*` the extension along
`B → B^(1)`, `b ↦ b ⊗ 1`. Finite Hodge quotients and specified completions retain the extension data; no
de Rham-with-coefficients theory beyond this filtration is asserted. The relative cotangent exterior
power is formed over `C`; only afterwards is it regarded as a `B`-module for this Frobenius base change.

Construct `DerivedDeRham.relativeConjugateTransitivity` with `Fil_−1 = 0`, natural
increasing transition maps, exhaustiveness and multiplication
`Fil_i ⊗^L_A Fil_j → Fil_(i+j)`. The totalization and Frobenius-twisted scalars are those
of 3.3 and 3.5; no replacement of a nondiscrete twist by `π₀` is made.

[Bhatt12], Proposition 3.22, Remark 3.23 and Lemma 3.24, pp.11–12.

*Needs:* Layer 2: Derived de Rham transitivity filtrations (ordinary base-forms filtration); Layer
3: The derived Frobenius twist; Layer 3: Derived Cartier graded pieces; Layer 3: The classical
smooth Cartier isomorphism; Layer 1: Filtered derived categories; Layer 1: Valid exchanges of
completion and derived operations; DerivedModuleAlgebra §0.17 Exterior powers of a triangle and
décalage.

**Checks.**

- `test_relative_conjugate_identity_top`: for `B = C`, there is only weight zero,
  `dR_(B/A)`.
- `test_relative_conjugate_identity_base`: for `A = B`, this is the conjugate filtration
  of `dR_(C/A)`, with graded pieces `L∧^n L_(C^(1)/A)[−n]`.
- `test_relative_conjugate_coordinate`: for `F_p → F_p[t] → F_p[t,u]`, the weight-one
  class in the relative coordinate is `u^(p−1) du`, rather than `du`; weight zero
  contains the relative constants `F_p[t,u^p]` with their base de Rham differential.

### 3.7 The conjugate spectral sequence and convergence

For `A → B` over `F_p` the increasing exhaustive filtration gives the exact-couple spectral sequence
with `E₁^(i,j) = H^(i+j)(L∧^i L_(B^(1)/A)[−i]) = H^j(L∧^i L_(B^(1)/A))`, abutting conditionally to
`H^(i+j) dR_(B/A)`. Strong convergence in a given degree holds when only finitely many filtration
indices contribute there (for example a bounded smooth affine complex); otherwise the complete and
`lim¹` conditions of DerivedModuleAlgebra §1.1 are stated and checked using the sequence supplied by
DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*, and any use of
DerivedModuleAlgebra §1.T.1 / *Mittag-Leffler towers have vanishing lim¹* verifies the
Mittag-Leffler condition on the cohomology tower. Global and completed variants retain their
totalization and convergence hypotheses.

[Bhatt12], Proposition 2.3 and Remark 2.4; Proposition 3.5, pp.5, 7; [GP], Proposition 2.18, pp.7–8.

*Needs:* Layer 3: The conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 1:
Filtered derived categories; Layer 1: Valid exchanges of completion and derived operations;
DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The Milnor
sequence for towers of complexes*.

Lean: `DerivedDeRham.conjugateSpectralSequence`.

Prove the following named laws.

- `conjugateSpectralE1`: `E₁^(i,j) = H^j(L∧^i L_(B^(1)/A))`.
- `conjugateSpectralFunctorial`: base-compatible algebra maps induce maps of exact couples and spectral
  sequences.
- `conjugateSpectralFiniteConvergence`: finite contribution in each total degree gives a separated
  exhaustive finite filtration on the abutment.
- `conjugateSpectralCompletion`: filtered reflection leaves the cofibre exact couple unchanged; the
  abutment still requires its own convergence check.

**Checks.**

- `test_conjugate_spectral_base`: for `A → A`, only `E₁^(0,0) = A` is nonzero.
- `test_conjugate_spectral_line`: for `F_p[t]/F_p`, weights 0, 1 compute the classical Cartier modules in
  total degrees 0, 1.
- `test_conjugate_spectral_nonlci`: for `B = F_p[x,y]/(x,y)²`, `E₁^(1,−2) = H^−2(L_(B^(1)/F_p)) ≅ F_p`
  (the Lichtenbaum–Schlessinger description of DerivedModuleAlgebra §0.7 for the generators `x², xy, y²`) sits in total
  degree `−1`, so the spectral sequence has terms in negative total degree and a first-quadrant
  convergence argument cannot apply.

### 3.8 Regular quotient divided-power calculations

Let `A → B = A/I` be a regular-sequence quotient of `F_p`-algebras. Put `B^(1) = B ⊗^L_(A,Frob_A) A`; in
the Tor-independent case this is `A/(f₁^p, …, f_r^p)`. Then `L_(B^(1)/A) ≃ (I^(1)/(I^(1))²)[1]`, and
`gr_i^conj dR_(B/A) ≃ Γ^i_(B^(1))(I^(1)/(I^(1))²)` in degree zero. Hence `dR_(B/A)` is discrete by
exhaustive realization. The identification with the classical PD envelope is Layer 4.

[Bhatt12], Lemma 3.42, Remark 3.43 and the regular quotient computation of §3.3, pp.17–18.

*Needs:* DerivedModuleAlgebra §0.13 Regular quotients and two-term models; DerivedModuleAlgebra
§0.17 Exterior powers of a triangle and décalage; Layer 3: Derived Cartier graded pieces; Layer 3:
The conjugate filtration.

Lean: `DerivedDeRham.regularQuotientDividedPowers`.

**Checks.**

- `test_regular_dp_empty`: for the empty sequence `B = A` and only weight 0 survives.
- `test_regular_dp_one`: for one regular element `f`, `L = (f)/(f²)[1]` and `gr_i = Γ^i` of a free
  rank-one module, in degree zero.
- `test_regular_dp_two`: at `p = 2`, `γ₂` of the conormal generator survives although the square of
  `γ₁` vanishes.

*Extension classes and chosen splittings.*

The first conjugate extension encodes a lifting obstruction. Compatible Frobenius lifts can split the
whole filtration, with the dependence on those choices retained.

### 3.9 The first conjugate extension and W₂ lifting

For `A → B` over `F_p`, the extension `B^(1) → Fil₁^conj dR_(B/A) → L_(B^(1)/A)[−1]` in `D(A)` has a
boundary map `ob₁ : L_(B^(1)/A)[−1] → B^(1)[1]`. When `B^(1)` is discrete (3.3) the triangle lies in
`D(B^(1))` and `ob₁` is a class in `Ext²_(B^(1))(L_(B^(1)/A), B^(1))`. Given a compatible `W₂` lift
of `A`, it is then the obstruction (DerivedModuleAlgebra §0.25) to a compatible `W₂` lift of the
Frobenius-twisted `B`, as in [Bhatt12] Proposition 3.15. The first conjugate extension need not
split; a canonical isomorphism of graded pieces does not supply a canonical splitting.

[Bhatt12], Proposition 3.15 and Remark 3.16, pp.9–10.

*Needs:* DerivedModuleAlgebra §0.25 Cotangent obstruction theory for square-zero lifts; Layer 3: The
conjugate filtration; Layer 3: Derived Cartier graded pieces.

Lean: `DerivedDeRham.cartierExtensionObstruction`.

**Checks.**

- `test_w2_identity`: for the identity, `L = 0` and the extension is trivial.
- `test_w2_polynomial`: a polynomial algebra over a `W₂`-liftable base lifts, so the class vanishes.
- `test_w2_regular_quotient`: for `F_p[t] → F_p` over the `W₂` lift `ℤ/p²[t] → ℤ/p²`, the quotient
  lifts, so the class vanishes although `L = F_p[1]` is nonzero.

### 3.10 A splitting from compatible Frobenius lifts

If a map `A → B` of `F_p`-algebras has compatible flat `ℤ/p²` lifts and compatible lifts of the absolute
Frobenius on both rings, these choices produce a multiplicative splitting
`dR_(B/A) ≃ ⊕_(i≥0) L∧^i L_(B^(1)/A)[−i]` of the conjugate filtration in `D(A)`. On the model it is given
by levelwise `P•^(1)`-linear maps of dg algebras, and it is `B^(1)`-linear in `D(B^(1))` when `B^(1)` is
discrete (3.3). The chain-level splitting
depends on the lift data; the cohomological Cartier map is canonical. Liftability and Frobenius
compatibility are retained.

[Bhatt12], Proposition 3.17 and proof, pp.10–11.

*Needs:* Layer 3: The polynomial Cartier map; Layer 3: Derived Cartier graded pieces; Layer 3: The
conjugate filtration.

Lean: `DerivedDeRham.frobeniusLiftSplitting`.

**Checks.**

- `test_frobenius_lift_line`: for `ℤ/p²[t]` with `t ↦ t^p`, the induced class in degree one is
  `[t^(p−1) dt]`, and at `p = 2` it is `[t dt]`.
- `test_frobenius_lift_identity`: for the identity the splitting is the unit `B^(1) = A`.
- `test_frobenius_lift_choice`: for `ℤ/p²[t]`, the Frobenius lifts `t ↦ t^p` and `t ↦ t^p + pt` send
  `dt^(1)` to `t^(p−1) dt` and `t^(p−1) dt + dt`; these differ by the exact form `d(t)`, so the chain-level
  splittings differ while the cohomological Cartier class is the same.

### 3.11 The square-zero non-lci quotient

For `k = F_p` and `B = k[x,y]/(x², xy, y²)`, put `P = k[x,y]` and `I = (x², xy, y²)` with generators
`e₁, e₂, e₃ ↦ x², xy, y²`. The relation module is free on `r₁ = y e₁ − x e₂` and `r₂ = y e₂ − x e₃`,
and the Koszul relations are generated by `x r₁`, `y r₂` and `y r₁ + x r₂`. The
Lichtenbaum–Schlessinger description of `τ_(≥−2)L` (DerivedModuleAlgebra §0.7) gives `H^−2(L_(B/k))
= ker(Rel/TrivRel → I/I² ⊗ …) ≅ k`, spanned by the class of `y r₁ = −x r₂`. Thus `L_(B/k)` is not of
amplitude `[−1, 0]`, and the two-term polynomial presentation complex `[I/I² → B dx ⊕ B dy]`
computes only `τ_(≥−1)L`. Since `k → B` is finite flat and `B` is not a complete intersection (`I`
needs three generators but has height two, [StacksAlg] Lemma 10.135.4), `L_(B/k)` has infinite Tor
amplitude: `D_n(B|k, k) ≠ 0` for infinitely many `n` ([Avramov] Theorem (1.3), with flat dimension
of a pseudo-coherent complex over a Noetherian local ring detected by Tor against the residue
field). The quotient has a flat `ℤ/p²` lift with the same equations and the compatible Frobenius
lift `x ↦ x^p`, `y ↦ y^p`, and here `B^(1) = B`; by 3.10, `dR_(B/k)` contains `L_(B/k)[−1]` as a
`B`-linear summand, so `H^−1(dR_(B/k)) ⊇ H^−2(L_(B/k)) ≠ 0` and `dR_(B/k) ⊗^L_B k` has nonzero
cohomology in infinitely many negative degrees. Classical crystalline cohomology, sheaf cohomology
in nonnegative degrees, cannot be equivalent to this object.

[Bhatt12], Example 3.21, p.11; [StacksCt], Lemma 13.3, Tag 09CG, p.26; [Avramov], Theorem (1.3) and
Proposition (1.8), pp.459–461.

*Needs:* DerivedModuleAlgebra §0.4 The full cotangent complex; DerivedModuleAlgebra §0.7 Degree zero
and the naive cotangent complex; Layer 0: Cohen factorizations and the vanishing theorems; Layer 3:
A splitting from compatible Frobenius lifts.

Lean: `DerivedDeRham.nonregularQuotientHomology`.

**Checks.**

- `test_square_zero_h2`: `H^−2(L_(B/k)) ≅ k`, at every `p` including `p = 2`.
- `test_square_zero_naive`: the naive cotangent complex has `H^−1 = ker(I/I² → B dx ⊕ B dy)` and
  nothing below; it misses `H^−2`.
- `test_square_zero_dual_numbers_contrast`: for the lci `k[t]/(t²)`, `H^−2(L) = 0`; the difference is
  the non-Koszul relation `y r₁`.

### 3.12 Why Hodge completion matters

If `A → B` is a map of `ℚ`-algebras, direct-sum derived de Rham satisfies `dR_(B/A) ≃ A`, because every
positive conjugate graded piece vanishes (polynomial algebras over `ℚ` have no positive de Rham
cohomology) and the conjugate filtration is exhaustive. For `ℚ[t, t⁻¹]/ℚ` the ordinary complex instead
has `H¹ = ℚ·dt/t`. Hodge completion recovers ordinary de Rham cohomology for smooth finitely presented
`ℚ`-algebras, as the next subsection proves. Hodge completion and p-completion are separate operations.

[Bhatt12], Corollary 2.5, proof and Remark 2.6, pp.5–6; [Bhatt12], Remark 3.12 and Corollary 3.10,
p.8.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 3: The conjugate filtration;
Mathlib `LaurentPolynomial`.

Lean: `DerivedDeRham.rationalCollapse`.

**Checks.**

- `test_rational_collapse_identity`: `dR_(ℚ/ℚ) = ℚ`.
- `test_rational_collapse_laurent`: `dR_(ℚ[t,t⁻¹]/ℚ) = ℚ` while `H¹(Ω•) = ℚ dt/t ≠ 0`.
- `test_rational_collapse_not_p`: over `F_p`, `dR_(F_p[t]/F_p)` has `H¹ ≠ 0`; the collapse is a
  characteristic-zero statement.

*Hodge, p-adic and continuous variants.*

Specify each completion separately, then prove the smooth comparisons in their respective ranges. The
rational comparison uses agreement of graded pieces only after Hodge completeness.

### 3.13 Smooth ordinary and completed de Rham comparisons

For a smooth map of `ℤ/p^n`-algebras with `n ≥ 1`, uncompleted `dR_(B/A) ≃ Ω•_(B/A)`. For any smooth
finitely presented `A → B`, the Hodge-completed `dR^hc_(B/A) ≃ Ω•_(B/A)`: the augmentation of a
polynomial resolution gives a map of Hodge-filtered dg algebras `dR_(B/A) → Ω•_(B/A)`; on `gr^i` it
is `L∧^i L_(B/A)[−i] → Ω^i_(B/A)[−i]`, an isomorphism by DerivedModuleAlgebra §0.12 and 2.24; both
targets are complete (`Ω^(≥i)` vanishes in degrees below `i`), so it is an isomorphism after Hodge
completion by 1.15. For `ℚ`-algebras this is the rational comparison, while the uncompleted
`dR_(B/A) ≃ A` (3.12). For p-completely smooth bounded-torsion formal algebras, p-completed derived
de Rham identifies with the continuous ordinary complex of 2.27. Each equivalence preserves the
Hodge filtration and multiplication.

[Bhatt12], Corollary 3.10, Remarks 2.6 and 3.12, pp.6, 8; [BL22], Appendix E, Proposition E.12 and
Construction E.14, pp.234–235.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge graded pieces of
derived de Rham; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham;
Layer 2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Why Hodge completion
matters; DerivedModuleAlgebra §0.12 The smooth cotangent computation; Layer 1: Completion of a
filtered object.

Lean: `DerivedDeRham.smoothDeRhamComparison`.

**Checks.**

- `test_smooth_comparison_fp`: over `F_p`, `dR_(F_p[t]/F_p) ≃ Ω•` with `H⁰ = F_p[t^p]`.
- `test_smooth_comparison_rational`: over `ℚ`, `dR^hc_(ℚ[t,t⁻¹]/ℚ)` has `H¹ = ℚ dt/t` while uncompleted
  `dR = ℚ`.
- `test_smooth_comparison_formal`: for `ℤ_p⟨t⟩` over `ℤ_p`, `dR̂` is the continuous complex
  `[ℤ_p⟨t⟩ → ℤ_p⟨t⟩ dt]`, with `H¹` containing the nonzero classes of `t^(p^n − 1) dt`
  for `n ≥ 1`, which are not exact integrally. At `n = 0`, `dt = d(t)` has zero class.

*Transitivity, sheaves and a singular calculation.*

Retain connection and extension data. Global objects are formed using finite-quotient descent before
completion; their graded pieces, rather than their full differential, are `O_X`-linear.

### Examples

On the polynomial line over `F_p`, inverse Cartier sends `dt^(1)` to `[t^(p−1) dt]`. At `p = 2` this is
`[t dt]`, and on the identity algebra the relative Frobenius twist is the base itself. A zero conormal
has only weight zero, while a shifted free conormal has nonzero divided powers in every weight. The
square-zero quotient `F_p[x,y]/(x,y)²` has `H^−1(dR) ≠ 0`.

### Dependencies

Layers 0–2 supply cotangent powers, ordinary differential algebra and polynomial realization. The
conjugate filtration precedes both the rational boundary calculation and the smooth comparison.

## Layer 4: PD conjugate filtrations and a torsion boundary

Construct the conjugate filtration of PD envelopes and compute the torsion boundary of
p-completed derived de Rham.

### 4.2 The conjugate filtration of a PD envelope

For an `F_p`-algebra `A`, ideal `I` and PD envelope `D_A(I)`, define `Fil_n^conj` as the `A`-submodule
generated by products `∏ a_j^[l_j]` with `a_j ∈ I` and `Σ l_j < (n+1)p`, with `Fil_(−1) = 0`. It is
increasing, multiplicative and exhaustive; equivalently use products `∏ a_j^[p k_j]` with
`Σ k_j ≤ n`. There is a canonical surjective graded map
`Γ^*_(A/I)(I/I²) ⊗_(A/I, Frob) A/φ(I) → gr_*^conj D_A(I)`, sending divided-power monomials to
`∏((p k_j)!/(p^(k_j) k_j!)) a_j^[p k_j]`. Here `φ(I)` is the ideal generated by `a^p` for `a ∈ I`. These
factors are p-adic units.

[BMS19], Definition 8.10 and Proposition 8.11, pp.271–272.

*Needs:* DerivedModuleAlgebra §0.DP.3; §§PD.4–PD.6 here; Mathlib `DividedPowers`,
`DividedPowerAlgebra`.

Lean: `DerivedDeRham.pdConjugateFiltration`.

Prove the following named laws.

- `pdConjugateMembership`: the two displayed generator descriptions define the same filtration level.
- `pdConjugateProduct`: `Fil_i · Fil_j ⊆ Fil_(i+j)` and `colim Fil_i = D_A(I)`.
- `pdConjugateGradedMap`: the divided-power graded map has the displayed Frobenius base change and
  factorial factors.
- `pdConjugateNatural`: maps of `F_p` PD envelope problems preserve all levels and the graded map.

**Checks.**

- `test_pd_conj_zero_ideal`: for `I = 0` only weight zero survives, and `D_A(0) = A`.
- `test_pd_conj_coordinate`: for `A = F_p[x]`, `I = (x)`, `γ_(pk)(x)` has conjugate weight `k` and
  `γ_(p−1)(x)` belongs to weight zero; the factor for `k = 1` is `(p−1)!`, which is `−1` modulo `p` for odd
  `p` and `+1` at `p = 2`.
- `test_pd_conj_two_filtrations`: `γ_p(x)` has conjugate weight 1 but PD (Hodge) weight `p`; the two
  filtrations are different.

### 4.6 The torsion boundary for F_p over Z_p

The p-completed de Rham complex of `F_p/ℤ_p` is the derived completion of
`[ℤ_p⟨x⟩ --(x−p)→ ℤ_p⟨x⟩]` in degrees `−1, 0`. Its decompleted model is `ℤ_p ⊕ ⊕_(j>0) ℤ_p/j` in degree
zero; the completion of the torsion direct sum need not be torsion. In the factors `ℤ_p/p^n` the
coordinates `p^⌊n/2⌋` tend p-adically to zero and have unbounded orders, hence define a nontorsion
completed-sum element. The coordinates `p^(n−1)` printed in [Bhatt12] Remark 8.7 are all killed by `p`
and do not witness this. For a perfect `F_p`-algebra `A₀`, the Witt summand in [Bhatt12] Corollary 8.6
is `W(A₀)`.

[Bhatt12], Proposition 8.5, Corollary 8.6, Remark 8.7, p.32.

*Needs:* DerivedModuleAlgebra §1.3 The derived completion reflector; Layer 1: Valid exchanges of
completion and derived operations; Layer 2: p-completed derived de Rham; §PD.6 here; Mathlib
`WittVector`.

Lean: `DerivedDeRham.fpOverZpTorsion`.

**Checks.**

- `test_fp_zp_differential`: the two-term map is multiplication by `x − p` on `ℤ_p⟨x⟩`.
- `test_fp_zp_nontorsion`: the element with coordinates `p^⌊n/2⌋` in the factors `j = p^n` is not
  killed by any power of `p`.
- `test_fp_zp_torsion_coordinates`: the element with coordinates `p^(n−1)` is killed by `p`.

### Examples

The conjugate weight of `γ_p(x)` differs from its PD weight. In the completed torsion sum,
coordinates `p^⌊n/2⌋` have unbounded order, whereas `p^(n−1)` is killed by `p`.

### Dependencies

DerivedModuleAlgebra §§1.1–1.5 supplies limits and completion. Layers 1–3 and PD here supply
filtered operations, derived de Rham, Cartier theory and PD envelopes.

## Layer 5: Quasisyntomic descent, periods and geometric control

Construct the sites and covers before applying descent to cotangent powers, de Rham objects and
schemes. The period setup precedes the period descriptions and proper smooth control.

### 5.1 The quasisyntomic sites

Fix `p`. `QSyn` has p-complete bounded-p-torsion rings whose `L_(A/ℤ_p)` has p-complete Tor amplitude
`[−1, 0]` (1.23); its opposite has the topology whose covers are the quasisyntomic covers of 1.23.
For an arbitrary ring `R`, construct the big slice `QSyn_R` of all maps `R → A` with `A ∈ QSyn`.
For a base `R ∈ QSyn`, construct the small relative subsite `qSyn_R` of relative quasisyntomic
`R`-algebras, `DerivedDeRham.quasisyntomicSite`. The small-site construction and its inclusion take
an explicit witness of the base's absolute quasisyntomicity. Completed fibre products of covers,
composition and base-change stability define the sites; the ring category need not have every finite
limit. The two relative categories are distinguished.

[BMS19], Definition 4.10; Lemmas 4.15–4.17 and 4.34; Variants 4.33 and 4.35,
pp.223–225, 231–232.

*Needs:* Layer 1: The quasisyntomic cotangent condition; DerivedModuleAlgebra §0.8 The cotangent
transitivity triangle; DerivedModuleAlgebra §0.10 Derived base change of the cotangent complex;
DerivedModuleAlgebra §1.7 Complete flatness and complete faithful flatness; DerivedModuleAlgebra
§1.9 Complete faithful-flat module descent.

Prove the following named laws.

- `qSynCoverComposition`: identity covers and composites are covers.
- `qSynCoverBaseChange`: the p-completed derived pushout of a cover is an ordinary bounded-torsion
  quasisyntomic cover under complete flatness.
- `qSynObjectCoverDescent`: for a relative quasisyntomic cover `A → B` of p-complete
  bounded-p-torsion rings, defined by relative cotangent amplitude and p-complete faithful
  flatness without assuming either absolute object condition, `A ∈ QSyn` iff `B ∈ QSyn`.
- `qSynRelativeInclusion`: for `R ∈ QSyn`, a relative quasisyntomic algebra `R → A` has `A ∈ QSyn`
  by cotangent transitivity and p-complete flatness, giving a fully faithful inclusion
  `qSyn_R → QSyn_R`. For `R = ℤ_p` or `R` integral perfectoid, the relative cotangent amplitude is
  automatically `[−1, 0]` on the big slice.

**Checks.**

- `test_qsyn_site_zp`: `ℤ_p` lies in `QSyn` and its identity is a cover.
- `test_qsyn_site_smooth`: the p-completion of a smooth algebra over an integral perfectoid ring is an
  object.
- `test_qsyn_site_relative`: for `R ∈ QSyn` and a relative quasisyntomic `R → A`, the transitivity
  triangle modulo `p` has base term of Tor amplitude `[−1, 0]` by flatness of `A/p` over `R/p`, and
  relative term of the same amplitude; hence `A ∈ QSyn`.
- `test_qsyn_site_nonlci`: for every prime `p`, including `p = 2`, `S = F_p[x,y]/(x,y)²` has a relative
  quasisyntomic identity map: it is p-completely faithfully flat with `L_(S/S) = 0`. But `S ∉ QSyn`:
  its minimal complete local presentation `F_p[[x,y]]/(x²,xy,y²)` has an ideal of height 2 needing
  three generators, so `S` is not lci. Thus it cannot serve as the base of the small-site inclusion.
  More explicitly, by 3.11, `D_n(S|F_p, F_p) ≠ 0` for
  infinitely many `n`, and the transitivity sequence of `ℤ → F_p → S` identifies `D_n(S|ℤ, F_p)` with
  `D_n(S|F_p, F_p)` for `n ≥ 3`, so `L_(S/ℤ) ⊗^L_S S/p` is not of amplitude `[−1, 0]`.

### 5.2 Quasiregular semiperfectoid rings

A quasiregular semiperfectoid ring `S` is a `QSyn` object admitting a map from an integral perfectoid
ring `R` (PerfectoidSpaces §P1.24, `IsIntegralPerfectoid`) and having surjective Frobenius on `S/p`.
Equivalently it is a quotient of an integral perfectoid ring by a p-completely quasiregular ideal, with
bounded p-torsion and relative cotangent in degree `−1`. `QRSPerfd` carries the induced cover topology.
In characteristic `p` these are exactly the quasiregular semiperfect `F_p`-algebras:
`S^♭ = lim_φ S → S` is surjective and `L_(S/F_p) ≃ L_(S/S^♭) ≃ (I/I²)[1]` with `I/I²` flat,
`I = ker(S^♭ → S)`. Quasiregularity need not mean a finite regular sequence.

[BMS19], Definition 4.20, Remarks 4.21–4.24, Lemma 4.25 with proof; Definition 8.8, pp.227–229, 270.

*Needs:* Layer 5: The quasisyntomic sites; DerivedModuleAlgebra §0.8 The cotangent transitivity
triangle; DerivedModuleAlgebra §0.10 Derived base change of the cotangent complex;
DerivedModuleAlgebra §0.16 Derived divided powers; PerfectoidSpaces §P1.24–§P1.25.

Lean: `DerivedDeRham.quasiregularSemiperfectoidRings`.

Prove the following named laws.

- `qrspPerfectoidQuotient`: the quotient characterization uses a p-completely quasiregular ideal and an
  integral perfectoid source.
- `qrspCotangentDegree`: for `S` and any integral perfectoid `R → S`, `Λ_p L_(S/R)` is a shifted
  complete-flat module.
- `qrspCharacteristicP`: in characteristic `p`, `QRSPerfd` equals quasiregular semiperfect
  `F_p`-algebras with flat `I/I²`.
- `qrspPerfectoidExample`: every integral perfectoid ring is a `QRSPerfd` object.

**Checks.**

- `test_qrsp_perfect_fp`: every perfect `F_p`-algebra is quasiregular semiperfect, with `I = 0`.
- `test_qrsp_root_quotient`: `F_p[t^(1/p^∞)]/(t)` is quasiregular semiperfect, with its nonzero conormal
  module in degree `−1`.
- `test_qrsp_zp_boundary`: `ℤ_p` meets the `QSyn` and semiperfect-reduction conditions but admits no map
  from an integral perfectoid ring: in such a ring a unit multiple of `p` has a `p`-th root ([BMS] Lemma
  3.10, PerfectoidSpaces §P1.24), whose image in `ℤ_p` would have valuation `1/p`. So `ℤ_p` is excluded.

### 5.3 Compatible-root quasisyntomic covers

For `A ∈ QSyn`, choose a surjection `F = ℤ_p⟨X_i⟩_(i∈I) → A` from a p-complete polynomial algebra on a
set `I`. Adjoin compatible p-power roots of `p` and of all coordinates to obtain
`F_∞ = ℤ_p[p^(1/p^∞), X_i^(1/p^∞)]^∧_p`; `F_∞` is integral perfectoid by the Frobenius criterion of
PerfectoidSpaces §P1.24 ([BMS] Lemma 3.10(ii)): `π = p^(1/p)` is a nonzerodivisor, `π^p ∣ p`, `F_∞` is
`π`-adically complete, and Frobenius `F_∞/π → F_∞/π^p` is bijective on the monomial basis. Put
`S = Λ_p(A ⊗^L_F F_∞)`. Then `A → S` is a quasisyntomic cover and `S ∈ QRSPerfd`, its mod-p module is
free and faithfully flat over `A/p`, and `L_((S/p)/(A/p))[−1]` is free. The cover is elementary; it does
not use André's flatness lemma (PerfectoidSpaces §P4.15.4).

[BMS19], Lemma 4.28 and Remark 4.29 with proof, p.229; [BMS], Lemma 3.10, p.22 (as stated in
PerfectoidSpaces §P1.24).

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings;
DerivedModuleAlgebra §1.6 Completion of simplicial commutative algebras; DerivedModuleAlgebra §1.7
Complete flatness and complete faithful flatness; DerivedModuleAlgebra §1.9 Complete faithful-flat
module descent; DerivedModuleAlgebra §0.10 Derived base change of the cotangent complex;
DerivedModuleAlgebra §0.8 The cotangent transitivity triangle; PerfectoidSpaces §P1.24–§P1.25.

Lean: `DerivedDeRham.elementarySemiperfectoidCovers`.

Prove the following named laws.

- `rootCoverFaithfullyFlat`: `S/p` is free and faithfully flat over `A/p`.
- `rootCoverCotangent`: `L_((S/p)/(A/p))[−1]` is a free `S/p`-module.
- `rootCoverPerfectoidSource`: the cover comes with an integral perfectoid surjection `F_∞ → S`.
- `rootCoverFunctorialRefinement`: maps between choices of generators produce a common refinement of the
  resulting covers.

**Checks.**

- `test_root_cover_zp`: for `A = ℤ_p`, adjoining all compatible roots of `p` and completing gives a
  perfectoid cover.
- `test_root_cover_coordinate`: for `A = ℤ_p⟨t⟩`, roots of `p` and `t` give the stated free mod-p module
  and shifted free relative cotangent.
- `test_root_cover_finite_roots`: adjoining only `t^(1/p)` leaves elements without p-power roots and does
  not establish semiperfectness.

### 5.4 Refinement and Čech stability of QRSP covers

Completed base change of a `QSyn` cover with `QRSP` target by a `QRSP` object is `QRSP`; each term of the
completed Čech nerve of `A → S` with `S ∈ QRSPerfd` is `QRSP`. Any two such covers admit a common `QRSP`
refinement by applying the elementary cover to their completed fibre product. The big-slice variant
allows an arbitrary base `R`; the small relative variant takes a witness `R ∈ QSyn` and uses the
`QRSP` objects of `qSyn_R` under `qSynRelativeInclusion`. This establishes the basis condition
needed for unfolding.

[BMS19], Lemmas 4.27 and 4.30, pp.229–230; Variants 4.33 and 4.35, pp.231–232.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Quasiregular semiperfectoid rings; Layer 5:
Compatible-root quasisyntomic covers; DerivedModuleAlgebra §1.9 Complete faithful-flat module
descent.

Lean: `DerivedDeRham.qrspRefinement`.

**Checks.**

- `test_qrsp_refinement_identity`: the identity cover of a `QRSP` object is stable.
- `test_qrsp_refinement_two_roots`: two root covers refine by adjoining both root systems.
- `test_qrsp_refinement_noncover`: `ℤ_p → F_p` is not a cover, so it is not refined.

### 5.5 Sheaves and unfolding from the QRSP basis

For a functor `F` from `QRSPerfd` to complexes (or to complete filtered complexes) satisfying Čech
descent for `QRSP` covers in the sense of the Conventions, define the unfolding
`F^unf(A) = Tot(F(S•))` for any `QRSP` cover `A → S`, `DerivedDeRham.qrspUnfolding`; it is independent of
the cover up to canonical quasi-isomorphism by common refinement (5.4), satisfies Čech descent on
`QSyn`, and restriction and unfolding are inverse up to quasi-isomorphism between descent-satisfying
functors on `QSyn` and on `QRSPerfd`. The same applies to `QSyn_R` for arbitrary `R`, and to `qSyn_R`
with a witness `R ∈ QSyn` and its `QRSP` basis from 5.4. For complete filtered targets, evaluation
and graded pieces commute with unfolding; the underlying object commutes
for nonnegative filtrations that are constant below zero. When `F` takes values in strict commutative dg
algebras, `Tot(F(S•))` carries the Alexander–Whitney product. It is associative and unital but
graded-commutative only in the derived category, so the unfolding is multiplicative in the cup-product
sense of the Conventions, not as a strict commutative dg algebra.

[BMS19], Proposition 4.31 and Remark 4.32, pp.230–231; Variants 4.33 and 4.35, pp.231–232.

*Needs:* Layer 5: Compatible-root quasisyntomic covers; Layer 5: Refinement and Čech stability of
QRSP covers; Layer 1: Filtered derived categories; Layer 1: Completion of a filtered object;
DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The Milnor
sequence for towers of complexes*.

**Checks.**

- `test_unfolding_identity`: for a `QRSP` object `A` and the identity cover, `F^unf(A) = F(A)`.
- `test_unfolding_constant`: for a constant functor the unfolding is constant.
- `test_unfolding_cover_independence`: for `A = ℤ_p⟨t⟩`, the root cover adjoining roots of `p` and `t`
  and the cover adjoining in addition roots of `1 + t` give canonically quasi-isomorphic unfoldings,
  through their common refinement.

*Cotangent and de Rham descent.*

Prove cotangent-power descent, then finite Hodge-quotient descent and Hodge-completed descent. For
p-completed uncompleted `dR`, use the uniform lower bound on the conjugate stages in the relative site.

### 5.6 Descent of raw and completed cotangent powers

For a fixed ordinary ring `R` and a faithfully flat map `A → B` of `R`-algebras,
construct `DerivedDeRham.cotangentFlatDescent`: `A ↦ L∧^i_A L_(A/R)` satisfies
Čech descent in `D(R)` for every `i ≥ 0` ([BMS19] Theorem 3.1). This raw theorem
has no p-completeness hypothesis. Separately, for a fixed ring `R` and a p-completely faithfully flat map `A → B` between bounded-torsion p-complete
`R`-algebras, the completed cotangent exterior-power functor `A ↦ Λ_p L∧^i_A L_(A/R)` satisfies Čech
descent. Finite Hodge quotients inherit descent by finite exact extensions. The mod-p proof keeps the
derived reductions and the completed base ring; no freeness of the cotangent complex is assumed.

[BMS19], Theorem 3.1 and the p-completed use in Example 5.11, pp.217–218, 240.

*Needs:* DerivedModuleAlgebra §0.4 The full cotangent complex; DerivedModuleAlgebra §0.10 Derived
base change of the cotangent complex; DerivedModuleAlgebra §0.14 Derived exterior powers;
DerivedModuleAlgebra §0.17 Exterior powers of a triangle and décalage; DerivedModuleAlgebra §1.9
Complete faithful-flat module descent; Layer 1: Valid exchanges of completion and derived
operations.

Lean: `DerivedDeRham.completedCotangentDescent`.

**Checks.**

- `test_cotangent_descent_identity`: for the identity cover the cosimplicial powers are constant.
- `test_cotangent_descent_zero`: the zero cotangent complex of the identity descends to zero.
- `test_cotangent_descent_rational`: the faithfully flat cover `ℚ[t] → ℚ[t,u]` is in
  the raw theorem’s scope, with `L_(ℚ[t]/ℚ) = ℚ[t] dt ≠ 0`; no p-completion is used.
- `test_cotangent_descent_shifted`: for a polynomial line the exterior square vanishes while shifted
  conormal powers of a regular quotient do not.

### 5.7 Descent of Hodge quotients and completion

For a fixed ordinary ring `R`, prove `DerivedDeRham.hodgeQuotientFlatDescent`: for a
faithfully flat map `A → B` of `R`-algebras and finite `m`, the raw functor
`A ↦ dR_(A/R)/Fil_H^m` satisfies Čech descent, using `cotangentFlatDescent` and finite
extensions of Hodge graded pieces. Its quotient limit gives
`DerivedDeRham.hodgeCompletedFlatDescent` for `A ↦ dR^hc_(A/R)`.

Separately prove `DerivedDeRham.pCompletedHodgeDescent`: along p-completely faithfully flat maps of
bounded-p-torsion p-complete `R`-algebras, both `A ↦ Λ_p(dR_(A/R)/Fil_H^m)` for finite `m` and `A ↦
Λ_p dR^hc_(A/R)` satisfy Čech descent, using `completedCotangentDescent`. The completed Čech nerve
and all tensors are derived p-completed as in DerivedModuleAlgebra §1.9. For Hodge completion, `Tot`
commutes with the derived quotient inverse limit of DerivedModuleAlgebra §1.1 because both are
limits. Graded conservativity is used only in the complete filtered category. There is no assertion
that uncompleted derived de Rham commutes with every unbounded totalization.

[BMS19], Example 5.11, p.240; [BL22], Proposition E.16 with proof, pp.235–236.

*Needs:* Layer 5: Descent of raw and completed cotangent powers; Layer 2: Hodge graded pieces of
derived de Rham; Layer 2: Hodge-completed derived de Rham; Layer 2: p-completed derived de Rham;
Layer 1: Completion of a filtered object; Layer 1: Valid exchanges of completion and derived
operations; DerivedModuleAlgebra §1.1 Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The
Milnor sequence for towers of complexes*.

Lean: `DerivedDeRham.filteredDeRhamDescent` collects the three laws
`hodgeQuotientFlatDescent`, `hodgeCompletedFlatDescent` and `pCompletedHodgeDescent`
with their respective cover hypotheses.

**Checks.**

- `test_hodge_descent_quotient_one`: the Hodge quotient `m = 1` is `B`, which satisfies descent.
- `test_hodge_descent_identity`: the identity cover has constant totalization.
- `test_hodge_descent_limit`: the full completion is the inverse limit of the finite quotients, each
  using finitely many graded comparisons.

### 5.8 Derived de Rham on schemes and formal schemes

For a quasi-compact quasi-separated scheme `f : X → Spec A`, let `L_(X/A)` be the complex of
quasi-coherent sheaves with value `L_(B/A)` on affine opens `Spec B` ([StacksCt] Definition 24.1,
Tag 08T2, with the localization statement DerivedModuleAlgebra §0.11 for restrictions). Sheafify the
affine finite Hodge quotients `B ↦ dR_(B/A)/Fil_H^m` on `X_Zar` as complexes of sheaves of
`A`-modules, and write `Q_m` for their derived objects. The coefficient ring sheaf is the constant
sheaf `A`, not `O_X`. Equivalently one can retain their `f⁻¹O_(Spec A)`-module structure and then
restrict scalars to `A`. Over a general scheme base `S`, construct locally on its affine opens and
glue with coefficient sheaf `f⁻¹O_S`. The Hodge filtered sheaf object and its finite quotients live
in `D(X_Zar, f⁻¹O_S)` and its filtered diagram category. The cotangent powers and associated graded
pieces live in `D_QCoh(X)` before this restriction of scalars; the full de Rham differential is only
base-linear.

Define the Hodge-completed global object `DerivedDeRham.deRhamSheaves` by
`Rlim_m RΓ(X_Zar, Q_m)`. An affine hypercover with finitely many affine components in each degree
computes each `RΓ(X_Zar, Q_m)` by totalizing the affine values, using finite Hodge-quotient descent
before taking the Hodge limit. It has `gr_H^i = RΓ(X, L∧^i L_(X/A))[−i]`. Section 5.8.1 supplies a
separate raw sheaf object and affine recovery in the nilpotent-p lci range. Neither construction
asserts arbitrary unbounded flat descent. For
p-adic formal schemes use the p-complete charts `Spf B` of SchemeAndStackFoundations §4.7, derived
reductions and Hodge/p-completions in the same base-linear sheaf categories.

**Base-linear ringed-site realization.** This roadmap supplies the strict-complex adapter on these
Zariski sites and their finite reductions: `DerivedDeRham.baseLinearSheafDerived` is
`DerivedCategory (SheafOfModules R)` for the base coefficient sheaf of commutative rings `R`, and
`DerivedDeRham.baseLinearFilteredDerived` is the derived category of `ℤᵒᵖ`-indexed diagrams of those
module sheaves. Use the standard localization instances and EnhancedDerivedSheaves §§0.1–0.3
`ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`
and `ClassicalDerived.inverseLimits`, together with EnhancedDerivedSheaves §E1.4 `enhancedPullback`
and `enhancedPushforward`, on the coefficient ring sheaf `R`. These suppliers provide the generic
replacements, derived tensor, internal Hom, inverse/direct image, global sections and derived towers.
Here compare their homotopy categories and strict models with `baseLinearSheafDerived` and
`baseLinearFilteredDerived`; transport them levelwise to filtered diagrams, with restriction of
scalars to the base. Construct the filtration adapter and filtered completion using §§1.14–1.15 and
the supplied sheaf towers. The filtered adapter retains levelwise quasi-isomorphisms, cofibres and products and commutes
with restriction and derived inverse limits. SchemeAndStackFoundations §2.18 supplies the
quasi-coherent cotangent powers and their associated graded calculations.

Multiplicative structure passes from strict affine models to global cup products by
`schemeDeRhamRealization` and `schemeDeRhamCup` below. The Alexander–Whitney product on the Čech
totalization ([StacksCoh] §20.25, Tag 01FP) is associative and unital on the nose and
graded-commutative in `D(A)`. The ringed-site cup product uses tensor over the coefficient sheaf,
followed by the sheaf multiplication; no strictly commutative global model is asserted.

[BL22], Appendix B, Construction B.7 and Remark B.8; Appendix E, Proposition E.16, pp.226, 235–236;
[StacksSites] §§21.17–21.19, Tags 06YS, 06YY, 07A5, 07A6, 0B6C (K-flat resolutions, derived pullback,
unbounded hypercohomology and relative cup products), and §21.33, Lemmas 21.33.1–21.33.3,
Tags 0FPK, 0FPL, 0FPM; [StacksCoh] §20.25, Tag 01FP.

*Needs:* Layer 2: De Rham cohomology from polynomial resolutions; Layer 2: Hodge-completed derived
de Rham; Layer 2: p-completed derived de Rham; Layer 2: Hodge graded pieces of derived de Rham;
Layer 5: Descent of Hodge quotients and completion; DerivedModuleAlgebra §0.11 Localization and
filtered colimits of cotangent complexes; DerivedModuleAlgebra §0.2 Derived tensor products on
module derived categories; Layer 3: Smooth ordinary and completed de Rham comparisons; Mathlib
`AlgebraicGeometry.Scheme`, `SheafOfModules` and its Grothendieck abelian instance;
SchemeAndStackFoundations §2.18, §4.7; DerivedModuleAlgebra §1.1 Derived limits of towers; Layer 1:
Filtered derived categories; Layer 1: Completion of a filtered object; DerivedModuleAlgebra §1.T.1 /
*The Milnor sequence for towers of complexes*; EnhancedDerivedSheaves §§0.1–0.3
`ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`,
`ClassicalDerived.inverseLimits`; EnhancedDerivedSheaves §E1.4 `enhancedPullback`,
`enhancedPushforward`.

Prove the following named laws.

- `schemeDeRhamAffine`: on `Spec B`, `RΓ(Q_m) ≃ dR_(B/A)/Fil_H^m` for every `m`; their limit is
  `dR^hc_(B/A)`.
- `schemeDeRhamGraded`: for Hodge-completed global de Rham, `gr_H^i ≃ RΓ(X, L∧^i L_(X/A))[−i]`.
- `schemeDeRhamPullback`: a morphism `g : X′ → X` over the base induces
  `Lg^* Q_m(X) → Q_m(X′)` in the base-linear sheaf categories and hence pullback on hypercohomology,
  preserving cup products and the Hodge filtration; identities, composition and restriction to opens
  agree with the affine maps. No equivalence under arbitrary pullback is asserted.
- `schemeDeRhamRealization`: realization of strict filtered sheaf models sends levelwise
  quasi-isomorphisms to isomorphisms. Sheaf tensor of K-flat representatives computes tensor derived
  over the coefficient sheaf; affine tensor over `A` uses the K-flat models of 2.22. For each `m`,
  the Čech totalization of affine values identifies with `RΓ(X_Zar, Q_m)` in `D(A)`, naturally for
  restriction, refinement and pullback. The comparisons commute with `Q_(m+1) → Q_m` and with
  filtration cofibres. Taking the derived Hodge limit yields the completed comparison, since derived
  global sections commute with derived limits; this does not exchange inversion or tensor with limits.
- `schemeDeRhamCup`: the Alexander–Whitney product gives
  `Fil_H^i ⊗^L_A Fil_H^j → Fil_H^(i+j)` as the components of the product in `DF(A)`. It agrees with
  the ringed-site cup product on the base-linear sheaf realization followed by sheaf multiplication.
  These products are associative, unital and graded-commutative in `D(A)`, compatible with restriction,
  refinement, pullback and finite Hodge quotients. Their compatible Hodge limits give the completed
  filtered product of 1.17. On `Spec B` they agree with the shuffle product of 2.22. For smooth `X`,
  under 3.13, they agree with the cup product on `RΓ(X_Zar, Ω^•_(X/A))` followed by wedge.
- `formalDeRhamLimit`: the p-completed formal object is the derived inverse limit of its finite
  reductions under the stated descent and bounded-torsion hypotheses.

**Checks.**

- `test_scheme_derham_affine_base`: for `X = Spec A` over `A` the object is `A`, with no positive Hodge
  pieces.
- `test_scheme_derham_base_linear`: for a nonzero ring `A` and `B = A[t]`, `Q_2` has model
  `B --d--> B dt`, with `d(t·1) = dt ≠ 0 = t·d(1)`. Thus its differential cannot be a morphism in
  `ModuleCat B` or in sheaves of `O_X`-modules. Restriction to the
  overlap `D(t)` gives the same calculation; the affine comparison and its refinement maps use
  base-linear morphisms.
- `test_scheme_derham_affine_line`: for `X = Spec F_p[t]`, `H¹` of ordinary smooth de Rham cohomology is
  `F_p[t^p]·t^(p−1) dt`.
- `test_scheme_derham_product_boundary`: for `X = Spec F_p[t]`, ordinary and derived de Rham agree by the
  smooth comparison, and `H⁰_dR(X/F_p) = F_p[t^p]`, of infinite dimension over `F_p`. Thus a smooth
  finite-dimensional affine scheme need not have finite-projective global de Rham cohomology over its
  base; properness is essential to the perfectness theorem for proper smooth schemes ([Bhatt12],
  Corollary 3.10, p.8; differentiate `t^n` explicitly).

### 5.8.1 Raw lci derived de Rham on schemes

**Raw lci sheaves and realization.** Fix a prime `p` and `n ≥ 1`. Let `f : X → S` be an lci
morphism of flat `ℤ/p^n`-schemes, with lci meaning locally finitely presented and locally a regular
immersion into a smooth scheme. The relative map need not be flat. Construct
`DerivedDeRham.rawLciDeRhamSheaves` in `D(X_Zar, f⁻¹O_S)`, with its uncompleted Hodge filtration,
by gluing the raw direct-sum polynomial-resolution models. Its derived global sections over
`S = Spec A` lie in `D(A)`. Construct this locally on quasi-compact quasi-separated opens and
glue to arbitrary `X` by Zariski descent. There is a canonical filtered map to the Hodge-completed
sheaf object of §5.8, agreeing with completion on each affine chart.

Prove the following laws in this range.

- `rawLciDeRhamAffine`: for `U = Spec B ⊆ X` over `V = Spec A ⊆ S`, derived sections on `U`
  recover raw `dR_(B/A)`, with its filtration, not its Hodge completion.
- `rawLciDeRhamLocalization`: restriction to `D(b) ⊆ Spec B` is the canonical map
  `dR_(B/A) → dR_(B[1/b]/A)`. Modulo `p` it is localization of the levelwise Frobenius-twisted
  polynomial model of §§3.2–3.5; retain the derived twist when it is nondiscrete. Finite
  p-dévissage gives the restriction law for `ℤ/p^n`. These maps satisfy Zariski descent and
  agree under restriction of affine base charts.
- `rawLciDeRhamRealization`: the Čech totalizations for finite Zariski covers of a
  quasi-compact quasi-separated open, resolving their intersections by affine opens, recover
  its derived sections. Affine refinements induce canonical isomorphisms in the base-linear
  derived category, independent of the refinement map and compatible with composition.
  The strict-model realization and the ringed-site realization of §5.8 agree for these raw
  objects, their Hodge stages, finite quotients and filtration cofibres.
- `rawLciDeRhamCup`: affine shuffle multiplication induces the ringed-site cup product,
  with `F_H^i ⊗^L F_H^j → F_H^(i+j)` over the base coefficient sheaf. It is unital,
  associative and graded-commutative in the derived category, and compatible with restriction,
  refinement, pullback within the stated range and the map to Hodge completion.

For localization and descent modulo `p`, use the conjugate stages and their cotangent-power
graded pieces. On a chart factoring through a smooth algebra with a regular sequence of length
`c`, the twisted graded pieces `((L∧^i L_(B/A))[−i]) ⊗^L_(A,Frob_A) A` have a common lower
cohomological bound `−c`: before twisting the shifted lci powers have terms in `[0,i]`, and
`B` has Tor amplitude in `[−c,0]` over `A`. On a finite affine cover choose a common bound.
The quasi-coherent twisted graded pieces satisfy affine Zariski descent; the same bound controls
the exhaustive conjugate colimit and its Čech realization. Apply finite p-dévissage using
flatness of both coefficient schemes over `ℤ/p^n`. No relative `qSyn_A` membership or arbitrary
faithfully flat totalization is used. The Hodge-stage assertions follow from their triangles
with finite Hodge quotients.

*Source:* [Bhatt12], Proposition 3.5 and Corollary 3.14, pp.7–9 (Cartier and localization),
Theorem 3.27, Lemma 3.29 and Remark 3.33, pp.13–15 (the lci range and raw boundary);
[StacksCoh] §20.25, Tag 01FP (Čech realization and refinement).
*Needs:* §§2.22–2.24, 3.2–3.5 and §5.8 base-linear realization and cup products;
DerivedModuleAlgebra §§0.9–0.14, 0.17 (derived twists, localization, regular quotients and powers);
SchemeAndStackFoundations §§2.5, 2.18; EnhancedDerivedSheaves §§0.1–0.3, E1.4.

**Checks.**

- `test_raw_lci_hodge_completion`: for `A = F_p[t] → B = F_p`, `t ↦ 0`, raw `dR` is
  `⊕_(j≥0) F_p·γ_j(t)`, whereas Hodge completion is `∏_(j≥0) F_p·γ_j(t)`. The series with every
  coefficient equal to 1 is outside the image of completion. Derived p-completion
  leaves both characteristic-p objects unchanged.
- `test_raw_lci_refinement`: over `A = F_p[t]`, take `B = F_p[s]` with `t ↦ 0`. The cover
  `D(s), D(1−s)` and its refinement `D(s²), D(s(1−s)), D((1−s)²)` give the same raw Čech
  realization. On their overlaps the comparison is the canonical localization of the twisted
  model, preserves `γ_j(t)` and the product, and commutes with the map to the Hodge limit.
- `test_raw_lci_nonflat`: `F_p[t] → F_p[t]/(t²)` lies in this interface although the relative
  map is nonflat and the target is singular. Both coefficient rings are flat over `F_p`.

### 5.11 The period setup

Let `k` be a perfect field of characteristic `p`, `W = W(k)`, `K` a finite extension of `W[1/p]`, `K̄` an
algebraic closure, and `C` the completion of `K̄`; `C` is a complete algebraically closed nonarchimedean
field, hence perfectoid (PerfectoidSpaces §§P1.10–P1.11 for perfectoid fields and §P3.7
`isPerfectoidField_of_isAlgClosed`), and `O_C` is p-adically complete with `p` not a
unit. `G_K = Field.absoluteGaloisGroup K` acts on `K̄`, on `O_K̄` and, by continuity, on `O_C` through ring
automorphisms; all Galois actions below are the functoriality of the constructions in these ring
automorphisms. Put `A_inf = 𝕎(O_C♭)` with `O_C♭ = PreTilt O_C p` and `θ = WittVector.fontaineTheta O_C p`
(Mathlib); `θ` is surjective (`surjective_fontaineTheta`) and `ker θ` is generated by a primitive
nonzerodivisor `ξ` (PerfectoidSpaces §P1.18). Use §PD.7
`Crystalline.fontaineEnvelope_periodPDEnvelope` to identify the general `A_cris(O_C)` with
PadicPeriodRings §3's principal envelope, presentation and p-adic completion, with the same `θ_cris`.
Put `B_dR⁺ = BDeRhamPlus O_C p`, `B_dR = BDeRham O_C p` (Mathlib). Define
`Z_p(1) = {ε ∈ O_C♭ : ε^♯ = 1}`, `DerivedDeRham.compatibleRootsOfUnity`, the kernel of the untilt
`PreTilt.untilt : O_C♭ →* O_C`, written multiplicatively (multiplication in `O_C♭`, with Lean carrier
a `Submonoid`); it is the group of compatible systems `(ε_n)` of `p^n`-th roots of unity in `O_C`.
With scalar action `a • ε = ε^a` for `a ∈ ℤ_p`, it is a free `ℤ_p`-module of rank one on which `G_K`
acts through the cyclotomic character. For `ε ∈ Z_p(1)`, `θ([ε]) = ε^♯ = 1`
(`WittVector.fontaineTheta_teichmuller`), so
`[ε] − 1 ∈ ker θ`. Use PadicPeriodRings §3's convergent logarithm
`log([ε]) = Σ_(n≥1) (−1)^(n−1)(n−1)! γ_n([ε] − 1)` in this shared `A_cris` carrier.

For finite `K/ℚ_p`, use PadicPeriodRings §1.1 `padicComplexGaloisAction` and
PadicPeriodRings §1.5 *The de Rham period rings* contract. For arbitrary perfect `k`, use the same interfaces in the
stated `W(k)[1/p]` setup through PadicPeriodRings
§2 `PadicFieldCompletion` and §4.1 `generalBasePeriodRings`: identify the completion, its valuation
ring and Galois action with the `C` and `O_C` above, and compare the supplied period carriers with
Mathlib's via functorial tilting, Witt vectors and the completion universal properties.

[Bhatt12], Notation 9.1 and Propositions 9.3(1)–(4), pp.33–34; [Bhatt12], Proposition 9.16(1), p.37.

*Needs:* Mathlib `PreTilt`, `PreTilt.untilt`, `WittVector`, `WittVector.fontaineTheta`,
`WittVector.fontaineTheta_teichmuller`, `surjective_fontaineTheta`, `BDeRhamPlus`, `BDeRham`,
`Field.absoluteGaloisGroup`; PerfectoidSpaces §§P1.10–P1.11, P1.18 and §P3.7
`isPerfectoidField_of_isAlgClosed`; §PD.7 here;
PadicPeriodRings §1.1 `padicComplexGaloisAction` and §1.5 *The de Rham period rings*;
PadicPeriodRings §2 `PadicFieldCompletion`, §3 `periodPDEnvelope` (presentation, completion,
`θ_cris` and logarithm), §4.1
`generalBasePeriodRings`.

**Checks.**

- `test_period_roots_identity`: the identity system `1 ∈ Z_p(1)` and `log([1]) = 0`.
- `test_period_roots_kernel`: for every `ε ∈ Z_p(1)`, `[ε] − 1 ∈ ker θ`; for an element `x ∈ O_C♭` with
  `x^♯ ≠ 1`, `x ∉ Z_p(1)` and `[x] − 1 ∉ ker θ`, so the logarithm is not assigned.
- `test_period_roots_closure`: multiplication, inversion and natural powers of compatible root
  systems stay in `Z_p(1)`; the unit-system inverse and the natural-power rule hold in the Lean
  carrier for any p-adically complete `O` with `p` not a unit.
- `test_period_roots_cp`: for `K = ℚ_p` and `C = ℂ_p` (Mathlib `PadicComplex p`), a compatible system with
  `ε_1` a primitive `p`-th root of unity generates `Z_p(1)`.

### 5.12 The derived de Rham description of A_cris

In the period setup, `Λ_p dR_(O_K̄/W) ≃ Λ_p dR_(O_C/W) ≃ Λ_p dR_(O_C/A_inf) ≃ A_cris`. The Hodge
filtration is the completed PD filtration, the map `A_inf → A_cris` is the PD structure map, and the
equivalence preserves Frobenius and the `G_K` action. Construct the restricted period theorem
`DerivedDeRham.periodRegularEnvelopeComparison` for the principal nonzerodivisor `ξ`:
`Λ_p dR_(O_C/A_inf) ≃ D̂_(A_inf)((ξ))`, filtered by completed divided powers, compatible with
Frobenius, the structure map and the `G_K` action. The PD envelope and its completion are those
of §PD.6 over the trivial PD ideal, identified by §PD.7(b) and
`Crystalline.fontaineEnvelope_periodPDEnvelope` with PadicPeriodRings §3's envelope and completion.
For this principal period theorem, reduce modulo `p^n`; both `A_inf/p^n` and `O_C/p^n` are flat
over `ℤ/p^n`, and `ξ` remains regular. Base change the one-variable polynomial-resolution
calculation of [Bhatt12] Lemma 3.29 and Corollary 3.40 to obtain the regular-envelope map and
its filtered equivalence at each level, using their polynomial/PD calculations directly.
Pass to the derived p-limit using p-torsion-freeness of the envelope. Through
`Crystalline.fontaineEnvelope_periodPDEnvelope`, transport the Witt Frobenius supplied by
PadicPeriodRings §4.1 to the period derived object, with its semilinearity over `W`.
Naturality gives the Galois compatibility.
This owns only the principal period specialization; the general crystalline comparison remains
in CrystallineCohomology.

Prove `L̂_(A_inf/W) = 0` by the relatively perfect mod-p calculation ([Bhatt12] Proposition
9.3(2)); transitivity and §2.28 identify `Λ_p dR_(O_C/W)` with `Λ_p dR_(O_C/A_inf)`.
The period regular-envelope equivalence then identifies this with PadicPeriodRings §3's
`A_cris(O_C)` and its supplied presentation and `θ_cris` through
§PD.7 `Crystalline.fontaineEnvelope_periodPDEnvelope`.
The integral perfectoid generalization retains
p-torsion-freeness, relative perfectness mod p and the same filtered regular-envelope hypothesis
([Bhatt12] Remarks 9.6 and 9.10 take p-adically complete flat `O_C`-algebras).
A perfect `F_p`-algebra `R` has `θ`-kernel `(p)` and is excluded from this period assertion.
Its separate PD calculation is `A_cris(R) = W(R)` by §PD.7 and the divided powers of `p`.
Given the derived-Witt identification of CrystallineCohomology §CR.DDR.4.5, this also equals
`LWΩ_R`; this conditional identification makes no assertion about `Λ_p dR_(R/W(k))`.

[Bhatt12], Proposition 9.3(2)–(5), Remark 9.6, Definition 9.7, Proposition 9.9, Remark 9.10, pp.34–35;
Lemma 3.29 and Corollary 3.40, pp.13–17; Lemma 8.3 and Corollary 8.6, pp.31–32.

*Needs:* Layer 5: The period setup; Layer 4: The torsion boundary for F_p over Z_p;
DerivedModuleAlgebra §§0.13, 0.8, 1.1–1.5; Layer 2: p-completed derived de Rham; Layer 2: Derived de
Rham transitivity filtrations; §§PD.6–PD.7 here. The principal period regular-envelope
equivalence uses PadicPeriodRings §3's ordinary envelope, presentation, completion and `θ_cris`,
and §4.1's Frobenius and actions; its generalization retains the stated regular-envelope hypothesis.

Lean: `DerivedDeRham.acrisDerivedDescription`.

**Checks.**

- `test_acris_perfect`: for `R = k = F_p` in place of `O_C`, `A_cris(F_p) = ℤ_p`, but
  `Λ_p dR_(F_p/ℤ_p)` is `ℤ_p` plus the nonzero completed torsion summand of 4.6. The derived description
  does not extend to perfect `F_p`-algebras, which are not p-torsion-free; the flat-reduction hypothesis in CrystallineCohomology §CR.DDR.5.10 fails because
  `F_p ⊗^L_ℤ ℤ/p^n` is not a flat `ℤ/p^n`-algebra.
- `test_acris_theta`: the composite `A_inf → Λ_p dR_(O_C/W) → O_C` (the Hodge quotient) is `θ`.
- `test_acris_not_zp`: `ℤ_p` alone cannot replace `O_C`: `ℤ_p` is not integral perfectoid and
  `Λ_p dR_(ℤ_p/ℤ_p) = ℤ_p` has no divided powers of a generator of `ker θ`.

### 5.13 Hodge completion and B_dR⁺

In the period setup, the rational Hodge completion of the p-completed derived de Rham period object,
`Rlim_i(((Λ_p dR_(O_K̄/W))/Fil_H^i)[1/p])`, identifies with `B_dR⁺ = BDeRhamPlus O_C p`, the
`ker(θ)[1/p]`-adic completion of `A_inf[1/p]`. Inversion of `p` is taken inside each Hodge quotient; it is
not identified with inversion outside the limit. Here `A_cris` and `θ_cris` are PadicPeriodRings
§3's completed envelope and map, identified by §PD.7. The composite `A_cris → B_dR⁺` of 5.12 with this
identification is the natural map; it preserves the filtrations and the `G_K` action, and `B_dR` is
`BDeRham O_C p`.

Prove `DerivedDeRham.periodMapComparison`: writing `ι` for the completed isomorphism
`Crystalline.fontaineEnvelope_periodPDEnvelope` and `j_ord` for PadicPeriodRings §4.1's map,
the derived/Hodge map is `j_ord ∘ ι` in the same Mathlib `BDeRhamPlus O_C p` carrier. On the
uncompleted PD subalgebra both maps send `γ_n(ξ)` to `ξ^n/n!`. Their maps to each Hodge quotient
are p-adically continuous, so equality extends through p-completion and the Hodge limit.
The square commutes with `θ` on plus carriers, with the `G_K` action and functorial valued
embeddings of the period data, and with the Hodge/PD filtrations. The source identification
intertwines Witt Frobenius; the equality of maps also holds after precomposing with that
Frobenius. These statements require no Frobenius endomorphism of `B_dR⁺`.

[Bhatt12], Proposition 9.9 and Remark 9.17, pp.35, 38; [Fon94], §§2.3.1–2.3.4 and §4.1,
pp.78–79, 83–84.

*Needs:* Layer 5: The derived de Rham description of A_cris; Layer 2: Hodge-completed derived de
Rham; Layer 1: Valid exchanges of completion and derived operations; Layer 1: Completion of a
filtered object; Mathlib `BDeRhamPlus`, `BDeRham`, `fontaineThetaInvertP`; DerivedModuleAlgebra §1.1
Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of
complexes*; §PD.7 `Crystalline.fontaineEnvelope_periodPDEnvelope`; PadicPeriodRings §§3, 4.1
(`periodPDEnvelope`, `generalBasePeriodRings`, including the ordinary period map).

Lean: `DerivedDeRham.rationalHodgePeriodComparison`.

**Checks.**

- `test_bdr_quotient_one`: the first Hodge quotient gives `B_dR⁺/ker θ = C`.
- `test_bdr_p_inverted_inside` of 1.15 compares the two orders for the tower `ℤ_p[t]/(t^n)`;
  `Σ_(n≥0) p^(−n)t^n` separates their limits. This tests the filtered-limit operation, not the period
  comparison. The identity `ℚ_p → ℚ_p` tests only the distinction between p-completion and Hodge
  completion (`test_p_derham_inverted`, 2.26): these give zero and `ℚ_p`, respectively.
- `test_bdr_theta_compatible`: the composite `A_inf → A_cris → B_dR⁺ → B_dR⁺/Fil¹` is `θ` followed by
  the inclusion `O_C ⊂ C`.
- `test_period_map_dp`: after the carrier identification, both period maps send `γ_n(ξ)` to
  `ξ^n/n!` and the convergent `log[ε]` to the same `t`, including `p = 2`.
- `test_period_map_generator`: replacing `ξ` by a unit multiple leaves the commuting square
  unchanged; precomposing either route with Witt Frobenius gives equal maps as well.

### 5.14 The structure of B_dR⁺ and the filtered embedding of A_cris

In the period setup, `B_dR⁺` is a complete discrete valuation ring with uniformizer `ξ` and residue field
`C`, `θ` extends to `θ : B_dR⁺ → C`, and its filtration by powers of `ker θ` has
`gr^k B_dR⁺ ≅ C(k) = C ⊗_(ℤ_p) Z_p(1)^(⊗k)` for `k ≥ 0`, `G_K`-equivariantly, with `t = log([ε])` a
generator of `Fil¹/Fil²` for a generator `ε` of `Z_p(1)`. The filtered map `A_cris → B_dR⁺` of 5.13 is
injective by the convergent divided-power expansions of [Fon94], §§4.1.2–4.1.3, p.83.
Consequently the Hodge (PD) filtration of `A_cris` is separated: its `Filⁿ` maps into
`Filⁿ B_dR⁺`, whose intersection is zero. Mathlib's `BDeRhamPlus` provides the ring. For finite `K/ℚ_p`, use
PadicPeriodRings §1.5 *The de Rham period rings* for its DVR, residue, Galois action and
graded-twist structure. For arbitrary perfect `k`, use PadicPeriodRings
§4.1 `generalBasePeriodRings`. Here `bdrPlusStructure` identifies these supplied structures with
the Mathlib carriers in §5.11 and uses `periodMapComparison` of §5.13 to identify the filtered
embedding with PadicPeriodRings §4.1's injective map from §3's completed envelope.

[Fon94], §§4.1.1–4.1.3, p.83 (expansions and injectivity); [Bhatt12], Remark 9.17, p.38;
Mathlib `Mathlib/RingTheory/Perfectoid/BDeRham.lean`.

*Needs:* Layer 5: The period setup; Layer 5: Hodge completion and B_dR⁺; PerfectoidSpaces §P1.18;
§PD.7 here; PadicPeriodRings §3 (completed envelope and `θ_cris`), §1.5 *The de Rham period rings*;
PadicPeriodRings §4.1 `generalBasePeriodRings`.

Lean: `DerivedDeRham.bdrPlusStructure`.

**Checks.**

- `test_bdr_dvr_residue`: the residue field `B_dR⁺/(ξ)` is `C`.
- `test_bdr_graded_twist`: `σ ∈ G_K` acts on `gr¹ = C·t` by `σ(t) = χ(σ) t`, with `χ` the cyclotomic
  character, so `gr¹ ≅ C(1)` and not `C`.
- `test_bdr_acris_injective`: the image of `γ_n(ξ)` in `B_dR⁺` is `ξ^n/n! ≠ 0`; an element of
  every `Filⁿ A_cris` has zero image in the separated DVR and hence is zero.

### 5.15 Galois invariants of Tate twists

In the period setup, `H⁰(G_K, C(k)) = 0` for `k ≠ 0` and `H⁰(G_K, C) = K̂`; consequently
`H⁰(G_K, Fil^k B_dR⁺) = 0` for `k > 0`, by completeness of the filtration and `gr^k ≅ C(k)`. In particular
a `G_K`-equivariant map `Z_p(1) → Fil² A_cris` is zero, because its composite with the injection of 5.14
lands in `H⁰(G_K, Fil² B_dR⁺(−1)) = 0`.

For finite `K/ℚ_p`, use PadicPeriodRings §§1.2, 1.4 `padicComplex_fixed_eq` and
`tate_H0_padicComplex_twist`; for the arbitrary perfect residue field of §5.11, use
PadicPeriodRings §2 `tateSen_H0`. Here `tateTwistInvariants`
identifies the supplied invariant calculation on the period carriers of §5.11 and deduces the
positive-filtration and `Fil² A_cris` vanishings through the derived/PD-filtered comparison with
PadicPeriodRings §3's completed envelope and §4.1's equivariant period map.

[Tat67], §3.3, Theorems 1–2, p.176, with Theorem 2 applied to nonzero integral powers of the
cyclotomic character; [Bhatt12], Remark 9.17, p.38, for the consequence on `B_dR`.

*Needs:* Layer 5: The structure of B_dR⁺ and the filtered embedding of A_cris; Layer 5: The period setup;
PadicPeriodRings §§1.2, 1.4 `padicComplex_fixed_eq`, `tate_H0_padicComplex_twist`;
PadicPeriodRings §2 `tateSen_H0`.

Lean: `DerivedDeRham.tateTwistInvariants`.

**Checks.**

- `test_tate_invariants_zero_twist`: `H⁰(G_K, C) = K̂`, nonzero.
- `test_tate_invariants_one`: `H⁰(G_K, C(1)) = 0`.
- `test_tate_invariants_fil`: `H⁰(G_K, Fil¹ B_dR⁺) = 0` although `Fil¹ B_dR⁺ ≠ 0`.

### 5.16 Relative Tor-amplitude estimates

For a quasisyntomic `R`-algebra `A`, `Λ_p L_(A/R)` has p-complete Tor amplitude `[−1, 0]`; thus
`Λ_p L∧^i L_(A/R)` has amplitude `[−i, 0]`, its Hodge/conjugate shift `[−i]` has `[0, i]` before the
additional derived `ℤ/p` tensor bound, and each finite quotient has a specified finite amplitude bound.
For a quasismooth map the completed `L` is a p-completely flat module in degree zero; ordinary flatness
requires an additional criterion, such as the Noetherian criterion 1.10. For relative `QRSP` algebras
over `R ∈ QSyn`, the shifted cotangent and divided-power terms are complete-flat in degree zero. These are Tor-amplitude
assertions, not finite-projectivity assertions.

[BMS19], Lemma 4.7, Lemma 4.34 and Lemma 5.14(1), pp.222, 231, 241.

*Needs:* Layer 1: The quasisyntomic cotangent condition; DerivedModuleAlgebra §0.14 Derived exterior
powers; DerivedModuleAlgebra §0.16 Derived divided powers; Layer 5: Quasiregular semiperfectoid
rings; Layer 5: The quasisyntomic sites; DerivedModuleAlgebra §1.7 Complete flatness and complete
faithful flatness.

Lean: `DerivedDeRham.relativeTorAmplitude`.

**Checks.**

- `test_tor_amplitude_weight_zero`: weight 0 has amplitude `[0, 0]`.
- `test_tor_amplitude_shift`: `L` of amplitude `[−1, 0]` gives `L∧^i` in `[−i, 0]` and, after `[−i]`,
  `[0, i]`.
- `test_tor_amplitude_reduction`: an additional derived reduction modulo `p` may contribute one more
  degree.

### 5.17 Descent of p-completed uncompleted de Rham

For a fixed `R ∈ QSyn`, `Λ_p dR_(−/R)` satisfies descent on the relative site `qSyn_R`. If `R = ℤ_p` or `R`
is integral perfectoid, it also satisfies descent on the big slice `QSyn_R`. Modulo `p`, its increasing
exhaustive conjugate filtration has stages uniformly in `D^(≥−1)` on these sites; hence filtered colimits
commute with the Čech totalization in the bounded-below range. The same conclusion holds in [BL22]
Variant E.17's p-quasisyntomic range. The uniform bound and relative-site restriction are explicit.

[BMS19], Example 5.12 and Lemma 4.34, pp.231, 240; [BL22], Variant E.17 with proof, p.236.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Descent of raw and completed cotangent powers; Layer 3: The
conjugate filtration; Layer 3: Derived Cartier graded pieces; Layer 3: The conjugate spectral sequence
and convergence; Layer 1: Valid exchanges of completion and derived operations; Layer 5: Relative
Tor-amplitude estimates; PerfectoidSpaces §P1.24.

Lean: `DerivedDeRham.uncompletedPDeRhamDescent`.

**Checks.**

- `test_uncompleted_descent_identity`: descent along the identity is immediate.
- `test_uncompleted_descent_qrsp`: `QRSP` Čech terms have degree-zero conjugate graded pieces (5.16), so
  the bounded-below hypothesis holds.
- `test_uncompleted_descent_non_qsyn`: the non-lci `F_p[x,y]/(x,y)²` is excluded from the
  quasisyntomic site by the cotangent amplitude calculation of 3.11 and
  `test_qsyn_site_nonlci` (5.1). Its `H^−1(dR) ≠ 0` separately excludes nonnegative
  cohomological concentration; that single group does not establish failure of a uniform lower
  bound for conjugate stages or a Čech diagram.

*Quasiregular semiperfect Witt and PD structure.*

### 5.19 A_crys of perfect-ring quotients by Teichmüller regular sequences

Let `P` be a perfect `F_p`-algebra and `R = P/(x_i)_(i∈I)` the quotient by elements whose Teichmüller
lifts `[x_i]` form, together with `p`, a regular sequence in `W(P)` for every finite subset of `I` (for
example `P = S♭[X_i^(1/p^∞)]` with `X_i ↦ X_i`). Then `A_crys(R)`, the p-completed PD envelope of
`W(P) → R` (§§PD.6–PD.7 here), is p-torsion-free, and `R` has a PD thickening by it.
Proof: reduce to finitely many variables `x_1, …, x_n` by filtered colimits, which preserve
p-torsion-freeness. The images `x_i` of `[x_i]` in `W(P)/p = P` form a regular sequence, so the envelope
relative to `(W(P), (p), γ)` is `D = W(P)⟨T_i⟩/(T_i − [x_i])` (envelopes of regular immersions (0),
§PD.6 here). Let `K` be the Koszul complex of the `T_i − [x_i]` on the free
`W(P)`-module `W(P)⟨T_i⟩`, so `H₀(K) = D`. Then `K/p` is the Koszul complex of the `T_i − x_i` on
`P⟨T_i⟩`. Each `x_i` is a nonzerodivisor on `P`, so this is a regular sequence (§PD.6 (1)(d)), and
`H₁(K/p) = 0`. The sequence `H₁(K/p) → H₀(K) --p→ H₀(K)` then shows that `D` is p-torsion-free, and so is
its p-completion. No flatness over `W(P)` is used, and none holds: the pieces `W(P)⟨T⟩/(T − [x])` are
not `W(P)`-flat (`test_acrys_tf_not_witt_flat`). For one variable [SW13] gives a direct divisibility
argument (`p a_n = X b_n − n T b_(n−1)`, inductively `b_n ∈ pW`).

[SW13], proof of Lemma 4.1.8, pp.32–33 (the one-variable case `F_p[X^(1/p^∞)]/(X)`), with Remark 4.1.10
and Proposition 4.1.11 (the statement for a regular sequence in a perfect ring), p.33; [BMS19], proof of
Proposition 8.12, p.273.

*Needs:* §§PD.6–PD.7 here; DerivedModuleAlgebra §0.K.1 (Koszul complexes); DerivedModuleAlgebra §1.1
Derived limits of towers; DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of
complexes*; Mathlib `WittVector`, `WittVector.teichmuller`.

Lean: `DerivedDeRham.acrysTeichmullerTorsionFree`.

**Checks.**

- `test_acrys_tf_perfect`: for `I = ∅`, `A_crys(P) = W(P)`, p-torsion-free.
- `test_acrys_tf_one_variable`: for `R = F_p[X^(1/p^∞)]/(X)`, `A_crys(R)` is the p-completion of
  `W(R♭)[[X]^n/n!]` inside `W(R♭)[1/p]`, p-torsion-free.
- `test_acrys_tf_two_variables`: for `R = F_p[X^(1/p^∞), Y^(1/p^∞)]/(X, Y)`, `A_crys(R)` is the completed
  tensor product over `ℤ_p` of two one-variable copies, and is p-torsion-free.
- `test_acrys_tf_not_witt_flat`: for `P = F_p[x^(1/p^∞)]` and the envelope `D` of `W(P) → P/(x)`,
  `[x]^p = p! γ_p([x])`, so the nonzero element `x^p ∈ P` acts by zero on `D/p`. `D/p ≠ 0`, since it maps
  onto `P/(x)`, and `P` is a domain, so `D/p` is not `P`-flat and `D` is not `W(P)`-flat. p-torsion-freeness
  is a `ℤ_p`-flatness statement and cannot be derived from flatness over `W(P)`.

### 5.23 Proper smooth de Rham perfectness

Let `A` be p-complete with bounded p-torsion and `X` a proper p-completely smooth formal `A`-scheme of
finite presentation, with compatible proper smooth ordinary reductions `X_n/A_n` of bounded relative
dimension `d`. Then the p-completed continuous de Rham global object is a perfect derived p-complete
`A`-complex. Each `RΓ(X_n, Ω^i_(X_n/A_n))` is perfect and commutes with arbitrary base change by
EnhancedDerivedSheaves §E1.9 `perfect_proper_pushforward` (`Ω^i_(X_n/A_n)` is finite
locally free on `X_n`, hence finitely presented and flat over `A_n`; [StacksPerfect] Lemma 36.30.4(2),
Tag 0B91). Its Hodge quotient is a finite extension of these pieces, and `Ω^i = 0` for `i > d`; the
compatible perfect complexes over `A/p^n` assemble into a perfect p-complete complex by 1.13. No
degeneration or finite-projective individual `H^j` is asserted. The same finite-filtration argument
applies to an ordinary proper smooth finite-presentation `A`-scheme with its smooth ordinary or
Hodge-completed comparison in the appropriate characteristic.

[StacksPerfect], §36.30, Lemmas 36.30.1 and 36.30.4 with proof; Tags 0A1H, 0B91, pp.73–74; [StacksMA]
Lemma 15.99.4, Tag 09AW, p.288.

*Needs:* Layer 2: The de Rham algebra of a completely smooth formal algebra; Layer 3: Smooth ordinary and
completed de Rham comparisons; Layer 5: Derived de Rham on schemes and formal schemes; Layer 5: Relative
Tor-amplitude estimates; Layer 5: Descent of Hodge quotients and completion; Layer 1: Valid exchanges of
completion and derived operations; Layer 1: Effectivity of compatible perfect systems;
EnhancedDerivedSheaves §E1.9; SchemeAndStackFoundations §2.18, §4.7; Mathlib
`AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Smooth`.

Lean: `DerivedDeRham.properSmoothCohomologicalControl`.

**Checks.**

- `test_proper_perfect_point`: `Spec A` has dimension 0 and value `A`.
- `test_proper_perfect_line`: `ℙ¹_A` has de Rham cohomology `A` in degrees 0 and 2, perfect.
- `test_proper_perfect_nonproper`: `Spec F_p[t]` is smooth and finite-dimensional but not proper, and
  `H⁰ = F_p[t^p]` is infinite-dimensional over `F_p`; a perfect complex need not have projective
  individual cohomology either.

### 5.24 Completed base change and cup products

Under the hypotheses of 5.23, a bounded-torsion p-complete base map `A → A′` gives a natural equivalence
`RΓ_dR(X/A) ⊗̂^L_A A′ ≃ RΓ_dR(X ⊗̂_A A′/A′)`, compatibly with Hodge filtrations and the cup products of
5.8 (`schemeDeRhamCup`). All completed tensors and reductions are derived; the finite-level base change
is [StacksPerfect] Lemma 36.30.4 and the passage to the limit is 1.13. For general `QSyn` algebras the
affine base-change/Künneth and descent products are available, but neither proper global perfectness nor
a finite-projective cohomology conclusion follows.

[StacksPerfect], Tag 0A1H, Lemma 36.30.1 and Remark 36.30.2, pp.73–74; [StacksMA] Lemma 15.99.4.

*Needs:* Layer 5: Proper smooth de Rham perfectness; Layer 5: Descent of Hodge quotients and completion;
Layer 2: Derived base change and Künneth; Layer 5: Derived de Rham on schemes and formal schemes; Layer 1:
Completed filtered tensor products; Layer 1: Valid exchanges of completion and derived operations; Layer
1: Effectivity of compatible perfect systems; EnhancedDerivedSheaves §E1.9.

Lean: `DerivedDeRham.completedBaseChangeCupProducts`.

**Checks.**

- `test_base_change_identity`: identity base change is the identity.
- `test_base_change_cup_point`: for `Spec A` the cup product is multiplication.
- `test_base_change_cup_line`: on `ℙ¹` a degree-two class has square zero by dimension.

*Projective variants and formal étale realization.*

The projective site strengthens the mod-p module condition and Tor amplitude without imposing finite
generation. Formal realization uses only charts that meet the `QSyn` conditions and actual covering
families.

### 5.25 The proj-quasisyntomic variant over O_C

For `O_C` with `C` a perfectoid field of characteristic zero (PerfectoidSpaces §P1.10), a map `A → B` of
p-complete p-torsion-free `O_C`-algebras is proj-quasisyntomic if `B/p` is a projective `A/p`-module and
`L_((B/p)/(A/p))` has projective amplitude `[−1, 0]`; it is a cover if `B/p` is also faithfully flat. Form
the relative `proj-qSyn_(O_C)` and `proj-qrsPerfd_(O_C)` sites, `DerivedDeRham.projQuasisyntomicSite`.
They have completed base-change and composition stability, compatible-root basis covers and the
unfolding equivalence of 5.5. Projective amplitude is stronger than Tor amplitude and does not imply
finite generation.

[BMS19], Variant 4.36 and Footnotes 12–13, p.232.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Compatible-root quasisyntomic covers; Layer 5:
Refinement and Čech stability of QRSP covers; Layer 5: Sheaves and unfolding from the QRSP basis;
PerfectoidSpaces §P1.10, §P1.24–§P1.25.

Prove the following named laws.

- `projQSynCover`: a cover has projective faithfully flat reduction and projective cotangent amplitude
  `[−1, 0]`.
- `projQSynSmooth`: the p-completion of a smooth `O_C`-algebra is in the relative projective site.
- `projQSynRootBasis`: every such object admits a compatible-root cover by proj-QRSP objects.
- `projQSynUnfolding`: restriction to the proj-QRSP basis is inverse to unfolding.

**Checks.**

- `test_proj_qsyn_identity`: `O_C → O_C` has rank-one projective reduction and zero relative cotangent.
- `test_proj_qsyn_smooth`: `O_C⟨t⟩` has the free coordinate differential module and qualifies.
- `test_proj_qsyn_torsion`: an `O_C`-algebra with nonzero p-torsion is excluded even if its reduction
  happens to be projective.

### 5.26 From quasisyntomic sheaves to formal étale sites

For a p-complete formal scheme `X` (SchemeAndStackFoundations §4.7) with `QSyn` affine charts, a
functor `F` on `QSyn` satisfying descent defines `F_X` on the small étale site of the reduction `X₀`
(`AlgebraicGeometry.Scheme.smallEtaleTopology`) by `F_X(U) = lim_(Spf A ⊆ U) F(A)`, the limit over
affine formal opens; étale `X₀`-schemes lift uniquely to p-completely étale charts, since étale maps
have zero cotangent complex (DerivedModuleAlgebra §0.12, DerivedModuleAlgebra §0.25) and the lifts
algebraize by 1.12. Smooth and étale maps of such charts are quasisyntomic maps. A completely
faithfully flat map, or a jointly covering family with that property, supplies quasisyntomic
descent, so the local values glue; an individual open immersion is not a cover. The construction is
natural in `X` and retains the coefficient category and any complete filtration carried by `F`; the
small site is used only after chart hypotheses are checked.

[BMS19], Remark 10.4 and its construction, p.288.

*Needs:* Layer 5: The quasisyntomic sites; Layer 5: Sheaves and unfolding from the QRSP basis; Layer 5:
Descent of Hodge quotients and completion; Layer 1: Elkik algebraization of completely smooth and étale
algebras; SchemeAndStackFoundations §4.7; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

Lean: `DerivedDeRham.formalEtaleRealization`.

Prove the following named laws.

- `formalEtaleAffine`: on `Spf A` the restricted sheaf recovers `F(A)`.
- `formalEtaleCoverDescent`: an étale affine-chart cover gives the Čech descent equivalence.
- `formalEtalePullback`: compatible morphisms of formal schemes induce the sheaf pullback maps.
- `formalEtaleFiltered`: for complete filtered targets, evaluation and graded pieces commute with the
  chart-limit construction.

**Checks.**

- `test_formal_etale_affine`: for `X = Spf ℤ_p` and its identity chart, the value is `F(ℤ_p)`.
- `test_formal_etale_smooth_chart`: smooth p-complete polynomial charts over an integral perfectoid base
  satisfy the `QSyn` hypothesis.
- `test_formal_etale_bad_chart`: a chart with unbounded p-torsion is not accepted as a `QSyn` chart.

### Examples

`ℤ_p` and `F_p` are `QSyn` objects, but `ℤ_p → F_p` fails complete flatness. `ℤ_p` has semiperfect
reduction but no integral perfectoid source, so it is not `QRSP`. The free root tower and its first
finite stage distinguish genuine semiperfectness from adjoining one root. The affine line over `F_p` has
`H⁰ = F_p[t^p]`, illustrating why descent alone supplies no global finiteness. For the identity
compatible system of roots of unity, `[1] − 1 = 0` and its logarithm vanishes.

### Dependencies

DerivedModuleAlgebra §§0.4–0.17, 1.1–1.9 supplies cotangent powers, completion and complete
flatness. Layers 0–4 here supply local criteria, de Rham, Cartier theory and PD filtrations.
PerfectoidSpaces supplies integral perfectoid rings, perfectoid fields and the principal `θ`-kernel;
Layer PD supplies PD envelopes and `A_cris(R)` for general rings; PadicPeriodRings §§1.1–1.5, 2, 3,
4.1 supplies the `O_C` envelope, period structures and Tate invariants;
SchemeAndStackFoundations supplies formal spectra, quasi-coherent
derived categories and Néron–Popescu desingularization; EnhancedDerivedSheaves §E1.9 supplies
perfectness and arbitrary base change of proper pushforward; Mathlib supplies `WittVector`,
`PreTilt`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `BDeRham` and étale sites.

## Layer 6: Logarithmic period classes

The shared logarithmic constructor prefix and its period specialization have their single owner
here. CrystallineCohomology develops its general logarithmic applications on these same public
objects and maps. The period adapter constructs the canonical comparison data; the final
identification also has a conditional form for logarithmic models carrying those data.

### 6.20 The canonical logarithmic period adapter

**Shared free-prelog and cotangent constructors.** For a prelog ring `(A, M)`, meaning a
commutative ring and a commutative monoid with a monoid map `α : M → (A, ·)`, construct the
free prelog `(A, M)`-algebra on ordinary generators `T` and log generators `S` as
`(A[T, S], M ⊕ ℕ^(S))`, with each log generator sent to its corresponding ring variable.
The free/forgetful adjunction on pairs of sets gives the canonical augmented simplicial
resolution of any prelog map `(A, M) → (B, N)`. Use cofibrant free resolutions for simplicial
inputs and homotopy pushouts, with their derived ring and monoid components.

This roadmap exports the following public constructors and laws in `DerivedDeRham`.

- `freePrelogResolutions`, `freePrelogUniversal`, `prelogResolutionAugmentation` and
  `prelogResolutionComparison`: the free universal property, the canonical resolution with
  surjective augmentation on rings and monoids, and comparison of projective resolutions
  by homotopy equivalences. Realized cotangent and de Rham models carry the induced natural
  comparisons, compatible with their maps and filtrations.
- `prelogHomotopyPushout`: compatible free resolutions compute the homotopy pushout of
  prelog rings. Its maps and comparisons are natural in the whole pushout diagram.
- `gabberLogCotangent`: form the universal `B`-module for an `A`-derivation `d` and an
  additive monoid map `d log` vanishing on the image of `M`, subject to
  `dα(n) = α(n) d log n` and `d log(nn′) = d log n + d log n′`. Realize its free-resolution
  model after extension to the target ring. This defines `L_log` in `D(B)` for ordinary
  inputs, with the corresponding simplicial-module model for derived inputs.
- `logCotangentH0`, `logCotangentOrdinaryMap` and `logCotangentNaturality`: `H⁰ L_log` is
  the log differential module, the natural map `L_(B/A) → L_log` is an equivalence for
  identical monoids, and all these maps preserve the universal `d` and `d log`.
- `logCotangentFunctoriality`: composable prelog maps have the cotangent transitivity
  triangle, homotopy prelog pushouts give derived base change, and log cotangent complexes
  commute with filtered colimits. Passage from integral prelog monoids to their associated
  log structures preserves `L_log`. The ordinary-to-log maps give a morphism of transitivity
  triangles, including their connecting arrows, with the cochain signs of the period
  boundary formula below.

*Source:* [Bhatt12], Propositions 5.3, 5.5, 5.7, Remark 5.4, Definition 5.6, Definitions
6.1, 6.3, Proposition 6.5 and Remarks 6.4, 6.6, pp.23–25; proof of Corollary 7.5, p.28,
for integral logification; [Ols05],
§§8.4–8.5, Theorems 8.18 and 8.20, for transitivity and logification.
*Needs:* DerivedModuleAlgebra §§0.1–0.4, 0.8–0.10, 0.14; §§2.21–2.22;
Mathlib `SimplicialObject`, `MvPolynomial`, `KaehlerDifferential` and `DerivedCategory`.
The category of prelog rings, its free adjunction, log differential modules and the stated
resolution and cotangent laws are targets of this paragraph.

**Checks.**

- `test_shared_prelog_free`: no generators give `(A, M)`; one ordinary and one log generator
  give `(A[t, x], M ⊕ ℕ)`, with the monoid generator mapping to `x`.
- `test_shared_log_cotangent_free`: for `(A, 0) → (A[t, x], ℕ → x)`, `L_log` is free in
  degree zero on `dt` and `d log x`, and the ordinary-to-log map sends `dx` to `x d log x`.
- `test_shared_log_transitivity`: with trivial monoids the transitivity triangle and its
  boundary agree with DerivedModuleAlgebra §0.8; an identity relative map has zero cotangent.

**Shared logarithmic derived de Rham and Cartier theory.** On the same free prelog
resolutions, the exterior algebra of log differentials, with `d(d log n) = 0`, gives the
ordinary log de Rham complex. Realize it with direct sums along antidiagonals and the
shuffle product, with the strict alternation of §2.21 also in characteristic two. Its
coefficient ring is the base `A`; the differential generally fails target-ring linearity.
These constructions and laws have their single public owner here in `DerivedDeRham`.

- `logDerivedDeRham`, `logDeRhamDLog` and `logDeRhamOrdinaryMap`: the raw log derived
  de Rham object, its closed additive monoid map `d log : N → dR_log[1]`, and its canonical
  multiplicative ordinary-to-log map. On free resolutions the latter sends `db` to `db`.
  These maps commute with resolution comparisons and prelog functoriality.
- `logDeRhamHodgeGraded` and `logDeRhamStrict`: the decreasing multiplicative Hodge
  filtration has `gr_H^i ≃ L∧^i_B L_log[−i]`; for identical monoids the ordinary-to-log
  map identifies ordinary and log derived de Rham. Its graded map is the exterior power
  of `logCotangentOrdinaryMap`.
- `logDeRhamCompletions`: Hodge completion and derived p-completion are the separate
  functors of §§2.25–2.26, with their quotient towers, universal maps and induced `d log`.
- `logCartier`: truncation of free log de Rham complexes defines the natural increasing
  exhaustive conjugate filtration. In characteristic `p`, its weight `i` graded object
  is `L∧^i L_log((B, N)^(1)/(A, M))[−i]`, with the twist formed by homotopy pushout along
  ring Frobenius and multiplication by `p` on the base monoid. Keep the levelwise
  simplicial scalars when this twist is derived, as in §§3.3–3.5. On free coordinates
  inverse Cartier sends `dy` to `[y^(p−1) dy]` and `d log x` to `[d log x]`.
- `logificationBoundaries`: for integral prelog monoids over `ℤ/p^n`, `n ≥ 1`, passage
  to associated log structures preserves raw log derived de Rham and its Hodge and
  conjugate filtrations. Compare cotangent powers modulo `p`, then use finite p-dévissage.
  With compatible derived reductions the equivalences pass to derived p-completion.

The ordinary-to-log and functorial de Rham maps preserve products, Hodge filtrations and
conjugate filtrations on reductions, compatibly with `d log`. Applying the completion
functors preserves their commuting diagrams. The ordinary cotangent and de Rham comparison
maps are those induced on these same resolutions.

*Source:* [Bhatt12], Definitions 6.1, 6.8, Propositions 6.9, 6.11 and Remark 6.10,
pp.24–26; Example 6.15, Notation 7.1, Theorem 7.3, Proposition 7.4 and Corollary 7.5,
pp.27–28.
*Needs:* §6.20 (*Shared free-prelog and cotangent constructors*); §§1.14–1.17, 2.21–2.26,
3.2–3.5; DerivedModuleAlgebra §§0.14, 1.1–1.5; DGAInfinity Layer 1.

**Checks.**

- `test_shared_log_derham_identity`: an identity prelog map gives `A`, with zero positive
  Hodge pieces, and its ordinary-to-log map is the identity.
- `test_shared_log_cartier_two`: for `(F₂, 0) → (F₂[x], ℕ → x)`, `dx = x d log x`,
  `(d log x)² = 0` and inverse Cartier sends `d log x` to its cohomology class.
- `test_shared_logification_boundary`: the integral chart `ℕ → F_p[x]` and its logification
  have equivalent raw log derived de Rham. For trivial prelog structures on
  `ℚ → ℚ[x, x⁻¹]`, raw derived de Rham is `ℚ`, whereas logification has an additional
  degree-one conjugate class ([Bhatt12], Example 6.15); cotangent logification invariance
  does not extend the raw de Rham assertion to characteristic zero.

**Canonical period comparison data.** In precisely the period setup of §5.11, put
`can = (O_K̄ ∖ {0} → O_K̄)`, with trivial base prelog structure on `W`. Construct
`DerivedDeRham.periodLogComparisonData`, consisting of the following canonical maps and their
compatibilities, for every perfect residue field `k` and every prime `p`, including `p = 2`.
Its log cotangent and de Rham objects, on the period prelog rings, valuation charts and
compatible derived reductions, are the specializations of `gabberLogCotangent` and
`logDerivedDeRham` above. Its `d log` is `logDeRhamDLog`. Use the same public ordinary-to-log
maps, cotangent triangles, products, Hodge filtrations, conjugate filtrations on reductions
and completion functors. The period notation abbreviates these objects and maps.

- `periodLogSpecialization`: these identifications are definitional specializations of the
  public constructors and maps. The ordinary-to-log cotangent map, ordinary-to-log de Rham
  map and `d log` in the period data are respectively `logCotangentOrdinaryMap`,
  `logDeRhamOrdinaryMap` and `logDeRhamDLog` on the period inputs. The `ψ` of
  `periodLogDLogFirstGraded` is the boundary of the ordinary triangle for `W → A_inf → O_C`.
  Its map to the log transitivity triangle is `logCotangentFunctoriality`, with commuting
  connecting arrows through `logCotangentOrdinaryMap`. These identifications preserve
  products, Hodge filtrations, conjugate filtrations on derived reductions and p-completion,
  naturally for `G_K` and valued embeddings of all the period data.
- `periodLogCotangentComparison`: the map induced by adding `can` is an equivalence
  `Λ_p L_(O_K̄/W) → Λ_p L_log((O_K̄, can)/W)`. Prove it for this canonical map, not by choosing
  an abstract isomorphism. After logifying the trivial structure to the unit group, the
  quotient of the canonical monoid by units is its uniquely p-divisible rational valuation
  monoid. Prove the relative log cotangent vanishing modulo `p` for this group inclusion,
  using its free prelog resolution and p-divisibility as in [Bhatt12] Remark 9.12. Transitivity,
  finite p-dévissage and derived completion give the asserted map and its completed-ring version.
- `periodLogDeRhamComparison`: the canonical map
  `Λ_p dR_(O_K̄/W) → Λ_p dR_log((O_K̄, can)/W)` is an equivalence; compose its inverse with
  §5.12 to identify the log object with the actual `A_cris` carrier of §5.11. On derived
  reductions compare the exhaustive conjugate filtrations and their derived cotangent powers.
  Establish equivalence by the conjugate colimits, then finite p-dévissage and the p-limit.
  This avoids reconstruction from Hodge graded pieces without Hodge completeness. The
  Hodge filtrations correspond through the canonical map and §5.12's completed PD comparison.
- `periodLogDLogFirstGraded`: let `I = ker θ ⊆ A_inf`. Under the canonical transitivity
  isomorphism `ψ : I/I² ≃ Λ_p L_(O_K̄/W)[−1]` of [Bhatt12] Proposition 9.3(5), the class
  of `[ε] − 1` maps to `lim_n d log(ε_n)`. At level `p^n`, this is the connecting-map
  formula `ψ_n([ε] − 1) = ε_n⁻¹ dε_n` in `Ω¹_(O_K̄/W)[p^n]`; the inverse system uses
  multiplication by `p` on these torsion differentials. Prove that the first Hodge graded
  map of the completed log `d log` is this same class. Use the explicit transitivity
  boundary of Remark 9.4, including the identification of the completed cotangent complex
  with completed differentials in this ind-lci period setup, rather than a dimension argument.

All these maps commute with valued embeddings of the period data, `G_K`, the canonical
completion maps and products. They preserve the Hodge/PD filtrations and the conjugate
filtrations on reductions. Any rational-power chart used in a proof gives the same canonical
maps; chart changes do not change `ψ` or the resulting first graded map.

*Source:* [Bhatt12], Definition 5.6, Definitions 6.1, 6.3, 6.8, Proposition 6.9, Proposition 7.4
and Corollary 7.5, pp.23–29; Proposition 9.3(5), Remark 9.4, Proposition 9.11, Remark 9.12,
Proposition 9.13,
Construction 9.15 and Proposition 9.16, pp.34–38.
*Needs:* §§2.21–2.26, 3.2–3.5, 5.11–5.12; DerivedModuleAlgebra §§0.1, 0.3, 0.8–0.10,
0.14, 1.1–1.5; PerfectoidSpaces §§P1.17–P1.18; §PD.7; the shared logarithmic constructors
and laws of §6.20. De Rham logification is used only on the stated derived reductions and
after p-completion.

**Checks.**

- `test_period_log_qp`: for `K = ℚ_p`, take a generator `ε` of `Z_p(1)` with `ε_1` primitive.
  The actual boundary `ψ_n([ε] − 1) = ε_n⁻¹ dε_n` holds for all `n`, and its limit is nonzero.
  At `p = 2`, use the compatible system through primitive fourth roots and higher roots;
  the conclusion holds even when a differential at an early finite level is zero.
- `test_period_log_general_residue`: for any perfect `k`, including `k = F_p(u)ᵖᵉʳᶠ`, and
  finite `K/W(k)[1/p]`, the same canonical comparisons and a nontrivial root system give the
  same boundary formula. No finite-extension-of-`ℚ_p` hypothesis is introduced.
- `test_period_log_chart`: two choices of compatible rational powers of a uniformizer induce
  the same completed ordinary/log map and the same `ψ`; adding the identity root system
  gives the zero class, whereas a Tate generator has nonzero first graded class.

### 6.21 Logarithmic period d log and Fontaine's map

In the period setup (5.11), let `can` be the canonical prelog map `O_K̄ ∖ {0} → O_K̄`.
Assume its logarithmic cotangent and de Rham objects, their functorial completed `d log` map,
Hodge and conjugate filtrations, and the following comparison data: the canonical ordinary/log
cotangent map is a p-completed equivalence; the conjugate graded comparison is obtained from
its derived exterior powers and reconstructs the p-completed de Rham objects by convergent
dévissage; and the first Hodge graded `d log` class is the class of `[ε] − 1` in
`ker θ/(ker θ)²`. Require compatibility with the `G_K` action, products, completion and the
PD filtration on `A_cris`. These hypotheses are supplied by §6.20 on the period setup,
using its public `gabberLogCotangent`, `logDerivedDeRham` and `logDeRhamDLog` by
`periodLogSpecialization`.
Under these hypotheses,
`Λ_p L_(O_K̄/W) ≃ Λ_p L_log((O_K̄, can)/W)` and `Λ_p dR_log((O_K̄, can)/W) ≃ A_cris` ([Bhatt12] Proposition
9.11, proved by dévissage and the conjugate filtration from the cotangent statement). Completing
`d log : μ_(p^∞) → dR_log[1]` yields `β : Z_p(1) → Fil_H¹ A_cris`, `G_K`-equivariant by functoriality in
ring automorphisms ([Bhatt12] Construction 9.15). Then `β(ε) = log([ε])`: both maps land in `Fil_H¹`, their
first graded pieces agree as maps `Z_p(1) → gr_H¹ A_cris ≃ L̂_(O_K̄/W)[−1]` (the class of `[ε] − 1` in
`ker θ/(ker θ)²` corresponds to `lim_n d log(ε_n)` under the isomorphism of [Bhatt12] Proposition 9.3(5) and
Remark 9.4), so their difference is a `G_K`-equivariant map into `Fil² A_cris`, which vanishes by 5.15.

[Bhatt12], Propositions 9.11, 9.13, Construction 9.15, Proposition 9.16 and Remark 9.17, pp.35–38.

*Needs:* Layer 5: The period setup; Layer 5: The derived de Rham description of A_cris; Layer 5:
Hodge completion and B_dR⁺; Layer 5: Galois invariants of Tate twists; DerivedModuleAlgebra §1.3 The
derived completion reflector; §§PD.4–PD.7 here; the logarithmic objects, convergent comparison and
first graded `d log` data stated above as hypotheses; §6.20 for the canonical instantiation.

Lean: `DerivedDeRham.logPeriodDlog`.

Prove the following named laws.

- `logPeriodOrdinaryComparison`: the completed canonical log and ordinary period de Rham objects agree.
- `periodDLogTate`: `β : Z_p(1) → Fil_H¹ A_cris` is `G_K`-equivariant.
- `periodDLogFormula`: `β(ε) = log([ε])` in `A_cris`.
- `periodDLogFirstGraded`: the first Hodge graded map is the completed `d log` cotangent class.
- `periodDLogCanonical`: apply these conditional laws to `periodLogComparisonData` of §6.20.
  On the period specialization of the shared public `logDerivedDeRham`, the completed
  `logDeRhamDLog` equals Fontaine's map for every `K` in §5.11, with no logarithmic comparison
  hypotheses remaining. Its first graded map is the specific transitivity boundary
  `ψ_n([ε] − 1) = ε_n⁻¹ dε_n` of §6.20. Under
  `Crystalline.fontaineEnvelope_periodPDEnvelope` this is also PadicPeriodRings §3's logarithm.

**Checks.**

- `test_period_dlog_identity`: the identity compatible system maps to `log(1) = 0`.
- `test_period_dlog_roots`: `β(ε^a) = aβ(ε)` for `a ∈ ℤ_p`, and `G_K` acts through the cyclotomic character.
- `test_period_dlog_logarithm_domain`: an `A_inf` unit `[x]` with `θ([x]) = x^♯ ≠ 1` is not assigned this
  `Fil_H¹` logarithm by the construction.
- `test_period_dlog_canonical`: for a nontrivial Tate generator over `ℚ_p`, including `p = 2`,
  and over `W(k)[1/p]` for arbitrary perfect `k`, specializing the public `logDeRhamDLog`
  gives `β`, with the nonzero first graded class of §6.20 and value `log[ε]` in the
  identified ordinary carrier. This includes the combination `p = 2`, `k = F₂(u)ᵖᵉʳᶠ`;
  the boundary formula holds even when an early finite-level differential vanishes.

### Examples

The root-of-unity identity maps to `log(1) = 0`. Multiplication of compatible root systems
becomes addition of logarithms for the canonical period adapter of §6.20.

### Dependencies

Layers 1, PD and 5 and DerivedModuleAlgebra §1.3 supply completion, the filtered period object and
the Tate-invariant vanishing. Section 6.20 constructs the shared logarithmic inputs and their
canonical period specialization, and §6.21 applies its conditional identification to them.

## Downstream consumers

CrystallineCohomology consumes filtered completion (§§1.13–1.17, 1.22–1.23), ordinary and
formal de Rham (§§2.12, 2.21, 2.27), Cartier theory (§§3.4, 3.6–3.6.1), quasisyntomic descent
(§§5.1–5.8.1, 5.16–5.17), PD algebra (PD.1–PD.2, PD.4–PD.7) and the Teichmüller-quotient
calculation (§5.19). Its §§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.5, CR.DDR.5.8–CR.DDR.5.10,
CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 and CR.DDR.6.1–CR.DDR.6.20 construct the crystalline,
Witt and general logarithmic comparisons on these inputs. Its §§CR.DDR.5.8–CR.DDR.5.9 use
`rawLciDeRhamSheaves`, `rawLciDeRhamAffine`, `rawLciDeRhamRealization` and `rawLciDeRhamCup`
of §5.8.1 for the uncompleted lci comparison; `schemeDeRhamAffine` of §5.8 recovers the
completed object. Its §§CR.DDR.6.1–CR.DDR.6.2, CR.DDR.6.4–CR.DDR.6.5, CR.DDR.6.7 and
CR.DDR.6.9–CR.DDR.6.10 import §6.20's `freePrelogResolutions`, `prelogHomotopyPushout`,
`gabberLogCotangent`, `logCotangentFunctoriality`, `logDerivedDeRham`, `logDeRhamDLog`,
`logCartier`, `logificationBoundaries` and their named laws on the same public carriers.
Those sections add their derivation classifiers, general comparisons and descent results
to these constructors. The period specialization uses `periodLogSpecialization` and
`periodLogComparisonData`; it applies `periodDLogCanonical` to this public
`logDeRhamDLog`, including `p = 2` and arbitrary perfect residue field. The ordinary-to-log
maps, transitivity boundary `ψ`, products, Hodge filtrations, conjugate filtrations on
reductions, p-completion and Galois/valued-embedding functoriality are the shared maps and
laws of §6.20. All the shared constructors are built in this roadmap; the cited sections
of CrystallineCohomology consume them.
Prismatic and `A_inf`-cohomology,
p-adic Hodge theory and motivic and K-theoretic applications use cotangent powers,
quasisyntomic descent, period identifications and the differential-symbol API.

## References

References use the page numbering of the listed edition. [BMS19] pages are the published IHÉS pages;
[Avramov] and [Iyengar] use printed journal or chapter pages; [SAG] uses the page numbers of the
February 2018 version. Stacks chapter PDFs use chapter-local page numbers while statement numbers retain
their online chapter prefix; stable tags identify the statements in the living text.

The statements above incorporate the following source conventions. In [Bhatt12], Proposition 2.3, p.5,
the resolution is of `B`; Notation 3.1, p.6, twists `B` relative to `A`; Proposition 3.5, p.7, includes the
weight shift `[−i]`. Definition 7.20 and Theorem 7.22, p.31, are used with the regular-sequence strict
quotient and flatness hypotheses of CrystallineCohomology §CR.DDR.6.13. In Remark 6.6 and Proposition 6.12, pp.25–26, the derivation
section is over `B` and the second target factor is `B₂`. In Remark 8.7, p.32, nontorsion in the completed
torsion sum is detected by coordinates `p^⌊n/2⌋`. Example 3.21, p.11, is used in the form of 3.11 (a
nonzero `H^−2` of the cotangent complex and infinite Tor amplitude). For [BMS19], Definition 5.1, p.233, a
decreasing filtration has `gr^i = cofib(F^(i+1) → F^i)`. In Theorem 5.4 and Proposition 5.6, pp.234–238,
use the cohomological `Ext^(i+c)` formula of 1.20; the companion Ext display in the proof of Theorem 5.4,
p.236, has degree `a+i−j`. In Proposition 8.13(3), p.274, divided-Frobenius injectivity concerns the
Nygaard graded piece. In our cohomological convention, both de Rham graded formulas of [KY],
Construction 2.6, p.13, carry `[−i]`; the displayed formulas there suppress these shifts. Theorem
2.11, pp.14–15, uses the base-ring tensor for the full de Rham complex. In Lemma 2.14, pp.15–16, retain
the source and target assignments of the statement when using the proof.

The integral resolution, power and crystalline arguments respect the author corrections [IllusieI],
[IllusieII] and [BOErratum]. In particular an arbitrary quotient of differentials need not carry the
induced exterior differential without stability of its kernel, and a compatible inverse system of
complexes is represented by the degreewise-surjective model of DerivedModuleAlgebra §1.1, using the
result supplied by DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes* with
the induced module action.

- **AFH94**: Luchezar L. Avramov, Hans-Bjørn Foxby and Bernd Herzog, *Structure of local homomorphisms*.
  J. Algebra 164 (1994), 124–145.
- **Avramov**: Luchezar L. Avramov, *Locally complete intersection homomorphisms and a conjecture of
  Quillen on the vanishing of cotangent homology*. Ann. of Math. 150 (1999), 455–487; arXiv:math/9909192.
- **Bhatt12**: Bhargav Bhatt, *p-adic derived de Rham cohomology*. arXiv:1204.6560v1, 30 April 2012.
- **BhattDS**: Bhargav Bhatt, *On the direct summand conjecture and its derived variant*.
  arXiv:1608.08882v2.
- **BL22**: Bhargav Bhatt and Jacob Lurie, *Absolute prismatic cohomology*. arXiv:2201.06120v1.
- **BM**: Bhargav Bhatt and Akhil Mathew, *Syntomic complexes and p-adic étale Tate twists*.
  arXiv:2202.04818v2.
- **BMaEtAl**: Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and
  Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed
  characteristic*. arXiv:2012.15801v3.
- **BMS**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*. Publ. Math.
  IHÉS 128 (2018), 219–397.
- **BMS19**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and
  integral p-adic Hodge theory*. Publ. Math. IHÉS 129 (2019), 199–310.
- **BOErratum**: Pierre Berthelot and Arthur Ogus, *Erratum to Notes on crystalline cohomology*. Author
  erratum dated 21 August 2013.
- **CMM**: Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of
  henselian pairs*. arXiv:1803.10897v2.
- **DM**: Bjørn Ian Dundas and Matthew Morrow, *Finite generation and continuity of topological Hochschild
  and cyclic homology*. arXiv:1403.0534v1.
- **DoldPuppe**: Albrecht Dold and Dieter Puppe, *Homologie nicht-additiver Funktoren. Anwendungen*.
  Ann. Inst. Fourier 11 (1961), 201–312.
- **FGauges**: Bhargav Bhatt, *Prismatic F-gauges*. Lecture notes, MAT 549, Fall 2022.
- **Fon94**: Jean-Marc Fontaine, *Le corps des périodes p-adiques*. Astérisque 223 (1994), 59–111.
- **GP**: Owen Gwilliam and Dmitri Pavlov, *Enhancing the filtered derived category*. arXiv:1602.01515v3.
- **GR**: Ofer Gabber and Lorenzo Ramero, *Almost ring theory*. LNM 1800 (2003); arXiv:math/0201175v3.
- **IllusieCC**: Luc Illusie, *Complexe cotangent et déformations I*. LNM 239 (1971).
- **IllusieI**: Luc Illusie, *Errata: Complexe cotangent et déformations I*. Author erratum.
- **IllusieII**: Luc Illusie, *Errata: Complexe cotangent et déformations II*. Author erratum.
- **Iyengar**: Srikanth Iyengar, *André–Quillen homology of commutative algebras*. Contemporary
  Mathematics 436 (2007), 203–234.
- **KY**: Teruhisa Koshikawa and Zijian Yao, *Logarithmic prismatic cohomology II*. arXiv:2306.00364v1.
- **Ols05**: Martin C. Olsson, *The logarithmic cotangent complex*. Math. Ann. 333 (2005), 859–931.
- **Prisms**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4.
- **Riou**: Joël Riou, *feat(AlgebraicGeometry): the algebraic De Rham complex*. Mathlib proposal
  at commit 5888c0081ba867ede5c60d3060f2d674d932b53c, file
  `Mathlib/RingTheory/DeRham/Basic.lean`, lines 285–432.
- **SAG**: Jacob Lurie, *Spectral Algebraic Geometry*. Version of February 2018, §25.2.
- **StacksAlg**: The Stacks Project Authors, *Commutative Algebra* (Chapter 10).
- **StacksCoh**: The Stacks Project Authors, *Cohomology of Sheaves* (Chapter 20), §20.25 *Čech
  cohomology of complexes*.
- **StacksCt**: The Stacks Project Authors, *The Cotangent Complex* (Chapter 92).
- **StacksDefos**: The Stacks Project Authors, *Deformation Theory* (Chapter 91).
- **StacksDR**: The Stacks Project Authors, *The de Rham complex*, Section 10.132.
- **StacksExterior**: The Stacks Project Authors, *Kernel of the tensor-to-exterior map*, Lemma 10.13.4.
- **StacksLC**: The Stacks Project Authors, *Local Cohomology* (Chapter 51), Lemma 51.17.6 (Kunz).
- **StacksMA**: The Stacks Project Authors, *More on Algebra* (Chapter 15).
- **StacksPerfect**: The Stacks Project Authors, *Derived Categories of Schemes* (Chapter 36), §36.30.
- **StacksSimp**: The Stacks Project Authors, *Simplicial Methods* (Chapter 14).
- **StacksSites**: The Stacks Project Authors, *Cohomology on Sites* (Chapter 21), §21.33 *Cup product*.
- **StacksSmoothing**: The Stacks Project Authors, *Smoothing Ring Maps* (Chapter 16).
- **SW13**: Peter Scholze and Jared Weinstein, *Moduli of p-divisible groups*. Camb. J. Math. 1 (2013),
  145–237; arXiv:1211.6357v2.
- **Tat67**: John Tate, *p-divisible groups*. Proc. Conf. Local Fields (Driebergen, 1966), Springer
  (1967), 158–183.

[Bhatt12]: https://arxiv.org/pdf/1204.6560v1
[BMS19]: https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf
[BL22]: https://arxiv.org/pdf/2201.06120v1
[KY]: https://arxiv.org/pdf/2306.00364v1
[Prisms]: https://arxiv.org/pdf/1905.08229v4
[BM]: https://arxiv.org/pdf/2202.04818v2
[CMM]: https://arxiv.org/pdf/1803.10897v2
[DM]: https://arxiv.org/pdf/1403.0534v1
[Avramov]: https://arxiv.org/pdf/math/9909192
[Iyengar]: https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf
[BhattDS]: https://arxiv.org/pdf/1608.08882v2
[BMaEtAl]: https://arxiv.org/pdf/2012.15801v3
[GP]: https://arxiv.org/pdf/1602.01515v3
[FGauges]: https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf
[SAG]: https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf
[DoldPuppe]: http://www.numdam.org/item/AIF_1961__11__201_0/
[Tat67]: https://math.bu.edu/people/jsweinst/AWS/Files/TatePDivisibleGroups.pdf
[SW13]: https://arxiv.org/abs/1211.6357
[GR]: https://arxiv.org/abs/math/0201175
[AFH94]: https://doi.org/10.1016/0021-8693(94)90146-5
[Ols05]: https://doi.org/10.1007/s00208-005-0707-6
[Fon94]: http://www.numdam.org/issues/AST_1994__223__/
[IllusieCC]: https://doi.org/10.1007/BFb0059052
[IllusieI]: https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf
[IllusieII]: https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf
[BOErratum]: https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf
[Riou]: https://github.com/leanprover-community/mathlib4/blob/5888c0081ba867ede5c60d3060f2d674d932b53c/Mathlib/RingTheory/DeRham/Basic.lean
[StacksAlg]: https://stacks.math.columbia.edu/download/algebra.pdf
[StacksCoh]: https://stacks.math.columbia.edu/tag/01FP
[StacksCt]: https://stacks.math.columbia.edu/download/cotangent.pdf
[StacksDefos]: https://stacks.math.columbia.edu/download/defos.pdf
[StacksDR]: https://stacks.math.columbia.edu/tag/0FKF
[StacksExterior]: https://stacks.math.columbia.edu/tag/0H1C
[StacksLC]: https://stacks.math.columbia.edu/tag/0EC0
[StacksMA]: https://stacks.math.columbia.edu/download/more-algebra.pdf
[StacksPerfect]: https://stacks.math.columbia.edu/download/perfect.pdf
[StacksSimp]: https://stacks.math.columbia.edu/download/simplicial.pdf
[StacksSites]: https://stacks.math.columbia.edu/tag/0FPJ
[StacksSmoothing]: https://stacks.math.columbia.edu/tag/07GB
